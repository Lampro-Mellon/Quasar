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

class  el2_lsu_lsc_ctl extends Module
{
   val io = IO(new Bundle{
      //val rst_l = IO(Input(1.W)) //implicit
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

      val exu_lsu_rs1_d = Input(UInt(32.W))         // address
      val exu_lsu_rs2_d = Input(UInt(32.W))         // store data

      val lsu_p = Input(new el2_lsu_pkt_t())        // lsu control packet //coming from decode
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
      val lsu_error_pkt_r   = Output(new el2_lsu_error_pkt_t())

      val lsu_fir_addr      = Output(UInt(32.W)) //(31:1) in sv      // fast interrupt address TBD
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
      val dma_dccm_req      = Input(UInt(1.W))
      val dma_mem_addr      = Input(UInt(32.W))
      val dma_mem_sz        = Input(UInt(3.W))
      val dma_mem_write     = Input(UInt(1.W))
      val dma_mem_wdata     = Input(UInt(64.W))

      // Store buffer related signals
      val lsu_pkt_d    = Output(new el2_lsu_pkt_t())
      val lsu_pkt_m    = Output(new el2_lsu_pkt_t())
      val lsu_pkt_r    = Output(new el2_lsu_pkt_t())

      val scan_mode    = Input(UInt(1.W))
   })


   val dma_pkt_d       = Wire(new el2_lsu_pkt_t())
   val lsu_pkt_m_in    = Wire(new el2_lsu_pkt_t())
   val lsu_pkt_r_in    = Wire(new el2_lsu_pkt_t())
   val lsu_error_pkt_m = Wire(new el2_lsu_error_pkt_t())

   val lsu_rs1_d       = Mux(io.dec_lsu_valid_raw_d.asBool,io.exu_lsu_rs1_d,io.dma_mem_addr)
   val lsu_offset_d    = io.dec_lsu_offset_d(11,0) & Fill(12,io.dec_lsu_valid_raw_d)

   val rs1_d_raw = lsu_rs1_d
   val offset_d  = lsu_offset_d

   val rs1_d = Mux(io.lsu_pkt_d.load_ldst_bypass_d.asBool,io.lsu_result_m,rs1_d_raw)


   // generate the ls address
   val lsadder = Module(new rvlsadder())
   lsadder.io.rs1         := rs1_d
   lsadder.io.offset      := offset_d
   val full_addr_d         =  lsadder.io.dout





   val addr_offset_d = ((Fill(3,io.lsu_pkt_d.half))  & "b001".U) |
     ((Fill(3,io.lsu_pkt_d.word))  & "b011".U) |
     ((Fill(3,io.lsu_pkt_d.dword)) & "b111".U)

   val end_addr_offset_d = Cat(offset_d(11),offset_d(11,0)) + Cat(Fill(9,"b0".U),addr_offset_d(2,0))
   val full_end_addr_d   = rs1_d(31,0) + Cat(Fill(19,end_addr_offset_d(12)),end_addr_offset_d(12,0))
   io.end_addr_d        := full_end_addr_d






   //optimize with bulk operator
   val addrcheck = Module(new el2_lsu_addrcheck())

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







   val access_fault_r                = WireInit(0.U(1.W))
   val misaligned_fault_r            = WireInit(0.U(1.W))
   val exc_mscause_r                 = WireInit(0.U(4.W))
   val fir_dccm_access_error_r       = WireInit(0.U(1.W))
   val fir_nondccm_access_error_r    = WireInit(0.U(1.W))

   //val access_fault_rff              = Module(new rvdff(1,0))
   val access_fault_mff              = Module(new rvdff(1,0))
   //val misaligned_fault_rff          = Module(new rvdff(1,0))
   val misaligned_fault_mff          = Module(new rvdff(1,0))
   // val exc_mscause_rff               = Module(new rvdff(4,0))
   val exc_mscause_mff               = Module(new rvdff(4,0))
   // val fir_dccm_access_error_mff     = Module(new rvdff(1,0))
   //  val fir_nondccm_access_error_mff  = Module(new rvdff(1,0))
   //val lsu_error_pkt_rff             = Module(new rvdff(6,0))
   val lsu_fir_error_rff             = Module(new rvdff(2,0))

