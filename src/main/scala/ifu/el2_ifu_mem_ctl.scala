package ifu
import chisel3._
import chisel3.util._
import lib._
import include._
import scala.math.pow

class el2_ifu_mem_ctl extends Module with el2_lib {
  val io = IO(new Bundle {
    val free_clk = Input(Clock())
    val active_clk = Input(Clock())
    val exu_flush_final = Input(Bool())
    val dec_tlu_flush_lower_wb = Input(Bool())
    val dec_tlu_flush_err_wb = Input(Bool())
    val dec_tlu_i0_commit_cmt = Input(Bool())
    val dec_tlu_force_halt = Input(Bool())
    val ifc_fetch_addr_bf = Input(UInt(31.W))
    val ifc_fetch_uncacheable_bf = Input(Bool())
    val ifc_fetch_req_bf = Input(Bool())
    val ifc_fetch_req_bf_raw = Input(Bool())
    val ifc_iccm_access_bf = Input(Bool())
    val ifc_region_acc_fault_bf = Input(Bool())
    val ifc_dma_access_ok = Input(Bool())
    val dec_tlu_fence_i_wb = Input(Bool())
    val ifu_bp_hit_taken_f = Input(Bool())
    val ifu_bp_inst_mask_f = Input(Bool())
    val ifu_miss_state_idle = Output(Bool())
    val ifu_ic_mb_empty = Output(Bool())
    val ic_dma_active = Output(Bool())
    val ic_write_stall = Output(Bool())
    val ifu_pmu_ic_miss = Output(Bool())
    val ifu_pmu_ic_hit = Output(Bool())
    val ifu_pmu_bus_error = Output(Bool())
    val ifu_pmu_bus_busy = Output(Bool())
    val ifu_pmu_bus_trxn = Output(Bool())
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
    val dma_iccm_req = Input(Bool())
    val dma_mem_addr = Input(UInt(32.W))
    val dma_mem_sz = Input(UInt(3.W))
    val dma_mem_write = Input(Bool())
    val dma_mem_wdata = Input(UInt(64.W))
    val dma_mem_tag = Input(UInt(3.W))
    val iccm_dma_ecc_error = Output(Bool())
    val iccm_dma_rvalid = Output(Bool())
    val iccm_dma_rdata = Output(UInt(64.W))
    val iccm_dma_rtag = Output(UInt(3.W))
    val iccm_ready = Output(Bool())
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
    val ic_debug_addr = Output(UInt((ICACHE_INDEX_HI-2).W))
    val ic_debug_rd_en = Output(Bool())
    val ic_debug_wr_en = Output(Bool())
    val ic_debug_tag_array = Output(Bool())
    val ic_debug_way = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_valid = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_hit = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_perr = Input(Bool())
    val iccm_rw_addr = Output(UInt((ICCM_BITS-1).W))
    val iccm_wren = Output(Bool())
    val iccm_rden = Output(Bool())
    val iccm_wr_data = Output(UInt(78.W))
    val iccm_wr_size = Output(UInt(3.W))
    val iccm_rd_data = Input(UInt(64.W))
    val iccm_rd_data_ecc = Input(UInt(78.W))
    val ifu_fetch_val = Input(UInt(2.W))
    val ic_hit_f = Output(Bool())
    val ic_access_fault_f = Output(Bool())
    val ic_access_fault_type_f = Output(UInt(2.W))
    val iccm_rd_ecc_single_err = Output(Bool())
    val iccm_rd_ecc_double_err = Output(Bool())
    val ic_error_start = Output(Bool())
    val ifu_async_error_start = Output(Bool())
    val iccm_dma_sb_error = Output(Bool())
    val ic_fetch_val_f = Output(UInt(2.W))
    val ic_data_f = Output(UInt(32.W))
    val ic_premux_data = Output(UInt(64.W))
    val ic_sel_premux_data = Output(Bool())
    val dec_tlu_ic_diag_pkt = Input(new el2_cache_debug_pkt_t)
    val dec_tlu_core_ecc_disable = Input(Bool())
    val ifu_ic_debug_rd_data_valid = Output(Bool())
    val iccm_buf_correct_ecc = Output(Bool())
    val iccm_correction_state = Output(Bool())
  })
  io.ic_debug_rd_en:=0.U
  io.ic_debug_wr_en:=0.U
  io.ic_debug_tag_array:=0.U
  io.ifu_miss_state_idle:=0.U
  io.ifu_ic_mb_empty:=0.U
  io.ic_dma_active:=0.U
  io.ic_write_stall:=0.U
  io.ifu_pmu_ic_miss:=0.U
  io.ifu_pmu_ic_hit:=0.U
  io.ifu_pmu_bus_error:=0.U
  io.ifu_pmu_bus_busy:=0.U
  io.ifu_pmu_bus_trxn:=0.U
  io.ifu_axi_awvalid:=0.U
  io.ifu_axi_awid:=0.U
  io.ifu_axi_awaddr:=0.U
  io.ifu_axi_awlen:=0.U
  io.ifu_axi_awsize:=0.U
  io.ifu_axi_awburst:=0.U
  io.ifu_axi_awlock:=0.U
  io.ifu_axi_awcache:=0.U
  io.ifu_axi_awprot:=0.U
  io.ifu_axi_awqos:=0.U
  io.ifu_axi_wvalid:=0.U
  io.ifu_axi_wdata:=0.U
  io.ifu_axi_wstrb:=0.U
  io.ifu_axi_wlast:=0.U
  io.ifu_axi_bready:=0.U
  io.ifu_axi_arvalid:=0.U
  io.ic_debug_addr:=0.U
  io.ifu_axi_arid:=0.U
  io.ifu_axi_araddr:=0.U
  io.ifu_axi_arregion:=0.U
  io.ifu_axi_arlen:=0.U
  io.ifu_axi_arsize:=0.U
  io.ifu_axi_arburst:=0.U
  io.ifu_axi_arlock:=0.U
  io.ifu_axi_arcache:=0.U
  io.ifu_axi_arprot:=0.U
  io.ifu_axi_arqos:=0.U
  io.ifu_axi_rready:=0.U
  io.iccm_dma_ecc_error:=0.U
  io.iccm_dma_rvalid:=0.U
  io.iccm_dma_rdata:=0.U
  io.iccm_dma_rtag:=0.U
  io.iccm_ready:=0.U
  io.ic_rw_addr:=0.U
  io.ic_wr_en:=0.U
  io.ic_rd_en:=0.U
  io.ic_wr_data:=(0 until ICACHE_BANKS_WAY).map(i=>0.U) // TODO
  io.ic_debug_wr_data:=0.U
  io.ifu_ic_debug_rd_data:=0.U
  io.ic_tag_valid:=0.U
  io.iccm_rw_addr:=0.U
  io.iccm_wren:=0.U
  io.iccm_rden:=0.U
  io.iccm_wr_data:=0.U
  io.iccm_wr_size:=0.U
  io.ic_hit_f:=0.U
  io.ic_access_fault_f:=0.U
  io.ic_access_fault_type_f:=0.U
  io.iccm_rd_ecc_single_err:=0.U
  io.iccm_rd_ecc_double_err:=0.U
  io.ic_error_start:=0.U
  io.ifu_async_error_start:=0.U
  io.iccm_dma_sb_error:=0.U
  io.ic_fetch_val_f:=0.U
  io.ic_data_f:=0.U
  io.ic_premux_data:=0.U
  io.ic_sel_premux_data:=0.U
  io.ifu_ic_debug_rd_data_valid:=0.U
  io.iccm_buf_correct_ecc:=0.U
  io.iccm_correction_state:=0.U
  io.ic_debug_way:=0.U
  io.ifu_axi_awregion:=0.U
}

object ifu_mem extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_mem_ctl()))
}

