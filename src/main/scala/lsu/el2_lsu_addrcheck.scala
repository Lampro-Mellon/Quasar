package lsu

import include._
import lib._
import chisel3._
import chisel3.util._
import chisel3.experimental.chiselName

@chiselName
class el2_lsu_addrcheck extends Module with RequireAsyncReset with el2_lib
{val io = IO(new Bundle{
  val lsu_c2_m_clk        = Input(Clock())

  val start_addr_d        = Input(UInt(32.W))
  val end_addr_d          = Input(UInt(32.W))
  val lsu_pkt_d           = Input(new el2_lsu_pkt_t)
  val dec_tlu_mrac_ff     = Input(UInt(32.W))
  val rs1_region_d        = Input(UInt(4.W))
  val rs1_d               = Input(UInt(32.W))


  val is_sideeffects_m    = Output(UInt(1.W))
  val addr_in_dccm_d      = Output(UInt(1.W))
  val addr_in_pic_d       = Output(UInt(1.W))
  val addr_external_d     = Output(UInt(1.W))
  val access_fault_d      = Output(UInt(1.W))
  val misaligned_fault_d  = Output(UInt(1.W))
  val exc_mscause_d       = Output(UInt(4.W))
  val fir_dccm_access_error_d     = Output(UInt(1.W))
  val fir_nondccm_access_error_d  = Output(UInt(1.W))
  val scan_mode                   = Input(UInt(1.W))})

  //DCCM check
  // Start address check
  // Gen_dccm_enable
  val (start_addr_in_dccm_d,start_addr_in_dccm_region_d) = if(DCCM_ENABLE) rvrangecheck_ch(io.start_addr_d ,aslong(DCCM_SADR).U ,DCCM_SIZE) else (0.U,0.U)
  // End address check
  val (end_addr_in_dccm_d ,end_addr_in_dccm_region_d) = if(DCCM_ENABLE) rvrangecheck_ch(io.end_addr_d ,aslong(DCCM_SADR).U ,DCCM_SIZE) else (0.U,0.U)

  val addr_in_iccm  = WireInit(0.U(1.W))
  if(ICCM_ENABLE ){  //check_iccm
    addr_in_iccm := (io.start_addr_d(31,28) === ICCM_REGION.U)
  }
  else{
    addr_in_iccm := 1.U
  }

  //PIC memory check
  //start address check
  val (start_addr_in_pic_d,start_addr_in_pic_region_d) = rvrangecheck_ch(io.start_addr_d(31,0) ,aslong(PIC_BASE_ADDR).U ,PIC_SIZE)
  //End address check
  val (end_addr_in_pic_d,end_addr_in_pic_region_d) = rvrangecheck_ch(io.end_addr_d(31,0) ,aslong(PIC_BASE_ADDR).U ,PIC_SIZE)

  val start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_in_pic_region_d
  val base_reg_dccm_or_pic   = (io.rs1_region_d(3,0) === DCCM_REGION.U) | (io.rs1_region_d(3,0) === PIC_REGION.U) //base region
  io.addr_in_dccm_d            := (start_addr_in_dccm_d & end_addr_in_dccm_d)
  io.addr_in_pic_d             := (start_addr_in_pic_d & end_addr_in_pic_d)

  io.addr_external_d         := ~(start_addr_in_dccm_region_d | start_addr_in_pic_region_d); //if start address does not belong to dccm/pic
  val csr_idx                = Cat(io.start_addr_d(31,28),1.U)
  val is_sideeffects_d       = io.dec_tlu_mrac_ff(csr_idx) & !(start_addr_in_dccm_region_d | start_addr_in_pic_region_d | addr_in_iccm) & io.lsu_pkt_d.valid & (io.lsu_pkt_d.store | io.lsu_pkt_d.load)  //every region has the 2 LSB indicating ( 1: sideeffects/no_side effects, and 0: cacheable ). Ignored in internal regions
  val is_aligned_d           = (io.lsu_pkt_d.word & (io.start_addr_d(1,0) === 0.U)) | (io.lsu_pkt_d.half & (io.start_addr_d(0) === 0.U)) | io.lsu_pkt_d.by


