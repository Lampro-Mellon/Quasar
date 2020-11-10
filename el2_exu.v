module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 474:26]
  wire  clkhdr_CK; // @[el2_lib.scala 474:26]
  wire  clkhdr_EN; // @[el2_lib.scala 474:26]
  wire  clkhdr_SE; // @[el2_lib.scala 474:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 474:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 475:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 476:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 477:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 478:18]
endmodule
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
  input         io_pp_in_boffset,
  input         io_pp_in_pc4,
  input  [1:0]  io_pp_in_hist,
  input  [11:0] io_pp_in_toffset,
  input         io_pp_in_valid,
  input         io_pp_in_br_error,
  input         io_pp_in_br_start_error,
  input  [30:0] io_pp_in_prett,
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
  output        io_predict_p_out_pcall,
  output        io_predict_p_out_pret,
  output        io_predict_p_out_pja,
  output        io_predict_p_out_way
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [30:0] _T_1; // @[el2_lib.scala 514:16]
  reg [31:0] _T_3; // @[el2_lib.scala 514:16]
  wire [31:0] _T_5 = ~io_b_in; // @[el2_exu_alu_ctl.scala 39:37]
  wire [31:0] bm = io_ap_sub ? _T_5 : io_b_in; // @[el2_exu_alu_ctl.scala 39:17]
  wire [32:0] _T_8 = {1'h0,io_a_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_10 = {1'h0,_T_5}; // @[Cat.scala 29:58]
  wire [32:0] _T_12 = _T_8 + _T_10; // @[el2_exu_alu_ctl.scala 42:55]
  wire [32:0] _T_13 = {32'h0,io_ap_sub}; // @[Cat.scala 29:58]
  wire [32:0] _T_15 = _T_12 + _T_13; // @[el2_exu_alu_ctl.scala 42:80]
  wire [32:0] _T_18 = {1'h0,io_b_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_20 = _T_8 + _T_18; // @[el2_exu_alu_ctl.scala 42:132]
  wire [32:0] _T_23 = _T_20 + _T_13; // @[el2_exu_alu_ctl.scala 42:157]
  wire [32:0] aout = io_ap_sub ? _T_15 : _T_23; // @[el2_exu_alu_ctl.scala 42:14]
  wire  cout = aout[32]; // @[el2_exu_alu_ctl.scala 43:18]
  wire  _T_26 = ~io_a_in[31]; // @[el2_exu_alu_ctl.scala 45:14]
  wire  _T_28 = ~bm[31]; // @[el2_exu_alu_ctl.scala 45:29]
  wire  _T_29 = _T_26 & _T_28; // @[el2_exu_alu_ctl.scala 45:27]
  wire  _T_31 = _T_29 & aout[31]; // @[el2_exu_alu_ctl.scala 45:37]
  wire  _T_34 = io_a_in[31] & bm[31]; // @[el2_exu_alu_ctl.scala 45:66]
  wire  _T_36 = ~aout[31]; // @[el2_exu_alu_ctl.scala 45:78]
  wire  _T_37 = _T_34 & _T_36; // @[el2_exu_alu_ctl.scala 45:76]
  wire  ov = _T_31 | _T_37; // @[el2_exu_alu_ctl.scala 45:50]
  wire  eq = $signed(io_a_in) == $signed(io_b_in); // @[el2_exu_alu_ctl.scala 47:38]
  wire  ne = ~eq; // @[el2_exu_alu_ctl.scala 48:29]
  wire  _T_39 = ~io_ap_unsign; // @[el2_exu_alu_ctl.scala 50:30]
  wire  _T_40 = aout[31] ^ ov; // @[el2_exu_alu_ctl.scala 50:51]
  wire  _T_41 = _T_39 & _T_40; // @[el2_exu_alu_ctl.scala 50:44]
  wire  _T_42 = ~cout; // @[el2_exu_alu_ctl.scala 50:78]
  wire  _T_43 = io_ap_unsign & _T_42; // @[el2_exu_alu_ctl.scala 50:76]
  wire  lt = _T_41 | _T_43; // @[el2_exu_alu_ctl.scala 50:58]
  wire  ge = ~lt; // @[el2_exu_alu_ctl.scala 51:29]
  wire [31:0] _T_63 = $signed(io_a_in) & $signed(io_b_in); // @[Mux.scala 27:72]
  wire [31:0] _T_66 = $signed(io_a_in) | $signed(io_b_in); // @[Mux.scala 27:72]
  wire [31:0] _T_69 = $signed(io_a_in) ^ $signed(io_b_in); // @[Mux.scala 27:72]
  wire [31:0] _T_70 = io_csr_ren_in ? $signed(io_b_in) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_71 = io_ap_land ? $signed(_T_63) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_72 = io_ap_lor ? $signed(_T_66) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_73 = io_ap_lxor ? $signed(_T_69) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_75 = $signed(_T_70) | $signed(_T_71); // @[Mux.scala 27:72]
  wire [31:0] _T_77 = $signed(_T_75) | $signed(_T_72); // @[Mux.scala 27:72]
  wire [5:0] _T_84 = {1'h0,io_b_in[4:0]}; // @[Cat.scala 29:58]
  wire [5:0] _T_86 = 6'h20 - _T_84; // @[el2_exu_alu_ctl.scala 61:38]
  wire [5:0] _T_93 = io_ap_sll ? _T_86 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_94 = io_ap_srl ? _T_84 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_95 = io_ap_sra ? _T_84 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_96 = _T_93 | _T_94; // @[Mux.scala 27:72]
  wire [5:0] shift_amount = _T_96 | _T_95; // @[Mux.scala 27:72]
  wire [4:0] _T_102 = {io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [4:0] _T_104 = _T_102 & io_b_in[4:0]; // @[el2_exu_alu_ctl.scala 66:61]
  wire [62:0] _T_105 = 63'hffffffff << _T_104; // @[el2_exu_alu_ctl.scala 66:39]
  wire [9:0] _T_115 = {io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [18:0] _T_124 = {_T_115,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [27:0] _T_133 = {_T_124,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [30:0] _T_136 = {_T_133,io_ap_sra,io_ap_sra,io_ap_sra}; // @[Cat.scala 29:58]
  wire [9:0] _T_147 = {io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [18:0] _T_156 = {_T_147,io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [27:0] _T_165 = {_T_156,io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [30:0] _T_168 = {_T_165,io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [30:0] _T_169 = _T_136 & _T_168; // @[el2_exu_alu_ctl.scala 69:44]
  wire [9:0] _T_179 = {io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [18:0] _T_188 = {_T_179,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [27:0] _T_197 = {_T_188,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [30:0] _T_200 = {_T_197,io_ap_sll,io_ap_sll,io_ap_sll}; // @[Cat.scala 29:58]
  wire [30:0] _T_202 = _T_200 & io_a_in[30:0]; // @[el2_exu_alu_ctl.scala 69:90]
  wire [30:0] _T_203 = _T_169 | _T_202; // @[el2_exu_alu_ctl.scala 69:68]
  wire [62:0] shift_extend = {_T_203,io_a_in}; // @[Cat.scala 29:58]
  wire [62:0] shift_long = shift_extend >> shift_amount[4:0]; // @[el2_exu_alu_ctl.scala 72:32]
  wire [31:0] shift_mask = _T_105[31:0]; // @[el2_exu_alu_ctl.scala 66:14]
  wire [31:0] sout = shift_long[31:0] & shift_mask; // @[el2_exu_alu_ctl.scala 74:34]
  wire  _T_210 = io_ap_sll | io_ap_srl; // @[el2_exu_alu_ctl.scala 77:41]
  wire  sel_shift = _T_210 | io_ap_sra; // @[el2_exu_alu_ctl.scala 77:53]
  wire  _T_211 = io_ap_add | io_ap_sub; // @[el2_exu_alu_ctl.scala 78:41]
  wire  _T_212 = ~io_ap_slt; // @[el2_exu_alu_ctl.scala 78:56]
  wire  sel_adder = _T_211 & _T_212; // @[el2_exu_alu_ctl.scala 78:54]
  wire  _T_213 = io_ap_jal | io_pp_in_pcall; // @[el2_exu_alu_ctl.scala 79:41]
  wire  _T_214 = _T_213 | io_pp_in_pja; // @[el2_exu_alu_ctl.scala 79:58]
  wire  sel_pc = _T_214 | io_pp_in_pret; // @[el2_exu_alu_ctl.scala 79:73]
  wire  slt_one = io_ap_slt & lt; // @[el2_exu_alu_ctl.scala 82:40]
  wire [31:0] _T_217 = {io_pc_in,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_218 = {io_brimm_in,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_221 = _T_217[12:1] + _T_218[12:1]; // @[el2_lib.scala 208:31]
  wire [18:0] _T_224 = _T_217[31:13] + 19'h1; // @[el2_lib.scala 209:27]
  wire [18:0] _T_227 = _T_217[31:13] - 19'h1; // @[el2_lib.scala 210:27]
  wire  _T_230 = ~_T_221[12]; // @[el2_lib.scala 212:28]
  wire  _T_231 = _T_218[12] ^ _T_230; // @[el2_lib.scala 212:26]
  wire  _T_234 = ~_T_218[12]; // @[el2_lib.scala 213:20]
  wire  _T_236 = _T_234 & _T_221[12]; // @[el2_lib.scala 213:26]
  wire  _T_240 = _T_218[12] & _T_230; // @[el2_lib.scala 214:26]
  wire [18:0] _T_242 = _T_231 ? _T_217[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_243 = _T_236 ? _T_224 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_244 = _T_240 ? _T_227 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_245 = _T_242 | _T_243; // @[Mux.scala 27:72]
  wire [18:0] _T_246 = _T_245 | _T_244; // @[Mux.scala 27:72]
  wire [31:0] pcout = {_T_246,_T_221[11:0],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_250 = $signed(_T_77) | $signed(_T_73); // @[el2_exu_alu_ctl.scala 88:24]
  wire [31:0] _T_251 = {31'h0,slt_one}; // @[Cat.scala 29:58]
  wire [31:0] _T_252 = _T_250 | _T_251; // @[el2_exu_alu_ctl.scala 88:31]
  wire [31:0] _T_259 = io_ap_csr_imm ? $signed(io_b_in) : $signed(io_a_in); // @[el2_exu_alu_ctl.scala 92:51]
  wire [31:0] _T_260 = sel_shift ? sout : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_261 = sel_adder ? aout[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_262 = sel_pc ? pcout : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_263 = io_ap_csr_write ? _T_259 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_264 = _T_260 | _T_261; // @[Mux.scala 27:72]
  wire [31:0] _T_265 = _T_264 | _T_262; // @[Mux.scala 27:72]
  wire [31:0] _T_266 = _T_265 | _T_263; // @[Mux.scala 27:72]
  wire  _T_271 = io_ap_beq & eq; // @[el2_exu_alu_ctl.scala 101:40]
  wire  _T_272 = io_ap_bne & ne; // @[el2_exu_alu_ctl.scala 101:59]
  wire  _T_273 = _T_271 | _T_272; // @[el2_exu_alu_ctl.scala 101:46]
  wire  _T_274 = io_ap_blt & lt; // @[el2_exu_alu_ctl.scala 101:85]
  wire  _T_275 = _T_273 | _T_274; // @[el2_exu_alu_ctl.scala 101:72]
  wire  _T_276 = io_ap_bge & ge; // @[el2_exu_alu_ctl.scala 101:104]
  wire  _T_277 = _T_275 | _T_276; // @[el2_exu_alu_ctl.scala 101:91]
  wire  actual_taken = _T_277 | sel_pc; // @[el2_exu_alu_ctl.scala 101:110]
  wire  _T_278 = io_valid_in & io_ap_predict_nt; // @[el2_exu_alu_ctl.scala 106:42]
  wire  _T_279 = ~actual_taken; // @[el2_exu_alu_ctl.scala 106:63]
  wire  _T_280 = _T_278 & _T_279; // @[el2_exu_alu_ctl.scala 106:61]
  wire  _T_281 = ~sel_pc; // @[el2_exu_alu_ctl.scala 106:79]
  wire  _T_282 = _T_280 & _T_281; // @[el2_exu_alu_ctl.scala 106:77]
  wire  _T_283 = io_valid_in & io_ap_predict_t; // @[el2_exu_alu_ctl.scala 106:104]
  wire  _T_284 = _T_283 & actual_taken; // @[el2_exu_alu_ctl.scala 106:123]
  wire  _T_286 = _T_284 & _T_281; // @[el2_exu_alu_ctl.scala 106:139]
  wire  _T_293 = io_ap_predict_t & _T_279; // @[el2_exu_alu_ctl.scala 111:45]
  wire  _T_294 = io_ap_predict_nt & actual_taken; // @[el2_exu_alu_ctl.scala 111:82]
  wire  cond_mispredict = _T_293 | _T_294; // @[el2_exu_alu_ctl.scala 111:62]
  wire  _T_296 = io_pp_in_prett != aout[31:1]; // @[el2_exu_alu_ctl.scala 114:62]
  wire  target_mispredict = io_pp_in_pret & _T_296; // @[el2_exu_alu_ctl.scala 114:44]
  wire  _T_297 = io_ap_jal | cond_mispredict; // @[el2_exu_alu_ctl.scala 116:42]
  wire  _T_298 = _T_297 | target_mispredict; // @[el2_exu_alu_ctl.scala 116:60]
  wire  _T_299 = _T_298 & io_valid_in; // @[el2_exu_alu_ctl.scala 116:81]
  wire  _T_300 = ~io_flush_upper_x; // @[el2_exu_alu_ctl.scala 116:97]
  wire  _T_301 = _T_299 & _T_300; // @[el2_exu_alu_ctl.scala 116:95]
  wire  _T_302 = ~io_flush_lower_r; // @[el2_exu_alu_ctl.scala 116:119]
  wire  _T_312 = io_pp_in_hist[1] & io_pp_in_hist[0]; // @[el2_exu_alu_ctl.scala 122:39]
  wire  _T_314 = ~io_pp_in_hist[0]; // @[el2_exu_alu_ctl.scala 122:63]
  wire  _T_315 = _T_314 & actual_taken; // @[el2_exu_alu_ctl.scala 122:81]
  wire  _T_316 = _T_312 | _T_315; // @[el2_exu_alu_ctl.scala 122:60]
  wire  _T_318 = ~io_pp_in_hist[1]; // @[el2_exu_alu_ctl.scala 123:6]
  wire  _T_320 = _T_318 & _T_279; // @[el2_exu_alu_ctl.scala 123:24]
  wire  _T_322 = io_pp_in_hist[1] & actual_taken; // @[el2_exu_alu_ctl.scala 123:62]
  wire  _T_323 = _T_320 | _T_322; // @[el2_exu_alu_ctl.scala 123:42]
  wire  _T_327 = _T_300 & _T_302; // @[el2_exu_alu_ctl.scala 126:51]
  wire  _T_328 = cond_mispredict | target_mispredict; // @[el2_exu_alu_ctl.scala 126:90]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_result_ff = _T_3; // @[el2_exu_alu_ctl.scala 37:16]
  assign io_flush_upper_out = _T_301 & _T_302; // @[el2_exu_alu_ctl.scala 116:26]
  assign io_flush_final_out = _T_301 | io_flush_lower_r; // @[el2_exu_alu_ctl.scala 118:26]
  assign io_flush_path_out = sel_pc ? aout[31:1] : pcout[31:1]; // @[el2_exu_alu_ctl.scala 108:22]
  assign io_pc_ff = _T_1; // @[el2_exu_alu_ctl.scala 35:12]
  assign io_pred_correct_out = _T_282 | _T_286; // @[el2_exu_alu_ctl.scala 106:26]
  assign io_predict_p_out_misp = _T_327 & _T_328; // @[el2_exu_alu_ctl.scala 125:30 el2_exu_alu_ctl.scala 126:30]
  assign io_predict_p_out_ataken = _T_277 | sel_pc; // @[el2_exu_alu_ctl.scala 125:30 el2_exu_alu_ctl.scala 127:30]
  assign io_predict_p_out_boffset = io_pp_in_boffset; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_pc4 = io_pp_in_pc4; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_hist = {_T_316,_T_323}; // @[el2_exu_alu_ctl.scala 125:30 el2_exu_alu_ctl.scala 128:30]
  assign io_predict_p_out_toffset = io_pp_in_toffset; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_valid = io_pp_in_valid; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_br_error = io_pp_in_br_error; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_br_start_error = io_pp_in_br_start_error; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_pcall = io_pp_in_pcall; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_pret = io_pp_in_pret; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_pja = io_pp_in_pja; // @[el2_exu_alu_ctl.scala 125:30]
  assign io_predict_p_out_way = io_pp_in_way; // @[el2_exu_alu_ctl.scala 125:30]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_enable; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = io_enable; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  _T_1 = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  _T_3 = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1 = 31'h0;
  end
  if (reset) begin
    _T_3 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1 <= 31'h0;
    end else begin
      _T_1 <= io_pc_in;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_3 <= 32'h0;
    end else begin
      _T_3 <= _T_252 | _T_266;
    end
  end
endmodule
module el2_exu_mul_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_mul_p_valid,
  input         io_mul_p_rs1_sign,
  input         io_mul_p_rs2_sign,
  input         io_mul_p_low,
  input  [31:0] io_rs1_in,
  input  [31:0] io_rs2_in,
  output [31:0] io_result_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 528:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 528:23]
  wire  _T_1 = io_mul_p_rs1_sign & io_rs1_in[31]; // @[el2_exu_mul_ctl.scala 26:39]
  wire  _T_5 = io_mul_p_rs2_sign & io_rs2_in[31]; // @[el2_exu_mul_ctl.scala 27:39]
  reg  low_x; // @[el2_lib.scala 514:16]
  reg [32:0] rs1_x; // @[el2_lib.scala 534:16]
  reg [32:0] rs2_x; // @[el2_lib.scala 534:16]
  wire [65:0] prod_x = $signed(rs1_x) * $signed(rs2_x); // @[el2_exu_mul_ctl.scala 40:20]
  wire  _T_16 = ~low_x; // @[el2_exu_mul_ctl.scala 41:29]
  wire [31:0] _T_20 = _T_16 ? prod_x[63:32] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_21 = low_x ? prod_x[31:0] : 32'h0; // @[Mux.scala 27:72]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 528:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 528:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  assign io_result_x = _T_20 | _T_21; // @[el2_exu_mul_ctl.scala 41:15]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_mul_p_valid; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 530:18]
  assign rvclkhdr_1_io_en = io_mul_p_valid; // @[el2_lib.scala 531:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 532:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 530:18]
  assign rvclkhdr_2_io_en = io_mul_p_valid; // @[el2_lib.scala 531:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 532:24]
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
  low_x = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  rs1_x = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  rs2_x = _RAND_2[32:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    low_x = 1'h0;
  end
  if (reset) begin
    rs1_x = 33'sh0;
  end
  if (reset) begin
    rs2_x = 33'sh0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      low_x <= 1'h0;
    end else begin
      low_x <= io_mul_p_low;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      rs1_x <= 33'sh0;
    end else begin
      rs1_x <= {_T_1,io_rs1_in};
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      rs2_x <= 33'sh0;
    end else begin
      rs2_x <= {_T_5,io_rs2_in};
    end
  end
endmodule
module el2_exu_div_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dp_valid,
  input         io_dp_unsign,
  input         io_dp_rem,
  input  [31:0] io_dividend,
  input  [31:0] io_divisor,
  input         io_cancel,
  output [31:0] io_out,
  output        io_finish_dly
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  _T = ~io_cancel; // @[el2_exu_div_ctl.scala 54:30]
  reg  valid_ff_x; // @[el2_exu_div_ctl.scala 204:26]
  wire  valid_x = valid_ff_x & _T; // @[el2_exu_div_ctl.scala 54:28]
  reg [32:0] q_ff; // @[el2_lib.scala 514:16]
  wire  _T_2 = q_ff[31:4] == 28'h0; // @[el2_exu_div_ctl.scala 60:34]
  reg [32:0] m_ff; // @[el2_lib.scala 514:16]
  wire  _T_4 = m_ff[31:4] == 28'h0; // @[el2_exu_div_ctl.scala 60:57]
  wire  _T_5 = _T_2 & _T_4; // @[el2_exu_div_ctl.scala 60:43]
  wire  _T_7 = m_ff[31:0] != 32'h0; // @[el2_exu_div_ctl.scala 60:80]
  wire  _T_8 = _T_5 & _T_7; // @[el2_exu_div_ctl.scala 60:66]
  reg  rem_ff; // @[Reg.scala 27:20]
  wire  _T_9 = ~rem_ff; // @[el2_exu_div_ctl.scala 60:91]
  wire  _T_10 = _T_8 & _T_9; // @[el2_exu_div_ctl.scala 60:89]
  wire  _T_11 = _T_10 & valid_x; // @[el2_exu_div_ctl.scala 60:99]
  wire  _T_13 = q_ff[31:0] == 32'h0; // @[el2_exu_div_ctl.scala 61:18]
  wire  _T_16 = _T_13 & _T_7; // @[el2_exu_div_ctl.scala 61:27]
  wire  _T_18 = _T_16 & _T_9; // @[el2_exu_div_ctl.scala 61:50]
  wire  _T_19 = _T_18 & valid_x; // @[el2_exu_div_ctl.scala 61:60]
  wire  smallnum_case = _T_11 | _T_19; // @[el2_exu_div_ctl.scala 60:110]
  wire  pat1 = q_ff[3]; // @[el2_exu_div_ctl.scala 64:57]
  wire  _T_22 = ~m_ff[3]; // @[el2_exu_div_ctl.scala 65:69]
  wire  _T_24 = ~m_ff[2]; // @[el2_exu_div_ctl.scala 65:69]
  wire  _T_26 = ~m_ff[1]; // @[el2_exu_div_ctl.scala 65:69]
  wire  _T_27 = _T_22 & _T_24; // @[el2_exu_div_ctl.scala 65:94]
  wire  pat2 = _T_27 & _T_26; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_28 = pat1 & pat2; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_33 = pat1 & _T_27; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_35 = ~m_ff[0]; // @[el2_exu_div_ctl.scala 72:32]
  wire  _T_36 = _T_33 & _T_35; // @[el2_exu_div_ctl.scala 72:30]
  wire  pat1_2 = q_ff[2]; // @[el2_exu_div_ctl.scala 64:57]
  wire  _T_44 = pat1_2 & pat2; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_45 = _T_36 | _T_44; // @[el2_exu_div_ctl.scala 72:41]
  wire  pat1_3 = pat1 & pat1_2; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_52 = pat1_3 & _T_27; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_53 = _T_45 | _T_52; // @[el2_exu_div_ctl.scala 72:73]
  wire  _T_58 = pat1_2 & _T_27; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_61 = _T_58 & _T_35; // @[el2_exu_div_ctl.scala 74:30]
  wire  pat1_5 = q_ff[1]; // @[el2_exu_div_ctl.scala 64:57]
  wire  _T_69 = pat1_5 & pat2; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_70 = _T_61 | _T_69; // @[el2_exu_div_ctl.scala 74:41]
  wire  pat2_6 = _T_22 & _T_26; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_75 = pat1 & pat2_6; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_78 = _T_75 & _T_35; // @[el2_exu_div_ctl.scala 74:103]
  wire  _T_79 = _T_70 | _T_78; // @[el2_exu_div_ctl.scala 74:76]
  wire  _T_82 = ~pat1_2; // @[el2_exu_div_ctl.scala 64:69]
  wire  pat1_7 = pat1 & _T_82; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_90 = _T_27 & m_ff[1]; // @[el2_exu_div_ctl.scala 65:94]
  wire  pat2_7 = _T_90 & m_ff[0]; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_91 = pat1_7 & pat2_7; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_92 = _T_79 | _T_91; // @[el2_exu_div_ctl.scala 74:114]
  wire  _T_94 = ~pat1; // @[el2_exu_div_ctl.scala 64:69]
  wire  _T_97 = _T_94 & pat1_2; // @[el2_exu_div_ctl.scala 64:94]
  wire  pat1_8 = _T_97 & pat1_5; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_102 = pat1_8 & _T_27; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_103 = _T_92 | _T_102; // @[el2_exu_div_ctl.scala 75:43]
  wire  _T_107 = pat1_3 & _T_22; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_110 = _T_107 & _T_35; // @[el2_exu_div_ctl.scala 75:104]
  wire  _T_111 = _T_103 | _T_110; // @[el2_exu_div_ctl.scala 75:78]
  wire  _T_119 = _T_22 & m_ff[2]; // @[el2_exu_div_ctl.scala 65:94]
  wire  pat2_10 = _T_119 & _T_26; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_120 = pat1_3 & pat2_10; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_121 = _T_111 | _T_120; // @[el2_exu_div_ctl.scala 75:116]
  wire  pat1_11 = pat1 & pat1_5; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_128 = pat1_11 & pat2_6; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_129 = _T_121 | _T_128; // @[el2_exu_div_ctl.scala 76:43]
  wire  pat1_12 = pat1_3 & pat1_5; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_137 = pat1_12 & _T_119; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_138 = _T_129 | _T_137; // @[el2_exu_div_ctl.scala 76:77]
  wire  _T_142 = pat1_2 & pat1_5; // @[el2_exu_div_ctl.scala 64:94]
  wire  pat1_13 = _T_142 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_147 = pat1_13 & pat2_6; // @[el2_exu_div_ctl.scala 66:10]
  wire  pat1_14 = pat1_7 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_157 = _T_22 & m_ff[1]; // @[el2_exu_div_ctl.scala 65:94]
  wire  pat2_14 = _T_157 & m_ff[0]; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_158 = pat1_14 & pat2_14; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_159 = _T_147 | _T_158; // @[el2_exu_div_ctl.scala 78:44]
  wire  _T_164 = pat1_2 & pat2_6; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_167 = _T_164 & _T_35; // @[el2_exu_div_ctl.scala 78:111]
  wire  _T_168 = _T_159 | _T_167; // @[el2_exu_div_ctl.scala 78:84]
  wire  _T_173 = pat1_5 & _T_27; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_176 = _T_173 & _T_35; // @[el2_exu_div_ctl.scala 79:32]
  wire  _T_177 = _T_168 | _T_176; // @[el2_exu_div_ctl.scala 78:126]
  wire  _T_185 = q_ff[0] & pat2; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_186 = _T_177 | _T_185; // @[el2_exu_div_ctl.scala 79:46]
  wire  _T_191 = ~pat1_5; // @[el2_exu_div_ctl.scala 64:69]
  wire  pat1_18 = _T_97 & _T_191; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_201 = pat1_18 & pat2_7; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_202 = _T_186 | _T_201; // @[el2_exu_div_ctl.scala 79:86]
  wire  _T_209 = pat1_8 & _T_22; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_212 = _T_209 & _T_35; // @[el2_exu_div_ctl.scala 80:35]
  wire  _T_213 = _T_202 | _T_212; // @[el2_exu_div_ctl.scala 79:128]
  wire  pat2_20 = _T_24 & _T_26; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_218 = pat1 & pat2_20; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_221 = _T_218 & _T_35; // @[el2_exu_div_ctl.scala 80:74]
  wire  _T_222 = _T_213 | _T_221; // @[el2_exu_div_ctl.scala 80:46]
  wire  pat2_21 = _T_119 & m_ff[1]; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_231 = pat1_7 & pat2_21; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_232 = _T_222 | _T_231; // @[el2_exu_div_ctl.scala 80:86]
  wire  _T_244 = pat1_8 & pat2_10; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_245 = _T_232 | _T_244; // @[el2_exu_div_ctl.scala 80:128]
  wire  pat1_23 = _T_97 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_255 = pat1_23 & pat2_6; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_256 = _T_245 | _T_255; // @[el2_exu_div_ctl.scala 81:46]
  wire  pat1_24 = pat1_7 & _T_191; // @[el2_exu_div_ctl.scala 64:94]
  wire  pat2_24 = _T_119 & m_ff[0]; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_268 = pat1_24 & pat2_24; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_269 = _T_256 | _T_268; // @[el2_exu_div_ctl.scala 81:86]
  wire  _T_274 = _T_82 & pat1_5; // @[el2_exu_div_ctl.scala 64:94]
  wire  pat1_25 = _T_274 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_279 = pat1_25 & _T_27; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_280 = _T_269 | _T_279; // @[el2_exu_div_ctl.scala 81:128]
  wire  _T_284 = pat1_3 & _T_26; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_287 = _T_284 & _T_35; // @[el2_exu_div_ctl.scala 82:73]
  wire  _T_288 = _T_280 | _T_287; // @[el2_exu_div_ctl.scala 82:46]
  wire  pat1_27 = pat1_8 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_299 = pat1_27 & _T_119; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_300 = _T_288 | _T_299; // @[el2_exu_div_ctl.scala 82:86]
  wire  pat2_28 = m_ff[3] & _T_24; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_306 = pat1_3 & pat2_28; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_307 = _T_300 | _T_306; // @[el2_exu_div_ctl.scala 82:128]
  wire  pat2_29 = pat2_28 & _T_26; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_316 = pat1_11 & pat2_29; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_317 = _T_307 | _T_316; // @[el2_exu_div_ctl.scala 83:46]
  wire  pat1_30 = pat1 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_324 = pat1_30 & pat2_20; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_325 = _T_317 | _T_324; // @[el2_exu_div_ctl.scala 83:86]
  wire  pat1_31 = pat1 & _T_191; // @[el2_exu_div_ctl.scala 64:94]
  wire  pat2_31 = pat2_21 & m_ff[0]; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_336 = pat1_31 & pat2_31; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_337 = _T_325 | _T_336; // @[el2_exu_div_ctl.scala 83:128]
  wire  _T_342 = pat1_12 & m_ff[3]; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_345 = _T_342 & _T_35; // @[el2_exu_div_ctl.scala 84:75]
  wire  _T_346 = _T_337 | _T_345; // @[el2_exu_div_ctl.scala 84:46]
  wire  pat2_33 = m_ff[3] & _T_26; // @[el2_exu_div_ctl.scala 65:94]
  wire  _T_354 = pat1_12 & pat2_33; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_355 = _T_346 | _T_354; // @[el2_exu_div_ctl.scala 84:86]
  wire  pat1_34 = pat1_3 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_363 = pat1_34 & pat2_33; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_364 = _T_355 | _T_363; // @[el2_exu_div_ctl.scala 84:128]
  wire  pat1_35 = pat1_7 & pat1_5; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_373 = pat1_35 & _T_157; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_374 = _T_364 | _T_373; // @[el2_exu_div_ctl.scala 85:46]
  wire  pat1_36 = pat1_11 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_380 = pat1_36 & _T_24; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_381 = _T_374 | _T_380; // @[el2_exu_div_ctl.scala 85:86]
  wire  pat1_37 = pat1_12 & q_ff[0]; // @[el2_exu_div_ctl.scala 64:94]
  wire  _T_388 = pat1_37 & m_ff[3]; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_389 = _T_381 | _T_388; // @[el2_exu_div_ctl.scala 85:128]
  wire  _T_393 = pat1_11 & _T_24; // @[el2_exu_div_ctl.scala 66:10]
  wire  _T_396 = _T_393 & _T_35; // @[el2_exu_div_ctl.scala 86:72]
  wire  _T_397 = _T_389 | _T_396; // @[el2_exu_div_ctl.scala 86:46]
  wire [1:0] _T_398 = {_T_138,_T_397}; // @[Cat.scala 29:58]
  wire [1:0] _T_399 = {_T_28,_T_53}; // @[Cat.scala 29:58]
  reg  sign_ff; // @[Reg.scala 27:20]
  wire  _T_401 = sign_ff & q_ff[31]; // @[el2_exu_div_ctl.scala 96:34]
  wire [32:0] short_dividend = {_T_401,q_ff[31:0]}; // @[Cat.scala 29:58]
  wire  _T_406 = ~short_dividend[32]; // @[el2_exu_div_ctl.scala 101:7]
  wire  _T_409 = short_dividend[31:24] != 8'h0; // @[el2_exu_div_ctl.scala 101:60]
  wire  _T_414 = short_dividend[31:23] != 9'h1ff; // @[el2_exu_div_ctl.scala 102:59]
  wire  _T_415 = _T_406 & _T_409; // @[Mux.scala 27:72]
  wire  _T_416 = short_dividend[32] & _T_414; // @[Mux.scala 27:72]
  wire  _T_417 = _T_415 | _T_416; // @[Mux.scala 27:72]
  wire  _T_424 = short_dividend[23:16] != 8'h0; // @[el2_exu_div_ctl.scala 105:60]
  wire  _T_429 = short_dividend[22:15] != 8'hff; // @[el2_exu_div_ctl.scala 106:59]
  wire  _T_430 = _T_406 & _T_424; // @[Mux.scala 27:72]
  wire  _T_431 = short_dividend[32] & _T_429; // @[Mux.scala 27:72]
  wire  _T_432 = _T_430 | _T_431; // @[Mux.scala 27:72]
  wire  _T_439 = short_dividend[15:8] != 8'h0; // @[el2_exu_div_ctl.scala 109:59]
  wire  _T_444 = short_dividend[14:7] != 8'hff; // @[el2_exu_div_ctl.scala 110:58]
  wire  _T_445 = _T_406 & _T_439; // @[Mux.scala 27:72]
  wire  _T_446 = short_dividend[32] & _T_444; // @[Mux.scala 27:72]
  wire  _T_447 = _T_445 | _T_446; // @[Mux.scala 27:72]
  wire [2:0] a_cls = {_T_417,_T_432,_T_447}; // @[Cat.scala 29:58]
  wire  _T_452 = ~m_ff[32]; // @[el2_exu_div_ctl.scala 115:7]
  wire  _T_455 = m_ff[31:24] != 8'h0; // @[el2_exu_div_ctl.scala 115:40]
  wire  _T_460 = m_ff[31:24] != 8'hff; // @[el2_exu_div_ctl.scala 116:39]
  wire  _T_461 = _T_452 & _T_455; // @[Mux.scala 27:72]
  wire  _T_462 = m_ff[32] & _T_460; // @[Mux.scala 27:72]
  wire  _T_463 = _T_461 | _T_462; // @[Mux.scala 27:72]
  wire  _T_470 = m_ff[23:16] != 8'h0; // @[el2_exu_div_ctl.scala 119:40]
  wire  _T_475 = m_ff[23:16] != 8'hff; // @[el2_exu_div_ctl.scala 120:39]
  wire  _T_476 = _T_452 & _T_470; // @[Mux.scala 27:72]
  wire  _T_477 = m_ff[32] & _T_475; // @[Mux.scala 27:72]
  wire  _T_478 = _T_476 | _T_477; // @[Mux.scala 27:72]
  wire  _T_485 = m_ff[15:8] != 8'h0; // @[el2_exu_div_ctl.scala 123:39]
  wire  _T_490 = m_ff[15:8] != 8'hff; // @[el2_exu_div_ctl.scala 124:38]
  wire  _T_491 = _T_452 & _T_485; // @[Mux.scala 27:72]
  wire  _T_492 = m_ff[32] & _T_490; // @[Mux.scala 27:72]
  wire  _T_493 = _T_491 | _T_492; // @[Mux.scala 27:72]
  wire [2:0] b_cls = {_T_463,_T_478,_T_493}; // @[Cat.scala 29:58]
  wire  _T_497 = a_cls[2:1] == 2'h1; // @[el2_exu_div_ctl.scala 128:19]
  wire  _T_500 = _T_497 & b_cls[2]; // @[el2_exu_div_ctl.scala 128:34]
  wire  _T_502 = a_cls == 3'h1; // @[el2_exu_div_ctl.scala 129:21]
  wire  _T_505 = _T_502 & b_cls[2]; // @[el2_exu_div_ctl.scala 129:36]
  wire  _T_506 = _T_500 | _T_505; // @[el2_exu_div_ctl.scala 128:65]
  wire  _T_508 = a_cls == 3'h0; // @[el2_exu_div_ctl.scala 130:21]
  wire  _T_511 = _T_508 & b_cls[2]; // @[el2_exu_div_ctl.scala 130:36]
  wire  _T_512 = _T_506 | _T_511; // @[el2_exu_div_ctl.scala 129:67]
  wire  _T_516 = b_cls[2:1] == 2'h1; // @[el2_exu_div_ctl.scala 131:50]
  wire  _T_517 = _T_502 & _T_516; // @[el2_exu_div_ctl.scala 131:36]
  wire  _T_518 = _T_512 | _T_517; // @[el2_exu_div_ctl.scala 130:67]
  wire  _T_523 = _T_508 & _T_516; // @[el2_exu_div_ctl.scala 132:36]
  wire  _T_524 = _T_518 | _T_523; // @[el2_exu_div_ctl.scala 131:67]
  wire  _T_528 = b_cls == 3'h1; // @[el2_exu_div_ctl.scala 133:50]
  wire  _T_529 = _T_508 & _T_528; // @[el2_exu_div_ctl.scala 133:36]
  wire  _T_530 = _T_524 | _T_529; // @[el2_exu_div_ctl.scala 132:67]
  wire  _T_535 = a_cls[2] & b_cls[2]; // @[el2_exu_div_ctl.scala 135:34]
  wire  _T_540 = _T_497 & _T_516; // @[el2_exu_div_ctl.scala 136:36]
  wire  _T_541 = _T_535 | _T_540; // @[el2_exu_div_ctl.scala 135:65]
  wire  _T_546 = _T_502 & _T_528; // @[el2_exu_div_ctl.scala 137:36]
  wire  _T_547 = _T_541 | _T_546; // @[el2_exu_div_ctl.scala 136:67]
  wire  _T_551 = b_cls == 3'h0; // @[el2_exu_div_ctl.scala 138:50]
  wire  _T_552 = _T_508 & _T_551; // @[el2_exu_div_ctl.scala 138:36]
  wire  _T_553 = _T_547 | _T_552; // @[el2_exu_div_ctl.scala 137:67]
  wire  _T_558 = a_cls[2] & _T_516; // @[el2_exu_div_ctl.scala 140:34]
  wire  _T_563 = _T_497 & _T_528; // @[el2_exu_div_ctl.scala 141:36]
  wire  _T_564 = _T_558 | _T_563; // @[el2_exu_div_ctl.scala 140:65]
  wire  _T_569 = _T_502 & _T_551; // @[el2_exu_div_ctl.scala 142:36]
  wire  _T_570 = _T_564 | _T_569; // @[el2_exu_div_ctl.scala 141:67]
  wire  _T_575 = a_cls[2] & _T_528; // @[el2_exu_div_ctl.scala 144:34]
  wire  _T_580 = _T_497 & _T_551; // @[el2_exu_div_ctl.scala 145:36]
  wire  _T_581 = _T_575 | _T_580; // @[el2_exu_div_ctl.scala 144:65]
  wire [3:0] shortq_raw = {_T_530,_T_553,_T_570,_T_581}; // @[Cat.scala 29:58]
  wire  _T_586 = valid_ff_x & _T_7; // @[el2_exu_div_ctl.scala 148:35]
  wire  _T_587 = shortq_raw != 4'h0; // @[el2_exu_div_ctl.scala 148:78]
  wire  shortq_enable = _T_586 & _T_587; // @[el2_exu_div_ctl.scala 148:64]
  wire [3:0] _T_589 = shortq_enable ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] shortq_shift_xx; // @[el2_exu_div_ctl.scala 215:31]
  wire [4:0] _T_598 = shortq_shift_xx[3] ? 5'h1f : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_599 = shortq_shift_xx[2] ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_600 = shortq_shift_xx[1] ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_601 = shortq_shift_xx[0] ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_602 = _T_598 | _T_599; // @[Mux.scala 27:72]
  wire [4:0] _T_603 = _T_602 | _T_600; // @[Mux.scala 27:72]
  wire [4:0] _GEN_4 = {{1'd0}, _T_601}; // @[Mux.scala 27:72]
  wire [4:0] shortq_shift_ff = _T_603 | _GEN_4; // @[Mux.scala 27:72]
  reg [5:0] count; // @[el2_exu_div_ctl.scala 207:21]
  wire  _T_606 = count == 6'h20; // @[el2_exu_div_ctl.scala 159:55]
  wire  _T_607 = count == 6'h21; // @[el2_exu_div_ctl.scala 159:76]
  wire  _T_608 = _T_9 ? _T_606 : _T_607; // @[el2_exu_div_ctl.scala 159:39]
  wire  finish = smallnum_case | _T_608; // @[el2_exu_div_ctl.scala 159:34]
  reg  run_state; // @[el2_exu_div_ctl.scala 206:25]
  wire  _T_609 = io_dp_valid | run_state; // @[el2_exu_div_ctl.scala 160:32]
  wire  _T_610 = _T_609 | finish; // @[el2_exu_div_ctl.scala 160:44]
  reg  finish_ff; // @[el2_exu_div_ctl.scala 205:25]
  wire  _T_612 = ~finish; // @[el2_exu_div_ctl.scala 161:48]
  wire  _T_613 = _T_609 & _T_612; // @[el2_exu_div_ctl.scala 161:46]
  wire  _T_616 = run_state & _T_612; // @[el2_exu_div_ctl.scala 162:35]
  wire  _T_618 = _T_616 & _T; // @[el2_exu_div_ctl.scala 162:45]
  wire  _T_619 = ~shortq_enable; // @[el2_exu_div_ctl.scala 162:60]
  wire  _T_620 = _T_618 & _T_619; // @[el2_exu_div_ctl.scala 162:58]
  wire [5:0] _T_622 = _T_620 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _T_623 = {1'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [5:0] _T_625 = count + _T_623; // @[el2_exu_div_ctl.scala 162:86]
  wire [5:0] _T_627 = _T_625 + 6'h1; // @[el2_exu_div_ctl.scala 162:113]
  wire  _T_631 = ~io_dp_unsign; // @[el2_exu_div_ctl.scala 166:20]
  wire  _T_632 = io_divisor != 32'h0; // @[el2_exu_div_ctl.scala 166:48]
  wire  sign_eff = _T_631 & _T_632; // @[el2_exu_div_ctl.scala 166:34]
  wire  _T_633 = ~run_state; // @[el2_exu_div_ctl.scala 170:6]
  wire [32:0] _T_635 = {1'h0,io_dividend}; // @[Cat.scala 29:58]
  reg  shortq_enable_ff; // @[el2_exu_div_ctl.scala 214:32]
  wire  _T_636 = valid_ff_x | shortq_enable_ff; // @[el2_exu_div_ctl.scala 171:30]
  wire  _T_637 = run_state & _T_636; // @[el2_exu_div_ctl.scala 171:16]
  reg  dividend_neg_ff; // @[Reg.scala 27:20]
  wire  _T_660 = sign_ff & dividend_neg_ff; // @[el2_exu_div_ctl.scala 175:32]
  wire  _T_845 = |q_ff[30:0]; // @[el2_lib.scala 543:35]
  wire  _T_847 = ~q_ff[31]; // @[el2_lib.scala 543:40]
  wire  _T_849 = _T_845 ? _T_847 : q_ff[31]; // @[el2_lib.scala 543:23]
  wire  _T_839 = |q_ff[29:0]; // @[el2_lib.scala 543:35]
  wire  _T_841 = ~q_ff[30]; // @[el2_lib.scala 543:40]
  wire  _T_843 = _T_839 ? _T_841 : q_ff[30]; // @[el2_lib.scala 543:23]
  wire  _T_833 = |q_ff[28:0]; // @[el2_lib.scala 543:35]
  wire  _T_835 = ~q_ff[29]; // @[el2_lib.scala 543:40]
  wire  _T_837 = _T_833 ? _T_835 : q_ff[29]; // @[el2_lib.scala 543:23]
  wire  _T_827 = |q_ff[27:0]; // @[el2_lib.scala 543:35]
  wire  _T_829 = ~q_ff[28]; // @[el2_lib.scala 543:40]
  wire  _T_831 = _T_827 ? _T_829 : q_ff[28]; // @[el2_lib.scala 543:23]
  wire  _T_821 = |q_ff[26:0]; // @[el2_lib.scala 543:35]
  wire  _T_823 = ~q_ff[27]; // @[el2_lib.scala 543:40]
  wire  _T_825 = _T_821 ? _T_823 : q_ff[27]; // @[el2_lib.scala 543:23]
  wire  _T_815 = |q_ff[25:0]; // @[el2_lib.scala 543:35]
  wire  _T_817 = ~q_ff[26]; // @[el2_lib.scala 543:40]
  wire  _T_819 = _T_815 ? _T_817 : q_ff[26]; // @[el2_lib.scala 543:23]
  wire  _T_809 = |q_ff[24:0]; // @[el2_lib.scala 543:35]
  wire  _T_811 = ~q_ff[25]; // @[el2_lib.scala 543:40]
  wire  _T_813 = _T_809 ? _T_811 : q_ff[25]; // @[el2_lib.scala 543:23]
  wire  _T_803 = |q_ff[23:0]; // @[el2_lib.scala 543:35]
  wire  _T_805 = ~q_ff[24]; // @[el2_lib.scala 543:40]
  wire  _T_807 = _T_803 ? _T_805 : q_ff[24]; // @[el2_lib.scala 543:23]
  wire  _T_797 = |q_ff[22:0]; // @[el2_lib.scala 543:35]
  wire  _T_799 = ~q_ff[23]; // @[el2_lib.scala 543:40]
  wire  _T_801 = _T_797 ? _T_799 : q_ff[23]; // @[el2_lib.scala 543:23]
  wire  _T_791 = |q_ff[21:0]; // @[el2_lib.scala 543:35]
  wire  _T_793 = ~q_ff[22]; // @[el2_lib.scala 543:40]
  wire  _T_795 = _T_791 ? _T_793 : q_ff[22]; // @[el2_lib.scala 543:23]
  wire  _T_785 = |q_ff[20:0]; // @[el2_lib.scala 543:35]
  wire  _T_787 = ~q_ff[21]; // @[el2_lib.scala 543:40]
  wire  _T_789 = _T_785 ? _T_787 : q_ff[21]; // @[el2_lib.scala 543:23]
  wire  _T_779 = |q_ff[19:0]; // @[el2_lib.scala 543:35]
  wire  _T_781 = ~q_ff[20]; // @[el2_lib.scala 543:40]
  wire  _T_783 = _T_779 ? _T_781 : q_ff[20]; // @[el2_lib.scala 543:23]
  wire  _T_773 = |q_ff[18:0]; // @[el2_lib.scala 543:35]
  wire  _T_775 = ~q_ff[19]; // @[el2_lib.scala 543:40]
  wire  _T_777 = _T_773 ? _T_775 : q_ff[19]; // @[el2_lib.scala 543:23]
  wire  _T_767 = |q_ff[17:0]; // @[el2_lib.scala 543:35]
  wire  _T_769 = ~q_ff[18]; // @[el2_lib.scala 543:40]
  wire  _T_771 = _T_767 ? _T_769 : q_ff[18]; // @[el2_lib.scala 543:23]
  wire  _T_761 = |q_ff[16:0]; // @[el2_lib.scala 543:35]
  wire  _T_763 = ~q_ff[17]; // @[el2_lib.scala 543:40]
  wire  _T_765 = _T_761 ? _T_763 : q_ff[17]; // @[el2_lib.scala 543:23]
  wire  _T_755 = |q_ff[15:0]; // @[el2_lib.scala 543:35]
  wire  _T_757 = ~q_ff[16]; // @[el2_lib.scala 543:40]
  wire  _T_759 = _T_755 ? _T_757 : q_ff[16]; // @[el2_lib.scala 543:23]
  wire [7:0] _T_870 = {_T_801,_T_795,_T_789,_T_783,_T_777,_T_771,_T_765,_T_759}; // @[el2_lib.scala 545:14]
  wire  _T_749 = |q_ff[14:0]; // @[el2_lib.scala 543:35]
  wire  _T_751 = ~q_ff[15]; // @[el2_lib.scala 543:40]
  wire  _T_753 = _T_749 ? _T_751 : q_ff[15]; // @[el2_lib.scala 543:23]
  wire  _T_743 = |q_ff[13:0]; // @[el2_lib.scala 543:35]
  wire  _T_745 = ~q_ff[14]; // @[el2_lib.scala 543:40]
  wire  _T_747 = _T_743 ? _T_745 : q_ff[14]; // @[el2_lib.scala 543:23]
  wire  _T_737 = |q_ff[12:0]; // @[el2_lib.scala 543:35]
  wire  _T_739 = ~q_ff[13]; // @[el2_lib.scala 543:40]
  wire  _T_741 = _T_737 ? _T_739 : q_ff[13]; // @[el2_lib.scala 543:23]
  wire  _T_731 = |q_ff[11:0]; // @[el2_lib.scala 543:35]
  wire  _T_733 = ~q_ff[12]; // @[el2_lib.scala 543:40]
  wire  _T_735 = _T_731 ? _T_733 : q_ff[12]; // @[el2_lib.scala 543:23]
  wire  _T_725 = |q_ff[10:0]; // @[el2_lib.scala 543:35]
  wire  _T_727 = ~q_ff[11]; // @[el2_lib.scala 543:40]
  wire  _T_729 = _T_725 ? _T_727 : q_ff[11]; // @[el2_lib.scala 543:23]
  wire  _T_719 = |q_ff[9:0]; // @[el2_lib.scala 543:35]
  wire  _T_721 = ~q_ff[10]; // @[el2_lib.scala 543:40]
  wire  _T_723 = _T_719 ? _T_721 : q_ff[10]; // @[el2_lib.scala 543:23]
  wire  _T_713 = |q_ff[8:0]; // @[el2_lib.scala 543:35]
  wire  _T_715 = ~q_ff[9]; // @[el2_lib.scala 543:40]
  wire  _T_717 = _T_713 ? _T_715 : q_ff[9]; // @[el2_lib.scala 543:23]
  wire  _T_707 = |q_ff[7:0]; // @[el2_lib.scala 543:35]
  wire  _T_709 = ~q_ff[8]; // @[el2_lib.scala 543:40]
  wire  _T_711 = _T_707 ? _T_709 : q_ff[8]; // @[el2_lib.scala 543:23]
  wire  _T_701 = |q_ff[6:0]; // @[el2_lib.scala 543:35]
  wire  _T_703 = ~q_ff[7]; // @[el2_lib.scala 543:40]
  wire  _T_705 = _T_701 ? _T_703 : q_ff[7]; // @[el2_lib.scala 543:23]
  wire  _T_695 = |q_ff[5:0]; // @[el2_lib.scala 543:35]
  wire  _T_697 = ~q_ff[6]; // @[el2_lib.scala 543:40]
  wire  _T_699 = _T_695 ? _T_697 : q_ff[6]; // @[el2_lib.scala 543:23]
  wire  _T_689 = |q_ff[4:0]; // @[el2_lib.scala 543:35]
  wire  _T_691 = ~q_ff[5]; // @[el2_lib.scala 543:40]
  wire  _T_693 = _T_689 ? _T_691 : q_ff[5]; // @[el2_lib.scala 543:23]
  wire  _T_683 = |q_ff[3:0]; // @[el2_lib.scala 543:35]
  wire  _T_685 = ~q_ff[4]; // @[el2_lib.scala 543:40]
  wire  _T_687 = _T_683 ? _T_685 : q_ff[4]; // @[el2_lib.scala 543:23]
  wire  _T_677 = |q_ff[2:0]; // @[el2_lib.scala 543:35]
  wire  _T_679 = ~q_ff[3]; // @[el2_lib.scala 543:40]
  wire  _T_681 = _T_677 ? _T_679 : q_ff[3]; // @[el2_lib.scala 543:23]
  wire  _T_671 = |q_ff[1:0]; // @[el2_lib.scala 543:35]
  wire  _T_673 = ~q_ff[2]; // @[el2_lib.scala 543:40]
  wire  _T_675 = _T_671 ? _T_673 : q_ff[2]; // @[el2_lib.scala 543:23]
  wire  _T_665 = |q_ff[0]; // @[el2_lib.scala 543:35]
  wire  _T_667 = ~q_ff[1]; // @[el2_lib.scala 543:40]
  wire  _T_669 = _T_665 ? _T_667 : q_ff[1]; // @[el2_lib.scala 543:23]
  wire [6:0] _T_855 = {_T_705,_T_699,_T_693,_T_687,_T_681,_T_675,_T_669}; // @[el2_lib.scala 545:14]
  wire [14:0] _T_863 = {_T_753,_T_747,_T_741,_T_735,_T_729,_T_723,_T_717,_T_711,_T_855}; // @[el2_lib.scala 545:14]
  wire [30:0] _T_879 = {_T_849,_T_843,_T_837,_T_831,_T_825,_T_819,_T_813,_T_807,_T_870,_T_863}; // @[el2_lib.scala 545:14]
  wire [31:0] _T_881 = {_T_879,q_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] dividend_eff = _T_660 ? _T_881 : q_ff[31:0]; // @[el2_exu_div_ctl.scala 175:22]
  wire [32:0] _T_917 = run_state ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _T_929 = _T_607 & rem_ff; // @[el2_exu_div_ctl.scala 191:41]
  reg [32:0] a_ff; // @[el2_lib.scala 514:16]
  wire  rem_correct = _T_929 & a_ff[32]; // @[el2_exu_div_ctl.scala 191:50]
  wire [32:0] _T_902 = rem_correct ? a_ff : 33'h0; // @[Mux.scala 27:72]
  wire  _T_890 = ~rem_correct; // @[el2_exu_div_ctl.scala 182:6]
  wire  _T_891 = ~shortq_enable_ff; // @[el2_exu_div_ctl.scala 182:21]
  wire  _T_892 = _T_890 & _T_891; // @[el2_exu_div_ctl.scala 182:19]
  wire [32:0] _T_896 = {a_ff[31:0],q_ff[32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_903 = _T_892 ? _T_896 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_905 = _T_902 | _T_903; // @[Mux.scala 27:72]
  wire  _T_898 = _T_890 & shortq_enable_ff; // @[el2_exu_div_ctl.scala 183:19]
  wire [55:0] _T_887 = {24'h0,dividend_eff}; // @[Cat.scala 29:58]
  wire [86:0] _GEN_5 = {{31'd0}, _T_887}; // @[el2_exu_div_ctl.scala 179:47]
  wire [86:0] _T_888 = _GEN_5 << shortq_shift_ff; // @[el2_exu_div_ctl.scala 179:47]
  wire [55:0] a_eff_shift = _T_888[55:0]; // @[el2_exu_div_ctl.scala 179:15]
  wire [32:0] _T_901 = {9'h0,a_eff_shift[55:32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_904 = _T_898 ? _T_901 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] a_eff = _T_905 | _T_904; // @[Mux.scala 27:72]
  wire [32:0] a_shift = _T_917 & a_eff; // @[el2_exu_div_ctl.scala 186:33]
  wire  _T_926 = a_ff[32] | rem_correct; // @[el2_exu_div_ctl.scala 190:21]
  reg  divisor_neg_ff; // @[Reg.scala 27:20]
  wire  m_already_comp = divisor_neg_ff & sign_ff; // @[el2_exu_div_ctl.scala 188:48]
  wire  add = _T_926 ^ m_already_comp; // @[el2_exu_div_ctl.scala 190:36]
  wire [32:0] _T_885 = ~m_ff; // @[el2_exu_div_ctl.scala 178:35]
  wire [32:0] m_eff = add ? m_ff : _T_885; // @[el2_exu_div_ctl.scala 178:15]
  wire [32:0] _T_919 = a_shift + m_eff; // @[el2_exu_div_ctl.scala 187:41]
  wire  _T_920 = ~add; // @[el2_exu_div_ctl.scala 187:65]
  wire [32:0] _T_921 = {32'h0,_T_920}; // @[Cat.scala 29:58]
  wire [32:0] _T_923 = _T_919 + _T_921; // @[el2_exu_div_ctl.scala 187:49]
  wire [32:0] a_in = _T_917 & _T_923; // @[el2_exu_div_ctl.scala 187:30]
  wire  _T_641 = ~a_in[32]; // @[el2_exu_div_ctl.scala 171:85]
  wire [32:0] _T_642 = {dividend_eff,_T_641}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_6 = {{31'd0}, _T_642}; // @[el2_exu_div_ctl.scala 171:96]
  wire [63:0] _T_643 = _GEN_6 << shortq_shift_ff; // @[el2_exu_div_ctl.scala 171:96]
  wire  _T_645 = ~_T_636; // @[el2_exu_div_ctl.scala 172:18]
  wire  _T_646 = run_state & _T_645; // @[el2_exu_div_ctl.scala 172:16]
  wire [32:0] _T_651 = {q_ff[31:0],_T_641}; // @[Cat.scala 29:58]
  wire [32:0] _T_652 = _T_633 ? _T_635 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_653 = _T_637 ? _T_643 : 64'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_654 = _T_646 ? _T_651 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _GEN_7 = {{31'd0}, _T_652}; // @[Mux.scala 27:72]
  wire [63:0] _T_655 = _GEN_7 | _T_653; // @[Mux.scala 27:72]
  wire [63:0] _GEN_8 = {{31'd0}, _T_654}; // @[Mux.scala 27:72]
  wire [63:0] _T_656 = _T_655 | _GEN_8; // @[Mux.scala 27:72]
  wire  _T_659 = run_state & _T_619; // @[el2_exu_div_ctl.scala 174:48]
  wire  _T_910 = count != 6'h21; // @[el2_exu_div_ctl.scala 185:73]
  wire  _T_911 = _T_659 & _T_910; // @[el2_exu_div_ctl.scala 185:64]
  wire  _T_912 = io_dp_valid | _T_911; // @[el2_exu_div_ctl.scala 185:34]
  wire  _T_932 = dividend_neg_ff ^ divisor_neg_ff; // @[el2_exu_div_ctl.scala 192:50]
  wire  _T_933 = sign_ff & _T_932; // @[el2_exu_div_ctl.scala 192:31]
  wire [31:0] q_ff_eff = _T_933 ? _T_881 : q_ff[31:0]; // @[el2_exu_div_ctl.scala 192:21]
  wire  _T_1161 = |a_ff[0]; // @[el2_lib.scala 543:35]
  wire  _T_1163 = ~a_ff[1]; // @[el2_lib.scala 543:40]
  wire  _T_1165 = _T_1161 ? _T_1163 : a_ff[1]; // @[el2_lib.scala 543:23]
  wire  _T_1167 = |a_ff[1:0]; // @[el2_lib.scala 543:35]
  wire  _T_1169 = ~a_ff[2]; // @[el2_lib.scala 543:40]
  wire  _T_1171 = _T_1167 ? _T_1169 : a_ff[2]; // @[el2_lib.scala 543:23]
  wire  _T_1173 = |a_ff[2:0]; // @[el2_lib.scala 543:35]
  wire  _T_1175 = ~a_ff[3]; // @[el2_lib.scala 543:40]
  wire  _T_1177 = _T_1173 ? _T_1175 : a_ff[3]; // @[el2_lib.scala 543:23]
  wire  _T_1179 = |a_ff[3:0]; // @[el2_lib.scala 543:35]
  wire  _T_1181 = ~a_ff[4]; // @[el2_lib.scala 543:40]
  wire  _T_1183 = _T_1179 ? _T_1181 : a_ff[4]; // @[el2_lib.scala 543:23]
  wire  _T_1185 = |a_ff[4:0]; // @[el2_lib.scala 543:35]
  wire  _T_1187 = ~a_ff[5]; // @[el2_lib.scala 543:40]
  wire  _T_1189 = _T_1185 ? _T_1187 : a_ff[5]; // @[el2_lib.scala 543:23]
  wire  _T_1191 = |a_ff[5:0]; // @[el2_lib.scala 543:35]
  wire  _T_1193 = ~a_ff[6]; // @[el2_lib.scala 543:40]
  wire  _T_1195 = _T_1191 ? _T_1193 : a_ff[6]; // @[el2_lib.scala 543:23]
  wire  _T_1197 = |a_ff[6:0]; // @[el2_lib.scala 543:35]
  wire  _T_1199 = ~a_ff[7]; // @[el2_lib.scala 543:40]
  wire  _T_1201 = _T_1197 ? _T_1199 : a_ff[7]; // @[el2_lib.scala 543:23]
  wire  _T_1203 = |a_ff[7:0]; // @[el2_lib.scala 543:35]
  wire  _T_1205 = ~a_ff[8]; // @[el2_lib.scala 543:40]
  wire  _T_1207 = _T_1203 ? _T_1205 : a_ff[8]; // @[el2_lib.scala 543:23]
  wire  _T_1209 = |a_ff[8:0]; // @[el2_lib.scala 543:35]
  wire  _T_1211 = ~a_ff[9]; // @[el2_lib.scala 543:40]
  wire  _T_1213 = _T_1209 ? _T_1211 : a_ff[9]; // @[el2_lib.scala 543:23]
  wire  _T_1215 = |a_ff[9:0]; // @[el2_lib.scala 543:35]
  wire  _T_1217 = ~a_ff[10]; // @[el2_lib.scala 543:40]
  wire  _T_1219 = _T_1215 ? _T_1217 : a_ff[10]; // @[el2_lib.scala 543:23]
  wire  _T_1221 = |a_ff[10:0]; // @[el2_lib.scala 543:35]
  wire  _T_1223 = ~a_ff[11]; // @[el2_lib.scala 543:40]
  wire  _T_1225 = _T_1221 ? _T_1223 : a_ff[11]; // @[el2_lib.scala 543:23]
  wire  _T_1227 = |a_ff[11:0]; // @[el2_lib.scala 543:35]
  wire  _T_1229 = ~a_ff[12]; // @[el2_lib.scala 543:40]
  wire  _T_1231 = _T_1227 ? _T_1229 : a_ff[12]; // @[el2_lib.scala 543:23]
  wire  _T_1233 = |a_ff[12:0]; // @[el2_lib.scala 543:35]
  wire  _T_1235 = ~a_ff[13]; // @[el2_lib.scala 543:40]
  wire  _T_1237 = _T_1233 ? _T_1235 : a_ff[13]; // @[el2_lib.scala 543:23]
  wire  _T_1239 = |a_ff[13:0]; // @[el2_lib.scala 543:35]
  wire  _T_1241 = ~a_ff[14]; // @[el2_lib.scala 543:40]
  wire  _T_1243 = _T_1239 ? _T_1241 : a_ff[14]; // @[el2_lib.scala 543:23]
  wire  _T_1245 = |a_ff[14:0]; // @[el2_lib.scala 543:35]
  wire  _T_1247 = ~a_ff[15]; // @[el2_lib.scala 543:40]
  wire  _T_1249 = _T_1245 ? _T_1247 : a_ff[15]; // @[el2_lib.scala 543:23]
  wire  _T_1251 = |a_ff[15:0]; // @[el2_lib.scala 543:35]
  wire  _T_1253 = ~a_ff[16]; // @[el2_lib.scala 543:40]
  wire  _T_1255 = _T_1251 ? _T_1253 : a_ff[16]; // @[el2_lib.scala 543:23]
  wire  _T_1257 = |a_ff[16:0]; // @[el2_lib.scala 543:35]
  wire  _T_1259 = ~a_ff[17]; // @[el2_lib.scala 543:40]
  wire  _T_1261 = _T_1257 ? _T_1259 : a_ff[17]; // @[el2_lib.scala 543:23]
  wire  _T_1263 = |a_ff[17:0]; // @[el2_lib.scala 543:35]
  wire  _T_1265 = ~a_ff[18]; // @[el2_lib.scala 543:40]
  wire  _T_1267 = _T_1263 ? _T_1265 : a_ff[18]; // @[el2_lib.scala 543:23]
  wire  _T_1269 = |a_ff[18:0]; // @[el2_lib.scala 543:35]
  wire  _T_1271 = ~a_ff[19]; // @[el2_lib.scala 543:40]
  wire  _T_1273 = _T_1269 ? _T_1271 : a_ff[19]; // @[el2_lib.scala 543:23]
  wire  _T_1275 = |a_ff[19:0]; // @[el2_lib.scala 543:35]
  wire  _T_1277 = ~a_ff[20]; // @[el2_lib.scala 543:40]
  wire  _T_1279 = _T_1275 ? _T_1277 : a_ff[20]; // @[el2_lib.scala 543:23]
  wire  _T_1281 = |a_ff[20:0]; // @[el2_lib.scala 543:35]
  wire  _T_1283 = ~a_ff[21]; // @[el2_lib.scala 543:40]
  wire  _T_1285 = _T_1281 ? _T_1283 : a_ff[21]; // @[el2_lib.scala 543:23]
  wire  _T_1287 = |a_ff[21:0]; // @[el2_lib.scala 543:35]
  wire  _T_1289 = ~a_ff[22]; // @[el2_lib.scala 543:40]
  wire  _T_1291 = _T_1287 ? _T_1289 : a_ff[22]; // @[el2_lib.scala 543:23]
  wire  _T_1293 = |a_ff[22:0]; // @[el2_lib.scala 543:35]
  wire  _T_1295 = ~a_ff[23]; // @[el2_lib.scala 543:40]
  wire  _T_1297 = _T_1293 ? _T_1295 : a_ff[23]; // @[el2_lib.scala 543:23]
  wire  _T_1299 = |a_ff[23:0]; // @[el2_lib.scala 543:35]
  wire  _T_1301 = ~a_ff[24]; // @[el2_lib.scala 543:40]
  wire  _T_1303 = _T_1299 ? _T_1301 : a_ff[24]; // @[el2_lib.scala 543:23]
  wire  _T_1305 = |a_ff[24:0]; // @[el2_lib.scala 543:35]
  wire  _T_1307 = ~a_ff[25]; // @[el2_lib.scala 543:40]
  wire  _T_1309 = _T_1305 ? _T_1307 : a_ff[25]; // @[el2_lib.scala 543:23]
  wire  _T_1311 = |a_ff[25:0]; // @[el2_lib.scala 543:35]
  wire  _T_1313 = ~a_ff[26]; // @[el2_lib.scala 543:40]
  wire  _T_1315 = _T_1311 ? _T_1313 : a_ff[26]; // @[el2_lib.scala 543:23]
  wire  _T_1317 = |a_ff[26:0]; // @[el2_lib.scala 543:35]
  wire  _T_1319 = ~a_ff[27]; // @[el2_lib.scala 543:40]
  wire  _T_1321 = _T_1317 ? _T_1319 : a_ff[27]; // @[el2_lib.scala 543:23]
  wire  _T_1323 = |a_ff[27:0]; // @[el2_lib.scala 543:35]
  wire  _T_1325 = ~a_ff[28]; // @[el2_lib.scala 543:40]
  wire  _T_1327 = _T_1323 ? _T_1325 : a_ff[28]; // @[el2_lib.scala 543:23]
  wire  _T_1329 = |a_ff[28:0]; // @[el2_lib.scala 543:35]
  wire  _T_1331 = ~a_ff[29]; // @[el2_lib.scala 543:40]
  wire  _T_1333 = _T_1329 ? _T_1331 : a_ff[29]; // @[el2_lib.scala 543:23]
  wire  _T_1335 = |a_ff[29:0]; // @[el2_lib.scala 543:35]
  wire  _T_1337 = ~a_ff[30]; // @[el2_lib.scala 543:40]
  wire  _T_1339 = _T_1335 ? _T_1337 : a_ff[30]; // @[el2_lib.scala 543:23]
  wire  _T_1341 = |a_ff[30:0]; // @[el2_lib.scala 543:35]
  wire  _T_1343 = ~a_ff[31]; // @[el2_lib.scala 543:40]
  wire  _T_1345 = _T_1341 ? _T_1343 : a_ff[31]; // @[el2_lib.scala 543:23]
  wire [6:0] _T_1351 = {_T_1201,_T_1195,_T_1189,_T_1183,_T_1177,_T_1171,_T_1165}; // @[el2_lib.scala 545:14]
  wire [14:0] _T_1359 = {_T_1249,_T_1243,_T_1237,_T_1231,_T_1225,_T_1219,_T_1213,_T_1207,_T_1351}; // @[el2_lib.scala 545:14]
  wire [7:0] _T_1366 = {_T_1297,_T_1291,_T_1285,_T_1279,_T_1273,_T_1267,_T_1261,_T_1255}; // @[el2_lib.scala 545:14]
  wire [30:0] _T_1375 = {_T_1345,_T_1339,_T_1333,_T_1327,_T_1321,_T_1315,_T_1309,_T_1303,_T_1366,_T_1359}; // @[el2_lib.scala 545:14]
  wire [31:0] _T_1377 = {_T_1375,a_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] a_ff_eff = _T_660 ? _T_1377 : a_ff[31:0]; // @[el2_exu_div_ctl.scala 193:21]
  reg  smallnum_case_ff; // @[el2_exu_div_ctl.scala 212:32]
  reg [3:0] smallnum_ff; // @[el2_exu_div_ctl.scala 213:27]
  wire [31:0] _T_1380 = {28'h0,smallnum_ff}; // @[Cat.scala 29:58]
  wire  _T_1382 = ~smallnum_case_ff; // @[el2_exu_div_ctl.scala 198:6]
  wire  _T_1384 = _T_1382 & _T_9; // @[el2_exu_div_ctl.scala 198:24]
  wire [31:0] _T_1386 = smallnum_case_ff ? _T_1380 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1387 = rem_ff ? a_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1388 = _T_1384 ? q_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1389 = _T_1386 | _T_1387; // @[Mux.scala 27:72]
  wire  _T_1421 = _T_631 & io_divisor[31]; // @[el2_exu_div_ctl.scala 219:36]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  assign io_out = _T_1389 | _T_1388; // @[el2_exu_div_ctl.scala 50:10 el2_exu_div_ctl.scala 195:10]
  assign io_finish_dly = finish_ff & _T; // @[el2_exu_div_ctl.scala 51:17 el2_exu_div_ctl.scala 165:18]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_610 | finish_ff; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = io_dp_valid | _T_659; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = _T_912 | rem_correct; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = io_dp_valid; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  valid_ff_x = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  q_ff = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  m_ff = _RAND_2[32:0];
  _RAND_3 = {1{`RANDOM}};
  rem_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  sign_ff = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  shortq_shift_xx = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  count = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  run_state = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  finish_ff = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  shortq_enable_ff = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  dividend_neg_ff = _RAND_10[0:0];
  _RAND_11 = {2{`RANDOM}};
  a_ff = _RAND_11[32:0];
  _RAND_12 = {1{`RANDOM}};
  divisor_neg_ff = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  smallnum_case_ff = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  smallnum_ff = _RAND_14[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    valid_ff_x = 1'h0;
  end
  if (reset) begin
    q_ff = 33'h0;
  end
  if (reset) begin
    m_ff = 33'h0;
  end
  if (reset) begin
    rem_ff = 1'h0;
  end
  if (reset) begin
    sign_ff = 1'h0;
  end
  if (reset) begin
    shortq_shift_xx = 4'h0;
  end
  if (reset) begin
    count = 6'h0;
  end
  if (reset) begin
    run_state = 1'h0;
  end
  if (reset) begin
    finish_ff = 1'h0;
  end
  if (reset) begin
    shortq_enable_ff = 1'h0;
  end
  if (reset) begin
    dividend_neg_ff = 1'h0;
  end
  if (reset) begin
    a_ff = 33'h0;
  end
  if (reset) begin
    divisor_neg_ff = 1'h0;
  end
  if (reset) begin
    smallnum_case_ff = 1'h0;
  end
  if (reset) begin
    smallnum_ff = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      valid_ff_x <= 1'h0;
    end else begin
      valid_ff_x <= io_dp_valid & _T;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      q_ff <= 33'h0;
    end else begin
      q_ff <= _T_656[32:0];
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      m_ff <= 33'h0;
    end else begin
      m_ff <= {_T_1421,io_divisor};
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      rem_ff <= 1'h0;
    end else if (io_dp_valid) begin
      rem_ff <= io_dp_rem;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      sign_ff <= 1'h0;
    end else if (io_dp_valid) begin
      sign_ff <= sign_eff;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      shortq_shift_xx <= 4'h0;
    end else begin
      shortq_shift_xx <= _T_589 & shortq_raw;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      count <= 6'h0;
    end else begin
      count <= _T_622 & _T_627;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      run_state <= 1'h0;
    end else begin
      run_state <= _T_613 & _T;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      finish_ff <= 1'h0;
    end else begin
      finish_ff <= finish & _T;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      shortq_enable_ff <= 1'h0;
    end else begin
      shortq_enable_ff <= _T_586 & _T_587;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      dividend_neg_ff <= 1'h0;
    end else if (io_dp_valid) begin
      dividend_neg_ff <= io_dividend[31];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      a_ff <= 33'h0;
    end else begin
      a_ff <= _T_917 & _T_923;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      divisor_neg_ff <= 1'h0;
    end else if (io_dp_valid) begin
      divisor_neg_ff <= io_divisor[31];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      smallnum_case_ff <= 1'h0;
    end else begin
      smallnum_case_ff <= _T_11 | _T_19;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      smallnum_ff <= 4'h0;
    end else begin
      smallnum_ff <= {_T_399,_T_398};
    end
  end
endmodule
module el2_exu(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input  [1:0]  io_dec_data_en,
  input  [1:0]  io_dec_ctl_en,
  input  [31:0] io_dbg_cmd_wrdata,
  input         io_i0_ap_land,
  input         io_i0_ap_lor,
  input         io_i0_ap_lxor,
  input         io_i0_ap_sll,
  input         io_i0_ap_srl,
  input         io_i0_ap_sra,
  input         io_i0_ap_beq,
  input         io_i0_ap_bne,
  input         io_i0_ap_blt,
  input         io_i0_ap_bge,
  input         io_i0_ap_add,
  input         io_i0_ap_sub,
  input         io_i0_ap_slt,
  input         io_i0_ap_unsign,
  input         io_i0_ap_jal,
  input         io_i0_ap_predict_t,
  input         io_i0_ap_predict_nt,
  input         io_i0_ap_csr_write,
  input         io_i0_ap_csr_imm,
  input         io_dec_debug_wdata_rs1_d,
  input         io_dec_i0_predict_p_d_misp,
  input         io_dec_i0_predict_p_d_ataken,
  input         io_dec_i0_predict_p_d_boffset,
  input         io_dec_i0_predict_p_d_pc4,
  input  [1:0]  io_dec_i0_predict_p_d_hist,
  input  [11:0] io_dec_i0_predict_p_d_toffset,
  input         io_dec_i0_predict_p_d_valid,
  input         io_dec_i0_predict_p_d_br_error,
  input         io_dec_i0_predict_p_d_br_start_error,
  input  [30:0] io_dec_i0_predict_p_d_prett,
  input         io_dec_i0_predict_p_d_pcall,
  input         io_dec_i0_predict_p_d_pret,
  input         io_dec_i0_predict_p_d_pja,
  input         io_dec_i0_predict_p_d_way,
  input  [7:0]  io_i0_predict_fghr_d,
  input  [7:0]  io_i0_predict_index_d,
  input  [4:0]  io_i0_predict_btag_d,
  input         io_dec_i0_rs1_en_d,
  input         io_dec_i0_rs2_en_d,
  input  [31:0] io_gpr_i0_rs1_d,
  input  [31:0] io_gpr_i0_rs2_d,
  input  [31:0] io_dec_i0_immed_d,
  input  [31:0] io_dec_i0_rs1_bypass_data_d,
  input  [31:0] io_dec_i0_rs2_bypass_data_d,
  input  [11:0] io_dec_i0_br_immed_d,
  input         io_dec_i0_alu_decode_d,
  input         io_dec_i0_select_pc_d,
  input  [30:0] io_dec_i0_pc_d,
  input  [1:0]  io_dec_i0_rs1_bypass_en_d,
  input  [1:0]  io_dec_i0_rs2_bypass_en_d,
  input         io_dec_csr_ren_d,
  input         io_mul_p_valid,
  input         io_mul_p_rs1_sign,
  input         io_mul_p_rs2_sign,
  input         io_mul_p_low,
  input         io_mul_p_bext,
  input         io_mul_p_bdep,
  input         io_mul_p_clmul,
  input         io_mul_p_clmulh,
  input         io_mul_p_clmulr,
  input         io_mul_p_grev,
  input         io_mul_p_shfl,
  input         io_mul_p_unshfl,
  input         io_mul_p_crc32_b,
  input         io_mul_p_crc32_h,
  input         io_mul_p_crc32_w,
  input         io_mul_p_crc32c_b,
  input         io_mul_p_crc32c_h,
  input         io_mul_p_crc32c_w,
  input         io_mul_p_bfp,
  input         io_div_p_valid,
  input         io_div_p_unsign,
  input         io_div_p_rem,
  input         io_dec_div_cancel,
  input  [30:0] io_pred_correct_npc_x,
  input         io_dec_tlu_flush_lower_r,
  input  [30:0] io_dec_tlu_flush_path_r,
  input         io_dec_extint_stall,
  input  [29:0] io_dec_tlu_meihap,
  output [31:0] io_exu_lsu_rs1_d,
  output [31:0] io_exu_lsu_rs2_d,
  output        io_exu_flush_final,
  output [30:0] io_exu_flush_path_final,
  output [31:0] io_exu_i0_result_x,
  output [30:0] io_exu_i0_pc_x,
  output [31:0] io_exu_csr_rs1_x,
  output [30:0] io_exu_npc_r,
  output [1:0]  io_exu_i0_br_hist_r,
  output        io_exu_i0_br_error_r,
  output        io_exu_i0_br_start_error_r,
  output [7:0]  io_exu_i0_br_index_r,
  output        io_exu_i0_br_valid_r,
  output        io_exu_i0_br_mp_r,
  output        io_exu_i0_br_middle_r,
  output [7:0]  io_exu_i0_br_fghr_r,
  output        io_exu_i0_br_way_r,
  output        io_exu_mp_pkt_misp,
  output        io_exu_mp_pkt_ataken,
  output        io_exu_mp_pkt_boffset,
  output        io_exu_mp_pkt_pc4,
  output [1:0]  io_exu_mp_pkt_hist,
  output [11:0] io_exu_mp_pkt_toffset,
  output        io_exu_mp_pkt_valid,
  output        io_exu_mp_pkt_br_error,
  output        io_exu_mp_pkt_br_start_error,
  output [30:0] io_exu_mp_pkt_prett,
  output        io_exu_mp_pkt_pcall,
  output        io_exu_mp_pkt_pret,
  output        io_exu_mp_pkt_pja,
  output        io_exu_mp_pkt_way,
  output [7:0]  io_exu_mp_eghr,
  output [7:0]  io_exu_mp_fghr,
  output [7:0]  io_exu_mp_index,
  output [4:0]  io_exu_mp_btag,
  output        io_exu_pmu_i0_br_misp,
  output        io_exu_pmu_i0_br_ataken,
  output        io_exu_pmu_i0_pc4,
  output [31:0] io_exu_div_result,
  output        io_exu_div_wren
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  i_alu_clock; // @[el2_exu.scala 120:19]
  wire  i_alu_reset; // @[el2_exu.scala 120:19]
  wire  i_alu_io_scan_mode; // @[el2_exu.scala 120:19]
  wire  i_alu_io_flush_upper_x; // @[el2_exu.scala 120:19]
  wire  i_alu_io_flush_lower_r; // @[el2_exu.scala 120:19]
  wire  i_alu_io_enable; // @[el2_exu.scala 120:19]
  wire  i_alu_io_valid_in; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_land; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_lor; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_lxor; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_sll; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_srl; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_sra; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_beq; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_bne; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_blt; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_bge; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_add; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_sub; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_slt; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_unsign; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_jal; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_predict_t; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_predict_nt; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_csr_write; // @[el2_exu.scala 120:19]
  wire  i_alu_io_ap_csr_imm; // @[el2_exu.scala 120:19]
  wire  i_alu_io_csr_ren_in; // @[el2_exu.scala 120:19]
  wire [31:0] i_alu_io_a_in; // @[el2_exu.scala 120:19]
  wire [31:0] i_alu_io_b_in; // @[el2_exu.scala 120:19]
  wire [30:0] i_alu_io_pc_in; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_boffset; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_pc4; // @[el2_exu.scala 120:19]
  wire [1:0] i_alu_io_pp_in_hist; // @[el2_exu.scala 120:19]
  wire [11:0] i_alu_io_pp_in_toffset; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_valid; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_br_error; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_br_start_error; // @[el2_exu.scala 120:19]
  wire [30:0] i_alu_io_pp_in_prett; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_pcall; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_pret; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_pja; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pp_in_way; // @[el2_exu.scala 120:19]
  wire [11:0] i_alu_io_brimm_in; // @[el2_exu.scala 120:19]
  wire [31:0] i_alu_io_result_ff; // @[el2_exu.scala 120:19]
  wire  i_alu_io_flush_upper_out; // @[el2_exu.scala 120:19]
  wire  i_alu_io_flush_final_out; // @[el2_exu.scala 120:19]
  wire [30:0] i_alu_io_flush_path_out; // @[el2_exu.scala 120:19]
  wire [30:0] i_alu_io_pc_ff; // @[el2_exu.scala 120:19]
  wire  i_alu_io_pred_correct_out; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_misp; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_ataken; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_boffset; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_pc4; // @[el2_exu.scala 120:19]
  wire [1:0] i_alu_io_predict_p_out_hist; // @[el2_exu.scala 120:19]
  wire [11:0] i_alu_io_predict_p_out_toffset; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_valid; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_br_error; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_br_start_error; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_pcall; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_pret; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_pja; // @[el2_exu.scala 120:19]
  wire  i_alu_io_predict_p_out_way; // @[el2_exu.scala 120:19]
  wire  i_mul_clock; // @[el2_exu.scala 141:19]
  wire  i_mul_reset; // @[el2_exu.scala 141:19]
  wire  i_mul_io_scan_mode; // @[el2_exu.scala 141:19]
  wire  i_mul_io_mul_p_valid; // @[el2_exu.scala 141:19]
  wire  i_mul_io_mul_p_rs1_sign; // @[el2_exu.scala 141:19]
  wire  i_mul_io_mul_p_rs2_sign; // @[el2_exu.scala 141:19]
  wire  i_mul_io_mul_p_low; // @[el2_exu.scala 141:19]
  wire [31:0] i_mul_io_rs1_in; // @[el2_exu.scala 141:19]
  wire [31:0] i_mul_io_rs2_in; // @[el2_exu.scala 141:19]
  wire [31:0] i_mul_io_result_x; // @[el2_exu.scala 141:19]
  wire  i_div_clock; // @[el2_exu.scala 148:19]
  wire  i_div_reset; // @[el2_exu.scala 148:19]
  wire  i_div_io_scan_mode; // @[el2_exu.scala 148:19]
  wire  i_div_io_dp_valid; // @[el2_exu.scala 148:19]
  wire  i_div_io_dp_unsign; // @[el2_exu.scala 148:19]
  wire  i_div_io_dp_rem; // @[el2_exu.scala 148:19]
  wire [31:0] i_div_io_dividend; // @[el2_exu.scala 148:19]
  wire [31:0] i_div_io_divisor; // @[el2_exu.scala 148:19]
  wire  i_div_io_cancel; // @[el2_exu.scala 148:19]
  wire [31:0] i_div_io_out; // @[el2_exu.scala 148:19]
  wire  i_div_io_finish_dly; // @[el2_exu.scala 148:19]
  wire [15:0] _T = {io_i0_predict_fghr_d,io_i0_predict_index_d}; // @[Cat.scala 29:58]
  reg [31:0] i0_flush_path_x; // @[el2_lib.scala 514:16]
  reg [31:0] _T_3; // @[el2_lib.scala 514:16]
  reg  i0_predict_p_x_misp; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_ataken; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_boffset; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_pc4; // @[el2_lib.scala 524:16]
  reg [1:0] i0_predict_p_x_hist; // @[el2_lib.scala 524:16]
  reg [11:0] i0_predict_p_x_toffset; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_valid; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_br_error; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_br_start_error; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_pcall; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_pret; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_pja; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_way; // @[el2_lib.scala 524:16]
  reg [20:0] predpipe_x; // @[el2_lib.scala 514:16]
  reg [20:0] predpipe_r; // @[el2_lib.scala 514:16]
  reg [7:0] ghr_x; // @[el2_lib.scala 514:16]
  reg  i0_pred_correct_upper_x; // @[el2_lib.scala 514:16]
  reg  i0_flush_upper_x; // @[el2_lib.scala 514:16]
  reg  i0_taken_x; // @[el2_lib.scala 514:16]
  reg  i0_valid_x; // @[el2_lib.scala 514:16]
  reg  i0_pp_r_misp; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_ataken; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_boffset; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_pc4; // @[el2_lib.scala 524:16]
  reg [1:0] i0_pp_r_hist; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_valid; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_br_error; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_br_start_error; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_way; // @[el2_lib.scala 524:16]
  reg [5:0] pred_temp1; // @[el2_lib.scala 514:16]
  reg  i0_pred_correct_upper_r; // @[el2_lib.scala 514:16]
  reg [31:0] i0_flush_path_upper_r; // @[el2_lib.scala 514:16]
  reg [24:0] pred_temp2; // @[el2_lib.scala 514:16]
  wire [30:0] _T_23 = {pred_temp2,pred_temp1}; // @[Cat.scala 29:58]
  wire  _T_149 = ~io_dec_tlu_flush_lower_r; // @[el2_exu.scala 173:6]
  wire  i0_predict_p_d_valid = i_alu_io_predict_p_out_valid; // @[el2_exu.scala 22:46 el2_exu.scala 137:41]
  wire  _T_145 = i0_predict_p_d_valid & io_dec_i0_alu_decode_d; // @[el2_exu.scala 166:54]
  wire  i0_valid_d = _T_145 & _T_149; // @[el2_exu.scala 166:79]
  wire  _T_150 = _T_149 & i0_valid_d; // @[el2_exu.scala 173:32]
  reg [7:0] ghr_d; // @[el2_lib.scala 514:16]
  wire  i0_predict_p_d_ataken = i_alu_io_predict_p_out_ataken; // @[el2_exu.scala 22:46 el2_exu.scala 137:41]
  wire  i0_taken_d = i0_predict_p_d_ataken & io_dec_i0_alu_decode_d; // @[el2_exu.scala 167:54]
  wire [7:0] _T_153 = {ghr_d[6:0],i0_taken_d}; // @[Cat.scala 29:58]
  wire [7:0] _T_159 = _T_150 ? _T_153 : 8'h0; // @[Mux.scala 27:72]
  wire  _T_155 = ~i0_valid_d; // @[el2_exu.scala 174:34]
  wire  _T_156 = _T_149 & _T_155; // @[el2_exu.scala 174:32]
  wire [7:0] _T_160 = _T_156 ? ghr_d : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_162 = _T_159 | _T_160; // @[Mux.scala 27:72]
  wire [7:0] _T_161 = io_dec_tlu_flush_lower_r ? ghr_x : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] ghr_d_ns = _T_162 | _T_161; // @[Mux.scala 27:72]
  wire  _T_39 = ghr_d_ns != ghr_d; // @[el2_exu.scala 68:39]
  reg  mul_valid_x; // @[el2_lib.scala 514:16]
  wire  _T_40 = io_mul_p_valid != mul_valid_x; // @[el2_exu.scala 68:70]
  wire  _T_41 = _T_39 | _T_40; // @[el2_exu.scala 68:50]
  reg  flush_lower_ff; // @[el2_lib.scala 514:16]
  wire  _T_42 = io_dec_tlu_flush_lower_r != flush_lower_ff; // @[el2_exu.scala 68:116]
  wire  i0_rs1_bypass_en_d = io_dec_i0_rs1_bypass_en_d[0] | io_dec_i0_rs1_bypass_en_d[1]; // @[el2_exu.scala 69:65]
  wire  i0_rs2_bypass_en_d = io_dec_i0_rs2_bypass_en_d[0] | io_dec_i0_rs2_bypass_en_d[1]; // @[el2_exu.scala 70:65]
  wire [31:0] _T_52 = io_dec_i0_rs1_bypass_en_d[0] ? io_dec_i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_53 = io_dec_i0_rs1_bypass_en_d[1] ? io_exu_i0_result_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_rs1_bypass_data_d = _T_52 | _T_53; // @[Mux.scala 27:72]
  wire [31:0] _T_59 = io_dec_i0_rs2_bypass_en_d[0] ? io_dec_i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_60 = io_dec_i0_rs2_bypass_en_d[1] ? io_exu_i0_result_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_rs2_bypass_data_d = _T_59 | _T_60; // @[Mux.scala 27:72]
  wire  _T_63 = ~i0_rs1_bypass_en_d; // @[el2_exu.scala 84:6]
  wire  _T_64 = _T_63 & io_dec_i0_select_pc_d; // @[el2_exu.scala 84:26]
  wire [31:0] _T_66 = {io_dec_i0_pc_d,1'h0}; // @[Cat.scala 29:58]
  wire  _T_68 = _T_63 & io_dec_debug_wdata_rs1_d; // @[el2_exu.scala 85:26]
  wire  _T_71 = ~io_dec_debug_wdata_rs1_d; // @[el2_exu.scala 86:28]
  wire  _T_72 = _T_63 & _T_71; // @[el2_exu.scala 86:26]
  wire  _T_73 = _T_72 & io_dec_i0_rs1_en_d; // @[el2_exu.scala 86:54]
  wire [31:0] _T_75 = i0_rs1_bypass_en_d ? i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_76 = _T_64 ? _T_66 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_77 = _T_68 ? io_dbg_cmd_wrdata : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_78 = _T_73 ? io_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_79 = _T_75 | _T_76; // @[Mux.scala 27:72]
  wire [31:0] _T_80 = _T_79 | _T_77; // @[Mux.scala 27:72]
  wire [31:0] i0_rs1_d = _T_80 | _T_78; // @[Mux.scala 27:72]
  wire  _T_82 = ~i0_rs2_bypass_en_d; // @[el2_exu.scala 90:6]
  wire  _T_83 = _T_82 & io_dec_i0_rs2_en_d; // @[el2_exu.scala 90:26]
  wire [31:0] _T_88 = _T_83 ? io_gpr_i0_rs2_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_89 = _T_82 ? io_dec_i0_immed_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_90 = i0_rs2_bypass_en_d ? i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_91 = _T_88 | _T_89; // @[Mux.scala 27:72]
  wire  _T_94 = ~io_dec_extint_stall; // @[el2_exu.scala 96:28]
  wire  _T_95 = _T_63 & _T_94; // @[el2_exu.scala 96:26]
  wire  _T_96 = _T_95 & io_dec_i0_rs1_en_d; // @[el2_exu.scala 96:49]
  wire  _T_99 = i0_rs1_bypass_en_d & _T_94; // @[el2_exu.scala 97:25]
  wire [31:0] _T_102 = {io_dec_tlu_meihap,2'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_103 = _T_96 ? io_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_104 = _T_99 ? i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_105 = io_dec_extint_stall ? _T_102 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_106 = _T_103 | _T_104; // @[Mux.scala 27:72]
  wire  _T_111 = _T_82 & _T_94; // @[el2_exu.scala 102:26]
  wire  _T_112 = _T_111 & io_dec_i0_rs2_en_d; // @[el2_exu.scala 102:49]
  wire  _T_115 = i0_rs2_bypass_en_d & _T_94; // @[el2_exu.scala 103:25]
  wire [31:0] _T_117 = _T_112 ? io_gpr_i0_rs2_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_118 = _T_115 ? i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire  _T_122 = _T_63 & io_dec_i0_rs1_en_d; // @[el2_exu.scala 107:26]
  wire [31:0] _T_125 = _T_122 ? io_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_167 = {ghr_x[6:0],i0_taken_x}; // @[Cat.scala 29:58]
  wire [20:0] final_predpipe_mp = i0_flush_upper_x ? predpipe_x : 21'h0; // @[el2_exu.scala 191:49]
  wire  _T_179 = i0_flush_upper_x & _T_149; // @[el2_exu.scala 193:67]
  wire [31:0] i0_flush_path_d = {{1'd0}, i_alu_io_flush_path_out}; // @[el2_exu.scala 21:46 el2_exu.scala 136:41]
  wire [31:0] _T_186 = io_dec_tlu_flush_lower_r ? {{1'd0}, io_dec_tlu_flush_path_r} : i0_flush_path_d; // @[el2_exu.scala 210:56]
  wire [31:0] pred_correct_npc_r = {{1'd0}, _T_23}; // @[el2_exu.scala 26:46 el2_exu.scala 55:41]
  wire [31:0] _T_188 = i0_pred_correct_upper_r ? pred_correct_npc_r : i0_flush_path_upper_r; // @[el2_exu.scala 211:56]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  rvclkhdr rvclkhdr_12 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_12_io_l1clk),
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en),
    .io_scan_mode(rvclkhdr_12_io_scan_mode)
  );
  rvclkhdr rvclkhdr_13 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_13_io_l1clk),
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en),
    .io_scan_mode(rvclkhdr_13_io_scan_mode)
  );
  rvclkhdr rvclkhdr_14 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_14_io_l1clk),
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en),
    .io_scan_mode(rvclkhdr_14_io_scan_mode)
  );
  rvclkhdr rvclkhdr_15 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_15_io_l1clk),
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en),
    .io_scan_mode(rvclkhdr_15_io_scan_mode)
  );
  rvclkhdr rvclkhdr_16 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_16_io_l1clk),
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en),
    .io_scan_mode(rvclkhdr_16_io_scan_mode)
  );
  rvclkhdr rvclkhdr_17 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_17_io_l1clk),
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en),
    .io_scan_mode(rvclkhdr_17_io_scan_mode)
  );
  el2_exu_alu_ctl i_alu ( // @[el2_exu.scala 120:19]
    .clock(i_alu_clock),
    .reset(i_alu_reset),
    .io_scan_mode(i_alu_io_scan_mode),
    .io_flush_upper_x(i_alu_io_flush_upper_x),
    .io_flush_lower_r(i_alu_io_flush_lower_r),
    .io_enable(i_alu_io_enable),
    .io_valid_in(i_alu_io_valid_in),
    .io_ap_land(i_alu_io_ap_land),
    .io_ap_lor(i_alu_io_ap_lor),
    .io_ap_lxor(i_alu_io_ap_lxor),
    .io_ap_sll(i_alu_io_ap_sll),
    .io_ap_srl(i_alu_io_ap_srl),
    .io_ap_sra(i_alu_io_ap_sra),
    .io_ap_beq(i_alu_io_ap_beq),
    .io_ap_bne(i_alu_io_ap_bne),
    .io_ap_blt(i_alu_io_ap_blt),
    .io_ap_bge(i_alu_io_ap_bge),
    .io_ap_add(i_alu_io_ap_add),
    .io_ap_sub(i_alu_io_ap_sub),
    .io_ap_slt(i_alu_io_ap_slt),
    .io_ap_unsign(i_alu_io_ap_unsign),
    .io_ap_jal(i_alu_io_ap_jal),
    .io_ap_predict_t(i_alu_io_ap_predict_t),
    .io_ap_predict_nt(i_alu_io_ap_predict_nt),
    .io_ap_csr_write(i_alu_io_ap_csr_write),
    .io_ap_csr_imm(i_alu_io_ap_csr_imm),
    .io_csr_ren_in(i_alu_io_csr_ren_in),
    .io_a_in(i_alu_io_a_in),
    .io_b_in(i_alu_io_b_in),
    .io_pc_in(i_alu_io_pc_in),
    .io_pp_in_boffset(i_alu_io_pp_in_boffset),
    .io_pp_in_pc4(i_alu_io_pp_in_pc4),
    .io_pp_in_hist(i_alu_io_pp_in_hist),
    .io_pp_in_toffset(i_alu_io_pp_in_toffset),
    .io_pp_in_valid(i_alu_io_pp_in_valid),
    .io_pp_in_br_error(i_alu_io_pp_in_br_error),
    .io_pp_in_br_start_error(i_alu_io_pp_in_br_start_error),
    .io_pp_in_prett(i_alu_io_pp_in_prett),
    .io_pp_in_pcall(i_alu_io_pp_in_pcall),
    .io_pp_in_pret(i_alu_io_pp_in_pret),
    .io_pp_in_pja(i_alu_io_pp_in_pja),
    .io_pp_in_way(i_alu_io_pp_in_way),
    .io_brimm_in(i_alu_io_brimm_in),
    .io_result_ff(i_alu_io_result_ff),
    .io_flush_upper_out(i_alu_io_flush_upper_out),
    .io_flush_final_out(i_alu_io_flush_final_out),
    .io_flush_path_out(i_alu_io_flush_path_out),
    .io_pc_ff(i_alu_io_pc_ff),
    .io_pred_correct_out(i_alu_io_pred_correct_out),
    .io_predict_p_out_misp(i_alu_io_predict_p_out_misp),
    .io_predict_p_out_ataken(i_alu_io_predict_p_out_ataken),
    .io_predict_p_out_boffset(i_alu_io_predict_p_out_boffset),
    .io_predict_p_out_pc4(i_alu_io_predict_p_out_pc4),
    .io_predict_p_out_hist(i_alu_io_predict_p_out_hist),
    .io_predict_p_out_toffset(i_alu_io_predict_p_out_toffset),
    .io_predict_p_out_valid(i_alu_io_predict_p_out_valid),
    .io_predict_p_out_br_error(i_alu_io_predict_p_out_br_error),
    .io_predict_p_out_br_start_error(i_alu_io_predict_p_out_br_start_error),
    .io_predict_p_out_pcall(i_alu_io_predict_p_out_pcall),
    .io_predict_p_out_pret(i_alu_io_predict_p_out_pret),
    .io_predict_p_out_pja(i_alu_io_predict_p_out_pja),
    .io_predict_p_out_way(i_alu_io_predict_p_out_way)
  );
  el2_exu_mul_ctl i_mul ( // @[el2_exu.scala 141:19]
    .clock(i_mul_clock),
    .reset(i_mul_reset),
    .io_scan_mode(i_mul_io_scan_mode),
    .io_mul_p_valid(i_mul_io_mul_p_valid),
    .io_mul_p_rs1_sign(i_mul_io_mul_p_rs1_sign),
    .io_mul_p_rs2_sign(i_mul_io_mul_p_rs2_sign),
    .io_mul_p_low(i_mul_io_mul_p_low),
    .io_rs1_in(i_mul_io_rs1_in),
    .io_rs2_in(i_mul_io_rs2_in),
    .io_result_x(i_mul_io_result_x)
  );
  el2_exu_div_ctl i_div ( // @[el2_exu.scala 148:19]
    .clock(i_div_clock),
    .reset(i_div_reset),
    .io_scan_mode(i_div_io_scan_mode),
    .io_dp_valid(i_div_io_dp_valid),
    .io_dp_unsign(i_div_io_dp_unsign),
    .io_dp_rem(i_div_io_dp_rem),
    .io_dividend(i_div_io_dividend),
    .io_divisor(i_div_io_divisor),
    .io_cancel(i_div_io_cancel),
    .io_out(i_div_io_out),
    .io_finish_dly(i_div_io_finish_dly)
  );
  assign io_exu_lsu_rs1_d = _T_106 | _T_105; // @[el2_exu.scala 95:19]
  assign io_exu_lsu_rs2_d = _T_117 | _T_118; // @[el2_exu.scala 101:19]
  assign io_exu_flush_final = i_alu_io_flush_final_out; // @[el2_exu.scala 135:33]
  assign io_exu_flush_path_final = _T_186[30:0]; // @[el2_exu.scala 210:50]
  assign io_exu_i0_result_x = mul_valid_x ? i_mul_io_result_x : i_alu_io_result_ff; // @[el2_exu.scala 157:42]
  assign io_exu_i0_pc_x = i_alu_io_pc_ff; // @[el2_exu.scala 139:41]
  assign io_exu_csr_rs1_x = _T_3; // @[el2_exu.scala 41:41]
  assign io_exu_npc_r = _T_188[30:0]; // @[el2_exu.scala 211:50]
  assign io_exu_i0_br_hist_r = i0_pp_r_hist; // @[el2_exu.scala 184:50]
  assign io_exu_i0_br_error_r = i0_pp_r_br_error; // @[el2_exu.scala 185:42]
  assign io_exu_i0_br_start_error_r = i0_pp_r_br_start_error; // @[el2_exu.scala 187:36]
  assign io_exu_i0_br_index_r = predpipe_r[12:5]; // @[el2_exu.scala 189:42]
  assign io_exu_i0_br_valid_r = i0_pp_r_valid; // @[el2_exu.scala 181:36]
  assign io_exu_i0_br_mp_r = i0_pp_r_misp; // @[el2_exu.scala 182:36]
  assign io_exu_i0_br_middle_r = i0_pp_r_pc4 ^ i0_pp_r_boffset; // @[el2_exu.scala 186:36]
  assign io_exu_i0_br_fghr_r = predpipe_r[20:13]; // @[el2_exu.scala 188:50]
  assign io_exu_i0_br_way_r = i0_pp_r_way; // @[el2_exu.scala 183:36]
  assign io_exu_mp_pkt_misp = i0_flush_upper_x & i0_predict_p_x_misp; // @[el2_exu.scala 197:36]
  assign io_exu_mp_pkt_ataken = i0_flush_upper_x & i0_predict_p_x_ataken; // @[el2_exu.scala 201:36]
  assign io_exu_mp_pkt_boffset = i0_flush_upper_x & i0_predict_p_x_boffset; // @[el2_exu.scala 202:36]
  assign io_exu_mp_pkt_pc4 = i0_flush_upper_x & i0_predict_p_x_pc4; // @[el2_exu.scala 203:36]
  assign io_exu_mp_pkt_hist = i0_flush_upper_x ? i0_predict_p_x_hist : 2'h0; // @[el2_exu.scala 204:50]
  assign io_exu_mp_pkt_toffset = i0_flush_upper_x ? i0_predict_p_x_toffset : 12'h0; // @[el2_exu.scala 205:42]
  assign io_exu_mp_pkt_valid = 1'h0; // @[el2_exu.scala 32:41]
  assign io_exu_mp_pkt_br_error = 1'h0; // @[el2_exu.scala 31:41]
  assign io_exu_mp_pkt_br_start_error = 1'h0; // @[el2_exu.scala 30:31]
  assign io_exu_mp_pkt_prett = 31'h0; // @[el2_exu.scala 29:41]
  assign io_exu_mp_pkt_pcall = i0_flush_upper_x & i0_predict_p_x_pcall; // @[el2_exu.scala 198:36]
  assign io_exu_mp_pkt_pret = i0_flush_upper_x & i0_predict_p_x_pret; // @[el2_exu.scala 200:36]
  assign io_exu_mp_pkt_pja = i0_flush_upper_x & i0_predict_p_x_pja; // @[el2_exu.scala 199:36]
  assign io_exu_mp_pkt_way = i0_flush_upper_x & i0_predict_p_x_way; // @[el2_exu.scala 196:36]
  assign io_exu_mp_eghr = final_predpipe_mp[20:13]; // @[el2_exu.scala 209:36]
  assign io_exu_mp_fghr = _T_179 ? ghr_d : ghr_x; // @[el2_exu.scala 206:36]
  assign io_exu_mp_index = final_predpipe_mp[12:5]; // @[el2_exu.scala 207:58]
  assign io_exu_mp_btag = final_predpipe_mp[4:0]; // @[el2_exu.scala 208:58]
  assign io_exu_pmu_i0_br_misp = i0_pp_r_misp; // @[el2_exu.scala 161:31]
  assign io_exu_pmu_i0_br_ataken = i0_pp_r_ataken; // @[el2_exu.scala 162:31]
  assign io_exu_pmu_i0_pc4 = i0_pp_r_pc4; // @[el2_exu.scala 163:31]
  assign io_exu_div_result = i_div_io_out; // @[el2_exu.scala 155:33]
  assign io_exu_div_wren = i_div_io_finish_dly; // @[el2_exu.scala 154:41]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_dec_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = io_dec_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_2_io_en = io_dec_data_en[1]; // @[el2_lib.scala 521:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = io_dec_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = io_dec_data_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = io_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = io_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = io_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_8_io_en = io_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_9_io_en = io_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_10_io_en = io_dec_ctl_en[0]; // @[el2_lib.scala 521:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = io_dec_ctl_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = io_dec_ctl_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_13_io_en = io_dec_data_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_14_io_en = io_dec_data_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_15_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_15_io_en = _T_41 | _T_42; // @[el2_lib.scala 511:17]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_16_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_16_io_en = _T_41 | _T_42; // @[el2_lib.scala 511:17]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_17_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_17_io_en = _T_41 | _T_42; // @[el2_lib.scala 511:17]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign i_alu_clock = clock;
  assign i_alu_reset = reset;
  assign i_alu_io_scan_mode = io_scan_mode; // @[el2_exu.scala 121:33]
  assign i_alu_io_flush_upper_x = i0_flush_upper_x; // @[el2_exu.scala 125:33]
  assign i_alu_io_flush_lower_r = io_dec_tlu_flush_lower_r; // @[el2_exu.scala 126:33]
  assign i_alu_io_enable = io_dec_ctl_en[1]; // @[el2_exu.scala 122:41]
  assign i_alu_io_valid_in = io_dec_i0_alu_decode_d; // @[el2_exu.scala 124:33]
  assign i_alu_io_ap_land = io_i0_ap_land; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_lor = io_i0_ap_lor; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_lxor = io_i0_ap_lxor; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_sll = io_i0_ap_sll; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_srl = io_i0_ap_srl; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_sra = io_i0_ap_sra; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_beq = io_i0_ap_beq; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_bne = io_i0_ap_bne; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_blt = io_i0_ap_blt; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_bge = io_i0_ap_bge; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_add = io_i0_ap_add; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_sub = io_i0_ap_sub; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_slt = io_i0_ap_slt; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_unsign = io_i0_ap_unsign; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_jal = io_i0_ap_jal; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_predict_t = io_i0_ap_predict_t; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_predict_nt = io_i0_ap_predict_nt; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_csr_write = io_i0_ap_csr_write; // @[el2_exu.scala 131:41]
  assign i_alu_io_ap_csr_imm = io_i0_ap_csr_imm; // @[el2_exu.scala 131:41]
  assign i_alu_io_csr_ren_in = io_dec_csr_ren_d; // @[el2_exu.scala 132:33]
  assign i_alu_io_a_in = _T_80 | _T_78; // @[el2_exu.scala 127:33]
  assign i_alu_io_b_in = _T_91 | _T_90; // @[el2_exu.scala 128:33]
  assign i_alu_io_pc_in = io_dec_i0_pc_d; // @[el2_exu.scala 129:41]
  assign i_alu_io_pp_in_boffset = io_dec_i0_pc_d[0]; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_pc4 = io_dec_i0_predict_p_d_pc4; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_hist = io_dec_i0_predict_p_d_hist; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_toffset = io_dec_i0_predict_p_d_toffset; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_valid = io_dec_i0_predict_p_d_valid; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_br_error = io_dec_i0_predict_p_d_br_error; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_br_start_error = io_dec_i0_predict_p_d_br_start_error; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_prett = io_dec_i0_predict_p_d_prett; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_pcall = io_dec_i0_predict_p_d_pcall; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_pret = io_dec_i0_predict_p_d_pret; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_pja = io_dec_i0_predict_p_d_pja; // @[el2_exu.scala 123:41]
  assign i_alu_io_pp_in_way = io_dec_i0_predict_p_d_way; // @[el2_exu.scala 123:41]
  assign i_alu_io_brimm_in = io_dec_i0_br_immed_d; // @[el2_exu.scala 130:33]
  assign i_mul_clock = clock;
  assign i_mul_reset = reset;
  assign i_mul_io_scan_mode = io_scan_mode; // @[el2_exu.scala 142:33]
  assign i_mul_io_mul_p_valid = io_mul_p_valid; // @[el2_exu.scala 143:41]
  assign i_mul_io_mul_p_rs1_sign = io_mul_p_rs1_sign; // @[el2_exu.scala 143:41]
  assign i_mul_io_mul_p_rs2_sign = io_mul_p_rs2_sign; // @[el2_exu.scala 143:41]
  assign i_mul_io_mul_p_low = io_mul_p_low; // @[el2_exu.scala 143:41]
  assign i_mul_io_rs1_in = _T_125 | _T_75; // @[el2_exu.scala 144:41]
  assign i_mul_io_rs2_in = _T_91 | _T_90; // @[el2_exu.scala 145:41]
  assign i_div_clock = clock;
  assign i_div_reset = reset;
  assign i_div_io_scan_mode = io_scan_mode; // @[el2_exu.scala 149:33]
  assign i_div_io_dp_valid = io_div_p_valid; // @[el2_exu.scala 151:41]
  assign i_div_io_dp_unsign = io_div_p_unsign; // @[el2_exu.scala 151:41]
  assign i_div_io_dp_rem = io_div_p_rem; // @[el2_exu.scala 151:41]
  assign i_div_io_dividend = _T_125 | _T_75; // @[el2_exu.scala 152:33]
  assign i_div_io_divisor = _T_91 | _T_90; // @[el2_exu.scala 153:33]
  assign i_div_io_cancel = io_dec_div_cancel; // @[el2_exu.scala 150:41]
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
  i0_flush_path_x = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  _T_3 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  i0_predict_p_x_misp = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  i0_predict_p_x_ataken = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  i0_predict_p_x_boffset = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  i0_predict_p_x_pc4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  i0_predict_p_x_hist = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  i0_predict_p_x_toffset = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  i0_predict_p_x_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  i0_predict_p_x_br_error = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  i0_predict_p_x_br_start_error = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  i0_predict_p_x_pcall = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  i0_predict_p_x_pret = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  i0_predict_p_x_pja = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  i0_predict_p_x_way = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  predpipe_x = _RAND_15[20:0];
  _RAND_16 = {1{`RANDOM}};
  predpipe_r = _RAND_16[20:0];
  _RAND_17 = {1{`RANDOM}};
  ghr_x = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  i0_pred_correct_upper_x = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  i0_flush_upper_x = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  i0_taken_x = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  i0_valid_x = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  i0_pp_r_misp = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  i0_pp_r_ataken = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  i0_pp_r_boffset = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  i0_pp_r_pc4 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  i0_pp_r_hist = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  i0_pp_r_valid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  i0_pp_r_br_error = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  i0_pp_r_br_start_error = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  i0_pp_r_way = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  pred_temp1 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  i0_pred_correct_upper_r = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  i0_flush_path_upper_r = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  pred_temp2 = _RAND_34[24:0];
  _RAND_35 = {1{`RANDOM}};
  ghr_d = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  mul_valid_x = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  flush_lower_ff = _RAND_37[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    i0_flush_path_x = 32'h0;
  end
  if (reset) begin
    _T_3 = 32'h0;
  end
  if (reset) begin
    i0_predict_p_x_misp = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_ataken = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_boffset = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_pc4 = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_hist = 2'h0;
  end
  if (reset) begin
    i0_predict_p_x_toffset = 12'h0;
  end
  if (reset) begin
    i0_predict_p_x_valid = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_br_error = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_br_start_error = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_pcall = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_pret = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_pja = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_way = 1'h0;
  end
  if (reset) begin
    predpipe_x = 21'h0;
  end
  if (reset) begin
    predpipe_r = 21'h0;
  end
  if (reset) begin
    ghr_x = 8'h0;
  end
  if (reset) begin
    i0_pred_correct_upper_x = 1'h0;
  end
  if (reset) begin
    i0_flush_upper_x = 1'h0;
  end
  if (reset) begin
    i0_taken_x = 1'h0;
  end
  if (reset) begin
    i0_valid_x = 1'h0;
  end
  if (reset) begin
    i0_pp_r_misp = 1'h0;
  end
  if (reset) begin
    i0_pp_r_ataken = 1'h0;
  end
  if (reset) begin
    i0_pp_r_boffset = 1'h0;
  end
  if (reset) begin
    i0_pp_r_pc4 = 1'h0;
  end
  if (reset) begin
    i0_pp_r_hist = 2'h0;
  end
  if (reset) begin
    i0_pp_r_valid = 1'h0;
  end
  if (reset) begin
    i0_pp_r_br_error = 1'h0;
  end
  if (reset) begin
    i0_pp_r_br_start_error = 1'h0;
  end
  if (reset) begin
    i0_pp_r_way = 1'h0;
  end
  if (reset) begin
    pred_temp1 = 6'h0;
  end
  if (reset) begin
    i0_pred_correct_upper_r = 1'h0;
  end
  if (reset) begin
    i0_flush_path_upper_r = 32'h0;
  end
  if (reset) begin
    pred_temp2 = 25'h0;
  end
  if (reset) begin
    ghr_d = 8'h0;
  end
  if (reset) begin
    mul_valid_x = 1'h0;
  end
  if (reset) begin
    flush_lower_ff = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_flush_path_x <= 32'h0;
    end else begin
      i0_flush_path_x <= {{1'd0}, i_alu_io_flush_path_out};
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_3 <= 32'h0;
    end else if (io_dec_csr_ren_d) begin
      _T_3 <= i0_rs1_d;
    end else begin
      _T_3 <= io_exu_csr_rs1_x;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_misp <= 1'h0;
    end else begin
      i0_predict_p_x_misp <= i_alu_io_predict_p_out_misp;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_ataken <= 1'h0;
    end else begin
      i0_predict_p_x_ataken <= i_alu_io_predict_p_out_ataken;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_boffset <= 1'h0;
    end else begin
      i0_predict_p_x_boffset <= i_alu_io_predict_p_out_boffset;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_pc4 <= 1'h0;
    end else begin
      i0_predict_p_x_pc4 <= i_alu_io_predict_p_out_pc4;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_hist <= 2'h0;
    end else begin
      i0_predict_p_x_hist <= i_alu_io_predict_p_out_hist;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_toffset <= 12'h0;
    end else begin
      i0_predict_p_x_toffset <= i_alu_io_predict_p_out_toffset;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_valid <= 1'h0;
    end else begin
      i0_predict_p_x_valid <= i_alu_io_predict_p_out_valid;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_br_error <= 1'h0;
    end else begin
      i0_predict_p_x_br_error <= i_alu_io_predict_p_out_br_error;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_br_start_error <= 1'h0;
    end else begin
      i0_predict_p_x_br_start_error <= i_alu_io_predict_p_out_br_start_error;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_pcall <= 1'h0;
    end else begin
      i0_predict_p_x_pcall <= i_alu_io_predict_p_out_pcall;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_pret <= 1'h0;
    end else begin
      i0_predict_p_x_pret <= i_alu_io_predict_p_out_pret;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_pja <= 1'h0;
    end else begin
      i0_predict_p_x_pja <= i_alu_io_predict_p_out_pja;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_way <= 1'h0;
    end else begin
      i0_predict_p_x_way <= i_alu_io_predict_p_out_way;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      predpipe_x <= 21'h0;
    end else begin
      predpipe_x <= {_T,io_i0_predict_btag_d};
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      predpipe_r <= 21'h0;
    end else begin
      predpipe_r <= predpipe_x;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      ghr_x <= 8'h0;
    end else if (i0_valid_x) begin
      ghr_x <= _T_167;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pred_correct_upper_x <= 1'h0;
    end else begin
      i0_pred_correct_upper_x <= i_alu_io_pred_correct_out;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_flush_upper_x <= 1'h0;
    end else begin
      i0_flush_upper_x <= i_alu_io_flush_upper_out;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_taken_x <= 1'h0;
    end else begin
      i0_taken_x <= i0_predict_p_d_ataken & io_dec_i0_alu_decode_d;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_valid_x <= 1'h0;
    end else begin
      i0_valid_x <= _T_145 & _T_149;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_misp <= 1'h0;
    end else begin
      i0_pp_r_misp <= i0_predict_p_x_misp;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_ataken <= 1'h0;
    end else begin
      i0_pp_r_ataken <= i0_predict_p_x_ataken;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_boffset <= 1'h0;
    end else begin
      i0_pp_r_boffset <= i0_predict_p_x_boffset;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_pc4 <= 1'h0;
    end else begin
      i0_pp_r_pc4 <= i0_predict_p_x_pc4;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_hist <= 2'h0;
    end else begin
      i0_pp_r_hist <= i0_predict_p_x_hist;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_valid <= 1'h0;
    end else begin
      i0_pp_r_valid <= i0_predict_p_x_valid;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_br_error <= 1'h0;
    end else begin
      i0_pp_r_br_error <= i0_predict_p_x_br_error;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_br_start_error <= 1'h0;
    end else begin
      i0_pp_r_br_start_error <= i0_predict_p_x_br_start_error;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_way <= 1'h0;
    end else begin
      i0_pp_r_way <= i0_predict_p_x_way;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      pred_temp1 <= 6'h0;
    end else begin
      pred_temp1 <= io_pred_correct_npc_x[5:0];
    end
  end
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pred_correct_upper_r <= 1'h0;
    end else begin
      i0_pred_correct_upper_r <= i0_pred_correct_upper_x;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_flush_path_upper_r <= 32'h0;
    end else begin
      i0_flush_path_upper_r <= i0_flush_path_x;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      pred_temp2 <= 25'h0;
    end else begin
      pred_temp2 <= io_pred_correct_npc_x[30:6];
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      ghr_d <= 8'h0;
    end else begin
      ghr_d <= _T_162 | _T_161;
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      mul_valid_x <= 1'h0;
    end else begin
      mul_valid_x <= io_mul_p_valid;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      flush_lower_ff <= 1'h0;
    end else begin
      flush_lower_ff <= io_dec_tlu_flush_lower_r;
    end
  end
endmodule
