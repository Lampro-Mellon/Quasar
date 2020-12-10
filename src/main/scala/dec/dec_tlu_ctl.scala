package dec
import chisel3._
import chisel3.util._
import lib._
import include._
import inst_pkt_t._
import lsu._
import exu._

trait CSR_VAL {

	val MSTATUS_MIE		=0
	val MIP_MCEIP 		=5
	val MIP_MITIP0 		=4
	val MIP_MITIP1 		=3
	val MIP_MEIP 		=2
	val MIP_MTIP 		=1
	val MIP_MSIP 		=0

	val MIE_MCEIE 		=5
	val MIE_MITIE0 		=4
	val MIE_MITIE1 		=3
	val MIE_MEIE 		=2
	val MIE_MTIE 		=1
	val MIE_MSIE 		=0

	val DCSR_EBREAKM 	=15
	val DCSR_STEPIE 	=11
	val DCSR_STOPC 		=10
	val DCSR_STEP 		=2
	
    val MTDATA1_DMODE 		=9
	val MTDATA1_SEL 		=7
	val MTDATA1_ACTION 		=6
	val MTDATA1_CHAIN 		=5
	val MTDATA1_MATCH 		=4
	val MTDATA1_M_ENABLED 	=3
	val MTDATA1_EXE 		=2
	val MTDATA1_ST 			=1
	val MTDATA1_LD 			=0


}

class dec_tlu_ctl_IO extends Bundle with lib {
	val tlu_exu = Flipped(new tlu_exu)
	val tlu_dma = new tlu_dma
	val active_clk    = Input(Clock())
	val free_clk      = Input(Clock())
	val scan_mode     = Input(Bool())
	val        rst_vec         = Input(UInt(31.W))    // reset vector, from core pins
	val        nmi_int         = Input(UInt(1.W))    // nmi pin
	val        nmi_vec         = Input(UInt(31.W))    // nmi vector
	val  i_cpu_halt_req        = Input(UInt(1.W))        // Asynchronous Halt request to CPU
	val  i_cpu_run_req         = Input(UInt(1.W))        // Asynchronous Restart request to CPU
	val lsu_fastint_stall_any  = Input(UInt(1.W))   // needed by lsu for 2nd pass of dma with ecc correction, stall next cycle
	val       lsu_idle_any                = Input(UInt(1.W)) // lsu is idle
	// perf counter inputs
	val       dec_pmu_instr_decoded   = Input(UInt(1.W))// decoded instructions
	val       dec_pmu_decode_stall    = Input(UInt(1.W))// decode stall
	val       dec_pmu_presync_stall   = Input(UInt(1.W))// decode stall due to presync'd inst
	val       dec_pmu_postsync_stall  = Input(UInt(1.W))// decode stall due to postsync'd inst
	val       lsu_store_stall_any     = Input(UInt(1.W))// SB or WB is full, stall decode
	val     lsu_fir_addr           = Input(UInt(31.W)) // Fast int address
	val     lsu_fir_error           = Input(UInt(2.W)) // Fast int lookup error
	val     iccm_dma_sb_error  = Input(UInt(1.W))      // I side dma single bit error
	val     lsu_error_pkt_r  = Flipped(Valid(new lsu_error_pkt_t))// lsu precise exception/error packet
	val     lsu_single_ecc_error_incr = Input(UInt(1.W)) // LSU inc SB error counter
	val         dec_pause_state = Input(UInt(1.W)) // Pause counter not zero
	val        dec_csr_wen_unq_d = Input(UInt(1.W))       // valid csr with write - for csr legal
	val        dec_csr_any_unq_d = Input(UInt(1.W))       // valid csr - for csr legal
	val        dec_csr_rdaddr_d = Input(UInt(12.W))      // read address for csr
	val        dec_csr_wen_r = Input(UInt(1.W))      // csr write enable at wb
	val        dec_csr_wraddr_r = Input(UInt(12.W))      // write address for csr
	val        dec_csr_wrdata_r = Input(UInt(32.W))   // csr write data at wb
	val        dec_csr_stall_int_ff = Input(UInt(1.W)) // csr is mie/mstatus
	val       dec_tlu_i0_valid_r = Input(UInt(1.W)) // pipe 0 op at e4 is valid
	val       dec_tlu_i0_pc_r = Input(UInt(31.W)) // for PC/NPC tracking
	val       dec_tlu_packet_r = Input(new trap_pkt_t) // exceptions known at decode
	val        dec_illegal_inst = Input(UInt(32.W)) // For mtval
	val        dec_i0_decode_d = Input(UInt(1.W))  // decode valid, used for clean icache diagnostics
	val             exu_i0_br_way_r = Input(UInt(1.W))// way hit or repl

	// Debug start
	val dec_dbg_cmd_done      = Output(UInt(1.W)) // abstract command done
	val dec_dbg_cmd_fail      = Output(UInt(1.W)) // abstract command failed
	val dec_tlu_dbg_halted    = Output(UInt(1.W)) // Core is halted and ready for debug command
	val dec_tlu_debug_mode    = Output(UInt(1.W)) // Core is in debug mode
	val dec_tlu_resume_ack    = Output(UInt(1.W)) // Resume acknowledge
	val dec_tlu_debug_stall    = Output(UInt(1.W)) // stall decode while waiting on core to empty
	val dec_tlu_mpc_halted_only     = Output(UInt(1.W)) // Core is halted only due to MPC
	val dec_tlu_flush_extint        = Output(UInt(1.W)) // fast ext int started
	val dbg_halt_req = Input(UInt(1.W)) // DM requests a halt
	val dbg_resume_req = Input(UInt(1.W)) // DM requests a resume
	val dec_div_active = Input(UInt(1.W)) // oop div is active
	val trigger_pkt_any             = Output(Vec(4,new trigger_pkt_t))// trigger info for trigger blocks
//	val pic_claimid  = Input(UInt(8.W)) // pic claimid for csr
//	val pic_pl = Input(UInt(4.W)) // pic priv level for csr
//	val mhwakeup = Input(UInt(1.W)) // high priority external int, wakeup if halted
//	val mexintpend= Input(UInt(1.W)) // external interrupt pending
	val timer_int= Input(UInt(1.W)) // timer interrupt pending
	val soft_int= Input(UInt(1.W)) // software interrupt pending
	val o_cpu_halt_status     = Output(UInt(1.W)) // PMU interface, halted
	val o_cpu_halt_ack        = Output(UInt(1.W)) // halt req ack
	val o_cpu_run_ack         = Output(UInt(1.W)) // run req ack
	val o_debug_mode_status   = Output(UInt(1.W)) // Core to the PMU that core is in debug mode. When core is in debug mode, the PMU should refrain from sendng a halt or run request
	val core_id = Input(UInt(28.W)) // Core ID
	// external MPC halt/run interface
	val mpc_debug_halt_req  = Input(UInt(1.W))  // Async halt request
	val mpc_debug_run_req = Input(UInt(1.W)) // Async run request
	val mpc_reset_run_req = Input(UInt(1.W)) // Run/halt after reset
	val mpc_debug_halt_ack          = Output(UInt(1.W)) // Halt ack
	val mpc_debug_run_ack           = Output(UInt(1.W)) // Run ack
	val debug_brkpt_status          = Output(UInt(1.W)) // debug breakpoint
//	val dec_tlu_meicurpl            = Output(UInt(4.W)) // to PIC
//	val  dec_tlu_meipt              = Output(UInt(4.W)) // to PIC
	val  dec_csr_rddata_d           = Output(UInt(32.W))      // csr read data at wb
	val dec_csr_legal_d             = Output(UInt(1.W))              // csr indicates legal operation
	val dec_tlu_i0_kill_writeb_wb   = Output(UInt(1.W))    // I0 is flushed, don't writeback any results to arch state
	val dec_tlu_i0_kill_writeb_r    = Output(UInt(1.W))    // I0 is flushed, don't writeback any results to arch state
	val dec_tlu_wr_pause_r          = Output(UInt(1.W))           // CSR write to pause reg is at R.
	val dec_tlu_flush_pause_r       = Output(UInt(1.W))        // Flush is due to pause
	val dec_tlu_presync_d           = Output(UInt(1.W))            // CSR read needs to be presync'd
	val dec_tlu_postsync_d          = Output(UInt(1.W))           // CSR needs to be presync'd
	val dec_tlu_perfcnt0            = Output(UInt(1.W)) // toggles when pipe0 perf counter 0 has an event inc
	val dec_tlu_perfcnt1            = Output(UInt(1.W)) // toggles when pipe0 perf counter 1 has an event inc
	val dec_tlu_perfcnt2            = Output(UInt(1.W)) // toggles when pipe0 perf counter 2 has an event inc
	val dec_tlu_perfcnt3            = Output(UInt(1.W)) // toggles when pipe0 perf counter 3 has an event inc
	val dec_tlu_i0_exc_valid_wb1    = Output(UInt(1.W)) // pipe 0 exception valid
	val dec_tlu_i0_valid_wb1        = Output(UInt(1.W))  // pipe 0 valid
	val dec_tlu_int_valid_wb1       = Output(UInt(1.W)) // pipe 2 int valid
	val dec_tlu_exc_cause_wb1       = Output(UInt(5.W)) // exception or int cause
	val dec_tlu_mtval_wb1           = Output(UInt(32.W)) // MTVAL value
	val  dec_tlu_pipelining_disable         = Output(UInt(1.W))      // disable pipelining
	// clock gating overrides from mcgc
	val  dec_tlu_misc_clk_override  = Output(UInt(1.W)) // override misc clock domain gating
	val  dec_tlu_dec_clk_override   = Output(UInt(1.W)) // override decode clock domain gating
	val  dec_tlu_ifu_clk_override   = Output(UInt(1.W)) // override fetch clock domain gating
	val  dec_tlu_lsu_clk_override   = Output(UInt(1.W)) // override load/store clock domain gating
	val  dec_tlu_bus_clk_override   = Output(UInt(1.W)) // override bus clock domain gating
	val  dec_tlu_pic_clk_override   = Output(UInt(1.W)) // override PIC clock domain gating
	val  dec_tlu_dccm_clk_override  = Output(UInt(1.W)) // override DCCM clock domain gating
	val  dec_tlu_icm_clk_override   = Output(UInt(1.W)) // override ICCM clock domain gating
	val dec_tlu_flush_lower_wb = Output(Bool())
	val ifu_pmu_instr_aligned = Input(UInt(1.W))
	val tlu_bp  = Flipped(new dec_bp)
	val tlu_ifc = Flipped(new dec_ifc)
	val tlu_mem = Flipped(new dec_mem_ctrl)
	val tlu_busbuff = Flipped (new tlu_busbuff)
	val lsu_tlu = Flipped (new lsu_tlu)
	val dec_pic = new dec_pic
}
class dec_tlu_ctl extends Module with lib with RequireAsyncReset with CSR_VAL{
  val io = IO(new dec_tlu_ctl_IO)

    val mtdata1_t					    = Wire(Vec(4,UInt(10.W)))
	val pause_expired_wb				=WireInit(UInt(1.W), 0.U)
	val take_nmi_r_d1					=WireInit(UInt(1.W),0.U)
	val exc_or_int_valid_r_d1			=WireInit(UInt(1.W),0.U)
	val interrupt_valid_r_d1			=WireInit(UInt(1.W),0.U)
	val tlu_flush_lower_r				=WireInit(UInt(1.W),0.U)
	val synchronous_flush_r				=WireInit(UInt(1.W),0.U)
	val interrupt_valid_r				=WireInit(UInt(1.W),0.U)
	val take_nmi						=WireInit(UInt(1.W),0.U)
	val take_reset						=WireInit(UInt(1.W),0.U)
	val take_int_timer1_int				=WireInit(UInt(1.W),0.U)
	val take_int_timer0_int				=WireInit(UInt(1.W),0.U)
	val take_timer_int					=WireInit(UInt(1.W),0.U)
	val take_soft_int					=WireInit(UInt(1.W),0.U)
	val take_ce_int						=WireInit(UInt(1.W),0.U)
	val take_ext_int_start 				=WireInit(UInt(1.W),0.U)
   	val ext_int_freeze 					=WireInit(UInt(1.W),0.U)
   	val ext_int_freeze_d1 				=WireInit(UInt(1.W),0.U)
   	val take_ext_int_start_d1 			=WireInit(UInt(1.W),0.U)
   	val take_ext_int_start_d2 			=WireInit(UInt(1.W),0.U)
   	val take_ext_int_start_d3 			=WireInit(UInt(1.W),0.U)
   	val fast_int_meicpct 				=WireInit(UInt(1.W),0.U)
   	val ignore_ext_int_due_to_lsu_stall =WireInit(UInt(1.W),0.U)
   	val take_ext_int 					=WireInit(UInt(1.W),0.U)
   	val internal_dbg_halt_timers		=WireInit(UInt(1.W),0.U)
   	val int_timer1_int_hold				=WireInit(UInt(1.W),0.U)
   	val int_timer0_int_hold				=WireInit(UInt(1.W),0.U)
   	val mhwakeup_ready 					=WireInit(UInt(1.W),0.U)
   	val ext_int_ready   				=WireInit(UInt(1.W),0.U)
   	val ce_int_ready    				=WireInit(UInt(1.W),0.U)
   	val soft_int_ready  				=WireInit(UInt(1.W),0.U)
   	val timer_int_ready 				=WireInit(UInt(1.W),0.U)
   	val ebreak_to_debug_mode_r_d1 		=WireInit(UInt(1.W),0.U)
   	val ebreak_to_debug_mode_r 			=WireInit(UInt(1.W),0.U)
   	val inst_acc_r						=WireInit(UInt(1.W),0.U)
   	val inst_acc_r_raw					=WireInit(UInt(1.W),0.U)
   	val iccm_sbecc_r					=WireInit(UInt(1.W),0.U)
   	val ic_perr_r						=WireInit(UInt(1.W),0.U)
   	val fence_i_r						=WireInit(UInt(1.W),0.U)
   	val ebreak_r    					=WireInit(UInt(1.W),0.U)
   	val ecall_r     					=WireInit(UInt(1.W),0.U)
   	val illegal_r   					=WireInit(UInt(1.W),0.U)
  	val mret_r      					=WireInit(UInt(1.W),0.U)
  	val iccm_repair_state_ns			=WireInit(UInt(1.W),0.U)
   	val rfpc_i0_r 						=WireInit(UInt(1.W),0.U)
   	val tlu_i0_kill_writeb_r			=WireInit(UInt(1.W),0.U)
   	val lsu_exc_valid_r_d1				=WireInit(UInt(1.W),0.U)
   	val lsu_i0_exc_r_raw				=WireInit(UInt(1.W),0.U)
   	val mdseac_locked_f					=WireInit(UInt(1.W),0.U)
   	val i_cpu_run_req_d1				=WireInit(UInt(1.W),0.U)
   	val cpu_run_ack						=WireInit(UInt(1.W),0.U)
   	val cpu_halt_status					=WireInit(UInt(1.W),0.U)
   	val cpu_halt_ack					=WireInit(UInt(1.W),0.U)
   	val pmu_fw_tlu_halted				=WireInit(UInt(1.W),0.U)
   	val internal_pmu_fw_halt_mode		=WireInit(UInt(1.W),0.U)
   	val pmu_fw_halt_req_ns				=WireInit(UInt(1.W),0.U)
   	val  pmu_fw_halt_req_f				=WireInit(UInt(1.W),0.U)
    val  pmu_fw_tlu_halted_f			=WireInit(UInt(1.W),0.U)
    val  int_timer0_int_hold_f			=WireInit(UInt(1.W),0.U)
    val  int_timer1_int_hold_f			=WireInit(UInt(1.W),0.U)
    val trigger_hit_dmode_r 			=WireInit(UInt(1.W),0.U)
    val i0_trigger_hit_r				=WireInit(UInt(1.W),0.U)
    val pause_expired_r					=WireInit(UInt(1.W),0.U)
    val dec_tlu_pmu_fw_halted			=WireInit(UInt(1.W),0.U)
    val dec_tlu_flush_noredir_r_d1		=WireInit(UInt(1.W),0.U)
	val halt_taken_f					=WireInit(UInt(1.W),0.U)
	val lsu_idle_any_f					=WireInit(UInt(1.W),0.U)
	val ifu_miss_state_idle_f			=WireInit(UInt(1.W),0.U)
	val dbg_tlu_halted_f				=WireInit(UInt(1.W),0.U)
	val debug_halt_req_f				=WireInit(UInt(1.W),0.U)
	val debug_resume_req_f				=WireInit(UInt(1.W),0.U)
	val trigger_hit_dmode_r_d1			=WireInit(UInt(1.W),0.U)
	val dcsr_single_step_done_f			=WireInit(UInt(1.W),0.U)
	val debug_halt_req_d1				=WireInit(UInt(1.W),0.U)
    val request_debug_mode_r_d1			=WireInit(UInt(1.W),0.U)
    val request_debug_mode_done_f		=WireInit(UInt(1.W),0.U)
    val dcsr_single_step_running_f		=WireInit(UInt(1.W),0.U)
    val dec_tlu_flush_pause_r_d1		=WireInit(UInt(1.W),0.U)
    val dbg_halt_req_held				=WireInit(UInt(1.W),0.U)
   	val debug_halt_req_ns 				=WireInit(UInt(1.W),0.U)
   	val internal_dbg_halt_mode			=WireInit(UInt(1.W),0.U)
   	val core_empty						=WireInit(UInt(1.W),0.U)
   	val dbg_halt_req_final 				=WireInit(UInt(1.W),0.U)
   	val debug_brkpt_status_ns 			=WireInit(UInt(1.W),0.U)
	val mpc_debug_halt_ack_ns 			=WireInit(UInt(1.W),0.U)
	val mpc_debug_run_ack_ns 			=WireInit(UInt(1.W),0.U)
	val mpc_halt_state_ns 				=WireInit(UInt(1.W),0.U)
	val mpc_run_state_ns 				=WireInit(UInt(1.W),0.U)
	val dbg_halt_state_ns 				=WireInit(UInt(1.W),0.U)
	val dbg_run_state_ns 				=WireInit(UInt(1.W),0.U)
	val dbg_halt_state_f 				=WireInit(UInt(1.W),0.U)
	val mpc_halt_state_f 				=WireInit(UInt(1.W),0.U)
	val nmi_int_detected 				=WireInit(UInt(1.W),0.U)
	val nmi_lsu_load_type 				=WireInit(UInt(1.W),0.U)
	val nmi_lsu_store_type 				=WireInit(UInt(1.W),0.U)
	val reset_delayed					=WireInit(UInt(1.W),0.U)
	val internal_dbg_halt_mode_f		=WireInit(UInt(1.W),0.U)
	val e5_valid						=WireInit(UInt(1.W),0.U)
	val ic_perr_r_d1					=WireInit(UInt(1.W),0.U)
	val iccm_sbecc_r_d1					=WireInit(UInt(1.W),0.U)

  val npc_r                       = WireInit(UInt(31.W),0.U)
  val npc_r_d1                    = WireInit(UInt(31.W),0.U)
  val mie_ns                      = WireInit(UInt(6.W),0.U)
  val mepc                        = WireInit(UInt(31.W),0.U)
  val mdseac_locked_ns            = WireInit(UInt(1.W),0.U)
  val force_halt 				          = WireInit(UInt(1.W),0.U)
  val dpc                         = WireInit(UInt(31.W),0.U)
  val mstatus_mie_ns              = WireInit(UInt(1.W),0.U)
  val dec_csr_wen_r_mod           = WireInit(UInt(1.W),0.U)
  val fw_halt_req                 = WireInit(UInt(1.W),0.U)
  val mstatus                     = WireInit(UInt(2.W),0.U)
  val dcsr                        = WireInit(UInt(16.W),0.U)
  val mtvec                       = WireInit(UInt(31.W),0.U)
  val mip                         = WireInit(UInt(6.W),0.U)
  val csr_pkt                     = Wire(new dec_tlu_csr_pkt)
  val dec_tlu_mpc_halted_only_ns  = WireInit(UInt(1.W),0.U)
   // tell dbg we are only MPC halted
	dec_tlu_mpc_halted_only_ns := ~dbg_halt_state_f & mpc_halt_state_f
	val int_timers=Module(new dec_timer_ctl)
	int_timers.io.free_clk				:=io.free_clk
	int_timers.io.scan_mode				:=io.scan_mode
	int_timers.io.dec_csr_wen_r_mod		:=dec_csr_wen_r_mod     
	int_timers.io.dec_csr_rdaddr_d		:=io.dec_csr_rdaddr_d    		
	int_timers.io.dec_csr_wraddr_r		:=io.dec_csr_wraddr_r   	
	int_timers.io.dec_csr_wrdata_r		:=io.dec_csr_wrdata_r 
	int_timers.io.csr_mitctl0			:=csr_pkt.csr_mitctl0
	int_timers.io.csr_mitctl1			:=csr_pkt.csr_mitctl1
	int_timers.io.csr_mitb0				:=csr_pkt.csr_mitb0
	int_timers.io.csr_mitb1				:=csr_pkt.csr_mitb1	
	int_timers.io.csr_mitcnt0			:=csr_pkt.csr_mitcnt0
	int_timers.io.csr_mitcnt1			:=csr_pkt.csr_mitcnt1
	int_timers.io.dec_pause_state		:=io.dec_pause_state 	
	int_timers.io.dec_tlu_pmu_fw_halted	:=dec_tlu_pmu_fw_halted	
	int_timers.io.internal_dbg_halt_timers:=internal_dbg_halt_timers 

	val dec_timer_rddata_d		=int_timers.io.dec_timer_rddata_d
	val dec_timer_read_d		=int_timers.io.dec_timer_read_d 
	val dec_timer_t0_pulse		=int_timers.io.dec_timer_t0_pulse 
	val dec_timer_t1_pulse		=int_timers.io.dec_timer_t1_pulse 
	
	val clk_override = io.dec_tlu_dec_clk_override

   // Async inputs to the core have to be sync'd to the core clock.
   
   val syncro_ff=rvsyncss(Cat(io.nmi_int, io.timer_int, io.soft_int, io.i_cpu_halt_req, io.i_cpu_run_req, io.mpc_debug_halt_req, io.mpc_debug_run_req),io.free_clk)   
   val nmi_int_sync					=syncro_ff(6)
   val timer_int_sync				=syncro_ff(5)
   val soft_int_sync				=syncro_ff(4)
   val i_cpu_halt_req_sync			=syncro_ff(3)
   val i_cpu_run_req_sync			=syncro_ff(2)
   val mpc_debug_halt_req_sync_raw	=syncro_ff(1)
   val mpc_debug_run_req_sync		=syncro_ff(0)
   
   // for CSRs that have inpipe writes only
	val csr_wr_clk=rvclkhdr(clock,(dec_csr_wen_r_mod | clk_override).asBool,io.scan_mode)
	val lsu_r_wb_clk=rvclkhdr(clock,(io.lsu_error_pkt_r.valid | lsu_exc_valid_r_d1 | clk_override).asBool,io.scan_mode)

   val e4_valid = io.dec_tlu_i0_valid_r
   val e4e5_valid = e4_valid | e5_valid
   val flush_clkvalid = internal_dbg_halt_mode_f | i_cpu_run_req_d1 | interrupt_valid_r | interrupt_valid_r_d1 | reset_delayed | pause_expired_r | pause_expired_wb | ic_perr_r | ic_perr_r_d1 | iccm_sbecc_r | iccm_sbecc_r_d1 | clk_override
   
   	val e4e5_clk=rvclkhdr(clock,(e4e5_valid | clk_override).asBool,io.scan_mode)
	val e4e5_int_clk=rvclkhdr(clock,(e4e5_valid | flush_clkvalid).asBool,io.scan_mode)
   
	val iccm_repair_state_d1		=withClock(io.free_clk){RegNext(iccm_repair_state_ns,0.U)}
	ic_perr_r_d1					:=withClock(io.free_clk){RegNext(ic_perr_r,0.U)}
	iccm_sbecc_r_d1					:=withClock(io.free_clk){RegNext(iccm_sbecc_r,0.U)}
	e5_valid						:=withClock(io.free_clk){RegNext(e4_valid,0.U)}
	internal_dbg_halt_mode_f		:=withClock(io.free_clk){RegNext(internal_dbg_halt_mode,0.U)}
	val lsu_pmu_load_external_r		=withClock(io.free_clk){RegNext(io.lsu_tlu.lsu_pmu_load_external_m,0.U)}
	val lsu_pmu_store_external_r	=withClock(io.free_clk){RegNext(io.lsu_tlu.lsu_pmu_store_external_m,0.U)}
	val tlu_flush_lower_r_d1		=withClock(io.free_clk){RegNext(tlu_flush_lower_r,0.U)}
	io.dec_tlu_i0_kill_writeb_wb	:=withClock(io.free_clk){RegNext(tlu_i0_kill_writeb_r,0.U)}
	val internal_dbg_halt_mode_f2	=withClock(io.free_clk){RegNext(internal_dbg_halt_mode_f,0.U)}
	io.tlu_mem.dec_tlu_force_halt			:=withClock(io.free_clk){RegNext(force_halt,0.U)}
	
	
	
	io.dec_tlu_i0_kill_writeb_r 	:=tlu_i0_kill_writeb_r
	val reset_detect				=withClock(io.free_clk){RegNext(1.U(1.W),0.U)}
	val reset_detected				=withClock(io.free_clk){RegNext(reset_detect,0.U)}
	reset_delayed 				:=reset_detect ^ reset_detected
	
