module TEC_RV_ICG(
  (
   input logic SE, EN, CK,
   output Q
   );
   logic  en_ff;
   logic  enable;
   assign      enable = EN | SE;
  always @(CK, enable) begin
      if(!CK)
        en_ff = enable;
   end
   assign Q = CK & en_ff;
endmodule
module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 330:24]
  wire  clkhdr_CK; // @[beh_lib.scala 330:24]
  wire  clkhdr_EN; // @[beh_lib.scala 330:24]
  wire  clkhdr_SE; // @[beh_lib.scala 330:24]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 330:24]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 331:12]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 332:16]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 333:16]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 334:16]
endmodule
module el2_dec_dec_ctl(
  input  [31:0] io_ins,
  output        io_out_alu,
  output        io_out_rs2,
  output        io_out_rs1,
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
  wire  _T_2 = io_ins[2] | io_ins[6]; // @[el2_dec_dec_ctl.scala 20:27]
  wire  _T_4 = ~io_ins[25]; // @[el2_dec_dec_ctl.scala 20:42]
  wire  _T_6 = _T_4 & io_ins[4]; // @[el2_dec_dec_ctl.scala 20:53]
  wire  _T_7 = _T_2 | _T_6; // @[el2_dec_dec_ctl.scala 20:39]
  wire  _T_9 = ~io_ins[5]; // @[el2_dec_dec_ctl.scala 20:68]
  wire  _T_11 = _T_9 & io_ins[4]; // @[el2_dec_dec_ctl.scala 20:78]
  wire  _T_14 = ~io_ins[14]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_16 = ~io_ins[13]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_18 = ~io_ins[2]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_19 = _T_14 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_20 = _T_19 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_26 = _T_16 & io_ins[11]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_27 = _T_26 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_28 = _T_20 | _T_27; // @[el2_dec_dec_ctl.scala 21:43]
  wire  _T_33 = io_ins[19] & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_34 = _T_33 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_35 = _T_28 | _T_34; // @[el2_dec_dec_ctl.scala 21:70]
  wire  _T_41 = _T_16 & io_ins[10]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_42 = _T_41 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_43 = _T_35 | _T_42; // @[el2_dec_dec_ctl.scala 22:29]
  wire  _T_48 = io_ins[18] & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_49 = _T_48 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_50 = _T_43 | _T_49; // @[el2_dec_dec_ctl.scala 22:56]
  wire  _T_56 = _T_16 & io_ins[9]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_57 = _T_56 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_58 = _T_50 | _T_57; // @[el2_dec_dec_ctl.scala 23:29]
  wire  _T_63 = io_ins[17] & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_64 = _T_63 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_65 = _T_58 | _T_64; // @[el2_dec_dec_ctl.scala 23:55]
  wire  _T_71 = _T_16 & io_ins[8]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_72 = _T_71 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_73 = _T_65 | _T_72; // @[el2_dec_dec_ctl.scala 24:29]
  wire  _T_78 = io_ins[16] & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_79 = _T_78 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_80 = _T_73 | _T_79; // @[el2_dec_dec_ctl.scala 24:55]
  wire  _T_86 = _T_16 & io_ins[7]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_87 = _T_86 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_88 = _T_80 | _T_87; // @[el2_dec_dec_ctl.scala 25:29]
  wire  _T_93 = io_ins[15] & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_94 = _T_93 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_95 = _T_88 | _T_94; // @[el2_dec_dec_ctl.scala 25:55]
  wire  _T_97 = ~io_ins[4]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_99 = ~io_ins[3]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_100 = _T_97 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_101 = _T_95 | _T_100; // @[el2_dec_dec_ctl.scala 26:29]
  wire  _T_103 = ~io_ins[6]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_106 = _T_103 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_113 = io_ins[5] & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_114 = _T_113 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_120 = _T_103 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_121 = _T_120 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_129 = _T_100 & io_ins[2]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_136 = io_ins[13] & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_137 = _T_136 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_138 = _T_137 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_139 = _T_129 | _T_138; // @[el2_dec_dec_ctl.scala 28:42]
  wire  _T_143 = ~io_ins[12]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_146 = _T_16 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_147 = _T_146 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_148 = _T_147 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_149 = _T_139 | _T_148; // @[el2_dec_dec_ctl.scala 28:70]
  wire  _T_157 = _T_143 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_158 = _T_157 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_159 = _T_158 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_165 = _T_9 & _T_18; // @[el2_dec_dec_ctl.scala 30:28]
  wire  _T_168 = io_ins[5] & io_ins[2]; // @[el2_dec_dec_ctl.scala 30:55]
  wire  _T_169 = _T_165 | _T_168; // @[el2_dec_dec_ctl.scala 30:42]
  wire  _T_180 = _T_16 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_181 = _T_180 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_182 = _T_181 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_186 = io_ins[5] & io_ins[3]; // @[el2_dec_dec_ctl.scala 32:29]
  wire  _T_189 = io_ins[4] & io_ins[2]; // @[el2_dec_dec_ctl.scala 32:53]
  wire  _T_195 = _T_9 & _T_99; // @[el2_dec_dec_ctl.scala 33:28]
  wire  _T_197 = _T_195 & io_ins[2]; // @[el2_dec_dec_ctl.scala 33:41]
  wire  _T_208 = _T_9 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_223 = _T_103 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_235 = _T_19 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_236 = _T_235 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_237 = _T_236 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_245 = _T_237 | _T_197; // @[el2_dec_dec_ctl.scala 37:49]
  wire  _T_247 = ~io_ins[30]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_261 = _T_247 & _T_4; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_262 = _T_261 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_263 = _T_262 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_264 = _T_263 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_265 = _T_264 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_266 = _T_265 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_267 = _T_266 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_278 = io_ins[30] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_279 = _T_278 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_280 = _T_279 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_281 = _T_280 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_282 = _T_281 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_293 = _T_4 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_294 = _T_293 & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_295 = _T_294 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_296 = _T_295 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_297 = _T_296 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_298 = _T_282 | _T_297; // @[el2_dec_dec_ctl.scala 39:49]
  wire  _T_307 = _T_14 & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_308 = _T_307 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_309 = _T_308 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_310 = _T_309 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_311 = _T_298 | _T_310; // @[el2_dec_dec_ctl.scala 39:85]
  wire  _T_317 = io_ins[6] & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_318 = _T_317 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_327 = io_ins[14] & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_328 = _T_327 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_329 = _T_328 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_330 = _T_329 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_340 = _T_4 & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_341 = _T_340 & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_342 = _T_341 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_343 = _T_342 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_344 = _T_343 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_349 = _T_103 & io_ins[3]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_362 = _T_341 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_363 = _T_362 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_364 = _T_363 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_365 = _T_349 | _T_364; // @[el2_dec_dec_ctl.scala 42:37]
  wire  _T_369 = io_ins[5] & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_370 = _T_369 & io_ins[2]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_371 = _T_365 | _T_370; // @[el2_dec_dec_ctl.scala 42:74]
  wire  _T_381 = _T_371 | _T_148; // @[el2_dec_dec_ctl.scala 43:26]
  wire  _T_391 = _T_327 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_392 = _T_391 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_393 = _T_392 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_406 = _T_340 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_407 = _T_406 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_408 = _T_407 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_409 = _T_408 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_420 = io_ins[14] & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_421 = _T_420 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_422 = _T_421 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_423 = _T_422 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_424 = _T_423 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_439 = _T_293 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_440 = _T_439 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_441 = _T_440 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_442 = _T_441 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_453 = io_ins[30] & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_454 = _T_453 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_455 = _T_454 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_456 = _T_455 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_472 = _T_261 & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_473 = _T_472 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_474 = _T_473 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_475 = _T_474 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_476 = _T_475 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_515 = _T_307 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_516 = _T_515 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_517 = _T_516 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_524 = io_ins[13] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_525 = _T_524 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_526 = _T_525 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_527 = _T_517 | _T_526; // @[el2_dec_dec_ctl.scala 50:51]
  wire  _T_533 = io_ins[14] & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_534 = _T_533 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_535 = _T_527 | _T_534; // @[el2_dec_dec_ctl.scala 50:79]
  wire  _T_548 = _T_294 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_549 = _T_548 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_550 = _T_549 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_551 = _T_535 | _T_550; // @[el2_dec_dec_ctl.scala 51:29]
  wire  _T_560 = io_ins[25] & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_561 = _T_560 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_562 = _T_561 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_563 = _T_562 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_564 = _T_563 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_582 = _T_14 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_583 = _T_582 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_584 = _T_583 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_594 = _T_14 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_595 = _T_594 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_596 = _T_595 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_605 = io_ins[14] & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_606 = _T_605 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_607 = _T_606 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_617 = io_ins[14] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_618 = _T_617 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_619 = _T_618 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_635 = _T_146 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_636 = _T_635 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_645 = io_ins[12] & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_646 = _T_645 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_653 = io_ins[13] & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_659 = _T_524 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_663 = io_ins[7] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_664 = _T_663 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_665 = _T_659 | _T_664; // @[el2_dec_dec_ctl.scala 62:44]
  wire  _T_669 = io_ins[8] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_670 = _T_669 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_671 = _T_665 | _T_670; // @[el2_dec_dec_ctl.scala 62:67]
  wire  _T_675 = io_ins[9] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_676 = _T_675 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_677 = _T_671 | _T_676; // @[el2_dec_dec_ctl.scala 63:26]
  wire  _T_681 = io_ins[10] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_682 = _T_681 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_683 = _T_677 | _T_682; // @[el2_dec_dec_ctl.scala 63:49]
  wire  _T_687 = io_ins[11] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_688 = _T_687 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_696 = _T_93 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_697 = _T_696 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_698 = _T_697 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_705 = _T_78 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_706 = _T_705 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_707 = _T_706 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_708 = _T_698 | _T_707; // @[el2_dec_dec_ctl.scala 65:49]
  wire  _T_715 = _T_63 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_716 = _T_715 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_717 = _T_716 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_718 = _T_708 | _T_717; // @[el2_dec_dec_ctl.scala 65:79]
  wire  _T_724 = io_ins[18] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_725 = _T_724 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_726 = _T_725 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_727 = _T_718 | _T_726; // @[el2_dec_dec_ctl.scala 66:33]
  wire  _T_733 = io_ins[19] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_734 = _T_733 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_735 = _T_734 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_743 = _T_180 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_751 = _T_420 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_752 = _T_751 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_757 = io_ins[15] & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_758 = _T_757 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_759 = _T_758 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_760 = _T_752 | _T_759; // @[el2_dec_dec_ctl.scala 69:47]
  wire  _T_765 = io_ins[16] & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_766 = _T_765 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_767 = _T_766 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_768 = _T_760 | _T_767; // @[el2_dec_dec_ctl.scala 69:74]
  wire  _T_773 = io_ins[17] & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_774 = _T_773 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_775 = _T_774 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_776 = _T_768 | _T_775; // @[el2_dec_dec_ctl.scala 70:30]
  wire  _T_781 = io_ins[18] & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_782 = _T_781 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_783 = _T_782 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_784 = _T_776 | _T_783; // @[el2_dec_dec_ctl.scala 70:57]
  wire  _T_789 = io_ins[19] & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_790 = _T_789 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_791 = _T_790 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_798 = io_ins[15] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_799 = _T_798 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_800 = _T_799 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_806 = io_ins[16] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_807 = _T_806 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_808 = _T_807 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_809 = _T_800 | _T_808; // @[el2_dec_dec_ctl.scala 72:47]
  wire  _T_815 = io_ins[17] & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_816 = _T_815 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_817 = _T_816 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_818 = _T_809 | _T_817; // @[el2_dec_dec_ctl.scala 72:75]
  wire  _T_827 = _T_818 | _T_726; // @[el2_dec_dec_ctl.scala 73:31]
  wire  _T_838 = ~io_ins[22]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_846 = _T_838 & io_ins[20]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_847 = _T_846 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_848 = _T_847 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_849 = _T_848 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_852 = ~io_ins[21]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_854 = ~io_ins[20]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_861 = _T_852 & _T_854; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_862 = _T_861 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_863 = _T_862 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_864 = _T_863 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_873 = io_ins[29] & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_874 = _T_873 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_875 = _T_874 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_886 = io_ins[25] & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_887 = _T_886 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_888 = _T_887 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_889 = _T_888 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_904 = _T_886 & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_905 = _T_904 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_906 = _T_905 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_907 = _T_906 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_908 = _T_907 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_909 = _T_908 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_922 = _T_886 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_923 = _T_922 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_924 = _T_923 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_925 = _T_924 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_926 = _T_925 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_958 = _T_922 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_959 = _T_958 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_960 = _T_959 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_970 = _T_560 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_971 = _T_970 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_982 = _T_560 & io_ins[13]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_983 = _T_982 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_984 = _T_983 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_989 = _T_9 & io_ins[3]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_994 = io_ins[12] & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_995 = _T_994 & io_ins[3]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1003 = io_ins[28] & io_ins[22]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1004 = _T_1003 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1005 = _T_1004 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1006 = _T_1005 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1010 = _T_1006 | _T_189; // @[el2_dec_dec_ctl.scala 87:51]
  wire  _T_1016 = _T_4 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1017 = _T_1016 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1018 = _T_1010 | _T_1017; // @[el2_dec_dec_ctl.scala 87:72]
  wire  _T_1034 = _T_86 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1035 = _T_1034 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1036 = _T_989 | _T_1035; // @[el2_dec_dec_ctl.scala 89:41]
  wire  _T_1043 = _T_71 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1044 = _T_1043 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1045 = _T_1036 | _T_1044; // @[el2_dec_dec_ctl.scala 89:68]
  wire  _T_1052 = _T_56 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1053 = _T_1052 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1054 = _T_1045 | _T_1053; // @[el2_dec_dec_ctl.scala 90:30]
  wire  _T_1061 = _T_41 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1062 = _T_1061 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1063 = _T_1054 | _T_1062; // @[el2_dec_dec_ctl.scala 90:57]
  wire  _T_1070 = _T_26 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1071 = _T_1070 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1072 = _T_1063 | _T_1071; // @[el2_dec_dec_ctl.scala 91:31]
  wire  _T_1078 = _T_93 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1079 = _T_1078 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1080 = _T_1072 | _T_1079; // @[el2_dec_dec_ctl.scala 91:59]
  wire  _T_1086 = _T_78 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1087 = _T_1086 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1088 = _T_1080 | _T_1087; // @[el2_dec_dec_ctl.scala 92:30]
  wire  _T_1094 = _T_63 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1095 = _T_1094 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1096 = _T_1088 | _T_1095; // @[el2_dec_dec_ctl.scala 92:57]
  wire  _T_1102 = _T_48 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1103 = _T_1102 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1104 = _T_1096 | _T_1103; // @[el2_dec_dec_ctl.scala 93:30]
  wire  _T_1110 = _T_33 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1111 = _T_1110 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1127 = _T_838 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1128 = _T_1127 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1129 = _T_1128 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1130 = _T_1129 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1131 = _T_995 | _T_1130; // @[el2_dec_dec_ctl.scala 95:45]
  wire  _T_1140 = _T_1131 | _T_1035; // @[el2_dec_dec_ctl.scala 95:78]
  wire  _T_1149 = _T_1140 | _T_1044; // @[el2_dec_dec_ctl.scala 96:30]
  wire  _T_1158 = _T_1149 | _T_1053; // @[el2_dec_dec_ctl.scala 96:57]
  wire  _T_1167 = _T_1158 | _T_1062; // @[el2_dec_dec_ctl.scala 97:30]
  wire  _T_1176 = _T_1167 | _T_1071; // @[el2_dec_dec_ctl.scala 97:58]
  wire  _T_1184 = _T_1176 | _T_1079; // @[el2_dec_dec_ctl.scala 98:31]
  wire  _T_1192 = _T_1184 | _T_1087; // @[el2_dec_dec_ctl.scala 98:58]
  wire  _T_1200 = _T_1192 | _T_1095; // @[el2_dec_dec_ctl.scala 99:30]
  wire  _T_1208 = _T_1200 | _T_1103; // @[el2_dec_dec_ctl.scala 99:57]
  wire  _T_1218 = ~io_ins[31]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1224 = ~io_ins[27]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1226 = ~io_ins[26]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1230 = ~io_ins[24]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1232 = ~io_ins[23]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1239 = ~io_ins[19]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1241 = ~io_ins[18]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1243 = ~io_ins[17]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1245 = ~io_ins[16]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1247 = ~io_ins[15]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1251 = ~io_ins[11]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1253 = ~io_ins[10]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1255 = ~io_ins[9]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1257 = ~io_ins[8]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1259 = ~io_ins[7]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1269 = _T_1218 & _T_247; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1270 = _T_1269 & io_ins[29]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1271 = _T_1270 & io_ins[28]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1272 = _T_1271 & _T_1224; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1273 = _T_1272 & _T_1226; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1274 = _T_1273 & _T_4; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1275 = _T_1274 & _T_1230; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1276 = _T_1275 & _T_1232; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1277 = _T_1276 & _T_838; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1278 = _T_1277 & io_ins[21]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1279 = _T_1278 & _T_854; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1280 = _T_1279 & _T_1239; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1281 = _T_1280 & _T_1241; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1282 = _T_1281 & _T_1243; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1283 = _T_1282 & _T_1245; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1284 = _T_1283 & _T_1247; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1285 = _T_1284 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1286 = _T_1285 & _T_1251; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1287 = _T_1286 & _T_1253; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1288 = _T_1287 & _T_1255; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1289 = _T_1288 & _T_1257; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1290 = _T_1289 & _T_1259; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1291 = _T_1290 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1292 = _T_1291 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1293 = _T_1292 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1294 = _T_1293 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1295 = _T_1294 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1296 = _T_1295 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1297 = _T_1296 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1303 = ~io_ins[29]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1351 = _T_1269 & _T_1303; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1352 = _T_1351 & io_ins[28]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1353 = _T_1352 & _T_1224; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1354 = _T_1353 & _T_1226; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1355 = _T_1354 & _T_4; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1356 = _T_1355 & _T_1230; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1357 = _T_1356 & _T_1232; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1358 = _T_1357 & io_ins[22]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1359 = _T_1358 & _T_852; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1360 = _T_1359 & io_ins[20]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1361 = _T_1360 & _T_1239; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1362 = _T_1361 & _T_1241; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1363 = _T_1362 & _T_1243; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1364 = _T_1363 & _T_1245; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1365 = _T_1364 & _T_1247; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1366 = _T_1365 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1367 = _T_1366 & _T_1251; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1368 = _T_1367 & _T_1253; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1369 = _T_1368 & _T_1255; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1370 = _T_1369 & _T_1257; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1371 = _T_1370 & _T_1259; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1372 = _T_1371 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1373 = _T_1372 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1374 = _T_1373 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1375 = _T_1374 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1376 = _T_1375 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1377 = _T_1376 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1378 = _T_1377 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1379 = _T_1297 | _T_1378; // @[el2_dec_dec_ctl.scala 101:136]
  wire  _T_1387 = ~io_ins[28]; // @[el2_dec_dec_ctl.scala 15:46]
  wire  _T_1434 = _T_1351 & _T_1387; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1435 = _T_1434 & _T_1224; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1436 = _T_1435 & _T_1226; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1437 = _T_1436 & _T_4; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1438 = _T_1437 & _T_1230; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1439 = _T_1438 & _T_1232; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1440 = _T_1439 & _T_838; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1441 = _T_1440 & _T_852; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1442 = _T_1441 & _T_1239; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1443 = _T_1442 & _T_1241; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1444 = _T_1443 & _T_1243; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1445 = _T_1444 & _T_1245; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1446 = _T_1445 & _T_1247; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1447 = _T_1446 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1448 = _T_1447 & _T_1251; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1449 = _T_1448 & _T_1253; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1450 = _T_1449 & _T_1255; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1451 = _T_1450 & _T_1257; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1452 = _T_1451 & _T_1259; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1453 = _T_1452 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1454 = _T_1453 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1455 = _T_1454 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1456 = _T_1455 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1457 = _T_1456 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1458 = _T_1457 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1459 = _T_1379 | _T_1458; // @[el2_dec_dec_ctl.scala 102:122]
  wire  _T_1487 = _T_1437 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1488 = _T_1487 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1489 = _T_1488 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1490 = _T_1489 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1491 = _T_1490 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1492 = _T_1459 | _T_1491; // @[el2_dec_dec_ctl.scala 103:119]
  wire  _T_1519 = _T_1218 & _T_1303; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1520 = _T_1519 & _T_1387; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1521 = _T_1520 & _T_1224; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1522 = _T_1521 & _T_1226; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1523 = _T_1522 & _T_4; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1524 = _T_1523 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1525 = _T_1524 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1526 = _T_1525 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1527 = _T_1526 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1528 = _T_1527 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1529 = _T_1528 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1530 = _T_1529 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1531 = _T_1530 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1532 = _T_1492 | _T_1531; // @[el2_dec_dec_ctl.scala 104:60]
  wire  _T_1561 = _T_1523 & io_ins[14]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1562 = _T_1561 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1563 = _T_1562 & io_ins[12]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1564 = _T_1563 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1565 = _T_1564 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1566 = _T_1565 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1567 = _T_1566 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1568 = _T_1567 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1569 = _T_1532 | _T_1568; // @[el2_dec_dec_ctl.scala 105:69]
  wire  _T_1595 = _T_1436 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1596 = _T_1595 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1597 = _T_1596 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1598 = _T_1597 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1599 = _T_1598 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1600 = _T_1599 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1601 = _T_1569 | _T_1600; // @[el2_dec_dec_ctl.scala 106:66]
  wire  _T_1618 = _T_235 & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1619 = _T_1618 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1620 = _T_1619 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1621 = _T_1620 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1622 = _T_1621 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1623 = _T_1622 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1624 = _T_1601 | _T_1623; // @[el2_dec_dec_ctl.scala 107:58]
  wire  _T_1636 = io_ins[14] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1637 = _T_1636 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1638 = _T_1637 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1639 = _T_1638 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1640 = _T_1639 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1641 = _T_1640 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1642 = _T_1641 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1643 = _T_1624 | _T_1642; // @[el2_dec_dec_ctl.scala 108:46]
  wire  _T_1655 = _T_143 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1656 = _T_1655 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1657 = _T_1656 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1658 = _T_1657 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1659 = _T_1658 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1660 = _T_1659 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1661 = _T_1643 | _T_1660; // @[el2_dec_dec_ctl.scala 109:40]
  wire  _T_1676 = _T_19 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1677 = _T_1676 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1678 = _T_1677 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1679 = _T_1678 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1680 = _T_1679 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1681 = _T_1680 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1682 = _T_1661 | _T_1681; // @[el2_dec_dec_ctl.scala 110:39]
  wire  _T_1693 = io_ins[12] & io_ins[6]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1694 = _T_1693 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1695 = _T_1694 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1696 = _T_1695 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1697 = _T_1696 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1698 = _T_1697 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1699 = _T_1698 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1700 = _T_1682 | _T_1699; // @[el2_dec_dec_ctl.scala 111:43]
  wire  _T_1769 = _T_1441 & _T_854; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1770 = _T_1769 & _T_1239; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1771 = _T_1770 & _T_1241; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1772 = _T_1771 & _T_1243; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1773 = _T_1772 & _T_1245; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1774 = _T_1773 & _T_1247; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1775 = _T_1774 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1776 = _T_1775 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1777 = _T_1776 & _T_1251; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1778 = _T_1777 & _T_1253; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1779 = _T_1778 & _T_1255; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1780 = _T_1779 & _T_1257; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1781 = _T_1780 & _T_1259; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1782 = _T_1781 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1783 = _T_1782 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1784 = _T_1783 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1785 = _T_1784 & io_ins[3]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1786 = _T_1785 & io_ins[2]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1787 = _T_1786 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1788 = _T_1787 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1789 = _T_1700 | _T_1788; // @[el2_dec_dec_ctl.scala 112:39]
  wire  _T_1837 = _T_1434 & _T_1239; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1838 = _T_1837 & _T_1241; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1839 = _T_1838 & _T_1243; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1840 = _T_1839 & _T_1245; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1841 = _T_1840 & _T_1247; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1842 = _T_1841 & _T_14; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1843 = _T_1842 & _T_16; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1844 = _T_1843 & _T_143; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1845 = _T_1844 & _T_1251; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1846 = _T_1845 & _T_1253; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1847 = _T_1846 & _T_1255; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1848 = _T_1847 & _T_1257; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1849 = _T_1848 & _T_1259; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1850 = _T_1849 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1851 = _T_1850 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1852 = _T_1851 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1853 = _T_1852 & io_ins[3]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1854 = _T_1853 & io_ins[2]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1855 = _T_1854 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1856 = _T_1855 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1857 = _T_1789 | _T_1856; // @[el2_dec_dec_ctl.scala 113:130]
  wire  _T_1869 = _T_524 & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1870 = _T_1869 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1871 = _T_1870 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1872 = _T_1871 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1873 = _T_1872 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1874 = _T_1873 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1875 = _T_1857 | _T_1874; // @[el2_dec_dec_ctl.scala 114:102]
  wire  _T_1890 = _T_16 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1891 = _T_1890 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1892 = _T_1891 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1893 = _T_1892 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1894 = _T_1893 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1895 = _T_1894 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1896 = _T_1895 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1897 = _T_1875 | _T_1896; // @[el2_dec_dec_ctl.scala 115:39]
  wire  _T_1906 = io_ins[6] & io_ins[5]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1907 = _T_1906 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1908 = _T_1907 & io_ins[3]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1909 = _T_1908 & io_ins[2]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1910 = _T_1909 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1911 = _T_1910 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1912 = _T_1897 | _T_1911; // @[el2_dec_dec_ctl.scala 116:43]
  wire  _T_1924 = _T_653 & _T_9; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1925 = _T_1924 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1926 = _T_1925 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1927 = _T_1926 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1928 = _T_1927 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1929 = _T_1912 | _T_1928; // @[el2_dec_dec_ctl.scala 117:35]
  wire  _T_1945 = _T_582 & _T_103; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1946 = _T_1945 & _T_97; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1947 = _T_1946 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1948 = _T_1947 & _T_18; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1949 = _T_1948 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1950 = _T_1949 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1951 = _T_1929 | _T_1950; // @[el2_dec_dec_ctl.scala 118:38]
  wire  _T_1960 = _T_103 & io_ins[4]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1961 = _T_1960 & _T_99; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1962 = _T_1961 & io_ins[2]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1963 = _T_1962 & io_ins[1]; // @[el2_dec_dec_ctl.scala 17:17]
  wire  _T_1964 = _T_1963 & io_ins[0]; // @[el2_dec_dec_ctl.scala 17:17]
  assign io_out_alu = _T_7 | _T_11; // @[el2_dec_dec_ctl.scala 20:14]
  assign io_out_rs2 = _T_114 | _T_121; // @[el2_dec_dec_ctl.scala 27:14]
  assign io_out_rs1 = _T_101 | _T_106; // @[el2_dec_dec_ctl.scala 21:14]
  assign io_out_imm12 = _T_149 | _T_159; // @[el2_dec_dec_ctl.scala 28:16]
  assign io_out_rd = _T_169 | io_ins[4]; // @[el2_dec_dec_ctl.scala 30:13]
  assign io_out_shimm5 = _T_182 & _T_18; // @[el2_dec_dec_ctl.scala 31:17]
  assign io_out_imm20 = _T_186 | _T_189; // @[el2_dec_dec_ctl.scala 32:16]
  assign io_out_pc = _T_197 | _T_186; // @[el2_dec_dec_ctl.scala 33:13]
  assign io_out_load = _T_208 & _T_18; // @[el2_dec_dec_ctl.scala 34:15]
  assign io_out_store = _T_120 & _T_97; // @[el2_dec_dec_ctl.scala 35:16]
  assign io_out_lsu = _T_223 & _T_18; // @[el2_dec_dec_ctl.scala 36:14]
  assign io_out_add = _T_245 | _T_267; // @[el2_dec_dec_ctl.scala 37:14]
  assign io_out_sub = _T_311 | _T_318; // @[el2_dec_dec_ctl.scala 39:14]
  assign io_out_land = _T_330 | _T_344; // @[el2_dec_dec_ctl.scala 41:15]
  assign io_out_lor = _T_381 | _T_393; // @[el2_dec_dec_ctl.scala 42:14]
  assign io_out_lxor = _T_409 | _T_424; // @[el2_dec_dec_ctl.scala 45:15]
  assign io_out_sll = _T_442 & _T_18; // @[el2_dec_dec_ctl.scala 46:14]
  assign io_out_sra = _T_456 & _T_18; // @[el2_dec_dec_ctl.scala 47:14]
  assign io_out_srl = _T_476 & _T_18; // @[el2_dec_dec_ctl.scala 48:14]
  assign io_out_slt = _T_297 | _T_310; // @[el2_dec_dec_ctl.scala 49:14]
  assign io_out_unsign = _T_551 | _T_564; // @[el2_dec_dec_ctl.scala 50:17]
  assign io_out_condbr = _T_317 & _T_18; // @[el2_dec_dec_ctl.scala 53:17]
  assign io_out_beq = _T_584 & _T_18; // @[el2_dec_dec_ctl.scala 54:14]
  assign io_out_bne = _T_596 & _T_18; // @[el2_dec_dec_ctl.scala 55:14]
  assign io_out_bge = _T_607 & _T_18; // @[el2_dec_dec_ctl.scala 56:14]
  assign io_out_blt = _T_619 & _T_18; // @[el2_dec_dec_ctl.scala 57:14]
  assign io_out_jal = io_ins[6] & io_ins[2]; // @[el2_dec_dec_ctl.scala 58:14]
  assign io_out_by = _T_636 & _T_18; // @[el2_dec_dec_ctl.scala 59:13]
  assign io_out_half = _T_646 & _T_18; // @[el2_dec_dec_ctl.scala 60:15]
  assign io_out_word = _T_653 & _T_97; // @[el2_dec_dec_ctl.scala 61:15]
  assign io_out_csr_read = _T_683 | _T_688; // @[el2_dec_dec_ctl.scala 62:19]
  assign io_out_csr_clr = _T_727 | _T_735; // @[el2_dec_dec_ctl.scala 65:18]
  assign io_out_csr_set = _T_827 | _T_735; // @[el2_dec_dec_ctl.scala 72:18]
  assign io_out_csr_write = _T_743 & io_ins[4]; // @[el2_dec_dec_ctl.scala 68:20]
  assign io_out_csr_imm = _T_784 | _T_791; // @[el2_dec_dec_ctl.scala 69:18]
  assign io_out_presync = _T_1104 | _T_1111; // @[el2_dec_dec_ctl.scala 89:18]
  assign io_out_postsync = _T_1208 | _T_1111; // @[el2_dec_dec_ctl.scala 95:19]
  assign io_out_ebreak = _T_849 & io_ins[4]; // @[el2_dec_dec_ctl.scala 75:17]
  assign io_out_ecall = _T_864 & io_ins[4]; // @[el2_dec_dec_ctl.scala 76:16]
  assign io_out_mret = _T_875 & io_ins[4]; // @[el2_dec_dec_ctl.scala 77:15]
  assign io_out_mul = _T_889 & _T_18; // @[el2_dec_dec_ctl.scala 78:14]
  assign io_out_rs1_sign = _T_909 | _T_926; // @[el2_dec_dec_ctl.scala 79:19]
  assign io_out_rs2_sign = _T_925 & _T_18; // @[el2_dec_dec_ctl.scala 81:19]
  assign io_out_low = _T_960 & _T_18; // @[el2_dec_dec_ctl.scala 82:14]
  assign io_out_div = _T_971 & _T_18; // @[el2_dec_dec_ctl.scala 83:14]
  assign io_out_rem = _T_984 & _T_18; // @[el2_dec_dec_ctl.scala 84:14]
  assign io_out_fence = _T_9 & io_ins[3]; // @[el2_dec_dec_ctl.scala 85:16]
  assign io_out_fence_i = _T_994 & io_ins[3]; // @[el2_dec_dec_ctl.scala 86:18]
  assign io_out_pm_alu = _T_1018 | _T_11; // @[el2_dec_dec_ctl.scala 87:17]
  assign io_out_legal = _T_1951 | _T_1964; // @[el2_dec_dec_ctl.scala 101:16]
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
  input  [2:0]  io_lsu_nonblock_load_tag_m,
  input         io_lsu_nonblock_load_inv_r,
  input  [2:0]  io_lsu_nonblock_load_inv_tag_r,
  input         io_lsu_nonblock_load_data_valid,
  input         io_lsu_nonblock_load_data_error,
  input  [2:0]  io_lsu_nonblock_load_data_tag,
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
  input  [11:0] io_dec_i0_brp_toffset,
  input  [1:0]  io_dec_i0_brp_hist,
  input         io_dec_i0_brp_br_error,
  input         io_dec_i0_brp_br_start_error,
  input         io_dec_i0_brp_bank,
  input  [30:0] io_dec_i0_brp_prett,
  input         io_dec_i0_brp_way,
  input         io_dec_i0_brp_ret,
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
  output        io_lsu_p_fast_int,
  output        io_lsu_p_by,
  output        io_lsu_p_half,
  output        io_lsu_p_word,
  output        io_lsu_p_dword,
  output        io_lsu_p_load,
  output        io_lsu_p_store,
  output        io_lsu_p_unsign,
  output        io_lsu_p_dma,
  output        io_lsu_p_store_data_bypass_d,
  output        io_lsu_p_load_ldst_bypass_d,
  output        io_lsu_p_store_data_bypass_m,
  output        io_lsu_p_valid,
  output        io_mul_p_valid,
  output        io_mul_p_rs1_sign,
  output        io_mul_p_rs2_sign,
  output        io_mul_p_low,
  output        io_mul_p_bext,
  output        io_mul_p_bdep,
  output        io_mul_p_clmul,
  output        io_mul_p_clmulh,
  output        io_mul_p_clmulr,
  output        io_mul_p_grev,
  output        io_mul_p_shfl,
  output        io_mul_p_unshfl,
  output        io_mul_p_crc32_b,
  output        io_mul_p_crc32_h,
  output        io_mul_p_crc32_w,
  output        io_mul_p_crc32c_b,
  output        io_mul_p_crc32c_h,
  output        io_mul_p_crc32c_w,
  output        io_mul_p_bfp,
  output        io_div_p_valid,
  output        io_div_p_unsign,
  output        io_div_p_rem,
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
  output        io_dec_i0_predict_p_d_misp,
  output        io_dec_i0_predict_p_d_ataken,
  output        io_dec_i0_predict_p_d_boffset,
  output        io_dec_i0_predict_p_d_pc4,
  output [1:0]  io_dec_i0_predict_p_d_hist,
  output [11:0] io_dec_i0_predict_p_d_toffset,
  output        io_dec_i0_predict_p_d_valid,
  output        io_dec_i0_predict_p_d_br_error,
  output        io_dec_i0_predict_p_d_br_start_error,
  output [30:0] io_dec_i0_predict_p_d_prett,
  output        io_dec_i0_predict_p_d_pcall,
  output        io_dec_i0_predict_p_d_pret,
  output        io_dec_i0_predict_p_d_pja,
  output        io_dec_i0_predict_p_d_way,
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
  wire  data_gated_cgc_io_l1clk; // @[el2_dec_decode_ctl.scala 221:29]
  wire  data_gated_cgc_io_clk; // @[el2_dec_decode_ctl.scala 221:29]
  wire  data_gated_cgc_io_en; // @[el2_dec_decode_ctl.scala 221:29]
  wire  data_gated_cgc_io_scan_mode; // @[el2_dec_decode_ctl.scala 221:29]
  wire [31:0] i0_dec_io_ins; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_alu; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_rs2; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_rs1; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_imm12; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_rd; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_shimm5; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_imm20; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_pc; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_load; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_store; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_lsu; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_add; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_sub; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_land; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_lor; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_lxor; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_sll; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_sra; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_srl; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_slt; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_unsign; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_condbr; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_beq; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_bne; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_bge; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_blt; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_jal; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_by; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_half; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_word; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_csr_read; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_csr_clr; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_csr_set; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_csr_write; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_csr_imm; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_presync; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_postsync; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_ebreak; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_ecall; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_mret; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_mul; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_rs1_sign; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_rs2_sign; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_low; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_div; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_rem; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_fence; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_fence_i; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_pm_alu; // @[el2_dec_decode_ctl.scala 396:24]
  wire  i0_dec_io_out_legal; // @[el2_dec_decode_ctl.scala 396:24]
  wire  rvclkhdr_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_2_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_2_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_2_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_2_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_3_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_3_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_3_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_3_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_4_io_l1clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_4_io_clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_4_io_en; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_4_io_scan_mode; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_5_io_l1clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_5_io_clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_5_io_en; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_5_io_scan_mode; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_6_io_l1clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_6_io_clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_6_io_en; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_6_io_scan_mode; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_7_io_l1clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_7_io_clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_7_io_en; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_7_io_scan_mode; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_8_io_l1clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_8_io_clk; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_8_io_en; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_8_io_scan_mode; // @[beh_lib.scala 360:21]
  wire  rvclkhdr_9_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_9_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_9_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_9_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_10_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_10_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_10_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_10_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_11_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_11_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_11_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_11_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_12_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_12_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_12_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_12_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_13_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_13_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_13_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_13_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_14_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_14_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_14_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_14_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_15_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_15_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_15_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_15_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_16_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_16_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_16_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_16_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_17_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_17_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_17_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_17_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_18_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_18_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_18_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_18_io_scan_mode; // @[beh_lib.scala 350:21]
  reg  tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 503:29]
  wire  _T_1 = io_dec_tlu_wr_pause_r ^ tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 211:51]
  reg  tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 504:29]
  wire  _T_2 = tlu_wr_pause_r1 ^ tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 212:50]
  wire  _T_3 = _T_1 | _T_2; // @[el2_dec_decode_ctl.scala 211:73]
  wire  _T_4 = io_dec_tlu_flush_extint ^ io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 213:50]
  wire  _T_5 = _T_3 | _T_4; // @[el2_dec_decode_ctl.scala 212:74]
  reg  leak1_i1_stall; // @[el2_dec_decode_ctl.scala 404:56]
  wire  _T_279 = ~io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 403:73]
  wire  _T_280 = leak1_i1_stall & _T_279; // @[el2_dec_decode_ctl.scala 403:71]
  wire  leak1_i1_stall_in = io_dec_tlu_flush_leak_one_r | _T_280; // @[el2_dec_decode_ctl.scala 403:53]
  wire  _T_6 = leak1_i1_stall_in ^ leak1_i1_stall; // @[el2_dec_decode_ctl.scala 214:50]
  wire  _T_7 = _T_5 | _T_6; // @[el2_dec_decode_ctl.scala 213:74]
  wire  _T_283 = io_dec_i0_decode_d & leak1_i1_stall; // @[el2_dec_decode_ctl.scala 406:45]
  reg  leak1_i0_stall; // @[el2_dec_decode_ctl.scala 407:56]
  wire  _T_285 = leak1_i0_stall & _T_279; // @[el2_dec_decode_ctl.scala 406:81]
  wire  leak1_i0_stall_in = _T_283 | _T_285; // @[el2_dec_decode_ctl.scala 406:63]
  wire  _T_8 = leak1_i0_stall_in ^ leak1_i0_stall; // @[el2_dec_decode_ctl.scala 215:50]
  wire  _T_9 = _T_7 | _T_8; // @[el2_dec_decode_ctl.scala 214:74]
  reg  pause_stall; // @[el2_dec_decode_ctl.scala 501:50]
  wire  _T_412 = io_dec_tlu_wr_pause_r | pause_stall; // @[el2_dec_decode_ctl.scala 500:44]
  wire  _T_408 = ~io_dec_tlu_flush_pause_r; // @[el2_dec_decode_ctl.scala 499:49]
  wire  _T_409 = io_dec_tlu_flush_lower_r & _T_408; // @[el2_dec_decode_ctl.scala 499:47]
  reg [31:0] write_csr_data; // @[beh_lib.scala 356:14]
  wire  _T_410 = write_csr_data == 32'h0; // @[el2_dec_decode_ctl.scala 499:109]
  wire  _T_411 = pause_stall & _T_410; // @[el2_dec_decode_ctl.scala 499:91]
  wire  clear_pause = _T_409 | _T_411; // @[el2_dec_decode_ctl.scala 499:76]
  wire  _T_413 = ~clear_pause; // @[el2_dec_decode_ctl.scala 500:61]
  wire  pause_state_in = _T_412 & _T_413; // @[el2_dec_decode_ctl.scala 500:59]
  wire  _T_10 = pause_state_in ^ pause_stall; // @[el2_dec_decode_ctl.scala 216:50]
  wire  _T_11 = _T_9 | _T_10; // @[el2_dec_decode_ctl.scala 215:74]
  wire  _T_17 = ~leak1_i1_stall; // @[el2_dec_decode_ctl.scala 229:62]
  wire  i0_brp_valid = io_dec_i0_brp_valid & _T_17; // @[el2_dec_decode_ctl.scala 229:60]
  wire  i0_dp_raw_condbr = i0_dec_io_out_condbr; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_jal = i0_dec_io_out_jal; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire [20:0] i0_pcall_imm = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21],1'h0}; // @[Cat.scala 29:58]
  wire  _T_298 = i0_pcall_imm[20:13] == 8'hff; // @[el2_dec_decode_ctl.scala 412:79]
  wire  _T_300 = i0_pcall_imm[20:13] == 8'h0; // @[el2_dec_decode_ctl.scala 412:112]
  wire  i0_pcall_12b_offset = i0_pcall_imm[12] ? _T_298 : _T_300; // @[el2_dec_decode_ctl.scala 412:33]
  wire  i0_dp_raw_imm20 = i0_dec_io_out_imm20; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  _T_301 = i0_pcall_12b_offset & i0_dp_raw_imm20; // @[el2_dec_decode_ctl.scala 413:47]
  wire [4:0] i0r_rd = io_dec_i0_instr_d[11:7]; // @[el2_dec_decode_ctl.scala 626:16]
  wire  _T_302 = i0r_rd == 5'h1; // @[el2_dec_decode_ctl.scala 413:76]
  wire  _T_303 = i0r_rd == 5'h5; // @[el2_dec_decode_ctl.scala 413:98]
  wire  _T_304 = _T_302 | _T_303; // @[el2_dec_decode_ctl.scala 413:89]
  wire  i0_pcall_case = _T_301 & _T_304; // @[el2_dec_decode_ctl.scala 413:65]
  wire  i0_pcall_raw = i0_dp_raw_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 415:38]
  wire  _T_19 = i0_dp_raw_condbr | i0_pcall_raw; // @[el2_dec_decode_ctl.scala 240:75]
  wire  _T_309 = ~_T_304; // @[el2_dec_decode_ctl.scala 414:67]
  wire  i0_pja_case = _T_301 & _T_309; // @[el2_dec_decode_ctl.scala 414:65]
  wire  i0_pja_raw = i0_dp_raw_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 417:38]
  wire  _T_20 = _T_19 | i0_pja_raw; // @[el2_dec_decode_ctl.scala 240:90]
  wire  i0_dp_raw_imm12 = i0_dec_io_out_imm12; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  _T_325 = i0_dp_raw_jal & i0_dp_raw_imm12; // @[el2_dec_decode_ctl.scala 421:37]
  wire  _T_326 = i0r_rd == 5'h0; // @[el2_dec_decode_ctl.scala 421:65]
  wire  _T_327 = _T_325 & _T_326; // @[el2_dec_decode_ctl.scala 421:55]
  wire [4:0] i0r_rs1 = io_dec_i0_instr_d[19:15]; // @[el2_dec_decode_ctl.scala 624:16]
  wire  _T_328 = i0r_rs1 == 5'h1; // @[el2_dec_decode_ctl.scala 421:89]
  wire  _T_329 = i0r_rs1 == 5'h5; // @[el2_dec_decode_ctl.scala 421:111]
  wire  _T_330 = _T_328 | _T_329; // @[el2_dec_decode_ctl.scala 421:101]
  wire  i0_pret_case = _T_327 & _T_330; // @[el2_dec_decode_ctl.scala 421:79]
  wire  i0_pret_raw = i0_dp_raw_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 422:32]
  wire  _T_21 = _T_20 | i0_pret_raw; // @[el2_dec_decode_ctl.scala 240:103]
  wire  _T_22 = ~_T_21; // @[el2_dec_decode_ctl.scala 240:56]
  wire  i0_notbr_error = i0_brp_valid & _T_22; // @[el2_dec_decode_ctl.scala 240:54]
  wire  _T_30 = io_dec_i0_brp_br_error | i0_notbr_error; // @[el2_dec_decode_ctl.scala 245:57]
  wire  _T_24 = i0_brp_valid & io_dec_i0_brp_hist[1]; // @[el2_dec_decode_ctl.scala 243:47]
  wire  _T_314 = i0_pcall_raw | i0_pja_raw; // @[el2_dec_decode_ctl.scala 419:41]
  wire [11:0] _T_323 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[7],io_dec_i0_instr_d[30:25],io_dec_i0_instr_d[11:8]}; // @[Cat.scala 29:58]
  wire [11:0] i0_br_offset = _T_314 ? i0_pcall_imm[12:1] : _T_323; // @[el2_dec_decode_ctl.scala 419:26]
  wire  _T_25 = io_dec_i0_brp_toffset != i0_br_offset; // @[el2_dec_decode_ctl.scala 243:96]
  wire  _T_26 = _T_24 & _T_25; // @[el2_dec_decode_ctl.scala 243:71]
  wire  _T_27 = ~i0_pret_raw; // @[el2_dec_decode_ctl.scala 243:116]
  wire  i0_br_toffset_error = _T_26 & _T_27; // @[el2_dec_decode_ctl.scala 243:114]
  wire  _T_31 = _T_30 | i0_br_toffset_error; // @[el2_dec_decode_ctl.scala 245:74]
  wire  _T_28 = i0_brp_valid & io_dec_i0_brp_ret; // @[el2_dec_decode_ctl.scala 244:47]
  wire  i0_ret_error = _T_28 & _T_27; // @[el2_dec_decode_ctl.scala 244:67]
  wire  i0_br_error = _T_31 | i0_ret_error; // @[el2_dec_decode_ctl.scala 245:96]
  wire  _T_38 = i0_br_error | io_dec_i0_brp_br_start_error; // @[el2_dec_decode_ctl.scala 250:47]
  wire  i0_br_error_all = _T_38 & _T_17; // @[el2_dec_decode_ctl.scala 250:79]
  wire  i0_icaf_d = io_dec_i0_icaf_d | io_dec_i0_dbecc_d; // @[el2_dec_decode_ctl.scala 259:36]
  wire  _T_40 = i0_br_error_all | i0_icaf_d; // @[el2_dec_decode_ctl.scala 263:25]
  wire  i0_dp_raw_postsync = i0_dec_io_out_postsync; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_postsync = _T_40 | i0_dp_raw_postsync; // @[el2_dec_decode_ctl.scala 263:50]
  wire  _T_439 = i0_dp_postsync | io_dec_tlu_postsync_d; // @[el2_dec_decode_ctl.scala 530:36]
  wire  debug_fence_i = io_dec_debug_fence_d & io_dbg_cmd_wrdata[0]; // @[el2_dec_decode_ctl.scala 522:48]
  wire  _T_440 = _T_439 | debug_fence_i; // @[el2_dec_decode_ctl.scala 530:60]
  wire  i0_dp_raw_csr_write = i0_dec_io_out_csr_write; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_csr_write = _T_40 ? 1'h0 : i0_dp_raw_csr_write; // @[el2_dec_decode_ctl.scala 263:50]
  wire  _T_343 = ~io_dec_debug_fence_d; // @[el2_dec_decode_ctl.scala 461:42]
  wire  i0_csr_write = i0_dp_csr_write & _T_343; // @[el2_dec_decode_ctl.scala 461:40]
  wire  i0_dp_raw_csr_read = i0_dec_io_out_csr_read; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_csr_read = _T_40 ? 1'h0 : i0_dp_raw_csr_read; // @[el2_dec_decode_ctl.scala 263:50]
  wire  _T_347 = ~i0_dp_csr_read; // @[el2_dec_decode_ctl.scala 466:41]
  wire  i0_csr_write_only_d = i0_csr_write & _T_347; // @[el2_dec_decode_ctl.scala 466:39]
  wire  _T_442 = io_dec_i0_instr_d[31:20] == 12'h7c2; // @[el2_dec_decode_ctl.scala 530:112]
  wire  _T_443 = i0_csr_write_only_d & _T_442; // @[el2_dec_decode_ctl.scala 530:99]
  wire  i0_postsync = _T_440 | _T_443; // @[el2_dec_decode_ctl.scala 530:76]
  wire  i0_dp_raw_legal = i0_dec_io_out_legal; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_legal = _T_40 | i0_dp_raw_legal; // @[el2_dec_decode_ctl.scala 263:50]
  wire  any_csr_d = i0_dp_csr_read | i0_csr_write; // @[el2_dec_decode_ctl.scala 532:34]
  wire  _T_444 = ~any_csr_d; // @[el2_dec_decode_ctl.scala 534:40]
  wire  _T_445 = _T_444 | io_dec_csr_legal_d; // @[el2_dec_decode_ctl.scala 534:51]
  wire  i0_legal = i0_dp_legal & _T_445; // @[el2_dec_decode_ctl.scala 534:37]
  wire  _T_504 = ~i0_legal; // @[el2_dec_decode_ctl.scala 574:56]
  wire  _T_505 = i0_postsync | _T_504; // @[el2_dec_decode_ctl.scala 574:54]
  wire  _T_506 = io_dec_i0_decode_d & _T_505; // @[el2_dec_decode_ctl.scala 574:39]
  reg  postsync_stall; // @[el2_dec_decode_ctl.scala 572:53]
  reg  x_d_i0valid; // @[beh_lib.scala 366:14]
  wire  _T_507 = postsync_stall & x_d_i0valid; // @[el2_dec_decode_ctl.scala 574:88]
  wire  ps_stall_in = _T_506 | _T_507; // @[el2_dec_decode_ctl.scala 574:69]
  wire  _T_12 = ps_stall_in ^ postsync_stall; // @[el2_dec_decode_ctl.scala 217:50]
  wire  _T_13 = _T_11 | _T_12; // @[el2_dec_decode_ctl.scala 216:74]
  reg  flush_final_r; // @[el2_dec_decode_ctl.scala 620:52]
  wire  _T_14 = io_exu_flush_final ^ flush_final_r; // @[el2_dec_decode_ctl.scala 218:50]
  wire  _T_15 = _T_13 | _T_14; // @[el2_dec_decode_ctl.scala 217:74]
  wire  shift_illegal = io_dec_i0_decode_d & _T_504; // @[el2_dec_decode_ctl.scala 538:47]
  reg  illegal_lockout; // @[el2_dec_decode_ctl.scala 542:54]
  wire  _T_466 = shift_illegal | illegal_lockout; // @[el2_dec_decode_ctl.scala 541:40]
  wire  _T_467 = ~flush_final_r; // @[el2_dec_decode_ctl.scala 541:61]
  wire  illegal_lockout_in = _T_466 & _T_467; // @[el2_dec_decode_ctl.scala 541:59]
  wire  _T_16 = illegal_lockout_in ^ illegal_lockout; // @[el2_dec_decode_ctl.scala 219:50]
  wire  i0_legal_decode_d = io_dec_i0_decode_d & i0_legal; // @[el2_dec_decode_ctl.scala 648:46]
  wire  _T_32 = i0_br_error & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 246:67]
  wire  _T_35 = io_dec_i0_brp_br_start_error & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 247:84]
  wire  i0_dp_raw_pm_alu = i0_dec_io_out_pm_alu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_pm_alu = _T_40 ? 1'h0 : i0_dp_raw_pm_alu; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_fence_i = i0_dec_io_out_fence_i; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_fence_i = _T_40 ? 1'h0 : i0_dp_raw_fence_i; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_fence = i0_dec_io_out_fence; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_fence = _T_40 ? 1'h0 : i0_dp_raw_fence; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_rem = i0_dec_io_out_rem; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_div = i0_dec_io_out_div; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_div = _T_40 ? 1'h0 : i0_dp_raw_div; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_low = i0_dec_io_out_low; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_rs2_sign = i0_dec_io_out_rs2_sign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_rs1_sign = i0_dec_io_out_rs1_sign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_mul = i0_dec_io_out_mul; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_mul = _T_40 ? 1'h0 : i0_dp_raw_mul; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_mret = i0_dec_io_out_mret; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_mret = _T_40 ? 1'h0 : i0_dp_raw_mret; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_ecall = i0_dec_io_out_ecall; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_ecall = _T_40 ? 1'h0 : i0_dp_raw_ecall; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_ebreak = i0_dec_io_out_ebreak; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_ebreak = _T_40 ? 1'h0 : i0_dp_raw_ebreak; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_presync = i0_dec_io_out_presync; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_presync = _T_40 ? 1'h0 : i0_dp_raw_presync; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_csr_imm = i0_dec_io_out_csr_imm; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_csr_imm = _T_40 ? 1'h0 : i0_dp_raw_csr_imm; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_csr_set = i0_dec_io_out_csr_set; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_csr_set = _T_40 ? 1'h0 : i0_dp_raw_csr_set; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_csr_clr = i0_dec_io_out_csr_clr; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_csr_clr = _T_40 ? 1'h0 : i0_dp_raw_csr_clr; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_word = i0_dec_io_out_word; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_word = _T_40 ? 1'h0 : i0_dp_raw_word; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_half = i0_dec_io_out_half; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_half = _T_40 ? 1'h0 : i0_dp_raw_half; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_by = i0_dec_io_out_by; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_by = _T_40 ? 1'h0 : i0_dp_raw_by; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_jal = _T_40 ? 1'h0 : i0_dp_raw_jal; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_blt = i0_dec_io_out_blt; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_bge = i0_dec_io_out_bge; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_bne = i0_dec_io_out_bne; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_beq = i0_dec_io_out_beq; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_condbr = _T_40 ? 1'h0 : i0_dp_raw_condbr; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_unsign = i0_dec_io_out_unsign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_unsign = _T_40 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_slt = i0_dec_io_out_slt; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_srl = i0_dec_io_out_srl; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_sra = i0_dec_io_out_sra; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_sll = i0_dec_io_out_sll; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_lxor = i0_dec_io_out_lxor; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_lor = i0_dec_io_out_lor; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_land = i0_dec_io_out_land; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_sub = i0_dec_io_out_sub; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_add = i0_dec_io_out_add; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_raw_lsu = i0_dec_io_out_lsu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_lsu = _T_40 ? 1'h0 : i0_dp_raw_lsu; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_store = i0_dec_io_out_store; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_store = _T_40 ? 1'h0 : i0_dp_raw_store; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_load = i0_dec_io_out_load; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_load = _T_40 ? 1'h0 : i0_dp_raw_load; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_pc = i0_dec_io_out_pc; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_imm20 = _T_40 ? 1'h0 : i0_dp_raw_imm20; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_shimm5 = i0_dec_io_out_shimm5; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_shimm5 = _T_40 ? 1'h0 : i0_dp_raw_shimm5; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_rd = i0_dec_io_out_rd; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_rd = _T_40 ? 1'h0 : i0_dp_raw_rd; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_imm12 = _T_40 ? 1'h0 : i0_dp_raw_imm12; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_rs1 = i0_dec_io_out_rs1; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_rs1 = _T_40 | i0_dp_raw_rs1; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_rs2 = i0_dec_io_out_rs2; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_rs2 = _T_40 | i0_dp_raw_rs2; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_dp_raw_alu = i0_dec_io_out_alu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 398:14]
  wire  i0_dp_alu = _T_40 | i0_dp_raw_alu; // @[el2_dec_decode_ctl.scala 263:50]
  wire  i0_pcall = i0_dp_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 416:38]
  wire  _T_43 = i0_dp_condbr | i0_pcall; // @[el2_dec_decode_ctl.scala 277:38]
  wire  i0_pja = i0_dp_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 418:38]
  wire  _T_44 = _T_43 | i0_pja; // @[el2_dec_decode_ctl.scala 277:49]
  wire  i0_pret = i0_dp_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 423:32]
  wire  i0_predict_br = _T_44 | i0_pret; // @[el2_dec_decode_ctl.scala 277:58]
  wire  _T_46 = io_dec_i0_brp_hist[1] & i0_brp_valid; // @[el2_dec_decode_ctl.scala 279:50]
  wire  _T_47 = ~_T_46; // @[el2_dec_decode_ctl.scala 279:26]
  wire  i0_ap_pc2 = ~io_dec_i0_pc4_d; // @[el2_dec_decode_ctl.scala 281:20]
  wire  cam_data_reset = io_lsu_nonblock_load_data_valid | io_lsu_nonblock_load_data_error; // @[el2_dec_decode_ctl.scala 314:63]
  reg [2:0] cam_raw_0_tag; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_93 = io_lsu_nonblock_load_data_tag == cam_raw_0_tag; // @[el2_dec_decode_ctl.scala 325:67]
  wire  _T_94 = cam_data_reset & _T_93; // @[el2_dec_decode_ctl.scala 325:45]
  reg  cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 350:47]
  wire  cam_data_reset_val_0 = _T_94 & cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 325:83]
  wire  cam_0_valid = cam_data_reset_val_0 ? 1'h0 : cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 329:39]
  wire  _T_50 = ~cam_0_valid; // @[el2_dec_decode_ctl.scala 306:79]
  reg [2:0] cam_raw_1_tag; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_119 = io_lsu_nonblock_load_data_tag == cam_raw_1_tag; // @[el2_dec_decode_ctl.scala 325:67]
  wire  _T_120 = cam_data_reset & _T_119; // @[el2_dec_decode_ctl.scala 325:45]
  reg  cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 350:47]
  wire  cam_data_reset_val_1 = _T_120 & cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 325:83]
  wire  cam_1_valid = cam_data_reset_val_1 ? 1'h0 : cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 329:39]
  wire  _T_53 = ~cam_1_valid; // @[el2_dec_decode_ctl.scala 306:79]
  wire  _T_56 = cam_0_valid & _T_53; // @[el2_dec_decode_ctl.scala 306:127]
  wire [1:0] _T_58 = {io_lsu_nonblock_load_valid_m, 1'h0}; // @[el2_dec_decode_ctl.scala 306:159]
  reg [2:0] cam_raw_2_tag; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_145 = io_lsu_nonblock_load_data_tag == cam_raw_2_tag; // @[el2_dec_decode_ctl.scala 325:67]
  wire  _T_146 = cam_data_reset & _T_145; // @[el2_dec_decode_ctl.scala 325:45]
  reg  cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 350:47]
  wire  cam_data_reset_val_2 = _T_146 & cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 325:83]
  wire  cam_2_valid = cam_data_reset_val_2 ? 1'h0 : cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 329:39]
  wire  _T_59 = ~cam_2_valid; // @[el2_dec_decode_ctl.scala 306:79]
  wire  _T_62 = cam_0_valid & cam_1_valid; // @[el2_dec_decode_ctl.scala 306:127]
  wire  _T_65 = _T_62 & _T_59; // @[el2_dec_decode_ctl.scala 306:127]
  wire [2:0] _T_67 = {io_lsu_nonblock_load_valid_m, 2'h0}; // @[el2_dec_decode_ctl.scala 306:159]
  reg [2:0] cam_raw_3_tag; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_171 = io_lsu_nonblock_load_data_tag == cam_raw_3_tag; // @[el2_dec_decode_ctl.scala 325:67]
  wire  _T_172 = cam_data_reset & _T_171; // @[el2_dec_decode_ctl.scala 325:45]
  reg  cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 350:47]
  wire  cam_data_reset_val_3 = _T_172 & cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 325:83]
  wire  cam_3_valid = cam_data_reset_val_3 ? 1'h0 : cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 329:39]
  wire  _T_68 = ~cam_3_valid; // @[el2_dec_decode_ctl.scala 306:79]
  wire  _T_74 = _T_62 & cam_2_valid; // @[el2_dec_decode_ctl.scala 306:127]
  wire  _T_77 = _T_74 & _T_68; // @[el2_dec_decode_ctl.scala 306:127]
  wire [3:0] _T_79 = {io_lsu_nonblock_load_valid_m, 3'h0}; // @[el2_dec_decode_ctl.scala 306:159]
  wire  _T_80 = _T_50 & io_lsu_nonblock_load_valid_m; // @[Mux.scala 27:72]
  wire [1:0] _T_81 = _T_56 ? _T_58 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_82 = _T_65 ? _T_67 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_83 = _T_77 ? _T_79 : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_123 = {{1'd0}, _T_80}; // @[Mux.scala 27:72]
  wire [1:0] _T_84 = _GEN_123 | _T_81; // @[Mux.scala 27:72]
  wire [2:0] _GEN_124 = {{1'd0}, _T_84}; // @[Mux.scala 27:72]
  wire [2:0] _T_85 = _GEN_124 | _T_82; // @[Mux.scala 27:72]
  wire [3:0] _GEN_125 = {{1'd0}, _T_85}; // @[Mux.scala 27:72]
  wire [3:0] cam_wen = _GEN_125 | _T_83; // @[Mux.scala 27:72]
  reg  x_d_i0load; // @[beh_lib.scala 366:14]
  reg [4:0] x_d_i0rd; // @[beh_lib.scala 366:14]
  wire [4:0] nonblock_load_rd = x_d_i0load ? x_d_i0rd : 5'h0; // @[el2_dec_decode_ctl.scala 317:31]
  reg [2:0] _T_701; // @[el2_dec_decode_ctl.scala 656:72]
  wire [3:0] i0_pipe_en = {io_dec_i0_decode_d,_T_701}; // @[Cat.scala 29:58]
  wire  _T_707 = |i0_pipe_en[2:1]; // @[el2_dec_decode_ctl.scala 659:49]
  wire  i0_r_ctl_en = _T_707 | io_clk_override; // @[el2_dec_decode_ctl.scala 659:53]
  reg  nonblock_load_valid_m_delay; // @[Reg.scala 27:20]
  reg  r_d_i0load; // @[beh_lib.scala 366:14]
  wire  i0_load_kill_wen_r = nonblock_load_valid_m_delay & r_d_i0load; // @[el2_dec_decode_ctl.scala 322:56]
  wire  _T_90 = io_lsu_nonblock_load_inv_tag_r == cam_raw_0_tag; // @[el2_dec_decode_ctl.scala 324:66]
  wire  _T_91 = io_lsu_nonblock_load_inv_r & _T_90; // @[el2_dec_decode_ctl.scala 324:45]
  wire  cam_inv_reset_val_0 = _T_91 & cam_0_valid; // @[el2_dec_decode_ctl.scala 324:82]
  reg  r_d_i0v; // @[beh_lib.scala 366:14]
  wire  _T_743 = ~io_dec_tlu_flush_lower_wb; // @[el2_dec_decode_ctl.scala 691:41]
  wire  r_d_in_i0v = r_d_i0v & _T_743; // @[el2_dec_decode_ctl.scala 691:39]
  wire  _T_754 = ~io_dec_tlu_i0_kill_writeb_r; // @[el2_dec_decode_ctl.scala 699:42]
  wire  i0_wen_r = r_d_in_i0v & _T_754; // @[el2_dec_decode_ctl.scala 699:40]
  reg [4:0] r_d_i0rd; // @[beh_lib.scala 366:14]
  reg [4:0] cam_raw_0_rd; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_102 = r_d_i0rd == cam_raw_0_rd; // @[el2_dec_decode_ctl.scala 337:80]
  wire  _T_103 = i0_wen_r & _T_102; // @[el2_dec_decode_ctl.scala 337:64]
  reg  cam_raw_0_wb; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_105 = _T_103 & cam_raw_0_wb; // @[el2_dec_decode_ctl.scala 337:95]
  wire  _T_106 = cam_inv_reset_val_0 | _T_105; // @[el2_dec_decode_ctl.scala 337:44]
  wire  _GEN_52 = _T_106 ? 1'h0 : cam_0_valid; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_55 = _T_106 ? 1'h0 : cam_raw_0_wb; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_56 = cam_wen[0] | _GEN_52; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _GEN_57 = cam_wen[0] ? 1'h0 : _GEN_55; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _T_109 = nonblock_load_valid_m_delay & _T_90; // @[el2_dec_decode_ctl.scala 342:44]
  wire  _T_111 = _T_109 & cam_0_valid; // @[el2_dec_decode_ctl.scala 342:95]
  wire  nonblock_load_write_0 = _T_93 & cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 351:66]
  wire  _T_116 = io_lsu_nonblock_load_inv_tag_r == cam_raw_1_tag; // @[el2_dec_decode_ctl.scala 324:66]
  wire  _T_117 = io_lsu_nonblock_load_inv_r & _T_116; // @[el2_dec_decode_ctl.scala 324:45]
  wire  cam_inv_reset_val_1 = _T_117 & cam_1_valid; // @[el2_dec_decode_ctl.scala 324:82]
  reg [4:0] cam_raw_1_rd; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_128 = r_d_i0rd == cam_raw_1_rd; // @[el2_dec_decode_ctl.scala 337:80]
  wire  _T_129 = i0_wen_r & _T_128; // @[el2_dec_decode_ctl.scala 337:64]
  reg  cam_raw_1_wb; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_131 = _T_129 & cam_raw_1_wb; // @[el2_dec_decode_ctl.scala 337:95]
  wire  _T_132 = cam_inv_reset_val_1 | _T_131; // @[el2_dec_decode_ctl.scala 337:44]
  wire  _GEN_63 = _T_132 ? 1'h0 : cam_1_valid; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_66 = _T_132 ? 1'h0 : cam_raw_1_wb; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_67 = cam_wen[1] | _GEN_63; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _GEN_68 = cam_wen[1] ? 1'h0 : _GEN_66; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _T_135 = nonblock_load_valid_m_delay & _T_116; // @[el2_dec_decode_ctl.scala 342:44]
  wire  _T_137 = _T_135 & cam_1_valid; // @[el2_dec_decode_ctl.scala 342:95]
  wire  nonblock_load_write_1 = _T_119 & cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 351:66]
  wire  _T_142 = io_lsu_nonblock_load_inv_tag_r == cam_raw_2_tag; // @[el2_dec_decode_ctl.scala 324:66]
  wire  _T_143 = io_lsu_nonblock_load_inv_r & _T_142; // @[el2_dec_decode_ctl.scala 324:45]
  wire  cam_inv_reset_val_2 = _T_143 & cam_2_valid; // @[el2_dec_decode_ctl.scala 324:82]
  reg [4:0] cam_raw_2_rd; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_154 = r_d_i0rd == cam_raw_2_rd; // @[el2_dec_decode_ctl.scala 337:80]
  wire  _T_155 = i0_wen_r & _T_154; // @[el2_dec_decode_ctl.scala 337:64]
  reg  cam_raw_2_wb; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_157 = _T_155 & cam_raw_2_wb; // @[el2_dec_decode_ctl.scala 337:95]
  wire  _T_158 = cam_inv_reset_val_2 | _T_157; // @[el2_dec_decode_ctl.scala 337:44]
  wire  _GEN_74 = _T_158 ? 1'h0 : cam_2_valid; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_77 = _T_158 ? 1'h0 : cam_raw_2_wb; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_78 = cam_wen[2] | _GEN_74; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _GEN_79 = cam_wen[2] ? 1'h0 : _GEN_77; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _T_161 = nonblock_load_valid_m_delay & _T_142; // @[el2_dec_decode_ctl.scala 342:44]
  wire  _T_163 = _T_161 & cam_2_valid; // @[el2_dec_decode_ctl.scala 342:95]
  wire  nonblock_load_write_2 = _T_145 & cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 351:66]
  wire  _T_168 = io_lsu_nonblock_load_inv_tag_r == cam_raw_3_tag; // @[el2_dec_decode_ctl.scala 324:66]
  wire  _T_169 = io_lsu_nonblock_load_inv_r & _T_168; // @[el2_dec_decode_ctl.scala 324:45]
  wire  cam_inv_reset_val_3 = _T_169 & cam_3_valid; // @[el2_dec_decode_ctl.scala 324:82]
  reg [4:0] cam_raw_3_rd; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_180 = r_d_i0rd == cam_raw_3_rd; // @[el2_dec_decode_ctl.scala 337:80]
  wire  _T_181 = i0_wen_r & _T_180; // @[el2_dec_decode_ctl.scala 337:64]
  reg  cam_raw_3_wb; // @[el2_dec_decode_ctl.scala 350:47]
  wire  _T_183 = _T_181 & cam_raw_3_wb; // @[el2_dec_decode_ctl.scala 337:95]
  wire  _T_184 = cam_inv_reset_val_3 | _T_183; // @[el2_dec_decode_ctl.scala 337:44]
  wire  _GEN_85 = _T_184 ? 1'h0 : cam_3_valid; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_88 = _T_184 ? 1'h0 : cam_raw_3_wb; // @[el2_dec_decode_ctl.scala 337:116]
  wire  _GEN_89 = cam_wen[3] | _GEN_85; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _GEN_90 = cam_wen[3] ? 1'h0 : _GEN_88; // @[el2_dec_decode_ctl.scala 332:28]
  wire  _T_187 = nonblock_load_valid_m_delay & _T_168; // @[el2_dec_decode_ctl.scala 342:44]
  wire  _T_189 = _T_187 & cam_3_valid; // @[el2_dec_decode_ctl.scala 342:95]
  wire  nonblock_load_write_3 = _T_171 & cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 351:66]
  wire  _T_194 = r_d_i0rd == io_dec_nonblock_load_waddr; // @[el2_dec_decode_ctl.scala 356:44]
  wire  nonblock_load_cancel = _T_194 & i0_wen_r; // @[el2_dec_decode_ctl.scala 356:76]
  wire  _T_195 = nonblock_load_write_0 | nonblock_load_write_1; // @[el2_dec_decode_ctl.scala 357:95]
  wire  _T_196 = _T_195 | nonblock_load_write_2; // @[el2_dec_decode_ctl.scala 357:95]
  wire  _T_197 = _T_196 | nonblock_load_write_3; // @[el2_dec_decode_ctl.scala 357:95]
  wire  _T_199 = io_lsu_nonblock_load_data_valid & _T_197; // @[el2_dec_decode_ctl.scala 357:64]
  wire  _T_200 = ~nonblock_load_cancel; // @[el2_dec_decode_ctl.scala 357:109]
  wire  _T_202 = nonblock_load_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 358:54]
  wire  _T_203 = _T_202 & io_lsu_nonblock_load_valid_m; // @[el2_dec_decode_ctl.scala 358:66]
  wire  _T_204 = _T_203 & io_dec_i0_rs1_en_d; // @[el2_dec_decode_ctl.scala 358:97]
  wire [4:0] i0r_rs2 = io_dec_i0_instr_d[24:20]; // @[el2_dec_decode_ctl.scala 625:16]
  wire  _T_205 = nonblock_load_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 358:137]
  wire  _T_206 = _T_205 & io_lsu_nonblock_load_valid_m; // @[el2_dec_decode_ctl.scala 358:149]
  wire  _T_207 = _T_206 & io_dec_i0_rs2_en_d; // @[el2_dec_decode_ctl.scala 358:180]
  wire  i0_nonblock_boundary_stall = _T_204 | _T_207; // @[el2_dec_decode_ctl.scala 358:118]
  wire [4:0] _T_209 = nonblock_load_write_0 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_210 = _T_209 & cam_raw_0_rd; // @[el2_dec_decode_ctl.scala 362:88]
  wire  _T_211 = io_dec_i0_rs1_en_d & cam_0_valid; // @[el2_dec_decode_ctl.scala 362:121]
  wire  _T_212 = cam_raw_0_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 362:149]
  wire  _T_213 = _T_211 & _T_212; // @[el2_dec_decode_ctl.scala 362:136]
  wire  _T_214 = io_dec_i0_rs2_en_d & cam_0_valid; // @[el2_dec_decode_ctl.scala 362:182]
  wire  _T_215 = cam_raw_0_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 362:210]
  wire  _T_216 = _T_214 & _T_215; // @[el2_dec_decode_ctl.scala 362:197]
  wire [4:0] _T_218 = nonblock_load_write_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_219 = _T_218 & cam_raw_1_rd; // @[el2_dec_decode_ctl.scala 362:88]
  wire  _T_220 = io_dec_i0_rs1_en_d & cam_1_valid; // @[el2_dec_decode_ctl.scala 362:121]
  wire  _T_221 = cam_raw_1_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 362:149]
  wire  _T_222 = _T_220 & _T_221; // @[el2_dec_decode_ctl.scala 362:136]
  wire  _T_223 = io_dec_i0_rs2_en_d & cam_1_valid; // @[el2_dec_decode_ctl.scala 362:182]
  wire  _T_224 = cam_raw_1_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 362:210]
  wire  _T_225 = _T_223 & _T_224; // @[el2_dec_decode_ctl.scala 362:197]
  wire [4:0] _T_227 = nonblock_load_write_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_228 = _T_227 & cam_raw_2_rd; // @[el2_dec_decode_ctl.scala 362:88]
  wire  _T_229 = io_dec_i0_rs1_en_d & cam_2_valid; // @[el2_dec_decode_ctl.scala 362:121]
  wire  _T_230 = cam_raw_2_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 362:149]
  wire  _T_231 = _T_229 & _T_230; // @[el2_dec_decode_ctl.scala 362:136]
  wire  _T_232 = io_dec_i0_rs2_en_d & cam_2_valid; // @[el2_dec_decode_ctl.scala 362:182]
  wire  _T_233 = cam_raw_2_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 362:210]
  wire  _T_234 = _T_232 & _T_233; // @[el2_dec_decode_ctl.scala 362:197]
  wire [4:0] _T_236 = nonblock_load_write_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_237 = _T_236 & cam_raw_3_rd; // @[el2_dec_decode_ctl.scala 362:88]
  wire  _T_238 = io_dec_i0_rs1_en_d & cam_3_valid; // @[el2_dec_decode_ctl.scala 362:121]
  wire  _T_239 = cam_raw_3_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 362:149]
  wire  _T_240 = _T_238 & _T_239; // @[el2_dec_decode_ctl.scala 362:136]
  wire  _T_241 = io_dec_i0_rs2_en_d & cam_3_valid; // @[el2_dec_decode_ctl.scala 362:182]
  wire  _T_242 = cam_raw_3_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 362:210]
  wire  _T_243 = _T_241 & _T_242; // @[el2_dec_decode_ctl.scala 362:197]
  wire [4:0] _T_244 = _T_210 | _T_219; // @[el2_dec_decode_ctl.scala 363:69]
  wire [4:0] _T_245 = _T_244 | _T_228; // @[el2_dec_decode_ctl.scala 363:69]
  wire  _T_246 = _T_213 | _T_222; // @[el2_dec_decode_ctl.scala 363:102]
  wire  _T_247 = _T_246 | _T_231; // @[el2_dec_decode_ctl.scala 363:102]
  wire  ld_stall_1 = _T_247 | _T_240; // @[el2_dec_decode_ctl.scala 363:102]
  wire  _T_248 = _T_216 | _T_225; // @[el2_dec_decode_ctl.scala 363:134]
  wire  _T_249 = _T_248 | _T_234; // @[el2_dec_decode_ctl.scala 363:134]
  wire  ld_stall_2 = _T_249 | _T_243; // @[el2_dec_decode_ctl.scala 363:134]
  wire  _T_250 = ld_stall_1 | ld_stall_2; // @[el2_dec_decode_ctl.scala 365:38]
  wire  i0_nonblock_load_stall = _T_250 | i0_nonblock_boundary_stall; // @[el2_dec_decode_ctl.scala 365:51]
  wire  _T_252 = ~i0_predict_br; // @[el2_dec_decode_ctl.scala 374:34]
  wire [3:0] _T_254 = i0_legal_decode_d ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire  _T_255 = ~io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 384:18]
  wire  csr_read = i0_dp_csr_read & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 459:36]
  wire  _T_256 = csr_read & _T_255; // @[el2_dec_decode_ctl.scala 384:16]
  wire  _T_258 = ~csr_read; // @[el2_dec_decode_ctl.scala 385:6]
  wire  _T_259 = _T_258 & io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 385:16]
  wire  _T_261 = csr_read & io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 386:16]
  wire [3:0] _T_263 = i0_dp_jal ? 4'he : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _T_264 = i0_dp_condbr ? 4'hd : _T_263; // @[Mux.scala 98:16]
  wire [3:0] _T_265 = i0_dp_mret ? 4'hc : _T_264; // @[Mux.scala 98:16]
  wire [3:0] _T_266 = i0_dp_fence_i ? 4'hb : _T_265; // @[Mux.scala 98:16]
  wire [3:0] _T_267 = i0_dp_fence ? 4'ha : _T_266; // @[Mux.scala 98:16]
  wire [3:0] _T_268 = i0_dp_ecall ? 4'h9 : _T_267; // @[Mux.scala 98:16]
  wire [3:0] _T_269 = i0_dp_ebreak ? 4'h8 : _T_268; // @[Mux.scala 98:16]
  wire [3:0] _T_270 = _T_261 ? 4'h7 : _T_269; // @[Mux.scala 98:16]
  wire [3:0] _T_271 = _T_259 ? 4'h6 : _T_270; // @[Mux.scala 98:16]
  wire [3:0] _T_272 = _T_256 ? 4'h5 : _T_271; // @[Mux.scala 98:16]
  wire [3:0] _T_273 = i0_dp_pm_alu ? 4'h4 : _T_272; // @[Mux.scala 98:16]
  wire [3:0] _T_274 = i0_dp_store ? 4'h3 : _T_273; // @[Mux.scala 98:16]
  wire [3:0] _T_275 = i0_dp_load ? 4'h2 : _T_274; // @[Mux.scala 98:16]
  wire [3:0] _T_276 = i0_dp_mul ? 4'h1 : _T_275; // @[Mux.scala 98:16]
  reg  lsu_idle; // @[el2_dec_decode_ctl.scala 400:45]
  wire  _T_333 = ~i0_pcall_case; // @[el2_dec_decode_ctl.scala 424:35]
  wire  _T_334 = i0_dp_jal & _T_333; // @[el2_dec_decode_ctl.scala 424:32]
  wire  _T_335 = ~i0_pja_case; // @[el2_dec_decode_ctl.scala 424:52]
  wire  _T_336 = _T_334 & _T_335; // @[el2_dec_decode_ctl.scala 424:50]
  wire  _T_337 = ~i0_pret_case; // @[el2_dec_decode_ctl.scala 424:67]
  reg  _T_339; // @[el2_dec_decode_ctl.scala 436:58]
  wire  lsu_decode_d = i0_legal_decode_d & i0_dp_lsu; // @[el2_dec_decode_ctl.scala 578:40]
  wire  _T_902 = i0_dp_load | i0_dp_store; // @[el2_dec_decode_ctl.scala 792:47]
  reg  x_d_i0v; // @[beh_lib.scala 366:14]
  wire  _T_876 = io_dec_i0_rs1_en_d & x_d_i0v; // @[el2_dec_decode_ctl.scala 772:48]
  wire  _T_877 = x_d_i0rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 772:70]
  wire  i0_rs1_depend_i0_x = _T_876 & _T_877; // @[el2_dec_decode_ctl.scala 772:58]
  wire  _T_878 = io_dec_i0_rs1_en_d & r_d_i0v; // @[el2_dec_decode_ctl.scala 773:48]
  wire  _T_879 = r_d_i0rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 773:70]
  wire  i0_rs1_depend_i0_r = _T_878 & _T_879; // @[el2_dec_decode_ctl.scala 773:58]
  wire [1:0] _T_891 = i0_rs1_depend_i0_r ? 2'h2 : 2'h0; // @[el2_dec_decode_ctl.scala 779:63]
  wire [1:0] i0_rs1_depth_d = i0_rs1_depend_i0_x ? 2'h1 : _T_891; // @[el2_dec_decode_ctl.scala 779:24]
  wire  _T_904 = _T_902 & i0_rs1_depth_d[0]; // @[el2_dec_decode_ctl.scala 792:62]
  reg  i0_x_c_load; // @[Reg.scala 15:16]
  reg  i0_r_c_load; // @[Reg.scala 15:16]
  wire  _T_887_load = i0_rs1_depend_i0_r & i0_r_c_load; // @[el2_dec_decode_ctl.scala 778:61]
  wire  i0_rs1_class_d_load = i0_rs1_depend_i0_x ? i0_x_c_load : _T_887_load; // @[el2_dec_decode_ctl.scala 778:24]
  wire  load_ldst_bypass_d = _T_904 & i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 792:82]
  wire  _T_880 = io_dec_i0_rs2_en_d & x_d_i0v; // @[el2_dec_decode_ctl.scala 775:48]
  wire  _T_881 = x_d_i0rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 775:70]
  wire  i0_rs2_depend_i0_x = _T_880 & _T_881; // @[el2_dec_decode_ctl.scala 775:58]
  wire  _T_882 = io_dec_i0_rs2_en_d & r_d_i0v; // @[el2_dec_decode_ctl.scala 776:48]
  wire  _T_883 = r_d_i0rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 776:70]
  wire  i0_rs2_depend_i0_r = _T_882 & _T_883; // @[el2_dec_decode_ctl.scala 776:58]
  wire [1:0] _T_900 = i0_rs2_depend_i0_r ? 2'h2 : 2'h0; // @[el2_dec_decode_ctl.scala 781:63]
  wire [1:0] i0_rs2_depth_d = i0_rs2_depend_i0_x ? 2'h1 : _T_900; // @[el2_dec_decode_ctl.scala 781:24]
  wire  _T_907 = i0_dp_store & i0_rs2_depth_d[0]; // @[el2_dec_decode_ctl.scala 793:47]
  wire  _T_896_load = i0_rs2_depend_i0_r & i0_r_c_load; // @[el2_dec_decode_ctl.scala 780:61]
  wire  i0_rs2_class_d_load = i0_rs2_depend_i0_x ? i0_x_c_load : _T_896_load; // @[el2_dec_decode_ctl.scala 780:24]
  wire  store_data_bypass_d = _T_907 & i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 793:67]
  wire  _T_349 = i0_dp_csr_clr | i0_dp_csr_set; // @[el2_dec_decode_ctl.scala 467:42]
  reg  r_d_csrwen; // @[beh_lib.scala 366:14]
  reg  r_d_i0valid; // @[beh_lib.scala 366:14]
  wire  _T_352 = r_d_csrwen & r_d_i0valid; // @[el2_dec_decode_ctl.scala 475:34]
  reg [11:0] r_d_csrwaddr; // @[beh_lib.scala 366:14]
  wire  _T_355 = r_d_csrwaddr == 12'h300; // @[el2_dec_decode_ctl.scala 478:45]
  wire  _T_356 = r_d_csrwaddr == 12'h304; // @[el2_dec_decode_ctl.scala 478:75]
  wire  _T_357 = _T_355 | _T_356; // @[el2_dec_decode_ctl.scala 478:59]
  wire  _T_358 = _T_357 & r_d_csrwen; // @[el2_dec_decode_ctl.scala 478:90]
  wire  _T_359 = _T_358 & r_d_i0valid; // @[el2_dec_decode_ctl.scala 478:103]
  wire  _T_360 = ~io_dec_tlu_i0_kill_writeb_wb; // @[el2_dec_decode_ctl.scala 478:119]
  reg  csr_read_x; // @[el2_dec_decode_ctl.scala 480:52]
  reg  csr_clr_x; // @[el2_dec_decode_ctl.scala 481:51]
  reg  csr_set_x; // @[el2_dec_decode_ctl.scala 482:51]
  reg  csr_write_x; // @[el2_dec_decode_ctl.scala 483:53]
  reg  csr_imm_x; // @[el2_dec_decode_ctl.scala 484:51]
  wire  i0_x_data_en = i0_pipe_en[3] | io_clk_override; // @[el2_dec_decode_ctl.scala 661:50]
  reg [4:0] csrimm_x; // @[beh_lib.scala 356:14]
  reg [31:0] csr_rddata_x; // @[beh_lib.scala 356:14]
  wire [31:0] _T_394 = {27'h0,csrimm_x}; // @[Cat.scala 29:58]
  wire  _T_396 = ~csr_imm_x; // @[el2_dec_decode_ctl.scala 492:25]
  wire [31:0] _T_397 = csr_imm_x ? _T_394 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_398 = _T_396 ? io_exu_csr_rs1_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] csr_mask_x = _T_397 | _T_398; // @[Mux.scala 27:72]
  wire [31:0] _T_400 = ~csr_mask_x; // @[el2_dec_decode_ctl.scala 495:56]
  wire [31:0] _T_401 = csr_rddata_x & _T_400; // @[el2_dec_decode_ctl.scala 495:53]
  wire [31:0] _T_402 = csr_rddata_x | csr_mask_x; // @[el2_dec_decode_ctl.scala 496:53]
  wire [31:0] _T_403 = csr_clr_x ? _T_401 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = csr_set_x ? _T_402 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_405 = csr_write_x ? csr_mask_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_406 = _T_403 | _T_404; // @[Mux.scala 27:72]
  wire [31:0] write_csr_data_x = _T_406 | _T_405; // @[Mux.scala 27:72]
  wire  _T_418 = ~tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 506:44]
  wire  _T_419 = ~tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 506:64]
  wire  _T_420 = _T_418 & _T_419; // @[el2_dec_decode_ctl.scala 506:61]
  wire [31:0] _T_423 = write_csr_data - 32'h1; // @[el2_dec_decode_ctl.scala 509:59]
  wire  _T_425 = csr_clr_x | csr_set_x; // @[el2_dec_decode_ctl.scala 511:34]
  wire  _T_426 = _T_425 | csr_write_x; // @[el2_dec_decode_ctl.scala 511:46]
  wire  _T_427 = _T_426 & csr_read_x; // @[el2_dec_decode_ctl.scala 511:61]
  wire  _T_428 = _T_427 | io_dec_tlu_wr_pause_r; // @[el2_dec_decode_ctl.scala 511:75]
  reg  r_d_csrwonly; // @[beh_lib.scala 366:14]
  wire  _T_764 = r_d_i0v & r_d_i0load; // @[el2_dec_decode_ctl.scala 714:37]
  reg [31:0] i0_result_r_raw; // @[beh_lib.scala 356:14]
  wire [31:0] i0_result_corr_r = _T_764 ? io_lsu_result_corr_r : i0_result_r_raw; // @[el2_dec_decode_ctl.scala 714:27]
  reg  x_d_csrwonly; // @[beh_lib.scala 366:14]
  wire  _T_432 = x_d_csrwonly | r_d_csrwonly; // @[el2_dec_decode_ctl.scala 520:38]
  reg  wbd_csrwonly; // @[beh_lib.scala 366:14]
  wire  prior_csr_write = _T_432 | wbd_csrwonly; // @[el2_dec_decode_ctl.scala 520:53]
  wire  debug_fence_raw = io_dec_debug_fence_d & io_dbg_cmd_wrdata[1]; // @[el2_dec_decode_ctl.scala 523:48]
  wire  debug_fence = debug_fence_raw | debug_fence_i; // @[el2_dec_decode_ctl.scala 524:40]
  wire  _T_436 = i0_dp_presync | io_dec_tlu_presync_d; // @[el2_dec_decode_ctl.scala 527:34]
  wire  _T_437 = _T_436 | debug_fence_i; // @[el2_dec_decode_ctl.scala 527:57]
  wire  _T_438 = _T_437 | debug_fence_raw; // @[el2_dec_decode_ctl.scala 527:73]
  wire  i0_presync = _T_438 | io_dec_tlu_pipelining_disable; // @[el2_dec_decode_ctl.scala 527:91]
  wire [31:0] _T_462 = {16'h0,io_ifu_i0_cinst}; // @[Cat.scala 29:58]
  wire  _T_464 = ~illegal_lockout; // @[el2_dec_decode_ctl.scala 539:44]
  reg [31:0] _T_465; // @[beh_lib.scala 356:14]
  wire  i0_div_prior_div_stall = i0_dp_div & io_dec_div_active; // @[el2_dec_decode_ctl.scala 543:42]
  wire  _T_470 = i0_dp_csr_read & prior_csr_write; // @[el2_dec_decode_ctl.scala 545:40]
  wire  _T_471 = _T_470 | io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 545:59]
  wire  _T_472 = _T_471 | pause_stall; // @[el2_dec_decode_ctl.scala 545:81]
  wire  _T_473 = _T_472 | leak1_i0_stall; // @[el2_dec_decode_ctl.scala 545:95]
  wire  _T_474 = _T_473 | io_dec_tlu_debug_stall; // @[el2_dec_decode_ctl.scala 546:20]
  wire  _T_475 = _T_474 | postsync_stall; // @[el2_dec_decode_ctl.scala 546:45]
  wire  prior_inflight = x_d_i0valid | r_d_i0valid; // @[el2_dec_decode_ctl.scala 568:41]
  wire  prior_inflight_eff = i0_dp_div ? x_d_i0valid : prior_inflight; // @[el2_dec_decode_ctl.scala 569:31]
  wire  presync_stall = i0_presync & prior_inflight_eff; // @[el2_dec_decode_ctl.scala 571:37]
  wire  _T_476 = _T_475 | presync_stall; // @[el2_dec_decode_ctl.scala 546:62]
  wire  _T_477 = i0_dp_fence | debug_fence; // @[el2_dec_decode_ctl.scala 547:19]
  wire  _T_478 = ~lsu_idle; // @[el2_dec_decode_ctl.scala 547:36]
  wire  _T_479 = _T_477 & _T_478; // @[el2_dec_decode_ctl.scala 547:34]
  wire  _T_480 = _T_476 | _T_479; // @[el2_dec_decode_ctl.scala 546:79]
  wire  _T_481 = _T_480 | i0_nonblock_load_stall; // @[el2_dec_decode_ctl.scala 547:47]
  wire  _T_822 = io_dec_i0_rs1_en_d & io_dec_div_active; // @[el2_dec_decode_ctl.scala 742:49]
  wire  _T_823 = io_div_waddr_wb == i0r_rs1; // @[el2_dec_decode_ctl.scala 742:88]
  wire  _T_824 = _T_822 & _T_823; // @[el2_dec_decode_ctl.scala 742:69]
  wire  _T_825 = io_dec_i0_rs2_en_d & io_dec_div_active; // @[el2_dec_decode_ctl.scala 743:52]
  wire  _T_826 = io_div_waddr_wb == i0r_rs2; // @[el2_dec_decode_ctl.scala 743:91]
  wire  _T_827 = _T_825 & _T_826; // @[el2_dec_decode_ctl.scala 743:72]
  wire  i0_nonblock_div_stall = _T_824 | _T_827; // @[el2_dec_decode_ctl.scala 742:102]
  wire  _T_483 = _T_481 | i0_nonblock_div_stall; // @[el2_dec_decode_ctl.scala 548:21]
  wire  i0_block_raw_d = _T_483 | i0_div_prior_div_stall; // @[el2_dec_decode_ctl.scala 548:45]
  wire  _T_484 = io_lsu_store_stall_any | io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 550:65]
  wire  i0_store_stall_d = i0_dp_store & _T_484; // @[el2_dec_decode_ctl.scala 550:39]
  wire  _T_485 = io_lsu_load_stall_any | io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 551:63]
  wire  i0_load_stall_d = i0_dp_load & _T_485; // @[el2_dec_decode_ctl.scala 551:38]
  wire  _T_486 = i0_block_raw_d | i0_store_stall_d; // @[el2_dec_decode_ctl.scala 552:38]
  wire  i0_block_d = _T_486 | i0_load_stall_d; // @[el2_dec_decode_ctl.scala 552:57]
  wire  _T_487 = ~i0_block_d; // @[el2_dec_decode_ctl.scala 556:46]
  wire  _T_488 = io_dec_ib0_valid_d & _T_487; // @[el2_dec_decode_ctl.scala 556:44]
  wire  _T_490 = _T_488 & _T_279; // @[el2_dec_decode_ctl.scala 556:61]
  wire  _T_493 = ~i0_block_raw_d; // @[el2_dec_decode_ctl.scala 557:46]
  wire  _T_494 = io_dec_ib0_valid_d & _T_493; // @[el2_dec_decode_ctl.scala 557:44]
  wire  _T_496 = _T_494 & _T_279; // @[el2_dec_decode_ctl.scala 557:61]
  wire  i0_exudecode_d = _T_496 & _T_467; // @[el2_dec_decode_ctl.scala 557:89]
  wire  i0_exulegal_decode_d = i0_exudecode_d & i0_legal; // @[el2_dec_decode_ctl.scala 558:46]
  wire  _T_498 = ~io_dec_i0_decode_d; // @[el2_dec_decode_ctl.scala 562:51]
  wire  _T_517 = i0_dp_fence_i | debug_fence_i; // @[el2_dec_decode_ctl.scala 590:44]
  wire [3:0] _T_522 = {io_dec_i0_decode_d,io_dec_i0_decode_d,io_dec_i0_decode_d,io_dec_i0_decode_d}; // @[Cat.scala 29:58]
  wire  _T_704 = |i0_pipe_en[3:2]; // @[el2_dec_decode_ctl.scala 658:49]
  wire  i0_x_ctl_en = _T_704 | io_clk_override; // @[el2_dec_decode_ctl.scala 658:53]
  reg  x_t_legal; // @[beh_lib.scala 366:14]
  reg  x_t_icaf; // @[beh_lib.scala 366:14]
  reg  x_t_icaf_f1; // @[beh_lib.scala 366:14]
  reg [1:0] x_t_icaf_type; // @[beh_lib.scala 366:14]
  reg  x_t_fence_i; // @[beh_lib.scala 366:14]
  reg [3:0] x_t_i0trigger; // @[beh_lib.scala 366:14]
  reg [3:0] x_t_pmu_i0_itype; // @[beh_lib.scala 366:14]
  reg  x_t_pmu_i0_br_unpred; // @[beh_lib.scala 366:14]
  wire [3:0] _T_530 = {io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb}; // @[Cat.scala 29:58]
  wire [3:0] _T_531 = ~_T_530; // @[el2_dec_decode_ctl.scala 603:39]
  reg  r_t_legal; // @[beh_lib.scala 366:14]
  reg  r_t_icaf; // @[beh_lib.scala 366:14]
  reg  r_t_icaf_f1; // @[beh_lib.scala 366:14]
  reg [1:0] r_t_icaf_type; // @[beh_lib.scala 366:14]
  reg  r_t_fence_i; // @[beh_lib.scala 366:14]
  reg [3:0] r_t_i0trigger; // @[beh_lib.scala 366:14]
  reg [3:0] r_t_pmu_i0_itype; // @[beh_lib.scala 366:14]
  reg  r_t_pmu_i0_br_unpred; // @[beh_lib.scala 366:14]
  reg [3:0] lsu_trigger_match_r; // @[el2_dec_decode_ctl.scala 606:36]
  reg  lsu_pmu_misaligned_r; // @[el2_dec_decode_ctl.scala 607:37]
  reg  r_d_i0store; // @[beh_lib.scala 366:14]
  wire  _T_536 = r_d_i0load | r_d_i0store; // @[el2_dec_decode_ctl.scala 611:56]
  wire [3:0] _T_540 = {_T_536,_T_536,_T_536,_T_536}; // @[Cat.scala 29:58]
  wire [3:0] _T_541 = _T_540 & lsu_trigger_match_r; // @[el2_dec_decode_ctl.scala 611:72]
  wire [3:0] _T_542 = _T_541 | r_t_i0trigger; // @[el2_dec_decode_ctl.scala 611:95]
  reg  r_d_i0div; // @[beh_lib.scala 366:14]
  wire  _T_545 = r_d_i0div & r_d_i0valid; // @[el2_dec_decode_ctl.scala 617:53]
  wire  _T_556 = i0r_rs1 != 5'h0; // @[el2_dec_decode_ctl.scala 628:49]
  wire  _T_558 = i0r_rs2 != 5'h0; // @[el2_dec_decode_ctl.scala 629:49]
  wire  _T_560 = i0r_rd != 5'h0; // @[el2_dec_decode_ctl.scala 630:48]
  wire  i0_rd_en_d = i0_dp_rd & _T_560; // @[el2_dec_decode_ctl.scala 630:37]
  wire  i0_jalimm20 = i0_dp_jal & i0_dp_imm20; // @[el2_dec_decode_ctl.scala 634:38]
  wire  _T_561 = ~i0_dp_jal; // @[el2_dec_decode_ctl.scala 635:27]
  wire  i0_uiimm20 = _T_561 & i0_dp_imm20; // @[el2_dec_decode_ctl.scala 635:38]
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
  wire  _T_653 = i0_csr_write_only_d & i0_dp_csr_imm; // @[el2_dec_decode_ctl.scala 646:40]
  wire [31:0] _T_683 = {27'h0,i0r_rs1}; // @[Cat.scala 29:58]
  wire [31:0] _T_688 = _T_653 ? _T_683 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_immed_d = _T_691 | _T_688; // @[Mux.scala 27:72]
  wire [31:0] _T_564 = _T_347 ? i0_immed_d : 32'h0; // @[Mux.scala 27:72]
  wire  i0_d_c_mul = i0_dp_mul & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 650:44]
  wire  i0_d_c_load = i0_dp_load & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 651:44]
  wire  i0_d_c_alu = i0_dp_alu & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 652:44]
  reg  i0_x_c_mul; // @[Reg.scala 15:16]
  reg  i0_x_c_alu; // @[Reg.scala 15:16]
  reg  i0_r_c_mul; // @[Reg.scala 15:16]
  reg  i0_r_c_alu; // @[Reg.scala 15:16]
  wire  _T_710 = |i0_pipe_en[1:0]; // @[el2_dec_decode_ctl.scala 660:49]
  wire  i0_r_data_en = i0_pipe_en[2] | io_clk_override; // @[el2_dec_decode_ctl.scala 662:50]
  reg  x_d_i0store; // @[beh_lib.scala 366:14]
  reg  x_d_i0div; // @[beh_lib.scala 366:14]
  reg  x_d_csrwen; // @[beh_lib.scala 366:14]
  reg [11:0] x_d_csrwaddr; // @[beh_lib.scala 366:14]
  wire  _T_733 = x_d_i0v & _T_743; // @[el2_dec_decode_ctl.scala 684:37]
  wire  _T_737 = x_d_i0valid & _T_743; // @[el2_dec_decode_ctl.scala 685:37]
  wire  _T_756 = ~r_d_i0div; // @[el2_dec_decode_ctl.scala 700:49]
  wire  _T_757 = i0_wen_r & _T_756; // @[el2_dec_decode_ctl.scala 700:47]
  wire  _T_758 = ~i0_load_kill_wen_r; // @[el2_dec_decode_ctl.scala 700:65]
  wire  _T_761 = x_d_i0v & x_d_i0load; // @[el2_dec_decode_ctl.scala 709:45]
  wire  _T_768 = io_i0_ap_predict_nt & _T_561; // @[el2_dec_decode_ctl.scala 715:52]
  wire [11:0] _T_781 = {10'h0,io_dec_i0_pc4_d,i0_ap_pc2}; // @[Cat.scala 29:58]
  reg [11:0] last_br_immed_x; // @[beh_lib.scala 356:14]
  wire  _T_799 = x_d_i0div & x_d_i0valid; // @[el2_dec_decode_ctl.scala 723:40]
  wire  div_e1_to_r = _T_799 | _T_545; // @[el2_dec_decode_ctl.scala 723:55]
  wire  _T_802 = x_d_i0rd == 5'h0; // @[el2_dec_decode_ctl.scala 725:69]
  wire  _T_803 = _T_799 & _T_802; // @[el2_dec_decode_ctl.scala 725:57]
  wire  _T_805 = _T_799 & io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 726:30]
  wire  _T_806 = _T_803 | _T_805; // @[el2_dec_decode_ctl.scala 725:86]
  wire  _T_808 = _T_545 & io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 727:30]
  wire  _T_809 = _T_808 & io_dec_tlu_i0_kill_writeb_r; // @[el2_dec_decode_ctl.scala 727:57]
  wire  div_flush = _T_806 | _T_809; // @[el2_dec_decode_ctl.scala 726:59]
  wire  _T_810 = io_dec_div_active & div_flush; // @[el2_dec_decode_ctl.scala 731:51]
  wire  _T_811 = ~div_e1_to_r; // @[el2_dec_decode_ctl.scala 732:26]
  wire  _T_812 = io_dec_div_active & _T_811; // @[el2_dec_decode_ctl.scala 732:24]
  wire  _T_813 = r_d_i0rd == io_div_waddr_wb; // @[el2_dec_decode_ctl.scala 732:51]
  wire  _T_814 = _T_812 & _T_813; // @[el2_dec_decode_ctl.scala 732:39]
  wire  _T_815 = _T_814 & i0_wen_r; // @[el2_dec_decode_ctl.scala 732:72]
  wire  nonblock_div_cancel = _T_810 | _T_815; // @[el2_dec_decode_ctl.scala 731:65]
  wire  i0_div_decode_d = i0_legal_decode_d & i0_dp_div; // @[el2_dec_decode_ctl.scala 735:55]
  wire  _T_817 = ~io_exu_div_wren; // @[el2_dec_decode_ctl.scala 737:62]
  wire  _T_818 = io_dec_div_active & _T_817; // @[el2_dec_decode_ctl.scala 737:60]
  wire  _T_819 = ~nonblock_div_cancel; // @[el2_dec_decode_ctl.scala 737:81]
  wire  _T_820 = _T_818 & _T_819; // @[el2_dec_decode_ctl.scala 737:79]
  reg  _T_821; // @[el2_dec_decode_ctl.scala 739:54]
  reg [4:0] _T_830; // @[Reg.scala 27:20]
  reg [31:0] i0_inst_x; // @[beh_lib.scala 356:14]
  reg [31:0] i0_inst_r; // @[beh_lib.scala 356:14]
  reg [31:0] i0_inst_wb; // @[beh_lib.scala 356:14]
  reg [31:0] _T_837; // @[beh_lib.scala 356:14]
  reg [30:0] i0_pc_wb; // @[beh_lib.scala 356:14]
  reg [30:0] _T_840; // @[beh_lib.scala 356:14]
  reg [30:0] dec_i0_pc_r; // @[beh_lib.scala 356:14]
  wire [31:0] _T_842 = {io_exu_i0_pc_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_843 = {last_br_immed_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_846 = _T_842[12:1] + _T_843[12:1]; // @[el2_lib.scala 310:31]
  wire [18:0] _T_849 = _T_842[31:13] + 19'h1; // @[el2_lib.scala 311:27]
  wire [18:0] _T_852 = _T_842[31:13] - 19'h1; // @[el2_lib.scala 312:27]
  wire  _T_855 = ~_T_846[12]; // @[el2_lib.scala 314:27]
  wire  _T_856 = _T_843[12] ^ _T_855; // @[el2_lib.scala 314:25]
  wire  _T_859 = ~_T_843[12]; // @[el2_lib.scala 315:8]
  wire  _T_861 = _T_859 & _T_846[12]; // @[el2_lib.scala 315:14]
  wire  _T_865 = _T_843[12] & _T_855; // @[el2_lib.scala 316:13]
  wire [18:0] _T_867 = _T_856 ? _T_842[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_868 = _T_861 ? _T_849 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_869 = _T_865 ? _T_852 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_870 = _T_867 | _T_868; // @[Mux.scala 27:72]
  wire [18:0] _T_871 = _T_870 | _T_869; // @[Mux.scala 27:72]
  wire [31:0] temp_pred_correct_npc_x = {_T_871,_T_846[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_887_mul = i0_rs1_depend_i0_r & i0_r_c_mul; // @[el2_dec_decode_ctl.scala 778:61]
  wire  _T_887_alu = i0_rs1_depend_i0_r & i0_r_c_alu; // @[el2_dec_decode_ctl.scala 778:61]
  wire  i0_rs1_class_d_mul = i0_rs1_depend_i0_x ? i0_x_c_mul : _T_887_mul; // @[el2_dec_decode_ctl.scala 778:24]
  wire  i0_rs1_class_d_alu = i0_rs1_depend_i0_x ? i0_x_c_alu : _T_887_alu; // @[el2_dec_decode_ctl.scala 778:24]
  wire  _T_896_mul = i0_rs2_depend_i0_r & i0_r_c_mul; // @[el2_dec_decode_ctl.scala 780:61]
  wire  _T_896_alu = i0_rs2_depend_i0_r & i0_r_c_alu; // @[el2_dec_decode_ctl.scala 780:61]
  wire  i0_rs2_class_d_mul = i0_rs2_depend_i0_x ? i0_x_c_mul : _T_896_mul; // @[el2_dec_decode_ctl.scala 780:24]
  wire  i0_rs2_class_d_alu = i0_rs2_depend_i0_x ? i0_x_c_alu : _T_896_alu; // @[el2_dec_decode_ctl.scala 780:24]
  wire  _T_909 = io_dec_i0_rs1_en_d & io_dec_nonblock_load_wen; // @[el2_dec_decode_ctl.scala 798:62]
  wire  _T_910 = io_dec_nonblock_load_waddr == i0r_rs1; // @[el2_dec_decode_ctl.scala 798:119]
  wire  i0_rs1_nonblock_load_bypass_en_d = _T_909 & _T_910; // @[el2_dec_decode_ctl.scala 798:89]
  wire  _T_911 = io_dec_i0_rs2_en_d & io_dec_nonblock_load_wen; // @[el2_dec_decode_ctl.scala 800:62]
  wire  _T_912 = io_dec_nonblock_load_waddr == i0r_rs2; // @[el2_dec_decode_ctl.scala 800:119]
  wire  i0_rs2_nonblock_load_bypass_en_d = _T_911 & _T_912; // @[el2_dec_decode_ctl.scala 800:89]
  wire  _T_914 = i0_rs1_class_d_alu | i0_rs1_class_d_mul; // @[el2_dec_decode_ctl.scala 803:69]
  wire  _T_915 = i0_rs1_depth_d[0] & _T_914; // @[el2_dec_decode_ctl.scala 803:48]
  wire  _T_917 = i0_rs1_depth_d[0] & i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 803:111]
  wire  _T_920 = _T_914 | i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 803:199]
  wire  _T_921 = i0_rs1_depth_d[1] & _T_920; // @[el2_dec_decode_ctl.scala 803:156]
  wire [2:0] i0_rs1bypass = {_T_915,_T_917,_T_921}; // @[Cat.scala 29:58]
  wire  _T_925 = i0_rs2_class_d_alu | i0_rs2_class_d_mul; // @[el2_dec_decode_ctl.scala 805:70]
  wire  _T_926 = i0_rs2_depth_d[0] & _T_925; // @[el2_dec_decode_ctl.scala 805:48]
  wire  _T_928 = i0_rs2_depth_d[0] & i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 805:112]
  wire  _T_931 = _T_925 | i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 805:199]
  wire  _T_932 = i0_rs2_depth_d[1] & _T_931; // @[el2_dec_decode_ctl.scala 805:156]
  wire [2:0] i0_rs2bypass = {_T_926,_T_928,_T_932}; // @[Cat.scala 29:58]
  wire  _T_938 = i0_rs1bypass[1] | i0_rs1bypass[0]; // @[el2_dec_decode_ctl.scala 807:78]
  wire  _T_940 = ~i0_rs1bypass[2]; // @[el2_dec_decode_ctl.scala 807:99]
  wire  _T_941 = _T_940 & i0_rs1_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 807:116]
  wire  _T_942 = _T_938 | _T_941; // @[el2_dec_decode_ctl.scala 807:96]
  wire  _T_947 = i0_rs2bypass[1] | i0_rs2bypass[0]; // @[el2_dec_decode_ctl.scala 808:78]
  wire  _T_949 = ~i0_rs2bypass[2]; // @[el2_dec_decode_ctl.scala 808:99]
  wire  _T_950 = _T_949 & i0_rs2_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 808:116]
  wire  _T_951 = _T_947 | _T_950; // @[el2_dec_decode_ctl.scala 808:96]
  wire  _T_958 = ~i0_rs1bypass[1]; // @[el2_dec_decode_ctl.scala 813:30]
  wire  _T_960 = ~i0_rs1bypass[0]; // @[el2_dec_decode_ctl.scala 813:49]
  wire  _T_961 = _T_958 & _T_960; // @[el2_dec_decode_ctl.scala 813:47]
  wire  _T_962 = _T_961 & i0_rs1_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 813:66]
  wire [31:0] _T_964 = i0_rs1bypass[1] ? io_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_965 = i0_rs1bypass[0] ? i0_result_r_raw : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_966 = _T_962 ? io_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_967 = _T_964 | _T_965; // @[Mux.scala 27:72]
  wire  _T_975 = ~i0_rs2bypass[1]; // @[el2_dec_decode_ctl.scala 818:31]
  wire  _T_977 = ~i0_rs2bypass[0]; // @[el2_dec_decode_ctl.scala 818:50]
  wire  _T_978 = _T_975 & _T_977; // @[el2_dec_decode_ctl.scala 818:48]
  wire  _T_979 = _T_978 & i0_rs2_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 818:67]
  wire [31:0] _T_981 = i0_rs2bypass[1] ? io_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_982 = i0_rs2bypass[0] ? i0_result_r_raw : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_983 = _T_979 ? io_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_984 = _T_981 | _T_982; // @[Mux.scala 27:72]
  wire  _T_987 = i0_dp_raw_load | i0_dp_raw_store; // @[el2_dec_decode_ctl.scala 820:68]
  wire  _T_988 = io_dec_ib0_valid_d & _T_987; // @[el2_dec_decode_ctl.scala 820:50]
  wire  _T_989 = ~io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 820:89]
  wire  _T_990 = _T_988 & _T_989; // @[el2_dec_decode_ctl.scala 820:87]
  wire  _T_992 = _T_990 & _T_493; // @[el2_dec_decode_ctl.scala 820:112]
  wire  _T_994 = ~io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 822:6]
  wire  _T_995 = _T_994 & i0_dp_lsu; // @[el2_dec_decode_ctl.scala 822:27]
  wire  _T_996 = _T_995 & i0_dp_load; // @[el2_dec_decode_ctl.scala 822:39]
  wire  _T_1001 = _T_995 & i0_dp_store; // @[el2_dec_decode_ctl.scala 823:39]
  wire [11:0] _T_1005 = {io_dec_i0_instr_d[31:25],i0r_rd}; // @[Cat.scala 29:58]
  wire [11:0] _T_1006 = _T_996 ? io_dec_i0_instr_d[31:20] : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1007 = _T_1001 ? _T_1005 : 12'h0; // @[Mux.scala 27:72]
  rvclkhdr data_gated_cgc ( // @[el2_dec_decode_ctl.scala 221:29]
    .io_l1clk(data_gated_cgc_io_l1clk),
    .io_clk(data_gated_cgc_io_clk),
    .io_en(data_gated_cgc_io_en),
    .io_scan_mode(data_gated_cgc_io_scan_mode)
  );
  el2_dec_dec_ctl i0_dec ( // @[el2_dec_decode_ctl.scala 396:24]
    .io_ins(i0_dec_io_ins),
    .io_out_alu(i0_dec_io_out_alu),
    .io_out_rs2(i0_dec_io_out_rs2),
    .io_out_rs1(i0_dec_io_out_rs1),
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
  rvclkhdr rvclkhdr ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[beh_lib.scala 360:21]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[beh_lib.scala 360:21]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[beh_lib.scala 360:21]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[beh_lib.scala 360:21]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[beh_lib.scala 360:21]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  rvclkhdr rvclkhdr_12 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_12_io_l1clk),
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en),
    .io_scan_mode(rvclkhdr_12_io_scan_mode)
  );
  rvclkhdr rvclkhdr_13 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_13_io_l1clk),
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en),
    .io_scan_mode(rvclkhdr_13_io_scan_mode)
  );
  rvclkhdr rvclkhdr_14 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_14_io_l1clk),
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en),
    .io_scan_mode(rvclkhdr_14_io_scan_mode)
  );
  rvclkhdr rvclkhdr_15 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_15_io_l1clk),
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en),
    .io_scan_mode(rvclkhdr_15_io_scan_mode)
  );
  rvclkhdr rvclkhdr_16 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_16_io_l1clk),
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en),
    .io_scan_mode(rvclkhdr_16_io_scan_mode)
  );
  rvclkhdr rvclkhdr_17 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_17_io_l1clk),
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en),
    .io_scan_mode(rvclkhdr_17_io_scan_mode)
  );
  rvclkhdr rvclkhdr_18 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_18_io_l1clk),
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en),
    .io_scan_mode(rvclkhdr_18_io_scan_mode)
  );
  assign io_dec_extint_stall = _T_339; // @[el2_dec_decode_ctl.scala 436:23]
  assign io_dec_i0_inst_wb1 = _T_837; // @[el2_dec_decode_ctl.scala 757:22]
  assign io_dec_i0_pc_wb1 = _T_840; // @[el2_dec_decode_ctl.scala 760:20]
  assign io_dec_i0_rs1_en_d = i0_dp_rs1 & _T_556; // @[el2_dec_decode_ctl.scala 628:24]
  assign io_dec_i0_rs2_en_d = i0_dp_rs2 & _T_558; // @[el2_dec_decode_ctl.scala 629:24]
  assign io_dec_i0_rs1_d = io_dec_i0_instr_d[19:15]; // @[el2_dec_decode_ctl.scala 631:19]
  assign io_dec_i0_rs2_d = io_dec_i0_instr_d[24:20]; // @[el2_dec_decode_ctl.scala 632:19]
  assign io_dec_i0_immed_d = _T_563 | _T_564; // @[el2_dec_decode_ctl.scala 637:21]
  assign io_dec_i0_br_immed_d = _T_768 ? i0_br_offset : _T_781; // @[el2_dec_decode_ctl.scala 715:24]
  assign io_i0_ap_land = _T_40 ? 1'h0 : i0_dp_raw_land; // @[el2_dec_decode_ctl.scala 288:20]
  assign io_i0_ap_lor = _T_40 | i0_dp_raw_lor; // @[el2_dec_decode_ctl.scala 289:20]
  assign io_i0_ap_lxor = _T_40 ? 1'h0 : i0_dp_raw_lxor; // @[el2_dec_decode_ctl.scala 290:20]
  assign io_i0_ap_sll = _T_40 ? 1'h0 : i0_dp_raw_sll; // @[el2_dec_decode_ctl.scala 291:20]
  assign io_i0_ap_srl = _T_40 ? 1'h0 : i0_dp_raw_srl; // @[el2_dec_decode_ctl.scala 292:20]
  assign io_i0_ap_sra = _T_40 ? 1'h0 : i0_dp_raw_sra; // @[el2_dec_decode_ctl.scala 293:20]
  assign io_i0_ap_beq = _T_40 ? 1'h0 : i0_dp_raw_beq; // @[el2_dec_decode_ctl.scala 296:20]
  assign io_i0_ap_bne = _T_40 ? 1'h0 : i0_dp_raw_bne; // @[el2_dec_decode_ctl.scala 297:20]
  assign io_i0_ap_blt = _T_40 ? 1'h0 : i0_dp_raw_blt; // @[el2_dec_decode_ctl.scala 298:20]
  assign io_i0_ap_bge = _T_40 ? 1'h0 : i0_dp_raw_bge; // @[el2_dec_decode_ctl.scala 299:20]
  assign io_i0_ap_add = _T_40 ? 1'h0 : i0_dp_raw_add; // @[el2_dec_decode_ctl.scala 286:20]
  assign io_i0_ap_sub = _T_40 ? 1'h0 : i0_dp_raw_sub; // @[el2_dec_decode_ctl.scala 287:20]
  assign io_i0_ap_slt = _T_40 ? 1'h0 : i0_dp_raw_slt; // @[el2_dec_decode_ctl.scala 294:20]
  assign io_i0_ap_unsign = _T_40 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 295:20]
  assign io_i0_ap_jal = _T_336 & _T_337; // @[el2_dec_decode_ctl.scala 302:22]
  assign io_i0_ap_predict_t = _T_46 & i0_predict_br; // @[el2_dec_decode_ctl.scala 284:26]
  assign io_i0_ap_predict_nt = _T_47 & i0_predict_br; // @[el2_dec_decode_ctl.scala 283:26]
  assign io_i0_ap_csr_write = i0_csr_write & _T_347; // @[el2_dec_decode_ctl.scala 300:22]
  assign io_i0_ap_csr_imm = _T_40 ? 1'h0 : i0_dp_raw_csr_imm; // @[el2_dec_decode_ctl.scala 301:22]
  assign io_dec_i0_decode_d = _T_490 & _T_467; // @[el2_dec_decode_ctl.scala 556:22 el2_dec_decode_ctl.scala 622:22]
  assign io_dec_i0_alu_decode_d = i0_exulegal_decode_d & i0_dp_alu; // @[el2_dec_decode_ctl.scala 576:26]
  assign io_dec_i0_rs1_bypass_data_d = _T_967 | _T_966; // @[el2_dec_decode_ctl.scala 810:34]
  assign io_dec_i0_rs2_bypass_data_d = _T_984 | _T_983; // @[el2_dec_decode_ctl.scala 815:34]
  assign io_dec_i0_waddr_r = r_d_i0rd; // @[el2_dec_decode_ctl.scala 698:27]
  assign io_dec_i0_wen_r = _T_757 & _T_758; // @[el2_dec_decode_ctl.scala 700:32]
  assign io_dec_i0_wdata_r = _T_764 ? io_lsu_result_corr_r : i0_result_r_raw; // @[el2_dec_decode_ctl.scala 701:26]
  assign io_dec_i0_select_pc_d = _T_40 ? 1'h0 : i0_dp_raw_pc; // @[el2_dec_decode_ctl.scala 274:25]
  assign io_dec_i0_rs1_bypass_en_d = {i0_rs1bypass[2],_T_942}; // @[el2_dec_decode_ctl.scala 807:37]
  assign io_dec_i0_rs2_bypass_en_d = {i0_rs2bypass[2],_T_951}; // @[el2_dec_decode_ctl.scala 808:37]
  assign io_lsu_p_fast_int = io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 442:30]
  assign io_lsu_p_by = io_dec_extint_stall ? 1'h0 : i0_dp_by; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 448:41]
  assign io_lsu_p_half = io_dec_extint_stall ? 1'h0 : i0_dp_half; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 449:41]
  assign io_lsu_p_word = io_dec_extint_stall | i0_dp_word; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 441:30 el2_dec_decode_ctl.scala 450:41]
  assign io_lsu_p_dword = 1'h0; // @[el2_dec_decode_ctl.scala 438:11]
  assign io_lsu_p_load = io_dec_extint_stall | i0_dp_load; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 440:30 el2_dec_decode_ctl.scala 446:41]
  assign io_lsu_p_store = io_dec_extint_stall ? 1'h0 : i0_dp_store; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 447:41]
  assign io_lsu_p_unsign = io_dec_extint_stall ? 1'h0 : i0_dp_unsign; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 454:41]
  assign io_lsu_p_dma = 1'h0; // @[el2_dec_decode_ctl.scala 438:11]
  assign io_lsu_p_store_data_bypass_d = io_dec_extint_stall ? 1'h0 : store_data_bypass_d; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 452:41]
  assign io_lsu_p_load_ldst_bypass_d = io_dec_extint_stall ? 1'h0 : load_ldst_bypass_d; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 451:41]
  assign io_lsu_p_store_data_bypass_m = 1'h0; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 453:41]
  assign io_lsu_p_valid = io_dec_extint_stall | lsu_decode_d; // @[el2_dec_decode_ctl.scala 438:11 el2_dec_decode_ctl.scala 443:30 el2_dec_decode_ctl.scala 445:41]
  assign io_mul_p_valid = i0_exulegal_decode_d & i0_dp_mul; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 431:21]
  assign io_mul_p_rs1_sign = _T_40 ? 1'h0 : i0_dp_raw_rs1_sign; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 432:21]
  assign io_mul_p_rs2_sign = _T_40 ? 1'h0 : i0_dp_raw_rs2_sign; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 433:21]
  assign io_mul_p_low = _T_40 ? 1'h0 : i0_dp_raw_low; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 434:21]
  assign io_mul_p_bext = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bdep = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_clmul = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_clmulh = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_clmulr = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_grev = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_shfl = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_unshfl = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_crc32_b = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_crc32_h = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_crc32_w = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_crc32c_b = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_crc32c_h = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_crc32c_w = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_mul_p_bfp = 1'h0; // @[el2_dec_decode_ctl.scala 126:12]
  assign io_div_p_valid = i0_exulegal_decode_d & i0_dp_div; // @[el2_dec_decode_ctl.scala 427:21]
  assign io_div_p_unsign = _T_40 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 428:21]
  assign io_div_p_rem = _T_40 ? 1'h0 : i0_dp_raw_rem; // @[el2_dec_decode_ctl.scala 429:21]
  assign io_div_waddr_wb = _T_830; // @[el2_dec_decode_ctl.scala 745:19]
  assign io_dec_div_cancel = _T_810 | _T_815; // @[el2_dec_decode_ctl.scala 734:29]
  assign io_dec_lsu_valid_raw_d = _T_992 | io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 820:26]
  assign io_dec_lsu_offset_d = _T_1006 | _T_1007; // @[el2_dec_decode_ctl.scala 821:23]
  assign io_dec_csr_ren_d = _T_40 ? 1'h0 : i0_dp_raw_csr_read; // @[el2_dec_decode_ctl.scala 458:21]
  assign io_dec_csr_wen_unq_d = _T_349 | i0_csr_write; // @[el2_dec_decode_ctl.scala 467:24]
  assign io_dec_csr_any_unq_d = i0_dp_csr_read | i0_csr_write; // @[el2_dec_decode_ctl.scala 533:24]
  assign io_dec_csr_rdaddr_d = io_dec_i0_instr_d[31:20]; // @[el2_dec_decode_ctl.scala 470:24]
  assign io_dec_csr_wen_r = _T_352 & _T_754; // @[el2_dec_decode_ctl.scala 475:20]
  assign io_dec_csr_wraddr_r = r_d_csrwaddr; // @[el2_dec_decode_ctl.scala 471:23]
  assign io_dec_csr_wrdata_r = r_d_csrwonly ? i0_result_corr_r : write_csr_data; // @[el2_dec_decode_ctl.scala 518:24]
  assign io_dec_csr_stall_int_ff = _T_359 & _T_360; // @[el2_dec_decode_ctl.scala 478:27]
  assign io_dec_tlu_i0_valid_r = r_d_i0valid & _T_743; // @[el2_dec_decode_ctl.scala 582:30]
  assign io_dec_tlu_packet_r_legal = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_legal; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_icaf = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_icaf_f1 = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf_f1; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_icaf_type = io_dec_tlu_flush_lower_wb ? 2'h0 : r_t_icaf_type; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_fence_i = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_fence_i; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_i0trigger = io_dec_tlu_flush_lower_wb ? 4'h0 : _T_542; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_flush_lower_wb ? 4'h0 : r_t_pmu_i0_itype; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_pmu_i0_br_unpred; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_packet_r_pmu_divide = r_d_i0div & r_d_i0valid; // @[el2_dec_decode_ctl.scala 616:39 el2_dec_decode_ctl.scala 617:39]
  assign io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_flush_lower_wb ? 1'h0 : lsu_pmu_misaligned_r; // @[el2_dec_decode_ctl.scala 616:39]
  assign io_dec_tlu_i0_pc_r = dec_i0_pc_r; // @[el2_dec_decode_ctl.scala 763:27]
  assign io_dec_illegal_inst = _T_465; // @[el2_dec_decode_ctl.scala 540:23]
  assign io_pred_correct_npc_x = temp_pred_correct_npc_x[31:1]; // @[el2_dec_decode_ctl.scala 768:25]
  assign io_dec_i0_predict_p_d_misp = 1'h0; // @[el2_dec_decode_ctl.scala 230:38]
  assign io_dec_i0_predict_p_d_ataken = 1'h0; // @[el2_dec_decode_ctl.scala 231:38]
  assign io_dec_i0_predict_p_d_boffset = 1'h0; // @[el2_dec_decode_ctl.scala 232:38]
  assign io_dec_i0_predict_p_d_pc4 = io_dec_i0_pc4_d; // @[el2_dec_decode_ctl.scala 237:38]
  assign io_dec_i0_predict_p_d_hist = io_dec_i0_brp_hist; // @[el2_dec_decode_ctl.scala 238:38]
  assign io_dec_i0_predict_p_d_toffset = _T_314 ? i0_pcall_imm[12:1] : _T_323; // @[el2_dec_decode_ctl.scala 251:44]
  assign io_dec_i0_predict_p_d_valid = i0_brp_valid & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 239:38]
  assign io_dec_i0_predict_p_d_br_error = _T_32 & _T_17; // @[el2_dec_decode_ctl.scala 246:51]
  assign io_dec_i0_predict_p_d_br_start_error = _T_35 & _T_17; // @[el2_dec_decode_ctl.scala 247:51]
  assign io_dec_i0_predict_p_d_prett = io_dec_i0_brp_prett; // @[el2_dec_decode_ctl.scala 236:38]
  assign io_dec_i0_predict_p_d_pcall = i0_dp_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 233:38]
  assign io_dec_i0_predict_p_d_pret = i0_dp_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 235:38]
  assign io_dec_i0_predict_p_d_pja = i0_dp_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 234:38]
  assign io_dec_i0_predict_p_d_way = io_dec_i0_brp_way; // @[el2_dec_decode_ctl.scala 253:51]
  assign io_i0_predict_fghr_d = io_dec_i0_bp_fghr; // @[el2_dec_decode_ctl.scala 252:32]
  assign io_i0_predict_index_d = io_dec_i0_bp_index; // @[el2_dec_decode_ctl.scala 248:32]
  assign io_i0_predict_btag_d = io_dec_i0_bp_btag; // @[el2_dec_decode_ctl.scala 249:32]
  assign io_dec_data_en = {i0_x_data_en,i0_r_data_en}; // @[el2_dec_decode_ctl.scala 666:27]
  assign io_dec_ctl_en = {i0_x_ctl_en,i0_r_ctl_en}; // @[el2_dec_decode_ctl.scala 667:27]
  assign io_dec_pmu_instr_decoded = io_dec_i0_decode_d; // @[el2_dec_decode_ctl.scala 561:28]
  assign io_dec_pmu_decode_stall = io_dec_ib0_valid_d & _T_498; // @[el2_dec_decode_ctl.scala 562:27]
  assign io_dec_pmu_presync_stall = i0_presync & prior_inflight_eff; // @[el2_dec_decode_ctl.scala 564:29]
  assign io_dec_pmu_postsync_stall = postsync_stall; // @[el2_dec_decode_ctl.scala 563:29]
  assign io_dec_nonblock_load_wen = _T_199 & _T_200; // @[el2_dec_decode_ctl.scala 357:28]
  assign io_dec_nonblock_load_waddr = _T_245 | _T_237; // @[el2_dec_decode_ctl.scala 354:29 el2_dec_decode_ctl.scala 364:29]
  assign io_dec_pause_state = pause_stall; // @[el2_dec_decode_ctl.scala 502:22]
  assign io_dec_pause_state_cg = pause_stall & _T_420; // @[el2_dec_decode_ctl.scala 506:25]
  assign io_dec_div_active = _T_821; // @[el2_dec_decode_ctl.scala 739:21]
  assign data_gated_cgc_io_clk = clock; // @[el2_dec_decode_ctl.scala 224:31]
  assign data_gated_cgc_io_en = _T_15 | _T_16; // @[el2_dec_decode_ctl.scala 222:31]
  assign data_gated_cgc_io_scan_mode = io_scan_mode; // @[el2_dec_decode_ctl.scala 223:31]
  assign i0_dec_io_ins = io_dec_i0_instr_d; // @[el2_dec_decode_ctl.scala 397:18]
  assign rvclkhdr_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_io_en = i0_pipe_en[3] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_1_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_1_io_en = i0_pipe_en[3] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_2_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_2_io_en = _T_428 | pause_stall; // @[beh_lib.scala 353:15]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_3_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_3_io_en = shift_illegal & _T_464; // @[beh_lib.scala 353:15]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_4_io_clk = clock; // @[beh_lib.scala 362:16]
  assign rvclkhdr_4_io_en = _T_704 | io_clk_override; // @[beh_lib.scala 363:15]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[beh_lib.scala 364:22]
  assign rvclkhdr_5_io_clk = clock; // @[beh_lib.scala 362:16]
  assign rvclkhdr_5_io_en = _T_704 | io_clk_override; // @[beh_lib.scala 363:15]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[beh_lib.scala 364:22]
  assign rvclkhdr_6_io_clk = clock; // @[beh_lib.scala 362:16]
  assign rvclkhdr_6_io_en = _T_704 | io_clk_override; // @[beh_lib.scala 363:15]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[beh_lib.scala 364:22]
  assign rvclkhdr_7_io_clk = clock; // @[beh_lib.scala 362:16]
  assign rvclkhdr_7_io_en = _T_707 | io_clk_override; // @[beh_lib.scala 363:15]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[beh_lib.scala 364:22]
  assign rvclkhdr_8_io_clk = clock; // @[beh_lib.scala 362:16]
  assign rvclkhdr_8_io_en = _T_710 | io_clk_override; // @[beh_lib.scala 363:15]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[beh_lib.scala 364:22]
  assign rvclkhdr_9_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_9_io_en = i0_pipe_en[2] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_10_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_10_io_en = i0_pipe_en[3] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_11_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_11_io_en = i0_legal_decode_d & i0_dp_div; // @[beh_lib.scala 353:15]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_12_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_12_io_en = i0_pipe_en[3] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_13_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_13_io_en = i0_pipe_en[2] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_14_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_14_io_en = i0_pipe_en[1] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_15_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_15_io_en = i0_pipe_en[0] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_16_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_16_io_en = i0_pipe_en[1] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_17_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_17_io_en = i0_pipe_en[0] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_18_io_clk = clock; // @[beh_lib.scala 352:16]
  assign rvclkhdr_18_io_en = i0_pipe_en[2] | io_clk_override; // @[beh_lib.scala 353:15]
  assign rvclkhdr_18_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
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
  cam_raw_0_tag = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  cam_raw_0_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cam_raw_1_tag = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  cam_raw_1_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cam_raw_2_tag = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  cam_raw_2_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  cam_raw_3_tag = _RAND_16[2:0];
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
  cam_raw_0_rd = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  cam_raw_0_wb = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  cam_raw_1_rd = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  cam_raw_1_wb = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  cam_raw_2_rd = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  cam_raw_2_wb = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  cam_raw_3_rd = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  cam_raw_3_wb = _RAND_32[0:0];
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
    cam_raw_0_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_0_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_1_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_1_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_2_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_2_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_3_tag = 3'h0;
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
    cam_raw_0_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_0_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_1_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_1_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_2_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_2_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_3_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_3_wb = 1'h0;
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r1 <= 1'h0;
    end else begin
      tlu_wr_pause_r1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r2 <= 1'h0;
    end else begin
      tlu_wr_pause_r2 <= tlu_wr_pause_r1;
    end
  end
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      leak1_i1_stall <= 1'h0;
    end else begin
      leak1_i1_stall <= io_dec_tlu_flush_leak_one_r | _T_280;
    end
  end
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      leak1_i0_stall <= 1'h0;
    end else begin
      leak1_i0_stall <= _T_283 | _T_285;
    end
  end
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      pause_stall <= 1'h0;
    end else begin
      pause_stall <= _T_412 & _T_413;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
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
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      postsync_stall <= 1'h0;
    end else begin
      postsync_stall <= _T_506 | _T_507;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0valid <= 1'h0;
    end else begin
      x_d_i0valid <= io_dec_i0_decode_d;
    end
  end
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      flush_final_r <= 1'h0;
    end else begin
      flush_final_r <= io_exu_flush_final;
    end
  end
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      illegal_lockout <= 1'h0;
    end else begin
      illegal_lockout <= _T_466 & _T_467;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_tag <= 3'h0;
    end else if (cam_wen[0]) begin
      cam_raw_0_tag <= io_lsu_nonblock_load_tag_m;
    end else if (_T_106) begin
      cam_raw_0_tag <= 3'h0;
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
      cam_raw_1_tag <= 3'h0;
    end else if (cam_wen[1]) begin
      cam_raw_1_tag <= io_lsu_nonblock_load_tag_m;
    end else if (_T_132) begin
      cam_raw_1_tag <= 3'h0;
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
      cam_raw_2_tag <= 3'h0;
    end else if (cam_wen[2]) begin
      cam_raw_2_tag <= io_lsu_nonblock_load_tag_m;
    end else if (_T_158) begin
      cam_raw_2_tag <= 3'h0;
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
      cam_raw_3_tag <= 3'h0;
    end else if (cam_wen[3]) begin
      cam_raw_3_tag <= io_lsu_nonblock_load_tag_m;
    end else if (_T_184) begin
      cam_raw_3_tag <= 3'h0;
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
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0load <= 1'h0;
    end else begin
      x_d_i0load <= i0_dp_load & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
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
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0load <= 1'h0;
    end else begin
      r_d_i0load <= x_d_i0load;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0v <= 1'h0;
    end else begin
      r_d_i0v <= _T_733 & _T_279;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0rd <= 5'h0;
    end else begin
      r_d_i0rd <= x_d_i0rd;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_rd <= 5'h0;
    end else if (cam_wen[0]) begin
      if (x_d_i0load) begin
        cam_raw_0_rd <= x_d_i0rd;
      end else begin
        cam_raw_0_rd <= 5'h0;
      end
    end else if (_T_106) begin
      cam_raw_0_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_wb <= 1'h0;
    end else begin
      cam_raw_0_wb <= _T_111 | _GEN_57;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_rd <= 5'h0;
    end else if (cam_wen[1]) begin
      if (x_d_i0load) begin
        cam_raw_1_rd <= x_d_i0rd;
      end else begin
        cam_raw_1_rd <= 5'h0;
      end
    end else if (_T_132) begin
      cam_raw_1_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_wb <= 1'h0;
    end else begin
      cam_raw_1_wb <= _T_137 | _GEN_68;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_rd <= 5'h0;
    end else if (cam_wen[2]) begin
      if (x_d_i0load) begin
        cam_raw_2_rd <= x_d_i0rd;
      end else begin
        cam_raw_2_rd <= 5'h0;
      end
    end else if (_T_158) begin
      cam_raw_2_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_wb <= 1'h0;
    end else begin
      cam_raw_2_wb <= _T_163 | _GEN_79;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_rd <= 5'h0;
    end else if (cam_wen[3]) begin
      if (x_d_i0load) begin
        cam_raw_3_rd <= x_d_i0rd;
      end else begin
        cam_raw_3_rd <= 5'h0;
      end
    end else if (_T_184) begin
      cam_raw_3_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_wb <= 1'h0;
    end else begin
      cam_raw_3_wb <= _T_189 | _GEN_90;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      lsu_idle <= 1'h0;
    end else begin
      lsu_idle <= io_lsu_idle_any;
    end
  end
  always @(posedge data_gated_cgc_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_339 <= 1'h0;
    end else begin
      _T_339 <= io_dec_tlu_flush_extint;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0v <= 1'h0;
    end else begin
      x_d_i0v <= i0_rd_en_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_csrwen <= 1'h0;
    end else begin
      r_d_csrwen <= x_d_csrwen;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0valid <= 1'h0;
    end else begin
      r_d_i0valid <= _T_737 & _T_279;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
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
    end else if (_T_40) begin
      csr_imm_x <= 1'h0;
    end else begin
      csr_imm_x <= i0_dp_raw_csr_imm;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      csrimm_x <= 5'h0;
    end else begin
      csrimm_x <= io_dec_i0_instr_d[19:15];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      csr_rddata_x <= 32'h0;
    end else begin
      csr_rddata_x <= io_dec_csr_rddata_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_csrwonly <= 1'h0;
    end else begin
      r_d_csrwonly <= x_d_csrwonly;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_result_r_raw <= 32'h0;
    end else if (_T_761) begin
      i0_result_r_raw <= io_lsu_result_m;
    end else begin
      i0_result_r_raw <= io_exu_i0_result_x;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_csrwonly <= 1'h0;
    end else begin
      x_d_csrwonly <= i0_csr_write_only_d & io_dec_i0_decode_d;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      wbd_csrwonly <= 1'h0;
    end else begin
      wbd_csrwonly <= r_d_csrwonly;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_465 <= 32'h0;
    end else if (io_dec_i0_pc4_d) begin
      _T_465 <= io_dec_i0_instr_d;
    end else begin
      _T_465 <= _T_462;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_legal <= 1'h0;
    end else begin
      x_t_legal <= io_dec_i0_decode_d & i0_legal;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf <= 1'h0;
    end else begin
      x_t_icaf <= i0_icaf_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf_f1 <= 1'h0;
    end else begin
      x_t_icaf_f1 <= io_dec_i0_icaf_f1_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf_type <= 2'h0;
    end else begin
      x_t_icaf_type <= io_dec_i0_icaf_type_d;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_fence_i <= 1'h0;
    end else begin
      x_t_fence_i <= _T_517 & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_i0trigger <= 4'h0;
    end else begin
      x_t_i0trigger <= io_dec_i0_trigger_match_d & _T_522;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_itype <= 4'h0;
    end else begin
      x_t_pmu_i0_itype <= _T_254 & _T_276;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_br_unpred <= 1'h0;
    end else begin
      x_t_pmu_i0_br_unpred <= i0_dp_jal & _T_252;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_legal <= 1'h0;
    end else begin
      r_t_legal <= x_t_legal;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf <= 1'h0;
    end else begin
      r_t_icaf <= x_t_icaf;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf_f1 <= 1'h0;
    end else begin
      r_t_icaf_f1 <= x_t_icaf_f1;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf_type <= 2'h0;
    end else begin
      r_t_icaf_type <= x_t_icaf_type;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_fence_i <= 1'h0;
    end else begin
      r_t_fence_i <= x_t_fence_i;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_i0trigger <= 4'h0;
    end else begin
      r_t_i0trigger <= x_t_i0trigger & _T_531;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_itype <= 4'h0;
    end else begin
      r_t_pmu_i0_itype <= x_t_pmu_i0_itype;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
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
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0store <= 1'h0;
    end else begin
      r_d_i0store <= x_d_i0store;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_i0div <= 1'h0;
    end else begin
      r_d_i0div <= x_d_i0div;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0store <= 1'h0;
    end else begin
      x_d_i0store <= i0_dp_store & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_i0div <= 1'h0;
    end else begin
      x_d_i0div <= i0_dp_div & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_csrwen <= 1'h0;
    end else begin
      x_d_csrwen <= io_dec_csr_wen_unq_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_csrwaddr <= 12'h0;
    end else begin
      x_d_csrwaddr <= io_dec_i0_instr_d[31:20];
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      last_br_immed_x <= 12'h0;
    end else if (io_i0_ap_predict_nt) begin
      last_br_immed_x <= _T_781;
    end else if (_T_314) begin
      last_br_immed_x <= i0_pcall_imm[12:1];
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
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_x <= 32'h0;
    end else if (io_dec_i0_pc4_d) begin
      i0_inst_x <= io_dec_i0_instr_d;
    end else begin
      i0_inst_x <= _T_462;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_r <= 32'h0;
    end else begin
      i0_inst_r <= i0_inst_x;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_wb <= 32'h0;
    end else begin
      i0_inst_wb <= i0_inst_r;
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_837 <= 32'h0;
    end else begin
      _T_837 <= i0_inst_wb;
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pc_wb <= 31'h0;
    end else begin
      i0_pc_wb <= io_dec_tlu_i0_pc_r;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_840 <= 31'h0;
    end else begin
      _T_840 <= i0_pc_wb;
    end
  end
  always @(posedge rvclkhdr_18_io_l1clk or posedge reset) begin
    if (reset) begin
      dec_i0_pc_r <= 31'h0;
    end else begin
      dec_i0_pc_r <= io_exu_i0_pc_x;
    end
  end
endmodule

