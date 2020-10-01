module EL2_IC_DATA(
  input         clock,
  input         reset,
  input         io_clk_override,
  input  [11:0] io_ic_rw_addr,
  input  [1:0]  io_ic_wr_en,
  input         io_ic_rd_en,
  input  [70:0] io_ic_wr_data_0,
  input  [70:0] io_ic_wr_data_1,
  output [63:0] io_ic_rd_data,
  input  [70:0] io_ic_debug_wr_data,
  output [70:0] io_ic_debug_rd_data,
  output [1:0]  io_ic_parerr,
  output [1:0]  io_ic_eccerr,
  input  [8:0]  io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  input  [63:0] io_ic_premux_data,
  input         io_ic_sel_premux_data,
  input  [1:0]  io_ic_rd_hit,
  input         io_scan_mode,
  input  [70:0] io_test_in,
  output [70:0] io_test
);
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
  reg [95:0] _RAND_1;
  reg [95:0] _RAND_2;
  reg [95:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
  reg [70:0] data_mem_0_0 [0:511]; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_147_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_147_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_160_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_160_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_173_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_173_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_186_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_186_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_141_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_141_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_141_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_154_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_154_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_154_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_167_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_167_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_167_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_0__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_0__T_180_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_180_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_0__T_180_en; // @[el2_ifu_ic_mem.scala 243:21]
  reg [70:0] data_mem_0_1 [0:511]; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_147_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_147_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_160_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_160_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_173_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_173_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_186_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_186_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_141_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_141_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_141_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_154_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_154_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_154_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_167_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_167_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_167_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_0_1__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_0_1__T_180_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_180_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_0_1__T_180_en; // @[el2_ifu_ic_mem.scala 243:21]
  reg [70:0] data_mem_1_0 [0:511]; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_147_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_147_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_160_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_160_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_173_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_173_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_186_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_186_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_141_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_141_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_141_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_154_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_154_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_154_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_167_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_167_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_167_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_0__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_0__T_180_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_180_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_0__T_180_en; // @[el2_ifu_ic_mem.scala 243:21]
  reg [70:0] data_mem_1_1 [0:511]; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_147_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_147_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_160_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_160_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_173_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_173_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_186_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_186_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_141_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_141_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_141_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_154_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_154_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_154_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_167_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_167_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_167_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire [70:0] data_mem_1_1__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
  wire [8:0] data_mem_1_1__T_180_addr; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_180_mask; // @[el2_ifu_ic_mem.scala 243:21]
  wire  data_mem_1_1__T_180_en; // @[el2_ifu_ic_mem.scala 243:21]
  wire  _T = ~io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 200:70]
  wire  _T_5 = io_ic_debug_wr_en & _T; // @[el2_ifu_ic_mem.scala 201:68]
  wire [1:0] _T_7 = {_T_5,_T_5}; // @[Cat.scala 29:58]
  wire [1:0] ic_debug_wr_way_en = _T_7 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 201:94]
  wire  _T_8 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 206:45]
  wire [10:0] _T_10 = {io_ic_debug_addr,2'h0}; // @[Cat.scala 29:58]
  wire [11:0] ic_rw_addr_q = _T_8 ? {{1'd0}, _T_10} : io_ic_rw_addr; // @[el2_ifu_ic_mem.scala 206:25]
  wire [8:0] ic_rw_addr_q_inc = ic_rw_addr_q[11:3] + 9'h1; // @[el2_ifu_ic_mem.scala 208:79]
  wire  _T_14 = ~io_ic_debug_addr[0]; // @[el2_ifu_ic_mem.scala 210:113]
  wire [1:0] _T_16 = _T_14 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_17 = ic_debug_wr_way_en & _T_16; // @[el2_ifu_ic_mem.scala 210:38]
  wire [1:0] ic_b_sb_wren_0 = io_ic_wr_en | _T_17; // @[el2_ifu_ic_mem.scala 210:17]
  wire [1:0] _T_21 = io_ic_debug_addr[0] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_22 = ic_debug_wr_way_en & _T_21; // @[el2_ifu_ic_mem.scala 210:38]
  wire [1:0] ic_b_sb_wren_1 = io_ic_wr_en | _T_22; // @[el2_ifu_ic_mem.scala 210:17]
  wire  _T_37 = ~ic_rw_addr_q[2]; // @[el2_ifu_ic_mem.scala 214:16]
  wire  _T_42 = ic_rw_addr_q[1:0] == 2'h3; // @[el2_ifu_ic_mem.scala 215:91]
  wire  _T_56 = ic_rw_addr_q[2] & _T_42; // @[Mux.scala 27:72]
  wire  _T_59 = _T_37 | _T_56; // @[Mux.scala 27:72]
  wire  _T_113 = |io_ic_wr_en; // @[el2_ifu_ic_mem.scala 222:74]
  wire  _T_114 = ~_T_113; // @[el2_ifu_ic_mem.scala 222:61]
  wire  _T_115 = io_ic_debug_rd_en & _T_114; // @[el2_ifu_ic_mem.scala 222:58]
  wire  ic_rd_en_with_debug = io_ic_rd_en | _T_115; // @[el2_ifu_ic_mem.scala 222:38]
  wire  _T_63 = _T_59 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 217:117]
  wire  _T_87 = _T_37 & _T_42; // @[Mux.scala 27:72]
  wire  _T_90 = ic_rw_addr_q[2] | _T_87; // @[Mux.scala 27:72]
  wire  _T_92 = _T_90 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 217:117]
  wire [1:0] ic_b_rden = {_T_92,_T_63}; // @[Cat.scala 29:58]
  wire [1:0] ic_b_sb_rden_0 = ic_b_rden[0] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_b_sb_rden_1 = ic_b_rden[1] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_98 = ic_b_sb_rden_0[0] | io_clk_override; // @[el2_ifu_ic_mem.scala 220:25]
  wire  _T_100 = _T_98 | ic_b_sb_wren_0[0]; // @[el2_ifu_ic_mem.scala 220:43]
  wire  _T_102 = ic_b_sb_rden_0[1] | io_clk_override; // @[el2_ifu_ic_mem.scala 220:25]
  wire  _T_104 = _T_102 | ic_b_sb_wren_0[1]; // @[el2_ifu_ic_mem.scala 220:43]
  wire [1:0] ic_bank_way_clken_0 = {_T_100,_T_104}; // @[Cat.scala 29:58]
  wire  _T_106 = ic_b_sb_rden_1[0] | io_clk_override; // @[el2_ifu_ic_mem.scala 220:25]
  wire  _T_108 = _T_106 | ic_b_sb_wren_1[0]; // @[el2_ifu_ic_mem.scala 220:43]
  wire  _T_110 = ic_b_sb_rden_1[1] | io_clk_override; // @[el2_ifu_ic_mem.scala 220:25]
  wire  _T_112 = _T_110 | ic_b_sb_wren_1[1]; // @[el2_ifu_ic_mem.scala 220:43]
  wire [1:0] ic_bank_way_clken_1 = {_T_108,_T_112}; // @[Cat.scala 29:58]
  wire  _T_121 = _T_56 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 224:86]
  wire  ic_rw_addr_wrap = _T_121 & _T_114; // @[el2_ifu_ic_mem.scala 224:108]
  wire  _T_124 = ~ic_rw_addr_wrap; // @[el2_ifu_ic_mem.scala 226:40]
  wire [8:0] _T_129 = {ic_rw_addr_q[11:5],ic_rw_addr_q_inc[4:3]}; // @[Cat.scala 29:58]
  wire  _T_139 = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0]; // @[el2_ifu_ic_mem.scala 247:30]
  wire  _T_143 = ~ic_b_sb_wren_0[0]; // @[el2_ifu_ic_mem.scala 249:17]
  wire  _T_145 = _T_143 & ic_bank_way_clken_0[0]; // @[el2_ifu_ic_mem.scala 249:36]
  wire [70:0] _GEN_3 = _T_145 ? data_mem_0_0__T_147_data : 71'h0; // @[el2_ifu_ic_mem.scala 249:69]
  wire [70:0] _GEN_13 = _T_139 ? 71'h0 : _GEN_3; // @[el2_ifu_ic_mem.scala 247:64]
  wire  _T_152 = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0]; // @[el2_ifu_ic_mem.scala 247:30]
  wire  _T_156 = ~ic_b_sb_wren_1[0]; // @[el2_ifu_ic_mem.scala 249:17]
  wire  _T_158 = _T_156 & ic_bank_way_clken_1[0]; // @[el2_ifu_ic_mem.scala 249:36]
  wire [70:0] _GEN_17 = _T_158 ? data_mem_1_0__T_160_data : _GEN_13; // @[el2_ifu_ic_mem.scala 249:69]
  wire [70:0] _GEN_27 = _T_152 ? _GEN_13 : _GEN_17; // @[el2_ifu_ic_mem.scala 247:64]
  wire  _T_165 = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1]; // @[el2_ifu_ic_mem.scala 247:30]
  wire  _T_169 = ~ic_b_sb_wren_0[1]; // @[el2_ifu_ic_mem.scala 249:17]
  wire  _T_171 = _T_169 & ic_bank_way_clken_0[1]; // @[el2_ifu_ic_mem.scala 249:36]
  wire [70:0] _GEN_31 = _T_171 ? data_mem_0_1__T_173_data : _GEN_27; // @[el2_ifu_ic_mem.scala 249:69]
  wire [70:0] _GEN_41 = _T_165 ? _GEN_27 : _GEN_31; // @[el2_ifu_ic_mem.scala 247:64]
  wire  _T_178 = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1]; // @[el2_ifu_ic_mem.scala 247:30]
  wire  _T_182 = ~ic_b_sb_wren_1[1]; // @[el2_ifu_ic_mem.scala 249:17]
  wire  _T_184 = _T_182 & ic_bank_way_clken_1[1]; // @[el2_ifu_ic_mem.scala 249:36]
  wire [70:0] _GEN_45 = _T_184 ? data_mem_1_1__T_186_data : _GEN_41; // @[el2_ifu_ic_mem.scala 249:69]
  assign data_mem_0_0__T_147_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_0__T_147_data = data_mem_0_0[data_mem_0_0__T_147_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_0__T_160_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_160_data = data_mem_0_0[data_mem_0_0__T_160_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_0__T_173_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_0__T_173_data = data_mem_0_0[data_mem_0_0__T_173_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_0__T_186_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_186_data = data_mem_0_0[data_mem_0_0__T_186_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_0__T_141_data = io_test_in;
  assign data_mem_0_0__T_141_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_0__T_141_mask = 1'h1;
  assign data_mem_0_0__T_141_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_0_0__T_154_data = 71'h0;
  assign data_mem_0_0__T_154_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_154_mask = 1'h0;
  assign data_mem_0_0__T_154_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_0_0__T_167_data = 71'h0;
  assign data_mem_0_0__T_167_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_0__T_167_mask = 1'h0;
  assign data_mem_0_0__T_167_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_0_0__T_180_data = 71'h0;
  assign data_mem_0_0__T_180_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_180_mask = 1'h0;
  assign data_mem_0_0__T_180_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign data_mem_0_1__T_147_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_1__T_147_data = data_mem_0_1[data_mem_0_1__T_147_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_1__T_160_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_160_data = data_mem_0_1[data_mem_0_1__T_160_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_1__T_173_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_1__T_173_data = data_mem_0_1[data_mem_0_1__T_173_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_1__T_186_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_186_data = data_mem_0_1[data_mem_0_1__T_186_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_0_1__T_141_data = 71'h0;
  assign data_mem_0_1__T_141_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_1__T_141_mask = 1'h0;
  assign data_mem_0_1__T_141_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_0_1__T_154_data = 71'h0;
  assign data_mem_0_1__T_154_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_154_mask = 1'h0;
  assign data_mem_0_1__T_154_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_0_1__T_167_data = io_test_in;
  assign data_mem_0_1__T_167_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_0_1__T_167_mask = 1'h1;
  assign data_mem_0_1__T_167_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_0_1__T_180_data = 71'h0;
  assign data_mem_0_1__T_180_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_180_mask = 1'h0;
  assign data_mem_0_1__T_180_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign data_mem_1_0__T_147_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_0__T_147_data = data_mem_1_0[data_mem_1_0__T_147_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_0__T_160_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_160_data = data_mem_1_0[data_mem_1_0__T_160_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_0__T_173_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_0__T_173_data = data_mem_1_0[data_mem_1_0__T_173_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_0__T_186_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_186_data = data_mem_1_0[data_mem_1_0__T_186_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_0__T_141_data = 71'h0;
  assign data_mem_1_0__T_141_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_0__T_141_mask = 1'h0;
  assign data_mem_1_0__T_141_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_1_0__T_154_data = io_test_in;
  assign data_mem_1_0__T_154_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_154_mask = 1'h1;
  assign data_mem_1_0__T_154_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_1_0__T_167_data = 71'h0;
  assign data_mem_1_0__T_167_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_0__T_167_mask = 1'h0;
  assign data_mem_1_0__T_167_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_1_0__T_180_data = 71'h0;
  assign data_mem_1_0__T_180_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_180_mask = 1'h0;
  assign data_mem_1_0__T_180_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign data_mem_1_1__T_147_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_1__T_147_data = data_mem_1_1[data_mem_1_1__T_147_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_1__T_160_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_160_data = data_mem_1_1[data_mem_1_1__T_160_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_1__T_173_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_1__T_173_data = data_mem_1_1[data_mem_1_1__T_173_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_1__T_186_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_186_data = data_mem_1_1[data_mem_1_1__T_186_addr]; // @[el2_ifu_ic_mem.scala 243:21]
  assign data_mem_1_1__T_141_data = 71'h0;
  assign data_mem_1_1__T_141_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_1__T_141_mask = 1'h0;
  assign data_mem_1_1__T_141_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_1_1__T_154_data = 71'h0;
  assign data_mem_1_1__T_154_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_154_mask = 1'h0;
  assign data_mem_1_1__T_154_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_1_1__T_167_data = 71'h0;
  assign data_mem_1_1__T_167_addr = _T_124 ? ic_rw_addr_q[11:3] : _T_129;
  assign data_mem_1_1__T_167_mask = 1'h0;
  assign data_mem_1_1__T_167_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_1_1__T_180_data = io_test_in;
  assign data_mem_1_1__T_180_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_180_mask = 1'h1;
  assign data_mem_1_1__T_180_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign io_ic_rd_data = 64'h0; // @[el2_ifu_ic_mem.scala 194:17]
  assign io_ic_debug_rd_data = 71'h0; // @[el2_ifu_ic_mem.scala 195:23]
  assign io_ic_parerr = 2'h0; // @[el2_ifu_ic_mem.scala 196:16]
  assign io_ic_eccerr = 2'h0; // @[el2_ifu_ic_mem.scala 197:16]
  assign io_test = _T_178 ? _GEN_41 : _GEN_45; // @[el2_ifu_ic_mem.scala 198:11 el2_ifu_ic_mem.scala 250:15 el2_ifu_ic_mem.scala 250:15 el2_ifu_ic_mem.scala 250:15 el2_ifu_ic_mem.scala 250:15]
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
  _RAND_0 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_0_0[initvar] = _RAND_0[70:0];
  _RAND_1 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_0_1[initvar] = _RAND_1[70:0];
  _RAND_2 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_1_0[initvar] = _RAND_2[70:0];
  _RAND_3 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_1_1[initvar] = _RAND_3[70:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(data_mem_0_0__T_141_en & data_mem_0_0__T_141_mask) begin
      data_mem_0_0[data_mem_0_0__T_141_addr] <= data_mem_0_0__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_0__T_154_en & data_mem_0_0__T_154_mask) begin
      data_mem_0_0[data_mem_0_0__T_154_addr] <= data_mem_0_0__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_0__T_167_en & data_mem_0_0__T_167_mask) begin
      data_mem_0_0[data_mem_0_0__T_167_addr] <= data_mem_0_0__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_0__T_180_en & data_mem_0_0__T_180_mask) begin
      data_mem_0_0[data_mem_0_0__T_180_addr] <= data_mem_0_0__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_1__T_141_en & data_mem_0_1__T_141_mask) begin
      data_mem_0_1[data_mem_0_1__T_141_addr] <= data_mem_0_1__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_1__T_154_en & data_mem_0_1__T_154_mask) begin
      data_mem_0_1[data_mem_0_1__T_154_addr] <= data_mem_0_1__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_1__T_167_en & data_mem_0_1__T_167_mask) begin
      data_mem_0_1[data_mem_0_1__T_167_addr] <= data_mem_0_1__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_0_1__T_180_en & data_mem_0_1__T_180_mask) begin
      data_mem_0_1[data_mem_0_1__T_180_addr] <= data_mem_0_1__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_0__T_141_en & data_mem_1_0__T_141_mask) begin
      data_mem_1_0[data_mem_1_0__T_141_addr] <= data_mem_1_0__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_0__T_154_en & data_mem_1_0__T_154_mask) begin
      data_mem_1_0[data_mem_1_0__T_154_addr] <= data_mem_1_0__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_0__T_167_en & data_mem_1_0__T_167_mask) begin
      data_mem_1_0[data_mem_1_0__T_167_addr] <= data_mem_1_0__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_0__T_180_en & data_mem_1_0__T_180_mask) begin
      data_mem_1_0[data_mem_1_0__T_180_addr] <= data_mem_1_0__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_1__T_141_en & data_mem_1_1__T_141_mask) begin
      data_mem_1_1[data_mem_1_1__T_141_addr] <= data_mem_1_1__T_141_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_1__T_154_en & data_mem_1_1__T_154_mask) begin
      data_mem_1_1[data_mem_1_1__T_154_addr] <= data_mem_1_1__T_154_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_1__T_167_en & data_mem_1_1__T_167_mask) begin
      data_mem_1_1[data_mem_1_1__T_167_addr] <= data_mem_1_1__T_167_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
    if(data_mem_1_1__T_180_en & data_mem_1_1__T_180_mask) begin
      data_mem_1_1[data_mem_1_1__T_180_addr] <= data_mem_1_1__T_180_data; // @[el2_ifu_ic_mem.scala 243:21]
    end
  end
endmodule
