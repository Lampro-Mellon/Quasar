
import chisel3._
import chisel3.util._
import include._
//import dbg._
import scala.collection._
import lib._

class dma_ctrl extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle {
    val free_clk              = Input(Clock())
    val dma_bus_clk_en        = Input(Bool())     // slave bus clock enable
    val clk_override          = Input(Bool())
    val scan_mode             = Input(Bool())
    val dbg_cmd_size          = Input(UInt(2.W))

    val dma_dbg_cmd_done      = Output(Bool())
    val dma_dbg_cmd_fail      = Output(Bool())
    val dma_dbg_rddata        = Output(UInt(32.W))
    val iccm_dma_rvalid       = Input(Bool())
    val iccm_dma_ecc_error    = Input(Bool())
    val iccm_dma_rtag         = Input(UInt(3.W))
    val iccm_dma_rdata        = Input(UInt(64.W))
    val dma_active            = Output(Bool())
    val iccm_ready            = Input(Bool())

    val dbg_dec_dma           = new dec_dbg()
    val dbg_dma               = new dbg_dma()
    val dec_dma               = Flipped(new dec_dma())
    val lsu_dma               = Flipped(new lsu_dma)
    val ifu_dma               = Flipped(new ifu_dma)// AXI Write Channel
    val dma_axi = Flipped(new axi_channels(DMA_BUS_TAG))


  })

  val DEPTH = DMA_BUF_DEPTH

  val DEPTH_PTR = log2Ceil(DEPTH)

  val NACK_COUNT = 7

  val      dma_dbg_mem_wrdata = WireInit(UInt(32.W), 0.U)
  val bus_cmd_addr = WireInit(UInt(32.W), 0.U)
  val bus_cmd_byteen = WireInit(UInt(8.W), 0.U)
  val bus_cmd_sz = WireInit(UInt(3.W), 0.U)
  val bus_cmd_write = WireInit(Bool(), false.B)
  val bus_cmd_posted_write = WireInit(Bool(), false.B)
  // Clock Gating logic
  val bus_cmd_valid = WireInit(Bool(),0.B)
  val bus_rsp_valid = WireInit(Bool(),0.B)
  val dma_dbg_cmd_done_q  = WireInit(Bool(),0.B)
  val fifo_valid  = WireInit(UInt(DEPTH.W),0.U)
  val dma_buffer_c1_clken = (bus_cmd_valid & io.dma_bus_clk_en) | io.dbg_dec_dma.dbg_ib.dbg_cmd_valid | io.clk_override
  val dma_free_clken = (bus_cmd_valid | bus_rsp_valid | io.dbg_dec_dma.dbg_ib.dbg_cmd_valid | io.dma_dbg_cmd_done | dma_dbg_cmd_done_q | (fifo_valid.orR) | io.clk_override)

  val dma_buffer_c1_clk = rvoclkhdr(clock,dma_buffer_c1_clken,io.scan_mode)
  val dma_free_clk = rvoclkhdr(clock,dma_free_clken,io.scan_mode)

  val fifo_addr_in = Mux(io.dbg_dec_dma.dbg_ib.dbg_cmd_valid, io.dbg_dec_dma.dbg_ib.dbg_cmd_addr, bus_cmd_addr)
  val fifo_byteen_in = Fill(8,!io.dbg_dec_dma.dbg_ib.dbg_cmd_valid) & bus_cmd_byteen    // Byte enable is used only for bus requests//Mux(io.dbg_cmd_valid, 0.U, bus_cmd_byteen)
  val fifo_sz_in = Mux(io.dbg_dec_dma.dbg_ib.dbg_cmd_valid, Cat(0.U,io.dbg_cmd_size), bus_cmd_sz)
  val fifo_write_in = Mux(io.dbg_dec_dma.dbg_ib.dbg_cmd_valid, io.dbg_dec_dma.dbg_ib.dbg_cmd_write, bus_cmd_write)
  val fifo_posted_write_in = !io.dbg_dec_dma.dbg_ib.dbg_cmd_valid & bus_cmd_posted_write
  val fifo_dbg_in = io.dbg_dec_dma.dbg_ib.dbg_cmd_valid
  val bus_cmd_sent = WireInit(Bool(), false.B)
  val WrPtr = WireInit(UInt(DEPTH_PTR.W), 0.U)
  val RdPtr = WireInit(UInt(DEPTH_PTR.W), 0.U)
  val dma_address_error = WireInit(Bool(), false.B)
  val dma_alignment_error = WireInit(Bool(), false.B)

  //  val fifo_cmd_en = (0 until DEPTH).map(i=>((bus_cmd_sent & io.dma_bus_clk_en) | (io.dbg_cmd_valid & io.dbg_cmd_type(1))) & (WrPtr === i.U).asUInt()).reverse.reduce(Cat(_,_))
  //
  //  val fifo_data_en = (0 until DEPTH).map(i => ((((bus_cmd_sent & fifo_write_in & io.dma_bus_clk_en) | (io.dbg_cmd_valid & io.dbg_cmd_type(1) & io.dbg_cmd_write)) &
  //    (i.U === WrPtr)) | ((dma_address_error | dma_alignment_error) & (i.U === RdPtr)) |
  //    (io.dccm_dma_rvalid & (i.U === io.dccm_dma_rtag)) |
  //    (io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))
  //
  //  val fifo_pend_en = (0 until DEPTH).map(i => ((io.dma_dccm_req | io.dma_iccm_req) & !io.dma_mem_write & (i.U === RdPtr)).asUInt).reverse.reduce(Cat(_,_))
  //
  //  val dma_dbg_cmd_error = WireInit(Bool(), false.B)
  //
  //  val fifo_error_en = (0 until DEPTH).map(i => (((dma_address_error.asBool | dma_alignment_error.asBool | dma_dbg_cmd_error) &
  //    (i.U === RdPtr)) | ((io.dccm_dma_rvalid & io.dccm_dma_ecc_error) & (i.U === io.dccm_dma_rtag)) |
  //    ((io.iccm_dma_rvalid & io.iccm_dma_ecc_error) & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))
  //  val fifo_error_in = Wire(Vec(DEPTH, UInt(2.W)))
  //  val fifo_error = Wire(Vec(DEPTH, UInt(2.W)))
  //  val fifo_error_bus_en = (0 until DMA_BUF_DEPTH).map(i=>(((fifo_error_in(i).orR & fifo_error_en(i)) | fifo_error(i).orR) & io.dma_bus_clk_en).asUInt).reverse.reduce(Cat(_,_))
  //  val fifo_done_en = (0 until DMA_BUF_DEPTH).map(i=>(((fifo_error(i).orR | fifo_error_en(i) | ((io.dma_dccm_req | io.dma_iccm_req) & io.dma_mem_write)) & (i.U === RdPtr)) |
  //    (io.dccm_dma_rvalid & (i.U === io.dccm_dma_rtag)) | (io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))
  //  val fifo_done = WireInit(UInt(DEPTH.W), 0.U)
  //  val fifo_done_bus_en = (0 until DMA_BUF_DEPTH).map(i => ((fifo_done_en(i) | fifo_done(i)) & io.dma_bus_clk_en).asUInt).reverse.reduce(Cat(_,_))
  //  val bus_rsp_sent = WireInit(Bool(), false.B)
  //  val bus_posted_write_done = WireInit(Bool(), false.B)
  //  val RspPtr = WireInit(UInt(DEPTH_PTR.W), 0.U)
  //  val fifo_reset = (0 until DMA_BUF_DEPTH).map(i=>((((bus_rsp_sent | bus_posted_write_done) & io.dma_bus_clk_en) | io.dma_dbg_cmd_done) & (i.U === RspPtr)).asUInt()).reverse.reduce(Cat(_,_))
  //  fifo_error_in := (0 until DMA_BUF_DEPTH).map(i=>Mux(io.dccm_dma_rvalid & (io.dccm_dma_rtag===i.U), Cat(0.U(1.W),io.dccm_dma_ecc_error), Mux(io.iccm_dma_rvalid & (io.iccm_dma_rtag===i.U), Cat(0.U(1.W),io.iccm_dma_ecc_error), Cat(dma_address_error | dma_alignment_error | dma_dbg_cmd_error, dma_alignment_error))))
  val fifo_cmd_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_data_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_pend_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_error_bus_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_done_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_done_bus_en = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_reset = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)

  val fifo_error_en = WireInit(UInt(DMA_BUF_DEPTH.W),0.U)
  val dma_dbg_cmd_error = WireInit(UInt(1.W),0.U)
  val fifo_error_in = Wire(Vec(DMA_BUF_DEPTH, UInt(2.W)))
  val RspPtr = WireInit(UInt((log2Ceil(DMA_BUF_DEPTH)).W), 0.U)
  val bus_posted_write_done = WireInit(UInt(1.W), 0.U)
  val bus_rsp_sent = WireInit(UInt(1.W), 0.U)
  val fifo_error = Wire(Vec(DMA_BUF_DEPTH, UInt(2.W)))
  val fifo_done = WireInit(UInt(DMA_BUF_DEPTH.W), 0.U)
  fifo_cmd_en       := (0 until DMA_BUF_DEPTH).map(i => (((bus_cmd_sent.asBool & io.dma_bus_clk_en) | (io.dbg_dec_dma.dbg_ib.dbg_cmd_valid & io.dbg_dec_dma.dbg_ib.dbg_cmd_type(1).asBool)) & (i.U === WrPtr)).asUInt).reverse.reduce(Cat(_,_))

  fifo_data_en      := (0 until DMA_BUF_DEPTH).map(i => (((bus_cmd_sent & fifo_write_in & io.dma_bus_clk_en) | (io.dbg_dec_dma.dbg_ib.dbg_cmd_valid & io.dbg_dec_dma.dbg_ib.dbg_cmd_type(1) & io.dbg_dec_dma.dbg_ib.dbg_cmd_write)) & (i.U === WrPtr).asUInt()) | ((dma_address_error | dma_alignment_error) & (i.U === RdPtr).asUInt()) | (io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag).asUInt()) | (io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag).asUInt())).reverse.reduce(Cat(_,_))

  fifo_pend_en      := (0 until DMA_BUF_DEPTH).map(i => ((io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & !io.lsu_dma.dma_lsc_ctl.dma_mem_write & (i.U === RdPtr)).asUInt).reverse.reduce(Cat(_,_))

  fifo_error_en     := (0 until DMA_BUF_DEPTH).map(i => (((dma_address_error.asBool | dma_alignment_error.asBool | dma_dbg_cmd_error) & (i.U === RdPtr)) | ((io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & io.lsu_dma.dma_dccm_ctl.dccm_dma_ecc_error) & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag)) | ((io.iccm_dma_rvalid & io.iccm_dma_ecc_error) & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))

  fifo_error_bus_en := (0 until DMA_BUF_DEPTH).map(i => ((((fifo_error_in(i)(1,0).orR) & fifo_error_en(i)) | (fifo_error(i).orR)) & io.dma_bus_clk_en).asUInt).reverse.reduce(Cat(_,_))

  fifo_done_en      := (0 until DMA_BUF_DEPTH).map(i => (((fifo_error(i).orR | fifo_error_en(i) | ((io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & io.lsu_dma.dma_lsc_ctl.dma_mem_write)) & (i.U === RdPtr)) | (io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag)) | (io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag))).asUInt).reverse.reduce(Cat(_,_))

  fifo_done_bus_en  := (0 until DMA_BUF_DEPTH).map(i => ((fifo_done_en(i) | fifo_done(i)) & io.dma_bus_clk_en).asUInt).reverse.reduce(Cat(_,_))

  fifo_reset        := (0 until DMA_BUF_DEPTH).map(i => ((((bus_rsp_sent | bus_posted_write_done) & io.dma_bus_clk_en) | io.dma_dbg_cmd_done) & (i.U === RspPtr))).reverse.reduce(Cat(_,_))

  (0 until DMA_BUF_DEPTH).map(i => fifo_error_in(i) := (Mux(io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag), Cat(0.U, io.lsu_dma.dma_dccm_ctl.dccm_dma_ecc_error), Mux(io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag), (Cat(0.U, io.iccm_dma_ecc_error)), (Cat((dma_address_error | dma_alignment_error | dma_dbg_cmd_error), dma_alignment_error))))))

  val fifo_addr = Wire(Vec(DEPTH,UInt(32.W)))
  val bus_cmd_wdata = WireInit(UInt(64.W), 0.U)
  val fifo_data_in = VecInit.tabulate(DMA_BUF_DEPTH)(i =>(Mux(fifo_error_en(i) & (fifo_error_in(i).orR), Cat(Fill(32, 0.U), fifo_addr(i)), Mux(io.lsu_dma.dma_dccm_ctl.dccm_dma_rvalid & (i.U === io.lsu_dma.dma_dccm_ctl.dccm_dma_rtag), io.lsu_dma.dma_dccm_ctl.dccm_dma_rdata, Mux(io.iccm_dma_rvalid & (i.U === io.iccm_dma_rtag), io.iccm_dma_rdata, Mux(io.dbg_dec_dma.dbg_ib.dbg_cmd_valid, Fill(2, dma_dbg_mem_wrdata), bus_cmd_wdata(63,0)))))))

  fifo_valid := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_cmd_en(i), 1.U, fifo_valid(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  (0 until DMA_BUF_DEPTH).map(i => fifo_error(i) := withClock(dma_free_clk) {RegNext(Mux(fifo_error_en(i).asBool(),fifo_error_in(i) , fifo_error(i)) & Fill(fifo_error_in(i).getWidth , !fifo_reset(i)), 0.U)})
  val fifo_error_bus = WireInit(UInt(DEPTH.W), 0.U)
  val fifo_rpend     = WireInit(UInt(DEPTH.W), 0.U)
  fifo_error_bus   := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_error_bus_en(i), 1.U, fifo_error_bus(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  fifo_rpend       := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_pend_en(i), 1.U, fifo_rpend(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  fifo_done        := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_done_en(i), 1.U, fifo_done(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  val fifo_done_bus = WireInit(UInt(DEPTH.W), 0.U)
  fifo_done_bus    := (0 until DMA_BUF_DEPTH).map(i => withClock(dma_free_clk) {RegNext(Mux(fifo_done_bus_en(i), 1.U, fifo_done_bus(i)) & !fifo_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  (0 until DMA_BUF_DEPTH).map(i => fifo_addr(i) := rvdffe(fifo_addr_in, fifo_cmd_en(i), clock, io.scan_mode))
  val fifo_sz           = VecInit.tabulate(DMA_BUF_DEPTH)(i => withClock(dma_buffer_c1_clk) {RegEnable(fifo_sz_in(2,0), 0.U, fifo_cmd_en(i))})
  val fifo_byteen       = VecInit.tabulate(DMA_BUF_DEPTH)(i =>withClock(dma_buffer_c1_clk) {RegEnable(fifo_byteen_in(7,0), 0.U, fifo_cmd_en(i).asBool())})
  val fifo_write        = (0 until DMA_BUF_DEPTH).map(i => (withClock(dma_buffer_c1_clk) {RegEnable(fifo_write_in, 0.U, fifo_cmd_en(i))})).reverse.reduce(Cat(_,_))
  val fifo_posted_write = (0 until DMA_BUF_DEPTH).map(i => (withClock(dma_buffer_c1_clk) {RegEnable(fifo_posted_write_in, 0.U, fifo_cmd_en(i))})).reverse.reduce(Cat(_,_))
  val fifo_dbg          = (0 until DMA_BUF_DEPTH).map(i => withClock(dma_buffer_c1_clk) {RegEnable(fifo_dbg_in, 0.U, fifo_cmd_en(i))}).reverse.reduce(Cat(_,_))

  val fifo_data = Wire(Vec(DMA_BUF_DEPTH,UInt(64.W)))//VecInit.tabulate(DMA_BUF_DEPTH)(i =>rvdffe(fifo_data_in(i), fifo_data_en(i), clock, io.scan_mode))
  (0 until DMA_BUF_DEPTH).map(i => fifo_data(i) := rvdffe(fifo_data_in(i), fifo_data_en(i), clock, io.scan_mode))
  val bus_cmd_tag = WireInit(UInt(DMA_BUS_TAG.W),0.U)
  val bus_cmd_mid = WireInit(UInt(DMA_BUS_ID.W),0.U)
  val bus_cmd_prty = WireInit(UInt(DMA_BUS_PRTY.W),0.U)
  val fifo_tag      = VecInit.tabulate(DMA_BUF_DEPTH)(i =>withClock(dma_buffer_c1_clk) {RegEnable(bus_cmd_tag, 0.U, fifo_cmd_en(i))})
  val fifo_mid      = VecInit.tabulate(DMA_BUF_DEPTH)(i =>withClock(dma_buffer_c1_clk) {RegEnable(bus_cmd_mid, 0.U, fifo_cmd_en(i))})
  val fifo_prty     = VecInit.tabulate(DMA_BUF_DEPTH)(i =>withClock(dma_buffer_c1_clk) {RegEnable(bus_cmd_prty, 0.U, fifo_cmd_en(i))})

  // Pointer logic

  val NxtWrPtr  = Mux((WrPtr  === (DEPTH-1).U), 0.U, WrPtr+ 1.U)
  val NxtRdPtr  = Mux((RdPtr  === (DEPTH-1).U), 0.U, RdPtr+ 1.U)
  val NxtRspPtr = Mux((RspPtr === (DEPTH-1).U), 0.U, RspPtr + 1.U)

  val WrPtrEn = fifo_cmd_en.orR
  val RdPtrEn = io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req | (dma_address_error | dma_alignment_error | dma_dbg_cmd_error)
  val RspPtrEn = (io.dma_dbg_cmd_done | (bus_rsp_sent | bus_posted_write_done) & io.dma_bus_clk_en)


  WrPtr        := withClock(dma_free_clk) { RegEnable(NxtWrPtr, 0.U, WrPtrEn) }
  RdPtr        := withClock(dma_free_clk) { RegEnable(NxtRdPtr, 0.U, RdPtrEn.asBool) }
  RspPtr       := withClock(dma_free_clk) { RegEnable(NxtRspPtr, 0.U, RspPtrEn.asBool) }
  // Miscellaneous signals
  val fifo_full_spec_bus = WireInit(Bool(),0.B)
  val fifo_full = fifo_full_spec_bus

  val num_fifo_vld = Wire(Vec(DEPTH+1,UInt(4.W)))
  val dbg_dma_bubble_bus = WireInit(Bool(),0.B)
  num_fifo_vld(0) := Cat(0.U(3.W),bus_cmd_sent) - Cat(0.U(3.W),bus_rsp_sent)
  for (i <- 1 to DEPTH) { num_fifo_vld(i):= num_fifo_vld(i-1) + Cat(0.U(3.W),fifo_valid(i-1))}
  val fifo_full_spec      = (num_fifo_vld(DEPTH) >= DEPTH.U)
  val dma_fifo_ready = ~(fifo_full | dbg_dma_bubble_bus)

  // Error logic
  val dma_mem_addr_in_dccm = WireInit(Bool(),0.B)
  val dma_mem_addr_in_iccm = WireInit(Bool(),0.B)
  val dma_mem_sz_int = WireInit(UInt(3.W),0.U)
  val dma_mem_addr_int = WireInit(UInt(32.W),0.U)
  val dma_mem_byteen = WireInit(UInt(8.W),0.U)
  dma_address_error  := fifo_valid(RdPtr) & ~fifo_done(RdPtr) & ~fifo_dbg(RdPtr) & (~(dma_mem_addr_in_dccm | dma_mem_addr_in_iccm))    // request not for ICCM or DCCM

  dma_alignment_error   := fifo_valid(RdPtr) & !fifo_done(RdPtr) & !fifo_dbg(RdPtr)  & !dma_address_error &
    (((dma_mem_sz_int(2,0) === 1.U) & dma_mem_addr_int(0)) |                                                                                // HW size but unaligned
      ((dma_mem_sz_int(2,0) === 2.U) & (dma_mem_addr_int(1, 0).orR)) |                                                                      // W size but unaligned
      ((dma_mem_sz_int(2,0) === 3.U) & (dma_mem_addr_int(2, 0).orR)) |                                                                      // DW size but unaligned
      (dma_mem_addr_in_iccm & ~((dma_mem_sz_int(1, 0) === 2.U) | (dma_mem_sz_int(1, 0) === 3.U)).asUInt  ) |                                // ICCM access not word size
      (dma_mem_addr_in_dccm & io.lsu_dma.dma_lsc_ctl.dma_mem_write & ~((dma_mem_sz_int(1, 0) === 2.U) | (dma_mem_sz_int(1, 0) === 3.U)).asUInt) |               // DCCM write not word size
      (io.lsu_dma.dma_lsc_ctl.dma_mem_write & (dma_mem_sz_int(2, 0) === 2.U) & (Mux1H(Seq((dma_mem_addr_int(2,0) === 0.U) -> (dma_mem_byteen(3,0)),
        (dma_mem_addr_int(2,0) === 1.U) -> (dma_mem_byteen(4,1)),
        (dma_mem_addr_int(2,0) === 2.U) -> (dma_mem_byteen(5,2)),
        (dma_mem_addr_int(2,0) === 3.U) -> (dma_mem_byteen(6,3)),
        (dma_mem_addr_int(2,0) === 4.U) -> (dma_mem_byteen(7,4)),
        (dma_mem_addr_int(2,0) === 5.U) -> (dma_mem_byteen(7,5)),
        (dma_mem_addr_int(2,0) === 6.U) -> (dma_mem_byteen(7,6)),
        (dma_mem_addr_int(2,0) === 7.U) -> (dma_mem_byteen(7)))) =/= "hf".U)) | // Write byte enables not aligned for word store
      (io.lsu_dma.dma_lsc_ctl.dma_mem_write & (dma_mem_sz_int(2, 0) === 3.U) & !((dma_mem_byteen(7,0) === "h0f".U) | (dma_mem_byteen(7,0) === "hf0".U) | (dma_mem_byteen(7,0) === "hff".U)))) // Write byte enables not aligned for dword store
  // Used to indicate ready to debug
  val fifo_empty     = ~(fifo_valid.orR | bus_cmd_sent)

  //Dbg outputs
  io.dbg_dma.dma_dbg_ready    := fifo_empty & io.dbg_dma.dbg_dma_bubble
  io.dma_dbg_cmd_done := (fifo_valid(RspPtr) & fifo_dbg(RspPtr) & fifo_done(RspPtr))
  io.dma_dbg_cmd_fail     := fifo_error(RspPtr).orR

  val dma_dbg_sz          = fifo_sz(RspPtr)(1,0)
  val dma_dbg_addr        = fifo_addr(RspPtr)(1,0)
  val dma_dbg_mem_rddata  = Mux(fifo_addr(RspPtr)(2), fifo_data(RspPtr)(63,32) , fifo_data(RspPtr)(31,0))
  io.dma_dbg_rddata      := Mux1H(Seq(
    (dma_dbg_sz(1,0) === "h0".U(2.W)) -> ((dma_dbg_mem_rddata >> ((8.U)*dma_dbg_addr(1,0))) & "hff".U) ,
    (dma_dbg_sz(1,0) === "h1".U(2.W)) -> ((dma_dbg_mem_rddata >> ((16.U)*dma_dbg_addr(1))) & "hffff".U) ,
    (dma_dbg_sz(1,0) === "h2".U(2.W)) -> dma_dbg_mem_rddata))

  // PIC memory address check

  val dma_mem_addr_in_pic           = rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(PIC_BASE_ADDR).U,PIC_SIZE)._1
  val dma_mem_addr_in_pic_region_nc = rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(PIC_BASE_ADDR).U,PIC_SIZE)._2

  dma_dbg_cmd_error := fifo_valid(RdPtr) & ~fifo_done(RdPtr) & fifo_dbg(RdPtr) &
    ((~(dma_mem_addr_in_dccm | dma_mem_addr_in_iccm | dma_mem_addr_in_pic)) |             // Address outside of ICCM/DCCM/PIC
      ((dma_mem_addr_in_iccm | dma_mem_addr_in_pic) & (dma_mem_sz_int(1,0) =/= 2.U)))    // Only word accesses allowed for ICCM/PIC

  dma_dbg_mem_wrdata := Mux1H(Seq(
    (io.dbg_cmd_size(1,0) === "h0".U(2.W)) -> Fill(4,io.dbg_dec_dma.dbg_dctl.dbg_cmd_wrdata(7,0)) ,
    (io.dbg_cmd_size(1,0) === "h1".U(2.W)) -> Fill(2,io.dbg_dec_dma.dbg_dctl.dbg_cmd_wrdata(15,0)),
    (io.dbg_cmd_size(1,0) === "h2".U(2.W)) -> io.dbg_dec_dma.dbg_dctl.dbg_cmd_wrdata ))

  // Block the decode if fifo full
  val dma_mem_req        = WireInit(Bool(),0.B)
  val dma_nack_count     = WireInit(UInt(3.W),0.U)
  val dma_nack_count_csr = WireInit(UInt(3.W),0.U)
  val dma_nack_count_d   = WireInit(UInt(3.W),0.U)
  io.dec_dma.dctl_dma.dma_dccm_stall_any := dma_mem_req & (dma_mem_addr_in_dccm | dma_mem_addr_in_pic) & (dma_nack_count >= dma_nack_count_csr)
  io.dec_dma.tlu_dma.dma_dccm_stall_any := io.dec_dma.dctl_dma.dma_dccm_stall_any
  io.dec_dma.tlu_dma.dma_iccm_stall_any := dma_mem_req & dma_mem_addr_in_iccm & (dma_nack_count >= dma_nack_count_csr)
  io.ifu_dma.dma_ifc.dma_iccm_stall_any :=  io.dec_dma.tlu_dma.dma_iccm_stall_any
  // Nack counter, stall the lsu pipe if 7 nacks
  dma_nack_count_csr := io.dec_dma.tlu_dma.dec_tlu_dma_qos_prty
  dma_nack_count_d   := Mux((dma_nack_count >= dma_nack_count_csr), (Fill(3,(!(io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req))) & dma_nack_count),
    Mux((dma_mem_req & ~(io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req)), (dma_nack_count + 1.U), 0.U(3.W)))
  dma_nack_count := withClock(dma_free_clk){RegEnable(dma_nack_count_d,0.U,dma_mem_req)}


  // Core outputs
  dma_mem_req          := fifo_valid(RdPtr) & ~fifo_rpend(RdPtr) & ~fifo_done(RdPtr) & ~(dma_address_error | dma_alignment_error | dma_dbg_cmd_error)
  io.lsu_dma.dma_lsc_ctl.dma_dccm_req      := dma_mem_req & (dma_mem_addr_in_dccm | dma_mem_addr_in_pic) & io.lsu_dma.dccm_ready
  io.ifu_dma.dma_mem_ctl.dma_iccm_req      := dma_mem_req & dma_mem_addr_in_iccm & io.iccm_ready
  io.lsu_dma.dma_mem_tag       := RdPtr
  io.ifu_dma.dma_mem_ctl.dma_mem_tag :=    io.lsu_dma.dma_mem_tag
  dma_mem_addr_int     := fifo_addr(RdPtr)
  dma_mem_sz_int       := fifo_sz(RdPtr)
  io.lsu_dma.dma_dccm_ctl.dma_mem_addr      := Mux((io.lsu_dma.dma_lsc_ctl.dma_mem_write & ~fifo_dbg(RdPtr) & (dma_mem_byteen === "hf0".U(8.W))), Cat(dma_mem_addr_int(31,3),1.U,dma_mem_addr_int(1,0)), dma_mem_addr_int)
  io.lsu_dma.dma_lsc_ctl.dma_mem_addr :=  io.lsu_dma.dma_dccm_ctl.dma_mem_addr
  io.ifu_dma.dma_mem_ctl.dma_mem_addr :=   io.lsu_dma.dma_dccm_ctl.dma_mem_addr
  io.lsu_dma.dma_lsc_ctl.dma_mem_sz        := Mux(io.lsu_dma.dma_lsc_ctl.dma_mem_write & ~fifo_dbg(RdPtr) & ((dma_mem_byteen === "h0f".U(8.W)) | (dma_mem_byteen === "hf0".U(8.W))), 2.U(3.W), dma_mem_sz_int)
  io.ifu_dma.dma_mem_ctl.dma_mem_sz :=   io.lsu_dma.dma_lsc_ctl.dma_mem_sz
  dma_mem_byteen       := fifo_byteen(RdPtr)
  io.lsu_dma.dma_lsc_ctl.dma_mem_write     := fifo_write(RdPtr)
  io.ifu_dma.dma_mem_ctl.dma_mem_write :=  io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.lsu_dma.dma_dccm_ctl.dma_mem_wdata     := fifo_data(RdPtr)
  io.lsu_dma.dma_lsc_ctl.dma_mem_wdata :=  io.lsu_dma.dma_dccm_ctl.dma_mem_wdata
  io.ifu_dma.dma_mem_ctl.dma_mem_wdata :=  io.lsu_dma.dma_dccm_ctl.dma_mem_wdata

  // PMU outputs
  io.dec_dma.tlu_dma.dma_pmu_dccm_read   := io.lsu_dma.dma_lsc_ctl.dma_dccm_req & ~io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.dec_dma.tlu_dma.dma_pmu_dccm_write  := io.lsu_dma.dma_lsc_ctl.dma_dccm_req & io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.dec_dma.tlu_dma.dma_pmu_any_read    := (io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & ~io.lsu_dma.dma_lsc_ctl.dma_mem_write
  io.dec_dma.tlu_dma.dma_pmu_any_write   := (io.lsu_dma.dma_lsc_ctl.dma_dccm_req | io.ifu_dma.dma_mem_ctl.dma_iccm_req) & io.lsu_dma.dma_lsc_ctl.dma_mem_write

  // Address check  dccm
  val dma_mem_addr_in_dccm_region_nc     = WireInit(Bool(),0.B)
  if (DCCM_ENABLE){
    dma_mem_addr_in_dccm           := rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(DCCM_SADR).U,DCCM_SIZE)._1
    dma_mem_addr_in_dccm_region_nc := rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(DCCM_SADR).U,DCCM_SIZE)._2
  } else{
    dma_mem_addr_in_dccm := 0.U
    dma_mem_addr_in_dccm_region_nc := 0.U
  }


  // Address check  iccm
  val dma_mem_addr_in_iccm_region_nc     = WireInit(Bool(),0.B)
  if (ICCM_ENABLE) {
    dma_mem_addr_in_iccm           := rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(ICCM_SADR).U,ICCM_SIZE)._1
    dma_mem_addr_in_iccm_region_nc := rvrangecheck_ch(dma_mem_addr_int(31,0),aslong(ICCM_SADR).U,ICCM_SIZE)._2

  }else {
    dma_mem_addr_in_iccm := 0.U
    dma_mem_addr_in_iccm_region_nc := 0.U
  }


  val dma_bus_clk = Wire(Clock())
  if(RV_FPGA_OPTIMIZE) dma_bus_clk := 0.B.asClock()
  else  dma_bus_clk := rvclkhdr(clock,io.dma_bus_clk_en,io.scan_mode)//  dma_bus_cgc (.en(dma_bus_clk_en), .l1clk(dma_bus_clk), .*)

  // Inputs
  fifo_full_spec_bus := rvdff_fpga(fifo_full_spec,dma_bus_clk,io.dma_bus_clk_en,clock)
  dbg_dma_bubble_bus := rvdff_fpga(io.dbg_dma.dbg_dma_bubble,dma_bus_clk,io.dma_bus_clk_en,clock)
  dma_dbg_cmd_done_q := withClock(io.free_clk){ RegNext(io.dma_dbg_cmd_done,0.U)}

  // Write channel buffer
  val wrbuf_en       = io.dma_axi.aw.valid & io.dma_axi.aw.ready
  val wrbuf_data_en  = io.dma_axi.w.valid & io.dma_axi.w.ready
  val wrbuf_cmd_sent = bus_cmd_sent & bus_cmd_write
  val wrbuf_rst      = wrbuf_cmd_sent & ~wrbuf_en
  val wrbuf_data_rst = wrbuf_cmd_sent & ~wrbuf_data_en

  val wrbuf_vld      = rvdffsc_fpga(1.B,wrbuf_en,wrbuf_rst,dma_bus_clk,io.dma_bus_clk_en,clock)
  val wrbuf_data_vld = rvdffsc_fpga(1.B,wrbuf_data_en,wrbuf_data_rst,dma_bus_clk,io.dma_bus_clk_en,clock)
  val wrbuf_tag = rvdffs_fpga(io.dma_axi.aw.bits.id,wrbuf_en,dma_bus_clk,io.dma_bus_clk_en,clock)
  val wrbuf_sz = rvdffs_fpga(io.dma_axi.aw.bits.size,wrbuf_en,dma_bus_clk,io.dma_bus_clk_en,clock)
  val wrbuf_addr = rvdffe(io.dma_axi.aw.bits.addr,wrbuf_en & io.dma_bus_clk_en,clock,io.scan_mode)
  val wrbuf_data = rvdffe(io.dma_axi.w.bits.data,wrbuf_data_en & io.dma_bus_clk_en,clock,io.scan_mode)
  val wrbuf_byteen = rvdffs_fpga(io.dma_axi.w.bits.strb,wrbuf_data_en,dma_bus_clk,io.dma_bus_clk_en,clock)

  // Read channel buffer
  val rdbuf_en    = io.dma_axi.ar.valid & io.dma_axi.ar.ready
  val rdbuf_cmd_sent = bus_cmd_sent & ~bus_cmd_write
  val rdbuf_rst   = rdbuf_cmd_sent & ~rdbuf_en

  val rdbuf_vld  = rvdffsc_fpga(1.B,rdbuf_en,rdbuf_rst,dma_bus_clk,io.dma_bus_clk_en,clock)
  val rdbuf_tag  = rvdffs_fpga(io.dma_axi.ar.bits.id,rdbuf_en,dma_bus_clk,io.dma_bus_clk_en,clock)
  val rdbuf_sz   = rvdffs_fpga(io.dma_axi.ar.bits.size,rdbuf_en,dma_bus_clk,io.dma_bus_clk_en,clock)
  val rdbuf_addr = rvdffe(io.dma_axi.ar.bits.addr,rdbuf_en & io.dma_bus_clk_en,clock,io.scan_mode)

  io.dma_axi.aw.ready := ~(wrbuf_vld & ~wrbuf_cmd_sent)
  io.dma_axi.w.ready  := ~(wrbuf_data_vld & ~wrbuf_cmd_sent)
  io.dma_axi.ar.ready := ~(rdbuf_vld & ~rdbuf_cmd_sent)

  //Generate a single request from read/write channel
  val axi_mstr_sel = WireInit(Bool(),0.B)
  bus_cmd_valid               := (wrbuf_vld & wrbuf_data_vld) | rdbuf_vld
  bus_cmd_sent                := bus_cmd_valid & dma_fifo_ready
  bus_cmd_write               := axi_mstr_sel
  bus_cmd_posted_write        := 0.U
  bus_cmd_addr                := Mux(axi_mstr_sel, wrbuf_addr, rdbuf_addr)
  bus_cmd_sz                  := Mux(axi_mstr_sel, wrbuf_sz, rdbuf_sz)
  bus_cmd_wdata               := wrbuf_data
  bus_cmd_byteen              := wrbuf_byteen
  bus_cmd_tag                 := Mux(axi_mstr_sel, wrbuf_tag, rdbuf_tag)
  bus_cmd_mid                 := 0.U
  bus_cmd_prty                := 0.U

  // Sel=1 -> write has higher priority
  val axi_mstr_priority = WireInit(Bool(),0.B)
  axi_mstr_sel     := Mux(((wrbuf_vld & wrbuf_data_vld & rdbuf_vld)===1.U).asBool(), axi_mstr_priority, (wrbuf_vld & wrbuf_data_vld) )
  val axi_mstr_prty_in = ~axi_mstr_priority
  val axi_mstr_prty_en = bus_cmd_sent
  axi_mstr_priority   := rvdffs_fpga(axi_mstr_prty_in.asUInt(),axi_mstr_prty_en,dma_bus_clk,io.dma_bus_clk_en,clock)

  val axi_rsp_valid        = fifo_valid(RspPtr) & ~fifo_dbg(RspPtr) & fifo_done_bus(RspPtr)
  val axi_rsp_rdata        = fifo_data(RspPtr)
  val axi_rsp_write        = fifo_write(RspPtr)
  val axi_rsp_error        = Mux(fifo_error(RspPtr)(0), 2.U,Mux(fifo_error(RspPtr)(1), 3.U, 0.U))
  val axi_rsp_tag          = fifo_tag(RspPtr)

  // AXI response channel signals
  io.dma_axi.b.valid        := axi_rsp_valid & axi_rsp_write
  io.dma_axi.b.bits.resp         := axi_rsp_error
  io.dma_axi.b.bits.id           := axi_rsp_tag

  io.dma_axi.r.valid        := axi_rsp_valid & ~axi_rsp_write
  io.dma_axi.r.bits.resp         := axi_rsp_error
  io.dma_axi.r.bits.data         := axi_rsp_rdata
  io.dma_axi.r.bits.last         := 1.U
  io.dma_axi.r.bits.id           := axi_rsp_tag

  bus_posted_write_done := 0.U
  bus_rsp_valid      := (io.dma_axi.b.valid | io.dma_axi.r.valid)
  bus_rsp_sent       := (io.dma_axi.b.valid & io.dma_axi.b.ready) | (io.dma_axi.r.valid & io.dma_axi.r.ready)

  io.dma_active  := wrbuf_vld | rdbuf_vld | (fifo_valid.orR)

}
object DMA extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new dma_ctrl))
}
