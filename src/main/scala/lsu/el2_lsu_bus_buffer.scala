
package lsu
import chisel3._
import chisel3.util._
import lib._
import include._
import snapshot._

class  el2_lsu_bus_buffer extends Module
{
   val io = IO (new Bundle {
   //val clk         = Input(Clock()) //implicit
   //val rst_l       = Input(1.W) //implicit
   val scan_mode   = Input(Bool())
   val dec_tlu_external_ldfwd_disable     = Input(Bool())  // disable load to load forwarding for externals
   val dec_tlu_wb_coalescing_disable      = Input(Bool())  // disable write buffer coalescing
   val dec_tlu_sideeffect_posted_disable  = Input(Bool())  // disable the posted sideeffect load store to the bus
   val dec_tlu_force_halt                 = Input(Bool())

   // various clocks needed for the bus reads and writes
//   val lsu_c1_m_clk        = Input(Clock())
//   val lsu_c1_r_clk        = Input(Clock())
   val lsu_c2_r_clk        = Input(Clock())
   val lsu_bus_ibuf_c1_clk = Input(Clock())
   val lsu_bus_obuf_c1_clk = Input(Clock())
   val lsu_bus_buf_c1_clk  = Input(Clock())
   val lsu_free_c2_clk     = Input(Clock())
//   val free_clk            = Input(Clock())
   val lsu_busm_clk        = Input(Clock())

   val dec_lsu_valid_raw_d = Input(Bool())
//   val lsu_pkt_m           = new el2_lsu_pkt_t
//   val lsu_pkt_r           = new el2_lsu_pkt_t

   val lsu_addr_m          = Input(UInt(32.W))
   val end_addr_m          = Input(UInt(32.W))
   val lsu_addr_r          = Input(UInt(32.W))
   val end_addr_r          = Input(UInt(32.W))
   val store_data_r        = Input(UInt(32.W))

//   val dec_tlu_force_halt  = Input(Bool())
   val no_word_merge_r     = Input(Bool())
   val no_dword_merge_r    = Input(Bool())
   val lsu_busreq_m        = Input(Bool())
   val lsu_busreq_r        = Output(Bool())
   val ld_full_hit_m       = Input(Bool())
   val flush_m_up          = Input(Bool())
   val flush_r             = Input(Bool())
   val lsu_commit_r        = Input(Bool())
   val is_sideeffects_r    = Input(Bool())
   val ldst_dual_d         = Input(Bool())
   val ldst_dual_m         = Input(Bool())
   val ldst_dual_r         = Input(Bool())

   val ldst_byteen_ext_m   = Input(UInt(8.W))

   val lsu_bus_buffer_pend_any   = Output(Bool())
   val lsu_bus_buffer_full_any   = Output(Bool())
   val lsu_bus_buffer_empty_any  = Output(Bool())
   val lsu_bus_idle_any          = Output(Bool())

   val ld_byte_hit_buf_lo        = Output((UInt(8.W)))
   val ld_byte_hit_buf_hi        = Output((UInt(8.W)))
   val ld_fwddata_buf_lo         = Output((UInt(32.W)))
   val ld_fwddata_buf_hi         = Output((UInt(32.W)))

   val lsu_imprecise_error_load_any  = Output(Bool())
   val lsu_imprecise_error_store_any = Output(Bool())
   val lsu_imprecise_error_addr_any  = Output(UInt(32.W))

   val lsu_nonblock_load_valid_m     = Output(Bool())
   val lsu_nonblock_load_tag_m       = Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W))
   val lsu_nonblock_load_inv_r       = Output(Bool())
   val lsu_nonblock_load_inv_tag_r   = Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W))
   val lsu_nonblock_load_data_valid  = Output(Bool())
   val lsu_nonblock_load_data_error  = Output(UInt(32.W))
   val lsu_nonblock_load_data_tag    = Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W))
   val lsu_nonblock_load_data        = Output(UInt(32.W))

   val lsu_pmu_bus_trxn              = Output(Bool())
   val lsu_pmu_bus_misaligned        = Output(Bool())
   val lsu_pmu_bus_error             = Output(Bool())
   val lsu_pmu_bus_busy              = Output(Bool())

   val lsu_axi_awvalid     = Output(Bool())
   val lsu_axi_awready     = Input(Bool())
   val lsu_axi_awid        = Output(UInt(pt1.LSU_BUS_TAG.W))
   val lsu_axi_awaddr      = Output(UInt(32.W))
   val lsu_axi_awregion    = Output(UInt(4.W))
   val lsu_axi_awlen       = Output(UInt(8.W))
   val lsu_axi_awsize      = Output(UInt(3.W))
   val lsu_axi_awburst     = Output(UInt(2.W))
   val lsu_axi_awlock      = Output(Bool())
   val lsu_axi_awcache     = Output(UInt(4.W))
   val lsu_axi_awprot      = Output(UInt(3.W))
   val lsu_axi_awqos       = Output(UInt(4.W))

   val lsu_axi_wvalid      = Output(Bool())
   val lsu_axi_wready      = Input(Bool())
   val lsu_axi_wdata       = Output(UInt(64.W))
   val lsu_axi_wstrb       = Output(UInt(8.W))
   val lsu_axi_wlast       = Output(Bool())

   val lsu_axi_bvalid      = Input(Bool())
   val lsu_axi_bready      = Output(Bool())
   val lsu_axi_bresp       = Input(UInt(2.W))
   val lsu_axi_bid         = Input(UInt(pt1.LSU_BUS_TAG.W))

   val lsu_axi_arvalid     = Output(Bool())
   val lsu_axi_arready     = Input(Bool())
   val lsu_axi_arid        = Output(UInt(pt1.LSU_BUS_TAG.W))
   val lsu_axi_araddr      = Output(UInt(32.W))
   val lsu_axi_arregion    = Output(UInt(4.W))
   val lsu_axi_arlen       = Output(UInt(8.W))
   val lsu_axi_arsize      = Output(UInt(3.W))
   val lsu_axi_arburst     = Output(UInt(2.W))
   val lsu_axi_arlock      = Output(Bool())
   val lsu_axi_arcache     = Output(UInt(4.W))
   val lsu_axi_arprot      = Output(UInt(3.W))
   val lsu_axi_arqos       = Output(UInt(4.W))

   val lsu_axi_rvalid      = Input(Bool())
   val lsu_axi_rready      = Output(Bool())
   val lsu_axi_rid         = Input(UInt(pt1.LSU_BUS_TAG.W))
   val lsu_axi_rdata       = Input(UInt(64.W))
   val lsu_axi_rresp       = Input(UInt(2.W))
   val lsu_axi_rlast       = Input(Bool())

   val lsu_bus_clk_en      = Input(Bool())
   val lsu_bus_clk_en_q    = Input(Bool())
   })
   
   val lsu_pkt_m = new el2_lsu_pkt_t()
   val lsu_pkt_r = new el2_lsu_pkt_t()


   io.lsu_busreq_r              := 0.U
   io.lsu_bus_buffer_pend_any   := 0.U
   io.lsu_bus_buffer_full_any   := 0.U
   io.lsu_bus_buffer_empty_any  := 0.U
   io.lsu_bus_idle_any          := 0.U

   io.ld_byte_hit_buf_lo        := 0.U
   io.ld_byte_hit_buf_hi        := 0.U
   io.ld_fwddata_buf_lo         := 0.U
   io.ld_fwddata_buf_hi         := 0.U

   io.lsu_imprecise_error_load_any  := 0.U
   io.lsu_imprecise_error_store_any := 0.U
   io.lsu_imprecise_error_addr_any  := 0.U

   io.lsu_nonblock_load_valid_m     := 0.U
   io.lsu_nonblock_load_tag_m       := 0.U
   io.lsu_nonblock_load_inv_r       := 0.U
   io.lsu_nonblock_load_inv_tag_r   := 0.U
   io.lsu_nonblock_load_data_valid  := 0.U
   io.lsu_nonblock_load_data_error  := 0.U
   io.lsu_nonblock_load_data_tag    := 0.U
   io.lsu_nonblock_load_data        := 0.U

   io.lsu_pmu_bus_trxn              := 0.U
   io.lsu_pmu_bus_misaligned        := 0.U
   io.lsu_pmu_bus_error             := 0.U
   io.lsu_pmu_bus_busy              := 0.U

   io.lsu_axi_awvalid     := 0.U
   io.lsu_axi_awid        := 0.U
   io.lsu_axi_awaddr      := 0.U
   io.lsu_axi_awregion    := 0.U
   io.lsu_axi_awlen       := 0.U
   io.lsu_axi_awsize      := 0.U
   io.lsu_axi_awburst     := 0.U
   io.lsu_axi_awlock      := 0.U
   io.lsu_axi_awcache     := 0.U
   io.lsu_axi_awprot      := 0.U
   io.lsu_axi_awqos       := 0.U

   io.lsu_axi_wvalid      := 0.U
   io.lsu_axi_wdata       := 0.U
   io.lsu_axi_wstrb       := 0.U
   io.lsu_axi_wlast       := 0.U

   io.lsu_axi_bready      := 0.U

   io.lsu_axi_arvalid     := 0.U
   io.lsu_axi_arid        := 0.U
   io.lsu_axi_araddr      := 0.U
   io.lsu_axi_arregion    := 0.U
   io.lsu_axi_arlen       := 0.U
   io.lsu_axi_arsize      := 0.U
   io.lsu_axi_arburst     := 0.U
   io.lsu_axi_arlock      := 0.U
   io.lsu_axi_arcache     := 0.U
   io.lsu_axi_arprot      := 0.U
   io.lsu_axi_arqos       := 0.U

   io.lsu_axi_rready      := 0.U
   
    
}
object busbufferMain extends App {
   println(chisel3.Driver.emitVerilog(new el2_lsu_bus_buffer))
}