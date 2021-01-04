module gated_latch
  (
   input logic SE, EN, CK,
   output Q
   );

   logic  en_ff;
   logic  enable;

   assign enable = EN | SE;

`ifdef VERILATOR
   always @(negedge CK) begin
      en_ff <= enable;
   end
`else
   always @(CK, enable) begin
      if(!CK)
        en_ff = enable;
   end
`endif
   assign Q = CK & en_ff;

endmodule