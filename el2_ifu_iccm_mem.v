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
  input         io_scan_mode
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
`endif // RANDOMIZE_REG_INIT
  reg [38:0] iccm_mem_0 [0:4095]; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_0__T_97_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_0__T_97_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_0__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_0__T_93_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_93_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_93_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_0__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_0__T_94_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_94_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_94_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_0__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_0__T_95_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_95_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_95_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_0__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_0__T_96_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_96_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_0__T_96_en; // @[el2_ifu_iccm_mem.scala 40:21]
  reg [38:0] iccm_mem_1 [0:4095]; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_1__T_97_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_1__T_97_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_1__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_1__T_93_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_93_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_93_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_1__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_1__T_94_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_94_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_94_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_1__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_1__T_95_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_95_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_95_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_1__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_1__T_96_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_96_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_1__T_96_en; // @[el2_ifu_iccm_mem.scala 40:21]
  reg [38:0] iccm_mem_2 [0:4095]; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_2__T_97_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_2__T_97_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_2__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_2__T_93_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_93_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_93_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_2__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_2__T_94_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_94_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_94_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_2__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_2__T_95_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_95_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_95_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_2__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_2__T_96_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_96_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_2__T_96_en; // @[el2_ifu_iccm_mem.scala 40:21]
  reg [38:0] iccm_mem_3 [0:4095]; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_3__T_97_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_3__T_97_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_3__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_3__T_93_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_93_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_93_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_3__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_3__T_94_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_94_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_94_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_3__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_3__T_95_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_95_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_95_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [38:0] iccm_mem_3__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
  wire [11:0] iccm_mem_3__T_96_addr; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_96_mask; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  iccm_mem_3__T_96_en; // @[el2_ifu_iccm_mem.scala 40:21]
  wire  _T_1 = io_iccm_wr_size[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 24:43]
  wire [1:0] addr_inc = _T_1 ? 2'h2 : 2'h1; // @[el2_ifu_iccm_mem.scala 24:21]
  wire [14:0] _GEN_15 = {{13'd0}, addr_inc}; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [14:0] addr_bank_inc = io_iccm_rw_addr + _GEN_15; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [38:0] iccm_bank_wr_data_0 = io_iccm_wr_data[38:0]; // @[el2_ifu_iccm_mem.scala 29:50]
  wire [38:0] iccm_bank_wr_data_1 = io_iccm_wr_data[77:39]; // @[el2_ifu_iccm_mem.scala 30:54]
  wire  _T_10 = io_iccm_rw_addr[2:1] == 2'h0; // @[el2_ifu_iccm_mem.scala 33:99]
  wire  _T_11 = io_iccm_wren & _T_10; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_13 = addr_bank_inc[2:1] == 2'h0; // @[el2_ifu_iccm_mem.scala 33:139]
  wire  wren_bank_0 = _T_11 | _T_13; // @[el2_ifu_iccm_mem.scala 33:106]
  wire  _T_15 = io_iccm_rw_addr[2:1] == 2'h1; // @[el2_ifu_iccm_mem.scala 33:99]
  wire  _T_16 = io_iccm_wren & _T_15; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_18 = addr_bank_inc[2:1] == 2'h1; // @[el2_ifu_iccm_mem.scala 33:139]
  wire  wren_bank_1 = _T_16 | _T_18; // @[el2_ifu_iccm_mem.scala 33:106]
  wire  _T_20 = io_iccm_rw_addr[2:1] == 2'h2; // @[el2_ifu_iccm_mem.scala 33:99]
  wire  _T_21 = io_iccm_wren & _T_20; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_23 = addr_bank_inc[2:1] == 2'h2; // @[el2_ifu_iccm_mem.scala 33:139]
  wire  wren_bank_2 = _T_21 | _T_23; // @[el2_ifu_iccm_mem.scala 33:106]
  wire  _T_25 = io_iccm_rw_addr[2:1] == 2'h3; // @[el2_ifu_iccm_mem.scala 33:99]
  wire  _T_26 = io_iccm_wren & _T_25; // @[el2_ifu_iccm_mem.scala 33:64]
  wire  _T_28 = addr_bank_inc[2:1] == 2'h3; // @[el2_ifu_iccm_mem.scala 33:139]
  wire  wren_bank_3 = _T_26 | _T_28; // @[el2_ifu_iccm_mem.scala 33:106]
  wire  _T_31 = io_iccm_rden & _T_10; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_0 = _T_31 | _T_13; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_36 = io_iccm_rden & _T_15; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_1 = _T_36 | _T_18; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_41 = io_iccm_rden & _T_20; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_2 = _T_41 | _T_23; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_46 = io_iccm_rden & _T_25; // @[el2_ifu_iccm_mem.scala 35:64]
  wire  rden_bank_3 = _T_46 | _T_28; // @[el2_ifu_iccm_mem.scala 35:106]
  wire  _T_49 = wren_bank_0 | rden_bank_0; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_0 = _T_49 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire  _T_50 = wren_bank_1 | rden_bank_1; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_1 = _T_50 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire  _T_51 = wren_bank_2 | rden_bank_2; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_2 = _T_51 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire  _T_52 = wren_bank_3 | rden_bank_3; // @[el2_ifu_iccm_mem.scala 36:72]
  wire  iccm_clken_3 = _T_52 | io_clk_override; // @[el2_ifu_iccm_mem.scala 36:87]
  wire [11:0] _T_59 = _T_13 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 38:8]
  wire [11:0] _T_66 = _T_18 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 38:8]
  wire [11:0] _T_73 = _T_23 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 38:8]
  wire [11:0] _T_80 = _T_28 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 38:8]
  reg  _T_298; // @[Reg.scala 27:20]
  reg  _T_299; // @[Reg.scala 27:20]
  wire [1:0] redundant_valid = {_T_298,_T_299}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_1; // @[Reg.scala 27:20]
  wire  _T_101 = io_iccm_rw_addr[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 53:105]
  wire  _T_104 = _T_101 & _T_10; // @[el2_ifu_iccm_mem.scala 53:145]
  wire  _T_105 = redundant_valid[1] & _T_104; // @[el2_ifu_iccm_mem.scala 53:71]
  wire  _T_108 = addr_bank_inc[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 54:37]
  wire  _T_111 = _T_108 & _T_13; // @[el2_ifu_iccm_mem.scala 54:77]
  wire  _T_112 = _T_105 | _T_111; // @[el2_ifu_iccm_mem.scala 53:179]
  wire  _T_119 = _T_101 & _T_15; // @[el2_ifu_iccm_mem.scala 53:145]
  wire  _T_120 = redundant_valid[1] & _T_119; // @[el2_ifu_iccm_mem.scala 53:71]
  wire  _T_126 = _T_108 & _T_18; // @[el2_ifu_iccm_mem.scala 54:77]
  wire  _T_127 = _T_120 | _T_126; // @[el2_ifu_iccm_mem.scala 53:179]
  wire  _T_134 = _T_101 & _T_20; // @[el2_ifu_iccm_mem.scala 53:145]
  wire  _T_135 = redundant_valid[1] & _T_134; // @[el2_ifu_iccm_mem.scala 53:71]
  wire  _T_141 = _T_108 & _T_23; // @[el2_ifu_iccm_mem.scala 54:77]
  wire  _T_142 = _T_135 | _T_141; // @[el2_ifu_iccm_mem.scala 53:179]
  wire  _T_149 = _T_101 & _T_25; // @[el2_ifu_iccm_mem.scala 53:145]
  wire  _T_150 = redundant_valid[1] & _T_149; // @[el2_ifu_iccm_mem.scala 53:71]
  wire  _T_156 = _T_108 & _T_28; // @[el2_ifu_iccm_mem.scala 54:77]
  wire  _T_157 = _T_150 | _T_156; // @[el2_ifu_iccm_mem.scala 53:179]
  wire [3:0] sel_red1 = {_T_157,_T_142,_T_127,_T_112}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_0; // @[Reg.scala 27:20]
  wire  _T_163 = io_iccm_rw_addr[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 55:105]
  wire  _T_166 = _T_163 & _T_10; // @[el2_ifu_iccm_mem.scala 55:145]
  wire  _T_167 = redundant_valid[0] & _T_166; // @[el2_ifu_iccm_mem.scala 55:71]
  wire  _T_170 = addr_bank_inc[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 56:37]
  wire  _T_173 = _T_170 & _T_13; // @[el2_ifu_iccm_mem.scala 56:77]
  wire  _T_174 = _T_167 | _T_173; // @[el2_ifu_iccm_mem.scala 55:179]
  wire  _T_181 = _T_163 & _T_15; // @[el2_ifu_iccm_mem.scala 55:145]
  wire  _T_182 = redundant_valid[0] & _T_181; // @[el2_ifu_iccm_mem.scala 55:71]
  wire  _T_188 = _T_170 & _T_18; // @[el2_ifu_iccm_mem.scala 56:77]
  wire  _T_189 = _T_182 | _T_188; // @[el2_ifu_iccm_mem.scala 55:179]
  wire  _T_196 = _T_163 & _T_20; // @[el2_ifu_iccm_mem.scala 55:145]
  wire  _T_197 = redundant_valid[0] & _T_196; // @[el2_ifu_iccm_mem.scala 55:71]
  wire  _T_203 = _T_170 & _T_23; // @[el2_ifu_iccm_mem.scala 56:77]
  wire  _T_204 = _T_197 | _T_203; // @[el2_ifu_iccm_mem.scala 55:179]
  wire  _T_211 = _T_163 & _T_25; // @[el2_ifu_iccm_mem.scala 55:145]
  wire  _T_212 = redundant_valid[0] & _T_211; // @[el2_ifu_iccm_mem.scala 55:71]
  wire  _T_218 = _T_170 & _T_28; // @[el2_ifu_iccm_mem.scala 56:77]
  wire  _T_219 = _T_212 | _T_218; // @[el2_ifu_iccm_mem.scala 55:179]
  wire [3:0] sel_red0 = {_T_219,_T_204,_T_189,_T_174}; // @[Cat.scala 29:58]
  reg [3:0] sel_red0_q; // @[el2_ifu_iccm_mem.scala 58:27]
  reg [3:0] sel_red1_q; // @[el2_ifu_iccm_mem.scala 59:27]
  wire  _T_227 = ~sel_red0_q[0]; // @[el2_ifu_iccm_mem.scala 65:36]
  wire  _T_229 = ~sel_red1_q[0]; // @[el2_ifu_iccm_mem.scala 65:53]
  wire  _T_230 = _T_227 & _T_229; // @[el2_ifu_iccm_mem.scala 65:51]
  reg [38:0] redundant_data_1; // @[Reg.scala 27:20]
  wire [38:0] _T_232 = sel_red1_q[0] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  reg [38:0] redundant_data_0; // @[Reg.scala 27:20]
  wire [38:0] _T_233 = sel_red0_q[0] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_0 = iccm_mem_0__T_97_data; // @[el2_ifu_iccm_mem.scala 45:28 el2_ifu_iccm_mem.scala 47:18]
  wire [38:0] _T_234 = _T_230 ? iccm_bank_dout_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_235 = _T_232 | _T_233; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_0 = _T_235 | _T_234; // @[Mux.scala 27:72]
  wire  _T_242 = ~sel_red0_q[1]; // @[el2_ifu_iccm_mem.scala 65:36]
  wire  _T_244 = ~sel_red1_q[1]; // @[el2_ifu_iccm_mem.scala 65:53]
  wire  _T_245 = _T_242 & _T_244; // @[el2_ifu_iccm_mem.scala 65:51]
  wire [38:0] _T_247 = sel_red1_q[1] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_248 = sel_red0_q[1] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_1 = iccm_mem_1__T_97_data; // @[el2_ifu_iccm_mem.scala 45:28 el2_ifu_iccm_mem.scala 47:18]
  wire [38:0] _T_249 = _T_245 ? iccm_bank_dout_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_250 = _T_247 | _T_248; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_1 = _T_250 | _T_249; // @[Mux.scala 27:72]
  wire  _T_257 = ~sel_red0_q[2]; // @[el2_ifu_iccm_mem.scala 65:36]
  wire  _T_259 = ~sel_red1_q[2]; // @[el2_ifu_iccm_mem.scala 65:53]
  wire  _T_260 = _T_257 & _T_259; // @[el2_ifu_iccm_mem.scala 65:51]
  wire [38:0] _T_262 = sel_red1_q[2] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_263 = sel_red0_q[2] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_2 = iccm_mem_2__T_97_data; // @[el2_ifu_iccm_mem.scala 45:28 el2_ifu_iccm_mem.scala 47:18]
  wire [38:0] _T_264 = _T_260 ? iccm_bank_dout_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_265 = _T_262 | _T_263; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_2 = _T_265 | _T_264; // @[Mux.scala 27:72]
  wire  _T_272 = ~sel_red0_q[3]; // @[el2_ifu_iccm_mem.scala 65:36]
  wire  _T_274 = ~sel_red1_q[3]; // @[el2_ifu_iccm_mem.scala 65:53]
  wire  _T_275 = _T_272 & _T_274; // @[el2_ifu_iccm_mem.scala 65:51]
  wire [38:0] _T_277 = sel_red1_q[3] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_278 = sel_red0_q[3] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_3 = iccm_mem_3__T_97_data; // @[el2_ifu_iccm_mem.scala 45:28 el2_ifu_iccm_mem.scala 47:18]
  wire [38:0] _T_279 = _T_275 ? iccm_bank_dout_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_280 = _T_277 | _T_278; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_3 = _T_280 | _T_279; // @[Mux.scala 27:72]
  reg  redundant_lru; // @[Reg.scala 27:20]
  wire  _T_282 = ~redundant_lru; // @[el2_ifu_iccm_mem.scala 67:20]
  wire  r0_addr_en = _T_282 & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 67:35]
  wire  r1_addr_en = redundant_lru & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 68:35]
  wire  _T_283 = |sel_red0; // @[el2_ifu_iccm_mem.scala 69:63]
  wire  _T_284 = |sel_red1; // @[el2_ifu_iccm_mem.scala 69:78]
  wire  _T_285 = _T_283 | _T_284; // @[el2_ifu_iccm_mem.scala 69:67]
  wire  _T_286 = _T_285 & io_iccm_rden; // @[el2_ifu_iccm_mem.scala 69:83]
  wire  _T_287 = _T_286 & io_iccm_correction_state; // @[el2_ifu_iccm_mem.scala 69:98]
  wire  redundant_lru_en = io_iccm_buf_correct_ecc | _T_287; // @[el2_ifu_iccm_mem.scala 69:50]
  wire  _GEN_11 = r1_addr_en | _T_298; // @[Reg.scala 28:19]
  wire  _GEN_12 = r0_addr_en | _T_299; // @[Reg.scala 28:19]
  wire  _T_303 = io_iccm_rw_addr[14:2] == redundant_address_0[13:1]; // @[el2_ifu_iccm_mem.scala 76:61]
  wire  _T_306 = io_iccm_rw_addr[1] & redundant_address_0[0]; // @[el2_ifu_iccm_mem.scala 77:26]
  wire  _T_309 = _T_306 | _T_1; // @[el2_ifu_iccm_mem.scala 77:52]
  wire  _T_310 = _T_303 & _T_309; // @[el2_ifu_iccm_mem.scala 76:102]
  wire  _T_312 = _T_310 & redundant_valid[0]; // @[el2_ifu_iccm_mem.scala 77:84]
  wire  _T_313 = _T_312 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 77:105]
  wire  redundant_data0_en = _T_313 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 77:121]
  wire  _T_322 = redundant_address_0[0] & _T_1; // @[el2_ifu_iccm_mem.scala 79:104]
  wire  _T_323 = _T_306 | _T_322; // @[el2_ifu_iccm_mem.scala 79:78]
  wire  _T_331 = io_iccm_rw_addr[14:2] == redundant_address_1[13:1]; // @[el2_ifu_iccm_mem.scala 83:61]
  wire  _T_334 = io_iccm_rw_addr[1] & redundant_address_1[0]; // @[el2_ifu_iccm_mem.scala 84:26]
  wire  _T_337 = _T_334 | _T_1; // @[el2_ifu_iccm_mem.scala 84:52]
  wire  _T_338 = _T_331 & _T_337; // @[el2_ifu_iccm_mem.scala 83:102]
  wire  _T_340 = _T_338 & redundant_valid[1]; // @[el2_ifu_iccm_mem.scala 84:84]
  wire  _T_341 = _T_340 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 84:105]
  wire  redundant_data1_en = _T_341 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 84:121]
  wire  _T_350 = redundant_address_1[0] & _T_1; // @[el2_ifu_iccm_mem.scala 86:104]
  wire  _T_351 = _T_334 | _T_350; // @[el2_ifu_iccm_mem.scala 86:78]
  reg [2:0] iccm_rd_addr_lo_q; // @[el2_ifu_iccm_mem.scala 90:34]
  reg [1:0] iccm_rd_addr_hi_q; // @[el2_ifu_iccm_mem.scala 91:34]
  wire  _T_359 = iccm_rd_addr_hi_q == 2'h0; // @[el2_ifu_iccm_mem.scala 93:86]
  wire  _T_361 = iccm_rd_addr_hi_q == 2'h1; // @[el2_ifu_iccm_mem.scala 93:86]
  wire  _T_363 = iccm_rd_addr_hi_q == 2'h2; // @[el2_ifu_iccm_mem.scala 93:86]
  wire  _T_365 = iccm_rd_addr_hi_q == 2'h3; // @[el2_ifu_iccm_mem.scala 93:86]
  wire [31:0] _T_367 = _T_359 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_368 = _T_361 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_369 = _T_363 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_370 = _T_365 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_371 = _T_367 | _T_368; // @[Mux.scala 27:72]
  wire [31:0] _T_372 = _T_371 | _T_369; // @[Mux.scala 27:72]
  wire [31:0] _T_373 = _T_372 | _T_370; // @[Mux.scala 27:72]
  wire  _T_376 = iccm_rd_addr_lo_q[1:0] == 2'h0; // @[el2_ifu_iccm_mem.scala 94:77]
  wire  _T_379 = iccm_rd_addr_lo_q[1:0] == 2'h1; // @[el2_ifu_iccm_mem.scala 94:77]
  wire  _T_382 = iccm_rd_addr_lo_q[1:0] == 2'h2; // @[el2_ifu_iccm_mem.scala 94:77]
  wire  _T_385 = iccm_rd_addr_lo_q[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 94:77]
  wire [31:0] _T_387 = _T_376 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_388 = _T_379 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_389 = _T_382 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_390 = _T_385 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_391 = _T_387 | _T_388; // @[Mux.scala 27:72]
  wire [31:0] _T_392 = _T_391 | _T_389; // @[Mux.scala 27:72]
  wire [31:0] _T_393 = _T_392 | _T_390; // @[Mux.scala 27:72]
  wire [63:0] iccm_rd_data_pre = {_T_373,_T_393}; // @[Cat.scala 29:58]
  wire [63:0] _T_399 = {16'h0,iccm_rd_data_pre[63:16]}; // @[Cat.scala 29:58]
  wire [38:0] _T_405 = _T_359 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_406 = _T_361 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_407 = _T_363 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_408 = _T_365 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_409 = _T_405 | _T_406; // @[Mux.scala 27:72]
  wire [38:0] _T_410 = _T_409 | _T_407; // @[Mux.scala 27:72]
  wire [38:0] _T_411 = _T_410 | _T_408; // @[Mux.scala 27:72]
  wire [38:0] _T_421 = _T_376 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_422 = _T_379 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_423 = _T_382 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_424 = _T_385 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_425 = _T_421 | _T_422; // @[Mux.scala 27:72]
  wire [38:0] _T_426 = _T_425 | _T_423; // @[Mux.scala 27:72]
  wire [38:0] _T_427 = _T_426 | _T_424; // @[Mux.scala 27:72]
  assign iccm_mem_0__T_97_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_0__T_97_data = iccm_mem_0[iccm_mem_0__T_97_addr]; // @[el2_ifu_iccm_mem.scala 40:21]
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
  assign iccm_mem_1__T_97_data = iccm_mem_1[iccm_mem_1__T_97_addr]; // @[el2_ifu_iccm_mem.scala 40:21]
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
  assign iccm_mem_2__T_97_data = iccm_mem_2[iccm_mem_2__T_97_addr]; // @[el2_ifu_iccm_mem.scala 40:21]
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
  assign iccm_mem_3__T_97_data = iccm_mem_3[iccm_mem_3__T_97_addr]; // @[el2_ifu_iccm_mem.scala 40:21]
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
  assign io_iccm_rd_data = iccm_rd_addr_lo_q[0] ? _T_399 : iccm_rd_data_pre; // @[el2_ifu_iccm_mem.scala 22:19 el2_ifu_iccm_mem.scala 95:19]
  assign io_iccm_rd_data_ecc = {_T_411,_T_427}; // @[el2_ifu_iccm_mem.scala 23:23 el2_ifu_iccm_mem.scala 96:23]
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
  _RAND_4 = {1{`RANDOM}};
  _T_298 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_299 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  redundant_address_1 = _RAND_6[13:0];
  _RAND_7 = {1{`RANDOM}};
  redundant_address_0 = _RAND_7[13:0];
  _RAND_8 = {1{`RANDOM}};
  sel_red0_q = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  sel_red1_q = _RAND_9[3:0];
  _RAND_10 = {2{`RANDOM}};
  redundant_data_1 = _RAND_10[38:0];
  _RAND_11 = {2{`RANDOM}};
  redundant_data_0 = _RAND_11[38:0];
  _RAND_12 = {1{`RANDOM}};
  redundant_lru = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  iccm_rd_addr_lo_q = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  iccm_rd_addr_hi_q = _RAND_14[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(iccm_mem_0__T_93_en & iccm_mem_0__T_93_mask) begin
      iccm_mem_0[iccm_mem_0__T_93_addr] <= iccm_mem_0__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_0__T_94_en & iccm_mem_0__T_94_mask) begin
      iccm_mem_0[iccm_mem_0__T_94_addr] <= iccm_mem_0__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_0__T_95_en & iccm_mem_0__T_95_mask) begin
      iccm_mem_0[iccm_mem_0__T_95_addr] <= iccm_mem_0__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_0__T_96_en & iccm_mem_0__T_96_mask) begin
      iccm_mem_0[iccm_mem_0__T_96_addr] <= iccm_mem_0__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_1__T_93_en & iccm_mem_1__T_93_mask) begin
      iccm_mem_1[iccm_mem_1__T_93_addr] <= iccm_mem_1__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_1__T_94_en & iccm_mem_1__T_94_mask) begin
      iccm_mem_1[iccm_mem_1__T_94_addr] <= iccm_mem_1__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_1__T_95_en & iccm_mem_1__T_95_mask) begin
      iccm_mem_1[iccm_mem_1__T_95_addr] <= iccm_mem_1__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_1__T_96_en & iccm_mem_1__T_96_mask) begin
      iccm_mem_1[iccm_mem_1__T_96_addr] <= iccm_mem_1__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_2__T_93_en & iccm_mem_2__T_93_mask) begin
      iccm_mem_2[iccm_mem_2__T_93_addr] <= iccm_mem_2__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_2__T_94_en & iccm_mem_2__T_94_mask) begin
      iccm_mem_2[iccm_mem_2__T_94_addr] <= iccm_mem_2__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_2__T_95_en & iccm_mem_2__T_95_mask) begin
      iccm_mem_2[iccm_mem_2__T_95_addr] <= iccm_mem_2__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_2__T_96_en & iccm_mem_2__T_96_mask) begin
      iccm_mem_2[iccm_mem_2__T_96_addr] <= iccm_mem_2__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_3__T_93_en & iccm_mem_3__T_93_mask) begin
      iccm_mem_3[iccm_mem_3__T_93_addr] <= iccm_mem_3__T_93_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_3__T_94_en & iccm_mem_3__T_94_mask) begin
      iccm_mem_3[iccm_mem_3__T_94_addr] <= iccm_mem_3__T_94_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_3__T_95_en & iccm_mem_3__T_95_mask) begin
      iccm_mem_3[iccm_mem_3__T_95_addr] <= iccm_mem_3__T_95_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if(iccm_mem_3__T_96_en & iccm_mem_3__T_96_mask) begin
      iccm_mem_3[iccm_mem_3__T_96_addr] <= iccm_mem_3__T_96_data; // @[el2_ifu_iccm_mem.scala 40:21]
    end
    if (reset) begin
      _T_298 <= 1'h0;
    end else begin
      _T_298 <= _GEN_11;
    end
    if (reset) begin
      _T_299 <= 1'h0;
    end else begin
      _T_299 <= _GEN_12;
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
      if (_T_351) begin
        redundant_data_1 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_1 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_data_0 <= 39'h0;
    end else if (redundant_data0_en) begin
      if (_T_323) begin
        redundant_data_0 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_0 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_lru <= 1'h0;
    end else if (redundant_lru_en) begin
      if (io_iccm_buf_correct_ecc) begin
        redundant_lru <= _T_282;
      end else begin
        redundant_lru <= _T_283;
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
