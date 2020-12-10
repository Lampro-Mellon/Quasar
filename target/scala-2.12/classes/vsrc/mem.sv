
module mem #(
   parameter ICACHE_BEAT_BITS,
   parameter ICCM_BITS,
   parameter ICACHE_NUM_WAYS,
   parameter DCCM_BYTE_WIDTH,
   parameter ICCM_BANK_INDEX_LO,
   parameter ICACHE_BANK_BITS,
   parameter DCCM_BITS,
   parameter ICACHE_BEAT_ADDR_HI,
   parameter ICCM_INDEX_BITS,
   parameter ICCM_BANK_HI,
   parameter ICACHE_BANKS_WAY,
   parameter ICACHE_INDEX_HI,
   parameter DCCM_NUM_BANKS,
   parameter ICACHE_BANK_HI,
   parameter ICACHE_BANK_LO,
   parameter DCCM_ENABLE= 'b1,
   parameter ICACHE_TAG_LO,
   parameter ICACHE_DATA_INDEX_LO,
   parameter ICCM_NUM_BANKS,
   parameter ICACHE_ECC,
   parameter ICACHE_ENABLE= 'b1,
   parameter DCCM_BANK_BITS,
   parameter ICCM_ENABLE= 'b1,
   parameter ICCM_BANK_BITS,
   parameter ICACHE_TAG_DEPTH,
   parameter ICACHE_WAYPACK,
   parameter DCCM_SIZE,
   parameter DCCM_FDATA_WIDTH,
   parameter ICACHE_TAG_INDEX_LO,
   parameter ICACHE_DATA_DEPTH)
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

   input  logic [70:0]               ic_wr_data_0,         // Data to fill to the Icache. With ECC
	input  logic [70:0]               ic_wr_data_1,
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

	logic [ICACHE_BANKS_WAY-1:0][70:0]  ic_wr_data;
assign ic_wr_data [0] = ic_wr_data_0;
assign ic_wr_data [1] = ic_wr_data_1;
   // DCCM Instantiation
   if (DCCM_ENABLE == 1) begin: Gen_dccm_enable
      lsu_dccm_mem #(
   .DCCM_BYTE_WIDTH(DCCM_BYTE_WIDTH),
   .DCCM_BITS(DCCM_BITS),
   .DCCM_NUM_BANKS(DCCM_NUM_BANKS),
   .DCCM_BANK_BITS(DCCM_BANK_BITS),
   .DCCM_SIZE(DCCM_SIZE),
   .DCCM_FDATA_WIDTH(DCCM_FDATA_WIDTH)) dccm (
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
   .ICACHE_DATA_DEPTH(ICACHE_DATA_DEPTH)) icm  (
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
   ifu_iccm_mem  #(
   .ICCM_BITS(ICCM_BITS),
   .ICCM_BANK_INDEX_LO(ICCM_BANK_INDEX_LO),
   .ICCM_INDEX_BITS(ICCM_INDEX_BITS),
   .ICCM_BANK_HI(ICCM_BANK_HI),
   .ICCM_NUM_BANKS(ICCM_NUM_BANKS),
   .ICCM_BANK_BITS(ICCM_BANK_BITS)) iccm (.*,
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
