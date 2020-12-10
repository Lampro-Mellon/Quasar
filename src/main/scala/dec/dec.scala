package dec
import chisel3._
import chisel3.util._
import include._
import lib._
import lsu._

class dec_IO extends Bundle with lib {
  val free_clk              = Input(Clock())
  val active_clk            = Input(Clock())
  val lsu_fastint_stall_any = Input(Bool())           // needed by lsu for 2nd pass of dma with ecc correction, stall next cycle
  val dec_pause_state_cg    = Output(Bool())          // to top for active state clock gating
  val rst_vec               = Input(UInt(31.W))       // [31:1] reset vector, from core pins

  val nmi_int               = Input(Bool())           // NMI pin
  val nmi_vec               = Input(UInt(31.W))       // [31:1] NMI vector, from pins

  val i_cpu_halt_req        = Input(Bool())           // Asynchronous Halt request to CPU
  val i_cpu_run_req         = Input(Bool())           // Asynchronous Restart request to CPU

  val o_cpu_halt_status     = Output(Bool())          // Halt status of core (pmu/fw)
  val o_cpu_halt_ack        = Output(Bool())          // Halt request ack
  val o_cpu_run_ack         = Output(Bool())          // Run request ack
  val o_debug_mode_status   = Output(Bool())          // Core to the PMU that core is in debug mode. When core is in debug mode, the PMU should refrain from sendng a halt or run request

  val core_id               = Input(UInt(28.W))       // [31:4] CORE ID

  val mpc_debug_halt_req    = Input(Bool())   // Async halt request
  val mpc_debug_run_req     = Input(Bool())   // Async run request
  val mpc_reset_run_req     = Input(Bool())   // Run/halt after reset
  val mpc_debug_halt_ack    = Output(Bool())  // Halt ack
  val mpc_debug_run_ack     = Output(Bool())  // Run ack
  val debug_brkpt_status    = Output(Bool())  // debug breakpoint
  val lsu_pmu_misaligned_m          = Input(Bool())      // D side load or store misaligned


  val lsu_fir_addr                  = Input(UInt(31.W)) //[31:1] Fast int address
  val lsu_fir_error                 = Input(UInt(2.W))  //[1:0]  Fast int lookup error

  val lsu_trigger_match_m           = Input(UInt(4.W))
  val lsu_idle_any                  = Input(Bool())     // lsu idle for halting
  val lsu_error_pkt_r               = Flipped(Valid(new lsu_error_pkt_t)) // LSU exception/error packet
  val lsu_single_ecc_error_incr     = Input(Bool())// LSU inc SB error counter
  val exu_div_result                = Input(UInt(32.W))    // final div result
  val exu_div_wren                  = Input(UInt(1.W))    // Divide write enable to GPR
  val lsu_result_m                  = Input(UInt(32.W))     // load result
  val lsu_result_corr_r             = Input(UInt(32.W))     // load result - corrected load data

  val lsu_load_stall_any            = Input(Bool())            // This is for blocking loads
  val lsu_store_stall_any           = Input(Bool())            // This is for blocking stores


  val iccm_dma_sb_error             = Input(Bool())            // ICCM DMA single bit error

  val exu_flush_final               = Input(Bool())             // slot0 flush
  val timer_int                 = Input(Bool())        // Timer interrupt pending (from pin)
  val soft_int                  = Input(Bool())        // Software interrupt pending (from pin)



  // Debug start
  val dbg_halt_req              = Input(Bool())        // DM requests a halt
  val dbg_resume_req            = Input(Bool())        // DM requests a resume
  val dec_tlu_dbg_halted        = Output(Bool())       // Core is halted and ready for debug command
  val dec_tlu_debug_mode        = Output(Bool())       // Core is in debug mode
  val dec_tlu_resume_ack        = Output(Bool())       // Resume acknowledge
  val dec_tlu_mpc_halted_only   = Output(Bool())       // Core is halted only due to MPC
  val dec_dbg_rddata            = Output(UInt(32.W))       // debug command read data

