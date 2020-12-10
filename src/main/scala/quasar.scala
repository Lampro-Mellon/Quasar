import chisel3._
import chisel3.util._
import ifu._
import dec._
import exu._
import lsu._
import lib._
import include._
import dbg._
import mem.mem_lsu
class quasar_bundle extends Bundle with  lib{
  val lsu_axi = new axi_channels(LSU_BUS_TAG)
  val ifu_axi = new axi_channels(IFU_BUS_TAG)
  val sb_axi  = new axi_channels(SB_BUS_TAG)
  val dma_axi = Flipped(new axi_channels(DMA_BUS_TAG))

  val dbg_rst_l = Input(AsyncReset())
  val rst_vec = Input(UInt(31.W))
  val nmi_int = Input(Bool())
  val nmi_vec = Input(UInt(31.W))
  val core_rst_l = Output(AsyncReset())
  val rv_trace_pkt = new trace_pkt_t()
  val dccm_clk_override = Output(Bool())
  val icm_clk_override = Output(Bool())
  val dec_tlu_core_ecc_disable = Output(Bool())
  val i_cpu_halt_req = Input(Bool())
  val i_cpu_run_req = Input(Bool())
  val o_cpu_halt_ack = Output(Bool())
  val o_cpu_halt_status = Output(Bool())
  val o_cpu_run_ack = Output(Bool())
  val o_debug_mode_status = Output(Bool())
  val core_id = Input(UInt(28.W))
  val mpc_debug_halt_req = Input(Bool())
  val mpc_debug_run_req = Input(Bool())
  val mpc_reset_run_req = Input(Bool())
  val mpc_debug_halt_ack = Output(Bool())
  val mpc_debug_run_ack = Output(Bool())
  val debug_brkpt_status = Output(Bool())
  val dec_tlu_perfcnt0 = Output(Bool())
  val dec_tlu_perfcnt1 = Output(Bool())
  val dec_tlu_perfcnt2 = Output(Bool())
  val dec_tlu_perfcnt3 = Output(Bool())
  val dccm = Flipped(new mem_lsu)
  val ic = new ic_mem()
  val iccm = new iccm_mem()

  // AHB Lite Bus
  val haddr = Output(UInt(32.W))
  val hburst = Output(UInt(3.W))
  val hmastlock = Output(Bool())
  val hprot = Output(UInt(4.W))
  val hsize = Output(UInt(3.W))
  val htrans = Output(UInt(2.W))
  val hwrite = Output(Bool())
  val hrdata = Input(UInt(64.W))
  val hready = Input(Bool())
  val hresp = Input(Bool())

  // AHB Master
  val lsu_haddr = Output(UInt(32.W))
  val lsu_hburst = Output(UInt(3.W))
  val lsu_hmastlock = Output(Bool())
  val lsu_hprot = Output(UInt(4.W))
  val lsu_hsize = Output(UInt(3.W))
  val lsu_htrans = Output(UInt(2.W))
  val lsu_hwrite = Output(Bool())
  val lsu_hwdata = Output(UInt(64.W))
  val lsu_hrdata = Input(UInt(64.W))
  val lsu_hready = Input(Bool())
  val lsu_hresp = Input(Bool())

  // System Bus Debug Master
  val sb_haddr = Output(UInt(32.W))
  val sb_hburst = Output(UInt(3.W))
  val sb_hmastlock = Output(Bool())
  val sb_hprot = Output(UInt(4.W))
  val sb_hsize = Output(UInt(3.W))
  val sb_htrans = Output(UInt(2.W))
  val sb_hwrite = Output(Bool())
  val sb_hwdata = Output(UInt(64.W))
  val sb_hrdata = Input(UInt(64.W))
  val sb_hready = Input(Bool())
  val sb_hresp = Input(Bool())

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
  val dmi_reg_en = Input(Bool())
  val dmi_reg_addr = Input(UInt(7.W))
  val dmi_reg_wr_en = Input(Bool())
  val dmi_reg_wdata = Input(UInt(32.W))
  val dmi_reg_rdata = Output(UInt(32.W))
  val dmi_hard_reset = Input(Bool())
  val extintsrc_req = Input(UInt(PIC_TOTAL_INT.W))
  val timer_int = Input(Bool())
  val soft_int = Input(Bool())
  val scan_mode = Input(Bool())
}
class quasar extends Module with RequireAsyncReset with lib {
  val io = IO (new quasar_bundle)
  val ifu = Module(new ifu)
  val dec = Module(new dec)
  val dbg = Module(new dbg)
  val exu = Module(new exu)
  val lsu = Module(new lsu)
  val pic_ctrl_inst = Module(new pic_ctrl)
  val dma_ctrl = Module(new dma_ctrl)

