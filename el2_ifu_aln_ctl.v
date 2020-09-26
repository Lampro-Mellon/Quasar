module el2_ifu_aln_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_ifu_async_error_start,
  input         io_iccm_rd_ecc_double_err,
  input         io_ic_access_fault_f,
  input  [1:0]  io_ic_access_fault_type_f,
  input  [7:0]  io_ifu_bp_fghr_f,
  input  [31:0] io_ifu_bp_btb_target_f,
  input  [11:0] io_ifu_bp_poffset_f,
  input  [1:0]  io_ifu_bp_hist0_f,
  input  [1:0]  io_ifu_bp_hist1_f,
  input  [1:0]  io_ifu_bp_pc4_f,
  input  [1:0]  io_ifu_bp_way_f,
  input  [1:0]  io_ifu_bp_valid_f,
  input  [1:0]  io_ifu_bp_ret_f,
  input         io_exu_flush_final,
  input         io_dec_i0_decode_d,
  input  [31:0] io_ifu_fetch_data_f,
  input  [1:0]  io_ifu_fetch_val,
  input  [31:0] io_ifu_fetch_pc,
  output        io_ifu_i0_valid,
  output        io_ifu_i0_icaf,
  output [1:0]  io_ifu_i0_icaf_type,
  output        io_ifu_i0_icaf_f1,
  output        io_ifu_i0_dbecc,
  output [31:0] io_ifu_i0_instr,
  output [31:0] io_ifu_i0_pc,
  output        io_ifu_i0_pc4,
  output        io_ifu_fb_consume1,
  output        io_ifu_fb_consume2,
  output [6:0]  io_ifu_i0_bp_index,
  output [7:0]  io_ifu_i0_bp_fghr,
  output [4:0]  io_ifu_i0_bp_btag,
  output        io_ifu_pmu_instr_aligned,
  output [15:0] io_ifu_i0_cinst,
  output        io_i0_brp_valid,
  output [11:0] io_i0_brp_toffset,
  output [1:0]  io_i0_brp_hist,
  output        io_i0_brp_br_error,
  output        io_i0_brp_br_start_error,
  output        io_i0_brp_bank,
  output [31:0] io_i0_brp_prett,
  output        io_i0_brp_way,
  output        io_i0_brp_ret
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
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  reg  error_stall; // @[el2_ifu_aln_ctl.scala 88:28]
  reg [1:0] f0val; // @[el2_ifu_aln_ctl.scala 89:22]
  wire  _T = error_stall | io_ifu_async_error_start; // @[el2_ifu_aln_ctl.scala 90:34]
  wire  _T_1 = ~io_exu_flush_final; // @[el2_ifu_aln_ctl.scala 90:64]
  wire  error_stall_in = _T & _T_1; // @[el2_ifu_aln_ctl.scala 90:62]
  wire  _T_3 = ~error_stall; // @[el2_ifu_aln_ctl.scala 92:39]
  wire  i0_shift = io_dec_i0_decode_d & _T_3; // @[el2_ifu_aln_ctl.scala 92:37]
  wire  _T_7 = ~f0val[1]; // @[el2_ifu_aln_ctl.scala 96:58]
  wire  _T_9 = _T_7 & f0val[0]; // @[el2_ifu_aln_ctl.scala 96:68]
  reg [1:0] rdptr; // @[el2_ifu_aln_ctl.scala 125:22]
  wire  _T_252 = rdptr == 2'h0; // @[el2_ifu_aln_ctl.scala 178:32]
  reg  q1off; // @[el2_ifu_aln_ctl.scala 132:22]
  wire  _T_255 = _T_252 & q1off; // @[Mux.scala 27:72]
  wire  _T_253 = rdptr == 2'h1; // @[el2_ifu_aln_ctl.scala 178:57]
  reg  q2off; // @[el2_ifu_aln_ctl.scala 131:22]
  wire  _T_256 = _T_253 & q2off; // @[Mux.scala 27:72]
  wire  _T_258 = _T_255 | _T_256; // @[Mux.scala 27:72]
  wire  _T_254 = rdptr == 2'h2; // @[el2_ifu_aln_ctl.scala 178:83]
  reg  q0off; // @[el2_ifu_aln_ctl.scala 133:22]
  wire  _T_257 = _T_254 & q0off; // @[Mux.scala 27:72]
  wire  q1ptr = _T_258 | _T_257; // @[Mux.scala 27:72]
  wire  _T_261 = ~q1ptr; // @[el2_ifu_aln_ctl.scala 182:26]
  wire [1:0] q1sel = {q1ptr,_T_261}; // @[Cat.scala 29:58]
  wire [2:0] qren = {_T_254,_T_253,_T_252}; // @[Cat.scala 29:58]
  reg [31:0] q1; // @[Reg.scala 27:20]
  reg [31:0] q0; // @[Reg.scala 27:20]
  wire [63:0] _T_321 = {q1,q0}; // @[Cat.scala 29:58]
  wire [63:0] _T_328 = qren[0] ? _T_321 : 64'h0; // @[Mux.scala 27:72]
  reg [31:0] q2; // @[Reg.scala 27:20]
  wire [63:0] _T_324 = {q2,q1}; // @[Cat.scala 29:58]
  wire [63:0] _T_329 = qren[1] ? _T_324 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_331 = _T_328 | _T_329; // @[Mux.scala 27:72]
  wire [63:0] _T_327 = {q0,q2}; // @[Cat.scala 29:58]
  wire [63:0] _T_330 = qren[2] ? _T_327 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] qeff = _T_331 | _T_330; // @[Mux.scala 27:72]
  wire [31:0] q1eff = qeff[63:32]; // @[el2_ifu_aln_ctl.scala 225:29]
  wire [15:0] _T_527 = q1sel[0] ? q1eff[15:0] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_528 = q1sel[1] ? q1eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] q1final = _T_527 | _T_528; // @[Mux.scala 27:72]
  wire  _T_247 = _T_252 & q0off; // @[Mux.scala 27:72]
  wire  _T_248 = _T_253 & q1off; // @[Mux.scala 27:72]
  wire  _T_250 = _T_247 | _T_248; // @[Mux.scala 27:72]
  wire  _T_249 = _T_254 & q2off; // @[Mux.scala 27:72]
  wire  q0ptr = _T_250 | _T_249; // @[Mux.scala 27:72]
  wire  _T_260 = ~q0ptr; // @[el2_ifu_aln_ctl.scala 180:26]
  wire [1:0] q0sel = {q0ptr,_T_260}; // @[Cat.scala 29:58]
  wire [31:0] q0eff = qeff[31:0]; // @[el2_ifu_aln_ctl.scala 225:42]
  wire [31:0] _T_517 = q0sel[0] ? q0eff : 32'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_518 = q0sel[1] ? q0eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_12 = {{16'd0}, _T_518}; // @[Mux.scala 27:72]
  wire [31:0] _T_519 = _T_517 | _GEN_12; // @[Mux.scala 27:72]
  wire [15:0] q0final = _T_519[15:0]; // @[el2_ifu_aln_ctl.scala 294:11]
  wire [31:0] _T_11 = {q1final,q0final}; // @[Cat.scala 29:58]
  wire [15:0] _T_12 = f0val[0] ? q0final : 16'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_13 = _T_9 ? _T_11 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_13 = {{16'd0}, _T_12}; // @[Mux.scala 27:72]
  wire [31:0] aligndata = _GEN_13 | _T_13; // @[Mux.scala 27:72]
  reg [54:0] _T_768; // @[Reg.scala 27:20]
  wire [53:0] misc1 = _T_768[53:0]; // @[el2_ifu_aln_ctl.scala 372:9]
  reg [54:0] _T_770; // @[Reg.scala 27:20]
  wire [53:0] misc0 = _T_770[53:0]; // @[el2_ifu_aln_ctl.scala 373:9]
  wire [107:0] _T_269 = {misc1,misc0}; // @[Cat.scala 29:58]
  wire [107:0] _T_276 = qren[0] ? _T_269 : 108'h0; // @[Mux.scala 27:72]
  reg [54:0] _T_766; // @[Reg.scala 27:20]
  wire [53:0] misc2 = _T_766[53:0]; // @[el2_ifu_aln_ctl.scala 371:9]
  wire [107:0] _T_272 = {misc2,misc1}; // @[Cat.scala 29:58]
  wire [107:0] _T_277 = qren[1] ? _T_272 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] _T_279 = _T_276 | _T_277; // @[Mux.scala 27:72]
  wire [107:0] _T_275 = {misc0,misc2}; // @[Cat.scala 29:58]
  wire [107:0] _T_278 = qren[2] ? _T_275 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] misceff = _T_279 | _T_278; // @[Mux.scala 27:72]
  wire [52:0] misc1eff = misceff[107:55]; // @[el2_ifu_aln_ctl.scala 191:25]
  wire  f1icaf = misc1eff[51]; // @[el2_ifu_aln_ctl.scala 195:21]
  wire [54:0] misc0eff = misceff[54:0]; // @[el2_ifu_aln_ctl.scala 192:25]
  wire  f0icaf = misc0eff[53]; // @[el2_ifu_aln_ctl.scala 202:21]
  wire [1:0] _T_23 = {f1icaf,f0icaf}; // @[Cat.scala 29:58]
  wire  _T_24 = f0val[1] & f0icaf; // @[Mux.scala 27:72]
  wire [1:0] _T_25 = _T_9 ? _T_23 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_14 = {{1'd0}, _T_24}; // @[Mux.scala 27:72]
  wire [1:0] alignicaf = _GEN_14 | _T_25; // @[Mux.scala 27:72]
  wire [1:0] _T_539 = f0val[1] ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] f1val; // @[el2_ifu_aln_ctl.scala 128:22]
  wire [1:0] _T_538 = {f1val[0],1'h1}; // @[Cat.scala 29:58]
  wire [1:0] _T_540 = _T_9 ? _T_538 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignval = _T_539 | _T_540; // @[Mux.scala 27:72]
  wire  f0_shift_2B = i0_shift & f0val[0]; // @[Mux.scala 27:72]
  reg [1:0] wrptr; // @[el2_ifu_aln_ctl.scala 124:22]
  reg [1:0] f2val; // @[el2_ifu_aln_ctl.scala 127:22]
  wire  _T_58 = ~f1val[0]; // @[el2_ifu_aln_ctl.scala 135:42]
  wire  f2_valid = f2val[0]; // @[el2_ifu_aln_ctl.scala 246:20]
  wire  _T_60 = ~f2_valid; // @[el2_ifu_aln_ctl.scala 135:55]
  wire  ifvalid = io_ifu_fetch_val[0]; // @[el2_ifu_aln_ctl.scala 256:30]
  wire  _T_65 = _T_58 & f2_valid; // @[el2_ifu_aln_ctl.scala 136:53]
  wire  _T_66 = _T_65 & ifvalid; // @[el2_ifu_aln_ctl.scala 136:65]
  wire  _T_70 = f1val[0] & _T_60; // @[el2_ifu_aln_ctl.scala 137:30]
  wire  _T_71 = _T_70 & ifvalid; // @[el2_ifu_aln_ctl.scala 137:42]
  wire  fetch_to_f1 = _T_66 | _T_71; // @[el2_ifu_aln_ctl.scala 136:77]
  wire  _T_80 = f1val[0] & f2_valid; // @[el2_ifu_aln_ctl.scala 139:53]
  wire  f2_wr_en = _T_80 & ifvalid; // @[el2_ifu_aln_ctl.scala 139:65]
  wire  _T_94 = wrptr == 2'h2; // @[el2_ifu_aln_ctl.scala 147:24]
  wire  _T_95 = _T_94 & ifvalid; // @[el2_ifu_aln_ctl.scala 147:32]
  wire  _T_96 = wrptr == 2'h1; // @[el2_ifu_aln_ctl.scala 147:49]
  wire  _T_97 = _T_96 & ifvalid; // @[el2_ifu_aln_ctl.scala 147:57]
  wire  _T_98 = wrptr == 2'h0; // @[el2_ifu_aln_ctl.scala 147:74]
  wire  _T_99 = _T_98 & ifvalid; // @[el2_ifu_aln_ctl.scala 147:82]
  wire [2:0] qwen = {_T_95,_T_97,_T_99}; // @[Cat.scala 29:58]
  wire  _T_153 = qwen[0] & _T_1; // @[el2_ifu_aln_ctl.scala 157:34]
  wire  _T_157 = qwen[1] & _T_1; // @[el2_ifu_aln_ctl.scala 158:34]
  wire  _T_163 = ~ifvalid; // @[el2_ifu_aln_ctl.scala 160:26]
  wire  _T_165 = _T_163 & _T_1; // @[el2_ifu_aln_ctl.scala 160:35]
  wire [1:0] _T_168 = _T_157 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_170 = _T_165 ? wrptr : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_17 = {{1'd0}, _T_153}; // @[Mux.scala 27:72]
  wire [1:0] _T_171 = _GEN_17 | _T_168; // @[Mux.scala 27:72]
  wire [1:0] wrptr_in = _T_171 | _T_170; // @[Mux.scala 27:72]
  wire  _T_176 = ~qwen[2]; // @[el2_ifu_aln_ctl.scala 162:26]
  wire  _T_178 = _T_176 & _T_254; // @[el2_ifu_aln_ctl.scala 162:35]
  wire  _T_180 = q2off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 162:74]
  wire  _T_184 = _T_176 & _T_253; // @[el2_ifu_aln_ctl.scala 163:35]
  wire  _T_190 = _T_176 & _T_252; // @[el2_ifu_aln_ctl.scala 164:35]
  wire  _T_192 = _T_178 & _T_180; // @[Mux.scala 27:72]
  wire  _T_193 = _T_184 & q2off; // @[Mux.scala 27:72]
  wire  _T_194 = _T_190 & q2off; // @[Mux.scala 27:72]
  wire  _T_195 = _T_192 | _T_193; // @[Mux.scala 27:72]
  wire  q2off_in = _T_195 | _T_194; // @[Mux.scala 27:72]
  wire  _T_199 = ~qwen[1]; // @[el2_ifu_aln_ctl.scala 166:26]
  wire  _T_201 = _T_199 & _T_253; // @[el2_ifu_aln_ctl.scala 166:35]
  wire  _T_203 = q1off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 166:74]
  wire  _T_207 = _T_199 & _T_252; // @[el2_ifu_aln_ctl.scala 167:35]
  wire  _T_213 = _T_199 & _T_254; // @[el2_ifu_aln_ctl.scala 168:35]
  wire  _T_215 = _T_201 & _T_203; // @[Mux.scala 27:72]
  wire  _T_216 = _T_207 & q1off; // @[Mux.scala 27:72]
  wire  _T_217 = _T_213 & q1off; // @[Mux.scala 27:72]
  wire  _T_218 = _T_215 | _T_216; // @[Mux.scala 27:72]
  wire  q1off_in = _T_218 | _T_217; // @[Mux.scala 27:72]
  wire  _T_222 = ~qwen[0]; // @[el2_ifu_aln_ctl.scala 170:26]
  wire  _T_224 = _T_222 & _T_252; // @[el2_ifu_aln_ctl.scala 170:35]
  wire  _T_226 = q0off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 170:76]
  wire  _T_230 = _T_222 & _T_254; // @[el2_ifu_aln_ctl.scala 171:35]
  wire  _T_236 = _T_222 & _T_253; // @[el2_ifu_aln_ctl.scala 172:35]
  wire  _T_238 = _T_224 & _T_226; // @[Mux.scala 27:72]
  wire  _T_239 = _T_230 & q0off; // @[Mux.scala 27:72]
  wire  _T_240 = _T_236 & q0off; // @[Mux.scala 27:72]
  wire  _T_241 = _T_238 | _T_239; // @[Mux.scala 27:72]
  wire  q0off_in = _T_241 | _T_240; // @[Mux.scala 27:72]
  wire [54:0] misc_data_in = {io_iccm_rd_ecc_double_err,io_ic_access_fault_f,io_ic_access_fault_type_f,io_ifu_bp_btb_target_f[31:1],io_ifu_bp_poffset_f,io_ifu_bp_fghr_f}; // @[Cat.scala 29:58]
  wire  f1dbecc = misc1eff[52]; // @[el2_ifu_aln_ctl.scala 194:25]
  wire  f0dbecc = misc0eff[54]; // @[el2_ifu_aln_ctl.scala 201:25]
  wire [30:0] f0prett = misc0eff[50:20]; // @[el2_ifu_aln_ctl.scala 204:25]
  wire [5:0] _T_299 = {io_ifu_bp_hist1_f[0],io_ifu_bp_hist0_f[0],io_ifu_bp_pc4_f[0],io_ifu_bp_way_f[0],io_ifu_bp_valid_f[0],io_ifu_bp_ret_f[0]}; // @[Cat.scala 29:58]
  wire [11:0] brdata_in = {io_ifu_bp_hist1_f[1],io_ifu_bp_hist0_f[1],io_ifu_bp_pc4_f[1],io_ifu_bp_way_f[1],io_ifu_bp_valid_f[1],io_ifu_bp_ret_f[1],_T_299}; // @[Cat.scala 29:58]
  reg [11:0] brdata1; // @[Reg.scala 27:20]
  reg [11:0] brdata0; // @[Reg.scala 27:20]
  wire [23:0] _T_307 = {brdata1,brdata0}; // @[Cat.scala 29:58]
  reg [11:0] brdata2; // @[Reg.scala 27:20]
  wire [23:0] _T_310 = {brdata2,brdata1}; // @[Cat.scala 29:58]
  wire [23:0] _T_313 = {brdata0,brdata2}; // @[Cat.scala 29:58]
  wire [23:0] _T_314 = qren[0] ? _T_307 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_315 = qren[1] ? _T_310 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_316 = qren[2] ? _T_313 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_317 = _T_314 | _T_315; // @[Mux.scala 27:72]
  wire [23:0] brdataeff = _T_317 | _T_316; // @[Mux.scala 27:72]
  wire [11:0] brdata0eff = brdataeff[11:0]; // @[el2_ifu_aln_ctl.scala 216:43]
  wire [11:0] brdata1eff = brdataeff[23:12]; // @[el2_ifu_aln_ctl.scala 216:61]
  wire [11:0] _T_338 = q0sel[0] ? brdata0eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_339 = q0sel[1] ? brdata0eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_18 = {{6'd0}, _T_339}; // @[Mux.scala 27:72]
  wire [11:0] brdata0final = _T_338 | _GEN_18; // @[Mux.scala 27:72]
  wire [11:0] _T_346 = q1sel[0] ? brdata1eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_347 = q1sel[1] ? brdata1eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_19 = {{6'd0}, _T_347}; // @[Mux.scala 27:72]
  wire [11:0] brdata1final = _T_346 | _GEN_19; // @[Mux.scala 27:72]
  wire [1:0] f0ret = {brdata0final[6],brdata0final[0]}; // @[Cat.scala 29:58]
  wire [1:0] f0brend = {brdata0final[7],brdata0final[1]}; // @[Cat.scala 29:58]
  wire [1:0] f0way = {brdata0final[8],brdata0final[2]}; // @[Cat.scala 29:58]
  wire [1:0] f0pc4 = {brdata0final[9],brdata0final[3]}; // @[Cat.scala 29:58]
  wire [1:0] f0hist0 = {brdata0final[10],brdata0final[4]}; // @[Cat.scala 29:58]
  wire [1:0] f0hist1 = {brdata0final[11],brdata0final[5]}; // @[Cat.scala 29:58]
  wire [1:0] f1ret = {brdata1final[6],brdata1final[0]}; // @[Cat.scala 29:58]
  wire [1:0] f1brend = {brdata1final[7],brdata1final[1]}; // @[Cat.scala 29:58]
  wire [1:0] f1way = {brdata1final[8],brdata1final[2]}; // @[Cat.scala 29:58]
  wire [1:0] f1pc4 = {brdata1final[9],brdata1final[3]}; // @[Cat.scala 29:58]
  wire [1:0] f1hist0 = {brdata1final[10],brdata1final[4]}; // @[Cat.scala 29:58]
  wire [1:0] f1hist1 = {brdata1final[11],brdata1final[5]}; // @[Cat.scala 29:58]
  wire  consume_fb1 = _T_58 & f1val[0]; // @[el2_ifu_aln_ctl.scala 251:32]
  wire  _T_382 = ~consume_fb1; // @[el2_ifu_aln_ctl.scala 253:39]
  wire  _T_383 = f0val[0] & _T_382; // @[el2_ifu_aln_ctl.scala 253:37]
  wire  _T_386 = f0val[0] & consume_fb1; // @[el2_ifu_aln_ctl.scala 254:37]
  wire  _T_409 = ~fetch_to_f1; // @[el2_ifu_aln_ctl.scala 271:28]
  wire  _T_410 = ~_T_80; // @[el2_ifu_aln_ctl.scala 271:43]
  wire  _T_411 = _T_409 & _T_410; // @[el2_ifu_aln_ctl.scala 271:41]
  wire  _T_422 = ~_T_65; // @[el2_ifu_aln_ctl.scala 276:43]
  wire  _T_435 = f2_wr_en & _T_1; // @[el2_ifu_aln_ctl.scala 278:38]
  wire  _T_437 = ~f2_wr_en; // @[el2_ifu_aln_ctl.scala 279:6]
  wire  _T_439 = _T_437 & _T_410; // @[el2_ifu_aln_ctl.scala 279:19]
  wire  _T_441 = _T_439 & _T_422; // @[el2_ifu_aln_ctl.scala 279:34]
  wire  _T_443 = _T_441 & _T_1; // @[el2_ifu_aln_ctl.scala 279:49]
  wire [1:0] _T_445 = _T_435 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_446 = _T_443 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] f2val_in = _T_445 | _T_446; // @[Mux.scala 27:72]
  wire  _T_458 = fetch_to_f1 & _T_1; // @[el2_ifu_aln_ctl.scala 283:38]
  wire  _T_461 = _T_80 & _T_1; // @[el2_ifu_aln_ctl.scala 284:38]
  wire  _T_467 = _T_411 & _T_58; // @[el2_ifu_aln_ctl.scala 285:54]
  wire  _T_469 = _T_467 & _T_1; // @[el2_ifu_aln_ctl.scala 285:69]
  wire [1:0] _T_471 = _T_458 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_472 = _T_461 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_473 = _T_469 ? f1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_474 = _T_471 | _T_472; // @[Mux.scala 27:72]
  wire [1:0] f1val_in = _T_474 | _T_473; // @[Mux.scala 27:72]
  wire  _T_479 = ~i0_shift; // @[el2_ifu_aln_ctl.scala 287:52]
  wire  _T_483 = i0_shift & f0val[1]; // @[Mux.scala 27:72]
  wire [1:0] _T_484 = _T_479 ? f0val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_23 = {{1'd0}, _T_483}; // @[Mux.scala 27:72]
  wire [1:0] _T_485 = _GEN_23 | _T_484; // @[Mux.scala 27:72]
  wire [1:0] _T_546 = f0dbecc ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_552 = {f1dbecc,f0dbecc}; // @[Cat.scala 29:58]
  wire [1:0] _T_553 = f0val[1] ? _T_546 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_554 = _T_9 ? _T_552 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] aligndbecc = _T_553 | _T_554; // @[Mux.scala 27:72]
  wire [1:0] _T_565 = {f1brend[0],f0brend[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_566 = f0val[1] ? f0brend : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_567 = _T_9 ? _T_565 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignbrend = _T_566 | _T_567; // @[Mux.scala 27:72]
  wire [1:0] _T_578 = {f1pc4[0],f0pc4[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_579 = f0val[1] ? f0pc4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_580 = _T_9 ? _T_578 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignpc4 = _T_579 | _T_580; // @[Mux.scala 27:72]
  wire [1:0] _T_591 = {f1ret[0],f0ret[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_592 = f0val[1] ? f0ret : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_593 = _T_9 ? _T_591 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignret = _T_592 | _T_593; // @[Mux.scala 27:72]
  wire [1:0] _T_604 = {f1way[0],f0way[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_605 = f0val[1] ? f0way : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_606 = _T_9 ? _T_604 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignway = _T_605 | _T_606; // @[Mux.scala 27:72]
  wire [1:0] _T_617 = {f1hist1[0],f0hist1[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_618 = f0val[1] ? f0hist1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_619 = _T_9 ? _T_617 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist1 = _T_618 | _T_619; // @[Mux.scala 27:72]
  wire [1:0] _T_630 = {f1hist0[0],f0hist0[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_631 = f0val[1] ? f0hist0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_632 = _T_9 ? _T_630 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist0 = _T_631 | _T_632; // @[Mux.scala 27:72]
  wire  i0_brp_pc4 = alignpc4[0]; // @[el2_ifu_aln_ctl.scala 356:39]
  assign io_ifu_i0_valid = alignval[0]; // @[el2_ifu_aln_ctl.scala 116:19]
  assign io_ifu_i0_icaf = alignicaf[0]; // @[el2_ifu_aln_ctl.scala 115:18]
  assign io_ifu_i0_icaf_type = misc0eff[52:51]; // @[el2_ifu_aln_ctl.scala 324:23]
  assign io_ifu_i0_icaf_f1 = 1'h0; // @[el2_ifu_aln_ctl.scala 328:21]
  assign io_ifu_i0_dbecc = aligndbecc[0]; // @[el2_ifu_aln_ctl.scala 330:19]
  assign io_ifu_i0_instr = 32'h0; // @[el2_ifu_aln_ctl.scala 104:19]
  assign io_ifu_i0_pc = 32'h0; // @[el2_ifu_aln_ctl.scala 320:16]
  assign io_ifu_i0_pc4 = 1'h0; // @[el2_ifu_aln_ctl.scala 117:17]
  assign io_ifu_fb_consume1 = _T_383 & _T_1; // @[el2_ifu_aln_ctl.scala 253:22]
  assign io_ifu_fb_consume2 = _T_386 & _T_1; // @[el2_ifu_aln_ctl.scala 254:22]
  assign io_ifu_i0_bp_index = 7'h0; // @[el2_ifu_aln_ctl.scala 361:22]
  assign io_ifu_i0_bp_fghr = misc0eff[7:0]; // @[el2_ifu_aln_ctl.scala 363:21]
  assign io_ifu_i0_bp_btag = 5'h0; // @[el2_ifu_aln_ctl.scala 365:21]
  assign io_ifu_pmu_instr_aligned = io_dec_i0_decode_d & _T_3; // @[el2_ifu_aln_ctl.scala 94:28]
  assign io_ifu_i0_cinst = aligndata[15:0]; // @[el2_ifu_aln_ctl.scala 107:19]
  assign io_i0_brp_valid = alignbrend[0]; // @[el2_ifu_aln_ctl.scala 340:19]
  assign io_i0_brp_toffset = misc0eff[19:8]; // @[el2_ifu_aln_ctl.scala 348:21]
  assign io_i0_brp_hist = {alignhist1[0],alignhist0[0]}; // @[el2_ifu_aln_ctl.scala 345:18]
  assign io_i0_brp_br_error = io_i0_brp_valid & i0_brp_pc4; // @[el2_ifu_aln_ctl.scala 358:22]
  assign io_i0_brp_br_start_error = 1'h0; // @[el2_ifu_aln_ctl.scala 352:29]
  assign io_i0_brp_bank = 1'h0; // @[el2_ifu_aln_ctl.scala 354:29]
  assign io_i0_brp_prett = {{1'd0}, f0prett}; // @[el2_ifu_aln_ctl.scala 350:19]
  assign io_i0_brp_way = alignway[0]; // @[el2_ifu_aln_ctl.scala 344:17]
  assign io_i0_brp_ret = alignret[0]; // @[el2_ifu_aln_ctl.scala 342:17]
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
  error_stall = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  f0val = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rdptr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  q1off = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  q2off = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  q0off = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  q1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  q0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  q2 = _RAND_8[31:0];
  _RAND_9 = {2{`RANDOM}};
  _T_768 = _RAND_9[54:0];
  _RAND_10 = {2{`RANDOM}};
  _T_770 = _RAND_10[54:0];
  _RAND_11 = {2{`RANDOM}};
  _T_766 = _RAND_11[54:0];
  _RAND_12 = {1{`RANDOM}};
  f1val = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  wrptr = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  f2val = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  brdata1 = _RAND_15[11:0];
  _RAND_16 = {1{`RANDOM}};
  brdata0 = _RAND_16[11:0];
  _RAND_17 = {1{`RANDOM}};
  brdata2 = _RAND_17[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      error_stall <= 1'h0;
    end else begin
      error_stall <= error_stall_in;
    end
    if (reset) begin
      f0val <= 2'h0;
    end else begin
      f0val <= _T_485;
    end
    if (reset) begin
      rdptr <= 2'h0;
    end else begin
      rdptr <= wrptr_in;
    end
    if (reset) begin
      q1off <= 1'h0;
    end else begin
      q1off <= q1off_in;
    end
    if (reset) begin
      q2off <= 1'h0;
    end else begin
      q2off <= q2off_in;
    end
    if (reset) begin
      q0off <= 1'h0;
    end else begin
      q0off <= q0off_in;
    end
    if (reset) begin
      q1 <= 32'h0;
    end else if (qwen[1]) begin
      q1 <= io_ifu_fetch_data_f;
    end
    if (reset) begin
      q0 <= 32'h0;
    end else if (qwen[0]) begin
      q0 <= io_ifu_fetch_data_f;
    end
    if (reset) begin
      q2 <= 32'h0;
    end else if (qwen[2]) begin
      q2 <= io_ifu_fetch_data_f;
    end
    if (reset) begin
      _T_768 <= 55'h0;
    end else if (qwen[1]) begin
      _T_768 <= misc_data_in;
    end
    if (reset) begin
      _T_770 <= 55'h0;
    end else if (qwen[0]) begin
      _T_770 <= misc_data_in;
    end
    if (reset) begin
      _T_766 <= 55'h0;
    end else if (qwen[2]) begin
      _T_766 <= misc_data_in;
    end
    if (reset) begin
      f1val <= 2'h0;
    end else begin
      f1val <= f1val_in;
    end
    if (reset) begin
      wrptr <= 2'h0;
    end else begin
      wrptr <= wrptr_in;
    end
    if (reset) begin
      f2val <= 2'h0;
    end else begin
      f2val <= f2val_in;
    end
    if (reset) begin
      brdata1 <= 12'h0;
    end else if (qwen[1]) begin
      brdata1 <= brdata_in;
    end
    if (reset) begin
      brdata0 <= 12'h0;
    end else if (qwen[0]) begin
      brdata0 <= brdata_in;
    end
    if (reset) begin
      brdata2 <= 12'h0;
    end else if (qwen[2]) begin
      brdata2 <= brdata_in;
    end
  end
endmodule
