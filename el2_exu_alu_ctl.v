module el2_exu_alu_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_flush_upper_x,
  input         io_flush_lower_r,
  input         io_enable,
  input         io_valid_in,
  input         io_ap_land,
  input         io_ap_lor,
  input         io_ap_lxor,
  input         io_ap_sll,
  input         io_ap_srl,
  input         io_ap_sra,
  input         io_ap_beq,
  input         io_ap_bne,
  input         io_ap_blt,
  input         io_ap_bge,
  input         io_ap_add,
  input         io_ap_sub,
  input         io_ap_slt,
  input         io_ap_unsign,
  input         io_ap_jal,
  input         io_ap_predict_t,
  input         io_ap_predict_nt,
  input         io_ap_csr_write,
  input         io_ap_csr_imm,
  input         io_csr_ren_in,
  input  [31:0] io_a_in,
  input  [31:0] io_b_in,
  input  [30:0] io_pc_in,
  input         io_pp_in_misp,
  input         io_pp_in_ataken,
  input         io_pp_in_boffset,
  input         io_pp_in_pc4,
  input  [1:0]  io_pp_in_hist,
  input  [11:0] io_pp_in_toffset,
  input         io_pp_in_valid,
  input         io_pp_in_br_error,
  input         io_pp_in_br_start_error,
  input  [31:0] io_pp_in_prett,
  input         io_pp_in_pcall,
  input         io_pp_in_pret,
  input         io_pp_in_pja,
  input         io_pp_in_way,
  input  [11:0] io_brimm_in,
  output [31:0] io_result_ff,
  output        io_flush_upper_out,
  output        io_flush_final_out,
  output [30:0] io_flush_path_out,
  output [30:0] io_pc_ff,
  output        io_pred_correct_out,
  output        io_predict_p_out_misp,
  output        io_predict_p_out_ataken,
  output        io_predict_p_out_boffset,
  output        io_predict_p_out_pc4,
  output [1:0]  io_predict_p_out_hist,
  output [11:0] io_predict_p_out_toffset,
  output        io_predict_p_out_valid,
  output        io_predict_p_out_br_error,
  output        io_predict_p_out_br_start_error,
  output [31:0] io_predict_p_out_prett,
  output        io_predict_p_out_pcall,
  output        io_predict_p_out_pret,
  output        io_predict_p_out_pja,
  output        io_predict_p_out_way
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [30:0] _T; // @[Reg.scala 27:20]
  reg [31:0] _T_1; // @[Reg.scala 27:20]
  wire  _T_180 = io_ap_sll | io_ap_srl; // @[el2_exu_alu_ctl.scala 80:41]
  wire  sel_shift = _T_180 | io_ap_sra; // @[el2_exu_alu_ctl.scala 80:53]
  wire [9:0] _T_87 = {io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [18:0] _T_96 = {_T_87,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [27:0] _T_105 = {_T_96,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [30:0] _T_108 = {_T_105,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [9:0] _T_119 = {io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [18:0] _T_128 = {_T_119,io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [27:0] _T_137 = {_T_128,io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [30:0] _T_140 = {_T_137,io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [30:0] _T_141 = _T_108 & _T_140; // @[el2_exu_alu_ctl.scala 72:44]
  wire [4:0] _T_146 = {io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [9:0] _T_151 = {io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [18:0] _T_160 = {_T_151,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [27:0] _T_169 = {_T_160,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [30:0] _T_172 = {_T_169,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [30:0] _T_174 = _T_172 & io_a_in[30:0]; // @[el2_exu_alu_ctl.scala 72:90]
  wire [30:0] _T_175 = _T_141 | _T_174; // @[el2_exu_alu_ctl.scala 72:68]
  wire [62:0] shift_extend = {_T_175,io_a_in}; // @[Cat.scala 29:58]
  wire [5:0] _T_56 = {1'h0,io_b_in[4:0]}; // @[Cat.scala 29:58]
  wire [5:0] _T_58 = 6'h20 - _T_56; // @[el2_exu_alu_ctl.scala 64:38]
  wire [5:0] _T_65 = io_ap_sll ? _T_58 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_66 = io_ap_srl ? _T_56 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_68 = _T_65 | _T_66; // @[Mux.scala 27:72]
  wire [5:0] _T_67 = io_ap_sra ? _T_56 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] shift_amount = _T_68 | _T_67; // @[Mux.scala 27:72]
  wire [62:0] shift_long = shift_extend >> shift_amount; // @[el2_exu_alu_ctl.scala 75:32]
  wire [4:0] _T_76 = _T_146 & io_b_in[4:0]; // @[el2_exu_alu_ctl.scala 69:55]
  wire [62:0] _T_77 = 63'hffffffff << _T_76; // @[el2_exu_alu_ctl.scala 69:33]
  wire [31:0] shift_mask = _T_77[31:0]; // @[el2_exu_alu_ctl.scala 69:14]
  wire [31:0] sout = shift_long[31:0] & shift_mask; // @[el2_exu_alu_ctl.scala 77:34]
  wire  _T_181 = io_ap_add | io_ap_sub; // @[el2_exu_alu_ctl.scala 81:41]
  wire  _T_182 = ~io_ap_slt; // @[el2_exu_alu_ctl.scala 81:56]
  wire  sel_adder = _T_181 & _T_182; // @[el2_exu_alu_ctl.scala 81:54]
  wire [32:0] _T_5 = {1'h0,io_a_in}; // @[Cat.scala 29:58]
  wire [31:0] _T_6 = ~io_b_in; // @[el2_exu_alu_ctl.scala 43:63]
  wire [32:0] _T_7 = {1'h0,_T_6}; // @[Cat.scala 29:58]
  wire [32:0] _T_9 = _T_5 + _T_7; // @[el2_exu_alu_ctl.scala 43:48]
  wire [32:0] _T_11 = _T_9 + 33'h1; // @[el2_exu_alu_ctl.scala 43:73]
  wire [32:0] _T_18 = io_ap_sub ? _T_11 : 33'h0; // @[Mux.scala 27:72]
  wire  _T_13 = ~io_ap_sub; // @[el2_exu_alu_ctl.scala 44:5]
  wire [32:0] _T_15 = {1'h0,io_b_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_17 = _T_5 + _T_15; // @[el2_exu_alu_ctl.scala 44:48]
  wire [32:0] _T_19 = _T_13 ? _T_17 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] aout = _T_18 | _T_19; // @[Mux.scala 27:72]
  wire  _T_183 = io_ap_jal | io_pp_in_pcall; // @[el2_exu_alu_ctl.scala 82:41]
  wire  _T_184 = _T_183 | io_pp_in_pja; // @[el2_exu_alu_ctl.scala 82:58]
  wire  sel_pc = _T_184 | io_pp_in_pret; // @[el2_exu_alu_ctl.scala 82:73]
  wire [12:0] _T_187 = {io_brimm_in,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_186 = {io_pc_in,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_190 = _T_186[12:1] + _T_187[12:1]; // @[el2_lib.scala 201:31]
  wire  _T_199 = ~_T_190[12]; // @[el2_lib.scala 205:27]
  wire  _T_200 = _T_187[12] ^ _T_199; // @[el2_lib.scala 205:25]
  wire [18:0] _T_211 = _T_200 ? _T_186[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire  _T_203 = ~_T_187[12]; // @[el2_lib.scala 206:8]
  wire  _T_205 = _T_203 & _T_190[12]; // @[el2_lib.scala 206:14]
  wire [18:0] _T_193 = _T_186[31:13] + 19'h1; // @[el2_lib.scala 202:27]
  wire [18:0] _T_212 = _T_205 ? _T_193 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_214 = _T_211 | _T_212; // @[Mux.scala 27:72]
  wire  _T_209 = _T_187[12] & _T_199; // @[el2_lib.scala 207:13]
  wire [18:0] _T_196 = _T_186[31:13] - 19'h1; // @[el2_lib.scala 203:27]
  wire [18:0] _T_213 = _T_209 ? _T_196 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_215 = _T_214 | _T_213; // @[Mux.scala 27:72]
  wire [31:0] pcout = {_T_215,_T_190[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_35 = ~io_ap_unsign; // @[el2_exu_alu_ctl.scala 53:30]
  wire  neg = aout[31]; // @[el2_exu_alu_ctl.scala 52:34]
  wire  _T_23 = ~io_a_in[31]; // @[el2_exu_alu_ctl.scala 48:14]
  wire [31:0] bm = io_ap_sub ? _T_6 : io_b_in; // @[el2_exu_alu_ctl.scala 39:17]
  wire  _T_25 = ~bm[31]; // @[el2_exu_alu_ctl.scala 48:29]
  wire  _T_26 = _T_23 & _T_25; // @[el2_exu_alu_ctl.scala 48:27]
  wire  _T_28 = _T_26 & neg; // @[el2_exu_alu_ctl.scala 48:37]
  wire  _T_31 = io_a_in[31] & bm[31]; // @[el2_exu_alu_ctl.scala 48:66]
  wire  _T_33 = ~neg; // @[el2_exu_alu_ctl.scala 48:78]
  wire  _T_34 = _T_31 & _T_33; // @[el2_exu_alu_ctl.scala 48:76]
  wire  ov = _T_28 | _T_34; // @[el2_exu_alu_ctl.scala 48:50]
  wire  _T_36 = neg ^ ov; // @[el2_exu_alu_ctl.scala 53:51]
  wire  _T_37 = _T_35 & _T_36; // @[el2_exu_alu_ctl.scala 53:44]
  wire  cout = aout[32]; // @[el2_exu_alu_ctl.scala 46:18]
  wire  _T_38 = ~cout; // @[el2_exu_alu_ctl.scala 53:78]
  wire  _T_39 = io_ap_unsign & _T_38; // @[el2_exu_alu_ctl.scala 53:76]
  wire  lt = _T_37 | _T_39; // @[el2_exu_alu_ctl.scala 53:58]
  wire  slt_one = io_ap_slt & lt; // @[el2_exu_alu_ctl.scala 85:40]
  wire [31:0] _T_228 = {31'h0,slt_one}; // @[Cat.scala 29:58]
  wire [31:0] _T_47 = io_csr_ren_in ? io_b_in : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_42 = io_a_in & io_b_in; // @[el2_exu_alu_ctl.scala 59:39]
  wire [31:0] _T_48 = io_ap_land ? _T_42 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_51 = _T_47 | _T_48; // @[Mux.scala 27:72]
  wire [31:0] _T_44 = io_a_in | io_b_in; // @[el2_exu_alu_ctl.scala 60:39]
  wire [31:0] _T_49 = io_ap_lor ? _T_44 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_52 = _T_51 | _T_49; // @[Mux.scala 27:72]
  wire [31:0] _T_46 = io_a_in ^ io_b_in; // @[el2_exu_alu_ctl.scala 61:39]
  wire [31:0] _T_50 = io_ap_lxor ? _T_46 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lout = _T_52 | _T_50; // @[Mux.scala 27:72]
  wire  eq = io_a_in == io_b_in; // @[el2_exu_alu_ctl.scala 50:38]
  wire  ne = ~eq; // @[el2_exu_alu_ctl.scala 51:29]
  wire  ge = ~lt; // @[el2_exu_alu_ctl.scala 54:29]
  wire  _T_236 = io_ap_beq & eq; // @[el2_exu_alu_ctl.scala 105:40]
  wire  _T_237 = io_ap_bne & ne; // @[el2_exu_alu_ctl.scala 105:59]
  wire  _T_238 = _T_236 | _T_237; // @[el2_exu_alu_ctl.scala 105:46]
  wire  _T_239 = io_ap_blt & lt; // @[el2_exu_alu_ctl.scala 105:85]
  wire  _T_240 = _T_238 | _T_239; // @[el2_exu_alu_ctl.scala 105:72]
  wire  _T_241 = io_ap_bge & ge; // @[el2_exu_alu_ctl.scala 105:104]
  wire  _T_242 = _T_240 | _T_241; // @[el2_exu_alu_ctl.scala 105:91]
  wire  actual_taken = _T_242 | sel_pc; // @[el2_exu_alu_ctl.scala 105:110]
  wire  _T_243 = io_valid_in & io_ap_predict_nt; // @[el2_exu_alu_ctl.scala 110:42]
  wire  _T_244 = ~actual_taken; // @[el2_exu_alu_ctl.scala 110:63]
  wire  _T_245 = _T_243 & _T_244; // @[el2_exu_alu_ctl.scala 110:61]
  wire  _T_246 = ~sel_pc; // @[el2_exu_alu_ctl.scala 110:79]
  wire  _T_247 = _T_245 & _T_246; // @[el2_exu_alu_ctl.scala 110:77]
  wire  _T_248 = io_valid_in & io_ap_predict_t; // @[el2_exu_alu_ctl.scala 110:104]
  wire  _T_249 = _T_248 & actual_taken; // @[el2_exu_alu_ctl.scala 110:123]
  wire  _T_251 = _T_249 & _T_246; // @[el2_exu_alu_ctl.scala 110:139]
  wire  _T_258 = io_ap_predict_t & _T_244; // @[el2_exu_alu_ctl.scala 115:45]
  wire  _T_259 = io_ap_predict_nt & actual_taken; // @[el2_exu_alu_ctl.scala 115:82]
  wire  cond_mispredict = _T_258 | _T_259; // @[el2_exu_alu_ctl.scala 115:62]
  wire  _T_262 = io_pp_in_prett[31:1] != aout[31:1]; // @[el2_exu_alu_ctl.scala 118:68]
  wire  target_mispredict = io_pp_in_pret & _T_262; // @[el2_exu_alu_ctl.scala 118:44]
  wire  _T_263 = io_ap_jal | cond_mispredict; // @[el2_exu_alu_ctl.scala 120:42]
  wire  _T_264 = _T_263 | target_mispredict; // @[el2_exu_alu_ctl.scala 120:60]
  wire  _T_265 = _T_264 & io_valid_in; // @[el2_exu_alu_ctl.scala 120:81]
  wire  _T_266 = ~io_flush_upper_x; // @[el2_exu_alu_ctl.scala 120:97]
  wire  _T_267 = _T_265 & _T_266; // @[el2_exu_alu_ctl.scala 120:95]
  wire  _T_268 = ~io_flush_lower_r; // @[el2_exu_alu_ctl.scala 120:119]
  wire  _T_278 = io_pp_in_hist[1] & io_pp_in_hist[0]; // @[el2_exu_alu_ctl.scala 126:39]
  wire  _T_280 = ~io_pp_in_hist[0]; // @[el2_exu_alu_ctl.scala 126:63]
  wire  _T_281 = _T_280 & actual_taken; // @[el2_exu_alu_ctl.scala 126:81]
  wire  _T_282 = _T_278 | _T_281; // @[el2_exu_alu_ctl.scala 126:60]
  wire  _T_284 = ~io_pp_in_hist[1]; // @[el2_exu_alu_ctl.scala 127:6]
  wire  _T_286 = _T_284 & _T_244; // @[el2_exu_alu_ctl.scala 127:24]
  wire  _T_288 = io_pp_in_hist[1] & actual_taken; // @[el2_exu_alu_ctl.scala 127:62]
  wire  _T_289 = _T_286 | _T_288; // @[el2_exu_alu_ctl.scala 127:42]
  wire  _T_293 = _T_266 & _T_268; // @[el2_exu_alu_ctl.scala 130:51]
  wire  _T_294 = cond_mispredict | target_mispredict; // @[el2_exu_alu_ctl.scala 130:90]
  assign io_result_ff = _T_1; // @[el2_exu_alu_ctl.scala 37:16]
  assign io_flush_upper_out = _T_267 & _T_268; // @[el2_exu_alu_ctl.scala 120:26]
  assign io_flush_final_out = _T_267 | io_flush_lower_r; // @[el2_exu_alu_ctl.scala 122:26]
  assign io_flush_path_out = sel_pc ? aout[31:1] : pcout[31:1]; // @[el2_exu_alu_ctl.scala 112:22]
  assign io_pc_ff = _T; // @[el2_exu_alu_ctl.scala 35:12]
  assign io_pred_correct_out = _T_247 | _T_251; // @[el2_exu_alu_ctl.scala 110:26]
  assign io_predict_p_out_misp = _T_293 & _T_294; // @[el2_exu_alu_ctl.scala 129:30 el2_exu_alu_ctl.scala 130:30]
  assign io_predict_p_out_ataken = _T_242 | sel_pc; // @[el2_exu_alu_ctl.scala 129:30 el2_exu_alu_ctl.scala 131:30]
  assign io_predict_p_out_boffset = io_pp_in_boffset; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_pc4 = io_pp_in_pc4; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_hist = {_T_282,_T_289}; // @[el2_exu_alu_ctl.scala 129:30 el2_exu_alu_ctl.scala 132:30]
  assign io_predict_p_out_toffset = io_pp_in_toffset; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_valid = io_pp_in_valid; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_br_error = io_pp_in_br_error; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_br_start_error = io_pp_in_br_start_error; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_prett = io_pp_in_prett; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_pcall = io_pp_in_pcall; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_pret = io_pp_in_pret; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_pja = io_pp_in_pja; // @[el2_exu_alu_ctl.scala 129:30]
  assign io_predict_p_out_way = io_pp_in_way; // @[el2_exu_alu_ctl.scala 129:30]
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
  _T = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1 = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      _T <= 31'h0;
    end else if (io_enable) begin
      _T <= io_pc_in;
    end
    if (reset) begin
      _T_1 <= 32'h0;
    end else if (io_enable) begin
      if (sel_shift) begin
        _T_1 <= sout;
      end else if (sel_adder) begin
        _T_1 <= aout[31:0];
      end else if (sel_pc) begin
        _T_1 <= pcout;
      end else if (io_ap_csr_write) begin
        if (io_ap_csr_imm) begin
          _T_1 <= io_b_in;
        end else begin
          _T_1 <= io_a_in;
        end
      end else if (slt_one) begin
        _T_1 <= _T_228;
      end else begin
        _T_1 <= lout;
      end
    end
  end
endmodule
