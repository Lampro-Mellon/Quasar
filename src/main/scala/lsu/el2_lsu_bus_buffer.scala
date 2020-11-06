
package lsu
import chisel3._
import chisel3.util._
import lib._
import include._
import snapshot._
import chisel3.experimental.{ChiselEnum, chiselName}
import chisel3.util.ImplicitConversions.intToUInt

//object el2_lsu_bus_buffer {
//   object State extends ChiselEnum {
//      val IDLE, WAIT, CMD, RESP, DONE_PARTIAL, DONE_WAIT, DONE = Value
//   }
//}

@chiselName
class  el2_lsu_bus_buffer extends Module with RequireAsyncReset with el2_lib
{
//   import el2_lsu_bus_buffer.State
//   import el2_lsu_bus_buffer.State._

   val io = IO (new Bundle {
      //val clk         = Input(Clock()) //implicit
      //val rst_l       = Input(1.W) //implicit reset
      val scan_mode                          = Input(Bool())
      val dec_tlu_external_ldfwd_disable     = Input(Bool())
      val dec_tlu_wb_coalescing_disable      = Input(Bool())  
      val dec_tlu_sideeffect_posted_disable  = Input(Bool())
      val dec_tlu_force_halt                 = Input(Bool())
      val lsu_c2_r_clk                       = Input(Clock())
      val lsu_bus_ibuf_c1_clk                = Input(Clock())
      val lsu_bus_obuf_c1_clk                = Input(Clock())
      val lsu_bus_buf_c1_clk                 = Input(Clock())
      val lsu_free_c2_clk                    = Input(Clock())
      val lsu_busm_clk                       = Input(Clock())
      val dec_lsu_valid_raw_d                = Input(Bool())
      val lsu_pkt_m                          = Input(new el2_lsu_pkt_t)
      val lsu_pkt_r                          = Input(new el2_lsu_pkt_t)
      val lsu_addr_m                         = Input(UInt(32.W))
      val end_addr_m                         = Input(UInt(32.W))
      val lsu_addr_r                         = Input(UInt(32.W))
      val end_addr_r                         = Input(UInt(32.W))
      val store_data_r                       = Input(UInt(32.W))
      val no_word_merge_r                    = Input(Bool())
      val no_dword_merge_r                   = Input(Bool())
      val lsu_busreq_m                       = Input(Bool())
      val ld_full_hit_m                      = Input(Bool())
      val flush_m_up                         = Input(Bool())
      val flush_r                            = Input(Bool())
      val lsu_commit_r                       = Input(Bool())
      val is_sideeffects_r                   = Input(Bool())
      val ldst_dual_d                        = Input(Bool())
      val ldst_dual_m                        = Input(Bool())
      val ldst_dual_r                        = Input(Bool())
      val ldst_byteen_ext_m                  = Input(UInt(8.W))
      val lsu_axi_awready                    = Input(Bool())
      val lsu_axi_wready                     = Input(Bool())
      val lsu_axi_bvalid                     = Input(Bool())
      val lsu_axi_bresp                      = Input(UInt(2.W))
      val lsu_axi_bid                        = Input(UInt(pt1.LSU_BUS_TAG.W))
      val lsu_axi_arready                    = Input(Bool())
      val lsu_axi_rvalid                     = Input(Bool())
      val lsu_axi_rid                        = Input(UInt(pt1.LSU_BUS_TAG.W))
      val lsu_axi_rdata                      = Input(UInt(64.W))
      val lsu_axi_rresp                      = Input(UInt(2.W))
      val lsu_bus_clk_en                     = Input(Bool())
      val lsu_bus_clk_en_q                   = Input(Bool())

      val lsu_busreq_r                       = Output(Bool())
      val lsu_bus_buffer_pend_any            = Output(Bool())
      val lsu_bus_buffer_full_any            = Output(Bool())
      val lsu_bus_buffer_empty_any           = Output(Bool())
      val lsu_bus_idle_any                   = Output(Bool())
      val ld_byte_hit_buf_lo                 = Output((UInt(4.W)))
      val ld_byte_hit_buf_hi                 = Output((UInt(4.W)))
      val ld_fwddata_buf_lo                  = Output((UInt(32.W)))
      val ld_fwddata_buf_hi                  = Output((UInt(32.W)))
      val lsu_imprecise_error_load_any       = Output(Bool())
      val lsu_imprecise_error_store_any      = Output(Bool())
      val lsu_imprecise_error_addr_any       = Output(UInt(32.W))
      val lsu_nonblock_load_valid_m          = Output(Bool())
      val lsu_nonblock_load_tag_m            = Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W))
      val lsu_nonblock_load_inv_r            = Output(Bool())
      val lsu_nonblock_load_inv_tag_r        = Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W))
      val lsu_nonblock_load_data_valid       = Output(Bool())
      val lsu_nonblock_load_data_error       = Output(Bool())
      val lsu_nonblock_load_data_tag         = Output(UInt(pt1.LSU_NUM_NBLOAD_WIDTH.W))
      val lsu_nonblock_load_data             = Output(UInt(32.W))
      val lsu_pmu_bus_trxn                   = Output(Bool())
      val lsu_pmu_bus_misaligned             = Output(Bool())
      val lsu_pmu_bus_error                  = Output(Bool())
      val lsu_pmu_bus_busy                   = Output(Bool())
      val lsu_axi_awvalid                    = Output(Bool())
      val lsu_axi_awid                       = Output(UInt(pt1.LSU_BUS_TAG.W))
      val lsu_axi_awaddr                     = Output(UInt(32.W))
      val lsu_axi_awregion                   = Output(UInt(4.W))
      val lsu_axi_awlen                      = Output(UInt(8.W))
      val lsu_axi_awsize                     = Output(UInt(3.W))
      val lsu_axi_awburst                    = Output(UInt(2.W))
      val lsu_axi_awlock                     = Output(Bool())
      val lsu_axi_awcache                    = Output(UInt(4.W))
      val lsu_axi_awprot                     = Output(UInt(3.W))
      val lsu_axi_awqos                      = Output(UInt(4.W))
      val lsu_axi_wvalid                     = Output(Bool())
      val lsu_axi_wdata                      = Output(UInt(64.W))
      val lsu_axi_wstrb                      = Output(UInt(8.W))
      val lsu_axi_wlast                      = Output(Bool())
      val lsu_axi_bready                     = Output(Bool())
      val lsu_axi_arvalid                    = Output(Bool())
      val lsu_axi_arid                       = Output(UInt(pt1.LSU_BUS_TAG.W))
      val lsu_axi_araddr                     = Output(UInt(32.W))
      val lsu_axi_arregion                   = Output(UInt(4.W))
      val lsu_axi_arlen                      = Output(UInt(8.W))
      val lsu_axi_arsize                     = Output(UInt(3.W))
      val lsu_axi_arburst                    = Output(UInt(2.W))
      val lsu_axi_arlock                     = Output(Bool())
      val lsu_axi_arcache                    = Output(UInt(4.W))
      val lsu_axi_arprot                     = Output(UInt(3.W))
      val lsu_axi_arqos                      = Output(UInt(4.W))
      val lsu_axi_rready                     = Output(Bool())

   })

   val DEPTH                        = pt1.LSU_NUM_NBLOAD
   val DEPTH_LOG2                   = pt1.LSU_NUM_NBLOAD_WIDTH
   val TIMER                        = 8
   val TIMER_MAX                    = TIMER - 1
   val TIMER_LOG2                   = if (TIMER < 2) 1 else log2Ceil(TIMER)

   val idle_C :: wait_C :: cmd_C :: resp_C :: done_partial_C :: done_wait_C :: done_C :: Nil = Enum(7)

   val ldst_byteen_hi_m             = WireInit(UInt(4.W),               init = 0.U)
   val ldst_byteen_lo_m             = WireInit(UInt(4.W),               init = 0.U)
   val ld_addr_hitvec_lo            = WireInit(UInt(4.W),               init = 0.U)
   val ld_addr_hitvec_hi            = WireInit(UInt(4.W),               init = 0.U)

   val ld_byte_hitvec_lo            = Wire(Vec(4, UInt(DEPTH.W)))    
   val ld_byte_hitvec_hi            = Wire(Vec(4, UInt(DEPTH.W)))    
   val ld_byte_hitvecfn_lo          = Wire(Vec(4, UInt(DEPTH.W)))    
   val ld_byte_hitvecfn_hi          = Wire(Vec(4, UInt(DEPTH.W)))    

   val ld_addr_ibuf_hit_lo          = WireInit(Bool(),                  init = false.B)
   val ld_addr_ibuf_hit_hi          = WireInit(Bool(),                  init = false.B)
   val ld_byte_ibuf_hit_lo          = WireInit(UInt(4.W),               init = 0.U)
   val ld_byte_ibuf_hit_hi          = WireInit(UInt(4.W),               init = 0.U)

   val ldst_byteen_r                = WireInit(UInt(4.W),               init = 0.U)
   val ldst_byteen_hi_r             = WireInit(UInt(4.W),               init = 0.U)
   val ldst_byteen_lo_r             = WireInit(UInt(4.W),               init = 0.U)
   val store_data_hi_r              = WireInit(UInt(32.W),              init = 0.U)
   val store_data_lo_r              = WireInit(UInt(32.W),              init = 0.U)
   val is_aligned_r                 = WireInit(Bool(),                  init = false.B)
   val ldst_samedw_r                = WireInit(Bool(),                  init = false.B)
   val lsu_nonblock_load_valid_r    = WireInit(Bool(),                  init = false.B)
   val lsu_nonblock_load_data_hi    = WireInit(UInt(32.W),              init = 0.U)
   val lsu_nonblock_load_data_lo    = WireInit(UInt(32.W),              init = 0.U)
   val lsu_nonblock_data_unalgn     = WireInit(UInt(32.W),              init = 0.U)
   val lsu_nonblock_addr_offset     = WireInit(UInt(2.W),               init = 0.U)
   val lsu_nonblock_sz              = WireInit(UInt(2.W),               init = 0.U)
   val lsu_nonblock_unsign          = WireInit(Bool(),                  init = false.B)
   val lsu_nonblock_dual            = WireInit(Bool(),                  init = false.B)
   val lsu_nonblock_load_data_ready = WireInit(Bool(),                  init = false.B)

  val CmdPtr0Dec                    = Wire(Vec(DEPTH, Bool()))
  val CmdPtr1Dec                    = Wire(Vec(DEPTH, Bool()))
   val RspPtrDec                    = Wire(Vec(DEPTH, Bool()))
   val CmdPtr0                      = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val CmdPtr1                      = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val RspPtr                       = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val WrPtr0_m                     = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val WrPtr0_r                     = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val WrPtr1_m                     = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val WrPtr1_r                     = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val found_cmdptr0                = WireInit(Bool(),                  init = false.B)
   val found_cmdptr1                = WireInit(Bool(),                  init = false.B)
   val buf_numvld_any               = WireInit(UInt(4.W),               init = 0.U)
   val buf_numvld_wrcmd_any         = WireInit(UInt(4.W),               init = 0.U)
   val buf_numvld_cmd_any           = WireInit(UInt(4.W),               init = 0.U)
   val buf_numvld_pend_any          = WireInit(UInt(4.W),               init = 0.U)
   val any_done_wait_state          = WireInit(Bool(),                  init = false.B)
   val bus_sideeffect_pend          = WireInit(Bool(),                  init = false.B)
   val bus_pend_trxn                = WireInit(UInt(8.W),               init = 0.U)
   val bus_pend_trxnQ               = WireInit(UInt(8.W),               init = 0.U)
   val bus_pend_trxn_ns             = WireInit(UInt(8.W),               init = 0.U)
   val lsu_bus_cntr_overflow        = WireInit(Bool(),                  init = false.B)
   val bus_coalescing_disable       = WireInit(Bool(),                  init = false.B)
   val mdbhd_en                     = WireInit(Bool(),                  init = false.B)

   val bus_addr_match_pending       = WireInit(Bool(),                  init = false.B)
   val bus_cmd_sent                 = WireInit(Bool(),                  init = false.B)
   val bus_cmd_ready                = WireInit(Bool(),                  init = false.B)
   val bus_wcmd_sent                = WireInit(Bool(),                  init = false.B)
   val bus_wdata_sent               = WireInit(Bool(),                  init = false.B)
   val bus_rsp_read                 = WireInit(Bool(),                  init = false.B)
   val bus_rsp_write                = WireInit(Bool(),                  init = false.B)
   val bus_rsp_read_tag             = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val bus_rsp_write_tag            = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val bus_rsp_read_error           = WireInit(Bool(),                  init = false.B)
   val bus_rsp_write_error          = WireInit(Bool(),                  init = false.B)
   val bus_rsp_rdata                = WireInit(UInt(64.W),              init = 0.U)

   // Bus buffer signals
   val buf_state                    = Wire(Vec(DEPTH, UInt(3.W)))
   val buf_sz                       = Wire(Vec(DEPTH, UInt(2.W)))
   val buf_addr                     = Wire(Vec(DEPTH, UInt(32.W)))
   val buf_byteen                   = Wire(Vec(DEPTH, UInt(4.W)))
   val buf_sideeffect               = Wire(Vec(DEPTH, Bool()))
   val buf_write                    = Wire(Vec(DEPTH, Bool()))
   val buf_unsign                   = Wire(Vec(DEPTH, Bool()))
   val buf_dual                     = Wire(Vec(DEPTH, Bool()))
   val buf_samedw                   = Wire(Vec(DEPTH, Bool()))
   val buf_nomerge                  = Wire(Vec(DEPTH, Bool()))
   val buf_dualhi                   = Wire(Vec(DEPTH, Bool()))
   val buf_dualtag                  = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
   val buf_ldfwd                    = Wire(Vec(DEPTH, Bool()))
   val buf_ldfwdtag                 = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
   val buf_error                    = Wire(Vec(DEPTH, Bool()))
   val buf_data                     = Wire(Vec(DEPTH, UInt(32.W)))
   val buf_age                      = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_age_younger              = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_rspage                   = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_rsp_pickage              = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))

   val buf_nxtstate                 = Wire(Vec(DEPTH, UInt(3.W)))
   val buf_rst                      = Wire(Vec(DEPTH, Bool()))
   val buf_state_en                 = Wire(Vec(DEPTH, Bool()))
   val buf_cmd_state_bus_en         = Wire(Vec(DEPTH, Bool()))
   val buf_resp_state_bus_en        = Wire(Vec(DEPTH, Bool()))
   val buf_state_bus_en             = Wire(Vec(DEPTH, Bool()))
   val buf_dual_in                  = Wire(Vec(DEPTH, Bool()))
   val buf_samedw_in                = Wire(Vec(DEPTH, Bool()))
   val buf_nomerge_in               = Wire(Vec(DEPTH, Bool()))
   val buf_sideeffect_in            = Wire(Vec(DEPTH, Bool()))
   val buf_unsign_in                = Wire(Vec(DEPTH, Bool()))
   val buf_sz_in                    = Wire(Vec(DEPTH, UInt(2.W)))
   val buf_write_in                 = Wire(Vec(DEPTH, Bool()))
   val buf_wr_en                    = Wire(Vec(DEPTH, Bool()))
   val buf_dualhi_in                = Wire(Vec(DEPTH, Bool()))
   val buf_dualtag_in               = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
   val buf_ldfwd_en                 = Wire(Vec(DEPTH, Bool()))
   val buf_ldfwd_in                 = Wire(Vec(DEPTH, Bool()))
   val buf_ldfwdtag_in              = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
   val buf_byteen_in                = Wire(Vec(DEPTH, UInt(4.W)))
   val buf_addr_in                  = Wire(Vec(DEPTH, UInt(32.W)))
   val buf_data_in                  = Wire(Vec(DEPTH, UInt(32.W)))
   val buf_error_en                 = Wire(Vec(DEPTH, Bool()))
   val buf_data_en                  = Wire(Vec(DEPTH, Bool()))
   val buf_age_in                   = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_ageQ                     = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_rspage_set               = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_rspage_in                = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))
   val buf_rspageQ                  = Wire(Vec(DEPTH, Vec(DEPTH, Bool())))

   // Input buffer signals
   val ibuf_valid                   = WireInit(Bool(),                  init = false.B)
   val ibuf_dual                    = WireInit(Bool(),                  init = false.B)
   val ibuf_samedw                  = WireInit(Bool(),                  init = false.B)
   val ibuf_nomerge                 = WireInit(Bool(),                  init = false.B)
   val ibuf_tag                     = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val ibuf_dualtag                 = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val ibuf_sideeffect              = WireInit(Bool(),                  init = false.B)
   val ibuf_unsign                  = WireInit(Bool(),                  init = false.B)
   val ibuf_write                   = WireInit(Bool(),                  init = false.B)
   val ibuf_sz                      = WireInit(UInt(2.W),               init = 0.U)
   val ibuf_byteen                  = WireInit(UInt(4.W),               init = 0.U)
   val ibuf_addr                    = WireInit(UInt(32.W),              init = 0.U)
   val ibuf_data                    = WireInit(UInt(32.W),              init = 0.U)
   val ibuf_timer                   = WireInit(UInt(TIMER_LOG2.W),      init = 0.U)
   val ibuf_byp                     = WireInit(Bool(),                  init = false.B)
   val ibuf_wr_en                   = WireInit(Bool(),                  init = false.B)
   val ibuf_rst                     = WireInit(Bool(),                  init = false.B)
   val ibuf_force_drain             = WireInit(Bool(),                  init = false.B)
   val ibuf_drain_vld               = WireInit(Bool(),                  init = false.B)
   val ibuf_drainvec_vld            = Wire(Vec(DEPTH, Bool()))
   val ibuf_tag_in                  = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val ibuf_dualtag_in              = WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val ibuf_sz_in                   = WireInit(UInt(2.W),               init = 0.U)
   val ibuf_addr_in                 = WireInit(UInt(32.W),              init = 0.U)
   val ibuf_byteen_in               = WireInit(UInt(4.W),               init = 0.U)
   val ibuf_data_in                 = WireInit(UInt(32.W),              init = 0.U)
   val ibuf_timer_in                = WireInit(UInt(TIMER_LOG2.W),      init = 0.U)
   val ibuf_byteen_out              = WireInit(UInt(4.W),               init = 0.U)
   val ibuf_data_out                = WireInit(UInt(32.W),              init = 0.U)
   val ibuf_merge_en                = WireInit(Bool(),                  init = false.B)
   val ibuf_merge_in                = WireInit(Bool(),                  init = false.B)

   // Output buffer signals
   val obuf_valid                   = WireInit(Bool(),                  init = false.B)
   val obuf_write                   = WireInit(Bool(),                  init = false.B)
   val obuf_nosend                  = WireInit(Bool(),                  init = false.B)
   val obuf_rdrsp_pend              = WireInit(Bool(),                  init = false.B)
   val obuf_sideeffect              = WireInit(Bool(),                  init = false.B)
   val obuf_addr                    = WireInit(UInt(32.W),              init = 0.U)
   val obuf_data                    = WireInit(UInt(64.W),              init = 0.U)
   val obuf_sz                      = WireInit(UInt(2.W),               init = 0.U)
   val obuf_byteen                  = WireInit(UInt(8.W),               init = 0.U)
   val obuf_merge                   = WireInit(Bool(),                  init = false.B)
   val obuf_cmd_done                = WireInit(Bool(),                  init = false.B)
   val obuf_data_done               = WireInit(Bool(),                  init = false.B)
   val obuf_tag0                    = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val obuf_tag1                    = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val obuf_rdrsp_tag               = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)

   val ibuf_buf_byp                 = WireInit(Bool(),                  init = false.B)
   val obuf_force_wr_en             = WireInit(Bool(),                  init = false.B)
   val obuf_wr_wait                 = WireInit(Bool(),                  init = false.B)
   val obuf_wr_en                   = WireInit(Bool(),                  init = false.B)
   val obuf_wr_enQ                  = WireInit(Bool(),                  init = false.B)
   val obuf_rst                     = WireInit(Bool(),                  init = false.B)
   val obuf_write_in                = WireInit(Bool(),                  init = false.B)
   val obuf_nosend_in               = WireInit(Bool(),                  init = false.B)
   val obuf_rdrsp_pend_in           = WireInit(Bool(),                  init = false.B)
   val obuf_sideeffect_in           = WireInit(Bool(),                  init = false.B)
   val obuf_aligned_in              = WireInit(Bool(),                  init = false.B)
   val obuf_addr_in                 = WireInit(UInt(64.W),              init = 0.U)
   val obuf_data_in                 = WireInit(UInt(64.W),              init = 0.U)
   val obuf_sz_in                   = WireInit(UInt(2.W),               init = 0.U)
   val obuf_byteen_in               = WireInit(UInt(8.W),               init = 0.U)
   val obuf_merge_in                = WireInit(Bool(),                  init = false.B)
   val obuf_cmd_done_in             = WireInit(Bool(),                  init = false.B)
   val obuf_data_done_in            = WireInit(Bool(),                  init = false.B)
   val obuf_tag0_in                 = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val obuf_tag1_in                 = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val obuf_rdrsp_tag_in            = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)

   val obuf_merge_en                = WireInit(Bool(),                  init = false.B)
   val obuf_wr_timer                = WireInit(UInt(TIMER_LOG2.W),      init = 0.U)
   val obuf_wr_timer_in             = WireInit(UInt(TIMER_LOG2.W),      init = 0.U)
   val obuf_byteen0_in              = WireInit(UInt(8.W),               init = 0.U)
   val obuf_byteen1_in              = WireInit(UInt(8.W),               init = 0.U)
   val obuf_data0_in                = WireInit(UInt(64.W),              init = 0.U)
   val obuf_data1_in                = WireInit(UInt(64.W),              init = 0.U)

   val lsu_axi_awvalid_q            = WireInit(Bool(),                  init = false.B)
   val lsu_axi_awready_q            = WireInit(Bool(),                  init = false.B)
   val lsu_axi_wvalid_q             = WireInit(Bool(),                  init = false.B)
   val lsu_axi_wready_q             = WireInit(Bool(),                  init = false.B)
   val lsu_axi_arvalid_q            = WireInit(Bool(),                  init = false.B)
   val lsu_axi_arready_q            = WireInit(Bool(),                  init = false.B)
   val lsu_axi_bvalid_q             = WireInit(Bool(),                  init = false.B)
   val lsu_axi_bready_q             = WireInit(Bool(),                  init = false.B)
   val lsu_axi_rvalid_q             = WireInit(Bool(),                  init = false.B)
   val lsu_axi_rready_q             = WireInit(Bool(),                  init = false.B)
   val lsu_axi_bid_q                = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val lsu_axi_rid_q                = WireInit(UInt(pt1.LSU_BUS_TAG.W), init = 0.U)
   val lsu_axi_bresp_q              = WireInit(UInt(2.W),               init = 0.U)
   val lsu_axi_rresp_q              = WireInit(UInt(2.W),               init = 0.U)
   val lsu_imprecise_error_store_tag= WireInit(UInt(DEPTH_LOG2.W),      init = 0.U)
   val lsu_axi_rdata_q              = WireInit(UInt(64.W),              init = 0.U)