  val dec_dbg_cmd_done          = Output(Bool())      // abstract command is done
  val dec_dbg_cmd_fail          = Output(Bool())      // abstract command failed (illegal reg address)

  val trigger_pkt_any           = Output(Vec(4,new trigger_pkt_t))  // info needed by debug trigger blocks
  val exu_i0_br_way_r           = Input(Bool())           // way hit or repl
  val lsu_p                     = Valid(new lsu_pkt_t) // lsu packet
  val dec_lsu_offset_d          = Output(UInt(12.W)) // 12b offset for load/store addresses
  val dec_tlu_i0_kill_writeb_r  = Output(Bool())   // I0 is flushed, don't writeback any results to arch state
  val dec_tlu_perfcnt0          = Output(Bool())      // toggles when slot0 perf counter 0 has an event inc
  val dec_tlu_perfcnt1          = Output(Bool())      // toggles when slot0 perf counter 1 has an event inc
  val dec_tlu_perfcnt2          = Output(Bool())      // toggles when slot0 perf counter 2 has an event inc
  val dec_tlu_perfcnt3          = Output(Bool())      // toggles when slot0 perf counter 3 has an event inc
  val dec_lsu_valid_raw_d       = Output(Bool())
  val rv_trace_pkt              = (new trace_pkt_t)        // trace packet

  // clock gating overrides from mcgc
  val dec_tlu_misc_clk_override = Output(Bool())       // override misc clock domain gating
  val dec_tlu_ifu_clk_override  = Output(Bool())       // override fetch clock domain gating
  val dec_tlu_lsu_clk_override  = Output(Bool())       // override load/store clock domain gating
  val dec_tlu_bus_clk_override  = Output(Bool())       // override bus clock domain gating
  val dec_tlu_pic_clk_override  = Output(Bool())       // override PIC clock domain gating
  val dec_tlu_dccm_clk_override = Output(Bool())       // override DCCM clock domain gating
  val dec_tlu_icm_clk_override  = Output(Bool())       // override ICCM clock domain gating

  val scan_mode                 = Input(Bool())
  val ifu_dec = Flipped(new ifu_dec)
  val dec_exu = Flipped(new dec_exu)
  val lsu_dec = Flipped (new lsu_dec)
  val lsu_tlu = Flipped (new lsu_tlu)
  val dec_dbg = new dec_dbg
  val dec_dma = new dec_dma
  val dec_pic = new dec_pic
}
class dec extends Module with param with RequireAsyncReset{
  val io = IO(new dec_IO)

  val               dec_i0_inst_wb1 = WireInit(UInt(32.W),0.U)
  val               dec_i0_pc_wb1 = WireInit(UInt(32.W),0.U)
  val               dec_tlu_i0_valid_wb1   = WireInit(UInt(1.W),0.U)
  val               dec_tlu_int_valid_wb1  = WireInit(UInt(1.W),0.U)

  val               dec_tlu_exc_cause_wb1 = WireInit(UInt(5.W),0.U)
  val               dec_tlu_mtval_wb1 = WireInit(UInt(32.W),0.U)
  val               dec_tlu_i0_exc_valid_wb1 = WireInit(Bool(),0.B)


  //--------------------------------------------------------------------------//
  val instbuff = Module(new dec_ib_ctl)
  val decode = Module(new dec_decode_ctl)
  val gpr = Module(new dec_gpr_ctl)
  val tlu = Module(new dec_tlu_ctl)
  val dec_trigger = Module(new dec_trigger)

  //connections for dec_Ib
  //inputs
  instbuff.io.ifu_ib <> io.ifu_dec.dec_aln.aln_ib
  instbuff.io.ib_exu <> io.dec_exu.ib_exu
  instbuff.io.dbg_ib <> io.dec_dbg.dbg_ib
  dec_trigger.io.dec_i0_pc_d := instbuff.io.ib_exu.dec_i0_pc_d
  dec_trigger.io.trigger_pkt_any := tlu.io.trigger_pkt_any

