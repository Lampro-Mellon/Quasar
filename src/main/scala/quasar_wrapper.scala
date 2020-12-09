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

    val trace = new trace_pkt_t
//    val trace_rv_i_insn_ip = Output(UInt(32.W))
//    val trace_rv_i_address_ip = Output(UInt(32.W))
//    val trace_rv_i_valid_ip = Output(UInt(2.W))
//    val trace_rv_i_exception_ip = Output(UInt(2.W))
//    val trace_rv_i_ecause_ip = Output(UInt(5.W))
//    val trace_rv_i_interrupt_ip = Output(UInt(2.W))
//    val trace_rv_i_tval_ip = Output(UInt(32.W))

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

    val scan_mode = Input(Bool())

})
  val mem = Module(new quasar.mem())
  val dmi_wrapper = Module(new dmi_wrapper())
  val swerv = Module(new quasar())
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
  mem.io.dccm <> swerv.io.swerv_mem
//  mem.io.iccm_rw_addr := swerv.io.iccm_rw_addr
//  mem.io.iccm_buf_correct_ecc := swerv.io.iccm_buf_correct_ecc
//  mem.io.iccm_correction_state := swerv.io.iccm_correction_state
//  mem.io.iccm_wren := swerv.io.iccm_wren
//  mem.io.iccm_rden := swerv.io.iccm_rden
//  mem.io.iccm_wr_size := swerv.io.iccm_wr_size
//  mem.io.iccm_wr_data := swerv.io.iccm_wr_data


//  mem.io.ic_rw_addr := swerv.io.ic_rw_addr
//  mem.io.ic_tag_valid := swerv.io.ic_tag_valid
//  mem.io.ic_wr_en := swerv.io.ic_wr_en
//  mem.io.ic_rd_en := swerv.io.ic_rd_en
//  mem.io.ic_premux_data := swerv.io.ic_premux_data
//  mem.io.ic_sel_premux_data := swerv.io.ic_sel_premux_data
//  mem.io.ic_wr_data := swerv.io.ic_wr_data
//  mem.io.ic_debug_wr_data := swerv.io.ic_debug_wr_data
//
//  mem.io.ic_debug_addr := swerv.io.ic_debug_addr
//  mem.io.ic_debug_rd_en := swerv.io.ic_debug_rd_en
//  mem.io.ic_debug_wr_en := swerv.io.ic_debug_wr_en
//  mem.io.ic_debug_tag_array := swerv.io.ic_debug_tag_array
//  mem.io.ic_debug_way := swerv.io.ic_debug_way
  mem.io.rst_l := reset
  mem.io.clk := clock
  mem.io.scan_mode := io.scan_mode
  // Memory outputs
  swerv.io.dbg_rst_l := io.dbg_rst_l
  swerv.io.ic <> mem.io.ic
  swerv.io.iccm <> mem.io.iccm
 // swerv.io.iccm_rd_data_ecc := mem.io.iccm_rd_data_ecc
//  swerv.io.dccm_rd_data_hi := mem.io.dccm_rd_data_hi
//  swerv.io.ic_rd_data := mem.io.ic_rd_data
//  swerv.io.ictag_debug_rd_data := mem.io.ictag_debug_rd_data
//  swerv.io.ic_eccerr := mem.io.ic_eccerr
//  swerv.io.ic_parerr := mem.io.ic_parerr
//  swerv.io.ic_rd_hit := mem.io.ic_rd_hit
//  swerv.io.ic_tag_perr := mem.io.ic_tag_perr
//  swerv.io.ic_debug_rd_data := mem.io.ic_debug_rd_data
//  swerv.io.iccm_rd_data := mem.io.iccm_rd_data
  swerv.io.sb_hready := 0.U
  swerv.io.hrdata := 0.U
  swerv.io.sb_hresp := 0.U
  swerv.io.lsu_hrdata := 0.U
  swerv.io.lsu_hresp := 0.U
  swerv.io.lsu_hready := 0.U
  swerv.io.hready := 0.U
  swerv.io.hresp := 0.U
  swerv.io.sb_hrdata := 0.U
  swerv.io.scan_mode := io.scan_mode
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

  //-------------------------- LSU AXI signals--------------------------
  // AXI Write Channels
  swerv.io.lsu_axi <> io.lsu_axi
  //-------------------------- IFU AXI signals--------------------------
  // AXI Write Channels
  swerv.io.ifu_axi <> io.ifu_axi
  //-------------------------- SB AXI signals--------------------------
  // AXI Write Channels
  swerv.io.sb_axi <> io.sb_axi

  //-------------------------- DMA AXI signals--------------------------
  // AXI Write Channels
  swerv.io.dma_axi <> io.dma_axi

  // DMA Slave
  swerv.io.dma_hsel := io.dma_hsel
  swerv.io.dma_haddr := io.dma_haddr
  swerv.io.dma_hburst := io.dma_hburst
  swerv.io.dma_hmastlock := io.dma_hmastlock
  swerv.io.dma_hprot := io.dma_hprot
  swerv.io.dma_hsize := io.dma_hsize
  swerv.io.dma_htrans := io.dma_htrans
  swerv.io.dma_hwrite := io.dma_hwrite
  swerv.io.dma_hwdata := io.dma_hwdata
  swerv.io.dma_hreadyin := io.dma_hreadyin

  swerv.io.lsu_bus_clk_en
  swerv.io.ifu_bus_clk_en
  swerv.io.dbg_bus_clk_en
  swerv.io.dma_bus_clk_en

  swerv.io.dmi_reg_en
  swerv.io.dmi_reg_addr
  swerv.io.dmi_reg_wr_en
  swerv.io.dmi_reg_wdata
  swerv.io.dmi_hard_reset

  swerv.io.extintsrc_req
  swerv.io.timer_int
  swerv.io.soft_int
  swerv.io.scan_mode

  swerv.io.lsu_bus_clk_en := io.lsu_bus_clk_en
  swerv.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  swerv.io.dbg_bus_clk_en := io.dbg_bus_clk_en
  swerv.io.dma_bus_clk_en := io.dma_bus_clk_en

  swerv.io.timer_int := io.timer_int
  swerv.io.soft_int := io.soft_int
  swerv.io.extintsrc_req := io.extintsrc_req

  // Outputs
  val core_rst_l = swerv.io.core_rst_l
  io.trace <> swerv.io.trace
//  io.trace_rv_i_insn_ip := swerv.io.trace_rv_i_insn_ip
//  io.trace_rv_i_address_ip := swerv.io.trace_rv_i_address_ip
//  io.trace_rv_i_valid_ip := swerv.io.trace_rv_i_valid_ip
//  io.trace_rv_i_exception_ip := swerv.io.trace_rv_i_exception_ip
//  io.trace_rv_i_ecause_ip := swerv.io.trace_rv_i_ecause_ip
//  io.trace_rv_i_interrupt_ip := swerv.io.trace_rv_i_interrupt_ip
//  io.trace_rv_i_tval_ip := swerv.io.trace_rv_i_tval_ip

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


  //-------------------------- LSU AXI signals--------------------------
  // AXI Write Channels

  // DMA Slave
  io.dma_hrdata := swerv.io.dma_hrdata
  io.dma_hreadyout := swerv.io.dma_hreadyout
  io.dma_hresp := swerv.io.dma_hresp

}
object QUASAR_Wrp extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new quasar_wrapper()))
}