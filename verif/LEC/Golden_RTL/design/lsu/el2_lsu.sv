
module el2_lsu
`include "parameter.sv"

(

   input logic                             clk_override,             // Override non-functional clock gating
   input logic                             dec_tlu_flush_lower_r,    // I0/I1 writeback flush. This is used to flush the old packets only
   input logic                             dec_tlu_i0_kill_writeb_r, // I0 is flushed, don't writeback any results to arch state
   input logic                             dec_tlu_force_halt,       // This will be high till TLU goes to debug halt

   // chicken signals
   input logic                             dec_tlu_external_ldfwd_disable,     // disable load to load forwarding for externals
   input logic                             dec_tlu_wb_coalescing_disable,     // disable the write buffer coalesce
   input logic                             dec_tlu_sideeffect_posted_disable, // disable the posted sideeffect load store to the bus
   input logic                             dec_tlu_core_ecc_disable,          // disable the generation of the ecc


   input logic [31:0]                      exu_lsu_rs1_d,        // address rs operand
   input logic [31:0]                      exu_lsu_rs2_d,        // store data
   input logic [11:0]                      dec_lsu_offset_d,     // address offset operand

   input                                   el2_lsu_pkt_t lsu_p,  // lsu control packet
   input logic                             dec_lsu_valid_raw_d,   // Raw valid for address computation
   input logic [31:0]                      dec_tlu_mrac_ff,       // CSR for memory region control

   output logic [31:0]                     lsu_result_m,          // lsu load data
   output logic [31:0]                     lsu_result_corr_r,     // This is the ECC corrected data going to RF
   output logic                            lsu_load_stall_any,    // This is for blocking loads in the decode
   output logic                            lsu_store_stall_any,   // This is for blocking stores in the decode
   output logic                            lsu_fastint_stall_any, // Stall the fastint in decode-1 stage
   output logic                            lsu_idle_any,          // lsu buffers are empty and no instruction in the pipeline. Doesn't include DMA

   output logic [31:1]                     lsu_fir_addr,        // fast interrupt address
   output logic [1:0]                      lsu_fir_error,       // Error during fast interrupt lookup

   output logic                            lsu_single_ecc_error_incr,     // Increment the ecc counter
   output el2_lsu_error_pkt_t             lsu_error_pkt_r,               // lsu exception packet
   output logic                            lsu_imprecise_error_load_any,  // bus load imprecise error
   output logic                            lsu_imprecise_error_store_any, // bus store imprecise error
   output logic [31:0]                     lsu_imprecise_error_addr_any,  // bus store imprecise error address

   // Non-blocking loads
   output logic                               lsu_nonblock_load_valid_m,      // there is an external load -> put in the cam
   output logic [LSU_NUM_NBLOAD_WIDTH-1:0] lsu_nonblock_load_tag_m,        // the tag of the external non block load
   output logic                               lsu_nonblock_load_inv_r,        // invalidate signal for the cam entry for non block loads
   output logic [LSU_NUM_NBLOAD_WIDTH-1:0] lsu_nonblock_load_inv_tag_r,    // tag of the enrty which needs to be invalidated
   output logic                               lsu_nonblock_load_data_valid,   // the non block is valid - sending information back to the cam
   output logic                               lsu_nonblock_load_data_error,   // non block load has an error
   output logic [LSU_NUM_NBLOAD_WIDTH-1:0] lsu_nonblock_load_data_tag,     // the tag of the non block load sending the data/error
   output logic [31:0]                        lsu_nonblock_load_data,         // Data of the non block load


   output logic                            lsu_pmu_load_external_m,        // PMU : Bus loads
   output logic                            lsu_pmu_store_external_m,       // PMU : Bus loads
   output logic                            lsu_pmu_misaligned_m,           // PMU : misaligned
   output logic                            lsu_pmu_bus_trxn,               // PMU : bus transaction
   output logic                            lsu_pmu_bus_misaligned,         // PMU : misaligned access going to the bus
   output logic                            lsu_pmu_bus_error,              // PMU : bus sending error back
   output logic                            lsu_pmu_bus_busy,               // PMU : bus is not ready

   // Trigger signals
   input                                   el2_trigger_pkt_t [3:0] trigger_pkt_any, // Trigger info from the decode
   output logic [3:0]                      lsu_trigger_match_m,                      // lsu trigger hit (one bit per trigger)

   // DCCM ports
   output logic                            dccm_wren,       // DCCM write enable
   output logic                            dccm_rden,       // DCCM read enable
   output logic [DCCM_BITS-1:0]         dccm_wr_addr_lo, // DCCM write address low bank
   output logic [DCCM_BITS-1:0]         dccm_wr_addr_hi, // DCCM write address hi bank
   output logic [DCCM_BITS-1:0]         dccm_rd_addr_lo, // DCCM read address low bank
   output logic [DCCM_BITS-1:0]         dccm_rd_addr_hi, // DCCM read address hi bank (hi and low same if aligned read)
   output logic [DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_lo, // DCCM write data for lo bank
   output logic [DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_hi, // DCCM write data for hi bank

   input logic [DCCM_FDATA_WIDTH-1:0]   dccm_rd_data_lo, // DCCM read data low bank
   input logic [DCCM_FDATA_WIDTH-1:0]   dccm_rd_data_hi, // DCCM read data hi bank

   // PIC ports
   output logic                            picm_wren,    // PIC memory write enable
   output logic                            picm_rden,    // PIC memory read enable
   output logic                            picm_mken,    // Need to read the mask for stores to determine which bits to write/forward
   output logic [31:0]                     picm_rdaddr,  // address for pic read access
   output logic [31:0]                     picm_wraddr,  // address for pic write access
   output logic [31:0]                     picm_wr_data, // PIC memory write data
   input logic [31:0]                      picm_rd_data, // PIC memory read/mask data

   // AXI Write Channels
   output logic                            lsu_axi_awvalid,
   input  logic                            lsu_axi_awready,
   output logic [LSU_BUS_TAG-1:0]       lsu_axi_awid,
   output logic [31:0]                     lsu_axi_awaddr,
   output logic [3:0]                      lsu_axi_awregion,
   output logic [7:0]                      lsu_axi_awlen,
   output logic [2:0]                      lsu_axi_awsize,
   output logic [1:0]                      lsu_axi_awburst,
   output logic                            lsu_axi_awlock,
   output logic [3:0]                      lsu_axi_awcache,
   output logic [2:0]                      lsu_axi_awprot,
   output logic [3:0]                      lsu_axi_awqos,

   output logic                            lsu_axi_wvalid,
   input  logic                            lsu_axi_wready,
   output logic [63:0]                     lsu_axi_wdata,
   output logic [7:0]                      lsu_axi_wstrb,
   output logic                            lsu_axi_wlast,

   input  logic                            lsu_axi_bvalid,
   output logic                            lsu_axi_bready,
   input  logic [1:0]                      lsu_axi_bresp,
   input  logic [LSU_BUS_TAG-1:0]       lsu_axi_bid,

   // AXI Read Channels
   output logic                            lsu_axi_arvalid,
   input  logic                            lsu_axi_arready,
   output logic [LSU_BUS_TAG-1:0]       lsu_axi_arid,
   output logic [31:0]                     lsu_axi_araddr,
   output logic [3:0]                      lsu_axi_arregion,
   output logic [7:0]                      lsu_axi_arlen,
   output logic [2:0]                      lsu_axi_arsize,
   output logic [1:0]                      lsu_axi_arburst,
   output logic                            lsu_axi_arlock,
   output logic [3:0]                      lsu_axi_arcache,
   output logic [2:0]                      lsu_axi_arprot,
   output logic [3:0]                      lsu_axi_arqos,

   input  logic                            lsu_axi_rvalid,
   output logic                            lsu_axi_rready,
   input  logic [LSU_BUS_TAG-1:0]       lsu_axi_rid,
   input  logic [63:0]                     lsu_axi_rdata,
   input  logic [1:0]                      lsu_axi_rresp,
   input  logic                            lsu_axi_rlast,

   input logic                             lsu_bus_clk_en,    // external drives a clock_en to control bus ratio

   // DMA slave
   input logic                             dma_dccm_req,       // DMA read/write to dccm
   input logic [2:0]                       dma_mem_tag,        // DMA request tag
   input logic [31:0]                      dma_mem_addr,       // DMA address
   input logic [2:0]                       dma_mem_sz,         // DMA access size
   input logic                             dma_mem_write,      // DMA access is a write
   input logic [63:0]                      dma_mem_wdata,      // DMA write data

   output logic                            dccm_dma_rvalid,     // lsu data valid for DMA dccm read
   output logic                            dccm_dma_ecc_error,  // DMA load had ecc error
   output logic [2:0]                      dccm_dma_rtag,       // DMA request tag
   output logic [63:0]                     dccm_dma_rdata,      // lsu data for DMA dccm read
   output logic                            dccm_ready,          // lsu ready for DMA access

   input logic                             scan_mode,           // scan
   input logic                             clk,
   input logic                             free_clk,
   input logic                             rst_l

   );


   logic        lsu_dccm_rden_m;
   logic        lsu_dccm_rden_r;
   logic [31:0] store_data_m;
   logic [31:0] store_data_r;
   logic [31:0] store_data_hi_r, store_data_lo_r;
   logic [31:0] store_datafn_hi_r, store_datafn_lo_r;
   logic [31:0] sec_data_lo_m, sec_data_hi_m;
   logic [31:0] sec_data_lo_r, sec_data_hi_r;

   logic [31:0] lsu_ld_data_m;
   logic [31:0] dccm_rdata_hi_m, dccm_rdata_lo_m;
   logic [6:0]  dccm_data_ecc_hi_m, dccm_data_ecc_lo_m;
   logic        lsu_single_ecc_error_m;
   logic        lsu_double_ecc_error_m;

   logic [31:0] lsu_ld_data_r;
   logic [31:0] lsu_ld_data_corr_r;
   logic [31:0] dccm_rdata_hi_r, dccm_rdata_lo_r;
   logic [6:0]  dccm_data_ecc_hi_r, dccm_data_ecc_lo_r;
   logic        single_ecc_error_hi_r, single_ecc_error_lo_r;
   logic        lsu_single_ecc_error_r;
   logic        lsu_double_ecc_error_r;
   logic        ld_single_ecc_error_r, ld_single_ecc_error_r_ff;

   logic [31:0] picm_mask_data_m;

   logic [31:0] lsu_addr_d, lsu_addr_m, lsu_addr_r;
   logic [31:0] end_addr_d, end_addr_m, end_addr_r;

   el2_lsu_pkt_t    lsu_pkt_d, lsu_pkt_m, lsu_pkt_r;
   logic        lsu_i0_valid_d, lsu_i0_valid_m, lsu_i0_valid_r;

   // Store Buffer signals
   logic        store_stbuf_reqvld_r;
   logic        ldst_stbuf_reqvld_r;

   logic        lsu_commit_r;
   logic        lsu_exc_m;

   logic        addr_in_dccm_d, addr_in_dccm_m, addr_in_dccm_r;
   logic        addr_in_pic_d, addr_in_pic_m, addr_in_pic_r;
   logic        addr_external_m;

   logic                          stbuf_reqvld_any;
   logic                          stbuf_reqvld_flushed_any;
   logic [LSU_SB_BITS-1:0]     stbuf_addr_any;
   logic [DCCM_DATA_WIDTH-1:0] stbuf_data_any;
   logic [DCCM_ECC_WIDTH-1:0]  stbuf_ecc_any;
   logic [DCCM_DATA_WIDTH-1:0] sec_data_lo_r_ff, sec_data_hi_r_ff;
   logic [DCCM_ECC_WIDTH-1:0]  sec_data_ecc_hi_r_ff, sec_data_ecc_lo_r_ff;

   logic                          lsu_cmpen_m;
   logic [DCCM_DATA_WIDTH-1:0] stbuf_fwddata_hi_m;
   logic [DCCM_DATA_WIDTH-1:0] stbuf_fwddata_lo_m;
   logic [DCCM_BYTE_WIDTH-1:0] stbuf_fwdbyteen_hi_m;
   logic [DCCM_BYTE_WIDTH-1:0] stbuf_fwdbyteen_lo_m;

   logic        lsu_stbuf_commit_any;
   logic        lsu_stbuf_empty_any;   // This is for blocking loads
   logic        lsu_stbuf_full_any;

    // Bus signals
   logic        lsu_busreq_r;
   logic        lsu_bus_buffer_pend_any;
   logic        lsu_bus_buffer_empty_any;
   logic        lsu_bus_buffer_full_any;
   logic        lsu_bus_idle_any;
   logic        lsu_busreq_m;
   logic [31:0] bus_read_data_m;

   logic        flush_m_up, flush_r;
   logic        is_sideeffects_m;
   logic [2:0]  dma_mem_tag_d, dma_mem_tag_m;
   logic        ldst_nodma_mtor;
   logic        dma_dccm_wen, dma_pic_wen;
   logic [31:0] dma_dccm_wdata_lo, dma_dccm_wdata_hi;
   logic [DCCM_ECC_WIDTH-1:0] dma_dccm_wdata_ecc_lo, dma_dccm_wdata_ecc_hi;

   // Clocks
   logic        lsu_c1_m_clk, lsu_c1_r_clk;
   logic        lsu_c2_m_clk, lsu_c2_r_clk;
   logic        lsu_store_c1_m_clk, lsu_store_c1_r_clk;

   logic        lsu_stbuf_c1_clk;
   logic        lsu_bus_ibuf_c1_clk, lsu_bus_obuf_c1_clk, lsu_bus_buf_c1_clk;
   logic        lsu_busm_clk;
   logic        lsu_free_c2_clk;

   logic        lsu_raw_fwd_lo_m, lsu_raw_fwd_hi_m;
   logic        lsu_raw_fwd_lo_r, lsu_raw_fwd_hi_r;

   assign       lsu_raw_fwd_lo_m = (|stbuf_fwdbyteen_lo_m[DCCM_BYTE_WIDTH-1:0]);
   assign       lsu_raw_fwd_hi_m = (|stbuf_fwdbyteen_hi_m[DCCM_BYTE_WIDTH-1:0]);

   el2_lsu_lsc_ctl lsu_lsc_ctl (.*);

   // block stores in decode  - for either bus or stbuf reasons
   assign lsu_store_stall_any = lsu_stbuf_full_any | lsu_bus_buffer_full_any | ld_single_ecc_error_r_ff;
   assign lsu_load_stall_any = lsu_bus_buffer_full_any | ld_single_ecc_error_r_ff;
   assign lsu_fastint_stall_any = ld_single_ecc_error_r;    // Stall the fastint in decode-1 stage

   // Ready to accept dma trxns
   // There can't be any inpipe forwarding from non-dma packet to dma packet since they can be flushed so we can't have st in r when dma is in m
   assign dma_mem_tag_d[2:0]   = dma_mem_tag[2:0];
   assign ldst_nodma_mtor = (lsu_pkt_m.valid & ~lsu_pkt_m.dma & (addr_in_dccm_m | addr_in_pic_m) & lsu_pkt_m.store);
   assign dccm_ready = ~(dec_lsu_valid_raw_d | ldst_nodma_mtor | ld_single_ecc_error_r_ff);

   assign dma_dccm_wen = dma_dccm_req & dma_mem_write & addr_in_dccm_d;
   assign dma_pic_wen  = dma_dccm_req & dma_mem_write & addr_in_pic_d;
   assign {dma_dccm_wdata_hi[31:0], dma_dccm_wdata_lo[31:0]} = dma_mem_wdata[63:0] >> {dma_mem_addr[2:0], 3'b000};   // Shift the dma data to lower bits to make it consistent to lsu stores


   // Generate per cycle flush signals
   assign flush_m_up = dec_tlu_flush_lower_r;
   assign flush_r    = dec_tlu_i0_kill_writeb_r;

   // lsu halt idle. This is used for entering the halt mode. Also, DMA accesses are allowed during fence.
   // Indicates non-idle if there is a instruction valid in d-r or read/write buffers are non-empty since they can come with error
   // Store buffer now have only non-dma dccm stores
   // stbuf_empty not needed since it has only dccm stores
   assign lsu_idle_any = ~((lsu_pkt_m.valid & ~lsu_pkt_m.dma) |
                           (lsu_pkt_r.valid & ~lsu_pkt_r.dma)) &
                           lsu_bus_buffer_empty_any & lsu_bus_idle_any;

   // Instantiate the store buffer
   assign store_stbuf_reqvld_r = lsu_pkt_r.valid & lsu_pkt_r.store & addr_in_dccm_r & ~flush_r & ~lsu_pkt_r.dma;

   // Disable Forwarding for now
   assign lsu_cmpen_m = lsu_pkt_m.valid & (lsu_pkt_m.load | lsu_pkt_m.store) & (addr_in_dccm_m | addr_in_pic_m);

   // Bus signals
   assign lsu_busreq_m = lsu_pkt_m.valid & ((lsu_pkt_m.load | lsu_pkt_m.store) & addr_external_m) & ~flush_m_up & ~lsu_exc_m & ~lsu_pkt_m.fast_int;

   // PMU signals
   assign lsu_pmu_misaligned_m     = lsu_pkt_m.valid & ((lsu_pkt_m.half & lsu_addr_m[0]) | (lsu_pkt_m.word & (|lsu_addr_m[1:0])));
   assign lsu_pmu_load_external_m  = lsu_pkt_m.valid & lsu_pkt_m.load & addr_external_m;
   assign lsu_pmu_store_external_m = lsu_pkt_m.valid & lsu_pkt_m.store & addr_external_m;

   el2_lsu_dccm_ctl dccm_ctl (
      .lsu_addr_d(lsu_addr_d[31:0]),
      .end_addr_d(end_addr_d[DCCM_BITS-1:0]),
      .lsu_addr_m(lsu_addr_m[DCCM_BITS-1:0]),
      .lsu_addr_r(lsu_addr_r[31:0]),

      .end_addr_m(end_addr_m[DCCM_BITS-1:0]),
      .end_addr_r(end_addr_r[DCCM_BITS-1:0]),
      .*
   );

   el2_lsu_stbuf stbuf (
      .lsu_addr_d(lsu_addr_d[LSU_SB_BITS-1:0]),
      .end_addr_d(end_addr_d[LSU_SB_BITS-1:0]),

      .*

   );

   el2_lsu_ecc ecc (
      .lsu_addr_r(lsu_addr_r[DCCM_BITS-1:0]),
      .end_addr_r(end_addr_r[DCCM_BITS-1:0]),
      .lsu_addr_m(lsu_addr_m[DCCM_BITS-1:0]),
      .end_addr_m(end_addr_m[DCCM_BITS-1:0]),
      .*
   );

   el2_lsu_trigger trigger (
      .store_data_m(store_data_m[31:0]),
      .*
   );

   // Clk domain
   el2_lsu_clkdomain clkdomain (.*);

   // Bus interface
   el2_lsu_bus_intf bus_intf (
      .*
   );

   //Flops
   rvdff #(3) dma_mem_tag_mff     (.*, .din(dma_mem_tag_d[2:0]), .dout(dma_mem_tag_m[2:0]), .clk(lsu_c1_m_clk));

   rvdff #(2) lsu_raw_fwd_r_ff    (.*, .din({lsu_raw_fwd_hi_m, lsu_raw_fwd_lo_m}),     .dout({lsu_raw_fwd_hi_r, lsu_raw_fwd_lo_r}),     .clk(lsu_c2_r_clk));


`ifdef ASSERT_ON
   logic [1:0] store_data_bypass_sel;
   assign store_data_bypass_sel[1:0] =  {lsu_p.store_data_bypass_d, lsu_p.store_data_bypass_m};
   property exception_no_lsu_flush;
      @(posedge clk)  disable iff(~rst_l) lsu_lsc_ctl.lsu_error_pkt_m.exc_valid |-> ##[1:2] (flush_r );
   endproperty
   assert_exception_no_lsu_flush: assert property (exception_no_lsu_flush) else
      $display("No flush within 2 cycles of exception");

   // offset should be zero for fast interrupt
   property offset_0_fastint;
      @(posedge clk) disable iff(~rst_l) (lsu_p.valid & lsu_p.fast_int) |-> (dec_lsu_offset_d[11:0] == 12'b0);
   endproperty
   assert_offset_0_fastint: assert property (offset_0_fastint) else
      $display("dec_tlu_offset_d not zero for fast interrupt redirect");

   // DMA req should assert dccm rden/wren
   property dmareq_dccm_wren_or_rden;
      @(posedge clk) disable iff(~rst_l) dma_dccm_req |-> (dccm_rden | dccm_wren | addr_in_pic_d);
   endproperty
   assert_dmareq_dccm_wren_or_rden: assert property(dmareq_dccm_wren_or_rden) else
      $display("dccm rden or wren not asserted during DMA request");

   // fastint_stall should cause load/store stall next cycle
   property fastint_stall_imply_loadstore_stall;
      @(posedge clk) disable iff(~rst_l) (lsu_fastint_stall_any & (lsu_commit_r | lsu_pkt_r.dma)) |-> ##1 ((lsu_load_stall_any | lsu_store_stall_any) | ~ld_single_ecc_error_r_ff);
   endproperty
   assert_fastint_stall_imply_loadstore_stall: assert property (fastint_stall_imply_loadstore_stall) else
      $display("fastint_stall should be followed by lsu_load/store_stall_any");

   // Single ECC error implies rfnpc flush
   property single_ecc_error_rfnpc_flush;
      @(posedge clk) disable iff(~rst_l) (lsu_error_pkt_r.single_ecc_error & lsu_pkt_r.load) |=> ~lsu_commit_r;
   endproperty
   assert_single_ecc_error_rfnpc_flush: assert property (single_ecc_error_rfnpc_flush) else
     $display("LSU commit next cycle after single ecc error");

`endif

endmodule // el2_lsu
