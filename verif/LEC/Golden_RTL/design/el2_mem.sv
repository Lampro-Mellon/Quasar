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
`include "el2_lsu_dccm_mem.sv"
`include "el2_ifu_ic_mem.sv"
`include "el2_ifu_iccm_mem.sv"
module el2_mem
//import el2_pkg::*;
//#(
//`include "el2_param.vh"
 //)

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

//`endif

   //ICCM ports

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

   input  logic [ICACHE_BANKS_WAY-1:0][70:0]               ic_wr_data,         // Data to fill to the Icache. With ECC
   input  logic [70:0]               ic_debug_wr_data,   // Debug wr cache.
   output logic [70:0]               ic_debug_rd_data ,  // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
   input  logic [ICACHE_INDEX_HI:3]               ic_debug_addr,      // Read/Write addresss to the Icache.
   input  logic                      ic_debug_rd_en,     // Icache debug rd
   input  logic                      ic_debug_wr_en,     // Icache debug wr
   input  logic                      ic_debug_tag_array, // Debug tag array
   input  logic [ICACHE_NUM_WAYS-1:0]                ic_debug_way,       // Debug way. Rd or Wr.

   output logic [63:0]              ic_rd_data ,        // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
   output logic [25:0]               ictag_debug_rd_data,// Debug icache tag.


   output logic [ICACHE_BANKS_WAY-1:0] ic_eccerr,    // ecc error per bank
   output logic [ICACHE_BANKS_WAY-1:0] ic_parerr,          // parity error per bank
   output logic [ICACHE_NUM_WAYS-1:0]   ic_rd_hit,
   output logic         ic_tag_perr,        // Icache Tag parity error


   input  logic         scan_mode

);

   // DCCM Instantiation
   if (DCCM_ENABLE == 1) begin: Gen_dccm_enable
      el2_lsu_dccm_mem  dccm (
         .clk_override(dccm_clk_override),
         .*
      );
   end else begin: Gen_dccm_disable
      assign dccm_rd_data_lo = '0;
      assign dccm_rd_data_hi = '0;
   end

if ( ICACHE_ENABLE ) begin: icache
   el2_ifu_ic_mem  icm  (
      .clk_override(icm_clk_override),
      .*
   );
end
else  begin
   assign   ic_rd_hit[ICACHE_NUM_WAYS-1:0] = '0;
   assign   ic_tag_perr    = '0 ;
   assign   ic_rd_data  = '0 ;
   assign   ictag_debug_rd_data  = '0 ;
end // else: !if( ICACHE_ENABLE )



if (ICCM_ENABLE) begin : iccm
   el2_ifu_iccm_mem   iccm (.*,
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
