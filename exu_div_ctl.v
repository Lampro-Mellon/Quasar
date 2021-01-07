module exu_div_cls(
  input  [32:0] io_operand,
  output [4:0]  io_cls
);
  wire  _T_3 = io_operand[31:30] == 2'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_5 = io_operand[31:29] == 3'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_7 = io_operand[31:28] == 4'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_9 = io_operand[31:27] == 5'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_11 = io_operand[31:26] == 6'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_13 = io_operand[31:25] == 7'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_15 = io_operand[31:24] == 8'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_17 = io_operand[31:23] == 9'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_19 = io_operand[31:22] == 10'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_21 = io_operand[31:21] == 11'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_23 = io_operand[31:20] == 12'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_25 = io_operand[31:19] == 13'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_27 = io_operand[31:18] == 14'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_29 = io_operand[31:17] == 15'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_31 = io_operand[31:16] == 16'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_33 = io_operand[31:15] == 17'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_35 = io_operand[31:14] == 18'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_37 = io_operand[31:13] == 19'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_39 = io_operand[31:12] == 20'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_41 = io_operand[31:11] == 21'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_43 = io_operand[31:10] == 22'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_45 = io_operand[31:9] == 23'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_47 = io_operand[31:8] == 24'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_49 = io_operand[31:7] == 25'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_51 = io_operand[31:6] == 26'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_53 = io_operand[31:5] == 27'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_55 = io_operand[31:4] == 28'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_57 = io_operand[31:3] == 29'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_59 = io_operand[31:2] == 30'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_61 = io_operand[31:1] == 31'h1; // @[exu_div_ctl.scala 956:63]
  wire  _T_63 = io_operand[31:0] == 32'h1; // @[exu_div_ctl.scala 956:63]
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
  wire  _T_129 = io_operand[31:0] == 32'hffffffff; // @[exu_div_ctl.scala 958:25]
  wire  _T_137 = io_operand[31:29] == 3'h6; // @[exu_div_ctl.scala 959:76]
  wire  _T_142 = io_operand[31:28] == 4'he; // @[exu_div_ctl.scala 959:76]
  wire  _T_147 = io_operand[31:27] == 5'h1e; // @[exu_div_ctl.scala 959:76]
  wire  _T_152 = io_operand[31:26] == 6'h3e; // @[exu_div_ctl.scala 959:76]
  wire  _T_157 = io_operand[31:25] == 7'h7e; // @[exu_div_ctl.scala 959:76]
  wire  _T_162 = io_operand[31:24] == 8'hfe; // @[exu_div_ctl.scala 959:76]
  wire  _T_167 = io_operand[31:23] == 9'h1fe; // @[exu_div_ctl.scala 959:76]
  wire  _T_172 = io_operand[31:22] == 10'h3fe; // @[exu_div_ctl.scala 959:76]
  wire  _T_177 = io_operand[31:21] == 11'h7fe; // @[exu_div_ctl.scala 959:76]
  wire  _T_182 = io_operand[31:20] == 12'hffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_187 = io_operand[31:19] == 13'h1ffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_192 = io_operand[31:18] == 14'h3ffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_197 = io_operand[31:17] == 15'h7ffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_202 = io_operand[31:16] == 16'hfffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_207 = io_operand[31:15] == 17'h1fffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_212 = io_operand[31:14] == 18'h3fffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_217 = io_operand[31:13] == 19'h7fffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_222 = io_operand[31:12] == 20'hffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_227 = io_operand[31:11] == 21'h1ffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_232 = io_operand[31:10] == 22'h3ffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_237 = io_operand[31:9] == 23'h7ffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_242 = io_operand[31:8] == 24'hfffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_247 = io_operand[31:7] == 25'h1fffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_252 = io_operand[31:6] == 26'h3fffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_257 = io_operand[31:5] == 27'h7fffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_262 = io_operand[31:4] == 28'hffffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_267 = io_operand[31:3] == 29'h1ffffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_272 = io_operand[31:2] == 30'h3ffffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_277 = io_operand[31:1] == 31'h7ffffffe; // @[exu_div_ctl.scala 959:76]
  wire  _T_282 = io_operand[31:0] == 32'hfffffffe; // @[exu_div_ctl.scala 959:76]
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
  wire [4:0] cls_ones = _T_129 ? 5'h1f : _T_344; // @[exu_div_ctl.scala 958:44]
  assign io_cls = io_operand[32] ? cls_ones : cls_zeros; // @[exu_div_ctl.scala 960:10]
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
module exu_div_new_4bit_fullshortq(
  input         clock,
  input         reset,
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
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] a_enc_io_operand; // @[exu_div_ctl.scala 919:21]
  wire [4:0] a_enc_io_cls; // @[exu_div_ctl.scala 919:21]
  wire [32:0] b_enc_io_operand; // @[exu_div_ctl.scala 922:21]
  wire [4:0] b_enc_io_cls; // @[exu_div_ctl.scala 922:21]
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
  wire  _T = ~io_cancel; // @[exu_div_ctl.scala 777:35]
  wire  valid_ff_in = io_valid_in & _T; // @[exu_div_ctl.scala 777:33]
  wire  _T_1 = ~io_valid_in; // @[exu_div_ctl.scala 778:35]
  reg [2:0] control_ff; // @[Reg.scala 27:20]
  wire  _T_3 = _T_1 & control_ff[2]; // @[exu_div_ctl.scala 778:48]
  wire  _T_4 = io_valid_in & io_signed_in; // @[exu_div_ctl.scala 778:80]
  wire  _T_6 = _T_4 & io_dividend_in[31]; // @[exu_div_ctl.scala 778:96]
  wire  _T_7 = _T_3 | _T_6; // @[exu_div_ctl.scala 778:65]
  wire  _T_10 = _T_1 & control_ff[1]; // @[exu_div_ctl.scala 778:133]
  wire  _T_13 = _T_4 & io_divisor_in[31]; // @[exu_div_ctl.scala 778:181]
  wire  _T_14 = _T_10 | _T_13; // @[exu_div_ctl.scala 778:150]
  wire  _T_17 = _T_1 & control_ff[0]; // @[exu_div_ctl.scala 778:218]
  wire  _T_18 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 778:250]
  wire  _T_19 = _T_17 | _T_18; // @[exu_div_ctl.scala 778:235]
  wire [2:0] control_in = {_T_7,_T_14,_T_19}; // @[Cat.scala 29:58]
  reg [32:0] b_ff1; // @[Reg.scala 27:20]
  wire [37:0] b_ff = {b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1}; // @[Cat.scala 29:58]
  wire  _T_22 = b_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 782:54]
  reg  valid_ff; // @[Reg.scala 27:20]
  wire  by_zero_case = valid_ff & _T_22; // @[exu_div_ctl.scala 782:40]
  reg [31:0] a_ff; // @[Reg.scala 27:20]
  wire  _T_24 = a_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 784:37]
  wire  _T_26 = b_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 784:60]
  wire  _T_27 = _T_24 & _T_26; // @[exu_div_ctl.scala 784:46]
  wire  _T_28 = ~by_zero_case; // @[exu_div_ctl.scala 784:71]
  wire  _T_29 = _T_27 & _T_28; // @[exu_div_ctl.scala 784:69]
  wire  _T_30 = ~control_ff[0]; // @[exu_div_ctl.scala 784:87]
  wire  _T_31 = _T_29 & _T_30; // @[exu_div_ctl.scala 784:85]
  wire  _T_32 = _T_31 & valid_ff; // @[exu_div_ctl.scala 784:95]
  wire  _T_34 = _T_32 & _T; // @[exu_div_ctl.scala 784:106]
  wire  _T_36 = a_ff == 32'h0; // @[exu_div_ctl.scala 785:18]
  wire  _T_38 = _T_36 & _T_28; // @[exu_div_ctl.scala 785:27]
  wire  _T_40 = _T_38 & _T_30; // @[exu_div_ctl.scala 785:43]
  wire  _T_41 = _T_40 & valid_ff; // @[exu_div_ctl.scala 785:53]
  wire  _T_43 = _T_41 & _T; // @[exu_div_ctl.scala 785:64]
  wire  smallnum_case = _T_34 | _T_43; // @[exu_div_ctl.scala 784:120]
  reg [6:0] count_ff; // @[Reg.scala 27:20]
  wire  _T_44 = |count_ff; // @[exu_div_ctl.scala 786:42]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  running_state = _T_44 | shortq_enable_ff; // @[exu_div_ctl.scala 786:45]
  wire  _T_45 = io_valid_in | valid_ff; // @[exu_div_ctl.scala 787:43]
  wire  _T_46 = _T_45 | io_cancel; // @[exu_div_ctl.scala 787:54]
  wire  _T_47 = _T_46 | running_state; // @[exu_div_ctl.scala 787:66]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  misc_enable = _T_47 | finish_ff; // @[exu_div_ctl.scala 787:82]
  wire  _T_48 = smallnum_case | by_zero_case; // @[exu_div_ctl.scala 788:45]
  wire  _T_49 = count_ff == 7'h20; // @[exu_div_ctl.scala 788:72]
  wire  finish_raw = _T_48 | _T_49; // @[exu_div_ctl.scala 788:60]
  wire  finish = finish_raw & _T; // @[exu_div_ctl.scala 789:41]
  wire  _T_51 = valid_ff | running_state; // @[exu_div_ctl.scala 790:40]
  wire  _T_52 = ~finish; // @[exu_div_ctl.scala 790:59]
  wire  _T_53 = _T_51 & _T_52; // @[exu_div_ctl.scala 790:57]
  wire  _T_54 = ~finish_ff; // @[exu_div_ctl.scala 790:69]
  wire  _T_55 = _T_53 & _T_54; // @[exu_div_ctl.scala 790:67]
  wire  _T_57 = _T_55 & _T; // @[exu_div_ctl.scala 790:80]
  wire [6:0] _T_1376 = {1'h0,1'h0,b_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1377 = {1'h0,1'h0,a_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1379 = _T_1376 - _T_1377; // @[exu_div_ctl.scala 927:41]
  wire [6:0] dw_shortq_raw = _T_1379 + 7'h1; // @[exu_div_ctl.scala 927:61]
  wire [5:0] shortq = dw_shortq_raw[6] ? 6'h0 : dw_shortq_raw[5:0]; // @[exu_div_ctl.scala 928:19]
  wire  _T_1385 = ~shortq[5]; // @[exu_div_ctl.scala 929:31]
  wire  _T_1386 = valid_ff & _T_1385; // @[exu_div_ctl.scala 929:29]
  wire  _T_1388 = shortq[4:2] == 3'h7; // @[exu_div_ctl.scala 929:58]
  wire  _T_1389 = ~_T_1388; // @[exu_div_ctl.scala 929:44]
  wire  _T_1390 = _T_1386 & _T_1389; // @[exu_div_ctl.scala 929:42]
  wire  shortq_enable = _T_1390 & _T; // @[exu_div_ctl.scala 929:73]
  wire  _T_58 = ~shortq_enable; // @[exu_div_ctl.scala 790:95]
  wire  count_enable = _T_57 & _T_58; // @[exu_div_ctl.scala 790:93]
  wire [6:0] _T_60 = count_enable ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_62 = count_ff + 7'h4; // @[exu_div_ctl.scala 791:63]
  reg [4:0] shortq_shift_ff; // @[Reg.scala 27:20]
  wire [6:0] _T_63 = {2'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [6:0] _T_65 = _T_62 + _T_63; // @[exu_div_ctl.scala 791:74]
  wire [6:0] count_in = _T_60 & _T_65; // @[exu_div_ctl.scala 791:51]
  wire  a_enable = io_valid_in | running_state; // @[exu_div_ctl.scala 792:43]
  wire  _T_66 = ~shortq_enable_ff; // @[exu_div_ctl.scala 793:47]
  wire  a_shift = running_state & _T_66; // @[exu_div_ctl.scala 793:45]
  wire [32:0] _T_68 = control_ff[2] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire [64:0] _T_70 = {_T_68,a_ff}; // @[Cat.scala 29:58]
  wire [95:0] _GEN_11 = {{31'd0}, _T_70}; // @[exu_div_ctl.scala 794:74]
  wire [95:0] _T_71 = _GEN_11 << shortq_shift_ff; // @[exu_div_ctl.scala 794:74]
  wire  _T_72 = control_ff[2] ^ control_ff[1]; // @[exu_div_ctl.scala 795:61]
  wire  _T_73 = ~_T_72; // @[exu_div_ctl.scala 795:42]
  wire  b_twos_comp = valid_ff & _T_73; // @[exu_div_ctl.scala 795:40]
  wire  _T_76 = ~valid_ff; // @[exu_div_ctl.scala 797:30]
  wire  _T_78 = _T_76 & _T_30; // @[exu_div_ctl.scala 797:40]
  wire  _T_80 = _T_78 & _T_72; // @[exu_div_ctl.scala 797:50]
  reg  by_zero_case_ff; // @[Reg.scala 27:20]
  wire  _T_81 = ~by_zero_case_ff; // @[exu_div_ctl.scala 797:92]
  wire  twos_comp_q_sel = _T_80 & _T_81; // @[exu_div_ctl.scala 797:90]
  wire  b_enable = io_valid_in | b_twos_comp; // @[exu_div_ctl.scala 798:43]
  wire  rq_enable = _T_45 | running_state; // @[exu_div_ctl.scala 799:54]
  wire  _T_83 = valid_ff & control_ff[2]; // @[exu_div_ctl.scala 800:40]
  wire  r_sign_sel = _T_83 & _T_28; // @[exu_div_ctl.scala 800:59]
  reg [32:0] r_ff; // @[Reg.scala 27:20]
  wire [37:0] _T_287 = {r_ff[32],r_ff,a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [37:0] _T_289 = {b_ff[34:0],3'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_291 = _T_287 + _T_289; // @[exu_div_ctl.scala 816:58]
  wire [37:0] _T_293 = {b_ff[35:0],2'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_295 = _T_291 + _T_293; // @[exu_div_ctl.scala 816:85]
  wire [37:0] _T_297 = {b_ff[36:0],1'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_299 = _T_295 + _T_297; // @[exu_div_ctl.scala 816:112]
  wire [37:0] adder15_out = _T_299 + b_ff; // @[exu_div_ctl.scala 816:134]
  wire  _T_302 = ~adder15_out[37]; // @[exu_div_ctl.scala 819:6]
  wire  _T_303 = _T_302 ^ control_ff[2]; // @[exu_div_ctl.scala 819:23]
  wire  _T_305 = a_ff[27:0] == 28'h0; // @[exu_div_ctl.scala 819:58]
  wire  _T_306 = adder15_out == 38'h0; // @[exu_div_ctl.scala 819:82]
  wire  _T_307 = _T_305 & _T_306; // @[exu_div_ctl.scala 819:67]
  wire  _T_308 = _T_303 | _T_307; // @[exu_div_ctl.scala 819:43]
  wire  _T_310 = ~_T_299[37]; // @[exu_div_ctl.scala 820:6]
  wire  _T_311 = _T_310 ^ control_ff[2]; // @[exu_div_ctl.scala 820:23]
  wire  _T_314 = _T_299 == 38'h0; // @[exu_div_ctl.scala 820:82]
  wire  _T_315 = _T_305 & _T_314; // @[exu_div_ctl.scala 820:67]
  wire  _T_316 = _T_311 | _T_315; // @[exu_div_ctl.scala 820:43]
  wire [37:0] adder13_out = _T_295 + b_ff; // @[exu_div_ctl.scala 814:112]
  wire  _T_318 = ~adder13_out[37]; // @[exu_div_ctl.scala 821:6]
  wire  _T_319 = _T_318 ^ control_ff[2]; // @[exu_div_ctl.scala 821:23]
  wire  _T_322 = adder13_out == 38'h0; // @[exu_div_ctl.scala 821:82]
  wire  _T_323 = _T_305 & _T_322; // @[exu_div_ctl.scala 821:67]
  wire  _T_324 = _T_319 | _T_323; // @[exu_div_ctl.scala 821:43]
  wire  _T_326 = ~_T_295[37]; // @[exu_div_ctl.scala 822:6]
  wire  _T_327 = _T_326 ^ control_ff[2]; // @[exu_div_ctl.scala 822:23]
  wire  _T_330 = _T_295 == 38'h0; // @[exu_div_ctl.scala 822:82]
  wire  _T_331 = _T_305 & _T_330; // @[exu_div_ctl.scala 822:67]
  wire  _T_332 = _T_327 | _T_331; // @[exu_div_ctl.scala 822:43]
  wire [37:0] _T_239 = _T_291 + _T_297; // @[exu_div_ctl.scala 812:85]
  wire [37:0] adder11_out = _T_239 + b_ff; // @[exu_div_ctl.scala 812:107]
  wire  _T_334 = ~adder11_out[37]; // @[exu_div_ctl.scala 823:6]
  wire  _T_335 = _T_334 ^ control_ff[2]; // @[exu_div_ctl.scala 823:23]
  wire  _T_338 = adder11_out == 38'h0; // @[exu_div_ctl.scala 823:82]
  wire  _T_339 = _T_305 & _T_338; // @[exu_div_ctl.scala 823:67]
  wire  _T_340 = _T_335 | _T_339; // @[exu_div_ctl.scala 823:43]
  wire  _T_342 = ~_T_239[37]; // @[exu_div_ctl.scala 824:6]
  wire  _T_343 = _T_342 ^ control_ff[2]; // @[exu_div_ctl.scala 824:23]
  wire  _T_346 = _T_239 == 38'h0; // @[exu_div_ctl.scala 824:82]
  wire  _T_347 = _T_305 & _T_346; // @[exu_div_ctl.scala 824:67]
  wire  _T_348 = _T_343 | _T_347; // @[exu_div_ctl.scala 824:43]
  wire [37:0] adder9_out = _T_291 + b_ff; // @[exu_div_ctl.scala 810:85]
  wire  _T_350 = ~adder9_out[37]; // @[exu_div_ctl.scala 825:6]
  wire  _T_351 = _T_350 ^ control_ff[2]; // @[exu_div_ctl.scala 825:22]
  wire  _T_354 = adder9_out == 38'h0; // @[exu_div_ctl.scala 825:80]
  wire  _T_355 = _T_305 & _T_354; // @[exu_div_ctl.scala 825:66]
  wire  _T_356 = _T_351 | _T_355; // @[exu_div_ctl.scala 825:42]
  wire  _T_358 = ~_T_291[37]; // @[exu_div_ctl.scala 826:6]
  wire  _T_359 = _T_358 ^ control_ff[2]; // @[exu_div_ctl.scala 826:22]
  wire  _T_362 = _T_291 == 38'h0; // @[exu_div_ctl.scala 826:80]
  wire  _T_363 = _T_305 & _T_362; // @[exu_div_ctl.scala 826:66]
  wire  _T_364 = _T_359 | _T_363; // @[exu_div_ctl.scala 826:42]
  wire [37:0] _T_191 = _T_287 + _T_293; // @[exu_div_ctl.scala 808:58]
  wire [37:0] _T_195 = _T_191 + _T_297; // @[exu_div_ctl.scala 808:85]
  wire [37:0] adder7_out = _T_195 + b_ff; // @[exu_div_ctl.scala 808:107]
  wire  _T_366 = ~adder7_out[37]; // @[exu_div_ctl.scala 827:6]
  wire  _T_367 = _T_366 ^ control_ff[2]; // @[exu_div_ctl.scala 827:22]
  wire  _T_370 = adder7_out == 38'h0; // @[exu_div_ctl.scala 827:80]
  wire  _T_371 = _T_305 & _T_370; // @[exu_div_ctl.scala 827:66]
  wire  _T_372 = _T_367 | _T_371; // @[exu_div_ctl.scala 827:42]
  wire  _T_374 = ~_T_195[37]; // @[exu_div_ctl.scala 828:6]
  wire  _T_375 = _T_374 ^ control_ff[2]; // @[exu_div_ctl.scala 828:22]
  wire  _T_378 = _T_195 == 38'h0; // @[exu_div_ctl.scala 828:80]
  wire  _T_379 = _T_305 & _T_378; // @[exu_div_ctl.scala 828:66]
  wire  _T_380 = _T_375 | _T_379; // @[exu_div_ctl.scala 828:42]
  wire [37:0] adder5_out = _T_191 + b_ff; // @[exu_div_ctl.scala 806:85]
  wire  _T_382 = ~adder5_out[37]; // @[exu_div_ctl.scala 829:6]
  wire  _T_383 = _T_382 ^ control_ff[2]; // @[exu_div_ctl.scala 829:22]
  wire  _T_386 = adder5_out == 38'h0; // @[exu_div_ctl.scala 829:80]
  wire  _T_387 = _T_305 & _T_386; // @[exu_div_ctl.scala 829:66]
  wire  _T_388 = _T_383 | _T_387; // @[exu_div_ctl.scala 829:42]
  wire  _T_390 = ~_T_191[37]; // @[exu_div_ctl.scala 830:6]
  wire  _T_391 = _T_390 ^ control_ff[2]; // @[exu_div_ctl.scala 830:22]
  wire  _T_394 = _T_191 == 38'h0; // @[exu_div_ctl.scala 830:80]
  wire  _T_395 = _T_305 & _T_394; // @[exu_div_ctl.scala 830:66]
  wire  _T_396 = _T_391 | _T_395; // @[exu_div_ctl.scala 830:42]
  wire [36:0] _T_146 = {r_ff,a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [36:0] _T_148 = {b_ff[35:0],1'h0}; // @[Cat.scala 29:58]
  wire [36:0] _T_150 = _T_146 + _T_148; // @[exu_div_ctl.scala 804:48]
  wire [36:0] adder3_out = _T_150 + b_ff[36:0]; // @[exu_div_ctl.scala 804:70]
  wire  _T_398 = ~adder3_out[36]; // @[exu_div_ctl.scala 831:6]
  wire  _T_399 = _T_398 ^ control_ff[2]; // @[exu_div_ctl.scala 831:22]
  wire  _T_402 = adder3_out == 37'h0; // @[exu_div_ctl.scala 831:80]
  wire  _T_403 = _T_305 & _T_402; // @[exu_div_ctl.scala 831:66]
  wire  _T_404 = _T_399 | _T_403; // @[exu_div_ctl.scala 831:42]
  wire [35:0] _T_140 = {r_ff[31:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [35:0] _T_142 = {b_ff[34:0],1'h0}; // @[Cat.scala 29:58]
  wire [35:0] adder2_out = _T_140 + _T_142; // @[exu_div_ctl.scala 803:48]
  wire  _T_406 = ~adder2_out[35]; // @[exu_div_ctl.scala 832:6]
  wire  _T_407 = _T_406 ^ control_ff[2]; // @[exu_div_ctl.scala 832:22]
  wire  _T_410 = adder2_out == 36'h0; // @[exu_div_ctl.scala 832:80]
  wire  _T_411 = _T_305 & _T_410; // @[exu_div_ctl.scala 832:66]
  wire  _T_412 = _T_407 | _T_411; // @[exu_div_ctl.scala 832:42]
  wire [34:0] _T_135 = {r_ff[30:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [34:0] adder1_out = _T_135 + b_ff[34:0]; // @[exu_div_ctl.scala 802:48]
  wire  _T_414 = ~adder1_out[34]; // @[exu_div_ctl.scala 833:6]
  wire  _T_415 = _T_414 ^ control_ff[2]; // @[exu_div_ctl.scala 833:22]
  wire  _T_418 = adder1_out == 35'h0; // @[exu_div_ctl.scala 833:80]
  wire  _T_419 = _T_305 & _T_418; // @[exu_div_ctl.scala 833:66]
  wire  _T_420 = _T_415 | _T_419; // @[exu_div_ctl.scala 833:42]
  wire [7:0] _T_427 = {_T_372,_T_380,_T_388,_T_396,_T_404,_T_412,_T_420,1'h0}; // @[Cat.scala 29:58]
  wire [15:0] quotient_raw = {_T_308,_T_316,_T_324,_T_332,_T_340,_T_348,_T_356,_T_364,_T_427}; // @[Cat.scala 29:58]
  wire  _T_439 = quotient_raw[15:8] == 8'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_444 = quotient_raw[15:9] == 7'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_477 = _T_439 | _T_444; // @[Mux.scala 27:72]
  wire  _T_449 = quotient_raw[15:10] == 6'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_478 = _T_477 | _T_449; // @[Mux.scala 27:72]
  wire  _T_454 = quotient_raw[15:11] == 5'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_479 = _T_478 | _T_454; // @[Mux.scala 27:72]
  wire  _T_459 = quotient_raw[15:12] == 4'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_480 = _T_479 | _T_459; // @[Mux.scala 27:72]
  wire  _T_464 = quotient_raw[15:13] == 3'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_481 = _T_480 | _T_464; // @[Mux.scala 27:72]
  wire  _T_468 = quotient_raw[15:14] == 2'h1; // @[exu_div_ctl.scala 836:49]
  wire  _T_482 = _T_481 | _T_468; // @[Mux.scala 27:72]
  wire  _T_486 = _T_482 | quotient_raw[15]; // @[exu_div_ctl.scala 836:94]
  wire  _T_488 = quotient_raw[15:4] == 12'h1; // @[exu_div_ctl.scala 838:26]
  wire  _T_490 = quotient_raw[15:5] == 11'h1; // @[exu_div_ctl.scala 838:77]
  wire  _T_491 = _T_488 | _T_490; // @[exu_div_ctl.scala 838:54]
  wire  _T_493 = quotient_raw[15:6] == 10'h1; // @[exu_div_ctl.scala 838:128]
  wire  _T_494 = _T_491 | _T_493; // @[exu_div_ctl.scala 838:105]
  wire  _T_496 = quotient_raw[15:7] == 9'h1; // @[exu_div_ctl.scala 839:28]
  wire  _T_497 = _T_494 | _T_496; // @[exu_div_ctl.scala 838:155]
  wire  _T_500 = _T_497 | _T_459; // @[exu_div_ctl.scala 839:53]
  wire  _T_503 = _T_500 | _T_464; // @[exu_div_ctl.scala 839:96]
  wire  _T_506 = _T_503 | _T_468; // @[exu_div_ctl.scala 839:138]
  wire  _T_509 = _T_506 | quotient_raw[15]; // @[exu_div_ctl.scala 840:46]
  wire  _T_511 = quotient_raw[15:2] == 14'h1; // @[exu_div_ctl.scala 842:26]
  wire  _T_513 = quotient_raw[15:3] == 13'h1; // @[exu_div_ctl.scala 842:79]
  wire  _T_514 = _T_511 | _T_513; // @[exu_div_ctl.scala 842:56]
  wire  _T_517 = _T_514 | _T_493; // @[exu_div_ctl.scala 842:109]
  wire  _T_520 = _T_517 | _T_496; // @[exu_div_ctl.scala 842:159]
  wire  _T_523 = _T_520 | _T_449; // @[exu_div_ctl.scala 843:55]
  wire  _T_526 = _T_523 | _T_454; // @[exu_div_ctl.scala 843:100]
  wire  _T_529 = _T_526 | _T_468; // @[exu_div_ctl.scala 843:144]
  wire  _T_532 = _T_529 | quotient_raw[15]; // @[exu_div_ctl.scala 844:48]
  wire  _T_536 = quotient_raw[15:1] == 15'h1; // @[exu_div_ctl.scala 846:54]
  wire  _T_575 = _T_536 | _T_513; // @[Mux.scala 27:72]
  wire  _T_576 = _T_575 | _T_490; // @[Mux.scala 27:72]
  wire  _T_577 = _T_576 | _T_496; // @[Mux.scala 27:72]
  wire  _T_578 = _T_577 | _T_444; // @[Mux.scala 27:72]
  wire  _T_579 = _T_578 | _T_454; // @[Mux.scala 27:72]
  wire  _T_580 = _T_579 | _T_464; // @[Mux.scala 27:72]
  wire  _T_584 = _T_580 | quotient_raw[15]; // @[exu_div_ctl.scala 846:99]
  wire [3:0] quotient_new = {_T_486,_T_509,_T_532,_T_584}; // @[Cat.scala 29:58]
  wire  _T_85 = quotient_new == 4'h0; // @[exu_div_ctl.scala 801:71]
  wire  _T_86 = running_state & _T_85; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_0 = _T_86 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_88 = quotient_new == 4'h1; // @[exu_div_ctl.scala 801:71]
  wire  _T_89 = running_state & _T_88; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_1 = _T_89 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_91 = quotient_new == 4'h2; // @[exu_div_ctl.scala 801:71]
  wire  _T_92 = running_state & _T_91; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_2 = _T_92 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_94 = quotient_new == 4'h3; // @[exu_div_ctl.scala 801:71]
  wire  _T_95 = running_state & _T_94; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_3 = _T_95 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_97 = quotient_new == 4'h4; // @[exu_div_ctl.scala 801:71]
  wire  _T_98 = running_state & _T_97; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_4 = _T_98 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_100 = quotient_new == 4'h5; // @[exu_div_ctl.scala 801:71]
  wire  _T_101 = running_state & _T_100; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_5 = _T_101 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_103 = quotient_new == 4'h6; // @[exu_div_ctl.scala 801:71]
  wire  _T_104 = running_state & _T_103; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_6 = _T_104 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_106 = quotient_new == 4'h7; // @[exu_div_ctl.scala 801:71]
  wire  _T_107 = running_state & _T_106; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_7 = _T_107 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_109 = quotient_new == 4'h8; // @[exu_div_ctl.scala 801:71]
  wire  _T_110 = running_state & _T_109; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_8 = _T_110 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_112 = quotient_new == 4'h9; // @[exu_div_ctl.scala 801:71]
  wire  _T_113 = running_state & _T_112; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_9 = _T_113 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_115 = quotient_new == 4'ha; // @[exu_div_ctl.scala 801:71]
  wire  _T_116 = running_state & _T_115; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_10 = _T_116 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_118 = quotient_new == 4'hb; // @[exu_div_ctl.scala 801:71]
  wire  _T_119 = running_state & _T_118; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_11 = _T_119 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_121 = quotient_new == 4'hc; // @[exu_div_ctl.scala 801:71]
  wire  _T_122 = running_state & _T_121; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_12 = _T_122 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_124 = quotient_new == 4'hd; // @[exu_div_ctl.scala 801:71]
  wire  _T_125 = running_state & _T_124; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_13 = _T_125 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_127 = quotient_new == 4'he; // @[exu_div_ctl.scala 801:71]
  wire  _T_128 = running_state & _T_127; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_14 = _T_128 & _T_66; // @[exu_div_ctl.scala 801:85]
  wire  _T_130 = quotient_new == 4'hf; // @[exu_div_ctl.scala 801:71]
  wire  _T_131 = running_state & _T_130; // @[exu_div_ctl.scala 801:55]
  wire  r_adder_sel_15 = _T_131 & _T_66; // @[exu_div_ctl.scala 801:85]
  reg [31:0] q_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_589 = twos_comp_q_sel ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_590 = b_twos_comp ? b_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] twos_comp_in = _T_589 | _T_590; // @[Mux.scala 27:72]
  wire  _T_594 = |twos_comp_in[0]; // @[lib.scala 428:35]
  wire  _T_596 = ~twos_comp_in[1]; // @[lib.scala 428:40]
  wire  _T_598 = _T_594 ? _T_596 : twos_comp_in[1]; // @[lib.scala 428:23]
  wire  _T_600 = |twos_comp_in[1:0]; // @[lib.scala 428:35]
  wire  _T_602 = ~twos_comp_in[2]; // @[lib.scala 428:40]
  wire  _T_604 = _T_600 ? _T_602 : twos_comp_in[2]; // @[lib.scala 428:23]
  wire  _T_606 = |twos_comp_in[2:0]; // @[lib.scala 428:35]
  wire  _T_608 = ~twos_comp_in[3]; // @[lib.scala 428:40]
  wire  _T_610 = _T_606 ? _T_608 : twos_comp_in[3]; // @[lib.scala 428:23]
  wire  _T_612 = |twos_comp_in[3:0]; // @[lib.scala 428:35]
  wire  _T_614 = ~twos_comp_in[4]; // @[lib.scala 428:40]
  wire  _T_616 = _T_612 ? _T_614 : twos_comp_in[4]; // @[lib.scala 428:23]
  wire  _T_618 = |twos_comp_in[4:0]; // @[lib.scala 428:35]
  wire  _T_620 = ~twos_comp_in[5]; // @[lib.scala 428:40]
  wire  _T_622 = _T_618 ? _T_620 : twos_comp_in[5]; // @[lib.scala 428:23]
  wire  _T_624 = |twos_comp_in[5:0]; // @[lib.scala 428:35]
  wire  _T_626 = ~twos_comp_in[6]; // @[lib.scala 428:40]
  wire  _T_628 = _T_624 ? _T_626 : twos_comp_in[6]; // @[lib.scala 428:23]
  wire  _T_630 = |twos_comp_in[6:0]; // @[lib.scala 428:35]
  wire  _T_632 = ~twos_comp_in[7]; // @[lib.scala 428:40]
  wire  _T_634 = _T_630 ? _T_632 : twos_comp_in[7]; // @[lib.scala 428:23]
  wire  _T_636 = |twos_comp_in[7:0]; // @[lib.scala 428:35]
  wire  _T_638 = ~twos_comp_in[8]; // @[lib.scala 428:40]
  wire  _T_640 = _T_636 ? _T_638 : twos_comp_in[8]; // @[lib.scala 428:23]
  wire  _T_642 = |twos_comp_in[8:0]; // @[lib.scala 428:35]
  wire  _T_644 = ~twos_comp_in[9]; // @[lib.scala 428:40]
  wire  _T_646 = _T_642 ? _T_644 : twos_comp_in[9]; // @[lib.scala 428:23]
  wire  _T_648 = |twos_comp_in[9:0]; // @[lib.scala 428:35]
  wire  _T_650 = ~twos_comp_in[10]; // @[lib.scala 428:40]
  wire  _T_652 = _T_648 ? _T_650 : twos_comp_in[10]; // @[lib.scala 428:23]
  wire  _T_654 = |twos_comp_in[10:0]; // @[lib.scala 428:35]
  wire  _T_656 = ~twos_comp_in[11]; // @[lib.scala 428:40]
  wire  _T_658 = _T_654 ? _T_656 : twos_comp_in[11]; // @[lib.scala 428:23]
  wire  _T_660 = |twos_comp_in[11:0]; // @[lib.scala 428:35]
  wire  _T_662 = ~twos_comp_in[12]; // @[lib.scala 428:40]
  wire  _T_664 = _T_660 ? _T_662 : twos_comp_in[12]; // @[lib.scala 428:23]
  wire  _T_666 = |twos_comp_in[12:0]; // @[lib.scala 428:35]
  wire  _T_668 = ~twos_comp_in[13]; // @[lib.scala 428:40]
  wire  _T_670 = _T_666 ? _T_668 : twos_comp_in[13]; // @[lib.scala 428:23]
  wire  _T_672 = |twos_comp_in[13:0]; // @[lib.scala 428:35]
  wire  _T_674 = ~twos_comp_in[14]; // @[lib.scala 428:40]
  wire  _T_676 = _T_672 ? _T_674 : twos_comp_in[14]; // @[lib.scala 428:23]
  wire  _T_678 = |twos_comp_in[14:0]; // @[lib.scala 428:35]
  wire  _T_680 = ~twos_comp_in[15]; // @[lib.scala 428:40]
  wire  _T_682 = _T_678 ? _T_680 : twos_comp_in[15]; // @[lib.scala 428:23]
  wire  _T_684 = |twos_comp_in[15:0]; // @[lib.scala 428:35]
  wire  _T_686 = ~twos_comp_in[16]; // @[lib.scala 428:40]
  wire  _T_688 = _T_684 ? _T_686 : twos_comp_in[16]; // @[lib.scala 428:23]
  wire  _T_690 = |twos_comp_in[16:0]; // @[lib.scala 428:35]
  wire  _T_692 = ~twos_comp_in[17]; // @[lib.scala 428:40]
  wire  _T_694 = _T_690 ? _T_692 : twos_comp_in[17]; // @[lib.scala 428:23]
  wire  _T_696 = |twos_comp_in[17:0]; // @[lib.scala 428:35]
  wire  _T_698 = ~twos_comp_in[18]; // @[lib.scala 428:40]
  wire  _T_700 = _T_696 ? _T_698 : twos_comp_in[18]; // @[lib.scala 428:23]
  wire  _T_702 = |twos_comp_in[18:0]; // @[lib.scala 428:35]
  wire  _T_704 = ~twos_comp_in[19]; // @[lib.scala 428:40]
  wire  _T_706 = _T_702 ? _T_704 : twos_comp_in[19]; // @[lib.scala 428:23]
  wire  _T_708 = |twos_comp_in[19:0]; // @[lib.scala 428:35]
  wire  _T_710 = ~twos_comp_in[20]; // @[lib.scala 428:40]
  wire  _T_712 = _T_708 ? _T_710 : twos_comp_in[20]; // @[lib.scala 428:23]
  wire  _T_714 = |twos_comp_in[20:0]; // @[lib.scala 428:35]
  wire  _T_716 = ~twos_comp_in[21]; // @[lib.scala 428:40]
  wire  _T_718 = _T_714 ? _T_716 : twos_comp_in[21]; // @[lib.scala 428:23]
  wire  _T_720 = |twos_comp_in[21:0]; // @[lib.scala 428:35]
  wire  _T_722 = ~twos_comp_in[22]; // @[lib.scala 428:40]
  wire  _T_724 = _T_720 ? _T_722 : twos_comp_in[22]; // @[lib.scala 428:23]
  wire  _T_726 = |twos_comp_in[22:0]; // @[lib.scala 428:35]
  wire  _T_728 = ~twos_comp_in[23]; // @[lib.scala 428:40]
  wire  _T_730 = _T_726 ? _T_728 : twos_comp_in[23]; // @[lib.scala 428:23]
  wire  _T_732 = |twos_comp_in[23:0]; // @[lib.scala 428:35]
  wire  _T_734 = ~twos_comp_in[24]; // @[lib.scala 428:40]
  wire  _T_736 = _T_732 ? _T_734 : twos_comp_in[24]; // @[lib.scala 428:23]
  wire  _T_738 = |twos_comp_in[24:0]; // @[lib.scala 428:35]
  wire  _T_740 = ~twos_comp_in[25]; // @[lib.scala 428:40]
  wire  _T_742 = _T_738 ? _T_740 : twos_comp_in[25]; // @[lib.scala 428:23]
  wire  _T_744 = |twos_comp_in[25:0]; // @[lib.scala 428:35]
  wire  _T_746 = ~twos_comp_in[26]; // @[lib.scala 428:40]
  wire  _T_748 = _T_744 ? _T_746 : twos_comp_in[26]; // @[lib.scala 428:23]
  wire  _T_750 = |twos_comp_in[26:0]; // @[lib.scala 428:35]
  wire  _T_752 = ~twos_comp_in[27]; // @[lib.scala 428:40]
  wire  _T_754 = _T_750 ? _T_752 : twos_comp_in[27]; // @[lib.scala 428:23]
  wire  _T_756 = |twos_comp_in[27:0]; // @[lib.scala 428:35]
  wire  _T_758 = ~twos_comp_in[28]; // @[lib.scala 428:40]
  wire  _T_760 = _T_756 ? _T_758 : twos_comp_in[28]; // @[lib.scala 428:23]
  wire  _T_762 = |twos_comp_in[28:0]; // @[lib.scala 428:35]
  wire  _T_764 = ~twos_comp_in[29]; // @[lib.scala 428:40]
  wire  _T_766 = _T_762 ? _T_764 : twos_comp_in[29]; // @[lib.scala 428:23]
  wire  _T_768 = |twos_comp_in[29:0]; // @[lib.scala 428:35]
  wire  _T_770 = ~twos_comp_in[30]; // @[lib.scala 428:40]
  wire  _T_772 = _T_768 ? _T_770 : twos_comp_in[30]; // @[lib.scala 428:23]
  wire  _T_774 = |twos_comp_in[30:0]; // @[lib.scala 428:35]
  wire  _T_776 = ~twos_comp_in[31]; // @[lib.scala 428:40]
  wire  _T_778 = _T_774 ? _T_776 : twos_comp_in[31]; // @[lib.scala 428:23]
  wire [6:0] _T_784 = {_T_634,_T_628,_T_622,_T_616,_T_610,_T_604,_T_598}; // @[lib.scala 430:14]
  wire [14:0] _T_792 = {_T_682,_T_676,_T_670,_T_664,_T_658,_T_652,_T_646,_T_640,_T_784}; // @[lib.scala 430:14]
  wire [7:0] _T_799 = {_T_730,_T_724,_T_718,_T_712,_T_706,_T_700,_T_694,_T_688}; // @[lib.scala 430:14]
  wire [30:0] _T_808 = {_T_778,_T_772,_T_766,_T_760,_T_754,_T_748,_T_742,_T_736,_T_799,_T_792}; // @[lib.scala 430:14]
  wire [31:0] twos_comp_out = {_T_808,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire  _T_810 = ~a_shift; // @[exu_div_ctl.scala 853:6]
  wire  _T_812 = _T_810 & _T_66; // @[exu_div_ctl.scala 853:15]
  wire [31:0] _T_816 = {a_ff[27:0],4'h0}; // @[Cat.scala 29:58]
  wire [64:0] ar_shifted = _T_71[64:0]; // @[exu_div_ctl.scala 794:28]
  wire [31:0] _T_818 = _T_812 ? io_dividend_in : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_819 = a_shift ? _T_816 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_820 = shortq_enable_ff ? ar_shifted[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_821 = _T_818 | _T_819; // @[Mux.scala 27:72]
  wire [31:0] a_in = _T_821 | _T_820; // @[Mux.scala 27:72]
  wire  _T_823 = ~b_twos_comp; // @[exu_div_ctl.scala 858:5]
  wire  _T_825 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 858:63]
  wire [32:0] _T_827 = {_T_825,io_divisor_in}; // @[Cat.scala 29:58]
  wire  _T_828 = ~control_ff[1]; // @[exu_div_ctl.scala 859:49]
  wire [32:0] _T_830 = {_T_828,_T_808,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_831 = _T_823 ? _T_827 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_832 = b_twos_comp ? _T_830 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] b_in = _T_831 | _T_832; // @[Mux.scala 27:72]
  wire [32:0] _T_837 = {r_ff[28:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [32:0] _T_855 = {1'h0,a_ff}; // @[Cat.scala 29:58]
  wire [32:0] _T_856 = r_sign_sel ? 33'h1ffffffff : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_857 = r_adder_sel_0 ? _T_837 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_858 = r_adder_sel_1 ? adder1_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_859 = r_adder_sel_2 ? adder2_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_860 = r_adder_sel_3 ? adder3_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_861 = r_adder_sel_4 ? _T_191[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_862 = r_adder_sel_5 ? adder5_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_863 = r_adder_sel_6 ? _T_195[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_864 = r_adder_sel_7 ? adder7_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_865 = r_adder_sel_8 ? _T_291[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_866 = r_adder_sel_9 ? adder9_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_867 = r_adder_sel_10 ? _T_239[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_868 = r_adder_sel_11 ? adder11_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_869 = r_adder_sel_12 ? _T_295[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_870 = r_adder_sel_13 ? adder13_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_871 = r_adder_sel_14 ? _T_299[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_872 = r_adder_sel_15 ? adder15_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_873 = shortq_enable_ff ? ar_shifted[64:32] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_874 = by_zero_case ? _T_855 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_875 = _T_856 | _T_857; // @[Mux.scala 27:72]
  wire [32:0] _T_876 = _T_875 | _T_858; // @[Mux.scala 27:72]
  wire [32:0] _T_877 = _T_876 | _T_859; // @[Mux.scala 27:72]
  wire [32:0] _T_878 = _T_877 | _T_860; // @[Mux.scala 27:72]
  wire [32:0] _T_879 = _T_878 | _T_861; // @[Mux.scala 27:72]
  wire [32:0] _T_880 = _T_879 | _T_862; // @[Mux.scala 27:72]
  wire [32:0] _T_881 = _T_880 | _T_863; // @[Mux.scala 27:72]
  wire [32:0] _T_882 = _T_881 | _T_864; // @[Mux.scala 27:72]
  wire [32:0] _T_883 = _T_882 | _T_865; // @[Mux.scala 27:72]
  wire [32:0] _T_884 = _T_883 | _T_866; // @[Mux.scala 27:72]
  wire [32:0] _T_885 = _T_884 | _T_867; // @[Mux.scala 27:72]
  wire [32:0] _T_886 = _T_885 | _T_868; // @[Mux.scala 27:72]
  wire [32:0] _T_887 = _T_886 | _T_869; // @[Mux.scala 27:72]
  wire [32:0] _T_888 = _T_887 | _T_870; // @[Mux.scala 27:72]
  wire [32:0] _T_889 = _T_888 | _T_871; // @[Mux.scala 27:72]
  wire [32:0] _T_890 = _T_889 | _T_872; // @[Mux.scala 27:72]
  wire [32:0] _T_891 = _T_890 | _T_873; // @[Mux.scala 27:72]
  wire [32:0] r_in = _T_891 | _T_874; // @[Mux.scala 27:72]
  wire [31:0] _T_895 = {q_ff[27:0],_T_486,_T_509,_T_532,_T_584}; // @[Cat.scala 29:58]
  wire  _T_918 = ~b_ff[3]; // @[exu_div_ctl.scala 895:70]
  wire  _T_920 = ~b_ff[2]; // @[exu_div_ctl.scala 895:70]
  wire  _T_923 = _T_918 & _T_920; // @[exu_div_ctl.scala 895:95]
  wire  _T_922 = ~b_ff[1]; // @[exu_div_ctl.scala 895:70]
  wire  _T_924 = _T_923 & _T_922; // @[exu_div_ctl.scala 895:95]
  wire  _T_925 = a_ff[3] & _T_924; // @[exu_div_ctl.scala 896:11]
  wire  _T_932 = a_ff[3] & _T_923; // @[exu_div_ctl.scala 896:11]
  wire  _T_934 = ~b_ff[0]; // @[exu_div_ctl.scala 901:33]
  wire  _T_935 = _T_932 & _T_934; // @[exu_div_ctl.scala 901:31]
  wire  _T_945 = a_ff[2] & _T_924; // @[exu_div_ctl.scala 896:11]
  wire  _T_946 = _T_935 | _T_945; // @[exu_div_ctl.scala 901:42]
  wire  _T_949 = a_ff[3] & a_ff[2]; // @[exu_div_ctl.scala 894:95]
  wire  _T_955 = _T_949 & _T_923; // @[exu_div_ctl.scala 896:11]
  wire  _T_956 = _T_946 | _T_955; // @[exu_div_ctl.scala 901:75]
  wire  _T_963 = a_ff[2] & _T_923; // @[exu_div_ctl.scala 896:11]
  wire  _T_966 = _T_963 & _T_934; // @[exu_div_ctl.scala 903:31]
  wire  _T_976 = a_ff[1] & _T_924; // @[exu_div_ctl.scala 896:11]
  wire  _T_977 = _T_966 | _T_976; // @[exu_div_ctl.scala 903:42]
  wire  _T_983 = _T_918 & _T_922; // @[exu_div_ctl.scala 895:95]
  wire  _T_984 = a_ff[3] & _T_983; // @[exu_div_ctl.scala 896:11]
  wire  _T_987 = _T_984 & _T_934; // @[exu_div_ctl.scala 903:106]
  wire  _T_988 = _T_977 | _T_987; // @[exu_div_ctl.scala 903:78]
  wire  _T_991 = ~a_ff[2]; // @[exu_div_ctl.scala 894:70]
  wire  _T_992 = a_ff[3] & _T_991; // @[exu_div_ctl.scala 894:95]
  wire  _T_1000 = _T_923 & b_ff[1]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1001 = _T_1000 & b_ff[0]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1002 = _T_992 & _T_1001; // @[exu_div_ctl.scala 896:11]
  wire  _T_1003 = _T_988 | _T_1002; // @[exu_div_ctl.scala 903:117]
  wire  _T_1005 = ~a_ff[3]; // @[exu_div_ctl.scala 894:70]
  wire  _T_1008 = _T_1005 & a_ff[2]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1009 = _T_1008 & a_ff[1]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1015 = _T_1009 & _T_923; // @[exu_div_ctl.scala 896:11]
  wire  _T_1016 = _T_1003 | _T_1015; // @[exu_div_ctl.scala 904:44]
  wire  _T_1022 = _T_949 & _T_918; // @[exu_div_ctl.scala 896:11]
  wire  _T_1025 = _T_1022 & _T_934; // @[exu_div_ctl.scala 904:107]
  wire  _T_1026 = _T_1016 | _T_1025; // @[exu_div_ctl.scala 904:80]
  wire  _T_1035 = _T_918 & b_ff[2]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1036 = _T_1035 & _T_922; // @[exu_div_ctl.scala 895:95]
  wire  _T_1037 = _T_949 & _T_1036; // @[exu_div_ctl.scala 896:11]
  wire  _T_1038 = _T_1026 | _T_1037; // @[exu_div_ctl.scala 904:119]
  wire  _T_1041 = a_ff[3] & a_ff[1]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1047 = _T_1041 & _T_983; // @[exu_div_ctl.scala 896:11]
  wire  _T_1048 = _T_1038 | _T_1047; // @[exu_div_ctl.scala 905:44]
  wire  _T_1053 = _T_949 & a_ff[1]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1058 = _T_1053 & _T_1035; // @[exu_div_ctl.scala 896:11]
  wire  _T_1059 = _T_1048 | _T_1058; // @[exu_div_ctl.scala 905:79]
  wire  _T_1063 = a_ff[2] & a_ff[1]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1064 = _T_1063 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1070 = _T_1064 & _T_983; // @[exu_div_ctl.scala 896:11]
  wire  _T_1076 = _T_992 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1081 = _T_918 & b_ff[1]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1082 = _T_1081 & b_ff[0]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1083 = _T_1076 & _T_1082; // @[exu_div_ctl.scala 896:11]
  wire  _T_1084 = _T_1070 | _T_1083; // @[exu_div_ctl.scala 907:45]
  wire  _T_1091 = a_ff[2] & _T_983; // @[exu_div_ctl.scala 896:11]
  wire  _T_1094 = _T_1091 & _T_934; // @[exu_div_ctl.scala 907:114]
  wire  _T_1095 = _T_1084 | _T_1094; // @[exu_div_ctl.scala 907:86]
  wire  _T_1102 = a_ff[1] & _T_923; // @[exu_div_ctl.scala 896:11]
  wire  _T_1105 = _T_1102 & _T_934; // @[exu_div_ctl.scala 908:33]
  wire  _T_1106 = _T_1095 | _T_1105; // @[exu_div_ctl.scala 907:129]
  wire  _T_1116 = a_ff[0] & _T_924; // @[exu_div_ctl.scala 896:11]
  wire  _T_1117 = _T_1106 | _T_1116; // @[exu_div_ctl.scala 908:47]
  wire  _T_1122 = ~a_ff[1]; // @[exu_div_ctl.scala 894:70]
  wire  _T_1124 = _T_1008 & _T_1122; // @[exu_div_ctl.scala 894:95]
  wire  _T_1134 = _T_1124 & _T_1001; // @[exu_div_ctl.scala 896:11]
  wire  _T_1135 = _T_1117 | _T_1134; // @[exu_div_ctl.scala 908:88]
  wire  _T_1144 = _T_1009 & _T_918; // @[exu_div_ctl.scala 896:11]
  wire  _T_1147 = _T_1144 & _T_934; // @[exu_div_ctl.scala 909:36]
  wire  _T_1148 = _T_1135 | _T_1147; // @[exu_div_ctl.scala 908:131]
  wire  _T_1154 = _T_920 & _T_922; // @[exu_div_ctl.scala 895:95]
  wire  _T_1155 = a_ff[3] & _T_1154; // @[exu_div_ctl.scala 896:11]
  wire  _T_1158 = _T_1155 & _T_934; // @[exu_div_ctl.scala 909:76]
  wire  _T_1159 = _T_1148 | _T_1158; // @[exu_div_ctl.scala 909:47]
  wire  _T_1169 = _T_1035 & b_ff[1]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1170 = _T_992 & _T_1169; // @[exu_div_ctl.scala 896:11]
  wire  _T_1171 = _T_1159 | _T_1170; // @[exu_div_ctl.scala 909:88]
  wire  _T_1185 = _T_1009 & _T_1036; // @[exu_div_ctl.scala 896:11]
  wire  _T_1186 = _T_1171 | _T_1185; // @[exu_div_ctl.scala 909:131]
  wire  _T_1192 = _T_1008 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1198 = _T_1192 & _T_983; // @[exu_div_ctl.scala 896:11]
  wire  _T_1199 = _T_1186 | _T_1198; // @[exu_div_ctl.scala 910:47]
  wire  _T_1206 = _T_992 & _T_1122; // @[exu_div_ctl.scala 894:95]
  wire  _T_1212 = _T_1035 & b_ff[0]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1213 = _T_1206 & _T_1212; // @[exu_div_ctl.scala 896:11]
  wire  _T_1214 = _T_1199 | _T_1213; // @[exu_div_ctl.scala 910:88]
  wire  _T_1219 = _T_991 & a_ff[1]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1220 = _T_1219 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1226 = _T_1220 & _T_923; // @[exu_div_ctl.scala 896:11]
  wire  _T_1227 = _T_1214 | _T_1226; // @[exu_div_ctl.scala 910:131]
  wire  _T_1233 = _T_949 & _T_922; // @[exu_div_ctl.scala 896:11]
  wire  _T_1236 = _T_1233 & _T_934; // @[exu_div_ctl.scala 911:75]
  wire  _T_1237 = _T_1227 | _T_1236; // @[exu_div_ctl.scala 911:47]
  wire  _T_1245 = _T_1009 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1250 = _T_1245 & _T_1035; // @[exu_div_ctl.scala 896:11]
  wire  _T_1251 = _T_1237 | _T_1250; // @[exu_div_ctl.scala 911:88]
  wire  _T_1258 = b_ff[3] & _T_920; // @[exu_div_ctl.scala 895:95]
  wire  _T_1259 = _T_949 & _T_1258; // @[exu_div_ctl.scala 896:11]
  wire  _T_1260 = _T_1251 | _T_1259; // @[exu_div_ctl.scala 911:131]
  wire  _T_1270 = _T_1258 & _T_922; // @[exu_div_ctl.scala 895:95]
  wire  _T_1271 = _T_1041 & _T_1270; // @[exu_div_ctl.scala 896:11]
  wire  _T_1272 = _T_1260 | _T_1271; // @[exu_div_ctl.scala 912:47]
  wire  _T_1275 = a_ff[3] & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1281 = _T_1275 & _T_1154; // @[exu_div_ctl.scala 896:11]
  wire  _T_1282 = _T_1272 | _T_1281; // @[exu_div_ctl.scala 912:88]
  wire  _T_1286 = a_ff[3] & _T_1122; // @[exu_div_ctl.scala 894:95]
  wire  _T_1294 = _T_1169 & b_ff[0]; // @[exu_div_ctl.scala 895:95]
  wire  _T_1295 = _T_1286 & _T_1294; // @[exu_div_ctl.scala 896:11]
  wire  _T_1296 = _T_1282 | _T_1295; // @[exu_div_ctl.scala 912:131]
  wire  _T_1303 = _T_1053 & b_ff[3]; // @[exu_div_ctl.scala 896:11]
  wire  _T_1306 = _T_1303 & _T_934; // @[exu_div_ctl.scala 913:77]
  wire  _T_1307 = _T_1296 | _T_1306; // @[exu_div_ctl.scala 913:47]
  wire  _T_1316 = b_ff[3] & _T_922; // @[exu_div_ctl.scala 895:95]
  wire  _T_1317 = _T_1053 & _T_1316; // @[exu_div_ctl.scala 896:11]
  wire  _T_1318 = _T_1307 | _T_1317; // @[exu_div_ctl.scala 913:88]
  wire  _T_1323 = _T_949 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1328 = _T_1323 & _T_1316; // @[exu_div_ctl.scala 896:11]
  wire  _T_1329 = _T_1318 | _T_1328; // @[exu_div_ctl.scala 913:131]
  wire  _T_1335 = _T_992 & a_ff[1]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1340 = _T_1335 & _T_1081; // @[exu_div_ctl.scala 896:11]
  wire  _T_1341 = _T_1329 | _T_1340; // @[exu_div_ctl.scala 914:47]
  wire  _T_1346 = _T_1041 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1349 = _T_1346 & _T_920; // @[exu_div_ctl.scala 896:11]
  wire  _T_1350 = _T_1341 | _T_1349; // @[exu_div_ctl.scala 914:88]
  wire  _T_1357 = _T_1053 & a_ff[0]; // @[exu_div_ctl.scala 894:95]
  wire  _T_1359 = _T_1357 & b_ff[3]; // @[exu_div_ctl.scala 896:11]
  wire  _T_1360 = _T_1350 | _T_1359; // @[exu_div_ctl.scala 914:131]
  wire  _T_1366 = _T_1041 & _T_920; // @[exu_div_ctl.scala 896:11]
  wire  _T_1369 = _T_1366 & _T_934; // @[exu_div_ctl.scala 915:74]
  wire  _T_1370 = _T_1360 | _T_1369; // @[exu_div_ctl.scala 915:47]
  wire [31:0] _T_896 = {28'h0,_T_925,_T_956,_T_1059,_T_1370}; // @[Cat.scala 29:58]
  wire [31:0] _T_898 = _T_76 ? _T_895 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_899 = smallnum_case ? _T_896 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_900 = by_zero_case ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_901 = _T_898 | _T_899; // @[Mux.scala 27:72]
  wire [31:0] q_in = _T_901 | _T_900; // @[Mux.scala 27:72]
  wire  _T_906 = ~twos_comp_q_sel; // @[exu_div_ctl.scala 889:16]
  wire  _T_907 = _T_30 & _T_906; // @[exu_div_ctl.scala 889:14]
  wire [31:0] _T_910 = _T_907 ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_911 = control_ff[0] ? r_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_912 = twos_comp_q_sel ? twos_comp_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_913 = _T_910 | _T_911; // @[Mux.scala 27:72]
  wire  _T_1397 = shortq == 6'h1b; // @[exu_div_ctl.scala 931:58]
  wire  _T_1398 = shortq == 6'h1a; // @[exu_div_ctl.scala 931:58]
  wire  _T_1399 = shortq == 6'h19; // @[exu_div_ctl.scala 931:58]
  wire  _T_1400 = shortq == 6'h18; // @[exu_div_ctl.scala 931:58]
  wire  _T_1401 = shortq == 6'h17; // @[exu_div_ctl.scala 931:58]
  wire  _T_1402 = shortq == 6'h16; // @[exu_div_ctl.scala 931:58]
  wire  _T_1403 = shortq == 6'h15; // @[exu_div_ctl.scala 931:58]
  wire  _T_1404 = shortq == 6'h14; // @[exu_div_ctl.scala 931:58]
  wire  _T_1405 = shortq == 6'h13; // @[exu_div_ctl.scala 931:58]
  wire  _T_1406 = shortq == 6'h12; // @[exu_div_ctl.scala 931:58]
  wire  _T_1407 = shortq == 6'h11; // @[exu_div_ctl.scala 931:58]
  wire  _T_1408 = shortq == 6'h10; // @[exu_div_ctl.scala 931:58]
  wire  _T_1409 = shortq == 6'hf; // @[exu_div_ctl.scala 931:58]
  wire  _T_1410 = shortq == 6'he; // @[exu_div_ctl.scala 931:58]
  wire  _T_1411 = shortq == 6'hd; // @[exu_div_ctl.scala 931:58]
  wire  _T_1412 = shortq == 6'hc; // @[exu_div_ctl.scala 931:58]
  wire  _T_1413 = shortq == 6'hb; // @[exu_div_ctl.scala 931:58]
  wire  _T_1414 = shortq == 6'ha; // @[exu_div_ctl.scala 931:58]
  wire  _T_1415 = shortq == 6'h9; // @[exu_div_ctl.scala 931:58]
  wire  _T_1416 = shortq == 6'h8; // @[exu_div_ctl.scala 931:58]
  wire  _T_1417 = shortq == 6'h7; // @[exu_div_ctl.scala 931:58]
  wire  _T_1418 = shortq == 6'h6; // @[exu_div_ctl.scala 931:58]
  wire  _T_1419 = shortq == 6'h5; // @[exu_div_ctl.scala 931:58]
  wire  _T_1420 = shortq == 6'h4; // @[exu_div_ctl.scala 931:58]
  wire  _T_1421 = shortq == 6'h3; // @[exu_div_ctl.scala 931:58]
  wire  _T_1422 = shortq == 6'h2; // @[exu_div_ctl.scala 931:58]
  wire  _T_1423 = shortq == 6'h1; // @[exu_div_ctl.scala 931:58]
  wire  _T_1424 = shortq == 6'h0; // @[exu_div_ctl.scala 931:58]
  wire [2:0] _T_1429 = _T_1397 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1430 = _T_1398 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1431 = _T_1399 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1432 = _T_1400 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1433 = _T_1401 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1434 = _T_1402 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1435 = _T_1403 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1436 = _T_1404 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1437 = _T_1405 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1438 = _T_1406 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1439 = _T_1407 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1440 = _T_1408 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1441 = _T_1409 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1442 = _T_1410 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1443 = _T_1411 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1444 = _T_1412 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1445 = _T_1413 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1446 = _T_1414 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1447 = _T_1415 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1448 = _T_1416 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1449 = _T_1417 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1450 = _T_1418 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1451 = _T_1419 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1452 = _T_1420 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1453 = _T_1421 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1454 = _T_1422 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1455 = _T_1423 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1456 = _T_1424 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1461 = _T_1429 | _T_1430; // @[Mux.scala 27:72]
  wire [2:0] _T_1462 = _T_1461 | _T_1431; // @[Mux.scala 27:72]
  wire [2:0] _T_1463 = _T_1462 | _T_1432; // @[Mux.scala 27:72]
  wire [3:0] _GEN_12 = {{1'd0}, _T_1463}; // @[Mux.scala 27:72]
  wire [3:0] _T_1464 = _GEN_12 | _T_1433; // @[Mux.scala 27:72]
  wire [3:0] _T_1465 = _T_1464 | _T_1434; // @[Mux.scala 27:72]
  wire [3:0] _T_1466 = _T_1465 | _T_1435; // @[Mux.scala 27:72]
  wire [3:0] _T_1467 = _T_1466 | _T_1436; // @[Mux.scala 27:72]
  wire [3:0] _T_1468 = _T_1467 | _T_1437; // @[Mux.scala 27:72]
  wire [3:0] _T_1469 = _T_1468 | _T_1438; // @[Mux.scala 27:72]
  wire [3:0] _T_1470 = _T_1469 | _T_1439; // @[Mux.scala 27:72]
  wire [3:0] _T_1471 = _T_1470 | _T_1440; // @[Mux.scala 27:72]
  wire [4:0] _GEN_13 = {{1'd0}, _T_1471}; // @[Mux.scala 27:72]
  wire [4:0] _T_1472 = _GEN_13 | _T_1441; // @[Mux.scala 27:72]
  wire [4:0] _T_1473 = _T_1472 | _T_1442; // @[Mux.scala 27:72]
  wire [4:0] _T_1474 = _T_1473 | _T_1443; // @[Mux.scala 27:72]
  wire [4:0] _T_1475 = _T_1474 | _T_1444; // @[Mux.scala 27:72]
  wire [4:0] _T_1476 = _T_1475 | _T_1445; // @[Mux.scala 27:72]
  wire [4:0] _T_1477 = _T_1476 | _T_1446; // @[Mux.scala 27:72]
  wire [4:0] _T_1478 = _T_1477 | _T_1447; // @[Mux.scala 27:72]
  wire [4:0] _T_1479 = _T_1478 | _T_1448; // @[Mux.scala 27:72]
  wire [4:0] _T_1480 = _T_1479 | _T_1449; // @[Mux.scala 27:72]
  wire [4:0] _T_1481 = _T_1480 | _T_1450; // @[Mux.scala 27:72]
  wire [4:0] _T_1482 = _T_1481 | _T_1451; // @[Mux.scala 27:72]
  wire [4:0] _T_1483 = _T_1482 | _T_1452; // @[Mux.scala 27:72]
  wire [4:0] _T_1484 = _T_1483 | _T_1453; // @[Mux.scala 27:72]
  wire [4:0] _T_1485 = _T_1484 | _T_1454; // @[Mux.scala 27:72]
  wire [4:0] _T_1486 = _T_1485 | _T_1455; // @[Mux.scala 27:72]
  wire [4:0] shortq_decode = _T_1486 | _T_1456; // @[Mux.scala 27:72]
  exu_div_cls a_enc ( // @[exu_div_ctl.scala 919:21]
    .io_operand(a_enc_io_operand),
    .io_cls(a_enc_io_cls)
  );
  exu_div_cls b_enc ( // @[exu_div_ctl.scala 922:21]
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
  assign io_data_out = _T_913 | _T_912; // @[exu_div_ctl.scala 888:15]
  assign io_valid_out = finish_ff & _T; // @[exu_div_ctl.scala 887:16]
  assign a_enc_io_operand = {control_ff[2],a_ff}; // @[exu_div_ctl.scala 920:20]
  assign b_enc_io_operand = b_ff[32:0]; // @[exu_div_ctl.scala 923:20]
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
  wire  divider_new4_clock; // @[exu_div_ctl.scala 71:30]
  wire  divider_new4_reset; // @[exu_div_ctl.scala 71:30]
  wire  divider_new4_io_cancel; // @[exu_div_ctl.scala 71:30]
  wire  divider_new4_io_valid_in; // @[exu_div_ctl.scala 71:30]
  wire  divider_new4_io_signed_in; // @[exu_div_ctl.scala 71:30]
  wire  divider_new4_io_rem_in; // @[exu_div_ctl.scala 71:30]
  wire [31:0] divider_new4_io_dividend_in; // @[exu_div_ctl.scala 71:30]
  wire [31:0] divider_new4_io_divisor_in; // @[exu_div_ctl.scala 71:30]
  wire [31:0] divider_new4_io_data_out; // @[exu_div_ctl.scala 71:30]
  wire  divider_new4_io_valid_out; // @[exu_div_ctl.scala 71:30]
  wire [31:0] _T_1 = io_exu_div_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] out_raw = divider_new4_io_data_out; // @[exu_div_ctl.scala 79:29]
  exu_div_new_4bit_fullshortq divider_new4 ( // @[exu_div_ctl.scala 71:30]
    .clock(divider_new4_clock),
    .reset(divider_new4_reset),
    .io_cancel(divider_new4_io_cancel),
    .io_valid_in(divider_new4_io_valid_in),
    .io_signed_in(divider_new4_io_signed_in),
    .io_rem_in(divider_new4_io_rem_in),
    .io_dividend_in(divider_new4_io_dividend_in),
    .io_divisor_in(divider_new4_io_divisor_in),
    .io_data_out(divider_new4_io_data_out),
    .io_valid_out(divider_new4_io_valid_out)
  );
  assign io_exu_div_result = _T_1 & out_raw; // @[exu_div_ctl.scala 21:21]
  assign io_exu_div_wren = divider_new4_io_valid_out; // @[exu_div_ctl.scala 80:29]
  assign divider_new4_clock = clock;
  assign divider_new4_reset = reset;
  assign divider_new4_io_cancel = io_dec_div_dec_div_cancel; // @[exu_div_ctl.scala 73:34]
  assign divider_new4_io_valid_in = io_dec_div_div_p_valid; // @[exu_div_ctl.scala 74:34]
  assign divider_new4_io_signed_in = ~io_dec_div_div_p_bits_unsign; // @[exu_div_ctl.scala 75:34]
  assign divider_new4_io_rem_in = io_dec_div_div_p_bits_rem; // @[exu_div_ctl.scala 76:34]
  assign divider_new4_io_dividend_in = io_dividend; // @[exu_div_ctl.scala 77:34]
  assign divider_new4_io_divisor_in = io_divisor; // @[exu_div_ctl.scala 78:34]
endmodule
