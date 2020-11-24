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
module el2_dec_dec_ctl(
  input  [31:0] io_ins,
  output        io_out_alu,
  output        io_out_rs1,
  output        io_out_rs2,
  output        io_out_imm12,
  output        io_out_rd,
  output        io_out_shimm5,
  output        io_out_imm20,
  output        io_out_pc,
  output        io_out_load,
  output        io_out_store,
  output        io_out_lsu,
  output        io_out_add,
  output        io_out_sub,
  output        io_out_land,
  output        io_out_lor,
  output        io_out_lxor,
  output        io_out_sll,
  output        io_out_sra,
  output        io_out_srl,
  output        io_out_slt,
  output        io_out_unsign,
  output        io_out_condbr,
  output        io_out_beq,
  output        io_out_bne,
  output        io_out_bge,
  output        io_out_blt,
  output        io_out_jal,
  output        io_out_by,
  output        io_out_half,
  output        io_out_word,
  output        io_out_csr_read,
  output        io_out_csr_clr,
  output        io_out_csr_set,
  output        io_out_csr_write,
  output        io_out_csr_imm,
  output        io_out_presync,
  output        io_out_postsync,
  output        io_out_ebreak,
  output        io_out_ecall,
  output        io_out_mret,
  output        io_out_mul,
  output        io_out_rs1_sign,
  output        io_out_rs2_sign,
  output        io_out_low,
  output        io_out_div,
  output        io_out_rem,
  output        io_out_fence,
  output        io_out_fence_i,
  output        io_out_pm_alu,
  output        io_out_legal
);
  wire  _T_2 = io_ins[2] | io_ins[6]; // @[el2_dec_dec_ctl.scala 72:27]
  wire  _T_4 = ~io_ins[25]; // @[el2_dec_dec_ctl.scala 72:42]
  wire  _T_6 = _T_4 & io_ins[4]; // @[el2_dec_dec_ctl.scala 72:53]
  wire  _T_7 = _T_2 | _T_6; // @[el2_dec_dec_ctl.scala 72:39]
  wire  _T_9 = ~io_ins[5]; // @[el2_dec_dec_ctl.scala 72:68]
  wire  _T_11 = _T_9 & io_ins[4]; // @[el2_dec_dec_ctl.scala 72:78]
  wire  _T_14 = ~io_ins[14]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_16 = ~io_ins[13]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_18 = ~io_ins[2]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_19 = _T_14 & _T_16; // @[el2_dec_dec_ctl.scala 73:51]
  wire  _T_20 = _T_19 & _T_18; // @[el2_dec_dec_ctl.scala 73:51]
  wire  _T_26 = _T_16 & io_ins[11]; // @[el2_dec_dec_ctl.scala 73:90]
  wire  _T_27 = _T_26 & _T_18; // @[el2_dec_dec_ctl.scala 73:90]
  wire  _T_28 = _T_20 | _T_27; // @[el2_dec_dec_ctl.scala 73:55]
  wire  _T_33 = io_ins[19] & io_ins[13]; // @[el2_dec_dec_ctl.scala 74:37]
  wire  _T_34 = _T_33 & _T_18; // @[el2_dec_dec_ctl.scala 74:37]
  wire  _T_35 = _T_28 | _T_34; // @[el2_dec_dec_ctl.scala 73:94]
  wire  _T_41 = _T_16 & io_ins[10]; // @[el2_dec_dec_ctl.scala 74:76]
  wire  _T_42 = _T_41 & _T_18; // @[el2_dec_dec_ctl.scala 74:76]
  wire  _T_43 = _T_35 | _T_42; // @[el2_dec_dec_ctl.scala 74:41]
  wire  _T_45 = ~io_ins[18]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_49 = _T_45 & io_ins[13]; // @[el2_dec_dec_ctl.scala 75:38]
  wire  _T_50 = _T_49 & _T_18; // @[el2_dec_dec_ctl.scala 75:38]
  wire  _T_51 = _T_43 | _T_50; // @[el2_dec_dec_ctl.scala 74:80]
  wire  _T_57 = _T_16 & io_ins[9]; // @[el2_dec_dec_ctl.scala 75:76]
  wire  _T_58 = _T_57 & _T_18; // @[el2_dec_dec_ctl.scala 75:76]
  wire  _T_59 = _T_51 | _T_58; // @[el2_dec_dec_ctl.scala 75:42]
  wire  _T_64 = io_ins[17] & io_ins[13]; // @[el2_dec_dec_ctl.scala 76:37]
  wire  _T_65 = _T_64 & _T_18; // @[el2_dec_dec_ctl.scala 76:37]
  wire  _T_66 = _T_59 | _T_65; // @[el2_dec_dec_ctl.scala 75:80]
  wire  _T_72 = _T_16 & io_ins[8]; // @[el2_dec_dec_ctl.scala 76:75]
  wire  _T_73 = _T_72 & _T_18; // @[el2_dec_dec_ctl.scala 76:75]
  wire  _T_74 = _T_66 | _T_73; // @[el2_dec_dec_ctl.scala 76:41]
  wire  _T_79 = io_ins[16] & io_ins[13]; // @[el2_dec_dec_ctl.scala 77:37]
  wire  _T_80 = _T_79 & _T_18; // @[el2_dec_dec_ctl.scala 77:37]
  wire  _T_81 = _T_74 | _T_80; // @[el2_dec_dec_ctl.scala 76:79]
  wire  _T_87 = _T_16 & io_ins[7]; // @[el2_dec_dec_ctl.scala 77:75]
  wire  _T_88 = _T_87 & _T_18; // @[el2_dec_dec_ctl.scala 77:75]
  wire  _T_89 = _T_81 | _T_88; // @[el2_dec_dec_ctl.scala 77:41]
  wire  _T_94 = io_ins[15] & io_ins[13]; // @[el2_dec_dec_ctl.scala 78:37]
  wire  _T_95 = _T_94 & _T_18; // @[el2_dec_dec_ctl.scala 78:37]
  wire  _T_96 = _T_89 | _T_95; // @[el2_dec_dec_ctl.scala 77:79]
  wire  _T_98 = ~io_ins[4]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_100 = ~io_ins[3]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_101 = _T_98 & _T_100; // @[el2_dec_dec_ctl.scala 78:71]
  wire  _T_102 = _T_96 | _T_101; // @[el2_dec_dec_ctl.scala 78:41]
  wire  _T_104 = ~io_ins[6]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_107 = _T_104 & _T_18; // @[el2_dec_dec_ctl.scala 78:106]
  wire  _T_114 = io_ins[5] & _T_98; // @[el2_dec_dec_ctl.scala 79:48]
  wire  _T_115 = _T_114 & _T_18; // @[el2_dec_dec_ctl.scala 79:48]
  wire  _T_121 = _T_104 & io_ins[5]; // @[el2_dec_dec_ctl.scala 79:85]
  wire  _T_122 = _T_121 & _T_18; // @[el2_dec_dec_ctl.scala 79:85]
  wire  _T_130 = _T_101 & io_ins[2]; // @[el2_dec_dec_ctl.scala 80:50]
  wire  _T_137 = io_ins[13] & _T_9; // @[el2_dec_dec_ctl.scala 80:90]
  wire  _T_138 = _T_137 & io_ins[4]; // @[el2_dec_dec_ctl.scala 80:90]
  wire  _T_139 = _T_138 & _T_18; // @[el2_dec_dec_ctl.scala 80:90]
  wire  _T_140 = _T_130 | _T_139; // @[el2_dec_dec_ctl.scala 80:54]
  wire  _T_144 = ~io_ins[12]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_147 = _T_16 & _T_144; // @[el2_dec_dec_ctl.scala 81:40]
  wire  _T_148 = _T_147 & io_ins[6]; // @[el2_dec_dec_ctl.scala 81:40]
  wire  _T_149 = _T_148 & io_ins[4]; // @[el2_dec_dec_ctl.scala 81:40]
  wire  _T_150 = _T_140 | _T_149; // @[el2_dec_dec_ctl.scala 80:94]
  wire  _T_158 = _T_144 & _T_9; // @[el2_dec_dec_ctl.scala 81:81]
  wire  _T_159 = _T_158 & io_ins[4]; // @[el2_dec_dec_ctl.scala 81:81]
  wire  _T_160 = _T_159 & _T_18; // @[el2_dec_dec_ctl.scala 81:81]
  wire  _T_166 = _T_9 & _T_18; // @[el2_dec_dec_ctl.scala 82:28]
  wire  _T_169 = io_ins[5] & io_ins[2]; // @[el2_dec_dec_ctl.scala 82:55]
  wire  _T_170 = _T_166 | _T_169; // @[el2_dec_dec_ctl.scala 82:42]
  wire  _T_181 = _T_16 & io_ins[12]; // @[el2_dec_dec_ctl.scala 83:58]
  wire  _T_182 = _T_181 & _T_9; // @[el2_dec_dec_ctl.scala 83:58]
  wire  _T_183 = _T_182 & io_ins[4]; // @[el2_dec_dec_ctl.scala 83:58]
  wire  _T_187 = io_ins[5] & io_ins[3]; // @[el2_dec_dec_ctl.scala 84:29]
  wire  _T_190 = io_ins[4] & io_ins[2]; // @[el2_dec_dec_ctl.scala 84:53]
  wire  _T_196 = _T_9 & _T_100; // @[el2_dec_dec_ctl.scala 85:28]
  wire  _T_198 = _T_196 & io_ins[2]; // @[el2_dec_dec_ctl.scala 85:41]
  wire  _T_209 = _T_9 & _T_98; // @[el2_dec_dec_ctl.scala 86:50]
  wire  _T_224 = _T_104 & _T_98; // @[el2_dec_dec_ctl.scala 88:49]
  wire  _T_236 = _T_19 & _T_144; // @[el2_dec_dec_ctl.scala 89:57]
  wire  _T_237 = _T_236 & _T_9; // @[el2_dec_dec_ctl.scala 89:57]
  wire  _T_238 = _T_237 & io_ins[4]; // @[el2_dec_dec_ctl.scala 89:57]
  wire  _T_246 = _T_238 | _T_198; // @[el2_dec_dec_ctl.scala 89:61]
  wire  _T_248 = ~io_ins[30]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_262 = _T_248 & _T_4; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_263 = _T_262 & _T_14; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_264 = _T_263 & _T_16; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_265 = _T_264 & _T_144; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_266 = _T_265 & _T_104; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_267 = _T_266 & io_ins[4]; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_268 = _T_267 & _T_18; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_279 = io_ins[30] & _T_144; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_280 = _T_279 & _T_104; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_281 = _T_280 & io_ins[5]; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_282 = _T_281 & io_ins[4]; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_283 = _T_282 & _T_18; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_294 = _T_4 & _T_14; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_295 = _T_294 & io_ins[13]; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_296 = _T_295 & _T_104; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_297 = _T_296 & io_ins[4]; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_298 = _T_297 & _T_18; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_299 = _T_283 | _T_298; // @[el2_dec_dec_ctl.scala 91:61]
  wire  _T_308 = _T_14 & io_ins[13]; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_309 = _T_308 & _T_9; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_310 = _T_309 & io_ins[4]; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_311 = _T_310 & _T_18; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_312 = _T_299 | _T_311; // @[el2_dec_dec_ctl.scala 91:109]
  wire  _T_318 = io_ins[6] & _T_98; // @[el2_dec_dec_ctl.scala 92:80]
  wire  _T_319 = _T_318 & _T_18; // @[el2_dec_dec_ctl.scala 92:80]
  wire  _T_328 = io_ins[14] & io_ins[13]; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_329 = _T_328 & io_ins[12]; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_330 = _T_329 & _T_9; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_331 = _T_330 & _T_18; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_341 = _T_4 & io_ins[14]; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_342 = _T_341 & io_ins[13]; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_343 = _T_342 & io_ins[12]; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_344 = _T_343 & _T_104; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_345 = _T_344 & _T_18; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_350 = _T_104 & io_ins[3]; // @[el2_dec_dec_ctl.scala 94:45]
  wire  _T_363 = _T_342 & _T_144; // @[el2_dec_dec_ctl.scala 94:94]
  wire  _T_364 = _T_363 & _T_104; // @[el2_dec_dec_ctl.scala 94:94]
  wire  _T_365 = _T_364 & _T_18; // @[el2_dec_dec_ctl.scala 94:94]
  wire  _T_366 = _T_350 | _T_365; // @[el2_dec_dec_ctl.scala 94:49]
  wire  _T_370 = io_ins[5] & io_ins[4]; // @[el2_dec_dec_ctl.scala 95:34]
  wire  _T_371 = _T_370 & io_ins[2]; // @[el2_dec_dec_ctl.scala 95:34]
  wire  _T_372 = _T_366 | _T_371; // @[el2_dec_dec_ctl.scala 94:98]
  wire  _T_382 = _T_372 | _T_149; // @[el2_dec_dec_ctl.scala 95:38]
  wire  _T_392 = _T_328 & _T_144; // @[el2_dec_dec_ctl.scala 96:44]
  wire  _T_393 = _T_392 & _T_9; // @[el2_dec_dec_ctl.scala 96:44]
  wire  _T_394 = _T_393 & _T_18; // @[el2_dec_dec_ctl.scala 96:44]
  wire  _T_407 = _T_341 & _T_16; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_408 = _T_407 & _T_144; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_409 = _T_408 & io_ins[4]; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_410 = _T_409 & _T_18; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_421 = io_ins[14] & _T_16; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_422 = _T_421 & _T_144; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_423 = _T_422 & _T_9; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_424 = _T_423 & io_ins[4]; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_425 = _T_424 & _T_18; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_440 = _T_294 & _T_16; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_441 = _T_440 & io_ins[12]; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_442 = _T_441 & _T_104; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_443 = _T_442 & io_ins[4]; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_454 = io_ins[30] & _T_16; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_455 = _T_454 & io_ins[12]; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_456 = _T_455 & _T_104; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_457 = _T_456 & io_ins[4]; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_473 = _T_262 & io_ins[14]; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_474 = _T_473 & _T_16; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_475 = _T_474 & io_ins[12]; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_476 = _T_475 & _T_104; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_477 = _T_476 & io_ins[4]; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_492 = _T_295 & io_ins[12]; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_493 = _T_492 & _T_104; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_494 = _T_493 & io_ins[4]; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_495 = _T_494 & _T_18; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_518 = _T_308 & io_ins[12]; // @[el2_dec_dec_ctl.scala 102:59]
  wire  _T_519 = _T_518 & _T_9; // @[el2_dec_dec_ctl.scala 102:59]
  wire  _T_520 = _T_519 & _T_18; // @[el2_dec_dec_ctl.scala 102:59]
  wire  _T_527 = io_ins[13] & io_ins[6]; // @[el2_dec_dec_ctl.scala 102:99]
  wire  _T_528 = _T_527 & _T_98; // @[el2_dec_dec_ctl.scala 102:99]
  wire  _T_529 = _T_528 & _T_18; // @[el2_dec_dec_ctl.scala 102:99]
  wire  _T_530 = _T_520 | _T_529; // @[el2_dec_dec_ctl.scala 102:63]
  wire  _T_536 = io_ins[14] & _T_9; // @[el2_dec_dec_ctl.scala 103:37]
  wire  _T_537 = _T_536 & _T_98; // @[el2_dec_dec_ctl.scala 103:37]
  wire  _T_538 = _T_530 | _T_537; // @[el2_dec_dec_ctl.scala 102:103]
  wire  _T_553 = _T_493 & _T_18; // @[el2_dec_dec_ctl.scala 103:86]
  wire  _T_554 = _T_538 | _T_553; // @[el2_dec_dec_ctl.scala 103:41]
  wire  _T_563 = io_ins[25] & io_ins[14]; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_564 = _T_563 & io_ins[12]; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_565 = _T_564 & _T_104; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_566 = _T_565 & io_ins[5]; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_567 = _T_566 & _T_18; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_585 = _T_14 & _T_144; // @[el2_dec_dec_ctl.scala 106:56]
  wire  _T_586 = _T_585 & io_ins[6]; // @[el2_dec_dec_ctl.scala 106:56]
  wire  _T_587 = _T_586 & _T_98; // @[el2_dec_dec_ctl.scala 106:56]
  wire  _T_597 = _T_14 & io_ins[12]; // @[el2_dec_dec_ctl.scala 107:55]
  wire  _T_598 = _T_597 & io_ins[6]; // @[el2_dec_dec_ctl.scala 107:55]
  wire  _T_599 = _T_598 & _T_98; // @[el2_dec_dec_ctl.scala 107:55]
  wire  _T_608 = io_ins[14] & io_ins[12]; // @[el2_dec_dec_ctl.scala 108:54]
  wire  _T_609 = _T_608 & io_ins[5]; // @[el2_dec_dec_ctl.scala 108:54]
  wire  _T_610 = _T_609 & _T_98; // @[el2_dec_dec_ctl.scala 108:54]
  wire  _T_620 = io_ins[14] & _T_144; // @[el2_dec_dec_ctl.scala 109:55]
  wire  _T_621 = _T_620 & io_ins[5]; // @[el2_dec_dec_ctl.scala 109:55]
  wire  _T_622 = _T_621 & _T_98; // @[el2_dec_dec_ctl.scala 109:55]
  wire  _T_638 = _T_147 & _T_104; // @[el2_dec_dec_ctl.scala 111:56]
  wire  _T_639 = _T_638 & _T_98; // @[el2_dec_dec_ctl.scala 111:56]
  wire  _T_648 = io_ins[12] & _T_104; // @[el2_dec_dec_ctl.scala 112:53]
  wire  _T_649 = _T_648 & _T_98; // @[el2_dec_dec_ctl.scala 112:53]
  wire  _T_656 = io_ins[13] & _T_104; // @[el2_dec_dec_ctl.scala 113:50]
  wire  _T_662 = _T_527 & io_ins[4]; // @[el2_dec_dec_ctl.scala 114:52]
  wire  _T_666 = io_ins[7] & io_ins[6]; // @[el2_dec_dec_ctl.scala 114:87]
  wire  _T_667 = _T_666 & io_ins[4]; // @[el2_dec_dec_ctl.scala 114:87]
  wire  _T_668 = _T_662 | _T_667; // @[el2_dec_dec_ctl.scala 114:56]
  wire  _T_672 = io_ins[8] & io_ins[6]; // @[el2_dec_dec_ctl.scala 115:34]
  wire  _T_673 = _T_672 & io_ins[4]; // @[el2_dec_dec_ctl.scala 115:34]
  wire  _T_674 = _T_668 | _T_673; // @[el2_dec_dec_ctl.scala 114:91]
  wire  _T_678 = io_ins[9] & io_ins[6]; // @[el2_dec_dec_ctl.scala 115:69]
  wire  _T_679 = _T_678 & io_ins[4]; // @[el2_dec_dec_ctl.scala 115:69]
  wire  _T_680 = _T_674 | _T_679; // @[el2_dec_dec_ctl.scala 115:38]
  wire  _T_684 = io_ins[10] & io_ins[6]; // @[el2_dec_dec_ctl.scala 115:105]
  wire  _T_685 = _T_684 & io_ins[4]; // @[el2_dec_dec_ctl.scala 115:105]
  wire  _T_686 = _T_680 | _T_685; // @[el2_dec_dec_ctl.scala 115:73]
  wire  _T_690 = io_ins[11] & io_ins[6]; // @[el2_dec_dec_ctl.scala 116:35]
  wire  _T_691 = _T_690 & io_ins[4]; // @[el2_dec_dec_ctl.scala 116:35]
  wire  _T_699 = _T_94 & io_ins[12]; // @[el2_dec_dec_ctl.scala 117:57]
  wire  _T_700 = _T_699 & io_ins[6]; // @[el2_dec_dec_ctl.scala 117:57]
  wire  _T_701 = _T_700 & io_ins[4]; // @[el2_dec_dec_ctl.scala 117:57]
  wire  _T_708 = _T_79 & io_ins[12]; // @[el2_dec_dec_ctl.scala 117:99]
  wire  _T_709 = _T_708 & io_ins[6]; // @[el2_dec_dec_ctl.scala 117:99]
  wire  _T_710 = _T_709 & io_ins[4]; // @[el2_dec_dec_ctl.scala 117:99]
  wire  _T_711 = _T_701 | _T_710; // @[el2_dec_dec_ctl.scala 117:61]
  wire  _T_718 = _T_64 & io_ins[12]; // @[el2_dec_dec_ctl.scala 118:41]
  wire  _T_719 = _T_718 & io_ins[6]; // @[el2_dec_dec_ctl.scala 118:41]
  wire  _T_720 = _T_719 & io_ins[4]; // @[el2_dec_dec_ctl.scala 118:41]
  wire  _T_721 = _T_711 | _T_720; // @[el2_dec_dec_ctl.scala 117:103]
  wire  _T_727 = io_ins[18] & _T_144; // @[el2_dec_dec_ctl.scala 118:81]
  wire  _T_728 = _T_727 & io_ins[6]; // @[el2_dec_dec_ctl.scala 118:81]
  wire  _T_729 = _T_728 & io_ins[4]; // @[el2_dec_dec_ctl.scala 118:81]
  wire  _T_730 = _T_721 | _T_729; // @[el2_dec_dec_ctl.scala 118:45]
  wire  _T_736 = io_ins[19] & _T_144; // @[el2_dec_dec_ctl.scala 119:39]
  wire  _T_737 = _T_736 & io_ins[6]; // @[el2_dec_dec_ctl.scala 119:39]
  wire  _T_738 = _T_737 & io_ins[4]; // @[el2_dec_dec_ctl.scala 119:39]
  wire  _T_746 = _T_181 & io_ins[6]; // @[el2_dec_dec_ctl.scala 120:57]
  wire  _T_754 = _T_421 & io_ins[6]; // @[el2_dec_dec_ctl.scala 121:55]
  wire  _T_755 = _T_754 & io_ins[4]; // @[el2_dec_dec_ctl.scala 121:55]
  wire  _T_760 = io_ins[15] & io_ins[14]; // @[el2_dec_dec_ctl.scala 121:94]
  wire  _T_761 = _T_760 & io_ins[6]; // @[el2_dec_dec_ctl.scala 121:94]
  wire  _T_762 = _T_761 & io_ins[4]; // @[el2_dec_dec_ctl.scala 121:94]
  wire  _T_763 = _T_755 | _T_762; // @[el2_dec_dec_ctl.scala 121:59]
  wire  _T_768 = io_ins[16] & io_ins[14]; // @[el2_dec_dec_ctl.scala 122:38]
  wire  _T_769 = _T_768 & io_ins[6]; // @[el2_dec_dec_ctl.scala 122:38]
  wire  _T_770 = _T_769 & io_ins[4]; // @[el2_dec_dec_ctl.scala 122:38]
  wire  _T_771 = _T_763 | _T_770; // @[el2_dec_dec_ctl.scala 121:98]
  wire  _T_776 = io_ins[17] & io_ins[14]; // @[el2_dec_dec_ctl.scala 122:77]
  wire  _T_777 = _T_776 & io_ins[6]; // @[el2_dec_dec_ctl.scala 122:77]
  wire  _T_778 = _T_777 & io_ins[4]; // @[el2_dec_dec_ctl.scala 122:77]
  wire  _T_779 = _T_771 | _T_778; // @[el2_dec_dec_ctl.scala 122:42]
  wire  _T_784 = io_ins[18] & io_ins[14]; // @[el2_dec_dec_ctl.scala 123:38]
  wire  _T_785 = _T_784 & io_ins[6]; // @[el2_dec_dec_ctl.scala 123:38]
  wire  _T_786 = _T_785 & io_ins[4]; // @[el2_dec_dec_ctl.scala 123:38]
  wire  _T_787 = _T_779 | _T_786; // @[el2_dec_dec_ctl.scala 122:81]
  wire  _T_792 = io_ins[19] & io_ins[14]; // @[el2_dec_dec_ctl.scala 123:77]
  wire  _T_793 = _T_792 & io_ins[6]; // @[el2_dec_dec_ctl.scala 123:77]
  wire  _T_794 = _T_793 & io_ins[4]; // @[el2_dec_dec_ctl.scala 123:77]
  wire  _T_801 = io_ins[15] & _T_144; // @[el2_dec_dec_ctl.scala 124:55]
  wire  _T_802 = _T_801 & io_ins[6]; // @[el2_dec_dec_ctl.scala 124:55]
  wire  _T_803 = _T_802 & io_ins[4]; // @[el2_dec_dec_ctl.scala 124:55]
  wire  _T_809 = io_ins[16] & _T_144; // @[el2_dec_dec_ctl.scala 124:95]
  wire  _T_810 = _T_809 & io_ins[6]; // @[el2_dec_dec_ctl.scala 124:95]
  wire  _T_811 = _T_810 & io_ins[4]; // @[el2_dec_dec_ctl.scala 124:95]
  wire  _T_812 = _T_803 | _T_811; // @[el2_dec_dec_ctl.scala 124:59]
  wire  _T_818 = io_ins[17] & _T_144; // @[el2_dec_dec_ctl.scala 125:39]
  wire  _T_819 = _T_818 & io_ins[6]; // @[el2_dec_dec_ctl.scala 125:39]
  wire  _T_820 = _T_819 & io_ins[4]; // @[el2_dec_dec_ctl.scala 125:39]
  wire  _T_821 = _T_812 | _T_820; // @[el2_dec_dec_ctl.scala 124:99]
  wire  _T_830 = _T_821 | _T_729; // @[el2_dec_dec_ctl.scala 125:43]
  wire  _T_841 = ~io_ins[22]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_849 = _T_841 & io_ins[20]; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_850 = _T_849 & _T_16; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_851 = _T_850 & _T_144; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_852 = _T_851 & io_ins[6]; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_855 = ~io_ins[21]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_857 = ~io_ins[20]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_864 = _T_855 & _T_857; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_865 = _T_864 & _T_16; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_866 = _T_865 & _T_144; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_867 = _T_866 & io_ins[6]; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_876 = io_ins[29] & _T_16; // @[el2_dec_dec_ctl.scala 129:56]
  wire  _T_877 = _T_876 & _T_144; // @[el2_dec_dec_ctl.scala 129:56]
  wire  _T_878 = _T_877 & io_ins[6]; // @[el2_dec_dec_ctl.scala 129:56]
  wire  _T_889 = io_ins[25] & _T_14; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_890 = _T_889 & _T_104; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_891 = _T_890 & io_ins[5]; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_892 = _T_891 & io_ins[4]; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_907 = _T_889 & io_ins[13]; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_908 = _T_907 & _T_144; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_909 = _T_908 & _T_104; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_910 = _T_909 & io_ins[5]; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_911 = _T_910 & io_ins[4]; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_912 = _T_911 & _T_18; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_925 = _T_889 & _T_16; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_926 = _T_925 & io_ins[12]; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_927 = _T_926 & _T_104; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_928 = _T_927 & io_ins[4]; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_929 = _T_928 & _T_18; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_961 = _T_925 & _T_144; // @[el2_dec_dec_ctl.scala 134:62]
  wire  _T_962 = _T_961 & io_ins[5]; // @[el2_dec_dec_ctl.scala 134:62]
  wire  _T_963 = _T_962 & io_ins[4]; // @[el2_dec_dec_ctl.scala 134:62]
  wire  _T_973 = _T_563 & _T_104; // @[el2_dec_dec_ctl.scala 135:54]
  wire  _T_974 = _T_973 & io_ins[5]; // @[el2_dec_dec_ctl.scala 135:54]
  wire  _T_985 = _T_563 & io_ins[13]; // @[el2_dec_dec_ctl.scala 136:57]
  wire  _T_986 = _T_985 & _T_104; // @[el2_dec_dec_ctl.scala 136:57]
  wire  _T_987 = _T_986 & io_ins[5]; // @[el2_dec_dec_ctl.scala 136:57]
  wire  _T_992 = _T_9 & io_ins[3]; // @[el2_dec_dec_ctl.scala 137:47]
  wire  _T_997 = io_ins[12] & _T_9; // @[el2_dec_dec_ctl.scala 138:52]
  wire  _T_998 = _T_997 & io_ins[3]; // @[el2_dec_dec_ctl.scala 138:52]
  wire  _T_1006 = io_ins[28] & io_ins[22]; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1007 = _T_1006 & _T_16; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1008 = _T_1007 & _T_144; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1009 = _T_1008 & io_ins[4]; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1013 = _T_1009 | _T_190; // @[el2_dec_dec_ctl.scala 139:63]
  wire  _T_1019 = _T_4 & _T_104; // @[el2_dec_dec_ctl.scala 140:37]
  wire  _T_1020 = _T_1019 & io_ins[4]; // @[el2_dec_dec_ctl.scala 140:37]
  wire  _T_1021 = _T_1013 | _T_1020; // @[el2_dec_dec_ctl.scala 139:96]
  wire  _T_1037 = _T_87 & io_ins[6]; // @[el2_dec_dec_ctl.scala 141:88]
  wire  _T_1038 = _T_1037 & io_ins[4]; // @[el2_dec_dec_ctl.scala 141:88]
  wire  _T_1039 = _T_992 | _T_1038; // @[el2_dec_dec_ctl.scala 141:53]
  wire  _T_1046 = _T_72 & io_ins[6]; // @[el2_dec_dec_ctl.scala 142:38]
  wire  _T_1047 = _T_1046 & io_ins[4]; // @[el2_dec_dec_ctl.scala 142:38]
  wire  _T_1048 = _T_1039 | _T_1047; // @[el2_dec_dec_ctl.scala 141:92]
  wire  _T_1055 = _T_57 & io_ins[6]; // @[el2_dec_dec_ctl.scala 142:77]
  wire  _T_1056 = _T_1055 & io_ins[4]; // @[el2_dec_dec_ctl.scala 142:77]
  wire  _T_1057 = _T_1048 | _T_1056; // @[el2_dec_dec_ctl.scala 142:42]
  wire  _T_1066 = _T_1057 | _T_1056; // @[el2_dec_dec_ctl.scala 142:81]
  wire  _T_1073 = _T_41 & io_ins[6]; // @[el2_dec_dec_ctl.scala 143:78]
  wire  _T_1074 = _T_1073 & io_ins[4]; // @[el2_dec_dec_ctl.scala 143:78]
  wire  _T_1075 = _T_1066 | _T_1074; // @[el2_dec_dec_ctl.scala 143:42]
  wire  _T_1082 = _T_26 & io_ins[6]; // @[el2_dec_dec_ctl.scala 144:39]
  wire  _T_1083 = _T_1082 & io_ins[4]; // @[el2_dec_dec_ctl.scala 144:39]
  wire  _T_1084 = _T_1075 | _T_1083; // @[el2_dec_dec_ctl.scala 143:82]
  wire  _T_1090 = _T_94 & io_ins[6]; // @[el2_dec_dec_ctl.scala 144:78]
  wire  _T_1091 = _T_1090 & io_ins[4]; // @[el2_dec_dec_ctl.scala 144:78]
  wire  _T_1092 = _T_1084 | _T_1091; // @[el2_dec_dec_ctl.scala 144:43]
  wire  _T_1098 = _T_79 & io_ins[6]; // @[el2_dec_dec_ctl.scala 145:38]
  wire  _T_1099 = _T_1098 & io_ins[4]; // @[el2_dec_dec_ctl.scala 145:38]
  wire  _T_1100 = _T_1092 | _T_1099; // @[el2_dec_dec_ctl.scala 144:82]
  wire  _T_1106 = _T_64 & io_ins[6]; // @[el2_dec_dec_ctl.scala 145:77]
  wire  _T_1107 = _T_1106 & io_ins[4]; // @[el2_dec_dec_ctl.scala 145:77]
  wire  _T_1108 = _T_1100 | _T_1107; // @[el2_dec_dec_ctl.scala 145:42]
  wire  _T_1113 = io_ins[18] & io_ins[13]; // @[el2_dec_dec_ctl.scala 146:38]
  wire  _T_1114 = _T_1113 & io_ins[6]; // @[el2_dec_dec_ctl.scala 146:38]
  wire  _T_1115 = _T_1114 & io_ins[4]; // @[el2_dec_dec_ctl.scala 146:38]
  wire  _T_1116 = _T_1108 | _T_1115; // @[el2_dec_dec_ctl.scala 145:81]
  wire  _T_1122 = _T_33 & io_ins[6]; // @[el2_dec_dec_ctl.scala 146:77]
  wire  _T_1123 = _T_1122 & io_ins[4]; // @[el2_dec_dec_ctl.scala 146:77]
  wire  _T_1139 = _T_841 & _T_16; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1140 = _T_1139 & _T_144; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1141 = _T_1140 & io_ins[6]; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1142 = _T_1141 & io_ins[4]; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1143 = _T_998 | _T_1142; // @[el2_dec_dec_ctl.scala 147:57]
  wire  _T_1152 = _T_1143 | _T_1038; // @[el2_dec_dec_ctl.scala 147:102]
  wire  _T_1161 = _T_1152 | _T_1047; // @[el2_dec_dec_ctl.scala 148:42]
  wire  _T_1170 = _T_1161 | _T_1056; // @[el2_dec_dec_ctl.scala 148:81]
  wire  _T_1179 = _T_1170 | _T_1074; // @[el2_dec_dec_ctl.scala 149:42]
  wire  _T_1188 = _T_1179 | _T_1083; // @[el2_dec_dec_ctl.scala 149:82]
  wire  _T_1196 = _T_1188 | _T_1091; // @[el2_dec_dec_ctl.scala 150:43]
  wire  _T_1204 = _T_1196 | _T_1099; // @[el2_dec_dec_ctl.scala 150:82]
  wire  _T_1212 = _T_1204 | _T_1107; // @[el2_dec_dec_ctl.scala 151:42]
  wire  _T_1220 = _T_1212 | _T_1115; // @[el2_dec_dec_ctl.scala 151:81]
  wire  _T_1230 = ~io_ins[31]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1236 = ~io_ins[27]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1238 = ~io_ins[26]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1242 = ~io_ins[24]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1244 = ~io_ins[23]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1251 = ~io_ins[19]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1255 = ~io_ins[17]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1257 = ~io_ins[16]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1259 = ~io_ins[15]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1263 = ~io_ins[11]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1265 = ~io_ins[10]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1267 = ~io_ins[9]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1269 = ~io_ins[8]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1271 = ~io_ins[7]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1281 = ~io_ins[0]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1282 = _T_1230 & _T_248; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1283 = _T_1282 & io_ins[29]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1284 = _T_1283 & io_ins[28]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1285 = _T_1284 & _T_1236; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1286 = _T_1285 & _T_1238; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1287 = _T_1286 & _T_4; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1288 = _T_1287 & _T_1242; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1289 = _T_1288 & _T_1244; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1290 = _T_1289 & _T_841; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1291 = _T_1290 & io_ins[21]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1292 = _T_1291 & _T_857; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1293 = _T_1292 & _T_1251; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1294 = _T_1293 & _T_45; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1295 = _T_1294 & _T_1255; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1296 = _T_1295 & _T_1257; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1297 = _T_1296 & _T_1259; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1298 = _T_1297 & _T_14; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1299 = _T_1298 & _T_1263; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1300 = _T_1299 & _T_1265; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1301 = _T_1300 & _T_1267; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1302 = _T_1301 & _T_1269; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1303 = _T_1302 & _T_1271; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1304 = _T_1303 & io_ins[6]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1305 = _T_1304 & io_ins[5]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1306 = _T_1305 & io_ins[4]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1307 = _T_1306 & _T_100; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1308 = _T_1307 & _T_18; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1309 = _T_1308 & io_ins[1]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1310 = _T_1309 & _T_1281; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1316 = ~io_ins[29]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1365 = _T_1282 & _T_1316; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1366 = _T_1365 & io_ins[28]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1367 = _T_1366 & _T_1236; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1368 = _T_1367 & _T_1238; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1369 = _T_1368 & _T_4; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1370 = _T_1369 & _T_1242; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1371 = _T_1370 & _T_1244; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1372 = _T_1371 & io_ins[22]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1373 = _T_1372 & _T_855; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1374 = _T_1373 & io_ins[20]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1375 = _T_1374 & _T_1251; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1376 = _T_1375 & _T_45; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1377 = _T_1376 & _T_1255; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1378 = _T_1377 & _T_1257; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1379 = _T_1378 & _T_1259; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1380 = _T_1379 & _T_14; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1381 = _T_1380 & _T_1263; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1382 = _T_1381 & _T_1265; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1383 = _T_1382 & _T_1267; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1384 = _T_1383 & _T_1269; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1385 = _T_1384 & _T_1271; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1386 = _T_1385 & io_ins[6]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1387 = _T_1386 & io_ins[5]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1388 = _T_1387 & io_ins[4]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1389 = _T_1388 & _T_100; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1390 = _T_1389 & _T_18; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1391 = _T_1390 & io_ins[1]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1392 = _T_1391 & _T_1281; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1393 = _T_1310 | _T_1392; // @[el2_dec_dec_ctl.scala 153:148]
  wire  _T_1401 = ~io_ins[28]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1449 = _T_1365 & _T_1401; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1450 = _T_1449 & _T_1236; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1451 = _T_1450 & _T_1238; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1452 = _T_1451 & _T_4; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1453 = _T_1452 & _T_1242; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1454 = _T_1453 & _T_1244; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1455 = _T_1454 & _T_841; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1456 = _T_1455 & _T_855; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1457 = _T_1456 & _T_1251; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1458 = _T_1457 & _T_45; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1459 = _T_1458 & _T_1255; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1460 = _T_1459 & _T_1257; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1461 = _T_1460 & _T_1259; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1462 = _T_1461 & _T_14; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1463 = _T_1462 & _T_1263; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1464 = _T_1463 & _T_1265; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1465 = _T_1464 & _T_1267; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1466 = _T_1465 & _T_1269; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1467 = _T_1466 & _T_1271; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1468 = _T_1467 & io_ins[5]; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1469 = _T_1468 & io_ins[4]; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1470 = _T_1469 & _T_100; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1471 = _T_1470 & _T_18; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1472 = _T_1471 & io_ins[1]; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1473 = _T_1472 & _T_1281; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1474 = _T_1393 | _T_1473; // @[el2_dec_dec_ctl.scala 154:134]
  wire  _T_1503 = _T_1452 & _T_104; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1504 = _T_1503 & io_ins[4]; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1505 = _T_1504 & _T_100; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1506 = _T_1505 & io_ins[1]; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1507 = _T_1506 & _T_1281; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1508 = _T_1474 | _T_1507; // @[el2_dec_dec_ctl.scala 155:131]
  wire  _T_1536 = _T_1230 & _T_1316; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1537 = _T_1536 & _T_1401; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1538 = _T_1537 & _T_1236; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1539 = _T_1538 & _T_1238; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1540 = _T_1539 & _T_4; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1541 = _T_1540 & _T_14; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1542 = _T_1541 & _T_16; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1543 = _T_1542 & _T_144; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1544 = _T_1543 & _T_104; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1545 = _T_1544 & _T_100; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1546 = _T_1545 & _T_18; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1547 = _T_1546 & io_ins[1]; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1548 = _T_1547 & _T_1281; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1549 = _T_1508 | _T_1548; // @[el2_dec_dec_ctl.scala 156:72]
  wire  _T_1579 = _T_1540 & io_ins[14]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1580 = _T_1579 & _T_16; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1581 = _T_1580 & io_ins[12]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1582 = _T_1581 & _T_104; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1583 = _T_1582 & io_ins[4]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1584 = _T_1583 & _T_100; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1585 = _T_1584 & io_ins[1]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1586 = _T_1585 & _T_1281; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1587 = _T_1549 | _T_1586; // @[el2_dec_dec_ctl.scala 157:81]
  wire  _T_1614 = _T_1451 & _T_104; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1615 = _T_1614 & io_ins[5]; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1616 = _T_1615 & io_ins[4]; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1617 = _T_1616 & _T_100; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1618 = _T_1617 & io_ins[1]; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1619 = _T_1618 & _T_1281; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1620 = _T_1587 | _T_1619; // @[el2_dec_dec_ctl.scala 158:78]
  wire  _T_1638 = _T_236 & io_ins[6]; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1639 = _T_1638 & io_ins[5]; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1640 = _T_1639 & _T_98; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1641 = _T_1640 & _T_100; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1642 = _T_1641 & io_ins[1]; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1643 = _T_1642 & _T_1281; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1644 = _T_1620 | _T_1643; // @[el2_dec_dec_ctl.scala 159:70]
  wire  _T_1657 = io_ins[14] & io_ins[6]; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1658 = _T_1657 & io_ins[5]; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1659 = _T_1658 & _T_98; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1660 = _T_1659 & _T_100; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1661 = _T_1660 & _T_18; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1662 = _T_1661 & io_ins[1]; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1663 = _T_1662 & _T_1281; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1664 = _T_1644 | _T_1663; // @[el2_dec_dec_ctl.scala 160:58]
  wire  _T_1677 = _T_144 & _T_104; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1678 = _T_1677 & _T_9; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1679 = _T_1678 & io_ins[4]; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1680 = _T_1679 & _T_100; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1681 = _T_1680 & io_ins[1]; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1682 = _T_1681 & _T_1281; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1683 = _T_1664 | _T_1682; // @[el2_dec_dec_ctl.scala 161:52]
  wire  _T_1699 = _T_19 & io_ins[5]; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1700 = _T_1699 & _T_98; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1701 = _T_1700 & _T_100; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1702 = _T_1701 & _T_18; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1703 = _T_1702 & io_ins[1]; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1704 = _T_1703 & _T_1281; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1705 = _T_1683 | _T_1704; // @[el2_dec_dec_ctl.scala 162:51]
  wire  _T_1717 = io_ins[12] & io_ins[6]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1718 = _T_1717 & io_ins[5]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1719 = _T_1718 & io_ins[4]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1720 = _T_1719 & _T_100; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1721 = _T_1720 & _T_18; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1722 = _T_1721 & io_ins[1]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1723 = _T_1722 & _T_1281; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1724 = _T_1705 | _T_1723; // @[el2_dec_dec_ctl.scala 162:103]
  wire  _T_1796 = _T_1456 & _T_857; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1797 = _T_1796 & _T_1251; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1798 = _T_1797 & _T_45; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1799 = _T_1798 & _T_1255; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1800 = _T_1799 & _T_1257; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1801 = _T_1800 & _T_1259; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1802 = _T_1801 & _T_14; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1803 = _T_1802 & _T_16; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1804 = _T_1803 & _T_144; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1805 = _T_1804 & _T_1263; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1806 = _T_1805 & _T_1265; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1807 = _T_1806 & _T_1267; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1808 = _T_1807 & _T_1269; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1809 = _T_1808 & _T_1271; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1810 = _T_1809 & _T_104; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1811 = _T_1810 & _T_9; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1812 = _T_1811 & _T_98; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1813 = _T_1812 & io_ins[3]; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1814 = _T_1813 & io_ins[2]; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1815 = _T_1814 & io_ins[1]; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1816 = _T_1815 & _T_1281; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1817 = _T_1724 | _T_1816; // @[el2_dec_dec_ctl.scala 163:51]
  wire  _T_1866 = _T_1449 & _T_1251; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1867 = _T_1866 & _T_45; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1868 = _T_1867 & _T_1255; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1869 = _T_1868 & _T_1257; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1870 = _T_1869 & _T_1259; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1871 = _T_1870 & _T_14; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1872 = _T_1871 & _T_16; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1873 = _T_1872 & _T_144; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1874 = _T_1873 & _T_1263; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1875 = _T_1874 & _T_1265; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1876 = _T_1875 & _T_1267; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1877 = _T_1876 & _T_1269; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1878 = _T_1877 & _T_1271; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1879 = _T_1878 & _T_104; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1880 = _T_1879 & _T_9; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1881 = _T_1880 & _T_98; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1882 = _T_1881 & io_ins[3]; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1883 = _T_1882 & io_ins[2]; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1884 = _T_1883 & io_ins[1]; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1885 = _T_1884 & _T_1281; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1886 = _T_1817 | _T_1885; // @[el2_dec_dec_ctl.scala 164:146]
  wire  _T_1902 = _T_16 & _T_104; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1903 = _T_1902 & _T_9; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1904 = _T_1903 & _T_98; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1905 = _T_1904 & _T_100; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1906 = _T_1905 & _T_18; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1907 = _T_1906 & io_ins[1]; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1908 = _T_1907 & _T_1281; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1909 = _T_1886 | _T_1908; // @[el2_dec_dec_ctl.scala 165:114]
  wire  _T_1919 = io_ins[6] & io_ins[5]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1920 = _T_1919 & _T_98; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1921 = _T_1920 & io_ins[3]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1922 = _T_1921 & io_ins[2]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1923 = _T_1922 & io_ins[1]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1924 = _T_1923 & _T_1281; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1925 = _T_1909 | _T_1924; // @[el2_dec_dec_ctl.scala 166:55]
  wire  _T_1938 = _T_656 & _T_9; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1939 = _T_1938 & io_ins[4]; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1940 = _T_1939 & _T_100; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1941 = _T_1940 & io_ins[1]; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1942 = _T_1941 & _T_1281; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1943 = _T_1925 | _T_1942; // @[el2_dec_dec_ctl.scala 166:99]
  wire  _T_1960 = _T_585 & _T_104; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1961 = _T_1960 & _T_98; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1962 = _T_1961 & _T_100; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1963 = _T_1962 & _T_18; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1964 = _T_1963 & io_ins[1]; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1965 = _T_1964 & _T_1281; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1966 = _T_1943 | _T_1965; // @[el2_dec_dec_ctl.scala 167:50]
  wire  _T_1977 = _T_104 & io_ins[4]; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1978 = _T_1977 & _T_100; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1979 = _T_1978 & _T_18; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1980 = _T_1979 & io_ins[1]; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1981 = _T_1980 & _T_1281; // @[el2_dec_dec_ctl.scala 168:43]
  assign io_out_alu = _T_7 | _T_11; // @[el2_dec_dec_ctl.scala 72:14]
  assign io_out_rs1 = _T_102 | _T_107; // @[el2_dec_dec_ctl.scala 73:14]
  assign io_out_rs2 = _T_115 | _T_122; // @[el2_dec_dec_ctl.scala 79:14]
  assign io_out_imm12 = _T_150 | _T_160; // @[el2_dec_dec_ctl.scala 80:16]
  assign io_out_rd = _T_170 | io_ins[4]; // @[el2_dec_dec_ctl.scala 82:13]
  assign io_out_shimm5 = _T_183 & _T_18; // @[el2_dec_dec_ctl.scala 83:17]
  assign io_out_imm20 = _T_187 | _T_190; // @[el2_dec_dec_ctl.scala 84:16]
  assign io_out_pc = _T_198 | _T_187; // @[el2_dec_dec_ctl.scala 85:13]
  assign io_out_load = _T_209 & _T_18; // @[el2_dec_dec_ctl.scala 86:15]
  assign io_out_store = _T_121 & _T_98; // @[el2_dec_dec_ctl.scala 87:16]
  assign io_out_lsu = _T_224 & _T_18; // @[el2_dec_dec_ctl.scala 88:14]
  assign io_out_add = _T_246 | _T_268; // @[el2_dec_dec_ctl.scala 89:14]
  assign io_out_sub = _T_312 | _T_319; // @[el2_dec_dec_ctl.scala 91:14]
  assign io_out_land = _T_331 | _T_345; // @[el2_dec_dec_ctl.scala 93:15]
  assign io_out_lor = _T_382 | _T_394; // @[el2_dec_dec_ctl.scala 94:14]
  assign io_out_lxor = _T_410 | _T_425; // @[el2_dec_dec_ctl.scala 97:15]
  assign io_out_sll = _T_443 & _T_18; // @[el2_dec_dec_ctl.scala 98:14]
  assign io_out_sra = _T_457 & _T_18; // @[el2_dec_dec_ctl.scala 99:14]
  assign io_out_srl = _T_477 & _T_18; // @[el2_dec_dec_ctl.scala 100:14]
  assign io_out_slt = _T_495 | _T_311; // @[el2_dec_dec_ctl.scala 101:14]
  assign io_out_unsign = _T_554 | _T_567; // @[el2_dec_dec_ctl.scala 102:17]
  assign io_out_condbr = _T_318 & _T_18; // @[el2_dec_dec_ctl.scala 105:17]
  assign io_out_beq = _T_587 & _T_18; // @[el2_dec_dec_ctl.scala 106:14]
  assign io_out_bne = _T_599 & _T_18; // @[el2_dec_dec_ctl.scala 107:14]
  assign io_out_bge = _T_610 & _T_18; // @[el2_dec_dec_ctl.scala 108:14]
  assign io_out_blt = _T_622 & _T_18; // @[el2_dec_dec_ctl.scala 109:14]
  assign io_out_jal = io_ins[6] & io_ins[2]; // @[el2_dec_dec_ctl.scala 110:14]
  assign io_out_by = _T_639 & _T_18; // @[el2_dec_dec_ctl.scala 111:13]
  assign io_out_half = _T_649 & _T_18; // @[el2_dec_dec_ctl.scala 112:15]
  assign io_out_word = _T_656 & _T_98; // @[el2_dec_dec_ctl.scala 113:15]
  assign io_out_csr_read = _T_686 | _T_691; // @[el2_dec_dec_ctl.scala 114:19]
  assign io_out_csr_clr = _T_730 | _T_738; // @[el2_dec_dec_ctl.scala 117:18]
  assign io_out_csr_set = _T_830 | _T_738; // @[el2_dec_dec_ctl.scala 124:18]
  assign io_out_csr_write = _T_746 & io_ins[4]; // @[el2_dec_dec_ctl.scala 120:20]
  assign io_out_csr_imm = _T_787 | _T_794; // @[el2_dec_dec_ctl.scala 121:18]
  assign io_out_presync = _T_1116 | _T_1123; // @[el2_dec_dec_ctl.scala 141:18]
  assign io_out_postsync = _T_1220 | _T_1123; // @[el2_dec_dec_ctl.scala 147:19]
  assign io_out_ebreak = _T_852 & io_ins[4]; // @[el2_dec_dec_ctl.scala 127:17]
  assign io_out_ecall = _T_867 & io_ins[4]; // @[el2_dec_dec_ctl.scala 128:16]
  assign io_out_mret = _T_878 & io_ins[4]; // @[el2_dec_dec_ctl.scala 129:15]
  assign io_out_mul = _T_892 & _T_18; // @[el2_dec_dec_ctl.scala 130:14]
  assign io_out_rs1_sign = _T_912 | _T_929; // @[el2_dec_dec_ctl.scala 131:19]
  assign io_out_rs2_sign = _T_928 & _T_18; // @[el2_dec_dec_ctl.scala 133:19]
  assign io_out_low = _T_963 & _T_18; // @[el2_dec_dec_ctl.scala 134:14]
  assign io_out_div = _T_974 & _T_18; // @[el2_dec_dec_ctl.scala 135:14]
  assign io_out_rem = _T_987 & _T_18; // @[el2_dec_dec_ctl.scala 136:14]
  assign io_out_fence = _T_9 & io_ins[3]; // @[el2_dec_dec_ctl.scala 137:16]
  assign io_out_fence_i = _T_997 & io_ins[3]; // @[el2_dec_dec_ctl.scala 138:18]
  assign io_out_pm_alu = _T_1021 | _T_11; // @[el2_dec_dec_ctl.scala 139:17]
  assign io_out_legal = _T_1966 | _T_1981; // @[el2_dec_dec_ctl.scala 153:16]