  val non_dccm_access_ok     = (!(Cat(DATA_ACCESS_ENABLE0.B ,DATA_ACCESS_ENABLE1.B ,DATA_ACCESS_ENABLE2.B ,DATA_ACCESS_ENABLE3.B ,
    DATA_ACCESS_ENABLE4.B ,DATA_ACCESS_ENABLE5.B ,DATA_ACCESS_ENABLE6.B ,DATA_ACCESS_ENABLE7.B )).orR) |
    (((DATA_ACCESS_ENABLE0.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK0).U)) === (aslong(DATA_ACCESS_ADDR0).U | aslong(DATA_ACCESS_MASK0).U)) | //0111
      (DATA_ACCESS_ENABLE1.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK1).U)) === (aslong(DATA_ACCESS_ADDR1).U | aslong(DATA_ACCESS_MASK1).U)) | //1111
      (DATA_ACCESS_ENABLE2.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK2).U)) === (aslong(DATA_ACCESS_ADDR2).U | aslong(DATA_ACCESS_MASK2).U)) | //1011
      (DATA_ACCESS_ENABLE3.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK3).U)) === (aslong(DATA_ACCESS_ADDR3).U | aslong(DATA_ACCESS_MASK3).U)) | //1000
      (DATA_ACCESS_ENABLE4.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK4).U)) === (aslong(DATA_ACCESS_ADDR4).U | aslong(DATA_ACCESS_MASK4).U)) |
      (DATA_ACCESS_ENABLE5.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK5).U)) === (aslong(DATA_ACCESS_ADDR5).U | aslong(DATA_ACCESS_MASK5).U)) |
      (DATA_ACCESS_ENABLE6.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK6).U)) === (aslong(DATA_ACCESS_ADDR6).U | aslong(DATA_ACCESS_MASK6).U)) |
      (DATA_ACCESS_ENABLE7.B & ((io.start_addr_d(31,0) | aslong(DATA_ACCESS_MASK7).U)) === (aslong(DATA_ACCESS_ADDR7).U | aslong(DATA_ACCESS_MASK7).U)))
      &
      ((DATA_ACCESS_ENABLE0.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK0).U)) === (aslong(DATA_ACCESS_ADDR0).U | aslong(DATA_ACCESS_MASK0).U)) |
        (DATA_ACCESS_ENABLE1.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK1).U)) === (aslong(DATA_ACCESS_ADDR1).U | aslong(DATA_ACCESS_MASK1).U)) |
        (DATA_ACCESS_ENABLE2.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK2).U)) === (aslong(DATA_ACCESS_ADDR2).U | aslong(DATA_ACCESS_MASK2).U)) |
        (DATA_ACCESS_ENABLE3.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK3).U)) === (aslong(DATA_ACCESS_ADDR3).U | aslong(DATA_ACCESS_MASK3).U)) |
        (DATA_ACCESS_ENABLE4.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK4).U)) === (aslong(DATA_ACCESS_ADDR4).U | aslong(DATA_ACCESS_MASK4).U)) |
        (DATA_ACCESS_ENABLE5.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK5).U)) === (aslong(DATA_ACCESS_ADDR5).U | aslong(DATA_ACCESS_MASK5).U)) |
        (DATA_ACCESS_ENABLE6.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK6).U)) === (aslong(DATA_ACCESS_ADDR6).U | aslong(DATA_ACCESS_MASK6).U)) |
        (DATA_ACCESS_ENABLE7.B & ((io.end_addr_d(31,0)   | aslong(DATA_ACCESS_MASK7).U)) === (aslong(DATA_ACCESS_ADDR7).U | aslong(DATA_ACCESS_MASK7).U))))

  val regpred_access_fault_d  = (start_addr_dccm_or_pic ^ base_reg_dccm_or_pic)
  val picm_access_fault_d     = (io.addr_in_pic_d & ((io.start_addr_d(1,0) =/= 0.U(2.W)) | !io.lsu_pkt_d.word))

  val unmapped_access_fault_d = WireInit(1.U(1.W))
  val mpu_access_fault_d      = WireInit(1.U(1.W))
  if(DCCM_REGION == PIC_REGION){
    unmapped_access_fault_d := ((start_addr_in_dccm_region_d & !(start_addr_in_dccm_d | start_addr_in_pic_d))  |
      // 0. Addr in dccm/pic region but not in dccm/pic offset
      (end_addr_in_dccm_region_d & !(end_addr_in_dccm_d | end_addr_in_pic_d))       |
      // 0. Addr in dccm/pic region but not in dccm/pic offset
      (start_addr_in_dccm_d & end_addr_in_pic_d)                                    |
      // 0. DCCM -> PIC cross when DCCM/PIC in same region
      (start_addr_in_pic_d  & end_addr_in_dccm_d))
    // 0. DCCM -> PIC cross when DCCM/PIC in same region
    mpu_access_fault_d      := (!start_addr_in_dccm_region_d & !non_dccm_access_ok)
    // 3. Address is not in a populated non-dccm region
  }

  else{
    unmapped_access_fault_d := ((start_addr_in_dccm_region_d & !start_addr_in_dccm_d) | (end_addr_in_dccm_region_d & !end_addr_in_dccm_d)   |
      (start_addr_in_pic_region_d  & !start_addr_in_pic_d)  | (end_addr_in_pic_region_d & !end_addr_in_pic_d))
    mpu_access_fault_d      := (!start_addr_in_pic_region_d & !start_addr_in_dccm_region_d & !non_dccm_access_ok);
    // 3. Address is not in a populated non-dccm region
  }

  //check width of  access_fault_mscause_d
  io.access_fault_d := (unmapped_access_fault_d | mpu_access_fault_d | picm_access_fault_d | regpred_access_fault_d) & io.lsu_pkt_d.valid & !io.lsu_pkt_d.dma
  val access_fault_mscause_d = Mux(unmapped_access_fault_d.asBool,2.U(4.W), Mux(mpu_access_fault_d.asBool,3.U(4.W), Mux(regpred_access_fault_d.asBool,5.U(4.W), Mux(picm_access_fault_d.asBool,6.U(4.W),0.U(4.W)))))
  val regcross_misaligned_fault_d = (io.start_addr_d(31,28) =/= io.end_addr_d(31,28))
  val sideeffect_misaligned_fault_d = (is_sideeffects_d & !is_aligned_d)
  io.misaligned_fault_d := (regcross_misaligned_fault_d | (sideeffect_misaligned_fault_d & io.addr_external_d)) & io.lsu_pkt_d.valid & !io.lsu_pkt_d.dma
  val misaligned_fault_mscause_d = Mux(regcross_misaligned_fault_d,2.U(4.W),Mux(sideeffect_misaligned_fault_d.asBool,1.U(4.W),0.U(4.W)))
  io.exc_mscause_d  := Mux(io.misaligned_fault_d.asBool, misaligned_fault_mscause_d(3,0), access_fault_mscause_d(3,0))
  io.fir_dccm_access_error_d  := ((start_addr_in_dccm_region_d & !start_addr_in_dccm_d)|(end_addr_in_dccm_region_d   & !end_addr_in_dccm_d)) & io.lsu_pkt_d.valid & io.lsu_pkt_d.fast_int
  io.fir_nondccm_access_error_d := !(start_addr_in_dccm_region_d & end_addr_in_dccm_region_d) & io.lsu_pkt_d.valid & io.lsu_pkt_d.fast_int

  withClock(io.lsu_c2_m_clk){io.is_sideeffects_m := RegNext(is_sideeffects_d,0.U)} //TBD for clock and reset
}
object address_checker extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_lsu_addrcheck()))
}
