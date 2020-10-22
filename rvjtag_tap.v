module rvjtag_tap(
  input         clock,
  input         reset,
  input         io_tck,
  input         io_tms,
  input         io_tdi,
  input  [31:0] io_rd_data,
  input  [1:0]  io_rd_status,
  input  [2:0]  io_idle,
  input  [1:0]  io_dmi_stat,
  input  [31:0] io_jtag_id,
  input  [3:0]  io_version,
  output        io_tdo,
  output        io_tdoEnable,
  output [31:0] io_wr_data,
  output [6:0]  io_wr_addr,
  output        io_wr_en,
  output        io_rd_en,
  output        io_dmi_reset,
  output        io_dmi_hard_reset
);
  assign io_tdo = 1'h0; // @[rvjtag_tap.scala 38:21]
  assign io_tdoEnable = 1'h0; // @[rvjtag_tap.scala 39:21]
  assign io_wr_data = 32'h0; // @[rvjtag_tap.scala 40:21]
  assign io_wr_addr = 7'h0; // @[rvjtag_tap.scala 41:21]
  assign io_wr_en = 1'h0; // @[rvjtag_tap.scala 42:21]
  assign io_rd_en = 1'h0; // @[rvjtag_tap.scala 43:21]
  assign io_dmi_reset = 1'h0; // @[rvjtag_tap.scala 44:21]
  assign io_dmi_hard_reset = 1'h0; // @[rvjtag_tap.scala 45:21]
endmodule
