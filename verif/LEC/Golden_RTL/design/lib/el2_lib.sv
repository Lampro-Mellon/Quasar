module el2_btb_tag_hash 
`include "parameter.sv" 
(
                       input logic [BTB_ADDR_HI+BTB_BTAG_SIZE+BTB_BTAG_SIZE+BTB_BTAG_SIZE:BTB_ADDR_HI+1] pc,
                       output logic [BTB_BTAG_SIZE-1:0] hash
                       );

    assign hash = {(pc[BTB_ADDR_HI+BTB_BTAG_SIZE+BTB_BTAG_SIZE+BTB_BTAG_SIZE:BTB_ADDR_HI+BTB_BTAG_SIZE+BTB_BTAG_SIZE+1] ^
                   pc[BTB_ADDR_HI+BTB_BTAG_SIZE+BTB_BTAG_SIZE:BTB_ADDR_HI+BTB_BTAG_SIZE+1] ^
                   pc[BTB_ADDR_HI+BTB_BTAG_SIZE:BTB_ADDR_HI+1])};
endmodule

module el2_btb_tag_hash_fold  
`include "parameter.sv"
(
                       input logic [BTB_ADDR_HI+BTB_BTAG_SIZE+BTB_BTAG_SIZE:BTB_ADDR_HI+1] pc,
                       output logic [BTB_BTAG_SIZE-1:0] hash
                       );

    assign hash = {(
                   pc[BTB_ADDR_HI+BTB_BTAG_SIZE+BTB_BTAG_SIZE:BTB_ADDR_HI+BTB_BTAG_SIZE+1] ^
                   pc[BTB_ADDR_HI+BTB_BTAG_SIZE:BTB_ADDR_HI+1])};

endmodule

module el2_btb_addr_hash  
`include "parameter.sv"
(
                        input logic [BTB_INDEX3_HI:BTB_INDEX1_LO] pc,
                        output logic [BTB_ADDR_HI:BTB_ADDR_LO] hash
                        );


if(BTB_FOLD2_INDEX_HASH) begin : fold2
   assign hash[BTB_ADDR_HI:BTB_ADDR_LO] = pc[BTB_INDEX1_HI:BTB_INDEX1_LO] ^
                                                pc[BTB_INDEX3_HI:BTB_INDEX3_LO];
end
   else begin
   assign hash[BTB_ADDR_HI:BTB_ADDR_LO] = pc[BTB_INDEX1_HI:BTB_INDEX1_LO] ^
                                                pc[BTB_INDEX2_HI:BTB_INDEX2_LO] ^
                                                pc[BTB_INDEX3_HI:BTB_INDEX3_LO];
end

endmodule

module el2_btb_ghr_hash  
`include "parameter.sv"
(
                       input logic [BTB_ADDR_HI:BTB_ADDR_LO] hashin,
                       input logic [BHT_GHR_SIZE-1:0] ghr,
                       output logic [BHT_ADDR_HI:BHT_ADDR_LO] hash
                       );

   // The hash function is too complex to write in verilog for all cases.
   // The config script generates the logic string based on the bp config.
   if(BHT_GHR_HASH_1) begin : ghrhash_cfg1
     assign hash[BHT_ADDR_HI:BHT_ADDR_LO] = { ghr[BHT_GHR_SIZE-1:BTB_INDEX1_HI-1], hashin[BTB_INDEX1_HI:2]^ghr[BTB_INDEX1_HI-2:0]};
   end
   else begin : ghrhash_cfg2
     assign hash[BHT_ADDR_HI:BHT_ADDR_LO] = { hashin[BHT_GHR_SIZE+1:2]^ghr[BHT_GHR_SIZE-1:0]};
   end


endmodule
