
module el2_dec_trigger
`include "parameter.sv"
(

   input el2_trigger_pkt_t [3:0] trigger_pkt_any,           // Packet from tlu. 'select':0-pc,1-Opcode  'Execute' needs to be set for dec triggers to fire. 'match'-1 do mask, 0: full match
   input logic [31:1]  dec_i0_pc_d,                     // i0 pc

   output logic [3:0] dec_i0_trigger_match_d
);

   logic [3:0][31:0]  dec_i0_match_data;
   logic [3:0]        dec_i0_trigger_data_match;

   for (genvar i=0; i<4; i++) begin
      assign dec_i0_match_data[i][31:0] = ({32{~trigger_pkt_any[i].select & trigger_pkt_any[i].execute}} & {dec_i0_pc_d[31:1], trigger_pkt_any[i].tdata2[0]});      // select=0; do a PC match

      rvmaskandmatch trigger_i0_match (.mask(trigger_pkt_any[i].tdata2[31:0]), .data(dec_i0_match_data[i][31:0]), .masken(trigger_pkt_any[i].match), .match(dec_i0_trigger_data_match[i]));

      assign dec_i0_trigger_match_d[i] = trigger_pkt_any[i].execute & trigger_pkt_any[i].m & dec_i0_trigger_data_match[i];
   end

endmodule // el2_dec_trigger

