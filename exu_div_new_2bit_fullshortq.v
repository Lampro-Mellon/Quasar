module exu_div_cls(
  input  [32:0] io_operand,
  output [4:0]  io_cls
);
  wire  _T_3 = io_operand[31:30] == 2'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_5 = io_operand[31:29] == 3'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_7 = io_operand[31:28] == 4'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_9 = io_operand[31:27] == 5'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_11 = io_operand[31:26] == 6'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_13 = io_operand[31:25] == 7'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_15 = io_operand[31:24] == 8'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_17 = io_operand[31:23] == 9'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_19 = io_operand[31:22] == 10'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_21 = io_operand[31:21] == 11'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_23 = io_operand[31:20] == 12'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_25 = io_operand[31:19] == 13'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_27 = io_operand[31:18] == 14'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_29 = io_operand[31:17] == 15'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_31 = io_operand[31:16] == 16'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_33 = io_operand[31:15] == 17'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_35 = io_operand[31:14] == 18'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_37 = io_operand[31:13] == 19'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_39 = io_operand[31:12] == 20'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_41 = io_operand[31:11] == 21'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_43 = io_operand[31:10] == 22'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_45 = io_operand[31:9] == 23'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_47 = io_operand[31:8] == 24'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_49 = io_operand[31:7] == 25'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_51 = io_operand[31:6] == 26'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_53 = io_operand[31:5] == 27'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_55 = io_operand[31:4] == 28'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_57 = io_operand[31:3] == 29'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_59 = io_operand[31:2] == 30'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_61 = io_operand[31:1] == 31'h1; // @[exu_div_ctl.scala 655:63]
  wire  _T_63 = io_operand[31:0] == 32'h1; // @[exu_div_ctl.scala 655:63]
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
  wire  _T_129 = io_operand[31:0] == 32'hffffffff; // @[exu_div_ctl.scala 657:25]
  wire  _T_137 = io_operand[31:29] == 3'h6; // @[exu_div_ctl.scala 658:76]
  wire  _T_142 = io_operand[31:28] == 4'he; // @[exu_div_ctl.scala 658:76]
  wire  _T_147 = io_operand[31:27] == 5'h1e; // @[exu_div_ctl.scala 658:76]
  wire  _T_152 = io_operand[31:26] == 6'h3e; // @[exu_div_ctl.scala 658:76]
  wire  _T_157 = io_operand[31:25] == 7'h7e; // @[exu_div_ctl.scala 658:76]
  wire  _T_162 = io_operand[31:24] == 8'hfe; // @[exu_div_ctl.scala 658:76]
  wire  _T_167 = io_operand[31:23] == 9'h1fe; // @[exu_div_ctl.scala 658:76]
  wire  _T_172 = io_operand[31:22] == 10'h3fe; // @[exu_div_ctl.scala 658:76]
  wire  _T_177 = io_operand[31:21] == 11'h7fe; // @[exu_div_ctl.scala 658:76]
  wire  _T_182 = io_operand[31:20] == 12'hffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_187 = io_operand[31:19] == 13'h1ffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_192 = io_operand[31:18] == 14'h3ffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_197 = io_operand[31:17] == 15'h7ffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_202 = io_operand[31:16] == 16'hfffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_207 = io_operand[31:15] == 17'h1fffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_212 = io_operand[31:14] == 18'h3fffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_217 = io_operand[31:13] == 19'h7fffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_222 = io_operand[31:12] == 20'hffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_227 = io_operand[31:11] == 21'h1ffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_232 = io_operand[31:10] == 22'h3ffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_237 = io_operand[31:9] == 23'h7ffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_242 = io_operand[31:8] == 24'hfffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_247 = io_operand[31:7] == 25'h1fffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_252 = io_operand[31:6] == 26'h3fffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_257 = io_operand[31:5] == 27'h7fffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_262 = io_operand[31:4] == 28'hffffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_267 = io_operand[31:3] == 29'h1ffffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_272 = io_operand[31:2] == 30'h3ffffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_277 = io_operand[31:1] == 31'h7ffffffe; // @[exu_div_ctl.scala 658:76]
  wire  _T_282 = io_operand[31:0] == 32'hfffffffe; // @[exu_div_ctl.scala 658:76]
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
  wire [4:0] cls_ones = _T_129 ? 5'h1f : _T_344; // @[exu_div_ctl.scala 657:44]
  assign io_cls = io_operand[32] ? cls_ones : cls_zeros; // @[exu_div_ctl.scala 659:10]
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
module exu_div_new_2bit_fullshortq(
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
  wire [32:0] a_enc_io_operand; // @[exu_div_ctl.scala 584:21]
  wire [4:0] a_enc_io_cls; // @[exu_div_ctl.scala 584:21]
  wire [32:0] b_enc_io_operand; // @[exu_div_ctl.scala 587:21]
  wire [4:0] b_enc_io_cls; // @[exu_div_ctl.scala 587:21]
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
  wire  _T = ~io_cancel; // @[exu_div_ctl.scala 488:35]
  wire  valid_ff_in = io_valid_in & _T; // @[exu_div_ctl.scala 488:33]
  wire  _T_1 = ~io_valid_in; // @[exu_div_ctl.scala 489:35]
  reg [2:0] control_ff; // @[Reg.scala 27:20]
  wire  _T_3 = _T_1 & control_ff[2]; // @[exu_div_ctl.scala 489:48]
  wire  _T_4 = io_valid_in & io_signed_in; // @[exu_div_ctl.scala 489:80]
  wire  _T_6 = _T_4 & io_dividend_in[31]; // @[exu_div_ctl.scala 489:96]
  wire  _T_7 = _T_3 | _T_6; // @[exu_div_ctl.scala 489:65]
  wire  _T_10 = _T_1 & control_ff[1]; // @[exu_div_ctl.scala 489:133]
  wire  _T_13 = _T_4 & io_divisor_in[31]; // @[exu_div_ctl.scala 489:181]
  wire  _T_14 = _T_10 | _T_13; // @[exu_div_ctl.scala 489:150]
  wire  _T_17 = _T_1 & control_ff[0]; // @[exu_div_ctl.scala 489:218]
  wire  _T_18 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 489:250]
  wire  _T_19 = _T_17 | _T_18; // @[exu_div_ctl.scala 489:235]
  wire [2:0] control_in = {_T_7,_T_14,_T_19}; // @[Cat.scala 29:58]
  reg [32:0] b_ff1; // @[Reg.scala 27:20]
  wire [34:0] b_ff = {b_ff1[32],b_ff1[32],b_ff1}; // @[Cat.scala 29:58]
  wire  _T_22 = b_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 493:54]
  reg  valid_ff; // @[Reg.scala 27:20]
  wire  by_zero_case = valid_ff & _T_22; // @[exu_div_ctl.scala 493:40]
  reg [31:0] a_ff; // @[Reg.scala 27:20]
  wire  _T_25 = ~by_zero_case; // @[exu_div_ctl.scala 496:29]
  wire  _T_27 = ~control_ff[0]; // @[exu_div_ctl.scala 496:45]
  reg [6:0] count_ff; // @[Reg.scala 27:20]
  wire  _T_32 = |count_ff; // @[exu_div_ctl.scala 497:42]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  running_state = _T_32 | shortq_enable_ff; // @[exu_div_ctl.scala 497:45]
  wire  _T_33 = io_valid_in | valid_ff; // @[exu_div_ctl.scala 498:43]
  wire  _T_34 = _T_33 | io_cancel; // @[exu_div_ctl.scala 498:54]
  wire  _T_35 = _T_34 | running_state; // @[exu_div_ctl.scala 498:66]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  misc_enable = _T_35 | finish_ff; // @[exu_div_ctl.scala 498:82]
  wire  _T_37 = count_ff == 7'h20; // @[exu_div_ctl.scala 499:72]
  wire  finish_raw = by_zero_case | _T_37; // @[exu_div_ctl.scala 499:60]
  wire  finish = finish_raw & _T; // @[exu_div_ctl.scala 500:41]
  wire  _T_39 = valid_ff | running_state; // @[exu_div_ctl.scala 501:40]
  wire  _T_40 = ~finish; // @[exu_div_ctl.scala 501:59]
  wire  _T_41 = _T_39 & _T_40; // @[exu_div_ctl.scala 501:57]
  wire  _T_42 = ~finish_ff; // @[exu_div_ctl.scala 501:69]
  wire  _T_43 = _T_41 & _T_42; // @[exu_div_ctl.scala 501:67]
  wire  _T_45 = _T_43 & _T; // @[exu_div_ctl.scala 501:80]
  wire [6:0] _T_891 = {1'h0,1'h0,b_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_892 = {1'h0,1'h0,a_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_894 = _T_891 - _T_892; // @[exu_div_ctl.scala 592:41]
  wire [6:0] dw_shortq_raw = _T_894 + 7'h1; // @[exu_div_ctl.scala 592:61]
  wire [5:0] shortq = dw_shortq_raw[6] ? 6'h0 : dw_shortq_raw[5:0]; // @[exu_div_ctl.scala 593:19]
  wire  _T_900 = ~shortq[5]; // @[exu_div_ctl.scala 594:31]
  wire  _T_901 = valid_ff & _T_900; // @[exu_div_ctl.scala 594:29]
  wire  _T_903 = shortq[4:1] == 4'hf; // @[exu_div_ctl.scala 594:58]
  wire  _T_904 = ~_T_903; // @[exu_div_ctl.scala 594:44]
  wire  _T_905 = _T_901 & _T_904; // @[exu_div_ctl.scala 594:42]
  wire  shortq_enable = _T_905 & _T; // @[exu_div_ctl.scala 594:74]
  wire  _T_46 = ~shortq_enable; // @[exu_div_ctl.scala 501:95]
  wire  count_enable = _T_45 & _T_46; // @[exu_div_ctl.scala 501:93]
  wire [6:0] _T_48 = count_enable ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_51 = count_ff + 7'h2; // @[exu_div_ctl.scala 502:63]
  reg [3:0] shortq_shift_ff; // @[Reg.scala 27:20]
  wire [6:0] _T_53 = {2'h0,shortq_shift_ff,1'h0}; // @[Cat.scala 29:58]
  wire [6:0] _T_55 = _T_51 + _T_53; // @[exu_div_ctl.scala 502:83]
  wire [6:0] count_in = _T_48 & _T_55; // @[exu_div_ctl.scala 502:51]
  wire  a_enable = io_valid_in | running_state; // @[exu_div_ctl.scala 503:43]
  wire  _T_56 = ~shortq_enable_ff; // @[exu_div_ctl.scala 504:47]
  wire  a_shift = running_state & _T_56; // @[exu_div_ctl.scala 504:45]
  wire [31:0] _T_58 = control_ff[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_59 = {_T_58,a_ff}; // @[Cat.scala 29:58]
  wire [4:0] _T_60 = {shortq_shift_ff,1'h0}; // @[Cat.scala 29:58]
  wire [94:0] _GEN_11 = {{31'd0}, _T_59}; // @[exu_div_ctl.scala 505:68]
  wire [94:0] _T_61 = _GEN_11 << _T_60; // @[exu_div_ctl.scala 505:68]
  wire  _T_62 = control_ff[2] ^ control_ff[1]; // @[exu_div_ctl.scala 506:61]
  wire  _T_63 = ~_T_62; // @[exu_div_ctl.scala 506:42]
  wire  b_twos_comp = valid_ff & _T_63; // @[exu_div_ctl.scala 506:40]
  wire  _T_66 = ~valid_ff; // @[exu_div_ctl.scala 508:30]
  wire  _T_68 = _T_66 & _T_27; // @[exu_div_ctl.scala 508:40]
  wire  _T_70 = _T_68 & _T_62; // @[exu_div_ctl.scala 508:50]
  reg  by_zero_case_ff; // @[Reg.scala 27:20]
  wire  _T_71 = ~by_zero_case_ff; // @[exu_div_ctl.scala 508:92]
  wire  twos_comp_q_sel = _T_70 & _T_71; // @[exu_div_ctl.scala 508:90]
  wire  b_enable = io_valid_in | b_twos_comp; // @[exu_div_ctl.scala 509:43]
  wire  rq_enable = _T_33 | running_state; // @[exu_div_ctl.scala 510:54]
  wire  _T_73 = valid_ff & control_ff[2]; // @[exu_div_ctl.scala 511:40]
  wire  r_sign_sel = _T_73 & _T_25; // @[exu_div_ctl.scala 511:59]
  reg [31:0] r_ff; // @[Reg.scala 27:20]
  wire [34:0] _T_102 = {r_ff[31],r_ff,a_ff[31:30]}; // @[Cat.scala 29:58]
  wire [34:0] _T_104 = {b_ff[33:0],1'h0}; // @[Cat.scala 29:58]
  wire [34:0] _T_106 = _T_102 + _T_104; // @[exu_div_ctl.scala 518:57]
  wire [34:0] adder3_out = _T_106 + b_ff; // @[exu_div_ctl.scala 518:79]
  wire  _T_109 = ~adder3_out[34]; // @[exu_div_ctl.scala 519:24]
  wire  _T_110 = _T_109 ^ control_ff[2]; // @[exu_div_ctl.scala 519:40]
  wire  _T_112 = a_ff[29:0] == 30'h0; // @[exu_div_ctl.scala 519:75]
  wire  _T_113 = adder3_out == 35'h0; // @[exu_div_ctl.scala 519:98]
  wire  _T_114 = _T_112 & _T_113; // @[exu_div_ctl.scala 519:84]
  wire  _T_115 = _T_110 | _T_114; // @[exu_div_ctl.scala 519:60]
  wire [32:0] _T_94 = {r_ff[30:0],a_ff[31:30]}; // @[Cat.scala 29:58]
  wire [33:0] _T_96 = {b_ff[32:0],1'h0}; // @[Cat.scala 29:58]
  wire [33:0] _GEN_12 = {{1'd0}, _T_94}; // @[exu_div_ctl.scala 517:48]
  wire [33:0] adder2_out = _GEN_12 + _T_96; // @[exu_div_ctl.scala 517:48]
  wire  _T_117 = ~adder2_out[33]; // @[exu_div_ctl.scala 520:6]
  wire  _T_118 = _T_117 ^ control_ff[2]; // @[exu_div_ctl.scala 520:22]
  wire  _T_121 = adder2_out == 34'h0; // @[exu_div_ctl.scala 520:80]
  wire  _T_122 = _T_112 & _T_121; // @[exu_div_ctl.scala 520:66]
  wire  _T_123 = _T_118 | _T_122; // @[exu_div_ctl.scala 520:42]
  wire [32:0] adder1_out = _T_94 + b_ff[32:0]; // @[exu_div_ctl.scala 516:48]
  wire  _T_125 = ~adder1_out[32]; // @[exu_div_ctl.scala 521:6]
  wire  _T_126 = _T_125 ^ control_ff[2]; // @[exu_div_ctl.scala 521:22]
  wire  _T_129 = adder1_out == 33'h0; // @[exu_div_ctl.scala 521:80]
  wire  _T_130 = _T_112 & _T_129; // @[exu_div_ctl.scala 521:66]
  wire  _T_131 = _T_126 | _T_130; // @[exu_div_ctl.scala 521:42]
  wire [3:0] quotient_raw = {_T_115,_T_123,_T_131,1'h0}; // @[Cat.scala 29:58]
  wire  _T_137 = quotient_raw[3] | quotient_raw[2]; // @[exu_div_ctl.scala 522:41]
  wire  _T_140 = ~quotient_raw[2]; // @[exu_div_ctl.scala 522:82]
  wire  _T_142 = _T_140 & quotient_raw[1]; // @[exu_div_ctl.scala 522:99]
  wire  _T_143 = quotient_raw[3] | _T_142; // @[exu_div_ctl.scala 522:80]
  wire [1:0] quotient_new = {_T_137,_T_143}; // @[Cat.scala 29:58]
  wire  _T_75 = quotient_new == 2'h0; // @[exu_div_ctl.scala 512:61]
  wire  _T_76 = running_state & _T_75; // @[exu_div_ctl.scala 512:45]
  wire  r_restore_sel = _T_76 & _T_56; // @[exu_div_ctl.scala 512:70]
  wire  _T_78 = quotient_new == 2'h1; // @[exu_div_ctl.scala 513:61]
  wire  _T_79 = running_state & _T_78; // @[exu_div_ctl.scala 513:45]
  wire  r_adder1_sel = _T_79 & _T_56; // @[exu_div_ctl.scala 513:70]
  wire  _T_81 = quotient_new == 2'h2; // @[exu_div_ctl.scala 514:61]
  wire  _T_82 = running_state & _T_81; // @[exu_div_ctl.scala 514:45]
  wire  r_adder2_sel = _T_82 & _T_56; // @[exu_div_ctl.scala 514:70]
  wire  _T_84 = quotient_new == 2'h3; // @[exu_div_ctl.scala 515:61]
  wire  _T_85 = running_state & _T_84; // @[exu_div_ctl.scala 515:45]
  wire  r_adder3_sel = _T_85 & _T_56; // @[exu_div_ctl.scala 515:70]
  reg [31:0] q_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_146 = twos_comp_q_sel ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_147 = b_twos_comp ? b_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] twos_comp_in = _T_146 | _T_147; // @[Mux.scala 27:72]
  wire  _T_151 = |twos_comp_in[0]; // @[lib.scala 428:35]
  wire  _T_153 = ~twos_comp_in[1]; // @[lib.scala 428:40]
  wire  _T_155 = _T_151 ? _T_153 : twos_comp_in[1]; // @[lib.scala 428:23]
  wire  _T_157 = |twos_comp_in[1:0]; // @[lib.scala 428:35]
  wire  _T_159 = ~twos_comp_in[2]; // @[lib.scala 428:40]
  wire  _T_161 = _T_157 ? _T_159 : twos_comp_in[2]; // @[lib.scala 428:23]
  wire  _T_163 = |twos_comp_in[2:0]; // @[lib.scala 428:35]
  wire  _T_165 = ~twos_comp_in[3]; // @[lib.scala 428:40]
  wire  _T_167 = _T_163 ? _T_165 : twos_comp_in[3]; // @[lib.scala 428:23]
  wire  _T_169 = |twos_comp_in[3:0]; // @[lib.scala 428:35]
  wire  _T_171 = ~twos_comp_in[4]; // @[lib.scala 428:40]
  wire  _T_173 = _T_169 ? _T_171 : twos_comp_in[4]; // @[lib.scala 428:23]
  wire  _T_175 = |twos_comp_in[4:0]; // @[lib.scala 428:35]
  wire  _T_177 = ~twos_comp_in[5]; // @[lib.scala 428:40]
  wire  _T_179 = _T_175 ? _T_177 : twos_comp_in[5]; // @[lib.scala 428:23]
  wire  _T_181 = |twos_comp_in[5:0]; // @[lib.scala 428:35]
  wire  _T_183 = ~twos_comp_in[6]; // @[lib.scala 428:40]
  wire  _T_185 = _T_181 ? _T_183 : twos_comp_in[6]; // @[lib.scala 428:23]
  wire  _T_187 = |twos_comp_in[6:0]; // @[lib.scala 428:35]
  wire  _T_189 = ~twos_comp_in[7]; // @[lib.scala 428:40]
  wire  _T_191 = _T_187 ? _T_189 : twos_comp_in[7]; // @[lib.scala 428:23]
  wire  _T_193 = |twos_comp_in[7:0]; // @[lib.scala 428:35]
  wire  _T_195 = ~twos_comp_in[8]; // @[lib.scala 428:40]
  wire  _T_197 = _T_193 ? _T_195 : twos_comp_in[8]; // @[lib.scala 428:23]
  wire  _T_199 = |twos_comp_in[8:0]; // @[lib.scala 428:35]
  wire  _T_201 = ~twos_comp_in[9]; // @[lib.scala 428:40]
  wire  _T_203 = _T_199 ? _T_201 : twos_comp_in[9]; // @[lib.scala 428:23]
  wire  _T_205 = |twos_comp_in[9:0]; // @[lib.scala 428:35]
  wire  _T_207 = ~twos_comp_in[10]; // @[lib.scala 428:40]
  wire  _T_209 = _T_205 ? _T_207 : twos_comp_in[10]; // @[lib.scala 428:23]
  wire  _T_211 = |twos_comp_in[10:0]; // @[lib.scala 428:35]
  wire  _T_213 = ~twos_comp_in[11]; // @[lib.scala 428:40]
  wire  _T_215 = _T_211 ? _T_213 : twos_comp_in[11]; // @[lib.scala 428:23]
  wire  _T_217 = |twos_comp_in[11:0]; // @[lib.scala 428:35]
  wire  _T_219 = ~twos_comp_in[12]; // @[lib.scala 428:40]
  wire  _T_221 = _T_217 ? _T_219 : twos_comp_in[12]; // @[lib.scala 428:23]
  wire  _T_223 = |twos_comp_in[12:0]; // @[lib.scala 428:35]
  wire  _T_225 = ~twos_comp_in[13]; // @[lib.scala 428:40]
  wire  _T_227 = _T_223 ? _T_225 : twos_comp_in[13]; // @[lib.scala 428:23]
  wire  _T_229 = |twos_comp_in[13:0]; // @[lib.scala 428:35]
  wire  _T_231 = ~twos_comp_in[14]; // @[lib.scala 428:40]
  wire  _T_233 = _T_229 ? _T_231 : twos_comp_in[14]; // @[lib.scala 428:23]
  wire  _T_235 = |twos_comp_in[14:0]; // @[lib.scala 428:35]
  wire  _T_237 = ~twos_comp_in[15]; // @[lib.scala 428:40]
  wire  _T_239 = _T_235 ? _T_237 : twos_comp_in[15]; // @[lib.scala 428:23]
  wire  _T_241 = |twos_comp_in[15:0]; // @[lib.scala 428:35]
  wire  _T_243 = ~twos_comp_in[16]; // @[lib.scala 428:40]
  wire  _T_245 = _T_241 ? _T_243 : twos_comp_in[16]; // @[lib.scala 428:23]
  wire  _T_247 = |twos_comp_in[16:0]; // @[lib.scala 428:35]
  wire  _T_249 = ~twos_comp_in[17]; // @[lib.scala 428:40]
  wire  _T_251 = _T_247 ? _T_249 : twos_comp_in[17]; // @[lib.scala 428:23]
  wire  _T_253 = |twos_comp_in[17:0]; // @[lib.scala 428:35]
  wire  _T_255 = ~twos_comp_in[18]; // @[lib.scala 428:40]
  wire  _T_257 = _T_253 ? _T_255 : twos_comp_in[18]; // @[lib.scala 428:23]
  wire  _T_259 = |twos_comp_in[18:0]; // @[lib.scala 428:35]
  wire  _T_261 = ~twos_comp_in[19]; // @[lib.scala 428:40]
  wire  _T_263 = _T_259 ? _T_261 : twos_comp_in[19]; // @[lib.scala 428:23]
  wire  _T_265 = |twos_comp_in[19:0]; // @[lib.scala 428:35]
  wire  _T_267 = ~twos_comp_in[20]; // @[lib.scala 428:40]
  wire  _T_269 = _T_265 ? _T_267 : twos_comp_in[20]; // @[lib.scala 428:23]
  wire  _T_271 = |twos_comp_in[20:0]; // @[lib.scala 428:35]
  wire  _T_273 = ~twos_comp_in[21]; // @[lib.scala 428:40]
  wire  _T_275 = _T_271 ? _T_273 : twos_comp_in[21]; // @[lib.scala 428:23]
  wire  _T_277 = |twos_comp_in[21:0]; // @[lib.scala 428:35]
  wire  _T_279 = ~twos_comp_in[22]; // @[lib.scala 428:40]
  wire  _T_281 = _T_277 ? _T_279 : twos_comp_in[22]; // @[lib.scala 428:23]
  wire  _T_283 = |twos_comp_in[22:0]; // @[lib.scala 428:35]
  wire  _T_285 = ~twos_comp_in[23]; // @[lib.scala 428:40]
  wire  _T_287 = _T_283 ? _T_285 : twos_comp_in[23]; // @[lib.scala 428:23]
  wire  _T_289 = |twos_comp_in[23:0]; // @[lib.scala 428:35]
  wire  _T_291 = ~twos_comp_in[24]; // @[lib.scala 428:40]
  wire  _T_293 = _T_289 ? _T_291 : twos_comp_in[24]; // @[lib.scala 428:23]
  wire  _T_295 = |twos_comp_in[24:0]; // @[lib.scala 428:35]
  wire  _T_297 = ~twos_comp_in[25]; // @[lib.scala 428:40]
  wire  _T_299 = _T_295 ? _T_297 : twos_comp_in[25]; // @[lib.scala 428:23]
  wire  _T_301 = |twos_comp_in[25:0]; // @[lib.scala 428:35]
  wire  _T_303 = ~twos_comp_in[26]; // @[lib.scala 428:40]
  wire  _T_305 = _T_301 ? _T_303 : twos_comp_in[26]; // @[lib.scala 428:23]
  wire  _T_307 = |twos_comp_in[26:0]; // @[lib.scala 428:35]
  wire  _T_309 = ~twos_comp_in[27]; // @[lib.scala 428:40]
  wire  _T_311 = _T_307 ? _T_309 : twos_comp_in[27]; // @[lib.scala 428:23]
  wire  _T_313 = |twos_comp_in[27:0]; // @[lib.scala 428:35]
  wire  _T_315 = ~twos_comp_in[28]; // @[lib.scala 428:40]
  wire  _T_317 = _T_313 ? _T_315 : twos_comp_in[28]; // @[lib.scala 428:23]
  wire  _T_319 = |twos_comp_in[28:0]; // @[lib.scala 428:35]
  wire  _T_321 = ~twos_comp_in[29]; // @[lib.scala 428:40]
  wire  _T_323 = _T_319 ? _T_321 : twos_comp_in[29]; // @[lib.scala 428:23]
  wire  _T_325 = |twos_comp_in[29:0]; // @[lib.scala 428:35]
  wire  _T_327 = ~twos_comp_in[30]; // @[lib.scala 428:40]
  wire  _T_329 = _T_325 ? _T_327 : twos_comp_in[30]; // @[lib.scala 428:23]
  wire  _T_331 = |twos_comp_in[30:0]; // @[lib.scala 428:35]
  wire  _T_333 = ~twos_comp_in[31]; // @[lib.scala 428:40]
  wire  _T_335 = _T_331 ? _T_333 : twos_comp_in[31]; // @[lib.scala 428:23]
  wire [6:0] _T_341 = {_T_191,_T_185,_T_179,_T_173,_T_167,_T_161,_T_155}; // @[lib.scala 430:14]
  wire [14:0] _T_349 = {_T_239,_T_233,_T_227,_T_221,_T_215,_T_209,_T_203,_T_197,_T_341}; // @[lib.scala 430:14]
  wire [7:0] _T_356 = {_T_287,_T_281,_T_275,_T_269,_T_263,_T_257,_T_251,_T_245}; // @[lib.scala 430:14]
  wire [30:0] _T_365 = {_T_335,_T_329,_T_323,_T_317,_T_311,_T_305,_T_299,_T_293,_T_356,_T_349}; // @[lib.scala 430:14]
  wire [31:0] twos_comp_out = {_T_365,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire  _T_367 = ~a_shift; // @[exu_div_ctl.scala 530:6]
  wire  _T_369 = _T_367 & _T_56; // @[exu_div_ctl.scala 530:15]
  wire [31:0] _T_372 = {a_ff[29:0],2'h0}; // @[Cat.scala 29:58]
  wire [63:0] ar_shifted = _T_61[63:0]; // @[exu_div_ctl.scala 505:28]
  wire [31:0] _T_374 = _T_369 ? io_dividend_in : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_375 = a_shift ? _T_372 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_376 = shortq_enable_ff ? ar_shifted[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_377 = _T_374 | _T_375; // @[Mux.scala 27:72]
  wire [31:0] a_in = _T_377 | _T_376; // @[Mux.scala 27:72]
  wire  _T_379 = ~b_twos_comp; // @[exu_div_ctl.scala 536:5]
  wire  _T_381 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 536:63]
  wire [32:0] _T_383 = {_T_381,io_divisor_in}; // @[Cat.scala 29:58]
  wire  _T_384 = ~control_ff[1]; // @[exu_div_ctl.scala 537:49]
  wire [32:0] _T_386 = {_T_384,_T_365,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_387 = _T_379 ? _T_383 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_388 = b_twos_comp ? _T_386 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] b_in = _T_387 | _T_388; // @[Mux.scala 27:72]
  wire [31:0] _T_392 = {r_ff[29:0],a_ff[31:30]}; // @[Cat.scala 29:58]
  wire [31:0] _T_397 = r_sign_sel ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_398 = r_restore_sel ? _T_392 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_399 = r_adder1_sel ? adder1_out[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_400 = r_adder2_sel ? adder2_out[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_401 = r_adder3_sel ? adder3_out[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_402 = shortq_enable_ff ? ar_shifted[63:32] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_403 = by_zero_case ? a_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = _T_397 | _T_398; // @[Mux.scala 27:72]
  wire [31:0] _T_405 = _T_404 | _T_399; // @[Mux.scala 27:72]
  wire [31:0] _T_406 = _T_405 | _T_400; // @[Mux.scala 27:72]
  wire [31:0] _T_407 = _T_406 | _T_401; // @[Mux.scala 27:72]
  wire [31:0] _T_408 = _T_407 | _T_402; // @[Mux.scala 27:72]
  wire [31:0] r_in = _T_408 | _T_403; // @[Mux.scala 27:72]
  wire [31:0] _T_412 = {q_ff[29:0],_T_137,_T_143}; // @[Cat.scala 29:58]
  wire [31:0] _T_415 = _T_66 ? _T_412 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_417 = by_zero_case ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] q_in = _T_415 | _T_417; // @[Mux.scala 27:72]
  wire  _T_423 = ~twos_comp_q_sel; // @[exu_div_ctl.scala 555:16]
  wire  _T_424 = _T_27 & _T_423; // @[exu_div_ctl.scala 555:14]
  wire [31:0] _T_426 = _T_424 ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_427 = control_ff[0] ? r_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_428 = twos_comp_q_sel ? twos_comp_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_429 = _T_426 | _T_427; // @[Mux.scala 27:72]
  wire [4:0] _T_911 = 5'h1f - shortq[4:0]; // @[exu_div_ctl.scala 595:57]
  wire [4:0] shortq_shift = _T_46 ? 5'h0 : _T_911; // @[exu_div_ctl.scala 595:25]
  exu_div_cls a_enc ( // @[exu_div_ctl.scala 584:21]
    .io_operand(a_enc_io_operand),
    .io_cls(a_enc_io_cls)
  );
  exu_div_cls b_enc ( // @[exu_div_ctl.scala 587:21]
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
  assign io_data_out = _T_429 | _T_428; // @[exu_div_ctl.scala 554:15]
  assign io_valid_out = finish_ff & _T; // @[exu_div_ctl.scala 553:16]
  assign a_enc_io_operand = {control_ff[2],a_ff}; // @[exu_div_ctl.scala 585:20]
  assign b_enc_io_operand = b_ff[32:0]; // @[exu_div_ctl.scala 588:20]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_1_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_2_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_3_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_4_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_5_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_6_io_en = _T_35 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_7_io_en = io_valid_in | running_state; // @[lib.scala 393:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_8_io_en = io_valid_in | b_twos_comp; // @[lib.scala 393:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_9_io_en = _T_33 | running_state; // @[lib.scala 393:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_10_io_en = _T_33 | running_state; // @[lib.scala 393:17]
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
  _RAND_3 = {1{`RANDOM}};
  a_ff = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  count_ff = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  shortq_enable_ff = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  finish_ff = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  shortq_shift_ff = _RAND_7[3:0];
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
    b_ff1 = 33'h0;
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
    shortq_shift_ff = 4'h0;
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
      shortq_shift_ff <= 4'h0;
    end else if (misc_enable) begin
      shortq_shift_ff <= shortq_shift[4:1];
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