   val lsu_fir_error_m               = WireInit(0.U(2.W))
   val access_fault_m                = WireInit(0.U(1.W))
   val misaligned_fault_m            = WireInit(0.U(1.W))
   val exc_mscause_m                 = WireInit(0.U(4.W))
   val fir_dccm_access_error_m       = WireInit(0.U(1.W))
   val fir_nondccm_access_error_m    = WireInit(0.U(1.W))



   io.lsu_exc_m := access_fault_m | misaligned_fault_m
   io.lsu_single_ecc_error_incr := (io.lsu_single_ecc_error_r & ~io.lsu_double_ecc_error_r) & (io.lsu_commit_r | io.lsu_pkt_r.dma) & io.lsu_pkt_r.valid



   if (pt1.LOAD_TO_USE_PLUS1 == 1){
      // Generate exception packet
      io.lsu_error_pkt_r.exc_valid := (access_fault_r | misaligned_fault_r | io.lsu_double_ecc_error_r) & io.lsu_pkt_r.valid & ~io.lsu_pkt_r.dma & ~io.lsu_pkt_r.fast_int  //TBD(lsu_pkt_r.fast_int)
      io.lsu_error_pkt_r.single_ecc_error := io.lsu_single_ecc_error_r & ~io.lsu_error_pkt_r.exc_valid & ~io.lsu_pkt_r.dma
      io.lsu_error_pkt_r.inst_type := io.lsu_pkt_r.store
      io.lsu_error_pkt_r.exc_type  := ~misaligned_fault_r
      io.lsu_error_pkt_r.mscause   := Mux((io.lsu_double_ecc_error_r & ~misaligned_fault_r & ~access_fault_r).asBool,"b0001".U, exc_mscause_r(3,0))
      io.lsu_error_pkt_r.addr      := io.lsu_addr_r(31,0)//lsu_addr_d->lsu_full_addr
      io.lsu_fir_error             := Mux(fir_nondccm_access_error_r.asBool,"b11".U(2.W), Mux(fir_dccm_access_error_r.asBool,"b10".U(2.W), Mux((io.lsu_pkt_r.fast_int & io.lsu_double_ecc_error_r).asBool,"b01".U(2.W),"b00".U(2.W))))

      //Access fault: Address checker module , etc

      // access_fault_rff.io.din       := access_fault_m
      // access_fault_r                := access_fault_rff.io.dout
      access_fault_r                :=  RegNext(access_fault_m)

      misaligned_fault_r              :=  RegNext(misaligned_fault_m)

      // exc_mscause_rff.io.din          := exc_mscause_m
      // exc_mscause_r                   := exc_mscause_rff.io.dout
      exc_mscause_r                 := RegNext(exc_mscause_m)

      // fir_dccm_access_error_mff.io.din := fir_dccm_access_error_m
      // fir_dccm_access_error_r          := fir_dccm_access_error_mff.io.dout
      fir_dccm_access_error_r              := RegNext(fir_dccm_access_error_m)

      //  fir_nondccm_access_error_mff.io.din  := fir_nondccm_access_error_m
      //  fir_nondccm_access_error_r           := fir_nondccm_access_error_mff.io.dout
      fir_nondccm_access_error_r             := RegNext(fir_nondccm_access_error_m)

      // lsu_error_pkt_rff.io.din := 0.U
   }

