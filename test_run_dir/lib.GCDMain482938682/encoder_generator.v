module encoder_generator(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  output [2:0] io_out
);
  wire [1:0] _T_10 = io_in[2] ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_11 = io_in[3] ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_12 = io_in[4] ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_13 = io_in[5] ? 3'h5 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_14 = io_in[6] ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_15 = io_in[7] ? 3'h7 : 3'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_0 = {{1'd0}, io_in[1]}; // @[Mux.scala 27:72]
  wire [1:0] _T_17 = _GEN_0 | _T_10; // @[Mux.scala 27:72]
  wire [1:0] _T_18 = _T_17 | _T_11; // @[Mux.scala 27:72]
  wire [2:0] _GEN_1 = {{1'd0}, _T_18}; // @[Mux.scala 27:72]
  wire [2:0] _T_19 = _GEN_1 | _T_12; // @[Mux.scala 27:72]
  wire [2:0] _T_20 = _T_19 | _T_13; // @[Mux.scala 27:72]
  wire [2:0] _T_21 = _T_20 | _T_14; // @[Mux.scala 27:72]
  assign io_out = _T_21 | _T_15; // @[GCD.scala 74:10]
endmodule
