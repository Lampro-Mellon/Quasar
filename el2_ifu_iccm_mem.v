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
  wire [38:0] iccm_mem_0__T_103_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_103_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_108_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_108_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_113_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_113_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_118_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_118_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] iccm_mem_1__T_103_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_103_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_108_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_108_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_113_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_113_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_118_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_118_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] iccm_mem_2__T_103_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_103_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_108_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_108_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_113_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_113_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_118_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_118_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] iccm_mem_3__T_103_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_103_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_108_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_108_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_113_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_113_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_118_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_118_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [14:0] _GEN_47 = {{13'd0}, addr_inc}; // @[el2_ifu_iccm_mem.scala 25:54]
  wire [14:0] addr_bank_inc = io_iccm_rw_addr + _GEN_47; // @[el2_ifu_iccm_mem.scala 25:54]
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
  wire [11:0] addr_bank_0 = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59; // @[el2_ifu_iccm_mem.scala 38:55]
  wire [11:0] _T_66 = _T_17 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] addr_bank_1 = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66; // @[el2_ifu_iccm_mem.scala 38:55]
  wire [11:0] _T_73 = _T_22 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] addr_bank_2 = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73; // @[el2_ifu_iccm_mem.scala 38:55]
  wire [11:0] _T_80 = _T_27 ? addr_bank_inc[14:3] : io_iccm_rw_addr[14:3]; // @[el2_ifu_iccm_mem.scala 39:8]
  wire [11:0] addr_bank_3 = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80; // @[el2_ifu_iccm_mem.scala 38:55]
  wire  _T_85 = ~wren_bank_0; // @[el2_ifu_iccm_mem.scala 44:72]
  wire  read_enable_0 = iccm_clken_0 & _T_85; // @[el2_ifu_iccm_mem.scala 44:70]
  wire  _T_87 = ~wren_bank_1; // @[el2_ifu_iccm_mem.scala 44:72]
  wire  read_enable_1 = iccm_clken_1 & _T_87; // @[el2_ifu_iccm_mem.scala 44:70]
  wire  _T_89 = ~wren_bank_2; // @[el2_ifu_iccm_mem.scala 44:72]
  wire  read_enable_2 = iccm_clken_2 & _T_89; // @[el2_ifu_iccm_mem.scala 44:70]
  wire  _T_91 = ~wren_bank_3; // @[el2_ifu_iccm_mem.scala 44:72]
  wire  read_enable_3 = iccm_clken_3 & _T_91; // @[el2_ifu_iccm_mem.scala 44:70]
  wire [38:0] _T_102 = read_enable_0 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_24 = iccm_mem_0__T_103_data; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_25 = 2'h1 == addr_bank_0[1:0] ? iccm_mem_1__T_103_data : _GEN_24; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_26 = 2'h2 == addr_bank_0[1:0] ? iccm_mem_2__T_103_data : _GEN_25; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_27 = 2'h3 == addr_bank_0[1:0] ? iccm_mem_3__T_103_data : _GEN_26; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _T_107 = read_enable_1 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_28 = iccm_mem_0__T_108_data; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_29 = 2'h1 == addr_bank_1[1:0] ? iccm_mem_1__T_108_data : _GEN_28; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_30 = 2'h2 == addr_bank_1[1:0] ? iccm_mem_2__T_108_data : _GEN_29; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_31 = 2'h3 == addr_bank_1[1:0] ? iccm_mem_3__T_108_data : _GEN_30; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _T_112 = read_enable_2 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_32 = iccm_mem_0__T_113_data; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_33 = 2'h1 == addr_bank_2[1:0] ? iccm_mem_1__T_113_data : _GEN_32; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_34 = 2'h2 == addr_bank_2[1:0] ? iccm_mem_2__T_113_data : _GEN_33; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_35 = 2'h3 == addr_bank_2[1:0] ? iccm_mem_3__T_113_data : _GEN_34; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _T_117 = read_enable_3 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_36 = iccm_mem_0__T_118_data; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_37 = 2'h1 == addr_bank_3[1:0] ? iccm_mem_1__T_118_data : _GEN_36; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_38 = 2'h2 == addr_bank_3[1:0] ? iccm_mem_2__T_118_data : _GEN_37; // @[el2_ifu_iccm_mem.scala 51:67]
  wire [38:0] _GEN_39 = 2'h3 == addr_bank_3[1:0] ? iccm_mem_3__T_118_data : _GEN_38; // @[el2_ifu_iccm_mem.scala 51:67]
  reg [38:0] iccm_bank_dout_0; // @[el2_ifu_iccm_mem.scala 52:62]
  reg [38:0] iccm_bank_dout_1; // @[el2_ifu_iccm_mem.scala 52:62]
  reg [38:0] iccm_bank_dout_2; // @[el2_ifu_iccm_mem.scala 52:62]
  reg [38:0] iccm_bank_dout_3; // @[el2_ifu_iccm_mem.scala 52:62]
  reg  _T_325; // @[Reg.scala 27:20]
  reg  _T_326; // @[Reg.scala 27:20]
  wire [1:0] redundant_valid = {_T_325,_T_326}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_1; // @[Reg.scala 27:20]
  wire  _T_128 = io_iccm_rw_addr[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 63:105]
  wire  _T_131 = _T_128 & _T_10; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_132 = redundant_valid[1] & _T_131; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_135 = addr_bank_inc[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 64:37]
  wire  _T_138 = _T_135 & _T_12; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_139 = _T_132 | _T_138; // @[el2_ifu_iccm_mem.scala 63:179]
  wire  _T_146 = _T_128 & _T_15; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_147 = redundant_valid[1] & _T_146; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_153 = _T_135 & _T_17; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_154 = _T_147 | _T_153; // @[el2_ifu_iccm_mem.scala 63:179]
  wire  _T_161 = _T_128 & _T_20; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_162 = redundant_valid[1] & _T_161; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_168 = _T_135 & _T_22; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_169 = _T_162 | _T_168; // @[el2_ifu_iccm_mem.scala 63:179]
  wire  _T_176 = _T_128 & _T_25; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_177 = redundant_valid[1] & _T_176; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_183 = _T_135 & _T_27; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_184 = _T_177 | _T_183; // @[el2_ifu_iccm_mem.scala 63:179]
  wire [3:0] sel_red1 = {_T_184,_T_169,_T_154,_T_139}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_0; // @[Reg.scala 27:20]
  wire  _T_190 = io_iccm_rw_addr[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 65:105]
  wire  _T_193 = _T_190 & _T_10; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_194 = redundant_valid[0] & _T_193; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_197 = addr_bank_inc[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 66:37]
  wire  _T_200 = _T_197 & _T_12; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_201 = _T_194 | _T_200; // @[el2_ifu_iccm_mem.scala 65:179]
  wire  _T_208 = _T_190 & _T_15; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_209 = redundant_valid[0] & _T_208; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_215 = _T_197 & _T_17; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_216 = _T_209 | _T_215; // @[el2_ifu_iccm_mem.scala 65:179]
  wire  _T_223 = _T_190 & _T_20; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_224 = redundant_valid[0] & _T_223; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_230 = _T_197 & _T_22; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_231 = _T_224 | _T_230; // @[el2_ifu_iccm_mem.scala 65:179]
  wire  _T_238 = _T_190 & _T_25; // @[el2_ifu_iccm_mem.scala 65:145]
  wire  _T_239 = redundant_valid[0] & _T_238; // @[el2_ifu_iccm_mem.scala 65:71]
  wire  _T_245 = _T_197 & _T_27; // @[el2_ifu_iccm_mem.scala 66:77]
  wire  _T_246 = _T_239 | _T_245; // @[el2_ifu_iccm_mem.scala 65:179]
  wire [3:0] sel_red0 = {_T_246,_T_231,_T_216,_T_201}; // @[Cat.scala 29:58]
  reg [3:0] sel_red0_q; // @[el2_ifu_iccm_mem.scala 68:27]
  reg [3:0] sel_red1_q; // @[el2_ifu_iccm_mem.scala 69:27]
  wire  _T_254 = ~sel_red0_q[0]; // @[el2_ifu_iccm_mem.scala 75:36]
  wire  _T_256 = ~sel_red1_q[0]; // @[el2_ifu_iccm_mem.scala 75:53]
  wire  _T_257 = _T_254 & _T_256; // @[el2_ifu_iccm_mem.scala 75:51]
  reg [38:0] redundant_data_1; // @[Reg.scala 27:20]
  wire [38:0] _T_259 = sel_red1_q[0] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  reg [38:0] redundant_data_0; // @[Reg.scala 27:20]
  wire [38:0] _T_260 = sel_red0_q[0] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_261 = _T_257 ? iccm_bank_dout_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_262 = _T_259 | _T_260; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_0 = _T_262 | _T_261; // @[Mux.scala 27:72]
  wire  _T_269 = ~sel_red0_q[1]; // @[el2_ifu_iccm_mem.scala 75:36]
  wire  _T_271 = ~sel_red1_q[1]; // @[el2_ifu_iccm_mem.scala 75:53]
  wire  _T_272 = _T_269 & _T_271; // @[el2_ifu_iccm_mem.scala 75:51]
  wire [38:0] _T_274 = sel_red1_q[1] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_275 = sel_red0_q[1] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_276 = _T_272 ? iccm_bank_dout_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_277 = _T_274 | _T_275; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_1 = _T_277 | _T_276; // @[Mux.scala 27:72]
  wire  _T_284 = ~sel_red0_q[2]; // @[el2_ifu_iccm_mem.scala 75:36]
  wire  _T_286 = ~sel_red1_q[2]; // @[el2_ifu_iccm_mem.scala 75:53]
  wire  _T_287 = _T_284 & _T_286; // @[el2_ifu_iccm_mem.scala 75:51]
  wire [38:0] _T_289 = sel_red1_q[2] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_290 = sel_red0_q[2] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_291 = _T_287 ? iccm_bank_dout_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_292 = _T_289 | _T_290; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_2 = _T_292 | _T_291; // @[Mux.scala 27:72]
  wire  _T_299 = ~sel_red0_q[3]; // @[el2_ifu_iccm_mem.scala 75:36]
  wire  _T_301 = ~sel_red1_q[3]; // @[el2_ifu_iccm_mem.scala 75:53]
  wire  _T_302 = _T_299 & _T_301; // @[el2_ifu_iccm_mem.scala 75:51]
  wire [38:0] _T_304 = sel_red1_q[3] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_305 = sel_red0_q[3] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_306 = _T_302 ? iccm_bank_dout_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_307 = _T_304 | _T_305; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_3 = _T_307 | _T_306; // @[Mux.scala 27:72]
  reg  redundant_lru; // @[Reg.scala 27:20]
  wire  _T_309 = ~redundant_lru; // @[el2_ifu_iccm_mem.scala 77:20]
  wire  r0_addr_en = _T_309 & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 77:35]
  wire  r1_addr_en = redundant_lru & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 78:35]
  wire  _T_310 = |sel_red0; // @[el2_ifu_iccm_mem.scala 79:63]
  wire  _T_311 = |sel_red1; // @[el2_ifu_iccm_mem.scala 79:78]
  wire  _T_312 = _T_310 | _T_311; // @[el2_ifu_iccm_mem.scala 79:67]
  wire  _T_313 = _T_312 & io_iccm_rden; // @[el2_ifu_iccm_mem.scala 79:83]
  wire  _T_314 = _T_313 & io_iccm_correction_state; // @[el2_ifu_iccm_mem.scala 79:98]
  wire  redundant_lru_en = io_iccm_buf_correct_ecc | _T_314; // @[el2_ifu_iccm_mem.scala 79:50]
  wire  _GEN_43 = r1_addr_en | _T_325; // @[Reg.scala 28:19]
  wire  _GEN_44 = r0_addr_en | _T_326; // @[Reg.scala 28:19]
  wire  _T_330 = io_iccm_rw_addr[14:2] == redundant_address_0[13:1]; // @[el2_ifu_iccm_mem.scala 86:61]
  wire  _T_333 = io_iccm_rw_addr[1] & redundant_address_0[0]; // @[el2_ifu_iccm_mem.scala 87:26]
  wire  _T_336 = _T_333 | _T_1; // @[el2_ifu_iccm_mem.scala 87:52]
  wire  _T_337 = _T_330 & _T_336; // @[el2_ifu_iccm_mem.scala 86:102]
  wire  _T_339 = _T_337 & redundant_valid[0]; // @[el2_ifu_iccm_mem.scala 87:84]
  wire  _T_340 = _T_339 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 87:105]
  wire  redundant_data0_en = _T_340 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 87:121]
  wire  _T_349 = redundant_address_0[0] & _T_1; // @[el2_ifu_iccm_mem.scala 89:104]
  wire  _T_350 = _T_333 | _T_349; // @[el2_ifu_iccm_mem.scala 89:78]
  wire  _T_358 = io_iccm_rw_addr[14:2] == redundant_address_1[13:1]; // @[el2_ifu_iccm_mem.scala 93:61]
  wire  _T_361 = io_iccm_rw_addr[1] & redundant_address_1[0]; // @[el2_ifu_iccm_mem.scala 94:26]
  wire  _T_364 = _T_361 | _T_1; // @[el2_ifu_iccm_mem.scala 94:52]
  wire  _T_365 = _T_358 & _T_364; // @[el2_ifu_iccm_mem.scala 93:102]
  wire  _T_367 = _T_365 & redundant_valid[1]; // @[el2_ifu_iccm_mem.scala 94:84]
  wire  _T_368 = _T_367 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 94:105]
  wire  redundant_data1_en = _T_368 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 94:121]
  wire  _T_377 = redundant_address_1[0] & _T_1; // @[el2_ifu_iccm_mem.scala 96:104]
  wire  _T_378 = _T_361 | _T_377; // @[el2_ifu_iccm_mem.scala 96:78]
  reg [2:0] iccm_rd_addr_lo_q; // @[el2_ifu_iccm_mem.scala 100:34]
  reg [1:0] iccm_rd_addr_hi_q; // @[el2_ifu_iccm_mem.scala 101:34]
  wire  _T_386 = iccm_rd_addr_hi_q == 2'h0; // @[el2_ifu_iccm_mem.scala 103:86]
  wire  _T_388 = iccm_rd_addr_hi_q == 2'h1; // @[el2_ifu_iccm_mem.scala 103:86]
  wire  _T_390 = iccm_rd_addr_hi_q == 2'h2; // @[el2_ifu_iccm_mem.scala 103:86]
  wire  _T_392 = iccm_rd_addr_hi_q == 2'h3; // @[el2_ifu_iccm_mem.scala 103:86]
  wire [31:0] _T_394 = _T_386 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_395 = _T_388 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_396 = _T_390 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_397 = _T_392 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_398 = _T_394 | _T_395; // @[Mux.scala 27:72]
  wire [31:0] _T_399 = _T_398 | _T_396; // @[Mux.scala 27:72]
  wire [31:0] _T_400 = _T_399 | _T_397; // @[Mux.scala 27:72]
  wire  _T_403 = iccm_rd_addr_lo_q[1:0] == 2'h0; // @[el2_ifu_iccm_mem.scala 104:77]
  wire  _T_406 = iccm_rd_addr_lo_q[1:0] == 2'h1; // @[el2_ifu_iccm_mem.scala 104:77]
  wire  _T_409 = iccm_rd_addr_lo_q[1:0] == 2'h2; // @[el2_ifu_iccm_mem.scala 104:77]
  wire  _T_412 = iccm_rd_addr_lo_q[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 104:77]
  wire [31:0] _T_414 = _T_403 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_415 = _T_406 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_416 = _T_409 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_417 = _T_412 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_418 = _T_414 | _T_415; // @[Mux.scala 27:72]
  wire [31:0] _T_419 = _T_418 | _T_416; // @[Mux.scala 27:72]
  wire [31:0] _T_420 = _T_419 | _T_417; // @[Mux.scala 27:72]
  wire [63:0] iccm_rd_data_pre = {_T_400,_T_420}; // @[Cat.scala 29:58]
  wire [63:0] _T_426 = {16'h0,iccm_rd_data_pre[63:16]}; // @[Cat.scala 29:58]
  wire [38:0] _T_432 = _T_386 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_433 = _T_388 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_434 = _T_390 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_435 = _T_392 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_436 = _T_432 | _T_433; // @[Mux.scala 27:72]
  wire [38:0] _T_437 = _T_436 | _T_434; // @[Mux.scala 27:72]
  wire [38:0] _T_438 = _T_437 | _T_435; // @[Mux.scala 27:72]
  wire [38:0] _T_448 = _T_403 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_449 = _T_406 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_450 = _T_409 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_451 = _T_412 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_452 = _T_448 | _T_449; // @[Mux.scala 27:72]
  wire [38:0] _T_453 = _T_452 | _T_450; // @[Mux.scala 27:72]
  wire [38:0] _T_454 = _T_453 | _T_451; // @[Mux.scala 27:72]
  assign iccm_mem_0__T_103_addr = 12'h0;
  assign iccm_mem_0__T_103_data = iccm_mem_0[iccm_mem_0__T_103_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_108_addr = 12'h1;
  assign iccm_mem_0__T_108_data = iccm_mem_0[iccm_mem_0__T_108_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_113_addr = 12'h2;
  assign iccm_mem_0__T_113_data = iccm_mem_0[iccm_mem_0__T_113_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_118_addr = 12'h3;
  assign iccm_mem_0__T_118_data = iccm_mem_0[iccm_mem_0__T_118_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign iccm_mem_1__T_103_addr = 12'h0;
  assign iccm_mem_1__T_103_data = iccm_mem_1[iccm_mem_1__T_103_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_108_addr = 12'h1;
  assign iccm_mem_1__T_108_data = iccm_mem_1[iccm_mem_1__T_108_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_113_addr = 12'h2;
  assign iccm_mem_1__T_113_data = iccm_mem_1[iccm_mem_1__T_113_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_118_addr = 12'h3;
  assign iccm_mem_1__T_118_data = iccm_mem_1[iccm_mem_1__T_118_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign iccm_mem_2__T_103_addr = 12'h0;
  assign iccm_mem_2__T_103_data = iccm_mem_2[iccm_mem_2__T_103_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_108_addr = 12'h1;
  assign iccm_mem_2__T_108_data = iccm_mem_2[iccm_mem_2__T_108_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_113_addr = 12'h2;
  assign iccm_mem_2__T_113_data = iccm_mem_2[iccm_mem_2__T_113_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_118_addr = 12'h3;
  assign iccm_mem_2__T_118_data = iccm_mem_2[iccm_mem_2__T_118_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign iccm_mem_3__T_103_addr = 12'h0;
  assign iccm_mem_3__T_103_data = iccm_mem_3[iccm_mem_3__T_103_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_108_addr = 12'h1;
  assign iccm_mem_3__T_108_data = iccm_mem_3[iccm_mem_3__T_108_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_113_addr = 12'h2;
  assign iccm_mem_3__T_113_data = iccm_mem_3[iccm_mem_3__T_113_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_118_addr = 12'h3;
  assign iccm_mem_3__T_118_data = iccm_mem_3[iccm_mem_3__T_118_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign io_iccm_rd_data = iccm_rd_addr_lo_q[0] ? _T_426 : iccm_rd_data_pre; // @[el2_ifu_iccm_mem.scala 22:19 el2_ifu_iccm_mem.scala 105:19]
  assign io_iccm_rd_data_ecc = {_T_438,_T_454}; // @[el2_ifu_iccm_mem.scala 23:23 el2_ifu_iccm_mem.scala 106:23]
  assign io_iccm_bank_addr_0 = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59; // @[el2_ifu_iccm_mem.scala 54:21]
  assign io_iccm_bank_addr_1 = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66; // @[el2_ifu_iccm_mem.scala 54:21]
  assign io_iccm_bank_addr_2 = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73; // @[el2_ifu_iccm_mem.scala 54:21]
  assign io_iccm_bank_addr_3 = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80; // @[el2_ifu_iccm_mem.scala 54:21]
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
  _T_325 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_326 = _RAND_9[0:0];
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
    iccm_bank_dout_0 <= _T_102 & _GEN_27;
    iccm_bank_dout_1 <= _T_107 & _GEN_31;
    iccm_bank_dout_2 <= _T_112 & _GEN_35;
    iccm_bank_dout_3 <= _T_117 & _GEN_39;
    if (reset) begin
      _T_325 <= 1'h0;
    end else begin
      _T_325 <= _GEN_43;
    end
    if (reset) begin
      _T_326 <= 1'h0;
    end else begin
      _T_326 <= _GEN_44;
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
      if (_T_378) begin
        redundant_data_1 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_1 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_data_0 <= 39'h0;
    end else if (redundant_data0_en) begin
      if (_T_350) begin
        redundant_data_0 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_0 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_lru <= 1'h0;
    end else if (redundant_lru_en) begin
      if (io_iccm_buf_correct_ecc) begin
        redundant_lru <= _T_309;
      end else begin
        redundant_lru <= _T_310;
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
