module EL2_IC_DATA(
  input         clock,
  input         reset,
  input         io_rst_l,
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
  input  [14:0] io_ic_debug_addr,
  input         io_ic_debug_rd_en,
  input         io_ic_debug_wr_en,
  input         io_ic_debug_tag_array,
  input  [1:0]  io_ic_debug_way,
  input  [63:0] io_ic_premux_data,
  input         io_ic_sel_premux_data,
  input  [1:0]  io_ic_rd_hit,
  input         io_scan_mode,
  input         io_mask_0_0,
  input         io_mask_0_1,
  input         io_mask_1_0,
  input         io_mask_1_1
);
  assign io_ic_rd_data = 64'h0; // @[el2_ifu_ic_mem.scala 215:17]
  assign io_ic_debug_rd_data = 71'h0; // @[el2_ifu_ic_mem.scala 214:23]
  assign io_ic_parerr = 2'h0; // @[el2_ifu_ic_mem.scala 217:16]
  assign io_ic_eccerr = 2'h0; // @[el2_ifu_ic_mem.scala 216:16]
endmodule
