module int_exc(
  input         clock,
  input         reset,
  output        io_mhwakeup_ready,
  output        io_ext_int_ready,
  output        io_ce_int_ready,
  output        io_soft_int_ready,
  output        io_timer_int_ready,
  output        io_int_timer0_int_hold,
  output        io_int_timer1_int_hold,
  output        io_internal_dbg_halt_timers,
  output        io_take_ext_int_start,
  input         io_ext_int_freeze_d1,
  input         io_take_ext_int_start_d1,
  input         io_take_ext_int_start_d2,
  input         io_take_ext_int_start_d3,
  output        io_ext_int_freeze,
  output        io_take_ext_int,
  output        io_fast_int_meicpct,
  output        io_ignore_ext_int_due_to_lsu_stall,
  output        io_take_ce_int,
  output        io_take_soft_int,
  output        io_take_timer_int,
  output        io_take_int_timer0_int,
  output        io_take_int_timer1_int,
  output        io_take_reset,
  output        io_take_nmi,
  output        io_synchronous_flush_r,
  output        io_tlu_flush_lower_r,
  output        io_dec_tlu_flush_lower_wb,
  output        io_dec_tlu_flush_lower_r,
  output [30:0] io_dec_tlu_flush_path_r,
  output        io_interrupt_valid_r_d1,
  output        io_i0_exception_valid_r_d1,
  output        io_exc_or_int_valid_r_d1,
  output [4:0]  io_exc_cause_wb,
  output        io_i0_valid_wb,
  output        io_trigger_hit_r_d1,
  output        io_take_nmi_r_d1,
  output        io_interrupt_valid_r,
  output [4:0]  io_exc_cause_r,
  output        io_i0_exception_valid_r,
  output [30:0] io_tlu_flush_path_r_d1,
  output        io_exc_or_int_valid_r,
  input         io_dec_csr_stall_int_ff,
  input         io_mstatus_mie_ns,
  input  [5:0]  io_mip,
  input  [5:0]  io_mie_ns,
  input         io_mret_r,
  input         io_pmu_fw_tlu_halted_f,
  input         io_int_timer0_int_hold_f,
  input         io_int_timer1_int_hold_f,
  input         io_internal_dbg_halt_mode_f,
  input         io_dcsr_single_step_running,
  input         io_internal_dbg_halt_mode,
  input         io_dec_tlu_i0_valid_r,
  input         io_internal_pmu_fw_halt_mode,
  input         io_i_cpu_halt_req_d1,
  input         io_ebreak_to_debug_mode_r,
  input  [1:0]  io_lsu_fir_error,
  input         io_csr_pkt_csr_meicpct,
  input         io_dec_csr_any_unq_d,
  input         io_lsu_fastint_stall_any,
  input         io_reset_delayed,
  input         io_mpc_reset_run_req,
  input         io_nmi_int_detected,
  input         io_dcsr_single_step_running_f,
  input         io_dcsr_single_step_done_f,
  input  [15:0] io_dcsr,
  input  [30:0] io_mtvec,
  input         io_tlu_i0_commit_cmt,
  input         io_i0_trigger_hit_r,
  input         io_pause_expired_r,
  input  [30:0] io_nmi_vec,
  input         io_lsu_i0_rfnpc_r,
  input         io_fence_i_r,
  input         io_iccm_repair_state_rfnpc,
  input         io_i_cpu_run_req_d1,
  input         io_rfpc_i0_r,
  input         io_lsu_exc_valid_r,
  input         io_trigger_hit_dmode_r,
  input         io_take_halt,
  input  [30:0] io_rst_vec,
  input  [30:0] io_lsu_fir_addr,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input  [30:0] io_npc_r,
  input  [30:0] io_mepc,
  input         io_debug_resume_req_f,
  input  [30:0] io_dpc,
  input  [30:0] io_npc_r_d1,
  input         io_tlu_flush_lower_r_d1,
  input         io_dec_tlu_dbg_halted,
  input         io_ebreak_r,
  input         io_ecall_r,
  input         io_illegal_r,
  input         io_inst_acc_r,
  input         io_lsu_i0_exc_r,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input         io_dec_tlu_wr_pause_r_d1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  _T = ~io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 3017:48]
  wire  lsu_exc_ma_r = io_lsu_i0_exc_r & _T; // @[dec_tlu_ctl.scala 3017:46]
  wire  lsu_exc_acc_r = io_lsu_i0_exc_r & io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 3018:46]
  wire  lsu_exc_st_r = io_lsu_i0_exc_r & io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 3019:46]
  wire  _T_1 = io_ebreak_r | io_ecall_r; // @[dec_tlu_ctl.scala 3031:49]
  wire  _T_2 = _T_1 | io_illegal_r; // @[dec_tlu_ctl.scala 3031:62]
  wire  _T_3 = _T_2 | io_inst_acc_r; // @[dec_tlu_ctl.scala 3031:77]
  wire  _T_4 = ~io_rfpc_i0_r; // @[dec_tlu_ctl.scala 3031:96]
  wire  _T_5 = _T_3 & _T_4; // @[dec_tlu_ctl.scala 3031:94]
  wire  _T_6 = ~io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 3031:112]
  wire [4:0] _T_9 = io_take_nmi ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_10 = ~_T_9; // @[dec_tlu_ctl.scala 3039:27]
  wire  _T_20 = io_ebreak_r | io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 3049:31]
  wire  _T_22 = ~lsu_exc_st_r; // @[dec_tlu_ctl.scala 3050:33]
  wire  _T_23 = lsu_exc_ma_r & _T_22; // @[dec_tlu_ctl.scala 3050:31]
  wire  _T_26 = lsu_exc_acc_r & _T_22; // @[dec_tlu_ctl.scala 3051:32]
  wire  _T_28 = lsu_exc_ma_r & lsu_exc_st_r; // @[dec_tlu_ctl.scala 3052:31]
  wire  _T_30 = lsu_exc_acc_r & lsu_exc_st_r; // @[dec_tlu_ctl.scala 3053:32]
  wire [4:0] _T_32 = io_take_ext_int ? 5'hb : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_33 = io_take_timer_int ? 5'h7 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_34 = io_take_soft_int ? 5'h3 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_35 = io_take_int_timer0_int ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_36 = io_take_int_timer1_int ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_37 = io_take_ce_int ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_38 = io_illegal_r ? 5'h2 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_39 = io_ecall_r ? 5'hb : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_40 = io_inst_acc_r ? 5'h1 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_41 = _T_20 ? 5'h3 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_42 = _T_23 ? 5'h4 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_43 = _T_26 ? 5'h5 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_44 = _T_28 ? 5'h6 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_45 = _T_30 ? 5'h7 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_46 = _T_32 | _T_33; // @[Mux.scala 27:72]
  wire [4:0] _T_47 = _T_46 | _T_34; // @[Mux.scala 27:72]
  wire [4:0] _T_48 = _T_47 | _T_35; // @[Mux.scala 27:72]
  wire [4:0] _T_49 = _T_48 | _T_36; // @[Mux.scala 27:72]
  wire [4:0] _T_50 = _T_49 | _T_37; // @[Mux.scala 27:72]
  wire [4:0] _T_51 = _T_50 | _T_38; // @[Mux.scala 27:72]
  wire [4:0] _T_52 = _T_51 | _T_39; // @[Mux.scala 27:72]
  wire [4:0] _T_53 = _T_52 | _T_40; // @[Mux.scala 27:72]
  wire [4:0] _T_54 = _T_53 | _T_41; // @[Mux.scala 27:72]
  wire [4:0] _T_55 = _T_54 | _T_42; // @[Mux.scala 27:72]
  wire [4:0] _T_56 = _T_55 | _T_43; // @[Mux.scala 27:72]
  wire [4:0] _T_57 = _T_56 | _T_44; // @[Mux.scala 27:72]
  wire [4:0] _T_58 = _T_57 | _T_45; // @[Mux.scala 27:72]
  wire  _T_61 = ~io_dec_csr_stall_int_ff; // @[dec_tlu_ctl.scala 3064:31]
  wire  _T_62 = _T_61 & io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 3064:56]
  wire  _T_64 = _T_62 & io_mip[2]; // @[dec_tlu_ctl.scala 3064:76]
  wire  _T_66 = _T_64 & io_mie_ns[2]; // @[dec_tlu_ctl.scala 3064:97]
  wire  _T_73 = ~io_ignore_ext_int_due_to_lsu_stall; // @[dec_tlu_ctl.scala 3065:121]
  wire [5:0] _T_77 = {{5'd0}, io_mip[5]}; // @[dec_tlu_ctl.scala 3066:84]
  wire  _T_79 = _T_62 & _T_77[0]; // @[dec_tlu_ctl.scala 3066:76]
  wire  _T_85 = _T_62 & io_mip[0]; // @[dec_tlu_ctl.scala 3067:76]
  wire  _T_91 = _T_62 & io_mip[1]; // @[dec_tlu_ctl.scala 3068:76]
  wire  int_timer0_int_possible = io_mstatus_mie_ns & io_mie_ns[4]; // @[dec_tlu_ctl.scala 3071:57]
  wire [5:0] _T_95 = {{4'd0}, io_mip[5:4]}; // @[dec_tlu_ctl.scala 3072:42]
  wire  int_timer0_int_ready = _T_95[0] & int_timer0_int_possible; // @[dec_tlu_ctl.scala 3072:55]
  wire  int_timer1_int_possible = io_mstatus_mie_ns & io_mie_ns[3]; // @[dec_tlu_ctl.scala 3073:57]
  wire [5:0] _T_98 = {{3'd0}, io_mip[5:3]}; // @[dec_tlu_ctl.scala 3074:42]
  wire  int_timer1_int_ready = _T_98[0] & int_timer1_int_possible; // @[dec_tlu_ctl.scala 3074:55]
  wire  _T_100 = io_dec_csr_stall_int_ff | io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3078:57]
  wire  _T_101 = _T_100 | io_exc_or_int_valid_r_d1; // @[dec_tlu_ctl.scala 3078:82]
  wire  int_timer_stalled = _T_101 | io_mret_r; // @[dec_tlu_ctl.scala 3078:109]
  wire  _T_102 = io_pmu_fw_tlu_halted_f | int_timer_stalled; // @[dec_tlu_ctl.scala 3080:83]
  wire  _T_103 = int_timer0_int_ready & _T_102; // @[dec_tlu_ctl.scala 3080:57]
  wire  _T_104 = int_timer0_int_possible & io_int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 3080:132]
  wire  _T_105 = ~io_interrupt_valid_r; // @[dec_tlu_ctl.scala 3080:161]
  wire  _T_106 = _T_104 & _T_105; // @[dec_tlu_ctl.scala 3080:159]
  wire  _T_107 = ~io_take_ext_int_start; // @[dec_tlu_ctl.scala 3080:185]
  wire  _T_108 = _T_106 & _T_107; // @[dec_tlu_ctl.scala 3080:183]
  wire  _T_109 = ~io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 3080:210]
  wire  _T_110 = _T_108 & _T_109; // @[dec_tlu_ctl.scala 3080:208]
  wire  _T_113 = int_timer1_int_ready & _T_102; // @[dec_tlu_ctl.scala 3081:57]
  wire  _T_114 = int_timer1_int_possible & io_int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 3081:132]
  wire  _T_116 = _T_114 & _T_105; // @[dec_tlu_ctl.scala 3081:159]
  wire  _T_118 = _T_116 & _T_107; // @[dec_tlu_ctl.scala 3081:183]
  wire  _T_120 = _T_118 & _T_109; // @[dec_tlu_ctl.scala 3081:208]
  wire  _T_122 = ~io_dcsr_single_step_running; // @[dec_tlu_ctl.scala 3083:70]
  wire  _T_125 = _T_122 | io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 3085:92]
  wire  _T_126 = io_internal_dbg_halt_mode & _T_125; // @[dec_tlu_ctl.scala 3085:60]
  wire  _T_127 = _T_126 | io_internal_pmu_fw_halt_mode; // @[dec_tlu_ctl.scala 3085:118]
  wire  _T_128 = _T_127 | io_i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 3085:149]
  wire  _T_129 = _T_128 | io_take_nmi; // @[dec_tlu_ctl.scala 3085:172]
  wire  _T_130 = _T_129 | io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 3085:186]
  wire  _T_131 = _T_130 | io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3085:214]
  wire  _T_132 = _T_131 | io_exc_or_int_valid_r_d1; // @[dec_tlu_ctl.scala 3085:240]
  wire  _T_133 = _T_132 | io_mret_r; // @[dec_tlu_ctl.scala 3085:267]
  wire  block_interrupts = _T_133 | io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 3085:279]
  wire  _T_134 = ~block_interrupts; // @[dec_tlu_ctl.scala 3093:61]
  wire  _T_136 = io_take_ext_int_start | io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 3094:60]
  wire  _T_137 = _T_136 | io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 3094:87]
  wire  _T_139 = |io_lsu_fir_error; // @[dec_tlu_ctl.scala 3095:81]
  wire  _T_140 = ~_T_139; // @[dec_tlu_ctl.scala 3095:63]
  wire  _T_141 = io_take_ext_int_start_d3 & _T_140; // @[dec_tlu_ctl.scala 3095:61]
  wire  _T_143 = ~io_ext_int_ready; // @[dec_tlu_ctl.scala 3110:46]
  wire  _T_144 = io_ce_int_ready & _T_143; // @[dec_tlu_ctl.scala 3110:44]
  wire  _T_148 = io_soft_int_ready & _T_143; // @[dec_tlu_ctl.scala 3111:47]
  wire  _T_149 = ~io_ce_int_ready; // @[dec_tlu_ctl.scala 3111:69]
  wire  _T_150 = _T_148 & _T_149; // @[dec_tlu_ctl.scala 3111:67]
  wire  _T_153 = ~io_soft_int_ready; // @[dec_tlu_ctl.scala 3112:51]
  wire  _T_154 = io_timer_int_ready & _T_153; // @[dec_tlu_ctl.scala 3112:49]
  wire  _T_156 = _T_154 & _T_143; // @[dec_tlu_ctl.scala 3112:70]
  wire  _T_158 = _T_156 & _T_149; // @[dec_tlu_ctl.scala 3112:90]
  wire  _T_161 = int_timer0_int_ready | io_int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 3113:57]
  wire  _T_162 = _T_161 & int_timer0_int_possible; // @[dec_tlu_ctl.scala 3113:85]
  wire  _T_164 = _T_162 & _T_61; // @[dec_tlu_ctl.scala 3113:111]
  wire  _T_165 = ~io_timer_int_ready; // @[dec_tlu_ctl.scala 3113:140]
  wire  _T_166 = _T_164 & _T_165; // @[dec_tlu_ctl.scala 3113:138]
  wire  _T_168 = _T_166 & _T_153; // @[dec_tlu_ctl.scala 3113:160]
  wire  _T_170 = _T_168 & _T_143; // @[dec_tlu_ctl.scala 3113:181]
  wire  _T_172 = _T_170 & _T_149; // @[dec_tlu_ctl.scala 3113:201]
  wire  _T_175 = int_timer1_int_ready | io_int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 3114:57]
  wire  _T_176 = _T_175 & int_timer1_int_possible; // @[dec_tlu_ctl.scala 3114:85]
  wire  _T_178 = _T_176 & _T_61; // @[dec_tlu_ctl.scala 3114:111]
  wire  _T_180 = ~_T_161; // @[dec_tlu_ctl.scala 3114:140]
  wire  _T_181 = _T_178 & _T_180; // @[dec_tlu_ctl.scala 3114:138]
  wire  _T_183 = _T_181 & _T_165; // @[dec_tlu_ctl.scala 3114:191]
  wire  _T_185 = _T_183 & _T_153; // @[dec_tlu_ctl.scala 3114:213]
  wire  _T_187 = _T_185 & _T_143; // @[dec_tlu_ctl.scala 3114:234]
  wire  _T_189 = _T_187 & _T_149; // @[dec_tlu_ctl.scala 3114:254]
  wire  _T_193 = ~io_internal_pmu_fw_halt_mode; // @[dec_tlu_ctl.scala 3116:46]
  wire  _T_194 = io_nmi_int_detected & _T_193; // @[dec_tlu_ctl.scala 3116:44]
  wire  _T_195 = ~io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 3116:79]
  wire  _T_197 = io_dcsr_single_step_running_f & io_dcsr[11]; // @[dec_tlu_ctl.scala 3116:139]
  wire  _T_198 = ~io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 3116:164]
  wire  _T_199 = _T_197 & _T_198; // @[dec_tlu_ctl.scala 3116:162]
  wire  _T_200 = ~io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 3116:189]
  wire  _T_201 = _T_199 & _T_200; // @[dec_tlu_ctl.scala 3116:187]
  wire  _T_202 = _T_195 | _T_201; // @[dec_tlu_ctl.scala 3116:106]
  wire  _T_203 = _T_194 & _T_202; // @[dec_tlu_ctl.scala 3116:76]
  wire  _T_204 = ~io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3116:220]
  wire  _T_205 = _T_203 & _T_204; // @[dec_tlu_ctl.scala 3116:218]
  wire  _T_206 = ~io_mret_r; // @[dec_tlu_ctl.scala 3116:246]
  wire  _T_207 = _T_205 & _T_206; // @[dec_tlu_ctl.scala 3116:244]
  wire  _T_208 = ~io_take_reset; // @[dec_tlu_ctl.scala 3116:259]
  wire  _T_209 = _T_207 & _T_208; // @[dec_tlu_ctl.scala 3116:257]
  wire  _T_210 = ~io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 3116:276]
  wire  _T_211 = _T_209 & _T_210; // @[dec_tlu_ctl.scala 3116:274]
  wire  _T_212 = ~io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 3116:306]
  wire  _T_214 = io_take_ext_int_start_d3 & _T_139; // @[dec_tlu_ctl.scala 3116:356]
  wire  _T_215 = _T_212 | _T_214; // @[dec_tlu_ctl.scala 3116:328]
  wire  _T_217 = io_take_ext_int | io_take_timer_int; // @[dec_tlu_ctl.scala 3120:49]
  wire  _T_218 = _T_217 | io_take_soft_int; // @[dec_tlu_ctl.scala 3120:69]
  wire  _T_219 = _T_218 | io_take_nmi; // @[dec_tlu_ctl.scala 3120:88]
  wire  _T_220 = _T_219 | io_take_ce_int; // @[dec_tlu_ctl.scala 3120:102]
  wire  _T_221 = _T_220 | io_take_int_timer0_int; // @[dec_tlu_ctl.scala 3120:119]
  wire [30:0] _T_224 = {io_mtvec[30:1],1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_226 = {25'h0,io_exc_cause_r,1'h0}; // @[Cat.scala 29:58]
  wire [30:0] vectored_path = _T_224 + _T_226; // @[dec_tlu_ctl.scala 3125:59]
  wire [30:0] _T_233 = io_mtvec[0] ? vectored_path : _T_224; // @[dec_tlu_ctl.scala 3126:69]
  wire [30:0] interrupt_path = io_take_nmi ? io_nmi_vec : _T_233; // @[dec_tlu_ctl.scala 3126:33]
  wire  _T_234 = io_lsu_i0_rfnpc_r | io_fence_i_r; // @[dec_tlu_ctl.scala 3127:44]
  wire  _T_235 = _T_234 | io_iccm_repair_state_rfnpc; // @[dec_tlu_ctl.scala 3127:59]
  wire  _T_237 = io_i_cpu_run_req_d1 & _T_105; // @[dec_tlu_ctl.scala 3127:111]
  wire  _T_238 = _T_235 | _T_237; // @[dec_tlu_ctl.scala 3127:88]
  wire  _T_240 = io_rfpc_i0_r & _T_198; // @[dec_tlu_ctl.scala 3127:152]
  wire  sel_npc_r = _T_238 | _T_240; // @[dec_tlu_ctl.scala 3127:136]
  wire  _T_241 = io_i_cpu_run_req_d1 & io_pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 3128:51]
  wire  sel_npc_resume = _T_241 | io_pause_expired_r; // @[dec_tlu_ctl.scala 3128:77]
  wire  _T_244 = io_i0_exception_valid_r | io_rfpc_i0_r; // @[dec_tlu_ctl.scala 3130:60]
  wire  _T_245 = _T_244 | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 3130:75]
  wire  _T_246 = _T_245 | io_fence_i_r; // @[dec_tlu_ctl.scala 3130:96]
  wire  _T_247 = _T_246 | io_lsu_i0_rfnpc_r; // @[dec_tlu_ctl.scala 3130:111]
  wire  _T_248 = _T_247 | io_iccm_repair_state_rfnpc; // @[dec_tlu_ctl.scala 3130:131]
  wire  _T_249 = _T_248 | io_debug_resume_req_f; // @[dec_tlu_ctl.scala 3130:161]
  wire  _T_250 = _T_249 | sel_npc_resume; // @[dec_tlu_ctl.scala 3130:186]
  wire  _T_251 = _T_250 | io_dec_tlu_wr_pause_r_d1; // @[dec_tlu_ctl.scala 3130:204]
  wire  _T_253 = io_interrupt_valid_r | io_mret_r; // @[dec_tlu_ctl.scala 3131:54]
  wire  _T_254 = _T_253 | io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3131:66]
  wire  _T_255 = _T_254 | io_take_halt; // @[dec_tlu_ctl.scala 3131:91]
  wire  _T_256 = _T_255 | io_take_reset; // @[dec_tlu_ctl.scala 3131:106]
  wire  _T_260 = ~io_take_nmi; // @[dec_tlu_ctl.scala 3135:29]
  wire  _T_262 = _T_260 & sel_npc_r; // @[dec_tlu_ctl.scala 3135:36]
  wire  _T_265 = _T_260 & io_rfpc_i0_r; // @[dec_tlu_ctl.scala 3136:36]
  wire  _T_267 = _T_265 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 3136:57]
  wire  _T_268 = ~sel_npc_r; // @[dec_tlu_ctl.scala 3136:98]
  wire  _T_269 = _T_267 & _T_268; // @[dec_tlu_ctl.scala 3136:87]
  wire  _T_271 = ~_T_141; // @[dec_tlu_ctl.scala 3137:59]
  wire  _T_272 = io_interrupt_valid_r & _T_271; // @[dec_tlu_ctl.scala 3137:45]
  wire  _T_273 = io_i0_exception_valid_r | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 3138:43]
  wire  _T_274 = ~io_trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 3138:89]
  wire  _T_275 = io_i0_trigger_hit_r & _T_274; // @[dec_tlu_ctl.scala 3138:87]
  wire  _T_276 = _T_273 | _T_275; // @[dec_tlu_ctl.scala 3138:64]
  wire  _T_278 = _T_276 & _T_105; // @[dec_tlu_ctl.scala 3138:115]
  wire  _T_280 = _T_278 & _T_271; // @[dec_tlu_ctl.scala 3138:139]
  wire  _T_285 = _T_260 & io_mret_r; // @[dec_tlu_ctl.scala 3139:31]
  wire  _T_288 = _T_260 & io_debug_resume_req_f; // @[dec_tlu_ctl.scala 3140:31]
  wire  _T_291 = _T_260 & sel_npc_resume; // @[dec_tlu_ctl.scala 3141:31]
  wire [30:0] _T_293 = _T_141 ? io_lsu_fir_addr : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_294 = _T_262 ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_295 = _T_269 ? io_dec_tlu_i0_pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_296 = _T_272 ? interrupt_path : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_297 = _T_280 ? _T_224 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_298 = _T_285 ? io_mepc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_299 = _T_288 ? io_dpc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_300 = _T_291 ? io_npc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_301 = _T_293 | _T_294; // @[Mux.scala 27:72]
  wire [30:0] _T_302 = _T_301 | _T_295; // @[Mux.scala 27:72]
  wire [30:0] _T_303 = _T_302 | _T_296; // @[Mux.scala 27:72]
  wire [30:0] _T_304 = _T_303 | _T_297; // @[Mux.scala 27:72]
  wire [30:0] _T_305 = _T_304 | _T_298; // @[Mux.scala 27:72]
  wire [30:0] _T_306 = _T_305 | _T_299; // @[Mux.scala 27:72]
  wire [30:0] _T_307 = _T_306 | _T_300; // @[Mux.scala 27:72]
  reg [30:0] _T_311; // @[Reg.scala 27:20]
  wire  _T_312 = io_lsu_exc_valid_r | io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 3152:53]
  wire  _T_313 = _T_312 | io_interrupt_valid_r; // @[dec_tlu_ctl.scala 3152:79]
  reg  _T_320; // @[Reg.scala 27:20]
  wire  _T_318 = io_interrupt_valid_r ^ _T_320; // @[lib.scala 448:21]
  wire  _T_319 = |_T_318; // @[lib.scala 448:29]
  reg  _T_324; // @[Reg.scala 27:20]
  wire  _T_322 = io_i0_exception_valid_r ^ _T_324; // @[lib.scala 448:21]
  wire  _T_323 = |_T_322; // @[lib.scala 448:29]
  reg  _T_328; // @[Reg.scala 27:20]
  wire  _T_326 = io_exc_or_int_valid_r ^ _T_328; // @[lib.scala 448:21]
  wire  _T_327 = |_T_326; // @[lib.scala 448:29]
  reg [4:0] _T_332; // @[Reg.scala 27:20]
  wire [4:0] _T_330 = io_exc_cause_r ^ _T_332; // @[lib.scala 448:21]
  wire  _T_331 = |_T_330; // @[lib.scala 448:29]
  wire  _T_333 = ~io_illegal_r; // @[dec_tlu_ctl.scala 3158:104]
  wire  _T_334 = io_tlu_i0_commit_cmt & _T_333; // @[dec_tlu_ctl.scala 3158:102]
  reg  _T_338; // @[Reg.scala 27:20]
  wire  _T_336 = _T_334 ^ _T_338; // @[lib.scala 448:21]
  wire  _T_337 = |_T_336; // @[lib.scala 448:29]
  reg  _T_342; // @[Reg.scala 27:20]
  wire  _T_340 = io_i0_trigger_hit_r ^ _T_342; // @[lib.scala 448:21]
  wire  _T_341 = |_T_340; // @[lib.scala 448:29]
  reg  _T_346; // @[Reg.scala 27:20]
  wire  _T_344 = io_take_nmi ^ _T_346; // @[lib.scala 448:21]
  wire  _T_345 = |_T_344; // @[lib.scala 448:29]
  assign io_mhwakeup_ready = _T_64 & io_mie_ns[2]; // @[dec_tlu_ctl.scala 3064:28]
  assign io_ext_int_ready = _T_66 & _T_73; // @[dec_tlu_ctl.scala 3065:28]
  assign io_ce_int_ready = _T_79 & io_mie_ns[5]; // @[dec_tlu_ctl.scala 3066:28]
  assign io_soft_int_ready = _T_85 & io_mie_ns[0]; // @[dec_tlu_ctl.scala 3067:28]
  assign io_timer_int_ready = _T_91 & io_mie_ns[1]; // @[dec_tlu_ctl.scala 3068:28]
  assign io_int_timer0_int_hold = _T_103 | _T_110; // @[dec_tlu_ctl.scala 3080:32]
  assign io_int_timer1_int_hold = _T_113 | _T_120; // @[dec_tlu_ctl.scala 3081:32]
  assign io_internal_dbg_halt_timers = io_internal_dbg_halt_mode_f & _T_122; // @[dec_tlu_ctl.scala 3083:37]
  assign io_take_ext_int_start = io_ext_int_ready & _T_134; // @[dec_tlu_ctl.scala 3093:39]
  assign io_ext_int_freeze = _T_137 | io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 3094:35]
  assign io_take_ext_int = io_take_ext_int_start_d3 & _T_140; // @[dec_tlu_ctl.scala 3095:33]
  assign io_fast_int_meicpct = io_csr_pkt_csr_meicpct & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 3096:37]
  assign io_ignore_ext_int_due_to_lsu_stall = io_lsu_fastint_stall_any; // @[dec_tlu_ctl.scala 3097:52]
  assign io_take_ce_int = _T_144 & _T_134; // @[dec_tlu_ctl.scala 3110:25]
  assign io_take_soft_int = _T_150 & _T_134; // @[dec_tlu_ctl.scala 3111:26]
  assign io_take_timer_int = _T_158 & _T_134; // @[dec_tlu_ctl.scala 3112:27]
  assign io_take_int_timer0_int = _T_172 & _T_134; // @[dec_tlu_ctl.scala 3113:32]
  assign io_take_int_timer1_int = _T_189 & _T_134; // @[dec_tlu_ctl.scala 3114:32]
  assign io_take_reset = io_reset_delayed & io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 3115:23]
  assign io_take_nmi = _T_211 & _T_215; // @[dec_tlu_ctl.scala 3116:21]
  assign io_synchronous_flush_r = _T_251 | io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 3130:33]
  assign io_tlu_flush_lower_r = _T_256 | io_take_ext_int_start; // @[dec_tlu_ctl.scala 3131:30]
  assign io_dec_tlu_flush_lower_wb = io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 3146:41]
  assign io_dec_tlu_flush_lower_r = io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 3148:41]
  assign io_dec_tlu_flush_path_r = io_take_reset ? io_rst_vec : _T_307; // @[dec_tlu_ctl.scala 3149:41]
  assign io_interrupt_valid_r_d1 = _T_320; // @[dec_tlu_ctl.scala 3154:59]
  assign io_i0_exception_valid_r_d1 = _T_324; // @[dec_tlu_ctl.scala 3155:51]
  assign io_exc_or_int_valid_r_d1 = _T_328; // @[dec_tlu_ctl.scala 3156:53]
  assign io_exc_cause_wb = _T_332; // @[dec_tlu_ctl.scala 3157:65]
  assign io_i0_valid_wb = _T_338; // @[dec_tlu_ctl.scala 3158:71]
  assign io_trigger_hit_r_d1 = _T_342; // @[dec_tlu_ctl.scala 3159:63]
  assign io_take_nmi_r_d1 = _T_346; // @[dec_tlu_ctl.scala 3160:73]
  assign io_interrupt_valid_r = _T_221 | io_take_int_timer1_int; // @[dec_tlu_ctl.scala 3120:30]
  assign io_exc_cause_r = _T_10 & _T_58; // @[dec_tlu_ctl.scala 3039:24]
  assign io_i0_exception_valid_r = _T_5 & _T_6; // @[dec_tlu_ctl.scala 3031:33]
  assign io_tlu_flush_path_r_d1 = _T_311; // @[dec_tlu_ctl.scala 3144:31]
  assign io_exc_or_int_valid_r = _T_313 | _T_275; // @[dec_tlu_ctl.scala 3152:31]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_311 = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  _T_320 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_324 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_328 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_332 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  _T_338 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_342 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_346 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_311 = 31'h0;
  end
  if (reset) begin
    _T_320 = 1'h0;
  end
  if (reset) begin
    _T_324 = 1'h0;
  end
  if (reset) begin
    _T_328 = 1'h0;
  end
  if (reset) begin
    _T_332 = 5'h0;
  end
  if (reset) begin
    _T_338 = 1'h0;
  end
  if (reset) begin
    _T_342 = 1'h0;
  end
  if (reset) begin
    _T_346 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_311 <= 31'h0;
    end else if (io_tlu_flush_lower_r) begin
      if (io_take_reset) begin
        _T_311 <= io_rst_vec;
      end else begin
        _T_311 <= _T_307;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_320 <= 1'h0;
    end else if (_T_319) begin
      _T_320 <= io_interrupt_valid_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_324 <= 1'h0;
    end else if (_T_323) begin
      _T_324 <= io_i0_exception_valid_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_328 <= 1'h0;
    end else if (_T_327) begin
      _T_328 <= io_exc_or_int_valid_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_332 <= 5'h0;
    end else if (_T_331) begin
      _T_332 <= io_exc_cause_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_338 <= 1'h0;
    end else if (_T_337) begin
      _T_338 <= _T_334;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_342 <= 1'h0;
    end else if (_T_341) begin
      _T_342 <= io_i0_trigger_hit_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_346 <= 1'h0;
    end else if (_T_345) begin
      _T_346 <= io_take_nmi;
    end
  end
endmodule
module perf_mux_and_flops(
  input        reset,
  output       io_mhpmc_inc_r_0,
  output       io_mhpmc_inc_r_1,
  output       io_mhpmc_inc_r_2,
  output       io_mhpmc_inc_r_3,
  input  [6:0] io_mcountinhibit,
  input  [9:0] io_mhpme_vec_0,
  input  [9:0] io_mhpme_vec_1,
  input  [9:0] io_mhpme_vec_2,
  input  [9:0] io_mhpme_vec_3,
  input        io_ifu_pmu_ic_hit,
  input        io_ifu_pmu_ic_miss,
  input        io_tlu_i0_commit_cmt,
  input        io_illegal_r,
  input        io_exu_pmu_i0_pc4,
  input        io_ifu_pmu_instr_aligned,
  input        io_dec_pmu_instr_decoded,
  input  [3:0] io_dec_tlu_packet_r_pmu_i0_itype,
  input        io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input        io_dec_tlu_packet_r_pmu_divide,
  input        io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input        io_exu_pmu_i0_br_misp,
  input        io_dec_pmu_decode_stall,
  input        io_exu_pmu_i0_br_ataken,
  input        io_ifu_pmu_fetch_stall,
  input        io_dec_pmu_postsync_stall,
  input        io_dec_pmu_presync_stall,
  input        io_lsu_store_stall_any,
  input        io_dma_dccm_stall_any,
  input        io_dma_iccm_stall_any,
  input        io_i0_exception_valid_r,
  input        io_dec_tlu_pmu_fw_halted,
  input        io_dma_pmu_any_read,
  input        io_dma_pmu_any_write,
  input        io_dma_pmu_dccm_read,
  input        io_dma_pmu_dccm_write,
  input        io_lsu_pmu_load_external_r,
  input        io_lsu_pmu_store_external_r,
  output [1:0] io_mstatus,
  input  [5:0] io_mie,
  input        io_ifu_pmu_bus_trxn,
  input        io_lsu_pmu_bus_trxn,
  input        io_lsu_pmu_bus_misaligned,
  input        io_ifu_pmu_bus_error,
  input        io_lsu_pmu_bus_error,
  input        io_ifu_pmu_bus_busy,
  input        io_lsu_pmu_bus_busy,
  input        io_i0_trigger_hit_r,
  input        io_lsu_exc_valid_r,
  input        io_take_timer_int,
  input        io_take_int_timer0_int,
  input        io_take_int_timer1_int,
  input        io_take_ext_int,
  input        io_tlu_flush_lower_r,
  input        io_dec_tlu_br0_error_r,
  input        io_rfpc_i0_r,
  input        io_dec_tlu_br0_start_error_r,
  output       io_mcyclel_cout_f,
  output       io_minstret_enable_f,
  output       io_minstretl_cout_f,
  output [3:0] io_meicidpl,
  output       io_icache_rd_valid_f,
  output       io_icache_wr_valid_f,
  output       io_mhpmc_inc_r_d1_0,
  output       io_mhpmc_inc_r_d1_1,
  output       io_mhpmc_inc_r_d1_2,
  output       io_mhpmc_inc_r_d1_3,
  output       io_perfcnt_halted_d1,
  output       io_mdseac_locked_f,
  output       io_lsu_single_ecc_error_r_d1,
  output       io_lsu_i0_exc_r_d1,
  output       io_take_ext_int_start_d1,
  output       io_take_ext_int_start_d2,
  output       io_take_ext_int_start_d3,
  output       io_ext_int_freeze_d1,
  output [5:0] io_mip,
  input        io_mdseac_locked_ns,
  input        io_lsu_single_ecc_error_r,
  input        io_lsu_i0_exc_r,
  input        io_take_ext_int_start,
  input        io_ext_int_freeze,
  input  [5:0] io_mip_ns,
  input        io_mcyclel_cout,
  input        io_wr_mcycleh_r,
  input        io_mcyclel_cout_in,
  input        io_minstret_enable,
  input        io_minstretl_cout_ns,
  input  [3:0] io_meicidpl_ns,
  input        io_icache_rd_valid,
  input        io_icache_wr_valid,
  input        io_perfcnt_halted,
  input  [1:0] io_mstatus_ns,
  input        io_free_l2clk
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] _T_1 = io_tlu_i0_commit_cmt ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] pmu_i0_itype_qual = io_dec_tlu_packet_r_pmu_i0_itype & _T_1; // @[dec_tlu_ctl.scala 2795:66]
  wire  _T_3 = ~io_mcountinhibit[3]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_4 = io_mhpme_vec_0 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_6 = io_mhpme_vec_0 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_8 = io_mhpme_vec_0 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_10 = io_mhpme_vec_0 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_12 = ~io_illegal_r; // @[dec_tlu_ctl.scala 2801:104]
  wire  _T_13 = io_tlu_i0_commit_cmt & _T_12; // @[dec_tlu_ctl.scala 2801:102]
  wire  _T_14 = io_mhpme_vec_0 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_16 = ~io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 2802:104]
  wire  _T_17 = io_tlu_i0_commit_cmt & _T_16; // @[dec_tlu_ctl.scala 2802:102]
  wire  _T_19 = _T_17 & _T_12; // @[dec_tlu_ctl.scala 2802:123]
  wire  _T_20 = io_mhpme_vec_0 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_22 = io_tlu_i0_commit_cmt & io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 2803:102]
  wire  _T_24 = _T_22 & _T_12; // @[dec_tlu_ctl.scala 2803:123]
  wire  _T_25 = io_mhpme_vec_0 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_27 = io_mhpme_vec_0 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_29 = io_mhpme_vec_0 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_31 = io_mhpme_vec_0 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_33 = pmu_i0_itype_qual == 4'h1; // @[dec_tlu_ctl.scala 2808:99]
  wire  _T_34 = io_mhpme_vec_0 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_36 = io_dec_tlu_packet_r_pmu_divide & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2809:113]
  wire  _T_38 = _T_36 & _T_12; // @[dec_tlu_ctl.scala 2809:136]
  wire  _T_39 = io_mhpme_vec_0 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_41 = pmu_i0_itype_qual == 4'h2; // @[dec_tlu_ctl.scala 2810:99]
  wire  _T_42 = io_mhpme_vec_0 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_44 = pmu_i0_itype_qual == 4'h3; // @[dec_tlu_ctl.scala 2811:99]
  wire  _T_45 = io_mhpme_vec_0 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_48 = _T_41 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 2812:108]
  wire  _T_49 = io_mhpme_vec_0 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_53 = _T_44 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 2813:109]
  wire  _T_54 = io_mhpme_vec_0 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_56 = pmu_i0_itype_qual == 4'h4; // @[dec_tlu_ctl.scala 2815:97]
  wire  _T_57 = io_mhpme_vec_0 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_59 = pmu_i0_itype_qual == 4'h5; // @[dec_tlu_ctl.scala 2816:97]
  wire  _T_60 = io_mhpme_vec_0 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_62 = pmu_i0_itype_qual == 4'h6; // @[dec_tlu_ctl.scala 2817:97]
  wire  _T_63 = io_mhpme_vec_0 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_65 = pmu_i0_itype_qual == 4'h7; // @[dec_tlu_ctl.scala 2818:97]
  wire  _T_66 = io_mhpme_vec_0 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_68 = pmu_i0_itype_qual == 4'h8; // @[dec_tlu_ctl.scala 2819:97]
  wire  _T_69 = io_mhpme_vec_0 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_71 = pmu_i0_itype_qual == 4'h9; // @[dec_tlu_ctl.scala 2820:97]
  wire  _T_72 = io_mhpme_vec_0 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_74 = pmu_i0_itype_qual == 4'ha; // @[dec_tlu_ctl.scala 2821:97]
  wire  _T_75 = io_mhpme_vec_0 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_77 = pmu_i0_itype_qual == 4'hb; // @[dec_tlu_ctl.scala 2822:97]
  wire  _T_78 = io_mhpme_vec_0 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_80 = pmu_i0_itype_qual == 4'hc; // @[dec_tlu_ctl.scala 2823:97]
  wire  _T_81 = io_mhpme_vec_0 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_83 = pmu_i0_itype_qual == 4'hd; // @[dec_tlu_ctl.scala 2824:97]
  wire  _T_84 = pmu_i0_itype_qual == 4'he; // @[dec_tlu_ctl.scala 2824:130]
  wire  _T_85 = _T_83 | _T_84; // @[dec_tlu_ctl.scala 2824:109]
  wire  _T_86 = io_mhpme_vec_0 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_88 = io_exu_pmu_i0_br_misp & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2826:103]
  wire  _T_90 = _T_88 & _T_12; // @[dec_tlu_ctl.scala 2826:126]
  wire  _T_91 = io_mhpme_vec_0 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_93 = io_exu_pmu_i0_br_ataken & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2827:105]
  wire  _T_95 = _T_93 & _T_12; // @[dec_tlu_ctl.scala 2827:128]
  wire  _T_96 = io_mhpme_vec_0 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_98 = io_dec_tlu_packet_r_pmu_i0_br_unpred & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2828:118]
  wire  _T_100 = _T_98 & _T_12; // @[dec_tlu_ctl.scala 2828:141]
  wire  _T_101 = io_mhpme_vec_0 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_105 = io_mhpme_vec_0 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_107 = io_mhpme_vec_0 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_109 = io_mhpme_vec_0 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_111 = io_mhpme_vec_0 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_113 = io_mhpme_vec_0 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_115 = io_mhpme_vec_0 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_117 = io_i0_exception_valid_r | io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 2836:106]
  wire  _T_118 = _T_117 | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 2836:128]
  wire  _T_119 = io_mhpme_vec_0 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_121 = io_take_timer_int | io_take_int_timer0_int; // @[dec_tlu_ctl.scala 2837:100]
  wire  _T_122 = _T_121 | io_take_int_timer1_int; // @[dec_tlu_ctl.scala 2837:125]
  wire  _T_123 = io_mhpme_vec_0 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_125 = io_mhpme_vec_0 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_127 = io_mhpme_vec_0 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_129 = io_dec_tlu_br0_error_r | io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 2840:105]
  wire  _T_130 = _T_129 & io_rfpc_i0_r; // @[dec_tlu_ctl.scala 2840:137]
  wire  _T_131 = io_mhpme_vec_0 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_133 = io_mhpme_vec_0 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_135 = io_mhpme_vec_0 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_137 = io_mhpme_vec_0 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_139 = io_mhpme_vec_0 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_141 = io_mhpme_vec_0 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_143 = io_mhpme_vec_0 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_145 = io_mhpme_vec_0 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_149 = ~io_mstatus[0]; // @[dec_tlu_ctl.scala 2849:81]
  wire  _T_150 = io_mhpme_vec_0 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire [5:0] _T_157 = io_mip & io_mie; // @[dec_tlu_ctl.scala 2850:121]
  wire  _T_158 = |_T_157; // @[dec_tlu_ctl.scala 2850:136]
  wire  _T_159 = _T_149 & _T_158; // @[dec_tlu_ctl.scala 2850:106]
  wire  _T_160 = io_mhpme_vec_0 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_162 = pmu_i0_itype_qual == 4'hf; // @[dec_tlu_ctl.scala 2851:99]
  wire  _T_163 = io_mhpme_vec_0 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_165 = io_tlu_i0_commit_cmt & io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 2852:102]
  wire  _T_167 = _T_165 & _T_12; // @[dec_tlu_ctl.scala 2852:131]
  wire  _T_168 = io_mhpme_vec_0 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_170 = io_tlu_i0_commit_cmt & io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 2853:102]
  wire  _T_172 = _T_170 & _T_12; // @[dec_tlu_ctl.scala 2853:132]
  wire  _T_173 = io_mhpme_vec_0 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_175 = io_mhpme_vec_0 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_177 = io_mhpme_vec_0 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_179 = io_mhpme_vec_0 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_181 = io_mhpme_vec_0 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_184 = _T_6 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_185 = _T_8 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_186 = _T_10 & _T_13; // @[Mux.scala 27:72]
  wire  _T_187 = _T_14 & _T_19; // @[Mux.scala 27:72]
  wire  _T_188 = _T_20 & _T_24; // @[Mux.scala 27:72]
  wire  _T_189 = _T_25 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_190 = _T_27 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_191 = _T_29 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_192 = _T_31 & _T_33; // @[Mux.scala 27:72]
  wire  _T_193 = _T_34 & _T_38; // @[Mux.scala 27:72]
  wire  _T_194 = _T_39 & _T_41; // @[Mux.scala 27:72]
  wire  _T_195 = _T_42 & _T_44; // @[Mux.scala 27:72]
  wire  _T_196 = _T_45 & _T_48; // @[Mux.scala 27:72]
  wire  _T_197 = _T_49 & _T_53; // @[Mux.scala 27:72]
  wire  _T_198 = _T_54 & _T_56; // @[Mux.scala 27:72]
  wire  _T_199 = _T_57 & _T_59; // @[Mux.scala 27:72]
  wire  _T_200 = _T_60 & _T_62; // @[Mux.scala 27:72]
  wire  _T_201 = _T_63 & _T_65; // @[Mux.scala 27:72]
  wire  _T_202 = _T_66 & _T_68; // @[Mux.scala 27:72]
  wire  _T_203 = _T_69 & _T_71; // @[Mux.scala 27:72]
  wire  _T_204 = _T_72 & _T_74; // @[Mux.scala 27:72]
  wire  _T_205 = _T_75 & _T_77; // @[Mux.scala 27:72]
  wire  _T_206 = _T_78 & _T_80; // @[Mux.scala 27:72]
  wire  _T_207 = _T_81 & _T_85; // @[Mux.scala 27:72]
  wire  _T_208 = _T_86 & _T_90; // @[Mux.scala 27:72]
  wire  _T_209 = _T_91 & _T_95; // @[Mux.scala 27:72]
  wire  _T_210 = _T_96 & _T_100; // @[Mux.scala 27:72]
  wire  _T_211 = _T_101 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_213 = _T_105 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_214 = _T_107 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_215 = _T_109 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_216 = _T_111 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_217 = _T_113 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_218 = _T_115 & _T_118; // @[Mux.scala 27:72]
  wire  _T_219 = _T_119 & _T_122; // @[Mux.scala 27:72]
  wire  _T_220 = _T_123 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_221 = _T_125 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_222 = _T_127 & _T_130; // @[Mux.scala 27:72]
  wire  _T_223 = _T_131 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_224 = _T_133 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_225 = _T_135 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_226 = _T_137 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_227 = _T_139 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_228 = _T_141 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_229 = _T_143 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_230 = _T_145 & _T_149; // @[Mux.scala 27:72]
  wire  _T_231 = _T_150 & _T_159; // @[Mux.scala 27:72]
  wire  _T_232 = _T_160 & _T_162; // @[Mux.scala 27:72]
  wire  _T_233 = _T_163 & _T_167; // @[Mux.scala 27:72]
  wire  _T_234 = _T_168 & _T_172; // @[Mux.scala 27:72]
  wire  _T_235 = _T_173 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_236 = _T_175 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_237 = _T_177 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_238 = _T_179 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_239 = _T_181 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_240 = _T_4 | _T_184; // @[Mux.scala 27:72]
  wire  _T_241 = _T_240 | _T_185; // @[Mux.scala 27:72]
  wire  _T_242 = _T_241 | _T_186; // @[Mux.scala 27:72]
  wire  _T_243 = _T_242 | _T_187; // @[Mux.scala 27:72]
  wire  _T_244 = _T_243 | _T_188; // @[Mux.scala 27:72]
  wire  _T_245 = _T_244 | _T_189; // @[Mux.scala 27:72]
  wire  _T_246 = _T_245 | _T_190; // @[Mux.scala 27:72]
  wire  _T_247 = _T_246 | _T_191; // @[Mux.scala 27:72]
  wire  _T_248 = _T_247 | _T_192; // @[Mux.scala 27:72]
  wire  _T_249 = _T_248 | _T_193; // @[Mux.scala 27:72]
  wire  _T_250 = _T_249 | _T_194; // @[Mux.scala 27:72]
  wire  _T_251 = _T_250 | _T_195; // @[Mux.scala 27:72]
  wire  _T_252 = _T_251 | _T_196; // @[Mux.scala 27:72]
  wire  _T_253 = _T_252 | _T_197; // @[Mux.scala 27:72]
  wire  _T_254 = _T_253 | _T_198; // @[Mux.scala 27:72]
  wire  _T_255 = _T_254 | _T_199; // @[Mux.scala 27:72]
  wire  _T_256 = _T_255 | _T_200; // @[Mux.scala 27:72]
  wire  _T_257 = _T_256 | _T_201; // @[Mux.scala 27:72]
  wire  _T_258 = _T_257 | _T_202; // @[Mux.scala 27:72]
  wire  _T_259 = _T_258 | _T_203; // @[Mux.scala 27:72]
  wire  _T_260 = _T_259 | _T_204; // @[Mux.scala 27:72]
  wire  _T_261 = _T_260 | _T_205; // @[Mux.scala 27:72]
  wire  _T_262 = _T_261 | _T_206; // @[Mux.scala 27:72]
  wire  _T_263 = _T_262 | _T_207; // @[Mux.scala 27:72]
  wire  _T_264 = _T_263 | _T_208; // @[Mux.scala 27:72]
  wire  _T_265 = _T_264 | _T_209; // @[Mux.scala 27:72]
  wire  _T_266 = _T_265 | _T_210; // @[Mux.scala 27:72]
  wire  _T_267 = _T_266 | _T_211; // @[Mux.scala 27:72]
  wire  _T_268 = _T_267 | _T_191; // @[Mux.scala 27:72]
  wire  _T_269 = _T_268 | _T_213; // @[Mux.scala 27:72]
  wire  _T_270 = _T_269 | _T_214; // @[Mux.scala 27:72]
  wire  _T_271 = _T_270 | _T_215; // @[Mux.scala 27:72]
  wire  _T_272 = _T_271 | _T_216; // @[Mux.scala 27:72]
  wire  _T_273 = _T_272 | _T_217; // @[Mux.scala 27:72]
  wire  _T_274 = _T_273 | _T_218; // @[Mux.scala 27:72]
  wire  _T_275 = _T_274 | _T_219; // @[Mux.scala 27:72]
  wire  _T_276 = _T_275 | _T_220; // @[Mux.scala 27:72]
  wire  _T_277 = _T_276 | _T_221; // @[Mux.scala 27:72]
  wire  _T_278 = _T_277 | _T_222; // @[Mux.scala 27:72]
  wire  _T_279 = _T_278 | _T_223; // @[Mux.scala 27:72]
  wire  _T_280 = _T_279 | _T_224; // @[Mux.scala 27:72]
  wire  _T_281 = _T_280 | _T_225; // @[Mux.scala 27:72]
  wire  _T_282 = _T_281 | _T_226; // @[Mux.scala 27:72]
  wire  _T_283 = _T_282 | _T_227; // @[Mux.scala 27:72]
  wire  _T_284 = _T_283 | _T_228; // @[Mux.scala 27:72]
  wire  _T_285 = _T_284 | _T_229; // @[Mux.scala 27:72]
  wire  _T_286 = _T_285 | _T_230; // @[Mux.scala 27:72]
  wire  _T_287 = _T_286 | _T_231; // @[Mux.scala 27:72]
  wire  _T_288 = _T_287 | _T_232; // @[Mux.scala 27:72]
  wire  _T_289 = _T_288 | _T_233; // @[Mux.scala 27:72]
  wire  _T_290 = _T_289 | _T_234; // @[Mux.scala 27:72]
  wire  _T_291 = _T_290 | _T_235; // @[Mux.scala 27:72]
  wire  _T_292 = _T_291 | _T_236; // @[Mux.scala 27:72]
  wire  _T_293 = _T_292 | _T_237; // @[Mux.scala 27:72]
  wire  _T_294 = _T_293 | _T_238; // @[Mux.scala 27:72]
  wire  _T_295 = _T_294 | _T_239; // @[Mux.scala 27:72]
  wire  _T_299 = ~io_mcountinhibit[4]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_300 = io_mhpme_vec_1 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_302 = io_mhpme_vec_1 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_304 = io_mhpme_vec_1 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_306 = io_mhpme_vec_1 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_310 = io_mhpme_vec_1 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_316 = io_mhpme_vec_1 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_321 = io_mhpme_vec_1 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_323 = io_mhpme_vec_1 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_325 = io_mhpme_vec_1 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_327 = io_mhpme_vec_1 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_330 = io_mhpme_vec_1 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_335 = io_mhpme_vec_1 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_338 = io_mhpme_vec_1 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_341 = io_mhpme_vec_1 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_345 = io_mhpme_vec_1 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_350 = io_mhpme_vec_1 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_353 = io_mhpme_vec_1 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_356 = io_mhpme_vec_1 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_359 = io_mhpme_vec_1 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_362 = io_mhpme_vec_1 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_365 = io_mhpme_vec_1 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_368 = io_mhpme_vec_1 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_371 = io_mhpme_vec_1 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_374 = io_mhpme_vec_1 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_377 = io_mhpme_vec_1 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_382 = io_mhpme_vec_1 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_387 = io_mhpme_vec_1 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_392 = io_mhpme_vec_1 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_397 = io_mhpme_vec_1 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_401 = io_mhpme_vec_1 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_403 = io_mhpme_vec_1 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_405 = io_mhpme_vec_1 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_407 = io_mhpme_vec_1 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_409 = io_mhpme_vec_1 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_411 = io_mhpme_vec_1 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_415 = io_mhpme_vec_1 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_419 = io_mhpme_vec_1 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_421 = io_mhpme_vec_1 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_423 = io_mhpme_vec_1 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_427 = io_mhpme_vec_1 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_429 = io_mhpme_vec_1 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_431 = io_mhpme_vec_1 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_433 = io_mhpme_vec_1 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_435 = io_mhpme_vec_1 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_437 = io_mhpme_vec_1 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_439 = io_mhpme_vec_1 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_441 = io_mhpme_vec_1 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_446 = io_mhpme_vec_1 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire  _T_456 = io_mhpme_vec_1 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_459 = io_mhpme_vec_1 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_464 = io_mhpme_vec_1 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_469 = io_mhpme_vec_1 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_471 = io_mhpme_vec_1 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_473 = io_mhpme_vec_1 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_475 = io_mhpme_vec_1 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_477 = io_mhpme_vec_1 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_480 = _T_302 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_481 = _T_304 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_482 = _T_306 & _T_13; // @[Mux.scala 27:72]
  wire  _T_483 = _T_310 & _T_19; // @[Mux.scala 27:72]
  wire  _T_484 = _T_316 & _T_24; // @[Mux.scala 27:72]
  wire  _T_485 = _T_321 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_486 = _T_323 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_487 = _T_325 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_488 = _T_327 & _T_33; // @[Mux.scala 27:72]
  wire  _T_489 = _T_330 & _T_38; // @[Mux.scala 27:72]
  wire  _T_490 = _T_335 & _T_41; // @[Mux.scala 27:72]
  wire  _T_491 = _T_338 & _T_44; // @[Mux.scala 27:72]
  wire  _T_492 = _T_341 & _T_48; // @[Mux.scala 27:72]
  wire  _T_493 = _T_345 & _T_53; // @[Mux.scala 27:72]
  wire  _T_494 = _T_350 & _T_56; // @[Mux.scala 27:72]
  wire  _T_495 = _T_353 & _T_59; // @[Mux.scala 27:72]
  wire  _T_496 = _T_356 & _T_62; // @[Mux.scala 27:72]
  wire  _T_497 = _T_359 & _T_65; // @[Mux.scala 27:72]
  wire  _T_498 = _T_362 & _T_68; // @[Mux.scala 27:72]
  wire  _T_499 = _T_365 & _T_71; // @[Mux.scala 27:72]
  wire  _T_500 = _T_368 & _T_74; // @[Mux.scala 27:72]
  wire  _T_501 = _T_371 & _T_77; // @[Mux.scala 27:72]
  wire  _T_502 = _T_374 & _T_80; // @[Mux.scala 27:72]
  wire  _T_503 = _T_377 & _T_85; // @[Mux.scala 27:72]
  wire  _T_504 = _T_382 & _T_90; // @[Mux.scala 27:72]
  wire  _T_505 = _T_387 & _T_95; // @[Mux.scala 27:72]
  wire  _T_506 = _T_392 & _T_100; // @[Mux.scala 27:72]
  wire  _T_507 = _T_397 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_509 = _T_401 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_510 = _T_403 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_511 = _T_405 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_512 = _T_407 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_513 = _T_409 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_514 = _T_411 & _T_118; // @[Mux.scala 27:72]
  wire  _T_515 = _T_415 & _T_122; // @[Mux.scala 27:72]
  wire  _T_516 = _T_419 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_517 = _T_421 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_518 = _T_423 & _T_130; // @[Mux.scala 27:72]
  wire  _T_519 = _T_427 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_520 = _T_429 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_521 = _T_431 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_522 = _T_433 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_523 = _T_435 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_524 = _T_437 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_525 = _T_439 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_526 = _T_441 & _T_149; // @[Mux.scala 27:72]
  wire  _T_527 = _T_446 & _T_159; // @[Mux.scala 27:72]
  wire  _T_528 = _T_456 & _T_162; // @[Mux.scala 27:72]
  wire  _T_529 = _T_459 & _T_167; // @[Mux.scala 27:72]
  wire  _T_530 = _T_464 & _T_172; // @[Mux.scala 27:72]
  wire  _T_531 = _T_469 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_532 = _T_471 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_533 = _T_473 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_534 = _T_475 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_535 = _T_477 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_536 = _T_300 | _T_480; // @[Mux.scala 27:72]
  wire  _T_537 = _T_536 | _T_481; // @[Mux.scala 27:72]
  wire  _T_538 = _T_537 | _T_482; // @[Mux.scala 27:72]
  wire  _T_539 = _T_538 | _T_483; // @[Mux.scala 27:72]
  wire  _T_540 = _T_539 | _T_484; // @[Mux.scala 27:72]
  wire  _T_541 = _T_540 | _T_485; // @[Mux.scala 27:72]
  wire  _T_542 = _T_541 | _T_486; // @[Mux.scala 27:72]
  wire  _T_543 = _T_542 | _T_487; // @[Mux.scala 27:72]
  wire  _T_544 = _T_543 | _T_488; // @[Mux.scala 27:72]
  wire  _T_545 = _T_544 | _T_489; // @[Mux.scala 27:72]
  wire  _T_546 = _T_545 | _T_490; // @[Mux.scala 27:72]
  wire  _T_547 = _T_546 | _T_491; // @[Mux.scala 27:72]
  wire  _T_548 = _T_547 | _T_492; // @[Mux.scala 27:72]
  wire  _T_549 = _T_548 | _T_493; // @[Mux.scala 27:72]
  wire  _T_550 = _T_549 | _T_494; // @[Mux.scala 27:72]
  wire  _T_551 = _T_550 | _T_495; // @[Mux.scala 27:72]
  wire  _T_552 = _T_551 | _T_496; // @[Mux.scala 27:72]
  wire  _T_553 = _T_552 | _T_497; // @[Mux.scala 27:72]
  wire  _T_554 = _T_553 | _T_498; // @[Mux.scala 27:72]
  wire  _T_555 = _T_554 | _T_499; // @[Mux.scala 27:72]
  wire  _T_556 = _T_555 | _T_500; // @[Mux.scala 27:72]
  wire  _T_557 = _T_556 | _T_501; // @[Mux.scala 27:72]
  wire  _T_558 = _T_557 | _T_502; // @[Mux.scala 27:72]
  wire  _T_559 = _T_558 | _T_503; // @[Mux.scala 27:72]
  wire  _T_560 = _T_559 | _T_504; // @[Mux.scala 27:72]
  wire  _T_561 = _T_560 | _T_505; // @[Mux.scala 27:72]
  wire  _T_562 = _T_561 | _T_506; // @[Mux.scala 27:72]
  wire  _T_563 = _T_562 | _T_507; // @[Mux.scala 27:72]
  wire  _T_564 = _T_563 | _T_487; // @[Mux.scala 27:72]
  wire  _T_565 = _T_564 | _T_509; // @[Mux.scala 27:72]
  wire  _T_566 = _T_565 | _T_510; // @[Mux.scala 27:72]
  wire  _T_567 = _T_566 | _T_511; // @[Mux.scala 27:72]
  wire  _T_568 = _T_567 | _T_512; // @[Mux.scala 27:72]
  wire  _T_569 = _T_568 | _T_513; // @[Mux.scala 27:72]
  wire  _T_570 = _T_569 | _T_514; // @[Mux.scala 27:72]
  wire  _T_571 = _T_570 | _T_515; // @[Mux.scala 27:72]
  wire  _T_572 = _T_571 | _T_516; // @[Mux.scala 27:72]
  wire  _T_573 = _T_572 | _T_517; // @[Mux.scala 27:72]
  wire  _T_574 = _T_573 | _T_518; // @[Mux.scala 27:72]
  wire  _T_575 = _T_574 | _T_519; // @[Mux.scala 27:72]
  wire  _T_576 = _T_575 | _T_520; // @[Mux.scala 27:72]
  wire  _T_577 = _T_576 | _T_521; // @[Mux.scala 27:72]
  wire  _T_578 = _T_577 | _T_522; // @[Mux.scala 27:72]
  wire  _T_579 = _T_578 | _T_523; // @[Mux.scala 27:72]
  wire  _T_580 = _T_579 | _T_524; // @[Mux.scala 27:72]
  wire  _T_581 = _T_580 | _T_525; // @[Mux.scala 27:72]
  wire  _T_582 = _T_581 | _T_526; // @[Mux.scala 27:72]
  wire  _T_583 = _T_582 | _T_527; // @[Mux.scala 27:72]
  wire  _T_584 = _T_583 | _T_528; // @[Mux.scala 27:72]
  wire  _T_585 = _T_584 | _T_529; // @[Mux.scala 27:72]
  wire  _T_586 = _T_585 | _T_530; // @[Mux.scala 27:72]
  wire  _T_587 = _T_586 | _T_531; // @[Mux.scala 27:72]
  wire  _T_588 = _T_587 | _T_532; // @[Mux.scala 27:72]
  wire  _T_589 = _T_588 | _T_533; // @[Mux.scala 27:72]
  wire  _T_590 = _T_589 | _T_534; // @[Mux.scala 27:72]
  wire  _T_591 = _T_590 | _T_535; // @[Mux.scala 27:72]
  wire  _T_595 = ~io_mcountinhibit[5]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_596 = io_mhpme_vec_2 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_598 = io_mhpme_vec_2 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_600 = io_mhpme_vec_2 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_602 = io_mhpme_vec_2 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_606 = io_mhpme_vec_2 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_612 = io_mhpme_vec_2 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_617 = io_mhpme_vec_2 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_619 = io_mhpme_vec_2 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_621 = io_mhpme_vec_2 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_623 = io_mhpme_vec_2 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_626 = io_mhpme_vec_2 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_631 = io_mhpme_vec_2 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_634 = io_mhpme_vec_2 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_637 = io_mhpme_vec_2 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_641 = io_mhpme_vec_2 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_646 = io_mhpme_vec_2 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_649 = io_mhpme_vec_2 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_652 = io_mhpme_vec_2 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_655 = io_mhpme_vec_2 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_658 = io_mhpme_vec_2 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_661 = io_mhpme_vec_2 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_664 = io_mhpme_vec_2 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_667 = io_mhpme_vec_2 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_670 = io_mhpme_vec_2 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_673 = io_mhpme_vec_2 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_678 = io_mhpme_vec_2 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_683 = io_mhpme_vec_2 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_688 = io_mhpme_vec_2 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_693 = io_mhpme_vec_2 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_697 = io_mhpme_vec_2 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_699 = io_mhpme_vec_2 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_701 = io_mhpme_vec_2 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_703 = io_mhpme_vec_2 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_705 = io_mhpme_vec_2 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_707 = io_mhpme_vec_2 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_711 = io_mhpme_vec_2 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_715 = io_mhpme_vec_2 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_717 = io_mhpme_vec_2 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_719 = io_mhpme_vec_2 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_723 = io_mhpme_vec_2 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_725 = io_mhpme_vec_2 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_727 = io_mhpme_vec_2 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_729 = io_mhpme_vec_2 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_731 = io_mhpme_vec_2 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_733 = io_mhpme_vec_2 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_735 = io_mhpme_vec_2 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_737 = io_mhpme_vec_2 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_742 = io_mhpme_vec_2 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire  _T_752 = io_mhpme_vec_2 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_755 = io_mhpme_vec_2 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_760 = io_mhpme_vec_2 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_765 = io_mhpme_vec_2 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_767 = io_mhpme_vec_2 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_769 = io_mhpme_vec_2 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_771 = io_mhpme_vec_2 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_773 = io_mhpme_vec_2 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_776 = _T_598 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_777 = _T_600 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_778 = _T_602 & _T_13; // @[Mux.scala 27:72]
  wire  _T_779 = _T_606 & _T_19; // @[Mux.scala 27:72]
  wire  _T_780 = _T_612 & _T_24; // @[Mux.scala 27:72]
  wire  _T_781 = _T_617 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_782 = _T_619 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_783 = _T_621 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_784 = _T_623 & _T_33; // @[Mux.scala 27:72]
  wire  _T_785 = _T_626 & _T_38; // @[Mux.scala 27:72]
  wire  _T_786 = _T_631 & _T_41; // @[Mux.scala 27:72]
  wire  _T_787 = _T_634 & _T_44; // @[Mux.scala 27:72]
  wire  _T_788 = _T_637 & _T_48; // @[Mux.scala 27:72]
  wire  _T_789 = _T_641 & _T_53; // @[Mux.scala 27:72]
  wire  _T_790 = _T_646 & _T_56; // @[Mux.scala 27:72]
  wire  _T_791 = _T_649 & _T_59; // @[Mux.scala 27:72]
  wire  _T_792 = _T_652 & _T_62; // @[Mux.scala 27:72]
  wire  _T_793 = _T_655 & _T_65; // @[Mux.scala 27:72]
  wire  _T_794 = _T_658 & _T_68; // @[Mux.scala 27:72]
  wire  _T_795 = _T_661 & _T_71; // @[Mux.scala 27:72]
  wire  _T_796 = _T_664 & _T_74; // @[Mux.scala 27:72]
  wire  _T_797 = _T_667 & _T_77; // @[Mux.scala 27:72]
  wire  _T_798 = _T_670 & _T_80; // @[Mux.scala 27:72]
  wire  _T_799 = _T_673 & _T_85; // @[Mux.scala 27:72]
  wire  _T_800 = _T_678 & _T_90; // @[Mux.scala 27:72]
  wire  _T_801 = _T_683 & _T_95; // @[Mux.scala 27:72]
  wire  _T_802 = _T_688 & _T_100; // @[Mux.scala 27:72]
  wire  _T_803 = _T_693 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_805 = _T_697 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_806 = _T_699 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_807 = _T_701 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_808 = _T_703 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_809 = _T_705 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_810 = _T_707 & _T_118; // @[Mux.scala 27:72]
  wire  _T_811 = _T_711 & _T_122; // @[Mux.scala 27:72]
  wire  _T_812 = _T_715 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_813 = _T_717 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_814 = _T_719 & _T_130; // @[Mux.scala 27:72]
  wire  _T_815 = _T_723 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_816 = _T_725 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_817 = _T_727 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_818 = _T_729 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_819 = _T_731 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_820 = _T_733 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_821 = _T_735 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_822 = _T_737 & _T_149; // @[Mux.scala 27:72]
  wire  _T_823 = _T_742 & _T_159; // @[Mux.scala 27:72]
  wire  _T_824 = _T_752 & _T_162; // @[Mux.scala 27:72]
  wire  _T_825 = _T_755 & _T_167; // @[Mux.scala 27:72]
  wire  _T_826 = _T_760 & _T_172; // @[Mux.scala 27:72]
  wire  _T_827 = _T_765 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_828 = _T_767 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_829 = _T_769 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_830 = _T_771 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_831 = _T_773 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_832 = _T_596 | _T_776; // @[Mux.scala 27:72]
  wire  _T_833 = _T_832 | _T_777; // @[Mux.scala 27:72]
  wire  _T_834 = _T_833 | _T_778; // @[Mux.scala 27:72]
  wire  _T_835 = _T_834 | _T_779; // @[Mux.scala 27:72]
  wire  _T_836 = _T_835 | _T_780; // @[Mux.scala 27:72]
  wire  _T_837 = _T_836 | _T_781; // @[Mux.scala 27:72]
  wire  _T_838 = _T_837 | _T_782; // @[Mux.scala 27:72]
  wire  _T_839 = _T_838 | _T_783; // @[Mux.scala 27:72]
  wire  _T_840 = _T_839 | _T_784; // @[Mux.scala 27:72]
  wire  _T_841 = _T_840 | _T_785; // @[Mux.scala 27:72]
  wire  _T_842 = _T_841 | _T_786; // @[Mux.scala 27:72]
  wire  _T_843 = _T_842 | _T_787; // @[Mux.scala 27:72]
  wire  _T_844 = _T_843 | _T_788; // @[Mux.scala 27:72]
  wire  _T_845 = _T_844 | _T_789; // @[Mux.scala 27:72]
  wire  _T_846 = _T_845 | _T_790; // @[Mux.scala 27:72]
  wire  _T_847 = _T_846 | _T_791; // @[Mux.scala 27:72]
  wire  _T_848 = _T_847 | _T_792; // @[Mux.scala 27:72]
  wire  _T_849 = _T_848 | _T_793; // @[Mux.scala 27:72]
  wire  _T_850 = _T_849 | _T_794; // @[Mux.scala 27:72]
  wire  _T_851 = _T_850 | _T_795; // @[Mux.scala 27:72]
  wire  _T_852 = _T_851 | _T_796; // @[Mux.scala 27:72]
  wire  _T_853 = _T_852 | _T_797; // @[Mux.scala 27:72]
  wire  _T_854 = _T_853 | _T_798; // @[Mux.scala 27:72]
  wire  _T_855 = _T_854 | _T_799; // @[Mux.scala 27:72]
  wire  _T_856 = _T_855 | _T_800; // @[Mux.scala 27:72]
  wire  _T_857 = _T_856 | _T_801; // @[Mux.scala 27:72]
  wire  _T_858 = _T_857 | _T_802; // @[Mux.scala 27:72]
  wire  _T_859 = _T_858 | _T_803; // @[Mux.scala 27:72]
  wire  _T_860 = _T_859 | _T_783; // @[Mux.scala 27:72]
  wire  _T_861 = _T_860 | _T_805; // @[Mux.scala 27:72]
  wire  _T_862 = _T_861 | _T_806; // @[Mux.scala 27:72]
  wire  _T_863 = _T_862 | _T_807; // @[Mux.scala 27:72]
  wire  _T_864 = _T_863 | _T_808; // @[Mux.scala 27:72]
  wire  _T_865 = _T_864 | _T_809; // @[Mux.scala 27:72]
  wire  _T_866 = _T_865 | _T_810; // @[Mux.scala 27:72]
  wire  _T_867 = _T_866 | _T_811; // @[Mux.scala 27:72]
  wire  _T_868 = _T_867 | _T_812; // @[Mux.scala 27:72]
  wire  _T_869 = _T_868 | _T_813; // @[Mux.scala 27:72]
  wire  _T_870 = _T_869 | _T_814; // @[Mux.scala 27:72]
  wire  _T_871 = _T_870 | _T_815; // @[Mux.scala 27:72]
  wire  _T_872 = _T_871 | _T_816; // @[Mux.scala 27:72]
  wire  _T_873 = _T_872 | _T_817; // @[Mux.scala 27:72]
  wire  _T_874 = _T_873 | _T_818; // @[Mux.scala 27:72]
  wire  _T_875 = _T_874 | _T_819; // @[Mux.scala 27:72]
  wire  _T_876 = _T_875 | _T_820; // @[Mux.scala 27:72]
  wire  _T_877 = _T_876 | _T_821; // @[Mux.scala 27:72]
  wire  _T_878 = _T_877 | _T_822; // @[Mux.scala 27:72]
  wire  _T_879 = _T_878 | _T_823; // @[Mux.scala 27:72]
  wire  _T_880 = _T_879 | _T_824; // @[Mux.scala 27:72]
  wire  _T_881 = _T_880 | _T_825; // @[Mux.scala 27:72]
  wire  _T_882 = _T_881 | _T_826; // @[Mux.scala 27:72]
  wire  _T_883 = _T_882 | _T_827; // @[Mux.scala 27:72]
  wire  _T_884 = _T_883 | _T_828; // @[Mux.scala 27:72]
  wire  _T_885 = _T_884 | _T_829; // @[Mux.scala 27:72]
  wire  _T_886 = _T_885 | _T_830; // @[Mux.scala 27:72]
  wire  _T_887 = _T_886 | _T_831; // @[Mux.scala 27:72]
  wire  _T_891 = ~io_mcountinhibit[6]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_892 = io_mhpme_vec_3 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_894 = io_mhpme_vec_3 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_896 = io_mhpme_vec_3 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_898 = io_mhpme_vec_3 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_902 = io_mhpme_vec_3 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_908 = io_mhpme_vec_3 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_913 = io_mhpme_vec_3 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_915 = io_mhpme_vec_3 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_917 = io_mhpme_vec_3 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_919 = io_mhpme_vec_3 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_922 = io_mhpme_vec_3 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_927 = io_mhpme_vec_3 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_930 = io_mhpme_vec_3 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_933 = io_mhpme_vec_3 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_937 = io_mhpme_vec_3 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_942 = io_mhpme_vec_3 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_945 = io_mhpme_vec_3 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_948 = io_mhpme_vec_3 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_951 = io_mhpme_vec_3 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_954 = io_mhpme_vec_3 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_957 = io_mhpme_vec_3 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_960 = io_mhpme_vec_3 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_963 = io_mhpme_vec_3 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_966 = io_mhpme_vec_3 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_969 = io_mhpme_vec_3 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_974 = io_mhpme_vec_3 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_979 = io_mhpme_vec_3 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_984 = io_mhpme_vec_3 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_989 = io_mhpme_vec_3 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_993 = io_mhpme_vec_3 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_995 = io_mhpme_vec_3 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_997 = io_mhpme_vec_3 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_999 = io_mhpme_vec_3 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_1001 = io_mhpme_vec_3 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_1003 = io_mhpme_vec_3 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_1007 = io_mhpme_vec_3 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_1011 = io_mhpme_vec_3 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_1013 = io_mhpme_vec_3 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_1015 = io_mhpme_vec_3 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_1019 = io_mhpme_vec_3 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_1021 = io_mhpme_vec_3 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_1023 = io_mhpme_vec_3 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_1025 = io_mhpme_vec_3 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_1027 = io_mhpme_vec_3 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_1029 = io_mhpme_vec_3 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_1031 = io_mhpme_vec_3 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_1033 = io_mhpme_vec_3 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_1038 = io_mhpme_vec_3 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire  _T_1048 = io_mhpme_vec_3 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_1051 = io_mhpme_vec_3 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_1056 = io_mhpme_vec_3 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_1061 = io_mhpme_vec_3 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_1063 = io_mhpme_vec_3 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_1065 = io_mhpme_vec_3 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_1067 = io_mhpme_vec_3 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_1069 = io_mhpme_vec_3 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_1072 = _T_894 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_1073 = _T_896 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_1074 = _T_898 & _T_13; // @[Mux.scala 27:72]
  wire  _T_1075 = _T_902 & _T_19; // @[Mux.scala 27:72]
  wire  _T_1076 = _T_908 & _T_24; // @[Mux.scala 27:72]
  wire  _T_1077 = _T_913 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_1078 = _T_915 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_1079 = _T_917 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_1080 = _T_919 & _T_33; // @[Mux.scala 27:72]
  wire  _T_1081 = _T_922 & _T_38; // @[Mux.scala 27:72]
  wire  _T_1082 = _T_927 & _T_41; // @[Mux.scala 27:72]
  wire  _T_1083 = _T_930 & _T_44; // @[Mux.scala 27:72]
  wire  _T_1084 = _T_933 & _T_48; // @[Mux.scala 27:72]
  wire  _T_1085 = _T_937 & _T_53; // @[Mux.scala 27:72]
  wire  _T_1086 = _T_942 & _T_56; // @[Mux.scala 27:72]
  wire  _T_1087 = _T_945 & _T_59; // @[Mux.scala 27:72]
  wire  _T_1088 = _T_948 & _T_62; // @[Mux.scala 27:72]
  wire  _T_1089 = _T_951 & _T_65; // @[Mux.scala 27:72]
  wire  _T_1090 = _T_954 & _T_68; // @[Mux.scala 27:72]
  wire  _T_1091 = _T_957 & _T_71; // @[Mux.scala 27:72]
  wire  _T_1092 = _T_960 & _T_74; // @[Mux.scala 27:72]
  wire  _T_1093 = _T_963 & _T_77; // @[Mux.scala 27:72]
  wire  _T_1094 = _T_966 & _T_80; // @[Mux.scala 27:72]
  wire  _T_1095 = _T_969 & _T_85; // @[Mux.scala 27:72]
  wire  _T_1096 = _T_974 & _T_90; // @[Mux.scala 27:72]
  wire  _T_1097 = _T_979 & _T_95; // @[Mux.scala 27:72]
  wire  _T_1098 = _T_984 & _T_100; // @[Mux.scala 27:72]
  wire  _T_1099 = _T_989 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_1101 = _T_993 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_1102 = _T_995 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_1103 = _T_997 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_1104 = _T_999 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1105 = _T_1001 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1106 = _T_1003 & _T_118; // @[Mux.scala 27:72]
  wire  _T_1107 = _T_1007 & _T_122; // @[Mux.scala 27:72]
  wire  _T_1108 = _T_1011 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_1109 = _T_1013 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_1110 = _T_1015 & _T_130; // @[Mux.scala 27:72]
  wire  _T_1111 = _T_1019 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1112 = _T_1021 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1113 = _T_1023 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_1114 = _T_1025 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1115 = _T_1027 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1116 = _T_1029 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1117 = _T_1031 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1118 = _T_1033 & _T_149; // @[Mux.scala 27:72]
  wire  _T_1119 = _T_1038 & _T_159; // @[Mux.scala 27:72]
  wire  _T_1120 = _T_1048 & _T_162; // @[Mux.scala 27:72]
  wire  _T_1121 = _T_1051 & _T_167; // @[Mux.scala 27:72]
  wire  _T_1122 = _T_1056 & _T_172; // @[Mux.scala 27:72]
  wire  _T_1123 = _T_1061 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_1124 = _T_1063 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_1125 = _T_1065 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1067 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_1127 = _T_1069 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_1128 = _T_892 | _T_1072; // @[Mux.scala 27:72]
  wire  _T_1129 = _T_1128 | _T_1073; // @[Mux.scala 27:72]
  wire  _T_1130 = _T_1129 | _T_1074; // @[Mux.scala 27:72]
  wire  _T_1131 = _T_1130 | _T_1075; // @[Mux.scala 27:72]
  wire  _T_1132 = _T_1131 | _T_1076; // @[Mux.scala 27:72]
  wire  _T_1133 = _T_1132 | _T_1077; // @[Mux.scala 27:72]
  wire  _T_1134 = _T_1133 | _T_1078; // @[Mux.scala 27:72]
  wire  _T_1135 = _T_1134 | _T_1079; // @[Mux.scala 27:72]
  wire  _T_1136 = _T_1135 | _T_1080; // @[Mux.scala 27:72]
  wire  _T_1137 = _T_1136 | _T_1081; // @[Mux.scala 27:72]
  wire  _T_1138 = _T_1137 | _T_1082; // @[Mux.scala 27:72]
  wire  _T_1139 = _T_1138 | _T_1083; // @[Mux.scala 27:72]
  wire  _T_1140 = _T_1139 | _T_1084; // @[Mux.scala 27:72]
  wire  _T_1141 = _T_1140 | _T_1085; // @[Mux.scala 27:72]
  wire  _T_1142 = _T_1141 | _T_1086; // @[Mux.scala 27:72]
  wire  _T_1143 = _T_1142 | _T_1087; // @[Mux.scala 27:72]
  wire  _T_1144 = _T_1143 | _T_1088; // @[Mux.scala 27:72]
  wire  _T_1145 = _T_1144 | _T_1089; // @[Mux.scala 27:72]
  wire  _T_1146 = _T_1145 | _T_1090; // @[Mux.scala 27:72]
  wire  _T_1147 = _T_1146 | _T_1091; // @[Mux.scala 27:72]
  wire  _T_1148 = _T_1147 | _T_1092; // @[Mux.scala 27:72]
  wire  _T_1149 = _T_1148 | _T_1093; // @[Mux.scala 27:72]
  wire  _T_1150 = _T_1149 | _T_1094; // @[Mux.scala 27:72]
  wire  _T_1151 = _T_1150 | _T_1095; // @[Mux.scala 27:72]
  wire  _T_1152 = _T_1151 | _T_1096; // @[Mux.scala 27:72]
  wire  _T_1153 = _T_1152 | _T_1097; // @[Mux.scala 27:72]
  wire  _T_1154 = _T_1153 | _T_1098; // @[Mux.scala 27:72]
  wire  _T_1155 = _T_1154 | _T_1099; // @[Mux.scala 27:72]
  wire  _T_1156 = _T_1155 | _T_1079; // @[Mux.scala 27:72]
  wire  _T_1157 = _T_1156 | _T_1101; // @[Mux.scala 27:72]
  wire  _T_1158 = _T_1157 | _T_1102; // @[Mux.scala 27:72]
  wire  _T_1159 = _T_1158 | _T_1103; // @[Mux.scala 27:72]
  wire  _T_1160 = _T_1159 | _T_1104; // @[Mux.scala 27:72]
  wire  _T_1161 = _T_1160 | _T_1105; // @[Mux.scala 27:72]
  wire  _T_1162 = _T_1161 | _T_1106; // @[Mux.scala 27:72]
  wire  _T_1163 = _T_1162 | _T_1107; // @[Mux.scala 27:72]
  wire  _T_1164 = _T_1163 | _T_1108; // @[Mux.scala 27:72]
  wire  _T_1165 = _T_1164 | _T_1109; // @[Mux.scala 27:72]
  wire  _T_1166 = _T_1165 | _T_1110; // @[Mux.scala 27:72]
  wire  _T_1167 = _T_1166 | _T_1111; // @[Mux.scala 27:72]
  wire  _T_1168 = _T_1167 | _T_1112; // @[Mux.scala 27:72]
  wire  _T_1169 = _T_1168 | _T_1113; // @[Mux.scala 27:72]
  wire  _T_1170 = _T_1169 | _T_1114; // @[Mux.scala 27:72]
  wire  _T_1171 = _T_1170 | _T_1115; // @[Mux.scala 27:72]
  wire  _T_1172 = _T_1171 | _T_1116; // @[Mux.scala 27:72]
  wire  _T_1173 = _T_1172 | _T_1117; // @[Mux.scala 27:72]
  wire  _T_1174 = _T_1173 | _T_1118; // @[Mux.scala 27:72]
  wire  _T_1175 = _T_1174 | _T_1119; // @[Mux.scala 27:72]
  wire  _T_1176 = _T_1175 | _T_1120; // @[Mux.scala 27:72]
  wire  _T_1177 = _T_1176 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1178 = _T_1177 | _T_1122; // @[Mux.scala 27:72]
  wire  _T_1179 = _T_1178 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1180 = _T_1179 | _T_1124; // @[Mux.scala 27:72]
  wire  _T_1181 = _T_1180 | _T_1125; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1181 | _T_1126; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1182 | _T_1127; // @[Mux.scala 27:72]
  reg  _T_1189; // @[Reg.scala 27:20]
  wire  _T_1187 = io_mdseac_locked_ns ^ _T_1189; // @[lib.scala 470:21]
  wire  _T_1188 = |_T_1187; // @[lib.scala 470:29]
  reg  _T_1193; // @[Reg.scala 27:20]
  wire  _T_1191 = io_lsu_single_ecc_error_r ^ _T_1193; // @[lib.scala 470:21]
  wire  _T_1192 = |_T_1191; // @[lib.scala 470:29]
  reg  _T_1201; // @[Reg.scala 27:20]
  wire  _T_1199 = io_lsu_i0_exc_r ^ _T_1201; // @[lib.scala 470:21]
  wire  _T_1200 = |_T_1199; // @[lib.scala 470:29]
  reg  _T_1205; // @[Reg.scala 27:20]
  wire  _T_1203 = io_take_ext_int_start ^ _T_1205; // @[lib.scala 470:21]
  wire  _T_1204 = |_T_1203; // @[lib.scala 470:29]
  reg  _T_1209; // @[Reg.scala 27:20]
  wire  _T_1207 = io_take_ext_int_start_d1 ^ _T_1209; // @[lib.scala 470:21]
  wire  _T_1208 = |_T_1207; // @[lib.scala 470:29]
  reg  _T_1213; // @[Reg.scala 27:20]
  wire  _T_1211 = io_take_ext_int_start_d2 ^ _T_1213; // @[lib.scala 470:21]
  wire  _T_1212 = |_T_1211; // @[lib.scala 470:29]
  reg  _T_1217; // @[Reg.scala 27:20]
  wire  _T_1215 = io_ext_int_freeze ^ _T_1217; // @[lib.scala 470:21]
  wire  _T_1216 = |_T_1215; // @[lib.scala 470:29]
  reg [5:0] _T_1221; // @[Reg.scala 27:20]
  wire [5:0] _T_1219 = io_mip_ns ^ _T_1221; // @[lib.scala 448:21]
  wire  _T_1220 = |_T_1219; // @[lib.scala 448:29]
  wire  _T_1222 = ~io_wr_mcycleh_r; // @[dec_tlu_ctl.scala 2879:80]
  wire  _T_1223 = io_mcyclel_cout & _T_1222; // @[dec_tlu_ctl.scala 2879:78]
  wire  _T_1224 = _T_1223 & io_mcyclel_cout_in; // @[dec_tlu_ctl.scala 2879:97]
  reg  _T_1228; // @[Reg.scala 27:20]
  wire  _T_1226 = _T_1224 ^ _T_1228; // @[lib.scala 470:21]
  wire  _T_1227 = |_T_1226; // @[lib.scala 470:29]
  reg  _T_1232; // @[Reg.scala 27:20]
  wire  _T_1230 = io_minstret_enable ^ _T_1232; // @[lib.scala 470:21]
  wire  _T_1231 = |_T_1230; // @[lib.scala 470:29]
  reg  _T_1236; // @[Reg.scala 27:20]
  wire  _T_1234 = io_minstretl_cout_ns ^ _T_1236; // @[lib.scala 470:21]
  wire  _T_1235 = |_T_1234; // @[lib.scala 470:29]
  reg [3:0] _T_1244; // @[Reg.scala 27:20]
  wire [3:0] _T_1242 = io_meicidpl_ns ^ _T_1244; // @[lib.scala 448:21]
  wire  _T_1243 = |_T_1242; // @[lib.scala 448:29]
  reg  _T_1248; // @[Reg.scala 27:20]
  wire  _T_1246 = io_icache_rd_valid ^ _T_1248; // @[lib.scala 470:21]
  wire  _T_1247 = |_T_1246; // @[lib.scala 470:29]
  reg  _T_1252; // @[Reg.scala 27:20]
  wire  _T_1250 = io_icache_wr_valid ^ _T_1252; // @[lib.scala 470:21]
  wire  _T_1251 = |_T_1250; // @[lib.scala 470:29]
  reg  _T_1266_0; // @[Reg.scala 27:20]
  wire  _T_1254 = io_mhpmc_inc_r_0 ^ _T_1266_0; // @[lib.scala 518:68]
  wire  _T_1255 = |_T_1254; // @[lib.scala 518:82]
  reg  _T_1266_1; // @[Reg.scala 27:20]
  wire  _T_1256 = io_mhpmc_inc_r_1 ^ _T_1266_1; // @[lib.scala 518:68]
  wire  _T_1257 = |_T_1256; // @[lib.scala 518:82]
  reg  _T_1266_2; // @[Reg.scala 27:20]
  wire  _T_1258 = io_mhpmc_inc_r_2 ^ _T_1266_2; // @[lib.scala 518:68]
  wire  _T_1259 = |_T_1258; // @[lib.scala 518:82]
  reg  _T_1266_3; // @[Reg.scala 27:20]
  wire  _T_1260 = io_mhpmc_inc_r_3 ^ _T_1266_3; // @[lib.scala 518:68]
  wire  _T_1261 = |_T_1260; // @[lib.scala 518:82]
  wire  _T_1262 = _T_1255 | _T_1257; // @[lib.scala 518:97]
  wire  _T_1263 = _T_1262 | _T_1259; // @[lib.scala 518:97]
  wire  _T_1264 = _T_1263 | _T_1261; // @[lib.scala 518:97]
  reg  _T_1270; // @[Reg.scala 27:20]
  wire  _T_1268 = io_perfcnt_halted ^ _T_1270; // @[lib.scala 470:21]
  wire  _T_1269 = |_T_1268; // @[lib.scala 470:29]
  reg [1:0] _T_1274; // @[Reg.scala 27:20]
  wire [1:0] _T_1272 = io_mstatus_ns ^ _T_1274; // @[lib.scala 448:21]
  wire  _T_1273 = |_T_1272; // @[lib.scala 448:29]
  assign io_mhpmc_inc_r_0 = _T_3 & _T_295; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mhpmc_inc_r_1 = _T_299 & _T_591; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mhpmc_inc_r_2 = _T_595 & _T_887; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mhpmc_inc_r_3 = _T_891 & _T_1183; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mstatus = _T_1274; // @[dec_tlu_ctl.scala 2888:52]
  assign io_mcyclel_cout_f = _T_1228; // @[dec_tlu_ctl.scala 2879:52]
  assign io_minstret_enable_f = _T_1232; // @[dec_tlu_ctl.scala 2880:52]
  assign io_minstretl_cout_f = _T_1236; // @[dec_tlu_ctl.scala 2881:52]
  assign io_meicidpl = _T_1244; // @[dec_tlu_ctl.scala 2883:52]
  assign io_icache_rd_valid_f = _T_1248; // @[dec_tlu_ctl.scala 2884:52]
  assign io_icache_wr_valid_f = _T_1252; // @[dec_tlu_ctl.scala 2885:52]
  assign io_mhpmc_inc_r_d1_0 = _T_1266_0; // @[dec_tlu_ctl.scala 2886:52]
  assign io_mhpmc_inc_r_d1_1 = _T_1266_1; // @[dec_tlu_ctl.scala 2886:52]
  assign io_mhpmc_inc_r_d1_2 = _T_1266_2; // @[dec_tlu_ctl.scala 2886:52]
  assign io_mhpmc_inc_r_d1_3 = _T_1266_3; // @[dec_tlu_ctl.scala 2886:52]
  assign io_perfcnt_halted_d1 = _T_1270; // @[dec_tlu_ctl.scala 2887:52]
  assign io_mdseac_locked_f = _T_1189; // @[dec_tlu_ctl.scala 2870:52]
  assign io_lsu_single_ecc_error_r_d1 = _T_1193; // @[dec_tlu_ctl.scala 2871:52]
  assign io_lsu_i0_exc_r_d1 = _T_1201; // @[dec_tlu_ctl.scala 2873:52]
  assign io_take_ext_int_start_d1 = _T_1205; // @[dec_tlu_ctl.scala 2874:52]
  assign io_take_ext_int_start_d2 = _T_1209; // @[dec_tlu_ctl.scala 2875:52]
  assign io_take_ext_int_start_d3 = _T_1213; // @[dec_tlu_ctl.scala 2876:52]
  assign io_ext_int_freeze_d1 = _T_1217; // @[dec_tlu_ctl.scala 2877:52]
  assign io_mip = _T_1221; // @[dec_tlu_ctl.scala 2878:52]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_1189 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1193 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1201 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1205 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1209 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1213 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1217 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1221 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  _T_1228 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_1232 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_1236 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_1244 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  _T_1248 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_1252 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_1266_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_1266_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_1266_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1266_3 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_1270 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_1274 = _RAND_19[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1189 = 1'h0;
  end
  if (reset) begin
    _T_1193 = 1'h0;
  end
  if (reset) begin
    _T_1201 = 1'h0;
  end
  if (reset) begin
    _T_1205 = 1'h0;
  end
  if (reset) begin
    _T_1209 = 1'h0;
  end
  if (reset) begin
    _T_1213 = 1'h0;
  end
  if (reset) begin
    _T_1217 = 1'h0;
  end
  if (reset) begin
    _T_1221 = 6'h0;
  end
  if (reset) begin
    _T_1228 = 1'h0;
  end
  if (reset) begin
    _T_1232 = 1'h0;
  end
  if (reset) begin
    _T_1236 = 1'h0;
  end
  if (reset) begin
    _T_1244 = 4'h0;
  end
  if (reset) begin
    _T_1248 = 1'h0;
  end
  if (reset) begin
    _T_1252 = 1'h0;
  end
  if (reset) begin
    _T_1266_0 = 1'h0;
  end
  if (reset) begin
    _T_1266_1 = 1'h0;
  end
  if (reset) begin
    _T_1266_2 = 1'h0;
  end
  if (reset) begin
    _T_1266_3 = 1'h0;
  end
  if (reset) begin
    _T_1270 = 1'h0;
  end
  if (reset) begin
    _T_1274 = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1189 <= 1'h0;
    end else if (_T_1188) begin
      _T_1189 <= io_mdseac_locked_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1193 <= 1'h0;
    end else if (_T_1192) begin
      _T_1193 <= io_lsu_single_ecc_error_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1201 <= 1'h0;
    end else if (_T_1200) begin
      _T_1201 <= io_lsu_i0_exc_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1205 <= 1'h0;
    end else if (_T_1204) begin
      _T_1205 <= io_take_ext_int_start;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1209 <= 1'h0;
    end else if (_T_1208) begin
      _T_1209 <= io_take_ext_int_start_d1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1213 <= 1'h0;
    end else if (_T_1212) begin
      _T_1213 <= io_take_ext_int_start_d2;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1217 <= 1'h0;
    end else if (_T_1216) begin
      _T_1217 <= io_ext_int_freeze;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1221 <= 6'h0;
    end else if (_T_1220) begin
      _T_1221 <= io_mip_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1228 <= 1'h0;
    end else if (_T_1227) begin
      _T_1228 <= _T_1224;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1232 <= 1'h0;
    end else if (_T_1231) begin
      _T_1232 <= io_minstret_enable;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1236 <= 1'h0;
    end else if (_T_1235) begin
      _T_1236 <= io_minstretl_cout_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1244 <= 4'h0;
    end else if (_T_1243) begin
      _T_1244 <= io_meicidpl_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1248 <= 1'h0;
    end else if (_T_1247) begin
      _T_1248 <= io_icache_rd_valid;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1252 <= 1'h0;
    end else if (_T_1251) begin
      _T_1252 <= io_icache_wr_valid;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_0 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_0 <= io_mhpmc_inc_r_0;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_1 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_1 <= io_mhpmc_inc_r_1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_2 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_2 <= io_mhpmc_inc_r_2;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_3 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_3 <= io_mhpmc_inc_r_3;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1270 <= 1'h0;
    end else if (_T_1269) begin
      _T_1270 <= io_perfcnt_halted;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1274 <= 2'h0;
    end else if (_T_1273) begin
      _T_1274 <= io_mstatus_ns;
    end
  end
endmodule
module rvclkhdr(
  input   io_clk,
  input   io_en
);
  wire  clkhdr_Q; // @[lib.scala 334:26]
  wire  clkhdr_CK; // @[lib.scala 334:26]
  wire  clkhdr_EN; // @[lib.scala 334:26]
  wire  clkhdr_SE; // @[lib.scala 334:26]
  gated_latch clkhdr ( // @[lib.scala 334:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module perf_csr(
  input         clock,
  input         reset,
  input         io_free_l2clk,
  input         io_dec_tlu_dbg_halted,
  input  [15:0] io_dcsr,
  input         io_dec_tlu_pmu_fw_halted,
  input  [9:0]  io_mhpme_vec_0,
  input  [9:0]  io_mhpme_vec_1,
  input  [9:0]  io_mhpme_vec_2,
  input  [9:0]  io_mhpme_vec_3,
  input         io_dec_csr_wen_r_mod,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_mhpmc_inc_r_0,
  input         io_mhpmc_inc_r_1,
  input         io_mhpmc_inc_r_2,
  input         io_mhpmc_inc_r_3,
  input         io_mhpmc_inc_r_d1_0,
  input         io_mhpmc_inc_r_d1_1,
  input         io_mhpmc_inc_r_d1_2,
  input         io_mhpmc_inc_r_d1_3,
  input         io_perfcnt_halted_d1,
  output [31:0] io_mhpmc3h,
  output [31:0] io_mhpmc3,
  output [31:0] io_mhpmc4h,
  output [31:0] io_mhpmc4,
  output [31:0] io_mhpmc5h,
  output [31:0] io_mhpmc5,
  output [31:0] io_mhpmc6h,
  output [31:0] io_mhpmc6,
  output [9:0]  io_mhpme3,
  output [9:0]  io_mhpme4,
  output [9:0]  io_mhpme5,
  output [9:0]  io_mhpme6,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 404:23]
  wire  _T_1 = io_dec_tlu_dbg_halted & io_dcsr[10]; // @[dec_tlu_ctl.scala 2578:54]
  wire  perfcnt_halted = _T_1 | io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2578:77]
  wire  _T_4 = ~_T_1; // @[dec_tlu_ctl.scala 2579:44]
  wire [3:0] _T_6 = _T_4 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_13 = {io_mhpme_vec_3[9],io_mhpme_vec_2[9],io_mhpme_vec_1[9],io_mhpme_vec_0[9]}; // @[Cat.scala 29:58]
  wire [3:0] perfcnt_during_sleep = _T_6 & _T_13; // @[dec_tlu_ctl.scala 2579:93]
  wire  _T_15 = ~perfcnt_during_sleep[0]; // @[dec_tlu_ctl.scala 2582:80]
  wire  _T_16 = io_perfcnt_halted_d1 & _T_15; // @[dec_tlu_ctl.scala 2582:78]
  wire  _T_17 = ~_T_16; // @[dec_tlu_ctl.scala 2582:55]
  wire  _T_20 = ~perfcnt_during_sleep[1]; // @[dec_tlu_ctl.scala 2583:80]
  wire  _T_21 = io_perfcnt_halted_d1 & _T_20; // @[dec_tlu_ctl.scala 2583:78]
  wire  _T_22 = ~_T_21; // @[dec_tlu_ctl.scala 2583:55]
  wire  _T_25 = ~perfcnt_during_sleep[2]; // @[dec_tlu_ctl.scala 2584:80]
  wire  _T_26 = io_perfcnt_halted_d1 & _T_25; // @[dec_tlu_ctl.scala 2584:78]
  wire  _T_27 = ~_T_26; // @[dec_tlu_ctl.scala 2584:55]
  wire  _T_30 = ~perfcnt_during_sleep[3]; // @[dec_tlu_ctl.scala 2585:80]
  wire  _T_31 = io_perfcnt_halted_d1 & _T_30; // @[dec_tlu_ctl.scala 2585:78]
  wire  _T_32 = ~_T_31; // @[dec_tlu_ctl.scala 2585:55]
  wire  _T_35 = io_dec_csr_wraddr_r == 12'hb03; // @[dec_tlu_ctl.scala 2591:79]
  wire  mhpmc3_wr_en0 = io_dec_csr_wen_r_mod & _T_35; // @[dec_tlu_ctl.scala 2591:50]
  wire  _T_36 = ~perfcnt_halted; // @[dec_tlu_ctl.scala 2592:30]
  wire  _T_38 = _T_36 | perfcnt_during_sleep[0]; // @[dec_tlu_ctl.scala 2592:46]
  wire  _T_39 = |io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 2592:96]
  wire  mhpmc3_wr_en1 = _T_38 & _T_39; // @[dec_tlu_ctl.scala 2592:73]
  wire  mhpmc3_wr_en = mhpmc3_wr_en0 | mhpmc3_wr_en1; // @[dec_tlu_ctl.scala 2593:43]
  wire [63:0] _T_42 = {io_mhpmc3h,io_mhpmc3}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc3_incr = _T_42 + 64'h1; // @[dec_tlu_ctl.scala 2596:65]
  reg [31:0] _T_48; // @[Reg.scala 27:20]
  wire  _T_50 = io_dec_csr_wraddr_r == 12'hb83; // @[dec_tlu_ctl.scala 2601:80]
  wire  mhpmc3h_wr_en0 = io_dec_csr_wen_r_mod & _T_50; // @[dec_tlu_ctl.scala 2601:51]
  wire  mhpmc3h_wr_en = mhpmc3h_wr_en0 | mhpmc3_wr_en1; // @[dec_tlu_ctl.scala 2602:45]
  reg [31:0] _T_54; // @[Reg.scala 27:20]
  wire  _T_56 = io_dec_csr_wraddr_r == 12'hb04; // @[dec_tlu_ctl.scala 2612:79]
  wire  mhpmc4_wr_en0 = io_dec_csr_wen_r_mod & _T_56; // @[dec_tlu_ctl.scala 2612:50]
  wire  _T_59 = _T_36 | perfcnt_during_sleep[1]; // @[dec_tlu_ctl.scala 2613:46]
  wire  _T_60 = |io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 2613:96]
  wire  mhpmc4_wr_en1 = _T_59 & _T_60; // @[dec_tlu_ctl.scala 2613:73]
  wire  mhpmc4_wr_en = mhpmc4_wr_en0 | mhpmc4_wr_en1; // @[dec_tlu_ctl.scala 2614:43]
  wire [63:0] _T_63 = {io_mhpmc4h,io_mhpmc4}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc4_incr = _T_63 + 64'h1; // @[dec_tlu_ctl.scala 2618:65]
  reg [31:0] _T_70; // @[Reg.scala 27:20]
  wire  _T_72 = io_dec_csr_wraddr_r == 12'hb84; // @[dec_tlu_ctl.scala 2622:80]
  wire  mhpmc4h_wr_en0 = io_dec_csr_wen_r_mod & _T_72; // @[dec_tlu_ctl.scala 2622:51]
  wire  mhpmc4h_wr_en = mhpmc4h_wr_en0 | mhpmc4_wr_en1; // @[dec_tlu_ctl.scala 2623:45]
  reg [31:0] _T_76; // @[Reg.scala 27:20]
  wire  _T_78 = io_dec_csr_wraddr_r == 12'hb05; // @[dec_tlu_ctl.scala 2631:79]
  wire  mhpmc5_wr_en0 = io_dec_csr_wen_r_mod & _T_78; // @[dec_tlu_ctl.scala 2631:50]
  wire  _T_81 = _T_36 | perfcnt_during_sleep[2]; // @[dec_tlu_ctl.scala 2632:46]
  wire  _T_82 = |io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 2632:96]
  wire  mhpmc5_wr_en1 = _T_81 & _T_82; // @[dec_tlu_ctl.scala 2632:73]
  wire  mhpmc5_wr_en = mhpmc5_wr_en0 | mhpmc5_wr_en1; // @[dec_tlu_ctl.scala 2633:43]
  wire [63:0] _T_85 = {io_mhpmc5h,io_mhpmc5}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc5_incr = _T_85 + 64'h1; // @[dec_tlu_ctl.scala 2635:65]
  reg [31:0] _T_91; // @[Reg.scala 27:20]
  wire  _T_93 = io_dec_csr_wraddr_r == 12'hb85; // @[dec_tlu_ctl.scala 2640:80]
  wire  mhpmc5h_wr_en0 = io_dec_csr_wen_r_mod & _T_93; // @[dec_tlu_ctl.scala 2640:51]
  wire  mhpmc5h_wr_en = mhpmc5h_wr_en0 | mhpmc5_wr_en1; // @[dec_tlu_ctl.scala 2641:45]
  reg [31:0] _T_97; // @[Reg.scala 27:20]
  wire  _T_99 = io_dec_csr_wraddr_r == 12'hb06; // @[dec_tlu_ctl.scala 2651:79]
  wire  mhpmc6_wr_en0 = io_dec_csr_wen_r_mod & _T_99; // @[dec_tlu_ctl.scala 2651:50]
  wire  _T_102 = _T_36 | perfcnt_during_sleep[3]; // @[dec_tlu_ctl.scala 2652:46]
  wire  _T_103 = |io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 2652:96]
  wire  mhpmc6_wr_en1 = _T_102 & _T_103; // @[dec_tlu_ctl.scala 2652:73]
  wire  mhpmc6_wr_en = mhpmc6_wr_en0 | mhpmc6_wr_en1; // @[dec_tlu_ctl.scala 2653:43]
  wire [63:0] _T_106 = {io_mhpmc6h,io_mhpmc6}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc6_incr = _T_106 + 64'h1; // @[dec_tlu_ctl.scala 2655:65]
  reg [31:0] _T_112; // @[Reg.scala 27:20]
  wire  _T_114 = io_dec_csr_wraddr_r == 12'hb86; // @[dec_tlu_ctl.scala 2661:80]
  wire  mhpmc6h_wr_en0 = io_dec_csr_wen_r_mod & _T_114; // @[dec_tlu_ctl.scala 2661:51]
  wire  mhpmc6h_wr_en = mhpmc6h_wr_en0 | mhpmc6_wr_en1; // @[dec_tlu_ctl.scala 2662:45]
  reg [31:0] _T_118; // @[Reg.scala 27:20]
  wire  _T_120 = io_dec_csr_wrdata_r[9:0] > 10'h204; // @[dec_tlu_ctl.scala 2671:56]
  wire  _T_122 = |io_dec_csr_wrdata_r[31:10]; // @[dec_tlu_ctl.scala 2671:102]
  wire  _T_123 = _T_120 | _T_122; // @[dec_tlu_ctl.scala 2671:72]
  wire  _T_125 = io_dec_csr_wrdata_r[9:0] < 10'h200; // @[dec_tlu_ctl.scala 2672:44]
  wire  _T_127 = io_dec_csr_wrdata_r[9:0] > 10'h38; // @[dec_tlu_ctl.scala 2672:88]
  wire  _T_128 = _T_125 & _T_127; // @[dec_tlu_ctl.scala 2672:60]
  wire  _T_129 = _T_123 | _T_128; // @[dec_tlu_ctl.scala 2671:107]
  wire  _T_131 = io_dec_csr_wrdata_r[9:0] < 10'h36; // @[dec_tlu_ctl.scala 2673:44]
  wire  _T_133 = io_dec_csr_wrdata_r[9:0] > 10'h32; // @[dec_tlu_ctl.scala 2673:88]
  wire  _T_134 = _T_131 & _T_133; // @[dec_tlu_ctl.scala 2673:60]
  wire  _T_135 = _T_129 | _T_134; // @[dec_tlu_ctl.scala 2672:103]
  wire  _T_137 = io_dec_csr_wrdata_r[9:0] == 10'h1d; // @[dec_tlu_ctl.scala 2674:43]
  wire  _T_138 = _T_135 | _T_137; // @[dec_tlu_ctl.scala 2673:103]
  wire  _T_140 = io_dec_csr_wrdata_r[9:0] == 10'h21; // @[dec_tlu_ctl.scala 2674:87]
  wire  zero_event_r = _T_138 | _T_140; // @[dec_tlu_ctl.scala 2674:59]
  wire  _T_143 = io_dec_csr_wraddr_r == 12'h323; // @[dec_tlu_ctl.scala 2677:77]
  wire  wr_mhpme3_r = io_dec_csr_wen_r_mod & _T_143; // @[dec_tlu_ctl.scala 2677:48]
  reg [9:0] _T_145; // @[Reg.scala 27:20]
  wire  _T_147 = io_dec_csr_wraddr_r == 12'h324; // @[dec_tlu_ctl.scala 2684:77]
  wire  wr_mhpme4_r = io_dec_csr_wen_r_mod & _T_147; // @[dec_tlu_ctl.scala 2684:48]
  reg [9:0] _T_149; // @[Reg.scala 27:20]
  wire  _T_151 = io_dec_csr_wraddr_r == 12'h325; // @[dec_tlu_ctl.scala 2691:77]
  wire  wr_mhpme5_r = io_dec_csr_wen_r_mod & _T_151; // @[dec_tlu_ctl.scala 2691:48]
  reg [9:0] _T_153; // @[Reg.scala 27:20]
  wire  _T_155 = io_dec_csr_wraddr_r == 12'h326; // @[dec_tlu_ctl.scala 2698:77]
  wire  wr_mhpme6_r = io_dec_csr_wen_r_mod & _T_155; // @[dec_tlu_ctl.scala 2698:48]
  reg [9:0] _T_157; // @[Reg.scala 27:20]
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  assign io_mhpmc3h = _T_54; // @[dec_tlu_ctl.scala 2605:20]
  assign io_mhpmc3 = _T_48; // @[dec_tlu_ctl.scala 2599:19]
  assign io_mhpmc4h = _T_76; // @[dec_tlu_ctl.scala 2625:20]
  assign io_mhpmc4 = _T_70; // @[dec_tlu_ctl.scala 2620:19]
  assign io_mhpmc5h = _T_97; // @[dec_tlu_ctl.scala 2644:20]
  assign io_mhpmc5 = _T_91; // @[dec_tlu_ctl.scala 2638:19]
  assign io_mhpmc6h = _T_118; // @[dec_tlu_ctl.scala 2665:20]
  assign io_mhpmc6 = _T_112; // @[dec_tlu_ctl.scala 2659:19]
  assign io_mhpme3 = _T_145; // @[dec_tlu_ctl.scala 2679:19]
  assign io_mhpme4 = _T_149; // @[dec_tlu_ctl.scala 2685:19]
  assign io_mhpme5 = _T_153; // @[dec_tlu_ctl.scala 2692:19]
  assign io_mhpme6 = _T_157; // @[dec_tlu_ctl.scala 2699:19]
  assign io_dec_tlu_perfcnt0 = io_mhpmc_inc_r_d1_0 & _T_17; // @[dec_tlu_ctl.scala 2582:29]
  assign io_dec_tlu_perfcnt1 = io_mhpmc_inc_r_d1_1 & _T_22; // @[dec_tlu_ctl.scala 2583:29]
  assign io_dec_tlu_perfcnt2 = io_mhpmc_inc_r_d1_2 & _T_27; // @[dec_tlu_ctl.scala 2584:29]
  assign io_dec_tlu_perfcnt3 = io_mhpmc_inc_r_d1_3 & _T_32; // @[dec_tlu_ctl.scala 2585:29]
  assign rvclkhdr_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = mhpmc3_wr_en0 | mhpmc3_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = mhpmc3h_wr_en0 | mhpmc3_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = mhpmc4_wr_en0 | mhpmc4_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = mhpmc4h_wr_en0 | mhpmc4_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = mhpmc5_wr_en0 | mhpmc5_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = mhpmc5h_wr_en0 | mhpmc5_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = mhpmc6_wr_en0 | mhpmc6_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = mhpmc6h_wr_en0 | mhpmc6_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = io_dec_csr_wen_r_mod & _T_143; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = io_dec_csr_wen_r_mod & _T_147; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = io_dec_csr_wen_r_mod & _T_151; // @[lib.scala 407:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_11_io_en = io_dec_csr_wen_r_mod & _T_155; // @[lib.scala 407:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_48 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  _T_54 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  _T_70 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  _T_76 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  _T_91 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_97 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_112 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_118 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_145 = _RAND_8[9:0];
  _RAND_9 = {1{`RANDOM}};
  _T_149 = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  _T_153 = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  _T_157 = _RAND_11[9:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_48 = 32'h0;
  end
  if (reset) begin
    _T_54 = 32'h0;
  end
  if (reset) begin
    _T_70 = 32'h0;
  end
  if (reset) begin
    _T_76 = 32'h0;
  end
  if (reset) begin
    _T_91 = 32'h0;
  end
  if (reset) begin
    _T_97 = 32'h0;
  end
  if (reset) begin
    _T_112 = 32'h0;
  end
  if (reset) begin
    _T_118 = 32'h0;
  end
  if (reset) begin
    _T_145 = 10'h0;
  end
  if (reset) begin
    _T_149 = 10'h0;
  end
  if (reset) begin
    _T_153 = 10'h0;
  end
  if (reset) begin
    _T_157 = 10'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_48 <= 32'h0;
    end else if (mhpmc3_wr_en) begin
      if (mhpmc3_wr_en0) begin
        _T_48 <= io_dec_csr_wrdata_r;
      end else begin
        _T_48 <= mhpmc3_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_54 <= 32'h0;
    end else if (mhpmc3h_wr_en) begin
      if (mhpmc3h_wr_en0) begin
        _T_54 <= io_dec_csr_wrdata_r;
      end else begin
        _T_54 <= mhpmc3_incr[63:32];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_70 <= 32'h0;
    end else if (mhpmc4_wr_en) begin
      if (mhpmc4_wr_en0) begin
        _T_70 <= io_dec_csr_wrdata_r;
      end else begin
        _T_70 <= mhpmc4_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_76 <= 32'h0;
    end else if (mhpmc4h_wr_en) begin
      if (mhpmc4h_wr_en0) begin
        _T_76 <= io_dec_csr_wrdata_r;
      end else begin
        _T_76 <= mhpmc4_incr[63:32];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_91 <= 32'h0;
    end else if (mhpmc5_wr_en) begin
      if (mhpmc5_wr_en0) begin
        _T_91 <= io_dec_csr_wrdata_r;
      end else begin
        _T_91 <= mhpmc5_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_97 <= 32'h0;
    end else if (mhpmc5h_wr_en) begin
      if (mhpmc5h_wr_en0) begin
        _T_97 <= io_dec_csr_wrdata_r;
      end else begin
        _T_97 <= mhpmc5_incr[63:32];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_112 <= 32'h0;
    end else if (mhpmc6_wr_en) begin
      if (mhpmc6_wr_en0) begin
        _T_112 <= io_dec_csr_wrdata_r;
      end else begin
        _T_112 <= mhpmc6_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_118 <= 32'h0;
    end else if (mhpmc6h_wr_en) begin
      if (mhpmc6h_wr_en0) begin
        _T_118 <= io_dec_csr_wrdata_r;
      end else begin
        _T_118 <= mhpmc6_incr[63:32];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_145 <= 10'h0;
    end else if (wr_mhpme3_r) begin
      if (zero_event_r) begin
        _T_145 <= 10'h0;
      end else begin
        _T_145 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_149 <= 10'h0;
    end else if (wr_mhpme4_r) begin
      if (zero_event_r) begin
        _T_149 <= 10'h0;
      end else begin
        _T_149 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_153 <= 10'h0;
    end else if (wr_mhpme5_r) begin
      if (zero_event_r) begin
        _T_153 <= 10'h0;
      end else begin
        _T_153 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_157 <= 10'h0;
    end else if (wr_mhpme6_r) begin
      if (zero_event_r) begin
        _T_157 <= 10'h0;
      end else begin
        _T_157 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
endmodule
module csr_tlu(
  input         clock,
  input         reset,
  input         io_free_l2clk,
  input         io_free_clk,
  input  [31:0] io_dec_csr_wrdata_r,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [11:0] io_dec_csr_rdaddr_d,
  input         io_dec_csr_wen_unq_d,
  input         io_dec_i0_decode_d,
  output [70:0] io_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_dec_tlu_ic_diag_pkt_icache_wr_valid,
  input         io_ifu_ic_debug_rd_data_valid,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_pkt,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_pkt,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_pkt,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_pkt,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_ifu_pmu_bus_trxn,
  input         io_dma_iccm_stall_any,
  input         io_dma_dccm_stall_any,
  input         io_lsu_store_stall_any,
  input         io_dec_pmu_presync_stall,
  input         io_dec_pmu_postsync_stall,
  input         io_dec_pmu_decode_stall,
  input         io_ifu_pmu_fetch_stall,
  input  [1:0]  io_dec_tlu_packet_r_icaf_type,
  input  [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  input         io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input         io_dec_tlu_packet_r_pmu_divide,
  input         io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input         io_exu_pmu_i0_br_ataken,
  input         io_exu_pmu_i0_br_misp,
  input         io_dec_pmu_instr_decoded,
  input         io_ifu_pmu_instr_aligned,
  input         io_exu_pmu_i0_pc4,
  input         io_ifu_pmu_ic_miss,
  input         io_ifu_pmu_ic_hit,
  output        io_dec_tlu_int_valid_wb1,
  output        io_dec_tlu_i0_exc_valid_wb1,
  output        io_dec_tlu_i0_valid_wb1,
  input         io_dec_csr_wen_r,
  output [31:0] io_dec_tlu_mtval_wb1,
  output [4:0]  io_dec_tlu_exc_cause_wb1,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  input         io_dec_tlu_dbg_halted,
  input         io_dma_pmu_dccm_write,
  input         io_dma_pmu_dccm_read,
  input         io_dma_pmu_any_write,
  input         io_dma_pmu_any_read,
  input         io_lsu_pmu_bus_busy,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input         io_dec_tlu_i0_valid_r,
  input         io_dec_csr_any_unq_d,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_picio_clk_override,
  output        io_dec_tlu_dec_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override,
  output [31:0] io_dec_csr_rddata_d,
  output        io_dec_tlu_pipelining_disable,
  output        io_dec_tlu_wr_pause_r,
  input         io_ifu_pmu_bus_busy,
  input         io_lsu_pmu_bus_error,
  input         io_ifu_pmu_bus_error,
  input         io_lsu_pmu_bus_misaligned,
  input         io_lsu_pmu_bus_trxn,
  input  [70:0] io_ifu_ic_debug_rd_data,
  output [3:0]  io_dec_tlu_meipt,
  input  [3:0]  io_pic_pl,
  output [3:0]  io_dec_tlu_meicurpl,
  output [29:0] io_dec_tlu_meihap,
  input  [7:0]  io_pic_claimid,
  input         io_iccm_dma_sb_error,
  input  [31:0] io_lsu_imprecise_error_addr_any,
  input         io_lsu_imprecise_error_load_any,
  input         io_lsu_imprecise_error_store_any,
  output [31:0] io_dec_tlu_mrac_ff,
  output        io_dec_tlu_wb_coalescing_disable,
  output        io_dec_tlu_bpred_disable,
  output        io_dec_tlu_sideeffect_posted_disable,
  output        io_dec_tlu_core_ecc_disable,
  output        io_dec_tlu_external_ldfwd_disable,
  output [2:0]  io_dec_tlu_dma_qos_prty,
  output        io_dec_tlu_trace_disable,
  input  [31:0] io_dec_illegal_inst,
  input  [3:0]  io_lsu_error_pkt_r_bits_mscause,
  input         io_mexintpend,
  input  [30:0] io_exu_npc_r,
  input         io_mpc_reset_run_req,
  input  [30:0] io_rst_vec,
  input  [27:0] io_core_id,
  input  [31:0] io_dec_timer_rddata_d,
  input         io_dec_timer_read_d,
  output        io_dec_csr_wen_r_mod,
  input         io_rfpc_i0_r,
  input         io_i0_trigger_hit_r,
  output        io_fw_halt_req,
  output [1:0]  io_mstatus,
  input         io_exc_or_int_valid_r,
  input         io_mret_r,
  output        io_mstatus_mie_ns,
  input         io_dcsr_single_step_running_f,
  output [15:0] io_dcsr,
  output [30:0] io_mtvec,
  output [5:0]  io_mip,
  input         io_dec_timer_t0_pulse,
  input         io_dec_timer_t1_pulse,
  input         io_timer_int_sync,
  input         io_soft_int_sync,
  output [5:0]  io_mie_ns,
  input         io_csr_wr_clk,
  input         io_ebreak_to_debug_mode_r,
  input         io_dec_tlu_pmu_fw_halted,
  input  [1:0]  io_lsu_fir_error,
  output [30:0] io_npc_r,
  input         io_tlu_flush_lower_r_d1,
  input         io_dec_tlu_flush_noredir_r_d1,
  input  [30:0] io_tlu_flush_path_r_d1,
  output [30:0] io_npc_r_d1,
  input         io_reset_delayed,
  output [30:0] io_mepc,
  input         io_interrupt_valid_r,
  input         io_i0_exception_valid_r,
  input         io_lsu_exc_valid_r,
  input         io_mepc_trigger_hit_sel_pc_r,
  input         io_lsu_single_ecc_error_r,
  input         io_e4e5_int_clk,
  input         io_lsu_i0_exc_r,
  input         io_inst_acc_r,
  input         io_inst_acc_second_r,
  input         io_take_nmi,
  input  [31:0] io_lsu_error_pkt_addr_r,
  input  [4:0]  io_exc_cause_r,
  input         io_i0_valid_wb,
  input         io_interrupt_valid_r_d1,
  input         io_i0_exception_valid_r_d1,
  input  [4:0]  io_exc_cause_wb,
  input         io_nmi_lsu_store_type,
  input         io_nmi_lsu_load_type,
  input         io_tlu_i0_commit_cmt,
  input         io_ebreak_r,
  input         io_ecall_r,
  input         io_illegal_r,
  output        io_mdseac_locked_ns,
  output        io_mdseac_locked_f,
  input         io_nmi_int_detected_f,
  input         io_internal_dbg_halt_mode_f2,
  input         io_ext_int_freeze,
  output        io_ext_int_freeze_d1,
  output        io_take_ext_int_start_d1,
  output        io_take_ext_int_start_d2,
  output        io_take_ext_int_start_d3,
  input         io_ic_perr_r,
  input         io_iccm_sbecc_r,
  input         io_ifu_miss_state_idle_f,
  input         io_lsu_idle_any_f,
  input         io_dbg_tlu_halted_f,
  input         io_dbg_tlu_halted,
  input         io_debug_halt_req_f,
  output        io_force_halt,
  input         io_take_ext_int_start,
  input         io_trigger_hit_dmode_r_d1,
  input         io_trigger_hit_r_d1,
  input         io_dcsr_single_step_done_f,
  input         io_ebreak_to_debug_mode_r_d1,
  input         io_debug_halt_req,
  input         io_allow_dbg_halt_csr_write,
  input         io_internal_dbg_halt_mode_f,
  input         io_enter_debug_halt_req,
  input         io_internal_dbg_halt_mode,
  input         io_request_debug_mode_done,
  input         io_request_debug_mode_r,
  output [30:0] io_dpc,
  input  [3:0]  io_update_hit_bit_r,
  input         io_take_timer_int,
  input         io_take_int_timer0_int,
  input         io_take_int_timer1_int,
  input         io_take_ext_int,
  input         io_tlu_flush_lower_r,
  input         io_dec_tlu_br0_error_r,
  input         io_dec_tlu_br0_start_error_r,
  input         io_lsu_pmu_load_external_r,
  input         io_lsu_pmu_store_external_r,
  input         io_csr_pkt_csr_misa,
  input         io_csr_pkt_csr_mvendorid,
  input         io_csr_pkt_csr_marchid,
  input         io_csr_pkt_csr_mimpid,
  input         io_csr_pkt_csr_mhartid,
  input         io_csr_pkt_csr_mstatus,
  input         io_csr_pkt_csr_mtvec,
  input         io_csr_pkt_csr_mip,
  input         io_csr_pkt_csr_mie,
  input         io_csr_pkt_csr_mcyclel,
  input         io_csr_pkt_csr_mcycleh,
  input         io_csr_pkt_csr_minstretl,
  input         io_csr_pkt_csr_minstreth,
  input         io_csr_pkt_csr_mscratch,
  input         io_csr_pkt_csr_mepc,
  input         io_csr_pkt_csr_mcause,
  input         io_csr_pkt_csr_mscause,
  input         io_csr_pkt_csr_mtval,
  input         io_csr_pkt_csr_mrac,
  input         io_csr_pkt_csr_mdseac,
  input         io_csr_pkt_csr_meihap,
  input         io_csr_pkt_csr_meivt,
  input         io_csr_pkt_csr_meipt,
  input         io_csr_pkt_csr_meicurpl,
  input         io_csr_pkt_csr_meicidpl,
  input         io_csr_pkt_csr_dcsr,
  input         io_csr_pkt_csr_mcgc,
  input         io_csr_pkt_csr_mfdc,
  input         io_csr_pkt_csr_dpc,
  input         io_csr_pkt_csr_mtsel,
  input         io_csr_pkt_csr_mtdata1,
  input         io_csr_pkt_csr_mtdata2,
  input         io_csr_pkt_csr_mhpmc3,
  input         io_csr_pkt_csr_mhpmc4,
  input         io_csr_pkt_csr_mhpmc5,
  input         io_csr_pkt_csr_mhpmc6,
  input         io_csr_pkt_csr_mhpmc3h,
  input         io_csr_pkt_csr_mhpmc4h,
  input         io_csr_pkt_csr_mhpmc5h,
  input         io_csr_pkt_csr_mhpmc6h,
  input         io_csr_pkt_csr_mhpme3,
  input         io_csr_pkt_csr_mhpme4,
  input         io_csr_pkt_csr_mhpme5,
  input         io_csr_pkt_csr_mhpme6,
  input         io_csr_pkt_csr_mcountinhibit,
  input         io_csr_pkt_csr_mpmc,
  input         io_csr_pkt_csr_micect,
  input         io_csr_pkt_csr_miccmect,
  input         io_csr_pkt_csr_mdccmect,
  input         io_csr_pkt_csr_mfdht,
  input         io_csr_pkt_csr_mfdhs,
  input         io_csr_pkt_csr_dicawics,
  input         io_csr_pkt_csr_dicad0h,
  input         io_csr_pkt_csr_dicad0,
  input         io_csr_pkt_csr_dicad1,
  output [9:0]  io_mtdata1_t_0,
  output [9:0]  io_mtdata1_t_1,
  output [9:0]  io_mtdata1_t_2,
  output [9:0]  io_mtdata1_t_3,
  input  [3:0]  io_trigger_enabled
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
`endif // RANDOMIZE_REG_INIT
  wire  perfmux_flop_reset; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 1455:34]
  wire [6:0] perfmux_flop_io_mcountinhibit; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_0; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_1; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_2; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_3; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_illegal_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 1455:34]
  wire [3:0] perfmux_flop_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_any_read; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_any_write; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 1455:34]
  wire [1:0] perfmux_flop_io_mstatus; // @[dec_tlu_ctl.scala 1455:34]
  wire [5:0] perfmux_flop_io_mie; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_timer_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_br0_error_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_rfpc_i0_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mcyclel_cout_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstret_enable_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstretl_cout_f; // @[dec_tlu_ctl.scala 1455:34]
  wire [3:0] perfmux_flop_io_meicidpl; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_rd_valid_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_wr_valid_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_0; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_2; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_3; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_perfcnt_halted_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_single_ecc_error_r_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_i0_exc_r_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire [5:0] perfmux_flop_io_mip; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mdseac_locked_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_single_ecc_error_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ext_int_freeze; // @[dec_tlu_ctl.scala 1455:34]
  wire [5:0] perfmux_flop_io_mip_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mcyclel_cout; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_wr_mcycleh_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mcyclel_cout_in; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstret_enable; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstretl_cout_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire [3:0] perfmux_flop_io_meicidpl_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_rd_valid; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_wr_valid; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_perfcnt_halted; // @[dec_tlu_ctl.scala 1455:34]
  wire [1:0] perfmux_flop_io_mstatus_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_free_l2clk; // @[dec_tlu_ctl.scala 1455:34]
  wire  perf_csrs_clock; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_reset; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_free_l2clk; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 1456:31]
  wire [15:0] perf_csrs_io_dcsr; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_0; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_1; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_2; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_3; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 1456:31]
  wire [11:0] perf_csrs_io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_0; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_1; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_2; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_3; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_perfcnt_halted_d1; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc3h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc3; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc4h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc4; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc5h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc5; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc6h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc6; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 1456:31]
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_12_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_12_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_13_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_13_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_14_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_14_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_15_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_15_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_16_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_16_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_17_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_17_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_18_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_18_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_19_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_19_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_20_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_20_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_21_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_21_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_22_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_22_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_23_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_23_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_24_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_24_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_25_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_25_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_26_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_26_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_27_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_27_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_28_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_28_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_29_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_29_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_30_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_30_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_31_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_31_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_32_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_32_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_33_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_33_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_34_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_34_io_en; // @[lib.scala 404:23]
  wire  _T = ~io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 1472:52]
  wire  _T_1 = io_dec_csr_wen_r & _T; // @[dec_tlu_ctl.scala 1472:50]
  wire  _T_2 = ~io_rfpc_i0_r; // @[dec_tlu_ctl.scala 1472:75]
  wire  _T_5 = io_dec_csr_wraddr_r == 12'h300; // @[dec_tlu_ctl.scala 1473:78]
  wire  wr_mstatus_r = io_dec_csr_wen_r_mod & _T_5; // @[dec_tlu_ctl.scala 1473:49]
  wire  _T_553 = io_dec_csr_wraddr_r == 12'h7c6; // @[dec_tlu_ctl.scala 1883:69]
  wire  wr_mpmc_r = io_dec_csr_wen_r_mod & _T_553; // @[dec_tlu_ctl.scala 1883:46]
  wire  _T_565 = ~io_dec_csr_wrdata_r[1]; // @[dec_tlu_ctl.scala 1891:44]
  reg  mpmc_b; // @[dec_tlu_ctl.scala 1893:51]
  wire  mpmc = ~mpmc_b; // @[dec_tlu_ctl.scala 1896:17]
  wire  _T_566 = ~mpmc; // @[dec_tlu_ctl.scala 1891:69]
  wire  mpmc_b_ns = wr_mpmc_r ? _T_565 : _T_566; // @[dec_tlu_ctl.scala 1891:25]
  wire  _T_6 = ~mpmc_b_ns; // @[dec_tlu_ctl.scala 1476:35]
  wire  set_mie_pmu_fw_halt = _T_6 & io_fw_halt_req; // @[dec_tlu_ctl.scala 1476:46]
  wire  _T_7 = ~wr_mstatus_r; // @[dec_tlu_ctl.scala 1479:18]
  wire  _T_8 = _T_7 & io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 1479:32]
  wire [1:0] _T_12 = {io_mstatus[0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_13 = wr_mstatus_r & io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 1480:31]
  wire [1:0] _T_16 = {io_dec_csr_wrdata_r[3],1'h0}; // @[Cat.scala 29:58]
  wire  _T_17 = ~io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 1481:30]
  wire  _T_18 = io_mret_r & _T_17; // @[dec_tlu_ctl.scala 1481:28]
  wire [1:0] _T_21 = {1'h1,io_mstatus[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_24 = {io_mstatus[1],1'h1}; // @[Cat.scala 29:58]
  wire  _T_26 = wr_mstatus_r & _T_17; // @[dec_tlu_ctl.scala 1483:31]
  wire [1:0] _T_30 = {io_dec_csr_wrdata_r[7],io_dec_csr_wrdata_r[3]}; // @[Cat.scala 29:58]
  wire  _T_33 = _T_7 & _T_17; // @[dec_tlu_ctl.scala 1484:32]
  wire  _T_34 = ~io_mret_r; // @[dec_tlu_ctl.scala 1484:59]
  wire  _T_35 = _T_33 & _T_34; // @[dec_tlu_ctl.scala 1484:57]
  wire  _T_36 = ~set_mie_pmu_fw_halt; // @[dec_tlu_ctl.scala 1484:72]
  wire  _T_37 = _T_35 & _T_36; // @[dec_tlu_ctl.scala 1484:70]
  wire [1:0] _T_39 = _T_8 ? _T_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_40 = _T_13 ? _T_16 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_41 = _T_18 ? _T_21 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_42 = set_mie_pmu_fw_halt ? _T_24 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_43 = _T_26 ? _T_30 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_44 = _T_37 ? io_mstatus : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_45 = _T_39 | _T_40; // @[Mux.scala 27:72]
  wire [1:0] _T_46 = _T_45 | _T_41; // @[Mux.scala 27:72]
  wire [1:0] _T_47 = _T_46 | _T_42; // @[Mux.scala 27:72]
  wire [1:0] _T_48 = _T_47 | _T_43; // @[Mux.scala 27:72]
  wire  _T_52 = ~io_dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 1489:57]
  wire  _T_54 = _T_52 | io_dcsr[11]; // @[dec_tlu_ctl.scala 1489:88]
  wire  _T_57 = io_dec_csr_wraddr_r == 12'h305; // @[dec_tlu_ctl.scala 1500:76]
  wire  wr_mtvec_r = io_dec_csr_wen_r_mod & _T_57; // @[dec_tlu_ctl.scala 1500:47]
  wire [30:0] mtvec_ns = {io_dec_csr_wrdata_r[31:2],io_dec_csr_wrdata_r[0]}; // @[Cat.scala 29:58]
  reg [30:0] _T_61; // @[Reg.scala 27:20]
  reg [31:0] mdccmect; // @[Reg.scala 27:20]
  wire [62:0] _T_629 = 63'hffffffff << mdccmect[31:27]; // @[dec_tlu_ctl.scala 1942:48]
  wire [31:0] _T_631 = {5'h0,mdccmect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_43 = {{31'd0}, _T_631}; // @[dec_tlu_ctl.scala 1942:68]
  wire [62:0] _T_632 = _T_629 & _GEN_43; // @[dec_tlu_ctl.scala 1942:68]
  wire  mdccme_ce_req = |_T_632; // @[dec_tlu_ctl.scala 1942:101]
  reg [31:0] miccmect; // @[Reg.scala 27:20]
  wire [62:0] _T_609 = 63'hffffffff << miccmect[31:27]; // @[dec_tlu_ctl.scala 1928:48]
  wire [31:0] _T_611 = {5'h0,miccmect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_44 = {{31'd0}, _T_611}; // @[dec_tlu_ctl.scala 1928:68]
  wire [62:0] _T_612 = _T_609 & _GEN_44; // @[dec_tlu_ctl.scala 1928:68]
  wire  miccme_ce_req = |_T_612; // @[dec_tlu_ctl.scala 1928:101]
  wire  _T_62 = mdccme_ce_req | miccme_ce_req; // @[dec_tlu_ctl.scala 1514:37]
  reg [31:0] micect; // @[Reg.scala 27:20]
  wire [62:0] _T_587 = 63'hffffffff << micect[31:27]; // @[dec_tlu_ctl.scala 1913:46]
  wire [31:0] _T_589 = {5'h0,micect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_45 = {{31'd0}, _T_589}; // @[dec_tlu_ctl.scala 1913:64]
  wire [62:0] _T_590 = _T_587 & _GEN_45; // @[dec_tlu_ctl.scala 1913:64]
  wire  mice_ce_req = |_T_590; // @[dec_tlu_ctl.scala 1913:95]
  wire  ce_int = _T_62 | mice_ce_req; // @[dec_tlu_ctl.scala 1514:53]
  wire [2:0] _T_64 = {io_mexintpend,io_timer_int_sync,io_soft_int_sync}; // @[Cat.scala 29:58]
  wire [2:0] _T_66 = {ce_int,io_dec_timer_t0_pulse,io_dec_timer_t1_pulse}; // @[Cat.scala 29:58]
  wire  _T_68 = io_dec_csr_wraddr_r == 12'h304; // @[dec_tlu_ctl.scala 1530:74]
  wire  wr_mie_r = io_dec_csr_wen_r_mod & _T_68; // @[dec_tlu_ctl.scala 1530:45]
  wire [5:0] _T_76 = {io_dec_csr_wrdata_r[30:28],io_dec_csr_wrdata_r[11],io_dec_csr_wrdata_r[7],io_dec_csr_wrdata_r[3]}; // @[Cat.scala 29:58]
  reg [5:0] mie; // @[dec_tlu_ctl.scala 1533:24]
  wire  kill_ebreak_count_r = io_ebreak_to_debug_mode_r & io_dcsr[10]; // @[dec_tlu_ctl.scala 1539:61]
  wire  _T_81 = io_dec_csr_wraddr_r == 12'hb00; // @[dec_tlu_ctl.scala 1541:78]
  wire  wr_mcyclel_r = io_dec_csr_wen_r_mod & _T_81; // @[dec_tlu_ctl.scala 1541:49]
  wire  _T_83 = io_dec_tlu_dbg_halted & io_dcsr[10]; // @[dec_tlu_ctl.scala 1543:78]
  wire  _T_84 = kill_ebreak_count_r | _T_83; // @[dec_tlu_ctl.scala 1543:53]
  wire  _T_85 = _T_84 | io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 1543:101]
  reg [4:0] temp_ncount6_2; // @[Reg.scala 27:20]
  wire [5:0] _T_1138 = {temp_ncount6_2,1'h0}; // @[Cat.scala 29:58]
  reg  temp_ncount0; // @[Reg.scala 27:20]
  wire [6:0] mcountinhibit = {temp_ncount6_2,1'h0,temp_ncount0}; // @[Cat.scala 29:58]
  wire  _T_87 = _T_85 | mcountinhibit[0]; // @[dec_tlu_ctl.scala 1543:128]
  wire  mcyclel_cout_in = ~_T_87; // @[dec_tlu_ctl.scala 1543:31]
  reg [23:0] _T_106; // @[Reg.scala 27:20]
  reg [7:0] _T_110; // @[Reg.scala 27:20]
  wire [31:0] mcyclel = {_T_106,_T_110}; // @[Cat.scala 29:58]
  wire [8:0] mcyclel_inc1 = mcyclel[7:0] + 8'h1; // @[dec_tlu_ctl.scala 1548:38]
  wire [23:0] _T_93 = {23'h0,mcyclel_inc1[8]}; // @[Cat.scala 29:58]
  wire [24:0] mcyclel_inc2 = mcyclel[31:8] + _T_93; // @[dec_tlu_ctl.scala 1549:39]
  wire [31:0] mcyclel_inc = {mcyclel_inc2[23:0],mcyclel_inc1[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] mcyclel_ns = wr_mcyclel_r ? io_dec_csr_wrdata_r : mcyclel_inc; // @[dec_tlu_ctl.scala 1551:29]
  wire  _T_102 = mcyclel_inc1[8] & mcyclel_cout_in; // @[dec_tlu_ctl.scala 1553:82]
  wire  _T_104 = wr_mcyclel_r | _T_102; // @[dec_tlu_ctl.scala 1553:63]
  wire  _T_108 = wr_mcyclel_r | mcyclel_cout_in; // @[dec_tlu_ctl.scala 1553:184]
  wire  _T_113 = io_dec_csr_wraddr_r == 12'hb80; // @[dec_tlu_ctl.scala 1560:78]
  wire  wr_mcycleh_r = io_dec_csr_wen_r_mod & _T_113; // @[dec_tlu_ctl.scala 1560:49]
  wire [31:0] _T_114 = {31'h0,perfmux_flop_io_mcyclel_cout_f}; // @[Cat.scala 29:58]
  reg [31:0] mcycleh; // @[Reg.scala 27:20]
  wire [31:0] mcycleh_inc = mcycleh + _T_114; // @[dec_tlu_ctl.scala 1562:35]
  wire  _T_117 = wr_mcycleh_r | perfmux_flop_io_mcyclel_cout_f; // @[dec_tlu_ctl.scala 1565:53]
  wire  _T_120 = io_ebreak_r | io_ecall_r; // @[dec_tlu_ctl.scala 1579:81]
  wire  _T_121 = _T_120 | io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 1579:94]
  wire  _T_122 = _T_121 | io_illegal_r; // @[dec_tlu_ctl.scala 1579:122]
  wire  _T_124 = _T_122 | mcountinhibit[2]; // @[dec_tlu_ctl.scala 1579:137]
  wire  _T_125 = ~_T_124; // @[dec_tlu_ctl.scala 1579:67]
  wire  i0_valid_no_ebreak_ecall_r = io_dec_tlu_i0_valid_r & _T_125; // @[dec_tlu_ctl.scala 1579:65]
  wire  _T_128 = io_dec_csr_wraddr_r == 12'hb02; // @[dec_tlu_ctl.scala 1581:80]
  wire  wr_minstretl_r = io_dec_csr_wen_r_mod & _T_128; // @[dec_tlu_ctl.scala 1581:51]
  reg [23:0] _T_150; // @[Reg.scala 27:20]
  reg [7:0] _T_153; // @[Reg.scala 27:20]
  wire [31:0] minstretl = {_T_150,_T_153}; // @[Cat.scala 29:58]
  wire [8:0] minstretl_inc1 = minstretl[7:0] + 8'h1; // @[dec_tlu_ctl.scala 1585:42]
  wire [23:0] _T_134 = {23'h0,minstretl_inc1[8]}; // @[Cat.scala 29:58]
  wire [24:0] minstretl_inc2 = minstretl[31:8] + _T_134; // @[dec_tlu_ctl.scala 1586:43]
  wire  minstretl_cout = minstretl_inc2[24]; // @[dec_tlu_ctl.scala 1587:44]
  wire [31:0] minstretl_inc = {minstretl_inc2[23:0],minstretl_inc1[7:0]}; // @[Cat.scala 29:58]
  wire  _T_138 = i0_valid_no_ebreak_ecall_r & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 1589:59]
  wire  minstret_enable = _T_138 | wr_minstretl_r; // @[dec_tlu_ctl.scala 1589:83]
  wire  _T_156 = io_dec_csr_wraddr_r == 12'hb82; // @[dec_tlu_ctl.scala 1605:78]
  wire  wr_minstreth_r = io_dec_csr_wen_r_mod & _T_156; // @[dec_tlu_ctl.scala 1605:49]
  wire  _T_139 = ~wr_minstreth_r; // @[dec_tlu_ctl.scala 1590:50]
  wire  _T_140 = minstretl_cout & _T_139; // @[dec_tlu_ctl.scala 1590:48]
  wire  _T_141 = _T_140 & i0_valid_no_ebreak_ecall_r; // @[dec_tlu_ctl.scala 1590:66]
  wire  _T_142 = ~io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 1590:97]
  wire [31:0] minstretl_ns = wr_minstretl_r ? io_dec_csr_wrdata_r : minstretl_inc; // @[dec_tlu_ctl.scala 1593:31]
  wire  _T_147 = minstretl_inc1[8] & minstret_enable; // @[dec_tlu_ctl.scala 1595:88]
  wire  _T_148 = wr_minstretl_r | _T_147; // @[dec_tlu_ctl.scala 1595:67]
  wire [31:0] _T_159 = {31'h0,perfmux_flop_io_minstretl_cout_f}; // @[Cat.scala 29:58]
  reg [31:0] minstreth; // @[Reg.scala 27:20]
  wire [31:0] minstreth_inc = minstreth + _T_159; // @[dec_tlu_ctl.scala 1609:39]
  wire  _T_162 = perfmux_flop_io_minstret_enable_f & perfmux_flop_io_minstretl_cout_f; // @[dec_tlu_ctl.scala 1612:79]
  wire  _T_163 = _T_162 | wr_minstreth_r; // @[dec_tlu_ctl.scala 1612:116]
  wire  _T_167 = io_dec_csr_wraddr_r == 12'h340; // @[dec_tlu_ctl.scala 1620:79]
  wire  wr_mscratch_r = io_dec_csr_wen_r_mod & _T_167; // @[dec_tlu_ctl.scala 1620:50]
  reg [31:0] mscratch; // @[Reg.scala 27:20]
  wire  _T_171 = ~io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 1631:54]
  wire  _T_172 = _T_142 & _T_171; // @[dec_tlu_ctl.scala 1631:52]
  wire  sel_exu_npc_r = _T_172 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 1631:79]
  wire  _T_174 = _T_142 & io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 1632:54]
  wire  _T_175 = ~io_dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 1632:82]
  wire  sel_flush_npc_r = _T_174 & _T_175; // @[dec_tlu_ctl.scala 1632:80]
  wire  _T_176 = ~sel_exu_npc_r; // @[dec_tlu_ctl.scala 1633:30]
  wire  _T_177 = ~sel_flush_npc_r; // @[dec_tlu_ctl.scala 1633:47]
  wire  sel_hold_npc_r = _T_176 & _T_177; // @[dec_tlu_ctl.scala 1633:45]
  wire  _T_179 = ~io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 1637:18]
  wire  _T_180 = _T_179 & io_reset_delayed; // @[dec_tlu_ctl.scala 1637:40]
  wire [30:0] _T_184 = sel_exu_npc_r ? io_exu_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_185 = _T_180 ? io_rst_vec : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_186 = sel_flush_npc_r ? io_tlu_flush_path_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_187 = sel_hold_npc_r ? io_npc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_188 = _T_184 | _T_185; // @[Mux.scala 27:72]
  wire [30:0] _T_189 = _T_188 | _T_186; // @[Mux.scala 27:72]
  wire  _T_192 = sel_exu_npc_r | sel_flush_npc_r; // @[dec_tlu_ctl.scala 1641:58]
  wire  _T_193 = _T_192 | io_reset_delayed; // @[dec_tlu_ctl.scala 1641:76]
  reg [30:0] _T_196; // @[Reg.scala 27:20]
  wire  pc0_valid_r = _T_142 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 1644:51]
  wire  _T_199 = ~pc0_valid_r; // @[dec_tlu_ctl.scala 1648:17]
  wire [30:0] _T_200 = pc0_valid_r ? io_dec_tlu_i0_pc_r : 31'h0; // @[Mux.scala 27:72]
  reg [30:0] pc_r_d1; // @[Reg.scala 27:20]
  wire [30:0] _T_201 = _T_199 ? pc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] pc_r = _T_200 | _T_201; // @[Mux.scala 27:72]
  wire  _T_206 = io_dec_csr_wraddr_r == 12'h341; // @[dec_tlu_ctl.scala 1652:75]
  wire  wr_mepc_r = io_dec_csr_wen_r_mod & _T_206; // @[dec_tlu_ctl.scala 1652:46]
  wire  _T_207 = io_i0_exception_valid_r | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 1655:42]
  wire  _T_208 = _T_207 | io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 1655:63]
  wire  _T_212 = wr_mepc_r & _T_17; // @[dec_tlu_ctl.scala 1657:28]
  wire  _T_215 = ~wr_mepc_r; // @[dec_tlu_ctl.scala 1658:18]
  wire  _T_217 = _T_215 & _T_17; // @[dec_tlu_ctl.scala 1658:29]
  wire [30:0] _T_219 = _T_208 ? pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_220 = io_interrupt_valid_r ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_221 = _T_212 ? io_dec_csr_wrdata_r[31:1] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_222 = _T_217 ? io_mepc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_223 = _T_219 | _T_220; // @[Mux.scala 27:72]
  wire [30:0] _T_224 = _T_223 | _T_221; // @[Mux.scala 27:72]
  wire [30:0] mepc_ns = _T_224 | _T_222; // @[Mux.scala 27:72]
  wire  _T_228 = _T_208 | io_interrupt_valid_r; // @[dec_tlu_ctl.scala 1660:111]
  wire  _T_229 = _T_228 | wr_mepc_r; // @[dec_tlu_ctl.scala 1660:134]
  reg [30:0] _T_231; // @[Reg.scala 27:20]
  wire  _T_233 = io_dec_csr_wraddr_r == 12'h342; // @[dec_tlu_ctl.scala 1668:77]
  wire  wr_mcause_r = io_dec_csr_wen_r_mod & _T_233; // @[dec_tlu_ctl.scala 1668:48]
  wire  _T_234 = io_exc_or_int_valid_r & io_take_nmi; // @[dec_tlu_ctl.scala 1669:58]
  wire  mcause_sel_nmi_store = _T_234 & io_nmi_lsu_store_type; // @[dec_tlu_ctl.scala 1669:72]
  wire  mcause_sel_nmi_load = _T_234 & io_nmi_lsu_load_type; // @[dec_tlu_ctl.scala 1670:71]
  wire  _T_237 = _T_234 & io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 1671:69]
  wire  _T_238 = |io_lsu_fir_error; // @[dec_tlu_ctl.scala 1671:115]
  wire  _T_239 = _T_237 & _T_238; // @[dec_tlu_ctl.scala 1671:96]
  wire  _T_240 = ~io_nmi_int_detected_f; // @[dec_tlu_ctl.scala 1671:121]
  wire  mcause_sel_nmi_ext = _T_239 & _T_240; // @[dec_tlu_ctl.scala 1671:119]
  wire  _T_241 = &io_lsu_fir_error; // @[dec_tlu_ctl.scala 1678:58]
  wire  _T_244 = ~io_lsu_fir_error[0]; // @[dec_tlu_ctl.scala 1678:87]
  wire  _T_245 = io_lsu_fir_error[1] & _T_244; // @[dec_tlu_ctl.scala 1678:85]
  wire [31:0] _T_250 = {30'h3c000400,_T_241,_T_245}; // @[Cat.scala 29:58]
  wire  _T_251 = ~io_take_nmi; // @[dec_tlu_ctl.scala 1684:42]
  wire  _T_252 = io_exc_or_int_valid_r & _T_251; // @[dec_tlu_ctl.scala 1684:40]
  wire [31:0] _T_255 = {io_interrupt_valid_r,26'h0,io_exc_cause_r}; // @[Cat.scala 29:58]
  wire  _T_257 = wr_mcause_r & _T_17; // @[dec_tlu_ctl.scala 1685:30]
  wire  _T_259 = ~wr_mcause_r; // @[dec_tlu_ctl.scala 1686:18]
  wire  _T_261 = _T_259 & _T_17; // @[dec_tlu_ctl.scala 1686:31]
  wire [31:0] _T_263 = mcause_sel_nmi_store ? 32'hf0000000 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_264 = mcause_sel_nmi_load ? 32'hf0000001 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_265 = mcause_sel_nmi_ext ? _T_250 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_266 = _T_252 ? _T_255 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_267 = _T_257 ? io_dec_csr_wrdata_r : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] mcause; // @[Reg.scala 27:20]
  wire [31:0] _T_268 = _T_261 ? mcause : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_269 = _T_263 | _T_264; // @[Mux.scala 27:72]
  wire [31:0] _T_270 = _T_269 | _T_265; // @[Mux.scala 27:72]
  wire [31:0] _T_271 = _T_270 | _T_266; // @[Mux.scala 27:72]
  wire [31:0] _T_272 = _T_271 | _T_267; // @[Mux.scala 27:72]
  wire [31:0] mcause_ns = _T_272 | _T_268; // @[Mux.scala 27:72]
  wire  _T_274 = io_exc_or_int_valid_r | wr_mcause_r; // @[dec_tlu_ctl.scala 1688:58]
  wire  _T_278 = io_dec_csr_wraddr_r == 12'h7ff; // @[dec_tlu_ctl.scala 1695:78]
  wire  wr_mscause_r = io_dec_csr_wen_r_mod & _T_278; // @[dec_tlu_ctl.scala 1695:49]
  wire  _T_279 = io_dec_tlu_packet_r_icaf_type == 2'h0; // @[dec_tlu_ctl.scala 1697:63]
  wire [3:0] _T_280 = {2'h0,io_dec_tlu_packet_r_icaf_type}; // @[Cat.scala 29:58]
  wire [3:0] ifu_mscause = _T_279 ? 4'h9 : _T_280; // @[dec_tlu_ctl.scala 1697:31]
  wire [3:0] _T_285 = io_lsu_i0_exc_r ? io_lsu_error_pkt_r_bits_mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_286 = io_i0_trigger_hit_r ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_287 = io_ebreak_r ? 4'h2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_288 = io_inst_acc_r ? ifu_mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_289 = _T_285 | _T_286; // @[Mux.scala 27:72]
  wire [3:0] _T_290 = _T_289 | _T_287; // @[Mux.scala 27:72]
  wire [3:0] mscause_type = _T_290 | _T_288; // @[Mux.scala 27:72]
  wire  _T_294 = wr_mscause_r & _T_17; // @[dec_tlu_ctl.scala 1708:31]
  wire  _T_297 = ~wr_mscause_r; // @[dec_tlu_ctl.scala 1709:18]
  wire  _T_299 = _T_297 & _T_17; // @[dec_tlu_ctl.scala 1709:32]
  wire [3:0] _T_301 = io_exc_or_int_valid_r ? mscause_type : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_302 = _T_294 ? io_dec_csr_wrdata_r[3:0] : 4'h0; // @[Mux.scala 27:72]
  reg [3:0] mscause; // @[dec_tlu_ctl.scala 1711:54]
  wire [3:0] _T_303 = _T_299 ? mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_304 = _T_301 | _T_302; // @[Mux.scala 27:72]
  wire  _T_308 = io_dec_csr_wraddr_r == 12'h343; // @[dec_tlu_ctl.scala 1718:76]
  wire  wr_mtval_r = io_dec_csr_wen_r_mod & _T_308; // @[dec_tlu_ctl.scala 1718:47]
  wire  _T_309 = ~io_inst_acc_second_r; // @[dec_tlu_ctl.scala 1719:90]
  wire  _T_310 = io_inst_acc_r & _T_309; // @[dec_tlu_ctl.scala 1719:88]
  wire  _T_311 = io_ebreak_r | _T_310; // @[dec_tlu_ctl.scala 1719:71]
  wire  _T_312 = _T_311 | io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 1719:113]
  wire  _T_313 = io_exc_or_int_valid_r & _T_312; // @[dec_tlu_ctl.scala 1719:56]
  wire  mtval_capture_pc_r = _T_313 & _T_251; // @[dec_tlu_ctl.scala 1719:145]
  wire  _T_315 = io_inst_acc_r & io_inst_acc_second_r; // @[dec_tlu_ctl.scala 1720:79]
  wire  _T_316 = io_exc_or_int_valid_r & _T_315; // @[dec_tlu_ctl.scala 1720:62]
  wire  mtval_capture_pc_plus2_r = _T_316 & _T_251; // @[dec_tlu_ctl.scala 1720:103]
  wire  _T_318 = io_exc_or_int_valid_r & io_illegal_r; // @[dec_tlu_ctl.scala 1721:58]
  wire  mtval_capture_inst_r = _T_318 & _T_251; // @[dec_tlu_ctl.scala 1721:73]
  wire  _T_320 = io_exc_or_int_valid_r & io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 1722:57]
  wire  mtval_capture_lsu_r = _T_320 & _T_251; // @[dec_tlu_ctl.scala 1722:78]
  wire  _T_322 = ~mtval_capture_pc_r; // @[dec_tlu_ctl.scala 1723:53]
  wire  _T_323 = io_exc_or_int_valid_r & _T_322; // @[dec_tlu_ctl.scala 1723:51]
  wire  _T_324 = ~mtval_capture_inst_r; // @[dec_tlu_ctl.scala 1723:75]
  wire  _T_325 = _T_323 & _T_324; // @[dec_tlu_ctl.scala 1723:73]
  wire  _T_326 = ~mtval_capture_lsu_r; // @[dec_tlu_ctl.scala 1723:99]
  wire  _T_327 = _T_325 & _T_326; // @[dec_tlu_ctl.scala 1723:97]
  wire  _T_328 = ~io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 1723:122]
  wire  mtval_clear_r = _T_327 & _T_328; // @[dec_tlu_ctl.scala 1723:120]
  wire [31:0] _T_330 = {pc_r,1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_333 = pc_r + 31'h1; // @[dec_tlu_ctl.scala 1728:96]
  wire [31:0] _T_334 = {_T_333,1'h0}; // @[Cat.scala 29:58]
  wire  _T_337 = ~io_interrupt_valid_r; // @[dec_tlu_ctl.scala 1731:31]
  wire  _T_338 = wr_mtval_r & _T_337; // @[dec_tlu_ctl.scala 1731:29]
  wire  _T_341 = ~wr_mtval_r; // @[dec_tlu_ctl.scala 1732:33]
  wire  _T_342 = _T_251 & _T_341; // @[dec_tlu_ctl.scala 1732:31]
  wire  _T_344 = _T_342 & _T_322; // @[dec_tlu_ctl.scala 1732:45]
  wire  _T_346 = _T_344 & _T_324; // @[dec_tlu_ctl.scala 1732:67]
  wire  _T_347 = ~mtval_clear_r; // @[dec_tlu_ctl.scala 1732:93]
  wire  _T_348 = _T_346 & _T_347; // @[dec_tlu_ctl.scala 1732:91]
  wire  _T_350 = _T_348 & _T_326; // @[dec_tlu_ctl.scala 1732:108]
  wire [31:0] _T_352 = mtval_capture_pc_r ? _T_330 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_353 = mtval_capture_pc_plus2_r ? _T_334 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_354 = mtval_capture_inst_r ? io_dec_illegal_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_355 = mtval_capture_lsu_r ? io_lsu_error_pkt_addr_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_356 = _T_338 ? io_dec_csr_wrdata_r : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] mtval; // @[Reg.scala 27:20]
  wire [31:0] _T_357 = _T_350 ? mtval : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_358 = _T_352 | _T_353; // @[Mux.scala 27:72]
  wire [31:0] _T_359 = _T_358 | _T_354; // @[Mux.scala 27:72]
  wire [31:0] _T_360 = _T_359 | _T_355; // @[Mux.scala 27:72]
  wire [31:0] _T_361 = _T_360 | _T_356; // @[Mux.scala 27:72]
  wire [31:0] mtval_ns = _T_361 | _T_357; // @[Mux.scala 27:72]
  wire  _T_363 = io_tlu_flush_lower_r | wr_mtval_r; // @[dec_tlu_ctl.scala 1734:55]
  wire  _T_367 = io_dec_csr_wraddr_r == 12'h7f8; // @[dec_tlu_ctl.scala 1752:75]
  wire  wr_mcgc_r = io_dec_csr_wen_r_mod & _T_367; // @[dec_tlu_ctl.scala 1752:46]
  wire  _T_370 = ~io_dec_csr_wrdata_r[9]; // @[dec_tlu_ctl.scala 1753:42]
  wire [9:0] _T_372 = {_T_370,io_dec_csr_wrdata_r[8:0]}; // @[Cat.scala 29:58]
  reg [9:0] mcgc_int; // @[Reg.scala 27:20]
  wire  _T_376 = ~mcgc_int[9]; // @[dec_tlu_ctl.scala 1755:24]
  wire [9:0] mcgc = {_T_376,mcgc_int[8:0]}; // @[Cat.scala 29:58]
  wire  _T_388 = io_dec_csr_wraddr_r == 12'h7f9; // @[dec_tlu_ctl.scala 1785:75]
  wire  wr_mfdc_r = io_dec_csr_wen_r_mod & _T_388; // @[dec_tlu_ctl.scala 1785:46]
  reg [15:0] mfdc_int; // @[Reg.scala 27:20]
  wire [2:0] _T_392 = ~io_dec_csr_wrdata_r[18:16]; // @[dec_tlu_ctl.scala 1795:32]
  wire  _T_396 = ~io_dec_csr_wrdata_r[6]; // @[dec_tlu_ctl.scala 1795:111]
  wire [15:0] mfdc_ns = {_T_392,io_dec_csr_wrdata_r[12],io_dec_csr_wrdata_r[11:7],_T_396,io_dec_csr_wrdata_r[5:0]}; // @[Cat.scala 29:58]
  wire [2:0] _T_403 = ~mfdc_int[15:13]; // @[dec_tlu_ctl.scala 1796:32]
  wire  _T_407 = ~mfdc_int[6]; // @[dec_tlu_ctl.scala 1796:88]
  wire [18:0] mfdc = {_T_403,3'h0,mfdc_int[12],mfdc_int[11:7],_T_407,mfdc_int[5:0]}; // @[Cat.scala 29:58]
  wire  _T_423 = io_dec_csr_wraddr_r == 12'h7c2; // @[dec_tlu_ctl.scala 1822:84]
  wire  _T_424 = io_dec_csr_wen_r_mod & _T_423; // @[dec_tlu_ctl.scala 1822:55]
  wire  _T_426 = _T_424 & _T_337; // @[dec_tlu_ctl.scala 1822:94]
  wire  _T_427 = ~io_take_ext_int_start; // @[dec_tlu_ctl.scala 1822:120]
  wire  _T_430 = io_dec_csr_wraddr_r == 12'h7c0; // @[dec_tlu_ctl.scala 1829:75]
  wire  wr_mrac_r = io_dec_csr_wen_r_mod & _T_430; // @[dec_tlu_ctl.scala 1829:46]
  wire  _T_434 = ~io_dec_csr_wrdata_r[31]; // @[dec_tlu_ctl.scala 1832:78]
  wire  _T_435 = io_dec_csr_wrdata_r[30] & _T_434; // @[dec_tlu_ctl.scala 1832:76]
  wire  _T_439 = ~io_dec_csr_wrdata_r[29]; // @[dec_tlu_ctl.scala 1833:68]
  wire  _T_440 = io_dec_csr_wrdata_r[28] & _T_439; // @[dec_tlu_ctl.scala 1833:66]
  wire  _T_444 = ~io_dec_csr_wrdata_r[27]; // @[dec_tlu_ctl.scala 1834:68]
  wire  _T_445 = io_dec_csr_wrdata_r[26] & _T_444; // @[dec_tlu_ctl.scala 1834:66]
  wire  _T_449 = ~io_dec_csr_wrdata_r[25]; // @[dec_tlu_ctl.scala 1835:68]
  wire  _T_450 = io_dec_csr_wrdata_r[24] & _T_449; // @[dec_tlu_ctl.scala 1835:66]
  wire  _T_454 = ~io_dec_csr_wrdata_r[23]; // @[dec_tlu_ctl.scala 1836:68]
  wire  _T_455 = io_dec_csr_wrdata_r[22] & _T_454; // @[dec_tlu_ctl.scala 1836:66]
  wire  _T_459 = ~io_dec_csr_wrdata_r[21]; // @[dec_tlu_ctl.scala 1837:68]
  wire  _T_460 = io_dec_csr_wrdata_r[20] & _T_459; // @[dec_tlu_ctl.scala 1837:66]
  wire  _T_464 = ~io_dec_csr_wrdata_r[19]; // @[dec_tlu_ctl.scala 1838:68]
  wire  _T_465 = io_dec_csr_wrdata_r[18] & _T_464; // @[dec_tlu_ctl.scala 1838:66]
  wire  _T_469 = ~io_dec_csr_wrdata_r[17]; // @[dec_tlu_ctl.scala 1839:68]
  wire  _T_470 = io_dec_csr_wrdata_r[16] & _T_469; // @[dec_tlu_ctl.scala 1839:66]
  wire  _T_474 = ~io_dec_csr_wrdata_r[15]; // @[dec_tlu_ctl.scala 1840:68]
  wire  _T_475 = io_dec_csr_wrdata_r[14] & _T_474; // @[dec_tlu_ctl.scala 1840:66]
  wire  _T_479 = ~io_dec_csr_wrdata_r[13]; // @[dec_tlu_ctl.scala 1841:68]
  wire  _T_480 = io_dec_csr_wrdata_r[12] & _T_479; // @[dec_tlu_ctl.scala 1841:66]
  wire  _T_484 = ~io_dec_csr_wrdata_r[11]; // @[dec_tlu_ctl.scala 1842:68]
  wire  _T_485 = io_dec_csr_wrdata_r[10] & _T_484; // @[dec_tlu_ctl.scala 1842:66]
  wire  _T_490 = io_dec_csr_wrdata_r[8] & _T_370; // @[dec_tlu_ctl.scala 1843:65]
  wire  _T_494 = ~io_dec_csr_wrdata_r[7]; // @[dec_tlu_ctl.scala 1844:68]
  wire  _T_495 = io_dec_csr_wrdata_r[6] & _T_494; // @[dec_tlu_ctl.scala 1844:65]
  wire  _T_499 = ~io_dec_csr_wrdata_r[5]; // @[dec_tlu_ctl.scala 1845:68]
  wire  _T_500 = io_dec_csr_wrdata_r[4] & _T_499; // @[dec_tlu_ctl.scala 1845:65]
  wire  _T_504 = ~io_dec_csr_wrdata_r[3]; // @[dec_tlu_ctl.scala 1846:68]
  wire  _T_505 = io_dec_csr_wrdata_r[2] & _T_504; // @[dec_tlu_ctl.scala 1846:65]
  wire  _T_510 = io_dec_csr_wrdata_r[0] & _T_565; // @[dec_tlu_ctl.scala 1847:65]
  wire [7:0] _T_517 = {io_dec_csr_wrdata_r[7],_T_495,io_dec_csr_wrdata_r[5],_T_500,io_dec_csr_wrdata_r[3],_T_505,io_dec_csr_wrdata_r[1],_T_510}; // @[Cat.scala 29:58]
  wire [15:0] _T_525 = {io_dec_csr_wrdata_r[15],_T_475,io_dec_csr_wrdata_r[13],_T_480,io_dec_csr_wrdata_r[11],_T_485,io_dec_csr_wrdata_r[9],_T_490,_T_517}; // @[Cat.scala 29:58]
  wire [7:0] _T_532 = {io_dec_csr_wrdata_r[23],_T_455,io_dec_csr_wrdata_r[21],_T_460,io_dec_csr_wrdata_r[19],_T_465,io_dec_csr_wrdata_r[17],_T_470}; // @[Cat.scala 29:58]
  wire [31:0] mrac_in = {io_dec_csr_wrdata_r[31],_T_435,io_dec_csr_wrdata_r[29],_T_440,io_dec_csr_wrdata_r[27],_T_445,io_dec_csr_wrdata_r[25],_T_450,_T_532,_T_525}; // @[Cat.scala 29:58]
  reg [31:0] mrac; // @[Reg.scala 27:20]
  wire  _T_543 = io_dec_csr_wraddr_r == 12'hbc0; // @[dec_tlu_ctl.scala 1860:76]
  wire  wr_mdeau_r = io_dec_csr_wen_r_mod & _T_543; // @[dec_tlu_ctl.scala 1860:47]
  wire  _T_544 = ~wr_mdeau_r; // @[dec_tlu_ctl.scala 1870:66]
  wire  _T_545 = io_mdseac_locked_f & _T_544; // @[dec_tlu_ctl.scala 1870:64]
  wire  _T_547 = io_lsu_imprecise_error_store_any | io_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 1872:56]
  wire  _T_549 = _T_547 & _T_240; // @[dec_tlu_ctl.scala 1872:91]
  wire  _T_550 = ~io_mdseac_locked_f; // @[dec_tlu_ctl.scala 1872:118]
  wire  mdseac_en = _T_549 & _T_550; // @[dec_tlu_ctl.scala 1872:116]
  reg [31:0] mdseac; // @[Reg.scala 27:20]
  wire  _T_555 = wr_mpmc_r & io_dec_csr_wrdata_r[0]; // @[dec_tlu_ctl.scala 1887:37]
  wire  _T_556 = ~io_internal_dbg_halt_mode_f2; // @[dec_tlu_ctl.scala 1887:64]
  wire  _T_557 = _T_555 & _T_556; // @[dec_tlu_ctl.scala 1887:62]
  wire  _T_558 = ~io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 1887:96]
  wire  _T_571 = io_dec_csr_wrdata_r[31:27] > 5'h1a; // @[dec_tlu_ctl.scala 1905:55]
  wire [4:0] csr_sat = _T_571 ? 5'h1a : io_dec_csr_wrdata_r[31:27]; // @[dec_tlu_ctl.scala 1905:26]
  wire  _T_573 = io_dec_csr_wraddr_r == 12'h7f0; // @[dec_tlu_ctl.scala 1907:71]
  wire  wr_micect_r = io_dec_csr_wen_r_mod & _T_573; // @[dec_tlu_ctl.scala 1907:48]
  wire [26:0] _T_575 = {26'h0,io_ic_perr_r}; // @[Cat.scala 29:58]
  wire [26:0] micect_inc = micect[26:0] + _T_575; // @[dec_tlu_ctl.scala 1908:36]
  wire [31:0] _T_580 = {csr_sat,io_dec_csr_wrdata_r[26:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_582 = {micect[31:27],micect_inc}; // @[Cat.scala 29:58]
  wire  _T_583 = wr_micect_r | io_ic_perr_r; // @[dec_tlu_ctl.scala 1911:49]
  wire  _T_593 = io_dec_csr_wraddr_r == 12'h7f1; // @[dec_tlu_ctl.scala 1922:83]
  wire  wr_miccmect_r = io_dec_csr_wen_r_mod & _T_593; // @[dec_tlu_ctl.scala 1922:54]
  wire  _T_595 = io_iccm_sbecc_r | io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 1923:74]
  wire [26:0] _T_596 = {26'h0,_T_595}; // @[Cat.scala 29:58]
  wire [26:0] miccmect_inc = miccmect[26:0] + _T_596; // @[dec_tlu_ctl.scala 1923:40]
  wire [31:0] _T_603 = {miccmect[31:27],miccmect_inc}; // @[Cat.scala 29:58]
  wire  _T_604 = wr_miccmect_r | io_iccm_sbecc_r; // @[dec_tlu_ctl.scala 1926:55]
  wire  _T_605 = _T_604 | io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 1926:73]
  wire  _T_615 = io_dec_csr_wraddr_r == 12'h7f2; // @[dec_tlu_ctl.scala 1937:83]
  wire  wr_mdccmect_r = io_dec_csr_wen_r_mod & _T_615; // @[dec_tlu_ctl.scala 1937:54]
  wire [26:0] _T_617 = {26'h0,perfmux_flop_io_lsu_single_ecc_error_r_d1}; // @[Cat.scala 29:58]
  wire [26:0] mdccmect_inc = mdccmect[26:0] + _T_617; // @[dec_tlu_ctl.scala 1938:40]
  wire [31:0] _T_624 = {mdccmect[31:27],mdccmect_inc}; // @[Cat.scala 29:58]
  wire  _T_625 = wr_mdccmect_r | perfmux_flop_io_lsu_single_ecc_error_r_d1; // @[dec_tlu_ctl.scala 1941:56]
  wire  _T_635 = io_dec_csr_wraddr_r == 12'h7ce; // @[dec_tlu_ctl.scala 1952:76]
  wire  wr_mfdht_r = io_dec_csr_wen_r_mod & _T_635; // @[dec_tlu_ctl.scala 1952:47]
  reg [5:0] mfdht; // @[Reg.scala 27:20]
  wire  _T_641 = io_dec_csr_wraddr_r == 12'h7cf; // @[dec_tlu_ctl.scala 1965:76]
  wire  wr_mfdhs_r = io_dec_csr_wen_r_mod & _T_641; // @[dec_tlu_ctl.scala 1965:47]
  wire  _T_644 = ~io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 1968:42]
  wire  _T_645 = io_dbg_tlu_halted & _T_644; // @[dec_tlu_ctl.scala 1968:40]
  wire  _T_647 = ~io_lsu_idle_any_f; // @[dec_tlu_ctl.scala 1968:77]
  wire  _T_648 = ~io_ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 1968:97]
  wire [1:0] _T_649 = {_T_647,_T_648}; // @[Cat.scala 29:58]
  reg [1:0] mfdhs; // @[Reg.scala 27:20]
  wire  _T_651 = wr_mfdhs_r | io_dbg_tlu_halted; // @[dec_tlu_ctl.scala 1970:76]
  reg [31:0] force_halt_ctr_f; // @[Reg.scala 27:20]
  wire [31:0] _T_656 = force_halt_ctr_f + 32'h1; // @[dec_tlu_ctl.scala 1972:81]
  wire [62:0] _T_663 = 63'hffffffff << mfdht[5:1]; // @[dec_tlu_ctl.scala 1977:78]
  wire [62:0] _GEN_46 = {{31'd0}, force_halt_ctr_f}; // @[dec_tlu_ctl.scala 1977:55]
  wire [62:0] _T_664 = _GEN_46 & _T_663; // @[dec_tlu_ctl.scala 1977:55]
  wire  _T_665 = |_T_664; // @[dec_tlu_ctl.scala 1977:94]
  wire  _T_668 = io_dec_csr_wraddr_r == 12'hbc8; // @[dec_tlu_ctl.scala 1985:76]
  wire  wr_meivt_r = io_dec_csr_wen_r_mod & _T_668; // @[dec_tlu_ctl.scala 1985:47]
  reg [21:0] meivt; // @[Reg.scala 27:20]
  wire  _T_686 = io_dec_csr_wraddr_r == 12'hbca; // @[dec_tlu_ctl.scala 2036:76]
  wire  _T_687 = io_dec_csr_wen_r_mod & _T_686; // @[dec_tlu_ctl.scala 2036:47]
  wire  wr_meicpct_r = _T_687 | io_take_ext_int_start; // @[dec_tlu_ctl.scala 2036:90]
  reg [7:0] meihap; // @[Reg.scala 27:20]
  wire  _T_674 = io_dec_csr_wraddr_r == 12'hbcc; // @[dec_tlu_ctl.scala 2009:79]
  wire  wr_meicurpl_r = io_dec_csr_wen_r_mod & _T_674; // @[dec_tlu_ctl.scala 2009:50]
  reg [3:0] meicurpl; // @[dec_tlu_ctl.scala 2012:53]
  wire  _T_679 = io_dec_csr_wraddr_r == 12'hbcb; // @[dec_tlu_ctl.scala 2024:80]
  wire  _T_680 = io_dec_csr_wen_r_mod & _T_679; // @[dec_tlu_ctl.scala 2024:51]
  wire  wr_meicidpl_r = _T_680 | io_take_ext_int_start; // @[dec_tlu_ctl.scala 2024:95]
  wire [3:0] _T_684 = wr_meicidpl_r ? io_dec_csr_wrdata_r[3:0] : perfmux_flop_io_meicidpl; // @[dec_tlu_ctl.scala 2027:20]
  wire  _T_690 = io_dec_csr_wraddr_r == 12'hbc9; // @[dec_tlu_ctl.scala 2045:76]
  wire  wr_meipt_r = io_dec_csr_wen_r_mod & _T_690; // @[dec_tlu_ctl.scala 2045:47]
  reg [3:0] meipt; // @[dec_tlu_ctl.scala 2048:50]
  wire  _T_694 = io_trigger_hit_r_d1 & io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 2076:96]
  wire  trigger_hit_for_dscr_cause_r_d1 = io_trigger_hit_dmode_r_d1 | _T_694; // @[dec_tlu_ctl.scala 2076:73]
  wire  _T_695 = ~io_ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 2079:47]
  wire  _T_696 = io_dcsr_single_step_done_f & _T_695; // @[dec_tlu_ctl.scala 2079:45]
  wire  _T_697 = ~trigger_hit_for_dscr_cause_r_d1; // @[dec_tlu_ctl.scala 2079:79]
  wire  _T_698 = _T_696 & _T_697; // @[dec_tlu_ctl.scala 2079:77]
  wire  _T_699 = ~io_debug_halt_req; // @[dec_tlu_ctl.scala 2079:114]
  wire  _T_700 = _T_698 & _T_699; // @[dec_tlu_ctl.scala 2079:112]
  wire  _T_703 = io_debug_halt_req & _T_695; // @[dec_tlu_ctl.scala 2080:36]
  wire  _T_705 = _T_703 & _T_697; // @[dec_tlu_ctl.scala 2080:68]
  wire  _T_708 = io_ebreak_to_debug_mode_r_d1 & _T_697; // @[dec_tlu_ctl.scala 2081:47]
  wire [2:0] _T_711 = _T_700 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_712 = _T_705 ? 3'h3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_713 = _T_708 ? 3'h1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_714 = trigger_hit_for_dscr_cause_r_d1 ? 3'h2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_715 = _T_711 | _T_712; // @[Mux.scala 27:72]
  wire [2:0] _T_716 = _T_715 | _T_713; // @[Mux.scala 27:72]
  wire [2:0] dcsr_cause = _T_716 | _T_714; // @[Mux.scala 27:72]
  wire  _T_718 = io_allow_dbg_halt_csr_write & io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 2084:53]
  wire  _T_720 = io_dec_csr_wraddr_r == 12'h7b0; // @[dec_tlu_ctl.scala 2084:105]
  wire  wr_dcsr_r = _T_718 & _T_720; // @[dec_tlu_ctl.scala 2084:76]
  wire  _T_722 = io_dcsr[8:6] == 3'h3; // @[dec_tlu_ctl.scala 2090:82]
  wire  dcsr_cause_upgradeable = io_internal_dbg_halt_mode_f & _T_722; // @[dec_tlu_ctl.scala 2090:66]
  wire  _T_723 = ~io_dbg_tlu_halted; // @[dec_tlu_ctl.scala 2091:66]
  wire  _T_724 = _T_723 | dcsr_cause_upgradeable; // @[dec_tlu_ctl.scala 2091:85]
  wire  enter_debug_halt_req_le = io_enter_debug_halt_req & _T_724; // @[dec_tlu_ctl.scala 2091:63]
  wire  nmi_in_debug_mode = io_nmi_int_detected_f & io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 2093:55]
  wire [15:0] _T_730 = {io_dcsr[15:9],dcsr_cause,io_dcsr[5:2],2'h3}; // @[Cat.scala 29:58]
  wire  _T_736 = nmi_in_debug_mode | io_dcsr[3]; // @[dec_tlu_ctl.scala 2095:158]
  wire [15:0] _T_745 = {io_dec_csr_wrdata_r[15],3'h0,io_dec_csr_wrdata_r[11:10],1'h0,io_dcsr[8:6],2'h0,_T_736,io_dec_csr_wrdata_r[2],2'h3}; // @[Cat.scala 29:58]
  wire [15:0] _T_750 = {io_dcsr[15:4],nmi_in_debug_mode,io_dcsr[2],2'h3}; // @[Cat.scala 29:58]
  wire  _T_752 = enter_debug_halt_req_le | wr_dcsr_r; // @[dec_tlu_ctl.scala 2098:61]
  wire  _T_753 = _T_752 | io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 2098:73]
  wire  _T_754 = _T_753 | io_take_nmi; // @[dec_tlu_ctl.scala 2098:101]
  reg [15:0] _T_756; // @[Reg.scala 27:20]
  wire  _T_759 = io_dec_csr_wraddr_r == 12'h7b1; // @[dec_tlu_ctl.scala 2106:104]
  wire  wr_dpc_r = _T_718 & _T_759; // @[dec_tlu_ctl.scala 2106:75]
  wire  _T_762 = ~io_request_debug_mode_done; // @[dec_tlu_ctl.scala 2107:74]
  wire  dpc_capture_npc = _T_645 & _T_762; // @[dec_tlu_ctl.scala 2107:72]
  wire  _T_763 = ~io_request_debug_mode_r; // @[dec_tlu_ctl.scala 2111:18]
  wire  _T_764 = ~dpc_capture_npc; // @[dec_tlu_ctl.scala 2111:36]
  wire  _T_765 = _T_763 & _T_764; // @[dec_tlu_ctl.scala 2111:34]
  wire  _T_766 = _T_765 & wr_dpc_r; // @[dec_tlu_ctl.scala 2111:53]
  wire  _T_771 = _T_763 & dpc_capture_npc; // @[dec_tlu_ctl.scala 2113:34]
  wire [30:0] _T_773 = _T_766 ? io_dec_csr_wrdata_r[31:1] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_774 = io_request_debug_mode_r ? pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_775 = _T_771 ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_776 = _T_773 | _T_774; // @[Mux.scala 27:72]
  wire [30:0] dpc_ns = _T_776 | _T_775; // @[Mux.scala 27:72]
  wire  _T_778 = wr_dpc_r | io_request_debug_mode_r; // @[dec_tlu_ctl.scala 2115:43]
  wire  _T_779 = _T_778 | dpc_capture_npc; // @[dec_tlu_ctl.scala 2115:60]
  reg [30:0] _T_781; // @[Reg.scala 27:20]
  wire [16:0] dicawics_ns = {io_dec_csr_wrdata_r[24],io_dec_csr_wrdata_r[21:20],io_dec_csr_wrdata_r[16:3]}; // @[Cat.scala 29:58]
  wire  _T_788 = io_dec_csr_wraddr_r == 12'h7c8; // @[dec_tlu_ctl.scala 2130:109]
  wire  wr_dicawics_r = _T_718 & _T_788; // @[dec_tlu_ctl.scala 2130:80]
  reg [16:0] dicawics; // @[Reg.scala 27:20]
  wire  _T_792 = io_dec_csr_wraddr_r == 12'h7c9; // @[dec_tlu_ctl.scala 2148:107]
  wire  wr_dicad0_r = _T_718 & _T_792; // @[dec_tlu_ctl.scala 2148:78]
  wire  _T_795 = wr_dicad0_r | io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 2151:53]
  reg [31:0] dicad0; // @[Reg.scala 27:20]
  wire  _T_799 = io_dec_csr_wraddr_r == 12'h7cc; // @[dec_tlu_ctl.scala 2161:108]
  wire  wr_dicad0h_r = _T_718 & _T_799; // @[dec_tlu_ctl.scala 2161:79]
  wire  _T_802 = wr_dicad0h_r | io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 2165:55]
  reg [31:0] dicad0h; // @[Reg.scala 27:20]
  wire  _T_807 = io_dec_csr_wraddr_r == 12'h7ca; // @[dec_tlu_ctl.scala 2173:115]
  wire  _T_808 = _T_718 & _T_807; // @[dec_tlu_ctl.scala 2173:86]
  wire  _T_813 = _T_808 | io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 2177:61]
  reg [6:0] _T_815; // @[Reg.scala 27:20]
  wire [31:0] dicad1 = {25'h0,_T_815}; // @[Cat.scala 29:58]
  wire [38:0] _T_820 = {dicad1[6:0],dicad0h}; // @[Cat.scala 29:58]
  wire  _T_822 = io_allow_dbg_halt_csr_write & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 2205:59]
  wire  _T_823 = _T_822 & io_dec_i0_decode_d; // @[dec_tlu_ctl.scala 2205:82]
  wire  _T_824 = ~io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 2205:105]
  wire  _T_825 = _T_823 & _T_824; // @[dec_tlu_ctl.scala 2205:103]
  wire  _T_827 = io_dec_csr_rdaddr_d == 12'h7cb; // @[dec_tlu_ctl.scala 2205:156]
  wire  _T_830 = io_dec_csr_wraddr_r == 12'h7cb; // @[dec_tlu_ctl.scala 2206:111]
  wire  _T_832 = io_dec_csr_wraddr_r == 12'h7a0; // @[dec_tlu_ctl.scala 2220:76]
  wire  wr_mtsel_r = io_dec_csr_wen_r_mod & _T_832; // @[dec_tlu_ctl.scala 2220:47]
  reg [1:0] mtsel; // @[dec_tlu_ctl.scala 2223:50]
  wire  tdata_load = io_dec_csr_wrdata_r[0] & _T_464; // @[dec_tlu_ctl.scala 2258:49]
  wire  tdata_opcode = io_dec_csr_wrdata_r[2] & _T_464; // @[dec_tlu_ctl.scala 2260:51]
  wire  _T_843 = io_dec_csr_wrdata_r[27] & io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2262:53]
  wire  tdata_action = _T_843 & io_dec_csr_wrdata_r[12]; // @[dec_tlu_ctl.scala 2262:76]
  wire  _T_851 = io_mtdata1_t_3[9] & _T_444; // @[dec_tlu_ctl.scala 2266:91]
  wire  _T_852 = ~_T_851; // @[dec_tlu_ctl.scala 2266:58]
  wire  _T_853 = io_dec_csr_wrdata_r[11] & _T_852; // @[dec_tlu_ctl.scala 2266:56]
  wire  _T_858 = io_mtdata1_t_1[9] & _T_444; // @[dec_tlu_ctl.scala 2267:84]
  wire  _T_859 = ~_T_858; // @[dec_tlu_ctl.scala 2267:51]
  wire  _T_860 = io_dec_csr_wrdata_r[11] & _T_859; // @[dec_tlu_ctl.scala 2267:49]
  wire  _T_861 = mtsel[1] ? _T_853 : _T_860; // @[dec_tlu_ctl.scala 2266:20]
  wire  tdata_chain = mtsel[0] ? 1'h0 : _T_861; // @[dec_tlu_ctl.scala 2265:30]
  wire  _T_865 = ~io_mtdata1_t_2[9]; // @[dec_tlu_ctl.scala 2270:73]
  wire  _T_867 = _T_865 & io_mtdata1_t_2[5]; // @[dec_tlu_ctl.scala 2270:105]
  wire  _T_868 = io_dec_csr_wrdata_r[27] & _T_867; // @[dec_tlu_ctl.scala 2270:70]
  wire  _T_871 = ~io_mtdata1_t_0[9]; // @[dec_tlu_ctl.scala 2271:44]
  wire  _T_873 = _T_871 & io_mtdata1_t_0[5]; // @[dec_tlu_ctl.scala 2271:76]
  wire  _T_874 = io_dec_csr_wrdata_r[27] & _T_873; // @[dec_tlu_ctl.scala 2271:41]
  wire  tdata_kill_write = mtsel[1] ? _T_868 : _T_874; // @[dec_tlu_ctl.scala 2270:35]
  wire [9:0] tdata_wrdata_r = {_T_843,io_dec_csr_wrdata_r[20:19],tdata_action,tdata_chain,io_dec_csr_wrdata_r[7:6],tdata_opcode,io_dec_csr_wrdata_r[1],tdata_load}; // @[Cat.scala 29:58]
  wire  _T_887 = io_dec_csr_wraddr_r == 12'h7a1; // @[dec_tlu_ctl.scala 2276:127]
  wire  _T_888 = io_dec_csr_wen_r_mod & _T_887; // @[dec_tlu_ctl.scala 2276:98]
  wire  _T_889 = mtsel == 2'h0; // @[dec_tlu_ctl.scala 2276:149]
  wire  _T_890 = _T_888 & _T_889; // @[dec_tlu_ctl.scala 2276:140]
  wire  _T_893 = _T_871 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:198]
  wire  wr_mtdata1_t_r_0 = _T_890 & _T_893; // @[dec_tlu_ctl.scala 2276:163]
  wire  _T_898 = mtsel == 2'h1; // @[dec_tlu_ctl.scala 2276:298]
  wire  _T_899 = _T_888 & _T_898; // @[dec_tlu_ctl.scala 2276:289]
  wire  _T_901 = ~io_mtdata1_t_1[9]; // @[dec_tlu_ctl.scala 2276:315]
  wire  _T_902 = _T_901 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:347]
  wire  _T_903 = _T_899 & _T_902; // @[dec_tlu_ctl.scala 2276:312]
  wire  _T_904 = ~tdata_kill_write; // @[dec_tlu_ctl.scala 2276:373]
  wire  wr_mtdata1_t_r_1 = _T_903 & _T_904; // @[dec_tlu_ctl.scala 2276:371]
  wire  _T_909 = mtsel == 2'h2; // @[dec_tlu_ctl.scala 2276:149]
  wire  _T_910 = _T_888 & _T_909; // @[dec_tlu_ctl.scala 2276:140]
  wire  _T_913 = _T_865 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:198]
  wire  wr_mtdata1_t_r_2 = _T_910 & _T_913; // @[dec_tlu_ctl.scala 2276:163]
  wire  _T_918 = mtsel == 2'h3; // @[dec_tlu_ctl.scala 2276:298]
  wire  _T_919 = _T_888 & _T_918; // @[dec_tlu_ctl.scala 2276:289]
  wire  _T_921 = ~io_mtdata1_t_3[9]; // @[dec_tlu_ctl.scala 2276:315]
  wire  _T_922 = _T_921 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:347]
  wire  _T_923 = _T_919 & _T_922; // @[dec_tlu_ctl.scala 2276:312]
  wire  wr_mtdata1_t_r_3 = _T_923 & _T_904; // @[dec_tlu_ctl.scala 2276:371]
  wire  _T_930 = io_update_hit_bit_r[0] | io_mtdata1_t_0[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_933 = {io_mtdata1_t_0[9],_T_930,io_mtdata1_t_0[7:0]}; // @[Cat.scala 29:58]
  wire  _T_939 = io_update_hit_bit_r[1] | io_mtdata1_t_1[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_942 = {io_mtdata1_t_1[9],_T_939,io_mtdata1_t_1[7:0]}; // @[Cat.scala 29:58]
  wire  _T_948 = io_update_hit_bit_r[2] | io_mtdata1_t_2[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_951 = {io_mtdata1_t_2[9],_T_948,io_mtdata1_t_2[7:0]}; // @[Cat.scala 29:58]
  wire  _T_957 = io_update_hit_bit_r[3] | io_mtdata1_t_3[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_960 = {io_mtdata1_t_3[9],_T_957,io_mtdata1_t_3[7:0]}; // @[Cat.scala 29:58]
  wire  _T_963 = io_trigger_enabled[0] | wr_mtdata1_t_r_0; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_965; // @[Reg.scala 27:20]
  wire  _T_967 = io_trigger_enabled[1] | wr_mtdata1_t_r_1; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_969; // @[Reg.scala 27:20]
  wire  _T_971 = io_trigger_enabled[2] | wr_mtdata1_t_r_2; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_973; // @[Reg.scala 27:20]
  wire  _T_975 = io_trigger_enabled[3] | wr_mtdata1_t_r_3; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_977; // @[Reg.scala 27:20]
  wire [31:0] _T_992 = {4'h2,io_mtdata1_t_0[9],6'h1f,io_mtdata1_t_0[8:7],6'h0,io_mtdata1_t_0[6:5],3'h0,io_mtdata1_t_0[4:3],3'h0,io_mtdata1_t_0[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1007 = {4'h2,io_mtdata1_t_1[9],6'h1f,io_mtdata1_t_1[8:7],6'h0,io_mtdata1_t_1[6:5],3'h0,io_mtdata1_t_1[4:3],3'h0,io_mtdata1_t_1[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1022 = {4'h2,io_mtdata1_t_2[9],6'h1f,io_mtdata1_t_2[8:7],6'h0,io_mtdata1_t_2[6:5],3'h0,io_mtdata1_t_2[4:3],3'h0,io_mtdata1_t_2[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1037 = {4'h2,io_mtdata1_t_3[9],6'h1f,io_mtdata1_t_3[8:7],6'h0,io_mtdata1_t_3[6:5],3'h0,io_mtdata1_t_3[4:3],3'h0,io_mtdata1_t_3[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1038 = _T_889 ? _T_992 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1039 = _T_898 ? _T_1007 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1040 = _T_909 ? _T_1022 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1041 = _T_918 ? _T_1037 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1042 = _T_1038 | _T_1039; // @[Mux.scala 27:72]
  wire [31:0] _T_1043 = _T_1042 | _T_1040; // @[Mux.scala 27:72]
  wire [31:0] mtdata1_tsel_out = _T_1043 | _T_1041; // @[Mux.scala 27:72]
  wire  _T_1070 = io_dec_csr_wraddr_r == 12'h7a2; // @[dec_tlu_ctl.scala 2299:105]
  wire  _T_1071 = io_dec_csr_wen_r_mod & _T_1070; // @[dec_tlu_ctl.scala 2299:76]
  wire  _T_1073 = _T_1071 & _T_889; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_0 = _T_1073 & _T_893; // @[dec_tlu_ctl.scala 2299:141]
  wire  _T_1082 = _T_1071 & _T_898; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_1 = _T_1082 & _T_902; // @[dec_tlu_ctl.scala 2299:141]
  wire  _T_1091 = _T_1071 & _T_909; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_2 = _T_1091 & _T_913; // @[dec_tlu_ctl.scala 2299:141]
  wire  _T_1100 = _T_1071 & _T_918; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_3 = _T_1100 & _T_922; // @[dec_tlu_ctl.scala 2299:141]
  reg [31:0] mtdata2_t_0; // @[Reg.scala 27:20]
  reg [31:0] mtdata2_t_1; // @[Reg.scala 27:20]
  reg [31:0] mtdata2_t_2; // @[Reg.scala 27:20]
  reg [31:0] mtdata2_t_3; // @[Reg.scala 27:20]
  wire [31:0] _T_1117 = _T_889 ? mtdata2_t_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1118 = _T_898 ? mtdata2_t_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1119 = _T_909 ? mtdata2_t_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1120 = _T_918 ? mtdata2_t_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1121 = _T_1117 | _T_1118; // @[Mux.scala 27:72]
  wire [31:0] _T_1122 = _T_1121 | _T_1119; // @[Mux.scala 27:72]
  wire [31:0] mtdata2_tsel_out = _T_1122 | _T_1120; // @[Mux.scala 27:72]
  wire  _T_1128 = io_dec_csr_wraddr_r == 12'h320; // @[dec_tlu_ctl.scala 2455:84]
  wire  wr_mcountinhibit_r = io_dec_csr_wen_r_mod & _T_1128; // @[dec_tlu_ctl.scala 2455:55]
  wire  _T_1140 = ~io_dec_tlu_trace_disable; // @[dec_tlu_ctl.scala 2468:42]
  wire  _T_1143 = io_i0_exception_valid_r_d1 | perfmux_flop_io_lsu_i0_exc_r_d1; // @[dec_tlu_ctl.scala 2469:98]
  wire  _T_1144 = ~io_trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 2469:158]
  wire  _T_1145 = io_trigger_hit_r_d1 & _T_1144; // @[dec_tlu_ctl.scala 2469:156]
  wire  _T_1146 = _T_1143 | _T_1145; // @[dec_tlu_ctl.scala 2469:133]
  wire [4:0] _T_1150 = _T_1140 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] dec_tlu_exc_cause_wb1_raw = _T_1150 & io_exc_cause_wb; // @[dec_tlu_ctl.scala 2470:77]
  wire  dec_tlu_int_valid_wb1_raw = _T_1140 & io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 2471:68]
  reg [4:0] dec_tlu_exc_cause_wb2; // @[Reg.scala 27:20]
  wire [4:0] _T_1152 = dec_tlu_exc_cause_wb1_raw ^ dec_tlu_exc_cause_wb2; // @[lib.scala 448:21]
  wire  _T_1153 = |_T_1152; // @[lib.scala 448:29]
  reg  dec_tlu_int_valid_wb2; // @[Reg.scala 27:20]
  wire  _T_1155 = dec_tlu_int_valid_wb1_raw ^ dec_tlu_int_valid_wb2; // @[lib.scala 470:21]
  wire  _T_1156 = |_T_1155; // @[lib.scala 470:29]
  wire [31:0] _T_1164 = {io_core_id,4'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1173 = {21'h3,3'h0,io_mstatus[1],3'h0,io_mstatus[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1178 = {io_mtvec[30:1],1'h0,io_mtvec[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1191 = {1'h0,io_mip[5:3],16'h0,io_mip[2],3'h0,io_mip[1],3'h0,io_mip[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1204 = {1'h0,mie[5:3],16'h0,mie[2],3'h0,mie[1],3'h0,mie[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1216 = {io_mepc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1221 = {28'h0,mscause}; // @[Cat.scala 29:58]
  wire [31:0] _T_1229 = {meivt,10'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1232 = {meivt,meihap,2'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1235 = {28'h0,meicurpl}; // @[Cat.scala 29:58]
  wire [3:0] _T_1237 = perfmux_flop_io_meicidpl; // @[dec_tlu_ctl.scala 2509:97]
  wire [31:0] _T_1238 = {28'h0,_T_1237}; // @[Cat.scala 29:58]
  wire [31:0] _T_1241 = {28'h0,meipt}; // @[Cat.scala 29:58]
  wire [31:0] _T_1244 = {22'h0,_T_376,mcgc_int[8:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1247 = {13'h0,_T_403,3'h0,mfdc_int[12],mfdc_int[11:7],_T_407,mfdc_int[5:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1251 = {16'h4000,io_dcsr[15:2],2'h3}; // @[Cat.scala 29:58]
  wire [31:0] _T_1253 = {io_dpc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1269 = {7'h0,dicawics[16],2'h0,dicawics[15:14],3'h0,dicawics[13:0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1272 = {30'h0,mtsel}; // @[Cat.scala 29:58]
  wire [31:0] _T_1284 = perf_csrs_io_mhpmc3; // @[dec_tlu_ctl.scala 2525:77]
  wire [31:0] _T_1286 = perf_csrs_io_mhpmc4; // @[dec_tlu_ctl.scala 2526:77]
  wire [31:0] _T_1288 = perf_csrs_io_mhpmc5; // @[dec_tlu_ctl.scala 2527:77]
  wire [31:0] _T_1290 = perf_csrs_io_mhpmc6; // @[dec_tlu_ctl.scala 2528:77]
  wire [31:0] _T_1292 = perf_csrs_io_mhpmc3h; // @[dec_tlu_ctl.scala 2529:78]
  wire [31:0] _T_1294 = perf_csrs_io_mhpmc4h; // @[dec_tlu_ctl.scala 2530:78]
  wire [31:0] _T_1296 = perf_csrs_io_mhpmc5h; // @[dec_tlu_ctl.scala 2531:78]
  wire [31:0] _T_1298 = perf_csrs_io_mhpmc6h; // @[dec_tlu_ctl.scala 2532:78]
  wire [31:0] _T_1301 = {26'h0,mfdht}; // @[Cat.scala 29:58]
  wire [31:0] _T_1304 = {30'h0,mfdhs}; // @[Cat.scala 29:58]
  wire [9:0] _T_1306 = perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 2535:92]
  wire [31:0] _T_1307 = {22'h0,_T_1306}; // @[Cat.scala 29:58]
  wire [9:0] _T_1309 = perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 2536:92]
  wire [31:0] _T_1310 = {22'h0,_T_1309}; // @[Cat.scala 29:58]
  wire [9:0] _T_1312 = perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 2537:91]
  wire [31:0] _T_1313 = {22'h0,_T_1312}; // @[Cat.scala 29:58]
  wire [9:0] _T_1315 = perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 2538:91]
  wire [31:0] _T_1316 = {22'h0,_T_1315}; // @[Cat.scala 29:58]
  wire [31:0] _T_1319 = {25'h0,temp_ncount6_2,1'h0,temp_ncount0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1322 = {30'h0,mpmc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1325 = io_csr_pkt_csr_misa ? 32'h40001104 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1326 = io_csr_pkt_csr_mvendorid ? 32'h45 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1327 = io_csr_pkt_csr_marchid ? 32'h10 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1328 = io_csr_pkt_csr_mimpid ? 32'h3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1329 = io_csr_pkt_csr_mhartid ? _T_1164 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1330 = io_csr_pkt_csr_mstatus ? _T_1173 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1331 = io_csr_pkt_csr_mtvec ? _T_1178 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1332 = io_csr_pkt_csr_mip ? _T_1191 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1333 = io_csr_pkt_csr_mie ? _T_1204 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1334 = io_csr_pkt_csr_mcyclel ? mcyclel : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1335 = io_csr_pkt_csr_mcycleh ? mcycleh_inc : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1336 = io_csr_pkt_csr_minstretl ? minstretl : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1337 = io_csr_pkt_csr_minstreth ? minstreth_inc : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1338 = io_csr_pkt_csr_mscratch ? mscratch : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1339 = io_csr_pkt_csr_mepc ? _T_1216 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1340 = io_csr_pkt_csr_mcause ? mcause : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1341 = io_csr_pkt_csr_mscause ? _T_1221 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1342 = io_csr_pkt_csr_mtval ? mtval : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1343 = io_csr_pkt_csr_mrac ? mrac : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1344 = io_csr_pkt_csr_mdseac ? mdseac : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1345 = io_csr_pkt_csr_meivt ? _T_1229 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1346 = io_csr_pkt_csr_meihap ? _T_1232 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1347 = io_csr_pkt_csr_meicurpl ? _T_1235 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1348 = io_csr_pkt_csr_meicidpl ? _T_1238 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1349 = io_csr_pkt_csr_meipt ? _T_1241 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1350 = io_csr_pkt_csr_mcgc ? _T_1244 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1351 = io_csr_pkt_csr_mfdc ? _T_1247 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1352 = io_csr_pkt_csr_dcsr ? _T_1251 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1353 = io_csr_pkt_csr_dpc ? _T_1253 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1354 = io_csr_pkt_csr_dicad0 ? dicad0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1355 = io_csr_pkt_csr_dicad0h ? dicad0h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1356 = io_csr_pkt_csr_dicad1 ? dicad1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1357 = io_csr_pkt_csr_dicawics ? _T_1269 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1358 = io_csr_pkt_csr_mtsel ? _T_1272 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1359 = io_csr_pkt_csr_mtdata1 ? mtdata1_tsel_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1360 = io_csr_pkt_csr_mtdata2 ? mtdata2_tsel_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1361 = io_csr_pkt_csr_micect ? micect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1362 = io_csr_pkt_csr_miccmect ? miccmect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1363 = io_csr_pkt_csr_mdccmect ? mdccmect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1364 = io_csr_pkt_csr_mhpmc3 ? _T_1284 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1365 = io_csr_pkt_csr_mhpmc4 ? _T_1286 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1366 = io_csr_pkt_csr_mhpmc5 ? _T_1288 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1367 = io_csr_pkt_csr_mhpmc6 ? _T_1290 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1368 = io_csr_pkt_csr_mhpmc3h ? _T_1292 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1369 = io_csr_pkt_csr_mhpmc4h ? _T_1294 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1370 = io_csr_pkt_csr_mhpmc5h ? _T_1296 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1371 = io_csr_pkt_csr_mhpmc6h ? _T_1298 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1372 = io_csr_pkt_csr_mfdht ? _T_1301 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1373 = io_csr_pkt_csr_mfdhs ? _T_1304 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1374 = io_csr_pkt_csr_mhpme3 ? _T_1307 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1375 = io_csr_pkt_csr_mhpme4 ? _T_1310 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1376 = io_csr_pkt_csr_mhpme5 ? _T_1313 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1377 = io_csr_pkt_csr_mhpme6 ? _T_1316 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1378 = io_csr_pkt_csr_mcountinhibit ? _T_1319 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1379 = io_csr_pkt_csr_mpmc ? _T_1322 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1380 = io_dec_timer_read_d ? io_dec_timer_rddata_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1381 = _T_1325 | _T_1326; // @[Mux.scala 27:72]
  wire [31:0] _T_1382 = _T_1381 | _T_1327; // @[Mux.scala 27:72]
  wire [31:0] _T_1383 = _T_1382 | _T_1328; // @[Mux.scala 27:72]
  wire [31:0] _T_1384 = _T_1383 | _T_1329; // @[Mux.scala 27:72]
  wire [31:0] _T_1385 = _T_1384 | _T_1330; // @[Mux.scala 27:72]
  wire [31:0] _T_1386 = _T_1385 | _T_1331; // @[Mux.scala 27:72]
  wire [31:0] _T_1387 = _T_1386 | _T_1332; // @[Mux.scala 27:72]
  wire [31:0] _T_1388 = _T_1387 | _T_1333; // @[Mux.scala 27:72]
  wire [31:0] _T_1389 = _T_1388 | _T_1334; // @[Mux.scala 27:72]
  wire [31:0] _T_1390 = _T_1389 | _T_1335; // @[Mux.scala 27:72]
  wire [31:0] _T_1391 = _T_1390 | _T_1336; // @[Mux.scala 27:72]
  wire [31:0] _T_1392 = _T_1391 | _T_1337; // @[Mux.scala 27:72]
  wire [31:0] _T_1393 = _T_1392 | _T_1338; // @[Mux.scala 27:72]
  wire [31:0] _T_1394 = _T_1393 | _T_1339; // @[Mux.scala 27:72]
  wire [31:0] _T_1395 = _T_1394 | _T_1340; // @[Mux.scala 27:72]
  wire [31:0] _T_1396 = _T_1395 | _T_1341; // @[Mux.scala 27:72]
  wire [31:0] _T_1397 = _T_1396 | _T_1342; // @[Mux.scala 27:72]
  wire [31:0] _T_1398 = _T_1397 | _T_1343; // @[Mux.scala 27:72]
  wire [31:0] _T_1399 = _T_1398 | _T_1344; // @[Mux.scala 27:72]
  wire [31:0] _T_1400 = _T_1399 | _T_1345; // @[Mux.scala 27:72]
  wire [31:0] _T_1401 = _T_1400 | _T_1346; // @[Mux.scala 27:72]
  wire [31:0] _T_1402 = _T_1401 | _T_1347; // @[Mux.scala 27:72]
  wire [31:0] _T_1403 = _T_1402 | _T_1348; // @[Mux.scala 27:72]
  wire [31:0] _T_1404 = _T_1403 | _T_1349; // @[Mux.scala 27:72]
  wire [31:0] _T_1405 = _T_1404 | _T_1350; // @[Mux.scala 27:72]
  wire [31:0] _T_1406 = _T_1405 | _T_1351; // @[Mux.scala 27:72]
  wire [31:0] _T_1407 = _T_1406 | _T_1352; // @[Mux.scala 27:72]
  wire [31:0] _T_1408 = _T_1407 | _T_1353; // @[Mux.scala 27:72]
  wire [31:0] _T_1409 = _T_1408 | _T_1354; // @[Mux.scala 27:72]
  wire [31:0] _T_1410 = _T_1409 | _T_1355; // @[Mux.scala 27:72]
  wire [31:0] _T_1411 = _T_1410 | _T_1356; // @[Mux.scala 27:72]
  wire [31:0] _T_1412 = _T_1411 | _T_1357; // @[Mux.scala 27:72]
  wire [31:0] _T_1413 = _T_1412 | _T_1358; // @[Mux.scala 27:72]
  wire [31:0] _T_1414 = _T_1413 | _T_1359; // @[Mux.scala 27:72]
  wire [31:0] _T_1415 = _T_1414 | _T_1360; // @[Mux.scala 27:72]
  wire [31:0] _T_1416 = _T_1415 | _T_1361; // @[Mux.scala 27:72]
  wire [31:0] _T_1417 = _T_1416 | _T_1362; // @[Mux.scala 27:72]
  wire [31:0] _T_1418 = _T_1417 | _T_1363; // @[Mux.scala 27:72]
  wire [31:0] _T_1419 = _T_1418 | _T_1364; // @[Mux.scala 27:72]
  wire [31:0] _T_1420 = _T_1419 | _T_1365; // @[Mux.scala 27:72]
  wire [31:0] _T_1421 = _T_1420 | _T_1366; // @[Mux.scala 27:72]
  wire [31:0] _T_1422 = _T_1421 | _T_1367; // @[Mux.scala 27:72]
  wire [31:0] _T_1423 = _T_1422 | _T_1368; // @[Mux.scala 27:72]
  wire [31:0] _T_1424 = _T_1423 | _T_1369; // @[Mux.scala 27:72]
  wire [31:0] _T_1425 = _T_1424 | _T_1370; // @[Mux.scala 27:72]
  wire [31:0] _T_1426 = _T_1425 | _T_1371; // @[Mux.scala 27:72]
  wire [31:0] _T_1427 = _T_1426 | _T_1372; // @[Mux.scala 27:72]
  wire [31:0] _T_1428 = _T_1427 | _T_1373; // @[Mux.scala 27:72]
  wire [31:0] _T_1429 = _T_1428 | _T_1374; // @[Mux.scala 27:72]
  wire [31:0] _T_1430 = _T_1429 | _T_1375; // @[Mux.scala 27:72]
  wire [31:0] _T_1431 = _T_1430 | _T_1376; // @[Mux.scala 27:72]
  wire [31:0] _T_1432 = _T_1431 | _T_1377; // @[Mux.scala 27:72]
  wire [31:0] _T_1433 = _T_1432 | _T_1378; // @[Mux.scala 27:72]
  wire [31:0] _T_1434 = _T_1433 | _T_1379; // @[Mux.scala 27:72]
  perf_mux_and_flops perfmux_flop ( // @[dec_tlu_ctl.scala 1455:34]
    .reset(perfmux_flop_reset),
    .io_mhpmc_inc_r_0(perfmux_flop_io_mhpmc_inc_r_0),
    .io_mhpmc_inc_r_1(perfmux_flop_io_mhpmc_inc_r_1),
    .io_mhpmc_inc_r_2(perfmux_flop_io_mhpmc_inc_r_2),
    .io_mhpmc_inc_r_3(perfmux_flop_io_mhpmc_inc_r_3),
    .io_mcountinhibit(perfmux_flop_io_mcountinhibit),
    .io_mhpme_vec_0(perfmux_flop_io_mhpme_vec_0),
    .io_mhpme_vec_1(perfmux_flop_io_mhpme_vec_1),
    .io_mhpme_vec_2(perfmux_flop_io_mhpme_vec_2),
    .io_mhpme_vec_3(perfmux_flop_io_mhpme_vec_3),
    .io_ifu_pmu_ic_hit(perfmux_flop_io_ifu_pmu_ic_hit),
    .io_ifu_pmu_ic_miss(perfmux_flop_io_ifu_pmu_ic_miss),
    .io_tlu_i0_commit_cmt(perfmux_flop_io_tlu_i0_commit_cmt),
    .io_illegal_r(perfmux_flop_io_illegal_r),
    .io_exu_pmu_i0_pc4(perfmux_flop_io_exu_pmu_i0_pc4),
    .io_ifu_pmu_instr_aligned(perfmux_flop_io_ifu_pmu_instr_aligned),
    .io_dec_pmu_instr_decoded(perfmux_flop_io_dec_pmu_instr_decoded),
    .io_dec_tlu_packet_r_pmu_i0_itype(perfmux_flop_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(perfmux_flop_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(perfmux_flop_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(perfmux_flop_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_exu_pmu_i0_br_misp(perfmux_flop_io_exu_pmu_i0_br_misp),
    .io_dec_pmu_decode_stall(perfmux_flop_io_dec_pmu_decode_stall),
    .io_exu_pmu_i0_br_ataken(perfmux_flop_io_exu_pmu_i0_br_ataken),
    .io_ifu_pmu_fetch_stall(perfmux_flop_io_ifu_pmu_fetch_stall),
    .io_dec_pmu_postsync_stall(perfmux_flop_io_dec_pmu_postsync_stall),
    .io_dec_pmu_presync_stall(perfmux_flop_io_dec_pmu_presync_stall),
    .io_lsu_store_stall_any(perfmux_flop_io_lsu_store_stall_any),
    .io_dma_dccm_stall_any(perfmux_flop_io_dma_dccm_stall_any),
    .io_dma_iccm_stall_any(perfmux_flop_io_dma_iccm_stall_any),
    .io_i0_exception_valid_r(perfmux_flop_io_i0_exception_valid_r),
    .io_dec_tlu_pmu_fw_halted(perfmux_flop_io_dec_tlu_pmu_fw_halted),
    .io_dma_pmu_any_read(perfmux_flop_io_dma_pmu_any_read),
    .io_dma_pmu_any_write(perfmux_flop_io_dma_pmu_any_write),
    .io_dma_pmu_dccm_read(perfmux_flop_io_dma_pmu_dccm_read),
    .io_dma_pmu_dccm_write(perfmux_flop_io_dma_pmu_dccm_write),
    .io_lsu_pmu_load_external_r(perfmux_flop_io_lsu_pmu_load_external_r),
    .io_lsu_pmu_store_external_r(perfmux_flop_io_lsu_pmu_store_external_r),
    .io_mstatus(perfmux_flop_io_mstatus),
    .io_mie(perfmux_flop_io_mie),
    .io_ifu_pmu_bus_trxn(perfmux_flop_io_ifu_pmu_bus_trxn),
    .io_lsu_pmu_bus_trxn(perfmux_flop_io_lsu_pmu_bus_trxn),
    .io_lsu_pmu_bus_misaligned(perfmux_flop_io_lsu_pmu_bus_misaligned),
    .io_ifu_pmu_bus_error(perfmux_flop_io_ifu_pmu_bus_error),
    .io_lsu_pmu_bus_error(perfmux_flop_io_lsu_pmu_bus_error),
    .io_ifu_pmu_bus_busy(perfmux_flop_io_ifu_pmu_bus_busy),
    .io_lsu_pmu_bus_busy(perfmux_flop_io_lsu_pmu_bus_busy),
    .io_i0_trigger_hit_r(perfmux_flop_io_i0_trigger_hit_r),
    .io_lsu_exc_valid_r(perfmux_flop_io_lsu_exc_valid_r),
    .io_take_timer_int(perfmux_flop_io_take_timer_int),
    .io_take_int_timer0_int(perfmux_flop_io_take_int_timer0_int),
    .io_take_int_timer1_int(perfmux_flop_io_take_int_timer1_int),
    .io_take_ext_int(perfmux_flop_io_take_ext_int),
    .io_tlu_flush_lower_r(perfmux_flop_io_tlu_flush_lower_r),
    .io_dec_tlu_br0_error_r(perfmux_flop_io_dec_tlu_br0_error_r),
    .io_rfpc_i0_r(perfmux_flop_io_rfpc_i0_r),
    .io_dec_tlu_br0_start_error_r(perfmux_flop_io_dec_tlu_br0_start_error_r),
    .io_mcyclel_cout_f(perfmux_flop_io_mcyclel_cout_f),
    .io_minstret_enable_f(perfmux_flop_io_minstret_enable_f),
    .io_minstretl_cout_f(perfmux_flop_io_minstretl_cout_f),
    .io_meicidpl(perfmux_flop_io_meicidpl),
    .io_icache_rd_valid_f(perfmux_flop_io_icache_rd_valid_f),
    .io_icache_wr_valid_f(perfmux_flop_io_icache_wr_valid_f),
    .io_mhpmc_inc_r_d1_0(perfmux_flop_io_mhpmc_inc_r_d1_0),
    .io_mhpmc_inc_r_d1_1(perfmux_flop_io_mhpmc_inc_r_d1_1),
    .io_mhpmc_inc_r_d1_2(perfmux_flop_io_mhpmc_inc_r_d1_2),
    .io_mhpmc_inc_r_d1_3(perfmux_flop_io_mhpmc_inc_r_d1_3),
    .io_perfcnt_halted_d1(perfmux_flop_io_perfcnt_halted_d1),
    .io_mdseac_locked_f(perfmux_flop_io_mdseac_locked_f),
    .io_lsu_single_ecc_error_r_d1(perfmux_flop_io_lsu_single_ecc_error_r_d1),
    .io_lsu_i0_exc_r_d1(perfmux_flop_io_lsu_i0_exc_r_d1),
    .io_take_ext_int_start_d1(perfmux_flop_io_take_ext_int_start_d1),
    .io_take_ext_int_start_d2(perfmux_flop_io_take_ext_int_start_d2),
    .io_take_ext_int_start_d3(perfmux_flop_io_take_ext_int_start_d3),
    .io_ext_int_freeze_d1(perfmux_flop_io_ext_int_freeze_d1),
    .io_mip(perfmux_flop_io_mip),
    .io_mdseac_locked_ns(perfmux_flop_io_mdseac_locked_ns),
    .io_lsu_single_ecc_error_r(perfmux_flop_io_lsu_single_ecc_error_r),
    .io_lsu_i0_exc_r(perfmux_flop_io_lsu_i0_exc_r),
    .io_take_ext_int_start(perfmux_flop_io_take_ext_int_start),
    .io_ext_int_freeze(perfmux_flop_io_ext_int_freeze),
    .io_mip_ns(perfmux_flop_io_mip_ns),
    .io_mcyclel_cout(perfmux_flop_io_mcyclel_cout),
    .io_wr_mcycleh_r(perfmux_flop_io_wr_mcycleh_r),
    .io_mcyclel_cout_in(perfmux_flop_io_mcyclel_cout_in),
    .io_minstret_enable(perfmux_flop_io_minstret_enable),
    .io_minstretl_cout_ns(perfmux_flop_io_minstretl_cout_ns),
    .io_meicidpl_ns(perfmux_flop_io_meicidpl_ns),
    .io_icache_rd_valid(perfmux_flop_io_icache_rd_valid),
    .io_icache_wr_valid(perfmux_flop_io_icache_wr_valid),
    .io_perfcnt_halted(perfmux_flop_io_perfcnt_halted),
    .io_mstatus_ns(perfmux_flop_io_mstatus_ns),
    .io_free_l2clk(perfmux_flop_io_free_l2clk)
  );
  perf_csr perf_csrs ( // @[dec_tlu_ctl.scala 1456:31]
    .clock(perf_csrs_clock),
    .reset(perf_csrs_reset),
    .io_free_l2clk(perf_csrs_io_free_l2clk),
    .io_dec_tlu_dbg_halted(perf_csrs_io_dec_tlu_dbg_halted),
    .io_dcsr(perf_csrs_io_dcsr),
    .io_dec_tlu_pmu_fw_halted(perf_csrs_io_dec_tlu_pmu_fw_halted),
    .io_mhpme_vec_0(perf_csrs_io_mhpme_vec_0),
    .io_mhpme_vec_1(perf_csrs_io_mhpme_vec_1),
    .io_mhpme_vec_2(perf_csrs_io_mhpme_vec_2),
    .io_mhpme_vec_3(perf_csrs_io_mhpme_vec_3),
    .io_dec_csr_wen_r_mod(perf_csrs_io_dec_csr_wen_r_mod),
    .io_dec_csr_wraddr_r(perf_csrs_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(perf_csrs_io_dec_csr_wrdata_r),
    .io_mhpmc_inc_r_0(perf_csrs_io_mhpmc_inc_r_0),
    .io_mhpmc_inc_r_1(perf_csrs_io_mhpmc_inc_r_1),
    .io_mhpmc_inc_r_2(perf_csrs_io_mhpmc_inc_r_2),
    .io_mhpmc_inc_r_3(perf_csrs_io_mhpmc_inc_r_3),
    .io_mhpmc_inc_r_d1_0(perf_csrs_io_mhpmc_inc_r_d1_0),
    .io_mhpmc_inc_r_d1_1(perf_csrs_io_mhpmc_inc_r_d1_1),
    .io_mhpmc_inc_r_d1_2(perf_csrs_io_mhpmc_inc_r_d1_2),
    .io_mhpmc_inc_r_d1_3(perf_csrs_io_mhpmc_inc_r_d1_3),
    .io_perfcnt_halted_d1(perf_csrs_io_perfcnt_halted_d1),
    .io_mhpmc3h(perf_csrs_io_mhpmc3h),
    .io_mhpmc3(perf_csrs_io_mhpmc3),
    .io_mhpmc4h(perf_csrs_io_mhpmc4h),
    .io_mhpmc4(perf_csrs_io_mhpmc4),
    .io_mhpmc5h(perf_csrs_io_mhpmc5h),
    .io_mhpmc5(perf_csrs_io_mhpmc5),
    .io_mhpmc6h(perf_csrs_io_mhpmc6h),
    .io_mhpmc6(perf_csrs_io_mhpmc6),
    .io_mhpme3(perf_csrs_io_mhpme3),
    .io_mhpme4(perf_csrs_io_mhpme4),
    .io_mhpme5(perf_csrs_io_mhpme5),
    .io_mhpme6(perf_csrs_io_mhpme6),
    .io_dec_tlu_perfcnt0(perf_csrs_io_dec_tlu_perfcnt0),
    .io_dec_tlu_perfcnt1(perf_csrs_io_dec_tlu_perfcnt1),
    .io_dec_tlu_perfcnt2(perf_csrs_io_dec_tlu_perfcnt2),
    .io_dec_tlu_perfcnt3(perf_csrs_io_dec_tlu_perfcnt3)
  );
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  rvclkhdr rvclkhdr_12 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en)
  );
  rvclkhdr rvclkhdr_13 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en)
  );
  rvclkhdr rvclkhdr_14 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en)
  );
  rvclkhdr rvclkhdr_15 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en)
  );
  rvclkhdr rvclkhdr_16 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en)
  );
  rvclkhdr rvclkhdr_17 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en)
  );
  rvclkhdr rvclkhdr_18 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en)
  );
  rvclkhdr rvclkhdr_19 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_19_io_clk),
    .io_en(rvclkhdr_19_io_en)
  );
  rvclkhdr rvclkhdr_20 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_20_io_clk),
    .io_en(rvclkhdr_20_io_en)
  );
  rvclkhdr rvclkhdr_21 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_21_io_clk),
    .io_en(rvclkhdr_21_io_en)
  );
  rvclkhdr rvclkhdr_22 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_22_io_clk),
    .io_en(rvclkhdr_22_io_en)
  );
  rvclkhdr rvclkhdr_23 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_23_io_clk),
    .io_en(rvclkhdr_23_io_en)
  );
  rvclkhdr rvclkhdr_24 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_24_io_clk),
    .io_en(rvclkhdr_24_io_en)
  );
  rvclkhdr rvclkhdr_25 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_25_io_clk),
    .io_en(rvclkhdr_25_io_en)
  );
  rvclkhdr rvclkhdr_26 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_26_io_clk),
    .io_en(rvclkhdr_26_io_en)
  );
  rvclkhdr rvclkhdr_27 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_27_io_clk),
    .io_en(rvclkhdr_27_io_en)
  );
  rvclkhdr rvclkhdr_28 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_28_io_clk),
    .io_en(rvclkhdr_28_io_en)
  );
  rvclkhdr rvclkhdr_29 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_29_io_clk),
    .io_en(rvclkhdr_29_io_en)
  );
  rvclkhdr rvclkhdr_30 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_30_io_clk),
    .io_en(rvclkhdr_30_io_en)
  );
  rvclkhdr rvclkhdr_31 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_31_io_clk),
    .io_en(rvclkhdr_31_io_en)
  );
  rvclkhdr rvclkhdr_32 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_32_io_clk),
    .io_en(rvclkhdr_32_io_en)
  );
  rvclkhdr rvclkhdr_33 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_33_io_clk),
    .io_en(rvclkhdr_33_io_en)
  );
  rvclkhdr rvclkhdr_34 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_34_io_clk),
    .io_en(rvclkhdr_34_io_en)
  );
  assign io_dec_tlu_ic_diag_pkt_icache_wrdata = {_T_820,dicad0}; // @[dec_tlu_ctl.scala 2200:63]
  assign io_dec_tlu_ic_diag_pkt_icache_dicawics = dicawics; // @[dec_tlu_ctl.scala 2203:48]
  assign io_dec_tlu_ic_diag_pkt_icache_rd_valid = perfmux_flop_io_icache_rd_valid_f; // @[dec_tlu_ctl.scala 2211:48]
  assign io_dec_tlu_ic_diag_pkt_icache_wr_valid = perfmux_flop_io_icache_wr_valid_f; // @[dec_tlu_ctl.scala 2212:48]
  assign io_trigger_pkt_any_0_select = io_mtdata1_t_0[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_0_match_pkt = io_mtdata1_t_0[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_0_store = io_mtdata1_t_0[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_0_load = io_mtdata1_t_0[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_0_execute = io_mtdata1_t_0[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_0_m = io_mtdata1_t_0[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_0_tdata2 = mtdata2_t_0; // @[dec_tlu_ctl.scala 2305:59]
  assign io_trigger_pkt_any_1_select = io_mtdata1_t_1[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_1_match_pkt = io_mtdata1_t_1[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_1_store = io_mtdata1_t_1[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_1_load = io_mtdata1_t_1[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_1_execute = io_mtdata1_t_1[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_1_m = io_mtdata1_t_1[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_1_tdata2 = mtdata2_t_1; // @[dec_tlu_ctl.scala 2305:59]
  assign io_trigger_pkt_any_2_select = io_mtdata1_t_2[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_2_match_pkt = io_mtdata1_t_2[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_2_store = io_mtdata1_t_2[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_2_load = io_mtdata1_t_2[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_2_execute = io_mtdata1_t_2[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_2_m = io_mtdata1_t_2[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_2_tdata2 = mtdata2_t_2; // @[dec_tlu_ctl.scala 2305:59]
  assign io_trigger_pkt_any_3_select = io_mtdata1_t_3[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_3_match_pkt = io_mtdata1_t_3[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_3_store = io_mtdata1_t_3[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_3_load = io_mtdata1_t_3[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_3_execute = io_mtdata1_t_3[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_3_m = io_mtdata1_t_3[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_3_tdata2 = mtdata2_t_3; // @[dec_tlu_ctl.scala 2305:59]
  assign io_dec_tlu_int_valid_wb1 = dec_tlu_int_valid_wb2; // @[dec_tlu_ctl.scala 2478:34]
  assign io_dec_tlu_i0_exc_valid_wb1 = _T_1140 & _T_1146; // @[dec_tlu_ctl.scala 2469:39]
  assign io_dec_tlu_i0_valid_wb1 = _T_1140 & io_i0_valid_wb; // @[dec_tlu_ctl.scala 2468:39]
  assign io_dec_tlu_mtval_wb1 = mtval; // @[dec_tlu_ctl.scala 2479:31]
  assign io_dec_tlu_exc_cause_wb1 = dec_tlu_int_valid_wb2 ? dec_tlu_exc_cause_wb2 : dec_tlu_exc_cause_wb1_raw; // @[dec_tlu_ctl.scala 2477:34]
  assign io_dec_tlu_perfcnt0 = perf_csrs_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 2436:29]
  assign io_dec_tlu_perfcnt1 = perf_csrs_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 2437:29]
  assign io_dec_tlu_perfcnt2 = perf_csrs_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 2438:29]
  assign io_dec_tlu_perfcnt3 = perf_csrs_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 2439:29]
  assign io_dec_tlu_misc_clk_override = mcgc[8]; // @[dec_tlu_ctl.scala 1757:38]
  assign io_dec_tlu_picio_clk_override = mcgc[9]; // @[dec_tlu_ctl.scala 1756:39]
  assign io_dec_tlu_dec_clk_override = mcgc[7]; // @[dec_tlu_ctl.scala 1758:38]
  assign io_dec_tlu_ifu_clk_override = mcgc[5]; // @[dec_tlu_ctl.scala 1759:38]
  assign io_dec_tlu_lsu_clk_override = mcgc[4]; // @[dec_tlu_ctl.scala 1760:38]
  assign io_dec_tlu_bus_clk_override = mcgc[3]; // @[dec_tlu_ctl.scala 1761:38]
  assign io_dec_tlu_pic_clk_override = mcgc[2]; // @[dec_tlu_ctl.scala 1762:38]
  assign io_dec_tlu_dccm_clk_override = mcgc[1]; // @[dec_tlu_ctl.scala 1763:38]
  assign io_dec_tlu_icm_clk_override = mcgc[0]; // @[dec_tlu_ctl.scala 1764:38]
  assign io_dec_csr_rddata_d = _T_1434 | _T_1380; // @[dec_tlu_ctl.scala 2485:28]
  assign io_dec_tlu_pipelining_disable = mfdc[0]; // @[dec_tlu_ctl.scala 1813:46]
  assign io_dec_tlu_wr_pause_r = _T_426 & _T_427; // @[dec_tlu_ctl.scala 1822:31]
  assign io_dec_tlu_meipt = meipt; // @[dec_tlu_ctl.scala 2050:26]
  assign io_dec_tlu_meicurpl = meicurpl; // @[dec_tlu_ctl.scala 2014:29]
  assign io_dec_tlu_meihap = {meivt,meihap}; // @[dec_tlu_ctl.scala 2000:27]
  assign io_dec_tlu_mrac_ff = mrac; // @[dec_tlu_ctl.scala 1852:28]
  assign io_dec_tlu_wb_coalescing_disable = mfdc[2]; // @[dec_tlu_ctl.scala 1812:46]
  assign io_dec_tlu_bpred_disable = mfdc[3]; // @[dec_tlu_ctl.scala 1811:46]
  assign io_dec_tlu_sideeffect_posted_disable = mfdc[6]; // @[dec_tlu_ctl.scala 1810:46]
  assign io_dec_tlu_core_ecc_disable = mfdc[8]; // @[dec_tlu_ctl.scala 1809:46]
  assign io_dec_tlu_external_ldfwd_disable = mfdc[11]; // @[dec_tlu_ctl.scala 1808:46]
  assign io_dec_tlu_dma_qos_prty = mfdc[18:16]; // @[dec_tlu_ctl.scala 1806:46]
  assign io_dec_tlu_trace_disable = mfdc[12]; // @[dec_tlu_ctl.scala 1807:46]
  assign io_dec_csr_wen_r_mod = _T_1 & _T_2; // @[dec_tlu_ctl.scala 1472:30]
  assign io_fw_halt_req = _T_557 & _T_558; // @[dec_tlu_ctl.scala 1887:24]
  assign io_mstatus = perfmux_flop_io_mstatus; // @[dec_tlu_ctl.scala 2348:26]
  assign io_mstatus_mie_ns = io_mstatus[0] & _T_54; // @[dec_tlu_ctl.scala 1489:27]
  assign io_dcsr = _T_756; // @[dec_tlu_ctl.scala 2098:17]
  assign io_mtvec = _T_61; // @[dec_tlu_ctl.scala 1502:18]
  assign io_mip = perfmux_flop_io_mip; // @[dec_tlu_ctl.scala 2349:18]
  assign io_mie_ns = wr_mie_r ? _T_76 : mie; // @[dec_tlu_ctl.scala 1531:19]
  assign io_npc_r = _T_189 | _T_187; // @[dec_tlu_ctl.scala 1635:18]
  assign io_npc_r_d1 = _T_196; // @[dec_tlu_ctl.scala 1641:21]
  assign io_mepc = _T_231; // @[dec_tlu_ctl.scala 1660:17]
  assign io_mdseac_locked_ns = mdseac_en | _T_545; // @[dec_tlu_ctl.scala 1870:29]
  assign io_mdseac_locked_f = perfmux_flop_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 2378:42]
  assign io_ext_int_freeze_d1 = perfmux_flop_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 2385:42]
  assign io_take_ext_int_start_d1 = perfmux_flop_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 2382:42]
  assign io_take_ext_int_start_d2 = perfmux_flop_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 2383:42]
  assign io_take_ext_int_start_d3 = perfmux_flop_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 2384:42]
  assign io_force_halt = mfdht[0] & _T_665; // @[dec_tlu_ctl.scala 1977:23]
  assign io_dpc = _T_781; // @[dec_tlu_ctl.scala 2115:16]
  assign io_mtdata1_t_0 = _T_965; // @[dec_tlu_ctl.scala 2282:47]
  assign io_mtdata1_t_1 = _T_969; // @[dec_tlu_ctl.scala 2282:47]
  assign io_mtdata1_t_2 = _T_973; // @[dec_tlu_ctl.scala 2282:47]
  assign io_mtdata1_t_3 = _T_977; // @[dec_tlu_ctl.scala 2282:47]
  assign perfmux_flop_reset = reset;
  assign perfmux_flop_io_mcountinhibit = {_T_1138,temp_ncount0}; // @[dec_tlu_ctl.scala 2321:57]
  assign perfmux_flop_io_mhpme_vec_0 = perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_mhpme_vec_1 = perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_mhpme_vec_2 = perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_mhpme_vec_3 = perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_ifu_pmu_ic_hit = io_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 2323:57]
  assign perfmux_flop_io_ifu_pmu_ic_miss = io_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 2324:57]
  assign perfmux_flop_io_tlu_i0_commit_cmt = io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2325:57]
  assign perfmux_flop_io_illegal_r = io_illegal_r; // @[dec_tlu_ctl.scala 2326:57]
  assign perfmux_flop_io_exu_pmu_i0_pc4 = io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 2327:57]
  assign perfmux_flop_io_ifu_pmu_instr_aligned = io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 2328:57]
  assign perfmux_flop_io_dec_pmu_instr_decoded = io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 2329:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_divide = io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_exu_pmu_i0_br_misp = io_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 2331:57]
  assign perfmux_flop_io_dec_pmu_decode_stall = io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 2332:57]
  assign perfmux_flop_io_exu_pmu_i0_br_ataken = io_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 2333:57]
  assign perfmux_flop_io_ifu_pmu_fetch_stall = io_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 2334:57]
  assign perfmux_flop_io_dec_pmu_postsync_stall = io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 2335:57]
  assign perfmux_flop_io_dec_pmu_presync_stall = io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 2336:57]
  assign perfmux_flop_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 2337:57]
  assign perfmux_flop_io_dma_dccm_stall_any = io_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 2338:57]
  assign perfmux_flop_io_dma_iccm_stall_any = io_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 2339:57]
  assign perfmux_flop_io_i0_exception_valid_r = io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 2340:57]
  assign perfmux_flop_io_dec_tlu_pmu_fw_halted = io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2341:57]
  assign perfmux_flop_io_dma_pmu_any_read = io_dma_pmu_any_read; // @[dec_tlu_ctl.scala 2342:57]
  assign perfmux_flop_io_dma_pmu_any_write = io_dma_pmu_any_write; // @[dec_tlu_ctl.scala 2343:57]
  assign perfmux_flop_io_dma_pmu_dccm_read = io_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 2344:57]
  assign perfmux_flop_io_dma_pmu_dccm_write = io_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 2345:57]
  assign perfmux_flop_io_lsu_pmu_load_external_r = io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 2346:57]
  assign perfmux_flop_io_lsu_pmu_store_external_r = io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 2347:57]
  assign perfmux_flop_io_mie = mie; // @[dec_tlu_ctl.scala 2350:57]
  assign perfmux_flop_io_ifu_pmu_bus_trxn = io_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 2351:57]
  assign perfmux_flop_io_lsu_pmu_bus_trxn = io_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 2352:57]
  assign perfmux_flop_io_lsu_pmu_bus_misaligned = io_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 2353:57]
  assign perfmux_flop_io_ifu_pmu_bus_error = io_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 2354:57]
  assign perfmux_flop_io_lsu_pmu_bus_error = io_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 2355:57]
  assign perfmux_flop_io_ifu_pmu_bus_busy = io_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 2356:57]
  assign perfmux_flop_io_lsu_pmu_bus_busy = io_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 2357:57]
  assign perfmux_flop_io_i0_trigger_hit_r = io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 2358:57]
  assign perfmux_flop_io_lsu_exc_valid_r = io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 2359:57]
  assign perfmux_flop_io_take_timer_int = io_take_timer_int; // @[dec_tlu_ctl.scala 2360:57]
  assign perfmux_flop_io_take_int_timer0_int = io_take_int_timer0_int; // @[dec_tlu_ctl.scala 2361:57]
  assign perfmux_flop_io_take_int_timer1_int = io_take_int_timer1_int; // @[dec_tlu_ctl.scala 2362:57]
  assign perfmux_flop_io_take_ext_int = io_take_ext_int; // @[dec_tlu_ctl.scala 2363:57]
  assign perfmux_flop_io_tlu_flush_lower_r = io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 2364:57]
  assign perfmux_flop_io_dec_tlu_br0_error_r = io_dec_tlu_br0_error_r; // @[dec_tlu_ctl.scala 2365:57]
  assign perfmux_flop_io_rfpc_i0_r = io_rfpc_i0_r; // @[dec_tlu_ctl.scala 2366:57]
  assign perfmux_flop_io_dec_tlu_br0_start_error_r = io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 2367:57]
  assign perfmux_flop_io_mdseac_locked_ns = io_mdseac_locked_ns; // @[dec_tlu_ctl.scala 2389:55]
  assign perfmux_flop_io_lsu_single_ecc_error_r = io_lsu_single_ecc_error_r; // @[dec_tlu_ctl.scala 2390:55]
  assign perfmux_flop_io_lsu_i0_exc_r = io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 2391:55]
  assign perfmux_flop_io_take_ext_int_start = io_take_ext_int_start; // @[dec_tlu_ctl.scala 2392:55]
  assign perfmux_flop_io_ext_int_freeze = io_ext_int_freeze; // @[dec_tlu_ctl.scala 2393:55]
  assign perfmux_flop_io_mip_ns = {_T_66,_T_64}; // @[dec_tlu_ctl.scala 2394:55]
  assign perfmux_flop_io_mcyclel_cout = mcyclel_inc2[24]; // @[dec_tlu_ctl.scala 2395:55]
  assign perfmux_flop_io_wr_mcycleh_r = io_dec_csr_wen_r_mod & _T_113; // @[dec_tlu_ctl.scala 2396:55]
  assign perfmux_flop_io_mcyclel_cout_in = ~_T_87; // @[dec_tlu_ctl.scala 2397:55]
  assign perfmux_flop_io_minstret_enable = _T_138 | wr_minstretl_r; // @[dec_tlu_ctl.scala 2398:55]
  assign perfmux_flop_io_minstretl_cout_ns = _T_141 & _T_142; // @[dec_tlu_ctl.scala 2399:55]
  assign perfmux_flop_io_meicidpl_ns = wr_meicpct_r ? io_pic_pl : _T_684; // @[dec_tlu_ctl.scala 2401:55]
  assign perfmux_flop_io_icache_rd_valid = _T_825 & _T_827; // @[dec_tlu_ctl.scala 2402:55]
  assign perfmux_flop_io_icache_wr_valid = _T_718 & _T_830; // @[dec_tlu_ctl.scala 2403:55]
  assign perfmux_flop_io_perfcnt_halted = _T_83 | io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2404:55]
  assign perfmux_flop_io_mstatus_ns = _T_48 | _T_44; // @[dec_tlu_ctl.scala 2405:55]
  assign perfmux_flop_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 2407:56]
  assign perf_csrs_clock = clock;
  assign perf_csrs_reset = reset;
  assign perf_csrs_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 2411:50]
  assign perf_csrs_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 2413:50]
  assign perf_csrs_io_dcsr = io_dcsr; // @[dec_tlu_ctl.scala 2414:50]
  assign perf_csrs_io_dec_tlu_pmu_fw_halted = io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2415:50]
  assign perf_csrs_io_mhpme_vec_0 = perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_mhpme_vec_1 = perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_mhpme_vec_2 = perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_mhpme_vec_3 = perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_dec_csr_wen_r_mod = io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 2417:50]
  assign perf_csrs_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 2418:50]
  assign perf_csrs_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 2419:50]
  assign perf_csrs_io_mhpmc_inc_r_0 = perfmux_flop_io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_1 = perfmux_flop_io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_2 = perfmux_flop_io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_3 = perfmux_flop_io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_0 = perfmux_flop_io_mhpmc_inc_r_d1_0; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_1 = perfmux_flop_io_mhpmc_inc_r_d1_1; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_2 = perfmux_flop_io_mhpmc_inc_r_d1_2; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_3 = perfmux_flop_io_mhpmc_inc_r_d1_3; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_perfcnt_halted_d1 = perfmux_flop_io_perfcnt_halted_d1; // @[dec_tlu_ctl.scala 2422:50]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = io_dec_csr_wen_r_mod & _T_57; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = wr_mcyclel_r | _T_102; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = wr_mcyclel_r | mcyclel_cout_in; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = wr_mcycleh_r | perfmux_flop_io_mcyclel_cout_f; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = wr_minstretl_r | _T_147; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = _T_138 | wr_minstretl_r; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = _T_162 | wr_minstreth_r; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = io_dec_csr_wen_r_mod & _T_167; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = _T_228 | wr_mepc_r; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = io_exc_or_int_valid_r | wr_mcause_r; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = io_tlu_flush_lower_r | wr_mtval_r; // @[lib.scala 407:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_11_io_en = io_dec_csr_wen_r_mod & _T_367; // @[lib.scala 407:17]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_12_io_en = io_dec_csr_wen_r_mod & _T_388; // @[lib.scala 407:17]
  assign rvclkhdr_13_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_13_io_en = io_dec_csr_wen_r_mod & _T_430; // @[lib.scala 407:17]
  assign rvclkhdr_14_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_14_io_en = _T_549 & _T_550; // @[lib.scala 407:17]
  assign rvclkhdr_15_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_15_io_en = wr_micect_r | io_ic_perr_r; // @[lib.scala 407:17]
  assign rvclkhdr_16_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_16_io_en = _T_604 | io_iccm_dma_sb_error; // @[lib.scala 407:17]
  assign rvclkhdr_17_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_17_io_en = wr_mdccmect_r | perfmux_flop_io_lsu_single_ecc_error_r_d1; // @[lib.scala 407:17]
  assign rvclkhdr_18_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_18_io_en = mfdht[0]; // @[lib.scala 407:17]
  assign rvclkhdr_19_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_19_io_en = io_dec_csr_wen_r_mod & _T_668; // @[lib.scala 407:17]
  assign rvclkhdr_20_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_20_io_en = _T_687 | io_take_ext_int_start; // @[lib.scala 407:17]
  assign rvclkhdr_21_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_21_io_en = _T_753 | io_take_nmi; // @[lib.scala 407:17]
  assign rvclkhdr_22_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_22_io_en = _T_778 | dpc_capture_npc; // @[lib.scala 407:17]
  assign rvclkhdr_23_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_23_io_en = _T_718 & _T_788; // @[lib.scala 407:17]
  assign rvclkhdr_24_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_24_io_en = wr_dicad0_r | io_ifu_ic_debug_rd_data_valid; // @[lib.scala 407:17]
  assign rvclkhdr_25_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_25_io_en = wr_dicad0h_r | io_ifu_ic_debug_rd_data_valid; // @[lib.scala 407:17]
  assign rvclkhdr_26_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_26_io_en = _T_808 | io_ifu_ic_debug_rd_data_valid; // @[lib.scala 407:17]
  assign rvclkhdr_27_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_27_io_en = io_trigger_enabled[0] | wr_mtdata1_t_r_0; // @[lib.scala 407:17]
  assign rvclkhdr_28_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_28_io_en = io_trigger_enabled[1] | wr_mtdata1_t_r_1; // @[lib.scala 407:17]
  assign rvclkhdr_29_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_29_io_en = io_trigger_enabled[2] | wr_mtdata1_t_r_2; // @[lib.scala 407:17]
  assign rvclkhdr_30_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_30_io_en = io_trigger_enabled[3] | wr_mtdata1_t_r_3; // @[lib.scala 407:17]
  assign rvclkhdr_31_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_31_io_en = _T_1073 & _T_893; // @[lib.scala 407:17]
  assign rvclkhdr_32_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_32_io_en = _T_1082 & _T_902; // @[lib.scala 407:17]
  assign rvclkhdr_33_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_33_io_en = _T_1091 & _T_913; // @[lib.scala 407:17]
  assign rvclkhdr_34_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_34_io_en = _T_1100 & _T_922; // @[lib.scala 407:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mpmc_b = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_61 = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  mdccmect = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  miccmect = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  micect = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mie = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  temp_ncount6_2 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  temp_ncount0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_106 = _RAND_8[23:0];
  _RAND_9 = {1{`RANDOM}};
  _T_110 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  mcycleh = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  _T_150 = _RAND_11[23:0];
  _RAND_12 = {1{`RANDOM}};
  _T_153 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  minstreth = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mscratch = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  _T_196 = _RAND_15[30:0];
  _RAND_16 = {1{`RANDOM}};
  pc_r_d1 = _RAND_16[30:0];
  _RAND_17 = {1{`RANDOM}};
  _T_231 = _RAND_17[30:0];
  _RAND_18 = {1{`RANDOM}};
  mcause = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mscause = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  mtval = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mcgc_int = _RAND_21[9:0];
  _RAND_22 = {1{`RANDOM}};
  mfdc_int = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  mrac = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mdseac = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mfdht = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  mfdhs = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  force_halt_ctr_f = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  meivt = _RAND_28[21:0];
  _RAND_29 = {1{`RANDOM}};
  meihap = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  meicurpl = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  meipt = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_756 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  _T_781 = _RAND_33[30:0];
  _RAND_34 = {1{`RANDOM}};
  dicawics = _RAND_34[16:0];
  _RAND_35 = {1{`RANDOM}};
  dicad0 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  dicad0h = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  _T_815 = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  mtsel = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  _T_965 = _RAND_39[9:0];
  _RAND_40 = {1{`RANDOM}};
  _T_969 = _RAND_40[9:0];
  _RAND_41 = {1{`RANDOM}};
  _T_973 = _RAND_41[9:0];
  _RAND_42 = {1{`RANDOM}};
  _T_977 = _RAND_42[9:0];
  _RAND_43 = {1{`RANDOM}};
  mtdata2_t_0 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  mtdata2_t_1 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  mtdata2_t_2 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  mtdata2_t_3 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  dec_tlu_exc_cause_wb2 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  dec_tlu_int_valid_wb2 = _RAND_48[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    mpmc_b = 1'h0;
  end
  if (reset) begin
    _T_61 = 31'h0;
  end
  if (reset) begin
    mdccmect = 32'h0;
  end
  if (reset) begin
    miccmect = 32'h0;
  end
  if (reset) begin
    micect = 32'h0;
  end
  if (reset) begin
    mie = 6'h0;
  end
  if (reset) begin
    temp_ncount6_2 = 5'h0;
  end
  if (reset) begin
    temp_ncount0 = 1'h0;
  end
  if (reset) begin
    _T_106 = 24'h0;
  end
  if (reset) begin
    _T_110 = 8'h0;
  end
  if (reset) begin
    mcycleh = 32'h0;
  end
  if (reset) begin
    _T_150 = 24'h0;
  end
  if (reset) begin
    _T_153 = 8'h0;
  end
  if (reset) begin
    minstreth = 32'h0;
  end
  if (reset) begin
    mscratch = 32'h0;
  end
  if (reset) begin
    _T_196 = 31'h0;
  end
  if (reset) begin
    pc_r_d1 = 31'h0;
  end
  if (reset) begin
    _T_231 = 31'h0;
  end
  if (reset) begin
    mcause = 32'h0;
  end
  if (reset) begin
    mscause = 4'h0;
  end
  if (reset) begin
    mtval = 32'h0;
  end
  if (reset) begin
    mcgc_int = 10'h0;
  end
  if (reset) begin
    mfdc_int = 16'h0;
  end
  if (reset) begin
    mrac = 32'h0;
  end
  if (reset) begin
    mdseac = 32'h0;
  end
  if (reset) begin
    mfdht = 6'h0;
  end
  if (reset) begin
    mfdhs = 2'h0;
  end
  if (reset) begin
    force_halt_ctr_f = 32'h0;
  end
  if (reset) begin
    meivt = 22'h0;
  end
  if (reset) begin
    meihap = 8'h0;
  end
  if (reset) begin
    meicurpl = 4'h0;
  end
  if (reset) begin
    meipt = 4'h0;
  end
  if (reset) begin
    _T_756 = 16'h0;
  end
  if (reset) begin
    _T_781 = 31'h0;
  end
  if (reset) begin
    dicawics = 17'h0;
  end
  if (reset) begin
    dicad0 = 32'h0;
  end
  if (reset) begin
    dicad0h = 32'h0;
  end
  if (reset) begin
    _T_815 = 7'h0;
  end
  if (reset) begin
    mtsel = 2'h0;
  end
  if (reset) begin
    _T_965 = 10'h0;
  end
  if (reset) begin
    _T_969 = 10'h0;
  end
  if (reset) begin
    _T_973 = 10'h0;
  end
  if (reset) begin
    _T_977 = 10'h0;
  end
  if (reset) begin
    mtdata2_t_0 = 32'h0;
  end
  if (reset) begin
    mtdata2_t_1 = 32'h0;
  end
  if (reset) begin
    mtdata2_t_2 = 32'h0;
  end
  if (reset) begin
    mtdata2_t_3 = 32'h0;
  end
  if (reset) begin
    dec_tlu_exc_cause_wb2 = 5'h0;
  end
  if (reset) begin
    dec_tlu_int_valid_wb2 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mpmc_b <= 1'h0;
    end else if (wr_mpmc_r) begin
      mpmc_b <= _T_565;
    end else begin
      mpmc_b <= _T_566;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_61 <= 31'h0;
    end else if (wr_mtvec_r) begin
      _T_61 <= mtvec_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mdccmect <= 32'h0;
    end else if (_T_625) begin
      if (wr_mdccmect_r) begin
        mdccmect <= _T_580;
      end else begin
        mdccmect <= _T_624;
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      miccmect <= 32'h0;
    end else if (_T_605) begin
      if (wr_miccmect_r) begin
        miccmect <= _T_580;
      end else begin
        miccmect <= _T_603;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      micect <= 32'h0;
    end else if (_T_583) begin
      if (wr_micect_r) begin
        micect <= _T_580;
      end else begin
        micect <= _T_582;
      end
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mie <= 6'h0;
    end else begin
      mie <= io_mie_ns;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      temp_ncount6_2 <= 5'h0;
    end else if (wr_mcountinhibit_r) begin
      temp_ncount6_2 <= io_dec_csr_wrdata_r[6:2];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      temp_ncount0 <= 1'h0;
    end else if (wr_mcountinhibit_r) begin
      temp_ncount0 <= io_dec_csr_wrdata_r[0];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_106 <= 24'h0;
    end else if (_T_104) begin
      _T_106 <= mcyclel_ns[31:8];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_110 <= 8'h0;
    end else if (_T_108) begin
      _T_110 <= mcyclel_ns[7:0];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mcycleh <= 32'h0;
    end else if (_T_117) begin
      if (wr_mcycleh_r) begin
        mcycleh <= io_dec_csr_wrdata_r;
      end else begin
        mcycleh <= mcycleh_inc;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_150 <= 24'h0;
    end else if (_T_148) begin
      _T_150 <= minstretl_ns[31:8];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_153 <= 8'h0;
    end else if (minstret_enable) begin
      _T_153 <= minstretl_ns[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      minstreth <= 32'h0;
    end else if (_T_163) begin
      if (wr_minstreth_r) begin
        minstreth <= io_dec_csr_wrdata_r;
      end else begin
        minstreth <= minstreth_inc;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mscratch <= 32'h0;
    end else if (wr_mscratch_r) begin
      mscratch <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_196 <= 31'h0;
    end else if (_T_193) begin
      _T_196 <= io_npc_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pc_r_d1 <= 31'h0;
    end else if (pc0_valid_r) begin
      pc_r_d1 <= pc_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_231 <= 31'h0;
    end else if (_T_229) begin
      _T_231 <= mepc_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mcause <= 32'h0;
    end else if (_T_274) begin
      mcause <= mcause_ns;
    end
  end
  always @(posedge io_e4e5_int_clk or posedge reset) begin
    if (reset) begin
      mscause <= 4'h0;
    end else begin
      mscause <= _T_304 | _T_303;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtval <= 32'h0;
    end else if (_T_363) begin
      mtval <= mtval_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mcgc_int <= 10'h0;
    end else if (wr_mcgc_r) begin
      if (wr_mcgc_r) begin
        mcgc_int <= _T_372;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mfdc_int <= 16'h0;
    end else if (wr_mfdc_r) begin
      mfdc_int <= mfdc_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mrac <= 32'h0;
    end else if (wr_mrac_r) begin
      mrac <= mrac_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mdseac <= 32'h0;
    end else if (mdseac_en) begin
      mdseac <= io_lsu_imprecise_error_addr_any;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mfdht <= 6'h0;
    end else if (wr_mfdht_r) begin
      if (wr_mfdht_r) begin
        mfdht <= io_dec_csr_wrdata_r[5:0];
      end
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mfdhs <= 2'h0;
    end else if (_T_651) begin
      if (wr_mfdhs_r) begin
        mfdhs <= io_dec_csr_wrdata_r[1:0];
      end else if (_T_645) begin
        mfdhs <= _T_649;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      force_halt_ctr_f <= 32'h0;
    end else if (mfdht[0]) begin
      if (io_debug_halt_req_f) begin
        force_halt_ctr_f <= _T_656;
      end else if (io_dbg_tlu_halted_f) begin
        force_halt_ctr_f <= 32'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      meivt <= 22'h0;
    end else if (wr_meivt_r) begin
      meivt <= io_dec_csr_wrdata_r[31:10];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      meihap <= 8'h0;
    end else if (wr_meicpct_r) begin
      meihap <= io_pic_claimid;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      meicurpl <= 4'h0;
    end else if (wr_meicurpl_r) begin
      meicurpl <= io_dec_csr_wrdata_r[3:0];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      meipt <= 4'h0;
    end else if (wr_meipt_r) begin
      meipt <= io_dec_csr_wrdata_r[3:0];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_756 <= 16'h0;
    end else if (_T_754) begin
      if (enter_debug_halt_req_le) begin
        _T_756 <= _T_730;
      end else if (wr_dcsr_r) begin
        _T_756 <= _T_745;
      end else begin
        _T_756 <= _T_750;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_781 <= 31'h0;
    end else if (_T_779) begin
      _T_781 <= dpc_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dicawics <= 17'h0;
    end else if (wr_dicawics_r) begin
      dicawics <= dicawics_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dicad0 <= 32'h0;
    end else if (_T_795) begin
      if (wr_dicad0_r) begin
        dicad0 <= io_dec_csr_wrdata_r;
      end else begin
        dicad0 <= io_ifu_ic_debug_rd_data[31:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dicad0h <= 32'h0;
    end else if (_T_802) begin
      if (wr_dicad0h_r) begin
        dicad0h <= io_dec_csr_wrdata_r;
      end else begin
        dicad0h <= io_ifu_ic_debug_rd_data[63:32];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_815 <= 7'h0;
    end else if (_T_813) begin
      if (_T_808) begin
        _T_815 <= io_dec_csr_wrdata_r[6:0];
      end else begin
        _T_815 <= io_ifu_ic_debug_rd_data[70:64];
      end
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mtsel <= 2'h0;
    end else if (wr_mtsel_r) begin
      mtsel <= io_dec_csr_wrdata_r[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_965 <= 10'h0;
    end else if (_T_963) begin
      if (wr_mtdata1_t_r_0) begin
        _T_965 <= tdata_wrdata_r;
      end else begin
        _T_965 <= _T_933;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_969 <= 10'h0;
    end else if (_T_967) begin
      if (wr_mtdata1_t_r_1) begin
        _T_969 <= tdata_wrdata_r;
      end else begin
        _T_969 <= _T_942;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_973 <= 10'h0;
    end else if (_T_971) begin
      if (wr_mtdata1_t_r_2) begin
        _T_973 <= tdata_wrdata_r;
      end else begin
        _T_973 <= _T_951;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_977 <= 10'h0;
    end else if (_T_975) begin
      if (wr_mtdata1_t_r_3) begin
        _T_977 <= tdata_wrdata_r;
      end else begin
        _T_977 <= _T_960;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_0 <= 32'h0;
    end else if (wr_mtdata2_t_r_0) begin
      mtdata2_t_0 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_1 <= 32'h0;
    end else if (wr_mtdata2_t_r_1) begin
      mtdata2_t_1 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_2 <= 32'h0;
    end else if (wr_mtdata2_t_r_2) begin
      mtdata2_t_2 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_3 <= 32'h0;
    end else if (wr_mtdata2_t_r_3) begin
      mtdata2_t_3 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dec_tlu_exc_cause_wb2 <= 5'h0;
    end else if (_T_1153) begin
      dec_tlu_exc_cause_wb2 <= dec_tlu_exc_cause_wb1_raw;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dec_tlu_int_valid_wb2 <= 1'h0;
    end else if (_T_1156) begin
      dec_tlu_int_valid_wb2 <= dec_tlu_int_valid_wb1_raw;
    end
  end
endmodule
module dec_timer_ctl(
  input         clock,
  input         reset,
  input         io_free_l2clk,
  input         io_csr_wr_clk,
  input         io_dec_csr_wen_r_mod,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_csr_mitctl0,
  input         io_csr_mitctl1,
  input         io_csr_mitb0,
  input         io_csr_mitb1,
  input         io_csr_mitcnt0,
  input         io_csr_mitcnt1,
  input         io_dec_pause_state,
  input         io_dec_tlu_pmu_fw_halted,
  input         io_internal_dbg_halt_timers,
  output [31:0] io_dec_timer_rddata_d,
  output        io_dec_timer_read_d,
  output        io_dec_timer_t0_pulse,
  output        io_dec_timer_t1_pulse
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  reg [23:0] _T_28; // @[Reg.scala 27:20]
  reg [7:0] _T_33; // @[Reg.scala 27:20]
  wire [31:0] mitcnt0 = {_T_28,_T_33}; // @[Cat.scala 29:58]
  reg [31:0] mitb0_b; // @[Reg.scala 27:20]
  wire [31:0] mitb0 = ~mitb0_b; // @[dec_tlu_ctl.scala 3335:22]
  wire  mit0_match_ns = mitcnt0 >= mitb0; // @[dec_tlu_ctl.scala 3277:36]
  reg [23:0] _T_67; // @[Reg.scala 27:20]
  reg [7:0] _T_72; // @[Reg.scala 27:20]
  wire [31:0] mitcnt1 = {_T_67,_T_72}; // @[Cat.scala 29:58]
  reg [31:0] mitb1_b; // @[Reg.scala 27:20]
  wire [31:0] mitb1 = ~mitb1_b; // @[dec_tlu_ctl.scala 3344:18]
  wire  mit1_match_ns = mitcnt1 >= mitb1; // @[dec_tlu_ctl.scala 3278:36]
  wire  _T = io_dec_csr_wraddr_r == 12'h7d2; // @[dec_tlu_ctl.scala 3288:72]
  wire  wr_mitcnt0_r = io_dec_csr_wen_r_mod & _T; // @[dec_tlu_ctl.scala 3288:49]
  reg [1:0] _T_90; // @[Reg.scala 27:20]
  reg  mitctl0_0_b; // @[Reg.scala 27:20]
  wire  _T_91 = ~mitctl0_0_b; // @[dec_tlu_ctl.scala 3360:107]
  wire [2:0] mitctl0 = {_T_90,_T_91}; // @[Cat.scala 29:58]
  wire  _T_2 = ~io_dec_pause_state; // @[dec_tlu_ctl.scala 3290:56]
  wire  _T_4 = _T_2 | mitctl0[2]; // @[dec_tlu_ctl.scala 3290:76]
  wire  _T_5 = mitctl0[0] & _T_4; // @[dec_tlu_ctl.scala 3290:53]
  wire  _T_6 = ~io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 3290:112]
  wire  _T_8 = _T_6 | mitctl0[1]; // @[dec_tlu_ctl.scala 3290:138]
  wire  _T_9 = _T_5 & _T_8; // @[dec_tlu_ctl.scala 3290:109]
  wire  _T_10 = ~io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 3290:173]
  wire  mitcnt0_inc_ok = _T_9 & _T_10; // @[dec_tlu_ctl.scala 3290:171]
  wire [7:0] _T_14 = mitcnt0[7:0] + 8'h1; // @[dec_tlu_ctl.scala 3293:38]
  wire [8:0] mitcnt0_inc1 = {{1'd0}, _T_14}; // @[dec_tlu_ctl.scala 3293:22]
  wire  mitcnt0_inc_cout = mitcnt0_inc1[8]; // @[dec_tlu_ctl.scala 3294:44]
  wire [23:0] _T_16 = {23'h0,mitcnt0_inc_cout}; // @[Cat.scala 29:58]
  wire [23:0] mitcnt0_inc2 = mitcnt0[31:8] + _T_16; // @[dec_tlu_ctl.scala 3295:39]
  wire [31:0] mitcnt0_inc = {mitcnt0_inc2,mitcnt0_inc1[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_22 = mit0_match_ns ? 32'h0 : mitcnt0_inc; // @[dec_tlu_ctl.scala 3298:69]
  wire [31:0] mitcnt0_ns = wr_mitcnt0_r ? io_dec_csr_wrdata_r : _T_22; // @[dec_tlu_ctl.scala 3298:30]
  wire  _T_24 = mitcnt0_inc_ok & mitcnt0_inc_cout; // @[dec_tlu_ctl.scala 3301:87]
  wire  _T_25 = wr_mitcnt0_r | _T_24; // @[dec_tlu_ctl.scala 3301:69]
  wire  _T_26 = _T_25 | mit0_match_ns; // @[dec_tlu_ctl.scala 3301:107]
  wire  _T_30 = wr_mitcnt0_r | mitcnt0_inc_ok; // @[dec_tlu_ctl.scala 3302:54]
  wire  _T_31 = _T_30 | mit0_match_ns; // @[dec_tlu_ctl.scala 3302:71]
  wire  _T_35 = io_dec_csr_wraddr_r == 12'h7d5; // @[dec_tlu_ctl.scala 3309:72]
  wire  wr_mitcnt1_r = io_dec_csr_wen_r_mod & _T_35; // @[dec_tlu_ctl.scala 3309:49]
  reg [2:0] _T_101; // @[Reg.scala 27:20]
  reg  mitctl1_0_b; // @[Reg.scala 27:20]
  wire  _T_102 = ~mitctl1_0_b; // @[dec_tlu_ctl.scala 3374:92]
  wire [3:0] mitctl1 = {_T_101,_T_102}; // @[Cat.scala 29:58]
  wire  _T_39 = _T_2 | mitctl1[2]; // @[dec_tlu_ctl.scala 3311:76]
  wire  _T_40 = mitctl1[0] & _T_39; // @[dec_tlu_ctl.scala 3311:53]
  wire  _T_43 = _T_6 | mitctl1[1]; // @[dec_tlu_ctl.scala 3311:138]
  wire  _T_44 = _T_40 & _T_43; // @[dec_tlu_ctl.scala 3311:109]
  wire  _T_46 = _T_44 & _T_10; // @[dec_tlu_ctl.scala 3311:171]
  wire  _T_48 = ~mitctl1[3]; // @[dec_tlu_ctl.scala 3311:205]
  wire  _T_49 = _T_48 | mit0_match_ns; // @[dec_tlu_ctl.scala 3311:217]
  wire  mitcnt1_inc_ok = _T_46 & _T_49; // @[dec_tlu_ctl.scala 3311:202]
  wire [7:0] _T_53 = mitcnt1[7:0] + 8'h1; // @[dec_tlu_ctl.scala 3316:38]
  wire [8:0] mitcnt1_inc1 = {{1'd0}, _T_53}; // @[dec_tlu_ctl.scala 3316:22]
  wire  mitcnt1_inc_cout = mitcnt1_inc1[8]; // @[dec_tlu_ctl.scala 3317:44]
  wire [23:0] _T_55 = {23'h0,mitcnt1_inc_cout}; // @[Cat.scala 29:58]
  wire [23:0] mitcnt1_inc2 = mitcnt1[31:8] + _T_55; // @[dec_tlu_ctl.scala 3318:39]
  wire [31:0] mitcnt1_inc = {mitcnt1_inc2,mitcnt1_inc1[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_61 = mit1_match_ns ? 32'h0 : mitcnt1_inc; // @[dec_tlu_ctl.scala 3321:75]
  wire [31:0] mitcnt1_ns = wr_mitcnt1_r ? io_dec_csr_wrdata_r : _T_61; // @[dec_tlu_ctl.scala 3321:29]
  wire  _T_63 = mitcnt1_inc_ok & mitcnt1_inc_cout; // @[dec_tlu_ctl.scala 3323:87]
  wire  _T_64 = wr_mitcnt1_r | _T_63; // @[dec_tlu_ctl.scala 3323:69]
  wire  _T_65 = _T_64 | mit1_match_ns; // @[dec_tlu_ctl.scala 3323:107]
  wire  _T_69 = wr_mitcnt1_r | mitcnt1_inc_ok; // @[dec_tlu_ctl.scala 3324:54]
  wire  _T_70 = _T_69 | mit1_match_ns; // @[dec_tlu_ctl.scala 3324:71]
  wire  _T_74 = io_dec_csr_wraddr_r == 12'h7d3; // @[dec_tlu_ctl.scala 3333:70]
  wire  wr_mitb0_r = io_dec_csr_wen_r_mod & _T_74; // @[dec_tlu_ctl.scala 3333:47]
  wire [31:0] _T_75 = ~io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 3334:38]
  wire  _T_78 = io_dec_csr_wraddr_r == 12'h7d6; // @[dec_tlu_ctl.scala 3342:69]
  wire  wr_mitb1_r = io_dec_csr_wen_r_mod & _T_78; // @[dec_tlu_ctl.scala 3342:47]
  wire  _T_82 = io_dec_csr_wraddr_r == 12'h7d4; // @[dec_tlu_ctl.scala 3355:72]
  wire  wr_mitctl0_r = io_dec_csr_wen_r_mod & _T_82; // @[dec_tlu_ctl.scala 3355:49]
  wire [2:0] mitctl0_ns = wr_mitctl0_r ? io_dec_csr_wrdata_r[2:0] : mitctl0; // @[dec_tlu_ctl.scala 3356:31]
  wire  mitctl0_0_b_ns = ~mitctl0_ns[0]; // @[dec_tlu_ctl.scala 3358:30]
  wire  _T_93 = io_dec_csr_wraddr_r == 12'h7d7; // @[dec_tlu_ctl.scala 3370:71]
  wire  wr_mitctl1_r = io_dec_csr_wen_r_mod & _T_93; // @[dec_tlu_ctl.scala 3370:49]
  wire [3:0] mitctl1_ns = wr_mitctl1_r ? io_dec_csr_wrdata_r[3:0] : mitctl1; // @[dec_tlu_ctl.scala 3371:31]
  wire  mitctl1_0_b_ns = ~mitctl1_ns[0]; // @[dec_tlu_ctl.scala 3372:29]
  wire  _T_104 = io_csr_mitcnt1 | io_csr_mitcnt0; // @[dec_tlu_ctl.scala 3376:51]
  wire  _T_105 = _T_104 | io_csr_mitb1; // @[dec_tlu_ctl.scala 3376:68]
  wire  _T_106 = _T_105 | io_csr_mitb0; // @[dec_tlu_ctl.scala 3376:83]
  wire  _T_107 = _T_106 | io_csr_mitctl0; // @[dec_tlu_ctl.scala 3376:98]
  wire [31:0] _T_116 = {29'h0,_T_90,_T_91}; // @[Cat.scala 29:58]
  wire [31:0] _T_119 = {28'h0,_T_101,_T_102}; // @[Cat.scala 29:58]
  wire [31:0] _T_120 = io_csr_mitcnt0 ? mitcnt0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_121 = io_csr_mitcnt1 ? mitcnt1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_122 = io_csr_mitb0 ? mitb0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_123 = io_csr_mitb1 ? mitb1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_124 = io_csr_mitctl0 ? _T_116 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_125 = io_csr_mitctl1 ? _T_119 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_126 = _T_120 | _T_121; // @[Mux.scala 27:72]
  wire [31:0] _T_127 = _T_126 | _T_122; // @[Mux.scala 27:72]
  wire [31:0] _T_128 = _T_127 | _T_123; // @[Mux.scala 27:72]
  wire [31:0] _T_129 = _T_128 | _T_124; // @[Mux.scala 27:72]
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  assign io_dec_timer_rddata_d = _T_129 | _T_125; // @[dec_tlu_ctl.scala 3377:33]
  assign io_dec_timer_read_d = _T_107 | io_csr_mitctl1; // @[dec_tlu_ctl.scala 3376:33]
  assign io_dec_timer_t0_pulse = mitcnt0 >= mitb0; // @[dec_tlu_ctl.scala 3280:31]
  assign io_dec_timer_t1_pulse = mitcnt1 >= mitb1; // @[dec_tlu_ctl.scala 3281:31]
  assign rvclkhdr_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = _T_25 | mit0_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = _T_30 | mit0_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = _T_64 | mit1_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = _T_69 | mit1_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = io_dec_csr_wen_r_mod & _T_74; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = io_dec_csr_wen_r_mod & _T_78; // @[lib.scala 407:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_28 = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  _T_33 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  mitb0_b = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  _T_67 = _RAND_3[23:0];
  _RAND_4 = {1{`RANDOM}};
  _T_72 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  mitb1_b = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_90 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  mitctl0_0_b = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_101 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  mitctl1_0_b = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_28 = 24'h0;
  end
  if (reset) begin
    _T_33 = 8'h0;
  end
  if (reset) begin
    mitb0_b = 32'h0;
  end
  if (reset) begin
    _T_67 = 24'h0;
  end
  if (reset) begin
    _T_72 = 8'h0;
  end
  if (reset) begin
    mitb1_b = 32'h0;
  end
  if (reset) begin
    _T_90 = 2'h0;
  end
  if (reset) begin
    mitctl0_0_b = 1'h0;
  end
  if (reset) begin
    _T_101 = 3'h0;
  end
  if (reset) begin
    mitctl1_0_b = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_28 <= 24'h0;
    end else if (_T_26) begin
      _T_28 <= mitcnt0_ns[31:8];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_33 <= 8'h0;
    end else if (_T_31) begin
      _T_33 <= mitcnt0_ns[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mitb0_b <= 32'h0;
    end else if (wr_mitb0_r) begin
      mitb0_b <= _T_75;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_67 <= 24'h0;
    end else if (_T_65) begin
      _T_67 <= mitcnt1_ns[31:8];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_72 <= 8'h0;
    end else if (_T_70) begin
      _T_72 <= mitcnt1_ns[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mitb1_b <= 32'h0;
    end else if (wr_mitb1_r) begin
      mitb1_b <= _T_75;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      _T_90 <= 2'h0;
    end else if (wr_mitctl0_r) begin
      _T_90 <= mitctl0_ns[2:1];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mitctl0_0_b <= 1'h0;
    end else if (wr_mitctl0_r) begin
      mitctl0_0_b <= mitctl0_0_b_ns;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      _T_101 <= 3'h0;
    end else if (wr_mitctl1_r) begin
      _T_101 <= mitctl1_ns[3:1];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mitctl1_0_b <= 1'h0;
    end else if (wr_mitctl1_r) begin
      mitctl1_0_b <= mitctl1_0_b_ns;
    end
  end
endmodule
module dec_decode_csr_read(
  input  [11:0] io_dec_csr_rdaddr_d,
  output        io_csr_pkt_csr_misa,
  output        io_csr_pkt_csr_mvendorid,
  output        io_csr_pkt_csr_marchid,
  output        io_csr_pkt_csr_mimpid,
  output        io_csr_pkt_csr_mhartid,
  output        io_csr_pkt_csr_mstatus,
  output        io_csr_pkt_csr_mtvec,
  output        io_csr_pkt_csr_mip,
  output        io_csr_pkt_csr_mie,
  output        io_csr_pkt_csr_mcyclel,
  output        io_csr_pkt_csr_mcycleh,
  output        io_csr_pkt_csr_minstretl,
  output        io_csr_pkt_csr_minstreth,
  output        io_csr_pkt_csr_mscratch,
  output        io_csr_pkt_csr_mepc,
  output        io_csr_pkt_csr_mcause,
  output        io_csr_pkt_csr_mscause,
  output        io_csr_pkt_csr_mtval,
  output        io_csr_pkt_csr_mrac,
  output        io_csr_pkt_csr_dmst,
  output        io_csr_pkt_csr_mdseac,
  output        io_csr_pkt_csr_meihap,
  output        io_csr_pkt_csr_meivt,
  output        io_csr_pkt_csr_meipt,
  output        io_csr_pkt_csr_meicurpl,
  output        io_csr_pkt_csr_meicidpl,
  output        io_csr_pkt_csr_dcsr,
  output        io_csr_pkt_csr_mcgc,
  output        io_csr_pkt_csr_mfdc,
  output        io_csr_pkt_csr_dpc,
  output        io_csr_pkt_csr_mtsel,
  output        io_csr_pkt_csr_mtdata1,
  output        io_csr_pkt_csr_mtdata2,
  output        io_csr_pkt_csr_mhpmc3,
  output        io_csr_pkt_csr_mhpmc4,
  output        io_csr_pkt_csr_mhpmc5,
  output        io_csr_pkt_csr_mhpmc6,
  output        io_csr_pkt_csr_mhpmc3h,
  output        io_csr_pkt_csr_mhpmc4h,
  output        io_csr_pkt_csr_mhpmc5h,
  output        io_csr_pkt_csr_mhpmc6h,
  output        io_csr_pkt_csr_mhpme3,
  output        io_csr_pkt_csr_mhpme4,
  output        io_csr_pkt_csr_mhpme5,
  output        io_csr_pkt_csr_mhpme6,
  output        io_csr_pkt_csr_mcountinhibit,
  output        io_csr_pkt_csr_mitctl0,
  output        io_csr_pkt_csr_mitctl1,
  output        io_csr_pkt_csr_mitb0,
  output        io_csr_pkt_csr_mitb1,
  output        io_csr_pkt_csr_mitcnt0,
  output        io_csr_pkt_csr_mitcnt1,
  output        io_csr_pkt_csr_mpmc,
  output        io_csr_pkt_csr_meicpct,
  output        io_csr_pkt_csr_micect,
  output        io_csr_pkt_csr_miccmect,
  output        io_csr_pkt_csr_mdccmect,
  output        io_csr_pkt_csr_mfdht,
  output        io_csr_pkt_csr_mfdhs,
  output        io_csr_pkt_csr_dicawics,
  output        io_csr_pkt_csr_dicad0h,
  output        io_csr_pkt_csr_dicad0,
  output        io_csr_pkt_csr_dicad1,
  output        io_csr_pkt_csr_dicago,
  output        io_csr_pkt_presync,
  output        io_csr_pkt_postsync,
  output        io_csr_pkt_legal
);
  wire  _T_1 = ~io_dec_csr_rdaddr_d[11]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_3 = ~io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_5 = ~io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_7 = ~io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_9 = _T_1 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_10 = _T_9 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_11 = _T_10 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_15 = ~io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_17 = ~io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_19 = io_dec_csr_rdaddr_d[10] & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_20 = _T_19 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_27 = ~io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:165]
  wire  _T_29 = _T_19 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_36 = io_dec_csr_rdaddr_d[10] & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_37 = _T_36 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_69 = _T_10 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_70 = _T_69 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_75 = _T_15 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_94 = ~io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_96 = ~io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_101 = io_dec_csr_rdaddr_d[11] & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_102 = _T_101 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_103 = _T_102 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_104 = _T_103 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_119 = io_dec_csr_rdaddr_d[7] & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_120 = _T_119 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_121 = _T_120 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_122 = _T_121 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_123 = _T_122 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_138 = _T_15 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_139 = _T_138 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_140 = _T_139 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_141 = _T_140 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_142 = _T_141 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_145 = ~io_dec_csr_rdaddr_d[10]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_156 = _T_145 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_157 = _T_156 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_158 = _T_157 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_159 = _T_158 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_160 = _T_159 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_172 = _T_75 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_173 = _T_172 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_182 = _T_75 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_183 = _T_182 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_191 = _T_75 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_196 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_217 = _T_1 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_218 = _T_217 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_219 = _T_218 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_220 = _T_219 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_230 = io_dec_csr_rdaddr_d[10] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_231 = _T_230 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_232 = _T_231 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_240 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[10]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_241 = _T_240 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_258 = _T_145 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_259 = _T_258 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_260 = _T_259 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_261 = _T_260 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_268 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_269 = _T_268 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_281 = _T_268 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_291 = _T_36 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_292 = _T_291 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_299 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_300 = _T_299 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_310 = _T_300 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_311 = _T_310 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_330 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_331 = _T_330 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_332 = _T_331 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_342 = _T_231 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_381 = _T_103 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_382 = _T_381 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_397 = _T_103 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_411 = _T_15 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_412 = _T_411 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_413 = _T_412 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_414 = _T_413 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_415 = _T_414 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_426 = io_dec_csr_rdaddr_d[7] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_427 = _T_426 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_428 = _T_427 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_429 = _T_428 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_444 = _T_119 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_445 = _T_444 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_446 = _T_445 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_447 = _T_446 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_460 = _T_427 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_461 = _T_460 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_478 = _T_446 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_490 = _T_15 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_491 = _T_490 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_492 = _T_491 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_493 = _T_492 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_505 = io_dec_csr_rdaddr_d[5] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_506 = _T_505 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_507 = _T_506 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_508 = _T_507 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_536 = _T_507 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_553 = _T_493 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_562 = io_dec_csr_rdaddr_d[6] & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_563 = _T_562 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_564 = _T_563 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_572 = io_dec_csr_rdaddr_d[6] & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_573 = _T_572 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_574 = _T_573 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_585 = _T_563 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_593 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_594 = _T_593 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_595 = _T_594 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_614 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_615 = _T_614 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_624 = io_dec_csr_rdaddr_d[6] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_625 = _T_624 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_626 = _T_625 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_645 = _T_196 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_646 = _T_645 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_662 = _T_196 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_670 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_671 = _T_670 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_672 = _T_671 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_680 = _T_624 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_693 = _T_1 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_694 = _T_693 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_695 = _T_694 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_696 = _T_695 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_703 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_704 = _T_703 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_714 = _T_230 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_715 = _T_714 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_725 = _T_703 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_726 = _T_725 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_764 = _T_311 | _T_553; // @[dec_tlu_ctl.scala 3241:81]
  wire  _T_776 = _T_3 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_777 = _T_776 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_778 = _T_777 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_779 = _T_778 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_780 = _T_779 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_781 = _T_764 | _T_780; // @[dec_tlu_ctl.scala 3241:121]
  wire  _T_790 = io_dec_csr_rdaddr_d[11] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_791 = _T_790 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_792 = _T_791 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_793 = _T_792 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_794 = _T_781 | _T_793; // @[dec_tlu_ctl.scala 3241:155]
  wire  _T_805 = _T_791 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_806 = _T_805 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_807 = _T_794 | _T_806; // @[dec_tlu_ctl.scala 3242:49]
  wire  _T_818 = io_dec_csr_rdaddr_d[7] & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_819 = _T_818 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_820 = _T_819 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_821 = _T_820 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_822 = _T_821 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_846 = _T_311 | _T_70; // @[dec_tlu_ctl.scala 3243:81]
  wire  _T_856 = _T_846 | _T_183; // @[dec_tlu_ctl.scala 3243:121]
  wire  _T_866 = _T_856 | _T_342; // @[dec_tlu_ctl.scala 3243:162]
  wire  _T_881 = _T_1 & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_882 = _T_881 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_883 = _T_882 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_884 = _T_883 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_885 = _T_884 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_886 = _T_885 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_887 = _T_866 | _T_886; // @[dec_tlu_ctl.scala 3244:57]
  wire  _T_899 = _T_217 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_900 = _T_899 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_901 = _T_900 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_902 = _T_901 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_903 = _T_887 | _T_902; // @[dec_tlu_ctl.scala 3244:97]
  wire  _T_914 = _T_231 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_915 = _T_914 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_932 = _T_1 & io_dec_csr_rdaddr_d[10]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_933 = _T_932 & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_934 = _T_933 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_935 = _T_934 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_936 = _T_935 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_937 = _T_936 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_938 = _T_937 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_939 = _T_938 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_940 = _T_939 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_941 = _T_940 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_960 = _T_1 & _T_145; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_961 = _T_960 & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_962 = _T_961 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_963 = _T_962 & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_964 = _T_963 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_965 = _T_964 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_966 = _T_965 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_967 = _T_966 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_968 = _T_967 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_969 = _T_941 | _T_968; // @[dec_tlu_ctl.scala 3246:81]
  wire  _T_990 = _T_964 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_991 = _T_990 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_992 = _T_991 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_993 = _T_969 | _T_992; // @[dec_tlu_ctl.scala 3246:129]
  wire  _T_1009 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1010 = _T_1009 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1011 = _T_1010 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1012 = _T_1011 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1013 = _T_1012 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1014 = _T_1013 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1015 = _T_1014 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1016 = _T_1015 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1017 = _T_1016 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1018 = _T_993 | _T_1017; // @[dec_tlu_ctl.scala 3247:73]
  wire  _T_1030 = io_dec_csr_rdaddr_d[11] & _T_145; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1031 = _T_1030 & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1032 = _T_1031 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1033 = _T_1032 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1034 = _T_1033 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1035 = _T_1034 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1036 = _T_1018 | _T_1035; // @[dec_tlu_ctl.scala 3247:121]
  wire  _T_1055 = _T_936 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1056 = _T_1055 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1057 = _T_1056 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1058 = _T_1057 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1059 = _T_1058 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1060 = _T_1059 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1061 = _T_1036 | _T_1060; // @[dec_tlu_ctl.scala 3248:73]
  wire  _T_1082 = _T_1056 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1083 = _T_1082 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1084 = _T_1061 | _T_1083; // @[dec_tlu_ctl.scala 3248:121]
  wire  _T_1102 = _T_1010 & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1103 = _T_1102 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1104 = _T_1103 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1105 = _T_1104 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1106 = _T_1105 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1107 = _T_1106 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1108 = _T_1107 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1109 = _T_1084 | _T_1108; // @[dec_tlu_ctl.scala 3249:73]
  wire  _T_1129 = _T_935 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1130 = _T_1129 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1131 = _T_1130 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1132 = _T_1131 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1133 = _T_1132 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1134 = _T_1109 | _T_1133; // @[dec_tlu_ctl.scala 3249:129]
  wire  _T_1153 = _T_990 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1154 = _T_1134 | _T_1153; // @[dec_tlu_ctl.scala 3250:73]
  wire  _T_1179 = _T_1106 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1180 = _T_1179 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1181 = _T_1180 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1182 = _T_1154 | _T_1181; // @[dec_tlu_ctl.scala 3250:129]
  wire  _T_1201 = _T_936 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1202 = _T_1201 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1203 = _T_1202 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1204 = _T_1203 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1205 = _T_1182 | _T_1204; // @[dec_tlu_ctl.scala 3251:65]
  wire  _T_1225 = _T_1201 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1226 = _T_1225 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1227 = _T_1226 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1228 = _T_1205 | _T_1227; // @[dec_tlu_ctl.scala 3251:121]
  wire  _T_1252 = _T_1107 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1253 = _T_1228 | _T_1252; // @[dec_tlu_ctl.scala 3252:73]
  wire  _T_1273 = _T_990 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1274 = _T_1273 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1275 = _T_1253 | _T_1274; // @[dec_tlu_ctl.scala 3252:129]
  wire  _T_1292 = _T_1032 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1293 = _T_1292 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1294 = _T_1293 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1295 = _T_1294 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1296 = _T_1295 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1297 = _T_1275 | _T_1296; // @[dec_tlu_ctl.scala 3253:73]
  wire  _T_1320 = _T_1295 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1321 = _T_1320 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1322 = _T_1297 | _T_1321; // @[dec_tlu_ctl.scala 3253:129]
  wire  _T_1338 = _T_1034 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1339 = _T_1322 | _T_1338; // @[dec_tlu_ctl.scala 3254:73]
  wire  _T_1361 = _T_1226 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1362 = _T_1339 | _T_1361; // @[dec_tlu_ctl.scala 3254:129]
  wire  _T_1383 = _T_1202 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1384 = _T_1362 | _T_1383; // @[dec_tlu_ctl.scala 3255:73]
  wire  _T_1407 = _T_1203 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1408 = _T_1384 | _T_1407; // @[dec_tlu_ctl.scala 3255:129]
  wire  _T_1432 = _T_1130 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1433 = _T_1432 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1434 = _T_1433 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1435 = _T_1434 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1436 = _T_1408 | _T_1435; // @[dec_tlu_ctl.scala 3256:73]
  wire  _T_1452 = _T_1034 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1453 = _T_1436 | _T_1452; // @[dec_tlu_ctl.scala 3256:121]
  wire  _T_1475 = _T_963 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1476 = _T_1475 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1477 = _T_1476 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1478 = _T_1477 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1479 = _T_1478 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1480 = _T_1453 | _T_1479; // @[dec_tlu_ctl.scala 3257:81]
  wire  _T_1503 = _T_963 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1504 = _T_1503 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1505 = _T_1504 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1506 = _T_1505 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1507 = _T_1506 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1508 = _T_1480 | _T_1507; // @[dec_tlu_ctl.scala 3257:129]
  wire  _T_1527 = _T_990 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1528 = _T_1508 | _T_1527; // @[dec_tlu_ctl.scala 3258:65]
  wire  _T_1544 = _T_1034 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1545 = _T_1528 | _T_1544; // @[dec_tlu_ctl.scala 3258:121]
  wire  _T_1564 = _T_990 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1565 = _T_1545 | _T_1564; // @[dec_tlu_ctl.scala 3259:81]
  wire  _T_1581 = _T_1034 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  assign io_csr_pkt_csr_misa = _T_11 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3175:57]
  assign io_csr_pkt_csr_mvendorid = _T_20 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3176:57]
  assign io_csr_pkt_csr_marchid = _T_29 & _T_27; // @[dec_tlu_ctl.scala 3177:57]
  assign io_csr_pkt_csr_mimpid = _T_37 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3178:57]
  assign io_csr_pkt_csr_mhartid = _T_19 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3179:57]
  assign io_csr_pkt_csr_mstatus = _T_11 & _T_27; // @[dec_tlu_ctl.scala 3180:57]
  assign io_csr_pkt_csr_mtvec = _T_69 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3181:57]
  assign io_csr_pkt_csr_mip = _T_75 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3182:65]
  assign io_csr_pkt_csr_mie = _T_69 & _T_27; // @[dec_tlu_ctl.scala 3183:65]
  assign io_csr_pkt_csr_mcyclel = _T_104 & _T_17; // @[dec_tlu_ctl.scala 3184:57]
  assign io_csr_pkt_csr_mcycleh = _T_123 & _T_17; // @[dec_tlu_ctl.scala 3185:57]
  assign io_csr_pkt_csr_minstretl = _T_142 & _T_27; // @[dec_tlu_ctl.scala 3186:57]
  assign io_csr_pkt_csr_minstreth = _T_160 & _T_27; // @[dec_tlu_ctl.scala 3187:57]
  assign io_csr_pkt_csr_mscratch = _T_173 & _T_27; // @[dec_tlu_ctl.scala 3188:57]
  assign io_csr_pkt_csr_mepc = _T_182 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3189:57]
  assign io_csr_pkt_csr_mcause = _T_191 & _T_27; // @[dec_tlu_ctl.scala 3190:57]
  assign io_csr_pkt_csr_mscause = _T_196 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3191:57]
  assign io_csr_pkt_csr_mtval = _T_191 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3192:57]
  assign io_csr_pkt_csr_mrac = _T_220 & _T_17; // @[dec_tlu_ctl.scala 3193:57]
  assign io_csr_pkt_csr_dmst = _T_232 & _T_17; // @[dec_tlu_ctl.scala 3194:57]
  assign io_csr_pkt_csr_mdseac = _T_241 & _T_96; // @[dec_tlu_ctl.scala 3195:57]
  assign io_csr_pkt_csr_meihap = _T_240 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3196:57]
  assign io_csr_pkt_csr_meivt = _T_261 & _T_27; // @[dec_tlu_ctl.scala 3197:57]
  assign io_csr_pkt_csr_meipt = _T_269 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3198:57]
  assign io_csr_pkt_csr_meicurpl = _T_268 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3199:57]
  assign io_csr_pkt_csr_meicidpl = _T_281 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3200:57]
  assign io_csr_pkt_csr_dcsr = _T_292 & _T_27; // @[dec_tlu_ctl.scala 3201:57]
  assign io_csr_pkt_csr_mcgc = _T_300 & _T_27; // @[dec_tlu_ctl.scala 3202:57]
  assign io_csr_pkt_csr_mfdc = _T_310 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3203:57]
  assign io_csr_pkt_csr_dpc = _T_292 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3204:65]
  assign io_csr_pkt_csr_mtsel = _T_332 & _T_27; // @[dec_tlu_ctl.scala 3205:57]
  assign io_csr_pkt_csr_mtdata1 = _T_231 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3206:57]
  assign io_csr_pkt_csr_mtdata2 = _T_331 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3207:57]
  assign io_csr_pkt_csr_mhpmc3 = _T_104 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3208:57]
  assign io_csr_pkt_csr_mhpmc4 = _T_382 & _T_27; // @[dec_tlu_ctl.scala 3209:57]
  assign io_csr_pkt_csr_mhpmc5 = _T_397 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3210:57]
  assign io_csr_pkt_csr_mhpmc6 = _T_415 & _T_27; // @[dec_tlu_ctl.scala 3211:57]
  assign io_csr_pkt_csr_mhpmc3h = _T_429 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3212:57]
  assign io_csr_pkt_csr_mhpmc4h = _T_447 & _T_27; // @[dec_tlu_ctl.scala 3213:57]
  assign io_csr_pkt_csr_mhpmc5h = _T_461 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3214:57]
  assign io_csr_pkt_csr_mhpmc6h = _T_478 & _T_27; // @[dec_tlu_ctl.scala 3215:57]
  assign io_csr_pkt_csr_mhpme3 = _T_493 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3216:57]
  assign io_csr_pkt_csr_mhpme4 = _T_508 & _T_27; // @[dec_tlu_ctl.scala 3217:57]
  assign io_csr_pkt_csr_mhpme5 = _T_508 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3218:57]
  assign io_csr_pkt_csr_mhpme6 = _T_536 & _T_27; // @[dec_tlu_ctl.scala 3219:57]
  assign io_csr_pkt_csr_mcountinhibit = _T_493 & _T_27; // @[dec_tlu_ctl.scala 3220:49]
  assign io_csr_pkt_csr_mitctl0 = _T_564 & _T_27; // @[dec_tlu_ctl.scala 3221:57]
  assign io_csr_pkt_csr_mitctl1 = _T_574 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3222:57]
  assign io_csr_pkt_csr_mitb0 = _T_585 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3223:57]
  assign io_csr_pkt_csr_mitb1 = _T_595 & _T_27; // @[dec_tlu_ctl.scala 3224:57]
  assign io_csr_pkt_csr_mitcnt0 = _T_585 & _T_27; // @[dec_tlu_ctl.scala 3225:57]
  assign io_csr_pkt_csr_mitcnt1 = _T_615 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3226:57]
  assign io_csr_pkt_csr_mpmc = _T_626 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3227:57]
  assign io_csr_pkt_csr_meicpct = _T_281 & _T_27; // @[dec_tlu_ctl.scala 3229:57]
  assign io_csr_pkt_csr_micect = _T_646 & _T_27; // @[dec_tlu_ctl.scala 3231:57]
  assign io_csr_pkt_csr_miccmect = _T_645 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3232:57]
  assign io_csr_pkt_csr_mdccmect = _T_662 & _T_27; // @[dec_tlu_ctl.scala 3233:57]
  assign io_csr_pkt_csr_mfdht = _T_672 & _T_27; // @[dec_tlu_ctl.scala 3234:57]
  assign io_csr_pkt_csr_mfdhs = _T_680 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3235:57]
  assign io_csr_pkt_csr_dicawics = _T_696 & _T_27; // @[dec_tlu_ctl.scala 3236:57]
  assign io_csr_pkt_csr_dicad0h = _T_704 & _T_17; // @[dec_tlu_ctl.scala 3237:57]
  assign io_csr_pkt_csr_dicad0 = _T_715 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3238:57]
  assign io_csr_pkt_csr_dicad1 = _T_726 & _T_27; // @[dec_tlu_ctl.scala 3239:57]
  assign io_csr_pkt_csr_dicago = _T_726 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3240:57]
  assign io_csr_pkt_presync = _T_807 | _T_822; // @[dec_tlu_ctl.scala 3241:34]
  assign io_csr_pkt_postsync = _T_903 | _T_915; // @[dec_tlu_ctl.scala 3243:30]
  assign io_csr_pkt_legal = _T_1565 | _T_1581; // @[dec_tlu_ctl.scala 3246:26]
endmodule
module dec_tlu_ctl(
  input         clock,
  input         reset,
  output [29:0] io_tlu_exu_dec_tlu_meihap,
  output        io_tlu_exu_dec_tlu_flush_lower_r,
  output [30:0] io_tlu_exu_dec_tlu_flush_path_r,
  input  [1:0]  io_tlu_exu_exu_i0_br_hist_r,
  input         io_tlu_exu_exu_i0_br_error_r,
  input         io_tlu_exu_exu_i0_br_start_error_r,
  input  [7:0]  io_tlu_exu_exu_i0_br_index_r,
  input         io_tlu_exu_exu_i0_br_valid_r,
  input         io_tlu_exu_exu_i0_br_mp_r,
  input         io_tlu_exu_exu_i0_br_middle_r,
  input         io_tlu_exu_exu_pmu_i0_br_misp,
  input         io_tlu_exu_exu_pmu_i0_br_ataken,
  input         io_tlu_exu_exu_pmu_i0_pc4,
  input  [30:0] io_tlu_exu_exu_npc_r,
  input         io_tlu_dma_dma_pmu_dccm_read,
  input         io_tlu_dma_dma_pmu_dccm_write,
  input         io_tlu_dma_dma_pmu_any_read,
  input         io_tlu_dma_dma_pmu_any_write,
  output [2:0]  io_tlu_dma_dec_tlu_dma_qos_prty,
  input         io_tlu_dma_dma_dccm_stall_any,
  input         io_tlu_dma_dma_iccm_stall_any,
  input         io_free_clk,
  input         io_free_l2clk,
  input         io_scan_mode,
  input  [30:0] io_rst_vec,
  input         io_nmi_int,
  input  [30:0] io_nmi_vec,
  input         io_i_cpu_halt_req,
  input         io_i_cpu_run_req,
  input         io_lsu_fastint_stall_any,
  input         io_lsu_idle_any,
  input         io_dec_pmu_instr_decoded,
  input         io_dec_pmu_decode_stall,
  input         io_dec_pmu_presync_stall,
  input         io_dec_pmu_postsync_stall,
  input         io_lsu_store_stall_any,
  input  [30:0] io_lsu_fir_addr,
  input  [1:0]  io_lsu_fir_error,
  input         io_iccm_dma_sb_error,
  input         io_lsu_error_pkt_r_valid,
  input         io_lsu_error_pkt_r_bits_single_ecc_error,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input  [3:0]  io_lsu_error_pkt_r_bits_mscause,
  input  [31:0] io_lsu_error_pkt_r_bits_addr,
  input         io_lsu_single_ecc_error_incr,
  input         io_dec_pause_state,
  input         io_dec_csr_wen_unq_d,
  input         io_dec_csr_any_unq_d,
  input  [11:0] io_dec_csr_rdaddr_d,
  input         io_dec_csr_wen_r,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_dec_csr_stall_int_ff,
  input         io_dec_tlu_i0_valid_r,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input         io_dec_tlu_packet_r_legal,
  input         io_dec_tlu_packet_r_icaf,
  input         io_dec_tlu_packet_r_icaf_second,
  input  [1:0]  io_dec_tlu_packet_r_icaf_type,
  input         io_dec_tlu_packet_r_fence_i,
  input  [3:0]  io_dec_tlu_packet_r_i0trigger,
  input  [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  input         io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input         io_dec_tlu_packet_r_pmu_divide,
  input         io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input  [31:0] io_dec_illegal_inst,
  input         io_dec_i0_decode_d,
  input         io_exu_i0_br_way_r,
  output        io_dec_tlu_core_empty,
  output        io_dec_dbg_cmd_done,
  output        io_dec_dbg_cmd_fail,
  output        io_dec_tlu_dbg_halted,
  output        io_dec_tlu_debug_mode,
  output        io_dec_tlu_resume_ack,
  output        io_dec_tlu_debug_stall,
  output        io_dec_tlu_mpc_halted_only,
  output        io_dec_tlu_flush_extint,
  input         io_dbg_halt_req,
  input         io_dbg_resume_req,
  input         io_dec_div_active,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_pkt,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_pkt,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_pkt,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_pkt,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_timer_int,
  input         io_soft_int,
  output        io_o_cpu_halt_status,
  output        io_o_cpu_halt_ack,
  output        io_o_cpu_run_ack,
  output        io_o_debug_mode_status,
  input  [27:0] io_core_id,
  input         io_mpc_debug_halt_req,
  input         io_mpc_debug_run_req,
  input         io_mpc_reset_run_req,
  output        io_mpc_debug_halt_ack,
  output        io_mpc_debug_run_ack,
  output        io_debug_brkpt_status,
  output [31:0] io_dec_csr_rddata_d,
  output        io_dec_csr_legal_d,
  output        io_dec_tlu_i0_kill_writeb_wb,
  output        io_dec_tlu_i0_kill_writeb_r,
  output        io_dec_tlu_wr_pause_r,
  output        io_dec_tlu_flush_pause_r,
  output        io_dec_tlu_presync_d,
  output        io_dec_tlu_postsync_d,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  output        io_dec_tlu_i0_exc_valid_wb1,
  output        io_dec_tlu_i0_valid_wb1,
  output        io_dec_tlu_int_valid_wb1,
  output [4:0]  io_dec_tlu_exc_cause_wb1,
  output [31:0] io_dec_tlu_mtval_wb1,
  output        io_dec_tlu_pipelining_disable,
  output        io_dec_tlu_trace_disable,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_dec_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_picio_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override,
  output        io_dec_tlu_flush_lower_wb,
  input         io_ifu_pmu_instr_aligned,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_valid,
  output [1:0]  io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_way,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle,
  output        io_tlu_bp_dec_tlu_flush_leak_one_wb,
  output        io_tlu_bp_dec_tlu_bpred_disable,
  output        io_tlu_ifc_dec_tlu_flush_noredir_wb,
  output [31:0] io_tlu_ifc_dec_tlu_mrac_ff,
  input         io_tlu_ifc_ifu_pmu_fetch_stall,
  output        io_tlu_mem_dec_tlu_flush_err_wb,
  output        io_tlu_mem_dec_tlu_i0_commit_cmt,
  output        io_tlu_mem_dec_tlu_force_halt,
  output        io_tlu_mem_dec_tlu_fence_i_wb,
  output [70:0] io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid,
  output        io_tlu_mem_dec_tlu_core_ecc_disable,
  input         io_tlu_mem_ifu_pmu_ic_miss,
  input         io_tlu_mem_ifu_pmu_ic_hit,
  input         io_tlu_mem_ifu_pmu_bus_error,
  input         io_tlu_mem_ifu_pmu_bus_busy,
  input         io_tlu_mem_ifu_pmu_bus_trxn,
  input         io_tlu_mem_ifu_ic_error_start,
  input         io_tlu_mem_ifu_iccm_rd_ecc_single_err,
  input  [70:0] io_tlu_mem_ifu_ic_debug_rd_data,
  input         io_tlu_mem_ifu_ic_debug_rd_data_valid,
  input         io_tlu_mem_ifu_miss_state_idle,
  input         io_tlu_busbuff_lsu_pmu_bus_trxn,
  input         io_tlu_busbuff_lsu_pmu_bus_misaligned,
  input         io_tlu_busbuff_lsu_pmu_bus_error,
  input         io_tlu_busbuff_lsu_pmu_bus_busy,
  output        io_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  output        io_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  output        io_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  input         io_tlu_busbuff_lsu_imprecise_error_load_any,
  input         io_tlu_busbuff_lsu_imprecise_error_store_any,
  input  [31:0] io_tlu_busbuff_lsu_imprecise_error_addr_any,
  input         io_lsu_tlu_lsu_pmu_load_external_m,
  input         io_lsu_tlu_lsu_pmu_store_external_m,
  input  [7:0]  io_dec_pic_pic_claimid,
  input  [3:0]  io_dec_pic_pic_pl,
  input         io_dec_pic_mhwakeup,
  output [3:0]  io_dec_pic_dec_tlu_meicurpl,
  output [3:0]  io_dec_pic_dec_tlu_meipt,
  input         io_dec_pic_mexintpend
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
`endif // RANDOMIZE_REG_INIT
  wire  int_exc_clock; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_reset; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mhwakeup_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ext_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ce_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_soft_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_timer_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer0_int_hold; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer1_int_hold; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ext_int_freeze; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_fast_int_meicpct; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ignore_ext_int_due_to_lsu_stall; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ce_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_soft_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_timer_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_reset; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_nmi; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_synchronous_flush_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_flush_lower_wb; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_dec_tlu_flush_path_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_exception_valid_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_exc_or_int_valid_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire [4:0] int_exc_io_exc_cause_wb; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_valid_wb; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_trigger_hit_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_nmi_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire [4:0] int_exc_io_exc_cause_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_tlu_flush_path_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_csr_stall_int_ff; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 282:29]
  wire [5:0] int_exc_io_mip; // @[dec_tlu_ctl.scala 282:29]
  wire [5:0] int_exc_io_mie_ns; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mret_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dcsr_single_step_running; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_pmu_fw_halt_mode; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 282:29]
  wire [1:0] int_exc_io_lsu_fir_error; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_csr_pkt_csr_meicpct; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_fastint_stall_any; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_reset_delayed; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_nmi_int_detected; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 282:29]
  wire [15:0] int_exc_io_dcsr; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_mtvec; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_pause_expired_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_nmi_vec; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_i0_rfnpc_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_fence_i_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_iccm_repair_state_rfnpc; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i_cpu_run_req_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_rfpc_i0_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_halt; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_rst_vec; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_lsu_fir_addr; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_npc_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_mepc; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_debug_resume_req_f; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_dpc; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_npc_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ebreak_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ecall_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_illegal_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_inst_acc_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_wr_pause_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  csr_clock; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_reset; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_free_l2clk; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_free_clk; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 283:23]
  wire [11:0] csr_io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 283:23]
  wire [11:0] csr_io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_i0_decode_d; // @[dec_tlu_ctl.scala 283:23]
  wire [70:0] csr_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[dec_tlu_ctl.scala 283:23]
  wire [16:0] csr_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_0_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_1_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_2_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_3_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 283:23]
  wire [1:0] csr_io_dec_tlu_packet_r_icaf_type; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_int_valid_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_i0_exc_valid_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_i0_valid_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_wen_r; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_tlu_mtval_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire [4:0] csr_io_dec_tlu_exc_cause_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_any_write; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_any_read; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_misc_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_picio_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_dec_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_ifu_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_lsu_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_bus_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_pic_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_dccm_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_icm_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_csr_rddata_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_pipelining_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_wr_pause_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 283:23]
  wire [70:0] csr_io_ifu_ic_debug_rd_data; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_dec_tlu_meipt; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_pic_pl; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_dec_tlu_meicurpl; // @[dec_tlu_ctl.scala 283:23]
  wire [29:0] csr_io_dec_tlu_meihap; // @[dec_tlu_ctl.scala 283:23]
  wire [7:0] csr_io_pic_claimid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_lsu_imprecise_error_addr_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_tlu_mrac_ff; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_wb_coalescing_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_bpred_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_sideeffect_posted_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_core_ecc_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_external_ldfwd_disable; // @[dec_tlu_ctl.scala 283:23]
  wire [2:0] csr_io_dec_tlu_dma_qos_prty; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_trace_disable; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_illegal_inst; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_lsu_error_pkt_r_bits_mscause; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mexintpend; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_exu_npc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_rst_vec; // @[dec_tlu_ctl.scala 283:23]
  wire [27:0] csr_io_core_id; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_timer_rddata_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_timer_read_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_rfpc_i0_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_fw_halt_req; // @[dec_tlu_ctl.scala 283:23]
  wire [1:0] csr_io_mstatus; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mret_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 283:23]
  wire [15:0] csr_io_dcsr; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_mtvec; // @[dec_tlu_ctl.scala 283:23]
  wire [5:0] csr_io_mip; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_timer_t0_pulse; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_timer_t1_pulse; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_timer_int_sync; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_soft_int_sync; // @[dec_tlu_ctl.scala 283:23]
  wire [5:0] csr_io_mie_ns; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_wr_clk; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 283:23]
  wire [1:0] csr_io_lsu_fir_error; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_npc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_tlu_flush_path_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_npc_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_reset_delayed; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_mepc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_single_ecc_error_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_e4e5_int_clk; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_inst_acc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_inst_acc_second_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_nmi; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_lsu_error_pkt_addr_r; // @[dec_tlu_ctl.scala 283:23]
  wire [4:0] csr_io_exc_cause_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_valid_wb; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_exception_valid_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire [4:0] csr_io_exc_cause_wb; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_nmi_lsu_store_type; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_nmi_lsu_load_type; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ebreak_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ecall_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_illegal_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mdseac_locked_ns; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_nmi_int_detected_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_internal_dbg_halt_mode_f2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ext_int_freeze; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ic_perr_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_iccm_sbecc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_idle_any_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dbg_tlu_halted; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_debug_halt_req_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_force_halt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_hit_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_debug_halt_req; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_allow_dbg_halt_csr_write; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_enter_debug_halt_req; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_request_debug_mode_done; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_request_debug_mode_r; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_dpc; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_update_hit_bit_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_timer_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_br0_error_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_misa; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mstatus; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtvec; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mip; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mie; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcyclel; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcycleh; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_minstretl; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_minstreth; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mscratch; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mepc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcause; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mscause; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtval; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mrac; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meivt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meipt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meicurpl; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meicidpl; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcgc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mfdc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtsel; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtdata1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc4; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc5; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc6; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc3h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc4h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc5h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc6h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme4; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme5; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme6; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcountinhibit; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mpmc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_micect; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_miccmect; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mdccmect; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mfdht; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mfdhs; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_0; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_1; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_2; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_3; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_trigger_enabled; // @[dec_tlu_ctl.scala 283:23]
  wire  int_timers_clock; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_reset; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_free_l2clk; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_wr_clk; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 284:30]
  wire [11:0] int_timers_io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 284:30]
  wire [31:0] int_timers_io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitctl0; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitctl1; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitb0; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitb1; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitcnt0; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitcnt1; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_pause_state; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 284:30]
  wire [31:0] int_timers_io_dec_timer_rddata_d; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_timer_read_d; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_timer_t0_pulse; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_timer_t1_pulse; // @[dec_tlu_ctl.scala 284:30]
  wire [11:0] csr_read_io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_misa; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mstatus; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtvec; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mip; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mie; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcyclel; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcycleh; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_minstretl; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_minstreth; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mscratch; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mepc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcause; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mscause; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtval; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mrac; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dmst; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meivt; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meipt; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meicurpl; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meicidpl; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcgc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mfdc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtsel; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtdata1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtdata2; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc3; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc4; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc5; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc6; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc3h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc4h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc5h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc6h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme3; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme4; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme5; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme6; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcountinhibit; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitctl0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitctl1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitb0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitb1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitcnt0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitcnt1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mpmc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meicpct; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_micect; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_miccmect; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mdccmect; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mfdht; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mfdhs; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicago; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_presync; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_postsync; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_legal; // @[dec_tlu_ctl.scala 1017:28]
  reg  dbg_halt_state_f; // @[Reg.scala 27:20]
  wire  _T = ~dbg_halt_state_f; // @[dec_tlu_ctl.scala 281:39]
  reg  mpc_halt_state_f; // @[Reg.scala 27:20]
  wire  _T_1 = _T & mpc_halt_state_f; // @[dec_tlu_ctl.scala 281:57]
  wire [2:0] _T_3 = {io_i_cpu_run_req,io_mpc_debug_halt_req,io_mpc_debug_run_req}; // @[Cat.scala 29:58]
  wire [3:0] _T_6 = {io_nmi_int,io_timer_int,io_soft_int,io_i_cpu_halt_req}; // @[Cat.scala 29:58]
  reg [6:0] _T_8; // @[lib.scala 37:81]
  reg [6:0] syncro_ff; // @[lib.scala 37:58]
  wire  nmi_int_sync = syncro_ff[6]; // @[dec_tlu_ctl.scala 311:75]
  wire  i_cpu_halt_req_sync = syncro_ff[3]; // @[dec_tlu_ctl.scala 314:59]
  wire  i_cpu_run_req_sync = syncro_ff[2]; // @[dec_tlu_ctl.scala 315:59]
  wire  mpc_debug_halt_req_sync_raw = syncro_ff[1]; // @[dec_tlu_ctl.scala 316:51]
  wire  mpc_debug_run_req_sync = syncro_ff[0]; // @[dec_tlu_ctl.scala 317:59]
  wire  dec_csr_wen_r_mod = csr_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 1010:37]
  reg  debug_mode_status; // @[Reg.scala 27:20]
  reg  i_cpu_run_req_d1_raw; // @[Reg.scala 27:20]
  reg  nmi_int_delayed; // @[Reg.scala 27:20]
  wire  _T_76 = ~nmi_int_delayed; // @[dec_tlu_ctl.scala 360:45]
  wire  _T_77 = nmi_int_sync & _T_76; // @[dec_tlu_ctl.scala 360:43]
  wire  mdseac_locked_f = csr_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 965:27]
  wire  _T_72 = ~mdseac_locked_f; // @[dec_tlu_ctl.scala 357:32]
  wire  _T_73 = io_tlu_busbuff_lsu_imprecise_error_load_any | io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 357:96]
  wire  _T_74 = _T_72 & _T_73; // @[dec_tlu_ctl.scala 357:49]
  reg  nmi_int_detected_f; // @[Reg.scala 27:20]
  wire  _T_99 = ~nmi_int_detected_f; // @[dec_tlu_ctl.scala 365:25]
  wire  _T_100 = _T_99 & csr_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 365:45]
  wire  _T_101 = |io_lsu_fir_error; // @[dec_tlu_ctl.scala 365:95]
  wire  nmi_fir_type = _T_100 & _T_101; // @[dec_tlu_ctl.scala 365:76]
  wire  _T_75 = ~nmi_fir_type; // @[dec_tlu_ctl.scala 357:146]
  wire  nmi_lsu_detected = _T_74 & _T_75; // @[dec_tlu_ctl.scala 357:144]
  wire  _T_78 = _T_77 | nmi_lsu_detected; // @[dec_tlu_ctl.scala 360:63]
  wire  take_nmi_r_d1 = int_exc_io_take_nmi_r_d1; // @[dec_tlu_ctl.scala 814:43]
  wire  _T_79 = ~take_nmi_r_d1; // @[dec_tlu_ctl.scala 360:106]
  wire  _T_80 = nmi_int_detected_f & _T_79; // @[dec_tlu_ctl.scala 360:104]
  wire  _T_81 = _T_78 | _T_80; // @[dec_tlu_ctl.scala 360:82]
  wire  nmi_int_detected = _T_81 | nmi_fir_type; // @[dec_tlu_ctl.scala 360:122]
  wire  timer_int_ready = int_exc_io_timer_int_ready; // @[dec_tlu_ctl.scala 784:43]
  wire  _T_576 = nmi_int_detected | timer_int_ready; // @[dec_tlu_ctl.scala 633:71]
  wire  soft_int_ready = int_exc_io_soft_int_ready; // @[dec_tlu_ctl.scala 783:43]
  wire  _T_577 = _T_576 | soft_int_ready; // @[dec_tlu_ctl.scala 633:89]
  reg  int_timer0_int_hold_f; // @[Reg.scala 27:20]
  wire  _T_578 = _T_577 | int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 633:106]
  reg  int_timer1_int_hold_f; // @[Reg.scala 27:20]
  wire  _T_579 = _T_578 | int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 633:130]
  wire  mhwakeup_ready = int_exc_io_mhwakeup_ready; // @[dec_tlu_ctl.scala 780:43]
  wire  _T_580 = io_dec_pic_mhwakeup & mhwakeup_ready; // @[dec_tlu_ctl.scala 633:177]
  wire  _T_581 = _T_579 | _T_580; // @[dec_tlu_ctl.scala 633:154]
  wire  _T_582 = _T_581 & io_o_cpu_halt_status; // @[dec_tlu_ctl.scala 633:196]
  reg  i_cpu_halt_req_d1; // @[Reg.scala 27:20]
  wire  _T_583 = ~i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 633:221]
  wire  _T_584 = _T_582 & _T_583; // @[dec_tlu_ctl.scala 633:219]
  wire  i_cpu_run_req_d1 = i_cpu_run_req_d1_raw | _T_584; // @[dec_tlu_ctl.scala 633:50]
  wire  interrupt_valid_r = int_exc_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 816:43]
  wire  interrupt_valid_r_d1 = int_exc_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 812:43]
  reg  reset_detect; // @[Reg.scala 27:20]
  reg  reset_detected; // @[Reg.scala 27:20]
  wire  reset_delayed = reset_detect ^ reset_detected; // @[dec_tlu_ctl.scala 369:64]
  wire  _T_345 = ~io_dec_pause_state; // @[dec_tlu_ctl.scala 504:28]
  reg  dec_pause_state_f; // @[Reg.scala 27:20]
  wire  _T_346 = _T_345 & dec_pause_state_f; // @[dec_tlu_ctl.scala 504:48]
  wire  ext_int_ready = int_exc_io_ext_int_ready; // @[dec_tlu_ctl.scala 781:43]
  wire  ce_int_ready = int_exc_io_ce_int_ready; // @[dec_tlu_ctl.scala 782:43]
  wire  _T_347 = ext_int_ready | ce_int_ready; // @[dec_tlu_ctl.scala 504:86]
  wire  _T_348 = _T_347 | timer_int_ready; // @[dec_tlu_ctl.scala 504:101]
  wire  _T_349 = _T_348 | soft_int_ready; // @[dec_tlu_ctl.scala 504:119]
  wire  _T_350 = _T_349 | int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 504:136]
  wire  _T_351 = _T_350 | int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 504:160]
  wire  _T_352 = _T_351 | nmi_int_detected; // @[dec_tlu_ctl.scala 504:184]
  wire  _T_353 = _T_352 | csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 504:203]
  wire  _T_354 = ~_T_353; // @[dec_tlu_ctl.scala 504:70]
  wire  _T_355 = _T_346 & _T_354; // @[dec_tlu_ctl.scala 504:68]
  wire  _T_356 = ~interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 504:233]
  wire  _T_357 = _T_355 & _T_356; // @[dec_tlu_ctl.scala 504:231]
  reg  debug_halt_req_f; // @[Reg.scala 27:20]
  wire  _T_358 = ~debug_halt_req_f; // @[dec_tlu_ctl.scala 504:257]
  wire  _T_359 = _T_357 & _T_358; // @[dec_tlu_ctl.scala 504:255]
  reg  pmu_fw_halt_req_f; // @[Reg.scala 27:20]
  wire  _T_360 = ~pmu_fw_halt_req_f; // @[dec_tlu_ctl.scala 504:277]
  wire  _T_361 = _T_359 & _T_360; // @[dec_tlu_ctl.scala 504:275]
  reg  halt_taken_f; // @[Reg.scala 27:20]
  wire  _T_362 = ~halt_taken_f; // @[dec_tlu_ctl.scala 504:298]
  reg  ifu_ic_error_start_f; // @[Reg.scala 27:20]
  wire  _T_680 = ~csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 709:49]
  wire  _T_681 = ifu_ic_error_start_f & _T_680; // @[dec_tlu_ctl.scala 709:47]
  wire  _T_682 = ~debug_mode_status; // @[dec_tlu_ctl.scala 709:78]
  reg  debug_resume_req_f_raw; // @[Reg.scala 27:20]
  wire  _T_333 = ~io_dbg_halt_req; // @[dec_tlu_ctl.scala 489:56]
  wire  debug_resume_req_f = debug_resume_req_f_raw & _T_333; // @[dec_tlu_ctl.scala 489:54]
  wire [15:0] dcsr = csr_io_dcsr; // @[dec_tlu_ctl.scala 1013:37]
  wire  _T_255 = debug_resume_req_f & dcsr[2]; // @[dec_tlu_ctl.scala 459:60]
  reg  dcsr_single_step_running_f; // @[Reg.scala 27:20]
  reg  dcsr_single_step_done_f; // @[Reg.scala 27:20]
  wire  _T_256 = ~dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 459:111]
  wire  _T_257 = dcsr_single_step_running_f & _T_256; // @[dec_tlu_ctl.scala 459:109]
  wire  dcsr_single_step_running = _T_255 | _T_257; // @[dec_tlu_ctl.scala 459:79]
  wire  _T_683 = _T_682 | dcsr_single_step_running; // @[dec_tlu_ctl.scala 709:104]
  wire  _T_684 = _T_681 & _T_683; // @[dec_tlu_ctl.scala 709:75]
  reg  internal_pmu_fw_halt_mode_f; // @[Reg.scala 27:20]
  wire  _T_685 = ~internal_pmu_fw_halt_mode_f; // @[dec_tlu_ctl.scala 709:134]
  wire  ic_perr_r = _T_684 & _T_685; // @[dec_tlu_ctl.scala 709:132]
  reg  ifu_iccm_rd_ecc_single_err_f; // @[Reg.scala 27:20]
  wire  _T_688 = ifu_iccm_rd_ecc_single_err_f & _T_680; // @[dec_tlu_ctl.scala 710:55]
  wire  _T_691 = _T_688 & _T_683; // @[dec_tlu_ctl.scala 710:83]
  wire  iccm_sbecc_r = _T_691 & _T_685; // @[dec_tlu_ctl.scala 710:140]
  wire  _T_23 = io_tlu_mem_ifu_ic_error_start ^ ifu_ic_error_start_f; // @[lib.scala 470:21]
  wire  _T_24 = |_T_23; // @[lib.scala 470:29]
  wire  _T_26 = io_tlu_mem_ifu_iccm_rd_ecc_single_err ^ ifu_iccm_rd_ecc_single_err_f; // @[lib.scala 470:21]
  wire  _T_27 = |_T_26; // @[lib.scala 470:29]
  reg  iccm_repair_state_d1; // @[Reg.scala 27:20]
  wire  _T_623 = ~io_tlu_exu_dec_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 666:72]
  wire  _T_624 = iccm_repair_state_d1 & _T_623; // @[dec_tlu_ctl.scala 666:70]
  wire  iccm_repair_state_ns = iccm_sbecc_r | _T_624; // @[dec_tlu_ctl.scala 666:46]
  wire  _T_29 = iccm_repair_state_ns ^ iccm_repair_state_d1; // @[lib.scala 448:21]
  wire  _T_30 = |_T_29; // @[lib.scala 448:29]
  reg  dbg_halt_req_held; // @[Reg.scala 27:20]
  wire  _T_184 = io_dbg_halt_req | dbg_halt_req_held; // @[dec_tlu_ctl.scala 418:48]
  wire  dbg_halt_req_final = _T_184 & _T_680; // @[dec_tlu_ctl.scala 418:69]
  wire  mpc_debug_halt_req_sync = mpc_debug_halt_req_sync_raw & _T_680; // @[dec_tlu_ctl.scala 376:67]
  wire  _T_187 = dbg_halt_req_final | mpc_debug_halt_req_sync; // @[dec_tlu_ctl.scala 421:50]
  wire  _T_188 = ~io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 421:95]
  wire  _T_189 = reset_delayed & _T_188; // @[dec_tlu_ctl.scala 421:93]
  wire  _T_190 = _T_187 | _T_189; // @[dec_tlu_ctl.scala 421:76]
  wire  _T_192 = _T_190 & _T_682; // @[dec_tlu_ctl.scala 421:119]
  wire  debug_halt_req = _T_192 & _T_680; // @[dec_tlu_ctl.scala 421:147]
  wire  _T_231 = _T_682 & debug_halt_req; // @[dec_tlu_ctl.scala 441:63]
  wire  _T_232 = _T_231 | dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 441:81]
  reg  trigger_hit_dmode_r_d1; // @[Reg.scala 27:20]
  wire  _T_233 = _T_232 | trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 441:107]
  reg  ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 718:64]
  wire  enter_debug_halt_req = _T_233 | ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 441:132]
  wire  force_halt = csr_io_force_halt; // @[dec_tlu_ctl.scala 1007:37]
  reg  lsu_idle_any_f; // @[Reg.scala 27:20]
  wire  _T_220 = io_lsu_idle_any & lsu_idle_any_f; // @[dec_tlu_ctl.scala 435:53]
  wire  _T_221 = _T_220 & io_tlu_mem_ifu_miss_state_idle; // @[dec_tlu_ctl.scala 435:70]
  reg  ifu_miss_state_idle_f; // @[Reg.scala 27:20]
  wire  _T_222 = _T_221 & ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 435:103]
  wire  _T_223 = ~debug_halt_req; // @[dec_tlu_ctl.scala 435:129]
  wire  _T_224 = _T_222 & _T_223; // @[dec_tlu_ctl.scala 435:127]
  reg  debug_halt_req_d1; // @[Reg.scala 27:20]
  wire  _T_225 = ~debug_halt_req_d1; // @[dec_tlu_ctl.scala 435:147]
  wire  _T_226 = _T_224 & _T_225; // @[dec_tlu_ctl.scala 435:145]
  wire  _T_227 = ~io_dec_div_active; // @[dec_tlu_ctl.scala 435:168]
  wire  _T_228 = _T_226 & _T_227; // @[dec_tlu_ctl.scala 435:166]
  wire  core_empty = force_halt | _T_228; // @[dec_tlu_ctl.scala 435:34]
  wire  _T_241 = debug_halt_req_f & core_empty; // @[dec_tlu_ctl.scala 452:48]
  reg  dec_tlu_flush_noredir_r_d1; // @[Reg.scala 27:20]
  reg  dec_tlu_flush_pause_r_d1; // @[Reg.scala 27:20]
  wire  _T_210 = ~dec_tlu_flush_pause_r_d1; // @[dec_tlu_ctl.scala 431:56]
  wire  _T_211 = dec_tlu_flush_noredir_r_d1 & _T_210; // @[dec_tlu_ctl.scala 431:54]
  wire  _T_212 = ~csr_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 431:84]
  wire  _T_213 = _T_211 & _T_212; // @[dec_tlu_ctl.scala 431:82]
  reg  dbg_tlu_halted_f; // @[Reg.scala 27:20]
  wire  _T_214 = ~dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 431:133]
  wire  _T_215 = halt_taken_f & _T_214; // @[dec_tlu_ctl.scala 431:131]
  reg  pmu_fw_tlu_halted_f; // @[Reg.scala 27:20]
  wire  _T_216 = ~pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 431:153]
  wire  _T_217 = _T_215 & _T_216; // @[dec_tlu_ctl.scala 431:151]
  wire  _T_219 = _T_217 & _T_356; // @[dec_tlu_ctl.scala 431:174]
  wire  halt_taken = _T_213 | _T_219; // @[dec_tlu_ctl.scala 431:115]
  wire  _T_242 = _T_241 & halt_taken; // @[dec_tlu_ctl.scala 452:61]
  wire  _T_243 = ~debug_resume_req_f; // @[dec_tlu_ctl.scala 452:97]
  wire  _T_244 = dbg_tlu_halted_f & _T_243; // @[dec_tlu_ctl.scala 452:95]
  wire  dbg_tlu_halted = _T_242 | _T_244; // @[dec_tlu_ctl.scala 452:75]
  wire  _T_245 = ~dbg_tlu_halted; // @[dec_tlu_ctl.scala 454:73]
  wire  _T_246 = debug_halt_req_f & _T_245; // @[dec_tlu_ctl.scala 454:71]
  wire  debug_halt_req_ns = enter_debug_halt_req | _T_246; // @[dec_tlu_ctl.scala 454:51]
  wire  _T_235 = ~dcsr[2]; // @[dec_tlu_ctl.scala 444:106]
  wire  _T_236 = debug_resume_req_f & _T_235; // @[dec_tlu_ctl.scala 444:104]
  wire  _T_237 = ~_T_236; // @[dec_tlu_ctl.scala 444:83]
  wire  _T_238 = debug_mode_status & _T_237; // @[dec_tlu_ctl.scala 444:81]
  wire  internal_dbg_halt_mode = debug_halt_req_ns | _T_238; // @[dec_tlu_ctl.scala 444:53]
  wire  _T_37 = internal_dbg_halt_mode ^ debug_mode_status; // @[lib.scala 448:21]
  wire  _T_38 = |_T_37; // @[lib.scala 448:29]
  reg  lsu_pmu_load_external_r; // @[Reg.scala 27:20]
  wire  _T_40 = io_lsu_tlu_lsu_pmu_load_external_m ^ lsu_pmu_load_external_r; // @[lib.scala 470:21]
  wire  _T_41 = |_T_40; // @[lib.scala 470:29]
  reg  lsu_pmu_store_external_r; // @[Reg.scala 27:20]
  wire  _T_43 = io_lsu_tlu_lsu_pmu_store_external_m ^ lsu_pmu_store_external_r; // @[lib.scala 470:21]
  wire  _T_44 = |_T_43; // @[lib.scala 470:29]
  wire  tlu_flush_lower_r = int_exc_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 808:43]
  reg  tlu_flush_lower_r_d1; // @[Reg.scala 27:20]
  wire  _T_46 = tlu_flush_lower_r ^ tlu_flush_lower_r_d1; // @[lib.scala 448:21]
  wire  _T_47 = |_T_46; // @[lib.scala 448:29]
  wire  _T_611 = ~tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 663:49]
  wire  _T_612 = io_dec_tlu_i0_valid_r & _T_611; // @[dec_tlu_ctl.scala 663:47]
  wire  _T_613 = io_tlu_exu_exu_i0_br_error_r | io_tlu_exu_exu_i0_br_start_error_r; // @[dec_tlu_ctl.scala 663:103]
  wire  _T_614 = _T_612 & _T_613; // @[dec_tlu_ctl.scala 663:71]
  wire  _T_615 = ic_perr_r | iccm_sbecc_r; // @[dec_tlu_ctl.scala 663:156]
  wire  _T_617 = _T_615 & _T_680; // @[dec_tlu_ctl.scala 663:172]
  wire  _T_618 = _T_614 | _T_617; // @[dec_tlu_ctl.scala 663:142]
  wire  _T_431 = io_dec_tlu_flush_lower_wb | io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 545:64]
  wire [3:0] _T_433 = _T_431 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_434 = ~_T_433; // @[dec_tlu_ctl.scala 545:29]
  wire [3:0] _T_426 = io_dec_tlu_i0_valid_r ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_428 = _T_426 & io_dec_tlu_packet_r_i0trigger; // @[dec_tlu_ctl.scala 543:58]
  wire [9:0] mtdata1_t_3 = csr_io_mtdata1_t_3; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [9:0] mtdata1_t_2 = csr_io_mtdata1_t_2; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [9:0] mtdata1_t_1 = csr_io_mtdata1_t_1; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [9:0] mtdata1_t_0 = csr_io_mtdata1_t_0; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [3:0] trigger_execute = {mtdata1_t_3[2],mtdata1_t_2[2],mtdata1_t_1[2],mtdata1_t_0[2]}; // @[Cat.scala 29:58]
  wire [3:0] trigger_data = {mtdata1_t_3[7],mtdata1_t_2[7],mtdata1_t_1[7],mtdata1_t_0[7]}; // @[Cat.scala 29:58]
  wire [3:0] _T_413 = trigger_execute & trigger_data; // @[dec_tlu_ctl.scala 535:62]
  wire  inst_acc_r_raw = io_dec_tlu_packet_r_icaf & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 712:54]
  wire [3:0] _T_415 = inst_acc_r_raw ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_416 = _T_413 & _T_415; // @[dec_tlu_ctl.scala 535:77]
  wire [3:0] _T_419 = _T_613 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_420 = _T_416 | _T_419; // @[dec_tlu_ctl.scala 535:103]
  wire [3:0] i0_iside_trigger_has_pri_r = ~_T_420; // @[dec_tlu_ctl.scala 535:43]
  wire [3:0] _T_429 = _T_428 & i0_iside_trigger_has_pri_r; // @[dec_tlu_ctl.scala 543:95]
  wire [3:0] trigger_store = {mtdata1_t_3[1],mtdata1_t_2[1],mtdata1_t_1[1],mtdata1_t_0[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_421 = trigger_store & trigger_data; // @[dec_tlu_ctl.scala 538:56]
  wire [3:0] _T_423 = io_lsu_error_pkt_r_valid ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_424 = _T_421 & _T_423; // @[dec_tlu_ctl.scala 538:71]
  wire [3:0] i0_lsu_trigger_has_pri_r = ~_T_424; // @[dec_tlu_ctl.scala 538:40]
  wire [3:0] _T_430 = _T_429 & i0_lsu_trigger_has_pri_r; // @[dec_tlu_ctl.scala 543:124]
  wire [1:0] mstatus = csr_io_mstatus; // @[dec_tlu_ctl.scala 1012:37]
  wire  _T_393 = mtdata1_t_3[6] | mstatus[0]; // @[dec_tlu_ctl.scala 529:70]
  wire  _T_395 = _T_393 & mtdata1_t_3[3]; // @[dec_tlu_ctl.scala 529:94]
  wire  _T_398 = mtdata1_t_2[6] | mstatus[0]; // @[dec_tlu_ctl.scala 530:47]
  wire  _T_400 = _T_398 & mtdata1_t_2[3]; // @[dec_tlu_ctl.scala 530:71]
  wire [1:0] _T_412 = {_T_395,_T_400}; // @[Cat.scala 29:58]
  wire  _T_403 = mtdata1_t_1[6] | mstatus[0]; // @[dec_tlu_ctl.scala 531:47]
  wire  _T_405 = _T_403 & mtdata1_t_1[3]; // @[dec_tlu_ctl.scala 531:71]
  wire  _T_408 = mtdata1_t_0[6] | mstatus[0]; // @[dec_tlu_ctl.scala 532:47]
  wire  _T_410 = _T_408 & mtdata1_t_0[3]; // @[dec_tlu_ctl.scala 532:71]
  wire [1:0] _T_411 = {_T_405,_T_410}; // @[Cat.scala 29:58]
  wire [3:0] trigger_enabled = {_T_395,_T_400,_T_405,_T_410}; // @[Cat.scala 29:58]
  wire [3:0] i0trigger_qual_r = _T_430 & trigger_enabled; // @[dec_tlu_ctl.scala 543:151]
  wire [3:0] i0_trigger_r = _T_434 & i0trigger_qual_r; // @[dec_tlu_ctl.scala 545:90]
  wire  _T_437 = ~mtdata1_t_2[5]; // @[dec_tlu_ctl.scala 548:65]
  wire  _T_439 = _T_437 | i0_trigger_r[2]; // @[dec_tlu_ctl.scala 548:94]
  wire  _T_440 = i0_trigger_r[3] & _T_439; // @[dec_tlu_ctl.scala 548:62]
  wire  _T_445 = _T_437 | i0_trigger_r[3]; // @[dec_tlu_ctl.scala 549:65]
  wire  _T_446 = i0_trigger_r[2] & _T_445; // @[dec_tlu_ctl.scala 549:33]
  wire  _T_449 = ~mtdata1_t_0[5]; // @[dec_tlu_ctl.scala 550:36]
  wire  _T_451 = _T_449 | i0_trigger_r[0]; // @[dec_tlu_ctl.scala 550:65]
  wire  _T_452 = i0_trigger_r[1] & _T_451; // @[dec_tlu_ctl.scala 550:33]
  wire  _T_457 = _T_449 | i0_trigger_r[1]; // @[dec_tlu_ctl.scala 551:65]
  wire  _T_458 = i0_trigger_r[0] & _T_457; // @[dec_tlu_ctl.scala 551:33]
  wire [3:0] i0_trigger_chain_masked_r = {_T_440,_T_446,_T_452,_T_458}; // @[Cat.scala 29:58]
  wire  i0_trigger_hit_raw_r = |i0_trigger_chain_masked_r; // @[dec_tlu_ctl.scala 555:62]
  wire  _T_619 = ~i0_trigger_hit_raw_r; // @[dec_tlu_ctl.scala 663:205]
  wire  _T_620 = _T_618 & _T_619; // @[dec_tlu_ctl.scala 663:202]
  wire  _T_592 = io_dec_tlu_i0_valid_r & _T_619; // @[dec_tlu_ctl.scala 651:52]
  wire  _T_593 = ~io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 651:75]
  wire  _T_594 = _T_593 & io_lsu_error_pkt_r_bits_single_ecc_error; // @[dec_tlu_ctl.scala 651:110]
  wire  lsu_i0_rfnpc_r = _T_592 & _T_594; // @[dec_tlu_ctl.scala 651:72]
  wire  _T_621 = ~lsu_i0_rfnpc_r; // @[dec_tlu_ctl.scala 663:226]
  wire  rfpc_i0_r = _T_620 & _T_621; // @[dec_tlu_ctl.scala 663:223]
  wire  _T_586 = ~io_dec_tlu_flush_lower_wb; // @[dec_tlu_ctl.scala 642:62]
  wire  lsu_exc_valid_r_raw = io_lsu_error_pkt_r_valid & _T_586; // @[dec_tlu_ctl.scala 642:60]
  wire  _T_587 = io_lsu_error_pkt_r_valid & lsu_exc_valid_r_raw; // @[dec_tlu_ctl.scala 644:45]
  wire  _T_589 = _T_587 & _T_619; // @[dec_tlu_ctl.scala 644:67]
  wire  _T_590 = ~rfpc_i0_r; // @[dec_tlu_ctl.scala 644:89]
  wire  lsu_exc_valid_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 644:87]
  wire  _T_606 = rfpc_i0_r | lsu_exc_valid_r; // @[dec_tlu_ctl.scala 657:43]
  wire  _T_696 = inst_acc_r_raw & _T_590; // @[dec_tlu_ctl.scala 713:38]
  wire  inst_acc_r = _T_696 & _T_619; // @[dec_tlu_ctl.scala 713:51]
  wire  _T_607 = _T_606 | inst_acc_r; // @[dec_tlu_ctl.scala 657:58]
  wire  _T_663 = ~io_dec_tlu_packet_r_legal; // @[dec_tlu_ctl.scala 705:23]
  wire  _T_664 = _T_663 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 705:52]
  wire  _T_666 = _T_664 & _T_619; // @[dec_tlu_ctl.scala 705:76]
  wire  illegal_r = _T_666 & _T_590; // @[dec_tlu_ctl.scala 705:96]
  wire  _T_608 = illegal_r & io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 657:84]
  wire  _T_609 = _T_607 | _T_608; // @[dec_tlu_ctl.scala 657:71]
  wire  tlu_i0_kill_writeb_r = _T_609 | i0_trigger_hit_raw_r; // @[dec_tlu_ctl.scala 657:109]
  reg  _T_52; // @[Reg.scala 27:20]
  wire  _T_50 = tlu_i0_kill_writeb_r ^ _T_52; // @[lib.scala 448:21]
  wire  _T_51 = |_T_50; // @[lib.scala 448:29]
  reg  internal_dbg_halt_mode_f2; // @[Reg.scala 27:20]
  wire  _T_53 = debug_mode_status ^ internal_dbg_halt_mode_f2; // @[lib.scala 448:21]
  wire  _T_54 = |_T_53; // @[lib.scala 448:29]
  reg  _T_59; // @[Reg.scala 27:20]
  wire  _T_57 = force_halt ^ _T_59; // @[lib.scala 448:21]
  wire  _T_58 = |_T_57; // @[lib.scala 448:29]
  wire  _T_60 = nmi_int_sync ^ nmi_int_delayed; // @[lib.scala 470:21]
  wire  _T_61 = |_T_60; // @[lib.scala 470:29]
  wire  _T_63 = nmi_int_detected ^ nmi_int_detected_f; // @[lib.scala 448:21]
  wire  _T_64 = |_T_63; // @[lib.scala 448:29]
  wire  _T_83 = nmi_lsu_detected & io_tlu_busbuff_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 362:49]
  wire  _T_86 = ~_T_80; // @[dec_tlu_ctl.scala 362:98]
  wire  _T_87 = _T_83 & _T_86; // @[dec_tlu_ctl.scala 362:95]
  reg  nmi_lsu_load_type_f; // @[Reg.scala 27:20]
  wire  _T_89 = nmi_lsu_load_type_f & _T_79; // @[dec_tlu_ctl.scala 362:162]
  wire  nmi_lsu_load_type = _T_87 | _T_89; // @[dec_tlu_ctl.scala 362:138]
  wire  _T_66 = nmi_lsu_load_type ^ nmi_lsu_load_type_f; // @[lib.scala 448:21]
  wire  _T_67 = |_T_66; // @[lib.scala 448:29]
  wire  _T_91 = nmi_lsu_detected & io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 363:49]
  wire  _T_95 = _T_91 & _T_86; // @[dec_tlu_ctl.scala 363:96]
  reg  nmi_lsu_store_type_f; // @[Reg.scala 27:20]
  wire  _T_97 = nmi_lsu_store_type_f & _T_79; // @[dec_tlu_ctl.scala 363:162]
  wire  nmi_lsu_store_type = _T_95 | _T_97; // @[dec_tlu_ctl.scala 363:138]
  wire  _T_69 = nmi_lsu_store_type ^ nmi_lsu_store_type_f; // @[lib.scala 448:21]
  wire  _T_70 = |_T_69; // @[lib.scala 448:29]
  wire  _T_103 = 1'h1 ^ reset_detect; // @[lib.scala 448:21]
  wire  _T_104 = |_T_103; // @[lib.scala 448:29]
  wire  _T_107 = |reset_delayed; // @[lib.scala 448:29]
  reg  mpc_debug_halt_req_sync_f; // @[Reg.scala 27:20]
  wire  _T_111 = mpc_debug_halt_req_sync ^ mpc_debug_halt_req_sync_f; // @[lib.scala 470:21]
  wire  _T_112 = |_T_111; // @[lib.scala 470:29]
  reg  mpc_debug_run_req_sync_f; // @[Reg.scala 27:20]
  wire  _T_114 = mpc_debug_run_req_sync ^ mpc_debug_run_req_sync_f; // @[lib.scala 470:21]
  wire  _T_115 = |_T_114; // @[lib.scala 470:29]
  wire  _T_144 = ~mpc_debug_halt_req_sync_f; // @[dec_tlu_ctl.scala 390:71]
  wire  mpc_debug_halt_req_sync_pulse = mpc_debug_halt_req_sync & _T_144; // @[dec_tlu_ctl.scala 390:69]
  wire  _T_146 = mpc_halt_state_f | mpc_debug_halt_req_sync_pulse; // @[dec_tlu_ctl.scala 393:48]
  wire  _T_149 = _T_146 | _T_189; // @[dec_tlu_ctl.scala 393:80]
  wire  _T_150 = ~mpc_debug_run_req_sync; // @[dec_tlu_ctl.scala 393:125]
  wire  mpc_halt_state_ns = _T_149 & _T_150; // @[dec_tlu_ctl.scala 393:123]
  wire  _T_118 = mpc_halt_state_ns ^ mpc_halt_state_f; // @[lib.scala 448:21]
  wire  _T_119 = |_T_118; // @[lib.scala 448:29]
  reg  mpc_run_state_f; // @[Reg.scala 27:20]
  wire  _T_145 = ~mpc_debug_run_req_sync_f; // @[dec_tlu_ctl.scala 391:70]
  wire  mpc_debug_run_req_sync_pulse = mpc_debug_run_req_sync & _T_145; // @[dec_tlu_ctl.scala 391:68]
  reg  mpc_debug_run_ack_f; // @[Reg.scala 27:20]
  wire  _T_152 = ~mpc_debug_run_ack_f; // @[dec_tlu_ctl.scala 394:80]
  wire  _T_153 = mpc_debug_run_req_sync_pulse & _T_152; // @[dec_tlu_ctl.scala 394:78]
  wire  _T_154 = mpc_run_state_f | _T_153; // @[dec_tlu_ctl.scala 394:46]
  wire  _T_155 = ~dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 394:133]
  wire  _T_156 = debug_mode_status & _T_155; // @[dec_tlu_ctl.scala 394:131]
  wire  mpc_run_state_ns = _T_154 & _T_156; // @[dec_tlu_ctl.scala 394:103]
  wire  _T_121 = mpc_run_state_ns ^ mpc_run_state_f; // @[lib.scala 448:21]
  wire  _T_122 = |_T_121; // @[lib.scala 448:29]
  wire  debug_brkpt_valid = ebreak_to_debug_mode_r_d1 | trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 404:59]
  reg  debug_brkpt_status_f; // @[Reg.scala 27:20]
  wire  _T_170 = debug_brkpt_valid | debug_brkpt_status_f; // @[dec_tlu_ctl.scala 405:53]
  wire  _T_172 = internal_dbg_halt_mode & _T_155; // @[dec_tlu_ctl.scala 405:103]
  wire  debug_brkpt_status_ns = _T_170 & _T_172; // @[dec_tlu_ctl.scala 405:77]
  wire  _T_124 = debug_brkpt_status_ns ^ debug_brkpt_status_f; // @[lib.scala 448:21]
  wire  _T_125 = |_T_124; // @[lib.scala 448:29]
  wire  _T_174 = mpc_halt_state_f & debug_mode_status; // @[dec_tlu_ctl.scala 408:51]
  wire  _T_175 = _T_174 & mpc_debug_halt_req_sync; // @[dec_tlu_ctl.scala 408:78]
  wire  mpc_debug_halt_ack_ns = _T_175 & core_empty; // @[dec_tlu_ctl.scala 408:104]
  reg  mpc_debug_halt_ack_f; // @[Reg.scala 27:20]
  wire  _T_127 = mpc_debug_halt_ack_ns ^ mpc_debug_halt_ack_f; // @[lib.scala 448:21]
  wire  _T_128 = |_T_127; // @[lib.scala 448:29]
  wire  _T_158 = dbg_halt_req_final | dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 397:70]
  wire  _T_159 = _T_158 | trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 397:96]
  wire  _T_160 = _T_159 | ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 397:121]
  wire  _T_161 = dbg_halt_state_f | _T_160; // @[dec_tlu_ctl.scala 397:48]
  wire  _T_162 = ~io_dbg_resume_req; // @[dec_tlu_ctl.scala 397:153]
  wire  dbg_halt_state_ns = _T_161 & _T_162; // @[dec_tlu_ctl.scala 397:151]
  wire  _T_177 = ~dbg_halt_state_ns; // @[dec_tlu_ctl.scala 409:59]
  wire  _T_178 = mpc_debug_run_req_sync & _T_177; // @[dec_tlu_ctl.scala 409:57]
  wire  _T_179 = ~mpc_debug_halt_req_sync; // @[dec_tlu_ctl.scala 409:80]
  wire  _T_180 = _T_178 & _T_179; // @[dec_tlu_ctl.scala 409:78]
  wire  _T_181 = mpc_debug_run_ack_f & mpc_debug_run_req_sync; // @[dec_tlu_ctl.scala 409:129]
  wire  mpc_debug_run_ack_ns = _T_180 | _T_181; // @[dec_tlu_ctl.scala 409:106]
  wire  _T_130 = mpc_debug_run_ack_ns ^ mpc_debug_run_ack_f; // @[lib.scala 448:21]
  wire  _T_131 = |_T_130; // @[lib.scala 448:29]
  wire  _T_134 = dbg_halt_state_ns ^ dbg_halt_state_f; // @[lib.scala 448:21]
  wire  _T_135 = |_T_134; // @[lib.scala 448:29]
  reg  dbg_run_state_f; // @[Reg.scala 27:20]
  wire  _T_164 = dbg_run_state_f | io_dbg_resume_req; // @[dec_tlu_ctl.scala 398:46]
  wire  dbg_run_state_ns = _T_164 & _T_156; // @[dec_tlu_ctl.scala 398:67]
  wire  _T_137 = dbg_run_state_ns ^ dbg_run_state_f; // @[lib.scala 448:21]
  wire  _T_138 = |_T_137; // @[lib.scala 448:29]
  reg  _T_143; // @[Reg.scala 27:20]
  wire  _T_141 = _T_1 ^ _T_143; // @[lib.scala 448:21]
  wire  _T_142 = |_T_141; // @[lib.scala 448:29]
  wire  dbg_halt_req_held_ns = _T_184 & csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 417:74]
  wire  _T_196 = mpc_run_state_ns & _T_177; // @[dec_tlu_ctl.scala 423:73]
  wire  _T_197 = ~mpc_halt_state_ns; // @[dec_tlu_ctl.scala 423:117]
  wire  _T_198 = dbg_run_state_ns & _T_197; // @[dec_tlu_ctl.scala 423:115]
  wire  _T_199 = _T_196 | _T_198; // @[dec_tlu_ctl.scala 423:95]
  wire  debug_resume_req = _T_243 & _T_199; // @[dec_tlu_ctl.scala 423:52]
  wire  _T_200 = debug_halt_req_f | pmu_fw_halt_req_f; // @[dec_tlu_ctl.scala 428:43]
  wire  synchronous_flush_r = int_exc_io_synchronous_flush_r; // @[dec_tlu_ctl.scala 807:43]
  wire  _T_201 = ~synchronous_flush_r; // @[dec_tlu_ctl.scala 428:66]
  wire  _T_202 = _T_200 & _T_201; // @[dec_tlu_ctl.scala 428:64]
  wire  _T_669 = io_dec_tlu_packet_r_pmu_i0_itype == 4'hc; // @[dec_tlu_ctl.scala 706:57]
  wire  _T_670 = _T_669 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 706:70]
  wire  _T_672 = _T_670 & _T_619; // @[dec_tlu_ctl.scala 706:94]
  wire  mret_r = _T_672 & _T_590; // @[dec_tlu_ctl.scala 706:114]
  wire  _T_203 = ~mret_r; // @[dec_tlu_ctl.scala 428:89]
  wire  _T_204 = _T_202 & _T_203; // @[dec_tlu_ctl.scala 428:87]
  wire  _T_206 = _T_204 & _T_362; // @[dec_tlu_ctl.scala 428:97]
  wire  _T_207 = ~dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 428:115]
  wire  _T_208 = _T_206 & _T_207; // @[dec_tlu_ctl.scala 428:113]
  wire  take_reset = int_exc_io_take_reset; // @[dec_tlu_ctl.scala 805:43]
  wire  _T_209 = ~take_reset; // @[dec_tlu_ctl.scala 428:145]
  wire  take_halt = _T_208 & _T_209; // @[dec_tlu_ctl.scala 428:143]
  wire  _T_248 = debug_resume_req_f & dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 455:49]
  wire  resume_ack_ns = _T_248 & dbg_run_state_ns; // @[dec_tlu_ctl.scala 455:68]
  wire  _T_249 = ~io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 457:61]
  wire  _T_250 = io_dec_tlu_i0_valid_r & _T_249; // @[dec_tlu_ctl.scala 457:59]
  wire  _T_252 = _T_250 & dcsr[2]; // @[dec_tlu_ctl.scala 457:84]
  wire  dcsr_single_step_done = _T_252 & _T_590; // @[dec_tlu_ctl.scala 457:102]
  wire  _T_463 = mtdata1_t_3[6] & mtdata1_t_3[9]; // @[dec_tlu_ctl.scala 561:69]
  wire  _T_466 = mtdata1_t_2[6] & mtdata1_t_2[9]; // @[dec_tlu_ctl.scala 562:46]
  wire  _T_469 = _T_466 & _T_437; // @[dec_tlu_ctl.scala 562:76]
  wire  _T_472 = mtdata1_t_1[6] & mtdata1_t_1[9]; // @[dec_tlu_ctl.scala 563:46]
  wire  _T_475 = mtdata1_t_0[6] & mtdata1_t_0[9]; // @[dec_tlu_ctl.scala 564:46]
  wire  _T_478 = _T_475 & _T_449; // @[dec_tlu_ctl.scala 564:76]
  wire [3:0] trigger_action = {_T_463,_T_469,_T_472,_T_478}; // @[Cat.scala 29:58]
  wire [3:0] _T_493 = i0_trigger_chain_masked_r & trigger_action; // @[dec_tlu_ctl.scala 570:62]
  wire  i0_trigger_action_r = |_T_493; // @[dec_tlu_ctl.scala 570:80]
  wire  trigger_hit_dmode_r = i0_trigger_hit_raw_r & i0_trigger_action_r; // @[dec_tlu_ctl.scala 572:50]
  wire  _T_699 = io_dec_tlu_packet_r_pmu_i0_itype == 4'h8; // @[dec_tlu_ctl.scala 716:69]
  wire  _T_700 = _T_699 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 716:82]
  wire  _T_702 = _T_700 & _T_619; // @[dec_tlu_ctl.scala 716:106]
  wire  _T_704 = _T_702 & dcsr[15]; // @[dec_tlu_ctl.scala 716:126]
  wire  ebreak_to_debug_mode_r = _T_704 & _T_590; // @[dec_tlu_ctl.scala 716:147]
  wire  _T_258 = trigger_hit_dmode_r | ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 464:57]
  reg  request_debug_mode_r_d1; // @[Reg.scala 27:20]
  wire  _T_260 = request_debug_mode_r_d1 & _T_586; // @[dec_tlu_ctl.scala 464:110]
  wire  request_debug_mode_r = _T_258 | _T_260; // @[dec_tlu_ctl.scala 464:83]
  reg  request_debug_mode_done_f; // @[Reg.scala 27:20]
  wire  _T_261 = request_debug_mode_r_d1 | request_debug_mode_done_f; // @[dec_tlu_ctl.scala 466:64]
  wire  request_debug_mode_done = _T_261 & _T_214; // @[dec_tlu_ctl.scala 466:93]
  wire  _T_264 = io_tlu_ifc_dec_tlu_flush_noredir_wb ^ dec_tlu_flush_noredir_r_d1; // @[lib.scala 470:21]
  wire  _T_265 = |_T_264; // @[lib.scala 470:29]
  wire  _T_268 = halt_taken ^ halt_taken_f; // @[lib.scala 448:21]
  wire  _T_269 = |_T_268; // @[lib.scala 448:29]
  wire  _T_272 = io_lsu_idle_any ^ lsu_idle_any_f; // @[lib.scala 448:21]
  wire  _T_273 = |_T_272; // @[lib.scala 448:29]
  wire  _T_276 = io_tlu_mem_ifu_miss_state_idle ^ ifu_miss_state_idle_f; // @[lib.scala 470:21]
  wire  _T_277 = |_T_276; // @[lib.scala 470:29]
  wire  _T_280 = dbg_tlu_halted ^ dbg_tlu_halted_f; // @[lib.scala 448:21]
  wire  _T_281 = |_T_280; // @[lib.scala 448:29]
  reg  _T_286; // @[Reg.scala 27:20]
  wire  _T_284 = resume_ack_ns ^ _T_286; // @[lib.scala 448:21]
  wire  _T_285 = |_T_284; // @[lib.scala 448:29]
  wire  _T_288 = debug_halt_req_ns ^ debug_halt_req_f; // @[lib.scala 448:21]
  wire  _T_289 = |_T_288; // @[lib.scala 448:29]
  wire  _T_292 = debug_resume_req ^ debug_resume_req_f_raw; // @[lib.scala 448:21]
  wire  _T_293 = |_T_292; // @[lib.scala 448:29]
  wire  _T_296 = trigger_hit_dmode_r ^ trigger_hit_dmode_r_d1; // @[lib.scala 448:21]
  wire  _T_297 = |_T_296; // @[lib.scala 448:29]
  wire  _T_300 = dcsr_single_step_done ^ dcsr_single_step_done_f; // @[lib.scala 448:21]
  wire  _T_301 = |_T_300; // @[lib.scala 448:29]
  wire  _T_304 = debug_halt_req ^ debug_halt_req_d1; // @[lib.scala 448:21]
  wire  _T_305 = |_T_304; // @[lib.scala 448:29]
  reg  dec_tlu_wr_pause_r_d1; // @[Reg.scala 27:20]
  wire  _T_307 = io_dec_tlu_wr_pause_r ^ dec_tlu_wr_pause_r_d1; // @[lib.scala 448:21]
  wire  _T_308 = |_T_307; // @[lib.scala 448:29]
  wire  _T_310 = io_dec_pause_state ^ dec_pause_state_f; // @[lib.scala 448:21]
  wire  _T_311 = |_T_310; // @[lib.scala 448:29]
  wire  _T_314 = request_debug_mode_r ^ request_debug_mode_r_d1; // @[lib.scala 448:21]
  wire  _T_315 = |_T_314; // @[lib.scala 448:29]
  wire  _T_318 = request_debug_mode_done ^ request_debug_mode_done_f; // @[lib.scala 448:21]
  wire  _T_319 = |_T_318; // @[lib.scala 448:29]
  wire  _T_322 = dcsr_single_step_running ^ dcsr_single_step_running_f; // @[lib.scala 448:21]
  wire  _T_323 = |_T_322; // @[lib.scala 448:29]
  wire  _T_326 = io_dec_tlu_flush_pause_r ^ dec_tlu_flush_pause_r_d1; // @[lib.scala 448:21]
  wire  _T_327 = |_T_326; // @[lib.scala 448:29]
  wire  _T_330 = dbg_halt_req_held_ns ^ dbg_halt_req_held; // @[lib.scala 448:21]
  wire  _T_331 = |_T_330; // @[lib.scala 448:29]
  wire  _T_675 = io_dec_tlu_packet_r_fence_i & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 708:55]
  wire  _T_677 = _T_675 & _T_619; // @[dec_tlu_ctl.scala 708:79]
  wire  fence_i_r = _T_677 & _T_590; // @[dec_tlu_ctl.scala 708:100]
  wire  _T_335 = fence_i_r & internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 497:71]
  wire  _T_336 = take_halt | _T_335; // @[dec_tlu_ctl.scala 497:58]
  wire  _T_337 = _T_336 | io_dec_tlu_flush_pause_r; // @[dec_tlu_ctl.scala 497:97]
  wire  _T_338 = i0_trigger_hit_raw_r & trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 497:144]
  wire  _T_339 = _T_337 | _T_338; // @[dec_tlu_ctl.scala 497:124]
  wire  take_ext_int_start = int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 788:43]
  wire  _T_341 = ~interrupt_valid_r; // @[dec_tlu_ctl.scala 502:61]
  wire  _T_342 = dec_tlu_wr_pause_r_d1 & _T_341; // @[dec_tlu_ctl.scala 502:59]
  wire  _T_343 = ~take_ext_int_start; // @[dec_tlu_ctl.scala 502:82]
  wire  _T_365 = io_tlu_exu_dec_tlu_flush_lower_r & dcsr[2]; // @[dec_tlu_ctl.scala 506:82]
  wire  _T_366 = io_dec_tlu_resume_ack | dcsr_single_step_running; // @[dec_tlu_ctl.scala 506:125]
  wire  _T_367 = _T_365 & _T_366; // @[dec_tlu_ctl.scala 506:100]
  wire  _T_368 = ~io_tlu_ifc_dec_tlu_flush_noredir_wb; // @[dec_tlu_ctl.scala 506:155]
  wire  _T_481 = |i0_trigger_r; // @[dec_tlu_ctl.scala 567:59]
  wire  _T_483 = _T_481 & _T_590; // @[dec_tlu_ctl.scala 567:63]
  wire [3:0] _T_485 = _T_483 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_492 = {i0_trigger_chain_masked_r[3],i0_trigger_r[2],i0_trigger_chain_masked_r[1],i0_trigger_r[0]}; // @[Cat.scala 29:58]
  wire  _T_495 = ~trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 574:60]
  wire  _T_496 = ~io_dec_tlu_debug_mode; // @[dec_tlu_ctl.scala 601:62]
  wire  _T_497 = i_cpu_halt_req_sync & _T_496; // @[dec_tlu_ctl.scala 601:60]
  wire  i_cpu_halt_req_sync_qual = _T_497 & _T_680; // @[dec_tlu_ctl.scala 601:85]
  wire  _T_500 = i_cpu_run_req_sync & _T_496; // @[dec_tlu_ctl.scala 602:58]
  wire  _T_501 = _T_500 & pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 602:83]
  wire  i_cpu_run_req_sync_qual = _T_501 & _T_680; // @[dec_tlu_ctl.scala 602:105]
  wire  _T_503 = i_cpu_halt_req_sync_qual ^ i_cpu_halt_req_d1; // @[lib.scala 448:21]
  wire  _T_504 = |_T_503; // @[lib.scala 448:29]
  wire  _T_506 = i_cpu_run_req_sync_qual ^ i_cpu_run_req_d1_raw; // @[lib.scala 448:21]
  wire  _T_507 = |_T_506; // @[lib.scala 448:29]
  wire  _T_563 = ~i_cpu_run_req_d1; // @[dec_tlu_ctl.scala 626:51]
  wire  _T_564 = pmu_fw_tlu_halted_f & _T_563; // @[dec_tlu_ctl.scala 626:49]
  wire  _T_566 = io_o_cpu_halt_status & _T_563; // @[dec_tlu_ctl.scala 626:94]
  wire  _T_568 = _T_566 & _T_682; // @[dec_tlu_ctl.scala 626:114]
  wire  cpu_halt_status = _T_564 | _T_568; // @[dec_tlu_ctl.scala 626:70]
  reg  _T_512; // @[Reg.scala 27:20]
  wire  _T_510 = cpu_halt_status ^ _T_512; // @[lib.scala 448:21]
  wire  _T_511 = |_T_510; // @[lib.scala 448:29]
  wire  _T_560 = i_cpu_halt_req_d1 & pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 625:44]
  wire  _T_561 = io_o_cpu_halt_ack & i_cpu_halt_req_sync; // @[dec_tlu_ctl.scala 625:88]
  wire  cpu_halt_ack = _T_560 | _T_561; // @[dec_tlu_ctl.scala 625:67]
  reg  _T_516; // @[Reg.scala 27:20]
  wire  _T_514 = cpu_halt_ack ^ _T_516; // @[lib.scala 448:21]
  wire  _T_515 = |_T_514; // @[lib.scala 448:29]
  wire  _T_571 = _T_216 & i_cpu_run_req_sync; // @[dec_tlu_ctl.scala 627:46]
  wire  _T_572 = io_o_cpu_halt_status & i_cpu_run_req_d1_raw; // @[dec_tlu_ctl.scala 627:92]
  wire  _T_573 = _T_571 | _T_572; // @[dec_tlu_ctl.scala 627:68]
  wire  _T_574 = io_o_cpu_run_ack & i_cpu_run_req_sync; // @[dec_tlu_ctl.scala 627:136]
  wire  cpu_run_ack = _T_573 | _T_574; // @[dec_tlu_ctl.scala 627:116]
  reg  _T_520; // @[Reg.scala 27:20]
  wire  _T_518 = cpu_run_ack ^ _T_520; // @[lib.scala 448:21]
  wire  _T_519 = |_T_518; // @[lib.scala 448:29]
  wire  ext_halt_pulse = i_cpu_halt_req_sync_qual & _T_583; // @[dec_tlu_ctl.scala 617:55]
  wire  fw_halt_req = csr_io_fw_halt_req; // @[dec_tlu_ctl.scala 1011:37]
  wire  enter_pmu_fw_halt_req = ext_halt_pulse | fw_halt_req; // @[dec_tlu_ctl.scala 618:53]
  wire  _T_551 = pmu_fw_halt_req_f & core_empty; // @[dec_tlu_ctl.scala 623:50]
  wire  _T_552 = _T_551 & halt_taken; // @[dec_tlu_ctl.scala 623:63]
  wire  _T_553 = ~enter_debug_halt_req; // @[dec_tlu_ctl.scala 623:78]
  wire  _T_554 = _T_552 & _T_553; // @[dec_tlu_ctl.scala 623:76]
  wire  _T_557 = _T_554 | _T_564; // @[dec_tlu_ctl.scala 623:101]
  wire  pmu_fw_tlu_halted = _T_557 & _T_358; // @[dec_tlu_ctl.scala 623:146]
  wire  _T_541 = ~pmu_fw_tlu_halted; // @[dec_tlu_ctl.scala 619:77]
  wire  _T_542 = pmu_fw_halt_req_f & _T_541; // @[dec_tlu_ctl.scala 619:75]
  wire  _T_543 = enter_pmu_fw_halt_req | _T_542; // @[dec_tlu_ctl.scala 619:54]
  wire  pmu_fw_halt_req_ns = _T_543 & _T_358; // @[dec_tlu_ctl.scala 619:98]
  wire  _T_547 = internal_pmu_fw_halt_mode_f & _T_563; // @[dec_tlu_ctl.scala 620:88]
  wire  _T_549 = _T_547 & _T_358; // @[dec_tlu_ctl.scala 620:108]
  wire  internal_pmu_fw_halt_mode = pmu_fw_halt_req_ns | _T_549; // @[dec_tlu_ctl.scala 620:57]
  wire  _T_521 = internal_pmu_fw_halt_mode ^ internal_pmu_fw_halt_mode_f; // @[lib.scala 448:21]
  wire  _T_522 = |_T_521; // @[lib.scala 448:29]
  wire  _T_525 = pmu_fw_halt_req_ns ^ pmu_fw_halt_req_f; // @[lib.scala 448:21]
  wire  _T_526 = |_T_525; // @[lib.scala 448:29]
  wire  _T_529 = pmu_fw_tlu_halted ^ pmu_fw_tlu_halted_f; // @[lib.scala 448:21]
  wire  _T_530 = |_T_529; // @[lib.scala 448:29]
  wire  int_timer0_int_hold = int_exc_io_int_timer0_int_hold; // @[dec_tlu_ctl.scala 785:43]
  wire  _T_533 = int_timer0_int_hold ^ int_timer0_int_hold_f; // @[lib.scala 448:21]
  wire  _T_534 = |_T_533; // @[lib.scala 448:29]
  wire  int_timer1_int_hold = int_exc_io_int_timer1_int_hold; // @[dec_tlu_ctl.scala 786:43]
  wire  _T_537 = int_timer1_int_hold ^ int_timer1_int_hold_f; // @[lib.scala 448:21]
  wire  _T_538 = |_T_537; // @[lib.scala 448:29]
  wire  _T_596 = io_dec_tlu_i0_valid_r & _T_590; // @[dec_tlu_ctl.scala 654:55]
  wire  _T_597 = ~lsu_exc_valid_r; // @[dec_tlu_ctl.scala 654:70]
  wire  _T_598 = _T_596 & _T_597; // @[dec_tlu_ctl.scala 654:68]
  wire  _T_599 = ~inst_acc_r; // @[dec_tlu_ctl.scala 654:87]
  wire  _T_600 = _T_598 & _T_599; // @[dec_tlu_ctl.scala 654:84]
  wire  _T_602 = _T_600 & _T_249; // @[dec_tlu_ctl.scala 654:99]
  wire  _T_603 = ~request_debug_mode_r_d1; // @[dec_tlu_ctl.scala 654:126]
  wire  _T_604 = _T_602 & _T_603; // @[dec_tlu_ctl.scala 654:124]
  wire  tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 654:151]
  wire  _T_626 = tlu_i0_commit_cmt & iccm_repair_state_d1; // @[dec_tlu_ctl.scala 672:57]
  wire  _T_653 = ~dcsr[15]; // @[dec_tlu_ctl.scala 703:116]
  wire  _T_654 = _T_702 & _T_653; // @[dec_tlu_ctl.scala 703:114]
  wire  ebreak_r = _T_654 & _T_590; // @[dec_tlu_ctl.scala 703:136]
  wire  _T_657 = io_dec_tlu_packet_r_pmu_i0_itype == 4'h9; // @[dec_tlu_ctl.scala 704:57]
  wire  _T_658 = _T_657 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 704:70]
  wire  _T_660 = _T_658 & _T_619; // @[dec_tlu_ctl.scala 704:94]
  wire  ecall_r = _T_660 & _T_590; // @[dec_tlu_ctl.scala 704:114]
  wire  _T_627 = ebreak_r | ecall_r; // @[dec_tlu_ctl.scala 672:93]
  wire  _T_628 = _T_627 | mret_r; // @[dec_tlu_ctl.scala 672:103]
  wire  _T_629 = _T_628 | take_reset; // @[dec_tlu_ctl.scala 672:112]
  wire  _T_630 = _T_629 | illegal_r; // @[dec_tlu_ctl.scala 672:125]
  wire  _T_631 = io_dec_csr_wraddr_r == 12'h7c2; // @[dec_tlu_ctl.scala 672:181]
  wire  _T_632 = dec_csr_wen_r_mod & _T_631; // @[dec_tlu_ctl.scala 672:158]
  wire  _T_633 = _T_630 | _T_632; // @[dec_tlu_ctl.scala 672:137]
  wire  _T_634 = ~_T_633; // @[dec_tlu_ctl.scala 672:82]
  wire  _T_635 = io_tlu_exu_exu_i0_br_error_r & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 679:69]
  wire  _T_638 = io_tlu_exu_exu_i0_br_start_error_r & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 680:81]
  wire  _T_641 = io_tlu_exu_exu_i0_br_valid_r & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 681:65]
  wire  _T_643 = _T_641 & _T_611; // @[dec_tlu_ctl.scala 681:89]
  wire  _T_644 = ~io_tlu_exu_exu_i0_br_mp_r; // @[dec_tlu_ctl.scala 681:116]
  wire  _T_645 = ~io_tlu_exu_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 681:145]
  wire  _T_646 = _T_644 | _T_645; // @[dec_tlu_ctl.scala 681:143]
  wire  csr_pkt_presync = csr_read_io_csr_pkt_presync; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_708 = csr_pkt_presync & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 1021:50]
  wire  _T_709 = ~io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 1021:75]
  wire  csr_pkt_postsync = csr_read_io_csr_pkt_postsync; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  csr_pkt_csr_dcsr = csr_read_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  csr_pkt_csr_dpc = csr_read_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_718 = csr_pkt_csr_dcsr | csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 1026:63]
  wire  csr_pkt_csr_dmst = csr_read_io_csr_pkt_csr_dmst; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_719 = _T_718 | csr_pkt_csr_dmst; // @[dec_tlu_ctl.scala 1026:81]
  wire  csr_pkt_csr_dicawics = csr_read_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_720 = _T_719 | csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 1026:100]
  wire  csr_pkt_csr_dicad0 = csr_read_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_721 = _T_720 | csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 1026:123]
  wire  csr_pkt_csr_dicad0h = csr_read_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_722 = _T_721 | csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 1026:144]
  wire  csr_pkt_csr_dicad1 = csr_read_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_723 = _T_722 | csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 1026:166]
  wire  csr_pkt_csr_dicago = csr_read_io_csr_pkt_csr_dicago; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_724 = _T_723 | csr_pkt_csr_dicago; // @[dec_tlu_ctl.scala 1026:187]
  wire  _T_725 = ~_T_724; // @[dec_tlu_ctl.scala 1026:44]
  wire  _T_726 = _T_725 | dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 1026:209]
  wire  csr_pkt_legal = csr_read_io_csr_pkt_legal; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_727 = csr_pkt_legal & _T_726; // @[dec_tlu_ctl.scala 1026:41]
  wire  fast_int_meicpct = int_exc_io_fast_int_meicpct; // @[dec_tlu_ctl.scala 798:43]
  wire  _T_728 = ~fast_int_meicpct; // @[dec_tlu_ctl.scala 1026:231]
  wire  valid_csr = _T_727 & _T_728; // @[dec_tlu_ctl.scala 1026:229]
  wire  _T_731 = io_dec_csr_any_unq_d & valid_csr; // @[dec_tlu_ctl.scala 1028:54]
  wire  csr_pkt_csr_mvendorid = csr_read_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  csr_pkt_csr_marchid = csr_read_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_732 = csr_pkt_csr_mvendorid | csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 1028:115]
  wire  csr_pkt_csr_mimpid = csr_read_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_733 = _T_732 | csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 1028:137]
  wire  csr_pkt_csr_mhartid = csr_read_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_734 = _T_733 | csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 1028:158]
  wire  csr_pkt_csr_mdseac = csr_read_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_735 = _T_734 | csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 1028:180]
  wire  csr_pkt_csr_meihap = csr_read_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_736 = _T_735 | csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 1028:201]
  wire  _T_737 = io_dec_csr_wen_unq_d & _T_736; // @[dec_tlu_ctl.scala 1028:90]
  wire  _T_738 = ~_T_737; // @[dec_tlu_ctl.scala 1028:67]
  int_exc int_exc ( // @[dec_tlu_ctl.scala 282:29]
    .clock(int_exc_clock),
    .reset(int_exc_reset),
    .io_mhwakeup_ready(int_exc_io_mhwakeup_ready),
    .io_ext_int_ready(int_exc_io_ext_int_ready),
    .io_ce_int_ready(int_exc_io_ce_int_ready),
    .io_soft_int_ready(int_exc_io_soft_int_ready),
    .io_timer_int_ready(int_exc_io_timer_int_ready),
    .io_int_timer0_int_hold(int_exc_io_int_timer0_int_hold),
    .io_int_timer1_int_hold(int_exc_io_int_timer1_int_hold),
    .io_internal_dbg_halt_timers(int_exc_io_internal_dbg_halt_timers),
    .io_take_ext_int_start(int_exc_io_take_ext_int_start),
    .io_ext_int_freeze_d1(int_exc_io_ext_int_freeze_d1),
    .io_take_ext_int_start_d1(int_exc_io_take_ext_int_start_d1),
    .io_take_ext_int_start_d2(int_exc_io_take_ext_int_start_d2),
    .io_take_ext_int_start_d3(int_exc_io_take_ext_int_start_d3),
    .io_ext_int_freeze(int_exc_io_ext_int_freeze),
    .io_take_ext_int(int_exc_io_take_ext_int),
    .io_fast_int_meicpct(int_exc_io_fast_int_meicpct),
    .io_ignore_ext_int_due_to_lsu_stall(int_exc_io_ignore_ext_int_due_to_lsu_stall),
    .io_take_ce_int(int_exc_io_take_ce_int),
    .io_take_soft_int(int_exc_io_take_soft_int),
    .io_take_timer_int(int_exc_io_take_timer_int),
    .io_take_int_timer0_int(int_exc_io_take_int_timer0_int),
    .io_take_int_timer1_int(int_exc_io_take_int_timer1_int),
    .io_take_reset(int_exc_io_take_reset),
    .io_take_nmi(int_exc_io_take_nmi),
    .io_synchronous_flush_r(int_exc_io_synchronous_flush_r),
    .io_tlu_flush_lower_r(int_exc_io_tlu_flush_lower_r),
    .io_dec_tlu_flush_lower_wb(int_exc_io_dec_tlu_flush_lower_wb),
    .io_dec_tlu_flush_lower_r(int_exc_io_dec_tlu_flush_lower_r),
    .io_dec_tlu_flush_path_r(int_exc_io_dec_tlu_flush_path_r),
    .io_interrupt_valid_r_d1(int_exc_io_interrupt_valid_r_d1),
    .io_i0_exception_valid_r_d1(int_exc_io_i0_exception_valid_r_d1),
    .io_exc_or_int_valid_r_d1(int_exc_io_exc_or_int_valid_r_d1),
    .io_exc_cause_wb(int_exc_io_exc_cause_wb),
    .io_i0_valid_wb(int_exc_io_i0_valid_wb),
    .io_trigger_hit_r_d1(int_exc_io_trigger_hit_r_d1),
    .io_take_nmi_r_d1(int_exc_io_take_nmi_r_d1),
    .io_interrupt_valid_r(int_exc_io_interrupt_valid_r),
    .io_exc_cause_r(int_exc_io_exc_cause_r),
    .io_i0_exception_valid_r(int_exc_io_i0_exception_valid_r),
    .io_tlu_flush_path_r_d1(int_exc_io_tlu_flush_path_r_d1),
    .io_exc_or_int_valid_r(int_exc_io_exc_or_int_valid_r),
    .io_dec_csr_stall_int_ff(int_exc_io_dec_csr_stall_int_ff),
    .io_mstatus_mie_ns(int_exc_io_mstatus_mie_ns),
    .io_mip(int_exc_io_mip),
    .io_mie_ns(int_exc_io_mie_ns),
    .io_mret_r(int_exc_io_mret_r),
    .io_pmu_fw_tlu_halted_f(int_exc_io_pmu_fw_tlu_halted_f),
    .io_int_timer0_int_hold_f(int_exc_io_int_timer0_int_hold_f),
    .io_int_timer1_int_hold_f(int_exc_io_int_timer1_int_hold_f),
    .io_internal_dbg_halt_mode_f(int_exc_io_internal_dbg_halt_mode_f),
    .io_dcsr_single_step_running(int_exc_io_dcsr_single_step_running),
    .io_internal_dbg_halt_mode(int_exc_io_internal_dbg_halt_mode),
    .io_dec_tlu_i0_valid_r(int_exc_io_dec_tlu_i0_valid_r),
    .io_internal_pmu_fw_halt_mode(int_exc_io_internal_pmu_fw_halt_mode),
    .io_i_cpu_halt_req_d1(int_exc_io_i_cpu_halt_req_d1),
    .io_ebreak_to_debug_mode_r(int_exc_io_ebreak_to_debug_mode_r),
    .io_lsu_fir_error(int_exc_io_lsu_fir_error),
    .io_csr_pkt_csr_meicpct(int_exc_io_csr_pkt_csr_meicpct),
    .io_dec_csr_any_unq_d(int_exc_io_dec_csr_any_unq_d),
    .io_lsu_fastint_stall_any(int_exc_io_lsu_fastint_stall_any),
    .io_reset_delayed(int_exc_io_reset_delayed),
    .io_mpc_reset_run_req(int_exc_io_mpc_reset_run_req),
    .io_nmi_int_detected(int_exc_io_nmi_int_detected),
    .io_dcsr_single_step_running_f(int_exc_io_dcsr_single_step_running_f),
    .io_dcsr_single_step_done_f(int_exc_io_dcsr_single_step_done_f),
    .io_dcsr(int_exc_io_dcsr),
    .io_mtvec(int_exc_io_mtvec),
    .io_tlu_i0_commit_cmt(int_exc_io_tlu_i0_commit_cmt),
    .io_i0_trigger_hit_r(int_exc_io_i0_trigger_hit_r),
    .io_pause_expired_r(int_exc_io_pause_expired_r),
    .io_nmi_vec(int_exc_io_nmi_vec),
    .io_lsu_i0_rfnpc_r(int_exc_io_lsu_i0_rfnpc_r),
    .io_fence_i_r(int_exc_io_fence_i_r),
    .io_iccm_repair_state_rfnpc(int_exc_io_iccm_repair_state_rfnpc),
    .io_i_cpu_run_req_d1(int_exc_io_i_cpu_run_req_d1),
    .io_rfpc_i0_r(int_exc_io_rfpc_i0_r),
    .io_lsu_exc_valid_r(int_exc_io_lsu_exc_valid_r),
    .io_trigger_hit_dmode_r(int_exc_io_trigger_hit_dmode_r),
    .io_take_halt(int_exc_io_take_halt),
    .io_rst_vec(int_exc_io_rst_vec),
    .io_lsu_fir_addr(int_exc_io_lsu_fir_addr),
    .io_dec_tlu_i0_pc_r(int_exc_io_dec_tlu_i0_pc_r),
    .io_npc_r(int_exc_io_npc_r),
    .io_mepc(int_exc_io_mepc),
    .io_debug_resume_req_f(int_exc_io_debug_resume_req_f),
    .io_dpc(int_exc_io_dpc),
    .io_npc_r_d1(int_exc_io_npc_r_d1),
    .io_tlu_flush_lower_r_d1(int_exc_io_tlu_flush_lower_r_d1),
    .io_dec_tlu_dbg_halted(int_exc_io_dec_tlu_dbg_halted),
    .io_ebreak_r(int_exc_io_ebreak_r),
    .io_ecall_r(int_exc_io_ecall_r),
    .io_illegal_r(int_exc_io_illegal_r),
    .io_inst_acc_r(int_exc_io_inst_acc_r),
    .io_lsu_i0_exc_r(int_exc_io_lsu_i0_exc_r),
    .io_lsu_error_pkt_r_bits_inst_type(int_exc_io_lsu_error_pkt_r_bits_inst_type),
    .io_lsu_error_pkt_r_bits_exc_type(int_exc_io_lsu_error_pkt_r_bits_exc_type),
    .io_dec_tlu_wr_pause_r_d1(int_exc_io_dec_tlu_wr_pause_r_d1)
  );
  csr_tlu csr ( // @[dec_tlu_ctl.scala 283:23]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_free_l2clk(csr_io_free_l2clk),
    .io_free_clk(csr_io_free_clk),
    .io_dec_csr_wrdata_r(csr_io_dec_csr_wrdata_r),
    .io_dec_csr_wraddr_r(csr_io_dec_csr_wraddr_r),
    .io_dec_csr_rdaddr_d(csr_io_dec_csr_rdaddr_d),
    .io_dec_csr_wen_unq_d(csr_io_dec_csr_wen_unq_d),
    .io_dec_i0_decode_d(csr_io_dec_i0_decode_d),
    .io_dec_tlu_ic_diag_pkt_icache_wrdata(csr_io_dec_tlu_ic_diag_pkt_icache_wrdata),
    .io_dec_tlu_ic_diag_pkt_icache_dicawics(csr_io_dec_tlu_ic_diag_pkt_icache_dicawics),
    .io_dec_tlu_ic_diag_pkt_icache_rd_valid(csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid),
    .io_dec_tlu_ic_diag_pkt_icache_wr_valid(csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid),
    .io_ifu_ic_debug_rd_data_valid(csr_io_ifu_ic_debug_rd_data_valid),
    .io_trigger_pkt_any_0_select(csr_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_pkt(csr_io_trigger_pkt_any_0_match_pkt),
    .io_trigger_pkt_any_0_store(csr_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(csr_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_execute(csr_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(csr_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(csr_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(csr_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_pkt(csr_io_trigger_pkt_any_1_match_pkt),
    .io_trigger_pkt_any_1_store(csr_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(csr_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_execute(csr_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(csr_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(csr_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(csr_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_pkt(csr_io_trigger_pkt_any_2_match_pkt),
    .io_trigger_pkt_any_2_store(csr_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(csr_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_execute(csr_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(csr_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(csr_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(csr_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_pkt(csr_io_trigger_pkt_any_3_match_pkt),
    .io_trigger_pkt_any_3_store(csr_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(csr_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_execute(csr_io_trigger_pkt_any_3_execute),
    .io_trigger_pkt_any_3_m(csr_io_trigger_pkt_any_3_m),
    .io_trigger_pkt_any_3_tdata2(csr_io_trigger_pkt_any_3_tdata2),
    .io_ifu_pmu_bus_trxn(csr_io_ifu_pmu_bus_trxn),
    .io_dma_iccm_stall_any(csr_io_dma_iccm_stall_any),
    .io_dma_dccm_stall_any(csr_io_dma_dccm_stall_any),
    .io_lsu_store_stall_any(csr_io_lsu_store_stall_any),
    .io_dec_pmu_presync_stall(csr_io_dec_pmu_presync_stall),
    .io_dec_pmu_postsync_stall(csr_io_dec_pmu_postsync_stall),
    .io_dec_pmu_decode_stall(csr_io_dec_pmu_decode_stall),
    .io_ifu_pmu_fetch_stall(csr_io_ifu_pmu_fetch_stall),
    .io_dec_tlu_packet_r_icaf_type(csr_io_dec_tlu_packet_r_icaf_type),
    .io_dec_tlu_packet_r_pmu_i0_itype(csr_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(csr_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(csr_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(csr_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_exu_pmu_i0_br_ataken(csr_io_exu_pmu_i0_br_ataken),
    .io_exu_pmu_i0_br_misp(csr_io_exu_pmu_i0_br_misp),
    .io_dec_pmu_instr_decoded(csr_io_dec_pmu_instr_decoded),
    .io_ifu_pmu_instr_aligned(csr_io_ifu_pmu_instr_aligned),
    .io_exu_pmu_i0_pc4(csr_io_exu_pmu_i0_pc4),
    .io_ifu_pmu_ic_miss(csr_io_ifu_pmu_ic_miss),
    .io_ifu_pmu_ic_hit(csr_io_ifu_pmu_ic_hit),
    .io_dec_tlu_int_valid_wb1(csr_io_dec_tlu_int_valid_wb1),
    .io_dec_tlu_i0_exc_valid_wb1(csr_io_dec_tlu_i0_exc_valid_wb1),
    .io_dec_tlu_i0_valid_wb1(csr_io_dec_tlu_i0_valid_wb1),
    .io_dec_csr_wen_r(csr_io_dec_csr_wen_r),
    .io_dec_tlu_mtval_wb1(csr_io_dec_tlu_mtval_wb1),
    .io_dec_tlu_exc_cause_wb1(csr_io_dec_tlu_exc_cause_wb1),
    .io_dec_tlu_perfcnt0(csr_io_dec_tlu_perfcnt0),
    .io_dec_tlu_perfcnt1(csr_io_dec_tlu_perfcnt1),
    .io_dec_tlu_perfcnt2(csr_io_dec_tlu_perfcnt2),
    .io_dec_tlu_perfcnt3(csr_io_dec_tlu_perfcnt3),
    .io_dec_tlu_dbg_halted(csr_io_dec_tlu_dbg_halted),
    .io_dma_pmu_dccm_write(csr_io_dma_pmu_dccm_write),
    .io_dma_pmu_dccm_read(csr_io_dma_pmu_dccm_read),
    .io_dma_pmu_any_write(csr_io_dma_pmu_any_write),
    .io_dma_pmu_any_read(csr_io_dma_pmu_any_read),
    .io_lsu_pmu_bus_busy(csr_io_lsu_pmu_bus_busy),
    .io_dec_tlu_i0_pc_r(csr_io_dec_tlu_i0_pc_r),
    .io_dec_tlu_i0_valid_r(csr_io_dec_tlu_i0_valid_r),
    .io_dec_csr_any_unq_d(csr_io_dec_csr_any_unq_d),
    .io_dec_tlu_misc_clk_override(csr_io_dec_tlu_misc_clk_override),
    .io_dec_tlu_picio_clk_override(csr_io_dec_tlu_picio_clk_override),
    .io_dec_tlu_dec_clk_override(csr_io_dec_tlu_dec_clk_override),
    .io_dec_tlu_ifu_clk_override(csr_io_dec_tlu_ifu_clk_override),
    .io_dec_tlu_lsu_clk_override(csr_io_dec_tlu_lsu_clk_override),
    .io_dec_tlu_bus_clk_override(csr_io_dec_tlu_bus_clk_override),
    .io_dec_tlu_pic_clk_override(csr_io_dec_tlu_pic_clk_override),
    .io_dec_tlu_dccm_clk_override(csr_io_dec_tlu_dccm_clk_override),
    .io_dec_tlu_icm_clk_override(csr_io_dec_tlu_icm_clk_override),
    .io_dec_csr_rddata_d(csr_io_dec_csr_rddata_d),
    .io_dec_tlu_pipelining_disable(csr_io_dec_tlu_pipelining_disable),
    .io_dec_tlu_wr_pause_r(csr_io_dec_tlu_wr_pause_r),
    .io_ifu_pmu_bus_busy(csr_io_ifu_pmu_bus_busy),
    .io_lsu_pmu_bus_error(csr_io_lsu_pmu_bus_error),
    .io_ifu_pmu_bus_error(csr_io_ifu_pmu_bus_error),
    .io_lsu_pmu_bus_misaligned(csr_io_lsu_pmu_bus_misaligned),
    .io_lsu_pmu_bus_trxn(csr_io_lsu_pmu_bus_trxn),
    .io_ifu_ic_debug_rd_data(csr_io_ifu_ic_debug_rd_data),
    .io_dec_tlu_meipt(csr_io_dec_tlu_meipt),
    .io_pic_pl(csr_io_pic_pl),
    .io_dec_tlu_meicurpl(csr_io_dec_tlu_meicurpl),
    .io_dec_tlu_meihap(csr_io_dec_tlu_meihap),
    .io_pic_claimid(csr_io_pic_claimid),
    .io_iccm_dma_sb_error(csr_io_iccm_dma_sb_error),
    .io_lsu_imprecise_error_addr_any(csr_io_lsu_imprecise_error_addr_any),
    .io_lsu_imprecise_error_load_any(csr_io_lsu_imprecise_error_load_any),
    .io_lsu_imprecise_error_store_any(csr_io_lsu_imprecise_error_store_any),
    .io_dec_tlu_mrac_ff(csr_io_dec_tlu_mrac_ff),
    .io_dec_tlu_wb_coalescing_disable(csr_io_dec_tlu_wb_coalescing_disable),
    .io_dec_tlu_bpred_disable(csr_io_dec_tlu_bpred_disable),
    .io_dec_tlu_sideeffect_posted_disable(csr_io_dec_tlu_sideeffect_posted_disable),
    .io_dec_tlu_core_ecc_disable(csr_io_dec_tlu_core_ecc_disable),
    .io_dec_tlu_external_ldfwd_disable(csr_io_dec_tlu_external_ldfwd_disable),
    .io_dec_tlu_dma_qos_prty(csr_io_dec_tlu_dma_qos_prty),
    .io_dec_tlu_trace_disable(csr_io_dec_tlu_trace_disable),
    .io_dec_illegal_inst(csr_io_dec_illegal_inst),
    .io_lsu_error_pkt_r_bits_mscause(csr_io_lsu_error_pkt_r_bits_mscause),
    .io_mexintpend(csr_io_mexintpend),
    .io_exu_npc_r(csr_io_exu_npc_r),
    .io_mpc_reset_run_req(csr_io_mpc_reset_run_req),
    .io_rst_vec(csr_io_rst_vec),
    .io_core_id(csr_io_core_id),
    .io_dec_timer_rddata_d(csr_io_dec_timer_rddata_d),
    .io_dec_timer_read_d(csr_io_dec_timer_read_d),
    .io_dec_csr_wen_r_mod(csr_io_dec_csr_wen_r_mod),
    .io_rfpc_i0_r(csr_io_rfpc_i0_r),
    .io_i0_trigger_hit_r(csr_io_i0_trigger_hit_r),
    .io_fw_halt_req(csr_io_fw_halt_req),
    .io_mstatus(csr_io_mstatus),
    .io_exc_or_int_valid_r(csr_io_exc_or_int_valid_r),
    .io_mret_r(csr_io_mret_r),
    .io_mstatus_mie_ns(csr_io_mstatus_mie_ns),
    .io_dcsr_single_step_running_f(csr_io_dcsr_single_step_running_f),
    .io_dcsr(csr_io_dcsr),
    .io_mtvec(csr_io_mtvec),
    .io_mip(csr_io_mip),
    .io_dec_timer_t0_pulse(csr_io_dec_timer_t0_pulse),
    .io_dec_timer_t1_pulse(csr_io_dec_timer_t1_pulse),
    .io_timer_int_sync(csr_io_timer_int_sync),
    .io_soft_int_sync(csr_io_soft_int_sync),
    .io_mie_ns(csr_io_mie_ns),
    .io_csr_wr_clk(csr_io_csr_wr_clk),
    .io_ebreak_to_debug_mode_r(csr_io_ebreak_to_debug_mode_r),
    .io_dec_tlu_pmu_fw_halted(csr_io_dec_tlu_pmu_fw_halted),
    .io_lsu_fir_error(csr_io_lsu_fir_error),
    .io_npc_r(csr_io_npc_r),
    .io_tlu_flush_lower_r_d1(csr_io_tlu_flush_lower_r_d1),
    .io_dec_tlu_flush_noredir_r_d1(csr_io_dec_tlu_flush_noredir_r_d1),
    .io_tlu_flush_path_r_d1(csr_io_tlu_flush_path_r_d1),
    .io_npc_r_d1(csr_io_npc_r_d1),
    .io_reset_delayed(csr_io_reset_delayed),
    .io_mepc(csr_io_mepc),
    .io_interrupt_valid_r(csr_io_interrupt_valid_r),
    .io_i0_exception_valid_r(csr_io_i0_exception_valid_r),
    .io_lsu_exc_valid_r(csr_io_lsu_exc_valid_r),
    .io_mepc_trigger_hit_sel_pc_r(csr_io_mepc_trigger_hit_sel_pc_r),
    .io_lsu_single_ecc_error_r(csr_io_lsu_single_ecc_error_r),
    .io_e4e5_int_clk(csr_io_e4e5_int_clk),
    .io_lsu_i0_exc_r(csr_io_lsu_i0_exc_r),
    .io_inst_acc_r(csr_io_inst_acc_r),
    .io_inst_acc_second_r(csr_io_inst_acc_second_r),
    .io_take_nmi(csr_io_take_nmi),
    .io_lsu_error_pkt_addr_r(csr_io_lsu_error_pkt_addr_r),
    .io_exc_cause_r(csr_io_exc_cause_r),
    .io_i0_valid_wb(csr_io_i0_valid_wb),
    .io_interrupt_valid_r_d1(csr_io_interrupt_valid_r_d1),
    .io_i0_exception_valid_r_d1(csr_io_i0_exception_valid_r_d1),
    .io_exc_cause_wb(csr_io_exc_cause_wb),
    .io_nmi_lsu_store_type(csr_io_nmi_lsu_store_type),
    .io_nmi_lsu_load_type(csr_io_nmi_lsu_load_type),
    .io_tlu_i0_commit_cmt(csr_io_tlu_i0_commit_cmt),
    .io_ebreak_r(csr_io_ebreak_r),
    .io_ecall_r(csr_io_ecall_r),
    .io_illegal_r(csr_io_illegal_r),
    .io_mdseac_locked_ns(csr_io_mdseac_locked_ns),
    .io_mdseac_locked_f(csr_io_mdseac_locked_f),
    .io_nmi_int_detected_f(csr_io_nmi_int_detected_f),
    .io_internal_dbg_halt_mode_f2(csr_io_internal_dbg_halt_mode_f2),
    .io_ext_int_freeze(csr_io_ext_int_freeze),
    .io_ext_int_freeze_d1(csr_io_ext_int_freeze_d1),
    .io_take_ext_int_start_d1(csr_io_take_ext_int_start_d1),
    .io_take_ext_int_start_d2(csr_io_take_ext_int_start_d2),
    .io_take_ext_int_start_d3(csr_io_take_ext_int_start_d3),
    .io_ic_perr_r(csr_io_ic_perr_r),
    .io_iccm_sbecc_r(csr_io_iccm_sbecc_r),
    .io_ifu_miss_state_idle_f(csr_io_ifu_miss_state_idle_f),
    .io_lsu_idle_any_f(csr_io_lsu_idle_any_f),
    .io_dbg_tlu_halted_f(csr_io_dbg_tlu_halted_f),
    .io_dbg_tlu_halted(csr_io_dbg_tlu_halted),
    .io_debug_halt_req_f(csr_io_debug_halt_req_f),
    .io_force_halt(csr_io_force_halt),
    .io_take_ext_int_start(csr_io_take_ext_int_start),
    .io_trigger_hit_dmode_r_d1(csr_io_trigger_hit_dmode_r_d1),
    .io_trigger_hit_r_d1(csr_io_trigger_hit_r_d1),
    .io_dcsr_single_step_done_f(csr_io_dcsr_single_step_done_f),
    .io_ebreak_to_debug_mode_r_d1(csr_io_ebreak_to_debug_mode_r_d1),
    .io_debug_halt_req(csr_io_debug_halt_req),
    .io_allow_dbg_halt_csr_write(csr_io_allow_dbg_halt_csr_write),
    .io_internal_dbg_halt_mode_f(csr_io_internal_dbg_halt_mode_f),
    .io_enter_debug_halt_req(csr_io_enter_debug_halt_req),
    .io_internal_dbg_halt_mode(csr_io_internal_dbg_halt_mode),
    .io_request_debug_mode_done(csr_io_request_debug_mode_done),
    .io_request_debug_mode_r(csr_io_request_debug_mode_r),
    .io_dpc(csr_io_dpc),
    .io_update_hit_bit_r(csr_io_update_hit_bit_r),
    .io_take_timer_int(csr_io_take_timer_int),
    .io_take_int_timer0_int(csr_io_take_int_timer0_int),
    .io_take_int_timer1_int(csr_io_take_int_timer1_int),
    .io_take_ext_int(csr_io_take_ext_int),
    .io_tlu_flush_lower_r(csr_io_tlu_flush_lower_r),
    .io_dec_tlu_br0_error_r(csr_io_dec_tlu_br0_error_r),
    .io_dec_tlu_br0_start_error_r(csr_io_dec_tlu_br0_start_error_r),
    .io_lsu_pmu_load_external_r(csr_io_lsu_pmu_load_external_r),
    .io_lsu_pmu_store_external_r(csr_io_lsu_pmu_store_external_r),
    .io_csr_pkt_csr_misa(csr_io_csr_pkt_csr_misa),
    .io_csr_pkt_csr_mvendorid(csr_io_csr_pkt_csr_mvendorid),
    .io_csr_pkt_csr_marchid(csr_io_csr_pkt_csr_marchid),
    .io_csr_pkt_csr_mimpid(csr_io_csr_pkt_csr_mimpid),
    .io_csr_pkt_csr_mhartid(csr_io_csr_pkt_csr_mhartid),
    .io_csr_pkt_csr_mstatus(csr_io_csr_pkt_csr_mstatus),
    .io_csr_pkt_csr_mtvec(csr_io_csr_pkt_csr_mtvec),
    .io_csr_pkt_csr_mip(csr_io_csr_pkt_csr_mip),
    .io_csr_pkt_csr_mie(csr_io_csr_pkt_csr_mie),
    .io_csr_pkt_csr_mcyclel(csr_io_csr_pkt_csr_mcyclel),
    .io_csr_pkt_csr_mcycleh(csr_io_csr_pkt_csr_mcycleh),
    .io_csr_pkt_csr_minstretl(csr_io_csr_pkt_csr_minstretl),
    .io_csr_pkt_csr_minstreth(csr_io_csr_pkt_csr_minstreth),
    .io_csr_pkt_csr_mscratch(csr_io_csr_pkt_csr_mscratch),
    .io_csr_pkt_csr_mepc(csr_io_csr_pkt_csr_mepc),
    .io_csr_pkt_csr_mcause(csr_io_csr_pkt_csr_mcause),
    .io_csr_pkt_csr_mscause(csr_io_csr_pkt_csr_mscause),
    .io_csr_pkt_csr_mtval(csr_io_csr_pkt_csr_mtval),
    .io_csr_pkt_csr_mrac(csr_io_csr_pkt_csr_mrac),
    .io_csr_pkt_csr_mdseac(csr_io_csr_pkt_csr_mdseac),
    .io_csr_pkt_csr_meihap(csr_io_csr_pkt_csr_meihap),
    .io_csr_pkt_csr_meivt(csr_io_csr_pkt_csr_meivt),
    .io_csr_pkt_csr_meipt(csr_io_csr_pkt_csr_meipt),
    .io_csr_pkt_csr_meicurpl(csr_io_csr_pkt_csr_meicurpl),
    .io_csr_pkt_csr_meicidpl(csr_io_csr_pkt_csr_meicidpl),
    .io_csr_pkt_csr_dcsr(csr_io_csr_pkt_csr_dcsr),
    .io_csr_pkt_csr_mcgc(csr_io_csr_pkt_csr_mcgc),
    .io_csr_pkt_csr_mfdc(csr_io_csr_pkt_csr_mfdc),
    .io_csr_pkt_csr_dpc(csr_io_csr_pkt_csr_dpc),
    .io_csr_pkt_csr_mtsel(csr_io_csr_pkt_csr_mtsel),
    .io_csr_pkt_csr_mtdata1(csr_io_csr_pkt_csr_mtdata1),
    .io_csr_pkt_csr_mtdata2(csr_io_csr_pkt_csr_mtdata2),
    .io_csr_pkt_csr_mhpmc3(csr_io_csr_pkt_csr_mhpmc3),
    .io_csr_pkt_csr_mhpmc4(csr_io_csr_pkt_csr_mhpmc4),
    .io_csr_pkt_csr_mhpmc5(csr_io_csr_pkt_csr_mhpmc5),
    .io_csr_pkt_csr_mhpmc6(csr_io_csr_pkt_csr_mhpmc6),
    .io_csr_pkt_csr_mhpmc3h(csr_io_csr_pkt_csr_mhpmc3h),
    .io_csr_pkt_csr_mhpmc4h(csr_io_csr_pkt_csr_mhpmc4h),
    .io_csr_pkt_csr_mhpmc5h(csr_io_csr_pkt_csr_mhpmc5h),
    .io_csr_pkt_csr_mhpmc6h(csr_io_csr_pkt_csr_mhpmc6h),
    .io_csr_pkt_csr_mhpme3(csr_io_csr_pkt_csr_mhpme3),
    .io_csr_pkt_csr_mhpme4(csr_io_csr_pkt_csr_mhpme4),
    .io_csr_pkt_csr_mhpme5(csr_io_csr_pkt_csr_mhpme5),
    .io_csr_pkt_csr_mhpme6(csr_io_csr_pkt_csr_mhpme6),
    .io_csr_pkt_csr_mcountinhibit(csr_io_csr_pkt_csr_mcountinhibit),
    .io_csr_pkt_csr_mpmc(csr_io_csr_pkt_csr_mpmc),
    .io_csr_pkt_csr_micect(csr_io_csr_pkt_csr_micect),
    .io_csr_pkt_csr_miccmect(csr_io_csr_pkt_csr_miccmect),
    .io_csr_pkt_csr_mdccmect(csr_io_csr_pkt_csr_mdccmect),
    .io_csr_pkt_csr_mfdht(csr_io_csr_pkt_csr_mfdht),
    .io_csr_pkt_csr_mfdhs(csr_io_csr_pkt_csr_mfdhs),
    .io_csr_pkt_csr_dicawics(csr_io_csr_pkt_csr_dicawics),
    .io_csr_pkt_csr_dicad0h(csr_io_csr_pkt_csr_dicad0h),
    .io_csr_pkt_csr_dicad0(csr_io_csr_pkt_csr_dicad0),
    .io_csr_pkt_csr_dicad1(csr_io_csr_pkt_csr_dicad1),
    .io_mtdata1_t_0(csr_io_mtdata1_t_0),
    .io_mtdata1_t_1(csr_io_mtdata1_t_1),
    .io_mtdata1_t_2(csr_io_mtdata1_t_2),
    .io_mtdata1_t_3(csr_io_mtdata1_t_3),
    .io_trigger_enabled(csr_io_trigger_enabled)
  );
  dec_timer_ctl int_timers ( // @[dec_tlu_ctl.scala 284:30]
    .clock(int_timers_clock),
    .reset(int_timers_reset),
    .io_free_l2clk(int_timers_io_free_l2clk),
    .io_csr_wr_clk(int_timers_io_csr_wr_clk),
    .io_dec_csr_wen_r_mod(int_timers_io_dec_csr_wen_r_mod),
    .io_dec_csr_wraddr_r(int_timers_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(int_timers_io_dec_csr_wrdata_r),
    .io_csr_mitctl0(int_timers_io_csr_mitctl0),
    .io_csr_mitctl1(int_timers_io_csr_mitctl1),
    .io_csr_mitb0(int_timers_io_csr_mitb0),
    .io_csr_mitb1(int_timers_io_csr_mitb1),
    .io_csr_mitcnt0(int_timers_io_csr_mitcnt0),
    .io_csr_mitcnt1(int_timers_io_csr_mitcnt1),
    .io_dec_pause_state(int_timers_io_dec_pause_state),
    .io_dec_tlu_pmu_fw_halted(int_timers_io_dec_tlu_pmu_fw_halted),
    .io_internal_dbg_halt_timers(int_timers_io_internal_dbg_halt_timers),
    .io_dec_timer_rddata_d(int_timers_io_dec_timer_rddata_d),
    .io_dec_timer_read_d(int_timers_io_dec_timer_read_d),
    .io_dec_timer_t0_pulse(int_timers_io_dec_timer_t0_pulse),
    .io_dec_timer_t1_pulse(int_timers_io_dec_timer_t1_pulse)
  );
  dec_decode_csr_read csr_read ( // @[dec_tlu_ctl.scala 1017:28]
    .io_dec_csr_rdaddr_d(csr_read_io_dec_csr_rdaddr_d),
    .io_csr_pkt_csr_misa(csr_read_io_csr_pkt_csr_misa),
    .io_csr_pkt_csr_mvendorid(csr_read_io_csr_pkt_csr_mvendorid),
    .io_csr_pkt_csr_marchid(csr_read_io_csr_pkt_csr_marchid),
    .io_csr_pkt_csr_mimpid(csr_read_io_csr_pkt_csr_mimpid),
    .io_csr_pkt_csr_mhartid(csr_read_io_csr_pkt_csr_mhartid),
    .io_csr_pkt_csr_mstatus(csr_read_io_csr_pkt_csr_mstatus),
    .io_csr_pkt_csr_mtvec(csr_read_io_csr_pkt_csr_mtvec),
    .io_csr_pkt_csr_mip(csr_read_io_csr_pkt_csr_mip),
    .io_csr_pkt_csr_mie(csr_read_io_csr_pkt_csr_mie),
    .io_csr_pkt_csr_mcyclel(csr_read_io_csr_pkt_csr_mcyclel),
    .io_csr_pkt_csr_mcycleh(csr_read_io_csr_pkt_csr_mcycleh),
    .io_csr_pkt_csr_minstretl(csr_read_io_csr_pkt_csr_minstretl),
    .io_csr_pkt_csr_minstreth(csr_read_io_csr_pkt_csr_minstreth),
    .io_csr_pkt_csr_mscratch(csr_read_io_csr_pkt_csr_mscratch),
    .io_csr_pkt_csr_mepc(csr_read_io_csr_pkt_csr_mepc),
    .io_csr_pkt_csr_mcause(csr_read_io_csr_pkt_csr_mcause),
    .io_csr_pkt_csr_mscause(csr_read_io_csr_pkt_csr_mscause),
    .io_csr_pkt_csr_mtval(csr_read_io_csr_pkt_csr_mtval),
    .io_csr_pkt_csr_mrac(csr_read_io_csr_pkt_csr_mrac),
    .io_csr_pkt_csr_dmst(csr_read_io_csr_pkt_csr_dmst),
    .io_csr_pkt_csr_mdseac(csr_read_io_csr_pkt_csr_mdseac),
    .io_csr_pkt_csr_meihap(csr_read_io_csr_pkt_csr_meihap),
    .io_csr_pkt_csr_meivt(csr_read_io_csr_pkt_csr_meivt),
    .io_csr_pkt_csr_meipt(csr_read_io_csr_pkt_csr_meipt),
    .io_csr_pkt_csr_meicurpl(csr_read_io_csr_pkt_csr_meicurpl),
    .io_csr_pkt_csr_meicidpl(csr_read_io_csr_pkt_csr_meicidpl),
    .io_csr_pkt_csr_dcsr(csr_read_io_csr_pkt_csr_dcsr),
    .io_csr_pkt_csr_mcgc(csr_read_io_csr_pkt_csr_mcgc),
    .io_csr_pkt_csr_mfdc(csr_read_io_csr_pkt_csr_mfdc),
    .io_csr_pkt_csr_dpc(csr_read_io_csr_pkt_csr_dpc),
    .io_csr_pkt_csr_mtsel(csr_read_io_csr_pkt_csr_mtsel),
    .io_csr_pkt_csr_mtdata1(csr_read_io_csr_pkt_csr_mtdata1),
    .io_csr_pkt_csr_mtdata2(csr_read_io_csr_pkt_csr_mtdata2),
    .io_csr_pkt_csr_mhpmc3(csr_read_io_csr_pkt_csr_mhpmc3),
    .io_csr_pkt_csr_mhpmc4(csr_read_io_csr_pkt_csr_mhpmc4),
    .io_csr_pkt_csr_mhpmc5(csr_read_io_csr_pkt_csr_mhpmc5),
    .io_csr_pkt_csr_mhpmc6(csr_read_io_csr_pkt_csr_mhpmc6),
    .io_csr_pkt_csr_mhpmc3h(csr_read_io_csr_pkt_csr_mhpmc3h),
    .io_csr_pkt_csr_mhpmc4h(csr_read_io_csr_pkt_csr_mhpmc4h),
    .io_csr_pkt_csr_mhpmc5h(csr_read_io_csr_pkt_csr_mhpmc5h),
    .io_csr_pkt_csr_mhpmc6h(csr_read_io_csr_pkt_csr_mhpmc6h),
    .io_csr_pkt_csr_mhpme3(csr_read_io_csr_pkt_csr_mhpme3),
    .io_csr_pkt_csr_mhpme4(csr_read_io_csr_pkt_csr_mhpme4),
    .io_csr_pkt_csr_mhpme5(csr_read_io_csr_pkt_csr_mhpme5),
    .io_csr_pkt_csr_mhpme6(csr_read_io_csr_pkt_csr_mhpme6),
    .io_csr_pkt_csr_mcountinhibit(csr_read_io_csr_pkt_csr_mcountinhibit),
    .io_csr_pkt_csr_mitctl0(csr_read_io_csr_pkt_csr_mitctl0),
    .io_csr_pkt_csr_mitctl1(csr_read_io_csr_pkt_csr_mitctl1),
    .io_csr_pkt_csr_mitb0(csr_read_io_csr_pkt_csr_mitb0),
    .io_csr_pkt_csr_mitb1(csr_read_io_csr_pkt_csr_mitb1),
    .io_csr_pkt_csr_mitcnt0(csr_read_io_csr_pkt_csr_mitcnt0),
    .io_csr_pkt_csr_mitcnt1(csr_read_io_csr_pkt_csr_mitcnt1),
    .io_csr_pkt_csr_mpmc(csr_read_io_csr_pkt_csr_mpmc),
    .io_csr_pkt_csr_meicpct(csr_read_io_csr_pkt_csr_meicpct),
    .io_csr_pkt_csr_micect(csr_read_io_csr_pkt_csr_micect),
    .io_csr_pkt_csr_miccmect(csr_read_io_csr_pkt_csr_miccmect),
    .io_csr_pkt_csr_mdccmect(csr_read_io_csr_pkt_csr_mdccmect),
    .io_csr_pkt_csr_mfdht(csr_read_io_csr_pkt_csr_mfdht),
    .io_csr_pkt_csr_mfdhs(csr_read_io_csr_pkt_csr_mfdhs),
    .io_csr_pkt_csr_dicawics(csr_read_io_csr_pkt_csr_dicawics),
    .io_csr_pkt_csr_dicad0h(csr_read_io_csr_pkt_csr_dicad0h),
    .io_csr_pkt_csr_dicad0(csr_read_io_csr_pkt_csr_dicad0),
    .io_csr_pkt_csr_dicad1(csr_read_io_csr_pkt_csr_dicad1),
    .io_csr_pkt_csr_dicago(csr_read_io_csr_pkt_csr_dicago),
    .io_csr_pkt_presync(csr_read_io_csr_pkt_presync),
    .io_csr_pkt_postsync(csr_read_io_csr_pkt_postsync),
    .io_csr_pkt_legal(csr_read_io_csr_pkt_legal)
  );
  assign io_tlu_exu_dec_tlu_meihap = csr_io_dec_tlu_meihap; // @[dec_tlu_ctl.scala 879:58]
  assign io_tlu_exu_dec_tlu_flush_lower_r = int_exc_io_dec_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 810:54]
  assign io_tlu_exu_dec_tlu_flush_path_r = int_exc_io_dec_tlu_flush_path_r; // @[dec_tlu_ctl.scala 811:54]
  assign io_tlu_dma_dec_tlu_dma_qos_prty = csr_io_dec_tlu_dma_qos_prty; // @[dec_tlu_ctl.scala 910:54]
  assign io_dec_tlu_core_empty = force_halt | _T_228; // @[dec_tlu_ctl.scala 436:31]
  assign io_dec_dbg_cmd_done = io_dec_tlu_i0_valid_r & io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 510:29]
  assign io_dec_dbg_cmd_fail = illegal_r & io_dec_dbg_cmd_done; // @[dec_tlu_ctl.scala 511:29]
  assign io_dec_tlu_dbg_halted = dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 492:41]
  assign io_dec_tlu_debug_mode = debug_mode_status; // @[dec_tlu_ctl.scala 493:41]
  assign io_dec_tlu_resume_ack = _T_286; // @[dec_tlu_ctl.scala 473:53]
  assign io_dec_tlu_debug_stall = debug_halt_req_f; // @[dec_tlu_ctl.scala 491:41]
  assign io_dec_tlu_mpc_halted_only = _T_143; // @[dec_tlu_ctl.scala 386:42]
  assign io_dec_tlu_flush_extint = int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 499:33]
  assign io_trigger_pkt_any_0_select = csr_io_trigger_pkt_any_0_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_match_pkt = csr_io_trigger_pkt_any_0_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_store = csr_io_trigger_pkt_any_0_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_load = csr_io_trigger_pkt_any_0_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_execute = csr_io_trigger_pkt_any_0_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_m = csr_io_trigger_pkt_any_0_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_tdata2 = csr_io_trigger_pkt_any_0_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_select = csr_io_trigger_pkt_any_1_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_match_pkt = csr_io_trigger_pkt_any_1_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_store = csr_io_trigger_pkt_any_1_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_load = csr_io_trigger_pkt_any_1_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_execute = csr_io_trigger_pkt_any_1_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_m = csr_io_trigger_pkt_any_1_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_tdata2 = csr_io_trigger_pkt_any_1_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_select = csr_io_trigger_pkt_any_2_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_match_pkt = csr_io_trigger_pkt_any_2_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_store = csr_io_trigger_pkt_any_2_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_load = csr_io_trigger_pkt_any_2_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_execute = csr_io_trigger_pkt_any_2_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_m = csr_io_trigger_pkt_any_2_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_tdata2 = csr_io_trigger_pkt_any_2_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_select = csr_io_trigger_pkt_any_3_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_match_pkt = csr_io_trigger_pkt_any_3_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_store = csr_io_trigger_pkt_any_3_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_load = csr_io_trigger_pkt_any_3_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_execute = csr_io_trigger_pkt_any_3_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_m = csr_io_trigger_pkt_any_3_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_tdata2 = csr_io_trigger_pkt_any_3_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_o_cpu_halt_status = _T_512; // @[dec_tlu_ctl.scala 606:60]
  assign io_o_cpu_halt_ack = _T_516; // @[dec_tlu_ctl.scala 607:68]
  assign io_o_cpu_run_ack = _T_520; // @[dec_tlu_ctl.scala 608:68]
  assign io_o_debug_mode_status = debug_mode_status; // @[dec_tlu_ctl.scala 630:32]
  assign io_mpc_debug_halt_ack = mpc_debug_halt_ack_f; // @[dec_tlu_ctl.scala 412:31]
  assign io_mpc_debug_run_ack = mpc_debug_run_ack_f; // @[dec_tlu_ctl.scala 413:31]
  assign io_debug_brkpt_status = debug_brkpt_status_f; // @[dec_tlu_ctl.scala 414:31]
  assign io_dec_csr_rddata_d = csr_io_dec_csr_rddata_d; // @[dec_tlu_ctl.scala 901:46]
  assign io_dec_csr_legal_d = _T_731 & _T_738; // @[dec_tlu_ctl.scala 1028:28]
  assign io_dec_tlu_i0_kill_writeb_wb = _T_52; // @[dec_tlu_ctl.scala 343:41]
  assign io_dec_tlu_i0_kill_writeb_r = _T_609 | i0_trigger_hit_raw_r; // @[dec_tlu_ctl.scala 349:41]
  assign io_dec_tlu_wr_pause_r = csr_io_dec_tlu_wr_pause_r; // @[dec_tlu_ctl.scala 903:46]
  assign io_dec_tlu_flush_pause_r = _T_342 & _T_343; // @[dec_tlu_ctl.scala 502:34]
  assign io_dec_tlu_presync_d = _T_708 & _T_709; // @[dec_tlu_ctl.scala 1021:31]
  assign io_dec_tlu_postsync_d = csr_pkt_postsync & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 1022:31]
  assign io_dec_tlu_perfcnt0 = csr_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 888:46]
  assign io_dec_tlu_perfcnt1 = csr_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 889:46]
  assign io_dec_tlu_perfcnt2 = csr_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 890:46]
  assign io_dec_tlu_perfcnt3 = csr_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 891:46]
  assign io_dec_tlu_i0_exc_valid_wb1 = csr_io_dec_tlu_i0_exc_valid_wb1; // @[dec_tlu_ctl.scala 882:50]
  assign io_dec_tlu_i0_valid_wb1 = csr_io_dec_tlu_i0_valid_wb1; // @[dec_tlu_ctl.scala 883:50]
  assign io_dec_tlu_int_valid_wb1 = csr_io_dec_tlu_int_valid_wb1; // @[dec_tlu_ctl.scala 881:50]
  assign io_dec_tlu_exc_cause_wb1 = csr_io_dec_tlu_exc_cause_wb1; // @[dec_tlu_ctl.scala 887:46]
  assign io_dec_tlu_mtval_wb1 = csr_io_dec_tlu_mtval_wb1; // @[dec_tlu_ctl.scala 886:46]
  assign io_dec_tlu_pipelining_disable = csr_io_dec_tlu_pipelining_disable; // @[dec_tlu_ctl.scala 902:46]
  assign io_dec_tlu_trace_disable = csr_io_dec_tlu_trace_disable; // @[dec_tlu_ctl.scala 911:49]
  assign io_dec_tlu_misc_clk_override = csr_io_dec_tlu_misc_clk_override; // @[dec_tlu_ctl.scala 892:46]
  assign io_dec_tlu_dec_clk_override = csr_io_dec_tlu_dec_clk_override; // @[dec_tlu_ctl.scala 894:46]
  assign io_dec_tlu_ifu_clk_override = csr_io_dec_tlu_ifu_clk_override; // @[dec_tlu_ctl.scala 895:46]
  assign io_dec_tlu_lsu_clk_override = csr_io_dec_tlu_lsu_clk_override; // @[dec_tlu_ctl.scala 896:46]
  assign io_dec_tlu_bus_clk_override = csr_io_dec_tlu_bus_clk_override; // @[dec_tlu_ctl.scala 897:46]
  assign io_dec_tlu_pic_clk_override = csr_io_dec_tlu_pic_clk_override; // @[dec_tlu_ctl.scala 898:46]
  assign io_dec_tlu_picio_clk_override = csr_io_dec_tlu_picio_clk_override; // @[dec_tlu_ctl.scala 893:46]
  assign io_dec_tlu_dccm_clk_override = csr_io_dec_tlu_dccm_clk_override; // @[dec_tlu_ctl.scala 899:46]
  assign io_dec_tlu_icm_clk_override = csr_io_dec_tlu_icm_clk_override; // @[dec_tlu_ctl.scala 900:46]
  assign io_dec_tlu_flush_lower_wb = int_exc_io_dec_tlu_flush_lower_wb; // @[dec_tlu_ctl.scala 809:46]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_valid = _T_643 & _T_646; // @[dec_tlu_ctl.scala 687:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist = io_tlu_exu_exu_i0_br_hist_r; // @[dec_tlu_ctl.scala 684:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error = _T_635 & _T_611; // @[dec_tlu_ctl.scala 685:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error = _T_638 & _T_611; // @[dec_tlu_ctl.scala 686:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_way = io_exu_i0_br_way_r; // @[dec_tlu_ctl.scala 688:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle = io_tlu_exu_exu_i0_br_middle_r; // @[dec_tlu_ctl.scala 689:81]
  assign io_tlu_bp_dec_tlu_flush_leak_one_wb = _T_367 & _T_368; // @[dec_tlu_ctl.scala 506:45]
  assign io_tlu_bp_dec_tlu_bpred_disable = csr_io_dec_tlu_bpred_disable; // @[dec_tlu_ctl.scala 906:53]
  assign io_tlu_ifc_dec_tlu_flush_noredir_wb = _T_339 | take_ext_int_start; // @[dec_tlu_ctl.scala 497:45]
  assign io_tlu_ifc_dec_tlu_mrac_ff = csr_io_dec_tlu_mrac_ff; // @[dec_tlu_ctl.scala 904:54]
  assign io_tlu_mem_dec_tlu_flush_err_wb = io_tlu_exu_dec_tlu_flush_lower_r & _T_615; // @[dec_tlu_ctl.scala 507:41]
  assign io_tlu_mem_dec_tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 658:42]
  assign io_tlu_mem_dec_tlu_force_halt = _T_59; // @[dec_tlu_ctl.scala 345:41]
  assign io_tlu_mem_dec_tlu_fence_i_wb = _T_677 & _T_590; // @[dec_tlu_ctl.scala 719:39]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata = csr_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics = csr_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid = csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid = csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_core_ecc_disable = csr_io_dec_tlu_core_ecc_disable; // @[dec_tlu_ctl.scala 908:54]
  assign io_tlu_busbuff_dec_tlu_external_ldfwd_disable = csr_io_dec_tlu_external_ldfwd_disable; // @[dec_tlu_ctl.scala 909:58]
  assign io_tlu_busbuff_dec_tlu_wb_coalescing_disable = csr_io_dec_tlu_wb_coalescing_disable; // @[dec_tlu_ctl.scala 905:58]
  assign io_tlu_busbuff_dec_tlu_sideeffect_posted_disable = csr_io_dec_tlu_sideeffect_posted_disable; // @[dec_tlu_ctl.scala 907:58]
  assign io_dec_pic_dec_tlu_meicurpl = csr_io_dec_tlu_meicurpl; // @[dec_tlu_ctl.scala 878:58]
  assign io_dec_pic_dec_tlu_meipt = csr_io_dec_tlu_meipt; // @[dec_tlu_ctl.scala 880:58]
  assign int_exc_clock = clock;
  assign int_exc_reset = reset;
  assign int_exc_io_ext_int_freeze_d1 = csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 789:42]
  assign int_exc_io_take_ext_int_start_d1 = csr_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 790:44]
  assign int_exc_io_take_ext_int_start_d2 = csr_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 791:44]
  assign int_exc_io_take_ext_int_start_d3 = csr_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 792:44]
  assign int_exc_io_dec_csr_stall_int_ff = io_dec_csr_stall_int_ff; // @[dec_tlu_ctl.scala 724:49]
  assign int_exc_io_mstatus_mie_ns = csr_io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 725:49]
  assign int_exc_io_mip = csr_io_mip; // @[dec_tlu_ctl.scala 726:49]
  assign int_exc_io_mie_ns = csr_io_mie_ns; // @[dec_tlu_ctl.scala 727:49]
  assign int_exc_io_mret_r = _T_672 & _T_590; // @[dec_tlu_ctl.scala 728:49]
  assign int_exc_io_pmu_fw_tlu_halted_f = pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 729:49]
  assign int_exc_io_int_timer0_int_hold_f = int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 730:49]
  assign int_exc_io_int_timer1_int_hold_f = int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 731:49]
  assign int_exc_io_internal_dbg_halt_mode_f = debug_mode_status; // @[dec_tlu_ctl.scala 732:49]
  assign int_exc_io_dcsr_single_step_running = _T_255 | _T_257; // @[dec_tlu_ctl.scala 733:49]
  assign int_exc_io_internal_dbg_halt_mode = debug_halt_req_ns | _T_238; // @[dec_tlu_ctl.scala 734:49]
  assign int_exc_io_dec_tlu_i0_valid_r = io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 735:49]
  assign int_exc_io_internal_pmu_fw_halt_mode = pmu_fw_halt_req_ns | _T_549; // @[dec_tlu_ctl.scala 736:49]
  assign int_exc_io_i_cpu_halt_req_d1 = i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 737:49]
  assign int_exc_io_ebreak_to_debug_mode_r = _T_704 & _T_590; // @[dec_tlu_ctl.scala 738:49]
  assign int_exc_io_lsu_fir_error = io_lsu_fir_error; // @[dec_tlu_ctl.scala 739:49]
  assign int_exc_io_csr_pkt_csr_meicpct = csr_read_io_csr_pkt_csr_meicpct; // @[dec_tlu_ctl.scala 740:49]
  assign int_exc_io_dec_csr_any_unq_d = io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 741:49]
  assign int_exc_io_lsu_fastint_stall_any = io_lsu_fastint_stall_any; // @[dec_tlu_ctl.scala 742:49]
  assign int_exc_io_reset_delayed = reset_detect ^ reset_detected; // @[dec_tlu_ctl.scala 743:49]
  assign int_exc_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 744:49]
  assign int_exc_io_nmi_int_detected = _T_81 | nmi_fir_type; // @[dec_tlu_ctl.scala 745:49]
  assign int_exc_io_dcsr_single_step_running_f = dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 746:49]
  assign int_exc_io_dcsr_single_step_done_f = dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 747:49]
  assign int_exc_io_dcsr = csr_io_dcsr; // @[dec_tlu_ctl.scala 748:49]
  assign int_exc_io_mtvec = csr_io_mtvec; // @[dec_tlu_ctl.scala 749:49]
  assign int_exc_io_tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 750:49]
  assign int_exc_io_i0_trigger_hit_r = |i0_trigger_chain_masked_r; // @[dec_tlu_ctl.scala 751:49]
  assign int_exc_io_pause_expired_r = _T_361 & _T_362; // @[dec_tlu_ctl.scala 752:49]
  assign int_exc_io_nmi_vec = io_nmi_vec; // @[dec_tlu_ctl.scala 753:49]
  assign int_exc_io_lsu_i0_rfnpc_r = _T_592 & _T_594; // @[dec_tlu_ctl.scala 754:49]
  assign int_exc_io_fence_i_r = _T_677 & _T_590; // @[dec_tlu_ctl.scala 755:49]
  assign int_exc_io_iccm_repair_state_rfnpc = _T_626 & _T_634; // @[dec_tlu_ctl.scala 756:49]
  assign int_exc_io_i_cpu_run_req_d1 = i_cpu_run_req_d1_raw | _T_584; // @[dec_tlu_ctl.scala 757:49]
  assign int_exc_io_rfpc_i0_r = _T_620 & _T_621; // @[dec_tlu_ctl.scala 758:49]
  assign int_exc_io_lsu_exc_valid_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 759:49]
  assign int_exc_io_trigger_hit_dmode_r = i0_trigger_hit_raw_r & i0_trigger_action_r; // @[dec_tlu_ctl.scala 760:49]
  assign int_exc_io_take_halt = _T_208 & _T_209; // @[dec_tlu_ctl.scala 761:49]
  assign int_exc_io_rst_vec = io_rst_vec; // @[dec_tlu_ctl.scala 762:49]
  assign int_exc_io_lsu_fir_addr = io_lsu_fir_addr; // @[dec_tlu_ctl.scala 763:49]
  assign int_exc_io_dec_tlu_i0_pc_r = io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 764:49]
  assign int_exc_io_npc_r = csr_io_npc_r; // @[dec_tlu_ctl.scala 765:49]
  assign int_exc_io_mepc = csr_io_mepc; // @[dec_tlu_ctl.scala 766:49]
  assign int_exc_io_debug_resume_req_f = debug_resume_req_f_raw & _T_333; // @[dec_tlu_ctl.scala 767:49]
  assign int_exc_io_dpc = csr_io_dpc; // @[dec_tlu_ctl.scala 768:49]
  assign int_exc_io_npc_r_d1 = csr_io_npc_r_d1; // @[dec_tlu_ctl.scala 769:49]
  assign int_exc_io_tlu_flush_lower_r_d1 = tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 770:49]
  assign int_exc_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 771:49]
  assign int_exc_io_ebreak_r = _T_654 & _T_590; // @[dec_tlu_ctl.scala 772:49]
  assign int_exc_io_ecall_r = _T_660 & _T_590; // @[dec_tlu_ctl.scala 773:49]
  assign int_exc_io_illegal_r = _T_666 & _T_590; // @[dec_tlu_ctl.scala 774:49]
  assign int_exc_io_inst_acc_r = _T_696 & _T_619; // @[dec_tlu_ctl.scala 775:49]
  assign int_exc_io_lsu_i0_exc_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 776:49]
  assign int_exc_io_lsu_error_pkt_r_bits_inst_type = io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 777:49]
  assign int_exc_io_lsu_error_pkt_r_bits_exc_type = io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 777:49]
  assign int_exc_io_dec_tlu_wr_pause_r_d1 = dec_tlu_wr_pause_r_d1; // @[dec_tlu_ctl.scala 778:42]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 822:50]
  assign csr_io_free_clk = io_free_clk; // @[dec_tlu_ctl.scala 821:50]
  assign csr_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 824:50]
  assign csr_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 825:50]
  assign csr_io_dec_csr_rdaddr_d = io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 826:50]
  assign csr_io_dec_csr_wen_unq_d = io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 827:50]
  assign csr_io_dec_i0_decode_d = io_dec_i0_decode_d; // @[dec_tlu_ctl.scala 828:50]
  assign csr_io_ifu_ic_debug_rd_data_valid = io_tlu_mem_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 829:50]
  assign csr_io_ifu_pmu_bus_trxn = io_tlu_mem_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 830:50]
  assign csr_io_dma_iccm_stall_any = io_tlu_dma_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 831:50]
  assign csr_io_dma_dccm_stall_any = io_tlu_dma_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 832:50]
  assign csr_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 833:50]
  assign csr_io_dec_pmu_presync_stall = io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 834:50]
  assign csr_io_dec_pmu_postsync_stall = io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 835:50]
  assign csr_io_dec_pmu_decode_stall = io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 836:50]
  assign csr_io_ifu_pmu_fetch_stall = io_tlu_ifc_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 837:50]
  assign csr_io_dec_tlu_packet_r_icaf_type = io_dec_tlu_packet_r_icaf_type; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_divide = io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_exu_pmu_i0_br_ataken = io_tlu_exu_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 839:50]
  assign csr_io_exu_pmu_i0_br_misp = io_tlu_exu_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 840:50]
  assign csr_io_dec_pmu_instr_decoded = io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 841:50]
  assign csr_io_ifu_pmu_instr_aligned = io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 842:50]
  assign csr_io_exu_pmu_i0_pc4 = io_tlu_exu_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 843:50]
  assign csr_io_ifu_pmu_ic_miss = io_tlu_mem_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 844:50]
  assign csr_io_ifu_pmu_ic_hit = io_tlu_mem_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 845:50]
  assign csr_io_dec_csr_wen_r = io_dec_csr_wen_r; // @[dec_tlu_ctl.scala 846:50]
  assign csr_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 847:50]
  assign csr_io_dma_pmu_dccm_write = io_tlu_dma_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 848:50]
  assign csr_io_dma_pmu_dccm_read = io_tlu_dma_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 849:50]
  assign csr_io_dma_pmu_any_write = io_tlu_dma_dma_pmu_any_write; // @[dec_tlu_ctl.scala 850:50]
  assign csr_io_dma_pmu_any_read = io_tlu_dma_dma_pmu_any_read; // @[dec_tlu_ctl.scala 851:50]
  assign csr_io_lsu_pmu_bus_busy = io_tlu_busbuff_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 852:50]
  assign csr_io_dec_tlu_i0_pc_r = io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 853:50]
  assign csr_io_dec_tlu_i0_valid_r = io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 854:50]
  assign csr_io_dec_csr_any_unq_d = io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 856:50]
  assign csr_io_ifu_pmu_bus_busy = io_tlu_mem_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 857:50]
  assign csr_io_lsu_pmu_bus_error = io_tlu_busbuff_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 858:50]
  assign csr_io_ifu_pmu_bus_error = io_tlu_mem_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 859:50]
  assign csr_io_lsu_pmu_bus_misaligned = io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 860:50]
  assign csr_io_lsu_pmu_bus_trxn = io_tlu_busbuff_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 861:50]
  assign csr_io_ifu_ic_debug_rd_data = io_tlu_mem_ifu_ic_debug_rd_data; // @[dec_tlu_ctl.scala 862:50]
  assign csr_io_pic_pl = io_dec_pic_pic_pl; // @[dec_tlu_ctl.scala 863:50]
  assign csr_io_pic_claimid = io_dec_pic_pic_claimid; // @[dec_tlu_ctl.scala 864:50]
  assign csr_io_iccm_dma_sb_error = io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 865:50]
  assign csr_io_lsu_imprecise_error_addr_any = io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[dec_tlu_ctl.scala 866:50]
  assign csr_io_lsu_imprecise_error_load_any = io_tlu_busbuff_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 867:50]
  assign csr_io_lsu_imprecise_error_store_any = io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 868:50]
  assign csr_io_dec_illegal_inst = io_dec_illegal_inst; // @[dec_tlu_ctl.scala 869:50 dec_tlu_ctl.scala 912:50]
  assign csr_io_lsu_error_pkt_r_bits_mscause = io_lsu_error_pkt_r_bits_mscause; // @[dec_tlu_ctl.scala 870:50 dec_tlu_ctl.scala 913:50]
  assign csr_io_mexintpend = io_dec_pic_mexintpend; // @[dec_tlu_ctl.scala 871:50 dec_tlu_ctl.scala 914:50]
  assign csr_io_exu_npc_r = io_tlu_exu_exu_npc_r; // @[dec_tlu_ctl.scala 872:50 dec_tlu_ctl.scala 915:50]
  assign csr_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 873:50 dec_tlu_ctl.scala 916:50]
  assign csr_io_rst_vec = io_rst_vec; // @[dec_tlu_ctl.scala 874:50 dec_tlu_ctl.scala 917:50]
  assign csr_io_core_id = io_core_id; // @[dec_tlu_ctl.scala 875:50 dec_tlu_ctl.scala 918:50]
  assign csr_io_dec_timer_rddata_d = int_timers_io_dec_timer_rddata_d; // @[dec_tlu_ctl.scala 876:50 dec_tlu_ctl.scala 919:50]
  assign csr_io_dec_timer_read_d = int_timers_io_dec_timer_read_d; // @[dec_tlu_ctl.scala 877:50 dec_tlu_ctl.scala 920:50]
  assign csr_io_rfpc_i0_r = _T_620 & _T_621; // @[dec_tlu_ctl.scala 923:45]
  assign csr_io_i0_trigger_hit_r = |i0_trigger_chain_masked_r; // @[dec_tlu_ctl.scala 924:45]
  assign csr_io_exc_or_int_valid_r = int_exc_io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 925:45]
  assign csr_io_mret_r = _T_672 & _T_590; // @[dec_tlu_ctl.scala 926:45]
  assign csr_io_dcsr_single_step_running_f = dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 927:45]
  assign csr_io_dec_timer_t0_pulse = int_timers_io_dec_timer_t0_pulse; // @[dec_tlu_ctl.scala 928:45]
  assign csr_io_dec_timer_t1_pulse = int_timers_io_dec_timer_t1_pulse; // @[dec_tlu_ctl.scala 929:45]
  assign csr_io_timer_int_sync = syncro_ff[5]; // @[dec_tlu_ctl.scala 930:45]
  assign csr_io_soft_int_sync = syncro_ff[4]; // @[dec_tlu_ctl.scala 931:45]
  assign csr_io_csr_wr_clk = clock; // @[dec_tlu_ctl.scala 932:45]
  assign csr_io_ebreak_to_debug_mode_r = _T_704 & _T_590; // @[dec_tlu_ctl.scala 933:45]
  assign csr_io_dec_tlu_pmu_fw_halted = pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 934:45]
  assign csr_io_lsu_fir_error = io_lsu_fir_error; // @[dec_tlu_ctl.scala 935:45]
  assign csr_io_tlu_flush_lower_r_d1 = tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 936:45]
  assign csr_io_dec_tlu_flush_noredir_r_d1 = dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 937:45]
  assign csr_io_tlu_flush_path_r_d1 = int_exc_io_tlu_flush_path_r_d1; // @[dec_tlu_ctl.scala 938:45]
  assign csr_io_reset_delayed = reset_detect ^ reset_detected; // @[dec_tlu_ctl.scala 939:45]
  assign csr_io_interrupt_valid_r = int_exc_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 940:45]
  assign csr_io_i0_exception_valid_r = int_exc_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 941:45]
  assign csr_io_lsu_exc_valid_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 942:45]
  assign csr_io_mepc_trigger_hit_sel_pc_r = i0_trigger_hit_raw_r & _T_495; // @[dec_tlu_ctl.scala 943:45]
  assign csr_io_lsu_single_ecc_error_r = io_lsu_single_ecc_error_incr; // @[dec_tlu_ctl.scala 944:45]
  assign csr_io_e4e5_int_clk = clock; // @[dec_tlu_ctl.scala 945:45]
  assign csr_io_lsu_i0_exc_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 946:45]
  assign csr_io_inst_acc_r = _T_696 & _T_619; // @[dec_tlu_ctl.scala 947:45]
  assign csr_io_inst_acc_second_r = io_dec_tlu_packet_r_icaf_second; // @[dec_tlu_ctl.scala 948:45]
  assign csr_io_take_nmi = int_exc_io_take_nmi; // @[dec_tlu_ctl.scala 949:45]
  assign csr_io_lsu_error_pkt_addr_r = io_lsu_error_pkt_r_bits_addr; // @[dec_tlu_ctl.scala 950:45]
  assign csr_io_exc_cause_r = int_exc_io_exc_cause_r; // @[dec_tlu_ctl.scala 951:45]
  assign csr_io_i0_valid_wb = int_exc_io_i0_valid_wb; // @[dec_tlu_ctl.scala 952:45]
  assign csr_io_interrupt_valid_r_d1 = int_exc_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 954:45]
  assign csr_io_i0_exception_valid_r_d1 = int_exc_io_i0_exception_valid_r_d1; // @[dec_tlu_ctl.scala 956:45]
  assign csr_io_exc_cause_wb = int_exc_io_exc_cause_wb; // @[dec_tlu_ctl.scala 958:45]
  assign csr_io_nmi_lsu_store_type = _T_95 | _T_97; // @[dec_tlu_ctl.scala 959:45]
  assign csr_io_nmi_lsu_load_type = _T_87 | _T_89; // @[dec_tlu_ctl.scala 960:45]
  assign csr_io_tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 961:45]
  assign csr_io_ebreak_r = _T_654 & _T_590; // @[dec_tlu_ctl.scala 962:45]
  assign csr_io_ecall_r = _T_660 & _T_590; // @[dec_tlu_ctl.scala 963:45]
  assign csr_io_illegal_r = _T_666 & _T_590; // @[dec_tlu_ctl.scala 964:45]
  assign csr_io_nmi_int_detected_f = nmi_int_detected_f; // @[dec_tlu_ctl.scala 966:45]
  assign csr_io_internal_dbg_halt_mode_f2 = internal_dbg_halt_mode_f2; // @[dec_tlu_ctl.scala 967:45]
  assign csr_io_ext_int_freeze = int_exc_io_ext_int_freeze; // @[dec_tlu_ctl.scala 820:32]
  assign csr_io_ic_perr_r = _T_684 & _T_685; // @[dec_tlu_ctl.scala 969:45]
  assign csr_io_iccm_sbecc_r = _T_691 & _T_685; // @[dec_tlu_ctl.scala 970:45]
  assign csr_io_ifu_miss_state_idle_f = ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 972:45]
  assign csr_io_lsu_idle_any_f = lsu_idle_any_f; // @[dec_tlu_ctl.scala 973:45]
  assign csr_io_dbg_tlu_halted_f = dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 974:45]
  assign csr_io_dbg_tlu_halted = _T_242 | _T_244; // @[dec_tlu_ctl.scala 975:45]
  assign csr_io_debug_halt_req_f = debug_halt_req_f; // @[dec_tlu_ctl.scala 976:59]
  assign csr_io_take_ext_int_start = int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 977:55]
  assign csr_io_trigger_hit_dmode_r_d1 = trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 978:43]
  assign csr_io_trigger_hit_r_d1 = int_exc_io_trigger_hit_r_d1; // @[dec_tlu_ctl.scala 979:43]
  assign csr_io_dcsr_single_step_done_f = dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 980:43]
  assign csr_io_ebreak_to_debug_mode_r_d1 = ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 981:45]
  assign csr_io_debug_halt_req = _T_192 & _T_680; // @[dec_tlu_ctl.scala 982:51]
  assign csr_io_allow_dbg_halt_csr_write = debug_mode_status & _T_155; // @[dec_tlu_ctl.scala 983:45]
  assign csr_io_internal_dbg_halt_mode_f = debug_mode_status; // @[dec_tlu_ctl.scala 984:45]
  assign csr_io_enter_debug_halt_req = _T_233 | ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 985:45]
  assign csr_io_internal_dbg_halt_mode = debug_halt_req_ns | _T_238; // @[dec_tlu_ctl.scala 986:45]
  assign csr_io_request_debug_mode_done = _T_261 & _T_214; // @[dec_tlu_ctl.scala 987:45]
  assign csr_io_request_debug_mode_r = _T_258 | _T_260; // @[dec_tlu_ctl.scala 988:45]
  assign csr_io_update_hit_bit_r = _T_485 & _T_492; // @[dec_tlu_ctl.scala 989:45]
  assign csr_io_take_timer_int = int_exc_io_take_timer_int; // @[dec_tlu_ctl.scala 990:45]
  assign csr_io_take_int_timer0_int = int_exc_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 991:45]
  assign csr_io_take_int_timer1_int = int_exc_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 992:45]
  assign csr_io_take_ext_int = int_exc_io_take_ext_int; // @[dec_tlu_ctl.scala 993:45]
  assign csr_io_tlu_flush_lower_r = int_exc_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 994:45]
  assign csr_io_dec_tlu_br0_error_r = _T_635 & _T_611; // @[dec_tlu_ctl.scala 995:45]
  assign csr_io_dec_tlu_br0_start_error_r = _T_638 & _T_611; // @[dec_tlu_ctl.scala 996:45]
  assign csr_io_lsu_pmu_load_external_r = lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 997:45]
  assign csr_io_lsu_pmu_store_external_r = lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 998:45]
  assign csr_io_csr_pkt_csr_misa = csr_read_io_csr_pkt_csr_misa; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mvendorid = csr_read_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_marchid = csr_read_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mimpid = csr_read_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhartid = csr_read_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mstatus = csr_read_io_csr_pkt_csr_mstatus; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtvec = csr_read_io_csr_pkt_csr_mtvec; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mip = csr_read_io_csr_pkt_csr_mip; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mie = csr_read_io_csr_pkt_csr_mie; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcyclel = csr_read_io_csr_pkt_csr_mcyclel; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcycleh = csr_read_io_csr_pkt_csr_mcycleh; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_minstretl = csr_read_io_csr_pkt_csr_minstretl; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_minstreth = csr_read_io_csr_pkt_csr_minstreth; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mscratch = csr_read_io_csr_pkt_csr_mscratch; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mepc = csr_read_io_csr_pkt_csr_mepc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcause = csr_read_io_csr_pkt_csr_mcause; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mscause = csr_read_io_csr_pkt_csr_mscause; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtval = csr_read_io_csr_pkt_csr_mtval; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mrac = csr_read_io_csr_pkt_csr_mrac; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mdseac = csr_read_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meihap = csr_read_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meivt = csr_read_io_csr_pkt_csr_meivt; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meipt = csr_read_io_csr_pkt_csr_meipt; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meicurpl = csr_read_io_csr_pkt_csr_meicurpl; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meicidpl = csr_read_io_csr_pkt_csr_meicidpl; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dcsr = csr_read_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcgc = csr_read_io_csr_pkt_csr_mcgc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mfdc = csr_read_io_csr_pkt_csr_mfdc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dpc = csr_read_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtsel = csr_read_io_csr_pkt_csr_mtsel; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtdata1 = csr_read_io_csr_pkt_csr_mtdata1; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtdata2 = csr_read_io_csr_pkt_csr_mtdata2; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc3 = csr_read_io_csr_pkt_csr_mhpmc3; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc4 = csr_read_io_csr_pkt_csr_mhpmc4; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc5 = csr_read_io_csr_pkt_csr_mhpmc5; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc6 = csr_read_io_csr_pkt_csr_mhpmc6; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc3h = csr_read_io_csr_pkt_csr_mhpmc3h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc4h = csr_read_io_csr_pkt_csr_mhpmc4h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc5h = csr_read_io_csr_pkt_csr_mhpmc5h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc6h = csr_read_io_csr_pkt_csr_mhpmc6h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme3 = csr_read_io_csr_pkt_csr_mhpme3; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme4 = csr_read_io_csr_pkt_csr_mhpme4; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme5 = csr_read_io_csr_pkt_csr_mhpme5; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme6 = csr_read_io_csr_pkt_csr_mhpme6; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcountinhibit = csr_read_io_csr_pkt_csr_mcountinhibit; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mpmc = csr_read_io_csr_pkt_csr_mpmc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_micect = csr_read_io_csr_pkt_csr_micect; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_miccmect = csr_read_io_csr_pkt_csr_miccmect; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mdccmect = csr_read_io_csr_pkt_csr_mdccmect; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mfdht = csr_read_io_csr_pkt_csr_mfdht; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mfdhs = csr_read_io_csr_pkt_csr_mfdhs; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicawics = csr_read_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicad0h = csr_read_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicad0 = csr_read_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicad1 = csr_read_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_trigger_enabled = {_T_412,_T_411}; // @[dec_tlu_ctl.scala 999:45]
  assign int_timers_clock = clock;
  assign int_timers_reset = reset;
  assign int_timers_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 285:65]
  assign int_timers_io_csr_wr_clk = clock; // @[dec_tlu_ctl.scala 321:52]
  assign int_timers_io_dec_csr_wen_r_mod = csr_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 287:49]
  assign int_timers_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 289:49]
  assign int_timers_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 290:49]
  assign int_timers_io_csr_mitctl0 = csr_read_io_csr_pkt_csr_mitctl0; // @[dec_tlu_ctl.scala 291:57]
  assign int_timers_io_csr_mitctl1 = csr_read_io_csr_pkt_csr_mitctl1; // @[dec_tlu_ctl.scala 292:57]
  assign int_timers_io_csr_mitb0 = csr_read_io_csr_pkt_csr_mitb0; // @[dec_tlu_ctl.scala 293:57]
  assign int_timers_io_csr_mitb1 = csr_read_io_csr_pkt_csr_mitb1; // @[dec_tlu_ctl.scala 294:57]
  assign int_timers_io_csr_mitcnt0 = csr_read_io_csr_pkt_csr_mitcnt0; // @[dec_tlu_ctl.scala 295:57]
  assign int_timers_io_csr_mitcnt1 = csr_read_io_csr_pkt_csr_mitcnt1; // @[dec_tlu_ctl.scala 296:57]
  assign int_timers_io_dec_pause_state = io_dec_pause_state; // @[dec_tlu_ctl.scala 297:49]
  assign int_timers_io_dec_tlu_pmu_fw_halted = pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 298:49]
  assign int_timers_io_internal_dbg_halt_timers = int_exc_io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 299:47]
  assign csr_read_io_dec_csr_rdaddr_d = io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 1018:37]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dbg_halt_state_f = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mpc_halt_state_f = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_8 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  syncro_ff = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  debug_mode_status = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  i_cpu_run_req_d1_raw = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  nmi_int_delayed = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  nmi_int_detected_f = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  int_timer0_int_hold_f = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  int_timer1_int_hold_f = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  i_cpu_halt_req_d1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reset_detect = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reset_detected = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  dec_pause_state_f = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  debug_halt_req_f = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  pmu_fw_halt_req_f = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  halt_taken_f = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  ifu_ic_error_start_f = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  debug_resume_req_f_raw = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  dcsr_single_step_running_f = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  dcsr_single_step_done_f = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  internal_pmu_fw_halt_mode_f = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ifu_iccm_rd_ecc_single_err_f = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  iccm_repair_state_d1 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  dbg_halt_req_held = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  trigger_hit_dmode_r_d1 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  ebreak_to_debug_mode_r_d1 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  lsu_idle_any_f = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  ifu_miss_state_idle_f = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  debug_halt_req_d1 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  dec_tlu_flush_noredir_r_d1 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  dec_tlu_flush_pause_r_d1 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  dbg_tlu_halted_f = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  pmu_fw_tlu_halted_f = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  lsu_pmu_load_external_r = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  lsu_pmu_store_external_r = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  tlu_flush_lower_r_d1 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  _T_52 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  internal_dbg_halt_mode_f2 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  _T_59 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  nmi_lsu_load_type_f = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  nmi_lsu_store_type_f = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  mpc_debug_halt_req_sync_f = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  mpc_debug_run_req_sync_f = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  mpc_run_state_f = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  mpc_debug_run_ack_f = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  debug_brkpt_status_f = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  mpc_debug_halt_ack_f = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  dbg_run_state_f = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  _T_143 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  request_debug_mode_r_d1 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  request_debug_mode_done_f = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_286 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  dec_tlu_wr_pause_r_d1 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  _T_512 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  _T_516 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  _T_520 = _RAND_56[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    dbg_halt_state_f = 1'h0;
  end
  if (reset) begin
    mpc_halt_state_f = 1'h0;
  end
  if (reset) begin
    _T_8 = 7'h0;
  end
  if (reset) begin
    syncro_ff = 7'h0;
  end
  if (reset) begin
    debug_mode_status = 1'h0;
  end
  if (reset) begin
    i_cpu_run_req_d1_raw = 1'h0;
  end
  if (reset) begin
    nmi_int_delayed = 1'h0;
  end
  if (reset) begin
    nmi_int_detected_f = 1'h0;
  end
  if (reset) begin
    int_timer0_int_hold_f = 1'h0;
  end
  if (reset) begin
    int_timer1_int_hold_f = 1'h0;
  end
  if (reset) begin
    i_cpu_halt_req_d1 = 1'h0;
  end
  if (reset) begin
    reset_detect = 1'h0;
  end
  if (reset) begin
    reset_detected = 1'h0;
  end
  if (reset) begin
    dec_pause_state_f = 1'h0;
  end
  if (reset) begin
    debug_halt_req_f = 1'h0;
  end
  if (reset) begin
    pmu_fw_halt_req_f = 1'h0;
  end
  if (reset) begin
    halt_taken_f = 1'h0;
  end
  if (reset) begin
    ifu_ic_error_start_f = 1'h0;
  end
  if (reset) begin
    debug_resume_req_f_raw = 1'h0;
  end
  if (reset) begin
    dcsr_single_step_running_f = 1'h0;
  end
  if (reset) begin
    dcsr_single_step_done_f = 1'h0;
  end
  if (reset) begin
    internal_pmu_fw_halt_mode_f = 1'h0;
  end
  if (reset) begin
    ifu_iccm_rd_ecc_single_err_f = 1'h0;
  end
  if (reset) begin
    iccm_repair_state_d1 = 1'h0;
  end
  if (reset) begin
    dbg_halt_req_held = 1'h0;
  end
  if (reset) begin
    trigger_hit_dmode_r_d1 = 1'h0;
  end
  if (reset) begin
    ebreak_to_debug_mode_r_d1 = 1'h0;
  end
  if (reset) begin
    lsu_idle_any_f = 1'h0;
  end
  if (reset) begin
    ifu_miss_state_idle_f = 1'h0;
  end
  if (reset) begin
    debug_halt_req_d1 = 1'h0;
  end
  if (reset) begin
    dec_tlu_flush_noredir_r_d1 = 1'h0;
  end
  if (reset) begin
    dec_tlu_flush_pause_r_d1 = 1'h0;
  end
  if (reset) begin
    dbg_tlu_halted_f = 1'h0;
  end
  if (reset) begin
    pmu_fw_tlu_halted_f = 1'h0;
  end
  if (reset) begin
    lsu_pmu_load_external_r = 1'h0;
  end
  if (reset) begin
    lsu_pmu_store_external_r = 1'h0;
  end
  if (reset) begin
    tlu_flush_lower_r_d1 = 1'h0;
  end
  if (reset) begin
    _T_52 = 1'h0;
  end
  if (reset) begin
    internal_dbg_halt_mode_f2 = 1'h0;
  end
  if (reset) begin
    _T_59 = 1'h0;
  end
  if (reset) begin
    nmi_lsu_load_type_f = 1'h0;
  end
  if (reset) begin
    nmi_lsu_store_type_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_halt_req_sync_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_run_req_sync_f = 1'h0;
  end
  if (reset) begin
    mpc_run_state_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_run_ack_f = 1'h0;
  end
  if (reset) begin
    debug_brkpt_status_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_halt_ack_f = 1'h0;
  end
  if (reset) begin
    dbg_run_state_f = 1'h0;
  end
  if (reset) begin
    _T_143 = 1'h0;
  end
  if (reset) begin
    request_debug_mode_r_d1 = 1'h0;
  end
  if (reset) begin
    request_debug_mode_done_f = 1'h0;
  end
  if (reset) begin
    _T_286 = 1'h0;
  end
  if (reset) begin
    dec_tlu_wr_pause_r_d1 = 1'h0;
  end
  if (reset) begin
    _T_512 = 1'h0;
  end
  if (reset) begin
    _T_516 = 1'h0;
  end
  if (reset) begin
    _T_520 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_halt_state_f <= 1'h0;
    end else if (_T_135) begin
      dbg_halt_state_f <= dbg_halt_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_halt_state_f <= 1'h0;
    end else if (_T_119) begin
      mpc_halt_state_f <= mpc_halt_state_ns;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_8 <= 7'h0;
    end else begin
      _T_8 <= {_T_6,_T_3};
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      syncro_ff <= 7'h0;
    end else begin
      syncro_ff <= _T_8;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_mode_status <= 1'h0;
    end else if (_T_38) begin
      debug_mode_status <= internal_dbg_halt_mode;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      i_cpu_run_req_d1_raw <= 1'h0;
    end else if (_T_507) begin
      i_cpu_run_req_d1_raw <= i_cpu_run_req_sync_qual;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_int_delayed <= 1'h0;
    end else if (_T_61) begin
      nmi_int_delayed <= nmi_int_sync;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_int_detected_f <= 1'h0;
    end else if (_T_64) begin
      nmi_int_detected_f <= nmi_int_detected;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      int_timer0_int_hold_f <= 1'h0;
    end else if (_T_534) begin
      int_timer0_int_hold_f <= int_timer0_int_hold;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      int_timer1_int_hold_f <= 1'h0;
    end else if (_T_538) begin
      int_timer1_int_hold_f <= int_timer1_int_hold;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      i_cpu_halt_req_d1 <= 1'h0;
    end else if (_T_504) begin
      i_cpu_halt_req_d1 <= i_cpu_halt_req_sync_qual;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      reset_detect <= 1'h0;
    end else begin
      reset_detect <= _T_104 | reset_detect;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      reset_detected <= 1'h0;
    end else if (_T_107) begin
      reset_detected <= reset_detect;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_pause_state_f <= 1'h0;
    end else if (_T_311) begin
      dec_pause_state_f <= io_dec_pause_state;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_halt_req_f <= 1'h0;
    end else if (_T_289) begin
      debug_halt_req_f <= debug_halt_req_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      pmu_fw_halt_req_f <= 1'h0;
    end else if (_T_526) begin
      pmu_fw_halt_req_f <= pmu_fw_halt_req_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      halt_taken_f <= 1'h0;
    end else if (_T_269) begin
      halt_taken_f <= halt_taken;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      ifu_ic_error_start_f <= 1'h0;
    end else if (_T_24) begin
      ifu_ic_error_start_f <= io_tlu_mem_ifu_ic_error_start;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_resume_req_f_raw <= 1'h0;
    end else if (_T_293) begin
      debug_resume_req_f_raw <= debug_resume_req;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dcsr_single_step_running_f <= 1'h0;
    end else if (_T_323) begin
      dcsr_single_step_running_f <= dcsr_single_step_running;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dcsr_single_step_done_f <= 1'h0;
    end else if (_T_301) begin
      dcsr_single_step_done_f <= dcsr_single_step_done;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      internal_pmu_fw_halt_mode_f <= 1'h0;
    end else if (_T_522) begin
      internal_pmu_fw_halt_mode_f <= internal_pmu_fw_halt_mode;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      ifu_iccm_rd_ecc_single_err_f <= 1'h0;
    end else if (_T_27) begin
      ifu_iccm_rd_ecc_single_err_f <= io_tlu_mem_ifu_iccm_rd_ecc_single_err;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      iccm_repair_state_d1 <= 1'h0;
    end else if (_T_30) begin
      iccm_repair_state_d1 <= iccm_repair_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_halt_req_held <= 1'h0;
    end else if (_T_331) begin
      dbg_halt_req_held <= dbg_halt_req_held_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      trigger_hit_dmode_r_d1 <= 1'h0;
    end else if (_T_297) begin
      trigger_hit_dmode_r_d1 <= trigger_hit_dmode_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ebreak_to_debug_mode_r_d1 <= 1'h0;
    end else begin
      ebreak_to_debug_mode_r_d1 <= _T_704 & _T_590;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_idle_any_f <= 1'h0;
    end else if (_T_273) begin
      lsu_idle_any_f <= io_lsu_idle_any;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      ifu_miss_state_idle_f <= 1'h0;
    end else if (_T_277) begin
      ifu_miss_state_idle_f <= io_tlu_mem_ifu_miss_state_idle;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_halt_req_d1 <= 1'h0;
    end else if (_T_305) begin
      debug_halt_req_d1 <= debug_halt_req;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_tlu_flush_noredir_r_d1 <= 1'h0;
    end else if (_T_265) begin
      dec_tlu_flush_noredir_r_d1 <= io_tlu_ifc_dec_tlu_flush_noredir_wb;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_tlu_flush_pause_r_d1 <= 1'h0;
    end else if (_T_327) begin
      dec_tlu_flush_pause_r_d1 <= io_dec_tlu_flush_pause_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_tlu_halted_f <= 1'h0;
    end else if (_T_281) begin
      dbg_tlu_halted_f <= dbg_tlu_halted;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      pmu_fw_tlu_halted_f <= 1'h0;
    end else if (_T_530) begin
      pmu_fw_tlu_halted_f <= pmu_fw_tlu_halted;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_load_external_r <= 1'h0;
    end else if (_T_41) begin
      lsu_pmu_load_external_r <= io_lsu_tlu_lsu_pmu_load_external_m;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_store_external_r <= 1'h0;
    end else if (_T_44) begin
      lsu_pmu_store_external_r <= io_lsu_tlu_lsu_pmu_store_external_m;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      tlu_flush_lower_r_d1 <= 1'h0;
    end else if (_T_47) begin
      tlu_flush_lower_r_d1 <= tlu_flush_lower_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_52 <= 1'h0;
    end else if (_T_51) begin
      _T_52 <= tlu_i0_kill_writeb_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      internal_dbg_halt_mode_f2 <= 1'h0;
    end else if (_T_54) begin
      internal_dbg_halt_mode_f2 <= debug_mode_status;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_59 <= 1'h0;
    end else if (_T_58) begin
      _T_59 <= force_halt;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_lsu_load_type_f <= 1'h0;
    end else if (_T_67) begin
      nmi_lsu_load_type_f <= nmi_lsu_load_type;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_lsu_store_type_f <= 1'h0;
    end else if (_T_70) begin
      nmi_lsu_store_type_f <= nmi_lsu_store_type;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_halt_req_sync_f <= 1'h0;
    end else if (_T_112) begin
      mpc_debug_halt_req_sync_f <= mpc_debug_halt_req_sync;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_run_req_sync_f <= 1'h0;
    end else if (_T_115) begin
      mpc_debug_run_req_sync_f <= mpc_debug_run_req_sync;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_run_state_f <= 1'h0;
    end else if (_T_122) begin
      mpc_run_state_f <= mpc_run_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_run_ack_f <= 1'h0;
    end else if (_T_131) begin
      mpc_debug_run_ack_f <= mpc_debug_run_ack_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_brkpt_status_f <= 1'h0;
    end else if (_T_125) begin
      debug_brkpt_status_f <= debug_brkpt_status_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_halt_ack_f <= 1'h0;
    end else if (_T_128) begin
      mpc_debug_halt_ack_f <= mpc_debug_halt_ack_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_run_state_f <= 1'h0;
    end else if (_T_138) begin
      dbg_run_state_f <= dbg_run_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_143 <= 1'h0;
    end else if (_T_142) begin
      _T_143 <= _T_1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      request_debug_mode_r_d1 <= 1'h0;
    end else if (_T_315) begin
      request_debug_mode_r_d1 <= request_debug_mode_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      request_debug_mode_done_f <= 1'h0;
    end else if (_T_319) begin
      request_debug_mode_done_f <= request_debug_mode_done;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_286 <= 1'h0;
    end else if (_T_285) begin
      _T_286 <= resume_ack_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_tlu_wr_pause_r_d1 <= 1'h0;
    end else if (_T_308) begin
      dec_tlu_wr_pause_r_d1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_512 <= 1'h0;
    end else if (_T_511) begin
      _T_512 <= cpu_halt_status;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_516 <= 1'h0;
    end else if (_T_515) begin
      _T_516 <= cpu_halt_ack;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_520 <= 1'h0;
    end else if (_T_519) begin
      _T_520 <= cpu_run_ack;
    end
  end
endmodule
