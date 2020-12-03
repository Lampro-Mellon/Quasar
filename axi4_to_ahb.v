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
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [31:0] _RAND_19;
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
  wire  ahbm_clk = rvclkhdr_7_io_l1clk; // @[axi4_to_ahb.scala 63:22 axi4_to_ahb.scala 391:12]
  reg [2:0] buf_state; // @[axi4_to_ahb.scala 69:45]
  wire  _T_49 = 3'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  bus_clk = rvclkhdr_io_l1clk; // @[axi4_to_ahb.scala 89:21 axi4_to_ahb.scala 201:11]
  reg  wrbuf_vld; // @[axi4_to_ahb.scala 359:51]
  reg  wrbuf_data_vld; // @[axi4_to_ahb.scala 360:51]
  wire  wr_cmd_vld = wrbuf_vld & wrbuf_data_vld; // @[axi4_to_ahb.scala 178:27]
  wire  master_valid = wr_cmd_vld | io_axi_arvalid; // @[axi4_to_ahb.scala 179:30]
  wire  _T_109 = 3'h1 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hready_q; // @[axi4_to_ahb.scala 379:52]
  reg [1:0] ahb_htrans_q; // @[axi4_to_ahb.scala 380:52]
  wire  _T_116 = ahb_htrans_q != 2'h0; // @[axi4_to_ahb.scala 241:58]
  wire  _T_117 = ahb_hready_q & _T_116; // @[axi4_to_ahb.scala 241:36]
  wire  ahbm_addr_clk = rvclkhdr_8_io_l1clk; // @[axi4_to_ahb.scala 64:27 axi4_to_ahb.scala 392:17]
  reg  ahb_hwrite_q; // @[axi4_to_ahb.scala 381:57]
  wire  _T_118 = ~ahb_hwrite_q; // @[axi4_to_ahb.scala 241:72]
  wire  _T_119 = _T_117 & _T_118; // @[axi4_to_ahb.scala 241:70]
  wire  _T_144 = 3'h6 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hresp_q; // @[axi4_to_ahb.scala 382:52]
  wire  _T_164 = ahb_hready_q | ahb_hresp_q; // @[axi4_to_ahb.scala 255:37]
  wire  _T_183 = 3'h7 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_194 = 3'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_196 = 3'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_197 = ahb_hready_q & ahb_hwrite_q; // @[axi4_to_ahb.scala 287:33]
  wire  _T_200 = _T_197 & _T_116; // @[axi4_to_ahb.scala 287:48]
  wire  _T_305 = 3'h4 == buf_state; // @[Conditional.scala 37:30]
  wire  _GEN_15 = _T_305 & _T_200; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_196 ? _T_200 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_194 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_183 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_144 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_109 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  trxn_done = _T_49 ? 1'h0 : _GEN_95; // @[Conditional.scala 40:58]
  reg  cmd_doneQ; // @[axi4_to_ahb.scala 377:52]
  wire  _T_306 = cmd_doneQ & ahb_hready_q; // @[axi4_to_ahb.scala 297:34]
  wire  _T_307 = _T_306 | ahb_hresp_q; // @[axi4_to_ahb.scala 297:50]
  wire  _T_491 = 3'h5 == buf_state; // @[Conditional.scala 37:30]
  wire  slave_ready = io_axi_bready & io_axi_rready; // @[axi4_to_ahb.scala 196:32]
  wire  _GEN_1 = _T_491 & slave_ready; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_305 ? _T_307 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_196 ? trxn_done : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_194 ? _T_164 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_183 ? _T_119 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_144 ? _T_164 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_109 ? _T_119 : _GEN_69; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_49 ? master_valid : _GEN_83; // @[Conditional.scala 40:58]
  wire [1:0] _T_14 = wr_cmd_vld ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 181:20]
  wire [2:0] master_opc = {{1'd0}, _T_14}; // @[axi4_to_ahb.scala 181:14]
  wire  _T_51 = master_opc[2:1] == 2'h1; // @[axi4_to_ahb.scala 226:41]
  wire  _GEN_8 = _T_305 & _T_51; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_196 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_194 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_183 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_144 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_109 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  buf_write_in = _T_49 ? _T_51 : _GEN_97; // @[Conditional.scala 40:58]
  wire [2:0] _T_53 = buf_write_in ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 227:26]
  wire  _T_111 = master_opc == 3'h0; // @[axi4_to_ahb.scala 240:61]
  wire  _T_112 = master_valid & _T_111; // @[axi4_to_ahb.scala 240:41]
  wire [2:0] _T_114 = _T_112 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 240:26]
  wire  _T_132 = _T_114 == 3'h6; // @[axi4_to_ahb.scala 244:174]
  wire  _T_133 = _T_119 & _T_132; // @[axi4_to_ahb.scala 244:88]
  wire  _T_145 = ~ahb_hresp_q; // @[axi4_to_ahb.scala 252:39]
  wire  _T_146 = ahb_hready_q & _T_145; // @[axi4_to_ahb.scala 252:37]
  wire  _T_149 = master_valid & _T_51; // @[axi4_to_ahb.scala 252:70]
  wire  _T_150 = ~_T_149; // @[axi4_to_ahb.scala 252:55]
  wire  _T_151 = _T_146 & _T_150; // @[axi4_to_ahb.scala 252:53]
  wire  _T_311 = _T_307 & _T_145; // @[axi4_to_ahb.scala 298:66]
  wire  _T_312 = _T_311 & slave_ready; // @[axi4_to_ahb.scala 298:81]
  wire  _GEN_4 = _T_305 & _T_312; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_196 ? 1'h0 : _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_194 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_183 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_144 ? _T_151 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_109 ? _T_133 : _GEN_66; // @[Conditional.scala 39:67]
  wire  master_ready = _T_49 | _GEN_86; // @[Conditional.scala 40:58]
  wire  _T_157 = master_valid & master_ready; // @[axi4_to_ahb.scala 254:82]
  wire  _T_160 = _T_157 & _T_111; // @[axi4_to_ahb.scala 254:97]
  wire [2:0] _T_162 = _T_160 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 254:67]
  wire [2:0] _T_163 = ahb_hresp_q ? 3'h7 : _T_162; // @[axi4_to_ahb.scala 254:26]
  wire  _T_313 = ~slave_ready; // @[axi4_to_ahb.scala 299:42]
  wire  _T_314 = ahb_hresp_q | _T_313; // @[axi4_to_ahb.scala 299:40]
  wire [2:0] _T_320 = _T_51 ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 299:119]
  wire [2:0] _T_321 = _T_157 ? _T_320 : 3'h0; // @[axi4_to_ahb.scala 299:75]
  wire [2:0] _T_322 = _T_314 ? 3'h5 : _T_321; // @[axi4_to_ahb.scala 299:26]
  wire [2:0] _GEN_5 = _T_305 ? _T_322 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_18 = _T_196 ? 3'h4 : _GEN_5; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_34 = _T_194 ? 3'h5 : _GEN_18; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_50 = _T_183 ? 3'h3 : _GEN_34; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_68 = _T_144 ? _T_163 : _GEN_50; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_82 = _T_109 ? _T_114 : _GEN_68; // @[Conditional.scala 39:67]
  wire [2:0] buf_nxtstate = _T_49 ? _T_53 : _GEN_82; // @[Conditional.scala 40:58]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg [31:0] wrbuf_addr; // @[el2_lib.scala 514:16]
  wire [31:0] master_addr = wr_cmd_vld ? wrbuf_addr : io_axi_araddr; // @[axi4_to_ahb.scala 182:21]
  reg [2:0] wrbuf_size; // @[Reg.scala 27:20]
  wire [2:0] master_size = wr_cmd_vld ? wrbuf_size : io_axi_arsize; // @[axi4_to_ahb.scala 183:21]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] wrbuf_data; // @[el2_lib.scala 514:16]
  wire  _T_166 = buf_state_en & _T_145; // @[axi4_to_ahb.scala 259:39]
  wire  _T_393 = buf_nxtstate != 3'h5; // @[axi4_to_ahb.scala 308:55]
  wire  _T_394 = buf_state_en & _T_393; // @[axi4_to_ahb.scala 308:39]
  wire  _GEN_14 = _T_305 ? _T_394 : _T_491; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_196 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_194 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_183 ? buf_state_en : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_144 ? _T_166 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_109 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  slave_valid_pre = _T_49 ? 1'h0 : _GEN_94; // @[Conditional.scala 40:58]
  wire  _T_25 = slave_valid_pre & slave_ready; // @[axi4_to_ahb.scala 188:32]
  wire  buf_clk = rvclkhdr_6_io_l1clk; // @[axi4_to_ahb.scala 157:21 axi4_to_ahb.scala 390:12]
  reg  slvbuf_write; // @[Reg.scala 27:20]
  wire [1:0] _T_647 = slvbuf_write ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 343:23]
  reg  slvbuf_error; // @[Reg.scala 27:20]
  wire [1:0] _T_649 = slvbuf_error ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_650 = _T_649 & 2'h2; // @[axi4_to_ahb.scala 343:88]
  wire [3:0] slave_opc = {_T_647,_T_650}; // @[Cat.scala 29:58]
  wire [1:0] _T_30 = slave_opc[1] ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 189:49]
  reg  slvbuf_tag; // @[Reg.scala 27:20]
  wire  _T_35 = slave_opc[3:2] == 2'h0; // @[axi4_to_ahb.scala 192:65]
  reg [31:0] last_bus_addr; // @[Reg.scala 27:20]
  wire [63:0] _T_654 = {last_bus_addr,last_bus_addr}; // @[Cat.scala 29:58]
  wire  _T_655 = buf_state == 3'h5; // @[axi4_to_ahb.scala 344:91]
  reg [63:0] buf_data; // @[el2_lib.scala 514:16]
  wire  ahbm_data_clk = rvclkhdr_9_io_l1clk; // @[axi4_to_ahb.scala 65:27 axi4_to_ahb.scala 393:17]
  reg [63:0] ahb_hrdata_q; // @[axi4_to_ahb.scala 383:57]
  wire [63:0] _T_658 = _T_655 ? buf_data : ahb_hrdata_q; // @[axi4_to_ahb.scala 344:79]
  wire  _T_44 = io_axi_awvalid & io_axi_awready; // @[axi4_to_ahb.scala 199:56]
  wire  _T_45 = io_axi_wvalid & io_axi_wready; // @[axi4_to_ahb.scala 199:91]
  wire  _T_46 = _T_44 | _T_45; // @[axi4_to_ahb.scala 199:74]
  wire  _T_55 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 230:54]
  wire  _T_56 = buf_state_en & _T_55; // @[axi4_to_ahb.scala 230:38]
  wire  _T_65 = |wrbuf_byteen[0]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_69 = |wrbuf_byteen[1]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_73 = |wrbuf_byteen[2]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_77 = |wrbuf_byteen[3]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_81 = |wrbuf_byteen[4]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_85 = |wrbuf_byteen[5]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_89 = |wrbuf_byteen[6]; // @[axi4_to_ahb.scala 175:77]
  wire  _T_93 = |wrbuf_byteen[7]; // @[axi4_to_ahb.scala 175:77]
  wire [2:0] _T_94 = _T_65 ? 3'h0 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_95 = _T_69 ? 3'h1 : _T_94; // @[Mux.scala 98:16]
  wire [2:0] _T_96 = _T_73 ? 3'h2 : _T_95; // @[Mux.scala 98:16]
  wire [2:0] _T_97 = _T_77 ? 3'h3 : _T_96; // @[Mux.scala 98:16]
  wire [2:0] _T_98 = _T_81 ? 3'h4 : _T_97; // @[Mux.scala 98:16]
  wire [2:0] _T_99 = _T_85 ? 3'h5 : _T_98; // @[Mux.scala 98:16]
  wire [2:0] _T_100 = _T_89 ? 3'h6 : _T_99; // @[Mux.scala 98:16]
  wire [2:0] _T_101 = _T_93 ? 3'h7 : _T_100; // @[Mux.scala 98:16]
  wire [2:0] _T_103 = buf_write_in ? _T_101 : master_addr[2:0]; // @[axi4_to_ahb.scala 233:30]
  wire  _T_104 = buf_nxtstate == 3'h1; // @[axi4_to_ahb.scala 235:51]
  wire  _T_134 = master_ready & master_valid; // @[axi4_to_ahb.scala 246:33]
  wire  _T_170 = buf_nxtstate == 3'h6; // @[axi4_to_ahb.scala 261:64]
  wire  _T_171 = _T_134 & _T_170; // @[axi4_to_ahb.scala 261:48]
  wire  _T_172 = _T_171 & buf_state_en; // @[axi4_to_ahb.scala 261:79]
  wire  _T_384 = buf_state_en & buf_write_in; // @[axi4_to_ahb.scala 306:33]
  wire  _T_386 = _T_384 & _T_55; // @[axi4_to_ahb.scala 306:48]
  wire  _GEN_12 = _T_305 & _T_386; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_196 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_194 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_183 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_144 ? _T_172 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_109 ? _T_134 : _GEN_75; // @[Conditional.scala 39:67]
  wire  bypass_en = _T_49 ? buf_state_en : _GEN_88; // @[Conditional.scala 40:58]
  wire [1:0] _T_107 = bypass_en ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_108 = _T_107 & 2'h2; // @[axi4_to_ahb.scala 236:45]
  wire  _T_120 = ~master_valid; // @[axi4_to_ahb.scala 242:34]
  wire  _T_121 = buf_state_en & _T_120; // @[axi4_to_ahb.scala 242:32]
  reg [31:0] buf_addr; // @[el2_lib.scala 514:16]
  wire [2:0] _T_138 = bypass_en ? master_addr[2:0] : buf_addr[2:0]; // @[axi4_to_ahb.scala 247:30]
  wire  _T_139 = ~buf_state_en; // @[axi4_to_ahb.scala 248:44]
  wire  _T_140 = _T_139 | bypass_en; // @[axi4_to_ahb.scala 248:58]
  wire [1:0] _T_142 = _T_140 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_143 = 2'h2 & _T_142; // @[axi4_to_ahb.scala 248:32]
  wire  _T_177 = buf_nxtstate != 3'h6; // @[axi4_to_ahb.scala 263:59]
  wire  _T_178 = _T_177 & buf_state_en; // @[axi4_to_ahb.scala 263:74]
  wire  _T_179 = ~_T_178; // @[axi4_to_ahb.scala 263:43]
  wire [1:0] _T_181 = _T_179 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_182 = 2'h2 & _T_181; // @[axi4_to_ahb.scala 263:32]
  wire [1:0] _T_192 = _T_139 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_193 = 2'h2 & _T_192; // @[axi4_to_ahb.scala 273:37]
  reg [2:0] buf_cmd_byte_ptrQ; // @[Reg.scala 27:20]
  reg [7:0] buf_byteen; // @[Reg.scala 27:20]
  wire [2:0] _T_205 = buf_cmd_byte_ptrQ + 3'h1; // @[axi4_to_ahb.scala 174:52]
  wire  _T_208 = 3'h0 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_209 = buf_byteen[0] & _T_208; // @[axi4_to_ahb.scala 175:48]
  wire  _T_210 = |_T_209; // @[axi4_to_ahb.scala 175:77]
  wire  _T_212 = 3'h1 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_213 = buf_byteen[1] & _T_212; // @[axi4_to_ahb.scala 175:48]
  wire  _T_214 = |_T_213; // @[axi4_to_ahb.scala 175:77]
  wire  _T_216 = 3'h2 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_217 = buf_byteen[2] & _T_216; // @[axi4_to_ahb.scala 175:48]
  wire  _T_218 = |_T_217; // @[axi4_to_ahb.scala 175:77]
  wire  _T_220 = 3'h3 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_221 = buf_byteen[3] & _T_220; // @[axi4_to_ahb.scala 175:48]
  wire  _T_222 = |_T_221; // @[axi4_to_ahb.scala 175:77]
  wire  _T_224 = 3'h4 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_225 = buf_byteen[4] & _T_224; // @[axi4_to_ahb.scala 175:48]
  wire  _T_226 = |_T_225; // @[axi4_to_ahb.scala 175:77]
  wire  _T_228 = 3'h5 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_229 = buf_byteen[5] & _T_228; // @[axi4_to_ahb.scala 175:48]
  wire  _T_230 = |_T_229; // @[axi4_to_ahb.scala 175:77]
  wire  _T_232 = 3'h6 >= _T_205; // @[axi4_to_ahb.scala 175:62]
  wire  _T_233 = buf_byteen[6] & _T_232; // @[axi4_to_ahb.scala 175:48]
  wire  _T_234 = |_T_233; // @[axi4_to_ahb.scala 175:77]
  wire  _T_238 = |buf_byteen[7]; // @[axi4_to_ahb.scala 175:77]
  wire [2:0] _T_239 = _T_210 ? 3'h0 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_240 = _T_214 ? 3'h1 : _T_239; // @[Mux.scala 98:16]
  wire [2:0] _T_241 = _T_218 ? 3'h2 : _T_240; // @[Mux.scala 98:16]
  wire [2:0] _T_242 = _T_222 ? 3'h3 : _T_241; // @[Mux.scala 98:16]
  wire [2:0] _T_243 = _T_226 ? 3'h4 : _T_242; // @[Mux.scala 98:16]
  wire [2:0] _T_244 = _T_230 ? 3'h5 : _T_243; // @[Mux.scala 98:16]
  wire [2:0] _T_245 = _T_234 ? 3'h6 : _T_244; // @[Mux.scala 98:16]
  wire [2:0] _T_246 = _T_238 ? 3'h7 : _T_245; // @[Mux.scala 98:16]
  wire [2:0] _T_247 = trxn_done ? _T_246 : buf_cmd_byte_ptrQ; // @[axi4_to_ahb.scala 291:30]
  wire  _T_248 = buf_cmd_byte_ptrQ == 3'h7; // @[axi4_to_ahb.scala 292:65]
  reg  buf_aligned; // @[Reg.scala 27:20]
  wire  _T_249 = buf_aligned | _T_248; // @[axi4_to_ahb.scala 292:44]
  wire [7:0] _T_295 = buf_byteen >> _T_246; // @[axi4_to_ahb.scala 292:92]
  wire  _T_297 = ~_T_295[0]; // @[axi4_to_ahb.scala 292:163]
  wire  _T_298 = _T_249 | _T_297; // @[axi4_to_ahb.scala 292:79]
  wire  _T_299 = trxn_done & _T_298; // @[axi4_to_ahb.scala 292:29]
  wire  _T_381 = _T_248 | _T_297; // @[axi4_to_ahb.scala 305:123]
  wire  _T_382 = _T_117 & _T_381; // @[axi4_to_ahb.scala 305:87]
  wire  _T_383 = ahb_hresp_q | _T_382; // @[axi4_to_ahb.scala 305:32]
  wire  _GEN_11 = _T_305 & _T_383; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_196 ? _T_299 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_194 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_183 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_144 ? _T_121 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_109 ? _T_121 : _GEN_74; // @[Conditional.scala 39:67]
  wire  cmd_done = _T_49 ? 1'h0 : _GEN_84; // @[Conditional.scala 40:58]
  wire  _T_300 = cmd_done | cmd_doneQ; // @[axi4_to_ahb.scala 293:43]
  wire  _T_301 = ~_T_300; // @[axi4_to_ahb.scala 293:32]
  wire [1:0] _T_303 = _T_301 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_304 = _T_303 & 2'h2; // @[axi4_to_ahb.scala 293:57]
  wire  _T_327 = _T_55 | _T_104; // @[axi4_to_ahb.scala 303:62]
  wire  _T_328 = buf_state_en & _T_327; // @[axi4_to_ahb.scala 303:33]
  wire  _T_389 = _T_301 | bypass_en; // @[axi4_to_ahb.scala 307:57]
  wire [1:0] _T_391 = _T_389 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_392 = _T_391 & 2'h2; // @[axi4_to_ahb.scala 307:71]
  wire  _T_399 = trxn_done | bypass_en; // @[axi4_to_ahb.scala 310:40]
  wire [2:0] _T_490 = bypass_en ? _T_101 : _T_247; // @[axi4_to_ahb.scala 311:30]
  wire  _GEN_6 = _T_305 & ahb_hresp_q; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_305 ? buf_state_en : _T_491; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_305 & _T_328; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_196 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_194 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_183 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_144 ? _T_160 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_109 ? master_ready : _GEN_67; // @[Conditional.scala 39:67]
  wire  buf_wr_en = _T_49 ? buf_state_en : _GEN_87; // @[Conditional.scala 40:58]
  wire  _GEN_10 = _T_305 & buf_wr_en; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_13 = _T_305 ? _T_392 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_305 & _T_399; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_305 ? _T_490 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_196 ? buf_state_en : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_196 & buf_state_en; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_196 ? _T_247 : _GEN_17; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_25 = _T_196 ? _T_304 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_196 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_196 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_194 ? buf_state_en : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_194 ? buf_state_en : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_194 ? buf_state_en : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_194 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_42 = _T_194 ? 3'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_44 = _T_194 ? 2'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_183 ? buf_state_en : _GEN_39; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_54 = _T_183 ? buf_addr[2:0] : _GEN_42; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_55 = _T_183 ? _T_193 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_183 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_183 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_183 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_144 ? buf_state_en : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_144 ? buf_state_en : _GEN_58; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_76 = _T_144 ? _T_138 : _GEN_54; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_77 = _T_144 ? _T_182 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_144 ? buf_wr_en : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_144 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_109 ? buf_state_en : _GEN_78; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_89 = _T_109 ? _T_138 : _GEN_76; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_90 = _T_109 ? _T_143 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_109 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_109 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_109 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67]
  wire  buf_data_wr_en = _T_49 ? _T_56 : _GEN_91; // @[Conditional.scala 40:58]
  wire  buf_cmd_byte_ptr_en = _T_49 ? buf_state_en : _GEN_96; // @[Conditional.scala 40:58]
  wire [2:0] buf_cmd_byte_ptr = _T_49 ? _T_103 : _GEN_89; // @[Conditional.scala 40:58]
  wire  slvbuf_wr_en = _T_49 ? 1'h0 : _GEN_85; // @[Conditional.scala 40:58]
  wire  slvbuf_error_en = _T_49 ? 1'h0 : _GEN_93; // @[Conditional.scala 40:58]
  wire  _T_586 = master_size[1:0] == 2'h0; // @[axi4_to_ahb.scala 329:24]
  wire  _T_587 = _T_111 | _T_586; // @[axi4_to_ahb.scala 328:48]
  wire  _T_589 = master_size[1:0] == 2'h1; // @[axi4_to_ahb.scala 329:54]
  wire  _T_590 = _T_587 | _T_589; // @[axi4_to_ahb.scala 329:33]
  wire  _T_592 = master_size[1:0] == 2'h2; // @[axi4_to_ahb.scala 329:93]
  wire  _T_593 = _T_590 | _T_592; // @[axi4_to_ahb.scala 329:72]
  wire  _T_595 = master_size[1:0] == 2'h3; // @[axi4_to_ahb.scala 330:25]
  wire  _T_597 = wrbuf_byteen == 8'h3; // @[axi4_to_ahb.scala 330:62]
  wire  _T_599 = wrbuf_byteen == 8'hc; // @[axi4_to_ahb.scala 330:97]
  wire  _T_600 = _T_597 | _T_599; // @[axi4_to_ahb.scala 330:74]
  wire  _T_602 = wrbuf_byteen == 8'h30; // @[axi4_to_ahb.scala 330:132]
  wire  _T_603 = _T_600 | _T_602; // @[axi4_to_ahb.scala 330:109]
  wire  _T_605 = wrbuf_byteen == 8'hc0; // @[axi4_to_ahb.scala 330:168]
  wire  _T_606 = _T_603 | _T_605; // @[axi4_to_ahb.scala 330:145]
  wire  _T_608 = wrbuf_byteen == 8'hf; // @[axi4_to_ahb.scala 331:28]
  wire  _T_609 = _T_606 | _T_608; // @[axi4_to_ahb.scala 330:181]
  wire  _T_611 = wrbuf_byteen == 8'hf0; // @[axi4_to_ahb.scala 331:63]
  wire  _T_612 = _T_609 | _T_611; // @[axi4_to_ahb.scala 331:40]
  wire  _T_614 = wrbuf_byteen == 8'hff; // @[axi4_to_ahb.scala 331:99]
  wire  _T_615 = _T_612 | _T_614; // @[axi4_to_ahb.scala 331:76]
  wire  _T_616 = _T_595 & _T_615; // @[axi4_to_ahb.scala 330:38]
  wire  buf_aligned_in = _T_593 | _T_616; // @[axi4_to_ahb.scala 329:106]
  wire  _T_495 = buf_aligned_in & _T_51; // @[axi4_to_ahb.scala 323:60]
  wire [2:0] _T_512 = _T_599 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_513 = 3'h2 & _T_512; // @[axi4_to_ahb.scala 167:15]
  wire  _T_519 = _T_611 | _T_597; // @[axi4_to_ahb.scala 168:56]
  wire [2:0] _T_521 = _T_519 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_522 = 3'h4 & _T_521; // @[axi4_to_ahb.scala 168:15]
  wire [2:0] _T_523 = _T_513 | _T_522; // @[axi4_to_ahb.scala 167:63]
  wire [2:0] _T_527 = _T_605 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_528 = 3'h6 & _T_527; // @[axi4_to_ahb.scala 169:17]
  wire [2:0] _T_529 = _T_523 | _T_528; // @[axi4_to_ahb.scala 168:96]
  wire [2:0] _T_536 = _T_495 ? _T_529 : master_addr[2:0]; // @[axi4_to_ahb.scala 323:43]
  wire  _T_540 = buf_state == 3'h3; // @[axi4_to_ahb.scala 326:33]
  wire  _T_546 = buf_aligned_in & _T_595; // @[axi4_to_ahb.scala 327:38]
  wire  _T_549 = _T_546 & _T_51; // @[axi4_to_ahb.scala 327:71]
  wire [1:0] _T_555 = _T_614 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_561 = _T_611 | _T_608; // @[axi4_to_ahb.scala 161:55]
  wire [1:0] _T_563 = _T_561 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_564 = 2'h2 & _T_563; // @[axi4_to_ahb.scala 161:16]
  wire [1:0] _T_565 = _T_555 | _T_564; // @[axi4_to_ahb.scala 160:62]
  wire  _T_570 = _T_605 | _T_602; // @[axi4_to_ahb.scala 162:60]
  wire  _T_573 = _T_570 | _T_599; // @[axi4_to_ahb.scala 162:89]
  wire  _T_576 = _T_573 | _T_597; // @[axi4_to_ahb.scala 162:123]
  wire [1:0] _T_578 = _T_576 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_579 = 2'h1 & _T_578; // @[axi4_to_ahb.scala 162:21]
  wire [1:0] _T_580 = _T_565 | _T_579; // @[axi4_to_ahb.scala 161:93]
  wire [1:0] _T_582 = _T_549 ? _T_580 : master_size[1:0]; // @[axi4_to_ahb.scala 327:21]
  wire [31:0] _T_621 = {master_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [31:0] _T_624 = {buf_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [1:0] _T_628 = buf_aligned_in ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] buf_size_in = {{1'd0}, _T_582}; // @[axi4_to_ahb.scala 327:15]
  wire [1:0] _T_630 = _T_628 & buf_size_in[1:0]; // @[axi4_to_ahb.scala 334:77]
  wire [2:0] _T_631 = {1'h0,_T_630}; // @[Cat.scala 29:58]
  wire [1:0] _T_633 = buf_aligned ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg [1:0] buf_size; // @[Reg.scala 27:20]
  wire [1:0] _T_635 = _T_633 & buf_size; // @[axi4_to_ahb.scala 334:134]
  wire [2:0] _T_636 = {1'h0,_T_635}; // @[Cat.scala 29:58]
  wire  _T_639 = ~io_axi_arprot[2]; // @[axi4_to_ahb.scala 338:33]
  wire [1:0] _T_640 = {1'h1,_T_639}; // @[Cat.scala 29:58]
  reg  buf_write; // @[Reg.scala 27:20]
  wire  _T_662 = io_ahb_htrans != 2'h0; // @[axi4_to_ahb.scala 347:40]
  wire  _T_663 = _T_662 & io_ahb_hready; // @[axi4_to_ahb.scala 347:52]
  wire  last_addr_en = _T_663 & io_ahb_hwrite; // @[axi4_to_ahb.scala 347:68]
  wire  wrbuf_en = _T_44 & master_ready; // @[axi4_to_ahb.scala 349:47]
  wire  wrbuf_data_en = _T_45 & master_ready; // @[axi4_to_ahb.scala 350:50]
  wire  wrbuf_cmd_sent = _T_157 & _T_51; // @[axi4_to_ahb.scala 351:49]
  wire  _T_673 = ~wrbuf_en; // @[axi4_to_ahb.scala 352:33]
  wire  wrbuf_rst = wrbuf_cmd_sent & _T_673; // @[axi4_to_ahb.scala 352:31]
  wire  _T_675 = ~wrbuf_cmd_sent; // @[axi4_to_ahb.scala 354:35]
  wire  _T_676 = wrbuf_vld & _T_675; // @[axi4_to_ahb.scala 354:33]
  wire  _T_677 = ~_T_676; // @[axi4_to_ahb.scala 354:21]
  wire  _T_680 = wrbuf_data_vld & _T_675; // @[axi4_to_ahb.scala 355:37]
  wire  _T_681 = ~_T_680; // @[axi4_to_ahb.scala 355:20]
  wire  _T_684 = ~wr_cmd_vld; // @[axi4_to_ahb.scala 356:21]
  wire  _T_687 = wrbuf_en | wrbuf_vld; // @[axi4_to_ahb.scala 359:55]
  wire  _T_688 = ~wrbuf_rst; // @[axi4_to_ahb.scala 359:91]
  wire  _T_692 = wrbuf_data_en | wrbuf_data_vld; // @[axi4_to_ahb.scala 360:55]
  reg  buf_tag; // @[Reg.scala 27:20]
  wire  _T_742 = ~slave_valid_pre; // @[axi4_to_ahb.scala 377:92]
  wire  _T_755 = buf_wr_en | slvbuf_wr_en; // @[axi4_to_ahb.scala 385:43]
  wire  _T_756 = _T_755 | io_clk_override; // @[axi4_to_ahb.scala 385:58]
  wire  _T_759 = io_ahb_hready & io_ahb_htrans[1]; // @[axi4_to_ahb.scala 386:54]
  wire  _T_760 = _T_759 | io_clk_override; // @[axi4_to_ahb.scala 386:74]
  wire  _T_762 = buf_state != 3'h0; // @[axi4_to_ahb.scala 387:50]
  wire  _T_763 = _T_762 | io_clk_override; // @[axi4_to_ahb.scala 387:60]
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
  assign io_axi_awready = _T_677 & master_ready; // @[axi4_to_ahb.scala 354:18]
  assign io_axi_wready = _T_681 & master_ready; // @[axi4_to_ahb.scala 355:17]
  assign io_axi_bvalid = _T_25 & slave_opc[3]; // @[axi4_to_ahb.scala 188:17]
  assign io_axi_bresp = slave_opc[0] ? 2'h2 : _T_30; // @[axi4_to_ahb.scala 189:16]
  assign io_axi_bid = slvbuf_tag; // @[axi4_to_ahb.scala 190:14]
  assign io_axi_arready = _T_684 & master_ready; // @[axi4_to_ahb.scala 356:18]
  assign io_axi_rvalid = _T_25 & _T_35; // @[axi4_to_ahb.scala 192:17]
  assign io_axi_rid = slvbuf_tag; // @[axi4_to_ahb.scala 194:14]
  assign io_axi_rdata = slvbuf_error ? _T_654 : _T_658; // @[axi4_to_ahb.scala 195:16]
  assign io_axi_rresp = slave_opc[0] ? 2'h2 : _T_30; // @[axi4_to_ahb.scala 193:16]
  assign io_axi_rlast = 1'h1; // @[axi4_to_ahb.scala 357:16]
  assign io_ahb_haddr = bypass_en ? _T_621 : _T_624; // @[axi4_to_ahb.scala 333:16]
  assign io_ahb_hburst = 3'h0; // @[axi4_to_ahb.scala 336:17]
  assign io_ahb_hmastlock = 1'h0; // @[axi4_to_ahb.scala 337:20]
  assign io_ahb_hprot = {{2'd0}, _T_640}; // @[axi4_to_ahb.scala 338:16]
  assign io_ahb_hsize = bypass_en ? _T_631 : _T_636; // @[axi4_to_ahb.scala 334:16]
  assign io_ahb_htrans = _T_49 ? _T_108 : _GEN_90; // @[axi4_to_ahb.scala 205:17 axi4_to_ahb.scala 236:21 axi4_to_ahb.scala 248:21 axi4_to_ahb.scala 263:21 axi4_to_ahb.scala 273:21 axi4_to_ahb.scala 293:21 axi4_to_ahb.scala 307:21]
  assign io_ahb_hwrite = bypass_en ? _T_51 : buf_write; // @[axi4_to_ahb.scala 339:17]
  assign io_ahb_hwdata = buf_data; // @[axi4_to_ahb.scala 340:17]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_46; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = rvclkhdr_io_l1clk; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = _T_44 & master_ready; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = rvclkhdr_io_l1clk; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = _T_45 & master_ready; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = buf_wr_en & io_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = buf_data_wr_en & io_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_6_io_en = io_bus_clk_en & _T_756; // @[el2_lib.scala 485:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_7_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_8_io_en = io_bus_clk_en & _T_760; // @[el2_lib.scala 485:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_9_io_en = io_bus_clk_en & _T_763; // @[el2_lib.scala 485:16]
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
  buf_state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  wrbuf_vld = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wrbuf_data_vld = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ahb_hready_q = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ahb_htrans_q = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  ahb_hwrite_q = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ahb_hresp_q = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  cmd_doneQ = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  wrbuf_tag = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  wrbuf_addr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  wrbuf_size = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  wrbuf_byteen = _RAND_11[7:0];
  _RAND_12 = {2{`RANDOM}};
  wrbuf_data = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  slvbuf_write = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  slvbuf_error = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  slvbuf_tag = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  last_bus_addr = _RAND_16[31:0];
  _RAND_17 = {2{`RANDOM}};
  buf_data = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  ahb_hrdata_q = _RAND_18[63:0];
  _RAND_19 = {1{`RANDOM}};
  buf_addr = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  buf_cmd_byte_ptrQ = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  buf_byteen = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  buf_aligned = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  buf_size = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  buf_write = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  buf_tag = _RAND_25[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_state = 3'h0;
  end
  if (reset) begin
    wrbuf_vld = 1'h0;
  end
  if (reset) begin
    wrbuf_data_vld = 1'h0;
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
    buf_size = 2'h0;
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
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      buf_state <= 3'h0;
    end else if (buf_state_en) begin
      if (_T_49) begin
        if (buf_write_in) begin
          buf_state <= 3'h2;
        end else begin
          buf_state <= 3'h1;
        end
      end else if (_T_109) begin
        if (_T_112) begin
          buf_state <= 3'h6;
        end else begin
          buf_state <= 3'h3;
        end
      end else if (_T_144) begin
        if (ahb_hresp_q) begin
          buf_state <= 3'h7;
        end else if (_T_160) begin
          buf_state <= 3'h6;
        end else begin
          buf_state <= 3'h3;
        end
      end else if (_T_183) begin
        buf_state <= 3'h3;
      end else if (_T_194) begin
        buf_state <= 3'h5;
      end else if (_T_196) begin
        buf_state <= 3'h4;
      end else if (_T_305) begin
        if (_T_314) begin
          buf_state <= 3'h5;
        end else if (_T_157) begin
          if (_T_51) begin
            buf_state <= 3'h2;
          end else begin
            buf_state <= 3'h1;
          end
        end else begin
          buf_state <= 3'h0;
        end
      end else begin
        buf_state <= 3'h0;
      end
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else begin
      wrbuf_vld <= _T_687 & _T_688;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else begin
      wrbuf_data_vld <= _T_692 & _T_688;
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
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      cmd_doneQ <= 1'h0;
    end else begin
      cmd_doneQ <= _T_300 & _T_742;
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
      if (_T_49) begin
        slvbuf_error <= 1'h0;
      end else if (_T_109) begin
        slvbuf_error <= 1'h0;
      end else if (_T_144) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_183) begin
        slvbuf_error <= 1'h0;
      end else if (_T_194) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_196) begin
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
    end else if (_T_540) begin
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
      buf_addr <= {master_addr[31:3],_T_536};
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      buf_cmd_byte_ptrQ <= 3'h0;
    end else if (buf_cmd_byte_ptr_en) begin
      if (_T_49) begin
        if (buf_write_in) begin
          if (_T_93) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else if (_T_89) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (_T_85) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_81) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_77) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_73) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_69) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_65) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end else begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end
      end else if (_T_109) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_144) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_183) begin
        buf_cmd_byte_ptrQ <= buf_addr[2:0];
      end else if (_T_194) begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end else if (_T_196) begin
        if (trxn_done) begin
          if (_T_238) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else if (_T_234) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (_T_230) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_226) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_222) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_218) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_214) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_210) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end
      end else if (_T_305) begin
        if (bypass_en) begin
          if (_T_93) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else if (_T_89) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (_T_85) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_81) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_77) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_73) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_69) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_65) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end else if (trxn_done) begin
          if (_T_238) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else if (_T_234) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (_T_230) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_226) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_222) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_218) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_214) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_210) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
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
      buf_size <= 2'h0;
    end else if (buf_wr_en) begin
      buf_size <= buf_size_in[1:0];
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_write <= 1'h0;
    end else if (buf_wr_en) begin
      if (_T_49) begin
        buf_write <= _T_51;
      end else if (_T_109) begin
        buf_write <= 1'h0;
      end else if (_T_144) begin
        buf_write <= 1'h0;
      end else if (_T_183) begin
        buf_write <= 1'h0;
      end else if (_T_194) begin
        buf_write <= 1'h0;
      end else if (_T_196) begin
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
