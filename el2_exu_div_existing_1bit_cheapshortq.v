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
module el2_exu_div_existing_1bit_cheapshortq(
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
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
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
  wire  rvclkhdr_11_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_12_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_12_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_13_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_13_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_14_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_14_io_en; // @[lib.scala 390:23]
  wire  _T = ~io_cancel; // @[exu_div_ctl.scala 127:30]
  reg  valid_ff_x; // @[Reg.scala 27:20]
  wire  valid_x = valid_ff_x & _T; // @[exu_div_ctl.scala 127:28]
  reg [32:0] q_ff; // @[Reg.scala 27:20]
  wire  _T_2 = q_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 133:34]
  reg [32:0] m_ff; // @[Reg.scala 27:20]
  wire  _T_4 = m_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 133:57]
  wire  _T_5 = _T_2 & _T_4; // @[exu_div_ctl.scala 133:43]
  wire  _T_7 = m_ff[31:0] != 32'h0; // @[exu_div_ctl.scala 133:80]
  wire  _T_8 = _T_5 & _T_7; // @[exu_div_ctl.scala 133:66]
  reg  rem_ff; // @[Reg.scala 27:20]
  wire  _T_9 = ~rem_ff; // @[exu_div_ctl.scala 133:91]
  wire  _T_10 = _T_8 & _T_9; // @[exu_div_ctl.scala 133:89]
  wire  _T_11 = _T_10 & valid_x; // @[exu_div_ctl.scala 133:99]
  wire  _T_13 = q_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 134:18]
  wire  _T_16 = _T_13 & _T_7; // @[exu_div_ctl.scala 134:27]
  wire  _T_18 = _T_16 & _T_9; // @[exu_div_ctl.scala 134:50]
  wire  _T_19 = _T_18 & valid_x; // @[exu_div_ctl.scala 134:60]
  wire  smallnum_case = _T_11 | _T_19; // @[exu_div_ctl.scala 133:110]
  wire  _T_23 = ~m_ff[3]; // @[exu_div_ctl.scala 138:69]
  wire  _T_25 = ~m_ff[2]; // @[exu_div_ctl.scala 138:69]
  wire  _T_27 = ~m_ff[1]; // @[exu_div_ctl.scala 138:69]
  wire  _T_28 = _T_23 & _T_25; // @[exu_div_ctl.scala 138:94]
  wire  _T_29 = _T_28 & _T_27; // @[exu_div_ctl.scala 138:94]
  wire  _T_30 = q_ff[3] & _T_29; // @[exu_div_ctl.scala 139:10]
  wire  _T_37 = q_ff[3] & _T_28; // @[exu_div_ctl.scala 139:10]
  wire  _T_39 = ~m_ff[0]; // @[exu_div_ctl.scala 145:32]
  wire  _T_40 = _T_37 & _T_39; // @[exu_div_ctl.scala 145:30]
  wire  _T_50 = q_ff[2] & _T_29; // @[exu_div_ctl.scala 139:10]
  wire  _T_51 = _T_40 | _T_50; // @[exu_div_ctl.scala 145:41]
  wire  _T_54 = q_ff[3] & q_ff[2]; // @[exu_div_ctl.scala 137:94]
  wire  _T_60 = _T_54 & _T_28; // @[exu_div_ctl.scala 139:10]
  wire  _T_61 = _T_51 | _T_60; // @[exu_div_ctl.scala 145:73]
  wire  _T_68 = q_ff[2] & _T_28; // @[exu_div_ctl.scala 139:10]
  wire  _T_71 = _T_68 & _T_39; // @[exu_div_ctl.scala 147:30]
  wire  _T_81 = q_ff[1] & _T_29; // @[exu_div_ctl.scala 139:10]
  wire  _T_82 = _T_71 | _T_81; // @[exu_div_ctl.scala 147:41]
  wire  _T_88 = _T_23 & _T_27; // @[exu_div_ctl.scala 138:94]
  wire  _T_89 = q_ff[3] & _T_88; // @[exu_div_ctl.scala 139:10]
  wire  _T_92 = _T_89 & _T_39; // @[exu_div_ctl.scala 147:103]
  wire  _T_93 = _T_82 | _T_92; // @[exu_div_ctl.scala 147:76]
  wire  _T_96 = ~q_ff[2]; // @[exu_div_ctl.scala 137:69]
  wire  _T_97 = q_ff[3] & _T_96; // @[exu_div_ctl.scala 137:94]
  wire  _T_105 = _T_28 & m_ff[1]; // @[exu_div_ctl.scala 138:94]
  wire  _T_106 = _T_105 & m_ff[0]; // @[exu_div_ctl.scala 138:94]
  wire  _T_107 = _T_97 & _T_106; // @[exu_div_ctl.scala 139:10]
  wire  _T_108 = _T_93 | _T_107; // @[exu_div_ctl.scala 147:114]
  wire  _T_110 = ~q_ff[3]; // @[exu_div_ctl.scala 137:69]
  wire  _T_113 = _T_110 & q_ff[2]; // @[exu_div_ctl.scala 137:94]
  wire  _T_114 = _T_113 & q_ff[1]; // @[exu_div_ctl.scala 137:94]
  wire  _T_120 = _T_114 & _T_28; // @[exu_div_ctl.scala 139:10]
  wire  _T_121 = _T_108 | _T_120; // @[exu_div_ctl.scala 148:43]
  wire  _T_127 = _T_54 & _T_23; // @[exu_div_ctl.scala 139:10]
  wire  _T_130 = _T_127 & _T_39; // @[exu_div_ctl.scala 148:104]
  wire  _T_131 = _T_121 | _T_130; // @[exu_div_ctl.scala 148:78]
  wire  _T_140 = _T_23 & m_ff[2]; // @[exu_div_ctl.scala 138:94]
  wire  _T_141 = _T_140 & _T_27; // @[exu_div_ctl.scala 138:94]
  wire  _T_142 = _T_54 & _T_141; // @[exu_div_ctl.scala 139:10]
  wire  _T_143 = _T_131 | _T_142; // @[exu_div_ctl.scala 148:116]
  wire  _T_146 = q_ff[3] & q_ff[1]; // @[exu_div_ctl.scala 137:94]
  wire  _T_152 = _T_146 & _T_88; // @[exu_div_ctl.scala 139:10]
  wire  _T_153 = _T_143 | _T_152; // @[exu_div_ctl.scala 149:43]
  wire  _T_158 = _T_54 & q_ff[1]; // @[exu_div_ctl.scala 137:94]
  wire  _T_163 = _T_158 & _T_140; // @[exu_div_ctl.scala 139:10]
  wire  _T_164 = _T_153 | _T_163; // @[exu_div_ctl.scala 149:77]
  wire  _T_168 = q_ff[2] & q_ff[1]; // @[exu_div_ctl.scala 137:94]
  wire  _T_169 = _T_168 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_175 = _T_169 & _T_88; // @[exu_div_ctl.scala 139:10]
  wire  _T_181 = _T_97 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_186 = _T_23 & m_ff[1]; // @[exu_div_ctl.scala 138:94]
  wire  _T_187 = _T_186 & m_ff[0]; // @[exu_div_ctl.scala 138:94]
  wire  _T_188 = _T_181 & _T_187; // @[exu_div_ctl.scala 139:10]
  wire  _T_189 = _T_175 | _T_188; // @[exu_div_ctl.scala 151:44]
  wire  _T_196 = q_ff[2] & _T_88; // @[exu_div_ctl.scala 139:10]
  wire  _T_199 = _T_196 & _T_39; // @[exu_div_ctl.scala 151:111]
  wire  _T_200 = _T_189 | _T_199; // @[exu_div_ctl.scala 151:84]
  wire  _T_207 = q_ff[1] & _T_28; // @[exu_div_ctl.scala 139:10]
  wire  _T_210 = _T_207 & _T_39; // @[exu_div_ctl.scala 152:32]
  wire  _T_211 = _T_200 | _T_210; // @[exu_div_ctl.scala 151:126]
  wire  _T_221 = q_ff[0] & _T_29; // @[exu_div_ctl.scala 139:10]
  wire  _T_222 = _T_211 | _T_221; // @[exu_div_ctl.scala 152:46]
  wire  _T_227 = ~q_ff[1]; // @[exu_div_ctl.scala 137:69]
  wire  _T_229 = _T_113 & _T_227; // @[exu_div_ctl.scala 137:94]
  wire  _T_239 = _T_229 & _T_106; // @[exu_div_ctl.scala 139:10]
  wire  _T_240 = _T_222 | _T_239; // @[exu_div_ctl.scala 152:86]
  wire  _T_249 = _T_114 & _T_23; // @[exu_div_ctl.scala 139:10]
  wire  _T_252 = _T_249 & _T_39; // @[exu_div_ctl.scala 153:35]
  wire  _T_253 = _T_240 | _T_252; // @[exu_div_ctl.scala 152:128]
  wire  _T_259 = _T_25 & _T_27; // @[exu_div_ctl.scala 138:94]
  wire  _T_260 = q_ff[3] & _T_259; // @[exu_div_ctl.scala 139:10]
  wire  _T_263 = _T_260 & _T_39; // @[exu_div_ctl.scala 153:74]
  wire  _T_264 = _T_253 | _T_263; // @[exu_div_ctl.scala 153:46]
  wire  _T_274 = _T_140 & m_ff[1]; // @[exu_div_ctl.scala 138:94]
  wire  _T_275 = _T_97 & _T_274; // @[exu_div_ctl.scala 139:10]
  wire  _T_276 = _T_264 | _T_275; // @[exu_div_ctl.scala 153:86]
  wire  _T_290 = _T_114 & _T_141; // @[exu_div_ctl.scala 139:10]
  wire  _T_291 = _T_276 | _T_290; // @[exu_div_ctl.scala 153:128]
  wire  _T_297 = _T_113 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_303 = _T_297 & _T_88; // @[exu_div_ctl.scala 139:10]
  wire  _T_304 = _T_291 | _T_303; // @[exu_div_ctl.scala 154:46]
  wire  _T_311 = _T_97 & _T_227; // @[exu_div_ctl.scala 137:94]
  wire  _T_317 = _T_140 & m_ff[0]; // @[exu_div_ctl.scala 138:94]
  wire  _T_318 = _T_311 & _T_317; // @[exu_div_ctl.scala 139:10]
  wire  _T_319 = _T_304 | _T_318; // @[exu_div_ctl.scala 154:86]
  wire  _T_324 = _T_96 & q_ff[1]; // @[exu_div_ctl.scala 137:94]
  wire  _T_325 = _T_324 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_331 = _T_325 & _T_28; // @[exu_div_ctl.scala 139:10]
  wire  _T_332 = _T_319 | _T_331; // @[exu_div_ctl.scala 154:128]
  wire  _T_338 = _T_54 & _T_27; // @[exu_div_ctl.scala 139:10]
  wire  _T_341 = _T_338 & _T_39; // @[exu_div_ctl.scala 155:73]
  wire  _T_342 = _T_332 | _T_341; // @[exu_div_ctl.scala 155:46]
  wire  _T_350 = _T_114 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_355 = _T_350 & _T_140; // @[exu_div_ctl.scala 139:10]
  wire  _T_356 = _T_342 | _T_355; // @[exu_div_ctl.scala 155:86]
  wire  _T_363 = m_ff[3] & _T_25; // @[exu_div_ctl.scala 138:94]
  wire  _T_364 = _T_54 & _T_363; // @[exu_div_ctl.scala 139:10]
  wire  _T_365 = _T_356 | _T_364; // @[exu_div_ctl.scala 155:128]
  wire  _T_375 = _T_363 & _T_27; // @[exu_div_ctl.scala 138:94]
  wire  _T_376 = _T_146 & _T_375; // @[exu_div_ctl.scala 139:10]
  wire  _T_377 = _T_365 | _T_376; // @[exu_div_ctl.scala 156:46]
  wire  _T_380 = q_ff[3] & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_386 = _T_380 & _T_259; // @[exu_div_ctl.scala 139:10]
  wire  _T_387 = _T_377 | _T_386; // @[exu_div_ctl.scala 156:86]
  wire  _T_391 = q_ff[3] & _T_227; // @[exu_div_ctl.scala 137:94]
  wire  _T_399 = _T_274 & m_ff[0]; // @[exu_div_ctl.scala 138:94]
  wire  _T_400 = _T_391 & _T_399; // @[exu_div_ctl.scala 139:10]
  wire  _T_401 = _T_387 | _T_400; // @[exu_div_ctl.scala 156:128]
  wire  _T_408 = _T_158 & m_ff[3]; // @[exu_div_ctl.scala 139:10]
  wire  _T_411 = _T_408 & _T_39; // @[exu_div_ctl.scala 157:75]
  wire  _T_412 = _T_401 | _T_411; // @[exu_div_ctl.scala 157:46]
  wire  _T_421 = m_ff[3] & _T_27; // @[exu_div_ctl.scala 138:94]
  wire  _T_422 = _T_158 & _T_421; // @[exu_div_ctl.scala 139:10]
  wire  _T_423 = _T_412 | _T_422; // @[exu_div_ctl.scala 157:86]
  wire  _T_428 = _T_54 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_433 = _T_428 & _T_421; // @[exu_div_ctl.scala 139:10]
  wire  _T_434 = _T_423 | _T_433; // @[exu_div_ctl.scala 157:128]
  wire  _T_440 = _T_97 & q_ff[1]; // @[exu_div_ctl.scala 137:94]
  wire  _T_445 = _T_440 & _T_186; // @[exu_div_ctl.scala 139:10]
  wire  _T_446 = _T_434 | _T_445; // @[exu_div_ctl.scala 158:46]
  wire  _T_451 = _T_146 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_454 = _T_451 & _T_25; // @[exu_div_ctl.scala 139:10]
  wire  _T_455 = _T_446 | _T_454; // @[exu_div_ctl.scala 158:86]
  wire  _T_462 = _T_158 & q_ff[0]; // @[exu_div_ctl.scala 137:94]
  wire  _T_464 = _T_462 & m_ff[3]; // @[exu_div_ctl.scala 139:10]
  wire  _T_465 = _T_455 | _T_464; // @[exu_div_ctl.scala 158:128]
  wire  _T_471 = _T_146 & _T_25; // @[exu_div_ctl.scala 139:10]
  wire  _T_474 = _T_471 & _T_39; // @[exu_div_ctl.scala 159:72]
  wire  _T_475 = _T_465 | _T_474; // @[exu_div_ctl.scala 159:46]
  wire [3:0] smallnum = {_T_30,_T_61,_T_164,_T_475}; // @[Cat.scala 29:58]
  reg  sign_ff; // @[Reg.scala 27:20]
  wire  _T_479 = sign_ff & q_ff[31]; // @[exu_div_ctl.scala 168:34]
  wire [32:0] short_dividend = {_T_479,q_ff[31:0]}; // @[Cat.scala 29:58]
  wire  _T_484 = ~short_dividend[32]; // @[exu_div_ctl.scala 173:7]
  wire  _T_487 = short_dividend[31:24] != 8'h0; // @[exu_div_ctl.scala 173:60]
  wire  _T_492 = short_dividend[31:23] != 9'h1ff; // @[exu_div_ctl.scala 174:59]
  wire  _T_493 = _T_484 & _T_487; // @[Mux.scala 27:72]
  wire  _T_494 = short_dividend[32] & _T_492; // @[Mux.scala 27:72]
  wire  _T_495 = _T_493 | _T_494; // @[Mux.scala 27:72]
  wire  _T_502 = short_dividend[23:16] != 8'h0; // @[exu_div_ctl.scala 177:60]
  wire  _T_507 = short_dividend[22:15] != 8'hff; // @[exu_div_ctl.scala 178:59]
  wire  _T_508 = _T_484 & _T_502; // @[Mux.scala 27:72]
  wire  _T_509 = short_dividend[32] & _T_507; // @[Mux.scala 27:72]
  wire  _T_510 = _T_508 | _T_509; // @[Mux.scala 27:72]
  wire  _T_517 = short_dividend[15:8] != 8'h0; // @[exu_div_ctl.scala 181:59]
  wire  _T_522 = short_dividend[14:7] != 8'hff; // @[exu_div_ctl.scala 182:58]
  wire  _T_523 = _T_484 & _T_517; // @[Mux.scala 27:72]
  wire  _T_524 = short_dividend[32] & _T_522; // @[Mux.scala 27:72]
  wire  _T_525 = _T_523 | _T_524; // @[Mux.scala 27:72]
  wire [4:0] a_cls = {2'h0,_T_495,_T_510,_T_525}; // @[Cat.scala 29:58]
  wire  _T_531 = ~m_ff[32]; // @[exu_div_ctl.scala 187:7]
  wire  _T_534 = m_ff[31:24] != 8'h0; // @[exu_div_ctl.scala 187:40]
  wire  _T_539 = m_ff[31:24] != 8'hff; // @[exu_div_ctl.scala 188:39]
  wire  _T_540 = _T_531 & _T_534; // @[Mux.scala 27:72]
  wire  _T_541 = m_ff[32] & _T_539; // @[Mux.scala 27:72]
  wire  _T_542 = _T_540 | _T_541; // @[Mux.scala 27:72]
  wire  _T_549 = m_ff[23:16] != 8'h0; // @[exu_div_ctl.scala 191:40]
  wire  _T_554 = m_ff[23:16] != 8'hff; // @[exu_div_ctl.scala 192:39]
  wire  _T_555 = _T_531 & _T_549; // @[Mux.scala 27:72]
  wire  _T_556 = m_ff[32] & _T_554; // @[Mux.scala 27:72]
  wire  _T_557 = _T_555 | _T_556; // @[Mux.scala 27:72]
  wire  _T_564 = m_ff[15:8] != 8'h0; // @[exu_div_ctl.scala 195:39]
  wire  _T_569 = m_ff[15:8] != 8'hff; // @[exu_div_ctl.scala 196:38]
  wire  _T_570 = _T_531 & _T_564; // @[Mux.scala 27:72]
  wire  _T_571 = m_ff[32] & _T_569; // @[Mux.scala 27:72]
  wire  _T_572 = _T_570 | _T_571; // @[Mux.scala 27:72]
  wire [4:0] b_cls = {2'h0,_T_542,_T_557,_T_572}; // @[Cat.scala 29:58]
  wire  _T_577 = a_cls[2:1] == 2'h1; // @[exu_div_ctl.scala 200:19]
  wire  _T_580 = _T_577 & b_cls[2]; // @[exu_div_ctl.scala 200:34]
  wire  _T_582 = a_cls[2:0] == 3'h1; // @[exu_div_ctl.scala 201:21]
  wire  _T_585 = _T_582 & b_cls[2]; // @[exu_div_ctl.scala 201:36]
  wire  _T_586 = _T_580 | _T_585; // @[exu_div_ctl.scala 200:65]
  wire  _T_588 = a_cls[2:0] == 3'h0; // @[exu_div_ctl.scala 202:21]
  wire  _T_591 = _T_588 & b_cls[2]; // @[exu_div_ctl.scala 202:36]
  wire  _T_592 = _T_586 | _T_591; // @[exu_div_ctl.scala 201:67]
  wire  _T_596 = b_cls[2:1] == 2'h1; // @[exu_div_ctl.scala 203:50]
  wire  _T_597 = _T_582 & _T_596; // @[exu_div_ctl.scala 203:36]
  wire  _T_598 = _T_592 | _T_597; // @[exu_div_ctl.scala 202:67]
  wire  _T_603 = _T_588 & _T_596; // @[exu_div_ctl.scala 204:36]
  wire  _T_604 = _T_598 | _T_603; // @[exu_div_ctl.scala 203:67]
  wire  _T_608 = b_cls[2:0] == 3'h1; // @[exu_div_ctl.scala 205:50]
  wire  _T_609 = _T_588 & _T_608; // @[exu_div_ctl.scala 205:36]
  wire  _T_610 = _T_604 | _T_609; // @[exu_div_ctl.scala 204:67]
  wire  _T_615 = a_cls[2] & b_cls[2]; // @[exu_div_ctl.scala 207:34]
  wire  _T_620 = _T_577 & _T_596; // @[exu_div_ctl.scala 208:36]
  wire  _T_621 = _T_615 | _T_620; // @[exu_div_ctl.scala 207:65]
  wire  _T_626 = _T_582 & _T_608; // @[exu_div_ctl.scala 209:36]
  wire  _T_627 = _T_621 | _T_626; // @[exu_div_ctl.scala 208:67]
  wire  _T_631 = b_cls[2:0] == 3'h0; // @[exu_div_ctl.scala 210:50]
  wire  _T_632 = _T_588 & _T_631; // @[exu_div_ctl.scala 210:36]
  wire  _T_633 = _T_627 | _T_632; // @[exu_div_ctl.scala 209:67]
  wire  _T_638 = a_cls[2] & _T_596; // @[exu_div_ctl.scala 212:34]
  wire  _T_643 = _T_577 & _T_608; // @[exu_div_ctl.scala 213:36]
  wire  _T_644 = _T_638 | _T_643; // @[exu_div_ctl.scala 212:65]
  wire  _T_649 = _T_582 & _T_631; // @[exu_div_ctl.scala 214:36]
  wire  _T_650 = _T_644 | _T_649; // @[exu_div_ctl.scala 213:67]
  wire  _T_655 = a_cls[2] & _T_608; // @[exu_div_ctl.scala 216:34]
  wire  _T_660 = _T_577 & _T_631; // @[exu_div_ctl.scala 217:36]
  wire  _T_661 = _T_655 | _T_660; // @[exu_div_ctl.scala 216:65]
  wire [3:0] shortq_raw = {_T_610,_T_633,_T_650,_T_661}; // @[Cat.scala 29:58]
  wire  _T_666 = valid_ff_x & _T_7; // @[exu_div_ctl.scala 220:35]
  wire  _T_667 = shortq_raw != 4'h0; // @[exu_div_ctl.scala 220:78]
  wire  shortq_enable = _T_666 & _T_667; // @[exu_div_ctl.scala 220:64]
  wire [3:0] _T_669 = shortq_enable ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_670 = _T_669 & shortq_raw; // @[exu_div_ctl.scala 221:57]
  wire [5:0] shortq_shift = {2'h0,_T_670}; // @[Cat.scala 29:58]
  reg [5:0] _T_1520; // @[Reg.scala 27:20]
  wire [3:0] shortq_shift_xx = _T_1520[3:0]; // @[exu_div_ctl.scala 277:21]
  wire [4:0] _T_679 = shortq_shift_xx[3] ? 5'h1f : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_680 = shortq_shift_xx[2] ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_681 = shortq_shift_xx[1] ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_682 = shortq_shift_xx[0] ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_683 = _T_679 | _T_680; // @[Mux.scala 27:72]
  wire [4:0] _T_684 = _T_683 | _T_681; // @[Mux.scala 27:72]
  wire [4:0] _GEN_15 = {{1'd0}, _T_682}; // @[Mux.scala 27:72]
  wire [4:0] _T_685 = _T_684 | _GEN_15; // @[Mux.scala 27:72]
  wire [5:0] shortq_shift_ff = {1'h0,_T_685}; // @[Cat.scala 29:58]
  reg [5:0] count; // @[Reg.scala 27:20]
  wire  _T_688 = count == 6'h20; // @[exu_div_ctl.scala 230:55]
  wire  _T_689 = count == 6'h21; // @[exu_div_ctl.scala 230:76]
  wire  _T_690 = _T_9 ? _T_688 : _T_689; // @[exu_div_ctl.scala 230:39]
  wire  finish = smallnum_case | _T_690; // @[exu_div_ctl.scala 230:34]
  reg  run_state; // @[Reg.scala 27:20]
  wire  _T_691 = io_valid_in | run_state; // @[exu_div_ctl.scala 231:32]
  wire  _T_692 = _T_691 | finish; // @[exu_div_ctl.scala 231:44]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  div_clken = _T_692 | finish_ff; // @[exu_div_ctl.scala 231:53]
  wire  _T_694 = ~finish; // @[exu_div_ctl.scala 232:48]
  wire  _T_695 = _T_691 & _T_694; // @[exu_div_ctl.scala 232:46]
  wire  run_in = _T_695 & _T; // @[exu_div_ctl.scala 232:56]
  wire  _T_698 = run_state & _T_694; // @[exu_div_ctl.scala 233:35]
  wire  _T_700 = _T_698 & _T; // @[exu_div_ctl.scala 233:45]
  wire  _T_701 = ~shortq_enable; // @[exu_div_ctl.scala 233:60]
  wire  _T_702 = _T_700 & _T_701; // @[exu_div_ctl.scala 233:58]
  wire [5:0] _T_704 = _T_702 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _T_706 = {1'h0,shortq_shift_ff[4:0]}; // @[Cat.scala 29:58]
  wire [5:0] _T_708 = count + _T_706; // @[exu_div_ctl.scala 233:86]
  wire [5:0] _T_710 = _T_708 + 6'h1; // @[exu_div_ctl.scala 233:118]
  wire [5:0] count_in = _T_704 & _T_710; // @[exu_div_ctl.scala 233:77]
  wire  _T_714 = io_divisor_in != 32'h0; // @[exu_div_ctl.scala 235:50]
  wire  sign_eff = io_signed_in & _T_714; // @[exu_div_ctl.scala 235:33]
  wire  _T_715 = ~run_state; // @[exu_div_ctl.scala 238:6]
  wire [32:0] _T_717 = {1'h0,io_dividend_in}; // @[Cat.scala 29:58]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  _T_718 = valid_ff_x | shortq_enable_ff; // @[exu_div_ctl.scala 239:30]
  wire  _T_719 = run_state & _T_718; // @[exu_div_ctl.scala 239:16]
  reg  dividend_neg_ff; // @[Reg.scala 27:20]
  wire  _T_743 = sign_ff & dividend_neg_ff; // @[exu_div_ctl.scala 243:32]
  wire  _T_928 = |q_ff[30:0]; // @[lib.scala 428:35]
  wire  _T_930 = ~q_ff[31]; // @[lib.scala 428:40]
  wire  _T_932 = _T_928 ? _T_930 : q_ff[31]; // @[lib.scala 428:23]
  wire  _T_922 = |q_ff[29:0]; // @[lib.scala 428:35]
  wire  _T_924 = ~q_ff[30]; // @[lib.scala 428:40]
  wire  _T_926 = _T_922 ? _T_924 : q_ff[30]; // @[lib.scala 428:23]
  wire  _T_916 = |q_ff[28:0]; // @[lib.scala 428:35]
  wire  _T_918 = ~q_ff[29]; // @[lib.scala 428:40]
  wire  _T_920 = _T_916 ? _T_918 : q_ff[29]; // @[lib.scala 428:23]
  wire  _T_910 = |q_ff[27:0]; // @[lib.scala 428:35]
  wire  _T_912 = ~q_ff[28]; // @[lib.scala 428:40]
  wire  _T_914 = _T_910 ? _T_912 : q_ff[28]; // @[lib.scala 428:23]
  wire  _T_904 = |q_ff[26:0]; // @[lib.scala 428:35]
  wire  _T_906 = ~q_ff[27]; // @[lib.scala 428:40]
  wire  _T_908 = _T_904 ? _T_906 : q_ff[27]; // @[lib.scala 428:23]
  wire  _T_898 = |q_ff[25:0]; // @[lib.scala 428:35]
  wire  _T_900 = ~q_ff[26]; // @[lib.scala 428:40]
  wire  _T_902 = _T_898 ? _T_900 : q_ff[26]; // @[lib.scala 428:23]
  wire  _T_892 = |q_ff[24:0]; // @[lib.scala 428:35]
  wire  _T_894 = ~q_ff[25]; // @[lib.scala 428:40]
  wire  _T_896 = _T_892 ? _T_894 : q_ff[25]; // @[lib.scala 428:23]
  wire  _T_886 = |q_ff[23:0]; // @[lib.scala 428:35]
  wire  _T_888 = ~q_ff[24]; // @[lib.scala 428:40]
  wire  _T_890 = _T_886 ? _T_888 : q_ff[24]; // @[lib.scala 428:23]
  wire  _T_880 = |q_ff[22:0]; // @[lib.scala 428:35]
  wire  _T_882 = ~q_ff[23]; // @[lib.scala 428:40]
  wire  _T_884 = _T_880 ? _T_882 : q_ff[23]; // @[lib.scala 428:23]
  wire  _T_874 = |q_ff[21:0]; // @[lib.scala 428:35]
  wire  _T_876 = ~q_ff[22]; // @[lib.scala 428:40]
  wire  _T_878 = _T_874 ? _T_876 : q_ff[22]; // @[lib.scala 428:23]
  wire  _T_868 = |q_ff[20:0]; // @[lib.scala 428:35]
  wire  _T_870 = ~q_ff[21]; // @[lib.scala 428:40]
  wire  _T_872 = _T_868 ? _T_870 : q_ff[21]; // @[lib.scala 428:23]
  wire  _T_862 = |q_ff[19:0]; // @[lib.scala 428:35]
  wire  _T_864 = ~q_ff[20]; // @[lib.scala 428:40]
  wire  _T_866 = _T_862 ? _T_864 : q_ff[20]; // @[lib.scala 428:23]
  wire  _T_856 = |q_ff[18:0]; // @[lib.scala 428:35]
  wire  _T_858 = ~q_ff[19]; // @[lib.scala 428:40]
  wire  _T_860 = _T_856 ? _T_858 : q_ff[19]; // @[lib.scala 428:23]
  wire  _T_850 = |q_ff[17:0]; // @[lib.scala 428:35]
  wire  _T_852 = ~q_ff[18]; // @[lib.scala 428:40]
  wire  _T_854 = _T_850 ? _T_852 : q_ff[18]; // @[lib.scala 428:23]
  wire  _T_844 = |q_ff[16:0]; // @[lib.scala 428:35]
  wire  _T_846 = ~q_ff[17]; // @[lib.scala 428:40]
  wire  _T_848 = _T_844 ? _T_846 : q_ff[17]; // @[lib.scala 428:23]
  wire  _T_838 = |q_ff[15:0]; // @[lib.scala 428:35]
  wire  _T_840 = ~q_ff[16]; // @[lib.scala 428:40]
  wire  _T_842 = _T_838 ? _T_840 : q_ff[16]; // @[lib.scala 428:23]
  wire [7:0] _T_953 = {_T_884,_T_878,_T_872,_T_866,_T_860,_T_854,_T_848,_T_842}; // @[lib.scala 430:14]
  wire  _T_832 = |q_ff[14:0]; // @[lib.scala 428:35]
  wire  _T_834 = ~q_ff[15]; // @[lib.scala 428:40]
  wire  _T_836 = _T_832 ? _T_834 : q_ff[15]; // @[lib.scala 428:23]
  wire  _T_826 = |q_ff[13:0]; // @[lib.scala 428:35]
  wire  _T_828 = ~q_ff[14]; // @[lib.scala 428:40]
  wire  _T_830 = _T_826 ? _T_828 : q_ff[14]; // @[lib.scala 428:23]
  wire  _T_820 = |q_ff[12:0]; // @[lib.scala 428:35]
  wire  _T_822 = ~q_ff[13]; // @[lib.scala 428:40]
  wire  _T_824 = _T_820 ? _T_822 : q_ff[13]; // @[lib.scala 428:23]
  wire  _T_814 = |q_ff[11:0]; // @[lib.scala 428:35]
  wire  _T_816 = ~q_ff[12]; // @[lib.scala 428:40]
  wire  _T_818 = _T_814 ? _T_816 : q_ff[12]; // @[lib.scala 428:23]
  wire  _T_808 = |q_ff[10:0]; // @[lib.scala 428:35]
  wire  _T_810 = ~q_ff[11]; // @[lib.scala 428:40]
  wire  _T_812 = _T_808 ? _T_810 : q_ff[11]; // @[lib.scala 428:23]
  wire  _T_802 = |q_ff[9:0]; // @[lib.scala 428:35]
  wire  _T_804 = ~q_ff[10]; // @[lib.scala 428:40]
  wire  _T_806 = _T_802 ? _T_804 : q_ff[10]; // @[lib.scala 428:23]
  wire  _T_796 = |q_ff[8:0]; // @[lib.scala 428:35]
  wire  _T_798 = ~q_ff[9]; // @[lib.scala 428:40]
  wire  _T_800 = _T_796 ? _T_798 : q_ff[9]; // @[lib.scala 428:23]
  wire  _T_790 = |q_ff[7:0]; // @[lib.scala 428:35]
  wire  _T_792 = ~q_ff[8]; // @[lib.scala 428:40]
  wire  _T_794 = _T_790 ? _T_792 : q_ff[8]; // @[lib.scala 428:23]
  wire  _T_784 = |q_ff[6:0]; // @[lib.scala 428:35]
  wire  _T_786 = ~q_ff[7]; // @[lib.scala 428:40]
  wire  _T_788 = _T_784 ? _T_786 : q_ff[7]; // @[lib.scala 428:23]
  wire  _T_778 = |q_ff[5:0]; // @[lib.scala 428:35]
  wire  _T_780 = ~q_ff[6]; // @[lib.scala 428:40]
  wire  _T_782 = _T_778 ? _T_780 : q_ff[6]; // @[lib.scala 428:23]
  wire  _T_772 = |q_ff[4:0]; // @[lib.scala 428:35]
  wire  _T_774 = ~q_ff[5]; // @[lib.scala 428:40]
  wire  _T_776 = _T_772 ? _T_774 : q_ff[5]; // @[lib.scala 428:23]
  wire  _T_766 = |q_ff[3:0]; // @[lib.scala 428:35]
  wire  _T_768 = ~q_ff[4]; // @[lib.scala 428:40]
  wire  _T_770 = _T_766 ? _T_768 : q_ff[4]; // @[lib.scala 428:23]
  wire  _T_760 = |q_ff[2:0]; // @[lib.scala 428:35]
  wire  _T_762 = ~q_ff[3]; // @[lib.scala 428:40]
  wire  _T_764 = _T_760 ? _T_762 : q_ff[3]; // @[lib.scala 428:23]
  wire  _T_754 = |q_ff[1:0]; // @[lib.scala 428:35]
  wire  _T_756 = ~q_ff[2]; // @[lib.scala 428:40]
  wire  _T_758 = _T_754 ? _T_756 : q_ff[2]; // @[lib.scala 428:23]
  wire  _T_748 = |q_ff[0]; // @[lib.scala 428:35]
  wire  _T_750 = ~q_ff[1]; // @[lib.scala 428:40]
  wire  _T_752 = _T_748 ? _T_750 : q_ff[1]; // @[lib.scala 428:23]
  wire [6:0] _T_938 = {_T_788,_T_782,_T_776,_T_770,_T_764,_T_758,_T_752}; // @[lib.scala 430:14]
  wire [14:0] _T_946 = {_T_836,_T_830,_T_824,_T_818,_T_812,_T_806,_T_800,_T_794,_T_938}; // @[lib.scala 430:14]
  wire [30:0] _T_962 = {_T_932,_T_926,_T_920,_T_914,_T_908,_T_902,_T_896,_T_890,_T_953,_T_946}; // @[lib.scala 430:14]
  wire [31:0] _T_964 = {_T_962,q_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] dividend_eff = _T_743 ? _T_964 : q_ff[31:0]; // @[exu_div_ctl.scala 243:22]
  wire [32:0] _T_1000 = run_state ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _T_1012 = _T_689 & rem_ff; // @[exu_div_ctl.scala 257:41]
  reg [32:0] a_ff; // @[Reg.scala 27:20]
  wire  rem_correct = _T_1012 & a_ff[32]; // @[exu_div_ctl.scala 257:50]
  wire [32:0] _T_985 = rem_correct ? a_ff : 33'h0; // @[Mux.scala 27:72]
  wire  _T_974 = ~rem_correct; // @[exu_div_ctl.scala 248:6]
  wire  _T_975 = ~shortq_enable_ff; // @[exu_div_ctl.scala 248:21]
  wire  _T_976 = _T_974 & _T_975; // @[exu_div_ctl.scala 248:19]
  wire [32:0] _T_980 = {a_ff[31:0],q_ff[32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_986 = _T_976 ? _T_980 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_988 = _T_985 | _T_986; // @[Mux.scala 27:72]
  wire  _T_982 = _T_974 & shortq_enable_ff; // @[exu_div_ctl.scala 249:19]
  wire [64:0] _T_970 = {33'h0,dividend_eff}; // @[Cat.scala 29:58]
  wire [95:0] _GEN_16 = {{31'd0}, _T_970}; // @[exu_div_ctl.scala 245:47]
  wire [95:0] _T_972 = _GEN_16 << shortq_shift_ff[4:0]; // @[exu_div_ctl.scala 245:47]
  wire [64:0] a_eff_shift = _T_972[64:0]; // @[exu_div_ctl.scala 245:15]
  wire [32:0] _T_987 = _T_982 ? a_eff_shift[64:32] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] a_eff = _T_988 | _T_987; // @[Mux.scala 27:72]
  wire [32:0] a_shift = _T_1000 & a_eff; // @[exu_div_ctl.scala 252:33]
  wire  _T_1009 = a_ff[32] | rem_correct; // @[exu_div_ctl.scala 256:21]
  reg  divisor_neg_ff; // @[Reg.scala 27:20]
  wire  m_already_comp = divisor_neg_ff & sign_ff; // @[exu_div_ctl.scala 254:48]
  wire  add = _T_1009 ^ m_already_comp; // @[exu_div_ctl.scala 256:36]
  wire [32:0] _T_968 = ~m_ff; // @[exu_div_ctl.scala 244:35]
  wire [32:0] m_eff = add ? m_ff : _T_968; // @[exu_div_ctl.scala 244:15]
  wire [32:0] _T_1002 = a_shift + m_eff; // @[exu_div_ctl.scala 253:41]
  wire  _T_1003 = ~add; // @[exu_div_ctl.scala 253:65]
  wire [32:0] _T_1004 = {32'h0,_T_1003}; // @[Cat.scala 29:58]
  wire [32:0] _T_1006 = _T_1002 + _T_1004; // @[exu_div_ctl.scala 253:49]
  wire [32:0] a_in = _T_1000 & _T_1006; // @[exu_div_ctl.scala 253:30]
  wire  _T_723 = ~a_in[32]; // @[exu_div_ctl.scala 239:85]
  wire [32:0] _T_724 = {dividend_eff,_T_723}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_17 = {{31'd0}, _T_724}; // @[exu_div_ctl.scala 239:96]
  wire [63:0] _T_726 = _GEN_17 << shortq_shift_ff[4:0]; // @[exu_div_ctl.scala 239:96]
  wire  _T_728 = ~_T_718; // @[exu_div_ctl.scala 240:18]
  wire  _T_729 = run_state & _T_728; // @[exu_div_ctl.scala 240:16]
  wire [32:0] _T_734 = {q_ff[31:0],_T_723}; // @[Cat.scala 29:58]
  wire [32:0] _T_735 = _T_715 ? _T_717 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_736 = _T_719 ? _T_726 : 64'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_737 = _T_729 ? _T_734 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _GEN_18 = {{31'd0}, _T_735}; // @[Mux.scala 27:72]
  wire [63:0] _T_738 = _GEN_18 | _T_736; // @[Mux.scala 27:72]
  wire [63:0] _GEN_19 = {{31'd0}, _T_737}; // @[Mux.scala 27:72]
  wire [63:0] _T_739 = _T_738 | _GEN_19; // @[Mux.scala 27:72]
  wire  _T_742 = run_state & _T_701; // @[exu_div_ctl.scala 242:48]
  wire  qff_enable = io_valid_in | _T_742; // @[exu_div_ctl.scala 242:35]
  wire  _T_993 = count != 6'h21; // @[exu_div_ctl.scala 251:73]
  wire  _T_994 = _T_742 & _T_993; // @[exu_div_ctl.scala 251:64]
  wire  _T_995 = io_valid_in | _T_994; // @[exu_div_ctl.scala 251:34]
  wire  aff_enable = _T_995 | rem_correct; // @[exu_div_ctl.scala 251:89]
  wire  _T_1015 = dividend_neg_ff ^ divisor_neg_ff; // @[exu_div_ctl.scala 258:50]
  wire  _T_1016 = sign_ff & _T_1015; // @[exu_div_ctl.scala 258:31]
  wire [31:0] q_ff_eff = _T_1016 ? _T_964 : q_ff[31:0]; // @[exu_div_ctl.scala 258:21]
  wire  _T_1244 = |a_ff[0]; // @[lib.scala 428:35]
  wire  _T_1246 = ~a_ff[1]; // @[lib.scala 428:40]
  wire  _T_1248 = _T_1244 ? _T_1246 : a_ff[1]; // @[lib.scala 428:23]
  wire  _T_1250 = |a_ff[1:0]; // @[lib.scala 428:35]
  wire  _T_1252 = ~a_ff[2]; // @[lib.scala 428:40]
  wire  _T_1254 = _T_1250 ? _T_1252 : a_ff[2]; // @[lib.scala 428:23]
  wire  _T_1256 = |a_ff[2:0]; // @[lib.scala 428:35]
  wire  _T_1258 = ~a_ff[3]; // @[lib.scala 428:40]
  wire  _T_1260 = _T_1256 ? _T_1258 : a_ff[3]; // @[lib.scala 428:23]
  wire  _T_1262 = |a_ff[3:0]; // @[lib.scala 428:35]
  wire  _T_1264 = ~a_ff[4]; // @[lib.scala 428:40]
  wire  _T_1266 = _T_1262 ? _T_1264 : a_ff[4]; // @[lib.scala 428:23]
  wire  _T_1268 = |a_ff[4:0]; // @[lib.scala 428:35]
  wire  _T_1270 = ~a_ff[5]; // @[lib.scala 428:40]
  wire  _T_1272 = _T_1268 ? _T_1270 : a_ff[5]; // @[lib.scala 428:23]
  wire  _T_1274 = |a_ff[5:0]; // @[lib.scala 428:35]
  wire  _T_1276 = ~a_ff[6]; // @[lib.scala 428:40]
  wire  _T_1278 = _T_1274 ? _T_1276 : a_ff[6]; // @[lib.scala 428:23]
  wire  _T_1280 = |a_ff[6:0]; // @[lib.scala 428:35]
  wire  _T_1282 = ~a_ff[7]; // @[lib.scala 428:40]
  wire  _T_1284 = _T_1280 ? _T_1282 : a_ff[7]; // @[lib.scala 428:23]
  wire  _T_1286 = |a_ff[7:0]; // @[lib.scala 428:35]
  wire  _T_1288 = ~a_ff[8]; // @[lib.scala 428:40]
  wire  _T_1290 = _T_1286 ? _T_1288 : a_ff[8]; // @[lib.scala 428:23]
  wire  _T_1292 = |a_ff[8:0]; // @[lib.scala 428:35]
  wire  _T_1294 = ~a_ff[9]; // @[lib.scala 428:40]
  wire  _T_1296 = _T_1292 ? _T_1294 : a_ff[9]; // @[lib.scala 428:23]
  wire  _T_1298 = |a_ff[9:0]; // @[lib.scala 428:35]
  wire  _T_1300 = ~a_ff[10]; // @[lib.scala 428:40]
  wire  _T_1302 = _T_1298 ? _T_1300 : a_ff[10]; // @[lib.scala 428:23]
  wire  _T_1304 = |a_ff[10:0]; // @[lib.scala 428:35]
  wire  _T_1306 = ~a_ff[11]; // @[lib.scala 428:40]
  wire  _T_1308 = _T_1304 ? _T_1306 : a_ff[11]; // @[lib.scala 428:23]
  wire  _T_1310 = |a_ff[11:0]; // @[lib.scala 428:35]
  wire  _T_1312 = ~a_ff[12]; // @[lib.scala 428:40]
  wire  _T_1314 = _T_1310 ? _T_1312 : a_ff[12]; // @[lib.scala 428:23]
  wire  _T_1316 = |a_ff[12:0]; // @[lib.scala 428:35]
  wire  _T_1318 = ~a_ff[13]; // @[lib.scala 428:40]
  wire  _T_1320 = _T_1316 ? _T_1318 : a_ff[13]; // @[lib.scala 428:23]
  wire  _T_1322 = |a_ff[13:0]; // @[lib.scala 428:35]
  wire  _T_1324 = ~a_ff[14]; // @[lib.scala 428:40]
  wire  _T_1326 = _T_1322 ? _T_1324 : a_ff[14]; // @[lib.scala 428:23]
  wire  _T_1328 = |a_ff[14:0]; // @[lib.scala 428:35]
  wire  _T_1330 = ~a_ff[15]; // @[lib.scala 428:40]
  wire  _T_1332 = _T_1328 ? _T_1330 : a_ff[15]; // @[lib.scala 428:23]
  wire  _T_1334 = |a_ff[15:0]; // @[lib.scala 428:35]
  wire  _T_1336 = ~a_ff[16]; // @[lib.scala 428:40]
  wire  _T_1338 = _T_1334 ? _T_1336 : a_ff[16]; // @[lib.scala 428:23]
  wire  _T_1340 = |a_ff[16:0]; // @[lib.scala 428:35]
  wire  _T_1342 = ~a_ff[17]; // @[lib.scala 428:40]
  wire  _T_1344 = _T_1340 ? _T_1342 : a_ff[17]; // @[lib.scala 428:23]
  wire  _T_1346 = |a_ff[17:0]; // @[lib.scala 428:35]
  wire  _T_1348 = ~a_ff[18]; // @[lib.scala 428:40]
  wire  _T_1350 = _T_1346 ? _T_1348 : a_ff[18]; // @[lib.scala 428:23]
  wire  _T_1352 = |a_ff[18:0]; // @[lib.scala 428:35]
  wire  _T_1354 = ~a_ff[19]; // @[lib.scala 428:40]
  wire  _T_1356 = _T_1352 ? _T_1354 : a_ff[19]; // @[lib.scala 428:23]
  wire  _T_1358 = |a_ff[19:0]; // @[lib.scala 428:35]
  wire  _T_1360 = ~a_ff[20]; // @[lib.scala 428:40]
  wire  _T_1362 = _T_1358 ? _T_1360 : a_ff[20]; // @[lib.scala 428:23]
  wire  _T_1364 = |a_ff[20:0]; // @[lib.scala 428:35]
  wire  _T_1366 = ~a_ff[21]; // @[lib.scala 428:40]
  wire  _T_1368 = _T_1364 ? _T_1366 : a_ff[21]; // @[lib.scala 428:23]
  wire  _T_1370 = |a_ff[21:0]; // @[lib.scala 428:35]
  wire  _T_1372 = ~a_ff[22]; // @[lib.scala 428:40]
  wire  _T_1374 = _T_1370 ? _T_1372 : a_ff[22]; // @[lib.scala 428:23]
  wire  _T_1376 = |a_ff[22:0]; // @[lib.scala 428:35]
  wire  _T_1378 = ~a_ff[23]; // @[lib.scala 428:40]
  wire  _T_1380 = _T_1376 ? _T_1378 : a_ff[23]; // @[lib.scala 428:23]
  wire  _T_1382 = |a_ff[23:0]; // @[lib.scala 428:35]
  wire  _T_1384 = ~a_ff[24]; // @[lib.scala 428:40]
  wire  _T_1386 = _T_1382 ? _T_1384 : a_ff[24]; // @[lib.scala 428:23]
  wire  _T_1388 = |a_ff[24:0]; // @[lib.scala 428:35]
  wire  _T_1390 = ~a_ff[25]; // @[lib.scala 428:40]
  wire  _T_1392 = _T_1388 ? _T_1390 : a_ff[25]; // @[lib.scala 428:23]
  wire  _T_1394 = |a_ff[25:0]; // @[lib.scala 428:35]
  wire  _T_1396 = ~a_ff[26]; // @[lib.scala 428:40]
  wire  _T_1398 = _T_1394 ? _T_1396 : a_ff[26]; // @[lib.scala 428:23]
  wire  _T_1400 = |a_ff[26:0]; // @[lib.scala 428:35]
  wire  _T_1402 = ~a_ff[27]; // @[lib.scala 428:40]
  wire  _T_1404 = _T_1400 ? _T_1402 : a_ff[27]; // @[lib.scala 428:23]
  wire  _T_1406 = |a_ff[27:0]; // @[lib.scala 428:35]
  wire  _T_1408 = ~a_ff[28]; // @[lib.scala 428:40]
  wire  _T_1410 = _T_1406 ? _T_1408 : a_ff[28]; // @[lib.scala 428:23]
  wire  _T_1412 = |a_ff[28:0]; // @[lib.scala 428:35]
  wire  _T_1414 = ~a_ff[29]; // @[lib.scala 428:40]
  wire  _T_1416 = _T_1412 ? _T_1414 : a_ff[29]; // @[lib.scala 428:23]
  wire  _T_1418 = |a_ff[29:0]; // @[lib.scala 428:35]
  wire  _T_1420 = ~a_ff[30]; // @[lib.scala 428:40]
  wire  _T_1422 = _T_1418 ? _T_1420 : a_ff[30]; // @[lib.scala 428:23]
  wire  _T_1424 = |a_ff[30:0]; // @[lib.scala 428:35]
  wire  _T_1426 = ~a_ff[31]; // @[lib.scala 428:40]
  wire  _T_1428 = _T_1424 ? _T_1426 : a_ff[31]; // @[lib.scala 428:23]
  wire [6:0] _T_1434 = {_T_1284,_T_1278,_T_1272,_T_1266,_T_1260,_T_1254,_T_1248}; // @[lib.scala 430:14]
  wire [14:0] _T_1442 = {_T_1332,_T_1326,_T_1320,_T_1314,_T_1308,_T_1302,_T_1296,_T_1290,_T_1434}; // @[lib.scala 430:14]
  wire [7:0] _T_1449 = {_T_1380,_T_1374,_T_1368,_T_1362,_T_1356,_T_1350,_T_1344,_T_1338}; // @[lib.scala 430:14]
  wire [30:0] _T_1458 = {_T_1428,_T_1422,_T_1416,_T_1410,_T_1404,_T_1398,_T_1392,_T_1386,_T_1449,_T_1442}; // @[lib.scala 430:14]
  wire [31:0] _T_1460 = {_T_1458,a_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] a_ff_eff = _T_743 ? _T_1460 : a_ff[31:0]; // @[exu_div_ctl.scala 259:21]
  reg  smallnum_case_ff; // @[Reg.scala 27:20]
  reg [3:0] smallnum_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_1463 = {28'h0,smallnum_ff}; // @[Cat.scala 29:58]
  wire  _T_1465 = ~smallnum_case_ff; // @[exu_div_ctl.scala 264:6]
  wire  _T_1467 = _T_1465 & _T_9; // @[exu_div_ctl.scala 264:24]
  wire [31:0] _T_1469 = smallnum_case_ff ? _T_1463 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1470 = rem_ff ? a_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1471 = _T_1467 ? q_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1472 = _T_1469 | _T_1470; // @[Mux.scala 27:72]
  wire  _T_1476 = io_valid_in & _T; // @[exu_div_ctl.scala 266:38]
  wire  _T_1480 = finish & _T; // @[exu_div_ctl.scala 267:32]
  wire  _T_1488 = io_valid_in & io_dividend_in[31]; // @[exu_div_ctl.scala 270:44]
  wire  _T_1489 = ~io_valid_in; // @[exu_div_ctl.scala 270:69]
  wire  _T_1490 = _T_1489 & dividend_neg_ff; // @[exu_div_ctl.scala 270:82]
  wire  _T_1491 = _T_1488 | _T_1490; // @[exu_div_ctl.scala 270:66]
  wire  _T_1495 = io_valid_in & io_divisor_in[31]; // @[exu_div_ctl.scala 271:43]
  wire  _T_1497 = _T_1489 & divisor_neg_ff; // @[exu_div_ctl.scala 271:80]
  wire  _T_1498 = _T_1495 | _T_1497; // @[exu_div_ctl.scala 271:64]
  wire  _T_1501 = io_valid_in & sign_eff; // @[exu_div_ctl.scala 272:36]
  wire  _T_1503 = _T_1489 & sign_ff; // @[exu_div_ctl.scala 272:64]
  wire  _T_1504 = _T_1501 | _T_1503; // @[exu_div_ctl.scala 272:48]
  wire  _T_1507 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 273:35]
  wire  _T_1509 = _T_1489 & rem_ff; // @[exu_div_ctl.scala 273:64]
  wire  _T_1510 = _T_1507 | _T_1509; // @[exu_div_ctl.scala 273:48]
  wire [32:0] q_in = _T_739[32:0]; // @[exu_div_ctl.scala 237:8]
  wire  _T_1526 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 281:35]
  wire [32:0] _T_1528 = {_T_1526,io_divisor_in}; // @[Cat.scala 29:58]
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
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  rvclkhdr rvclkhdr_12 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en)
  );
  rvclkhdr rvclkhdr_13 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en)
  );
  rvclkhdr rvclkhdr_14 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en)
  );
  assign io_data_out = _T_1472 | _T_1471; // @[exu_div_ctl.scala 261:15]
  assign io_valid_out = finish_ff & _T; // @[exu_div_ctl.scala 234:17]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_1_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_2_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_3_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_4_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_5_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_6_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_7_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_8_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_9_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_10_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_11_io_en = _T_692 | finish_ff; // @[lib.scala 393:17]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_12_io_en = io_valid_in | _T_742; // @[lib.scala 393:17]
  assign rvclkhdr_13_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_13_io_en = _T_995 | rem_correct; // @[lib.scala 393:17]
  assign rvclkhdr_14_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_14_io_en = io_valid_in; // @[lib.scala 393:17]
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
  valid_ff_x = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  q_ff = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  m_ff = _RAND_2[32:0];
  _RAND_3 = {1{`RANDOM}};
  rem_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  sign_ff = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1520 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  count = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  run_state = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  finish_ff = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  shortq_enable_ff = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  dividend_neg_ff = _RAND_10[0:0];
  _RAND_11 = {2{`RANDOM}};
  a_ff = _RAND_11[32:0];
  _RAND_12 = {1{`RANDOM}};
  divisor_neg_ff = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  smallnum_case_ff = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  smallnum_ff = _RAND_14[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    valid_ff_x = 1'h0;
  end
  if (reset) begin
    q_ff = 33'h0;
  end
  if (reset) begin
    m_ff = 33'h0;
  end
  if (reset) begin
    rem_ff = 1'h0;
  end
  if (reset) begin
    sign_ff = 1'h0;
  end
  if (reset) begin
    _T_1520 = 6'h0;
  end
  if (reset) begin
    count = 6'h0;
  end
  if (reset) begin
    run_state = 1'h0;
  end
  if (reset) begin
    finish_ff = 1'h0;
  end
  if (reset) begin
    shortq_enable_ff = 1'h0;
  end
  if (reset) begin
    dividend_neg_ff = 1'h0;
  end
  if (reset) begin
    a_ff = 33'h0;
  end
  if (reset) begin
    divisor_neg_ff = 1'h0;
  end
  if (reset) begin
    smallnum_case_ff = 1'h0;
  end
  if (reset) begin
    smallnum_ff = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_ff_x <= 1'h0;
    end else if (div_clken) begin
      valid_ff_x <= _T_1476;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      q_ff <= 33'h0;
    end else if (qff_enable) begin
      q_ff <= q_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      m_ff <= 33'h0;
    end else if (io_valid_in) begin
      m_ff <= _T_1528;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rem_ff <= 1'h0;
    end else if (div_clken) begin
      rem_ff <= _T_1510;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      sign_ff <= 1'h0;
    end else if (div_clken) begin
      sign_ff <= _T_1504;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_1520 <= 6'h0;
    end else if (div_clken) begin
      _T_1520 <= shortq_shift;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      count <= 6'h0;
    end else if (div_clken) begin
      count <= count_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      run_state <= 1'h0;
    end else if (div_clken) begin
      run_state <= run_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      finish_ff <= 1'h0;
    end else if (div_clken) begin
      finish_ff <= _T_1480;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      shortq_enable_ff <= 1'h0;
    end else if (div_clken) begin
      shortq_enable_ff <= shortq_enable;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dividend_neg_ff <= 1'h0;
    end else if (div_clken) begin
      dividend_neg_ff <= _T_1491;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      a_ff <= 33'h0;
    end else if (aff_enable) begin
      a_ff <= a_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      divisor_neg_ff <= 1'h0;
    end else if (div_clken) begin
      divisor_neg_ff <= _T_1498;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      smallnum_case_ff <= 1'h0;
    end else if (div_clken) begin
      smallnum_case_ff <= smallnum_case;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      smallnum_ff <= 4'h0;
    end else if (div_clken) begin
      smallnum_ff <= smallnum;
    end
  end
endmodule
