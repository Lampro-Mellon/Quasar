package dec
import chisel3._
import chisel3.util._
import include._
import lib._

class el2_dec_IO extends Bundle with el2_lib {
  //val clk                   = Input(Clock())
  val free_clk              = Input(Clock())
  val active_clk            = Input(Clock())

  val lsu_fastint_stall_any = Input(Bool())           // needed by lsu for 2nd pass of dma with ecc correction, stall next cycle

  val dec_extint_stall      = Output(Bool())

  val dec_i0_decode_d       = Output(Bool())
  val dec_pause_state_cg    = Output(Bool())          // to top for active state clock gating

  // val rst_l                 = Input(Bool())           // reset, active low
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

  // external MPC halt/run interface
  val mpc_debug_halt_req    = Input(Bool())   // Async halt request
  val mpc_debug_run_req     = Input(Bool())   // Async run request
  val mpc_reset_run_req     = Input(Bool())   // Run/halt after reset
  val mpc_debug_halt_ack    = Output(Bool())  // Halt ack
  val mpc_debug_run_ack     = Output(Bool())  // Run ack
  val debug_brkpt_status    = Output(Bool())  // debug breakpoint

  val exu_pmu_i0_br_misp    = Input(Bool())   // slot 0 branch misp
  val exu_pmu_i0_br_ataken  = Input(Bool())   // slot 0 branch actual taken
  val exu_pmu_i0_pc4        = Input(Bool())   // slot 0 4 byte branch


  val lsu_nonblock_load_valid_m     =   Input(Bool())                         // valid nonblock load at m
  val lsu_nonblock_load_tag_m       =   Input(UInt(LSU_NUM_NBLOAD_WIDTH.W)) // -> corresponding tag
  val lsu_nonblock_load_inv_r       =   Input(Bool())                         // invalidate request for nonblock load r
  val lsu_nonblock_load_inv_tag_r   =   Input(UInt(LSU_NUM_NBLOAD_WIDTH.W)) // -> corresponding tag
  val lsu_nonblock_load_data_valid  =   Input(Bool())                         // valid nonblock load data back
  val lsu_nonblock_load_data_error  =   Input(Bool())                         // nonblock load bus error
  val lsu_nonblock_load_data_tag    =   Input(UInt(LSU_NUM_NBLOAD_WIDTH.W)) // -> corresponding tag
  val lsu_nonblock_load_data        =   Input(UInt(32.W))                     // nonblock load data

  val lsu_pmu_bus_trxn              =  Input(Bool())      // D side bus transaction
  val lsu_pmu_bus_misaligned        =  Input(Bool())      // D side bus misaligned
  val lsu_pmu_bus_error             =  Input(Bool())      // D side bus error
  val lsu_pmu_bus_busy              =  Input(Bool())      // D side bus busy
  val lsu_pmu_misaligned_m          =  Input(Bool())      // D side load or store misaligned
  val lsu_pmu_load_external_m       =  Input(Bool())      // D side bus load
  val lsu_pmu_store_external_m      =  Input(Bool())      // D side bus store
  val dma_pmu_dccm_read             =  Input(Bool())      // DMA DCCM read
  val dma_pmu_dccm_write            =  Input(Bool())      // DMA DCCM write
  val dma_pmu_any_read              =  Input(Bool())      // DMA read
  val dma_pmu_any_write             =  Input(Bool())      // DMA write

  val lsu_fir_addr    =   Input(UInt(31.W)) //[31:1] Fast int address
  val lsu_fir_error   =   Input(UInt(2.W))  //[1:0]  Fast int lookup error

  val ifu_pmu_instr_aligned   =  Input(Bool())         // aligned instructions
  val ifu_pmu_fetch_stall     =  Input(Bool())         // fetch unit stalled
  val ifu_pmu_ic_miss         =  Input(Bool())         // icache miss
  val ifu_pmu_ic_hit          =  Input(Bool())         // icache hit
  val ifu_pmu_bus_error       =  Input(Bool())         // Instruction side bus error
  val ifu_pmu_bus_busy        =  Input(Bool())         // Instruction side bus busy
  val ifu_pmu_bus_trxn        =  Input(Bool())         // Instruction side bus transaction

  val ifu_ic_error_start            =  Input(Bool())     // IC single bit error
  val ifu_iccm_rd_ecc_single_err    =  Input(Bool())     // ICCM single bit error

  val lsu_trigger_match_m     = Input(UInt(4.W))
  val dbg_cmd_valid           = Input(Bool())    // debugger abstract command valid
  val dbg_cmd_write           = Input(Bool())    // command is a write
  val dbg_cmd_type            = Input(UInt(2.W))    //  command type
  val dbg_cmd_addr            = Input(UInt(32.W))    // command address
  val dbg_cmd_wrdata          = Input(UInt(2.W))    // command write data, for fence/fence_i


  val ifu_i0_icaf             = Input(Bool())         // icache access fault
  val ifu_i0_icaf_type        = Input(UInt(2.W))

  val ifu_i0_icaf_f1          = Input(Bool())    // i0 has access fault on second fetch group
  val ifu_i0_dbecc            = Input(Bool())    // icache/iccm double-bit error

