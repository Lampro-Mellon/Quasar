//********************************************************************************
// SPDX-License-Identifier: Apache-2.0
// Copyright 2020 Western Digital Corporation or its affiliates.
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

`include "lsu_dccm_mem.sv"
`include "ifu_ic_mem.sv"
`include "ifu_iccm_mem.sv"
module mem
`include "parameter.sv"
(
   input logic         clk,
   input logic         rst_l,
   input logic         dccm_clk_override,
   input logic         icm_clk_override,
   input logic         dec_tlu_core_ecc_disable,

   //DCCM ports
   input logic         dccm_wren,
   input logic         dccm_rden,
   input logic [DCCM_BITS-1:0]  dccm_wr_addr_lo,
   input logic [DCCM_BITS-1:0]  dccm_wr_addr_hi,
   input logic [DCCM_BITS-1:0]  dccm_rd_addr_lo,
   input logic [DCCM_BITS-1:0]  dccm_rd_addr_hi,
   input logic [DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_lo,
   input logic [DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_hi,


   output logic [DCCM_FDATA_WIDTH-1:0]  dccm_rd_data_lo,
   output logic [DCCM_FDATA_WIDTH-1:0]  dccm_rd_data_hi,

//`ifdef DCCM_ENABLE
   //input dccm_ext_in_pkt_t  [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_TEST1,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_RME,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_RM_0,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_RM_1,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_RM_2,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_RM_3,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_LS,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_DS,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_SD,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_RNM,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_BC1,
   input [DCCM_NUM_BANKS-1:0] dccm_ext_in_pkt_BC2, 

//`endif

   //ICCM ports
   //input ccm_ext_in_pkt_t   [ICCM_NUM_BANKS-1:0]  iccm_ext_in_pkt,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_TEST1,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_RME,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_RM_0,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_RM_1,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_RM_2,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_RM_3,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_LS,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_DS,
      input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_SD,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_RNM,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_BC1,
   input [ICCM_NUM_BANKS-1:0] iccm_ext_in_pkt_BC2, 

   input logic [ICCM_BITS-1:1]  iccm_rw_addr,
   input logic                                        iccm_buf_correct_ecc,                    // ICCM is doing a single bit error correct cycle
   input logic                                        iccm_correction_state,               // ICCM is doing a single bit error correct cycle
   input logic         iccm_wren,
   input logic         iccm_rden,
   input logic [2:0]   iccm_wr_size,
   input logic [77:0]  iccm_wr_data,

   output logic [63:0] iccm_rd_data,
   output logic [77:0] iccm_rd_data_ecc,

   // Icache and Itag Ports

   input  logic [31:1]  ic_rw_addr,
   input  logic [ICACHE_NUM_WAYS-1:0]   ic_tag_valid,
   input  logic [ICACHE_NUM_WAYS-1:0]   ic_wr_en,
   input  logic         ic_rd_en,
   input  logic [63:0] ic_premux_data,      // Premux data to be muxed with each way of the Icache.
   input  logic         ic_sel_premux_data, // Premux data sel
  // input ic_data_ext_in_pkt_t   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt,
     input [ICACHE_BANKS_WAY-1:0]  ic_data_ext_in_pkt_0_TEST1,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_RME,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_RM_0,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_RM_1,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_RM_2,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_RM_3,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_LS,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_DS,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_SD,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_RNM,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_BC1,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_0_BC2, 

      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_TEST1,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_RME,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_RM_0,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_RM_1,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_RM_2,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_RM_3,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_LS,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_DS,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_SD,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_RNM,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_BC1,
      input [ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt_1_BC2, 
   //input ic_tag_ext_in_pkt_t    [ICACHE_NUM_WAYS-1:0]           ic_tag_ext_in_pkt,
   input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_TEST1,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_RME,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_RM_0,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_RM_1,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_RM_2,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_RM_3,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_LS,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_DS,
            input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_SD,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_RNM,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_BC1,
      input [ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt_BC2, 

   // input  logic [ICACHE_BANKS_WAY-1:0][70:0]               ic_wr_data,         // Data to fill to the Icache. With ECC
     input  logic [70:0]  ic_wr_data_0,         // Data to fill to the Icache. With ECC
        input  logic [70:0]  ic_wr_data_1,         // Data to fill to the Icache. With ECC
   input  logic [70:0]               ic_debug_wr_data,   // Debug wr cache.
   output logic [70:0]               ic_debug_rd_data ,  // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
   input  logic [ICACHE_INDEX_HI:3]               ic_debug_addr,      // Read/Write addresss to the Icache.
   input  logic                      ic_debug_rd_en,     // Icache debug rd
   input  logic                      ic_debug_wr_en,     // Icache debug wr
   input  logic                      ic_debug_tag_array, // Debug tag array
   input  logic [ICACHE_NUM_WAYS-1:0]                ic_debug_way,       // Debug way. Rd or Wr.

   output logic [63:0]              ic_rd_data ,        // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
   output logic [25:0]               ic_tag_debug_rd_data,// Debug icache tag.


   output logic [ICACHE_BANKS_WAY-1:0] ic_eccerr,    // ecc error per bank
   output logic [ICACHE_BANKS_WAY-1:0] ic_parerr,          // parity error per bank
   output logic [ICACHE_NUM_WAYS-1:0]   ic_rd_hit,
   output logic         ic_tag_perr,        // Icache Tag parity error


   input  logic         scan_mode

);

logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_TEST1;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_RME;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_RM_0;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_RM_1;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_RM_2;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_RM_3;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_LS;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_DS;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_SD;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_RNM;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_BC1;
logic   [ICACHE_NUM_WAYS-1:0][ICACHE_BANKS_WAY-1:0]         ic_data_ext_in_pkt_BC2;
logic active_clk;

assign ic_data_ext_in_pkt_TEST1[0]  = ic_data_ext_in_pkt_0_TEST1 ;
assign ic_data_ext_in_pkt_RME[0]    = ic_data_ext_in_pkt_0_RME;
assign ic_data_ext_in_pkt_RM_0[0]   = ic_data_ext_in_pkt_0_RM_0;
assign ic_data_ext_in_pkt_RM_1[0]   = ic_data_ext_in_pkt_0_RM_1;
assign ic_data_ext_in_pkt_RM_2[0]   = ic_data_ext_in_pkt_0_RM_2;
assign ic_data_ext_in_pkt_RM_3[0]   = ic_data_ext_in_pkt_0_RM_3;
assign ic_data_ext_in_pkt_LS[0]     = ic_data_ext_in_pkt_0_LS;
assign ic_data_ext_in_pkt_DS[0]     = ic_data_ext_in_pkt_0_DS;
assign ic_data_ext_in_pkt_SD[0]     = ic_data_ext_in_pkt_0_SD;
assign ic_data_ext_in_pkt_RNM[0]    = ic_data_ext_in_pkt_0_RNM;
assign ic_data_ext_in_pkt_BC1[0]    = ic_data_ext_in_pkt_0_BC1;
assign ic_data_ext_in_pkt_BC2[0]    = ic_data_ext_in_pkt_0_BC2;

assign ic_data_ext_in_pkt_TEST1[1]  = ic_data_ext_in_pkt_1_TEST1 ;
assign ic_data_ext_in_pkt_RME[1]    = ic_data_ext_in_pkt_1_RME;
assign ic_data_ext_in_pkt_RM_0[1]   = ic_data_ext_in_pkt_1_RM_0;
assign ic_data_ext_in_pkt_RM_1[1]   = ic_data_ext_in_pkt_1_RM_1;
assign ic_data_ext_in_pkt_RM_2[1]   = ic_data_ext_in_pkt_1_RM_2;
assign ic_data_ext_in_pkt_RM_3[1]   = ic_data_ext_in_pkt_1_RM_3;
assign ic_data_ext_in_pkt_LS[1]     = ic_data_ext_in_pkt_1_LS;
assign ic_data_ext_in_pkt_DS[1]     = ic_data_ext_in_pkt_1_DS;
assign ic_data_ext_in_pkt_SD[1]     = ic_data_ext_in_pkt_1_SD;
assign ic_data_ext_in_pkt_RNM[1]    = ic_data_ext_in_pkt_1_RNM;
assign ic_data_ext_in_pkt_BC1[1]    = ic_data_ext_in_pkt_1_BC1;
assign ic_data_ext_in_pkt_BC2[1]    = ic_data_ext_in_pkt_1_BC2;

   rvoclkhdr active_cg   ( .en(1'b1),         .l1clk(active_clk), .* );

   // DCCM Instantiation
   if (DCCM_ENABLE == 1) begin: Gen_dccm_enable
      lsu_dccm_mem #(
   .DCCM_BYTE_WIDTH(DCCM_BYTE_WIDTH),
   .DCCM_BITS(DCCM_BITS),
   .DCCM_NUM_BANKS(DCCM_NUM_BANKS),
   .DCCM_BANK_BITS(DCCM_BANK_BITS),
   .DCCM_SIZE(DCCM_SIZE),
   .DCCM_FDATA_WIDTH(DCCM_FDATA_WIDTH),
   .DCCM_WIDTH_BITS(DCCM_WIDTH_BITS)) dccm (
         .clk_override(dccm_clk_override),
         .*
      );
   end else begin: Gen_dccm_disable
      assign dccm_rd_data_lo = '0;
      assign dccm_rd_data_hi = '0;
   end

if ( ICACHE_ENABLE ) begin: icache
   ifu_ic_mem #(
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
   .ICACHE_DATA_DEPTH(ICACHE_DATA_DEPTH),
.ICACHE_TAG_NUM_BYPASS(ICACHE_TAG_NUM_BYPASS),
.ICACHE_TAG_NUM_BYPASS_WIDTH(ICACHE_TAG_NUM_BYPASS_WIDTH),
.ICACHE_TAG_BYPASS_ENABLE(ICACHE_TAG_BYPASS_ENABLE),
.ICACHE_NUM_BYPASS_WIDTH(ICACHE_NUM_BYPASS_WIDTH),
.ICACHE_BYPASS_ENABLE(ICACHE_BYPASS_ENABLE),
.ICACHE_LN_SZ(ICACHE_LN_SZ)) icm  (
      .clk_override(icm_clk_override),
      .*
   );
end
else  begin
   assign   ic_rd_hit[ICACHE_NUM_WAYS-1:0] = '0;
   assign   ic_tag_perr    = '0 ;
   assign   ic_rd_data  = '0 ;
   assign   ic_tag_debug_rd_data  = '0 ;
end // else: !if( ICACHE_ENABLE )



if (ICCM_ENABLE) begin : iccm
   ifu_iccm_mem #(
   .ICCM_BITS(ICCM_BITS),
   .ICCM_BANK_INDEX_LO(ICCM_BANK_INDEX_LO),
   .ICCM_INDEX_BITS(ICCM_INDEX_BITS),
   .ICCM_BANK_HI(ICCM_BANK_HI),
   .ICCM_NUM_BANKS(ICCM_NUM_BANKS),
   .ICCM_BANK_BITS(ICCM_BANK_BITS))  iccm (.*,
                  .clk_override(icm_clk_override),
                  .iccm_rw_addr(iccm_rw_addr[ICCM_BITS-1:1]),
                  .iccm_rd_data(iccm_rd_data[63:0])
                   );
end
else  begin
   assign  iccm_rd_data    = '0 ;
   assign iccm_rd_data_ecc = '0 ;
end


endmodule
