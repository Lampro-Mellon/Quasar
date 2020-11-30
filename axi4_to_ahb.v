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
  output [63:0] io_axi_rdata,
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
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 483:22]
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
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 483:22]
  reg [2:0] buf_nxtstate; // @[axi4_to_ahb.scala 62:29]
  wire  _T = io_axi_awvalid & io_axi_awready; // @[axi4_to_ahb.scala 182:30]
  wire  ahbm_clk = rvclkhdr_7_io_l1clk; // @[axi4_to_ahb.scala 152:22 axi4_to_ahb.scala 433:12]
  reg [2:0] buf_state; // @[axi4_to_ahb.scala 368:12]
  wire  _T_63 = 3'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_115 = 3'h1 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hready_q; // @[axi4_to_ahb.scala 412:12]
  reg [1:0] ahb_htrans_q; // @[axi4_to_ahb.scala 415:12]
  wire  _T_129 = ahb_htrans_q != 2'h0; // @[axi4_to_ahb.scala 243:59]
  wire  _T_130 = ahb_hready_q & _T_129; // @[axi4_to_ahb.scala 243:37]
  wire  ahbm_addr_clk = rvclkhdr_8_io_l1clk; // @[axi4_to_ahb.scala 153:27 axi4_to_ahb.scala 434:17]
  reg  ahb_hwrite_q; // @[axi4_to_ahb.scala 418:12]
  wire  _T_131 = ~ahb_hwrite_q; // @[axi4_to_ahb.scala 243:73]
  wire  _T_132 = _T_130 & _T_131; // @[axi4_to_ahb.scala 243:71]
  wire  _T_133 = buf_nxtstate == 3'h6; // @[axi4_to_ahb.scala 243:104]
  wire  _T_134 = _T_132 & _T_133; // @[axi4_to_ahb.scala 243:88]
  wire  _T_145 = 3'h6 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hresp_q; // @[axi4_to_ahb.scala 421:12]
  wire  _T_146 = ~ahb_hresp_q; // @[axi4_to_ahb.scala 251:39]
  wire  _T_147 = ahb_hready_q & _T_146; // @[axi4_to_ahb.scala 251:37]
  wire  bus_clk = rvclkhdr_io_l1clk; // @[axi4_to_ahb.scala 82:21 axi4_to_ahb.scala 215:11]
  reg  wrbuf_vld; // @[axi4_to_ahb.scala 351:48]
  reg  wrbuf_data_vld; // @[axi4_to_ahb.scala 352:48]
  wire  wr_cmd_vld = wrbuf_vld & wrbuf_data_vld; // @[axi4_to_ahb.scala 192:27]
  wire  master_valid = wr_cmd_vld | io_axi_arvalid; // @[axi4_to_ahb.scala 193:30]
  wire [1:0] _T_28 = wr_cmd_vld ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 195:20]
  wire [2:0] master_opc = {{1'd0}, _T_28}; // @[axi4_to_ahb.scala 195:14]
  wire  _T_149 = master_opc[2:1] == 2'h1; // @[axi4_to_ahb.scala 251:89]
  wire  _T_150 = master_valid & _T_149; // @[axi4_to_ahb.scala 251:70]
  wire  _T_151 = ~_T_150; // @[axi4_to_ahb.scala 251:55]
  wire  _T_152 = _T_147 & _T_151; // @[axi4_to_ahb.scala 251:53]
  wire  _T_180 = 3'h7 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_191 = 3'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_193 = 3'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_286 = 3'h4 == buf_state; // @[Conditional.scala 37:30]
  reg  cmd_doneQ; // @[axi4_to_ahb.scala 403:12]
  wire  _T_289 = cmd_doneQ & ahb_hready_q; // @[axi4_to_ahb.scala 297:35]
  wire  _T_290 = _T_289 | ahb_hresp_q; // @[axi4_to_ahb.scala 297:51]
  wire  _T_292 = _T_290 & _T_146; // @[axi4_to_ahb.scala 297:66]
  wire  slave_ready = io_axi_bready & io_axi_rready; // @[axi4_to_ahb.scala 210:32]
  wire  _T_293 = _T_292 & slave_ready; // @[axi4_to_ahb.scala 297:81]
  wire  _GEN_4 = _T_286 & _T_293; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_193 ? 1'h0 : _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_191 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_180 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_145 ? _T_152 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_115 ? _T_134 : _GEN_66; // @[Conditional.scala 39:67]
  wire  master_ready = _T_63 | _GEN_86; // @[Conditional.scala 40:58]
  wire  wrbuf_en = _T & master_ready; // @[axi4_to_ahb.scala 182:47]
  wire  _T_2 = io_axi_wvalid & io_axi_wready; // @[axi4_to_ahb.scala 183:34]
  wire  wrbuf_data_en = _T_2 & master_ready; // @[axi4_to_ahb.scala 183:50]
  wire  _T_4 = master_valid & master_ready; // @[axi4_to_ahb.scala 184:34]
  wire  wrbuf_cmd_sent = _T_4 & _T_149; // @[axi4_to_ahb.scala 184:49]
  wire  _T_8 = ~wrbuf_en; // @[axi4_to_ahb.scala 185:33]
  wire  wrbuf_rst = wrbuf_cmd_sent & _T_8; // @[axi4_to_ahb.scala 185:31]
  wire  _T_10 = ~wrbuf_cmd_sent; // @[axi4_to_ahb.scala 187:35]
  wire  _T_11 = wrbuf_vld & _T_10; // @[axi4_to_ahb.scala 187:33]
  wire  _T_12 = ~_T_11; // @[axi4_to_ahb.scala 187:21]
  wire  _T_15 = wrbuf_data_vld & _T_10; // @[axi4_to_ahb.scala 188:37]
  wire  _T_16 = ~_T_15; // @[axi4_to_ahb.scala 188:20]
  wire  _T_19 = ~wr_cmd_vld; // @[axi4_to_ahb.scala 189:21]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg [31:0] wrbuf_addr; // @[el2_lib.scala 514:16]
  wire [31:0] master_addr = wr_cmd_vld ? wrbuf_addr : io_axi_araddr; // @[axi4_to_ahb.scala 196:21]
  reg [2:0] wrbuf_size; // @[Reg.scala 27:20]
  wire [2:0] master_size = wr_cmd_vld ? wrbuf_size : io_axi_arsize; // @[axi4_to_ahb.scala 197:21]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] wrbuf_data; // @[el2_lib.scala 514:16]
  wire  _T_161 = ahb_hready_q | ahb_hresp_q; // @[axi4_to_ahb.scala 254:37]
  wire  _T_194 = ahb_hready_q & ahb_hwrite_q; // @[axi4_to_ahb.scala 286:33]
  wire  _T_197 = _T_194 & _T_129; // @[axi4_to_ahb.scala 286:48]
  wire  _GEN_15 = _T_286 & _T_197; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_193 ? _T_197 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_191 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_180 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_145 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_115 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  trxn_done = _T_63 ? 1'h0 : _GEN_95; // @[Conditional.scala 40:58]
  wire  _T_449 = 3'h5 == buf_state; // @[Conditional.scala 37:30]
  wire  _GEN_1 = _T_449 & slave_ready; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_286 ? _T_290 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_193 ? trxn_done : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_191 ? _T_161 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_180 ? _T_132 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_145 ? _T_161 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_115 ? _T_132 : _GEN_69; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_63 ? _T_4 : _GEN_83; // @[Conditional.scala 40:58]
  wire  _T_163 = buf_state_en & _T_146; // @[axi4_to_ahb.scala 258:39]
  wire  _T_366 = buf_nxtstate != 3'h5; // @[axi4_to_ahb.scala 307:55]
  wire  _T_367 = buf_state_en & _T_366; // @[axi4_to_ahb.scala 307:39]
  wire  _GEN_14 = _T_286 ? _T_367 : _T_449; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_193 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_191 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_180 ? buf_state_en : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_145 ? _T_163 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_115 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  slave_valid_pre = _T_63 ? 1'h0 : _GEN_94; // @[Conditional.scala 40:58]
  wire  _T_39 = slave_valid_pre & slave_ready; // @[axi4_to_ahb.scala 202:32]
  wire  buf_clk = rvclkhdr_6_io_l1clk; // @[axi4_to_ahb.scala 150:21 axi4_to_ahb.scala 432:12]
  reg  slvbuf_write; // @[Reg.scala 27:20]
  wire [1:0] _T_601 = slvbuf_write ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 344:23]
  reg  slvbuf_error; // @[Reg.scala 27:20]
  wire [1:0] _T_603 = slvbuf_error ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_604 = _T_603 & 2'h2; // @[axi4_to_ahb.scala 344:88]
  wire [3:0] slave_opc = {_T_601,_T_604}; // @[Cat.scala 29:58]
  wire [1:0] _T_44 = slave_opc[1] ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 203:49]
  reg  slvbuf_tag; // @[Reg.scala 27:20]
  wire  _T_49 = slave_opc[3:2] == 2'h0; // @[axi4_to_ahb.scala 206:65]
  reg [31:0] last_bus_addr; // @[Reg.scala 27:20]
  wire [63:0] _T_608 = {last_bus_addr,last_bus_addr}; // @[Cat.scala 29:58]
  wire  _T_609 = buf_state == 3'h5; // @[axi4_to_ahb.scala 345:91]
  reg [63:0] buf_data; // @[el2_lib.scala 514:16]
  wire  ahbm_data_clk = rvclkhdr_9_io_l1clk; // @[axi4_to_ahb.scala 154:27 axi4_to_ahb.scala 435:17]
  reg [63:0] ahb_hrdata_q; // @[axi4_to_ahb.scala 424:12]
  wire [63:0] _T_612 = _T_609 ? buf_data : ahb_hrdata_q; // @[axi4_to_ahb.scala 345:79]
  wire  _T_60 = _T | _T_2; // @[axi4_to_ahb.scala 213:74]
  wire  _GEN_8 = _T_286 & _T_149; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_193 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_191 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_180 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_145 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_115 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  buf_write_in = _T_63 ? _T_149 : _GEN_97; // @[Conditional.scala 40:58]
  wire  _T_69 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 229:54]
  wire  _T_70 = buf_state_en & _T_69; // @[axi4_to_ahb.scala 229:38]
  wire [2:0] _T_100 = wrbuf_byteen[7] ? 3'h7 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _T_101 = wrbuf_byteen[6] ? 3'h6 : _T_100; // @[Mux.scala 98:16]
  wire [2:0] _T_102 = wrbuf_byteen[5] ? 3'h5 : _T_101; // @[Mux.scala 98:16]
  wire [2:0] _T_103 = wrbuf_byteen[4] ? 3'h4 : _T_102; // @[Mux.scala 98:16]
  wire [2:0] _T_104 = wrbuf_byteen[3] ? 3'h3 : _T_103; // @[Mux.scala 98:16]
  wire [2:0] _T_105 = wrbuf_byteen[2] ? 3'h2 : _T_104; // @[Mux.scala 98:16]
  wire [2:0] _T_106 = wrbuf_byteen[1] ? 3'h1 : _T_105; // @[Mux.scala 98:16]
  wire [2:0] _T_107 = wrbuf_byteen[0] ? 3'h0 : _T_106; // @[Mux.scala 98:16]
  wire [2:0] _T_109 = buf_write_in ? _T_107 : master_addr[2:0]; // @[axi4_to_ahb.scala 232:30]
  wire  _T_110 = buf_nxtstate == 3'h1; // @[axi4_to_ahb.scala 234:51]
  wire  _T_135 = master_ready & master_valid; // @[axi4_to_ahb.scala 245:33]
  wire  _T_168 = _T_135 & _T_133; // @[axi4_to_ahb.scala 260:48]
  wire  _T_169 = _T_168 & buf_state_en; // @[axi4_to_ahb.scala 260:79]
  wire  _T_357 = buf_state_en & buf_write_in; // @[axi4_to_ahb.scala 305:33]
  wire  _T_359 = _T_357 & _T_69; // @[axi4_to_ahb.scala 305:48]
  wire  _GEN_12 = _T_286 & _T_359; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_193 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_191 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_180 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_145 ? _T_169 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_115 ? _T_135 : _GEN_75; // @[Conditional.scala 39:67]
  wire  bypass_en = _T_63 ? buf_state_en : _GEN_88; // @[Conditional.scala 40:58]
  wire [1:0] _T_113 = bypass_en ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_114 = _T_113 & 2'h2; // @[axi4_to_ahb.scala 235:45]
  wire  _T_117 = master_opc == 3'h0; // @[axi4_to_ahb.scala 239:61]
  wire  _T_118 = master_valid & _T_117; // @[axi4_to_ahb.scala 239:41]
  wire  _T_126 = ~master_valid; // @[axi4_to_ahb.scala 241:34]
  wire  _T_127 = buf_state_en & _T_126; // @[axi4_to_ahb.scala 241:32]
  reg [31:0] buf_addr; // @[el2_lib.scala 514:16]
  wire [2:0] _T_139 = bypass_en ? master_addr[2:0] : buf_addr[2:0]; // @[axi4_to_ahb.scala 246:30]
  wire  _T_140 = ~buf_state_en; // @[axi4_to_ahb.scala 247:44]
  wire  _T_141 = _T_140 | bypass_en; // @[axi4_to_ahb.scala 247:58]
  wire [1:0] _T_143 = _T_141 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_144 = 2'h2 & _T_143; // @[axi4_to_ahb.scala 247:32]
  wire  _T_156 = _T_4 & _T_117; // @[axi4_to_ahb.scala 252:49]
  wire  _T_308 = _T_69 | _T_110; // @[axi4_to_ahb.scala 302:62]
  wire  _T_309 = buf_state_en & _T_308; // @[axi4_to_ahb.scala 302:33]
  wire  _GEN_9 = _T_286 & _T_309; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_193 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_191 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_180 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_145 ? _T_156 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_115 ? master_ready : _GEN_67; // @[Conditional.scala 39:67]
  wire  buf_wr_en = _T_63 ? buf_state_en : _GEN_87; // @[Conditional.scala 40:58]
  wire  _T_174 = buf_nxtstate != 3'h6; // @[axi4_to_ahb.scala 262:59]
  wire  _T_175 = _T_174 & buf_state_en; // @[axi4_to_ahb.scala 262:74]
  wire  _T_176 = ~_T_175; // @[axi4_to_ahb.scala 262:43]
  wire [1:0] _T_178 = _T_176 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_179 = 2'h2 & _T_178; // @[axi4_to_ahb.scala 262:32]
  wire [1:0] _T_189 = _T_140 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_190 = 2'h2 & _T_189; // @[axi4_to_ahb.scala 272:37]
  reg [2:0] buf_cmd_byte_ptrQ; // @[Reg.scala 27:20]
  reg [7:0] buf_byteen; // @[Reg.scala 27:20]
  wire [2:0] _T_202 = buf_cmd_byte_ptrQ + 3'h1; // @[axi4_to_ahb.scala 176:52]
  wire  _T_205 = 3'h0 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_206 = buf_byteen[0] & _T_205; // @[axi4_to_ahb.scala 177:48]
  wire  _T_208 = 3'h1 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_209 = buf_byteen[1] & _T_208; // @[axi4_to_ahb.scala 177:48]
  wire  _T_211 = 3'h2 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_212 = buf_byteen[2] & _T_211; // @[axi4_to_ahb.scala 177:48]
  wire  _T_214 = 3'h3 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_215 = buf_byteen[3] & _T_214; // @[axi4_to_ahb.scala 177:48]
  wire  _T_217 = 3'h4 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_218 = buf_byteen[4] & _T_217; // @[axi4_to_ahb.scala 177:48]
  wire  _T_220 = 3'h5 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_221 = buf_byteen[5] & _T_220; // @[axi4_to_ahb.scala 177:48]
  wire  _T_223 = 3'h6 >= _T_202; // @[axi4_to_ahb.scala 177:62]
  wire  _T_224 = buf_byteen[6] & _T_223; // @[axi4_to_ahb.scala 177:48]
  wire [2:0] _T_228 = buf_byteen[7] ? 3'h7 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _T_229 = _T_224 ? 3'h6 : _T_228; // @[Mux.scala 98:16]
  wire [2:0] _T_230 = _T_221 ? 3'h5 : _T_229; // @[Mux.scala 98:16]
  wire [2:0] _T_231 = _T_218 ? 3'h4 : _T_230; // @[Mux.scala 98:16]
  wire [2:0] _T_232 = _T_215 ? 3'h3 : _T_231; // @[Mux.scala 98:16]
  wire [2:0] _T_233 = _T_212 ? 3'h2 : _T_232; // @[Mux.scala 98:16]
  wire [2:0] _T_234 = _T_209 ? 3'h1 : _T_233; // @[Mux.scala 98:16]
  wire [2:0] _T_235 = _T_206 ? 3'h0 : _T_234; // @[Mux.scala 98:16]
  wire [2:0] _T_236 = trxn_done ? _T_235 : buf_cmd_byte_ptrQ; // @[axi4_to_ahb.scala 290:30]
  wire  _T_237 = buf_cmd_byte_ptrQ == 3'h7; // @[axi4_to_ahb.scala 291:65]
  reg  buf_aligned; // @[Reg.scala 27:20]
  wire  _T_238 = buf_aligned | _T_237; // @[axi4_to_ahb.scala 291:44]
  wire [7:0] _T_276 = buf_byteen >> _T_235; // @[axi4_to_ahb.scala 291:92]
  wire  _T_278 = ~_T_276[0]; // @[axi4_to_ahb.scala 291:163]
  wire  _T_279 = _T_238 | _T_278; // @[axi4_to_ahb.scala 291:79]
  wire  _T_280 = trxn_done & _T_279; // @[axi4_to_ahb.scala 291:29]
  wire  _T_354 = _T_237 | _T_278; // @[axi4_to_ahb.scala 304:118]
  wire  _T_355 = _T_130 & _T_354; // @[axi4_to_ahb.scala 304:82]
  wire  _T_356 = ahb_hresp_q | _T_355; // @[axi4_to_ahb.scala 304:32]
  wire  _GEN_11 = _T_286 & _T_356; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_193 ? _T_280 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_191 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_180 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_145 ? _T_127 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_115 ? _T_127 : _GEN_74; // @[Conditional.scala 39:67]
  wire  cmd_done = _T_63 ? 1'h0 : _GEN_84; // @[Conditional.scala 40:58]
  wire  _T_281 = cmd_done | cmd_doneQ; // @[axi4_to_ahb.scala 292:43]
  wire  _T_282 = ~_T_281; // @[axi4_to_ahb.scala 292:32]
  wire [1:0] _T_284 = _T_282 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_285 = _T_284 & 2'h2; // @[axi4_to_ahb.scala 292:57]
  wire  _T_294 = ~slave_ready; // @[axi4_to_ahb.scala 298:42]
  wire  _T_295 = ahb_hresp_q | _T_294; // @[axi4_to_ahb.scala 298:40]
  wire  _T_362 = _T_282 | bypass_en; // @[axi4_to_ahb.scala 306:57]
  wire [1:0] _T_364 = _T_362 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_365 = _T_364 & 2'h2; // @[axi4_to_ahb.scala 306:71]
  wire  _T_372 = trxn_done | bypass_en; // @[axi4_to_ahb.scala 309:40]
  wire [2:0] _T_448 = bypass_en ? _T_107 : _T_236; // @[axi4_to_ahb.scala 312:30]
  wire  _GEN_6 = _T_286 & ahb_hresp_q; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_286 ? buf_state_en : _T_449; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_286 & buf_wr_en; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_13 = _T_286 ? _T_365 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_286 & _T_372; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_286 ? _T_448 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_193 ? buf_state_en : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_193 & buf_state_en; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_193 ? _T_236 : _GEN_17; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_25 = _T_193 ? _T_285 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_193 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_193 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_191 ? buf_state_en : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_191 ? buf_state_en : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_191 ? buf_state_en : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_191 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_42 = _T_191 ? 3'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_44 = _T_191 ? 2'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_180 ? buf_state_en : _GEN_39; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_54 = _T_180 ? buf_addr[2:0] : _GEN_42; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_55 = _T_180 ? _T_190 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_180 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_180 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_180 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_145 ? buf_state_en : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_145 ? buf_state_en : _GEN_58; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_76 = _T_145 ? _T_139 : _GEN_54; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_77 = _T_145 ? _T_179 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_145 ? buf_wr_en : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_145 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_115 ? buf_state_en : _GEN_78; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_89 = _T_115 ? _T_139 : _GEN_76; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_90 = _T_115 ? _T_144 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_115 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_115 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_115 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67]
  wire  buf_data_wr_en = _T_63 ? _T_70 : _GEN_91; // @[Conditional.scala 40:58]
  wire  buf_cmd_byte_ptr_en = _T_63 ? buf_state_en : _GEN_96; // @[Conditional.scala 40:58]
  wire [2:0] buf_cmd_byte_ptr = _T_63 ? _T_109 : _GEN_89; // @[Conditional.scala 40:58]
  wire  slvbuf_wr_en = _T_63 ? 1'h0 : _GEN_85; // @[Conditional.scala 40:58]
  wire  slvbuf_error_en = _T_63 ? 1'h0 : _GEN_93; // @[Conditional.scala 40:58]
  wire  _T_540 = master_size[1:0] == 2'h0; // @[axi4_to_ahb.scala 330:24]
  wire  _T_541 = _T_117 | _T_540; // @[axi4_to_ahb.scala 329:51]
  wire  _T_543 = master_size[1:0] == 2'h1; // @[axi4_to_ahb.scala 330:57]
  wire  _T_544 = _T_541 | _T_543; // @[axi4_to_ahb.scala 330:36]
  wire  _T_546 = master_size[1:0] == 2'h2; // @[axi4_to_ahb.scala 330:91]
  wire  _T_547 = _T_544 | _T_546; // @[axi4_to_ahb.scala 330:70]
  wire  _T_549 = master_size[1:0] == 2'h3; // @[axi4_to_ahb.scala 331:25]
  wire  _T_551 = wrbuf_byteen == 8'h3; // @[axi4_to_ahb.scala 331:62]
  wire  _T_553 = wrbuf_byteen == 8'hc; // @[axi4_to_ahb.scala 331:97]
  wire  _T_554 = _T_551 | _T_553; // @[axi4_to_ahb.scala 331:74]
  wire  _T_556 = wrbuf_byteen == 8'h30; // @[axi4_to_ahb.scala 331:132]
  wire  _T_557 = _T_554 | _T_556; // @[axi4_to_ahb.scala 331:109]
  wire  _T_559 = wrbuf_byteen == 8'hc0; // @[axi4_to_ahb.scala 331:168]
  wire  _T_560 = _T_557 | _T_559; // @[axi4_to_ahb.scala 331:145]
  wire  _T_562 = wrbuf_byteen == 8'hf; // @[axi4_to_ahb.scala 332:28]
  wire  _T_563 = _T_560 | _T_562; // @[axi4_to_ahb.scala 331:181]
  wire  _T_565 = wrbuf_byteen == 8'hf0; // @[axi4_to_ahb.scala 332:63]
  wire  _T_566 = _T_563 | _T_565; // @[axi4_to_ahb.scala 332:40]
  wire  _T_568 = wrbuf_byteen == 8'hff; // @[axi4_to_ahb.scala 332:99]
  wire  _T_569 = _T_566 | _T_568; // @[axi4_to_ahb.scala 332:76]
  wire  _T_570 = _T_549 & _T_569; // @[axi4_to_ahb.scala 331:38]
  wire  buf_aligned_in = _T_547 | _T_570; // @[axi4_to_ahb.scala 330:104]
  wire  _T_452 = buf_aligned_in & _T_149; // @[axi4_to_ahb.scala 324:55]
  wire [2:0] _T_489 = _T_452 ? 3'h0 : master_addr[2:0]; // @[axi4_to_ahb.scala 324:38]
  wire [34:0] _T_490 = {master_addr,_T_489}; // @[Cat.scala 29:58]
  wire  _T_493 = buf_state == 3'h3; // @[axi4_to_ahb.scala 327:33]
  wire  _T_499 = buf_aligned_in & _T_549; // @[axi4_to_ahb.scala 328:38]
  wire  _T_502 = _T_499 & _T_149; // @[axi4_to_ahb.scala 328:72]
  wire [1:0] _T_536 = _T_502 ? 2'h0 : master_size[1:0]; // @[axi4_to_ahb.scala 328:21]
  wire [31:0] _T_575 = {master_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [31:0] _T_578 = {buf_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [1:0] _T_582 = buf_aligned_in ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] buf_size_in = {{1'd0}, _T_536}; // @[axi4_to_ahb.scala 328:15]
  wire [1:0] _T_584 = _T_582 & buf_size_in[1:0]; // @[axi4_to_ahb.scala 335:80]
  wire [2:0] _T_585 = {1'h0,_T_584}; // @[Cat.scala 29:58]
  wire  _T_593 = ~io_axi_arprot[2]; // @[axi4_to_ahb.scala 339:33]
  wire [1:0] _T_594 = {1'h1,_T_593}; // @[Cat.scala 29:58]
  reg  buf_write; // @[Reg.scala 27:20]
  wire  _T_616 = io_ahb_htrans != 2'h0; // @[axi4_to_ahb.scala 348:40]
  wire  _T_617 = _T_616 & io_ahb_hready; // @[axi4_to_ahb.scala 348:52]
  wire  last_addr_en = _T_617 & io_ahb_hwrite; // @[axi4_to_ahb.scala 348:68]
  wire  _T_620 = wrbuf_en | wrbuf_vld; // @[axi4_to_ahb.scala 351:52]
  wire  _T_621 = ~wrbuf_rst; // @[axi4_to_ahb.scala 351:88]
  wire  _T_625 = wrbuf_data_en | wrbuf_data_vld; // @[axi4_to_ahb.scala 352:52]
  wire [2:0] _T_646 = buf_state_en ? buf_nxtstate : buf_state; // @[axi4_to_ahb.scala 368:16]
  reg  buf_tag; // @[Reg.scala 27:20]
  wire  _T_680 = ~slave_valid_pre; // @[axi4_to_ahb.scala 403:52]
  wire  _T_693 = buf_wr_en | slvbuf_wr_en; // @[axi4_to_ahb.scala 427:43]
  wire  _T_694 = _T_693 | io_clk_override; // @[axi4_to_ahb.scala 427:58]
  wire  _T_697 = io_ahb_hready & io_ahb_htrans[1]; // @[axi4_to_ahb.scala 428:54]
  wire  _T_698 = _T_697 | io_clk_override; // @[axi4_to_ahb.scala 428:74]
  wire  _T_700 = buf_state != 3'h0; // @[axi4_to_ahb.scala 429:50]
  wire  _T_701 = _T_700 | io_clk_override; // @[axi4_to_ahb.scala 429:60]
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
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  assign io_axi_awready = _T_12 & master_ready; // @[axi4_to_ahb.scala 187:18]
  assign io_axi_wready = _T_16 & master_ready; // @[axi4_to_ahb.scala 188:17]
  assign io_axi_bvalid = _T_39 & slave_opc[3]; // @[axi4_to_ahb.scala 202:17]
  assign io_axi_bresp = slave_opc[0] ? 2'h2 : _T_44; // @[axi4_to_ahb.scala 203:16]
  assign io_axi_bid = slvbuf_tag; // @[axi4_to_ahb.scala 204:14]
  assign io_axi_arready = _T_19 & master_ready; // @[axi4_to_ahb.scala 189:18]
  assign io_axi_rvalid = _T_39 & _T_49; // @[axi4_to_ahb.scala 206:17]
  assign io_axi_rid = slvbuf_tag; // @[axi4_to_ahb.scala 208:14]
  assign io_axi_rdata = slvbuf_error ? _T_608 : _T_612; // @[axi4_to_ahb.scala 209:16]
  assign io_axi_rresp = slave_opc[0] ? 2'h2 : _T_44; // @[axi4_to_ahb.scala 207:16]
  assign io_axi_rlast = 1'h1; // @[axi4_to_ahb.scala 190:16]
  assign io_ahb_haddr = bypass_en ? _T_575 : _T_578; // @[axi4_to_ahb.scala 334:16]
  assign io_ahb_hburst = 3'h0; // @[axi4_to_ahb.scala 337:17]
  assign io_ahb_hmastlock = 1'h0; // @[axi4_to_ahb.scala 338:20]
  assign io_ahb_hprot = {{2'd0}, _T_594}; // @[axi4_to_ahb.scala 339:16]
  assign io_ahb_hsize = bypass_en ? _T_585 : 3'h0; // @[axi4_to_ahb.scala 335:16]
  assign io_ahb_htrans = _T_63 ? _T_114 : _GEN_90; // @[axi4_to_ahb.scala 219:17 axi4_to_ahb.scala 235:21 axi4_to_ahb.scala 247:21 axi4_to_ahb.scala 262:21 axi4_to_ahb.scala 272:21 axi4_to_ahb.scala 292:21 axi4_to_ahb.scala 306:21]
  assign io_ahb_hwrite = bypass_en ? _T_149 : buf_write; // @[axi4_to_ahb.scala 340:17]
  assign io_ahb_hwdata = buf_data; // @[axi4_to_ahb.scala 341:17]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_60; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = _T & master_ready; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = _T_2 & master_ready; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = buf_wr_en & io_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = buf_data_wr_en & io_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_6_io_en = io_bus_clk_en & _T_694; // @[el2_lib.scala 485:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_7_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_8_io_en = io_bus_clk_en & _T_698; // @[el2_lib.scala 485:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_9_io_en = io_bus_clk_en & _T_701; // @[el2_lib.scala 485:16]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
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
  buf_state = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  ahb_hready_q = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ahb_htrans_q = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  ahb_hwrite_q = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ahb_hresp_q = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wrbuf_vld = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  wrbuf_data_vld = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cmd_doneQ = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  wrbuf_tag = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  wrbuf_addr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  wrbuf_size = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  wrbuf_byteen = _RAND_12[7:0];
  _RAND_13 = {2{`RANDOM}};
  wrbuf_data = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  slvbuf_write = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  slvbuf_error = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  slvbuf_tag = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  last_bus_addr = _RAND_17[31:0];
  _RAND_18 = {2{`RANDOM}};
  buf_data = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  ahb_hrdata_q = _RAND_19[63:0];
  _RAND_20 = {1{`RANDOM}};
  buf_addr = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  buf_cmd_byte_ptrQ = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  buf_byteen = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  buf_aligned = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  buf_write = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  buf_tag = _RAND_25[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_nxtstate = 3'h0;
  end
  if (reset) begin
    buf_state = 3'h0;
  end
  if (reset) begin
    ahb_hready_q = 1'h0;
  end
  if (reset) begin
    ahb_htrans_q = 2'h0;
  end
  if (reset) begin
    ahb_hwrite_q = 1'h0;
  end
  if (reset) begin
    ahb_hresp_q = 1'h0;
  end
  if (reset) begin
    wrbuf_vld = 1'h0;
  end
  if (reset) begin
    wrbuf_data_vld = 1'h0;
  end
  if (reset) begin
    cmd_doneQ = 1'h0;
  end
  if (reset) begin
    wrbuf_tag = 1'h0;
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
    slvbuf_write = 1'h0;
  end
  if (reset) begin
    slvbuf_error = 1'h0;
  end
  if (reset) begin
    slvbuf_tag = 1'h0;
  end
  if (reset) begin
    last_bus_addr = 32'h0;
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
    buf_cmd_byte_ptrQ = 3'h0;
  end
  if (reset) begin
    buf_byteen = 8'h0;
  end
  if (reset) begin
    buf_aligned = 1'h0;
  end
  if (reset) begin
    buf_write = 1'h0;
  end
  if (reset) begin
    buf_tag = 1'h0;
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
    end else if (_T_63) begin
      if (buf_write_in) begin
        buf_nxtstate <= 3'h2;
      end else begin
        buf_nxtstate <= 3'h1;
      end
    end else if (_T_115) begin
      if (_T_118) begin
        buf_nxtstate <= 3'h6;
      end else begin
        buf_nxtstate <= 3'h3;
      end
    end else if (_T_145) begin
      if (ahb_hresp_q) begin
        buf_nxtstate <= 3'h7;
      end else if (buf_wr_en) begin
        buf_nxtstate <= 3'h6;
      end else begin
        buf_nxtstate <= 3'h3;
      end
    end else if (_T_180) begin
      buf_nxtstate <= 3'h3;
    end else if (_T_191) begin
      buf_nxtstate <= 3'h5;
    end else if (_T_193) begin
      buf_nxtstate <= 3'h4;
    end else if (_T_286) begin
      if (_T_295) begin
        buf_nxtstate <= 3'h5;
      end else if (_T_4) begin
        if (_T_149) begin
          buf_nxtstate <= 3'h2;
        end else begin
          buf_nxtstate <= 3'h1;
        end
      end else begin
        buf_nxtstate <= 3'h0;
      end
    end else if (_T_449) begin
      buf_nxtstate <= 3'h0;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      buf_state <= 3'h0;
    end else begin
      buf_state <= _T_646 & 3'h1;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      ahb_hready_q <= 1'h0;
    end else begin
      ahb_hready_q <= io_ahb_hready;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      ahb_htrans_q <= 2'h0;
    end else begin
      ahb_htrans_q <= io_ahb_htrans;
    end
  end
  always @(posedge ahbm_addr_clk or posedge reset) begin
    if (reset) begin
      ahb_hwrite_q <= 1'h0;
    end else begin
      ahb_hwrite_q <= io_ahb_hwrite;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      ahb_hresp_q <= 1'h0;
    end else begin
      ahb_hresp_q <= io_ahb_hresp;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else begin
      wrbuf_vld <= _T_620 & _T_621;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else begin
      wrbuf_data_vld <= _T_625 & _T_621;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      cmd_doneQ <= 1'h0;
    end else begin
      cmd_doneQ <= _T_281 & _T_680;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_tag <= 1'h0;
    end else if (wrbuf_en) begin
      wrbuf_tag <= io_axi_awid;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      wrbuf_addr <= 32'h0;
    end else begin
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
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      wrbuf_data <= 64'h0;
    end else begin
      wrbuf_data <= io_axi_wdata;
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      slvbuf_write <= 1'h0;
    end else if (slvbuf_wr_en) begin
      slvbuf_write <= buf_write;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      slvbuf_error <= 1'h0;
    end else if (slvbuf_error_en) begin
      if (_T_63) begin
        slvbuf_error <= 1'h0;
      end else if (_T_115) begin
        slvbuf_error <= 1'h0;
      end else if (_T_145) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_180) begin
        slvbuf_error <= 1'h0;
      end else if (_T_191) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_193) begin
        slvbuf_error <= 1'h0;
      end else begin
        slvbuf_error <= _GEN_6;
      end
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      slvbuf_tag <= 1'h0;
    end else if (slvbuf_wr_en) begin
      slvbuf_tag <= buf_tag;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      last_bus_addr <= 32'h0;
    end else if (last_addr_en) begin
      last_bus_addr <= io_ahb_haddr;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data <= 64'h0;
    end else if (_T_493) begin
      buf_data <= ahb_hrdata_q;
    end else begin
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
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr <= 32'h0;
    end else begin
      buf_addr <= _T_490[31:0];
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      buf_cmd_byte_ptrQ <= 3'h0;
    end else if (buf_cmd_byte_ptr_en) begin
      if (_T_63) begin
        if (buf_write_in) begin
          if (wrbuf_byteen[0]) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (wrbuf_byteen[1]) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (wrbuf_byteen[2]) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (wrbuf_byteen[3]) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (wrbuf_byteen[4]) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (wrbuf_byteen[5]) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (wrbuf_byteen[6]) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (wrbuf_byteen[7]) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end
        end else begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end
      end else if (_T_115) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_145) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_180) begin
        buf_cmd_byte_ptrQ <= buf_addr[2:0];
      end else if (_T_191) begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end else if (_T_193) begin
        if (trxn_done) begin
          if (_T_206) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (_T_209) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_212) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_215) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_218) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_221) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_224) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (buf_byteen[7]) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end
        end
      end else if (_T_286) begin
        if (bypass_en) begin
          if (wrbuf_byteen[0]) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (wrbuf_byteen[1]) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (wrbuf_byteen[2]) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (wrbuf_byteen[3]) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (wrbuf_byteen[4]) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (wrbuf_byteen[5]) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (wrbuf_byteen[6]) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (wrbuf_byteen[7]) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end
        end else if (trxn_done) begin
          if (_T_206) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (_T_209) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_212) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_215) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_218) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_221) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_224) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (buf_byteen[7]) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end
        end
      end else begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_byteen <= 8'h0;
    end else if (buf_wr_en) begin
      buf_byteen <= wrbuf_byteen;
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_aligned <= 1'h0;
    end else if (buf_wr_en) begin
      buf_aligned <= buf_aligned_in;
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_write <= 1'h0;
    end else if (buf_wr_en) begin
      if (_T_63) begin
        buf_write <= _T_149;
      end else if (_T_115) begin
        buf_write <= 1'h0;
      end else if (_T_145) begin
        buf_write <= 1'h0;
      end else if (_T_180) begin
        buf_write <= 1'h0;
      end else if (_T_191) begin
        buf_write <= 1'h0;
      end else if (_T_193) begin
        buf_write <= 1'h0;
      end else begin
        buf_write <= _GEN_8;
      end
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_tag <= 1'h0;
    end else if (buf_wr_en) begin
      if (wr_cmd_vld) begin
        buf_tag <= wrbuf_tag;
      end else begin
        buf_tag <= io_axi_arid;
      end
    end
  end
endmodule