  io.core_rst_l := (reset.asBool() & (dbg.io.dbg_core_rst_l.asBool() | io.scan_mode)).asAsyncReset()
  val active_state = (!dec.io.dec_pause_state_cg | dec.io.dec_exu.tlu_exu.dec_tlu_flush_lower_r) | dec.io.dec_tlu_misc_clk_override
  val free_clk = rvclkhdr(clock, true.B, io.scan_mode)
  val active_clk = rvclkhdr(clock, active_state.asBool, io.scan_mode)
  val core_dbg_cmd_done = dma_ctrl.io.dma_dbg_cmd_done | dec.io.dec_dbg_cmd_done
  val core_dbg_cmd_fail = dma_ctrl.io.dma_dbg_cmd_fail | dec.io.dec_dbg_cmd_fail
  val core_dbg_rddata = Mux(dma_ctrl.io.dma_dbg_cmd_done, dma_ctrl.io.dma_dbg_rddata, dec.io.dec_dbg_rddata)

  // Lets start with IFU
  ifu.io.ifu_dec <> dec.io.ifu_dec

  ifu.reset := io.core_rst_l
  ifu.io.scan_mode := io.scan_mode
  ifu.io.free_clk := free_clk
  ifu.io.active_clk := active_clk

  ifu.io.exu_flush_final := dec.io.exu_flush_final
  ifu.io.exu_flush_path_final := exu.io.exu_flush_path_final

  ifu.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  ifu.io.ifu_dma <> dma_ctrl.io.ifu_dma
  ifu.io.ic <> io.ic
  ifu.io.iccm <> io.iccm
  ifu.io.exu_ifu.exu_bp <> exu.io.exu_bp
  ifu.io.exu_ifu.exu_bp.exu_i0_br_fghr_r := exu.io.exu_bp.exu_i0_br_fghr_r
  ifu.io.exu_ifu.exu_bp.exu_i0_br_index_r := exu.io.dec_exu.tlu_exu.exu_i0_br_index_r
  ifu.io.dec_tlu_flush_lower_wb := dec.io.dec_exu.tlu_exu.dec_tlu_flush_lower_r
  ifu.io.ifu_dec.dec_mem_ctrl.dec_tlu_ic_diag_pkt := dec.io.ifu_dec.dec_mem_ctrl.dec_tlu_ic_diag_pkt

  // Lets start with Dec
  dec.reset := io.core_rst_l
  dec.io.free_clk := free_clk
  dec.io.active_clk := active_clk
  dec.io.lsu_fastint_stall_any := lsu.io.lsu_fastint_stall_any
  dec.io.rst_vec := io.rst_vec
  dec.io.nmi_int := io.nmi_int
  dec.io.nmi_vec := io.nmi_vec
  dec.io.i_cpu_halt_req := io.i_cpu_halt_req
  dec.io.i_cpu_run_req := io.i_cpu_run_req
  dec.io.core_id := io.core_id
  dec.io.mpc_debug_halt_req := io.mpc_debug_halt_req
  dec.io.mpc_debug_run_req := io.mpc_debug_run_req
  dec.io.mpc_reset_run_req := io.mpc_reset_run_req
  dec.io.lsu_dec <> lsu.io.lsu_dec
  dec.io.lsu_tlu <> lsu.io.lsu_tlu
  dec.io.lsu_pmu_misaligned_m := lsu.io.lsu_pmu_misaligned_m
  dec.io.dec_dma <> dma_ctrl.io.dec_dma

