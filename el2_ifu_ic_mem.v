module el2_ifu_ic_mem(
  input         clock,
  input         reset,
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
  input  [70:0] io_ic_wr_data_0,
  input  [70:0] io_ic_wr_data_1,
  output [63:0] io_ic_rd_data,
  output [70:0] io_ic_debug_rd_data,
  output [25:0] io_ictag_debug_rd_data,
  input  [70:0] io_ic_debug_wr_data,
  output [1:0]  io_ic_eccerr,
  output [1:0]  io_ic_parerr,
  input  [1:0]  io_ic_tag_valid,
  output [1:0]  io_ic_rd_hit,
  output        io_ic_tag_perr,
  input         io_scan_mode
);
  assign io_ic_rd_data = 64'h0; // @[el2_ifu_ic_mem.scala 38:17]
  assign io_ic_debug_rd_data = 71'h0; // @[el2_ifu_ic_mem.scala 37:23]
  assign io_ictag_debug_rd_data = 26'h0; // @[el2_ifu_ic_mem.scala 36:26]
  assign io_ic_eccerr = 2'h0; // @[el2_ifu_ic_mem.scala 35:16]
  assign io_ic_parerr = 2'h0; // @[el2_ifu_ic_mem.scala 34:16]
  assign io_ic_rd_hit = 2'h0; // @[el2_ifu_ic_mem.scala 33:16]
  assign io_ic_tag_perr = 1'h0; // @[el2_ifu_ic_mem.scala 32:18]
endmodule
