package lsu
import include._
import lib._
import chisel3._
import chisel3.util._


import chisel3.experimental.chiselName
@chiselName
class  lsu_lsc_ctl extends Module with RequireAsyncReset with lib
{
  val io = IO(new Bundle{
    val lsu_c1_m_clk = Input(Clock())
    val lsu_c1_r_clk = Input(Clock())
    val lsu_c2_m_clk = Input(Clock())
    val lsu_c2_r_clk = Input(Clock())
    val lsu_store_c1_m_clk = Input(Clock())

    val lsu_ld_data_r = Input(UInt(32.W))                   //DCCM data
    val lsu_ld_data_corr_r = Input(UInt(32.W))         // ECC corrected data
    val lsu_single_ecc_error_r = Input(UInt(1.W))
    val lsu_double_ecc_error_r = Input(UInt(1.W))

    val lsu_ld_data_m = Input(UInt(32.W))
    val lsu_single_ecc_error_m = Input(UInt(1.W))
    val lsu_double_ecc_error_m = Input(UInt(1.W))

    val flush_m_up = Input(UInt(1.W))
    val flush_r    = Input(UInt(1.W))

    val lsu_exu = new lsu_exu()

    val lsu_p = Flipped(Valid(new lsu_pkt_t()))        // lsu control packet //coming from decode
    val dec_lsu_valid_raw_d = Input(UInt(1.W))   // Raw valid for address computation
    val dec_lsu_offset_d    = Input(UInt(12.W))

    val picm_mask_data_m = Input(UInt(32.W))
    val bus_read_data_m  = Input(UInt(32.W))  //coming from bus interface

    val lsu_result_m      = Output(UInt(32.W))
    val lsu_result_corr_r = Output(UInt(32.W))     // This is the ECC corrected data going to RF

    // lsu address down the pipe
    val lsu_addr_d = Output(UInt(32.W))
    val lsu_addr_m = Output(UInt(32.W))
    val lsu_addr_r = Output(UInt(32.W))

    // lsu address down the pipe - needed to check unaligned
    val end_addr_d = Output(UInt(32.W))
    val end_addr_m = Output(UInt(32.W))
    val end_addr_r = Output(UInt(32.W))

    // store data down the pipe
    val store_data_m    = Output(UInt(32.W))

    val dec_tlu_mrac_ff = Input(UInt(32.W)) // CSR read

    val lsu_exc_m         = Output(UInt(1.W))
    val is_sideeffects_m  = Output(UInt(1.W))
    val lsu_commit_r      = Output(UInt(1.W))
    val lsu_single_ecc_error_incr = Output(UInt(1.W))
    val lsu_error_pkt_r   = Valid(new lsu_error_pkt_t())

    val lsu_fir_addr      = Output(UInt(31.W)) //(31:1) in sv      // fast interrupt address TBD
    val lsu_fir_error     = Output(UInt(2.W))              // Error during fast interrupt lookup TBD

    // address in dccm/pic/external per pipe stage
    val addr_in_dccm_d    = Output(UInt(1.W))
    val addr_in_dccm_m    = Output(UInt(1.W))
    val addr_in_dccm_r    = Output(UInt(1.W))

    val addr_in_pic_d     = Output(UInt(1.W))
    val addr_in_pic_m     = Output(UInt(1.W))
    val addr_in_pic_r     = Output(UInt(1.W))

    val addr_external_m   = Output(UInt(1.W))

    // DMA slave
    val dma_lsc_ctl = new dma_lsc_ctl()

    // Store buffer related signals
    val lsu_pkt_d    = Valid(new lsu_pkt_t())
    val lsu_pkt_m    = Valid(new lsu_pkt_t())
    val lsu_pkt_r    = Valid(new lsu_pkt_t())

    val scan_mode    = Input(UInt(1.W))
  })


