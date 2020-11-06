module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 332:24]
  wire  clkhdr_CK; // @[beh_lib.scala 332:24]
  wire  clkhdr_EN; // @[beh_lib.scala 332:24]
  wire  clkhdr_SE; // @[beh_lib.scala 332:24]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 332:24]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 333:12]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 334:16]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 335:16]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 336:16]
endmodule
module el2_exu_div_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dp_valid,
  input         io_dp_unsign,
  input         io_dp_rem,
  input  [31:0] io_dividend,
  input  [31:0] io_divisor,
  input         io_cancel,
  output [31:0] io_out,
  output        io_finish_dly
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
  wire  rvclkhdr_io_l1clk; // @[beh_lib.scala 341:20]
  wire  rvclkhdr_io_clk; // @[beh_lib.scala 341:20]
  wire  rvclkhdr_io_en; // @[beh_lib.scala 341:20]
  wire  rvclkhdr_io_scan_mode; // @[beh_lib.scala 341:20]
  wire  rvclkhdr_1_io_l1clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_1_io_clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_1_io_en; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_1_io_scan_mode; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_2_io_l1clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_2_io_clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_2_io_en; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_2_io_scan_mode; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_3_io_l1clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_3_io_clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_3_io_en; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_3_io_scan_mode; // @[beh_lib.scala 352:21]
  wire  _T = ~io_cancel; // @[el2_exu_div_ctl.scala 57:30]
  reg  valid_ff_x; // @[el2_exu_div_ctl.scala 210:26]
  wire  valid_x = valid_ff_x & _T; // @[el2_exu_div_ctl.scala 57:28]
  reg [32:0] q_ff; // @[beh_lib.scala 358:14]
  wire  _T_2 = q_ff[31:4] == 28'h0; // @[el2_exu_div_ctl.scala 63:34]
  reg [32:0] m_ff; // @[beh_lib.scala 358:14]
  wire  _T_4 = m_ff[31:4] == 28'h0; // @[el2_exu_div_ctl.scala 63:57]
  wire  _T_5 = _T_2 & _T_4; // @[el2_exu_div_ctl.scala 63:43]
  wire  _T_7 = m_ff[31:0] != 32'h0; // @[el2_exu_div_ctl.scala 63:80]
  wire  _T_8 = _T_5 & _T_7; // @[el2_exu_div_ctl.scala 63:66]
  reg  rem_ff; // @[Reg.scala 27:20]
  wire  _T_9 = ~rem_ff; // @[el2_exu_div_ctl.scala 63:91]
  wire  _T_10 = _T_8 & _T_9; // @[el2_exu_div_ctl.scala 63:89]
  wire  _T_11 = _T_10 & valid_x; // @[el2_exu_div_ctl.scala 63:99]
  wire  _T_13 = q_ff[31:0] == 32'h0; // @[el2_exu_div_ctl.scala 64:18]
  wire  _T_16 = _T_13 & _T_7; // @[el2_exu_div_ctl.scala 64:27]
  wire  _T_18 = _T_16 & _T_9; // @[el2_exu_div_ctl.scala 64:50]
  wire  _T_19 = _T_18 & valid_x; // @[el2_exu_div_ctl.scala 64:60]
  wire  smallnum_case = _T_11 | _T_19; // @[el2_exu_div_ctl.scala 63:110]
  wire  pat1 = q_ff[3]; // @[el2_exu_div_ctl.scala 67:57]
  wire  _T_22 = ~m_ff[3]; // @[el2_exu_div_ctl.scala 68:69]
  wire  _T_24 = ~m_ff[2]; // @[el2_exu_div_ctl.scala 68:69]
  wire  _T_26 = ~m_ff[1]; // @[el2_exu_div_ctl.scala 68:69]
  wire  _T_27 = _T_22 & _T_24; // @[el2_exu_div_ctl.scala 68:94]
  wire  pat2 = _T_27 & _T_26; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_28 = pat1 & pat2; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_33 = pat1 & _T_27; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_35 = ~m_ff[0]; // @[el2_exu_div_ctl.scala 75:32]
  wire  _T_36 = _T_33 & _T_35; // @[el2_exu_div_ctl.scala 75:30]
  wire  pat1_2 = q_ff[2]; // @[el2_exu_div_ctl.scala 67:57]
  wire  _T_44 = pat1_2 & pat2; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_45 = _T_36 | _T_44; // @[el2_exu_div_ctl.scala 75:41]
  wire  pat1_3 = pat1 & pat1_2; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_52 = pat1_3 & _T_27; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_53 = _T_45 | _T_52; // @[el2_exu_div_ctl.scala 75:73]
  wire  _T_58 = pat1_2 & _T_27; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_61 = _T_58 & _T_35; // @[el2_exu_div_ctl.scala 77:30]
  wire  pat1_5 = q_ff[1]; // @[el2_exu_div_ctl.scala 67:57]
  wire  _T_69 = pat1_5 & pat2; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_70 = _T_61 | _T_69; // @[el2_exu_div_ctl.scala 77:41]
  wire  pat2_6 = _T_22 & _T_26; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_75 = pat1 & pat2_6; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_78 = _T_75 & _T_35; // @[el2_exu_div_ctl.scala 77:103]
  wire  _T_79 = _T_70 | _T_78; // @[el2_exu_div_ctl.scala 77:76]
  wire  _T_82 = ~pat1_2; // @[el2_exu_div_ctl.scala 67:69]
  wire  pat1_7 = pat1 & _T_82; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_90 = _T_27 & m_ff[1]; // @[el2_exu_div_ctl.scala 68:94]
  wire  pat2_7 = _T_90 & m_ff[0]; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_91 = pat1_7 & pat2_7; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_92 = _T_79 | _T_91; // @[el2_exu_div_ctl.scala 77:114]
  wire  _T_94 = ~pat1; // @[el2_exu_div_ctl.scala 67:69]
  wire  _T_97 = _T_94 & pat1_2; // @[el2_exu_div_ctl.scala 67:94]
  wire  pat1_8 = _T_97 & pat1_5; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_102 = pat1_8 & _T_27; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_103 = _T_92 | _T_102; // @[el2_exu_div_ctl.scala 78:43]
  wire  _T_107 = pat1_3 & _T_22; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_110 = _T_107 & _T_35; // @[el2_exu_div_ctl.scala 78:104]
  wire  _T_111 = _T_103 | _T_110; // @[el2_exu_div_ctl.scala 78:78]
  wire  _T_119 = _T_22 & m_ff[2]; // @[el2_exu_div_ctl.scala 68:94]
  wire  pat2_10 = _T_119 & _T_26; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_120 = pat1_3 & pat2_10; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_121 = _T_111 | _T_120; // @[el2_exu_div_ctl.scala 78:116]
  wire  pat1_11 = pat1 & pat1_5; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_128 = pat1_11 & pat2_6; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_129 = _T_121 | _T_128; // @[el2_exu_div_ctl.scala 79:43]
  wire  pat1_12 = pat1_3 & pat1_5; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_137 = pat1_12 & _T_119; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_138 = _T_129 | _T_137; // @[el2_exu_div_ctl.scala 79:77]
  wire  _T_142 = pat1_2 & pat1_5; // @[el2_exu_div_ctl.scala 67:94]
  wire  pat1_13 = _T_142 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_147 = pat1_13 & pat2_6; // @[el2_exu_div_ctl.scala 69:10]
  wire  pat1_14 = pat1_7 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_157 = _T_22 & m_ff[1]; // @[el2_exu_div_ctl.scala 68:94]
  wire  pat2_14 = _T_157 & m_ff[0]; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_158 = pat1_14 & pat2_14; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_159 = _T_147 | _T_158; // @[el2_exu_div_ctl.scala 81:44]
  wire  _T_164 = pat1_2 & pat2_6; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_167 = _T_164 & _T_35; // @[el2_exu_div_ctl.scala 81:111]
  wire  _T_168 = _T_159 | _T_167; // @[el2_exu_div_ctl.scala 81:84]
  wire  _T_173 = pat1_5 & _T_27; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_176 = _T_173 & _T_35; // @[el2_exu_div_ctl.scala 82:32]
  wire  _T_177 = _T_168 | _T_176; // @[el2_exu_div_ctl.scala 81:126]
  wire  _T_185 = q_ff[0] & pat2; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_186 = _T_177 | _T_185; // @[el2_exu_div_ctl.scala 82:46]
  wire  _T_191 = ~pat1_5; // @[el2_exu_div_ctl.scala 67:69]
  wire  pat1_18 = _T_97 & _T_191; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_201 = pat1_18 & pat2_7; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_202 = _T_186 | _T_201; // @[el2_exu_div_ctl.scala 82:86]
  wire  _T_209 = pat1_8 & _T_22; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_212 = _T_209 & _T_35; // @[el2_exu_div_ctl.scala 83:35]
  wire  _T_213 = _T_202 | _T_212; // @[el2_exu_div_ctl.scala 82:128]
  wire  pat2_20 = _T_24 & _T_26; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_218 = pat1 & pat2_20; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_221 = _T_218 & _T_35; // @[el2_exu_div_ctl.scala 83:74]
  wire  _T_222 = _T_213 | _T_221; // @[el2_exu_div_ctl.scala 83:46]
  wire  pat2_21 = _T_119 & m_ff[1]; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_231 = pat1_7 & pat2_21; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_232 = _T_222 | _T_231; // @[el2_exu_div_ctl.scala 83:86]
  wire  _T_244 = pat1_8 & pat2_10; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_245 = _T_232 | _T_244; // @[el2_exu_div_ctl.scala 83:128]
  wire  pat1_23 = _T_97 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_255 = pat1_23 & pat2_6; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_256 = _T_245 | _T_255; // @[el2_exu_div_ctl.scala 84:46]
  wire  pat1_24 = pat1_7 & _T_191; // @[el2_exu_div_ctl.scala 67:94]
  wire  pat2_24 = _T_119 & m_ff[0]; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_268 = pat1_24 & pat2_24; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_269 = _T_256 | _T_268; // @[el2_exu_div_ctl.scala 84:86]
  wire  _T_274 = _T_82 & pat1_5; // @[el2_exu_div_ctl.scala 67:94]
  wire  pat1_25 = _T_274 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_279 = pat1_25 & _T_27; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_280 = _T_269 | _T_279; // @[el2_exu_div_ctl.scala 84:128]
  wire  _T_284 = pat1_3 & _T_26; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_287 = _T_284 & _T_35; // @[el2_exu_div_ctl.scala 85:73]
  wire  _T_288 = _T_280 | _T_287; // @[el2_exu_div_ctl.scala 85:46]
  wire  pat1_27 = pat1_8 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_299 = pat1_27 & _T_119; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_300 = _T_288 | _T_299; // @[el2_exu_div_ctl.scala 85:86]
  wire  pat2_28 = m_ff[3] & _T_24; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_306 = pat1_3 & pat2_28; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_307 = _T_300 | _T_306; // @[el2_exu_div_ctl.scala 85:128]
  wire  pat2_29 = pat2_28 & _T_26; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_316 = pat1_11 & pat2_29; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_317 = _T_307 | _T_316; // @[el2_exu_div_ctl.scala 86:46]
  wire  pat1_30 = pat1 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_324 = pat1_30 & pat2_20; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_325 = _T_317 | _T_324; // @[el2_exu_div_ctl.scala 86:86]
  wire  pat1_31 = pat1 & _T_191; // @[el2_exu_div_ctl.scala 67:94]
  wire  pat2_31 = pat2_21 & m_ff[0]; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_336 = pat1_31 & pat2_31; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_337 = _T_325 | _T_336; // @[el2_exu_div_ctl.scala 86:128]
  wire  _T_342 = pat1_12 & m_ff[3]; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_345 = _T_342 & _T_35; // @[el2_exu_div_ctl.scala 87:75]
  wire  _T_346 = _T_337 | _T_345; // @[el2_exu_div_ctl.scala 87:46]
  wire  pat2_33 = m_ff[3] & _T_26; // @[el2_exu_div_ctl.scala 68:94]
  wire  _T_354 = pat1_12 & pat2_33; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_355 = _T_346 | _T_354; // @[el2_exu_div_ctl.scala 87:86]
  wire  pat1_34 = pat1_3 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_363 = pat1_34 & pat2_33; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_364 = _T_355 | _T_363; // @[el2_exu_div_ctl.scala 87:128]
  wire  pat1_35 = pat1_7 & pat1_5; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_373 = pat1_35 & _T_157; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_374 = _T_364 | _T_373; // @[el2_exu_div_ctl.scala 88:46]
  wire  pat1_36 = pat1_11 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_380 = pat1_36 & _T_24; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_381 = _T_374 | _T_380; // @[el2_exu_div_ctl.scala 88:86]
  wire  pat1_37 = pat1_12 & q_ff[0]; // @[el2_exu_div_ctl.scala 67:94]
  wire  _T_388 = pat1_37 & m_ff[3]; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_389 = _T_381 | _T_388; // @[el2_exu_div_ctl.scala 88:128]
  wire  _T_393 = pat1_11 & _T_24; // @[el2_exu_div_ctl.scala 69:10]
  wire  _T_396 = _T_393 & _T_35; // @[el2_exu_div_ctl.scala 89:72]
  wire  _T_397 = _T_389 | _T_396; // @[el2_exu_div_ctl.scala 89:46]
  wire [1:0] _T_398 = {_T_138,_T_397}; // @[Cat.scala 29:58]
  wire [1:0] _T_399 = {_T_28,_T_53}; // @[Cat.scala 29:58]
  reg  sign_ff; // @[Reg.scala 27:20]
  wire  _T_401 = sign_ff & q_ff[31]; // @[el2_exu_div_ctl.scala 99:34]
  wire [32:0] short_dividend = {_T_401,q_ff[31:0]}; // @[Cat.scala 29:58]
  wire  _T_406 = ~short_dividend[32]; // @[el2_exu_div_ctl.scala 104:7]
  wire  _T_409 = short_dividend[31:24] != 8'h0; // @[el2_exu_div_ctl.scala 104:60]
  wire  _T_414 = short_dividend[31:23] != 9'h1ff; // @[el2_exu_div_ctl.scala 105:59]
  wire  _T_415 = _T_406 & _T_409; // @[Mux.scala 27:72]
  wire  _T_416 = short_dividend[32] & _T_414; // @[Mux.scala 27:72]
  wire  _T_417 = _T_415 | _T_416; // @[Mux.scala 27:72]
  wire  _T_424 = short_dividend[23:16] != 8'h0; // @[el2_exu_div_ctl.scala 108:60]
  wire  _T_429 = short_dividend[22:15] != 8'hff; // @[el2_exu_div_ctl.scala 109:59]
  wire  _T_430 = _T_406 & _T_424; // @[Mux.scala 27:72]
  wire  _T_431 = short_dividend[32] & _T_429; // @[Mux.scala 27:72]
  wire  _T_432 = _T_430 | _T_431; // @[Mux.scala 27:72]
  wire  _T_439 = short_dividend[15:8] != 8'h0; // @[el2_exu_div_ctl.scala 112:59]
  wire  _T_444 = short_dividend[14:7] != 8'hff; // @[el2_exu_div_ctl.scala 113:58]
  wire  _T_445 = _T_406 & _T_439; // @[Mux.scala 27:72]
  wire  _T_446 = short_dividend[32] & _T_444; // @[Mux.scala 27:72]
  wire  _T_447 = _T_445 | _T_446; // @[Mux.scala 27:72]
  wire [2:0] a_cls = {_T_417,_T_432,_T_447}; // @[Cat.scala 29:58]
  wire  _T_452 = ~m_ff[32]; // @[el2_exu_div_ctl.scala 118:7]
  wire  _T_455 = m_ff[31:24] != 8'h0; // @[el2_exu_div_ctl.scala 118:40]
  wire  _T_460 = m_ff[31:24] != 8'hff; // @[el2_exu_div_ctl.scala 119:39]
  wire  _T_461 = _T_452 & _T_455; // @[Mux.scala 27:72]
  wire  _T_462 = m_ff[32] & _T_460; // @[Mux.scala 27:72]
  wire  _T_463 = _T_461 | _T_462; // @[Mux.scala 27:72]
  wire  _T_470 = m_ff[23:16] != 8'h0; // @[el2_exu_div_ctl.scala 122:40]
  wire  _T_475 = m_ff[23:16] != 8'hff; // @[el2_exu_div_ctl.scala 123:39]
  wire  _T_476 = _T_452 & _T_470; // @[Mux.scala 27:72]
  wire  _T_477 = m_ff[32] & _T_475; // @[Mux.scala 27:72]
  wire  _T_478 = _T_476 | _T_477; // @[Mux.scala 27:72]
  wire  _T_485 = m_ff[15:8] != 8'h0; // @[el2_exu_div_ctl.scala 126:39]
  wire  _T_490 = m_ff[15:8] != 8'hff; // @[el2_exu_div_ctl.scala 127:38]
  wire  _T_491 = _T_452 & _T_485; // @[Mux.scala 27:72]
  wire  _T_492 = m_ff[32] & _T_490; // @[Mux.scala 27:72]
  wire  _T_493 = _T_491 | _T_492; // @[Mux.scala 27:72]
  wire [2:0] b_cls = {_T_463,_T_478,_T_493}; // @[Cat.scala 29:58]
  wire  _T_497 = a_cls[2:1] == 2'h1; // @[el2_exu_div_ctl.scala 131:19]
  wire  _T_500 = _T_497 & b_cls[2]; // @[el2_exu_div_ctl.scala 131:34]
  wire  _T_502 = a_cls == 3'h1; // @[el2_exu_div_ctl.scala 132:21]
  wire  _T_505 = _T_502 & b_cls[2]; // @[el2_exu_div_ctl.scala 132:36]
  wire  _T_506 = _T_500 | _T_505; // @[el2_exu_div_ctl.scala 131:65]
  wire  _T_508 = a_cls == 3'h0; // @[el2_exu_div_ctl.scala 133:21]
  wire  _T_511 = _T_508 & b_cls[2]; // @[el2_exu_div_ctl.scala 133:36]
  wire  _T_512 = _T_506 | _T_511; // @[el2_exu_div_ctl.scala 132:67]
  wire  _T_516 = b_cls[2:1] == 2'h1; // @[el2_exu_div_ctl.scala 134:50]
  wire  _T_517 = _T_502 & _T_516; // @[el2_exu_div_ctl.scala 134:36]
  wire  _T_518 = _T_512 | _T_517; // @[el2_exu_div_ctl.scala 133:67]
  wire  _T_523 = _T_508 & _T_516; // @[el2_exu_div_ctl.scala 135:36]
  wire  _T_524 = _T_518 | _T_523; // @[el2_exu_div_ctl.scala 134:67]
  wire  _T_528 = b_cls == 3'h1; // @[el2_exu_div_ctl.scala 136:50]
  wire  _T_529 = _T_508 & _T_528; // @[el2_exu_div_ctl.scala 136:36]
  wire  _T_530 = _T_524 | _T_529; // @[el2_exu_div_ctl.scala 135:67]
  wire  _T_535 = a_cls[2] & b_cls[2]; // @[el2_exu_div_ctl.scala 138:34]
  wire  _T_540 = _T_497 & _T_516; // @[el2_exu_div_ctl.scala 139:36]
  wire  _T_541 = _T_535 | _T_540; // @[el2_exu_div_ctl.scala 138:65]
  wire  _T_546 = _T_502 & _T_528; // @[el2_exu_div_ctl.scala 140:36]
  wire  _T_547 = _T_541 | _T_546; // @[el2_exu_div_ctl.scala 139:67]
  wire  _T_551 = b_cls == 3'h0; // @[el2_exu_div_ctl.scala 141:50]
  wire  _T_552 = _T_508 & _T_551; // @[el2_exu_div_ctl.scala 141:36]
  wire  _T_553 = _T_547 | _T_552; // @[el2_exu_div_ctl.scala 140:67]
  wire  _T_558 = a_cls[2] & _T_516; // @[el2_exu_div_ctl.scala 143:34]
  wire  _T_563 = _T_497 & _T_528; // @[el2_exu_div_ctl.scala 144:36]
  wire  _T_564 = _T_558 | _T_563; // @[el2_exu_div_ctl.scala 143:65]
  wire  _T_569 = _T_502 & _T_551; // @[el2_exu_div_ctl.scala 145:36]
  wire  _T_570 = _T_564 | _T_569; // @[el2_exu_div_ctl.scala 144:67]
  wire  _T_575 = a_cls[2] & _T_528; // @[el2_exu_div_ctl.scala 147:34]
  wire  _T_580 = _T_497 & _T_551; // @[el2_exu_div_ctl.scala 148:36]
  wire  _T_581 = _T_575 | _T_580; // @[el2_exu_div_ctl.scala 147:65]
  wire [3:0] shortq_raw = {_T_530,_T_553,_T_570,_T_581}; // @[Cat.scala 29:58]
  wire  _T_586 = valid_ff_x & _T_7; // @[el2_exu_div_ctl.scala 151:35]
  wire  _T_587 = shortq_raw != 4'h0; // @[el2_exu_div_ctl.scala 151:78]
  wire  shortq_enable = _T_586 & _T_587; // @[el2_exu_div_ctl.scala 151:64]
  wire [3:0] _T_589 = shortq_enable ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] shortq_shift_xx; // @[el2_exu_div_ctl.scala 221:31]
  wire [4:0] _T_598 = shortq_shift_xx[3] ? 5'h1f : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_599 = shortq_shift_xx[2] ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_600 = shortq_shift_xx[1] ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_601 = shortq_shift_xx[0] ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_602 = _T_598 | _T_599; // @[Mux.scala 27:72]
  wire [4:0] _T_603 = _T_602 | _T_600; // @[Mux.scala 27:72]
  wire [4:0] _GEN_4 = {{1'd0}, _T_601}; // @[Mux.scala 27:72]
  wire [4:0] shortq_shift_ff = _T_603 | _GEN_4; // @[Mux.scala 27:72]
  reg [5:0] count; // @[el2_exu_div_ctl.scala 213:21]
  wire  _T_606 = count == 6'h20; // @[el2_exu_div_ctl.scala 165:55]
  wire  _T_607 = count == 6'h21; // @[el2_exu_div_ctl.scala 165:76]
  wire  _T_608 = _T_9 ? _T_606 : _T_607; // @[el2_exu_div_ctl.scala 165:39]
  wire  finish = smallnum_case | _T_608; // @[el2_exu_div_ctl.scala 165:34]
  reg  run_state; // @[el2_exu_div_ctl.scala 212:25]
  wire  _T_609 = io_dp_valid | run_state; // @[el2_exu_div_ctl.scala 166:32]
  wire  _T_610 = _T_609 | finish; // @[el2_exu_div_ctl.scala 166:44]
  reg  finish_ff; // @[el2_exu_div_ctl.scala 211:25]
  wire  _T_612 = ~finish; // @[el2_exu_div_ctl.scala 167:48]
  wire  _T_613 = _T_609 & _T_612; // @[el2_exu_div_ctl.scala 167:46]
  wire  _T_616 = run_state & _T_612; // @[el2_exu_div_ctl.scala 168:35]
  wire  _T_618 = _T_616 & _T; // @[el2_exu_div_ctl.scala 168:45]
  wire  _T_619 = ~shortq_enable; // @[el2_exu_div_ctl.scala 168:60]
  wire  _T_620 = _T_618 & _T_619; // @[el2_exu_div_ctl.scala 168:58]
  wire [5:0] _T_622 = _T_620 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _T_623 = {1'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [5:0] _T_625 = count + _T_623; // @[el2_exu_div_ctl.scala 168:86]
  wire [5:0] _T_627 = _T_625 + 6'h1; // @[el2_exu_div_ctl.scala 168:113]
  wire  _T_631 = ~io_dp_unsign; // @[el2_exu_div_ctl.scala 172:20]
  wire  _T_632 = io_divisor != 32'h0; // @[el2_exu_div_ctl.scala 172:48]
  wire  sign_eff = _T_631 & _T_632; // @[el2_exu_div_ctl.scala 172:34]
  wire  _T_633 = ~run_state; // @[el2_exu_div_ctl.scala 176:6]
  wire [32:0] _T_635 = {1'h0,io_dividend}; // @[Cat.scala 29:58]
  reg  shortq_enable_ff; // @[el2_exu_div_ctl.scala 220:32]
  wire  _T_636 = valid_ff_x | shortq_enable_ff; // @[el2_exu_div_ctl.scala 177:30]
  wire  _T_637 = run_state & _T_636; // @[el2_exu_div_ctl.scala 177:16]
  reg  dividend_neg_ff; // @[Reg.scala 27:20]
  wire  _T_660 = sign_ff & dividend_neg_ff; // @[el2_exu_div_ctl.scala 181:32]
  wire  _T_845 = |q_ff[30:0]; // @[el2_lib.scala 231:35]
  wire  _T_847 = ~q_ff[31]; // @[el2_lib.scala 231:40]
  wire  _T_849 = _T_845 ? _T_847 : q_ff[31]; // @[el2_lib.scala 231:23]
  wire  _T_839 = |q_ff[29:0]; // @[el2_lib.scala 231:35]
  wire  _T_841 = ~q_ff[30]; // @[el2_lib.scala 231:40]
  wire  _T_843 = _T_839 ? _T_841 : q_ff[30]; // @[el2_lib.scala 231:23]
  wire  _T_833 = |q_ff[28:0]; // @[el2_lib.scala 231:35]
  wire  _T_835 = ~q_ff[29]; // @[el2_lib.scala 231:40]
  wire  _T_837 = _T_833 ? _T_835 : q_ff[29]; // @[el2_lib.scala 231:23]
  wire  _T_827 = |q_ff[27:0]; // @[el2_lib.scala 231:35]
  wire  _T_829 = ~q_ff[28]; // @[el2_lib.scala 231:40]
  wire  _T_831 = _T_827 ? _T_829 : q_ff[28]; // @[el2_lib.scala 231:23]
  wire  _T_821 = |q_ff[26:0]; // @[el2_lib.scala 231:35]
  wire  _T_823 = ~q_ff[27]; // @[el2_lib.scala 231:40]
  wire  _T_825 = _T_821 ? _T_823 : q_ff[27]; // @[el2_lib.scala 231:23]
  wire  _T_815 = |q_ff[25:0]; // @[el2_lib.scala 231:35]
  wire  _T_817 = ~q_ff[26]; // @[el2_lib.scala 231:40]
  wire  _T_819 = _T_815 ? _T_817 : q_ff[26]; // @[el2_lib.scala 231:23]
  wire  _T_809 = |q_ff[24:0]; // @[el2_lib.scala 231:35]
  wire  _T_811 = ~q_ff[25]; // @[el2_lib.scala 231:40]
  wire  _T_813 = _T_809 ? _T_811 : q_ff[25]; // @[el2_lib.scala 231:23]
  wire  _T_803 = |q_ff[23:0]; // @[el2_lib.scala 231:35]
  wire  _T_805 = ~q_ff[24]; // @[el2_lib.scala 231:40]
  wire  _T_807 = _T_803 ? _T_805 : q_ff[24]; // @[el2_lib.scala 231:23]
  wire  _T_797 = |q_ff[22:0]; // @[el2_lib.scala 231:35]
  wire  _T_799 = ~q_ff[23]; // @[el2_lib.scala 231:40]
  wire  _T_801 = _T_797 ? _T_799 : q_ff[23]; // @[el2_lib.scala 231:23]
  wire  _T_791 = |q_ff[21:0]; // @[el2_lib.scala 231:35]
  wire  _T_793 = ~q_ff[22]; // @[el2_lib.scala 231:40]
  wire  _T_795 = _T_791 ? _T_793 : q_ff[22]; // @[el2_lib.scala 231:23]
  wire  _T_785 = |q_ff[20:0]; // @[el2_lib.scala 231:35]
  wire  _T_787 = ~q_ff[21]; // @[el2_lib.scala 231:40]
  wire  _T_789 = _T_785 ? _T_787 : q_ff[21]; // @[el2_lib.scala 231:23]
  wire  _T_779 = |q_ff[19:0]; // @[el2_lib.scala 231:35]
  wire  _T_781 = ~q_ff[20]; // @[el2_lib.scala 231:40]
  wire  _T_783 = _T_779 ? _T_781 : q_ff[20]; // @[el2_lib.scala 231:23]
  wire  _T_773 = |q_ff[18:0]; // @[el2_lib.scala 231:35]
  wire  _T_775 = ~q_ff[19]; // @[el2_lib.scala 231:40]
  wire  _T_777 = _T_773 ? _T_775 : q_ff[19]; // @[el2_lib.scala 231:23]
  wire  _T_767 = |q_ff[17:0]; // @[el2_lib.scala 231:35]
  wire  _T_769 = ~q_ff[18]; // @[el2_lib.scala 231:40]
  wire  _T_771 = _T_767 ? _T_769 : q_ff[18]; // @[el2_lib.scala 231:23]
  wire  _T_761 = |q_ff[16:0]; // @[el2_lib.scala 231:35]
  wire  _T_763 = ~q_ff[17]; // @[el2_lib.scala 231:40]
  wire  _T_765 = _T_761 ? _T_763 : q_ff[17]; // @[el2_lib.scala 231:23]
  wire  _T_755 = |q_ff[15:0]; // @[el2_lib.scala 231:35]
  wire  _T_757 = ~q_ff[16]; // @[el2_lib.scala 231:40]
  wire  _T_759 = _T_755 ? _T_757 : q_ff[16]; // @[el2_lib.scala 231:23]
  wire [7:0] _T_870 = {_T_801,_T_795,_T_789,_T_783,_T_777,_T_771,_T_765,_T_759}; // @[el2_lib.scala 233:14]
  wire  _T_749 = |q_ff[14:0]; // @[el2_lib.scala 231:35]
  wire  _T_751 = ~q_ff[15]; // @[el2_lib.scala 231:40]
  wire  _T_753 = _T_749 ? _T_751 : q_ff[15]; // @[el2_lib.scala 231:23]
  wire  _T_743 = |q_ff[13:0]; // @[el2_lib.scala 231:35]
  wire  _T_745 = ~q_ff[14]; // @[el2_lib.scala 231:40]
  wire  _T_747 = _T_743 ? _T_745 : q_ff[14]; // @[el2_lib.scala 231:23]
  wire  _T_737 = |q_ff[12:0]; // @[el2_lib.scala 231:35]
  wire  _T_739 = ~q_ff[13]; // @[el2_lib.scala 231:40]
  wire  _T_741 = _T_737 ? _T_739 : q_ff[13]; // @[el2_lib.scala 231:23]
  wire  _T_731 = |q_ff[11:0]; // @[el2_lib.scala 231:35]
  wire  _T_733 = ~q_ff[12]; // @[el2_lib.scala 231:40]
  wire  _T_735 = _T_731 ? _T_733 : q_ff[12]; // @[el2_lib.scala 231:23]
  wire  _T_725 = |q_ff[10:0]; // @[el2_lib.scala 231:35]
  wire  _T_727 = ~q_ff[11]; // @[el2_lib.scala 231:40]
  wire  _T_729 = _T_725 ? _T_727 : q_ff[11]; // @[el2_lib.scala 231:23]
  wire  _T_719 = |q_ff[9:0]; // @[el2_lib.scala 231:35]
  wire  _T_721 = ~q_ff[10]; // @[el2_lib.scala 231:40]
  wire  _T_723 = _T_719 ? _T_721 : q_ff[10]; // @[el2_lib.scala 231:23]
  wire  _T_713 = |q_ff[8:0]; // @[el2_lib.scala 231:35]
  wire  _T_715 = ~q_ff[9]; // @[el2_lib.scala 231:40]
  wire  _T_717 = _T_713 ? _T_715 : q_ff[9]; // @[el2_lib.scala 231:23]
  wire  _T_707 = |q_ff[7:0]; // @[el2_lib.scala 231:35]
  wire  _T_709 = ~q_ff[8]; // @[el2_lib.scala 231:40]
  wire  _T_711 = _T_707 ? _T_709 : q_ff[8]; // @[el2_lib.scala 231:23]
  wire  _T_701 = |q_ff[6:0]; // @[el2_lib.scala 231:35]
  wire  _T_703 = ~q_ff[7]; // @[el2_lib.scala 231:40]
  wire  _T_705 = _T_701 ? _T_703 : q_ff[7]; // @[el2_lib.scala 231:23]
  wire  _T_695 = |q_ff[5:0]; // @[el2_lib.scala 231:35]
  wire  _T_697 = ~q_ff[6]; // @[el2_lib.scala 231:40]
  wire  _T_699 = _T_695 ? _T_697 : q_ff[6]; // @[el2_lib.scala 231:23]
  wire  _T_689 = |q_ff[4:0]; // @[el2_lib.scala 231:35]
  wire  _T_691 = ~q_ff[5]; // @[el2_lib.scala 231:40]
  wire  _T_693 = _T_689 ? _T_691 : q_ff[5]; // @[el2_lib.scala 231:23]
  wire  _T_683 = |q_ff[3:0]; // @[el2_lib.scala 231:35]
  wire  _T_685 = ~q_ff[4]; // @[el2_lib.scala 231:40]
  wire  _T_687 = _T_683 ? _T_685 : q_ff[4]; // @[el2_lib.scala 231:23]
  wire  _T_677 = |q_ff[2:0]; // @[el2_lib.scala 231:35]
  wire  _T_679 = ~q_ff[3]; // @[el2_lib.scala 231:40]
  wire  _T_681 = _T_677 ? _T_679 : q_ff[3]; // @[el2_lib.scala 231:23]
  wire  _T_671 = |q_ff[1:0]; // @[el2_lib.scala 231:35]
  wire  _T_673 = ~q_ff[2]; // @[el2_lib.scala 231:40]
  wire  _T_675 = _T_671 ? _T_673 : q_ff[2]; // @[el2_lib.scala 231:23]
  wire  _T_665 = |q_ff[0]; // @[el2_lib.scala 231:35]
  wire  _T_667 = ~q_ff[1]; // @[el2_lib.scala 231:40]
  wire  _T_669 = _T_665 ? _T_667 : q_ff[1]; // @[el2_lib.scala 231:23]
  wire [6:0] _T_855 = {_T_705,_T_699,_T_693,_T_687,_T_681,_T_675,_T_669}; // @[el2_lib.scala 233:14]
  wire [14:0] _T_863 = {_T_753,_T_747,_T_741,_T_735,_T_729,_T_723,_T_717,_T_711,_T_855}; // @[el2_lib.scala 233:14]
  wire [30:0] _T_879 = {_T_849,_T_843,_T_837,_T_831,_T_825,_T_819,_T_813,_T_807,_T_870,_T_863}; // @[el2_lib.scala 233:14]
  wire [31:0] _T_881 = {_T_879,q_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] dividend_eff = _T_660 ? _T_881 : q_ff[31:0]; // @[el2_exu_div_ctl.scala 181:22]
  wire [32:0] _T_917 = run_state ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _T_929 = _T_607 & rem_ff; // @[el2_exu_div_ctl.scala 197:41]
  reg [32:0] a_ff; // @[beh_lib.scala 358:14]
  wire  rem_correct = _T_929 & a_ff[32]; // @[el2_exu_div_ctl.scala 197:50]
  wire [32:0] _T_902 = rem_correct ? a_ff : 33'h0; // @[Mux.scala 27:72]
  wire  _T_890 = ~rem_correct; // @[el2_exu_div_ctl.scala 188:6]
  wire  _T_891 = ~shortq_enable_ff; // @[el2_exu_div_ctl.scala 188:21]
  wire  _T_892 = _T_890 & _T_891; // @[el2_exu_div_ctl.scala 188:19]
  wire [32:0] _T_896 = {a_ff[31:0],q_ff[32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_903 = _T_892 ? _T_896 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_905 = _T_902 | _T_903; // @[Mux.scala 27:72]
  wire  _T_898 = _T_890 & shortq_enable_ff; // @[el2_exu_div_ctl.scala 189:19]
  wire [55:0] _T_887 = {24'h0,dividend_eff}; // @[Cat.scala 29:58]
  wire [86:0] _GEN_5 = {{31'd0}, _T_887}; // @[el2_exu_div_ctl.scala 185:47]
  wire [86:0] _T_888 = _GEN_5 << shortq_shift_ff; // @[el2_exu_div_ctl.scala 185:47]
  wire [55:0] a_eff_shift = _T_888[55:0]; // @[el2_exu_div_ctl.scala 185:15]
  wire [32:0] _T_901 = {9'h0,a_eff_shift[55:32]}; // @[Cat.scala 29:58]
  wire [32:0] _T_904 = _T_898 ? _T_901 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] a_eff = _T_905 | _T_904; // @[Mux.scala 27:72]
  wire [32:0] a_shift = _T_917 & a_eff; // @[el2_exu_div_ctl.scala 192:33]
  wire  _T_926 = a_ff[32] | rem_correct; // @[el2_exu_div_ctl.scala 196:21]
  reg  divisor_neg_ff; // @[Reg.scala 27:20]
  wire  m_already_comp = divisor_neg_ff & sign_ff; // @[el2_exu_div_ctl.scala 194:48]
  wire  add = _T_926 ^ m_already_comp; // @[el2_exu_div_ctl.scala 196:36]
  wire [32:0] _T_885 = ~m_ff; // @[el2_exu_div_ctl.scala 184:35]
  wire [32:0] m_eff = add ? m_ff : _T_885; // @[el2_exu_div_ctl.scala 184:15]
  wire [32:0] _T_919 = a_shift + m_eff; // @[el2_exu_div_ctl.scala 193:41]
  wire  _T_920 = ~add; // @[el2_exu_div_ctl.scala 193:65]
  wire [32:0] _T_921 = {32'h0,_T_920}; // @[Cat.scala 29:58]
  wire [32:0] _T_923 = _T_919 + _T_921; // @[el2_exu_div_ctl.scala 193:49]
  wire [32:0] a_in = _T_917 & _T_923; // @[el2_exu_div_ctl.scala 193:30]
  wire  _T_641 = ~a_in[32]; // @[el2_exu_div_ctl.scala 177:85]
  wire [32:0] _T_642 = {dividend_eff,_T_641}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_6 = {{31'd0}, _T_642}; // @[el2_exu_div_ctl.scala 177:96]
  wire [63:0] _T_643 = _GEN_6 << shortq_shift_ff; // @[el2_exu_div_ctl.scala 177:96]
  wire  _T_645 = ~_T_636; // @[el2_exu_div_ctl.scala 178:18]
  wire  _T_646 = run_state & _T_645; // @[el2_exu_div_ctl.scala 178:16]
  wire [32:0] _T_651 = {q_ff[31:0],_T_641}; // @[Cat.scala 29:58]
  wire [32:0] _T_652 = _T_633 ? _T_635 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_653 = _T_637 ? _T_643 : 64'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_654 = _T_646 ? _T_651 : 33'h0; // @[Mux.scala 27:72]
  wire [63:0] _GEN_7 = {{31'd0}, _T_652}; // @[Mux.scala 27:72]
  wire [63:0] _T_655 = _GEN_7 | _T_653; // @[Mux.scala 27:72]
  wire [63:0] _GEN_8 = {{31'd0}, _T_654}; // @[Mux.scala 27:72]
  wire [63:0] _T_656 = _T_655 | _GEN_8; // @[Mux.scala 27:72]
  wire  _T_659 = run_state & _T_619; // @[el2_exu_div_ctl.scala 180:48]
  wire  _T_910 = count != 6'h21; // @[el2_exu_div_ctl.scala 191:73]
  wire  _T_911 = _T_659 & _T_910; // @[el2_exu_div_ctl.scala 191:64]
  wire  _T_912 = io_dp_valid | _T_911; // @[el2_exu_div_ctl.scala 191:34]
  wire  _T_932 = dividend_neg_ff ^ divisor_neg_ff; // @[el2_exu_div_ctl.scala 198:50]
  wire  _T_933 = sign_ff & _T_932; // @[el2_exu_div_ctl.scala 198:31]
  wire [31:0] q_ff_eff = _T_933 ? _T_881 : q_ff[31:0]; // @[el2_exu_div_ctl.scala 198:21]
  wire  _T_1161 = |a_ff[0]; // @[el2_lib.scala 231:35]
  wire  _T_1163 = ~a_ff[1]; // @[el2_lib.scala 231:40]
  wire  _T_1165 = _T_1161 ? _T_1163 : a_ff[1]; // @[el2_lib.scala 231:23]
  wire  _T_1167 = |a_ff[1:0]; // @[el2_lib.scala 231:35]
  wire  _T_1169 = ~a_ff[2]; // @[el2_lib.scala 231:40]
  wire  _T_1171 = _T_1167 ? _T_1169 : a_ff[2]; // @[el2_lib.scala 231:23]
  wire  _T_1173 = |a_ff[2:0]; // @[el2_lib.scala 231:35]
  wire  _T_1175 = ~a_ff[3]; // @[el2_lib.scala 231:40]
  wire  _T_1177 = _T_1173 ? _T_1175 : a_ff[3]; // @[el2_lib.scala 231:23]
  wire  _T_1179 = |a_ff[3:0]; // @[el2_lib.scala 231:35]
  wire  _T_1181 = ~a_ff[4]; // @[el2_lib.scala 231:40]
  wire  _T_1183 = _T_1179 ? _T_1181 : a_ff[4]; // @[el2_lib.scala 231:23]
  wire  _T_1185 = |a_ff[4:0]; // @[el2_lib.scala 231:35]
  wire  _T_1187 = ~a_ff[5]; // @[el2_lib.scala 231:40]
  wire  _T_1189 = _T_1185 ? _T_1187 : a_ff[5]; // @[el2_lib.scala 231:23]
  wire  _T_1191 = |a_ff[5:0]; // @[el2_lib.scala 231:35]
  wire  _T_1193 = ~a_ff[6]; // @[el2_lib.scala 231:40]
  wire  _T_1195 = _T_1191 ? _T_1193 : a_ff[6]; // @[el2_lib.scala 231:23]
  wire  _T_1197 = |a_ff[6:0]; // @[el2_lib.scala 231:35]
  wire  _T_1199 = ~a_ff[7]; // @[el2_lib.scala 231:40]
  wire  _T_1201 = _T_1197 ? _T_1199 : a_ff[7]; // @[el2_lib.scala 231:23]
  wire  _T_1203 = |a_ff[7:0]; // @[el2_lib.scala 231:35]
  wire  _T_1205 = ~a_ff[8]; // @[el2_lib.scala 231:40]
  wire  _T_1207 = _T_1203 ? _T_1205 : a_ff[8]; // @[el2_lib.scala 231:23]
  wire  _T_1209 = |a_ff[8:0]; // @[el2_lib.scala 231:35]
  wire  _T_1211 = ~a_ff[9]; // @[el2_lib.scala 231:40]
  wire  _T_1213 = _T_1209 ? _T_1211 : a_ff[9]; // @[el2_lib.scala 231:23]
  wire  _T_1215 = |a_ff[9:0]; // @[el2_lib.scala 231:35]
  wire  _T_1217 = ~a_ff[10]; // @[el2_lib.scala 231:40]
  wire  _T_1219 = _T_1215 ? _T_1217 : a_ff[10]; // @[el2_lib.scala 231:23]
  wire  _T_1221 = |a_ff[10:0]; // @[el2_lib.scala 231:35]
  wire  _T_1223 = ~a_ff[11]; // @[el2_lib.scala 231:40]
  wire  _T_1225 = _T_1221 ? _T_1223 : a_ff[11]; // @[el2_lib.scala 231:23]
  wire  _T_1227 = |a_ff[11:0]; // @[el2_lib.scala 231:35]
  wire  _T_1229 = ~a_ff[12]; // @[el2_lib.scala 231:40]
  wire  _T_1231 = _T_1227 ? _T_1229 : a_ff[12]; // @[el2_lib.scala 231:23]
  wire  _T_1233 = |a_ff[12:0]; // @[el2_lib.scala 231:35]
  wire  _T_1235 = ~a_ff[13]; // @[el2_lib.scala 231:40]
  wire  _T_1237 = _T_1233 ? _T_1235 : a_ff[13]; // @[el2_lib.scala 231:23]
  wire  _T_1239 = |a_ff[13:0]; // @[el2_lib.scala 231:35]
  wire  _T_1241 = ~a_ff[14]; // @[el2_lib.scala 231:40]
  wire  _T_1243 = _T_1239 ? _T_1241 : a_ff[14]; // @[el2_lib.scala 231:23]
  wire  _T_1245 = |a_ff[14:0]; // @[el2_lib.scala 231:35]
  wire  _T_1247 = ~a_ff[15]; // @[el2_lib.scala 231:40]
  wire  _T_1249 = _T_1245 ? _T_1247 : a_ff[15]; // @[el2_lib.scala 231:23]
  wire  _T_1251 = |a_ff[15:0]; // @[el2_lib.scala 231:35]
  wire  _T_1253 = ~a_ff[16]; // @[el2_lib.scala 231:40]
  wire  _T_1255 = _T_1251 ? _T_1253 : a_ff[16]; // @[el2_lib.scala 231:23]
  wire  _T_1257 = |a_ff[16:0]; // @[el2_lib.scala 231:35]
  wire  _T_1259 = ~a_ff[17]; // @[el2_lib.scala 231:40]
  wire  _T_1261 = _T_1257 ? _T_1259 : a_ff[17]; // @[el2_lib.scala 231:23]
  wire  _T_1263 = |a_ff[17:0]; // @[el2_lib.scala 231:35]
  wire  _T_1265 = ~a_ff[18]; // @[el2_lib.scala 231:40]
  wire  _T_1267 = _T_1263 ? _T_1265 : a_ff[18]; // @[el2_lib.scala 231:23]
  wire  _T_1269 = |a_ff[18:0]; // @[el2_lib.scala 231:35]
  wire  _T_1271 = ~a_ff[19]; // @[el2_lib.scala 231:40]
  wire  _T_1273 = _T_1269 ? _T_1271 : a_ff[19]; // @[el2_lib.scala 231:23]
  wire  _T_1275 = |a_ff[19:0]; // @[el2_lib.scala 231:35]
  wire  _T_1277 = ~a_ff[20]; // @[el2_lib.scala 231:40]
  wire  _T_1279 = _T_1275 ? _T_1277 : a_ff[20]; // @[el2_lib.scala 231:23]
  wire  _T_1281 = |a_ff[20:0]; // @[el2_lib.scala 231:35]
  wire  _T_1283 = ~a_ff[21]; // @[el2_lib.scala 231:40]
  wire  _T_1285 = _T_1281 ? _T_1283 : a_ff[21]; // @[el2_lib.scala 231:23]
  wire  _T_1287 = |a_ff[21:0]; // @[el2_lib.scala 231:35]
  wire  _T_1289 = ~a_ff[22]; // @[el2_lib.scala 231:40]
  wire  _T_1291 = _T_1287 ? _T_1289 : a_ff[22]; // @[el2_lib.scala 231:23]
  wire  _T_1293 = |a_ff[22:0]; // @[el2_lib.scala 231:35]
  wire  _T_1295 = ~a_ff[23]; // @[el2_lib.scala 231:40]
  wire  _T_1297 = _T_1293 ? _T_1295 : a_ff[23]; // @[el2_lib.scala 231:23]
  wire  _T_1299 = |a_ff[23:0]; // @[el2_lib.scala 231:35]
  wire  _T_1301 = ~a_ff[24]; // @[el2_lib.scala 231:40]
  wire  _T_1303 = _T_1299 ? _T_1301 : a_ff[24]; // @[el2_lib.scala 231:23]
  wire  _T_1305 = |a_ff[24:0]; // @[el2_lib.scala 231:35]
  wire  _T_1307 = ~a_ff[25]; // @[el2_lib.scala 231:40]
  wire  _T_1309 = _T_1305 ? _T_1307 : a_ff[25]; // @[el2_lib.scala 231:23]
  wire  _T_1311 = |a_ff[25:0]; // @[el2_lib.scala 231:35]
  wire  _T_1313 = ~a_ff[26]; // @[el2_lib.scala 231:40]
  wire  _T_1315 = _T_1311 ? _T_1313 : a_ff[26]; // @[el2_lib.scala 231:23]
  wire  _T_1317 = |a_ff[26:0]; // @[el2_lib.scala 231:35]
  wire  _T_1319 = ~a_ff[27]; // @[el2_lib.scala 231:40]
  wire  _T_1321 = _T_1317 ? _T_1319 : a_ff[27]; // @[el2_lib.scala 231:23]
  wire  _T_1323 = |a_ff[27:0]; // @[el2_lib.scala 231:35]
  wire  _T_1325 = ~a_ff[28]; // @[el2_lib.scala 231:40]
  wire  _T_1327 = _T_1323 ? _T_1325 : a_ff[28]; // @[el2_lib.scala 231:23]
  wire  _T_1329 = |a_ff[28:0]; // @[el2_lib.scala 231:35]
  wire  _T_1331 = ~a_ff[29]; // @[el2_lib.scala 231:40]
  wire  _T_1333 = _T_1329 ? _T_1331 : a_ff[29]; // @[el2_lib.scala 231:23]
  wire  _T_1335 = |a_ff[29:0]; // @[el2_lib.scala 231:35]
  wire  _T_1337 = ~a_ff[30]; // @[el2_lib.scala 231:40]
  wire  _T_1339 = _T_1335 ? _T_1337 : a_ff[30]; // @[el2_lib.scala 231:23]
  wire  _T_1341 = |a_ff[30:0]; // @[el2_lib.scala 231:35]
  wire  _T_1343 = ~a_ff[31]; // @[el2_lib.scala 231:40]
  wire  _T_1345 = _T_1341 ? _T_1343 : a_ff[31]; // @[el2_lib.scala 231:23]
  wire [6:0] _T_1351 = {_T_1201,_T_1195,_T_1189,_T_1183,_T_1177,_T_1171,_T_1165}; // @[el2_lib.scala 233:14]
  wire [14:0] _T_1359 = {_T_1249,_T_1243,_T_1237,_T_1231,_T_1225,_T_1219,_T_1213,_T_1207,_T_1351}; // @[el2_lib.scala 233:14]
  wire [7:0] _T_1366 = {_T_1297,_T_1291,_T_1285,_T_1279,_T_1273,_T_1267,_T_1261,_T_1255}; // @[el2_lib.scala 233:14]
  wire [30:0] _T_1375 = {_T_1345,_T_1339,_T_1333,_T_1327,_T_1321,_T_1315,_T_1309,_T_1303,_T_1366,_T_1359}; // @[el2_lib.scala 233:14]
  wire [31:0] _T_1377 = {_T_1375,a_ff[0]}; // @[Cat.scala 29:58]
  wire [31:0] a_ff_eff = _T_660 ? _T_1377 : a_ff[31:0]; // @[el2_exu_div_ctl.scala 199:21]
  reg  smallnum_case_ff; // @[el2_exu_div_ctl.scala 218:32]
  reg [3:0] smallnum_ff; // @[el2_exu_div_ctl.scala 219:27]
  wire [31:0] _T_1380 = {28'h0,smallnum_ff}; // @[Cat.scala 29:58]
  wire  _T_1382 = ~smallnum_case_ff; // @[el2_exu_div_ctl.scala 204:6]
  wire  _T_1384 = _T_1382 & _T_9; // @[el2_exu_div_ctl.scala 204:24]
  wire [31:0] _T_1386 = smallnum_case_ff ? _T_1380 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1387 = rem_ff ? a_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1388 = _T_1384 ? q_ff_eff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1389 = _T_1386 | _T_1387; // @[Mux.scala 27:72]
  wire  _T_1421 = _T_631 & io_divisor[31]; // @[el2_exu_div_ctl.scala 225:36]
  rvclkhdr rvclkhdr ( // @[beh_lib.scala 341:20]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[beh_lib.scala 352:21]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[beh_lib.scala 352:21]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[beh_lib.scala 352:21]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  assign io_out = _T_1389 | _T_1388; // @[el2_exu_div_ctl.scala 53:10 el2_exu_div_ctl.scala 201:10]
  assign io_finish_dly = finish_ff & _T; // @[el2_exu_div_ctl.scala 54:17 el2_exu_div_ctl.scala 171:18]
  assign rvclkhdr_io_clk = clock; // @[beh_lib.scala 342:15]
  assign rvclkhdr_io_en = _T_610 | finish_ff; // @[beh_lib.scala 343:14]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[beh_lib.scala 344:21]
  assign rvclkhdr_1_io_clk = clock; // @[beh_lib.scala 354:16]
  assign rvclkhdr_1_io_en = io_dp_valid | _T_659; // @[beh_lib.scala 355:15]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[beh_lib.scala 356:22]
  assign rvclkhdr_2_io_clk = clock; // @[beh_lib.scala 354:16]
  assign rvclkhdr_2_io_en = _T_912 | rem_correct; // @[beh_lib.scala 355:15]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[beh_lib.scala 356:22]
  assign rvclkhdr_3_io_clk = clock; // @[beh_lib.scala 354:16]
  assign rvclkhdr_3_io_en = io_dp_valid; // @[beh_lib.scala 355:15]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[beh_lib.scala 356:22]
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
  shortq_shift_xx = _RAND_5[3:0];
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
    shortq_shift_xx = 4'h0;
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
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      valid_ff_x <= 1'h0;
    end else begin
      valid_ff_x <= io_dp_valid & _T;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      q_ff <= 33'h0;
    end else begin
      q_ff <= _T_656[32:0];
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      m_ff <= 33'h0;
    end else begin
      m_ff <= {_T_1421,io_divisor};
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      rem_ff <= 1'h0;
    end else if (io_dp_valid) begin
      rem_ff <= io_dp_rem;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      sign_ff <= 1'h0;
    end else if (io_dp_valid) begin
      sign_ff <= sign_eff;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      shortq_shift_xx <= 4'h0;
    end else begin
      shortq_shift_xx <= _T_589 & shortq_raw;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      count <= 6'h0;
    end else begin
      count <= _T_622 & _T_627;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      run_state <= 1'h0;
    end else begin
      run_state <= _T_613 & _T;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      finish_ff <= 1'h0;
    end else begin
      finish_ff <= finish & _T;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      shortq_enable_ff <= 1'h0;
    end else begin
      shortq_enable_ff <= _T_586 & _T_587;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      dividend_neg_ff <= 1'h0;
    end else if (io_dp_valid) begin
      dividend_neg_ff <= io_dividend[31];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      a_ff <= 33'h0;
    end else begin
      a_ff <= _T_917 & _T_923;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      divisor_neg_ff <= 1'h0;
    end else if (io_dp_valid) begin
      divisor_neg_ff <= io_divisor[31];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      smallnum_case_ff <= 1'h0;
    end else begin
      smallnum_case_ff <= _T_11 | _T_19;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      smallnum_ff <= 4'h0;
    end else begin
      smallnum_ff <= {_T_399,_T_398};
    end
  end
endmodule
