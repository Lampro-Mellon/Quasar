package lsu
import lib._
import chisel3._
import chisel3.util._
import include._


class el2_lsu extends Module with RequireAsyncReset with param with el2_lib {
  val io = IO (new Bundle {
    val clk_override                      = Input(Bool())
    val dec_tlu_flush_lower_r             = Input(Bool())
    val dec_tlu_i0_kill_writeb_r          = Input(Bool())
    val dec_tlu_force_halt                = Input(Bool())
    // chicken signals
    val dec_tlu_external_ldfwd_disable    = Input(Bool())
    val dec_tlu_wb_coalescing_disable     = Input(Bool())
    val dec_tlu_sideeffect_posted_disable = Input(Bool())
    val dec_tlu_core_ecc_disable          = Input(Bool())

    val exu_lsu_rs1_d                     = Input(UInt(32.W))
    val exu_lsu_rs2_d                     = Input(UInt(32.W))
    val dec_lsu_offset_d                  = Input(UInt(12.W))
    val lsu_p                             = Flipped(Valid(new el2_lsu_pkt_t))
    val trigger_pkt_any                   = Input(Vec(4, new el2_trigger_pkt_t))

    val dec_lsu_valid_raw_d               = Input(Bool())
    val dec_tlu_mrac_ff                   = Input(UInt(32.W))

    //Outputs
    val lsu_result_m                      = Output(UInt(32.W))
    val lsu_result_corr_r                 = Output(UInt(32.W))
    val lsu_load_stall_any                = Output(Bool())
    val lsu_store_stall_any               = Output(Bool())
    val lsu_fastint_stall_any             = Output(Bool())
    val lsu_idle_any                      = Output(Bool())
    val lsu_fir_addr                      = Output(UInt(31.W))
    val lsu_fir_error                     = Output(UInt(2.W))
    val lsu_single_ecc_error_incr         = Output(Bool())
    val lsu_error_pkt_r                   = Valid(new el2_lsu_error_pkt_t)
    val lsu_imprecise_error_load_any      = Output(Bool())
    val lsu_imprecise_error_store_any     = Output(Bool())
    val lsu_imprecise_error_addr_any      = Output(UInt(32.W))

    // Non-blocking loads
    val lsu_nonblock_load_valid_m         = Output(Bool())
    val lsu_nonblock_load_tag_m           = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
    val lsu_nonblock_load_inv_r           = Output(Bool())
    val lsu_nonblock_load_inv_tag_r       = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
    val lsu_nonblock_load_data_valid      = Output(Bool())
    val lsu_nonblock_load_data_error      = Output(Bool())
    val lsu_nonblock_load_data_tag        = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
    val lsu_nonblock_load_data            = Output(UInt(32.W))

    val lsu_pmu_load_external_m           = Output(Bool())
    val lsu_pmu_store_external_m          = Output(Bool())
    val lsu_pmu_misaligned_m              = Output(Bool())
    val lsu_pmu_bus_trxn                  = Output(Bool())
    val lsu_pmu_bus_misaligned            = Output(Bool())
    val lsu_pmu_bus_error                 = Output(Bool())
    val lsu_pmu_bus_busy                  = Output(Bool())

    val lsu_trigger_match_m               = Output(UInt(4.W))
    // DCCM ports
    val dccm_wren                         = Output(Bool())
    val dccm_rden                         = Output(Bool())
    val dccm_wr_addr_lo                   = Output(UInt(DCCM_BITS.W))
    val dccm_wr_addr_hi                   = Output(UInt(DCCM_BITS.W))
    val dccm_rd_addr_lo                   = Output(UInt(DCCM_BITS.W))
    val dccm_rd_addr_hi                   = Output(UInt(DCCM_BITS.W))
    val dccm_wr_data_lo                   = Output(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_wr_data_hi                   = Output(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_rd_data_lo                   = Input(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_rd_data_hi                   = Input(UInt(DCCM_FDATA_WIDTH.W))
    // PIC ports
    val picm_wren                         = Output(Bool())
    val picm_rden                         = Output(Bool())
    val picm_mken                         = Output(Bool())
    val picm_rdaddr                       = Output(UInt(32.W))
    val picm_wraddr                       = Output(UInt(32.W))
    val picm_wr_data                      = Output(UInt(32.W))
    val picm_rd_data                      = Input(UInt(32.W))

    // AXI Write Channels

    val lsu_axi_awvalid                   = Output(Bool())
    val lsu_axi_awlock                    = Output(Bool())
    val lsu_axi_awready                   = Input(Bool())
    val lsu_axi_awid                      = Output(UInt(LSU_BUS_TAG.W))
    val lsu_axi_awaddr                    = Output(UInt(32.W))
    val lsu_axi_awregion                  = Output(UInt(4.W))
    val lsu_axi_awlen                     = Output(UInt(8.W))
    val lsu_axi_awsize                    = Output(UInt(3.W))
    val lsu_axi_awburst                   = Output(UInt(2.W))
    val lsu_axi_awcache                   = Output(UInt(4.W))
    val lsu_axi_awprot                    = Output(UInt(3.W))
    val lsu_axi_awqos                     = Output(UInt(4.W))
    val lsu_axi_wvalid                    = Output(Bool())
    val lsu_axi_wready                    = Input(Bool())
    val lsu_axi_wdata                     = Output(UInt(64.W))
    val lsu_axi_wstrb                     = Output(UInt(8.W))
    val lsu_axi_wlast                     = Output(Bool())
    val lsu_axi_bvalid                    = Input(Bool())
    val lsu_axi_bready                    = Output(Bool())
    val lsu_axi_bresp                     = Input(UInt(2.W))
    val lsu_axi_bid                       = Input(UInt(LSU_BUS_TAG.W))

    // AXI Read Channels

    val lsu_axi_arvalid                   = Output(Bool())
    val lsu_axi_arlock                    = Output(Bool())
    val lsu_axi_arready                   = Input(Bool())
    val lsu_axi_arid                      = Output(UInt(LSU_BUS_TAG.W))
    val lsu_axi_araddr                    = Output(UInt(32.W))
    val lsu_axi_arregion                  = Output(UInt(4.W))
    val lsu_axi_arlen                     = Output(UInt(8.W))
    val lsu_axi_arsize                    = Output(UInt(3.W))
    val lsu_axi_arburst                   = Output(UInt(2.W))
    val lsu_axi_arcache                   = Output(UInt(4.W))
    val lsu_axi_arprot                    = Output(UInt(3.W))
    val lsu_axi_arqos                     = Output(UInt(4.W))
    val lsu_axi_rvalid                    = Input(Bool())
    val lsu_axi_rready                    = Output(Bool())
    val lsu_axi_rdata                     = Input(UInt(64.W))
    val lsu_axi_rlast                     = Input(Bool())
    val lsu_axi_rresp                     = Input(UInt(2.W))
    val lsu_axi_rid                       = Input(UInt(LSU_BUS_TAG.W))

    val lsu_bus_clk_en                    = Input(Bool())
    // DMA slave

    val dma_dccm_req                      = Input(Bool())
    val dma_mem_write                     = Input(Bool())
    val dccm_dma_rvalid                   = Output(Bool())
    val dccm_dma_ecc_error                = Output(Bool())
    val dma_mem_tag                       = Input(UInt(3.W))
    val dma_mem_addr                      = Input(UInt(32.W))
    val dma_mem_sz                        = Input(UInt(3.W))
    val dma_mem_wdata                     = Input(UInt(64.W))
    val dccm_dma_rtag                     = Output(UInt(3.W))
    val dccm_dma_rdata                    = Output(UInt(64.W))
    val dccm_ready                        = Output(Bool())

    val scan_mode                         = Input(Bool())
    val free_clk                          = Input(Clock())

  })
  val dma_dccm_wdata               = WireInit(0.U(64.W))
  val dma_dccm_wdata_lo            = WireInit(0.U(32.W))
  val dma_dccm_wdata_hi            = WireInit(0.U(32.W))
  val dma_mem_tag_m                = WireInit(0.U(3.W))
  val lsu_raw_fwd_lo_r             = WireInit(0.U(1.W))
  val lsu_raw_fwd_hi_r             = WireInit(0.U(1.W))

  val lsu_lsc_ctl    = Module(new el2_lsu_lsc_ctl )
  io.lsu_result_m := lsu_lsc_ctl.io.lsu_result_m
  io.lsu_result_corr_r := lsu_lsc_ctl.io.lsu_result_corr_r
  val dccm_ctl       = Module(new el2_lsu_dccm_ctl )
  val stbuf          = Module(new el2_lsu_stbuf )
  val ecc            = Module(new el2_lsu_ecc )
  val trigger        = Module(new el2_lsu_trigger )
  val clkdomain      = Module(new el2_lsu_clkdomain )
  val bus_intf       = Module(new el2_lsu_bus_intf )

  val lsu_raw_fwd_lo_m = stbuf.io.stbuf_fwdbyteen_lo_m.orR
  val lsu_raw_fwd_hi_m = stbuf.io.stbuf_fwdbyteen_hi_m.orR

  // block stores in decode  - for either bus or stbuf reasons
  io.lsu_store_stall_any := stbuf.io.lsu_stbuf_full_any | bus_intf.io.lsu_bus_buffer_full_any | dccm_ctl.io.ld_single_ecc_error_r_ff
  io.lsu_load_stall_any := bus_intf.io.lsu_bus_buffer_full_any | dccm_ctl.io.ld_single_ecc_error_r_ff
  io.lsu_fastint_stall_any := dccm_ctl.io.ld_single_ecc_error_r  // Stall the fastint in decode-1 stage

  // Ready to accept dma trxns
  // There can't be any inpipe forwarding from non-dma packet to dma packet since they can be flushed so we can't have st in r when dma is in m
  val dma_mem_tag_d  = io.dma_mem_tag
  val ldst_nodma_mtor = lsu_lsc_ctl.io.lsu_pkt_m.valid & !lsu_lsc_ctl.io.lsu_pkt_m.bits.dma & (lsu_lsc_ctl.io.addr_in_dccm_m | lsu_lsc_ctl.io.addr_in_pic_m) & lsu_lsc_ctl.io.lsu_pkt_m.bits.store
  io.dccm_ready := !(io.dec_lsu_valid_raw_d | ldst_nodma_mtor | dccm_ctl.io.ld_single_ecc_error_r_ff)
  val dma_dccm_wen = io.dma_dccm_req & io.dma_mem_write & lsu_lsc_ctl.io.addr_in_dccm_d
  val dma_pic_wen  = io.dma_dccm_req & io.dma_mem_write & lsu_lsc_ctl.io.addr_in_pic_d
  dma_dccm_wdata := io.dma_mem_wdata >> Cat(io.dma_mem_addr(2,0), 0.U(3.W)) // Shift the dma data to lower bits to make it consistent to lsu stores
  dma_dccm_wdata_hi := dma_dccm_wdata(63,32)
  dma_dccm_wdata_lo := dma_dccm_wdata(31,0)

  val flush_m_up = io.dec_tlu_flush_lower_r
  val flush_r    = io.dec_tlu_i0_kill_writeb_r

  // lsu halt idle. This is used for entering the halt mode. Also, DMA accesses are allowed during fence.
  // Indicates non-idle if there is a instruction valid in d-r or read/write buffers are non-empty since they can come with error
  // Store buffer now have only non-dma dccm stores
  // stbuf_empty not needed since it has only dccm stores
  io.lsu_idle_any := !((lsu_lsc_ctl.io.lsu_pkt_m.valid & !lsu_lsc_ctl.io.lsu_pkt_m.bits.dma) | (lsu_lsc_ctl.io.lsu_pkt_r.valid & !lsu_lsc_ctl.io.lsu_pkt_r.bits.dma)) & bus_intf.io.lsu_bus_buffer_empty_any & bus_intf.io.lsu_bus_idle_any
  // Instantiate the store buffer
  val store_stbuf_reqvld_r = lsu_lsc_ctl.io.lsu_pkt_r.valid & lsu_lsc_ctl.io.lsu_pkt_r.bits.store & lsu_lsc_ctl.io.addr_in_dccm_r & !flush_r & !lsu_lsc_ctl.io.lsu_pkt_r.bits.dma
  // Disable Forwarding for now
  val lsu_cmpen_m = lsu_lsc_ctl.io.lsu_pkt_m.valid & (lsu_lsc_ctl.io.lsu_pkt_m.bits.load | lsu_lsc_ctl.io.lsu_pkt_m.bits.store) & (lsu_lsc_ctl.io.addr_in_dccm_m | lsu_lsc_ctl.io.addr_in_pic_m)
  // Bus signals
  val lsu_busreq_m = lsu_lsc_ctl.io.lsu_pkt_m.valid & ((lsu_lsc_ctl.io.lsu_pkt_m.bits.load | lsu_lsc_ctl.io.lsu_pkt_m.bits.store) & lsu_lsc_ctl.io.addr_external_m) & !flush_m_up & !lsu_lsc_ctl.io.lsu_exc_m & !lsu_lsc_ctl.io.lsu_pkt_m.bits.fast_int
  // PMU signals
  io.lsu_pmu_misaligned_m := lsu_lsc_ctl.io.lsu_pkt_m.valid & ((lsu_lsc_ctl.io.lsu_pkt_m.bits.half & lsu_lsc_ctl.io.lsu_addr_m(0)) | (lsu_lsc_ctl.io.lsu_pkt_m.bits.word & lsu_lsc_ctl.io.lsu_addr_m(1,0).orR))
  io.lsu_pmu_load_external_m  := lsu_lsc_ctl.io.lsu_pkt_m.valid & lsu_lsc_ctl.io.lsu_pkt_m.bits.load & lsu_lsc_ctl.io.addr_external_m
  io.lsu_pmu_store_external_m := lsu_lsc_ctl.io.lsu_pkt_m.valid & lsu_lsc_ctl.io.lsu_pkt_m.bits.store & lsu_lsc_ctl.io.addr_external_m

  //LSU_LSC_Control
  //Inputs
  lsu_lsc_ctl.io.lsu_c1_m_clk                := clkdomain.io.lsu_c1_m_clk
  lsu_lsc_ctl.io.lsu_c1_r_clk                := clkdomain.io.lsu_c1_r_clk
  lsu_lsc_ctl.io.lsu_c2_m_clk                := clkdomain.io.lsu_c2_m_clk
  lsu_lsc_ctl.io.lsu_c2_r_clk                := clkdomain.io.lsu_c2_r_clk
  lsu_lsc_ctl.io.lsu_store_c1_m_clk          := clkdomain.io.lsu_store_c1_m_clk
  lsu_lsc_ctl.io.lsu_ld_data_r               := dccm_ctl.io.lsu_ld_data_r
  lsu_lsc_ctl.io.lsu_ld_data_corr_r          := dccm_ctl.io.lsu_ld_data_corr_r
  lsu_lsc_ctl.io.lsu_single_ecc_error_r      := ecc.io.lsu_single_ecc_error_r
  lsu_lsc_ctl.io.lsu_double_ecc_error_r      := ecc.io.lsu_double_ecc_error_r
  lsu_lsc_ctl.io.lsu_ld_data_m               := dccm_ctl.io.lsu_ld_data_m
  lsu_lsc_ctl.io.lsu_single_ecc_error_m      := ecc.io.lsu_single_ecc_error_m
  lsu_lsc_ctl.io.lsu_double_ecc_error_m      := ecc.io.lsu_double_ecc_error_m
  lsu_lsc_ctl.io.flush_m_up                  := flush_m_up
  lsu_lsc_ctl.io.flush_r                     := flush_r
  lsu_lsc_ctl.io.exu_lsu_rs1_d               := io.exu_lsu_rs1_d
  lsu_lsc_ctl.io.exu_lsu_rs2_d               := io.exu_lsu_rs2_d
  lsu_lsc_ctl.io.lsu_p                       <> io.lsu_p
  lsu_lsc_ctl.io.dec_lsu_valid_raw_d         := io.dec_lsu_valid_raw_d
  lsu_lsc_ctl.io.dec_lsu_offset_d            := io.dec_lsu_offset_d
  lsu_lsc_ctl.io.picm_mask_data_m            := dccm_ctl.io.picm_mask_data_m
  lsu_lsc_ctl.io.bus_read_data_m             := bus_intf.io.bus_read_data_m
  lsu_lsc_ctl.io.dma_dccm_req                := io.dma_dccm_req
  lsu_lsc_ctl.io.dma_mem_addr                := io.dma_mem_addr
  lsu_lsc_ctl.io.dma_mem_sz                  := io.dma_mem_sz
  lsu_lsc_ctl.io.dma_mem_write               := io.dma_mem_write
  lsu_lsc_ctl.io.dma_mem_wdata               := io.dma_mem_wdata
  lsu_lsc_ctl.io.dec_tlu_mrac_ff             := io.dec_tlu_mrac_ff
  lsu_lsc_ctl.io.scan_mode                   := io.scan_mode
  //Outputs

  io.lsu_single_ecc_error_incr                  := lsu_lsc_ctl.io.lsu_single_ecc_error_incr
  io.lsu_error_pkt_r                            <> lsu_lsc_ctl.io.lsu_error_pkt_r
  io.lsu_fir_addr                               <> lsu_lsc_ctl.io.lsu_fir_addr
  io.lsu_fir_error                              <> lsu_lsc_ctl.io.lsu_fir_error
  // DCCM Control
  //Inputs
  dccm_ctl.io.lsu_c2_m_clk                   := clkdomain.io.lsu_c2_m_clk
  dccm_ctl.io.lsu_c2_r_clk                   := clkdomain.io.lsu_c2_r_clk
  dccm_ctl.io.lsu_free_c2_clk                := clkdomain.io.lsu_free_c2_clk
  dccm_ctl.io.lsu_c1_r_clk                   := clkdomain.io.lsu_c1_r_clk
  dccm_ctl.io.lsu_store_c1_r_clk             := clkdomain.io.lsu_store_c1_r_clk
  //dccm_ctl.io.clk                            := clock
  dccm_ctl.io.lsu_pkt_d                      <> lsu_lsc_ctl.io.lsu_pkt_d
  dccm_ctl.io.lsu_pkt_m                      <> lsu_lsc_ctl.io.lsu_pkt_m
  dccm_ctl.io.lsu_pkt_r                      <> lsu_lsc_ctl.io.lsu_pkt_r
  dccm_ctl.io.addr_in_dccm_d                 := lsu_lsc_ctl.io.addr_in_dccm_d
  dccm_ctl.io.addr_in_dccm_m                 := lsu_lsc_ctl.io.addr_in_dccm_m
  dccm_ctl.io.addr_in_dccm_r                 := lsu_lsc_ctl.io.addr_in_dccm_r
  dccm_ctl.io.addr_in_pic_d                  := lsu_lsc_ctl.io.addr_in_pic_d
  dccm_ctl.io.addr_in_pic_m                  := lsu_lsc_ctl.io.addr_in_pic_m
  dccm_ctl.io.addr_in_pic_r                  := lsu_lsc_ctl.io.addr_in_pic_r
  dccm_ctl.io.lsu_raw_fwd_lo_r               := lsu_raw_fwd_lo_r
  dccm_ctl.io.lsu_raw_fwd_hi_r               := lsu_raw_fwd_hi_r
  dccm_ctl.io.lsu_commit_r                   := lsu_lsc_ctl.io.lsu_commit_r
  dccm_ctl.io.lsu_addr_d                     := lsu_lsc_ctl.io.lsu_addr_d
  dccm_ctl.io.lsu_addr_m                     := lsu_lsc_ctl.io.lsu_addr_m
  dccm_ctl.io.lsu_addr_r                     := lsu_lsc_ctl.io.lsu_addr_r
  dccm_ctl.io.end_addr_d                     := lsu_lsc_ctl.io.end_addr_d
  dccm_ctl.io.end_addr_m                     := lsu_lsc_ctl.io.end_addr_m
  dccm_ctl.io.end_addr_r                     := lsu_lsc_ctl.io.end_addr_r
  dccm_ctl.io.stbuf_reqvld_any               := stbuf.io.stbuf_reqvld_any
  dccm_ctl.io.stbuf_addr_any                 := stbuf.io.stbuf_addr_any
  dccm_ctl.io.stbuf_data_any                 := stbuf.io.stbuf_data_any
  dccm_ctl.io.stbuf_ecc_any                  := ecc.io.stbuf_ecc_any
  dccm_ctl.io.stbuf_fwddata_hi_m             := stbuf.io.stbuf_fwddata_hi_m
  dccm_ctl.io.stbuf_fwddata_lo_m             := stbuf.io.stbuf_fwddata_lo_m
  dccm_ctl.io.stbuf_fwdbyteen_lo_m           := stbuf.io.stbuf_fwdbyteen_lo_m
  dccm_ctl.io.stbuf_fwdbyteen_hi_m           := stbuf.io.stbuf_fwdbyteen_hi_m
  dccm_ctl.io.lsu_double_ecc_error_r         := ecc.io.lsu_double_ecc_error_r
  dccm_ctl.io.single_ecc_error_hi_r          := ecc.io.single_ecc_error_hi_r
  dccm_ctl.io.single_ecc_error_lo_r          := ecc.io.single_ecc_error_lo_r
  dccm_ctl.io.sec_data_hi_r                  := ecc.io.sec_data_hi_r
  dccm_ctl.io.sec_data_lo_r                  := ecc.io.sec_data_lo_r
  dccm_ctl.io.sec_data_hi_r_ff               := ecc.io.sec_data_hi_r_ff
  dccm_ctl.io.sec_data_lo_r_ff               := ecc.io.sec_data_lo_r_ff
  dccm_ctl.io.sec_data_ecc_hi_r_ff           := ecc.io.sec_data_ecc_hi_r_ff
  dccm_ctl.io.sec_data_ecc_lo_r_ff           := ecc.io.sec_data_ecc_lo_r_ff
  dccm_ctl.io.lsu_double_ecc_error_m         := ecc.io.lsu_double_ecc_error_m
  dccm_ctl.io.sec_data_hi_m                  := ecc.io.sec_data_hi_m
  dccm_ctl.io.sec_data_lo_m                  := ecc.io.sec_data_lo_m
  dccm_ctl.io.store_data_m                   := lsu_lsc_ctl.io.store_data_m
  dccm_ctl.io.dma_dccm_wen                   := dma_dccm_wen
  dccm_ctl.io.dma_pic_wen                    := dma_pic_wen
  dccm_ctl.io.dma_mem_tag_m                  := dma_mem_tag_m
  dccm_ctl.io.dma_mem_addr                   := io.dma_mem_addr
  dccm_ctl.io.dma_mem_wdata                  := io.dma_mem_wdata
  dccm_ctl.io.dma_dccm_wdata_lo              := dma_dccm_wdata_lo
  dccm_ctl.io.dma_dccm_wdata_hi              := dma_dccm_wdata_hi
  dccm_ctl.io.dma_dccm_wdata_ecc_hi          := ecc.io.dma_dccm_wdata_ecc_hi
  dccm_ctl.io.dma_dccm_wdata_ecc_lo          := ecc.io.dma_dccm_wdata_ecc_lo
  dccm_ctl.io.dccm_rd_data_lo                := io.dccm_rd_data_lo
  dccm_ctl.io.dccm_rd_data_hi                := io.dccm_rd_data_hi
  dccm_ctl.io.picm_rd_data                   := io.picm_rd_data
  dccm_ctl.io.scan_mode                      := io.scan_mode
  //Outputs
  io.dccm_dma_rvalid                            := dccm_ctl.io.dccm_dma_rvalid
  io.dccm_dma_ecc_error                         := dccm_ctl.io.dccm_dma_ecc_error
  io.dccm_dma_rtag                              := dccm_ctl.io.dccm_dma_rtag
  io.dccm_dma_rdata                             := dccm_ctl.io.dccm_dma_rdata
  io.dccm_wren                                  := dccm_ctl.io.dccm_wren
  io.dccm_rden                                  := dccm_ctl.io.dccm_rden
  io.dccm_wr_addr_lo                            := dccm_ctl.io.dccm_wr_addr_lo
  io.dccm_wr_data_lo                            := dccm_ctl.io.dccm_wr_data_lo
  io.dccm_rd_addr_lo                            := dccm_ctl.io.dccm_rd_addr_lo
  io.dccm_wr_addr_hi                            := dccm_ctl.io.dccm_wr_addr_hi
  io.dccm_wr_data_hi                            := dccm_ctl.io.dccm_wr_data_hi
  io.dccm_rd_addr_hi                            := dccm_ctl.io.dccm_rd_addr_hi
  io.picm_wren                                  := dccm_ctl.io.picm_wren
  io.picm_rden                                  := dccm_ctl.io.picm_rden
  io.picm_mken                                  := dccm_ctl.io.picm_mken
  io.picm_rdaddr                                := dccm_ctl.io.picm_rdaddr
  io.picm_wraddr                                := dccm_ctl.io.picm_wraddr
  io.picm_wr_data                               := dccm_ctl.io.picm_wr_data
  //Store Buffer
  //Inputs
  stbuf.io.lsu_c1_m_clk                         := clkdomain.io.lsu_c1_m_clk
  stbuf.io.lsu_c1_r_clk        	               := clkdomain.io.lsu_c1_m_clk
  stbuf.io.lsu_stbuf_c1_clk       	             := clkdomain.io.lsu_stbuf_c1_clk
  stbuf.io.lsu_free_c2_clk        	             := clkdomain.io.lsu_free_c2_clk
  stbuf.io.lsu_pkt_m           	               <> lsu_lsc_ctl.io.lsu_pkt_m
  stbuf.io.lsu_pkt_r           	               <> lsu_lsc_ctl.io.lsu_pkt_r
  stbuf.io.store_stbuf_reqvld_r	               := store_stbuf_reqvld_r
  stbuf.io.lsu_commit_r                         := lsu_lsc_ctl.io.lsu_commit_r
  stbuf.io.dec_lsu_valid_raw_d                  := io.dec_lsu_valid_raw_d
  stbuf.io.store_data_hi_r	   	  	             := dccm_ctl.io.store_data_hi_r
  stbuf.io.store_data_lo_r	   	  	             := dccm_ctl.io.store_data_lo_r
  stbuf.io.store_datafn_hi_r                    := dccm_ctl.io.store_datafn_hi_r
  stbuf.io.store_datafn_lo_r	  	               := dccm_ctl.io.store_datafn_lo_r
  stbuf.io.lsu_stbuf_commit_any	  	           := dccm_ctl.io.lsu_stbuf_commit_any
  stbuf.io.lsu_addr_d	   	  		               := lsu_lsc_ctl.io.lsu_addr_d
  stbuf.io.lsu_addr_m	   	  		               := lsu_lsc_ctl.io.lsu_addr_m
  stbuf.io.lsu_addr_r	   	  		               := lsu_lsc_ctl.io.lsu_addr_r
  stbuf.io.end_addr_d	   	  		               := lsu_lsc_ctl.io.end_addr_d
  stbuf.io.end_addr_m	   	  		               := lsu_lsc_ctl.io.end_addr_m
  stbuf.io.end_addr_r	   	  		               := lsu_lsc_ctl.io.end_addr_r
  stbuf.io.addr_in_dccm_m                       := lsu_lsc_ctl.io.addr_in_dccm_m
  stbuf.io.addr_in_dccm_r   	  	               := lsu_lsc_ctl.io.addr_in_dccm_r
  stbuf.io.lsu_cmpen_m   	                     := lsu_cmpen_m
  stbuf.io.scan_mode                            := io.scan_mode

  // ECC
  //Inputs
  ecc.io.lsu_c2_r_clk        	                   := clkdomain.io.lsu_c2_r_clk
  ecc.io.lsu_pkt_m           	                   <> lsu_lsc_ctl.io.lsu_pkt_m
  ecc.io.lsu_pkt_r           	                   <> lsu_lsc_ctl.io.lsu_pkt_r
  ecc.io.stbuf_data_any	   	                     := stbuf.io.stbuf_data_any
  ecc.io.dec_tlu_core_ecc_disable                := io.dec_tlu_core_ecc_disable
  ecc.io.lsu_dccm_rden_r        	               := dccm_ctl.io.lsu_dccm_rden_r
  ecc.io.addr_in_dccm_r                          := lsu_lsc_ctl.io.addr_in_dccm_r
  ecc.io.lsu_addr_r	   	                         := lsu_lsc_ctl.io.lsu_addr_r
  ecc.io.end_addr_r	   	                         := lsu_lsc_ctl.io.end_addr_r
  ecc.io.lsu_addr_m	   	                         := lsu_lsc_ctl.io.lsu_addr_m
  ecc.io.end_addr_m	   	                         := lsu_lsc_ctl.io.end_addr_m
  ecc.io.dccm_rdata_hi_r   	                     := dccm_ctl.io.dccm_rdata_hi_r
  ecc.io.dccm_rdata_lo_r   	                     := dccm_ctl.io.dccm_rdata_lo_r
  ecc.io.dccm_rdata_hi_m   	                     := dccm_ctl.io.dccm_rdata_hi_m
  ecc.io.dccm_rdata_lo_m   	                     := dccm_ctl.io.dccm_rdata_lo_m
  ecc.io.dccm_data_ecc_hi_r                      := dccm_ctl.io.dccm_data_ecc_hi_r
  ecc.io.dccm_data_ecc_lo_r                      := dccm_ctl.io.dccm_data_ecc_lo_r
  ecc.io.dccm_data_ecc_hi_m                      := dccm_ctl.io.dccm_data_ecc_hi_m
  ecc.io.dccm_data_ecc_lo_m                      := dccm_ctl.io.dccm_data_ecc_lo_m
  ecc.io.ld_single_ecc_error_r                   := dccm_ctl.io.ld_single_ecc_error_r
  ecc.io.ld_single_ecc_error_r_ff                := dccm_ctl.io.ld_single_ecc_error_r_ff
  ecc.io.lsu_dccm_rden_m                         := dccm_ctl.io.lsu_dccm_rden_m
  ecc.io.addr_in_dccm_m                          := lsu_lsc_ctl.io.addr_in_dccm_m
  ecc.io.dma_dccm_wen                            := dma_dccm_wen
  ecc.io.dma_dccm_wdata_lo                       := dma_dccm_wdata_lo
  ecc.io.dma_dccm_wdata_hi                       := dma_dccm_wdata_hi
  ecc.io.scan_mode                               := io.scan_mode

  //Trigger
  //Inputs
  trigger.io.trigger_pkt_any                     <> io.trigger_pkt_any
  trigger.io.lsu_pkt_m                           <> lsu_lsc_ctl.io.lsu_pkt_m
  trigger.io.lsu_addr_m                          := lsu_lsc_ctl.io.lsu_addr_m
  trigger.io.store_data_m                        := lsu_lsc_ctl.io.store_data_m
  //Outputs
  io.lsu_trigger_match_m                         :=trigger.io.lsu_trigger_match_m

  //Clock Domain
  //Inputs
  clkdomain.io.free_clk                          := io.free_clk
  clkdomain.io.clk_override                      := io.clk_override
  clkdomain.io.addr_in_dccm_m                    := lsu_lsc_ctl.io.addr_in_dccm_m
  clkdomain.io.dma_dccm_req                      := io.dma_dccm_req
  clkdomain.io.ldst_stbuf_reqvld_r               := stbuf.io.ldst_stbuf_reqvld_r
  clkdomain.io.stbuf_reqvld_any                  := stbuf.io.stbuf_reqvld_any
  clkdomain.io.stbuf_reqvld_flushed_any          := stbuf.io.stbuf_reqvld_flushed_any
  clkdomain.io.lsu_busreq_r                      := bus_intf.io.lsu_busreq_r
  clkdomain.io.lsu_bus_buffer_pend_any           := bus_intf.io.lsu_bus_buffer_pend_any
  clkdomain.io.lsu_bus_buffer_empty_any          := bus_intf.io.lsu_bus_buffer_empty_any
  clkdomain.io.lsu_stbuf_empty_any               := stbuf.io.lsu_stbuf_empty_any
  clkdomain.io.lsu_bus_clk_en                    := io.lsu_bus_clk_en
  clkdomain.io.lsu_p                             := io.lsu_p
  clkdomain.io.lsu_pkt_d                         <> lsu_lsc_ctl.io.lsu_pkt_d
  clkdomain.io.lsu_pkt_m                         <> lsu_lsc_ctl.io.lsu_pkt_m
  clkdomain.io.lsu_pkt_r                         <>  lsu_lsc_ctl.io.lsu_pkt_r
  clkdomain.io.scan_mode                         := io.scan_mode

  //Bus Interface
  //Inputs
  bus_intf.io.scan_mode                         := io.scan_mode
  bus_intf.io.dec_tlu_external_ldfwd_disable    := io.dec_tlu_external_ldfwd_disable
  bus_intf.io.dec_tlu_wb_coalescing_disable     := io.dec_tlu_wb_coalescing_disable
  bus_intf.io.dec_tlu_sideeffect_posted_disable := io.dec_tlu_sideeffect_posted_disable
  bus_intf.io.lsu_c1_m_clk                      := clkdomain.io.lsu_c1_m_clk
  bus_intf.io.lsu_c1_r_clk                      := clkdomain.io.lsu_c1_r_clk
  bus_intf.io.lsu_c2_r_clk                      := clkdomain.io.lsu_c2_r_clk
  bus_intf.io.lsu_bus_ibuf_c1_clk               := clkdomain.io.lsu_bus_ibuf_c1_clk
  bus_intf.io.lsu_bus_obuf_c1_clk               := clkdomain.io.lsu_bus_obuf_c1_clk
  bus_intf.io.lsu_bus_buf_c1_clk                := clkdomain.io.lsu_bus_buf_c1_clk
  bus_intf.io.lsu_free_c2_clk                   := clkdomain.io.lsu_free_c2_clk
  bus_intf.io.free_clk                          := io.free_clk
  bus_intf.io.lsu_busm_clk                      := clkdomain.io.lsu_busm_clk
  bus_intf.io.dec_lsu_valid_raw_d               := io.dec_lsu_valid_raw_d
  bus_intf.io.lsu_busreq_m                      := lsu_busreq_m
  bus_intf.io.lsu_addr_d                        := lsu_lsc_ctl.io.lsu_addr_d
  bus_intf.io.lsu_addr_m                        := lsu_lsc_ctl.io.lsu_addr_m
  bus_intf.io.lsu_addr_r                        := lsu_lsc_ctl.io.lsu_addr_r
  bus_intf.io.end_addr_d                        := lsu_lsc_ctl.io.end_addr_d
  bus_intf.io.end_addr_m                        := lsu_lsc_ctl.io.end_addr_m
  bus_intf.io.end_addr_r                        := lsu_lsc_ctl.io.end_addr_r
  bus_intf.io.store_data_r                      := dccm_ctl.io.store_data_r
  bus_intf.io.lsu_pkt_m                         <> lsu_lsc_ctl.io.lsu_pkt_m
  bus_intf.io.lsu_pkt_r                         <> lsu_lsc_ctl.io.lsu_pkt_r
  bus_intf.io.dec_tlu_force_halt                := io.dec_tlu_force_halt
  bus_intf.io.lsu_commit_r                      := lsu_lsc_ctl.io.lsu_commit_r
  bus_intf.io.is_sideeffects_m                  := lsu_lsc_ctl.io.is_sideeffects_m
  bus_intf.io.flush_m_up                        := flush_m_up
  bus_intf.io.flush_r                           := flush_r
  //Outputs

  io.lsu_imprecise_error_load_any               := bus_intf.io.lsu_imprecise_error_load_any
  io.lsu_imprecise_error_store_any              := bus_intf.io.lsu_imprecise_error_store_any
  io.lsu_imprecise_error_addr_any               := bus_intf.io.lsu_imprecise_error_addr_any
  io.lsu_nonblock_load_valid_m                  := bus_intf.io.lsu_nonblock_load_valid_m
  io.lsu_nonblock_load_tag_m                    := bus_intf.io.lsu_nonblock_load_tag_m
  io.lsu_nonblock_load_inv_r                    := bus_intf.io.lsu_nonblock_load_inv_r
  io.lsu_nonblock_load_inv_tag_r                := bus_intf.io.lsu_nonblock_load_inv_tag_r
  io.lsu_nonblock_load_data_valid               := bus_intf.io.lsu_nonblock_load_data_valid
  io.lsu_nonblock_load_data_error               := bus_intf.io.lsu_nonblock_load_data_error
  io.lsu_nonblock_load_data_tag                 := bus_intf.io.lsu_nonblock_load_data_tag
  io.lsu_nonblock_load_data                     := bus_intf.io.lsu_nonblock_load_data
  io.lsu_pmu_bus_trxn                           := bus_intf.io.lsu_pmu_bus_trxn
  io.lsu_pmu_bus_misaligned                     := bus_intf.io.lsu_pmu_bus_misaligned
  io.lsu_pmu_bus_error                          := bus_intf.io.lsu_pmu_bus_error
  io.lsu_pmu_bus_busy                           := bus_intf.io.lsu_pmu_bus_busy
  io.lsu_axi_awvalid                            := bus_intf.io.lsu_axi_awvalid
  bus_intf.io.lsu_axi_awready                   := io.lsu_axi_awready
  io.lsu_axi_awid                               := bus_intf.io.lsu_axi_awid
  io.lsu_axi_awaddr                             := bus_intf.io.lsu_axi_awaddr
  io.lsu_axi_awregion                           := bus_intf.io.lsu_axi_awregion
  io.lsu_axi_awlen                              := bus_intf.io.lsu_axi_awlen
  io.lsu_axi_awsize                             := bus_intf.io.lsu_axi_awsize
  io.lsu_axi_awburst                            := bus_intf.io.lsu_axi_awburst
  io.lsu_axi_awlock                             := bus_intf.io.lsu_axi_awlock
  io.lsu_axi_awcache                            := bus_intf.io.lsu_axi_awcache
  io.lsu_axi_awprot                             := bus_intf.io.lsu_axi_awprot
  io.lsu_axi_awqos                              := bus_intf.io.lsu_axi_awqos
  io.lsu_axi_wvalid                             := bus_intf.io.lsu_axi_wvalid
  bus_intf.io.lsu_axi_wready                    := io.lsu_axi_wready
  io.lsu_axi_wdata                              := bus_intf.io.lsu_axi_wdata
  io.lsu_axi_wstrb                              := bus_intf.io.lsu_axi_wstrb
  io.lsu_axi_wlast                              := bus_intf.io.lsu_axi_wlast
  bus_intf.io.lsu_axi_bvalid                    := io.lsu_axi_bvalid
  io.lsu_axi_bready                             := bus_intf.io.lsu_axi_bready
  bus_intf.io.lsu_axi_bresp                     := io.lsu_axi_bresp
  bus_intf.io.lsu_axi_bid                       := io.lsu_axi_bid
  io.lsu_axi_arvalid                            := bus_intf.io.lsu_axi_arvalid
  bus_intf.io.lsu_axi_arready                   := io.lsu_axi_arready
  io.lsu_axi_arid                               := bus_intf.io.lsu_axi_arid
  io.lsu_axi_araddr                             := bus_intf.io.lsu_axi_araddr
  io.lsu_axi_arregion                           := bus_intf.io.lsu_axi_arregion
  io.lsu_axi_arlen                              := bus_intf.io.lsu_axi_arlen
  io.lsu_axi_arsize                             := bus_intf.io.lsu_axi_arsize
  io.lsu_axi_arburst                            := bus_intf.io.lsu_axi_arburst
  io.lsu_axi_arlock                             := bus_intf.io.lsu_axi_arlock
  io.lsu_axi_arcache                            := bus_intf.io.lsu_axi_arcache
  io.lsu_axi_arprot                             := bus_intf.io.lsu_axi_arprot
  io.lsu_axi_arqos                              := bus_intf.io.lsu_axi_arqos
  bus_intf.io.lsu_axi_rvalid                    := io.lsu_axi_rvalid
  io.lsu_axi_rready                             := bus_intf.io.lsu_axi_rready
  bus_intf.io.lsu_axi_rid                       := io.lsu_axi_rid
  bus_intf.io.lsu_axi_rdata                     := io.lsu_axi_rdata
  bus_intf.io.lsu_axi_rresp                     := io.lsu_axi_rresp
  bus_intf.io.lsu_axi_rlast                     := io.lsu_axi_rlast
  bus_intf.io.lsu_bus_clk_en                    := io.lsu_bus_clk_en

  withClock(clkdomain.io.lsu_c1_m_clk){dma_mem_tag_m    := RegNext(dma_mem_tag_d,0.U)}
  withClock(clkdomain.io.lsu_c2_r_clk){lsu_raw_fwd_hi_r := RegNext(lsu_raw_fwd_hi_m,0.U)}
  withClock(clkdomain.io.lsu_c2_r_clk){lsu_raw_fwd_lo_r := RegNext(lsu_raw_fwd_lo_m,0.U)}

}
object main_lsu_top extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_lsu))
}
