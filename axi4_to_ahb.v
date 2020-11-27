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
module axi4_to_ahb(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_bus_clk_en,
  input         io_clk_override,
  input         io_axi_awvalid,
  input         io_axi_awid,
  input  [31:0] io_axi_awaddr,
  input  [2:0]  io_axi_awsize,
  input  [2:0]  io_axi_awprot,
  input         io_axi_wvalid,
  input  [63:0] io_axi_wdata,
  input  [7:0]  io_axi_wstrb,
  input         io_axi_wlast,
  input         io_axi_bready,
  input         io_axi_arvalid,
  input         io_axi_arid,
  input  [31:0] io_axi_araddr,
  input  [2:0]  io_axi_arsize,
  input  [2:0]  io_axi_arprot,
  input         io_axi_rready,
  input  [63:0] io_ahb_hrdata,
  input         io_ahb_hready,
  input         io_ahb_hresp,
  output        io_axi_awready,
  output        io_axi_wready,
  output        io_axi_bvalid,
  output [1:0]  io_axi_bresp,
  output        io_axi_bid,
  output        io_axi_arready,
  output        io_axi_rvalid,
  output        io_axi_rid,
  output [31:0] io_axi_rdata,
  output [1:0]  io_axi_rresp,
  output        io_axi_rlast,
  output [31:0] io_ahb_haddr,
  output [2:0]  io_ahb_hburst,
  output        io_ahb_hmastlock,
  output [3:0]  io_ahb_hprot,
  output [2:0]  io_ahb_hsize,
  output [1:0]  io_ahb_htrans,
  output        io_ahb_hwrite,
  output [63:0] io_ahb_hwdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 483:22]
  reg [2:0] buf_nxtstate; // @[axi4_to_ahb.scala 63:29]
  wire  wrbuf_en = io_axi_awvalid & io_axi_awready; // @[axi4_to_ahb.scala 183:30]
  wire  bus_clk = rvclkhdr_io_l1clk; // @[axi4_to_ahb.scala 83:21 axi4_to_ahb.scala 216:11]
  reg  wrbuf_vld; // @[Reg.scala 27:20]
  reg  wrbuf_data_vld; // @[Reg.scala 27:20]
  wire  wr_cmd_vld = wrbuf_vld & wrbuf_data_vld; // @[axi4_to_ahb.scala 193:27]
  wire  master_valid = wr_cmd_vld | io_axi_arvalid; // @[axi4_to_ahb.scala 194:30]
  wire [1:0] _T_28 = wr_cmd_vld ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 196:20]
  wire [2:0] master_opc = {{1'd0}, _T_28}; // @[axi4_to_ahb.scala 196:14]
  wire  _T_149 = master_opc[2:1] == 2'h1; // @[axi4_to_ahb.scala 252:89]
  wire  _T_150 = master_valid & _T_149; // @[axi4_to_ahb.scala 252:70]
  wire  _T_151 = ~_T_150; // @[axi4_to_ahb.scala 252:55]
  wire  wrbuf_data_en = io_axi_wvalid & io_axi_wready; // @[axi4_to_ahb.scala 184:34]
  wire  _T_8 = ~wrbuf_en; // @[axi4_to_ahb.scala 186:33]
  wire  wrbuf_rst = _T_150 & _T_8; // @[axi4_to_ahb.scala 186:31]
  wire  _T_11 = wrbuf_vld & _T_151; // @[axi4_to_ahb.scala 188:33]
  wire  _T_15 = wrbuf_data_vld & _T_151; // @[axi4_to_ahb.scala 189:37]
  reg [31:0] wrbuf_addr; // @[Reg.scala 27:20]
  wire [31:0] master_addr = wr_cmd_vld ? wrbuf_addr : io_axi_araddr; // @[axi4_to_ahb.scala 197:21]
  reg [2:0] wrbuf_size; // @[Reg.scala 27:20]
  wire [2:0] master_size = wr_cmd_vld ? wrbuf_size : io_axi_arsize; // @[axi4_to_ahb.scala 198:21]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] wrbuf_data; // @[Reg.scala 27:20]
  wire  buf_clk = rvclkhdr_2_io_l1clk; // @[axi4_to_ahb.scala 151:21 axi4_to_ahb.scala 433:11]
  reg [63:0] buf_data; // @[Reg.scala 27:20]
  wire  ahbm_data_clk = rvclkhdr_5_io_l1clk; // @[axi4_to_ahb.scala 155:27 axi4_to_ahb.scala 436:17]
  reg [63:0] ahb_hrdata_q; // @[axi4_to_ahb.scala 425:12]
  wire  _T_60 = wrbuf_en | wrbuf_data_en; // @[axi4_to_ahb.scala 214:74]
  wire  _T_69 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 230:54]
  wire  buf_data_wr_en = master_valid & _T_69; // @[axi4_to_ahb.scala 230:38]
  wire [2:0] _T_100 = wrbuf_byteen[7] ? 3'h7 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _T_101 = wrbuf_byteen[6] ? 3'h6 : _T_100; // @[Mux.scala 98:16]
  wire [2:0] _T_102 = wrbuf_byteen[5] ? 3'h5 : _T_101; // @[Mux.scala 98:16]
  wire [2:0] _T_103 = wrbuf_byteen[4] ? 3'h4 : _T_102; // @[Mux.scala 98:16]
  wire [2:0] _T_104 = wrbuf_byteen[3] ? 3'h3 : _T_103; // @[Mux.scala 98:16]
  wire [2:0] _T_105 = wrbuf_byteen[2] ? 3'h2 : _T_104; // @[Mux.scala 98:16]
  wire [2:0] _T_106 = wrbuf_byteen[1] ? 3'h1 : _T_105; // @[Mux.scala 98:16]
  wire [2:0] _T_107 = wrbuf_byteen[0] ? 3'h0 : _T_106; // @[Mux.scala 98:16]
  wire [2:0] buf_cmd_byte_ptr = _T_149 ? _T_107 : master_addr[2:0]; // @[axi4_to_ahb.scala 233:30]
  wire [1:0] _T_113 = master_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_117 = master_opc == 3'h0; // @[axi4_to_ahb.scala 240:61]
  reg [31:0] buf_addr; // @[Reg.scala 27:20]
  wire  _T_540 = master_size[1:0] == 2'h0; // @[axi4_to_ahb.scala 331:24]
  wire  _T_541 = _T_117 | _T_540; // @[axi4_to_ahb.scala 330:51]
  wire  _T_543 = master_size[1:0] == 2'h1; // @[axi4_to_ahb.scala 331:57]
  wire  _T_544 = _T_541 | _T_543; // @[axi4_to_ahb.scala 331:36]
  wire  _T_546 = master_size[1:0] == 2'h2; // @[axi4_to_ahb.scala 331:91]
  wire  _T_547 = _T_544 | _T_546; // @[axi4_to_ahb.scala 331:70]
  wire  _T_549 = master_size[1:0] == 2'h3; // @[axi4_to_ahb.scala 332:25]
  wire  _T_551 = wrbuf_byteen == 8'h3; // @[axi4_to_ahb.scala 332:62]
  wire  _T_553 = wrbuf_byteen == 8'hc; // @[axi4_to_ahb.scala 332:97]
  wire  _T_554 = _T_551 | _T_553; // @[axi4_to_ahb.scala 332:74]
  wire  _T_556 = wrbuf_byteen == 8'h30; // @[axi4_to_ahb.scala 332:132]
  wire  _T_557 = _T_554 | _T_556; // @[axi4_to_ahb.scala 332:109]
  wire  _T_559 = wrbuf_byteen == 8'hc0; // @[axi4_to_ahb.scala 332:168]
  wire  _T_560 = _T_557 | _T_559; // @[axi4_to_ahb.scala 332:145]
  wire  _T_562 = wrbuf_byteen == 8'hf; // @[axi4_to_ahb.scala 333:28]
  wire  _T_563 = _T_560 | _T_562; // @[axi4_to_ahb.scala 332:181]
  wire  _T_565 = wrbuf_byteen == 8'hf0; // @[axi4_to_ahb.scala 333:63]
  wire  _T_566 = _T_563 | _T_565; // @[axi4_to_ahb.scala 333:40]
  wire  _T_568 = wrbuf_byteen == 8'hff; // @[axi4_to_ahb.scala 333:99]
  wire  _T_569 = _T_566 | _T_568; // @[axi4_to_ahb.scala 333:76]
  wire  _T_570 = _T_549 & _T_569; // @[axi4_to_ahb.scala 332:38]
  wire  buf_aligned_in = _T_547 | _T_570; // @[axi4_to_ahb.scala 331:104]
  wire  _T_452 = buf_aligned_in & _T_149; // @[axi4_to_ahb.scala 325:55]
  wire [2:0] _T_489 = _T_452 ? 3'h0 : master_addr[2:0]; // @[axi4_to_ahb.scala 325:38]
  wire [34:0] _T_490 = {master_addr,_T_489}; // @[Cat.scala 29:58]
  wire  _T_499 = buf_aligned_in & _T_549; // @[axi4_to_ahb.scala 329:38]
  wire  _T_502 = _T_499 & _T_149; // @[axi4_to_ahb.scala 329:72]
  wire [1:0] _T_536 = _T_502 ? 2'h0 : master_size[1:0]; // @[axi4_to_ahb.scala 329:21]
  wire [31:0] _T_575 = {master_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [31:0] _T_578 = {buf_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [1:0] _T_582 = buf_aligned_in ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] buf_size_in = {{1'd0}, _T_536}; // @[axi4_to_ahb.scala 329:15]
  wire [1:0] _T_584 = _T_582 & buf_size_in[1:0]; // @[axi4_to_ahb.scala 336:80]
  wire [2:0] _T_585 = {1'h0,_T_584}; // @[Cat.scala 29:58]
  wire  _T_593 = ~io_axi_arprot[2]; // @[axi4_to_ahb.scala 340:33]
  wire [1:0] _T_594 = {1'h1,_T_593}; // @[Cat.scala 29:58]
  reg  buf_write; // @[Reg.scala 27:20]
  wire [31:0] buf_addr_in = _T_490[31:0]; // @[axi4_to_ahb.scala 325:15]
  wire  _T_652 = master_valid & io_bus_clk_en; // @[axi4_to_ahb.scala 379:61]
  wire  _T_664 = buf_data_wr_en & io_bus_clk_en; // @[axi4_to_ahb.scala 391:66]
  wire  _T_688 = master_valid | io_clk_override; // @[axi4_to_ahb.scala 428:58]
  wire  _T_691 = io_ahb_hready & io_ahb_htrans[1]; // @[axi4_to_ahb.scala 429:54]
  wire  _T_692 = _T_691 | io_clk_override; // @[axi4_to_ahb.scala 429:74]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  assign io_axi_awready = ~_T_11; // @[axi4_to_ahb.scala 188:18]
  assign io_axi_wready = ~_T_15; // @[axi4_to_ahb.scala 189:17]
  assign io_axi_bvalid = 1'h0; // @[axi4_to_ahb.scala 203:17]
  assign io_axi_bresp = 2'h0; // @[axi4_to_ahb.scala 204:16]
  assign io_axi_bid = 1'h0; // @[axi4_to_ahb.scala 205:14]
  assign io_axi_arready = ~wr_cmd_vld; // @[axi4_to_ahb.scala 190:18]
  assign io_axi_rvalid = 1'h0; // @[axi4_to_ahb.scala 207:17]
  assign io_axi_rid = 1'h0; // @[axi4_to_ahb.scala 209:14]
  assign io_axi_rdata = ahb_hrdata_q[31:0]; // @[axi4_to_ahb.scala 210:16]
  assign io_axi_rresp = 2'h0; // @[axi4_to_ahb.scala 208:16]
  assign io_axi_rlast = 1'h1; // @[axi4_to_ahb.scala 191:16]
  assign io_ahb_haddr = master_valid ? _T_575 : _T_578; // @[axi4_to_ahb.scala 335:16]
  assign io_ahb_hburst = 3'h0; // @[axi4_to_ahb.scala 338:17]
  assign io_ahb_hmastlock = 1'h0; // @[axi4_to_ahb.scala 339:20]
  assign io_ahb_hprot = {{2'd0}, _T_594}; // @[axi4_to_ahb.scala 340:16]
  assign io_ahb_hsize = master_valid ? _T_585 : 3'h0; // @[axi4_to_ahb.scala 336:16]
  assign io_ahb_htrans = _T_113 & 2'h2; // @[axi4_to_ahb.scala 220:17 axi4_to_ahb.scala 236:21 axi4_to_ahb.scala 248:21 axi4_to_ahb.scala 263:21 axi4_to_ahb.scala 273:21 axi4_to_ahb.scala 293:21 axi4_to_ahb.scala 307:21]
  assign io_ahb_hwrite = master_valid ? _T_149 : buf_write; // @[axi4_to_ahb.scala 341:17]
  assign io_ahb_hwdata = buf_data; // @[axi4_to_ahb.scala 342:17]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_60; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_2_io_en = io_bus_clk_en & _T_688; // @[el2_lib.scala 485:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_3_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_4_io_en = io_bus_clk_en & _T_692; // @[el2_lib.scala 485:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_5_io_en = io_bus_clk_en & io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
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
  buf_nxtstate = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  wrbuf_vld = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wrbuf_data_vld = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wrbuf_addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  wrbuf_size = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  wrbuf_byteen = _RAND_5[7:0];
  _RAND_6 = {2{`RANDOM}};
  wrbuf_data = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  buf_data = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  ahb_hrdata_q = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  buf_addr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  buf_write = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_nxtstate = 3'h0;
  end
  if (reset) begin
    wrbuf_vld = 1'h0;
  end
  if (reset) begin
    wrbuf_data_vld = 1'h0;
  end
  if (reset) begin
    wrbuf_addr = 32'h0;
  end
  if (reset) begin
    wrbuf_size = 3'h0;
  end
  if (reset) begin
    wrbuf_byteen = 8'h0;
  end
  if (reset) begin
    wrbuf_data = 64'h0;
  end
  if (reset) begin
    buf_data = 64'h0;
  end
  if (reset) begin
    ahb_hrdata_q = 64'h0;
  end
  if (reset) begin
    buf_addr = 32'h0;
  end
  if (reset) begin
    buf_write = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_nxtstate <= 3'h0;
    end else if (_T_149) begin
      buf_nxtstate <= 3'h2;
    end else begin
      buf_nxtstate <= 3'h1;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else if (wrbuf_en) begin
      wrbuf_vld <= wrbuf_rst;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else if (wrbuf_data_en) begin
      wrbuf_data_vld <= wrbuf_rst;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_addr <= 32'h0;
    end else if (wrbuf_en) begin
      wrbuf_addr <= io_axi_awaddr;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_size <= 3'h0;
    end else if (wrbuf_en) begin
      wrbuf_size <= io_axi_awsize;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_byteen <= 8'h0;
    end else if (wrbuf_data_en) begin
      wrbuf_byteen <= io_axi_wstrb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_data <= 64'h0;
    end else if (wrbuf_data_en) begin
      wrbuf_data <= io_axi_wdata;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data <= 64'h0;
    end else if (_T_664) begin
      buf_data <= wrbuf_data;
    end
  end
  always @(posedge ahbm_data_clk or posedge reset) begin
    if (reset) begin
      ahb_hrdata_q <= 64'h0;
    end else begin
      ahb_hrdata_q <= io_ahb_hrdata;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_addr <= 32'h0;
    end else if (_T_652) begin
      buf_addr <= buf_addr_in;
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_write <= 1'h0;
    end else if (master_valid) begin
      buf_write <= _T_149;
    end
  end
endmodule
