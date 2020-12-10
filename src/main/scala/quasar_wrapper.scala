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
    val lsu_axi = new axi_channels(LSU_BUS_TAG)
    val ifu_axi = new axi_channels(IFU_BUS_TAG)
    val sb_axi = new axi_channels(SB_BUS_TAG)
    val dma_axi = Flipped(new axi_channels(DMA_BUS_TAG))

    // DMA slave
    val dma_hsel = Input(Bool())
    val dma_haddr = Input(UInt(32.W))
    val dma_hburst = Input(UInt(3.W))
    val dma_hmastlock = Input(Bool())
    val dma_hprot = Input(UInt(4.W))
    val dma_hsize = Input(UInt(3.W))
    val dma_htrans = Input(UInt(2.W))
    val dma_hwrite = Input(Bool())
    val dma_hwdata = Input(UInt(64.W))
    val dma_hreadyin = Input(Bool())
    val dma_hrdata = Output(UInt(64.W))
    val dma_hreadyout = Output(Bool())
    val dma_hresp = Output(Bool())

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
  val core = Module(new quasar())
  dmi_wrapper.io.trst_n := io.jtag_trst_n
  dmi_wrapper.io.tck := io.jtag_tck
  dmi_wrapper.io.tms := io.jtag_tms
  dmi_wrapper.io.tdi := io.jtag_tdi
  dmi_wrapper.io.core_clk := clock
  dmi_wrapper.io.jtag_id := io.jtag_id
  dmi_wrapper.io.rd_data := core.io.dmi_reg_rdata


  dmi_wrapper.io.core_rst_n := io.dbg_rst_l
  core.io.dmi_reg_wdata := dmi_wrapper.io.reg_wr_data
  core.io.dmi_reg_addr := dmi_wrapper.io.reg_wr_addr
  core.io.dmi_reg_en := dmi_wrapper.io.reg_en
  core.io.dmi_reg_wr_en := dmi_wrapper.io.reg_wr_en
  core.io.dmi_hard_reset := dmi_wrapper.io.dmi_hard_reset
  io.jtag_tdo := dmi_wrapper.io.tdo

  // Memory signals
  mem.io.dccm_clk_override := core.io.dccm_clk_override
  mem.io.icm_clk_override := core.io.icm_clk_override
  mem.io.dec_tlu_core_ecc_disable := core.io.dec_tlu_core_ecc_disable
  mem.io.dccm <> core.io.dccm
  mem.io.rst_l := reset
  mem.io.clk := clock
  mem.io.scan_mode := io.scan_mode
  // Memory outputs
  core.io.dbg_rst_l := io.dbg_rst_l
  core.io.ic <> mem.io.ic
  core.io.iccm <> mem.io.iccm
  core.io.sb_hready := 0.U
  core.io.hrdata := 0.U
  core.io.sb_hresp := 0.U
  core.io.lsu_hrdata := 0.U
  core.io.lsu_hresp := 0.U
  core.io.lsu_hready := 0.U
  core.io.hready := 0.U
  core.io.hresp := 0.U
  core.io.sb_hrdata := 0.U
  core.io.scan_mode := io.scan_mode
  // SweRV Inputs
  core.io.dbg_rst_l := io.dbg_rst_l
  core.io.rst_vec := io.rst_vec
  core.io.nmi_int := io.nmi_int
  core.io.nmi_vec := io.nmi_vec

  // external halt/run interface
  core.io.i_cpu_halt_req := io.i_cpu_halt_req
  core.io.i_cpu_run_req := io.i_cpu_run_req
  core.io.core_id := io.core_id

  // external MPC halt/run interface
  core.io.mpc_debug_halt_req := io.mpc_debug_halt_req
  core.io.mpc_debug_run_req := io.mpc_debug_run_req
  core.io.mpc_reset_run_req := io.mpc_reset_run_req

  //-------------------------- LSU AXI signals--------------------------
  // AXI Write Channels
  core.io.lsu_axi <> io.lsu_axi
  //-------------------------- IFU AXI signals--------------------------
  // AXI Write Channels
  core.io.ifu_axi <> io.ifu_axi
  //-------------------------- SB AXI signals--------------------------
  // AXI Write Channels
  core.io.sb_axi <> io.sb_axi

  //-------------------------- DMA AXI signals--------------------------
  // AXI Write Channels
  core.io.dma_axi <> io.dma_axi

  // DMA Slave
  core.io.dma_hsel := io.dma_hsel
  core.io.dma_haddr := io.dma_haddr
  core.io.dma_hburst := io.dma_hburst
  core.io.dma_hmastlock := io.dma_hmastlock
  core.io.dma_hprot := io.dma_hprot
  core.io.dma_hsize := io.dma_hsize
  core.io.dma_htrans := io.dma_htrans
  core.io.dma_hwrite := io.dma_hwrite
  core.io.dma_hwdata := io.dma_hwdata
  core.io.dma_hreadyin := io.dma_hreadyin

  core.io.lsu_bus_clk_en := io.lsu_bus_clk_en
  core.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  core.io.dbg_bus_clk_en := io.dbg_bus_clk_en
  core.io.dma_bus_clk_en := io.dma_bus_clk_en

  core.io.timer_int := io.timer_int
  core.io.soft_int := io.soft_int
  core.io.extintsrc_req := io.extintsrc_req

  // Outputs
  val core_rst_l = core.io.core_rst_l
  io.rv_trace_pkt := core.io.rv_trace_pkt

  // external halt/run interface
  io.o_cpu_halt_ack := core.io.o_cpu_halt_ack
  io.o_cpu_halt_status := core.io.o_cpu_halt_status
  io.o_cpu_run_ack := core.io.o_cpu_run_ack
  io.o_debug_mode_status := core.io.o_debug_mode_status

  io.mpc_debug_halt_ack := core.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack := core.io.mpc_debug_run_ack
  io.debug_brkpt_status := core.io.debug_brkpt_status

  io.dec_tlu_perfcnt0 := core.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1 := core.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2 := core.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3 := core.io.dec_tlu_perfcnt3


  //-------------------------- LSU AXI signals--------------------------
  // AXI Write Channels

  // DMA Slave
  io.dma_hrdata := core.io.dma_hrdata
  io.dma_hreadyout := core.io.dma_hreadyout
  io.dma_hresp := core.io.dma_hresp

}