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
module exu_alu_ctl(
  input         clock,
  input         reset,
  input         io_dec_alu_dec_i0_alu_decode_d,
  input         io_dec_alu_dec_csr_ren_d,
  input  [11:0] io_dec_alu_dec_i0_br_immed_d,
  output [30:0] io_dec_alu_exu_i0_pc_x,
  input  [30:0] io_dec_i0_pc_d,
  input         io_scan_mode,
  input         io_flush_upper_x,
  input         io_dec_tlu_flush_lower_r,
  input         io_enable,
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
  input  [31:0] io_a_in,
  input  [31:0] io_b_in,
  input         io_pp_in_valid,
  input         io_pp_in_bits_boffset,
  input         io_pp_in_bits_pc4,
  input  [1:0]  io_pp_in_bits_hist,
  input  [11:0] io_pp_in_bits_toffset,
  input         io_pp_in_bits_br_error,
  input         io_pp_in_bits_br_start_error,
  input  [30:0] io_pp_in_bits_prett,
  input         io_pp_in_bits_pcall,
  input         io_pp_in_bits_pret,
  input         io_pp_in_bits_pja,
  input         io_pp_in_bits_way,
  output [31:0] io_result_ff,
  output        io_flush_upper_out,
  output        io_flush_final_out,
  output [30:0] io_flush_path_out,
  output        io_pred_correct_out,
  output        io_predict_p_out_valid,
  output        io_predict_p_out_bits_misp,
  output        io_predict_p_out_bits_ataken,
  output        io_predict_p_out_bits_boffset,
  output        io_predict_p_out_bits_pc4,
  output [1:0]  io_predict_p_out_bits_hist,
  output [11:0] io_predict_p_out_bits_toffset,
  output        io_predict_p_out_bits_br_error,
  output        io_predict_p_out_bits_br_start_error,
  output        io_predict_p_out_bits_pcall,
  output        io_predict_p_out_bits_pret,
  output        io_predict_p_out_bits_pja,
  output        io_predict_p_out_bits_way
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
  wire [31:0] _T_5 = ~io_b_in; // @[exu_alu_ctl.scala 34:40]
  wire [31:0] bm = io_i0_ap_sub ? _T_5 : io_b_in; // @[exu_alu_ctl.scala 34:17]
  wire [32:0] _T_8 = {1'h0,io_a_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_10 = {1'h0,_T_5}; // @[Cat.scala 29:58]
  wire [32:0] _T_12 = _T_8 + _T_10; // @[exu_alu_ctl.scala 37:58]
  wire [32:0] _T_13 = {32'h0,io_i0_ap_sub}; // @[Cat.scala 29:58]
  wire [32:0] _T_15 = _T_12 + _T_13; // @[exu_alu_ctl.scala 37:83]
  wire [32:0] _T_18 = {1'h0,io_b_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_20 = _T_8 + _T_18; // @[exu_alu_ctl.scala 37:138]
  wire [32:0] _T_23 = _T_20 + _T_13; // @[exu_alu_ctl.scala 37:163]
  wire [32:0] aout = io_i0_ap_sub ? _T_15 : _T_23; // @[exu_alu_ctl.scala 37:14]
  wire  cout = aout[32]; // @[exu_alu_ctl.scala 38:18]
  wire  _T_26 = ~io_a_in[31]; // @[exu_alu_ctl.scala 40:14]
  wire  _T_28 = ~bm[31]; // @[exu_alu_ctl.scala 40:29]
  wire  _T_29 = _T_26 & _T_28; // @[exu_alu_ctl.scala 40:27]
  wire  _T_31 = _T_29 & aout[31]; // @[exu_alu_ctl.scala 40:37]
  wire  _T_34 = io_a_in[31] & bm[31]; // @[exu_alu_ctl.scala 40:66]
  wire  _T_36 = ~aout[31]; // @[exu_alu_ctl.scala 40:78]
  wire  _T_37 = _T_34 & _T_36; // @[exu_alu_ctl.scala 40:76]
  wire  ov = _T_31 | _T_37; // @[exu_alu_ctl.scala 40:50]
  wire  eq = $signed(io_a_in) == $signed(io_b_in); // @[exu_alu_ctl.scala 42:38]
  wire  ne = ~eq; // @[exu_alu_ctl.scala 43:29]
  wire  _T_39 = ~io_i0_ap_unsign; // @[exu_alu_ctl.scala 45:30]
  wire  _T_40 = aout[31] ^ ov; // @[exu_alu_ctl.scala 45:54]
  wire  _T_41 = _T_39 & _T_40; // @[exu_alu_ctl.scala 45:47]
  wire  _T_42 = ~cout; // @[exu_alu_ctl.scala 45:84]
  wire  _T_43 = io_i0_ap_unsign & _T_42; // @[exu_alu_ctl.scala 45:82]
  wire  lt = _T_41 | _T_43; // @[exu_alu_ctl.scala 45:61]
  wire  ge = ~lt; // @[exu_alu_ctl.scala 46:29]
  wire [31:0] _T_63 = $signed(io_a_in) & $signed(io_b_in); // @[Mux.scala 27:72]
  wire [31:0] _T_66 = $signed(io_a_in) | $signed(io_b_in); // @[Mux.scala 27:72]
  wire [31:0] _T_69 = $signed(io_a_in) ^ $signed(io_b_in); // @[Mux.scala 27:72]
  wire [31:0] _T_70 = io_dec_alu_dec_csr_ren_d ? $signed(io_b_in) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_71 = io_i0_ap_land ? $signed(_T_63) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_72 = io_i0_ap_lor ? $signed(_T_66) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_73 = io_i0_ap_lxor ? $signed(_T_69) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_75 = $signed(_T_70) | $signed(_T_71); // @[Mux.scala 27:72]
  wire [31:0] _T_77 = $signed(_T_75) | $signed(_T_72); // @[Mux.scala 27:72]
  wire [5:0] _T_84 = {1'h0,io_b_in[4:0]}; // @[Cat.scala 29:58]
  wire [5:0] _T_86 = 6'h20 - _T_84; // @[exu_alu_ctl.scala 56:41]
  wire [5:0] _T_93 = io_i0_ap_sll ? _T_86 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_94 = io_i0_ap_srl ? _T_84 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_95 = io_i0_ap_sra ? _T_84 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_96 = _T_93 | _T_94; // @[Mux.scala 27:72]
  wire [5:0] shift_amount = _T_96 | _T_95; // @[Mux.scala 27:72]
  wire [4:0] _T_102 = {io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll}; // @[Cat.scala 29:58]
  wire [4:0] _T_104 = _T_102 & io_b_in[4:0]; // @[exu_alu_ctl.scala 61:64]
  wire [62:0] _T_105 = 63'hffffffff << _T_104; // @[exu_alu_ctl.scala 61:39]
  wire [9:0] _T_115 = {io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra}; // @[Cat.scala 29:58]
  wire [18:0] _T_124 = {_T_115,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra}; // @[Cat.scala 29:58]
  wire [27:0] _T_133 = {_T_124,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra}; // @[Cat.scala 29:58]
  wire [30:0] _T_136 = {_T_133,io_i0_ap_sra,io_i0_ap_sra,io_i0_ap_sra}; // @[Cat.scala 29:58]
  wire [9:0] _T_147 = {io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [18:0] _T_156 = {_T_147,io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [27:0] _T_165 = {_T_156,io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [30:0] _T_168 = {_T_165,io_a_in[31],io_a_in[31],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [30:0] _T_169 = _T_136 & _T_168; // @[exu_alu_ctl.scala 64:47]
  wire [9:0] _T_179 = {io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll}; // @[Cat.scala 29:58]
  wire [18:0] _T_188 = {_T_179,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll}; // @[Cat.scala 29:58]
  wire [27:0] _T_197 = {_T_188,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll}; // @[Cat.scala 29:58]
  wire [30:0] _T_200 = {_T_197,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll}; // @[Cat.scala 29:58]
  wire [30:0] _T_202 = _T_200 & io_a_in[30:0]; // @[exu_alu_ctl.scala 64:96]
  wire [30:0] _T_203 = _T_169 | _T_202; // @[exu_alu_ctl.scala 64:71]
  wire [62:0] shift_extend = {_T_203,io_a_in}; // @[Cat.scala 29:58]
  wire [62:0] shift_long = shift_extend >> shift_amount[4:0]; // @[exu_alu_ctl.scala 67:32]
  wire [31:0] shift_mask = _T_105[31:0]; // @[exu_alu_ctl.scala 61:14]
  wire [31:0] sout = shift_long[31:0] & shift_mask; // @[exu_alu_ctl.scala 69:34]
  wire  _T_210 = io_i0_ap_sll | io_i0_ap_srl; // @[exu_alu_ctl.scala 72:44]
  wire  sel_shift = _T_210 | io_i0_ap_sra; // @[exu_alu_ctl.scala 72:59]
  wire  _T_211 = io_i0_ap_add | io_i0_ap_sub; // @[exu_alu_ctl.scala 73:44]
  wire  _T_212 = ~io_i0_ap_slt; // @[exu_alu_ctl.scala 73:62]
  wire  sel_adder = _T_211 & _T_212; // @[exu_alu_ctl.scala 73:60]
  wire  _T_213 = io_i0_ap_jal | io_pp_in_bits_pcall; // @[exu_alu_ctl.scala 74:44]
  wire  _T_214 = _T_213 | io_pp_in_bits_pja; // @[exu_alu_ctl.scala 74:66]
  wire  sel_pc = _T_214 | io_pp_in_bits_pret; // @[exu_alu_ctl.scala 74:86]
  wire  slt_one = io_i0_ap_slt & lt; // @[exu_alu_ctl.scala 77:43]
  wire [31:0] _T_217 = {io_dec_i0_pc_d,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_218 = {io_dec_alu_dec_i0_br_immed_d,1'h0}; // @[Cat.scala 29:58]
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
  wire [31:0] _T_250 = $signed(_T_77) | $signed(_T_73); // @[exu_alu_ctl.scala 83:24]
  wire [31:0] _T_251 = {31'h0,slt_one}; // @[Cat.scala 29:58]
  wire [31:0] _T_252 = _T_250 | _T_251; // @[exu_alu_ctl.scala 83:31]
  wire [31:0] _T_259 = io_i0_ap_csr_imm ? $signed(io_b_in) : $signed(io_a_in); // @[exu_alu_ctl.scala 87:54]
  wire [31:0] _T_260 = sel_shift ? sout : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_261 = sel_adder ? aout[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_262 = sel_pc ? pcout : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_263 = io_i0_ap_csr_write ? _T_259 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_264 = _T_260 | _T_261; // @[Mux.scala 27:72]
  wire [31:0] _T_265 = _T_264 | _T_262; // @[Mux.scala 27:72]
  wire [31:0] _T_266 = _T_265 | _T_263; // @[Mux.scala 27:72]
  wire  _T_271 = io_i0_ap_beq & eq; // @[exu_alu_ctl.scala 96:43]
  wire  _T_272 = io_i0_ap_bne & ne; // @[exu_alu_ctl.scala 96:65]
  wire  _T_273 = _T_271 | _T_272; // @[exu_alu_ctl.scala 96:49]
  wire  _T_274 = io_i0_ap_blt & lt; // @[exu_alu_ctl.scala 96:94]
  wire  _T_275 = _T_273 | _T_274; // @[exu_alu_ctl.scala 96:78]
  wire  _T_276 = io_i0_ap_bge & ge; // @[exu_alu_ctl.scala 96:116]
  wire  _T_277 = _T_275 | _T_276; // @[exu_alu_ctl.scala 96:100]
  wire  actual_taken = _T_277 | sel_pc; // @[exu_alu_ctl.scala 96:122]
  wire  _T_278 = io_dec_alu_dec_i0_alu_decode_d & io_i0_ap_predict_nt; // @[exu_alu_ctl.scala 101:61]
  wire  _T_279 = ~actual_taken; // @[exu_alu_ctl.scala 101:85]
  wire  _T_280 = _T_278 & _T_279; // @[exu_alu_ctl.scala 101:83]
  wire  _T_281 = ~sel_pc; // @[exu_alu_ctl.scala 101:101]
  wire  _T_282 = _T_280 & _T_281; // @[exu_alu_ctl.scala 101:99]
  wire  _T_283 = io_dec_alu_dec_i0_alu_decode_d & io_i0_ap_predict_t; // @[exu_alu_ctl.scala 101:145]
  wire  _T_284 = _T_283 & actual_taken; // @[exu_alu_ctl.scala 101:167]
  wire  _T_286 = _T_284 & _T_281; // @[exu_alu_ctl.scala 101:183]
  wire  _T_293 = io_i0_ap_predict_t & _T_279; // @[exu_alu_ctl.scala 106:48]
  wire  _T_294 = io_i0_ap_predict_nt & actual_taken; // @[exu_alu_ctl.scala 106:88]
  wire  cond_mispredict = _T_293 | _T_294; // @[exu_alu_ctl.scala 106:65]
  wire  _T_296 = io_pp_in_bits_prett != aout[31:1]; // @[exu_alu_ctl.scala 109:72]
  wire  target_mispredict = io_pp_in_bits_pret & _T_296; // @[exu_alu_ctl.scala 109:49]
  wire  _T_297 = io_i0_ap_jal | cond_mispredict; // @[exu_alu_ctl.scala 111:45]
  wire  _T_298 = _T_297 | target_mispredict; // @[exu_alu_ctl.scala 111:63]
  wire  _T_299 = _T_298 & io_dec_alu_dec_i0_alu_decode_d; // @[exu_alu_ctl.scala 111:84]
  wire  _T_300 = ~io_flush_upper_x; // @[exu_alu_ctl.scala 111:119]
  wire  _T_301 = _T_299 & _T_300; // @[exu_alu_ctl.scala 111:117]
  wire  _T_302 = ~io_dec_tlu_flush_lower_r; // @[exu_alu_ctl.scala 111:141]
  wire  _T_312 = io_pp_in_bits_hist[1] & io_pp_in_bits_hist[0]; // @[exu_alu_ctl.scala 117:44]
  wire  _T_314 = ~io_pp_in_bits_hist[0]; // @[exu_alu_ctl.scala 117:73]
  wire  _T_315 = _T_314 & actual_taken; // @[exu_alu_ctl.scala 117:96]
  wire  _T_316 = _T_312 | _T_315; // @[exu_alu_ctl.scala 117:70]
  wire  _T_318 = ~io_pp_in_bits_hist[1]; // @[exu_alu_ctl.scala 118:6]
  wire  _T_320 = _T_318 & _T_279; // @[exu_alu_ctl.scala 118:29]
  wire  _T_322 = io_pp_in_bits_hist[1] & actual_taken; // @[exu_alu_ctl.scala 118:72]
  wire  _T_323 = _T_320 | _T_322; // @[exu_alu_ctl.scala 118:47]
  wire  _T_327 = _T_300 & _T_302; // @[exu_alu_ctl.scala 121:56]
  wire  _T_328 = cond_mispredict | target_mispredict; // @[exu_alu_ctl.scala 121:103]
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
  assign io_dec_alu_exu_i0_pc_x = _T_1; // @[exu_alu_ctl.scala 30:26]
  assign io_result_ff = _T_3; // @[exu_alu_ctl.scala 32:16]
  assign io_flush_upper_out = _T_301 & _T_302; // @[exu_alu_ctl.scala 111:26]
  assign io_flush_final_out = _T_301 | io_dec_tlu_flush_lower_r; // @[exu_alu_ctl.scala 113:26]
  assign io_flush_path_out = sel_pc ? aout[31:1] : pcout[31:1]; // @[exu_alu_ctl.scala 103:22]
  assign io_pred_correct_out = _T_282 | _T_286; // @[exu_alu_ctl.scala 101:26]
  assign io_predict_p_out_valid = io_pp_in_valid; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_misp = _T_327 & _T_328; // @[exu_alu_ctl.scala 120:30 exu_alu_ctl.scala 121:35]
  assign io_predict_p_out_bits_ataken = _T_277 | sel_pc; // @[exu_alu_ctl.scala 120:30 exu_alu_ctl.scala 122:35]
  assign io_predict_p_out_bits_boffset = io_pp_in_bits_boffset; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_pc4 = io_pp_in_bits_pc4; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_hist = {_T_316,_T_323}; // @[exu_alu_ctl.scala 120:30 exu_alu_ctl.scala 123:35]
  assign io_predict_p_out_bits_toffset = io_pp_in_bits_toffset; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_br_error = io_pp_in_bits_br_error; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_br_start_error = io_pp_in_bits_br_start_error; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_pcall = io_pp_in_bits_pcall; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_pret = io_pp_in_bits_pret; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_pja = io_pp_in_bits_pja; // @[exu_alu_ctl.scala 120:30]
  assign io_predict_p_out_bits_way = io_pp_in_bits_way; // @[exu_alu_ctl.scala 120:30]
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
      _T_1 <= io_dec_i0_pc_d;
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
module exu_mul_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_mul_p_valid,
  input         io_mul_p_bits_rs1_sign,
  input         io_mul_p_bits_rs2_sign,
  input         io_mul_p_bits_low,
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
  wire  _T_1 = io_mul_p_bits_rs1_sign & io_rs1_in[31]; // @[exu_mul_ctl.scala 26:44]
  wire  _T_5 = io_mul_p_bits_rs2_sign & io_rs2_in[31]; // @[exu_mul_ctl.scala 27:44]
  reg  low_x; // @[el2_lib.scala 514:16]
  reg [32:0] rs1_x; // @[el2_lib.scala 534:16]
  reg [32:0] rs2_x; // @[el2_lib.scala 534:16]
  wire [65:0] prod_x = $signed(rs1_x) * $signed(rs2_x); // @[exu_mul_ctl.scala 33:20]
  wire  _T_16 = ~low_x; // @[exu_mul_ctl.scala 34:29]
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
  assign io_result_x = _T_20 | _T_21; // @[exu_mul_ctl.scala 34:15]
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
      low_x <= io_mul_p_bits_low;
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
module exu_div_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input  [31:0] io_dividend,
  input  [31:0] io_divisor,
  output [31:0] io_exu_div_result,
  output        io_exu_div_wren,
  input         io_dec_div_div_p_valid,
  input         io_dec_div_div_p_bits_unsign,
  input         io_dec_div_div_p_bits_rem,
  input         io_dec_div_dec_div_cancel
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
  wire  _T = ~io_dec_div_dec_div_cancel; // @[exu_div_ctl.scala 46:30]
  reg  valid_ff_x; // @[exu_div_ctl.scala 195:26]
  wire  valid_x = valid_ff_x & _T; // @[exu_div_ctl.scala 46:28]
  reg [32:0] q_ff; // @[el2_lib.scala 514:16]
  wire  _T_2 = q_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 52:34]
  reg [32:0] m_ff; // @[el2_lib.scala 514:16]
  wire  _T_4 = m_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 52:57]
  wire  _T_5 = _T_2 & _T_4; // @[exu_div_ctl.scala 52:43]
  wire  _T_7 = m_ff[31:0] != 32'h0; // @[exu_div_ctl.scala 52:80]
  wire  _T_8 = _T_5 & _T_7; // @[exu_div_ctl.scala 52:66]
  reg  rem_ff; // @[Reg.scala 27:20]
  wire  _T_9 = ~rem_ff; // @[exu_div_ctl.scala 52:91]
  wire  _T_10 = _T_8 & _T_9; // @[exu_div_ctl.scala 52:89]
  wire  _T_11 = _T_10 & valid_x; // @[exu_div_ctl.scala 52:99]
  wire  _T_13 = q_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 53:18]
  wire  _T_16 = _T_13 & _T_7; // @[exu_div_ctl.scala 53:27]
  wire  _T_18 = _T_16 & _T_9; // @[exu_div_ctl.scala 53:50]
  wire  _T_19 = _T_18 & valid_x; // @[exu_div_ctl.scala 53:60]
  wire  smallnum_case = _T_11 | _T_19; // @[exu_div_ctl.scala 52:110]
  wire  _T_23 = ~m_ff[3]; // @[exu_div_ctl.scala 57:69]
  wire  _T_25 = ~m_ff[2]; // @[exu_div_ctl.scala 57:69]
  wire  _T_27 = ~m_ff[1]; // @[exu_div_ctl.scala 57:69]
  wire  _T_28 = _T_23 & _T_25; // @[exu_div_ctl.scala 57:94]
  wire  _T_29 = _T_28 & _T_27; // @[exu_div_ctl.scala 57:94]
  wire  _T_30 = q_ff[3] & _T_29; // @[exu_div_ctl.scala 58:10]
  wire  _T_37 = q_ff[3] & _T_28; // @[exu_div_ctl.scala 58:10]
  wire  _T_39 = ~m_ff[0]; // @[exu_div_ctl.scala 64:32]
  wire  _T_40 = _T_37 & _T_39; // @[exu_div_ctl.scala 64:30]
  wire  _T_50 = q_ff[2] & _T_29; // @[exu_div_ctl.scala 58:10]
  wire  _T_51 = _T_40 | _T_50; // @[exu_div_ctl.scala 64:41]
  wire  _T_54 = q_ff[3] & q_ff[2]; // @[exu_div_ctl.scala 56:94]
  wire  _T_60 = _T_54 & _T_28; // @[exu_div_ctl.scala 58:10]
  wire  _T_61 = _T_51 | _T_60; // @[exu_div_ctl.scala 64:73]
  wire  _T_68 = q_ff[2] & _T_28; // @[exu_div_ctl.scala 58:10]
  wire  _T_71 = _T_68 & _T_39; // @[exu_div_ctl.scala 66:30]
  wire  _T_81 = q_ff[1] & _T_29; // @[exu_div_ctl.scala 58:10]
  wire  _T_82 = _T_71 | _T_81; // @[exu_div_ctl.scala 66:41]
  wire  _T_88 = _T_23 & _T_27; // @[exu_div_ctl.scala 57:94]
  wire  _T_89 = q_ff[3] & _T_88; // @[exu_div_ctl.scala 58:10]
  wire  _T_92 = _T_89 & _T_39; // @[exu_div_ctl.scala 66:103]
  wire  _T_93 = _T_82 | _T_92; // @[exu_div_ctl.scala 66:76]
  wire  _T_96 = ~q_ff[2]; // @[exu_div_ctl.scala 56:69]
  wire  _T_97 = q_ff[3] & _T_96; // @[exu_div_ctl.scala 56:94]
  wire  _T_105 = _T_28 & m_ff[1]; // @[exu_div_ctl.scala 57:94]
  wire  _T_106 = _T_105 & m_ff[0]; // @[exu_div_ctl.scala 57:94]
  wire  _T_107 = _T_97 & _T_106; // @[exu_div_ctl.scala 58:10]
  wire  _T_108 = _T_93 | _T_107; // @[exu_div_ctl.scala 66:114]
  wire  _T_110 = ~q_ff[3]; // @[exu_div_ctl.scala 56:69]
  wire  _T_113 = _T_110 & q_ff[2]; // @[exu_div_ctl.scala 56:94]
  wire  _T_114 = _T_113 & q_ff[1]; // @[exu_div_ctl.scala 56:94]
  wire  _T_120 = _T_114 & _T_28; // @[exu_div_ctl.scala 58:10]
  wire  _T_121 = _T_108 | _T_120; // @[exu_div_ctl.scala 67:43]
  wire  _T_127 = _T_54 & _T_23; // @[exu_div_ctl.scala 58:10]
  wire  _T_130 = _T_127 & _T_39; // @[exu_div_ctl.scala 67:104]
  wire  _T_131 = _T_121 | _T_130; // @[exu_div_ctl.scala 67:78]
  wire  _T_140 = _T_23 & m_ff[2]; // @[exu_div_ctl.scala 57:94]
  wire  _T_141 = _T_140 & _T_27; // @[exu_div_ctl.scala 57:94]
  wire  _T_142 = _T_54 & _T_141; // @[exu_div_ctl.scala 58:10]
  wire  _T_143 = _T_131 | _T_142; // @[exu_div_ctl.scala 67:116]
  wire  _T_146 = q_ff[3] & q_ff[1]; // @[exu_div_ctl.scala 56:94]
  wire  _T_152 = _T_146 & _T_88; // @[exu_div_ctl.scala 58:10]
  wire  _T_153 = _T_143 | _T_152; // @[exu_div_ctl.scala 68:43]
  wire  _T_158 = _T_54 & q_ff[1]; // @[exu_div_ctl.scala 56:94]
  wire  _T_163 = _T_158 & _T_140; // @[exu_div_ctl.scala 58:10]
  wire  _T_164 = _T_153 | _T_163; // @[exu_div_ctl.scala 68:77]
  wire  _T_168 = q_ff[2] & q_ff[1]; // @[exu_div_ctl.scala 56:94]
  wire  _T_169 = _T_168 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_175 = _T_169 & _T_88; // @[exu_div_ctl.scala 58:10]
  wire  _T_181 = _T_97 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_186 = _T_23 & m_ff[1]; // @[exu_div_ctl.scala 57:94]
  wire  _T_187 = _T_186 & m_ff[0]; // @[exu_div_ctl.scala 57:94]
  wire  _T_188 = _T_181 & _T_187; // @[exu_div_ctl.scala 58:10]
  wire  _T_189 = _T_175 | _T_188; // @[exu_div_ctl.scala 70:44]
  wire  _T_196 = q_ff[2] & _T_88; // @[exu_div_ctl.scala 58:10]
  wire  _T_199 = _T_196 & _T_39; // @[exu_div_ctl.scala 70:111]
  wire  _T_200 = _T_189 | _T_199; // @[exu_div_ctl.scala 70:84]
  wire  _T_207 = q_ff[1] & _T_28; // @[exu_div_ctl.scala 58:10]
  wire  _T_210 = _T_207 & _T_39; // @[exu_div_ctl.scala 71:32]
  wire  _T_211 = _T_200 | _T_210; // @[exu_div_ctl.scala 70:126]
  wire  _T_221 = q_ff[0] & _T_29; // @[exu_div_ctl.scala 58:10]
  wire  _T_222 = _T_211 | _T_221; // @[exu_div_ctl.scala 71:46]
  wire  _T_227 = ~q_ff[1]; // @[exu_div_ctl.scala 56:69]
  wire  _T_229 = _T_113 & _T_227; // @[exu_div_ctl.scala 56:94]
  wire  _T_239 = _T_229 & _T_106; // @[exu_div_ctl.scala 58:10]
  wire  _T_240 = _T_222 | _T_239; // @[exu_div_ctl.scala 71:86]
  wire  _T_249 = _T_114 & _T_23; // @[exu_div_ctl.scala 58:10]
  wire  _T_252 = _T_249 & _T_39; // @[exu_div_ctl.scala 72:35]
  wire  _T_253 = _T_240 | _T_252; // @[exu_div_ctl.scala 71:128]
  wire  _T_259 = _T_25 & _T_27; // @[exu_div_ctl.scala 57:94]
  wire  _T_260 = q_ff[3] & _T_259; // @[exu_div_ctl.scala 58:10]
  wire  _T_263 = _T_260 & _T_39; // @[exu_div_ctl.scala 72:74]
  wire  _T_264 = _T_253 | _T_263; // @[exu_div_ctl.scala 72:46]
  wire  _T_274 = _T_140 & m_ff[1]; // @[exu_div_ctl.scala 57:94]
  wire  _T_275 = _T_97 & _T_274; // @[exu_div_ctl.scala 58:10]
  wire  _T_276 = _T_264 | _T_275; // @[exu_div_ctl.scala 72:86]
  wire  _T_290 = _T_114 & _T_141; // @[exu_div_ctl.scala 58:10]
  wire  _T_291 = _T_276 | _T_290; // @[exu_div_ctl.scala 72:128]
  wire  _T_297 = _T_113 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_303 = _T_297 & _T_88; // @[exu_div_ctl.scala 58:10]
  wire  _T_304 = _T_291 | _T_303; // @[exu_div_ctl.scala 73:46]
  wire  _T_311 = _T_97 & _T_227; // @[exu_div_ctl.scala 56:94]
  wire  _T_317 = _T_140 & m_ff[0]; // @[exu_div_ctl.scala 57:94]
  wire  _T_318 = _T_311 & _T_317; // @[exu_div_ctl.scala 58:10]
  wire  _T_319 = _T_304 | _T_318; // @[exu_div_ctl.scala 73:86]
  wire  _T_324 = _T_96 & q_ff[1]; // @[exu_div_ctl.scala 56:94]
  wire  _T_325 = _T_324 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_331 = _T_325 & _T_28; // @[exu_div_ctl.scala 58:10]
  wire  _T_332 = _T_319 | _T_331; // @[exu_div_ctl.scala 73:128]
  wire  _T_338 = _T_54 & _T_27; // @[exu_div_ctl.scala 58:10]
  wire  _T_341 = _T_338 & _T_39; // @[exu_div_ctl.scala 74:73]
  wire  _T_342 = _T_332 | _T_341; // @[exu_div_ctl.scala 74:46]
  wire  _T_350 = _T_114 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_355 = _T_350 & _T_140; // @[exu_div_ctl.scala 58:10]
  wire  _T_356 = _T_342 | _T_355; // @[exu_div_ctl.scala 74:86]
  wire  _T_363 = m_ff[3] & _T_25; // @[exu_div_ctl.scala 57:94]
  wire  _T_364 = _T_54 & _T_363; // @[exu_div_ctl.scala 58:10]
  wire  _T_365 = _T_356 | _T_364; // @[exu_div_ctl.scala 74:128]
  wire  _T_375 = _T_363 & _T_27; // @[exu_div_ctl.scala 57:94]
  wire  _T_376 = _T_146 & _T_375; // @[exu_div_ctl.scala 58:10]
  wire  _T_377 = _T_365 | _T_376; // @[exu_div_ctl.scala 75:46]
  wire  _T_380 = q_ff[3] & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_386 = _T_380 & _T_259; // @[exu_div_ctl.scala 58:10]
  wire  _T_387 = _T_377 | _T_386; // @[exu_div_ctl.scala 75:86]
  wire  _T_391 = q_ff[3] & _T_227; // @[exu_div_ctl.scala 56:94]
  wire  _T_399 = _T_274 & m_ff[0]; // @[exu_div_ctl.scala 57:94]
  wire  _T_400 = _T_391 & _T_399; // @[exu_div_ctl.scala 58:10]
  wire  _T_401 = _T_387 | _T_400; // @[exu_div_ctl.scala 75:128]
  wire  _T_408 = _T_158 & m_ff[3]; // @[exu_div_ctl.scala 58:10]
  wire  _T_411 = _T_408 & _T_39; // @[exu_div_ctl.scala 76:75]
  wire  _T_412 = _T_401 | _T_411; // @[exu_div_ctl.scala 76:46]
  wire  _T_421 = m_ff[3] & _T_27; // @[exu_div_ctl.scala 57:94]
  wire  _T_422 = _T_158 & _T_421; // @[exu_div_ctl.scala 58:10]
  wire  _T_423 = _T_412 | _T_422; // @[exu_div_ctl.scala 76:86]
  wire  _T_428 = _T_54 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_433 = _T_428 & _T_421; // @[exu_div_ctl.scala 58:10]
  wire  _T_434 = _T_423 | _T_433; // @[exu_div_ctl.scala 76:128]
  wire  _T_440 = _T_97 & q_ff[1]; // @[exu_div_ctl.scala 56:94]
  wire  _T_445 = _T_440 & _T_186; // @[exu_div_ctl.scala 58:10]
  wire  _T_446 = _T_434 | _T_445; // @[exu_div_ctl.scala 77:46]
  wire  _T_451 = _T_146 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_454 = _T_451 & _T_25; // @[exu_div_ctl.scala 58:10]
  wire  _T_455 = _T_446 | _T_454; // @[exu_div_ctl.scala 77:86]
  wire  _T_462 = _T_158 & q_ff[0]; // @[exu_div_ctl.scala 56:94]
  wire  _T_464 = _T_462 & m_ff[3]; // @[exu_div_ctl.scala 58:10]
  wire  _T_465 = _T_455 | _T_464; // @[exu_div_ctl.scala 77:128]
  wire  _T_471 = _T_146 & _T_25; // @[exu_div_ctl.scala 58:10]
  wire  _T_474 = _T_471 & _T_39; // @[exu_div_ctl.scala 78:72]
  wire  _T_475 = _T_465 | _T_474; // @[exu_div_ctl.scala 78:46]
  wire [1:0] _T_476 = {_T_164,_T_475}; // @[Cat.scala 29:58]
  wire [1:0] _T_477 = {_T_30,_T_61}; // @[Cat.scala 29:58]
  reg  sign_ff; // @[Reg.scala 27:20]
  wire  _T_479 = sign_ff & q_ff[31]; // @[exu_div_ctl.scala 87:34]
  wire [32:0] short_dividend = {_T_479,q_ff[31:0]}; // @[Cat.scala 29:58]
  wire  _T_484 = ~short_dividend[32]; // @[exu_div_ctl.scala 92:7]
  wire  _T_487 = short_dividend[31:24] != 8'h0; // @[exu_div_ctl.scala 92:60]
  wire  _T_492 = short_dividend[31:23] != 9'h1ff; // @[exu_div_ctl.scala 93:59]
  wire  _T_493 = _T_484 & _T_487; // @[Mux.scala 27:72]
  wire  _T_494 = short_dividend[32] & _T_492; // @[Mux.scala 27:72]
  wire  _T_495 = _T_493 | _T_494; // @[Mux.scala 27:72]
  wire  _T_502 = short_dividend[23:16] != 8'h0; // @[exu_div_ctl.scala 96:60]
  wire  _T_507 = short_dividend[22:15] != 8'hff; // @[exu_div_ctl.scala 97:59]
  wire  _T_508 = _T_484 & _T_502; // @[Mux.scala 27:72]
  wire  _T_509 = short_dividend[32] & _T_507; // @[Mux.scala 27:72]
  wire  _T_510 = _T_508 | _T_509; // @[Mux.scala 27:72]
  wire  _T_517 = short_dividend[15:8] != 8'h0; // @[exu_div_ctl.scala 100:59]
  wire  _T_522 = short_dividend[14:7] != 8'hff; // @[exu_div_ctl.scala 101:58]
  wire  _T_523 = _T_484 & _T_517; // @[Mux.scala 27:72]
  wire  _T_524 = short_dividend[32] & _T_522; // @[Mux.scala 27:72]
  wire  _T_525 = _T_523 | _T_524; // @[Mux.scala 27:72]
  wire [2:0] a_cls = {_T_495,_T_510,_T_525}; // @[Cat.scala 29:58]
  wire  _T_530 = ~m_ff[32]; // @[exu_div_ctl.scala 106:7]
  wire  _T_533 = m_ff[31:24] != 8'h0; // @[exu_div_ctl.scala 106:40]
  wire  _T_538 = m_ff[31:24] != 8'hff; // @[exu_div_ctl.scala 107:39]
  wire  _T_539 = _T_530 & _T_533; // @[Mux.scala 27:72]
  wire  _T_540 = m_ff[32] & _T_538; // @[Mux.scala 27:72]
  wire  _T_541 = _T_539 | _T_540; // @[Mux.scala 27:72]
  wire  _T_548 = m_ff[23:16] != 8'h0; // @[exu_div_ctl.scala 110:40]
  wire  _T_553 = m_ff[23:16] != 8'hff; // @[exu_div_ctl.scala 111:39]
  wire  _T_554 = _T_530 & _T_548; // @[Mux.scala 27:72]
  wire  _T_555 = m_ff[32] & _T_553; // @[Mux.scala 27:72]
  wire  _T_556 = _T_554 | _T_555; // @[Mux.scala 27:72]
  wire  _T_563 = m_ff[15:8] != 8'h0; // @[exu_div_ctl.scala 114:39]
  wire  _T_568 = m_ff[15:8] != 8'hff; // @[exu_div_ctl.scala 115:38]
  wire  _T_569 = _T_530 & _T_563; // @[Mux.scala 27:72]
  wire  _T_570 = m_ff[32] & _T_568; // @[Mux.scala 27:72]
  wire  _T_571 = _T_569 | _T_570; // @[Mux.scala 27:72]
  wire [2:0] b_cls = {_T_541,_T_556,_T_571}; // @[Cat.scala 29:58]
  wire  _T_575 = a_cls[2:1] == 2'h1; // @[exu_div_ctl.scala 119:19]
  wire  _T_578 = _T_575 & b_cls[2]; // @[exu_div_ctl.scala 119:34]
  wire  _T_580 = a_cls == 3'h1; // @[exu_div_ctl.scala 120:21]
  wire  _T_583 = _T_580 & b_cls[2]; // @[exu_div_ctl.scala 120:36]
  wire  _T_584 = _T_578 | _T_583; // @[exu_div_ctl.scala 119:65]
  wire  _T_586 = a_cls == 3'h0; // @[exu_div_ctl.scala 121:21]
  wire  _T_589 = _T_586 & b_cls[2]; // @[exu_div_ctl.scala 121:36]
  wire  _T_590 = _T_584 | _T_589; // @[exu_div_ctl.scala 120:67]
  wire  _T_594 = b_cls[2:1] == 2'h1; // @[exu_div_ctl.scala 122:50]
  wire  _T_595 = _T_580 & _T_594; // @[exu_div_ctl.scala 122:36]
  wire  _T_596 = _T_590 | _T_595; // @[exu_div_ctl.scala 121:67]
  wire  _T_601 = _T_586 & _T_594; // @[exu_div_ctl.scala 123:36]
  wire  _T_602 = _T_596 | _T_601; // @[exu_div_ctl.scala 122:67]
  wire  _T_606 = b_cls == 3'h1; // @[exu_div_ctl.scala 124:50]
  wire  _T_607 = _T_586 & _T_606; // @[exu_div_ctl.scala 124:36]
  wire  _T_608 = _T_602 | _T_607; // @[exu_div_ctl.scala 123:67]
  wire  _T_613 = a_cls[2] & b_cls[2]; // @[exu_div_ctl.scala 126:34]
  wire  _T_618 = _T_575 & _T_594; // @[exu_div_ctl.scala 127:36]
  wire  _T_619 = _T_613 | _T_618; // @[exu_div_ctl.scala 126:65]
  wire  _T_624 = _T_580 & _T_606; // @[exu_div_ctl.scala 128:36]
  wire  _T_625 = _T_619 | _T_624; // @[exu_div_ctl.scala 127:67]
  wire  _T_629 = b_cls == 3'h0; // @[exu_div_ctl.scala 129:50]
  wire  _T_630 = _T_586 & _T_629; // @[exu_div_ctl.scala 129:36]
  wire  _T_631 = _T_625 | _T_630; // @[exu_div_ctl.scala 128:67]
  wire  _T_636 = a_cls[2] & _T_594; // @[exu_div_ctl.scala 131:34]
  wire  _T_641 = _T_575 & _T_606; // @[exu_div_ctl.scala 132:36]
  wire  _T_642 = _T_636 | _T_641; // @[exu_div_ctl.scala 131:65]
  wire  _T_647 = _T_580 & _T_629; // @[exu_div_ctl.scala 133:36]
  wire  _T_648 = _T_642 | _T_647; // @[exu_div_ctl.scala 132:67]
  wire  _T_653 = a_cls[2] & _T_606; // @[exu_div_ctl.scala 135:34]
  wire  _T_658 = _T_575 & _T_629; // @[exu_div_ctl.scala 136:36]
  wire  _T_659 = _T_653 | _T_658; // @[exu_div_ctl.scala 135:65]
  wire [3:0] shortq_raw = {_T_608,_T_631,_T_648,_T_659}; // @[Cat.scala 29:58]
  wire  _T_664 = valid_ff_x & _T_7; // @[exu_div_ctl.scala 139:35]
  wire  _T_665 = shortq_raw != 4'h0; // @[exu_div_ctl.scala 139:78]
  wire  shortq_enable = _T_664 & _T_665; // @[exu_div_ctl.scala 139:64]
  wire [3:0] _T_667 = shortq_enable ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] shortq_shift_xx; // @[exu_div_ctl.scala 206:31]
  wire [4:0] _T_676 = shortq_shift_xx[3] ? 5'h1f : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_677 = shortq_shift_xx[2] ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_678 = shortq_shift_xx[1] ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_679 = shortq_shift_xx[0] ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_680 = _T_676 | _T_677; // @[Mux.scala 27:72]
  wire [4:0] _T_681 = _T_680 | _T_678; // @[Mux.scala 27:72]
  wire [4:0] _GEN_4 = {{1'd0}, _T_679}; // @[Mux.scala 27:72]
  wire [4:0] shortq_shift_ff = _T_681 | _GEN_4; // @[Mux.scala 27:72]
  reg [5:0] count; // @[exu_div_ctl.scala 198:21]
  wire  _T_684 = count == 6'h20; // @[exu_div_ctl.scala 150:55]
  wire  _T_685 = count == 6'h21; // @[exu_div_ctl.scala 150:76]
  wire  _T_686 = _T_9 ? _T_684 : _T_685; // @[exu_div_ctl.scala 150:39]
  wire  finish = smallnum_case | _T_686; // @[exu_div_ctl.scala 150:34]
  reg  run_state; // @[exu_div_ctl.scala 197:25]
  wire  _T_687 = io_dec_div_div_p_valid | run_state; // @[exu_div_ctl.scala 151:43]
  wire  _T_688 = _T_687 | finish; // @[exu_div_ctl.scala 151:55]
  reg  finish_ff; // @[exu_div_ctl.scala 196:25]
  wire  _T_690 = ~finish; // @[exu_div_ctl.scala 152:59]
  wire  _T_691 = _T_687 & _T_690; // @[exu_div_ctl.scala 152:57]
  wire  _T_694 = run_state & _T_690; // @[exu_div_ctl.scala 153:35]
  wire  _T_696 = _T_694 & _T; // @[exu_div_ctl.scala 153:45]
  wire  _T_697 = ~shortq_enable; // @[exu_div_ctl.scala 153:76]
  wire  _T_698 = _T_696 & _T_697; // @[exu_div_ctl.scala 153:74]
  wire [5:0] _T_700 = _T_698 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _T_701 = {1'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [5:0] _T_703 = count + _T_701; // @[exu_div_ctl.scala 153:102]
  wire [5:0] _T_705 = _T_703 + 6'h1; // @[exu_div_ctl.scala 153:129]
  wire  _T_709 = ~io_dec_div_div_p_bits_unsign; // @[exu_div_ctl.scala 157:20]
  wire  _T_710 = io_divisor != 32'h0; // @[exu_div_ctl.scala 157:64]
  wire  sign_eff = _T_709 & _T_710; // @[exu_div_ctl.scala 157:50]
  wire  _T_711 = ~run_state; // @[exu_div_ctl.scala 161:6]
  wire [32:0] _T_713 = {1'h0,io_dividend}; // @[Cat.scala 29:58]
  reg  shortq_enable_ff; // @[exu_div_ctl.scala 205:32]
  wire  _T_714 = valid_ff_x | shortq_enable_ff; // @[exu_div_ctl.scala 162:30]
  wire  _T_715 = run_state & _T_714; // @[exu_div_ctl.scala 162:16]
  reg  dividend_neg_ff; // @[Reg.scala 27:20]
  wire  _T_738 = sign_ff & dividend_neg_ff; // @[exu_div_ctl.scala 166:32]
  wire  _T_923 = |q_ff[30:0]; // @[el2_lib.scala 543:35]
  wire  _T_925 = ~q_ff[31]; // @[el2_lib.scala 543:40]
  wire  _T_927 = _T_923 ? _T_925 : q_ff[31]; // @[el2_lib.scala 543:23]
  wire  _T_917 = |q_ff[29:0]; // @[el2_lib.scala 543:35]
  wire  _T_919 = ~q_ff[30]; // @[el2_lib.scala 543:40]
  wire  _T_921 = _T_917 ? _T_919 : q_ff[30]; // @[el2_lib.scala 543:23]
  wire  _T_911 = |q_ff[28:0]; // @[el2_lib.scala 543:35]
  wire  _T_913 = ~q_ff[29]; // @[el2_lib.scala 543:40]
  wire  _T_915 = _T_911 ? _T_913 : q_ff[29]; // @[el2_lib.scala 543:23]
  wire  _T_905 = |q_ff[27:0]; // @[el2_lib.scala 543:35]
  wire  _T_907 = ~q_ff[28]; // @[el2_lib.scala 543:40]
  wire  _T_909 = _T_905 ? _T_907 : q_ff[28]; // @[el2_lib.scala 543:23]
  wire  _T_899 = |q_ff[26:0]; // @[el2_lib.scala 543:35]
  wire  _T_901 = ~q_ff[27]; // @[el2_lib.scala 543:40]
  wire  _T_903 = _T_899 ? _T_901 : q_ff[27]; // @[el2_lib.scala 543:23]
  wire  _T_893 = |q_ff[25:0]; // @[el2_lib.scala 543:35]
  wire  _T_895 = ~q_ff[26]; // @[el2_lib.scala 543:40]
  wire  _T_897 = _T_893 ? _T_895 : q_ff[26]; // @[el2_lib.scala 543:23]
  wire  _T_887 = |q_ff[24:0]; // @[el2_lib.scala 543:35]
  wire  _T_889 = ~q_ff[25]; // @[el2_lib.scala 543:40]
  wire  _T_891 = _T_887 ? _T_889 : q_ff[25]; // @[el2_lib.scala 543:23]
  wire  _T_881 = |q_ff[23:0]; // @[el2_lib.scala 543:35]
  wire  _T_883 = ~q_ff[24]; // @[el2_lib.scala 543:40]
  wire  _T_885 = _T_881 ? _T_883 : q_ff[24]; // @[el2_lib.scala 543:23]
  wire  _T_875 = |q_ff[22:0]; // @[el2_lib.scala 543:35]
  wire  _T_877 = ~q_ff[23]; // @[el2_lib.scala 543:40]
  wire  _T_879 = _T_875 ? _T_877 : q_ff[23]; // @[el2_lib.scala 543:23]
  wire  _T_869 = |q_ff[21:0]; // @[el2_lib.scala 543:35]
  wire  _T_871 = ~q_ff[22]; // @[el2_lib.scala 543:40]
  wire  _T_873 = _T_869 ? _T_871 : q_ff[22]; // @[el2_lib.scala 543:23]
  wire  _T_863 = |q_ff[20:0]; // @[el2_lib.scala 543:35]
  wire  _T_865 = ~q_ff[21]; // @[el2_lib.scala 543:40]
  wire  _T_867 = _T_863 ? _T_865 : q_ff[21]; // @[el2_lib.scala 543:23]
  wire  _T_857 = |q_ff[19:0]; // @[el2_lib.scala 543:35]
  wire  _T_859 = ~q_ff[20]; // @[el2_lib.scala 543:40]
  wire  _T_861 = _T_857 ? _T_859 : q_ff[20]; // @[el2_lib.scala 543:23]
  wire  _T_851 = |q_ff[18:0]; // @[el2_lib.scala 543:35]
  wire  _T_853 = ~q_ff[19]; // @[el2_lib.scala 543:40]
  wire  _T_855 = _T_851 ? _T_853 : q_ff[19]; // @[el2_lib.scala 543:23]
  wire  _T_845 = |q_ff[17:0]; // @[el2_lib.scala 543:35]
  wire  _T_847 = ~q_ff[18]; // @[el2_lib.scala 543:40]
  wire  _T_849 = _T_845 ? _T_847 : q_ff[18]; // @[el2_lib.scala 543:23]
  wire  _T_839 = |q_ff[16:0]; // @[el2_lib.scala 543:35]
  wire  _T_841 = ~q_ff[17]; // @[el2_lib.scala 543:40]
  wire  _T_843 = _T_839 ? _T_841 : q_ff[17]; // @[el2_lib.scala 543:23]
  wire  _T_833 = |q_ff[15:0]; // @[el2_lib.scala 543:35]
  wire  _T_835 = ~q_ff[16]; // @[el2_lib.scala 543:40]
  wire  _T_837 = _T_833 ? _T_835 : q_ff[16]; // @[el2_lib.scala 543:23]
  wire [7:0] _T_948 = {_T_879,_T_873,_T_867,_T_861,_T_855,_T_849,_T_843,_T_837}; // @[el2_lib.scala 545:14]
  wire  _T_827 = |q_ff[14:0]; // @[el2_lib.scala 543:35]
  wire  _T_829 = ~q_ff[15]; // @[el2_lib.scala 543:40]
  wire  _T_831 = _T_827 ? _T_829 : q_ff[15]; // @[el2_lib.scala 543:23]
  wire  _T_821 = |q_ff[13:0]; // @[el2_lib.scala 543:35]
  wire  _T_823 = ~q_ff[14]; // @[el2_lib.scala 543:40]
  wire  _T_825 = _T_821 ? _T_823 : q_ff[14]; // @[el2_lib.scala 543:23]
  wire  _T_815 = |q_ff[12:0]; // @[el2_lib.scala 543:35]
  wire  _T_817 = ~q_ff[13]; // @[el2_lib.scala 543:40]
  wire  _T_819 = _T_815 ? _T_817 : q_ff[13]; // @[el2_lib.scala 543:23]
  wire  _T_809 = |q_ff[11:0]; // @[el2_lib.scala 543:35]
  wire  _T_811 = ~q_ff[12]; // @[el2_lib.scala 543:40]
  wire  _T_813 = _T_809 ? _T_811 : q_ff[12]; // @[el2_lib.scala 543:23]
  wire  _T_803 = |q_ff[10:0]; // @[el2_lib.scala 543:35]
  wire  _T_805 = ~q_ff[11]; // @[el2_lib.scala 543:40]
  wire  _T_807 = _T_803 ? _T_805 : q_ff[11]; // @[el2_lib.scala 543:23]
  wire  _T_797 = |q_ff[9:0]; // @[el2_lib.scala 543:35]
  wire  _T_799 = ~q_ff[10]; // @[el2_lib.scala 543:40]
  wire  _T_801 = _T_797 ? _T_799 : q_ff[10]; // @[el2_lib.scala 543:23]
  wire  _T_791 = |q_ff[8:0]; // @[el2_lib.scala 543:35]
  wire  _T_793 = ~q_ff[9]; // @[el2_lib.scala 543:40]
  wire  _T_795 = _T_791 ? _T_793 : q_ff[9]; // @[el2_lib.scala 543:23]
  wire  _T_785 = |q_ff[7:0]; // @[el2_lib.scala 543:35]
  wire  _T_787 = ~q_ff[8]; // @[el2_lib.scala 543:40]
  wire  _T_789 = _T_785 ? _T_787 : q_ff[8]; // @[el2_lib.scala 543:23]
  wire  _T_779 = |q_ff[6:0]; // @[el2_lib.scala 543:35]
  wire  _T_781 = ~q_ff[7]; // @[el2_lib.scala 543:40]
  wire  _T_783 = _T_779 ? _T_781 : q_ff[7]; // @[el2_lib.scala 543:23]
  wire  _T_773 = |q_ff[5:0]; // @[el2_lib.scala 543:35]
  wire  _T_775 = ~q_ff[6]; // @[el2_lib.scala 543:40]
  wire  _T_777 = _T_773 ? _T_775 : q_ff[6]; // @[el2_lib.scala 543:23]
  wire  _T_767 = |q_ff[4:0]; // @[el2_lib.scala 543:35]
  wire  _T_769 = ~q_ff[5]; // @[el2_lib.scala 543:40]
  wire  _T_771 = _T_767 ? _T_769 : q_ff[5]; // @[el2_lib.scala 543:23]
  wire  _T_761 = |q_ff[3:0]; // @[el2_lib.scala 543:35]
  wire  _T_763 = ~q_ff[4]; // @[el2_lib.scala 543:40]
  wire  _T_765 = _T_761 ? _T_763 : q_ff[4]; // @[el2_lib.scala 543:23]
  wire  _T_755 = |q_ff[2:0]; // @[el2_lib.scala 543:35]
  wire  _T_757 = ~q_ff[3]; // @[el2_lib.scala 543:40]
  wire  _T_759 = _T_755 ? _T_757 : q_ff[3]; // @[el2_lib.scala 543:23]
  wire  _T_749 = |q_ff[1:0]; // @[el2_lib.scala 543:35]
  wire  _T_751 = ~q_ff[2]; // @[el2_lib.scala 543:40]
  wire  _T_753 = _T_749 ? _T_751 : q_ff[2]; // @[el2_lib.scala 543:23]
  wire  _T_743 = |q_ff[0]; // @[el2_lib.scala 543:35]
  wire  _T_745 = ~q_ff[1]; // @[el2_lib.scala 543:40]
  wire  _T_747 = _T_743 ? _T_745 : q_ff[1]; // @[el2_lib.scala 543:23]
  wire [6:0] _T_933 = {_T_783,_T_777,_T_771,_T_765,_T_759,_T_753,_T_747}; // @[el2_lib.scala 545:14]
  wire [14:0] _T_941 = {_T_831,_T_825,_T_819,_T_813,_T_807,_T_801,_T_795,_T_789,_T_933}; // @[el2_lib.scala 545:14]
  wire [30:0] _T_957 = {_T_927,_T_921,_T_915,_T_909,_T_903,_T_897,_T_891,_T_885,_T_948,_T_941}; // @[el2_lib.scala 545:14]
  wire [31:0] _T_959 = {_T_957,q_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] dividend_eff = _T_738 ? _T_959 : q_ff[31:0]; // @[exu_div_ctl.scala 166:22]
  wire [32:0] _T_995 = run_state ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _T_1007 = _T_685 & rem_ff; // @[exu_div_ctl.scala 182:41]
  reg [32:0] a_ff; // @[el2_lib.scala 514:16]
  wire  rem_correct = _T_1007 & a_ff[32]; // @[exu_div_ctl.scala 182:50]
  wire [32:0] _T_980 = rem_correct ? a_ff : 33'h0; // @[Mux.scala 27:72]
  wire  _T_968 = ~rem_correct; // @[exu_div_ctl.scala 173:6]
  wire  _T_969 = ~shortq_enable_ff; // @[exu_div_ctl.scala 173:21]
  wire  _T_970 = _T_968 & _T_969; // @[exu_div_ctl.scala 173:19]
  wire [32:0] _T_974 = {a_ff[31:0],q_ff[32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_981 = _T_970 ? _T_974 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_983 = _T_980 | _T_981; // @[Mux.scala 27:72]
  wire  _T_976 = _T_968 & shortq_enable_ff; // @[exu_div_ctl.scala 174:19]
  wire [55:0] _T_965 = {24'h0,dividend_eff}; // @[Cat.scala 29:58]
  wire [86:0] _GEN_5 = {{31'd0}, _T_965}; // @[exu_div_ctl.scala 170:47]
  wire [86:0] _T_966 = _GEN_5 << shortq_shift_ff; // @[exu_div_ctl.scala 170:47]
  wire [55:0] a_eff_shift = _T_966[55:0]; // @[exu_div_ctl.scala 170:15]
  wire [32:0] _T_979 = {9'h0,a_eff_shift[55:32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_982 = _T_976 ? _T_979 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] a_eff = _T_983 | _T_982; // @[Mux.scala 27:72]
  wire [32:0] a_shift = _T_995 & a_eff; // @[exu_div_ctl.scala 177:33]
  wire  _T_1004 = a_ff[32] | rem_correct; // @[exu_div_ctl.scala 181:21]
  reg  divisor_neg_ff; // @[Reg.scala 27:20]
  wire  m_already_comp = divisor_neg_ff & sign_ff; // @[exu_div_ctl.scala 179:48]
  wire  add = _T_1004 ^ m_already_comp; // @[exu_div_ctl.scala 181:36]
  wire [32:0] _T_963 = ~m_ff; // @[exu_div_ctl.scala 169:35]
  wire [32:0] m_eff = add ? m_ff : _T_963; // @[exu_div_ctl.scala 169:15]
  wire [32:0] _T_997 = a_shift + m_eff; // @[exu_div_ctl.scala 178:41]
  wire  _T_998 = ~add; // @[exu_div_ctl.scala 178:65]
  wire [32:0] _T_999 = {32'h0,_T_998}; // @[Cat.scala 29:58]
  wire [32:0] _T_1001 = _T_997 + _T_999; // @[exu_div_ctl.scala 178:49]
  wire [32:0] a_in = _T_995 & _T_1001; // @[exu_div_ctl.scala 178:30]
  wire  _T_719 = ~a_in[32]; // @[exu_div_ctl.scala 162:85]
  wire [32:0] _T_720 = {dividend_eff,_T_719}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_6 = {{31'd0}, _T_720}; // @[exu_div_ctl.scala 162:96]
  wire [63:0] _T_721 = _GEN_6 << shortq_shift_ff; // @[exu_div_ctl.scala 162:96]
  wire  _T_723 = ~_T_714; // @[exu_div_ctl.scala 163:18]
  wire  _T_724 = run_state & _T_723; // @[exu_div_ctl.scala 163:16]
  wire [32:0] _T_729 = {q_ff[31:0],_T_719}; // @[Cat.scala 29:58]
  wire [32:0] _T_730 = _T_711 ? _T_713 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_731 = _T_715 ? _T_721 : 64'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_732 = _T_724 ? _T_729 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _GEN_7 = {{31'd0}, _T_730}; // @[Mux.scala 27:72]
  wire [63:0] _T_733 = _GEN_7 | _T_731; // @[Mux.scala 27:72]
  wire [63:0] _GEN_8 = {{31'd0}, _T_732}; // @[Mux.scala 27:72]
  wire [63:0] _T_734 = _T_733 | _GEN_8; // @[Mux.scala 27:72]
  wire  _T_737 = run_state & _T_697; // @[exu_div_ctl.scala 165:59]
  wire  _T_988 = count != 6'h21; // @[exu_div_ctl.scala 176:84]
  wire  _T_989 = _T_737 & _T_988; // @[exu_div_ctl.scala 176:75]
  wire  _T_990 = io_dec_div_div_p_valid | _T_989; // @[exu_div_ctl.scala 176:45]
  wire  _T_1010 = dividend_neg_ff ^ divisor_neg_ff; // @[exu_div_ctl.scala 183:50]
  wire  _T_1011 = sign_ff & _T_1010; // @[exu_div_ctl.scala 183:31]
  wire [31:0] q_ff_eff = _T_1011 ? _T_959 : q_ff[31:0]; // @[exu_div_ctl.scala 183:21]
  wire  _T_1239 = |a_ff[0]; // @[el2_lib.scala 543:35]
  wire  _T_1241 = ~a_ff[1]; // @[el2_lib.scala 543:40]
  wire  _T_1243 = _T_1239 ? _T_1241 : a_ff[1]; // @[el2_lib.scala 543:23]
  wire  _T_1245 = |a_ff[1:0]; // @[el2_lib.scala 543:35]
  wire  _T_1247 = ~a_ff[2]; // @[el2_lib.scala 543:40]
  wire  _T_1249 = _T_1245 ? _T_1247 : a_ff[2]; // @[el2_lib.scala 543:23]
  wire  _T_1251 = |a_ff[2:0]; // @[el2_lib.scala 543:35]
  wire  _T_1253 = ~a_ff[3]; // @[el2_lib.scala 543:40]
  wire  _T_1255 = _T_1251 ? _T_1253 : a_ff[3]; // @[el2_lib.scala 543:23]
  wire  _T_1257 = |a_ff[3:0]; // @[el2_lib.scala 543:35]
  wire  _T_1259 = ~a_ff[4]; // @[el2_lib.scala 543:40]
  wire  _T_1261 = _T_1257 ? _T_1259 : a_ff[4]; // @[el2_lib.scala 543:23]
  wire  _T_1263 = |a_ff[4:0]; // @[el2_lib.scala 543:35]
  wire  _T_1265 = ~a_ff[5]; // @[el2_lib.scala 543:40]
  wire  _T_1267 = _T_1263 ? _T_1265 : a_ff[5]; // @[el2_lib.scala 543:23]
  wire  _T_1269 = |a_ff[5:0]; // @[el2_lib.scala 543:35]
  wire  _T_1271 = ~a_ff[6]; // @[el2_lib.scala 543:40]
  wire  _T_1273 = _T_1269 ? _T_1271 : a_ff[6]; // @[el2_lib.scala 543:23]
  wire  _T_1275 = |a_ff[6:0]; // @[el2_lib.scala 543:35]
  wire  _T_1277 = ~a_ff[7]; // @[el2_lib.scala 543:40]
  wire  _T_1279 = _T_1275 ? _T_1277 : a_ff[7]; // @[el2_lib.scala 543:23]
  wire  _T_1281 = |a_ff[7:0]; // @[el2_lib.scala 543:35]
  wire  _T_1283 = ~a_ff[8]; // @[el2_lib.scala 543:40]
  wire  _T_1285 = _T_1281 ? _T_1283 : a_ff[8]; // @[el2_lib.scala 543:23]
  wire  _T_1287 = |a_ff[8:0]; // @[el2_lib.scala 543:35]
  wire  _T_1289 = ~a_ff[9]; // @[el2_lib.scala 543:40]
  wire  _T_1291 = _T_1287 ? _T_1289 : a_ff[9]; // @[el2_lib.scala 543:23]
  wire  _T_1293 = |a_ff[9:0]; // @[el2_lib.scala 543:35]
  wire  _T_1295 = ~a_ff[10]; // @[el2_lib.scala 543:40]
  wire  _T_1297 = _T_1293 ? _T_1295 : a_ff[10]; // @[el2_lib.scala 543:23]
  wire  _T_1299 = |a_ff[10:0]; // @[el2_lib.scala 543:35]
  wire  _T_1301 = ~a_ff[11]; // @[el2_lib.scala 543:40]
  wire  _T_1303 = _T_1299 ? _T_1301 : a_ff[11]; // @[el2_lib.scala 543:23]
  wire  _T_1305 = |a_ff[11:0]; // @[el2_lib.scala 543:35]
  wire  _T_1307 = ~a_ff[12]; // @[el2_lib.scala 543:40]
  wire  _T_1309 = _T_1305 ? _T_1307 : a_ff[12]; // @[el2_lib.scala 543:23]
  wire  _T_1311 = |a_ff[12:0]; // @[el2_lib.scala 543:35]
  wire  _T_1313 = ~a_ff[13]; // @[el2_lib.scala 543:40]
  wire  _T_1315 = _T_1311 ? _T_1313 : a_ff[13]; // @[el2_lib.scala 543:23]
  wire  _T_1317 = |a_ff[13:0]; // @[el2_lib.scala 543:35]
  wire  _T_1319 = ~a_ff[14]; // @[el2_lib.scala 543:40]
  wire  _T_1321 = _T_1317 ? _T_1319 : a_ff[14]; // @[el2_lib.scala 543:23]
  wire  _T_1323 = |a_ff[14:0]; // @[el2_lib.scala 543:35]
  wire  _T_1325 = ~a_ff[15]; // @[el2_lib.scala 543:40]
  wire  _T_1327 = _T_1323 ? _T_1325 : a_ff[15]; // @[el2_lib.scala 543:23]
  wire  _T_1329 = |a_ff[15:0]; // @[el2_lib.scala 543:35]
  wire  _T_1331 = ~a_ff[16]; // @[el2_lib.scala 543:40]
  wire  _T_1333 = _T_1329 ? _T_1331 : a_ff[16]; // @[el2_lib.scala 543:23]
  wire  _T_1335 = |a_ff[16:0]; // @[el2_lib.scala 543:35]
  wire  _T_1337 = ~a_ff[17]; // @[el2_lib.scala 543:40]
  wire  _T_1339 = _T_1335 ? _T_1337 : a_ff[17]; // @[el2_lib.scala 543:23]
  wire  _T_1341 = |a_ff[17:0]; // @[el2_lib.scala 543:35]
  wire  _T_1343 = ~a_ff[18]; // @[el2_lib.scala 543:40]
  wire  _T_1345 = _T_1341 ? _T_1343 : a_ff[18]; // @[el2_lib.scala 543:23]
  wire  _T_1347 = |a_ff[18:0]; // @[el2_lib.scala 543:35]
  wire  _T_1349 = ~a_ff[19]; // @[el2_lib.scala 543:40]
  wire  _T_1351 = _T_1347 ? _T_1349 : a_ff[19]; // @[el2_lib.scala 543:23]
  wire  _T_1353 = |a_ff[19:0]; // @[el2_lib.scala 543:35]
  wire  _T_1355 = ~a_ff[20]; // @[el2_lib.scala 543:40]
  wire  _T_1357 = _T_1353 ? _T_1355 : a_ff[20]; // @[el2_lib.scala 543:23]
  wire  _T_1359 = |a_ff[20:0]; // @[el2_lib.scala 543:35]
  wire  _T_1361 = ~a_ff[21]; // @[el2_lib.scala 543:40]
  wire  _T_1363 = _T_1359 ? _T_1361 : a_ff[21]; // @[el2_lib.scala 543:23]
  wire  _T_1365 = |a_ff[21:0]; // @[el2_lib.scala 543:35]
  wire  _T_1367 = ~a_ff[22]; // @[el2_lib.scala 543:40]
  wire  _T_1369 = _T_1365 ? _T_1367 : a_ff[22]; // @[el2_lib.scala 543:23]
  wire  _T_1371 = |a_ff[22:0]; // @[el2_lib.scala 543:35]
  wire  _T_1373 = ~a_ff[23]; // @[el2_lib.scala 543:40]
  wire  _T_1375 = _T_1371 ? _T_1373 : a_ff[23]; // @[el2_lib.scala 543:23]
  wire  _T_1377 = |a_ff[23:0]; // @[el2_lib.scala 543:35]
  wire  _T_1379 = ~a_ff[24]; // @[el2_lib.scala 543:40]
  wire  _T_1381 = _T_1377 ? _T_1379 : a_ff[24]; // @[el2_lib.scala 543:23]
  wire  _T_1383 = |a_ff[24:0]; // @[el2_lib.scala 543:35]
  wire  _T_1385 = ~a_ff[25]; // @[el2_lib.scala 543:40]
  wire  _T_1387 = _T_1383 ? _T_1385 : a_ff[25]; // @[el2_lib.scala 543:23]
  wire  _T_1389 = |a_ff[25:0]; // @[el2_lib.scala 543:35]
  wire  _T_1391 = ~a_ff[26]; // @[el2_lib.scala 543:40]
  wire  _T_1393 = _T_1389 ? _T_1391 : a_ff[26]; // @[el2_lib.scala 543:23]
  wire  _T_1395 = |a_ff[26:0]; // @[el2_lib.scala 543:35]
  wire  _T_1397 = ~a_ff[27]; // @[el2_lib.scala 543:40]
  wire  _T_1399 = _T_1395 ? _T_1397 : a_ff[27]; // @[el2_lib.scala 543:23]
  wire  _T_1401 = |a_ff[27:0]; // @[el2_lib.scala 543:35]
  wire  _T_1403 = ~a_ff[28]; // @[el2_lib.scala 543:40]
  wire  _T_1405 = _T_1401 ? _T_1403 : a_ff[28]; // @[el2_lib.scala 543:23]
  wire  _T_1407 = |a_ff[28:0]; // @[el2_lib.scala 543:35]
  wire  _T_1409 = ~a_ff[29]; // @[el2_lib.scala 543:40]
  wire  _T_1411 = _T_1407 ? _T_1409 : a_ff[29]; // @[el2_lib.scala 543:23]
  wire  _T_1413 = |a_ff[29:0]; // @[el2_lib.scala 543:35]
  wire  _T_1415 = ~a_ff[30]; // @[el2_lib.scala 543:40]
  wire  _T_1417 = _T_1413 ? _T_1415 : a_ff[30]; // @[el2_lib.scala 543:23]
  wire  _T_1419 = |a_ff[30:0]; // @[el2_lib.scala 543:35]
  wire  _T_1421 = ~a_ff[31]; // @[el2_lib.scala 543:40]
  wire  _T_1423 = _T_1419 ? _T_1421 : a_ff[31]; // @[el2_lib.scala 543:23]
  wire [6:0] _T_1429 = {_T_1279,_T_1273,_T_1267,_T_1261,_T_1255,_T_1249,_T_1243}; // @[el2_lib.scala 545:14]
  wire [14:0] _T_1437 = {_T_1327,_T_1321,_T_1315,_T_1309,_T_1303,_T_1297,_T_1291,_T_1285,_T_1429}; // @[el2_lib.scala 545:14]
  wire [7:0] _T_1444 = {_T_1375,_T_1369,_T_1363,_T_1357,_T_1351,_T_1345,_T_1339,_T_1333}; // @[el2_lib.scala 545:14]
  wire [30:0] _T_1453 = {_T_1423,_T_1417,_T_1411,_T_1405,_T_1399,_T_1393,_T_1387,_T_1381,_T_1444,_T_1437}; // @[el2_lib.scala 545:14]
  wire [31:0] _T_1455 = {_T_1453,a_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] a_ff_eff = _T_738 ? _T_1455 : a_ff[31:0]; // @[exu_div_ctl.scala 184:21]
  reg  smallnum_case_ff; // @[exu_div_ctl.scala 203:32]
  reg [3:0] smallnum_ff; // @[exu_div_ctl.scala 204:27]
  wire [31:0] _T_1458 = {28'h0,smallnum_ff}; // @[Cat.scala 29:58]
  wire  _T_1460 = ~smallnum_case_ff; // @[exu_div_ctl.scala 189:6]
  wire  _T_1462 = _T_1460 & _T_9; // @[exu_div_ctl.scala 189:24]
  wire [31:0] _T_1464 = smallnum_case_ff ? _T_1458 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1465 = rem_ff ? a_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1466 = _T_1462 ? q_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1467 = _T_1464 | _T_1465; // @[Mux.scala 27:72]
  wire  _T_1499 = _T_709 & io_divisor[31]; // @[exu_div_ctl.scala 210:52]
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
  assign io_exu_div_result = _T_1467 | _T_1466; // @[exu_div_ctl.scala 186:21]
  assign io_exu_div_wren = finish_ff & _T; // @[exu_div_ctl.scala 156:20]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_688 | finish_ff; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = io_dec_div_div_p_valid | _T_737; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = _T_990 | rem_correct; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = io_dec_div_div_p_valid; // @[el2_lib.scala 511:17]
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
      valid_ff_x <= io_dec_div_div_p_valid & _T;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      q_ff <= 33'h0;
    end else begin
      q_ff <= _T_734[32:0];
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      m_ff <= 33'h0;
    end else begin
      m_ff <= {_T_1499,io_divisor};
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      rem_ff <= 1'h0;
    end else if (io_dec_div_div_p_valid) begin
      rem_ff <= io_dec_div_div_p_bits_rem;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      sign_ff <= 1'h0;
    end else if (io_dec_div_div_p_valid) begin
      sign_ff <= sign_eff;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      shortq_shift_xx <= 4'h0;
    end else begin
      shortq_shift_xx <= _T_667 & shortq_raw;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      count <= 6'h0;
    end else begin
      count <= _T_700 & _T_705;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      run_state <= 1'h0;
    end else begin
      run_state <= _T_691 & _T;
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
      shortq_enable_ff <= _T_664 & _T_665;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      dividend_neg_ff <= 1'h0;
    end else if (io_dec_div_div_p_valid) begin
      dividend_neg_ff <= io_dividend[31];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      a_ff <= 33'h0;
    end else begin
      a_ff <= _T_995 & _T_1001;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      divisor_neg_ff <= 1'h0;
    end else if (io_dec_div_div_p_valid) begin
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
      smallnum_ff <= {_T_477,_T_476};
    end
  end
endmodule
module exu(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dec_exu_dec_alu_dec_i0_alu_decode_d,
  input         io_dec_exu_dec_alu_dec_csr_ren_d,
  input  [11:0] io_dec_exu_dec_alu_dec_i0_br_immed_d,
  output [30:0] io_dec_exu_dec_alu_exu_i0_pc_x,
  input         io_dec_exu_dec_div_div_p_valid,
  input         io_dec_exu_dec_div_div_p_bits_unsign,
  input         io_dec_exu_dec_div_div_p_bits_rem,
  input         io_dec_exu_dec_div_dec_div_cancel,
  input  [1:0]  io_dec_exu_decode_exu_dec_data_en,
  input  [1:0]  io_dec_exu_decode_exu_dec_ctl_en,
  input         io_dec_exu_decode_exu_i0_ap_land,
  input         io_dec_exu_decode_exu_i0_ap_lor,
  input         io_dec_exu_decode_exu_i0_ap_lxor,
  input         io_dec_exu_decode_exu_i0_ap_sll,
  input         io_dec_exu_decode_exu_i0_ap_srl,
  input         io_dec_exu_decode_exu_i0_ap_sra,
  input         io_dec_exu_decode_exu_i0_ap_beq,
  input         io_dec_exu_decode_exu_i0_ap_bne,
  input         io_dec_exu_decode_exu_i0_ap_blt,
  input         io_dec_exu_decode_exu_i0_ap_bge,
  input         io_dec_exu_decode_exu_i0_ap_add,
  input         io_dec_exu_decode_exu_i0_ap_sub,
  input         io_dec_exu_decode_exu_i0_ap_slt,
  input         io_dec_exu_decode_exu_i0_ap_unsign,
  input         io_dec_exu_decode_exu_i0_ap_jal,
  input         io_dec_exu_decode_exu_i0_ap_predict_t,
  input         io_dec_exu_decode_exu_i0_ap_predict_nt,
  input         io_dec_exu_decode_exu_i0_ap_csr_write,
  input         io_dec_exu_decode_exu_i0_ap_csr_imm,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_valid,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_misp,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_ataken,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_boffset,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pc4,
  input  [1:0]  io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_hist,
  input  [11:0] io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_toffset,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_error,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_start_error,
  input  [30:0] io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_prett,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pcall,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pret,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pja,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_way,
  input  [7:0]  io_dec_exu_decode_exu_i0_predict_fghr_d,
  input  [7:0]  io_dec_exu_decode_exu_i0_predict_index_d,
  input  [4:0]  io_dec_exu_decode_exu_i0_predict_btag_d,
  input         io_dec_exu_decode_exu_dec_i0_rs1_en_d,
  input         io_dec_exu_decode_exu_dec_i0_rs2_en_d,
  input  [31:0] io_dec_exu_decode_exu_dec_i0_immed_d,
  input  [31:0] io_dec_exu_decode_exu_dec_i0_rs1_bypass_data_d,
  input  [31:0] io_dec_exu_decode_exu_dec_i0_rs2_bypass_data_d,
  input         io_dec_exu_decode_exu_dec_i0_select_pc_d,
  input  [1:0]  io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d,
  input  [1:0]  io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d,
  input         io_dec_exu_decode_exu_mul_p_valid,
  input         io_dec_exu_decode_exu_mul_p_bits_rs1_sign,
  input         io_dec_exu_decode_exu_mul_p_bits_rs2_sign,
  input         io_dec_exu_decode_exu_mul_p_bits_low,
  input         io_dec_exu_decode_exu_mul_p_bits_bext,
  input         io_dec_exu_decode_exu_mul_p_bits_bdep,
  input         io_dec_exu_decode_exu_mul_p_bits_clmul,
  input         io_dec_exu_decode_exu_mul_p_bits_clmulh,
  input         io_dec_exu_decode_exu_mul_p_bits_clmulr,
  input         io_dec_exu_decode_exu_mul_p_bits_grev,
  input         io_dec_exu_decode_exu_mul_p_bits_shfl,
  input         io_dec_exu_decode_exu_mul_p_bits_unshfl,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32_b,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32_h,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32_w,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32c_b,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32c_h,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32c_w,
  input         io_dec_exu_decode_exu_mul_p_bits_bfp,
  input  [30:0] io_dec_exu_decode_exu_pred_correct_npc_x,
  input         io_dec_exu_decode_exu_dec_extint_stall,
  output [31:0] io_dec_exu_decode_exu_exu_i0_result_x,
  output [31:0] io_dec_exu_decode_exu_exu_csr_rs1_x,
  input  [29:0] io_dec_exu_tlu_exu_dec_tlu_meihap,
  input         io_dec_exu_tlu_exu_dec_tlu_flush_lower_r,
  input  [30:0] io_dec_exu_tlu_exu_dec_tlu_flush_path_r,
  output [1:0]  io_dec_exu_tlu_exu_exu_i0_br_hist_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_error_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_start_error_r,
  output [7:0]  io_dec_exu_tlu_exu_exu_i0_br_index_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_valid_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_mp_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_middle_r,
  output        io_dec_exu_tlu_exu_exu_pmu_i0_br_misp,
  output        io_dec_exu_tlu_exu_exu_pmu_i0_br_ataken,
  output        io_dec_exu_tlu_exu_exu_pmu_i0_pc4,
  output [30:0] io_dec_exu_tlu_exu_exu_npc_r,
  input  [30:0] io_dec_exu_ib_exu_dec_i0_pc_d,
  input         io_dec_exu_ib_exu_dec_debug_wdata_rs1_d,
  input  [31:0] io_dec_exu_gpr_exu_gpr_i0_rs1_d,
  input  [31:0] io_dec_exu_gpr_exu_gpr_i0_rs2_d,
  output [7:0]  io_exu_bp_exu_i0_br_index_r,
  output [7:0]  io_exu_bp_exu_i0_br_fghr_r,
  output        io_exu_bp_exu_i0_br_way_r,
  output        io_exu_bp_exu_mp_pkt_valid,
  output        io_exu_bp_exu_mp_pkt_bits_misp,
  output        io_exu_bp_exu_mp_pkt_bits_ataken,
  output        io_exu_bp_exu_mp_pkt_bits_boffset,
  output        io_exu_bp_exu_mp_pkt_bits_pc4,
  output [1:0]  io_exu_bp_exu_mp_pkt_bits_hist,
  output [11:0] io_exu_bp_exu_mp_pkt_bits_toffset,
  output        io_exu_bp_exu_mp_pkt_bits_br_error,
  output        io_exu_bp_exu_mp_pkt_bits_br_start_error,
  output [30:0] io_exu_bp_exu_mp_pkt_bits_prett,
  output        io_exu_bp_exu_mp_pkt_bits_pcall,
  output        io_exu_bp_exu_mp_pkt_bits_pret,
  output        io_exu_bp_exu_mp_pkt_bits_pja,
  output        io_exu_bp_exu_mp_pkt_bits_way,
  output [7:0]  io_exu_bp_exu_mp_eghr,
  output [7:0]  io_exu_bp_exu_mp_fghr,
  output [7:0]  io_exu_bp_exu_mp_index,
  output [4:0]  io_exu_bp_exu_mp_btag,
  output        io_exu_flush_final,
  output [31:0] io_exu_div_result,
  output        io_exu_div_wren,
  input  [31:0] io_dbg_cmd_wrdata,
  output [31:0] io_lsu_exu_exu_lsu_rs1_d,
  output [31:0] io_lsu_exu_exu_lsu_rs2_d,
  output [30:0] io_exu_flush_path_final
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
  wire  i_alu_clock; // @[exu.scala 144:19]
  wire  i_alu_reset; // @[exu.scala 144:19]
  wire  i_alu_io_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 144:19]
  wire  i_alu_io_dec_alu_dec_csr_ren_d; // @[exu.scala 144:19]
  wire [11:0] i_alu_io_dec_alu_dec_i0_br_immed_d; // @[exu.scala 144:19]
  wire [30:0] i_alu_io_dec_alu_exu_i0_pc_x; // @[exu.scala 144:19]
  wire [30:0] i_alu_io_dec_i0_pc_d; // @[exu.scala 144:19]
  wire  i_alu_io_scan_mode; // @[exu.scala 144:19]
  wire  i_alu_io_flush_upper_x; // @[exu.scala 144:19]
  wire  i_alu_io_dec_tlu_flush_lower_r; // @[exu.scala 144:19]
  wire  i_alu_io_enable; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_land; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_lor; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_lxor; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_sll; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_srl; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_sra; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_beq; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_bne; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_blt; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_bge; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_add; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_sub; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_slt; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_unsign; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_jal; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_predict_t; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_predict_nt; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_csr_write; // @[exu.scala 144:19]
  wire  i_alu_io_i0_ap_csr_imm; // @[exu.scala 144:19]
  wire [31:0] i_alu_io_a_in; // @[exu.scala 144:19]
  wire [31:0] i_alu_io_b_in; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_valid; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_boffset; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_pc4; // @[exu.scala 144:19]
  wire [1:0] i_alu_io_pp_in_bits_hist; // @[exu.scala 144:19]
  wire [11:0] i_alu_io_pp_in_bits_toffset; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_br_error; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_br_start_error; // @[exu.scala 144:19]
  wire [30:0] i_alu_io_pp_in_bits_prett; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_pcall; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_pret; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_pja; // @[exu.scala 144:19]
  wire  i_alu_io_pp_in_bits_way; // @[exu.scala 144:19]
  wire [31:0] i_alu_io_result_ff; // @[exu.scala 144:19]
  wire  i_alu_io_flush_upper_out; // @[exu.scala 144:19]
  wire  i_alu_io_flush_final_out; // @[exu.scala 144:19]
  wire [30:0] i_alu_io_flush_path_out; // @[exu.scala 144:19]
  wire  i_alu_io_pred_correct_out; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_valid; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_misp; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_ataken; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_boffset; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_pc4; // @[exu.scala 144:19]
  wire [1:0] i_alu_io_predict_p_out_bits_hist; // @[exu.scala 144:19]
  wire [11:0] i_alu_io_predict_p_out_bits_toffset; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_br_error; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_br_start_error; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_pcall; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_pret; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_pja; // @[exu.scala 144:19]
  wire  i_alu_io_predict_p_out_bits_way; // @[exu.scala 144:19]
  wire  i_mul_clock; // @[exu.scala 162:19]
  wire  i_mul_reset; // @[exu.scala 162:19]
  wire  i_mul_io_scan_mode; // @[exu.scala 162:19]
  wire  i_mul_io_mul_p_valid; // @[exu.scala 162:19]
  wire  i_mul_io_mul_p_bits_rs1_sign; // @[exu.scala 162:19]
  wire  i_mul_io_mul_p_bits_rs2_sign; // @[exu.scala 162:19]
  wire  i_mul_io_mul_p_bits_low; // @[exu.scala 162:19]
  wire [31:0] i_mul_io_rs1_in; // @[exu.scala 162:19]
  wire [31:0] i_mul_io_rs2_in; // @[exu.scala 162:19]
  wire [31:0] i_mul_io_result_x; // @[exu.scala 162:19]
  wire  i_div_clock; // @[exu.scala 169:19]
  wire  i_div_reset; // @[exu.scala 169:19]
  wire  i_div_io_scan_mode; // @[exu.scala 169:19]
  wire [31:0] i_div_io_dividend; // @[exu.scala 169:19]
  wire [31:0] i_div_io_divisor; // @[exu.scala 169:19]
  wire [31:0] i_div_io_exu_div_result; // @[exu.scala 169:19]
  wire  i_div_io_exu_div_wren; // @[exu.scala 169:19]
  wire  i_div_io_dec_div_div_p_valid; // @[exu.scala 169:19]
  wire  i_div_io_dec_div_div_p_bits_unsign; // @[exu.scala 169:19]
  wire  i_div_io_dec_div_div_p_bits_rem; // @[exu.scala 169:19]
  wire  i_div_io_dec_div_dec_div_cancel; // @[exu.scala 169:19]
  wire [15:0] _T = {io_dec_exu_decode_exu_i0_predict_fghr_d,io_dec_exu_decode_exu_i0_predict_index_d}; // @[Cat.scala 29:58]
  reg [30:0] i0_flush_path_x; // @[el2_lib.scala 514:16]
  reg [31:0] _T_3; // @[el2_lib.scala 514:16]
  reg  i0_predict_p_x_valid; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_misp; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_ataken; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_boffset; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_pc4; // @[el2_lib.scala 524:16]
  reg [1:0] i0_predict_p_x_bits_hist; // @[el2_lib.scala 524:16]
  reg [11:0] i0_predict_p_x_bits_toffset; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_br_error; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_br_start_error; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_pcall; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_pret; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_pja; // @[el2_lib.scala 524:16]
  reg  i0_predict_p_x_bits_way; // @[el2_lib.scala 524:16]
  reg [20:0] predpipe_x; // @[el2_lib.scala 514:16]
  reg [20:0] predpipe_r; // @[el2_lib.scala 514:16]
  reg [7:0] ghr_x; // @[el2_lib.scala 514:16]
  reg  i0_pred_correct_upper_x; // @[el2_lib.scala 514:16]
  reg  i0_flush_upper_x; // @[el2_lib.scala 514:16]
  reg  i0_taken_x; // @[el2_lib.scala 514:16]
  reg  i0_valid_x; // @[el2_lib.scala 514:16]
  reg  i0_pp_r_valid; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_misp; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_ataken; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_boffset; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_pc4; // @[el2_lib.scala 524:16]
  reg [1:0] i0_pp_r_bits_hist; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_br_error; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_br_start_error; // @[el2_lib.scala 524:16]
  reg  i0_pp_r_bits_way; // @[el2_lib.scala 524:16]
  reg [5:0] pred_temp1; // @[el2_lib.scala 514:16]
  reg  i0_pred_correct_upper_r; // @[el2_lib.scala 514:16]
  reg [30:0] i0_flush_path_upper_r; // @[el2_lib.scala 514:16]
  reg [24:0] pred_temp2; // @[el2_lib.scala 514:16]
  wire [30:0] _T_23 = {pred_temp2,pred_temp1}; // @[Cat.scala 29:58]
  wire  _T_149 = ~io_dec_exu_tlu_exu_dec_tlu_flush_lower_r; // @[exu.scala 194:6]
  wire  i0_predict_p_d_valid = i_alu_io_predict_p_out_valid; // @[exu.scala 43:53 exu.scala 159:41]
  wire  _T_145 = i0_predict_p_d_valid & io_dec_exu_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 187:54]
  wire  i0_valid_d = _T_145 & _T_149; // @[exu.scala 187:95]
  wire  _T_150 = _T_149 & i0_valid_d; // @[exu.scala 194:48]
  reg [7:0] ghr_d; // @[el2_lib.scala 514:16]
  wire  i0_predict_p_d_bits_ataken = i_alu_io_predict_p_out_bits_ataken; // @[exu.scala 43:53 exu.scala 159:41]
  wire  i0_taken_d = i0_predict_p_d_bits_ataken & io_dec_exu_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 188:59]
  wire [7:0] _T_153 = {ghr_d[6:0],i0_taken_d}; // @[Cat.scala 29:58]
  wire [7:0] _T_159 = _T_150 ? _T_153 : 8'h0; // @[Mux.scala 27:72]
  wire  _T_155 = ~i0_valid_d; // @[exu.scala 195:50]
  wire  _T_156 = _T_149 & _T_155; // @[exu.scala 195:48]
  wire [7:0] _T_160 = _T_156 ? ghr_d : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_162 = _T_159 | _T_160; // @[Mux.scala 27:72]
  wire [7:0] _T_161 = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r ? ghr_x : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] ghr_d_ns = _T_162 | _T_161; // @[Mux.scala 27:72]
  wire  _T_39 = ghr_d_ns != ghr_d; // @[exu.scala 91:39]
  reg  mul_valid_x; // @[el2_lib.scala 514:16]
  wire  _T_40 = io_dec_exu_decode_exu_mul_p_valid != mul_valid_x; // @[exu.scala 91:89]
  wire  _T_41 = _T_39 | _T_40; // @[exu.scala 91:50]
  reg  flush_lower_ff; // @[el2_lib.scala 514:16]
  wire  _T_42 = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r != flush_lower_ff; // @[exu.scala 91:151]
  wire  i0_rs1_bypass_en_d = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[0] | io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[1]; // @[exu.scala 92:84]
  wire  i0_rs2_bypass_en_d = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[0] | io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[1]; // @[exu.scala 93:84]
  wire [31:0] _T_52 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[0] ? io_dec_exu_decode_exu_dec_i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_53 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[1] ? io_dec_exu_decode_exu_exu_i0_result_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_rs1_bypass_data_d = _T_52 | _T_53; // @[Mux.scala 27:72]
  wire [31:0] _T_59 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[0] ? io_dec_exu_decode_exu_dec_i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_60 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[1] ? io_dec_exu_decode_exu_exu_i0_result_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_rs2_bypass_data_d = _T_59 | _T_60; // @[Mux.scala 27:72]
  wire  _T_63 = ~i0_rs1_bypass_en_d; // @[exu.scala 107:6]
  wire  _T_64 = _T_63 & io_dec_exu_decode_exu_dec_i0_select_pc_d; // @[exu.scala 107:26]
  wire [31:0] _T_66 = {io_dec_exu_ib_exu_dec_i0_pc_d,1'h0}; // @[Cat.scala 29:58]
  wire  _T_68 = _T_63 & io_dec_exu_ib_exu_dec_debug_wdata_rs1_d; // @[exu.scala 108:26]
  wire  _T_71 = ~io_dec_exu_ib_exu_dec_debug_wdata_rs1_d; // @[exu.scala 109:28]
  wire  _T_72 = _T_63 & _T_71; // @[exu.scala 109:26]
  wire  _T_73 = _T_72 & io_dec_exu_decode_exu_dec_i0_rs1_en_d; // @[exu.scala 109:69]
  wire [31:0] _T_75 = i0_rs1_bypass_en_d ? i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_76 = _T_64 ? _T_66 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_77 = _T_68 ? io_dbg_cmd_wrdata : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_78 = _T_73 ? io_dec_exu_gpr_exu_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_79 = _T_75 | _T_76; // @[Mux.scala 27:72]
  wire [31:0] _T_80 = _T_79 | _T_77; // @[Mux.scala 27:72]
  wire [31:0] i0_rs1_d = _T_80 | _T_78; // @[Mux.scala 27:72]
  wire  _T_82 = ~i0_rs2_bypass_en_d; // @[exu.scala 113:6]
  wire  _T_83 = _T_82 & io_dec_exu_decode_exu_dec_i0_rs2_en_d; // @[exu.scala 113:26]
  wire [31:0] _T_88 = _T_83 ? io_dec_exu_gpr_exu_gpr_i0_rs2_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_89 = _T_82 ? io_dec_exu_decode_exu_dec_i0_immed_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_90 = i0_rs2_bypass_en_d ? i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_91 = _T_88 | _T_89; // @[Mux.scala 27:72]
  wire [31:0] _T_92 = _T_91 | _T_90; // @[Mux.scala 27:72]
  wire  _T_94 = ~io_dec_exu_decode_exu_dec_extint_stall; // @[exu.scala 120:28]
  wire  _T_95 = _T_63 & _T_94; // @[exu.scala 120:26]
  wire  _T_96 = _T_95 & io_dec_exu_decode_exu_dec_i0_rs1_en_d; // @[exu.scala 120:68]
  wire  _T_99 = i0_rs1_bypass_en_d & _T_94; // @[exu.scala 121:25]
  wire [31:0] _T_102 = {io_dec_exu_tlu_exu_dec_tlu_meihap,2'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_103 = _T_96 ? io_dec_exu_gpr_exu_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_104 = _T_99 ? i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_105 = io_dec_exu_decode_exu_dec_extint_stall ? _T_102 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_106 = _T_103 | _T_104; // @[Mux.scala 27:72]
  wire  _T_111 = _T_82 & _T_94; // @[exu.scala 126:26]
  wire  _T_112 = _T_111 & io_dec_exu_decode_exu_dec_i0_rs2_en_d; // @[exu.scala 126:68]
  wire  _T_115 = i0_rs2_bypass_en_d & _T_94; // @[exu.scala 127:25]
  wire [31:0] _T_117 = _T_112 ? io_dec_exu_gpr_exu_gpr_i0_rs2_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_118 = _T_115 ? i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire  _T_122 = _T_63 & io_dec_exu_decode_exu_dec_i0_rs1_en_d; // @[exu.scala 131:26]
  wire [31:0] _T_125 = _T_122 ? io_dec_exu_gpr_exu_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_167 = {ghr_x[6:0],i0_taken_x}; // @[Cat.scala 29:58]
  wire [20:0] final_predpipe_mp = i0_flush_upper_x ? predpipe_x : 21'h0; // @[exu.scala 213:49]
  wire  _T_179 = i0_flush_upper_x & _T_149; // @[exu.scala 215:67]
  wire [30:0] i0_flush_path_d = i_alu_io_flush_path_out; // @[exu.scala 42:53 exu.scala 157:41]
  wire [31:0] pred_correct_npc_r = {{1'd0}, _T_23}; // @[exu.scala 47:51 exu.scala 78:41]
  wire [31:0] _T_188 = i0_pred_correct_upper_r ? pred_correct_npc_r : {{1'd0}, i0_flush_path_upper_r}; // @[exu.scala 233:72]
  wire [31:0] i0_rs2_d = _T_92; // @[Mux.scala 27:72 Mux.scala 27:72]
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
  exu_alu_ctl i_alu ( // @[exu.scala 144:19]
    .clock(i_alu_clock),
    .reset(i_alu_reset),
    .io_dec_alu_dec_i0_alu_decode_d(i_alu_io_dec_alu_dec_i0_alu_decode_d),
    .io_dec_alu_dec_csr_ren_d(i_alu_io_dec_alu_dec_csr_ren_d),
    .io_dec_alu_dec_i0_br_immed_d(i_alu_io_dec_alu_dec_i0_br_immed_d),
    .io_dec_alu_exu_i0_pc_x(i_alu_io_dec_alu_exu_i0_pc_x),
    .io_dec_i0_pc_d(i_alu_io_dec_i0_pc_d),
    .io_scan_mode(i_alu_io_scan_mode),
    .io_flush_upper_x(i_alu_io_flush_upper_x),
    .io_dec_tlu_flush_lower_r(i_alu_io_dec_tlu_flush_lower_r),
    .io_enable(i_alu_io_enable),
    .io_i0_ap_land(i_alu_io_i0_ap_land),
    .io_i0_ap_lor(i_alu_io_i0_ap_lor),
    .io_i0_ap_lxor(i_alu_io_i0_ap_lxor),
    .io_i0_ap_sll(i_alu_io_i0_ap_sll),
    .io_i0_ap_srl(i_alu_io_i0_ap_srl),
    .io_i0_ap_sra(i_alu_io_i0_ap_sra),
    .io_i0_ap_beq(i_alu_io_i0_ap_beq),
    .io_i0_ap_bne(i_alu_io_i0_ap_bne),
    .io_i0_ap_blt(i_alu_io_i0_ap_blt),
    .io_i0_ap_bge(i_alu_io_i0_ap_bge),
    .io_i0_ap_add(i_alu_io_i0_ap_add),
    .io_i0_ap_sub(i_alu_io_i0_ap_sub),
    .io_i0_ap_slt(i_alu_io_i0_ap_slt),
    .io_i0_ap_unsign(i_alu_io_i0_ap_unsign),
    .io_i0_ap_jal(i_alu_io_i0_ap_jal),
    .io_i0_ap_predict_t(i_alu_io_i0_ap_predict_t),
    .io_i0_ap_predict_nt(i_alu_io_i0_ap_predict_nt),
    .io_i0_ap_csr_write(i_alu_io_i0_ap_csr_write),
    .io_i0_ap_csr_imm(i_alu_io_i0_ap_csr_imm),
    .io_a_in(i_alu_io_a_in),
    .io_b_in(i_alu_io_b_in),
    .io_pp_in_valid(i_alu_io_pp_in_valid),
    .io_pp_in_bits_boffset(i_alu_io_pp_in_bits_boffset),
    .io_pp_in_bits_pc4(i_alu_io_pp_in_bits_pc4),
    .io_pp_in_bits_hist(i_alu_io_pp_in_bits_hist),
    .io_pp_in_bits_toffset(i_alu_io_pp_in_bits_toffset),
    .io_pp_in_bits_br_error(i_alu_io_pp_in_bits_br_error),
    .io_pp_in_bits_br_start_error(i_alu_io_pp_in_bits_br_start_error),
    .io_pp_in_bits_prett(i_alu_io_pp_in_bits_prett),
    .io_pp_in_bits_pcall(i_alu_io_pp_in_bits_pcall),
    .io_pp_in_bits_pret(i_alu_io_pp_in_bits_pret),
    .io_pp_in_bits_pja(i_alu_io_pp_in_bits_pja),
    .io_pp_in_bits_way(i_alu_io_pp_in_bits_way),
    .io_result_ff(i_alu_io_result_ff),
    .io_flush_upper_out(i_alu_io_flush_upper_out),
    .io_flush_final_out(i_alu_io_flush_final_out),
    .io_flush_path_out(i_alu_io_flush_path_out),
    .io_pred_correct_out(i_alu_io_pred_correct_out),
    .io_predict_p_out_valid(i_alu_io_predict_p_out_valid),
    .io_predict_p_out_bits_misp(i_alu_io_predict_p_out_bits_misp),
    .io_predict_p_out_bits_ataken(i_alu_io_predict_p_out_bits_ataken),
    .io_predict_p_out_bits_boffset(i_alu_io_predict_p_out_bits_boffset),
    .io_predict_p_out_bits_pc4(i_alu_io_predict_p_out_bits_pc4),
    .io_predict_p_out_bits_hist(i_alu_io_predict_p_out_bits_hist),
    .io_predict_p_out_bits_toffset(i_alu_io_predict_p_out_bits_toffset),
    .io_predict_p_out_bits_br_error(i_alu_io_predict_p_out_bits_br_error),
    .io_predict_p_out_bits_br_start_error(i_alu_io_predict_p_out_bits_br_start_error),
    .io_predict_p_out_bits_pcall(i_alu_io_predict_p_out_bits_pcall),
    .io_predict_p_out_bits_pret(i_alu_io_predict_p_out_bits_pret),
    .io_predict_p_out_bits_pja(i_alu_io_predict_p_out_bits_pja),
    .io_predict_p_out_bits_way(i_alu_io_predict_p_out_bits_way)
  );
  exu_mul_ctl i_mul ( // @[exu.scala 162:19]
    .clock(i_mul_clock),
    .reset(i_mul_reset),
    .io_scan_mode(i_mul_io_scan_mode),
    .io_mul_p_valid(i_mul_io_mul_p_valid),
    .io_mul_p_bits_rs1_sign(i_mul_io_mul_p_bits_rs1_sign),
    .io_mul_p_bits_rs2_sign(i_mul_io_mul_p_bits_rs2_sign),
    .io_mul_p_bits_low(i_mul_io_mul_p_bits_low),
    .io_rs1_in(i_mul_io_rs1_in),
    .io_rs2_in(i_mul_io_rs2_in),
    .io_result_x(i_mul_io_result_x)
  );
  exu_div_ctl i_div ( // @[exu.scala 169:19]
    .clock(i_div_clock),
    .reset(i_div_reset),
    .io_scan_mode(i_div_io_scan_mode),
    .io_dividend(i_div_io_dividend),
    .io_divisor(i_div_io_divisor),
    .io_exu_div_result(i_div_io_exu_div_result),
    .io_exu_div_wren(i_div_io_exu_div_wren),
    .io_dec_div_div_p_valid(i_div_io_dec_div_div_p_valid),
    .io_dec_div_div_p_bits_unsign(i_div_io_dec_div_div_p_bits_unsign),
    .io_dec_div_div_p_bits_rem(i_div_io_dec_div_div_p_bits_rem),
    .io_dec_div_dec_div_cancel(i_div_io_dec_div_dec_div_cancel)
  );
  assign io_dec_exu_dec_alu_exu_i0_pc_x = i_alu_io_dec_alu_exu_i0_pc_x; // @[exu.scala 145:20]
  assign io_dec_exu_decode_exu_exu_i0_result_x = mul_valid_x ? i_mul_io_result_x : i_alu_io_result_ff; // @[exu.scala 178:58]
  assign io_dec_exu_decode_exu_exu_csr_rs1_x = _T_3; // @[exu.scala 64:57]
  assign io_dec_exu_tlu_exu_exu_i0_br_hist_r = i0_pp_r_bits_hist; // @[exu.scala 205:66]
  assign io_dec_exu_tlu_exu_exu_i0_br_error_r = i0_pp_r_bits_br_error; // @[exu.scala 206:58]
  assign io_dec_exu_tlu_exu_exu_i0_br_start_error_r = i0_pp_r_bits_br_start_error; // @[exu.scala 208:52]
  assign io_dec_exu_tlu_exu_exu_i0_br_index_r = predpipe_r[12:5]; // @[exu.scala 210:58]
  assign io_dec_exu_tlu_exu_exu_i0_br_valid_r = i0_pp_r_valid; // @[exu.scala 202:52]
  assign io_dec_exu_tlu_exu_exu_i0_br_mp_r = i0_pp_r_bits_misp; // @[exu.scala 203:52]
  assign io_dec_exu_tlu_exu_exu_i0_br_middle_r = i0_pp_r_bits_pc4 ^ i0_pp_r_bits_boffset; // @[exu.scala 207:52]
  assign io_dec_exu_tlu_exu_exu_pmu_i0_br_misp = i0_pp_r_bits_misp; // @[exu.scala 182:47]
  assign io_dec_exu_tlu_exu_exu_pmu_i0_br_ataken = i0_pp_r_bits_ataken; // @[exu.scala 183:47]
  assign io_dec_exu_tlu_exu_exu_pmu_i0_pc4 = i0_pp_r_bits_pc4; // @[exu.scala 184:47]
  assign io_dec_exu_tlu_exu_exu_npc_r = _T_188[30:0]; // @[exu.scala 233:66]
  assign io_exu_bp_exu_i0_br_index_r = io_dec_exu_tlu_exu_exu_i0_br_index_r; // @[exu.scala 211:31]
  assign io_exu_bp_exu_i0_br_fghr_r = predpipe_r[20:13]; // @[exu.scala 209:58]
  assign io_exu_bp_exu_i0_br_way_r = i0_pp_r_bits_way; // @[exu.scala 204:43]
  assign io_exu_bp_exu_mp_pkt_valid = 1'h0; // @[exu.scala 53:55]
  assign io_exu_bp_exu_mp_pkt_bits_misp = i0_flush_upper_x & i0_predict_p_x_bits_misp; // @[exu.scala 219:48]
  assign io_exu_bp_exu_mp_pkt_bits_ataken = i0_flush_upper_x & i0_predict_p_x_bits_ataken; // @[exu.scala 223:48]
  assign io_exu_bp_exu_mp_pkt_bits_boffset = i0_flush_upper_x & i0_predict_p_x_bits_boffset; // @[exu.scala 224:48]
  assign io_exu_bp_exu_mp_pkt_bits_pc4 = i0_flush_upper_x & i0_predict_p_x_bits_pc4; // @[exu.scala 225:48]
  assign io_exu_bp_exu_mp_pkt_bits_hist = i0_flush_upper_x ? i0_predict_p_x_bits_hist : 2'h0; // @[exu.scala 226:66]
  assign io_exu_bp_exu_mp_pkt_bits_toffset = i0_flush_upper_x ? i0_predict_p_x_bits_toffset : 12'h0; // @[exu.scala 227:58]
  assign io_exu_bp_exu_mp_pkt_bits_br_error = 1'h0; // @[exu.scala 52:49]
  assign io_exu_bp_exu_mp_pkt_bits_br_start_error = 1'h0; // @[exu.scala 51:43]
  assign io_exu_bp_exu_mp_pkt_bits_prett = 31'h0; // @[exu.scala 50:57]
  assign io_exu_bp_exu_mp_pkt_bits_pcall = i0_flush_upper_x & i0_predict_p_x_bits_pcall; // @[exu.scala 220:48]
  assign io_exu_bp_exu_mp_pkt_bits_pret = i0_flush_upper_x & i0_predict_p_x_bits_pret; // @[exu.scala 222:48]
  assign io_exu_bp_exu_mp_pkt_bits_pja = i0_flush_upper_x & i0_predict_p_x_bits_pja; // @[exu.scala 221:48]
  assign io_exu_bp_exu_mp_pkt_bits_way = i0_flush_upper_x & i0_predict_p_x_bits_way; // @[exu.scala 218:48]
  assign io_exu_bp_exu_mp_eghr = final_predpipe_mp[20:13]; // @[exu.scala 231:43]
  assign io_exu_bp_exu_mp_fghr = _T_179 ? ghr_d : ghr_x; // @[exu.scala 228:43]
  assign io_exu_bp_exu_mp_index = final_predpipe_mp[12:5]; // @[exu.scala 229:66]
  assign io_exu_bp_exu_mp_btag = final_predpipe_mp[4:0]; // @[exu.scala 230:58]
  assign io_exu_flush_final = i_alu_io_flush_final_out; // @[exu.scala 158:22]
  assign io_exu_div_result = i_div_io_exu_div_result; // @[exu.scala 176:33]
  assign io_exu_div_wren = i_div_io_exu_div_wren; // @[exu.scala 175:41]
  assign io_lsu_exu_exu_lsu_rs1_d = _T_106 | _T_105; // @[exu.scala 119:27]
  assign io_lsu_exu_exu_lsu_rs2_d = _T_117 | _T_118; // @[exu.scala 125:27]
  assign io_exu_flush_path_final = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r ? io_dec_exu_tlu_exu_dec_tlu_flush_path_r : i0_flush_path_d; // @[exu.scala 232:50]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_dec_exu_decode_exu_dec_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = io_dec_exu_decode_exu_dec_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_2_io_en = io_dec_exu_decode_exu_dec_data_en[1]; // @[el2_lib.scala 521:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = io_dec_exu_decode_exu_dec_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = io_dec_exu_decode_exu_dec_data_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_8_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_9_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_10_io_en = io_dec_exu_decode_exu_dec_ctl_en[0]; // @[el2_lib.scala 521:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = io_dec_exu_decode_exu_dec_ctl_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = io_dec_exu_decode_exu_dec_ctl_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_13_io_en = io_dec_exu_decode_exu_dec_data_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_14_io_en = io_dec_exu_decode_exu_dec_data_en[0]; // @[el2_lib.scala 511:17]
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
  assign i_alu_io_dec_alu_dec_i0_alu_decode_d = io_dec_exu_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 145:20]
  assign i_alu_io_dec_alu_dec_csr_ren_d = io_dec_exu_dec_alu_dec_csr_ren_d; // @[exu.scala 145:20]
  assign i_alu_io_dec_alu_dec_i0_br_immed_d = io_dec_exu_dec_alu_dec_i0_br_immed_d; // @[exu.scala 145:20]
  assign i_alu_io_dec_i0_pc_d = io_dec_exu_ib_exu_dec_i0_pc_d; // @[exu.scala 153:41]
  assign i_alu_io_scan_mode = io_scan_mode; // @[exu.scala 146:33]
  assign i_alu_io_flush_upper_x = i0_flush_upper_x; // @[exu.scala 149:33]
  assign i_alu_io_dec_tlu_flush_lower_r = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r; // @[exu.scala 150:41]
  assign i_alu_io_enable = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[exu.scala 147:41]
  assign i_alu_io_i0_ap_land = io_dec_exu_decode_exu_i0_ap_land; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_lor = io_dec_exu_decode_exu_i0_ap_lor; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_lxor = io_dec_exu_decode_exu_i0_ap_lxor; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_sll = io_dec_exu_decode_exu_i0_ap_sll; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_srl = io_dec_exu_decode_exu_i0_ap_srl; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_sra = io_dec_exu_decode_exu_i0_ap_sra; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_beq = io_dec_exu_decode_exu_i0_ap_beq; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_bne = io_dec_exu_decode_exu_i0_ap_bne; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_blt = io_dec_exu_decode_exu_i0_ap_blt; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_bge = io_dec_exu_decode_exu_i0_ap_bge; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_add = io_dec_exu_decode_exu_i0_ap_add; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_sub = io_dec_exu_decode_exu_i0_ap_sub; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_slt = io_dec_exu_decode_exu_i0_ap_slt; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_unsign = io_dec_exu_decode_exu_i0_ap_unsign; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_jal = io_dec_exu_decode_exu_i0_ap_jal; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_predict_t = io_dec_exu_decode_exu_i0_ap_predict_t; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_predict_nt = io_dec_exu_decode_exu_i0_ap_predict_nt; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_csr_write = io_dec_exu_decode_exu_i0_ap_csr_write; // @[exu.scala 154:49]
  assign i_alu_io_i0_ap_csr_imm = io_dec_exu_decode_exu_i0_ap_csr_imm; // @[exu.scala 154:49]
  assign i_alu_io_a_in = _T_80 | _T_78; // @[exu.scala 151:33]
  assign i_alu_io_b_in = i0_rs2_d; // @[exu.scala 152:33]
  assign i_alu_io_pp_in_valid = io_dec_exu_decode_exu_dec_i0_predict_p_d_valid; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_boffset = io_dec_exu_ib_exu_dec_i0_pc_d[0]; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_pc4 = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pc4; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_hist = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_hist; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_toffset = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_toffset; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_br_error = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_error; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_br_start_error = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_start_error; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_prett = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_prett; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_pcall = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pcall; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_pret = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pret; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_pja = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pja; // @[exu.scala 148:41]
  assign i_alu_io_pp_in_bits_way = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_way; // @[exu.scala 148:41]
  assign i_mul_clock = clock;
  assign i_mul_reset = reset;
  assign i_mul_io_scan_mode = io_scan_mode; // @[exu.scala 163:33]
  assign i_mul_io_mul_p_valid = io_dec_exu_decode_exu_mul_p_valid; // @[exu.scala 164:41]
  assign i_mul_io_mul_p_bits_rs1_sign = io_dec_exu_decode_exu_mul_p_bits_rs1_sign; // @[exu.scala 164:41]
  assign i_mul_io_mul_p_bits_rs2_sign = io_dec_exu_decode_exu_mul_p_bits_rs2_sign; // @[exu.scala 164:41]
  assign i_mul_io_mul_p_bits_low = io_dec_exu_decode_exu_mul_p_bits_low; // @[exu.scala 164:41]
  assign i_mul_io_rs1_in = _T_125 | _T_75; // @[exu.scala 165:41]
  assign i_mul_io_rs2_in = _T_91 | _T_90; // @[exu.scala 166:41]
  assign i_div_clock = clock;
  assign i_div_reset = reset;
  assign i_div_io_scan_mode = io_scan_mode; // @[exu.scala 171:33]
  assign i_div_io_dividend = _T_125 | _T_75; // @[exu.scala 173:33]
  assign i_div_io_divisor = _T_91 | _T_90; // @[exu.scala 174:33]
  assign i_div_io_dec_div_div_p_valid = io_dec_exu_dec_div_div_p_valid; // @[exu.scala 170:20]
  assign i_div_io_dec_div_div_p_bits_unsign = io_dec_exu_dec_div_div_p_bits_unsign; // @[exu.scala 170:20]
  assign i_div_io_dec_div_div_p_bits_rem = io_dec_exu_dec_div_div_p_bits_rem; // @[exu.scala 170:20]
  assign i_div_io_dec_div_dec_div_cancel = io_dec_exu_dec_div_dec_div_cancel; // @[exu.scala 170:20]
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
  i0_flush_path_x = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  _T_3 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  i0_predict_p_x_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  i0_predict_p_x_bits_misp = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  i0_predict_p_x_bits_ataken = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  i0_predict_p_x_bits_boffset = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  i0_predict_p_x_bits_pc4 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  i0_predict_p_x_bits_hist = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  i0_predict_p_x_bits_toffset = _RAND_8[11:0];
  _RAND_9 = {1{`RANDOM}};
  i0_predict_p_x_bits_br_error = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  i0_predict_p_x_bits_br_start_error = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  i0_predict_p_x_bits_pcall = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  i0_predict_p_x_bits_pret = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  i0_predict_p_x_bits_pja = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  i0_predict_p_x_bits_way = _RAND_14[0:0];
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
  i0_pp_r_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  i0_pp_r_bits_misp = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  i0_pp_r_bits_ataken = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  i0_pp_r_bits_boffset = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  i0_pp_r_bits_pc4 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  i0_pp_r_bits_hist = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  i0_pp_r_bits_br_error = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  i0_pp_r_bits_br_start_error = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  i0_pp_r_bits_way = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  pred_temp1 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  i0_pred_correct_upper_r = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  i0_flush_path_upper_r = _RAND_33[30:0];
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
    i0_flush_path_x = 31'h0;
  end
  if (reset) begin
    _T_3 = 32'h0;
  end
  if (reset) begin
    i0_predict_p_x_valid = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_misp = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_ataken = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_boffset = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pc4 = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_hist = 2'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_toffset = 12'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_br_error = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_br_start_error = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pcall = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pret = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pja = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_way = 1'h0;
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
    i0_pp_r_valid = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_misp = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_ataken = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_boffset = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_pc4 = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_hist = 2'h0;
  end
  if (reset) begin
    i0_pp_r_bits_br_error = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_br_start_error = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_way = 1'h0;
  end
  if (reset) begin
    pred_temp1 = 6'h0;
  end
  if (reset) begin
    i0_pred_correct_upper_r = 1'h0;
  end
  if (reset) begin
    i0_flush_path_upper_r = 31'h0;
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
      i0_flush_path_x <= 31'h0;
    end else begin
      i0_flush_path_x <= i_alu_io_flush_path_out;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_3 <= 32'h0;
    end else if (io_dec_exu_dec_alu_dec_csr_ren_d) begin
      _T_3 <= i0_rs1_d;
    end else begin
      _T_3 <= io_dec_exu_decode_exu_exu_csr_rs1_x;
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
      i0_predict_p_x_bits_misp <= 1'h0;
    end else begin
      i0_predict_p_x_bits_misp <= i_alu_io_predict_p_out_bits_misp;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_ataken <= 1'h0;
    end else begin
      i0_predict_p_x_bits_ataken <= i_alu_io_predict_p_out_bits_ataken;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_boffset <= 1'h0;
    end else begin
      i0_predict_p_x_bits_boffset <= i_alu_io_predict_p_out_bits_boffset;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pc4 <= 1'h0;
    end else begin
      i0_predict_p_x_bits_pc4 <= i_alu_io_predict_p_out_bits_pc4;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_hist <= 2'h0;
    end else begin
      i0_predict_p_x_bits_hist <= i_alu_io_predict_p_out_bits_hist;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_toffset <= 12'h0;
    end else begin
      i0_predict_p_x_bits_toffset <= i_alu_io_predict_p_out_bits_toffset;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_br_error <= 1'h0;
    end else begin
      i0_predict_p_x_bits_br_error <= i_alu_io_predict_p_out_bits_br_error;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_br_start_error <= 1'h0;
    end else begin
      i0_predict_p_x_bits_br_start_error <= i_alu_io_predict_p_out_bits_br_start_error;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pcall <= 1'h0;
    end else begin
      i0_predict_p_x_bits_pcall <= i_alu_io_predict_p_out_bits_pcall;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pret <= 1'h0;
    end else begin
      i0_predict_p_x_bits_pret <= i_alu_io_predict_p_out_bits_pret;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pja <= 1'h0;
    end else begin
      i0_predict_p_x_bits_pja <= i_alu_io_predict_p_out_bits_pja;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_way <= 1'h0;
    end else begin
      i0_predict_p_x_bits_way <= i_alu_io_predict_p_out_bits_way;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      predpipe_x <= 21'h0;
    end else begin
      predpipe_x <= {_T,io_dec_exu_decode_exu_i0_predict_btag_d};
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
      i0_taken_x <= i0_predict_p_d_bits_ataken & io_dec_exu_dec_alu_dec_i0_alu_decode_d;
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
      i0_pp_r_valid <= 1'h0;
    end else begin
      i0_pp_r_valid <= i0_predict_p_x_valid;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_misp <= 1'h0;
    end else begin
      i0_pp_r_bits_misp <= i0_predict_p_x_bits_misp;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_ataken <= 1'h0;
    end else begin
      i0_pp_r_bits_ataken <= i0_predict_p_x_bits_ataken;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_boffset <= 1'h0;
    end else begin
      i0_pp_r_bits_boffset <= i0_predict_p_x_bits_boffset;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_pc4 <= 1'h0;
    end else begin
      i0_pp_r_bits_pc4 <= i0_predict_p_x_bits_pc4;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_hist <= 2'h0;
    end else begin
      i0_pp_r_bits_hist <= i0_predict_p_x_bits_hist;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_br_error <= 1'h0;
    end else begin
      i0_pp_r_bits_br_error <= i0_predict_p_x_bits_br_error;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_br_start_error <= 1'h0;
    end else begin
      i0_pp_r_bits_br_start_error <= i0_predict_p_x_bits_br_start_error;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_way <= 1'h0;
    end else begin
      i0_pp_r_bits_way <= i0_predict_p_x_bits_way;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      pred_temp1 <= 6'h0;
    end else begin
      pred_temp1 <= io_dec_exu_decode_exu_pred_correct_npc_x[5:0];
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
      i0_flush_path_upper_r <= 31'h0;
    end else begin
      i0_flush_path_upper_r <= i0_flush_path_x;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      pred_temp2 <= 25'h0;
    end else begin
      pred_temp2 <= io_dec_exu_decode_exu_pred_correct_npc_x[30:6];
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
      mul_valid_x <= io_dec_exu_decode_exu_mul_p_valid;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      flush_lower_ff <= 1'h0;
    end else begin
      flush_lower_ff <= io_dec_exu_tlu_exu_dec_tlu_flush_lower_r;
    end
  end
endmodule
