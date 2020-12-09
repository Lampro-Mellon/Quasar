module gated_latch
  (
   input wire SE, EN, CK,
   output Q
   );
   reg  en_ff;
   wire  enable;
   assign      enable = EN | SE;
  always @(CK, enable) begin
      if(!CK)
        en_ff = enable;
   end
   assign Q = CK & en_ff;
endmodule