   else //L2U_Plus1_0
   {
      io.lsu_fir_error  := 0.U
      // Generate exception packet
      lsu_error_pkt_m.exc_valid := (access_fault_m | misaligned_fault_m | io.lsu_double_ecc_error_m) & io.lsu_pkt_m.valid & ~io.lsu_pkt_m.dma & ~io.lsu_pkt_m.fast_int & ~io.flush_m_up  //TBD(lsu_pkt_r.fast_int)
      lsu_error_pkt_m.single_ecc_error := io.lsu_single_ecc_error_m  & ~lsu_error_pkt_m.exc_valid  & ~io.lsu_pkt_m.dma
      lsu_error_pkt_m.inst_type        := io.lsu_pkt_m.store
      lsu_error_pkt_m.exc_type         := ~misaligned_fault_m
      lsu_error_pkt_m.mscause          := Mux((io.lsu_double_ecc_error_m & ~misaligned_fault_m & ~access_fault_m).asBool,"b0001".U, exc_mscause_m(3,0))
      lsu_error_pkt_m.addr             := io.lsu_addr_m(31,0)//lsu_addr_d->lsu_full_addr
      lsu_fir_error_m                  := Mux(fir_nondccm_access_error_m.asBool,"b11".U, Mux(fir_dccm_access_error_m.asBool,"b10".U, Mux((io.lsu_pkt_m.fast_int & io.lsu_double_ecc_error_m).asBool,"b01".U,"b00".U)))


      // lsu_error_pkt_rff.io.din            := lsu_error_pkt_m
      // io.lsu_error_pkt_r                  := lsu_error_pkt_rff.io.dout
      io.lsu_error_pkt_r := RegNext(lsu_error_pkt_m)

      lsu_fir_error_rff.io.din            := lsu_fir_error_m
      lsu_fir_error_m                     := lsu_fir_error_rff.io.dout

      access_fault_mff.io.din            := access_fault_d
      access_fault_m                     := access_fault_mff.io.dout

      misaligned_fault_mff.io.din        := misaligned_fault_d
      misaligned_fault_m                 := misaligned_fault_mff.io.dout

      exc_mscause_mff.io.din             := exc_mscause_d
      exc_mscause_m                      := exc_mscause_mff.io.dout

      // fir_dccm_access_error_mff.io.din      := fir_dccm_access_error_d
      // fir_dccm_access_error_m               := fir_dccm_access_error_mff.io.dout
      fir_dccm_access_error_m              := RegNext(fir_dccm_access_error_d)
      // fir_nondccm_access_error_mff.io.din   := fir_nondccm_access_error_d
      // fir_nondccm_access_error_m            := fir_nondccm_access_error_mff.io.dout
      fir_nondccm_access_error_m             := RegNext(fir_nondccm_access_error_d)
   }

   dma_pkt_d.unsign   := 0.U
   dma_pkt_d.fast_int := 0.U
   dma_pkt_d.valid    := io.dma_dccm_req
   dma_pkt_d.dma      := 1.U
   dma_pkt_d.store    := io.dma_mem_write
   dma_pkt_d.load     := ~io.dma_mem_write
   dma_pkt_d.by       := (io.dma_mem_sz(2,0) === "b000".U)
   dma_pkt_d.half     := (io.dma_mem_sz(2,0) === "b001".U)
   dma_pkt_d.word     := (io.dma_mem_sz(2,0) === "b010".U)
   dma_pkt_d.dword    := (io.dma_mem_sz(2,0) === "b011".U)
   dma_pkt_d.store_data_bypass_d  := 0.U
   dma_pkt_d.load_ldst_bypass_d   := 0.U
   dma_pkt_d.store_data_bypass_m  := 0.U


   val lsu_pkt_vldmff       = Module(new rvdff(1,0))
   val lsu_pkt_vldrff       = Module(new rvdff(1,0))

   val lsu_ld_datafn_r      = WireInit(0.U(32.W))
   val lsu_ld_datafn_corr_r = WireInit(0.U(32.W))
   val lsu_ld_datafn_m      = WireInit(0.U(32.W))

   io.lsu_pkt_d     := Mux(io.dec_lsu_valid_raw_d.asBool,io.lsu_p,dma_pkt_d)
   lsu_pkt_m_in     := io.lsu_pkt_d
   lsu_pkt_r_in     := io.lsu_pkt_m

   io.lsu_pkt_d.valid   := (io.lsu_p.valid & ~(io.flush_m_up &  ~io.lsu_p.fast_int)) | io.dma_dccm_req
   lsu_pkt_m_in.valid   := io.lsu_pkt_d.valid  & ~(io.flush_m_up &  ~io.lsu_pkt_d.dma)
   lsu_pkt_r_in.valid   := io.lsu_pkt_m.valid  & ~(io.flush_m_up &  ~io.lsu_pkt_m.dma)



