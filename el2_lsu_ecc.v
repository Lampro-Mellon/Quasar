module el2_lsu_ecc(
  input         clock,
  input         reset,
  input         io_lsu_c2_r_clk,
  input         io_lsu_pkt_m_fast_int,
  input         io_lsu_pkt_m_by,
  input         io_lsu_pkt_m_half,
  input         io_lsu_pkt_m_word,
  input         io_lsu_pkt_m_dword,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_unsign,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_store_data_bypass_d,
  input         io_lsu_pkt_m_load_ldst_bypass_d,
  input         io_lsu_pkt_m_store_data_bypass_m,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_fast_int,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_dword,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_unsign,
  input         io_lsu_pkt_r_dma,
  input         io_lsu_pkt_r_store_data_bypass_d,
  input         io_lsu_pkt_r_load_ldst_bypass_d,
  input         io_lsu_pkt_r_store_data_bypass_m,
  input         io_lsu_pkt_r_valid,
  input  [31:0] io_stbuf_data_any,
  input         io_dec_tlu_core_ecc_disable,
  input         io_lsu_dccm_rden_r,
  input         io_addr_in_dccm_r,
  input  [15:0] io_lsu_addr_r,
  input  [15:0] io_end_addr_r,
  input  [15:0] io_lsu_addr_m,
  input  [15:0] io_end_addr_m,
  input  [31:0] io_dccm_rdata_hi_r,
  input  [31:0] io_dccm_rdata_lo_r,
  input  [31:0] io_dccm_rdata_hi_m,
  input  [31:0] io_dccm_rdata_lo_m,
  input  [6:0]  io_dccm_data_ecc_hi_r,
  input  [6:0]  io_dccm_data_ecc_lo_r,
  input  [6:0]  io_dccm_data_ecc_hi_m,
  input  [6:0]  io_dccm_data_ecc_lo_m,
  input         io_ld_single_ecc_error_r,
  input         io_ld_single_ecc_error_r_ff,
  input         io_lsu_dccm_rden_m,
  input         io_addr_in_dccm_m,
  input         io_dma_dccm_wen,
  input  [31:0] io_dma_dccm_wdata_lo,
  input  [31:0] io_dma_dccm_wdata_hi,
  input         io_scan_mode,
  output [31:0] io_sec_data_hi_r,
  output [31:0] io_sec_data_lo_r,
  output [31:0] io_sec_data_hi_m,
  output [31:0] io_sec_data_lo_m,
  output [31:0] io_sec_data_hi_r_ff,
  output [31:0] io_sec_data_lo_r_ff,
  output [6:0]  io_dma_dccm_wdata_ecc_hi,
  output [6:0]  io_dma_dccm_wdata_ecc_lo,
  output [6:0]  io_stbuf_ecc_any,
  output [6:0]  io_sec_data_ecc_hi_r_ff,
  output [6:0]  io_sec_data_ecc_lo_r_ff,
  output        io_single_ecc_error_hi_r,
  output        io_single_ecc_error_lo_r,
  output        io_lsu_single_ecc_error_r,
  output        io_lsu_double_ecc_error_r,
  output        io_lsu_single_ecc_error_m,
  output        io_lsu_double_ecc_error_m
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
`endif // RANDOMIZE_REG_INIT
  wire  _T_96 = ^io_dccm_rdata_hi_m; // @[el2_lib.scala 329:30]
  wire  _T_97 = ^io_dccm_data_ecc_hi_m; // @[el2_lib.scala 329:44]
  wire  _T_98 = _T_96 ^ _T_97; // @[el2_lib.scala 329:35]
  wire [5:0] _T_106 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[26]}; // @[el2_lib.scala 329:78]
  wire  _T_107 = ^_T_106; // @[el2_lib.scala 329:85]
  wire  _T_108 = io_dccm_data_ecc_hi_m[5] ^ _T_107; // @[el2_lib.scala 329:72]
  wire [6:0] _T_115 = {io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[11]}; // @[el2_lib.scala 329:108]
  wire [14:0] _T_123 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_115}; // @[el2_lib.scala 329:108]
  wire  _T_124 = ^_T_123; // @[el2_lib.scala 329:115]
  wire  _T_125 = io_dccm_data_ecc_hi_m[4] ^ _T_124; // @[el2_lib.scala 329:102]
  wire [6:0] _T_132 = {io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[4]}; // @[el2_lib.scala 329:138]
  wire [14:0] _T_140 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_132}; // @[el2_lib.scala 329:138]
  wire  _T_141 = ^_T_140; // @[el2_lib.scala 329:145]
  wire  _T_142 = io_dccm_data_ecc_hi_m[3] ^ _T_141; // @[el2_lib.scala 329:132]
  wire [8:0] _T_151 = {io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[1]}; // @[el2_lib.scala 329:168]
  wire [17:0] _T_160 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_151}; // @[el2_lib.scala 329:168]
  wire  _T_161 = ^_T_160; // @[el2_lib.scala 329:175]
  wire  _T_162 = io_dccm_data_ecc_hi_m[2] ^ _T_161; // @[el2_lib.scala 329:162]
  wire [8:0] _T_171 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[0]}; // @[el2_lib.scala 329:198]
  wire [17:0] _T_180 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_171}; // @[el2_lib.scala 329:198]
  wire  _T_181 = ^_T_180; // @[el2_lib.scala 329:205]
  wire  _T_182 = io_dccm_data_ecc_hi_m[1] ^ _T_181; // @[el2_lib.scala 329:192]
  wire [8:0] _T_191 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[11],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[4],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[1],io_dccm_rdata_hi_m[0]}; // @[el2_lib.scala 329:228]
  wire [17:0] _T_200 = {io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[26],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[15],_T_191}; // @[el2_lib.scala 329:228]
  wire  _T_201 = ^_T_200; // @[el2_lib.scala 329:235]
  wire  _T_202 = io_dccm_data_ecc_hi_m[0] ^ _T_201; // @[el2_lib.scala 329:222]
  wire [6:0] _T_208 = {_T_98,_T_108,_T_125,_T_142,_T_162,_T_182,_T_202}; // @[Cat.scala 29:58]
  wire  _T_209 = _T_208 != 7'h0; // @[el2_lib.scala 330:44]
  wire  _T_1155 = ~io_dec_tlu_core_ecc_disable; // @[el2_lsu_ecc.scala 107:70]
  wire  _T_1162 = io_lsu_pkt_m_load | io_lsu_pkt_m_store; // @[el2_lsu_ecc.scala 125:60]
  wire  _T_1163 = io_lsu_pkt_m_valid & _T_1162; // @[el2_lsu_ecc.scala 125:39]
  wire  _T_1164 = _T_1163 & io_addr_in_dccm_m; // @[el2_lsu_ecc.scala 125:82]
  wire  is_ldst_m = _T_1164 & io_lsu_dccm_rden_m; // @[el2_lsu_ecc.scala 125:102]
  wire  ldst_dual_m = io_lsu_addr_m[2] != io_end_addr_m[2]; // @[el2_lsu_ecc.scala 124:39]
  wire  _T_1168 = ldst_dual_m | io_lsu_pkt_m_dma; // @[el2_lsu_ecc.scala 127:48]
  wire  _T_1169 = is_ldst_m & _T_1168; // @[el2_lsu_ecc.scala 127:33]
  wire  is_ldst_hi_m = _T_1169 & _T_1155; // @[el2_lsu_ecc.scala 127:68]
  wire  _T_210 = is_ldst_hi_m & _T_209; // @[el2_lib.scala 330:31]
  wire  single_ecc_error_hi_any = _T_210 & _T_208[6]; // @[el2_lib.scala 330:53]
  wire  _T_215 = ~_T_208[6]; // @[el2_lib.scala 331:55]
  wire  double_ecc_error_hi_any = _T_210 & _T_215; // @[el2_lib.scala 331:53]
  wire  _T_218 = _T_208[5:0] == 6'h1; // @[el2_lib.scala 335:44]
  wire  _T_220 = _T_208[5:0] == 6'h2; // @[el2_lib.scala 335:44]
  wire  _T_222 = _T_208[5:0] == 6'h3; // @[el2_lib.scala 335:44]
  wire  _T_224 = _T_208[5:0] == 6'h4; // @[el2_lib.scala 335:44]
  wire  _T_226 = _T_208[5:0] == 6'h5; // @[el2_lib.scala 335:44]
  wire  _T_228 = _T_208[5:0] == 6'h6; // @[el2_lib.scala 335:44]
  wire  _T_230 = _T_208[5:0] == 6'h7; // @[el2_lib.scala 335:44]
  wire  _T_232 = _T_208[5:0] == 6'h8; // @[el2_lib.scala 335:44]
  wire  _T_234 = _T_208[5:0] == 6'h9; // @[el2_lib.scala 335:44]
  wire  _T_236 = _T_208[5:0] == 6'ha; // @[el2_lib.scala 335:44]
  wire  _T_238 = _T_208[5:0] == 6'hb; // @[el2_lib.scala 335:44]
  wire  _T_240 = _T_208[5:0] == 6'hc; // @[el2_lib.scala 335:44]
  wire  _T_242 = _T_208[5:0] == 6'hd; // @[el2_lib.scala 335:44]
  wire  _T_244 = _T_208[5:0] == 6'he; // @[el2_lib.scala 335:44]
  wire  _T_246 = _T_208[5:0] == 6'hf; // @[el2_lib.scala 335:44]
  wire  _T_248 = _T_208[5:0] == 6'h10; // @[el2_lib.scala 335:44]
  wire  _T_250 = _T_208[5:0] == 6'h11; // @[el2_lib.scala 335:44]
  wire  _T_252 = _T_208[5:0] == 6'h12; // @[el2_lib.scala 335:44]
  wire  _T_254 = _T_208[5:0] == 6'h13; // @[el2_lib.scala 335:44]
  wire  _T_256 = _T_208[5:0] == 6'h14; // @[el2_lib.scala 335:44]
  wire  _T_258 = _T_208[5:0] == 6'h15; // @[el2_lib.scala 335:44]
  wire  _T_260 = _T_208[5:0] == 6'h16; // @[el2_lib.scala 335:44]
  wire  _T_262 = _T_208[5:0] == 6'h17; // @[el2_lib.scala 335:44]
  wire  _T_264 = _T_208[5:0] == 6'h18; // @[el2_lib.scala 335:44]
  wire  _T_266 = _T_208[5:0] == 6'h19; // @[el2_lib.scala 335:44]
  wire  _T_268 = _T_208[5:0] == 6'h1a; // @[el2_lib.scala 335:44]
  wire  _T_270 = _T_208[5:0] == 6'h1b; // @[el2_lib.scala 335:44]
  wire  _T_272 = _T_208[5:0] == 6'h1c; // @[el2_lib.scala 335:44]
  wire  _T_274 = _T_208[5:0] == 6'h1d; // @[el2_lib.scala 335:44]
  wire  _T_276 = _T_208[5:0] == 6'h1e; // @[el2_lib.scala 335:44]
  wire  _T_278 = _T_208[5:0] == 6'h1f; // @[el2_lib.scala 335:44]
  wire  _T_280 = _T_208[5:0] == 6'h20; // @[el2_lib.scala 335:44]
  wire  _T_282 = _T_208[5:0] == 6'h21; // @[el2_lib.scala 335:44]
  wire  _T_284 = _T_208[5:0] == 6'h22; // @[el2_lib.scala 335:44]
  wire  _T_286 = _T_208[5:0] == 6'h23; // @[el2_lib.scala 335:44]
  wire  _T_288 = _T_208[5:0] == 6'h24; // @[el2_lib.scala 335:44]
  wire  _T_290 = _T_208[5:0] == 6'h25; // @[el2_lib.scala 335:44]
  wire  _T_292 = _T_208[5:0] == 6'h26; // @[el2_lib.scala 335:44]
  wire  _T_294 = _T_208[5:0] == 6'h27; // @[el2_lib.scala 335:44]
  wire [7:0] _T_309 = {io_dccm_data_ecc_hi_m[3],io_dccm_rdata_hi_m[3:1],io_dccm_data_ecc_hi_m[2],io_dccm_rdata_hi_m[0],io_dccm_data_ecc_hi_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_315 = {io_dccm_data_ecc_hi_m[6],io_dccm_rdata_hi_m[31:26],io_dccm_data_ecc_hi_m[5],io_dccm_rdata_hi_m[25:11],io_dccm_data_ecc_hi_m[4],io_dccm_rdata_hi_m[10:4],_T_309}; // @[Cat.scala 29:58]
  wire [9:0] _T_333 = {_T_254,_T_252,_T_250,_T_248,_T_246,_T_244,_T_242,_T_240,_T_238,_T_236}; // @[el2_lib.scala 338:69]
  wire [18:0] _T_334 = {_T_333,_T_234,_T_232,_T_230,_T_228,_T_226,_T_224,_T_222,_T_220,_T_218}; // @[el2_lib.scala 338:69]
  wire [9:0] _T_343 = {_T_274,_T_272,_T_270,_T_268,_T_266,_T_264,_T_262,_T_260,_T_258,_T_256}; // @[el2_lib.scala 338:69]
  wire [9:0] _T_352 = {_T_294,_T_292,_T_290,_T_288,_T_286,_T_284,_T_282,_T_280,_T_278,_T_276}; // @[el2_lib.scala 338:69]
  wire [38:0] _T_354 = {_T_352,_T_343,_T_334}; // @[el2_lib.scala 338:69]
  wire [38:0] _T_355 = _T_354 ^ _T_315; // @[el2_lib.scala 338:76]
  wire [38:0] _T_356 = single_ecc_error_hi_any ? _T_355 : _T_315; // @[el2_lib.scala 338:31]
  wire [3:0] _T_362 = {_T_356[6:4],_T_356[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_364 = {_T_356[37:32],_T_356[30:16],_T_356[14:8]}; // @[Cat.scala 29:58]
  wire  _T_474 = ^io_dccm_rdata_lo_m; // @[el2_lib.scala 329:30]
  wire  _T_475 = ^io_dccm_data_ecc_lo_m; // @[el2_lib.scala 329:44]
  wire  _T_476 = _T_474 ^ _T_475; // @[el2_lib.scala 329:35]
  wire [5:0] _T_484 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[26]}; // @[el2_lib.scala 329:78]
  wire  _T_485 = ^_T_484; // @[el2_lib.scala 329:85]
  wire  _T_486 = io_dccm_data_ecc_lo_m[5] ^ _T_485; // @[el2_lib.scala 329:72]
  wire [6:0] _T_493 = {io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[11]}; // @[el2_lib.scala 329:108]
  wire [14:0] _T_501 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_493}; // @[el2_lib.scala 329:108]
  wire  _T_502 = ^_T_501; // @[el2_lib.scala 329:115]
  wire  _T_503 = io_dccm_data_ecc_lo_m[4] ^ _T_502; // @[el2_lib.scala 329:102]
  wire [6:0] _T_510 = {io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[4]}; // @[el2_lib.scala 329:138]
  wire [14:0] _T_518 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_510}; // @[el2_lib.scala 329:138]
  wire  _T_519 = ^_T_518; // @[el2_lib.scala 329:145]
  wire  _T_520 = io_dccm_data_ecc_lo_m[3] ^ _T_519; // @[el2_lib.scala 329:132]
  wire [8:0] _T_529 = {io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[1]}; // @[el2_lib.scala 329:168]
  wire [17:0] _T_538 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_529}; // @[el2_lib.scala 329:168]
  wire  _T_539 = ^_T_538; // @[el2_lib.scala 329:175]
  wire  _T_540 = io_dccm_data_ecc_lo_m[2] ^ _T_539; // @[el2_lib.scala 329:162]
  wire [8:0] _T_549 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[0]}; // @[el2_lib.scala 329:198]
  wire [17:0] _T_558 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_549}; // @[el2_lib.scala 329:198]
  wire  _T_559 = ^_T_558; // @[el2_lib.scala 329:205]
  wire  _T_560 = io_dccm_data_ecc_lo_m[1] ^ _T_559; // @[el2_lib.scala 329:192]
  wire [8:0] _T_569 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[11],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[4],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[1],io_dccm_rdata_lo_m[0]}; // @[el2_lib.scala 329:228]
  wire [17:0] _T_578 = {io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[26],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[15],_T_569}; // @[el2_lib.scala 329:228]
  wire  _T_579 = ^_T_578; // @[el2_lib.scala 329:235]
  wire  _T_580 = io_dccm_data_ecc_lo_m[0] ^ _T_579; // @[el2_lib.scala 329:222]
  wire [6:0] _T_586 = {_T_476,_T_486,_T_503,_T_520,_T_540,_T_560,_T_580}; // @[Cat.scala 29:58]
  wire  _T_587 = _T_586 != 7'h0; // @[el2_lib.scala 330:44]
  wire  is_ldst_lo_m = is_ldst_m & _T_1155; // @[el2_lsu_ecc.scala 126:33]
  wire  _T_588 = is_ldst_lo_m & _T_587; // @[el2_lib.scala 330:31]
  wire  single_ecc_error_lo_any = _T_588 & _T_586[6]; // @[el2_lib.scala 330:53]
  wire  _T_593 = ~_T_586[6]; // @[el2_lib.scala 331:55]
  wire  double_ecc_error_lo_any = _T_588 & _T_593; // @[el2_lib.scala 331:53]
  wire  _T_596 = _T_586[5:0] == 6'h1; // @[el2_lib.scala 335:44]
  wire  _T_598 = _T_586[5:0] == 6'h2; // @[el2_lib.scala 335:44]
  wire  _T_600 = _T_586[5:0] == 6'h3; // @[el2_lib.scala 335:44]
  wire  _T_602 = _T_586[5:0] == 6'h4; // @[el2_lib.scala 335:44]
  wire  _T_604 = _T_586[5:0] == 6'h5; // @[el2_lib.scala 335:44]
  wire  _T_606 = _T_586[5:0] == 6'h6; // @[el2_lib.scala 335:44]
  wire  _T_608 = _T_586[5:0] == 6'h7; // @[el2_lib.scala 335:44]
  wire  _T_610 = _T_586[5:0] == 6'h8; // @[el2_lib.scala 335:44]
  wire  _T_612 = _T_586[5:0] == 6'h9; // @[el2_lib.scala 335:44]
  wire  _T_614 = _T_586[5:0] == 6'ha; // @[el2_lib.scala 335:44]
  wire  _T_616 = _T_586[5:0] == 6'hb; // @[el2_lib.scala 335:44]
  wire  _T_618 = _T_586[5:0] == 6'hc; // @[el2_lib.scala 335:44]
  wire  _T_620 = _T_586[5:0] == 6'hd; // @[el2_lib.scala 335:44]
  wire  _T_622 = _T_586[5:0] == 6'he; // @[el2_lib.scala 335:44]
  wire  _T_624 = _T_586[5:0] == 6'hf; // @[el2_lib.scala 335:44]
  wire  _T_626 = _T_586[5:0] == 6'h10; // @[el2_lib.scala 335:44]
  wire  _T_628 = _T_586[5:0] == 6'h11; // @[el2_lib.scala 335:44]
  wire  _T_630 = _T_586[5:0] == 6'h12; // @[el2_lib.scala 335:44]
  wire  _T_632 = _T_586[5:0] == 6'h13; // @[el2_lib.scala 335:44]
  wire  _T_634 = _T_586[5:0] == 6'h14; // @[el2_lib.scala 335:44]
  wire  _T_636 = _T_586[5:0] == 6'h15; // @[el2_lib.scala 335:44]
  wire  _T_638 = _T_586[5:0] == 6'h16; // @[el2_lib.scala 335:44]
  wire  _T_640 = _T_586[5:0] == 6'h17; // @[el2_lib.scala 335:44]
  wire  _T_642 = _T_586[5:0] == 6'h18; // @[el2_lib.scala 335:44]
  wire  _T_644 = _T_586[5:0] == 6'h19; // @[el2_lib.scala 335:44]
  wire  _T_646 = _T_586[5:0] == 6'h1a; // @[el2_lib.scala 335:44]
  wire  _T_648 = _T_586[5:0] == 6'h1b; // @[el2_lib.scala 335:44]
  wire  _T_650 = _T_586[5:0] == 6'h1c; // @[el2_lib.scala 335:44]
  wire  _T_652 = _T_586[5:0] == 6'h1d; // @[el2_lib.scala 335:44]
  wire  _T_654 = _T_586[5:0] == 6'h1e; // @[el2_lib.scala 335:44]
  wire  _T_656 = _T_586[5:0] == 6'h1f; // @[el2_lib.scala 335:44]
  wire  _T_658 = _T_586[5:0] == 6'h20; // @[el2_lib.scala 335:44]
  wire  _T_660 = _T_586[5:0] == 6'h21; // @[el2_lib.scala 335:44]
  wire  _T_662 = _T_586[5:0] == 6'h22; // @[el2_lib.scala 335:44]
  wire  _T_664 = _T_586[5:0] == 6'h23; // @[el2_lib.scala 335:44]
  wire  _T_666 = _T_586[5:0] == 6'h24; // @[el2_lib.scala 335:44]
  wire  _T_668 = _T_586[5:0] == 6'h25; // @[el2_lib.scala 335:44]
  wire  _T_670 = _T_586[5:0] == 6'h26; // @[el2_lib.scala 335:44]
  wire  _T_672 = _T_586[5:0] == 6'h27; // @[el2_lib.scala 335:44]
  wire [7:0] _T_687 = {io_dccm_data_ecc_lo_m[3],io_dccm_rdata_lo_m[3:1],io_dccm_data_ecc_lo_m[2],io_dccm_rdata_lo_m[0],io_dccm_data_ecc_lo_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_693 = {io_dccm_data_ecc_lo_m[6],io_dccm_rdata_lo_m[31:26],io_dccm_data_ecc_lo_m[5],io_dccm_rdata_lo_m[25:11],io_dccm_data_ecc_lo_m[4],io_dccm_rdata_lo_m[10:4],_T_687}; // @[Cat.scala 29:58]
  wire [9:0] _T_711 = {_T_632,_T_630,_T_628,_T_626,_T_624,_T_622,_T_620,_T_618,_T_616,_T_614}; // @[el2_lib.scala 338:69]
  wire [18:0] _T_712 = {_T_711,_T_612,_T_610,_T_608,_T_606,_T_604,_T_602,_T_600,_T_598,_T_596}; // @[el2_lib.scala 338:69]
  wire [9:0] _T_721 = {_T_652,_T_650,_T_648,_T_646,_T_644,_T_642,_T_640,_T_638,_T_636,_T_634}; // @[el2_lib.scala 338:69]
  wire [9:0] _T_730 = {_T_672,_T_670,_T_668,_T_666,_T_664,_T_662,_T_660,_T_658,_T_656,_T_654}; // @[el2_lib.scala 338:69]
  wire [38:0] _T_732 = {_T_730,_T_721,_T_712}; // @[el2_lib.scala 338:69]
  wire [38:0] _T_733 = _T_732 ^ _T_693; // @[el2_lib.scala 338:76]
  wire [38:0] _T_734 = single_ecc_error_lo_any ? _T_733 : _T_693; // @[el2_lib.scala 338:31]
  wire [3:0] _T_740 = {_T_734[6:4],_T_734[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_742 = {_T_734[37:32],_T_734[30:16],_T_734[14:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1182 = io_dma_dccm_wen ? io_dma_dccm_wdata_lo : io_stbuf_data_any; // @[el2_lsu_ecc.scala 149:89]
  wire [31:0] dccm_wdata_lo_any = io_ld_single_ecc_error_r_ff ? io_sec_data_lo_r_ff : _T_1182; // @[el2_lsu_ecc.scala 149:29]
  wire [5:0] _T_856 = {dccm_wdata_lo_any[31],dccm_wdata_lo_any[30],dccm_wdata_lo_any[29],dccm_wdata_lo_any[28],dccm_wdata_lo_any[27],dccm_wdata_lo_any[26]}; // @[el2_lib.scala 280:22]
  wire  _T_857 = ^_T_856; // @[el2_lib.scala 280:29]
  wire [6:0] _T_863 = {dccm_wdata_lo_any[17],dccm_wdata_lo_any[16],dccm_wdata_lo_any[15],dccm_wdata_lo_any[14],dccm_wdata_lo_any[13],dccm_wdata_lo_any[12],dccm_wdata_lo_any[11]}; // @[el2_lib.scala 280:40]
  wire [14:0] _T_871 = {dccm_wdata_lo_any[25],dccm_wdata_lo_any[24],dccm_wdata_lo_any[23],dccm_wdata_lo_any[22],dccm_wdata_lo_any[21],dccm_wdata_lo_any[20],dccm_wdata_lo_any[19],dccm_wdata_lo_any[18],_T_863}; // @[el2_lib.scala 280:40]
  wire  _T_872 = ^_T_871; // @[el2_lib.scala 280:47]
  wire [6:0] _T_878 = {dccm_wdata_lo_any[10],dccm_wdata_lo_any[9],dccm_wdata_lo_any[8],dccm_wdata_lo_any[7],dccm_wdata_lo_any[6],dccm_wdata_lo_any[5],dccm_wdata_lo_any[4]}; // @[el2_lib.scala 280:58]
  wire [14:0] _T_886 = {dccm_wdata_lo_any[25],dccm_wdata_lo_any[24],dccm_wdata_lo_any[23],dccm_wdata_lo_any[22],dccm_wdata_lo_any[21],dccm_wdata_lo_any[20],dccm_wdata_lo_any[19],dccm_wdata_lo_any[18],_T_878}; // @[el2_lib.scala 280:58]
  wire  _T_887 = ^_T_886; // @[el2_lib.scala 280:65]
  wire [8:0] _T_895 = {dccm_wdata_lo_any[15],dccm_wdata_lo_any[14],dccm_wdata_lo_any[10],dccm_wdata_lo_any[9],dccm_wdata_lo_any[8],dccm_wdata_lo_any[7],dccm_wdata_lo_any[3],dccm_wdata_lo_any[2],dccm_wdata_lo_any[1]}; // @[el2_lib.scala 280:76]
  wire [17:0] _T_904 = {dccm_wdata_lo_any[31],dccm_wdata_lo_any[30],dccm_wdata_lo_any[29],dccm_wdata_lo_any[25],dccm_wdata_lo_any[24],dccm_wdata_lo_any[23],dccm_wdata_lo_any[22],dccm_wdata_lo_any[17],dccm_wdata_lo_any[16],_T_895}; // @[el2_lib.scala 280:76]
  wire  _T_905 = ^_T_904; // @[el2_lib.scala 280:83]
  wire [8:0] _T_913 = {dccm_wdata_lo_any[13],dccm_wdata_lo_any[12],dccm_wdata_lo_any[10],dccm_wdata_lo_any[9],dccm_wdata_lo_any[6],dccm_wdata_lo_any[5],dccm_wdata_lo_any[3],dccm_wdata_lo_any[2],dccm_wdata_lo_any[0]}; // @[el2_lib.scala 280:94]
  wire [17:0] _T_922 = {dccm_wdata_lo_any[31],dccm_wdata_lo_any[28],dccm_wdata_lo_any[27],dccm_wdata_lo_any[25],dccm_wdata_lo_any[24],dccm_wdata_lo_any[21],dccm_wdata_lo_any[20],dccm_wdata_lo_any[17],dccm_wdata_lo_any[16],_T_913}; // @[el2_lib.scala 280:94]
  wire  _T_923 = ^_T_922; // @[el2_lib.scala 280:101]
  wire [8:0] _T_931 = {dccm_wdata_lo_any[13],dccm_wdata_lo_any[11],dccm_wdata_lo_any[10],dccm_wdata_lo_any[8],dccm_wdata_lo_any[6],dccm_wdata_lo_any[4],dccm_wdata_lo_any[3],dccm_wdata_lo_any[1],dccm_wdata_lo_any[0]}; // @[el2_lib.scala 280:112]
  wire [17:0] _T_940 = {dccm_wdata_lo_any[30],dccm_wdata_lo_any[28],dccm_wdata_lo_any[26],dccm_wdata_lo_any[25],dccm_wdata_lo_any[23],dccm_wdata_lo_any[21],dccm_wdata_lo_any[19],dccm_wdata_lo_any[17],dccm_wdata_lo_any[15],_T_931}; // @[el2_lib.scala 280:112]
  wire  _T_941 = ^_T_940; // @[el2_lib.scala 280:119]
  wire [5:0] _T_946 = {_T_857,_T_872,_T_887,_T_905,_T_923,_T_941}; // @[Cat.scala 29:58]
  wire  _T_947 = ^dccm_wdata_lo_any; // @[el2_lib.scala 281:27]
  wire  _T_948 = ^_T_946; // @[el2_lib.scala 281:37]
  wire  _T_949 = _T_947 ^ _T_948; // @[el2_lib.scala 281:32]
  wire [31:0] _T_1186 = io_dma_dccm_wen ? io_dma_dccm_wdata_hi : io_stbuf_data_any; // @[el2_lsu_ecc.scala 150:89]
  wire [31:0] dccm_wdata_hi_any = io_ld_single_ecc_error_r_ff ? io_sec_data_hi_r_ff : _T_1186; // @[el2_lsu_ecc.scala 150:29]
  wire [5:0] _T_1050 = {dccm_wdata_hi_any[31],dccm_wdata_hi_any[30],dccm_wdata_hi_any[29],dccm_wdata_hi_any[28],dccm_wdata_hi_any[27],dccm_wdata_hi_any[26]}; // @[el2_lib.scala 280:22]
  wire  _T_1051 = ^_T_1050; // @[el2_lib.scala 280:29]
  wire [6:0] _T_1057 = {dccm_wdata_hi_any[17],dccm_wdata_hi_any[16],dccm_wdata_hi_any[15],dccm_wdata_hi_any[14],dccm_wdata_hi_any[13],dccm_wdata_hi_any[12],dccm_wdata_hi_any[11]}; // @[el2_lib.scala 280:40]
  wire [14:0] _T_1065 = {dccm_wdata_hi_any[25],dccm_wdata_hi_any[24],dccm_wdata_hi_any[23],dccm_wdata_hi_any[22],dccm_wdata_hi_any[21],dccm_wdata_hi_any[20],dccm_wdata_hi_any[19],dccm_wdata_hi_any[18],_T_1057}; // @[el2_lib.scala 280:40]
  wire  _T_1066 = ^_T_1065; // @[el2_lib.scala 280:47]
  wire [6:0] _T_1072 = {dccm_wdata_hi_any[10],dccm_wdata_hi_any[9],dccm_wdata_hi_any[8],dccm_wdata_hi_any[7],dccm_wdata_hi_any[6],dccm_wdata_hi_any[5],dccm_wdata_hi_any[4]}; // @[el2_lib.scala 280:58]
  wire [14:0] _T_1080 = {dccm_wdata_hi_any[25],dccm_wdata_hi_any[24],dccm_wdata_hi_any[23],dccm_wdata_hi_any[22],dccm_wdata_hi_any[21],dccm_wdata_hi_any[20],dccm_wdata_hi_any[19],dccm_wdata_hi_any[18],_T_1072}; // @[el2_lib.scala 280:58]
  wire  _T_1081 = ^_T_1080; // @[el2_lib.scala 280:65]
  wire [8:0] _T_1089 = {dccm_wdata_hi_any[15],dccm_wdata_hi_any[14],dccm_wdata_hi_any[10],dccm_wdata_hi_any[9],dccm_wdata_hi_any[8],dccm_wdata_hi_any[7],dccm_wdata_hi_any[3],dccm_wdata_hi_any[2],dccm_wdata_hi_any[1]}; // @[el2_lib.scala 280:76]
  wire [17:0] _T_1098 = {dccm_wdata_hi_any[31],dccm_wdata_hi_any[30],dccm_wdata_hi_any[29],dccm_wdata_hi_any[25],dccm_wdata_hi_any[24],dccm_wdata_hi_any[23],dccm_wdata_hi_any[22],dccm_wdata_hi_any[17],dccm_wdata_hi_any[16],_T_1089}; // @[el2_lib.scala 280:76]
  wire  _T_1099 = ^_T_1098; // @[el2_lib.scala 280:83]
  wire [8:0] _T_1107 = {dccm_wdata_hi_any[13],dccm_wdata_hi_any[12],dccm_wdata_hi_any[10],dccm_wdata_hi_any[9],dccm_wdata_hi_any[6],dccm_wdata_hi_any[5],dccm_wdata_hi_any[3],dccm_wdata_hi_any[2],dccm_wdata_hi_any[0]}; // @[el2_lib.scala 280:94]
  wire [17:0] _T_1116 = {dccm_wdata_hi_any[31],dccm_wdata_hi_any[28],dccm_wdata_hi_any[27],dccm_wdata_hi_any[25],dccm_wdata_hi_any[24],dccm_wdata_hi_any[21],dccm_wdata_hi_any[20],dccm_wdata_hi_any[17],dccm_wdata_hi_any[16],_T_1107}; // @[el2_lib.scala 280:94]
  wire  _T_1117 = ^_T_1116; // @[el2_lib.scala 280:101]
  wire [8:0] _T_1125 = {dccm_wdata_hi_any[13],dccm_wdata_hi_any[11],dccm_wdata_hi_any[10],dccm_wdata_hi_any[8],dccm_wdata_hi_any[6],dccm_wdata_hi_any[4],dccm_wdata_hi_any[3],dccm_wdata_hi_any[1],dccm_wdata_hi_any[0]}; // @[el2_lib.scala 280:112]
  wire [17:0] _T_1134 = {dccm_wdata_hi_any[30],dccm_wdata_hi_any[28],dccm_wdata_hi_any[26],dccm_wdata_hi_any[25],dccm_wdata_hi_any[23],dccm_wdata_hi_any[21],dccm_wdata_hi_any[19],dccm_wdata_hi_any[17],dccm_wdata_hi_any[15],_T_1125}; // @[el2_lib.scala 280:112]
  wire  _T_1135 = ^_T_1134; // @[el2_lib.scala 280:119]
  wire [5:0] _T_1140 = {_T_1051,_T_1066,_T_1081,_T_1099,_T_1117,_T_1135}; // @[Cat.scala 29:58]
  wire  _T_1141 = ^dccm_wdata_hi_any; // @[el2_lib.scala 281:27]
  wire  _T_1142 = ^_T_1140; // @[el2_lib.scala 281:37]
  wire  _T_1143 = _T_1141 ^ _T_1142; // @[el2_lib.scala 281:32]
  reg  _T_1174; // @[el2_lsu_ecc.scala 141:72]
  reg  _T_1175; // @[el2_lsu_ecc.scala 142:72]
  reg  _T_1176; // @[el2_lsu_ecc.scala 143:72]
  reg  _T_1177; // @[el2_lsu_ecc.scala 144:72]
  reg [31:0] _T_1178; // @[el2_lsu_ecc.scala 145:72]
  reg [31:0] _T_1179; // @[el2_lsu_ecc.scala 146:72]
  reg [31:0] _T_1188; // @[Reg.scala 27:20]
  reg [31:0] _T_1189; // @[Reg.scala 27:20]
  assign io_sec_data_hi_r = _T_1178; // @[el2_lsu_ecc.scala 114:24 el2_lsu_ecc.scala 145:62]
  assign io_sec_data_lo_r = _T_1179; // @[el2_lsu_ecc.scala 117:27 el2_lsu_ecc.scala 146:62]
  assign io_sec_data_hi_m = {_T_364,_T_362}; // @[el2_lsu_ecc.scala 90:32 el2_lsu_ecc.scala 134:27]
  assign io_sec_data_lo_m = {_T_742,_T_740}; // @[el2_lsu_ecc.scala 91:32 el2_lsu_ecc.scala 136:27]
  assign io_sec_data_hi_r_ff = _T_1188; // @[el2_lsu_ecc.scala 157:23]
  assign io_sec_data_lo_r_ff = _T_1189; // @[el2_lsu_ecc.scala 158:23]
  assign io_dma_dccm_wdata_ecc_hi = {_T_1143,_T_1140}; // @[el2_lsu_ecc.scala 154:30]
  assign io_dma_dccm_wdata_ecc_lo = {_T_949,_T_946}; // @[el2_lsu_ecc.scala 155:30]
  assign io_stbuf_ecc_any = {_T_949,_T_946}; // @[el2_lsu_ecc.scala 153:30]
  assign io_sec_data_ecc_hi_r_ff = {_T_1143,_T_1140}; // @[el2_lsu_ecc.scala 151:30]
  assign io_sec_data_ecc_lo_r_ff = {_T_949,_T_946}; // @[el2_lsu_ecc.scala 152:30]
  assign io_single_ecc_error_hi_r = _T_1177; // @[el2_lsu_ecc.scala 115:33 el2_lsu_ecc.scala 144:62]
  assign io_single_ecc_error_lo_r = _T_1176; // @[el2_lsu_ecc.scala 118:33 el2_lsu_ecc.scala 143:62]
  assign io_lsu_single_ecc_error_r = _T_1174; // @[el2_lsu_ecc.scala 120:33 el2_lsu_ecc.scala 141:62]
  assign io_lsu_double_ecc_error_r = _T_1175; // @[el2_lsu_ecc.scala 121:33 el2_lsu_ecc.scala 142:62]
  assign io_lsu_single_ecc_error_m = single_ecc_error_hi_any | single_ecc_error_lo_any; // @[el2_lsu_ecc.scala 92:30 el2_lsu_ecc.scala 138:33]
  assign io_lsu_double_ecc_error_m = double_ecc_error_hi_any | double_ecc_error_lo_any; // @[el2_lsu_ecc.scala 93:30 el2_lsu_ecc.scala 139:33]
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
  _T_1174 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1175 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1176 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1177 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1178 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1179 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1188 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1189 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1174 = 1'h0;
  end
  if (reset) begin
    _T_1175 = 1'h0;
  end
  if (reset) begin
    _T_1176 = 1'h0;
  end
  if (reset) begin
    _T_1177 = 1'h0;
  end
  if (reset) begin
    _T_1178 = 32'h0;
  end
  if (reset) begin
    _T_1179 = 32'h0;
  end
  if (reset) begin
    _T_1188 = 32'h0;
  end
  if (reset) begin
    _T_1189 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1174 <= 1'h0;
    end else begin
      _T_1174 <= io_lsu_single_ecc_error_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1175 <= 1'h0;
    end else begin
      _T_1175 <= io_lsu_double_ecc_error_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1176 <= 1'h0;
    end else begin
      _T_1176 <= _T_588 & _T_586[6];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1177 <= 1'h0;
    end else begin
      _T_1177 <= _T_210 & _T_208[6];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1178 <= 32'h0;
    end else begin
      _T_1178 <= io_sec_data_hi_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1179 <= 32'h0;
    end else begin
      _T_1179 <= io_sec_data_lo_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_1188 <= 32'h0;
    end else if (io_ld_single_ecc_error_r) begin
      _T_1188 <= io_sec_data_hi_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_1189 <= 32'h0;
    end else if (io_ld_single_ecc_error_r) begin
      _T_1189 <= io_sec_data_lo_r;
    end
  end
endmodule
