module rvecc_decode(
  input  [31:0] io_din,
  input  [6:0]  io_ecc_in,
  output [6:0]  io_ecc_out,
  output [31:0] io_dout,
  output        io_single_ecc_error
);
  wire  w0_0 = io_din[0]; // @[beh_lib.scala 239:37]
  wire  w0_1 = io_din[1]; // @[beh_lib.scala 239:37]
  wire  w1_1 = io_din[2]; // @[beh_lib.scala 240:37]
  wire  w0_2 = io_din[3]; // @[beh_lib.scala 239:37]
  wire  w0_3 = io_din[4]; // @[beh_lib.scala 239:37]
  wire  w1_3 = io_din[5]; // @[beh_lib.scala 240:37]
  wire  w0_4 = io_din[6]; // @[beh_lib.scala 239:37]
  wire  w2_3 = io_din[7]; // @[beh_lib.scala 241:37]
  wire  w0_5 = io_din[8]; // @[beh_lib.scala 239:37]
  wire  w1_5 = io_din[9]; // @[beh_lib.scala 240:37]
  wire  w0_6 = io_din[10]; // @[beh_lib.scala 239:37]
  wire  w0_7 = io_din[11]; // @[beh_lib.scala 239:37]
  wire  w1_7 = io_din[12]; // @[beh_lib.scala 240:37]
  wire  w0_8 = io_din[13]; // @[beh_lib.scala 239:37]
  wire  w2_7 = io_din[14]; // @[beh_lib.scala 241:37]
  wire  w0_9 = io_din[15]; // @[beh_lib.scala 239:37]
  wire  w1_9 = io_din[16]; // @[beh_lib.scala 240:37]
  wire  w0_10 = io_din[17]; // @[beh_lib.scala 239:37]
  wire  w3_7 = io_din[18]; // @[beh_lib.scala 242:37]
  wire  w0_11 = io_din[19]; // @[beh_lib.scala 239:37]
  wire  w1_11 = io_din[20]; // @[beh_lib.scala 240:37]
  wire  w0_12 = io_din[21]; // @[beh_lib.scala 239:37]
  wire  w2_11 = io_din[22]; // @[beh_lib.scala 241:37]
  wire  w0_13 = io_din[23]; // @[beh_lib.scala 239:37]
  wire  w1_13 = io_din[24]; // @[beh_lib.scala 240:37]
  wire  w0_14 = io_din[25]; // @[beh_lib.scala 239:37]
  wire  w0_15 = io_din[26]; // @[beh_lib.scala 239:37]
  wire  w1_15 = io_din[27]; // @[beh_lib.scala 240:37]
  wire  w0_16 = io_din[28]; // @[beh_lib.scala 239:37]
  wire  w2_15 = io_din[29]; // @[beh_lib.scala 241:37]
  wire  w0_17 = io_din[30]; // @[beh_lib.scala 239:37]
  wire  w1_17 = io_din[31]; // @[beh_lib.scala 240:37]
  wire [5:0] _T_100 = {w1_17,w0_17,w2_15,w0_16,w1_15,w0_15}; // @[beh_lib.scala 247:86]
  wire  _T_101 = ^_T_100; // @[beh_lib.scala 247:93]
  wire  _T_102 = io_ecc_in[5] ^ _T_101; // @[beh_lib.scala 247:81]
  wire [6:0] _T_109 = {w0_10,w1_9,w0_9,w2_7,w0_8,w1_7,w0_7}; // @[beh_lib.scala 247:116]
  wire [14:0] _T_117 = {w0_14,w1_13,w0_13,w2_11,w0_12,w1_11,w0_11,w3_7,_T_109}; // @[beh_lib.scala 247:116]
  wire  _T_118 = ^_T_117; // @[beh_lib.scala 247:123]
  wire  _T_119 = io_ecc_in[4] ^ _T_118; // @[beh_lib.scala 247:111]
  wire [6:0] _T_126 = {w0_6,w1_5,w0_5,w2_3,w0_4,w1_3,w0_3}; // @[beh_lib.scala 247:146]
  wire [14:0] _T_134 = {w0_14,w1_13,w0_13,w2_11,w0_12,w1_11,w0_11,w3_7,_T_126}; // @[beh_lib.scala 247:146]
  wire  _T_135 = ^_T_134; // @[beh_lib.scala 247:153]
  wire  _T_136 = io_ecc_in[3] ^ _T_135; // @[beh_lib.scala 247:141]
  wire [8:0] _T_145 = {w0_9,w2_7,w0_6,w1_5,w0_5,w2_3,w0_2,w1_1,w0_1}; // @[beh_lib.scala 247:176]
  wire [17:0] _T_154 = {w1_17,w0_17,w2_15,w0_14,w1_13,w0_13,w2_11,w0_10,w1_9,_T_145}; // @[beh_lib.scala 247:176]
  wire  _T_155 = ^_T_154; // @[beh_lib.scala 247:183]
  wire  _T_156 = io_ecc_in[2] ^ _T_155; // @[beh_lib.scala 247:171]
  wire [8:0] _T_165 = {w0_8,w1_7,w0_6,w1_5,w0_4,w1_3,w0_2,w1_1,w0_0}; // @[beh_lib.scala 247:206]
  wire [17:0] _T_174 = {w1_17,w0_16,w1_15,w0_14,w1_13,w0_12,w1_11,w0_10,w1_9,_T_165}; // @[beh_lib.scala 247:206]
  wire  _T_175 = ^_T_174; // @[beh_lib.scala 247:213]
  wire  _T_176 = io_ecc_in[1] ^ _T_175; // @[beh_lib.scala 247:201]
  wire [8:0] _T_185 = {w0_8,w0_7,w0_6,w0_5,w0_4,w0_3,w0_2,w0_1,w0_0}; // @[beh_lib.scala 247:236]
  wire [17:0] _T_194 = {w0_17,w0_16,w0_15,w0_14,w0_13,w0_12,w0_11,w0_10,w0_9,_T_185}; // @[beh_lib.scala 247:236]
  wire  _T_195 = ^_T_194; // @[beh_lib.scala 247:243]
  wire  _T_196 = io_ecc_in[0] ^ _T_195; // @[beh_lib.scala 247:231]
  wire [6:0] ecc_check = {1'h0,_T_102,_T_119,_T_136,_T_156,_T_176,_T_196}; // @[Cat.scala 29:58]
  wire  error_mask_0 = ecc_check[5:0] == 6'h1; // @[beh_lib.scala 255:39]
  wire  error_mask_1 = ecc_check[5:0] == 6'h2; // @[beh_lib.scala 255:39]
  wire  error_mask_2 = ecc_check[5:0] == 6'h3; // @[beh_lib.scala 255:39]
  wire  error_mask_3 = ecc_check[5:0] == 6'h4; // @[beh_lib.scala 255:39]
  wire  error_mask_4 = ecc_check[5:0] == 6'h5; // @[beh_lib.scala 255:39]
  wire  error_mask_5 = ecc_check[5:0] == 6'h6; // @[beh_lib.scala 255:39]
  wire  error_mask_6 = ecc_check[5:0] == 6'h7; // @[beh_lib.scala 255:39]
  wire  error_mask_7 = ecc_check[5:0] == 6'h8; // @[beh_lib.scala 255:39]
  wire  error_mask_8 = ecc_check[5:0] == 6'h9; // @[beh_lib.scala 255:39]
  wire  error_mask_9 = ecc_check[5:0] == 6'ha; // @[beh_lib.scala 255:39]
  wire  error_mask_10 = ecc_check[5:0] == 6'hb; // @[beh_lib.scala 255:39]
  wire  error_mask_11 = ecc_check[5:0] == 6'hc; // @[beh_lib.scala 255:39]
  wire  error_mask_12 = ecc_check[5:0] == 6'hd; // @[beh_lib.scala 255:39]
  wire  error_mask_13 = ecc_check[5:0] == 6'he; // @[beh_lib.scala 255:39]
  wire  error_mask_14 = ecc_check[5:0] == 6'hf; // @[beh_lib.scala 255:39]
  wire  error_mask_15 = ecc_check[5:0] == 6'h10; // @[beh_lib.scala 255:39]
  wire  error_mask_16 = ecc_check[5:0] == 6'h11; // @[beh_lib.scala 255:39]
  wire  error_mask_17 = ecc_check[5:0] == 6'h12; // @[beh_lib.scala 255:39]
  wire  error_mask_18 = ecc_check[5:0] == 6'h13; // @[beh_lib.scala 255:39]
  wire  error_mask_19 = ecc_check[5:0] == 6'h14; // @[beh_lib.scala 255:39]
  wire  error_mask_20 = ecc_check[5:0] == 6'h15; // @[beh_lib.scala 255:39]
  wire  error_mask_21 = ecc_check[5:0] == 6'h16; // @[beh_lib.scala 255:39]
  wire  error_mask_22 = ecc_check[5:0] == 6'h17; // @[beh_lib.scala 255:39]
  wire  error_mask_23 = ecc_check[5:0] == 6'h18; // @[beh_lib.scala 255:39]
  wire  error_mask_24 = ecc_check[5:0] == 6'h19; // @[beh_lib.scala 255:39]
  wire  error_mask_25 = ecc_check[5:0] == 6'h1a; // @[beh_lib.scala 255:39]
  wire  error_mask_26 = ecc_check[5:0] == 6'h1b; // @[beh_lib.scala 255:39]
  wire  error_mask_27 = ecc_check[5:0] == 6'h1c; // @[beh_lib.scala 255:39]
  wire  error_mask_28 = ecc_check[5:0] == 6'h1d; // @[beh_lib.scala 255:39]
  wire  error_mask_29 = ecc_check[5:0] == 6'h1e; // @[beh_lib.scala 255:39]
  wire  error_mask_30 = ecc_check[5:0] == 6'h1f; // @[beh_lib.scala 255:39]
  wire  error_mask_31 = ecc_check[5:0] == 6'h20; // @[beh_lib.scala 255:39]
  wire  error_mask_32 = ecc_check[5:0] == 6'h21; // @[beh_lib.scala 255:39]
  wire  error_mask_33 = ecc_check[5:0] == 6'h22; // @[beh_lib.scala 255:39]
  wire  error_mask_34 = ecc_check[5:0] == 6'h23; // @[beh_lib.scala 255:39]
  wire  error_mask_35 = ecc_check[5:0] == 6'h24; // @[beh_lib.scala 255:39]
  wire  error_mask_36 = ecc_check[5:0] == 6'h25; // @[beh_lib.scala 255:39]
  wire  error_mask_37 = ecc_check[5:0] == 6'h26; // @[beh_lib.scala 255:39]
  wire  error_mask_38 = ecc_check[5:0] == 6'h27; // @[beh_lib.scala 255:39]
  wire [7:0] _T_310 = {io_ecc_in[3],io_din[3:1],io_ecc_in[2],w0_0,io_ecc_in[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] din_plus_parity = {io_ecc_in[6],io_din[31:26],io_ecc_in[5],io_din[25:11],io_ecc_in[4],io_din[10:4],_T_310}; // @[Cat.scala 29:58]
  wire [9:0] _T_333 = {error_mask_18,error_mask_17,error_mask_16,error_mask_15,error_mask_14,error_mask_13,error_mask_12,error_mask_11,error_mask_10,error_mask_9}; // @[beh_lib.scala 258:70]
  wire [18:0] _T_334 = {_T_333,error_mask_8,error_mask_7,error_mask_6,error_mask_5,error_mask_4,error_mask_3,error_mask_2,error_mask_1,error_mask_0}; // @[beh_lib.scala 258:70]
  wire [9:0] _T_343 = {error_mask_28,error_mask_27,error_mask_26,error_mask_25,error_mask_24,error_mask_23,error_mask_22,error_mask_21,error_mask_20,error_mask_19}; // @[beh_lib.scala 258:70]
  wire [9:0] _T_352 = {error_mask_38,error_mask_37,error_mask_36,error_mask_35,error_mask_34,error_mask_33,error_mask_32,error_mask_31,error_mask_30,error_mask_29}; // @[beh_lib.scala 258:70]
  wire [38:0] _T_354 = {_T_352,_T_343,_T_334}; // @[beh_lib.scala 258:70]
  wire [38:0] _T_355 = _T_354 ^ din_plus_parity; // @[beh_lib.scala 258:77]
  wire [38:0] dout_plus_parity = io_single_ecc_error ? _T_355 : din_plus_parity; // @[beh_lib.scala 258:29]
  wire [3:0] _T_361 = {dout_plus_parity[6:4],dout_plus_parity[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_363 = {dout_plus_parity[37:32],dout_plus_parity[30:16],dout_plus_parity[14:8]}; // @[Cat.scala 29:58]
  wire  _T_367 = ecc_check == 7'h40; // @[beh_lib.scala 261:60]
  wire  _T_368 = dout_plus_parity[38] ^ _T_367; // @[beh_lib.scala 261:42]
  wire [3:0] _T_375 = {dout_plus_parity[7],dout_plus_parity[3],dout_plus_parity[1:0]}; // @[Cat.scala 29:58]
  wire [2:0] _T_377 = {_T_368,dout_plus_parity[31],dout_plus_parity[15]}; // @[Cat.scala 29:58]
  assign io_ecc_out = {_T_377,_T_375}; // @[beh_lib.scala 248:14 beh_lib.scala 261:14]
  assign io_dout = {_T_363,_T_361}; // @[beh_lib.scala 260:11]
  assign io_single_ecc_error = 1'h0; // @[beh_lib.scala 250:23]
endmodule
module EL2_IC_TAG(
  input         clock,
  input         reset,
  input         io_clk,
  input         io_rst_l,
  input         io_clk_override,
  input         io_dec_tlu_core_ecc_disable,
  input  [31:0] io_ic_rw_addr,
  input  [1:0]  io_ic_wr_en,
  input  [1:0]  io_ic_tag_valid,
  input         io_ic_rd_en,
  input  [12:0] io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  output [25:0] io_ictag_debug_rd_data,
  input  [70:0] io_ic_debug_wr_data,
  output [1:0]  io_ic_rd_hit,
  output        io_ic_tag_perr,
  input         io_scan_mode,
  output [25:0] io_test_0,
  output [25:0] io_test_1,
  output [31:0] io_test_ecc_data_out_0,
  output [31:0] io_test_ecc_data_out_1,
  output [6:0]  io_test_ecc_out_0,
  output [6:0]  io_test_ecc_out_1,
  output        io_test_ecc_sb_out_0,
  output        io_test_ecc_sb_out_1,
  output        io_test_ecc_db_out_0,
  output        io_test_ecc_db_out_1
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [25:0] ic_way_tag_0 [0:127]; // @[el2_ifu_ic_mem.scala 125:46]
  wire [25:0] ic_way_tag_0_ic_tag_data_raw_data; // @[el2_ifu_ic_mem.scala 125:46]
  wire [6:0] ic_way_tag_0_ic_tag_data_raw_addr; // @[el2_ifu_ic_mem.scala 125:46]
  wire [25:0] ic_way_tag_0__T_488_data; // @[el2_ifu_ic_mem.scala 125:46]
  wire [6:0] ic_way_tag_0__T_488_addr; // @[el2_ifu_ic_mem.scala 125:46]
  wire  ic_way_tag_0__T_488_mask; // @[el2_ifu_ic_mem.scala 125:46]
  wire  ic_way_tag_0__T_488_en; // @[el2_ifu_ic_mem.scala 125:46]
  reg [6:0] ic_way_tag_0_ic_tag_data_raw_addr_pipe_0;
  reg [25:0] ic_way_tag_1 [0:127]; // @[el2_ifu_ic_mem.scala 125:46]
  wire [25:0] ic_way_tag_1_ic_tag_data_raw_data; // @[el2_ifu_ic_mem.scala 125:46]
  wire [6:0] ic_way_tag_1_ic_tag_data_raw_addr; // @[el2_ifu_ic_mem.scala 125:46]
  wire [25:0] ic_way_tag_1__T_488_data; // @[el2_ifu_ic_mem.scala 125:46]
  wire [6:0] ic_way_tag_1__T_488_addr; // @[el2_ifu_ic_mem.scala 125:46]
  wire  ic_way_tag_1__T_488_mask; // @[el2_ifu_ic_mem.scala 125:46]
  wire  ic_way_tag_1__T_488_en; // @[el2_ifu_ic_mem.scala 125:46]
  reg [6:0] ic_way_tag_1_ic_tag_data_raw_addr_pipe_0;
  wire [31:0] rvecc_decode_io_din; // @[el2_ifu_ic_mem.scala 149:27]
  wire [6:0] rvecc_decode_io_ecc_in; // @[el2_ifu_ic_mem.scala 149:27]
  wire [6:0] rvecc_decode_io_ecc_out; // @[el2_ifu_ic_mem.scala 149:27]
  wire [31:0] rvecc_decode_io_dout; // @[el2_ifu_ic_mem.scala 149:27]
  wire  rvecc_decode_io_single_ecc_error; // @[el2_ifu_ic_mem.scala 149:27]
  wire [31:0] rvecc_decode_1_io_din; // @[el2_ifu_ic_mem.scala 149:27]
  wire [6:0] rvecc_decode_1_io_ecc_in; // @[el2_ifu_ic_mem.scala 149:27]
  wire [6:0] rvecc_decode_1_io_ecc_out; // @[el2_ifu_ic_mem.scala 149:27]
  wire [31:0] rvecc_decode_1_io_dout; // @[el2_ifu_ic_mem.scala 149:27]
  wire  rvecc_decode_1_io_single_ecc_error; // @[el2_ifu_ic_mem.scala 149:27]
  wire  _T_2 = io_ic_rw_addr[5:4] == 2'h1; // @[el2_ifu_ic_mem.scala 73:93]
  wire [1:0] _T_4 = {_T_2,_T_2}; // @[Cat.scala 29:58]
  wire [1:0] ic_tag_wren = io_ic_wr_en & _T_4; // @[el2_ifu_ic_mem.scala 73:33]
  wire  _T_5 = io_ic_debug_rd_en & io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 75:68]
  wire [1:0] _T_7 = {_T_5,_T_5}; // @[Cat.scala 29:58]
  wire [1:0] ic_debug_rd_way_en = _T_7 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 75:93]
  wire  _T_8 = io_ic_debug_wr_en & io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 76:68]
  wire [1:0] _T_10 = {_T_8,_T_8}; // @[Cat.scala 29:58]
  wire [1:0] ic_debug_wr_way_en = _T_10 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 76:93]
  wire  _T_11 = io_ic_rd_en | io_clk_override; // @[el2_ifu_ic_mem.scala 77:55]
  wire [1:0] _T_13 = {_T_11,_T_11}; // @[Cat.scala 29:58]
  wire [1:0] _T_14 = _T_13 | io_ic_wr_en; // @[el2_ifu_ic_mem.scala 77:74]
  wire [1:0] _T_15 = _T_14 | ic_debug_wr_way_en; // @[el2_ifu_ic_mem.scala 77:88]
  wire [1:0] ic_tag_clken = _T_15 | ic_debug_rd_way_en; // @[el2_ifu_ic_mem.scala 77:109]
  wire [1:0] ic_tag_wren_q = ic_tag_wren | ic_debug_wr_way_en; // @[el2_ifu_ic_mem.scala 82:35]
  wire [31:0] _T_31 = {13'h0,io_ic_rw_addr[31:13]}; // @[Cat.scala 29:58]
  wire [8:0] _T_135 = {_T_31[16],_T_31[14],_T_31[12],_T_31[10],_T_31[8],_T_31[6],_T_31[5],_T_31[3],_T_31[1]}; // @[el2_lib.scala 211:22]
  wire [17:0] _T_144 = {_T_31[31],_T_31[30],_T_31[28],_T_31[27],_T_31[25],_T_31[23],_T_31[21],_T_31[20],_T_31[18],_T_135}; // @[el2_lib.scala 211:22]
  wire  _T_145 = ^_T_144; // @[el2_lib.scala 211:29]
  wire [8:0] _T_153 = {_T_31[15],_T_31[14],_T_31[11],_T_31[10],_T_31[7],_T_31[6],_T_31[4],_T_31[3],_T_31[0]}; // @[el2_lib.scala 211:39]
  wire [17:0] _T_162 = {_T_31[31],_T_31[29],_T_31[28],_T_31[26],_T_31[25],_T_31[22],_T_31[21],_T_31[19],_T_31[18],_T_153}; // @[el2_lib.scala 211:39]
  wire  _T_163 = ^_T_162; // @[el2_lib.scala 211:46]
  wire [8:0] _T_171 = {_T_31[15],_T_31[14],_T_31[9],_T_31[8],_T_31[7],_T_31[6],_T_31[2],_T_31[1],_T_31[0]}; // @[el2_lib.scala 211:56]
  wire [17:0] _T_180 = {_T_31[30],_T_31[29],_T_31[28],_T_31[24],_T_31[23],_T_31[22],_T_31[21],_T_31[17],_T_31[16],_T_171}; // @[el2_lib.scala 211:56]
  wire  _T_181 = ^_T_180; // @[el2_lib.scala 211:63]
  wire [6:0] _T_187 = {_T_31[12],_T_31[11],_T_31[10],_T_31[9],_T_31[8],_T_31[7],_T_31[6]}; // @[el2_lib.scala 211:73]
  wire [14:0] _T_195 = {_T_31[27],_T_31[26],_T_31[25],_T_31[24],_T_31[23],_T_31[22],_T_31[21],_T_31[13],_T_187}; // @[el2_lib.scala 211:73]
  wire  _T_196 = ^_T_195; // @[el2_lib.scala 211:80]
  wire [14:0] _T_210 = {_T_31[20],_T_31[19],_T_31[18],_T_31[17],_T_31[16],_T_31[15],_T_31[14],_T_31[13],_T_187}; // @[el2_lib.scala 211:90]
  wire  _T_211 = ^_T_210; // @[el2_lib.scala 211:97]
  wire [5:0] _T_216 = {_T_31[5],_T_31[4],_T_31[3],_T_31[2],_T_31[1],_T_31[0]}; // @[el2_lib.scala 211:107]
  wire  _T_217 = ^_T_216; // @[el2_lib.scala 211:114]
  wire [5:0] _T_222 = {_T_145,_T_163,_T_181,_T_196,_T_211,_T_217}; // @[Cat.scala 29:58]
  wire  _T_223 = ^_T_31; // @[el2_lib.scala 212:13]
  wire  _T_224 = ^_T_222; // @[el2_lib.scala 212:23]
  wire  _T_225 = _T_223 ^ _T_224; // @[el2_lib.scala 212:18]
  wire [6:0] _T_226 = {_T_225,_T_145,_T_163,_T_181,_T_196,_T_211,_T_217}; // @[Cat.scala 29:58]
  wire [25:0] _T_230 = {io_ic_debug_wr_data[68:64],io_ic_debug_wr_data[31:11]}; // @[Cat.scala 29:58]
  wire [25:0] _T_464 = {_T_226[4:0],2'h0,io_ic_rw_addr[31:13]}; // @[Cat.scala 29:58]
  wire  _T_479 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 119:44]
  wire [25:0] _GEN_17 = ic_way_tag_0_ic_tag_data_raw_data; // @[el2_ifu_ic_mem.scala 137:75]
  wire [25:0] _GEN_18 = ic_way_tag_0_ic_tag_data_raw_data[0] ? ic_way_tag_1_ic_tag_data_raw_data : _GEN_17; // @[el2_ifu_ic_mem.scala 137:75]
  wire [36:0] w_tout_0 = {_GEN_18[25:21],_GEN_18[18:0],13'h0}; // @[Cat.scala 29:58]
  wire [25:0] _GEN_22 = ic_way_tag_1_ic_tag_data_raw_data[0] ? ic_way_tag_1_ic_tag_data_raw_data : _GEN_17; // @[el2_ifu_ic_mem.scala 137:75]
  wire [36:0] w_tout_1 = {_GEN_22[25:21],_GEN_22[18:0],13'h0}; // @[Cat.scala 29:58]
  rvecc_decode rvecc_decode ( // @[el2_ifu_ic_mem.scala 149:27]
    .io_din(rvecc_decode_io_din),
    .io_ecc_in(rvecc_decode_io_ecc_in),
    .io_ecc_out(rvecc_decode_io_ecc_out),
    .io_dout(rvecc_decode_io_dout),
    .io_single_ecc_error(rvecc_decode_io_single_ecc_error)
  );
  rvecc_decode rvecc_decode_1 ( // @[el2_ifu_ic_mem.scala 149:27]
    .io_din(rvecc_decode_1_io_din),
    .io_ecc_in(rvecc_decode_1_io_ecc_in),
    .io_ecc_out(rvecc_decode_1_io_ecc_out),
    .io_dout(rvecc_decode_1_io_dout),
    .io_single_ecc_error(rvecc_decode_1_io_single_ecc_error)
  );
  assign ic_way_tag_0_ic_tag_data_raw_addr = ic_way_tag_0_ic_tag_data_raw_addr_pipe_0;
  assign ic_way_tag_0_ic_tag_data_raw_data = ic_way_tag_0[ic_way_tag_0_ic_tag_data_raw_addr]; // @[el2_ifu_ic_mem.scala 125:46]
  assign ic_way_tag_0__T_488_data = _T_8 ? _T_230 : _T_464;
  assign ic_way_tag_0__T_488_addr = _T_479 ? io_ic_debug_addr[12:6] : io_ic_rw_addr[12:6];
  assign ic_way_tag_0__T_488_mask = ic_tag_wren_q[0] & ic_tag_clken[0];
  assign ic_way_tag_0__T_488_en = 1'h1;
  assign ic_way_tag_1_ic_tag_data_raw_addr = ic_way_tag_1_ic_tag_data_raw_addr_pipe_0;
  assign ic_way_tag_1_ic_tag_data_raw_data = ic_way_tag_1[ic_way_tag_1_ic_tag_data_raw_addr]; // @[el2_ifu_ic_mem.scala 125:46]
  assign ic_way_tag_1__T_488_data = _T_8 ? _T_230 : _T_464;
  assign ic_way_tag_1__T_488_addr = _T_479 ? io_ic_debug_addr[12:6] : io_ic_rw_addr[12:6];
  assign ic_way_tag_1__T_488_mask = ic_tag_wren_q[1] & ic_tag_clken[1];
  assign ic_way_tag_1__T_488_en = 1'h1;
  assign io_ictag_debug_rd_data = 26'h0; // @[el2_ifu_ic_mem.scala 171:26]
  assign io_ic_rd_hit = 2'h0; // @[el2_ifu_ic_mem.scala 170:16]
  assign io_ic_tag_perr = 1'h0; // @[el2_ifu_ic_mem.scala 169:18]
  assign io_test_0 = w_tout_0[25:0]; // @[el2_ifu_ic_mem.scala 168:11]
  assign io_test_1 = w_tout_1[25:0]; // @[el2_ifu_ic_mem.scala 168:11]
  assign io_test_ecc_data_out_0 = rvecc_decode_io_dout; // @[el2_ifu_ic_mem.scala 160:29]
  assign io_test_ecc_data_out_1 = rvecc_decode_1_io_dout; // @[el2_ifu_ic_mem.scala 160:29]
  assign io_test_ecc_out_0 = rvecc_decode_io_ecc_out; // @[el2_ifu_ic_mem.scala 161:24]
  assign io_test_ecc_out_1 = rvecc_decode_1_io_ecc_out; // @[el2_ifu_ic_mem.scala 161:24]
  assign io_test_ecc_sb_out_0 = 1'h0; // @[el2_ifu_ic_mem.scala 162:27]
  assign io_test_ecc_sb_out_1 = 1'h0; // @[el2_ifu_ic_mem.scala 162:27]
  assign io_test_ecc_db_out_0 = 1'h0; // @[el2_ifu_ic_mem.scala 163:27]
  assign io_test_ecc_db_out_1 = 1'h0; // @[el2_ifu_ic_mem.scala 163:27]
  assign rvecc_decode_io_din = {11'h0,ic_way_tag_0_ic_tag_data_raw_data[20:0]}; // @[el2_ifu_ic_mem.scala 152:26]
  assign rvecc_decode_io_ecc_in = {2'h0,ic_way_tag_0_ic_tag_data_raw_data[25:21]}; // @[el2_ifu_ic_mem.scala 153:29]
  assign rvecc_decode_1_io_din = {11'h0,ic_way_tag_1_ic_tag_data_raw_data[20:0]}; // @[el2_ifu_ic_mem.scala 152:26]
  assign rvecc_decode_1_io_ecc_in = {2'h0,ic_way_tag_1_ic_tag_data_raw_data[25:21]}; // @[el2_ifu_ic_mem.scala 153:29]
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
    ic_way_tag_0[initvar] = _RAND_0[25:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ic_way_tag_1[initvar] = _RAND_2[25:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ic_way_tag_0_ic_tag_data_raw_addr_pipe_0 = _RAND_1[6:0];
  _RAND_3 = {1{`RANDOM}};
  ic_way_tag_1_ic_tag_data_raw_addr_pipe_0 = _RAND_3[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(ic_way_tag_0__T_488_en & ic_way_tag_0__T_488_mask) begin
      ic_way_tag_0[ic_way_tag_0__T_488_addr] <= ic_way_tag_0__T_488_data; // @[el2_ifu_ic_mem.scala 125:46]
    end
    if (_T_479) begin
      ic_way_tag_0_ic_tag_data_raw_addr_pipe_0 <= io_ic_debug_addr[12:6];
    end else begin
      ic_way_tag_0_ic_tag_data_raw_addr_pipe_0 <= io_ic_rw_addr[12:6];
    end
    if(ic_way_tag_1__T_488_en & ic_way_tag_1__T_488_mask) begin
      ic_way_tag_1[ic_way_tag_1__T_488_addr] <= ic_way_tag_1__T_488_data; // @[el2_ifu_ic_mem.scala 125:46]
    end
    if (_T_479) begin
      ic_way_tag_1_ic_tag_data_raw_addr_pipe_0 <= io_ic_debug_addr[12:6];
    end else begin
      ic_way_tag_1_ic_tag_data_raw_addr_pipe_0 <= io_ic_rw_addr[12:6];
    end
  end
endmodule
