module EL2_IC_TAG(
  input         clock,
  input         reset,
  input         io_clk,
  input         io_rst_l,
  input         io_clk_override,
  input         io_dec_tlu_core_ecc_disable,
  input  [28:0] io_ic_rw_addr,
  input  [1:0]  io_ic_wr_en,
  input  [1:0]  io_ic_tag_valid,
  input         io_ic_rd_en,
  input  [8:0]  io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  output [25:0] io_ictag_debug_rd_data,
  input  [70:0] io_ic_debug_wr_data,
  output [1:0]  io_ic_rd_hit,
  output        io_ic_tag_perr,
  input         io_scan_mode,
  output [1:0]  io_test
);
  wire  _T_2 = io_ic_rw_addr[5:4] == 2'h1; // @[el2_ifu_ic_mem.scala 68:92]
  wire [1:0] _T_4 = {_T_2,_T_2}; // @[Cat.scala 29:58]
  assign io_ictag_debug_rd_data = 26'h0; // @[el2_ifu_ic_mem.scala 75:26]
  assign io_ic_rd_hit = 2'h0; // @[el2_ifu_ic_mem.scala 74:16]
  assign io_ic_tag_perr = 1'h0; // @[el2_ifu_ic_mem.scala 73:18]
  assign io_test = io_ic_wr_en & _T_4; // @[el2_ifu_ic_mem.scala 72:10]
endmodule