  val dma_pkt_d       = Wire(Valid(new lsu_pkt_t()))
  val lsu_pkt_m_in    = Wire(Valid(new lsu_pkt_t()))
  val lsu_pkt_r_in    = Wire(Valid(new lsu_pkt_t()))
  val lsu_error_pkt_m = Wire(Valid(new lsu_error_pkt_t()))

  val lsu_rs1_d       = Mux(io.dec_lsu_valid_raw_d.asBool,io.lsu_exu.exu_lsu_rs1_d,io.dma_lsc_ctl.dma_mem_addr)
  val lsu_offset_d    = io.dec_lsu_offset_d(11,0) & Fill(12,io.dec_lsu_valid_raw_d)
  val rs1_d_raw       = lsu_rs1_d
  val offset_d        = lsu_offset_d
  val rs1_d           = Mux(io.lsu_pkt_d.bits.load_ldst_bypass_d.asBool,io.lsu_result_m,rs1_d_raw)

  // generate the ls address
  val full_addr_d  = rvlsadder(rs1_d,offset_d)

  val addr_offset_d = ((Fill(3,io.lsu_pkt_d.bits.half))  & 1.U(3.W)) |
    ((Fill(3,io.lsu_pkt_d.bits.word))  & 3.U(3.W)) |
    ((Fill(3,io.lsu_pkt_d.bits.dword)) & 7.U(3.W))

  val end_addr_offset_d = Cat(offset_d(11),offset_d(11,0)) + Cat(Fill(9,0.U),addr_offset_d(2,0))
  val full_end_addr_d   = rs1_d(31,0) + Cat(Fill(19,end_addr_offset_d(12)),end_addr_offset_d(12,0))
  io.end_addr_d        := full_end_addr_d

  //optimize with bulk operator
  val addrcheck = Module(new lsu_addrcheck())

  addrcheck.io.lsu_c2_m_clk              := io.lsu_c2_m_clk
  //val rst_l = IO(Input(1.W)) //implicit
  addrcheck.io.start_addr_d              := full_addr_d
  addrcheck.io.end_addr_d                := full_end_addr_d
  addrcheck.io.lsu_pkt_d                 := io.lsu_pkt_d
  addrcheck.io.dec_tlu_mrac_ff           := io.dec_tlu_mrac_ff
  addrcheck.io.rs1_region_d              := rs1_d(31,28)
  addrcheck.io.rs1_d                     := rs1_d
  io.is_sideeffects_m                    := addrcheck.io.is_sideeffects_m
  io.addr_in_dccm_d                      := addrcheck.io.addr_in_dccm_d
  io.addr_in_pic_d                       := addrcheck.io.addr_in_pic_d
  val addr_external_d                     = addrcheck.io.addr_external_d
  val access_fault_d                      = addrcheck.io.access_fault_d
  val misaligned_fault_d                  = addrcheck.io.misaligned_fault_d
  val exc_mscause_d                       = addrcheck.io.exc_mscause_d
  val fir_dccm_access_error_d             = addrcheck.io.fir_dccm_access_error_d
  val fir_nondccm_access_error_d          = addrcheck.io.fir_nondccm_access_error_d
  addrcheck.io.scan_mode                 := io.scan_mode


  val exc_mscause_r                 = WireInit(0.U(4.W))
  val fir_dccm_access_error_r       = WireInit(0.U(1.W))
  val fir_nondccm_access_error_r    = WireInit(0.U(1.W))
  val access_fault_r                = WireInit(0.U(1.W))
  val misaligned_fault_r            = WireInit(0.U(1.W))
  val lsu_fir_error_m               = WireInit(0.U(2.W))
  val fir_dccm_access_error_m       = WireInit(0.U(1.W))
  val fir_nondccm_access_error_m    = WireInit(0.U(1.W))

  val access_fault_m                  = withClock(io.lsu_c1_m_clk){RegNext(access_fault_d,0.U)}
  val misaligned_fault_m              = withClock(io.lsu_c1_m_clk){RegNext(misaligned_fault_d,0.U)}
  val exc_mscause_m                   = withClock(io.lsu_c1_m_clk){RegNext(exc_mscause_d,0.U)}
  fir_dccm_access_error_m            := withClock(io.lsu_c1_m_clk){RegNext(fir_dccm_access_error_d,0.U)}
  fir_nondccm_access_error_m         := withClock(io.lsu_c1_m_clk){RegNext(fir_nondccm_access_error_d,0.U)}

