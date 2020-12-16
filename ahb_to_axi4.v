module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
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
  assign io_l1clk = clkhdr_Q; // @[lib.scala 335:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = io_scan_mode; // @[lib.scala 338:18]
endmodule
module ahb_to_axi4(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_bus_clk_en,
  input         io_clk_override,
  input         io_axi_aw_ready,
  output        io_axi_aw_valid,
  output [2:0]  io_axi_aw_bits_id,
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
  input  [2:0]  io_axi_b_bits_id,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [2:0]  io_axi_ar_bits_id,
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
  input  [2:0]  io_axi_r_bits_id,
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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 343:22]
  wire  ahb_addr_clk = rvclkhdr_1_io_l1clk; // @[ahb_to_axi4.scala 44:33 ahb_to_axi4.scala 133:31]
  reg [31:0] ahb_haddr_q; // @[ahb_to_axi4.scala 126:65]
  wire  ahb_addr_in_dccm = ahb_haddr_q[31:16] == 16'hf004; // @[lib.scala 87:29]
  wire  ahb_addr_in_iccm = ahb_haddr_q[31:16] == 16'hee00; // @[lib.scala 87:29]
  wire  ahb_clk = rvclkhdr_io_l1clk; // @[ahb_to_axi4.scala 43:33 ahb_to_axi4.scala 132:31]
  reg [1:0] buf_state; // @[Reg.scala 27:20]
  wire  _T_7 = 2'h0 == buf_state; // @[Conditional.scala 37:30]
  wire  ahb_hready = io_ahb_sig_in_hready & io_ahb_hreadyin; // @[ahb_to_axi4.scala 104:55]
  wire  _T_10 = ahb_hready & io_ahb_sig_out_htrans[1]; // @[ahb_to_axi4.scala 76:34]
  wire  _T_11 = _T_10 & io_ahb_hsel; // @[ahb_to_axi4.scala 76:61]
  wire  _T_12 = 2'h1 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_14 = io_ahb_sig_out_htrans == 2'h0; // @[ahb_to_axi4.scala 79:79]
  wire  _T_15 = io_ahb_sig_in_hresp | _T_14; // @[ahb_to_axi4.scala 79:48]
  wire  _T_16 = ~io_ahb_hsel; // @[ahb_to_axi4.scala 79:93]
  wire  _T_17 = _T_15 | _T_16; // @[ahb_to_axi4.scala 79:91]
  wire  bus_clk = rvclkhdr_5_io_l1clk; // @[ahb_to_axi4.scala 57:33 ahb_to_axi4.scala 180:27]
  reg  cmdbuf_vld; // @[ahb_to_axi4.scala 139:61]
  wire  _T_151 = io_axi_aw_valid & io_axi_aw_ready; // @[ahb_to_axi4.scala 137:67]
  wire  _T_152 = io_axi_ar_valid & io_axi_ar_ready; // @[ahb_to_axi4.scala 137:105]
  wire  _T_153 = _T_151 | _T_152; // @[ahb_to_axi4.scala 137:86]
  wire  _T_154 = ~_T_153; // @[ahb_to_axi4.scala 137:48]
  wire  cmdbuf_full = cmdbuf_vld & _T_154; // @[ahb_to_axi4.scala 137:46]
  wire  _T_21 = ~cmdbuf_full; // @[ahb_to_axi4.scala 80:24]
  wire  _T_22 = _T_21 | io_ahb_sig_in_hresp; // @[ahb_to_axi4.scala 80:37]
  wire  _T_25 = io_ahb_sig_out_htrans == 2'h1; // @[ahb_to_axi4.scala 81:92]
  wire  _T_26 = _T_25 & io_ahb_hsel; // @[ahb_to_axi4.scala 81:110]
  wire  _T_27 = io_ahb_sig_in_hresp | _T_26; // @[ahb_to_axi4.scala 81:60]
  wire  _T_28 = ~_T_27; // @[ahb_to_axi4.scala 81:38]
  wire  _T_29 = _T_21 & _T_28; // @[ahb_to_axi4.scala 81:36]
  wire  _T_30 = 2'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_34 = ~io_ahb_sig_in_hresp; // @[ahb_to_axi4.scala 86:23]
  wire  _T_36 = _T_34 & _T_21; // @[ahb_to_axi4.scala 86:44]
  wire  _T_37 = 2'h3 == buf_state; // @[Conditional.scala 37:30]
  reg  cmdbuf_write; // @[Reg.scala 27:20]
  wire  _T_38 = ~cmdbuf_write; // @[ahb_to_axi4.scala 90:40]
  wire  _T_39 = io_axi_r_valid & _T_38; // @[ahb_to_axi4.scala 90:38]
  wire  _T_41 = |io_axi_r_bits_resp; // @[ahb_to_axi4.scala 92:68]
  wire  _GEN_1 = _T_37 & _T_39; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_30 ? _T_22 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_12 ? _T_22 : _GEN_5; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_7 ? _T_11 : _GEN_10; // @[Conditional.scala 40:58]
  wire  _T_42 = buf_state_en & _T_41; // @[ahb_to_axi4.scala 92:41]
  wire  _GEN_2 = _T_37 & buf_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_37 & _T_42; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_30 & _T_36; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_30 ? 1'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_12 ? _T_29 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_12 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  cmdbuf_wr_en = _T_7 ? 1'h0 : _GEN_11; // @[Conditional.scala 40:58]
  wire  buf_rdata_en = _T_7 ? 1'h0 : _GEN_12; // @[Conditional.scala 40:58]
  reg [2:0] ahb_hsize_q; // @[ahb_to_axi4.scala 124:65]
  wire  _T_46 = ahb_hsize_q == 3'h0; // @[ahb_to_axi4.scala 97:60]
  wire [7:0] _T_48 = _T_46 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_50 = 8'h1 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 97:78]
  wire [7:0] _T_51 = _T_48 & _T_50; // @[ahb_to_axi4.scala 97:70]
  wire  _T_53 = ahb_hsize_q == 3'h1; // @[ahb_to_axi4.scala 98:30]
  wire [7:0] _T_55 = _T_53 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _T_57 = 9'h3 << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 98:48]
  wire [8:0] _GEN_23 = {{1'd0}, _T_55}; // @[ahb_to_axi4.scala 98:40]
  wire [8:0] _T_58 = _GEN_23 & _T_57; // @[ahb_to_axi4.scala 98:40]
  wire [8:0] _GEN_24 = {{1'd0}, _T_51}; // @[ahb_to_axi4.scala 97:109]
  wire [8:0] _T_59 = _GEN_24 | _T_58; // @[ahb_to_axi4.scala 97:109]
  wire  _T_61 = ahb_hsize_q == 3'h2; // @[ahb_to_axi4.scala 99:30]
  wire [7:0] _T_63 = _T_61 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _T_65 = 11'hf << ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 99:48]
  wire [10:0] _GEN_25 = {{3'd0}, _T_63}; // @[ahb_to_axi4.scala 99:40]
  wire [10:0] _T_66 = _GEN_25 & _T_65; // @[ahb_to_axi4.scala 99:40]
  wire [10:0] _GEN_26 = {{2'd0}, _T_59}; // @[ahb_to_axi4.scala 98:79]
  wire [10:0] _T_67 = _GEN_26 | _T_66; // @[ahb_to_axi4.scala 98:79]
  wire  _T_69 = ahb_hsize_q == 3'h3; // @[ahb_to_axi4.scala 100:30]
  wire [7:0] _T_71 = _T_69 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [10:0] _GEN_27 = {{3'd0}, _T_71}; // @[ahb_to_axi4.scala 99:79]
  wire [10:0] _T_73 = _T_67 | _GEN_27; // @[ahb_to_axi4.scala 99:79]
  reg  ahb_hready_q; // @[ahb_to_axi4.scala 122:60]
  wire  _T_74 = ~ahb_hready_q; // @[ahb_to_axi4.scala 103:80]
  reg  ahb_hresp_q; // @[ahb_to_axi4.scala 121:60]
  wire  _T_75 = ahb_hresp_q & _T_74; // @[ahb_to_axi4.scala 103:78]
  wire  _T_77 = buf_state == 2'h0; // @[ahb_to_axi4.scala 103:124]
  wire  _T_78 = _T_21 | _T_77; // @[ahb_to_axi4.scala 103:111]
  wire  _T_79 = buf_state == 2'h2; // @[ahb_to_axi4.scala 103:149]
  wire  _T_80 = buf_state == 2'h3; // @[ahb_to_axi4.scala 103:168]
  wire  _T_81 = _T_79 | _T_80; // @[ahb_to_axi4.scala 103:156]
  wire  _T_82 = ~_T_81; // @[ahb_to_axi4.scala 103:137]
  wire  _T_83 = _T_78 & _T_82; // @[ahb_to_axi4.scala 103:135]
  reg  buf_read_error; // @[ahb_to_axi4.scala 118:60]
  wire  _T_84 = ~buf_read_error; // @[ahb_to_axi4.scala 103:181]
  wire  _T_85 = _T_83 & _T_84; // @[ahb_to_axi4.scala 103:179]
  wire [1:0] _T_89 = io_ahb_hsel ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  buf_rdata_clk = rvclkhdr_2_io_l1clk; // @[ahb_to_axi4.scala 45:33 ahb_to_axi4.scala 134:31]
  reg [63:0] buf_rdata; // @[ahb_to_axi4.scala 117:66]
  reg [1:0] ahb_htrans_q; // @[ahb_to_axi4.scala 123:60]
  wire  _T_94 = ahb_htrans_q != 2'h0; // @[ahb_to_axi4.scala 107:61]
  wire  _T_95 = buf_state != 2'h0; // @[ahb_to_axi4.scala 107:83]
  wire  _T_96 = _T_94 & _T_95; // @[ahb_to_axi4.scala 107:70]
  wire  _T_97 = ahb_addr_in_dccm | ahb_addr_in_iccm; // @[ahb_to_axi4.scala 108:26]
  wire  _T_98 = ~_T_97; // @[ahb_to_axi4.scala 108:7]
  reg  ahb_hwrite_q; // @[ahb_to_axi4.scala 125:65]
  wire  _T_99 = ahb_addr_in_dccm & ahb_hwrite_q; // @[ahb_to_axi4.scala 109:46]
  wire  _T_100 = ahb_addr_in_iccm | _T_99; // @[ahb_to_axi4.scala 109:26]
  wire  _T_102 = ahb_hsize_q[1:0] == 2'h2; // @[ahb_to_axi4.scala 109:86]
  wire  _T_104 = ahb_hsize_q[1:0] == 2'h3; // @[ahb_to_axi4.scala 109:115]
  wire  _T_105 = _T_102 | _T_104; // @[ahb_to_axi4.scala 109:95]
  wire  _T_106 = ~_T_105; // @[ahb_to_axi4.scala 109:66]
  wire  _T_107 = _T_100 & _T_106; // @[ahb_to_axi4.scala 109:64]
  wire  _T_108 = _T_98 | _T_107; // @[ahb_to_axi4.scala 108:47]
  wire  _T_112 = _T_53 & ahb_haddr_q[0]; // @[ahb_to_axi4.scala 110:35]
  wire  _T_113 = _T_108 | _T_112; // @[ahb_to_axi4.scala 109:126]
  wire  _T_117 = |ahb_haddr_q[1:0]; // @[ahb_to_axi4.scala 111:56]
  wire  _T_118 = _T_61 & _T_117; // @[ahb_to_axi4.scala 111:35]
  wire  _T_119 = _T_113 | _T_118; // @[ahb_to_axi4.scala 110:55]
  wire  _T_123 = |ahb_haddr_q[2:0]; // @[ahb_to_axi4.scala 112:56]
  wire  _T_124 = _T_69 & _T_123; // @[ahb_to_axi4.scala 112:35]
  wire  _T_125 = _T_119 | _T_124; // @[ahb_to_axi4.scala 111:61]
  wire  _T_126 = _T_96 & _T_125; // @[ahb_to_axi4.scala 107:94]
  wire  _T_127 = _T_126 | buf_read_error; // @[ahb_to_axi4.scala 112:63]
  wire  _T_146 = ~cmdbuf_wr_en; // @[ahb_to_axi4.scala 136:113]
  wire  _T_147 = _T_153 & _T_146; // @[ahb_to_axi4.scala 136:111]
  wire  _T_149 = io_ahb_sig_in_hresp & _T_38; // @[ahb_to_axi4.scala 136:151]
  wire  cmdbuf_rst = _T_147 | _T_149; // @[ahb_to_axi4.scala 136:128]
  wire  _T_157 = cmdbuf_wr_en | cmdbuf_vld; // @[ahb_to_axi4.scala 139:66]
  wire  _T_158 = ~cmdbuf_rst; // @[ahb_to_axi4.scala 139:110]
  reg [2:0] _T_164; // @[Reg.scala 27:20]
  reg [7:0] cmdbuf_wstrb; // @[Reg.scala 27:20]
  wire [7:0] master_wstrb = _T_73[7:0]; // @[ahb_to_axi4.scala 97:31]
  reg [31:0] cmdbuf_addr; // @[lib.scala 374:16]
  reg [63:0] cmdbuf_wdata; // @[lib.scala 374:16]
  wire [1:0] cmdbuf_size = _T_164[1:0]; // @[ahb_to_axi4.scala 145:31]
  rvclkhdr rvclkhdr ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  assign io_axi_aw_valid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 156:28]
  assign io_axi_aw_bits_id = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 157:33]
  assign io_axi_aw_bits_addr = cmdbuf_addr; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 158:33]
  assign io_axi_aw_bits_region = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_len = 8'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 161:33]
  assign io_axi_aw_bits_size = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 159:33]
  assign io_axi_aw_bits_burst = 2'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 162:33]
  assign io_axi_aw_bits_lock = 1'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_cache = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_aw_bits_prot = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 160:33]
  assign io_axi_aw_bits_qos = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_w_valid = cmdbuf_vld & cmdbuf_write; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 164:28]
  assign io_axi_w_bits_data = cmdbuf_wdata; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 165:33]
  assign io_axi_w_bits_strb = cmdbuf_wstrb; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 166:33]
  assign io_axi_w_bits_last = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 167:33]
  assign io_axi_b_ready = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 169:28]
  assign io_axi_ar_valid = cmdbuf_vld & _T_38; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 171:28]
  assign io_axi_ar_bits_id = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 172:33]
  assign io_axi_ar_bits_addr = cmdbuf_addr; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 173:33]
  assign io_axi_ar_bits_region = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_len = 8'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 176:33]
  assign io_axi_ar_bits_size = {1'h0,cmdbuf_size}; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 174:33]
  assign io_axi_ar_bits_burst = 2'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 177:33]
  assign io_axi_ar_bits_lock = 1'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_cache = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_ar_bits_prot = 3'h0; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 175:33]
  assign io_axi_ar_bits_qos = 4'h0; // @[ahb_to_axi4.scala 20:10]
  assign io_axi_r_ready = 1'h1; // @[ahb_to_axi4.scala 20:10 ahb_to_axi4.scala 179:28]
  assign io_ahb_sig_in_hrdata = buf_rdata; // @[ahb_to_axi4.scala 106:38]
  assign io_ahb_sig_in_hready = io_ahb_sig_in_hresp ? _T_75 : _T_85; // @[ahb_to_axi4.scala 103:38]
  assign io_ahb_sig_in_hresp = _T_127 | _T_75; // @[ahb_to_axi4.scala 107:38]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_io_en = io_bus_clk_en; // @[lib.scala 345:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_1_io_en = io_bus_clk_en & _T_10; // @[lib.scala 345:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_2_io_en = io_bus_clk_en & buf_rdata_en; // @[lib.scala 345:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_3_io_clk = rvclkhdr_5_io_l1clk; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = _T_7 ? 1'h0 : _GEN_11; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_4_io_clk = rvclkhdr_5_io_l1clk; // @[lib.scala 370:18]
  assign rvclkhdr_4_io_en = _T_7 ? 1'h0 : _GEN_11; // @[lib.scala 371:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_5_io_en = io_bus_clk_en; // @[lib.scala 345:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
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
  _T_164 = _RAND_11[2:0];
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
    _T_164 = 3'h0;
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
      ahb_haddr_q <= io_ahb_sig_out_haddr;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      buf_state <= 2'h0;
    end else if (buf_state_en) begin
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
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      cmdbuf_vld <= 1'h0;
    end else begin
      cmdbuf_vld <= _T_157 & _T_158;
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
      ahb_hsize_q <= io_ahb_sig_out_hsize;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      ahb_hready_q <= 1'h0;
    end else begin
      ahb_hready_q <= io_ahb_sig_in_hready & io_ahb_hreadyin;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      ahb_hresp_q <= 1'h0;
    end else begin
      ahb_hresp_q <= io_ahb_sig_in_hresp;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      buf_read_error <= 1'h0;
    end else if (_T_7) begin
      buf_read_error <= 1'h0;
    end else if (_T_12) begin
      buf_read_error <= 1'h0;
    end else if (_T_30) begin
      buf_read_error <= 1'h0;
    end else begin
      buf_read_error <= _GEN_3;
    end
  end
  always @(posedge buf_rdata_clk or posedge reset) begin
    if (reset) begin
      buf_rdata <= 64'h0;
    end else begin
      buf_rdata <= io_axi_r_bits_data;
    end
  end
  always @(posedge ahb_clk or posedge reset) begin
    if (reset) begin
      ahb_htrans_q <= 2'h0;
    end else begin
      ahb_htrans_q <= _T_89 & io_ahb_sig_out_htrans;
    end
  end
  always @(posedge ahb_addr_clk or posedge reset) begin
    if (reset) begin
      ahb_hwrite_q <= 1'h0;
    end else begin
      ahb_hwrite_q <= io_ahb_sig_out_hwrite;
    end
  end
  always @(posedge bus_clk or posedge reset) begin
    if (reset) begin
      _T_164 <= 3'h0;
    end else if (cmdbuf_wr_en) begin
      _T_164 <= ahb_hsize_q;
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
      cmdbuf_wdata <= io_ahb_sig_out_hwdata;
    end
  end
endmodule