	val nmi_int_delayed 		=withClock(io.free_clk){RegNext(nmi_int_sync,0.U)}
	val nmi_int_detected_f		=withClock(io.free_clk){RegNext(nmi_int_detected,0.U)}
	val nmi_lsu_load_type_f		=withClock(io.free_clk){RegNext(nmi_lsu_load_type,0.U)}
	val nmi_lsu_store_type_f	=withClock(io.free_clk){RegNext(nmi_lsu_store_type,0.U)}


   // Filter subsequent bus errors after the first, until the lock on MDSEAC is cleared
	val nmi_lsu_detected = ~mdseac_locked_f & (io.tlu_busbuff.lsu_imprecise_error_load_any | io.tlu_busbuff.lsu_imprecise_error_store_any)

	nmi_int_detected := (nmi_int_sync & ~nmi_int_delayed) | nmi_lsu_detected | (nmi_int_detected_f & ~take_nmi_r_d1) |(take_ext_int_start_d3 & io.lsu_fir_error.orR)
   // if the first nmi is a lsu type, note it. If there's already an nmi pending, ignore
	nmi_lsu_load_type := (nmi_lsu_detected & io.tlu_busbuff.lsu_imprecise_error_load_any & ~(nmi_int_detected_f & ~take_nmi_r_d1)) | (nmi_lsu_load_type_f & ~take_nmi_r_d1)
	nmi_lsu_store_type := (nmi_lsu_detected & io.tlu_busbuff.lsu_imprecise_error_store_any & ~(nmi_int_detected_f & ~take_nmi_r_d1)) | (nmi_lsu_store_type_f & ~take_nmi_r_d1)

	// ----------------------------------------------------------------------
   // MPC halt
   // - can interact with debugger halt and v-v

   // fast ints in progress have priority
	val mpc_debug_halt_req_sync = mpc_debug_halt_req_sync_raw & ~ext_int_freeze_d1
	val mpc_debug_halt_req_sync_f	=withClock(io.free_clk){RegNext(mpc_debug_halt_req_sync,0.U)}
	val mpc_debug_run_req_sync_f	=withClock(io.free_clk){RegNext(mpc_debug_run_req_sync,0.U)}
	mpc_halt_state_f				:=withClock(io.free_clk){RegNext(mpc_halt_state_ns,0.U)}
	val mpc_run_state_f				=withClock(io.free_clk){RegNext(mpc_run_state_ns,0.U)}
	val debug_brkpt_status_f		=withClock(io.free_clk){RegNext(debug_brkpt_status_ns,0.U)}
	val mpc_debug_halt_ack_f		=withClock(io.free_clk){RegNext(mpc_debug_halt_ack_ns,0.U)}
	val mpc_debug_run_ack_f			=withClock(io.free_clk){RegNext(mpc_debug_run_ack_ns,0.U)}
	dbg_halt_state_f				:=withClock(io.free_clk){RegNext(dbg_halt_state_ns,0.U)}
	val dbg_run_state_f				=withClock(io.free_clk){RegNext(dbg_run_state_ns,0.U)}
	io.dec_tlu_mpc_halted_only		:=withClock(io.free_clk){RegNext(dec_tlu_mpc_halted_only_ns,0.U)}


   // turn level sensitive requests into pulses
	val mpc_debug_halt_req_sync_pulse = mpc_debug_halt_req_sync & ~mpc_debug_halt_req_sync_f
	val mpc_debug_run_req_sync_pulse  = mpc_debug_run_req_sync & ~mpc_debug_run_req_sync_f
   // states
	mpc_halt_state_ns := (mpc_halt_state_f | mpc_debug_halt_req_sync_pulse | (reset_delayed & ~io.mpc_reset_run_req)) & ~mpc_debug_run_req_sync
	mpc_run_state_ns := (mpc_run_state_f | (mpc_debug_run_req_sync_pulse & ~mpc_debug_run_ack_f)) & (internal_dbg_halt_mode_f & ~dcsr_single_step_running_f)

	dbg_halt_state_ns := (dbg_halt_state_f | (dbg_halt_req_final | dcsr_single_step_done_f | trigger_hit_dmode_r_d1 | ebreak_to_debug_mode_r_d1)) & ~io.dbg_resume_req
	dbg_run_state_ns := (dbg_run_state_f | io.dbg_resume_req) & (internal_dbg_halt_mode_f & ~dcsr_single_step_running_f)

   // tell dbg we are only MPC halted
	dec_tlu_mpc_halted_only_ns := ~dbg_halt_state_f & mpc_halt_state_f

   // this asserts from detection of bkpt until after we leave debug mode
	val debug_brkpt_valid = ebreak_to_debug_mode_r_d1 | trigger_hit_dmode_r_d1
	debug_brkpt_status_ns := (debug_brkpt_valid | debug_brkpt_status_f) & (internal_dbg_halt_mode & ~dcsr_single_step_running_f)

   // acks back to interface
	mpc_debug_halt_ack_ns := mpc_halt_state_f & internal_dbg_halt_mode_f & mpc_debug_halt_req_sync & core_empty
	mpc_debug_run_ack_ns := (mpc_debug_run_req_sync & ~dbg_halt_state_ns & ~mpc_debug_halt_req_sync) | (mpc_debug_run_ack_f & mpc_debug_run_req_sync)

   // Pins
	io.mpc_debug_halt_ack := mpc_debug_halt_ack_f
	io.mpc_debug_run_ack  := mpc_debug_run_ack_f
	io.debug_brkpt_status := debug_brkpt_status_f

   // DBG halt req is a pulse, fast ext int in progress has priority
	val dbg_halt_req_held_ns = (io.dbg_halt_req | dbg_halt_req_held) & ext_int_freeze_d1
	dbg_halt_req_final := (io.dbg_halt_req | dbg_halt_req_held) & ~ext_int_freeze_d1

   // combine MPC and DBG halt requests
	val debug_halt_req = (dbg_halt_req_final | mpc_debug_halt_req_sync | (reset_delayed & ~io.mpc_reset_run_req)) & ~internal_dbg_halt_mode_f & ~ext_int_freeze_d1

	val debug_resume_req = ~debug_resume_req_f & ((mpc_run_state_ns & ~dbg_halt_state_ns) | (dbg_run_state_ns & ~mpc_halt_state_ns))


   // HALT
   // dbg/pmu/fw requests halt, service as soon as lsu is not blocking interrupts
	val take_halt = (debug_halt_req_f | pmu_fw_halt_req_f) & ~synchronous_flush_r & ~mret_r & ~halt_taken_f & ~dec_tlu_flush_noredir_r_d1 & ~take_reset

   // hold after we take a halt, so we don't keep taking halts
	val halt_taken = (dec_tlu_flush_noredir_r_d1 & ~dec_tlu_flush_pause_r_d1 & ~take_ext_int_start_d1) | (halt_taken_f & ~dbg_tlu_halted_f & ~pmu_fw_tlu_halted_f & ~interrupt_valid_r_d1)

   // After doing halt flush (RFNPC) wait until core is idle before asserting a particular halt mode
   // It takes a cycle for mb_empty to assert after a fetch, take_halt covers that cycle
	core_empty := force_halt | (io.lsu_idle_any & lsu_idle_any_f & io.tlu_mem.ifu_miss_state_idle & ifu_miss_state_idle_f & ~debug_halt_req & ~debug_halt_req_d1 & ~io.dec_div_active)

//--------------------------------------------------------------------------------
// Debug start
//

	val enter_debug_halt_req = (~internal_dbg_halt_mode_f & debug_halt_req) | dcsr_single_step_done_f | trigger_hit_dmode_r_d1 | ebreak_to_debug_mode_r_d1

   // dbg halt state active from request until non-step resume
	internal_dbg_halt_mode := debug_halt_req_ns | (internal_dbg_halt_mode_f & ~(debug_resume_req_f & ~dcsr(DCSR_STEP)))
   // dbg halt can access csrs as long as we are not stepping
	val allow_dbg_halt_csr_write = internal_dbg_halt_mode_f & ~dcsr_single_step_running_f


   // hold debug_halt_req_ns high until we enter debug halt

	val dbg_tlu_halted = (debug_halt_req_f & core_empty & halt_taken) | (dbg_tlu_halted_f & ~debug_resume_req_f)
	debug_halt_req_ns := enter_debug_halt_req | (debug_halt_req_f & ~dbg_tlu_halted)
	val resume_ack_ns = (debug_resume_req_f & dbg_tlu_halted_f & dbg_run_state_ns)

	val dcsr_single_step_done = io.dec_tlu_i0_valid_r & ~io.dec_tlu_dbg_halted & dcsr(DCSR_STEP) & ~rfpc_i0_r

	val dcsr_single_step_running = (debug_resume_req_f & dcsr(DCSR_STEP)) | (dcsr_single_step_running_f & ~dcsr_single_step_done_f)

	val dbg_cmd_done_ns = io.dec_tlu_i0_valid_r & io.dec_tlu_dbg_halted

   // used to hold off commits after an in-pipe debug mode request (triggers, DCSR)
	val request_debug_mode_r = (trigger_hit_dmode_r | ebreak_to_debug_mode_r) | (request_debug_mode_r_d1 & ~io.dec_tlu_flush_lower_wb)

	val request_debug_mode_done = (request_debug_mode_r_d1 | request_debug_mode_done_f) & ~dbg_tlu_halted_f
	
	
	dec_tlu_flush_noredir_r_d1		:=withClock(io.free_clk){RegNext(io.tlu_ifc.dec_tlu_flush_noredir_wb,0.U)}
	halt_taken_f					:=withClock(io.free_clk){RegNext(halt_taken,0.U)}
	lsu_idle_any_f					:=withClock(io.free_clk){RegNext(io.lsu_idle_any,0.U)}
	ifu_miss_state_idle_f			:=withClock(io.free_clk){RegNext(io.tlu_mem.ifu_miss_state_idle,0.U)}
	dbg_tlu_halted_f				:=withClock(io.free_clk){RegNext(dbg_tlu_halted,0.U)}
	io.dec_tlu_resume_ack			:=withClock(io.free_clk){RegNext(resume_ack_ns,0.U)}
	debug_halt_req_f				:=withClock(io.free_clk){RegNext(debug_halt_req_ns,0.U)}
	debug_resume_req_f				:=withClock(io.free_clk){RegNext(debug_resume_req,0.U)}
	trigger_hit_dmode_r_d1			:=withClock(io.free_clk){RegNext(trigger_hit_dmode_r,0.U)}
	dcsr_single_step_done_f			:=withClock(io.free_clk){RegNext(dcsr_single_step_done,0.U)}
	debug_halt_req_d1				:=withClock(io.free_clk){RegNext(debug_halt_req,0.U)}
	val dec_tlu_wr_pause_r_d1		 =withClock(io.free_clk){RegNext(io.dec_tlu_wr_pause_r,0.U)}
	val dec_pause_state_f			 =withClock(io.free_clk){RegNext(io.dec_pause_state,0.U)}
    request_debug_mode_r_d1			:=withClock(io.free_clk){RegNext(request_debug_mode_r,0.U)}
    request_debug_mode_done_f		:=withClock(io.free_clk){RegNext(request_debug_mode_done,0.U)}
    dcsr_single_step_running_f		:=withClock(io.free_clk){RegNext(dcsr_single_step_running,0.U)}
    dec_tlu_flush_pause_r_d1		:=withClock(io.free_clk){RegNext(io.dec_tlu_flush_pause_r,0.U)}
    dbg_halt_req_held				:=withClock(io.free_clk){RegNext(dbg_halt_req_held_ns,0.U)}
   
    
	io.dec_tlu_debug_stall 		:= debug_halt_req_f
	io.dec_tlu_dbg_halted 		:= dbg_tlu_halted_f
	io.dec_tlu_debug_mode 		:= internal_dbg_halt_mode_f
	dec_tlu_pmu_fw_halted 		:= pmu_fw_tlu_halted_f

   // kill fetch redirection on flush if going to halt, or if there's a fence during db-halt
	io.tlu_ifc.dec_tlu_flush_noredir_wb := take_halt | (fence_i_r & internal_dbg_halt_mode) | io.dec_tlu_flush_pause_r | (i0_trigger_hit_r & trigger_hit_dmode_r) | take_ext_int_start

	io.dec_tlu_flush_extint := take_ext_int_start

   // 1 cycle after writing the PAUSE counter, flush with noredir to idle F1-D.
	io.dec_tlu_flush_pause_r := dec_tlu_wr_pause_r_d1 & ~interrupt_valid_r & ~take_ext_int_start
   // detect end of pause counter and rfpc
	pause_expired_r := ~io.dec_pause_state & dec_pause_state_f & ~(ext_int_ready | ce_int_ready | timer_int_ready | soft_int_ready | int_timer0_int_hold_f | int_timer1_int_hold_f | nmi_int_detected | ext_int_freeze_d1) & ~interrupt_valid_r_d1 & ~debug_halt_req_f & ~pmu_fw_halt_req_f & ~halt_taken_f

	io.tlu_bp.dec_tlu_flush_leak_one_wb := io.tlu_exu.dec_tlu_flush_lower_r  & dcsr(DCSR_STEP) & (io.dec_tlu_resume_ack | dcsr_single_step_running) & ~io.tlu_ifc.dec_tlu_flush_noredir_wb
	io.tlu_mem.dec_tlu_flush_err_wb := io.tlu_exu.dec_tlu_flush_lower_r & (ic_perr_r_d1 | iccm_sbecc_r_d1)

   // If DM attempts to access an illegal CSR, send cmd_fail back
	io.dec_dbg_cmd_done := dbg_cmd_done_ns
	io.dec_dbg_cmd_fail := illegal_r & io.dec_dbg_cmd_done


   //--------------------------------------------------------------------------------
   //--------------------------------------------------------------------------------
   // Triggers
   //

   // Prioritize trigger hits with other exceptions.
   //
   // Trigger should have highest priority except:
   // - trigger is an execute-data and there is an inst_access exception (lsu triggers won't fire, inst. is nop'd by decode)
   // - trigger is a store-data and there is a lsu_acc_exc or lsu_ma_exc.
	val trigger_execute  = Cat(mtdata1_t(3)(MTDATA1_EXE), mtdata1_t(2)(MTDATA1_EXE), mtdata1_t(1)(MTDATA1_EXE), mtdata1_t(0)(MTDATA1_EXE))
	val trigger_data	 = Cat(mtdata1_t(3)(MTDATA1_SEL), mtdata1_t(2)(MTDATA1_SEL), mtdata1_t(1)(MTDATA1_SEL), mtdata1_t(0)(MTDATA1_SEL))
	val trigger_store	 = Cat(mtdata1_t(3)(MTDATA1_ST),  mtdata1_t(2)(MTDATA1_ST),  mtdata1_t(1)(MTDATA1_ST),  mtdata1_t(0)(MTDATA1_ST))

   // MSTATUS[MIE] needs to be on to take triggers unless the action is trigger to debug mode.
   val trigger_enabled	 = Cat((mtdata1_t(3)(MTDATA1_ACTION) | mstatus(MSTATUS_MIE)) & mtdata1_t(3)(MTDATA1_M_ENABLED),(mtdata1_t(2)(MTDATA1_ACTION) | mstatus(MSTATUS_MIE)) & mtdata1_t(2)(MTDATA1_M_ENABLED), (mtdata1_t(1)(MTDATA1_ACTION) | mstatus(MSTATUS_MIE)) & mtdata1_t(1)(MTDATA1_M_ENABLED), (mtdata1_t(0)(MTDATA1_ACTION) | mstatus(MSTATUS_MIE)) & mtdata1_t(0)(MTDATA1_M_ENABLED))

   // iside exceptions are always in i0
   val i0_iside_trigger_has_pri_r  = ~((trigger_execute & trigger_data & Fill(4,inst_acc_r_raw)) | (Fill(4,io.tlu_exu.exu_i0_br_error_r | io.tlu_exu.exu_i0_br_start_error_r)))

   // lsu excs have to line up with their respective triggers since the lsu op can be i0
   val i0_lsu_trigger_has_pri_r = ~(trigger_store & trigger_data & Fill(4,lsu_i0_exc_r_raw))

   // trigger hits have to be eval'd to cancel side effect lsu ops even though the pipe is already frozen
   val i0_trigger_eval_r = io.dec_tlu_i0_valid_r

   val i0trigger_qual_r = Fill(4,i0_trigger_eval_r) & io.dec_tlu_packet_r.i0trigger(3,0) & i0_iside_trigger_has_pri_r & i0_lsu_trigger_has_pri_r & trigger_enabled
   // Qual trigger hits
   val i0_trigger_r = ~(Fill(4,io.dec_tlu_flush_lower_wb | io.dec_tlu_dbg_halted)) & i0trigger_qual_r

   // chaining can mask raw trigger info
   val i0_trigger_chain_masked_r  = Cat(i0_trigger_r(3) & (~mtdata1_t(2)(MTDATA1_CHAIN) | i0_trigger_r(2)), i0_trigger_r(2) & (~mtdata1_t(2)(MTDATA1_CHAIN) | i0_trigger_r(3)), i0_trigger_r(1) & (~mtdata1_t(0)(MTDATA1_CHAIN) | i0_trigger_r(0)), i0_trigger_r(0) & (~mtdata1_t(0)(MTDATA1_CHAIN) | i0_trigger_r(1)))

   // This is the highest priority by this point.
   val i0_trigger_hit_raw_r = i0_trigger_chain_masked_r.orR

   i0_trigger_hit_r 	:= i0_trigger_hit_raw_r

   // Actions include breakpoint, or dmode. Dmode is only possible if the DMODE bit is set.
   // Otherwise, take a breakpoint.
   val trigger_action	 = Cat(mtdata1_t(3)(MTDATA1_ACTION) & mtdata1_t(3)(MTDATA1_DMODE), mtdata1_t(2)(MTDATA1_ACTION) & mtdata1_t(2)(MTDATA1_DMODE), mtdata1_t(1)(MTDATA1_ACTION) & mtdata1_t(1)(MTDATA1_DMODE), mtdata1_t(0)(MTDATA1_ACTION) & mtdata1_t(0)(MTDATA1_DMODE))

   // this is needed to set the HIT bit in the triggers
   val update_hit_bit_r	   = (Fill(4,i0_trigger_hit_r) & i0_trigger_chain_masked_r)

   // action, 1 means dmode. Simultaneous triggers with at least 1 set for dmode force entire action to dmode.
   val i0_trigger_action_r = (i0_trigger_chain_masked_r & trigger_action).orR

   trigger_hit_dmode_r := (i0_trigger_hit_r & i0_trigger_action_r)

   val mepc_trigger_hit_sel_pc_r = i0_trigger_hit_r & ~trigger_hit_dmode_r

//
// Debug end


   //----------------------------------------------------------------------
   //
   // Commit
   //
   //----------------------------------------------------------------------



   //--------------------------------------------------------------------------------
   // External halt (not debug halt)
   // - Fully interlocked handshake
   // i_cpu_halt_req  ____|--------------|_______________
   // core_empty      ---------------|___________
   // o_cpu_halt_ack  _________________|----|__________
   // o_cpu_halt_status _______________|---------------------|_________
   // i_cpu_run_req                              ______|----------|____
   // o_cpu_run_ack                              ____________|------|________
   //


   // debug mode has priority, ignore PMU/FW halt/run while in debug mode
	val i_cpu_halt_req_sync_qual = i_cpu_halt_req_sync & ~io.dec_tlu_debug_mode & ~ext_int_freeze_d1
	val i_cpu_run_req_sync_qual = i_cpu_run_req_sync & ~io.dec_tlu_debug_mode & pmu_fw_tlu_halted_f & ~ext_int_freeze_d1

	val  i_cpu_halt_req_d1			=withClock(io.free_clk){RegNext(i_cpu_halt_req_sync_qual,0.U)}
	val  i_cpu_run_req_d1_raw		=withClock(io.free_clk){RegNext(i_cpu_run_req_sync_qual,0.U)}
	io.o_cpu_halt_status			:=withClock(io.free_clk){RegNext(cpu_halt_status,0.U)}
    io.o_cpu_halt_ack				:=withClock(io.free_clk){RegNext(cpu_halt_ack,0.U)}
    io.o_cpu_run_ack				:=withClock(io.free_clk){RegNext(cpu_run_ack,0.U)}
    val  internal_pmu_fw_halt_mode_f=withClock(io.free_clk){RegNext(internal_pmu_fw_halt_mode,0.U)}
    pmu_fw_halt_req_f			:=withClock(io.free_clk){RegNext(pmu_fw_halt_req_ns,0.U)}
    pmu_fw_tlu_halted_f			:=withClock(io.free_clk){RegNext(pmu_fw_tlu_halted,0.U)}
    int_timer0_int_hold_f		:=withClock(io.free_clk){RegNext(int_timer0_int_hold,0.U)}
    int_timer1_int_hold_f		:=withClock(io.free_clk){RegNext(int_timer1_int_hold,0.U)}
    

   // only happens if we aren't in dgb_halt
   val ext_halt_pulse = i_cpu_halt_req_sync_qual & ~i_cpu_halt_req_d1
   val enter_pmu_fw_halt_req =  ext_halt_pulse | fw_halt_req
   pmu_fw_halt_req_ns := (enter_pmu_fw_halt_req | (pmu_fw_halt_req_f & ~pmu_fw_tlu_halted)) & ~debug_halt_req_f
   internal_pmu_fw_halt_mode := pmu_fw_halt_req_ns | (internal_pmu_fw_halt_mode_f & ~i_cpu_run_req_d1 & ~debug_halt_req_f)

   // debug halt has priority
   pmu_fw_tlu_halted := ((pmu_fw_halt_req_f & core_empty & halt_taken & ~enter_debug_halt_req) | (pmu_fw_tlu_halted_f & ~i_cpu_run_req_d1)) & ~debug_halt_req_f

   cpu_halt_ack := i_cpu_halt_req_d1 & pmu_fw_tlu_halted_f
   cpu_halt_status := (pmu_fw_tlu_halted_f & ~i_cpu_run_req_d1) | (io.o_cpu_halt_status & ~i_cpu_run_req_d1 & ~internal_dbg_halt_mode_f)
   cpu_run_ack := (io.o_cpu_halt_status & i_cpu_run_req_sync_qual) | (io.o_cpu_run_ack & i_cpu_run_req_sync_qual)
   val debug_mode_status = internal_dbg_halt_mode_f
   io.o_debug_mode_status := debug_mode_status
   
      // high priority interrupts can wakeup from external halt, so can unmasked timer interrupts
   i_cpu_run_req_d1 := i_cpu_run_req_d1_raw | ((nmi_int_detected | timer_int_ready | soft_int_ready | int_timer0_int_hold_f | int_timer1_int_hold_f | (io.dec_pic.mhwakeup & mhwakeup_ready)) & io.o_cpu_halt_status & ~i_cpu_halt_req_d1)

   //--------------------------------------------------------------------------------
   //--------------------------------------------------------------------------------

   val lsu_single_ecc_error_r 		=io.lsu_single_ecc_error_incr
   mdseac_locked_f					:=withClock(io.free_clk){RegNext(mdseac_locked_ns,0.U)}
   val lsu_single_ecc_error_r_d1	=withClock(io.free_clk){RegNext(lsu_single_ecc_error_r,0.U)}
   val lsu_error_pkt_addr_r		 	=io.lsu_error_pkt_r.bits.addr
   val lsu_exc_valid_r_raw = io.lsu_error_pkt_r.valid & ~io.dec_tlu_flush_lower_wb
   lsu_i0_exc_r_raw :=  io.lsu_error_pkt_r.valid
   val lsu_i0_exc_r = lsu_i0_exc_r_raw & lsu_exc_valid_r_raw & ~i0_trigger_hit_r & ~rfpc_i0_r
   val lsu_exc_valid_r = lsu_i0_exc_r
   lsu_exc_valid_r_d1			:=withClock(lsu_r_wb_clk){RegNext(lsu_exc_valid_r,0.U)}
   val lsu_i0_exc_r_d1			=withClock(lsu_r_wb_clk){RegNext(lsu_i0_exc_r,0.U)}
   val lsu_exc_ma_r  =  lsu_i0_exc_r & ~io.lsu_error_pkt_r.bits.exc_type
   val lsu_exc_acc_r =  lsu_i0_exc_r & io.lsu_error_pkt_r.bits.exc_type
   val lsu_exc_st_r  =  lsu_i0_exc_r & io.lsu_error_pkt_r.bits.inst_type

   // Single bit ECC errors on loads are RFNPC corrected, with the corrected data written to the GPR.
   // LSU turns the load into a store and patches the data in the DCCM
   val lsu_i0_rfnpc_r = io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r & (~io.lsu_error_pkt_r.bits.inst_type & io.lsu_error_pkt_r.bits.single_ecc_error)

   //  Final commit valids
   val tlu_i0_commit_cmt = io.dec_tlu_i0_valid_r & ~rfpc_i0_r & ~lsu_i0_exc_r &  ~inst_acc_r & ~io.dec_tlu_dbg_halted & ~request_debug_mode_r_d1 & ~i0_trigger_hit_r

