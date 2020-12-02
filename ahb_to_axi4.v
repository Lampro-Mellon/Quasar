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
module ahb_to_axi4(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_bus_clk_en,
  input         io_clk_override,
  input         io_axi_awready,
  input         io_axi_wready,
  input         io_axi_bvalid,
  input  [1:0]  io_axi_bresp,
  input         io_axi_arready,
  input         io_axi_rvalid,
  input  [63:0] io_axi_rdata,
  input  [1:0]  io_axi_rresp,
  input  [31:0] io_ahb_haddr,
  input  [2:0]  io_ahb_hburst,
  input         io_ahb_hmastlock,
  input  [3:0]  io_ahb_hprot,
  input  [2:0]  io_ahb_hsize,
  input  [1:0]  io_ahb_htrans,
  input         io_ahb_hwrite,
  input  [63:0] io_ahb_hwdata,
  input         io_ahb_hsel,
  input         io_ahb_hreadyin,
  output        io_axi_awvalid,
  output [31:0] io_axi_awaddr,
  output [2:0]  io_axi_awsize,
  output [2:0]  io_axi_awprot,
  output [7:0]  io_axi_awlen,
  output [1:0]  io_axi_awburst,
  output        io_axi_wvalid,
  output [63:0] io_axi_wdata,
  output [7:0]  io_axi_wstrb,
  output        io_axi_wlast,
  output        io_axi_bready,
  output        io_axi_arvalid,
  output [31:0] io_axi_araddr,
  output [2:0]  io_axi_arsize,
  output [2:0]  io_axi_arprot,
  output [7:0]  io_axi_arlen,
  output [1:0]  io_axi_arburst,
  output        io_axi_rready,
  output [63:0] io_ahb_hrdata,
  output        io_ahb_hreadyout,
  output        io_ahb_hresp
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
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
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
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  ahb_addr_clk = rvclkhdr_1_io_l1clk; // @[ahb_to_axi4.scala 85:35 ahb_to_axi4.scala 185:33]
  reg [31:0] ahb_haddr_q; // @[ahb_to_axi4.scala 178:67]
  wire  ahb_addr_in_dccm = ahb_haddr_q[31:16] == 16'hf004; // @[el2_lib.scala 501:39]
  wire  ahb_clk = rvclkhdr_io_l1clk; // @[ahb_to_axi4.scala 84:35 ahb_to_axi4.scala 184:33]
  reg [1:0] buf_state; // @[Reg.scala 27:20]
  wire  _T_6 = 2'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  ahb_hready = io_ahb_hreadyout & io_ahb_hreadyin; // @[ahb_to_axi4.scala 156:53]
  wire  _T_9 = ahb_hready & io_ahb_htrans[1]; // @[ahb_to_axi4.scala 128:36]
  wire  _T_10 = _T_9 & io_ahb_hsel; // @[ahb_to_axi4.scala 128:55]
  wire  _T_11 = 2'h1 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_13 = io_ahb_htrans == 2'h0; // @[ahb_to_axi4.scala 131:66]
  wire  _T_14 = io_ahb_hresp | _T_13; // @[ahb_to_axi4.scala 131:43]
  wire  _T_15 = ~io_ahb_hsel; // @[ahb_to_axi4.scala 131:80]
  wire  _T_16 = _T_14 | _T_15; // @[ahb_to_axi4.scala 131:78]
  wire  bus_clk = rvclkhdr_5_io_l1clk; // @[ahb_to_axi4.scala 98:35 ahb_to_axi4.scala 234:29]
  reg  cmdbuf_vld; // @[ahb_to_axi4.scala 191:63]
  wire  _T_150 = io_axi_awvalid & io_axi_awready; // @[ahb_to_axi4.scala 189:68]
  wire  _T_151 = io_axi_arvalid & io_axi_arready; // @[ahb_to_axi4.scala 189:104]
  wire  _T_152 = _T_150 | _T_151; // @[ahb_to_axi4.scala 189:86]
  wire  _T_153 = ~_T_152; // @[ahb_to_axi4.scala 189:50]
  wire  cmdbuf_full = cmdbuf_vld & _T_153; // @[ahb_to_axi4.scala 189:48]
  wire  _T_20 = ~cmdbuf_full; // @[ahb_to_axi4.scala 132:26]
  wire  _T_21 = _T_20 | io_ahb_hresp; // @[ahb_to_axi4.scala 132:39]
  wire  _T_24 = io_ahb_htrans == 2'h1; // @[ahb_to_axi4.scala 133:79]
  wire  _T_25 = _T_24 & io_ahb_hsel; // @[ahb_to_axi4.scala 133:97]
  wire  _T_26 = io_ahb_hresp | _T_25; // @[ahb_to_axi4.scala 133:55]
  wire  _T_27 = ~_T_26; // @[ahb_to_axi4.scala 133:40]
  wire  _T_28 = _T_20 & _T_27; // @[ahb_to_axi4.scala 133:38]
  wire  _T_29 = 2'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_33 = ~io_ahb_hresp; // @[ahb_to_axi4.scala 138:25]
  wire  _T_35 = _T_33 & _T_20; // @[ahb_to_axi4.scala 138:39]
  wire  _T_36 = 2'h3 == buf_state; // @[Conditional.scala 37:30]
  reg  cmdbuf_write; // @[Reg.scala 27:20]
  wire  _T_37 = ~cmdbuf_write; // @[ahb_to_axi4.scala 142:41]
  wire  _T_38 = io_axi_rvalid & _T_37; // @[ahb_to_axi4.scala 142:39]
  wire  _T_40 = |io_axi_rresp; // @[ahb_to_axi4.scala 144:64]
  wire  _GEN_1 = _T_36 & _T_38; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_29 ? _T_21 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_11 ? _T_21 : _GEN_5; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_6 ? _T_10 : _GEN_10; // @[Conditional.scala 40:58]
  wire  _T_41 = buf_state_en & _T_40; // @[ahb_to_axi4.scala 144:43]
  wire  _GEN_2 = _T_36 & buf_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_36 & _T_41; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_29 & _T_35; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_29 ? 1'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_11 ? _T_28 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_11 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  cmdbuf_wr_en = _T_6 ? 1'h0 : _GEN_11; // @[Conditional.scala 40:58]
  wire  buf_rdata_en = _T_6 ? 1'h0 : _GEN_12; // @[Conditional.scala 40:58]
  reg [2:0] ahb_hsize_q; // @[ahb_to_axi4.scala 176:67]
  wire  _T_45 = ahb_hsize_q == 3'h0; // @[ahb_to_axi4.scala 149:62]
  wire [7:0] _T_47 = _T_45 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_49 = 8'h1 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 149:80]
  wire [7:0] _T_50 = _T_47 & _T_49; // @[ahb_to_axi4.scala 149:72]
  wire  _T_52 = ahb_hsize_q == 3'h1; // @[ahb_to_axi4.scala 150:62]
  wire [7:0] _T_54 = _T_52 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _T_56 = 9'h3 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 150:80]
  wire [8:0] _GEN_23 = {{1'd0}, _T_54}; // @[ahb_to_axi4.scala 150:72]
  wire [8:0] _T_57 = _GEN_23 & _T_56; // @[ahb_to_axi4.scala 150:72]
  wire [8:0] _GEN_24 = {{1'd0}, _T_50}; // @[ahb_to_axi4.scala 149:111]
  wire [8:0] _T_58 = _GEN_24 | _T_57; // @[ahb_to_axi4.scala 149:111]
  wire  _T_60 = ahb_hsize_q == 3'h2; // @[ahb_to_axi4.scala 151:62]
  wire [7:0] _T_62 = _T_60 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _T_64 = 11'hf << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 151:80]
  wire [10:0] _GEN_25 = {{3'd0}, _T_62}; // @[ahb_to_axi4.scala 151:72]
  wire [10:0] _T_65 = _GEN_25 & _T_64; // @[ahb_to_axi4.scala 151:72]
  wire [10:0] _GEN_26 = {{2'd0}, _T_58}; // @[ahb_to_axi4.scala 150:111]
  wire [10:0] _T_66 = _GEN_26 | _T_65; // @[ahb_to_axi4.scala 150:111]
  wire  _T_68 = ahb_hsize_q == 3'h3; // @[ahb_to_axi4.scala 152:62]
  wire [7:0] _T_70 = _T_68 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _GEN_27 = {{3'd0}, _T_70}; // @[ahb_to_axi4.scala 151:111]
  wire [10:0] _T_72 = _T_66 | _GEN_27; // @[ahb_to_axi4.scala 151:111]
  reg  ahb_hready_q; // @[ahb_to_axi4.scala 174:62]
  wire  _T_73 = ~ahb_hready_q; // @[ahb_to_axi4.scala 155:68]
  reg  ahb_hresp_q; // @[ahb_to_axi4.scala 173:62]
  wire  _T_74 = ahb_hresp_q & _T_73; // @[ahb_to_axi4.scala 155:66]
  wire  _T_76 = buf_state == 2'h0; // @[ahb_to_axi4.scala 155:112]
  wire  _T_77 = _T_20 | _T_76; // @[ahb_to_axi4.scala 155:99]
  wire  _T_78 = buf_state == 2'h2; // @[ahb_to_axi4.scala 155:137]
  wire  _T_79 = buf_state == 2'h3; // @[ahb_to_axi4.scala 155:156]
  wire  _T_80 = _T_78 | _T_79; // @[ahb_to_axi4.scala 155:144]
  wire  _T_81 = ~_T_80; // @[ahb_to_axi4.scala 155:125]
  wire  _T_82 = _T_77 & _T_81; // @[ahb_to_axi4.scala 155:123]
  reg  buf_read_error; // @[ahb_to_axi4.scala 170:62]
  wire  _T_83 = ~buf_read_error; // @[ahb_to_axi4.scala 155:169]
  wire  _T_84 = _T_82 & _T_83; // @[ahb_to_axi4.scala 155:167]
  wire [1:0] _T_88 = io_ahb_hsel ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  buf_rdata_clk = rvclkhdr_2_io_l1clk; // @[ahb_to_axi4.scala 86:35 ahb_to_axi4.scala 186:33]
  reg [63:0] buf_rdata; // @[ahb_to_axi4.scala 169:68]
  reg [1:0] ahb_htrans_q; // @[ahb_to_axi4.scala 175:62]
  wire  _T_93 = ahb_htrans_q != 2'h0; // @[ahb_to_axi4.scala 159:56]
  wire  _T_94 = buf_state != 2'h0; // @[ahb_to_axi4.scala 159:78]
  wire  _T_95 = _T_93 & _T_94; // @[ahb_to_axi4.scala 159:65]
  wire  _T_97 = ~ahb_addr_in_dccm; // @[ahb_to_axi4.scala 160:38]
  reg  ahb_hwrite_q; // @[ahb_to_axi4.scala 177:67]
  wire  _T_98 = ahb_addr_in_dccm & ahb_hwrite_q; // @[ahb_to_axi4.scala 161:75]
  wire  _T_101 = ahb_hsize_q[1:0] == 2'h2; // @[ahb_to_axi4.scala 161:115]
  wire  _T_103 = ahb_hsize_q[1:0] == 2'h3; // @[ahb_to_axi4.scala 161:144]
  wire  _T_104 = _T_101 | _T_103; // @[ahb_to_axi4.scala 161:124]
  wire  _T_105 = ~_T_104; // @[ahb_to_axi4.scala 161:95]
  wire  _T_106 = _T_98 & _T_105; // @[ahb_to_axi4.scala 161:93]
  wire  _T_107 = _T_97 | _T_106; // @[ahb_to_axi4.scala 160:78]
  wire  _T_111 = _T_52 & ahb_haddr_q[0]; // @[ahb_to_axi4.scala 162:64]
  wire  _T_112 = _T_107 | _T_111; // @[ahb_to_axi4.scala 161:155]
  wire  _T_116 = |ahb_haddr_q[1:0]; // @[ahb_to_axi4.scala 163:85]
  wire  _T_117 = _T_60 & _T_116; // @[ahb_to_axi4.scala 163:64]
  wire  _T_118 = _T_112 | _T_117; // @[ahb_to_axi4.scala 162:84]
  wire  _T_122 = |ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 164:85]
  wire  _T_123 = _T_68 & _T_122; // @[ahb_to_axi4.scala 164:64]
  wire  _T_124 = _T_118 | _T_123; // @[ahb_to_axi4.scala 163:90]
  wire  _T_125 = _T_95 & _T_124; // @[ahb_to_axi4.scala 159:89]
  wire  _T_126 = _T_125 | buf_read_error; // @[ahb_to_axi4.scala 164:92]
  wire  _T_145 = ~cmdbuf_wr_en; // @[ahb_to_axi4.scala 188:111]
  wire  _T_146 = _T_152 & _T_145; // @[ahb_to_axi4.scala 188:109]
  wire  _T_148 = io_ahb_hresp & _T_37; // @[ahb_to_axi4.scala 188:142]
  wire  cmdbuf_rst = _T_146 | _T_148; // @[ahb_to_axi4.scala 188:126]
  wire  _T_156 = cmdbuf_wr_en | cmdbuf_vld; // @[ahb_to_axi4.scala 191:68]
  wire  _T_157 = ~cmdbuf_rst; // @[ahb_to_axi4.scala 191:112]
  reg [2:0] _T_163; // @[Reg.scala 27:20]
  reg [7:0] cmdbuf_wstrb; // @[Reg.scala 27:20]
  wire [7:0] master_wstrb = _T_72[7:0]; // @[ahb_to_axi4.scala 149:33]
  reg [31:0] cmdbuf_addr; // @[el2_lib.scala 514:16]
  reg [63:0] cmdbuf_wdata; // @[el2_lib.scala 514:16]
  wire [1:0] cmdbuf_size = _T_163[1:0]; // @[ahb_to_axi4.scala 197:33]
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
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  assign io_axi_awvalid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 208:29]
  assign io_axi_awaddr = cmdbuf_addr; // @[ahb_to_axi4.scala 210:29]
  assign io_axi_awsize = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 211:29]
  assign io_axi_awprot = 3'h0; // @[ahb_to_axi4.scala 212:29]
  assign io_axi_awlen = 8'h0; // @[ahb_to_axi4.scala 213:29]
  assign io_axi_awburst = 2'h1; // @[ahb_to_axi4.scala 214:29]
  assign io_axi_wvalid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 216:29]
  assign io_axi_wdata = cmdbuf_wdata; // @[ahb_to_axi4.scala 217:29]
  assign io_axi_wstrb = cmdbuf_wstrb; // @[ahb_to_axi4.scala 218:29]
  assign io_axi_wlast = 1'h1; // @[ahb_to_axi4.scala 219:29]
  assign io_axi_bready = 1'h1; // @[ahb_to_axi4.scala 221:29]
  assign io_axi_arvalid = cmdbuf_vld & _T_37; // @[ahb_to_axi4.scala 223:29]
  assign io_axi_araddr = cmdbuf_addr; // @[ahb_to_axi4.scala 225:29]
  assign io_axi_arsize = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 226:29]
  assign io_axi_arprot = 3'h0; // @[ahb_to_axi4.scala 227:29]
  assign io_axi_arlen = 8'h0; // @[ahb_to_axi4.scala 228:29]
  assign io_axi_arburst = 2'h1; // @[ahb_to_axi4.scala 229:29]
  assign io_axi_rready = 1'h1; // @[ahb_to_axi4.scala 231:29]
  assign io_ahb_hrdata = buf_rdata; // @[ahb_to_axi4.scala 158:33]
  assign io_ahb_hreadyout = io_ahb_hresp ? _T_74 : _T_84; // @[ahb_to_axi4.scala 155:33]
  assign io_ahb_hresp = _T_126 | _T_74; // @[ahb_to_axi4.scala 159:33]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_9; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_2_io_en = io_bus_clk_en & buf_rdata_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_3_io_clk = rvclkhdr_5_io_l1clk; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = _T_6 ? 1'h0 : _GEN_11; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = rvclkhdr_5_io_l1clk; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = _T_6 ? 1'h0 : _GEN_11; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_5_io_en = io_bus_clk_en; // @[el2_lib.scala 485:16]
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
  ahb_haddr_q = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  buf_state = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  cmdbuf_vld = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cmdbuf_write = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ahb_hsize_q = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  ahb_hready_q = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ahb_hresp_q = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  buf_read_error = _RAND_7[0:0];
  _RAND_8 = {2{`RANDOM}};
  buf_rdata = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  ahb_htrans_q = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  ahb_hwrite_q = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_163 = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  cmdbuf_wstrb = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  cmdbuf_addr = _RAND_13[31:0];
  _RAND_14 = {2{`RANDOM}};
  cmdbuf_wdata = _RAND_14[63:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ahb_haddr_q = 32'h0;
  end
  if (reset) begin
    buf_state = 2'h0;
  end
  if (reset) begin
    cmdbuf_vld = 1'h0;
  end
  if (reset) begin
    cmdbuf_write = 1'h0;
  end
  if (reset) begin
    ahb_hsize_q = 3'h0;
  end
  if (reset) begin
    ahb_hready_q = 1'h0;
  end
  if (reset) begin
    ahb_hresp_q = 1'h0;
  end
  if (reset) begin
    buf_read_error = 1'h0;
  end
  if (reset) begin
    buf_rdata = 64'h0;
  end
  if (reset) begin
    ahb_htrans_q = 2'h0;
  end
  if (reset) begin
    ahb_hwrite_q = 1'h0;
  end
  if (reset) begin
    _T_163 = 3'h0;
  end
  if (reset) begin
    cmdbuf_wstrb = 8'h0;
  end
  if (reset) begin
    cmdbuf_addr = 32'h0;
  end
  if (reset) begin
    cmdbuf_wdata = 64'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge ahb_addr_clk or posedge reset) begin
    if (reset) begin
      ahb_haddr_q <= 32'h0;
    end else begin
      ahb_haddr_q <= io_ahb_haddr;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      buf_state <= 2'h0;
    end else if (buf_state_en) begin
      if (_T_6) begin
        if (io_ahb_hwrite) begin
          buf_state <= 2'h1;
        end else begin
          buf_state <= 2'h2;
        end
      end else if (_T_11) begin
        if (_T_16) begin
          buf_state <= 2'h0;
        end else if (io_ahb_hwrite) begin
          buf_state <= 2'h1;
        end else begin
          buf_state <= 2'h2;
        end
      end else if (_T_29) begin
        if (io_ahb_hresp) begin
          buf_state <= 2'h0;
        end else begin
          buf_state <= 2'h3;
        end
      end else begin
        buf_state <= 2'h0;
      end
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      cmdbuf_vld <= 1'h0;
    end else begin
      cmdbuf_vld <= _T_156 & _T_157;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      cmdbuf_write <= 1'h0;
    end else if (cmdbuf_wr_en) begin
      cmdbuf_write <= ahb_hwrite_q;
    end
  end
  always @(posedge ahb_addr_clk or posedge reset) begin
    if (reset) begin
      ahb_hsize_q <= 3'h0;
    end else begin
      ahb_hsize_q <= io_ahb_hsize;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      ahb_hready_q <= 1'h0;
    end else begin
      ahb_hready_q <= io_ahb_hreadyout & io_ahb_hreadyin;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      ahb_hresp_q <= 1'h0;
    end else begin
      ahb_hresp_q <= io_ahb_hresp;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      buf_read_error <= 1'h0;
    end else if (_T_6) begin
      buf_read_error <= 1'h0;
    end else if (_T_11) begin
      buf_read_error <= 1'h0;
    end else if (_T_29) begin
      buf_read_error <= 1'h0;
    end else begin
      buf_read_error <= _GEN_3;
    end
  end
  always @(posedge buf_rdata_clk or posedge reset) begin
    if (reset) begin
      buf_rdata <= 64'h0;
    end else begin
      buf_rdata <= io_axi_rdata;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      ahb_htrans_q <= 2'h0;
    end else begin
      ahb_htrans_q <= _T_88 & io_ahb_htrans;
    end
  end
  always @(posedge ahb_addr_clk or posedge reset) begin
    if (reset) begin
      ahb_hwrite_q <= 1'h0;
    end else begin
      ahb_hwrite_q <= io_ahb_hwrite;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      _T_163 <= 3'h0;
    end else if (cmdbuf_wr_en) begin
      _T_163 <= ahb_hsize_q;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      cmdbuf_wstrb <= 8'h0;
    end else if (cmdbuf_wr_en) begin
      cmdbuf_wstrb <= master_wstrb;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      cmdbuf_addr <= 32'h0;
    end else begin
      cmdbuf_addr <= ahb_haddr_q;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      cmdbuf_wdata <= 64'h0;
    end else begin
      cmdbuf_wdata <= io_ahb_hwdata;
    end
  end
endmodule
