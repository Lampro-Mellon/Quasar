
module el2_lsu_ecc
`include "parameter.sv"
(
   input logic                           clk,
   input logic                           lsu_c2_r_clk,     // clocks
   input logic                           rst_l,
   input logic                           scan_mode,           // scan

   input el2_lsu_pkt_t                  lsu_pkt_m,          // packet in m
   input el2_lsu_pkt_t                  lsu_pkt_r,          // packet in r
   input logic [DCCM_DATA_WIDTH-1:0]  stbuf_data_any,

   input logic                           dec_tlu_core_ecc_disable,  // disables the ecc computation and error flagging

   input logic                           lsu_dccm_rden_r,          // dccm rden
   input logic                           addr_in_dccm_r,           // address in dccm
   input logic  [DCCM_BITS-1:0]       lsu_addr_r,               // start address
   input logic  [DCCM_BITS-1:0]       end_addr_r,               // end address
   input logic  [DCCM_DATA_WIDTH-1:0] dccm_rdata_hi_r,          // data from the dccm
   input logic  [DCCM_DATA_WIDTH-1:0] dccm_rdata_lo_r,          // data from the dccm
   input logic  [DCCM_ECC_WIDTH-1:0]  dccm_data_ecc_hi_r,       // data from the dccm + ecc
   input logic  [DCCM_ECC_WIDTH-1:0]  dccm_data_ecc_lo_r,
   output logic [DCCM_DATA_WIDTH-1:0] sec_data_hi_r,
   output logic [DCCM_DATA_WIDTH-1:0] sec_data_lo_r,
   output logic [DCCM_DATA_WIDTH-1:0] sec_data_hi_r_ff,
   output logic [DCCM_DATA_WIDTH-1:0] sec_data_lo_r_ff,

   input logic                           ld_single_ecc_error_r,     // ld has a single ecc error
   input logic                           ld_single_ecc_error_r_ff,  // ld has a single ecc error
   input logic                           lsu_dccm_rden_m,           // dccm rden
   input logic                           addr_in_dccm_m,            // address in dccm
   input logic  [DCCM_BITS-1:0]       lsu_addr_m,                // start address
   input logic  [DCCM_BITS-1:0]       end_addr_m,                // end address
   input logic  [DCCM_DATA_WIDTH-1:0] dccm_rdata_hi_m,           // raw data from mem
   input logic  [DCCM_DATA_WIDTH-1:0] dccm_rdata_lo_m,           // raw data from mem
   input logic  [DCCM_ECC_WIDTH-1:0]  dccm_data_ecc_hi_m,        // ecc read out from mem
   input logic  [DCCM_ECC_WIDTH-1:0]  dccm_data_ecc_lo_m,        // ecc read out from mem
   output logic [DCCM_DATA_WIDTH-1:0] sec_data_hi_m,
   output logic [DCCM_DATA_WIDTH-1:0] sec_data_lo_m,

   input logic                           dma_dccm_wen,
   input logic  [31:0]                   dma_dccm_wdata_lo,
   input logic  [31:0]                   dma_dccm_wdata_hi,
   output logic [DCCM_ECC_WIDTH-1:0]  dma_dccm_wdata_ecc_hi,     // ECC bits for the DMA wdata
   output logic [DCCM_ECC_WIDTH-1:0]  dma_dccm_wdata_ecc_lo,     // ECC bits for the DMA wdata

   output logic [DCCM_ECC_WIDTH-1:0]  stbuf_ecc_any,
   output logic [DCCM_ECC_WIDTH-1:0]  sec_data_ecc_hi_r_ff,
   output logic [DCCM_ECC_WIDTH-1:0]  sec_data_ecc_lo_r_ff,

   output logic                          single_ecc_error_hi_r,                   // sec detected
   output logic                          single_ecc_error_lo_r,                   // sec detected on lower dccm bank
   output logic                          lsu_single_ecc_error_r,                  // or of the 2
   output logic                          lsu_double_ecc_error_r,                   // double error detected

   output logic                          lsu_single_ecc_error_m,                  // or of the 2
   output logic                          lsu_double_ecc_error_m                   // double error detected

 );

   logic                           is_ldst_r;
   logic                           is_ldst_hi_any, is_ldst_lo_any;
   logic [DCCM_DATA_WIDTH-1:0]  dccm_wdata_hi_any, dccm_wdata_lo_any;
   logic [DCCM_ECC_WIDTH-1:0]  dccm_wdata_ecc_hi_any, dccm_wdata_ecc_lo_any;
   logic [DCCM_DATA_WIDTH-1:0]  dccm_rdata_hi_any, dccm_rdata_lo_any;
   logic [DCCM_ECC_WIDTH-1:0]   dccm_data_ecc_hi_any, dccm_data_ecc_lo_any;
   logic [DCCM_DATA_WIDTH-1:0]  sec_data_hi_any, sec_data_lo_any;
   logic                           single_ecc_error_hi_any, single_ecc_error_lo_any;
   logic                           double_ecc_error_hi_any, double_ecc_error_lo_any;

   logic                           double_ecc_error_hi_m, double_ecc_error_lo_m;
   logic                           double_ecc_error_hi_r, double_ecc_error_lo_r;

   logic [6:0]                     ecc_out_hi_nc, ecc_out_lo_nc;


   if (LOAD_TO_USE_PLUS1 == 1) begin: L2U_Plus1_1
      logic        ldst_dual_m, ldst_dual_r;
      logic        is_ldst_m;
      logic        is_ldst_hi_m, is_ldst_lo_m;
      logic        is_ldst_hi_r, is_ldst_lo_r;

      assign ldst_dual_r                                 = (lsu_addr_r[2] != end_addr_r[2]);
      assign is_ldst_r                                   = lsu_pkt_r.valid & (lsu_pkt_r.load | lsu_pkt_r.store) & addr_in_dccm_r & lsu_dccm_rden_r;
      assign is_ldst_lo_r                                = is_ldst_r & ~dec_tlu_core_ecc_disable;
      assign is_ldst_hi_r                                = is_ldst_r & (ldst_dual_r | lsu_pkt_r.dma) & ~dec_tlu_core_ecc_disable;   // Always check the ECC Hi/Lo for DMA since we don't align for DMA

      assign is_ldst_hi_any                              = is_ldst_hi_r;
      assign dccm_rdata_hi_any[DCCM_DATA_WIDTH-1:0]   = dccm_rdata_hi_r[DCCM_DATA_WIDTH-1:0];
      assign dccm_data_ecc_hi_any[DCCM_ECC_WIDTH-1:0] = dccm_data_ecc_hi_r[DCCM_ECC_WIDTH-1:0];
      assign is_ldst_lo_any                              = is_ldst_lo_r;
      assign dccm_rdata_lo_any[DCCM_DATA_WIDTH-1:0]   = dccm_rdata_lo_r[DCCM_DATA_WIDTH-1:0];
      assign dccm_data_ecc_lo_any[DCCM_ECC_WIDTH-1:0] = dccm_data_ecc_lo_r[DCCM_ECC_WIDTH-1:0];

      assign sec_data_hi_r[DCCM_DATA_WIDTH-1:0]       = sec_data_hi_any[DCCM_DATA_WIDTH-1:0];
      assign single_ecc_error_hi_r                       = single_ecc_error_hi_any;
      assign double_ecc_error_hi_r                       = double_ecc_error_hi_any;
      assign sec_data_lo_r[DCCM_DATA_WIDTH-1:0]       = sec_data_lo_any[DCCM_DATA_WIDTH-1:0];
      assign single_ecc_error_lo_r                       = single_ecc_error_lo_any;
      assign double_ecc_error_lo_r                       = double_ecc_error_lo_any;

      assign lsu_single_ecc_error_r                      = single_ecc_error_hi_r | single_ecc_error_lo_r;
      assign lsu_double_ecc_error_r                      = double_ecc_error_hi_r | double_ecc_error_lo_r;

   end else begin: L2U_Plus1_0

      logic        ldst_dual_m;
      logic        is_ldst_m;
      logic        is_ldst_hi_m, is_ldst_lo_m;

      assign ldst_dual_m                                 = (lsu_addr_m[2] != end_addr_m[2]);
      assign is_ldst_m                                   = lsu_pkt_m.valid & (lsu_pkt_m.load | lsu_pkt_m.store) & addr_in_dccm_m & lsu_dccm_rden_m;
      assign is_ldst_lo_m                                = is_ldst_m & ~dec_tlu_core_ecc_disable;
      assign is_ldst_hi_m                                = is_ldst_m & (ldst_dual_m | lsu_pkt_m.dma) & ~dec_tlu_core_ecc_disable;   // Always check the ECC Hi/Lo for DMA since we don't align for DMA

      assign is_ldst_hi_any                              = is_ldst_hi_m;
      assign dccm_rdata_hi_any[DCCM_DATA_WIDTH-1:0]   = dccm_rdata_hi_m[DCCM_DATA_WIDTH-1:0];
      assign dccm_data_ecc_hi_any[DCCM_ECC_WIDTH-1:0] = dccm_data_ecc_hi_m[DCCM_ECC_WIDTH-1:0];
      assign is_ldst_lo_any                              = is_ldst_lo_m;
      assign dccm_rdata_lo_any[DCCM_DATA_WIDTH-1:0]   = dccm_rdata_lo_m[DCCM_DATA_WIDTH-1:0];
      assign dccm_data_ecc_lo_any[DCCM_ECC_WIDTH-1:0] = dccm_data_ecc_lo_m[DCCM_ECC_WIDTH-1:0];

      assign sec_data_hi_m[DCCM_DATA_WIDTH-1:0]       = sec_data_hi_any[DCCM_DATA_WIDTH-1:0];
      assign double_ecc_error_hi_m                       = double_ecc_error_hi_any;
      assign sec_data_lo_m[DCCM_DATA_WIDTH-1:0]       = sec_data_lo_any[DCCM_DATA_WIDTH-1:0];
      assign double_ecc_error_lo_m                       = double_ecc_error_lo_any;

      assign lsu_single_ecc_error_m                      = single_ecc_error_hi_any | single_ecc_error_lo_any;
      assign lsu_double_ecc_error_m                      = double_ecc_error_hi_m   | double_ecc_error_lo_m;

      // Flops
      rvdff #(1) lsu_single_ecc_err_r    (.din(lsu_single_ecc_error_m), .dout(lsu_single_ecc_error_r), .clk(lsu_c2_r_clk), .*);
      rvdff #(1) lsu_double_ecc_err_r    (.din(lsu_double_ecc_error_m), .dout(lsu_double_ecc_error_r), .clk(lsu_c2_r_clk), .*);
      rvdff #(.WIDTH(1)) ldst_sec_lo_rff (.din(single_ecc_error_lo_any),  .dout(single_ecc_error_lo_r),  .clk(lsu_c2_r_clk), .*);
      rvdff #(.WIDTH(1)) ldst_sec_hi_rff (.din(single_ecc_error_hi_any),  .dout(single_ecc_error_hi_r),  .clk(lsu_c2_r_clk), .*);
      rvdff #(.WIDTH(DCCM_DATA_WIDTH)) sec_data_hi_rff (.din(sec_data_hi_m[DCCM_DATA_WIDTH-1:0]), .dout(sec_data_hi_r[DCCM_DATA_WIDTH-1:0]), .clk(lsu_c2_r_clk), .*);
      rvdff #(.WIDTH(DCCM_DATA_WIDTH)) sec_data_lo_rff (.din(sec_data_lo_m[DCCM_DATA_WIDTH-1:0]), .dout(sec_data_lo_r[DCCM_DATA_WIDTH-1:0]), .clk(lsu_c2_r_clk), .*);

   end

   // Logic for ECC generation during write
   assign dccm_wdata_lo_any[DCCM_DATA_WIDTH-1:0] = ld_single_ecc_error_r_ff ? sec_data_lo_r_ff[DCCM_DATA_WIDTH-1:0] : (dma_dccm_wen ? dma_dccm_wdata_lo[DCCM_DATA_WIDTH-1:0] : stbuf_data_any[DCCM_DATA_WIDTH-1:0]);
   assign dccm_wdata_hi_any[DCCM_DATA_WIDTH-1:0] = ld_single_ecc_error_r_ff ? sec_data_hi_r_ff[DCCM_DATA_WIDTH-1:0] : (dma_dccm_wen ? dma_dccm_wdata_hi[DCCM_DATA_WIDTH-1:0] : stbuf_data_any[DCCM_DATA_WIDTH-1:0]);

   assign sec_data_ecc_hi_r_ff[DCCM_ECC_WIDTH-1:0]  = dccm_wdata_ecc_hi_any[DCCM_ECC_WIDTH-1:0];
   assign sec_data_ecc_lo_r_ff[DCCM_ECC_WIDTH-1:0]  = dccm_wdata_ecc_lo_any[DCCM_ECC_WIDTH-1:0];
   assign stbuf_ecc_any[DCCM_ECC_WIDTH-1:0]         = dccm_wdata_ecc_lo_any[DCCM_ECC_WIDTH-1:0];
   assign dma_dccm_wdata_ecc_hi[DCCM_ECC_WIDTH-1:0] = dccm_wdata_ecc_hi_any[DCCM_ECC_WIDTH-1:0];
   assign dma_dccm_wdata_ecc_lo[DCCM_ECC_WIDTH-1:0] = dccm_wdata_ecc_lo_any[DCCM_ECC_WIDTH-1:0];

   // Instantiate ECC blocks
   if (DCCM_ENABLE == 1) begin: Gen_dccm_enable

      //Detect/Repair for Hi
      rvecc_decode lsu_ecc_decode_hi (
         // Inputs
         .en(is_ldst_hi_any),
         .sed_ded (1'b0),    // 1 : means only detection
         .din(dccm_rdata_hi_any[DCCM_DATA_WIDTH-1:0]),
         .ecc_in(dccm_data_ecc_hi_any[DCCM_ECC_WIDTH-1:0]),
         // Outputs
         .dout(sec_data_hi_any[DCCM_DATA_WIDTH-1:0]),
         .ecc_out (ecc_out_hi_nc[6:0]),
         .single_ecc_error(single_ecc_error_hi_any),
         .double_ecc_error(double_ecc_error_hi_any),
         .*
      );

      //Detect/Repair for Lo
      rvecc_decode lsu_ecc_decode_lo (
         // Inputs
         .en(is_ldst_lo_any),
         .sed_ded (1'b0),    // 1 : means only detection
         .din(dccm_rdata_lo_any[DCCM_DATA_WIDTH-1:0] ),
         .ecc_in(dccm_data_ecc_lo_any[DCCM_ECC_WIDTH-1:0]),
         // Outputs
         .dout(sec_data_lo_any[DCCM_DATA_WIDTH-1:0]),
         .ecc_out (ecc_out_lo_nc[6:0]),
         .single_ecc_error(single_ecc_error_lo_any),
         .double_ecc_error(double_ecc_error_lo_any),
         .*
      );

      rvecc_encode lsu_ecc_encode_hi (
         //Inputs
         .din(dccm_wdata_hi_any[DCCM_DATA_WIDTH-1:0]),
         //Outputs
         .ecc_out(dccm_wdata_ecc_hi_any[DCCM_ECC_WIDTH-1:0]),
         .*
      );
      rvecc_encode lsu_ecc_encode_lo (
         //Inputs
         .din(dccm_wdata_lo_any[DCCM_DATA_WIDTH-1:0]),
         //Outputs
         .ecc_out(dccm_wdata_ecc_lo_any[DCCM_ECC_WIDTH-1:0]),
         .*
      );
   end else begin: Gen_dccm_disable // block: Gen_dccm_enable
      assign sec_data_hi_any[DCCM_DATA_WIDTH-1:0] = '0;
      assign sec_data_lo_any[DCCM_DATA_WIDTH-1:0] = '0;
      assign single_ecc_error_hi_any = '0;
      assign double_ecc_error_hi_any = '0;
      assign single_ecc_error_lo_any = '0;
      assign double_ecc_error_lo_any = '0;

      assign stbuf_ecc_any[DCCM_ECC_WIDTH-1:0] = '0;
   end

   rvdffe #(.WIDTH(DCCM_DATA_WIDTH)) sec_data_hi_rplus1ff (.din(sec_data_hi_r[DCCM_DATA_WIDTH-1:0]), .dout(sec_data_hi_r_ff[DCCM_DATA_WIDTH-1:0]), .en(ld_single_ecc_error_r), .clk(clk), .*);
   rvdffe #(.WIDTH(DCCM_DATA_WIDTH)) sec_data_lo_rplus1ff (.din(sec_data_lo_r[DCCM_DATA_WIDTH-1:0]), .dout(sec_data_lo_r_ff[DCCM_DATA_WIDTH-1:0]), .en(ld_single_ecc_error_r), .clk(clk), .*);

endmodule // el2_lsu_ecc
