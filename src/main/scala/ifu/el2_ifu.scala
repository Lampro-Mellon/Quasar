package ifu
import chisel3._
import chisel3.internal.naming.chiselName
import chisel3.util._
import lib._
import include._
class ifu_dec extends Bundle{
  val dec_aln = new dec_aln
  val dec_mem_ctrl = new dec_mem_ctrl
  val dec_ifc = new dec_ifc
  val dec_bp = new dec_bp
}
class exu_ifu extends Bundle{
  val exu_bp = new exu_bp()
  val exu_ifc = new exu_ifc
}

@chiselName
class el2_ifu extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val free_clk = Input(Clock())
    val active_clk = Input(Clock())
    val ifu_dec = new ifu_dec
    val exu_ifu = new exu_ifu
    // AXI Write Channel
    val ifu = new axi_channels()
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

    // I$
    val ic_rw_addr = Output(UInt(31.W))
    val ic_wr_en = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_en = Output(Bool())
    val ic_wr_data = Output(Vec(ICACHE_BANKS_WAY, UInt(71.W)))
    val ic_rd_data = Input(UInt(64.W))
    val ic_debug_rd_data = Input(UInt(71.W))
    val ictag_debug_rd_data = Input(UInt(26.W))
    val ic_debug_wr_data = Output(UInt(71.W))
    val ic_eccerr = Input(UInt(ICACHE_BANKS_WAY.W))
    val ic_parerr = Input(UInt(ICACHE_BANKS_WAY.W))
    val ic_premux_data = Output(UInt(64.W))
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

    // Performance counter
    val iccm_dma_sb_error = Output(Bool())
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
  ifc_ctl_ch.io.dec_ifc <> io.ifu_dec.dec_ifc
  ifc_ctl_ch.io.exu_ifc <> io.exu_ifu.exu_ifc
  ifc_ctl_ch.io.ifu_bp_hit_taken_f := bp_ctl_ch.io.ifu_bp_hit_taken_f
  ifc_ctl_ch.io.ifu_bp_btb_target_f := bp_ctl_ch.io.ifu_bp_btb_target_f
  ifc_ctl_ch.io.ic_dma_active := mem_ctl_ch.io.ic_dma_active
  ifc_ctl_ch.io.ic_write_stall := mem_ctl_ch.io.ic_write_stall
  ifc_ctl_ch.io.dma_iccm_stall_any := io.dma_iccm_stall_any
  ifc_ctl_ch.io.ifu_ic_mb_empty := mem_ctl_ch.io.ifu_ic_mb_empty

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
  aln_ctl_ch.io.exu_flush_final := io.exu_ifu.exu_ifc.exu_flush_final
  aln_ctl_ch.io.dec_aln <> io.ifu_dec.dec_aln
  aln_ctl_ch.io.ifu_fetch_data_f := mem_ctl_ch.io.ic_data_f
  aln_ctl_ch.io.ifu_fetch_val := mem_ctl_ch.io.ifu_fetch_val
  aln_ctl_ch.io.ifu_fetch_pc := ifc_ctl_ch.io.ifc_fetch_addr_f

  // BP wiring Inputs
  bp_ctl_ch.io.scan_mode := io.scan_mode
  bp_ctl_ch.io.active_clk := io.active_clk
  bp_ctl_ch.io.ic_hit_f := mem_ctl_ch.io.ic_hit_f
  bp_ctl_ch.io.ifc_fetch_addr_f := ifc_ctl_ch.io.ifc_fetch_addr_f
  bp_ctl_ch.io.ifc_fetch_req_f := ifc_ctl_ch.io.ifc_fetch_req_f
  bp_ctl_ch.io.dec_bp <> io.ifu_dec.dec_bp
  bp_ctl_ch.io.exu_bp <> io.exu_ifu.exu_bp

  // mem-ctl wiring
  mem_ctl_ch.io.free_clk := io.free_clk
  mem_ctl_ch.io.active_clk := io.active_clk
  mem_ctl_ch.io.exu_flush_final := io.exu_ifu.exu_ifc.exu_flush_final
  mem_ctl_ch.io.dec_mem_ctrl <> io.ifu_dec.dec_mem_ctrl
  mem_ctl_ch.io.ifc_fetch_addr_bf := ifc_ctl_ch.io.ifc_fetch_addr_bf
  mem_ctl_ch.io.ifc_fetch_uncacheable_bf := ifc_ctl_ch.io.ifc_fetch_uncacheable_bf
  mem_ctl_ch.io.ifc_fetch_req_bf := ifc_ctl_ch.io.ifc_fetch_req_bf
  mem_ctl_ch.io.ifc_fetch_req_bf_raw := ifc_ctl_ch.io.ifc_fetch_req_bf_raw
  mem_ctl_ch.io.ifc_iccm_access_bf := ifc_ctl_ch.io.ifc_iccm_access_bf
  mem_ctl_ch.io.ifc_region_acc_fault_bf := ifc_ctl_ch.io.ifc_region_acc_fault_bf
  mem_ctl_ch.io.ifc_dma_access_ok := ifc_ctl_ch.io.ifc_dma_access_ok
  mem_ctl_ch.io.ifu_bp_hit_taken_f := bp_ctl_ch.io.ifu_bp_hit_taken_f
  mem_ctl_ch.io.ifu_bp_inst_mask_f := bp_ctl_ch.io.ifu_bp_inst_mask_f
  mem_ctl_ch.io.ifu_axi <> io.ifu
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
  mem_ctl_ch.io.scan_mode := io.scan_mode

  // Connecting the final outputs
  io.iccm_dma_ecc_error := mem_ctl_ch.io.iccm_dma_ecc_error
  io.iccm_dma_rvalid := mem_ctl_ch.io.iccm_dma_rvalid
  io.iccm_dma_rdata := mem_ctl_ch.io.iccm_dma_rdata
  io.iccm_dma_rtag := mem_ctl_ch.io.iccm_dma_rtag
  io.iccm_ready := mem_ctl_ch.io.iccm_ready

  // I$
  io.ic_rw_addr := mem_ctl_ch.io.ic_rw_addr
  io.ic_wr_en := mem_ctl_ch.io.ic_wr_en
  io.ic_rd_en := mem_ctl_ch.io.ic_rd_en
  io.ic_wr_data := mem_ctl_ch.io.ic_wr_data
  io.ic_debug_wr_data := mem_ctl_ch.io.ic_debug_wr_data
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

  // Performance counter
  io.iccm_dma_sb_error := mem_ctl_ch.io.iccm_dma_sb_error

  // Aligner branch data
  io.iccm_buf_correct_ecc := mem_ctl_ch.io.iccm_buf_correct_ecc
  io.iccm_correction_state := mem_ctl_ch.io.iccm_correction_state
  io.ic_premux_data := mem_ctl_ch.io.ic_premux_data
}

object ifu_top extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu()))
}