   // unified place to manage the killing of arch state writebacks
   tlu_i0_kill_writeb_r := rfpc_i0_r | lsu_i0_exc_r | inst_acc_r | (illegal_r & io.dec_tlu_dbg_halted) | i0_trigger_hit_r
   io.tlu_mem.dec_tlu_i0_commit_cmt := tlu_i0_commit_cmt


   // refetch PC, microarch flush
   // ic errors only in pipe0
   rfpc_i0_r :=  ((io.dec_tlu_i0_valid_r & ~tlu_flush_lower_r_d1 & (io.tlu_exu.exu_i0_br_error_r | io.tlu_exu.exu_i0_br_start_error_r)) | ((ic_perr_r_d1 | iccm_sbecc_r_d1) & ~ext_int_freeze_d1)) &  ~i0_trigger_hit_r &  ~lsu_i0_rfnpc_r

   // From the indication of a iccm single bit error until the first commit or flush, maintain a repair state. In the repair state, rfnpc i0 commits.
   iccm_repair_state_ns := iccm_sbecc_r_d1 | (iccm_repair_state_d1 & ~io.tlu_exu.dec_tlu_flush_lower_r)


   val MCPC =0x7c2.U(12.W)

   // this is a flush of last resort, meaning only assert it if there is no other flush happening.
   val iccm_repair_state_rfnpc = tlu_i0_commit_cmt & iccm_repair_state_d1 & ~(ebreak_r | ecall_r | mret_r | take_reset | illegal_r | (dec_csr_wen_r_mod & (io.dec_csr_wraddr_r ===MCPC)))

   // go ahead and repair the branch error on other flushes, doesn't have to be the rfpc flush
   val dec_tlu_br0_error_r = io.tlu_exu.exu_i0_br_error_r & io.dec_tlu_i0_valid_r & ~tlu_flush_lower_r_d1
   val dec_tlu_br0_start_error_r = io.tlu_exu.exu_i0_br_start_error_r & io.dec_tlu_i0_valid_r & ~tlu_flush_lower_r_d1
   val dec_tlu_br0_v_r = io.tlu_exu.exu_i0_br_valid_r & io.dec_tlu_i0_valid_r & ~tlu_flush_lower_r_d1 & (~io.tlu_exu.exu_i0_br_mp_r | ~io.tlu_exu.exu_pmu_i0_br_ataken)


   io.tlu_bp.dec_tlu_br0_r_pkt.bits.hist 			:= io.tlu_exu.exu_i0_br_hist_r
   io.tlu_bp.dec_tlu_br0_r_pkt.bits.br_error 		:= dec_tlu_br0_error_r
   io.tlu_bp.dec_tlu_br0_r_pkt.bits.br_start_error 	:= dec_tlu_br0_start_error_r
   io.tlu_bp.dec_tlu_br0_r_pkt.valid 			:= dec_tlu_br0_v_r
   io.tlu_bp.dec_tlu_br0_r_pkt.bits.way 			:= io.exu_i0_br_way_r
   io.tlu_bp.dec_tlu_br0_r_pkt.bits.middle 			:= io.tlu_exu.exu_i0_br_middle_r


  ebreak_r  :=  (io.dec_tlu_packet_r.pmu_i0_itype === EBREAK)  & io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r & ~dcsr(DCSR_EBREAKM) & ~rfpc_i0_r
  ecall_r   :=  (io.dec_tlu_packet_r.pmu_i0_itype === ECALL)   & io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r & ~rfpc_i0_r
  illegal_r :=  ~io.dec_tlu_packet_r.legal   & io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r & ~rfpc_i0_r
  mret_r    :=  (io.dec_tlu_packet_r.pmu_i0_itype === MRET)    & io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r & ~rfpc_i0_r
   // fence_i includes debug only fence_i's
   fence_i_r    :=  (io.dec_tlu_packet_r.fence_i & io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r) & ~rfpc_i0_r
   ic_perr_r    :=  io.tlu_mem.ifu_ic_error_start & ~ext_int_freeze_d1 & (~internal_dbg_halt_mode_f | dcsr_single_step_running) & ~internal_pmu_fw_halt_mode_f
   iccm_sbecc_r :=  io.tlu_mem.ifu_iccm_rd_ecc_single_err & ~ext_int_freeze_d1 & (~internal_dbg_halt_mode_f | dcsr_single_step_running) & ~internal_pmu_fw_halt_mode_f
   inst_acc_r_raw  :=  io.dec_tlu_packet_r.icaf & io.dec_tlu_i0_valid_r
   inst_acc_r := inst_acc_r_raw & ~rfpc_i0_r & ~i0_trigger_hit_r
   val       inst_acc_second_r = io.dec_tlu_packet_r.icaf_f1

   ebreak_to_debug_mode_r := (io.dec_tlu_packet_r.pmu_i0_itype === EBREAK)  & io.dec_tlu_i0_valid_r & ~i0_trigger_hit_r & dcsr(DCSR_EBREAKM) & ~rfpc_i0_r

	ebreak_to_debug_mode_r_d1:= withClock(e4e5_clk){RegNext(ebreak_to_debug_mode_r,0.U)}
   	io.tlu_mem.dec_tlu_fence_i_wb := fence_i_r
   	
   	   //
   // Exceptions
   //
   // - MEPC <- PC
   // - PC <- MTVEC, assert flush_lower
   // - MCAUSE <- cause
   // - MSCAUSE <- secondary cause
   // - MTVAL <-
   // - MPIE <- MIE
   // - MIE <- 0
   //
   val i0_exception_valid_r = (ebreak_r | ecall_r | illegal_r | inst_acc_r) & ~rfpc_i0_r & ~io.dec_tlu_dbg_halted

   // Cause:
   //
   // 0x2 : illegal
   // 0x3 : breakpoint
   // 0xb : Environment call M-mode

   val exc_cause_r = Mux1H(Seq(
   		(take_ext_int & ~take_nmi).asBool       				-> 0x0b.U(5.W),
        (take_timer_int & ~take_nmi).asBool      				-> 0x07.U(5.W),
        (take_soft_int & ~take_nmi).asBool        				-> 0x03.U(5.W),
        (take_int_timer0_int & ~take_nmi).asBool  				-> 0x1d.U(5.W),
        (take_int_timer1_int & ~take_nmi).asBool 				-> 0x1c.U(5.W),
        (take_ce_int & ~take_nmi).asBool          				-> 0x1e.U(5.W),
        (illegal_r & ~take_nmi).asBool            				-> 0x02.U(5.W),
        (ecall_r  & ~take_nmi).asBool             				-> 0x0b.U(5.W),
        (inst_acc_r  & ~take_nmi).asBool          				-> 0x01.U(5.W),
        ((ebreak_r | i0_trigger_hit_r) & ~take_nmi).asBool     	-> 0x03.U(5.W),
        (lsu_exc_ma_r & ~lsu_exc_st_r & ~take_nmi).asBool    	-> 0x04.U(5.W),
        (lsu_exc_acc_r & ~lsu_exc_st_r & ~take_nmi).asBool  	-> 0x05.U(5.W),
        (lsu_exc_ma_r & lsu_exc_st_r & ~take_nmi).asBool    	-> 0x06.U(5.W),
      	(lsu_exc_acc_r & lsu_exc_st_r & ~take_nmi).asBool   	-> 0x07.U(5.W)   
   ))  
   //
   // Interrupts
   //
   // exceptions that are committed have already happened and will cause an int at E4 to wait a cycle
   // or more if MSTATUS[MIE] is cleared.
   //
   // -in priority order, highest to lowest
   // -single cycle window where a csr write to MIE/MSTATUS is at E4 when the other conditions for externals are met.
   //  Hold off externals for a cycle to make sure we are consistent with what was just written
   mhwakeup_ready  :=  ~io.dec_csr_stall_int_ff & mstatus_mie_ns & mip(MIP_MEIP)   & mie_ns(MIE_MEIE)
   ext_int_ready   := ~io.dec_csr_stall_int_ff & mstatus_mie_ns & mip(MIP_MEIP)   & mie_ns(MIE_MEIE) & ~ignore_ext_int_due_to_lsu_stall
   ce_int_ready    := ~io.dec_csr_stall_int_ff & mstatus_mie_ns & mip(MIP_MCEIP)  & mie_ns(MIE_MCEIE)
   soft_int_ready  := ~io.dec_csr_stall_int_ff & mstatus_mie_ns & mip(MIP_MSIP)   & mie_ns(MIE_MSIE)
   timer_int_ready := ~io.dec_csr_stall_int_ff & mstatus_mie_ns & mip(MIP_MTIP)   & mie_ns(MIE_MTIE)

   // MIP for internal timers pulses for 1 clock, resets the timer counter. Mip won't hold past the various stall conditions.
   val int_timer0_int_possible = mstatus_mie_ns & mie_ns(MIE_MITIE0)
   val int_timer0_int_ready = mip(MIP_MITIP0) & int_timer0_int_possible
   val int_timer1_int_possible = mstatus_mie_ns & mie_ns(MIE_MITIE1)
   val int_timer1_int_ready = mip(MIP_MITIP1) & int_timer1_int_possible

   // Internal timers pulse and reset. If core is PMU/FW halted, the pulse will cause an exit from halt, but won't stick around
   // Make it sticky, also for 1 cycle stall conditions.
   val int_timer_stalled = io.dec_csr_stall_int_ff | synchronous_flush_r | exc_or_int_valid_r_d1 | mret_r

   int_timer0_int_hold := (int_timer0_int_ready & (pmu_fw_tlu_halted_f | int_timer_stalled)) | (int_timer0_int_possible & int_timer0_int_hold_f & ~interrupt_valid_r & ~take_ext_int_start & ~internal_dbg_halt_mode_f)
   int_timer1_int_hold := (int_timer1_int_ready & (pmu_fw_tlu_halted_f | int_timer_stalled)) | (int_timer1_int_possible & int_timer1_int_hold_f & ~interrupt_valid_r & ~take_ext_int_start & ~internal_dbg_halt_mode_f)

   internal_dbg_halt_timers := internal_dbg_halt_mode_f & ~dcsr_single_step_running;

   val block_interrupts = ((internal_dbg_halt_mode & (~dcsr_single_step_running | io.dec_tlu_i0_valid_r)) | internal_pmu_fw_halt_mode | i_cpu_halt_req_d1 | take_nmi | ebreak_to_debug_mode_r |  synchronous_flush_r | exc_or_int_valid_r_d1 | mret_r | ext_int_freeze_d1)


	if(FAST_INTERRUPT_REDIRECT==1) {
	take_ext_int_start_d1:=withClock(io.free_clk){RegNext(take_ext_int_start,0.U)}
	take_ext_int_start_d2:=withClock(io.free_clk){RegNext(take_ext_int_start_d1,0.U)}
	take_ext_int_start_d3:=withClock(io.free_clk){RegNext(take_ext_int_start_d2,0.U)}
	ext_int_freeze_d1	 :=withClock(io.free_clk){RegNext(ext_int_freeze,0.U)}
   	take_ext_int_start := ext_int_ready & ~block_interrupts;

   	ext_int_freeze := take_ext_int_start | take_ext_int_start_d1 | take_ext_int_start_d2 | take_ext_int_start_d3
   	take_ext_int := take_ext_int_start_d3 & ~io.lsu_fir_error.orR
   	fast_int_meicpct := csr_pkt.csr_meicpct & io.dec_csr_any_unq_d  // MEICPCT becomes illegal if fast ints are enabled
   	ignore_ext_int_due_to_lsu_stall := io.lsu_fastint_stall_any
	}else{
	take_ext_int_start := 0.U(1.W)
   	ext_int_freeze := 0.U(1.W)
   	ext_int_freeze_d1 := 0.U(1.W)
   	take_ext_int_start_d1 := 0.U(1.W)
   	take_ext_int_start_d2 := 0.U(1.W)
   	take_ext_int_start_d3 := 0.U(1.W)
   	fast_int_meicpct := 0.U(1.W)
   	ignore_ext_int_due_to_lsu_stall := 0.U(1.W)
   	take_ext_int := ext_int_ready & ~block_interrupts	
	}

   take_ce_int  := ce_int_ready & ~ext_int_ready & ~block_interrupts
   take_soft_int := soft_int_ready & ~ext_int_ready & ~ce_int_ready & ~block_interrupts
   take_timer_int := timer_int_ready & ~soft_int_ready & ~ext_int_ready & ~ce_int_ready & ~block_interrupts
   take_int_timer0_int := (int_timer0_int_ready | int_timer0_int_hold_f) & int_timer0_int_possible & ~io.dec_csr_stall_int_ff & ~timer_int_ready & ~soft_int_ready & ~ext_int_ready & ~ce_int_ready & ~block_interrupts
   take_int_timer1_int := (int_timer1_int_ready | int_timer1_int_hold_f) & int_timer1_int_possible & ~io.dec_csr_stall_int_ff & ~(int_timer0_int_ready | int_timer0_int_hold_f) & ~timer_int_ready & ~soft_int_ready & ~ext_int_ready & ~ce_int_ready & ~block_interrupts
   take_reset := reset_delayed & io.mpc_reset_run_req
   take_nmi := nmi_int_detected & ~internal_pmu_fw_halt_mode & (~internal_dbg_halt_mode | (dcsr_single_step_running_f & dcsr(DCSR_STEPIE) & ~io.dec_tlu_i0_valid_r & ~dcsr_single_step_done_f)) & ~synchronous_flush_r & ~mret_r & ~take_reset & ~ebreak_to_debug_mode_r & (~ext_int_freeze_d1 | (take_ext_int_start_d3 & io.lsu_fir_error.orR))
  

   interrupt_valid_r := take_ext_int | take_timer_int | take_soft_int | take_nmi | take_ce_int | take_int_timer0_int | take_int_timer1_int


   // Compute interrupt path:
   // If vectored async is set in mtvec, flush path for interrupts is MTVEC + (4 * CAUSE);
   val vectored_path  = Cat(mtvec(30,1),0.U(1.W)) + Cat(0.U(25.W),exc_cause_r, 0.U(1.W)) ///After Combining Code revisit this
   val interrupt_path = Mux(take_nmi.asBool, io.nmi_vec, Mux(mtvec(0) === 1.U, vectored_path, Cat(mtvec(30,1),0.U(1.W))))///After Combining Code revisit this
   val sel_npc_r  = lsu_i0_rfnpc_r | fence_i_r | iccm_repair_state_rfnpc | (i_cpu_run_req_d1 & ~interrupt_valid_r) | (rfpc_i0_r & ~io.dec_tlu_i0_valid_r)
   val sel_npc_resume = (i_cpu_run_req_d1 & pmu_fw_tlu_halted_f) | pause_expired_r
   val sel_fir_addr = take_ext_int_start_d3 & ~io.lsu_fir_error.orR
   synchronous_flush_r  := i0_exception_valid_r | rfpc_i0_r | lsu_exc_valid_r | fence_i_r | lsu_i0_rfnpc_r |  iccm_repair_state_rfnpc |  debug_resume_req_f |  sel_npc_resume |   dec_tlu_wr_pause_r_d1 |  i0_trigger_hit_r
   tlu_flush_lower_r := interrupt_valid_r | mret_r | synchronous_flush_r | take_halt | take_reset | take_ext_int_start
   ///After Combining Code revisit this
   val tlu_flush_path_r = Mux(take_reset.asBool, io.rst_vec,Mux1H(Seq(
   							(sel_fir_addr).asBool	            -> io.lsu_fir_addr,
   							(take_nmi===0.U & sel_npc_r===1.U)		-> npc_r,
   							(take_nmi===0.U & rfpc_i0_r===1.U & io.dec_tlu_i0_valid_r===1.U & sel_npc_r===0.U)  -> io.dec_tlu_i0_pc_r,
   							(interrupt_valid_r===1.U & sel_fir_addr===0.U)  -> interrupt_path,
   							((i0_exception_valid_r | lsu_exc_valid_r | (i0_trigger_hit_r & ~trigger_hit_dmode_r)) & ~interrupt_valid_r & ~sel_fir_addr).asBool	-> Cat(mtvec(30,1),0.U(1.W)),
   							(~take_nmi & mret_r).asBool   				-> mepc,
   							(~take_nmi & debug_resume_req_f).asBool	-> dpc,
   							(~take_nmi & sel_npc_resume).asBool		-> npc_r_d1
   							)))

	val tlu_flush_path_r_d1=withClock(e4e5_int_clk){RegNext(tlu_flush_path_r,0.U)} ///After Combining Code revisit this

   	io.dec_tlu_flush_lower_wb 	:= tlu_flush_lower_r_d1
//    io.tlu_mem.dec_tlu_flush_lower_wb 	:= io.dec_tlu_flush_lower_wb
   	io.tlu_exu.dec_tlu_flush_lower_r 	:= tlu_flush_lower_r
   	io.tlu_exu.dec_tlu_flush_path_r 	:= tlu_flush_path_r ///After Combining Code revisit this

   // this is used to capture mepc, etc.
   val exc_or_int_valid_r = lsu_exc_valid_r | i0_exception_valid_r | interrupt_valid_r | (i0_trigger_hit_r & ~trigger_hit_dmode_r)

	interrupt_valid_r_d1				:=withClock(e4e5_int_clk){RegNext(interrupt_valid_r,0.U)}
	val i0_exception_valid_r_d1			=withClock(e4e5_int_clk){RegNext(i0_exception_valid_r,0.U)}
	exc_or_int_valid_r_d1				:=withClock(e4e5_int_clk){RegNext(exc_or_int_valid_r,0.U)}
    val exc_cause_wb					=withClock(e4e5_int_clk){RegNext(exc_cause_r,0.U)}
    val i0_valid_wb						=withClock(e4e5_int_clk){RegNext((tlu_i0_commit_cmt & ~illegal_r),0.U)}
    val trigger_hit_r_d1				=withClock(e4e5_int_clk){RegNext(i0_trigger_hit_r,0.U)}
    take_nmi_r_d1						:=withClock(e4e5_int_clk){RegNext(take_nmi,0.U)}
    pause_expired_wb					:=withClock(e4e5_int_clk){RegNext(pause_expired_r,0.U)}

val csr=Module(new csr_tlu)
  csr.io.free_clk                          := io.free_clk         
  csr.io.active_clk                        := io.active_clk       
  csr.io.scan_mode                         := io.scan_mode        
  csr.io.dec_csr_wrdata_r                  := io.dec_csr_wrdata_r 
  csr.io.dec_csr_wraddr_r                  := io.dec_csr_wraddr_r 
  csr.io.dec_csr_rdaddr_d                  := io.dec_csr_rdaddr_d 
  csr.io.dec_csr_wen_unq_d                 := io.dec_csr_wen_unq_d
  csr.io.dec_i0_decode_d                   := io.dec_i0_decode_d
  csr.io.ifu_ic_debug_rd_data_valid        := io.tlu_mem.ifu_ic_debug_rd_data_valid
  csr.io.ifu_pmu_bus_trxn                  := io.tlu_mem.ifu_pmu_bus_trxn
  csr.io.dma_iccm_stall_any                :=io.tlu_dma.dma_iccm_stall_any
  csr.io.dma_dccm_stall_any                :=io.tlu_dma.dma_dccm_stall_any
  csr.io.lsu_store_stall_any               :=io.lsu_store_stall_any    
  csr.io.dec_pmu_presync_stall             :=io.dec_pmu_presync_stall  
  csr.io.dec_pmu_postsync_stall            :=io.dec_pmu_postsync_stall 
  csr.io.dec_pmu_decode_stall              :=io.dec_pmu_decode_stall   
  csr.io.ifu_pmu_fetch_stall               :=io.tlu_ifc.ifu_pmu_fetch_stall
  csr.io.dec_tlu_packet_r                  :=io.dec_tlu_packet_r 
  csr.io.exu_pmu_i0_br_ataken              :=io.tlu_exu.exu_pmu_i0_br_ataken
  csr.io.exu_pmu_i0_br_misp                :=io.tlu_exu.exu_pmu_i0_br_misp
  csr.io.dec_pmu_instr_decoded             :=io.dec_pmu_instr_decoded  
  csr.io.ifu_pmu_instr_aligned             :=io.ifu_pmu_instr_aligned
  csr.io.exu_pmu_i0_pc4                    :=io.tlu_exu.exu_pmu_i0_pc4
  csr.io.ifu_pmu_ic_miss                   :=io.tlu_mem.ifu_pmu_ic_miss
  csr.io.ifu_pmu_ic_hit                    :=io.tlu_mem.ifu_pmu_ic_hit
  csr.io.dec_csr_wen_r                     := io.dec_csr_wen_r
  csr.io.dec_tlu_dbg_halted                := io.dec_tlu_dbg_halted  
  csr.io.dma_pmu_dccm_write                := io.tlu_dma.dma_pmu_dccm_write
  csr.io.dma_pmu_dccm_read                 := io.tlu_dma.dma_pmu_dccm_read
  csr.io.dma_pmu_any_write                 := io.tlu_dma.dma_pmu_any_write
  csr.io.dma_pmu_any_read                  := io.tlu_dma.dma_pmu_any_read
  csr.io.lsu_pmu_bus_busy                  := io.tlu_busbuff.lsu_pmu_bus_busy
  csr.io.dec_tlu_i0_pc_r                   := io.dec_tlu_i0_pc_r
  csr.io.dec_tlu_i0_valid_r                := io.dec_tlu_i0_valid_r  
  csr.io.dec_csr_stall_int_ff              := io.dec_csr_stall_int_ff
  csr.io.dec_csr_any_unq_d                 := io.dec_csr_any_unq_d  
  csr.io.ifu_pmu_bus_busy                  := io.tlu_mem.ifu_pmu_bus_busy
  csr.io.lsu_pmu_bus_error                 := io.tlu_busbuff.lsu_pmu_bus_error
  csr.io.ifu_pmu_bus_error                 := io.tlu_mem.ifu_pmu_bus_error
  csr.io.lsu_pmu_bus_misaligned            := io.tlu_busbuff.lsu_pmu_bus_misaligned
  csr.io.lsu_pmu_bus_trxn                  := io.tlu_busbuff.lsu_pmu_bus_trxn
  csr.io.ifu_ic_debug_rd_data              := io.tlu_mem.ifu_ic_debug_rd_data
  csr.io.pic_pl                            := io.dec_pic.pic_pl
  csr.io.pic_claimid                       := io.dec_pic.pic_claimid
  csr.io.iccm_dma_sb_error                 := io.iccm_dma_sb_error            
  csr.io.lsu_imprecise_error_addr_any      := io.tlu_busbuff.lsu_imprecise_error_addr_any
  csr.io.lsu_imprecise_error_load_any      := io.tlu_busbuff.lsu_imprecise_error_load_any
  csr.io.lsu_imprecise_error_store_any     := io.tlu_busbuff.lsu_imprecise_error_store_any
  csr.io.dec_illegal_inst                  := io.dec_illegal_inst  
  csr.io.lsu_error_pkt_r                   := io.lsu_error_pkt_r   
  csr.io.mexintpend                        := io.dec_pic.mexintpend
  csr.io.exu_npc_r                         := io.tlu_exu.exu_npc_r
  csr.io.mpc_reset_run_req                 := io.mpc_reset_run_req 
  csr.io.rst_vec                           := io.rst_vec           
  csr.io.core_id                           := io.core_id           
  csr.io.dec_timer_rddata_d                := dec_timer_rddata_d
  csr.io.dec_timer_read_d                  := dec_timer_read_d  
  io.dec_pic.dec_tlu_meicurpl                      := csr.io.dec_tlu_meicurpl
  io.tlu_exu.dec_tlu_meihap                        := csr.io.dec_tlu_meihap
  io.dec_pic.dec_tlu_meipt                         := csr.io.dec_tlu_meipt
  io.dec_tlu_int_valid_wb1                 := csr.io.dec_tlu_int_valid_wb1   
  io.dec_tlu_i0_exc_valid_wb1              := csr.io.dec_tlu_i0_exc_valid_wb1
  io.dec_tlu_i0_valid_wb1                  := csr.io.dec_tlu_i0_valid_wb1  
  io.tlu_mem.dec_tlu_ic_diag_pkt                   := csr.io.dec_tlu_ic_diag_pkt
  io.trigger_pkt_any                   := csr.io.trigger_pkt_any
  io.dec_tlu_mtval_wb1                 := csr.io.dec_tlu_mtval_wb1 
  io.dec_tlu_exc_cause_wb1             := csr.io.dec_tlu_exc_cause_wb1            
  io.dec_tlu_perfcnt0                  := csr.io.dec_tlu_perfcnt0                 
  io.dec_tlu_perfcnt1                  := csr.io.dec_tlu_perfcnt1                 
  io.dec_tlu_perfcnt2                  := csr.io.dec_tlu_perfcnt2                 
  io.dec_tlu_perfcnt3                  := csr.io.dec_tlu_perfcnt3                  
  io.dec_tlu_misc_clk_override         := csr.io.dec_tlu_misc_clk_override        
  io.dec_tlu_dec_clk_override          := csr.io.dec_tlu_dec_clk_override          
  io.dec_tlu_ifu_clk_override          := csr.io.dec_tlu_ifu_clk_override          
  io.dec_tlu_lsu_clk_override          := csr.io.dec_tlu_lsu_clk_override          
  io.dec_tlu_bus_clk_override          := csr.io.dec_tlu_bus_clk_override          
  io.dec_tlu_pic_clk_override          := csr.io.dec_tlu_pic_clk_override          
  io.dec_tlu_dccm_clk_override         := csr.io.dec_tlu_dccm_clk_override        
  io.dec_tlu_icm_clk_override          := csr.io.dec_tlu_icm_clk_override          
  io.dec_csr_rddata_d                  := csr.io.dec_csr_rddata_d  
  io.dec_tlu_pipelining_disable        := csr.io.dec_tlu_pipelining_disable       
  io.dec_tlu_wr_pause_r                := csr.io.dec_tlu_wr_pause_r               
  io.tlu_ifc.dec_tlu_mrac_ff                   := csr.io.dec_tlu_mrac_ff
  io.tlu_busbuff.dec_tlu_wb_coalescing_disable     := csr.io.dec_tlu_wb_coalescing_disable
  io.tlu_bp.dec_tlu_bpred_disable             := csr.io.dec_tlu_bpred_disable
  io.tlu_busbuff.dec_tlu_sideeffect_posted_disable := csr.io.dec_tlu_sideeffect_posted_disable
  io.tlu_mem.dec_tlu_core_ecc_disable          := csr.io.dec_tlu_core_ecc_disable
  io.tlu_busbuff.dec_tlu_external_ldfwd_disable    := csr.io.dec_tlu_external_ldfwd_disable
  io.tlu_dma.dec_tlu_dma_qos_prty              := csr.io.dec_tlu_dma_qos_prty
  csr.io.dec_illegal_inst                  := io.dec_illegal_inst      
  csr.io.lsu_error_pkt_r                   := io.lsu_error_pkt_r    
  csr.io.mexintpend                        := io.dec_pic.mexintpend
  csr.io.exu_npc_r                         := io.tlu_exu.exu_npc_r
  csr.io.mpc_reset_run_req                 := io.mpc_reset_run_req           
  csr.io.rst_vec                           := io.rst_vec                      
  csr.io.core_id                           := io.core_id                      
  csr.io.dec_timer_rddata_d                := dec_timer_rddata_d           
  csr.io.dec_timer_read_d                  := dec_timer_read_d 


