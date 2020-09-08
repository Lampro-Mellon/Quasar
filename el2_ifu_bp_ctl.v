module el2_ifu_bp_ctl(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  input  [31:0] io_in2,
  output [7:0]  io_out
);
  assign io_out = io_in[9:2] ^ io_in2[7:0]; // @[el2_ifu_bp_ctl.scala 13:10]
endmodule
