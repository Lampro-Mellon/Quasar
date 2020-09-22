package lsu

import include._
import lib._
import snapshot._

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.ChiselEnum
import chisel3.experimental.{withClock, withReset, withClockAndReset}
import chisel3.experimental.BundleLiterals._
import chisel3.tester._
import chisel3.tester.RawTester.test
import chisel3.util.HasBlackBoxResource

class el2_lsu_addrcheck extends Module with RequireAsyncReset
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

  val start_addr_in_dccm_d         = WireInit(0.U(1.W))
  val start_addr_in_dccm_region_d  = WireInit(0.U(1.W))
  val end_addr_in_dccm_d           = WireInit(0.U(1.W))
  val end_addr_in_dccm_region_d    = WireInit(0.U(1.W))

  //DCCM check
  // Start address check
  if(pt1.DCCM_ENABLE==1){  // Gen_dccm_enable
    val start_addr_dccm_rangecheck = Module(new rvrangecheck(pt1.DCCM_SADR,pt1.DCCM_SIZE))
    start_addr_dccm_rangecheck.io.addr  := io.start_addr_d
    start_addr_in_dccm_d                := start_addr_dccm_rangecheck.io.in_range
    start_addr_in_dccm_region_d         := start_addr_dccm_rangecheck.io.in_region

    // End address check
    val end_addr_dccm_rangecheck   = Module(new rvrangecheck(pt1.DCCM_SADR,pt1.DCCM_SIZE))
    end_addr_dccm_rangecheck.io.addr    := io.end_addr_d
    end_addr_in_dccm_d                  := end_addr_dccm_rangecheck.io.in_range
    end_addr_in_dccm_region_d           := end_addr_dccm_rangecheck.io.in_region
  }
  else{  //Gen_dccm_disable
    start_addr_in_dccm_d           := 0.U
    start_addr_in_dccm_region_d    := 0.U
    end_addr_in_dccm_d             := 0.U
    end_addr_in_dccm_region_d      := 0.U
  }

  val addr_in_iccm  = WireInit(0.U(1.W))
  if(pt1.ICCM_ENABLE == 1){  //check_iccm
    addr_in_iccm := (io.start_addr_d(31,28) === pt.ICCM_REGION)
  }
  else{
    addr_in_iccm := 1.U
  }


  //PIC memory check
  //start address check
  val start_addr_pic_rangecheck = Module(new rvrangecheck(pt1.PIC_BASE_ADDR,pt1.PIC_SIZE))
  start_addr_pic_rangecheck.io.addr := io.start_addr_d(31,0)
  val start_addr_in_pic_d            = start_addr_pic_rangecheck.io.in_range
  val start_addr_in_pic_region_d     = start_addr_pic_rangecheck.io.in_region

  //End address check
  val end_addr_pic_rangecheck = Module(new rvrangecheck(pt1.PIC_BASE_ADDR,pt1.PIC_SIZE))
  end_addr_pic_rangecheck.io.addr := io.end_addr_d(31,0)
  val end_addr_in_pic_d            = end_addr_pic_rangecheck.io.in_range
  val end_addr_in_pic_region_d     = end_addr_pic_rangecheck.io.in_region

  val start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_in_pic_region_d
  val base_reg_dccm_or_pic   = (io.rs1_region_d(3,0) === pt.DCCM_REGION) | (io.rs1_region_d(3,0) === pt.PIC_REGION) //base region
  io.addr_in_dccm_d            := (start_addr_in_dccm_d & end_addr_in_dccm_d)
  io.addr_in_pic_d             := (start_addr_in_pic_d & end_addr_in_pic_d)

  io.addr_external_d         := ~(start_addr_in_dccm_region_d | start_addr_in_pic_region_d); //if start address does not belong to dccm/pic
  val csr_idx                = Cat(io.start_addr_d(31,28),"b1".U)
  val is_sideeffects_d       = io.dec_tlu_mrac_ff(csr_idx) & ~(start_addr_in_dccm_region_d | start_addr_in_pic_region_d | addr_in_iccm) & io.lsu_pkt_d.valid & (io.lsu_pkt_d.store | io.lsu_pkt_d.load)  //every region has the 2 LSB indicating ( 1: sideeffects/no_side effects, and 0: cacheable ). Ignored in internal regions
  val is_aligned_d           = (io.lsu_pkt_d.word & (io.start_addr_d(1,0) === "b00".U)) | (io.lsu_pkt_d.half & (io.start_addr_d(0) === "b0".U)) | io.lsu_pkt_d.by


  val non_dccm_access_ok     = (~(Cat(pt.DATA_ACCESS_ENABLE0,pt.DATA_ACCESS_ENABLE1,pt.DATA_ACCESS_ENABLE2,pt.DATA_ACCESS_ENABLE3,
    pt.DATA_ACCESS_ENABLE4,pt.DATA_ACCESS_ENABLE5,pt.DATA_ACCESS_ENABLE6,pt.DATA_ACCESS_ENABLE7)).orR) |
    (((pt.DATA_ACCESS_ENABLE0 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK0)) === (pt.DATA_ACCESS_ADDR0 | pt.DATA_ACCESS_MASK0)) | //0111
      (pt.DATA_ACCESS_ENABLE1 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK1)) === (pt.DATA_ACCESS_ADDR1 | pt.DATA_ACCESS_MASK1)) | //1111
      (pt.DATA_ACCESS_ENABLE2 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK2)) === (pt.DATA_ACCESS_ADDR2 | pt.DATA_ACCESS_MASK2)) | //1011
      (pt.DATA_ACCESS_ENABLE3 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK3)) === (pt.DATA_ACCESS_ADDR3 | pt.DATA_ACCESS_MASK3)) | //1000
      (pt.DATA_ACCESS_ENABLE4 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK4)) === (pt.DATA_ACCESS_ADDR4 | pt.DATA_ACCESS_MASK4)) |
      (pt.DATA_ACCESS_ENABLE5 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK5)) === (pt.DATA_ACCESS_ADDR5 | pt.DATA_ACCESS_MASK5)) |
      (pt.DATA_ACCESS_ENABLE6 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK6)) === (pt.DATA_ACCESS_ADDR6 | pt.DATA_ACCESS_MASK6)) |
      (pt.DATA_ACCESS_ENABLE7 & ((io.start_addr_d(31,0) | pt.DATA_ACCESS_MASK7)) === (pt.DATA_ACCESS_ADDR7 | pt.DATA_ACCESS_MASK7)))
      &
      ((pt.DATA_ACCESS_ENABLE0 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK0)) === (pt.DATA_ACCESS_ADDR0 | pt.DATA_ACCESS_MASK0)) |
        (pt.DATA_ACCESS_ENABLE1 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK1)) === (pt.DATA_ACCESS_ADDR1 | pt.DATA_ACCESS_MASK1)) |
        (pt.DATA_ACCESS_ENABLE2 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK2)) === (pt.DATA_ACCESS_ADDR2 | pt.DATA_ACCESS_MASK2)) |
        (pt.DATA_ACCESS_ENABLE3 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK3)) === (pt.DATA_ACCESS_ADDR3 | pt.DATA_ACCESS_MASK3)) |
        (pt.DATA_ACCESS_ENABLE4 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK4)) === (pt.DATA_ACCESS_ADDR4 | pt.DATA_ACCESS_MASK4)) |
        (pt.DATA_ACCESS_ENABLE5 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK5)) === (pt.DATA_ACCESS_ADDR5 | pt.DATA_ACCESS_MASK5)) |
        (pt.DATA_ACCESS_ENABLE6 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK6)) === (pt.DATA_ACCESS_ADDR6 | pt.DATA_ACCESS_MASK6)) |
        (pt.DATA_ACCESS_ENABLE7 & ((io.end_addr_d(31,0)   | pt.DATA_ACCESS_MASK7)) === (pt.DATA_ACCESS_ADDR7 | pt.DATA_ACCESS_MASK7))))

  val regpred_access_fault_d  = (start_addr_dccm_or_pic ^ base_reg_dccm_or_pic)
  val picm_access_fault_d     = (io.addr_in_pic_d & ((io.start_addr_d(1,0) != 0.U(2.W)) | ~io.lsu_pkt_d.word))

  val unmapped_access_fault_d = WireInit(1.U(1.W))
  val mpu_access_fault_d      = WireInit(1.U(1.W))
  if(pt1.DCCM_REGION == pt1.PIC_REGION){
    unmapped_access_fault_d := ((start_addr_in_dccm_region_d & ~(start_addr_in_dccm_d | start_addr_in_pic_d))  |
      // 0. Addr in dccm/pic region but not in dccm/pic offset
      (end_addr_in_dccm_region_d & ~(end_addr_in_dccm_d | end_addr_in_pic_d))       |
      // 0. Addr in dccm/pic region but not in dccm/pic offset
      (start_addr_in_dccm_d & end_addr_in_pic_d)                                    |
      // 0. DCCM -> PIC cross when DCCM/PIC in same region
      (start_addr_in_pic_d  & end_addr_in_dccm_d))
    // 0. DCCM -> PIC cross when DCCM/PIC in same region
    mpu_access_fault_d      := (~start_addr_in_dccm_region_d & ~non_dccm_access_ok)
    // 3. Address is not in a populated non-dccm region
  }

  else{
    unmapped_access_fault_d := ((start_addr_in_dccm_region_d & ~start_addr_in_dccm_d) | (end_addr_in_dccm_region_d & ~end_addr_in_dccm_d)   |
      (start_addr_in_pic_region_d  & ~start_addr_in_pic_d)  | (end_addr_in_pic_region_d & ~end_addr_in_pic_d))
    mpu_access_fault_d      := (~start_addr_in_pic_region_d & ~start_addr_in_dccm_region_d & ~non_dccm_access_ok);
    // 3. Address is not in a populated non-dccm region
  }

  //check width of  access_fault_mscause_d
  io.access_fault_d := (unmapped_access_fault_d | mpu_access_fault_d | picm_access_fault_d | regpred_access_fault_d) & io.lsu_pkt_d.valid & ~io.lsu_pkt_d.dma
  val access_fault_mscause_d = Mux(unmapped_access_fault_d.asBool,2.U(4.W), Mux(mpu_access_fault_d.asBool,3.U(4.W), Mux(regpred_access_fault_d.asBool,5.U(4.W), Mux(picm_access_fault_d.asBool,6.U(4.W),0.U(4.W)))))
  val regcross_misaligned_fault_d = (io.start_addr_d(31,28) =/= io.end_addr_d(31,28))
  val sideeffect_misaligned_fault_d = (is_sideeffects_d & ~ is_aligned_d)
  io.misaligned_fault_d := (regcross_misaligned_fault_d | (sideeffect_misaligned_fault_d & io.addr_external_d)) & io.lsu_pkt_d.valid & ~io.lsu_pkt_d.dma
  val misaligned_fault_mscause_d = Mux(regcross_misaligned_fault_d,2.U(4.W),Mux(sideeffect_misaligned_fault_d.asBool,1.U(4.W),0.U(4.W)))
  io.exc_mscause_d  := Mux(io.misaligned_fault_d.asBool, misaligned_fault_mscause_d(3,0), access_fault_mscause_d(3,0))
  io.fir_dccm_access_error_d  := ((start_addr_in_dccm_region_d & ~start_addr_in_dccm_d)|(end_addr_in_dccm_region_d   & ~end_addr_in_dccm_d)) & io.lsu_pkt_d.valid & io.lsu_pkt_d.fast_int
  io.fir_nondccm_access_error_d := ~(start_addr_in_dccm_region_d & end_addr_in_dccm_region_d) & io.lsu_pkt_d.valid & io.lsu_pkt_d.fast_int

  withClock(io.lsu_c2_m_clk){io.is_sideeffects_m := RegNext(is_sideeffects_d,0.U)} //TBD for clock and reset
}
//println(chisel3.Driver.emitVerilog(new el2_lsu_addrcheck))

object main extends App{
  println("Generate Verilog")
  chisel3.Driver.execute(args, ()=> new el2_lsu_addrcheck)
}
