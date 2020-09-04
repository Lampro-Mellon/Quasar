module rvdff(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  input         io_clk,
  input         io_reset,
  output [15:0] io_out
);
  wire [15:0] m_in; // @[GCD.scala 41:17]
  wire  m_clk; // @[GCD.scala 41:17]
  wire  m_reset; // @[GCD.scala 41:17]
  wire [15:0] m_out; // @[GCD.scala 41:17]
  rvdff_verilog #(.DATA_WIDTH(32), .MODE("Sequential"), .RESET("Asynchronous")) m ( // @[GCD.scala 41:17]
    .in(m_in),
    .clk(m_clk),
    .reset(m_reset),
    .out(m_out)
  );
  assign io_out = m_out; // @[GCD.scala 43:8]
  assign m_in = io_in; // @[GCD.scala 43:8]
  assign m_clk = io_clk; // @[GCD.scala 43:8]
  assign m_reset = io_reset; // @[GCD.scala 43:8]
endmodule
