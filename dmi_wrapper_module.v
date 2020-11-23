module dmi_wrapper_module(
  input         clock,
  input         reset,
  input         io_trst_n,
  input         io_tck,
  input         io_tms,
  input         io_tdi,
  output        io_tdo,
  output        io_tdoEnable,
  input         io_core_rst_n,
  input         io_core_clk,
  input  [31:0] io_jtag_id,
  input  [31:0] io_rd_data,
  output [31:0] io_reg_wr_data,
  output [6:0]  io_reg_wr_addr,
  output        io_reg_en,
  output        io_reg_wr_en,
  output        io_dmi_hard_reset
);
  wire  dwrap_trst_n; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_tck; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_tms; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_tdi; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_tdo; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_tdoEnable; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_core_rst_n; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_core_clk; // @[dmi_wrapper.scala 45:21]
  wire [30:0] dwrap_jtag_id; // @[dmi_wrapper.scala 45:21]
  wire [31:0] dwrap_rd_data; // @[dmi_wrapper.scala 45:21]
  wire [31:0] dwrap_reg_wr_data; // @[dmi_wrapper.scala 45:21]
  wire [6:0] dwrap_reg_wr_addr; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_reg_en; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_reg_wr_en; // @[dmi_wrapper.scala 45:21]
  wire  dwrap_dmi_hard_reset; // @[dmi_wrapper.scala 45:21]
  dmi_wrapper dwrap ( // @[dmi_wrapper.scala 45:21]
    .trst_n(dwrap_trst_n),
    .tck(dwrap_tck),
    .tms(dwrap_tms),
    .tdi(dwrap_tdi),
    .tdo(dwrap_tdo),
    .tdoEnable(dwrap_tdoEnable),
    .core_rst_n(dwrap_core_rst_n),
    .core_clk(dwrap_core_clk),
    .jtag_id(dwrap_jtag_id),
    .rd_data(dwrap_rd_data),
    .reg_wr_data(dwrap_reg_wr_data),
    .reg_wr_addr(dwrap_reg_wr_addr),
    .reg_en(dwrap_reg_en),
    .reg_wr_en(dwrap_reg_wr_en),
    .dmi_hard_reset(dwrap_dmi_hard_reset)
  );
  assign io_tdo = dwrap_tdo; // @[dmi_wrapper.scala 46:12]
  assign io_tdoEnable = dwrap_tdoEnable; // @[dmi_wrapper.scala 46:12]
  assign io_reg_wr_data = dwrap_reg_wr_data; // @[dmi_wrapper.scala 46:12]
  assign io_reg_wr_addr = dwrap_reg_wr_addr; // @[dmi_wrapper.scala 46:12]
  assign io_reg_en = dwrap_reg_en; // @[dmi_wrapper.scala 46:12]
  assign io_reg_wr_en = dwrap_reg_wr_en; // @[dmi_wrapper.scala 46:12]
  assign io_dmi_hard_reset = dwrap_dmi_hard_reset; // @[dmi_wrapper.scala 46:12]
  assign dwrap_trst_n = io_trst_n; // @[dmi_wrapper.scala 46:12]
  assign dwrap_tck = io_tck; // @[dmi_wrapper.scala 46:12]
  assign dwrap_tms = io_tms; // @[dmi_wrapper.scala 46:12]
  assign dwrap_tdi = io_tdi; // @[dmi_wrapper.scala 46:12]
  assign dwrap_core_rst_n = io_core_rst_n; // @[dmi_wrapper.scala 46:12]
  assign dwrap_core_clk = io_core_clk; // @[dmi_wrapper.scala 46:12]
  assign dwrap_jtag_id = io_jtag_id[30:0]; // @[dmi_wrapper.scala 46:12]
  assign dwrap_rd_data = io_rd_data; // @[dmi_wrapper.scala 46:12]
endmodule
