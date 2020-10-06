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
  output [25:0] io_test_0,
  output [25:0] io_test_1
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
  reg [25:0] tag_mem_0 [0:127]; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_0_ic_tag_data_raw_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_0_ic_tag_data_raw_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_0__T_238_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_0__T_238_addr; // @[el2_ifu_ic_mem.scala 97:20]
  wire  tag_mem_0__T_238_mask; // @[el2_ifu_ic_mem.scala 97:20]
  wire  tag_mem_0__T_238_en; // @[el2_ifu_ic_mem.scala 97:20]
  reg [25:0] tag_mem_1 [0:127]; // @[el2_ifu_ic_mem.scala 97:20]
  wire [25:0] tag_mem_1_ic_tag_data_raw_data; // @[el2_ifu_ic_mem.scala 97:20]
  wire [6:0] tag_mem_1_ic_tag_data_raw_addr; // @[el2_ifu_ic_mem.scala 97:20]
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
  wire [1:0] ic_tag_wren_q = ic_tag_wren | ic_debug_wr_way_en; // @[el2_ifu_ic_mem.scala 82:35]
  wire [31:0] _T_20 = {13'h0,io_ic_rw_addr[28:10]}; // @[Cat.scala 29:58]
  wire [8:0] _T_124 = {_T_20[16],_T_20[14],_T_20[12],_T_20[10],_T_20[8],_T_20[6],_T_20[5],_T_20[3],_T_20[1]}; // @[el2_lib.scala 255:22]
  wire [17:0] _T_133 = {_T_20[31],_T_20[30],_T_20[28],_T_20[27],_T_20[25],_T_20[23],_T_20[21],_T_20[20],_T_20[18],_T_124}; // @[el2_lib.scala 255:22]
  wire  _T_134 = ^_T_133; // @[el2_lib.scala 255:29]
  wire [8:0] _T_142 = {_T_20[15],_T_20[14],_T_20[11],_T_20[10],_T_20[7],_T_20[6],_T_20[4],_T_20[3],_T_20[0]}; // @[el2_lib.scala 255:39]
  wire [17:0] _T_151 = {_T_20[31],_T_20[29],_T_20[28],_T_20[26],_T_20[25],_T_20[22],_T_20[21],_T_20[19],_T_20[18],_T_142}; // @[el2_lib.scala 255:39]
  wire  _T_152 = ^_T_151; // @[el2_lib.scala 255:46]
  wire [8:0] _T_160 = {_T_20[15],_T_20[14],_T_20[9],_T_20[8],_T_20[7],_T_20[6],_T_20[2],_T_20[1],_T_20[0]}; // @[el2_lib.scala 255:56]
  wire [17:0] _T_169 = {_T_20[30],_T_20[29],_T_20[28],_T_20[24],_T_20[23],_T_20[22],_T_20[21],_T_20[17],_T_20[16],_T_160}; // @[el2_lib.scala 255:56]
  wire  _T_170 = ^_T_169; // @[el2_lib.scala 255:63]
  wire [6:0] _T_176 = {_T_20[12],_T_20[11],_T_20[10],_T_20[9],_T_20[8],_T_20[7],_T_20[6]}; // @[el2_lib.scala 255:73]
  wire [14:0] _T_184 = {_T_20[27],_T_20[26],_T_20[25],_T_20[24],_T_20[23],_T_20[22],_T_20[21],_T_20[13],_T_176}; // @[el2_lib.scala 255:73]
  wire  _T_185 = ^_T_184; // @[el2_lib.scala 255:80]
  wire [14:0] _T_199 = {_T_20[20],_T_20[19],_T_20[18],_T_20[17],_T_20[16],_T_20[15],_T_20[14],_T_20[13],_T_176}; // @[el2_lib.scala 255:90]
  wire  _T_200 = ^_T_199; // @[el2_lib.scala 255:97]
  wire [5:0] _T_205 = {_T_20[5],_T_20[4],_T_20[3],_T_20[2],_T_20[1],_T_20[0]}; // @[el2_lib.scala 255:107]
  wire  _T_206 = ^_T_205; // @[el2_lib.scala 255:114]
  wire [5:0] _T_211 = {_T_134,_T_152,_T_170,_T_185,_T_200,_T_206}; // @[Cat.scala 29:58]
  wire  _T_212 = ^_T_20; // @[el2_lib.scala 256:13]
  wire  _T_213 = ^_T_211; // @[el2_lib.scala 256:23]
  wire  _T_214 = _T_212 ^ _T_213; // @[el2_lib.scala 256:18]
  wire [6:0] ic_tag_ecc = {_T_214,_T_134,_T_152,_T_170,_T_185,_T_200,_T_206}; // @[Cat.scala 29:58]
  wire [25:0] _T_221 = {io_ic_debug_wr_data[68:64],io_ic_debug_wr_data[31:11]}; // @[Cat.scala 29:58]
  wire [25:0] _T_226 = {ic_tag_ecc[4:0],2'h0,io_ic_rw_addr[28:10]}; // @[Cat.scala 29:58]
  wire  _T_227 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 93:45]
  wire [28:0] ic_rw_addr_q = _T_227 ? {{22'd0}, io_ic_debug_addr[9:3]} : io_ic_rw_addr; // @[el2_ifu_ic_mem.scala 93:25]
  wire  _T_240 = ~ic_tag_wren_q[0]; // @[el2_ifu_ic_mem.scala 110:61]
  wire  read_enable_0 = _T_240 & ic_tag_clken[0]; // @[el2_ifu_ic_mem.scala 110:79]
  wire  _T_244 = ~ic_tag_wren_q[1]; // @[el2_ifu_ic_mem.scala 110:61]
  wire  read_enable_1 = _T_244 & ic_tag_clken[1]; // @[el2_ifu_ic_mem.scala 110:79]
  assign tag_mem_0_ic_tag_data_raw_addr = ic_rw_addr_q[6:0];
  assign tag_mem_0_ic_tag_data_raw_data = tag_mem_0[tag_mem_0_ic_tag_data_raw_addr]; // @[el2_ifu_ic_mem.scala 97:20]
  assign tag_mem_0__T_238_data = _T_14 ? _T_221 : _T_226;
  assign tag_mem_0__T_238_addr = ic_rw_addr_q[6:0];
  assign tag_mem_0__T_238_mask = ic_tag_wren_q[0] & ic_tag_clken[0];
  assign tag_mem_0__T_238_en = 1'h1;
  assign tag_mem_1_ic_tag_data_raw_addr = ic_rw_addr_q[6:0];
  assign tag_mem_1_ic_tag_data_raw_data = tag_mem_1[tag_mem_1_ic_tag_data_raw_addr]; // @[el2_ifu_ic_mem.scala 97:20]
  assign tag_mem_1__T_238_data = _T_14 ? _T_221 : _T_226;
  assign tag_mem_1__T_238_addr = ic_rw_addr_q[6:0];
  assign tag_mem_1__T_238_mask = ic_tag_wren_q[1] & ic_tag_clken[1];
  assign tag_mem_1__T_238_en = 1'h1;
  assign io_ictag_debug_rd_data = 26'h0; // @[el2_ifu_ic_mem.scala 64:26]
  assign io_ic_rd_hit = 2'h0; // @[el2_ifu_ic_mem.scala 65:16]
  assign io_ic_tag_perr = 1'h0; // @[el2_ifu_ic_mem.scala 66:18]
  assign io_test_0 = read_enable_0 ? tag_mem_0_ic_tag_data_raw_data : 26'h0; // @[el2_ifu_ic_mem.scala 114:18 el2_ifu_ic_mem.scala 116:20]
  assign io_test_1 = read_enable_1 ? tag_mem_1_ic_tag_data_raw_data : 26'h0; // @[el2_ifu_ic_mem.scala 114:18 el2_ifu_ic_mem.scala 116:20]
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
  end
endmodule
