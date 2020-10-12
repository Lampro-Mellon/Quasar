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

    val scan_mode = Input(Bool())
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
  val idle_C :: crit_byp_ok_C :: hit_u_miss_C :: miss_wait_C :: crit_wrd_rdy_C :: scnd_miss_C :: stream_C :: stall_scnd_miss_C :: Nil = Enum(8)
  val err_stop_idle_C :: err_fetch1_C :: err_fetch2_C :: err_stop_fetch_C :: Nil = Enum(4)
  val err_idle_C :: ic_wff_C :: ecc_wff_C :: ecc_cor_C :: dma_sb_err_C :: Nil = Enum(5)


  val iccm_single_ecc_error = WireInit(UInt(2.W), 0.U)
  val ifc_fetch_req_f = WireInit(Bool(), 0.U)
  val miss_pending = WireInit(Bool(), 0.U)
  val scnd_miss_req = WireInit(Bool(), 0.U)
  val dma_iccm_req_f = WireInit(Bool(), 0.U)
  val iccm_correct_ecc = WireInit(Bool(), 0.U)
  val perr_state = WireInit(UInt(3.W), 0.U)
  val err_stop_state = WireInit(UInt(2.W), 0.U)
  val err_stop_fetch = WireInit(Bool(), 0.U)
  val miss_state = WireInit(UInt(3.W), 0.U)
  val miss_nxtstate = WireInit(UInt(3.W), 0.U)
  val miss_state_en = WireInit(Bool(), 0.U)
  val ifu_bus_rsp_valid = WireInit(Bool(), 0.U)
  val bus_ifu_bus_clk_en = WireInit(Bool(), 0.U)
  val ifu_bus_rsp_ready = WireInit(Bool(), 0.U)
  val uncacheable_miss_ff = WireInit(Bool(), 0.U)
  val ic_act_miss_f = WireInit(Bool(), 0.U)
  val ic_byp_hit_f = WireInit(Bool(), 0.U)
  val bus_new_data_beat_count = WireInit(UInt(ICACHE_BEAT_BITS.W), 0.U)
  val bus_ifu_wr_en_ff = WireInit(Bool(), 0.U)
  val last_beat = WireInit(Bool(), 0.U)
  val last_data_recieved_ff = WireInit(Bool(), 0.U)
  //val flush_final_f = WireInit(Bool(), 0.U)
  val stream_eol_f = WireInit(Bool(), 0.U)
  val ic_miss_under_miss_f = WireInit(Bool(), 0.U)
  val ic_ignore_2nd_miss_f = WireInit(Bool(), 0.U)

  val flush_final_f = RegNext(io.exu_flush_final, 0.U)
  val fetch_bf_f_c1_clken = io.ifc_fetch_req_bf_raw | ifc_fetch_req_f | miss_pending | io.exu_flush_final | scnd_miss_req
  val debug_c1_clken = io.ic_debug_rd_en | io.ic_debug_wr_en
  val debug_c1_clk = rvclkhdr(clock, debug_c1_clken, io.scan_mode)
  val fetch_bf_f_c1_clk = rvclkhdr(clock, fetch_bf_f_c1_clken.asBool, io.scan_mode)
  io.iccm_dma_sb_error := iccm_single_ecc_error.orR() & dma_iccm_req_f.asBool()
  io.ifu_async_error_start := io.iccm_rd_ecc_single_err | io.ic_error_start
  io.ic_dma_active := iccm_correct_ecc | (perr_state === dma_sb_err_C) | (err_stop_state === err_stop_fetch_C) | err_stop_fetch | io.dec_tlu_flush_err_wb
  val scnd_miss_req_in = ifu_bus_rsp_valid & bus_ifu_bus_clk_en & ifu_bus_rsp_ready & bus_new_data_beat_count.andR &
    !uncacheable_miss_ff ((miss_state === scnd_miss_C)|(miss_nxtstate === scnd_miss_C)) & !io.exu_flush_final

  val ifu_bp_hit_taken_q_f = io.ifu_bp_hit_taken_f & io.ic_hit_f

  switch(miss_state){
    is (idle_C){
      miss_nxtstate := Mux((ic_act_miss_f & !io.exu_flush_final).asBool, crit_byp_ok_C, hit_u_miss_C)
      miss_state_en := ic_act_miss_f & !io.dec_tlu_force_halt}
    is (crit_byp_ok_C){
      miss_nxtstate := Mux((io.dec_tlu_force_halt | ic_byp_hit_f &  (last_data_recieved_ff | (bus_ifu_wr_en_ff & last_beat)) &  uncacheable_miss_ff).asBool, idle_C,
        Mux((ic_byp_hit_f &  !last_data_recieved_ff &  uncacheable_miss_ff).asBool, miss_wait_C,
          Mux((!ic_byp_hit_f & !io.exu_flush_final & (bus_ifu_wr_en_ff & last_beat) &  uncacheable_miss_ff).asBool, crit_byp_ok_C,
            Mux(((bus_ifu_wr_en_ff & last_beat) & !uncacheable_miss_ff).asBool, idle_C,
              Mux(((ic_byp_hit_f | bus_ifu_wr_en_ff) & !io.exu_flush_final & !(bus_ifu_wr_en_ff & last_beat) & !ifu_bp_hit_taken_q_f & !uncacheable_miss_ff).asBool, stream_C,
                Mux((!ic_byp_hit_f  &  !io.exu_flush_final &  (bus_ifu_wr_en_ff & last_beat)       & !uncacheable_miss_ff).asBool, idle_C,
                  Mux(((io.exu_flush_final | ifu_bp_hit_taken_q_f) & !(bus_ifu_wr_en_ff & last_beat)).asBool, hit_u_miss_C, idle_C)))))))
      miss_state_en := io.dec_tlu_force_halt | io.exu_flush_final | ic_byp_hit_f | ifu_bp_hit_taken_q_f | (bus_ifu_wr_en_ff & last_beat) | (bus_ifu_wr_en_ff & !uncacheable_miss_ff)
    }
    is (crit_wrd_rdy_C){
      miss_nxtstate := idle_C
      miss_state_en := io.exu_flush_final | flush_final_f | ic_byp_hit_f | io.dec_tlu_force_halt
    }
    is (stream_C){
      miss_nxtstate := Mux(((io.exu_flush_final | ifu_bp_hit_taken_q_f | stream_eol_f)&(!(bus_ifu_wr_en_ff & last_beat)) & !io.dec_tlu_force_halt).asBool, hit_u_miss_C, idle_C)
      miss_state_en := io.exu_flush_final | ifu_bp_hit_taken_q_f  | stream_eol_f   |  (bus_ifu_wr_en_ff & last_beat) | io.dec_tlu_force_halt
    }
    is (miss_wait_C){
      miss_nxtstate := Mux((io.exu_flush_final & !(bus_ifu_wr_en_ff & last_beat) & !io.dec_tlu_force_halt).asBool, hit_u_miss_C, idle_C)
      miss_state_en := io.exu_flush_final | (bus_ifu_wr_en_ff & last_beat) | io.dec_tlu_force_halt
    }
    is (hit_u_miss_C){
      miss_nxtstate := Mux((ic_miss_under_miss_f & !(bus_ifu_wr_en_ff & last_beat) & !io.dec_tlu_force_halt).asBool, scnd_miss_C,
        Mux((ic_ignore_2nd_miss_f & !(bus_ifu_wr_en_ff & last_beat) & !io.dec_tlu_force_halt).asBool, stall_scnd_miss_C, idle_C))
      miss_state_en := (bus_ifu_wr_en_ff & last_beat) | ic_miss_under_miss_f | ic_ignore_2nd_miss_f | io.dec_tlu_force_halt
    }
    is (scnd_miss_C){
      miss_nxtstate := Mux(io.dec_tlu_force_halt, idle_C, Mux(io.exu_flush_final,
        Mux((bus_ifu_wr_en_ff & last_beat).asBool, idle_C, hit_u_miss_C), crit_byp_ok_C))
      miss_state_en := (bus_ifu_wr_en_ff & last_beat) | io.exu_flush_final | io.dec_tlu_force_halt
    }
    is (stall_scnd_miss_C){
      miss_nxtstate := Mux(io.dec_tlu_force_halt, idle_C, Mux(io.exu_flush_final,
        Mux((bus_ifu_wr_en_ff & last_beat).asBool, idle_C, hit_u_miss_C), idle_C))
      miss_state_en := (bus_ifu_wr_en_ff & last_beat) | io.exu_flush_final | io.dec_tlu_force_halt
    }
  }
  miss_state := RegEnable(miss_nxtstate, 0.U, miss_state_en.asBool)
  val crit_byp_hit_f = WireInit(Bool(), 0.U)
  val way_status_mb_scnd_ff = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val tagv_mb_scnd_ff = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val ic_tag_valid = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val uncacheable_miss_scnd_ff = WireInit(Bool(), 0.U)
  val imb_scnd_ff = WireInit(UInt(31.W), 0.U)
  val reset_all_tags = WireInit(Bool(), 0.U)
  val bus_rd_addr_count = WireInit(UInt(ICACHE_BEAT_BITS.W), 0.U)
  val ifu_bus_rid_ff = WireInit(UInt(ICACHE_BEAT_BITS.W), 0.U)
  miss_pending := miss_state =/= idle_C
  val crit_wd_byp_ok_ff = (miss_state === crit_byp_ok_C) | ((miss_state === crit_wrd_rdy_C) & !flush_final_f)
  val sel_hold_imb = (miss_pending & !(bus_ifu_wr_en_ff & last_beat) & !((miss_state === crit_wrd_rdy_C) & io.exu_flush_final) &
                      !((miss_state === crit_wrd_rdy_C) & crit_byp_hit_f) ) | ic_act_miss_f |
    (miss_pending & (miss_nxtstate === crit_wrd_rdy_C))

  val sel_hold_imb_scnd = ((miss_state === scnd_miss_C) | ic_miss_under_miss_f) & !flush_final_f
  val way_status_mb_scnd_in = Mux(miss_state === scnd_miss_C, way_status_mb_scnd_ff, way_status)

  val tagv_mb_scnd_in = Mux(miss_state === scnd_miss_C, tagv_mb_scnd_ff, Fill(ICACHE_NUM_WAYS, !reset_all_tags) & ic_tag_valid)
  val uncacheable_miss_scnd_in = Mux(sel_hold_imb_scnd.asBool, uncacheable_miss_scnd_ff, io.ifc_fetch_uncacheable_bf)
  uncacheable_miss_scnd_ff := RegNext(uncacheable_miss_scnd_in, 0.U)
  val imb_scnd_in = Mux(sel_hold_imb_scnd.asBool, imb_scnd_ff, io.ifc_fetch_addr_bf)
  imb_scnd_ff := RegNext(imb_scnd_in, 0.U)
  way_status_mb_scnd_ff := RegNext(way_status_mb_scnd_in, 0.U)
  tagv_mb_scnd_ff := RegNext(tagv_mb_scnd_in, 0.U)

  val ic_req_addr_bits_hi_3 = bus_rd_addr_count
  val ic_wr_addr_bits_hi_3 = ifu_bus_rid_ff & Fill(ICACHE_BEAT_BITS, bus_ifu_wr_en_ff)
  val ifc_iccm_access_f = WireInit(Bool(), 0.U)
  val ifc_region_acc_fault_final_f = WireInit(Bool(), 0.U)
  val fetch_req_icache_f   = ifc_fetch_req_f & !ifc_iccm_access_f & !ifc_region_acc_fault_final_f
  val fetch_req_iccm_f     = ifc_fetch_req_f &  ifc_iccm_access_f
  val ic_iccm_hit_f = fetch_req_iccm_f  &  (!miss_pending | (miss_state === hit_u_miss_C) | (miss_state === stream_C))
  val stream_hit_f = WireInit(Bool(), 0.U)
  ic_byp_hit_f := (crit_byp_hit_f | stream_hit_f)  & fetch_req_icache_f &  miss_pending
  val sel_mb_addr_ff = WireInit(Bool(), 0.U)
  val imb_ff = WireInit(UInt(31.W), 0.U)
  val ifu_fetch_addr_int_f = WireInit(UInt(31.W), 0.U)
  val ic_act_hit_f = io.ic_rd_hit.orR & fetch_req_icache_f & !reset_all_tags & (!miss_pending | (miss_state===hit_u_miss_C)) & !sel_mb_addr_ff
  ic_act_miss_f := (((!io.ic_rd_hit.orR | reset_all_tags) & fetch_req_icache_f & !miss_pending) | scnd_miss_req) & !ifc_region_acc_fault_final_f
  ic_miss_under_miss_f := (!io.ic_rd_hit | reset_all_tags) & fetch_req_icache_f & (miss_state===hit_u_miss_C) &
    (imb_ff(30,ICACHE_TAG_INDEX_LO-1) =/= ifu_fetch_addr_int_f(30,ICACHE_TAG_INDEX_LO-1)) & !uncacheable_miss_ff & !sel_mb_addr_ff & !ifc_region_acc_fault_final_f
  ic_ignore_2nd_miss_f := (!io.ic_rd_hit.orR | reset_all_tags) & fetch_req_icache_f & (miss_state === hit_u_miss_C) &
    ((imb_ff(30,ICACHE_TAG_INDEX_LO-1)===ifu_fetch_addr_int_f(30,ICACHE_TAG_INDEX_LO-1))  |   uncacheable_miss_ff)
  // Output
  io.ic_hit_f := ic_act_hit_f | ic_byp_hit_f | ic_iccm_hit_f | (ifc_region_acc_fault_final_f & ifc_fetch_req_f)
  val uncacheable_miss_in = Mux(scnd_miss_req.asBool, uncacheable_miss_scnd_ff, Mux(sel_hold_imb.asBool, uncacheable_miss_ff, io.ifc_fetch_uncacheable_bf))
  val imb_in = Mux(scnd_miss_req.asBool, imb_scnd_ff, Mux(sel_hold_imb.asBool, imb_ff, io.ifc_fetch_addr_bf))
  val ifu_wr_cumulative_err_data = WireInit(Bool(), 0.U)
  val scnd_miss_index_match = (imb_ff(ICACHE_INDEX_HI,ICACHE_TAG_INDEX_LO)===imb_scnd_ff(ICACHE_INDEX_HI,ICACHE_TAG_INDEX_LO))& scnd_miss_req & !ifu_wr_cumulative_err_data
  val way_status_mb_ff = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status_rep_new = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status_mb_in = Mux((scnd_miss_req & !scnd_miss_index_match).asBool, way_status_mb_scnd_ff,
      Mux((scnd_miss_req &  scnd_miss_index_match).asBool, way_status_rep_new,
        Mux(miss_pending.asBool, way_status_mb_ff, way_status)))
  val replace_way_mb_any = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val tagv_mb_ff = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val tagv_mb_in = Mux(scnd_miss_req.asBool, tagv_mb_scnd_ff | (Fill(ICACHE_NUM_WAYS, scnd_miss_index_match) & replace_way_mb_any),
  Mux(miss_pending.asBool, tagv_mb_ff, ic_tag_valid & Fill(ICACHE_NUM_WAYS, !reset_all_tags)))
  val scnd_miss_req_q = WireInit(Bool(), 0.U)
  val reset_ic_ff = WireInit(Bool(), 0.U)
  val reset_ic_in = miss_pending & !scnd_miss_req_q &  (reset_all_tags |  reset_ic_ff)
  reset_ic_ff := RegNext(reset_ic_in)
  val fetch_uncacheable_ff = RegNext(io.ifc_fetch_uncacheable_bf, 0.U)
  ifu_fetch_addr_int_f := RegNext(io.ifc_fetch_addr_bf, 0.U)
  val vaddr_f = ifu_fetch_addr_int_f
  uncacheable_miss_ff := RegNext(uncacheable_miss_in, 0.U)
  imb_ff := RegNext(imb_in)
  val miss_addr = WireInit(UInt((31-ICACHE_BEAT_ADDR_HI).W), 0.U)
  val miss_addr_in = Mux(!miss_pending, imb_ff(30, ICACHE_BEAT_ADDR_HI),
    Mux(scnd_miss_req_q.asBool, imb_scnd_ff(30, ICACHE_BEAT_ADDR_HI), miss_addr))
  miss_addr := RegNext(miss_addr_in, 0.U)
  way_status_mb_ff := RegNext(way_status_mb_in, 0.U)
  tagv_mb_ff := RegNext(tagv_mb_in, 0.U)
  val stream_miss_f = WireInit(Bool(), 0.U)
  val ifc_fetch_req_qual_bf  = io.ifc_fetch_req_bf  & !((miss_state===crit_wrd_rdy_C) & flush_final_f) & !stream_miss_f
  val ifc_fetch_req_f_raw = RegNext(ifc_fetch_req_qual_bf, 0.U)
  ifc_fetch_req_f := ifc_fetch_req_f_raw & !io.exu_flush_final
  ifc_iccm_access_f := RegNext(io.ifc_iccm_access_bf, 0.U)
  val ifc_region_acc_fault_final_bf = WireInit(Bool(), 0.U)
  ifc_region_acc_fault_final_f := RegNext(ifc_region_acc_fault_final_bf, 0.U)
  val ifc_region_acc_fault_f = RegNext(io.ifc_region_acc_fault_bf, 0.U)
  val ifu_ic_req_addr_f = Cat(miss_addr, ic_req_addr_bits_hi_3)
  val ifu_ic_mb_empty = (((miss_state===hit_u_miss_C) | (miss_state===stream_C)) & !(bus_ifu_wr_en_ff & last_beat)) | !miss_pending
  val ifu_miss_state_idle = miss_state === idle_C
  val write_ic_16_bytes = WireInit(Bool(), 0.U)
  val reset_tag_valid_for_miss = WireInit(Bool(), 0.U)
  val sel_mb_addr = (miss_pending & write_ic_16_bytes & !uncacheable_miss_ff) | reset_tag_valid_for_miss
  val ifu_ic_rw_int_addr = Mux1H(Seq(sel_mb_addr.asBool->Cat(imb_ff(30,ICACHE_BEAT_ADDR_HI) , ic_wr_addr_bits_hi_3 , imb_ff(1,0)),
                                    !sel_mb_addr.asBool->ifu_fetch_addr_int_f))
  val ic_rw_addr = ifu_ic_rw_int_addr
  sel_mb_addr_ff := withClock(io.free_clk){RegNext(sel_mb_addr, 0.U)}
  val ifu_bus_rdata_ff = WireInit(UInt(64.W), 0.U)
  val ic_miss_buff_half = WireInit(UInt(64.W), 0.U)
  val ic_wr_ecc = rvecc_encode_64(ifu_bus_rdata_ff)
  val ic_miss_buff_ecc = rvecc_encode_64(ic_miss_buff_half)
  val ic_wr_16bytes_data = WireInit(UInt((ICACHE_BANKS_WAY * (if(ICACHE_ECC) 71 else 68)).W), 0.U)
  io.ic_wr_data := (0 until ICACHE_BANKS_WAY).map(i=>ic_wr_16bytes_data((i*(if(ICACHE_ECC) 71 else 68))+(if(ICACHE_ECC) 70 else 67),(if(ICACHE_ECC) 71 else 68)*i))
  io.ic_debug_wr_data := io.dec_tlu_ic_diag_pkt.icache_wrdata
  val ic_rd_parity_final_err = WireInit(Bool(), 0.U)
  io.ic_error_start := ((if(ICACHE_ECC)io.ic_eccerr.orR()else io.ic_parerr.orR()) & ic_act_hit_f) | ic_rd_parity_final_err
  val ic_debug_tag_val_rd_out = WireInit(Bool(), 0.U)
  val ic_debug_ict_array_sel_ff = WireInit(Bool(), 0.U)
  val ifu_ic_debug_rd_data_in = Mux(ic_debug_ict_array_sel_ff.asBool, if(ICACHE_ECC) Cat(0.U(2.W),io.ictag_debug_rd_data(25,21),0.U(32.W),io.ictag_debug_rd_data(20,0), 0.U(7-ICACHE_STATUS_BITS), way_status, 0.U(3.W),ic_debug_tag_val_rd_out)
  else Cat(0.U(6.W),io.ictag_debug_rd_data(21),0.U(32.W),io.ictag_debug_rd_data(20,0),0.U(7-ICACHE_STATUS_BITS),way_status ,0.U(3.W) ,ic_debug_tag_val_rd_out) ,
    io.ic_debug_rd_data)
  io.ifu_ic_debug_rd_data := RegNext(ifu_ic_debug_rd_data_in, 0.U)
  val ic_wr_parity = (0 until 4).map(i=>rveven_paritygen(ifu_bus_rdata_ff((16*i)+15,16*i))).reverse.reduce(Cat(_,_))
  val ic_miss_buff_parity = (0 until 4).map(i=>rveven_paritygen(ic_miss_buff_half((16*i)+15,16*i))).reverse.reduce(Cat(_,_))

  ic_wr_16bytes_data := Mux(ifu_bus_rid_ff(0).asBool,Cat(if(ICACHE_ECC)ic_wr_ecc else ic_wr_parity, ifu_bus_rdata_ff(63,0) ,  if(ICACHE_ECC)ic_miss_buff_ecc else ic_miss_buff_parity, ic_miss_buff_half(63,0)),
    Cat(if(ICACHE_ECC)ic_miss_buff_ecc else ic_miss_buff_parity, ic_miss_buff_half, if(ICACHE_ECC)ic_wr_ecc else ic_wr_parity, ifu_bus_rdata_ff))
  val bus_ifu_wr_data_error_ff = WireInit(Bool(), 0.U)
  val ifu_wr_data_comb_err_ff = WireInit(Bool(), 0.U)
  val reset_beat_cnt = WireInit(Bool(), 0.U)
  val ifu_wr_data_comb_err = bus_ifu_wr_data_error_ff
  val ifu_wr_cumulative_err = (ifu_wr_data_comb_err | ifu_wr_data_comb_err_ff) & !reset_beat_cnt
  ifu_wr_cumulative_err_data :=  ifu_wr_data_comb_err | ifu_wr_data_comb_err_ff
  ifu_wr_data_comb_err_ff := withClock(io.free_clk) {RegNext(ifu_wr_cumulative_err, 0.U)}
  val ic_crit_wd_rdy = WireInit(Bool(), 0.U)
  val ifu_byp_data_err_new = WireInit(Bool(), 0.U)
  val sel_byp_data = (ic_crit_wd_rdy | (miss_state===stream_C) | (miss_state===crit_byp_ok_C)) & !ifu_byp_data_err_new
  val sel_ic_data = !(ic_crit_wd_rdy | (miss_state===stream_C) | (miss_state===crit_byp_ok_C)) & !fetch_req_iccm_f
  val sel_iccm_data = fetch_req_iccm_f

  val ic_byp_data_only_new = WireInit(UInt(80.W), 0.U)
  val ic_final_data = Mux1H(Seq((sel_byp_data | (if(ICCM_ICACHE) (sel_iccm_data | sel_ic_data) else if(ICACHE_ONLY) sel_ic_data else 0.U)).asBool->
    (if(ICCM_ICACHE) io.ic_rd_data else ic_byp_data_only_new(63,0))))
  val ic_premux_data = if(ICCM_ICACHE) (Fill(64,sel_iccm_data) & io.iccm_rd_data) | (Fill(64, sel_byp_data) & ic_byp_data_only_new)
  else if(ICACHE_ONLY) Fill(64, sel_byp_data) & ic_byp_data_only_new else 0.U
  val ic_sel_premux_data = if(ICCM_ICACHE) sel_iccm_data | sel_byp_data else if(ICACHE_ONLY) sel_byp_data else 0.U

  val ifc_bus_acc_fault_f = ic_byp_hit_f & ifu_byp_data_err_new
  val ic_data_f = ic_final_data
  val fetch_req_f_qual = io.ic_hit_f & !io.exu_flush_final
  val ifc_region_acc_fault_memory_f = WireInit(Bool(), 0.U)
  io.ic_access_fault_f := (ifc_region_acc_fault_final_f | ifc_bus_acc_fault_f) & !io.exu_flush_final
  io.ic_access_fault_type_f := Mux(io.iccm_rd_ecc_double_err.asBool, 1.U,
    Mux(ifc_region_acc_fault_f.asBool, 2.U,
      Mux(ifc_region_acc_fault_memory_f.asBool(), 3.U, 0.U)))
  val ifu_bp_inst_mask_f = WireInit(Bool(), 0.U)
  io.ic_fetch_val_f := Cat(fetch_req_f_qual & ifu_bp_inst_mask_f & !(vaddr_f===Fill(ICACHE_BEAT_ADDR_HI,1.U)) & (err_stop_state=/=err_fetch2_C), fetch_req_f_qual)
  val two_byte_instr = ic_data_f(1,0) =/= 3.U
  //// Creating full buffer
}
object ifu_mem extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_mem_ctl()))
}