  io.lsu_exc_m := access_fault_m | misaligned_fault_m
  io.lsu_single_ecc_error_incr := (io.lsu_single_ecc_error_r & !io.lsu_double_ecc_error_r) & (io.lsu_commit_r | io.lsu_pkt_r.bits.dma) & io.lsu_pkt_r.valid

  if (LOAD_TO_USE_PLUS1 == 1){
    // Generate exception packet
    io.lsu_error_pkt_r.valid := (access_fault_r | misaligned_fault_r | io.lsu_double_ecc_error_r) & io.lsu_pkt_r.valid & !io.lsu_pkt_r.bits.dma & !io.lsu_pkt_r.bits.fast_int  //TBD(lsu_pkt_r.fast_int)
    io.lsu_error_pkt_r.bits.single_ecc_error := io.lsu_single_ecc_error_r & !io.lsu_error_pkt_r.valid & !io.lsu_pkt_r.bits.dma
    io.lsu_error_pkt_r.bits.inst_type := io.lsu_pkt_r.bits.store
    io.lsu_error_pkt_r.bits.exc_type  := ~misaligned_fault_r
    io.lsu_error_pkt_r.bits.mscause   := Mux((io.lsu_double_ecc_error_r & !misaligned_fault_r & !access_fault_r).asBool,1.U(4.W), exc_mscause_r(3,0))
    io.lsu_error_pkt_r.bits.addr      := io.lsu_addr_r(31,0)//lsu_addr_d->lsu_full_addr
    io.lsu_fir_error             := Mux(fir_nondccm_access_error_r.asBool,3.U(2.W), Mux(fir_dccm_access_error_r.asBool,2.U(2.W), Mux((io.lsu_pkt_r.bits.fast_int & io.lsu_double_ecc_error_r).asBool,1.U(2.W),0.U(2.W))))

    access_fault_r               := withClock(io.lsu_c1_r_clk){RegNext(access_fault_m,0.U)}
    exc_mscause_r                := withClock(io.lsu_c1_r_clk){RegNext(exc_mscause_m,0.U)}
    fir_dccm_access_error_r      := withClock(io.lsu_c1_r_clk){RegNext(fir_dccm_access_error_m,0.U)}
    fir_nondccm_access_error_r   := withClock(io.lsu_c1_r_clk){RegNext(fir_nondccm_access_error_m,0.U)}
    misaligned_fault_r           := withClock(io.lsu_c1_r_clk){RegNext(misaligned_fault_m,0.U)}
  }

