module exu_div_cls(
  input  [32:0] io_operand,
  output [4:0]  io_cls
);
  wire  _T_3 = io_operand[31:30] == 2'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_5 = io_operand[31:29] == 3'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_7 = io_operand[31:28] == 4'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_9 = io_operand[31:27] == 5'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_11 = io_operand[31:26] == 6'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_13 = io_operand[31:25] == 7'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_15 = io_operand[31:24] == 8'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_17 = io_operand[31:23] == 9'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_19 = io_operand[31:22] == 10'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_21 = io_operand[31:21] == 11'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_23 = io_operand[31:20] == 12'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_25 = io_operand[31:19] == 13'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_27 = io_operand[31:18] == 14'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_29 = io_operand[31:17] == 15'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_31 = io_operand[31:16] == 16'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_33 = io_operand[31:15] == 17'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_35 = io_operand[31:14] == 18'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_37 = io_operand[31:13] == 19'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_39 = io_operand[31:12] == 20'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_41 = io_operand[31:11] == 21'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_43 = io_operand[31:10] == 22'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_45 = io_operand[31:9] == 23'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_47 = io_operand[31:8] == 24'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_49 = io_operand[31:7] == 25'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_51 = io_operand[31:6] == 26'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_53 = io_operand[31:5] == 27'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_55 = io_operand[31:4] == 28'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_57 = io_operand[31:3] == 29'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_59 = io_operand[31:2] == 30'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_61 = io_operand[31:1] == 31'h1; // @[exu_div_ctl.scala 958:63]
  wire  _T_63 = io_operand[31:0] == 32'h1; // @[exu_div_ctl.scala 958:63]
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
  wire  _T_129 = io_operand[31:0] == 32'hffffffff; // @[exu_div_ctl.scala 960:25]
  wire  _T_137 = io_operand[31:29] == 3'h6; // @[exu_div_ctl.scala 961:76]
  wire  _T_142 = io_operand[31:28] == 4'he; // @[exu_div_ctl.scala 961:76]
  wire  _T_147 = io_operand[31:27] == 5'h1e; // @[exu_div_ctl.scala 961:76]
  wire  _T_152 = io_operand[31:26] == 6'h3e; // @[exu_div_ctl.scala 961:76]
  wire  _T_157 = io_operand[31:25] == 7'h7e; // @[exu_div_ctl.scala 961:76]
  wire  _T_162 = io_operand[31:24] == 8'hfe; // @[exu_div_ctl.scala 961:76]
  wire  _T_167 = io_operand[31:23] == 9'h1fe; // @[exu_div_ctl.scala 961:76]
  wire  _T_172 = io_operand[31:22] == 10'h3fe; // @[exu_div_ctl.scala 961:76]
  wire  _T_177 = io_operand[31:21] == 11'h7fe; // @[exu_div_ctl.scala 961:76]
  wire  _T_182 = io_operand[31:20] == 12'hffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_187 = io_operand[31:19] == 13'h1ffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_192 = io_operand[31:18] == 14'h3ffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_197 = io_operand[31:17] == 15'h7ffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_202 = io_operand[31:16] == 16'hfffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_207 = io_operand[31:15] == 17'h1fffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_212 = io_operand[31:14] == 18'h3fffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_217 = io_operand[31:13] == 19'h7fffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_222 = io_operand[31:12] == 20'hffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_227 = io_operand[31:11] == 21'h1ffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_232 = io_operand[31:10] == 22'h3ffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_237 = io_operand[31:9] == 23'h7ffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_242 = io_operand[31:8] == 24'hfffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_247 = io_operand[31:7] == 25'h1fffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_252 = io_operand[31:6] == 26'h3fffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_257 = io_operand[31:5] == 27'h7fffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_262 = io_operand[31:4] == 28'hffffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_267 = io_operand[31:3] == 29'h1ffffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_272 = io_operand[31:2] == 30'h3ffffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_277 = io_operand[31:1] == 31'h7ffffffe; // @[exu_div_ctl.scala 961:76]
  wire  _T_282 = io_operand[31:0] == 32'hfffffffe; // @[exu_div_ctl.scala 961:76]
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
  wire [4:0] cls_ones = _T_129 ? 5'h1f : _T_344; // @[exu_div_ctl.scala 960:44]
  assign io_cls = io_operand[32] ? cls_ones : cls_zeros; // @[exu_div_ctl.scala 962:10]
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
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] a_enc_io_operand; // @[exu_div_ctl.scala 917:21]
  wire [4:0] a_enc_io_cls; // @[exu_div_ctl.scala 917:21]
  wire [32:0] b_enc_io_operand; // @[exu_div_ctl.scala 920:21]
  wire [4:0] b_enc_io_cls; // @[exu_div_ctl.scala 920:21]
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
  wire  _T = ~io_cancel; // @[exu_div_ctl.scala 774:35]
  wire  valid_ff_in = io_valid_in & _T; // @[exu_div_ctl.scala 774:33]
  wire  _T_1 = ~io_valid_in; // @[exu_div_ctl.scala 775:35]
  reg [2:0] control_ff; // @[Reg.scala 27:20]
  wire  _T_3 = _T_1 & control_ff[2]; // @[exu_div_ctl.scala 775:48]
  wire  _T_4 = io_valid_in & io_signed_in; // @[exu_div_ctl.scala 775:80]
  wire  _T_6 = _T_4 & io_dividend_in[31]; // @[exu_div_ctl.scala 775:96]
  wire  _T_7 = _T_3 | _T_6; // @[exu_div_ctl.scala 775:65]
  wire  _T_10 = _T_1 & control_ff[1]; // @[exu_div_ctl.scala 775:133]
  wire  _T_13 = _T_4 & io_divisor_in[31]; // @[exu_div_ctl.scala 775:181]
  wire  _T_14 = _T_10 | _T_13; // @[exu_div_ctl.scala 775:150]
  wire  _T_17 = _T_1 & control_ff[0]; // @[exu_div_ctl.scala 775:218]
  wire  _T_18 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 775:250]
  wire  _T_19 = _T_17 | _T_18; // @[exu_div_ctl.scala 775:235]
  wire [2:0] control_in = {_T_7,_T_14,_T_19}; // @[Cat.scala 29:58]
  reg [32:0] b_ff1; // @[Reg.scala 27:20]
  wire [37:0] b_ff = {b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1}; // @[Cat.scala 29:58]
  wire  _T_22 = b_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 779:54]
  reg  valid_ff; // @[Reg.scala 27:20]
  wire  by_zero_case = valid_ff & _T_22; // @[exu_div_ctl.scala 779:40]
  reg [31:0] a_ff; // @[Reg.scala 27:20]
  wire  _T_24 = a_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 781:37]
  wire  _T_26 = b_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 781:60]
  wire  _T_27 = _T_24 & _T_26; // @[exu_div_ctl.scala 781:46]
  wire  _T_28 = ~by_zero_case; // @[exu_div_ctl.scala 781:71]
  wire  _T_29 = _T_27 & _T_28; // @[exu_div_ctl.scala 781:69]
  wire  _T_30 = ~control_ff[0]; // @[exu_div_ctl.scala 781:87]
  wire  _T_31 = _T_29 & _T_30; // @[exu_div_ctl.scala 781:85]
  wire  _T_32 = _T_31 & valid_ff; // @[exu_div_ctl.scala 781:95]
  wire  _T_34 = _T_32 & _T; // @[exu_div_ctl.scala 781:106]
  wire  _T_36 = a_ff == 32'h0; // @[exu_div_ctl.scala 782:18]
  wire  _T_38 = _T_36 & _T_28; // @[exu_div_ctl.scala 782:27]
  wire  _T_40 = _T_38 & _T_30; // @[exu_div_ctl.scala 782:43]
  wire  _T_41 = _T_40 & valid_ff; // @[exu_div_ctl.scala 782:53]
  wire  _T_43 = _T_41 & _T; // @[exu_div_ctl.scala 782:64]
  wire  smallnum_case = _T_34 | _T_43; // @[exu_div_ctl.scala 781:120]
  reg [6:0] count_ff; // @[Reg.scala 27:20]
  wire  _T_44 = |count_ff; // @[exu_div_ctl.scala 783:42]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  running_state = _T_44 | shortq_enable_ff; // @[exu_div_ctl.scala 783:45]
  wire  _T_45 = io_valid_in | valid_ff; // @[exu_div_ctl.scala 784:43]
  wire  _T_46 = _T_45 | io_cancel; // @[exu_div_ctl.scala 784:54]
  wire  _T_47 = _T_46 | running_state; // @[exu_div_ctl.scala 784:66]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  misc_enable = _T_47 | finish_ff; // @[exu_div_ctl.scala 784:82]
  wire  _T_48 = smallnum_case | by_zero_case; // @[exu_div_ctl.scala 785:45]
  wire  _T_49 = count_ff == 7'h20; // @[exu_div_ctl.scala 785:72]
  wire  finish_raw = _T_48 | _T_49; // @[exu_div_ctl.scala 785:60]
  wire  finish = finish_raw & _T; // @[exu_div_ctl.scala 786:41]
  wire  _T_51 = valid_ff | running_state; // @[exu_div_ctl.scala 787:40]
  wire  _T_52 = ~finish; // @[exu_div_ctl.scala 787:59]
  wire  _T_53 = _T_51 & _T_52; // @[exu_div_ctl.scala 787:57]
  wire  _T_54 = ~finish_ff; // @[exu_div_ctl.scala 787:69]
  wire  _T_55 = _T_53 & _T_54; // @[exu_div_ctl.scala 787:67]
  wire  _T_57 = _T_55 & _T; // @[exu_div_ctl.scala 787:80]
  wire [6:0] _T_1404 = {1'h0,1'h0,b_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1405 = {1'h0,1'h0,a_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1407 = _T_1404 - _T_1405; // @[exu_div_ctl.scala 925:41]
  wire [6:0] dw_shortq_raw = _T_1407 + 7'h1; // @[exu_div_ctl.scala 925:61]
  wire [5:0] shortq = dw_shortq_raw[6] ? 6'h0 : dw_shortq_raw[5:0]; // @[exu_div_ctl.scala 926:19]
  wire  _T_1413 = ~shortq[5]; // @[exu_div_ctl.scala 927:31]
  wire  _T_1414 = valid_ff & _T_1413; // @[exu_div_ctl.scala 927:29]
  wire  _T_1416 = shortq[4:2] == 3'h7; // @[exu_div_ctl.scala 927:58]
  wire  _T_1417 = ~_T_1416; // @[exu_div_ctl.scala 927:44]
  wire  _T_1418 = _T_1414 & _T_1417; // @[exu_div_ctl.scala 927:42]
  wire  shortq_enable = _T_1418 & _T; // @[exu_div_ctl.scala 927:73]
  wire  _T_58 = ~shortq_enable; // @[exu_div_ctl.scala 787:95]
  wire  count_enable = _T_57 & _T_58; // @[exu_div_ctl.scala 787:93]
  wire [6:0] _T_60 = count_enable ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_62 = count_ff + 7'h4; // @[exu_div_ctl.scala 788:63]
  reg [4:0] shortq_shift_ff; // @[Reg.scala 27:20]
  wire [6:0] _T_63 = {2'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [6:0] _T_65 = _T_62 + _T_63; // @[exu_div_ctl.scala 788:74]
  wire [6:0] count_in = _T_60 & _T_65; // @[exu_div_ctl.scala 788:51]
  wire  a_enable = io_valid_in | running_state; // @[exu_div_ctl.scala 789:43]
  wire  _T_66 = ~shortq_enable_ff; // @[exu_div_ctl.scala 790:47]
  wire  a_shift = running_state & _T_66; // @[exu_div_ctl.scala 790:45]
  wire [32:0] _T_68 = control_ff[2] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire [64:0] _T_70 = {_T_68,a_ff}; // @[Cat.scala 29:58]
  wire [95:0] _GEN_11 = {{31'd0}, _T_70}; // @[exu_div_ctl.scala 791:74]
  wire [95:0] _T_71 = _GEN_11 << shortq_shift_ff; // @[exu_div_ctl.scala 791:74]
  wire  _T_72 = control_ff[2] ^ control_ff[1]; // @[exu_div_ctl.scala 792:61]
  wire  _T_73 = ~_T_72; // @[exu_div_ctl.scala 792:42]
  wire  b_twos_comp = valid_ff & _T_73; // @[exu_div_ctl.scala 792:40]
  wire  _T_76 = ~valid_ff; // @[exu_div_ctl.scala 794:30]
  wire  _T_78 = _T_76 & _T_30; // @[exu_div_ctl.scala 794:40]
  wire  _T_80 = _T_78 & _T_72; // @[exu_div_ctl.scala 794:50]
  reg  by_zero_case_ff; // @[Reg.scala 27:20]
  wire  _T_81 = ~by_zero_case_ff; // @[exu_div_ctl.scala 794:92]
  wire  twos_comp_q_sel = _T_80 & _T_81; // @[exu_div_ctl.scala 794:90]
  wire  b_enable = io_valid_in | b_twos_comp; // @[exu_div_ctl.scala 795:43]
  wire  rq_enable = _T_45 | running_state; // @[exu_div_ctl.scala 796:54]
  wire  _T_83 = valid_ff & control_ff[2]; // @[exu_div_ctl.scala 797:40]
  wire  r_sign_sel = _T_83 & _T_28; // @[exu_div_ctl.scala 797:59]
  reg [32:0] r_ff; // @[Reg.scala 27:20]
  wire [37:0] _T_287 = {r_ff[32],r_ff,a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [37:0] _T_289 = {b_ff[34:0],3'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_291 = _T_287 + _T_289; // @[exu_div_ctl.scala 814:58]
  wire [37:0] _T_293 = {b_ff[35:0],2'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_295 = _T_291 + _T_293; // @[exu_div_ctl.scala 814:85]
  wire [37:0] _T_297 = {b_ff[36:0],1'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_299 = _T_295 + _T_297; // @[exu_div_ctl.scala 814:112]
  wire [37:0] adder15_out = _T_299 + b_ff; // @[exu_div_ctl.scala 814:134]
  wire  _T_302 = ~adder15_out[37]; // @[exu_div_ctl.scala 816:6]
  wire  _T_303 = _T_302 ^ control_ff[2]; // @[exu_div_ctl.scala 816:23]
  wire  _T_305 = a_ff[27:0] == 28'h0; // @[exu_div_ctl.scala 816:58]
  wire  _T_306 = adder15_out == 38'h0; // @[exu_div_ctl.scala 816:82]
  wire  _T_307 = _T_305 & _T_306; // @[exu_div_ctl.scala 816:67]
  wire  _T_308 = _T_303 | _T_307; // @[exu_div_ctl.scala 816:43]
  wire  _T_310 = ~_T_299[37]; // @[exu_div_ctl.scala 817:6]
  wire  _T_311 = _T_310 ^ control_ff[2]; // @[exu_div_ctl.scala 817:23]
  wire  _T_314 = _T_299 == 38'h0; // @[exu_div_ctl.scala 817:82]
  wire  _T_315 = _T_305 & _T_314; // @[exu_div_ctl.scala 817:67]
  wire  _T_316 = _T_311 | _T_315; // @[exu_div_ctl.scala 817:43]
  wire [37:0] adder13_out = _T_295 + b_ff; // @[exu_div_ctl.scala 812:112]
  wire  _T_318 = ~adder13_out[37]; // @[exu_div_ctl.scala 818:6]
  wire  _T_319 = _T_318 ^ control_ff[2]; // @[exu_div_ctl.scala 818:23]
  wire  _T_322 = adder13_out == 38'h0; // @[exu_div_ctl.scala 818:82]
  wire  _T_323 = _T_305 & _T_322; // @[exu_div_ctl.scala 818:67]
  wire  _T_324 = _T_319 | _T_323; // @[exu_div_ctl.scala 818:43]
  wire  _T_326 = ~_T_295[37]; // @[exu_div_ctl.scala 819:6]
  wire  _T_327 = _T_326 ^ control_ff[2]; // @[exu_div_ctl.scala 819:23]
  wire  _T_330 = _T_295 == 38'h0; // @[exu_div_ctl.scala 819:82]
  wire  _T_331 = _T_305 & _T_330; // @[exu_div_ctl.scala 819:67]
  wire  _T_332 = _T_327 | _T_331; // @[exu_div_ctl.scala 819:43]
  wire [37:0] _T_239 = _T_291 + _T_297; // @[exu_div_ctl.scala 810:85]
  wire [37:0] adder11_out = _T_239 + b_ff; // @[exu_div_ctl.scala 810:107]
  wire  _T_334 = ~adder11_out[37]; // @[exu_div_ctl.scala 820:6]
  wire  _T_335 = _T_334 ^ control_ff[2]; // @[exu_div_ctl.scala 820:23]
  wire  _T_338 = adder11_out == 38'h0; // @[exu_div_ctl.scala 820:82]
  wire  _T_339 = _T_305 & _T_338; // @[exu_div_ctl.scala 820:67]
  wire  _T_340 = _T_335 | _T_339; // @[exu_div_ctl.scala 820:43]
  wire  _T_342 = ~_T_239[37]; // @[exu_div_ctl.scala 821:6]
  wire  _T_343 = _T_342 ^ control_ff[2]; // @[exu_div_ctl.scala 821:23]
  wire  _T_346 = _T_239 == 38'h0; // @[exu_div_ctl.scala 821:82]
  wire  _T_347 = _T_305 & _T_346; // @[exu_div_ctl.scala 821:67]
  wire  _T_348 = _T_343 | _T_347; // @[exu_div_ctl.scala 821:43]
  wire [37:0] adder9_out = _T_291 + b_ff; // @[exu_div_ctl.scala 808:85]
  wire  _T_350 = ~adder9_out[37]; // @[exu_div_ctl.scala 822:6]
  wire  _T_351 = _T_350 ^ control_ff[2]; // @[exu_div_ctl.scala 822:22]
  wire  _T_354 = adder9_out == 38'h0; // @[exu_div_ctl.scala 822:80]
  wire  _T_355 = _T_305 & _T_354; // @[exu_div_ctl.scala 822:66]
  wire  _T_356 = _T_351 | _T_355; // @[exu_div_ctl.scala 822:42]
  wire  _T_358 = ~_T_291[37]; // @[exu_div_ctl.scala 823:6]
  wire  _T_359 = _T_358 ^ control_ff[2]; // @[exu_div_ctl.scala 823:22]
  wire  _T_362 = _T_291 == 38'h0; // @[exu_div_ctl.scala 823:80]
  wire  _T_363 = _T_305 & _T_362; // @[exu_div_ctl.scala 823:66]
  wire  _T_364 = _T_359 | _T_363; // @[exu_div_ctl.scala 823:42]
  wire [37:0] _T_191 = _T_287 + _T_293; // @[exu_div_ctl.scala 806:57]
  wire [37:0] _T_195 = _T_191 + _T_297; // @[exu_div_ctl.scala 806:84]
  wire [37:0] adder7_out = _T_195 + b_ff; // @[exu_div_ctl.scala 806:106]
  wire  _T_366 = ~adder7_out[37]; // @[exu_div_ctl.scala 824:6]
  wire  _T_367 = _T_366 ^ control_ff[2]; // @[exu_div_ctl.scala 824:22]
  wire  _T_370 = adder7_out == 38'h0; // @[exu_div_ctl.scala 824:80]
  wire  _T_371 = _T_305 & _T_370; // @[exu_div_ctl.scala 824:66]
  wire  _T_372 = _T_367 | _T_371; // @[exu_div_ctl.scala 824:42]
  wire  _T_374 = ~_T_195[37]; // @[exu_div_ctl.scala 825:6]
  wire  _T_375 = _T_374 ^ control_ff[2]; // @[exu_div_ctl.scala 825:22]
  wire  _T_378 = _T_195 == 38'h0; // @[exu_div_ctl.scala 825:80]
  wire  _T_379 = _T_305 & _T_378; // @[exu_div_ctl.scala 825:66]
  wire  _T_380 = _T_375 | _T_379; // @[exu_div_ctl.scala 825:42]
  wire [37:0] adder5_out = _T_191 + b_ff; // @[exu_div_ctl.scala 804:84]
  wire  _T_382 = ~adder5_out[37]; // @[exu_div_ctl.scala 826:6]
  wire  _T_383 = _T_382 ^ control_ff[2]; // @[exu_div_ctl.scala 826:22]
  wire  _T_386 = adder5_out == 38'h0; // @[exu_div_ctl.scala 826:80]
  wire  _T_387 = _T_305 & _T_386; // @[exu_div_ctl.scala 826:66]
  wire  _T_388 = _T_383 | _T_387; // @[exu_div_ctl.scala 826:42]
  wire  _T_390 = ~_T_191[37]; // @[exu_div_ctl.scala 827:6]
  wire  _T_391 = _T_390 ^ control_ff[2]; // @[exu_div_ctl.scala 827:22]
  wire  _T_394 = _T_191 == 38'h0; // @[exu_div_ctl.scala 827:80]
  wire  _T_395 = _T_305 & _T_394; // @[exu_div_ctl.scala 827:66]
  wire  _T_396 = _T_391 | _T_395; // @[exu_div_ctl.scala 827:42]
  wire [36:0] _T_146 = {r_ff,a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [36:0] _T_148 = {b_ff[35:0],1'h0}; // @[Cat.scala 29:58]
  wire [36:0] _T_150 = _T_146 + _T_148; // @[exu_div_ctl.scala 802:48]
  wire [36:0] adder3_out = _T_150 + b_ff[36:0]; // @[exu_div_ctl.scala 802:70]
  wire  _T_398 = ~adder3_out[36]; // @[exu_div_ctl.scala 828:6]
  wire  _T_399 = _T_398 ^ control_ff[2]; // @[exu_div_ctl.scala 828:22]
  wire  _T_402 = adder3_out == 37'h0; // @[exu_div_ctl.scala 828:80]
  wire  _T_403 = _T_305 & _T_402; // @[exu_div_ctl.scala 828:66]
  wire  _T_404 = _T_399 | _T_403; // @[exu_div_ctl.scala 828:42]
  wire [35:0] _T_140 = {r_ff[31:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [35:0] _T_142 = {b_ff[34:0],1'h0}; // @[Cat.scala 29:58]
  wire [35:0] adder2_out = _T_140 + _T_142; // @[exu_div_ctl.scala 801:48]
  wire  _T_406 = ~adder2_out[35]; // @[exu_div_ctl.scala 829:6]
  wire  _T_407 = _T_406 ^ control_ff[2]; // @[exu_div_ctl.scala 829:22]
  wire  _T_410 = adder2_out == 36'h0; // @[exu_div_ctl.scala 829:80]
  wire  _T_411 = _T_305 & _T_410; // @[exu_div_ctl.scala 829:66]
  wire  _T_412 = _T_407 | _T_411; // @[exu_div_ctl.scala 829:42]
  wire [34:0] _T_135 = {r_ff[30:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [34:0] adder1_out = _T_135 + b_ff[34:0]; // @[exu_div_ctl.scala 800:48]
  wire  _T_414 = ~adder1_out[34]; // @[exu_div_ctl.scala 830:6]
  wire  _T_415 = _T_414 ^ control_ff[2]; // @[exu_div_ctl.scala 830:22]
  wire  _T_418 = adder1_out == 35'h0; // @[exu_div_ctl.scala 830:80]
  wire  _T_419 = _T_305 & _T_418; // @[exu_div_ctl.scala 830:66]
  wire  _T_420 = _T_415 | _T_419; // @[exu_div_ctl.scala 830:42]
  wire [7:0] _T_427 = {_T_372,_T_380,_T_388,_T_396,_T_404,_T_412,_T_420,1'h0}; // @[Cat.scala 29:58]
  wire [15:0] quotient_raw = {_T_308,_T_316,_T_324,_T_332,_T_340,_T_348,_T_356,_T_364,_T_427}; // @[Cat.scala 29:58]
  wire  _T_441 = quotient_raw[15:8] == 8'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_446 = quotient_raw[15:9] == 7'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_479 = _T_441 | _T_446; // @[Mux.scala 27:72]
  wire  _T_451 = quotient_raw[15:10] == 6'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_480 = _T_479 | _T_451; // @[Mux.scala 27:72]
  wire  _T_456 = quotient_raw[15:11] == 5'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_481 = _T_480 | _T_456; // @[Mux.scala 27:72]
  wire  _T_461 = quotient_raw[15:12] == 4'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_482 = _T_481 | _T_461; // @[Mux.scala 27:72]
  wire  _T_466 = quotient_raw[15:13] == 3'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_483 = _T_482 | _T_466; // @[Mux.scala 27:72]
  wire  _T_470 = quotient_raw[15:14] == 2'h1; // @[exu_div_ctl.scala 833:76]
  wire  _T_484 = _T_483 | _T_470; // @[Mux.scala 27:72]
  wire  _T_486 = quotient_raw[15] | _T_484; // @[exu_div_ctl.scala 833:31]
  wire  _T_490 = quotient_raw[15:4] == 12'h0; // @[exu_div_ctl.scala 835:26]
  wire  _T_494 = quotient_raw[15:5] == 11'h0; // @[exu_div_ctl.scala 835:77]
  wire  _T_495 = _T_490 | _T_494; // @[exu_div_ctl.scala 835:54]
  wire  _T_499 = quotient_raw[15:6] == 10'h0; // @[exu_div_ctl.scala 835:128]
  wire  _T_500 = _T_495 | _T_499; // @[exu_div_ctl.scala 835:105]
  wire  _T_504 = quotient_raw[15:7] == 9'h0; // @[exu_div_ctl.scala 836:28]
  wire  _T_505 = _T_500 | _T_504; // @[exu_div_ctl.scala 835:155]
  wire  _T_509 = quotient_raw[15:12] == 4'h0; // @[exu_div_ctl.scala 836:76]
  wire  _T_510 = _T_505 | _T_509; // @[exu_div_ctl.scala 836:53]
  wire  _T_514 = quotient_raw[15:13] == 3'h0; // @[exu_div_ctl.scala 836:119]
  wire  _T_515 = _T_510 | _T_514; // @[exu_div_ctl.scala 836:96]
  wire  _T_519 = quotient_raw[15:14] == 2'h0; // @[exu_div_ctl.scala 837:28]
  wire  _T_520 = _T_515 | _T_519; // @[exu_div_ctl.scala 836:138]
  wire  _T_523 = _T_520 | quotient_raw[15]; // @[exu_div_ctl.scala 837:46]
  wire  _T_527 = quotient_raw[15:2] == 14'h0; // @[exu_div_ctl.scala 839:26]
  wire  _T_531 = quotient_raw[15:3] == 13'h0; // @[exu_div_ctl.scala 839:79]
  wire  _T_532 = _T_527 | _T_531; // @[exu_div_ctl.scala 839:56]
  wire  _T_537 = _T_532 | _T_499; // @[exu_div_ctl.scala 839:109]
  wire  _T_542 = _T_537 | _T_504; // @[exu_div_ctl.scala 839:159]
  wire  _T_546 = quotient_raw[15:10] == 6'h0; // @[exu_div_ctl.scala 840:79]
  wire  _T_547 = _T_542 | _T_546; // @[exu_div_ctl.scala 840:56]
  wire  _T_551 = quotient_raw[15:11] == 5'h0; // @[exu_div_ctl.scala 840:124]
  wire  _T_552 = _T_547 | _T_551; // @[exu_div_ctl.scala 840:101]
  wire  _T_557 = _T_552 | _T_519; // @[exu_div_ctl.scala 840:145]
  wire  _T_560 = _T_557 | quotient_raw[15]; // @[exu_div_ctl.scala 841:48]
  wire  _T_566 = quotient_raw[15:1] == 15'h1; // @[exu_div_ctl.scala 843:81]
  wire  _T_571 = quotient_raw[15:3] == 13'h1; // @[exu_div_ctl.scala 843:81]
  wire  _T_605 = _T_566 | _T_571; // @[Mux.scala 27:72]
  wire  _T_576 = quotient_raw[15:5] == 11'h1; // @[exu_div_ctl.scala 843:81]
  wire  _T_606 = _T_605 | _T_576; // @[Mux.scala 27:72]
  wire  _T_581 = quotient_raw[15:7] == 9'h1; // @[exu_div_ctl.scala 843:81]
  wire  _T_607 = _T_606 | _T_581; // @[Mux.scala 27:72]
  wire  _T_608 = _T_607 | _T_446; // @[Mux.scala 27:72]
  wire  _T_609 = _T_608 | _T_456; // @[Mux.scala 27:72]
  wire  _T_610 = _T_609 | _T_466; // @[Mux.scala 27:72]
  wire  _T_612 = quotient_raw[15] | _T_610; // @[exu_div_ctl.scala 843:31]
  wire [3:0] quotient_new = {_T_486,_T_523,_T_560,_T_612}; // @[Cat.scala 29:58]
  wire  _T_85 = quotient_new == 4'h0; // @[exu_div_ctl.scala 798:71]
  wire  _T_86 = running_state & _T_85; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_0 = _T_86 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_88 = quotient_new == 4'h1; // @[exu_div_ctl.scala 798:71]
  wire  _T_89 = running_state & _T_88; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_1 = _T_89 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_91 = quotient_new == 4'h2; // @[exu_div_ctl.scala 798:71]
  wire  _T_92 = running_state & _T_91; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_2 = _T_92 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_94 = quotient_new == 4'h3; // @[exu_div_ctl.scala 798:71]
  wire  _T_95 = running_state & _T_94; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_3 = _T_95 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_97 = quotient_new == 4'h4; // @[exu_div_ctl.scala 798:71]
  wire  _T_98 = running_state & _T_97; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_4 = _T_98 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_100 = quotient_new == 4'h5; // @[exu_div_ctl.scala 798:71]
  wire  _T_101 = running_state & _T_100; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_5 = _T_101 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_103 = quotient_new == 4'h6; // @[exu_div_ctl.scala 798:71]
  wire  _T_104 = running_state & _T_103; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_6 = _T_104 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_106 = quotient_new == 4'h7; // @[exu_div_ctl.scala 798:71]
  wire  _T_107 = running_state & _T_106; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_7 = _T_107 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_109 = quotient_new == 4'h8; // @[exu_div_ctl.scala 798:71]
  wire  _T_110 = running_state & _T_109; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_8 = _T_110 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_112 = quotient_new == 4'h9; // @[exu_div_ctl.scala 798:71]
  wire  _T_113 = running_state & _T_112; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_9 = _T_113 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_115 = quotient_new == 4'ha; // @[exu_div_ctl.scala 798:71]
  wire  _T_116 = running_state & _T_115; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_10 = _T_116 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_118 = quotient_new == 4'hb; // @[exu_div_ctl.scala 798:71]
  wire  _T_119 = running_state & _T_118; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_11 = _T_119 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_121 = quotient_new == 4'hc; // @[exu_div_ctl.scala 798:71]
  wire  _T_122 = running_state & _T_121; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_12 = _T_122 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_124 = quotient_new == 4'hd; // @[exu_div_ctl.scala 798:71]
  wire  _T_125 = running_state & _T_124; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_13 = _T_125 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_127 = quotient_new == 4'he; // @[exu_div_ctl.scala 798:71]
  wire  _T_128 = running_state & _T_127; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_14 = _T_128 & _T_66; // @[exu_div_ctl.scala 798:85]
  wire  _T_130 = quotient_new == 4'hf; // @[exu_div_ctl.scala 798:71]
  wire  _T_131 = running_state & _T_130; // @[exu_div_ctl.scala 798:55]
  wire  r_adder_sel_15 = _T_131 & _T_66; // @[exu_div_ctl.scala 798:85]
  reg [31:0] q_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_617 = twos_comp_q_sel ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_618 = b_twos_comp ? b_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] twos_comp_in = _T_617 | _T_618; // @[Mux.scala 27:72]
  wire  _T_622 = |twos_comp_in[0]; // @[lib.scala 428:35]
  wire  _T_624 = ~twos_comp_in[1]; // @[lib.scala 428:40]
  wire  _T_626 = _T_622 ? _T_624 : twos_comp_in[1]; // @[lib.scala 428:23]
  wire  _T_628 = |twos_comp_in[1:0]; // @[lib.scala 428:35]
  wire  _T_630 = ~twos_comp_in[2]; // @[lib.scala 428:40]
  wire  _T_632 = _T_628 ? _T_630 : twos_comp_in[2]; // @[lib.scala 428:23]
  wire  _T_634 = |twos_comp_in[2:0]; // @[lib.scala 428:35]
  wire  _T_636 = ~twos_comp_in[3]; // @[lib.scala 428:40]
  wire  _T_638 = _T_634 ? _T_636 : twos_comp_in[3]; // @[lib.scala 428:23]
  wire  _T_640 = |twos_comp_in[3:0]; // @[lib.scala 428:35]
  wire  _T_642 = ~twos_comp_in[4]; // @[lib.scala 428:40]
  wire  _T_644 = _T_640 ? _T_642 : twos_comp_in[4]; // @[lib.scala 428:23]
  wire  _T_646 = |twos_comp_in[4:0]; // @[lib.scala 428:35]
  wire  _T_648 = ~twos_comp_in[5]; // @[lib.scala 428:40]
  wire  _T_650 = _T_646 ? _T_648 : twos_comp_in[5]; // @[lib.scala 428:23]
  wire  _T_652 = |twos_comp_in[5:0]; // @[lib.scala 428:35]
  wire  _T_654 = ~twos_comp_in[6]; // @[lib.scala 428:40]
  wire  _T_656 = _T_652 ? _T_654 : twos_comp_in[6]; // @[lib.scala 428:23]
  wire  _T_658 = |twos_comp_in[6:0]; // @[lib.scala 428:35]
  wire  _T_660 = ~twos_comp_in[7]; // @[lib.scala 428:40]
  wire  _T_662 = _T_658 ? _T_660 : twos_comp_in[7]; // @[lib.scala 428:23]
  wire  _T_664 = |twos_comp_in[7:0]; // @[lib.scala 428:35]
  wire  _T_666 = ~twos_comp_in[8]; // @[lib.scala 428:40]
  wire  _T_668 = _T_664 ? _T_666 : twos_comp_in[8]; // @[lib.scala 428:23]
  wire  _T_670 = |twos_comp_in[8:0]; // @[lib.scala 428:35]
  wire  _T_672 = ~twos_comp_in[9]; // @[lib.scala 428:40]
  wire  _T_674 = _T_670 ? _T_672 : twos_comp_in[9]; // @[lib.scala 428:23]
  wire  _T_676 = |twos_comp_in[9:0]; // @[lib.scala 428:35]
  wire  _T_678 = ~twos_comp_in[10]; // @[lib.scala 428:40]
  wire  _T_680 = _T_676 ? _T_678 : twos_comp_in[10]; // @[lib.scala 428:23]
  wire  _T_682 = |twos_comp_in[10:0]; // @[lib.scala 428:35]
  wire  _T_684 = ~twos_comp_in[11]; // @[lib.scala 428:40]
  wire  _T_686 = _T_682 ? _T_684 : twos_comp_in[11]; // @[lib.scala 428:23]
  wire  _T_688 = |twos_comp_in[11:0]; // @[lib.scala 428:35]
  wire  _T_690 = ~twos_comp_in[12]; // @[lib.scala 428:40]
  wire  _T_692 = _T_688 ? _T_690 : twos_comp_in[12]; // @[lib.scala 428:23]
  wire  _T_694 = |twos_comp_in[12:0]; // @[lib.scala 428:35]
  wire  _T_696 = ~twos_comp_in[13]; // @[lib.scala 428:40]
  wire  _T_698 = _T_694 ? _T_696 : twos_comp_in[13]; // @[lib.scala 428:23]
  wire  _T_700 = |twos_comp_in[13:0]; // @[lib.scala 428:35]
  wire  _T_702 = ~twos_comp_in[14]; // @[lib.scala 428:40]
  wire  _T_704 = _T_700 ? _T_702 : twos_comp_in[14]; // @[lib.scala 428:23]
  wire  _T_706 = |twos_comp_in[14:0]; // @[lib.scala 428:35]
  wire  _T_708 = ~twos_comp_in[15]; // @[lib.scala 428:40]
  wire  _T_710 = _T_706 ? _T_708 : twos_comp_in[15]; // @[lib.scala 428:23]
  wire  _T_712 = |twos_comp_in[15:0]; // @[lib.scala 428:35]
  wire  _T_714 = ~twos_comp_in[16]; // @[lib.scala 428:40]
  wire  _T_716 = _T_712 ? _T_714 : twos_comp_in[16]; // @[lib.scala 428:23]
  wire  _T_718 = |twos_comp_in[16:0]; // @[lib.scala 428:35]
  wire  _T_720 = ~twos_comp_in[17]; // @[lib.scala 428:40]
  wire  _T_722 = _T_718 ? _T_720 : twos_comp_in[17]; // @[lib.scala 428:23]
  wire  _T_724 = |twos_comp_in[17:0]; // @[lib.scala 428:35]
  wire  _T_726 = ~twos_comp_in[18]; // @[lib.scala 428:40]
  wire  _T_728 = _T_724 ? _T_726 : twos_comp_in[18]; // @[lib.scala 428:23]
  wire  _T_730 = |twos_comp_in[18:0]; // @[lib.scala 428:35]
  wire  _T_732 = ~twos_comp_in[19]; // @[lib.scala 428:40]
  wire  _T_734 = _T_730 ? _T_732 : twos_comp_in[19]; // @[lib.scala 428:23]
  wire  _T_736 = |twos_comp_in[19:0]; // @[lib.scala 428:35]
  wire  _T_738 = ~twos_comp_in[20]; // @[lib.scala 428:40]
  wire  _T_740 = _T_736 ? _T_738 : twos_comp_in[20]; // @[lib.scala 428:23]
  wire  _T_742 = |twos_comp_in[20:0]; // @[lib.scala 428:35]
  wire  _T_744 = ~twos_comp_in[21]; // @[lib.scala 428:40]
  wire  _T_746 = _T_742 ? _T_744 : twos_comp_in[21]; // @[lib.scala 428:23]
  wire  _T_748 = |twos_comp_in[21:0]; // @[lib.scala 428:35]
  wire  _T_750 = ~twos_comp_in[22]; // @[lib.scala 428:40]
  wire  _T_752 = _T_748 ? _T_750 : twos_comp_in[22]; // @[lib.scala 428:23]
  wire  _T_754 = |twos_comp_in[22:0]; // @[lib.scala 428:35]
  wire  _T_756 = ~twos_comp_in[23]; // @[lib.scala 428:40]
  wire  _T_758 = _T_754 ? _T_756 : twos_comp_in[23]; // @[lib.scala 428:23]
  wire  _T_760 = |twos_comp_in[23:0]; // @[lib.scala 428:35]
  wire  _T_762 = ~twos_comp_in[24]; // @[lib.scala 428:40]
  wire  _T_764 = _T_760 ? _T_762 : twos_comp_in[24]; // @[lib.scala 428:23]
  wire  _T_766 = |twos_comp_in[24:0]; // @[lib.scala 428:35]
  wire  _T_768 = ~twos_comp_in[25]; // @[lib.scala 428:40]
  wire  _T_770 = _T_766 ? _T_768 : twos_comp_in[25]; // @[lib.scala 428:23]
  wire  _T_772 = |twos_comp_in[25:0]; // @[lib.scala 428:35]
  wire  _T_774 = ~twos_comp_in[26]; // @[lib.scala 428:40]
  wire  _T_776 = _T_772 ? _T_774 : twos_comp_in[26]; // @[lib.scala 428:23]
  wire  _T_778 = |twos_comp_in[26:0]; // @[lib.scala 428:35]
  wire  _T_780 = ~twos_comp_in[27]; // @[lib.scala 428:40]
  wire  _T_782 = _T_778 ? _T_780 : twos_comp_in[27]; // @[lib.scala 428:23]
  wire  _T_784 = |twos_comp_in[27:0]; // @[lib.scala 428:35]
  wire  _T_786 = ~twos_comp_in[28]; // @[lib.scala 428:40]
  wire  _T_788 = _T_784 ? _T_786 : twos_comp_in[28]; // @[lib.scala 428:23]
  wire  _T_790 = |twos_comp_in[28:0]; // @[lib.scala 428:35]
  wire  _T_792 = ~twos_comp_in[29]; // @[lib.scala 428:40]
  wire  _T_794 = _T_790 ? _T_792 : twos_comp_in[29]; // @[lib.scala 428:23]
  wire  _T_796 = |twos_comp_in[29:0]; // @[lib.scala 428:35]
  wire  _T_798 = ~twos_comp_in[30]; // @[lib.scala 428:40]
  wire  _T_800 = _T_796 ? _T_798 : twos_comp_in[30]; // @[lib.scala 428:23]
  wire  _T_802 = |twos_comp_in[30:0]; // @[lib.scala 428:35]
  wire  _T_804 = ~twos_comp_in[31]; // @[lib.scala 428:40]
  wire  _T_806 = _T_802 ? _T_804 : twos_comp_in[31]; // @[lib.scala 428:23]
  wire [6:0] _T_812 = {_T_662,_T_656,_T_650,_T_644,_T_638,_T_632,_T_626}; // @[lib.scala 430:14]
  wire [14:0] _T_820 = {_T_710,_T_704,_T_698,_T_692,_T_686,_T_680,_T_674,_T_668,_T_812}; // @[lib.scala 430:14]
  wire [7:0] _T_827 = {_T_758,_T_752,_T_746,_T_740,_T_734,_T_728,_T_722,_T_716}; // @[lib.scala 430:14]
  wire [30:0] _T_836 = {_T_806,_T_800,_T_794,_T_788,_T_782,_T_776,_T_770,_T_764,_T_827,_T_820}; // @[lib.scala 430:14]
  wire [31:0] twos_comp_out = {_T_836,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire  _T_838 = ~a_shift; // @[exu_div_ctl.scala 851:6]
  wire  _T_840 = _T_838 & _T_66; // @[exu_div_ctl.scala 851:15]
  wire [31:0] _T_844 = {a_ff[27:0],4'h0}; // @[Cat.scala 29:58]
  wire [64:0] ar_shifted = _T_71[64:0]; // @[exu_div_ctl.scala 791:28]
  wire [31:0] _T_846 = _T_840 ? io_dividend_in : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_847 = a_shift ? _T_844 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_848 = shortq_enable_ff ? ar_shifted[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_849 = _T_846 | _T_847; // @[Mux.scala 27:72]
  wire [31:0] a_in = _T_849 | _T_848; // @[Mux.scala 27:72]
  wire  _T_851 = ~b_twos_comp; // @[exu_div_ctl.scala 856:5]
  wire  _T_853 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 856:63]
  wire [32:0] _T_855 = {_T_853,io_divisor_in}; // @[Cat.scala 29:58]
  wire  _T_856 = ~control_ff[1]; // @[exu_div_ctl.scala 857:49]
  wire [32:0] _T_858 = {_T_856,_T_836,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_859 = _T_851 ? _T_855 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_860 = b_twos_comp ? _T_858 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] b_in = _T_859 | _T_860; // @[Mux.scala 27:72]
  wire [32:0] _T_865 = {r_ff[28:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [32:0] _T_883 = {1'h0,a_ff}; // @[Cat.scala 29:58]
  wire [32:0] _T_884 = r_sign_sel ? 33'h1ffffffff : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_885 = r_adder_sel_0 ? _T_865 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_886 = r_adder_sel_1 ? adder1_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_887 = r_adder_sel_2 ? adder2_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_888 = r_adder_sel_3 ? adder3_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_889 = r_adder_sel_4 ? _T_191[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_890 = r_adder_sel_5 ? adder5_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_891 = r_adder_sel_6 ? _T_195[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_892 = r_adder_sel_7 ? adder7_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_893 = r_adder_sel_8 ? _T_291[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_894 = r_adder_sel_9 ? adder9_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_895 = r_adder_sel_10 ? _T_239[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_896 = r_adder_sel_11 ? adder11_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_897 = r_adder_sel_12 ? _T_295[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_898 = r_adder_sel_13 ? adder13_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_899 = r_adder_sel_14 ? _T_299[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_900 = r_adder_sel_15 ? adder15_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_901 = shortq_enable_ff ? ar_shifted[64:32] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_902 = by_zero_case ? _T_883 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_903 = _T_884 | _T_885; // @[Mux.scala 27:72]
  wire [32:0] _T_904 = _T_903 | _T_886; // @[Mux.scala 27:72]
  wire [32:0] _T_905 = _T_904 | _T_887; // @[Mux.scala 27:72]
  wire [32:0] _T_906 = _T_905 | _T_888; // @[Mux.scala 27:72]
  wire [32:0] _T_907 = _T_906 | _T_889; // @[Mux.scala 27:72]
  wire [32:0] _T_908 = _T_907 | _T_890; // @[Mux.scala 27:72]
  wire [32:0] _T_909 = _T_908 | _T_891; // @[Mux.scala 27:72]
  wire [32:0] _T_910 = _T_909 | _T_892; // @[Mux.scala 27:72]
  wire [32:0] _T_911 = _T_910 | _T_893; // @[Mux.scala 27:72]
  wire [32:0] _T_912 = _T_911 | _T_894; // @[Mux.scala 27:72]
  wire [32:0] _T_913 = _T_912 | _T_895; // @[Mux.scala 27:72]
  wire [32:0] _T_914 = _T_913 | _T_896; // @[Mux.scala 27:72]
  wire [32:0] _T_915 = _T_914 | _T_897; // @[Mux.scala 27:72]
  wire [32:0] _T_916 = _T_915 | _T_898; // @[Mux.scala 27:72]
  wire [32:0] _T_917 = _T_916 | _T_899; // @[Mux.scala 27:72]
  wire [32:0] _T_918 = _T_917 | _T_900; // @[Mux.scala 27:72]
  wire [32:0] _T_919 = _T_918 | _T_901; // @[Mux.scala 27:72]
  wire [32:0] r_in = _T_919 | _T_902; // @[Mux.scala 27:72]
  wire [31:0] _T_923 = {q_ff[27:0],_T_486,_T_523,_T_560,_T_612}; // @[Cat.scala 29:58]
  wire  _T_946 = ~b_ff[3]; // @[exu_div_ctl.scala 893:70]
  wire  _T_948 = ~b_ff[2]; // @[exu_div_ctl.scala 893:70]
  wire  _T_951 = _T_946 & _T_948; // @[exu_div_ctl.scala 893:95]
  wire  _T_950 = ~b_ff[1]; // @[exu_div_ctl.scala 893:70]
  wire  _T_952 = _T_951 & _T_950; // @[exu_div_ctl.scala 893:95]
  wire  _T_953 = a_ff[3] & _T_952; // @[exu_div_ctl.scala 894:11]
  wire  _T_960 = a_ff[3] & _T_951; // @[exu_div_ctl.scala 894:11]
  wire  _T_962 = ~b_ff[0]; // @[exu_div_ctl.scala 899:33]
  wire  _T_963 = _T_960 & _T_962; // @[exu_div_ctl.scala 899:31]
  wire  _T_973 = a_ff[2] & _T_952; // @[exu_div_ctl.scala 894:11]
  wire  _T_974 = _T_963 | _T_973; // @[exu_div_ctl.scala 899:42]
  wire  _T_977 = a_ff[3] & a_ff[2]; // @[exu_div_ctl.scala 892:95]
  wire  _T_983 = _T_977 & _T_951; // @[exu_div_ctl.scala 894:11]
  wire  _T_984 = _T_974 | _T_983; // @[exu_div_ctl.scala 899:75]
  wire  _T_991 = a_ff[2] & _T_951; // @[exu_div_ctl.scala 894:11]
  wire  _T_994 = _T_991 & _T_962; // @[exu_div_ctl.scala 901:31]
  wire  _T_1004 = a_ff[1] & _T_952; // @[exu_div_ctl.scala 894:11]
  wire  _T_1005 = _T_994 | _T_1004; // @[exu_div_ctl.scala 901:42]
  wire  _T_1011 = _T_946 & _T_950; // @[exu_div_ctl.scala 893:95]
  wire  _T_1012 = a_ff[3] & _T_1011; // @[exu_div_ctl.scala 894:11]
  wire  _T_1015 = _T_1012 & _T_962; // @[exu_div_ctl.scala 901:106]
  wire  _T_1016 = _T_1005 | _T_1015; // @[exu_div_ctl.scala 901:78]
  wire  _T_1019 = ~a_ff[2]; // @[exu_div_ctl.scala 892:70]
  wire  _T_1020 = a_ff[3] & _T_1019; // @[exu_div_ctl.scala 892:95]
  wire  _T_1028 = _T_951 & b_ff[1]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1029 = _T_1028 & b_ff[0]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1030 = _T_1020 & _T_1029; // @[exu_div_ctl.scala 894:11]
  wire  _T_1031 = _T_1016 | _T_1030; // @[exu_div_ctl.scala 901:117]
  wire  _T_1033 = ~a_ff[3]; // @[exu_div_ctl.scala 892:70]
  wire  _T_1036 = _T_1033 & a_ff[2]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1037 = _T_1036 & a_ff[1]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1043 = _T_1037 & _T_951; // @[exu_div_ctl.scala 894:11]
  wire  _T_1044 = _T_1031 | _T_1043; // @[exu_div_ctl.scala 902:44]
  wire  _T_1050 = _T_977 & _T_946; // @[exu_div_ctl.scala 894:11]
  wire  _T_1053 = _T_1050 & _T_962; // @[exu_div_ctl.scala 902:107]
  wire  _T_1054 = _T_1044 | _T_1053; // @[exu_div_ctl.scala 902:80]
  wire  _T_1063 = _T_946 & b_ff[2]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1064 = _T_1063 & _T_950; // @[exu_div_ctl.scala 893:95]
  wire  _T_1065 = _T_977 & _T_1064; // @[exu_div_ctl.scala 894:11]
  wire  _T_1066 = _T_1054 | _T_1065; // @[exu_div_ctl.scala 902:119]
  wire  _T_1069 = a_ff[3] & a_ff[1]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1075 = _T_1069 & _T_1011; // @[exu_div_ctl.scala 894:11]
  wire  _T_1076 = _T_1066 | _T_1075; // @[exu_div_ctl.scala 903:44]
  wire  _T_1081 = _T_977 & a_ff[1]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1086 = _T_1081 & _T_1063; // @[exu_div_ctl.scala 894:11]
  wire  _T_1087 = _T_1076 | _T_1086; // @[exu_div_ctl.scala 903:79]
  wire  _T_1091 = a_ff[2] & a_ff[1]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1092 = _T_1091 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1098 = _T_1092 & _T_1011; // @[exu_div_ctl.scala 894:11]
  wire  _T_1104 = _T_1020 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1109 = _T_946 & b_ff[1]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1110 = _T_1109 & b_ff[0]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1111 = _T_1104 & _T_1110; // @[exu_div_ctl.scala 894:11]
  wire  _T_1112 = _T_1098 | _T_1111; // @[exu_div_ctl.scala 905:45]
  wire  _T_1119 = a_ff[2] & _T_1011; // @[exu_div_ctl.scala 894:11]
  wire  _T_1122 = _T_1119 & _T_962; // @[exu_div_ctl.scala 905:114]
  wire  _T_1123 = _T_1112 | _T_1122; // @[exu_div_ctl.scala 905:86]
  wire  _T_1130 = a_ff[1] & _T_951; // @[exu_div_ctl.scala 894:11]
  wire  _T_1133 = _T_1130 & _T_962; // @[exu_div_ctl.scala 906:33]
  wire  _T_1134 = _T_1123 | _T_1133; // @[exu_div_ctl.scala 905:129]
  wire  _T_1144 = a_ff[0] & _T_952; // @[exu_div_ctl.scala 894:11]
  wire  _T_1145 = _T_1134 | _T_1144; // @[exu_div_ctl.scala 906:47]
  wire  _T_1150 = ~a_ff[1]; // @[exu_div_ctl.scala 892:70]
  wire  _T_1152 = _T_1036 & _T_1150; // @[exu_div_ctl.scala 892:95]
  wire  _T_1162 = _T_1152 & _T_1029; // @[exu_div_ctl.scala 894:11]
  wire  _T_1163 = _T_1145 | _T_1162; // @[exu_div_ctl.scala 906:88]
  wire  _T_1172 = _T_1037 & _T_946; // @[exu_div_ctl.scala 894:11]
  wire  _T_1175 = _T_1172 & _T_962; // @[exu_div_ctl.scala 907:36]
  wire  _T_1176 = _T_1163 | _T_1175; // @[exu_div_ctl.scala 906:131]
  wire  _T_1182 = _T_948 & _T_950; // @[exu_div_ctl.scala 893:95]
  wire  _T_1183 = a_ff[3] & _T_1182; // @[exu_div_ctl.scala 894:11]
  wire  _T_1186 = _T_1183 & _T_962; // @[exu_div_ctl.scala 907:76]
  wire  _T_1187 = _T_1176 | _T_1186; // @[exu_div_ctl.scala 907:47]
  wire  _T_1197 = _T_1063 & b_ff[1]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1198 = _T_1020 & _T_1197; // @[exu_div_ctl.scala 894:11]
  wire  _T_1199 = _T_1187 | _T_1198; // @[exu_div_ctl.scala 907:88]
  wire  _T_1213 = _T_1037 & _T_1064; // @[exu_div_ctl.scala 894:11]
  wire  _T_1214 = _T_1199 | _T_1213; // @[exu_div_ctl.scala 907:131]
  wire  _T_1220 = _T_1036 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1226 = _T_1220 & _T_1011; // @[exu_div_ctl.scala 894:11]
  wire  _T_1227 = _T_1214 | _T_1226; // @[exu_div_ctl.scala 908:47]
  wire  _T_1234 = _T_1020 & _T_1150; // @[exu_div_ctl.scala 892:95]
  wire  _T_1240 = _T_1063 & b_ff[0]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1241 = _T_1234 & _T_1240; // @[exu_div_ctl.scala 894:11]
  wire  _T_1242 = _T_1227 | _T_1241; // @[exu_div_ctl.scala 908:88]
  wire  _T_1247 = _T_1019 & a_ff[1]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1248 = _T_1247 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1254 = _T_1248 & _T_951; // @[exu_div_ctl.scala 894:11]
  wire  _T_1255 = _T_1242 | _T_1254; // @[exu_div_ctl.scala 908:131]
  wire  _T_1261 = _T_977 & _T_950; // @[exu_div_ctl.scala 894:11]
  wire  _T_1264 = _T_1261 & _T_962; // @[exu_div_ctl.scala 909:75]
  wire  _T_1265 = _T_1255 | _T_1264; // @[exu_div_ctl.scala 909:47]
  wire  _T_1273 = _T_1037 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1278 = _T_1273 & _T_1063; // @[exu_div_ctl.scala 894:11]
  wire  _T_1279 = _T_1265 | _T_1278; // @[exu_div_ctl.scala 909:88]
  wire  _T_1286 = b_ff[3] & _T_948; // @[exu_div_ctl.scala 893:95]
  wire  _T_1287 = _T_977 & _T_1286; // @[exu_div_ctl.scala 894:11]
  wire  _T_1288 = _T_1279 | _T_1287; // @[exu_div_ctl.scala 909:131]
  wire  _T_1298 = _T_1286 & _T_950; // @[exu_div_ctl.scala 893:95]
  wire  _T_1299 = _T_1069 & _T_1298; // @[exu_div_ctl.scala 894:11]
  wire  _T_1300 = _T_1288 | _T_1299; // @[exu_div_ctl.scala 910:47]
  wire  _T_1303 = a_ff[3] & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1309 = _T_1303 & _T_1182; // @[exu_div_ctl.scala 894:11]
  wire  _T_1310 = _T_1300 | _T_1309; // @[exu_div_ctl.scala 910:88]
  wire  _T_1314 = a_ff[3] & _T_1150; // @[exu_div_ctl.scala 892:95]
  wire  _T_1322 = _T_1197 & b_ff[0]; // @[exu_div_ctl.scala 893:95]
  wire  _T_1323 = _T_1314 & _T_1322; // @[exu_div_ctl.scala 894:11]
  wire  _T_1324 = _T_1310 | _T_1323; // @[exu_div_ctl.scala 910:131]
  wire  _T_1331 = _T_1081 & b_ff[3]; // @[exu_div_ctl.scala 894:11]
  wire  _T_1334 = _T_1331 & _T_962; // @[exu_div_ctl.scala 911:77]
  wire  _T_1335 = _T_1324 | _T_1334; // @[exu_div_ctl.scala 911:47]
  wire  _T_1344 = b_ff[3] & _T_950; // @[exu_div_ctl.scala 893:95]
  wire  _T_1345 = _T_1081 & _T_1344; // @[exu_div_ctl.scala 894:11]
  wire  _T_1346 = _T_1335 | _T_1345; // @[exu_div_ctl.scala 911:88]
  wire  _T_1351 = _T_977 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1356 = _T_1351 & _T_1344; // @[exu_div_ctl.scala 894:11]
  wire  _T_1357 = _T_1346 | _T_1356; // @[exu_div_ctl.scala 911:131]
  wire  _T_1363 = _T_1020 & a_ff[1]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1368 = _T_1363 & _T_1109; // @[exu_div_ctl.scala 894:11]
  wire  _T_1369 = _T_1357 | _T_1368; // @[exu_div_ctl.scala 912:47]
  wire  _T_1374 = _T_1069 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1377 = _T_1374 & _T_948; // @[exu_div_ctl.scala 894:11]
  wire  _T_1378 = _T_1369 | _T_1377; // @[exu_div_ctl.scala 912:88]
  wire  _T_1385 = _T_1081 & a_ff[0]; // @[exu_div_ctl.scala 892:95]
  wire  _T_1387 = _T_1385 & b_ff[3]; // @[exu_div_ctl.scala 894:11]
  wire  _T_1388 = _T_1378 | _T_1387; // @[exu_div_ctl.scala 912:131]
  wire  _T_1394 = _T_1069 & _T_948; // @[exu_div_ctl.scala 894:11]
  wire  _T_1397 = _T_1394 & _T_962; // @[exu_div_ctl.scala 913:74]
  wire  _T_1398 = _T_1388 | _T_1397; // @[exu_div_ctl.scala 913:47]
  wire [31:0] _T_924 = {28'h0,_T_953,_T_984,_T_1087,_T_1398}; // @[Cat.scala 29:58]
  wire [31:0] _T_926 = _T_76 ? _T_923 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_927 = smallnum_case ? _T_924 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_928 = by_zero_case ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_929 = _T_926 | _T_927; // @[Mux.scala 27:72]
  wire [31:0] q_in = _T_929 | _T_928; // @[Mux.scala 27:72]
  wire  _T_934 = ~twos_comp_q_sel; // @[exu_div_ctl.scala 887:16]
  wire  _T_935 = _T_30 & _T_934; // @[exu_div_ctl.scala 887:14]
  wire [31:0] _T_938 = _T_935 ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_939 = control_ff[0] ? r_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_940 = twos_comp_q_sel ? twos_comp_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_941 = _T_938 | _T_939; // @[Mux.scala 27:72]
  wire  _T_1425 = shortq == 6'h1b; // @[exu_div_ctl.scala 929:58]
  wire  _T_1426 = shortq == 6'h1a; // @[exu_div_ctl.scala 929:58]
  wire  _T_1427 = shortq == 6'h19; // @[exu_div_ctl.scala 929:58]
  wire  _T_1428 = shortq == 6'h18; // @[exu_div_ctl.scala 929:58]
  wire  _T_1429 = shortq == 6'h17; // @[exu_div_ctl.scala 929:58]
  wire  _T_1430 = shortq == 6'h16; // @[exu_div_ctl.scala 929:58]
  wire  _T_1431 = shortq == 6'h15; // @[exu_div_ctl.scala 929:58]
  wire  _T_1432 = shortq == 6'h14; // @[exu_div_ctl.scala 929:58]
  wire  _T_1433 = shortq == 6'h13; // @[exu_div_ctl.scala 929:58]
  wire  _T_1434 = shortq == 6'h12; // @[exu_div_ctl.scala 929:58]
  wire  _T_1435 = shortq == 6'h11; // @[exu_div_ctl.scala 929:58]
  wire  _T_1436 = shortq == 6'h10; // @[exu_div_ctl.scala 929:58]
  wire  _T_1437 = shortq == 6'hf; // @[exu_div_ctl.scala 929:58]
  wire  _T_1438 = shortq == 6'he; // @[exu_div_ctl.scala 929:58]
  wire  _T_1439 = shortq == 6'hd; // @[exu_div_ctl.scala 929:58]
  wire  _T_1440 = shortq == 6'hc; // @[exu_div_ctl.scala 929:58]
  wire  _T_1441 = shortq == 6'hb; // @[exu_div_ctl.scala 929:58]
  wire  _T_1442 = shortq == 6'ha; // @[exu_div_ctl.scala 929:58]
  wire  _T_1443 = shortq == 6'h9; // @[exu_div_ctl.scala 929:58]
  wire  _T_1444 = shortq == 6'h8; // @[exu_div_ctl.scala 929:58]
  wire  _T_1445 = shortq == 6'h7; // @[exu_div_ctl.scala 929:58]
  wire  _T_1446 = shortq == 6'h6; // @[exu_div_ctl.scala 929:58]
  wire  _T_1447 = shortq == 6'h5; // @[exu_div_ctl.scala 929:58]
  wire  _T_1448 = shortq == 6'h4; // @[exu_div_ctl.scala 929:58]
  wire  _T_1449 = shortq == 6'h3; // @[exu_div_ctl.scala 929:58]
  wire  _T_1450 = shortq == 6'h2; // @[exu_div_ctl.scala 929:58]
  wire  _T_1451 = shortq == 6'h1; // @[exu_div_ctl.scala 929:58]
  wire  _T_1452 = shortq == 6'h0; // @[exu_div_ctl.scala 929:58]
  wire [2:0] _T_1457 = _T_1425 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1458 = _T_1426 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1459 = _T_1427 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1460 = _T_1428 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1461 = _T_1429 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1462 = _T_1430 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1463 = _T_1431 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1464 = _T_1432 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1465 = _T_1433 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1466 = _T_1434 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1467 = _T_1435 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1468 = _T_1436 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1469 = _T_1437 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1470 = _T_1438 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1471 = _T_1439 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1472 = _T_1440 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1473 = _T_1441 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1474 = _T_1442 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1475 = _T_1443 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1476 = _T_1444 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1477 = _T_1445 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1478 = _T_1446 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1479 = _T_1447 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1480 = _T_1448 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1481 = _T_1449 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1482 = _T_1450 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1483 = _T_1451 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1484 = _T_1452 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1489 = _T_1457 | _T_1458; // @[Mux.scala 27:72]
  wire [2:0] _T_1490 = _T_1489 | _T_1459; // @[Mux.scala 27:72]
  wire [2:0] _T_1491 = _T_1490 | _T_1460; // @[Mux.scala 27:72]
  wire [3:0] _GEN_12 = {{1'd0}, _T_1491}; // @[Mux.scala 27:72]
  wire [3:0] _T_1492 = _GEN_12 | _T_1461; // @[Mux.scala 27:72]
  wire [3:0] _T_1493 = _T_1492 | _T_1462; // @[Mux.scala 27:72]
  wire [3:0] _T_1494 = _T_1493 | _T_1463; // @[Mux.scala 27:72]
  wire [3:0] _T_1495 = _T_1494 | _T_1464; // @[Mux.scala 27:72]
  wire [3:0] _T_1496 = _T_1495 | _T_1465; // @[Mux.scala 27:72]
  wire [3:0] _T_1497 = _T_1496 | _T_1466; // @[Mux.scala 27:72]
  wire [3:0] _T_1498 = _T_1497 | _T_1467; // @[Mux.scala 27:72]
  wire [3:0] _T_1499 = _T_1498 | _T_1468; // @[Mux.scala 27:72]
  wire [4:0] _GEN_13 = {{1'd0}, _T_1499}; // @[Mux.scala 27:72]
  wire [4:0] _T_1500 = _GEN_13 | _T_1469; // @[Mux.scala 27:72]
  wire [4:0] _T_1501 = _T_1500 | _T_1470; // @[Mux.scala 27:72]
  wire [4:0] _T_1502 = _T_1501 | _T_1471; // @[Mux.scala 27:72]
  wire [4:0] _T_1503 = _T_1502 | _T_1472; // @[Mux.scala 27:72]
  wire [4:0] _T_1504 = _T_1503 | _T_1473; // @[Mux.scala 27:72]
  wire [4:0] _T_1505 = _T_1504 | _T_1474; // @[Mux.scala 27:72]
  wire [4:0] _T_1506 = _T_1505 | _T_1475; // @[Mux.scala 27:72]
  wire [4:0] _T_1507 = _T_1506 | _T_1476; // @[Mux.scala 27:72]
  wire [4:0] _T_1508 = _T_1507 | _T_1477; // @[Mux.scala 27:72]
  wire [4:0] _T_1509 = _T_1508 | _T_1478; // @[Mux.scala 27:72]
  wire [4:0] _T_1510 = _T_1509 | _T_1479; // @[Mux.scala 27:72]
  wire [4:0] _T_1511 = _T_1510 | _T_1480; // @[Mux.scala 27:72]
  wire [4:0] _T_1512 = _T_1511 | _T_1481; // @[Mux.scala 27:72]
  wire [4:0] _T_1513 = _T_1512 | _T_1482; // @[Mux.scala 27:72]
  wire [4:0] _T_1514 = _T_1513 | _T_1483; // @[Mux.scala 27:72]
  wire [4:0] shortq_decode = _T_1514 | _T_1484; // @[Mux.scala 27:72]
  exu_div_cls a_enc ( // @[exu_div_ctl.scala 917:21]
    .io_operand(a_enc_io_operand),
    .io_cls(a_enc_io_cls)
  );
  exu_div_cls b_enc ( // @[exu_div_ctl.scala 920:21]
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
  assign io_data_out = _T_941 | _T_940; // @[exu_div_ctl.scala 886:15]
  assign io_valid_out = finish_ff & _T; // @[exu_div_ctl.scala 885:16]
  assign a_enc_io_operand = {control_ff[2],a_ff}; // @[exu_div_ctl.scala 918:20]
  assign b_enc_io_operand = b_ff[32:0]; // @[exu_div_ctl.scala 921:20]
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
