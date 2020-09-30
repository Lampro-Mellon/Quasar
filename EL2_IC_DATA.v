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
  output [8:0]  io_test
);
  wire  _T_8 = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_ic_mem.scala 206:45]
  wire [10:0] _T_10 = {io_ic_debug_addr,2'h0}; // @[Cat.scala 29:58]
  wire [11:0] ic_rw_addr_q = _T_8 ? {{1'd0}, _T_10} : io_ic_rw_addr; // @[el2_ifu_ic_mem.scala 206:25]
  assign io_ic_rd_data = 64'h0; // @[el2_ifu_ic_mem.scala 194:17]
  assign io_ic_debug_rd_data = 71'h0; // @[el2_ifu_ic_mem.scala 195:23]
  assign io_ic_parerr = 2'h0; // @[el2_ifu_ic_mem.scala 196:16]
  assign io_ic_eccerr = 2'h0; // @[el2_ifu_ic_mem.scala 197:16]
  assign io_test = ic_rw_addr_q[11:3]; // @[el2_ifu_ic_mem.scala 198:11 el2_ifu_ic_mem.scala 209:11 el2_ifu_ic_mem.scala 241:11]
endmodule