  val dec_i0_trigger_match_d = dec_trigger.io.dec_i0_trigger_match_d
  dontTouch(dec_i0_trigger_match_d)
  decode.io.dec_aln <> io.ifu_dec.dec_aln.aln_dec

  decode.io.decode_exu<> io.dec_exu.decode_exu
  decode.io.dec_alu<> io.dec_exu.dec_alu
  decode.io.dec_div<> io.dec_exu.dec_div
  decode.io.dctl_dma <> io.dec_dma.dctl_dma
  decode.io.dec_tlu_flush_extint               :=  tlu.io.dec_tlu_flush_extint
  decode.io.dec_tlu_force_halt                 :=  tlu.io.tlu_mem.dec_tlu_force_halt
  decode.io.dctl_busbuff <> io.lsu_dec.dctl_busbuff
  decode.io.dec_i0_trigger_match_d             :=  dec_i0_trigger_match_d
  decode.io.dec_tlu_wr_pause_r                 :=  tlu.io.dec_tlu_wr_pause_r
  decode.io.dec_tlu_pipelining_disable         :=  tlu.io.dec_tlu_pipelining_disable
  decode.io.lsu_trigger_match_m                :=  io.lsu_trigger_match_m
  decode.io.lsu_pmu_misaligned_m               :=  io.lsu_pmu_misaligned_m
  decode.io.dec_tlu_debug_stall                :=  tlu.io.dec_tlu_debug_stall
  decode.io.dec_tlu_flush_leak_one_r           :=  tlu.io.tlu_bp.dec_tlu_flush_leak_one_wb
  decode.io.dec_debug_fence_d                  :=  instbuff.io.dec_debug_fence_d
  decode.io.dbg_dctl <> io.dec_dbg.dbg_dctl
  decode.io.dec_i0_icaf_d                      :=  instbuff.io.dec_i0_icaf_d
  decode.io.dec_i0_icaf_f1_d                   :=  instbuff.io.dec_i0_icaf_f1_d
  decode.io.dec_i0_icaf_type_d                 :=  instbuff.io.dec_i0_icaf_type_d
  decode.io.dec_i0_dbecc_d                     :=  instbuff.io.dec_i0_dbecc_d
  decode.io.dec_i0_brp                         :=  instbuff.io.dec_i0_brp
  decode.io.dec_i0_bp_index                    :=  instbuff.io.dec_i0_bp_index
  decode.io.dec_i0_bp_fghr                     :=  instbuff.io.dec_i0_bp_fghr
  decode.io.dec_i0_bp_btag                     :=  instbuff.io.dec_i0_bp_btag
  decode.io.dec_i0_pc_d                        :=  instbuff.io.ib_exu.dec_i0_pc_d
  decode.io.lsu_idle_any                       :=  io.lsu_idle_any
  decode.io.lsu_load_stall_any                 :=  io.lsu_load_stall_any
  decode.io.lsu_store_stall_any                :=  io.lsu_store_stall_any
  decode.io.exu_div_wren                       :=  io.exu_div_wren
  decode.io.dec_tlu_i0_kill_writeb_wb          :=  tlu.io.dec_tlu_i0_kill_writeb_wb
  decode.io.dec_tlu_flush_lower_wb             :=  tlu.io.dec_tlu_flush_lower_wb
  decode.io.dec_tlu_i0_kill_writeb_r           :=  tlu.io.dec_tlu_i0_kill_writeb_r
  decode.io.dec_tlu_flush_lower_r              :=  tlu.io.tlu_exu.dec_tlu_flush_lower_r
  decode.io.dec_tlu_flush_pause_r              :=  tlu.io.dec_tlu_flush_pause_r
  decode.io.dec_tlu_presync_d                  :=  tlu.io.dec_tlu_presync_d
  decode.io.dec_tlu_postsync_d                 :=  tlu.io.dec_tlu_postsync_d
  decode.io.dec_i0_pc4_d                       :=  instbuff.io.dec_i0_pc4_d
  decode.io.dec_csr_rddata_d                   :=  tlu.io.dec_csr_rddata_d
  decode.io.dec_csr_legal_d                    :=  tlu.io.dec_csr_legal_d
  decode.io.lsu_result_m                       :=  io.lsu_result_m
  decode.io.lsu_result_corr_r                  :=  io.lsu_result_corr_r
  decode.io.exu_flush_final                    :=  io.exu_flush_final
  decode.io.dec_i0_instr_d                     :=  instbuff.io.dec_i0_instr_d
  decode.io.dec_ib0_valid_d                    :=  instbuff.io.dec_ib0_valid_d
  decode.io.free_clk                           :=  io.free_clk
  decode.io.active_clk                         :=  io.active_clk
  decode.io.clk_override                       :=  tlu.io.dec_tlu_dec_clk_override
  decode.io.scan_mode                          :=  io.scan_mode
  dec_i0_inst_wb1                      :=   decode.io.dec_i0_inst_wb1   //for tracer
  dec_i0_pc_wb1                        :=   decode.io.dec_i0_pc_wb1     //for tracer
  io.lsu_p                             :=   decode.io.lsu_p
  io.dec_lsu_valid_raw_d               :=   decode.io.dec_lsu_valid_raw_d
  io.dec_lsu_offset_d                  :=   decode.io.dec_lsu_offset_d
  io.dec_pause_state_cg                :=   decode.io.dec_pause_state_cg
  gpr.io.raddr0       := decode.io.dec_i0_rs1_d
  gpr.io.raddr1       := decode.io.dec_i0_rs2_d
  gpr.io.wen0         := decode.io.dec_i0_wen_r
  gpr.io.waddr0       := decode.io.dec_i0_waddr_r
  gpr.io.wd0          := decode.io.dec_i0_wdata_r
  gpr.io.wen1         := decode.io.dec_nonblock_load_wen
  gpr.io.waddr1       := decode.io.dec_nonblock_load_waddr
  gpr.io.wd1          := io.lsu_dec.dctl_busbuff.lsu_nonblock_load_data
  gpr.io.wen2         := io.exu_div_wren
  gpr.io.waddr2       := decode.io.div_waddr_wb
  gpr.io.wd2          := io.exu_div_result
  gpr.io.scan_mode    := io.scan_mode
  io.dec_exu.gpr_exu <> gpr.io.gpr_exu
  tlu.io.tlu_mem <> io.ifu_dec.dec_mem_ctrl
  tlu.io.tlu_ifc <> io.ifu_dec.dec_ifc
  tlu.io.tlu_bp  <> io.ifu_dec.dec_bp
  tlu.io.tlu_exu <> io.dec_exu.tlu_exu
  tlu.io.tlu_dma <> io.dec_dma.tlu_dma
  tlu.io.active_clk                         :=  io.active_clk
  tlu.io.free_clk                           :=  io.free_clk
  tlu.io.scan_mode                          :=  io.scan_mode
  tlu.io.rst_vec                            :=  io.rst_vec
  tlu.io.nmi_int                            :=  io.nmi_int
  tlu.io.nmi_vec                            :=  io.nmi_vec
  tlu.io.i_cpu_halt_req                     :=  io.i_cpu_halt_req
  tlu.io.i_cpu_run_req                      :=  io.i_cpu_run_req
  tlu.io.lsu_fastint_stall_any              :=  io.lsu_fastint_stall_any
  tlu.io.ifu_pmu_instr_aligned              :=  io.ifu_dec.dec_aln.ifu_pmu_instr_aligned
  tlu.io.dec_pmu_instr_decoded              :=  decode.io.dec_pmu_instr_decoded
  tlu.io.dec_pmu_decode_stall               :=  decode.io.dec_pmu_decode_stall
  tlu.io.dec_pmu_presync_stall              :=  decode.io.dec_pmu_presync_stall
  tlu.io.dec_pmu_postsync_stall             :=  decode.io.dec_pmu_postsync_stall
  tlu.io.lsu_store_stall_any                :=  io.lsu_store_stall_any
  io.lsu_dec.tlu_busbuff <> tlu.io.tlu_busbuff
  io.lsu_tlu <> tlu.io.lsu_tlu
  io.dec_pic <> tlu.io.dec_pic
  tlu.io.lsu_fir_addr                       :=  io.lsu_fir_addr
  tlu.io.lsu_fir_error                      :=  io.lsu_fir_error
  tlu.io.iccm_dma_sb_error                  :=  io.iccm_dma_sb_error
  tlu.io.lsu_error_pkt_r                    :=  io.lsu_error_pkt_r
  tlu.io.lsu_single_ecc_error_incr          :=  io.lsu_single_ecc_error_incr
  tlu.io.dec_pause_state                    :=  decode.io.dec_pause_state
  tlu.io.dec_csr_wen_unq_d                  :=  decode.io.dec_csr_wen_unq_d
  tlu.io.dec_csr_any_unq_d                  :=  decode.io.dec_csr_any_unq_d
  tlu.io.dec_csr_rdaddr_d                   :=  decode.io.dec_csr_rdaddr_d
  tlu.io.dec_csr_wen_r                      :=  decode.io.dec_csr_wen_r
  tlu.io.dec_csr_wraddr_r                   :=  decode.io.dec_csr_wraddr_r
  tlu.io.dec_csr_wrdata_r                   :=  decode.io.dec_csr_wrdata_r
  tlu.io.dec_csr_stall_int_ff               :=  decode.io.dec_csr_stall_int_ff
  tlu.io.dec_tlu_i0_valid_r                 :=  decode.io.dec_tlu_i0_valid_r
  tlu.io.dec_tlu_i0_pc_r                    :=  decode.io.dec_tlu_i0_pc_r
  tlu.io.dec_tlu_packet_r                   :=  decode.io.dec_tlu_packet_r
  tlu.io.dec_illegal_inst                   :=  decode.io.dec_illegal_inst
  tlu.io.dec_i0_decode_d                    :=  decode.io.dec_aln.dec_i0_decode_d
  tlu.io.exu_i0_br_way_r                    :=  io.exu_i0_br_way_r
  tlu.io.dbg_halt_req                       :=  io.dbg_halt_req
  tlu.io.dbg_resume_req                     :=  io.dbg_resume_req
  tlu.io.lsu_idle_any                       :=  io.lsu_idle_any
  tlu.io.dec_div_active                     :=  decode.io.dec_div_active
//  tlu.io.pic_claimid                        :=  io.dec_pic.pic_claimid
//  tlu.io.pic_pl                             :=  io.dec_pic.pic_pl
//  tlu.io.mhwakeup                           :=  io.dec_pic.mhwakeup
//  tlu.io.mexintpend                         :=  io.mexintpend
  tlu.io.timer_int                          :=  io.timer_int
  tlu.io.soft_int                           :=  io.soft_int
  tlu.io.core_id                            :=  io.core_id
  tlu.io.mpc_debug_halt_req                 :=  io.mpc_debug_halt_req
  tlu.io.mpc_debug_run_req                  :=  io.mpc_debug_run_req
  tlu.io.mpc_reset_run_req                  :=  io.mpc_reset_run_req
  io.dec_dbg_cmd_done      := tlu.io.dec_dbg_cmd_done
  io.dec_dbg_cmd_fail      := tlu.io.dec_dbg_cmd_fail
  io.dec_tlu_dbg_halted    := tlu.io.dec_tlu_dbg_halted
  io.dec_tlu_debug_mode    := tlu.io.dec_tlu_debug_mode
  io.dec_tlu_resume_ack    := tlu.io.dec_tlu_resume_ack
  io.dec_tlu_mpc_halted_only                      := tlu.io.dec_tlu_mpc_halted_only
  io.trigger_pkt_any        := tlu.io.trigger_pkt_any
  io.o_cpu_halt_status      := tlu.io.o_cpu_halt_status
  io.o_cpu_halt_ack         := tlu.io.o_cpu_halt_ack
  io.o_cpu_run_ack          := tlu.io.o_cpu_run_ack
  io.o_debug_mode_status    := tlu.io.o_debug_mode_status
  io.mpc_debug_halt_ack     := tlu.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack      := tlu.io.mpc_debug_run_ack
  io.debug_brkpt_status     := tlu.io.debug_brkpt_status
//  io.dec_pic.dec_tlu_meicurpl       := tlu.io.dec_tlu_meicurpl
//  io.dec_pic.dec_tlu_meipt          := tlu.io.dec_tlu_meipt
  io.dec_tlu_i0_kill_writeb_r    := tlu.io.dec_tlu_i0_kill_writeb_r
  io.dec_tlu_perfcnt0       := tlu.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1       := tlu.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2       := tlu.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3       := tlu.io.dec_tlu_perfcnt3
  dec_tlu_i0_exc_valid_wb1     := tlu.io.dec_tlu_i0_exc_valid_wb1
  dec_tlu_i0_valid_wb1         := tlu.io.dec_tlu_i0_valid_wb1
  dec_tlu_int_valid_wb1        := tlu.io.dec_tlu_int_valid_wb1
  dec_tlu_exc_cause_wb1        := tlu.io.dec_tlu_exc_cause_wb1
  dec_tlu_mtval_wb1            := tlu.io.dec_tlu_mtval_wb1
  io.dec_tlu_misc_clk_override    := tlu.io.dec_tlu_misc_clk_override
  io.dec_tlu_ifu_clk_override      := tlu.io.dec_tlu_ifu_clk_override
  io.dec_tlu_lsu_clk_override      := tlu.io.dec_tlu_lsu_clk_override
  io.dec_tlu_bus_clk_override      := tlu.io.dec_tlu_bus_clk_override
  io.dec_tlu_pic_clk_override      := tlu.io.dec_tlu_pic_clk_override
  io.dec_tlu_dccm_clk_override     := tlu.io.dec_tlu_dccm_clk_override
  io.dec_tlu_icm_clk_override      := tlu.io.dec_tlu_icm_clk_override

  //--------------------------------------------------------------------------//

  io.rv_trace_pkt.rv_i_insn_ip := decode.io.dec_i0_inst_wb1
  io.rv_trace_pkt.rv_i_address_ip := Cat(decode.io.dec_i0_pc_wb1, 0.U)
  io.rv_trace_pkt.rv_i_valid_ip := Cat(tlu.io.dec_tlu_int_valid_wb1, tlu.io.dec_tlu_i0_valid_wb1 | tlu.io.dec_tlu_i0_exc_valid_wb1)
  io.rv_trace_pkt.rv_i_exception_ip := Cat(tlu.io.dec_tlu_int_valid_wb1, tlu.io.dec_tlu_i0_exc_valid_wb1)
  io.rv_trace_pkt.rv_i_ecause_ip := tlu.io.dec_tlu_exc_cause_wb1(4,0)
  io.rv_trace_pkt.rv_i_interrupt_ip := Cat(tlu.io.dec_tlu_int_valid_wb1, 0.U)
  io.rv_trace_pkt.rv_i_tval_ip := tlu.io.dec_tlu_mtval_wb1


  // debug command read data
  io.dec_dbg_rddata := decode.io.dec_i0_wdata_r
}

object dec_main extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new dec()))
}