  else //L2U_Plus1_0
  {
    // Generate exception packet
    lsu_error_pkt_m.valid := (access_fault_m | misaligned_fault_m | io.lsu_double_ecc_error_m) & io.lsu_pkt_m.valid & !io.lsu_pkt_m.bits.dma & !io.lsu_pkt_m.bits.fast_int & !io.flush_m_up  //TBD(lsu_pkt_r.fast_int)
    lsu_error_pkt_m.bits.single_ecc_error := io.lsu_single_ecc_error_m  & !lsu_error_pkt_m.valid  & !io.lsu_pkt_m.bits.dma
    lsu_error_pkt_m.bits.inst_type        := io.lsu_pkt_m.bits.store
    lsu_error_pkt_m.bits.exc_type         := ~misaligned_fault_m
    lsu_error_pkt_m.bits.mscause          := Mux(((io.lsu_double_ecc_error_m & !misaligned_fault_m & !access_fault_m)===1.U),1.U(4.W), exc_mscause_m(3,0))
    lsu_error_pkt_m.bits.addr             := io.lsu_addr_m(31,0)//lsu_addr_d->lsu_full_addr
    lsu_fir_error_m                  := Mux(fir_nondccm_access_error_m.asBool,3.U(2.W), Mux(fir_dccm_access_error_m.asBool,2.U(2.W), Mux((io.lsu_pkt_m.bits.fast_int & io.lsu_double_ecc_error_m).asBool,1.U(2.W),0.U(2.W))))
    io.lsu_error_pkt_r               := withClock(io.lsu_c2_r_clk){RegNext(lsu_error_pkt_m,0.U.asTypeOf(lsu_error_pkt_m.cloneType))}
    io.lsu_fir_error                 := withClock(io.lsu_c2_r_clk){RegNext(lsu_fir_error_m,0.U)}
  }
  dma_pkt_d.bits.unsign   := 0.U
  dma_pkt_d.bits.fast_int := 0.U
  dma_pkt_d.valid    := io.dma_lsc_ctl.dma_dccm_req
  dma_pkt_d.bits.dma      := 1.U
  dma_pkt_d.bits.store    := io.dma_lsc_ctl.dma_mem_write
  dma_pkt_d.bits.load     := ~io.dma_lsc_ctl.dma_mem_write
  dma_pkt_d.bits.by       := (io.dma_lsc_ctl.dma_mem_sz(2,0) === 0.U(3.W))
  dma_pkt_d.bits.half     := (io.dma_lsc_ctl.dma_mem_sz(2,0) === 1.U(3.W))
  dma_pkt_d.bits.word     := (io.dma_lsc_ctl.dma_mem_sz(2,0) === 2.U(3.W))
  dma_pkt_d.bits.dword    := (io.dma_lsc_ctl.dma_mem_sz(2,0) === 3.U(3.W))
  dma_pkt_d.bits.store_data_bypass_d  := 0.U
  dma_pkt_d.bits.load_ldst_bypass_d   := 0.U
  dma_pkt_d.bits.store_data_bypass_m  := 0.U

  val lsu_ld_datafn_r      = WireInit(0.U(32.W))
  val lsu_ld_datafn_corr_r = WireInit(0.U(32.W))
  val lsu_ld_datafn_m      = WireInit(0.U(32.W))

  io.lsu_pkt_d     := Mux(io.dec_lsu_valid_raw_d.asBool,io.lsu_p,dma_pkt_d)
  lsu_pkt_m_in     := io.lsu_pkt_d
  lsu_pkt_r_in     := io.lsu_pkt_m

  io.lsu_pkt_d.valid   := (io.lsu_p.valid & !(io.flush_m_up &  !io.lsu_p.bits.fast_int)) | io.dma_lsc_ctl.dma_dccm_req
  lsu_pkt_m_in.valid   := io.lsu_pkt_d.valid  & !(io.flush_m_up &  !io.lsu_pkt_d.bits.dma)
  lsu_pkt_r_in.valid   := io.lsu_pkt_m.valid  & !(io.flush_m_up &  !io.lsu_pkt_m.bits.dma)

  io.lsu_pkt_m             := withClock(io.lsu_c1_m_clk){RegNext(lsu_pkt_m_in,0.U.asTypeOf(lsu_pkt_m_in.cloneType))}
  io.lsu_pkt_r             := withClock(io.lsu_c1_r_clk){RegNext(lsu_pkt_r_in,0.U.asTypeOf(lsu_pkt_r_in.cloneType))}
  io.lsu_pkt_m.valid       := withClock(io.lsu_c2_m_clk){RegNext(lsu_pkt_m_in.valid,0.U)}
  io.lsu_pkt_r.valid       := withClock(io.lsu_c2_r_clk){RegNext(lsu_pkt_r_in.valid,0.U)}

