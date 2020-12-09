//********************************************************************************
// SPDX-License-Identifier: Apache-2.0
// Copyright 2020 Western Digital Corporation or it's affiliates.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//********************************************************************************
////////////////////////////////////////////////////
//   ICACHE DATA & TAG MODULE WRAPPER              //
/////////////////////////////////////////////////////
module ifu_ic_mem
 #(
   parameter ICACHE_BEAT_BITS,
   parameter ICACHE_NUM_WAYS,
   parameter ICACHE_BANK_BITS,
   parameter ICACHE_BEAT_ADDR_HI,
   parameter ICACHE_BANKS_WAY,
   parameter ICACHE_INDEX_HI,
   parameter ICACHE_BANK_HI,
   parameter ICACHE_BANK_LO,
   parameter ICACHE_TAG_LO,
   parameter ICACHE_DATA_INDEX_LO,
   parameter ICACHE_ECC,
   parameter ICACHE_TAG_DEPTH,
   parameter ICACHE_WAYPACK,
   parameter ICACHE_TAG_INDEX_LO,
   parameter ICACHE_DATA_DEPTH )
  (
      input logic                                   clk,
      input logic                                   rst_l,
      input logic                                   clk_override,
      input logic                                   dec_tlu_core_ecc_disable,

      input logic [31:1]                            ic_rw_addr,
      input logic [ICACHE_NUM_WAYS-1:0]          ic_wr_en  ,         // Which way to write
      input logic                                   ic_rd_en  ,         // Read enable
      input logic [ICACHE_INDEX_HI:3]            ic_debug_addr,      // Read/Write addresss to the Icache.
      input logic                                   ic_debug_rd_en,     // Icache debug rd
      input logic                                   ic_debug_wr_en,     // Icache debug wr
      input logic                                   ic_debug_tag_array, // Debug tag array
      input logic [ICACHE_NUM_WAYS-1:0]          ic_debug_way,       // Debug way. Rd or Wr.
      input logic [63:0]                            ic_premux_data,     // Premux data to be muxed with each way of the Icache.
      input logic                                   ic_sel_premux_data, // Select the pre_muxed data

      input  logic [ICACHE_BANKS_WAY-1:0][70:0]  ic_wr_data,         // Data to fill to the Icache. With ECC
      output logic [63:0]                           ic_rd_data ,        // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
      output logic [70:0]                           ic_debug_rd_data ,  // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
      output logic [25:0]                           ic_tag_debug_rd_data,// Debug icache tag.
      input logic  [70:0]                           ic_debug_wr_data,   // Debug wr cache.

      output logic [ICACHE_BANKS_WAY-1:0]        ic_eccerr,                 // ecc error per bank
      output logic [ICACHE_BANKS_WAY-1:0]        ic_parerr,                 // ecc error per bank
      input logic [ICACHE_NUM_WAYS-1:0]          ic_tag_valid,              // Valid from the I$ tag valid outside (in flops).

      output logic [ICACHE_NUM_WAYS-1:0]         ic_rd_hit,   // ic_rd_hit[3:0]
      output logic                                  ic_tag_perr, // Tag Parity error
      input  logic                                  scan_mode
      ) ;


   IC_TAG #(
   .ICACHE_BEAT_BITS(ICACHE_BEAT_BITS),
   .ICACHE_NUM_WAYS(ICACHE_NUM_WAYS),
   .ICACHE_BANK_BITS(ICACHE_BANK_BITS),
   .ICACHE_BEAT_ADDR_HI(ICACHE_BEAT_ADDR_HI),
   .ICACHE_BANKS_WAY(ICACHE_BANKS_WAY),
   .ICACHE_INDEX_HI(ICACHE_INDEX_HI),
   .ICACHE_BANK_HI(ICACHE_BANK_HI),
   .ICACHE_BANK_LO(ICACHE_BANK_LO),
   .ICACHE_TAG_LO(ICACHE_TAG_LO),
   .ICACHE_DATA_INDEX_LO(ICACHE_DATA_INDEX_LO),
   .ICACHE_ECC(ICACHE_ECC),
   .ICACHE_TAG_DEPTH(ICACHE_TAG_DEPTH),
   .ICACHE_WAYPACK(ICACHE_WAYPACK),
   .ICACHE_TAG_INDEX_LO(ICACHE_TAG_INDEX_LO),
   .ICACHE_DATA_DEPTH(ICACHE_DATA_DEPTH)) ic_tag_inst
          (
           .*,
           .ic_wr_en     (ic_wr_en[ICACHE_NUM_WAYS-1:0]),
           .ic_debug_addr(ic_debug_addr[ICACHE_INDEX_HI:3]),
           .ic_rw_addr   (ic_rw_addr[31:3])
           ) ;

   IC_DATA #(
   .ICACHE_BEAT_BITS(ICACHE_BEAT_BITS),
   .ICACHE_NUM_WAYS(ICACHE_NUM_WAYS),
   .ICACHE_BANK_BITS(ICACHE_BANK_BITS),
   .ICACHE_BEAT_ADDR_HI(ICACHE_BEAT_ADDR_HI),
   .ICACHE_BANKS_WAY(ICACHE_BANKS_WAY),
   .ICACHE_INDEX_HI(ICACHE_INDEX_HI),
   .ICACHE_BANK_HI(ICACHE_BANK_HI),
   .ICACHE_BANK_LO(ICACHE_BANK_LO),
   .ICACHE_TAG_LO(ICACHE_TAG_LO),
   .ICACHE_DATA_INDEX_LO(ICACHE_DATA_INDEX_LO),
   .ICACHE_ECC(ICACHE_ECC),
   .ICACHE_TAG_DEPTH(ICACHE_TAG_DEPTH),
   .ICACHE_WAYPACK(ICACHE_WAYPACK),
   .ICACHE_TAG_INDEX_LO(ICACHE_TAG_INDEX_LO),
   .ICACHE_DATA_DEPTH(ICACHE_DATA_DEPTH)) ic_data_inst
          (
           .*,
           .ic_wr_en     (ic_wr_en[ICACHE_NUM_WAYS-1:0]),
           .ic_debug_addr(ic_debug_addr[ICACHE_INDEX_HI:3]),
           .ic_rw_addr   (ic_rw_addr[ICACHE_INDEX_HI:1])
           ) ;

 endmodule