/////////////  Initialization of vectors//////////////////
   for (i <- 0 until DEPTH) {
    CmdPtr0Dec (i)        := 0.U
    CmdPtr1Dec  (i)       := 0.U
      RspPtrDec(i)         := 0.U
      buf_state(i)         := idle_C
      buf_sz(i)            := 0.U
      buf_addr(i)          := 0.U
      buf_byteen(i)        := 0.U
      buf_sideeffect(i)    := 0.U
      buf_write(i)         := 0.U
      buf_unsign(i)        := 0.U
      buf_dual(i)          := 0.U
      buf_samedw(i)        := 0.U
      buf_nomerge(i)       := 0.U
      buf_dualhi(i)        := 0.U
      buf_dualtag(i)       := 0.U
      buf_ldfwd(i)         := 0.U
      buf_ldfwdtag(i)      := 0.U
      buf_error(i)         := 0.U
      buf_data(i)          := 0.U
      buf_age(i)           := (0 until DEPTH).map(j =>false.B)
      buf_age_younger(i)   := (0 until DEPTH).map(j =>false.B)
      buf_rspage(i)        := (0 until DEPTH).map(j =>false.B)
      buf_rsp_pickage(i)   := (0 until DEPTH).map(j =>false.B)

      buf_dual_in(i)       := 0.U
      buf_samedw_in(i)     := 0.U
      buf_nomerge_in(i)    := 0.U

      buf_sideeffect_in(i) := 0.U
      buf_unsign_in(i)     := 0.U
      buf_sz_in(i)         := 0.U
      buf_write_in(i)      := 0.U
      buf_dualhi_in(i)     := 0.U
      buf_dualtag_in(i)    := 0.U
      buf_byteen_in(i)     := 0.U
      buf_addr_in(i)       := 0.U
      buf_age_in(i)        := (0 until DEPTH).map(j =>false.B)
      buf_ageQ(i)          := (0 until DEPTH).map(j =>false.B)
      buf_rspage_set(i)    := (0 until DEPTH).map(j =>false.B)
      buf_rspage_in(i)     := (0 until DEPTH).map(j =>false.B)
      buf_rspageQ(i)       := (0 until DEPTH).map(j =>false.B)
      ibuf_drainvec_vld(i) := 0.U
   }
