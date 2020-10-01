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
  wire  out_30 = _T_16 | _T_30; // @[el2_ifu_compress_ctl.scala 16:53]
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
  wire  _T_92 = _T_79 | _T_91; // @[el2_ifu_compress_ctl.scala 20:46]
  wire  _T_102 = _T_12 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_103 = _T_102 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_104 = _T_92 | _T_103; // @[el2_ifu_compress_ctl.scala 20:80]
  wire  _T_114 = _T_12 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_115 = _T_114 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_14 = _T_104 | _T_115; // @[el2_ifu_compress_ctl.scala 20:113]
  wire  _T_128 = _T_12 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_129 = _T_128 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_130 = _T_129 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_142 = _T_128 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_143 = _T_142 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_144 = _T_130 | _T_143; // @[el2_ifu_compress_ctl.scala 22:50]
  wire  _T_147 = ~io_din[0]; // @[el2_ifu_compress_ctl.scala 22:101]
  wire  _T_148 = io_din[14] & _T_147; // @[el2_ifu_compress_ctl.scala 22:99]
  wire  out_13 = _T_144 | _T_148; // @[el2_ifu_compress_ctl.scala 22:86]
  wire  _T_161 = _T_102 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_162 = _T_161 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_175 = _T_162 | _T_79; // @[el2_ifu_compress_ctl.scala 24:47]
  wire  _T_188 = _T_175 | _T_91; // @[el2_ifu_compress_ctl.scala 24:81]
  wire  _T_190 = ~io_din[15]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_194 = _T_190 & _T_2; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_195 = _T_194 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_196 = _T_188 | _T_195; // @[el2_ifu_compress_ctl.scala 24:115]
  wire  _T_200 = io_din[15] & io_din[14]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_201 = _T_200 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_12 = _T_196 | _T_201; // @[el2_ifu_compress_ctl.scala 25:26]
  wire  _T_217 = _T_11 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_218 = _T_217 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_219 = _T_218 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_220 = _T_219 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_221 = _T_220 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_224 = _T_221 & _T_147; // @[el2_ifu_compress_ctl.scala 27:53]
  wire  _T_228 = _T_2 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_229 = _T_224 | _T_228; // @[el2_ifu_compress_ctl.scala 27:67]
  wire  _T_234 = _T_200 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_6 = _T_229 | _T_234; // @[el2_ifu_compress_ctl.scala 27:88]
  wire  _T_239 = io_din[15] & _T_147; // @[el2_ifu_compress_ctl.scala 29:24]
  wire  _T_243 = io_din[15] & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_244 = _T_243 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_245 = _T_239 | _T_244; // @[el2_ifu_compress_ctl.scala 29:39]
  wire  _T_249 = io_din[13] & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_250 = _T_245 | _T_249; // @[el2_ifu_compress_ctl.scala 29:63]
  wire  _T_253 = io_din[13] & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_254 = _T_250 | _T_253; // @[el2_ifu_compress_ctl.scala 29:83]
  wire  _T_257 = io_din[13] & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_258 = _T_254 | _T_257; // @[el2_ifu_compress_ctl.scala 29:102]
  wire  _T_261 = io_din[13] & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_262 = _T_258 | _T_261; // @[el2_ifu_compress_ctl.scala 30:22]
  wire  _T_265 = io_din[13] & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_266 = _T_262 | _T_265; // @[el2_ifu_compress_ctl.scala 30:42]
  wire  _T_271 = _T_266 | _T_228; // @[el2_ifu_compress_ctl.scala 30:62]
  wire  out_5 = _T_271 | _T_200; // @[el2_ifu_compress_ctl.scala 30:83]
  wire  _T_288 = _T_2 & _T_23; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_289 = _T_288 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_290 = _T_289 & _T_40; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_291 = _T_290 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_292 = _T_291 & _T_44; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_295 = _T_292 & _T_147; // @[el2_ifu_compress_ctl.scala 32:50]
  wire  _T_303 = _T_194 & _T_147; // @[el2_ifu_compress_ctl.scala 32:87]
  wire  _T_304 = _T_295 | _T_303; // @[el2_ifu_compress_ctl.scala 32:65]
  wire  _T_308 = _T_2 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_311 = _T_308 & _T_147; // @[el2_ifu_compress_ctl.scala 33:23]
  wire  _T_312 = _T_304 | _T_311; // @[el2_ifu_compress_ctl.scala 32:102]
  wire  _T_317 = _T_190 & io_din[14]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_318 = _T_317 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_319 = _T_312 | _T_318; // @[el2_ifu_compress_ctl.scala 33:38]
  wire  _T_323 = _T_2 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_326 = _T_323 & _T_147; // @[el2_ifu_compress_ctl.scala 33:82]
  wire  _T_327 = _T_319 | _T_326; // @[el2_ifu_compress_ctl.scala 33:62]
  wire  _T_331 = _T_2 & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_334 = _T_331 & _T_147; // @[el2_ifu_compress_ctl.scala 34:23]
  wire  _T_335 = _T_327 | _T_334; // @[el2_ifu_compress_ctl.scala 33:97]
  wire  _T_339 = _T_2 & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_342 = _T_339 & _T_147; // @[el2_ifu_compress_ctl.scala 34:58]
  wire  _T_343 = _T_335 | _T_342; // @[el2_ifu_compress_ctl.scala 34:38]
  wire  _T_347 = _T_2 & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_350 = _T_347 & _T_147; // @[el2_ifu_compress_ctl.scala 34:93]
  wire  _T_351 = _T_343 | _T_350; // @[el2_ifu_compress_ctl.scala 34:73]
  wire  _T_357 = _T_2 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_358 = _T_357 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  out_4 = _T_351 | _T_358; // @[el2_ifu_compress_ctl.scala 34:108]
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
  wire  _T_410 = _T_386 | _T_409; // @[el2_ifu_compress_ctl.scala 39:59]
  wire  _T_427 = _T_56 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_428 = _T_427 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_429 = _T_428 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_430 = _T_429 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_431 = _T_430 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_432 = _T_431 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_433 = _T_432 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_434 = _T_410 | _T_433; // @[el2_ifu_compress_ctl.scala 39:107]
  wire  _T_451 = _T_56 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_452 = _T_451 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_453 = _T_452 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_454 = _T_453 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_455 = _T_454 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_456 = _T_455 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_457 = _T_456 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_458 = _T_434 | _T_457; // @[el2_ifu_compress_ctl.scala 40:50]
  wire  _T_475 = _T_56 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_476 = _T_475 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_477 = _T_476 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_478 = _T_477 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_479 = _T_478 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_480 = _T_479 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_481 = _T_480 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_482 = _T_458 | _T_481; // @[el2_ifu_compress_ctl.scala 40:94]
  wire  _T_487 = ~io_din[12]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_499 = _T_11 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_500 = _T_499 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_501 = _T_500 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_502 = _T_501 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_503 = _T_502 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_504 = _T_503 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_507 = _T_504 & _T_147; // @[el2_ifu_compress_ctl.scala 41:94]
  wire  _T_508 = _T_482 | _T_507; // @[el2_ifu_compress_ctl.scala 41:49]
  wire  _T_514 = _T_190 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_515 = _T_514 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_516 = _T_508 | _T_515; // @[el2_ifu_compress_ctl.scala 41:109]
  wire  _T_522 = _T_514 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_523 = _T_516 | _T_522; // @[el2_ifu_compress_ctl.scala 42:26]
  wire  _T_529 = _T_514 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_530 = _T_523 | _T_529; // @[el2_ifu_compress_ctl.scala 42:48]
  wire  _T_536 = _T_514 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_537 = _T_530 | _T_536; // @[el2_ifu_compress_ctl.scala 42:70]
  wire  _T_543 = _T_514 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_544 = _T_537 | _T_543; // @[el2_ifu_compress_ctl.scala 42:93]
  wire  out_2 = _T_544 | _T_228; // @[el2_ifu_compress_ctl.scala 43:26]
  wire [4:0] rs2d = io_din[6:2]; // @[el2_ifu_compress_ctl.scala 49:20]
  wire [4:0] rdd = io_din[11:7]; // @[el2_ifu_compress_ctl.scala 50:19]
  wire [4:0] rdpd = {2'h1,io_din[9:7]}; // @[Cat.scala 29:58]
  wire [4:0] rs2pd = {2'h1,io_din[4:2]}; // @[Cat.scala 29:58]
  wire  _T_557 = _T_308 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_564 = _T_317 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_565 = _T_564 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_566 = _T_557 | _T_565; // @[el2_ifu_compress_ctl.scala 54:33]
  wire  _T_572 = _T_323 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_573 = _T_566 | _T_572; // @[el2_ifu_compress_ctl.scala 54:58]
  wire  _T_580 = _T_317 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_581 = _T_580 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_582 = _T_573 | _T_581; // @[el2_ifu_compress_ctl.scala 54:79]
  wire  _T_588 = _T_331 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_589 = _T_582 | _T_588; // @[el2_ifu_compress_ctl.scala 54:104]
  wire  _T_596 = _T_317 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_597 = _T_596 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_598 = _T_589 | _T_597; // @[el2_ifu_compress_ctl.scala 55:24]
  wire  _T_604 = _T_339 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_605 = _T_598 | _T_604; // @[el2_ifu_compress_ctl.scala 55:48]
  wire  _T_613 = _T_317 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_614 = _T_613 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_615 = _T_605 | _T_614; // @[el2_ifu_compress_ctl.scala 55:69]
  wire  _T_621 = _T_347 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_622 = _T_615 | _T_621; // @[el2_ifu_compress_ctl.scala 55:94]
  wire  _T_629 = _T_317 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_630 = _T_629 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_631 = _T_622 | _T_630; // @[el2_ifu_compress_ctl.scala 56:22]
  wire  _T_635 = _T_190 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_636 = _T_631 | _T_635; // @[el2_ifu_compress_ctl.scala 56:46]
  wire  _T_642 = _T_190 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_643 = _T_642 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rdrd = _T_636 | _T_643; // @[el2_ifu_compress_ctl.scala 56:65]
  wire  _T_651 = _T_380 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_659 = _T_403 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_660 = _T_651 | _T_659; // @[el2_ifu_compress_ctl.scala 58:38]
  wire  _T_668 = _T_427 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_669 = _T_660 | _T_668; // @[el2_ifu_compress_ctl.scala 58:63]
  wire  _T_677 = _T_451 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_678 = _T_669 | _T_677; // @[el2_ifu_compress_ctl.scala 58:87]
  wire  _T_686 = _T_475 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_687 = _T_678 | _T_686; // @[el2_ifu_compress_ctl.scala 59:27]
  wire  _T_703 = _T_2 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_704 = _T_703 & _T_7; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_705 = _T_704 & _T_9; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_706 = _T_705 & _T_50; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_707 = _T_706 & _T_52; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_708 = _T_707 & _T_54; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_709 = _T_708 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_710 = _T_687 | _T_709; // @[el2_ifu_compress_ctl.scala 59:51]
  wire  _T_717 = _T_56 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_718 = _T_717 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_719 = _T_710 | _T_718; // @[el2_ifu_compress_ctl.scala 59:89]
  wire  _T_726 = _T_56 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_727 = _T_726 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_728 = _T_719 | _T_727; // @[el2_ifu_compress_ctl.scala 60:27]
  wire  _T_735 = _T_56 & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_736 = _T_735 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_737 = _T_728 | _T_736; // @[el2_ifu_compress_ctl.scala 60:51]
  wire  _T_744 = _T_56 & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_745 = _T_744 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_746 = _T_737 | _T_745; // @[el2_ifu_compress_ctl.scala 60:75]
  wire  _T_753 = _T_56 & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_754 = _T_753 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_755 = _T_746 | _T_754; // @[el2_ifu_compress_ctl.scala 60:99]
  wire  _T_764 = _T_194 & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_765 = _T_764 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_766 = _T_755 | _T_765; // @[el2_ifu_compress_ctl.scala 61:27]
  wire  rdrs1 = _T_766 | _T_195; // @[el2_ifu_compress_ctl.scala 61:54]
  wire  _T_777 = io_din[15] & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_778 = _T_777 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_782 = io_din[15] & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_783 = _T_782 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_784 = _T_778 | _T_783; // @[el2_ifu_compress_ctl.scala 63:34]
  wire  _T_788 = io_din[15] & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_789 = _T_788 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_790 = _T_784 | _T_789; // @[el2_ifu_compress_ctl.scala 63:54]
  wire  _T_794 = io_din[15] & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_795 = _T_794 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_796 = _T_790 | _T_795; // @[el2_ifu_compress_ctl.scala 63:74]
  wire  _T_800 = io_din[15] & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_801 = _T_800 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_802 = _T_796 | _T_801; // @[el2_ifu_compress_ctl.scala 63:94]
  wire  _T_807 = _T_200 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rs2rs2 = _T_802 | _T_807; // @[el2_ifu_compress_ctl.scala 63:114]
  wire  rdprd = _T_12 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_820 = io_din[15] & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_821 = _T_820 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_827 = _T_821 | _T_234; // @[el2_ifu_compress_ctl.scala 67:36]
  wire  _T_830 = ~io_din[1]; // @[el2_ifu_compress_ctl.scala 12:83]
  wire  _T_831 = io_din[14] & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_834 = _T_831 & _T_147; // @[el2_ifu_compress_ctl.scala 67:76]
  wire  rdprs1 = _T_827 | _T_834; // @[el2_ifu_compress_ctl.scala 67:57]
  wire  _T_846 = _T_128 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_847 = _T_846 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_851 = io_din[15] & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_854 = _T_851 & _T_147; // @[el2_ifu_compress_ctl.scala 69:66]
  wire  rs2prs2 = _T_847 | _T_854; // @[el2_ifu_compress_ctl.scala 69:47]
  wire  _T_859 = _T_190 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rs2prd = _T_859 & _T_147; // @[el2_ifu_compress_ctl.scala 71:33]
  wire  _T_866 = _T_2 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  uimm9_2 = _T_866 & _T_147; // @[el2_ifu_compress_ctl.scala 73:34]
  wire  _T_875 = _T_317 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  ulwimm6_2 = _T_875 & _T_147; // @[el2_ifu_compress_ctl.scala 75:39]
  wire  ulwspimm7_2 = _T_317 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_897 = _T_317 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_898 = _T_897 & _T_23; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_899 = _T_898 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_900 = _T_899 & _T_40; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_901 = _T_900 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rdeq2 = _T_901 & _T_44; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1027 = _T_194 & io_din[13]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  rdeq1 = _T_482 | _T_1027; // @[el2_ifu_compress_ctl.scala 83:42]
  wire  _T_1050 = io_din[14] & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1051 = rdeq2 | _T_1050; // @[el2_ifu_compress_ctl.scala 85:53]
  wire  rs1eq2 = _T_1051 | uimm9_2; // @[el2_ifu_compress_ctl.scala 85:71]
  wire  _T_1092 = _T_357 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1093 = _T_1092 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1094 = _T_1093 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  simm5_0 = _T_1094 | _T_643; // @[el2_ifu_compress_ctl.scala 91:45]
  wire  _T_1112 = _T_897 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1121 = _T_897 & _T_42; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1122 = _T_1112 | _T_1121; // @[el2_ifu_compress_ctl.scala 95:44]
  wire  _T_1130 = _T_897 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1131 = _T_1122 | _T_1130; // @[el2_ifu_compress_ctl.scala 95:70]
  wire  _T_1139 = _T_897 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1140 = _T_1131 | _T_1139; // @[el2_ifu_compress_ctl.scala 95:95]
  wire  _T_1148 = _T_897 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  sluimm17_12 = _T_1140 | _T_1148; // @[el2_ifu_compress_ctl.scala 95:121]
  wire  uimm5_0 = _T_79 | _T_195; // @[el2_ifu_compress_ctl.scala 97:45]
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
  wire [4:0] l1_24 = _T_1219 | _T_1224; // @[el2_ifu_compress_ctl.scala 113:67]
  wire [14:0] _T_1232 = {out_14,out_13,out_12,l1_11,l1_6}; // @[Cat.scala 29:58]
  wire [31:0] l1 = {1'h0,out_30,2'h0,3'h0,l1_24,l1_19,_T_1232}; // @[Cat.scala 29:58]
  wire [5:0] simm5d = {io_din[12],rs2d}; // @[Cat.scala 29:58]
  wire [5:0] simm9d = {io_din[12],io_din[4:3],io_din[5],io_din[2],io_din[6]}; // @[Cat.scala 29:58]
  wire [8:0] sjald_12 = io_din[12] ? 9'h1ff : 9'h0; // @[Bitwise.scala 72:12]
  wire [19:0] sjald = {sjald_12,io_din[12],io_din[8],io_din[10:9],io_din[6],io_din[7],io_din[2],io_din[11],io_din[5:4],io_din[3]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1281 = io_din[12] ? 15'h7fff : 15'h0; // @[Bitwise.scala 72:12]
  wire [19:0] sluimmd = {_T_1281,rs2d}; // @[Cat.scala 29:58]
  wire [6:0] _T_1287 = simm5d[5] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_1289 = {_T_1287,simm5d[4:0]}; // @[Cat.scala 29:58]
  wire [11:0] _T_1292 = {2'h0,io_din[10:7],io_din[12:11],io_din[5],io_din[6],2'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_1296 = simm9d[5] ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_1299 = {_T_1296,simm9d[4:0],4'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1302 = {5'h0,io_din[5],io_din[12:10],io_din[6],2'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1305 = {4'h0,io_din[3:2],io_din[12],io_din[6:4],2'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_1307 = {6'h0,io_din[12],rs2d}; // @[Cat.scala 29:58]
  wire [11:0] _T_1313 = {sjald[19],sjald[9:0],sjald[10]}; // @[Cat.scala 29:58]
  wire [11:0] _T_1316 = simm5_0 ? _T_1289 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1317 = uimm9_2 ? _T_1292 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1318 = rdeq2 ? _T_1299 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1319 = ulwimm6_2 ? _T_1302 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1320 = ulwspimm7_2 ? _T_1305 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1321 = uimm5_0 ? _T_1307 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1322 = _T_228 ? _T_1313 : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1323 = sluimm17_12 ? sluimmd[19:8] : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1324 = _T_1316 | _T_1317; // @[Mux.scala 27:72]
  wire [11:0] _T_1325 = _T_1324 | _T_1318; // @[Mux.scala 27:72]
  wire [11:0] _T_1326 = _T_1325 | _T_1319; // @[Mux.scala 27:72]
  wire [11:0] _T_1327 = _T_1326 | _T_1320; // @[Mux.scala 27:72]
  wire [11:0] _T_1328 = _T_1327 | _T_1321; // @[Mux.scala 27:72]
  wire [11:0] _T_1329 = _T_1328 | _T_1322; // @[Mux.scala 27:72]
  wire [11:0] _T_1330 = _T_1329 | _T_1323; // @[Mux.scala 27:72]
  wire [11:0] l2_31 = l1[31:20] | _T_1330; // @[el2_ifu_compress_ctl.scala 132:25]
  wire [7:0] _T_1337 = _T_228 ? sjald[19:12] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_1338 = sluimm17_12 ? sluimmd[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_1339 = _T_1337 | _T_1338; // @[Mux.scala 27:72]
  wire [7:0] l2_19 = l1[19:12] | _T_1339; // @[el2_ifu_compress_ctl.scala 142:25]
  wire [31:0] l2 = {l2_31,l2_19,l1[11:0]}; // @[Cat.scala 29:58]
  wire [8:0] sbr8d = {io_din[12],io_din[6],io_din[5],io_din[2],io_din[11],io_din[10],io_din[4],io_din[3],1'h0}; // @[Cat.scala 29:58]
  wire [6:0] uswimm6d = {io_din[5],io_din[12:10],io_din[6],2'h0}; // @[Cat.scala 29:58]
  wire [7:0] uswspimm7d = {io_din[8:7],io_din[12:9],2'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_1370 = sbr8d[8] ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_1372 = {_T_1370,sbr8d[7:5]}; // @[Cat.scala 29:58]
  wire [6:0] _T_1375 = {5'h0,uswimm6d[6:5]}; // @[Cat.scala 29:58]
  wire [6:0] _T_1378 = {4'h0,uswspimm7d[7:5]}; // @[Cat.scala 29:58]
  wire [6:0] _T_1379 = _T_234 ? _T_1372 : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_1380 = _T_854 ? _T_1375 : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_1381 = _T_807 ? _T_1378 : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_1382 = _T_1379 | _T_1380; // @[Mux.scala 27:72]
  wire [6:0] _T_1383 = _T_1382 | _T_1381; // @[Mux.scala 27:72]
  wire [6:0] l3_31 = l2[31:25] | _T_1383; // @[el2_ifu_compress_ctl.scala 150:25]
  wire [12:0] l3_24 = l2[24:12]; // @[el2_ifu_compress_ctl.scala 153:17]
  wire [4:0] _T_1389 = {sbr8d[4:1],sbr8d[8]}; // @[Cat.scala 29:58]
  wire [4:0] _T_1394 = _T_234 ? _T_1389 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1395 = _T_854 ? uswimm6d[4:0] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1396 = _T_807 ? uswspimm7d[4:0] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1397 = _T_1394 | _T_1395; // @[Mux.scala 27:72]
  wire [4:0] _T_1398 = _T_1397 | _T_1396; // @[Mux.scala 27:72]
  wire [4:0] l3_11 = l2[11:7] | _T_1398; // @[el2_ifu_compress_ctl.scala 155:24]
  wire [31:0] l3 = {l3_31,l3_24,l3_11,l2[6:0]}; // @[Cat.scala 29:58]
  wire  _T_1409 = _T_4 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1410 = _T_1409 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1411 = _T_1410 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1414 = _T_1411 & _T_147; // @[el2_ifu_compress_ctl.scala 161:39]
  wire  _T_1422 = _T_1409 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1423 = _T_1422 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1426 = _T_1423 & _T_147; // @[el2_ifu_compress_ctl.scala 161:79]
  wire  _T_1427 = _T_1414 | _T_1426; // @[el2_ifu_compress_ctl.scala 161:54]
  wire  _T_1436 = _T_642 & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1437 = _T_1436 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1438 = _T_1427 | _T_1437; // @[el2_ifu_compress_ctl.scala 161:94]
  wire  _T_1446 = _T_1409 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1447 = _T_1446 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1450 = _T_1447 & _T_147; // @[el2_ifu_compress_ctl.scala 162:55]
  wire  _T_1451 = _T_1438 | _T_1450; // @[el2_ifu_compress_ctl.scala 162:30]
  wire  _T_1459 = _T_1409 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1460 = _T_1459 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1463 = _T_1460 & _T_147; // @[el2_ifu_compress_ctl.scala 162:96]
  wire  _T_1464 = _T_1451 | _T_1463; // @[el2_ifu_compress_ctl.scala 162:70]
  wire  _T_1473 = _T_642 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1474 = _T_1473 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1475 = _T_1464 | _T_1474; // @[el2_ifu_compress_ctl.scala 162:111]
  wire  _T_1482 = io_din[15] & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1483 = _T_1482 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1484 = _T_1483 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1485 = _T_1475 | _T_1484; // @[el2_ifu_compress_ctl.scala 163:29]
  wire  _T_1493 = _T_1409 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1494 = _T_1493 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1497 = _T_1494 & _T_147; // @[el2_ifu_compress_ctl.scala 163:79]
  wire  _T_1498 = _T_1485 | _T_1497; // @[el2_ifu_compress_ctl.scala 163:54]
  wire  _T_1505 = _T_487 & io_din[6]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1506 = _T_1505 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1507 = _T_1506 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1508 = _T_1498 | _T_1507; // @[el2_ifu_compress_ctl.scala 163:94]
  wire  _T_1517 = _T_642 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1518 = _T_1517 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1519 = _T_1508 | _T_1518; // @[el2_ifu_compress_ctl.scala 163:118]
  wire  _T_1527 = _T_1409 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1528 = _T_1527 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1531 = _T_1528 & _T_147; // @[el2_ifu_compress_ctl.scala 164:28]
  wire  _T_1532 = _T_1519 | _T_1531; // @[el2_ifu_compress_ctl.scala 163:144]
  wire  _T_1539 = _T_487 & io_din[5]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1540 = _T_1539 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1541 = _T_1540 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1542 = _T_1532 | _T_1541; // @[el2_ifu_compress_ctl.scala 164:43]
  wire  _T_1551 = _T_642 & io_din[10]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1552 = _T_1551 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1553 = _T_1542 | _T_1552; // @[el2_ifu_compress_ctl.scala 164:67]
  wire  _T_1561 = _T_1409 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1562 = _T_1561 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1565 = _T_1562 & _T_147; // @[el2_ifu_compress_ctl.scala 165:28]
  wire  _T_1566 = _T_1553 | _T_1565; // @[el2_ifu_compress_ctl.scala 164:94]
  wire  _T_1574 = io_din[12] & io_din[11]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1575 = _T_1574 & _T_38; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1576 = _T_1575 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1577 = _T_1576 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1578 = _T_1566 | _T_1577; // @[el2_ifu_compress_ctl.scala 165:43]
  wire  _T_1587 = _T_642 & io_din[9]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1588 = _T_1587 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1589 = _T_1578 | _T_1588; // @[el2_ifu_compress_ctl.scala 165:71]
  wire  _T_1597 = _T_1409 & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1598 = _T_1597 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1601 = _T_1598 & _T_147; // @[el2_ifu_compress_ctl.scala 166:28]
  wire  _T_1602 = _T_1589 | _T_1601; // @[el2_ifu_compress_ctl.scala 165:97]
  wire  _T_1608 = io_din[13] & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1609 = _T_1608 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1610 = _T_1609 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1611 = _T_1602 | _T_1610; // @[el2_ifu_compress_ctl.scala 166:43]
  wire  _T_1620 = _T_642 & io_din[8]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1621 = _T_1620 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1622 = _T_1611 | _T_1621; // @[el2_ifu_compress_ctl.scala 166:67]
  wire  _T_1630 = _T_1409 & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1631 = _T_1630 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1634 = _T_1631 & _T_147; // @[el2_ifu_compress_ctl.scala 167:28]
  wire  _T_1635 = _T_1622 | _T_1634; // @[el2_ifu_compress_ctl.scala 166:93]
  wire  _T_1641 = io_din[13] & io_din[4]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1642 = _T_1641 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1643 = _T_1642 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1644 = _T_1635 | _T_1643; // @[el2_ifu_compress_ctl.scala 167:43]
  wire  _T_1652 = _T_1409 & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1653 = _T_1652 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1656 = _T_1653 & _T_147; // @[el2_ifu_compress_ctl.scala 167:91]
  wire  _T_1657 = _T_1644 | _T_1656; // @[el2_ifu_compress_ctl.scala 167:66]
  wire  _T_1666 = _T_642 & io_din[7]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1667 = _T_1666 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1668 = _T_1657 | _T_1667; // @[el2_ifu_compress_ctl.scala 167:106]
  wire  _T_1674 = io_din[13] & io_din[3]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1675 = _T_1674 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1676 = _T_1675 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1677 = _T_1668 | _T_1676; // @[el2_ifu_compress_ctl.scala 168:29]
  wire  _T_1683 = io_din[13] & io_din[2]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1684 = _T_1683 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1685 = _T_1684 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1686 = _T_1677 | _T_1685; // @[el2_ifu_compress_ctl.scala 168:52]
  wire  _T_1692 = io_din[14] & _T_4; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1693 = _T_1692 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1694 = _T_1686 | _T_1693; // @[el2_ifu_compress_ctl.scala 168:75]
  wire  _T_1703 = _T_703 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1704 = _T_1703 & io_din[0]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1705 = _T_1694 | _T_1704; // @[el2_ifu_compress_ctl.scala 168:98]
  wire  _T_1712 = _T_820 & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1713 = _T_1712 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1716 = _T_1713 & _T_147; // @[el2_ifu_compress_ctl.scala 169:54]
  wire  _T_1717 = _T_1705 | _T_1716; // @[el2_ifu_compress_ctl.scala 169:29]
  wire  _T_1726 = _T_642 & _T_487; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1727 = _T_1726 & io_din[1]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1730 = _T_1727 & _T_147; // @[el2_ifu_compress_ctl.scala 169:96]
  wire  _T_1731 = _T_1717 | _T_1730; // @[el2_ifu_compress_ctl.scala 169:69]
  wire  _T_1740 = _T_642 & io_din[12]; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1741 = _T_1740 & _T_830; // @[el2_ifu_compress_ctl.scala 12:110]
  wire  _T_1742 = _T_1731 | _T_1741; // @[el2_ifu_compress_ctl.scala 169:111]
  wire  _T_1749 = _T_1692 & _T_147; // @[el2_ifu_compress_ctl.scala 170:50]
  wire  legal = _T_1742 | _T_1749; // @[el2_ifu_compress_ctl.scala 170:30]
  wire [31:0] _T_1751 = legal ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  assign io_dout = l3 & _T_1751; // @[el2_ifu_compress_ctl.scala 172:10]
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
  wire [15:0] decompressed_io_din; // @[el2_ifu_aln_ctl.scala 99:28]
  wire [31:0] decompressed_io_dout; // @[el2_ifu_aln_ctl.scala 99:28]
  reg  error_stall; // @[el2_ifu_aln_ctl.scala 89:54]
  reg [1:0] f0val; // @[el2_ifu_aln_ctl.scala 90:48]
  wire  _T = error_stall | io_ifu_async_error_start; // @[el2_ifu_aln_ctl.scala 91:34]
  wire  _T_1 = ~io_exu_flush_final; // @[el2_ifu_aln_ctl.scala 91:64]
  wire  error_stall_in = _T & _T_1; // @[el2_ifu_aln_ctl.scala 91:62]
  wire  _T_3 = ~error_stall; // @[el2_ifu_aln_ctl.scala 93:39]
  wire  i0_shift = io_dec_i0_decode_d & _T_3; // @[el2_ifu_aln_ctl.scala 93:37]
  wire  _T_7 = ~f0val[1]; // @[el2_ifu_aln_ctl.scala 97:58]
  wire  _T_9 = _T_7 & f0val[0]; // @[el2_ifu_aln_ctl.scala 97:68]
  reg [1:0] rdptr; // @[el2_ifu_aln_ctl.scala 124:48]
  wire  _T_252 = rdptr == 2'h0; // @[el2_ifu_aln_ctl.scala 178:32]
  reg  q1off; // @[el2_ifu_aln_ctl.scala 131:48]
  wire  _T_255 = _T_252 & q1off; // @[Mux.scala 27:72]
  wire  _T_253 = rdptr == 2'h1; // @[el2_ifu_aln_ctl.scala 178:57]
  reg  q2off; // @[el2_ifu_aln_ctl.scala 130:48]
  wire  _T_256 = _T_253 & q2off; // @[Mux.scala 27:72]
  wire  _T_258 = _T_255 | _T_256; // @[Mux.scala 27:72]
  wire  _T_254 = rdptr == 2'h2; // @[el2_ifu_aln_ctl.scala 178:83]
  reg  q0off; // @[el2_ifu_aln_ctl.scala 132:48]
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
  reg [1:0] f1val; // @[el2_ifu_aln_ctl.scala 127:48]
  wire [1:0] _T_538 = {f1val[0],1'h1}; // @[Cat.scala 29:58]
  wire [1:0] _T_540 = _T_9 ? _T_538 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignval = _T_539 | _T_540; // @[Mux.scala 27:72]
  wire  f0_shift_2B = i0_shift & f0val[0]; // @[Mux.scala 27:72]
  reg [1:0] wrptr; // @[el2_ifu_aln_ctl.scala 123:48]
  reg [1:0] f2val; // @[el2_ifu_aln_ctl.scala 126:48]
  wire  _T_58 = ~f1val[0]; // @[el2_ifu_aln_ctl.scala 134:42]
  wire  f2_valid = f2val[0]; // @[el2_ifu_aln_ctl.scala 246:20]
  wire  _T_60 = ~f2_valid; // @[el2_ifu_aln_ctl.scala 134:55]
  wire  ifvalid = io_ifu_fetch_val[0]; // @[el2_ifu_aln_ctl.scala 256:30]
  wire  _T_65 = _T_58 & f2_valid; // @[el2_ifu_aln_ctl.scala 135:53]
  wire  _T_66 = _T_65 & ifvalid; // @[el2_ifu_aln_ctl.scala 135:65]
  wire  _T_70 = f1val[0] & _T_60; // @[el2_ifu_aln_ctl.scala 136:53]
  wire  _T_71 = _T_70 & ifvalid; // @[el2_ifu_aln_ctl.scala 136:65]
  wire  fetch_to_f1 = _T_66 | _T_71; // @[el2_ifu_aln_ctl.scala 135:77]
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
  el2_ifu_compress_ctl decompressed ( // @[el2_ifu_aln_ctl.scala 99:28]
    .io_din(decompressed_io_din),
    .io_dout(decompressed_io_dout)
  );
  assign io_ifu_i0_valid = alignval[0]; // @[el2_ifu_aln_ctl.scala 115:19]
  assign io_ifu_i0_icaf = alignicaf[0]; // @[el2_ifu_aln_ctl.scala 114:18]
  assign io_ifu_i0_icaf_type = misc0eff[52:51]; // @[el2_ifu_aln_ctl.scala 324:23]
  assign io_ifu_i0_icaf_f1 = 1'h0; // @[el2_ifu_aln_ctl.scala 328:21]
  assign io_ifu_i0_dbecc = aligndbecc[0]; // @[el2_ifu_aln_ctl.scala 330:19]
  assign io_ifu_i0_instr = decompressed_io_dout; // @[el2_ifu_aln_ctl.scala 103:20]
  assign io_ifu_i0_pc = 32'h0; // @[el2_ifu_aln_ctl.scala 320:16]
  assign io_ifu_i0_pc4 = 1'h0; // @[el2_ifu_aln_ctl.scala 116:17]
  assign io_ifu_fb_consume1 = _T_383 & _T_1; // @[el2_ifu_aln_ctl.scala 253:22]
  assign io_ifu_fb_consume2 = _T_386 & _T_1; // @[el2_ifu_aln_ctl.scala 254:22]
  assign io_ifu_i0_bp_index = 7'h0; // @[el2_ifu_aln_ctl.scala 361:22]
  assign io_ifu_i0_bp_fghr = misc0eff[7:0]; // @[el2_ifu_aln_ctl.scala 363:21]
  assign io_ifu_i0_bp_btag = 5'h0; // @[el2_ifu_aln_ctl.scala 365:21]
  assign io_ifu_pmu_instr_aligned = io_dec_i0_decode_d & _T_3; // @[el2_ifu_aln_ctl.scala 95:28]
  assign io_ifu_i0_cinst = aligndata[15:0]; // @[el2_ifu_aln_ctl.scala 106:19]
  assign io_i0_brp_valid = alignbrend[0]; // @[el2_ifu_aln_ctl.scala 340:19]
  assign io_i0_brp_toffset = misc0eff[19:8]; // @[el2_ifu_aln_ctl.scala 348:21]
  assign io_i0_brp_hist = {alignhist1[0],alignhist0[0]}; // @[el2_ifu_aln_ctl.scala 345:18]
  assign io_i0_brp_br_error = io_i0_brp_valid & i0_brp_pc4; // @[el2_ifu_aln_ctl.scala 358:22]
  assign io_i0_brp_br_start_error = 1'h0; // @[el2_ifu_aln_ctl.scala 352:29]
  assign io_i0_brp_bank = 1'h0; // @[el2_ifu_aln_ctl.scala 354:29]
  assign io_i0_brp_prett = {{1'd0}, f0prett}; // @[el2_ifu_aln_ctl.scala 350:19]
  assign io_i0_brp_way = alignway[0]; // @[el2_ifu_aln_ctl.scala 344:17]
  assign io_i0_brp_ret = alignret[0]; // @[el2_ifu_aln_ctl.scala 342:17]
  assign decompressed_io_din = aligndata[15:0]; // @[el2_ifu_aln_ctl.scala 101:23]
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
  always @(posedge io_active_clk) begin
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