  val lsu_idle_any            = Input(Bool())     // lsu idle for halting

  val i0_brp                  = Flipped(Valid(new el2_br_pkt_t))         // branch packet
  val ifu_i0_bp_index         = Input(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W))      // BP index
  val ifu_i0_bp_fghr          = Input(UInt(BHT_GHR_SIZE.W))     // BP FGHR
  val ifu_i0_bp_btag          = Input(UInt(BTB_BTAG_SIZE.W))    // BP tag

  val lsu_error_pkt_r               = Flipped(Valid(new el2_lsu_error_pkt_t)) // LSU exception/error packet
  val lsu_single_ecc_error_incr     = Input(Bool())// LSU inc SB error counter

  val lsu_imprecise_error_load_any  = Input(Bool())  // LSU imprecise load bus error
  val lsu_imprecise_error_store_any = Input(Bool())  // LSU imprecise store bus error
  val lsu_imprecise_error_addr_any  = Input(UInt(32.W))                // LSU imprecise bus error address

  val exu_div_result                = Input(UInt(32.W))    // final div result
  val exu_div_wren                  = Input(UInt(1.W))    // Divide write enable to GPR
  val exu_csr_rs1_x                 = Input(UInt(32.W))     // rs1 for csr instruction
  val lsu_result_m                  = Input(UInt(32.W))     // load result
  val lsu_result_corr_r             = Input(UInt(32.W))     // load result - corrected load data

  val lsu_load_stall_any            = Input(Bool())            // This is for blocking loads
  val lsu_store_stall_any           = Input(Bool())            // This is for blocking stores
  val dma_dccm_stall_any            = Input(Bool())            // stall any load/store at decode, pmu event
  val dma_iccm_stall_any            = Input(Bool())            // iccm stalled, pmu event

  val iccm_dma_sb_error             = Input(Bool())            // ICCM DMA single bit error

  val exu_flush_final               = Input(Bool())             // slot0 flush

  val exu_npc_r                     = Input(UInt(31.W))            // next PC

  val exu_i0_result_x               = Input(UInt(32.W))     // alu result x


  val ifu_i0_valid             = Input(Bool())         // fetch valids to instruction buffer
  val ifu_i0_instr             = Input(UInt(32.W))     // fetch inst's to instruction buffer
  val ifu_i0_pc                = Input(UInt(31.W))     // pc's for instruction buffer
  val ifu_i0_pc4               = Input(Bool())         // indication of 4B or 2B for corresponding inst
  val exu_i0_pc_x              = Input(UInt(31.W))     // pc's for e1 from the alu's

  val mexintpend                = Input(Bool())        // External interrupt pending
  val timer_int                 = Input(Bool())        // Timer interrupt pending (from pin)
  val soft_int                  = Input(Bool())        // Software interrupt pending (from pin)

  val pic_claimid               = Input(UInt(8.W))      // PIC claimid
  val pic_pl                    = Input(UInt(4.W))      // PIC priv level
  val mhwakeup                  = Input(Bool())      // High priority wakeup

  val dec_tlu_meicurpl          = Output(UInt(4.W))     // to PIC, Current priv level
  val dec_tlu_meipt             = Output(UInt(4.W))     // to PIC

  val ifu_ic_debug_rd_data           = Input(UInt(71.W))          // diagnostic icache read data
  val ifu_ic_debug_rd_data_valid     = Input(Bool())          // diagnostic icache read data valid
  val dec_tlu_ic_diag_pkt            = Output(new el2_cache_debug_pkt_t)          // packet of DICAWICS, DICAD0/1, DICAGO info for icache diagnostics


  // Debug start
  val dbg_halt_req         = Input(Bool())        // DM requests a halt
  val dbg_resume_req       = Input(Bool())        // DM requests a resume
  val ifu_miss_state_idle  = Input(Bool())        // I-side miss buffer empty

  val dec_tlu_dbg_halted        = Output(Bool())       // Core is halted and ready for debug command
  val dec_tlu_debug_mode        = Output(Bool())       // Core is in debug mode
  val dec_tlu_resume_ack        = Output(Bool())       // Resume acknowledge
  val dec_tlu_flush_noredir_r   = Output(Bool())       // Tell fetch to idle on this flush
  val dec_tlu_mpc_halted_only   = Output(Bool())       // Core is halted only due to MPC
  val dec_tlu_flush_leak_one_r  = Output(Bool())       // single step
  val dec_tlu_flush_err_r       = Output(Bool())       // iside perr/ecc rfpc
  val dec_tlu_meihap            = Output(UInt(30.W))       // Fast ext int base

  val dec_debug_wdata_rs1_d     = Output(Bool())      // insert debug write data into rs1 at decode

  val dec_dbg_rddata            = Output(UInt(32.W))       // debug command read data

  val dec_dbg_cmd_done          = Output(Bool())      // abstract command is done
  val dec_dbg_cmd_fail          = Output(Bool())      // abstract command failed (illegal reg address)

  val trigger_pkt_any           = Output(Vec(4,new el2_trigger_pkt_t))  // info needed by debug trigger blocks

  val dec_tlu_force_halt        = Output(Bool())        // halt has been forced
  // Debug end
  // branch info from pipe0 for errors or counter updates
  val exu_i0_br_hist_r           = Input(UInt(2.W))          // history
  val exu_i0_br_error_r          = Input(Bool())          // error
  val exu_i0_br_start_error_r    = Input(Bool())          // start error
  val exu_i0_br_valid_r          = Input(Bool())          // valid
  val exu_i0_br_mp_r             = Input(Bool())          // mispredict
  val exu_i0_br_middle_r         = Input(Bool())          // middle of bank

  val exu_i0_br_way_r            = Input(Bool())           // way hit or repl

  val dec_i0_rs1_en_d            = Output(Bool()) // Qualify GPR RS1 data
  val dec_i0_rs2_en_d            = Output(Bool()) // Qualify GPR RS2 data
  val gpr_i0_rs1_d               = Output(UInt(32.W)) // gpr rs1 data
  val gpr_i0_rs2_d               = Output(UInt(32.W)) // gpr rs2 data

  val dec_i0_immed_d             = Output(UInt(32.W)) // immediate data
  val dec_i0_br_immed_d          = Output(UInt(12.W)) // br immediate data

  val i0_ap                      = Output(new el2_alu_pkt_t)// alu packet

  val dec_i0_alu_decode_d       = Output(Bool())   // schedule on D-stage alu

  val dec_i0_select_pc_d        = Output(Bool())   // select pc onto rs1 for jal's

  val dec_i0_pc_d               = Output(UInt(31.W)) // pc's at decode
  val dec_i0_rs1_bypass_en_d    = Output(UInt(2.W)) // rs1 bypass enable
  val dec_i0_rs2_bypass_en_d    = Output(UInt(2.W)) // rs2 bypass enable

  val dec_i0_rs1_bypass_data_d  = Output(UInt(32.W)) // rs1 bypass data
  val dec_i0_rs2_bypass_data_d  = Output(UInt(32.W)) // rs2 bypass data

  val lsu_p                     = Valid(new el2_lsu_pkt_t) // lsu packet
  val mul_p                     = Valid(new el2_mul_pkt_t) // mul packet
  val div_p                     = Valid(new el2_div_pkt_t) // div packet
  val dec_div_cancel            = Output(Bool()) // cancel divide operation

  val dec_lsu_offset_d          = Output(UInt(12.W)) // 12b offset for load/store addresses

  val dec_csr_ren_d             = Output(Bool()) // csr read enable


  val dec_tlu_flush_lower_r     = Output(Bool())   // tlu flush due to late mp, exception, rfpc, or int
  val dec_tlu_flush_path_r      = Output(UInt(31.W))   // tlu flush target
  val dec_tlu_i0_kill_writeb_r  = Output(Bool())   // I0 is flushed, don't writeback any results to arch state
  val dec_tlu_fence_i_r         = Output(Bool())   // flush is a fence_i rfnpc, flush icache

  val pred_correct_npc_x  = Output(UInt(31.W))       // npc if prediction is correct at e2 stage

  val dec_tlu_br0_r_pkt  = Valid(new el2_br_tlu_pkt_t)    // slot 0 branch predictor update packet

  val dec_tlu_perfcnt0   = Output(Bool())      // toggles when slot0 perf counter 0 has an event inc
  val dec_tlu_perfcnt1   = Output(Bool())      // toggles when slot0 perf counter 1 has an event inc
  val dec_tlu_perfcnt2   = Output(Bool())      // toggles when slot0 perf counter 2 has an event inc
  val dec_tlu_perfcnt3   = Output(Bool())      // toggles when slot0 perf counter 3 has an event inc

  val dec_i0_predict_p_d = Valid(new el2_predict_pkt_t)      // prediction packet to alus
  val i0_predict_fghr_d  = Output(UInt(BHT_GHR_SIZE.W))   // DEC predict fghr
  val i0_predict_index_d = Output(UInt((BHT_ADDR_HI-BHT_ADDR_LO+1).W))   // DEC predict index
  val i0_predict_btag_d  = Output(UInt(BTB_BTAG_SIZE.W))   // DEC predict branch tag

  val dec_lsu_valid_raw_d = Output(Bool())

  val dec_tlu_mrac_ff  = Output(UInt(32.W))          // CSR for memory region control

  val dec_data_en      = Output(UInt(2.W))             // clock-gate control logic
  val dec_ctl_en       = Output(UInt(2.W))

  val ifu_i0_cinst     = Input(UInt(16.W))             // 16b compressed instruction

  val rv_trace_pkt     = Output(new el2_trace_pkt_t)        // trace packet

  // feature disable from mfdc
  val dec_tlu_external_ldfwd_disable     = Output(Bool())       // disable external load forwarding
  val dec_tlu_sideeffect_posted_disable  = Output(Bool())       // disable posted stores to side-effect address
  val dec_tlu_core_ecc_disable           = Output(Bool())       // disable core ECC
  val dec_tlu_bpred_disable              = Output(Bool())       // disable branch prediction
  val dec_tlu_wb_coalescing_disable      = Output(Bool())       // disable writebuffer coalescing
  val dec_tlu_dma_qos_prty               = Output(UInt(3.W))       // DMA QoS priority coming from MFDC [18:16]

  // clock gating overrides from mcgc
  val dec_tlu_misc_clk_override   = Output(Bool())       // override misc clock domain gating
  val dec_tlu_ifu_clk_override    = Output(Bool())       // override fetch clock domain gating
  val dec_tlu_lsu_clk_override    = Output(Bool())       // override load/store clock domain gating
  val dec_tlu_bus_clk_override    = Output(Bool())       // override bus clock domain gating
  val dec_tlu_pic_clk_override    = Output(Bool())       // override PIC clock domain gating
  val dec_tlu_dccm_clk_override   = Output(Bool())       // override DCCM clock domain gating
  val dec_tlu_icm_clk_override    = Output(Bool())       // override ICCM clock domain gating

  val dec_tlu_i0_commit_cmt       = Output(Bool())          // committed i0 instruction
  val scan_mode                   = Input(Bool())

}

