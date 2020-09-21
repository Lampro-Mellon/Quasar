module EL2_IC_DATA(
  input         clock,
  input         reset,
  input         io_rst_l,
  input         io_clk_override,
  input  [12:0] io_ic_rw_addr,
  input  [1:0]  io_ic_wr_en,
  input         io_ic_rd_en,
  input  [70:0] io_ic_wr_data_0,
  input  [70:0] io_ic_wr_data_1,
  output [63:0] io_ic_rd_data,
  input  [70:0] io_ic_debug_wr_data,
  output [70:0] io_ic_debug_rd_data,
  output [1:0]  io_ic_parerr,
  output [1:0]  io_ic_eccerr,
  input  [12:0] io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  input  [63:0] io_ic_premux_data,
  input         io_ic_sel_premux_data,
  input  [1:0]  io_ic_rd_hit,
  input         io_scan_mode,
  output        io_test_port2,
  output [70:0] io_test_port_0_0,
  output [70:0] io_test_port_0_1,
  output [70:0] io_test_port_1_0,
  output [70:0] io_test_port_1_1
);
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
  reg [95:0] _RAND_5;
  reg [95:0] _RAND_10;
  reg [95:0] _RAND_15;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  reg [70:0] data_mem_0_0 [0:511]; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_137_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_137_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_144_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_144_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_151_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_151_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_158_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_158_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_130_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_130_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_130_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_135_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_135_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_135_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_142_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_142_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_142_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_149_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_149_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_149_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_0__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_0__T_156_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_156_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_0__T_156_en; // @[el2_ifu_ic_mem.scala 245:29]
  reg [8:0] data_mem_0_0__T_137_addr_pipe_0;
  reg [8:0] data_mem_0_0__T_144_addr_pipe_0;
  reg [8:0] data_mem_0_0__T_151_addr_pipe_0;
  reg [8:0] data_mem_0_0__T_158_addr_pipe_0;
  reg [70:0] data_mem_0_1 [0:511]; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_137_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_137_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_144_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_144_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_151_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_151_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_158_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_158_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_130_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_130_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_130_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_135_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_135_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_135_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_142_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_142_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_142_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_149_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_149_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_149_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_0_1__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_0_1__T_156_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_156_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_0_1__T_156_en; // @[el2_ifu_ic_mem.scala 245:29]
  reg [8:0] data_mem_0_1__T_137_addr_pipe_0;
  reg [8:0] data_mem_0_1__T_144_addr_pipe_0;
  reg [8:0] data_mem_0_1__T_151_addr_pipe_0;
  reg [8:0] data_mem_0_1__T_158_addr_pipe_0;
  reg [70:0] data_mem_1_0 [0:511]; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_137_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_137_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_144_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_144_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_151_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_151_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_158_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_158_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_130_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_130_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_130_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_135_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_135_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_135_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_142_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_142_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_142_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_149_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_149_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_149_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_0__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_0__T_156_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_156_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_0__T_156_en; // @[el2_ifu_ic_mem.scala 245:29]
  reg [8:0] data_mem_1_0__T_137_addr_pipe_0;
  reg [8:0] data_mem_1_0__T_144_addr_pipe_0;
  reg [8:0] data_mem_1_0__T_151_addr_pipe_0;
  reg [8:0] data_mem_1_0__T_158_addr_pipe_0;
  reg [70:0] data_mem_1_1 [0:511]; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_137_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_137_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_144_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_144_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_151_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_151_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_158_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_158_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_130_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_130_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_130_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_135_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_135_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_135_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_142_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_142_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_142_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_149_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_149_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_149_en; // @[el2_ifu_ic_mem.scala 245:29]
  wire [70:0] data_mem_1_1__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
  wire [8:0] data_mem_1_1__T_156_addr; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_156_mask; // @[el2_ifu_ic_mem.scala 245:29]
  wire  data_mem_1_1__T_156_en; // @[el2_ifu_ic_mem.scala 245:29]
  reg [8:0] data_mem_1_1__T_137_addr_pipe_0;
  reg [8:0] data_mem_1_1__T_144_addr_pipe_0;
  reg [8:0] data_mem_1_1__T_151_addr_pipe_0;
  reg [8:0] data_mem_1_1__T_158_addr_pipe_0;
  wire  _T = ~io_ic_debug_tag_array; // @[el2_ifu_ic_mem.scala 210:70]
  wire  _T_1 = io_ic_debug_rd_en & _T; // @[el2_ifu_ic_mem.scala 210:68]
  wire [1:0] _T_3 = {_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [1:0] ic_debug_rd_way_en = _T_3 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 210:94]
  wire  _T_5 = io_ic_debug_wr_en & _T; // @[el2_ifu_ic_mem.scala 211:68]
  wire [1:0] _T_7 = {_T_5,_T_5}; // @[Cat.scala 29:58]
  wire [1:0] ic_debug_wr_way_en = _T_7 & io_ic_debug_way; // @[el2_ifu_ic_mem.scala 211:94]
  wire  _T_9 = ~io_ic_debug_addr[3]; // @[el2_ifu_ic_mem.scala 213:107]
  wire [1:0] _T_11 = {_T_9,_T_9}; // @[Cat.scala 29:58]
  wire [1:0] _T_12 = ic_debug_wr_way_en & _T_11; // @[el2_ifu_ic_mem.scala 213:36]
  wire [1:0] _T_13 = io_ic_wr_en | _T_12; // @[el2_ifu_ic_mem.scala 213:16]
  wire [1:0] _T_17 = {io_ic_debug_addr[3],io_ic_debug_addr[3]}; // @[Cat.scala 29:58]
  wire [1:0] _T_18 = ic_debug_wr_way_en & _T_17; // @[el2_ifu_ic_mem.scala 213:36]
  wire [1:0] _T_19 = io_ic_wr_en | _T_18; // @[el2_ifu_ic_mem.scala 213:16]
  wire  _T_23 = _T_9 & io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 215:66]
  wire [70:0] _T_25 = _T_23 ? io_ic_debug_wr_data : io_ic_wr_data_0; // @[el2_ifu_ic_mem.scala 215:8]
  wire  _T_28 = io_ic_debug_addr[3] & io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 215:66]
  wire [70:0] _T_30 = _T_28 ? io_ic_debug_wr_data : io_ic_wr_data_1; // @[el2_ifu_ic_mem.scala 215:8]
  wire  _T_32 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 216:49]
  wire [11:0] _T_35 = {io_ic_debug_addr[12:3],2'h0}; // @[Cat.scala 29:58]
  wire [11:0] _T_37 = _T_32 ? _T_35 : io_ic_rw_addr[12:1]; // @[el2_ifu_ic_mem.scala 216:29]
  wire [12:0] ic_rw_addr_q = {_T_37,1'h0}; // @[Cat.scala 29:58]
  wire  _T_38 = io_ic_rd_en | io_ic_debug_rd_en; // @[el2_ifu_ic_mem.scala 217:44]
  wire  _T_39 = |io_ic_wr_en; // @[el2_ifu_ic_mem.scala 217:82]
  wire  _T_40 = ~_T_39; // @[el2_ifu_ic_mem.scala 217:68]
  wire  ic_rd_en_with_debug = _T_38 & _T_40; // @[el2_ifu_ic_mem.scala 217:66]
  wire  _T_43 = ~ic_rw_addr_q[3]; // @[el2_ifu_ic_mem.scala 219:15]
  wire  _T_47 = ic_rw_addr_q[2:1] == 2'h3; // @[el2_ifu_ic_mem.scala 220:55]
  wire  _T_48 = ic_rw_addr_q[3] & _T_47; // @[el2_ifu_ic_mem.scala 220:36]
  wire  _T_58 = _T_43 & _T_47; // @[el2_ifu_ic_mem.scala 222:37]
  wire  _T_95 = ic_rw_addr_q[3] | _T_58; // @[Mux.scala 27:72]
  wire  ic_b_rden_0 = _T_95 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 222:107]
  wire [1:0] _T_99 = {ic_b_rden_0,ic_b_rden_0}; // @[Cat.scala 29:58]
  wire [1:0] _GEN_24 = {{1'd0}, io_clk_override}; // @[el2_ifu_ic_mem.scala 225:62]
  wire [1:0] _T_100 = _T_99 | _GEN_24; // @[el2_ifu_ic_mem.scala 225:62]
  wire [1:0] _T_101 = _T_100 | _T_19; // @[el2_ifu_ic_mem.scala 225:80]
  wire [1:0] _T_105 = _T_100 | _T_13; // @[el2_ifu_ic_mem.scala 227:82]
  wire [1:0] _T_106 = _T_105 | _T_101; // @[el2_ifu_ic_mem.scala 227:101]
  wire [8:0] ic_rw_addr_q_inc = ic_rw_addr_q[12:4] + 9'h1; // @[el2_ifu_ic_mem.scala 230:77]
  wire  _T_113 = _T_48 & ic_rd_en_with_debug; // @[el2_ifu_ic_mem.scala 231:82]
  wire  ic_rw_addr_wrap = _T_113 & _T_40; // @[el2_ifu_ic_mem.scala 231:104]
  reg [12:0] ic_rw_addr_ff; // @[el2_ifu_ic_mem.scala 234:30]
  reg [1:0] ic_debug_rd_way_en_ff; // @[el2_ifu_ic_mem.scala 236:38]
  reg  ic_debug_rd_en_ff; // @[el2_ifu_ic_mem.scala 237:34]
  wire  _T_122 = ~ic_rw_addr_wrap; // @[el2_ifu_ic_mem.scala 241:31]
  wire [8:0] _T_126 = {ic_rw_addr_q[12:6],ic_rw_addr_q_inc[5:4]}; // @[Cat.scala 29:58]
  wire [8:0] _T_127 = _T_122 ? ic_rw_addr_q[12:4] : _T_126; // @[el2_ifu_ic_mem.scala 241:30]
  wire [12:0] ic_rw_addr_bank_q_0 = {{4'd0}, _T_127}; // @[el2_ifu_ic_mem.scala 240:31 el2_ifu_ic_mem.scala 241:24]
  wire [12:0] ic_rw_addr_bank_q_1 = {{4'd0}, ic_rw_addr_q[12:4]}; // @[el2_ifu_ic_mem.scala 240:31 el2_ifu_ic_mem.scala 242:24]
  wire  _T_160 = ~ic_rw_addr_ff[3]; // @[el2_ifu_ic_mem.scala 259:71]
  wire [9:0] _T_170 = {_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [18:0] _T_179 = {_T_170,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [27:0] _T_188 = {_T_179,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [36:0] _T_197 = {_T_188,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [45:0] _T_206 = {_T_197,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [54:0] _T_215 = {_T_206,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [63:0] _T_224 = {_T_215,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [70:0] _T_231 = {_T_224,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160,_T_160}; // @[Cat.scala 29:58]
  wire [70:0] wb_dout_0_0 = data_mem_0_0__T_137_data; // @[el2_ifu_ic_mem.scala 247:21 el2_ifu_ic_mem.scala 250:19 el2_ifu_ic_mem.scala 254:19]
  wire [70:0] _T_232 = _T_231 & wb_dout_0_0; // @[el2_ifu_ic_mem.scala 259:78]
  wire [9:0] _T_244 = {ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [18:0] _T_253 = {_T_244,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [27:0] _T_262 = {_T_253,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [36:0] _T_271 = {_T_262,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [45:0] _T_280 = {_T_271,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [54:0] _T_289 = {_T_280,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [63:0] _T_298 = {_T_289,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [70:0] _T_305 = {_T_298,ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3],ic_rw_addr_ff[3]}; // @[Cat.scala 29:58]
  wire [70:0] wb_dout_0_1 = data_mem_0_1__T_144_data; // @[el2_ifu_ic_mem.scala 247:21 el2_ifu_ic_mem.scala 250:19 el2_ifu_ic_mem.scala 254:19]
  wire [70:0] _T_306 = _T_305 & wb_dout_0_1; // @[el2_ifu_ic_mem.scala 259:78]
  wire [70:0] wb_dout_way_pre_lower_0 = _T_232 | _T_306; // @[el2_ifu_ic_mem.scala 259:102]
  wire [70:0] wb_dout_1_0 = data_mem_1_0__T_151_data; // @[el2_ifu_ic_mem.scala 247:21 el2_ifu_ic_mem.scala 250:19 el2_ifu_ic_mem.scala 254:19]
  wire [70:0] _T_380 = _T_231 & wb_dout_1_0; // @[el2_ifu_ic_mem.scala 259:78]
  wire [70:0] wb_dout_1_1 = data_mem_1_1__T_158_data; // @[el2_ifu_ic_mem.scala 247:21 el2_ifu_ic_mem.scala 250:19 el2_ifu_ic_mem.scala 254:19]
  wire [70:0] _T_454 = _T_305 & wb_dout_1_1; // @[el2_ifu_ic_mem.scala 259:78]
  wire [70:0] wb_dout_way_pre_lower_1 = _T_380 | _T_454; // @[el2_ifu_ic_mem.scala 259:102]
  wire  _T_457 = 1'h0 - 1'h1; // @[el2_ifu_ic_mem.scala 263:77]
  wire  _T_458 = ic_rw_addr_ff[3] == _T_457; // @[el2_ifu_ic_mem.scala 263:71]
  wire [9:0] _T_468 = {_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [18:0] _T_477 = {_T_468,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [27:0] _T_486 = {_T_477,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [36:0] _T_495 = {_T_486,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [45:0] _T_504 = {_T_495,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [54:0] _T_513 = {_T_504,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [63:0] _T_522 = {_T_513,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [70:0] _T_529 = {_T_522,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458,_T_458}; // @[Cat.scala 29:58]
  wire [70:0] _T_530 = _T_529 & wb_dout_0_0; // @[el2_ifu_ic_mem.scala 263:82]
  wire [70:0] _T_606 = _T_231 & wb_dout_0_1; // @[el2_ifu_ic_mem.scala 263:82]
  wire [70:0] wb_dout_way_pre_upper_0 = _T_530 | _T_606; // @[el2_ifu_ic_mem.scala 263:106]
  wire [70:0] _T_682 = _T_529 & wb_dout_1_0; // @[el2_ifu_ic_mem.scala 263:82]
  wire [70:0] _T_758 = _T_231 & wb_dout_1_1; // @[el2_ifu_ic_mem.scala 263:82]
  wire [70:0] wb_dout_way_pre_upper_1 = _T_682 | _T_758; // @[el2_ifu_ic_mem.scala 263:106]
  wire [141:0] wb_dout_way_pre_0 = {wb_dout_way_pre_upper_0,wb_dout_way_pre_lower_0}; // @[Cat.scala 29:58]
  wire [141:0] wb_dout_way_pre_1 = {wb_dout_way_pre_upper_1,wb_dout_way_pre_lower_1}; // @[Cat.scala 29:58]
  wire  _T_760 = ic_rw_addr_ff[2:1] == 2'h0; // @[el2_ifu_ic_mem.scala 269:36]
  wire [9:0] _T_770 = {_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [18:0] _T_779 = {_T_770,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [27:0] _T_788 = {_T_779,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [36:0] _T_797 = {_T_788,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [45:0] _T_806 = {_T_797,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [54:0] _T_815 = {_T_806,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [63:0] _T_824 = {_T_815,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760,_T_760}; // @[Cat.scala 29:58]
  wire [63:0] _T_826 = _T_824 & wb_dout_way_pre_0[63:0]; // @[el2_ifu_ic_mem.scala 269:44]
  wire  _T_828 = ic_rw_addr_ff[2:1] == 2'h1; // @[el2_ifu_ic_mem.scala 270:36]
  wire [9:0] _T_838 = {_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [18:0] _T_847 = {_T_838,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [27:0] _T_856 = {_T_847,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [36:0] _T_865 = {_T_856,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [45:0] _T_874 = {_T_865,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [54:0] _T_883 = {_T_874,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [63:0] _T_892 = {_T_883,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828,_T_828}; // @[Cat.scala 29:58]
  wire [63:0] _T_895 = {wb_dout_way_pre_0[86:71],wb_dout_way_pre_0[63:16]}; // @[Cat.scala 29:58]
  wire [63:0] _T_896 = _T_892 & _T_895; // @[el2_ifu_ic_mem.scala 270:44]
  wire [63:0] _T_897 = _T_826 | _T_896; // @[el2_ifu_ic_mem.scala 269:71]
  wire  _T_899 = ic_rw_addr_ff[2:1] == 2'h2; // @[el2_ifu_ic_mem.scala 271:36]
  wire [9:0] _T_909 = {_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [18:0] _T_918 = {_T_909,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [27:0] _T_927 = {_T_918,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [36:0] _T_936 = {_T_927,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [45:0] _T_945 = {_T_936,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [54:0] _T_954 = {_T_945,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [63:0] _T_963 = {_T_954,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899,_T_899}; // @[Cat.scala 29:58]
  wire [63:0] _T_966 = {wb_dout_way_pre_0[102:71],wb_dout_way_pre_0[63:32]}; // @[Cat.scala 29:58]
  wire [63:0] _T_967 = _T_963 & _T_966; // @[el2_ifu_ic_mem.scala 271:44]
  wire [63:0] _T_968 = _T_897 | _T_967; // @[el2_ifu_ic_mem.scala 270:122]
  wire  _T_970 = ic_rw_addr_ff[2:1] == 2'h3; // @[el2_ifu_ic_mem.scala 272:36]
  wire [9:0] _T_980 = {_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [18:0] _T_989 = {_T_980,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [27:0] _T_998 = {_T_989,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [36:0] _T_1007 = {_T_998,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [45:0] _T_1016 = {_T_1007,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [54:0] _T_1025 = {_T_1016,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [63:0] _T_1034 = {_T_1025,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970,_T_970}; // @[Cat.scala 29:58]
  wire [63:0] _T_1037 = {wb_dout_way_pre_0[118:71],wb_dout_way_pre_0[63:48]}; // @[Cat.scala 29:58]
  wire [63:0] _T_1038 = _T_1034 & _T_1037; // @[el2_ifu_ic_mem.scala 272:44]
  wire [63:0] wb_dout_way_0 = _T_968 | _T_1038; // @[el2_ifu_ic_mem.scala 271:122]
  wire [63:0] _T_1106 = _T_824 & wb_dout_way_pre_1[63:0]; // @[el2_ifu_ic_mem.scala 269:44]
  wire [63:0] _T_1175 = {wb_dout_way_pre_1[86:71],wb_dout_way_pre_1[63:16]}; // @[Cat.scala 29:58]
  wire [63:0] _T_1176 = _T_892 & _T_1175; // @[el2_ifu_ic_mem.scala 270:44]
  wire [63:0] _T_1177 = _T_1106 | _T_1176; // @[el2_ifu_ic_mem.scala 269:71]
  wire [63:0] _T_1246 = {wb_dout_way_pre_1[102:71],wb_dout_way_pre_1[63:32]}; // @[Cat.scala 29:58]
  wire [63:0] _T_1247 = _T_963 & _T_1246; // @[el2_ifu_ic_mem.scala 271:44]
  wire [63:0] _T_1248 = _T_1177 | _T_1247; // @[el2_ifu_ic_mem.scala 270:122]
  wire [63:0] _T_1317 = {wb_dout_way_pre_1[118:71],wb_dout_way_pre_1[63:48]}; // @[Cat.scala 29:58]
  wire [63:0] _T_1318 = _T_1034 & _T_1317; // @[el2_ifu_ic_mem.scala 272:44]
  wire [63:0] wb_dout_way_1 = _T_1248 | _T_1318; // @[el2_ifu_ic_mem.scala 271:122]
  wire [1:0] ic_rd_hit_q = ic_debug_rd_en_ff ? ic_debug_rd_way_en_ff : io_ic_rd_hit; // @[el2_ifu_ic_mem.scala 275:24]
  wire [63:0] wb_dout_way_with_premux_0 = io_ic_sel_premux_data ? io_ic_premux_data : wb_dout_way_0; // @[el2_ifu_ic_mem.scala 276:52]
  wire [63:0] wb_dout_way_with_premux_1 = io_ic_sel_premux_data ? io_ic_premux_data : wb_dout_way_1; // @[el2_ifu_ic_mem.scala 276:52]
  wire  _T_1321 = ic_rd_hit_q[0] | io_ic_sel_premux_data; // @[el2_ifu_ic_mem.scala 282:79]
  wire  _T_1323 = ic_rd_hit_q[1] | io_ic_sel_premux_data; // @[el2_ifu_ic_mem.scala 282:79]
  wire [9:0] _T_1333 = {_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [18:0] _T_1342 = {_T_1333,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [27:0] _T_1351 = {_T_1342,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [36:0] _T_1360 = {_T_1351,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [45:0] _T_1369 = {_T_1360,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [54:0] _T_1378 = {_T_1369,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [63:0] _T_1387 = {_T_1378,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321,_T_1321}; // @[Cat.scala 29:58]
  wire [63:0] _T_1388 = _T_1387 & wb_dout_way_with_premux_0; // @[el2_lib.scala 189:94]
  wire [9:0] _T_1398 = {_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [18:0] _T_1407 = {_T_1398,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [27:0] _T_1416 = {_T_1407,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [36:0] _T_1425 = {_T_1416,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [45:0] _T_1434 = {_T_1425,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [54:0] _T_1443 = {_T_1434,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [63:0] _T_1452 = {_T_1443,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323,_T_1323}; // @[Cat.scala 29:58]
  wire [63:0] _T_1453 = _T_1452 & wb_dout_way_with_premux_1; // @[el2_lib.scala 189:94]
  wire [9:0] _T_1468 = {ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [18:0] _T_1477 = {_T_1468,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [27:0] _T_1486 = {_T_1477,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [36:0] _T_1495 = {_T_1486,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [45:0] _T_1504 = {_T_1495,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [54:0] _T_1513 = {_T_1504,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_1522 = {_T_1513,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [70:0] _T_1529 = {_T_1522,ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0],ic_rd_hit_q[0]}; // @[Cat.scala 29:58]
  wire [70:0] _T_1530 = _T_1529 & wb_dout_way_pre_0[70:0]; // @[el2_lib.scala 189:94]
  wire [9:0] _T_1540 = {ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [18:0] _T_1549 = {_T_1540,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [27:0] _T_1558 = {_T_1549,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [36:0] _T_1567 = {_T_1558,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [45:0] _T_1576 = {_T_1567,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [54:0] _T_1585 = {_T_1576,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [63:0] _T_1594 = {_T_1585,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [70:0] _T_1601 = {_T_1594,ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1],ic_rd_hit_q[1]}; // @[Cat.scala 29:58]
  wire [70:0] _T_1602 = _T_1601 & wb_dout_way_pre_1[70:0]; // @[el2_lib.scala 189:94]
  assign data_mem_0_0__T_137_addr = data_mem_0_0__T_137_addr_pipe_0;
  assign data_mem_0_0__T_137_data = data_mem_0_0[data_mem_0_0__T_137_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_0__T_144_addr = data_mem_0_0__T_144_addr_pipe_0;
  assign data_mem_0_0__T_144_data = data_mem_0_0[data_mem_0_0__T_144_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_0__T_151_addr = data_mem_0_0__T_151_addr_pipe_0;
  assign data_mem_0_0__T_151_data = data_mem_0_0[data_mem_0_0__T_151_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_0__T_158_addr = data_mem_0_0__T_158_addr_pipe_0;
  assign data_mem_0_0__T_158_data = data_mem_0_0[data_mem_0_0__T_158_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_0__T_130_data = _T_28 ? io_ic_debug_wr_data : io_ic_wr_data_1;
  assign data_mem_0_0__T_130_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_0_0__T_130_mask = 1'h1;
  assign data_mem_0_0__T_130_en = 1'h1;
  assign data_mem_0_0__T_135_data = _T_28 ? io_ic_debug_wr_data : io_ic_wr_data_1;
  assign data_mem_0_0__T_135_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_0_0__T_135_mask = 1'h1;
  assign data_mem_0_0__T_135_en = _T_30[0] & _T_101[0];
  assign data_mem_0_0__T_142_data = 71'h0;
  assign data_mem_0_0__T_142_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_0_0__T_142_mask = 1'h0;
  assign data_mem_0_0__T_142_en = _T_30[1] & _T_101[1];
  assign data_mem_0_0__T_149_data = 71'h0;
  assign data_mem_0_0__T_149_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_0_0__T_149_mask = 1'h0;
  assign data_mem_0_0__T_149_en = _T_25[0] & _T_106[0];
  assign data_mem_0_0__T_156_data = 71'h0;
  assign data_mem_0_0__T_156_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_0_0__T_156_mask = 1'h0;
  assign data_mem_0_0__T_156_en = _T_25[1] & _T_106[1];
  assign data_mem_0_1__T_137_addr = data_mem_0_1__T_137_addr_pipe_0;
  assign data_mem_0_1__T_137_data = data_mem_0_1[data_mem_0_1__T_137_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_1__T_144_addr = data_mem_0_1__T_144_addr_pipe_0;
  assign data_mem_0_1__T_144_data = data_mem_0_1[data_mem_0_1__T_144_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_1__T_151_addr = data_mem_0_1__T_151_addr_pipe_0;
  assign data_mem_0_1__T_151_data = data_mem_0_1[data_mem_0_1__T_151_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_1__T_158_addr = data_mem_0_1__T_158_addr_pipe_0;
  assign data_mem_0_1__T_158_data = data_mem_0_1[data_mem_0_1__T_158_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_0_1__T_130_data = 71'h0;
  assign data_mem_0_1__T_130_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_0_1__T_130_mask = 1'h0;
  assign data_mem_0_1__T_130_en = 1'h1;
  assign data_mem_0_1__T_135_data = 71'h0;
  assign data_mem_0_1__T_135_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_0_1__T_135_mask = 1'h0;
  assign data_mem_0_1__T_135_en = _T_30[0] & _T_101[0];
  assign data_mem_0_1__T_142_data = 71'h0;
  assign data_mem_0_1__T_142_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_0_1__T_142_mask = 1'h0;
  assign data_mem_0_1__T_142_en = _T_30[1] & _T_101[1];
  assign data_mem_0_1__T_149_data = _T_28 ? io_ic_debug_wr_data : io_ic_wr_data_1;
  assign data_mem_0_1__T_149_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_0_1__T_149_mask = 1'h1;
  assign data_mem_0_1__T_149_en = _T_25[0] & _T_106[0];
  assign data_mem_0_1__T_156_data = 71'h0;
  assign data_mem_0_1__T_156_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_0_1__T_156_mask = 1'h0;
  assign data_mem_0_1__T_156_en = _T_25[1] & _T_106[1];
  assign data_mem_1_0__T_137_addr = data_mem_1_0__T_137_addr_pipe_0;
  assign data_mem_1_0__T_137_data = data_mem_1_0[data_mem_1_0__T_137_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_0__T_144_addr = data_mem_1_0__T_144_addr_pipe_0;
  assign data_mem_1_0__T_144_data = data_mem_1_0[data_mem_1_0__T_144_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_0__T_151_addr = data_mem_1_0__T_151_addr_pipe_0;
  assign data_mem_1_0__T_151_data = data_mem_1_0[data_mem_1_0__T_151_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_0__T_158_addr = data_mem_1_0__T_158_addr_pipe_0;
  assign data_mem_1_0__T_158_data = data_mem_1_0[data_mem_1_0__T_158_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_0__T_130_data = 71'h0;
  assign data_mem_1_0__T_130_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_1_0__T_130_mask = 1'h0;
  assign data_mem_1_0__T_130_en = 1'h1;
  assign data_mem_1_0__T_135_data = 71'h0;
  assign data_mem_1_0__T_135_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_1_0__T_135_mask = 1'h0;
  assign data_mem_1_0__T_135_en = _T_30[0] & _T_101[0];
  assign data_mem_1_0__T_142_data = _T_23 ? io_ic_debug_wr_data : io_ic_wr_data_0;
  assign data_mem_1_0__T_142_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_1_0__T_142_mask = 1'h1;
  assign data_mem_1_0__T_142_en = _T_30[1] & _T_101[1];
  assign data_mem_1_0__T_149_data = 71'h0;
  assign data_mem_1_0__T_149_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_1_0__T_149_mask = 1'h0;
  assign data_mem_1_0__T_149_en = _T_25[0] & _T_106[0];
  assign data_mem_1_0__T_156_data = 71'h0;
  assign data_mem_1_0__T_156_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_1_0__T_156_mask = 1'h0;
  assign data_mem_1_0__T_156_en = _T_25[1] & _T_106[1];
  assign data_mem_1_1__T_137_addr = data_mem_1_1__T_137_addr_pipe_0;
  assign data_mem_1_1__T_137_data = data_mem_1_1[data_mem_1_1__T_137_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_1__T_144_addr = data_mem_1_1__T_144_addr_pipe_0;
  assign data_mem_1_1__T_144_data = data_mem_1_1[data_mem_1_1__T_144_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_1__T_151_addr = data_mem_1_1__T_151_addr_pipe_0;
  assign data_mem_1_1__T_151_data = data_mem_1_1[data_mem_1_1__T_151_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_1__T_158_addr = data_mem_1_1__T_158_addr_pipe_0;
  assign data_mem_1_1__T_158_data = data_mem_1_1[data_mem_1_1__T_158_addr]; // @[el2_ifu_ic_mem.scala 245:29]
  assign data_mem_1_1__T_130_data = 71'h0;
  assign data_mem_1_1__T_130_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_1_1__T_130_mask = 1'h0;
  assign data_mem_1_1__T_130_en = 1'h1;
  assign data_mem_1_1__T_135_data = 71'h0;
  assign data_mem_1_1__T_135_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_1_1__T_135_mask = 1'h0;
  assign data_mem_1_1__T_135_en = _T_30[0] & _T_101[0];
  assign data_mem_1_1__T_142_data = 71'h0;
  assign data_mem_1_1__T_142_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_1_1__T_142_mask = 1'h0;
  assign data_mem_1_1__T_142_en = _T_30[1] & _T_101[1];
  assign data_mem_1_1__T_149_data = 71'h0;
  assign data_mem_1_1__T_149_addr = ic_rw_addr_bank_q_0[12:4];
  assign data_mem_1_1__T_149_mask = 1'h0;
  assign data_mem_1_1__T_149_en = _T_25[0] & _T_106[0];
  assign data_mem_1_1__T_156_data = _T_23 ? io_ic_debug_wr_data : io_ic_wr_data_0;
  assign data_mem_1_1__T_156_addr = ic_rw_addr_bank_q_1[12:4];
  assign data_mem_1_1__T_156_mask = 1'h1;
  assign data_mem_1_1__T_156_en = _T_25[1] & _T_106[1];
  assign io_ic_rd_data = _T_1388 | _T_1453; // @[el2_ifu_ic_mem.scala 282:17]
  assign io_ic_debug_rd_data = _T_1530 | _T_1602; // @[el2_ifu_ic_mem.scala 278:23 el2_ifu_ic_mem.scala 284:23]
  assign io_ic_parerr = 2'h0; // @[el2_ifu_ic_mem.scala 279:16]
  assign io_ic_eccerr = 2'h0; // @[el2_ifu_ic_mem.scala 280:16]
  assign io_test_port2 = 1'h0; // @[el2_ifu_ic_mem.scala 288:17]
  assign io_test_port_0_0 = data_mem_0_0__T_137_data; // @[el2_ifu_ic_mem.scala 289:16]
  assign io_test_port_0_1 = data_mem_0_1__T_144_data; // @[el2_ifu_ic_mem.scala 289:16]
  assign io_test_port_1_0 = data_mem_1_0__T_151_data; // @[el2_ifu_ic_mem.scala 289:16]
  assign io_test_port_1_1 = data_mem_1_1__T_158_data; // @[el2_ifu_ic_mem.scala 289:16]
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
  _RAND_5 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_0_1[initvar] = _RAND_5[70:0];
  _RAND_10 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_1_0[initvar] = _RAND_10[70:0];
  _RAND_15 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem_1_1[initvar] = _RAND_15[70:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  data_mem_0_0__T_137_addr_pipe_0 = _RAND_1[8:0];
  _RAND_2 = {1{`RANDOM}};
  data_mem_0_0__T_144_addr_pipe_0 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  data_mem_0_0__T_151_addr_pipe_0 = _RAND_3[8:0];
  _RAND_4 = {1{`RANDOM}};
  data_mem_0_0__T_158_addr_pipe_0 = _RAND_4[8:0];
  _RAND_6 = {1{`RANDOM}};
  data_mem_0_1__T_137_addr_pipe_0 = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  data_mem_0_1__T_144_addr_pipe_0 = _RAND_7[8:0];
  _RAND_8 = {1{`RANDOM}};
  data_mem_0_1__T_151_addr_pipe_0 = _RAND_8[8:0];
  _RAND_9 = {1{`RANDOM}};
  data_mem_0_1__T_158_addr_pipe_0 = _RAND_9[8:0];
  _RAND_11 = {1{`RANDOM}};
  data_mem_1_0__T_137_addr_pipe_0 = _RAND_11[8:0];
  _RAND_12 = {1{`RANDOM}};
  data_mem_1_0__T_144_addr_pipe_0 = _RAND_12[8:0];
  _RAND_13 = {1{`RANDOM}};
  data_mem_1_0__T_151_addr_pipe_0 = _RAND_13[8:0];
  _RAND_14 = {1{`RANDOM}};
  data_mem_1_0__T_158_addr_pipe_0 = _RAND_14[8:0];
  _RAND_16 = {1{`RANDOM}};
  data_mem_1_1__T_137_addr_pipe_0 = _RAND_16[8:0];
  _RAND_17 = {1{`RANDOM}};
  data_mem_1_1__T_144_addr_pipe_0 = _RAND_17[8:0];
  _RAND_18 = {1{`RANDOM}};
  data_mem_1_1__T_151_addr_pipe_0 = _RAND_18[8:0];
  _RAND_19 = {1{`RANDOM}};
  data_mem_1_1__T_158_addr_pipe_0 = _RAND_19[8:0];
  _RAND_20 = {1{`RANDOM}};
  ic_rw_addr_ff = _RAND_20[12:0];
  _RAND_21 = {1{`RANDOM}};
  ic_debug_rd_way_en_ff = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  ic_debug_rd_en_ff = _RAND_22[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(data_mem_0_0__T_130_en & data_mem_0_0__T_130_mask) begin
      data_mem_0_0[data_mem_0_0__T_130_addr] <= data_mem_0_0__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_0__T_135_en & data_mem_0_0__T_135_mask) begin
      data_mem_0_0[data_mem_0_0__T_135_addr] <= data_mem_0_0__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_0__T_142_en & data_mem_0_0__T_142_mask) begin
      data_mem_0_0[data_mem_0_0__T_142_addr] <= data_mem_0_0__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_0__T_149_en & data_mem_0_0__T_149_mask) begin
      data_mem_0_0[data_mem_0_0__T_149_addr] <= data_mem_0_0__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_0__T_156_en & data_mem_0_0__T_156_mask) begin
      data_mem_0_0[data_mem_0_0__T_156_addr] <= data_mem_0_0__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    data_mem_0_0__T_137_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_0_0__T_144_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    data_mem_0_0__T_151_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_0_0__T_158_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    if(data_mem_0_1__T_130_en & data_mem_0_1__T_130_mask) begin
      data_mem_0_1[data_mem_0_1__T_130_addr] <= data_mem_0_1__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_1__T_135_en & data_mem_0_1__T_135_mask) begin
      data_mem_0_1[data_mem_0_1__T_135_addr] <= data_mem_0_1__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_1__T_142_en & data_mem_0_1__T_142_mask) begin
      data_mem_0_1[data_mem_0_1__T_142_addr] <= data_mem_0_1__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_1__T_149_en & data_mem_0_1__T_149_mask) begin
      data_mem_0_1[data_mem_0_1__T_149_addr] <= data_mem_0_1__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_0_1__T_156_en & data_mem_0_1__T_156_mask) begin
      data_mem_0_1[data_mem_0_1__T_156_addr] <= data_mem_0_1__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    data_mem_0_1__T_137_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_0_1__T_144_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    data_mem_0_1__T_151_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_0_1__T_158_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    if(data_mem_1_0__T_130_en & data_mem_1_0__T_130_mask) begin
      data_mem_1_0[data_mem_1_0__T_130_addr] <= data_mem_1_0__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_0__T_135_en & data_mem_1_0__T_135_mask) begin
      data_mem_1_0[data_mem_1_0__T_135_addr] <= data_mem_1_0__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_0__T_142_en & data_mem_1_0__T_142_mask) begin
      data_mem_1_0[data_mem_1_0__T_142_addr] <= data_mem_1_0__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_0__T_149_en & data_mem_1_0__T_149_mask) begin
      data_mem_1_0[data_mem_1_0__T_149_addr] <= data_mem_1_0__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_0__T_156_en & data_mem_1_0__T_156_mask) begin
      data_mem_1_0[data_mem_1_0__T_156_addr] <= data_mem_1_0__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    data_mem_1_0__T_137_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_1_0__T_144_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    data_mem_1_0__T_151_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_1_0__T_158_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    if(data_mem_1_1__T_130_en & data_mem_1_1__T_130_mask) begin
      data_mem_1_1[data_mem_1_1__T_130_addr] <= data_mem_1_1__T_130_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_1__T_135_en & data_mem_1_1__T_135_mask) begin
      data_mem_1_1[data_mem_1_1__T_135_addr] <= data_mem_1_1__T_135_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_1__T_142_en & data_mem_1_1__T_142_mask) begin
      data_mem_1_1[data_mem_1_1__T_142_addr] <= data_mem_1_1__T_142_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_1__T_149_en & data_mem_1_1__T_149_mask) begin
      data_mem_1_1[data_mem_1_1__T_149_addr] <= data_mem_1_1__T_149_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    if(data_mem_1_1__T_156_en & data_mem_1_1__T_156_mask) begin
      data_mem_1_1[data_mem_1_1__T_156_addr] <= data_mem_1_1__T_156_data; // @[el2_ifu_ic_mem.scala 245:29]
    end
    data_mem_1_1__T_137_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_1_1__T_144_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    data_mem_1_1__T_151_addr_pipe_0 <= ic_rw_addr_bank_q_0[12:4];
    data_mem_1_1__T_158_addr_pipe_0 <= ic_rw_addr_bank_q_1[12:4];
    if (reset) begin
      ic_rw_addr_ff <= 13'h0;
    end else begin
      ic_rw_addr_ff <= ic_rw_addr_q;
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
