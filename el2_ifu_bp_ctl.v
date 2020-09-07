module el2_ifu_bp_ctl(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [4:0]  io_out
);
  wire [4:0] _T_4 = io_in[14:10] ^ io_in[19:15]; // @[el2_lib.scala 18:113]
  assign io_out = _T_4 ^ io_in[24:20]; // @[el2_ifu_bp_ctl.scala 12:10]
endmodule