class el2_dec extends Module with param with RequireAsyncReset{
  val io = IO(new el2_dec_IO)

  val               dec_i0_inst_wb1 = WireInit(UInt(32.W),0.U)
  val               dec_i0_pc_wb1 = WireInit(UInt(32.W),0.U)
  val               dec_tlu_i0_valid_wb1   = WireInit(UInt(1.W),0.U)
  val               dec_tlu_int_valid_wb1  = WireInit(UInt(1.W),0.U)

  val               dec_tlu_exc_cause_wb1 = WireInit(UInt(5.W),0.U)
  val               dec_tlu_mtval_wb1 = WireInit(UInt(32.W),0.U)
  val               dec_tlu_i0_exc_valid_wb1 = WireInit(Bool(),0.B)


  //--------------------------------------------------------------------------//
  val instbuff = Module(new el2_dec_ib_ctl)
  val decode = Module(new el2_dec_decode_ctl)
  val gpr = Module(new el2_dec_gpr_ctl)
  val tlu = Module(new el2_dec_tlu_ctl)
  val dec_trigger = Module(new el2_dec_trigger)

  io.dec_i0_pc_d := instbuff.io.dec_i0_pc_d
  //instbuff.io <> io // error "Connection between left (el2_dec_ib_ctl_IO(IO io in el2_dec_ib_ctl)) and source (el2_dec_IO("
  //--------------------------------------------------------------------------//