////////////////////////////////////////////////

//////////////////////Buffer Hit Logic for load forwarding///////////////////
   ldst_byteen_hi_m        := io.ldst_byteen_ext_m(7,4)
   ldst_byteen_lo_m        := io.ldst_byteen_ext_m(3,0)

   ld_addr_ibuf_hit_lo     := (io.lsu_addr_m(31,2) === ibuf_addr(31,2)) & ibuf_write & ibuf_valid & io.lsu_busreq_m
   ld_addr_ibuf_hit_hi     := (io.end_addr_m(31,2) === ibuf_addr(31,2)) & ibuf_write & ibuf_valid & io.lsu_busreq_m

   ld_byte_ibuf_hit_lo     := (0 until 4).map(i =>(ld_addr_ibuf_hit_lo & ibuf_byteen(i) & ldst_byteen_lo_m(i)).asUInt).reverse.reduce(Cat(_,_))
   ld_byte_ibuf_hit_hi     := (0 until 4).map(i =>(ld_addr_ibuf_hit_hi & ibuf_byteen(i) & ldst_byteen_hi_m(i)).asUInt).reverse.reduce(Cat(_,_))

   ld_addr_hitvec_lo       := (0 until DEPTH).map(i =>((io.lsu_addr_m(31,2) === buf_addr(i)(31,2)) & buf_write(i) & (buf_state(i) =/= idle_C) & io.lsu_busreq_m).asUInt).reverse.reduce(Cat(_,_))
   ld_addr_hitvec_hi       := (0 until DEPTH).map(i =>((io.end_addr_m(31,2) === buf_addr(i)(31,2)) & buf_write(i) & (buf_state(i) =/= idle_C) & io.lsu_busreq_m).asUInt).reverse.reduce(Cat(_,_))

   io.ld_byte_hit_buf_lo   := (0 until 4).map(i =>(ld_byte_ibuf_hit_lo(i) | ld_byte_hitvecfn_lo(i).orR).asUInt).reverse.reduce(Cat(_,_))
   io.ld_byte_hit_buf_hi   := (0 until 4).map(i =>(ld_byte_ibuf_hit_lo(i) | ld_byte_hitvecfn_lo(i).orR).asUInt).reverse.reduce(Cat(_,_))

   ld_byte_hitvec_lo       := (0 until 4).map(j =>(0 until DEPTH).map(i =>(ld_addr_hitvec_lo(i) & buf_byteen(i)(j) & ldst_byteen_lo_m(j)).asUInt).reverse.reduce(Cat(_,_)))
   ld_byte_hitvec_hi       := (0 until 4).map(j =>(0 until DEPTH).map(i =>(ld_addr_hitvec_hi(i) & buf_byteen(i)(j) & ldst_byteen_hi_m(j)).asUInt).reverse.reduce(Cat(_,_)))

   ld_byte_hitvecfn_lo	   := (0 until 4).map(j =>(0 until DEPTH).map(i =>(ld_byte_hitvec_lo(j)(i) & ~((ld_byte_hitvec_lo(j) & buf_age_younger(i).asUInt).orR) & ~ld_byte_ibuf_hit_lo(j)).asUInt).reverse.reduce(Cat(_,_)))
   ld_byte_hitvecfn_hi	   := (0 until 4).map(j =>(0 until DEPTH).map(i =>(ld_byte_hitvec_hi(j)(i) & ~((ld_byte_hitvec_hi(j) & buf_age_younger(i).asUInt).orR) & ~ld_byte_ibuf_hit_hi(j)).asUInt).reverse.reduce(Cat(_,_)))

   //Forwarding MUX
   io.ld_fwddata_buf_lo    := (0 until 4).map(i =>(Mux(ld_byte_ibuf_hit_lo(i),ibuf_data(i*8+7,i*8),Mux1H((0 until DEPTH).map(j =>(ld_byte_hitvecfn_lo(i)(j)) -> buf_data(j)(i*8+7,i*8)))))).reverse.reduce(Cat(_,_))
   io.ld_fwddata_buf_hi    := (0 until 4).map(i =>(Mux(ld_byte_ibuf_hit_hi(i),ibuf_data(i*8+7,i*8),Mux1H((0 until DEPTH).map(j =>(ld_byte_hitvecfn_hi(i)(j)) -> buf_data(j)(i*8+7,i*8)))))).reverse.reduce(Cat(_,_))

