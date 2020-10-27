package ifu
import chisel3._
import chisel3.internal.naming.chiselName
import chisel3.util._
import lib._
import include._
class el2_ifu extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val free_clk = Input(Clock())
    val active_clk = Input(Clock())
    val dec_i0_decode_d = Input(Bool())
    val exu_flush_final = Input(Bool())
    val dec_tlu_i0_commit_cmt = Input(Bool())
    val dec_tlu_flush_err_wb = Input(Bool())
    val dec_tlu_flush_noredir_wb = Input(Bool())
    val exu_flush_path_final = Input(UInt(31.W))
    val dec_tlu_mrac_ff = Input(UInt(32.W))
    val dec_tlu_fence_i_wb = Input(Bool())
    val dec_tlu_flush_leak_one_wb = Input(Bool())
    val dec_tlu_bpred_disable = Input(Bool())
    val dec_tlu_core_ecc_disable = Input(Bool())
    val dec_tlu_force_halt = Input(Bool())
    // AXI Write Channel
    val ifu_axi_awvalid = Output(Bool())
    val ifu_axi_awid = Output(UInt(IFU_BUS_TAG.W))
    val ifu_axi_awaddr = Output(UInt(32.W))
    val ifu_axi_awregion = Output(UInt(4.W))
    val ifu_axi_awlen = Output(UInt(8.W))
    val ifu_axi_awsize = Output(UInt(3.W))
    val ifu_axi_awburst = Output(UInt(2.W))
    val ifu_axi_awlock = Output(Bool())
    val ifu_axi_awcache = Output(UInt(4.W))
    val ifu_axi_awprot = Output(UInt(3.W))
    val ifu_axi_awqos = Output(UInt(4.W))
    val ifu_axi_wvalid = Output(Bool())
    val ifu_axi_wdata = Output(UInt(64.W))
    val ifu_axi_wstrb = Output(UInt(8.W))
    val ifu_axi_wlast = Output(Bool())
    val ifu_axi_bready = Output(Bool())
    // AXI Read Channel
    val ifu_axi_arvalid = Output(Bool())
    val ifu_axi_arready = Input(Bool())
    val ifu_axi_arid = Output(UInt(IFU_BUS_TAG.W))
    val ifu_axi_araddr = Output(UInt(32.W))
    val ifu_axi_arregion = Output(UInt(4.W))
    val ifu_axi_arlen = Output(UInt(8.W))
    val ifu_axi_arsize = Output(UInt(3.W))
    val ifu_axi_arburst = Output(UInt(2.W))
    val ifu_axi_arlock = Output(Bool())
    val ifu_axi_arcache = Output(UInt(4.W))
    val ifu_axi_arprot = Output(UInt(3.W))
    val ifu_axi_arqos = Output(UInt(4.W))
    val ifu_axi_rvalid = Input(Bool())
    val ifu_axi_rready = Output(Bool())
    val ifu_axi_rid = Input(UInt(IFU_BUS_TAG.W))
    val ifu_axi_rdata = Input(UInt(64.W))
    val ifu_axi_rresp = Input(UInt(2.W))
    val ifu_bus_clk_en = Input(Bool())
    // DMA signals
    val dma_iccm_req = Input(Bool())
    val dma_mem_addr = Input(UInt(32.W))
    val dma_mem_sz = Input(UInt(3.W))
    val dma_mem_write = Input(Bool())
    val dma_mem_wdata = Input(UInt(64.W))
    val dma_mem_tag = Input(UInt(3.W))
    val dma_iccm_stall_any = Input(Bool())
    // ICCM
    val iccm_dma_ecc_error = Output(Bool())
    val iccm_dma_rvalid = Output(Bool())
    val iccm_dma_rdata = Output(UInt(64.W))
    val iccm_dma_rtag = Output(UInt(3.W))
    val iccm_ready = Output(Bool())
    val ifu_pmu_instr_aligned = Output(Bool())
    val ifu_pmu_fetch_stall = Output(Bool())
    val ifu_ic_error_start = Output(Bool())
    // I$
    val ic_rw_addr = Output(UInt(31.W))
    val ic_wr_en = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_en = Output(Bool())
    val ic_wr_data = Output(Vec(ICACHE_BANKS_WAY, UInt(71.W)))
    val ic_rd_data = Input(UInt(64.W))
    val ic_debug_rd_data = Input(UInt(71.W))
    val ictag_debug_rd_data = Input(UInt(26.W))
    val ic_debug_wr_data = Output(UInt(71.W))
    val ifu_ic_debug_rd_data = Output(UInt(71.W))
    val ic_eccerr = Input(UInt(ICACHE_BANKS_WAY.W))
    val ic_parerr = Input(UInt(ICACHE_BANKS_WAY.W))
    val ic_sel_premux_data = Output(Bool())
    val ic_debug_addr = Output(UInt((ICACHE_INDEX_HI-2).W))
    val ic_debug_rd_en = Output(Bool())
    val ic_debug_wr_en = Output(Bool())
    val ic_debug_tag_array = Output(Bool())
    val ic_debug_way = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_valid = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_hit = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_perr = Input(Bool())
    // ICCM cont'd
    val iccm_rw_addr = Output(UInt((ICCM_BITS-1).W))
    val iccm_wren = Output(Bool())
    val iccm_rden = Output(Bool())
    val iccm_wr_data = Output(UInt(78.W))
    val iccm_wr_size = Output(UInt(3.W))
    val iccm_rd_data = Input(UInt(64.W))
    val iccm_rd_data_ecc = Input(UInt(78.W))
    val ifu_iccm_rd_ecc_single_err = Output(Bool())
    // Performance counter
    val ifu_pmu_ic_miss = Output(Bool())
    val ifu_pmu_ic_hit = Output(Bool())
    val ifu_pmu_bus_error = Output(Bool())
    val ifu_pmu_bus_busy = Output(Bool())
    val ifu_pmu_bus_trxn = Output(Bool())
    //
    val ifu_i0_icaf = Output(Bool())
    val ifu_i0_icaf_type = Output(UInt(2.W))
    val ifu_i0_valid = Output(Bool())
    val ifu_i0_icaf_f1 = Output(Bool())
    val ifu_i0_dbecc = Output(Bool())
    val iccm_dma_sb_error = Output(Bool())
    val ifu_i0_instr = Output(UInt(32.W))
    val ifu_i0_pc = Output(UInt(31.W))
    val ifu_i0_pc4 = Output(Bool())
    val ifu_miss_state_idle = Output(Bool())
    // Aligner branch data
    val i0_brp = Output(new el2_br_pkt_t)
    val ifu_i0_bp_index         = Output(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W))
    val ifu_i0_bp_fghr          = Output(UInt(BHT_GHR_SIZE.W))
    val ifu_i0_bp_btag          = Output(UInt(BTB_BTAG_SIZE.W))
    // BP Inputs
    val exu_mp_pkt = Input(new el2_predict_pkt_t)
    val exu_mp_eghr = Input(UInt(BHT_GHR_SIZE.W))
    val exu_mp_fghr = Input(UInt(BHT_GHR_SIZE.W))
    val exu_mp_index = Input(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W)) // Misprediction index
    val exu_mp_btag = Input(UInt(BTB_BTAG_SIZE.W))
    val dec_tlu_br0_r_pkt = Input(new el2_br_tlu_pkt_t)
    val exu_i0_br_fghr_r = Input(UInt(BHT_GHR_SIZE.W)) // Updated GHR from the exu
    val exu_i0_br_index_r = Input(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W))
    val dec_tlu_flush_lower_wb = Input(Bool())
    val ifu_i0_cinst = Output(UInt(16.W))
    val dec_tlu_ic_diag_pkt = Input(new el2_cache_debug_pkt_t)
    val ifu_ic_debug_rd_data_valid = Output(Bool())
    val iccm_buf_correct_ecc = Output(Bool())
    val iccm_correction_state = Output(Bool())
    val scan_mode = Input(Bool())
  })
  val mem_ctl_ch = Module(new el2_ifu_mem_ctl)
  val bp_ctl_ch = Module(new el2_ifu_bp_ctl)
  val aln_ctl_ch = Module(new el2_ifu_aln_ctl)
  val ifc_ctl_ch = Module(new el2_ifu_ifc_ctl)
  // IFC wiring Inputs
  ifc_ctl_ch.io.active_clk := io.active_clk
  ifc_ctl_ch.io.free_clk := io.free_clk
  ifc_ctl_ch.io.scan_mode := io.scan_mode
  ifc_ctl_ch.io.ic_hit_f := mem_ctl_ch.io.ic_hit_f
  ifc_ctl_ch.io.ifu_fb_consume1 := aln_ctl_ch.io.ifu_fb_consume1
  ifc_ctl_ch.io.ifu_fb_consume2 := aln_ctl_ch.io.ifu_fb_consume2
  ifc_ctl_ch.io.dec_tlu_flush_noredir_wb := io.dec_tlu_flush_noredir_wb
  ifc_ctl_ch.io.exu_flush_final := io.exu_flush_final
  ifc_ctl_ch.io.exu_flush_path_final := io.exu_flush_path_final
  ifc_ctl_ch.io.ifu_bp_hit_taken_f := bp_ctl_ch.io.ifu_bp_hit_taken_f
  ifc_ctl_ch.io.ifu_bp_btb_target_f := bp_ctl_ch.io.ifu_bp_btb_target_f
  ifc_ctl_ch.io.ic_dma_active := mem_ctl_ch.io.ic_dma_active
  ifc_ctl_ch.io.ic_write_stall := mem_ctl_ch.io.ic_write_stall
  ifc_ctl_ch.io.dma_iccm_stall_any := io.dma_iccm_stall_any
  ifc_ctl_ch.io.dec_tlu_mrac_ff := io.dec_tlu_mrac_ff
  ifc_ctl_ch.io.ifu_ic_mb_empty := mem_ctl_ch.io.ifu_ic_mb_empty
  // Input complete


  // ALN wiring Inputs
  aln_ctl_ch.io.scan_mode := io.scan_mode
  aln_ctl_ch.io.active_clk := io.active_clk
  aln_ctl_ch.io.ifu_async_error_start := mem_ctl_ch.io.ifu_async_error_start
  aln_ctl_ch.io.iccm_rd_ecc_double_err := mem_ctl_ch.io.iccm_rd_ecc_double_err
  aln_ctl_ch.io.ic_access_fault_f := mem_ctl_ch.io.ic_access_fault_f
  aln_ctl_ch.io.ic_access_fault_type_f := mem_ctl_ch.io.ic_access_fault_type_f
  aln_ctl_ch.io.ifu_bp_fghr_f := bp_ctl_ch.io.ifu_bp_fghr_f
  aln_ctl_ch.io.ifu_bp_btb_target_f := bp_ctl_ch.io.ifu_bp_btb_target_f
  aln_ctl_ch.io.ifu_bp_poffset_f := bp_ctl_ch.io.ifu_bp_poffset_f
  aln_ctl_ch.io.ifu_bp_hist0_f := bp_ctl_ch.io.ifu_bp_hist0_f
  aln_ctl_ch.io.ifu_bp_hist1_f := bp_ctl_ch.io.ifu_bp_hist1_f
  aln_ctl_ch.io.ifu_bp_pc4_f := bp_ctl_ch.io.ifu_bp_pc4_f
  aln_ctl_ch.io.ifu_bp_way_f := bp_ctl_ch.io.ifu_bp_way_f
  aln_ctl_ch.io.ifu_bp_valid_f := bp_ctl_ch.io.ifu_bp_valid_f
  aln_ctl_ch.io.ifu_bp_ret_f := bp_ctl_ch.io.ifu_bp_ret_f
  aln_ctl_ch.io.exu_flush_final := io.exu_flush_final
  aln_ctl_ch.io.dec_i0_decode_d := io.dec_i0_decode_d
  aln_ctl_ch.io.ifu_fetch_data_f := mem_ctl_ch.io.ic_data_f
  aln_ctl_ch.io.ifu_fetch_val := mem_ctl_ch.io.ifu_fetch_val
  aln_ctl_ch.io.ifu_fetch_pc := ifc_ctl_ch.io.ifc_fetch_addr_f

  // BP wiring Inputs
  bp_ctl_ch.io.scan_mode := io.scan_mode
  bp_ctl_ch.io.active_clk := io.active_clk
  bp_ctl_ch.io.ic_hit_f := mem_ctl_ch.io.ic_hit_f
  bp_ctl_ch.io.ifc_fetch_addr_f := ifc_ctl_ch.io.ifc_fetch_addr_f
  bp_ctl_ch.io.ifc_fetch_req_f := ifc_ctl_ch.io.ifc_fetch_req_f
  bp_ctl_ch.io.dec_tlu_br0_r_pkt <> io.dec_tlu_br0_r_pkt
  bp_ctl_ch.io.exu_i0_br_fghr_r := io.exu_i0_br_fghr_r
  bp_ctl_ch.io.exu_i0_br_index_r := io.exu_i0_br_index_r
  bp_ctl_ch.io.dec_tlu_flush_lower_wb := io.dec_tlu_flush_lower_wb
  bp_ctl_ch.io.dec_tlu_flush_leak_one_wb := io.dec_tlu_flush_leak_one_wb
  bp_ctl_ch.io.dec_tlu_bpred_disable := io.dec_tlu_bpred_disable
  bp_ctl_ch.io.exu_mp_pkt <> io.exu_mp_pkt
  bp_ctl_ch.io.exu_mp_eghr := io.exu_mp_eghr
  bp_ctl_ch.io.exu_mp_fghr := io.exu_mp_fghr
  bp_ctl_ch.io.exu_mp_index := io.exu_mp_index
  bp_ctl_ch.io.exu_mp_btag := io.exu_mp_btag
  bp_ctl_ch.io.exu_flush_final := io.exu_flush_final

  // mem-ctl wiring
  mem_ctl_ch.io.free_clk := io.free_clk
  mem_ctl_ch.io.active_clk := io.active_clk
  mem_ctl_ch.io.exu_flush_final := io.exu_flush_final
  mem_ctl_ch.io.dec_tlu_flush_lower_wb := io.dec_tlu_flush_lower_wb
  mem_ctl_ch.io.dec_tlu_flush_err_wb := io.dec_tlu_flush_err_wb
  mem_ctl_ch.io.dec_tlu_i0_commit_cmt := io.dec_tlu_i0_commit_cmt
  mem_ctl_ch.io.dec_tlu_force_halt := io.dec_tlu_force_halt
  mem_ctl_ch.io.ifc_fetch_addr_bf := ifc_ctl_ch.io.ifc_fetch_addr_bf
  mem_ctl_ch.io.ifc_fetch_uncacheable_bf := ifc_ctl_ch.io.ifc_fetch_uncacheable_bf
  mem_ctl_ch.io.ifc_fetch_req_bf := ifc_ctl_ch.io.ifc_fetch_req_bf
  mem_ctl_ch.io.ifc_fetch_req_bf_raw := ifc_ctl_ch.io.ifc_fetch_req_bf_raw
  mem_ctl_ch.io.ifc_iccm_access_bf := ifc_ctl_ch.io.ifc_iccm_access_bf
  mem_ctl_ch.io.ifc_region_acc_fault_bf := ifc_ctl_ch.io.ifc_region_acc_fault_bf
  mem_ctl_ch.io.ifc_dma_access_ok := ifc_ctl_ch.io.ifc_dma_access_ok
  mem_ctl_ch.io.dec_tlu_fence_i_wb := io.dec_tlu_fence_i_wb
  mem_ctl_ch.io.ifu_bp_hit_taken_f := bp_ctl_ch.io.ifu_bp_hit_taken_f
  mem_ctl_ch.io.ifu_bp_inst_mask_f := bp_ctl_ch.io.ifu_bp_inst_mask_f
  mem_ctl_ch.io.ifu_axi_arready := io.ifu_axi_arready
  mem_ctl_ch.io.ifu_axi_rvalid := io.ifu_axi_rvalid
  mem_ctl_ch.io.ifu_axi_rid := io.ifu_axi_rid
  mem_ctl_ch.io.ifu_axi_rdata := io.ifu_axi_rdata
  mem_ctl_ch.io.ifu_axi_rresp := io.ifu_axi_rresp
  mem_ctl_ch.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  mem_ctl_ch.io.dma_iccm_req := io.dma_iccm_req
  mem_ctl_ch.io.dma_mem_addr := io.dma_mem_addr
  mem_ctl_ch.io.dma_mem_sz := io.dma_mem_sz
  mem_ctl_ch.io.dma_mem_write := io.dma_mem_write
  mem_ctl_ch.io.dma_mem_wdata := io.dma_mem_wdata
  mem_ctl_ch.io.dma_mem_tag := io.dma_mem_tag
  mem_ctl_ch.io.ic_rd_data := io.ic_rd_data
  mem_ctl_ch.io.ic_debug_rd_data := io.ic_debug_rd_data
  mem_ctl_ch.io.ictag_debug_rd_data := io.ictag_debug_rd_data
  mem_ctl_ch.io.ic_eccerr := io.ic_eccerr
  mem_ctl_ch.io.ic_parerr := io.ic_parerr
  mem_ctl_ch.io.ic_rd_hit := io.ic_rd_hit
  mem_ctl_ch.io.ic_tag_perr := io.ic_tag_perr
  mem_ctl_ch.io.iccm_rd_data := io.iccm_rd_data
  mem_ctl_ch.io.iccm_rd_data_ecc := io.iccm_rd_data_ecc
  mem_ctl_ch.io.ifu_fetch_val := mem_ctl_ch.io.ic_fetch_val_f
  mem_ctl_ch.io.dec_tlu_ic_diag_pkt <> io.dec_tlu_ic_diag_pkt
  mem_ctl_ch.io.dec_tlu_core_ecc_disable := io.dec_tlu_core_ecc_disable
  mem_ctl_ch.io.scan_mode := io.scan_mode

  // Connecting the final outputs
  io.ifu_axi_awvalid := mem_ctl_ch.io.ifu_axi_awvalid
  io.ifu_axi_awid := mem_ctl_ch.io.ifu_axi_awid
  io.ifu_axi_awaddr := mem_ctl_ch.io.ifu_axi_awaddr
  io.ifu_axi_awregion := mem_ctl_ch.io.ifu_axi_awregion
  io.ifu_axi_awlen := mem_ctl_ch.io.ifu_axi_awlen
  io.ifu_axi_awsize := mem_ctl_ch.io.ifu_axi_awsize
  io.ifu_axi_awburst := mem_ctl_ch.io.ifu_axi_awburst
  io.ifu_axi_awlock := mem_ctl_ch.io.ifu_axi_awlock
  io.ifu_axi_awcache := mem_ctl_ch.io.ifu_axi_awcache
  io.ifu_axi_awprot := mem_ctl_ch.io.ifu_axi_awprot
  io.ifu_axi_awqos := mem_ctl_ch.io.ifu_axi_awqos
  io.ifu_axi_wvalid := mem_ctl_ch.io.ifu_axi_wvalid
  io.ifu_axi_wdata := mem_ctl_ch.io.ifu_axi_wdata
  io.ifu_axi_wstrb := mem_ctl_ch.io.ifu_axi_wstrb
  io.ifu_axi_wlast := mem_ctl_ch.io.ifu_axi_wlast
  io.ifu_axi_bready := mem_ctl_ch.io.ifu_axi_bready
  // AXI Read Channel
  io.ifu_axi_arvalid := mem_ctl_ch.io.ifu_axi_arvalid
  io.ifu_axi_arid := mem_ctl_ch.io.ifu_axi_arid
  io.ifu_axi_araddr := mem_ctl_ch.io.ifu_axi_araddr
  io.ifu_axi_arregion := mem_ctl_ch.io.ifu_axi_arregion
  io.ifu_axi_arlen := mem_ctl_ch.io.ifu_axi_arlen
  io.ifu_axi_arsize := mem_ctl_ch.io.ifu_axi_arsize
  io.ifu_axi_arburst := mem_ctl_ch.io.ifu_axi_arburst
  io.ifu_axi_arlock := mem_ctl_ch.io.ifu_axi_arlock
  io.ifu_axi_arcache := mem_ctl_ch.io.ifu_axi_arcache
  io.ifu_axi_arprot := mem_ctl_ch.io.ifu_axi_arprot
  io.ifu_axi_arqos := mem_ctl_ch.io.ifu_axi_arqos
  io.ifu_axi_rready := mem_ctl_ch.io.ifu_axi_rready
  io.iccm_dma_ecc_error := mem_ctl_ch.io.iccm_dma_ecc_error
  io.iccm_dma_rvalid := mem_ctl_ch.io.iccm_dma_rvalid
  io.iccm_dma_rdata := mem_ctl_ch.io.iccm_dma_rdata
  io.iccm_dma_rtag := mem_ctl_ch.io.iccm_dma_rtag
  io.iccm_ready := mem_ctl_ch.io.iccm_ready
  io.ifu_pmu_instr_aligned := aln_ctl_ch.io.ifu_pmu_instr_aligned
  io.ifu_pmu_fetch_stall := ifc_ctl_ch.io.ifu_pmu_fetch_stall
  io.ifu_ic_error_start := mem_ctl_ch.io.ic_error_start
  // I$
  io.ic_rw_addr := mem_ctl_ch.io.ic_rw_addr
  io.ic_wr_en := mem_ctl_ch.io.ic_wr_en
  io.ic_rd_en := mem_ctl_ch.io.ic_rd_en
  io.ic_wr_data := mem_ctl_ch.io.ic_wr_data
  io.ic_debug_wr_data := mem_ctl_ch.io.ic_debug_wr_data
  io.ifu_ic_debug_rd_data := mem_ctl_ch.io.ifu_ic_debug_rd_data
  io.ic_sel_premux_data := mem_ctl_ch.io.ic_sel_premux_data
  io.ic_debug_addr := mem_ctl_ch.io.ic_debug_addr
  io.ic_debug_rd_en := mem_ctl_ch.io.ic_debug_rd_en
  io.ic_debug_wr_en := mem_ctl_ch.io.ic_debug_wr_en
  io.ic_debug_tag_array := mem_ctl_ch.io.ic_debug_tag_array
  io.ic_debug_way := mem_ctl_ch.io.ic_debug_way
  io.ic_tag_valid := mem_ctl_ch.io.ic_tag_valid
  io.iccm_rw_addr := mem_ctl_ch.io.iccm_rw_addr
  io.iccm_wren := mem_ctl_ch.io.iccm_wren
  io.iccm_rden := mem_ctl_ch.io.iccm_rden
  io.iccm_wr_data := mem_ctl_ch.io.iccm_wr_data
  io.iccm_wr_size := mem_ctl_ch.io.iccm_wr_size
  io.ifu_iccm_rd_ecc_single_err := mem_ctl_ch.io.iccm_rd_ecc_single_err
  // Performance counter
  io.ifu_pmu_ic_miss := mem_ctl_ch.io.ifu_pmu_ic_miss
  io.ifu_pmu_ic_hit := mem_ctl_ch.io.ifu_pmu_ic_hit
  io.ifu_pmu_bus_error := mem_ctl_ch.io.ifu_pmu_bus_error
  io.ifu_pmu_bus_busy := mem_ctl_ch.io.ifu_pmu_bus_busy
  io.ifu_pmu_bus_trxn := mem_ctl_ch.io.ifu_pmu_bus_trxn
  //
  io.ifu_i0_icaf := aln_ctl_ch.io.ifu_i0_icaf
  io.ifu_i0_icaf_type := aln_ctl_ch.io.ifu_i0_icaf_type
  io.ifu_i0_valid := aln_ctl_ch.io.ifu_i0_valid
  io.ifu_i0_icaf_f1 := aln_ctl_ch.io.ifu_i0_icaf_f1
  io.ifu_i0_dbecc := aln_ctl_ch.io.ifu_i0_dbecc
  io.iccm_dma_sb_error := mem_ctl_ch.io.iccm_dma_sb_error
  io.ifu_i0_instr := aln_ctl_ch.io.ifu_i0_instr
  io.ifu_i0_pc := aln_ctl_ch.io.ifu_i0_pc
  io.ifu_i0_pc4 := aln_ctl_ch.io.ifu_i0_pc4
  io.ifu_miss_state_idle := mem_ctl_ch.io.ifu_miss_state_idle
  // Aligner branch data
  io.i0_brp <> aln_ctl_ch.io.i0_brp
  io.ifu_i0_bp_index := aln_ctl_ch.io.ifu_i0_bp_index
  io.ifu_i0_bp_fghr := aln_ctl_ch.io.ifu_i0_bp_fghr
  io.ifu_i0_bp_btag := aln_ctl_ch.io.ifu_i0_bp_btag
  io.ifu_i0_cinst := aln_ctl_ch.io.ifu_i0_cinst
  io.ifu_ic_debug_rd_data_valid := mem_ctl_ch.io.ifu_ic_debug_rd_data_valid
  io.iccm_buf_correct_ecc := mem_ctl_ch.io.iccm_buf_correct_ecc
  io.iccm_correction_state := mem_ctl_ch.io.iccm_correction_state
}

object ifu_comp extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu()))
}
