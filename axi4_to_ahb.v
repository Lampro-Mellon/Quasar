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
  wire  ahbm_clk = rvclkhdr_7_io_l1clk; // @[axi4_to_ahb.scala 62:22 axi4_to_ahb.scala 461:12]
  reg [2:0] buf_state; // @[axi4_to_ahb.scala 68:45]
  wire  _T_47 = 3'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  bus_clk = rvclkhdr_io_l1clk; // @[axi4_to_ahb.scala 88:21 axi4_to_ahb.scala 220:11]
  reg  wrbuf_vld; // @[axi4_to_ahb.scala 379:48]
  reg  wrbuf_data_vld; // @[axi4_to_ahb.scala 380:48]
  wire  wr_cmd_vld = wrbuf_vld & wrbuf_data_vld; // @[axi4_to_ahb.scala 197:27]
  wire  master_valid = wr_cmd_vld | io_axi_arvalid; // @[axi4_to_ahb.scala 198:30]
  wire  _T_99 = 3'h1 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hready_q; // @[axi4_to_ahb.scala 440:12]
  reg [1:0] ahb_htrans_q; // @[axi4_to_ahb.scala 443:12]
  wire  _T_106 = ahb_htrans_q != 2'h0; // @[axi4_to_ahb.scala 260:58]
  wire  _T_107 = ahb_hready_q & _T_106; // @[axi4_to_ahb.scala 260:36]
  wire  ahbm_addr_clk = rvclkhdr_8_io_l1clk; // @[axi4_to_ahb.scala 63:27 axi4_to_ahb.scala 462:17]
  reg  ahb_hwrite_q; // @[axi4_to_ahb.scala 446:12]
  wire  _T_108 = ~ahb_hwrite_q; // @[axi4_to_ahb.scala 260:72]
  wire  _T_109 = _T_107 & _T_108; // @[axi4_to_ahb.scala 260:70]
  wire  _T_134 = 3'h6 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hresp_q; // @[axi4_to_ahb.scala 449:12]
  wire  _T_154 = ahb_hready_q | ahb_hresp_q; // @[axi4_to_ahb.scala 274:37]
  wire  _T_173 = 3'h7 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_184 = 3'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_186 = 3'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_187 = ahb_hready_q & ahb_hwrite_q; // @[axi4_to_ahb.scala 306:33]
  wire  _T_190 = _T_187 & _T_106; // @[axi4_to_ahb.scala 306:48]
  wire  _T_279 = 3'h4 == buf_state; // @[Conditional.scala 37:30]
  wire  _GEN_15 = _T_279 & _T_190; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_186 ? _T_190 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_184 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_173 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_134 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_99 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  trxn_done = _T_47 ? 1'h0 : _GEN_95; // @[Conditional.scala 40:58]
  reg  cmd_doneQ; // @[axi4_to_ahb.scala 431:12]
  wire  _T_280 = cmd_doneQ & ahb_hready_q; // @[axi4_to_ahb.scala 316:34]
  wire  _T_281 = _T_280 | ahb_hresp_q; // @[axi4_to_ahb.scala 316:50]
  wire  _T_441 = 3'h5 == buf_state; // @[Conditional.scala 37:30]
  wire  slave_ready = io_axi_bready & io_axi_rready; // @[axi4_to_ahb.scala 215:32]
  wire  _GEN_1 = _T_441 & slave_ready; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_279 ? _T_281 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_186 ? trxn_done : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_184 ? _T_154 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_173 ? _T_109 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_134 ? _T_154 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_99 ? _T_109 : _GEN_69; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_47 ? master_valid : _GEN_83; // @[Conditional.scala 40:58]
  wire [1:0] _T_12 = wr_cmd_vld ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 200:20]
  wire [2:0] master_opc = {{1'd0}, _T_12}; // @[axi4_to_ahb.scala 200:14]
  wire  _T_49 = master_opc[2:1] == 2'h1; // @[axi4_to_ahb.scala 245:41]
  wire  _GEN_8 = _T_279 & _T_49; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_186 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_184 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_173 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_134 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_99 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  buf_write_in = _T_47 ? _T_49 : _GEN_97; // @[Conditional.scala 40:58]
  wire [2:0] _T_51 = buf_write_in ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 246:26]
  wire  _T_101 = master_opc == 3'h0; // @[axi4_to_ahb.scala 259:61]
  wire  _T_102 = master_valid & _T_101; // @[axi4_to_ahb.scala 259:41]
  wire [2:0] _T_104 = _T_102 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 259:26]
  wire  _T_122 = _T_104 == 3'h6; // @[axi4_to_ahb.scala 263:174]
  wire  _T_123 = _T_109 & _T_122; // @[axi4_to_ahb.scala 263:88]
  wire  _T_135 = ~ahb_hresp_q; // @[axi4_to_ahb.scala 271:39]
  wire  _T_136 = ahb_hready_q & _T_135; // @[axi4_to_ahb.scala 271:37]
  wire  _T_139 = master_valid & _T_49; // @[axi4_to_ahb.scala 271:70]
  wire  _T_140 = ~_T_139; // @[axi4_to_ahb.scala 271:55]
  wire  _T_141 = _T_136 & _T_140; // @[axi4_to_ahb.scala 271:53]
  wire  _T_285 = _T_281 & _T_135; // @[axi4_to_ahb.scala 317:66]
  wire  _T_286 = _T_285 & slave_ready; // @[axi4_to_ahb.scala 317:81]
  wire  _GEN_4 = _T_279 & _T_286; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_186 ? 1'h0 : _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_184 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_173 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_134 ? _T_141 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_99 ? _T_123 : _GEN_66; // @[Conditional.scala 39:67]
  wire  master_ready = _T_47 | _GEN_86; // @[Conditional.scala 40:58]
  wire  _T_147 = master_valid & master_ready; // @[axi4_to_ahb.scala 273:82]
  wire  _T_150 = _T_147 & _T_101; // @[axi4_to_ahb.scala 273:97]
  wire [2:0] _T_152 = _T_150 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 273:67]
  wire [2:0] _T_153 = ahb_hresp_q ? 3'h7 : _T_152; // @[axi4_to_ahb.scala 273:26]
  wire  _T_287 = ~slave_ready; // @[axi4_to_ahb.scala 318:42]
  wire  _T_288 = ahb_hresp_q | _T_287; // @[axi4_to_ahb.scala 318:40]
  wire [2:0] _T_294 = _T_49 ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 318:119]
  wire [2:0] _T_295 = _T_147 ? _T_294 : 3'h0; // @[axi4_to_ahb.scala 318:75]
  wire [2:0] _T_296 = _T_288 ? 3'h5 : _T_295; // @[axi4_to_ahb.scala 318:26]
  wire [2:0] _GEN_5 = _T_279 ? _T_296 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_18 = _T_186 ? 3'h4 : _GEN_5; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_34 = _T_184 ? 3'h5 : _GEN_18; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_50 = _T_173 ? 3'h3 : _GEN_34; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_68 = _T_134 ? _T_153 : _GEN_50; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_82 = _T_99 ? _T_104 : _GEN_68; // @[Conditional.scala 39:67]
  wire [2:0] buf_nxtstate = _T_47 ? _T_51 : _GEN_82; // @[Conditional.scala 40:58]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg [31:0] wrbuf_addr; // @[el2_lib.scala 514:16]
  wire [31:0] master_addr = wr_cmd_vld ? wrbuf_addr : io_axi_araddr; // @[axi4_to_ahb.scala 201:21]
  reg [2:0] wrbuf_size; // @[Reg.scala 27:20]
  wire [2:0] master_size = wr_cmd_vld ? wrbuf_size : io_axi_arsize; // @[axi4_to_ahb.scala 202:21]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] wrbuf_data; // @[el2_lib.scala 514:16]
  wire  _T_156 = buf_state_en & _T_135; // @[axi4_to_ahb.scala 278:39]
  wire  _T_359 = buf_nxtstate != 3'h5; // @[axi4_to_ahb.scala 327:55]
  wire  _T_360 = buf_state_en & _T_359; // @[axi4_to_ahb.scala 327:39]
  wire  _GEN_14 = _T_279 ? _T_360 : _T_441; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_186 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_184 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_173 ? buf_state_en : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_134 ? _T_156 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_99 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  slave_valid_pre = _T_47 ? 1'h0 : _GEN_94; // @[Conditional.scala 40:58]
  wire  _T_23 = slave_valid_pre & slave_ready; // @[axi4_to_ahb.scala 207:32]
  wire  buf_clk = rvclkhdr_6_io_l1clk; // @[axi4_to_ahb.scala 156:21 axi4_to_ahb.scala 460:12]
  reg  slvbuf_write; // @[Reg.scala 27:20]
  wire [1:0] _T_597 = slvbuf_write ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 362:23]
  reg  slvbuf_error; // @[Reg.scala 27:20]
  wire [1:0] _T_599 = slvbuf_error ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_600 = _T_599 & 2'h2; // @[axi4_to_ahb.scala 362:88]
  wire [3:0] slave_opc = {_T_597,_T_600}; // @[Cat.scala 29:58]
  wire [1:0] _T_28 = slave_opc[1] ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 208:49]
  reg  slvbuf_tag; // @[Reg.scala 27:20]
  wire  _T_33 = slave_opc[3:2] == 2'h0; // @[axi4_to_ahb.scala 211:65]
  reg [31:0] last_bus_addr; // @[Reg.scala 27:20]
  wire [63:0] _T_604 = {last_bus_addr,last_bus_addr}; // @[Cat.scala 29:58]
  wire  _T_605 = buf_state == 3'h5; // @[axi4_to_ahb.scala 363:91]
  reg [63:0] buf_data; // @[el2_lib.scala 514:16]
  wire  ahbm_data_clk = rvclkhdr_9_io_l1clk; // @[axi4_to_ahb.scala 64:27 axi4_to_ahb.scala 463:17]
  reg [63:0] ahb_hrdata_q; // @[axi4_to_ahb.scala 452:12]
  wire [63:0] _T_608 = _T_605 ? buf_data : ahb_hrdata_q; // @[axi4_to_ahb.scala 363:79]
  wire  _T_42 = io_axi_awvalid & io_axi_awready; // @[axi4_to_ahb.scala 218:56]
  wire  _T_43 = io_axi_wvalid & io_axi_wready; // @[axi4_to_ahb.scala 218:91]
  wire  _T_44 = _T_42 | _T_43; // @[axi4_to_ahb.scala 218:74]
  wire  _T_53 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 249:54]
  wire  _T_54 = buf_state_en & _T_53; // @[axi4_to_ahb.scala 249:38]
  wire [2:0] _T_84 = wrbuf_byteen[7] ? 3'h7 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _T_85 = wrbuf_byteen[6] ? 3'h6 : _T_84; // @[Mux.scala 98:16]
  wire [2:0] _T_86 = wrbuf_byteen[5] ? 3'h5 : _T_85; // @[Mux.scala 98:16]
  wire [2:0] _T_87 = wrbuf_byteen[4] ? 3'h4 : _T_86; // @[Mux.scala 98:16]
  wire [2:0] _T_88 = wrbuf_byteen[3] ? 3'h3 : _T_87; // @[Mux.scala 98:16]
  wire [2:0] _T_89 = wrbuf_byteen[2] ? 3'h2 : _T_88; // @[Mux.scala 98:16]
  wire [2:0] _T_90 = wrbuf_byteen[1] ? 3'h1 : _T_89; // @[Mux.scala 98:16]
  wire [2:0] _T_91 = wrbuf_byteen[0] ? 3'h0 : _T_90; // @[Mux.scala 98:16]
  wire [2:0] _T_93 = buf_write_in ? _T_91 : master_addr[2:0]; // @[axi4_to_ahb.scala 252:30]
  wire  _T_94 = buf_nxtstate == 3'h1; // @[axi4_to_ahb.scala 254:51]
  wire  _T_124 = master_ready & master_valid; // @[axi4_to_ahb.scala 265:33]
  wire  _T_160 = buf_nxtstate == 3'h6; // @[axi4_to_ahb.scala 280:64]
  wire  _T_161 = _T_124 & _T_160; // @[axi4_to_ahb.scala 280:48]
  wire  _T_162 = _T_161 & buf_state_en; // @[axi4_to_ahb.scala 280:79]
  wire  _T_350 = buf_state_en & buf_write_in; // @[axi4_to_ahb.scala 325:33]
  wire  _T_352 = _T_350 & _T_53; // @[axi4_to_ahb.scala 325:48]
  wire  _GEN_12 = _T_279 & _T_352; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_186 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_184 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_173 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_134 ? _T_162 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_99 ? _T_124 : _GEN_75; // @[Conditional.scala 39:67]
  wire  bypass_en = _T_47 ? buf_state_en : _GEN_88; // @[Conditional.scala 40:58]
  wire [1:0] _T_97 = bypass_en ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_98 = _T_97 & 2'h2; // @[axi4_to_ahb.scala 255:45]
  wire  _T_110 = ~master_valid; // @[axi4_to_ahb.scala 261:34]
  wire  _T_111 = buf_state_en & _T_110; // @[axi4_to_ahb.scala 261:32]
  reg [31:0] buf_addr; // @[el2_lib.scala 514:16]
  wire [2:0] _T_128 = bypass_en ? master_addr[2:0] : buf_addr[2:0]; // @[axi4_to_ahb.scala 266:30]
  wire  _T_129 = ~buf_state_en; // @[axi4_to_ahb.scala 267:44]
  wire  _T_130 = _T_129 | bypass_en; // @[axi4_to_ahb.scala 267:58]
  wire [1:0] _T_132 = _T_130 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_133 = 2'h2 & _T_132; // @[axi4_to_ahb.scala 267:32]
  wire  _T_167 = buf_nxtstate != 3'h6; // @[axi4_to_ahb.scala 282:59]
  wire  _T_168 = _T_167 & buf_state_en; // @[axi4_to_ahb.scala 282:74]
  wire  _T_169 = ~_T_168; // @[axi4_to_ahb.scala 282:43]
  wire [1:0] _T_171 = _T_169 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_172 = 2'h2 & _T_171; // @[axi4_to_ahb.scala 282:32]
  wire [1:0] _T_182 = _T_129 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_183 = 2'h2 & _T_182; // @[axi4_to_ahb.scala 292:37]
  reg [2:0] buf_cmd_byte_ptrQ; // @[Reg.scala 27:20]
  reg [7:0] buf_byteen; // @[Reg.scala 27:20]
  wire [2:0] _T_195 = buf_cmd_byte_ptrQ + 3'h1; // @[axi4_to_ahb.scala 181:52]
  wire  _T_198 = 3'h0 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_199 = buf_byteen[0] & _T_198; // @[axi4_to_ahb.scala 182:48]
  wire  _T_201 = 3'h1 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_202 = buf_byteen[1] & _T_201; // @[axi4_to_ahb.scala 182:48]
  wire  _T_204 = 3'h2 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_205 = buf_byteen[2] & _T_204; // @[axi4_to_ahb.scala 182:48]
  wire  _T_207 = 3'h3 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_208 = buf_byteen[3] & _T_207; // @[axi4_to_ahb.scala 182:48]
  wire  _T_210 = 3'h4 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_211 = buf_byteen[4] & _T_210; // @[axi4_to_ahb.scala 182:48]
  wire  _T_213 = 3'h5 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_214 = buf_byteen[5] & _T_213; // @[axi4_to_ahb.scala 182:48]
  wire  _T_216 = 3'h6 >= _T_195; // @[axi4_to_ahb.scala 182:62]
  wire  _T_217 = buf_byteen[6] & _T_216; // @[axi4_to_ahb.scala 182:48]
  wire [2:0] _T_221 = buf_byteen[7] ? 3'h7 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _T_222 = _T_217 ? 3'h6 : _T_221; // @[Mux.scala 98:16]
  wire [2:0] _T_223 = _T_214 ? 3'h5 : _T_222; // @[Mux.scala 98:16]
  wire [2:0] _T_224 = _T_211 ? 3'h4 : _T_223; // @[Mux.scala 98:16]
  wire [2:0] _T_225 = _T_208 ? 3'h3 : _T_224; // @[Mux.scala 98:16]
  wire [2:0] _T_226 = _T_205 ? 3'h2 : _T_225; // @[Mux.scala 98:16]
  wire [2:0] _T_227 = _T_202 ? 3'h1 : _T_226; // @[Mux.scala 98:16]
  wire [2:0] _T_228 = _T_199 ? 3'h0 : _T_227; // @[Mux.scala 98:16]
  wire [2:0] _T_229 = trxn_done ? _T_228 : buf_cmd_byte_ptrQ; // @[axi4_to_ahb.scala 310:30]
  wire  _T_230 = buf_cmd_byte_ptrQ == 3'h7; // @[axi4_to_ahb.scala 311:65]
  reg  buf_aligned; // @[Reg.scala 27:20]
  wire  _T_231 = buf_aligned | _T_230; // @[axi4_to_ahb.scala 311:44]
  wire [7:0] _T_269 = buf_byteen >> _T_228; // @[axi4_to_ahb.scala 311:92]
  wire  _T_271 = ~_T_269[0]; // @[axi4_to_ahb.scala 311:163]
  wire  _T_272 = _T_231 | _T_271; // @[axi4_to_ahb.scala 311:79]
  wire  _T_273 = trxn_done & _T_272; // @[axi4_to_ahb.scala 311:29]
  wire  _T_347 = _T_230 | _T_271; // @[axi4_to_ahb.scala 324:118]
  wire  _T_348 = _T_107 & _T_347; // @[axi4_to_ahb.scala 324:82]
  wire  _T_349 = ahb_hresp_q | _T_348; // @[axi4_to_ahb.scala 324:32]
  wire  _GEN_11 = _T_279 & _T_349; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_186 ? _T_273 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_184 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_173 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_134 ? _T_111 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_99 ? _T_111 : _GEN_74; // @[Conditional.scala 39:67]
  wire  cmd_done = _T_47 ? 1'h0 : _GEN_84; // @[Conditional.scala 40:58]
  wire  _T_274 = cmd_done | cmd_doneQ; // @[axi4_to_ahb.scala 312:43]
  wire  _T_275 = ~_T_274; // @[axi4_to_ahb.scala 312:32]
  wire [1:0] _T_277 = _T_275 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_278 = _T_277 & 2'h2; // @[axi4_to_ahb.scala 312:57]
  wire  _T_301 = _T_53 | _T_94; // @[axi4_to_ahb.scala 322:62]
  wire  _T_302 = buf_state_en & _T_301; // @[axi4_to_ahb.scala 322:33]
  wire  _T_355 = _T_275 | bypass_en; // @[axi4_to_ahb.scala 326:57]
  wire [1:0] _T_357 = _T_355 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_358 = _T_357 & 2'h2; // @[axi4_to_ahb.scala 326:71]
  wire  _T_365 = trxn_done | bypass_en; // @[axi4_to_ahb.scala 329:40]
  wire [2:0] _T_440 = bypass_en ? _T_91 : _T_229; // @[axi4_to_ahb.scala 332:30]
  wire  _GEN_6 = _T_279 & ahb_hresp_q; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_279 ? buf_state_en : _T_441; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_279 & _T_302; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_186 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_184 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_173 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_134 ? _T_150 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_99 ? master_ready : _GEN_67; // @[Conditional.scala 39:67]
  wire  buf_wr_en = _T_47 ? buf_state_en : _GEN_87; // @[Conditional.scala 40:58]
  wire  _GEN_10 = _T_279 & buf_wr_en; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_13 = _T_279 ? _T_358 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_279 & _T_365; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_279 ? _T_440 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_186 ? buf_state_en : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_186 & buf_state_en; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_186 ? _T_229 : _GEN_17; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_25 = _T_186 ? _T_278 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_186 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_186 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_184 ? buf_state_en : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_184 ? buf_state_en : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_184 ? buf_state_en : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_184 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_42 = _T_184 ? 3'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_44 = _T_184 ? 2'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_173 ? buf_state_en : _GEN_39; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_54 = _T_173 ? buf_addr[2:0] : _GEN_42; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_55 = _T_173 ? _T_183 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_173 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_173 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_173 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_134 ? buf_state_en : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_134 ? buf_state_en : _GEN_58; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_76 = _T_134 ? _T_128 : _GEN_54; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_77 = _T_134 ? _T_172 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_134 ? buf_wr_en : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_134 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_99 ? buf_state_en : _GEN_78; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_89 = _T_99 ? _T_128 : _GEN_76; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_90 = _T_99 ? _T_133 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_99 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_99 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_99 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67]
  wire  buf_data_wr_en = _T_47 ? _T_54 : _GEN_91; // @[Conditional.scala 40:58]
  wire  buf_cmd_byte_ptr_en = _T_47 ? buf_state_en : _GEN_96; // @[Conditional.scala 40:58]
  wire [2:0] buf_cmd_byte_ptr = _T_47 ? _T_93 : _GEN_89; // @[Conditional.scala 40:58]
  wire  slvbuf_wr_en = _T_47 ? 1'h0 : _GEN_85; // @[Conditional.scala 40:58]
  wire  slvbuf_error_en = _T_47 ? 1'h0 : _GEN_93; // @[Conditional.scala 40:58]
  wire  _T_536 = master_size[1:0] == 2'h0; // @[axi4_to_ahb.scala 348:24]
  wire  _T_537 = _T_101 | _T_536; // @[axi4_to_ahb.scala 347:48]
  wire  _T_539 = master_size[1:0] == 2'h1; // @[axi4_to_ahb.scala 348:54]
  wire  _T_540 = _T_537 | _T_539; // @[axi4_to_ahb.scala 348:33]
  wire  _T_542 = master_size[1:0] == 2'h2; // @[axi4_to_ahb.scala 348:93]
  wire  _T_543 = _T_540 | _T_542; // @[axi4_to_ahb.scala 348:72]
  wire  _T_545 = master_size[1:0] == 2'h3; // @[axi4_to_ahb.scala 349:25]
  wire  _T_547 = wrbuf_byteen == 8'h3; // @[axi4_to_ahb.scala 349:62]
  wire  _T_549 = wrbuf_byteen == 8'hc; // @[axi4_to_ahb.scala 349:97]
  wire  _T_550 = _T_547 | _T_549; // @[axi4_to_ahb.scala 349:74]
  wire  _T_552 = wrbuf_byteen == 8'h30; // @[axi4_to_ahb.scala 349:132]
  wire  _T_553 = _T_550 | _T_552; // @[axi4_to_ahb.scala 349:109]
  wire  _T_555 = wrbuf_byteen == 8'hc0; // @[axi4_to_ahb.scala 349:168]
  wire  _T_556 = _T_553 | _T_555; // @[axi4_to_ahb.scala 349:145]
  wire  _T_558 = wrbuf_byteen == 8'hf; // @[axi4_to_ahb.scala 350:28]
  wire  _T_559 = _T_556 | _T_558; // @[axi4_to_ahb.scala 349:181]
  wire  _T_561 = wrbuf_byteen == 8'hf0; // @[axi4_to_ahb.scala 350:63]
  wire  _T_562 = _T_559 | _T_561; // @[axi4_to_ahb.scala 350:40]
  wire  _T_564 = wrbuf_byteen == 8'hff; // @[axi4_to_ahb.scala 350:99]
  wire  _T_565 = _T_562 | _T_564; // @[axi4_to_ahb.scala 350:76]
  wire  _T_566 = _T_545 & _T_565; // @[axi4_to_ahb.scala 349:38]
  wire  buf_aligned_in = _T_543 | _T_566; // @[axi4_to_ahb.scala 348:106]
  wire  _T_445 = buf_aligned_in & _T_49; // @[axi4_to_ahb.scala 342:60]
  wire [2:0] _T_462 = _T_549 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_463 = 3'h2 & _T_462; // @[axi4_to_ahb.scala 174:15]
  wire  _T_469 = _T_561 | _T_547; // @[axi4_to_ahb.scala 175:56]
  wire [2:0] _T_471 = _T_469 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_472 = 3'h4 & _T_471; // @[axi4_to_ahb.scala 175:15]
  wire [2:0] _T_473 = _T_463 | _T_472; // @[axi4_to_ahb.scala 174:63]
  wire [2:0] _T_477 = _T_555 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_478 = 3'h6 & _T_477; // @[axi4_to_ahb.scala 176:17]
  wire [2:0] _T_479 = _T_473 | _T_478; // @[axi4_to_ahb.scala 175:96]
  wire [2:0] _T_486 = _T_445 ? _T_479 : master_addr[2:0]; // @[axi4_to_ahb.scala 342:43]
  wire  _T_490 = buf_state == 3'h3; // @[axi4_to_ahb.scala 345:33]
  wire  _T_496 = buf_aligned_in & _T_545; // @[axi4_to_ahb.scala 346:38]
  wire  _T_499 = _T_496 & _T_49; // @[axi4_to_ahb.scala 346:71]
  wire [1:0] _T_505 = _T_564 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_511 = _T_561 | _T_558; // @[axi4_to_ahb.scala 167:55]
  wire [1:0] _T_513 = _T_511 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_514 = 2'h2 & _T_513; // @[axi4_to_ahb.scala 167:16]
  wire [1:0] _T_515 = _T_505 | _T_514; // @[axi4_to_ahb.scala 166:64]
  wire  _T_520 = _T_555 | _T_552; // @[axi4_to_ahb.scala 168:60]
  wire  _T_523 = _T_520 | _T_549; // @[axi4_to_ahb.scala 168:89]
  wire  _T_526 = _T_523 | _T_547; // @[axi4_to_ahb.scala 168:123]
  wire [1:0] _T_528 = _T_526 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_529 = 2'h1 & _T_528; // @[axi4_to_ahb.scala 168:21]
  wire [1:0] _T_530 = _T_515 | _T_529; // @[axi4_to_ahb.scala 167:93]
  wire [1:0] _T_532 = _T_499 ? _T_530 : master_size[1:0]; // @[axi4_to_ahb.scala 346:21]
  wire [31:0] _T_571 = {master_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [31:0] _T_574 = {buf_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [1:0] _T_578 = buf_aligned_in ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] buf_size_in = {{1'd0}, _T_532}; // @[axi4_to_ahb.scala 346:15]
  wire [1:0] _T_580 = _T_578 & buf_size_in[1:0]; // @[axi4_to_ahb.scala 353:77]
  wire [2:0] _T_581 = {1'h0,_T_580}; // @[Cat.scala 29:58]
  wire [1:0] _T_583 = buf_aligned ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg [1:0] buf_size; // @[Reg.scala 27:20]
  wire [1:0] _T_585 = _T_583 & buf_size; // @[axi4_to_ahb.scala 353:134]
  wire [2:0] _T_586 = {1'h0,_T_585}; // @[Cat.scala 29:58]
  wire  _T_589 = ~io_axi_arprot[2]; // @[axi4_to_ahb.scala 357:33]
  wire [1:0] _T_590 = {1'h1,_T_589}; // @[Cat.scala 29:58]
  reg  buf_write; // @[Reg.scala 27:20]
  wire  _T_612 = io_ahb_htrans != 2'h0; // @[axi4_to_ahb.scala 366:40]
  wire  _T_613 = _T_612 & io_ahb_hready; // @[axi4_to_ahb.scala 366:52]
  wire  last_addr_en = _T_613 & io_ahb_hwrite; // @[axi4_to_ahb.scala 366:68]
  wire  wrbuf_en = _T_42 & master_ready; // @[axi4_to_ahb.scala 368:47]
  wire  wrbuf_data_en = _T_43 & master_ready; // @[axi4_to_ahb.scala 369:50]
  wire  wrbuf_cmd_sent = _T_147 & _T_49; // @[axi4_to_ahb.scala 370:49]
  wire  _T_623 = ~wrbuf_en; // @[axi4_to_ahb.scala 371:33]
  wire  wrbuf_rst = wrbuf_cmd_sent & _T_623; // @[axi4_to_ahb.scala 371:31]
  wire  _T_625 = ~wrbuf_cmd_sent; // @[axi4_to_ahb.scala 373:35]
  wire  _T_626 = wrbuf_vld & _T_625; // @[axi4_to_ahb.scala 373:33]
  wire  _T_627 = ~_T_626; // @[axi4_to_ahb.scala 373:21]
  wire  _T_630 = wrbuf_data_vld & _T_625; // @[axi4_to_ahb.scala 374:37]
  wire  _T_631 = ~_T_630; // @[axi4_to_ahb.scala 374:20]
  wire  _T_634 = ~wr_cmd_vld; // @[axi4_to_ahb.scala 375:21]
  wire  _T_637 = wrbuf_en | wrbuf_vld; // @[axi4_to_ahb.scala 379:52]
  wire  _T_638 = ~wrbuf_rst; // @[axi4_to_ahb.scala 379:88]
  wire  _T_642 = wrbuf_data_en | wrbuf_data_vld; // @[axi4_to_ahb.scala 380:52]
  reg  buf_tag; // @[Reg.scala 27:20]
  wire  _T_692 = ~slave_valid_pre; // @[axi4_to_ahb.scala 431:52]
  wire  _T_705 = buf_wr_en | slvbuf_wr_en; // @[axi4_to_ahb.scala 455:43]
  wire  _T_706 = _T_705 | io_clk_override; // @[axi4_to_ahb.scala 455:58]
  wire  _T_709 = io_ahb_hready & io_ahb_htrans[1]; // @[axi4_to_ahb.scala 456:54]
  wire  _T_710 = _T_709 | io_clk_override; // @[axi4_to_ahb.scala 456:74]
  wire  _T_712 = buf_state != 3'h0; // @[axi4_to_ahb.scala 457:50]
  wire  _T_713 = _T_712 | io_clk_override; // @[axi4_to_ahb.scala 457:60]
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
  assign io_axi_awready = _T_627 & master_ready; // @[axi4_to_ahb.scala 373:18]
  assign io_axi_wready = _T_631 & master_ready; // @[axi4_to_ahb.scala 374:17]
  assign io_axi_bvalid = _T_23 & slave_opc[3]; // @[axi4_to_ahb.scala 207:17]
  assign io_axi_bresp = slave_opc[0] ? 2'h2 : _T_28; // @[axi4_to_ahb.scala 208:16]
  assign io_axi_bid = slvbuf_tag; // @[axi4_to_ahb.scala 209:14]
  assign io_axi_arready = _T_634 & master_ready; // @[axi4_to_ahb.scala 375:18]
  assign io_axi_rvalid = _T_23 & _T_33; // @[axi4_to_ahb.scala 211:17]
  assign io_axi_rid = slvbuf_tag; // @[axi4_to_ahb.scala 213:14]
  assign io_axi_rdata = slvbuf_error ? _T_604 : _T_608; // @[axi4_to_ahb.scala 214:16]
  assign io_axi_rresp = slave_opc[0] ? 2'h2 : _T_28; // @[axi4_to_ahb.scala 212:16]
  assign io_axi_rlast = 1'h1; // @[axi4_to_ahb.scala 376:16]
  assign io_ahb_haddr = bypass_en ? _T_571 : _T_574; // @[axi4_to_ahb.scala 352:16]
  assign io_ahb_hburst = 3'h0; // @[axi4_to_ahb.scala 355:17]
  assign io_ahb_hmastlock = 1'h0; // @[axi4_to_ahb.scala 356:20]
  assign io_ahb_hprot = {{2'd0}, _T_590}; // @[axi4_to_ahb.scala 357:16]
  assign io_ahb_hsize = bypass_en ? _T_581 : _T_586; // @[axi4_to_ahb.scala 353:16]
  assign io_ahb_htrans = _T_47 ? _T_98 : _GEN_90; // @[axi4_to_ahb.scala 224:17 axi4_to_ahb.scala 255:21 axi4_to_ahb.scala 267:21 axi4_to_ahb.scala 282:21 axi4_to_ahb.scala 292:21 axi4_to_ahb.scala 312:21 axi4_to_ahb.scala 326:21]
  assign io_ahb_hwrite = bypass_en ? _T_49 : buf_write; // @[axi4_to_ahb.scala 358:17]
  assign io_ahb_hwdata = buf_data; // @[axi4_to_ahb.scala 359:17]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_44; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = rvclkhdr_io_l1clk; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = _T_42 & master_ready; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = rvclkhdr_io_l1clk; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = _T_43 & master_ready; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = buf_wr_en & io_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = buf_data_wr_en & io_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_6_io_en = io_bus_clk_en & _T_706; // @[el2_lib.scala 485:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_7_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_8_io_en = io_bus_clk_en & _T_710; // @[el2_lib.scala 485:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_9_io_en = io_bus_clk_en & _T_713; // @[el2_lib.scala 485:16]
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
      if (_T_47) begin
        if (buf_write_in) begin
          buf_state <= 3'h2;
        end else begin
          buf_state <= 3'h1;
        end
      end else if (_T_99) begin
        if (_T_102) begin
          buf_state <= 3'h6;
        end else begin
          buf_state <= 3'h3;
        end
      end else if (_T_134) begin
        if (ahb_hresp_q) begin
          buf_state <= 3'h7;
        end else if (_T_150) begin
          buf_state <= 3'h6;
        end else begin
          buf_state <= 3'h3;
        end
      end else if (_T_173) begin
        buf_state <= 3'h3;
      end else if (_T_184) begin
        buf_state <= 3'h5;
      end else if (_T_186) begin
        buf_state <= 3'h4;
      end else if (_T_279) begin
        if (_T_288) begin
          buf_state <= 3'h5;
        end else if (_T_147) begin
          if (_T_49) begin
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
      wrbuf_vld <= _T_637 & _T_638;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else begin
      wrbuf_data_vld <= _T_642 & _T_638;
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
      cmd_doneQ <= _T_274 & _T_692;
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
      if (_T_47) begin
        slvbuf_error <= 1'h0;
      end else if (_T_99) begin
        slvbuf_error <= 1'h0;
      end else if (_T_134) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_173) begin
        slvbuf_error <= 1'h0;
      end else if (_T_184) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_186) begin
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
    end else if (_T_490) begin
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
      buf_addr <= {master_addr[31:3],_T_486};
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      buf_cmd_byte_ptrQ <= 3'h0;
    end else if (buf_cmd_byte_ptr_en) begin
      if (_T_47) begin
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
      end else if (_T_99) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_134) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_173) begin
        buf_cmd_byte_ptrQ <= buf_addr[2:0];
      end else if (_T_184) begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end else if (_T_186) begin
        if (trxn_done) begin
          if (_T_199) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (_T_202) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_205) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_208) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_211) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_214) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_217) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else if (buf_byteen[7]) begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end
        end
      end else if (_T_279) begin
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
          if (_T_199) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (_T_202) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_205) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_208) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_211) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_214) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_217) begin
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
      buf_size <= 2'h0;
    end else if (buf_wr_en) begin
      buf_size <= buf_size_in[1:0];
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_write <= 1'h0;
    end else if (buf_wr_en) begin
      if (_T_47) begin
        buf_write <= _T_49;
      end else if (_T_99) begin
        buf_write <= 1'h0;
      end else if (_T_134) begin
        buf_write <= 1'h0;
      end else if (_T_173) begin
        buf_write <= 1'h0;
      end else if (_T_184) begin
        buf_write <= 1'h0;
      end else if (_T_186) begin
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
