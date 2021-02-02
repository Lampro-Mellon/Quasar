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
module ifu_compress_ctl(
  input  [15:0] io_din,
  output [31:0] io_dout
);
  wire  _T_2 = ~io_din[14]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_4 = ~io_din[13]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_7 = ~io_din[6]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_9 = ~io_din[5]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_11 = io_din[15] & _T_2; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_12 = _T_11 & _T_4; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_13 = _T_12 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_14 = _T_13 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_15 = _T_14 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_16 = _T_15 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_23 = ~io_din[11]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_28 = _T_12 & _T_23; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_29 = _T_28 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_30 = _T_29 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  out_30 = _T_16 | _T_30; // @[ifu_compress_ctl.scala 17:53]
  wire  _T_38 = ~io_din[10]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_40 = ~io_din[9]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_42 = ~io_din[8]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_44 = ~io_din[7]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_50 = ~io_din[4]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_52 = ~io_din[3]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_54 = ~io_din[2]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_56 = _T_2 & io_din[12]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_57 = _T_56 & _T_23; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_58 = _T_57 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_59 = _T_58 & _T_40; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_60 = _T_59 & _T_42; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_61 = _T_60 & _T_44; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_62 = _T_61 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_63 = _T_62 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_64 = _T_63 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_65 = _T_64 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_66 = _T_65 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  out_20 = _T_66 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_79 = _T_28 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_90 = _T_12 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_91 = _T_90 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_92 = _T_79 | _T_91; // @[ifu_compress_ctl.scala 21:46]
  wire  _T_102 = _T_12 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_103 = _T_102 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_104 = _T_92 | _T_103; // @[ifu_compress_ctl.scala 21:80]
  wire  _T_114 = _T_12 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_115 = _T_114 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  out_14 = _T_104 | _T_115; // @[ifu_compress_ctl.scala 21:113]
  wire  _T_128 = _T_12 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_129 = _T_128 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_130 = _T_129 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_142 = _T_128 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_143 = _T_142 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_144 = _T_130 | _T_143; // @[ifu_compress_ctl.scala 23:50]
  wire  _T_147 = ~io_din[0]; // @[ifu_compress_ctl.scala 23:101]
  wire  _T_148 = io_din[14] & _T_147; // @[ifu_compress_ctl.scala 23:99]
  wire  out_13 = _T_144 | _T_148; // @[ifu_compress_ctl.scala 23:86]
  wire  _T_161 = _T_102 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_162 = _T_161 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_175 = _T_162 | _T_79; // @[ifu_compress_ctl.scala 25:47]
  wire  _T_188 = _T_175 | _T_91; // @[ifu_compress_ctl.scala 25:81]
  wire  _T_190 = ~io_din[15]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_194 = _T_190 & _T_2; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_195 = _T_194 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_196 = _T_188 | _T_195; // @[ifu_compress_ctl.scala 25:115]
  wire  _T_200 = io_din[15] & io_din[14]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_201 = _T_200 & io_din[13]; // @[ifu_compress_ctl.scala 12:110]
  wire  out_12 = _T_196 | _T_201; // @[ifu_compress_ctl.scala 26:26]
  wire  _T_217 = _T_11 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_218 = _T_217 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_219 = _T_218 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_220 = _T_219 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_221 = _T_220 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_224 = _T_221 & _T_147; // @[ifu_compress_ctl.scala 28:53]
  wire  _T_228 = _T_2 & io_din[13]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_229 = _T_224 | _T_228; // @[ifu_compress_ctl.scala 28:67]
  wire  _T_234 = _T_200 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  out_6 = _T_229 | _T_234; // @[ifu_compress_ctl.scala 28:88]
  wire  _T_239 = io_din[15] & _T_147; // @[ifu_compress_ctl.scala 30:24]
  wire  _T_243 = io_din[15] & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_244 = _T_243 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_245 = _T_239 | _T_244; // @[ifu_compress_ctl.scala 30:39]
  wire  _T_249 = io_din[13] & _T_42; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_250 = _T_245 | _T_249; // @[ifu_compress_ctl.scala 30:63]
  wire  _T_253 = io_din[13] & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_254 = _T_250 | _T_253; // @[ifu_compress_ctl.scala 30:83]
  wire  _T_257 = io_din[13] & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_258 = _T_254 | _T_257; // @[ifu_compress_ctl.scala 30:102]
  wire  _T_261 = io_din[13] & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_262 = _T_258 | _T_261; // @[ifu_compress_ctl.scala 31:22]
  wire  _T_265 = io_din[13] & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_266 = _T_262 | _T_265; // @[ifu_compress_ctl.scala 31:42]
  wire  _T_271 = _T_266 | _T_228; // @[ifu_compress_ctl.scala 31:62]
  wire  out_5 = _T_271 | _T_200; // @[ifu_compress_ctl.scala 31:83]
  wire  _T_288 = _T_2 & _T_23; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_289 = _T_288 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_290 = _T_289 & _T_40; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_291 = _T_290 & _T_42; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_292 = _T_291 & _T_44; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_295 = _T_292 & _T_147; // @[ifu_compress_ctl.scala 33:50]
  wire  _T_303 = _T_194 & _T_147; // @[ifu_compress_ctl.scala 33:87]
  wire  _T_304 = _T_295 | _T_303; // @[ifu_compress_ctl.scala 33:65]
  wire  _T_308 = _T_2 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_311 = _T_308 & _T_147; // @[ifu_compress_ctl.scala 34:23]
  wire  _T_312 = _T_304 | _T_311; // @[ifu_compress_ctl.scala 33:102]
  wire  _T_317 = _T_190 & io_din[14]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_318 = _T_317 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_319 = _T_312 | _T_318; // @[ifu_compress_ctl.scala 34:38]
  wire  _T_323 = _T_2 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_326 = _T_323 & _T_147; // @[ifu_compress_ctl.scala 34:82]
  wire  _T_327 = _T_319 | _T_326; // @[ifu_compress_ctl.scala 34:62]
  wire  _T_331 = _T_2 & io_din[4]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_334 = _T_331 & _T_147; // @[ifu_compress_ctl.scala 35:23]
  wire  _T_335 = _T_327 | _T_334; // @[ifu_compress_ctl.scala 34:97]
  wire  _T_339 = _T_2 & io_din[3]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_342 = _T_339 & _T_147; // @[ifu_compress_ctl.scala 35:58]
  wire  _T_343 = _T_335 | _T_342; // @[ifu_compress_ctl.scala 35:38]
  wire  _T_347 = _T_2 & io_din[2]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_350 = _T_347 & _T_147; // @[ifu_compress_ctl.scala 35:93]
  wire  _T_351 = _T_343 | _T_350; // @[ifu_compress_ctl.scala 35:73]
  wire  _T_357 = _T_2 & _T_4; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_358 = _T_357 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  out_4 = _T_351 | _T_358; // @[ifu_compress_ctl.scala 35:108]
  wire  _T_380 = _T_56 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_381 = _T_380 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_382 = _T_381 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_383 = _T_382 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_384 = _T_383 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_385 = _T_384 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_386 = _T_385 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_403 = _T_56 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_404 = _T_403 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_405 = _T_404 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_406 = _T_405 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_407 = _T_406 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_408 = _T_407 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_409 = _T_408 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_410 = _T_386 | _T_409; // @[ifu_compress_ctl.scala 40:59]
  wire  _T_427 = _T_56 & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_428 = _T_427 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_429 = _T_428 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_430 = _T_429 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_431 = _T_430 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_432 = _T_431 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_433 = _T_432 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_434 = _T_410 | _T_433; // @[ifu_compress_ctl.scala 40:107]
  wire  _T_451 = _T_56 & io_din[8]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_452 = _T_451 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_453 = _T_452 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_454 = _T_453 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_455 = _T_454 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_456 = _T_455 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_457 = _T_456 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_458 = _T_434 | _T_457; // @[ifu_compress_ctl.scala 41:50]
  wire  _T_475 = _T_56 & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_476 = _T_475 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_477 = _T_476 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_478 = _T_477 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_479 = _T_478 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_480 = _T_479 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_481 = _T_480 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_482 = _T_458 | _T_481; // @[ifu_compress_ctl.scala 41:94]
  wire  _T_487 = ~io_din[12]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_499 = _T_11 & _T_487; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_500 = _T_499 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_501 = _T_500 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_502 = _T_501 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_503 = _T_502 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_504 = _T_503 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_507 = _T_504 & _T_147; // @[ifu_compress_ctl.scala 42:94]
  wire  _T_508 = _T_482 | _T_507; // @[ifu_compress_ctl.scala 42:49]
  wire  _T_514 = _T_190 & io_din[13]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_515 = _T_514 & _T_42; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_516 = _T_508 | _T_515; // @[ifu_compress_ctl.scala 42:109]
  wire  _T_522 = _T_514 & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_523 = _T_516 | _T_522; // @[ifu_compress_ctl.scala 43:26]
  wire  _T_529 = _T_514 & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_530 = _T_523 | _T_529; // @[ifu_compress_ctl.scala 43:48]
  wire  _T_536 = _T_514 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_537 = _T_530 | _T_536; // @[ifu_compress_ctl.scala 43:70]
  wire  _T_543 = _T_514 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_544 = _T_537 | _T_543; // @[ifu_compress_ctl.scala 43:93]
  wire  out_2 = _T_544 | _T_228; // @[ifu_compress_ctl.scala 44:26]
  wire [4:0] rs2d = io_din[6:2]; // @[ifu_compress_ctl.scala 50:20]
  wire [4:0] rdd = io_din[11:7]; // @[ifu_compress_ctl.scala 51:19]
  wire [4:0] rdpd = {2'h1,io_din[9:7]}; // @[Cat.scala 29:58]
  wire [4:0] rs2pd = {2'h1,io_din[4:2]}; // @[Cat.scala 29:58]
  wire  _T_557 = _T_308 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_564 = _T_317 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_565 = _T_564 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_566 = _T_557 | _T_565; // @[ifu_compress_ctl.scala 55:33]
  wire  _T_572 = _T_323 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_573 = _T_566 | _T_572; // @[ifu_compress_ctl.scala 55:58]
  wire  _T_580 = _T_317 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_581 = _T_580 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_582 = _T_573 | _T_581; // @[ifu_compress_ctl.scala 55:79]
  wire  _T_588 = _T_331 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_589 = _T_582 | _T_588; // @[ifu_compress_ctl.scala 55:104]
  wire  _T_596 = _T_317 & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_597 = _T_596 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_598 = _T_589 | _T_597; // @[ifu_compress_ctl.scala 56:24]
  wire  _T_604 = _T_339 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_605 = _T_598 | _T_604; // @[ifu_compress_ctl.scala 56:48]
  wire  _T_613 = _T_317 & _T_42; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_614 = _T_613 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_615 = _T_605 | _T_614; // @[ifu_compress_ctl.scala 56:69]
  wire  _T_621 = _T_347 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_622 = _T_615 | _T_621; // @[ifu_compress_ctl.scala 56:94]
  wire  _T_629 = _T_317 & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_630 = _T_629 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_631 = _T_622 | _T_630; // @[ifu_compress_ctl.scala 57:22]
  wire  _T_635 = _T_190 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_636 = _T_631 | _T_635; // @[ifu_compress_ctl.scala 57:46]
  wire  _T_642 = _T_190 & _T_4; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_643 = _T_642 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  rdrd = _T_636 | _T_643; // @[ifu_compress_ctl.scala 57:65]
  wire  _T_651 = _T_380 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_659 = _T_403 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_660 = _T_651 | _T_659; // @[ifu_compress_ctl.scala 59:38]
  wire  _T_668 = _T_427 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_669 = _T_660 | _T_668; // @[ifu_compress_ctl.scala 59:63]
  wire  _T_677 = _T_451 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_678 = _T_669 | _T_677; // @[ifu_compress_ctl.scala 59:87]
  wire  _T_686 = _T_475 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_687 = _T_678 | _T_686; // @[ifu_compress_ctl.scala 60:27]
  wire  _T_703 = _T_2 & _T_487; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_704 = _T_703 & _T_7; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_705 = _T_704 & _T_9; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_706 = _T_705 & _T_50; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_707 = _T_706 & _T_52; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_708 = _T_707 & _T_54; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_709 = _T_708 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_710 = _T_687 | _T_709; // @[ifu_compress_ctl.scala 60:51]
  wire  _T_717 = _T_56 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_718 = _T_717 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_719 = _T_710 | _T_718; // @[ifu_compress_ctl.scala 60:89]
  wire  _T_726 = _T_56 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_727 = _T_726 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_728 = _T_719 | _T_727; // @[ifu_compress_ctl.scala 61:27]
  wire  _T_735 = _T_56 & io_din[4]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_736 = _T_735 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_737 = _T_728 | _T_736; // @[ifu_compress_ctl.scala 61:51]
  wire  _T_744 = _T_56 & io_din[3]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_745 = _T_744 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_746 = _T_737 | _T_745; // @[ifu_compress_ctl.scala 61:75]
  wire  _T_753 = _T_56 & io_din[2]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_754 = _T_753 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_755 = _T_746 | _T_754; // @[ifu_compress_ctl.scala 61:99]
  wire  _T_764 = _T_194 & _T_4; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_765 = _T_764 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_766 = _T_755 | _T_765; // @[ifu_compress_ctl.scala 62:27]
  wire  rdrs1 = _T_766 | _T_195; // @[ifu_compress_ctl.scala 62:54]
  wire  _T_777 = io_din[15] & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_778 = _T_777 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_782 = io_din[15] & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_783 = _T_782 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_784 = _T_778 | _T_783; // @[ifu_compress_ctl.scala 64:34]
  wire  _T_788 = io_din[15] & io_din[4]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_789 = _T_788 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_790 = _T_784 | _T_789; // @[ifu_compress_ctl.scala 64:54]
  wire  _T_794 = io_din[15] & io_din[3]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_795 = _T_794 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_796 = _T_790 | _T_795; // @[ifu_compress_ctl.scala 64:74]
  wire  _T_800 = io_din[15] & io_din[2]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_801 = _T_800 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_802 = _T_796 | _T_801; // @[ifu_compress_ctl.scala 64:94]
  wire  _T_807 = _T_200 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  rs2rs2 = _T_802 | _T_807; // @[ifu_compress_ctl.scala 64:114]
  wire  rdprd = _T_12 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_820 = io_din[15] & _T_4; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_821 = _T_820 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_827 = _T_821 | _T_234; // @[ifu_compress_ctl.scala 68:36]
  wire  _T_830 = ~io_din[1]; // @[ifu_compress_ctl.scala 12:83]
  wire  _T_831 = io_din[14] & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_834 = _T_831 & _T_147; // @[ifu_compress_ctl.scala 68:76]
  wire  rdprs1 = _T_827 | _T_834; // @[ifu_compress_ctl.scala 68:57]
  wire  _T_846 = _T_128 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_847 = _T_846 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_851 = io_din[15] & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_854 = _T_851 & _T_147; // @[ifu_compress_ctl.scala 70:66]
  wire  rs2prs2 = _T_847 | _T_854; // @[ifu_compress_ctl.scala 70:47]
  wire  _T_859 = _T_190 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  rs2prd = _T_859 & _T_147; // @[ifu_compress_ctl.scala 72:33]
  wire  _T_866 = _T_2 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  uimm9_2 = _T_866 & _T_147; // @[ifu_compress_ctl.scala 74:34]
  wire  _T_875 = _T_317 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  ulwimm6_2 = _T_875 & _T_147; // @[ifu_compress_ctl.scala 76:39]
  wire  ulwspimm7_2 = _T_317 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_897 = _T_317 & io_din[13]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_898 = _T_897 & _T_23; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_899 = _T_898 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_900 = _T_899 & _T_40; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_901 = _T_900 & io_din[8]; // @[ifu_compress_ctl.scala 12:110]
  wire  rdeq2 = _T_901 & _T_44; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1027 = _T_194 & io_din[13]; // @[ifu_compress_ctl.scala 12:110]
  wire  rdeq1 = _T_482 | _T_1027; // @[ifu_compress_ctl.scala 84:42]
  wire  _T_1050 = io_din[14] & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1051 = rdeq2 | _T_1050; // @[ifu_compress_ctl.scala 86:53]
  wire  rs1eq2 = _T_1051 | uimm9_2; // @[ifu_compress_ctl.scala 86:71]
  wire  _T_1092 = _T_357 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1093 = _T_1092 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1094 = _T_1093 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  simm5_0 = _T_1094 | _T_643; // @[ifu_compress_ctl.scala 92:45]
  wire  _T_1112 = _T_897 & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1121 = _T_897 & _T_42; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1122 = _T_1112 | _T_1121; // @[ifu_compress_ctl.scala 96:44]
  wire  _T_1130 = _T_897 & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1131 = _T_1122 | _T_1130; // @[ifu_compress_ctl.scala 96:70]
  wire  _T_1139 = _T_897 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1140 = _T_1131 | _T_1139; // @[ifu_compress_ctl.scala 96:95]
  wire  _T_1148 = _T_897 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  sluimm17_12 = _T_1140 | _T_1148; // @[ifu_compress_ctl.scala 96:121]
  wire  uimm5_0 = _T_79 | _T_195; // @[ifu_compress_ctl.scala 98:45]
  wire [6:0] l1_6 = {out_6,out_5,out_4,_T_228,out_2,1'h1,1'h1}; // @[Cat.scala 29:58]
  wire [4:0] _T_1192 = rdrd ? rdd : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1193 = rdprd ? rdpd : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1194 = rs2prd ? rs2pd : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1195 = rdeq1 ? 5'h1 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1196 = rdeq2 ? 5'h2 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1197 = _T_1192 | _T_1193; // @[Mux.scala 27:72]
  wire [4:0] _T_1198 = _T_1197 | _T_1194; // @[Mux.scala 27:72]
  wire [4:0] _T_1199 = _T_1198 | _T_1195; // @[Mux.scala 27:72]
  wire [4:0] l1_11 = _T_1199 | _T_1196; // @[Mux.scala 27:72]
  wire [4:0] _T_1210 = rdrs1 ? rdd : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1211 = rdprs1 ? rdpd : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1212 = rs1eq2 ? 5'h2 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1213 = _T_1210 | _T_1211; // @[Mux.scala 27:72]
  wire [4:0] l1_19 = _T_1213 | _T_1212; // @[Mux.scala 27:72]
  wire [4:0] _T_1219 = {3'h0,1'h0,out_20}; // @[Cat.scala 29:58]
  wire [4:0] _T_1222 = rs2rs2 ? rs2d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1223 = rs2prs2 ? rs2pd : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1224 = _T_1222 | _T_1223; // @[Mux.scala 27:72]
  wire [4:0] l1_24 = _T_1219 | _T_1224; // @[ifu_compress_ctl.scala 114:67]
  wire [14:0] _T_1232 = {out_14,out_13,out_12,l1_11,l1_6}; // @[Cat.scala 29:58]
  wire [31:0] l1 = {1'h0,out_30,2'h0,3'h0,l1_24,l1_19,_T_1232}; // @[Cat.scala 29:58]
  wire [5:0] simm5d = {io_din[12],rs2d}; // @[Cat.scala 29:58]
  wire [5:0] simm9d = {io_din[12],io_din[4:3],io_din[5],io_din[2],io_din[6]}; // @[Cat.scala 29:58]
  wire [10:0] sjald_1 = {io_din[12],io_din[8],io_din[10:9],io_din[6],io_din[7],io_din[2],io_din[11],io_din[5:4],io_din[3]}; // @[Cat.scala 29:58]
  wire [19:0] sjald = {io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],sjald_1}; // @[Cat.scala 29:58]
  wire [9:0] _T_1296 = {io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],io_din[12]}; // @[Cat.scala 29:58]
  wire [19:0] sluimmd = {_T_1296,io_din[12],io_din[12],io_din[12],io_din[12],io_din[12],rs2d}; // @[Cat.scala 29:58]
  wire [11:0] _T_1314 = {simm5d[5],simm5d[5],simm5d[5],simm5d[5],simm5d[5],simm5d[5],simm5d[5],simm5d[4:0]}; // @[Cat.scala 29:58]
  wire [11:0] _T_1317 = {2'h0,io_din[10:7],io_din[12:11],io_din[5],io_din[6],2'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1325 = {simm9d[5],simm9d[5],simm9d[5],simm9d[4:0],4'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1328 = {5'h0,io_din[5],io_din[12:10],io_din[6],2'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1331 = {4'h0,io_din[3:2],io_din[12],io_din[6:4],2'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1333 = {6'h0,io_din[12],rs2d}; // @[Cat.scala 29:58]
  wire [11:0] _T_1339 = {sjald[19],sjald[9:0],sjald[10]}; // @[Cat.scala 29:58]
  wire [11:0] _T_1342 = simm5_0 ? _T_1314 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1343 = uimm9_2 ? _T_1317 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1344 = rdeq2 ? _T_1325 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1345 = ulwimm6_2 ? _T_1328 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1346 = ulwspimm7_2 ? _T_1331 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1347 = uimm5_0 ? _T_1333 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1348 = _T_228 ? _T_1339 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1349 = sluimm17_12 ? sluimmd[19:8] : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1350 = _T_1342 | _T_1343; // @[Mux.scala 27:72]
  wire [11:0] _T_1351 = _T_1350 | _T_1344; // @[Mux.scala 27:72]
  wire [11:0] _T_1352 = _T_1351 | _T_1345; // @[Mux.scala 27:72]
  wire [11:0] _T_1353 = _T_1352 | _T_1346; // @[Mux.scala 27:72]
  wire [11:0] _T_1354 = _T_1353 | _T_1347; // @[Mux.scala 27:72]
  wire [11:0] _T_1355 = _T_1354 | _T_1348; // @[Mux.scala 27:72]
  wire [11:0] _T_1356 = _T_1355 | _T_1349; // @[Mux.scala 27:72]
  wire [11:0] l2_31 = l1[31:20] | _T_1356; // @[ifu_compress_ctl.scala 133:25]
  wire [7:0] _T_1363 = _T_228 ? sjald[19:12] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_1364 = sluimm17_12 ? sluimmd[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_1365 = _T_1363 | _T_1364; // @[Mux.scala 27:72]
  wire [7:0] l2_19 = l1[19:12] | _T_1365; // @[ifu_compress_ctl.scala 143:25]
  wire [31:0] l2 = {l2_31,l2_19,l1[11:0]}; // @[Cat.scala 29:58]
  wire [8:0] sbr8d = {io_din[12],io_din[6],io_din[5],io_din[2],io_din[11],io_din[10],io_din[4],io_din[3],1'h0}; // @[Cat.scala 29:58]
  wire [6:0] uswimm6d = {io_din[5],io_din[12:10],io_din[6],2'h0}; // @[Cat.scala 29:58]
  wire [7:0] uswspimm7d = {io_din[8:7],io_din[12:9],2'h0}; // @[Cat.scala 29:58]
  wire [6:0] _T_1400 = {sbr8d[8],sbr8d[8],sbr8d[8],sbr8d[8],sbr8d[7:5]}; // @[Cat.scala 29:58]
  wire [6:0] _T_1403 = {5'h0,uswimm6d[6:5]}; // @[Cat.scala 29:58]
  wire [6:0] _T_1406 = {4'h0,uswspimm7d[7:5]}; // @[Cat.scala 29:58]
  wire [6:0] _T_1407 = _T_234 ? _T_1400 : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_1408 = _T_854 ? _T_1403 : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_1409 = _T_807 ? _T_1406 : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_1410 = _T_1407 | _T_1408; // @[Mux.scala 27:72]
  wire [6:0] _T_1411 = _T_1410 | _T_1409; // @[Mux.scala 27:72]
  wire [6:0] l3_31 = l2[31:25] | _T_1411; // @[ifu_compress_ctl.scala 151:25]
  wire [12:0] l3_24 = l2[24:12]; // @[ifu_compress_ctl.scala 154:17]
  wire [4:0] _T_1417 = {sbr8d[4:1],sbr8d[8]}; // @[Cat.scala 29:58]
  wire [4:0] _T_1422 = _T_234 ? _T_1417 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1423 = _T_854 ? uswimm6d[4:0] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1424 = _T_807 ? uswspimm7d[4:0] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1425 = _T_1422 | _T_1423; // @[Mux.scala 27:72]
  wire [4:0] _T_1426 = _T_1425 | _T_1424; // @[Mux.scala 27:72]
  wire [4:0] l3_11 = l2[11:7] | _T_1426; // @[ifu_compress_ctl.scala 156:24]
  wire [31:0] l3 = {l3_31,l3_24,l3_11,l2[6:0]}; // @[Cat.scala 29:58]
  wire  _T_1437 = _T_4 & _T_487; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1438 = _T_1437 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1439 = _T_1438 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1442 = _T_1439 & _T_147; // @[ifu_compress_ctl.scala 162:39]
  wire  _T_1450 = _T_1437 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1451 = _T_1450 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1454 = _T_1451 & _T_147; // @[ifu_compress_ctl.scala 162:79]
  wire  _T_1455 = _T_1442 | _T_1454; // @[ifu_compress_ctl.scala 162:54]
  wire  _T_1464 = _T_642 & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1465 = _T_1464 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1466 = _T_1455 | _T_1465; // @[ifu_compress_ctl.scala 162:94]
  wire  _T_1474 = _T_1437 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1475 = _T_1474 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1478 = _T_1475 & _T_147; // @[ifu_compress_ctl.scala 163:55]
  wire  _T_1479 = _T_1466 | _T_1478; // @[ifu_compress_ctl.scala 163:30]
  wire  _T_1487 = _T_1437 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1488 = _T_1487 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1491 = _T_1488 & _T_147; // @[ifu_compress_ctl.scala 163:96]
  wire  _T_1492 = _T_1479 | _T_1491; // @[ifu_compress_ctl.scala 163:70]
  wire  _T_1501 = _T_642 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1502 = _T_1501 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1503 = _T_1492 | _T_1502; // @[ifu_compress_ctl.scala 163:111]
  wire  _T_1510 = io_din[15] & _T_487; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1511 = _T_1510 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1512 = _T_1511 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1513 = _T_1503 | _T_1512; // @[ifu_compress_ctl.scala 164:29]
  wire  _T_1521 = _T_1437 & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1522 = _T_1521 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1525 = _T_1522 & _T_147; // @[ifu_compress_ctl.scala 164:79]
  wire  _T_1526 = _T_1513 | _T_1525; // @[ifu_compress_ctl.scala 164:54]
  wire  _T_1533 = _T_487 & io_din[6]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1534 = _T_1533 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1535 = _T_1534 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1536 = _T_1526 | _T_1535; // @[ifu_compress_ctl.scala 164:94]
  wire  _T_1545 = _T_642 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1546 = _T_1545 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1547 = _T_1536 | _T_1546; // @[ifu_compress_ctl.scala 164:118]
  wire  _T_1555 = _T_1437 & io_din[8]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1556 = _T_1555 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1559 = _T_1556 & _T_147; // @[ifu_compress_ctl.scala 165:28]
  wire  _T_1560 = _T_1547 | _T_1559; // @[ifu_compress_ctl.scala 164:144]
  wire  _T_1567 = _T_487 & io_din[5]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1568 = _T_1567 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1569 = _T_1568 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1570 = _T_1560 | _T_1569; // @[ifu_compress_ctl.scala 165:43]
  wire  _T_1579 = _T_642 & io_din[10]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1580 = _T_1579 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1581 = _T_1570 | _T_1580; // @[ifu_compress_ctl.scala 165:67]
  wire  _T_1589 = _T_1437 & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1590 = _T_1589 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1593 = _T_1590 & _T_147; // @[ifu_compress_ctl.scala 166:28]
  wire  _T_1594 = _T_1581 | _T_1593; // @[ifu_compress_ctl.scala 165:94]
  wire  _T_1602 = io_din[12] & io_din[11]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1603 = _T_1602 & _T_38; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1604 = _T_1603 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1605 = _T_1604 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1606 = _T_1594 | _T_1605; // @[ifu_compress_ctl.scala 166:43]
  wire  _T_1615 = _T_642 & io_din[9]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1616 = _T_1615 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1617 = _T_1606 | _T_1616; // @[ifu_compress_ctl.scala 166:71]
  wire  _T_1625 = _T_1437 & io_din[4]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1626 = _T_1625 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1629 = _T_1626 & _T_147; // @[ifu_compress_ctl.scala 167:28]
  wire  _T_1630 = _T_1617 | _T_1629; // @[ifu_compress_ctl.scala 166:97]
  wire  _T_1636 = io_din[13] & io_din[12]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1637 = _T_1636 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1638 = _T_1637 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1639 = _T_1630 | _T_1638; // @[ifu_compress_ctl.scala 167:43]
  wire  _T_1648 = _T_642 & io_din[8]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1649 = _T_1648 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1650 = _T_1639 | _T_1649; // @[ifu_compress_ctl.scala 167:67]
  wire  _T_1658 = _T_1437 & io_din[3]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1659 = _T_1658 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1662 = _T_1659 & _T_147; // @[ifu_compress_ctl.scala 168:28]
  wire  _T_1663 = _T_1650 | _T_1662; // @[ifu_compress_ctl.scala 167:93]
  wire  _T_1669 = io_din[13] & io_din[4]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1670 = _T_1669 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1671 = _T_1670 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1672 = _T_1663 | _T_1671; // @[ifu_compress_ctl.scala 168:43]
  wire  _T_1680 = _T_1437 & io_din[2]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1681 = _T_1680 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1684 = _T_1681 & _T_147; // @[ifu_compress_ctl.scala 168:91]
  wire  _T_1685 = _T_1672 | _T_1684; // @[ifu_compress_ctl.scala 168:66]
  wire  _T_1694 = _T_642 & io_din[7]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1695 = _T_1694 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1696 = _T_1685 | _T_1695; // @[ifu_compress_ctl.scala 168:106]
  wire  _T_1702 = io_din[13] & io_din[3]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1703 = _T_1702 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1704 = _T_1703 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1705 = _T_1696 | _T_1704; // @[ifu_compress_ctl.scala 169:29]
  wire  _T_1711 = io_din[13] & io_din[2]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1712 = _T_1711 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1713 = _T_1712 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1714 = _T_1705 | _T_1713; // @[ifu_compress_ctl.scala 169:52]
  wire  _T_1720 = io_din[14] & _T_4; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1721 = _T_1720 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1722 = _T_1714 | _T_1721; // @[ifu_compress_ctl.scala 169:75]
  wire  _T_1731 = _T_703 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1732 = _T_1731 & io_din[0]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1733 = _T_1722 | _T_1732; // @[ifu_compress_ctl.scala 169:98]
  wire  _T_1740 = _T_820 & io_din[12]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1741 = _T_1740 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1744 = _T_1741 & _T_147; // @[ifu_compress_ctl.scala 170:54]
  wire  _T_1745 = _T_1733 | _T_1744; // @[ifu_compress_ctl.scala 170:29]
  wire  _T_1754 = _T_642 & _T_487; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1755 = _T_1754 & io_din[1]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1758 = _T_1755 & _T_147; // @[ifu_compress_ctl.scala 170:96]
  wire  _T_1759 = _T_1745 | _T_1758; // @[ifu_compress_ctl.scala 170:69]
  wire  _T_1768 = _T_642 & io_din[12]; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1769 = _T_1768 & _T_830; // @[ifu_compress_ctl.scala 12:110]
  wire  _T_1770 = _T_1759 | _T_1769; // @[ifu_compress_ctl.scala 170:111]
  wire  _T_1777 = _T_1720 & _T_147; // @[ifu_compress_ctl.scala 171:50]
  wire  legal = _T_1770 | _T_1777; // @[ifu_compress_ctl.scala 171:30]
  wire [9:0] _T_1787 = {legal,legal,legal,legal,legal,legal,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  wire [18:0] _T_1796 = {_T_1787,legal,legal,legal,legal,legal,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  wire [27:0] _T_1805 = {_T_1796,legal,legal,legal,legal,legal,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  wire [31:0] _T_1809 = {_T_1805,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  assign io_dout = l3 & _T_1809; // @[ifu_compress_ctl.scala 173:10]
endmodule
module ifu_aln_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_active_clk,
  input         io_ifu_async_error_start,
  input         io_iccm_rd_ecc_double_err,
  input         io_ic_access_fault_f,
  input  [1:0]  io_ic_access_fault_type_f,
  input  [7:0]  io_ifu_bp_fghr_f,
  input  [30:0] io_ifu_bp_btb_target_f,
  input  [11:0] io_ifu_bp_poffset_f,
  input  [1:0]  io_ifu_bp_hist0_f,
  input  [1:0]  io_ifu_bp_hist1_f,
  input  [1:0]  io_ifu_bp_pc4_f,
  input  [1:0]  io_ifu_bp_way_f,
  input  [1:0]  io_ifu_bp_valid_f,
  input  [1:0]  io_ifu_bp_ret_f,
  input         io_exu_flush_final,
  input         io_dec_i0_decode_d,
  output [15:0] io_dec_aln_aln_dec_ifu_i0_cinst,
  output        io_dec_aln_aln_ib_ifu_i0_icaf,
  output [1:0]  io_dec_aln_aln_ib_ifu_i0_icaf_type,
  output        io_dec_aln_aln_ib_ifu_i0_icaf_second,
  output        io_dec_aln_aln_ib_ifu_i0_dbecc,
  output [7:0]  io_dec_aln_aln_ib_ifu_i0_bp_index,
  output [7:0]  io_dec_aln_aln_ib_ifu_i0_bp_fghr,
  output [4:0]  io_dec_aln_aln_ib_ifu_i0_bp_btag,
  output        io_dec_aln_aln_ib_ifu_i0_valid,
  output [31:0] io_dec_aln_aln_ib_ifu_i0_instr,
  output [30:0] io_dec_aln_aln_ib_ifu_i0_pc,
  output        io_dec_aln_aln_ib_ifu_i0_pc4,
  output        io_dec_aln_aln_ib_i0_brp_valid,
  output [11:0] io_dec_aln_aln_ib_i0_brp_bits_toffset,
  output [1:0]  io_dec_aln_aln_ib_i0_brp_bits_hist,
  output        io_dec_aln_aln_ib_i0_brp_bits_br_error,
  output        io_dec_aln_aln_ib_i0_brp_bits_br_start_error,
  output        io_dec_aln_aln_ib_i0_brp_bits_bank,
  output [30:0] io_dec_aln_aln_ib_i0_brp_bits_prett,
  output        io_dec_aln_aln_ib_i0_brp_bits_way,
  output        io_dec_aln_aln_ib_i0_brp_bits_ret,
  output        io_dec_aln_ifu_pmu_instr_aligned,
  input  [31:0] io_ifu_fetch_data_f,
  input  [1:0]  io_ifu_fetch_val,
  input  [30:0] io_ifu_fetch_pc,
  output        io_ifu_fb_consume1,
  output        io_ifu_fb_consume2
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
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 404:23]
  wire [15:0] decompressed_io_din; // @[ifu_aln_ctl.scala 353:28]
  wire [31:0] decompressed_io_dout; // @[ifu_aln_ctl.scala 353:28]
  reg  error_stall; // @[ifu_aln_ctl.scala 103:51]
  wire  _T = error_stall | io_ifu_async_error_start; // @[ifu_aln_ctl.scala 100:34]
  wire  _T_1 = ~io_exu_flush_final; // @[ifu_aln_ctl.scala 100:64]
  reg [1:0] wrptr; // @[ifu_aln_ctl.scala 105:48]
  reg [1:0] rdptr; // @[ifu_aln_ctl.scala 107:48]
  reg [1:0] f2val; // @[ifu_aln_ctl.scala 109:48]
  reg [1:0] f1val; // @[ifu_aln_ctl.scala 110:48]
  reg [1:0] f0val; // @[ifu_aln_ctl.scala 111:48]
  reg  q2off; // @[ifu_aln_ctl.scala 113:48]
  reg  q1off; // @[ifu_aln_ctl.scala 114:48]
  reg  q0off; // @[ifu_aln_ctl.scala 115:48]
  wire  _T_785 = ~error_stall; // @[ifu_aln_ctl.scala 396:39]
  wire  i0_shift = io_dec_i0_decode_d & _T_785; // @[ifu_aln_ctl.scala 396:37]
  wire  _T_186 = rdptr == 2'h0; // @[ifu_aln_ctl.scala 170:31]
  wire  _T_189 = _T_186 & q0off; // @[Mux.scala 27:72]
  wire  _T_187 = rdptr == 2'h1; // @[ifu_aln_ctl.scala 171:11]
  wire  _T_190 = _T_187 & q1off; // @[Mux.scala 27:72]
  wire  _T_192 = _T_189 | _T_190; // @[Mux.scala 27:72]
  wire  _T_188 = rdptr == 2'h2; // @[ifu_aln_ctl.scala 172:11]
  wire  _T_191 = _T_188 & q2off; // @[Mux.scala 27:72]
  wire  q0ptr = _T_192 | _T_191; // @[Mux.scala 27:72]
  wire  _T_202 = ~q0ptr; // @[ifu_aln_ctl.scala 176:26]
  wire [1:0] q0sel = {q0ptr,_T_202}; // @[Cat.scala 29:58]
  wire [2:0] qren = {_T_188,_T_187,_T_186}; // @[Cat.scala 29:58]
  reg [31:0] q1; // @[Reg.scala 27:20]
  reg [31:0] q0; // @[Reg.scala 27:20]
  wire [63:0] _T_479 = {q1,q0}; // @[Cat.scala 29:58]
  wire [63:0] _T_486 = qren[0] ? _T_479 : 64'h0; // @[Mux.scala 27:72]
  reg [31:0] q2; // @[Reg.scala 27:20]
  wire [63:0] _T_482 = {q2,q1}; // @[Cat.scala 29:58]
  wire [63:0] _T_487 = qren[1] ? _T_482 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_489 = _T_486 | _T_487; // @[Mux.scala 27:72]
  wire [63:0] _T_485 = {q0,q2}; // @[Cat.scala 29:58]
  wire [63:0] _T_488 = qren[2] ? _T_485 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] qeff = _T_489 | _T_488; // @[Mux.scala 27:72]
  wire [31:0] q0eff = qeff[31:0]; // @[ifu_aln_ctl.scala 295:42]
  wire [31:0] _T_496 = q0sel[0] ? q0eff : 32'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_497 = q0sel[1] ? q0eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_12 = {{16'd0}, _T_497}; // @[Mux.scala 27:72]
  wire [31:0] q0final = _T_496 | _GEN_12; // @[Mux.scala 27:72]
  wire [31:0] _T_520 = f0val[1] ? q0final : 32'h0; // @[Mux.scala 27:72]
  wire  _T_513 = ~f0val[1]; // @[ifu_aln_ctl.scala 302:58]
  wire  _T_515 = _T_513 & f0val[0]; // @[ifu_aln_ctl.scala 302:68]
  wire  _T_197 = _T_186 & q1off; // @[Mux.scala 27:72]
  wire  _T_198 = _T_187 & q2off; // @[Mux.scala 27:72]
  wire  _T_200 = _T_197 | _T_198; // @[Mux.scala 27:72]
  wire  _T_199 = _T_188 & q0off; // @[Mux.scala 27:72]
  wire  q1ptr = _T_200 | _T_199; // @[Mux.scala 27:72]
  wire  _T_203 = ~q1ptr; // @[ifu_aln_ctl.scala 178:26]
  wire [1:0] q1sel = {q1ptr,_T_203}; // @[Cat.scala 29:58]
  wire [31:0] q1eff = qeff[63:32]; // @[ifu_aln_ctl.scala 295:29]
  wire [15:0] _T_506 = q1sel[0] ? q1eff[15:0] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_507 = q1sel[1] ? q1eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] q1final = _T_506 | _T_507; // @[Mux.scala 27:72]
  wire [31:0] _T_519 = {q1final,q0final[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_521 = _T_515 ? _T_519 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] aligndata = _T_520 | _T_521; // @[Mux.scala 27:72]
  wire  first4B = aligndata[1:0] == 2'h3; // @[ifu_aln_ctl.scala 335:29]
  wire  first2B = ~first4B; // @[ifu_aln_ctl.scala 337:17]
  wire  shift_2B = i0_shift & first2B; // @[ifu_aln_ctl.scala 400:24]
  wire [1:0] _T_443 = {1'h0,f0val[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_448 = shift_2B ? _T_443 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_444 = ~shift_2B; // @[ifu_aln_ctl.scala 285:18]
  wire  shift_4B = i0_shift & first4B; // @[ifu_aln_ctl.scala 401:24]
  wire  _T_445 = ~shift_4B; // @[ifu_aln_ctl.scala 285:30]
  wire  _T_446 = _T_444 & _T_445; // @[ifu_aln_ctl.scala 285:28]
  wire [1:0] _T_449 = _T_446 ? f0val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] sf0val = _T_448 | _T_449; // @[Mux.scala 27:72]
  wire  sf0_valid = sf0val[0]; // @[ifu_aln_ctl.scala 236:22]
  wire  _T_351 = ~sf0_valid; // @[ifu_aln_ctl.scala 257:26]
  wire  _T_802 = f0val[0] & _T_513; // @[ifu_aln_ctl.scala 404:28]
  wire  f1_shift_2B = _T_802 & shift_4B; // @[ifu_aln_ctl.scala 404:40]
  wire  _T_417 = f1_shift_2B & f1val[1]; // @[Mux.scala 27:72]
  wire  _T_416 = ~f1_shift_2B; // @[ifu_aln_ctl.scala 278:53]
  wire [1:0] _T_418 = _T_416 ? f1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_13 = {{1'd0}, _T_417}; // @[Mux.scala 27:72]
  wire [1:0] sf1val = _GEN_13 | _T_418; // @[Mux.scala 27:72]
  wire  sf1_valid = sf1val[0]; // @[ifu_aln_ctl.scala 235:22]
  wire  _T_352 = _T_351 & sf1_valid; // @[ifu_aln_ctl.scala 257:37]
  wire  f2_valid = f2val[0]; // @[ifu_aln_ctl.scala 234:20]
  wire  _T_353 = _T_352 & f2_valid; // @[ifu_aln_ctl.scala 257:50]
  wire  ifvalid = io_ifu_fetch_val[0]; // @[ifu_aln_ctl.scala 245:30]
  wire  _T_354 = _T_353 & ifvalid; // @[ifu_aln_ctl.scala 257:62]
  wire  _T_355 = sf0_valid & sf1_valid; // @[ifu_aln_ctl.scala 258:37]
  wire  _T_356 = ~f2_valid; // @[ifu_aln_ctl.scala 258:52]
  wire  _T_357 = _T_355 & _T_356; // @[ifu_aln_ctl.scala 258:50]
  wire  _T_358 = _T_357 & ifvalid; // @[ifu_aln_ctl.scala 258:62]
  wire  fetch_to_f2 = _T_354 | _T_358; // @[ifu_aln_ctl.scala 257:74]
  reg [30:0] f2pc; // @[Reg.scala 27:20]
  wire  _T_335 = ~sf1_valid; // @[ifu_aln_ctl.scala 253:39]
  wire  _T_336 = _T_351 & _T_335; // @[ifu_aln_ctl.scala 253:37]
  wire  _T_337 = _T_336 & f2_valid; // @[ifu_aln_ctl.scala 253:50]
  wire  _T_338 = _T_337 & ifvalid; // @[ifu_aln_ctl.scala 253:62]
  wire  _T_342 = _T_352 & _T_356; // @[ifu_aln_ctl.scala 254:50]
  wire  _T_343 = _T_342 & ifvalid; // @[ifu_aln_ctl.scala 254:62]
  wire  _T_344 = _T_338 | _T_343; // @[ifu_aln_ctl.scala 253:74]
  wire  _T_346 = sf0_valid & _T_335; // @[ifu_aln_ctl.scala 255:37]
  wire  _T_348 = _T_346 & _T_356; // @[ifu_aln_ctl.scala 255:50]
  wire  _T_349 = _T_348 & ifvalid; // @[ifu_aln_ctl.scala 255:62]
  wire  fetch_to_f1 = _T_344 | _T_349; // @[ifu_aln_ctl.scala 254:74]
  wire  _T_25 = fetch_to_f1 | _T_353; // @[ifu_aln_ctl.scala 135:33]
  wire  f1_shift_wr_en = _T_25 | f1_shift_2B; // @[ifu_aln_ctl.scala 135:47]
  reg [30:0] f1pc; // @[Reg.scala 27:20]
  wire [30:0] _T_375 = fetch_to_f1 ? io_ifu_fetch_pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_376 = _T_353 ? f2pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_378 = _T_375 | _T_376; // @[Mux.scala 27:72]
  wire  _T_371 = ~fetch_to_f1; // @[ifu_aln_ctl.scala 268:6]
  wire  _T_372 = ~_T_353; // @[ifu_aln_ctl.scala 268:21]
  wire  _T_373 = _T_371 & _T_372; // @[ifu_aln_ctl.scala 268:19]
  wire [30:0] _T_363 = f1_shift_2B ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [30:0] f1pc_plus1 = f1pc + 31'h1; // @[ifu_aln_ctl.scala 262:25]
  wire [30:0] _T_364 = _T_363 & f1pc_plus1; // @[ifu_aln_ctl.scala 264:38]
  wire [30:0] _T_367 = _T_416 ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [30:0] _T_368 = _T_367 & f1pc; // @[ifu_aln_ctl.scala 264:78]
  wire [30:0] sf1pc = _T_364 | _T_368; // @[ifu_aln_ctl.scala 264:52]
  wire [30:0] _T_377 = _T_373 ? sf1pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] f1pc_in = _T_378 | _T_377; // @[Mux.scala 27:72]
  wire  _T_332 = _T_336 & _T_356; // @[ifu_aln_ctl.scala 252:50]
  wire  fetch_to_f0 = _T_332 & ifvalid; // @[ifu_aln_ctl.scala 252:62]
  wire  _T_27 = fetch_to_f0 | _T_337; // @[ifu_aln_ctl.scala 136:33]
  wire  _T_28 = _T_27 | _T_352; // @[ifu_aln_ctl.scala 136:47]
  wire  _T_29 = _T_28 | shift_2B; // @[ifu_aln_ctl.scala 136:61]
  wire  f0_shift_wr_en = _T_29 | shift_4B; // @[ifu_aln_ctl.scala 136:72]
  reg [30:0] f0pc; // @[Reg.scala 27:20]
  wire [30:0] _T_390 = fetch_to_f0 ? io_ifu_fetch_pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_391 = _T_337 ? f2pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_394 = _T_390 | _T_391; // @[Mux.scala 27:72]
  wire [30:0] _T_392 = _T_352 ? sf1pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_395 = _T_394 | _T_392; // @[Mux.scala 27:72]
  wire  _T_384 = ~fetch_to_f0; // @[ifu_aln_ctl.scala 273:24]
  wire  _T_385 = ~_T_337; // @[ifu_aln_ctl.scala 273:39]
  wire  _T_386 = _T_384 & _T_385; // @[ifu_aln_ctl.scala 273:37]
  wire  _T_387 = ~_T_352; // @[ifu_aln_ctl.scala 273:54]
  wire  _T_388 = _T_386 & _T_387; // @[ifu_aln_ctl.scala 273:52]
  wire [30:0] f0pc_plus1 = f0pc + 31'h1; // @[ifu_aln_ctl.scala 260:25]
  wire [30:0] _T_393 = _T_388 ? f0pc_plus1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] f0pc_in = _T_395 | _T_393; // @[Mux.scala 27:72]
  wire  _T_35 = wrptr == 2'h2; // @[ifu_aln_ctl.scala 140:21]
  wire  _T_36 = _T_35 & ifvalid; // @[ifu_aln_ctl.scala 140:29]
  wire  _T_37 = wrptr == 2'h1; // @[ifu_aln_ctl.scala 140:46]
  wire  _T_38 = _T_37 & ifvalid; // @[ifu_aln_ctl.scala 140:54]
  wire  _T_39 = wrptr == 2'h0; // @[ifu_aln_ctl.scala 140:71]
  wire  _T_40 = _T_39 & ifvalid; // @[ifu_aln_ctl.scala 140:79]
  wire [2:0] qwen = {_T_36,_T_38,_T_40}; // @[Cat.scala 29:58]
  reg [11:0] brdata2; // @[Reg.scala 27:20]
  wire [5:0] _T_241 = {io_ifu_bp_hist1_f[0],io_ifu_bp_hist0_f[0],io_ifu_bp_pc4_f[0],io_ifu_bp_way_f[0],io_ifu_bp_valid_f[0],io_ifu_bp_ret_f[0]}; // @[Cat.scala 29:58]
  wire [11:0] brdata_in = {io_ifu_bp_hist1_f[1],io_ifu_bp_hist0_f[1],io_ifu_bp_pc4_f[1],io_ifu_bp_way_f[1],io_ifu_bp_valid_f[1],io_ifu_bp_ret_f[1],_T_241}; // @[Cat.scala 29:58]
  reg [11:0] brdata1; // @[Reg.scala 27:20]
  reg [11:0] brdata0; // @[Reg.scala 27:20]
  reg [54:0] misc2; // @[Reg.scala 27:20]
  wire [54:0] misc_data_in = {io_iccm_rd_ecc_double_err,io_ic_access_fault_f,io_ic_access_fault_type_f,io_ifu_bp_btb_target_f,io_ifu_bp_poffset_f,io_ifu_bp_fghr_f}; // @[Cat.scala 29:58]
  reg [54:0] misc1; // @[Reg.scala 27:20]
  reg [54:0] misc0; // @[Reg.scala 27:20]
  wire  _T_44 = qren[0] & io_ifu_fb_consume1; // @[ifu_aln_ctl.scala 144:34]
  wire  _T_46 = _T_44 & _T_1; // @[ifu_aln_ctl.scala 144:55]
  wire  _T_49 = qren[1] & io_ifu_fb_consume1; // @[ifu_aln_ctl.scala 145:14]
  wire  _T_51 = _T_49 & _T_1; // @[ifu_aln_ctl.scala 145:35]
  wire  _T_59 = qren[0] & io_ifu_fb_consume2; // @[ifu_aln_ctl.scala 147:14]
  wire  _T_61 = _T_59 & _T_1; // @[ifu_aln_ctl.scala 147:35]
  wire  _T_69 = qren[2] & io_ifu_fb_consume2; // @[ifu_aln_ctl.scala 149:14]
  wire  _T_71 = _T_69 & _T_1; // @[ifu_aln_ctl.scala 149:35]
  wire  _T_73 = ~io_ifu_fb_consume1; // @[ifu_aln_ctl.scala 150:6]
  wire  _T_74 = ~io_ifu_fb_consume2; // @[ifu_aln_ctl.scala 150:28]
  wire  _T_75 = _T_73 & _T_74; // @[ifu_aln_ctl.scala 150:26]
  wire  _T_77 = _T_75 & _T_1; // @[ifu_aln_ctl.scala 150:48]
  wire [1:0] _T_80 = _T_51 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_82 = _T_61 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_85 = _T_77 ? rdptr : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_14 = {{1'd0}, _T_46}; // @[Mux.scala 27:72]
  wire [1:0] _T_86 = _GEN_14 | _T_80; // @[Mux.scala 27:72]
  wire [1:0] _T_88 = _T_86 | _T_82; // @[Mux.scala 27:72]
  wire [1:0] _GEN_15 = {{1'd0}, _T_71}; // @[Mux.scala 27:72]
  wire [1:0] _T_90 = _T_88 | _GEN_15; // @[Mux.scala 27:72]
  wire  _T_95 = qwen[0] & _T_1; // @[ifu_aln_ctl.scala 153:34]
  wire  _T_99 = qwen[1] & _T_1; // @[ifu_aln_ctl.scala 154:14]
  wire  _T_105 = ~ifvalid; // @[ifu_aln_ctl.scala 156:6]
  wire  _T_107 = _T_105 & _T_1; // @[ifu_aln_ctl.scala 156:15]
  wire [1:0] _T_110 = _T_99 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_112 = _T_107 ? wrptr : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_16 = {{1'd0}, _T_95}; // @[Mux.scala 27:72]
  wire [1:0] _T_113 = _GEN_16 | _T_110; // @[Mux.scala 27:72]
  wire  _T_118 = ~qwen[2]; // @[ifu_aln_ctl.scala 158:26]
  wire  _T_120 = _T_118 & _T_188; // @[ifu_aln_ctl.scala 158:35]
  wire  _T_795 = shift_2B & f0val[0]; // @[Mux.scala 27:72]
  wire  _T_796 = shift_4B & _T_802; // @[Mux.scala 27:72]
  wire  f0_shift_2B = _T_795 | _T_796; // @[Mux.scala 27:72]
  wire  _T_122 = q2off | f0_shift_2B; // @[ifu_aln_ctl.scala 158:74]
  wire  _T_126 = _T_118 & _T_187; // @[ifu_aln_ctl.scala 159:15]
  wire  _T_128 = q2off | f1_shift_2B; // @[ifu_aln_ctl.scala 159:54]
  wire  _T_132 = _T_118 & _T_186; // @[ifu_aln_ctl.scala 160:15]
  wire  _T_134 = _T_120 & _T_122; // @[Mux.scala 27:72]
  wire  _T_135 = _T_126 & _T_128; // @[Mux.scala 27:72]
  wire  _T_136 = _T_132 & q2off; // @[Mux.scala 27:72]
  wire  _T_137 = _T_134 | _T_135; // @[Mux.scala 27:72]
  wire  _T_141 = ~qwen[1]; // @[ifu_aln_ctl.scala 162:26]
  wire  _T_143 = _T_141 & _T_187; // @[ifu_aln_ctl.scala 162:35]
  wire  _T_145 = q1off | f0_shift_2B; // @[ifu_aln_ctl.scala 162:74]
  wire  _T_149 = _T_141 & _T_186; // @[ifu_aln_ctl.scala 163:15]
  wire  _T_151 = q1off | f1_shift_2B; // @[ifu_aln_ctl.scala 163:54]
  wire  _T_155 = _T_141 & _T_188; // @[ifu_aln_ctl.scala 164:15]
  wire  _T_157 = _T_143 & _T_145; // @[Mux.scala 27:72]
  wire  _T_158 = _T_149 & _T_151; // @[Mux.scala 27:72]
  wire  _T_159 = _T_155 & q1off; // @[Mux.scala 27:72]
  wire  _T_160 = _T_157 | _T_158; // @[Mux.scala 27:72]
  wire  _T_164 = ~qwen[0]; // @[ifu_aln_ctl.scala 166:26]
  wire  _T_166 = _T_164 & _T_186; // @[ifu_aln_ctl.scala 166:35]
  wire  _T_168 = q0off | f0_shift_2B; // @[ifu_aln_ctl.scala 166:76]
  wire  _T_172 = _T_164 & _T_188; // @[ifu_aln_ctl.scala 167:35]
  wire  _T_174 = q0off | f1_shift_2B; // @[ifu_aln_ctl.scala 167:76]
  wire  _T_178 = _T_164 & _T_187; // @[ifu_aln_ctl.scala 168:35]
  wire  _T_180 = _T_166 & _T_168; // @[Mux.scala 27:72]
  wire  _T_181 = _T_172 & _T_174; // @[Mux.scala 27:72]
  wire  _T_182 = _T_178 & q0off; // @[Mux.scala 27:72]
  wire  _T_183 = _T_180 | _T_181; // @[Mux.scala 27:72]
  wire [109:0] _T_211 = {misc1,misc0}; // @[Cat.scala 29:58]
  wire [109:0] _T_214 = {misc2,misc1}; // @[Cat.scala 29:58]
  wire [109:0] _T_217 = {misc0,misc2}; // @[Cat.scala 29:58]
  wire [109:0] _T_218 = qren[0] ? _T_211 : 110'h0; // @[Mux.scala 27:72]
  wire [109:0] _T_219 = qren[1] ? _T_214 : 110'h0; // @[Mux.scala 27:72]
  wire [109:0] _T_220 = qren[2] ? _T_217 : 110'h0; // @[Mux.scala 27:72]
  wire [109:0] _T_221 = _T_218 | _T_219; // @[Mux.scala 27:72]
  wire [109:0] misceff = _T_221 | _T_220; // @[Mux.scala 27:72]
  wire [54:0] misc1eff = misceff[109:55]; // @[ifu_aln_ctl.scala 187:25]
  wire [54:0] misc0eff = misceff[54:0]; // @[ifu_aln_ctl.scala 188:25]
  wire  f1dbecc = misc1eff[54]; // @[ifu_aln_ctl.scala 191:25]
  wire  f1icaf = misc1eff[53]; // @[ifu_aln_ctl.scala 192:21]
  wire [1:0] f1ictype = misc1eff[52:51]; // @[ifu_aln_ctl.scala 193:26]
  wire [30:0] f1prett = misc1eff[50:20]; // @[ifu_aln_ctl.scala 194:25]
  wire [11:0] f1poffset = misc1eff[19:8]; // @[ifu_aln_ctl.scala 195:27]
  wire [7:0] f1fghr = misc1eff[7:0]; // @[ifu_aln_ctl.scala 196:24]
  wire  f0dbecc = misc0eff[54]; // @[ifu_aln_ctl.scala 198:25]
  wire  f0icaf = misc0eff[53]; // @[ifu_aln_ctl.scala 199:21]
  wire [1:0] f0ictype = misc0eff[52:51]; // @[ifu_aln_ctl.scala 200:26]
  wire [30:0] f0prett = misc0eff[50:20]; // @[ifu_aln_ctl.scala 201:25]
  wire [11:0] f0poffset = misc0eff[19:8]; // @[ifu_aln_ctl.scala 202:27]
  wire [7:0] f0fghr = misc0eff[7:0]; // @[ifu_aln_ctl.scala 203:24]
  wire [23:0] _T_250 = {brdata1,brdata0}; // @[Cat.scala 29:58]
  wire [23:0] _T_253 = {brdata2,brdata1}; // @[Cat.scala 29:58]
  wire [23:0] _T_256 = {brdata0,brdata2}; // @[Cat.scala 29:58]
  wire [23:0] _T_257 = qren[0] ? _T_250 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_258 = qren[1] ? _T_253 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_259 = qren[2] ? _T_256 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_260 = _T_257 | _T_258; // @[Mux.scala 27:72]
  wire [23:0] brdataeff = _T_260 | _T_259; // @[Mux.scala 27:72]
  wire [11:0] brdata0eff = brdataeff[11:0]; // @[ifu_aln_ctl.scala 214:43]
  wire [11:0] brdata1eff = brdataeff[23:12]; // @[ifu_aln_ctl.scala 214:61]
  wire [11:0] _T_267 = q0sel[0] ? brdata0eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_268 = q0sel[1] ? brdata0eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_17 = {{6'd0}, _T_268}; // @[Mux.scala 27:72]
  wire [11:0] brdata0final = _T_267 | _GEN_17; // @[Mux.scala 27:72]
  wire [11:0] _T_275 = q1sel[0] ? brdata1eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_276 = q1sel[1] ? brdata1eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_18 = {{6'd0}, _T_276}; // @[Mux.scala 27:72]
  wire [11:0] brdata1final = _T_275 | _GEN_18; // @[Mux.scala 27:72]
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
  wire  consume_fb0 = _T_351 & f0val[0]; // @[ifu_aln_ctl.scala 238:32]
  wire  consume_fb1 = _T_335 & f1val[0]; // @[ifu_aln_ctl.scala 239:32]
  wire  _T_311 = ~consume_fb1; // @[ifu_aln_ctl.scala 242:39]
  wire  _T_312 = consume_fb0 & _T_311; // @[ifu_aln_ctl.scala 242:37]
  wire  _T_315 = consume_fb0 & consume_fb1; // @[ifu_aln_ctl.scala 243:37]
  wire  _T_399 = fetch_to_f2 & _T_1; // @[ifu_aln_ctl.scala 275:38]
  wire  _T_401 = ~fetch_to_f2; // @[ifu_aln_ctl.scala 276:25]
  wire  _T_403 = _T_401 & _T_372; // @[ifu_aln_ctl.scala 276:38]
  wire  _T_405 = _T_403 & _T_385; // @[ifu_aln_ctl.scala 276:53]
  wire  _T_407 = _T_405 & _T_1; // @[ifu_aln_ctl.scala 276:68]
  wire [1:0] _T_409 = _T_399 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_410 = _T_407 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire  _T_422 = fetch_to_f1 & _T_1; // @[ifu_aln_ctl.scala 280:39]
  wire  _T_425 = _T_353 & _T_1; // @[ifu_aln_ctl.scala 281:54]
  wire  _T_431 = _T_373 & _T_387; // @[ifu_aln_ctl.scala 282:54]
  wire  _T_433 = _T_431 & _T_1; // @[ifu_aln_ctl.scala 282:69]
  wire [1:0] _T_435 = _T_422 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_436 = _T_425 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_437 = _T_433 ? sf1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_438 = _T_435 | _T_436; // @[Mux.scala 27:72]
  wire  _T_453 = fetch_to_f0 & _T_1; // @[ifu_aln_ctl.scala 287:38]
  wire  _T_456 = _T_337 & _T_1; // @[ifu_aln_ctl.scala 288:54]
  wire  _T_459 = _T_352 & _T_1; // @[ifu_aln_ctl.scala 289:69]
  wire  _T_467 = _T_388 & _T_1; // @[ifu_aln_ctl.scala 290:69]
  wire [1:0] _T_469 = _T_453 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_470 = _T_456 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_471 = _T_459 ? sf1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_472 = _T_467 ? sf0val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_473 = _T_469 | _T_470; // @[Mux.scala 27:72]
  wire [1:0] _T_474 = _T_473 | _T_471; // @[Mux.scala 27:72]
  wire [1:0] _T_530 = {f1val[0],1'h1}; // @[Cat.scala 29:58]
  wire [1:0] _T_531 = f0val[1] ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_532 = _T_515 ? _T_530 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignval = _T_531 | _T_532; // @[Mux.scala 27:72]
  wire [1:0] _T_542 = {f1icaf,f0icaf}; // @[Cat.scala 29:58]
  wire  _T_543 = f0val[1] & f0icaf; // @[Mux.scala 27:72]
  wire [1:0] _T_544 = _T_515 ? _T_542 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_19 = {{1'd0}, _T_543}; // @[Mux.scala 27:72]
  wire [1:0] alignicaf = _GEN_19 | _T_544; // @[Mux.scala 27:72]
  wire [1:0] _T_549 = f0dbecc ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_555 = {f1dbecc,f0dbecc}; // @[Cat.scala 29:58]
  wire [1:0] _T_556 = f0val[1] ? _T_549 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_557 = _T_515 ? _T_555 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] aligndbecc = _T_556 | _T_557; // @[Mux.scala 27:72]
  wire [1:0] _T_568 = {f1brend[0],f0brend[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_569 = f0val[1] ? f0brend : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_570 = _T_515 ? _T_568 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignbrend = _T_569 | _T_570; // @[Mux.scala 27:72]
  wire [1:0] _T_581 = {f1pc4[0],f0pc4[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_582 = f0val[1] ? f0pc4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_583 = _T_515 ? _T_581 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignpc4 = _T_582 | _T_583; // @[Mux.scala 27:72]
  wire [1:0] _T_594 = {f1ret[0],f0ret[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_595 = f0val[1] ? f0ret : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_596 = _T_515 ? _T_594 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignret = _T_595 | _T_596; // @[Mux.scala 27:72]
  wire [1:0] _T_607 = {f1way[0],f0way[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_608 = f0val[1] ? f0way : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_609 = _T_515 ? _T_607 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignway = _T_608 | _T_609; // @[Mux.scala 27:72]
  wire [1:0] _T_620 = {f1hist1[0],f0hist1[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_621 = f0val[1] ? f0hist1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_622 = _T_515 ? _T_620 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist1 = _T_621 | _T_622; // @[Mux.scala 27:72]
  wire [1:0] _T_633 = {f1hist0[0],f0hist0[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_634 = f0val[1] ? f0hist0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_635 = _T_515 ? _T_633 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist0 = _T_634 | _T_635; // @[Mux.scala 27:72]
  wire [30:0] _T_647 = f0val[1] ? f0pc_plus1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_648 = _T_515 ? f1pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] secondpc = _T_647 | _T_648; // @[Mux.scala 27:72]
  wire  _T_657 = first4B & alignval[1]; // @[Mux.scala 27:72]
  wire  _T_658 = first2B & alignval[0]; // @[Mux.scala 27:72]
  wire  _T_662 = |alignicaf; // @[ifu_aln_ctl.scala 341:74]
  wire  _T_665 = first4B & _T_662; // @[Mux.scala 27:72]
  wire  _T_666 = first2B & alignicaf[0]; // @[Mux.scala 27:72]
  wire  _T_671 = first4B & _T_513; // @[ifu_aln_ctl.scala 343:54]
  wire  _T_673 = _T_671 & f0val[0]; // @[ifu_aln_ctl.scala 343:66]
  wire  _T_675 = ~alignicaf[0]; // @[ifu_aln_ctl.scala 343:79]
  wire  _T_676 = _T_673 & _T_675; // @[ifu_aln_ctl.scala 343:77]
  wire  _T_678 = ~aligndbecc[0]; // @[ifu_aln_ctl.scala 343:95]
  wire  _T_679 = _T_676 & _T_678; // @[ifu_aln_ctl.scala 343:93]
  wire  icaf_eff = alignicaf[1] | aligndbecc[1]; // @[ifu_aln_ctl.scala 345:31]
  wire  _T_684 = first4B & icaf_eff; // @[ifu_aln_ctl.scala 347:51]
  wire  _T_687 = |aligndbecc; // @[ifu_aln_ctl.scala 349:74]
  wire  _T_690 = first4B & _T_687; // @[Mux.scala 27:72]
  wire  _T_691 = first2B & aligndbecc[0]; // @[Mux.scala 27:72]
  wire [31:0] _T_696 = first4B ? aligndata : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_697 = first2B ? decompressed_io_dout : 32'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_702 = f0pc[8:1] ^ f0pc[16:9]; // @[lib.scala 51:47]
  wire [7:0] firstpc_hash = _T_702 ^ f0pc[24:17]; // @[lib.scala 51:85]
  wire [7:0] _T_706 = secondpc[8:1] ^ secondpc[16:9]; // @[lib.scala 51:47]
  wire [7:0] secondpc_hash = _T_706 ^ secondpc[24:17]; // @[lib.scala 51:85]
  wire [4:0] _T_712 = f0pc[13:9] ^ f0pc[18:14]; // @[lib.scala 42:111]
  wire [4:0] firstbrtag_hash = _T_712 ^ f0pc[23:19]; // @[lib.scala 42:111]
  wire [4:0] _T_717 = secondpc[13:9] ^ secondpc[18:14]; // @[lib.scala 42:111]
  wire [4:0] secondbrtag_hash = _T_717 ^ secondpc[23:19]; // @[lib.scala 42:111]
  wire  _T_719 = first2B & alignbrend[0]; // @[ifu_aln_ctl.scala 366:45]
  wire  _T_721 = first4B & alignbrend[1]; // @[ifu_aln_ctl.scala 366:73]
  wire  _T_722 = _T_719 | _T_721; // @[ifu_aln_ctl.scala 366:62]
  wire  _T_726 = _T_657 & alignbrend[0]; // @[ifu_aln_ctl.scala 366:115]
  wire  _T_729 = first2B & alignret[0]; // @[ifu_aln_ctl.scala 368:49]
  wire  _T_731 = first4B & alignret[1]; // @[ifu_aln_ctl.scala 368:75]
  wire  _T_734 = first2B & alignpc4[0]; // @[ifu_aln_ctl.scala 370:29]
  wire  _T_736 = first4B & alignpc4[1]; // @[ifu_aln_ctl.scala 370:55]
  wire  i0_brp_pc4 = _T_734 | _T_736; // @[ifu_aln_ctl.scala 370:44]
  wire  _T_738 = first2B | alignbrend[0]; // @[ifu_aln_ctl.scala 372:53]
  wire  _T_744 = first2B & alignhist1[0]; // @[ifu_aln_ctl.scala 374:54]
  wire  _T_746 = first4B & alignhist1[1]; // @[ifu_aln_ctl.scala 374:82]
  wire  _T_747 = _T_744 | _T_746; // @[ifu_aln_ctl.scala 374:71]
  wire  _T_749 = first2B & alignhist0[0]; // @[ifu_aln_ctl.scala 375:14]
  wire  _T_751 = first4B & alignhist0[1]; // @[ifu_aln_ctl.scala 375:42]
  wire  _T_752 = _T_749 | _T_751; // @[ifu_aln_ctl.scala 375:31]
  wire  i0_ends_f1 = first4B & _T_515; // @[ifu_aln_ctl.scala 377:28]
  wire  _T_768 = io_dec_aln_aln_ib_i0_brp_valid & i0_brp_pc4; // @[ifu_aln_ctl.scala 386:77]
  wire  _T_769 = _T_768 & first2B; // @[ifu_aln_ctl.scala 386:91]
  wire  _T_770 = ~i0_brp_pc4; // @[ifu_aln_ctl.scala 386:139]
  wire  _T_771 = io_dec_aln_aln_ib_i0_brp_valid & _T_770; // @[ifu_aln_ctl.scala 386:137]
  wire  _T_772 = _T_771 & first4B; // @[ifu_aln_ctl.scala 386:151]
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  ifu_compress_ctl decompressed ( // @[ifu_aln_ctl.scala 353:28]
    .io_din(decompressed_io_din),
    .io_dout(decompressed_io_dout)
  );
  assign io_dec_aln_aln_dec_ifu_i0_cinst = aligndata[15:0]; // @[ifu_aln_ctl.scala 332:35]
  assign io_dec_aln_aln_ib_ifu_i0_icaf = _T_665 | _T_666; // @[ifu_aln_ctl.scala 341:33]
  assign io_dec_aln_aln_ib_ifu_i0_icaf_type = _T_679 ? f1ictype : f0ictype; // @[ifu_aln_ctl.scala 343:38]
  assign io_dec_aln_aln_ib_ifu_i0_icaf_second = _T_684 & _T_515; // @[ifu_aln_ctl.scala 347:40]
  assign io_dec_aln_aln_ib_ifu_i0_dbecc = _T_690 | _T_691; // @[ifu_aln_ctl.scala 349:34]
  assign io_dec_aln_aln_ib_ifu_i0_bp_index = _T_738 ? firstpc_hash : secondpc_hash; // @[ifu_aln_ctl.scala 388:37]
  assign io_dec_aln_aln_ib_ifu_i0_bp_fghr = i0_ends_f1 ? f1fghr : f0fghr; // @[ifu_aln_ctl.scala 390:36]
  assign io_dec_aln_aln_ib_ifu_i0_bp_btag = _T_738 ? firstbrtag_hash : secondbrtag_hash; // @[ifu_aln_ctl.scala 392:36]
  assign io_dec_aln_aln_ib_ifu_i0_valid = _T_657 | _T_658; // @[ifu_aln_ctl.scala 339:34]
  assign io_dec_aln_aln_ib_ifu_i0_instr = _T_696 | _T_697; // @[ifu_aln_ctl.scala 355:34]
  assign io_dec_aln_aln_ib_ifu_i0_pc = f0pc; // @[ifu_aln_ctl.scala 326:31]
  assign io_dec_aln_aln_ib_ifu_i0_pc4 = aligndata[1:0] == 2'h3; // @[ifu_aln_ctl.scala 330:32]
  assign io_dec_aln_aln_ib_i0_brp_valid = _T_722 | _T_726; // @[ifu_aln_ctl.scala 366:34]
  assign io_dec_aln_aln_ib_i0_brp_bits_toffset = i0_ends_f1 ? f1poffset : f0poffset; // @[ifu_aln_ctl.scala 378:41]
  assign io_dec_aln_aln_ib_i0_brp_bits_hist = {_T_747,_T_752}; // @[ifu_aln_ctl.scala 374:38]
  assign io_dec_aln_aln_ib_i0_brp_bits_br_error = _T_769 | _T_772; // @[ifu_aln_ctl.scala 386:42]
  assign io_dec_aln_aln_ib_i0_brp_bits_br_start_error = _T_657 & alignbrend[0]; // @[ifu_aln_ctl.scala 382:49]
  assign io_dec_aln_aln_ib_i0_brp_bits_bank = _T_738 ? f0pc[0] : secondpc[0]; // @[ifu_aln_ctl.scala 384:49]
  assign io_dec_aln_aln_ib_i0_brp_bits_prett = i0_ends_f1 ? f1prett : f0prett; // @[ifu_aln_ctl.scala 380:39]
  assign io_dec_aln_aln_ib_i0_brp_bits_way = _T_738 ? alignway[0] : alignway[1]; // @[ifu_aln_ctl.scala 372:37]
  assign io_dec_aln_aln_ib_i0_brp_bits_ret = _T_729 | _T_731; // @[ifu_aln_ctl.scala 368:37]
  assign io_dec_aln_ifu_pmu_instr_aligned = io_dec_i0_decode_d & _T_785; // @[ifu_aln_ctl.scala 398:36]
  assign io_ifu_fb_consume1 = _T_312 & _T_1; // @[ifu_aln_ctl.scala 242:22]
  assign io_ifu_fb_consume2 = _T_315 & _T_1; // @[ifu_aln_ctl.scala 243:22]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = _T_354 | _T_358; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = _T_25 | f1_shift_2B; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = _T_29 | shift_4B; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = qwen[2]; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = qwen[1]; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = qwen[0]; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = qwen[2]; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = qwen[1]; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = qwen[0]; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = qwen[2]; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = qwen[1]; // @[lib.scala 407:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_11_io_en = qwen[0]; // @[lib.scala 407:17]
  assign decompressed_io_din = aligndata[15:0]; // @[ifu_aln_ctl.scala 394:23]
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
  wrptr = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rdptr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  f2val = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  f1val = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  f0val = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  q2off = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  q1off = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  q0off = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  q1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  q0 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  q2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  f2pc = _RAND_12[30:0];
  _RAND_13 = {1{`RANDOM}};
  f1pc = _RAND_13[30:0];
  _RAND_14 = {1{`RANDOM}};
  f0pc = _RAND_14[30:0];
  _RAND_15 = {1{`RANDOM}};
  brdata2 = _RAND_15[11:0];
  _RAND_16 = {1{`RANDOM}};
  brdata1 = _RAND_16[11:0];
  _RAND_17 = {1{`RANDOM}};
  brdata0 = _RAND_17[11:0];
  _RAND_18 = {2{`RANDOM}};
  misc2 = _RAND_18[54:0];
  _RAND_19 = {2{`RANDOM}};
  misc1 = _RAND_19[54:0];
  _RAND_20 = {2{`RANDOM}};
  misc0 = _RAND_20[54:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    error_stall = 1'h0;
  end
  if (reset) begin
    wrptr = 2'h0;
  end
  if (reset) begin
    rdptr = 2'h0;
  end
  if (reset) begin
    f2val = 2'h0;
  end
  if (reset) begin
    f1val = 2'h0;
  end
  if (reset) begin
    f0val = 2'h0;
  end
  if (reset) begin
    q2off = 1'h0;
  end
  if (reset) begin
    q1off = 1'h0;
  end
  if (reset) begin
    q0off = 1'h0;
  end
  if (reset) begin
    q1 = 32'h0;
  end
  if (reset) begin
    q0 = 32'h0;
  end
  if (reset) begin
    q2 = 32'h0;
  end
  if (reset) begin
    f2pc = 31'h0;
  end
  if (reset) begin
    f1pc = 31'h0;
  end
  if (reset) begin
    f0pc = 31'h0;
  end
  if (reset) begin
    brdata2 = 12'h0;
  end
  if (reset) begin
    brdata1 = 12'h0;
  end
  if (reset) begin
    brdata0 = 12'h0;
  end
  if (reset) begin
    misc2 = 55'h0;
  end
  if (reset) begin
    misc1 = 55'h0;
  end
  if (reset) begin
    misc0 = 55'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      error_stall <= 1'h0;
    end else begin
      error_stall <= _T & _T_1;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      wrptr <= 2'h0;
    end else begin
      wrptr <= _T_113 | _T_112;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      rdptr <= 2'h0;
    end else begin
      rdptr <= _T_90 | _T_85;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      f2val <= 2'h0;
    end else begin
      f2val <= _T_409 | _T_410;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      f1val <= 2'h0;
    end else begin
      f1val <= _T_438 | _T_437;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      f0val <= 2'h0;
    end else begin
      f0val <= _T_474 | _T_472;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      q2off <= 1'h0;
    end else begin
      q2off <= _T_137 | _T_136;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      q1off <= 1'h0;
    end else begin
      q1off <= _T_160 | _T_159;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      q0off <= 1'h0;
    end else begin
      q0off <= _T_183 | _T_182;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      q1 <= 32'h0;
    end else if (qwen[1]) begin
      q1 <= io_ifu_fetch_data_f;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      q0 <= 32'h0;
    end else if (qwen[0]) begin
      q0 <= io_ifu_fetch_data_f;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      q2 <= 32'h0;
    end else if (qwen[2]) begin
      q2 <= io_ifu_fetch_data_f;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      f2pc <= 31'h0;
    end else if (fetch_to_f2) begin
      f2pc <= io_ifu_fetch_pc;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      f1pc <= 31'h0;
    end else if (f1_shift_wr_en) begin
      f1pc <= f1pc_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      f0pc <= 31'h0;
    end else if (f0_shift_wr_en) begin
      f0pc <= f0pc_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      brdata2 <= 12'h0;
    end else if (qwen[2]) begin
      brdata2 <= brdata_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      brdata1 <= 12'h0;
    end else if (qwen[1]) begin
      brdata1 <= brdata_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      brdata0 <= 12'h0;
    end else if (qwen[0]) begin
      brdata0 <= brdata_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      misc2 <= 55'h0;
    end else if (qwen[2]) begin
      misc2 <= misc_data_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      misc1 <= 55'h0;
    end else if (qwen[1]) begin
      misc1 <= misc_data_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      misc0 <= 55'h0;
    end else if (qwen[0]) begin
      misc0 <= misc_data_in;
    end
  end
endmodule
