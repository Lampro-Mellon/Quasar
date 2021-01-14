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
module axi4_to_ahb(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_scan_mode,
  input         io_bus_clk_en,
  input         io_clk_override,
  input         io_dec_tlu_force_halt,
  output        io_axi_aw_ready,
  input         io_axi_aw_valid,
  input         io_axi_aw_bits_id,
  input  [31:0] io_axi_aw_bits_addr,
  input  [3:0]  io_axi_aw_bits_region,
  input  [7:0]  io_axi_aw_bits_len,
  input  [2:0]  io_axi_aw_bits_size,
  input  [1:0]  io_axi_aw_bits_burst,
  input         io_axi_aw_bits_lock,
  input  [3:0]  io_axi_aw_bits_cache,
  input  [2:0]  io_axi_aw_bits_prot,
  input  [3:0]  io_axi_aw_bits_qos,
  output        io_axi_w_ready,
  input         io_axi_w_valid,
  input  [63:0] io_axi_w_bits_data,
  input  [7:0]  io_axi_w_bits_strb,
  input         io_axi_w_bits_last,
  input         io_axi_b_ready,
  output        io_axi_b_valid,
  output [1:0]  io_axi_b_bits_resp,
  output        io_axi_b_bits_id,
  output        io_axi_ar_ready,
  input         io_axi_ar_valid,
  input         io_axi_ar_bits_id,
  input  [31:0] io_axi_ar_bits_addr,
  input  [3:0]  io_axi_ar_bits_region,
  input  [7:0]  io_axi_ar_bits_len,
  input  [2:0]  io_axi_ar_bits_size,
  input  [1:0]  io_axi_ar_bits_burst,
  input         io_axi_ar_bits_lock,
  input  [3:0]  io_axi_ar_bits_cache,
  input  [2:0]  io_axi_ar_bits_prot,
  input  [3:0]  io_axi_ar_bits_qos,
  input         io_axi_r_ready,
  output        io_axi_r_valid,
  output        io_axi_r_bits_id,
  output [63:0] io_axi_r_bits_data,
  output [1:0]  io_axi_r_bits_resp,
  output        io_axi_r_bits_last,
  input  [63:0] io_ahb_in_hrdata,
  input         io_ahb_in_hready,
  input         io_ahb_in_hresp,
  output [31:0] io_ahb_out_haddr,
  output [2:0]  io_ahb_out_hburst,
  output        io_ahb_out_hmastlock,
  output [3:0]  io_ahb_out_hprot,
  output [2:0]  io_ahb_out_hsize,
  output [1:0]  io_ahb_out_htrans,
  output        io_ahb_out_hwrite,
  output [63:0] io_ahb_out_hwdata
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
  reg [31:0] _RAND_26;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 399:23]
  reg  dec_tlu_force_halt_bus_q; // @[axi4_to_ahb.scala 26:62]
  wire  dec_tlu_force_halt_bus = io_dec_tlu_force_halt | dec_tlu_force_halt_bus_q; // @[axi4_to_ahb.scala 24:54]
  wire  _T = ~io_bus_clk_en; // @[axi4_to_ahb.scala 25:35]
  reg [2:0] buf_state; // @[Reg.scala 27:20]
  wire  _T_49 = 3'h0 == buf_state; // @[Conditional.scala 37:30]
  reg  wrbuf_vld; // @[Reg.scala 27:20]
  reg  wrbuf_data_vld; // @[Reg.scala 27:20]
  wire  wr_cmd_vld = wrbuf_vld & wrbuf_data_vld; // @[axi4_to_ahb.scala 140:27]
  wire  master_valid = wr_cmd_vld | io_axi_ar_valid; // @[axi4_to_ahb.scala 141:30]
  wire  _T_101 = 3'h1 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hready_q; // @[Reg.scala 27:20]
  reg [1:0] ahb_htrans_q; // @[Reg.scala 27:20]
  wire  _T_108 = ahb_htrans_q != 2'h0; // @[axi4_to_ahb.scala 177:58]
  wire  _T_109 = ahb_hready_q & _T_108; // @[axi4_to_ahb.scala 177:36]
  reg  ahb_hwrite_q; // @[Reg.scala 27:20]
  wire  _T_110 = ~ahb_hwrite_q; // @[axi4_to_ahb.scala 177:72]
  wire  _T_111 = _T_109 & _T_110; // @[axi4_to_ahb.scala 177:70]
  wire  _T_136 = 3'h6 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hresp_q; // @[Reg.scala 27:20]
  wire  _T_156 = ahb_hready_q | ahb_hresp_q; // @[axi4_to_ahb.scala 191:37]
  wire  _T_175 = 3'h7 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_186 = 3'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_188 = 3'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_189 = ahb_hready_q & ahb_hwrite_q; // @[axi4_to_ahb.scala 223:33]
  wire  _T_192 = _T_189 & _T_108; // @[axi4_to_ahb.scala 223:48]
  wire  _T_281 = 3'h4 == buf_state; // @[Conditional.scala 37:30]
  wire  _GEN_16 = _T_281 & _T_192; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_188 ? _T_192 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_186 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_175 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_136 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_101 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67]
  wire  trxn_done = _T_49 ? 1'h0 : _GEN_96; // @[Conditional.scala 40:58]
  reg  cmd_doneQ; // @[Reg.scala 27:20]
  wire  _T_282 = cmd_doneQ & ahb_hready_q; // @[axi4_to_ahb.scala 233:34]
  wire  _T_283 = _T_282 | ahb_hresp_q; // @[axi4_to_ahb.scala 233:50]
  wire  _T_440 = 3'h5 == buf_state; // @[Conditional.scala 37:30]
  wire  slave_ready = io_axi_b_ready & io_axi_r_ready; // @[axi4_to_ahb.scala 158:33]
  wire  _GEN_2 = _T_440 & slave_ready; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_281 ? _T_283 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_188 ? trxn_done : _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_186 ? _T_156 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_175 ? _T_111 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_136 ? _T_156 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_101 ? _T_111 : _GEN_70; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_49 ? master_valid : _GEN_84; // @[Conditional.scala 40:58]
  wire  _T_4 = ~dec_tlu_force_halt_bus; // @[lib.scala 391:73]
  wire [2:0] _T_6 = _T_4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_19 = wr_cmd_vld ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 143:20]
  wire [2:0] master_opc = {{1'd0}, _T_19}; // @[axi4_to_ahb.scala 143:14]
  wire  _T_51 = master_opc[2:1] == 2'h1; // @[axi4_to_ahb.scala 163:41]
  wire  _GEN_9 = _T_281 & _T_51; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_188 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_186 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_175 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_136 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_101 ? 1'h0 : _GEN_82; // @[Conditional.scala 39:67]
  wire  buf_write_in = _T_49 ? _T_51 : _GEN_98; // @[Conditional.scala 40:58]
  wire [2:0] _T_53 = buf_write_in ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 164:26]
  wire  _T_103 = master_opc == 3'h0; // @[axi4_to_ahb.scala 176:61]
  wire  _T_104 = master_valid & _T_103; // @[axi4_to_ahb.scala 176:41]
  wire [2:0] _T_106 = _T_104 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 176:26]
  wire  _T_124 = _T_106 == 3'h6; // @[axi4_to_ahb.scala 180:174]
  wire  _T_125 = _T_111 & _T_124; // @[axi4_to_ahb.scala 180:88]
  wire  _T_137 = ~ahb_hresp_q; // @[axi4_to_ahb.scala 188:39]
  wire  _T_138 = ahb_hready_q & _T_137; // @[axi4_to_ahb.scala 188:37]
  wire  _T_141 = master_valid & _T_51; // @[axi4_to_ahb.scala 188:70]
  wire  _T_142 = ~_T_141; // @[axi4_to_ahb.scala 188:55]
  wire  _T_143 = _T_138 & _T_142; // @[axi4_to_ahb.scala 188:53]
  wire  _T_285 = buf_state_en & _T_137; // @[axi4_to_ahb.scala 234:36]
  wire  _T_286 = _T_285 & slave_ready; // @[axi4_to_ahb.scala 234:51]
  wire  _GEN_5 = _T_281 & _T_286; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_188 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_186 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_175 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_136 ? _T_143 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_101 ? _T_125 : _GEN_67; // @[Conditional.scala 39:67]
  wire  master_ready = _T_49 | _GEN_87; // @[Conditional.scala 40:58]
  wire  _T_149 = master_valid & master_ready; // @[axi4_to_ahb.scala 190:82]
  wire  _T_152 = _T_149 & _T_103; // @[axi4_to_ahb.scala 190:97]
  wire [2:0] _T_154 = _T_152 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 190:67]
  wire [2:0] _T_155 = ahb_hresp_q ? 3'h7 : _T_154; // @[axi4_to_ahb.scala 190:26]
  wire  _T_287 = ~slave_ready; // @[axi4_to_ahb.scala 235:42]
  wire  _T_288 = ahb_hresp_q | _T_287; // @[axi4_to_ahb.scala 235:40]
  wire [2:0] _T_293 = _T_51 ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 235:101]
  wire [2:0] _T_294 = master_valid ? _T_293 : 3'h0; // @[axi4_to_ahb.scala 235:66]
  wire [2:0] _T_295 = _T_288 ? 3'h5 : _T_294; // @[axi4_to_ahb.scala 235:26]
  wire [2:0] _GEN_6 = _T_281 ? _T_295 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_19 = _T_188 ? 3'h4 : _GEN_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_35 = _T_186 ? 3'h5 : _GEN_19; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_51 = _T_175 ? 3'h3 : _GEN_35; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_69 = _T_136 ? _T_155 : _GEN_51; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_83 = _T_101 ? _T_106 : _GEN_69; // @[Conditional.scala 39:67]
  wire [2:0] buf_nxtstate = _T_49 ? _T_53 : _GEN_83; // @[Conditional.scala 40:58]
  wire [2:0] _T_7 = buf_nxtstate & _T_6; // @[lib.scala 391:53]
  wire  _T_8 = buf_state_en | dec_tlu_force_halt_bus; // @[lib.scala 391:92]
  wire  _T_9 = _T_8 & io_bus_clk_en; // @[lib.scala 391:99]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg [31:0] wrbuf_addr; // @[Reg.scala 27:20]
  wire [31:0] master_addr = wr_cmd_vld ? wrbuf_addr : io_axi_ar_bits_addr; // @[axi4_to_ahb.scala 144:21]
  reg [2:0] wrbuf_size; // @[Reg.scala 27:20]
  wire [2:0] master_size = wr_cmd_vld ? wrbuf_size : io_axi_ar_bits_size; // @[axi4_to_ahb.scala 145:21]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] wrbuf_data; // @[Reg.scala 27:20]
  wire  _T_358 = buf_nxtstate != 3'h5; // @[axi4_to_ahb.scala 245:55]
  wire  _T_359 = buf_state_en & _T_358; // @[axi4_to_ahb.scala 245:39]
  wire  _GEN_15 = _T_281 ? _T_359 : _T_440; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_188 ? 1'h0 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_186 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_175 ? buf_state_en : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_136 ? _T_285 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_101 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  slave_valid_pre = _T_49 ? 1'h0 : _GEN_95; // @[Conditional.scala 40:58]
  wire  _T_30 = slave_valid_pre & slave_ready; // @[axi4_to_ahb.scala 150:33]
  reg  slvbuf_write; // @[Reg.scala 27:20]
  wire [1:0] _T_597 = slvbuf_write ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 279:23]
  reg  slvbuf_error; // @[Reg.scala 27:20]
  wire [1:0] _T_599 = slvbuf_error ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_600 = _T_599 & 2'h2; // @[axi4_to_ahb.scala 279:88]
  wire [3:0] slave_opc = {_T_597,_T_600}; // @[Cat.scala 29:58]
  wire [1:0] _T_35 = slave_opc[1] ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 151:55]
  reg  slvbuf_tag; // @[Reg.scala 27:20]
  wire  _T_40 = slave_opc[3:2] == 2'h0; // @[axi4_to_ahb.scala 154:66]
  reg [31:0] last_bus_addr; // @[Reg.scala 27:20]
  wire [63:0] _T_604 = {last_bus_addr,last_bus_addr}; // @[Cat.scala 29:58]
  wire  _T_605 = buf_state == 3'h5; // @[axi4_to_ahb.scala 280:91]
  reg [63:0] buf_data; // @[Reg.scala 27:20]
  reg [63:0] ahb_hrdata_q; // @[Reg.scala 27:20]
  wire [63:0] _T_608 = _T_605 ? buf_data : ahb_hrdata_q; // @[axi4_to_ahb.scala 280:79]
  wire  _T_55 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 167:54]
  wire  _T_56 = buf_state_en & _T_55; // @[axi4_to_ahb.scala 167:38]
  wire [2:0] _T_87 = wrbuf_byteen[6] ? 3'h6 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_88 = wrbuf_byteen[5] ? 3'h5 : _T_87; // @[Mux.scala 98:16]
  wire [2:0] _T_89 = wrbuf_byteen[4] ? 3'h4 : _T_88; // @[Mux.scala 98:16]
  wire [2:0] _T_90 = wrbuf_byteen[3] ? 3'h3 : _T_89; // @[Mux.scala 98:16]
  wire [2:0] _T_91 = wrbuf_byteen[2] ? 3'h2 : _T_90; // @[Mux.scala 98:16]
  wire [2:0] _T_92 = wrbuf_byteen[1] ? 3'h1 : _T_91; // @[Mux.scala 98:16]
  wire [2:0] _T_93 = wrbuf_byteen[0] ? 3'h0 : _T_92; // @[Mux.scala 98:16]
  wire [2:0] _T_95 = buf_write_in ? _T_93 : master_addr[2:0]; // @[axi4_to_ahb.scala 169:30]
  wire  _T_96 = buf_nxtstate == 3'h1; // @[axi4_to_ahb.scala 171:51]
  wire  _T_126 = master_ready & master_valid; // @[axi4_to_ahb.scala 182:33]
  wire  _T_162 = buf_nxtstate == 3'h6; // @[axi4_to_ahb.scala 197:64]
  wire  _T_163 = _T_126 & _T_162; // @[axi4_to_ahb.scala 197:48]
  wire  _T_164 = _T_163 & buf_state_en; // @[axi4_to_ahb.scala 197:79]
  wire  _T_349 = buf_state_en & buf_write_in; // @[axi4_to_ahb.scala 243:33]
  wire  _T_351 = _T_349 & _T_55; // @[axi4_to_ahb.scala 243:48]
  wire  _GEN_13 = _T_281 & _T_351; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_188 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_186 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_175 ? 1'h0 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_136 ? _T_164 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_89 = _T_101 ? _T_126 : _GEN_76; // @[Conditional.scala 39:67]
  wire  bypass_en = _T_49 ? buf_state_en : _GEN_89; // @[Conditional.scala 40:58]
  wire [1:0] _T_99 = bypass_en ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_100 = _T_99 & 2'h2; // @[axi4_to_ahb.scala 172:49]
  wire  _T_112 = ~master_valid; // @[axi4_to_ahb.scala 178:34]
  wire  _T_113 = buf_state_en & _T_112; // @[axi4_to_ahb.scala 178:32]
  reg [31:0] buf_addr; // @[Reg.scala 27:20]
  wire [2:0] _T_130 = bypass_en ? master_addr[2:0] : buf_addr[2:0]; // @[axi4_to_ahb.scala 183:30]
  wire  _T_131 = ~buf_state_en; // @[axi4_to_ahb.scala 184:48]
  wire  _T_132 = _T_131 | bypass_en; // @[axi4_to_ahb.scala 184:62]
  wire [1:0] _T_134 = _T_132 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_135 = 2'h2 & _T_134; // @[axi4_to_ahb.scala 184:36]
  wire  _T_169 = buf_nxtstate != 3'h6; // @[axi4_to_ahb.scala 199:63]
  wire  _T_170 = _T_169 & buf_state_en; // @[axi4_to_ahb.scala 199:78]
  wire  _T_171 = ~_T_170; // @[axi4_to_ahb.scala 199:47]
  wire [1:0] _T_173 = _T_171 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_174 = 2'h2 & _T_173; // @[axi4_to_ahb.scala 199:36]
  wire [1:0] _T_184 = _T_131 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_185 = 2'h2 & _T_184; // @[axi4_to_ahb.scala 209:41]
  reg [2:0] buf_cmd_byte_ptrQ; // @[Reg.scala 27:20]
  reg [7:0] buf_byteen; // @[Reg.scala 27:20]
  wire [2:0] _T_197 = buf_cmd_byte_ptrQ + 3'h1; // @[axi4_to_ahb.scala 136:52]
  wire  _T_200 = 3'h0 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_201 = buf_byteen[0] & _T_200; // @[axi4_to_ahb.scala 137:48]
  wire  _T_203 = 3'h1 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_204 = buf_byteen[1] & _T_203; // @[axi4_to_ahb.scala 137:48]
  wire  _T_206 = 3'h2 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_207 = buf_byteen[2] & _T_206; // @[axi4_to_ahb.scala 137:48]
  wire  _T_209 = 3'h3 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_210 = buf_byteen[3] & _T_209; // @[axi4_to_ahb.scala 137:48]
  wire  _T_212 = 3'h4 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_213 = buf_byteen[4] & _T_212; // @[axi4_to_ahb.scala 137:48]
  wire  _T_215 = 3'h5 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_216 = buf_byteen[5] & _T_215; // @[axi4_to_ahb.scala 137:48]
  wire  _T_218 = 3'h6 >= _T_197; // @[axi4_to_ahb.scala 137:62]
  wire  _T_219 = buf_byteen[6] & _T_218; // @[axi4_to_ahb.scala 137:48]
  wire [2:0] _T_224 = _T_219 ? 3'h6 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_225 = _T_216 ? 3'h5 : _T_224; // @[Mux.scala 98:16]
  wire [2:0] _T_226 = _T_213 ? 3'h4 : _T_225; // @[Mux.scala 98:16]
  wire [2:0] _T_227 = _T_210 ? 3'h3 : _T_226; // @[Mux.scala 98:16]
  wire [2:0] _T_228 = _T_207 ? 3'h2 : _T_227; // @[Mux.scala 98:16]
  wire [2:0] _T_229 = _T_204 ? 3'h1 : _T_228; // @[Mux.scala 98:16]
  wire [2:0] _T_230 = _T_201 ? 3'h0 : _T_229; // @[Mux.scala 98:16]
  wire [2:0] _T_231 = trxn_done ? _T_230 : buf_cmd_byte_ptrQ; // @[axi4_to_ahb.scala 227:30]
  wire  _T_232 = buf_cmd_byte_ptrQ == 3'h7; // @[axi4_to_ahb.scala 228:65]
  reg  buf_aligned; // @[Reg.scala 27:20]
  wire  _T_233 = buf_aligned | _T_232; // @[axi4_to_ahb.scala 228:44]
  wire [7:0] _T_271 = buf_byteen >> _T_230; // @[axi4_to_ahb.scala 228:92]
  wire  _T_273 = ~_T_271[0]; // @[axi4_to_ahb.scala 228:163]
  wire  _T_274 = _T_233 | _T_273; // @[axi4_to_ahb.scala 228:79]
  wire  _T_275 = trxn_done & _T_274; // @[axi4_to_ahb.scala 228:29]
  wire  _T_346 = _T_232 | _T_273; // @[axi4_to_ahb.scala 242:38]
  wire  _T_347 = _T_109 & _T_346; // @[axi4_to_ahb.scala 241:79]
  wire  _T_348 = ahb_hresp_q | _T_347; // @[axi4_to_ahb.scala 241:32]
  wire  _GEN_12 = _T_281 & _T_348; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_188 ? _T_275 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_186 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_175 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_136 ? _T_113 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_101 ? _T_113 : _GEN_75; // @[Conditional.scala 39:67]
  wire  cmd_done = _T_49 ? 1'h0 : _GEN_85; // @[Conditional.scala 40:58]
  wire  _T_276 = cmd_done | cmd_doneQ; // @[axi4_to_ahb.scala 229:47]
  wire  _T_277 = ~_T_276; // @[axi4_to_ahb.scala 229:36]
  wire [1:0] _T_279 = _T_277 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_280 = _T_279 & 2'h2; // @[axi4_to_ahb.scala 229:61]
  wire  _T_300 = _T_55 | _T_96; // @[axi4_to_ahb.scala 239:62]
  wire  _T_301 = buf_state_en & _T_300; // @[axi4_to_ahb.scala 239:33]
  wire  _T_354 = _T_277 | bypass_en; // @[axi4_to_ahb.scala 244:61]
  wire [1:0] _T_356 = _T_354 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_357 = _T_356 & 2'h2; // @[axi4_to_ahb.scala 244:75]
  wire  _T_364 = trxn_done | bypass_en; // @[axi4_to_ahb.scala 247:40]
  wire [2:0] _T_439 = bypass_en ? _T_93 : _T_231; // @[axi4_to_ahb.scala 248:30]
  wire  _GEN_7 = _T_281 & ahb_hresp_q; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_281 ? buf_state_en : _T_440; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_281 & _T_301; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_188 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_186 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_175 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_136 ? _T_152 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_101 ? master_ready : _GEN_68; // @[Conditional.scala 39:67]
  wire  buf_wr_en = _T_49 ? buf_state_en : _GEN_88; // @[Conditional.scala 40:58]
  wire  _GEN_11 = _T_281 & buf_wr_en; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_14 = _T_281 ? _T_357 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_281 & _T_364; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_18 = _T_281 ? _T_439 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_188 ? buf_state_en : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_188 & buf_state_en; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_24 = _T_188 ? _T_231 : _GEN_18; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_26 = _T_188 ? _T_280 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_188 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_188 ? 1'h0 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_186 ? buf_state_en : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_186 ? buf_state_en : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_186 ? buf_state_en : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_186 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_43 = _T_186 ? 3'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_45 = _T_186 ? 2'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_175 ? buf_state_en : _GEN_40; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_55 = _T_175 ? buf_addr[2:0] : _GEN_43; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_56 = _T_175 ? _T_185 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_175 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_175 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_175 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_136 ? buf_state_en : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_136 ? buf_state_en : _GEN_59; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_77 = _T_136 ? _T_130 : _GEN_55; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_78 = _T_136 ? _T_174 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_136 ? buf_wr_en : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_136 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_101 ? buf_state_en : _GEN_79; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_90 = _T_101 ? _T_130 : _GEN_77; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_91 = _T_101 ? _T_135 : _GEN_78; // @[Conditional.scala 39:67]
  wire  _GEN_92 = _T_101 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_101 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_101 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  buf_data_wr_en = _T_49 ? _T_56 : _GEN_92; // @[Conditional.scala 40:58]
  wire  buf_cmd_byte_ptr_en = _T_49 ? buf_state_en : _GEN_97; // @[Conditional.scala 40:58]
  wire [2:0] buf_cmd_byte_ptr = _T_49 ? _T_95 : _GEN_90; // @[Conditional.scala 40:58]
  wire  slvbuf_wr_en = _T_49 ? 1'h0 : _GEN_86; // @[Conditional.scala 40:58]
  wire  slvbuf_error_en = _T_49 ? 1'h0 : _GEN_94; // @[Conditional.scala 40:58]
  wire  _T_535 = master_size[1:0] == 2'h0; // @[axi4_to_ahb.scala 265:24]
  wire  _T_536 = _T_103 | _T_535; // @[axi4_to_ahb.scala 264:48]
  wire  _T_538 = master_size[1:0] == 2'h1; // @[axi4_to_ahb.scala 265:54]
  wire  _T_539 = _T_536 | _T_538; // @[axi4_to_ahb.scala 265:33]
  wire  _T_541 = master_size[1:0] == 2'h2; // @[axi4_to_ahb.scala 265:93]
  wire  _T_542 = _T_539 | _T_541; // @[axi4_to_ahb.scala 265:72]
  wire  _T_544 = master_size[1:0] == 2'h3; // @[axi4_to_ahb.scala 266:25]
  wire  _T_546 = wrbuf_byteen == 8'h3; // @[axi4_to_ahb.scala 266:62]
  wire  _T_548 = wrbuf_byteen == 8'hc; // @[axi4_to_ahb.scala 266:97]
  wire  _T_549 = _T_546 | _T_548; // @[axi4_to_ahb.scala 266:74]
  wire  _T_551 = wrbuf_byteen == 8'h30; // @[axi4_to_ahb.scala 266:132]
  wire  _T_552 = _T_549 | _T_551; // @[axi4_to_ahb.scala 266:109]
  wire  _T_554 = wrbuf_byteen == 8'hc0; // @[axi4_to_ahb.scala 266:168]
  wire  _T_555 = _T_552 | _T_554; // @[axi4_to_ahb.scala 266:145]
  wire  _T_557 = wrbuf_byteen == 8'hf; // @[axi4_to_ahb.scala 267:28]
  wire  _T_558 = _T_555 | _T_557; // @[axi4_to_ahb.scala 266:181]
  wire  _T_560 = wrbuf_byteen == 8'hf0; // @[axi4_to_ahb.scala 267:63]
  wire  _T_561 = _T_558 | _T_560; // @[axi4_to_ahb.scala 267:40]
  wire  _T_563 = wrbuf_byteen == 8'hff; // @[axi4_to_ahb.scala 267:99]
  wire  _T_564 = _T_561 | _T_563; // @[axi4_to_ahb.scala 267:76]
  wire  _T_565 = _T_544 & _T_564; // @[axi4_to_ahb.scala 266:38]
  wire  buf_aligned_in = _T_542 | _T_565; // @[axi4_to_ahb.scala 265:106]
  wire  _T_444 = buf_aligned_in & _T_51; // @[axi4_to_ahb.scala 259:62]
  wire [2:0] _T_461 = _T_548 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_462 = 3'h2 & _T_461; // @[axi4_to_ahb.scala 128:15]
  wire  _T_468 = _T_560 | _T_546; // @[axi4_to_ahb.scala 129:56]
  wire [2:0] _T_470 = _T_468 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_471 = 3'h4 & _T_470; // @[axi4_to_ahb.scala 129:15]
  wire [2:0] _T_472 = _T_462 | _T_471; // @[axi4_to_ahb.scala 128:63]
  wire [2:0] _T_476 = _T_554 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_477 = 3'h6 & _T_476; // @[axi4_to_ahb.scala 130:15]
  wire [2:0] _T_478 = _T_472 | _T_477; // @[axi4_to_ahb.scala 129:96]
  wire [2:0] _T_485 = _T_444 ? _T_478 : master_addr[2:0]; // @[axi4_to_ahb.scala 259:45]
  wire [31:0] buf_addr_in = {master_addr[31:3],_T_485}; // @[Cat.scala 29:58]
  wire  _T_489 = buf_state == 3'h3; // @[axi4_to_ahb.scala 262:33]
  wire  _T_495 = buf_aligned_in & _T_544; // @[axi4_to_ahb.scala 263:38]
  wire  _T_498 = _T_495 & _T_51; // @[axi4_to_ahb.scala 263:72]
  wire [1:0] _T_504 = _T_563 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_510 = _T_560 | _T_557; // @[axi4_to_ahb.scala 121:55]
  wire [1:0] _T_512 = _T_510 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_513 = 2'h2 & _T_512; // @[axi4_to_ahb.scala 121:16]
  wire [1:0] _T_514 = _T_504 | _T_513; // @[axi4_to_ahb.scala 120:64]
  wire  _T_519 = _T_554 | _T_551; // @[axi4_to_ahb.scala 122:60]
  wire  _T_522 = _T_519 | _T_548; // @[axi4_to_ahb.scala 122:89]
  wire  _T_525 = _T_522 | _T_546; // @[axi4_to_ahb.scala 122:123]
  wire [1:0] _T_527 = _T_525 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_528 = 2'h1 & _T_527; // @[axi4_to_ahb.scala 122:21]
  wire [1:0] _T_529 = _T_514 | _T_528; // @[axi4_to_ahb.scala 121:93]
  wire [1:0] _T_531 = _T_498 ? _T_529 : master_size[1:0]; // @[axi4_to_ahb.scala 263:21]
  wire [28:0] _T_570 = bypass_en ? master_addr[31:3] : buf_addr[31:3]; // @[axi4_to_ahb.scala 269:30]
  wire  _T_571 = io_ahb_out_htrans == 2'h2; // @[axi4_to_ahb.scala 269:115]
  wire [2:0] _T_573 = _T_571 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_574 = _T_573 & buf_cmd_byte_ptr; // @[axi4_to_ahb.scala 269:124]
  wire [1:0] _T_578 = buf_aligned_in ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] buf_size_in = {{1'd0}, _T_531}; // @[axi4_to_ahb.scala 263:15]
  wire [1:0] _T_580 = _T_578 & buf_size_in[1:0]; // @[axi4_to_ahb.scala 270:81]
  wire [2:0] _T_581 = {1'h0,_T_580}; // @[Cat.scala 29:58]
  wire [1:0] _T_583 = buf_aligned ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg [1:0] buf_size; // @[Reg.scala 27:20]
  wire [1:0] _T_585 = _T_583 & buf_size; // @[axi4_to_ahb.scala 270:138]
  wire [2:0] _T_586 = {1'h0,_T_585}; // @[Cat.scala 29:58]
  wire  _T_589 = ~io_axi_ar_bits_prot[2]; // @[axi4_to_ahb.scala 274:37]
  wire [1:0] _T_590 = {1'h1,_T_589}; // @[Cat.scala 29:58]
  reg  buf_write; // @[Reg.scala 27:20]
  wire  _T_612 = io_ahb_out_htrans != 2'h0; // @[axi4_to_ahb.scala 283:44]
  wire  _T_613 = _T_612 & io_ahb_in_hready; // @[axi4_to_ahb.scala 283:56]
  wire  last_addr_en = _T_613 & io_ahb_out_hwrite; // @[axi4_to_ahb.scala 283:75]
  wire  _T_615 = io_axi_aw_valid & io_axi_aw_ready; // @[axi4_to_ahb.scala 285:31]
  wire  wrbuf_en = _T_615 & master_ready; // @[axi4_to_ahb.scala 285:49]
  wire  _T_617 = io_axi_w_valid & io_axi_w_ready; // @[axi4_to_ahb.scala 286:35]
  wire  wrbuf_data_en = _T_617 & master_ready; // @[axi4_to_ahb.scala 286:52]
  wire  wrbuf_cmd_sent = _T_149 & _T_51; // @[axi4_to_ahb.scala 287:49]
  wire  _T_623 = ~wrbuf_en; // @[axi4_to_ahb.scala 288:34]
  wire  _T_624 = wrbuf_cmd_sent & _T_623; // @[axi4_to_ahb.scala 288:32]
  wire  wrbuf_rst = _T_624 | dec_tlu_force_halt_bus; // @[axi4_to_ahb.scala 288:45]
  wire  _T_626 = ~wrbuf_cmd_sent; // @[axi4_to_ahb.scala 290:36]
  wire  _T_627 = wrbuf_vld & _T_626; // @[axi4_to_ahb.scala 290:34]
  wire  _T_628 = ~_T_627; // @[axi4_to_ahb.scala 290:22]
  wire  _T_631 = wrbuf_data_vld & _T_626; // @[axi4_to_ahb.scala 291:38]
  wire  _T_632 = ~_T_631; // @[axi4_to_ahb.scala 291:21]
  wire  _T_635 = ~wr_cmd_vld; // @[axi4_to_ahb.scala 292:22]
  wire  _T_639 = ~wrbuf_rst; // @[lib.scala 391:73]
  wire  _T_641 = wrbuf_en | wrbuf_rst; // @[lib.scala 391:92]
  wire  _T_642 = _T_641 & io_bus_clk_en; // @[lib.scala 391:99]
  wire  _T_649 = wrbuf_data_en | wrbuf_rst; // @[lib.scala 391:92]
  wire  _T_650 = _T_649 & io_bus_clk_en; // @[lib.scala 391:99]
  wire  _T_655 = io_bus_clk_en & wrbuf_en; // @[lib.scala 383:57]
  wire  _T_662 = wrbuf_en & io_bus_clk_en; // @[axi4_to_ahb.scala 299:61]
  wire  _T_665 = wrbuf_data_en & io_bus_clk_en; // @[axi4_to_ahb.scala 300:65]
  wire  _T_669 = io_bus_clk_en & wrbuf_data_en; // @[lib.scala 383:57]
  wire  _T_673 = io_bus_clk_en & last_addr_en; // @[lib.scala 383:57]
  wire  _T_730 = buf_wr_en | slvbuf_wr_en; // @[axi4_to_ahb.scala 320:51]
  wire  _T_731 = _T_730 | io_clk_override; // @[axi4_to_ahb.scala 320:66]
  wire  buf_clken = io_bus_clk_en & _T_731; // @[axi4_to_ahb.scala 320:38]
  wire  _T_676 = buf_clken & buf_wr_en; // @[lib.scala 383:57]
  reg  buf_tag; // @[Reg.scala 27:20]
  wire  _T_683 = buf_wr_en & io_bus_clk_en; // @[axi4_to_ahb.scala 305:62]
  wire  _T_698 = buf_data_wr_en & io_bus_clk_en; // @[axi4_to_ahb.scala 309:67]
  wire  _T_702 = buf_clken & slvbuf_wr_en; // @[lib.scala 383:57]
  wire  _T_709 = io_bus_clk_en & slvbuf_error_en; // @[lib.scala 383:57]
  wire  _T_713 = ~slave_valid_pre; // @[lib.scala 391:73]
  wire  _T_715 = cmd_done | slave_valid_pre; // @[lib.scala 391:92]
  wire  _T_716 = _T_715 & io_bus_clk_en; // @[lib.scala 391:99]
  wire  _T_721 = io_bus_clk_en & buf_cmd_byte_ptr_en; // @[lib.scala 383:57]
  wire  _T_733 = buf_state != 3'h0; // @[axi4_to_ahb.scala 321:52]
  wire  _T_734 = _T_733 | io_clk_override; // @[axi4_to_ahb.scala 321:62]
  wire  ahbm_data_clken = io_bus_clk_en & _T_734; // @[axi4_to_ahb.scala 321:38]
  rvclkhdr rvclkhdr ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  assign io_axi_aw_ready = _T_628 & master_ready; // @[axi4_to_ahb.scala 290:19]
  assign io_axi_w_ready = _T_632 & master_ready; // @[axi4_to_ahb.scala 291:18]
  assign io_axi_b_valid = _T_30 & slave_opc[3]; // @[axi4_to_ahb.scala 150:18]
  assign io_axi_b_bits_resp = slave_opc[0] ? 2'h2 : _T_35; // @[axi4_to_ahb.scala 151:22]
  assign io_axi_b_bits_id = slvbuf_tag; // @[axi4_to_ahb.scala 152:20]
  assign io_axi_ar_ready = _T_635 & master_ready; // @[axi4_to_ahb.scala 292:19]
  assign io_axi_r_valid = _T_30 & _T_40; // @[axi4_to_ahb.scala 154:18]
  assign io_axi_r_bits_id = slvbuf_tag; // @[axi4_to_ahb.scala 156:20]
  assign io_axi_r_bits_data = slvbuf_error ? _T_604 : _T_608; // @[axi4_to_ahb.scala 157:22]
  assign io_axi_r_bits_resp = slave_opc[0] ? 2'h2 : _T_35; // @[axi4_to_ahb.scala 155:22]
  assign io_axi_r_bits_last = 1'h1; // @[axi4_to_ahb.scala 293:22]
  assign io_ahb_out_haddr = {_T_570,_T_574}; // @[axi4_to_ahb.scala 269:20]
  assign io_ahb_out_hburst = 3'h0; // @[axi4_to_ahb.scala 272:21]
  assign io_ahb_out_hmastlock = 1'h0; // @[axi4_to_ahb.scala 273:24]
  assign io_ahb_out_hprot = {{2'd0}, _T_590}; // @[axi4_to_ahb.scala 274:20]
  assign io_ahb_out_hsize = bypass_en ? _T_581 : _T_586; // @[axi4_to_ahb.scala 270:20]
  assign io_ahb_out_htrans = _T_49 ? _T_100 : _GEN_91; // @[axi4_to_ahb.scala 29:21 axi4_to_ahb.scala 172:25 axi4_to_ahb.scala 184:25 axi4_to_ahb.scala 199:25 axi4_to_ahb.scala 209:25 axi4_to_ahb.scala 229:25 axi4_to_ahb.scala 244:25]
  assign io_ahb_out_hwrite = bypass_en ? _T_51 : buf_write; // @[axi4_to_ahb.scala 275:21]
  assign io_ahb_out_hwdata = buf_data; // @[axi4_to_ahb.scala 276:21]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_io_en = wrbuf_en & io_bus_clk_en; // @[lib.scala 402:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_1_io_en = wrbuf_data_en & io_bus_clk_en; // @[lib.scala 402:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_2_io_en = buf_wr_en & io_bus_clk_en; // @[lib.scala 402:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_3_io_en = buf_data_wr_en & io_bus_clk_en; // @[lib.scala 402:17]
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
  dec_tlu_force_halt_bus_q = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  buf_state = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  wrbuf_vld = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wrbuf_data_vld = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ahb_hready_q = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ahb_htrans_q = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  ahb_hwrite_q = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ahb_hresp_q = _RAND_7[0:0];
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
  buf_size = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  buf_write = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  buf_tag = _RAND_26[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    dec_tlu_force_halt_bus_q = 1'h0;
  end
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
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dec_tlu_force_halt_bus_q <= 1'h0;
    end else begin
      dec_tlu_force_halt_bus_q <= _T & dec_tlu_force_halt_bus;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_state <= 3'h0;
    end else if (_T_9) begin
      buf_state <= _T_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else if (_T_642) begin
      wrbuf_vld <= _T_639;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else if (_T_650) begin
      wrbuf_data_vld <= _T_639;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hready_q <= 1'h0;
    end else if (io_bus_clk_en) begin
      ahb_hready_q <= io_ahb_in_hready;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_htrans_q <= 2'h0;
    end else if (io_bus_clk_en) begin
      ahb_htrans_q <= io_ahb_out_htrans;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hwrite_q <= 1'h0;
    end else if (io_bus_clk_en) begin
      ahb_hwrite_q <= io_ahb_out_hwrite;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hresp_q <= 1'h0;
    end else if (io_bus_clk_en) begin
      ahb_hresp_q <= io_ahb_in_hresp;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cmd_doneQ <= 1'h0;
    end else if (_T_716) begin
      cmd_doneQ <= _T_713;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_tag <= 1'h0;
    end else if (_T_655) begin
      wrbuf_tag <= io_axi_aw_bits_id;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_addr <= 32'h0;
    end else if (_T_662) begin
      wrbuf_addr <= io_axi_aw_bits_addr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_size <= 3'h0;
    end else if (_T_655) begin
      wrbuf_size <= io_axi_aw_bits_size;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_byteen <= 8'h0;
    end else if (_T_669) begin
      wrbuf_byteen <= io_axi_w_bits_strb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_data <= 64'h0;
    end else if (_T_665) begin
      wrbuf_data <= io_axi_w_bits_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      slvbuf_write <= 1'h0;
    end else if (_T_702) begin
      slvbuf_write <= buf_write;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      slvbuf_error <= 1'h0;
    end else if (_T_709) begin
      if (_T_49) begin
        slvbuf_error <= 1'h0;
      end else if (_T_101) begin
        slvbuf_error <= 1'h0;
      end else if (_T_136) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_175) begin
        slvbuf_error <= 1'h0;
      end else if (_T_186) begin
        slvbuf_error <= ahb_hresp_q;
      end else if (_T_188) begin
        slvbuf_error <= 1'h0;
      end else begin
        slvbuf_error <= _GEN_7;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      slvbuf_tag <= 1'h0;
    end else if (_T_702) begin
      slvbuf_tag <= buf_tag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      last_bus_addr <= 32'h0;
    end else if (_T_673) begin
      last_bus_addr <= io_ahb_out_haddr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data <= 64'h0;
    end else if (_T_698) begin
      if (_T_489) begin
        buf_data <= ahb_hrdata_q;
      end else begin
        buf_data <= wrbuf_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ahb_hrdata_q <= 64'h0;
    end else if (ahbm_data_clken) begin
      ahb_hrdata_q <= io_ahb_in_hrdata;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_addr <= 32'h0;
    end else if (_T_683) begin
      buf_addr <= buf_addr_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_cmd_byte_ptrQ <= 3'h0;
    end else if (_T_721) begin
      if (_T_49) begin
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
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end else begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end
      end else if (_T_101) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_136) begin
        if (bypass_en) begin
          buf_cmd_byte_ptrQ <= master_addr[2:0];
        end else begin
          buf_cmd_byte_ptrQ <= buf_addr[2:0];
        end
      end else if (_T_175) begin
        buf_cmd_byte_ptrQ <= buf_addr[2:0];
      end else if (_T_186) begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end else if (_T_188) begin
        if (trxn_done) begin
          if (_T_201) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (_T_204) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_207) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_210) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_213) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_216) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_219) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end
      end else if (_T_281) begin
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
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end else if (trxn_done) begin
          if (_T_201) begin
            buf_cmd_byte_ptrQ <= 3'h0;
          end else if (_T_204) begin
            buf_cmd_byte_ptrQ <= 3'h1;
          end else if (_T_207) begin
            buf_cmd_byte_ptrQ <= 3'h2;
          end else if (_T_210) begin
            buf_cmd_byte_ptrQ <= 3'h3;
          end else if (_T_213) begin
            buf_cmd_byte_ptrQ <= 3'h4;
          end else if (_T_216) begin
            buf_cmd_byte_ptrQ <= 3'h5;
          end else if (_T_219) begin
            buf_cmd_byte_ptrQ <= 3'h6;
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
          end
        end
      end else begin
        buf_cmd_byte_ptrQ <= 3'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_byteen <= 8'h0;
    end else if (_T_676) begin
      buf_byteen <= wrbuf_byteen;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_aligned <= 1'h0;
    end else if (_T_676) begin
      buf_aligned <= buf_aligned_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_size <= 2'h0;
    end else if (_T_676) begin
      buf_size <= buf_size_in[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_write <= 1'h0;
    end else if (_T_676) begin
      if (_T_49) begin
        buf_write <= _T_51;
      end else if (_T_101) begin
        buf_write <= 1'h0;
      end else if (_T_136) begin
        buf_write <= 1'h0;
      end else if (_T_175) begin
        buf_write <= 1'h0;
      end else if (_T_186) begin
        buf_write <= 1'h0;
      end else if (_T_188) begin
        buf_write <= 1'h0;
      end else begin
        buf_write <= _GEN_9;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_tag <= 1'h0;
    end else if (_T_676) begin
      if (wr_cmd_vld) begin
        buf_tag <= wrbuf_tag;
      end else begin
        buf_tag <= io_axi_ar_bits_id;
      end
    end
  end
endmodule
