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
  output [38:0] io_iccm_bank_wr_data_0,
  output [38:0] io_iccm_bank_wr_data_1,
  output [38:0] io_iccm_bank_wr_data_2,
  output [38:0] io_iccm_bank_wr_data_3
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
  reg [38:0] iccm_mem_0 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_97_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_97_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_93_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_93_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_93_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_95_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_95_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_95_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  reg [38:0] iccm_mem_1 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_97_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_97_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_93_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_93_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_93_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_95_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_95_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_95_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  reg [38:0] iccm_mem_2 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_97_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_97_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_93_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_93_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_93_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_95_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_95_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_95_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  reg [38:0] iccm_mem_3 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_97_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_97_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_93_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_93_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_93_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_95_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_95_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_95_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  _T_1 = io_iccm_wr_size[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 24:43]
  wire [1:0] addr_inc = _T_1 ? 2'h2 : 2'h1; // @[el2_ifu_iccm_mem.scala 24:21]
  wire [14:0] _GEN_15 = {{13'd0}, addr_inc}; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [14:0] addr_bank_inc = io_iccm_rw_addr + _GEN_15; // @[el2_ifu_iccm_mem.scala 25:54]
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
  wire  _T_31 = io_iccm_rden & _T_10; // @[el2_ifu_iccm_mem.scala 36:64]
  wire  rden_bank_0 = _T_31 | _T_12; // @[el2_ifu_iccm_mem.scala 36:106]
  wire  _T_36 = io_iccm_rden & _T_15; // @[el2_ifu_iccm_mem.scala 36:64]
  wire  rden_bank_1 = _T_36 | _T_17; // @[el2_ifu_iccm_mem.scala 36:106]
  wire  _T_41 = io_iccm_rden & _T_20; // @[el2_ifu_iccm_mem.scala 36:64]
  wire  rden_bank_2 = _T_41 | _T_22; // @[el2_ifu_iccm_mem.scala 36:106]
  wire  _T_46 = io_iccm_rden & _T_25; // @[el2_ifu_iccm_mem.scala 36:64]
  wire  rden_bank_3 = _T_46 | _T_27; // @[el2_ifu_iccm_mem.scala 36:106]
  wire  _T_49 = wren_bank_0 | rden_bank_0; // @[el2_ifu_iccm_mem.scala 37:72]
  wire  iccm_clken_0 = _T_49 | io_clk_override; // @[el2_ifu_iccm_mem.scala 37:87]
  wire  _T_50 = wren_bank_1 | rden_bank_1; // @[el2_ifu_iccm_mem.scala 37:72]
  wire  iccm_clken_1 = _T_50 | io_clk_override; // @[el2_ifu_iccm_mem.scala 37:87]
  wire  _T_51 = wren_bank_2 | rden_bank_2; // @[el2_ifu_iccm_mem.scala 37:72]
  wire  iccm_clken_2 = _T_51 | io_clk_override; // @[el2_ifu_iccm_mem.scala 37:87]
  wire  _T_52 = wren_bank_3 | rden_bank_3; // @[el2_ifu_iccm_mem.scala 37:72]
  wire  iccm_clken_3 = _T_52 | io_clk_override; // @[el2_ifu_iccm_mem.scala 37:87]
  wire [11:0] _T_59 = _T_12 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] _T_66 = _T_17 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] _T_73 = _T_22 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] _T_80 = _T_27 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  reg [38:0] iccm_bank_dout_0; // @[el2_ifu_iccm_mem.scala 50:62]
  reg [38:0] iccm_bank_dout_1; // @[el2_ifu_iccm_mem.scala 50:62]
  reg [38:0] iccm_bank_dout_2; // @[el2_ifu_iccm_mem.scala 50:62]
  reg [38:0] iccm_bank_dout_3; // @[el2_ifu_iccm_mem.scala 50:62]
  reg  _T_302; // @[Reg.scala 27:20]
  reg  _T_303; // @[Reg.scala 27:20]
  wire [1:0] redundant_valid = {_T_302,_T_303}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_1; // @[Reg.scala 27:20]
  wire  _T_105 = io_iccm_rw_addr[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 56:105]
  wire  _T_108 = _T_105 & _T_10; // @[el2_ifu_iccm_mem.scala 56:145]
  wire  _T_109 = redundant_valid[1] & _T_108; // @[el2_ifu_iccm_mem.scala 56:71]
  wire  _T_112 = addr_bank_inc[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 57:37]
  wire  _T_115 = _T_112 & _T_12; // @[el2_ifu_iccm_mem.scala 57:77]
  wire  _T_116 = _T_109 | _T_115; // @[el2_ifu_iccm_mem.scala 56:179]
  wire  _T_123 = _T_105 & _T_15; // @[el2_ifu_iccm_mem.scala 56:145]
  wire  _T_124 = redundant_valid[1] & _T_123; // @[el2_ifu_iccm_mem.scala 56:71]
  wire  _T_130 = _T_112 & _T_17; // @[el2_ifu_iccm_mem.scala 57:77]
  wire  _T_131 = _T_124 | _T_130; // @[el2_ifu_iccm_mem.scala 56:179]
  wire  _T_138 = _T_105 & _T_20; // @[el2_ifu_iccm_mem.scala 56:145]
  wire  _T_139 = redundant_valid[1] & _T_138; // @[el2_ifu_iccm_mem.scala 56:71]
  wire  _T_145 = _T_112 & _T_22; // @[el2_ifu_iccm_mem.scala 57:77]
  wire  _T_146 = _T_139 | _T_145; // @[el2_ifu_iccm_mem.scala 56:179]
  wire  _T_153 = _T_105 & _T_25; // @[el2_ifu_iccm_mem.scala 56:145]
  wire  _T_154 = redundant_valid[1] & _T_153; // @[el2_ifu_iccm_mem.scala 56:71]
  wire  _T_160 = _T_112 & _T_27; // @[el2_ifu_iccm_mem.scala 57:77]
  wire  _T_161 = _T_154 | _T_160; // @[el2_ifu_iccm_mem.scala 56:179]
  wire [3:0] sel_red1 = {_T_161,_T_146,_T_131,_T_116}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_0; // @[Reg.scala 27:20]
  wire  _T_167 = io_iccm_rw_addr[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 58:105]
  wire  _T_170 = _T_167 & _T_10; // @[el2_ifu_iccm_mem.scala 58:145]
  wire  _T_171 = redundant_valid[0] & _T_170; // @[el2_ifu_iccm_mem.scala 58:71]
  wire  _T_174 = addr_bank_inc[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 59:37]
  wire  _T_177 = _T_174 & _T_12; // @[el2_ifu_iccm_mem.scala 59:77]
  wire  _T_178 = _T_171 | _T_177; // @[el2_ifu_iccm_mem.scala 58:179]
  wire  _T_185 = _T_167 & _T_15; // @[el2_ifu_iccm_mem.scala 58:145]
  wire  _T_186 = redundant_valid[0] & _T_185; // @[el2_ifu_iccm_mem.scala 58:71]
  wire  _T_192 = _T_174 & _T_17; // @[el2_ifu_iccm_mem.scala 59:77]
  wire  _T_193 = _T_186 | _T_192; // @[el2_ifu_iccm_mem.scala 58:179]
  wire  _T_200 = _T_167 & _T_20; // @[el2_ifu_iccm_mem.scala 58:145]
  wire  _T_201 = redundant_valid[0] & _T_200; // @[el2_ifu_iccm_mem.scala 58:71]
  wire  _T_207 = _T_174 & _T_22; // @[el2_ifu_iccm_mem.scala 59:77]
  wire  _T_208 = _T_201 | _T_207; // @[el2_ifu_iccm_mem.scala 58:179]
  wire  _T_215 = _T_167 & _T_25; // @[el2_ifu_iccm_mem.scala 58:145]
  wire  _T_216 = redundant_valid[0] & _T_215; // @[el2_ifu_iccm_mem.scala 58:71]
  wire  _T_222 = _T_174 & _T_27; // @[el2_ifu_iccm_mem.scala 59:77]
  wire  _T_223 = _T_216 | _T_222; // @[el2_ifu_iccm_mem.scala 58:179]
  wire [3:0] sel_red0 = {_T_223,_T_208,_T_193,_T_178}; // @[Cat.scala 29:58]
  reg [3:0] sel_red0_q; // @[el2_ifu_iccm_mem.scala 61:27]
  reg [3:0] sel_red1_q; // @[el2_ifu_iccm_mem.scala 62:27]
  wire  _T_231 = ~sel_red0_q[0]; // @[el2_ifu_iccm_mem.scala 68:36]
  wire  _T_233 = ~sel_red1_q[0]; // @[el2_ifu_iccm_mem.scala 68:53]
  wire  _T_234 = _T_231 & _T_233; // @[el2_ifu_iccm_mem.scala 68:51]
  reg [38:0] redundant_data_1; // @[Reg.scala 27:20]
  wire [38:0] _T_236 = sel_red1_q[0] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  reg [38:0] redundant_data_0; // @[Reg.scala 27:20]
  wire [38:0] _T_237 = sel_red0_q[0] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_238 = _T_234 ? iccm_bank_dout_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_239 = _T_236 | _T_237; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_0 = _T_239 | _T_238; // @[Mux.scala 27:72]
  wire  _T_246 = ~sel_red0_q[1]; // @[el2_ifu_iccm_mem.scala 68:36]
  wire  _T_248 = ~sel_red1_q[1]; // @[el2_ifu_iccm_mem.scala 68:53]
  wire  _T_249 = _T_246 & _T_248; // @[el2_ifu_iccm_mem.scala 68:51]
  wire [38:0] _T_251 = sel_red1_q[1] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_252 = sel_red0_q[1] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_253 = _T_249 ? iccm_bank_dout_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_254 = _T_251 | _T_252; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_1 = _T_254 | _T_253; // @[Mux.scala 27:72]
  wire  _T_261 = ~sel_red0_q[2]; // @[el2_ifu_iccm_mem.scala 68:36]
  wire  _T_263 = ~sel_red1_q[2]; // @[el2_ifu_iccm_mem.scala 68:53]
  wire  _T_264 = _T_261 & _T_263; // @[el2_ifu_iccm_mem.scala 68:51]
  wire [38:0] _T_266 = sel_red1_q[2] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_267 = sel_red0_q[2] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_268 = _T_264 ? iccm_bank_dout_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_269 = _T_266 | _T_267; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_2 = _T_269 | _T_268; // @[Mux.scala 27:72]
  wire  _T_276 = ~sel_red0_q[3]; // @[el2_ifu_iccm_mem.scala 68:36]
  wire  _T_278 = ~sel_red1_q[3]; // @[el2_ifu_iccm_mem.scala 68:53]
  wire  _T_279 = _T_276 & _T_278; // @[el2_ifu_iccm_mem.scala 68:51]
  wire [38:0] _T_281 = sel_red1_q[3] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_282 = sel_red0_q[3] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_283 = _T_279 ? iccm_bank_dout_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_284 = _T_281 | _T_282; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_3 = _T_284 | _T_283; // @[Mux.scala 27:72]
  reg  redundant_lru; // @[Reg.scala 27:20]
  wire  _T_286 = ~redundant_lru; // @[el2_ifu_iccm_mem.scala 70:20]
  wire  r0_addr_en = _T_286 & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 70:35]
  wire  r1_addr_en = redundant_lru & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 71:35]
  wire  _T_287 = |sel_red0; // @[el2_ifu_iccm_mem.scala 72:63]
  wire  _T_288 = |sel_red1; // @[el2_ifu_iccm_mem.scala 72:78]
  wire  _T_289 = _T_287 | _T_288; // @[el2_ifu_iccm_mem.scala 72:67]
  wire  _T_290 = _T_289 & io_iccm_rden; // @[el2_ifu_iccm_mem.scala 72:83]
  wire  _T_291 = _T_290 & io_iccm_correction_state; // @[el2_ifu_iccm_mem.scala 72:98]
  wire  redundant_lru_en = io_iccm_buf_correct_ecc | _T_291; // @[el2_ifu_iccm_mem.scala 72:50]
  wire  _GEN_11 = r1_addr_en | _T_302; // @[Reg.scala 28:19]
  wire  _GEN_12 = r0_addr_en | _T_303; // @[Reg.scala 28:19]
  wire  _T_307 = io_iccm_rw_addr[14:2] == redundant_address_0[13:1]; // @[el2_ifu_iccm_mem.scala 79:61]
  wire  _T_310 = io_iccm_rw_addr[1] & redundant_address_0[0]; // @[el2_ifu_iccm_mem.scala 80:26]
  wire  _T_313 = _T_310 | _T_1; // @[el2_ifu_iccm_mem.scala 80:52]
  wire  _T_314 = _T_307 & _T_313; // @[el2_ifu_iccm_mem.scala 79:102]
  wire  _T_316 = _T_314 & redundant_valid[0]; // @[el2_ifu_iccm_mem.scala 80:84]
  wire  _T_317 = _T_316 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 80:105]
  wire  redundant_data0_en = _T_317 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 80:121]
  wire  _T_326 = redundant_address_0[0] & _T_1; // @[el2_ifu_iccm_mem.scala 82:104]
  wire  _T_327 = _T_310 | _T_326; // @[el2_ifu_iccm_mem.scala 82:78]
  wire  _T_335 = io_iccm_rw_addr[14:2] == redundant_address_1[13:1]; // @[el2_ifu_iccm_mem.scala 86:61]
  wire  _T_338 = io_iccm_rw_addr[1] & redundant_address_1[0]; // @[el2_ifu_iccm_mem.scala 87:26]
  wire  _T_341 = _T_338 | _T_1; // @[el2_ifu_iccm_mem.scala 87:52]
  wire  _T_342 = _T_335 & _T_341; // @[el2_ifu_iccm_mem.scala 86:102]
  wire  _T_344 = _T_342 & redundant_valid[1]; // @[el2_ifu_iccm_mem.scala 87:84]
  wire  _T_345 = _T_344 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 87:105]
  wire  redundant_data1_en = _T_345 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 87:121]
  wire  _T_354 = redundant_address_1[0] & _T_1; // @[el2_ifu_iccm_mem.scala 89:104]
  wire  _T_355 = _T_338 | _T_354; // @[el2_ifu_iccm_mem.scala 89:78]
  reg [2:0] iccm_rd_addr_lo_q; // @[el2_ifu_iccm_mem.scala 93:34]
  reg [1:0] iccm_rd_addr_hi_q; // @[el2_ifu_iccm_mem.scala 94:34]
  wire  _T_363 = iccm_rd_addr_hi_q == 2'h0; // @[el2_ifu_iccm_mem.scala 96:86]
  wire  _T_365 = iccm_rd_addr_hi_q == 2'h1; // @[el2_ifu_iccm_mem.scala 96:86]
  wire  _T_367 = iccm_rd_addr_hi_q == 2'h2; // @[el2_ifu_iccm_mem.scala 96:86]
  wire  _T_369 = iccm_rd_addr_hi_q == 2'h3; // @[el2_ifu_iccm_mem.scala 96:86]
  wire [31:0] _T_371 = _T_363 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_372 = _T_365 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_373 = _T_367 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_374 = _T_369 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_375 = _T_371 | _T_372; // @[Mux.scala 27:72]
  wire [31:0] _T_376 = _T_375 | _T_373; // @[Mux.scala 27:72]
  wire [31:0] _T_377 = _T_376 | _T_374; // @[Mux.scala 27:72]
  wire  _T_380 = iccm_rd_addr_lo_q[1:0] == 2'h0; // @[el2_ifu_iccm_mem.scala 97:77]
  wire  _T_383 = iccm_rd_addr_lo_q[1:0] == 2'h1; // @[el2_ifu_iccm_mem.scala 97:77]
  wire  _T_386 = iccm_rd_addr_lo_q[1:0] == 2'h2; // @[el2_ifu_iccm_mem.scala 97:77]
  wire  _T_389 = iccm_rd_addr_lo_q[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 97:77]
  wire [31:0] _T_391 = _T_380 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_392 = _T_383 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_393 = _T_386 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_394 = _T_389 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_395 = _T_391 | _T_392; // @[Mux.scala 27:72]
  wire [31:0] _T_396 = _T_395 | _T_393; // @[Mux.scala 27:72]
  wire [31:0] _T_397 = _T_396 | _T_394; // @[Mux.scala 27:72]
  wire [63:0] iccm_rd_data_pre = {_T_377,_T_397}; // @[Cat.scala 29:58]
  wire [63:0] _T_403 = {16'h0,iccm_rd_data_pre[63:16]}; // @[Cat.scala 29:58]
  wire [38:0] _T_409 = _T_363 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_410 = _T_365 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_411 = _T_367 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_412 = _T_369 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_413 = _T_409 | _T_410; // @[Mux.scala 27:72]
  wire [38:0] _T_414 = _T_413 | _T_411; // @[Mux.scala 27:72]
  wire [38:0] _T_415 = _T_414 | _T_412; // @[Mux.scala 27:72]
  wire [38:0] _T_425 = _T_380 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_426 = _T_383 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_427 = _T_386 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_428 = _T_389 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_429 = _T_425 | _T_426; // @[Mux.scala 27:72]
  wire [38:0] _T_430 = _T_429 | _T_427; // @[Mux.scala 27:72]
  wire [38:0] _T_431 = _T_430 | _T_428; // @[Mux.scala 27:72]
  assign iccm_mem_0__T_97_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_0__T_97_data = iccm_mem_0[iccm_mem_0__T_97_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_93_data = io_iccm_wr_data[38:0];
  assign iccm_mem_0__T_93_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_0__T_93_mask = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_0__T_93_en = 1'h1;
  assign iccm_mem_0__T_94_data = io_iccm_wr_data[38:0];
  assign iccm_mem_0__T_94_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_0__T_94_mask = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_0__T_94_en = 1'h1;
  assign iccm_mem_0__T_95_data = io_iccm_wr_data[38:0];
  assign iccm_mem_0__T_95_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_0__T_95_mask = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_0__T_95_en = 1'h1;
  assign iccm_mem_0__T_96_data = io_iccm_wr_data[38:0];
  assign iccm_mem_0__T_96_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_0__T_96_mask = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_0__T_96_en = 1'h1;
  assign iccm_mem_1__T_97_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_1__T_97_data = iccm_mem_1[iccm_mem_1__T_97_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_93_data = io_iccm_wr_data[77:39];
  assign iccm_mem_1__T_93_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_1__T_93_mask = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_1__T_93_en = 1'h1;
  assign iccm_mem_1__T_94_data = io_iccm_wr_data[77:39];
  assign iccm_mem_1__T_94_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_1__T_94_mask = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_1__T_94_en = 1'h1;
  assign iccm_mem_1__T_95_data = io_iccm_wr_data[77:39];
  assign iccm_mem_1__T_95_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_1__T_95_mask = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_1__T_95_en = 1'h1;
  assign iccm_mem_1__T_96_data = io_iccm_wr_data[77:39];
  assign iccm_mem_1__T_96_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_1__T_96_mask = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_1__T_96_en = 1'h1;
  assign iccm_mem_2__T_97_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_2__T_97_data = iccm_mem_2[iccm_mem_2__T_97_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_93_data = io_iccm_wr_data[38:0];
  assign iccm_mem_2__T_93_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_2__T_93_mask = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_2__T_93_en = 1'h1;
  assign iccm_mem_2__T_94_data = io_iccm_wr_data[38:0];
  assign iccm_mem_2__T_94_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_2__T_94_mask = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_2__T_94_en = 1'h1;
  assign iccm_mem_2__T_95_data = io_iccm_wr_data[38:0];
  assign iccm_mem_2__T_95_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_2__T_95_mask = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_2__T_95_en = 1'h1;
  assign iccm_mem_2__T_96_data = io_iccm_wr_data[38:0];
  assign iccm_mem_2__T_96_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_2__T_96_mask = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_2__T_96_en = 1'h1;
  assign iccm_mem_3__T_97_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_3__T_97_data = iccm_mem_3[iccm_mem_3__T_97_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_93_data = io_iccm_wr_data[77:39];
  assign iccm_mem_3__T_93_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_3__T_93_mask = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_3__T_93_en = 1'h1;
  assign iccm_mem_3__T_94_data = io_iccm_wr_data[77:39];
  assign iccm_mem_3__T_94_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_3__T_94_mask = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_3__T_94_en = 1'h1;
  assign iccm_mem_3__T_95_data = io_iccm_wr_data[77:39];
  assign iccm_mem_3__T_95_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_3__T_95_mask = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_3__T_95_en = 1'h1;
  assign iccm_mem_3__T_96_data = io_iccm_wr_data[77:39];
  assign iccm_mem_3__T_96_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_3__T_96_mask = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_3__T_96_en = 1'h1;
  assign io_iccm_rd_data = iccm_rd_addr_lo_q[0] ? _T_403 : iccm_rd_data_pre; // @[el2_ifu_iccm_mem.scala 22:19 el2_ifu_iccm_mem.scala 98:19]
  assign io_iccm_rd_data_ecc = {_T_415,_T_431}; // @[el2_ifu_iccm_mem.scala 23:23 el2_ifu_iccm_mem.scala 99:23]
  assign io_iccm_bank_wr_data_0 = io_iccm_wr_data[38:0]; // @[el2_ifu_iccm_mem.scala 35:24]
  assign io_iccm_bank_wr_data_1 = io_iccm_wr_data[77:39]; // @[el2_ifu_iccm_mem.scala 35:24]
  assign io_iccm_bank_wr_data_2 = io_iccm_wr_data[38:0]; // @[el2_ifu_iccm_mem.scala 35:24]
  assign io_iccm_bank_wr_data_3 = io_iccm_wr_data[77:39]; // @[el2_ifu_iccm_mem.scala 35:24]
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
    iccm_mem_0[initvar] = _RAND_0[38:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    iccm_mem_1[initvar] = _RAND_1[38:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    iccm_mem_2[initvar] = _RAND_2[38:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    iccm_mem_3[initvar] = _RAND_3[38:0];
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
  _T_302 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_303 = _RAND_9[0:0];
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
    if(iccm_mem_0__T_93_en & iccm_mem_0__T_93_mask) begin
      iccm_mem_0[iccm_mem_0__T_93_addr] <= iccm_mem_0__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_0__T_94_en & iccm_mem_0__T_94_mask) begin
      iccm_mem_0[iccm_mem_0__T_94_addr] <= iccm_mem_0__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_0__T_95_en & iccm_mem_0__T_95_mask) begin
      iccm_mem_0[iccm_mem_0__T_95_addr] <= iccm_mem_0__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_0__T_96_en & iccm_mem_0__T_96_mask) begin
      iccm_mem_0[iccm_mem_0__T_96_addr] <= iccm_mem_0__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_93_en & iccm_mem_1__T_93_mask) begin
      iccm_mem_1[iccm_mem_1__T_93_addr] <= iccm_mem_1__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_94_en & iccm_mem_1__T_94_mask) begin
      iccm_mem_1[iccm_mem_1__T_94_addr] <= iccm_mem_1__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_95_en & iccm_mem_1__T_95_mask) begin
      iccm_mem_1[iccm_mem_1__T_95_addr] <= iccm_mem_1__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_96_en & iccm_mem_1__T_96_mask) begin
      iccm_mem_1[iccm_mem_1__T_96_addr] <= iccm_mem_1__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_93_en & iccm_mem_2__T_93_mask) begin
      iccm_mem_2[iccm_mem_2__T_93_addr] <= iccm_mem_2__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_94_en & iccm_mem_2__T_94_mask) begin
      iccm_mem_2[iccm_mem_2__T_94_addr] <= iccm_mem_2__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_95_en & iccm_mem_2__T_95_mask) begin
      iccm_mem_2[iccm_mem_2__T_95_addr] <= iccm_mem_2__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_96_en & iccm_mem_2__T_96_mask) begin
      iccm_mem_2[iccm_mem_2__T_96_addr] <= iccm_mem_2__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_93_en & iccm_mem_3__T_93_mask) begin
      iccm_mem_3[iccm_mem_3__T_93_addr] <= iccm_mem_3__T_93_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_94_en & iccm_mem_3__T_94_mask) begin
      iccm_mem_3[iccm_mem_3__T_94_addr] <= iccm_mem_3__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_95_en & iccm_mem_3__T_95_mask) begin
      iccm_mem_3[iccm_mem_3__T_95_addr] <= iccm_mem_3__T_95_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_96_en & iccm_mem_3__T_96_mask) begin
      iccm_mem_3[iccm_mem_3__T_96_addr] <= iccm_mem_3__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    iccm_bank_dout_0 <= iccm_mem_0__T_97_data;
    iccm_bank_dout_1 <= iccm_mem_1__T_97_data;
    iccm_bank_dout_2 <= iccm_mem_2__T_97_data;
    iccm_bank_dout_3 <= iccm_mem_3__T_97_data;
    if (reset) begin
      _T_302 <= 1'h0;
    end else begin
      _T_302 <= _GEN_11;
    end
    if (reset) begin
      _T_303 <= 1'h0;
    end else begin
      _T_303 <= _GEN_12;
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
      if (_T_355) begin
        redundant_data_1 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_1 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_data_0 <= 39'h0;
    end else if (redundant_data0_en) begin
      if (_T_327) begin
        redundant_data_0 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_0 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_lru <= 1'h0;
    end else if (redundant_lru_en) begin
      if (io_iccm_buf_correct_ecc) begin
        redundant_lru <= _T_286;
      end else begin
        redundant_lru <= _T_287;
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
