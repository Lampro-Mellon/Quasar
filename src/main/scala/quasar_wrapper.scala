import chisel3._
import mem._
import chisel3.util._
import dmi._
import include._
import lib._
class quasar_wrapper extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val dbg_rst_l = Input(AsyncReset())
    val rst_vec = Input(UInt(31.W))
    val nmi_int = Input(Bool())
    val nmi_vec = Input(UInt(31.W))
    val jtag_id = Input(UInt(31.W))

    // AXI Signals
    val lsu_brg = bridge_gen(LSU_BUS_TAG, false)
    val ifu_brg = bridge_gen(IFU_BUS_TAG, false)
    val sb_brg = bridge_gen(SB_BUS_TAG, false)
    val dma_brg = Flipped(bridge_gen(DMA_BUS_TAG, true))

    val lsu_bus_clk_en = Input(Bool())
    val ifu_bus_clk_en = Input(Bool())
    val dbg_bus_clk_en = Input(Bool())
    val dma_bus_clk_en = Input(Bool())

    val timer_int = Input(Bool())
    val soft_int = Input(Bool())

    val extintsrc_req = Input(UInt(PIC_TOTAL_INT.W))

    val dec_tlu_perfcnt0 = Output(Bool())
    val dec_tlu_perfcnt1 = Output(Bool())
    val dec_tlu_perfcnt2 = Output(Bool())
    val dec_tlu_perfcnt3 = Output(Bool())

    val jtag_tck = Input(Clock())
    val jtag_tms = Input(Bool())
    val jtag_tdi = Input(Bool())
    val jtag_trst_n = Input(Bool())
    val jtag_tdo = Output(Bool())

    val core_id = Input(UInt(28.W))

    val mpc_debug_halt_req = Input(Bool())
    val mpc_debug_run_req = Input(Bool())
    val mpc_reset_run_req = Input(Bool())
    val mpc_debug_halt_ack = Output(Bool())
    val mpc_debug_run_ack = Output(Bool())
    val debug_brkpt_status = Output(Bool())

    val i_cpu_halt_req = Input(Bool())
    val i_cpu_run_req = Input(Bool())
    val o_cpu_halt_ack = Output(Bool())
    val o_cpu_halt_status = Output(Bool())
    val o_debug_mode_status = Output(Bool())
    val o_cpu_run_ack = Output(Bool())
    val mbist_mode = Input(Bool())

    val rv_trace_pkt = new trace_pkt_t()
    val scan_mode = Input(Bool())

  })
  val mem = Module(new quasar.mem())
  val dmi_wrapper = Module(new dmi_wrapper())
  val swerv = Module(new quasar())
  swerv.io.scan_mode := io.scan_mode
  dmi_wrapper.io.trst_n := io.jtag_trst_n
  dmi_wrapper.io.tck := io.jtag_tck
  dmi_wrapper.io.tms := io.jtag_tms
  dmi_wrapper.io.tdi := io.jtag_tdi
  dmi_wrapper.io.core_clk := clock
  dmi_wrapper.io.jtag_id := io.jtag_id
  dmi_wrapper.io.rd_data := swerv.io.dmi_reg_rdata


  dmi_wrapper.io.core_rst_n := io.dbg_rst_l
  swerv.io.dmi_reg_wdata := dmi_wrapper.io.reg_wr_data
  swerv.io.dmi_reg_addr := dmi_wrapper.io.reg_wr_addr
  swerv.io.dmi_reg_en := dmi_wrapper.io.reg_en
  swerv.io.dmi_reg_wr_en := dmi_wrapper.io.reg_wr_en
  swerv.io.dmi_hard_reset := dmi_wrapper.io.dmi_hard_reset
  io.jtag_tdo := dmi_wrapper.io.tdo

  // Memory signals
  mem.io.dccm_clk_override := swerv.io.dccm_clk_override
  mem.io.icm_clk_override := swerv.io.icm_clk_override
  mem.io.dec_tlu_core_ecc_disable := swerv.io.dec_tlu_core_ecc_disable
  mem.io.dccm <> swerv.io.dccm
  mem.io.rst_l := reset
  mem.io.clk := clock
  mem.io.scan_mode := io.scan_mode
  // Memory outputs
  swerv.io.dbg_rst_l := io.dbg_rst_l
  swerv.io.ic <> mem.io.ic
  swerv.io.iccm <> mem.io.iccm


  if(BUILD_AXI4) {
    swerv.io.ahb.in <> 0.U.asTypeOf(swerv.io.ahb.in)
    swerv.io.lsu_ahb.in <> 0.U.asTypeOf(swerv.io.lsu_ahb.in)
    swerv.io.sb_ahb.in <> 0.U.asTypeOf(swerv.io.sb_ahb.in)
    swerv.io.dma.ahb.out <> 0.U.asTypeOf(swerv.io.dma.ahb.out)
    swerv.io.dma.hsel := 0.U
    swerv.io.dma.hreadyin := 0.U
    swerv.io.lsu_axi <> io.lsu_brg
    swerv.io.ifu_axi <> io.ifu_brg
    swerv.io.sb_axi <> io.sb_brg
    swerv.io.dma_axi <> io.dma_brg
  }
  else {
    swerv.io.ahb <> io.ifu_brg
    swerv.io.lsu_ahb <> io.lsu_brg
    swerv.io.sb_ahb <> io.sb_brg
    swerv.io.dma <> io.dma_brg

    swerv.io.lsu_axi <> 0.U.asTypeOf(swerv.io.lsu_axi)
    swerv.io.ifu_axi <> 0.U.asTypeOf(swerv.io.ifu_axi)
    swerv.io.sb_axi <> 0.U.asTypeOf(swerv.io.sb_axi)
    swerv.io.dma_axi <> 0.U.asTypeOf(swerv.io.lsu_axi)
  }
  // SweRV Inputs
  swerv.io.dbg_rst_l := io.dbg_rst_l
  swerv.io.rst_vec := io.rst_vec
  swerv.io.nmi_int := io.nmi_int
  swerv.io.nmi_vec := io.nmi_vec

  // external halt/run interface
  swerv.io.i_cpu_halt_req := io.i_cpu_halt_req
  swerv.io.i_cpu_run_req := io.i_cpu_run_req
  swerv.io.core_id := io.core_id

  // external MPC halt/run interface
  swerv.io.mpc_debug_halt_req := io.mpc_debug_halt_req
  swerv.io.mpc_debug_run_req := io.mpc_debug_run_req
  swerv.io.mpc_reset_run_req := io.mpc_reset_run_req

  swerv.io.lsu_bus_clk_en := io.lsu_bus_clk_en
  swerv.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  swerv.io.dbg_bus_clk_en := io.dbg_bus_clk_en
  swerv.io.dma_bus_clk_en := io.dma_bus_clk_en

  swerv.io.timer_int := io.timer_int
  swerv.io.soft_int := io.soft_int
  swerv.io.extintsrc_req := io.extintsrc_req

  // Outputs
  val core_rst_l = swerv.io.core_rst_l
  io.rv_trace_pkt := swerv.io.rv_trace_pkt

  // external halt/run interface
  io.o_cpu_halt_ack := swerv.io.o_cpu_halt_ack
  io.o_cpu_halt_status := swerv.io.o_cpu_halt_status
  io.o_cpu_run_ack := swerv.io.o_cpu_run_ack
  io.o_debug_mode_status := swerv.io.o_debug_mode_status

  io.mpc_debug_halt_ack := swerv.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack := swerv.io.mpc_debug_run_ack
  io.debug_brkpt_status := swerv.io.debug_brkpt_status

  io.dec_tlu_perfcnt0 := swerv.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1 := swerv.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2 := swerv.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3 := swerv.io.dec_tlu_perfcnt3

}
object QUASAR_Wrp extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new quasar_wrapper()))
}