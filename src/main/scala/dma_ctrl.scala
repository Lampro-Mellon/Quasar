
import chisel3._
import chisel3.util._
import include._
import dbg._
import scala.collection._
import lib._

class dma_ctrl extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle {
    val free_clk              = Input(Clock())
    val dma_bus_clk_en        = Input(Bool())     // slave bus clock enable
    val clk_override          = Input(Bool())
    val scan_mode             = Input(Bool())
    val dbg_cmd_size          = Input(UInt(2.W))  // size of the abstract mem access debug command
    val dma_dbg_rddata        = Output(UInt(32.W))
    val dma_dbg_cmd_done      = Output(Bool())
    val dma_dbg_cmd_fail      = Output(Bool())
    val dbg_dma = new dec_dbg()
    val dbg_dma_io = new dbg_dma()
    val dec_dma = Flipped(new dec_dma())
    val iccm_dma_rvalid       = Input(Bool())     // iccm data valid for DMA read
    val iccm_dma_ecc_error    = Input(Bool())     // ECC error on DMA read
    val iccm_dma_rtag         = Input(UInt(3.W))  // Tag of the DMA req
    val iccm_dma_rdata        = Input(UInt(64.W)) // iccm data for DMA read
//    val dma_dccm_stall_any    = Output(Bool())    // stall dccm pipe (bubble) so that DMA can proceed
    val iccm_ready            = Input(Bool())     // iccm ready to accept DMA request
//    val dec_tlu_dma_qos_prty  = Input(UInt(3.W))  // DMA QoS priority coming from MFDC [18:15]
    // PMU signals
//    val dma_pmu_dccm_read     = Output(Bool())
//    val dma_pmu_dccm_write    = Output(Bool())
//    val dma_pmu_any_read      = Output(Bool())
//    val dma_pmu_any_write     = Output(Bool())
    // AXI Write Channels
    val dma_axi = Flipped(new axi_channels(DMA_BUS_TAG))
    val lsu_dma = Flipped(new lsu_dma)
    val ifu_dma = Flipped(new ifu_dma)
  })


  val DEPTH_PTR = log2Ceil(DMA_BUF_DEPTH)

  val fifo_error = Wire(Vec(DMA_BUF_DEPTH, UInt(2.W)))

  val fifo_error_bus = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_done = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_addr = Wire(Vec(DMA_BUF_DEPTH, UInt(32.W)))

  val fifo_sz = Wire(Vec(DMA_BUF_DEPTH,UInt(3.W)))

  val fifo_byteen = Wire(Vec(DMA_BUF_DEPTH,UInt(8.W)))

  val fifo_data = Wire(Vec(DMA_BUF_DEPTH,UInt(64.W)))

  val fifo_tag = Wire(Vec(DMA_BUF_DEPTH,UInt(DMA_BUS_TAG.W)))

  val fifo_mid = Wire(Vec(DMA_BUF_DEPTH,UInt((DMA_BUS_ID:Int).W)))

  val fifo_prty = Wire(Vec(DMA_BUF_DEPTH,UInt(DMA_BUS_PRTY.W)))

  val fifo_error_en = WireInit(UInt(DMA_BUF_DEPTH.W),0.U)

  val fifo_error_in = Wire(Vec(DMA_BUF_DEPTH, UInt(2.W)))

  val fifo_data_in = Wire(Vec(DMA_BUF_DEPTH,UInt(64.W)))

  val RspPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)

  val WrPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)

  val RdPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)

  val NxtRspPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)

  val NxtWrPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)

  val NxtRdPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)

  val dma_dbg_cmd_error = WireInit(UInt(1.W),0.U)

  val dma_dbg_cmd_done_q = WireInit(UInt(1.W), 0.U)

  val fifo_empty = WireInit(UInt(1.W), 0.U)

  val dma_address_error = WireInit(UInt(1.W), 0.U)

  val dma_alignment_error = WireInit(UInt(1.W), 0.U)

  val num_fifo_vld = WireInit(UInt(4.W),0.U)

  val dma_mem_req = WireInit(UInt(1.W), 0.U)

  val dma_mem_addr_int = WireInit(UInt(32.W), 0.U)

  val dma_mem_sz_int = WireInit(UInt(3.W), 0.U)

  val dma_mem_byteen = WireInit(UInt(8.W), 0.U)

  val dma_nack_count = WireInit(UInt(3.W), 0.U)

  val dma_nack_count_csr = WireInit(UInt(3.W), 0.U)

  val bus_rsp_valid = WireInit(UInt(1.W), 0.U)

  val bus_rsp_sent = WireInit(UInt(1.W), 0.U)

  val bus_cmd_valid = WireInit(UInt(1.W), 0.U)

  val bus_cmd_sent = WireInit(UInt(1.W), 0.U)

  val bus_cmd_write = WireInit(UInt(1.W), 0.U)

  val bus_cmd_posted_write = WireInit(UInt(1.W), 0.U)

  val bus_cmd_byteen = WireInit(UInt(8.W), 0.U)

  val bus_cmd_sz = WireInit(UInt(3.W), 0.U)

  val bus_cmd_addr = WireInit(UInt(32.W), 0.U)

  val bus_cmd_wdata = WireInit(UInt(64.W), 0.U)

  val bus_cmd_tag = WireInit(UInt(DMA_BUS_TAG.W), 0.U)

  val bus_cmd_mid = WireInit(UInt((DMA_BUS_ID:Int).W), 0.U)

  val bus_cmd_prty = WireInit(UInt(DMA_BUS_PRTY.W), 0.U)

  val bus_posted_write_done = WireInit(UInt(1.W), 0.U)

  val fifo_full_spec_bus = WireInit(UInt(1.W), 0.U)

  val dbg_dma_bubble_bus = WireInit(UInt(1.W), 0.U)

  val axi_mstr_priority = WireInit(UInt(1.W), 0.U)

  val axi_mstr_sel = WireInit(UInt(1.W), 0.U)

  val axi_rsp_sent = WireInit(UInt(1.W), 0.U)

  val fifo_cmd_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_data_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_pend_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_error_bus_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_done_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_done_bus_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_reset = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_valid = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_rpend = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_done_bus = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_write = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_posted_write = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_dbg = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val wrbuf_vld = WireInit(UInt(1.W), 0.U)

  val wrbuf_data_vld = WireInit(UInt(1.W), 0.U)

  val rdbuf_vld = WireInit(UInt(1.W), 0.U)

  val dma_free_clk = Wire(Clock())

  val dma_bus_clk = Wire(Clock())

  val dma_buffer_c1_clk = Wire(Clock())

  val fifo_byteen_in = WireInit(UInt(8.W), 0.U)

  //------------------------LOGIC STARTS HERE---------------------------------


  // DCCM Address check

  val (dma_mem_addr_in_dccm,dma_mem_addr_in_dccm_region_nc) = rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(DCCM_SADR).U,DCCM_SIZE)

  // PIC memory address check

  val (dma_mem_addr_in_pic,dma_mem_addr_in_pic_region_nc) = rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(PIC_BASE_ADDR).U,PIC_SIZE)

  //  ICCM Address check

  val (dma_mem_addr_in_iccm,dma_mem_addr_in_iccm_region_nc) = if(ICCM_ENABLE) rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(ICCM_SADR).U,ICCM_SIZE) else (0.U,0.U)

  // FIFO inputs

  val fifo_addr_in         = Mux(io.dbg_dma.dbg_ib.dbg_cmd_valid.asBool, io.dbg_dma.dbg_ib.dbg_cmd_addr(31,0), bus_cmd_addr(31,0))

  fifo_byteen_in           := Mux(io.dbg_dma.dbg_ib.dbg_cmd_valid.asBool, "h0f".U << (4.U * io.dbg_dma.dbg_ib.dbg_cmd_addr(2)), bus_cmd_byteen(7,0))

  val fifo_sz_in           = Mux(io.dbg_dma.dbg_ib.dbg_cmd_valid.asBool, Cat(0.U, io.dbg_cmd_size(1,0)), bus_cmd_sz(2,0))

  val fifo_write_in        = Mux(io.dbg_dma.dbg_ib.dbg_cmd_valid.asBool, io.dbg_dma.dbg_ib.dbg_cmd_write, bus_cmd_write)

  val fifo_posted_write_in = !io.dbg_dma.dbg_ib.dbg_cmd_valid & bus_cmd_posted_write

  val fifo_dbg_in          = io.dbg_dma.dbg_ib.dbg_cmd_valid


  fifo_cmd_en       := (0 until DMA_BUF_DEPTH).map(i => (((bus_cmd_sent.asBool & io.dma_bus_clk_en) | (io.dbg_dma.dbg_ib.dbg_cmd_valid & io.dbg_dma.dbg_ib.dbg_cmd_type(1).asBool)) & (i.U === WrPtr)).asUInt).reverse.reduce(Cat(_,_))

  fifo_data_en      := (0 until DMA_BUF_DEPTH).map(i => (((bus_cmd_sent & fifo_write_in & io.dma_bus_clk_en) | (io.dbg_dma.dbg_ib.dbg_cmd_valid & io.dbg_dma.dbg_ib.dbg_cmd_type(1) & io.dbg_dma.dbg_ib.dbg_cmd_write)) & (i.U === WrPtr)) | ((dma_address_error | dma_alignment_error) & (i.U === RdPtr)) | (io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag)) | (io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag))).reverse.reduce(Cat(_,_))

  fifo_pend_en      := (0 until DMA_BUF_DEPTH).map(i => ((io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & !io.lsu_dma.dma_lsc_ctl.dma_mem_write & (i.U === RdPtr)).asUInt).reverse.reduce(Cat(_,_))

  fifo_error_en     := (0 until DMA_BUF_DEPTH).map(i => (((dma_address_error.asBool | dma_alignment_error.asBool | dma_dbg_cmd_error) & (i.U === RdPtr)) | ((io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & io.lsu_dma.dma_dccm_ctl.dccm_dma_ecc_error) & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag)) | ((io.iccm_dma_rvalid & io.iccm_dma_ecc_error) & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))

  fifo_error_bus_en := (0 until DMA_BUF_DEPTH).map(i => ((((fifo_error_in(i)(1,0).orR) & fifo_error_en(i)) | (fifo_error(i).orR)) & io.dma_bus_clk_en).asUInt).reverse.reduce(Cat(_,_))

  fifo_done_en      := (0 until DMA_BUF_DEPTH).map(i => (((fifo_error(i).orR | fifo_error_en(i) | ((io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & io.lsu_dma.dma_lsc_ctl.dma_mem_write)) & (i.U === RdPtr)) | (io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag)) | (io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))

  fifo_done_bus_en  := (0 until DMA_BUF_DEPTH).map(i => ((fifo_done_en(i) | fifo_done(i)) & io.dma_bus_clk_en).asUInt).reverse.reduce(Cat(_,_))

  fifo_reset        := (0 until DMA_BUF_DEPTH).map(i => ((((bus_rsp_sent | bus_posted_write_done) & io.dma_bus_clk_en) | io.dma_dbg_cmd_done) & (i.U === RspPtr))).reverse.reduce(Cat(_,_))

  (0 until DMA_BUF_DEPTH).map(i => fifo_error_in(i) := (Mux(io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag), Cat(0.U, io.lsu_dma.dma_dccm_ctl.dccm_dma_ecc_error), Mux(io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag), (Cat(0.U, io.iccm_dma_ecc_error)), (Cat((dma_address_error | dma_alignment_error | dma_dbg_cmd_error), dma_alignment_error))))))

  (0 until DMA_BUF_DEPTH).map(i => fifo_data_in(i) := (Mux(fifo_error_en(i) & (fifo_error_in(i).orR), Cat(Fill(32, 0.U), fifo_addr(i)), Mux(io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag), io.lsu_dma.dma_dccm_ctl.dccm_dma_rdata, Mux(io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag), io.iccm_dma_rdata, Mux(io.dbg_dma.dbg_ib.dbg_cmd_valid, Fill(2, io.dbg_dma.dbg_dctl.dbg_cmd_wrdata), bus_cmd_wdata(63,0)))))))

  fifo_valid := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_cmd_en(i), 1.U, fifo_valid(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))

  (0 until DMA_BUF_DEPTH).map(i => fifo_error(i) := withClock(dma_free_clk) {RegNext(Mux(fifo_error_en(i).asBool(),fifo_error_in(i) , fifo_error(i)) & Fill(fifo_error_in(i).getWidth , !fifo_reset(i)), 0.U)})

  fifo_error_bus    := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_error_bus_en(i), 1.U, fifo_error_bus(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))

  fifo_rpend        := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_pend_en(i), 1.U, fifo_rpend(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))

  fifo_done         := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_done_en(i), 1.U, fifo_done(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))

  fifo_done_bus     := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_done_bus_en(i), 1.U, fifo_done_bus(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))

  (0 until DMA_BUF_DEPTH).map(i => fifo_addr(i) := rvdffe(fifo_addr_in, fifo_cmd_en(i), clock, io.scan_mode))

  (0 until DMA_BUF_DEPTH).map(i => fifo_sz(i) := withClock(dma_buffer_c1_clk) {RegEnable(fifo_sz_in(2,0), 0.U, fifo_cmd_en(i))})

  (0 until DMA_BUF_DEPTH).map(i => fifo_byteen(i) := withClock(dma_buffer_c1_clk) {RegEnable(fifo_byteen_in(7,0), 0.U, fifo_cmd_en(i).asBool())})

  fifo_write        := (0 until DMA_BUF_DEPTH).map(i => (withClock(dma_buffer_c1_clk) {RegEnable(fifo_write_in, 0.U, fifo_cmd_en(i))})).reverse.reduce(Cat(_,_))

  fifo_posted_write := (0 until DMA_BUF_DEPTH).map(i => (withClock(dma_buffer_c1_clk) {RegEnable(fifo_posted_write_in, 0.U, fifo_cmd_en(i))})).reverse.reduce(Cat(_,_))

  fifo_dbg          := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_buffer_c1_clk) {RegEnable(fifo_dbg_in, 0.U, fifo_cmd_en(i))}).reverse.reduce(Cat(_,_))

  (0 until DMA_BUF_DEPTH).map(i => fifo_data(i) := rvdffe(fifo_data_in(i), fifo_data_en(i), clock, io.scan_mode))

  (0 until DMA_BUF_DEPTH).map(i => fifo_tag(i) := withClock(dma_buffer_c1_clk) {RegEnable(bus_cmd_tag, 0.U, fifo_cmd_en(i))})

  (0 until DMA_BUF_DEPTH).map(i => fifo_mid(i) := withClock(dma_buffer_c1_clk) {RegEnable(bus_cmd_mid, 0.U, fifo_cmd_en(i))})

  (0 until DMA_BUF_DEPTH).map(i => fifo_prty(i) := withClock(dma_buffer_c1_clk) {RegEnable(bus_cmd_prty, 0.U, fifo_cmd_en(i))})

  // Pointer logic

  NxtWrPtr     := Mux((WrPtr === (DMA_BUF_DEPTH - 1).U).asBool, 0.U, WrPtr + 1.U)

  NxtRdPtr     := Mux((RdPtr === (DMA_BUF_DEPTH - 1).U).asBool, 0.U, RdPtr + 1.U)

  NxtRspPtr    := Mux((RspPtr === (DMA_BUF_DEPTH - 1).U).asBool, 0.U, RspPtr + 1.U)

  val WrPtrEn  = fifo_cmd_en.orR

  val RdPtrEn  = (io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req | (dma_address_error.asBool | dma_alignment_error.asBool | dma_dbg_cmd_error))

  val RspPtrEn = (io.dma_dbg_cmd_done | (bus_rsp_sent | bus_posted_write_done) & io.dma_bus_clk_en)

  WrPtr        := withClock(dma_free_clk) {
    RegEnable(NxtWrPtr, 0.U, WrPtrEn)
  }

  RdPtr        := withClock(dma_free_clk) {
    RegEnable(NxtRdPtr, 0.U, RdPtrEn.asBool)
  }

  RspPtr       := withClock(dma_free_clk) {
    RegEnable(NxtRspPtr, 0.U, RspPtrEn.asBool)
  }

  // Miscellaneous signal

  val fifo_full         = fifo_full_spec_bus;

  val num_fifo_vld_tmp  = WireInit(UInt(4.W),0.U)
  val num_fifo_vld_tmp2 = WireInit(UInt(4.W),0.U)

  num_fifo_vld_tmp      := (Cat(Fill(3, 0.U), bus_cmd_sent)) - (Cat(Fill(3, 0.U), bus_rsp_sent))

  num_fifo_vld_tmp2     := (0 until DMA_BUF_DEPTH).map(i => Cat(Fill(3,0.U), fifo_valid(i))).reduce(_+_)

  num_fifo_vld          := num_fifo_vld_tmp + num_fifo_vld_tmp2

  val fifo_full_spec    = (num_fifo_vld_tmp2 >= DMA_BUF_DEPTH.asUInt())

  val dma_fifo_ready    = ~(fifo_full | dbg_dma_bubble_bus)

  // Error logic

  dma_address_error     := fifo_valid(RdPtr) & !fifo_done(RdPtr) & !fifo_dbg(RdPtr) & (~(dma_mem_addr_in_dccm | dma_mem_addr_in_iccm)).asUInt   // request not for ICCM or DCCM
  dma_alignment_error   := fifo_valid(RdPtr) & !fifo_done(RdPtr) & !dma_address_error &
    (((dma_mem_sz_int(2,0) === 1.U) & dma_mem_addr_int(0)) |                                                                                // HW size but unaligned
      ((dma_mem_sz_int(2,0) === 2.U) & (dma_mem_addr_int(1, 0).orR)) |                                                                      // W size but unaligned
      ((dma_mem_sz_int(2,0) === 3.U) & (dma_mem_addr_int(2, 0).orR)) |                                                                      // DW size but unaligned
      (dma_mem_addr_in_iccm & ~((dma_mem_sz_int(1, 0) === 2.U) | (dma_mem_sz_int(1, 0) === 3.U)).asUInt  ) |                                // ICCM access not word size
      (dma_mem_addr_in_dccm & io.lsu_dma.dma_lsc_ctl.dma_mem_write & ~((dma_mem_sz_int(1, 0) === 2.U) | (dma_mem_sz_int(1, 0) === 3.U)).asUInt) |               // DCCM write not word size
      (io.lsu_dma.dma_lsc_ctl.dma_mem_write & (dma_mem_sz_int(2, 0) === 2.U) & (Mux1H(Seq((dma_mem_addr_int(2,0) === 0.U) -> (dma_mem_byteen(3,0)),
        (dma_mem_addr_int(2,0) === 1.U) -> (dma_mem_byteen(4,1)),
        (dma_mem_addr_int(2,0) === 2.U) -> (dma_mem_byteen(5,2)),
        (dma_mem_addr_int(2,0) === 3.U) -> (dma_mem_byteen(6,3)))) =/= 15.U)) | // Write byte enables not aligned for word store
      (io.lsu_dma.dma_lsc_ctl.dma_mem_write & (dma_mem_sz_int(2, 0) === 3.U) & !((dma_mem_byteen(7,0) === "h0f".U) | (dma_mem_byteen(7,0) === "hf0".U) | (dma_mem_byteen(7,0) === "hff".U)))) // Write byte enables not aligned for dword store


  //Dbg outputs

  io.dbg_dma_io.dma_dbg_ready      := fifo_empty & dbg_dma_bubble_bus
  io.dma_dbg_cmd_done   := (fifo_valid(RspPtr) & fifo_dbg(RspPtr) & fifo_done(RspPtr))
  io.dma_dbg_rddata     := Mux(fifo_addr(RspPtr)(2), fifo_data(RspPtr)(63, 32), fifo_data(RspPtr)(31,0))
  io.dma_dbg_cmd_fail   := fifo_error(RspPtr).orR

  dma_dbg_cmd_error     := fifo_valid(RdPtr) & !fifo_done(RdPtr) & fifo_dbg(RdPtr) & ((~(dma_mem_addr_in_dccm | dma_mem_addr_in_iccm | dma_mem_addr_in_pic)).asBool() | (dma_mem_sz_int(1, 0) =/= 2.U))       // Only word accesses allowed

  // Block the decode if fifo full

  io.dec_dma.tlu_dma.dma_dccm_stall_any := dma_mem_req & (dma_mem_addr_in_dccm | dma_mem_addr_in_pic) & (dma_nack_count >= dma_nack_count_csr)
  io.ifu_dma.dma_ifc.dma_iccm_stall_any := dma_mem_req & dma_mem_addr_in_iccm & (dma_nack_count >= dma_nack_count_csr);
  io.dec_dma.tlu_dma.dma_iccm_stall_any :=  io.ifu_dma.dma_ifc.dma_iccm_stall_any
  io.dec_dma.dctl_dma.dma_dccm_stall_any :=  io.dec_dma.tlu_dma.dma_dccm_stall_any
  // Used to indicate ready to debug

  fifo_empty := ~(fifo_valid.orR)

  // Nack counter, stall the lsu pipe if 7 nacks

  dma_nack_count_csr := io.dec_dma.tlu_dma.dec_tlu_dma_qos_prty
  val dma_nack_count_d = Mux(dma_nack_count >= dma_nack_count_csr, (Fill(3, !(io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req)) & dma_nack_count(2,0)), Mux((dma_mem_req.asBool & !(io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req)), dma_nack_count(2,0) + 1.U, 0.U))

  dma_nack_count     := withClock(dma_free_clk) {
    RegEnable(dma_nack_count_d(2,0), 0.U, dma_mem_req.asBool)
  }

  // Core outputs

  dma_mem_req      := fifo_valid(RdPtr) & !fifo_rpend(RdPtr) & !fifo_done(RdPtr) & !(dma_address_error | dma_alignment_error | dma_dbg_cmd_error)
  io.lsu_dma.dma_lsc_ctl.dma_dccm_req  := dma_mem_req & (dma_mem_addr_in_dccm | dma_mem_addr_in_pic) & io.lsu_dma.dccm_ready
  io.ifu_dma.dma_mem_ctl.dma_iccm_req  := dma_mem_req & dma_mem_addr_in_iccm & io.iccm_ready;
  io.lsu_dma.dma_mem_tag   := RdPtr
  dma_mem_addr_int := fifo_addr(RdPtr)
  dma_mem_sz_int   := fifo_sz(RdPtr)
  io.lsu_dma.dma_lsc_ctl.dma_mem_addr  := Mux(io.lsu_dma.dma_lsc_ctl.dma_mem_write & (dma_mem_byteen(7,0) === "hf0".U), Cat(dma_mem_addr_int(31, 3), 1.U, dma_mem_addr_int(1, 0)), dma_mem_addr_int(31,0))
  io.lsu_dma.dma_lsc_ctl.dma_mem_sz    := Mux(io.lsu_dma.dma_lsc_ctl.dma_mem_write & ((dma_mem_byteen(7,0) === "h0f".U) | (dma_mem_byteen(7,0) === "hf0".U)), 2.U, dma_mem_sz_int(2,0))
  dma_mem_byteen   := fifo_byteen(RdPtr)
  io.lsu_dma.dma_lsc_ctl.dma_mem_write := fifo_write(RdPtr)
  io.lsu_dma.dma_lsc_ctl.dma_mem_wdata := fifo_data(RdPtr)

  // PMU outputs

  io.dec_dma.tlu_dma.dma_pmu_dccm_read   := io.lsu_dma.dma_lsc_ctl.dma_dccm_req & !io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.dec_dma.tlu_dma.dma_pmu_dccm_write  := io.lsu_dma.dma_lsc_ctl.dma_dccm_req & io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.dec_dma.tlu_dma.dma_pmu_any_read    := (io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & !io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.dec_dma.tlu_dma.dma_pmu_any_write   := (io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & io.lsu_dma.dma_lsc_ctl.dma_mem_write

  // Inputs

  fifo_full_spec_bus := withClock(dma_bus_clk) {
    RegNext(fifo_full_spec, 0.U)
  }

  dbg_dma_bubble_bus := withClock(dma_bus_clk) {
    RegNext(io.dbg_dma_io.dbg_dma_bubble, 0.U)
  }

  dma_dbg_cmd_done_q := withClock(io.free_clk) {
    RegNext(io.dma_dbg_cmd_done, 0.U)
  }

  // Clock Gating logic

  val dma_buffer_c1_clken = (bus_cmd_valid & io.dma_bus_clk_en) | io.dbg_dma.dbg_ib.dbg_cmd_valid | io.clk_override
  val dma_free_clken      = (bus_cmd_valid | bus_rsp_valid | io.dbg_dma.dbg_ib.dbg_cmd_valid | io.dma_dbg_cmd_done | dma_dbg_cmd_done_q | (fifo_valid.orR) | io.clk_override)

  val dma_buffer_c1cgc = Module(new rvclkhdr)
  dma_buffer_c1cgc.io.en        := dma_buffer_c1_clken
  dma_buffer_c1cgc.io.scan_mode := io.scan_mode
  dma_buffer_c1cgc.io.clk       := clock
  dma_buffer_c1_clk             := dma_buffer_c1cgc.io.l1clk

  val dma_free_cgc = Module(new rvclkhdr)
  dma_free_cgc.io.en        := dma_free_clken
  dma_free_cgc.io.scan_mode := io.scan_mode
  dma_free_cgc.io.clk       := clock
  dma_free_clk              := dma_free_cgc.io.l1clk

  val dma_bus_cgc = Module(new rvclkhdr)
  dma_bus_cgc.io.en        := io.dma_bus_clk_en
  dma_bus_cgc.io.scan_mode := io.scan_mode
  dma_bus_cgc.io.clk       := clock
  dma_bus_clk              := dma_bus_cgc.io.l1clk

  // Write channel buffer

  val wrbuf_en          = io.dma_axi.aw.valid & io.dma_axi.aw.ready
  val wrbuf_data_en     = io.dma_axi.w.valid & io.dma_axi.w.ready
  val wrbuf_cmd_sent    = bus_cmd_sent & bus_cmd_write
  val wrbuf_rst         = wrbuf_cmd_sent.asBool & !wrbuf_en
  val wrbuf_data_rst    = wrbuf_cmd_sent.asBool & !wrbuf_data_en

  wrbuf_vld             := withClock(dma_bus_clk) {RegNext(Mux(wrbuf_en, 1.U, wrbuf_vld) & !wrbuf_rst, 0.U)}

  wrbuf_data_vld        := withClock(dma_bus_clk) {RegNext(Mux(wrbuf_data_en, 1.U, wrbuf_data_vld) & !wrbuf_data_rst, 0.U)}

  val wrbuf_tag         = withClock(dma_bus_clk) {
    RegEnable(io.dma_axi.aw.bits.id, 0.U, wrbuf_en)
  }

  val wrbuf_sz          = withClock(dma_bus_clk) {
    RegEnable(io.dma_axi.aw.bits.size, 0.U, wrbuf_en)
  }

  val wrbuf_addr        = rvdffe(io.dma_axi.aw.bits.addr, wrbuf_en & io.dma_bus_clk_en, clock, io.scan_mode)

  val wrbuf_data        = rvdffe(io.dma_axi.w.bits.data, wrbuf_data_en & io.dma_bus_clk_en, clock, io.scan_mode)

  val wrbuf_byteen 		  = withClock(dma_bus_clk) {
    RegEnable(io.dma_axi.w.bits.strb, 0.U, wrbuf_data_en)
  }

  // Read channel buffer

  val rdbuf_en 			    = io.dma_axi.ar.valid & io.dma_axi.ar.ready
  val rdbuf_cmd_sent 	  = bus_cmd_sent & !bus_cmd_write
  val rdbuf_rst 		    = rdbuf_cmd_sent.asBool & !rdbuf_en

  rdbuf_vld := withClock(dma_bus_clk) {RegNext(Mux(rdbuf_en, 1.U, rdbuf_vld) & !rdbuf_rst, 0.U)}

  val rdbuf_tag 		    = withClock(dma_bus_clk) {
    RegEnable(io.dma_axi.ar.bits.id, 0.U, rdbuf_en)
  }

  val rdbuf_sz 			    = withClock(dma_bus_clk) {
    RegEnable(io.dma_axi.ar.bits.size, 0.U, rdbuf_en)
  }

  val rdbuf_addr = rvdffe(io.dma_axi.ar.bits.addr, rdbuf_en & io.dma_bus_clk_en, clock, io.scan_mode)

  io.dma_axi.aw.ready 	  := ~(wrbuf_vld & !wrbuf_cmd_sent)
  io.dma_axi.w.ready 	  := ~(wrbuf_data_vld & !wrbuf_cmd_sent)
  io.dma_axi.ar.ready 	  := ~(rdbuf_vld & !rdbuf_cmd_sent)

  //Generate a single request from read/write channel

  bus_cmd_valid 		    := (wrbuf_vld & wrbuf_data_vld) | rdbuf_vld
  bus_cmd_sent 			    := bus_cmd_valid & dma_fifo_ready.asUInt
  bus_cmd_write 		    := axi_mstr_sel
  bus_cmd_posted_write 	:= 0.U;
  bus_cmd_addr 			    := Mux(axi_mstr_sel.asBool, wrbuf_addr, rdbuf_addr)
  bus_cmd_sz 			      := Mux(axi_mstr_sel.asBool, wrbuf_sz, rdbuf_sz)
  bus_cmd_wdata 		    := wrbuf_data
  bus_cmd_byteen 		    := wrbuf_byteen
  bus_cmd_tag 			    := Mux(axi_mstr_sel.asBool, wrbuf_tag, rdbuf_tag)
  bus_cmd_mid 			    := 0.U
  bus_cmd_prty 			    := 0.U

  // Sel=1 -> write has higher priority

  axi_mstr_sel          := Mux((wrbuf_vld & wrbuf_data_vld & rdbuf_vld) === 1.U, axi_mstr_priority, wrbuf_vld & wrbuf_data_vld)
  val axi_mstr_prty_in 	= ~axi_mstr_priority
  val axi_mstr_prty_en 	= bus_cmd_sent

  axi_mstr_priority 	  := withClock(dma_bus_clk) {
    RegEnable(axi_mstr_prty_in, 0.U, axi_mstr_prty_en.asBool)
  }

  val axi_rsp_valid 	  = fifo_valid(RspPtr) & !fifo_dbg(RspPtr) & fifo_done_bus(RspPtr)
  val axi_rsp_rdata 	  = fifo_data(RspPtr)
  val axi_rsp_write 	  = fifo_write(RspPtr)
  val axi_rsp_error 	  = Mux(fifo_error(RspPtr)(0), 2.U, Mux(fifo_error(RspPtr)(1), 3.U, 0.U));

  val axi_rsp_tag 		  = fifo_tag(RspPtr)

  // AXI response channel signals

  io.dma_axi.b.valid 	  := axi_rsp_valid & axi_rsp_write
  io.dma_axi.b.bits.resp 	  	:= axi_rsp_error(1,0)
  io.dma_axi.b.bits.id 	    	:= axi_rsp_tag

  io.dma_axi.r.valid 	  := axi_rsp_valid & !axi_rsp_write
  io.dma_axi.r.bits.resp 	  	:= axi_rsp_error
  io.dma_axi.r.bits.data 		  := axi_rsp_rdata(63,0)
  io.dma_axi.r.bits.last 	  	:= 1.U
  io.dma_axi.r.bits.id 		    := axi_rsp_tag

  bus_posted_write_done := 0.U
  bus_rsp_valid 		    := (io.dma_axi.b.valid | io.dma_axi.r.valid)
  bus_rsp_sent 			    := ((io.dma_axi.b.valid & io.dma_axi.b.ready) | (io.dma_axi.r.valid & io.dma_axi.r.ready))
  io.lsu_dma.dma_dccm_ctl.dma_mem_addr := io.lsu_dma.dma_lsc_ctl.dma_mem_addr
  io.lsu_dma.dma_dccm_ctl.dma_mem_wdata := io.lsu_dma.dma_lsc_ctl.dma_mem_wdata
  io.ifu_dma.dma_mem_ctl.dma_mem_sz := io.lsu_dma.dma_lsc_ctl.dma_mem_sz
  io.ifu_dma.dma_mem_ctl.dma_mem_addr := io.lsu_dma.dma_lsc_ctl.dma_mem_addr
  io.ifu_dma.dma_mem_ctl.dma_mem_wdata := io.lsu_dma.dma_lsc_ctl.dma_mem_wdata
  io.ifu_dma.dma_mem_ctl.dma_mem_write := io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.ifu_dma.dma_mem_ctl.dma_mem_tag := io.lsu_dma.dma_mem_tag
}