  csr.io.rfpc_i0_r                    := rfpc_i0_r                  
  csr.io.i0_trigger_hit_r             := i0_trigger_hit_r           
  csr.io.exc_or_int_valid_r           := exc_or_int_valid_r      
  csr.io.mret_r                       := mret_r                     
  csr.io.dcsr_single_step_running_f   := dcsr_single_step_running_f 
  csr.io.dec_timer_t0_pulse           := dec_timer_t0_pulse         
  csr.io.dec_timer_t1_pulse           := dec_timer_t1_pulse         
  csr.io.timer_int_sync               := timer_int_sync             
  csr.io.soft_int_sync                := soft_int_sync              
  csr.io.csr_wr_clk                   := csr_wr_clk        
  csr.io.ebreak_to_debug_mode_r       := ebreak_to_debug_mode_r     
  csr.io.dec_tlu_pmu_fw_halted        := dec_tlu_pmu_fw_halted      
  csr.io.lsu_fir_error                := io.lsu_fir_error              
  csr.io.tlu_flush_lower_r_d1         := tlu_flush_lower_r_d1       
  csr.io.dec_tlu_flush_noredir_r_d1   := dec_tlu_flush_noredir_r_d1 
  csr.io.tlu_flush_path_r_d1          := tlu_flush_path_r_d1        
  csr.io.reset_delayed                := reset_delayed              
  csr.io.interrupt_valid_r            := interrupt_valid_r          
  csr.io.i0_exception_valid_r         := i0_exception_valid_r     
  csr.io.lsu_exc_valid_r              := lsu_exc_valid_r            
  csr.io.mepc_trigger_hit_sel_pc_r    := mepc_trigger_hit_sel_pc_r   
  csr.io.e4e5_int_clk                 := e4e5_int_clk      
  csr.io.lsu_i0_exc_r                 := lsu_i0_exc_r               
  csr.io.inst_acc_r                   := inst_acc_r                 
  csr.io.inst_acc_second_r            := inst_acc_second_r          
  csr.io.take_nmi                     := take_nmi                   
  csr.io.lsu_error_pkt_addr_r         := lsu_error_pkt_addr_r    
  csr.io.exc_cause_r                  := exc_cause_r                
  csr.io.i0_valid_wb                  := i0_valid_wb                
  csr.io.exc_or_int_valid_r_d1        := exc_or_int_valid_r_d1      
  csr.io.interrupt_valid_r_d1         := interrupt_valid_r_d1       
  csr.io.clk_override                 := clk_override               
  csr.io.i0_exception_valid_r_d1      := i0_exception_valid_r_d1    
  csr.io.lsu_i0_exc_r_d1              := lsu_i0_exc_r_d1            
  csr.io.exc_cause_wb                 := exc_cause_wb               
  csr.io.nmi_lsu_store_type           := nmi_lsu_store_type         
  csr.io.nmi_lsu_load_type            := nmi_lsu_load_type          
  csr.io.tlu_i0_commit_cmt            := tlu_i0_commit_cmt          
  csr.io.ebreak_r                     := ebreak_r                   
  csr.io.ecall_r                      := ecall_r                    
  csr.io.illegal_r                    := illegal_r                  
  csr.io.mdseac_locked_f              := mdseac_locked_f            
  csr.io.nmi_int_detected_f           := nmi_int_detected_f         
  csr.io.internal_dbg_halt_mode_f2    := internal_dbg_halt_mode_f2  
  csr.io.ext_int_freeze_d1            := ext_int_freeze_d1          
  csr.io.ic_perr_r_d1                 := ic_perr_r_d1               
  csr.io.iccm_sbecc_r_d1              := iccm_sbecc_r_d1            
  csr.io.lsu_single_ecc_error_r_d1    := lsu_single_ecc_error_r_d1  
  csr.io.ifu_miss_state_idle_f        := ifu_miss_state_idle_f      
  csr.io.lsu_idle_any_f               := lsu_idle_any_f             
  csr.io.dbg_tlu_halted_f             := dbg_tlu_halted_f           
  csr.io.dbg_tlu_halted               := dbg_tlu_halted             
  csr.io.debug_halt_req_f 			  := debug_halt_req_f 			
  csr.io.take_ext_int_start		      := take_ext_int_start		    
  csr.io.trigger_hit_dmode_r_d1 	  := trigger_hit_dmode_r_d1 	
  csr.io.trigger_hit_r_d1       	  := trigger_hit_r_d1       	
  csr.io.dcsr_single_step_done_f 	  := dcsr_single_step_done_f 	
  csr.io.ebreak_to_debug_mode_r_d1    := ebreak_to_debug_mode_r_d1  
  csr.io.debug_halt_req 			  := debug_halt_req 			
  csr.io.allow_dbg_halt_csr_write     := allow_dbg_halt_csr_write   
  csr.io.internal_dbg_halt_mode_f     := internal_dbg_halt_mode_f   
  csr.io.enter_debug_halt_req         := enter_debug_halt_req       
  csr.io.internal_dbg_halt_mode       := internal_dbg_halt_mode     
  csr.io.request_debug_mode_done      := request_debug_mode_done    
  csr.io.request_debug_mode_r         := request_debug_mode_r       
  csr.io.update_hit_bit_r             := update_hit_bit_r           
  csr.io.take_timer_int               := take_timer_int             
  csr.io.take_int_timer0_int          := take_int_timer0_int        
  csr.io.take_int_timer1_int          := take_int_timer1_int        
  csr.io.take_ext_int                 := take_ext_int               
  csr.io.tlu_flush_lower_r            := tlu_flush_lower_r          
  csr.io.dec_tlu_br0_error_r          := dec_tlu_br0_error_r        
  csr.io.dec_tlu_br0_start_error_r    := dec_tlu_br0_start_error_r  
  csr.io.lsu_pmu_load_external_r      := lsu_pmu_load_external_r    
  csr.io.lsu_pmu_store_external_r     := lsu_pmu_store_external_r   
  csr.io.csr_pkt                      := csr_pkt    

  npc_r                       := csr.io.npc_r            
  npc_r_d1                    := csr.io.npc_r_d1         
  mie_ns                      := csr.io.mie_ns           
  mepc                        := csr.io.mepc             
  mdseac_locked_ns            := csr.io.mdseac_locked_ns 
  force_halt                  := csr.io.force_halt       
  dpc                         := csr.io.dpc              
  mstatus_mie_ns              := csr.io.mstatus_mie_ns   
  dec_csr_wen_r_mod           := csr.io.dec_csr_wen_r_mod
  fw_halt_req                 := csr.io.fw_halt_req      
  mstatus                     := csr.io.mstatus          
  dcsr                        := csr.io.dcsr             
  mtvec                       := csr.io.mtvec            
  mip                         := csr.io.mip     
  mtdata1_t                     :=csr.io.mtdata1_t
  val csr_read=Module(new dec_decode_csr_read)
  	csr_read.io.dec_csr_rdaddr_d:=io.dec_csr_rdaddr_d
	csr_pkt:=csr_read.io.csr_pkt

io.dec_tlu_presync_d  := csr_pkt.presync & io.dec_csr_any_unq_d & ~io.dec_csr_wen_unq_d
io.dec_tlu_postsync_d := csr_pkt.postsync & io.dec_csr_any_unq_d

   // allow individual configuration of these features
val conditionally_illegal = (csr_pkt.csr_mitcnt0 | csr_pkt.csr_mitcnt1 | csr_pkt.csr_mitb0 | csr_pkt.csr_mitb1 | csr_pkt.csr_mitctl0 | csr_pkt.csr_mitctl1) & ~TIMER_LEGAL_EN.asUInt
val valid_csr = ( csr_pkt.legal & (~(csr_pkt.csr_dcsr | csr_pkt.csr_dpc | csr_pkt.csr_dmst | csr_pkt.csr_dicawics | csr_pkt.csr_dicad0 | csr_pkt.csr_dicad0h | csr_pkt.csr_dicad1 | csr_pkt.csr_dicago) | dbg_tlu_halted_f) & ~fast_int_meicpct & ~conditionally_illegal)

io.dec_csr_legal_d := ( io.dec_csr_any_unq_d &valid_csr & ~(io.dec_csr_wen_unq_d & (csr_pkt.csr_mvendorid | csr_pkt.csr_marchid | csr_pkt.csr_mimpid | csr_pkt.csr_mhartid | csr_pkt.csr_mdseac | csr_pkt.csr_meihap)) )
}

trait CSRs{
 val MISA            = "h301".U(12.W)
 val MVENDORID       = "hf11".U(12.W)
 val MARCHID         = "hf12".U(12.W)
 val MIMPID          = "hf13".U(12.W)
 val MHARTID         = "hf14".U(12.W)
 val MSTATUS         = "h300".U(12.W)
 val MTVEC           = "h305".U(12.W)
 val MIP             = "h344".U(12.W)
 val MIE             = "h304".U(12.W)
 val MCYCLEL         = "hb00".U(12.W)
 val MCYCLEH         = "hb80".U(12.W)
 val MINSTRETL       = "hb02".U(12.W)
 val MINSTRETH       = "hb82".U(12.W)
 val MSCRATCH        = "h340".U(12.W)
 val MEPC            = "h341".U(12.W)
 val MCAUSE          = "h342".U(12.W)
 val MSCAUSE         = "h7ff".U(12.W)
 val MTVAL           = "h343".U(12.W)
 val MCGC            = "h7f8".U(12.W)
 val MFDC            = "h7f9".U(12.W)
 val MCPC            = "h7c2".U(12.W)
 val MRAC            = "h7c0".U(12.W)
 val MDEAU           = "hbc0".U(12.W)
 val MDSEAC          = "hfc0".U(12.W)
 val MPMC            = "h7c6".U(12.W)
 val MICECT          = "h7f0".U(12.W)
 val MICCMECT        = "h7f1".U(12.W)
 val MDCCMECT        = "h7f2".U(12.W)
 val MFDHT           = "h7ce".U(12.W)
 val MFDHS           = "h7cf".U(12.W)
 val MEIVT           = "hbc8".U(12.W)
 val MEIHAP          = "hfc8".U(12.W)
 val MEICURPL        = "hbcc".U(12.W)
 val MEICIDPL        = "hbcb".U(12.W)
 val MEICPCT         = "hbca".U(12.W)
 val MEIPT           = "hbc9".U(12.W)
 val DCSR            = "h7b0".U(12.W)
 val DPC             = "h7b1".U(12.W)
 val DICAWICS        = "h7c8".U(12.W)
 val DICAD0          = "h7c9".U(12.W)
 val DICAD0H         = "h7cc".U(12.W)
 val DICAD1          = "h7ca".U(12.W)
 val DICAGO          = "h7cb".U(12.W)
 val MTSEL           = "h7a0".U(12.W)
 val MTDATA1         = "h7a1".U(12.W)
 val MTDATA2         = "h7a2".U(12.W)
 val MHPMC3          = "hB03".U(12.W)
 val MHPMC3H         = "hB83".U(12.W)
 val MHPMC4          = "hB04".U(12.W)
 val MHPMC4H         = "hB84".U(12.W)
 val MHPMC5          = "hB05".U(12.W)
 val MHPMC5H         = "hB85".U(12.W)
 val MHPMC6          = "hB06".U(12.W)
 val MHPMC6H         = "hB86".U(12.W)
 val MHPME3          = "h323".U(12.W)
 val MHPME4          = "h324".U(12.W)
 val MHPME5          = "h325".U(12.W)
 val MHPME6          = "h326".U(12.W)
 val MCOUNTINHIBIT   = "h320".U(12.W)
 val MSTATUS_MIE     = 0.U
 val MIP_MCEIP       = 5.U
 val MIP_MITIP0      = 4.U
 val MIP_MITIP1      = 3.U
 val MIP_MEIP        = 2
 val MIP_MTIP        = 1
 val MIP_MSIP        = 0
 val MIE_MCEIE       = 5
 val MIE_MITIE0      = 4
 val MIE_MITIE1      = 3
 val MIE_MEIE        = 2
 val MIE_MTIE        = 1
 val MIE_MSIE        = 0
 val DCSR_EBREAKM    = 15
 val DCSR_STEPIE     = 11
 val DCSR_STOPC      = 10
 val DCSR_STEP       = 2
 val MTDATA1_DMODE   = 9
 val MTDATA1_SEL     = 7
 val MTDATA1_ACTION  = 6
 val MTDATA1_CHAIN   = 5
 val MTDATA1_MATCH   = 4
 val MTDATA1_M_ENABLED = 3
 val MTDATA1_EXE     = 2
 val MTDATA1_ST      = 1
 val MTDATA1_LD      = 0
 val MHPME_NOEVENT         = 0.U
 val MHPME_CLK_ACTIVE      = 1.U // OOP - out of pipe
 val MHPME_ICACHE_HIT      = 2.U // OOP
 val MHPME_ICACHE_MISS     = 3.U // OOP
 val MHPME_INST_COMMIT     = 4.U
 val MHPME_INST_COMMIT_16B = 5.U
 val MHPME_INST_COMMIT_32B = 6.U
 val MHPME_INST_ALIGNED    = 7.U // OOP
 val MHPME_INST_DECODED    = 8.U // OOP
 val MHPME_INST_MUL        = 9.U
 val MHPME_INST_DIV        = 10.U
 val MHPME_INST_LOAD       = 11.U
 val MHPME_INST_STORE      = 12.U
 val MHPME_INST_MALOAD     = 13.U
 val MHPME_INST_MASTORE    = 14.U
 val MHPME_INST_ALU        = 15.U
 val MHPME_INST_CSRREAD    = 16.U
 val MHPME_INST_CSRRW      = 17.U
 val MHPME_INST_CSRWRITE   = 18.U
 val MHPME_INST_EBREAK     = 19.U
 val MHPME_INST_ECALL      = 20.U
 val MHPME_INST_FENCE      = 21.U
 val MHPME_INST_FENCEI     = 22.U
 val MHPME_INST_MRET       = 23.U
 val MHPME_INST_BRANCH     = 24.U
 val MHPME_BRANCH_MP       = 25.U
 val MHPME_BRANCH_TAKEN    = 26.U
 val MHPME_BRANCH_NOTP     = 27.U
 val MHPME_FETCH_STALL     = 28.U // OOP
 val MHPME_ALGNR_STALL     = 29.U // OOP
 val MHPME_DECODE_STALL    = 30.U // OOP
 val MHPME_POSTSYNC_STALL  = 31.U // OOP
 val MHPME_PRESYNC_STALL   = 32.U // OOP
 val MHPME_LSU_SB_WB_STALL = 34.U // OOP
 val MHPME_DMA_DCCM_STALL  = 35.U // OOP
 val MHPME_DMA_ICCM_STALL  = 36.U // OOP
 val MHPME_EXC_TAKEN       = 37.U
 val MHPME_TIMER_INT_TAKEN = 38.U
 val MHPME_EXT_INT_TAKEN   = 39.U
 val MHPME_FLUSH_LOWER     = 40.U
 val MHPME_BR_ERROR        = 41.U
 val MHPME_IBUS_TRANS      = 42.U // OOP
 val MHPME_DBUS_TRANS      = 43.U // OOP
 val MHPME_DBUS_MA_TRANS   = 44.U // OOP
 val MHPME_IBUS_ERROR      = 45.U // OOP
 val MHPME_DBUS_ERROR      = 46.U // OOP
 val MHPME_IBUS_STALL      = 47.U // OOP
 val MHPME_DBUS_STALL      = 48.U // OOP
 val MHPME_INT_DISABLED    = 49.U // OOP
 val MHPME_INT_STALLED     = 50.U // OOP
 val MHPME_INST_BITMANIP   = 54.U
 val MHPME_DBUS_LOAD       = 55.U
 val MHPME_DBUS_STORE      = 56.U
 // Counts even during sleep state
 val MHPME_SLEEP_CYC       = 512.U // OOP
 val MHPME_DMA_READ_ALL    = 513.U // OOP
 val MHPME_DMA_WRITE_ALL   = 514.U // OOP
 val MHPME_DMA_READ_DCCM   = 515.U // OOP
 val MHPME_DMA_WRITE_DCCM  = 516.U // OOP


}
class CSR_IO extends Bundle with lib {
  val free_clk                          = Input(Clock())
  val active_clk                        = Input(Clock())
  val scan_mode                         = Input(Bool())
  val dec_csr_wrdata_r                  = Input(UInt(32.W))
  val dec_csr_wraddr_r                  = Input(UInt(12.W))
  val dec_csr_rdaddr_d                  = Input(UInt(12.W))
  val dec_csr_wen_unq_d                 = Input(UInt(1.W))
  val dec_i0_decode_d                   = Input(UInt(1.W))
  val dec_tlu_ic_diag_pkt               = Output(new cache_debug_pkt_t)
  val ifu_ic_debug_rd_data_valid        = Input(UInt(1.W))
  val trigger_pkt_any                   = Output(Vec(4, new trigger_pkt_t))
  val ifu_pmu_bus_trxn                  = Input(UInt(1.W))
  val dma_iccm_stall_any                = Input(UInt(1.W))
  val dma_dccm_stall_any                = Input(UInt(1.W))
  val lsu_store_stall_any               = Input(UInt(1.W))
  val dec_pmu_presync_stall             = Input(UInt(1.W))
  val dec_pmu_postsync_stall            = Input(UInt(1.W))
  val dec_pmu_decode_stall              = Input(UInt(1.W))
  val ifu_pmu_fetch_stall               = Input(UInt(1.W))
  val dec_tlu_packet_r                  = Input(new trap_pkt_t)
  val exu_pmu_i0_br_ataken              = Input(UInt(1.W)) 
  val exu_pmu_i0_br_misp                = Input(UInt(1.W))
  val dec_pmu_instr_decoded             = Input(UInt(1.W))
  val ifu_pmu_instr_aligned             = Input(UInt(1.W))
  val exu_pmu_i0_pc4                    = Input(UInt(1.W))
  val ifu_pmu_ic_miss                   = Input(UInt(1.W))
  val ifu_pmu_ic_hit                    = Input(UInt(1.W))
  val dec_tlu_int_valid_wb1             = Output(UInt(1.W))
  val dec_tlu_i0_exc_valid_wb1          = Output(UInt(1.W))
  val dec_tlu_i0_valid_wb1              = Output(UInt(1.W))
  val dec_csr_wen_r                     = Input(UInt(1.W))
  //val dec_tlu_force_halt                = Output(UInt(1.W))
  //val dec_tlu_flush_extint              = Output(UInt(1.W))
  val dec_tlu_mtval_wb1                 = Output(UInt(32.W))
  val dec_tlu_exc_cause_wb1             = Output(UInt(5.W))
  val dec_tlu_perfcnt0                  = Output(UInt(1.W))
  val dec_tlu_perfcnt1                  = Output(UInt(1.W))
  val dec_tlu_perfcnt2                  = Output(UInt(1.W))
  val dec_tlu_perfcnt3                  = Output(UInt(1.W))
  val dec_tlu_dbg_halted                = Input(UInt(1.W))
  val dma_pmu_dccm_write                = Input(UInt(1.W))
  val dma_pmu_dccm_read                 = Input(UInt(1.W))
  val dma_pmu_any_write                 = Input(UInt(1.W))
  val dma_pmu_any_read                  = Input(UInt(1.W))
  val lsu_pmu_bus_busy                  = Input(UInt(1.W))
  val dec_tlu_i0_pc_r                   = Input(UInt(31.W))
  val dec_tlu_i0_valid_r                = Input(UInt(1.W))
  val dec_csr_stall_int_ff              = Input(UInt(1.W))
  val dec_csr_any_unq_d                 = Input(UInt(1.W))
  val dec_tlu_misc_clk_override         = Output(UInt(1.W))
  val dec_tlu_dec_clk_override          = Output(UInt(1.W)) 
  val dec_tlu_ifu_clk_override          = Output(UInt(1.W)) 
  val dec_tlu_lsu_clk_override          = Output(UInt(1.W)) 
  val dec_tlu_bus_clk_override          = Output(UInt(1.W)) 
  val dec_tlu_pic_clk_override          = Output(UInt(1.W)) 
  val dec_tlu_dccm_clk_override         = Output(UInt(1.W))
  val dec_tlu_icm_clk_override          = Output(UInt(1.W)) 
  //val dec_csr_legal_d                   = Output(UInt(1.W))
  val dec_csr_rddata_d                  = Output(UInt(32.W))
  //val dec_tlu_postsync_d                = Output(UInt(1.W)) 
  //val dec_tlu_presync_d                 = Output(UInt(1.W))
  //val dec_tlu_flush_pause_r             = Output(UInt(1.W))
  //val dec_tlu_flush_lower_r             = Output(UInt(1.W))
  //val dec_tlu_i0_kill_writeb_r          = Output(UInt(1.W))
  //val dec_tlu_flush_lower_wb            = Output(UInt(1.W))
  //val dec_tlu_i0_kill_writeb_wb         = Output(UInt(1.W))
 // val dec_tlu_flush_leak_one_wb          = Output(UInt(1.W))
  //val dec_tlu_debug_stall               = Output(UInt(1.W))
  val dec_tlu_pipelining_disable        = Output(UInt(1.W))
  val dec_tlu_wr_pause_r                = Output(UInt(1.W))
  val ifu_pmu_bus_busy                  = Input(UInt(1.W))
  val lsu_pmu_bus_error                 = Input(UInt(1.W))
  val ifu_pmu_bus_error                 = Input(UInt(1.W))
  val lsu_pmu_bus_misaligned            = Input(UInt(1.W))
  val lsu_pmu_bus_trxn                  = Input(UInt(1.W))
  val ifu_ic_debug_rd_data              = Input(UInt(71.W))
  val dec_tlu_meipt                     = Output(UInt(4.W))
  val pic_pl                            = Input(UInt(4.W))
  val dec_tlu_meicurpl                  = Output(UInt(4.W))
  val dec_tlu_meihap                    = Output(UInt(30.W))
  val pic_claimid                       = Input(UInt(8.W))
  val iccm_dma_sb_error                 = Input(UInt(1.W))
  val lsu_imprecise_error_addr_any      = Input(UInt(32.W))
  val lsu_imprecise_error_load_any      = Input(UInt(1.W))
  val lsu_imprecise_error_store_any     = Input(UInt(1.W))
  val dec_tlu_mrac_ff                   = Output(UInt(32.W))
  val dec_tlu_wb_coalescing_disable     = Output(UInt(1.W))
  val dec_tlu_bpred_disable             = Output(UInt(1.W))
  val dec_tlu_sideeffect_posted_disable = Output(UInt(1.W))
  val dec_tlu_core_ecc_disable          = Output(UInt(1.W))
  val dec_tlu_external_ldfwd_disable    = Output(UInt(1.W))
  val dec_tlu_dma_qos_prty              = Output(UInt(3.W))
  val dec_illegal_inst                  = Input(UInt(32.W))
  val lsu_error_pkt_r                   = Flipped(Valid(new lsu_error_pkt_t))// lsu precise exception/error packet
  val mexintpend                        = Input(UInt(1.W))
  val exu_npc_r                         = Input(UInt(31.W))
  val mpc_reset_run_req                 = Input(UInt(1.W))
  val rst_vec                           = Input(UInt(31.W))
  val core_id 							            = Input(UInt(28.W))
  val dec_timer_rddata_d                = Input(UInt(32.W))
  val dec_timer_read_d                  = Input(UInt(1.W))
  
  
  //////////////////////////////////////////////////
  val dec_csr_wen_r_mod           = Output(UInt(1.W))
  val rfpc_i0_r                   = Input(UInt(1.W))
  val i0_trigger_hit_r            = Input(UInt(1.W))
  val fw_halt_req                 = Output(UInt(1.W))
  val mstatus                     = Output(UInt(2.W))
  val exc_or_int_valid_r          = Input(UInt(1.W)) // remove this after
  val mret_r                      = Input(UInt(1.W))
  val mstatus_mie_ns              = Output(UInt(1.W))
  val dcsr_single_step_running_f  = Input(UInt(1.W))
  val dcsr                        = Output(UInt(16.W))
  val mtvec                       = Output(UInt(31.W))
  val mip                         = Output(UInt(6.W))
  val dec_timer_t0_pulse          = Input(UInt(1.W))
  val dec_timer_t1_pulse          = Input(UInt(1.W))
  val timer_int_sync              = Input(UInt(1.W))
  val soft_int_sync               = Input(UInt(1.W))
  val mie_ns                      = Output(UInt(6.W))
  val csr_wr_clk: Clock           = Input(Clock()) // remove after
  val ebreak_to_debug_mode_r      = Input(UInt(1.W))
  val dec_tlu_pmu_fw_halted       = Input(UInt(1.W))
  val lsu_fir_error               = Input(UInt(2.W))
  val npc_r                       = Output(UInt(31.W))
  val tlu_flush_lower_r_d1        = Input(UInt(1.W))
  val dec_tlu_flush_noredir_r_d1  = Input(UInt(1.W))
  val tlu_flush_path_r_d1         = Input(UInt(31.W))
  val npc_r_d1                    = Output(UInt(31.W))
  val reset_delayed               = Input(UInt(1.W))
  val mepc                        = Output(UInt(31.W))
  val interrupt_valid_r           = Input(UInt(1.W))
  val i0_exception_valid_r        = Input(UInt(1.W))  //delete after
  val lsu_exc_valid_r             = Input(UInt(1.W))
  val mepc_trigger_hit_sel_pc_r   = Input(UInt(1.W))  //delete after
  val e4e5_int_clk                = Input(Clock())  //delete after
  val lsu_i0_exc_r                = Input(UInt(1.W))
  val inst_acc_r                  = Input(UInt(1.W))
  val inst_acc_second_r           = Input(UInt(1.W))
  val take_nmi                    = Input(UInt(1.W))
  val lsu_error_pkt_addr_r        = Input(UInt(32.W))
  val exc_cause_r                 = Input(UInt(5.W))
  val i0_valid_wb                 = Input(UInt(1.W))
  val exc_or_int_valid_r_d1       = Input(UInt(1.W))
  val interrupt_valid_r_d1        = Input(UInt(1.W))
  val clk_override                = Input(UInt(1.W))
  val i0_exception_valid_r_d1     = Input(UInt(1.W))
  val lsu_i0_exc_r_d1             = Input(UInt(1.W))
  val exc_cause_wb                = Input(UInt(5.W))
  val nmi_lsu_store_type          = Input(UInt(1.W))
  val nmi_lsu_load_type           = Input(UInt(1.W))
  val tlu_i0_commit_cmt           = Input(UInt(1.W))
  val ebreak_r                    = Input(UInt(1.W))
  val ecall_r                     = Input(UInt(1.W))
  val illegal_r                   = Input(UInt(1.W))
  val mdseac_locked_ns            = Output(UInt(1.W))
  val mdseac_locked_f             = Input(UInt(1.W))
  val nmi_int_detected_f          = Input(UInt(1.W))
  val internal_dbg_halt_mode_f2   = Input(UInt(1.W))
  val ext_int_freeze_d1           = Input(UInt(1.W))
  val ic_perr_r_d1                = Input(UInt(1.W))
  val iccm_sbecc_r_d1             = Input(UInt(1.W))
  val lsu_single_ecc_error_r_d1   = Input(UInt(1.W))
  val ifu_miss_state_idle_f       = Input(UInt(1.W))
  val lsu_idle_any_f              = Input(UInt(1.W))
  val dbg_tlu_halted_f            = Input(UInt(1.W))
  val dbg_tlu_halted              = Input(UInt(1.W))
  val debug_halt_req_f 			  = Input(UInt(1.W))
  val force_halt 				  = Output(UInt(1.W))
  val take_ext_int_start		  = Input(UInt(1.W))
  val trigger_hit_dmode_r_d1 	  = Input(UInt(1.W))
  val trigger_hit_r_d1       	  = Input(UInt(1.W))
  val dcsr_single_step_done_f 	  = Input(UInt(1.W))
  val ebreak_to_debug_mode_r_d1    = Input(UInt(1.W))
  val debug_halt_req 			  = Input(UInt(1.W))
  val allow_dbg_halt_csr_write    = Input(UInt(1.W))
  val internal_dbg_halt_mode_f    = Input(UInt(1.W))
  val enter_debug_halt_req        = Input(UInt(1.W))
  val internal_dbg_halt_mode      = Input(UInt(1.W))
  val request_debug_mode_done     = Input(UInt(1.W))
  val request_debug_mode_r        = Input(UInt(1.W))
  val dpc                         = Output(UInt(31.W))
  val update_hit_bit_r            = Input(UInt(4.W))
  val take_timer_int              = Input(UInt(1.W))
  val take_int_timer0_int         = Input(UInt(1.W))
  val take_int_timer1_int         = Input(UInt(1.W))
  val take_ext_int                = Input(UInt(1.W))
  val tlu_flush_lower_r           = Input(UInt(1.W))
  val dec_tlu_br0_error_r         = Input(UInt(1.W))
  val dec_tlu_br0_start_error_r   = Input(UInt(1.W))
  val lsu_pmu_load_external_r     = Input(UInt(1.W))
  val lsu_pmu_store_external_r    = Input(UInt(1.W))
  val csr_pkt                     = Input(new dec_tlu_csr_pkt)
  val mtdata1_t					          = Output(Vec(4,UInt(10.W)))
}

