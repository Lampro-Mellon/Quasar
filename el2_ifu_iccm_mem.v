module el2_ifu_iccm_mem(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_iccm_wren,
  input         io_iccm_rden,
  input  [14:0] io_iccm_rw_addr,
  input         io_iccm_buf_correct_ecc,
  input         io_iccm_correction_state,
  input  [2:0]  io_iccm_wr_size,
  input  [77:0] io_iccm_wr_data,
  output [63:0] io_iccm_rd_data,
  output [77:0] io_iccm_rd_data_ecc,
  input         io_scan_mode,
  output [11:0] io_iccm_bank_addr_0,
  output [11:0] io_iccm_bank_addr_1,
  output [11:0] io_iccm_bank_addr_2,
  output [11:0] io_iccm_bank_addr_3
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  reg [38:0] _T_81 [0:4095]; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_81__T_101_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_81__T_101_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_81__T_97_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_81__T_97_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_81__T_97_mask; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_81__T_97_en; // @[el2_ifu_iccm_mem.scala 42:51]
  reg [38:0] _T_82 [0:4095]; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_82__T_103_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_82__T_103_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_82__T_98_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_82__T_98_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_82__T_98_mask; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_82__T_98_en; // @[el2_ifu_iccm_mem.scala 42:51]
  reg [38:0] _T_83 [0:4095]; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_83__T_105_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_83__T_105_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_83__T_99_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_83__T_99_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_83__T_99_mask; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_83__T_99_en; // @[el2_ifu_iccm_mem.scala 42:51]
  reg [38:0] _T_84 [0:4095]; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_84__T_107_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_84__T_107_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [38:0] _T_84__T_100_data; // @[el2_ifu_iccm_mem.scala 42:51]
  wire [11:0] _T_84__T_100_addr; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_84__T_100_mask; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_84__T_100_en; // @[el2_ifu_iccm_mem.scala 42:51]
  wire  _T_1 = io_iccm_wr_size[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 24:43]
  wire [1:0] addr_inc = _T_1 ? 2'h2 : 2'h1; // @[el2_ifu_iccm_mem.scala 24:21]
  wire [14:0] _GEN_27 = {{13'd0}, addr_inc}; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [14:0] addr_bank_inc = io_iccm_rw_addr + _GEN_27; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [38:0] iccm_bank_wr_data_0 = io_iccm_wr_data[38:0]; // @[el2_ifu_iccm_mem.scala 29:50]
  wire [38:0] iccm_bank_wr_data_1 = io_iccm_wr_data[77:39]; // @[el2_ifu_iccm_mem.scala 30:54]
  wire  _T_10 = io_iccm_rw_addr[2:1] == 2'h0; // @[el2_ifu_iccm_mem.scala 33:100]
  wire  _T_12 = addr_bank_inc[2:1] == 2'h0; // @[el2_ifu_iccm_mem.scala 33:140]
  wire  _T_13 = _T_10 | _T_12; // @[el2_ifu_iccm_mem.scala 33:107]
  wire  wren_bank_0 = io_iccm_wren & _T_13; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_15 = io_iccm_rw_addr[2:1] == 2'h1; // @[el2_ifu_iccm_mem.scala 33:100]
  wire  _T_17 = addr_bank_inc[2:1] == 2'h1; // @[el2_ifu_iccm_mem.scala 33:140]
  wire  _T_18 = _T_15 | _T_17; // @[el2_ifu_iccm_mem.scala 33:107]
  wire  wren_bank_1 = io_iccm_wren & _T_18; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_20 = io_iccm_rw_addr[2:1] == 2'h2; // @[el2_ifu_iccm_mem.scala 33:100]
  wire  _T_22 = addr_bank_inc[2:1] == 2'h2; // @[el2_ifu_iccm_mem.scala 33:140]
  wire  _T_23 = _T_20 | _T_22; // @[el2_ifu_iccm_mem.scala 33:107]
  wire  wren_bank_2 = io_iccm_wren & _T_23; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_25 = io_iccm_rw_addr[2:1] == 2'h3; // @[el2_ifu_iccm_mem.scala 33:100]
  wire  _T_27 = addr_bank_inc[2:1] == 2'h3; // @[el2_ifu_iccm_mem.scala 33:140]
  wire  _T_28 = _T_25 | _T_27; // @[el2_ifu_iccm_mem.scala 33:107]
  wire  wren_bank_3 = io_iccm_wren & _T_28; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_31 = io_iccm_rden & _T_10; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_0 = _T_31 | _T_12; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_36 = io_iccm_rden & _T_15; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_1 = _T_36 | _T_17; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_41 = io_iccm_rden & _T_20; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_2 = _T_41 | _T_22; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_46 = io_iccm_rden & _T_25; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_3 = _T_46 | _T_27; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_49 = wren_bank_0 | rden_bank_0; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_0 = _T_49 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire  _T_50 = wren_bank_1 | rden_bank_1; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_1 = _T_50 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire  _T_51 = wren_bank_2 | rden_bank_2; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_2 = _T_51 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire  _T_52 = wren_bank_3 | rden_bank_3; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_3 = _T_52 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire [11:0] _T_59 = _T_12 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] _T_66 = _T_17 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] _T_73 = _T_22 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] _T_80 = _T_27 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  reg [38:0] iccm_bank_dout_0; // @[el2_ifu_iccm_mem.scala 55:63]
  reg [38:0] iccm_bank_dout_1; // @[el2_ifu_iccm_mem.scala 55:63]
  reg [38:0] iccm_bank_dout_2; // @[el2_ifu_iccm_mem.scala 55:63]
  reg [38:0] iccm_bank_dout_3; // @[el2_ifu_iccm_mem.scala 55:63]
  reg  _T_309; // @[Reg.scala 27:20]
  reg  _T_310; // @[Reg.scala 27:20]
  wire [1:0] redundant_valid = {_T_309,_T_310}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_1; // @[Reg.scala 27:20]
  wire  _T_112 = io_iccm_rw_addr[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 69:105]
  wire  _T_115 = _T_112 & _T_10; // @[el2_ifu_iccm_mem.scala 69:145]
  wire  _T_116 = redundant_valid[1] & _T_115; // @[el2_ifu_iccm_mem.scala 69:71]
  wire  _T_119 = addr_bank_inc[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 70:37]
  wire  _T_122 = _T_119 & _T_12; // @[el2_ifu_iccm_mem.scala 70:77]
  wire  _T_123 = _T_116 | _T_122; // @[el2_ifu_iccm_mem.scala 69:179]
  wire  _T_130 = _T_112 & _T_15; // @[el2_ifu_iccm_mem.scala 69:145]
  wire  _T_131 = redundant_valid[1] & _T_130; // @[el2_ifu_iccm_mem.scala 69:71]
  wire  _T_137 = _T_119 & _T_17; // @[el2_ifu_iccm_mem.scala 70:77]
  wire  _T_138 = _T_131 | _T_137; // @[el2_ifu_iccm_mem.scala 69:179]
  wire  _T_145 = _T_112 & _T_20; // @[el2_ifu_iccm_mem.scala 69:145]
  wire  _T_146 = redundant_valid[1] & _T_145; // @[el2_ifu_iccm_mem.scala 69:71]
  wire  _T_152 = _T_119 & _T_22; // @[el2_ifu_iccm_mem.scala 70:77]
  wire  _T_153 = _T_146 | _T_152; // @[el2_ifu_iccm_mem.scala 69:179]
  wire  _T_160 = _T_112 & _T_25; // @[el2_ifu_iccm_mem.scala 69:145]
  wire  _T_161 = redundant_valid[1] & _T_160; // @[el2_ifu_iccm_mem.scala 69:71]
  wire  _T_167 = _T_119 & _T_27; // @[el2_ifu_iccm_mem.scala 70:77]
  wire  _T_168 = _T_161 | _T_167; // @[el2_ifu_iccm_mem.scala 69:179]
  wire [3:0] sel_red1 = {_T_168,_T_153,_T_138,_T_123}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_0; // @[Reg.scala 27:20]
  wire  _T_174 = io_iccm_rw_addr[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 71:105]
  wire  _T_177 = _T_174 & _T_10; // @[el2_ifu_iccm_mem.scala 71:145]
  wire  _T_178 = redundant_valid[0] & _T_177; // @[el2_ifu_iccm_mem.scala 71:71]
  wire  _T_181 = addr_bank_inc[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 72:37]
  wire  _T_184 = _T_181 & _T_12; // @[el2_ifu_iccm_mem.scala 72:77]
  wire  _T_185 = _T_178 | _T_184; // @[el2_ifu_iccm_mem.scala 71:179]
  wire  _T_192 = _T_174 & _T_15; // @[el2_ifu_iccm_mem.scala 71:145]
  wire  _T_193 = redundant_valid[0] & _T_192; // @[el2_ifu_iccm_mem.scala 71:71]
  wire  _T_199 = _T_181 & _T_17; // @[el2_ifu_iccm_mem.scala 72:77]
  wire  _T_200 = _T_193 | _T_199; // @[el2_ifu_iccm_mem.scala 71:179]
  wire  _T_207 = _T_174 & _T_20; // @[el2_ifu_iccm_mem.scala 71:145]
  wire  _T_208 = redundant_valid[0] & _T_207; // @[el2_ifu_iccm_mem.scala 71:71]
  wire  _T_214 = _T_181 & _T_22; // @[el2_ifu_iccm_mem.scala 72:77]
  wire  _T_215 = _T_208 | _T_214; // @[el2_ifu_iccm_mem.scala 71:179]
  wire  _T_222 = _T_174 & _T_25; // @[el2_ifu_iccm_mem.scala 71:145]
  wire  _T_223 = redundant_valid[0] & _T_222; // @[el2_ifu_iccm_mem.scala 71:71]
  wire  _T_229 = _T_181 & _T_27; // @[el2_ifu_iccm_mem.scala 72:77]
  wire  _T_230 = _T_223 | _T_229; // @[el2_ifu_iccm_mem.scala 71:179]
  wire [3:0] sel_red0 = {_T_230,_T_215,_T_200,_T_185}; // @[Cat.scala 29:58]
  reg [3:0] sel_red0_q; // @[el2_ifu_iccm_mem.scala 74:27]
  reg [3:0] sel_red1_q; // @[el2_ifu_iccm_mem.scala 75:27]
  wire  _T_238 = ~sel_red0_q[0]; // @[el2_ifu_iccm_mem.scala 81:36]
  wire  _T_240 = ~sel_red1_q[0]; // @[el2_ifu_iccm_mem.scala 81:53]
  wire  _T_241 = _T_238 & _T_240; // @[el2_ifu_iccm_mem.scala 81:51]
  reg [38:0] redundant_data_1; // @[Reg.scala 27:20]
  wire [38:0] _T_243 = sel_red1_q[0] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  reg [38:0] redundant_data_0; // @[Reg.scala 27:20]
  wire [38:0] _T_244 = sel_red0_q[0] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_245 = _T_241 ? iccm_bank_dout_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_246 = _T_243 | _T_244; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_0 = _T_246 | _T_245; // @[Mux.scala 27:72]
  wire  _T_253 = ~sel_red0_q[1]; // @[el2_ifu_iccm_mem.scala 81:36]
  wire  _T_255 = ~sel_red1_q[1]; // @[el2_ifu_iccm_mem.scala 81:53]
  wire  _T_256 = _T_253 & _T_255; // @[el2_ifu_iccm_mem.scala 81:51]
  wire [38:0] _T_258 = sel_red1_q[1] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_259 = sel_red0_q[1] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_260 = _T_256 ? iccm_bank_dout_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_261 = _T_258 | _T_259; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_1 = _T_261 | _T_260; // @[Mux.scala 27:72]
  wire  _T_268 = ~sel_red0_q[2]; // @[el2_ifu_iccm_mem.scala 81:36]
  wire  _T_270 = ~sel_red1_q[2]; // @[el2_ifu_iccm_mem.scala 81:53]
  wire  _T_271 = _T_268 & _T_270; // @[el2_ifu_iccm_mem.scala 81:51]
  wire [38:0] _T_273 = sel_red1_q[2] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_274 = sel_red0_q[2] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_275 = _T_271 ? iccm_bank_dout_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_276 = _T_273 | _T_274; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_2 = _T_276 | _T_275; // @[Mux.scala 27:72]
  wire  _T_283 = ~sel_red0_q[3]; // @[el2_ifu_iccm_mem.scala 81:36]
  wire  _T_285 = ~sel_red1_q[3]; // @[el2_ifu_iccm_mem.scala 81:53]
  wire  _T_286 = _T_283 & _T_285; // @[el2_ifu_iccm_mem.scala 81:51]
  wire [38:0] _T_288 = sel_red1_q[3] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_289 = sel_red0_q[3] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_290 = _T_286 ? iccm_bank_dout_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_291 = _T_288 | _T_289; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_3 = _T_291 | _T_290; // @[Mux.scala 27:72]
  reg  redundant_lru; // @[Reg.scala 27:20]
  wire  _T_293 = ~redundant_lru; // @[el2_ifu_iccm_mem.scala 83:20]
  wire  r0_addr_en = _T_293 & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 83:35]
  wire  r1_addr_en = redundant_lru & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 84:35]
  wire  _T_294 = |sel_red0; // @[el2_ifu_iccm_mem.scala 85:63]
  wire  _T_295 = |sel_red1; // @[el2_ifu_iccm_mem.scala 85:78]
  wire  _T_296 = _T_294 | _T_295; // @[el2_ifu_iccm_mem.scala 85:67]
  wire  _T_297 = _T_296 & io_iccm_rden; // @[el2_ifu_iccm_mem.scala 85:83]
  wire  _T_298 = _T_297 & io_iccm_correction_state; // @[el2_ifu_iccm_mem.scala 85:98]
  wire  redundant_lru_en = io_iccm_buf_correct_ecc | _T_298; // @[el2_ifu_iccm_mem.scala 85:50]
  wire  _GEN_23 = r1_addr_en | _T_309; // @[Reg.scala 28:19]
  wire  _GEN_24 = r0_addr_en | _T_310; // @[Reg.scala 28:19]
  wire  _T_314 = io_iccm_rw_addr[14:2] == redundant_address_0[13:1]; // @[el2_ifu_iccm_mem.scala 92:61]
  wire  _T_317 = io_iccm_rw_addr[1] & redundant_address_0[0]; // @[el2_ifu_iccm_mem.scala 93:26]
  wire  _T_320 = _T_317 | _T_1; // @[el2_ifu_iccm_mem.scala 93:52]
  wire  _T_321 = _T_314 & _T_320; // @[el2_ifu_iccm_mem.scala 92:102]
  wire  _T_323 = _T_321 & redundant_valid[0]; // @[el2_ifu_iccm_mem.scala 93:84]
  wire  _T_324 = _T_323 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 93:105]
  wire  redundant_data0_en = _T_324 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 93:121]
  wire  _T_333 = redundant_address_0[0] & _T_1; // @[el2_ifu_iccm_mem.scala 95:104]
  wire  _T_334 = _T_317 | _T_333; // @[el2_ifu_iccm_mem.scala 95:78]
  wire  _T_342 = io_iccm_rw_addr[14:2] == redundant_address_1[13:1]; // @[el2_ifu_iccm_mem.scala 99:61]
  wire  _T_345 = io_iccm_rw_addr[1] & redundant_address_1[0]; // @[el2_ifu_iccm_mem.scala 100:26]
  wire  _T_348 = _T_345 | _T_1; // @[el2_ifu_iccm_mem.scala 100:52]
  wire  _T_349 = _T_342 & _T_348; // @[el2_ifu_iccm_mem.scala 99:102]
  wire  _T_351 = _T_349 & redundant_valid[1]; // @[el2_ifu_iccm_mem.scala 100:84]
  wire  _T_352 = _T_351 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 100:105]
  wire  redundant_data1_en = _T_352 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 100:121]
  wire  _T_361 = redundant_address_1[0] & _T_1; // @[el2_ifu_iccm_mem.scala 102:104]
  wire  _T_362 = _T_345 | _T_361; // @[el2_ifu_iccm_mem.scala 102:78]
  reg [2:0] iccm_rd_addr_lo_q; // @[el2_ifu_iccm_mem.scala 106:34]
  reg [1:0] iccm_rd_addr_hi_q; // @[el2_ifu_iccm_mem.scala 107:34]
  wire  _T_370 = iccm_rd_addr_hi_q == 2'h0; // @[el2_ifu_iccm_mem.scala 109:86]
  wire  _T_372 = iccm_rd_addr_hi_q == 2'h1; // @[el2_ifu_iccm_mem.scala 109:86]
  wire  _T_374 = iccm_rd_addr_hi_q == 2'h2; // @[el2_ifu_iccm_mem.scala 109:86]
  wire  _T_376 = iccm_rd_addr_hi_q == 2'h3; // @[el2_ifu_iccm_mem.scala 109:86]
  wire [31:0] _T_378 = _T_370 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_379 = _T_372 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_380 = _T_374 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_381 = _T_376 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_382 = _T_378 | _T_379; // @[Mux.scala 27:72]
  wire [31:0] _T_383 = _T_382 | _T_380; // @[Mux.scala 27:72]
  wire [31:0] _T_384 = _T_383 | _T_381; // @[Mux.scala 27:72]
  wire  _T_387 = iccm_rd_addr_lo_q[1:0] == 2'h0; // @[el2_ifu_iccm_mem.scala 110:77]
  wire  _T_390 = iccm_rd_addr_lo_q[1:0] == 2'h1; // @[el2_ifu_iccm_mem.scala 110:77]
  wire  _T_393 = iccm_rd_addr_lo_q[1:0] == 2'h2; // @[el2_ifu_iccm_mem.scala 110:77]
  wire  _T_396 = iccm_rd_addr_lo_q[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 110:77]
  wire [31:0] _T_398 = _T_387 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_399 = _T_390 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_400 = _T_393 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_401 = _T_396 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_402 = _T_398 | _T_399; // @[Mux.scala 27:72]
  wire [31:0] _T_403 = _T_402 | _T_400; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = _T_403 | _T_401; // @[Mux.scala 27:72]
  wire [63:0] iccm_rd_data_pre = {_T_384,_T_404}; // @[Cat.scala 29:58]
  wire [63:0] _T_410 = {16'h0,iccm_rd_data_pre[63:16]}; // @[Cat.scala 29:58]
  wire [38:0] _T_416 = _T_370 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_417 = _T_372 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_418 = _T_374 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_419 = _T_376 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_420 = _T_416 | _T_417; // @[Mux.scala 27:72]
  wire [38:0] _T_421 = _T_420 | _T_418; // @[Mux.scala 27:72]
  wire [38:0] _T_422 = _T_421 | _T_419; // @[Mux.scala 27:72]
  wire [38:0] _T_432 = _T_387 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_433 = _T_390 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_434 = _T_393 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_435 = _T_396 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_436 = _T_432 | _T_433; // @[Mux.scala 27:72]
  wire [38:0] _T_437 = _T_436 | _T_434; // @[Mux.scala 27:72]
  wire [38:0] _T_438 = _T_437 | _T_435; // @[Mux.scala 27:72]
  assign _T_81__T_101_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign _T_81__T_101_data = _T_81[_T_81__T_101_addr]; // @[el2_ifu_iccm_mem.scala 42:51]
  assign _T_81__T_97_data = io_iccm_wr_data[38:0];
  assign _T_81__T_97_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign _T_81__T_97_mask = 1'h1;
  assign _T_81__T_97_en = iccm_clken_0 & wren_bank_0;
  assign _T_82__T_103_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign _T_82__T_103_data = _T_82[_T_82__T_103_addr]; // @[el2_ifu_iccm_mem.scala 42:51]
  assign _T_82__T_98_data = io_iccm_wr_data[77:39];
  assign _T_82__T_98_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign _T_82__T_98_mask = 1'h1;
  assign _T_82__T_98_en = iccm_clken_1 & wren_bank_1;
  assign _T_83__T_105_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign _T_83__T_105_data = _T_83[_T_83__T_105_addr]; // @[el2_ifu_iccm_mem.scala 42:51]
  assign _T_83__T_99_data = io_iccm_wr_data[38:0];
  assign _T_83__T_99_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign _T_83__T_99_mask = 1'h1;
  assign _T_83__T_99_en = iccm_clken_2 & wren_bank_2;
  assign _T_84__T_107_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign _T_84__T_107_data = _T_84[_T_84__T_107_addr]; // @[el2_ifu_iccm_mem.scala 42:51]
  assign _T_84__T_100_data = io_iccm_wr_data[77:39];
  assign _T_84__T_100_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign _T_84__T_100_mask = 1'h1;
  assign _T_84__T_100_en = iccm_clken_3 & wren_bank_3;
  assign io_iccm_rd_data = iccm_rd_addr_lo_q[0] ? _T_410 : iccm_rd_data_pre; // @[el2_ifu_iccm_mem.scala 22:19 el2_ifu_iccm_mem.scala 111:19]
  assign io_iccm_rd_data_ecc = {_T_422,_T_438}; // @[el2_ifu_iccm_mem.scala 23:23 el2_ifu_iccm_mem.scala 112:23]
  assign io_iccm_bank_addr_0 = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59; // @[el2_ifu_iccm_mem.scala 60:21]
  assign io_iccm_bank_addr_1 = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66; // @[el2_ifu_iccm_mem.scala 60:21]
  assign io_iccm_bank_addr_2 = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73; // @[el2_ifu_iccm_mem.scala 60:21]
  assign io_iccm_bank_addr_3 = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80; // @[el2_ifu_iccm_mem.scala 60:21]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    _T_81[initvar] = _RAND_0[38:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    _T_82[initvar] = _RAND_1[38:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    _T_83[initvar] = _RAND_2[38:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    _T_84[initvar] = _RAND_3[38:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  iccm_bank_dout_0 = _RAND_4[38:0];
  _RAND_5 = {2{`RANDOM}};
  iccm_bank_dout_1 = _RAND_5[38:0];
  _RAND_6 = {2{`RANDOM}};
  iccm_bank_dout_2 = _RAND_6[38:0];
  _RAND_7 = {2{`RANDOM}};
  iccm_bank_dout_3 = _RAND_7[38:0];
  _RAND_8 = {1{`RANDOM}};
  _T_309 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_310 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  redundant_address_1 = _RAND_10[13:0];
  _RAND_11 = {1{`RANDOM}};
  redundant_address_0 = _RAND_11[13:0];
  _RAND_12 = {1{`RANDOM}};
  sel_red0_q = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  sel_red1_q = _RAND_13[3:0];
  _RAND_14 = {2{`RANDOM}};
  redundant_data_1 = _RAND_14[38:0];
  _RAND_15 = {2{`RANDOM}};
  redundant_data_0 = _RAND_15[38:0];
  _RAND_16 = {1{`RANDOM}};
  redundant_lru = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  iccm_rd_addr_lo_q = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  iccm_rd_addr_hi_q = _RAND_18[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(_T_81__T_97_en & _T_81__T_97_mask) begin
      _T_81[_T_81__T_97_addr] <= _T_81__T_97_data; // @[el2_ifu_iccm_mem.scala 42:51]
    end
    if(_T_82__T_98_en & _T_82__T_98_mask) begin
      _T_82[_T_82__T_98_addr] <= _T_82__T_98_data; // @[el2_ifu_iccm_mem.scala 42:51]
    end
    if(_T_83__T_99_en & _T_83__T_99_mask) begin
      _T_83[_T_83__T_99_addr] <= _T_83__T_99_data; // @[el2_ifu_iccm_mem.scala 42:51]
    end
    if(_T_84__T_100_en & _T_84__T_100_mask) begin
      _T_84[_T_84__T_100_addr] <= _T_84__T_100_data; // @[el2_ifu_iccm_mem.scala 42:51]
    end
    iccm_bank_dout_0 <= _T_81__T_101_data;
    iccm_bank_dout_1 <= _T_82__T_103_data;
    iccm_bank_dout_2 <= _T_83__T_105_data;
    iccm_bank_dout_3 <= _T_84__T_107_data;
    if (reset) begin
      _T_309 <= 1'h0;
    end else begin
      _T_309 <= _GEN_23;
    end
    if (reset) begin
      _T_310 <= 1'h0;
    end else begin
      _T_310 <= _GEN_24;
    end
    if (reset) begin
      redundant_address_1 <= 14'h0;
    end else if (r1_addr_en) begin
      redundant_address_1 <= io_iccm_rw_addr[14:1];
    end
    if (reset) begin
      redundant_address_0 <= 14'h0;
    end else if (r0_addr_en) begin
      redundant_address_0 <= io_iccm_rw_addr[14:1];
    end
    if (reset) begin
      sel_red0_q <= 4'h0;
    end else begin
      sel_red0_q <= sel_red0;
    end
    if (reset) begin
      sel_red1_q <= 4'h0;
    end else begin
      sel_red1_q <= sel_red1;
    end
    if (reset) begin
      redundant_data_1 <= 39'h0;
    end else if (redundant_data1_en) begin
      if (_T_362) begin
        redundant_data_1 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_1 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_data_0 <= 39'h0;
    end else if (redundant_data0_en) begin
      if (_T_334) begin
        redundant_data_0 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_0 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_lru <= 1'h0;
    end else if (redundant_lru_en) begin
      if (io_iccm_buf_correct_ecc) begin
        redundant_lru <= _T_293;
      end else begin
        redundant_lru <= _T_294;
      end
    end
    if (reset) begin
      iccm_rd_addr_lo_q <= 3'h0;
    end else begin
      iccm_rd_addr_lo_q <= io_iccm_rw_addr[2:0];
    end
    if (reset) begin
      iccm_rd_addr_hi_q <= 2'h0;
    end else begin
      iccm_rd_addr_hi_q <= addr_bank_inc[2:1];
    end
  end
endmodule
