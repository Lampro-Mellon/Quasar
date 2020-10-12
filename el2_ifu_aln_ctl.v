module el2_ifu_compress_ctl(
  input  [15:0] io_din,
  output [31:0] io_dout
);
  wire  _T_2 = ~io_din[14]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_4 = ~io_din[13]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_7 = ~io_din[6]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_9 = ~io_din[5]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_11 = io_din[15] & _T_2; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_12 = _T_11 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_13 = _T_12 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_14 = _T_13 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_15 = _T_14 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_16 = _T_15 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_23 = ~io_din[11]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_28 = _T_12 & _T_23; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_29 = _T_28 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_30 = _T_29 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_30 = _T_16 | _T_30; // @[el2_ifu_compress_ctl.scala 17:53]
  wire  _T_38 = ~io_din[10]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_40 = ~io_din[9]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_42 = ~io_din[8]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_44 = ~io_din[7]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_50 = ~io_din[4]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_52 = ~io_din[3]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_54 = ~io_din[2]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_56 = _T_2 & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_57 = _T_56 & _T_23; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_58 = _T_57 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_59 = _T_58 & _T_40; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_60 = _T_59 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_61 = _T_60 & _T_44; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_62 = _T_61 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_63 = _T_62 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_64 = _T_63 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_65 = _T_64 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_66 = _T_65 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_20 = _T_66 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_79 = _T_28 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_90 = _T_12 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_91 = _T_90 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_92 = _T_79 | _T_91; // @[el2_ifu_compress_ctl.scala 21:46]
  wire  _T_102 = _T_12 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_103 = _T_102 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_104 = _T_92 | _T_103; // @[el2_ifu_compress_ctl.scala 21:80]
  wire  _T_114 = _T_12 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_115 = _T_114 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_14 = _T_104 | _T_115; // @[el2_ifu_compress_ctl.scala 21:113]
  wire  _T_128 = _T_12 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_129 = _T_128 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_130 = _T_129 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_142 = _T_128 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_143 = _T_142 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_144 = _T_130 | _T_143; // @[el2_ifu_compress_ctl.scala 23:50]
  wire  _T_147 = ~io_din[0]; // @[el2_ifu_compress_ctl.scala 23:101]
  wire  _T_148 = io_din[14] & _T_147; // @[el2_ifu_compress_ctl.scala 23:99]
  wire  out_13 = _T_144 | _T_148; // @[el2_ifu_compress_ctl.scala 23:86]
  wire  _T_161 = _T_102 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_162 = _T_161 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_175 = _T_162 | _T_79; // @[el2_ifu_compress_ctl.scala 25:47]
  wire  _T_188 = _T_175 | _T_91; // @[el2_ifu_compress_ctl.scala 25:81]
  wire  _T_190 = ~io_din[15]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_194 = _T_190 & _T_2; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_195 = _T_194 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_196 = _T_188 | _T_195; // @[el2_ifu_compress_ctl.scala 25:115]
  wire  _T_200 = io_din[15] & io_din[14]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_201 = _T_200 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_12 = _T_196 | _T_201; // @[el2_ifu_compress_ctl.scala 26:26]
  wire  _T_217 = _T_11 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_218 = _T_217 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_219 = _T_218 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_220 = _T_219 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_221 = _T_220 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_224 = _T_221 & _T_147; // @[el2_ifu_compress_ctl.scala 28:53]
  wire  _T_228 = _T_2 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_229 = _T_224 | _T_228; // @[el2_ifu_compress_ctl.scala 28:67]
  wire  _T_234 = _T_200 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_6 = _T_229 | _T_234; // @[el2_ifu_compress_ctl.scala 28:88]
  wire  _T_239 = io_din[15] & _T_147; // @[el2_ifu_compress_ctl.scala 30:24]
  wire  _T_243 = io_din[15] & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_244 = _T_243 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_245 = _T_239 | _T_244; // @[el2_ifu_compress_ctl.scala 30:39]
  wire  _T_249 = io_din[13] & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_250 = _T_245 | _T_249; // @[el2_ifu_compress_ctl.scala 30:63]
  wire  _T_253 = io_din[13] & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_254 = _T_250 | _T_253; // @[el2_ifu_compress_ctl.scala 30:83]
  wire  _T_257 = io_din[13] & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_258 = _T_254 | _T_257; // @[el2_ifu_compress_ctl.scala 30:102]
  wire  _T_261 = io_din[13] & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_262 = _T_258 | _T_261; // @[el2_ifu_compress_ctl.scala 31:22]
  wire  _T_265 = io_din[13] & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_266 = _T_262 | _T_265; // @[el2_ifu_compress_ctl.scala 31:42]
  wire  _T_271 = _T_266 | _T_228; // @[el2_ifu_compress_ctl.scala 31:62]
  wire  out_5 = _T_271 | _T_200; // @[el2_ifu_compress_ctl.scala 31:83]
  wire  _T_288 = _T_2 & _T_23; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_289 = _T_288 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_290 = _T_289 & _T_40; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_291 = _T_290 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_292 = _T_291 & _T_44; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_295 = _T_292 & _T_147; // @[el2_ifu_compress_ctl.scala 33:50]
  wire  _T_303 = _T_194 & _T_147; // @[el2_ifu_compress_ctl.scala 33:87]
  wire  _T_304 = _T_295 | _T_303; // @[el2_ifu_compress_ctl.scala 33:65]
  wire  _T_308 = _T_2 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_311 = _T_308 & _T_147; // @[el2_ifu_compress_ctl.scala 34:23]
  wire  _T_312 = _T_304 | _T_311; // @[el2_ifu_compress_ctl.scala 33:102]
  wire  _T_317 = _T_190 & io_din[14]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_318 = _T_317 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_319 = _T_312 | _T_318; // @[el2_ifu_compress_ctl.scala 34:38]
  wire  _T_323 = _T_2 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_326 = _T_323 & _T_147; // @[el2_ifu_compress_ctl.scala 34:82]
  wire  _T_327 = _T_319 | _T_326; // @[el2_ifu_compress_ctl.scala 34:62]
  wire  _T_331 = _T_2 & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_334 = _T_331 & _T_147; // @[el2_ifu_compress_ctl.scala 35:23]
  wire  _T_335 = _T_327 | _T_334; // @[el2_ifu_compress_ctl.scala 34:97]
  wire  _T_339 = _T_2 & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_342 = _T_339 & _T_147; // @[el2_ifu_compress_ctl.scala 35:58]
  wire  _T_343 = _T_335 | _T_342; // @[el2_ifu_compress_ctl.scala 35:38]
  wire  _T_347 = _T_2 & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_350 = _T_347 & _T_147; // @[el2_ifu_compress_ctl.scala 35:93]
  wire  _T_351 = _T_343 | _T_350; // @[el2_ifu_compress_ctl.scala 35:73]
  wire  _T_357 = _T_2 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_358 = _T_357 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_4 = _T_351 | _T_358; // @[el2_ifu_compress_ctl.scala 35:108]
  wire  _T_380 = _T_56 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_381 = _T_380 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_382 = _T_381 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_383 = _T_382 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_384 = _T_383 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_385 = _T_384 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_386 = _T_385 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_403 = _T_56 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_404 = _T_403 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_405 = _T_404 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_406 = _T_405 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_407 = _T_406 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_408 = _T_407 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_409 = _T_408 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_410 = _T_386 | _T_409; // @[el2_ifu_compress_ctl.scala 40:59]
  wire  _T_427 = _T_56 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_428 = _T_427 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_429 = _T_428 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_430 = _T_429 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_431 = _T_430 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_432 = _T_431 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_433 = _T_432 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_434 = _T_410 | _T_433; // @[el2_ifu_compress_ctl.scala 40:107]
  wire  _T_451 = _T_56 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_452 = _T_451 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_453 = _T_452 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_454 = _T_453 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_455 = _T_454 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_456 = _T_455 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_457 = _T_456 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_458 = _T_434 | _T_457; // @[el2_ifu_compress_ctl.scala 41:50]
  wire  _T_475 = _T_56 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_476 = _T_475 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_477 = _T_476 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_478 = _T_477 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_479 = _T_478 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_480 = _T_479 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_481 = _T_480 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_482 = _T_458 | _T_481; // @[el2_ifu_compress_ctl.scala 41:94]
  wire  _T_487 = ~io_din[12]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_499 = _T_11 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_500 = _T_499 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_501 = _T_500 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_502 = _T_501 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_503 = _T_502 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_504 = _T_503 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_507 = _T_504 & _T_147; // @[el2_ifu_compress_ctl.scala 42:94]
  wire  _T_508 = _T_482 | _T_507; // @[el2_ifu_compress_ctl.scala 42:49]
  wire  _T_514 = _T_190 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_515 = _T_514 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_516 = _T_508 | _T_515; // @[el2_ifu_compress_ctl.scala 42:109]
  wire  _T_522 = _T_514 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_523 = _T_516 | _T_522; // @[el2_ifu_compress_ctl.scala 43:26]
  wire  _T_529 = _T_514 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_530 = _T_523 | _T_529; // @[el2_ifu_compress_ctl.scala 43:48]
  wire  _T_536 = _T_514 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_537 = _T_530 | _T_536; // @[el2_ifu_compress_ctl.scala 43:70]
  wire  _T_543 = _T_514 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_544 = _T_537 | _T_543; // @[el2_ifu_compress_ctl.scala 43:93]
  wire  out_2 = _T_544 | _T_228; // @[el2_ifu_compress_ctl.scala 44:26]
  wire [4:0] rs2d = io_din[6:2]; // @[el2_ifu_compress_ctl.scala 50:20]
  wire [4:0] rdd = io_din[11:7]; // @[el2_ifu_compress_ctl.scala 51:19]
  wire [4:0] rdpd = {2'h1,io_din[9:7]}; // @[Cat.scala 29:58]
  wire [4:0] rs2pd = {2'h1,io_din[4:2]}; // @[Cat.scala 29:58]
  wire  _T_557 = _T_308 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_564 = _T_317 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_565 = _T_564 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_566 = _T_557 | _T_565; // @[el2_ifu_compress_ctl.scala 55:33]
  wire  _T_572 = _T_323 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_573 = _T_566 | _T_572; // @[el2_ifu_compress_ctl.scala 55:58]
  wire  _T_580 = _T_317 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_581 = _T_580 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_582 = _T_573 | _T_581; // @[el2_ifu_compress_ctl.scala 55:79]
  wire  _T_588 = _T_331 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_589 = _T_582 | _T_588; // @[el2_ifu_compress_ctl.scala 55:104]
  wire  _T_596 = _T_317 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_597 = _T_596 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_598 = _T_589 | _T_597; // @[el2_ifu_compress_ctl.scala 56:24]
  wire  _T_604 = _T_339 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_605 = _T_598 | _T_604; // @[el2_ifu_compress_ctl.scala 56:48]
  wire  _T_613 = _T_317 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_614 = _T_613 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_615 = _T_605 | _T_614; // @[el2_ifu_compress_ctl.scala 56:69]
  wire  _T_621 = _T_347 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_622 = _T_615 | _T_621; // @[el2_ifu_compress_ctl.scala 56:94]
  wire  _T_629 = _T_317 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_630 = _T_629 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_631 = _T_622 | _T_630; // @[el2_ifu_compress_ctl.scala 57:22]
  wire  _T_635 = _T_190 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_636 = _T_631 | _T_635; // @[el2_ifu_compress_ctl.scala 57:46]
  wire  _T_642 = _T_190 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_643 = _T_642 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rdrd = _T_636 | _T_643; // @[el2_ifu_compress_ctl.scala 57:65]
  wire  _T_651 = _T_380 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_659 = _T_403 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_660 = _T_651 | _T_659; // @[el2_ifu_compress_ctl.scala 59:38]
  wire  _T_668 = _T_427 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_669 = _T_660 | _T_668; // @[el2_ifu_compress_ctl.scala 59:63]
  wire  _T_677 = _T_451 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_678 = _T_669 | _T_677; // @[el2_ifu_compress_ctl.scala 59:87]
  wire  _T_686 = _T_475 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_687 = _T_678 | _T_686; // @[el2_ifu_compress_ctl.scala 60:27]
  wire  _T_703 = _T_2 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_704 = _T_703 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_705 = _T_704 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_706 = _T_705 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_707 = _T_706 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_708 = _T_707 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_709 = _T_708 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_710 = _T_687 | _T_709; // @[el2_ifu_compress_ctl.scala 60:51]
  wire  _T_717 = _T_56 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_718 = _T_717 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_719 = _T_710 | _T_718; // @[el2_ifu_compress_ctl.scala 60:89]
  wire  _T_726 = _T_56 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_727 = _T_726 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_728 = _T_719 | _T_727; // @[el2_ifu_compress_ctl.scala 61:27]
  wire  _T_735 = _T_56 & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_736 = _T_735 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_737 = _T_728 | _T_736; // @[el2_ifu_compress_ctl.scala 61:51]
  wire  _T_744 = _T_56 & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_745 = _T_744 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_746 = _T_737 | _T_745; // @[el2_ifu_compress_ctl.scala 61:75]
  wire  _T_753 = _T_56 & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_754 = _T_753 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_755 = _T_746 | _T_754; // @[el2_ifu_compress_ctl.scala 61:99]
  wire  _T_764 = _T_194 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_765 = _T_764 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_766 = _T_755 | _T_765; // @[el2_ifu_compress_ctl.scala 62:27]
  wire  rdrs1 = _T_766 | _T_195; // @[el2_ifu_compress_ctl.scala 62:54]
  wire  _T_777 = io_din[15] & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_778 = _T_777 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_782 = io_din[15] & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_783 = _T_782 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_784 = _T_778 | _T_783; // @[el2_ifu_compress_ctl.scala 64:34]
  wire  _T_788 = io_din[15] & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_789 = _T_788 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_790 = _T_784 | _T_789; // @[el2_ifu_compress_ctl.scala 64:54]
  wire  _T_794 = io_din[15] & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_795 = _T_794 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_796 = _T_790 | _T_795; // @[el2_ifu_compress_ctl.scala 64:74]
  wire  _T_800 = io_din[15] & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_801 = _T_800 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_802 = _T_796 | _T_801; // @[el2_ifu_compress_ctl.scala 64:94]
  wire  _T_807 = _T_200 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rs2rs2 = _T_802 | _T_807; // @[el2_ifu_compress_ctl.scala 64:114]
  wire  rdprd = _T_12 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_820 = io_din[15] & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_821 = _T_820 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_827 = _T_821 | _T_234; // @[el2_ifu_compress_ctl.scala 68:36]
  wire  _T_830 = ~io_din[1]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_831 = io_din[14] & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_834 = _T_831 & _T_147; // @[el2_ifu_compress_ctl.scala 68:76]
  wire  rdprs1 = _T_827 | _T_834; // @[el2_ifu_compress_ctl.scala 68:57]
  wire  _T_846 = _T_128 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_847 = _T_846 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_851 = io_din[15] & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_854 = _T_851 & _T_147; // @[el2_ifu_compress_ctl.scala 70:66]
  wire  rs2prs2 = _T_847 | _T_854; // @[el2_ifu_compress_ctl.scala 70:47]
  wire  _T_859 = _T_190 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rs2prd = _T_859 & _T_147; // @[el2_ifu_compress_ctl.scala 72:33]
  wire  _T_866 = _T_2 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  uimm9_2 = _T_866 & _T_147; // @[el2_ifu_compress_ctl.scala 74:34]
  wire  _T_875 = _T_317 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  ulwimm6_2 = _T_875 & _T_147; // @[el2_ifu_compress_ctl.scala 76:39]
  wire  ulwspimm7_2 = _T_317 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_897 = _T_317 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_898 = _T_897 & _T_23; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_899 = _T_898 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_900 = _T_899 & _T_40; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_901 = _T_900 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rdeq2 = _T_901 & _T_44; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1027 = _T_194 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rdeq1 = _T_482 | _T_1027; // @[el2_ifu_compress_ctl.scala 84:42]
  wire  _T_1050 = io_din[14] & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1051 = rdeq2 | _T_1050; // @[el2_ifu_compress_ctl.scala 86:53]
  wire  rs1eq2 = _T_1051 | uimm9_2; // @[el2_ifu_compress_ctl.scala 86:71]
  wire  _T_1092 = _T_357 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1093 = _T_1092 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1094 = _T_1093 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  simm5_0 = _T_1094 | _T_643; // @[el2_ifu_compress_ctl.scala 92:45]
  wire  _T_1112 = _T_897 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1121 = _T_897 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1122 = _T_1112 | _T_1121; // @[el2_ifu_compress_ctl.scala 96:44]
  wire  _T_1130 = _T_897 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1131 = _T_1122 | _T_1130; // @[el2_ifu_compress_ctl.scala 96:70]
  wire  _T_1139 = _T_897 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1140 = _T_1131 | _T_1139; // @[el2_ifu_compress_ctl.scala 96:95]
  wire  _T_1148 = _T_897 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  sluimm17_12 = _T_1140 | _T_1148; // @[el2_ifu_compress_ctl.scala 96:121]
  wire  uimm5_0 = _T_79 | _T_195; // @[el2_ifu_compress_ctl.scala 98:45]
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
  wire [4:0] l1_24 = _T_1219 | _T_1224; // @[el2_ifu_compress_ctl.scala 114:67]
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
  wire [11:0] l2_31 = l1[31:20] | _T_1356; // @[el2_ifu_compress_ctl.scala 133:25]
  wire [7:0] _T_1363 = _T_228 ? sjald[19:12] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_1364 = sluimm17_12 ? sluimmd[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_1365 = _T_1363 | _T_1364; // @[Mux.scala 27:72]
  wire [7:0] l2_19 = l1[19:12] | _T_1365; // @[el2_ifu_compress_ctl.scala 143:25]
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
  wire [6:0] l3_31 = l2[31:25] | _T_1411; // @[el2_ifu_compress_ctl.scala 151:25]
  wire [12:0] l3_24 = l2[24:12]; // @[el2_ifu_compress_ctl.scala 154:17]
  wire [4:0] _T_1417 = {sbr8d[4:1],sbr8d[8]}; // @[Cat.scala 29:58]
  wire [4:0] _T_1422 = _T_234 ? _T_1417 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1423 = _T_854 ? uswimm6d[4:0] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1424 = _T_807 ? uswspimm7d[4:0] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1425 = _T_1422 | _T_1423; // @[Mux.scala 27:72]
  wire [4:0] _T_1426 = _T_1425 | _T_1424; // @[Mux.scala 27:72]
  wire [4:0] l3_11 = l2[11:7] | _T_1426; // @[el2_ifu_compress_ctl.scala 156:24]
  wire [31:0] l3 = {l3_31,l3_24,l3_11,l2[6:0]}; // @[Cat.scala 29:58]
  wire  _T_1437 = _T_4 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1438 = _T_1437 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1439 = _T_1438 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1442 = _T_1439 & _T_147; // @[el2_ifu_compress_ctl.scala 162:39]
  wire  _T_1450 = _T_1437 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1451 = _T_1450 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1454 = _T_1451 & _T_147; // @[el2_ifu_compress_ctl.scala 162:79]
  wire  _T_1455 = _T_1442 | _T_1454; // @[el2_ifu_compress_ctl.scala 162:54]
  wire  _T_1464 = _T_642 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1465 = _T_1464 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1466 = _T_1455 | _T_1465; // @[el2_ifu_compress_ctl.scala 162:94]
  wire  _T_1474 = _T_1437 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1475 = _T_1474 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1478 = _T_1475 & _T_147; // @[el2_ifu_compress_ctl.scala 163:55]
  wire  _T_1479 = _T_1466 | _T_1478; // @[el2_ifu_compress_ctl.scala 163:30]
  wire  _T_1487 = _T_1437 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1488 = _T_1487 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1491 = _T_1488 & _T_147; // @[el2_ifu_compress_ctl.scala 163:96]
  wire  _T_1492 = _T_1479 | _T_1491; // @[el2_ifu_compress_ctl.scala 163:70]
  wire  _T_1501 = _T_642 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1502 = _T_1501 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1503 = _T_1492 | _T_1502; // @[el2_ifu_compress_ctl.scala 163:111]
  wire  _T_1510 = io_din[15] & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1511 = _T_1510 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1512 = _T_1511 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1513 = _T_1503 | _T_1512; // @[el2_ifu_compress_ctl.scala 164:29]
  wire  _T_1521 = _T_1437 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1522 = _T_1521 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1525 = _T_1522 & _T_147; // @[el2_ifu_compress_ctl.scala 164:79]
  wire  _T_1526 = _T_1513 | _T_1525; // @[el2_ifu_compress_ctl.scala 164:54]
  wire  _T_1533 = _T_487 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1534 = _T_1533 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1535 = _T_1534 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1536 = _T_1526 | _T_1535; // @[el2_ifu_compress_ctl.scala 164:94]
  wire  _T_1545 = _T_642 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1546 = _T_1545 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1547 = _T_1536 | _T_1546; // @[el2_ifu_compress_ctl.scala 164:118]
  wire  _T_1555 = _T_1437 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1556 = _T_1555 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1559 = _T_1556 & _T_147; // @[el2_ifu_compress_ctl.scala 165:28]
  wire  _T_1560 = _T_1547 | _T_1559; // @[el2_ifu_compress_ctl.scala 164:144]
  wire  _T_1567 = _T_487 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1568 = _T_1567 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1569 = _T_1568 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1570 = _T_1560 | _T_1569; // @[el2_ifu_compress_ctl.scala 165:43]
  wire  _T_1579 = _T_642 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1580 = _T_1579 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1581 = _T_1570 | _T_1580; // @[el2_ifu_compress_ctl.scala 165:67]
  wire  _T_1589 = _T_1437 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1590 = _T_1589 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1593 = _T_1590 & _T_147; // @[el2_ifu_compress_ctl.scala 166:28]
  wire  _T_1594 = _T_1581 | _T_1593; // @[el2_ifu_compress_ctl.scala 165:94]
  wire  _T_1602 = io_din[12] & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1603 = _T_1602 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1604 = _T_1603 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1605 = _T_1604 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1606 = _T_1594 | _T_1605; // @[el2_ifu_compress_ctl.scala 166:43]
  wire  _T_1615 = _T_642 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1616 = _T_1615 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1617 = _T_1606 | _T_1616; // @[el2_ifu_compress_ctl.scala 166:71]
  wire  _T_1625 = _T_1437 & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1626 = _T_1625 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1629 = _T_1626 & _T_147; // @[el2_ifu_compress_ctl.scala 167:28]
  wire  _T_1630 = _T_1617 | _T_1629; // @[el2_ifu_compress_ctl.scala 166:97]
  wire  _T_1636 = io_din[13] & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1637 = _T_1636 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1638 = _T_1637 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1639 = _T_1630 | _T_1638; // @[el2_ifu_compress_ctl.scala 167:43]
  wire  _T_1648 = _T_642 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1649 = _T_1648 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1650 = _T_1639 | _T_1649; // @[el2_ifu_compress_ctl.scala 167:67]
  wire  _T_1658 = _T_1437 & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1659 = _T_1658 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1662 = _T_1659 & _T_147; // @[el2_ifu_compress_ctl.scala 168:28]
  wire  _T_1663 = _T_1650 | _T_1662; // @[el2_ifu_compress_ctl.scala 167:93]
  wire  _T_1669 = io_din[13] & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1670 = _T_1669 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1671 = _T_1670 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1672 = _T_1663 | _T_1671; // @[el2_ifu_compress_ctl.scala 168:43]
  wire  _T_1680 = _T_1437 & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1681 = _T_1680 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1684 = _T_1681 & _T_147; // @[el2_ifu_compress_ctl.scala 168:91]
  wire  _T_1685 = _T_1672 | _T_1684; // @[el2_ifu_compress_ctl.scala 168:66]
  wire  _T_1694 = _T_642 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1695 = _T_1694 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1696 = _T_1685 | _T_1695; // @[el2_ifu_compress_ctl.scala 168:106]
  wire  _T_1702 = io_din[13] & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1703 = _T_1702 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1704 = _T_1703 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1705 = _T_1696 | _T_1704; // @[el2_ifu_compress_ctl.scala 169:29]
  wire  _T_1711 = io_din[13] & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1712 = _T_1711 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1713 = _T_1712 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1714 = _T_1705 | _T_1713; // @[el2_ifu_compress_ctl.scala 169:52]
  wire  _T_1720 = io_din[14] & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1721 = _T_1720 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1722 = _T_1714 | _T_1721; // @[el2_ifu_compress_ctl.scala 169:75]
  wire  _T_1731 = _T_703 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1732 = _T_1731 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1733 = _T_1722 | _T_1732; // @[el2_ifu_compress_ctl.scala 169:98]
  wire  _T_1740 = _T_820 & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1741 = _T_1740 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1744 = _T_1741 & _T_147; // @[el2_ifu_compress_ctl.scala 170:54]
  wire  _T_1745 = _T_1733 | _T_1744; // @[el2_ifu_compress_ctl.scala 170:29]
  wire  _T_1754 = _T_642 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1755 = _T_1754 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1758 = _T_1755 & _T_147; // @[el2_ifu_compress_ctl.scala 170:96]
  wire  _T_1759 = _T_1745 | _T_1758; // @[el2_ifu_compress_ctl.scala 170:69]
  wire  _T_1768 = _T_642 & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1769 = _T_1768 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1770 = _T_1759 | _T_1769; // @[el2_ifu_compress_ctl.scala 170:111]
  wire  _T_1777 = _T_1720 & _T_147; // @[el2_ifu_compress_ctl.scala 171:50]
  wire  legal = _T_1770 | _T_1777; // @[el2_ifu_compress_ctl.scala 171:30]
  wire [9:0] _T_1787 = {legal,legal,legal,legal,legal,legal,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  wire [18:0] _T_1796 = {_T_1787,legal,legal,legal,legal,legal,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  wire [27:0] _T_1805 = {_T_1796,legal,legal,legal,legal,legal,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  wire [31:0] _T_1809 = {_T_1805,legal,legal,legal,legal}; // @[Cat.scala 29:58]
  assign io_dout = l3 & _T_1809; // @[el2_ifu_compress_ctl.scala 173:10]
endmodule
module el2_ifu_aln_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_active_clk,
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
  input  [30:0] io_ifu_fetch_pc,
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
  output [30:0] io_i0_brp_prett,
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
  wire [15:0] decompressed_io_din; // @[el2_ifu_aln_ctl.scala 350:28]
  wire [31:0] decompressed_io_dout; // @[el2_ifu_aln_ctl.scala 350:28]
  reg  error_stall; // @[el2_ifu_aln_ctl.scala 112:51]
  wire  _T = error_stall | io_ifu_async_error_start; // @[el2_ifu_aln_ctl.scala 110:34]
  wire  _T_1 = ~io_exu_flush_final; // @[el2_ifu_aln_ctl.scala 110:64]
  wire  error_stall_in = _T & _T_1; // @[el2_ifu_aln_ctl.scala 110:62]
  reg [1:0] wrptr; // @[el2_ifu_aln_ctl.scala 113:48]
  reg [1:0] rdptr; // @[el2_ifu_aln_ctl.scala 114:48]
  reg [1:0] f2val; // @[el2_ifu_aln_ctl.scala 116:48]
  reg [1:0] f1val; // @[el2_ifu_aln_ctl.scala 117:48]
  reg [1:0] f0val; // @[el2_ifu_aln_ctl.scala 118:48]
  reg  q2off; // @[el2_ifu_aln_ctl.scala 120:48]
  reg  q1off; // @[el2_ifu_aln_ctl.scala 121:48]
  reg  q0off; // @[el2_ifu_aln_ctl.scala 122:48]
  wire  _T_784 = ~error_stall; // @[el2_ifu_aln_ctl.scala 392:39]
  wire  i0_shift = io_dec_i0_decode_d & _T_784; // @[el2_ifu_aln_ctl.scala 392:37]
  wire  _T_186 = rdptr == 2'h0; // @[el2_ifu_aln_ctl.scala 172:31]
  wire  _T_189 = _T_186 & q0off; // @[Mux.scala 27:72]
  wire  _T_187 = rdptr == 2'h1; // @[el2_ifu_aln_ctl.scala 173:11]
  wire  _T_190 = _T_187 & q1off; // @[Mux.scala 27:72]
  wire  _T_192 = _T_189 | _T_190; // @[Mux.scala 27:72]
  wire  _T_188 = rdptr == 2'h2; // @[el2_ifu_aln_ctl.scala 174:11]
  wire  _T_191 = _T_188 & q2off; // @[Mux.scala 27:72]
  wire  q0ptr = _T_192 | _T_191; // @[Mux.scala 27:72]
  wire  _T_202 = ~q0ptr; // @[el2_ifu_aln_ctl.scala 178:26]
  wire [1:0] q0sel = {q0ptr,_T_202}; // @[Cat.scala 29:58]
  wire [2:0] qren = {_T_188,_T_187,_T_186}; // @[Cat.scala 29:58]
  reg [31:0] q1; // @[Reg.scala 27:20]
  reg [31:0] q0; // @[Reg.scala 27:20]
  wire [63:0] _T_480 = {q1,q0}; // @[Cat.scala 29:58]
  wire [63:0] _T_487 = qren[0] ? _T_480 : 64'h0; // @[Mux.scala 27:72]
  reg [31:0] q2; // @[Reg.scala 27:20]
  wire [63:0] _T_483 = {q2,q1}; // @[Cat.scala 29:58]
  wire [63:0] _T_488 = qren[1] ? _T_483 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_490 = _T_487 | _T_488; // @[Mux.scala 27:72]
  wire [63:0] _T_486 = {q0,q2}; // @[Cat.scala 29:58]
  wire [63:0] _T_489 = qren[2] ? _T_486 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] qeff = _T_490 | _T_489; // @[Mux.scala 27:72]
  wire [31:0] q0eff = qeff[31:0]; // @[el2_ifu_aln_ctl.scala 294:42]
  wire [31:0] _T_497 = q0sel[0] ? q0eff : 32'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_498 = q0sel[1] ? q0eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_12 = {{16'd0}, _T_498}; // @[Mux.scala 27:72]
  wire [31:0] q0final = _T_497 | _GEN_12; // @[Mux.scala 27:72]
  wire [31:0] _T_519 = f0val[0] ? q0final : 32'h0; // @[Mux.scala 27:72]
  wire  _T_514 = ~f0val[1]; // @[el2_ifu_aln_ctl.scala 300:58]
  wire  _T_516 = _T_514 & f0val[0]; // @[el2_ifu_aln_ctl.scala 300:68]
  wire  _T_197 = _T_186 & q1off; // @[Mux.scala 27:72]
  wire  _T_198 = _T_187 & q2off; // @[Mux.scala 27:72]
  wire  _T_200 = _T_197 | _T_198; // @[Mux.scala 27:72]
  wire  _T_199 = _T_188 & q0off; // @[Mux.scala 27:72]
  wire  q1ptr = _T_200 | _T_199; // @[Mux.scala 27:72]
  wire  _T_203 = ~q1ptr; // @[el2_ifu_aln_ctl.scala 180:26]
  wire [1:0] q1sel = {q1ptr,_T_203}; // @[Cat.scala 29:58]
  wire [31:0] q1eff = qeff[63:32]; // @[el2_ifu_aln_ctl.scala 294:29]
  wire [15:0] _T_507 = q1sel[0] ? q1eff[15:0] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_508 = q1sel[1] ? q1eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] q1final = _T_507 | _T_508; // @[Mux.scala 27:72]
  wire [47:0] _T_518 = {q1final,q0final}; // @[Cat.scala 29:58]
  wire [47:0] _T_520 = _T_516 ? _T_518 : 48'h0; // @[Mux.scala 27:72]
  wire [47:0] _GEN_13 = {{16'd0}, _T_519}; // @[Mux.scala 27:72]
  wire [47:0] aligndata = _GEN_13 | _T_520; // @[Mux.scala 27:72]
  wire  first4B = aligndata[1:0] == 2'h3; // @[el2_ifu_aln_ctl.scala 332:29]
  wire  first2B = ~first4B; // @[el2_ifu_aln_ctl.scala 334:17]
  wire  shift_2B = i0_shift & first2B; // @[el2_ifu_aln_ctl.scala 396:24]
  wire [1:0] _T_444 = {1'h0,f0val[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_449 = shift_2B ? _T_444 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_445 = ~shift_2B; // @[el2_ifu_aln_ctl.scala 284:6]
  wire  shift_4B = i0_shift & first4B; // @[el2_ifu_aln_ctl.scala 397:24]
  wire  _T_446 = ~shift_4B; // @[el2_ifu_aln_ctl.scala 284:18]
  wire  _T_447 = _T_445 & _T_446; // @[el2_ifu_aln_ctl.scala 284:16]
  wire [1:0] _T_450 = _T_447 ? f1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] sf0val = _T_449 | _T_450; // @[Mux.scala 27:72]
  wire  sf0_valid = sf0val[0]; // @[el2_ifu_aln_ctl.scala 237:22]
  wire  _T_352 = ~sf0_valid; // @[el2_ifu_aln_ctl.scala 256:26]
  wire  _T_801 = f0val[0] & _T_514; // @[el2_ifu_aln_ctl.scala 400:28]
  wire  f1_shift_2B = _T_801 & shift_4B; // @[el2_ifu_aln_ctl.scala 400:40]
  wire  _T_418 = f1_shift_2B & f1val[1]; // @[Mux.scala 27:72]
  wire  _T_417 = ~f1_shift_2B; // @[el2_ifu_aln_ctl.scala 277:53]
  wire [1:0] _T_419 = _T_417 ? f1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_14 = {{1'd0}, _T_418}; // @[Mux.scala 27:72]
  wire [1:0] sf1val = _GEN_14 | _T_419; // @[Mux.scala 27:72]
  wire  sf1_valid = sf1val[0]; // @[el2_ifu_aln_ctl.scala 236:22]
  wire  _T_353 = _T_352 & sf1_valid; // @[el2_ifu_aln_ctl.scala 256:37]
  wire  f2_valid = f2val[0]; // @[el2_ifu_aln_ctl.scala 235:20]
  wire  _T_354 = _T_353 & f2_valid; // @[el2_ifu_aln_ctl.scala 256:50]
  wire  ifvalid = io_ifu_fetch_val[0]; // @[el2_ifu_aln_ctl.scala 245:30]
  wire  _T_355 = _T_354 & ifvalid; // @[el2_ifu_aln_ctl.scala 256:62]
  wire  _T_356 = sf0_valid & sf1_valid; // @[el2_ifu_aln_ctl.scala 257:17]
  wire  _T_357 = ~f2_valid; // @[el2_ifu_aln_ctl.scala 257:32]
  wire  _T_358 = _T_356 & _T_357; // @[el2_ifu_aln_ctl.scala 257:30]
  wire  _T_359 = _T_358 & ifvalid; // @[el2_ifu_aln_ctl.scala 257:42]
  wire  fetch_to_f2 = _T_355 | _T_359; // @[el2_ifu_aln_ctl.scala 256:74]
  reg [30:0] f2pc; // @[Reg.scala 27:20]
  wire  _T_336 = ~sf1_valid; // @[el2_ifu_aln_ctl.scala 252:39]
  wire  _T_337 = _T_352 & _T_336; // @[el2_ifu_aln_ctl.scala 252:37]
  wire  _T_338 = _T_337 & f2_valid; // @[el2_ifu_aln_ctl.scala 252:50]
  wire  _T_339 = _T_338 & ifvalid; // @[el2_ifu_aln_ctl.scala 252:62]
  wire  _T_343 = _T_353 & _T_357; // @[el2_ifu_aln_ctl.scala 253:30]
  wire  _T_344 = _T_343 & ifvalid; // @[el2_ifu_aln_ctl.scala 253:42]
  wire  _T_345 = _T_339 | _T_344; // @[el2_ifu_aln_ctl.scala 252:74]
  wire  _T_347 = sf0_valid & _T_336; // @[el2_ifu_aln_ctl.scala 254:17]
  wire  _T_349 = _T_347 & _T_357; // @[el2_ifu_aln_ctl.scala 254:30]
  wire  _T_350 = _T_349 & ifvalid; // @[el2_ifu_aln_ctl.scala 254:42]
  wire  fetch_to_f1 = _T_345 | _T_350; // @[el2_ifu_aln_ctl.scala 253:54]
  wire  _T_25 = fetch_to_f1 | _T_354; // @[el2_ifu_aln_ctl.scala 141:33]
  wire  f1_shift_wr_en = _T_25 | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 141:47]
  reg [30:0] f1pc; // @[Reg.scala 27:20]
  wire [30:0] _T_376 = fetch_to_f1 ? io_ifu_fetch_pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_377 = _T_354 ? f2pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_379 = _T_376 | _T_377; // @[Mux.scala 27:72]
  wire  _T_372 = ~fetch_to_f1; // @[el2_ifu_aln_ctl.scala 267:6]
  wire  _T_373 = ~_T_354; // @[el2_ifu_aln_ctl.scala 267:21]
  wire  _T_374 = _T_372 & _T_373; // @[el2_ifu_aln_ctl.scala 267:19]
  wire [30:0] _T_364 = f1_shift_2B ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  reg [30:0] f0pc; // @[Reg.scala 27:20]
  wire [30:0] f0pc_plus1 = f0pc + 31'h1; // @[el2_ifu_aln_ctl.scala 259:25]
  wire [30:0] _T_365 = _T_364 & f0pc_plus1; // @[el2_ifu_aln_ctl.scala 263:38]
  wire [30:0] _T_368 = _T_417 ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [30:0] _T_369 = _T_368 & f0pc; // @[el2_ifu_aln_ctl.scala 263:78]
  wire [30:0] sf1pc = _T_365 | _T_369; // @[el2_ifu_aln_ctl.scala 263:52]
  wire [30:0] _T_378 = _T_374 ? sf1pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] f1pc_in = _T_379 | _T_378; // @[Mux.scala 27:72]
  wire  _T_333 = _T_337 & _T_357; // @[el2_ifu_aln_ctl.scala 251:50]
  wire  fetch_to_f0 = _T_333 & ifvalid; // @[el2_ifu_aln_ctl.scala 251:62]
  wire  _T_27 = fetch_to_f0 | _T_338; // @[el2_ifu_aln_ctl.scala 142:33]
  wire  _T_28 = _T_27 | _T_353; // @[el2_ifu_aln_ctl.scala 142:47]
  wire  _T_29 = _T_28 | shift_2B; // @[el2_ifu_aln_ctl.scala 142:61]
  wire  f0_shift_wr_en = _T_29 | shift_4B; // @[el2_ifu_aln_ctl.scala 142:72]
  wire [30:0] _T_391 = fetch_to_f0 ? io_ifu_fetch_pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_392 = _T_338 ? f2pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_395 = _T_391 | _T_392; // @[Mux.scala 27:72]
  wire [30:0] _T_393 = _T_353 ? sf1pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_396 = _T_395 | _T_393; // @[Mux.scala 27:72]
  wire  _T_385 = ~fetch_to_f0; // @[el2_ifu_aln_ctl.scala 272:24]
  wire  _T_386 = ~_T_338; // @[el2_ifu_aln_ctl.scala 272:39]
  wire  _T_387 = _T_385 & _T_386; // @[el2_ifu_aln_ctl.scala 272:37]
  wire  _T_388 = ~_T_353; // @[el2_ifu_aln_ctl.scala 272:54]
  wire  _T_389 = _T_387 & _T_388; // @[el2_ifu_aln_ctl.scala 272:52]
  wire [30:0] _T_394 = _T_389 ? f0pc_plus1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] f0pc_in = _T_396 | _T_394; // @[Mux.scala 27:72]
  wire  _T_35 = wrptr == 2'h2; // @[el2_ifu_aln_ctl.scala 145:21]
  wire  _T_36 = _T_35 & ifvalid; // @[el2_ifu_aln_ctl.scala 145:29]
  wire  _T_37 = wrptr == 2'h1; // @[el2_ifu_aln_ctl.scala 145:46]
  wire  _T_38 = _T_37 & ifvalid; // @[el2_ifu_aln_ctl.scala 145:54]
  wire  _T_39 = wrptr == 2'h0; // @[el2_ifu_aln_ctl.scala 145:71]
  wire  _T_40 = _T_39 & ifvalid; // @[el2_ifu_aln_ctl.scala 145:79]
  wire [2:0] qwen = {_T_36,_T_38,_T_40}; // @[Cat.scala 29:58]
  reg [11:0] brdata2; // @[Reg.scala 27:20]
  wire [5:0] _T_242 = {io_ifu_bp_hist1_f[0],io_ifu_bp_hist0_f[0],io_ifu_bp_pc4_f[0],io_ifu_bp_way_f[0],io_ifu_bp_valid_f[0],io_ifu_bp_ret_f[0]}; // @[Cat.scala 29:58]
  wire [11:0] brdata_in = {io_ifu_bp_hist1_f[1],io_ifu_bp_hist0_f[1],io_ifu_bp_pc4_f[1],io_ifu_bp_way_f[1],io_ifu_bp_valid_f[1],io_ifu_bp_ret_f[1],_T_242}; // @[Cat.scala 29:58]
  reg [11:0] brdata1; // @[Reg.scala 27:20]
  reg [11:0] brdata0; // @[Reg.scala 27:20]
  reg [54:0] _T_14; // @[Reg.scala 27:20]
  wire [54:0] misc_data_in = {io_iccm_rd_ecc_double_err,io_ic_access_fault_f,io_ic_access_fault_type_f,io_ifu_bp_btb_target_f[31:1],io_ifu_bp_poffset_f,io_ifu_bp_fghr_f}; // @[Cat.scala 29:58]
  reg [54:0] _T_16; // @[Reg.scala 27:20]
  reg [54:0] _T_18; // @[Reg.scala 27:20]
  wire  _T_44 = qren[0] & io_ifu_fb_consume1; // @[el2_ifu_aln_ctl.scala 147:34]
  wire  _T_46 = _T_44 & _T_1; // @[el2_ifu_aln_ctl.scala 147:55]
  wire  _T_49 = qren[1] & io_ifu_fb_consume1; // @[el2_ifu_aln_ctl.scala 148:14]
  wire  _T_51 = _T_49 & _T_1; // @[el2_ifu_aln_ctl.scala 148:35]
  wire  _T_59 = qren[0] & io_ifu_fb_consume2; // @[el2_ifu_aln_ctl.scala 150:14]
  wire  _T_61 = _T_59 & _T_1; // @[el2_ifu_aln_ctl.scala 150:35]
  wire  _T_69 = qren[2] & io_ifu_fb_consume2; // @[el2_ifu_aln_ctl.scala 152:14]
  wire  _T_71 = _T_69 & _T_1; // @[el2_ifu_aln_ctl.scala 152:35]
  wire  _T_73 = ~io_ifu_fb_consume1; // @[el2_ifu_aln_ctl.scala 153:6]
  wire  _T_74 = ~io_ifu_fb_consume2; // @[el2_ifu_aln_ctl.scala 153:28]
  wire  _T_75 = _T_73 & _T_74; // @[el2_ifu_aln_ctl.scala 153:26]
  wire  _T_77 = _T_75 & _T_1; // @[el2_ifu_aln_ctl.scala 153:48]
  wire [1:0] _T_80 = _T_51 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_82 = _T_61 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_85 = _T_77 ? rdptr : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_15 = {{1'd0}, _T_46}; // @[Mux.scala 27:72]
  wire [1:0] _T_86 = _GEN_15 | _T_80; // @[Mux.scala 27:72]
  wire [1:0] _T_88 = _T_86 | _T_82; // @[Mux.scala 27:72]
  wire [1:0] _GEN_16 = {{1'd0}, _T_71}; // @[Mux.scala 27:72]
  wire [1:0] _T_90 = _T_88 | _GEN_16; // @[Mux.scala 27:72]
  wire [1:0] rdptr_in = _T_90 | _T_85; // @[Mux.scala 27:72]
  wire  _T_95 = qwen[0] & _T_1; // @[el2_ifu_aln_ctl.scala 155:34]
  wire  _T_99 = qwen[1] & _T_1; // @[el2_ifu_aln_ctl.scala 156:14]
  wire  _T_105 = ~ifvalid; // @[el2_ifu_aln_ctl.scala 158:6]
  wire  _T_107 = _T_105 & _T_1; // @[el2_ifu_aln_ctl.scala 158:15]
  wire [1:0] _T_110 = _T_99 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_112 = _T_107 ? wrptr : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_17 = {{1'd0}, _T_95}; // @[Mux.scala 27:72]
  wire [1:0] _T_113 = _GEN_17 | _T_110; // @[Mux.scala 27:72]
  wire [1:0] wrptr_in = _T_113 | _T_112; // @[Mux.scala 27:72]
  wire  _T_118 = ~qwen[2]; // @[el2_ifu_aln_ctl.scala 160:26]
  wire  _T_120 = _T_118 & _T_188; // @[el2_ifu_aln_ctl.scala 160:35]
  wire  _T_794 = shift_2B & f0val[0]; // @[Mux.scala 27:72]
  wire  _T_791 = ~f0val[0]; // @[el2_ifu_aln_ctl.scala 399:77]
  wire  _T_793 = _T_791 & f0val[0]; // @[el2_ifu_aln_ctl.scala 399:87]
  wire  _T_795 = shift_4B & _T_793; // @[Mux.scala 27:72]
  wire  f0_shift_2B = _T_794 | _T_795; // @[Mux.scala 27:72]
  wire  _T_122 = q2off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 160:74]
  wire  _T_126 = _T_118 & _T_187; // @[el2_ifu_aln_ctl.scala 161:15]
  wire  _T_128 = q2off | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 161:54]
  wire  _T_132 = _T_118 & _T_186; // @[el2_ifu_aln_ctl.scala 162:15]
  wire  _T_134 = _T_120 & _T_122; // @[Mux.scala 27:72]
  wire  _T_135 = _T_126 & _T_128; // @[Mux.scala 27:72]
  wire  _T_136 = _T_132 & q2off; // @[Mux.scala 27:72]
  wire  _T_137 = _T_134 | _T_135; // @[Mux.scala 27:72]
  wire  q2off_in = _T_137 | _T_136; // @[Mux.scala 27:72]
  wire  _T_141 = ~qwen[1]; // @[el2_ifu_aln_ctl.scala 164:26]
  wire  _T_143 = _T_141 & _T_187; // @[el2_ifu_aln_ctl.scala 164:35]
  wire  _T_145 = q1off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 164:74]
  wire  _T_149 = _T_141 & _T_186; // @[el2_ifu_aln_ctl.scala 165:15]
  wire  _T_151 = q1off | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 165:54]
  wire  _T_155 = _T_141 & _T_188; // @[el2_ifu_aln_ctl.scala 166:15]
  wire  _T_157 = _T_143 & _T_145; // @[Mux.scala 27:72]
  wire  _T_158 = _T_149 & _T_151; // @[Mux.scala 27:72]
  wire  _T_159 = _T_155 & q1off; // @[Mux.scala 27:72]
  wire  _T_160 = _T_157 | _T_158; // @[Mux.scala 27:72]
  wire  q1off_in = _T_160 | _T_159; // @[Mux.scala 27:72]
  wire  _T_164 = ~qwen[0]; // @[el2_ifu_aln_ctl.scala 168:26]
  wire  _T_166 = _T_164 & _T_186; // @[el2_ifu_aln_ctl.scala 168:35]
  wire  _T_168 = q0off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 168:76]
  wire  _T_172 = _T_164 & _T_188; // @[el2_ifu_aln_ctl.scala 169:15]
  wire  _T_174 = q0off | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 169:56]
  wire  _T_178 = _T_164 & _T_187; // @[el2_ifu_aln_ctl.scala 170:15]
  wire  _T_180 = _T_166 & _T_168; // @[Mux.scala 27:72]
  wire  _T_181 = _T_172 & _T_174; // @[Mux.scala 27:72]
  wire  _T_182 = _T_178 & q0off; // @[Mux.scala 27:72]
  wire  _T_183 = _T_180 | _T_181; // @[Mux.scala 27:72]
  wire  q0off_in = _T_183 | _T_182; // @[Mux.scala 27:72]
  wire [53:0] misc1 = _T_16[53:0]; // @[el2_ifu_aln_ctl.scala 133:9]
  wire [53:0] misc0 = _T_18[53:0]; // @[el2_ifu_aln_ctl.scala 134:9]
  wire [107:0] _T_212 = {misc1,misc0}; // @[Cat.scala 29:58]
  wire [53:0] misc2 = _T_14[53:0]; // @[el2_ifu_aln_ctl.scala 132:9]
  wire [107:0] _T_215 = {misc2,misc1}; // @[Cat.scala 29:58]
  wire [107:0] _T_218 = {misc0,misc2}; // @[Cat.scala 29:58]
  wire [107:0] _T_219 = qren[0] ? _T_212 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] _T_220 = qren[1] ? _T_215 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] _T_221 = qren[2] ? _T_218 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] _T_222 = _T_219 | _T_220; // @[Mux.scala 27:72]
  wire [107:0] misceff = _T_222 | _T_221; // @[Mux.scala 27:72]
  wire [52:0] misc1eff = misceff[107:55]; // @[el2_ifu_aln_ctl.scala 189:25]
  wire [54:0] misc0eff = misceff[54:0]; // @[el2_ifu_aln_ctl.scala 190:25]
  wire  f1dbecc = misc1eff[52]; // @[el2_ifu_aln_ctl.scala 193:25]
  wire  f1icaf = misc1eff[51]; // @[el2_ifu_aln_ctl.scala 194:21]
  wire [1:0] f1ictype = misc1eff[50:49]; // @[el2_ifu_aln_ctl.scala 195:26]
  wire [30:0] f1prett = misc1eff[48:18]; // @[el2_ifu_aln_ctl.scala 196:25]
  wire [11:0] f1poffset = misc1eff[19:8]; // @[el2_ifu_aln_ctl.scala 197:27]
  wire [7:0] f1fghr = misc1eff[7:0]; // @[el2_ifu_aln_ctl.scala 198:24]
  wire  f0dbecc = misc0eff[54]; // @[el2_ifu_aln_ctl.scala 200:25]
  wire  f0icaf = misc0eff[53]; // @[el2_ifu_aln_ctl.scala 201:21]
  wire [1:0] f0ictype = misc0eff[52:51]; // @[el2_ifu_aln_ctl.scala 202:26]
  wire [30:0] f0prett = misc0eff[50:20]; // @[el2_ifu_aln_ctl.scala 203:25]
  wire [11:0] f0poffset = misc0eff[19:8]; // @[el2_ifu_aln_ctl.scala 204:27]
  wire [7:0] f0fghr = misc0eff[7:0]; // @[el2_ifu_aln_ctl.scala 205:24]
  wire [23:0] _T_251 = {brdata1,brdata0}; // @[Cat.scala 29:58]
  wire [23:0] _T_254 = {brdata2,brdata1}; // @[Cat.scala 29:58]
  wire [23:0] _T_257 = {brdata0,brdata2}; // @[Cat.scala 29:58]
  wire [23:0] _T_258 = qren[0] ? _T_251 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_259 = qren[1] ? _T_254 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_260 = qren[2] ? _T_257 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_261 = _T_258 | _T_259; // @[Mux.scala 27:72]
  wire [23:0] brdataeff = _T_261 | _T_260; // @[Mux.scala 27:72]
  wire [11:0] brdata0eff = brdataeff[11:0]; // @[el2_ifu_aln_ctl.scala 215:43]
  wire [11:0] brdata1eff = brdataeff[23:12]; // @[el2_ifu_aln_ctl.scala 215:61]
  wire [11:0] _T_268 = q0sel[0] ? brdata0eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_269 = q0sel[1] ? brdata0eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_18 = {{6'd0}, _T_269}; // @[Mux.scala 27:72]
  wire [11:0] brdata0final = _T_268 | _GEN_18; // @[Mux.scala 27:72]
  wire [11:0] _T_276 = q1sel[0] ? brdata1eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_277 = q1sel[1] ? brdata1eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_19 = {{6'd0}, _T_277}; // @[Mux.scala 27:72]
  wire [11:0] brdata1final = _T_276 | _GEN_19; // @[Mux.scala 27:72]
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
  wire  consume_fb0 = _T_352 & f0val[0]; // @[el2_ifu_aln_ctl.scala 239:32]
  wire  consume_fb1 = _T_336 & f1val[0]; // @[el2_ifu_aln_ctl.scala 240:32]
  wire  _T_312 = ~consume_fb1; // @[el2_ifu_aln_ctl.scala 242:39]
  wire  _T_313 = consume_fb0 & _T_312; // @[el2_ifu_aln_ctl.scala 242:37]
  wire  _T_316 = consume_fb0 & consume_fb1; // @[el2_ifu_aln_ctl.scala 243:37]
  wire  _T_400 = fetch_to_f2 & _T_1; // @[el2_ifu_aln_ctl.scala 274:38]
  wire  _T_402 = ~fetch_to_f2; // @[el2_ifu_aln_ctl.scala 275:6]
  wire  _T_404 = _T_402 & _T_373; // @[el2_ifu_aln_ctl.scala 275:19]
  wire  _T_406 = _T_404 & _T_386; // @[el2_ifu_aln_ctl.scala 275:34]
  wire  _T_408 = _T_406 & _T_1; // @[el2_ifu_aln_ctl.scala 275:49]
  wire [1:0] _T_410 = _T_400 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_411 = _T_408 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] f2val_in = _T_410 | _T_411; // @[Mux.scala 27:72]
  wire  _T_423 = fetch_to_f1 & _T_1; // @[el2_ifu_aln_ctl.scala 279:38]
  wire  _T_426 = _T_354 & _T_1; // @[el2_ifu_aln_ctl.scala 280:18]
  wire  _T_432 = _T_374 & _T_388; // @[el2_ifu_aln_ctl.scala 281:34]
  wire  _T_434 = _T_432 & _T_1; // @[el2_ifu_aln_ctl.scala 281:49]
  wire [1:0] _T_436 = _T_423 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_437 = _T_426 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_438 = _T_434 ? sf1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_439 = _T_436 | _T_437; // @[Mux.scala 27:72]
  wire [1:0] f1val_in = _T_439 | _T_438; // @[Mux.scala 27:72]
  wire  _T_454 = fetch_to_f0 & _T_1; // @[el2_ifu_aln_ctl.scala 286:38]
  wire  _T_457 = _T_338 & _T_1; // @[el2_ifu_aln_ctl.scala 287:18]
  wire  _T_460 = _T_353 & _T_1; // @[el2_ifu_aln_ctl.scala 288:18]
  wire  _T_468 = _T_389 & _T_1; // @[el2_ifu_aln_ctl.scala 289:49]
  wire [1:0] _T_470 = _T_454 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_471 = _T_457 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_472 = _T_460 ? sf1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_473 = _T_468 ? sf0val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_474 = _T_470 | _T_471; // @[Mux.scala 27:72]
  wire [1:0] _T_475 = _T_474 | _T_472; // @[Mux.scala 27:72]
  wire [1:0] f0val_in = _T_475 | _T_473; // @[Mux.scala 27:72]
  wire [1:0] _T_529 = {f1val[0],1'h1}; // @[Cat.scala 29:58]
  wire [1:0] _T_530 = f0val[1] ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_531 = _T_516 ? _T_529 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignval = _T_530 | _T_531; // @[Mux.scala 27:72]
  wire [1:0] _T_541 = {f1icaf,f0icaf}; // @[Cat.scala 29:58]
  wire  _T_542 = f0val[1] & f0icaf; // @[Mux.scala 27:72]
  wire [1:0] _T_543 = _T_516 ? _T_541 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_20 = {{1'd0}, _T_542}; // @[Mux.scala 27:72]
  wire [1:0] alignicaf = _GEN_20 | _T_543; // @[Mux.scala 27:72]
  wire [1:0] _T_548 = f0dbecc ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_554 = {f1dbecc,f0dbecc}; // @[Cat.scala 29:58]
  wire [1:0] _T_555 = f0val[1] ? _T_548 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_556 = _T_516 ? _T_554 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] aligndbecc = _T_555 | _T_556; // @[Mux.scala 27:72]
  wire [1:0] _T_567 = {f1brend[0],f0brend[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_568 = f0val[1] ? f0brend : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_569 = _T_516 ? _T_567 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignbrend = _T_568 | _T_569; // @[Mux.scala 27:72]
  wire [1:0] _T_580 = {f1pc4[0],f0pc4[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_581 = f0val[1] ? f0pc4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_582 = _T_516 ? _T_580 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignpc4 = _T_581 | _T_582; // @[Mux.scala 27:72]
  wire [1:0] _T_593 = {f1ret[0],f0ret[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_594 = f0val[1] ? f0ret : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_595 = _T_516 ? _T_593 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignret = _T_594 | _T_595; // @[Mux.scala 27:72]
  wire [1:0] _T_606 = {f1way[0],f0way[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_607 = f0val[1] ? f0way : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_608 = _T_516 ? _T_606 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignway = _T_607 | _T_608; // @[Mux.scala 27:72]
  wire [1:0] _T_619 = {f1hist1[0],f0hist1[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_620 = f0val[1] ? f0hist1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_621 = _T_516 ? _T_619 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist1 = _T_620 | _T_621; // @[Mux.scala 27:72]
  wire [1:0] _T_632 = {f1hist0[0],f0hist0[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_633 = f0val[1] ? f0hist0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_634 = _T_516 ? _T_632 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist0 = _T_633 | _T_634; // @[Mux.scala 27:72]
  wire [30:0] _T_646 = f0val[1] ? f0pc_plus1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_647 = _T_516 ? f1pc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] secondpc = _T_646 | _T_647; // @[Mux.scala 27:72]
  wire  _T_656 = first4B & alignval[1]; // @[Mux.scala 27:72]
  wire  _T_657 = first2B & alignval[0]; // @[Mux.scala 27:72]
  wire  _T_661 = |alignicaf; // @[el2_ifu_aln_ctl.scala 338:59]
  wire  _T_664 = first4B & _T_661; // @[Mux.scala 27:72]
  wire  _T_665 = first2B & alignicaf[0]; // @[Mux.scala 27:72]
  wire  _T_670 = first4B & _T_514; // @[el2_ifu_aln_ctl.scala 340:39]
  wire  _T_672 = _T_670 & f0val[0]; // @[el2_ifu_aln_ctl.scala 340:51]
  wire  _T_674 = ~alignicaf[0]; // @[el2_ifu_aln_ctl.scala 340:64]
  wire  _T_675 = _T_672 & _T_674; // @[el2_ifu_aln_ctl.scala 340:62]
  wire  _T_677 = ~aligndbecc[0]; // @[el2_ifu_aln_ctl.scala 340:80]
  wire  _T_678 = _T_675 & _T_677; // @[el2_ifu_aln_ctl.scala 340:78]
  wire  icaf_eff = alignicaf[1] | aligndbecc[1]; // @[el2_ifu_aln_ctl.scala 342:31]
  wire  _T_683 = first4B & icaf_eff; // @[el2_ifu_aln_ctl.scala 344:32]
  wire  _T_686 = |aligndbecc; // @[el2_ifu_aln_ctl.scala 346:59]
  wire  _T_689 = first4B & _T_686; // @[Mux.scala 27:72]
  wire  _T_690 = first2B & aligndbecc[0]; // @[Mux.scala 27:72]
  wire [47:0] _T_695 = first4B ? aligndata : 48'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_696 = first2B ? decompressed_io_dout : 32'h0; // @[Mux.scala 27:72]
  wire [47:0] _GEN_21 = {{16'd0}, _T_696}; // @[Mux.scala 27:72]
  wire [47:0] _T_697 = _T_695 | _GEN_21; // @[Mux.scala 27:72]
  wire [7:0] _T_701 = f0pc[8:1] ^ f0pc[16:9]; // @[el2_lib.scala 191:46]
  wire [7:0] firstpc_hash = _T_701 ^ f0pc[24:17]; // @[el2_lib.scala 191:84]
  wire [7:0] _T_705 = secondpc[8:1] ^ secondpc[16:9]; // @[el2_lib.scala 191:46]
  wire [7:0] secondpc_hash = _T_705 ^ secondpc[24:17]; // @[el2_lib.scala 191:84]
  wire [4:0] _T_711 = f0pc[13:9] ^ f0pc[18:14]; // @[el2_lib.scala 182:111]
  wire [4:0] firstbrtag_hash = _T_711 ^ f0pc[23:19]; // @[el2_lib.scala 182:111]
  wire [4:0] _T_716 = secondpc[13:9] ^ secondpc[18:14]; // @[el2_lib.scala 182:111]
  wire [4:0] secondbrtag_hash = _T_716 ^ secondpc[23:19]; // @[el2_lib.scala 182:111]
  wire  _T_718 = first2B & alignbrend[0]; // @[el2_ifu_aln_ctl.scala 362:30]
  wire  _T_720 = first4B & alignbrend[1]; // @[el2_ifu_aln_ctl.scala 362:58]
  wire  _T_721 = _T_718 | _T_720; // @[el2_ifu_aln_ctl.scala 362:47]
  wire  _T_725 = _T_656 & alignbrend[0]; // @[el2_ifu_aln_ctl.scala 362:100]
  wire  _T_728 = first2B & alignret[0]; // @[el2_ifu_aln_ctl.scala 364:29]
  wire  _T_730 = first4B & alignret[1]; // @[el2_ifu_aln_ctl.scala 364:55]
  wire  _T_733 = first2B & alignpc4[0]; // @[el2_ifu_aln_ctl.scala 366:29]
  wire  _T_735 = first4B & alignpc4[1]; // @[el2_ifu_aln_ctl.scala 366:55]
  wire  i0_brp_pc4 = _T_733 | _T_735; // @[el2_ifu_aln_ctl.scala 366:44]
  wire  _T_737 = first2B | alignbrend[0]; // @[el2_ifu_aln_ctl.scala 368:33]
  wire  _T_743 = first2B & alignhist1[0]; // @[el2_ifu_aln_ctl.scala 370:34]
  wire  _T_745 = first4B & alignhist1[1]; // @[el2_ifu_aln_ctl.scala 370:62]
  wire  _T_746 = _T_743 | _T_745; // @[el2_ifu_aln_ctl.scala 370:51]
  wire  _T_748 = first2B & alignhist0[0]; // @[el2_ifu_aln_ctl.scala 371:14]
  wire  _T_750 = first4B & alignhist0[1]; // @[el2_ifu_aln_ctl.scala 371:42]
  wire  _T_751 = _T_748 | _T_750; // @[el2_ifu_aln_ctl.scala 371:31]
  wire  i0_ends_f1 = first4B & _T_516; // @[el2_ifu_aln_ctl.scala 373:28]
  wire  _T_767 = io_i0_brp_valid & i0_brp_pc4; // @[el2_ifu_aln_ctl.scala 382:42]
  wire  _T_768 = _T_767 & first2B; // @[el2_ifu_aln_ctl.scala 382:56]
  wire  _T_769 = ~i0_brp_pc4; // @[el2_ifu_aln_ctl.scala 382:89]
  wire  _T_770 = io_i0_brp_valid & _T_769; // @[el2_ifu_aln_ctl.scala 382:87]
  wire  _T_771 = _T_770 & first4B; // @[el2_ifu_aln_ctl.scala 382:101]
  wire [7:0] _T_776 = _T_737 ? firstpc_hash : secondpc_hash; // @[el2_ifu_aln_ctl.scala 384:28]
  el2_ifu_compress_ctl decompressed ( // @[el2_ifu_aln_ctl.scala 350:28]
    .io_din(decompressed_io_din),
    .io_dout(decompressed_io_dout)
  );
  assign io_ifu_i0_valid = _T_656 | _T_657; // @[el2_ifu_aln_ctl.scala 336:19]
  assign io_ifu_i0_icaf = _T_664 | _T_665; // @[el2_ifu_aln_ctl.scala 338:18]
  assign io_ifu_i0_icaf_type = _T_678 ? f1ictype : f0ictype; // @[el2_ifu_aln_ctl.scala 340:23]
  assign io_ifu_i0_icaf_f1 = _T_683 & _T_516; // @[el2_ifu_aln_ctl.scala 344:21]
  assign io_ifu_i0_dbecc = _T_689 | _T_690; // @[el2_ifu_aln_ctl.scala 346:19]
  assign io_ifu_i0_instr = _T_697[31:0]; // @[el2_ifu_aln_ctl.scala 352:19]
  assign io_ifu_i0_pc = {{1'd0}, f0pc}; // @[el2_ifu_aln_ctl.scala 324:16]
  assign io_ifu_i0_pc4 = aligndata[1:0] == 2'h3; // @[el2_ifu_aln_ctl.scala 328:17]
  assign io_ifu_fb_consume1 = _T_313 & _T_1; // @[el2_ifu_aln_ctl.scala 242:22]
  assign io_ifu_fb_consume2 = _T_316 & _T_1; // @[el2_ifu_aln_ctl.scala 243:22]
  assign io_ifu_i0_bp_index = _T_776[6:0]; // @[el2_ifu_aln_ctl.scala 384:22]
  assign io_ifu_i0_bp_fghr = i0_ends_f1 ? f1fghr : f0fghr; // @[el2_ifu_aln_ctl.scala 386:21]
  assign io_ifu_i0_bp_btag = _T_737 ? firstbrtag_hash : secondbrtag_hash; // @[el2_ifu_aln_ctl.scala 388:21]
  assign io_ifu_pmu_instr_aligned = io_dec_i0_decode_d & _T_784; // @[el2_ifu_aln_ctl.scala 394:28]
  assign io_ifu_i0_cinst = aligndata[15:0]; // @[el2_ifu_aln_ctl.scala 330:19]
  assign io_i0_brp_valid = _T_721 | _T_725; // @[el2_ifu_aln_ctl.scala 362:19]
  assign io_i0_brp_toffset = i0_ends_f1 ? f1poffset : f0poffset; // @[el2_ifu_aln_ctl.scala 374:21]
  assign io_i0_brp_hist = {_T_746,_T_751}; // @[el2_ifu_aln_ctl.scala 370:18]
  assign io_i0_brp_br_error = _T_768 | _T_771; // @[el2_ifu_aln_ctl.scala 382:22]
  assign io_i0_brp_br_start_error = _T_656 & alignbrend[0]; // @[el2_ifu_aln_ctl.scala 378:29]
  assign io_i0_brp_bank = _T_737 ? f0pc[1] : secondpc[1]; // @[el2_ifu_aln_ctl.scala 380:29]
  assign io_i0_brp_prett = i0_ends_f1 ? f1prett : f0prett; // @[el2_ifu_aln_ctl.scala 376:19]
  assign io_i0_brp_way = _T_737 ? alignway[0] : alignway[1]; // @[el2_ifu_aln_ctl.scala 368:17]
  assign io_i0_brp_ret = _T_728 | _T_730; // @[el2_ifu_aln_ctl.scala 364:17]
  assign decompressed_io_din = aligndata[15:0]; // @[el2_ifu_aln_ctl.scala 390:23]
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
  _T_14 = _RAND_18[54:0];
  _RAND_19 = {2{`RANDOM}};
  _T_16 = _RAND_19[54:0];
  _RAND_20 = {2{`RANDOM}};
  _T_18 = _RAND_20[54:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_active_clk) begin
    if (reset) begin
      error_stall <= 1'h0;
    end else begin
      error_stall <= error_stall_in;
    end
    if (reset) begin
      wrptr <= 2'h0;
    end else begin
      wrptr <= wrptr_in;
    end
    if (reset) begin
      rdptr <= 2'h0;
    end else begin
      rdptr <= rdptr_in;
    end
    if (reset) begin
      f2val <= 2'h0;
    end else begin
      f2val <= f2val_in;
    end
    if (reset) begin
      f1val <= 2'h0;
    end else begin
      f1val <= f1val_in;
    end
    if (reset) begin
      f0val <= 2'h0;
    end else begin
      f0val <= f0val_in;
    end
    if (reset) begin
      q2off <= 1'h0;
    end else begin
      q2off <= q2off_in;
    end
    if (reset) begin
      q1off <= 1'h0;
    end else begin
      q1off <= q1off_in;
    end
    if (reset) begin
      q0off <= 1'h0;
    end else begin
      q0off <= q0off_in;
    end
  end
  always @(posedge clock) begin
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
      f2pc <= 31'h0;
    end else if (fetch_to_f2) begin
      f2pc <= io_ifu_fetch_pc;
    end
    if (reset) begin
      f1pc <= 31'h0;
    end else if (f1_shift_wr_en) begin
      f1pc <= f1pc_in;
    end
    if (reset) begin
      f0pc <= 31'h0;
    end else if (f0_shift_wr_en) begin
      f0pc <= f0pc_in;
    end
    if (reset) begin
      brdata2 <= 12'h0;
    end else if (qwen[2]) begin
      brdata2 <= brdata_in;
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
      _T_14 <= 55'h0;
    end else if (qwen[2]) begin
      _T_14 <= misc_data_in;
    end
    if (reset) begin
      _T_16 <= 55'h0;
    end else if (qwen[1]) begin
      _T_16 <= misc_data_in;
    end
    if (reset) begin
      _T_18 <= 55'h0;
    end else if (qwen[0]) begin
      _T_18 <= misc_data_in;
    end
  end
endmodule
