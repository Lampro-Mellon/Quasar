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
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
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
  reg [63:0] wrbuf_data; // @[el2_lib.scala 514:16]
  wire  ahbm_clk = rvclkhdr_7_io_l1clk; // @[axi4_to_ahb.scala 152:22 axi4_to_ahb.scala 458:12]
  reg [2:0] buf_state; // @[axi4_to_ahb.scala 393:12]
  wire  _T_42 = 3'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_94 = 3'h1 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_124 = 3'h6 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hready_q; // @[axi4_to_ahb.scala 437:12]
  reg [1:0] ahb_htrans_q; // @[axi4_to_ahb.scala 440:12]
  wire  _T_101 = ahb_htrans_q != 2'h0; // @[axi4_to_ahb.scala 255:58]
  wire  _T_102 = ahb_hready_q & _T_101; // @[axi4_to_ahb.scala 255:36]
  wire  ahbm_addr_clk = rvclkhdr_8_io_l1clk; // @[axi4_to_ahb.scala 153:27 axi4_to_ahb.scala 459:17]
  reg  ahb_hwrite_q; // @[axi4_to_ahb.scala 443:12]
  wire  _T_103 = ~ahb_hwrite_q; // @[axi4_to_ahb.scala 255:72]
  wire  _T_104 = _T_102 & _T_103; // @[axi4_to_ahb.scala 255:70]
  reg  ahb_hresp_q; // @[axi4_to_ahb.scala 446:12]
  wire  _T_140 = ahb_hready_q | ahb_hresp_q; // @[axi4_to_ahb.scala 269:37]
  wire  _T_159 = 3'h7 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_170 = 3'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_172 = 3'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_173 = ahb_hready_q & ahb_hwrite_q; // @[axi4_to_ahb.scala 301:33]
  wire  _T_176 = _T_173 & _T_101; // @[axi4_to_ahb.scala 301:48]
  wire  _T_265 = 3'h4 == buf_state; // @[Conditional.scala 37:30]
  wire  _GEN_14 = _T_265 & _T_176; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_172 ? _T_176 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_170 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_159 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_124 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_89 = _T_94 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  trxn_done = _T_42 ? 1'h0 : _GEN_89; // @[Conditional.scala 40:58]
  reg  cmd_doneQ; // @[axi4_to_ahb.scala 428:12]
  wire  _T_266 = cmd_doneQ & ahb_hready_q; // @[axi4_to_ahb.scala 311:34]
  wire  _T_267 = _T_266 | ahb_hresp_q; // @[axi4_to_ahb.scala 311:50]
  wire  _T_428 = 3'h5 == buf_state; // @[Conditional.scala 37:30]
  wire  slave_ready = io_axi_bready & io_axi_rready; // @[axi4_to_ahb.scala 210:32]
  wire  _GEN_1 = _T_428 & slave_ready; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_265 ? _T_267 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_172 ? trxn_done : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_170 ? _T_140 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_159 ? _T_104 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_124 ? _T_140 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_94 ? _T_104 : _GEN_63; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_42 ? io_axi_arvalid : _GEN_77; // @[Conditional.scala 40:58]
  wire  _T_141 = ~ahb_hresp_q; // @[axi4_to_ahb.scala 273:41]
  wire  _T_142 = buf_state_en & _T_141; // @[axi4_to_ahb.scala 273:39]
  wire  _T_273 = ~slave_ready; // @[axi4_to_ahb.scala 313:42]
  wire  _T_274 = ahb_hresp_q | _T_273; // @[axi4_to_ahb.scala 313:40]
  wire  _T_271 = _T_267 & _T_141; // @[axi4_to_ahb.scala 312:68]
  wire  _T_272 = _T_271 & slave_ready; // @[axi4_to_ahb.scala 312:83]
  wire  _T_276 = io_axi_arvalid & _T_272; // @[axi4_to_ahb.scala 313:90]
  wire [2:0] _T_281 = _T_276 ? 3'h1 : 3'h0; // @[axi4_to_ahb.scala 313:75]
  wire [2:0] _T_282 = _T_274 ? 3'h5 : _T_281; // @[axi4_to_ahb.scala 313:26]
  wire [2:0] _GEN_4 = _T_265 ? _T_282 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_172 ? 3'h4 : _GEN_4; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_32 = _T_170 ? 3'h5 : _GEN_17; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_47 = _T_159 ? 3'h3 : _GEN_32; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_73 = _T_124 ? 3'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_88 = _T_94 ? 3'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire [2:0] buf_nxtstate = _T_42 ? 3'h0 : _GEN_88; // @[Conditional.scala 40:58]
  wire  _T_345 = buf_nxtstate != 3'h5; // @[axi4_to_ahb.scala 322:55]
  wire  _T_346 = buf_state_en & _T_345; // @[axi4_to_ahb.scala 322:39]
  wire  _GEN_13 = _T_265 ? _T_346 : _T_428; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_172 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_170 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_159 ? buf_state_en : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_124 ? _T_142 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_94 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  slave_valid_pre = _T_42 ? 1'h0 : _GEN_87; // @[Conditional.scala 40:58]
  wire  _T_18 = slave_valid_pre & slave_ready; // @[axi4_to_ahb.scala 202:32]
  wire  buf_clk = rvclkhdr_6_io_l1clk; // @[axi4_to_ahb.scala 150:21 axi4_to_ahb.scala 457:12]
  reg  slvbuf_error; // @[Reg.scala 27:20]
  wire [1:0] _T_582 = slvbuf_error ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_583 = _T_582 & 2'h2; // @[axi4_to_ahb.scala 359:88]
  wire [3:0] slave_opc = {2'h0,_T_583}; // @[Cat.scala 29:58]
  wire [1:0] _T_23 = slave_opc[1] ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 203:49]
  reg  slvbuf_tag; // @[Reg.scala 27:20]
  wire  _T_28 = slave_opc[3:2] == 2'h0; // @[axi4_to_ahb.scala 206:65]
  reg [31:0] last_bus_addr; // @[Reg.scala 27:20]
  wire [63:0] _T_587 = {last_bus_addr,last_bus_addr}; // @[Cat.scala 29:58]
  wire  _T_588 = buf_state == 3'h5; // @[axi4_to_ahb.scala 360:91]
  reg [63:0] buf_data; // @[el2_lib.scala 514:16]
  wire  ahbm_data_clk = rvclkhdr_9_io_l1clk; // @[axi4_to_ahb.scala 154:27 axi4_to_ahb.scala 460:17]
  reg [63:0] ahb_hrdata_q; // @[axi4_to_ahb.scala 449:12]
  wire [63:0] _T_591 = _T_588 ? buf_data : ahb_hrdata_q; // @[axi4_to_ahb.scala 360:79]
  wire  _T_37 = io_axi_awvalid & io_axi_awready; // @[axi4_to_ahb.scala 213:56]
  wire  _T_38 = io_axi_wvalid & io_axi_wready; // @[axi4_to_ahb.scala 213:91]
  wire  _T_39 = _T_37 | _T_38; // @[axi4_to_ahb.scala 213:74]
  wire [2:0] _T_99 = io_axi_arvalid ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 254:28]
  wire  _T_112 = _T_99 == 3'h6; // @[axi4_to_ahb.scala 258:107]
  wire  _T_113 = _T_104 & _T_112; // @[axi4_to_ahb.scala 258:91]
  wire  _T_114 = _T_113 & io_axi_arvalid; // @[axi4_to_ahb.scala 260:33]
  wire  _T_126 = ahb_hready_q & _T_141; // @[axi4_to_ahb.scala 266:39]
  wire  _T_145 = _T_126 & io_axi_arvalid; // @[axi4_to_ahb.scala 275:33]
  wire  _T_132 = io_axi_arvalid & _T_126; // @[axi4_to_ahb.scala 267:34]
  wire  _T_285 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 317:50]
  wire  _T_286 = buf_nxtstate == 3'h1; // @[axi4_to_ahb.scala 317:78]
  wire  _T_287 = _T_285 | _T_286; // @[axi4_to_ahb.scala 317:62]
  wire  _T_288 = buf_state_en & _T_287; // @[axi4_to_ahb.scala 317:33]
  wire  _GEN_8 = _T_265 & _T_288; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_172 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_170 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_159 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_124 ? _T_132 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_94 ? _T_113 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en = _T_42 ? buf_state_en : _GEN_80; // @[Conditional.scala 40:58]
  wire [2:0] _T_138 = buf_wr_en ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 268:69]
  wire [2:0] _T_139 = ahb_hresp_q ? 3'h7 : _T_138; // @[axi4_to_ahb.scala 268:28]
  wire  _T_146 = _T_139 == 3'h6; // @[axi4_to_ahb.scala 275:64]
  wire  _T_147 = _T_145 & _T_146; // @[axi4_to_ahb.scala 275:48]
  wire  _T_148 = _T_147 & buf_state_en; // @[axi4_to_ahb.scala 275:79]
  wire  _GEN_69 = _T_124 & _T_148; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_94 ? _T_114 : _GEN_69; // @[Conditional.scala 39:67]
  wire  bypass_en = _T_42 ? buf_state_en : _GEN_81; // @[Conditional.scala 40:58]
  wire [1:0] _T_92 = bypass_en ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_93 = _T_92 & 2'h2; // @[axi4_to_ahb.scala 250:45]
  wire  _T_105 = ~io_axi_arvalid; // @[axi4_to_ahb.scala 256:34]
  wire  _T_106 = buf_state_en & _T_105; // @[axi4_to_ahb.scala 256:32]
  reg [31:0] buf_addr; // @[el2_lib.scala 514:16]
  wire [2:0] _T_118 = bypass_en ? io_axi_araddr[2:0] : buf_addr[2:0]; // @[axi4_to_ahb.scala 261:30]
  wire  _T_119 = ~buf_state_en; // @[axi4_to_ahb.scala 262:44]
  wire  _T_120 = _T_119 | bypass_en; // @[axi4_to_ahb.scala 262:58]
  wire [1:0] _T_122 = _T_120 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_123 = 2'h2 & _T_122; // @[axi4_to_ahb.scala 262:32]
  wire  _T_153 = _T_139 != 3'h6; // @[axi4_to_ahb.scala 277:59]
  wire  _T_154 = _T_153 & buf_state_en; // @[axi4_to_ahb.scala 277:74]
  wire  _T_155 = ~_T_154; // @[axi4_to_ahb.scala 277:43]
  wire [1:0] _T_157 = _T_155 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_158 = 2'h2 & _T_157; // @[axi4_to_ahb.scala 277:32]
  wire [1:0] _T_168 = _T_119 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_169 = 2'h2 & _T_168; // @[axi4_to_ahb.scala 287:37]
  reg [2:0] buf_cmd_byte_ptrQ; // @[Reg.scala 27:20]
  wire [2:0] _T_215 = trxn_done ? 3'h0 : buf_cmd_byte_ptrQ; // @[axi4_to_ahb.scala 305:30]
  reg  buf_aligned; // @[Reg.scala 27:20]
  wire  _T_335 = ahb_hresp_q | _T_102; // @[axi4_to_ahb.scala 319:32]
  wire  _GEN_10 = _T_265 & _T_335; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_172 ? trxn_done : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_170 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_159 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_124 ? _T_106 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_94 ? _T_106 : _GEN_68; // @[Conditional.scala 39:67]
  wire  cmd_done = _T_42 ? 1'h0 : _GEN_78; // @[Conditional.scala 40:58]
  wire  _T_260 = cmd_done | cmd_doneQ; // @[axi4_to_ahb.scala 307:43]
  wire  _T_261 = ~_T_260; // @[axi4_to_ahb.scala 307:32]
  wire [1:0] _T_263 = _T_261 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_264 = _T_263 & 2'h2; // @[axi4_to_ahb.scala 307:57]
  wire  _T_341 = _T_261 | bypass_en; // @[axi4_to_ahb.scala 321:57]
  wire [1:0] _T_343 = _T_341 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_344 = _T_343 & 2'h2; // @[axi4_to_ahb.scala 321:71]
  wire  _T_351 = trxn_done | bypass_en; // @[axi4_to_ahb.scala 324:40]
  wire [2:0] _T_427 = bypass_en ? 3'h0 : _T_215; // @[axi4_to_ahb.scala 327:30]
  wire  _GEN_5 = _T_265 & ahb_hresp_q; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_265 ? buf_state_en : _T_428; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_265 & buf_wr_en; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_12 = _T_265 ? _T_344 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_265 & _T_351; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_16 = _T_265 ? _T_427 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_172 ? buf_state_en : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_172 & buf_state_en; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_22 = _T_172 ? _T_215 : _GEN_16; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_24 = _T_172 ? _T_264 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_172 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_172 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_170 ? buf_state_en : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_170 ? buf_state_en : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_170 ? buf_state_en : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_170 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_40 = _T_170 ? 3'h0 : _GEN_22; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_42 = _T_170 ? 2'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_159 ? buf_state_en : _GEN_37; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_51 = _T_159 ? buf_addr[2:0] : _GEN_40; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_52 = _T_159 ? _T_169 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_159 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_159 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_159 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_124 ? buf_state_en : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_124 ? buf_state_en : _GEN_55; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_70 = _T_124 ? _T_118 : _GEN_51; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_71 = _T_124 ? _T_158 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_124 ? buf_wr_en : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_124 ? 1'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_94 ? buf_state_en : _GEN_72; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_82 = _T_94 ? _T_118 : _GEN_70; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_83 = _T_94 ? _T_123 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_94 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_94 ? 1'h0 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_90 = _T_94 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67]
  wire  buf_data_wr_en = _T_42 ? 1'h0 : _GEN_84; // @[Conditional.scala 40:58]
  wire  buf_cmd_byte_ptr_en = _T_42 ? buf_state_en : _GEN_90; // @[Conditional.scala 40:58]
  wire [2:0] buf_cmd_byte_ptr = _T_42 ? io_axi_araddr[2:0] : _GEN_82; // @[Conditional.scala 40:58]
  wire  slvbuf_wr_en = _T_42 ? 1'h0 : _GEN_79; // @[Conditional.scala 40:58]
  wire  slvbuf_error_en = _T_42 ? 1'h0 : _GEN_86; // @[Conditional.scala 40:58]
  wire [34:0] _T_469 = {io_axi_araddr,io_axi_araddr[2:0]}; // @[Cat.scala 29:58]
  wire  _T_472 = buf_state == 3'h3; // @[axi4_to_ahb.scala 342:33]
  wire [31:0] _T_554 = {io_axi_araddr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [31:0] _T_557 = {buf_addr[31:3],buf_cmd_byte_ptr}; // @[Cat.scala 29:58]
  wire [2:0] buf_size_in = {{1'd0}, io_axi_arsize[1:0]}; // @[axi4_to_ahb.scala 343:15]
  wire [2:0] _T_564 = {1'h0,buf_size_in[1:0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_566 = buf_aligned ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg [1:0] buf_size; // @[Reg.scala 27:20]
  wire [1:0] _T_568 = _T_566 & buf_size; // @[axi4_to_ahb.scala 350:138]
  wire [2:0] _T_569 = {1'h0,_T_568}; // @[Cat.scala 29:58]
  wire  _T_572 = ~io_axi_arprot[2]; // @[axi4_to_ahb.scala 354:33]
  wire [1:0] _T_573 = {1'h1,_T_572}; // @[Cat.scala 29:58]
  wire  _T_595 = io_ahb_htrans != 2'h0; // @[axi4_to_ahb.scala 363:40]
  wire  _T_596 = _T_595 & io_ahb_hready; // @[axi4_to_ahb.scala 363:52]
  wire  last_addr_en = _T_596 & io_ahb_hwrite; // @[axi4_to_ahb.scala 363:68]
  wire [2:0] _T_646 = buf_state_en ? buf_nxtstate : buf_state; // @[axi4_to_ahb.scala 393:16]
  reg  buf_tag; // @[Reg.scala 27:20]
  wire  _T_680 = ~slave_valid_pre; // @[axi4_to_ahb.scala 428:52]
  wire  _T_693 = buf_wr_en | slvbuf_wr_en; // @[axi4_to_ahb.scala 452:43]
  wire  _T_694 = _T_693 | io_clk_override; // @[axi4_to_ahb.scala 452:58]
  wire  _T_697 = io_ahb_hready & io_ahb_htrans[1]; // @[axi4_to_ahb.scala 453:54]
  wire  _T_698 = _T_697 | io_clk_override; // @[axi4_to_ahb.scala 453:74]
  wire  _T_700 = buf_state != 3'h0; // @[axi4_to_ahb.scala 454:50]
  wire  _T_701 = _T_700 | io_clk_override; // @[axi4_to_ahb.scala 454:60]
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
  assign io_axi_awready = 1'h0; // @[axi4_to_ahb.scala 370:18]
  assign io_axi_wready = 1'h0; // @[axi4_to_ahb.scala 371:17]
  assign io_axi_bvalid = _T_18 & slave_opc[3]; // @[axi4_to_ahb.scala 202:17]
  assign io_axi_bresp = slave_opc[0] ? 2'h2 : _T_23; // @[axi4_to_ahb.scala 203:16]
  assign io_axi_bid = slvbuf_tag; // @[axi4_to_ahb.scala 204:14]
  assign io_axi_arready = 1'h0; // @[axi4_to_ahb.scala 372:18]
  assign io_axi_rvalid = _T_18 & _T_28; // @[axi4_to_ahb.scala 206:17]
  assign io_axi_rid = slvbuf_tag; // @[axi4_to_ahb.scala 208:14]
  assign io_axi_rdata = slvbuf_error ? _T_587 : _T_591; // @[axi4_to_ahb.scala 209:16]
  assign io_axi_rresp = slave_opc[0] ? 2'h2 : _T_23; // @[axi4_to_ahb.scala 207:16]
  assign io_axi_rlast = 1'h1; // @[axi4_to_ahb.scala 373:16]
  assign io_ahb_haddr = bypass_en ? _T_554 : _T_557; // @[axi4_to_ahb.scala 349:16]
  assign io_ahb_hburst = 3'h0; // @[axi4_to_ahb.scala 352:17]
  assign io_ahb_hmastlock = 1'h0; // @[axi4_to_ahb.scala 353:20]
  assign io_ahb_hprot = {{2'd0}, _T_573}; // @[axi4_to_ahb.scala 354:16]
  assign io_ahb_hsize = bypass_en ? _T_564 : _T_569; // @[axi4_to_ahb.scala 350:16]
  assign io_ahb_htrans = _T_42 ? _T_93 : _GEN_83; // @[axi4_to_ahb.scala 219:17 axi4_to_ahb.scala 250:21 axi4_to_ahb.scala 262:21 axi4_to_ahb.scala 277:21 axi4_to_ahb.scala 287:21 axi4_to_ahb.scala 307:21 axi4_to_ahb.scala 321:21]
  assign io_ahb_hwrite = 1'h0; // @[axi4_to_ahb.scala 355:17]
  assign io_ahb_hwdata = buf_data; // @[axi4_to_ahb.scala 356:17]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_39; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = 1'h0; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = 1'h0; // @[el2_lib.scala 511:17]
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
  _RAND_0 = {2{`RANDOM}};
  wrbuf_data = _RAND_0[63:0];
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
  cmd_doneQ = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  slvbuf_error = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  slvbuf_tag = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  last_bus_addr = _RAND_9[31:0];
  _RAND_10 = {2{`RANDOM}};
  buf_data = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  ahb_hrdata_q = _RAND_11[63:0];
  _RAND_12 = {1{`RANDOM}};
  buf_addr = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  buf_cmd_byte_ptrQ = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  buf_aligned = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  buf_size = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  buf_tag = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    wrbuf_data = 64'h0;
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
    cmd_doneQ = 1'h0;
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
    buf_aligned = 1'h0;
  end
  if (reset) begin
    buf_size = 2'h0;
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
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      wrbuf_data <= 64'h0;
    end else begin
      wrbuf_data <= io_axi_wdata;
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
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      cmd_doneQ <= 1'h0;
    end else begin
      cmd_doneQ <= _T_260 & _T_680;
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      slvbuf_error <= 1'h0;
    end else if (slvbuf_error_en) begin
      if (_T_42) begin
        slvbuf_error <= 1'h0;
      end else if (_T_94) begin
        slvbuf_error <= 1'h0;
      end else if (_T_124) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_159) begin
        slvbuf_error <= 1'h0;
      end else if (_T_170) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_172) begin
        slvbuf_error <= 1'h0;
      end else begin
        slvbuf_error <= _GEN_5;
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
    end else if (_T_472) begin
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
      buf_addr <= _T_469[31:0];
    end
  end
  always @(posedge ahbm_clk or posedge reset) begin
    if (reset) begin
      buf_cmd_byte_ptrQ <= 3'h0;
    end else if (buf_cmd_byte_ptr_en) begin
      if (_T_42) begin
        buf_cmd_byte_ptrQ <= io_axi_araddr[2:0];
      end else if (_T_94) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= io_axi_araddr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_124) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= io_axi_araddr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_159) begin
        buf_cmd_byte_ptrQ <= buf_addr[2:0];
      end else if (_T_170) begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end else if (_T_172) begin
        if (trxn_done) begin
          buf_cmd_byte_ptrQ <= 3'h0;
        end
      end else if (_T_265) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= 3'h0;
        end else if (trxn_done) begin
          buf_cmd_byte_ptrQ <= 3'h0;
        end
      end else begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end
    end
  end
  always @(posedge buf_clk or posedge reset) begin
    if (reset) begin
      buf_aligned <= 1'h0;
    end else begin
      buf_aligned <= buf_wr_en | buf_aligned;
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
      buf_tag <= 1'h0;
    end else if (buf_wr_en) begin
      buf_tag <= io_axi_arid;
    end
  end
endmodule
