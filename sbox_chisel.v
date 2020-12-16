module sbox_chisel(
  input        clock,
  input        reset,
  input  [7:0] io_byte_in,
  output [7:0] io_byte_out
);
  assign io_byte_out = 8'hc6; // @[cipher.scala 58:15]
endmodule
