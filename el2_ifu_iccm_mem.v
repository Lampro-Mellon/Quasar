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
  wire [38:0] iccm_mem_0__T_99_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_99_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_109_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_109_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_0__T_114_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_0__T_114_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] iccm_mem_1__T_99_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_99_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_109_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_109_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_1__T_114_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_1__T_114_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] iccm_mem_2__T_99_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_99_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_109_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_109_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_2__T_114_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_2__T_114_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] iccm_mem_3__T_99_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_99_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_104_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_104_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_109_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_109_addr; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [38:0] iccm_mem_3__T_114_data; // @[el2_ifu_iccm_mem.scala 41:21]
  wire [11:0] iccm_mem_3__T_114_addr; // @[el2_ifu_iccm_mem.scala 41:21]
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
  wire [38:0] _T_98 = read_enable_0 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_8 = iccm_mem_0__T_99_data; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_9 = 2'h1 == addr_bank_0[1:0] ? iccm_mem_1__T_99_data : _GEN_8; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_10 = 2'h2 == addr_bank_0[1:0] ? iccm_mem_2__T_99_data : _GEN_9; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_11 = 2'h3 == addr_bank_0[1:0] ? iccm_mem_3__T_99_data : _GEN_10; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _T_103 = read_enable_1 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_12 = iccm_mem_0__T_104_data; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_13 = 2'h1 == addr_bank_1[1:0] ? iccm_mem_1__T_104_data : _GEN_12; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_14 = 2'h2 == addr_bank_1[1:0] ? iccm_mem_2__T_104_data : _GEN_13; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_15 = 2'h3 == addr_bank_1[1:0] ? iccm_mem_3__T_104_data : _GEN_14; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _T_108 = read_enable_2 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_16 = iccm_mem_0__T_109_data; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_17 = 2'h1 == addr_bank_2[1:0] ? iccm_mem_1__T_109_data : _GEN_16; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_18 = 2'h2 == addr_bank_2[1:0] ? iccm_mem_2__T_109_data : _GEN_17; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_19 = 2'h3 == addr_bank_2[1:0] ? iccm_mem_3__T_109_data : _GEN_18; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _T_113 = read_enable_3 ? 39'h7fffffffff : 39'h0; // @[Bitwise.scala 72:12]
  wire [38:0] _GEN_20 = iccm_mem_0__T_114_data; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_21 = 2'h1 == addr_bank_3[1:0] ? iccm_mem_1__T_114_data : _GEN_20; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_22 = 2'h2 == addr_bank_3[1:0] ? iccm_mem_2__T_114_data : _GEN_21; // @[el2_ifu_iccm_mem.scala 49:67]
  wire [38:0] _GEN_23 = 2'h3 == addr_bank_3[1:0] ? iccm_mem_3__T_114_data : _GEN_22; // @[el2_ifu_iccm_mem.scala 49:67]
  reg [38:0] iccm_bank_dout_0; // @[el2_ifu_iccm_mem.scala 50:62]
  reg [38:0] iccm_bank_dout_1; // @[el2_ifu_iccm_mem.scala 50:62]
  reg [38:0] iccm_bank_dout_2; // @[el2_ifu_iccm_mem.scala 50:62]
  reg [38:0] iccm_bank_dout_3; // @[el2_ifu_iccm_mem.scala 50:62]
  reg  _T_321; // @[Reg.scala 27:20]
  reg  _T_322; // @[Reg.scala 27:20]
  wire [1:0] redundant_valid = {_T_321,_T_322}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_1; // @[Reg.scala 27:20]
  wire  _T_124 = io_iccm_rw_addr[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 61:105]
  wire  _T_127 = _T_124 & _T_10; // @[el2_ifu_iccm_mem.scala 61:145]
  wire  _T_128 = redundant_valid[1] & _T_127; // @[el2_ifu_iccm_mem.scala 61:71]
  wire  _T_131 = addr_bank_inc[14:1] == redundant_address_1; // @[el2_ifu_iccm_mem.scala 62:37]
  wire  _T_134 = _T_131 & _T_12; // @[el2_ifu_iccm_mem.scala 62:77]
  wire  _T_135 = _T_128 | _T_134; // @[el2_ifu_iccm_mem.scala 61:179]
  wire  _T_142 = _T_124 & _T_15; // @[el2_ifu_iccm_mem.scala 61:145]
  wire  _T_143 = redundant_valid[1] & _T_142; // @[el2_ifu_iccm_mem.scala 61:71]
  wire  _T_149 = _T_131 & _T_17; // @[el2_ifu_iccm_mem.scala 62:77]
  wire  _T_150 = _T_143 | _T_149; // @[el2_ifu_iccm_mem.scala 61:179]
  wire  _T_157 = _T_124 & _T_20; // @[el2_ifu_iccm_mem.scala 61:145]
  wire  _T_158 = redundant_valid[1] & _T_157; // @[el2_ifu_iccm_mem.scala 61:71]
  wire  _T_164 = _T_131 & _T_22; // @[el2_ifu_iccm_mem.scala 62:77]
  wire  _T_165 = _T_158 | _T_164; // @[el2_ifu_iccm_mem.scala 61:179]
  wire  _T_172 = _T_124 & _T_25; // @[el2_ifu_iccm_mem.scala 61:145]
  wire  _T_173 = redundant_valid[1] & _T_172; // @[el2_ifu_iccm_mem.scala 61:71]
  wire  _T_179 = _T_131 & _T_27; // @[el2_ifu_iccm_mem.scala 62:77]
  wire  _T_180 = _T_173 | _T_179; // @[el2_ifu_iccm_mem.scala 61:179]
  wire [3:0] sel_red1 = {_T_180,_T_165,_T_150,_T_135}; // @[Cat.scala 29:58]
  reg [13:0] redundant_address_0; // @[Reg.scala 27:20]
  wire  _T_186 = io_iccm_rw_addr[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 63:105]
  wire  _T_189 = _T_186 & _T_10; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_190 = redundant_valid[0] & _T_189; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_193 = addr_bank_inc[14:1] == redundant_address_0; // @[el2_ifu_iccm_mem.scala 64:37]
  wire  _T_196 = _T_193 & _T_12; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_197 = _T_190 | _T_196; // @[el2_ifu_iccm_mem.scala 63:179]
  wire  _T_204 = _T_186 & _T_15; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_205 = redundant_valid[0] & _T_204; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_211 = _T_193 & _T_17; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_212 = _T_205 | _T_211; // @[el2_ifu_iccm_mem.scala 63:179]
  wire  _T_219 = _T_186 & _T_20; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_220 = redundant_valid[0] & _T_219; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_226 = _T_193 & _T_22; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_227 = _T_220 | _T_226; // @[el2_ifu_iccm_mem.scala 63:179]
  wire  _T_234 = _T_186 & _T_25; // @[el2_ifu_iccm_mem.scala 63:145]
  wire  _T_235 = redundant_valid[0] & _T_234; // @[el2_ifu_iccm_mem.scala 63:71]
  wire  _T_241 = _T_193 & _T_27; // @[el2_ifu_iccm_mem.scala 64:77]
  wire  _T_242 = _T_235 | _T_241; // @[el2_ifu_iccm_mem.scala 63:179]
  wire [3:0] sel_red0 = {_T_242,_T_227,_T_212,_T_197}; // @[Cat.scala 29:58]
  reg [3:0] sel_red0_q; // @[el2_ifu_iccm_mem.scala 66:27]
  reg [3:0] sel_red1_q; // @[el2_ifu_iccm_mem.scala 67:27]
  wire  _T_250 = ~sel_red0_q[0]; // @[el2_ifu_iccm_mem.scala 73:36]
  wire  _T_252 = ~sel_red1_q[0]; // @[el2_ifu_iccm_mem.scala 73:53]
  wire  _T_253 = _T_250 & _T_252; // @[el2_ifu_iccm_mem.scala 73:51]
  reg [38:0] redundant_data_1; // @[Reg.scala 27:20]
  wire [38:0] _T_255 = sel_red1_q[0] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  reg [38:0] redundant_data_0; // @[Reg.scala 27:20]
  wire [38:0] _T_256 = sel_red0_q[0] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_257 = _T_253 ? iccm_bank_dout_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_258 = _T_255 | _T_256; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_0 = _T_258 | _T_257; // @[Mux.scala 27:72]
  wire  _T_265 = ~sel_red0_q[1]; // @[el2_ifu_iccm_mem.scala 73:36]
  wire  _T_267 = ~sel_red1_q[1]; // @[el2_ifu_iccm_mem.scala 73:53]
  wire  _T_268 = _T_265 & _T_267; // @[el2_ifu_iccm_mem.scala 73:51]
  wire [38:0] _T_270 = sel_red1_q[1] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_271 = sel_red0_q[1] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_272 = _T_268 ? iccm_bank_dout_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_273 = _T_270 | _T_271; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_1 = _T_273 | _T_272; // @[Mux.scala 27:72]
  wire  _T_280 = ~sel_red0_q[2]; // @[el2_ifu_iccm_mem.scala 73:36]
  wire  _T_282 = ~sel_red1_q[2]; // @[el2_ifu_iccm_mem.scala 73:53]
  wire  _T_283 = _T_280 & _T_282; // @[el2_ifu_iccm_mem.scala 73:51]
  wire [38:0] _T_285 = sel_red1_q[2] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_286 = sel_red0_q[2] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_287 = _T_283 ? iccm_bank_dout_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_288 = _T_285 | _T_286; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_2 = _T_288 | _T_287; // @[Mux.scala 27:72]
  wire  _T_295 = ~sel_red0_q[3]; // @[el2_ifu_iccm_mem.scala 73:36]
  wire  _T_297 = ~sel_red1_q[3]; // @[el2_ifu_iccm_mem.scala 73:53]
  wire  _T_298 = _T_295 & _T_297; // @[el2_ifu_iccm_mem.scala 73:51]
  wire [38:0] _T_300 = sel_red1_q[3] ? redundant_data_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_301 = sel_red0_q[3] ? redundant_data_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_302 = _T_298 ? iccm_bank_dout_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_303 = _T_300 | _T_301; // @[Mux.scala 27:72]
  wire [38:0] iccm_bank_dout_fn_3 = _T_303 | _T_302; // @[Mux.scala 27:72]
  reg  redundant_lru; // @[Reg.scala 27:20]
  wire  _T_305 = ~redundant_lru; // @[el2_ifu_iccm_mem.scala 75:20]
  wire  r0_addr_en = _T_305 & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 75:35]
  wire  r1_addr_en = redundant_lru & io_iccm_buf_correct_ecc; // @[el2_ifu_iccm_mem.scala 76:35]
  wire  _T_306 = |sel_red0; // @[el2_ifu_iccm_mem.scala 77:63]
  wire  _T_307 = |sel_red1; // @[el2_ifu_iccm_mem.scala 77:78]
  wire  _T_308 = _T_306 | _T_307; // @[el2_ifu_iccm_mem.scala 77:67]
  wire  _T_309 = _T_308 & io_iccm_rden; // @[el2_ifu_iccm_mem.scala 77:83]
  wire  _T_310 = _T_309 & io_iccm_correction_state; // @[el2_ifu_iccm_mem.scala 77:98]
  wire  redundant_lru_en = io_iccm_buf_correct_ecc | _T_310; // @[el2_ifu_iccm_mem.scala 77:50]
  wire  _GEN_27 = r1_addr_en | _T_321; // @[Reg.scala 28:19]
  wire  _GEN_28 = r0_addr_en | _T_322; // @[Reg.scala 28:19]
  wire  _T_326 = io_iccm_rw_addr[14:2] == redundant_address_0[13:1]; // @[el2_ifu_iccm_mem.scala 84:61]
  wire  _T_329 = io_iccm_rw_addr[1] & redundant_address_0[0]; // @[el2_ifu_iccm_mem.scala 85:26]
  wire  _T_332 = _T_329 | _T_1; // @[el2_ifu_iccm_mem.scala 85:52]
  wire  _T_333 = _T_326 & _T_332; // @[el2_ifu_iccm_mem.scala 84:102]
  wire  _T_335 = _T_333 & redundant_valid[0]; // @[el2_ifu_iccm_mem.scala 85:84]
  wire  _T_336 = _T_335 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 85:105]
  wire  redundant_data0_en = _T_336 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 85:121]
  wire  _T_345 = redundant_address_0[0] & _T_1; // @[el2_ifu_iccm_mem.scala 87:104]
  wire  _T_346 = _T_329 | _T_345; // @[el2_ifu_iccm_mem.scala 87:78]
  wire  _T_354 = io_iccm_rw_addr[14:2] == redundant_address_1[13:1]; // @[el2_ifu_iccm_mem.scala 91:61]
  wire  _T_357 = io_iccm_rw_addr[1] & redundant_address_1[0]; // @[el2_ifu_iccm_mem.scala 92:26]
  wire  _T_360 = _T_357 | _T_1; // @[el2_ifu_iccm_mem.scala 92:52]
  wire  _T_361 = _T_354 & _T_360; // @[el2_ifu_iccm_mem.scala 91:102]
  wire  _T_363 = _T_361 & redundant_valid[1]; // @[el2_ifu_iccm_mem.scala 92:84]
  wire  _T_364 = _T_363 & io_iccm_wren; // @[el2_ifu_iccm_mem.scala 92:105]
  wire  redundant_data1_en = _T_364 | r0_addr_en; // @[el2_ifu_iccm_mem.scala 92:121]
  wire  _T_373 = redundant_address_1[0] & _T_1; // @[el2_ifu_iccm_mem.scala 94:104]
  wire  _T_374 = _T_357 | _T_373; // @[el2_ifu_iccm_mem.scala 94:78]
  reg [2:0] iccm_rd_addr_lo_q; // @[el2_ifu_iccm_mem.scala 98:34]
  reg [1:0] iccm_rd_addr_hi_q; // @[el2_ifu_iccm_mem.scala 99:34]
  wire  _T_382 = iccm_rd_addr_hi_q == 2'h0; // @[el2_ifu_iccm_mem.scala 101:86]
  wire  _T_384 = iccm_rd_addr_hi_q == 2'h1; // @[el2_ifu_iccm_mem.scala 101:86]
  wire  _T_386 = iccm_rd_addr_hi_q == 2'h2; // @[el2_ifu_iccm_mem.scala 101:86]
  wire  _T_388 = iccm_rd_addr_hi_q == 2'h3; // @[el2_ifu_iccm_mem.scala 101:86]
  wire [31:0] _T_390 = _T_382 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_391 = _T_384 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_392 = _T_386 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_393 = _T_388 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_394 = _T_390 | _T_391; // @[Mux.scala 27:72]
  wire [31:0] _T_395 = _T_394 | _T_392; // @[Mux.scala 27:72]
  wire [31:0] _T_396 = _T_395 | _T_393; // @[Mux.scala 27:72]
  wire  _T_399 = iccm_rd_addr_lo_q[1:0] == 2'h0; // @[el2_ifu_iccm_mem.scala 102:77]
  wire  _T_402 = iccm_rd_addr_lo_q[1:0] == 2'h1; // @[el2_ifu_iccm_mem.scala 102:77]
  wire  _T_405 = iccm_rd_addr_lo_q[1:0] == 2'h2; // @[el2_ifu_iccm_mem.scala 102:77]
  wire  _T_408 = iccm_rd_addr_lo_q[1:0] == 2'h3; // @[el2_ifu_iccm_mem.scala 102:77]
  wire [31:0] _T_410 = _T_399 ? iccm_bank_dout_fn_0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_411 = _T_402 ? iccm_bank_dout_fn_1[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_412 = _T_405 ? iccm_bank_dout_fn_2[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_413 = _T_408 ? iccm_bank_dout_fn_3[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_414 = _T_410 | _T_411; // @[Mux.scala 27:72]
  wire [31:0] _T_415 = _T_414 | _T_412; // @[Mux.scala 27:72]
  wire [31:0] _T_416 = _T_415 | _T_413; // @[Mux.scala 27:72]
  wire [63:0] iccm_rd_data_pre = {_T_396,_T_416}; // @[Cat.scala 29:58]
  wire [63:0] _T_422 = {16'h0,iccm_rd_data_pre[63:16]}; // @[Cat.scala 29:58]
  wire [38:0] _T_428 = _T_382 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_429 = _T_384 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_430 = _T_386 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_431 = _T_388 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_432 = _T_428 | _T_429; // @[Mux.scala 27:72]
  wire [38:0] _T_433 = _T_432 | _T_430; // @[Mux.scala 27:72]
  wire [38:0] _T_434 = _T_433 | _T_431; // @[Mux.scala 27:72]
  wire [38:0] _T_444 = _T_399 ? iccm_bank_dout_fn_0 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_445 = _T_402 ? iccm_bank_dout_fn_1 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_446 = _T_405 ? iccm_bank_dout_fn_2 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_447 = _T_408 ? iccm_bank_dout_fn_3 : 39'h0; // @[Mux.scala 27:72]
  wire [38:0] _T_448 = _T_444 | _T_445; // @[Mux.scala 27:72]
  wire [38:0] _T_449 = _T_448 | _T_446; // @[Mux.scala 27:72]
  wire [38:0] _T_450 = _T_449 | _T_447; // @[Mux.scala 27:72]
  assign iccm_mem_0__T_99_addr = 12'h0;
  assign iccm_mem_0__T_99_data = iccm_mem_0[iccm_mem_0__T_99_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_104_addr = 12'h1;
  assign iccm_mem_0__T_104_data = iccm_mem_0[iccm_mem_0__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_109_addr = 12'h2;
  assign iccm_mem_0__T_109_data = iccm_mem_0[iccm_mem_0__T_109_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_0__T_114_addr = 12'h3;
  assign iccm_mem_0__T_114_data = iccm_mem_0[iccm_mem_0__T_114_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign iccm_mem_1__T_99_addr = 12'h0;
  assign iccm_mem_1__T_99_data = iccm_mem_1[iccm_mem_1__T_99_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_104_addr = 12'h1;
  assign iccm_mem_1__T_104_data = iccm_mem_1[iccm_mem_1__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_109_addr = 12'h2;
  assign iccm_mem_1__T_109_data = iccm_mem_1[iccm_mem_1__T_109_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_1__T_114_addr = 12'h3;
  assign iccm_mem_1__T_114_data = iccm_mem_1[iccm_mem_1__T_114_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign iccm_mem_2__T_99_addr = 12'h0;
  assign iccm_mem_2__T_99_data = iccm_mem_2[iccm_mem_2__T_99_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_104_addr = 12'h1;
  assign iccm_mem_2__T_104_data = iccm_mem_2[iccm_mem_2__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_109_addr = 12'h2;
  assign iccm_mem_2__T_109_data = iccm_mem_2[iccm_mem_2__T_109_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_2__T_114_addr = 12'h3;
  assign iccm_mem_2__T_114_data = iccm_mem_2[iccm_mem_2__T_114_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign iccm_mem_3__T_99_addr = 12'h0;
  assign iccm_mem_3__T_99_data = iccm_mem_3[iccm_mem_3__T_99_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_104_addr = 12'h1;
  assign iccm_mem_3__T_104_data = iccm_mem_3[iccm_mem_3__T_104_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_109_addr = 12'h2;
  assign iccm_mem_3__T_109_data = iccm_mem_3[iccm_mem_3__T_109_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
  assign iccm_mem_3__T_114_addr = 12'h3;
  assign iccm_mem_3__T_114_data = iccm_mem_3[iccm_mem_3__T_114_addr]; // @[el2_ifu_iccm_mem.scala 41:21]
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
  assign io_iccm_rd_data = iccm_rd_addr_lo_q[0] ? _T_422 : iccm_rd_data_pre; // @[el2_ifu_iccm_mem.scala 22:19 el2_ifu_iccm_mem.scala 103:19]
  assign io_iccm_rd_data_ecc = {_T_434,_T_450}; // @[el2_ifu_iccm_mem.scala 23:23 el2_ifu_iccm_mem.scala 104:23]
  assign io_iccm_bank_addr_0 = wren_bank_0 ? io_iccm_rw_addr[14:3] : _T_59; // @[el2_ifu_iccm_mem.scala 52:21]
  assign io_iccm_bank_addr_1 = wren_bank_1 ? io_iccm_rw_addr[14:3] : _T_66; // @[el2_ifu_iccm_mem.scala 52:21]
  assign io_iccm_bank_addr_2 = wren_bank_2 ? io_iccm_rw_addr[14:3] : _T_73; // @[el2_ifu_iccm_mem.scala 52:21]
  assign io_iccm_bank_addr_3 = wren_bank_3 ? io_iccm_rw_addr[14:3] : _T_80; // @[el2_ifu_iccm_mem.scala 52:21]
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
  _T_321 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_322 = _RAND_9[0:0];
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
    iccm_bank_dout_0 <= _T_98 & _GEN_11;
    iccm_bank_dout_1 <= _T_103 & _GEN_15;
    iccm_bank_dout_2 <= _T_108 & _GEN_19;
    iccm_bank_dout_3 <= _T_113 & _GEN_23;
    if (reset) begin
      _T_321 <= 1'h0;
    end else begin
      _T_321 <= _GEN_27;
    end
    if (reset) begin
      _T_322 <= 1'h0;
    end else begin
      _T_322 <= _GEN_28;
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
      if (_T_374) begin
        redundant_data_1 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_1 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_data_0 <= 39'h0;
    end else if (redundant_data0_en) begin
      if (_T_346) begin
        redundant_data_0 <= iccm_bank_wr_data_1;
      end else begin
        redundant_data_0 <= iccm_bank_wr_data_0;
      end
    end
    if (reset) begin
      redundant_lru <= 1'h0;
    end else if (redundant_lru_en) begin
      if (io_iccm_buf_correct_ecc) begin
        redundant_lru <= _T_305;
      end else begin
        redundant_lru <= _T_306;
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