class csr_tlu extends Module with lib with CSRs with RequireAsyncReset {
 val io = IO(new CSR_IO)

////////////////////////////////wires///////////////////////////////
  val miccme_ce_req               = WireInit(UInt(1.W),0.U)
  val mice_ce_req                 = WireInit(UInt(1.W),0.U)
  val mdccme_ce_req               = WireInit(UInt(1.W),0.U)
  val pc_r_d1                     = WireInit(UInt(31.W),0.U)
  val mpmc_b_ns                   = WireInit(UInt(1.W),0.U)
  val mpmc_b                      = WireInit(UInt(1.W),0.U)
val wr_mcycleh_r                = WireInit(UInt(1.W), 0.U)   
  val mcycleh                     = WireInit(UInt(32.W),0.U) 
  val minstretl_inc               = WireInit(UInt(33.W),0.U) 
  val wr_minstreth_r              = WireInit(UInt(1.W),0.U)  
  val minstretl                   = WireInit(UInt(32.W),0.U) 
  val minstreth_inc               = WireInit(UInt(32.W),0.U) 
  val minstreth                   = WireInit(UInt(32.W),0.U) 
  val mfdc_ns                     = WireInit(UInt(15.W),0.U) 
  val mfdc_int                    = WireInit(UInt(15.W),0.U) 
  val mhpmc6_incr                 = WireInit(UInt(64.W),0.U) 
  val mhpmc5_incr                 = WireInit(UInt(64.W),0.U) 
  val mhpmc4_incr                 = WireInit(UInt(64.W),0.U) 
  val perfcnt_halted              = WireInit(UInt(1.W),0.U)  
  val mhpmc3_incr                 = WireInit(UInt(64.W),0.U) 
  val mhpme_vec                   = Wire(Vec(4,UInt(10.W)))  
  val mtdata2_t					          = Wire(Vec(4,UInt(32.W)))
  val wr_meicpct_r 				        = WireInit(UInt(1.W),0.U)  
  val force_halt_ctr_f			      = WireInit(UInt(32.W),0.U) 
  val mdccmect_inc                = WireInit(UInt(27.W),0.U) 
  val miccmect_inc                = WireInit(UInt(27.W),0.U) 
  //val fw_halted                   = WireInit(UInt(1.W),0.U)
  val micect_inc                  = WireInit(UInt(27.W),0.U) 
  val mdseac_en                   = WireInit(UInt(1.W),0.U) 
  val mie                         = WireInit(UInt(6.W),0.U)
  val mcyclel                     = WireInit(UInt(32.W),0.U)
  val mscratch                    = WireInit(UInt(32.W),0.U)
  val mcause                      = WireInit(UInt(32.W),0.U)
  val mscause                     = WireInit(UInt(4.W),0.U)
  val mtval                       = WireInit(UInt(32.W),0.U)
  val meicurpl 					          = WireInit(UInt(4.W),0.U)
  val meicidpl 					          = WireInit(UInt(4.W),0.U)
  val meipt 					            = WireInit(UInt(4.W),0.U)
  val mfdc                        = WireInit(UInt(19.W),0.U)
  val mtsel                       = WireInit(UInt(2.W),0.U)
  val micect                      = WireInit(UInt(32.W),0.U)
  val miccmect                    = WireInit(UInt(32.W),0.U)
  val mdccmect                    = WireInit(UInt(32.W),0.U)
  val mhpmc3h                     = WireInit(UInt(32.W),0.U)
  val mhpmc3                      = WireInit(UInt(32.W),0.U)
  val mhpmc4h                     = WireInit(UInt(32.W),0.U)
  val mhpmc4                      = WireInit(UInt(32.W),0.U)
  val mhpmc5h                     = WireInit(UInt(32.W),0.U)
  val mhpmc5                      = WireInit(UInt(32.W),0.U)
  val mhpmc6h                     = WireInit(UInt(32.W),0.U)
  val mhpmc6                      = WireInit(UInt(32.W),0.U)
  val mhpme3                      = WireInit(UInt(10.W),0.U)
  val mhpme4                      = WireInit(UInt(10.W),0.U)
  val mhpme5                      = WireInit(UInt(10.W),0.U)
  val mhpme6                      = WireInit(UInt(10.W),0.U)
  val mfdht 					            = WireInit(UInt(6.W),0.U)
  val mfdhs                       = WireInit(UInt(2.W),0.U)
  val mcountinhibit               = WireInit(UInt(7.W),0.U)
  val mpmc                        = WireInit(UInt(1.W),0.U)
  val dicad1                      = WireInit(UInt(32.W),0.U)
/////////////////////////////////////////////////////////////////////////
 //----------------------------------------------------------------------
 //
 // CSRs
 //
 //----------------------------------------------------------------------

 // ----------------------------------------------------------------------
 // MSTATUS (RW)
 // [12:11] MPP  : Prior priv level, always 2'b11, not flopped
 // [7]     MPIE : Int enable previous [1]
 // [3]     MIE  : Int enable          [0]

 //When executing a MRET instruction, supposing MPP holds the value 3, MIE
 //is set to MPIE; the privilege mode is changed to 3; MPIE is set to 1; and MPP is set to 3

 io.dec_csr_wen_r_mod := io.dec_csr_wen_r & !io.i0_trigger_hit_r & !io.rfpc_i0_r
 val wr_mstatus_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MSTATUS)

 // set this even if we don't go to fwhalt due to debug halt. We committed the inst, so ...
 val set_mie_pmu_fw_halt = !mpmc_b_ns & io.fw_halt_req

 val mstatus_ns = Mux1H(Seq(
   (!wr_mstatus_r & io.exc_or_int_valid_r).asBool -> Cat(io.mstatus(MSTATUS_MIE),0.U),
   (wr_mstatus_r & io.exc_or_int_valid_r).asBool -> Cat(io.dec_csr_wrdata_r(3),0.U),
   (io.mret_r & !io.exc_or_int_valid_r).asBool -> Cat(1.U, io.mstatus(1)),
   (set_mie_pmu_fw_halt).asBool -> Cat(io.mstatus(1), 1.U),
   (wr_mstatus_r & !io.exc_or_int_valid_r).asBool -> Cat(io.dec_csr_wrdata_r(7), io.dec_csr_wrdata_r(3)),
   (!wr_mstatus_r & !io.exc_or_int_valid_r & !io.mret_r & !set_mie_pmu_fw_halt).asBool -> io.mstatus))

 // gate MIE if we are single stepping and DCSR[STEPIE] is off
 io.mstatus_mie_ns := io.mstatus(MSTATUS_MIE) & (~io.dcsr_single_step_running_f | io.dcsr(DCSR_STEPIE))
 io.mstatus := withClock(io.free_clk) {
   RegNext(mstatus_ns,0.U)
 }

 // ----------------------------------------------------------------------
 // MTVEC (RW)
 // [31:2] BASE : Trap vector base address
 // [1] - Reserved, not implemented, reads zero
 // [0]  MODE : 0 = Direct, 1 = Asyncs are vectored to BASE + (4 * CAUSE)

 val wr_mtvec_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MTVEC)
 val mtvec_ns = Cat(io.dec_csr_wrdata_r(31, 2), io.dec_csr_wrdata_r(0))
 io.mtvec := rvdffe(mtvec_ns, wr_mtvec_r.asBool, clock, io.scan_mode)

 // ----------------------------------------------------------------------
 // MIP (RW)
 //
 // [30] MCEIP  : (RO) M-Mode Correctable Error interrupt pending
 // [29] MITIP0 : (RO) M-Mode Internal Timer0 interrupt pending
 // [28] MITIP1 : (RO) M-Mode Internal Timer1 interrupt pending
 // [11] MEIP   : (RO) M-Mode external interrupt pending
 // [7]  MTIP   : (RO) M-Mode timer interrupt pending
 // [3]  MSIP   : (RO) M-Mode software interrupt pending

 val ce_int = (mdccme_ce_req | miccme_ce_req | mice_ce_req)

 val mip_ns = Cat(ce_int, io.dec_timer_t0_pulse, io.dec_timer_t1_pulse, io.mexintpend, io.timer_int_sync, io.soft_int_sync)
 io.mip := withClock(io.free_clk) {
   RegNext(mip_ns,0.U)
 }

 // ----------------------------------------------------------------------
 // MIE (RW)
 // [30] MCEIE  : (RO) M-Mode Correctable Error interrupt enable
 // [29] MITIE0 : (RO) M-Mode Internal Timer0 interrupt enable
 // [28] MITIE1 : (RO) M-Mode Internal Timer1 interrupt enable
 // [11] MEIE   : (RW) M-Mode external interrupt enable
 // [7]  MTIE   : (RW) M-Mode timer interrupt enable
 // [3]  MSIE   : (RW) M-Mode software interrupt enable

 val wr_mie_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MIE)
 io.mie_ns := Mux(wr_mie_r.asBool, Cat(io.dec_csr_wrdata_r(30, 28), io.dec_csr_wrdata_r(11), io.dec_csr_wrdata_r(7), io.dec_csr_wrdata_r(3)), mie)
 mie := withClock(io.csr_wr_clk) {
   RegNext(io.mie_ns,0.U)
 }

 // ----------------------------------------------------------------------
 // MCYCLEL (RW)
 // [31:0] : Lower Cycle count

 val kill_ebreak_count_r = io.ebreak_to_debug_mode_r & io.dcsr(DCSR_STOPC)

 val wr_mcyclel_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MCYCLEL)

 val mcyclel_cout_in = ~(kill_ebreak_count_r | (io.dec_tlu_dbg_halted & io.dcsr(DCSR_STOPC)) | io.dec_tlu_pmu_fw_halted | mcountinhibit(0))

 
 val mcyclel_inc                 = WireInit(UInt(33.W),0.U)
 mcyclel_inc := mcyclel +& Cat(0.U(31.W), mcyclel_cout_in)
 val mcyclel_ns = Mux(wr_mcyclel_r.asBool, io.dec_csr_wrdata_r, mcyclel_inc(31,0))
 val mcyclel_cout = mcyclel_inc(32).asBool
 mcyclel := rvdffe(mcyclel_ns, (wr_mcyclel_r | mcyclel_cout_in.asUInt).asBool, clock, io.scan_mode)
 val mcyclel_cout_f = withClock(io.free_clk) {RegNext((mcyclel_cout & !wr_mcycleh_r),0.U)}
 // ----------------------------------------------------------------------
 // MCYCLEH (RW)
 // [63:32] : Higher Cycle count
 // Chained with mcyclel. Note: mcyclel overflow due to a mcycleh write gets ignored.

 wr_mcycleh_r := io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MCYCLEH)

 val mcycleh_inc = mcycleh + Cat(0.U(31.W), mcyclel_cout_f)
 val mcycleh_ns = Mux(wr_mcycleh_r.asBool, io.dec_csr_wrdata_r, mcycleh_inc)

 mcycleh := rvdffe(mcycleh_ns, (wr_mcycleh_r | mcyclel_cout_f).asBool, clock, io.scan_mode)


 // ----------------------------------------------------------------------
 // MINSTRETL (RW)
 // [31:0] : Lower Instruction retired count
 // From the spec "Some CSRs, such as the instructions retired counter, instret, may be modified as side effects
 // of instruction execution. In these cases, if a CSR access instruction reads a CSR, it reads the
 // value prior to the execution of the instruction. If a CSR access instruction writes a CSR, the
 // update occurs after the execution of the instruction. In particular, a value written to instret by
 // one instruction will be the value read by the following instruction (i.e., the increment of instret
 // caused by the first instruction retiring happens before the write of the new value)."


 val i0_valid_no_ebreak_ecall_r = io.tlu_i0_commit_cmt & ~(io.ebreak_r | io.ecall_r | io.ebreak_to_debug_mode_r | io.illegal_r | mcountinhibit(2)).asBool

 val wr_minstretl_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MINSTRETL)

 minstretl_inc := minstretl +& Cat(0.U(31.W),i0_valid_no_ebreak_ecall_r)
 val minstretl_cout = minstretl_inc(32)
 val minstret_enable = (i0_valid_no_ebreak_ecall_r | wr_minstretl_r).asBool

 val minstretl_ns = Mux(wr_minstretl_r.asBool, io.dec_csr_wrdata_r , minstretl_inc(31,0))
 minstretl := rvdffe(minstretl_ns,minstret_enable.asBool,clock,io.scan_mode)
 val minstret_enable_f = withClock(io.free_clk){RegNext(minstret_enable,0.U)}
 val minstretl_cout_f  = withClock(io.free_clk){RegNext((minstretl_cout & ~wr_minstreth_r),0.U)}

 val minstretl_read = minstretl
 // ----------------------------------------------------------------------
 // MINSTRETH (RW)
 // [63:32] : Higher Instret count
 // Chained with minstretl. Note: minstretl overflow due to a minstreth write gets ignored.

 wr_minstreth_r := (io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MINSTRETH)).asBool


 minstreth_inc := minstreth + Cat(0.U(31.W), minstretl_cout_f)
 val minstreth_ns  = Mux(wr_minstreth_r.asBool, io.dec_csr_wrdata_r, minstreth_inc)

 minstreth := rvdffe(minstreth_ns, (minstret_enable_f | wr_minstreth_r).asBool, clock, io.scan_mode)
 
 val minstreth_read = minstreth_inc

 // ----------------------------------------------------------------------
 // mscratch (RW)
 // [31:0] : Scratch register

 val wr_mscratch_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MSCRATCH)

 mscratch := rvdffe(io.dec_csr_wrdata_r,wr_mscratch_r.asBool,clock,io.scan_mode)


 // ---------------------------meivt-------------------------------------------
 // MEPC (RW)
 // [31:1] : Exception PC

 // NPC

 val sel_exu_npc_r = !io.dec_tlu_dbg_halted & !io.tlu_flush_lower_r_d1 & io.dec_tlu_i0_valid_r
 val sel_flush_npc_r = !io.dec_tlu_dbg_halted & io.tlu_flush_lower_r_d1 & !io.dec_tlu_flush_noredir_r_d1
 val sel_hold_npc_r = !sel_exu_npc_r & !sel_flush_npc_r

 io.npc_r :=  Mux1H(Seq(
           sel_exu_npc_r.asBool                            -> io.exu_npc_r,
           (!io.mpc_reset_run_req & io.reset_delayed).asBool  -> io.rst_vec,    // init to reset vector for mpc halt on reset case
           sel_flush_npc_r.asBool                          -> io.tlu_flush_path_r_d1,
           sel_hold_npc_r.asBool                           -> io.npc_r_d1 ))

 io.npc_r_d1 := rvdffe(io.npc_r,(sel_exu_npc_r | sel_flush_npc_r | io.reset_delayed).asBool,clock,io.scan_mode)
 // PC has to be captured for exceptions and interrupts. For MRET, we could execute it and then take an
 // interrupt before the next instruction.
 val pc0_valid_r = (!io.dec_tlu_dbg_halted & io.dec_tlu_i0_valid_r).asBool

 val pc_r  = Mux1H( Seq(
                      pc0_valid_r   -> io.dec_tlu_i0_pc_r,
                     ~pc0_valid_r   -> pc_r_d1 ))

 pc_r_d1 := rvdffe(pc_r, pc0_valid_r, clock, io.scan_mode)

 val wr_mepc_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MEPC)

 val mepc_ns = Mux1H( Seq(
 (io.i0_exception_valid_r | io.lsu_exc_valid_r | io.mepc_trigger_hit_sel_pc_r).asBool  -> pc_r,
 (io.interrupt_valid_r).asBool                                                   -> io.npc_r,
 (wr_mepc_r & !io.exc_or_int_valid_r).asBool                                     -> io.dec_csr_wrdata_r(31,1),
 (!wr_mepc_r & !io.exc_or_int_valid_r).asBool                                    -> io.mepc) )

 io.mepc := withClock(io.e4e5_int_clk){RegNext(mepc_ns,0.U)}


 // ----------------------------------------------------------------------
   // MCAUSE (RW)
   // [31:0] : Exception Cause

   val wr_mcause_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MCAUSE)
   val mcause_sel_nmi_store = io.exc_or_int_valid_r & io.take_nmi & io.nmi_lsu_store_type
   val mcause_sel_nmi_load = io.exc_or_int_valid_r & io.take_nmi & io.nmi_lsu_load_type
   val mcause_sel_nmi_ext = io.exc_or_int_valid_r & io.take_nmi & io.lsu_fir_error.orR
   // FIR value decoder
   // 0 –no error
   // 1 –uncorrectable ecc  => f000_1000
   // 2 –dccm region access error => f000_1001
   // 3 –non dccm region access error => f000_1002
   val mcause_fir_error_type = Cat(io.lsu_fir_error.andR, (io.lsu_fir_error(1) & ~io.lsu_fir_error(0)))

   val mcause_ns = Mux1H(Seq(
                              mcause_sel_nmi_store.asBool                      -> "hf000_0000".U(32.W),
                              mcause_sel_nmi_load.asBool                       -> "hf000_0001".U(32.W),
                              mcause_sel_nmi_ext.asBool                        -> Cat("hf000_100".U(28.W), 0.U(2.W), mcause_fir_error_type),
                              (io.exc_or_int_valid_r & ~io.take_nmi).asBool          -> Cat(io.interrupt_valid_r, 0.U(26.W), io.exc_cause_r), 
                              (wr_mcause_r & ~io.exc_or_int_valid_r).asBool       -> io.dec_csr_wrdata_r,
                              (~wr_mcause_r & ~io.exc_or_int_valid_r).asBool      -> mcause) )

    mcause := withClock(io.e4e5_int_clk){RegNext(mcause_ns,0.U)}


 // ----------------------------------------------------------------------
 // MSCAUSE (RW)
 // [2:0] : Secondary exception Cause

 val wr_mscause_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MSCAUSE)

 val ifu_mscause =  Mux((io.dec_tlu_packet_r.icaf_type === 0.U(2.W)), "b1001".U, Cat(0.U(2.W) , io.dec_tlu_packet_r.icaf_type))

 val mscause_type = Mux1H( Seq(
                   io.lsu_i0_exc_r.asBool                 -> io.lsu_error_pkt_r.bits.mscause,
                   io.i0_trigger_hit_r.asBool             -> "b0001".U,
                   io.ebreak_r.asBool                     -> "b0010".U,
                   io.inst_acc_r.asBool                   -> ifu_mscause ))


 val mscause_ns = Mux1H( Seq(
                       (io.exc_or_int_valid_r).asBool                           -> mscause_type,
                       (wr_mscause_r & !io.exc_or_int_valid_r).asBool           -> io.dec_csr_wrdata_r(3,0),
                       (!wr_mscause_r & !io.exc_or_int_valid_r).asBool          -> mscause))

 mscause := withClock(io.e4e5_int_clk){RegNext(mscause_ns,0.U)}

 // ----------------------------------------------------------------------
 // MTVAL (RW)
 // [31:0] : Exception address if relevant


 val wr_mtval_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MTVAL)
 val mtval_capture_pc_r = io.exc_or_int_valid_r & (io.ebreak_r | (io.inst_acc_r & ~io.inst_acc_second_r) | io.mepc_trigger_hit_sel_pc_r) & ~io.take_nmi
 val mtval_capture_pc_plus2_r = io.exc_or_int_valid_r & (io.inst_acc_r & io.inst_acc_second_r) & ~io.take_nmi
 val mtval_capture_inst_r = io.exc_or_int_valid_r & io.illegal_r & ~io.take_nmi
 val mtval_capture_lsu_r = io.exc_or_int_valid_r & io.lsu_exc_valid_r & ~io.take_nmi
 val mtval_clear_r = io.exc_or_int_valid_r & ~mtval_capture_pc_r & ~mtval_capture_inst_r & ~mtval_capture_lsu_r & ~io.mepc_trigger_hit_sel_pc_r


 val mtval_ns = Mux1H(Seq(
   (mtval_capture_pc_r).asBool                                        -> Cat(pc_r, 0.U(1.W)),
   (mtval_capture_pc_plus2_r).asBool                                  -> Cat(pc_r + 1.U(31.W), 0.U(1.W)),
   (mtval_capture_inst_r).asBool                                      -> io.dec_illegal_inst,
   (mtval_capture_lsu_r).asBool                                       -> io.lsu_error_pkt_addr_r,
   (wr_mtval_r & ~io.interrupt_valid_r.asUInt).asBool             -> io.dec_csr_wrdata_r,
   (~io.take_nmi & ~wr_mtval_r & ~mtval_capture_pc_r & ~mtval_capture_inst_r & ~mtval_clear_r & ~mtval_capture_lsu_r).asBool -> mtval ))

 mtval :=  withClock(io.e4e5_int_clk){RegNext(mtval_ns,0.U)}

 // ----------------------------------------------------------------------
 // MCGC (RW) Clock gating control
 // [31:9] : Reserved, reads 0x0
 // [8]    : misc_clk_override
 // [7]    : dec_clk_override
 // [6]    : unused
 // [5]    : ifu_clk_override
 // [4]    : lsu_clk_override
 // [3]    : bus_clk_override
 // [2]    : pic_clk_override
 // [1]    : dccm_clk_override
 // [0]    : icm_clk_override
 //
 val wr_mcgc_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MCGC)

 val mcgc = rvdffe(io.dec_csr_wrdata_r(8,0),wr_mcgc_r.asBool,clock,io.scan_mode)

 io.dec_tlu_misc_clk_override := mcgc(8)
 io.dec_tlu_dec_clk_override  := mcgc(7)
 io.dec_tlu_ifu_clk_override  := mcgc(5)
 io.dec_tlu_lsu_clk_override  := mcgc(4)
 io.dec_tlu_bus_clk_override  := mcgc(3)
 io.dec_tlu_pic_clk_override  := mcgc(2)
 io.dec_tlu_dccm_clk_override := mcgc(1)
 io.dec_tlu_icm_clk_override  := mcgc(0)

 // ----------------------------------------------------------------------
 // MFDC (RW) Feature Disable Control
 // [31:19] : Reserved, reads 0x0
 // [18:16] : DMA QoS Prty
 // [15:12] : Reserved, reads 0x0
 // [11]   : Disable external load forwarding
 // [10]   : Disable dual issue
 // [9]    : Disable pic multiple ints
 // [8]    : Disable core ecc
 // [7]    : Unused, 0x0
 // [6]    : Disable Sideeffect lsu posting
 // [5:4]  : Unused, 0x0
 // [3]    : Disable branch prediction and return stack
 // [2]    : Disable write buffer coalescing
 // [1]    : Unused, 0x0
 // [0]    : Disable pipelining - Enable single instruction execution
 //
 val wr_mfdc_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MFDC)



 mfdc_int := rvdffe(mfdc_ns,wr_mfdc_r.asBool,clock,io.scan_mode)
