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

  val lsu_ahb = new ahb_channel
  val ifu_ahb = new ahb_channel
  val sb_ahb = new ahb_channel
  val dma_ahb = new Bundle{
    val sig = Flipped(new ahb_channel())
    val hsel = Input(Bool())
    val hreadyin = Input(Bool())}

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
  ifu.io.ifu_dec.dec_mem_ctrl.dec_tlu_ic_diag_pkt <> dec.io.ifu_dec.dec_mem_ctrl.dec_tlu_ic_diag_pkt

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
  dec.io.dec_dbg <> dbg.io.dbg_dec_dma
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
  exu.io.dbg_cmd_wrdata := dbg.io.dbg_dec_dma.dbg_dctl.dbg_cmd_wrdata

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
  dma_ctrl.io.dbg_dec_dma <> dbg.io.dbg_dec_dma
  dma_ctrl.io.dbg_dma <> dbg.io.dbg_dma
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
  pic_ctrl_inst.io.extintsrc_req := Cat(io.extintsrc_req,0.U)
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
  io.dmi_reg_rdata := dbg.io.dmi_reg_rdata

  // LSU Outputs
  io.dccm <> lsu.io.dccm

  if(BUILD_AHB_LITE) {
    val sb_axi4_to_ahb = Module(new axi4_to_ahb(SB_BUS_TAG))
    val ifu_axi4_to_ahb = Module(new axi4_to_ahb(IFU_BUS_TAG))
    val lsu_axi4_to_ahb = Module(new axi4_to_ahb(LSU_BUS_TAG))
    val dma_ahb_to_axi4 = Module(new ahb_to_axi4(DMA_BUS_TAG))

    lsu_axi4_to_ahb.io.scan_mode := io.scan_mode
    lsu_axi4_to_ahb.io.bus_clk_en := io.lsu_bus_clk_en
    lsu_axi4_to_ahb.io.clk_override := dec.io.dec_tlu_bus_clk_override
    lsu_axi4_to_ahb.io.axi <> lsu.io.axi
    lsu_axi4_to_ahb.io.ahb <> io.lsu_ahb

    ifu_axi4_to_ahb.io.scan_mode := io.scan_mode
    ifu_axi4_to_ahb.io.bus_clk_en := io.ifu_bus_clk_en
    ifu_axi4_to_ahb.io.clk_override := dec.io.dec_tlu_bus_clk_override
    ifu_axi4_to_ahb.io.axi <> ifu.io.ifu
    ifu_axi4_to_ahb.io.ahb <> io.ifu_ahb
    ifu_axi4_to_ahb.io.axi.b.ready := true.B

    sb_axi4_to_ahb.io.scan_mode := io.scan_mode
    sb_axi4_to_ahb.io.bus_clk_en := io.dbg_bus_clk_en
    sb_axi4_to_ahb.io.clk_override := dec.io.dec_tlu_bus_clk_override
    sb_axi4_to_ahb.io.axi <> dbg.io.sb_axi
    sb_axi4_to_ahb.io.ahb <> io.sb_ahb

    dma_ahb_to_axi4.io.scan_mode := io.scan_mode
    dma_ahb_to_axi4.io.bus_clk_en := io.dma_bus_clk_en
    dma_ahb_to_axi4.io.clk_override := dec.io.dec_tlu_bus_clk_override
    dma_ahb_to_axi4.io.axi <> dma_ctrl.io.dma_axi
    dma_ahb_to_axi4.io.ahb <> io.dma_ahb

    io.dma_axi      <> 0.U.asTypeOf(io.dma_axi)
    io.sb_axi       <> 0.U.asTypeOf(io.sb_axi)
    io.ifu_axi      <> 0.U.asTypeOf(io.ifu_axi)
    io.lsu_axi      <> 0.U.asTypeOf(io.lsu_axi)
  }
    else{
      io.lsu_ahb          <> 0.U.asTypeOf(io.lsu_ahb)
      io.ifu_ahb          <> 0.U.asTypeOf(io.ifu_ahb)
      io.sb_ahb           <> 0.U.asTypeOf(io.sb_ahb)
      io.dma_ahb          <> 0.U.asTypeOf(io.dma_ahb)
      dma_ctrl.io.dma_axi <> io.dma_axi
      dbg.io.sb_axi       <> io.sb_axi
      ifu.io.ifu          <> io.ifu_axi
      lsu.io.axi          <> io.lsu_axi
    }

}
//object QUASAR extends App {
 // println((new chisel3.stage.ChiselStage).emitVerilog(new quasar()))
//}