  dec.io.lsu_fir_addr := lsu.io.lsu_fir_addr
  dec.io.lsu_fir_error := lsu.io.lsu_fir_error
  dec.io.lsu_trigger_match_m := lsu.io.lsu_trigger_match_m
  dec.io.dec_dbg <> dbg.io.dbg_dec
  dec.io.lsu_idle_any := lsu.io.lsu_idle_any
  dec.io.lsu_error_pkt_r <> lsu.io.lsu_error_pkt_r
  dec.io.lsu_single_ecc_error_incr := lsu.io.lsu_single_ecc_error_incr
  dec.io.exu_div_result := exu.io.exu_div_result
  dec.io.exu_div_wren := exu.io.exu_div_wren
  dec.io.lsu_result_m := lsu.io.lsu_result_m
  dec.io.lsu_result_corr_r := lsu.io.lsu_result_corr_r
  dec.io.lsu_load_stall_any := lsu.io.lsu_load_stall_any
  dec.io.lsu_store_stall_any := lsu.io.lsu_store_stall_any
  dec.io.iccm_dma_sb_error := ifu.io.iccm_dma_sb_error
  dec.io.exu_flush_final := exu.io.exu_flush_final

  dec.io.soft_int := io.soft_int
  dec.io.dbg_halt_req := dbg.io.dbg_halt_req
  dec.io.dbg_resume_req := dbg.io.dbg_resume_req
  dec.io.exu_i0_br_way_r := exu.io.exu_bp.exu_i0_br_way_r
  dec.io.timer_int := io.timer_int
  dec.io.scan_mode := io.scan_mode

  // EXU lets go
  dec.io.dec_exu <> exu.io.dec_exu
  exu.reset := io.core_rst_l
  exu.io.scan_mode := io.scan_mode
  exu.io.dbg_cmd_wrdata := dbg.io.dbg_dec.dbg_dctl.dbg_cmd_wrdata

  // LSU Lets go
  lsu.reset := io.core_rst_l
  lsu.io.clk_override := dec.io.dec_tlu_lsu_clk_override
  lsu.io.dec_tlu_flush_lower_r := dec.io.dec_exu.tlu_exu.dec_tlu_flush_lower_r
  lsu.io.dec_tlu_i0_kill_writeb_r := dec.io.dec_tlu_i0_kill_writeb_r
  lsu.io.dec_tlu_force_halt := dec.io.ifu_dec.dec_mem_ctrl.dec_tlu_force_halt
  lsu.io.dec_tlu_core_ecc_disable := dec.io.ifu_dec.dec_mem_ctrl.dec_tlu_core_ecc_disable
  lsu.io.lsu_exu <> exu.io.lsu_exu
  lsu.io.dec_lsu_offset_d := dec.io.dec_lsu_offset_d
  lsu.io.lsu_p <> dec.io.lsu_p
  lsu.io.dec_lsu_valid_raw_d := dec.io.dec_lsu_valid_raw_d
  lsu.io.dec_tlu_mrac_ff := dec.io.ifu_dec.dec_ifc.dec_tlu_mrac_ff
  lsu.io.trigger_pkt_any <> dec.io.trigger_pkt_any

  lsu.io.lsu_bus_clk_en := io.lsu_bus_clk_en
  lsu.io.lsu_dma <> dma_ctrl.io.lsu_dma
  lsu.io.scan_mode := io.scan_mode
  lsu.io.free_clk := free_clk

  // Debug lets go
  dbg.reset := io.core_rst_l
  dbg.io.core_dbg_rddata := Mux(dma_ctrl.io.dma_dbg_cmd_done, dma_ctrl.io.dma_dbg_rddata, dec.io.dec_dbg_rddata)
  dbg.io.core_dbg_cmd_done := dma_ctrl.io.dma_dbg_cmd_done | dec.io.dec_dbg_cmd_done
  dbg.io.core_dbg_cmd_fail := dma_ctrl.io.dma_dbg_cmd_fail | dec.io.dec_dbg_cmd_fail
  dbg.io.dec_tlu_debug_mode := dec.io.dec_tlu_debug_mode
  dbg.io.dec_tlu_dbg_halted := dec.io.dec_tlu_dbg_halted
  dbg.io.dec_tlu_mpc_halted_only := dec.io.dec_tlu_mpc_halted_only
  dbg.io.dec_tlu_resume_ack := dec.io.dec_tlu_resume_ack
  dbg.io.dmi_reg_en := io.dmi_reg_en
  dbg.io.dmi_reg_addr := io.dmi_reg_addr
  dbg.io.dmi_reg_wr_en := io.dmi_reg_wr_en
  dbg.io.dmi_reg_wdata := io.dmi_reg_wdata
  dbg.io.sb_axi <> io.sb_axi
  dbg.io.dbg_bus_clk_en := io.dbg_bus_clk_en
  dbg.io.dbg_rst_l := io.dbg_rst_l.asBool()
  dbg.io.clk_override := dec.io.dec_tlu_misc_clk_override
  dbg.io.scan_mode := io.scan_mode