//  rvdffe #(15)  mfdc_ff (.*, .en(wr_mfdc_r), .din({mfdc_ns[14:0]}), .dout(mfdc_int[14:0]));

 if(BUILD_AXI4 == true){
 // flip poweron value of bit 6 for AXI build
    mfdc_ns := Cat(~io.dec_csr_wrdata_r(18,16),io.dec_csr_wrdata_r(11,7), ~io.dec_csr_wrdata_r(6), io.dec_csr_wrdata_r(5,0))
    mfdc    := Cat(~mfdc_int(14,12),0.U(4.W), mfdc_int(11,7), ~mfdc_int(6), mfdc_int(5,0))
 }
 else {
   mfdc_ns := Cat(~io.dec_csr_wrdata_r(18,16),io.dec_csr_wrdata_r(11,0))
   mfdc    := Cat(~mfdc_int(14,12),0.U(4.W), mfdc_int(11,0))
 }


 io.dec_tlu_dma_qos_prty              := mfdc(18,16)
 io.dec_tlu_external_ldfwd_disable    := mfdc(11)
 io.dec_tlu_core_ecc_disable          := mfdc(8)
 io.dec_tlu_sideeffect_posted_disable := mfdc(6)
 io.dec_tlu_bpred_disable             := mfdc(3)
 io.dec_tlu_wb_coalescing_disable     := mfdc(2)
 io.dec_tlu_pipelining_disable        := mfdc(0)


 // ----------------------------------------------------------------------
 // MCPC (RW) Pause counter
 // [31:0] : Reads 0x0, decs in the wb register in decode_ctl



 io.dec_tlu_wr_pause_r := io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MCPC) & ~io.interrupt_valid_r & ~io.take_ext_int_start


 // ----------------------------------------------------------------------
 // MRAC (RW)
 // [31:0] : Region Access Control Register, 16 regions, {side_effect, cachable} pairs

 val wr_mrac_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MRAC)

 // prevent pairs of 0x11, side_effect and cacheable
 val mrac_in = Cat(io.dec_csr_wrdata_r(31), io.dec_csr_wrdata_r(30) & ~io.dec_csr_wrdata_r(31),
                     io.dec_csr_wrdata_r(29), io.dec_csr_wrdata_r(28) & ~io.dec_csr_wrdata_r(29),
                     io.dec_csr_wrdata_r(27), io.dec_csr_wrdata_r(26) & ~io.dec_csr_wrdata_r(27),
                     io.dec_csr_wrdata_r(25), io.dec_csr_wrdata_r(24) & ~io.dec_csr_wrdata_r(25),
                     io.dec_csr_wrdata_r(23), io.dec_csr_wrdata_r(22) & ~io.dec_csr_wrdata_r(23),
                     io.dec_csr_wrdata_r(21), io.dec_csr_wrdata_r(20) & ~io.dec_csr_wrdata_r(21),
                     io.dec_csr_wrdata_r(19), io.dec_csr_wrdata_r(18) & ~io.dec_csr_wrdata_r(19),
                     io.dec_csr_wrdata_r(17), io.dec_csr_wrdata_r(16) & ~io.dec_csr_wrdata_r(17),
                     io.dec_csr_wrdata_r(15), io.dec_csr_wrdata_r(14) & ~io.dec_csr_wrdata_r(15),
                     io.dec_csr_wrdata_r(13), io.dec_csr_wrdata_r(12) & ~io.dec_csr_wrdata_r(13),
                     io.dec_csr_wrdata_r(11), io.dec_csr_wrdata_r(10) & ~io.dec_csr_wrdata_r(11),
                     io.dec_csr_wrdata_r(9),  io.dec_csr_wrdata_r(8) &  ~io.dec_csr_wrdata_r(9),
                     io.dec_csr_wrdata_r(7),  io.dec_csr_wrdata_r(6) &  ~io.dec_csr_wrdata_r(7),
                     io.dec_csr_wrdata_r(5),  io.dec_csr_wrdata_r(4) &  ~io.dec_csr_wrdata_r(5),
                     io.dec_csr_wrdata_r(3),  io.dec_csr_wrdata_r(2) &  ~io.dec_csr_wrdata_r(3),
                     io.dec_csr_wrdata_r(1),  io.dec_csr_wrdata_r(0) &  ~io.dec_csr_wrdata_r(1))


 val mrac = rvdffe(mrac_in,wr_mrac_r.asBool,clock,io.scan_mode)
 // drive to LSU/IFU
 io.dec_tlu_mrac_ff := mrac


 // ----------------------------------------------------------------------
 // MDEAU (WAR0)
 // [31:0] : Dbus Error Address Unlock register
 //

 val wr_mdeau_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MDEAU)


 // ----------------------------------------------------------------------
 // MDSEAC (R)
 // [31:0] : Dbus Store Error Address Capture register
 //


 // only capture error bus if the MDSEAC reg is not locked
 io.mdseac_locked_ns := mdseac_en | (io.mdseac_locked_f & ~wr_mdeau_r)

 mdseac_en := (io.lsu_imprecise_error_store_any | io.lsu_imprecise_error_load_any) & ~io.nmi_int_detected_f & ~io.mdseac_locked_f

 val mdseac = rvdffe(io.lsu_imprecise_error_addr_any,mdseac_en.asBool,clock,io.scan_mode)

 // ----------------------------------------------------------------------
 // MPMC (R0W1)
 // [0] : FW halt
 // [1] : Set MSTATUS[MIE] on halt



 val wr_mpmc_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MPMC)

 // allow the cycle of the dbg halt flush that contains the wr_mpmc_r to
 // set the io.mstatus bit potentially, use delayed version of internal dbg halt.
 io.fw_halt_req := wr_mpmc_r & io.dec_csr_wrdata_r(0) & ~io.internal_dbg_halt_mode_f2 & ~io.ext_int_freeze_d1
 val fw_halted_ns = WireInit(UInt(1.W),0.U)
 val fw_halted = withClock(io.free_clk){RegNext(fw_halted_ns,0.U)}
 fw_halted_ns := (io.fw_halt_req | fw_halted) & ~set_mie_pmu_fw_halt
 mpmc_b_ns := Mux(wr_mpmc_r.asBool, ~io.dec_csr_wrdata_r(1), ~mpmc)

 mpmc_b := withClock(io.csr_wr_clk){RegNext(mpmc_b_ns,0.U)}


 mpmc := ~mpmc_b

 // ----------------------------------------------------------------------
 // MICECT (I-Cache error counter/threshold)
 // [31:27] : Icache parity error threshold
 // [26:0]  : Icache parity error count



 val csr_sat = Mux((io.dec_csr_wrdata_r(31,27) > 26.U(5.W)), 26.U(5.W), io.dec_csr_wrdata_r(31,27))

 val wr_micect_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MICECT)
 micect_inc := micect + Cat(0.U(26.W), io.ic_perr_r_d1)
 val micect_ns =  Mux(wr_micect_r.asBool, Cat(csr_sat, io.dec_csr_wrdata_r(26,0)) , Cat(micect(31,27), micect_inc))

 micect := rvdffe(micect_ns,(wr_micect_r | io.ic_perr_r_d1).asBool,clock,io.scan_mode)

 mice_ce_req := (("hffffffff".U(32.W) << micect(31,27)) & Cat(0.U(5.W), micect(26,0))).orR

 // ----------------------------------------------------------------------
 // MICCMECT (ICCM error counter/threshold)
 // [31:27] : ICCM parity error threshold
 // [26:0]  : ICCM parity error count



 val wr_miccmect_r     = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MICCMECT)
 miccmect_inc := miccmect(26,0) + Cat(0.U(26.W), (io.iccm_sbecc_r_d1 | io.iccm_dma_sb_error))
 val miccmect_ns        = Mux(wr_miccmect_r.asBool, Cat(csr_sat, io.dec_csr_wrdata_r(26,0)) , Cat(miccmect(31,27), miccmect_inc))

 miccmect := rvdffe(miccmect_ns,(wr_miccmect_r | io.iccm_sbecc_r_d1 | io.iccm_dma_sb_error).asBool,clock,io.scan_mode)

miccme_ce_req := (("hffffffff".U(32.W) << miccmect(31,27)) & Cat(0.U(5.W), miccmect(26,0))).orR
//miccme_ce_req := (Bits("hffffffff".U(32.W)) << miccmect(31,27) & Cat(0.U(5.W), miccmect(26,0))).orR
 // ----------------------------------------------------------------------
 // MDCCMECT (DCCM error counter/threshold)
 // [31:27] : DCCM parity error threshold
 // [26:0]  : DCCM parity error count



 val wr_mdccmect_r     = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MDCCMECT)
 mdccmect_inc := mdccmect(26,0) + Cat(0.U(26.W), io.lsu_single_ecc_error_r_d1)
 val mdccmect_ns        = Mux(wr_mdccmect_r.asBool, Cat(csr_sat, io.dec_csr_wrdata_r(26,0)) , Cat(mdccmect(31,27), mdccmect_inc))

 mdccmect := rvdffe(mdccmect_ns, (wr_mdccmect_r | io.lsu_single_ecc_error_r_d1).asBool, clock, io.scan_mode)

 mdccme_ce_req := (("hffffffff".U(32.W) << mdccmect(31,27)) & Cat(0.U(5.W), mdccmect(26,0))).orR


 // ----------------------------------------------------------------------
 // MFDHT (Force Debug Halt Threshold)
 // [5:1] : Halt timeout threshold (power of 2)
 //   [0] : Halt timeout enabled



 val wr_mfdht_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MFDHT)

 val mfdht_ns = Mux(wr_mfdht_r.asBool, io.dec_csr_wrdata_r(5,0) , mfdht)

 mfdht := withClock(io.active_clk){RegNext(mfdht_ns,0.U)}

 // ----------------------------------------------------------------------
 // MFDHS(RW)
 // [1] : LSU operation pending when debug halt threshold reached
 // [0] : IFU operation pending when debug halt threshold reached



 val wr_mfdhs_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MFDHS)

 val mfdhs_ns = Mux(wr_mfdhs_r.asBool,  io.dec_csr_wrdata_r(1,0) ,
                 Mux((io.dbg_tlu_halted & ~io.dbg_tlu_halted_f).asBool,  Cat(~io.lsu_idle_any_f, ~io.ifu_miss_state_idle_f) , mfdhs))

 mfdhs := withClock(io.active_clk){RegEnable(mfdhs_ns,0.U,(wr_mfdhs_r | io.dbg_tlu_halted).asBool)}

 val force_halt_ctr = Mux(io.debug_halt_req_f.asBool,  (force_halt_ctr_f + 1.U(32.W)) ,
                       Mux(io.dbg_tlu_halted_f.asBool, 0.U(32.W) , force_halt_ctr_f))

 force_halt_ctr_f := withClock(io.active_clk){RegEnable(force_halt_ctr,0.U,mfdht(0))}

 io.force_halt := mfdht(0) & (force_halt_ctr_f & ("hffffffff".U(32.W) << mfdht(5,1))).orR


 // ----------------------------------------------------------------------
 // MEIVT (External Interrupt Vector Table (R/W))
 // [31:10]: Base address (R/W)
 // [9:0]  : Reserved, reads 0x0

 val wr_meivt_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MEIVT)

 val meivt = rvdffe(io.dec_csr_wrdata_r(31,10),wr_meivt_r.asBool,clock,io.scan_mode)

 // ----------------------------------------------------------------------
 // MEIHAP (External Interrupt Handler Access Pointer (R))
 // [31:10]: Base address (R/W)
 // [9:2]  : ClaimID (R)
 // [1:0]  : Reserved, 0x0

 

 val wr_meihap_r = wr_meicpct_r

 val meihap = rvdffe(io.pic_claimid,wr_meihap_r.asBool,clock,io.scan_mode)
 io.dec_tlu_meihap := Cat(meivt, meihap)

 // ----------------------------------------------------------------------
 // MEICURPL (R/W)
 // [31:4] : Reserved (read 0x0)
 // [3:0]  : CURRPRI - Priority level of current interrupt service routine (R/W)



 val wr_meicurpl_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MEICURPL)
 val meicurpl_ns = Mux(wr_meicurpl_r.asBool, io.dec_csr_wrdata_r(3,0) , meicurpl)

 meicurpl := withClock(io.csr_wr_clk){RegNext(meicurpl_ns,0.U)}
 // PIC needs this reg
 io.dec_tlu_meicurpl := meicurpl


 // ----------------------------------------------------------------------
 // MEICIDPL (R/W)
 // [31:4] : Reserved (read 0x0)
 // [3:0]  : External Interrupt Claim ID's Priority Level Register



 val wr_meicidpl_r = (io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MEICIDPL)) | io.take_ext_int_start

 val meicidpl_ns = Mux(wr_meicpct_r.asBool, io.pic_pl,
                   Mux(wr_meicidpl_r.asBool, io.dec_csr_wrdata_r(3,0) , meicidpl))

 meicidpl := withClock(io.free_clk){RegNext(meicidpl_ns,0.U)}

 // ----------------------------------------------------------------------
 // MEICPCT (Capture CLAIMID in MEIHAP and PL in MEICIDPL
 // [31:1] : Reserved (read 0x0)
 // [0]    : Capture (W1, Read 0)

 wr_meicpct_r := (io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MEICPCT)) | io.take_ext_int_start

 // ----------------------------------------------------------------------
 // MEIPT (External Interrupt Priority Threshold)
 // [31:4] : Reserved (read 0x0)
 // [3:0]  : PRITHRESH



 val wr_meipt_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MEIPT)
 val meipt_ns = Mux(wr_meipt_r.asBool, io.dec_csr_wrdata_r(3,0), meipt)

 meipt := withClock(io.active_clk){RegNext(meipt_ns,0.U)}
 // to PIC
 io.dec_tlu_meipt := meipt

 // ----------------------------------------------------------------------
 // DCSR (R/W) (Only accessible in debug mode)
 // [31:28] : xdebugver (hard coded to 0x4) RO
 // [27:16] : 0x0, reserved
 // [15]    : ebreakm
 // [14]    : 0x0, reserved
 // [13]    : ebreaks (0x0 for this core)
 // [12]    : ebreaku (0x0 for this core)
 // [11]    : stepie
 // [10]    : stopcount
 // [9]     : 0x0 //stoptime
 // [8:6]   : cause (RO)
 // [5:4]   : 0x0, reserved
 // [3]     : nmip
 // [2]     : step
 // [1:0]   : prv (0x3 for this core)
 //

 // RV has clarified that 'priority 4' in the spec means top priority.
 // 4. single step. 3. Debugger request. 2. Ebreak. 1. Trigger.

 // RV debug spec indicates a cause priority change for trigger hits during single step.


 val trigger_hit_for_dscr_cause_r_d1 = io.trigger_hit_dmode_r_d1 | (io.trigger_hit_r_d1 & io.dcsr_single_step_done_f);

 val dcsr_cause = Mux1H(Seq(
(io.dcsr_single_step_done_f & ~io.ebreak_to_debug_mode_r_d1 & ~trigger_hit_for_dscr_cause_r_d1 & ~io.debug_halt_req).asBool -> "b100".U(3.W),
                          (io.debug_halt_req & ~io.ebreak_to_debug_mode_r_d1 & ~trigger_hit_for_dscr_cause_r_d1).asBool -> "b011".U(3.W),
                                            (io.ebreak_to_debug_mode_r_d1 & ~trigger_hit_for_dscr_cause_r_d1).asBool -> "b001".U(3.W),
                                                                         (trigger_hit_for_dscr_cause_r_d1).asBool -> "b010".U(3.W) ))

 val wr_dcsr_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DCSR)



 // Multiple halt enter requests can happen before we are halted.
 // We have to continue to upgrade based on dcsr_cause priority but we can't downgrade.
 val dcsr_cause_upgradeable = io.internal_dbg_halt_mode_f & (io.dcsr(8,6) === "b011".U(3.W))
 val enter_debug_halt_req_le = io.enter_debug_halt_req & (~io.dbg_tlu_halted | dcsr_cause_upgradeable)

 val nmi_in_debug_mode = io.nmi_int_detected_f & io.internal_dbg_halt_mode_f
 val dcsr_ns = Mux(enter_debug_halt_req_le.asBool,  Cat(io.dcsr(15,9), dcsr_cause, io.dcsr(5,2),"b11".U(2.W)) ,//prv 0x3 for this core
   Mux(wr_dcsr_r.asBool, Cat(io.dec_csr_wrdata_r(15), 0.U(3.W), io.dec_csr_wrdata_r(11,10), 0.U(1.W), io.dcsr(8,6), 0.U(2.W), nmi_in_debug_mode | io.dcsr(3), io.dec_csr_wrdata_r(2), "b11".U(2.W)) ,  Cat(io.dcsr(15,4), nmi_in_debug_mode, io.dcsr(2),"b11".U(2.W))))

 io.dcsr := rvdffe(dcsr_ns, (enter_debug_halt_req_le | wr_dcsr_r | io.internal_dbg_halt_mode | io.take_nmi).asBool, clock, io.scan_mode)

 // ----------------------------------------------------------------------
 // DPC (R/W) (Only accessible in debug mode)
 // [31:0] : Debug PC



 val wr_dpc_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DPC)
 val dpc_capture_npc = io.dbg_tlu_halted & ~io.dbg_tlu_halted_f & ~io.request_debug_mode_done
 val dpc_capture_pc = io.request_debug_mode_r

 val dpc_ns = Mux1H(Seq(
                   (~dpc_capture_pc & ~dpc_capture_npc & wr_dpc_r).asBool -> io.dec_csr_wrdata_r(31,1),
                                                  (dpc_capture_pc).asBool -> pc_r,
                               (~dpc_capture_pc & dpc_capture_npc).asBool -> io.npc_r ))

 io.dpc := rvdffe(dpc_ns,(wr_dpc_r | dpc_capture_pc | dpc_capture_npc).asBool,clock,io.scan_mode)

 // ----------------------------------------------------------------------
 // DICAWICS (R/W) (Only accessible in debug mode)
 // [31:25] : Reserved
 // [24]    : Array select, 0 is data, 1 is tag
 // [23:22] : Reserved
 // [21:20] : Way select
 // [19:17] : Reserved
 // [16:3]  : Index
 // [2:0]   : Reserved

 

 val dicawics_ns = Cat(io.dec_csr_wrdata_r(24), io.dec_csr_wrdata_r(21,20), io.dec_csr_wrdata_r(16,3))
 val wr_dicawics_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DICAWICS)

 val dicawics = rvdffe(dicawics_ns,wr_dicawics_r.asBool,clock,io.scan_mode)

 // ----------------------------------------------------------------------
 // DICAD0 (R/W) (Only accessible in debug mode)
 //
 // If io.dicawics[array] is 0
 // [31:0]  : inst data
 //
 // If io.dicawics[array] is 1
 // [31:16] : Tag
 // [15:7]  : Reserved
 // [6:4]   : LRU
 // [3:1]   : Reserved
 // [0]     : Valid


 val wr_dicad0_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DICAD0)
 val dicad0_ns = Mux(wr_dicad0_r.asBool, io.dec_csr_wrdata_r, io.ifu_ic_debug_rd_data)

 val dicad0 = rvdffe(dicad0_ns, (wr_dicad0_r | io.ifu_ic_debug_rd_data_valid).asBool, clock, io.scan_mode)

 // ----------------------------------------------------------------------
 // DICAD0H (R/W) (Only accessible in debug mode)
 //
 // If io.dicawics[array] is 0
 // [63:32]  : inst data
 //


 val wr_dicad0h_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DICAD0H)

 val dicad0h_ns = Mux(wr_dicad0h_r.asBool, io.dec_csr_wrdata_r, io.ifu_ic_debug_rd_data(63,32))

 val dicad0h = rvdffe(dicad0h_ns,(wr_dicad0h_r | io.ifu_ic_debug_rd_data_valid).asBool,clock,io.scan_mode)

 if (ICACHE_ECC == true) {
 // ----------------------------------------------------------------------
 // DICAD1 (R/W) (Only accessible in debug mode)
 // [6:0]     : ECC

 val dicad1_raw = WireInit(UInt(7.W),0.U)
 val wr_dicad1_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DICAD1)

 val dicad1_ns = Mux(wr_dicad1_r.asBool, io.dec_csr_wrdata_r, io.ifu_ic_debug_rd_data(70,64))

 dicad1_raw := withClock(io.active_clk){RegEnable(dicad1_ns,0.U,(wr_dicad1_r | io.ifu_ic_debug_rd_data_valid).asBool)}
 dicad1 := Cat(0.U(25.W), dicad1_raw)

 }
 else {
 // ----------------------------------------------------------------------
 // DICAD1 (R/W) (Only accessible in debug mode)
 // [3:0]     : Parity


 val dicad1_raw = WireInit(UInt(4.W),0.U)
 val wr_dicad1_r = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DICAD1)

 val dicad1_ns = Mux(wr_dicad1_r.asBool, io.dec_csr_wrdata_r(3,0), io.ifu_ic_debug_rd_data(67,64))

 dicad1_raw :=withClock(io.active_clk){RegEnable(dicad1_ns,0.U,(wr_dicad1_r | io.ifu_ic_debug_rd_data_valid).asBool)}
 dicad1 := Cat(0.U(28.W), dicad1_raw)
 }

 // ----------------------------------------------------------------------
 // DICAGO (R/W) (Only accessible in debug mode)
 // [0]     : Go

 if (ICACHE_ECC == true)  io.dec_tlu_ic_diag_pkt.icache_wrdata := Cat(dicad1(6,0), dicad0h(31,0), dicad0(31,0))
 else    io.dec_tlu_ic_diag_pkt.icache_wrdata := Cat(0.U(2.W),dicad1(3,0), dicad0h(31,0), dicad0(31,0))

 io.dec_tlu_ic_diag_pkt.icache_dicawics := dicawics

 val icache_rd_valid = io.allow_dbg_halt_csr_write & io.dec_csr_any_unq_d & io.dec_i0_decode_d & ~io.dec_csr_wen_unq_d & (io.dec_csr_rdaddr_d(11,0) === DICAGO)
 val icache_wr_valid = io.allow_dbg_halt_csr_write & io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === DICAGO)

 val icache_rd_valid_f = withClock(io.active_clk){RegNext(icache_rd_valid,0.U)}
 val icache_wr_valid_f = withClock(io.active_clk){RegNext(icache_wr_valid,0.U)}

 io.dec_tlu_ic_diag_pkt.icache_rd_valid := icache_rd_valid_f
 io.dec_tlu_ic_diag_pkt.icache_wr_valid := icache_wr_valid_f

 // ----------------------------------------------------------------------
 // MTSEL (R/W)
 // [1:0] : Trigger select : 00, 01, 10 are data/address triggers. 11 is inst count



 val wr_mtsel_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MTSEL)
 val mtsel_ns = Mux(wr_mtsel_r.asBool, io.dec_csr_wrdata_r(1,0), mtsel)

 mtsel := withClock(io.csr_wr_clk){RegNext(mtsel_ns,0.U)}
 // ----------------------------------------------------------------------
 // MTDATA1 (R/W)
 // [31:0] : Trigger Data 1
 // for triggers 0, 1, 2 and 3 aka Match Control
 // [31:28] : type, hard coded to 0x2
 // [27]    : dmode
 // [26:21] : hard coded to 0x1f
 // [20]    : hit
 // [19]    : select (0 - address, 1 - data)
 // [18]    : timing, always 'before', reads 0x0
 // [17:12] : action, bits  [17:13] not implemented and reads 0x0
 // [11]    : chain
 // [10:7]  : match, bits [10:8] not implemented and reads 0x0
 // [6]     : M
 // [5:3]   : not implemented, reads 0x0
 // [2]     : execute
 // [1]     : store
 // [0]     : load
 //
 // decoder ring
 // [27]    : => 9
 // [20]    : => 8
 // [19]    : => 7
 // [12]    : => 6
 // [11]    : => 5
 // [7]     : => 4
 // [6]     : => 3
 // [2]     : => 2
 // [1]     : => 1
 // [0]     : => 0



 // don't allow setting load-data.
 val tdata_load = io.dec_csr_wrdata_r(0) & ~io.dec_csr_wrdata_r(19)
 // don't allow setting execute-data.
 val tdata_opcode = io.dec_csr_wrdata_r(2) & ~io.dec_csr_wrdata_r(19)
 // don't allow clearing DMODE and action=1
 val tdata_action = (io.dec_csr_wrdata_r(27) & io.dbg_tlu_halted_f) & io.dec_csr_wrdata_r(12)

 val tdata_wrdata_r  = Cat(io.dec_csr_wrdata_r(27) & io.dbg_tlu_halted_f, io.dec_csr_wrdata_r(20,19), tdata_action, io.dec_csr_wrdata_r(11),
                       io.dec_csr_wrdata_r(7,6), tdata_opcode, io.dec_csr_wrdata_r(1), tdata_load)

 // If the DMODE bit is set, tdata1 can only be updated in debug_mode
 val wr_mtdata1_t_r = VecInit.tabulate(4)(i =>  io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MTDATA1) & (mtsel === i.U(2.W)) & (~io.mtdata1_t(i)(MTDATA1_DMODE) | io.dbg_tlu_halted_f))
 val mtdata1_t_ns = VecInit.tabulate(4)(i => Mux(wr_mtdata1_t_r(i).asBool, tdata_wrdata_r, Cat(io.mtdata1_t(i)(9), io.update_hit_bit_r(i) | io.mtdata1_t(i)(8), io.mtdata1_t(i)(7,0))))