/////////////////////////////////////////////////
////// ICACHE DATA MODULE    ////////////////////
/////////////////////////////////////////////////
module IC_DATA
#(
   parameter ICACHE_BEAT_BITS,
   parameter ICACHE_NUM_WAYS,
   parameter ICACHE_BANK_BITS,
   parameter ICACHE_BEAT_ADDR_HI,
   parameter ICACHE_BANKS_WAY,
   parameter ICACHE_INDEX_HI,
   parameter ICACHE_BANK_HI,
   parameter ICACHE_BANK_LO,
   parameter ICACHE_TAG_LO,
   parameter ICACHE_DATA_INDEX_LO,
   parameter ICACHE_ECC,
   parameter ICACHE_TAG_DEPTH,
   parameter ICACHE_WAYPACK,
   parameter ICACHE_TAG_INDEX_LO,
   parameter ICACHE_DATA_DEPTH )
     (
      input logic clk,
      input logic rst_l,
      input logic clk_override,

      input logic [ICACHE_INDEX_HI:1]  ic_rw_addr,
      input logic [ICACHE_NUM_WAYS-1:0]ic_wr_en,
      input logic                          ic_rd_en,           // Read enable

      input  logic [ICACHE_BANKS_WAY-1:0][70:0]    ic_wr_data,         // Data to fill to the Icache. With ECC
      output logic [63:0]                             ic_rd_data ,                                 // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
      input  logic [70:0]                             ic_debug_wr_data,   // Debug wr cache.
      output logic [70:0]                             ic_debug_rd_data ,  // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
      output logic [ICACHE_BANKS_WAY-1:0] ic_parerr,
      output logic [ICACHE_BANKS_WAY-1:0] ic_eccerr,    // ecc error per bank
      input logic [ICACHE_INDEX_HI:3]     ic_debug_addr,     // Read/Write addresss to the Icache.
      input logic                            ic_debug_rd_en,      // Icache debug rd
      input logic                            ic_debug_wr_en,      // Icache debug wr
      input logic                            ic_debug_tag_array,  // Debug tag array
      input logic [ICACHE_NUM_WAYS-1:0]   ic_debug_way,        // Debug way. Rd or Wr.
      input logic [63:0]                     ic_premux_data,      // Premux data to be muxed with each way of the Icache.
      input logic                            ic_sel_premux_data,  // Select the pre_muxed data

      input logic [ICACHE_NUM_WAYS-1:0]ic_rd_hit,
      input  logic                         scan_mode

      ) ;

   logic [ICACHE_TAG_INDEX_LO-1:1]                                             ic_rw_addr_ff;
   logic [ICACHE_BANKS_WAY-1:0][ICACHE_NUM_WAYS-1:0]                        ic_b_sb_wren;    //bank x ways
   logic [ICACHE_BANKS_WAY-1:0][ICACHE_NUM_WAYS-1:0]                        ic_b_sb_rden;    //bank x ways
   logic [ICACHE_BANKS_WAY-1:0]                                                ic_b_rden;       //bank
   logic [ICACHE_BANKS_WAY-1:0]                                                ic_b_rden_ff;    //bank
   logic [ICACHE_BANKS_WAY-1:0]                                                ic_debug_sel_sb;

   logic [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0][70:0]                  wb_dout ;       //  ways x bank
   logic [ICACHE_BANKS_WAY-1:0][70:0]                                          ic_sb_wr_data, ic_bank_wr_data, wb_dout_ecc_bank;
   logic [ICACHE_NUM_WAYS-1:0] [141:0]                                         wb_dout_way_pre;
   logic [ICACHE_NUM_WAYS-1:0] [63:0]                                          wb_dout_way, wb_dout_way_with_premux;
   logic [141:0]                                                                  wb_dout_ecc;

   logic [ICACHE_BANKS_WAY-1:0]                                                bank_check_en;

   logic [ICACHE_BANKS_WAY-1:0][ICACHE_NUM_WAYS-1:0]                        ic_bank_way_clken;  // ;
   logic [ICACHE_NUM_WAYS-1:0]                                                 ic_debug_rd_way_en;    // debug wr_way
   logic [ICACHE_NUM_WAYS-1:0]                                                 ic_debug_rd_way_en_ff; // debug wr_way
   logic [ICACHE_NUM_WAYS-1:0]                                                 ic_debug_wr_way_en;    // debug wr_way
   logic [ICACHE_INDEX_HI:1]                                                   ic_rw_addr_q;
   logic [ICACHE_BANKS_WAY-1:0] [ICACHE_INDEX_HI : ICACHE_DATA_INDEX_LO] ic_rw_addr_bank_q;
   logic [ICACHE_TAG_LO-1 : ICACHE_DATA_INDEX_LO]                           ic_rw_addr_q_inc;
   logic [ICACHE_NUM_WAYS-1:0]                                                 ic_rd_hit_q;

   logic                                                                          ic_rd_en_with_debug;
   logic                                                                          ic_rw_addr_wrap, ic_cacheline_wrap_ff;
   logic                                                                          ic_debug_rd_en_ff;


