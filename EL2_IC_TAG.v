module EL2_IC_TAG(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_dec_tlu_core_ecc_disable,
  input  [28:0] io_ic_rw_addr,
  input  [1:0]  io_ic_wr_en,
  input  [1:0]  io_ic_tag_valid,
  input         io_ic_rd_en,
  input  [9:0]  io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  output [25:0] io_ictag_debug_rd_data,
  input  [70:0] io_ic_debug_wr_data,
  output [1:0]  io_ic_rd_hit,
  output        io_ic_tag_perr,
  input         io_scan_mode
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [25:0] tag_mem_0 [0:127]; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_0__T_250_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_0__T_250_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_0__T_254_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_0__T_254_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_0__T_238_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_0__T_238_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire  tag_mem_0__T_238_mask; // @[el2_ifu_ic_mem.scala 97:20]
  wire  tag_mem_0__T_238_en; // @[el2_ifu_ic_mem.scala 97:20]
  reg [25:0] tag_mem_1 [0:127]; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_1__T_250_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_1__T_250_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_1__T_254_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_1__T_254_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_1__T_238_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_1__T_238_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire  tag_mem_1__T_238_mask; // @[el2_ifu_ic_mem.scala 97:20]
  wire  tag_mem_1__T_238_en; // @[el2_ifu_ic_mem.scala 97:20]
  wire  _T_1 = io_ic_rw_addr[2:1] == 2'h1; // @[el2_ifu_ic_mem.scala 71:95]
  wire [1:0] _T_3 = _T_1 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_tag_wren = io_ic_wr_en & _T_3; // @[el2_ifu_ic_mem.scala 71:33]
  wire  _T_4 = io_ic_rd_en | io_clk_override; // @[el2_ifu_ic_mem.scala 72:55]
  wire [1:0] _T_6 = _T_4 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_7 = _T_6 | io_ic_wr_en; // @[el2_ifu_ic_mem.scala 72:73]
  wire  _T_14 = io_ic_debug_wr_en & io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 80:65]
  wire [1:0] _T_16 = _T_14 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_debug_wr_way_en = _T_16 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 80:90]
  wire [1:0] _T_8 = _T_7 | ic_debug_wr_way_en; // @[el2_ifu_ic_mem.scala 72:87]
  wire  _T_10 = io_ic_debug_rd_en & io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 79:65]
  wire [1:0] _T_12 = _T_10 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_debug_rd_way_en = _T_12 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 79:90]
  wire [1:0] ic_tag_clken = _T_8 | ic_debug_rd_way_en; // @[el2_ifu_ic_mem.scala 72:108]
  reg  ic_rd_en_ff; // @[el2_ifu_ic_mem.scala 74:28]
  reg [18:0] ic_rw_addr_ff; // @[el2_ifu_ic_mem.scala 75:30]
  wire [1:0] ic_tag_wren_q = ic_tag_wren | ic_debug_wr_way_en; // @[el2_ifu_ic_mem.scala 82:35]
  wire [31:0] _T_20 = {13'h0,io_ic_rw_addr[28:10]}; // @[Cat.scala 29:58]
  wire [8:0] _T_124 = {_T_20[16],_T_20[14],_T_20[12],_T_20[10],_T_20[8],_T_20[6],_T_20[5],_T_20[3],_T_20[1]}; // @[el2_lib.scala 257:22]
  wire [17:0] _T_133 = {_T_20[31],_T_20[30],_T_20[28],_T_20[27],_T_20[25],_T_20[23],_T_20[21],_T_20[20],_T_20[18],_T_124}; // @[el2_lib.scala 257:22]
  wire  _T_134 = ^_T_133; // @[el2_lib.scala 257:29]
  wire [8:0] _T_142 = {_T_20[15],_T_20[14],_T_20[11],_T_20[10],_T_20[7],_T_20[6],_T_20[4],_T_20[3],_T_20[0]}; // @[el2_lib.scala 257:39]
  wire [17:0] _T_151 = {_T_20[31],_T_20[29],_T_20[28],_T_20[26],_T_20[25],_T_20[22],_T_20[21],_T_20[19],_T_20[18],_T_142}; // @[el2_lib.scala 257:39]
  wire  _T_152 = ^_T_151; // @[el2_lib.scala 257:46]
  wire [8:0] _T_160 = {_T_20[15],_T_20[14],_T_20[9],_T_20[8],_T_20[7],_T_20[6],_T_20[2],_T_20[1],_T_20[0]}; // @[el2_lib.scala 257:56]
  wire [17:0] _T_169 = {_T_20[30],_T_20[29],_T_20[28],_T_20[24],_T_20[23],_T_20[22],_T_20[21],_T_20[17],_T_20[16],_T_160}; // @[el2_lib.scala 257:56]
  wire  _T_170 = ^_T_169; // @[el2_lib.scala 257:63]
  wire [6:0] _T_176 = {_T_20[12],_T_20[11],_T_20[10],_T_20[9],_T_20[8],_T_20[7],_T_20[6]}; // @[el2_lib.scala 257:73]
  wire [14:0] _T_184 = {_T_20[27],_T_20[26],_T_20[25],_T_20[24],_T_20[23],_T_20[22],_T_20[21],_T_20[13],_T_176}; // @[el2_lib.scala 257:73]
  wire  _T_185 = ^_T_184; // @[el2_lib.scala 257:80]
  wire [14:0] _T_199 = {_T_20[20],_T_20[19],_T_20[18],_T_20[17],_T_20[16],_T_20[15],_T_20[14],_T_20[13],_T_176}; // @[el2_lib.scala 257:90]
  wire  _T_200 = ^_T_199; // @[el2_lib.scala 257:97]
  wire [5:0] _T_205 = {_T_20[5],_T_20[4],_T_20[3],_T_20[2],_T_20[1],_T_20[0]}; // @[el2_lib.scala 257:107]
  wire  _T_206 = ^_T_205; // @[el2_lib.scala 257:114]
  wire [5:0] _T_211 = {_T_134,_T_152,_T_170,_T_185,_T_200,_T_206}; // @[Cat.scala 29:58]
  wire  _T_212 = ^_T_20; // @[el2_lib.scala 258:13]
  wire  _T_213 = ^_T_211; // @[el2_lib.scala 258:23]
  wire  _T_214 = _T_212 ^ _T_213; // @[el2_lib.scala 258:18]
  wire [6:0] ic_tag_ecc = {_T_214,_T_134,_T_152,_T_170,_T_185,_T_200,_T_206}; // @[Cat.scala 29:58]
  wire [25:0] _T_221 = {io_ic_debug_wr_data[68:64],io_ic_debug_wr_data[31:11]}; // @[Cat.scala 29:58]
  wire [25:0] _T_226 = {ic_tag_ecc[4:0],2'h0,io_ic_rw_addr[28:10]}; // @[Cat.scala 29:58]
  wire  _T_227 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 93:45]
  wire [28:0] ic_rw_addr_q = _T_227 ? {{22'd0}, io_ic_debug_addr[9:3]} : io_ic_rw_addr; // @[el2_ifu_ic_mem.scala 93:25]
  reg [1:0] ic_debug_rd_way_en_ff; // @[el2_ifu_ic_mem.scala 95:38]
  wire  _T_240 = ~ic_tag_wren_q[0]; // @[el2_ifu_ic_mem.scala 102:59]
  wire  read_enable_0 = _T_240 & ic_tag_clken[0]; // @[el2_ifu_ic_mem.scala 102:77]
  wire  _T_244 = ~ic_tag_wren_q[1]; // @[el2_ifu_ic_mem.scala 102:59]
  wire  read_enable_1 = _T_244 & ic_tag_clken[1]; // @[el2_ifu_ic_mem.scala 102:77]
  wire [25:0] _T_248 = read_enable_0 ? 26'h3ffffff : 26'h0; // @[Bitwise.scala 72:12]
  wire [25:0] ic_tag_data_raw_0 = _T_248 & tag_mem_0__T_250_data; // @[el2_ifu_ic_mem.scala 103:87]
  wire [25:0] _T_252 = read_enable_1 ? 26'h3ffffff : 26'h0; // @[Bitwise.scala 72:12]
  wire [25:0] ic_tag_data_raw_1 = _T_252 & tag_mem_1__T_254_data; // @[el2_ifu_ic_mem.scala 103:87]
  wire [23:0] w_tout_0 = {ic_tag_data_raw_0[25:21],ic_tag_data_raw_0[18:0]}; // @[Cat.scala 29:58]
  wire [23:0] w_tout_1 = {ic_tag_data_raw_1[25:21],ic_tag_data_raw_1[18:0]}; // @[Cat.scala 29:58]
  wire  _T_261 = ~io_dec_tlu_core_ecc_disable; // @[el2_ifu_ic_mem.scala 111:51]
  wire  _T_262 = _T_261 & ic_rd_en_ff; // @[el2_ifu_ic_mem.scala 111:80]
  wire [31:0] _T_264 = {11'h0,ic_tag_data_raw_0[20:0]}; // @[Cat.scala 29:58]
  wire [6:0] _T_266 = {2'h0,ic_tag_data_raw_0[25:21]}; // @[Cat.scala 29:58]
  wire [5:0] _T_373 = {_T_264[31],_T_264[30],_T_264[29],_T_264[28],_T_264[27],_T_264[26]}; // @[el2_lib.scala 290:76]
  wire  _T_374 = ^_T_373; // @[el2_lib.scala 290:83]
  wire  _T_375 = _T_266[5] ^ _T_374; // @[el2_lib.scala 290:71]
  wire [6:0] _T_382 = {_T_264[17],_T_264[16],_T_264[15],_T_264[14],_T_264[13],_T_264[12],_T_264[11]}; // @[el2_lib.scala 290:103]
  wire [14:0] _T_390 = {_T_264[25],_T_264[24],_T_264[23],_T_264[22],_T_264[21],_T_264[20],_T_264[19],_T_264[18],_T_382}; // @[el2_lib.scala 290:103]
  wire  _T_391 = ^_T_390; // @[el2_lib.scala 290:110]
  wire  _T_392 = _T_266[4] ^ _T_391; // @[el2_lib.scala 290:98]
  wire [6:0] _T_399 = {_T_264[10],_T_264[9],_T_264[8],_T_264[7],_T_264[6],_T_264[5],_T_264[4]}; // @[el2_lib.scala 290:130]
  wire [14:0] _T_407 = {_T_264[25],_T_264[24],_T_264[23],_T_264[22],_T_264[21],_T_264[20],_T_264[19],_T_264[18],_T_399}; // @[el2_lib.scala 290:130]
  wire  _T_408 = ^_T_407; // @[el2_lib.scala 290:137]
  wire  _T_409 = _T_266[3] ^ _T_408; // @[el2_lib.scala 290:125]
  wire [8:0] _T_418 = {_T_264[15],_T_264[14],_T_264[10],_T_264[9],_T_264[8],_T_264[7],_T_264[3],_T_264[2],_T_264[1]}; // @[el2_lib.scala 290:157]
  wire [17:0] _T_427 = {_T_264[31],_T_264[30],_T_264[29],_T_264[25],_T_264[24],_T_264[23],_T_264[22],_T_264[17],_T_264[16],_T_418}; // @[el2_lib.scala 290:157]
  wire  _T_428 = ^_T_427; // @[el2_lib.scala 290:164]
  wire  _T_429 = _T_266[2] ^ _T_428; // @[el2_lib.scala 290:152]
  wire [8:0] _T_438 = {_T_264[13],_T_264[12],_T_264[10],_T_264[9],_T_264[6],_T_264[5],_T_264[3],_T_264[2],_T_264[0]}; // @[el2_lib.scala 290:184]
  wire [17:0] _T_447 = {_T_264[31],_T_264[28],_T_264[27],_T_264[25],_T_264[24],_T_264[21],_T_264[20],_T_264[17],_T_264[16],_T_438}; // @[el2_lib.scala 290:184]
  wire  _T_448 = ^_T_447; // @[el2_lib.scala 290:191]
  wire  _T_449 = _T_266[1] ^ _T_448; // @[el2_lib.scala 290:179]
  wire [8:0] _T_458 = {_T_264[13],_T_264[11],_T_264[10],_T_264[8],_T_264[6],_T_264[4],_T_264[3],_T_264[1],_T_264[0]}; // @[el2_lib.scala 290:211]
  wire [17:0] _T_467 = {_T_264[30],_T_264[28],_T_264[26],_T_264[25],_T_264[23],_T_264[21],_T_264[19],_T_264[17],_T_264[15],_T_458}; // @[el2_lib.scala 290:211]
  wire  _T_468 = ^_T_467; // @[el2_lib.scala 290:218]
  wire  _T_469 = _T_266[0] ^ _T_468; // @[el2_lib.scala 290:206]
  wire [6:0] _T_475 = {1'h0,_T_375,_T_392,_T_409,_T_429,_T_449,_T_469}; // @[Cat.scala 29:58]
  wire  _T_476 = _T_475 != 7'h0; // @[el2_lib.scala 291:44]
  wire  _T_477 = _T_262 & _T_476; // @[el2_lib.scala 291:32]
  wire  ic_tag_single_ecc_error_0 = _T_477 & _T_475[6]; // @[el2_lib.scala 291:53]
  wire  _T_483 = ~_T_475[6]; // @[el2_lib.scala 292:55]
  wire  ic_tag_double_ecc_error_0 = _T_477 & _T_483; // @[el2_lib.scala 292:53]
  wire [31:0] _T_652 = {11'h0,ic_tag_data_raw_1[20:0]}; // @[Cat.scala 29:58]
  wire [6:0] _T_654 = {2'h0,ic_tag_data_raw_1[25:21]}; // @[Cat.scala 29:58]
  wire [5:0] _T_761 = {_T_652[31],_T_652[30],_T_652[29],_T_652[28],_T_652[27],_T_652[26]}; // @[el2_lib.scala 290:76]
  wire  _T_762 = ^_T_761; // @[el2_lib.scala 290:83]
  wire  _T_763 = _T_654[5] ^ _T_762; // @[el2_lib.scala 290:71]
  wire [6:0] _T_770 = {_T_652[17],_T_652[16],_T_652[15],_T_652[14],_T_652[13],_T_652[12],_T_652[11]}; // @[el2_lib.scala 290:103]
  wire [14:0] _T_778 = {_T_652[25],_T_652[24],_T_652[23],_T_652[22],_T_652[21],_T_652[20],_T_652[19],_T_652[18],_T_770}; // @[el2_lib.scala 290:103]
  wire  _T_779 = ^_T_778; // @[el2_lib.scala 290:110]
  wire  _T_780 = _T_654[4] ^ _T_779; // @[el2_lib.scala 290:98]
  wire [6:0] _T_787 = {_T_652[10],_T_652[9],_T_652[8],_T_652[7],_T_652[6],_T_652[5],_T_652[4]}; // @[el2_lib.scala 290:130]
  wire [14:0] _T_795 = {_T_652[25],_T_652[24],_T_652[23],_T_652[22],_T_652[21],_T_652[20],_T_652[19],_T_652[18],_T_787}; // @[el2_lib.scala 290:130]
  wire  _T_796 = ^_T_795; // @[el2_lib.scala 290:137]
  wire  _T_797 = _T_654[3] ^ _T_796; // @[el2_lib.scala 290:125]
  wire [8:0] _T_806 = {_T_652[15],_T_652[14],_T_652[10],_T_652[9],_T_652[8],_T_652[7],_T_652[3],_T_652[2],_T_652[1]}; // @[el2_lib.scala 290:157]
  wire [17:0] _T_815 = {_T_652[31],_T_652[30],_T_652[29],_T_652[25],_T_652[24],_T_652[23],_T_652[22],_T_652[17],_T_652[16],_T_806}; // @[el2_lib.scala 290:157]
  wire  _T_816 = ^_T_815; // @[el2_lib.scala 290:164]
  wire  _T_817 = _T_654[2] ^ _T_816; // @[el2_lib.scala 290:152]
  wire [8:0] _T_826 = {_T_652[13],_T_652[12],_T_652[10],_T_652[9],_T_652[6],_T_652[5],_T_652[3],_T_652[2],_T_652[0]}; // @[el2_lib.scala 290:184]
  wire [17:0] _T_835 = {_T_652[31],_T_652[28],_T_652[27],_T_652[25],_T_652[24],_T_652[21],_T_652[20],_T_652[17],_T_652[16],_T_826}; // @[el2_lib.scala 290:184]
  wire  _T_836 = ^_T_835; // @[el2_lib.scala 290:191]
  wire  _T_837 = _T_654[1] ^ _T_836; // @[el2_lib.scala 290:179]
  wire [8:0] _T_846 = {_T_652[13],_T_652[11],_T_652[10],_T_652[8],_T_652[6],_T_652[4],_T_652[3],_T_652[1],_T_652[0]}; // @[el2_lib.scala 290:211]
  wire [17:0] _T_855 = {_T_652[30],_T_652[28],_T_652[26],_T_652[25],_T_652[23],_T_652[21],_T_652[19],_T_652[17],_T_652[15],_T_846}; // @[el2_lib.scala 290:211]
  wire  _T_856 = ^_T_855; // @[el2_lib.scala 290:218]
  wire  _T_857 = _T_654[0] ^ _T_856; // @[el2_lib.scala 290:206]
  wire [6:0] _T_863 = {1'h0,_T_763,_T_780,_T_797,_T_817,_T_837,_T_857}; // @[Cat.scala 29:58]
  wire  _T_864 = _T_863 != 7'h0; // @[el2_lib.scala 291:44]
  wire  _T_865 = _T_262 & _T_864; // @[el2_lib.scala 291:32]
  wire  ic_tag_single_ecc_error_1 = _T_865 & _T_863[6]; // @[el2_lib.scala 291:53]
  wire  _T_871 = ~_T_863[6]; // @[el2_lib.scala 292:55]
  wire  ic_tag_double_ecc_error_1 = _T_865 & _T_871; // @[el2_lib.scala 292:53]
  wire [1:0] _T_1037 = {ic_tag_single_ecc_error_1,ic_tag_single_ecc_error_0}; // @[Cat.scala 29:58]
  wire [1:0] _T_1038 = {ic_tag_double_ecc_error_1,ic_tag_double_ecc_error_0}; // @[Cat.scala 29:58]
  wire [1:0] ic_tag_way_perr = _T_1037 | _T_1038; // @[el2_ifu_ic_mem.scala 119:88]
  wire [25:0] _T_1041 = ic_debug_rd_way_en_ff[0] ? 26'h3ffffff : 26'h0; // @[Bitwise.scala 72:12]
  wire [25:0] _T_1042 = _T_1041 & ic_tag_data_raw_0; // @[el2_ifu_ic_mem.scala 123:112]
  wire [25:0] _T_1045 = ic_debug_rd_way_en_ff[1] ? 26'h3ffffff : 26'h0; // @[Bitwise.scala 72:12]
  wire [25:0] _T_1046 = _T_1045 & ic_tag_data_raw_1; // @[el2_ifu_ic_mem.scala 123:112]
  wire  _T_1049 = w_tout_0[18:0] == ic_rw_addr_ff; // @[el2_ifu_ic_mem.scala 124:83]
  wire  _T_1051 = _T_1049 & io_ic_tag_valid[0]; // @[el2_ifu_ic_mem.scala 124:100]
  wire  _T_1053 = w_tout_1[18:0] == ic_rw_addr_ff; // @[el2_ifu_ic_mem.scala 124:83]
  wire  _T_1055 = _T_1053 & io_ic_tag_valid[1]; // @[el2_ifu_ic_mem.scala 124:100]
  wire [1:0] _T_1057 = ic_tag_way_perr & io_ic_tag_valid; // @[el2_ifu_ic_mem.scala 125:38]
  assign tag_mem_0__T_250_addr = ic_rw_addr_q[6:0];
  assign tag_mem_0__T_250_data = tag_mem_0[tag_mem_0__T_250_addr]; // @[el2_ifu_ic_mem.scala 97:20]
  assign tag_mem_0__T_254_addr = ic_rw_addr_q[6:0];
  assign tag_mem_0__T_254_data = tag_mem_0[tag_mem_0__T_254_addr]; // @[el2_ifu_ic_mem.scala 97:20]
  assign tag_mem_0__T_238_data = _T_14 ? _T_221 : _T_226;
  assign tag_mem_0__T_238_addr = ic_rw_addr_q[6:0];
  assign tag_mem_0__T_238_mask = ic_tag_wren_q[0] & ic_tag_clken[0];
  assign tag_mem_0__T_238_en = 1'h1;
  assign tag_mem_1__T_250_addr = ic_rw_addr_q[6:0];
  assign tag_mem_1__T_250_data = tag_mem_1[tag_mem_1__T_250_addr]; // @[el2_ifu_ic_mem.scala 97:20]
  assign tag_mem_1__T_254_addr = ic_rw_addr_q[6:0];
  assign tag_mem_1__T_254_data = tag_mem_1[tag_mem_1__T_254_addr]; // @[el2_ifu_ic_mem.scala 97:20]
  assign tag_mem_1__T_238_data = _T_14 ? _T_221 : _T_226;
  assign tag_mem_1__T_238_addr = ic_rw_addr_q[6:0];
  assign tag_mem_1__T_238_mask = ic_tag_wren_q[1] & ic_tag_clken[1];
  assign tag_mem_1__T_238_en = 1'h1;
  assign io_ictag_debug_rd_data = _T_1042 | _T_1046; // @[el2_ifu_ic_mem.scala 64:26 el2_ifu_ic_mem.scala 123:26]
  assign io_ic_rd_hit = {_T_1055,_T_1051}; // @[el2_ifu_ic_mem.scala 65:16 el2_ifu_ic_mem.scala 124:16]
  assign io_ic_tag_perr = |_T_1057; // @[el2_ifu_ic_mem.scala 66:18 el2_ifu_ic_mem.scala 125:18]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    tag_mem_0[initvar] = _RAND_0[25:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    tag_mem_1[initvar] = _RAND_1[25:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  ic_rd_en_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ic_rw_addr_ff = _RAND_3[18:0];
  _RAND_4 = {1{`RANDOM}};
  ic_debug_rd_way_en_ff = _RAND_4[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(tag_mem_0__T_238_en & tag_mem_0__T_238_mask) begin
      tag_mem_0[tag_mem_0__T_238_addr] <= tag_mem_0__T_238_data; // @[el2_ifu_ic_mem.scala 97:20]
    end
    if(tag_mem_1__T_238_en & tag_mem_1__T_238_mask) begin
      tag_mem_1[tag_mem_1__T_238_addr] <= tag_mem_1__T_238_data; // @[el2_ifu_ic_mem.scala 97:20]
    end
    if (reset) begin
      ic_rd_en_ff <= 1'h0;
    end else begin
      ic_rd_en_ff <= io_ic_rd_en;
    end
    if (reset) begin
      ic_rw_addr_ff <= 19'h0;
    end else begin
      ic_rw_addr_ff <= io_ic_rw_addr[18:0];
    end
    if (reset) begin
      ic_debug_rd_way_en_ff <= 2'h0;
    end else begin
      ic_debug_rd_way_en_ff <= ic_debug_rd_way_en;
    end
  end
endmodule
