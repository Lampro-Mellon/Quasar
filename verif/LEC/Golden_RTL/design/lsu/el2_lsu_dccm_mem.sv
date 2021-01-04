`include "mem_lib.sv"
module el2_lsu_dccm_mem
`include "parameter.sv"
(
   input logic         clk,                                             // clock
   input logic         rst_l,
   input logic         clk_override,                                    // clock override

   input logic         dccm_wren,                                       // write enable
   input logic         dccm_rden,                                       // read enable
   input logic [DCCM_BITS-1:0]  dccm_wr_addr_lo,                     // write address
   input logic [DCCM_BITS-1:0]  dccm_wr_addr_hi,                     // write address
   input logic [DCCM_BITS-1:0]  dccm_rd_addr_lo,                     // read address
   input logic [DCCM_BITS-1:0]  dccm_rd_addr_hi,                     // read address for the upper bank in case of a misaligned access
   input logic [DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_lo,              // write data
   input logic [DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_hi,              // write data

   output logic [DCCM_FDATA_WIDTH-1:0] dccm_rd_data_lo,              // read data from the lo bank
   output logic [DCCM_FDATA_WIDTH-1:0] dccm_rd_data_hi,              // read data from the hi bank

   input  logic         scan_mode
);


   localparam DCCM_WIDTH_BITS = $clog2(DCCM_BYTE_WIDTH);
   localparam DCCM_INDEX_BITS = (DCCM_BITS - DCCM_BANK_BITS - DCCM_WIDTH_BITS);
   localparam DCCM_INDEX_DEPTH = ((DCCM_SIZE)*1024)/((DCCM_BYTE_WIDTH)*(DCCM_NUM_BANKS));  // Depth of memory bank

   logic [DCCM_NUM_BANKS-1:0]                                        wren_bank;
   logic [DCCM_NUM_BANKS-1:0]                                        rden_bank;
   logic [DCCM_NUM_BANKS-1:0] [DCCM_BITS-1:(DCCM_BANK_BITS+2)] addr_bank;
   logic [DCCM_BITS-1:(DCCM_BANK_BITS+DCCM_WIDTH_BITS)]           rd_addr_even, rd_addr_odd;
   logic                                                                rd_unaligned, wr_unaligned;
   logic [DCCM_NUM_BANKS-1:0] [DCCM_FDATA_WIDTH-1:0]              dccm_bank_dout;
   logic [DCCM_FDATA_WIDTH-1:0]                                      wrdata;

   logic [DCCM_NUM_BANKS-1:0][DCCM_FDATA_WIDTH-1:0]               wr_data_bank;

   logic [(DCCM_WIDTH_BITS+DCCM_BANK_BITS-1):DCCM_WIDTH_BITS]        dccm_rd_addr_lo_q;
   logic [(DCCM_WIDTH_BITS+DCCM_BANK_BITS-1):DCCM_WIDTH_BITS]        dccm_rd_addr_hi_q;

   logic [DCCM_NUM_BANKS-1:0]            dccm_clken;

   assign rd_unaligned = (dccm_rd_addr_lo[DCCM_WIDTH_BITS+:DCCM_BANK_BITS] != dccm_rd_addr_hi[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]);
   assign wr_unaligned = (dccm_wr_addr_lo[DCCM_WIDTH_BITS+:DCCM_BANK_BITS] != dccm_wr_addr_hi[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]);

   // Align the read data
   assign dccm_rd_data_lo[DCCM_FDATA_WIDTH-1:0]  = dccm_bank_dout[dccm_rd_addr_lo_q[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]][DCCM_FDATA_WIDTH-1:0];
   assign dccm_rd_data_hi[DCCM_FDATA_WIDTH-1:0]  = dccm_bank_dout[dccm_rd_addr_hi_q[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]][DCCM_FDATA_WIDTH-1:0];

   // Generate even/odd address

   // 8 Banks, 16KB each (2048 x 72)
   for (genvar i=0; i<32'(DCCM_NUM_BANKS); i++) begin: mem_bank
      assign  wren_bank[i]        = dccm_wren & ((dccm_wr_addr_hi[2+:DCCM_BANK_BITS] == i) | (dccm_wr_addr_lo[2+:DCCM_BANK_BITS] == i));
      assign  rden_bank[i]        = dccm_rden & ((dccm_rd_addr_hi[2+:DCCM_BANK_BITS] == i) | (dccm_rd_addr_lo[2+:DCCM_BANK_BITS] == i));
      assign  addr_bank[i][(DCCM_BANK_BITS+DCCM_WIDTH_BITS)+:DCCM_INDEX_BITS] = wren_bank[i] ? (((dccm_wr_addr_hi[2+:DCCM_BANK_BITS] == i) & wr_unaligned) ?
                                                                                                        dccm_wr_addr_hi[(DCCM_BANK_BITS+DCCM_WIDTH_BITS)+:DCCM_INDEX_BITS] :
                                                                                                        dccm_wr_addr_lo[(DCCM_BANK_BITS+DCCM_WIDTH_BITS)+:DCCM_INDEX_BITS])  :
                                                                                                  (((dccm_rd_addr_hi[2+:DCCM_BANK_BITS] == i) & rd_unaligned) ?
                                                                                                        dccm_rd_addr_hi[(DCCM_BANK_BITS+DCCM_WIDTH_BITS)+:DCCM_INDEX_BITS] :
                                                                                                        dccm_rd_addr_lo[(DCCM_BANK_BITS+DCCM_WIDTH_BITS)+:DCCM_INDEX_BITS]);

      assign wr_data_bank[i]     = ((dccm_wr_addr_hi[2+:DCCM_BANK_BITS] == i) & wr_unaligned) ? dccm_wr_data_hi[DCCM_FDATA_WIDTH-1:0] : dccm_wr_data_lo[DCCM_FDATA_WIDTH-1:0];

      // clock gating section
      assign  dccm_clken[i] = (wren_bank[i] | rden_bank[i] | clk_override) ;
      // end clock gating section

`ifdef VERILATOR
         el2_ram #(DCCM_INDEX_DEPTH,39)  ram (
                                  // Primary ports
                                  .ME(dccm_clken[i]),
                                  .CLK(clk),
                                  .WE(wren_bank[i]),
                                  .ADR(addr_bank[i]),
                                  .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                  .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                  .*
                                  );

`else
      if (DCCM_INDEX_DEPTH == 32768) begin : dccm
         ram_32768x39  dccm_bank (
                                  // Primary ports
                                  .ME(dccm_clken[i]),
                                  .CLK(clk),
                                  .WE(wren_bank[i]),
                                  .ADR(addr_bank[i]),
                                  .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                  .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                  .*
                                  );
      end
      else if (DCCM_INDEX_DEPTH == 16384) begin : dccm
         ram_16384x39  dccm_bank (
                                  // Primary ports
                                  .ME(dccm_clken[i]),
                                  .CLK(clk),
                                  .WE(wren_bank[i]),
                                  .ADR(addr_bank[i]),
                                  .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                  .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                  .*
                                  );
      end
      else if (DCCM_INDEX_DEPTH == 8192) begin : dccm
         ram_8192x39  dccm_bank (
                                 // Primary ports
                                 .ME(dccm_clken[i]),
                                 .CLK(clk),
                                 .WE(wren_bank[i]),
                                 .ADR(addr_bank[i]),
                                 .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                 .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                 .*
                                 );
      end
      else if (DCCM_INDEX_DEPTH == 4096) begin : dccm
         ram_4096x39  dccm_bank (
                                 // Primary ports
                                 .ME(dccm_clken[i]),
                                 .CLK(clk),
                                 .WE(wren_bank[i]),
                                 .ADR(addr_bank[i]),
                                 .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                 .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                 .*
                                 );
      end
      else if (DCCM_INDEX_DEPTH == 3072) begin : dccm
         ram_3072x39  dccm_bank (
                                 // Primary ports
                                 .ME(dccm_clken[i]),
                                 .CLK(clk),
                                 .WE(wren_bank[i]),
                                 .ADR(addr_bank[i]),
                                 .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                 .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                 .*
                                 );
      end
      else if (DCCM_INDEX_DEPTH == 2048) begin : dccm
         ram_2048x39  dccm_bank (
                                 // Primary ports
                                 .ME(dccm_clken[i]),
                                 .CLK(clk),
                                 .WE(wren_bank[i]),
                                 .ADR(addr_bank[i]),
                                 .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                 .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                 .*
                                 );
      end
      else if (DCCM_INDEX_DEPTH == 1024) begin : dccm
         ram_1024x39  dccm_bank (
                                 // Primary ports
                                 .ME(dccm_clken[i]),
                                 .CLK(clk),
                                 .WE(wren_bank[i]),
                                 .ADR(addr_bank[i]),
                                 .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                 .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                 .*
                                 );
      end
      else if (DCCM_INDEX_DEPTH == 512) begin : dccm
         ram_512x39  dccm_bank (
                                // Primary ports
                                .ME(dccm_clken[i]),
                                .CLK(clk),
                                .WE(wren_bank[i]),
                                .ADR(addr_bank[i]),
                                .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                .*
                                );
      end
      else if (DCCM_INDEX_DEPTH == 256) begin : dccm
         ram_256x39  dccm_bank (
                                // Primary ports
                                .ME(dccm_clken[i]),
                                .CLK(clk),
                                .WE(wren_bank[i]),
                                .ADR(addr_bank[i]),
                                .D(wr_data_bank[i][DCCM_FDATA_WIDTH-1:0]),
                                .Q(dccm_bank_dout[i][DCCM_FDATA_WIDTH-1:0]),
                                .*
                                );
      end
`endif // VERILATOR
   end : mem_bank

   // Flops
   rvdffs  #(DCCM_BANK_BITS) rd_addr_lo_ff (.*, .din(dccm_rd_addr_lo[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]), .dout(dccm_rd_addr_lo_q[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]), .en(1'b1));
   rvdffs  #(DCCM_BANK_BITS) rd_addr_hi_ff (.*, .din(dccm_rd_addr_hi[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]), .dout(dccm_rd_addr_hi_q[DCCM_WIDTH_BITS+:DCCM_BANK_BITS]), .en(1'b1));

`undef EL2_LOCAL_DCCM_RAM_TEST_PORTS

endmodule // el2_lsu_dccm_mem


