module el2_exu_div_cls(
  input  [32:0] io_operand,
  output [4:0]  io_cls
);
  wire  _T_3 = io_operand[31:30] == 2'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_5 = io_operand[31:29] == 3'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_7 = io_operand[31:28] == 4'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_9 = io_operand[31:27] == 5'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_11 = io_operand[31:26] == 6'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_13 = io_operand[31:25] == 7'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_15 = io_operand[31:24] == 8'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_17 = io_operand[31:23] == 9'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_19 = io_operand[31:22] == 10'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_21 = io_operand[31:21] == 11'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_23 = io_operand[31:20] == 12'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_25 = io_operand[31:19] == 13'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_27 = io_operand[31:18] == 14'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_29 = io_operand[31:17] == 15'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_31 = io_operand[31:16] == 16'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_33 = io_operand[31:15] == 17'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_35 = io_operand[31:14] == 18'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_37 = io_operand[31:13] == 19'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_39 = io_operand[31:12] == 20'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_41 = io_operand[31:11] == 21'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_43 = io_operand[31:10] == 22'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_45 = io_operand[31:9] == 23'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_47 = io_operand[31:8] == 24'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_49 = io_operand[31:7] == 25'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_51 = io_operand[31:6] == 26'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_53 = io_operand[31:5] == 27'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_55 = io_operand[31:4] == 28'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_57 = io_operand[31:3] == 29'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_59 = io_operand[31:2] == 30'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_61 = io_operand[31:1] == 31'h1; // @[exu_div_ctl.scala 511:63]
  wire  _T_63 = io_operand[31:0] == 32'h1; // @[exu_div_ctl.scala 511:63]
  wire [1:0] _T_66 = _T_5 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_67 = _T_7 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_68 = _T_9 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_69 = _T_11 ? 3'h5 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_70 = _T_13 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_71 = _T_15 ? 3'h7 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_72 = _T_17 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_73 = _T_19 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_74 = _T_21 ? 4'ha : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_75 = _T_23 ? 4'hb : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_76 = _T_25 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_77 = _T_27 ? 4'hd : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_78 = _T_29 ? 4'he : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_79 = _T_31 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_80 = _T_33 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_81 = _T_35 ? 5'h11 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_82 = _T_37 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_83 = _T_39 ? 5'h13 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_84 = _T_41 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_85 = _T_43 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_86 = _T_45 ? 5'h16 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_87 = _T_47 ? 5'h17 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_88 = _T_49 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_89 = _T_51 ? 5'h19 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_90 = _T_53 ? 5'h1a : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_91 = _T_55 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_92 = _T_57 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_93 = _T_59 ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_94 = _T_61 ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_95 = _T_63 ? 5'h1f : 5'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_1 = {{1'd0}, _T_3}; // @[Mux.scala 27:72]
  wire [1:0] _T_97 = _GEN_1 | _T_66; // @[Mux.scala 27:72]
  wire [1:0] _T_98 = _T_97 | _T_67; // @[Mux.scala 27:72]
  wire [2:0] _GEN_2 = {{1'd0}, _T_98}; // @[Mux.scala 27:72]
  wire [2:0] _T_99 = _GEN_2 | _T_68; // @[Mux.scala 27:72]
  wire [2:0] _T_100 = _T_99 | _T_69; // @[Mux.scala 27:72]
  wire [2:0] _T_101 = _T_100 | _T_70; // @[Mux.scala 27:72]
  wire [2:0] _T_102 = _T_101 | _T_71; // @[Mux.scala 27:72]
  wire [3:0] _GEN_3 = {{1'd0}, _T_102}; // @[Mux.scala 27:72]
  wire [3:0] _T_103 = _GEN_3 | _T_72; // @[Mux.scala 27:72]
  wire [3:0] _T_104 = _T_103 | _T_73; // @[Mux.scala 27:72]
  wire [3:0] _T_105 = _T_104 | _T_74; // @[Mux.scala 27:72]
  wire [3:0] _T_106 = _T_105 | _T_75; // @[Mux.scala 27:72]
  wire [3:0] _T_107 = _T_106 | _T_76; // @[Mux.scala 27:72]
  wire [3:0] _T_108 = _T_107 | _T_77; // @[Mux.scala 27:72]
  wire [3:0] _T_109 = _T_108 | _T_78; // @[Mux.scala 27:72]
  wire [3:0] _T_110 = _T_109 | _T_79; // @[Mux.scala 27:72]
  wire [4:0] _GEN_4 = {{1'd0}, _T_110}; // @[Mux.scala 27:72]
  wire [4:0] _T_111 = _GEN_4 | _T_80; // @[Mux.scala 27:72]
  wire [4:0] _T_112 = _T_111 | _T_81; // @[Mux.scala 27:72]
  wire [4:0] _T_113 = _T_112 | _T_82; // @[Mux.scala 27:72]
  wire [4:0] _T_114 = _T_113 | _T_83; // @[Mux.scala 27:72]
  wire [4:0] _T_115 = _T_114 | _T_84; // @[Mux.scala 27:72]
  wire [4:0] _T_116 = _T_115 | _T_85; // @[Mux.scala 27:72]
  wire [4:0] _T_117 = _T_116 | _T_86; // @[Mux.scala 27:72]
  wire [4:0] _T_118 = _T_117 | _T_87; // @[Mux.scala 27:72]
  wire [4:0] _T_119 = _T_118 | _T_88; // @[Mux.scala 27:72]
  wire [4:0] _T_120 = _T_119 | _T_89; // @[Mux.scala 27:72]
  wire [4:0] _T_121 = _T_120 | _T_90; // @[Mux.scala 27:72]
  wire [4:0] _T_122 = _T_121 | _T_91; // @[Mux.scala 27:72]
  wire [4:0] _T_123 = _T_122 | _T_92; // @[Mux.scala 27:72]
  wire [4:0] _T_124 = _T_123 | _T_93; // @[Mux.scala 27:72]
  wire [4:0] _T_125 = _T_124 | _T_94; // @[Mux.scala 27:72]
  wire [4:0] cls_zeros = _T_125 | _T_95; // @[Mux.scala 27:72]
  wire  _T_128 = io_operand == 33'hffffffff; // @[exu_div_ctl.scala 513:19]
  wire  _T_136 = io_operand[31:29] == 3'h6; // @[exu_div_ctl.scala 514:76]
  wire  _T_141 = io_operand[31:28] == 4'he; // @[exu_div_ctl.scala 514:76]
  wire  _T_146 = io_operand[31:27] == 5'h1e; // @[exu_div_ctl.scala 514:76]
  wire  _T_151 = io_operand[31:26] == 6'h3e; // @[exu_div_ctl.scala 514:76]
  wire  _T_156 = io_operand[31:25] == 7'h7e; // @[exu_div_ctl.scala 514:76]
  wire  _T_161 = io_operand[31:24] == 8'hfe; // @[exu_div_ctl.scala 514:76]
  wire  _T_166 = io_operand[31:23] == 9'h1fe; // @[exu_div_ctl.scala 514:76]
  wire  _T_171 = io_operand[31:22] == 10'h3fe; // @[exu_div_ctl.scala 514:76]
  wire  _T_176 = io_operand[31:21] == 11'h7fe; // @[exu_div_ctl.scala 514:76]
  wire  _T_181 = io_operand[31:20] == 12'hffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_186 = io_operand[31:19] == 13'h1ffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_191 = io_operand[31:18] == 14'h3ffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_196 = io_operand[31:17] == 15'h7ffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_201 = io_operand[31:16] == 16'hfffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_206 = io_operand[31:15] == 17'h1fffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_211 = io_operand[31:14] == 18'h3fffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_216 = io_operand[31:13] == 19'h7fffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_221 = io_operand[31:12] == 20'hffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_226 = io_operand[31:11] == 21'h1ffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_231 = io_operand[31:10] == 22'h3ffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_236 = io_operand[31:9] == 23'h7ffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_241 = io_operand[31:8] == 24'hfffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_246 = io_operand[31:7] == 25'h1fffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_251 = io_operand[31:6] == 26'h3fffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_256 = io_operand[31:5] == 27'h7fffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_261 = io_operand[31:4] == 28'hffffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_266 = io_operand[31:3] == 29'h1ffffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_271 = io_operand[31:2] == 30'h3ffffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_276 = io_operand[31:1] == 31'h7ffffffe; // @[exu_div_ctl.scala 514:76]
  wire  _T_281 = io_operand[31:0] == 32'hfffffffe; // @[exu_div_ctl.scala 514:76]
  wire [1:0] _T_285 = _T_141 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_286 = _T_146 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_287 = _T_151 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_288 = _T_156 ? 3'h5 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_289 = _T_161 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_290 = _T_166 ? 3'h7 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_291 = _T_171 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_292 = _T_176 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_293 = _T_181 ? 4'ha : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_294 = _T_186 ? 4'hb : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_295 = _T_191 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_296 = _T_196 ? 4'hd : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_297 = _T_201 ? 4'he : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_298 = _T_206 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_299 = _T_211 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_300 = _T_216 ? 5'h11 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_301 = _T_221 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_302 = _T_226 ? 5'h13 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_303 = _T_231 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_304 = _T_236 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_305 = _T_241 ? 5'h16 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_306 = _T_246 ? 5'h17 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_307 = _T_251 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_308 = _T_256 ? 5'h19 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_309 = _T_261 ? 5'h1a : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_310 = _T_266 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_311 = _T_271 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_312 = _T_276 ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_313 = _T_281 ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_5 = {{1'd0}, _T_136}; // @[Mux.scala 27:72]
  wire [1:0] _T_315 = _GEN_5 | _T_285; // @[Mux.scala 27:72]
  wire [1:0] _T_316 = _T_315 | _T_286; // @[Mux.scala 27:72]
  wire [2:0] _GEN_6 = {{1'd0}, _T_316}; // @[Mux.scala 27:72]
  wire [2:0] _T_317 = _GEN_6 | _T_287; // @[Mux.scala 27:72]
  wire [2:0] _T_318 = _T_317 | _T_288; // @[Mux.scala 27:72]
  wire [2:0] _T_319 = _T_318 | _T_289; // @[Mux.scala 27:72]
  wire [2:0] _T_320 = _T_319 | _T_290; // @[Mux.scala 27:72]
  wire [3:0] _GEN_7 = {{1'd0}, _T_320}; // @[Mux.scala 27:72]
  wire [3:0] _T_321 = _GEN_7 | _T_291; // @[Mux.scala 27:72]
  wire [3:0] _T_322 = _T_321 | _T_292; // @[Mux.scala 27:72]
  wire [3:0] _T_323 = _T_322 | _T_293; // @[Mux.scala 27:72]
  wire [3:0] _T_324 = _T_323 | _T_294; // @[Mux.scala 27:72]
  wire [3:0] _T_325 = _T_324 | _T_295; // @[Mux.scala 27:72]
  wire [3:0] _T_326 = _T_325 | _T_296; // @[Mux.scala 27:72]
  wire [3:0] _T_327 = _T_326 | _T_297; // @[Mux.scala 27:72]
  wire [3:0] _T_328 = _T_327 | _T_298; // @[Mux.scala 27:72]
  wire [4:0] _GEN_8 = {{1'd0}, _T_328}; // @[Mux.scala 27:72]
  wire [4:0] _T_329 = _GEN_8 | _T_299; // @[Mux.scala 27:72]
  wire [4:0] _T_330 = _T_329 | _T_300; // @[Mux.scala 27:72]
  wire [4:0] _T_331 = _T_330 | _T_301; // @[Mux.scala 27:72]
  wire [4:0] _T_332 = _T_331 | _T_302; // @[Mux.scala 27:72]
  wire [4:0] _T_333 = _T_332 | _T_303; // @[Mux.scala 27:72]
  wire [4:0] _T_334 = _T_333 | _T_304; // @[Mux.scala 27:72]
  wire [4:0] _T_335 = _T_334 | _T_305; // @[Mux.scala 27:72]
  wire [4:0] _T_336 = _T_335 | _T_306; // @[Mux.scala 27:72]
  wire [4:0] _T_337 = _T_336 | _T_307; // @[Mux.scala 27:72]
  wire [4:0] _T_338 = _T_337 | _T_308; // @[Mux.scala 27:72]
  wire [4:0] _T_339 = _T_338 | _T_309; // @[Mux.scala 27:72]
  wire [4:0] _T_340 = _T_339 | _T_310; // @[Mux.scala 27:72]
  wire [4:0] _T_341 = _T_340 | _T_311; // @[Mux.scala 27:72]
  wire [4:0] _T_342 = _T_341 | _T_312; // @[Mux.scala 27:72]
  wire [4:0] _T_343 = _T_342 | _T_313; // @[Mux.scala 27:72]
  wire [4:0] cls_ones = _T_128 ? 5'h1f : _T_343; // @[exu_div_ctl.scala 513:38]
  assign io_cls = io_operand[32] ? cls_ones : cls_zeros; // @[exu_div_ctl.scala 515:10]
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
module el2_exu_div_new_1bit_fullshortq(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_cancel,
  input         io_valid_in,
  input         io_signed_in,
  input         io_rem_in,
  input  [31:0] io_dividend_in,
  input  [31:0] io_divisor_in,
  output [31:0] io_data_out,
  output        io_valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] a_enc_io_operand; // @[exu_div_ctl.scala 429:21]
  wire [4:0] a_enc_io_cls; // @[exu_div_ctl.scala 429:21]
  wire [32:0] b_enc_io_operand; // @[exu_div_ctl.scala 432:21]
  wire [4:0] b_enc_io_cls; // @[exu_div_ctl.scala 432:21]
  wire  rvclkhdr_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 390:23]
  reg [2:0] control_ff; // @[Reg.scala 27:20]
  wire  dividend_sign_ff = control_ff[2]; // @[exu_div_ctl.scala 343:40]
  wire  divisor_sign_ff = control_ff[1]; // @[exu_div_ctl.scala 344:40]
  wire  rem_ff = control_ff[0]; // @[exu_div_ctl.scala 345:40]
  reg [32:0] b_ff; // @[Reg.scala 27:20]
  wire  _T_1 = b_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 346:54]
  reg  valid_ff; // @[Reg.scala 27:20]
  wire  by_zero_case = valid_ff & _T_1; // @[exu_div_ctl.scala 346:40]
  reg [31:0] a_ff; // @[Reg.scala 27:20]
  wire  _T_3 = a_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 347:37]
  wire  _T_5 = b_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 347:60]
  wire  _T_6 = _T_3 & _T_5; // @[exu_div_ctl.scala 347:46]
  wire  _T_7 = ~by_zero_case; // @[exu_div_ctl.scala 347:71]
  wire  _T_8 = _T_6 & _T_7; // @[exu_div_ctl.scala 347:69]
  wire  _T_9 = ~rem_ff; // @[exu_div_ctl.scala 347:87]
  wire  _T_10 = _T_8 & _T_9; // @[exu_div_ctl.scala 347:85]
  wire  _T_11 = _T_10 & valid_ff; // @[exu_div_ctl.scala 347:95]
  wire  _T_12 = ~io_cancel; // @[exu_div_ctl.scala 347:108]
  wire  _T_13 = _T_11 & _T_12; // @[exu_div_ctl.scala 347:106]
  wire  _T_15 = a_ff == 32'h0; // @[exu_div_ctl.scala 348:18]
  wire  _T_17 = _T_15 & _T_7; // @[exu_div_ctl.scala 348:27]
  wire  _T_19 = _T_17 & _T_9; // @[exu_div_ctl.scala 348:43]
  wire  _T_20 = _T_19 & valid_ff; // @[exu_div_ctl.scala 348:53]
  wire  _T_22 = _T_20 & _T_12; // @[exu_div_ctl.scala 348:64]
  wire  smallnum_case = _T_13 | _T_22; // @[exu_div_ctl.scala 347:120]
  wire  valid_ff_in = io_valid_in & _T_12; // @[exu_div_ctl.scala 349:43]
  wire  _T_24 = ~io_valid_in; // @[exu_div_ctl.scala 350:35]
  wire  _T_26 = _T_24 & dividend_sign_ff; // @[exu_div_ctl.scala 350:48]
  wire  _T_27 = io_valid_in & io_signed_in; // @[exu_div_ctl.scala 350:80]
  wire  _T_29 = _T_27 & io_dividend_in[31]; // @[exu_div_ctl.scala 350:96]
  wire  _T_30 = _T_26 | _T_29; // @[exu_div_ctl.scala 350:65]
  wire  _T_33 = _T_24 & divisor_sign_ff; // @[exu_div_ctl.scala 350:133]
  wire  _T_36 = _T_27 & io_divisor_in[31]; // @[exu_div_ctl.scala 350:181]
  wire  _T_37 = _T_33 | _T_36; // @[exu_div_ctl.scala 350:150]
  wire  _T_40 = _T_24 & rem_ff; // @[exu_div_ctl.scala 350:218]
  wire  _T_41 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 350:250]
  wire  _T_42 = _T_40 | _T_41; // @[exu_div_ctl.scala 350:235]
  wire [2:0] control_in = {_T_30,_T_37,_T_42}; // @[Cat.scala 29:58]
  reg [6:0] count_ff; // @[Reg.scala 27:20]
  wire  _T_44 = |count_ff; // @[exu_div_ctl.scala 351:42]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  running_state = _T_44 | shortq_enable_ff; // @[exu_div_ctl.scala 351:45]
  wire  _T_45 = io_valid_in | valid_ff; // @[exu_div_ctl.scala 352:43]
  wire  _T_46 = _T_45 | io_cancel; // @[exu_div_ctl.scala 352:54]
  wire  _T_47 = _T_46 | running_state; // @[exu_div_ctl.scala 352:66]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  misc_enable = _T_47 | finish_ff; // @[exu_div_ctl.scala 352:82]
  wire  _T_48 = smallnum_case | by_zero_case; // @[exu_div_ctl.scala 353:45]
  wire  _T_49 = count_ff == 7'h20; // @[exu_div_ctl.scala 353:72]
  wire  finish_raw = _T_48 | _T_49; // @[exu_div_ctl.scala 353:60]
  wire  finish = finish_raw & _T_12; // @[exu_div_ctl.scala 354:41]
  wire  _T_51 = valid_ff | running_state; // @[exu_div_ctl.scala 355:40]
  wire  _T_52 = ~finish; // @[exu_div_ctl.scala 355:59]
  wire  _T_53 = _T_51 & _T_52; // @[exu_div_ctl.scala 355:57]
  wire  _T_54 = ~finish_ff; // @[exu_div_ctl.scala 355:69]
  wire  _T_55 = _T_53 & _T_54; // @[exu_div_ctl.scala 355:67]
  wire  _T_57 = _T_55 & _T_12; // @[exu_div_ctl.scala 355:80]
  wire [6:0] _T_841 = {1'h0,1'h0,b_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_842 = {1'h0,1'h0,a_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_844 = _T_841 - _T_842; // @[exu_div_ctl.scala 437:41]
  wire [7:0] _T_847 = {{1'd0}, _T_844}; // @[exu_div_ctl.scala 437:61]
  wire [6:0] dw_shortq_raw = _T_847[6:0]; // @[exu_div_ctl.scala 437:61]
  wire [5:0] shortq = dw_shortq_raw[6] ? 6'h0 : dw_shortq_raw[5:0]; // @[exu_div_ctl.scala 438:19]
  wire  _T_852 = ~shortq[5]; // @[exu_div_ctl.scala 439:31]
  wire  _T_853 = valid_ff & _T_852; // @[exu_div_ctl.scala 439:29]
  wire  _T_855 = shortq[4:1] == 4'hf; // @[exu_div_ctl.scala 439:58]
  wire  _T_856 = ~_T_855; // @[exu_div_ctl.scala 439:44]
  wire  _T_857 = _T_853 & _T_856; // @[exu_div_ctl.scala 439:42]
  wire  shortq_enable = _T_857 & _T_12; // @[exu_div_ctl.scala 439:74]
  wire  _T_58 = ~shortq_enable; // @[exu_div_ctl.scala 355:95]
  wire  count_enable = _T_57 & _T_58; // @[exu_div_ctl.scala 355:93]
  wire [6:0] _T_60 = count_enable ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_63 = count_ff + 7'h1; // @[exu_div_ctl.scala 356:63]
  reg [4:0] shortq_shift_ff; // @[Reg.scala 27:20]
  wire [6:0] _T_64 = {2'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [6:0] _T_66 = _T_63 + _T_64; // @[exu_div_ctl.scala 356:83]
  wire [6:0] count_in = _T_60 & _T_66; // @[exu_div_ctl.scala 356:51]
  wire  a_enable = io_valid_in | running_state; // @[exu_div_ctl.scala 357:43]
  wire  _T_67 = ~shortq_enable_ff; // @[exu_div_ctl.scala 358:47]
  wire  a_shift = running_state & _T_67; // @[exu_div_ctl.scala 358:45]
  wire [31:0] _T_69 = dividend_sign_ff ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_70 = {_T_69,a_ff}; // @[Cat.scala 29:58]
  wire [94:0] _GEN_11 = {{31'd0}, _T_70}; // @[exu_div_ctl.scala 359:68]
  wire [94:0] _T_71 = _GEN_11 << shortq_shift_ff; // @[exu_div_ctl.scala 359:68]
  wire  _T_72 = dividend_sign_ff ^ divisor_sign_ff; // @[exu_div_ctl.scala 360:61]
  wire  _T_73 = ~_T_72; // @[exu_div_ctl.scala 360:42]
  wire  b_twos_comp = valid_ff & _T_73; // @[exu_div_ctl.scala 360:40]
  wire  _T_76 = ~valid_ff; // @[exu_div_ctl.scala 362:30]
  wire  _T_78 = _T_76 & _T_9; // @[exu_div_ctl.scala 362:40]
  wire  _T_80 = _T_78 & _T_72; // @[exu_div_ctl.scala 362:50]
  reg  by_zero_case_ff; // @[Reg.scala 27:20]
  wire  _T_81 = ~by_zero_case_ff; // @[exu_div_ctl.scala 362:92]
  wire  twos_comp_q_sel = _T_80 & _T_81; // @[exu_div_ctl.scala 362:90]
  wire  b_enable = io_valid_in | b_twos_comp; // @[exu_div_ctl.scala 363:43]
  wire  rq_enable = _T_45 | running_state; // @[exu_div_ctl.scala 364:54]
  wire  _T_83 = valid_ff & dividend_sign_ff; // @[exu_div_ctl.scala 365:40]
  wire  r_sign_sel = _T_83 & _T_7; // @[exu_div_ctl.scala 365:59]
  reg [31:0] r_ff; // @[Reg.scala 27:20]
  wire [32:0] _T_360 = {r_ff,a_ff[31]}; // @[Cat.scala 29:58]
  wire [32:0] adder_out = _T_360 + b_ff; // @[exu_div_ctl.scala 395:35]
  wire  _T_364 = ~adder_out[32]; // @[exu_div_ctl.scala 396:20]
  wire  _T_365 = _T_364 ^ dividend_sign_ff; // @[exu_div_ctl.scala 396:35]
  wire  _T_367 = a_ff[30:0] == 31'h0; // @[exu_div_ctl.scala 396:70]
  wire  _T_368 = adder_out == 33'h0; // @[exu_div_ctl.scala 396:92]
  wire  _T_369 = _T_367 & _T_368; // @[exu_div_ctl.scala 396:79]
  wire  quotient_set = _T_365 | _T_369; // @[exu_div_ctl.scala 396:55]
  wire  _T_85 = ~quotient_set; // @[exu_div_ctl.scala 366:47]
  wire  _T_86 = running_state & _T_85; // @[exu_div_ctl.scala 366:45]
  wire  r_restore_sel = _T_86 & _T_67; // @[exu_div_ctl.scala 366:61]
  wire  _T_88 = running_state & quotient_set; // @[exu_div_ctl.scala 367:45]
  wire  r_adder_sel = _T_88 & _T_67; // @[exu_div_ctl.scala 367:61]
  reg [31:0] q_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_91 = twos_comp_q_sel ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_92 = b_twos_comp ? b_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] twos_comp_in = _T_91 | _T_92; // @[Mux.scala 27:72]
  wire  _T_96 = |twos_comp_in[0]; // @[lib.scala 428:35]
  wire  _T_98 = ~twos_comp_in[1]; // @[lib.scala 428:40]
  wire  _T_100 = _T_96 ? _T_98 : twos_comp_in[1]; // @[lib.scala 428:23]
  wire  _T_102 = |twos_comp_in[1:0]; // @[lib.scala 428:35]
  wire  _T_104 = ~twos_comp_in[2]; // @[lib.scala 428:40]
  wire  _T_106 = _T_102 ? _T_104 : twos_comp_in[2]; // @[lib.scala 428:23]
  wire  _T_108 = |twos_comp_in[2:0]; // @[lib.scala 428:35]
  wire  _T_110 = ~twos_comp_in[3]; // @[lib.scala 428:40]
  wire  _T_112 = _T_108 ? _T_110 : twos_comp_in[3]; // @[lib.scala 428:23]
  wire  _T_114 = |twos_comp_in[3:0]; // @[lib.scala 428:35]
  wire  _T_116 = ~twos_comp_in[4]; // @[lib.scala 428:40]
  wire  _T_118 = _T_114 ? _T_116 : twos_comp_in[4]; // @[lib.scala 428:23]
  wire  _T_120 = |twos_comp_in[4:0]; // @[lib.scala 428:35]
  wire  _T_122 = ~twos_comp_in[5]; // @[lib.scala 428:40]
  wire  _T_124 = _T_120 ? _T_122 : twos_comp_in[5]; // @[lib.scala 428:23]
  wire  _T_126 = |twos_comp_in[5:0]; // @[lib.scala 428:35]
  wire  _T_128 = ~twos_comp_in[6]; // @[lib.scala 428:40]
  wire  _T_130 = _T_126 ? _T_128 : twos_comp_in[6]; // @[lib.scala 428:23]
  wire  _T_132 = |twos_comp_in[6:0]; // @[lib.scala 428:35]
  wire  _T_134 = ~twos_comp_in[7]; // @[lib.scala 428:40]
  wire  _T_136 = _T_132 ? _T_134 : twos_comp_in[7]; // @[lib.scala 428:23]
  wire  _T_138 = |twos_comp_in[7:0]; // @[lib.scala 428:35]
  wire  _T_140 = ~twos_comp_in[8]; // @[lib.scala 428:40]
  wire  _T_142 = _T_138 ? _T_140 : twos_comp_in[8]; // @[lib.scala 428:23]
  wire  _T_144 = |twos_comp_in[8:0]; // @[lib.scala 428:35]
  wire  _T_146 = ~twos_comp_in[9]; // @[lib.scala 428:40]
  wire  _T_148 = _T_144 ? _T_146 : twos_comp_in[9]; // @[lib.scala 428:23]
  wire  _T_150 = |twos_comp_in[9:0]; // @[lib.scala 428:35]
  wire  _T_152 = ~twos_comp_in[10]; // @[lib.scala 428:40]
  wire  _T_154 = _T_150 ? _T_152 : twos_comp_in[10]; // @[lib.scala 428:23]
  wire  _T_156 = |twos_comp_in[10:0]; // @[lib.scala 428:35]
  wire  _T_158 = ~twos_comp_in[11]; // @[lib.scala 428:40]
  wire  _T_160 = _T_156 ? _T_158 : twos_comp_in[11]; // @[lib.scala 428:23]
  wire  _T_162 = |twos_comp_in[11:0]; // @[lib.scala 428:35]
  wire  _T_164 = ~twos_comp_in[12]; // @[lib.scala 428:40]
  wire  _T_166 = _T_162 ? _T_164 : twos_comp_in[12]; // @[lib.scala 428:23]
  wire  _T_168 = |twos_comp_in[12:0]; // @[lib.scala 428:35]
  wire  _T_170 = ~twos_comp_in[13]; // @[lib.scala 428:40]
  wire  _T_172 = _T_168 ? _T_170 : twos_comp_in[13]; // @[lib.scala 428:23]
  wire  _T_174 = |twos_comp_in[13:0]; // @[lib.scala 428:35]
  wire  _T_176 = ~twos_comp_in[14]; // @[lib.scala 428:40]
  wire  _T_178 = _T_174 ? _T_176 : twos_comp_in[14]; // @[lib.scala 428:23]
  wire  _T_180 = |twos_comp_in[14:0]; // @[lib.scala 428:35]
  wire  _T_182 = ~twos_comp_in[15]; // @[lib.scala 428:40]
  wire  _T_184 = _T_180 ? _T_182 : twos_comp_in[15]; // @[lib.scala 428:23]
  wire  _T_186 = |twos_comp_in[15:0]; // @[lib.scala 428:35]
  wire  _T_188 = ~twos_comp_in[16]; // @[lib.scala 428:40]
  wire  _T_190 = _T_186 ? _T_188 : twos_comp_in[16]; // @[lib.scala 428:23]
  wire  _T_192 = |twos_comp_in[16:0]; // @[lib.scala 428:35]
  wire  _T_194 = ~twos_comp_in[17]; // @[lib.scala 428:40]
  wire  _T_196 = _T_192 ? _T_194 : twos_comp_in[17]; // @[lib.scala 428:23]
  wire  _T_198 = |twos_comp_in[17:0]; // @[lib.scala 428:35]
  wire  _T_200 = ~twos_comp_in[18]; // @[lib.scala 428:40]
  wire  _T_202 = _T_198 ? _T_200 : twos_comp_in[18]; // @[lib.scala 428:23]
  wire  _T_204 = |twos_comp_in[18:0]; // @[lib.scala 428:35]
  wire  _T_206 = ~twos_comp_in[19]; // @[lib.scala 428:40]
  wire  _T_208 = _T_204 ? _T_206 : twos_comp_in[19]; // @[lib.scala 428:23]
  wire  _T_210 = |twos_comp_in[19:0]; // @[lib.scala 428:35]
  wire  _T_212 = ~twos_comp_in[20]; // @[lib.scala 428:40]
  wire  _T_214 = _T_210 ? _T_212 : twos_comp_in[20]; // @[lib.scala 428:23]
  wire  _T_216 = |twos_comp_in[20:0]; // @[lib.scala 428:35]
  wire  _T_218 = ~twos_comp_in[21]; // @[lib.scala 428:40]
  wire  _T_220 = _T_216 ? _T_218 : twos_comp_in[21]; // @[lib.scala 428:23]
  wire  _T_222 = |twos_comp_in[21:0]; // @[lib.scala 428:35]
  wire  _T_224 = ~twos_comp_in[22]; // @[lib.scala 428:40]
  wire  _T_226 = _T_222 ? _T_224 : twos_comp_in[22]; // @[lib.scala 428:23]
  wire  _T_228 = |twos_comp_in[22:0]; // @[lib.scala 428:35]
  wire  _T_230 = ~twos_comp_in[23]; // @[lib.scala 428:40]
  wire  _T_232 = _T_228 ? _T_230 : twos_comp_in[23]; // @[lib.scala 428:23]
  wire  _T_234 = |twos_comp_in[23:0]; // @[lib.scala 428:35]
  wire  _T_236 = ~twos_comp_in[24]; // @[lib.scala 428:40]
  wire  _T_238 = _T_234 ? _T_236 : twos_comp_in[24]; // @[lib.scala 428:23]
  wire  _T_240 = |twos_comp_in[24:0]; // @[lib.scala 428:35]
  wire  _T_242 = ~twos_comp_in[25]; // @[lib.scala 428:40]
  wire  _T_244 = _T_240 ? _T_242 : twos_comp_in[25]; // @[lib.scala 428:23]
  wire  _T_246 = |twos_comp_in[25:0]; // @[lib.scala 428:35]
  wire  _T_248 = ~twos_comp_in[26]; // @[lib.scala 428:40]
  wire  _T_250 = _T_246 ? _T_248 : twos_comp_in[26]; // @[lib.scala 428:23]
  wire  _T_252 = |twos_comp_in[26:0]; // @[lib.scala 428:35]
  wire  _T_254 = ~twos_comp_in[27]; // @[lib.scala 428:40]
  wire  _T_256 = _T_252 ? _T_254 : twos_comp_in[27]; // @[lib.scala 428:23]
  wire  _T_258 = |twos_comp_in[27:0]; // @[lib.scala 428:35]
  wire  _T_260 = ~twos_comp_in[28]; // @[lib.scala 428:40]
  wire  _T_262 = _T_258 ? _T_260 : twos_comp_in[28]; // @[lib.scala 428:23]
  wire  _T_264 = |twos_comp_in[28:0]; // @[lib.scala 428:35]
  wire  _T_266 = ~twos_comp_in[29]; // @[lib.scala 428:40]
  wire  _T_268 = _T_264 ? _T_266 : twos_comp_in[29]; // @[lib.scala 428:23]
  wire  _T_270 = |twos_comp_in[29:0]; // @[lib.scala 428:35]
  wire  _T_272 = ~twos_comp_in[30]; // @[lib.scala 428:40]
  wire  _T_274 = _T_270 ? _T_272 : twos_comp_in[30]; // @[lib.scala 428:23]
  wire  _T_276 = |twos_comp_in[30:0]; // @[lib.scala 428:35]
  wire  _T_278 = ~twos_comp_in[31]; // @[lib.scala 428:40]
  wire  _T_280 = _T_276 ? _T_278 : twos_comp_in[31]; // @[lib.scala 428:23]
  wire [6:0] _T_286 = {_T_136,_T_130,_T_124,_T_118,_T_112,_T_106,_T_100}; // @[lib.scala 430:14]
  wire [14:0] _T_294 = {_T_184,_T_178,_T_172,_T_166,_T_160,_T_154,_T_148,_T_142,_T_286}; // @[lib.scala 430:14]
  wire [7:0] _T_301 = {_T_232,_T_226,_T_220,_T_214,_T_208,_T_202,_T_196,_T_190}; // @[lib.scala 430:14]
  wire [30:0] _T_310 = {_T_280,_T_274,_T_268,_T_262,_T_256,_T_250,_T_244,_T_238,_T_301,_T_294}; // @[lib.scala 430:14]
  wire [31:0] twos_comp_out = {_T_310,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire  _T_312 = ~a_shift; // @[exu_div_ctl.scala 375:6]
  wire  _T_314 = _T_312 & _T_67; // @[exu_div_ctl.scala 375:15]
  wire [31:0] _T_317 = {a_ff[30:0],1'h0}; // @[Cat.scala 29:58]
  wire [63:0] ar_shifted = _T_71[63:0]; // @[exu_div_ctl.scala 359:28]
  wire [31:0] _T_319 = _T_314 ? io_dividend_in : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_320 = a_shift ? _T_317 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_321 = shortq_enable_ff ? ar_shifted[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_322 = _T_319 | _T_320; // @[Mux.scala 27:72]
  wire [31:0] a_in = _T_322 | _T_321; // @[Mux.scala 27:72]
  wire  _T_324 = ~b_twos_comp; // @[exu_div_ctl.scala 380:5]
  wire  _T_326 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 380:63]
  wire [32:0] _T_328 = {_T_326,io_divisor_in}; // @[Cat.scala 29:58]
  wire  _T_329 = ~divisor_sign_ff; // @[exu_div_ctl.scala 381:50]
  wire [32:0] _T_331 = {_T_329,_T_310,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_332 = _T_324 ? _T_328 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_333 = b_twos_comp ? _T_331 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] b_in = _T_332 | _T_333; // @[Mux.scala 27:72]
  wire [31:0] _T_337 = {r_ff[30:0],a_ff[31]}; // @[Cat.scala 29:58]
  wire [31:0] _T_340 = r_sign_sel ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_341 = r_restore_sel ? _T_337 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_342 = r_adder_sel ? adder_out[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_343 = shortq_enable_ff ? ar_shifted[63:32] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_344 = by_zero_case ? a_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_345 = _T_340 | _T_341; // @[Mux.scala 27:72]
  wire [31:0] _T_346 = _T_345 | _T_342; // @[Mux.scala 27:72]
  wire [31:0] _T_347 = _T_346 | _T_343; // @[Mux.scala 27:72]
  wire [31:0] r_in = _T_347 | _T_344; // @[Mux.scala 27:72]
  wire [31:0] _T_351 = {q_ff[30:0],quotient_set}; // @[Cat.scala 29:58]
  wire  _T_385 = ~b_ff[3]; // @[exu_div_ctl.scala 405:70]
  wire  _T_387 = ~b_ff[2]; // @[exu_div_ctl.scala 405:70]
  wire  _T_390 = _T_385 & _T_387; // @[exu_div_ctl.scala 405:95]
  wire  _T_389 = ~b_ff[1]; // @[exu_div_ctl.scala 405:70]
  wire  _T_391 = _T_390 & _T_389; // @[exu_div_ctl.scala 405:95]
  wire  _T_392 = a_ff[3] & _T_391; // @[exu_div_ctl.scala 406:11]
  wire  _T_399 = a_ff[3] & _T_390; // @[exu_div_ctl.scala 406:11]
  wire  _T_401 = ~b_ff[0]; // @[exu_div_ctl.scala 412:33]
  wire  _T_402 = _T_399 & _T_401; // @[exu_div_ctl.scala 412:31]
  wire  _T_412 = a_ff[2] & _T_391; // @[exu_div_ctl.scala 406:11]
  wire  _T_413 = _T_402 | _T_412; // @[exu_div_ctl.scala 412:42]
  wire  _T_416 = a_ff[3] & a_ff[2]; // @[exu_div_ctl.scala 404:95]
  wire  _T_422 = _T_416 & _T_390; // @[exu_div_ctl.scala 406:11]
  wire  _T_423 = _T_413 | _T_422; // @[exu_div_ctl.scala 412:75]
  wire  _T_430 = a_ff[2] & _T_390; // @[exu_div_ctl.scala 406:11]
  wire  _T_433 = _T_430 & _T_401; // @[exu_div_ctl.scala 414:31]
  wire  _T_443 = a_ff[1] & _T_391; // @[exu_div_ctl.scala 406:11]
  wire  _T_444 = _T_433 | _T_443; // @[exu_div_ctl.scala 414:42]
  wire  _T_450 = _T_385 & _T_389; // @[exu_div_ctl.scala 405:95]
  wire  _T_451 = a_ff[3] & _T_450; // @[exu_div_ctl.scala 406:11]
  wire  _T_454 = _T_451 & _T_401; // @[exu_div_ctl.scala 414:106]
  wire  _T_455 = _T_444 | _T_454; // @[exu_div_ctl.scala 414:78]
  wire  _T_458 = ~a_ff[2]; // @[exu_div_ctl.scala 404:70]
  wire  _T_459 = a_ff[3] & _T_458; // @[exu_div_ctl.scala 404:95]
  wire  _T_467 = _T_390 & b_ff[1]; // @[exu_div_ctl.scala 405:95]
  wire  _T_468 = _T_467 & b_ff[0]; // @[exu_div_ctl.scala 405:95]
  wire  _T_469 = _T_459 & _T_468; // @[exu_div_ctl.scala 406:11]
  wire  _T_470 = _T_455 | _T_469; // @[exu_div_ctl.scala 414:117]
  wire  _T_472 = ~a_ff[3]; // @[exu_div_ctl.scala 404:70]
  wire  _T_475 = _T_472 & a_ff[2]; // @[exu_div_ctl.scala 404:95]
  wire  _T_476 = _T_475 & a_ff[1]; // @[exu_div_ctl.scala 404:95]
  wire  _T_482 = _T_476 & _T_390; // @[exu_div_ctl.scala 406:11]
  wire  _T_483 = _T_470 | _T_482; // @[exu_div_ctl.scala 415:44]
  wire  _T_489 = _T_416 & _T_385; // @[exu_div_ctl.scala 406:11]
  wire  _T_492 = _T_489 & _T_401; // @[exu_div_ctl.scala 415:107]
  wire  _T_493 = _T_483 | _T_492; // @[exu_div_ctl.scala 415:80]
  wire  _T_502 = _T_385 & b_ff[2]; // @[exu_div_ctl.scala 405:95]
  wire  _T_503 = _T_502 & _T_389; // @[exu_div_ctl.scala 405:95]
  wire  _T_504 = _T_416 & _T_503; // @[exu_div_ctl.scala 406:11]
  wire  _T_505 = _T_493 | _T_504; // @[exu_div_ctl.scala 415:119]
  wire  _T_508 = a_ff[3] & a_ff[1]; // @[exu_div_ctl.scala 404:95]
  wire  _T_514 = _T_508 & _T_450; // @[exu_div_ctl.scala 406:11]
  wire  _T_515 = _T_505 | _T_514; // @[exu_div_ctl.scala 416:44]
  wire  _T_520 = _T_416 & a_ff[1]; // @[exu_div_ctl.scala 404:95]
  wire  _T_525 = _T_520 & _T_502; // @[exu_div_ctl.scala 406:11]
  wire  _T_526 = _T_515 | _T_525; // @[exu_div_ctl.scala 416:79]
  wire  _T_530 = a_ff[2] & a_ff[1]; // @[exu_div_ctl.scala 404:95]
  wire  _T_531 = _T_530 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_537 = _T_531 & _T_450; // @[exu_div_ctl.scala 406:11]
  wire  _T_543 = _T_459 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_548 = _T_385 & b_ff[1]; // @[exu_div_ctl.scala 405:95]
  wire  _T_549 = _T_548 & b_ff[0]; // @[exu_div_ctl.scala 405:95]
  wire  _T_550 = _T_543 & _T_549; // @[exu_div_ctl.scala 406:11]
  wire  _T_551 = _T_537 | _T_550; // @[exu_div_ctl.scala 418:45]
  wire  _T_558 = a_ff[2] & _T_450; // @[exu_div_ctl.scala 406:11]
  wire  _T_561 = _T_558 & _T_401; // @[exu_div_ctl.scala 418:114]
  wire  _T_562 = _T_551 | _T_561; // @[exu_div_ctl.scala 418:86]
  wire  _T_569 = a_ff[1] & _T_390; // @[exu_div_ctl.scala 406:11]
  wire  _T_572 = _T_569 & _T_401; // @[exu_div_ctl.scala 419:33]
  wire  _T_573 = _T_562 | _T_572; // @[exu_div_ctl.scala 418:129]
  wire  _T_583 = a_ff[0] & _T_391; // @[exu_div_ctl.scala 406:11]
  wire  _T_584 = _T_573 | _T_583; // @[exu_div_ctl.scala 419:47]
  wire  _T_589 = ~a_ff[1]; // @[exu_div_ctl.scala 404:70]
  wire  _T_591 = _T_475 & _T_589; // @[exu_div_ctl.scala 404:95]
  wire  _T_601 = _T_591 & _T_468; // @[exu_div_ctl.scala 406:11]
  wire  _T_602 = _T_584 | _T_601; // @[exu_div_ctl.scala 419:88]
  wire  _T_611 = _T_476 & _T_385; // @[exu_div_ctl.scala 406:11]
  wire  _T_614 = _T_611 & _T_401; // @[exu_div_ctl.scala 420:36]
  wire  _T_615 = _T_602 | _T_614; // @[exu_div_ctl.scala 419:131]
  wire  _T_621 = _T_387 & _T_389; // @[exu_div_ctl.scala 405:95]
  wire  _T_622 = a_ff[3] & _T_621; // @[exu_div_ctl.scala 406:11]
  wire  _T_625 = _T_622 & _T_401; // @[exu_div_ctl.scala 420:76]
  wire  _T_626 = _T_615 | _T_625; // @[exu_div_ctl.scala 420:47]
  wire  _T_636 = _T_502 & b_ff[1]; // @[exu_div_ctl.scala 405:95]
  wire  _T_637 = _T_459 & _T_636; // @[exu_div_ctl.scala 406:11]
  wire  _T_638 = _T_626 | _T_637; // @[exu_div_ctl.scala 420:88]
  wire  _T_652 = _T_476 & _T_503; // @[exu_div_ctl.scala 406:11]
  wire  _T_653 = _T_638 | _T_652; // @[exu_div_ctl.scala 420:131]
  wire  _T_659 = _T_475 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_665 = _T_659 & _T_450; // @[exu_div_ctl.scala 406:11]
  wire  _T_666 = _T_653 | _T_665; // @[exu_div_ctl.scala 421:47]
  wire  _T_673 = _T_459 & _T_589; // @[exu_div_ctl.scala 404:95]
  wire  _T_679 = _T_502 & b_ff[0]; // @[exu_div_ctl.scala 405:95]
  wire  _T_680 = _T_673 & _T_679; // @[exu_div_ctl.scala 406:11]
  wire  _T_681 = _T_666 | _T_680; // @[exu_div_ctl.scala 421:88]
  wire  _T_686 = _T_458 & a_ff[1]; // @[exu_div_ctl.scala 404:95]
  wire  _T_687 = _T_686 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_693 = _T_687 & _T_390; // @[exu_div_ctl.scala 406:11]
  wire  _T_694 = _T_681 | _T_693; // @[exu_div_ctl.scala 421:131]
  wire  _T_700 = _T_416 & _T_389; // @[exu_div_ctl.scala 406:11]
  wire  _T_703 = _T_700 & _T_401; // @[exu_div_ctl.scala 422:75]
  wire  _T_704 = _T_694 | _T_703; // @[exu_div_ctl.scala 422:47]
  wire  _T_712 = _T_476 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_717 = _T_712 & _T_502; // @[exu_div_ctl.scala 406:11]
  wire  _T_718 = _T_704 | _T_717; // @[exu_div_ctl.scala 422:88]
  wire  _T_725 = b_ff[3] & _T_387; // @[exu_div_ctl.scala 405:95]
  wire  _T_726 = _T_416 & _T_725; // @[exu_div_ctl.scala 406:11]
  wire  _T_727 = _T_718 | _T_726; // @[exu_div_ctl.scala 422:131]
  wire  _T_737 = _T_725 & _T_389; // @[exu_div_ctl.scala 405:95]
  wire  _T_738 = _T_508 & _T_737; // @[exu_div_ctl.scala 406:11]
  wire  _T_739 = _T_727 | _T_738; // @[exu_div_ctl.scala 423:47]
  wire  _T_742 = a_ff[3] & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_748 = _T_742 & _T_621; // @[exu_div_ctl.scala 406:11]
  wire  _T_749 = _T_739 | _T_748; // @[exu_div_ctl.scala 423:88]
  wire  _T_753 = a_ff[3] & _T_589; // @[exu_div_ctl.scala 404:95]
  wire  _T_761 = _T_636 & b_ff[0]; // @[exu_div_ctl.scala 405:95]
  wire  _T_762 = _T_753 & _T_761; // @[exu_div_ctl.scala 406:11]
  wire  _T_763 = _T_749 | _T_762; // @[exu_div_ctl.scala 423:131]
  wire  _T_770 = _T_520 & b_ff[3]; // @[exu_div_ctl.scala 406:11]
  wire  _T_773 = _T_770 & _T_401; // @[exu_div_ctl.scala 424:77]
  wire  _T_774 = _T_763 | _T_773; // @[exu_div_ctl.scala 424:47]
  wire  _T_783 = b_ff[3] & _T_389; // @[exu_div_ctl.scala 405:95]
  wire  _T_784 = _T_520 & _T_783; // @[exu_div_ctl.scala 406:11]
  wire  _T_785 = _T_774 | _T_784; // @[exu_div_ctl.scala 424:88]
  wire  _T_790 = _T_416 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_795 = _T_790 & _T_783; // @[exu_div_ctl.scala 406:11]
  wire  _T_796 = _T_785 | _T_795; // @[exu_div_ctl.scala 424:131]
  wire  _T_802 = _T_459 & a_ff[1]; // @[exu_div_ctl.scala 404:95]
  wire  _T_807 = _T_802 & _T_548; // @[exu_div_ctl.scala 406:11]
  wire  _T_808 = _T_796 | _T_807; // @[exu_div_ctl.scala 425:47]
  wire  _T_813 = _T_508 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_816 = _T_813 & _T_387; // @[exu_div_ctl.scala 406:11]
  wire  _T_817 = _T_808 | _T_816; // @[exu_div_ctl.scala 425:88]
  wire  _T_824 = _T_520 & a_ff[0]; // @[exu_div_ctl.scala 404:95]
  wire  _T_826 = _T_824 & b_ff[3]; // @[exu_div_ctl.scala 406:11]
  wire  _T_827 = _T_817 | _T_826; // @[exu_div_ctl.scala 425:131]
  wire  _T_833 = _T_508 & _T_387; // @[exu_div_ctl.scala 406:11]
  wire  _T_836 = _T_833 & _T_401; // @[exu_div_ctl.scala 426:74]
  wire  _T_837 = _T_827 | _T_836; // @[exu_div_ctl.scala 426:47]
  wire [31:0] _T_352 = {28'h0,_T_392,_T_423,_T_526,_T_837}; // @[Cat.scala 29:58]
  wire [31:0] _T_354 = _T_76 ? _T_351 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_355 = smallnum_case ? _T_352 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_356 = by_zero_case ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_357 = _T_354 | _T_355; // @[Mux.scala 27:72]
  wire [31:0] q_in = _T_357 | _T_356; // @[Mux.scala 27:72]
  wire  _T_374 = ~twos_comp_q_sel; // @[exu_div_ctl.scala 399:16]
  wire  _T_375 = _T_9 & _T_374; // @[exu_div_ctl.scala 399:14]
  wire [31:0] _T_377 = _T_375 ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_378 = rem_ff ? r_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_379 = twos_comp_q_sel ? twos_comp_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_380 = _T_377 | _T_378; // @[Mux.scala 27:72]
  wire [4:0] _T_863 = 5'h1f - shortq[4:0]; // @[exu_div_ctl.scala 440:57]
  el2_exu_div_cls a_enc ( // @[exu_div_ctl.scala 429:21]
    .io_operand(a_enc_io_operand),
    .io_cls(a_enc_io_cls)
  );
  el2_exu_div_cls b_enc ( // @[exu_div_ctl.scala 432:21]
    .io_operand(b_enc_io_operand),
    .io_cls(b_enc_io_cls)
  );
  rvclkhdr rvclkhdr ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  assign io_data_out = _T_380 | _T_379; // @[exu_div_ctl.scala 398:15]
  assign io_valid_out = finish_ff & _T_12; // @[exu_div_ctl.scala 397:16]
  assign a_enc_io_operand = {dividend_sign_ff,a_ff}; // @[exu_div_ctl.scala 430:20]
  assign b_enc_io_operand = b_ff; // @[exu_div_ctl.scala 433:20]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_1_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_2_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_3_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_4_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_5_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_6_io_en = _T_47 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_7_io_en = io_valid_in | running_state; // @[lib.scala 393:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_8_io_en = io_valid_in | b_twos_comp; // @[lib.scala 393:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_9_io_en = _T_45 | running_state; // @[lib.scala 393:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_10_io_en = _T_45 | running_state; // @[lib.scala 393:17]
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
  control_ff = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  b_ff = _RAND_1[32:0];
  _RAND_2 = {1{`RANDOM}};
  valid_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  a_ff = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  count_ff = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  shortq_enable_ff = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  finish_ff = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  shortq_shift_ff = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  by_zero_case_ff = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  r_ff = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  q_ff = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    control_ff = 3'h0;
  end
  if (reset) begin
    b_ff = 33'h0;
  end
  if (reset) begin
    valid_ff = 1'h0;
  end
  if (reset) begin
    a_ff = 32'h0;
  end
  if (reset) begin
    count_ff = 7'h0;
  end
  if (reset) begin
    shortq_enable_ff = 1'h0;
  end
  if (reset) begin
    finish_ff = 1'h0;
  end
  if (reset) begin
    shortq_shift_ff = 5'h0;
  end
  if (reset) begin
    by_zero_case_ff = 1'h0;
  end
  if (reset) begin
    r_ff = 32'h0;
  end
  if (reset) begin
    q_ff = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      control_ff <= 3'h0;
    end else if (misc_enable) begin
      control_ff <= control_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      b_ff <= 33'h0;
    end else if (b_enable) begin
      b_ff <= b_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_ff <= 1'h0;
    end else if (misc_enable) begin
      valid_ff <= valid_ff_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      a_ff <= 32'h0;
    end else if (a_enable) begin
      a_ff <= a_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      count_ff <= 7'h0;
    end else if (misc_enable) begin
      count_ff <= count_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      shortq_enable_ff <= 1'h0;
    end else if (misc_enable) begin
      shortq_enable_ff <= shortq_enable;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      finish_ff <= 1'h0;
    end else if (misc_enable) begin
      finish_ff <= finish;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      shortq_shift_ff <= 5'h0;
    end else if (misc_enable) begin
      if (_T_58) begin
        shortq_shift_ff <= 5'h0;
      end else begin
        shortq_shift_ff <= _T_863;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      by_zero_case_ff <= 1'h0;
    end else if (misc_enable) begin
      by_zero_case_ff <= by_zero_case;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_ff <= 32'h0;
    end else if (rq_enable) begin
      r_ff <= r_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      q_ff <= 32'h0;
    end else if (rq_enable) begin
      q_ff <= q_in;
    end
  end
endmodule
