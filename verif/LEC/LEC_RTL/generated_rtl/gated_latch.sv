
module gated_latch
  (
   input logic SE, EN, CK,
   output Q
   );
   logic  en_ff;
   logic  enable;
   assign      enable = EN | SE;
  always @(CK, enable) begin
      if(!CK)
        en_ff = enable;
   end
   assign Q = CK & en_ff;
endmodule