//-----------------------------------------------------------
// ----------- Logic section starts here --------------------
//-----------------------------------------------------------
   assign  ic_debug_rd_way_en[ICACHE_NUM_WAYS-1:0] =  {ICACHE_NUM_WAYS{ic_debug_rd_en & ~ic_debug_tag_array}} & ic_debug_way[ICACHE_NUM_WAYS-1:0] ;
   assign  ic_debug_wr_way_en[ICACHE_NUM_WAYS-1:0] =  {ICACHE_NUM_WAYS{ic_debug_wr_en & ~ic_debug_tag_array}} & ic_debug_way[ICACHE_NUM_WAYS-1:0] ;

   always_comb begin : clkens
      ic_bank_way_clken  = '0;

      for ( int i=0; i<ICACHE_BANKS_WAY; i++) begin: wr_ens
       ic_b_sb_wren[i]        =  ic_wr_en[ICACHE_NUM_WAYS-1:0]  |
                                       (ic_debug_wr_way_en[ICACHE_NUM_WAYS-1:0] & {ICACHE_NUM_WAYS{ic_debug_addr[ICACHE_BANK_HI : ICACHE_BANK_LO] == i}}) ;
       ic_debug_sel_sb[i]     = (ic_debug_addr[ICACHE_BANK_HI : ICACHE_BANK_LO] == i );
       ic_sb_wr_data[i]       = (ic_debug_sel_sb[i] & ic_debug_wr_en) ? ic_debug_wr_data : ic_bank_wr_data[i] ;
       ic_b_rden[i]           =  ic_rd_en_with_debug & ( ( ~ic_rw_addr_q[ICACHE_BANK_HI] & (i==0)) |
                                                         (( ic_rw_addr_q[ICACHE_BANK_HI] & ic_rw_addr_q[2:1] == 2'b11) & (i==0)) |
                                                         (  ic_rw_addr_q[ICACHE_BANK_HI] & (i==1)) |
                                                         ((~ic_rw_addr_q[ICACHE_BANK_HI] & ic_rw_addr_q[2:1] == 2'b11) & (i==1)) ) ;



       ic_b_sb_rden[i]        =  {ICACHE_NUM_WAYS{ic_b_rden[i]}}   ;

       for ( int j=0; j<ICACHE_NUM_WAYS; j++) begin: way_clkens
         ic_bank_way_clken[i][j] |= ic_b_sb_rden[i][j] | clk_override | ic_b_sb_wren[i][j];
       end
     end // block: wr_ens
   end // block: clkens

// bank read enables
  assign ic_rd_en_with_debug                          = (ic_rd_en   | ic_debug_rd_en ) & ~(|ic_wr_en);
  assign ic_rw_addr_q[ICACHE_INDEX_HI:1] = (ic_debug_rd_en | ic_debug_wr_en) ?
                                              {ic_debug_addr[ICACHE_INDEX_HI:3],2'b0} :
                                              ic_rw_addr[ICACHE_INDEX_HI:1] ;

   assign ic_rw_addr_q_inc[ICACHE_TAG_LO-1:ICACHE_DATA_INDEX_LO] = ic_rw_addr_q[ICACHE_TAG_LO-1 : ICACHE_DATA_INDEX_LO] + 1 ;
   assign ic_rw_addr_wrap                                        = ic_rw_addr_q[ICACHE_BANK_HI] & (ic_rw_addr_q[2:1] == 2'b11) & ic_rd_en_with_debug & ~(|ic_wr_en[ICACHE_NUM_WAYS-1:0]);
   assign ic_cacheline_wrap_ff                                   = ic_rw_addr_ff[ICACHE_TAG_INDEX_LO-1:ICACHE_BANK_LO] == {(ICACHE_TAG_INDEX_LO - ICACHE_BANK_LO){1'b1}};


   assign ic_rw_addr_bank_q[0] = ~ic_rw_addr_wrap ? ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO] : {ic_rw_addr_q[ICACHE_INDEX_HI: ICACHE_TAG_INDEX_LO] , ic_rw_addr_q_inc[ICACHE_TAG_INDEX_LO-1: ICACHE_DATA_INDEX_LO] } ;
   assign ic_rw_addr_bank_q[1] = ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO];


   rvdff #((ICACHE_BANKS_WAY )) rd_b_en_ff (.*,
                    .din ({ic_b_rden[ICACHE_BANKS_WAY-1:0]}),
                    .dout({ic_b_rden_ff[ICACHE_BANKS_WAY-1:0]})) ;


   rvdff #((ICACHE_TAG_INDEX_LO - 1)) adr_ff (.*,
                    .din ({ic_rw_addr_q[ICACHE_TAG_INDEX_LO-1:1]}),
                    .dout({ic_rw_addr_ff[ICACHE_TAG_INDEX_LO-1:1]}));

   rvdff #(1+ICACHE_NUM_WAYS) debug_rd_wy_ff (.*,
                    .din ({ic_debug_rd_way_en[ICACHE_NUM_WAYS-1:0], ic_debug_rd_en}),
                    .dout({ic_debug_rd_way_en_ff[ICACHE_NUM_WAYS-1:0], ic_debug_rd_en_ff}));

 if (ICACHE_WAYPACK == 0 ) begin : PACKED_0
   for (genvar i=0; i<32'(ICACHE_NUM_WAYS); i++) begin: WAYS
      // rvclkhdr bank_way_c1_cgc  ( .en(ic_bank_way_clken[i]), .l1clk(ic_bank_way_clk[i]), .* );
      for (genvar k=0; k<32'(ICACHE_BANKS_WAY); k++) begin: BANKS_WAY   // 16B subbank
      if (ICACHE_ECC) begin : ECC1
        if ($clog2(ICACHE_DATA_DEPTH) == 13 )   begin : size_8192
           ram_8192x71 ic_bank_sb_way_data (
                                     .CLK(clk),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .ME (ic_bank_way_clken[k][i])
                                    );
        end

        else if ($clog2(ICACHE_DATA_DEPTH) == 12 )   begin : size_4096
           ram_4096x71 ic_bank_sb_way_data (
                                     .CLK(clk),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .ME (ic_bank_way_clken[k][i])
                                    );
        end

        else if ($clog2(ICACHE_DATA_DEPTH) == 11 ) begin : size_2048
           ram_2048x71 ic_bank_sb_way_data (
                                     .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .CLK (clk)
                                    );
        end // if ($clog2(ICACHE_DATA_DEPTH) == 11 )

        else if ( $clog2(ICACHE_DATA_DEPTH) == 10 ) begin : size_1024
           ram_1024x71 ic_bank_sb_way_data (
                                     .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .CLK (clk)
                                    );
        end // if ( $clog2(ICACHE_DATA_DEPTH) == 10 )

         else if ( $clog2(ICACHE_DATA_DEPTH) == 9 ) begin : size_512
           ram_512x71 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .CLK (clk)
                                    );
         end // if ( $clog2(ICACHE_DATA_DEPTH) == 9 )

         else if ( $clog2(ICACHE_DATA_DEPTH) == 8 ) begin : size_256
           ram_256x71 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .CLK (clk)
                                    );
         end // if ( $clog2(ICACHE_DATA_DEPTH) == 8 )

         else if ( $clog2(ICACHE_DATA_DEPTH) == 7 ) begin : size_128
           ram_128x71 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .CLK (clk)
                                    );
         end // if ( $clog2(ICACHE_DATA_DEPTH) == 7 )

         else  begin : size_64
           ram_64x71 ic_bank_sb_way_data (
                                     .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][70:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k]),
                                     .CLK (clk)
                                    );
         end // block: icache_6
      end // if (ICACHE_ECC)

     else  begin  : ECC0
        if ($clog2(ICACHE_DATA_DEPTH) == 13 ) begin : size_8192
           ram_8192x68 ic_bank_sb_way_data (
                                     .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0] ),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
        end // if ($clog2(ICACHE_DATA_DEPTH) == 13 )

        else if ($clog2(ICACHE_DATA_DEPTH) == 12 ) begin : size_4096
           ram_4096x68 ic_bank_sb_way_data (
                                     .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
        end // if ($clog2(ICACHE_DATA_DEPTH) == 12 )

        else if ($clog2(ICACHE_DATA_DEPTH) == 11 ) begin : size_2048
           ram_2048x68 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
        end // if ($clog2(ICACHE_DATA_DEPTH) == 11 )

        else if ( $clog2(ICACHE_DATA_DEPTH) == 10 ) begin : size_1024
           ram_1024x68 ic_bank_sb_way_data (.ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
        end // if ( $clog2(ICACHE_DATA_DEPTH) == 10 )


         else if ( $clog2(ICACHE_DATA_DEPTH) == 9 ) begin : size_512
           ram_512x68 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
         end
         else if ( $clog2(ICACHE_DATA_DEPTH) == 8 ) begin : size_256
           ram_256x68 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
         end
         else if ( $clog2(ICACHE_DATA_DEPTH) == 7 ) begin : size_128
           ram_128x68 ic_bank_sb_way_data ( .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
         end // if ( $clog2(ICACHE_DATA_DEPTH) == 7 )

         else  begin : size_64
           ram_64x68 ic_bank_sb_way_data (
                                     .ME(ic_bank_way_clken[k][i]),
                                     .WE (ic_b_sb_wren[k][i]),
                                     .D  (ic_sb_wr_data[k][67:0]),
                                     .ADR(ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q  (wb_dout[i][k][67:0]),
                                     .CLK (clk)
                                    );
         end // block: size_64
      end // else: !if(ICACHE_ECC)
      end // block: BANKS_WAY
   end // block: WAYS

 end // block: PACKED_0

 // WAY PACKED
 else begin : PACKED_1
  for (genvar k=0; k<ICACHE_BANKS_WAY; k++) begin: BANKS_WAY   // 16B subbank
     if (ICACHE_ECC) begin : ECC1
        logic [ICACHE_BANKS_WAY-1:0] [(71*ICACHE_NUM_WAYS)-1 :0]   wb_packeddout, ic_b_sb_bit_en_vec;           // data and its bit enables
        for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin: BITEN
           assign ic_b_sb_bit_en_vec[k][(71*i)+70:71*i] = {71{ic_b_sb_wren[k][i]}};
        end
        if ($clog2(ICACHE_DATA_DEPTH) == 13 )   begin : size_8192
           if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_8192x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS

           else   begin : WAYS
                             ram_be_8192x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_8192



        else if ($clog2(ICACHE_DATA_DEPTH) == 12 )   begin : size_4096
           if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_4096x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_4096x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_4096


        else if ($clog2(ICACHE_DATA_DEPTH) == 11 ) begin : size_2048
           if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_2048x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_2048x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_2048

        else if ( $clog2(ICACHE_DATA_DEPTH) == 10 ) begin : size_1024
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_1024x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_1024x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_1024

        else if ( $clog2(ICACHE_DATA_DEPTH) == 9 ) begin : size_512
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_512x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_512x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_512

        else if ( $clog2(ICACHE_DATA_DEPTH) == 8 ) begin : size_256
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_256x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_256x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_256

        else if ( $clog2(ICACHE_DATA_DEPTH) == 7 ) begin : size_128
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_128x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_128x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_128

        else  begin : size_64
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_64x284 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_64x142 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 284 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][70:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_64


       for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin: WAYS
          assign wb_dout[i][k][70:0]  = wb_packeddout[k][(71*i)+70:71*i];
       end : WAYS

       end // if (ICACHE_ECC)


     else  begin  : ECC0
        logic [ICACHE_BANKS_WAY-1:0] [(68*ICACHE_NUM_WAYS)-1 :0]   wb_packeddout, ic_b_sb_bit_en_vec;           // data and its bit enables
        for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin: BITEN
           assign ic_b_sb_bit_en_vec[k][(68*i)+67:68*i] = {68{ic_b_sb_wren[k][i]}};
        end
        if ($clog2(ICACHE_DATA_DEPTH) == 13 )   begin : size_8192
           if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_8192x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                             ram_be_8192x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_8192



        else if ($clog2(ICACHE_DATA_DEPTH) == 12 )   begin : size_4096
           if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_4096x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_4096x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_4096


        else if ($clog2(ICACHE_DATA_DEPTH) == 11 ) begin : size_2048
           if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_2048x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_2048x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_2048

        else if ( $clog2(ICACHE_DATA_DEPTH) == 10 ) begin : size_1024
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_1024x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_1024x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_1024

        else if ( $clog2(ICACHE_DATA_DEPTH) == 9 ) begin : size_512
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_512x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_512x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_512

        else if ( $clog2(ICACHE_DATA_DEPTH) == 8 ) begin : size_256
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_256x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_256x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_256

        else if ( $clog2(ICACHE_DATA_DEPTH) == 7 ) begin : size_128
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_128x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_128x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_128

        else  begin : size_64
                   if (ICACHE_NUM_WAYS == 4) begin : WAYS
                     ram_be_64x272 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
           else   begin : WAYS
                     ram_be_64x136 ic_bank_sb_way_data (
                                     .CLK   (clk),
                                     .WE    (|ic_b_sb_wren[k]),                                                    // OR of all the ways in the bank
                                     .WEM   (ic_b_sb_bit_en_vec[k]),                                               // 272 bits of bit enables
                                     .D     ({ICACHE_NUM_WAYS{ic_sb_wr_data[k][67:0]}}),
                                     .ADR   (ic_rw_addr_bank_q[k][ICACHE_INDEX_HI:ICACHE_DATA_INDEX_LO]),
                                     .Q     (wb_packeddout[k]),
                                     .ME    (|ic_bank_way_clken[k])
                                    );
           end // block: WAYS
        end // block: size_64

       for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin: WAYS
          assign wb_dout[i][k][67:0]  = wb_packeddout[k][(68*i)+67:68*i];
       end
     end // block: ECC0
     end // block: BANKS_WAY
 end // block: PACKED_1


   assign ic_rd_hit_q[ICACHE_NUM_WAYS-1:0] = ic_debug_rd_en_ff ? ic_debug_rd_way_en_ff[ICACHE_NUM_WAYS-1:0] : ic_rd_hit[ICACHE_NUM_WAYS-1:0] ;


 if ( ICACHE_ECC ) begin : ECC1_MUX

   assign ic_bank_wr_data[1] = ic_wr_data[1][70:0];
   assign ic_bank_wr_data[0] = ic_wr_data[0][70:0];

    always_comb begin : rd_mux
      wb_dout_way_pre[ICACHE_NUM_WAYS-1:0] = '0;

      for ( int i=0; i<ICACHE_NUM_WAYS; i++) begin : num_ways
        for ( int j=0; j<ICACHE_BANKS_WAY; j++) begin : banks
         wb_dout_way_pre[i][70:0]      |=  ({71{(ic_rw_addr_ff[ICACHE_BANK_HI : ICACHE_BANK_LO] == (ICACHE_BANK_BITS)'(j))}}   &  wb_dout[i][j]);
         wb_dout_way_pre[i][141 : 71]  |=  ({71{(ic_rw_addr_ff[ICACHE_BANK_HI : ICACHE_BANK_LO] == (ICACHE_BANK_BITS)'(j-1))}} &  wb_dout[i][j]);
        end
      end
    end

    for ( genvar i=0; i<32'(ICACHE_NUM_WAYS); i++) begin : num_ways_mux1
      assign wb_dout_way[i][63:0] = (ic_rw_addr_ff[2:1] == 2'b00) ? wb_dout_way_pre[i][63:0]   :
                                    (ic_rw_addr_ff[2:1] == 2'b01) ?{wb_dout_way_pre[i][86:71], wb_dout_way_pre[i][63:16]} :
                                    (ic_rw_addr_ff[2:1] == 2'b10) ?{wb_dout_way_pre[i][102:71],wb_dout_way_pre[i][63:32]} :
                                                                   {wb_dout_way_pre[i][119:71],wb_dout_way_pre[i][63:48]};

      assign wb_dout_way_with_premux[i][63:0]  =  ic_sel_premux_data ? ic_premux_data[63:0] : wb_dout_way[i][63:0] ;
   end

   always_comb begin : rd_out
      ic_debug_rd_data[70:0]     = '0;
      ic_rd_data[63:0]           = '0;
      wb_dout_ecc[141:0]         = '0;
      for ( int i=0; i<32'(ICACHE_NUM_WAYS); i++) begin : num_ways_mux2
         ic_rd_data[63:0]       |= ({64{ic_rd_hit_q[i] | ic_sel_premux_data}}) &  wb_dout_way_with_premux[i][63:0];
         ic_debug_rd_data[70:0] |= ({71{ic_rd_hit_q[i]}}) & wb_dout_way_pre[i][70:0];
         wb_dout_ecc[141:0]     |= {142{ic_rd_hit_q[i]}}  & wb_dout_way_pre[i];
      end
   end


 for (genvar i=0; i < 32'(ICACHE_BANKS_WAY) ; i++) begin : ic_ecc_error
    assign bank_check_en[i]    = |ic_rd_hit[ICACHE_NUM_WAYS-1:0] & ((i==0) | (~ic_cacheline_wrap_ff & (ic_b_rden_ff[ICACHE_BANKS_WAY-1:0] == {ICACHE_BANKS_WAY{1'b1}})));  // always check the lower address bank, and drop the upper address bank on a CL wrap
    assign wb_dout_ecc_bank[i] = wb_dout_ecc[(71*i)+70:(71*i)];

   rvecc_decode_64  ecc_decode_64 (
                           .en               (bank_check_en[i]),
                           .din              (wb_dout_ecc_bank[i][63 : 0]),                  // [134:71],  [63:0]
                           .ecc_in           (wb_dout_ecc_bank[i][70 : 64]),               // [141:135] [70:64]
                           .ecc_error        (ic_eccerr[i]));

   // or the sb and db error detects into 1 signal called aligndataperr[i] where i corresponds to 2B position
  assign  ic_parerr[i]  = '0 ;
  end // block: ic_ecc_error

end // if ( ICACHE_ECC )

else  begin : ECC0_MUX
   assign ic_bank_wr_data[1][67:0] = ic_wr_data[1][67:0];
   assign ic_bank_wr_data[0][67:0] = ic_wr_data[0][67:0];

   always_comb begin : rd_mux
      wb_dout_way_pre[ICACHE_NUM_WAYS-1:0] = '0;

   for ( int i=0; i<ICACHE_NUM_WAYS; i++) begin : num_ways
     for ( int j=0; j<ICACHE_BANKS_WAY; j++) begin : banks
         wb_dout_way_pre[i][67:0]         |=  ({68{(ic_rw_addr_ff[ICACHE_BANK_HI : ICACHE_BANK_LO] == (ICACHE_BANK_BITS)'(j))}}   &  wb_dout[i][j]);
         wb_dout_way_pre[i][135 : 68]     |=  ({68{(ic_rw_addr_ff[ICACHE_BANK_HI : ICACHE_BANK_LO] == (ICACHE_BANK_BITS)'(j-1))}} &  wb_dout[i][j]);
      end
     end
   end
   // When we straddle the banks like this - the ECC we capture is not correct ??
   for ( genvar i=0; i<ICACHE_NUM_WAYS; i++) begin : num_ways_mux1
      assign wb_dout_way[i][63:0] = (ic_rw_addr_ff[2:1] == 2'b00) ? wb_dout_way_pre[i][63:0]   :
                                    (ic_rw_addr_ff[2:1] == 2'b01) ?{wb_dout_way_pre[i][83:68],  wb_dout_way_pre[i][63:16]} :
                                    (ic_rw_addr_ff[2:1] == 2'b10) ?{wb_dout_way_pre[i][99:68],  wb_dout_way_pre[i][63:32]} :
                                                                   {wb_dout_way_pre[i][115:68], wb_dout_way_pre[i][63:48]};

      assign wb_dout_way_with_premux[i][63:0]      =  ic_sel_premux_data ? ic_premux_data[63:0]  : wb_dout_way[i][63:0] ;
   end

   always_comb begin : rd_out
      ic_rd_data[63:0]   = '0;
      ic_debug_rd_data[70:0]   = '0;
      wb_dout_ecc[135:0] = '0;

      for ( int i=0; i<ICACHE_NUM_WAYS; i++) begin : num_ways_mux2
         ic_rd_data[63:0]   |= ({64{ic_rd_hit_q[i] | ic_sel_premux_data}} &  wb_dout_way_with_premux[i][63:0]);
         ic_debug_rd_data[70:0] |= ({71{ic_rd_hit_q[i]}}) & {4'b0,wb_dout_way_pre[i][67:0]};
         wb_dout_ecc[135:0] |= {136{ic_rd_hit_q[i]}}  & wb_dout_way_pre[i];
      end
   end

   assign wb_dout_ecc_bank[0] =  wb_dout_ecc[67:0];
   assign wb_dout_ecc_bank[1] =  wb_dout_ecc[135:68];

   logic [ICACHE_BANKS_WAY-1:0][3:0] ic_parerr_bank;

  for (genvar i=0; i < ICACHE_BANKS_WAY ; i++) begin : ic_par_error
    assign bank_check_en[i]    = |ic_rd_hit[ICACHE_NUM_WAYS-1:0] & ((i==0) | (~ic_cacheline_wrap_ff & (ic_b_rden_ff[ICACHE_BANKS_WAY-1:0] == {ICACHE_BANKS_WAY{1'b1}})));  // always check the lower address bank, and drop the upper address bank on a CL wrap
     for (genvar j=0; j<4; j++)  begin : parity
      rveven_paritycheck pchk (
                           .data_in   (wb_dout_ecc_bank[i][16*(j+1)-1: 16*j]),
                           .parity_in (wb_dout_ecc_bank[i][64+j]),
                           .parity_err(ic_parerr_bank[i][j] )
                           );
        end
     assign ic_eccerr [i] = '0 ;
  end

     assign ic_parerr[1] = (|ic_parerr_bank[1][3:0]) & bank_check_en[1];
     assign ic_parerr[0] = (|ic_parerr_bank[0][3:0]) & bank_check_en[0];

end // else: !if( ICACHE_ECC )


endmodule // EL2_IC_DATA

//=============================================================================================================================================================
///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ END OF IC DATA MODULE \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//=============================================================================================================================================================

/////////////////////////////////////////////////
////// ICACHE TAG MODULE     ////////////////////
/////////////////////////////////////////////////
module IC_TAG
 #(
   parameter ICACHE_BEAT_BITS,
   parameter ICACHE_NUM_WAYS,
   parameter ICACHE_BANK_BITS,
   parameter ICACHE_BEAT_ADDR_HI,
   parameter ICACHE_BANKS_WAY,
   parameter ICACHE_INDEX_HI,
   parameter ICACHE_BANK_HI,
   parameter ICACHE_BANK_LO,
   parameter ICACHE_TAG_LO,
   parameter ICACHE_DATA_INDEX_LO,
   parameter ICACHE_ECC,
   parameter ICACHE_TAG_DEPTH,
   parameter ICACHE_WAYPACK,
   parameter ICACHE_TAG_INDEX_LO,
   parameter ICACHE_DATA_DEPTH )
     (
      input logic                                                   clk,
      input logic                                                   rst_l,
      input logic                                                   clk_override,
      input logic                                                   dec_tlu_core_ecc_disable,

      input logic [31:3]                                            ic_rw_addr,

      input logic [ICACHE_NUM_WAYS-1:0]                         ic_wr_en,             // way
      input logic [ICACHE_NUM_WAYS-1:0]                         ic_tag_valid,
      input logic                                                  ic_rd_en,

      input logic [ICACHE_INDEX_HI:3]                           ic_debug_addr,        // Read/Write addresss to the Icache.
      input logic                                                  ic_debug_rd_en,       // Icache debug rd
      input logic                                                  ic_debug_wr_en,       // Icache debug wr
      input logic                                                  ic_debug_tag_array,   // Debug tag array
      input logic [ICACHE_NUM_WAYS-1:0]                         ic_debug_way,         // Debug way. Rd or Wr.

      output logic [25:0]                                          ictag_debug_rd_data,
      input  logic [70:0]                                          ic_debug_wr_data,     // Debug wr cache.

      output logic [ICACHE_NUM_WAYS-1:0]                        ic_rd_hit,
      output logic                                                 ic_tag_perr,
      input  logic                                                 scan_mode
   ) ;


   logic [ICACHE_NUM_WAYS-1:0] [25:0]                           ic_tag_data_raw;
   logic [ICACHE_NUM_WAYS-1:0] [36:ICACHE_TAG_LO]            w_tout;
   logic [25:0]                                                    ic_tag_wr_data ;
   logic [ICACHE_NUM_WAYS-1:0] [31:0]                           ic_tag_corrected_data_unc;
   logic [ICACHE_NUM_WAYS-1:0] [06:0]                           ic_tag_corrected_ecc_unc;
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_tag_single_ecc_error;
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_tag_double_ecc_error;
   logic [6:0]                                                     ic_tag_ecc;

   logic [ICACHE_NUM_WAYS-1:0]                                  ic_tag_way_perr ;
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_debug_rd_way_en ;
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_debug_rd_way_en_ff ;

   logic [ICACHE_INDEX_HI: ICACHE_TAG_INDEX_LO]              ic_rw_addr_q;
   logic [31:ICACHE_TAG_LO]                                     ic_rw_addr_ff;
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_tag_wren;          // way
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_tag_wren_q;        // way
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_tag_clken;
   logic [ICACHE_NUM_WAYS-1:0]                                  ic_debug_wr_way_en;   // debug wr_way
   logic                                                           ic_rd_en_ff;
   logic                                                           ic_tag_parity;

   assign  ic_tag_wren [ICACHE_NUM_WAYS-1:0]  = ic_wr_en[ICACHE_NUM_WAYS-1:0] & {ICACHE_NUM_WAYS{(ic_rw_addr[ICACHE_BEAT_ADDR_HI:4] == {ICACHE_BEAT_BITS-1{1'b1}})}} ;
   assign  ic_tag_clken[ICACHE_NUM_WAYS-1:0]  = {ICACHE_NUM_WAYS{ic_rd_en | clk_override}} | ic_wr_en[ICACHE_NUM_WAYS-1:0] | ic_debug_wr_way_en[ICACHE_NUM_WAYS-1:0] | ic_debug_rd_way_en[ICACHE_NUM_WAYS-1:0];

   rvdff #(1) rd_en_ff (.*,
                    .din (ic_rd_en),
                    .dout(ic_rd_en_ff)) ;


   rvdff #(32-ICACHE_TAG_LO) adr_ff (.*,
                    .din ({ic_rw_addr[31:ICACHE_TAG_LO]}),
                    .dout({ic_rw_addr_ff[31:ICACHE_TAG_LO]}));

   localparam PAD_BITS = 21 - (32 - ICACHE_TAG_LO);  // sizing for a max tag width.

   // tags
   assign  ic_debug_rd_way_en[ICACHE_NUM_WAYS-1:0] =  {ICACHE_NUM_WAYS{ic_debug_rd_en & ic_debug_tag_array}} & ic_debug_way[ICACHE_NUM_WAYS-1:0] ;
   assign  ic_debug_wr_way_en[ICACHE_NUM_WAYS-1:0] =  {ICACHE_NUM_WAYS{ic_debug_wr_en & ic_debug_tag_array}} & ic_debug_way[ICACHE_NUM_WAYS-1:0] ;

   assign  ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]  =  ic_tag_wren[ICACHE_NUM_WAYS-1:0]          |
                                  ic_debug_wr_way_en[ICACHE_NUM_WAYS-1:0]   ;

if (ICACHE_TAG_LO == 11) begin: SMALLEST
 if (ICACHE_ECC) begin : ECC1_W
           rvecc_encode  tag_ecc_encode (
                                  .din    ({{ICACHE_TAG_LO{1'b0}}, ic_rw_addr[31:ICACHE_TAG_LO]}),
                                  .ecc_out({ ic_tag_ecc[6:0]}));

   assign  ic_tag_wr_data[25:0] = (ic_debug_wr_en & ic_debug_tag_array) ?
                                  {ic_debug_wr_data[68:64], ic_debug_wr_data[31:11]} :
                                  {ic_tag_ecc[4:0], ic_rw_addr[31:ICACHE_TAG_LO]} ;
 end

 else begin : ECC0_W
           rveven_paritygen #(32-ICACHE_TAG_LO) pargen  (.data_in   (ic_rw_addr[31:ICACHE_TAG_LO]),
                                                 .parity_out(ic_tag_parity));

   assign  ic_tag_wr_data[21:0] = (ic_debug_wr_en & ic_debug_tag_array) ?
                                  {ic_debug_wr_data[64], ic_debug_wr_data[31:11]} :
                                  {ic_tag_parity, ic_rw_addr[31:ICACHE_TAG_LO]} ;
 end // else: !if(ICACHE_ECC)

end // block: SMALLEST


else begin: OTHERS
  if(ICACHE_ECC) begin :ECC1_W
           rvecc_encode  tag_ecc_encode (
                                  .din    ({{ICACHE_TAG_LO{1'b0}}, ic_rw_addr[31:ICACHE_TAG_LO]}),
                                  .ecc_out({ ic_tag_ecc[6:0]}));

   assign  ic_tag_wr_data[25:0] = (ic_debug_wr_en & ic_debug_tag_array) ?
                                  {ic_debug_wr_data[68:64],ic_debug_wr_data[31:11]} :
                                  {ic_tag_ecc[4:0], {PAD_BITS{1'b0}},ic_rw_addr[31:ICACHE_TAG_LO]} ;

  end
  else  begin :ECC0_W
   logic   ic_tag_parity ;
           rveven_paritygen #(32-ICACHE_TAG_LO) pargen  (.data_in   (ic_rw_addr[31:ICACHE_TAG_LO]),
                                                 .parity_out(ic_tag_parity));
   assign  ic_tag_wr_data[21:0] = (ic_debug_wr_en & ic_debug_tag_array) ?
                                  {ic_debug_wr_data[64], ic_debug_wr_data[31:11]} :
                                  {ic_tag_parity, {PAD_BITS{1'b0}},ic_rw_addr[31:ICACHE_TAG_LO]} ;
  end // else: !if(ICACHE_ECC)

end // block: OTHERS


    assign ic_rw_addr_q[ICACHE_INDEX_HI: ICACHE_TAG_INDEX_LO] = (ic_debug_rd_en | ic_debug_wr_en) ?
                                                ic_debug_addr[ICACHE_INDEX_HI: ICACHE_TAG_INDEX_LO] :
                                                ic_rw_addr[ICACHE_INDEX_HI: ICACHE_TAG_INDEX_LO] ;

   rvdff #(ICACHE_NUM_WAYS) tag_rd_wy_ff (.*,
                    .din ({ic_debug_rd_way_en[ICACHE_NUM_WAYS-1:0]}),
                    .dout({ic_debug_rd_way_en_ff[ICACHE_NUM_WAYS-1:0]}));

 if (ICACHE_WAYPACK == 0 ) begin : PACKED_0

   for (genvar i=0; i<32'(ICACHE_NUM_WAYS); i++) begin: WAYS

   if (ICACHE_ECC) begin  : ECC1
      if (ICACHE_TAG_DEPTH == 32)   begin : size_32
         ram_32x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
      end // if (ICACHE_TAG_DEPTH == 32)
      if (ICACHE_TAG_DEPTH == 64)   begin : size_64
         ram_64x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
      end // if (ICACHE_TAG_DEPTH == 64)
      if (ICACHE_TAG_DEPTH == 128)   begin : size_128
         ram_128x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
      end // if (ICACHE_TAG_DEPTH == 128)
       if (ICACHE_TAG_DEPTH == 256)   begin : size_256
         ram_256x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 256)
       if (ICACHE_TAG_DEPTH == 512)   begin : size_512
         ram_512x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 512)
       if (ICACHE_TAG_DEPTH == 1024)   begin : size_1024
         ram_1024x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 1024)


       if (ICACHE_TAG_DEPTH == 2048)   begin : size_2048
         ram_2048x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 2048)

       if (ICACHE_TAG_DEPTH == 4096)   begin  : size_4096
         ram_4096x26  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[25:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][25:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 4096)

         assign w_tout[i][31:ICACHE_TAG_LO] = ic_tag_data_raw[i][31-ICACHE_TAG_LO:0] ;
         assign w_tout[i][36:32]              = ic_tag_data_raw[i][25:21] ;

         rvecc_decode  ecc_decode (
                           .en(~dec_tlu_core_ecc_disable & ic_rd_en_ff),
                           .sed_ded ( 1'b1 ),    // 1 : means only detection
                           .din({11'b0,ic_tag_data_raw[i][20:0]}),
                           .ecc_in({2'b0, ic_tag_data_raw[i][25:21]}),
                           .dout(ic_tag_corrected_data_unc[i][31:0]),
                           .ecc_out(ic_tag_corrected_ecc_unc[i][6:0]),
                           .single_ecc_error(ic_tag_single_ecc_error[i]),
                           .double_ecc_error(ic_tag_double_ecc_error[i]));

          assign ic_tag_way_perr[i]= ic_tag_single_ecc_error[i] | ic_tag_double_ecc_error[i]  ;
      end
      else  begin : ECC0
          if (ICACHE_TAG_DEPTH == 32)   begin : size_32
                   ram_32x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)
                               );
          end // if (ICACHE_TAG_DEPTH == 32)
          if (ICACHE_TAG_DEPTH == 64)   begin : size_64
                   ram_64x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
          end // if (ICACHE_TAG_DEPTH == 64)
           if (ICACHE_TAG_DEPTH == 128)   begin : size_128
                   ram_128x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
           end // if (ICACHE_TAG_DEPTH == 128)
           if (ICACHE_TAG_DEPTH == 256)   begin : size_256
                   ram_256x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
           end // if (ICACHE_TAG_DEPTH == 256)
           if (ICACHE_TAG_DEPTH == 512)   begin : size_512
                   ram_512x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
           end // if (ICACHE_TAG_DEPTH == 512)
           if (ICACHE_TAG_DEPTH == 1024)   begin : size_1024
                   ram_1024x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
           end // if (ICACHE_TAG_DEPTH == 1024)

       if (ICACHE_TAG_DEPTH == 2048)   begin : size_2048
         ram_2048x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 2048)

       if (ICACHE_TAG_DEPTH == 4096)   begin : size_4096
         ram_4096x22  ic_way_tag (
                                .ME(ic_tag_clken[i]),
                                .WE (ic_tag_wren_q[i]),
                                .D  (ic_tag_wr_data[21:0]),
                                .ADR(ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q  (ic_tag_data_raw[i][21:0]),
                                .CLK (clk)

                               );
       end // if (ICACHE_TAG_DEPTH == 4096)

         assign w_tout[i][31:ICACHE_TAG_LO] = ic_tag_data_raw[i][31-ICACHE_TAG_LO:0] ;
         assign w_tout[i][32]                 = ic_tag_data_raw[i][21] ;

         rveven_paritycheck #(32-ICACHE_TAG_LO) parcheck(.data_in   (w_tout[i][31:ICACHE_TAG_LO]),
                                                   .parity_in (w_tout[i][32]),
                                                   .parity_err(ic_tag_way_perr[i]));
      end // else: !if(ICACHE_ECC)

   end // block: WAYS
 end // block: PACKED_0


 else begin : PACKED_1
    logic [(26*ICACHE_NUM_WAYS)-1 :0]  ic_tag_data_raw_packed, ic_tag_wren_biten_vec;           // data and its bit enables
    for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin: BITEN
        assign ic_tag_wren_biten_vec[(26*i)+25:26*i] = {26{ic_tag_wren_q[i]}};
     end


   if (ICACHE_ECC) begin  : ECC1
      if (ICACHE_TAG_DEPTH == 32)   begin : size_32
        if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_32x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_32x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // if (ICACHE_TAG_DEPTH == 32

      if (ICACHE_TAG_DEPTH == 64)   begin : size_64
        if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_64x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_64x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_64

      if (ICACHE_TAG_DEPTH == 128)   begin : size_128
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_128x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_128x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_128

      if (ICACHE_TAG_DEPTH == 256)   begin : size_256
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_256x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_256x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_256

      if (ICACHE_TAG_DEPTH == 512)   begin : size_512
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_512x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_512x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_512

      if (ICACHE_TAG_DEPTH == 1024)   begin : size_1024
         if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_1024x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_1024x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)
                               );
        end // block: WAYS
      end // block: size_1024

      if (ICACHE_TAG_DEPTH == 2048)   begin : size_2048
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_2048x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_2048x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_2048

      if (ICACHE_TAG_DEPTH == 4096)   begin  : size_4096
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_4096x104  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_4096x52  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(26*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[25:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(26*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_4096

        for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin
          assign ic_tag_data_raw[i]  = ic_tag_data_raw_packed[(26*i)+25:26*i];
          assign w_tout[i][31:ICACHE_TAG_LO] = ic_tag_data_raw[i][31-ICACHE_TAG_LO:0] ;
          assign w_tout[i][36:32]              = ic_tag_data_raw[i][25:21] ;
          rvecc_decode  ecc_decode (
                           .en(~dec_tlu_core_ecc_disable & ic_rd_en_ff),
                           .sed_ded ( 1'b1 ),    // 1 : means only detection
                           .din({11'b0,ic_tag_data_raw[i][20:0]}),
                           .ecc_in({2'b0, ic_tag_data_raw[i][25:21]}),
                           .dout(ic_tag_corrected_data_unc[i][31:0]),
                           .ecc_out(ic_tag_corrected_ecc_unc[i][6:0]),
                           .single_ecc_error(ic_tag_single_ecc_error[i]),
                           .double_ecc_error(ic_tag_double_ecc_error[i]));

          assign ic_tag_way_perr[i]= ic_tag_single_ecc_error[i] | ic_tag_double_ecc_error[i]  ;
     end // for (genvar i=0; i<ICACHE_NUM_WAYS; i++)

   end // block: ECC1


   else  begin : ECC0
      if (ICACHE_TAG_DEPTH == 32)   begin : size_32
        if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_32x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_32x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // if (ICACHE_TAG_DEPTH == 32

      if (ICACHE_TAG_DEPTH == 64)   begin : size_64
        if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_64x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_64x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_64

      if (ICACHE_TAG_DEPTH == 128)   begin : size_128
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_128x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_128x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_128

      if (ICACHE_TAG_DEPTH == 256)   begin : size_256
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_256x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_256x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_256

      if (ICACHE_TAG_DEPTH == 512)   begin : size_512
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_512x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_512x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_512

      if (ICACHE_TAG_DEPTH == 1024)   begin : size_1024
         if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_1024x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_1024x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_1024

      if (ICACHE_TAG_DEPTH == 2048)   begin : size_2048
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_2048x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_2048x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_2048

      if (ICACHE_TAG_DEPTH == 4096)   begin  : size_4096
       if (ICACHE_NUM_WAYS == 4) begin : WAYS
         ram_be_4096x88  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      else begin : WAYS
                  ram_be_4096x44  ic_way_tag (
                                .ME  (|ic_tag_clken[ICACHE_NUM_WAYS-1:0]),
                                .WE  (|ic_tag_wren_q[ICACHE_NUM_WAYS-1:0]),
                                .WEM (ic_tag_wren_biten_vec[(22*ICACHE_NUM_WAYS)-1 :0]),                                               // all bits of bit enables

                                .D   ({ICACHE_NUM_WAYS{ic_tag_wr_data[21:0]}}),
                                .ADR (ic_rw_addr_q[ICACHE_INDEX_HI:ICACHE_TAG_INDEX_LO]),
                                .Q   (ic_tag_data_raw_packed[(22*ICACHE_NUM_WAYS)-1 :0]),
                                .CLK (clk)

                               );
        end // block: WAYS
      end // block: size_4096

      for (genvar i=0; i<ICACHE_NUM_WAYS; i++) begin
          assign ic_tag_data_raw[i]  = ic_tag_data_raw_packed[(22*i)+21:22*i];
          assign w_tout[i][31:ICACHE_TAG_LO] = ic_tag_data_raw[i][31-ICACHE_TAG_LO:0] ;
          assign w_tout[i][32]                 = ic_tag_data_raw[i][21] ;
          rveven_paritycheck #(32-ICACHE_TAG_LO) parcheck(.data_in   (w_tout[i][31:ICACHE_TAG_LO]),
                                                   .parity_in (w_tout[i][32]),
                                                   .parity_err(ic_tag_way_perr[i]));
      end


   end // block: ECC0
 end // block: PACKED_1


   always_comb begin : tag_rd_out
      ic_tag_debug_rd_data[25:0] = '0;
      for ( int j=0; j<ICACHE_NUM_WAYS; j++) begin: debug_rd_out
         ic_tag_debug_rd_data[25:0] |=  ICACHE_ECC ? ({26{ic_debug_rd_way_en_ff[j]}} & ic_tag_data_raw[j] ) : {4'b0, ({22{ic_debug_rd_way_en_ff[j]}} & ic_tag_data_raw[j][21:0])};
      end
   end


   for ( genvar i=0; i<32'(ICACHE_NUM_WAYS); i++) begin : ic_rd_hit_loop
      assign ic_rd_hit[i] = (w_tout[i][31:ICACHE_TAG_LO] == ic_rw_addr_ff[31:ICACHE_TAG_LO]) & ic_tag_valid[i];
   end

   assign  ic_tag_perr  = | (ic_tag_way_perr[ICACHE_NUM_WAYS-1:0] & ic_tag_valid[ICACHE_NUM_WAYS-1:0] ) ;
endmodule // EL2_IC_TAG
