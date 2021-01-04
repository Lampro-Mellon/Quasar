
module el2_lsu_trigger
`include "parameter.sv"
(
   input el2_trigger_pkt_t [3:0] trigger_pkt_any,        // trigger packet from dec
   input el2_lsu_pkt_t           lsu_pkt_m,                  // lsu packet
   input logic [31:0]             lsu_addr_m,                 // address
   input logic [31:0]             store_data_m,               // store data

   output logic [3:0]             lsu_trigger_match_m          // match result
);

   logic [3:0][31:0]  lsu_match_data;
   logic [3:0]        lsu_trigger_data_match;
   logic [31:0]       store_data_trigger_m;

   assign store_data_trigger_m[31:0] = {({16{lsu_pkt_m.word}} & store_data_m[31:16]),({8{(lsu_pkt_m.half | lsu_pkt_m.word)}} & store_data_m[15:8]), store_data_m[7:0]};


   for (genvar i=0; i<4; i++) begin
      assign lsu_match_data[i][31:0] = ({32{~trigger_pkt_any[i].select}} & lsu_addr_m[31:0]) |
                                       ({32{trigger_pkt_any[i].select & trigger_pkt_any[i].store}} & store_data_trigger_m[31:0]);


      rvmaskandmatch trigger_match (.mask(trigger_pkt_any[i].tdata2[31:0]), .data(lsu_match_data[i][31:0]), .masken(trigger_pkt_any[i].match), .match(lsu_trigger_data_match[i]));

      assign lsu_trigger_match_m[i] = lsu_pkt_m.valid & ~lsu_pkt_m.dma &
                                        ((trigger_pkt_any[i].store & lsu_pkt_m.store) | (trigger_pkt_any[i].load & lsu_pkt_m.load & ~trigger_pkt_any[i].select)) &
                                        lsu_trigger_data_match[i];
   end


endmodule // el2_lsu_trigger