  //connections for el2_dec_Ib
  //inputs
  instbuff.io.dbg_cmd_valid		    := io.dbg_cmd_valid
  instbuff.io.dbg_cmd_write		    := io.dbg_cmd_write
  instbuff.io.dbg_cmd_type		    :=  io.dbg_cmd_type
  instbuff.io.dbg_cmd_addr		    := io.dbg_cmd_addr
  instbuff.io.i0_brp				      := io.i0_brp
  instbuff.io.ifu_i0_bp_index     := io.ifu_i0_bp_index
  instbuff.io.ifu_i0_bp_fghr      := io.ifu_i0_bp_fghr
  instbuff.io.ifu_i0_bp_btag      := io.ifu_i0_bp_btag
  instbuff.io.ifu_i0_pc4          := io.ifu_i0_pc4
  instbuff.io.ifu_i0_valid        := io.ifu_i0_valid
  instbuff.io.ifu_i0_icaf         := io.ifu_i0_icaf
  instbuff.io.ifu_i0_icaf_type    := io.ifu_i0_icaf_type
  instbuff.io.ifu_i0_icaf_f1      := io.ifu_i0_icaf_f1
  instbuff.io.ifu_i0_dbecc        := io.ifu_i0_dbecc
  instbuff.io.ifu_i0_instr        := io.ifu_i0_instr
  instbuff.io.ifu_i0_pc           := io.ifu_i0_pc
  //outputs
  io.dec_debug_wdata_rs1_d           := instbuff.io.dec_debug_wdata_rs1_d
  //--------------------------------------------------------------------------//

  //connections for dec_trigger
  //dec_trigger.io <> io
  //inputs
  dec_trigger.io.dec_i0_pc_d := instbuff.io.dec_i0_pc_d
  dec_trigger.io.trigger_pkt_any := tlu.io.trigger_pkt_any
  //output
  val dec_i0_trigger_match_d = dec_trigger.io.dec_i0_trigger_match_d
  dontTouch(dec_i0_trigger_match_d)
  //--------------------------------------------------------------------------//