  // DMA Lets go
  dma_ctrl.reset := io.core_rst_l
  dma_ctrl.io.free_clk := free_clk
  dma_ctrl.io.dma_bus_clk_en := io.dma_bus_clk_en
  dma_ctrl.io.clk_override := dec.io.dec_tlu_misc_clk_override
  dma_ctrl.io.scan_mode := io.scan_mode
  dma_ctrl.io.dbg_dma <> dbg.io.dbg_dma
  dma_ctrl.io.dbg_dma_io <> dbg.io.dbg_dma_io
  dma_ctrl.io.dbg_cmd_size := dbg.io.dbg_cmd_size
  dma_ctrl.io.iccm_dma_rvalid := ifu.io.iccm_dma_rvalid
  dma_ctrl.io.iccm_dma_rtag := ifu.io.iccm_dma_rtag
  dma_ctrl.io.iccm_dma_rdata := ifu.io.iccm_dma_rdata
  dma_ctrl.io.iccm_ready := ifu.io.iccm_ready
  dma_ctrl.io.iccm_dma_ecc_error := ifu.io.iccm_dma_ecc_error

  // PIC lets go
  pic_ctrl_inst.io.scan_mode := io.scan_mode
  pic_ctrl_inst.reset := io.core_rst_l
  pic_ctrl_inst.io.free_clk := free_clk
  pic_ctrl_inst.io.active_clk := active_clk
  pic_ctrl_inst.io.clk_override := dec.io.dec_tlu_pic_clk_override
  pic_ctrl_inst.io.extintsrc_req := io.extintsrc_req
  pic_ctrl_inst.io.lsu_pic <> lsu.io.lsu_pic
  pic_ctrl_inst.io.dec_pic <> dec.io.dec_pic
  // Trace Packet
  io.rv_trace_pkt := dec.io.rv_trace_pkt

  // Outputs
  io.dccm_clk_override := dec.io.dec_tlu_dccm_clk_override
  io.icm_clk_override := dec.io.dec_tlu_icm_clk_override
  io.dec_tlu_core_ecc_disable := dec.io.ifu_dec.dec_mem_ctrl.dec_tlu_core_ecc_disable
  io.o_cpu_halt_ack := dec.io.o_cpu_halt_ack
  io.o_cpu_halt_status := dec.io.o_cpu_halt_status
  io.o_cpu_run_ack := dec.io.o_cpu_run_ack
  io.o_debug_mode_status := dec.io.o_debug_mode_status
  io.mpc_debug_halt_ack := dec.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack := dec.io.mpc_debug_run_ack
  io.debug_brkpt_status := dec.io.debug_brkpt_status
  io.dec_tlu_perfcnt0 := dec.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1 := dec.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2 := dec.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3 := dec.io.dec_tlu_perfcnt3
  // LSU Outputs
  io.dccm <> lsu.io.dccm

  // AXI LSU SIDE
  io.lsu_axi <> lsu.io.axi

  // AXI IFU
  io.ifu_axi <> ifu.io.ifu
  io.dma_axi <> dma_ctrl.io.dma_axi





