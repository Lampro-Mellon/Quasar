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
  gated_latch clkhdr ( // @[el2_lib.scala 474:26]
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
  input         io_pp_in_misp,
  input         io_pp_in_ataken,
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
  output [30:0] io_predict_p_out_prett,
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
  wire  _T_234 = ~_T_218[12]; // @[el2_lib.scala 213:8]
  wire  _T_236 = _T_234 & _T_221[12]; // @[el2_lib.scala 213:14]
  wire  _T_240 = _T_218[12] & _T_230; // @[el2_lib.scala 214:14]
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
  assign io_predict_p_out_prett = io_pp_in_prett; // @[el2_exu_alu_ctl.scala 125:30]
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