   lsu_pkt_vldmff.io.din          := lsu_pkt_m_in.valid
   io.lsu_pkt_m.valid             := lsu_pkt_vldmff.io.dout


   lsu_pkt_vldrff.io.din         := lsu_pkt_r_in.valid
   io.lsu_pkt_r.valid            := lsu_pkt_vldrff.io.dout

   //val lsu_pkt_mff                 = Module(new rvdff(12,0)) //recheck
   //lsu_pkt_mff.io.din             := lsu_pkt_m_in
   //io.lsu_pkt_m                   <> lsu_pkt_mff.io.dout  //recheck
   io.lsu_pkt_m := RegNext(lsu_pkt_m_in)

   //val lsu_pkt_rff                 = Module(new rvdff(12,0)) //recheck
   //lsu_pkt_rff.io.din             := lsu_pkt_r_in
   //io.lsu_pkt_r                   <> lsu_pkt_rff.io.dout  //recheck
   io.lsu_pkt_r := RegNext(lsu_pkt_r_in)















   val dma_mem_wdata_shifted = io.dma_mem_wdata(63,0) >> Cat(io.dma_mem_addr(2,0), "b000".U)   // Shift the dma data to lower bits to make it consistent to lsu stores

   val store_data_d          = Mux(io.dma_dccm_req.asBool,dma_mem_wdata_shifted(31,0),io.exu_lsu_rs2_d(31,0))  // Write to PIC still happens in r stage

   val store_data_m_in       = Mux(io.lsu_pkt_d.store_data_bypass_d.asBool,io.lsu_result_m(31,0),store_data_d(31,0))


   val sdmff= Module(new rvdff(32,0))
   sdmff.io.din            := store_data_m_in
   val store_data_pre_m     =  sdmff.io.dout

   val samff= Module(new rvdff(32,0))
   samff.io.din        := io.lsu_addr_d
   io.lsu_addr_m          :=  samff.io.dout

   val sarff= Module(new rvdff(32,0))
   sarff.io.din        := io.lsu_addr_m
   io.lsu_addr_r       := sarff.io.dout

   val end_addr_mff = Module(new rvdff(32,0))
   end_addr_mff.io.din    := io.end_addr_d
   io.end_addr_m          := end_addr_mff.io.dout

   val end_addr_rff = Module(new rvdff(32,0))
   end_addr_rff.io.din    := io.end_addr_m
   io.end_addr_r          := end_addr_rff.io.dout

   val addr_in_dccm_mff     = Module(new rvdff(1,0))
   addr_in_dccm_mff.io.din := io.addr_in_dccm_d
   io.addr_in_dccm_m       := addr_in_dccm_mff.io.dout

   val addr_in_dccm_rff      = Module(new rvdff(1,0))
   addr_in_dccm_rff.io.din  := io.addr_in_dccm_m
   io.addr_in_dccm_r        := addr_in_dccm_rff.io.dout

   val addr_in_pic_mff       = Module(new rvdff(1,0))
   addr_in_pic_mff.io.din  := io.addr_in_pic_d
   io.addr_in_pic_m        := addr_in_pic_mff.io.dout

   val addr_in_pic_rff       = Module(new rvdff(1,0))
   addr_in_pic_rff.io.din  := io.addr_in_pic_m
   io.addr_in_pic_r        := addr_in_pic_rff.io.dout

   val addr_external_mff     = Module(new rvdff(1,0))
   addr_external_mff.io.din := addr_external_d
   io.addr_external_m       := addr_external_mff.io.dout

   val addr_external_rff     = Module(new rvdff(1,0))
   addr_external_rff.io.din := io.addr_external_m
   val addr_external_r       = addr_external_rff.io.dout

   val bus_read_data_r_ff     = Module(new rvdff(32,0))
   bus_read_data_r_ff.io.din := io.bus_read_data_m
   val bus_read_data_r        = bus_read_data_r_ff.io.dout



   // Fast interrupt address
   io.lsu_fir_addr          := io.lsu_ld_data_corr_r(31,0)   //original (31,1)  TBD

   // absence load/store all 0's
   io.lsu_addr_d            := full_addr_d

