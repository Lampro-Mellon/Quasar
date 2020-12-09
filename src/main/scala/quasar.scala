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

  val trace = new trace_pkt_t
//  val trace_rv_i_insn_ip = Output(UInt(32.W))
//  val trace_rv_i_address_ip = Output(UInt(32.W))
//  val trace_rv_i_valid_ip = Output(UInt(2.W))
//  val trace_rv_i_exception_ip = Output(UInt(2.W))
//  val trace_rv_i_ecause_ip = Output(UInt(5.W))
//  val trace_rv_i_interrupt_ip = Output(UInt(2.W))
//  val trace_rv_i_tval_ip = Output(UInt(32.W))
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
  val swerv_mem = Flipped(new mem_lsu)
  val ic = new ic_mem()
  val iccm = new iccm_mem()

 // val iccm_rw_addr = Output(UInt((ICCM_BITS-1).W))
//  val iccm_wren = Output(Bool())
 // val iccm_rden = Output(Bool())
//  val iccm_wr_size = Output(UInt(3.W))
 // val iccm_wr_data = Output(UInt(78.W))
 // val iccm_buf_correct_ecc = Output(Bool())
//  val iccm_correction_state = Output(Bool())

//  val iccm_rd_data = Input(UInt(64.W))
 // val iccm_rd_data_ecc = Input(UInt(78.W))

 // val ic_rw_addr = Output(UInt(31.W))
//  val ic_tag_valid = Output(UInt(ICACHE_NUM_WAYS.W))
 // val ic_wr_en = Output(UInt(ICACHE_NUM_WAYS.W))
 // val ic_rd_en = Output(Bool())
 // val ic_wr_data = Output(Vec(ICACHE_BANKS_WAY, UInt(71.W)))
 // val ic_rd_data = Input(UInt(64.W))
 // val ic_debug_rd_data = Input(UInt(71.W))
 // val ictag_debug_rd_data = Input(UInt(26.W))
 // val ic_debug_wr_data = Output(UInt(71.W))

 // val ic_eccerr = Input(UInt(ICACHE_BANKS_WAY.W))
 // val ic_parerr = Input(UInt(ICACHE_BANKS_WAY.W))
 // val ic_premux_data = Output(UInt(64.W))
 // val ic_sel_premux_data = Output(Bool())

//  val ic_debug_addr = Output(UInt((ICACHE_INDEX_HI-2).W))
 // val ic_debug_rd_en = Output(Bool())
 // val ic_debug_wr_en = Output(Bool())
//  val ic_debug_tag_array = Output(Bool())
 // val ic_debug_way = Output(UInt(ICACHE_NUM_WAYS.W))
 // val ic_rd_hit = Input(UInt(ICACHE_NUM_WAYS.W))
 // val ic_tag_perr = Input(Bool())

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
 // ifu.io.iccm_rd_data_ecc := io.iccm_rd_data_ecc
  ifu.io.exu_flush_final := dec.io.exu_flush_final
  ifu.io.exu_flush_path_final := exu.io.exu_flush_path_final
  ifu.io.ifu.ar.ready := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi.ar.ready)
  ifu.io.ifu.r.valid := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi.r.valid)
  ifu.io.ifu.r.bits.id := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi.r.bits.id)
  ifu.io.ifu.r.bits.data := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi.r.bits.data)
  ifu.io.ifu.r.bits.resp := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi.r.bits.resp)
  ifu.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  ifu.io.ifu_dma <> dma_ctrl.io.ifu_dma
  ifu.io.ic <> io.ic
  ifu.io.iccm <> io.iccm
//  ifu.io.ic_rd_data := io.ic_rd_data
//  ifu.io.ic_debug_rd_data := io.ic_debug_rd_data
//  ifu.io.ictag_debug_rd_data := io.ictag_debug_rd_data
//  ifu.io.ic_eccerr := io.ic_eccerr
//  ifu.io.ic_parerr := io.ic_parerr
//  ifu.io.ic_rd_hit := io.ic_rd_hit
//  ifu.io.ic_tag_perr := io.ic_tag_perr
//  ifu.io.iccm_rd_data := io.iccm_rd_data
  ifu.io.exu_ifu.exu_bp <> exu.io.exu_bp
  ifu.io.exu_ifu.exu_bp.exu_i0_br_fghr_r := exu.io.exu_bp.exu_i0_br_fghr_r
  ifu.io.exu_ifu.exu_bp.exu_i0_br_index_r := exu.io.dec_exu.tlu_exu.exu_i0_br_index_r
  ifu.io.ifu_dec.dec_mem_ctrl.dec_tlu_flush_lower_wb := dec.io.dec_exu.tlu_exu.dec_tlu_flush_lower_r
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
  dec.io.dec_dma <> dma_ctrl.io.dec_dma
  dec.io.dec_pic <> pic_ctrl_inst.io.dec_pic
  dec.io.lsu_pmu_misaligned_m := lsu.io.lsu_pmu_misaligned_m
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
//  dec.io.mexintpend := pic_ctrl_inst.io.mexintpend
  dec.io.soft_int := io.soft_int
