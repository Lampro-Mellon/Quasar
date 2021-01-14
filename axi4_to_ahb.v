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
  wire  _T_47 = 3'h0 == buf_state; // @[Conditional.scala 37:30]
  reg  wrbuf_vld; // @[Reg.scala 27:20]
  reg  wrbuf_data_vld; // @[Reg.scala 27:20]
  wire  wr_cmd_vld = wrbuf_vld & wrbuf_data_vld; // @[axi4_to_ahb.scala 140:27]
  wire  master_valid = wr_cmd_vld | io_axi_ar_valid; // @[axi4_to_ahb.scala 141:30]
  wire  _T_99 = 3'h1 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hready_q; // @[Reg.scala 27:20]
  reg [1:0] ahb_htrans_q; // @[Reg.scala 27:20]
  wire  _T_106 = ahb_htrans_q != 2'h0; // @[axi4_to_ahb.scala 177:58]
  wire  _T_107 = ahb_hready_q & _T_106; // @[axi4_to_ahb.scala 177:36]
  reg  ahb_hwrite_q; // @[Reg.scala 27:20]
  wire  _T_108 = ~ahb_hwrite_q; // @[axi4_to_ahb.scala 177:72]
  wire  _T_109 = _T_107 & _T_108; // @[axi4_to_ahb.scala 177:70]
  wire  _T_134 = 3'h6 == buf_state; // @[Conditional.scala 37:30]
  reg  ahb_hresp_q; // @[Reg.scala 27:20]
  wire  _T_154 = ahb_hready_q | ahb_hresp_q; // @[axi4_to_ahb.scala 191:37]
  wire  _T_173 = 3'h7 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_184 = 3'h3 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_186 = 3'h2 == buf_state; // @[Conditional.scala 37:30]
  wire  _T_187 = ahb_hready_q & ahb_hwrite_q; // @[axi4_to_ahb.scala 223:33]
  wire  _T_190 = _T_187 & _T_106; // @[axi4_to_ahb.scala 223:48]
  wire  _T_279 = 3'h4 == buf_state; // @[Conditional.scala 37:30]
  wire  _GEN_16 = _T_279 & _T_190; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_186 ? _T_190 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_184 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_173 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_134 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_99 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67]
  wire  trxn_done = _T_47 ? 1'h0 : _GEN_96; // @[Conditional.scala 40:58]
  reg  cmd_doneQ; // @[Reg.scala 27:20]
  wire  _T_280 = cmd_doneQ & ahb_hready_q; // @[axi4_to_ahb.scala 233:34]
  wire  _T_281 = _T_280 | ahb_hresp_q; // @[axi4_to_ahb.scala 233:50]
  wire  _T_438 = 3'h5 == buf_state; // @[Conditional.scala 37:30]
  wire  slave_ready = io_axi_b_ready & io_axi_r_ready; // @[axi4_to_ahb.scala 158:33]
  wire  _GEN_2 = _T_438 & slave_ready; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_279 ? _T_281 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_186 ? trxn_done : _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_184 ? _T_154 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_173 ? _T_109 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_134 ? _T_154 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_99 ? _T_109 : _GEN_70; // @[Conditional.scala 39:67]
  wire  buf_state_en = _T_47 ? master_valid : _GEN_84; // @[Conditional.scala 40:58]
  wire  _T_4 = ~dec_tlu_force_halt_bus; // @[lib.scala 391:75]
  wire [1:0] _T_17 = wr_cmd_vld ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 143:20]
  wire [2:0] master_opc = {{1'd0}, _T_17}; // @[axi4_to_ahb.scala 143:14]
  wire  _T_49 = master_opc[2:1] == 2'h1; // @[axi4_to_ahb.scala 163:41]
  wire  _GEN_9 = _T_279 & _T_49; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_186 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_184 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_173 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_134 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_99 ? 1'h0 : _GEN_82; // @[Conditional.scala 39:67]
  wire  buf_write_in = _T_47 ? _T_49 : _GEN_98; // @[Conditional.scala 40:58]
  wire [2:0] _T_51 = buf_write_in ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 164:26]
  wire  _T_101 = master_opc == 3'h0; // @[axi4_to_ahb.scala 176:61]
  wire  _T_102 = master_valid & _T_101; // @[axi4_to_ahb.scala 176:41]
  wire [2:0] _T_104 = _T_102 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 176:26]
  wire  _T_122 = _T_104 == 3'h6; // @[axi4_to_ahb.scala 180:174]
  wire  _T_123 = _T_109 & _T_122; // @[axi4_to_ahb.scala 180:88]
  wire  _T_135 = ~ahb_hresp_q; // @[axi4_to_ahb.scala 188:39]
  wire  _T_136 = ahb_hready_q & _T_135; // @[axi4_to_ahb.scala 188:37]
  wire  _T_139 = master_valid & _T_49; // @[axi4_to_ahb.scala 188:70]
  wire  _T_140 = ~_T_139; // @[axi4_to_ahb.scala 188:55]
  wire  _T_141 = _T_136 & _T_140; // @[axi4_to_ahb.scala 188:53]
  wire  _T_283 = buf_state_en & _T_135; // @[axi4_to_ahb.scala 234:36]
  wire  _T_284 = _T_283 & slave_ready; // @[axi4_to_ahb.scala 234:51]
  wire  _GEN_5 = _T_279 & _T_284; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_186 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_184 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_173 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_134 ? _T_141 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_99 ? _T_123 : _GEN_67; // @[Conditional.scala 39:67]
  wire  master_ready = _T_47 | _GEN_87; // @[Conditional.scala 40:58]
  wire  _T_147 = master_valid & master_ready; // @[axi4_to_ahb.scala 190:82]
  wire  _T_150 = _T_147 & _T_101; // @[axi4_to_ahb.scala 190:97]
  wire [2:0] _T_152 = _T_150 ? 3'h6 : 3'h3; // @[axi4_to_ahb.scala 190:67]
  wire [2:0] _T_153 = ahb_hresp_q ? 3'h7 : _T_152; // @[axi4_to_ahb.scala 190:26]
  wire  _T_285 = ~slave_ready; // @[axi4_to_ahb.scala 235:42]
  wire  _T_286 = ahb_hresp_q | _T_285; // @[axi4_to_ahb.scala 235:40]
  wire [2:0] _T_291 = _T_49 ? 3'h2 : 3'h1; // @[axi4_to_ahb.scala 235:101]
  wire [2:0] _T_292 = master_valid ? _T_291 : 3'h0; // @[axi4_to_ahb.scala 235:66]
  wire [2:0] _T_293 = _T_286 ? 3'h5 : _T_292; // @[axi4_to_ahb.scala 235:26]
  wire [2:0] _GEN_6 = _T_279 ? _T_293 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_19 = _T_186 ? 3'h4 : _GEN_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_35 = _T_184 ? 3'h5 : _GEN_19; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_51 = _T_173 ? 3'h3 : _GEN_35; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_69 = _T_134 ? _T_153 : _GEN_51; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_83 = _T_99 ? _T_104 : _GEN_69; // @[Conditional.scala 39:67]
  wire [2:0] buf_nxtstate = _T_47 ? _T_51 : _GEN_83; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_141 = {{2'd0}, _T_4}; // @[lib.scala 391:53]
  wire [2:0] _T_5 = buf_nxtstate & _GEN_141; // @[lib.scala 391:53]
  wire  _T_6 = buf_state_en | dec_tlu_force_halt_bus; // @[lib.scala 391:95]
  wire  _T_7 = _T_6 & io_bus_clk_en; // @[lib.scala 391:102]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg [31:0] wrbuf_addr; // @[Reg.scala 27:20]
  wire [31:0] master_addr = wr_cmd_vld ? wrbuf_addr : io_axi_ar_bits_addr; // @[axi4_to_ahb.scala 144:21]
  reg [2:0] wrbuf_size; // @[Reg.scala 27:20]
  wire [2:0] master_size = wr_cmd_vld ? wrbuf_size : io_axi_ar_bits_size; // @[axi4_to_ahb.scala 145:21]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] wrbuf_data; // @[Reg.scala 27:20]
  wire  _T_356 = buf_nxtstate != 3'h5; // @[axi4_to_ahb.scala 245:55]
  wire  _T_357 = buf_state_en & _T_356; // @[axi4_to_ahb.scala 245:39]
  wire  _GEN_15 = _T_279 ? _T_357 : _T_438; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_186 ? 1'h0 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_184 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_173 ? buf_state_en : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_134 ? _T_283 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_99 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  slave_valid_pre = _T_47 ? 1'h0 : _GEN_95; // @[Conditional.scala 40:58]
  wire  _T_28 = slave_valid_pre & slave_ready; // @[axi4_to_ahb.scala 150:33]
  reg  slvbuf_write; // @[Reg.scala 27:20]
  wire [1:0] _T_595 = slvbuf_write ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 279:23]
  reg  slvbuf_error; // @[Reg.scala 27:20]
  wire [1:0] _T_597 = slvbuf_error ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_598 = _T_597 & 2'h2; // @[axi4_to_ahb.scala 279:88]
  wire [3:0] slave_opc = {_T_595,_T_598}; // @[Cat.scala 29:58]
  wire [1:0] _T_33 = slave_opc[1] ? 2'h3 : 2'h0; // @[axi4_to_ahb.scala 151:55]
  reg  slvbuf_tag; // @[Reg.scala 27:20]
  wire  _T_38 = slave_opc[3:2] == 2'h0; // @[axi4_to_ahb.scala 154:66]
  reg [31:0] last_bus_addr; // @[Reg.scala 27:20]
  wire [63:0] _T_602 = {last_bus_addr,last_bus_addr}; // @[Cat.scala 29:58]
  wire  _T_603 = buf_state == 3'h5; // @[axi4_to_ahb.scala 280:91]
  reg [63:0] buf_data; // @[Reg.scala 27:20]
  reg [63:0] ahb_hrdata_q; // @[Reg.scala 27:20]
  wire [63:0] _T_606 = _T_603 ? buf_data : ahb_hrdata_q; // @[axi4_to_ahb.scala 280:79]
  wire  _T_53 = buf_nxtstate == 3'h2; // @[axi4_to_ahb.scala 167:54]
  wire  _T_54 = buf_state_en & _T_53; // @[axi4_to_ahb.scala 167:38]
  wire [2:0] _T_85 = wrbuf_byteen[6] ? 3'h6 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_86 = wrbuf_byteen[5] ? 3'h5 : _T_85; // @[Mux.scala 98:16]
  wire [2:0] _T_87 = wrbuf_byteen[4] ? 3'h4 : _T_86; // @[Mux.scala 98:16]
  wire [2:0] _T_88 = wrbuf_byteen[3] ? 3'h3 : _T_87; // @[Mux.scala 98:16]
  wire [2:0] _T_89 = wrbuf_byteen[2] ? 3'h2 : _T_88; // @[Mux.scala 98:16]
  wire [2:0] _T_90 = wrbuf_byteen[1] ? 3'h1 : _T_89; // @[Mux.scala 98:16]
  wire [2:0] _T_91 = wrbuf_byteen[0] ? 3'h0 : _T_90; // @[Mux.scala 98:16]
  wire [2:0] _T_93 = buf_write_in ? _T_91 : master_addr[2:0]; // @[axi4_to_ahb.scala 169:30]
  wire  _T_94 = buf_nxtstate == 3'h1; // @[axi4_to_ahb.scala 171:51]
  wire  _T_124 = master_ready & master_valid; // @[axi4_to_ahb.scala 182:33]
  wire  _T_160 = buf_nxtstate == 3'h6; // @[axi4_to_ahb.scala 197:64]
  wire  _T_161 = _T_124 & _T_160; // @[axi4_to_ahb.scala 197:48]
  wire  _T_162 = _T_161 & buf_state_en; // @[axi4_to_ahb.scala 197:79]
  wire  _T_347 = buf_state_en & buf_write_in; // @[axi4_to_ahb.scala 243:33]
  wire  _T_349 = _T_347 & _T_53; // @[axi4_to_ahb.scala 243:48]
  wire  _GEN_13 = _T_279 & _T_349; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_186 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_184 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_173 ? 1'h0 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_134 ? _T_162 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_89 = _T_99 ? _T_124 : _GEN_76; // @[Conditional.scala 39:67]
  wire  bypass_en = _T_47 ? buf_state_en : _GEN_89; // @[Conditional.scala 40:58]
  wire [1:0] _T_97 = bypass_en ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_98 = _T_97 & 2'h2; // @[axi4_to_ahb.scala 172:49]
  wire  _T_110 = ~master_valid; // @[axi4_to_ahb.scala 178:34]
  wire  _T_111 = buf_state_en & _T_110; // @[axi4_to_ahb.scala 178:32]
  reg [31:0] buf_addr; // @[Reg.scala 27:20]
  wire [2:0] _T_128 = bypass_en ? master_addr[2:0] : buf_addr[2:0]; // @[axi4_to_ahb.scala 183:30]
  wire  _T_129 = ~buf_state_en; // @[axi4_to_ahb.scala 184:48]
  wire  _T_130 = _T_129 | bypass_en; // @[axi4_to_ahb.scala 184:62]
  wire [1:0] _T_132 = _T_130 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_133 = 2'h2 & _T_132; // @[axi4_to_ahb.scala 184:36]
  wire  _T_167 = buf_nxtstate != 3'h6; // @[axi4_to_ahb.scala 199:63]
  wire  _T_168 = _T_167 & buf_state_en; // @[axi4_to_ahb.scala 199:78]
  wire  _T_169 = ~_T_168; // @[axi4_to_ahb.scala 199:47]
  wire [1:0] _T_171 = _T_169 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_172 = 2'h2 & _T_171; // @[axi4_to_ahb.scala 199:36]
  wire [1:0] _T_182 = _T_129 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_183 = 2'h2 & _T_182; // @[axi4_to_ahb.scala 209:41]
  reg [2:0] buf_cmd_byte_ptrQ; // @[Reg.scala 27:20]
  reg [7:0] buf_byteen; // @[Reg.scala 27:20]
  wire [2:0] _T_195 = buf_cmd_byte_ptrQ + 3'h1; // @[axi4_to_ahb.scala 136:52]
  wire  _T_198 = 3'h0 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_199 = buf_byteen[0] & _T_198; // @[axi4_to_ahb.scala 137:48]
  wire  _T_201 = 3'h1 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_202 = buf_byteen[1] & _T_201; // @[axi4_to_ahb.scala 137:48]
  wire  _T_204 = 3'h2 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_205 = buf_byteen[2] & _T_204; // @[axi4_to_ahb.scala 137:48]
  wire  _T_207 = 3'h3 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_208 = buf_byteen[3] & _T_207; // @[axi4_to_ahb.scala 137:48]
  wire  _T_210 = 3'h4 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_211 = buf_byteen[4] & _T_210; // @[axi4_to_ahb.scala 137:48]
  wire  _T_213 = 3'h5 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_214 = buf_byteen[5] & _T_213; // @[axi4_to_ahb.scala 137:48]
  wire  _T_216 = 3'h6 >= _T_195; // @[axi4_to_ahb.scala 137:62]
  wire  _T_217 = buf_byteen[6] & _T_216; // @[axi4_to_ahb.scala 137:48]
  wire [2:0] _T_222 = _T_217 ? 3'h6 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_223 = _T_214 ? 3'h5 : _T_222; // @[Mux.scala 98:16]
  wire [2:0] _T_224 = _T_211 ? 3'h4 : _T_223; // @[Mux.scala 98:16]
  wire [2:0] _T_225 = _T_208 ? 3'h3 : _T_224; // @[Mux.scala 98:16]
  wire [2:0] _T_226 = _T_205 ? 3'h2 : _T_225; // @[Mux.scala 98:16]
  wire [2:0] _T_227 = _T_202 ? 3'h1 : _T_226; // @[Mux.scala 98:16]
  wire [2:0] _T_228 = _T_199 ? 3'h0 : _T_227; // @[Mux.scala 98:16]
  wire [2:0] _T_229 = trxn_done ? _T_228 : buf_cmd_byte_ptrQ; // @[axi4_to_ahb.scala 227:30]
  wire  _T_230 = buf_cmd_byte_ptrQ == 3'h7; // @[axi4_to_ahb.scala 228:65]
  reg  buf_aligned; // @[Reg.scala 27:20]
  wire  _T_231 = buf_aligned | _T_230; // @[axi4_to_ahb.scala 228:44]
  wire [7:0] _T_269 = buf_byteen >> _T_228; // @[axi4_to_ahb.scala 228:92]
  wire  _T_271 = ~_T_269[0]; // @[axi4_to_ahb.scala 228:163]
  wire  _T_272 = _T_231 | _T_271; // @[axi4_to_ahb.scala 228:79]
  wire  _T_273 = trxn_done & _T_272; // @[axi4_to_ahb.scala 228:29]
  wire  _T_344 = _T_230 | _T_271; // @[axi4_to_ahb.scala 242:38]
  wire  _T_345 = _T_107 & _T_344; // @[axi4_to_ahb.scala 241:79]
  wire  _T_346 = ahb_hresp_q | _T_345; // @[axi4_to_ahb.scala 241:32]
  wire  _GEN_12 = _T_279 & _T_346; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_186 ? _T_273 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_184 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_173 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_134 ? _T_111 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_99 ? _T_111 : _GEN_75; // @[Conditional.scala 39:67]
  wire  cmd_done = _T_47 ? 1'h0 : _GEN_85; // @[Conditional.scala 40:58]
  wire  _T_274 = cmd_done | cmd_doneQ; // @[axi4_to_ahb.scala 229:47]
  wire  _T_275 = ~_T_274; // @[axi4_to_ahb.scala 229:36]
  wire [1:0] _T_277 = _T_275 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_278 = _T_277 & 2'h2; // @[axi4_to_ahb.scala 229:61]
  wire  _T_298 = _T_53 | _T_94; // @[axi4_to_ahb.scala 239:62]
  wire  _T_299 = buf_state_en & _T_298; // @[axi4_to_ahb.scala 239:33]
  wire  _T_352 = _T_275 | bypass_en; // @[axi4_to_ahb.scala 244:61]
  wire [1:0] _T_354 = _T_352 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_355 = _T_354 & 2'h2; // @[axi4_to_ahb.scala 244:75]
  wire  _T_362 = trxn_done | bypass_en; // @[axi4_to_ahb.scala 247:40]
  wire [2:0] _T_437 = bypass_en ? _T_91 : _T_229; // @[axi4_to_ahb.scala 248:30]
  wire  _GEN_7 = _T_279 & ahb_hresp_q; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_279 ? buf_state_en : _T_438; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_279 & _T_299; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_186 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_184 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_173 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_134 ? _T_150 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_99 ? master_ready : _GEN_68; // @[Conditional.scala 39:67]
  wire  buf_wr_en = _T_47 ? buf_state_en : _GEN_88; // @[Conditional.scala 40:58]
  wire  _GEN_11 = _T_279 & buf_wr_en; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_14 = _T_279 ? _T_355 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_279 & _T_362; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_18 = _T_279 ? _T_437 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_186 ? buf_state_en : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_186 & buf_state_en; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_24 = _T_186 ? _T_229 : _GEN_18; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_26 = _T_186 ? _T_278 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_186 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_186 ? 1'h0 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_184 ? buf_state_en : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_184 ? buf_state_en : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_184 ? buf_state_en : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_184 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_43 = _T_184 ? 3'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_45 = _T_184 ? 2'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_173 ? buf_state_en : _GEN_40; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_55 = _T_173 ? buf_addr[2:0] : _GEN_43; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_56 = _T_173 ? _T_183 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_173 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_173 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_173 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_134 ? buf_state_en : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_134 ? buf_state_en : _GEN_59; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_77 = _T_134 ? _T_128 : _GEN_55; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_78 = _T_134 ? _T_172 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_134 ? buf_wr_en : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_134 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_99 ? buf_state_en : _GEN_79; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_90 = _T_99 ? _T_128 : _GEN_77; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_91 = _T_99 ? _T_133 : _GEN_78; // @[Conditional.scala 39:67]
  wire  _GEN_92 = _T_99 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_99 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_99 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  buf_data_wr_en = _T_47 ? _T_54 : _GEN_92; // @[Conditional.scala 40:58]
  wire  buf_cmd_byte_ptr_en = _T_47 ? buf_state_en : _GEN_97; // @[Conditional.scala 40:58]
  wire [2:0] buf_cmd_byte_ptr = _T_47 ? _T_93 : _GEN_90; // @[Conditional.scala 40:58]
  wire  slvbuf_wr_en = _T_47 ? 1'h0 : _GEN_86; // @[Conditional.scala 40:58]
  wire  slvbuf_error_en = _T_47 ? 1'h0 : _GEN_94; // @[Conditional.scala 40:58]
  wire  _T_533 = master_size[1:0] == 2'h0; // @[axi4_to_ahb.scala 265:24]
  wire  _T_534 = _T_101 | _T_533; // @[axi4_to_ahb.scala 264:48]
  wire  _T_536 = master_size[1:0] == 2'h1; // @[axi4_to_ahb.scala 265:54]
  wire  _T_537 = _T_534 | _T_536; // @[axi4_to_ahb.scala 265:33]
  wire  _T_539 = master_size[1:0] == 2'h2; // @[axi4_to_ahb.scala 265:93]
  wire  _T_540 = _T_537 | _T_539; // @[axi4_to_ahb.scala 265:72]
  wire  _T_542 = master_size[1:0] == 2'h3; // @[axi4_to_ahb.scala 266:25]
  wire  _T_544 = wrbuf_byteen == 8'h3; // @[axi4_to_ahb.scala 266:62]
  wire  _T_546 = wrbuf_byteen == 8'hc; // @[axi4_to_ahb.scala 266:97]
  wire  _T_547 = _T_544 | _T_546; // @[axi4_to_ahb.scala 266:74]
  wire  _T_549 = wrbuf_byteen == 8'h30; // @[axi4_to_ahb.scala 266:132]
  wire  _T_550 = _T_547 | _T_549; // @[axi4_to_ahb.scala 266:109]
  wire  _T_552 = wrbuf_byteen == 8'hc0; // @[axi4_to_ahb.scala 266:168]
  wire  _T_553 = _T_550 | _T_552; // @[axi4_to_ahb.scala 266:145]
  wire  _T_555 = wrbuf_byteen == 8'hf; // @[axi4_to_ahb.scala 267:28]
  wire  _T_556 = _T_553 | _T_555; // @[axi4_to_ahb.scala 266:181]
  wire  _T_558 = wrbuf_byteen == 8'hf0; // @[axi4_to_ahb.scala 267:63]
  wire  _T_559 = _T_556 | _T_558; // @[axi4_to_ahb.scala 267:40]
  wire  _T_561 = wrbuf_byteen == 8'hff; // @[axi4_to_ahb.scala 267:99]
  wire  _T_562 = _T_559 | _T_561; // @[axi4_to_ahb.scala 267:76]
  wire  _T_563 = _T_542 & _T_562; // @[axi4_to_ahb.scala 266:38]
  wire  buf_aligned_in = _T_540 | _T_563; // @[axi4_to_ahb.scala 265:106]
  wire  _T_442 = buf_aligned_in & _T_49; // @[axi4_to_ahb.scala 259:62]
  wire [2:0] _T_459 = _T_546 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_460 = 3'h2 & _T_459; // @[axi4_to_ahb.scala 128:15]
  wire  _T_466 = _T_558 | _T_544; // @[axi4_to_ahb.scala 129:56]
  wire [2:0] _T_468 = _T_466 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_469 = 3'h4 & _T_468; // @[axi4_to_ahb.scala 129:15]
  wire [2:0] _T_470 = _T_460 | _T_469; // @[axi4_to_ahb.scala 128:63]
  wire [2:0] _T_474 = _T_552 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_475 = 3'h6 & _T_474; // @[axi4_to_ahb.scala 130:15]
  wire [2:0] _T_476 = _T_470 | _T_475; // @[axi4_to_ahb.scala 129:96]
  wire [2:0] _T_483 = _T_442 ? _T_476 : master_addr[2:0]; // @[axi4_to_ahb.scala 259:45]
  wire [31:0] buf_addr_in = {master_addr[31:3],_T_483}; // @[Cat.scala 29:58]
  wire  _T_487 = buf_state == 3'h3; // @[axi4_to_ahb.scala 262:33]
  wire  _T_493 = buf_aligned_in & _T_542; // @[axi4_to_ahb.scala 263:38]
  wire  _T_496 = _T_493 & _T_49; // @[axi4_to_ahb.scala 263:72]
  wire [1:0] _T_502 = _T_561 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_508 = _T_558 | _T_555; // @[axi4_to_ahb.scala 121:55]
  wire [1:0] _T_510 = _T_508 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_511 = 2'h2 & _T_510; // @[axi4_to_ahb.scala 121:16]
  wire [1:0] _T_512 = _T_502 | _T_511; // @[axi4_to_ahb.scala 120:64]
  wire  _T_517 = _T_552 | _T_549; // @[axi4_to_ahb.scala 122:60]
  wire  _T_520 = _T_517 | _T_546; // @[axi4_to_ahb.scala 122:89]
  wire  _T_523 = _T_520 | _T_544; // @[axi4_to_ahb.scala 122:123]
  wire [1:0] _T_525 = _T_523 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_526 = 2'h1 & _T_525; // @[axi4_to_ahb.scala 122:21]
  wire [1:0] _T_527 = _T_512 | _T_526; // @[axi4_to_ahb.scala 121:93]
  wire [1:0] _T_529 = _T_496 ? _T_527 : master_size[1:0]; // @[axi4_to_ahb.scala 263:21]
  wire [28:0] _T_568 = bypass_en ? master_addr[31:3] : buf_addr[31:3]; // @[axi4_to_ahb.scala 269:30]
  wire  _T_569 = io_ahb_out_htrans == 2'h2; // @[axi4_to_ahb.scala 269:115]
  wire [2:0] _T_571 = _T_569 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_572 = _T_571 & buf_cmd_byte_ptr; // @[axi4_to_ahb.scala 269:124]
  wire [1:0] _T_576 = buf_aligned_in ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] buf_size_in = {{1'd0}, _T_529}; // @[axi4_to_ahb.scala 263:15]
  wire [1:0] _T_578 = _T_576 & buf_size_in[1:0]; // @[axi4_to_ahb.scala 270:81]
  wire [2:0] _T_579 = {1'h0,_T_578}; // @[Cat.scala 29:58]
  wire [1:0] _T_581 = buf_aligned ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg [1:0] buf_size; // @[Reg.scala 27:20]
  wire [1:0] _T_583 = _T_581 & buf_size; // @[axi4_to_ahb.scala 270:138]
  wire [2:0] _T_584 = {1'h0,_T_583}; // @[Cat.scala 29:58]
  wire  _T_587 = ~io_axi_ar_bits_prot[2]; // @[axi4_to_ahb.scala 274:37]
  wire [1:0] _T_588 = {1'h1,_T_587}; // @[Cat.scala 29:58]
  reg  buf_write; // @[Reg.scala 27:20]
  wire  _T_610 = io_ahb_out_htrans != 2'h0; // @[axi4_to_ahb.scala 283:44]
  wire  _T_611 = _T_610 & io_ahb_in_hready; // @[axi4_to_ahb.scala 283:56]
  wire  last_addr_en = _T_611 & io_ahb_out_hwrite; // @[axi4_to_ahb.scala 283:75]
  wire  _T_613 = io_axi_aw_valid & io_axi_aw_ready; // @[axi4_to_ahb.scala 285:31]
  wire  wrbuf_en = _T_613 & master_ready; // @[axi4_to_ahb.scala 285:49]
  wire  _T_615 = io_axi_w_valid & io_axi_w_ready; // @[axi4_to_ahb.scala 286:35]
  wire  wrbuf_data_en = _T_615 & master_ready; // @[axi4_to_ahb.scala 286:52]
  wire  wrbuf_cmd_sent = _T_147 & _T_49; // @[axi4_to_ahb.scala 287:49]
  wire  _T_621 = ~wrbuf_en; // @[axi4_to_ahb.scala 288:34]
  wire  _T_622 = wrbuf_cmd_sent & _T_621; // @[axi4_to_ahb.scala 288:32]
  wire  wrbuf_rst = _T_622 | dec_tlu_force_halt_bus; // @[axi4_to_ahb.scala 288:45]
  wire  _T_624 = ~wrbuf_cmd_sent; // @[axi4_to_ahb.scala 290:36]
  wire  _T_625 = wrbuf_vld & _T_624; // @[axi4_to_ahb.scala 290:34]
  wire  _T_626 = ~_T_625; // @[axi4_to_ahb.scala 290:22]
  wire  _T_629 = wrbuf_data_vld & _T_624; // @[axi4_to_ahb.scala 291:38]
  wire  _T_630 = ~_T_629; // @[axi4_to_ahb.scala 291:21]
  wire  _T_633 = ~wr_cmd_vld; // @[axi4_to_ahb.scala 292:22]
  wire  _T_637 = ~wrbuf_rst; // @[lib.scala 391:75]
  wire  _T_639 = wrbuf_en | wrbuf_rst; // @[lib.scala 391:95]
  wire  _T_640 = _T_639 & io_bus_clk_en; // @[lib.scala 391:102]
  wire  _T_647 = wrbuf_data_en | wrbuf_rst; // @[lib.scala 391:95]
  wire  _T_648 = _T_647 & io_bus_clk_en; // @[lib.scala 391:102]
  wire  _T_653 = io_bus_clk_en & wrbuf_en; // @[lib.scala 383:57]
  wire  _T_660 = wrbuf_en & io_bus_clk_en; // @[axi4_to_ahb.scala 299:61]
  wire  _T_663 = wrbuf_data_en & io_bus_clk_en; // @[axi4_to_ahb.scala 300:65]
  wire  _T_667 = io_bus_clk_en & wrbuf_data_en; // @[lib.scala 383:57]
  wire  _T_671 = io_bus_clk_en & last_addr_en; // @[lib.scala 383:57]
  wire  _T_728 = buf_wr_en | slvbuf_wr_en; // @[axi4_to_ahb.scala 320:51]
  wire  _T_729 = _T_728 | io_clk_override; // @[axi4_to_ahb.scala 320:66]
  wire  buf_clken = io_bus_clk_en & _T_729; // @[axi4_to_ahb.scala 320:38]
  wire  _T_674 = buf_clken & buf_wr_en; // @[lib.scala 383:57]
  reg  buf_tag; // @[Reg.scala 27:20]
  wire  _T_681 = buf_wr_en & io_bus_clk_en; // @[axi4_to_ahb.scala 305:62]
  wire  _T_696 = buf_data_wr_en & io_bus_clk_en; // @[axi4_to_ahb.scala 309:67]
  wire  _T_700 = buf_clken & slvbuf_wr_en; // @[lib.scala 383:57]
  wire  _T_707 = io_bus_clk_en & slvbuf_error_en; // @[lib.scala 383:57]
  wire  _T_711 = ~slave_valid_pre; // @[lib.scala 391:75]
  wire  _T_713 = cmd_done | slave_valid_pre; // @[lib.scala 391:95]
  wire  _T_714 = _T_713 & io_bus_clk_en; // @[lib.scala 391:102]
  wire  _T_719 = io_bus_clk_en & buf_cmd_byte_ptr_en; // @[lib.scala 383:57]
  wire  _T_731 = buf_state != 3'h0; // @[axi4_to_ahb.scala 321:52]
  wire  _T_732 = _T_731 | io_clk_override; // @[axi4_to_ahb.scala 321:62]
  wire  ahbm_data_clken = io_bus_clk_en & _T_732; // @[axi4_to_ahb.scala 321:38]
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
  assign io_axi_aw_ready = _T_626 & master_ready; // @[axi4_to_ahb.scala 290:19]
  assign io_axi_w_ready = _T_630 & master_ready; // @[axi4_to_ahb.scala 291:18]
  assign io_axi_b_valid = _T_28 & slave_opc[3]; // @[axi4_to_ahb.scala 150:18]
  assign io_axi_b_bits_resp = slave_opc[0] ? 2'h2 : _T_33; // @[axi4_to_ahb.scala 151:22]
  assign io_axi_b_bits_id = slvbuf_tag; // @[axi4_to_ahb.scala 152:20]
  assign io_axi_ar_ready = _T_633 & master_ready; // @[axi4_to_ahb.scala 292:19]
  assign io_axi_r_valid = _T_28 & _T_38; // @[axi4_to_ahb.scala 154:18]
  assign io_axi_r_bits_id = slvbuf_tag; // @[axi4_to_ahb.scala 156:20]
  assign io_axi_r_bits_data = slvbuf_error ? _T_602 : _T_606; // @[axi4_to_ahb.scala 157:22]
  assign io_axi_r_bits_resp = slave_opc[0] ? 2'h2 : _T_33; // @[axi4_to_ahb.scala 155:22]
  assign io_axi_r_bits_last = 1'h1; // @[axi4_to_ahb.scala 293:22]
  assign io_ahb_out_haddr = {_T_568,_T_572}; // @[axi4_to_ahb.scala 269:20]
  assign io_ahb_out_hburst = 3'h0; // @[axi4_to_ahb.scala 272:21]
  assign io_ahb_out_hmastlock = 1'h0; // @[axi4_to_ahb.scala 273:24]
  assign io_ahb_out_hprot = {{2'd0}, _T_588}; // @[axi4_to_ahb.scala 274:20]
  assign io_ahb_out_hsize = bypass_en ? _T_579 : _T_584; // @[axi4_to_ahb.scala 270:20]
  assign io_ahb_out_htrans = _T_47 ? _T_98 : _GEN_91; // @[axi4_to_ahb.scala 29:21 axi4_to_ahb.scala 172:25 axi4_to_ahb.scala 184:25 axi4_to_ahb.scala 199:25 axi4_to_ahb.scala 209:25 axi4_to_ahb.scala 229:25 axi4_to_ahb.scala 244:25]
  assign io_ahb_out_hwrite = bypass_en ? _T_49 : buf_write; // @[axi4_to_ahb.scala 275:21]
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
    end else if (_T_7) begin
      buf_state <= _T_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else if (_T_640) begin
      wrbuf_vld <= _T_637;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else if (_T_648) begin
      wrbuf_data_vld <= _T_637;
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
    end else if (_T_714) begin
      cmd_doneQ <= _T_711;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_tag <= 1'h0;
    end else if (_T_653) begin
      wrbuf_tag <= io_axi_aw_bits_id;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_addr <= 32'h0;
    end else if (_T_660) begin
      wrbuf_addr <= io_axi_aw_bits_addr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_size <= 3'h0;
    end else if (_T_653) begin
      wrbuf_size <= io_axi_aw_bits_size;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_byteen <= 8'h0;
    end else if (_T_667) begin
      wrbuf_byteen <= io_axi_w_bits_strb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrbuf_data <= 64'h0;
    end else if (_T_663) begin
      wrbuf_data <= io_axi_w_bits_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      slvbuf_write <= 1'h0;
    end else if (_T_700) begin
      slvbuf_write <= buf_write;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      slvbuf_error <= 1'h0;
    end else if (_T_707) begin
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
        slvbuf_error <= _GEN_7;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      slvbuf_tag <= 1'h0;
    end else if (_T_700) begin
      slvbuf_tag <= buf_tag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      last_bus_addr <= 32'h0;
    end else if (_T_671) begin
      last_bus_addr <= io_ahb_out_haddr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data <= 64'h0;
    end else if (_T_696) begin
      if (_T_487) begin
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
    end else if (_T_681) begin
      buf_addr <= buf_addr_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_cmd_byte_ptrQ <= 3'h0;
    end else if (_T_719) begin
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
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
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
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
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
          end else begin
            buf_cmd_byte_ptrQ <= 3'h7;
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
    end else if (_T_674) begin
      buf_byteen <= wrbuf_byteen;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_aligned <= 1'h0;
    end else if (_T_674) begin
      buf_aligned <= buf_aligned_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_size <= 2'h0;
    end else if (_T_674) begin
      buf_size <= buf_size_in[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_write <= 1'h0;
    end else if (_T_674) begin
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
        buf_write <= _GEN_9;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_tag <= 1'h0;
    end else if (_T_674) begin
      if (wr_cmd_vld) begin
        buf_tag <= wrbuf_tag;
      end else begin
        buf_tag <= io_axi_ar_bits_id;
      end
    end
  end
endmodule
