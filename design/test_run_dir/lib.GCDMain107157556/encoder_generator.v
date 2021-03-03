module encoder_generator(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [1:0] io_out
);
  wire [1:0] _T_6 = io_in[2] ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_7 = io_in[3] ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_0 = {{1'd0}, io_in[1]}; // @[Mux.scala 27:72]
  wire [1:0] _T_9 = _GEN_0 | _T_6; // @[Mux.scala 27:72]
  assign io_out = _T_9 | _T_7; // @[GCD.scala 74:10]
endmodule