  //connections for el2_dec_decode
  // decode.io <> io
  //inputs
  decode.io.dec_tlu_flush_extint               :=  tlu.io.dec_tlu_flush_extint
  decode.io.dec_tlu_force_halt                 :=  tlu.io.dec_tlu_force_halt
  decode.io.ifu_i0_cinst                       :=  io.ifu_i0_cinst
  decode.io.lsu_nonblock_load_valid_m          :=  io.lsu_nonblock_load_valid_m
  decode.io.lsu_nonblock_load_tag_m            :=  io.lsu_nonblock_load_tag_m
  decode.io.lsu_nonblock_load_inv_r            :=  io.lsu_nonblock_load_inv_r
  decode.io.lsu_nonblock_load_inv_tag_r        :=  io.lsu_nonblock_load_inv_tag_r
  decode.io.lsu_nonblock_load_data_valid       :=  io.lsu_nonblock_load_data_valid
  decode.io.lsu_nonblock_load_data_error       :=  io.lsu_nonblock_load_data_error
  decode.io.lsu_nonblock_load_data_tag         :=  io.lsu_nonblock_load_data_tag
  decode.io.lsu_nonblock_load_data             :=  io.lsu_nonblock_load_data
  decode.io.dec_i0_trigger_match_d             :=  dec_i0_trigger_match_d
  decode.io.dec_tlu_wr_pause_r                 :=  tlu.io.dec_tlu_wr_pause_r
  decode.io.dec_tlu_pipelining_disable         :=  tlu.io.dec_tlu_pipelining_disable
  decode.io.lsu_trigger_match_m                :=  io.lsu_trigger_match_m
  decode.io.lsu_pmu_misaligned_m               :=  io.lsu_pmu_bus_misaligned
  decode.io.dec_tlu_debug_stall                :=  tlu.io.dec_tlu_debug_stall
  decode.io.dec_tlu_flush_leak_one_r           :=  tlu.io.dec_tlu_flush_leak_one_r
  decode.io.dec_debug_fence_d                  :=  instbuff.io.dec_debug_fence_d
  decode.io.dbg_cmd_wrdata                     :=  io.dbg_cmd_wrdata
  decode.io.dec_i0_icaf_d                      :=  instbuff.io.dec_i0_icaf_d
  decode.io.dec_i0_icaf_f1_d                   :=  instbuff.io.dec_i0_icaf_f1_d
  decode.io.dec_i0_icaf_type_d                 :=  instbuff.io.dec_i0_icaf_type_d
  decode.io.dec_i0_dbecc_d                     :=  instbuff.io.dec_i0_dbecc_d
  decode.io.dec_i0_brp                         :=  instbuff.io.dec_i0_brp
  decode.io.dec_i0_bp_index                    :=  instbuff.io.dec_i0_bp_index
  decode.io.dec_i0_bp_fghr                     :=  instbuff.io.dec_i0_bp_fghr
  decode.io.dec_i0_bp_btag                     :=  instbuff.io.dec_i0_bp_btag
  decode.io.dec_i0_pc_d                        :=  instbuff.io.dec_i0_pc_d
  decode.io.lsu_idle_any                       :=  io.lsu_idle_any
  decode.io.lsu_load_stall_any                 :=  io.lsu_load_stall_any
  decode.io.lsu_store_stall_any                :=  io.lsu_store_stall_any
  decode.io.dma_dccm_stall_any                 :=  io.dma_dccm_stall_any
  decode.io.exu_div_wren                       :=  io.exu_div_wren
  decode.io.dec_tlu_i0_kill_writeb_wb          :=  tlu.io.dec_tlu_i0_kill_writeb_wb
  decode.io.dec_tlu_flush_lower_wb             :=  tlu.io.dec_tlu_flush_lower_wb
  decode.io.dec_tlu_i0_kill_writeb_r           :=  tlu.io.dec_tlu_i0_kill_writeb_r
  decode.io.dec_tlu_flush_lower_r              :=  tlu.io.dec_tlu_flush_lower_r
  decode.io.dec_tlu_flush_pause_r              :=  tlu.io.dec_tlu_flush_pause_r
  decode.io.dec_tlu_presync_d                  :=  tlu.io.dec_tlu_presync_d
  decode.io.dec_tlu_postsync_d                 :=  tlu.io.dec_tlu_postsync_d
  decode.io.dec_i0_pc4_d                       :=  instbuff.io.dec_i0_pc4_d
  decode.io.dec_csr_rddata_d                   :=  tlu.io.dec_csr_rddata_d
  decode.io.dec_csr_legal_d                    :=  tlu.io.dec_csr_legal_d
  decode.io.exu_csr_rs1_x                      :=  io.exu_csr_rs1_x
  decode.io.lsu_result_m                       :=  io.lsu_result_m
  decode.io.lsu_result_corr_r                  :=  io.lsu_result_corr_r
  decode.io.exu_flush_final                    :=  io.exu_flush_final
  decode.io.exu_i0_pc_x                        :=  io.exu_i0_pc_x
  decode.io.dec_i0_instr_d                     :=  instbuff.io.dec_i0_instr_d
  decode.io.dec_ib0_valid_d                    :=  instbuff.io.dec_ib0_valid_d
  decode.io.exu_i0_result_x                    :=  io.exu_i0_result_x
  //decode.io.clk                                :=  io.clk
  decode.io.free_clk                           :=  io.free_clk
  decode.io.active_clk                         :=  io.active_clk
  decode.io.clk_override                       :=  tlu.io.dec_tlu_dec_clk_override
  // decode.io.rst_l                              :=  io.rst_l
  decode.io.scan_mode                          :=  io.scan_mode
  //outputs
  io.dec_extint_stall                  :=   decode.io.dec_extint_stall
  dec_i0_inst_wb1                      :=   decode.io.dec_i0_inst_wb1   //for tracer
  dec_i0_pc_wb1                        :=   decode.io.dec_i0_pc_wb1     //for tracer
  io.dec_i0_rs1_en_d                   :=   decode.io.dec_i0_rs1_en_d
  io.dec_i0_rs2_en_d                   :=   decode.io.dec_i0_rs2_en_d
  io.dec_i0_immed_d                    :=   decode.io.dec_i0_immed_d
  io.dec_i0_br_immed_d                 :=   decode.io.dec_i0_br_immed_d
  io.i0_ap                             :=   decode.io.i0_ap
  io.dec_i0_decode_d                   :=   decode.io.dec_i0_decode_d
  io.dec_i0_alu_decode_d               :=   decode.io.dec_i0_alu_decode_d
  io.dec_i0_rs1_bypass_data_d          :=   decode.io.dec_i0_rs1_bypass_data_d
  io.dec_i0_rs2_bypass_data_d          :=   decode.io.dec_i0_rs2_bypass_data_d
  io.dec_i0_select_pc_d                :=   decode.io.dec_i0_select_pc_d
  io.dec_i0_rs1_bypass_en_d            :=   decode.io.dec_i0_rs1_bypass_en_d
  io.dec_i0_rs2_bypass_en_d            :=   decode.io.dec_i0_rs2_bypass_en_d
  io.lsu_p                             :=   decode.io.lsu_p
  io.mul_p                             :=   decode.io.mul_p
  io.div_p                             :=   decode.io.div_p
  io.dec_div_cancel                    :=   decode.io.dec_div_cancel
  io.dec_lsu_valid_raw_d               :=   decode.io.dec_lsu_valid_raw_d
  io.dec_lsu_offset_d                  :=   decode.io.dec_lsu_offset_d
  io.dec_csr_ren_d                     :=   decode.io.dec_csr_ren_d
  io.pred_correct_npc_x                :=   decode.io.pred_correct_npc_x
  io.dec_i0_predict_p_d                :=   decode.io.dec_i0_predict_p_d
  io.i0_predict_fghr_d                 :=   decode.io.i0_predict_fghr_d
  io.i0_predict_index_d                :=   decode.io.i0_predict_index_d
  io.i0_predict_btag_d                 :=   decode.io.i0_predict_btag_d
  io.dec_data_en                       :=   decode.io.dec_data_en
  io.dec_ctl_en                        :=   decode.io.dec_ctl_en
  io.dec_pause_state_cg                :=   decode.io.dec_pause_state_cg
  //--------------------------------------------------------------------------//


