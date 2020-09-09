class  el2_lsu_lsc_ctl extends MultiIOModule  
{
   //val clk         = IO(Input(Clock())) //implicit
   //val rst_l       = IO(Input(1.W)) //implicit
   val scan_mode   = IO(Input(UInt(1.W)))
   val dec_tlu_external_ldfwd_disable     = IO(Input(UInt(1.W)))  // disable load to load forwarding for externals
   val dec_tlu_wb_coalescing_disable      = IO(Input(UInt(1.W)))  // disable write buffer coalescing
   val dec_tlu_sideeffect_posted_disable  = IO(Input(UInt(1.W)))  // disable the posted sideeffect load store to the bus

   // various clocks needed for the bus reads and writes
   val lsu_c1_m_clk        = IO(Input(Clock()))
   val lsu_c1_r_clk        = IO(Input(Clock()))
   val lsu_c2_r_clk        = IO(Input(Clock()))
   val lsu_bus_ibuf_c1_clk = IO(Input(Clock()))
   val lsu_bus_obuf_c1_clk = IO(Input(Clock()))
   val lsu_bus_buf_c1_clk  = IO(Input(Clock()))
   val lsu_free_c2_clk     = IO(Input(Clock()))
   val free_clk            = IO(Input(Clock()))
   val lsu_busm_clk        = IO(Input(Clock()))


   val dec_lsu_valid_raw_d = IO(Input(UInt(1.W)))
   val lsu_busreq_m        = IO(Input(UInt(1.W)))

   val lsu_pkt_m = new el2_lsu_pkt_t()
   val lsu_pkt_r = new el2_lsu_pkt_t()

   val lsu_addr_d = IO(Input(UInt(32.W)))
   val lsu_addr_m = IO(Input(UInt(32.W)))
   val lsu_addr_r = IO(Input(UInt(32.W)))

   val end_addr_d = IO(Input(UInt(32.W)))
   val end_addr_m = IO(Input(UInt(32.W)))
   val end_addr_r = IO(Input(UInt(32.W)))

   val store_data_m        = IO(Input(UInt(32.W)))
   val dec_tlu_force_halt  = IO(Input(UInt(1.W)))

   val lsu_commit_r     = IO(Input(UInt(1.W)))
   val is_sideeffects_m = IO(Input(UInt(1.W)))
   val flush_m_up       = IO(Input(UInt(1.W)))
   val flush_r          = IO(Input(UInt(1.W)))

   val lsu_busreq_r              = IO(Output(UInt(1.W)))
   val lsu_bus_buffer_pend_any   = IO(Output(UInt(1.W)))
   val lsu_bus_buffer_full_any   = IO(Output(UInt(1.W)))
   val lsu_bus_buffer_empty_any  = IO(Output(UInt(1.W)))
   val lsu_bus_idle_any          = IO(Output(UInt(1.W)))
   val bus_read_data_m           = IO(Output(UInt(32.W)))

   val lsu_imprecise_error_load_any  = IO(Output(UInt(1.W)))
   val lsu_imprecise_error_store_any = IO(Output(UInt(1.W)))
   val lsu_imprecise_error_addr_any  = IO(Output(UInt(32.W)))

   val lsu_nonblock_load_valid_m     = IO(Output(UInt(1.W)))
   val lsu_nonblock_load_tag_m       = IO(Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W)))
   val lsu_nonblock_load_inv_r       = IO(Output(UInt(1.W)))
   val lsu_nonblock_load_inv_tag_r   = IO(Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W)))
   val lsu_nonblock_load_data_valid  = IO(Output(UInt(1.W)))
   val lsu_nonblock_load_data_error  = IO(Output(UInt(32.W)))
   val lsu_nonblock_load_data_tag    = IO(Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W)))
   val lsu_nonblock_load_data        = IO(Output(UInt(32.W)))

   val lsu_pmu_bus_trxn              = IO(Output(UInt(1.W)))
   val lsu_pmu_bus_misaligned        = IO(Output(UInt(1.W)))
   val lsu_pmu_bus_error             = IO(Output(UInt(1.W)))
   val lsu_pmu_bus_busy              = IO(Output(UInt(1.W)))

   val lsu_axi_awvalid     = IO(Output(UInt(1.W)))
   val lsu_axi_awready     = IO(Input(UInt(1.W)))
   val lsu_axi_awid        = IO(Output(UInt(pt1.LSU_BUS_TAG.W)))
   val lsu_axi_awaddr      = IO(Output(UInt(32.W)))
   val lsu_axi_awregion    = IO(Output(UInt(4.W)))
   val lsu_axi_awlen       = IO(Output(UInt(8.W)))
   val lsu_axi_awsize      = IO(Output(UInt(3.W)))
   val lsu_axi_awburst     = IO(Output(UInt(2.W)))
   val lsu_axi_awlock      = IO(Output(UInt(1.W)))
   val lsu_axi_awcache     = IO(Output(UInt(4.W)))
   val lsu_axi_awprot      = IO(Output(UInt(3.W)))
   val lsu_axi_awqos       = IO(Output(UInt(4.W)))

   val lsu_axi_wvalid      = IO(Output(UInt(1.W)))
   val lsu_axi_wready      = IO(Input(UInt(1.W)))
   val lsu_axi_wdata       = IO(Output(UInt(64.W)))
   val lsu_axi_wstrb       = IO(Output(UInt(8.W)))
   val lsu_axi_wlast       = IO(Output(UInt(1.W)))

   val lsu_axi_bvalid      = IO(Input(UInt(1.W)))
   val lsu_axi_bready      = IO(Output(UInt(1.W)))
   val lsu_axi_bresp       = IO(Input(UInt(2.W)))
   val lsu_axi_bid         = IO(Input(UInt(pt1.LSU_BUS_TAG.W)))

   val lsu_axi_arvalid     = IO(Output(UInt(1.W)))
   val lsu_axi_arready     = IO(Input(UInt(1.W)))
   val lsu_axi_arid        = IO(Output(UInt(pt1.LSU_BUS_TAG.W)))
   val lsu_axi_araddr      = IO(Output(UInt(32.W)))
   val lsu_axi_arregion    = IO(Output(UInt(4.W)))
   val lsu_axi_arlen       = IO(Output(UInt(8.W)))
   val lsu_axi_arsize      = IO(Output(UInt(3.W)))
   val lsu_axi_arburst     = IO(Output(UInt(2.W)))
   val lsu_axi_arlock      = IO(Output(UInt(1.W)))
   val lsu_axi_arcache     = IO(Output(UInt(4.W)))
   val lsu_axi_arprot      = IO(Output(UInt(3.W)))
   val lsu_axi_arqos       = IO(Output(UInt(4.W)))

   val lsu_axi_rvalid      = IO(Input(UInt(1.W)))
   val lsu_axi_rready      = IO(Output(UInt(1.W)))
   val lsu_axi_rid         = IO(Input(UInt(pt1.LSU_BUS_TAG.W)))
   val lsu_axi_rdata       = IO(Input(UInt(64.W)))
   val lsu_axi_rresp       = IO(Intput(UInt(2.W)))
   val lsu_axi_rlast       = IO(Intput(UInt(1.W)))

   val lsu_bus_clk_en      = IO(Intput(UInt(1.W)))


   lsu_busreq_r              := 0.U
   lsu_bus_buffer_pend_any   := 0.U
   lsu_bus_buffer_full_any   := 0.U
   lsu_bus_buffer_empty_any  := 0.U
   lsu_bus_idle_any          := 0.U
   bus_read_data_m           := 0.U

   lsu_imprecise_error_load_any  := 0.U
   lsu_imprecise_error_store_any := 0.U
   lsu_imprecise_error_addr_any  := 0.U

   lsu_nonblock_load_valid_m     := 0.U
   lsu_nonblock_load_tag_m       := 0.U
   lsu_nonblock_load_inv_r       := 0.U
   lsu_nonblock_load_inv_tag_r   := 0.U
   lsu_nonblock_load_data_valid  := 0.U
   lsu_nonblock_load_data_error  := 0.U
   lsu_nonblock_load_data_tag    := 0.U
   lsu_nonblock_load_data        := 0.U

   lsu_pmu_bus_trxn              := 0.U
   lsu_pmu_bus_misaligned        := 0.U
   lsu_pmu_bus_error             := 0.U
   lsu_pmu_bus_busy              := 0.U

   lsu_axi_awvalid     := 0.U
   lsu_axi_awid        := 0.U
   lsu_axi_awaddr      := 0.U
   lsu_axi_awregion    := 0.U
   lsu_axi_awlen       := 0.U
   lsu_axi_awsize      := 0.U
   lsu_axi_awburst     := 0.U
   lsu_axi_awlock      := 0.U
   lsu_axi_awcache     := 0.U
   lsu_axi_awprot      := 0.U
   lsu_axi_awqos       := 0.U

   lsu_axi_wvalid      := 0.U
   lsu_axi_wdata       := 0.U
   lsu_axi_wstrb       := 0.U
   lsu_axi_wlast       := 0.U

   lsu_axi_bready      := 0.U

   lsu_axi_arvalid     := 0.U
   lsu_axi_arid        := 0.U
   lsu_axi_araddr      := 0.U
   lsu_axi_arregion    := 0.U
   lsu_axi_arlen       := 0.U
   lsu_axi_arsize      := 0.U
   lsu_axi_arburst     := 0.U
   lsu_axi_arlock      := 0.U
   lsu_axi_arcache     := 0.U
   lsu_axi_arprot      := 0.U
   lsu_axi_arqos       := 0.U

   lsu_axi_rready      := 0.U

   /*
      // Store buffer related signals
      val lsu_pkt_d = new el2_lsu_pkt_t()

      val dma_pkt_d    = new el2_lsu_pkt_t()
      val lsu_pkt_m_in = new el2_lsu_pkt_t()
      val lsu_pkt_r_in = new el2_lsu_pkt_t()
      val lsu_error_pkt_m = new el2_lsu_error_pkt_t()

      val lsu_rs1_d    = Mux(dec_lsu_valid_raw_d.asBool,dec_lsu_valid_raw_d, dec_lsu_valid_raw_d)
      val lsu_offset_d = dec_lsu_offset_d(11,0) & Fill(12,dec_lsu_valid_raw_d)

      val rs1_d_raw = lsu_rs1_d
      val offset_d  = lsu_offset_d

      val rs1_d = Mux(lsu_pkt_d.load_ldst_bypass_d.asBool,lsu_result_m,rs1_d_raw)

      val lsadder = new rvlsadder()
       lsadder.io.rs1         := rs1_d
       lsadder.io.offset      := offset_d
       val full_addr_d         =  lsadder.io.dout



    */
    
    
    
}