/////////////////////////////////////////////////////////////////////////////
   bus_coalescing_disable  := io.dec_tlu_wb_coalescing_disable | pt.BUILD_AHB_LITE
   ldst_byteen_r           := Mux1H(Seq(
                                    io.lsu_pkt_r.word.asBool -> 15.U(4.W),
                                    io.lsu_pkt_r.half.asBool -> 3.U(4.W),
                                    io.lsu_pkt_r.by.asBool   -> 1.U(4.W)
                                    ))
   val ldst_byteen_extended_r   = Cat(Fill(4,0.U),ldst_byteen_r(3,0)) << io.lsu_addr_r(1,0)
   val store_data_extended_r    = Cat(Fill(32,0.U),io.store_data_r(31,0)) << (8.U*io.lsu_addr_r(1,0))
   ldst_byteen_hi_r             := ldst_byteen_extended_r(7,4)
   ldst_byteen_lo_r             := ldst_byteen_extended_r(3,0)
   store_data_hi_r              := store_data_extended_r(63,32)
   store_data_lo_r              := store_data_extended_r(31, 0)
   ldst_samedw_r                := io.lsu_addr_r(3) === io.end_addr_r(3)
   is_aligned_r                 := Mux1H(Seq(
                                          io.lsu_pkt_r.by.asBool   -> true.B,
                                          io.lsu_pkt_r.half.asBool -> (io.lsu_addr_r(0).asUInt === 0.U),
                                          io.lsu_pkt_r.word.asBool -> (io.lsu_addr_r(1,0).asUInt === 0.U)
                                       ))
////////////////////////////////////////////////////////////////////////////
   ibuf_byp                  := (io.lsu_busreq_r & (io.lsu_pkt_r.load | io.no_word_merge_r) & !ibuf_valid).asBool
   ibuf_wr_en                := (io.lsu_busreq_r & io.lsu_commit_r & !ibuf_byp).asBool
   ibuf_rst                  := ((ibuf_drain_vld & !ibuf_wr_en) | io.dec_tlu_force_halt).asBool
   ibuf_force_drain          := (io.lsu_busreq_m & !io.lsu_busreq_r & ibuf_valid & (io.lsu_pkt_m.load | (ibuf_addr(31,2) =/= io.lsu_addr_m(31,2)))).asBool
   ibuf_drain_vld            := ibuf_valid & (((ibuf_wr_en | (ibuf_timer === (TIMER_MAX.asUInt(TIMER_LOG2.W)))) & !(ibuf_merge_en & ibuf_merge_in)) |
                                   ibuf_byp | ibuf_force_drain | ibuf_sideeffect | !ibuf_write | bus_coalescing_disable)
   ibuf_tag_in               := Mux((ibuf_merge_en & ibuf_merge_in), ibuf_tag(DEPTH_LOG2-1,0),Mux(io.ldst_dual_r,WrPtr1_r,WrPtr0_r))
   ibuf_dualtag_in           := WrPtr0_r(DEPTH_LOG2-1,0)
   ibuf_sz_in                := Cat(io.lsu_pkt_r.word,io.lsu_pkt_r.half)
   ibuf_addr_in              := Mux(io.ldst_dual_r,io.end_addr_r,io.lsu_addr_r)
   ibuf_byteen_in            := Mux(ibuf_merge_en & ibuf_merge_in, ibuf_byteen(3,0) | ldst_byteen_lo_r(3,0), Mux(io.ldst_dual_r, ldst_byteen_hi_r(3,0), ldst_byteen_lo_r(3,0)))
   ibuf_data_in              := (0 until 4).map(i =>(Mux((ibuf_merge_en & ibuf_merge_in),Mux(ldst_byteen_lo_r(i),store_data_lo_r((8*i)+7,(8*i)) , ibuf_data((8*i)+7,(8*i))),Mux(io.ldst_dual_r, store_data_hi_r((8*i)+7,(8*i)), store_data_lo_r((8*i)+7,(8*i)))))).reverse.reduce(Cat(_,_))
   ibuf_timer_in             := Mux(ibuf_wr_en, 0.U, Mux(ibuf_timer < (TIMER_MAX.asUInt(TIMER_LOG2.W)), ibuf_timer+1.U, ibuf_timer))
   ibuf_byteen_out           := (0 until 4).map(i =>(Mux((ibuf_merge_en & ~ibuf_merge_in),ibuf_byteen(i) | ldst_byteen_lo_r(i), ibuf_byteen(i))).asUInt).reverse.reduce(Cat(_,_))
   ibuf_data_out             := (0 until 4).map(i =>(Mux((ibuf_merge_en & ~ibuf_merge_in),Mux(ldst_byteen_lo_r(i),store_data_lo_r((8*i)+7,(8*i)) , ibuf_data((8*i)+7,(8*i))),ibuf_data(i*8+7,i*8)))).reverse.reduce(Cat(_,_))
   ibuf_merge_en             := io.lsu_busreq_r & io.lsu_commit_r & io.lsu_pkt_r.store & ibuf_valid & ibuf_write & io.lsu_addr_r(31,2)===ibuf_addr(31,2) & ~io.is_sideeffects_r & ~bus_coalescing_disable
   ibuf_merge_in             := ~io.ldst_dual_r.asUInt()

   withClock(io.lsu_free_c2_clk){
      ibuf_valid := RegNext(Mux(ibuf_wr_en.asBool(),1.U ,ibuf_valid) & !ibuf_rst, false.B)
      ibuf_timer        := RegNext(ibuf_timer_in            ,init = 0.U)
   }
   withClock(io.lsu_bus_ibuf_c1_clk) {
      ibuf_dual         := RegEnable(io.ldst_dual_r         ,init = 0.U, ibuf_wr_en)
      ibuf_samedw       := RegEnable(ldst_samedw_r          ,init = 0.U, ibuf_wr_en)
      ibuf_nomerge      := RegEnable(io.no_dword_merge_r    ,init = 0.U, ibuf_wr_en)
      ibuf_sideeffect   := RegEnable(io.is_sideeffects_r    ,init = 0.U, ibuf_wr_en)
      ibuf_unsign       := RegEnable(io.lsu_pkt_r.unsign    ,init = 0.U, ibuf_wr_en)
      ibuf_write        := RegEnable(io.lsu_pkt_r.store     ,init = 0.U, ibuf_wr_en)
      ibuf_sz           := RegEnable(ibuf_sz_in(1, 0)       ,init = 0.U, ibuf_wr_en)
      ibuf_byteen       := RegEnable(ibuf_byteen_in         ,init = 0.U, ibuf_wr_en)
      ibuf_addr         := RegEnable(ibuf_addr_in(31, 0)    ,init = 0.U, ibuf_wr_en)
      ibuf_data         := RegEnable(ibuf_data_in(31, 0)    ,init = 0.U, ibuf_wr_en)
      ibuf_tag          := RegEnable(ibuf_tag_in            ,init = 0.U, ibuf_wr_en)
      ibuf_dualtag      := RegEnable(ibuf_dualtag_in        ,init = 0.U, ibuf_wr_en)
   }
