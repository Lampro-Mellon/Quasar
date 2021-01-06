module exu_div_cls(
  input  [32:0] io_operand,
  output [4:0]  io_cls
);
  wire  _T_3 = io_operand[31:30] == 2'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_5 = io_operand[31:29] == 3'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_7 = io_operand[31:28] == 4'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_9 = io_operand[31:27] == 5'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_11 = io_operand[31:26] == 6'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_13 = io_operand[31:25] == 7'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_15 = io_operand[31:24] == 8'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_17 = io_operand[31:23] == 9'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_19 = io_operand[31:22] == 10'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_21 = io_operand[31:21] == 11'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_23 = io_operand[31:20] == 12'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_25 = io_operand[31:19] == 13'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_27 = io_operand[31:18] == 14'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_29 = io_operand[31:17] == 15'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_31 = io_operand[31:16] == 16'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_33 = io_operand[31:15] == 17'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_35 = io_operand[31:14] == 18'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_37 = io_operand[31:13] == 19'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_39 = io_operand[31:12] == 20'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_41 = io_operand[31:11] == 21'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_43 = io_operand[31:10] == 22'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_45 = io_operand[31:9] == 23'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_47 = io_operand[31:8] == 24'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_49 = io_operand[31:7] == 25'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_51 = io_operand[31:6] == 26'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_53 = io_operand[31:5] == 27'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_55 = io_operand[31:4] == 28'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_57 = io_operand[31:3] == 29'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_59 = io_operand[31:2] == 30'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_61 = io_operand[31:1] == 31'h1; // @[exu_div_ctl.scala 783:63]
  wire  _T_63 = io_operand[31:0] == 32'h1; // @[exu_div_ctl.scala 783:63]
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
  wire  _T_129 = io_operand[31:0] == 32'hffffffff; // @[exu_div_ctl.scala 785:25]
  wire  _T_137 = io_operand[31:29] == 3'h6; // @[exu_div_ctl.scala 786:76]
  wire  _T_142 = io_operand[31:28] == 4'he; // @[exu_div_ctl.scala 786:76]
  wire  _T_147 = io_operand[31:27] == 5'h1e; // @[exu_div_ctl.scala 786:76]
  wire  _T_152 = io_operand[31:26] == 6'h3e; // @[exu_div_ctl.scala 786:76]
  wire  _T_157 = io_operand[31:25] == 7'h7e; // @[exu_div_ctl.scala 786:76]
  wire  _T_162 = io_operand[31:24] == 8'hfe; // @[exu_div_ctl.scala 786:76]
  wire  _T_167 = io_operand[31:23] == 9'h1fe; // @[exu_div_ctl.scala 786:76]
  wire  _T_172 = io_operand[31:22] == 10'h3fe; // @[exu_div_ctl.scala 786:76]
  wire  _T_177 = io_operand[31:21] == 11'h7fe; // @[exu_div_ctl.scala 786:76]
  wire  _T_182 = io_operand[31:20] == 12'hffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_187 = io_operand[31:19] == 13'h1ffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_192 = io_operand[31:18] == 14'h3ffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_197 = io_operand[31:17] == 15'h7ffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_202 = io_operand[31:16] == 16'hfffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_207 = io_operand[31:15] == 17'h1fffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_212 = io_operand[31:14] == 18'h3fffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_217 = io_operand[31:13] == 19'h7fffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_222 = io_operand[31:12] == 20'hffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_227 = io_operand[31:11] == 21'h1ffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_232 = io_operand[31:10] == 22'h3ffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_237 = io_operand[31:9] == 23'h7ffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_242 = io_operand[31:8] == 24'hfffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_247 = io_operand[31:7] == 25'h1fffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_252 = io_operand[31:6] == 26'h3fffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_257 = io_operand[31:5] == 27'h7fffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_262 = io_operand[31:4] == 28'hffffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_267 = io_operand[31:3] == 29'h1ffffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_272 = io_operand[31:2] == 30'h3ffffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_277 = io_operand[31:1] == 31'h7ffffffe; // @[exu_div_ctl.scala 786:76]
  wire  _T_282 = io_operand[31:0] == 32'hfffffffe; // @[exu_div_ctl.scala 786:76]
  wire [1:0] _T_286 = _T_142 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_287 = _T_147 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_288 = _T_152 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_289 = _T_157 ? 3'h5 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_290 = _T_162 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_291 = _T_167 ? 3'h7 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_292 = _T_172 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_293 = _T_177 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_294 = _T_182 ? 4'ha : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_295 = _T_187 ? 4'hb : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_296 = _T_192 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_297 = _T_197 ? 4'hd : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_298 = _T_202 ? 4'he : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_299 = _T_207 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_300 = _T_212 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_301 = _T_217 ? 5'h11 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_302 = _T_222 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_303 = _T_227 ? 5'h13 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_304 = _T_232 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_305 = _T_237 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_306 = _T_242 ? 5'h16 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_307 = _T_247 ? 5'h17 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_308 = _T_252 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_309 = _T_257 ? 5'h19 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_310 = _T_262 ? 5'h1a : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_311 = _T_267 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_312 = _T_272 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_313 = _T_277 ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_314 = _T_282 ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_5 = {{1'd0}, _T_137}; // @[Mux.scala 27:72]
  wire [1:0] _T_316 = _GEN_5 | _T_286; // @[Mux.scala 27:72]
  wire [1:0] _T_317 = _T_316 | _T_287; // @[Mux.scala 27:72]
  wire [2:0] _GEN_6 = {{1'd0}, _T_317}; // @[Mux.scala 27:72]
  wire [2:0] _T_318 = _GEN_6 | _T_288; // @[Mux.scala 27:72]
  wire [2:0] _T_319 = _T_318 | _T_289; // @[Mux.scala 27:72]
  wire [2:0] _T_320 = _T_319 | _T_290; // @[Mux.scala 27:72]
  wire [2:0] _T_321 = _T_320 | _T_291; // @[Mux.scala 27:72]
  wire [3:0] _GEN_7 = {{1'd0}, _T_321}; // @[Mux.scala 27:72]
  wire [3:0] _T_322 = _GEN_7 | _T_292; // @[Mux.scala 27:72]
  wire [3:0] _T_323 = _T_322 | _T_293; // @[Mux.scala 27:72]
  wire [3:0] _T_324 = _T_323 | _T_294; // @[Mux.scala 27:72]
  wire [3:0] _T_325 = _T_324 | _T_295; // @[Mux.scala 27:72]
  wire [3:0] _T_326 = _T_325 | _T_296; // @[Mux.scala 27:72]
  wire [3:0] _T_327 = _T_326 | _T_297; // @[Mux.scala 27:72]
  wire [3:0] _T_328 = _T_327 | _T_298; // @[Mux.scala 27:72]
  wire [3:0] _T_329 = _T_328 | _T_299; // @[Mux.scala 27:72]
  wire [4:0] _GEN_8 = {{1'd0}, _T_329}; // @[Mux.scala 27:72]
  wire [4:0] _T_330 = _GEN_8 | _T_300; // @[Mux.scala 27:72]
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
  wire [4:0] _T_344 = _T_343 | _T_314; // @[Mux.scala 27:72]
  wire [4:0] cls_ones = _T_129 ? 5'h1f : _T_344; // @[exu_div_ctl.scala 785:44]
  assign io_cls = io_operand[32] ? cls_ones : cls_zeros; // @[exu_div_ctl.scala 787:10]
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
module exu_div_new_3bit_fullshortq(
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
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] a_enc_io_operand; // @[exu_div_ctl.scala 727:21]
  wire [4:0] a_enc_io_cls; // @[exu_div_ctl.scala 727:21]
  wire [32:0] b_enc_io_operand; // @[exu_div_ctl.scala 730:20]
  wire [4:0] b_enc_io_cls; // @[exu_div_ctl.scala 730:20]
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
  wire  _T = ~io_cancel; // @[exu_div_ctl.scala 612:35]
  wire  valid_ff_in = io_valid_in & _T; // @[exu_div_ctl.scala 612:33]
  wire  _T_1 = ~io_valid_in; // @[exu_div_ctl.scala 613:35]
  reg [2:0] control_ff; // @[Reg.scala 27:20]
  wire  _T_3 = _T_1 & control_ff[2]; // @[exu_div_ctl.scala 613:48]
  wire  _T_4 = io_valid_in & io_signed_in; // @[exu_div_ctl.scala 613:80]
  wire  _T_6 = _T_4 & io_dividend_in[31]; // @[exu_div_ctl.scala 613:96]
  wire  _T_7 = _T_3 | _T_6; // @[exu_div_ctl.scala 613:65]
  wire  _T_10 = _T_1 & control_ff[1]; // @[exu_div_ctl.scala 613:133]
  wire  _T_13 = _T_4 & io_divisor_in[31]; // @[exu_div_ctl.scala 613:181]
  wire  _T_14 = _T_10 | _T_13; // @[exu_div_ctl.scala 613:150]
  wire  _T_17 = _T_1 & control_ff[0]; // @[exu_div_ctl.scala 613:218]
  wire  _T_18 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 613:250]
  wire  _T_19 = _T_17 | _T_18; // @[exu_div_ctl.scala 613:235]
  wire [2:0] control_in = {_T_7,_T_14,_T_19}; // @[Cat.scala 29:58]
  reg [32:0] b_ff1; // @[Reg.scala 27:20]
  wire [36:0] b_ff = {b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1}; // @[Cat.scala 29:58]
  wire  _T_22 = b_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 617:54]
  reg  valid_ff; // @[Reg.scala 27:20]
  wire  by_zero_case = valid_ff & _T_22; // @[exu_div_ctl.scala 617:40]
  reg [32:0] a_ff; // @[Reg.scala 27:20]
  wire  _T_24 = a_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 619:37]
  wire  _T_26 = b_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 619:60]
  wire  _T_27 = _T_24 & _T_26; // @[exu_div_ctl.scala 619:46]
  wire  _T_28 = ~by_zero_case; // @[exu_div_ctl.scala 619:71]
  wire  _T_29 = _T_27 & _T_28; // @[exu_div_ctl.scala 619:69]
  wire  _T_30 = ~control_ff[0]; // @[exu_div_ctl.scala 619:87]
  wire  _T_31 = _T_29 & _T_30; // @[exu_div_ctl.scala 619:85]
  wire  _T_32 = _T_31 & valid_ff; // @[exu_div_ctl.scala 619:95]
  wire  _T_34 = _T_32 & _T; // @[exu_div_ctl.scala 619:106]
  wire  _T_36 = a_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 620:18]
  wire  _T_38 = _T_36 & _T_28; // @[exu_div_ctl.scala 620:27]
  wire  _T_40 = _T_38 & _T_30; // @[exu_div_ctl.scala 620:43]
  wire  _T_41 = _T_40 & valid_ff; // @[exu_div_ctl.scala 620:53]
  wire  _T_43 = _T_41 & _T; // @[exu_div_ctl.scala 620:64]
  wire  smallnum_case = _T_34 | _T_43; // @[exu_div_ctl.scala 619:120]
  reg [6:0] count_ff; // @[Reg.scala 27:20]
  wire  _T_44 = |count_ff; // @[exu_div_ctl.scala 621:42]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  running_state = _T_44 | shortq_enable_ff; // @[exu_div_ctl.scala 621:45]
  wire  _T_45 = io_valid_in | valid_ff; // @[exu_div_ctl.scala 622:43]
  wire  _T_46 = _T_45 | io_cancel; // @[exu_div_ctl.scala 622:54]
  wire  _T_47 = _T_46 | running_state; // @[exu_div_ctl.scala 622:66]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  misc_enable = _T_47 | finish_ff; // @[exu_div_ctl.scala 622:82]
  wire  _T_48 = smallnum_case | by_zero_case; // @[exu_div_ctl.scala 623:45]
  wire  _T_49 = count_ff == 7'h21; // @[exu_div_ctl.scala 623:72]
  wire  finish_raw = _T_48 | _T_49; // @[exu_div_ctl.scala 623:60]
  wire  finish = finish_raw & _T; // @[exu_div_ctl.scala 624:41]
  wire  _T_51 = valid_ff | running_state; // @[exu_div_ctl.scala 625:40]
  wire  _T_52 = ~finish; // @[exu_div_ctl.scala 625:59]
  wire  _T_53 = _T_51 & _T_52; // @[exu_div_ctl.scala 625:57]
  wire  _T_54 = ~finish_ff; // @[exu_div_ctl.scala 625:69]
  wire  _T_55 = _T_53 & _T_54; // @[exu_div_ctl.scala 625:67]
  wire  _T_57 = _T_55 & _T; // @[exu_div_ctl.scala 625:80]
  wire [6:0] _T_1047 = {1'h0,1'h0,b_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1048 = {1'h0,1'h0,a_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1050 = _T_1047 - _T_1048; // @[exu_div_ctl.scala 735:41]
  wire [6:0] dw_shortq_raw = _T_1050 + 7'h1; // @[exu_div_ctl.scala 735:61]
  wire [5:0] shortq = dw_shortq_raw[6] ? 6'h0 : dw_shortq_raw[5:0]; // @[exu_div_ctl.scala 736:19]
  wire  _T_1056 = ~shortq[5]; // @[exu_div_ctl.scala 737:31]
  wire  _T_1057 = valid_ff & _T_1056; // @[exu_div_ctl.scala 737:29]
  wire  _T_1059 = shortq[4:2] == 3'h7; // @[exu_div_ctl.scala 737:58]
  wire  _T_1060 = ~_T_1059; // @[exu_div_ctl.scala 737:44]
  wire  _T_1061 = _T_1057 & _T_1060; // @[exu_div_ctl.scala 737:42]
  wire  shortq_enable = _T_1061 & _T; // @[exu_div_ctl.scala 737:73]
  wire  _T_58 = ~shortq_enable; // @[exu_div_ctl.scala 625:95]
  wire  count_enable = _T_57 & _T_58; // @[exu_div_ctl.scala 625:93]
  wire [6:0] _T_60 = count_enable ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_63 = count_ff + 7'h3; // @[exu_div_ctl.scala 626:63]
  reg [4:0] shortq_shift_ff; // @[Reg.scala 27:20]
  wire [6:0] _T_64 = {2'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [6:0] _T_66 = _T_63 + _T_64; // @[exu_div_ctl.scala 626:88]
  wire [6:0] count_in = _T_60 & _T_66; // @[exu_div_ctl.scala 626:51]
  wire  a_enable = io_valid_in | running_state; // @[exu_div_ctl.scala 627:43]
  wire  _T_67 = ~shortq_enable_ff; // @[exu_div_ctl.scala 628:47]
  wire  a_shift = running_state & _T_67; // @[exu_div_ctl.scala 628:45]
  wire [32:0] _T_69 = control_ff[2] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire [65:0] _T_70 = {_T_69,a_ff}; // @[Cat.scala 29:58]
  wire [96:0] _GEN_11 = {{31'd0}, _T_70}; // @[exu_div_ctl.scala 629:68]
  wire [96:0] _T_72 = _GEN_11 << shortq_shift_ff; // @[exu_div_ctl.scala 629:68]
  wire  _T_73 = control_ff[2] ^ control_ff[1]; // @[exu_div_ctl.scala 630:61]
  wire  _T_74 = ~_T_73; // @[exu_div_ctl.scala 630:42]
  wire  b_twos_comp = valid_ff & _T_74; // @[exu_div_ctl.scala 630:40]
  wire  _T_77 = ~valid_ff; // @[exu_div_ctl.scala 632:30]
  wire  _T_79 = _T_77 & _T_30; // @[exu_div_ctl.scala 632:40]
  wire  _T_81 = _T_79 & _T_73; // @[exu_div_ctl.scala 632:50]
  reg  by_zero_case_ff; // @[Reg.scala 27:20]
  wire  _T_82 = ~by_zero_case_ff; // @[exu_div_ctl.scala 632:92]
  wire  twos_comp_q_sel = _T_81 & _T_82; // @[exu_div_ctl.scala 632:90]
  wire  b_enable = io_valid_in | b_twos_comp; // @[exu_div_ctl.scala 633:43]
  wire  rq_enable = _T_45 | running_state; // @[exu_div_ctl.scala 634:54]
  wire  _T_84 = valid_ff & control_ff[2]; // @[exu_div_ctl.scala 635:40]
  wire  r_sign_sel = _T_84 & _T_28; // @[exu_div_ctl.scala 635:59]
  reg [32:0] r_ff; // @[Reg.scala 27:20]
  wire [36:0] _T_170 = {r_ff[32],r_ff,a_ff[32:30]}; // @[Cat.scala 29:58]
  wire [36:0] _T_172 = {b_ff[34:0],2'h0}; // @[Cat.scala 29:58]
  wire [36:0] _T_174 = _T_170 + _T_172; // @[exu_div_ctl.scala 651:55]
  wire [36:0] _T_176 = {b_ff[35:0],1'h0}; // @[Cat.scala 29:58]
  wire [36:0] _T_178 = _T_174 + _T_176; // @[exu_div_ctl.scala 651:82]
  wire [36:0] adder7_out = _T_178 + b_ff; // @[exu_div_ctl.scala 651:104]
  wire  _T_182 = ~adder7_out[36]; // @[exu_div_ctl.scala 652:24]
  wire  _T_183 = _T_182 ^ control_ff[2]; // @[exu_div_ctl.scala 652:40]
  wire  _T_185 = a_ff[29:0] == 30'h0; // @[exu_div_ctl.scala 652:75]
  wire  _T_186 = adder7_out == 37'h0; // @[exu_div_ctl.scala 652:98]
  wire  _T_187 = _T_185 & _T_186; // @[exu_div_ctl.scala 652:84]
  wire  _T_188 = _T_183 | _T_187; // @[exu_div_ctl.scala 652:60]
  wire  _T_190 = ~_T_178[36]; // @[exu_div_ctl.scala 653:23]
  wire  _T_191 = _T_190 ^ control_ff[2]; // @[exu_div_ctl.scala 653:39]
  wire  _T_194 = _T_178 == 37'h0; // @[exu_div_ctl.scala 653:97]
  wire  _T_195 = _T_185 & _T_194; // @[exu_div_ctl.scala 653:83]
  wire  _T_196 = _T_191 | _T_195; // @[exu_div_ctl.scala 653:59]
  wire [36:0] adder5_out = _T_174 + b_ff; // @[exu_div_ctl.scala 649:82]
  wire  _T_198 = ~adder5_out[36]; // @[exu_div_ctl.scala 654:23]
  wire  _T_199 = _T_198 ^ control_ff[2]; // @[exu_div_ctl.scala 654:39]
  wire  _T_202 = adder5_out == 37'h0; // @[exu_div_ctl.scala 654:97]
  wire  _T_203 = _T_185 & _T_202; // @[exu_div_ctl.scala 654:83]
  wire  _T_204 = _T_199 | _T_203; // @[exu_div_ctl.scala 654:59]
  wire  _T_206 = ~_T_174[36]; // @[exu_div_ctl.scala 655:23]
  wire  _T_207 = _T_206 ^ control_ff[2]; // @[exu_div_ctl.scala 655:39]
  wire  _T_210 = _T_174 == 37'h0; // @[exu_div_ctl.scala 655:97]
  wire  _T_211 = _T_185 & _T_210; // @[exu_div_ctl.scala 655:83]
  wire  _T_212 = _T_207 | _T_211; // @[exu_div_ctl.scala 655:59]
  wire [35:0] _T_125 = {r_ff,a_ff[32:30]}; // @[Cat.scala 29:58]
  wire [35:0] _T_127 = {b_ff[34:0],1'h0}; // @[Cat.scala 29:58]
  wire [35:0] _T_129 = _T_125 + _T_127; // @[exu_div_ctl.scala 647:46]
  wire [35:0] adder3_out = _T_129 + b_ff[35:0]; // @[exu_div_ctl.scala 647:68]
  wire  _T_214 = ~adder3_out[35]; // @[exu_div_ctl.scala 656:23]
  wire  _T_215 = _T_214 ^ control_ff[2]; // @[exu_div_ctl.scala 656:39]
  wire  _T_218 = adder3_out == 36'h0; // @[exu_div_ctl.scala 656:97]
  wire  _T_219 = _T_185 & _T_218; // @[exu_div_ctl.scala 656:83]
  wire  _T_220 = _T_215 | _T_219; // @[exu_div_ctl.scala 656:59]
  wire [34:0] _T_118 = {r_ff[31:0],a_ff[32:30]}; // @[Cat.scala 29:58]
  wire [34:0] _T_120 = {b_ff[33:0],1'h0}; // @[Cat.scala 29:58]
  wire [34:0] adder2_out = _T_118 + _T_120; // @[exu_div_ctl.scala 646:46]
  wire  _T_222 = ~adder2_out[34]; // @[exu_div_ctl.scala 657:23]
  wire  _T_223 = _T_222 ^ control_ff[2]; // @[exu_div_ctl.scala 657:39]
  wire  _T_226 = adder2_out == 35'h0; // @[exu_div_ctl.scala 657:97]
  wire  _T_227 = _T_185 & _T_226; // @[exu_div_ctl.scala 657:83]
  wire  _T_228 = _T_223 | _T_227; // @[exu_div_ctl.scala 657:59]
  wire [33:0] _T_112 = {r_ff[30:0],a_ff[32:30]}; // @[Cat.scala 29:58]
  wire [33:0] adder1_out = _T_112 + b_ff[33:0]; // @[exu_div_ctl.scala 645:46]
  wire  _T_230 = ~adder1_out[33]; // @[exu_div_ctl.scala 658:23]
  wire  _T_231 = _T_230 ^ control_ff[2]; // @[exu_div_ctl.scala 658:39]
  wire  _T_234 = adder1_out == 34'h0; // @[exu_div_ctl.scala 658:97]
  wire  _T_235 = _T_185 & _T_234; // @[exu_div_ctl.scala 658:83]
  wire  _T_236 = _T_231 | _T_235; // @[exu_div_ctl.scala 658:59]
  wire [7:0] quotient_raw = {_T_188,_T_196,_T_204,_T_212,_T_220,_T_228,_T_236,1'h0}; // @[Cat.scala 29:58]
  wire  _T_246 = quotient_raw[7] | quotient_raw[6]; // @[exu_div_ctl.scala 659:41]
  wire  _T_248 = _T_246 | quotient_raw[5]; // @[exu_div_ctl.scala 659:60]
  wire  _T_250 = _T_248 | quotient_raw[4]; // @[exu_div_ctl.scala 659:78]
  wire  _T_255 = ~quotient_raw[4]; // @[exu_div_ctl.scala 660:63]
  wire  _T_257 = _T_255 & quotient_raw[3]; // @[exu_div_ctl.scala 660:80]
  wire  _T_258 = _T_246 | _T_257; // @[exu_div_ctl.scala 660:61]
  wire  _T_260 = ~quotient_raw[3]; // @[exu_div_ctl.scala 660:101]
  wire  _T_262 = _T_260 & quotient_raw[2]; // @[exu_div_ctl.scala 660:118]
  wire  _T_263 = _T_258 | _T_262; // @[exu_div_ctl.scala 660:99]
  wire  _T_267 = quotient_raw[6] & quotient_raw[5]; // @[exu_div_ctl.scala 661:61]
  wire  _T_268 = quotient_raw[7] | _T_267; // @[exu_div_ctl.scala 661:42]
  wire  _T_273 = _T_268 | _T_257; // @[exu_div_ctl.scala 661:79]
  wire  _T_275 = ~quotient_raw[2]; // @[exu_div_ctl.scala 661:119]
  wire  _T_277 = _T_275 & quotient_raw[1]; // @[exu_div_ctl.scala 661:136]
  wire  _T_278 = _T_273 | _T_277; // @[exu_div_ctl.scala 661:117]
  wire [2:0] quotient_new = {_T_250,_T_263,_T_278}; // @[Cat.scala 29:58]
  wire  _T_86 = quotient_new == 3'h0; // @[exu_div_ctl.scala 636:61]
  wire  _T_87 = running_state & _T_86; // @[exu_div_ctl.scala 636:45]
  wire  r_restore_sel = _T_87 & _T_67; // @[exu_div_ctl.scala 636:70]
  wire  _T_89 = quotient_new == 3'h1; // @[exu_div_ctl.scala 637:61]
  wire  _T_90 = running_state & _T_89; // @[exu_div_ctl.scala 637:45]
  wire  r_adder1_sel = _T_90 & _T_67; // @[exu_div_ctl.scala 637:70]
  wire  _T_92 = quotient_new == 3'h2; // @[exu_div_ctl.scala 638:61]
  wire  _T_93 = running_state & _T_92; // @[exu_div_ctl.scala 638:45]
  wire  r_adder2_sel = _T_93 & _T_67; // @[exu_div_ctl.scala 638:70]
  wire  _T_95 = quotient_new == 3'h3; // @[exu_div_ctl.scala 639:61]
  wire  _T_96 = running_state & _T_95; // @[exu_div_ctl.scala 639:45]
  wire  r_adder3_sel = _T_96 & _T_67; // @[exu_div_ctl.scala 639:70]
  wire  _T_98 = quotient_new == 3'h4; // @[exu_div_ctl.scala 640:61]
  wire  _T_99 = running_state & _T_98; // @[exu_div_ctl.scala 640:45]
  wire  r_adder4_sel = _T_99 & _T_67; // @[exu_div_ctl.scala 640:70]
  wire  _T_101 = quotient_new == 3'h5; // @[exu_div_ctl.scala 641:61]
  wire  _T_102 = running_state & _T_101; // @[exu_div_ctl.scala 641:45]
  wire  r_adder5_sel = _T_102 & _T_67; // @[exu_div_ctl.scala 641:70]
  wire  _T_104 = quotient_new == 3'h6; // @[exu_div_ctl.scala 642:61]
  wire  _T_105 = running_state & _T_104; // @[exu_div_ctl.scala 642:45]
  wire  r_adder6_sel = _T_105 & _T_67; // @[exu_div_ctl.scala 642:70]
  wire  _T_107 = quotient_new == 3'h7; // @[exu_div_ctl.scala 643:61]
  wire  _T_108 = running_state & _T_107; // @[exu_div_ctl.scala 643:45]
  wire  r_adder7_sel = _T_108 & _T_67; // @[exu_div_ctl.scala 643:70]
  reg [31:0] q_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_282 = twos_comp_q_sel ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_283 = b_twos_comp ? b_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] twos_comp_in = _T_282 | _T_283; // @[Mux.scala 27:72]
  wire  _T_287 = |twos_comp_in[0]; // @[lib.scala 428:35]
  wire  _T_289 = ~twos_comp_in[1]; // @[lib.scala 428:40]
  wire  _T_291 = _T_287 ? _T_289 : twos_comp_in[1]; // @[lib.scala 428:23]
  wire  _T_293 = |twos_comp_in[1:0]; // @[lib.scala 428:35]
  wire  _T_295 = ~twos_comp_in[2]; // @[lib.scala 428:40]
  wire  _T_297 = _T_293 ? _T_295 : twos_comp_in[2]; // @[lib.scala 428:23]
  wire  _T_299 = |twos_comp_in[2:0]; // @[lib.scala 428:35]
  wire  _T_301 = ~twos_comp_in[3]; // @[lib.scala 428:40]
  wire  _T_303 = _T_299 ? _T_301 : twos_comp_in[3]; // @[lib.scala 428:23]
  wire  _T_305 = |twos_comp_in[3:0]; // @[lib.scala 428:35]
  wire  _T_307 = ~twos_comp_in[4]; // @[lib.scala 428:40]
  wire  _T_309 = _T_305 ? _T_307 : twos_comp_in[4]; // @[lib.scala 428:23]
  wire  _T_311 = |twos_comp_in[4:0]; // @[lib.scala 428:35]
  wire  _T_313 = ~twos_comp_in[5]; // @[lib.scala 428:40]
  wire  _T_315 = _T_311 ? _T_313 : twos_comp_in[5]; // @[lib.scala 428:23]
  wire  _T_317 = |twos_comp_in[5:0]; // @[lib.scala 428:35]
  wire  _T_319 = ~twos_comp_in[6]; // @[lib.scala 428:40]
  wire  _T_321 = _T_317 ? _T_319 : twos_comp_in[6]; // @[lib.scala 428:23]
  wire  _T_323 = |twos_comp_in[6:0]; // @[lib.scala 428:35]
  wire  _T_325 = ~twos_comp_in[7]; // @[lib.scala 428:40]
  wire  _T_327 = _T_323 ? _T_325 : twos_comp_in[7]; // @[lib.scala 428:23]
  wire  _T_329 = |twos_comp_in[7:0]; // @[lib.scala 428:35]
  wire  _T_331 = ~twos_comp_in[8]; // @[lib.scala 428:40]
  wire  _T_333 = _T_329 ? _T_331 : twos_comp_in[8]; // @[lib.scala 428:23]
  wire  _T_335 = |twos_comp_in[8:0]; // @[lib.scala 428:35]
  wire  _T_337 = ~twos_comp_in[9]; // @[lib.scala 428:40]
  wire  _T_339 = _T_335 ? _T_337 : twos_comp_in[9]; // @[lib.scala 428:23]
  wire  _T_341 = |twos_comp_in[9:0]; // @[lib.scala 428:35]
  wire  _T_343 = ~twos_comp_in[10]; // @[lib.scala 428:40]
  wire  _T_345 = _T_341 ? _T_343 : twos_comp_in[10]; // @[lib.scala 428:23]
  wire  _T_347 = |twos_comp_in[10:0]; // @[lib.scala 428:35]
  wire  _T_349 = ~twos_comp_in[11]; // @[lib.scala 428:40]
  wire  _T_351 = _T_347 ? _T_349 : twos_comp_in[11]; // @[lib.scala 428:23]
  wire  _T_353 = |twos_comp_in[11:0]; // @[lib.scala 428:35]
  wire  _T_355 = ~twos_comp_in[12]; // @[lib.scala 428:40]
  wire  _T_357 = _T_353 ? _T_355 : twos_comp_in[12]; // @[lib.scala 428:23]
  wire  _T_359 = |twos_comp_in[12:0]; // @[lib.scala 428:35]
  wire  _T_361 = ~twos_comp_in[13]; // @[lib.scala 428:40]
  wire  _T_363 = _T_359 ? _T_361 : twos_comp_in[13]; // @[lib.scala 428:23]
  wire  _T_365 = |twos_comp_in[13:0]; // @[lib.scala 428:35]
  wire  _T_367 = ~twos_comp_in[14]; // @[lib.scala 428:40]
  wire  _T_369 = _T_365 ? _T_367 : twos_comp_in[14]; // @[lib.scala 428:23]
  wire  _T_371 = |twos_comp_in[14:0]; // @[lib.scala 428:35]
  wire  _T_373 = ~twos_comp_in[15]; // @[lib.scala 428:40]
  wire  _T_375 = _T_371 ? _T_373 : twos_comp_in[15]; // @[lib.scala 428:23]
  wire  _T_377 = |twos_comp_in[15:0]; // @[lib.scala 428:35]
  wire  _T_379 = ~twos_comp_in[16]; // @[lib.scala 428:40]
  wire  _T_381 = _T_377 ? _T_379 : twos_comp_in[16]; // @[lib.scala 428:23]
  wire  _T_383 = |twos_comp_in[16:0]; // @[lib.scala 428:35]
  wire  _T_385 = ~twos_comp_in[17]; // @[lib.scala 428:40]
  wire  _T_387 = _T_383 ? _T_385 : twos_comp_in[17]; // @[lib.scala 428:23]
  wire  _T_389 = |twos_comp_in[17:0]; // @[lib.scala 428:35]
  wire  _T_391 = ~twos_comp_in[18]; // @[lib.scala 428:40]
  wire  _T_393 = _T_389 ? _T_391 : twos_comp_in[18]; // @[lib.scala 428:23]
  wire  _T_395 = |twos_comp_in[18:0]; // @[lib.scala 428:35]
  wire  _T_397 = ~twos_comp_in[19]; // @[lib.scala 428:40]
  wire  _T_399 = _T_395 ? _T_397 : twos_comp_in[19]; // @[lib.scala 428:23]
  wire  _T_401 = |twos_comp_in[19:0]; // @[lib.scala 428:35]
  wire  _T_403 = ~twos_comp_in[20]; // @[lib.scala 428:40]
  wire  _T_405 = _T_401 ? _T_403 : twos_comp_in[20]; // @[lib.scala 428:23]
  wire  _T_407 = |twos_comp_in[20:0]; // @[lib.scala 428:35]
  wire  _T_409 = ~twos_comp_in[21]; // @[lib.scala 428:40]
  wire  _T_411 = _T_407 ? _T_409 : twos_comp_in[21]; // @[lib.scala 428:23]
  wire  _T_413 = |twos_comp_in[21:0]; // @[lib.scala 428:35]
  wire  _T_415 = ~twos_comp_in[22]; // @[lib.scala 428:40]
  wire  _T_417 = _T_413 ? _T_415 : twos_comp_in[22]; // @[lib.scala 428:23]
  wire  _T_419 = |twos_comp_in[22:0]; // @[lib.scala 428:35]
  wire  _T_421 = ~twos_comp_in[23]; // @[lib.scala 428:40]
  wire  _T_423 = _T_419 ? _T_421 : twos_comp_in[23]; // @[lib.scala 428:23]
  wire  _T_425 = |twos_comp_in[23:0]; // @[lib.scala 428:35]
  wire  _T_427 = ~twos_comp_in[24]; // @[lib.scala 428:40]
  wire  _T_429 = _T_425 ? _T_427 : twos_comp_in[24]; // @[lib.scala 428:23]
  wire  _T_431 = |twos_comp_in[24:0]; // @[lib.scala 428:35]
  wire  _T_433 = ~twos_comp_in[25]; // @[lib.scala 428:40]
  wire  _T_435 = _T_431 ? _T_433 : twos_comp_in[25]; // @[lib.scala 428:23]
  wire  _T_437 = |twos_comp_in[25:0]; // @[lib.scala 428:35]
  wire  _T_439 = ~twos_comp_in[26]; // @[lib.scala 428:40]
  wire  _T_441 = _T_437 ? _T_439 : twos_comp_in[26]; // @[lib.scala 428:23]
  wire  _T_443 = |twos_comp_in[26:0]; // @[lib.scala 428:35]
  wire  _T_445 = ~twos_comp_in[27]; // @[lib.scala 428:40]
  wire  _T_447 = _T_443 ? _T_445 : twos_comp_in[27]; // @[lib.scala 428:23]
  wire  _T_449 = |twos_comp_in[27:0]; // @[lib.scala 428:35]
  wire  _T_451 = ~twos_comp_in[28]; // @[lib.scala 428:40]
  wire  _T_453 = _T_449 ? _T_451 : twos_comp_in[28]; // @[lib.scala 428:23]
  wire  _T_455 = |twos_comp_in[28:0]; // @[lib.scala 428:35]
  wire  _T_457 = ~twos_comp_in[29]; // @[lib.scala 428:40]
  wire  _T_459 = _T_455 ? _T_457 : twos_comp_in[29]; // @[lib.scala 428:23]
  wire  _T_461 = |twos_comp_in[29:0]; // @[lib.scala 428:35]
  wire  _T_463 = ~twos_comp_in[30]; // @[lib.scala 428:40]
  wire  _T_465 = _T_461 ? _T_463 : twos_comp_in[30]; // @[lib.scala 428:23]
  wire  _T_467 = |twos_comp_in[30:0]; // @[lib.scala 428:35]
  wire  _T_469 = ~twos_comp_in[31]; // @[lib.scala 428:40]
  wire  _T_471 = _T_467 ? _T_469 : twos_comp_in[31]; // @[lib.scala 428:23]
  wire [6:0] _T_477 = {_T_327,_T_321,_T_315,_T_309,_T_303,_T_297,_T_291}; // @[lib.scala 430:14]
  wire [14:0] _T_485 = {_T_375,_T_369,_T_363,_T_357,_T_351,_T_345,_T_339,_T_333,_T_477}; // @[lib.scala 430:14]
  wire [7:0] _T_492 = {_T_423,_T_417,_T_411,_T_405,_T_399,_T_393,_T_387,_T_381}; // @[lib.scala 430:14]
  wire [30:0] _T_501 = {_T_471,_T_465,_T_459,_T_453,_T_447,_T_441,_T_435,_T_429,_T_492,_T_485}; // @[lib.scala 430:14]
  wire [31:0] twos_comp_out = {_T_501,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire  _T_503 = ~a_shift; // @[exu_div_ctl.scala 669:6]
  wire  _T_505 = _T_503 & _T_67; // @[exu_div_ctl.scala 669:15]
  wire  _T_508 = io_signed_in & io_dividend_in[31]; // @[exu_div_ctl.scala 669:63]
  wire [32:0] _T_510 = {_T_508,io_dividend_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_512 = {a_ff[29:0],3'h0}; // @[Cat.scala 29:58]
  wire [65:0] ar_shifted = _T_72[65:0]; // @[exu_div_ctl.scala 629:28]
  wire [32:0] _T_514 = _T_505 ? _T_510 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_515 = a_shift ? _T_512 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_516 = shortq_enable_ff ? ar_shifted[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_517 = _T_514 | _T_515; // @[Mux.scala 27:72]
  wire [32:0] a_in = _T_517 | _T_516; // @[Mux.scala 27:72]
  wire  _T_519 = ~b_twos_comp; // @[exu_div_ctl.scala 674:5]
  wire  _T_521 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 674:63]
  wire [32:0] _T_523 = {_T_521,io_divisor_in}; // @[Cat.scala 29:58]
  wire  _T_524 = ~control_ff[1]; // @[exu_div_ctl.scala 675:49]
  wire [32:0] _T_526 = {_T_524,_T_501,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_527 = _T_519 ? _T_523 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_528 = b_twos_comp ? _T_526 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] b_in = _T_527 | _T_528; // @[Mux.scala 27:72]
  wire [32:0] _T_532 = {r_ff[29:0],a_ff[32:30]}; // @[Cat.scala 29:58]
  wire [32:0] _T_542 = {1'h0,a_ff[31:0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_543 = r_sign_sel ? 33'h1ffffffff : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_544 = r_restore_sel ? _T_532 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_545 = r_adder1_sel ? adder1_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_546 = r_adder2_sel ? adder2_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_547 = r_adder3_sel ? adder3_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_548 = r_adder4_sel ? _T_174[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_549 = r_adder5_sel ? adder5_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_550 = r_adder6_sel ? _T_178[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_551 = r_adder7_sel ? adder7_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_552 = shortq_enable_ff ? ar_shifted[65:33] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_553 = by_zero_case ? _T_542 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_554 = _T_543 | _T_544; // @[Mux.scala 27:72]
  wire [32:0] _T_555 = _T_554 | _T_545; // @[Mux.scala 27:72]
  wire [32:0] _T_556 = _T_555 | _T_546; // @[Mux.scala 27:72]
  wire [32:0] _T_557 = _T_556 | _T_547; // @[Mux.scala 27:72]
  wire [32:0] _T_558 = _T_557 | _T_548; // @[Mux.scala 27:72]
  wire [32:0] _T_559 = _T_558 | _T_549; // @[Mux.scala 27:72]
  wire [32:0] _T_560 = _T_559 | _T_550; // @[Mux.scala 27:72]
  wire [32:0] _T_561 = _T_560 | _T_551; // @[Mux.scala 27:72]
  wire [32:0] _T_562 = _T_561 | _T_552; // @[Mux.scala 27:72]
  wire [32:0] r_in = _T_562 | _T_553; // @[Mux.scala 27:72]
  wire [31:0] _T_566 = {q_ff[28:0],_T_250,_T_263,_T_278}; // @[Cat.scala 29:58]
  wire  _T_589 = ~b_ff[3]; // @[exu_div_ctl.scala 704:70]
  wire  _T_591 = ~b_ff[2]; // @[exu_div_ctl.scala 704:70]
  wire  _T_594 = _T_589 & _T_591; // @[exu_div_ctl.scala 704:95]
  wire  _T_593 = ~b_ff[1]; // @[exu_div_ctl.scala 704:70]
  wire  _T_595 = _T_594 & _T_593; // @[exu_div_ctl.scala 704:95]
  wire  _T_596 = a_ff[3] & _T_595; // @[exu_div_ctl.scala 705:11]
  wire  _T_603 = a_ff[3] & _T_594; // @[exu_div_ctl.scala 705:11]
  wire  _T_605 = ~b_ff[0]; // @[exu_div_ctl.scala 710:33]
  wire  _T_606 = _T_603 & _T_605; // @[exu_div_ctl.scala 710:31]
  wire  _T_616 = a_ff[2] & _T_595; // @[exu_div_ctl.scala 705:11]
  wire  _T_617 = _T_606 | _T_616; // @[exu_div_ctl.scala 710:42]
  wire  _T_620 = a_ff[3] & a_ff[2]; // @[exu_div_ctl.scala 703:95]
  wire  _T_626 = _T_620 & _T_594; // @[exu_div_ctl.scala 705:11]
  wire  _T_627 = _T_617 | _T_626; // @[exu_div_ctl.scala 710:75]
  wire  _T_634 = a_ff[2] & _T_594; // @[exu_div_ctl.scala 705:11]
  wire  _T_637 = _T_634 & _T_605; // @[exu_div_ctl.scala 712:31]
  wire  _T_647 = a_ff[1] & _T_595; // @[exu_div_ctl.scala 705:11]
  wire  _T_648 = _T_637 | _T_647; // @[exu_div_ctl.scala 712:42]
  wire  _T_654 = _T_589 & _T_593; // @[exu_div_ctl.scala 704:95]
  wire  _T_655 = a_ff[3] & _T_654; // @[exu_div_ctl.scala 705:11]
  wire  _T_658 = _T_655 & _T_605; // @[exu_div_ctl.scala 712:106]
  wire  _T_659 = _T_648 | _T_658; // @[exu_div_ctl.scala 712:78]
  wire  _T_662 = ~a_ff[2]; // @[exu_div_ctl.scala 703:70]
  wire  _T_663 = a_ff[3] & _T_662; // @[exu_div_ctl.scala 703:95]
  wire  _T_671 = _T_594 & b_ff[1]; // @[exu_div_ctl.scala 704:95]
  wire  _T_672 = _T_671 & b_ff[0]; // @[exu_div_ctl.scala 704:95]
  wire  _T_673 = _T_663 & _T_672; // @[exu_div_ctl.scala 705:11]
  wire  _T_674 = _T_659 | _T_673; // @[exu_div_ctl.scala 712:117]
  wire  _T_676 = ~a_ff[3]; // @[exu_div_ctl.scala 703:70]
  wire  _T_679 = _T_676 & a_ff[2]; // @[exu_div_ctl.scala 703:95]
  wire  _T_680 = _T_679 & a_ff[1]; // @[exu_div_ctl.scala 703:95]
  wire  _T_686 = _T_680 & _T_594; // @[exu_div_ctl.scala 705:11]
  wire  _T_687 = _T_674 | _T_686; // @[exu_div_ctl.scala 713:44]
  wire  _T_693 = _T_620 & _T_589; // @[exu_div_ctl.scala 705:11]
  wire  _T_696 = _T_693 & _T_605; // @[exu_div_ctl.scala 713:107]
  wire  _T_697 = _T_687 | _T_696; // @[exu_div_ctl.scala 713:80]
  wire  _T_706 = _T_589 & b_ff[2]; // @[exu_div_ctl.scala 704:95]
  wire  _T_707 = _T_706 & _T_593; // @[exu_div_ctl.scala 704:95]
  wire  _T_708 = _T_620 & _T_707; // @[exu_div_ctl.scala 705:11]
  wire  _T_709 = _T_697 | _T_708; // @[exu_div_ctl.scala 713:119]
  wire  _T_712 = a_ff[3] & a_ff[1]; // @[exu_div_ctl.scala 703:95]
  wire  _T_718 = _T_712 & _T_654; // @[exu_div_ctl.scala 705:11]
  wire  _T_719 = _T_709 | _T_718; // @[exu_div_ctl.scala 714:44]
  wire  _T_724 = _T_620 & a_ff[1]; // @[exu_div_ctl.scala 703:95]
  wire  _T_729 = _T_724 & _T_706; // @[exu_div_ctl.scala 705:11]
  wire  _T_730 = _T_719 | _T_729; // @[exu_div_ctl.scala 714:79]
  wire  _T_734 = a_ff[2] & a_ff[1]; // @[exu_div_ctl.scala 703:95]
  wire  _T_735 = _T_734 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_741 = _T_735 & _T_654; // @[exu_div_ctl.scala 705:11]
  wire  _T_747 = _T_663 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_752 = _T_589 & b_ff[1]; // @[exu_div_ctl.scala 704:95]
  wire  _T_753 = _T_752 & b_ff[0]; // @[exu_div_ctl.scala 704:95]
  wire  _T_754 = _T_747 & _T_753; // @[exu_div_ctl.scala 705:11]
  wire  _T_755 = _T_741 | _T_754; // @[exu_div_ctl.scala 716:45]
  wire  _T_762 = a_ff[2] & _T_654; // @[exu_div_ctl.scala 705:11]
  wire  _T_765 = _T_762 & _T_605; // @[exu_div_ctl.scala 716:114]
  wire  _T_766 = _T_755 | _T_765; // @[exu_div_ctl.scala 716:86]
  wire  _T_773 = a_ff[1] & _T_594; // @[exu_div_ctl.scala 705:11]
  wire  _T_776 = _T_773 & _T_605; // @[exu_div_ctl.scala 717:33]
  wire  _T_777 = _T_766 | _T_776; // @[exu_div_ctl.scala 716:129]
  wire  _T_787 = a_ff[0] & _T_595; // @[exu_div_ctl.scala 705:11]
  wire  _T_788 = _T_777 | _T_787; // @[exu_div_ctl.scala 717:47]
  wire  _T_793 = ~a_ff[1]; // @[exu_div_ctl.scala 703:70]
  wire  _T_795 = _T_679 & _T_793; // @[exu_div_ctl.scala 703:95]
  wire  _T_805 = _T_795 & _T_672; // @[exu_div_ctl.scala 705:11]
  wire  _T_806 = _T_788 | _T_805; // @[exu_div_ctl.scala 717:88]
  wire  _T_815 = _T_680 & _T_589; // @[exu_div_ctl.scala 705:11]
  wire  _T_818 = _T_815 & _T_605; // @[exu_div_ctl.scala 718:36]
  wire  _T_819 = _T_806 | _T_818; // @[exu_div_ctl.scala 717:131]
  wire  _T_825 = _T_591 & _T_593; // @[exu_div_ctl.scala 704:95]
  wire  _T_826 = a_ff[3] & _T_825; // @[exu_div_ctl.scala 705:11]
  wire  _T_829 = _T_826 & _T_605; // @[exu_div_ctl.scala 718:76]
  wire  _T_830 = _T_819 | _T_829; // @[exu_div_ctl.scala 718:47]
  wire  _T_840 = _T_706 & b_ff[1]; // @[exu_div_ctl.scala 704:95]
  wire  _T_841 = _T_663 & _T_840; // @[exu_div_ctl.scala 705:11]
  wire  _T_842 = _T_830 | _T_841; // @[exu_div_ctl.scala 718:88]
  wire  _T_856 = _T_680 & _T_707; // @[exu_div_ctl.scala 705:11]
  wire  _T_857 = _T_842 | _T_856; // @[exu_div_ctl.scala 718:131]
  wire  _T_863 = _T_679 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_869 = _T_863 & _T_654; // @[exu_div_ctl.scala 705:11]
  wire  _T_870 = _T_857 | _T_869; // @[exu_div_ctl.scala 719:47]
  wire  _T_877 = _T_663 & _T_793; // @[exu_div_ctl.scala 703:95]
  wire  _T_883 = _T_706 & b_ff[0]; // @[exu_div_ctl.scala 704:95]
  wire  _T_884 = _T_877 & _T_883; // @[exu_div_ctl.scala 705:11]
  wire  _T_885 = _T_870 | _T_884; // @[exu_div_ctl.scala 719:88]
  wire  _T_890 = _T_662 & a_ff[1]; // @[exu_div_ctl.scala 703:95]
  wire  _T_891 = _T_890 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_897 = _T_891 & _T_594; // @[exu_div_ctl.scala 705:11]
  wire  _T_898 = _T_885 | _T_897; // @[exu_div_ctl.scala 719:131]
  wire  _T_904 = _T_620 & _T_593; // @[exu_div_ctl.scala 705:11]
  wire  _T_907 = _T_904 & _T_605; // @[exu_div_ctl.scala 720:75]
  wire  _T_908 = _T_898 | _T_907; // @[exu_div_ctl.scala 720:47]
  wire  _T_916 = _T_680 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_921 = _T_916 & _T_706; // @[exu_div_ctl.scala 705:11]
  wire  _T_922 = _T_908 | _T_921; // @[exu_div_ctl.scala 720:88]
  wire  _T_929 = b_ff[3] & _T_591; // @[exu_div_ctl.scala 704:95]
  wire  _T_930 = _T_620 & _T_929; // @[exu_div_ctl.scala 705:11]
  wire  _T_931 = _T_922 | _T_930; // @[exu_div_ctl.scala 720:131]
  wire  _T_941 = _T_929 & _T_593; // @[exu_div_ctl.scala 704:95]
  wire  _T_942 = _T_712 & _T_941; // @[exu_div_ctl.scala 705:11]
  wire  _T_943 = _T_931 | _T_942; // @[exu_div_ctl.scala 721:47]
  wire  _T_946 = a_ff[3] & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_952 = _T_946 & _T_825; // @[exu_div_ctl.scala 705:11]
  wire  _T_953 = _T_943 | _T_952; // @[exu_div_ctl.scala 721:88]
  wire  _T_957 = a_ff[3] & _T_793; // @[exu_div_ctl.scala 703:95]
  wire  _T_965 = _T_840 & b_ff[0]; // @[exu_div_ctl.scala 704:95]
  wire  _T_966 = _T_957 & _T_965; // @[exu_div_ctl.scala 705:11]
  wire  _T_967 = _T_953 | _T_966; // @[exu_div_ctl.scala 721:131]
  wire  _T_974 = _T_724 & b_ff[3]; // @[exu_div_ctl.scala 705:11]
  wire  _T_977 = _T_974 & _T_605; // @[exu_div_ctl.scala 722:77]
  wire  _T_978 = _T_967 | _T_977; // @[exu_div_ctl.scala 722:47]
  wire  _T_987 = b_ff[3] & _T_593; // @[exu_div_ctl.scala 704:95]
  wire  _T_988 = _T_724 & _T_987; // @[exu_div_ctl.scala 705:11]
  wire  _T_989 = _T_978 | _T_988; // @[exu_div_ctl.scala 722:88]
  wire  _T_994 = _T_620 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_999 = _T_994 & _T_987; // @[exu_div_ctl.scala 705:11]
  wire  _T_1000 = _T_989 | _T_999; // @[exu_div_ctl.scala 722:131]
  wire  _T_1006 = _T_663 & a_ff[1]; // @[exu_div_ctl.scala 703:95]
  wire  _T_1011 = _T_1006 & _T_752; // @[exu_div_ctl.scala 705:11]
  wire  _T_1012 = _T_1000 | _T_1011; // @[exu_div_ctl.scala 723:47]
  wire  _T_1017 = _T_712 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_1020 = _T_1017 & _T_591; // @[exu_div_ctl.scala 705:11]
  wire  _T_1021 = _T_1012 | _T_1020; // @[exu_div_ctl.scala 723:88]
  wire  _T_1028 = _T_724 & a_ff[0]; // @[exu_div_ctl.scala 703:95]
  wire  _T_1030 = _T_1028 & b_ff[3]; // @[exu_div_ctl.scala 705:11]
  wire  _T_1031 = _T_1021 | _T_1030; // @[exu_div_ctl.scala 723:131]
  wire  _T_1037 = _T_712 & _T_591; // @[exu_div_ctl.scala 705:11]
  wire  _T_1040 = _T_1037 & _T_605; // @[exu_div_ctl.scala 724:74]
  wire  _T_1041 = _T_1031 | _T_1040; // @[exu_div_ctl.scala 724:47]
  wire [31:0] _T_567 = {28'h0,_T_596,_T_627,_T_730,_T_1041}; // @[Cat.scala 29:58]
  wire [31:0] _T_569 = _T_77 ? _T_566 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_570 = smallnum_case ? _T_567 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_571 = by_zero_case ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_572 = _T_569 | _T_570; // @[Mux.scala 27:72]
  wire [31:0] q_in = _T_572 | _T_571; // @[Mux.scala 27:72]
  wire  _T_577 = ~twos_comp_q_sel; // @[exu_div_ctl.scala 698:16]
  wire  _T_578 = _T_30 & _T_577; // @[exu_div_ctl.scala 698:14]
  wire [31:0] _T_581 = _T_578 ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_582 = control_ff[0] ? r_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_583 = twos_comp_q_sel ? twos_comp_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_584 = _T_581 | _T_582; // @[Mux.scala 27:72]
  wire  _T_1068 = shortq == 6'h1b; // @[exu_div_ctl.scala 739:58]
  wire  _T_1069 = shortq == 6'h1a; // @[exu_div_ctl.scala 739:58]
  wire  _T_1070 = shortq == 6'h19; // @[exu_div_ctl.scala 739:58]
  wire  _T_1071 = shortq == 6'h18; // @[exu_div_ctl.scala 739:58]
  wire  _T_1072 = shortq == 6'h17; // @[exu_div_ctl.scala 739:58]
  wire  _T_1073 = shortq == 6'h16; // @[exu_div_ctl.scala 739:58]
  wire  _T_1074 = shortq == 6'h15; // @[exu_div_ctl.scala 739:58]
  wire  _T_1075 = shortq == 6'h14; // @[exu_div_ctl.scala 739:58]
  wire  _T_1076 = shortq == 6'h13; // @[exu_div_ctl.scala 739:58]
  wire  _T_1077 = shortq == 6'h12; // @[exu_div_ctl.scala 739:58]
  wire  _T_1078 = shortq == 6'h11; // @[exu_div_ctl.scala 739:58]
  wire  _T_1079 = shortq == 6'h10; // @[exu_div_ctl.scala 739:58]
  wire  _T_1080 = shortq == 6'hf; // @[exu_div_ctl.scala 739:58]
  wire  _T_1081 = shortq == 6'he; // @[exu_div_ctl.scala 739:58]
  wire  _T_1082 = shortq == 6'hd; // @[exu_div_ctl.scala 739:58]
  wire  _T_1083 = shortq == 6'hc; // @[exu_div_ctl.scala 739:58]
  wire  _T_1084 = shortq == 6'hb; // @[exu_div_ctl.scala 739:58]
  wire  _T_1085 = shortq == 6'ha; // @[exu_div_ctl.scala 739:58]
  wire  _T_1086 = shortq == 6'h9; // @[exu_div_ctl.scala 739:58]
  wire  _T_1087 = shortq == 6'h8; // @[exu_div_ctl.scala 739:58]
  wire  _T_1088 = shortq == 6'h7; // @[exu_div_ctl.scala 739:58]
  wire  _T_1089 = shortq == 6'h6; // @[exu_div_ctl.scala 739:58]
  wire  _T_1090 = shortq == 6'h5; // @[exu_div_ctl.scala 739:58]
  wire  _T_1091 = shortq == 6'h4; // @[exu_div_ctl.scala 739:58]
  wire  _T_1092 = shortq == 6'h3; // @[exu_div_ctl.scala 739:58]
  wire  _T_1093 = shortq == 6'h2; // @[exu_div_ctl.scala 739:58]
  wire  _T_1094 = shortq == 6'h1; // @[exu_div_ctl.scala 739:58]
  wire  _T_1095 = shortq == 6'h0; // @[exu_div_ctl.scala 739:58]
  wire [1:0] _T_1100 = _T_1068 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1101 = _T_1069 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1102 = _T_1070 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1103 = _T_1071 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1104 = _T_1072 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1105 = _T_1073 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1106 = _T_1074 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1107 = _T_1075 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1108 = _T_1076 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1109 = _T_1077 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1110 = _T_1078 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1111 = _T_1079 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1112 = _T_1080 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1113 = _T_1081 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1114 = _T_1082 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1115 = _T_1083 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1116 = _T_1084 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1117 = _T_1085 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1118 = _T_1086 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1119 = _T_1087 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1120 = _T_1088 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1121 = _T_1089 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1122 = _T_1090 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1123 = _T_1091 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1124 = _T_1092 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1125 = _T_1093 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1126 = _T_1094 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1127 = _T_1095 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [2:0] _GEN_12 = {{1'd0}, _T_1100}; // @[Mux.scala 27:72]
  wire [2:0] _T_1132 = _GEN_12 | _T_1101; // @[Mux.scala 27:72]
  wire [2:0] _T_1133 = _T_1132 | _T_1102; // @[Mux.scala 27:72]
  wire [2:0] _T_1134 = _T_1133 | _T_1103; // @[Mux.scala 27:72]
  wire [3:0] _GEN_13 = {{1'd0}, _T_1134}; // @[Mux.scala 27:72]
  wire [3:0] _T_1135 = _GEN_13 | _T_1104; // @[Mux.scala 27:72]
  wire [3:0] _T_1136 = _T_1135 | _T_1105; // @[Mux.scala 27:72]
  wire [3:0] _T_1137 = _T_1136 | _T_1106; // @[Mux.scala 27:72]
  wire [3:0] _T_1138 = _T_1137 | _T_1107; // @[Mux.scala 27:72]
  wire [3:0] _T_1139 = _T_1138 | _T_1108; // @[Mux.scala 27:72]
  wire [3:0] _T_1140 = _T_1139 | _T_1109; // @[Mux.scala 27:72]
  wire [3:0] _T_1141 = _T_1140 | _T_1110; // @[Mux.scala 27:72]
  wire [3:0] _T_1142 = _T_1141 | _T_1111; // @[Mux.scala 27:72]
  wire [3:0] _T_1143 = _T_1142 | _T_1112; // @[Mux.scala 27:72]
  wire [4:0] _GEN_14 = {{1'd0}, _T_1143}; // @[Mux.scala 27:72]
  wire [4:0] _T_1144 = _GEN_14 | _T_1113; // @[Mux.scala 27:72]
  wire [4:0] _T_1145 = _T_1144 | _T_1114; // @[Mux.scala 27:72]
  wire [4:0] _T_1146 = _T_1145 | _T_1115; // @[Mux.scala 27:72]
  wire [4:0] _T_1147 = _T_1146 | _T_1116; // @[Mux.scala 27:72]
  wire [4:0] _T_1148 = _T_1147 | _T_1117; // @[Mux.scala 27:72]
  wire [4:0] _T_1149 = _T_1148 | _T_1118; // @[Mux.scala 27:72]
  wire [4:0] _T_1150 = _T_1149 | _T_1119; // @[Mux.scala 27:72]
  wire [4:0] _T_1151 = _T_1150 | _T_1120; // @[Mux.scala 27:72]
  wire [4:0] _T_1152 = _T_1151 | _T_1121; // @[Mux.scala 27:72]
  wire [4:0] _T_1153 = _T_1152 | _T_1122; // @[Mux.scala 27:72]
  wire [4:0] _T_1154 = _T_1153 | _T_1123; // @[Mux.scala 27:72]
  wire [4:0] _T_1155 = _T_1154 | _T_1124; // @[Mux.scala 27:72]
  wire [4:0] _T_1156 = _T_1155 | _T_1125; // @[Mux.scala 27:72]
  wire [4:0] _T_1157 = _T_1156 | _T_1126; // @[Mux.scala 27:72]
  wire [4:0] shortq_decode = _T_1157 | _T_1127; // @[Mux.scala 27:72]
  exu_div_cls a_enc ( // @[exu_div_ctl.scala 727:21]
    .io_operand(a_enc_io_operand),
    .io_cls(a_enc_io_cls)
  );
  exu_div_cls b_enc ( // @[exu_div_ctl.scala 730:20]
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
  assign io_data_out = _T_584 | _T_583; // @[exu_div_ctl.scala 697:15]
  assign io_valid_out = finish_ff & _T; // @[exu_div_ctl.scala 696:16]
  assign a_enc_io_operand = {control_ff[2],a_ff[31:0]}; // @[exu_div_ctl.scala 728:20]
  assign b_enc_io_operand = b_ff[32:0]; // @[exu_div_ctl.scala 731:20]
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
  b_ff1 = _RAND_1[32:0];
  _RAND_2 = {1{`RANDOM}};
  valid_ff = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  a_ff = _RAND_3[32:0];
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
  _RAND_9 = {2{`RANDOM}};
  r_ff = _RAND_9[32:0];
  _RAND_10 = {1{`RANDOM}};
  q_ff = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    control_ff = 3'h0;
  end
  if (reset) begin
    b_ff1 = 33'h0;
  end
  if (reset) begin
    valid_ff = 1'h0;
  end
  if (reset) begin
    a_ff = 33'h0;
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
    r_ff = 33'h0;
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
      b_ff1 <= 33'h0;
    end else if (b_enable) begin
      b_ff1 <= b_in;
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
      a_ff <= 33'h0;
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
        shortq_shift_ff <= shortq_decode;
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
      r_ff <= 33'h0;
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
