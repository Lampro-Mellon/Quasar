package ifu
import chisel3._
import chisel3.internal.naming.chiselName
import chisel3.util._
import exu._
import lib._
import include._

@chiselName
class ifu extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val exu_flush_final = Input(Bool())
    val exu_flush_path_final = Input(UInt(31.W))
    val free_clk = Input(Clock())
    val active_clk = Input(Clock())
    val ifu_dec = new ifu_dec() // IFU and DEC interconnects
    val exu_ifu = new exu_ifu() // IFU and EXU interconnects
    val iccm = new iccm_mem() // ICCM memory signals
    val ic = new ic_mem() // I$ memory signals
    val ifu = new axi_channels(IFU_BUS_TAG) // AXI Write Channel
    val ifu_bus_clk_en = Input(Bool())
    val ifu_dma = new ifu_dma() // DMA signals
    // ICCM DMA signals
    val iccm_dma_ecc_error = Output(Bool())
    val iccm_dma_rvalid = Output(Bool())
    val iccm_dma_rdata = Output(UInt(64.W))
    val iccm_dma_rtag = Output(UInt(3.W))
    val iccm_ready = Output(Bool())
    // Performance counter
    val iccm_dma_sb_error = Output(Bool())
    val dec_tlu_flush_lower_wb = Input(Bool())
    val scan_mode = Input(Bool())
  })
  val mem_ctl = Module(new ifu_mem_ctl)
  val bp_ctl = Module(new ifu_bp_ctl)
  val aln_ctl = Module(new ifu_aln_ctl)
  val ifc_ctl = Module(new ifu_ifc_ctl)

  // IFC wiring Inputs
  ifc_ctl.io.active_clk := io.active_clk
  ifc_ctl.io.free_clk := io.free_clk
  ifc_ctl.io.scan_mode := io.scan_mode
  ifc_ctl.io.ic_hit_f := mem_ctl.io.ic_hit_f
  ifc_ctl.io.ifu_fb_consume1 := aln_ctl.io.ifu_fb_consume1
  ifc_ctl.io.ifu_fb_consume2 := aln_ctl.io.ifu_fb_consume2
  ifc_ctl.io.dec_ifc <> io.ifu_dec.dec_ifc
  ifc_ctl.io.exu_flush_final := io.exu_flush_final
  ifc_ctl.io.ifu_bp_hit_taken_f := bp_ctl.io.ifu_bp_hit_taken_f
  ifc_ctl.io.ifu_bp_btb_target_f := bp_ctl.io.ifu_bp_btb_target_f
  ifc_ctl.io.ic_dma_active := mem_ctl.io.ic_dma_active
  ifc_ctl.io.ic_write_stall := mem_ctl.io.ic_write_stall
  ifc_ctl.io.dma_ifc <> io.ifu_dma.dma_ifc
  ifc_ctl.io.ifu_ic_mb_empty := mem_ctl.io.ifu_ic_mb_empty
  ifc_ctl.io.exu_flush_path_final := io.exu_flush_path_final

  // ALN wiring Inputs
  aln_ctl.io.scan_mode := io.scan_mode
  aln_ctl.io.active_clk := io.active_clk
  aln_ctl.io.ifu_async_error_start := mem_ctl.io.ifu_async_error_start
  aln_ctl.io.iccm_rd_ecc_double_err := mem_ctl.io.iccm_rd_ecc_double_err
  aln_ctl.io.ic_access_fault_f := mem_ctl.io.ic_access_fault_f
  aln_ctl.io.ic_access_fault_type_f := mem_ctl.io.ic_access_fault_type_f
  aln_ctl.io.ifu_bp_fghr_f := bp_ctl.io.ifu_bp_fghr_f
  aln_ctl.io.ifu_bp_btb_target_f := bp_ctl.io.ifu_bp_btb_target_f
  aln_ctl.io.ifu_bp_poffset_f := bp_ctl.io.ifu_bp_poffset_f
  aln_ctl.io.ifu_bp_hist0_f := bp_ctl.io.ifu_bp_hist0_f
  aln_ctl.io.ifu_bp_hist1_f := bp_ctl.io.ifu_bp_hist1_f
  aln_ctl.io.ifu_bp_pc4_f := bp_ctl.io.ifu_bp_pc4_f
  aln_ctl.io.ifu_bp_way_f := bp_ctl.io.ifu_bp_way_f
  aln_ctl.io.ifu_bp_valid_f := bp_ctl.io.ifu_bp_valid_f
  aln_ctl.io.ifu_bp_ret_f := bp_ctl.io.ifu_bp_ret_f
  aln_ctl.io.exu_flush_final := io.exu_flush_final
  aln_ctl.io.dec_aln <> io.ifu_dec.dec_aln
  aln_ctl.io.ifu_fetch_data_f := mem_ctl.io.ic_data_f
  aln_ctl.io.ifu_fetch_val := mem_ctl.io.ifu_fetch_val
  aln_ctl.io.ifu_fetch_pc := ifc_ctl.io.ifc_fetch_addr_f

  // BP wiring Inputs
  bp_ctl.io.scan_mode := io.scan_mode
  bp_ctl.io.active_clk := io.active_clk
  bp_ctl.io.ic_hit_f := mem_ctl.io.ic_hit_f
  bp_ctl.io.ifc_fetch_addr_f := ifc_ctl.io.ifc_fetch_addr_f
  bp_ctl.io.ifc_fetch_req_f := ifc_ctl.io.ifc_fetch_req_f
  bp_ctl.io.dec_bp <> io.ifu_dec.dec_bp
  bp_ctl.io.exu_bp <> io.exu_ifu.exu_bp
  bp_ctl.io.exu_flush_final := io.exu_flush_final
  bp_ctl.io.dec_tlu_flush_lower_wb := io.dec_tlu_flush_lower_wb

  // mem-ctl Inputs
  mem_ctl.io.free_clk := io.free_clk
  mem_ctl.io.active_clk := io.active_clk
  mem_ctl.io.exu_flush_final := io.exu_flush_final
  mem_ctl.io.dec_mem_ctrl <> io.ifu_dec.dec_mem_ctrl
  mem_ctl.io.ifc_fetch_addr_bf := ifc_ctl.io.ifc_fetch_addr_bf
  mem_ctl.io.ifc_fetch_uncacheable_bf := ifc_ctl.io.ifc_fetch_uncacheable_bf
  mem_ctl.io.ifc_fetch_req_bf := ifc_ctl.io.ifc_fetch_req_bf
  mem_ctl.io.ifc_fetch_req_bf_raw := ifc_ctl.io.ifc_fetch_req_bf_raw
  mem_ctl.io.ifc_iccm_access_bf := ifc_ctl.io.ifc_iccm_access_bf
  mem_ctl.io.ifc_region_acc_fault_bf := ifc_ctl.io.ifc_region_acc_fault_bf
  mem_ctl.io.ifc_dma_access_ok := ifc_ctl.io.ifc_dma_access_ok
  mem_ctl.io.ifu_bp_hit_taken_f := bp_ctl.io.ifu_bp_hit_taken_f
  mem_ctl.io.ifu_bp_inst_mask_f := bp_ctl.io.ifu_bp_inst_mask_f
  mem_ctl.io.ifu_axi <> io.ifu
  mem_ctl.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  mem_ctl.io.dma_mem_ctl <> io.ifu_dma.dma_mem_ctl
  mem_ctl.io.ic <> io.ic
  mem_ctl.io.iccm <> io.iccm
  mem_ctl.io.ifu_fetch_val := mem_ctl.io.ic_fetch_val_f
  mem_ctl.io.dec_tlu_flush_lower_wb := io.dec_tlu_flush_lower_wb
  mem_ctl.io.scan_mode := io.scan_mode

  // DMA to the ICCM
  io.iccm_dma_ecc_error := mem_ctl.io.iccm_dma_ecc_error
  io.iccm_dma_rvalid := mem_ctl.io.iccm_dma_rvalid
  io.iccm_dma_rdata := mem_ctl.io.iccm_dma_rdata
  io.iccm_dma_rtag := mem_ctl.io.iccm_dma_rtag
  io.iccm_ready := mem_ctl.io.iccm_ready
  io.iccm_dma_sb_error := mem_ctl.io.iccm_dma_sb_error
}