  //connections for gprfile
  //  gpr.io <> io
  //inputs
  gpr.io.raddr0       := decode.io.dec_i0_rs1_d
  gpr.io.raddr1       := decode.io.dec_i0_rs2_d
  gpr.io.wen0         := decode.io.dec_i0_wen_r
  gpr.io.waddr0       := decode.io.dec_i0_waddr_r
  gpr.io.wd0          := decode.io.dec_i0_wdata_r
  gpr.io.wen1         := decode.io.dec_nonblock_load_wen
  gpr.io.waddr1       := decode.io.dec_nonblock_load_waddr
  gpr.io.wd1          := io.lsu_nonblock_load_data
  gpr.io.wen2         := io.exu_div_wren
  gpr.io.waddr2       := decode.io.div_waddr_wb
  gpr.io.wd2          := io.exu_div_result
  //gpr.io.clk          := io.clk
  //gpr.io.rst_l        := io.rst_l
  gpr.io.scan_mode    := io.scan_mode
  // outputs
  io.gpr_i0_rs1_d := gpr.io.rd0
  io.gpr_i0_rs2_d := gpr.io.rd1
  //--------------------------------------------------------------------------//



  //connection for dec_tlu
  // tlu.io <> io
  //inputs
  //tlu.io.clk                                :=  io.clk
  tlu.io.active_clk                         :=  io.active_clk
  tlu.io.free_clk                           :=  io.free_clk
  // tlu.io.rst_l                              :=  io.rst_l
  tlu.io.scan_mode                          :=  io.scan_mode
  tlu.io.rst_vec                            :=  io.rst_vec
  tlu.io.nmi_int                            :=  io.nmi_int
  tlu.io.nmi_vec                            :=  io.nmi_vec
  tlu.io.i_cpu_halt_req                     :=  io.i_cpu_halt_req
  tlu.io.i_cpu_run_req                      :=  io.i_cpu_run_req
  tlu.io.lsu_fastint_stall_any              :=  io.lsu_fastint_stall_any
  tlu.io.ifu_pmu_instr_aligned              :=  io.ifu_pmu_instr_aligned
  tlu.io.ifu_pmu_fetch_stall                :=  io.ifu_pmu_fetch_stall
  tlu.io.ifu_pmu_ic_miss                    :=  io.ifu_pmu_ic_miss
  tlu.io.ifu_pmu_ic_hit                     :=  io.ifu_pmu_ic_hit
  tlu.io.ifu_pmu_bus_error                  :=  io.ifu_pmu_bus_error
  tlu.io.ifu_pmu_bus_busy                   :=  io.ifu_pmu_bus_busy
  tlu.io.ifu_pmu_bus_trxn                   :=  io.ifu_pmu_bus_trxn
  tlu.io.dec_pmu_instr_decoded              :=  decode.io.dec_pmu_instr_decoded
  tlu.io.dec_pmu_decode_stall               :=  decode.io.dec_pmu_decode_stall
  tlu.io.dec_pmu_presync_stall              :=  decode.io.dec_pmu_presync_stall
  tlu.io.dec_pmu_postsync_stall             :=  decode.io.dec_pmu_postsync_stall
  tlu.io.lsu_store_stall_any                :=  io.lsu_store_stall_any
  tlu.io.dma_dccm_stall_any                 :=  io.dma_dccm_stall_any
  tlu.io.dma_iccm_stall_any                 :=  io.dma_iccm_stall_any
  tlu.io.exu_pmu_i0_br_misp                 :=  io.exu_pmu_i0_br_misp
  tlu.io.exu_pmu_i0_br_ataken               :=  io.exu_pmu_i0_br_ataken
  tlu.io.exu_pmu_i0_pc4                     :=  io.exu_pmu_i0_pc4
  tlu.io.lsu_pmu_bus_trxn                   :=  io.lsu_pmu_bus_trxn
  tlu.io.lsu_pmu_bus_misaligned             :=  io.lsu_pmu_bus_misaligned
  tlu.io.lsu_pmu_bus_error                  :=  io.lsu_pmu_bus_error
  tlu.io.lsu_pmu_bus_busy                   :=  io.lsu_pmu_bus_busy
  tlu.io.lsu_pmu_load_external_m            :=  io.lsu_pmu_load_external_m
  tlu.io.lsu_pmu_store_external_m           :=  io.lsu_pmu_store_external_m
  tlu.io.dma_pmu_dccm_read                  :=  io.dma_pmu_dccm_read
  tlu.io.dma_pmu_dccm_write                 :=  io.dma_pmu_dccm_write
  tlu.io.dma_pmu_any_read                   :=  io.dma_pmu_any_read
  tlu.io.dma_pmu_any_write                  :=  io.dma_pmu_any_write
  tlu.io.lsu_fir_addr                       :=  io.lsu_fir_addr
  tlu.io.lsu_fir_error                      :=  io.lsu_fir_error
  tlu.io.iccm_dma_sb_error                  :=  io.iccm_dma_sb_error
  tlu.io.lsu_error_pkt_r                    :=  io.lsu_error_pkt_r
  tlu.io.lsu_single_ecc_error_incr          :=  io.lsu_single_ecc_error_incr
  tlu.io.dec_pause_state                    :=  decode.io.dec_pause_state
  tlu.io.lsu_imprecise_error_store_any      :=  io.lsu_imprecise_error_store_any
  tlu.io.lsu_imprecise_error_load_any       :=  io.lsu_imprecise_error_load_any
  tlu.io.lsu_imprecise_error_addr_any       :=  io.lsu_imprecise_error_addr_any
  tlu.io.dec_csr_wen_unq_d                  :=  decode.io.dec_csr_wen_unq_d
  tlu.io.dec_csr_any_unq_d                  :=  decode.io.dec_csr_any_unq_d
  tlu.io.dec_csr_rdaddr_d                   :=  decode.io.dec_csr_rdaddr_d
  tlu.io.dec_csr_wen_r                      :=  decode.io.dec_csr_wen_r
  tlu.io.dec_csr_wraddr_r                   :=  decode.io.dec_csr_wraddr_r
  tlu.io.dec_csr_wrdata_r                   :=  decode.io.dec_csr_wrdata_r
  tlu.io.dec_csr_stall_int_ff               :=  decode.io.dec_csr_stall_int_ff
  tlu.io.dec_tlu_i0_valid_r                 :=  decode.io.dec_tlu_i0_valid_r
  tlu.io.exu_npc_r                          :=  io.exu_npc_r
  tlu.io.dec_tlu_i0_pc_r                    :=  decode.io.dec_tlu_i0_pc_r
  tlu.io.dec_tlu_packet_r                   :=  decode.io.dec_tlu_packet_r
  tlu.io.dec_illegal_inst                   :=  decode.io.dec_illegal_inst
  tlu.io.dec_i0_decode_d                    :=  decode.io.dec_i0_decode_d
  tlu.io.exu_i0_br_hist_r                   :=  io.exu_i0_br_hist_r
  tlu.io.exu_i0_br_error_r                  :=  io.exu_i0_br_error_r
  tlu.io.exu_i0_br_start_error_r            :=  io.exu_i0_br_start_error_r
  tlu.io.exu_i0_br_valid_r                  :=  io.exu_i0_br_valid_r
  tlu.io.exu_i0_br_mp_r                     :=  io.exu_i0_br_mp_r
  tlu.io.exu_i0_br_middle_r                 :=  io.exu_i0_br_middle_r
  tlu.io.exu_i0_br_way_r                    :=  io.exu_i0_br_way_r
  tlu.io.dbg_halt_req                       :=  io.dbg_halt_req
  tlu.io.dbg_resume_req                     :=  io.dbg_resume_req
  tlu.io.ifu_miss_state_idle                :=  io.ifu_miss_state_idle
  tlu.io.lsu_idle_any                       :=  io.lsu_idle_any
  tlu.io.dec_div_active                     :=  decode.io.dec_div_active
  tlu.io.ifu_ic_error_start                 :=  io.ifu_ic_error_start
  tlu.io.ifu_iccm_rd_ecc_single_err         :=  io.ifu_iccm_rd_ecc_single_err
  tlu.io.ifu_ic_debug_rd_data               :=  io.ifu_ic_debug_rd_data
  tlu.io.ifu_ic_debug_rd_data_valid         :=  io.ifu_ic_debug_rd_data_valid
  tlu.io.pic_claimid                        :=  io.pic_claimid
  tlu.io.pic_pl                             :=  io.pic_pl
  tlu.io.mhwakeup                           :=  io.mhwakeup
  tlu.io.mexintpend                         :=  io.mexintpend
  tlu.io.timer_int                          :=  io.timer_int
  tlu.io.soft_int                           :=  io.soft_int
  tlu.io.core_id                            :=  io.core_id
  tlu.io.mpc_debug_halt_req                 :=  io.mpc_debug_halt_req
  tlu.io.mpc_debug_run_req                  :=  io.mpc_debug_run_req
  tlu.io.mpc_reset_run_req                  :=  io.mpc_reset_run_req
  //outputs
  io.dec_dbg_cmd_done      := tlu.io.dec_dbg_cmd_done
  io.dec_dbg_cmd_fail      := tlu.io.dec_dbg_cmd_fail
  io.dec_tlu_dbg_halted    := tlu.io.dec_tlu_dbg_halted
  io.dec_tlu_debug_mode    := tlu.io.dec_tlu_debug_mode
  io.dec_tlu_resume_ack    := tlu.io.dec_tlu_resume_ack
  io.dec_tlu_flush_noredir_r     := tlu.io.dec_tlu_flush_noredir_r
  io.dec_tlu_mpc_halted_only     := tlu.io.dec_tlu_mpc_halted_only
  io.dec_tlu_flush_leak_one_r    := tlu.io.dec_tlu_flush_leak_one_r
  io.dec_tlu_flush_err_r         := tlu.io.dec_tlu_flush_err_r
  io.dec_tlu_meihap         := tlu.io.dec_tlu_meihap
  io.trigger_pkt_any        := tlu.io.trigger_pkt_any
  io.dec_tlu_ic_diag_pkt    := tlu.io.dec_tlu_ic_diag_pkt
  io.o_cpu_halt_status      := tlu.io.o_cpu_halt_status
  io.o_cpu_halt_ack         := tlu.io.o_cpu_halt_ack
  io.o_cpu_run_ack          := tlu.io.o_cpu_run_ack
  io.o_debug_mode_status    := tlu.io.o_debug_mode_status
  io.mpc_debug_halt_ack     := tlu.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack      := tlu.io.mpc_debug_run_ack
  io.debug_brkpt_status     := tlu.io.debug_brkpt_status
  io.dec_tlu_meicurpl       := tlu.io.dec_tlu_meicurpl
  io.dec_tlu_meipt          := tlu.io.dec_tlu_meipt
  io.dec_tlu_br0_r_pkt                   := tlu.io.dec_tlu_br0_r_pkt
  io.dec_tlu_i0_commit_cmt       := tlu.io.dec_tlu_i0_commit_cmt
  io.dec_tlu_i0_kill_writeb_r    := tlu.io.dec_tlu_i0_kill_writeb_r
  io.dec_tlu_flush_lower_r       := tlu.io.dec_tlu_flush_lower_r
  io.dec_tlu_flush_path_r        := tlu.io.dec_tlu_flush_path_r
  io.dec_tlu_fence_i_r           := tlu.io.dec_tlu_fence_i_r
  io.dec_tlu_mrac_ff        := tlu.io.dec_tlu_mrac_ff
  io.dec_tlu_force_halt     := tlu.io.dec_tlu_force_halt
  io.dec_tlu_perfcnt0       := tlu.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1       := tlu.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2       := tlu.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3       := tlu.io.dec_tlu_perfcnt3
  dec_tlu_i0_exc_valid_wb1     := tlu.io.dec_tlu_i0_exc_valid_wb1
  dec_tlu_i0_valid_wb1         := tlu.io.dec_tlu_i0_valid_wb1
  dec_tlu_int_valid_wb1        := tlu.io.dec_tlu_int_valid_wb1
  dec_tlu_exc_cause_wb1        := tlu.io.dec_tlu_exc_cause_wb1
  dec_tlu_mtval_wb1            := tlu.io.dec_tlu_mtval_wb1
  io.dec_tlu_external_ldfwd_disable       := tlu.io.dec_tlu_external_ldfwd_disable
  io.dec_tlu_sideeffect_posted_disable    := tlu.io.dec_tlu_sideeffect_posted_disable
  io.dec_tlu_core_ecc_disable             := tlu.io.dec_tlu_core_ecc_disable
  io.dec_tlu_bpred_disable                := tlu.io.dec_tlu_bpred_disable
  io.dec_tlu_wb_coalescing_disable        := tlu.io.dec_tlu_wb_coalescing_disable
  io.dec_tlu_dma_qos_prty         := tlu.io.dec_tlu_dma_qos_prty
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
  println((new chisel3.stage.ChiselStage).emitVerilog( new el2_dec()))
}