  val dma_mem_wdata_shifted = io.dma_lsc_ctl.dma_mem_wdata(63,0) >> Cat(io.dma_lsc_ctl.dma_mem_addr(2,0), 0.U(3.W))   // Shift the dma data to lower bits to make it consistent to lsu stores
  val store_data_d          = Mux(io.dma_lsc_ctl.dma_dccm_req.asBool,dma_mem_wdata_shifted(31,0),io.lsu_exu.exu_lsu_rs2_d(31,0))  // Write to PIC still happens in r stage
  val store_data_m_in       = Mux(io.lsu_pkt_d.bits.store_data_bypass_d.asBool,io.lsu_result_m(31,0),store_data_d(31,0))

  val store_data_pre_m      =  withClock(io.lsu_store_c1_m_clk){RegNext(store_data_m_in,0.U)}
  io.lsu_addr_m        :=  withClock(io.lsu_c1_m_clk){RegNext(io.lsu_addr_d,0.U)}
  io.lsu_addr_r        :=  withClock(io.lsu_c1_r_clk){RegNext(io.lsu_addr_m,0.U)}
  io.end_addr_m        :=  withClock(io.lsu_c1_m_clk){RegNext(io.end_addr_d,0.U)}
  io.end_addr_r        :=  withClock(io.lsu_c1_r_clk){RegNext(io.end_addr_m,0.U)}
  io.addr_in_dccm_m    :=  withClock(io.lsu_c1_m_clk){RegNext(io.addr_in_dccm_d,0.U)}
  io.addr_in_dccm_r    :=  withClock(io.lsu_c1_r_clk){RegNext(io.addr_in_dccm_m,0.U)}
  io.addr_in_pic_m     :=  withClock(io.lsu_c1_m_clk){RegNext(io.addr_in_pic_d,0.U)}
  io.addr_in_pic_r     :=  withClock(io.lsu_c1_r_clk){RegNext(io.addr_in_pic_m,0.U)}
  io.addr_external_m   :=  withClock(io.lsu_c1_m_clk){RegNext(addr_external_d,0.U)}
  val addr_external_r       =  withClock(io.lsu_c1_r_clk){RegNext(io.addr_external_m,0.U)}
  val bus_read_data_r       =  withClock(io.lsu_c1_r_clk){RegNext(io.bus_read_data_m,0.U)}
  // Fast interrupt address
  io.lsu_fir_addr          := io.lsu_ld_data_corr_r(31,1)   //original (31,1)  TBD
  // absence load/store all 0's
  io.lsu_addr_d            := full_addr_d
  // Interrupt as a flush source allows the WB to occur
  io.lsu_commit_r := io.lsu_pkt_r.valid & (io.lsu_pkt_r.bits.store | io.lsu_pkt_r.bits.load) & !io.flush_r & !io.lsu_pkt_r.bits.dma
  io.store_data_m           := (io.picm_mask_data_m(31,0) | Fill(32,!io.addr_in_pic_m)) & Mux(io.lsu_pkt_m.bits.store_data_bypass_m.asBool,io.lsu_result_m,store_data_pre_m)

