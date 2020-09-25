module test(
  input        clock,
  input        reset,
  input  [3:0] io_in1,
  input  [4:0] io_in2_waleed,
  input  [4:0] io_in2_laraib,
  input  [4:0] io_in2_hameed,
  output [4:0] io_out2_waleed,
  output [4:0] io_out2_laraib,
  output [4:0] io_out2_hameed,
  output       io_out1
);
  assign io_out2_waleed = 5'h0; // @[el2_ifu_bp_ctl.scala 228:20]
  assign io_out2_laraib = 5'h0; // @[el2_ifu_bp_ctl.scala 229:20]
  assign io_out2_hameed = 5'h0; // @[el2_ifu_bp_ctl.scala 230:20]
  assign io_out1 = 1'h0; // @[el2_ifu_bp_ctl.scala 231:13]
endmodule
