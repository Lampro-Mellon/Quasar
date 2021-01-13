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
  wire  rvclkhdr_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 399:23]
  reg [31:0] ahb_haddr_q; // @[Reg.scala 27:20]
  wire  ahb_addr_in_dccm = ahb_haddr_q[31:16] == 16'hf004; // @[lib.scala 87:29]
  wire  ahb_addr_in_iccm = ahb_haddr_q[31:16] == 16'hee00; // @[lib.scala 87:29]
  reg [1:0] buf_state; // @[Reg.scala 27:20]
  wire  _T_7 = 2'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  ahb_hready = io_ahb_sig_in_hready & io_ahb_hreadyin; // @[ahb_to_axi4.scala 103:55]
  wire  _T_10 = ahb_hready & io_ahb_sig_out_htrans[1]; // @[ahb_to_axi4.scala 75:34]
  wire  _T_11 = _T_10 & io_ahb_hsel; // @[ahb_to_axi4.scala 75:61]
  wire  _T_12 = 2'h1 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_14 = io_ahb_sig_out_htrans == 2'h0; // @[ahb_to_axi4.scala 78:79]
  wire  _T_15 = io_ahb_sig_in_hresp | _T_14; // @[ahb_to_axi4.scala 78:48]
  wire  _T_16 = ~io_ahb_hsel; // @[ahb_to_axi4.scala 78:93]
  wire  _T_17 = _T_15 | _T_16; // @[ahb_to_axi4.scala 78:91]
  reg  cmdbuf_vld; // @[Reg.scala 27:20]
  wire  _T_155 = io_axi_aw_valid & io_axi_aw_ready; // @[ahb_to_axi4.scala 142:67]
  wire  _T_156 = io_axi_ar_valid & io_axi_ar_ready; // @[ahb_to_axi4.scala 142:105]
  wire  _T_157 = _T_155 | _T_156; // @[ahb_to_axi4.scala 142:86]
  wire  _T_158 = ~_T_157; // @[ahb_to_axi4.scala 142:48]
  wire  cmdbuf_full = cmdbuf_vld & _T_158; // @[ahb_to_axi4.scala 142:46]
  wire  _T_21 = ~cmdbuf_full; // @[ahb_to_axi4.scala 79:24]
  wire  _T_22 = _T_21 | io_ahb_sig_in_hresp; // @[ahb_to_axi4.scala 79:37]
  wire  _T_25 = io_ahb_sig_out_htrans == 2'h1; // @[ahb_to_axi4.scala 80:92]
  wire  _T_26 = _T_25 & io_ahb_hsel; // @[ahb_to_axi4.scala 80:110]
  wire  _T_27 = io_ahb_sig_in_hresp | _T_26; // @[ahb_to_axi4.scala 80:60]
  wire  _T_28 = ~_T_27; // @[ahb_to_axi4.scala 80:38]
  wire  _T_29 = _T_21 & _T_28; // @[ahb_to_axi4.scala 80:36]
  wire  _T_30 = 2'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_34 = ~io_ahb_sig_in_hresp; // @[ahb_to_axi4.scala 85:23]
  wire  _T_36 = _T_34 & _T_21; // @[ahb_to_axi4.scala 85:44]
  wire  _T_37 = 2'h3 == buf_state; // @[Conditional.scala 37:30]
  reg  cmdbuf_write; // @[Reg.scala 27:20]
  wire  _T_38 = ~cmdbuf_write; // @[ahb_to_axi4.scala 89:40]
  wire  _T_39 = io_axi_r_valid & _T_38; // @[ahb_to_axi4.scala 89:38]
  wire  _T_41 = |io_axi_r_bits_resp; // @[ahb_to_axi4.scala 91:68]
  wire  _GEN_1 = _T_37 & _T_39; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_30 ? _T_22 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_12 ? _T_22 : _GEN_5; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_7 ? _T_11 : _GEN_10; // @[Conditional.scala 40:58]
  wire  _T_42 = buf_state_en & _T_41; // @[ahb_to_axi4.scala 91:41]
  wire  _GEN_2 = _T_37 & buf_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_37 & _T_42; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_30 & _T_36; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_30 ? 1'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_12 ? _T_29 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_12 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  cmdbuf_wr_en = _T_7 ? 1'h0 : _GEN_11; // @[Conditional.scala 40:58]
  wire  buf_rdata_en = _T_7 ? 1'h0 : _GEN_12; // @[Conditional.scala 40:58]
  wire  _T_44 = io_bus_clk_en & buf_state_en; // @[lib.scala 383:57]
  reg [2:0] ahb_hsize_q; // @[Reg.scala 27:20]
  wire  _T_47 = ahb_hsize_q == 3'h0; // @[ahb_to_axi4.scala 96:60]
  wire [7:0] _T_49 = _T_47 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_51 = 8'h1 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 96:78]
  wire [7:0] _T_52 = _T_49 & _T_51; // @[ahb_to_axi4.scala 96:70]
  wire  _T_54 = ahb_hsize_q == 3'h1; // @[ahb_to_axi4.scala 97:30]
  wire [7:0] _T_56 = _T_54 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _T_58 = 9'h3 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 97:48]
  wire [8:0] _GEN_34 = {{1'd0}, _T_56}; // @[ahb_to_axi4.scala 97:40]
  wire [8:0] _T_59 = _GEN_34 & _T_58; // @[ahb_to_axi4.scala 97:40]
  wire [8:0] _GEN_35 = {{1'd0}, _T_52}; // @[ahb_to_axi4.scala 96:109]
  wire [8:0] _T_60 = _GEN_35 | _T_59; // @[ahb_to_axi4.scala 96:109]
  wire  _T_62 = ahb_hsize_q == 3'h2; // @[ahb_to_axi4.scala 98:30]
  wire [7:0] _T_64 = _T_62 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _T_66 = 11'hf << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 98:48]
  wire [10:0] _GEN_36 = {{3'd0}, _T_64}; // @[ahb_to_axi4.scala 98:40]
  wire [10:0] _T_67 = _GEN_36 & _T_66; // @[ahb_to_axi4.scala 98:40]
  wire [10:0] _GEN_37 = {{2'd0}, _T_60}; // @[ahb_to_axi4.scala 97:79]
  wire [10:0] _T_68 = _GEN_37 | _T_67; // @[ahb_to_axi4.scala 97:79]
  wire  _T_70 = ahb_hsize_q == 3'h3; // @[ahb_to_axi4.scala 99:30]
  wire [7:0] _T_72 = _T_70 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _GEN_38 = {{3'd0}, _T_72}; // @[ahb_to_axi4.scala 98:79]
  wire [10:0] _T_74 = _T_68 | _GEN_38; // @[ahb_to_axi4.scala 98:79]
  reg  ahb_hready_q; // @[Reg.scala 27:20]
  wire  _T_75 = ~ahb_hready_q; // @[ahb_to_axi4.scala 102:80]
  reg  ahb_hresp_q; // @[Reg.scala 27:20]
  wire  _T_76 = ahb_hresp_q & _T_75; // @[ahb_to_axi4.scala 102:78]
  wire  _T_78 = buf_state == 2'h0; // @[ahb_to_axi4.scala 102:124]
  wire  _T_79 = _T_21 | _T_78; // @[ahb_to_axi4.scala 102:111]
  wire  _T_80 = buf_state == 2'h2; // @[ahb_to_axi4.scala 102:149]
  wire  _T_81 = buf_state == 2'h3; // @[ahb_to_axi4.scala 102:168]
  wire  _T_82 = _T_80 | _T_81; // @[ahb_to_axi4.scala 102:156]
  wire  _T_83 = ~_T_82; // @[ahb_to_axi4.scala 102:137]
  wire  _T_84 = _T_79 & _T_83; // @[ahb_to_axi4.scala 102:135]
  reg  buf_read_error; // @[Reg.scala 27:20]
  wire  _T_85 = ~buf_read_error; // @[ahb_to_axi4.scala 102:181]
  wire  _T_86 = _T_84 & _T_85; // @[ahb_to_axi4.scala 102:179]
  wire [1:0] _T_90 = io_ahb_hsel ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ahb_htrans_in = _T_90 & io_ahb_sig_out_htrans; // @[ahb_to_axi4.scala 104:54]
  reg [63:0] buf_rdata; // @[Reg.scala 27:20]
  reg [1:0] ahb_htrans_q; // @[Reg.scala 27:20]
  wire  _T_95 = ahb_htrans_q != 2'h0; // @[ahb_to_axi4.scala 106:61]
  wire  _T_96 = buf_state != 2'h0; // @[ahb_to_axi4.scala 106:83]
  wire  _T_97 = _T_95 & _T_96; // @[ahb_to_axi4.scala 106:70]
  wire  _T_98 = ahb_addr_in_dccm | ahb_addr_in_iccm; // @[ahb_to_axi4.scala 107:26]
  wire  _T_99 = ~_T_98; // @[ahb_to_axi4.scala 107:7]
  reg  ahb_hwrite_q; // @[Reg.scala 27:20]
  wire  _T_100 = ahb_addr_in_dccm & ahb_hwrite_q; // @[ahb_to_axi4.scala 108:46]
  wire  _T_101 = ahb_addr_in_iccm | _T_100; // @[ahb_to_axi4.scala 108:26]
  wire  _T_103 = ahb_hsize_q[1:0] == 2'h2; // @[ahb_to_axi4.scala 108:86]
  wire  _T_105 = ahb_hsize_q[1:0] == 2'h3; // @[ahb_to_axi4.scala 108:115]
  wire  _T_106 = _T_103 | _T_105; // @[ahb_to_axi4.scala 108:95]
  wire  _T_107 = ~_T_106; // @[ahb_to_axi4.scala 108:66]
  wire  _T_108 = _T_101 & _T_107; // @[ahb_to_axi4.scala 108:64]
  wire  _T_109 = _T_99 | _T_108; // @[ahb_to_axi4.scala 107:47]
  wire  _T_113 = _T_54 & ahb_haddr_q[0]; // @[ahb_to_axi4.scala 109:35]
  wire  _T_114 = _T_109 | _T_113; // @[ahb_to_axi4.scala 108:126]
  wire  _T_118 = |ahb_haddr_q[1:0]; // @[ahb_to_axi4.scala 110:56]
  wire  _T_119 = _T_62 & _T_118; // @[ahb_to_axi4.scala 110:35]
  wire  _T_120 = _T_114 | _T_119; // @[ahb_to_axi4.scala 109:55]
  wire  _T_124 = |ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 111:56]
  wire  _T_125 = _T_70 & _T_124; // @[ahb_to_axi4.scala 111:35]
  wire  _T_126 = _T_120 | _T_125; // @[ahb_to_axi4.scala 110:61]
  wire  _T_127 = _T_97 & _T_126; // @[ahb_to_axi4.scala 106:94]
  wire  _T_128 = _T_127 | buf_read_error; // @[ahb_to_axi4.scala 111:63]
  wire  buf_rdata_clk_en = io_bus_clk_en & buf_rdata_en; // @[ahb_to_axi4.scala 129:48]
  wire  ahb_addr_clk_en = io_bus_clk_en & _T_10; // @[ahb_to_axi4.scala 128:44]
  wire  _T_150 = ~cmdbuf_wr_en; // @[ahb_to_axi4.scala 141:113]
  wire  _T_151 = _T_157 & _T_150; // @[ahb_to_axi4.scala 141:111]
  wire  _T_153 = io_ahb_sig_in_hresp & _T_38; // @[ahb_to_axi4.scala 141:151]
  wire  cmdbuf_rst = _T_151 | _T_153; // @[ahb_to_axi4.scala 141:128]
  wire  _T_162 = ~cmdbuf_rst; // @[lib.scala 391:75]
  wire  _T_164 = cmdbuf_wr_en | cmdbuf_rst; // @[lib.scala 391:95]
  wire  _T_165 = _T_164 & io_bus_clk_en; // @[lib.scala 391:102]
  wire  _T_169 = io_bus_clk_en & cmdbuf_wr_en; // @[lib.scala 383:57]
  reg [2:0] _T_173; // @[Reg.scala 27:20]
  reg [7:0] cmdbuf_wstrb; // @[Reg.scala 27:20]
  wire [7:0] master_wstrb = _T_74[7:0]; // @[ahb_to_axi4.scala 96:31]
  wire  _T_178 = cmdbuf_wr_en & io_bus_clk_en; // @[ahb_to_axi4.scala 150:59]
  reg [31:0] cmdbuf_addr; // @[Reg.scala 27:20]
  reg [63:0] cmdbuf_wdata; // @[Reg.scala 27:20]
  wire [1:0] cmdbuf_size = _T_173[1:0]; // @[ahb_to_axi4.scala 147:31]
  rvclkhdr rvclkhdr ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  assign io_axi_aw_valid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 154:28]
  assign io_axi_aw_bits_id = 1'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 155:33]
  assign io_axi_aw_bits_addr = cmdbuf_addr; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 156:33]
  assign io_axi_aw_bits_region = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_len = 8'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 159:33]
  assign io_axi_aw_bits_size = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 157:33]
  assign io_axi_aw_bits_burst = 2'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 160:33]
  assign io_axi_aw_bits_lock = 1'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_cache = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_prot = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 158:33]
  assign io_axi_aw_bits_qos = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_w_valid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 162:28]
  assign io_axi_w_bits_data = cmdbuf_wdata; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 163:33]
  assign io_axi_w_bits_strb = cmdbuf_wstrb; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 164:33]
  assign io_axi_w_bits_last = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 165:33]
  assign io_axi_b_ready = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 167:28]
  assign io_axi_ar_valid = cmdbuf_vld & _T_38; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 169:28]
  assign io_axi_ar_bits_id = 1'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 170:33]
  assign io_axi_ar_bits_addr = cmdbuf_addr; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 171:33]
  assign io_axi_ar_bits_region = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_len = 8'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 174:33]
  assign io_axi_ar_bits_size = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 172:33]
  assign io_axi_ar_bits_burst = 2'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 175:33]
  assign io_axi_ar_bits_lock = 1'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_cache = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_prot = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 173:33]
  assign io_axi_ar_bits_qos = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_r_ready = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 177:28]
  assign io_ahb_sig_in_hrdata = buf_rdata; // @[ahb_to_axi4.scala 105:38]
  assign io_ahb_sig_in_hready = io_ahb_sig_in_hresp ? _T_76 : _T_86; // @[ahb_to_axi4.scala 102:38]
  assign io_ahb_sig_in_hresp = _T_128 | _T_76; // @[ahb_to_axi4.scala 106:38]
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
  _T_173 = _RAND_11[2:0];
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
    _T_173 = 3'h0;
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
      ahb_haddr_q <= 32'h0;
    end else if (ahb_addr_clk_en) begin
      ahb_haddr_q <= io_ahb_sig_out_haddr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_state <= 2'h0;
    end else if (_T_44) begin
      if (_T_7) begin
        if (io_ahb_sig_out_hwrite) begin
          buf_state <= 2'h1;
        end else begin
          buf_state <= 2'h2;
        end
      end else if (_T_12) begin
        if (_T_17) begin
          buf_state <= 2'h0;
        end else if (io_ahb_sig_out_hwrite) begin
          buf_state <= 2'h1;
        end else begin
          buf_state <= 2'h2;
        end
      end else if (_T_30) begin
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
    end else if (_T_165) begin
      cmdbuf_vld <= _T_162;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_write <= 1'h0;
    end else if (_T_169) begin
      cmdbuf_write <= ahb_hwrite_q;
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
      ahb_hready_q <= 1'h0;
    end else if (io_bus_clk_en) begin
      ahb_hready_q <= ahb_hready;
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
      buf_read_error <= 1'h0;
    end else if (io_bus_clk_en) begin
      if (_T_7) begin
        buf_read_error <= 1'h0;
      end else if (_T_12) begin
        buf_read_error <= 1'h0;
      end else if (_T_30) begin
        buf_read_error <= 1'h0;
      end else begin
        buf_read_error <= _GEN_3;
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
      ahb_htrans_q <= 2'h0;
    end else if (io_bus_clk_en) begin
      ahb_htrans_q <= ahb_htrans_in;
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
      _T_173 <= 3'h0;
    end else if (_T_169) begin
      _T_173 <= ahb_hsize_q;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_wstrb <= 8'h0;
    end else if (_T_169) begin
      cmdbuf_wstrb <= master_wstrb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_addr <= 32'h0;
    end else if (_T_178) begin
      cmdbuf_addr <= ahb_haddr_q;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmdbuf_wdata <= 64'h0;
    end else if (_T_178) begin
      cmdbuf_wdata <= io_ahb_sig_out_hwdata;
    end
  end
endmodule
