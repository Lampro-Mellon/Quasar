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
  reg [38:0] iccm_mem_0 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_101_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_101_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_107_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_107_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_110_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_110_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_98_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_98_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_98_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_100_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_100_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_0__T_100_en; // @[el2_ifu_iccm_mem.scala 41:21]
  reg [38:0] iccm_mem_1 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_101_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_101_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_107_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_107_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_110_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_110_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_98_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_98_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_98_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_100_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_100_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_1__T_100_en; // @[el2_ifu_iccm_mem.scala 41:21]
  reg [38:0] iccm_mem_2 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_101_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_101_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_107_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_107_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_110_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_110_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_98_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_98_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_98_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_100_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_100_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_2__T_100_en; // @[el2_ifu_iccm_mem.scala 41:21]
  reg [38:0] iccm_mem_3 [0:4095]; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_101_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_101_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_107_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_107_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_110_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_110_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_94_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_94_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_94_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_96_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_96_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_96_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_98_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_98_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_98_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_100_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_100_mask; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  iccm_mem_3__T_100_en; // @[el2_ifu_iccm_mem.scala 41:21]
  wire  _T_1 = io_iccm_wr_size[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 24:43]
  wire [1:0] addr_inc = _T_1 ? 2'h2 : 2'h1; // @[el2_ifu_iccm_mem.scala 24:21]
  wire [14:0] _GEN_31 = {{13'd0}, addr_inc}; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [14:0] addr_bank_inc = io_iccm_rw_addr + _GEN_31; // @[el2_ifu_iccm_mem.scala 25:54]
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
  reg [38:0] iccm_bank_dout_0; // @[el2_ifu_iccm_mem.scala 51:59]
  reg [38:0] iccm_bank_dout_1; // @[el2_ifu_iccm_mem.scala 51:59]
  reg [38:0] iccm_bank_dout_2; // @[el2_ifu_iccm_mem.scala 51:59]
  reg [38:0] iccm_bank_dout_3; // @[el2_ifu_iccm_mem.scala 51:59]
  reg  _T_313; // @[Reg.scala 27:20]
  reg  _T_314; // @[Reg.scala 27:20]
  wire [1:0] redundant_valid = {_T_313,_T_314}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_1; // @[Reg.scala 27:20]
  wire  _T_116 = io_iccm_rw_addr[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 65:105]
  wire  _T_119 = _T_116 & _T_10; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_120 = redundant_valid[1] & _T_119; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_123 = addr_bank_inc[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 66:37]
  wire  _T_126 = _T_123 & _T_12; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_127 = _T_120 | _T_126; // @[el2_ifu_iccm_mem.scala 65:179]
  wire  _T_134 = _T_116 & _T_15; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_135 = redundant_valid[1] & _T_134; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_141 = _T_123 & _T_17; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_142 = _T_135 | _T_141; // @[el2_ifu_iccm_mem.scala 65:179]
  wire  _T_149 = _T_116 & _T_20; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_150 = redundant_valid[1] & _T_149; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_156 = _T_123 & _T_22; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_157 = _T_150 | _T_156; // @[el2_ifu_iccm_mem.scala 65:179]
  wire  _T_164 = _T_116 & _T_25; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_165 = redundant_valid[1] & _T_164; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_171 = _T_123 & _T_27; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_172 = _T_165 | _T_171; // @[el2_ifu_iccm_mem.scala 65:179]
  wire [3:0] sel_red1 = {_T_172,_T_157,_T_142,_T_127}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_0; // @[Reg.scala 27:20]
  wire  _T_178 = io_iccm_rw_addr[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 67:105]
  wire  _T_181 = _T_178 & _T_10; // @[el2_ifu_iccm_mem.scala 67:145]
  wire  _T_182 = redundant_valid[0] & _T_181; // @[el2_ifu_iccm_mem.scala 67:71]
  wire  _T_185 = addr_bank_inc[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 68:37]
  wire  _T_188 = _T_185 & _T_12; // @[el2_ifu_iccm_mem.scala 68:77]
  wire  _T_189 = _T_182 | _T_188; // @[el2_ifu_iccm_mem.scala 67:179]
  wire  _T_196 = _T_178 & _T_15; // @[el2_ifu_iccm_mem.scala 67:145]
  wire  _T_197 = redundant_valid[0] & _T_196; // @[el2_ifu_iccm_mem.scala 67:71]
  wire  _T_203 = _T_185 & _T_17; // @[el2_ifu_iccm_mem.scala 68:77]
  wire  _T_204 = _T_197 | _T_203; // @[el2_ifu_iccm_mem.scala 67:179]
  wire  _T_211 = _T_178 & _T_20; // @[el2_ifu_iccm_mem.scala 67:145]
  wire  _T_212 = redundant_valid[0] & _T_211; // @[el2_ifu_iccm_mem.scala 67:71]
  wire  _T_218 = _T_185 & _T_22; // @[el2_ifu_iccm_mem.scala 68:77]
  wire  _T_219 = _T_212 | _T_218; // @[el2_ifu_iccm_mem.scala 67:179]
  wire  _T_226 = _T_178 & _T_25; // @[el2_ifu_iccm_mem.scala 67:145]
  wire  _T_227 = redundant_valid[0] & _T_226; // @[el2_ifu_iccm_mem.scala 67:71]
  wire  _T_233 = _T_185 & _T_27; // @[el2_ifu_iccm_mem.scala 68:77]
  wire  _T_234 = _T_227 | _T_233; // @[el2_ifu_iccm_mem.scala 67:179]
  wire [3:0] sel_red0 = {_T_234,_T_219,_T_204,_T_189}; // @[Cat.scala 29:58]
  reg [3:0] sel_red0_q; // @[el2_ifu_iccm_mem.scala 70:27]
  reg [3:0] sel_red1_q; // @[el2_ifu_iccm_mem.scala 71:27]
  wire  _T_242 = ~sel_red0_q[0]; // @[el2_ifu_iccm_mem.scala 77:36]
  wire  _T_244 = ~sel_red1_q[0]; // @[el2_ifu_iccm_mem.scala 77:53]
  wire  _T_245 = _T_242 & _T_244; // @[el2_ifu_iccm_mem.scala 77:51]
  reg [38:0] redundant_data_1; // @[Reg.scala 27:20]
  wire [38:0] _T_247 = sel_red1_q[0] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  reg [38:0] redundant_data_0; // @[Reg.scala 27:20]
  wire [38:0] _T_248 = sel_red0_q[0] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_249 = _T_245 ? iccm_bank_dout_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_250 = _T_247 | _T_248; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_0 = _T_250 | _T_249; // @[Mux.scala 27:72]
  wire  _T_257 = ~sel_red0_q[1]; // @[el2_ifu_iccm_mem.scala 77:36]
  wire  _T_259 = ~sel_red1_q[1]; // @[el2_ifu_iccm_mem.scala 77:53]
  wire  _T_260 = _T_257 & _T_259; // @[el2_ifu_iccm_mem.scala 77:51]
  wire [38:0] _T_262 = sel_red1_q[1] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_263 = sel_red0_q[1] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_264 = _T_260 ? iccm_bank_dout_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_265 = _T_262 | _T_263; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_1 = _T_265 | _T_264; // @[Mux.scala 27:72]
  wire  _T_272 = ~sel_red0_q[2]; // @[el2_ifu_iccm_mem.scala 77:36]
  wire  _T_274 = ~sel_red1_q[2]; // @[el2_ifu_iccm_mem.scala 77:53]
  wire  _T_275 = _T_272 & _T_274; // @[el2_ifu_iccm_mem.scala 77:51]
  wire [38:0] _T_277 = sel_red1_q[2] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_278 = sel_red0_q[2] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_279 = _T_275 ? iccm_bank_dout_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_280 = _T_277 | _T_278; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_2 = _T_280 | _T_279; // @[Mux.scala 27:72]
  wire  _T_287 = ~sel_red0_q[3]; // @[el2_ifu_iccm_mem.scala 77:36]
  wire  _T_289 = ~sel_red1_q[3]; // @[el2_ifu_iccm_mem.scala 77:53]
  wire  _T_290 = _T_287 & _T_289; // @[el2_ifu_iccm_mem.scala 77:51]
  wire [38:0] _T_292 = sel_red1_q[3] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_293 = sel_red0_q[3] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_294 = _T_290 ? iccm_bank_dout_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_295 = _T_292 | _T_293; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_3 = _T_295 | _T_294; // @[Mux.scala 27:72]
  reg  redundant_lru; // @[Reg.scala 27:20]
  wire  _T_297 = ~redundant_lru; // @[el2_ifu_iccm_mem.scala 79:20]
  wire  r0_addr_en = _T_297 & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 79:35]
  wire  r1_addr_en = redundant_lru & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 80:35]
  wire  _T_298 = |sel_red0; // @[el2_ifu_iccm_mem.scala 81:63]
  wire  _T_299 = |sel_red1; // @[el2_ifu_iccm_mem.scala 81:78]
  wire  _T_300 = _T_298 | _T_299; // @[el2_ifu_iccm_mem.scala 81:67]
  wire  _T_301 = _T_300 & io_iccm_rden; // @[el2_ifu_iccm_mem.scala 81:83]
  wire  _T_302 = _T_301 & io_iccm_correction_state; // @[el2_ifu_iccm_mem.scala 81:98]
  wire  redundant_lru_en = io_iccm_buf_correct_ecc | _T_302; // @[el2_ifu_iccm_mem.scala 81:50]
  wire  _GEN_27 = r1_addr_en | _T_313; // @[Reg.scala 28:19]
  wire  _GEN_28 = r0_addr_en | _T_314; // @[Reg.scala 28:19]
  wire  _T_318 = io_iccm_rw_addr[14:2] == redundant_address_0[13:1]; // @[el2_ifu_iccm_mem.scala 88:61]
  wire  _T_321 = io_iccm_rw_addr[1] & redundant_address_0[0]; // @[el2_ifu_iccm_mem.scala 89:26]
  wire  _T_324 = _T_321 | _T_1; // @[el2_ifu_iccm_mem.scala 89:52]
  wire  _T_325 = _T_318 & _T_324; // @[el2_ifu_iccm_mem.scala 88:102]
  wire  _T_327 = _T_325 & redundant_valid[0]; // @[el2_ifu_iccm_mem.scala 89:84]
  wire  _T_328 = _T_327 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 89:105]
  wire  redundant_data0_en = _T_328 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 89:121]
  wire  _T_337 = redundant_address_0[0] & _T_1; // @[el2_ifu_iccm_mem.scala 91:104]
  wire  _T_338 = _T_321 | _T_337; // @[el2_ifu_iccm_mem.scala 91:78]
  wire  _T_346 = io_iccm_rw_addr[14:2] == redundant_address_1[13:1]; // @[el2_ifu_iccm_mem.scala 95:61]
  wire  _T_349 = io_iccm_rw_addr[1] & redundant_address_1[0]; // @[el2_ifu_iccm_mem.scala 96:26]
  wire  _T_352 = _T_349 | _T_1; // @[el2_ifu_iccm_mem.scala 96:52]
  wire  _T_353 = _T_346 & _T_352; // @[el2_ifu_iccm_mem.scala 95:102]
  wire  _T_355 = _T_353 & redundant_valid[1]; // @[el2_ifu_iccm_mem.scala 96:84]
  wire  _T_356 = _T_355 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 96:105]
  wire  redundant_data1_en = _T_356 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 96:121]
  wire  _T_365 = redundant_address_1[0] & _T_1; // @[el2_ifu_iccm_mem.scala 98:104]
  wire  _T_366 = _T_349 | _T_365; // @[el2_ifu_iccm_mem.scala 98:78]
  reg [2:0] iccm_rd_addr_lo_q; // @[el2_ifu_iccm_mem.scala 102:34]
  reg [1:0] iccm_rd_addr_hi_q; // @[el2_ifu_iccm_mem.scala 103:34]
  wire  _T_374 = iccm_rd_addr_hi_q == 2'h0; // @[el2_ifu_iccm_mem.scala 105:86]
  wire  _T_376 = iccm_rd_addr_hi_q == 2'h1; // @[el2_ifu_iccm_mem.scala 105:86]
  wire  _T_378 = iccm_rd_addr_hi_q == 2'h2; // @[el2_ifu_iccm_mem.scala 105:86]
  wire  _T_380 = iccm_rd_addr_hi_q == 2'h3; // @[el2_ifu_iccm_mem.scala 105:86]
  wire [31:0] _T_382 = _T_374 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_383 = _T_376 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_384 = _T_378 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_385 = _T_380 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_386 = _T_382 | _T_383; // @[Mux.scala 27:72]
  wire [31:0] _T_387 = _T_386 | _T_384; // @[Mux.scala 27:72]
  wire [31:0] _T_388 = _T_387 | _T_385; // @[Mux.scala 27:72]
  wire  _T_391 = iccm_rd_addr_lo_q[1:0] == 2'h0; // @[el2_ifu_iccm_mem.scala 106:77]
  wire  _T_394 = iccm_rd_addr_lo_q[1:0] == 2'h1; // @[el2_ifu_iccm_mem.scala 106:77]
  wire  _T_397 = iccm_rd_addr_lo_q[1:0] == 2'h2; // @[el2_ifu_iccm_mem.scala 106:77]
  wire  _T_400 = iccm_rd_addr_lo_q[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 106:77]
  wire [31:0] _T_402 = _T_391 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_403 = _T_394 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = _T_397 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_405 = _T_400 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_406 = _T_402 | _T_403; // @[Mux.scala 27:72]
  wire [31:0] _T_407 = _T_406 | _T_404; // @[Mux.scala 27:72]
  wire [31:0] _T_408 = _T_407 | _T_405; // @[Mux.scala 27:72]
  wire [63:0] iccm_rd_data_pre = {_T_388,_T_408}; // @[Cat.scala 29:58]
  wire [63:0] _T_414 = {16'h0,iccm_rd_data_pre[63:16]}; // @[Cat.scala 29:58]
  wire [38:0] _T_420 = _T_374 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_421 = _T_376 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_422 = _T_378 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_423 = _T_380 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_424 = _T_420 | _T_421; // @[Mux.scala 27:72]
  wire [38:0] _T_425 = _T_424 | _T_422; // @[Mux.scala 27:72]
  wire [38:0] _T_426 = _T_425 | _T_423; // @[Mux.scala 27:72]
  wire [38:0] _T_436 = _T_391 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_437 = _T_394 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_438 = _T_397 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_439 = _T_400 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_440 = _T_436 | _T_437; // @[Mux.scala 27:72]
  wire [38:0] _T_441 = _T_440 | _T_438; // @[Mux.scala 27:72]
  wire [38:0] _T_442 = _T_441 | _T_439; // @[Mux.scala 27:72]
  assign iccm_mem_0__T_101_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_0__T_101_data = iccm_mem_0[iccm_mem_0__T_101_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_104_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_0__T_104_data = iccm_mem_0[iccm_mem_0__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_107_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_0__T_107_data = iccm_mem_0[iccm_mem_0__T_107_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_110_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_0__T_110_data = iccm_mem_0[iccm_mem_0__T_110_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_94_data = io_iccm_wr_data[38:0];
  assign iccm_mem_0__T_94_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_0__T_94_mask = 1'h1;
  assign iccm_mem_0__T_94_en = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_0__T_96_data = 39'h0;
  assign iccm_mem_0__T_96_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_0__T_96_mask = 1'h0;
  assign iccm_mem_0__T_96_en = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_0__T_98_data = 39'h0;
  assign iccm_mem_0__T_98_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_0__T_98_mask = 1'h0;
  assign iccm_mem_0__T_98_en = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_0__T_100_data = 39'h0;
  assign iccm_mem_0__T_100_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_0__T_100_mask = 1'h0;
  assign iccm_mem_0__T_100_en = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_1__T_101_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_1__T_101_data = iccm_mem_1[iccm_mem_1__T_101_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_104_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_1__T_104_data = iccm_mem_1[iccm_mem_1__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_107_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_1__T_107_data = iccm_mem_1[iccm_mem_1__T_107_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_110_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_1__T_110_data = iccm_mem_1[iccm_mem_1__T_110_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_94_data = 39'h0;
  assign iccm_mem_1__T_94_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_1__T_94_mask = 1'h0;
  assign iccm_mem_1__T_94_en = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_1__T_96_data = io_iccm_wr_data[77:39];
  assign iccm_mem_1__T_96_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_1__T_96_mask = 1'h1;
  assign iccm_mem_1__T_96_en = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_1__T_98_data = 39'h0;
  assign iccm_mem_1__T_98_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_1__T_98_mask = 1'h0;
  assign iccm_mem_1__T_98_en = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_1__T_100_data = 39'h0;
  assign iccm_mem_1__T_100_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_1__T_100_mask = 1'h0;
  assign iccm_mem_1__T_100_en = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_2__T_101_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_2__T_101_data = iccm_mem_2[iccm_mem_2__T_101_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_104_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_2__T_104_data = iccm_mem_2[iccm_mem_2__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_107_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_2__T_107_data = iccm_mem_2[iccm_mem_2__T_107_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_110_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_2__T_110_data = iccm_mem_2[iccm_mem_2__T_110_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_94_data = 39'h0;
  assign iccm_mem_2__T_94_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_2__T_94_mask = 1'h0;
  assign iccm_mem_2__T_94_en = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_2__T_96_data = 39'h0;
  assign iccm_mem_2__T_96_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_2__T_96_mask = 1'h0;
  assign iccm_mem_2__T_96_en = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_2__T_98_data = io_iccm_wr_data[38:0];
  assign iccm_mem_2__T_98_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_2__T_98_mask = 1'h1;
  assign iccm_mem_2__T_98_en = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_2__T_100_data = 39'h0;
  assign iccm_mem_2__T_100_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_2__T_100_mask = 1'h0;
  assign iccm_mem_2__T_100_en = iccm_clken_3 & wren_bank_3;
  assign iccm_mem_3__T_101_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_3__T_101_data = iccm_mem_3[iccm_mem_3__T_101_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_104_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_3__T_104_data = iccm_mem_3[iccm_mem_3__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_107_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_3__T_107_data = iccm_mem_3[iccm_mem_3__T_107_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_110_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_3__T_110_data = iccm_mem_3[iccm_mem_3__T_110_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_94_data = 39'h0;
  assign iccm_mem_3__T_94_addr = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59;
  assign iccm_mem_3__T_94_mask = 1'h0;
  assign iccm_mem_3__T_94_en = iccm_clken_0 & wren_bank_0;
  assign iccm_mem_3__T_96_data = 39'h0;
  assign iccm_mem_3__T_96_addr = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66;
  assign iccm_mem_3__T_96_mask = 1'h0;
  assign iccm_mem_3__T_96_en = iccm_clken_1 & wren_bank_1;
  assign iccm_mem_3__T_98_data = 39'h0;
  assign iccm_mem_3__T_98_addr = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73;
  assign iccm_mem_3__T_98_mask = 1'h0;
  assign iccm_mem_3__T_98_en = iccm_clken_2 & wren_bank_2;
  assign iccm_mem_3__T_100_data = io_iccm_wr_data[77:39];
  assign iccm_mem_3__T_100_addr = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80;
  assign iccm_mem_3__T_100_mask = 1'h1;
  assign iccm_mem_3__T_100_en = iccm_clken_3 & wren_bank_3;
  assign io_iccm_rd_data = iccm_rd_addr_lo_q[0] ? _T_414 : iccm_rd_data_pre; // @[el2_ifu_iccm_mem.scala 22:19 el2_ifu_iccm_mem.scala 107:19]
  assign io_iccm_rd_data_ecc = {_T_426,_T_442}; // @[el2_ifu_iccm_mem.scala 23:23 el2_ifu_iccm_mem.scala 108:23]
  assign io_iccm_bank_addr_0 = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59; // @[el2_ifu_iccm_mem.scala 56:21]
  assign io_iccm_bank_addr_1 = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66; // @[el2_ifu_iccm_mem.scala 56:21]
  assign io_iccm_bank_addr_2 = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73; // @[el2_ifu_iccm_mem.scala 56:21]
  assign io_iccm_bank_addr_3 = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80; // @[el2_ifu_iccm_mem.scala 56:21]
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
  _T_313 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_314 = _RAND_9[0:0];
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
    if(iccm_mem_0__T_94_en & iccm_mem_0__T_94_mask) begin
      iccm_mem_0[iccm_mem_0__T_94_addr] <= iccm_mem_0__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_0__T_96_en & iccm_mem_0__T_96_mask) begin
      iccm_mem_0[iccm_mem_0__T_96_addr] <= iccm_mem_0__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_0__T_98_en & iccm_mem_0__T_98_mask) begin
      iccm_mem_0[iccm_mem_0__T_98_addr] <= iccm_mem_0__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_0__T_100_en & iccm_mem_0__T_100_mask) begin
      iccm_mem_0[iccm_mem_0__T_100_addr] <= iccm_mem_0__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_94_en & iccm_mem_1__T_94_mask) begin
      iccm_mem_1[iccm_mem_1__T_94_addr] <= iccm_mem_1__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_96_en & iccm_mem_1__T_96_mask) begin
      iccm_mem_1[iccm_mem_1__T_96_addr] <= iccm_mem_1__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_98_en & iccm_mem_1__T_98_mask) begin
      iccm_mem_1[iccm_mem_1__T_98_addr] <= iccm_mem_1__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_1__T_100_en & iccm_mem_1__T_100_mask) begin
      iccm_mem_1[iccm_mem_1__T_100_addr] <= iccm_mem_1__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_94_en & iccm_mem_2__T_94_mask) begin
      iccm_mem_2[iccm_mem_2__T_94_addr] <= iccm_mem_2__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_96_en & iccm_mem_2__T_96_mask) begin
      iccm_mem_2[iccm_mem_2__T_96_addr] <= iccm_mem_2__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_98_en & iccm_mem_2__T_98_mask) begin
      iccm_mem_2[iccm_mem_2__T_98_addr] <= iccm_mem_2__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_2__T_100_en & iccm_mem_2__T_100_mask) begin
      iccm_mem_2[iccm_mem_2__T_100_addr] <= iccm_mem_2__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_94_en & iccm_mem_3__T_94_mask) begin
      iccm_mem_3[iccm_mem_3__T_94_addr] <= iccm_mem_3__T_94_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_96_en & iccm_mem_3__T_96_mask) begin
      iccm_mem_3[iccm_mem_3__T_96_addr] <= iccm_mem_3__T_96_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_98_en & iccm_mem_3__T_98_mask) begin
      iccm_mem_3[iccm_mem_3__T_98_addr] <= iccm_mem_3__T_98_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if(iccm_mem_3__T_100_en & iccm_mem_3__T_100_mask) begin
      iccm_mem_3[iccm_mem_3__T_100_addr] <= iccm_mem_3__T_100_data; // @[el2_ifu_iccm_mem.scala 41:21]
    end
    if (reset) begin
      iccm_bank_dout_0 <= 39'h0;
    end else begin
      iccm_bank_dout_0 <= iccm_mem_0__T_110_data;
    end
    if (reset) begin
      iccm_bank_dout_1 <= 39'h0;
    end else begin
      iccm_bank_dout_1 <= iccm_mem_1__T_110_data;
    end
    if (reset) begin
      iccm_bank_dout_2 <= 39'h0;
    end else begin
      iccm_bank_dout_2 <= iccm_mem_2__T_110_data;
    end
    if (reset) begin
      iccm_bank_dout_3 <= 39'h0;
    end else begin
      iccm_bank_dout_3 <= iccm_mem_3__T_110_data;
    end
    if (reset) begin
      _T_313 <= 1'h0;
    end else begin
      _T_313 <= _GEN_27;
    end
    if (reset) begin
      _T_314 <= 1'h0;
    end else begin
      _T_314 <= _GEN_28;
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
      if (_T_366) begin
        redundant_data_1 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_1 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_data_0 <= 39'h0;
    end else if (redundant_data0_en) begin
      if (_T_338) begin
        redundant_data_0 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_0 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_lru <= 1'h0;
    end else if (redundant_lru_en) begin
      if (io_iccm_buf_correct_ecc) begin
        redundant_lru <= _T_297;
      end else begin
        redundant_lru <= _T_298;
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
