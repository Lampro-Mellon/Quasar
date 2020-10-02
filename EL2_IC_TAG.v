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
  input         io_scan_mode,
  output [25:0] io_test
);
  wire  _T_14 = io_ic_debug_wr_en & io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 80:65]
  wire [31:0] _T_20 = {13'h0,io_ic_rw_addr[28:10]}; // @[Cat.scala 29:58]
  wire [8:0] _T_124 = {_T_20[16],_T_20[14],_T_20[12],_T_20[10],_T_20[8],_T_20[6],_T_20[5],_T_20[3],_T_20[1]}; // @[el2_lib.scala 253:22]
  wire [17:0] _T_133 = {_T_20[31],_T_20[30],_T_20[28],_T_20[27],_T_20[25],_T_20[23],_T_20[21],_T_20[20],_T_20[18],_T_124}; // @[el2_lib.scala 253:22]
  wire  _T_134 = ^_T_133; // @[el2_lib.scala 253:29]
  wire [8:0] _T_142 = {_T_20[15],_T_20[14],_T_20[11],_T_20[10],_T_20[7],_T_20[6],_T_20[4],_T_20[3],_T_20[0]}; // @[el2_lib.scala 253:39]
  wire [17:0] _T_151 = {_T_20[31],_T_20[29],_T_20[28],_T_20[26],_T_20[25],_T_20[22],_T_20[21],_T_20[19],_T_20[18],_T_142}; // @[el2_lib.scala 253:39]
  wire  _T_152 = ^_T_151; // @[el2_lib.scala 253:46]
  wire [8:0] _T_160 = {_T_20[15],_T_20[14],_T_20[9],_T_20[8],_T_20[7],_T_20[6],_T_20[2],_T_20[1],_T_20[0]}; // @[el2_lib.scala 253:56]
  wire [17:0] _T_169 = {_T_20[30],_T_20[29],_T_20[28],_T_20[24],_T_20[23],_T_20[22],_T_20[21],_T_20[17],_T_20[16],_T_160}; // @[el2_lib.scala 253:56]
  wire  _T_170 = ^_T_169; // @[el2_lib.scala 253:63]
  wire [6:0] _T_176 = {_T_20[12],_T_20[11],_T_20[10],_T_20[9],_T_20[8],_T_20[7],_T_20[6]}; // @[el2_lib.scala 253:73]
  wire [14:0] _T_184 = {_T_20[27],_T_20[26],_T_20[25],_T_20[24],_T_20[23],_T_20[22],_T_20[21],_T_20[13],_T_176}; // @[el2_lib.scala 253:73]
  wire  _T_185 = ^_T_184; // @[el2_lib.scala 253:80]
  wire [14:0] _T_199 = {_T_20[20],_T_20[19],_T_20[18],_T_20[17],_T_20[16],_T_20[15],_T_20[14],_T_20[13],_T_176}; // @[el2_lib.scala 253:90]
  wire  _T_200 = ^_T_199; // @[el2_lib.scala 253:97]
  wire [5:0] _T_205 = {_T_20[5],_T_20[4],_T_20[3],_T_20[2],_T_20[1],_T_20[0]}; // @[el2_lib.scala 253:107]
  wire  _T_206 = ^_T_205; // @[el2_lib.scala 253:114]
  wire [5:0] _T_211 = {_T_134,_T_152,_T_170,_T_185,_T_200,_T_206}; // @[Cat.scala 29:58]
  wire  _T_212 = ^_T_20; // @[el2_lib.scala 254:13]
  wire  _T_213 = ^_T_211; // @[el2_lib.scala 254:23]
  wire  _T_214 = _T_212 ^ _T_213; // @[el2_lib.scala 254:18]
  wire [6:0] ic_tag_ecc = {_T_214,_T_134,_T_152,_T_170,_T_185,_T_200,_T_206}; // @[Cat.scala 29:58]
  wire [25:0] _T_221 = {io_ic_debug_wr_data[68:64],io_ic_debug_wr_data[31:11]}; // @[Cat.scala 29:58]
  wire [6:0] _T_224 = {ic_tag_ecc[4:0],2'h0}; // @[Cat.scala 29:58]
  assign io_ictag_debug_rd_data = 26'h0; // @[el2_ifu_ic_mem.scala 64:26]
  assign io_ic_rd_hit = 2'h0; // @[el2_ifu_ic_mem.scala 65:16]
  assign io_ic_tag_perr = 1'h0; // @[el2_ifu_ic_mem.scala 66:18]
  assign io_test = _T_14 ? _T_221 : {{19'd0}, _T_224}; // @[el2_ifu_ic_mem.scala 93:11]
endmodule
