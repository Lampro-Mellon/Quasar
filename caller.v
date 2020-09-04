module rvdff(
  input  [31:0] io_in,
  output [31:0] io_out
);
  assign io_out = io_in; // @[GCD.scala 12:10]
endmodule
module caller(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [31:0] u0_io_in; // @[GCD.scala 21:18]
  wire [31:0] u0_io_out; // @[GCD.scala 21:18]
  rvdff u0 ( // @[GCD.scala 21:18]
    .io_in(u0_io_in),
    .io_out(u0_io_out)
  );
  assign io_out = u0_io_out; // @[GCD.scala 22:6]
  assign u0_io_in = io_in; // @[GCD.scala 22:6]
endmodule