endmodule
module el2_dec_decode_ctl(
  input         clock,
  input         reset,
  input         io_dec_tlu_flush_extint,
  input         io_dec_tlu_force_halt,
  output        io_dec_extint_stall,
  input  [15:0] io_ifu_i0_cinst,
  output [31:0] io_dec_i0_inst_wb1,
  output [30:0] io_dec_i0_pc_wb1,
  input         io_lsu_nonblock_load_valid_m,
  input  [1:0]  io_lsu_nonblock_load_tag_m,
  input         io_lsu_nonblock_load_inv_r,
  input  [1:0]  io_lsu_nonblock_load_inv_tag_r,
  input         io_lsu_nonblock_load_data_valid,
  input         io_lsu_nonblock_load_data_error,
  input  [1:0]  io_lsu_nonblock_load_data_tag,
  input  [31:0] io_lsu_nonblock_load_data,
  input  [3:0]  io_dec_i0_trigger_match_d,
  input         io_dec_tlu_wr_pause_r,
  input         io_dec_tlu_pipelining_disable,
  input  [3:0]  io_lsu_trigger_match_m,
  input         io_lsu_pmu_misaligned_m,
  input         io_dec_tlu_debug_stall,
  input         io_dec_tlu_flush_leak_one_r,
  input         io_dec_debug_fence_d,
  input  [1:0]  io_dbg_cmd_wrdata,
  input         io_dec_i0_icaf_d,
  input         io_dec_i0_icaf_f1_d,
  input  [1:0]  io_dec_i0_icaf_type_d,
  input         io_dec_i0_dbecc_d,
  input         io_dec_i0_brp_valid,
  input  [11:0] io_dec_i0_brp_bits_toffset,
  input  [1:0]  io_dec_i0_brp_bits_hist,
  input         io_dec_i0_brp_bits_br_error,
  input         io_dec_i0_brp_bits_br_start_error,
  input         io_dec_i0_brp_bits_bank,
  input  [30:0] io_dec_i0_brp_bits_prett,
  input         io_dec_i0_brp_bits_way,
  input         io_dec_i0_brp_bits_ret,
  input  [7:0]  io_dec_i0_bp_index,
  input  [7:0]  io_dec_i0_bp_fghr,
  input  [4:0]  io_dec_i0_bp_btag,
  input  [30:0] io_dec_i0_pc_d,
  input         io_lsu_idle_any,
  input         io_lsu_load_stall_any,
  input         io_lsu_store_stall_any,
  input         io_dma_dccm_stall_any,
  input         io_exu_div_wren,
  input         io_dec_tlu_i0_kill_writeb_wb,
  input         io_dec_tlu_flush_lower_wb,
  input         io_dec_tlu_i0_kill_writeb_r,
  input         io_dec_tlu_flush_lower_r,
  input         io_dec_tlu_flush_pause_r,
  input         io_dec_tlu_presync_d,
  input         io_dec_tlu_postsync_d,
  input         io_dec_i0_pc4_d,
  input  [31:0] io_dec_csr_rddata_d,
  input         io_dec_csr_legal_d,
  input  [31:0] io_exu_csr_rs1_x,
  input  [31:0] io_lsu_result_m,
  input  [31:0] io_lsu_result_corr_r,
  input         io_exu_flush_final,
  input  [30:0] io_exu_i0_pc_x,
  input  [31:0] io_dec_i0_instr_d,
  input         io_dec_ib0_valid_d,
  input  [31:0] io_exu_i0_result_x,
  input         io_free_clk,
  input         io_active_clk,
  input         io_clk_override,
  output        io_dec_i0_rs1_en_d,
  output        io_dec_i0_rs2_en_d,
  output [4:0]  io_dec_i0_rs1_d,
  output [4:0]  io_dec_i0_rs2_d,
  output [31:0] io_dec_i0_immed_d,
  output [11:0] io_dec_i0_br_immed_d,
  output        io_i0_ap_land,
  output        io_i0_ap_lor,
  output        io_i0_ap_lxor,
  output        io_i0_ap_sll,
  output        io_i0_ap_srl,
  output        io_i0_ap_sra,
  output        io_i0_ap_beq,
  output        io_i0_ap_bne,
  output        io_i0_ap_blt,
  output        io_i0_ap_bge,
  output        io_i0_ap_add,
  output        io_i0_ap_sub,
  output        io_i0_ap_slt,
  output        io_i0_ap_unsign,
  output        io_i0_ap_jal,
  output        io_i0_ap_predict_t,
  output        io_i0_ap_predict_nt,
  output        io_i0_ap_csr_write,
  output        io_i0_ap_csr_imm,
  output        io_dec_i0_decode_d,
  output        io_dec_i0_alu_decode_d,
  output [31:0] io_dec_i0_rs1_bypass_data_d,
  output [31:0] io_dec_i0_rs2_bypass_data_d,
  output [4:0]  io_dec_i0_waddr_r,
  output        io_dec_i0_wen_r,
  output [31:0] io_dec_i0_wdata_r,
  output        io_dec_i0_select_pc_d,
  output [1:0]  io_dec_i0_rs1_bypass_en_d,
  output [1:0]  io_dec_i0_rs2_bypass_en_d,
  output        io_lsu_p_valid,
  output        io_lsu_p_bits_fast_int,
  output        io_lsu_p_bits_by,
  output        io_lsu_p_bits_half,
  output        io_lsu_p_bits_word,
  output        io_lsu_p_bits_dword,
  output        io_lsu_p_bits_load,
  output        io_lsu_p_bits_store,
  output        io_lsu_p_bits_unsign,
  output        io_lsu_p_bits_dma,
  output        io_lsu_p_bits_store_data_bypass_d,
  output        io_lsu_p_bits_load_ldst_bypass_d,
  output        io_lsu_p_bits_store_data_bypass_m,
  output        io_mul_p_valid,
  output        io_mul_p_bits_rs1_sign,
  output        io_mul_p_bits_rs2_sign,
  output        io_mul_p_bits_low,
  output        io_mul_p_bits_bext,
  output        io_mul_p_bits_bdep,
  output        io_mul_p_bits_clmul,
  output        io_mul_p_bits_clmulh,
  output        io_mul_p_bits_clmulr,
  output        io_mul_p_bits_grev,
  output        io_mul_p_bits_shfl,
  output        io_mul_p_bits_unshfl,
  output        io_mul_p_bits_crc32_b,
  output        io_mul_p_bits_crc32_h,
  output        io_mul_p_bits_crc32_w,
  output        io_mul_p_bits_crc32c_b,
  output        io_mul_p_bits_crc32c_h,
  output        io_mul_p_bits_crc32c_w,
  output        io_mul_p_bits_bfp,
  output        io_div_p_valid,
  output        io_div_p_bits_unsign,
  output        io_div_p_bits_rem,
  output [4:0]  io_div_waddr_wb,
  output        io_dec_div_cancel,
  output        io_dec_lsu_valid_raw_d,
  output [11:0] io_dec_lsu_offset_d,
  output        io_dec_csr_ren_d,
  output        io_dec_csr_wen_unq_d,
  output        io_dec_csr_any_unq_d,
  output [11:0] io_dec_csr_rdaddr_d,
  output        io_dec_csr_wen_r,
  output [11:0] io_dec_csr_wraddr_r,
  output [31:0] io_dec_csr_wrdata_r,
  output        io_dec_csr_stall_int_ff,
  output        io_dec_tlu_i0_valid_r,
  output        io_dec_tlu_packet_r_legal,
  output        io_dec_tlu_packet_r_icaf,
  output        io_dec_tlu_packet_r_icaf_f1,
  output [1:0]  io_dec_tlu_packet_r_icaf_type,
  output        io_dec_tlu_packet_r_fence_i,
  output [3:0]  io_dec_tlu_packet_r_i0trigger,
  output [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  output        io_dec_tlu_packet_r_pmu_i0_br_unpred,
  output        io_dec_tlu_packet_r_pmu_divide,
  output        io_dec_tlu_packet_r_pmu_lsu_misaligned,
  output [30:0] io_dec_tlu_i0_pc_r,
  output [31:0] io_dec_illegal_inst,
  output [30:0] io_pred_correct_npc_x,
  output        io_dec_i0_predict_p_d_valid,
  output        io_dec_i0_predict_p_d_bits_misp,
  output        io_dec_i0_predict_p_d_bits_ataken,
  output        io_dec_i0_predict_p_d_bits_boffset,
  output        io_dec_i0_predict_p_d_bits_pc4,
  output [1:0]  io_dec_i0_predict_p_d_bits_hist,
  output [11:0] io_dec_i0_predict_p_d_bits_toffset,
  output        io_dec_i0_predict_p_d_bits_br_error,
  output        io_dec_i0_predict_p_d_bits_br_start_error,
  output [30:0] io_dec_i0_predict_p_d_bits_prett,
  output        io_dec_i0_predict_p_d_bits_pcall,
  output        io_dec_i0_predict_p_d_bits_pret,
  output        io_dec_i0_predict_p_d_bits_pja,
  output        io_dec_i0_predict_p_d_bits_way,
  output [7:0]  io_i0_predict_fghr_d,
  output [7:0]  io_i0_predict_index_d,
  output [4:0]  io_i0_predict_btag_d,
  output [1:0]  io_dec_data_en,
  output [1:0]  io_dec_ctl_en,
  output        io_dec_pmu_instr_decoded,
  output        io_dec_pmu_decode_stall,
  output        io_dec_pmu_presync_stall,
  output        io_dec_pmu_postsync_stall,
  output        io_dec_nonblock_load_wen,
  output [4:0]  io_dec_nonblock_load_waddr,
  output        io_dec_pause_state,
  output        io_dec_pause_state_cg,
  output        io_dec_div_active,
  input         io_scan_mode
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
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire [31:0] i0_dec_io_ins; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_alu; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs1; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs2; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_imm12; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rd; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_shimm5; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_imm20; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_pc; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_load; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_store; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_lsu; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_add; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_sub; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_land; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_lor; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_lxor; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_sll; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_sra; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_srl; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_slt; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_unsign; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_condbr; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_beq; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_bne; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_bge; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_blt; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_jal; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_by; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_half; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_word; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_read; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_clr; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_set; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_write; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_imm; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_presync; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_postsync; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_ebreak; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_ecall; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_mret; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_mul; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs1_sign; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs2_sign; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_low; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_div; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rem; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_fence; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_fence_i; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_pm_alu; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_legal; // @[el2_dec_decode_ctl.scala 392:22]
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
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 508:23]
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
  wire  rvclkhdr_18_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_scan_mode; // @[el2_lib.scala 508:23]
  reg  tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 499:55]
  wire  _T_1 = io_dec_tlu_wr_pause_r ^ tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 211:51]
  reg  tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 500:55]
  wire  _T_2 = tlu_wr_pause_r1 ^ tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 212:32]
  wire  _T_3 = _T_1 | _T_2; // @[el2_dec_decode_ctl.scala 211:73]
  wire  _T_4 = io_dec_tlu_flush_extint ^ io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 213:32]
  wire  _T_5 = _T_3 | _T_4; // @[el2_dec_decode_ctl.scala 212:56]
  reg  leak1_i1_stall; // @[el2_dec_decode_ctl.scala 400:56]
  wire  _T_280 = ~io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 399:73]
  wire  _T_281 = leak1_i1_stall & _T_280; // @[el2_dec_decode_ctl.scala 399:71]
  wire  leak1_i1_stall_in = io_dec_tlu_flush_leak_one_r | _T_281; // @[el2_dec_decode_ctl.scala 399:53]
  wire  _T_6 = leak1_i1_stall_in ^ leak1_i1_stall; // @[el2_dec_decode_ctl.scala 214:32]
  wire  _T_7 = _T_5 | _T_6; // @[el2_dec_decode_ctl.scala 213:56]
  wire  _T_284 = io_dec_i0_decode_d & leak1_i1_stall; // @[el2_dec_decode_ctl.scala 402:45]
  reg  leak1_i0_stall; // @[el2_dec_decode_ctl.scala 403:56]
  wire  _T_286 = leak1_i0_stall & _T_280; // @[el2_dec_decode_ctl.scala 402:81]
  wire  leak1_i0_stall_in = _T_284 | _T_286; // @[el2_dec_decode_ctl.scala 402:63]
  wire  _T_8 = leak1_i0_stall_in ^ leak1_i0_stall; // @[el2_dec_decode_ctl.scala 215:32]
  wire  _T_9 = _T_7 | _T_8; // @[el2_dec_decode_ctl.scala 214:56]
  reg  pause_stall; // @[el2_dec_decode_ctl.scala 497:50]
  wire  _T_412 = io_dec_tlu_wr_pause_r | pause_stall; // @[el2_dec_decode_ctl.scala 496:44]
  wire  _T_408 = ~io_dec_tlu_flush_pause_r; // @[el2_dec_decode_ctl.scala 495:49]
  wire  _T_409 = io_dec_tlu_flush_lower_r & _T_408; // @[el2_dec_decode_ctl.scala 495:47]
  reg [31:0] write_csr_data; // @[el2_lib.scala 514:16]
  wire  _T_410 = write_csr_data == 32'h0; // @[el2_dec_decode_ctl.scala 495:109]
  wire  _T_411 = pause_stall & _T_410; // @[el2_dec_decode_ctl.scala 495:91]
  wire  clear_pause = _T_409 | _T_411; // @[el2_dec_decode_ctl.scala 495:76]
  wire  _T_413 = ~clear_pause; // @[el2_dec_decode_ctl.scala 496:61]
  wire  pause_state_in = _T_412 & _T_413; // @[el2_dec_decode_ctl.scala 496:59]
  wire  _T_10 = pause_state_in ^ pause_stall; // @[el2_dec_decode_ctl.scala 216:32]
  wire  _T_11 = _T_9 | _T_10; // @[el2_dec_decode_ctl.scala 215:56]
  wire  _T_18 = ~leak1_i1_stall; // @[el2_dec_decode_ctl.scala 226:62]
  wire  i0_brp_valid = io_dec_i0_brp_valid & _T_18; // @[el2_dec_decode_ctl.scala 226:60]
  wire  i0_dp_raw_condbr = i0_dec_io_out_condbr; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_jal = i0_dec_io_out_jal; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire [19:0] i0_pcall_imm = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21]}; // @[Cat.scala 29:58]
  wire  _T_298 = i0_pcall_imm[19:12] == 8'hff; // @[el2_dec_decode_ctl.scala 408:79]
  wire  _T_300 = i0_pcall_imm[19:12] == 8'h0; // @[el2_dec_decode_ctl.scala 408:112]
  wire  i0_pcall_12b_offset = i0_pcall_imm[11] ? _T_298 : _T_300; // @[el2_dec_decode_ctl.scala 408:33]
  wire  i0_dp_raw_imm20 = i0_dec_io_out_imm20; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  _T_301 = i0_pcall_12b_offset & i0_dp_raw_imm20; // @[el2_dec_decode_ctl.scala 409:47]
  wire [4:0] i0r_rd = io_dec_i0_instr_d[11:7]; // @[el2_dec_decode_ctl.scala 622:16]
  wire  _T_302 = i0r_rd == 5'h1; // @[el2_dec_decode_ctl.scala 409:76]
  wire  _T_303 = i0r_rd == 5'h5; // @[el2_dec_decode_ctl.scala 409:98]
  wire  _T_304 = _T_302 | _T_303; // @[el2_dec_decode_ctl.scala 409:89]
  wire  i0_pcall_case = _T_301 & _T_304; // @[el2_dec_decode_ctl.scala 409:65]
  wire  i0_pcall_raw = i0_dp_raw_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 411:38]
  wire  _T_20 = i0_dp_raw_condbr | i0_pcall_raw; // @[el2_dec_decode_ctl.scala 237:75]
  wire  _T_309 = ~_T_304; // @[el2_dec_decode_ctl.scala 410:67]
  wire  i0_pja_case = _T_301 & _T_309; // @[el2_dec_decode_ctl.scala 410:65]
  wire  i0_pja_raw = i0_dp_raw_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 413:38]
  wire  _T_21 = _T_20 | i0_pja_raw; // @[el2_dec_decode_ctl.scala 237:90]
  wire  i0_dp_raw_imm12 = i0_dec_io_out_imm12; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  _T_325 = i0_dp_raw_jal & i0_dp_raw_imm12; // @[el2_dec_decode_ctl.scala 417:37]
  wire  _T_326 = i0r_rd == 5'h0; // @[el2_dec_decode_ctl.scala 417:65]
  wire  _T_327 = _T_325 & _T_326; // @[el2_dec_decode_ctl.scala 417:55]
  wire [4:0] i0r_rs1 = io_dec_i0_instr_d[19:15]; // @[el2_dec_decode_ctl.scala 620:16]
  wire  _T_328 = i0r_rs1 == 5'h1; // @[el2_dec_decode_ctl.scala 417:89]
  wire  _T_329 = i0r_rs1 == 5'h5; // @[el2_dec_decode_ctl.scala 417:111]
  wire  _T_330 = _T_328 | _T_329; // @[el2_dec_decode_ctl.scala 417:101]
  wire  i0_pret_case = _T_327 & _T_330; // @[el2_dec_decode_ctl.scala 417:79]
  wire  i0_pret_raw = i0_dp_raw_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 418:32]
  wire  _T_22 = _T_21 | i0_pret_raw; // @[el2_dec_decode_ctl.scala 237:103]
  wire  _T_23 = ~_T_22; // @[el2_dec_decode_ctl.scala 237:56]
  wire  i0_notbr_error = i0_brp_valid & _T_23; // @[el2_dec_decode_ctl.scala 237:54]
  wire  _T_31 = io_dec_i0_brp_bits_br_error | i0_notbr_error; // @[el2_dec_decode_ctl.scala 242:62]
  wire  _T_25 = i0_brp_valid & io_dec_i0_brp_bits_hist[1]; // @[el2_dec_decode_ctl.scala 240:47]
  wire  _T_314 = i0_pcall_raw | i0_pja_raw; // @[el2_dec_decode_ctl.scala 415:41]
  wire [11:0] _T_323 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[7],io_dec_i0_instr_d[30:25],io_dec_i0_instr_d[11:8]}; // @[Cat.scala 29:58]
  wire [11:0] i0_br_offset = _T_314 ? i0_pcall_imm[11:0] : _T_323; // @[el2_dec_decode_ctl.scala 415:26]
  wire  _T_26 = io_dec_i0_brp_bits_toffset != i0_br_offset; // @[el2_dec_decode_ctl.scala 240:106]
  wire  _T_27 = _T_25 & _T_26; // @[el2_dec_decode_ctl.scala 240:76]
  wire  _T_28 = ~i0_pret_raw; // @[el2_dec_decode_ctl.scala 240:126]
  wire  i0_br_toffset_error = _T_27 & _T_28; // @[el2_dec_decode_ctl.scala 240:124]
  wire  _T_32 = _T_31 | i0_br_toffset_error; // @[el2_dec_decode_ctl.scala 242:79]
  wire  _T_29 = i0_brp_valid & io_dec_i0_brp_bits_ret; // @[el2_dec_decode_ctl.scala 241:47]
  wire  i0_ret_error = _T_29 & _T_28; // @[el2_dec_decode_ctl.scala 241:72]
  wire  i0_br_error = _T_32 | i0_ret_error; // @[el2_dec_decode_ctl.scala 242:101]
  wire  _T_39 = i0_br_error | io_dec_i0_brp_bits_br_start_error; // @[el2_dec_decode_ctl.scala 247:47]
  wire  i0_br_error_all = _T_39 & _T_18; // @[el2_dec_decode_ctl.scala 247:84]
  wire  i0_icaf_d = io_dec_i0_icaf_d | io_dec_i0_dbecc_d; // @[el2_dec_decode_ctl.scala 256:36]
  wire  _T_41 = i0_br_error_all | i0_icaf_d; // @[el2_dec_decode_ctl.scala 260:25]
  wire  i0_dp_raw_postsync = i0_dec_io_out_postsync; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_postsync = _T_41 | i0_dp_raw_postsync; // @[el2_dec_decode_ctl.scala 260:50]
  wire  _T_439 = i0_dp_postsync | io_dec_tlu_postsync_d; // @[el2_dec_decode_ctl.scala 526:36]
  wire  debug_fence_i = io_dec_debug_fence_d & io_dbg_cmd_wrdata[0]; // @[el2_dec_decode_ctl.scala 518:48]
  wire  _T_440 = _T_439 | debug_fence_i; // @[el2_dec_decode_ctl.scala 526:60]
  wire  i0_dp_raw_csr_write = i0_dec_io_out_csr_write; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_write = _T_41 ? 1'h0 : i0_dp_raw_csr_write; // @[el2_dec_decode_ctl.scala 260:50]
  wire  _T_343 = ~io_dec_debug_fence_d; // @[el2_dec_decode_ctl.scala 457:42]
  wire  i0_csr_write = i0_dp_csr_write & _T_343; // @[el2_dec_decode_ctl.scala 457:40]
  wire  i0_dp_raw_csr_read = i0_dec_io_out_csr_read; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_read = _T_41 ? 1'h0 : i0_dp_raw_csr_read; // @[el2_dec_decode_ctl.scala 260:50]
  wire  _T_347 = ~i0_dp_csr_read; // @[el2_dec_decode_ctl.scala 462:41]
  wire  i0_csr_write_only_d = i0_csr_write & _T_347; // @[el2_dec_decode_ctl.scala 462:39]
  wire  _T_442 = io_dec_i0_instr_d[31:20] == 12'h7c2; // @[el2_dec_decode_ctl.scala 526:112]
  wire  _T_443 = i0_csr_write_only_d & _T_442; // @[el2_dec_decode_ctl.scala 526:99]
  wire  i0_postsync = _T_440 | _T_443; // @[el2_dec_decode_ctl.scala 526:76]
  wire  i0_dp_raw_legal = i0_dec_io_out_legal; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_legal = _T_41 | i0_dp_raw_legal; // @[el2_dec_decode_ctl.scala 260:50]
  wire  any_csr_d = i0_dp_csr_read | i0_csr_write; // @[el2_dec_decode_ctl.scala 528:34]
  wire  _T_444 = ~any_csr_d; // @[el2_dec_decode_ctl.scala 530:40]
  wire  _T_445 = _T_444 | io_dec_csr_legal_d; // @[el2_dec_decode_ctl.scala 530:51]
  wire  i0_legal = i0_dp_legal & _T_445; // @[el2_dec_decode_ctl.scala 530:37]
  wire  _T_504 = ~i0_legal; // @[el2_dec_decode_ctl.scala 570:56]
  wire  _T_505 = i0_postsync | _T_504; // @[el2_dec_decode_ctl.scala 570:54]
  wire  _T_506 = io_dec_i0_decode_d & _T_505; // @[el2_dec_decode_ctl.scala 570:39]
  reg  postsync_stall; // @[el2_dec_decode_ctl.scala 568:53]
  reg  x_d_i0valid; // @[el2_lib.scala 524:16]
  wire  _T_507 = postsync_stall & x_d_i0valid; // @[el2_dec_decode_ctl.scala 570:88]
  wire  ps_stall_in = _T_506 | _T_507; // @[el2_dec_decode_ctl.scala 570:69]
  wire  _T_12 = ps_stall_in ^ postsync_stall; // @[el2_dec_decode_ctl.scala 217:32]
  wire  _T_13 = _T_11 | _T_12; // @[el2_dec_decode_ctl.scala 216:56]
  reg  flush_final_r; // @[el2_dec_decode_ctl.scala 616:52]
  wire  _T_14 = io_exu_flush_final ^ flush_final_r; // @[el2_dec_decode_ctl.scala 218:32]
  wire  _T_15 = _T_13 | _T_14; // @[el2_dec_decode_ctl.scala 217:56]
  wire  shift_illegal = io_dec_i0_decode_d & _T_504; // @[el2_dec_decode_ctl.scala 534:47]
  reg  illegal_lockout; // @[el2_dec_decode_ctl.scala 538:54]
  wire  _T_466 = shift_illegal | illegal_lockout; // @[el2_dec_decode_ctl.scala 537:40]
  wire  _T_467 = ~flush_final_r; // @[el2_dec_decode_ctl.scala 537:61]
  wire  illegal_lockout_in = _T_466 & _T_467; // @[el2_dec_decode_ctl.scala 537:59]
  wire  _T_16 = illegal_lockout_in ^ illegal_lockout; // @[el2_dec_decode_ctl.scala 219:32]
  wire  i0_legal_decode_d = io_dec_i0_decode_d & i0_legal; // @[el2_dec_decode_ctl.scala 644:46]
  wire  _T_33 = i0_br_error & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 243:72]
  wire  _T_36 = io_dec_i0_brp_bits_br_start_error & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 244:94]
  wire  i0_dp_raw_pm_alu = i0_dec_io_out_pm_alu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_pm_alu = _T_41 ? 1'h0 : i0_dp_raw_pm_alu; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_fence_i = i0_dec_io_out_fence_i; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_fence_i = _T_41 ? 1'h0 : i0_dp_raw_fence_i; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_fence = i0_dec_io_out_fence; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_fence = _T_41 ? 1'h0 : i0_dp_raw_fence; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rem = i0_dec_io_out_rem; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_div = i0_dec_io_out_div; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_div = _T_41 ? 1'h0 : i0_dp_raw_div; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_low = i0_dec_io_out_low; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_rs2_sign = i0_dec_io_out_rs2_sign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_rs1_sign = i0_dec_io_out_rs1_sign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_mul = i0_dec_io_out_mul; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_mul = _T_41 ? 1'h0 : i0_dp_raw_mul; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_mret = i0_dec_io_out_mret; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_mret = _T_41 ? 1'h0 : i0_dp_raw_mret; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_ecall = i0_dec_io_out_ecall; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_ecall = _T_41 ? 1'h0 : i0_dp_raw_ecall; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_ebreak = i0_dec_io_out_ebreak; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_ebreak = _T_41 ? 1'h0 : i0_dp_raw_ebreak; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_presync = i0_dec_io_out_presync; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_presync = _T_41 ? 1'h0 : i0_dp_raw_presync; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_csr_imm = i0_dec_io_out_csr_imm; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_imm = _T_41 ? 1'h0 : i0_dp_raw_csr_imm; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_csr_set = i0_dec_io_out_csr_set; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_set = _T_41 ? 1'h0 : i0_dp_raw_csr_set; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_csr_clr = i0_dec_io_out_csr_clr; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_clr = _T_41 ? 1'h0 : i0_dp_raw_csr_clr; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_word = i0_dec_io_out_word; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_word = _T_41 ? 1'h0 : i0_dp_raw_word; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_half = i0_dec_io_out_half; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_half = _T_41 ? 1'h0 : i0_dp_raw_half; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_by = i0_dec_io_out_by; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_by = _T_41 ? 1'h0 : i0_dp_raw_by; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_jal = _T_41 ? 1'h0 : i0_dp_raw_jal; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_blt = i0_dec_io_out_blt; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_bge = i0_dec_io_out_bge; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_bne = i0_dec_io_out_bne; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_beq = i0_dec_io_out_beq; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_condbr = _T_41 ? 1'h0 : i0_dp_raw_condbr; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_unsign = i0_dec_io_out_unsign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_unsign = _T_41 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_slt = i0_dec_io_out_slt; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_srl = i0_dec_io_out_srl; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_sra = i0_dec_io_out_sra; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_sll = i0_dec_io_out_sll; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_lxor = i0_dec_io_out_lxor; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_lor = i0_dec_io_out_lor; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_land = i0_dec_io_out_land; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_sub = i0_dec_io_out_sub; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_add = i0_dec_io_out_add; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_lsu = i0_dec_io_out_lsu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_lsu = _T_41 ? 1'h0 : i0_dp_raw_lsu; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_store = i0_dec_io_out_store; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_store = _T_41 ? 1'h0 : i0_dp_raw_store; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_load = i0_dec_io_out_load; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_load = _T_41 ? 1'h0 : i0_dp_raw_load; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_pc = i0_dec_io_out_pc; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_imm20 = _T_41 ? 1'h0 : i0_dp_raw_imm20; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_shimm5 = i0_dec_io_out_shimm5; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_shimm5 = _T_41 ? 1'h0 : i0_dp_raw_shimm5; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rd = i0_dec_io_out_rd; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_rd = _T_41 ? 1'h0 : i0_dp_raw_rd; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_imm12 = _T_41 ? 1'h0 : i0_dp_raw_imm12; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rs2 = i0_dec_io_out_rs2; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_rs2 = _T_41 | i0_dp_raw_rs2; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rs1 = i0_dec_io_out_rs1; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_rs1 = _T_41 | i0_dp_raw_rs1; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_alu = i0_dec_io_out_alu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_alu = _T_41 | i0_dp_raw_alu; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_pcall = i0_dp_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 412:38]
  wire  _T_44 = i0_dp_condbr | i0_pcall; // @[el2_dec_decode_ctl.scala 274:38]
  wire  i0_pja = i0_dp_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 414:38]
  wire  _T_45 = _T_44 | i0_pja; // @[el2_dec_decode_ctl.scala 274:49]
  wire  i0_pret = i0_dp_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 419:32]
  wire  i0_predict_br = _T_45 | i0_pret; // @[el2_dec_decode_ctl.scala 274:58]
  wire  _T_47 = io_dec_i0_brp_bits_hist[1] & i0_brp_valid; // @[el2_dec_decode_ctl.scala 276:55]
  wire  _T_48 = ~_T_47; // @[el2_dec_decode_ctl.scala 276:26]
  wire  i0_ap_pc2 = ~io_dec_i0_pc4_d; // @[el2_dec_decode_ctl.scala 278:20]
  wire  cam_data_reset = io_lsu_nonblock_load_data_valid | io_lsu_nonblock_load_data_error; // @[el2_dec_decode_ctl.scala 311:63]
  reg [2:0] cam_raw_0_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire [2:0] _GEN_123 = {{1'd0}, io_lsu_nonblock_load_data_tag}; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_94 = _GEN_123 == cam_raw_0_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_95 = cam_data_reset & _T_94; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_0 = _T_95 & cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_0_valid = cam_data_reset_val_0 ? 1'h0 : cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_51 = ~cam_0_valid; // @[el2_dec_decode_ctl.scala 303:78]
  reg [2:0] cam_raw_1_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_120 = _GEN_123 == cam_raw_1_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_121 = cam_data_reset & _T_120; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_1 = _T_121 & cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_1_valid = cam_data_reset_val_1 ? 1'h0 : cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_54 = ~cam_1_valid; // @[el2_dec_decode_ctl.scala 303:78]
  wire  _T_57 = cam_0_valid & _T_54; // @[el2_dec_decode_ctl.scala 303:126]
  wire [1:0] _T_59 = {io_lsu_nonblock_load_valid_m, 1'h0}; // @[el2_dec_decode_ctl.scala 303:158]
  reg [2:0] cam_raw_2_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_146 = _GEN_123 == cam_raw_2_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_147 = cam_data_reset & _T_146; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_2 = _T_147 & cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_2_valid = cam_data_reset_val_2 ? 1'h0 : cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_60 = ~cam_2_valid; // @[el2_dec_decode_ctl.scala 303:78]
  wire  _T_63 = cam_0_valid & cam_1_valid; // @[el2_dec_decode_ctl.scala 303:126]
  wire  _T_66 = _T_63 & _T_60; // @[el2_dec_decode_ctl.scala 303:126]
  wire [2:0] _T_68 = {io_lsu_nonblock_load_valid_m, 2'h0}; // @[el2_dec_decode_ctl.scala 303:158]
  reg [2:0] cam_raw_3_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_172 = _GEN_123 == cam_raw_3_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_173 = cam_data_reset & _T_172; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_3 = _T_173 & cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_3_valid = cam_data_reset_val_3 ? 1'h0 : cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_69 = ~cam_3_valid; // @[el2_dec_decode_ctl.scala 303:78]
  wire  _T_75 = _T_63 & cam_2_valid; // @[el2_dec_decode_ctl.scala 303:126]
  wire  _T_78 = _T_75 & _T_69; // @[el2_dec_decode_ctl.scala 303:126]
  wire [3:0] _T_80 = {io_lsu_nonblock_load_valid_m, 3'h0}; // @[el2_dec_decode_ctl.scala 303:158]
  wire  _T_81 = _T_51 & io_lsu_nonblock_load_valid_m; // @[Mux.scala 27:72]
  wire [1:0] _T_82 = _T_57 ? _T_59 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_83 = _T_66 ? _T_68 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_84 = _T_78 ? _T_80 : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_127 = {{1'd0}, _T_81}; // @[Mux.scala 27:72]
  wire [1:0] _T_85 = _GEN_127 | _T_82; // @[Mux.scala 27:72]
  wire [2:0] _GEN_128 = {{1'd0}, _T_85}; // @[Mux.scala 27:72]
  wire [2:0] _T_86 = _GEN_128 | _T_83; // @[Mux.scala 27:72]
  wire [3:0] _GEN_129 = {{1'd0}, _T_86}; // @[Mux.scala 27:72]
  wire [3:0] cam_wen = _GEN_129 | _T_84; // @[Mux.scala 27:72]
  reg  x_d_i0load; // @[el2_lib.scala 524:16]
  reg [4:0] x_d_i0rd; // @[el2_lib.scala 524:16]
  wire [4:0] nonblock_load_rd = x_d_i0load ? x_d_i0rd : 5'h0; // @[el2_dec_decode_ctl.scala 314:31]
  reg [2:0] _T_701; // @[el2_dec_decode_ctl.scala 652:72]
  wire [3:0] i0_pipe_en = {io_dec_i0_decode_d,_T_701}; // @[Cat.scala 29:58]
  wire  _T_707 = |i0_pipe_en[2:1]; // @[el2_dec_decode_ctl.scala 655:49]
  wire  i0_r_ctl_en = _T_707 | io_clk_override; // @[el2_dec_decode_ctl.scala 655:53]
  reg  nonblock_load_valid_m_delay; // @[Reg.scala 27:20]
  reg  r_d_i0load; // @[el2_lib.scala 524:16]
  wire  i0_load_kill_wen_r = nonblock_load_valid_m_delay & r_d_i0load; // @[el2_dec_decode_ctl.scala 319:56]
  wire [2:0] _GEN_130 = {{1'd0}, io_lsu_nonblock_load_inv_tag_r}; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_91 = _GEN_130 == cam_raw_0_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_92 = io_lsu_nonblock_load_inv_r & _T_91; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_0 = _T_92 & cam_0_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg  r_d_i0v; // @[el2_lib.scala 524:16]
  wire  _T_743 = ~io_dec_tlu_flush_lower_wb; // @[el2_dec_decode_ctl.scala 687:41]
  wire  r_d_in_i0v = r_d_i0v & _T_743; // @[el2_dec_decode_ctl.scala 687:39]
  wire  _T_754 = ~io_dec_tlu_i0_kill_writeb_r; // @[el2_dec_decode_ctl.scala 695:42]
  wire  i0_wen_r = r_d_in_i0v & _T_754; // @[el2_dec_decode_ctl.scala 695:40]
  reg [4:0] r_d_i0rd; // @[el2_lib.scala 524:16]
  reg [4:0] cam_raw_0_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_103 = r_d_i0rd == cam_raw_0_bits_rd; // @[el2_dec_decode_ctl.scala 334:80]
  wire  _T_104 = i0_wen_r & _T_103; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_0_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_106 = _T_104 & cam_raw_0_bits_wb; // @[el2_dec_decode_ctl.scala 334:100]
  wire  _T_107 = cam_inv_reset_val_0 | _T_106; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_52 = _T_107 ? 1'h0 : cam_0_valid; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_55 = _T_107 ? 1'h0 : cam_raw_0_bits_wb; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_56 = cam_wen[0] | _GEN_52; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_57 = cam_wen[0] ? 1'h0 : _GEN_55; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_110 = nonblock_load_valid_m_delay & _T_91; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_112 = _T_110 & cam_0_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_0 = _T_94 & cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_117 = _GEN_130 == cam_raw_1_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_118 = io_lsu_nonblock_load_inv_r & _T_117; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_1 = _T_118 & cam_1_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg [4:0] cam_raw_1_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_129 = r_d_i0rd == cam_raw_1_bits_rd; // @[el2_dec_decode_ctl.scala 334:80]
  wire  _T_130 = i0_wen_r & _T_129; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_1_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_132 = _T_130 & cam_raw_1_bits_wb; // @[el2_dec_decode_ctl.scala 334:100]
  wire  _T_133 = cam_inv_reset_val_1 | _T_132; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_63 = _T_133 ? 1'h0 : cam_1_valid; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_66 = _T_133 ? 1'h0 : cam_raw_1_bits_wb; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_67 = cam_wen[1] | _GEN_63; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_68 = cam_wen[1] ? 1'h0 : _GEN_66; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_136 = nonblock_load_valid_m_delay & _T_117; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_138 = _T_136 & cam_1_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_1 = _T_120 & cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_143 = _GEN_130 == cam_raw_2_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_144 = io_lsu_nonblock_load_inv_r & _T_143; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_2 = _T_144 & cam_2_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg [4:0] cam_raw_2_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_155 = r_d_i0rd == cam_raw_2_bits_rd; // @[el2_dec_decode_ctl.scala 334:80]
  wire  _T_156 = i0_wen_r & _T_155; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_2_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_158 = _T_156 & cam_raw_2_bits_wb; // @[el2_dec_decode_ctl.scala 334:100]
  wire  _T_159 = cam_inv_reset_val_2 | _T_158; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_74 = _T_159 ? 1'h0 : cam_2_valid; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_77 = _T_159 ? 1'h0 : cam_raw_2_bits_wb; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_78 = cam_wen[2] | _GEN_74; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_79 = cam_wen[2] ? 1'h0 : _GEN_77; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_162 = nonblock_load_valid_m_delay & _T_143; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_164 = _T_162 & cam_2_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_2 = _T_146 & cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_169 = _GEN_130 == cam_raw_3_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_170 = io_lsu_nonblock_load_inv_r & _T_169; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_3 = _T_170 & cam_3_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg [4:0] cam_raw_3_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_181 = r_d_i0rd == cam_raw_3_bits_rd; // @[el2_dec_decode_ctl.scala 334:80]
  wire  _T_182 = i0_wen_r & _T_181; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_3_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_184 = _T_182 & cam_raw_3_bits_wb; // @[el2_dec_decode_ctl.scala 334:100]
  wire  _T_185 = cam_inv_reset_val_3 | _T_184; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_85 = _T_185 ? 1'h0 : cam_3_valid; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_88 = _T_185 ? 1'h0 : cam_raw_3_bits_wb; // @[el2_dec_decode_ctl.scala 334:126]
  wire  _GEN_89 = cam_wen[3] | _GEN_85; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_90 = cam_wen[3] ? 1'h0 : _GEN_88; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_188 = nonblock_load_valid_m_delay & _T_169; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_190 = _T_188 & cam_3_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_3 = _T_172 & cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_195 = r_d_i0rd == io_dec_nonblock_load_waddr; // @[el2_dec_decode_ctl.scala 353:44]
  wire  nonblock_load_cancel = _T_195 & i0_wen_r; // @[el2_dec_decode_ctl.scala 353:76]
  wire  _T_196 = nonblock_load_write_0 | nonblock_load_write_1; // @[el2_dec_decode_ctl.scala 354:95]
  wire  _T_197 = _T_196 | nonblock_load_write_2; // @[el2_dec_decode_ctl.scala 354:95]
  wire  _T_198 = _T_197 | nonblock_load_write_3; // @[el2_dec_decode_ctl.scala 354:95]
  wire  _T_200 = io_lsu_nonblock_load_data_valid & _T_198; // @[el2_dec_decode_ctl.scala 354:64]
  wire  _T_201 = ~nonblock_load_cancel; // @[el2_dec_decode_ctl.scala 354:109]
  wire  _T_203 = nonblock_load_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 355:54]
  wire  _T_204 = _T_203 & io_lsu_nonblock_load_valid_m; // @[el2_dec_decode_ctl.scala 355:66]
  wire  _T_205 = _T_204 & io_dec_i0_rs1_en_d; // @[el2_dec_decode_ctl.scala 355:97]
  wire [4:0] i0r_rs2 = io_dec_i0_instr_d[24:20]; // @[el2_dec_decode_ctl.scala 621:16]
  wire  _T_206 = nonblock_load_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 355:137]
  wire  _T_207 = _T_206 & io_lsu_nonblock_load_valid_m; // @[el2_dec_decode_ctl.scala 355:149]
  wire  _T_208 = _T_207 & io_dec_i0_rs2_en_d; // @[el2_dec_decode_ctl.scala 355:180]
  wire  i0_nonblock_boundary_stall = _T_205 | _T_208; // @[el2_dec_decode_ctl.scala 355:118]
  wire [4:0] _T_210 = nonblock_load_write_0 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_211 = _T_210 & cam_raw_0_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_212 = io_dec_i0_rs1_en_d & cam_0_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_213 = cam_raw_0_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_214 = _T_212 & _T_213; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_215 = io_dec_i0_rs2_en_d & cam_0_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_216 = cam_raw_0_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_217 = _T_215 & _T_216; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_219 = nonblock_load_write_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_220 = _T_219 & cam_raw_1_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_221 = io_dec_i0_rs1_en_d & cam_1_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_222 = cam_raw_1_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_223 = _T_221 & _T_222; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_224 = io_dec_i0_rs2_en_d & cam_1_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_225 = cam_raw_1_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_226 = _T_224 & _T_225; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_228 = nonblock_load_write_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_229 = _T_228 & cam_raw_2_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_230 = io_dec_i0_rs1_en_d & cam_2_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_231 = cam_raw_2_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_232 = _T_230 & _T_231; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_233 = io_dec_i0_rs2_en_d & cam_2_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_234 = cam_raw_2_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_235 = _T_233 & _T_234; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_237 = nonblock_load_write_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_238 = _T_237 & cam_raw_3_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_239 = io_dec_i0_rs1_en_d & cam_3_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_240 = cam_raw_3_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_241 = _T_239 & _T_240; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_242 = io_dec_i0_rs2_en_d & cam_3_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_243 = cam_raw_3_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_244 = _T_242 & _T_243; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_245 = _T_211 | _T_220; // @[el2_dec_decode_ctl.scala 360:69]
  wire [4:0] _T_246 = _T_245 | _T_229; // @[el2_dec_decode_ctl.scala 360:69]
  wire  _T_247 = _T_214 | _T_223; // @[el2_dec_decode_ctl.scala 360:102]
  wire  _T_248 = _T_247 | _T_232; // @[el2_dec_decode_ctl.scala 360:102]
  wire  ld_stall_1 = _T_248 | _T_241; // @[el2_dec_decode_ctl.scala 360:102]
  wire  _T_249 = _T_217 | _T_226; // @[el2_dec_decode_ctl.scala 360:134]
  wire  _T_250 = _T_249 | _T_235; // @[el2_dec_decode_ctl.scala 360:134]
  wire  ld_stall_2 = _T_250 | _T_244; // @[el2_dec_decode_ctl.scala 360:134]
  wire  _T_251 = ld_stall_1 | ld_stall_2; // @[el2_dec_decode_ctl.scala 362:38]
  wire  i0_nonblock_load_stall = _T_251 | i0_nonblock_boundary_stall; // @[el2_dec_decode_ctl.scala 362:51]
  wire  _T_253 = ~i0_predict_br; // @[el2_dec_decode_ctl.scala 371:34]
  wire [3:0] _T_255 = i0_legal_decode_d ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire  csr_read = i0_dp_csr_read & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 455:36]
  wire  _T_256 = csr_read & io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 383:16]
  wire  _T_258 = ~csr_read; // @[el2_dec_decode_ctl.scala 384:6]
  wire  _T_259 = _T_258 & io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 384:16]
  wire  _T_261 = ~io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 385:18]
  wire  _T_262 = csr_read & _T_261; // @[el2_dec_decode_ctl.scala 385:16]
  wire [3:0] _T_264 = i0_dp_mul ? 4'h1 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _T_265 = i0_dp_load ? 4'h2 : _T_264; // @[Mux.scala 98:16]
  wire [3:0] _T_266 = i0_dp_store ? 4'h3 : _T_265; // @[Mux.scala 98:16]
  wire [3:0] _T_267 = i0_dp_pm_alu ? 4'h4 : _T_266; // @[Mux.scala 98:16]
  wire [3:0] _T_268 = _T_262 ? 4'h5 : _T_267; // @[Mux.scala 98:16]
  wire [3:0] _T_269 = _T_259 ? 4'h6 : _T_268; // @[Mux.scala 98:16]
  wire [3:0] _T_270 = _T_256 ? 4'h7 : _T_269; // @[Mux.scala 98:16]
  wire [3:0] _T_271 = i0_dp_ebreak ? 4'h8 : _T_270; // @[Mux.scala 98:16]
  wire [3:0] _T_272 = i0_dp_ecall ? 4'h9 : _T_271; // @[Mux.scala 98:16]
  wire [3:0] _T_273 = i0_dp_fence ? 4'ha : _T_272; // @[Mux.scala 98:16]
  wire [3:0] _T_274 = i0_dp_fence_i ? 4'hb : _T_273; // @[Mux.scala 98:16]
  wire [3:0] _T_275 = i0_dp_mret ? 4'hc : _T_274; // @[Mux.scala 98:16]
  wire [3:0] _T_276 = i0_dp_condbr ? 4'hd : _T_275; // @[Mux.scala 98:16]
  wire [3:0] _T_277 = i0_dp_jal ? 4'he : _T_276; // @[Mux.scala 98:16]
  reg  lsu_idle; // @[el2_dec_decode_ctl.scala 396:45]
  wire  _T_333 = ~i0_pcall_case; // @[el2_dec_decode_ctl.scala 420:35]
  wire  _T_334 = i0_dp_jal & _T_333; // @[el2_dec_decode_ctl.scala 420:32]
  wire  _T_335 = ~i0_pja_case; // @[el2_dec_decode_ctl.scala 420:52]
  wire  _T_336 = _T_334 & _T_335; // @[el2_dec_decode_ctl.scala 420:50]
  wire  _T_337 = ~i0_pret_case; // @[el2_dec_decode_ctl.scala 420:67]
  reg  _T_339; // @[el2_dec_decode_ctl.scala 432:58]
  wire  lsu_decode_d = i0_legal_decode_d & i0_dp_lsu; // @[el2_dec_decode_ctl.scala 574:40]
  wire  _T_902 = i0_dp_load | i0_dp_store; // @[el2_dec_decode_ctl.scala 788:43]
  reg  x_d_i0v; // @[el2_lib.scala 524:16]
  wire  _T_876 = io_dec_i0_rs1_en_d & x_d_i0v; // @[el2_dec_decode_ctl.scala 768:48]
  wire  _T_877 = x_d_i0rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 768:70]
  wire  i0_rs1_depend_i0_x = _T_876 & _T_877; // @[el2_dec_decode_ctl.scala 768:58]
  wire  _T_878 = io_dec_i0_rs1_en_d & r_d_i0v; // @[el2_dec_decode_ctl.scala 769:48]
  wire  _T_879 = r_d_i0rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 769:70]
  wire  i0_rs1_depend_i0_r = _T_878 & _T_879; // @[el2_dec_decode_ctl.scala 769:58]
  wire [1:0] _T_891 = i0_rs1_depend_i0_r ? 2'h2 : 2'h0; // @[el2_dec_decode_ctl.scala 775:63]
  wire [1:0] i0_rs1_depth_d = i0_rs1_depend_i0_x ? 2'h1 : _T_891; // @[el2_dec_decode_ctl.scala 775:24]
  wire  _T_904 = _T_902 & i0_rs1_depth_d[0]; // @[el2_dec_decode_ctl.scala 788:58]
  reg  i0_x_c_load; // @[Reg.scala 15:16]
  reg  i0_r_c_load; // @[Reg.scala 15:16]
  wire  _T_887_load = i0_rs1_depend_i0_r & i0_r_c_load; // @[el2_dec_decode_ctl.scala 774:61]
  wire  i0_rs1_class_d_load = i0_rs1_depend_i0_x ? i0_x_c_load : _T_887_load; // @[el2_dec_decode_ctl.scala 774:24]
  wire  load_ldst_bypass_d = _T_904 & i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 788:78]
  wire  _T_880 = io_dec_i0_rs2_en_d & x_d_i0v; // @[el2_dec_decode_ctl.scala 771:48]
  wire  _T_881 = x_d_i0rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 771:70]
  wire  i0_rs2_depend_i0_x = _T_880 & _T_881; // @[el2_dec_decode_ctl.scala 771:58]
  wire  _T_882 = io_dec_i0_rs2_en_d & r_d_i0v; // @[el2_dec_decode_ctl.scala 772:48]
  wire  _T_883 = r_d_i0rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 772:70]
  wire  i0_rs2_depend_i0_r = _T_882 & _T_883; // @[el2_dec_decode_ctl.scala 772:58]
  wire [1:0] _T_900 = i0_rs2_depend_i0_r ? 2'h2 : 2'h0; // @[el2_dec_decode_ctl.scala 777:63]
  wire [1:0] i0_rs2_depth_d = i0_rs2_depend_i0_x ? 2'h1 : _T_900; // @[el2_dec_decode_ctl.scala 777:24]
  wire  _T_907 = i0_dp_store & i0_rs2_depth_d[0]; // @[el2_dec_decode_ctl.scala 789:43]
  wire  _T_896_load = i0_rs2_depend_i0_r & i0_r_c_load; // @[el2_dec_decode_ctl.scala 776:61]
  wire  i0_rs2_class_d_load = i0_rs2_depend_i0_x ? i0_x_c_load : _T_896_load; // @[el2_dec_decode_ctl.scala 776:24]
  wire  store_data_bypass_d = _T_907 & i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 789:63]
  wire  _T_349 = i0_dp_csr_clr | i0_dp_csr_set; // @[el2_dec_decode_ctl.scala 463:42]
  reg  r_d_csrwen; // @[el2_lib.scala 524:16]
  reg  r_d_i0valid; // @[el2_lib.scala 524:16]
  wire  _T_352 = r_d_csrwen & r_d_i0valid; // @[el2_dec_decode_ctl.scala 471:34]
  reg [11:0] r_d_csrwaddr; // @[el2_lib.scala 524:16]
  wire  _T_355 = r_d_csrwaddr == 12'h300; // @[el2_dec_decode_ctl.scala 474:45]
  wire  _T_356 = r_d_csrwaddr == 12'h304; // @[el2_dec_decode_ctl.scala 474:75]
  wire  _T_357 = _T_355 | _T_356; // @[el2_dec_decode_ctl.scala 474:59]
  wire  _T_358 = _T_357 & r_d_csrwen; // @[el2_dec_decode_ctl.scala 474:90]
  wire  _T_359 = _T_358 & r_d_i0valid; // @[el2_dec_decode_ctl.scala 474:103]
  wire  _T_360 = ~io_dec_tlu_i0_kill_writeb_wb; // @[el2_dec_decode_ctl.scala 474:119]
  reg  csr_read_x; // @[el2_dec_decode_ctl.scala 476:52]
  reg  csr_clr_x; // @[el2_dec_decode_ctl.scala 477:51]
  reg  csr_set_x; // @[el2_dec_decode_ctl.scala 478:51]
  reg  csr_write_x; // @[el2_dec_decode_ctl.scala 479:53]
  reg  csr_imm_x; // @[el2_dec_decode_ctl.scala 480:51]
  wire  i0_x_data_en = i0_pipe_en[3] | io_clk_override; // @[el2_dec_decode_ctl.scala 657:50]
  reg [4:0] csrimm_x; // @[el2_lib.scala 514:16]
  reg [31:0] csr_rddata_x; // @[el2_lib.scala 514:16]
  wire [31:0] _T_394 = {27'h0,csrimm_x}; // @[Cat.scala 29:58]
  wire  _T_396 = ~csr_imm_x; // @[el2_dec_decode_ctl.scala 488:5]
  wire [31:0] _T_397 = csr_imm_x ? _T_394 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_398 = _T_396 ? io_exu_csr_rs1_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] csr_mask_x = _T_397 | _T_398; // @[Mux.scala 27:72]
  wire [31:0] _T_400 = ~csr_mask_x; // @[el2_dec_decode_ctl.scala 491:38]
  wire [31:0] _T_401 = csr_rddata_x & _T_400; // @[el2_dec_decode_ctl.scala 491:35]
  wire [31:0] _T_402 = csr_rddata_x | csr_mask_x; // @[el2_dec_decode_ctl.scala 492:35]
  wire [31:0] _T_403 = csr_clr_x ? _T_401 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = csr_set_x ? _T_402 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_405 = csr_write_x ? csr_mask_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_406 = _T_403 | _T_404; // @[Mux.scala 27:72]
  wire [31:0] write_csr_data_x = _T_406 | _T_405; // @[Mux.scala 27:72]
  wire  _T_418 = ~tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 502:44]
  wire  _T_419 = ~tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 502:64]
  wire  _T_420 = _T_418 & _T_419; // @[el2_dec_decode_ctl.scala 502:61]
  wire [31:0] _T_423 = write_csr_data - 32'h1; // @[el2_dec_decode_ctl.scala 505:59]
  wire  _T_425 = csr_clr_x | csr_set_x; // @[el2_dec_decode_ctl.scala 507:34]
  wire  _T_426 = _T_425 | csr_write_x; // @[el2_dec_decode_ctl.scala 507:46]
  wire  _T_427 = _T_426 & csr_read_x; // @[el2_dec_decode_ctl.scala 507:61]
  wire  _T_428 = _T_427 | io_dec_tlu_wr_pause_r; // @[el2_dec_decode_ctl.scala 507:75]
  reg  r_d_csrwonly; // @[el2_lib.scala 524:16]
  wire  _T_764 = r_d_i0v & r_d_i0load; // @[el2_dec_decode_ctl.scala 710:37]
  reg [31:0] i0_result_r_raw; // @[el2_lib.scala 514:16]
  wire [31:0] i0_result_corr_r = _T_764 ? io_lsu_result_corr_r : i0_result_r_raw; // @[el2_dec_decode_ctl.scala 710:27]
  reg  x_d_csrwonly; // @[el2_lib.scala 524:16]
  wire  _T_432 = x_d_csrwonly | r_d_csrwonly; // @[el2_dec_decode_ctl.scala 516:38]
  reg  wbd_csrwonly; // @[el2_lib.scala 524:16]
  wire  prior_csr_write = _T_432 | wbd_csrwonly; // @[el2_dec_decode_ctl.scala 516:53]
  wire  debug_fence_raw = io_dec_debug_fence_d & io_dbg_cmd_wrdata[1]; // @[el2_dec_decode_ctl.scala 519:48]
  wire  debug_fence = debug_fence_raw | debug_fence_i; // @[el2_dec_decode_ctl.scala 520:40]
  wire  _T_436 = i0_dp_presync | io_dec_tlu_presync_d; // @[el2_dec_decode_ctl.scala 523:34]
  wire  _T_437 = _T_436 | debug_fence_i; // @[el2_dec_decode_ctl.scala 523:57]
  wire  _T_438 = _T_437 | debug_fence_raw; // @[el2_dec_decode_ctl.scala 523:73]
  wire  i0_presync = _T_438 | io_dec_tlu_pipelining_disable; // @[el2_dec_decode_ctl.scala 523:91]
  wire [31:0] _T_462 = {16'h0,io_ifu_i0_cinst}; // @[Cat.scala 29:58]
  wire  _T_464 = ~illegal_lockout; // @[el2_dec_decode_ctl.scala 535:44]
  reg [31:0] _T_465; // @[el2_lib.scala 514:16]
  wire  i0_div_prior_div_stall = i0_dp_div & io_dec_div_active; // @[el2_dec_decode_ctl.scala 539:42]
  wire  _T_470 = i0_dp_csr_read & prior_csr_write; // @[el2_dec_decode_ctl.scala 541:40]
  wire  _T_471 = _T_470 | io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 541:59]
  wire  _T_472 = _T_471 | pause_stall; // @[el2_dec_decode_ctl.scala 541:81]
  wire  _T_473 = _T_472 | leak1_i0_stall; // @[el2_dec_decode_ctl.scala 541:95]
  wire  _T_474 = _T_473 | io_dec_tlu_debug_stall; // @[el2_dec_decode_ctl.scala 542:20]
  wire  _T_475 = _T_474 | postsync_stall; // @[el2_dec_decode_ctl.scala 542:45]
  wire  prior_inflight = x_d_i0valid | r_d_i0valid; // @[el2_dec_decode_ctl.scala 564:41]
  wire  prior_inflight_eff = i0_dp_div ? x_d_i0valid : prior_inflight; // @[el2_dec_decode_ctl.scala 565:31]
  wire  presync_stall = i0_presync & prior_inflight_eff; // @[el2_dec_decode_ctl.scala 567:37]
  wire  _T_476 = _T_475 | presync_stall; // @[el2_dec_decode_ctl.scala 542:62]
  wire  _T_477 = i0_dp_fence | debug_fence; // @[el2_dec_decode_ctl.scala 543:19]
  wire  _T_478 = ~lsu_idle; // @[el2_dec_decode_ctl.scala 543:36]
  wire  _T_479 = _T_477 & _T_478; // @[el2_dec_decode_ctl.scala 543:34]
  wire  _T_480 = _T_476 | _T_479; // @[el2_dec_decode_ctl.scala 542:79]
  wire  _T_481 = _T_480 | i0_nonblock_load_stall; // @[el2_dec_decode_ctl.scala 543:47]
  wire  _T_822 = io_dec_i0_rs1_en_d & io_dec_div_active; // @[el2_dec_decode_ctl.scala 738:49]
  wire  _T_823 = io_div_waddr_wb == i0r_rs1; // @[el2_dec_decode_ctl.scala 738:88]
  wire  _T_824 = _T_822 & _T_823; // @[el2_dec_decode_ctl.scala 738:69]
  wire  _T_825 = io_dec_i0_rs2_en_d & io_dec_div_active; // @[el2_dec_decode_ctl.scala 739:25]
  wire  _T_826 = io_div_waddr_wb == i0r_rs2; // @[el2_dec_decode_ctl.scala 739:64]
  wire  _T_827 = _T_825 & _T_826; // @[el2_dec_decode_ctl.scala 739:45]
  wire  i0_nonblock_div_stall = _T_824 | _T_827; // @[el2_dec_decode_ctl.scala 738:102]
  wire  _T_483 = _T_481 | i0_nonblock_div_stall; // @[el2_dec_decode_ctl.scala 544:21]
  wire  i0_block_raw_d = _T_483 | i0_div_prior_div_stall; // @[el2_dec_decode_ctl.scala 544:45]
  wire  _T_484 = io_lsu_store_stall_any | io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 546:65]
  wire  i0_store_stall_d = i0_dp_store & _T_484; // @[el2_dec_decode_ctl.scala 546:39]
  wire  _T_485 = io_lsu_load_stall_any | io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 547:63]
  wire  i0_load_stall_d = i0_dp_load & _T_485; // @[el2_dec_decode_ctl.scala 547:38]
  wire  _T_486 = i0_block_raw_d | i0_store_stall_d; // @[el2_dec_decode_ctl.scala 548:38]
  wire  i0_block_d = _T_486 | i0_load_stall_d; // @[el2_dec_decode_ctl.scala 548:57]
  wire  _T_487 = ~i0_block_d; // @[el2_dec_decode_ctl.scala 552:46]
  wire  _T_488 = io_dec_ib0_valid_d & _T_487; // @[el2_dec_decode_ctl.scala 552:44]
  wire  _T_490 = _T_488 & _T_280; // @[el2_dec_decode_ctl.scala 552:61]
  wire  _T_493 = ~i0_block_raw_d; // @[el2_dec_decode_ctl.scala 553:46]
  wire  _T_494 = io_dec_ib0_valid_d & _T_493; // @[el2_dec_decode_ctl.scala 553:44]
  wire  _T_496 = _T_494 & _T_280; // @[el2_dec_decode_ctl.scala 553:61]
  wire  i0_exudecode_d = _T_496 & _T_467; // @[el2_dec_decode_ctl.scala 553:89]
  wire  i0_exulegal_decode_d = i0_exudecode_d & i0_legal; // @[el2_dec_decode_ctl.scala 554:46]
  wire  _T_498 = ~io_dec_i0_decode_d; // @[el2_dec_decode_ctl.scala 558:51]
  wire  _T_517 = i0_dp_fence_i | debug_fence_i; // @[el2_dec_decode_ctl.scala 586:44]
  wire [3:0] _T_522 = {io_dec_i0_decode_d,io_dec_i0_decode_d,io_dec_i0_decode_d,io_dec_i0_decode_d}; // @[Cat.scala 29:58]
  wire  _T_704 = |i0_pipe_en[3:2]; // @[el2_dec_decode_ctl.scala 654:49]
  wire  i0_x_ctl_en = _T_704 | io_clk_override; // @[el2_dec_decode_ctl.scala 654:53]
  reg  x_t_legal; // @[el2_lib.scala 524:16]
  reg  x_t_icaf; // @[el2_lib.scala 524:16]
  reg  x_t_icaf_f1; // @[el2_lib.scala 524:16]
  reg [1:0] x_t_icaf_type; // @[el2_lib.scala 524:16]
  reg  x_t_fence_i; // @[el2_lib.scala 524:16]
  reg [3:0] x_t_i0trigger; // @[el2_lib.scala 524:16]
  reg [3:0] x_t_pmu_i0_itype; // @[el2_lib.scala 524:16]
  reg  x_t_pmu_i0_br_unpred; // @[el2_lib.scala 524:16]
  wire [3:0] _T_530 = {io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb}; // @[Cat.scala 29:58]
  wire [3:0] _T_531 = ~_T_530; // @[el2_dec_decode_ctl.scala 599:39]
  reg  r_t_legal; // @[el2_lib.scala 524:16]
  reg  r_t_icaf; // @[el2_lib.scala 524:16]
  reg  r_t_icaf_f1; // @[el2_lib.scala 524:16]
  reg [1:0] r_t_icaf_type; // @[el2_lib.scala 524:16]
  reg  r_t_fence_i; // @[el2_lib.scala 524:16]
  reg [3:0] r_t_i0trigger; // @[el2_lib.scala 524:16]
  reg [3:0] r_t_pmu_i0_itype; // @[el2_lib.scala 524:16]
  reg  r_t_pmu_i0_br_unpred; // @[el2_lib.scala 524:16]
  reg [3:0] lsu_trigger_match_r; // @[el2_dec_decode_ctl.scala 602:36]
  reg  lsu_pmu_misaligned_r; // @[el2_dec_decode_ctl.scala 603:37]
  reg  r_d_i0store; // @[el2_lib.scala 524:16]
  wire  _T_536 = r_d_i0load | r_d_i0store; // @[el2_dec_decode_ctl.scala 607:56]
  wire [3:0] _T_540 = {_T_536,_T_536,_T_536,_T_536}; // @[Cat.scala 29:58]
  wire [3:0] _T_541 = _T_540 & lsu_trigger_match_r; // @[el2_dec_decode_ctl.scala 607:72]
  wire [3:0] _T_542 = _T_541 | r_t_i0trigger; // @[el2_dec_decode_ctl.scala 607:95]
  reg  r_d_i0div; // @[el2_lib.scala 524:16]
  wire  _T_545 = r_d_i0div & r_d_i0valid; // @[el2_dec_decode_ctl.scala 613:53]
  wire  _T_556 = i0r_rs1 != 5'h0; // @[el2_dec_decode_ctl.scala 624:49]
  wire  _T_558 = i0r_rs2 != 5'h0; // @[el2_dec_decode_ctl.scala 625:49]
  wire  _T_560 = i0r_rd != 5'h0; // @[el2_dec_decode_ctl.scala 626:48]
  wire  i0_rd_en_d = i0_dp_rd & _T_560; // @[el2_dec_decode_ctl.scala 626:37]
  wire  i0_jalimm20 = i0_dp_jal & i0_dp_imm20; // @[el2_dec_decode_ctl.scala 630:38]
  wire  _T_561 = ~i0_dp_jal; // @[el2_dec_decode_ctl.scala 631:27]
  wire  i0_uiimm20 = _T_561 & i0_dp_imm20; // @[el2_dec_decode_ctl.scala 631:38]
  wire [31:0] _T_563 = i0_dp_csr_read ? io_dec_csr_rddata_d : 32'h0; // @[Mux.scala 27:72]
  wire [9:0] _T_577 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31]}; // @[Cat.scala 29:58]
  wire [18:0] _T_586 = {_T_577,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31]}; // @[Cat.scala 29:58]
  wire [31:0] _T_589 = {_T_586,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31:20]}; // @[Cat.scala 29:58]
  wire [31:0] _T_684 = i0_dp_imm12 ? _T_589 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_618 = {27'h0,i0r_rs2}; // @[Cat.scala 29:58]
  wire [31:0] _T_685 = i0_dp_shimm5 ? _T_618 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_689 = _T_684 | _T_685; // @[Mux.scala 27:72]
  wire [31:0] _T_638 = {_T_577,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_686 = i0_jalimm20 ? _T_638 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_690 = _T_689 | _T_686; // @[Mux.scala 27:72]
  wire [31:0] _T_652 = {io_dec_i0_instr_d[31:12],12'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_687 = i0_uiimm20 ? _T_652 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_691 = _T_690 | _T_687; // @[Mux.scala 27:72]
  wire  _T_653 = i0_csr_write_only_d & i0_dp_csr_imm; // @[el2_dec_decode_ctl.scala 642:26]
  wire [31:0] _T_683 = {27'h0,i0r_rs1}; // @[Cat.scala 29:58]
  wire [31:0] _T_688 = _T_653 ? _T_683 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_immed_d = _T_691 | _T_688; // @[Mux.scala 27:72]
  wire [31:0] _T_564 = _T_347 ? i0_immed_d : 32'h0; // @[Mux.scala 27:72]
  wire  i0_d_c_mul = i0_dp_mul & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 646:44]
  wire  i0_d_c_load = i0_dp_load & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 647:44]
  wire  i0_d_c_alu = i0_dp_alu & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 648:44]
  reg  i0_x_c_mul; // @[Reg.scala 15:16]
  reg  i0_x_c_alu; // @[Reg.scala 15:16]
  reg  i0_r_c_mul; // @[Reg.scala 15:16]
  reg  i0_r_c_alu; // @[Reg.scala 15:16]
  wire  _T_710 = |i0_pipe_en[1:0]; // @[el2_dec_decode_ctl.scala 656:49]
  wire  i0_r_data_en = i0_pipe_en[2] | io_clk_override; // @[el2_dec_decode_ctl.scala 658:50]
  reg  x_d_i0store; // @[el2_lib.scala 524:16]
  reg  x_d_i0div; // @[el2_lib.scala 524:16]
  reg  x_d_csrwen; // @[el2_lib.scala 524:16]
  reg [11:0] x_d_csrwaddr; // @[el2_lib.scala 524:16]
  wire  _T_733 = x_d_i0v & _T_743; // @[el2_dec_decode_ctl.scala 680:37]
  wire  _T_737 = x_d_i0valid & _T_743; // @[el2_dec_decode_ctl.scala 681:37]
  wire  _T_756 = ~r_d_i0div; // @[el2_dec_decode_ctl.scala 696:49]
  wire  _T_757 = i0_wen_r & _T_756; // @[el2_dec_decode_ctl.scala 696:47]
  wire  _T_758 = ~i0_load_kill_wen_r; // @[el2_dec_decode_ctl.scala 696:65]
  wire  _T_761 = x_d_i0v & x_d_i0load; // @[el2_dec_decode_ctl.scala 705:42]
  wire  _T_768 = io_i0_ap_predict_nt & _T_561; // @[el2_dec_decode_ctl.scala 711:52]
  wire [11:0] _T_781 = {10'h0,io_dec_i0_pc4_d,i0_ap_pc2}; // @[Cat.scala 29:58]
  reg [11:0] last_br_immed_x; // @[el2_lib.scala 514:16]
  wire  _T_799 = x_d_i0div & x_d_i0valid; // @[el2_dec_decode_ctl.scala 719:40]
  wire  div_e1_to_r = _T_799 | _T_545; // @[el2_dec_decode_ctl.scala 719:55]
  wire  _T_802 = x_d_i0rd == 5'h0; // @[el2_dec_decode_ctl.scala 721:69]
  wire  _T_803 = _T_799 & _T_802; // @[el2_dec_decode_ctl.scala 721:57]
  wire  _T_805 = _T_799 & io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 722:30]
  wire  _T_806 = _T_803 | _T_805; // @[el2_dec_decode_ctl.scala 721:86]
  wire  _T_808 = _T_545 & io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 723:30]
  wire  _T_809 = _T_808 & io_dec_tlu_i0_kill_writeb_r; // @[el2_dec_decode_ctl.scala 723:57]
  wire  div_flush = _T_806 | _T_809; // @[el2_dec_decode_ctl.scala 722:59]
  wire  _T_810 = io_dec_div_active & div_flush; // @[el2_dec_decode_ctl.scala 727:51]
  wire  _T_811 = ~div_e1_to_r; // @[el2_dec_decode_ctl.scala 728:26]
  wire  _T_812 = io_dec_div_active & _T_811; // @[el2_dec_decode_ctl.scala 728:24]
  wire  _T_813 = r_d_i0rd == io_div_waddr_wb; // @[el2_dec_decode_ctl.scala 728:51]
  wire  _T_814 = _T_812 & _T_813; // @[el2_dec_decode_ctl.scala 728:39]
  wire  _T_815 = _T_814 & i0_wen_r; // @[el2_dec_decode_ctl.scala 728:72]
  wire  nonblock_div_cancel = _T_810 | _T_815; // @[el2_dec_decode_ctl.scala 727:65]
  wire  i0_div_decode_d = i0_legal_decode_d & i0_dp_div; // @[el2_dec_decode_ctl.scala 731:55]
  wire  _T_817 = ~io_exu_div_wren; // @[el2_dec_decode_ctl.scala 733:62]
  wire  _T_818 = io_dec_div_active & _T_817; // @[el2_dec_decode_ctl.scala 733:60]
  wire  _T_819 = ~nonblock_div_cancel; // @[el2_dec_decode_ctl.scala 733:81]
  wire  _T_820 = _T_818 & _T_819; // @[el2_dec_decode_ctl.scala 733:79]
  reg  _T_821; // @[el2_dec_decode_ctl.scala 735:54]
  reg [4:0] _T_830; // @[Reg.scala 27:20]
  reg [31:0] i0_inst_x; // @[el2_lib.scala 514:16]
  reg [31:0] i0_inst_r; // @[el2_lib.scala 514:16]
  reg [31:0] i0_inst_wb; // @[el2_lib.scala 514:16]
  reg [31:0] _T_837; // @[el2_lib.scala 514:16]
  reg [30:0] i0_pc_wb; // @[el2_lib.scala 514:16]
  reg [30:0] _T_840; // @[el2_lib.scala 514:16]
  reg [30:0] dec_i0_pc_r; // @[el2_lib.scala 514:16]
  wire [31:0] _T_842 = {io_exu_i0_pc_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_843 = {last_br_immed_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_846 = _T_842[12:1] + _T_843[12:1]; // @[el2_lib.scala 208:31]
  wire [18:0] _T_849 = _T_842[31:13] + 19'h1; // @[el2_lib.scala 209:27]
  wire [18:0] _T_852 = _T_842[31:13] - 19'h1; // @[el2_lib.scala 210:27]
  wire  _T_855 = ~_T_846[12]; // @[el2_lib.scala 212:28]
  wire  _T_856 = _T_843[12] ^ _T_855; // @[el2_lib.scala 212:26]
  wire  _T_859 = ~_T_843[12]; // @[el2_lib.scala 213:20]
  wire  _T_861 = _T_859 & _T_846[12]; // @[el2_lib.scala 213:26]
  wire  _T_865 = _T_843[12] & _T_855; // @[el2_lib.scala 214:26]
  wire [18:0] _T_867 = _T_856 ? _T_842[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_868 = _T_861 ? _T_849 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_869 = _T_865 ? _T_852 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_870 = _T_867 | _T_868; // @[Mux.scala 27:72]
  wire [18:0] _T_871 = _T_870 | _T_869; // @[Mux.scala 27:72]
  wire [31:0] temp_pred_correct_npc_x = {_T_871,_T_846[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_887_mul = i0_rs1_depend_i0_r & i0_r_c_mul; // @[el2_dec_decode_ctl.scala 774:61]
  wire  _T_887_alu = i0_rs1_depend_i0_r & i0_r_c_alu; // @[el2_dec_decode_ctl.scala 774:61]
  wire  i0_rs1_class_d_mul = i0_rs1_depend_i0_x ? i0_x_c_mul : _T_887_mul; // @[el2_dec_decode_ctl.scala 774:24]
  wire  i0_rs1_class_d_alu = i0_rs1_depend_i0_x ? i0_x_c_alu : _T_887_alu; // @[el2_dec_decode_ctl.scala 774:24]
  wire  _T_896_mul = i0_rs2_depend_i0_r & i0_r_c_mul; // @[el2_dec_decode_ctl.scala 776:61]
  wire  _T_896_alu = i0_rs2_depend_i0_r & i0_r_c_alu; // @[el2_dec_decode_ctl.scala 776:61]
  wire  i0_rs2_class_d_mul = i0_rs2_depend_i0_x ? i0_x_c_mul : _T_896_mul; // @[el2_dec_decode_ctl.scala 776:24]
  wire  i0_rs2_class_d_alu = i0_rs2_depend_i0_x ? i0_x_c_alu : _T_896_alu; // @[el2_dec_decode_ctl.scala 776:24]
  wire  _T_909 = io_dec_i0_rs1_en_d & io_dec_nonblock_load_wen; // @[el2_dec_decode_ctl.scala 794:62]
  wire  _T_910 = io_dec_nonblock_load_waddr == i0r_rs1; // @[el2_dec_decode_ctl.scala 794:119]
  wire  i0_rs1_nonblock_load_bypass_en_d = _T_909 & _T_910; // @[el2_dec_decode_ctl.scala 794:89]
  wire  _T_911 = io_dec_i0_rs2_en_d & io_dec_nonblock_load_wen; // @[el2_dec_decode_ctl.scala 796:62]
  wire  _T_912 = io_dec_nonblock_load_waddr == i0r_rs2; // @[el2_dec_decode_ctl.scala 796:119]
  wire  i0_rs2_nonblock_load_bypass_en_d = _T_911 & _T_912; // @[el2_dec_decode_ctl.scala 796:89]
  wire  _T_914 = i0_rs1_class_d_alu | i0_rs1_class_d_mul; // @[el2_dec_decode_ctl.scala 799:66]
  wire  _T_915 = i0_rs1_depth_d[0] & _T_914; // @[el2_dec_decode_ctl.scala 799:45]
  wire  _T_917 = i0_rs1_depth_d[0] & i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 799:108]
  wire  _T_920 = _T_914 | i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 799:196]
  wire  _T_921 = i0_rs1_depth_d[1] & _T_920; // @[el2_dec_decode_ctl.scala 799:153]
  wire [2:0] i0_rs1bypass = {_T_915,_T_917,_T_921}; // @[Cat.scala 29:58]
  wire  _T_925 = i0_rs2_class_d_alu | i0_rs2_class_d_mul; // @[el2_dec_decode_ctl.scala 801:67]
  wire  _T_926 = i0_rs2_depth_d[0] & _T_925; // @[el2_dec_decode_ctl.scala 801:45]
  wire  _T_928 = i0_rs2_depth_d[0] & i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 801:109]
  wire  _T_931 = _T_925 | i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 801:196]
  wire  _T_932 = i0_rs2_depth_d[1] & _T_931; // @[el2_dec_decode_ctl.scala 801:153]
  wire [2:0] i0_rs2bypass = {_T_926,_T_928,_T_932}; // @[Cat.scala 29:58]
  wire  _T_938 = i0_rs1bypass[1] | i0_rs1bypass[0]; // @[el2_dec_decode_ctl.scala 803:75]
  wire  _T_940 = ~i0_rs1bypass[2]; // @[el2_dec_decode_ctl.scala 803:96]
  wire  _T_941 = _T_940 & i0_rs1_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 803:113]
  wire  _T_942 = _T_938 | _T_941; // @[el2_dec_decode_ctl.scala 803:93]
  wire  _T_947 = i0_rs2bypass[1] | i0_rs2bypass[0]; // @[el2_dec_decode_ctl.scala 804:75]
  wire  _T_949 = ~i0_rs2bypass[2]; // @[el2_dec_decode_ctl.scala 804:96]
  wire  _T_950 = _T_949 & i0_rs2_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 804:113]
  wire  _T_951 = _T_947 | _T_950; // @[el2_dec_decode_ctl.scala 804:93]
  wire  _T_958 = ~i0_rs1bypass[1]; // @[el2_dec_decode_ctl.scala 810:6]
  wire  _T_960 = ~i0_rs1bypass[0]; // @[el2_dec_decode_ctl.scala 810:25]
  wire  _T_961 = _T_958 & _T_960; // @[el2_dec_decode_ctl.scala 810:23]
  wire  _T_962 = _T_961 & i0_rs1_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 810:42]
  wire [31:0] _T_964 = i0_rs1bypass[1] ? io_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_965 = i0_rs1bypass[0] ? i0_result_r_raw : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_966 = _T_962 ? io_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_967 = _T_964 | _T_965; // @[Mux.scala 27:72]
  wire  _T_975 = ~i0_rs2bypass[1]; // @[el2_dec_decode_ctl.scala 815:6]
  wire  _T_977 = ~i0_rs2bypass[0]; // @[el2_dec_decode_ctl.scala 815:25]
  wire  _T_978 = _T_975 & _T_977; // @[el2_dec_decode_ctl.scala 815:23]
  wire  _T_979 = _T_978 & i0_rs2_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 815:42]
  wire [31:0] _T_981 = i0_rs2bypass[1] ? io_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_982 = i0_rs2bypass[0] ? i0_result_r_raw : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_983 = _T_979 ? io_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_984 = _T_981 | _T_982; // @[Mux.scala 27:72]
  wire  _T_987 = i0_dp_raw_load | i0_dp_raw_store; // @[el2_dec_decode_ctl.scala 817:68]
  wire  _T_988 = io_dec_ib0_valid_d & _T_987; // @[el2_dec_decode_ctl.scala 817:50]
  wire  _T_989 = ~io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 817:89]
  wire  _T_990 = _T_988 & _T_989; // @[el2_dec_decode_ctl.scala 817:87]
  wire  _T_992 = _T_990 & _T_493; // @[el2_dec_decode_ctl.scala 817:112]
  wire  _T_994 = ~io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 819:6]
  wire  _T_995 = _T_994 & i0_dp_lsu; // @[el2_dec_decode_ctl.scala 819:27]
  wire  _T_996 = _T_995 & i0_dp_load; // @[el2_dec_decode_ctl.scala 819:39]
  wire  _T_1001 = _T_995 & i0_dp_store; // @[el2_dec_decode_ctl.scala 820:39]
  wire [11:0] _T_1005 = {io_dec_i0_instr_d[31:25],i0r_rd}; // @[Cat.scala 29:58]
  wire [11:0] _T_1006 = _T_996 ? io_dec_i0_instr_d[31:20] : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1007 = _T_1001 ? _T_1005 : 12'h0; // @[Mux.scala 27:72]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  el2_dec_dec_ctl i0_dec ( // @[el2_dec_decode_ctl.scala 392:22]
    .io_ins(i0_dec_io_ins),
    .io_out_alu(i0_dec_io_out_alu),
    .io_out_rs1(i0_dec_io_out_rs1),
    .io_out_rs2(i0_dec_io_out_rs2),
    .io_out_imm12(i0_dec_io_out_imm12),
    .io_out_rd(i0_dec_io_out_rd),
    .io_out_shimm5(i0_dec_io_out_shimm5),
    .io_out_imm20(i0_dec_io_out_imm20),
    .io_out_pc(i0_dec_io_out_pc),
    .io_out_load(i0_dec_io_out_load),
    .io_out_store(i0_dec_io_out_store),
    .io_out_lsu(i0_dec_io_out_lsu),
    .io_out_add(i0_dec_io_out_add),
    .io_out_sub(i0_dec_io_out_sub),
    .io_out_land(i0_dec_io_out_land),
    .io_out_lor(i0_dec_io_out_lor),
    .io_out_lxor(i0_dec_io_out_lxor),
    .io_out_sll(i0_dec_io_out_sll),
    .io_out_sra(i0_dec_io_out_sra),
    .io_out_srl(i0_dec_io_out_srl),
    .io_out_slt(i0_dec_io_out_slt),
    .io_out_unsign(i0_dec_io_out_unsign),
    .io_out_condbr(i0_dec_io_out_condbr),
    .io_out_beq(i0_dec_io_out_beq),
    .io_out_bne(i0_dec_io_out_bne),
    .io_out_bge(i0_dec_io_out_bge),
    .io_out_blt(i0_dec_io_out_blt),
    .io_out_jal(i0_dec_io_out_jal),
    .io_out_by(i0_dec_io_out_by),
    .io_out_half(i0_dec_io_out_half),
    .io_out_word(i0_dec_io_out_word),
    .io_out_csr_read(i0_dec_io_out_csr_read),
    .io_out_csr_clr(i0_dec_io_out_csr_clr),
    .io_out_csr_set(i0_dec_io_out_csr_set),
    .io_out_csr_write(i0_dec_io_out_csr_write),
    .io_out_csr_imm(i0_dec_io_out_csr_imm),
    .io_out_presync(i0_dec_io_out_presync),
    .io_out_postsync(i0_dec_io_out_postsync),
    .io_out_ebreak(i0_dec_io_out_ebreak),
    .io_out_ecall(i0_dec_io_out_ecall),
    .io_out_mret(i0_dec_io_out_mret),
    .io_out_mul(i0_dec_io_out_mul),
    .io_out_rs1_sign(i0_dec_io_out_rs1_sign),
    .io_out_rs2_sign(i0_dec_io_out_rs2_sign),
    .io_out_low(i0_dec_io_out_low),
    .io_out_div(i0_dec_io_out_div),
    .io_out_rem(i0_dec_io_out_rem),
    .io_out_fence(i0_dec_io_out_fence),
    .io_out_fence_i(i0_dec_io_out_fence_i),
    .io_out_pm_alu(i0_dec_io_out_pm_alu),
    .io_out_legal(i0_dec_io_out_legal)
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
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 508:23]
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
  rvclkhdr rvclkhdr_18 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_18_io_l1clk),
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en),
    .io_scan_mode(rvclkhdr_18_io_scan_mode)
  );
  rvclkhdr rvclkhdr_19 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_19_io_l1clk),
    .io_clk(rvclkhdr_19_io_clk),
    .io_en(rvclkhdr_19_io_en),
    .io_scan_mode(rvclkhdr_19_io_scan_mode)
  );
  assign io_dec_extint_stall = _T_339; // @[el2_dec_decode_ctl.scala 432:23]
  assign io_dec_i0_inst_wb1 = _T_837; // @[el2_dec_decode_ctl.scala 753:22]
  assign io_dec_i0_pc_wb1 = _T_840; // @[el2_dec_decode_ctl.scala 756:20]
  assign io_dec_i0_rs1_en_d = i0_dp_rs1 & _T_556; // @[el2_dec_decode_ctl.scala 624:24]
  assign io_dec_i0_rs2_en_d = i0_dp_rs2 & _T_558; // @[el2_dec_decode_ctl.scala 625:24]
  assign io_dec_i0_rs1_d = io_dec_i0_instr_d[19:15]; // @[el2_dec_decode_ctl.scala 627:19]
  assign io_dec_i0_rs2_d = io_dec_i0_instr_d[24:20]; // @[el2_dec_decode_ctl.scala 628:19]
  assign io_dec_i0_immed_d = _T_563 | _T_564; // @[el2_dec_decode_ctl.scala 633:21]
  assign io_dec_i0_br_immed_d = _T_768 ? i0_br_offset : _T_781; // @[el2_dec_decode_ctl.scala 711:24]
  assign io_i0_ap_land = _T_41 ? 1'h0 : i0_dp_raw_land; // @[el2_dec_decode_ctl.scala 285:20]
  assign io_i0_ap_lor = _T_41 | i0_dp_raw_lor; // @[el2_dec_decode_ctl.scala 286:20]
  assign io_i0_ap_lxor = _T_41 ? 1'h0 : i0_dp_raw_lxor; // @[el2_dec_decode_ctl.scala 287:20]
  assign io_i0_ap_sll = _T_41 ? 1'h0 : i0_dp_raw_sll; // @[el2_dec_decode_ctl.scala 288:20]
  assign io_i0_ap_srl = _T_41 ? 1'h0 : i0_dp_raw_srl; // @[el2_dec_decode_ctl.scala 289:20]
  assign io_i0_ap_sra = _T_41 ? 1'h0 : i0_dp_raw_sra; // @[el2_dec_decode_ctl.scala 290:20]
  assign io_i0_ap_beq = _T_41 ? 1'h0 : i0_dp_raw_beq; // @[el2_dec_decode_ctl.scala 293:20]
  assign io_i0_ap_bne = _T_41 ? 1'h0 : i0_dp_raw_bne; // @[el2_dec_decode_ctl.scala 294:20]
  assign io_i0_ap_blt = _T_41 ? 1'h0 : i0_dp_raw_blt; // @[el2_dec_decode_ctl.scala 295:20]
  assign io_i0_ap_bge = _T_41 ? 1'h0 : i0_dp_raw_bge; // @[el2_dec_decode_ctl.scala 296:20]
  assign io_i0_ap_add = _T_41 ? 1'h0 : i0_dp_raw_add; // @[el2_dec_decode_ctl.scala 283:20]
  assign io_i0_ap_sub = _T_41 ? 1'h0 : i0_dp_raw_sub; // @[el2_dec_decode_ctl.scala 284:20]
  assign io_i0_ap_slt = _T_41 ? 1'h0 : i0_dp_raw_slt; // @[el2_dec_decode_ctl.scala 291:20]
  assign io_i0_ap_unsign = _T_41 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 292:20]
  assign io_i0_ap_jal = _T_336 & _T_337; // @[el2_dec_decode_ctl.scala 299:22]
  assign io_i0_ap_predict_t = _T_47 & i0_predict_br; // @[el2_dec_decode_ctl.scala 281:26]
  assign io_i0_ap_predict_nt = _T_48 & i0_predict_br; // @[el2_dec_decode_ctl.scala 280:26]
  assign io_i0_ap_csr_write = i0_csr_write & _T_347; // @[el2_dec_decode_ctl.scala 297:22]
  assign io_i0_ap_csr_imm = _T_41 ? 1'h0 : i0_dp_raw_csr_imm; // @[el2_dec_decode_ctl.scala 298:22]
  assign io_dec_i0_decode_d = _T_490 & _T_467; // @[el2_dec_decode_ctl.scala 552:22 el2_dec_decode_ctl.scala 618:22]
  assign io_dec_i0_alu_decode_d = i0_exulegal_decode_d & i0_dp_alu; // @[el2_dec_decode_ctl.scala 572:26]
  assign io_dec_i0_rs1_bypass_data_d = _T_967 | _T_966; // @[el2_dec_decode_ctl.scala 807:31]
  assign io_dec_i0_rs2_bypass_data_d = _T_984 | _T_983; // @[el2_dec_decode_ctl.scala 812:31]
  assign io_dec_i0_waddr_r = r_d_i0rd; // @[el2_dec_decode_ctl.scala 694:27]
  assign io_dec_i0_wen_r = _T_757 & _T_758; // @[el2_dec_decode_ctl.scala 696:32]
  assign io_dec_i0_wdata_r = _T_764 ? io_lsu_result_corr_r : i0_result_r_raw; // @[el2_dec_decode_ctl.scala 697:26]
  assign io_dec_i0_select_pc_d = _T_41 ? 1'h0 : i0_dp_raw_pc; // @[el2_dec_decode_ctl.scala 271:25]
  assign io_dec_i0_rs1_bypass_en_d = {i0_rs1bypass[2],_T_942}; // @[el2_dec_decode_ctl.scala 803:34]
  assign io_dec_i0_rs2_bypass_en_d = {i0_rs2bypass[2],_T_951}; // @[el2_dec_decode_ctl.scala 804:34]
  assign io_lsu_p_valid = io_dec_extint_stall | lsu_decode_d; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 439:24 el2_dec_decode_ctl.scala 441:35]
  assign io_lsu_p_bits_fast_int = io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 438:29]
  assign io_lsu_p_bits_by = io_dec_extint_stall ? 1'h0 : i0_dp_by; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 444:40]
  assign io_lsu_p_bits_half = io_dec_extint_stall ? 1'h0 : i0_dp_half; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 445:40]
  assign io_lsu_p_bits_word = io_dec_extint_stall | i0_dp_word; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 437:29 el2_dec_decode_ctl.scala 446:40]
  assign io_lsu_p_bits_dword = 1'h0; // @[el2_dec_decode_ctl.scala 434:12]
  assign io_lsu_p_bits_load = io_dec_extint_stall | i0_dp_load; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 436:29 el2_dec_decode_ctl.scala 442:40]
  assign io_lsu_p_bits_store = io_dec_extint_stall ? 1'h0 : i0_dp_store; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 443:40]
  assign io_lsu_p_bits_unsign = io_dec_extint_stall ? 1'h0 : i0_dp_unsign; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 450:40]
  assign io_lsu_p_bits_dma = 1'h0; // @[el2_dec_decode_ctl.scala 434:12]
  assign io_lsu_p_bits_store_data_bypass_d = io_dec_extint_stall ? 1'h0 : store_data_bypass_d; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 448:40]
  assign io_lsu_p_bits_load_ldst_bypass_d = io_dec_extint_stall ? 1'h0 : load_ldst_bypass_d; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 447:40]
  assign io_lsu_p_bits_store_data_bypass_m = 1'h0; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 449:40]
  assign io_mul_p_valid = i0_exulegal_decode_d & i0_dp_mul; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 427:21]
  assign io_mul_p_bits_rs1_sign = _T_41 ? 1'h0 : i0_dp_raw_rs1_sign; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 428:26]
  assign io_mul_p_bits_rs2_sign = _T_41 ? 1'h0 : i0_dp_raw_rs2_sign; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 429:26]
  assign io_mul_p_bits_low = _T_41 ? 1'h0 : i0_dp_raw_low; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 430:26]
  assign io_mul_p_bits_bext = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_bdep = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_clmul = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_clmulh = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_clmulr = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_grev = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_shfl = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_unshfl = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_crc32_b = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_crc32_h = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_crc32_w = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_crc32c_b = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_crc32c_h = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_crc32c_w = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bits_bfp = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_div_p_valid = i0_exulegal_decode_d & i0_dp_div; // @[el2_dec_decode_ctl.scala 423:21]
  assign io_div_p_bits_unsign = _T_41 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 424:26]
  assign io_div_p_bits_rem = _T_41 ? 1'h0 : i0_dp_raw_rem; // @[el2_dec_decode_ctl.scala 425:26]
  assign io_div_waddr_wb = _T_830; // @[el2_dec_decode_ctl.scala 741:19]
  assign io_dec_div_cancel = _T_810 | _T_815; // @[el2_dec_decode_ctl.scala 730:29]
  assign io_dec_lsu_valid_raw_d = _T_992 | io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 817:26]
  assign io_dec_lsu_offset_d = _T_1006 | _T_1007; // @[el2_dec_decode_ctl.scala 818:23]
  assign io_dec_csr_ren_d = _T_41 ? 1'h0 : i0_dp_raw_csr_read; // @[el2_dec_decode_ctl.scala 454:21]
  assign io_dec_csr_wen_unq_d = _T_349 | i0_csr_write; // @[el2_dec_decode_ctl.scala 463:24]
  assign io_dec_csr_any_unq_d = i0_dp_csr_read | i0_csr_write; // @[el2_dec_decode_ctl.scala 529:24]
  assign io_dec_csr_rdaddr_d = io_dec_i0_instr_d[31:20]; // @[el2_dec_decode_ctl.scala 466:24]
  assign io_dec_csr_wen_r = _T_352 & _T_754; // @[el2_dec_decode_ctl.scala 471:20]
  assign io_dec_csr_wraddr_r = r_d_csrwaddr; // @[el2_dec_decode_ctl.scala 467:23]
  assign io_dec_csr_wrdata_r = r_d_csrwonly ? i0_result_corr_r : write_csr_data; // @[el2_dec_decode_ctl.scala 514:24]
  assign io_dec_csr_stall_int_ff = _T_359 & _T_360; // @[el2_dec_decode_ctl.scala 474:27]
  assign io_dec_tlu_i0_valid_r = r_d_i0valid & _T_743; // @[el2_dec_decode_ctl.scala 578:29]
  assign io_dec_tlu_packet_r_legal = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_legal; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_icaf = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_icaf_f1 = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf_f1; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_icaf_type = io_dec_tlu_flush_lower_wb ? 2'h0 : r_t_icaf_type; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_fence_i = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_fence_i; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_i0trigger = io_dec_tlu_flush_lower_wb ? 4'h0 : _T_542; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_flush_lower_wb ? 4'h0 : r_t_pmu_i0_itype; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_pmu_i0_br_unpred; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_pmu_divide = r_d_i0div & r_d_i0valid; // @[el2_dec_decode_ctl.scala 612:39 el2_dec_decode_ctl.scala 613:39]
  assign io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_flush_lower_wb ? 1'h0 : lsu_pmu_misaligned_r; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_i0_pc_r = dec_i0_pc_r; // @[el2_dec_decode_ctl.scala 759:27]
  assign io_dec_illegal_inst = _T_465; // @[el2_dec_decode_ctl.scala 536:23]
  assign io_pred_correct_npc_x = temp_pred_correct_npc_x[31:1]; // @[el2_dec_decode_ctl.scala 764:25]
  assign io_dec_i0_predict_p_d_valid = i0_brp_valid & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 236:38]
  assign io_dec_i0_predict_p_d_bits_misp = 1'h0; // @[el2_dec_decode_ctl.scala 227:43]
  assign io_dec_i0_predict_p_d_bits_ataken = 1'h0; // @[el2_dec_decode_ctl.scala 228:43]
  assign io_dec_i0_predict_p_d_bits_boffset = 1'h0; // @[el2_dec_decode_ctl.scala 229:43]
  assign io_dec_i0_predict_p_d_bits_pc4 = io_dec_i0_pc4_d; // @[el2_dec_decode_ctl.scala 234:43]
  assign io_dec_i0_predict_p_d_bits_hist = io_dec_i0_brp_bits_hist; // @[el2_dec_decode_ctl.scala 235:43]
  assign io_dec_i0_predict_p_d_bits_toffset = _T_314 ? i0_pcall_imm[11:0] : _T_323; // @[el2_dec_decode_ctl.scala 248:49]
  assign io_dec_i0_predict_p_d_bits_br_error = _T_33 & _T_18; // @[el2_dec_decode_ctl.scala 243:56]
  assign io_dec_i0_predict_p_d_bits_br_start_error = _T_36 & _T_18; // @[el2_dec_decode_ctl.scala 244:56]
  assign io_dec_i0_predict_p_d_bits_prett = io_dec_i0_brp_bits_prett; // @[el2_dec_decode_ctl.scala 233:43]
  assign io_dec_i0_predict_p_d_bits_pcall = i0_dp_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 230:43]
  assign io_dec_i0_predict_p_d_bits_pret = i0_dp_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 232:43]
  assign io_dec_i0_predict_p_d_bits_pja = i0_dp_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 231:43]
  assign io_dec_i0_predict_p_d_bits_way = io_dec_i0_brp_bits_way; // @[el2_dec_decode_ctl.scala 250:56]
  assign io_i0_predict_fghr_d = io_dec_i0_bp_fghr; // @[el2_dec_decode_ctl.scala 249:32]
  assign io_i0_predict_index_d = io_dec_i0_bp_index; // @[el2_dec_decode_ctl.scala 245:32]
  assign io_i0_predict_btag_d = io_dec_i0_bp_btag; // @[el2_dec_decode_ctl.scala 246:32]
  assign io_dec_data_en = {i0_x_data_en,i0_r_data_en}; // @[el2_dec_decode_ctl.scala 662:27]
  assign io_dec_ctl_en = {i0_x_ctl_en,i0_r_ctl_en}; // @[el2_dec_decode_ctl.scala 663:27]
  assign io_dec_pmu_instr_decoded = io_dec_i0_decode_d; // @[el2_dec_decode_ctl.scala 557:28]
  assign io_dec_pmu_decode_stall = io_dec_ib0_valid_d & _T_498; // @[el2_dec_decode_ctl.scala 558:27]
  assign io_dec_pmu_presync_stall = i0_presync & prior_inflight_eff; // @[el2_dec_decode_ctl.scala 560:29]
  assign io_dec_pmu_postsync_stall = postsync_stall; // @[el2_dec_decode_ctl.scala 559:29]
  assign io_dec_nonblock_load_wen = _T_200 & _T_201; // @[el2_dec_decode_ctl.scala 354:28]
  assign io_dec_nonblock_load_waddr = _T_246 | _T_238; // @[el2_dec_decode_ctl.scala 351:29 el2_dec_decode_ctl.scala 361:29]
  assign io_dec_pause_state = pause_stall; // @[el2_dec_decode_ctl.scala 498:22]
  assign io_dec_pause_state_cg = pause_stall & _T_420; // @[el2_dec_decode_ctl.scala 502:25]
  assign io_dec_div_active = _T_821; // @[el2_dec_decode_ctl.scala 735:21]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_15 | _T_16; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign i0_dec_io_ins = io_dec_i0_instr_d; // @[el2_dec_decode_ctl.scala 393:16]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = _T_428 | pause_stall; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = shift_illegal & _T_464; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_5_io_en = _T_704 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_6_io_en = _T_704 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_7_io_en = _T_704 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_8_io_en = _T_707 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_9_io_en = _T_710 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_10_io_en = i0_pipe_en[2] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = i0_legal_decode_d & i0_dp_div; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_13_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_14_io_en = i0_pipe_en[2] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_15_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_15_io_en = i0_pipe_en[1] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_16_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_16_io_en = i0_pipe_en[0] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_17_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_17_io_en = i0_pipe_en[1] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_18_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_18_io_en = i0_pipe_en[0] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_18_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_19_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_19_io_en = i0_pipe_en[2] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_19_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  tlu_wr_pause_r1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  tlu_wr_pause_r2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  leak1_i1_stall = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  leak1_i0_stall = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pause_stall = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  write_csr_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  postsync_stall = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  x_d_i0valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flush_final_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  illegal_lockout = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  cam_raw_0_bits_tag = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  cam_raw_0_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cam_raw_1_bits_tag = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  cam_raw_1_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cam_raw_2_bits_tag = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  cam_raw_2_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  cam_raw_3_bits_tag = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  cam_raw_3_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  x_d_i0load = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  x_d_i0rd = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  _T_701 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  nonblock_load_valid_m_delay = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  r_d_i0load = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  r_d_i0v = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  r_d_i0rd = _RAND_24[4:0];
  _RAND_25 = {1{`RANDOM}};
  cam_raw_0_bits_rd = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  cam_raw_0_bits_wb = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  cam_raw_1_bits_rd = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  cam_raw_1_bits_wb = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  cam_raw_2_bits_rd = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  cam_raw_2_bits_wb = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  cam_raw_3_bits_rd = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  cam_raw_3_bits_wb = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  lsu_idle = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  _T_339 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  x_d_i0v = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  i0_x_c_load = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  i0_r_c_load = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  r_d_csrwen = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  r_d_i0valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  r_d_csrwaddr = _RAND_40[11:0];
  _RAND_41 = {1{`RANDOM}};
  csr_read_x = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  csr_clr_x = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  csr_set_x = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  csr_write_x = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  csr_imm_x = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  csrimm_x = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  csr_rddata_x = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  r_d_csrwonly = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  i0_result_r_raw = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  x_d_csrwonly = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  wbd_csrwonly = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_465 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  x_t_legal = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  x_t_icaf = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  x_t_icaf_f1 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  x_t_icaf_type = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  x_t_fence_i = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  x_t_i0trigger = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  x_t_pmu_i0_itype = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  x_t_pmu_i0_br_unpred = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  r_t_legal = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  r_t_icaf = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  r_t_icaf_f1 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  r_t_icaf_type = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  r_t_fence_i = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  r_t_i0trigger = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  r_t_pmu_i0_itype = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  r_t_pmu_i0_br_unpred = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  lsu_trigger_match_r = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  lsu_pmu_misaligned_r = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  r_d_i0store = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  r_d_i0div = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  i0_x_c_mul = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  i0_x_c_alu = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  i0_r_c_mul = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  i0_r_c_alu = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  x_d_i0store = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  x_d_i0div = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  x_d_csrwen = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  x_d_csrwaddr = _RAND_80[11:0];
  _RAND_81 = {1{`RANDOM}};
  last_br_immed_x = _RAND_81[11:0];
  _RAND_82 = {1{`RANDOM}};
  _T_821 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  _T_830 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  i0_inst_x = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  i0_inst_r = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  i0_inst_wb = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  _T_837 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  i0_pc_wb = _RAND_88[30:0];
  _RAND_89 = {1{`RANDOM}};
  _T_840 = _RAND_89[30:0];
  _RAND_90 = {1{`RANDOM}};
  dec_i0_pc_r = _RAND_90[30:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tlu_wr_pause_r1 = 1'h0;
  end
  if (reset) begin
    tlu_wr_pause_r2 = 1'h0;
  end
  if (reset) begin
    leak1_i1_stall = 1'h0;
  end
  if (reset) begin
    leak1_i0_stall = 1'h0;
  end
  if (reset) begin
    pause_stall = 1'h0;
  end
  if (reset) begin
    write_csr_data = 32'h0;
  end
  if (reset) begin
    postsync_stall = 1'h0;
  end
  if (reset) begin
    x_d_i0valid = 1'h0;
  end
  if (reset) begin
    flush_final_r = 1'h0;
  end
  if (reset) begin
    illegal_lockout = 1'h0;
  end
  if (reset) begin
    cam_raw_0_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_0_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_1_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_1_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_2_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_2_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_3_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_3_valid = 1'h0;
  end
  if (reset) begin
    x_d_i0load = 1'h0;
  end
  if (reset) begin
    x_d_i0rd = 5'h0;
  end
  if (reset) begin
    _T_701 = 3'h0;
  end
  if (reset) begin
    nonblock_load_valid_m_delay = 1'h0;
  end
  if (reset) begin
    r_d_i0load = 1'h0;
  end
  if (reset) begin
    r_d_i0v = 1'h0;
  end
  if (reset) begin
    r_d_i0rd = 5'h0;
  end
  if (reset) begin
    cam_raw_0_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_0_bits_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_1_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_1_bits_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_2_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_2_bits_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_3_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_3_bits_wb = 1'h0;
  end
  if (reset) begin
    lsu_idle = 1'h0;
  end
  if (reset) begin
    _T_339 = 1'h0;
  end
  if (reset) begin
    x_d_i0v = 1'h0;
  end
  if (reset) begin
    r_d_csrwen = 1'h0;
  end
  if (reset) begin
    r_d_i0valid = 1'h0;
  end
  if (reset) begin
    r_d_csrwaddr = 12'h0;
  end
  if (reset) begin
    csr_read_x = 1'h0;
  end
  if (reset) begin
    csr_clr_x = 1'h0;
  end
  if (reset) begin
    csr_set_x = 1'h0;
  end
  if (reset) begin
    csr_write_x = 1'h0;
  end
  if (reset) begin
    csr_imm_x = 1'h0;
  end
  if (reset) begin
    csrimm_x = 5'h0;
  end
  if (reset) begin
    csr_rddata_x = 32'h0;
  end
  if (reset) begin
    r_d_csrwonly = 1'h0;
  end
  if (reset) begin
    i0_result_r_raw = 32'h0;
  end
  if (reset) begin
    x_d_csrwonly = 1'h0;
  end
  if (reset) begin
    wbd_csrwonly = 1'h0;
  end
  if (reset) begin
    _T_465 = 32'h0;
  end
  if (reset) begin
    x_t_legal = 1'h0;
  end
  if (reset) begin
    x_t_icaf = 1'h0;
  end
  if (reset) begin
    x_t_icaf_f1 = 1'h0;
  end
  if (reset) begin
    x_t_icaf_type = 2'h0;
  end
  if (reset) begin
    x_t_fence_i = 1'h0;
  end
  if (reset) begin
    x_t_i0trigger = 4'h0;
  end
  if (reset) begin
    x_t_pmu_i0_itype = 4'h0;
  end
  if (reset) begin
    x_t_pmu_i0_br_unpred = 1'h0;
  end
  if (reset) begin
    r_t_legal = 1'h0;
  end
  if (reset) begin
    r_t_icaf = 1'h0;
  end
  if (reset) begin
    r_t_icaf_f1 = 1'h0;
  end
  if (reset) begin
    r_t_icaf_type = 2'h0;
  end
  if (reset) begin
    r_t_fence_i = 1'h0;
  end
  if (reset) begin
    r_t_i0trigger = 4'h0;
  end
  if (reset) begin
    r_t_pmu_i0_itype = 4'h0;
  end
  if (reset) begin
    r_t_pmu_i0_br_unpred = 1'h0;
  end
  if (reset) begin
    lsu_trigger_match_r = 4'h0;
  end
  if (reset) begin
    lsu_pmu_misaligned_r = 1'h0;
  end
  if (reset) begin
    r_d_i0store = 1'h0;
  end
  if (reset) begin
    r_d_i0div = 1'h0;
  end
  if (reset) begin
    x_d_i0store = 1'h0;
  end
  if (reset) begin
    x_d_i0div = 1'h0;
  end
  if (reset) begin
    x_d_csrwen = 1'h0;
  end
  if (reset) begin
    x_d_csrwaddr = 12'h0;
  end
  if (reset) begin
    last_br_immed_x = 12'h0;
  end
  if (reset) begin
    _T_821 = 1'h0;
  end
  if (reset) begin
    _T_830 = 5'h0;
  end
  if (reset) begin
    i0_inst_x = 32'h0;
  end
  if (reset) begin
    i0_inst_r = 32'h0;
  end
  if (reset) begin
    i0_inst_wb = 32'h0;
  end
  if (reset) begin
    _T_837 = 32'h0;
  end
  if (reset) begin
    i0_pc_wb = 31'h0;
  end
  if (reset) begin
    _T_840 = 31'h0;
  end
  if (reset) begin
    dec_i0_pc_r = 31'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_active_clk) begin
    if (i0_x_ctl_en) begin
      i0_x_c_load <= i0_d_c_load;
    end
    if (i0_r_ctl_en) begin
      i0_r_c_load <= i0_x_c_load;
    end
    if (i0_x_ctl_en) begin
      i0_x_c_mul <= i0_d_c_mul;
    end
    if (i0_x_ctl_en) begin
      i0_x_c_alu <= i0_d_c_alu;
    end
    if (i0_r_ctl_en) begin
      i0_r_c_mul <= i0_x_c_mul;
    end
    if (i0_r_ctl_en) begin
      i0_r_c_alu <= i0_x_c_alu;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r1 <= 1'h0;
    end else begin
      tlu_wr_pause_r1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r2 <= 1'h0;
    end else begin
      tlu_wr_pause_r2 <= tlu_wr_pause_r1;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      leak1_i1_stall <= 1'h0;
    end else begin
      leak1_i1_stall <= io_dec_tlu_flush_leak_one_r | _T_281;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      leak1_i0_stall <= 1'h0;
    end else begin
      leak1_i0_stall <= _T_284 | _T_286;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      pause_stall <= 1'h0;
    end else begin
      pause_stall <= _T_412 & _T_413;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      write_csr_data <= 32'h0;
    end else if (pause_stall) begin
      write_csr_data <= _T_423;
    end else if (io_dec_tlu_wr_pause_r) begin
      write_csr_data <= io_dec_csr_wrdata_r;
    end else begin
      write_csr_data <= write_csr_data_x;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      postsync_stall <= 1'h0;
    end else begin
      postsync_stall <= _T_506 | _T_507;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0valid <= 1'h0;
    end else begin
      x_d_i0valid <= io_dec_i0_decode_d;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      flush_final_r <= 1'h0;
    end else begin
      flush_final_r <= io_exu_flush_final;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      illegal_lockout <= 1'h0;
    end else begin
      illegal_lockout <= _T_466 & _T_467;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_tag <= 3'h0;
    end else if (cam_wen[0]) begin
      cam_raw_0_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_107) begin
      cam_raw_0_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_0_valid <= 1'h0;
    end else begin
      cam_raw_0_valid <= _GEN_56;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_tag <= 3'h0;
    end else if (cam_wen[1]) begin
      cam_raw_1_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_133) begin
      cam_raw_1_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_1_valid <= 1'h0;
    end else begin
      cam_raw_1_valid <= _GEN_67;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_tag <= 3'h0;
    end else if (cam_wen[2]) begin
      cam_raw_2_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_159) begin
      cam_raw_2_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_2_valid <= 1'h0;
    end else begin
      cam_raw_2_valid <= _GEN_78;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_tag <= 3'h0;
    end else if (cam_wen[3]) begin
      cam_raw_3_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_185) begin
      cam_raw_3_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_3_valid <= 1'h0;
    end else begin
      cam_raw_3_valid <= _GEN_89;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0load <= 1'h0;
    end else begin
      x_d_i0load <= i0_dp_load & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0rd <= 5'h0;
    end else begin
      x_d_i0rd <= io_dec_i0_instr_d[11:7];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_701 <= 3'h0;
    end else begin
      _T_701 <= i0_pipe_en[3:1];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      nonblock_load_valid_m_delay <= 1'h0;
    end else if (i0_r_ctl_en) begin
      nonblock_load_valid_m_delay <= io_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0load <= 1'h0;
    end else begin
      r_d_i0load <= x_d_i0load;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0v <= 1'h0;
    end else begin
      r_d_i0v <= _T_733 & _T_280;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0rd <= 5'h0;
    end else begin
      r_d_i0rd <= x_d_i0rd;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_rd <= 5'h0;
    end else if (cam_wen[0]) begin
      if (x_d_i0load) begin
        cam_raw_0_bits_rd <= x_d_i0rd;
      end else begin
        cam_raw_0_bits_rd <= 5'h0;
      end
    end else if (_T_107) begin
      cam_raw_0_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_wb <= 1'h0;
    end else begin
      cam_raw_0_bits_wb <= _T_112 | _GEN_57;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_rd <= 5'h0;
    end else if (cam_wen[1]) begin
      if (x_d_i0load) begin
        cam_raw_1_bits_rd <= x_d_i0rd;
      end else begin
        cam_raw_1_bits_rd <= 5'h0;
      end
    end else if (_T_133) begin
      cam_raw_1_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_wb <= 1'h0;
    end else begin
      cam_raw_1_bits_wb <= _T_138 | _GEN_68;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_rd <= 5'h0;
    end else if (cam_wen[2]) begin
      if (x_d_i0load) begin
        cam_raw_2_bits_rd <= x_d_i0rd;
      end else begin
        cam_raw_2_bits_rd <= 5'h0;
      end
    end else if (_T_159) begin
      cam_raw_2_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_wb <= 1'h0;
    end else begin
      cam_raw_2_bits_wb <= _T_164 | _GEN_79;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_rd <= 5'h0;
    end else if (cam_wen[3]) begin
      if (x_d_i0load) begin
        cam_raw_3_bits_rd <= x_d_i0rd;
      end else begin
        cam_raw_3_bits_rd <= 5'h0;
      end
    end else if (_T_185) begin
      cam_raw_3_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_wb <= 1'h0;
    end else begin
      cam_raw_3_bits_wb <= _T_190 | _GEN_90;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      lsu_idle <= 1'h0;
    end else begin
      lsu_idle <= io_lsu_idle_any;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_339 <= 1'h0;
    end else begin
      _T_339 <= io_dec_tlu_flush_extint;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0v <= 1'h0;
    end else begin
      x_d_i0v <= i0_rd_en_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_csrwen <= 1'h0;
    end else begin
      r_d_csrwen <= x_d_csrwen;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0valid <= 1'h0;
    end else begin
      r_d_i0valid <= _T_737 & _T_280;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_csrwaddr <= 12'h0;
    end else begin
      r_d_csrwaddr <= x_d_csrwaddr;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_read_x <= 1'h0;
    end else begin
      csr_read_x <= i0_dp_csr_read & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_clr_x <= 1'h0;
    end else begin
      csr_clr_x <= i0_dp_csr_clr & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_set_x <= 1'h0;
    end else begin
      csr_set_x <= i0_dp_csr_set & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_write_x <= 1'h0;
    end else begin
      csr_write_x <= i0_csr_write & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_imm_x <= 1'h0;
    end else if (_T_41) begin
      csr_imm_x <= 1'h0;
    end else begin
      csr_imm_x <= i0_dp_raw_csr_imm;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      csrimm_x <= 5'h0;
    end else begin
      csrimm_x <= io_dec_i0_instr_d[19:15];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      csr_rddata_x <= 32'h0;
    end else begin
      csr_rddata_x <= io_dec_csr_rddata_d;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_csrwonly <= 1'h0;
    end else begin
      r_d_csrwonly <= x_d_csrwonly;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_result_r_raw <= 32'h0;
    end else if (_T_761) begin
      i0_result_r_raw <= io_lsu_result_m;
    end else begin
      i0_result_r_raw <= io_exu_i0_result_x;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_csrwonly <= 1'h0;
    end else begin
      x_d_csrwonly <= i0_csr_write_only_d & io_dec_i0_decode_d;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      wbd_csrwonly <= 1'h0;
    end else begin
      wbd_csrwonly <= r_d_csrwonly;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_465 <= 32'h0;
    end else if (io_dec_i0_pc4_d) begin
      _T_465 <= io_dec_i0_instr_d;
    end else begin
      _T_465 <= _T_462;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_legal <= 1'h0;
    end else begin
      x_t_legal <= io_dec_i0_decode_d & i0_legal;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf <= 1'h0;
    end else begin
      x_t_icaf <= i0_icaf_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf_f1 <= 1'h0;
    end else begin
      x_t_icaf_f1 <= io_dec_i0_icaf_f1_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf_type <= 2'h0;
    end else begin
      x_t_icaf_type <= io_dec_i0_icaf_type_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_fence_i <= 1'h0;
    end else begin
      x_t_fence_i <= _T_517 & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_i0trigger <= 4'h0;
    end else begin
      x_t_i0trigger <= io_dec_i0_trigger_match_d & _T_522;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_itype <= 4'h0;
    end else begin
      x_t_pmu_i0_itype <= _T_255 & _T_277;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_br_unpred <= 1'h0;
    end else begin
      x_t_pmu_i0_br_unpred <= i0_dp_jal & _T_253;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_legal <= 1'h0;
    end else begin
      r_t_legal <= x_t_legal;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf <= 1'h0;
    end else begin
      r_t_icaf <= x_t_icaf;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf_f1 <= 1'h0;
    end else begin
      r_t_icaf_f1 <= x_t_icaf_f1;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf_type <= 2'h0;
    end else begin
      r_t_icaf_type <= x_t_icaf_type;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_fence_i <= 1'h0;
    end else begin
      r_t_fence_i <= x_t_fence_i;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_i0trigger <= 4'h0;
    end else begin
      r_t_i0trigger <= x_t_i0trigger & _T_531;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_itype <= 4'h0;
    end else begin
      r_t_pmu_i0_itype <= x_t_pmu_i0_itype;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_br_unpred <= 1'h0;
    end else begin
      r_t_pmu_i0_br_unpred <= x_t_pmu_i0_br_unpred;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      lsu_trigger_match_r <= 4'h0;
    end else begin
      lsu_trigger_match_r <= io_lsu_trigger_match_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      lsu_pmu_misaligned_r <= 1'h0;
    end else begin
      lsu_pmu_misaligned_r <= io_lsu_pmu_misaligned_m;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0store <= 1'h0;
    end else begin
      r_d_i0store <= x_d_i0store;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0div <= 1'h0;
    end else begin
      r_d_i0div <= x_d_i0div;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0store <= 1'h0;
    end else begin
      x_d_i0store <= i0_dp_store & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0div <= 1'h0;
    end else begin
      x_d_i0div <= i0_dp_div & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_csrwen <= 1'h0;
    end else begin
      x_d_csrwen <= io_dec_csr_wen_unq_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_csrwaddr <= 12'h0;
    end else begin
      x_d_csrwaddr <= io_dec_i0_instr_d[31:20];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      last_br_immed_x <= 12'h0;
    end else if (io_i0_ap_predict_nt) begin
      last_br_immed_x <= _T_781;
    end else if (_T_314) begin
      last_br_immed_x <= i0_pcall_imm[11:0];
    end else begin
      last_br_immed_x <= _T_323;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_821 <= 1'h0;
    end else begin
      _T_821 <= i0_div_decode_d | _T_820;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_830 <= 5'h0;
    end else if (i0_div_decode_d) begin
      _T_830 <= i0r_rd;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_x <= 32'h0;
    end else if (io_dec_i0_pc4_d) begin
      i0_inst_x <= io_dec_i0_instr_d;
    end else begin
      i0_inst_x <= _T_462;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_r <= 32'h0;
    end else begin
      i0_inst_r <= i0_inst_x;
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_wb <= 32'h0;
    end else begin
      i0_inst_wb <= i0_inst_r;
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_837 <= 32'h0;
    end else begin
      _T_837 <= i0_inst_wb;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pc_wb <= 31'h0;
    end else begin
      i0_pc_wb <= io_dec_tlu_i0_pc_r;
    end
  end
  always @(posedge rvclkhdr_18_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_840 <= 31'h0;
    end else begin
      _T_840 <= i0_pc_wb;
    end
  end
  always @(posedge rvclkhdr_19_io_l1clk or posedge reset) begin
    if (reset) begin
      dec_i0_pc_r <= 31'h0;
    end else begin
      dec_i0_pc_r <= io_exu_i0_pc_x;
    end
  end
endmodule