///////////////////////////////////////////////////////////////////////////////////////

   ibuf_buf_byp          := (ibuf_byp & (buf_numvld_pend_any(3,0) === 0.U) & (~io.lsu_pkt_r.store | io.no_dword_merge_r))
   obuf_force_wr_en      := io.lsu_busreq_m & ~io.lsu_busreq_r & ~ibuf_valid & (buf_numvld_cmd_any(3,0) === 1.U(4.W)) & (io.lsu_addr_m(31,2) =/= buf_addr(CmdPtr0)(31,2))
   obuf_wr_wait          := (buf_numvld_wrcmd_any(3,0) === 1.U(4.W)) & (buf_numvld_cmd_any(3,0) === 1.U(4.W)) & (obuf_wr_timer =/= (TIMER_MAX.asUInt(TIMER_LOG2.W))) &
                                ~bus_coalescing_disable & ~buf_nomerge(CmdPtr0) & ~buf_sideeffect(CmdPtr0) & ~obuf_force_wr_en
   obuf_wr_en            := ((ibuf_buf_byp & io.lsu_commit_r & ~(io.is_sideeffects_r & bus_sideeffect_pend)) |
                                ((buf_state(CmdPtr0) === cmd_C) & found_cmdptr0 & ~buf_cmd_state_bus_en(CmdPtr0) & ~(buf_sideeffect(CmdPtr0) & bus_sideeffect_pend) &
                                    (~(buf_dual(CmdPtr0) & buf_samedw(CmdPtr0) & ~buf_write(CmdPtr0)) | found_cmdptr1 | buf_nomerge(CmdPtr0) | obuf_force_wr_en))) &
                                       (bus_cmd_ready | ~obuf_valid | obuf_nosend) & ~obuf_wr_wait & ~lsu_bus_cntr_overflow & ~bus_addr_match_pending & io.lsu_bus_clk_en
   obuf_rst              := ((bus_cmd_sent | (obuf_valid & obuf_nosend)) & ~obuf_wr_en & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
   obuf_write_in         := Mux(ibuf_buf_byp, io.lsu_pkt_r.store, buf_write(CmdPtr0))
   obuf_nosend_in        := (obuf_addr_in(31,3) === obuf_addr(31,3)) & obuf_aligned_in & ~obuf_sideeffect & ~obuf_write & ~obuf_write_in & ~io.dec_tlu_external_ldfwd_disable &
                                ((obuf_valid & ~obuf_nosend) | (obuf_rdrsp_pend & ~(bus_rsp_read & (bus_rsp_read_tag === obuf_rdrsp_tag))))
   obuf_rdrsp_pend_in    := (~(obuf_wr_en & ~obuf_nosend_in) & obuf_rdrsp_pend & ~(bus_rsp_read & (bus_rsp_read_tag === obuf_rdrsp_tag))) | ((bus_cmd_sent & ~obuf_write) & ~io.dec_tlu_force_halt)
   obuf_sideeffect_in    := Mux(ibuf_buf_byp, io.is_sideeffects_r, buf_sideeffect(CmdPtr0))
   obuf_aligned_in       := Mux(ibuf_buf_byp, is_aligned_r, (obuf_sz_in(1,0) === 0.U(2.W) | (obuf_sz_in(0) & ~obuf_addr_in(0)) | (obuf_sz_in(1) & ~(obuf_addr_in(1,0).orR))))
   obuf_addr_in          := Mux(ibuf_buf_byp, io.lsu_addr_r, buf_addr(CmdPtr0))
   obuf_data_in          := (0 until 8).map(i =>(Mux((obuf_merge_en & obuf_byteen1_in(i)),obuf_data1_in((8*i)+7,(8*i)), obuf_data0_in((8*i)+7,(8*i)))).asUInt).reverse.reduce(Cat(_,_))
   obuf_sz_in            := Mux(ibuf_buf_byp, Cat(io.lsu_pkt_r.word,io.lsu_pkt_r.half), buf_sz(CmdPtr0))
   obuf_byteen_in        := (0 until 8).map(i =>(obuf_byteen0_in(i) | (obuf_merge_en & obuf_byteen1_in(i))).asUInt).reverse.reduce(Cat(_,_))
   obuf_merge_in         := obuf_merge_en
   obuf_cmd_done_in      := ~(obuf_wr_en | obuf_rst) & (obuf_cmd_done  | bus_wcmd_sent )
   obuf_data_done_in     := ~(obuf_wr_en | obuf_rst) & (obuf_data_done | bus_wdata_sent)
   obuf_tag0_in          := Mux(ibuf_buf_byp, WrPtr0_r, CmdPtr0)
   obuf_tag1_in          := Mux(ibuf_buf_byp, WrPtr1_r, CmdPtr0)
   obuf_rdrsp_tag_in     := Mux((bus_cmd_sent & ~obuf_write), obuf_tag0(pt1.LSU_BUS_TAG-1,0), obuf_rdrsp_tag(pt1.LSU_BUS_TAG-1,0))

   obuf_merge_en         := ((CmdPtr0 =/= CmdPtr1) & found_cmdptr0 & found_cmdptr1 & (buf_state(CmdPtr0) === cmd_C) & (buf_state(CmdPtr1) === cmd_C) &
                              ~buf_cmd_state_bus_en(CmdPtr0) & ~buf_sideeffect(CmdPtr0) &
                                 ((buf_write(CmdPtr0) & buf_write(CmdPtr1) & (buf_addr(CmdPtr0)(31,3) === buf_addr(CmdPtr1)(31,3)) & ~bus_coalescing_disable & ~pt.BUILD_AXI_NATIVE) |
                                    (~buf_write(CmdPtr0) & buf_dual(CmdPtr0) & ~buf_dualhi(CmdPtr0) & buf_samedw(CmdPtr0)))) |
                                       (ibuf_buf_byp & ldst_samedw_r & io.ldst_dual_r)
   obuf_wr_timer_in     := Mux(obuf_wr_en, 0.U, Mux(((buf_numvld_cmd_any > 0.U(4.W)) & (obuf_wr_timer < TIMER_MAX.asUInt(TIMER_LOG2.W))), (obuf_wr_timer + 1.U), obuf_wr_timer))
   obuf_byteen0_in      := Mux(ibuf_buf_byp, Mux(io.lsu_addr_r(2), Cat(ldst_byteen_lo_r(3,0),0.U(4.W)),  Cat(0.U(4.W),ldst_byteen_lo_r(3,0))),    Mux(buf_addr(CmdPtr0)(2), Cat(buf_byteen(CmdPtr0),0.U(4.W)), Cat(0.U(4.W),buf_byteen(CmdPtr0))))
   obuf_byteen1_in      := Mux(ibuf_buf_byp, Mux(io.end_addr_r(2), Cat(ldst_byteen_hi_r(3,0),0.U(4.W)),  Cat(0.U(4.W),ldst_byteen_hi_r(3,0))),    Mux(buf_addr(CmdPtr1)(2), Cat(buf_byteen(CmdPtr1),0.U(4.W)), Cat(0.U(4.W),buf_byteen(CmdPtr1))))
   obuf_data0_in        := Mux(ibuf_buf_byp, Mux(io.lsu_addr_r(2), Cat(store_data_lo_r(31,0),0.U(32.W)), Cat(0.U(32.W),store_data_lo_r(31,0))),   Mux(buf_addr(CmdPtr0)(2), Cat(buf_data(CmdPtr0), 0.U(32.W)), Cat(0.U(32.W), buf_data(CmdPtr0))))
   obuf_data1_in        := Mux(ibuf_buf_byp, Mux(io.lsu_addr_r(2), Cat(store_data_hi_r(31,0),0.U(32.W)), Cat(0.U(32.W),store_data_hi_r(31,0))),   Mux(buf_addr(CmdPtr1)(2), Cat(buf_data(CmdPtr1), 0.U(32.W)), Cat(0.U(32.W), buf_data(CmdPtr1))))

   obuf_addr            := RegEnable(obuf_addr_in        , init = 0.U, obuf_wr_en)
   obuf_data            := RegEnable(obuf_data_in        , init = 0.U, obuf_wr_en)
   withClock(io.lsu_busm_clk){
      obuf_rdrsp_pend   := RegNext(obuf_rdrsp_pend_in    , init = 0.U)
      obuf_rdrsp_tag    := RegNext(obuf_rdrsp_tag_in     , init = 0.U)
      obuf_cmd_done     := RegNext(obuf_cmd_done_in      , init = 0.U)
      obuf_data_done    := RegNext(obuf_data_done_in     , init = 0.U)
      obuf_wr_timer     := RegNext(obuf_wr_timer_in      , init = 0.U)
      obuf_wr_enQ       := RegNext(obuf_wr_en            , init = 0.U)
   }
   withClock(io.lsu_free_c2_clk){
      obuf_valid := RegNext(Mux(obuf_wr_en.asBool(),1.U ,obuf_valid) & !obuf_rst, false.B)
      obuf_nosend       := RegEnable(obuf_nosend_in      , init = 0.U, obuf_wr_en)
   }
   withClock(io.lsu_bus_obuf_c1_clk){
      obuf_write        := RegEnable(obuf_write_in       , init = 0.U, obuf_wr_en)
      obuf_sideeffect   := RegEnable(obuf_sideeffect_in  , init = 0.U, obuf_wr_en)
      obuf_sz           := RegEnable(obuf_sz_in          , init = 0.U, obuf_wr_en)
      obuf_byteen       := RegEnable(obuf_byteen_in      , init = 0.U, obuf_wr_en)
      obuf_merge        := RegEnable(obuf_merge_in       , init = 0.U, obuf_wr_en)
      obuf_tag0         := RegEnable(obuf_tag0_in        , init = 0.U, obuf_wr_en)
      obuf_tag1         := RegEnable(obuf_tag1_in        , init = 0.U, obuf_wr_en)
   }
////////////////////////////////////////////////////////////////////////////////////

   // WrPtr0_m := PriorityMux((0 until DEPTH).map(i =>(((buf_state(i)===IDLE.U) & !((ibuf_valid & (ibuf_tag====i.U)) | (io.lsu_busreq_r & ((WrPtr0_r === i) | (io.ldst_dual_r & (WrPtr1_r === i)))))).asBool -> i.asUInt(DEPTH_LOG2.W))))
   val test_seq = (0 until DEPTH).map(i=>((buf_state(i)===idle_C) & !((ibuf_valid & ibuf_tag===i.U) |
     (io.lsu_busreq_r & ((WrPtr0_r===i.U) | (io.ldst_dual_r & (WrPtr1_r===i.U)))))).asBool() -> i.U)
   WrPtr0_m := MuxCase(0.U, test_seq)
   val test_seq2 = (0 until DEPTH).map(i=>((buf_state(i) === idle_C) & !((ibuf_valid & (ibuf_tag === i.U)) |
     (io.lsu_busreq_m & (WrPtr0_m === i.U)) | (io.lsu_busreq_r & (WrPtr0_r === i.U) |
     (io.ldst_dual_r & (WrPtr1_r === i.U))))).asBool -> i.U)
    WrPtr1_m             := MuxCase(0.U, test_seq2)

  for {
    i <- 0 until DEPTH
    j <- 0 until DEPTH
  }{
    CmdPtr0Dec(i)           := ~(buf_age(i).asUInt.orR()) & (buf_state(i) === cmd_C) & ~buf_cmd_state_bus_en(i)
    CmdPtr1Dec(i)           := ~((buf_age(i).asUInt & ~CmdPtr0Dec.asUInt).orR()) & ~CmdPtr0Dec(i) & (buf_state(i) === cmd_C) & ~buf_cmd_state_bus_en(i)
    RspPtrDec(i)            := ~(buf_rsp_pickage(i).asUInt.orR()) & (buf_state(i) === done_wait_C)

    buf_age_in(i)(j)        := (((buf_state(i) === idle_C) & buf_state_en(i)) &
      (((buf_state(j) === wait_C) | ((buf_state(j) === cmd_C) & ~buf_cmd_state_bus_en(j)))  |
        (ibuf_drain_vld & io.lsu_busreq_r & (ibuf_byp | io.ldst_dual_r) & (i === WrPtr0_r) & (j === ibuf_tag))  |
        (ibuf_byp & io.lsu_busreq_r & io.ldst_dual_r & (i === WrPtr1_r) & (j === WrPtr0_r))))  | buf_age(i)(j)

    buf_age(i)(j)           := buf_ageQ(i)(j) & ~((buf_state(j) === cmd_C) & buf_cmd_state_bus_en(j))
    buf_age_younger(i)(j)   := Mux(i.asUInt(DEPTH_LOG2.W) === j.asUInt(DEPTH_LOG2.W), 0.U, (~buf_age(i)(j) & (buf_state(j) =/= idle_C)))

    buf_rspage_set(i)(j)    := ((buf_state(i) === idle_C) & buf_state_en(i)) & (~((buf_state(j) === idle_C) | (buf_state(j) === done_C))  |
      (ibuf_drain_vld & io.lsu_busreq_r & (ibuf_byp | io.ldst_dual_r) & (i === WrPtr0_r) & (j === ibuf_tag)) |
      (ibuf_byp & io.lsu_busreq_r & io.ldst_dual_r & (i === WrPtr1_r) & (j === WrPtr0_r)))
    buf_rspage_in(i)(j)     := buf_rspage_set(i)(j) | buf_rspage(i)(j)
    buf_rspage(i)(j)        := buf_rspageQ(i)(j) & ~((buf_state(j) === done_C) | (buf_state(j) === idle_C))
    buf_rsp_pickage(i)(j)   := buf_rspageQ(i)(j) & (buf_state(j) === done_wait_C)
  }

  CmdPtr0                 := PriorityEncoderOH(CmdPtr0Dec.asUInt)
  CmdPtr1                 := PriorityEncoderOH(CmdPtr1Dec.asUInt)
  RspPtr                  := PriorityEncoderOH(RspPtrDec.asUInt)
  found_cmdptr0           := CmdPtr0Dec.reduce(_|_)
  found_cmdptr1           := CmdPtr1Dec.reduce(_|_)

//////////////////////////       FSM       ///////////////////////////////////////
   for (i <- 0 until DEPTH){
      buf_nxtstate(i)            := idle_C
      buf_state_en(i)            := 0.U
      buf_cmd_state_bus_en(i)    := 0.U
      buf_resp_state_bus_en(i)   := 0.U
      buf_state_bus_en(i)        := 0.U
      buf_wr_en(i)               := 0.U
      buf_data_in(i)             := 0.U
      buf_data_en(i)             := 0.U
      buf_error_en(i)            := 0.U
      buf_rst(i)                 := 0.U
      buf_ldfwd_en(i)            := 0.U
      buf_ldfwd_in(i)            := 0.U
      buf_ldfwdtag_in(i)         := 0.U

      ibuf_drainvec_vld(i)       := (ibuf_drain_vld & (i === ibuf_tag))
      buf_byteen_in(i)           := Mux(ibuf_drainvec_vld(i), ibuf_byteen_out(3,0), Mux((ibuf_byp & io.ldst_dual_r & (i === WrPtr1_r)).asBool(), ldst_byteen_hi_r(3, 0), ldst_byteen_lo_r(3, 0)))
      buf_addr_in(i)             := Mux(ibuf_drainvec_vld(i), ibuf_addr(31,0), Mux((ibuf_byp & io.ldst_dual_r & (i === WrPtr1_r)).asBool(), io.end_addr_r(31, 0), io.lsu_addr_r(31, 0)))
      buf_dual_in(i)             := Mux(ibuf_drainvec_vld(i), ibuf_dual, io.ldst_dual_r)
      buf_samedw_in(i)           := Mux(ibuf_drainvec_vld(i), ibuf_samedw, ldst_samedw_r)
      buf_nomerge_in(i)          := Mux(ibuf_drainvec_vld(i), (ibuf_nomerge | ibuf_force_drain), io.no_dword_merge_r)
      buf_dualhi_in(i)           := Mux(ibuf_drainvec_vld(i), ibuf_dual, (ibuf_byp & io.ldst_dual_r & (i === WrPtr1_r)))
      buf_dualtag_in(i)          := Mux(ibuf_drainvec_vld(i), ibuf_dualtag, Mux((ibuf_byp & io.ldst_dual_r & (i === WrPtr1_r)).asBool(), WrPtr0_r, WrPtr1_r))
      buf_sideeffect_in(i)       := Mux(ibuf_drainvec_vld(i), ibuf_sideeffect, io.is_sideeffects_r)
      buf_unsign_in(i)           := Mux(ibuf_drainvec_vld(i), ibuf_unsign, io.lsu_pkt_r.unsign)
      buf_sz_in(i)               := Mux(ibuf_drainvec_vld(i), ibuf_sz, Cat(io.lsu_pkt_r.word, io.lsu_pkt_r.half))
      buf_write_in(i)            := Mux(ibuf_drainvec_vld(i), ibuf_write, io.lsu_pkt_r.store)

      // Buffer entry state machine
      switch (buf_state(i)){
         is (idle_C) {
            buf_nxtstate(i)   := Mux(io.lsu_bus_clk_en.asBool(), cmd_C, wait_C)
            buf_state_en(i)   := (io.lsu_busreq_r & io.lsu_commit_r & (((ibuf_byp | io.ldst_dual_r) & !ibuf_merge_en & (i === WrPtr0_r)) | (ibuf_byp & io.ldst_dual_r & (i === WrPtr1_r)))) | (ibuf_drain_vld & (i === ibuf_tag))
            buf_wr_en(i)      := buf_state_en(i)
            buf_data_en(i)    := buf_state_en(i)
            buf_data_in(i)    := Mux((ibuf_drain_vld & (i === ibuf_tag)).asBool(), ibuf_data_out(31, 0), store_data_lo_r(31, 0))
         }
         is (wait_C) {
            buf_nxtstate(i)   := Mux(io.dec_tlu_force_halt.asBool(), idle_C, cmd_C)
            buf_state_en(i)   := io.lsu_bus_clk_en | io.dec_tlu_force_halt
         }
         is (cmd_C) {
            buf_nxtstate(i)         := Mux(io.dec_tlu_force_halt.asBool(), idle_C, Mux((obuf_nosend & bus_rsp_read & (bus_rsp_read_tag === obuf_rdrsp_tag)), done_wait_C, resp_C))
            buf_cmd_state_bus_en(i) := ((obuf_tag0 === i.asUInt(pt1.LSU_BUS_TAG.W)) | (obuf_merge & (obuf_tag1 === i.asUInt(pt1.LSU_BUS_TAG.W)))) & obuf_valid & obuf_wr_enQ
            buf_state_bus_en(i)     := buf_cmd_state_bus_en(i)
            buf_state_en(i)         := (buf_state_bus_en(i) & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
            buf_ldfwd_in(i)         := 1.U(1.W)
            buf_ldfwd_en(i)         := buf_state_en(i) & !buf_write(i) & obuf_nosend & !io.dec_tlu_force_halt
            buf_ldfwdtag_in(i)      := (obuf_rdrsp_tag(pt1.LSU_BUS_TAG - 2,0)).asUInt
            buf_data_en(i)          := buf_state_bus_en(i) & io.lsu_bus_clk_en & obuf_nosend & bus_rsp_read
            buf_error_en(i)         := buf_state_bus_en(i) & io.lsu_bus_clk_en & obuf_nosend & bus_rsp_read_error
            buf_data_in(i)          := Mux(buf_error_en(i), bus_rsp_rdata(31,0), Mux(buf_addr(i)(2), bus_rsp_rdata(63, 32), bus_rsp_rdata(31, 0)))
         }
         is (resp_C){
            buf_nxtstate(i)         := Mux((io.dec_tlu_force_halt | (buf_write(i) & ~(pt.BUILD_AXI_NATIVE & bus_rsp_write_error))).asBool(), idle_C,
                                          Mux((buf_dual(i) & ~ buf_samedw(i) & ~ buf_write(i) &(buf_state(buf_dualtag(i)) =/= done_partial_C)), done_partial_C,
                                             Mux((buf_ldfwd(i) | any_done_wait_state | (buf_dual(i) & ~ buf_samedw(i) & ~ buf_write(i) & buf_ldfwd(buf_dualtag(i)) & (buf_state(buf_dualtag(i)) === done_partial_C) & any_done_wait_state)), done_wait_C, done_C)))
            buf_resp_state_bus_en(i):= (bus_rsp_write & (bus_rsp_write_tag === (i.asUInt(pt1.LSU_BUS_TAG.W)))) |
                                          (bus_rsp_read & ((bus_rsp_read_tag === (i.asUInt(pt1.LSU_BUS_TAG.W))) |
                                             (buf_ldfwd(i) & (bus_rsp_read_tag === (buf_ldfwdtag(i)))) |
                                                (buf_dual(i) & buf_dualhi(i) & ~buf_write(i) & buf_samedw(i) & (bus_rsp_read_tag === (buf_dualtag(i))))))
            buf_state_bus_en(i)     := buf_resp_state_bus_en(i)
            buf_state_en(i)         := (buf_state_bus_en(i) & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
            buf_data_en(i)          := buf_state_bus_en(i) & bus_rsp_read & io.lsu_bus_clk_en
            buf_error_en(i)         := buf_state_bus_en(i) & io.lsu_bus_clk_en & ((bus_rsp_read_error & (bus_rsp_read_tag === (i.asUInt(pt1.LSU_BUS_TAG.W))) ) |
                                          (bus_rsp_read_error & buf_ldfwd(i) & (bus_rsp_read_tag === buf_ldfwdtag(i))) |
                                             (bus_rsp_write_error & pt.BUILD_AXI_NATIVE & (bus_rsp_write_tag ===  i.asUInt(pt1.LSU_BUS_TAG.W))))
            buf_data_in(i)          := Mux((buf_state_en(i) & !buf_error_en(i)), Mux(buf_addr(i)(2), bus_rsp_rdata(63, 32), bus_rsp_rdata(31, 0)), bus_rsp_rdata(31, 0))
         }
         is (done_partial_C){ // Other part of dual load hasn't returned
            buf_nxtstate(i)      := Mux(io.dec_tlu_force_halt.asBool(), idle_C, Mux((buf_ldfwd(i) | buf_ldfwd(buf_dualtag(i)) | any_done_wait_state), done_wait_C, done_C))
            buf_state_bus_en(i)  := bus_rsp_read & ((bus_rsp_read_tag === buf_dualtag(i).asUInt()) |
                                       (buf_ldfwd(buf_dualtag(i)) & (bus_rsp_read_tag === buf_ldfwdtag(buf_dualtag(i)).asUInt())))
            buf_state_en(i)      := (buf_state_bus_en(i) & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
         }
         is (done_wait_C) { // WAIT state if there are multiple outstanding nb returns
            buf_nxtstate(i)   := Mux(io.dec_tlu_force_halt.asBool(), idle_C, done_C)
            buf_state_en(i)   := ((RspPtr === i.asUInt(DEPTH_LOG2.W)) |(buf_dual(i) & (buf_dualtag(i) === RspPtr))) | io.dec_tlu_force_halt
         }
         is (done_C) {
            buf_nxtstate(i)   := idle_C
            buf_rst(i)        := 1.U
            buf_state_en(i)   := 1.U
            buf_ldfwd_in(i)   := 0.U
            buf_ldfwd_en(i)   := buf_state_en(i)
         }
      }

      buf_byteen(i)           := RegEnable(buf_byteen_in(i)       , init = 0.U   ,buf_wr_en(i))
      buf_data(i)             := RegEnable(buf_data_in(i)         , init = 0.U   ,buf_data_en(i))
      withClock(io.lsu_bus_buf_c1_clk){
         buf_state(i)         := RegEnable(buf_nxtstate(i)        , init = idle_C  ,buf_state_en(i))
         buf_dualtag(i)       := RegEnable(buf_dualtag_in(i)      , init = 0.U   ,buf_wr_en(i))
         buf_dual(i)          := RegEnable(buf_dual_in(i)         , init = 0.U   ,buf_wr_en(i))
         buf_samedw(i)        := RegEnable(buf_samedw_in(i)       , init = 0.U   ,buf_wr_en(i))
         buf_nomerge(i)       := RegEnable(buf_nomerge_in(i)      , init = 0.U   ,buf_wr_en(i))
         buf_dualhi(i)        := RegEnable(buf_dualhi_in(i)       , init = 0.U   ,buf_wr_en(i))
         buf_sideeffect(i)    := RegEnable(buf_sideeffect_in(i)   , init = 0.U   ,buf_wr_en(i))
         buf_unsign(i)        := RegEnable(buf_unsign_in(i)       , init = 0.U   ,buf_wr_en(i))
         buf_write(i)         := RegEnable(buf_write_in(i)        , init = 0.U   ,buf_wr_en(i))
         buf_sz(i)            := RegEnable(buf_sz_in(i)           , init = 0.U   ,buf_wr_en(i))
         buf_addr(i)          := RegEnable(buf_addr_in(i)         , init = 0.U   ,buf_wr_en(i))
         buf_ldfwd(i)         := RegEnable(buf_ldfwd_in(i)        , init = 0.U   ,buf_ldfwd_en(i))
         buf_ldfwdtag(i)      := RegEnable(buf_ldfwdtag_in(i)     , init = 0.U   ,buf_ldfwd_en(i))
         buf_error(i)         := RegEnable(~buf_rst(i)            , init = 0.U   ,(buf_error_en(i)|buf_rst(i)).asBool)
         buf_ageQ(i)          := RegNext(buf_age_in(i)            , init = VecInit((0 until 4).map(i=>false.B)))
         buf_rspageQ(i)       := RegNext(buf_rspage_in(i)         , init = VecInit((0 until 4).map(i=>false.B)))
      }
   }

//////////////////////////////////////////////////////////////////////////////////
   buf_numvld_any       := (io.lsu_busreq_m << io.ldst_dual_m) + (io.lsu_busreq_r << io.ldst_dual_r) + ibuf_valid + 
                           {for(i <- 0 until DEPTH) yield (  buf_state(i) =/= idle_C).asUInt                                                       }.reduce(_+_)
   buf_numvld_wrcmd_any := {for(i <- 0 until DEPTH) yield (( buf_state(i) === cmd_C) & ~buf_cmd_state_bus_en(i) & buf_write(i)).asUInt             }.reduce(_+_)
   buf_numvld_cmd_any   := {for(i <- 0 until DEPTH) yield (( buf_state(i) === cmd_C) & ~buf_cmd_state_bus_en(i)).asUInt                            }.reduce(_+_)
   buf_numvld_pend_any  := {for(i <- 0 until DEPTH) yield (((buf_state(i) === cmd_C) & ~buf_cmd_state_bus_en(i)) | (buf_state(i) === wait_C)).asUInt }.reduce(_+_)
   any_done_wait_state  := {for(i <- 0 until DEPTH) yield    buf_state(i) === done_wait_C                                                          }.reduce(_|_)

   io.lsu_bus_buffer_pend_any       := buf_numvld_pend_any =/= 0.U
   io.lsu_bus_buffer_full_any       := Mux((io.ldst_dual_d & io.dec_lsu_valid_raw_d),buf_numvld_any(3,0) >= (DEPTH-1).asUInt(4.W), buf_numvld_any(3,0) === DEPTH.asUInt(4.W))
   io.lsu_bus_buffer_empty_any      := ~((0 until DEPTH).map(i =>(buf_state(i)).asUInt).reduce(_|_)) & ~ibuf_valid & ~obuf_valid

   io.lsu_nonblock_load_valid_m     := io.lsu_busreq_m & io.lsu_pkt_m.valid & io.lsu_pkt_m.load & ~io.flush_m_up & ~ io.ld_full_hit_m
   io.lsu_nonblock_load_tag_m       := WrPtr0_m(DEPTH_LOG2-1,0)
   io.lsu_nonblock_load_inv_r       := lsu_nonblock_load_valid_r & ~io.lsu_commit_r
   io.lsu_nonblock_load_inv_tag_r   := WrPtr0_r(DEPTH_LOG2-1,0)

   lsu_nonblock_load_data_ready     := Mux1H((0 until DEPTH).map(i =>(buf_state(i) === done_C)  -> ~(pt.BUILD_AXI_NATIVE & buf_write(i))))
   io.lsu_nonblock_load_data_error  := Mux1H((0 until DEPTH).map(i =>(buf_state(i) === done_C & ~buf_write(i))  -> (buf_error(i))))
   io.lsu_nonblock_load_data_tag    := Mux1H((0 until DEPTH).map(i =>(buf_state(i) === done_C & (~buf_dual(i) | ~buf_dualhi(i)) & ~buf_write(i)) -> intToUInt(i)))
   lsu_nonblock_load_data_lo        := Mux1H((0 until DEPTH).map(i =>(buf_state(i) === done_C & ~buf_write(i) & (~buf_dual(i) | ~buf_dualhi(i))) -> buf_data(i)))
   lsu_nonblock_load_data_hi        := Mux1H((0 until DEPTH).map(i =>(buf_state(i) === done_C & ~buf_write(i) & ( buf_dual(i) &  buf_dualhi(i))) -> buf_data(i)))

  lsu_nonblock_addr_offset          := buf_addr(io.lsu_nonblock_load_data_tag)(1,0)
  lsu_nonblock_sz                   := buf_sz(io.lsu_nonblock_load_data_tag)(1,0)
  lsu_nonblock_unsign               := buf_unsign(io.lsu_nonblock_load_data_tag)
  lsu_nonblock_dual                 := buf_dual(io.lsu_nonblock_load_data_tag)
  lsu_nonblock_data_unalgn          := (Cat(lsu_nonblock_load_data_hi(31,0), lsu_nonblock_load_data_lo(31,0)) >> 8*lsu_nonblock_addr_offset(1,0))(31,0)
  io.lsu_nonblock_load_data_valid   := lsu_nonblock_load_data_ready & ~io.lsu_nonblock_load_data_error
  io.lsu_nonblock_load_data         := Mux1H(Seq(
                                          (lsu_nonblock_unsign  & lsu_nonblock_sz === 0.U) -> Cat(Fill(24,0.U(1.W)),lsu_nonblock_data_unalgn(7,0)),
                                          (lsu_nonblock_unsign  & lsu_nonblock_sz === 1.U) -> Cat(Fill(16,0.U(1.W)),lsu_nonblock_data_unalgn(15,0)),
                                          (~lsu_nonblock_unsign & lsu_nonblock_sz === 0.U) -> Cat(Fill(24,lsu_nonblock_data_unalgn(7)),lsu_nonblock_data_unalgn(7,0)),
                                          (~lsu_nonblock_unsign & lsu_nonblock_sz === 1.U) -> Cat(Fill(16,lsu_nonblock_data_unalgn(15)),lsu_nonblock_data_unalgn(15,0)),
                                          (lsu_nonblock_unsign  & lsu_nonblock_sz === 2.U) -> lsu_nonblock_data_unalgn(31,0)
                                      ))
  bus_sideeffect_pend      := Mux(obuf_valid,obuf_sideeffect & io.dec_tlu_sideeffect_posted_disable,Mux1H((0 until DEPTH).map(i =>(buf_state(i) === resp_C) -> (buf_sideeffect(i) & io.dec_tlu_sideeffect_posted_disable))))
  bus_addr_match_pending   := Mux1H((0 until DEPTH).map(i =>(pt.BUILD_AXI_NATIVE & obuf_valid & (obuf_addr(31,3) === buf_addr(i)(31,3))).asBool -> ((buf_state(i) === resp_C) & ~((obuf_tag0 === intToUInt(i)) | (obuf_merge & (obuf_tag1 === intToUInt(i)))))))

  bus_cmd_ready            := Mux(obuf_write, Mux((obuf_cmd_done | obuf_data_done), Mux(obuf_cmd_done, io.lsu_axi_wready, io.lsu_axi_awready), (io.lsu_axi_awready & io.lsu_axi_wready)), io.lsu_axi_arready)
  bus_wcmd_sent            := io.lsu_axi_awvalid & io.lsu_axi_awready
  bus_wdata_sent           := io.lsu_axi_wvalid & io.lsu_axi_wready
  bus_cmd_sent             := ((obuf_cmd_done | bus_wcmd_sent) & (obuf_data_done | bus_wdata_sent)) | (io.lsu_axi_arvalid & io.lsu_axi_arready)

  bus_rsp_read             := io.lsu_axi_rvalid & io.lsu_axi_rready
  bus_rsp_write            := io.lsu_axi_bvalid & io.lsu_axi_bready
  bus_rsp_read_tag         := io.lsu_axi_rid(pt1.LSU_BUS_TAG-1,0)
  bus_rsp_write_tag        := io.lsu_axi_bid(pt1.LSU_BUS_TAG-1,0)
  bus_rsp_write_error      := bus_rsp_write & (io.lsu_axi_bresp(1,0) =/= 0.U(2.W))
  bus_rsp_read_error       := bus_rsp_read  & (io.lsu_axi_rresp(1,0) =/= 0.U(2.W))
  bus_rsp_rdata            := io.lsu_axi_rdata(63,0)
//////////////////////////////////////////////////////////////////////////////////
   lsu_axi_rdata_q               := RegEnable(io.lsu_axi_rdata, init = 0.U, io.lsu_axi_rvalid&io.lsu_bus_clk_en)
   withClock(io.lsu_c2_r_clk){
      io.lsu_busreq_r            := RegNext((io.lsu_busreq_m & !io.flush_r & !io.ld_full_hit_m),  0.U)
      WrPtr0_r                   := RegNext(WrPtr0_m, init = 0.U)
      WrPtr1_r                   := RegNext(WrPtr1_m, init = 0.U)
      lsu_nonblock_load_valid_r  := RegNext(io.lsu_nonblock_load_valid_m, init = 0.U)
   }
   withClock(io.lsu_busm_clk){
      lsu_axi_awvalid_q          := RegNext(io.lsu_axi_awvalid,   init = 0.U)
      lsu_axi_awready_q          := RegNext(io.lsu_axi_awready,   init = 0.U)
      lsu_axi_wvalid_q           := RegNext(io.lsu_axi_wvalid,    init = 0.U)
      lsu_axi_wready_q           := RegNext(io.lsu_axi_wready,    init = 0.U)
      lsu_axi_arvalid_q          := RegNext(io.lsu_axi_arvalid,   init = 0.U)
      lsu_axi_arready_q          := RegNext(io.lsu_axi_arready,   init = 0.U)
      lsu_axi_bvalid_q           := RegNext(io.lsu_axi_bvalid,    init = 0.U)
      lsu_axi_bready_q           := RegNext(io.lsu_axi_bready,    init = 0.U)
      lsu_axi_rvalid_q           := RegNext(io.lsu_axi_rvalid,    init = 0.U)
      lsu_axi_rready_q           := RegNext(io.lsu_axi_rready,    init = 0.U)
      lsu_axi_bid_q              := RegNext(io.lsu_axi_bid,       init = 0.U)
      lsu_axi_rid_q              := RegNext(io.lsu_axi_rid,       init = 0.U)
      lsu_axi_bresp_q            := RegNext(io.lsu_axi_bresp,     init = 0.U)
      lsu_axi_rresp_q            := RegNext(io.lsu_axi_rresp,     init = 0.U)
   }
///////////////////////////////////////////////////////////////////////////////////

  io.ld_fwddata_buf_lo              := 0.U
  io.ld_fwddata_buf_hi              := 0.U

  lsu_imprecise_error_store_tag     :=  Mux1H((0 until DEPTH).map(i =>(((buf_state(i) === done_C) & buf_error(i) & buf_write(i))  -> intToUInt(i))))
  io.lsu_imprecise_error_load_any   := io.lsu_nonblock_load_data_error & ~io.lsu_imprecise_error_store_any
  io.lsu_imprecise_error_store_any  := {for(i <- 0 until DEPTH) yield io.lsu_bus_clk_en_q & (buf_state(i) === done_C) & buf_error(i) & buf_write(i)}.reduce(_|_)
  io.lsu_imprecise_error_addr_any   := Mux(io.lsu_imprecise_error_store_any, buf_addr(lsu_imprecise_error_store_tag), buf_addr(io.lsu_nonblock_load_data_tag))

  bus_pend_trxnQ                    := 0.U(8.W)
  bus_pend_trxn                     := 0.U(8.W)
  bus_pend_trxn_ns                  := 0.U(8.W)
  lsu_bus_cntr_overflow             := 0.U(1.W)
  io.lsu_bus_idle_any               := true.B

  io.lsu_pmu_bus_trxn               := (io.lsu_axi_awvalid & io.lsu_axi_awready) | (io.lsu_axi_wvalid & io.lsu_axi_wready) | (io.lsu_axi_arvalid & io.lsu_axi_arready)
  io.lsu_pmu_bus_misaligned         := io.lsu_busreq_r & io.ldst_dual_r & io.lsu_commit_r
  io.lsu_pmu_bus_error              := io.lsu_imprecise_error_load_any | io.lsu_imprecise_error_store_any
  io.lsu_pmu_bus_busy               := (io.lsu_axi_awvalid & ~io.lsu_axi_awready | (io.lsu_axi_wvalid & ~io.lsu_axi_wready) | (io.lsu_axi_arvalid & ~io.lsu_axi_arready))

  io.lsu_axi_awvalid                := obuf_valid & obuf_write & ~obuf_cmd_done & ~bus_addr_match_pending
  io.lsu_axi_awid                   := obuf_tag0.asUInt
  io.lsu_axi_awaddr                 := Mux(obuf_sideeffect, obuf_addr,Cat(obuf_addr(31,3),0.U(3.W)))
  io.lsu_axi_awregion               := obuf_addr(31,28)
  io.lsu_axi_awlen                  := 0.U(8.W)
  io.lsu_axi_awsize                 := Mux(obuf_sideeffect, Cat(false.B,obuf_sz),3.U(3.W))
  io.lsu_axi_awburst                := 1.U(2.W)
  io.lsu_axi_awlock                 := 0.U
  io.lsu_axi_awcache                := Mux(obuf_sideeffect, 0.U(4.W),15.U(4.W))
  io.lsu_axi_awprot                 := 0.U(3.W)
  io.lsu_axi_awqos                  := 0.U(4.W)

  io.lsu_axi_wvalid                 := obuf_valid & obuf_write & ~obuf_data_done & ~bus_addr_match_pending
  io.lsu_axi_wdata                  := obuf_data
  io.lsu_axi_wstrb                  := obuf_byteen & Fill(8,obuf_write)
  io.lsu_axi_wlast                  := 1.U

  io.lsu_axi_arvalid                := obuf_valid & ~obuf_write & ~obuf_nosend & ~bus_addr_match_pending
  io.lsu_axi_arid                   := obuf_tag0.asUInt
  io.lsu_axi_araddr                 := io.lsu_axi_awaddr
  io.lsu_axi_arregion               := obuf_addr(31,28)
  io.lsu_axi_arlen                  := 0.U(8.W)
  io.lsu_axi_arsize                 := io.lsu_axi_awsize
  io.lsu_axi_arburst                := 1.U(2.W)
  io.lsu_axi_arlock                 := 0.U
  io.lsu_axi_arcache                := io.lsu_axi_awcache
  io.lsu_axi_arprot                 := 0.U
  io.lsu_axi_arqos                  := 0.U

  io.lsu_axi_bready                 := 1.U
  io.lsu_axi_rready                 := 1.U


}
object BusBufmain extends App{
   println("Generate Verilog")
   println((new chisel3.stage.ChiselStage).emitVerilog((new el2_lsu_bus_buffer())))
}