//  dec.io.pic_claimid := pic_ctrl_inst.io.claimid
//  dec.io.pic_pl := pic_ctrl_inst.io.pl
//  dec.io.mhwakeup := pic_ctrl_inst.io.mhwakeup
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
  lsu.io.axi.aw.ready := Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.aw.ready)
  lsu.io.axi.w.ready :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.w.ready)
  lsu.io.axi.b.valid :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.b.valid)
  lsu.io.axi.b.bits.resp :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.b.bits.resp)
  lsu.io.axi.b.bits.id :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.b.bits.id)
  lsu.io.axi.ar.ready :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.ar.ready)
  lsu.io.axi.r.valid :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.r.valid)
  lsu.io.axi.r.bits.id :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.r.bits.id)
  lsu.io.axi.r.bits.data :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.r.bits.data)
  lsu.io.axi.r.bits.resp :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.r.bits.resp)
  lsu.io.axi.r.bits.last :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi.r.bits.last)
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
  // Trace Packet
  io.trace <> dec.io.rv_trace_pkt
//  io.trace_rv_i_insn_ip := dec.io.rv_trace_pkt.rv_i_insn_ip
//  io.trace_rv_i_address_ip := dec.io.rv_trace_pkt.rv_i_address_ip
//  io.trace_rv_i_valid_ip := dec.io.rv_trace_pkt.rv_i_valid_ip
//  io.trace_rv_i_exception_ip := dec.io.rv_trace_pkt.rv_i_exception_ip
//  io.trace_rv_i_ecause_ip := dec.io.rv_trace_pkt.rv_i_ecause_ip
//  io.trace_rv_i_interrupt_ip := dec.io.rv_trace_pkt.rv_i_interrupt_ip
//  io.trace_rv_i_tval_ip := dec.io.rv_trace_pkt.rv_i_tval_ip

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
  io.swerv_mem <> lsu.io.dccm
  // IFU Outputs
//  io.iccm_rw_addr := ifu.io.iccm_rw_addr
//  io.iccm_wren := ifu.io.iccm_wren
//  io.iccm_rden := ifu.io.iccm_rden
//  io.iccm_wr_size := ifu.io.iccm_wr_size
//  io.iccm_wr_data := ifu.io.iccm_wr_data
//  io.iccm_buf_correct_ecc := ifu.io.iccm_buf_correct_ecc
//  io.iccm_correction_state := ifu.io.iccm_correction_state
//  io.ic_rw_addr := ifu.io.ic_rw_addr
//  io.ic_tag_valid := ifu.io.ic_tag_valid
//  io.ic_wr_en := ifu.io.ic_wr_en
//  io.ic_rd_en := ifu.io.ic_rd_en
//  io.ic_wr_data := ifu.io.ic_wr_data
//  io.ic_debug_wr_data := ifu.io.ic_debug_wr_data
//  io.ic_premux_data := ifu.io.ic_premux_data
//  io.ic_sel_premux_data := ifu.io.ic_sel_premux_data
//  io.ic_debug_addr := ifu.io.ic_debug_addr
//  io.ic_debug_rd_en := ifu.io.ic_debug_rd_en
//  io.ic_debug_wr_en := ifu.io.ic_debug_wr_en
//  io.ic_debug_tag_array := ifu.io.ic_debug_tag_array
//  io.ic_debug_way := ifu.io.ic_debug_way

  // AXI LSU SIDE
  io.lsu_axi <> lsu.io.axi

  // AXI IFU
  io.ifu_axi <> ifu.io.ifu
  io.dma_axi <> dma_ctrl.io.dma_axi

  // AHB Signals
  io.hburst := 0.U
  io.hmastlock := 0.U
  io.hprot := 0.U
  io.hsize := 0.U
  io.htrans := 0.U
  io.hwrite := 0.U
  io.haddr := 0.U

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

  io.dma_hresp := 0.U

  io.dmi_reg_rdata := 0.U
}