for(i <- 0 until 4) { io.mtdata1_t(i) := withClock(io.active_clk){RegNext(mtdata1_t_ns(i),0.U)}}


val mtdata1_tsel_out = Mux1H((0 until 4).map(i => (mtsel === i.U(2.W)) -> Cat(2.U(4.W), io.mtdata1_t(i)(9), "b011111".U(6.W), io.mtdata1_t(i)(8,7), 0.U(6.W), io.mtdata1_t(i)(6,5), 0.U(3.W), io.mtdata1_t(i)(4,3), 0.U(3.W), io.mtdata1_t(i)(2,0))))
for(i <- 0 until 4 ){
	io.trigger_pkt_any(i).select   := io.mtdata1_t(i)(MTDATA1_SEL)
	io.trigger_pkt_any(i).match_pkt   := io.mtdata1_t(i)(MTDATA1_MATCH)
	io.trigger_pkt_any(i).store    := io.mtdata1_t(i)(MTDATA1_ST)
	io.trigger_pkt_any(i).load     := io.mtdata1_t(i)(MTDATA1_LD)
	io.trigger_pkt_any(i).execute  := io.mtdata1_t(i)(MTDATA1_EXE)
	io.trigger_pkt_any(i).m        := io.mtdata1_t(i)(MTDATA1_M_ENABLED)
}

 // ----------------------------------------------------------------------
 // MTDATA2 (R/W)
 // [31:0] : Trigger Data 2
 // If the DMODE bit is set, tdata2 can only be updated in debug_mode
 val wr_mtdata2_t_r = VecInit.tabulate(4)(i => io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MTDATA2) & (mtsel === i.U(2.W)) & (~io.mtdata1_t(i)(MTDATA1_DMODE) | io.dbg_tlu_halted_f))
for(i <- 0 until 4) { mtdata2_t(i) := rvdffe(io.dec_csr_wrdata_r,wr_mtdata2_t_r(i).asBool,clock,io.scan_mode)}



val mtdata2_tsel_out = Mux1H((0 until 4).map(i =>(mtsel === i.U(2.W)) -> mtdata2_t(i)))
for(i <- 0 until 4) {io.trigger_pkt_any(i).tdata2 := mtdata2_t(i)}


 //----------------------------------------------------------------------
 // Performance Monitor Counters section starts
 //----------------------------------------------------------------------


 
 // Pack the event selects into a vector for genvar
 mhpme_vec(0) := mhpme3
 mhpme_vec(1) := mhpme4
 mhpme_vec(2) := mhpme5
 mhpme_vec(3) := mhpme6

 import inst_pkt_t._
 // only consider committed itypes


 val pmu_i0_itype_qual = io.dec_tlu_packet_r.pmu_i0_itype & Fill(4,io.tlu_i0_commit_cmt)
 val mhpmc_inc_r = Wire(Vec(4,UInt(1.W)))
 val mhpmc_inc_r_d1 = Wire(Vec(4,UInt(1.W)))

 // Generate the muxed incs for all counters based on event type
 for(i <- 0 until 4) {
   mhpmc_inc_r(i) :=  (~mcountinhibit(i+3) & (Mux1H(Seq(
                   (mhpme_vec(i) === MHPME_CLK_ACTIVE      ).asBool -> 1.U,
                   (mhpme_vec(i) === MHPME_ICACHE_HIT      ).asBool -> io.ifu_pmu_ic_hit,
                   (mhpme_vec(i) === MHPME_ICACHE_MISS     ).asBool -> io.ifu_pmu_ic_miss,
                   (mhpme_vec(i) === MHPME_INST_COMMIT     ).asBool -> (io.tlu_i0_commit_cmt & ~io.illegal_r),
                   (mhpme_vec(i) === MHPME_INST_COMMIT_16B ).asBool -> (io.tlu_i0_commit_cmt & ~io.exu_pmu_i0_pc4 & ~io.illegal_r),
                   (mhpme_vec(i) === MHPME_INST_COMMIT_32B ).asBool -> (io.tlu_i0_commit_cmt &  io.exu_pmu_i0_pc4 & ~io.illegal_r),
                   (mhpme_vec(i) === MHPME_INST_ALIGNED    ).asBool -> io.ifu_pmu_instr_aligned,
                   (mhpme_vec(i) === MHPME_INST_DECODED    ).asBool -> io.dec_pmu_instr_decoded,
                   (mhpme_vec(i) === MHPME_DECODE_STALL    ).asBool -> io.dec_pmu_decode_stall,
                   (mhpme_vec(i) === MHPME_INST_MUL        ).asBool -> (pmu_i0_itype_qual === MUL),
                   (mhpme_vec(i) === MHPME_INST_DIV        ).asBool -> (io.dec_tlu_packet_r.pmu_divide  & io.tlu_i0_commit_cmt),
                   (mhpme_vec(i) === MHPME_INST_LOAD       ).asBool -> (pmu_i0_itype_qual === LOAD),
                   (mhpme_vec(i) === MHPME_INST_STORE      ).asBool -> (pmu_i0_itype_qual === STORE),
                   (mhpme_vec(i) === MHPME_INST_MALOAD     ).asBool -> (pmu_i0_itype_qual === LOAD & io.dec_tlu_packet_r.pmu_lsu_misaligned),
                   (mhpme_vec(i) === MHPME_INST_MASTORE	   ).asBool -> (pmu_i0_itype_qual === STORE & io.dec_tlu_packet_r.pmu_lsu_misaligned.asBool),
                   (mhpme_vec(i) === MHPME_INST_ALU	).asBool ->  (pmu_i0_itype_qual === ALU),
                   (mhpme_vec(i) === MHPME_INST_CSRREAD ).asBool ->  (pmu_i0_itype_qual === CSRREAD),
                   (mhpme_vec(i) === MHPME_INST_CSRWRITE).asBool ->  (pmu_i0_itype_qual === CSRWRITE),
                   (mhpme_vec(i) === MHPME_INST_CSRRW   ).asBool ->  (pmu_i0_itype_qual === CSRRW),
                   (mhpme_vec(i) === MHPME_INST_EBREAK  ).asBool ->  (pmu_i0_itype_qual === EBREAK),
                   (mhpme_vec(i) === MHPME_INST_ECALL   ).asBool ->  (pmu_i0_itype_qual === ECALL),
                   (mhpme_vec(i) === MHPME_INST_FENCE   ).asBool ->  (pmu_i0_itype_qual === FENCE),
                   (mhpme_vec(i) === MHPME_INST_FENCEI  ).asBool ->  (pmu_i0_itype_qual === FENCEI),
                   (mhpme_vec(i) === MHPME_INST_MRET    ).asBool ->  (pmu_i0_itype_qual === MRET),
                   (mhpme_vec(i) === MHPME_INST_BRANCH  ).asBool -> ((pmu_i0_itype_qual === CONDBR) | (pmu_i0_itype_qual === JAL)),
                   (mhpme_vec(i) === MHPME_BRANCH_MP       ).asBool -> (io.exu_pmu_i0_br_misp & io.tlu_i0_commit_cmt),
                   (mhpme_vec(i) === MHPME_BRANCH_TAKEN    ).asBool -> (io.exu_pmu_i0_br_ataken & io.tlu_i0_commit_cmt),
                   (mhpme_vec(i) === MHPME_BRANCH_NOTP     ).asBool -> (io.dec_tlu_packet_r.pmu_i0_br_unpred & io.tlu_i0_commit_cmt),
                   (mhpme_vec(i) === MHPME_FETCH_STALL     ).asBool ->  io.ifu_pmu_fetch_stall,
                   (mhpme_vec(i) === MHPME_DECODE_STALL    ).asBool ->  io.dec_pmu_decode_stall,
                   (mhpme_vec(i) === MHPME_POSTSYNC_STALL  ).asBool -> io.dec_pmu_postsync_stall,
                   (mhpme_vec(i) === MHPME_PRESYNC_STALL   ).asBool -> io.dec_pmu_presync_stall,
                   (mhpme_vec(i) === MHPME_LSU_SB_WB_STALL ).asBool ->  io.lsu_store_stall_any,
                   (mhpme_vec(i) === MHPME_DMA_DCCM_STALL  ).asBool ->  io.dma_dccm_stall_any,
                   (mhpme_vec(i) === MHPME_DMA_ICCM_STALL  ).asBool ->  io.dma_iccm_stall_any,
                   (mhpme_vec(i) === MHPME_EXC_TAKEN       ).asBool ->  (io.i0_exception_valid_r | io.i0_trigger_hit_r | io.lsu_exc_valid_r),
                   (mhpme_vec(i) === MHPME_TIMER_INT_TAKEN ).asBool ->  (io.take_timer_int | io.take_int_timer0_int | io.take_int_timer1_int),
                   (mhpme_vec(i) === MHPME_EXT_INT_TAKEN   ).asBool ->  io.take_ext_int,
                   (mhpme_vec(i) === MHPME_FLUSH_LOWER     ).asBool ->  io.tlu_flush_lower_r,
                   (mhpme_vec(i) === MHPME_BR_ERROR        ).asBool -> ((io.dec_tlu_br0_error_r | io.dec_tlu_br0_start_error_r) & io.rfpc_i0_r),
                   (mhpme_vec(i) === MHPME_IBUS_TRANS      ).asBool -> io.ifu_pmu_bus_trxn,
                   (mhpme_vec(i) === MHPME_DBUS_TRANS      ).asBool -> io.lsu_pmu_bus_trxn,
                   (mhpme_vec(i) === MHPME_DBUS_MA_TRANS   ).asBool -> io.lsu_pmu_bus_misaligned,
                   (mhpme_vec(i) === MHPME_IBUS_ERROR      ).asBool -> io.ifu_pmu_bus_error,
                   (mhpme_vec(i) === MHPME_DBUS_ERROR      ).asBool -> io.lsu_pmu_bus_error,
                   (mhpme_vec(i) === MHPME_IBUS_STALL      ).asBool -> io.ifu_pmu_bus_busy,
                   (mhpme_vec(i) === MHPME_DBUS_STALL      ).asBool -> io.lsu_pmu_bus_busy,
                   (mhpme_vec(i) === MHPME_INT_DISABLED    ).asBool -> (~io.mstatus(MSTATUS_MIE)),
                   (mhpme_vec(i) === MHPME_INT_STALLED     ).asBool -> (~io.mstatus(MSTATUS_MIE) & (io.mip(5,0) & mie(5,0)).orR),
                   (mhpme_vec(i) === MHPME_INST_BITMANIP   ).asBool -> (pmu_i0_itype_qual === BITMANIPU),
                   (mhpme_vec(i) === MHPME_DBUS_LOAD       ).asBool -> (io.tlu_i0_commit_cmt & io.lsu_pmu_load_external_r),
                   (mhpme_vec(i) === MHPME_DBUS_STORE      ).asBool -> (io.tlu_i0_commit_cmt & io.lsu_pmu_store_external_r),
                   // These count even during sleep
                   (mhpme_vec(i) === MHPME_SLEEP_CYC       ).asBool -> io.dec_tlu_pmu_fw_halted,
                   (mhpme_vec(i) === MHPME_DMA_READ_ALL    ).asBool -> io.dma_pmu_any_read,
                   (mhpme_vec(i) === MHPME_DMA_WRITE_ALL   ).asBool -> io.dma_pmu_any_write,
                   (mhpme_vec(i) === MHPME_DMA_READ_DCCM   ).asBool -> io.dma_pmu_dccm_read,
                   (mhpme_vec(i) === MHPME_DMA_WRITE_DCCM  ).asBool -> io.dma_pmu_dccm_write   ))))
 }
 
 mhpmc_inc_r_d1(0) := withClock(io.free_clk){RegNext(mhpmc_inc_r(0),0.U)}
 mhpmc_inc_r_d1(1) := withClock(io.free_clk){RegNext(mhpmc_inc_r(1),0.U)}
 mhpmc_inc_r_d1(2) := withClock(io.free_clk){RegNext(mhpmc_inc_r(2),0.U)}
 mhpmc_inc_r_d1(3) := withClock(io.free_clk){RegNext(mhpmc_inc_r(3),0.U)}
 val perfcnt_halted_d1 = withClock(io.free_clk){RegNext(perfcnt_halted,0.U)}


 perfcnt_halted := ((io.dec_tlu_dbg_halted & io.dcsr(DCSR_STOPC)) | io.dec_tlu_pmu_fw_halted)
 val perfcnt_during_sleep = (Fill(4,~(io.dec_tlu_dbg_halted & io.dcsr(DCSR_STOPC)))) & Cat(mhpme_vec(3)(9),mhpme_vec(2)(9),mhpme_vec(1)(9),mhpme_vec(0)(9))

 io.dec_tlu_perfcnt0 := mhpmc_inc_r_d1(0) & ~(perfcnt_halted_d1 & ~perfcnt_during_sleep(0))
 io.dec_tlu_perfcnt1 := mhpmc_inc_r_d1(1) & ~(perfcnt_halted_d1 & ~perfcnt_during_sleep(1))
 io.dec_tlu_perfcnt2 := mhpmc_inc_r_d1(2) & ~(perfcnt_halted_d1 & ~perfcnt_during_sleep(2))
 io.dec_tlu_perfcnt3 := mhpmc_inc_r_d1(3) & ~(perfcnt_halted_d1 & ~perfcnt_during_sleep(3))

 // ----------------------------------------------------------------------
 // MHPMC3H(RW), MHPMC3(RW)
 // [63:32][31:0] : Hardware Performance Monitor Counter 3

 val mhpmc3_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC3)
 val mhpmc3_wr_en1 = (~perfcnt_halted | perfcnt_during_sleep(0)) & ((mhpmc_inc_r(0)).orR)
 val mhpmc3_wr_en  = mhpmc3_wr_en0 | mhpmc3_wr_en1


 mhpmc3_incr := Cat(mhpmc3h(31,0),mhpmc3(31,0)) + Cat(0.U(63.W),mhpmc_inc_r(0))
 val mhpmc3_ns = Mux(mhpmc3_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc3_incr(31,0))

 mhpmc3 := rvdffe(mhpmc3_ns,mhpmc3_wr_en.asBool,clock,io.scan_mode)

 val mhpmc3h_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC3H)
 val mhpmc3h_wr_en  = mhpmc3h_wr_en0 | mhpmc3_wr_en1
 val mhpmc3h_ns = Mux(mhpmc3h_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc3_incr(63,32))

 mhpmc3h := rvdffe(mhpmc3h_ns, mhpmc3h_wr_en.asBool, clock, io.scan_mode)
 // ----------------------------------------------------------------------
 // MHPMC4H(RW), MHPMC4(RW)
 // [63:32][31:0] : Hardware Performance Monitor Counter 4

 val mhpmc4_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC4)
 val mhpmc4_wr_en1 = (~perfcnt_halted | perfcnt_during_sleep(1)) & ((mhpmc_inc_r(1)).orR)
 val mhpmc4_wr_en  = mhpmc4_wr_en0 | mhpmc4_wr_en1



 mhpmc4_incr := Cat(mhpmc4h(31,0),mhpmc4(31,0)) + Cat(0.U(63.W),mhpmc_inc_r(1))
 val mhpmc4_ns = Mux(mhpmc4_wr_en0.asBool, io.dec_csr_wrdata_r(31,0), mhpmc4_incr(31,0))
 mhpmc4 := rvdffe(mhpmc4_ns, mhpmc4_wr_en.asBool, clock, io.scan_mode)

 val mhpmc4h_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC4H)
 val mhpmc4h_wr_en  = mhpmc4h_wr_en0 | mhpmc4_wr_en1
 val mhpmc4h_ns = Mux(mhpmc4h_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc4_incr(63,32))
 mhpmc4h := rvdffe(mhpmc4h_ns, mhpmc4h_wr_en.asBool, clock, io.scan_mode)
 
 // ----------------------------------------------------------------------
 // MHPMC5H(RW), MHPMC5(RW)
 // [63:32][31:0] : Hardware Performance Monitor Counter 5

 val mhpmc5_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC5)
 val mhpmc5_wr_en1 = (~perfcnt_halted | perfcnt_during_sleep(2)) & ((mhpmc_inc_r(2)).orR)
 val mhpmc5_wr_en  = mhpmc5_wr_en0 | mhpmc5_wr_en1

 mhpmc5_incr := Cat(mhpmc5h(31,0),mhpmc5(31,0)) + Cat(0.U(63.W),mhpmc_inc_r(2))
 val mhpmc5_ns = Mux(mhpmc5_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc5_incr(31,0))

 mhpmc5 := rvdffe(mhpmc5_ns, mhpmc5_wr_en.asBool, clock, io.scan_mode)

 val mhpmc5h_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC5H)
 val mhpmc5h_wr_en  = mhpmc5h_wr_en0 | mhpmc5_wr_en1
 val mhpmc5h_ns = Mux(mhpmc5h_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc5_incr(63,32))

 mhpmc5h := rvdffe(mhpmc5h_ns, mhpmc5h_wr_en.asBool, clock, io.scan_mode)
 // ----------------------------------------------------------------------
 // MHPMC6H(RW), MHPMC6(RW)
 // [63:32][31:0] : Hardware Performance Monitor Counter 6

 val mhpmc6_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC6)
 val mhpmc6_wr_en1 = (~perfcnt_halted | perfcnt_during_sleep(3)) & ((mhpmc_inc_r(3)).orR)
 val mhpmc6_wr_en  = mhpmc6_wr_en0 | mhpmc6_wr_en1

 mhpmc6_incr := Cat(mhpmc6h(31,0),mhpmc6(31,0)) + Cat(0.U(63.W),mhpmc_inc_r(3))
 val mhpmc6_ns = Mux(mhpmc6_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc6_incr(31,0))

 mhpmc6 := rvdffe(mhpmc6_ns, mhpmc6_wr_en.asBool, clock, io.scan_mode)

 val mhpmc6h_wr_en0 = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPMC6H)
 val mhpmc6h_wr_en  = mhpmc6h_wr_en0 | mhpmc6_wr_en1
 val mhpmc6h_ns = Mux(mhpmc6h_wr_en0.asBool, io.dec_csr_wrdata_r, mhpmc6_incr(63,32))

 mhpmc6h := rvdffe(mhpmc6h_ns, mhpmc6h_wr_en.asBool, clock, io.scan_mode)

 // ----------------------------------------------------------------------
 // MHPME3(RW)
 // [9:0] : Hardware Performance Monitor Event 3

 // we only have events 0-56, 512-516, HPME* are WARL so saturate otherwise
 val event_saturate_r = Mux(((io.dec_csr_wrdata_r(9,0) > 516.U(10.W)) | (io.dec_csr_wrdata_r(31,10)).orR),  516.U(10.W), io.dec_csr_wrdata_r(9,0))

 val wr_mhpme3_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPME3)

 mhpme3 := withClock(io.active_clk){RegEnable(event_saturate_r,0.U,wr_mhpme3_r.asBool)}
 // ----------------------------------------------------------------------
 // MHPME4(RW)
 // [9:0] : Hardware Performance Monitor Event 4

 val wr_mhpme4_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPME4)
 mhpme4 := withClock(io.active_clk){RegEnable(event_saturate_r,0.U,wr_mhpme4_r.asBool)}

 // ----------------------------------------------------------------------
 // MHPME5(RW)
 // [9:0] : Hardware Performance Monitor Event 5

 val wr_mhpme5_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPME5)
 mhpme5 := withClock(io.active_clk){RegEnable(event_saturate_r,0.U,wr_mhpme5_r.asBool)}

 // ----------------------------------------------------------------------
 // MHPME6(RW)
 // [9:0] : Hardware Performance Monitor Event 6

 val wr_mhpme6_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MHPME6)
 mhpme6 := withClock(io.active_clk){RegEnable(event_saturate_r,0.U,wr_mhpme6_r.asBool)}
 //----------------------------------------------------------------------
 // Performance Monitor Counters section ends
 //----------------------------------------------------------------------
 // ----------------------------------------------------------------------

 // MCOUNTINHIBIT(RW)
 // [31:7] : Reserved, read 0x0
 // [6]    : HPM6 disable
 // [5]    : HPM5 disable
 // [4]    : HPM4 disable
 // [3]    : HPM3 disable
 // [2]    : MINSTRET disable
 // [1]    : reserved, read 0x0
 // [0]    : MCYCLE disable

 val wr_mcountinhibit_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r(11,0) === MCOUNTINHIBIT)

 val temp_ncount0 =  WireInit(UInt(1.W),mcountinhibit(0))
 val temp_ncount1 =  WireInit(UInt(1.W),mcountinhibit(1))
 val temp_ncount6_2 = WireInit(UInt(5.W),mcountinhibit(6,2))
 temp_ncount6_2 := withClock(io.active_clk){RegEnable(io.dec_csr_wrdata_r(6,2),0.U,wr_mcountinhibit_r.asBool)}

 temp_ncount0 := withClock(io.active_clk){RegEnable(io.dec_csr_wrdata_r(0),0.U,wr_mcountinhibit_r.asBool)}
 mcountinhibit := Cat(temp_ncount6_2, 0.U(1.W),temp_ncount0)
 //--------------------------------------------------------------------------------
 // trace
 //--------------------------------------------------------------------------------

 

 val trace_tclk = rvclkhdr(clock, (io.i0_valid_wb | io.exc_or_int_valid_r_d1 | io.interrupt_valid_r_d1 | io.dec_tlu_i0_valid_wb1 |
   io.dec_tlu_i0_exc_valid_wb1 | io.dec_tlu_int_valid_wb1 | io.clk_override).asBool, io.scan_mode)

 io.dec_tlu_i0_valid_wb1     := withClock(trace_tclk){RegNext(io.i0_valid_wb,0.U)}
 io.dec_tlu_i0_exc_valid_wb1 := withClock(trace_tclk){RegNext((io.i0_exception_valid_r_d1 | io.lsu_i0_exc_r_d1 | (io.trigger_hit_r_d1 & ~io.trigger_hit_dmode_r_d1)),0.U)}
 io.dec_tlu_exc_cause_wb1    := withClock(trace_tclk){RegNext(io.exc_cause_wb,0.U)}
 io.dec_tlu_int_valid_wb1    := withClock(trace_tclk){RegNext(io.interrupt_valid_r_d1,0.U)}

 io.dec_tlu_mtval_wb1  := mtval

 // end trace
 //--------------------------------------------------------------------------------
 // CSR read mux
 io.dec_csr_rddata_d:=Mux1H(Seq(
 				        io.csr_pkt.csr_misa.asBool            -> 0x40001104.U(32.W),
                io.csr_pkt.csr_mvendorid.asBool       -> 0x00000045.U(32.W),
                io.csr_pkt.csr_marchid.asBool         -> 0x00000010.U(32.W),
                io.csr_pkt.csr_mimpid.asBool          -> 0x1.U(32.W),
                io.csr_pkt.csr_mhartid.asBool         -> Cat(io.core_id,0.U(4.W)),
                io.csr_pkt.csr_mstatus.asBool         -> Cat(0.U(19.W), 3.U(2.W), 0.U(3.W), io.mstatus(1), 0.U(3.W), io.mstatus(0), 0.U(3.W)),
                io.csr_pkt.csr_mtvec.asBool           -> Cat(io.mtvec(30,1), 0.U(1.W), io.mtvec(0)),
                io.csr_pkt.csr_mip.asBool             -> Cat(0.U(1.W), io.mip(5,3), 0.U(16.W), io.mip(2), 0.U(3.W), io.mip(1), 0.U(3.W), io.mip(0), 0.U(3.W)),
                io.csr_pkt.csr_mie.asBool             -> Cat(0.U(1.W), mie(5,3), 0.U(16.W), mie(2), 0.U(3.W), mie(1), 0.U(3.W), mie(0), 0.U(3.W)),
                io.csr_pkt.csr_mcyclel.asBool         -> mcyclel(31,0),
                io.csr_pkt.csr_mcycleh.asBool         -> mcycleh_inc(31,0),
                io.csr_pkt.csr_minstretl.asBool       -> minstretl_read(31,0),
                io.csr_pkt.csr_minstreth.asBool       -> minstreth_read(31,0),
                io.csr_pkt.csr_mscratch.asBool        -> mscratch(31,0),
                io.csr_pkt.csr_mepc.asBool            -> Cat(io.mepc,0.U(1.W)),
                io.csr_pkt.csr_mcause.asBool          -> mcause(31,0),
                io.csr_pkt.csr_mscause.asBool         -> Cat(0.U(28.W), mscause(3,0)),
                io.csr_pkt.csr_mtval.asBool           -> mtval(31,0),
                io.csr_pkt.csr_mrac.asBool            -> mrac(31,0),
                io.csr_pkt.csr_mdseac.asBool          -> mdseac(31,0),
                io.csr_pkt.csr_meivt.asBool           -> Cat(meivt, 0.U(10.W)),
                io.csr_pkt.csr_meihap.asBool          -> Cat(meivt, meihap, 0.U(2.W)),
                io.csr_pkt.csr_meicurpl.asBool        -> Cat(0.U(28.W), meicurpl(3,0)),
                io.csr_pkt.csr_meicidpl.asBool        -> Cat(0.U(28.W), meicidpl(3,0)),
                io.csr_pkt.csr_meipt.asBool           -> Cat(0.U(28.W), meipt(3,0)),
                io.csr_pkt.csr_mcgc.asBool            -> Cat(0.U(23.W), mcgc(8,0)),
                io.csr_pkt.csr_mfdc.asBool            -> Cat(0.U(13.W), mfdc(18,0)),
                io.csr_pkt.csr_dcsr.asBool            -> Cat(0x4000.U(16.W), io.dcsr(15,2), 3.U(2.W)),
                io.csr_pkt.csr_dpc.asBool             -> Cat(io.dpc, 0.U(1.W)),
                io.csr_pkt.csr_dicad0.asBool          -> dicad0(31,0),
                io.csr_pkt.csr_dicad0h.asBool         -> dicad0h(31,0),
                io.csr_pkt.csr_dicad1.asBool          -> dicad1(31,0),
                io.csr_pkt.csr_dicawics.asBool        -> Cat(0.U(7.W), dicawics(16), 0.U(2.W), dicawics(15,14), 0.U(3.W), dicawics(13,0), 0.U(3.W)),
                io.csr_pkt.csr_mtsel.asBool           -> Cat(0.U(30.W), mtsel(1,0)),
                io.csr_pkt.csr_mtdata1.asBool         -> mtdata1_tsel_out(31,0),
                io.csr_pkt.csr_mtdata2.asBool         -> mtdata2_tsel_out(31,0),
                io.csr_pkt.csr_micect.asBool          -> micect(31,0),
                io.csr_pkt.csr_miccmect.asBool        -> miccmect(31,0),
                io.csr_pkt.csr_mdccmect.asBool        -> mdccmect(31,0),
                io.csr_pkt.csr_mhpmc3.asBool          -> mhpmc3(31,0),
                io.csr_pkt.csr_mhpmc4.asBool          -> mhpmc4(31,0),
                io.csr_pkt.csr_mhpmc5.asBool          -> mhpmc5(31,0),
                io.csr_pkt.csr_mhpmc6.asBool          -> mhpmc6(31,0),
                io.csr_pkt.csr_mhpmc3h.asBool         -> mhpmc3h(31,0),
                io.csr_pkt.csr_mhpmc4h.asBool         -> mhpmc4h(31,0),
                io.csr_pkt.csr_mhpmc5h.asBool         -> mhpmc5h(31,0),
                io.csr_pkt.csr_mhpmc6h.asBool         -> mhpmc6h(31,0),
                io.csr_pkt.csr_mfdht.asBool           -> Cat(0.U(26.W), mfdht(5,0)),
                io.csr_pkt.csr_mfdhs.asBool           -> Cat(0.U(30.W), mfdhs(1,0)),
                io.csr_pkt.csr_mhpme3.asBool          -> Cat(0.U(22.W), mhpme3(9,0)),
                io.csr_pkt.csr_mhpme4.asBool          -> Cat(0.U(22.W), mhpme4(9,0)),
                io.csr_pkt.csr_mhpme5.asBool          -> Cat(0.U(22.W),mhpme5(9,0)),
                io.csr_pkt.csr_mhpme6.asBool          -> Cat(0.U(22.W),mhpme6(9,0)),
                io.csr_pkt.csr_mcountinhibit.asBool   -> Cat(0.U(25.W), mcountinhibit(6,0)),
                io.csr_pkt.csr_mpmc.asBool            -> Cat(0.U(30.W), mpmc, 0.U(1.W)),
                io.dec_timer_read_d.asBool         -> io.dec_timer_rddata_d(31,0) 
 				))  
   


}


