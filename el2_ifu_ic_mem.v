module el2_ifu_ic_mem(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_clk_override,
  input         io_dec_tlu_core_ecc_disable,
  input  [30:0] io_ic_rw_addr,
  input  [1:0]  io_ic_wr_en,
  input         io_ic_rd_en,
  input  [8:0]  io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  input  [63:0] io_ic_premux_data,
  input         io_ic_sel_premux_data,
  input  [1:0]  io_ic_tag_valid,
  input  [70:0] io_ic_debug_wr_data,
  input  [70:0] io_ic_wr_data_0,
  input  [70:0] io_ic_wr_data_1,
  output [63:0] io_ic_rd_data,
  output [70:0] io_ic_debug_rd_data,
  output [25:0] io_ictag_debug_rd_data,
  output [1:0]  io_ic_eccerr,
  output [1:0]  io_ic_parerr,
  output [1:0]  io_ic_rd_hit,
  output        io_ic_tag_perr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
  reg [95:0] _RAND_1;
  reg [95:0] _RAND_2;
  reg [95:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [70:0] data_mem_0_0 [0:511]; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_145_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_145_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_158_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_158_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_171_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_171_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_184_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_184_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_139_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_139_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_139_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_152_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_152_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_152_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_165_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_165_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_165_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_0__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_0__T_178_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_178_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_0__T_178_en; // @[el2_ifu_ic_mem.scala 82:21]
  reg [70:0] data_mem_0_1 [0:511]; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_145_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_145_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_158_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_158_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_171_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_171_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_184_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_184_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_139_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_139_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_139_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_152_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_152_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_152_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_165_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_165_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_165_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_0_1__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_0_1__T_178_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_178_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_0_1__T_178_en; // @[el2_ifu_ic_mem.scala 82:21]
  reg [70:0] data_mem_1_0 [0:511]; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_145_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_145_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_158_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_158_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_171_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_171_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_184_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_184_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_139_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_139_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_139_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_152_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_152_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_152_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_165_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_165_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_165_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_0__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_0__T_178_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_178_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_0__T_178_en; // @[el2_ifu_ic_mem.scala 82:21]
  reg [70:0] data_mem_1_1 [0:511]; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_145_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_145_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_158_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_158_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_171_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_171_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_184_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_184_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_139_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_139_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_139_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_152_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_152_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_152_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_165_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_165_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_165_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire [70:0] data_mem_1_1__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
  wire [8:0] data_mem_1_1__T_178_addr; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_178_mask; // @[el2_ifu_ic_mem.scala 82:21]
  wire  data_mem_1_1__T_178_en; // @[el2_ifu_ic_mem.scala 82:21]
  wire  _T = ~io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 42:70]
  wire  _T_1 = io_ic_debug_rd_en & _T; // @[el2_ifu_ic_mem.scala 42:68]
  wire [1:0] _T_3 = _T_1 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_debug_rd_way_en = _T_3 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 42:94]
  wire  _T_5 = io_ic_debug_wr_en & _T; // @[el2_ifu_ic_mem.scala 43:68]
  wire [1:0] _T_7 = _T_5 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_debug_wr_way_en = _T_7 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 43:94]
  wire  _T_8 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 48:45]
  wire [10:0] _T_10 = {io_ic_debug_addr,2'h0}; // @[Cat.scala 29:58]
  wire [30:0] ic_rw_addr_q = _T_8 ? {{20'd0}, _T_10} : io_ic_rw_addr; // @[el2_ifu_ic_mem.scala 48:25]
  wire [8:0] ic_rw_addr_q_inc = ic_rw_addr_q[11:3] + 9'h1; // @[el2_ifu_ic_mem.scala 50:79]
  wire  _T_14 = ~io_ic_debug_addr[0]; // @[el2_ifu_ic_mem.scala 52:113]
  wire [1:0] _T_16 = _T_14 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_17 = ic_debug_wr_way_en & _T_16; // @[el2_ifu_ic_mem.scala 52:38]
  wire [1:0] ic_b_sb_wren_0 = io_ic_wr_en | _T_17; // @[el2_ifu_ic_mem.scala 52:17]
  wire [1:0] _T_21 = io_ic_debug_addr[0] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_22 = ic_debug_wr_way_en & _T_21; // @[el2_ifu_ic_mem.scala 52:38]
  wire [1:0] ic_b_sb_wren_1 = io_ic_wr_en | _T_22; // @[el2_ifu_ic_mem.scala 52:17]
  wire [1:0] ic_debug_sel_sb = {io_ic_debug_addr[0],_T_14}; // @[Cat.scala 29:58]
  wire  _T_28 = ic_debug_sel_sb[0] & io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 54:80]
  wire  _T_31 = ic_debug_sel_sb[1] & io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 54:80]
  wire  _T_35 = ~ic_rw_addr_q[2]; // @[el2_ifu_ic_mem.scala 56:16]
  wire  _T_40 = ic_rw_addr_q[1:0] == 2'h3; // @[el2_ifu_ic_mem.scala 57:69]
  wire  _T_54 = ic_rw_addr_q[2] & _T_40; // @[Mux.scala 27:72]
  wire  _T_57 = _T_35 | _T_54; // @[Mux.scala 27:72]
  wire  _T_111 = |io_ic_wr_en; // @[el2_ifu_ic_mem.scala 64:74]
  wire  _T_112 = ~_T_111; // @[el2_ifu_ic_mem.scala 64:61]
  wire  _T_113 = io_ic_debug_rd_en & _T_112; // @[el2_ifu_ic_mem.scala 64:58]
  wire  ic_rd_en_with_debug = io_ic_rd_en | _T_113; // @[el2_ifu_ic_mem.scala 64:38]
  wire  _T_61 = _T_57 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 59:95]
  wire  _T_85 = _T_35 & _T_40; // @[Mux.scala 27:72]
  wire  _T_88 = ic_rw_addr_q[2] | _T_85; // @[Mux.scala 27:72]
  wire  _T_90 = _T_88 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 59:95]
  wire [1:0] ic_b_rden = {_T_90,_T_61}; // @[Cat.scala 29:58]
  wire [1:0] ic_b_sb_rden_0 = ic_b_rden[0] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] ic_b_sb_rden_1 = ic_b_rden[1] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_96 = ic_b_sb_rden_0[0] | io_clk_override; // @[el2_ifu_ic_mem.scala 62:25]
  wire  _T_98 = _T_96 | ic_b_sb_wren_0[0]; // @[el2_ifu_ic_mem.scala 62:43]
  wire  _T_100 = ic_b_sb_rden_0[1] | io_clk_override; // @[el2_ifu_ic_mem.scala 62:25]
  wire  _T_102 = _T_100 | ic_b_sb_wren_0[1]; // @[el2_ifu_ic_mem.scala 62:43]
  wire [1:0] ic_bank_way_clken_0 = {_T_98,_T_102}; // @[Cat.scala 29:58]
  wire  _T_104 = ic_b_sb_rden_1[0] | io_clk_override; // @[el2_ifu_ic_mem.scala 62:25]
  wire  _T_106 = _T_104 | ic_b_sb_wren_1[0]; // @[el2_ifu_ic_mem.scala 62:43]
  wire  _T_108 = ic_b_sb_rden_1[1] | io_clk_override; // @[el2_ifu_ic_mem.scala 62:25]
  wire  _T_110 = _T_108 | ic_b_sb_wren_1[1]; // @[el2_ifu_ic_mem.scala 62:43]
  wire [1:0] ic_bank_way_clken_1 = {_T_106,_T_110}; // @[Cat.scala 29:58]
  wire  _T_119 = _T_54 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 66:86]
  wire  ic_rw_addr_wrap = _T_119 & _T_112; // @[el2_ifu_ic_mem.scala 66:108]
  wire  _T_122 = ~ic_rw_addr_wrap; // @[el2_ifu_ic_mem.scala 68:40]
  wire [8:0] _T_127 = {ic_rw_addr_q[11:5],ic_rw_addr_q_inc[4:3]}; // @[Cat.scala 29:58]
  reg [1:0] ic_b_rden_ff; // @[el2_ifu_ic_mem.scala 72:29]
  reg [4:0] ic_rw_addr_ff; // @[el2_ifu_ic_mem.scala 73:30]
  reg [1:0] ic_debug_rd_way_en_ff; // @[el2_ifu_ic_mem.scala 74:38]
  reg  ic_debug_rd_en_ff; // @[el2_ifu_ic_mem.scala 75:34]
  wire  ic_cacheline_wrap_ff = ic_rw_addr_ff[4:2] == 3'h7; // @[el2_ifu_ic_mem.scala 77:84]
  wire  _T_137 = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0]; // @[el2_ifu_ic_mem.scala 87:30]
  wire  _T_141 = ~ic_b_sb_wren_0[0]; // @[el2_ifu_ic_mem.scala 89:17]
  wire  _T_143 = _T_141 & ic_bank_way_clken_0[0]; // @[el2_ifu_ic_mem.scala 89:36]
  wire [70:0] _GEN_3 = _T_143 ? data_mem_0_0__T_145_data : 71'h0; // @[el2_ifu_ic_mem.scala 89:69]
  wire [70:0] wb_dout_0_0 = _T_137 ? 71'h0 : _GEN_3; // @[el2_ifu_ic_mem.scala 87:64]
  wire  _T_150 = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0]; // @[el2_ifu_ic_mem.scala 87:30]
  wire  _T_154 = ~ic_b_sb_wren_1[0]; // @[el2_ifu_ic_mem.scala 89:17]
  wire  _T_156 = _T_154 & ic_bank_way_clken_1[0]; // @[el2_ifu_ic_mem.scala 89:36]
  wire [70:0] _GEN_17 = _T_156 ? data_mem_1_0__T_158_data : 71'h0; // @[el2_ifu_ic_mem.scala 89:69]
  wire [70:0] wb_dout_0_1 = _T_150 ? 71'h0 : _GEN_17; // @[el2_ifu_ic_mem.scala 87:64]
  wire  _T_163 = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1]; // @[el2_ifu_ic_mem.scala 87:30]
  wire  _T_167 = ~ic_b_sb_wren_0[1]; // @[el2_ifu_ic_mem.scala 89:17]
  wire  _T_169 = _T_167 & ic_bank_way_clken_0[1]; // @[el2_ifu_ic_mem.scala 89:36]
  wire [70:0] _GEN_31 = _T_169 ? data_mem_0_1__T_171_data : 71'h0; // @[el2_ifu_ic_mem.scala 89:69]
  wire [70:0] wb_dout_1_0 = _T_163 ? 71'h0 : _GEN_31; // @[el2_ifu_ic_mem.scala 87:64]
  wire  _T_176 = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1]; // @[el2_ifu_ic_mem.scala 87:30]
  wire  _T_180 = ~ic_b_sb_wren_1[1]; // @[el2_ifu_ic_mem.scala 89:17]
  wire  _T_182 = _T_180 & ic_bank_way_clken_1[1]; // @[el2_ifu_ic_mem.scala 89:36]
  wire [70:0] _GEN_45 = _T_182 ? data_mem_1_1__T_184_data : 71'h0; // @[el2_ifu_ic_mem.scala 89:69]
  wire [70:0] wb_dout_1_1 = _T_176 ? 71'h0 : _GEN_45; // @[el2_ifu_ic_mem.scala 87:64]
  wire [1:0] ic_rd_hit_q = ic_debug_rd_en_ff ? ic_debug_rd_way_en_ff : io_ic_rd_hit; // @[el2_ifu_ic_mem.scala 93:24]
  wire  _T_187 = ~ic_rw_addr_ff[2]; // @[el2_ifu_ic_mem.scala 97:95]
  wire [70:0] _T_192 = _T_187 ? wb_dout_0_0 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_193 = ic_rw_addr_ff[2] ? wb_dout_0_1 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_194 = _T_192 | _T_193; // @[Mux.scala 27:72]
  wire  _T_198 = 1'h0 - 1'h1; // @[el2_ifu_ic_mem.scala 98:102]
  wire  _T_199 = ic_rw_addr_ff[2] == _T_198; // @[el2_ifu_ic_mem.scala 98:95]
  wire [70:0] _T_206 = _T_199 ? wb_dout_0_0 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_207 = _T_187 ? wb_dout_0_1 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_208 = _T_206 | _T_207; // @[Mux.scala 27:72]
  wire [141:0] wb_dout_way_pre_0 = {_T_194,_T_208}; // @[Cat.scala 29:58]
  wire [70:0] _T_216 = _T_187 ? wb_dout_1_0 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_217 = ic_rw_addr_ff[2] ? wb_dout_1_1 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_218 = _T_216 | _T_217; // @[Mux.scala 27:72]
  wire [70:0] _T_230 = _T_199 ? wb_dout_1_0 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_231 = _T_187 ? wb_dout_1_1 : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_232 = _T_230 | _T_231; // @[Mux.scala 27:72]
  wire [141:0] wb_dout_way_pre_1 = {_T_218,_T_232}; // @[Cat.scala 29:58]
  wire  _T_235 = ic_rw_addr_ff[1:0] == 2'h0; // @[el2_ifu_ic_mem.scala 100:83]
  wire  _T_239 = ic_rw_addr_ff[1:0] == 2'h1; // @[el2_ifu_ic_mem.scala 101:24]
  wire [63:0] _T_243 = {wb_dout_way_pre_0[86:71],wb_dout_way_pre_0[63:16]}; // @[Cat.scala 29:58]
  wire  _T_245 = ic_rw_addr_ff[1:0] == 2'h2; // @[el2_ifu_ic_mem.scala 102:24]
  wire [63:0] _T_249 = {wb_dout_way_pre_0[102:71],wb_dout_way_pre_0[63:32]}; // @[Cat.scala 29:58]
  wire  _T_251 = ic_rw_addr_ff[1:0] == 2'h3; // @[el2_ifu_ic_mem.scala 103:24]
  wire [63:0] _T_255 = {wb_dout_way_pre_0[118:71],wb_dout_way_pre_0[63:48]}; // @[Cat.scala 29:58]
  wire [63:0] _T_256 = _T_235 ? wb_dout_way_pre_0[63:0] : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_257 = _T_239 ? _T_243 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_258 = _T_245 ? _T_249 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_259 = _T_251 ? _T_255 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_260 = _T_256 | _T_257; // @[Mux.scala 27:72]
  wire [63:0] _T_261 = _T_260 | _T_258; // @[Mux.scala 27:72]
  wire [63:0] wb_dout_way_0 = _T_261 | _T_259; // @[Mux.scala 27:72]
  wire [63:0] _T_272 = {wb_dout_way_pre_1[86:71],wb_dout_way_pre_1[63:16]}; // @[Cat.scala 29:58]
  wire [63:0] _T_278 = {wb_dout_way_pre_1[102:71],wb_dout_way_pre_1[63:32]}; // @[Cat.scala 29:58]
  wire [63:0] _T_284 = {wb_dout_way_pre_1[118:71],wb_dout_way_pre_1[63:48]}; // @[Cat.scala 29:58]
  wire [63:0] _T_285 = _T_235 ? wb_dout_way_pre_1[63:0] : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_286 = _T_239 ? _T_272 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_287 = _T_245 ? _T_278 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_288 = _T_251 ? _T_284 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_289 = _T_285 | _T_286; // @[Mux.scala 27:72]
  wire [63:0] _T_290 = _T_289 | _T_287; // @[Mux.scala 27:72]
  wire [63:0] wb_dout_way_1 = _T_290 | _T_288; // @[Mux.scala 27:72]
  wire [63:0] wb_dout_way_with_premux_0 = io_ic_sel_premux_data ? io_ic_premux_data : wb_dout_way_0; // @[el2_ifu_ic_mem.scala 105:69]
  wire [63:0] wb_dout_way_with_premux_1 = io_ic_sel_premux_data ? io_ic_premux_data : wb_dout_way_1; // @[el2_ifu_ic_mem.scala 105:69]
  wire  _T_295 = ic_rd_hit_q[0] | io_ic_sel_premux_data; // @[el2_ifu_ic_mem.scala 107:75]
  wire  _T_298 = ic_rd_hit_q[1] | io_ic_sel_premux_data; // @[el2_ifu_ic_mem.scala 107:75]
  wire [63:0] _T_300 = _T_295 ? wb_dout_way_with_premux_0 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_301 = _T_298 ? wb_dout_way_with_premux_1 : 64'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_310 = ic_rd_hit_q[0] ? wb_dout_way_pre_0[70:0] : 71'h0; // @[Mux.scala 27:72]
  wire [70:0] _T_311 = ic_rd_hit_q[1] ? wb_dout_way_pre_1[70:0] : 71'h0; // @[Mux.scala 27:72]
  wire [141:0] _T_318 = ic_rd_hit_q[0] ? wb_dout_way_pre_0 : 142'h0; // @[Mux.scala 27:72]
  wire [141:0] _T_319 = ic_rd_hit_q[1] ? wb_dout_way_pre_1 : 142'h0; // @[Mux.scala 27:72]
  wire [141:0] wb_dout_ecc = _T_318 | _T_319; // @[Mux.scala 27:72]
  wire  _T_321 = |io_ic_rd_hit; // @[el2_ifu_ic_mem.scala 111:75]
  wire  _T_322 = ~ic_cacheline_wrap_ff; // @[el2_ifu_ic_mem.scala 111:103]
  wire  _T_325 = ic_b_rden_ff == 2'h3; // @[el2_ifu_ic_mem.scala 111:163]
  wire  _T_326 = _T_322 & _T_325; // @[el2_ifu_ic_mem.scala 111:125]
  wire  bank_check_en_0 = _T_321 & _T_326; // @[el2_ifu_ic_mem.scala 111:79]
  wire [70:0] wb_dout_ecc_bank_0 = wb_dout_ecc[70:0]; // @[el2_ifu_ic_mem.scala 112:72]
  wire [70:0] wb_dout_ecc_bank_1 = wb_dout_ecc[141:71]; // @[el2_ifu_ic_mem.scala 112:72]
  wire [6:0] _T_555 = {wb_dout_ecc_bank_0[63],wb_dout_ecc_bank_0[62],wb_dout_ecc_bank_0[61],wb_dout_ecc_bank_0[60],wb_dout_ecc_bank_0[59],wb_dout_ecc_bank_0[58],wb_dout_ecc_bank_0[57]}; // @[el2_lib.scala 379:41]
  wire  _T_556 = ^_T_555; // @[el2_lib.scala 379:48]
  wire  _T_557 = wb_dout_ecc_bank_0[70] ^ _T_556; // @[el2_lib.scala 379:36]
  wire [6:0] _T_564 = {wb_dout_ecc_bank_0[32],wb_dout_ecc_bank_0[31],wb_dout_ecc_bank_0[30],wb_dout_ecc_bank_0[29],wb_dout_ecc_bank_0[28],wb_dout_ecc_bank_0[27],wb_dout_ecc_bank_0[26]}; // @[el2_lib.scala 379:69]
  wire [7:0] _T_571 = {wb_dout_ecc_bank_0[40],wb_dout_ecc_bank_0[39],wb_dout_ecc_bank_0[38],wb_dout_ecc_bank_0[37],wb_dout_ecc_bank_0[36],wb_dout_ecc_bank_0[35],wb_dout_ecc_bank_0[34],wb_dout_ecc_bank_0[33]}; // @[el2_lib.scala 379:69]
  wire [14:0] _T_572 = {wb_dout_ecc_bank_0[40],wb_dout_ecc_bank_0[39],wb_dout_ecc_bank_0[38],wb_dout_ecc_bank_0[37],wb_dout_ecc_bank_0[36],wb_dout_ecc_bank_0[35],wb_dout_ecc_bank_0[34],wb_dout_ecc_bank_0[33],_T_564}; // @[el2_lib.scala 379:69]
  wire [7:0] _T_579 = {wb_dout_ecc_bank_0[48],wb_dout_ecc_bank_0[47],wb_dout_ecc_bank_0[46],wb_dout_ecc_bank_0[45],wb_dout_ecc_bank_0[44],wb_dout_ecc_bank_0[43],wb_dout_ecc_bank_0[42],wb_dout_ecc_bank_0[41]}; // @[el2_lib.scala 379:69]
  wire [30:0] _T_588 = {wb_dout_ecc_bank_0[56],wb_dout_ecc_bank_0[55],wb_dout_ecc_bank_0[54],wb_dout_ecc_bank_0[53],wb_dout_ecc_bank_0[52],wb_dout_ecc_bank_0[51],wb_dout_ecc_bank_0[50],wb_dout_ecc_bank_0[49],_T_579,_T_572}; // @[el2_lib.scala 379:69]
  wire  _T_589 = ^_T_588; // @[el2_lib.scala 379:76]
  wire  _T_590 = wb_dout_ecc_bank_0[69] ^ _T_589; // @[el2_lib.scala 379:64]
  wire [6:0] _T_597 = {wb_dout_ecc_bank_0[17],wb_dout_ecc_bank_0[16],wb_dout_ecc_bank_0[15],wb_dout_ecc_bank_0[14],wb_dout_ecc_bank_0[13],wb_dout_ecc_bank_0[12],wb_dout_ecc_bank_0[11]}; // @[el2_lib.scala 379:96]
  wire [14:0] _T_605 = {wb_dout_ecc_bank_0[25],wb_dout_ecc_bank_0[24],wb_dout_ecc_bank_0[23],wb_dout_ecc_bank_0[22],wb_dout_ecc_bank_0[21],wb_dout_ecc_bank_0[20],wb_dout_ecc_bank_0[19],wb_dout_ecc_bank_0[18],_T_597}; // @[el2_lib.scala 379:96]
  wire [30:0] _T_621 = {wb_dout_ecc_bank_0[56],wb_dout_ecc_bank_0[55],wb_dout_ecc_bank_0[54],wb_dout_ecc_bank_0[53],wb_dout_ecc_bank_0[52],wb_dout_ecc_bank_0[51],wb_dout_ecc_bank_0[50],wb_dout_ecc_bank_0[49],_T_579,_T_605}; // @[el2_lib.scala 379:96]
  wire  _T_622 = ^_T_621; // @[el2_lib.scala 379:103]
  wire  _T_623 = wb_dout_ecc_bank_0[68] ^ _T_622; // @[el2_lib.scala 379:91]
  wire [6:0] _T_630 = {wb_dout_ecc_bank_0[10],wb_dout_ecc_bank_0[9],wb_dout_ecc_bank_0[8],wb_dout_ecc_bank_0[7],wb_dout_ecc_bank_0[6],wb_dout_ecc_bank_0[5],wb_dout_ecc_bank_0[4]}; // @[el2_lib.scala 379:123]
  wire [14:0] _T_638 = {wb_dout_ecc_bank_0[25],wb_dout_ecc_bank_0[24],wb_dout_ecc_bank_0[23],wb_dout_ecc_bank_0[22],wb_dout_ecc_bank_0[21],wb_dout_ecc_bank_0[20],wb_dout_ecc_bank_0[19],wb_dout_ecc_bank_0[18],_T_630}; // @[el2_lib.scala 379:123]
  wire [30:0] _T_654 = {wb_dout_ecc_bank_0[56],wb_dout_ecc_bank_0[55],wb_dout_ecc_bank_0[54],wb_dout_ecc_bank_0[53],wb_dout_ecc_bank_0[52],wb_dout_ecc_bank_0[51],wb_dout_ecc_bank_0[50],wb_dout_ecc_bank_0[49],_T_571,_T_638}; // @[el2_lib.scala 379:123]
  wire  _T_655 = ^_T_654; // @[el2_lib.scala 379:130]
  wire  _T_656 = wb_dout_ecc_bank_0[67] ^ _T_655; // @[el2_lib.scala 379:118]
  wire [7:0] _T_664 = {wb_dout_ecc_bank_0[14],wb_dout_ecc_bank_0[10],wb_dout_ecc_bank_0[9],wb_dout_ecc_bank_0[8],wb_dout_ecc_bank_0[7],wb_dout_ecc_bank_0[3],wb_dout_ecc_bank_0[2],wb_dout_ecc_bank_0[1]}; // @[el2_lib.scala 379:150]
  wire [16:0] _T_673 = {wb_dout_ecc_bank_0[30],wb_dout_ecc_bank_0[29],wb_dout_ecc_bank_0[25],wb_dout_ecc_bank_0[24],wb_dout_ecc_bank_0[23],wb_dout_ecc_bank_0[22],wb_dout_ecc_bank_0[17],wb_dout_ecc_bank_0[16],wb_dout_ecc_bank_0[15],_T_664}; // @[el2_lib.scala 379:150]
  wire [8:0] _T_681 = {wb_dout_ecc_bank_0[47],wb_dout_ecc_bank_0[46],wb_dout_ecc_bank_0[45],wb_dout_ecc_bank_0[40],wb_dout_ecc_bank_0[39],wb_dout_ecc_bank_0[38],wb_dout_ecc_bank_0[37],wb_dout_ecc_bank_0[32],wb_dout_ecc_bank_0[31]}; // @[el2_lib.scala 379:150]
  wire [17:0] _T_690 = {wb_dout_ecc_bank_0[63],wb_dout_ecc_bank_0[62],wb_dout_ecc_bank_0[61],wb_dout_ecc_bank_0[60],wb_dout_ecc_bank_0[56],wb_dout_ecc_bank_0[55],wb_dout_ecc_bank_0[54],wb_dout_ecc_bank_0[53],wb_dout_ecc_bank_0[48],_T_681}; // @[el2_lib.scala 379:150]
  wire [34:0] _T_691 = {_T_690,_T_673}; // @[el2_lib.scala 379:150]
  wire  _T_692 = ^_T_691; // @[el2_lib.scala 379:157]
  wire  _T_693 = wb_dout_ecc_bank_0[66] ^ _T_692; // @[el2_lib.scala 379:145]
  wire [7:0] _T_701 = {wb_dout_ecc_bank_0[12],wb_dout_ecc_bank_0[10],wb_dout_ecc_bank_0[9],wb_dout_ecc_bank_0[6],wb_dout_ecc_bank_0[5],wb_dout_ecc_bank_0[3],wb_dout_ecc_bank_0[2],wb_dout_ecc_bank_0[0]}; // @[el2_lib.scala 379:177]
  wire [16:0] _T_710 = {wb_dout_ecc_bank_0[28],wb_dout_ecc_bank_0[27],wb_dout_ecc_bank_0[25],wb_dout_ecc_bank_0[24],wb_dout_ecc_bank_0[21],wb_dout_ecc_bank_0[20],wb_dout_ecc_bank_0[17],wb_dout_ecc_bank_0[16],wb_dout_ecc_bank_0[13],_T_701}; // @[el2_lib.scala 379:177]
  wire [8:0] _T_718 = {wb_dout_ecc_bank_0[47],wb_dout_ecc_bank_0[44],wb_dout_ecc_bank_0[43],wb_dout_ecc_bank_0[40],wb_dout_ecc_bank_0[39],wb_dout_ecc_bank_0[36],wb_dout_ecc_bank_0[35],wb_dout_ecc_bank_0[32],wb_dout_ecc_bank_0[31]}; // @[el2_lib.scala 379:177]
  wire [17:0] _T_727 = {wb_dout_ecc_bank_0[63],wb_dout_ecc_bank_0[62],wb_dout_ecc_bank_0[59],wb_dout_ecc_bank_0[58],wb_dout_ecc_bank_0[56],wb_dout_ecc_bank_0[55],wb_dout_ecc_bank_0[52],wb_dout_ecc_bank_0[51],wb_dout_ecc_bank_0[48],_T_718}; // @[el2_lib.scala 379:177]
  wire [34:0] _T_728 = {_T_727,_T_710}; // @[el2_lib.scala 379:177]
  wire  _T_729 = ^_T_728; // @[el2_lib.scala 379:184]
  wire  _T_730 = wb_dout_ecc_bank_0[65] ^ _T_729; // @[el2_lib.scala 379:172]
  wire [7:0] _T_738 = {wb_dout_ecc_bank_0[11],wb_dout_ecc_bank_0[10],wb_dout_ecc_bank_0[8],wb_dout_ecc_bank_0[6],wb_dout_ecc_bank_0[4],wb_dout_ecc_bank_0[3],wb_dout_ecc_bank_0[1],wb_dout_ecc_bank_0[0]}; // @[el2_lib.scala 379:204]
  wire [16:0] _T_747 = {wb_dout_ecc_bank_0[28],wb_dout_ecc_bank_0[26],wb_dout_ecc_bank_0[25],wb_dout_ecc_bank_0[23],wb_dout_ecc_bank_0[21],wb_dout_ecc_bank_0[19],wb_dout_ecc_bank_0[17],wb_dout_ecc_bank_0[15],wb_dout_ecc_bank_0[13],_T_738}; // @[el2_lib.scala 379:204]
  wire [8:0] _T_755 = {wb_dout_ecc_bank_0[46],wb_dout_ecc_bank_0[44],wb_dout_ecc_bank_0[42],wb_dout_ecc_bank_0[40],wb_dout_ecc_bank_0[38],wb_dout_ecc_bank_0[36],wb_dout_ecc_bank_0[34],wb_dout_ecc_bank_0[32],wb_dout_ecc_bank_0[30]}; // @[el2_lib.scala 379:204]
  wire [17:0] _T_764 = {wb_dout_ecc_bank_0[63],wb_dout_ecc_bank_0[61],wb_dout_ecc_bank_0[59],wb_dout_ecc_bank_0[57],wb_dout_ecc_bank_0[56],wb_dout_ecc_bank_0[54],wb_dout_ecc_bank_0[52],wb_dout_ecc_bank_0[50],wb_dout_ecc_bank_0[48],_T_755}; // @[el2_lib.scala 379:204]
  wire [34:0] _T_765 = {_T_764,_T_747}; // @[el2_lib.scala 379:204]
  wire  _T_766 = ^_T_765; // @[el2_lib.scala 379:211]
  wire  _T_767 = wb_dout_ecc_bank_0[64] ^ _T_766; // @[el2_lib.scala 379:199]
  wire [6:0] _T_773 = {_T_557,_T_590,_T_623,_T_656,_T_693,_T_730,_T_767}; // @[Cat.scala 29:58]
  wire  _T_775 = _T_773 != 7'h0; // @[el2_lib.scala 380:42]
  wire  _T_776 = bank_check_en_0 & _T_775; // @[el2_lib.scala 380:24]
  wire [6:0] _T_997 = {wb_dout_ecc_bank_1[63],wb_dout_ecc_bank_1[62],wb_dout_ecc_bank_1[61],wb_dout_ecc_bank_1[60],wb_dout_ecc_bank_1[59],wb_dout_ecc_bank_1[58],wb_dout_ecc_bank_1[57]}; // @[el2_lib.scala 379:41]
  wire  _T_998 = ^_T_997; // @[el2_lib.scala 379:48]
  wire  _T_999 = wb_dout_ecc_bank_1[70] ^ _T_998; // @[el2_lib.scala 379:36]
  wire [6:0] _T_1006 = {wb_dout_ecc_bank_1[32],wb_dout_ecc_bank_1[31],wb_dout_ecc_bank_1[30],wb_dout_ecc_bank_1[29],wb_dout_ecc_bank_1[28],wb_dout_ecc_bank_1[27],wb_dout_ecc_bank_1[26]}; // @[el2_lib.scala 379:69]
  wire [7:0] _T_1013 = {wb_dout_ecc_bank_1[40],wb_dout_ecc_bank_1[39],wb_dout_ecc_bank_1[38],wb_dout_ecc_bank_1[37],wb_dout_ecc_bank_1[36],wb_dout_ecc_bank_1[35],wb_dout_ecc_bank_1[34],wb_dout_ecc_bank_1[33]}; // @[el2_lib.scala 379:69]
  wire [14:0] _T_1014 = {wb_dout_ecc_bank_1[40],wb_dout_ecc_bank_1[39],wb_dout_ecc_bank_1[38],wb_dout_ecc_bank_1[37],wb_dout_ecc_bank_1[36],wb_dout_ecc_bank_1[35],wb_dout_ecc_bank_1[34],wb_dout_ecc_bank_1[33],_T_1006}; // @[el2_lib.scala 379:69]
  wire [7:0] _T_1021 = {wb_dout_ecc_bank_1[48],wb_dout_ecc_bank_1[47],wb_dout_ecc_bank_1[46],wb_dout_ecc_bank_1[45],wb_dout_ecc_bank_1[44],wb_dout_ecc_bank_1[43],wb_dout_ecc_bank_1[42],wb_dout_ecc_bank_1[41]}; // @[el2_lib.scala 379:69]
  wire [30:0] _T_1030 = {wb_dout_ecc_bank_1[56],wb_dout_ecc_bank_1[55],wb_dout_ecc_bank_1[54],wb_dout_ecc_bank_1[53],wb_dout_ecc_bank_1[52],wb_dout_ecc_bank_1[51],wb_dout_ecc_bank_1[50],wb_dout_ecc_bank_1[49],_T_1021,_T_1014}; // @[el2_lib.scala 379:69]
  wire  _T_1031 = ^_T_1030; // @[el2_lib.scala 379:76]
  wire  _T_1032 = wb_dout_ecc_bank_1[69] ^ _T_1031; // @[el2_lib.scala 379:64]
  wire [6:0] _T_1039 = {wb_dout_ecc_bank_1[17],wb_dout_ecc_bank_1[16],wb_dout_ecc_bank_1[15],wb_dout_ecc_bank_1[14],wb_dout_ecc_bank_1[13],wb_dout_ecc_bank_1[12],wb_dout_ecc_bank_1[11]}; // @[el2_lib.scala 379:96]
  wire [14:0] _T_1047 = {wb_dout_ecc_bank_1[25],wb_dout_ecc_bank_1[24],wb_dout_ecc_bank_1[23],wb_dout_ecc_bank_1[22],wb_dout_ecc_bank_1[21],wb_dout_ecc_bank_1[20],wb_dout_ecc_bank_1[19],wb_dout_ecc_bank_1[18],_T_1039}; // @[el2_lib.scala 379:96]
  wire [30:0] _T_1063 = {wb_dout_ecc_bank_1[56],wb_dout_ecc_bank_1[55],wb_dout_ecc_bank_1[54],wb_dout_ecc_bank_1[53],wb_dout_ecc_bank_1[52],wb_dout_ecc_bank_1[51],wb_dout_ecc_bank_1[50],wb_dout_ecc_bank_1[49],_T_1021,_T_1047}; // @[el2_lib.scala 379:96]
  wire  _T_1064 = ^_T_1063; // @[el2_lib.scala 379:103]
  wire  _T_1065 = wb_dout_ecc_bank_1[68] ^ _T_1064; // @[el2_lib.scala 379:91]
  wire [6:0] _T_1072 = {wb_dout_ecc_bank_1[10],wb_dout_ecc_bank_1[9],wb_dout_ecc_bank_1[8],wb_dout_ecc_bank_1[7],wb_dout_ecc_bank_1[6],wb_dout_ecc_bank_1[5],wb_dout_ecc_bank_1[4]}; // @[el2_lib.scala 379:123]
  wire [14:0] _T_1080 = {wb_dout_ecc_bank_1[25],wb_dout_ecc_bank_1[24],wb_dout_ecc_bank_1[23],wb_dout_ecc_bank_1[22],wb_dout_ecc_bank_1[21],wb_dout_ecc_bank_1[20],wb_dout_ecc_bank_1[19],wb_dout_ecc_bank_1[18],_T_1072}; // @[el2_lib.scala 379:123]
  wire [30:0] _T_1096 = {wb_dout_ecc_bank_1[56],wb_dout_ecc_bank_1[55],wb_dout_ecc_bank_1[54],wb_dout_ecc_bank_1[53],wb_dout_ecc_bank_1[52],wb_dout_ecc_bank_1[51],wb_dout_ecc_bank_1[50],wb_dout_ecc_bank_1[49],_T_1013,_T_1080}; // @[el2_lib.scala 379:123]
  wire  _T_1097 = ^_T_1096; // @[el2_lib.scala 379:130]
  wire  _T_1098 = wb_dout_ecc_bank_1[67] ^ _T_1097; // @[el2_lib.scala 379:118]
  wire [7:0] _T_1106 = {wb_dout_ecc_bank_1[14],wb_dout_ecc_bank_1[10],wb_dout_ecc_bank_1[9],wb_dout_ecc_bank_1[8],wb_dout_ecc_bank_1[7],wb_dout_ecc_bank_1[3],wb_dout_ecc_bank_1[2],wb_dout_ecc_bank_1[1]}; // @[el2_lib.scala 379:150]
  wire [16:0] _T_1115 = {wb_dout_ecc_bank_1[30],wb_dout_ecc_bank_1[29],wb_dout_ecc_bank_1[25],wb_dout_ecc_bank_1[24],wb_dout_ecc_bank_1[23],wb_dout_ecc_bank_1[22],wb_dout_ecc_bank_1[17],wb_dout_ecc_bank_1[16],wb_dout_ecc_bank_1[15],_T_1106}; // @[el2_lib.scala 379:150]
  wire [8:0] _T_1123 = {wb_dout_ecc_bank_1[47],wb_dout_ecc_bank_1[46],wb_dout_ecc_bank_1[45],wb_dout_ecc_bank_1[40],wb_dout_ecc_bank_1[39],wb_dout_ecc_bank_1[38],wb_dout_ecc_bank_1[37],wb_dout_ecc_bank_1[32],wb_dout_ecc_bank_1[31]}; // @[el2_lib.scala 379:150]
  wire [17:0] _T_1132 = {wb_dout_ecc_bank_1[63],wb_dout_ecc_bank_1[62],wb_dout_ecc_bank_1[61],wb_dout_ecc_bank_1[60],wb_dout_ecc_bank_1[56],wb_dout_ecc_bank_1[55],wb_dout_ecc_bank_1[54],wb_dout_ecc_bank_1[53],wb_dout_ecc_bank_1[48],_T_1123}; // @[el2_lib.scala 379:150]
  wire [34:0] _T_1133 = {_T_1132,_T_1115}; // @[el2_lib.scala 379:150]
  wire  _T_1134 = ^_T_1133; // @[el2_lib.scala 379:157]
  wire  _T_1135 = wb_dout_ecc_bank_1[66] ^ _T_1134; // @[el2_lib.scala 379:145]
  wire [7:0] _T_1143 = {wb_dout_ecc_bank_1[12],wb_dout_ecc_bank_1[10],wb_dout_ecc_bank_1[9],wb_dout_ecc_bank_1[6],wb_dout_ecc_bank_1[5],wb_dout_ecc_bank_1[3],wb_dout_ecc_bank_1[2],wb_dout_ecc_bank_1[0]}; // @[el2_lib.scala 379:177]
  wire [16:0] _T_1152 = {wb_dout_ecc_bank_1[28],wb_dout_ecc_bank_1[27],wb_dout_ecc_bank_1[25],wb_dout_ecc_bank_1[24],wb_dout_ecc_bank_1[21],wb_dout_ecc_bank_1[20],wb_dout_ecc_bank_1[17],wb_dout_ecc_bank_1[16],wb_dout_ecc_bank_1[13],_T_1143}; // @[el2_lib.scala 379:177]
  wire [8:0] _T_1160 = {wb_dout_ecc_bank_1[47],wb_dout_ecc_bank_1[44],wb_dout_ecc_bank_1[43],wb_dout_ecc_bank_1[40],wb_dout_ecc_bank_1[39],wb_dout_ecc_bank_1[36],wb_dout_ecc_bank_1[35],wb_dout_ecc_bank_1[32],wb_dout_ecc_bank_1[31]}; // @[el2_lib.scala 379:177]
  wire [17:0] _T_1169 = {wb_dout_ecc_bank_1[63],wb_dout_ecc_bank_1[62],wb_dout_ecc_bank_1[59],wb_dout_ecc_bank_1[58],wb_dout_ecc_bank_1[56],wb_dout_ecc_bank_1[55],wb_dout_ecc_bank_1[52],wb_dout_ecc_bank_1[51],wb_dout_ecc_bank_1[48],_T_1160}; // @[el2_lib.scala 379:177]
  wire [34:0] _T_1170 = {_T_1169,_T_1152}; // @[el2_lib.scala 379:177]
  wire  _T_1171 = ^_T_1170; // @[el2_lib.scala 379:184]
  wire  _T_1172 = wb_dout_ecc_bank_1[65] ^ _T_1171; // @[el2_lib.scala 379:172]
  wire [7:0] _T_1180 = {wb_dout_ecc_bank_1[11],wb_dout_ecc_bank_1[10],wb_dout_ecc_bank_1[8],wb_dout_ecc_bank_1[6],wb_dout_ecc_bank_1[4],wb_dout_ecc_bank_1[3],wb_dout_ecc_bank_1[1],wb_dout_ecc_bank_1[0]}; // @[el2_lib.scala 379:204]
  wire [16:0] _T_1189 = {wb_dout_ecc_bank_1[28],wb_dout_ecc_bank_1[26],wb_dout_ecc_bank_1[25],wb_dout_ecc_bank_1[23],wb_dout_ecc_bank_1[21],wb_dout_ecc_bank_1[19],wb_dout_ecc_bank_1[17],wb_dout_ecc_bank_1[15],wb_dout_ecc_bank_1[13],_T_1180}; // @[el2_lib.scala 379:204]
  wire [8:0] _T_1197 = {wb_dout_ecc_bank_1[46],wb_dout_ecc_bank_1[44],wb_dout_ecc_bank_1[42],wb_dout_ecc_bank_1[40],wb_dout_ecc_bank_1[38],wb_dout_ecc_bank_1[36],wb_dout_ecc_bank_1[34],wb_dout_ecc_bank_1[32],wb_dout_ecc_bank_1[30]}; // @[el2_lib.scala 379:204]
  wire [17:0] _T_1206 = {wb_dout_ecc_bank_1[63],wb_dout_ecc_bank_1[61],wb_dout_ecc_bank_1[59],wb_dout_ecc_bank_1[57],wb_dout_ecc_bank_1[56],wb_dout_ecc_bank_1[54],wb_dout_ecc_bank_1[52],wb_dout_ecc_bank_1[50],wb_dout_ecc_bank_1[48],_T_1197}; // @[el2_lib.scala 379:204]
  wire [34:0] _T_1207 = {_T_1206,_T_1189}; // @[el2_lib.scala 379:204]
  wire  _T_1208 = ^_T_1207; // @[el2_lib.scala 379:211]
  wire  _T_1209 = wb_dout_ecc_bank_1[64] ^ _T_1208; // @[el2_lib.scala 379:199]
  wire [6:0] _T_1215 = {_T_999,_T_1032,_T_1065,_T_1098,_T_1135,_T_1172,_T_1209}; // @[Cat.scala 29:58]
  wire  _T_1217 = _T_1215 != 7'h0; // @[el2_lib.scala 380:42]
  wire  _T_1218 = bank_check_en_0 & _T_1217; // @[el2_lib.scala 380:24]
  wire  _T_1222 = ^wb_dout_ecc_bank_0[15:0]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_0_0 = _T_1222 ^ wb_dout_ecc_bank_0[64]; // @[el2_lib.scala 200:27]
  wire  _T_1226 = ^wb_dout_ecc_bank_0[31:16]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_0_1 = _T_1226 ^ wb_dout_ecc_bank_0[65]; // @[el2_lib.scala 200:27]
  wire  _T_1230 = ^wb_dout_ecc_bank_0[47:32]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_0_2 = _T_1230 ^ wb_dout_ecc_bank_0[66]; // @[el2_lib.scala 200:27]
  wire  _T_1234 = ^wb_dout_ecc_bank_0[63:48]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_0_3 = _T_1234 ^ wb_dout_ecc_bank_0[67]; // @[el2_lib.scala 200:27]
  wire  _T_1238 = ^wb_dout_ecc_bank_1[15:0]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_1_0 = _T_1238 ^ wb_dout_ecc_bank_1[64]; // @[el2_lib.scala 200:27]
  wire  _T_1242 = ^wb_dout_ecc_bank_1[31:16]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_1_1 = _T_1242 ^ wb_dout_ecc_bank_1[65]; // @[el2_lib.scala 200:27]
  wire  _T_1246 = ^wb_dout_ecc_bank_1[47:32]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_1_2 = _T_1246 ^ wb_dout_ecc_bank_1[66]; // @[el2_lib.scala 200:27]
  wire  _T_1250 = ^wb_dout_ecc_bank_1[63:48]; // @[el2_lib.scala 200:14]
  wire  ic_parerr_bank_1_3 = _T_1250 ^ wb_dout_ecc_bank_1[67]; // @[el2_lib.scala 200:27]
  wire  _T_1252 = ic_parerr_bank_0_0 | ic_parerr_bank_0_1; // @[el2_ifu_ic_mem.scala 119:49]
  wire  _T_1253 = _T_1252 | ic_parerr_bank_0_2; // @[el2_ifu_ic_mem.scala 119:49]
  wire  _T_1254 = _T_1253 | ic_parerr_bank_0_3; // @[el2_ifu_ic_mem.scala 119:49]
  wire  _T_1255 = _T_1254 & bank_check_en_0; // @[el2_ifu_ic_mem.scala 119:53]
  wire  _T_1256 = ic_parerr_bank_1_0 | ic_parerr_bank_1_1; // @[el2_ifu_ic_mem.scala 119:99]
  wire  _T_1257 = _T_1256 | ic_parerr_bank_1_2; // @[el2_ifu_ic_mem.scala 119:99]
  wire  _T_1258 = _T_1257 | ic_parerr_bank_1_3; // @[el2_ifu_ic_mem.scala 119:99]
  wire  _T_1259 = _T_1258 & bank_check_en_0; // @[el2_ifu_ic_mem.scala 119:103]
  assign data_mem_0_0__T_145_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_0__T_145_data = data_mem_0_0[data_mem_0_0__T_145_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_0__T_158_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_158_data = data_mem_0_0[data_mem_0_0__T_158_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_0__T_171_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_0__T_171_data = data_mem_0_0[data_mem_0_0__T_171_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_0__T_184_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_184_data = data_mem_0_0[data_mem_0_0__T_184_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_0__T_139_data = _T_28 ? io_ic_debug_wr_data : io_ic_wr_data_0;
  assign data_mem_0_0__T_139_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_0__T_139_mask = 1'h1;
  assign data_mem_0_0__T_139_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_0_0__T_152_data = 71'h0;
  assign data_mem_0_0__T_152_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_152_mask = 1'h0;
  assign data_mem_0_0__T_152_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_0_0__T_165_data = 71'h0;
  assign data_mem_0_0__T_165_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_0__T_165_mask = 1'h0;
  assign data_mem_0_0__T_165_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_0_0__T_178_data = 71'h0;
  assign data_mem_0_0__T_178_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_0__T_178_mask = 1'h0;
  assign data_mem_0_0__T_178_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign data_mem_0_1__T_145_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_1__T_145_data = data_mem_0_1[data_mem_0_1__T_145_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_1__T_158_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_158_data = data_mem_0_1[data_mem_0_1__T_158_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_1__T_171_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_1__T_171_data = data_mem_0_1[data_mem_0_1__T_171_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_1__T_184_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_184_data = data_mem_0_1[data_mem_0_1__T_184_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_0_1__T_139_data = 71'h0;
  assign data_mem_0_1__T_139_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_1__T_139_mask = 1'h0;
  assign data_mem_0_1__T_139_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_0_1__T_152_data = 71'h0;
  assign data_mem_0_1__T_152_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_152_mask = 1'h0;
  assign data_mem_0_1__T_152_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_0_1__T_165_data = _T_28 ? io_ic_debug_wr_data : io_ic_wr_data_0;
  assign data_mem_0_1__T_165_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_0_1__T_165_mask = 1'h1;
  assign data_mem_0_1__T_165_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_0_1__T_178_data = 71'h0;
  assign data_mem_0_1__T_178_addr = ic_rw_addr_q[11:3];
  assign data_mem_0_1__T_178_mask = 1'h0;
  assign data_mem_0_1__T_178_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign data_mem_1_0__T_145_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_0__T_145_data = data_mem_1_0[data_mem_1_0__T_145_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_0__T_158_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_158_data = data_mem_1_0[data_mem_1_0__T_158_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_0__T_171_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_0__T_171_data = data_mem_1_0[data_mem_1_0__T_171_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_0__T_184_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_184_data = data_mem_1_0[data_mem_1_0__T_184_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_0__T_139_data = 71'h0;
  assign data_mem_1_0__T_139_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_0__T_139_mask = 1'h0;
  assign data_mem_1_0__T_139_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_1_0__T_152_data = _T_31 ? io_ic_debug_wr_data : io_ic_wr_data_1;
  assign data_mem_1_0__T_152_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_152_mask = 1'h1;
  assign data_mem_1_0__T_152_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_1_0__T_165_data = 71'h0;
  assign data_mem_1_0__T_165_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_0__T_165_mask = 1'h0;
  assign data_mem_1_0__T_165_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_1_0__T_178_data = 71'h0;
  assign data_mem_1_0__T_178_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_0__T_178_mask = 1'h0;
  assign data_mem_1_0__T_178_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign data_mem_1_1__T_145_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_1__T_145_data = data_mem_1_1[data_mem_1_1__T_145_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_1__T_158_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_158_data = data_mem_1_1[data_mem_1_1__T_158_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_1__T_171_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_1__T_171_data = data_mem_1_1[data_mem_1_1__T_171_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_1__T_184_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_184_data = data_mem_1_1[data_mem_1_1__T_184_addr]; // @[el2_ifu_ic_mem.scala 82:21]
  assign data_mem_1_1__T_139_data = 71'h0;
  assign data_mem_1_1__T_139_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_1__T_139_mask = 1'h0;
  assign data_mem_1_1__T_139_en = ic_b_sb_wren_0[0] & ic_bank_way_clken_0[0];
  assign data_mem_1_1__T_152_data = 71'h0;
  assign data_mem_1_1__T_152_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_152_mask = 1'h0;
  assign data_mem_1_1__T_152_en = ic_b_sb_wren_1[0] & ic_bank_way_clken_1[0];
  assign data_mem_1_1__T_165_data = 71'h0;
  assign data_mem_1_1__T_165_addr = _T_122 ? ic_rw_addr_q[11:3] : _T_127;
  assign data_mem_1_1__T_165_mask = 1'h0;
  assign data_mem_1_1__T_165_en = ic_b_sb_wren_0[1] & ic_bank_way_clken_0[1];
  assign data_mem_1_1__T_178_data = _T_31 ? io_ic_debug_wr_data : io_ic_wr_data_1;
  assign data_mem_1_1__T_178_addr = ic_rw_addr_q[11:3];
  assign data_mem_1_1__T_178_mask = 1'h1;
  assign data_mem_1_1__T_178_en = ic_b_sb_wren_1[1] & ic_bank_way_clken_1[1];
  assign io_ic_rd_data = _T_300 | _T_301; // @[el2_ifu_ic_mem.scala 40:17 el2_ifu_ic_mem.scala 107:17]
  assign io_ic_debug_rd_data = _T_310 | _T_311; // @[el2_ifu_ic_mem.scala 39:23 el2_ifu_ic_mem.scala 108:23]
  assign io_ictag_debug_rd_data = 26'h0; // @[el2_ifu_ic_mem.scala 38:26]
  assign io_ic_eccerr = {_T_1218,_T_776}; // @[el2_ifu_ic_mem.scala 37:16 el2_ifu_ic_mem.scala 115:16]
  assign io_ic_parerr = {_T_1255,_T_1259}; // @[el2_ifu_ic_mem.scala 36:16 el2_ifu_ic_mem.scala 119:16]
  assign io_ic_rd_hit = 2'h0; // @[el2_ifu_ic_mem.scala 35:16]
  assign io_ic_tag_perr = 1'h0; // @[el2_ifu_ic_mem.scala 34:18]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  ic_b_rden_ff = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  ic_rw_addr_ff = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  ic_debug_rd_way_en_ff = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  ic_debug_rd_en_ff = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(data_mem_0_0__T_139_en & data_mem_0_0__T_139_mask) begin
      data_mem_0_0[data_mem_0_0__T_139_addr] <= data_mem_0_0__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_0__T_152_en & data_mem_0_0__T_152_mask) begin
      data_mem_0_0[data_mem_0_0__T_152_addr] <= data_mem_0_0__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_0__T_165_en & data_mem_0_0__T_165_mask) begin
      data_mem_0_0[data_mem_0_0__T_165_addr] <= data_mem_0_0__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_0__T_178_en & data_mem_0_0__T_178_mask) begin
      data_mem_0_0[data_mem_0_0__T_178_addr] <= data_mem_0_0__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_1__T_139_en & data_mem_0_1__T_139_mask) begin
      data_mem_0_1[data_mem_0_1__T_139_addr] <= data_mem_0_1__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_1__T_152_en & data_mem_0_1__T_152_mask) begin
      data_mem_0_1[data_mem_0_1__T_152_addr] <= data_mem_0_1__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_1__T_165_en & data_mem_0_1__T_165_mask) begin
      data_mem_0_1[data_mem_0_1__T_165_addr] <= data_mem_0_1__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_0_1__T_178_en & data_mem_0_1__T_178_mask) begin
      data_mem_0_1[data_mem_0_1__T_178_addr] <= data_mem_0_1__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_0__T_139_en & data_mem_1_0__T_139_mask) begin
      data_mem_1_0[data_mem_1_0__T_139_addr] <= data_mem_1_0__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_0__T_152_en & data_mem_1_0__T_152_mask) begin
      data_mem_1_0[data_mem_1_0__T_152_addr] <= data_mem_1_0__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_0__T_165_en & data_mem_1_0__T_165_mask) begin
      data_mem_1_0[data_mem_1_0__T_165_addr] <= data_mem_1_0__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_0__T_178_en & data_mem_1_0__T_178_mask) begin
      data_mem_1_0[data_mem_1_0__T_178_addr] <= data_mem_1_0__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_1__T_139_en & data_mem_1_1__T_139_mask) begin
      data_mem_1_1[data_mem_1_1__T_139_addr] <= data_mem_1_1__T_139_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_1__T_152_en & data_mem_1_1__T_152_mask) begin
      data_mem_1_1[data_mem_1_1__T_152_addr] <= data_mem_1_1__T_152_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_1__T_165_en & data_mem_1_1__T_165_mask) begin
      data_mem_1_1[data_mem_1_1__T_165_addr] <= data_mem_1_1__T_165_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if(data_mem_1_1__T_178_en & data_mem_1_1__T_178_mask) begin
      data_mem_1_1[data_mem_1_1__T_178_addr] <= data_mem_1_1__T_178_data; // @[el2_ifu_ic_mem.scala 82:21]
    end
    if (reset) begin
      ic_b_rden_ff <= 2'h0;
    end else begin
      ic_b_rden_ff <= ic_b_rden;
    end
    if (reset) begin
      ic_rw_addr_ff <= 5'h0;
    end else begin
      ic_rw_addr_ff <= ic_rw_addr_q[4:0];
    end
    if (reset) begin
      ic_debug_rd_way_en_ff <= 2'h0;
    end else begin
      ic_debug_rd_way_en_ff <= ic_debug_rd_way_en;
    end
    if (reset) begin
      ic_debug_rd_en_ff <= 1'h0;
    end else begin
      ic_debug_rd_en_ff <= io_ic_debug_rd_en;
    end
  end
endmodule