  if (LOAD_TO_USE_PLUS1 == 1){
    //bus_read_data_r coming from bus interface, lsu_ld_data_r -> coming from dccm_ctl
    lsu_ld_datafn_r       := Mux(addr_external_r.asBool, bus_read_data_r,io.lsu_ld_data_r)
    lsu_ld_datafn_corr_r  := Mux(addr_external_r.asBool, bus_read_data_r,io.lsu_ld_data_corr_r)
    // this is really R stage but don't want to make all the changes to support M,R buses
    io.lsu_result_m       := ((Fill(32,io.lsu_pkt_r.bits.unsign  & io.lsu_pkt_r.bits.by))    & Cat(0.U(24.W),lsu_ld_datafn_r(7,0))) |
      ((Fill(32,io.lsu_pkt_r.bits.unsign  & io.lsu_pkt_r.bits.half))  & Cat(0.U(16.W),lsu_ld_datafn_r(15,0)))    |
      ((Fill(32,!io.lsu_pkt_r.bits.unsign & io.lsu_pkt_r.bits.by))    & Cat((Fill(24, lsu_ld_datafn_r(7)))  ,lsu_ld_datafn_r(7,0)))  |
      ((Fill(32,!io.lsu_pkt_r.bits.unsign & io.lsu_pkt_r.bits.half))  & Cat((Fill(16,lsu_ld_datafn_r(15)))  ,lsu_ld_datafn_r(15,0))) |
      ((Fill(32,io.lsu_pkt_r.bits.word))  & lsu_ld_datafn_r(31,0))
    // this signal is used for gpr update
    io.lsu_result_corr_r  := ((Fill(32,io.lsu_pkt_r.bits.unsign  & io.lsu_pkt_r.bits.by))    & Cat(0.U(24.W),lsu_ld_datafn_corr_r(7,0))) |
      ((Fill(32,io.lsu_pkt_r.bits.unsign  & io.lsu_pkt_r.bits.half))  & Cat(0.U(16.W),lsu_ld_datafn_corr_r(15,0)))    |
      ((Fill(32,!io.lsu_pkt_r.bits.unsign & io.lsu_pkt_r.bits.by))    & Cat((Fill(24, lsu_ld_datafn_corr_r(7)))  ,lsu_ld_datafn_corr_r(7,0)))  |
      ((Fill(32,!io.lsu_pkt_r.bits.unsign & io.lsu_pkt_r.bits.half))  & Cat((Fill(16,lsu_ld_datafn_corr_r(15)))  ,lsu_ld_datafn_corr_r(15,0))) |
      ((Fill(32,io.lsu_pkt_r.bits.word))  & lsu_ld_datafn_corr_r(31,0))
  }

  else  {
    lsu_ld_datafn_m       := Mux(io.addr_external_m.asBool, io.bus_read_data_m,io.lsu_ld_data_m)
    lsu_ld_datafn_corr_r  := Mux(addr_external_r===1.U, bus_read_data_r,io.lsu_ld_data_corr_r)
    io.lsu_result_m       := ((Fill(32,io.lsu_pkt_m.bits.unsign  & io.lsu_pkt_m.bits.by))    & Cat(0.U(24.W),lsu_ld_datafn_m(7,0))) |
      ((Fill(32,io.lsu_pkt_m.bits.unsign  & io.lsu_pkt_m.bits.half))  & Cat(0.U(16.W),lsu_ld_datafn_m(15,0)))    |
      ((Fill(32,!io.lsu_pkt_m.bits.unsign & io.lsu_pkt_m.bits.by))    & Cat((Fill(24, lsu_ld_datafn_m(7)))  ,lsu_ld_datafn_m(7,0)))  |
      ((Fill(32,!io.lsu_pkt_m.bits.unsign & io.lsu_pkt_m.bits.half))  & Cat((Fill(16,lsu_ld_datafn_m(15)))  ,lsu_ld_datafn_m(15,0))) |
      ((Fill(32,io.lsu_pkt_m.bits.word))  & lsu_ld_datafn_m(31,0))
    io.lsu_result_corr_r  := ((Fill(32,io.lsu_pkt_r.bits.unsign  & io.lsu_pkt_r.bits.by))    & Cat(0.U(24.W),lsu_ld_datafn_corr_r(7,0))) |
      ((Fill(32,io.lsu_pkt_r.bits.unsign  & io.lsu_pkt_r.bits.half))  & Cat(0.U(16.W),lsu_ld_datafn_corr_r(15,0)))    |
      ((Fill(32,!io.lsu_pkt_r.bits.unsign & io.lsu_pkt_r.bits.by))    & Cat((Fill(24, lsu_ld_datafn_corr_r(7)))  ,lsu_ld_datafn_corr_r(7,0)))  |
      ((Fill(32,!io.lsu_pkt_r.bits.unsign & io.lsu_pkt_r.bits.half))  & Cat((Fill(16,lsu_ld_datafn_corr_r(15)))  ,lsu_ld_datafn_corr_r(15,0))) |
      ((Fill(32,io.lsu_pkt_r.bits.word))  & lsu_ld_datafn_corr_r(31,0))
  }
}
