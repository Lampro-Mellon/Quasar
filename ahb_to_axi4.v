module rvclkhdr(
  input   io_clk,
  input   io_en
);
  wire  clkhdr_Q; // @[lib.scala 334:26]
  wire  clkhdr_CK; // @[lib.scala 334:26]
  wire  clkhdr_EN; // @[lib.scala 334:26]
  wire  clkhdr_SE; // @[lib.scala 334:26]
  gated_latch clkhdr ( // @[lib.scala 334:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module ahb_to_axi4(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_bus_clk_en,
  input         io_clk_override,
  input         io_axi_aw_ready,
  output        io_axi_aw_valid,
  output        io_axi_aw_bits_id,
  output [31:0] io_axi_aw_bits_addr,
  output [3:0]  io_axi_aw_bits_region,
  output [7:0]  io_axi_aw_bits_len,
  output [2:0]  io_axi_aw_bits_size,
  output [1:0]  io_axi_aw_bits_burst,
  output        io_axi_aw_bits_lock,
  output [3:0]  io_axi_aw_bits_cache,
  output [2:0]  io_axi_aw_bits_prot,
  output [3:0]  io_axi_aw_bits_qos,
  input         io_axi_w_ready,
  output        io_axi_w_valid,
  output [63:0] io_axi_w_bits_data,
  output [7:0]  io_axi_w_bits_strb,
  output        io_axi_w_bits_last,
  output        io_axi_b_ready,
  input         io_axi_b_valid,
  input  [1:0]  io_axi_b_bits_resp,
  input         io_axi_b_bits_id,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output        io_axi_ar_bits_id,
  output [31:0] io_axi_ar_bits_addr,
  output [3:0]  io_axi_ar_bits_region,
  output [7:0]  io_axi_ar_bits_len,
  output [2:0]  io_axi_ar_bits_size,
  output [1:0]  io_axi_ar_bits_burst,
  output        io_axi_ar_bits_lock,
  output [3:0]  io_axi_ar_bits_cache,
  output [2:0]  io_axi_ar_bits_prot,
  output [3:0]  io_axi_ar_bits_qos,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input         io_axi_r_bits_id,
  input  [63:0] io_axi_r_bits_data,
  input  [1:0]  io_axi_r_bits_resp,
  input         io_axi_r_bits_last,
  output [63:0] io_ahb_sig_in_hrdata,
  output        io_ahb_sig_in_hready,
  output        io_ahb_sig_in_hresp,
  input  [31:0] io_ahb_sig_out_haddr,
  input  [2:0]  io_ahb_sig_out_hburst,
  input         io_ahb_sig_out_hmastlock,
  input  [3:0]  io_ahb_sig_out_hprot,
  input  [2:0]  io_ahb_sig_out_hsize,
  input  [1:0]  io_ahb_sig_out_htrans,
  input         io_ahb_sig_out_hwrite,
  input  [63:0] io_ahb_sig_out_hwdata,
  input         io_ahb_hsel,
  input         io_ahb_hreadyin
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 399:23]
  wire  ahb_hready = io_ahb_sig_in_hready & io_ahb_hreadyin; // @[ahb_to_axi4.scala 27:50]
  wire [1:0] _T_2 = io_ahb_hsel ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ahb_htrans_in = _T_2 & io_ahb_sig_out_htrans; // @[ahb_to_axi4.scala 28:49]
  wire  _T_5 = ahb_hready & io_ahb_sig_out_htrans[1]; // @[ahb_to_axi4.scala 36:57]
  wire  ahb_addr_clk_en = io_bus_clk_en & _T_5; // @[ahb_to_axi4.scala 36:43]
  reg [1:0] buf_state; // @[Reg.scala 27:20]
  wire  _T_44 = 2'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_49 = 2'h1 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_67 = 2'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_74 = 2'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_48 = _T_5 & io_ahb_hsel; // @[ahb_to_axi4.scala 85:61]
  reg  cmdbuf_vld; // @[Reg.scala 27:20]
  wire  _T_25 = io_axi_aw_valid & io_axi_aw_ready; // @[ahb_to_axi4.scala 63:58]
  wire  _T_26 = io_axi_ar_valid & io_axi_ar_ready; // @[ahb_to_axi4.scala 63:96]
  wire  _T_27 = _T_25 | _T_26; // @[ahb_to_axi4.scala 63:77]
  wire  _T_28 = ~_T_27; // @[ahb_to_axi4.scala 63:39]
  wire  cmdbuf_full = cmdbuf_vld & _T_28; // @[ahb_to_axi4.scala 63:37]
  wire  _T_58 = ~cmdbuf_full; // @[ahb_to_axi4.scala 89:24]
  wire  _T_59 = _T_58 | io_ahb_sig_in_hresp; // @[ahb_to_axi4.scala 89:37]
  reg  cmdbuf_write; // @[Reg.scala 27:20]
  wire  _T_75 = ~cmdbuf_write; // @[ahb_to_axi4.scala 99:40]
  wire  _T_76 = io_axi_r_valid & _T_75; // @[ahb_to_axi4.scala 99:38]
  wire  _GEN_15 = _T_74 & _T_76; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_67 ? _T_59 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_49 ? _T_59 : _GEN_19; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_44 ? _T_48 : _GEN_24; // @[Conditional.scala 40:58]
  wire  _GEN_16 = _T_74 & buf_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_67 ? 1'h0 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_49 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire  buf_rdata_en = _T_44 ? 1'h0 : _GEN_26; // @[Conditional.scala 40:58]
  wire  buf_rdata_clk_en = io_bus_clk_en & buf_rdata_en; // @[ahb_to_axi4.scala 37:43]
  reg  buf_read_error; // @[Reg.scala 27:20]
  wire  _T_78 = |io_axi_r_bits_resp; // @[ahb_to_axi4.scala 101:68]
  wire  _T_79 = buf_state_en & _T_78; // @[ahb_to_axi4.scala 101:41]
  wire  _GEN_17 = _T_74 & _T_79; // @[Conditional.scala 39:67]
  reg [63:0] buf_rdata; // @[Reg.scala 27:20]
  reg  ahb_hresp_q; // @[Reg.scala 27:20]
  reg [2:0] ahb_hsize_q; // @[Reg.scala 27:20]
  reg  ahb_hwrite_q; // @[Reg.scala 27:20]
  reg [31:0] ahb_haddr_q; // @[Reg.scala 27:20]
  reg  ahb_hready_q; // @[Reg.scala 27:20]
  reg [1:0] ahb_htrans_q; // @[Reg.scala 27:20]
  wire  _T_62 = io_ahb_sig_out_htrans == 2'h1; // @[ahb_to_axi4.scala 90:92]
  wire  _T_63 = _T_62 & io_ahb_hsel; // @[ahb_to_axi4.scala 90:110]
  wire  _T_64 = io_ahb_sig_in_hresp | _T_63; // @[ahb_to_axi4.scala 90:60]
  wire  _T_65 = ~_T_64; // @[ahb_to_axi4.scala 90:38]
  wire  _T_66 = _T_58 & _T_65; // @[ahb_to_axi4.scala 90:36]
  wire  _T_71 = ~io_ahb_sig_in_hresp; // @[ahb_to_axi4.scala 95:23]
  wire  _T_73 = _T_71 & _T_58; // @[ahb_to_axi4.scala 95:44]
  wire  _GEN_20 = _T_67 & _T_73; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_49 ? _T_66 : _GEN_20; // @[Conditional.scala 39:67]
  wire  cmdbuf_wr_en = _T_44 ? 1'h0 : _GEN_25; // @[Conditional.scala 40:58]
  wire  _T_10 = io_bus_clk_en & cmdbuf_wr_en; // @[lib.scala 383:57]
  wire  _T_14 = ~cmdbuf_wr_en; // @[ahb_to_axi4.scala 61:104]
  wire  _T_15 = _T_27 & _T_14; // @[ahb_to_axi4.scala 61:102]
  wire  _T_17 = io_ahb_sig_in_hresp & _T_75; // @[ahb_to_axi4.scala 61:142]
  wire  cmdbuf_rst = _T_15 | _T_17; // @[ahb_to_axi4.scala 61:119]
  wire  _T_19 = ~cmdbuf_rst; // @[lib.scala 391:73]
  wire  _T_21 = cmdbuf_wr_en | cmdbuf_rst; // @[lib.scala 391:92]
  wire  _T_22 = _T_21 & io_bus_clk_en; // @[lib.scala 391:99]
  reg [1:0] cmdbuf_size; // @[Reg.scala 27:20]
  reg [7:0] cmdbuf_wstrb; // @[Reg.scala 27:20]
  wire  _T_84 = ahb_hsize_q == 3'h0; // @[ahb_to_axi4.scala 106:60]
  wire [7:0] _T_86 = _T_84 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_88 = 8'h1 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 106:78]
  wire [7:0] _T_89 = _T_86 & _T_88; // @[ahb_to_axi4.scala 106:70]
  wire  _T_91 = ahb_hsize_q == 3'h1; // @[ahb_to_axi4.scala 107:30]
  wire [7:0] _T_93 = _T_91 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _T_95 = 9'h3 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 107:48]
  wire [8:0] _GEN_34 = {{1'd0}, _T_93}; // @[ahb_to_axi4.scala 107:40]
  wire [8:0] _T_96 = _GEN_34 & _T_95; // @[ahb_to_axi4.scala 107:40]
  wire [8:0] _GEN_35 = {{1'd0}, _T_89}; // @[ahb_to_axi4.scala 106:109]
  wire [8:0] _T_97 = _GEN_35 | _T_96; // @[ahb_to_axi4.scala 106:109]
  wire  _T_99 = ahb_hsize_q == 3'h2; // @[ahb_to_axi4.scala 108:30]
  wire [7:0] _T_101 = _T_99 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _T_103 = 11'hf << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 108:48]
  wire [10:0] _GEN_36 = {{3'd0}, _T_101}; // @[ahb_to_axi4.scala 108:40]
  wire [10:0] _T_104 = _GEN_36 & _T_103; // @[ahb_to_axi4.scala 108:40]
  wire [10:0] _GEN_37 = {{2'd0}, _T_97}; // @[ahb_to_axi4.scala 107:79]
  wire [10:0] _T_105 = _GEN_37 | _T_104; // @[ahb_to_axi4.scala 107:79]
  wire  _T_107 = ahb_hsize_q == 3'h3; // @[ahb_to_axi4.scala 109:30]
  wire [7:0] _T_109 = _T_107 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _GEN_38 = {{3'd0}, _T_109}; // @[ahb_to_axi4.scala 108:79]
  wire [10:0] _T_111 = _T_105 | _GEN_38; // @[ahb_to_axi4.scala 108:79]
  wire [7:0] master_wstrb = _T_111[7:0]; // @[ahb_to_axi4.scala 106:31]
  wire  _T_35 = cmdbuf_wr_en & io_bus_clk_en; // @[ahb_to_axi4.scala 66:66]
  reg [31:0] cmdbuf_addr; // @[Reg.scala 27:20]
  reg [63:0] cmdbuf_wdata; // @[Reg.scala 27:20]
  wire  ahb_addr_in_dccm = ahb_haddr_q[31:16] == 16'hf004; // @[lib.scala 87:29]
  wire  ahb_addr_in_iccm = ahb_haddr_q[31:16] == 16'hee00; // @[lib.scala 87:29]
  wire  _T_51 = io_ahb_sig_out_htrans == 2'h0; // @[ahb_to_axi4.scala 88:79]
  wire  _T_52 = io_ahb_sig_in_hresp | _T_51; // @[ahb_to_axi4.scala 88:48]
  wire  _T_53 = ~io_ahb_hsel; // @[ahb_to_axi4.scala 88:93]
  wire  _T_54 = _T_52 | _T_53; // @[ahb_to_axi4.scala 88:91]
  wire  _T_81 = io_bus_clk_en & buf_state_en; // @[lib.scala 383:57]
  wire  _T_112 = ~ahb_hready_q; // @[ahb_to_axi4.scala 112:80]
  wire  _T_113 = ahb_hresp_q & _T_112; // @[ahb_to_axi4.scala 112:78]
  wire  _T_115 = buf_state == 2'h0; // @[ahb_to_axi4.scala 112:124]
  wire  _T_116 = _T_58 | _T_115; // @[ahb_to_axi4.scala 112:111]
  wire  _T_117 = buf_state == 2'h2; // @[ahb_to_axi4.scala 112:149]
  wire  _T_118 = buf_state == 2'h3; // @[ahb_to_axi4.scala 112:168]
  wire  _T_119 = _T_117 | _T_118; // @[ahb_to_axi4.scala 112:156]
  wire  _T_120 = ~_T_119; // @[ahb_to_axi4.scala 112:137]
  wire  _T_121 = _T_116 & _T_120; // @[ahb_to_axi4.scala 112:135]
  wire  _T_122 = ~buf_read_error; // @[ahb_to_axi4.scala 112:181]
  wire  _T_123 = _T_121 & _T_122; // @[ahb_to_axi4.scala 112:179]
  wire  _T_127 = ahb_htrans_q != 2'h0; // @[ahb_to_axi4.scala 114:61]
  wire  _T_128 = buf_state != 2'h0; // @[ahb_to_axi4.scala 114:83]
  wire  _T_129 = _T_127 & _T_128; // @[ahb_to_axi4.scala 114:70]
  wire  _T_130 = ahb_addr_in_dccm | ahb_addr_in_iccm; // @[ahb_to_axi4.scala 115:26]
  wire  _T_131 = ~_T_130; // @[ahb_to_axi4.scala 115:7]
  wire  _T_132 = ahb_addr_in_dccm & ahb_hwrite_q; // @[ahb_to_axi4.scala 116:46]
  wire  _T_133 = ahb_addr_in_iccm | _T_132; // @[ahb_to_axi4.scala 116:26]
  wire  _T_135 = ahb_hsize_q[1:0] == 2'h2; // @[ahb_to_axi4.scala 116:86]
  wire  _T_137 = ahb_hsize_q[1:0] == 2'h3; // @[ahb_to_axi4.scala 116:115]
  wire  _T_138 = _T_135 | _T_137; // @[ahb_to_axi4.scala 116:95]
  wire  _T_139 = ~_T_138; // @[ahb_to_axi4.scala 116:66]
  wire  _T_140 = _T_133 & _T_139; // @[ahb_to_axi4.scala 116:64]
  wire  _T_141 = _T_131 | _T_140; // @[ahb_to_axi4.scala 115:47]
  wire  _T_145 = _T_91 & ahb_haddr_q[0]; // @[ahb_to_axi4.scala 117:35]
  wire  _T_146 = _T_141 | _T_145; // @[ahb_to_axi4.scala 116:126]
  wire  _T_150 = |ahb_haddr_q[1:0]; // @[ahb_to_axi4.scala 118:56]
  wire  _T_151 = _T_99 & _T_150; // @[ahb_to_axi4.scala 118:35]
  wire  _T_152 = _T_146 | _T_151; // @[ahb_to_axi4.scala 117:55]
  wire  _T_156 = |ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 119:56]
  wire  _T_157 = _T_107 & _T_156; // @[ahb_to_axi4.scala 119:35]
  wire  _T_158 = _T_152 | _T_157; // @[ahb_to_axi4.scala 118:61]
  wire  _T_159 = _T_129 & _T_158; // @[ahb_to_axi4.scala 114:94]
  wire  _T_160 = _T_159 | buf_read_error; // @[ahb_to_axi4.scala 119:63]
  rvclkhdr rvclkhdr ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  assign io_axi_aw_valid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 124:33]
  assign io_axi_aw_bits_id = 1'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 125:33]
  assign io_axi_aw_bits_addr = cmdbuf_addr; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 126:33]
  assign io_axi_aw_bits_region = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_len = 8'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 129:33]
  assign io_axi_aw_bits_size = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 127:33]
  assign io_axi_aw_bits_burst = 2'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 130:33]
  assign io_axi_aw_bits_lock = 1'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_cache = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_prot = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 128:33]
  assign io_axi_aw_bits_qos = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_w_valid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 132:33]
  assign io_axi_w_bits_data = cmdbuf_wdata; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 133:33]
  assign io_axi_w_bits_strb = cmdbuf_wstrb; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 134:33]
  assign io_axi_w_bits_last = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 135:33]
  assign io_axi_b_ready = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 137:33]
  assign io_axi_ar_valid = cmdbuf_vld & _T_75; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 139:33]
  assign io_axi_ar_bits_id = 1'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 140:33]
  assign io_axi_ar_bits_addr = cmdbuf_addr; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 141:33]
  assign io_axi_ar_bits_region = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_len = 8'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 144:33]
  assign io_axi_ar_bits_size = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 142:33]
  assign io_axi_ar_bits_burst = 2'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 145:33]
  assign io_axi_ar_bits_lock = 1'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_cache = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_prot = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 143:33]
  assign io_axi_ar_bits_qos = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_r_ready = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 147:28]
  assign io_ahb_sig_in_hrdata = buf_rdata; // @[ahb_to_axi4.scala 113:38]
  assign io_ahb_sig_in_hready = io_ahb_sig_in_hresp ? _T_113 : _T_123; // @[ahb_to_axi4.scala 112:38]
  assign io_ahb_sig_in_hresp = _T_160 | _T_113; // @[ahb_to_axi4.scala 114:38]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_io_en = cmdbuf_wr_en & io_bus_clk_en; // @[lib.scala 402:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_1_io_en = cmdbuf_wr_en & io_bus_clk_en; // @[lib.scala 402:17]
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
  buf_state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  cmdbuf_vld = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cmdbuf_write = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  buf_read_error = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  buf_rdata = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  ahb_hresp_q = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ahb_hsize_q = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  ahb_hwrite_q = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ahb_haddr_q = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  ahb_hready_q = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ahb_htrans_q = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  cmdbuf_size = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  cmdbuf_wstrb = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  cmdbuf_addr = _RAND_13[31:0];
  _RAND_14 = {2{`RANDOM}};
  cmdbuf_wdata = _RAND_14[63:0];
`endif // RANDOMIZE_REG_INIT
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
    buf_read_error = 1'h0;
  end
  if (reset) begin
    buf_rdata = 64'h0;
  end
  if (reset) begin
    ahb_hresp_q = 1'h0;
  end
  if (reset) begin
    ahb_hsize_q = 3'h0;
  end
  if (reset) begin
    ahb_hwrite_q = 1'h0;
  end
  if (reset) begin
    ahb_haddr_q = 32'h0;
  end
  if (reset) begin
    ahb_hready_q = 1'h0;
  end
  if (reset) begin
    ahb_htrans_q = 2'h0;
  end
  if (reset) begin
    cmdbuf_size = 2'h0;
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_state <= 2'h0;
    end else if (_T_81) begin
      if (_T_44) begin
        if (io_ahb_sig_out_hwrite) begin
          buf_state <= 2'h1;
        end else begin
          buf_state <= 2'h2;
        end
      end else if (_T_49) begin
        if (_T_54) begin
          buf_state <= 2'h0;
        end else if (io_ahb_sig_out_hwrite) begin
          buf_state <= 2'h1;
        end else begin
          buf_state <= 2'h2;
        end
      end else if (_T_67) begin
        if (io_ahb_sig_in_hresp) begin
          buf_state <= 2'h0;
        end else begin
          buf_state <= 2'h3;
        end
      end else begin
        buf_state <= 2'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_vld <= 1'h0;
    end else if (_T_22) begin
      cmdbuf_vld <= _T_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_write <= 1'h0;
    end else if (_T_10) begin
      cmdbuf_write <= ahb_hwrite_q;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_read_error <= 1'h0;
    end else if (io_bus_clk_en) begin
      if (_T_44) begin
        buf_read_error <= 1'h0;
      end else if (_T_49) begin
        buf_read_error <= 1'h0;
      end else if (_T_67) begin
        buf_read_error <= 1'h0;
      end else begin
        buf_read_error <= _GEN_17;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_rdata <= 64'h0;
    end else if (buf_rdata_clk_en) begin
      buf_rdata <= io_axi_r_bits_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hresp_q <= 1'h0;
    end else if (io_bus_clk_en) begin
      ahb_hresp_q <= io_ahb_sig_in_hresp;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hsize_q <= 3'h0;
    end else if (ahb_addr_clk_en) begin
      ahb_hsize_q <= io_ahb_sig_out_hsize;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hwrite_q <= 1'h0;
    end else if (ahb_addr_clk_en) begin
      ahb_hwrite_q <= io_ahb_sig_out_hwrite;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_haddr_q <= 32'h0;
    end else if (ahb_addr_clk_en) begin
      ahb_haddr_q <= io_ahb_sig_out_haddr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hready_q <= 1'h0;
    end else if (io_bus_clk_en) begin
      ahb_hready_q <= ahb_hready;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_htrans_q <= 2'h0;
    end else if (io_bus_clk_en) begin
      ahb_htrans_q <= ahb_htrans_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_size <= 2'h0;
    end else if (_T_10) begin
      cmdbuf_size <= ahb_hsize_q[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_wstrb <= 8'h0;
    end else if (_T_10) begin
      cmdbuf_wstrb <= master_wstrb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_addr <= 32'h0;
    end else if (_T_35) begin
      cmdbuf_addr <= ahb_haddr_q;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_wdata <= 64'h0;
    end else if (_T_35) begin
      cmdbuf_wdata <= io_ahb_sig_out_hwdata;
    end
  end
endmodule