  when(BUILD_AHB_LITE.B) {
    val lsu_axi4_to_ahb = Module(new axi4_to_ahb())
    lsu_axi4_to_ahb.io.axi_awvalid := io.lsu_axi.aw.valid
    lsu_axi4_to_ahb.io.scan_mode := io.scan_mode
    lsu_axi4_to_ahb.io.bus_clk_en := io.lsu_bus_clk_en
    lsu_axi4_to_ahb.io.clk_override := dec.io.dec_tlu_bus_clk_override
    lsu_axi4_to_ahb.io.axi_awid := io.lsu_axi.aw.bits.id
    lsu_axi4_to_ahb.io.axi_awaddr := io.lsu_axi.aw.bits.addr
    lsu_axi4_to_ahb.io.axi_awsize := io.lsu_axi.aw.bits.size
    lsu_axi4_to_ahb.io.axi_awprot := io.lsu_axi.aw.bits.prot

    lsu_axi4_to_ahb.io.axi_wvalid := io.lsu_axi.w.valid
    lsu_axi4_to_ahb.io.axi_wdata := io.lsu_axi.w.bits.data
    lsu_axi4_to_ahb.io.axi_wstrb := io.lsu_axi.w.bits.strb
    lsu_axi4_to_ahb.io.axi_wlast := io.lsu_axi.w.bits.last
    lsu_axi4_to_ahb.io.axi_bready := io.lsu_axi.b.ready

    lsu_axi4_to_ahb.io.axi_arvalid := io.lsu_axi.ar.valid
    lsu_axi4_to_ahb.io.axi_arid := io.lsu_axi.ar.bits.id
    lsu_axi4_to_ahb.io.axi_araddr := io.lsu_axi.ar.bits.addr
    lsu_axi4_to_ahb.io.axi_arsize := io.lsu_axi.ar.bits.size
    lsu_axi4_to_ahb.io.axi_arprot := io.lsu_axi.ar.bits.prot

    lsu_axi4_to_ahb.io.axi_rready := io.lsu_axi.r.ready
    lsu_axi4_to_ahb.io.ahb_hrdata := io.lsu_hrdata
    lsu_axi4_to_ahb.io.ahb_hready := io.lsu_hready
    lsu_axi4_to_ahb.io.ahb_hresp := io.lsu_hresp

    val ifu_axi4_to_ahb = Module(new axi4_to_ahb())
    ifu_axi4_to_ahb.io.axi_awvalid := io.ifu_axi.aw.valid
    ifu_axi4_to_ahb.io.scan_mode := io.scan_mode
    ifu_axi4_to_ahb.io.bus_clk_en := io.ifu_bus_clk_en
    ifu_axi4_to_ahb.io.clk_override := dec.io.dec_tlu_bus_clk_override
    ifu_axi4_to_ahb.io.axi_awid := io.ifu_axi.aw.bits.id
    ifu_axi4_to_ahb.io.axi_awaddr := io.ifu_axi.aw.bits.addr
    ifu_axi4_to_ahb.io.axi_awsize := io.ifu_axi.aw.bits.size
    ifu_axi4_to_ahb.io.axi_awprot := io.ifu_axi.aw.bits.prot

    ifu_axi4_to_ahb.io.axi_wvalid := io.ifu_axi.w.valid
    ifu_axi4_to_ahb.io.axi_wdata := io.ifu_axi.w.bits.data
    ifu_axi4_to_ahb.io.axi_wstrb := io.ifu_axi.w.bits.strb
    ifu_axi4_to_ahb.io.axi_wlast := io.ifu_axi.w.bits.last
    ifu_axi4_to_ahb.io.axi_bready := io.ifu_axi.b.ready

    ifu_axi4_to_ahb.io.axi_arvalid := io.ifu_axi.ar.valid
    ifu_axi4_to_ahb.io.axi_arid := io.ifu_axi.ar.bits.id
    ifu_axi4_to_ahb.io.axi_araddr := io.ifu_axi.ar.bits.addr
    ifu_axi4_to_ahb.io.axi_arsize := io.ifu_axi.ar.bits.size
    ifu_axi4_to_ahb.io.axi_arprot := io.ifu_axi.ar.bits.prot

    ifu_axi4_to_ahb.io.axi_rready := io.ifu_axi.r.ready

    ifu_axi4_to_ahb.io.ahb_hrdata := io.hrdata
    ifu_axi4_to_ahb.io.ahb_hready := io.hready
    ifu_axi4_to_ahb.io.ahb_hresp := io.hresp

    val sb_axi4_to_ahb = Module(new axi4_to_ahb())
    sb_axi4_to_ahb.io.axi_awvalid := io.sb_axi.aw.valid
    sb_axi4_to_ahb.io.scan_mode := io.scan_mode
    sb_axi4_to_ahb.io.bus_clk_en := io.dbg_bus_clk_en
    sb_axi4_to_ahb.io.clk_override := dec.io.dec_tlu_bus_clk_override
    sb_axi4_to_ahb.io.axi_awid := io.sb_axi.aw.bits.id
    sb_axi4_to_ahb.io.axi_awaddr := io.sb_axi.aw.bits.addr
    sb_axi4_to_ahb.io.axi_awsize := io.sb_axi.aw.bits.size
    sb_axi4_to_ahb.io.axi_awprot := io.sb_axi.aw.bits.prot

    sb_axi4_to_ahb.io.axi_wvalid := io.sb_axi.w.valid
    sb_axi4_to_ahb.io.axi_wdata := io.sb_axi.w.bits.data
    sb_axi4_to_ahb.io.axi_wstrb := io.sb_axi.w.bits.strb
    sb_axi4_to_ahb.io.axi_wlast := io.sb_axi.w.bits.last
    sb_axi4_to_ahb.io.axi_bready := io.sb_axi.b.ready

    sb_axi4_to_ahb.io.axi_arvalid := io.sb_axi.ar.valid
    sb_axi4_to_ahb.io.axi_arid := io.sb_axi.ar.bits.id
    sb_axi4_to_ahb.io.axi_araddr := io.sb_axi.ar.bits.addr
    sb_axi4_to_ahb.io.axi_arsize := io.sb_axi.ar.bits.size
    sb_axi4_to_ahb.io.axi_arprot := io.sb_axi.ar.bits.prot

    sb_axi4_to_ahb.io.axi_rready := io.sb_axi.r.ready
    sb_axi4_to_ahb.io.ahb_hrdata := io.sb_hrdata
    sb_axi4_to_ahb.io.ahb_hready := io.sb_hready
    sb_axi4_to_ahb.io.ahb_hresp := io.sb_hresp

    val dma_ahb_to_axi4 = Module(new ahb_to_axi4())
    dma_ahb_to_axi4.io.scan_mode := io.scan_mode
    dma_ahb_to_axi4.io.bus_clk_en := io.dma_bus_clk_en
    dma_ahb_to_axi4.io.clk_override := dec.io.dec_tlu_bus_clk_override
    dma_ahb_to_axi4.io.axi_awready := io.dma_axi.aw.ready
    dma_ahb_to_axi4.io.axi_wready := io.dma_axi.w.ready
    dma_ahb_to_axi4.io.axi_bvalid := io.dma_axi.b.valid
    dma_ahb_to_axi4.io.axi_bresp := io.dma_axi.b.bits.resp
    dma_ahb_to_axi4.io.axi_bid := io.dma_axi.b.bits.id

    // AXI Read Channels
    dma_ahb_to_axi4.io.axi_arready := io.dma_axi.ar.ready
    dma_ahb_to_axi4.io.axi_rvalid := io.dma_axi.ar.valid
    dma_ahb_to_axi4.io.axi_rid := io.dma_axi.r.bits.id
    dma_ahb_to_axi4.io.axi_rdata := io.dma_axi.r.bits.data
    dma_ahb_to_axi4.io.axi_rresp := io.dma_axi.r.bits.resp

    // AHB-Lite signals
    dma_ahb_to_axi4.io.ahb_haddr := io.dma_haddr
    dma_ahb_to_axi4.io.ahb_hburst := io.dma_hburst
    dma_ahb_to_axi4.io.ahb_hmastlock := io.dma_hmastlock
    dma_ahb_to_axi4.io.ahb_hprot := io.dma_hprot
    dma_ahb_to_axi4.io.ahb_hsize := io.dma_hsize
    dma_ahb_to_axi4.io.ahb_htrans := io.dma_htrans
    dma_ahb_to_axi4.io.ahb_hwrite := io.dma_hwrite
    dma_ahb_to_axi4.io.ahb_hwdata := io.dma_hwdata
    dma_ahb_to_axi4.io.ahb_hsel := io.dma_hsel
    dma_ahb_to_axi4.io.ahb_hreadyin := io.dma_hreadyin

    // Mux for the axi-bridge
    lsu.io.axi.aw.ready := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_awready, io.lsu_axi.aw.ready)
    lsu.io.axi.w.ready := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_wready, io.lsu_axi.w.ready)
    lsu.io.axi.b.valid := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_bvalid, io.lsu_axi.b.valid)
    lsu.io.axi.b.bits.resp := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_bresp, io.lsu_axi.b.bits.resp)
    lsu.io.axi.b.bits.id := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_bid, io.lsu_axi.b.bits.id)
    lsu.io.axi.ar.ready := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_arready, io.lsu_axi.ar.ready)
    lsu.io.axi.r.valid := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_rvalid, io.lsu_axi.r.valid)
    lsu.io.axi.r.bits.id := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_rid, io.lsu_axi.r.bits.id)
    lsu.io.axi.r.bits.data := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_rdata, io.lsu_axi.r.bits.data)
    lsu.io.axi.r.bits.resp := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_rresp, io.lsu_axi.r.bits.resp)
    lsu.io.axi.r.bits.last := Mux(BUILD_AHB_LITE.B, lsu_axi4_to_ahb.io.axi_rlast, io.lsu_axi.r.bits.last)

    ifu.io.ifu.aw.ready := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_awready, io.ifu_axi.aw.ready)
    ifu.io.ifu.w.ready := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_wready, io.ifu_axi.w.ready)
    ifu.io.ifu.ar.ready := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_arready, io.ifu_axi.ar.ready)
    ifu.io.ifu.r.valid := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_rvalid, io.ifu_axi.r.valid)
    ifu.io.ifu.r.bits.id := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_rid, io.ifu_axi.r.bits.id)
    ifu.io.ifu.r.bits.data := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_rdata, io.ifu_axi.r.bits.data)
    ifu.io.ifu.r.bits.resp := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_rresp, io.ifu_axi.r.bits.resp)
    ifu.io.ifu.r.bits.last := Mux(BUILD_AHB_LITE.B, ifu_axi4_to_ahb.io.axi_rlast, io.ifu_axi.r.bits.last)

    dbg.io.sb_axi.aw.ready := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_awready, io.sb_axi.aw.ready)
    dbg.io.sb_axi.w.ready := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_wready, io.sb_axi.w.ready)
    dbg.io.sb_axi.b.valid := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_bvalid, io.sb_axi.b.valid)
    dbg.io.sb_axi.b.bits.resp := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_bresp, io.sb_axi.b.bits.resp)
    dbg.io.sb_axi.ar.ready := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_arready, io.sb_axi.ar.ready)
    dbg.io.sb_axi.r.valid := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_rvalid, io.sb_axi.r.valid)
    dbg.io.sb_axi.r.bits.id := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_rid, io.sb_axi.r.bits.id)
    dbg.io.sb_axi.r.bits.data := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_rdata, io.sb_axi.r.bits.data)
    dbg.io.sb_axi.r.bits.resp := Mux(BUILD_AHB_LITE.B, sb_axi4_to_ahb.io.axi_rresp, io.sb_axi.r.bits.resp)

    dma_ctrl.io.dma_axi.aw.valid := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_awvalid, io.dma_axi.aw.valid)
    dma_ctrl.io.dma_axi.aw.bits.id := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_awid, io.dma_axi.aw.bits.id)
    dma_ctrl.io.dma_axi.aw.bits.addr := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_awaddr, io.dma_axi.aw.bits.addr)
    dma_ctrl.io.dma_axi.aw.bits.size := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_awsize, io.dma_axi.aw.bits.size)
    dma_ctrl.io.dma_axi.w.valid := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_wvalid, io.dma_axi.w.valid)
    dma_ctrl.io.dma_axi.w.bits.data := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_wdata, io.dma_axi.w.bits.data)
    dma_ctrl.io.dma_axi.w.bits.strb := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_wstrb, io.dma_axi.w.bits.strb)
    dma_ctrl.io.dma_axi.b.ready := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_bready, io.dma_axi.b.ready)
    dma_ctrl.io.dma_axi.ar.valid := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_arvalid, io.dma_axi.ar.valid)
    dma_ctrl.io.dma_axi.ar.bits.id := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_arid, io.dma_axi.ar.bits.id)
    dma_ctrl.io.dma_axi.ar.bits.addr := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_araddr, io.dma_axi.aw.bits.addr)
    dma_ctrl.io.dma_axi.ar.bits.size := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_arsize, io.dma_axi.aw.bits.size)
    dma_ctrl.io.dma_axi.r.ready := Mux(BUILD_AHB_LITE.B, dma_ahb_to_axi4.io.axi_rready, io.dma_axi.r.ready)


    // AHB Signals
    io.haddr := ifu_axi4_to_ahb.io.ahb_haddr
    io.hburst := ifu_axi4_to_ahb.io.ahb_hburst
    io.hmastlock := ifu_axi4_to_ahb.io.ahb_hmastlock
    io.hprot := ifu_axi4_to_ahb.io.ahb_hprot
    io.hsize := ifu_axi4_to_ahb.io.ahb_hsize
    io.htrans := ifu_axi4_to_ahb.io.ahb_htrans
    io.hwrite := ifu_axi4_to_ahb.io.ahb_hwrite


    io.lsu_haddr := lsu_axi4_to_ahb.io.ahb_haddr
    io.lsu_hburst := lsu_axi4_to_ahb.io.ahb_hburst
    io.lsu_hmastlock := lsu_axi4_to_ahb.io.ahb_hmastlock
    io.lsu_hprot := lsu_axi4_to_ahb.io.ahb_hprot
    io.lsu_hsize := lsu_axi4_to_ahb.io.ahb_hsize
    io.lsu_htrans := lsu_axi4_to_ahb.io.ahb_htrans
    io.lsu_hwrite := lsu_axi4_to_ahb.io.ahb_hwrite
    io.lsu_hwdata := lsu_axi4_to_ahb.io.ahb_hwdata

    io.sb_haddr := sb_axi4_to_ahb.io.ahb_haddr
    io.sb_hburst := sb_axi4_to_ahb.io.ahb_hburst
    io.sb_hmastlock := sb_axi4_to_ahb.io.ahb_hmastlock
    io.sb_hprot := sb_axi4_to_ahb.io.ahb_hprot
    io.sb_hsize := sb_axi4_to_ahb.io.ahb_hsize
    io.sb_htrans := sb_axi4_to_ahb.io.ahb_htrans
    io.sb_hwrite := sb_axi4_to_ahb.io.ahb_hwrite
    io.sb_hwdata := sb_axi4_to_ahb.io.ahb_hwdata

    io.dma_hrdata := dma_ahb_to_axi4.io.ahb_hrdata
    io.dma_hreadyout := dma_ahb_to_axi4.io.ahb_hreadyout
    io.dma_hresp := dma_ahb_to_axi4.io.ahb_hresp
  }
      .otherwise{
        // AHB Signals
        io.haddr := 0.U
        io.hburst := 0.U
        io.hmastlock := 0.U
        io.hprot := 0.U
        io.hsize := 0.U
        io.htrans := 0.U
        io.hwrite := 0.U


        io.lsu_haddr := 0.U
        io.lsu_hburst := 0.U
        io.lsu_hmastlock := 0.U
        io.lsu_hprot := 0.U
        io.lsu_hsize := 0.U
        io.lsu_htrans := 0.U
        io.lsu_hwrite := 0.U
        io.lsu_hwdata := 0.U

        io.sb_haddr := 0.U
        io.sb_hburst := 0.U
        io.sb_hmastlock := 0.U
        io.sb_hprot := 0.U
        io.sb_hsize := 0.U
        io.sb_htrans := 0.U
        io.sb_hwrite := 0.U
        io.sb_hwdata := 0.U

        io.dma_hrdata := 0.U
        io.dma_hreadyout := 0.U
        io.dma_hresp := 0.U
        }

  io.dmi_reg_rdata := 0.U
}