   // Interrupt as a flush source allows the WB to occur

   io.lsu_commit_r := io.lsu_pkt_r.valid & (io.lsu_pkt_r.store | io.lsu_pkt_r.load) & ~io.flush_r & ~io.lsu_pkt_r.dma


   io.store_data_m           := (io.picm_mask_data_m(31,0) | Fill(32,~io.addr_in_pic_m)) & Mux(io.lsu_pkt_m.store_data_bypass_m.asBool,io.lsu_result_m,store_data_pre_m)







   if (pt1.LOAD_TO_USE_PLUS1 == 1){

      //bus_read_data_r coming from bus interface, lsu_ld_data_r -> coming from dccm_ctl
      lsu_ld_datafn_r       := Mux(addr_external_r.asBool, bus_read_data_r,io.lsu_ld_data_r)
      lsu_ld_datafn_corr_r  := Mux(addr_external_r.asBool, bus_read_data_r,io.lsu_ld_data_corr_r)

      // this is really R stage but don't want to make all the changes to support M,R buses
      io.lsu_result_m       := ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.by))    & Cat("h000000".U,lsu_ld_datafn_r(7,0))) |
        ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.half))  & Cat("h0000".U,lsu_ld_datafn_r(15,0)))    |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.by))    & Cat((Fill(24, lsu_ld_datafn_r(7)))  ,lsu_ld_datafn_r(7,0)))  |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.half))  & Cat((Fill(16,lsu_ld_datafn_r(15)))  ,lsu_ld_datafn_r(15,0))) |
        ((Fill(32,io.lsu_pkt_r.word))  & lsu_ld_datafn_r(31,0))

      // this signal is used for gpr update
      io.lsu_result_corr_r  := ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.by))    & Cat("h000000".U,lsu_ld_datafn_corr_r(7,0))) |
        ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.half))  & Cat("h0000".U,lsu_ld_datafn_corr_r(15,0)))    |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.by))    & Cat((Fill(24, lsu_ld_datafn_corr_r(7)))  ,lsu_ld_datafn_corr_r(7,0)))  |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.half))  & Cat((Fill(16,lsu_ld_datafn_corr_r(15)))  ,lsu_ld_datafn_corr_r(15,0))) |
        ((Fill(32,io.lsu_pkt_r.word))  & lsu_ld_datafn_corr_r(31,0))
   }

   else  {

      lsu_ld_datafn_m       := Mux(io.addr_external_m.asBool, io.bus_read_data_m,io.lsu_ld_data_m)
      lsu_ld_datafn_corr_r  := Mux(addr_external_r.asBool, bus_read_data_r,io.lsu_ld_data_corr_r)


      io.lsu_result_m       := ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.by))    & Cat("h000000".U,lsu_ld_datafn_m(7,0))) |
        ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.half))  & Cat("h0000".U,lsu_ld_datafn_m(15,0)))    |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.by))    & Cat((Fill(24, lsu_ld_datafn_m(7)))  ,lsu_ld_datafn_m(7,0)))  |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.half))  & Cat((Fill(16,lsu_ld_datafn_m(15)))  ,lsu_ld_datafn_m(15,0))) |
        ((Fill(32,io.lsu_pkt_r.word))  & lsu_ld_datafn_m(31,0))


      io.lsu_result_corr_r  := ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.by))    & Cat("h000000".U,lsu_ld_datafn_corr_r(7,0))) |
        ((Fill(32,io.lsu_pkt_r.unsign  & io.lsu_pkt_r.half))  & Cat("h0000".U,lsu_ld_datafn_corr_r(15,0)))    |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.by))    & Cat((Fill(24, lsu_ld_datafn_corr_r(7)))  ,lsu_ld_datafn_corr_r(7,0)))  |
        ((Fill(32,~io.lsu_pkt_r.unsign & io.lsu_pkt_r.half))  & Cat((Fill(16,lsu_ld_datafn_corr_r(15)))  ,lsu_ld_datafn_corr_r(15,0))) |
        ((Fill(32,io.lsu_pkt_r.word))  & lsu_ld_datafn_corr_r(31,0))
   }


   /*
      io.lsu_result_m         :=0.U
      io.lsu_result_corr_r    :=0.U

      io.lsu_addr_d    :=0.U
      io.lsu_addr_m    :=0.U
      io.lsu_addr_r    :=0.U
      io.end_addr_d    :=0.U
      io.end_addr_m    :=0.U
      io.end_addr_r    :=0.U

      io.store_data_m    := 0.U
      io.dec_tlu_mrac_ff := 0.U

      io.lsu_exc_m                  :=0.U
     // io.is_sideeffects_m           :=0.U
      io.lsu_commit_r               :=0.U
      io.lsu_single_ecc_error_incr  :=0.U

      io.lsu_error_pkt_r.exc_valid           :=0.U
      io.lsu_error_pkt_r.single_ecc_error    :=0.U
      io.lsu_error_pkt_r.inst_type           :=0.U    //0: Load, 1: Store
      io.lsu_error_pkt_r.exc_type            :=0.U    //0: MisAligned, 1: Access Fault
      io.lsu_error_pkt_r.mscause             :=0.U
      io.lsu_error_pkt_r.addr                :=0.U


      io.lsu_fir_addr     :=0.U
      io.lsu_fir_error    :=0.U
    //  io.addr_in_dccm_d   :=0.U
      io.addr_in_dccm_m   :=0.U
      io.addr_in_dccm_r   :=0.U
    //  io.addr_in_pic_d    :=0.U
      io.addr_in_pic_m    :=0.U
      io.addr_in_pic_r    :=0.U
      io.addr_external_m  :=0.U


      io.lsu_pkt_d.fast_int   :=0.U
      io.lsu_pkt_d.by         :=0.U
      io.lsu_pkt_d.half       :=0.U
      io.lsu_pkt_d.word       :=0.U
      io.lsu_pkt_d.dword      :=0.U
      io.lsu_pkt_d.load       :=0.U
      io.lsu_pkt_d.store      :=0.U
      io.lsu_pkt_d.unsign     :=0.U
      io.lsu_pkt_d.dma        :=0.U
      io.lsu_pkt_d.store_data_bypass_d :=0.U
      io.lsu_pkt_d.load_ldst_bypass_d  :=0.U
      io.lsu_pkt_d.store_data_bypass_m :=0.U
      io.lsu_pkt_d.valid               :=0.U

      io.lsu_pkt_m.fast_int   :=0.U
      io.lsu_pkt_m.by         :=0.U
      io.lsu_pkt_m.half       :=0.U
      io.lsu_pkt_m.word       :=0.U
      io.lsu_pkt_m.dword      :=0.U
      io.lsu_pkt_m.load       :=0.U
      io.lsu_pkt_m.store      :=0.U
      io.lsu_pkt_m.unsign     :=0.U
      io.lsu_pkt_m.dma        :=0.U
      io.lsu_pkt_m.store_data_bypass_d :=0.U
      io.lsu_pkt_m.load_ldst_bypass_d  :=0.U
      io.lsu_pkt_m.store_data_bypass_m :=0.U
      io.lsu_pkt_m.valid               :=0.U

      io.lsu_pkt_r.fast_int   :=0.U
      io.lsu_pkt_r.by         :=0.U
      io.lsu_pkt_r.half       :=0.U
      io.lsu_pkt_r.word       :=0.U
      io.lsu_pkt_r.dword      :=0.U
      io.lsu_pkt_r.load       :=0.U
      io.lsu_pkt_r.store      :=0.U
      io.lsu_pkt_r.unsign     :=0.U
      io.lsu_pkt_r.dma        :=0.U
      io.lsu_pkt_r.store_data_bypass_d :=0.U
      io.lsu_pkt_r.load_ldst_bypass_d  :=0.U
      io.lsu_pkt_r.store_data_bypass_m :=0.U
      io.lsu_pkt_r.valid               :=0.U




   */

}

//println(chisel3.Driver.emitVerilog(new el2_lsu_lsc_ctl))
/*
object main extends App{
   println("Generate Verilog")
   chisel3.Driver.execute(args, ()=> new el2_lsu_lsc_ctl)
}*/
