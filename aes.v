module aes(
  input        clock,
  input        reset,
  input  [7:0] io_byteIn,
  output [7:0] io_byteOut
);
  wire [10:0] _T = {io_byteIn, 3'h0}; // @[cipher.scala 16:16]
  wire [3:0] _T_2 = 4'h8 - 4'h3; // @[cipher.scala 16:39]
  wire [7:0] _T_3 = io_byteIn >> _T_2; // @[cipher.scala 16:31]
  wire [10:0] _GEN_0 = {{3'd0}, _T_3}; // @[cipher.scala 16:26]
  wire [10:0] z = _T | _GEN_0; // @[cipher.scala 16:26]
  assign io_byteOut = z[7:0]; // @[cipher.scala 21:14]
endmodule
