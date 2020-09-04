
module InoutPort( inout [15:0] a,
                  input [15:0] b,
                  input        sel,
                  output [15:0] c);
  assign a = sel ? 'bz : b;
  assign c = sel ? a : 'bz;
endmodule
    