class dec_decode_csr_read_IO extends Bundle{
	val dec_csr_rdaddr_d=Input(UInt(12.W))
	val csr_pkt=Output(new dec_tlu_csr_pkt)
}

class dec_decode_csr_read extends Module with RequireAsyncReset{
	val io=IO(new dec_decode_csr_read_IO)

	def pattern(y : List[Int]) = (0 until y.size).map(i=> if(y(i)>=0 & y(i)!='z') io.dec_csr_rdaddr_d(y(i)) else if(y(i)<0) !io.dec_csr_rdaddr_d(y(i).abs) else !io.dec_csr_rdaddr_d(0)).reduce(_&_)
 	// 'z' is used for !io.dec_csr_rdaddr_d(0)
	io.csr_pkt.csr_misa 				:=pattern(List(-11,-6,-5,-2,0))
	io.csr_pkt.csr_mvendorid			:=pattern(List(10,-7,-1,0))
	io.csr_pkt.csr_marchid				:=pattern(List(10,-7,1,'z'))
	io.csr_pkt.csr_mimpid 				:=pattern(List(10,-6,1,0))
	io.csr_pkt.csr_mhartid				:=pattern(List(10,-7,2))
	io.csr_pkt.csr_mstatus				:=pattern(List(-11,-6,-5,-2,'z'))
	io.csr_pkt.csr_mtvec 				:=pattern(List(-11,-6,-5,2,0))
	io.csr_pkt.csr_mip 					:=pattern(List(-7,6,2))
	io.csr_pkt.csr_mie 					:=pattern(List(-11,-6,-5,2,'z'))
	io.csr_pkt.csr_mcyclel 				:=pattern(List(11,-7,-4,-3,-2,-1))
	io.csr_pkt.csr_mcycleh 				:=pattern(List(7,-6,-5,-4,-3,-2,-1))
	io.csr_pkt.csr_minstretl 			:=pattern(List(-7,-6,-4,-3,-2,1,'z'))
	io.csr_pkt.csr_minstreth 			:=pattern(List(-10,7,-4,-3,-2,1,'z'))
	io.csr_pkt.csr_mscratch 			:=pattern(List(-7,6,-2,-1,'z'))
	io.csr_pkt.csr_mepc 				:=pattern(List(-7,6,-1,0))
	io.csr_pkt.csr_mcause 				:=pattern(List(-7,6,1,'z'))
	io.csr_pkt.csr_mscause 				:=pattern(List(6,5,2))
	io.csr_pkt.csr_mtval				:=pattern(List(-7,6,1,0))
	io.csr_pkt.csr_mrac 				:=pattern(List(-11,7,-5,-3,-2,-1))
	io.csr_pkt.csr_dmst 				:=pattern(List(10,-4,-3,2,-1))
	io.csr_pkt.csr_mdseac 				:=pattern(List(11,10,-4,-3))
	io.csr_pkt.csr_meihap 				:=pattern(List(11,10,3))
	io.csr_pkt.csr_meivt 				:=pattern(List(-10,6,3,-2,-1,'z'))
	io.csr_pkt.csr_meipt 				:=pattern(List(11,6,-1,0))
	io.csr_pkt.csr_meicurpl 			:=pattern(List(11,6,2))
	io.csr_pkt.csr_meicidpl 			:=pattern(List(11,6,1,0))
	io.csr_pkt.csr_dcsr 				:=pattern(List(10,-6,5,4,'z'))
	io.csr_pkt.csr_mcgc 				:=pattern(List(10,4,3,'z'))
	io.csr_pkt.csr_mfdc 				:=pattern(List(10,4,3,-1,0))
	io.csr_pkt.csr_dpc 					:=pattern(List(10,-6,5,4,0))
	io.csr_pkt.csr_mtsel 				:=pattern(List(10,5,-4,-1,'z'))
	io.csr_pkt.csr_mtdata1 				:=pattern(List(10,-4,-3,0))
	io.csr_pkt.csr_mtdata2 				:=pattern(List(10,5,-4,1))
	io.csr_pkt.csr_mhpmc3 				:=pattern(List(11,-7,-4,-3,-2,0))
	io.csr_pkt.csr_mhpmc4 				:=pattern(List(11,-7,-4,-3,2,-1,'z'))
	io.csr_pkt.csr_mhpmc5 				:=pattern(List(11,-7,-4,-3,-1,0))
	io.csr_pkt.csr_mhpmc6 				:=pattern(List(-7,-5,-4,-3,2,1,'z'))
	io.csr_pkt.csr_mhpmc3h 				:=pattern(List(7,-4,-3,-2,1,0))
	io.csr_pkt.csr_mhpmc4h 				:=pattern(List(7,-6,-4,-3,2,-1,'z'))
	io.csr_pkt.csr_mhpmc5h 				:=pattern(List(7,-4,-3,2,-1,0))
	io.csr_pkt.csr_mhpmc6h 				:=pattern(List(7,-6,-4,-3,2,1,'z'))
	io.csr_pkt.csr_mhpme3 				:=pattern(List(-7,5,-4,-3,-2,0))
	io.csr_pkt.csr_mhpme4 				:=pattern(List(5,-4,-3,2,-1,'z'))
	io.csr_pkt.csr_mhpme5 				:=pattern(List(5,-4,-3,2,-1,0))
	io.csr_pkt.csr_mhpme6 				:=pattern(List(5,-4,-3,2,1,'z'))
	io.csr_pkt.csr_mcountinhibit 		:=pattern(List(-7,5,-4,-3,-2,'z'))
	io.csr_pkt.csr_mitctl0 				:=pattern(List(6,-5,4,-1,'z'))
	io.csr_pkt.csr_mitctl1 				:=pattern(List(6,-3,2,1,0))
	io.csr_pkt.csr_mitb0 				:=pattern(List(6,-5,4,-2,0))
	io.csr_pkt.csr_mitb1 				:=pattern(List(6,4,2,1,'z'))
	io.csr_pkt.csr_mitcnt0 				:=pattern(List(6,-5,4,-2,'z'))
	io.csr_pkt.csr_mitcnt1 				:=pattern(List(6,2,-1,0))
	io.csr_pkt.csr_mpmc 				:=pattern(List(6,-4,-3,2,1))
	io.csr_pkt.csr_mcpc 				:=pattern(List(10,6,-4,-3,-2,1))
	io.csr_pkt.csr_meicpct 				:=pattern(List(11,6,1,'z'))
	io.csr_pkt.csr_mdeau 				:=pattern(List(-10,7,6,-3))
	io.csr_pkt.csr_micect 				:=pattern(List(6,5,-3,-1,'z'))
	io.csr_pkt.csr_miccmect 			:=pattern(List(6,5,-3,0))
	io.csr_pkt.csr_mdccmect 			:=pattern(List(6,5,1,'z'))
	io.csr_pkt.csr_mfdht 				:=pattern(List(6,3,2,1,'z'))
	io.csr_pkt.csr_mfdhs 				:=pattern(List(6,-4,2,0))
	io.csr_pkt.csr_dicawics 			:=pattern(List(-11,-5,3,-2,-1,'z'))
	io.csr_pkt.csr_dicad0h 				:=pattern(List(10,3,2,-1))
	io.csr_pkt.csr_dicad0 				:=pattern(List(10,-4,3,-1,0))
	io.csr_pkt.csr_dicad1 				:=pattern(List(10,3,-2,1,'z'))
	io.csr_pkt.csr_dicago 				:=pattern(List(10,3,-2,1,0))
	io.csr_pkt.presync	 := 	pattern(List(10,4,3,-1,0)) 		| pattern(List(-7,5,-4,-3,-2,'z')) 	| pattern(List(-6,-5,-4,-3,-2,1)) |
								pattern(List(11,-4,-3,2,-1)) 	| pattern(List(11,-4,-3,1,'z')) 	| pattern(List(7,-5,-4,-3,-2,1))
	io.csr_pkt.postsync  := 	pattern(List(10,4,3,-1,0)) 		| pattern(List(-11,-6,-5,2,0)) 		| pattern(List(-7,6,-1,0)) 		 |
 								pattern(List(10,-4,-3,0)) 		| pattern(List(-11,-7,-6,-4,-3,-2,'z'))	| pattern(List(-11,7,6,-4,-3,-1))|
 								pattern(List(10,-4,-3,-2,1))
	io.csr_pkt.legal := pattern(List(-11,10,9,8,7,6,4,-3,-2,1,'z')) 	| pattern(List(-11,-10,9,8,-7,-6,-5,-4,-3,-1)) 	|
 						pattern(List(-11,-10,9,8,-7,-6,5,-1,'z')) 		| pattern(List(11,9,8,7,6,-5,-4,-2,-1,'z')) 	|
 						pattern(List(11,-10,9,8,-6,-5,'z')) 			| pattern(List(-11,10,9,8,7,6,5,4,3,2,1,0)) 	|
 						pattern(List(-11,10,9,8,7,6,5,4,-2,-1)) 		| pattern(List(11,9,8,-7,-6,-5,4,-3,-2,0)) 		|
 						pattern(List(-11,10,9,8,7,-6,5,-3,-2,-1)) 		| pattern(List(-11,-10,9,8,-7,-6,5,2)) 			| 
 						pattern(List(11,9,8,-7,-6,-5,4,-3,2,-1,'z')) 	| pattern(List(-11,10,9,8,7,6,-5,-4,3,1)) 		|
						pattern(List(-11,10,9,8,7,6,-5,4,-3,2)) 		| pattern(List(11,9,8,-7,-6,-5,4,-3,-2,1)) 		|
						pattern(List(-11,-10,9,8,-7,-6,5,1,0)) 			| pattern(List(11,-10,9,8,7,-5,-4,3,-2)) 		|
						pattern(List(11,-10,9,8,7,-5,-4,3,-1,'z')) 		| pattern(List(11,-10,9,8,-6,-5,2)) 			| 
						pattern(List(-11,10,9,8,7,6,-5 ,4,-3,1)) 		| pattern(List(-11,10,9,8,7,6 ,-5,-4,'z')) 		|
 						pattern(List(-11,10,9,8,7,6 ,-5,-4,3,-2)) 		| pattern(List(-11,10,9,8,7,-6,5,-4,-3,-2,'z')) | 
 						pattern(List(11,-10,9,8,-6,-5,1)) 				| pattern(List(-11,-10,9,8,-7,6,-5,-4,-3,-2)) 	|
 						pattern(List(-11,-10,9,8,-7,-5,-4,-3,-1,'z'))	| pattern(List(-11,-10,9,8,-7,-6,5,3)) 			| 
 						pattern(List(11,-10,9,8,-6,-5,3)) 				| pattern(List(-11,-10,9,8,-7,-6,5,4)) 			| 
 						pattern(List(11,-10,9,8,-6,-5,4))
}


class dec_timer_ctl extends Module with lib with RequireAsyncReset{
	val io=IO(new dec_timer_ctl_IO)
	val MITCTL_ENABLE=0
	val MITCTL_ENABLE_HALTED=1
	val MITCTL_ENABLE_PAUSED=2
 
 	val mitctl1=WireInit(UInt(4.W),0.U)
 	val mitctl0=WireInit(UInt(3.W),0.U)
 	val mitb1  =WireInit(UInt(32.W),0.U)
 	val mitb0  =WireInit(UInt(32.W),0.U)
 	val mitcnt1=WireInit(UInt(32.W),0.U)
 	val mitcnt0=WireInit(UInt(32.W),0.U)
 
 	val mit0_match_ns=(mitcnt0 >= mitb0).asUInt
 	val mit1_match_ns=(mitcnt1 >= mitb1).asUInt

	io.dec_timer_t0_pulse := mit0_match_ns
   	io.dec_timer_t1_pulse := mit1_match_ns
   // ----------------------------------------------------------------------
   // MITCNT0 (RW)
   // [31:0] : Internal Timer Counter 0

	val MITCNT0 =0x7d2.U(12.W)

	val wr_mitcnt0_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r === MITCNT0)

	val mitcnt0_inc_ok = mitctl0(MITCTL_ENABLE) & (~io.dec_pause_state | mitctl0(MITCTL_ENABLE_PAUSED)) & (~io.dec_tlu_pmu_fw_halted | mitctl0(MITCTL_ENABLE_HALTED)) & ~io.internal_dbg_halt_timers
   	val mitcnt0_inc = mitcnt0 + 1.U(32.W)
	val mitcnt0_ns  =Mux(mit0_match_ns.asBool, 0.U, Mux(wr_mitcnt0_r.asBool, io.dec_csr_wrdata_r, mitcnt0_inc))
	mitcnt0		:=rvdffe(mitcnt0_ns,(wr_mitcnt0_r | mitcnt0_inc_ok | mit0_match_ns).asBool,clock,io.scan_mode)

   // ----------------------------------------------------------------------
   // MITCNT1 (RW)
   // [31:0] : Internal Timer Counter 0

	val MITCNT1=0x7d5.U(12.W)
   	val wr_mitcnt1_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r === MITCNT1).asUInt

   	val mitcnt1_inc_ok = mitctl1(MITCTL_ENABLE) & (~io.dec_pause_state | mitctl1(MITCTL_ENABLE_PAUSED)) & (~io.dec_tlu_pmu_fw_halted | mitctl1(MITCTL_ENABLE_HALTED)) & ~io.internal_dbg_halt_timers

   // only inc MITCNT1 if not cascaded with 0, or if 0 overflows
   	val mitcnt1_inc = mitcnt1 + Cat(Fill(31,0.U(1.W)),(~mitctl1(3) | mit0_match_ns))
   	val mitcnt1_ns  = Mux(mit1_match_ns.asBool, 0.U, Mux(wr_mitcnt1_r.asBool, io.dec_csr_wrdata_r,mitcnt1_inc))
	 mitcnt1	:= rvdffe(mitcnt1_ns,(wr_mitcnt1_r | mitcnt1_inc_ok | mit1_match_ns).asBool,clock,io.scan_mode)

   // ----------------------------------------------------------------------
   // MITB0 (RW)
   // [31:0] : Internal Timer Bound 0
	val  MITB0 =0x7d3.U(12.W)

	val wr_mitb0_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r === MITB0)
	val mitb0_b	   = rvdffe((~io.dec_csr_wrdata_r),wr_mitb0_r.asBool,clock,io.scan_mode)
	mitb0	  := ~mitb0_b

   // ----------------------------------------------------------------------
   // MITB1 (RW)
   // [31:0] : Internal Timer Bound 1

  	val MITB1 =0x7d6.U(12.W)
	val wr_mitb1_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r=== MITB1)
	val mitb1_b=rvdffe((~io.dec_csr_wrdata_r),wr_mitb1_r.asBool,clock,io.scan_mode)
	mitb1 := ~mitb1_b

   // ----------------------------------------------------------------------
   // MITCTL0 (RW) Internal Timer Ctl 0
   // [31:3] : Reserved, reads 0x0
   // [2]    : Enable while PAUSEd
   // [1]    : Enable while HALTed
   // [0]    : Enable (resets to 0x1)

	val MITCTL0 =0x7d4.U(12.W)

	val wr_mitctl0_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r === MITCTL0)
	val mitctl0_ns	 = Mux(wr_mitctl0_r.asBool, io.dec_csr_wrdata_r(2,0), mitctl0(2,0))

	val mitctl0_0_b_ns = ~mitctl0_ns(0)
	val mitctl0_0_b    = withClock(io.free_clk){RegNext(mitctl0_0_b_ns,0.U)}
	mitctl0	 	      :=Cat(withClock(io.free_clk){RegNext(mitctl0_ns(2,1),0.U)},~mitctl0_0_b)

   // ----------------------------------------------------------------------
   // MITCTL1 (RW) Internal Timer Ctl 1
   // [31:4] : Reserved, reads 0x0
   // [3]    : Cascade
   // [2]    : Enable while PAUSEd
   // [1]    : Enable while HALTed
   // [0]    : Enable (resets to 0x1)
	val MITCTL1 =0x7d7.U(12.W)
	val wr_mitctl1_r = io.dec_csr_wen_r_mod & (io.dec_csr_wraddr_r=== MITCTL1)
   	val mitctl1_ns	 = Mux(wr_mitctl1_r.asBool,io.dec_csr_wrdata_r(3,0), mitctl1(3,0))
	val mitctl1_0_b_ns= ~mitctl1_ns(0)
	val mitctl1_0_b=withClock(io.free_clk){RegNext(mitctl1_0_b_ns,0.U)}
	mitctl1:=Cat(withClock(io.free_clk){RegNext(mitctl1_ns(3,1),0.U)},~mitctl1_0_b)

   	io.dec_timer_read_d 	:= io.csr_mitcnt1 | io.csr_mitcnt0 | io.csr_mitb1 | io.csr_mitb0 | io.csr_mitctl0 | io.csr_mitctl1
   	io.dec_timer_rddata_d 	:=Mux1H(Seq(
         io.csr_mitcnt0.asBool   -> mitcnt0(31,0),
   		io.csr_mitcnt1.asBool 	-> mitcnt1,
   		io.csr_mitb0.asBool		-> mitb0,
   		io.csr_mitb1.asBool		-> mitb1,
   		io.csr_mitctl0.asBool 	-> Cat(Fill(29,0.U(1.W)),mitctl0),
   		io.csr_mitctl1.asBool 	-> Cat(Fill(28,0.U(1.W)),mitctl1)  	
   	))
}


class dec_timer_ctl_IO extends Bundle{
	val free_clk				=Input(Clock())
   	val scan_mode				=Input(Bool())
	val dec_csr_wen_r_mod		=Input(UInt(1.W))     // csr write enable at wb
	val dec_csr_rdaddr_d		=Input(UInt(12.W))    // read address for csr
	val dec_csr_wraddr_r		=Input(UInt(12.W))    // write address for csr
	val dec_csr_wrdata_r		=Input(UInt(32.W))    // csr write data at wb

	val csr_mitctl0				=Input(UInt(1.W))
	val csr_mitctl1				=Input(UInt(1.W))
	val csr_mitb0				=Input(UInt(1.W))
	val csr_mitb1				=Input(UInt(1.W))
	val csr_mitcnt0				=Input(UInt(1.W))
	val csr_mitcnt1				=Input(UInt(1.W))


	val dec_pause_state			=Input(UInt(1.W)) 	// Paused
	val dec_tlu_pmu_fw_halted	=Input(UInt(1.W))	// pmu/fw halted
	val internal_dbg_halt_timers=Input(UInt(1.W)) 	// debug halted

	val dec_timer_rddata_d		=Output(UInt(32.W)) // timer CSR read data
	val dec_timer_read_d		=Output(UInt(1.W)) 	// timer CSR address match
	val dec_timer_t0_pulse		=Output(UInt(1.W)) 	// timer0 int
	val dec_timer_t1_pulse		=Output(UInt(1.W)) 	// timer1 int
}
