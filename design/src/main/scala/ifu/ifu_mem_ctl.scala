package ifu
import chisel3._
import chisel3.util._
import lib._
import include._

class mem_ctl_io extends Bundle with lib{
  val free_l2clk = Input(Clock())
  val active_clk = Input(Clock())
  val exu_flush_final = Input(Bool())
  val dec_mem_ctrl = new dec_mem_ctrl
  val ifc_fetch_addr_bf = Input(UInt(31.W))
  val ifc_fetch_uncacheable_bf = Input(Bool())
  val ifc_fetch_req_bf = Input(Bool())
  val ifc_fetch_req_bf_raw = Input(Bool())
  val ifc_iccm_access_bf = Input(Bool())
  val ifc_region_acc_fault_bf = Input(Bool())
  val ifc_dma_access_ok = Input(Bool())
  val ifu_bp_hit_taken_f = Input(Bool())
  val ifu_bp_inst_mask_f = Input(Bool())
  val ifu_axi = new axi_channels(IFU_BUS_TAG)
  val ifu_bus_clk_en = Input(Bool())
  val dma_mem_ctl = new dma_mem_ctl()
  val iccm = new iccm_mem()
  val ic = new ic_mem


  val ifu_fetch_val = Input(UInt(2.W))

  val ifu_ic_mb_empty = Output(Bool())
  val ic_dma_active = Output(Bool())
  val ic_write_stall = Output(Bool())
  val iccm_dma_ecc_error = Output(Bool())
  val iccm_dma_rvalid = Output(Bool())
  val iccm_dma_rdata = Output(UInt(64.W))
  val iccm_dma_rtag = Output(UInt(3.W))
  val iccm_ready = Output(Bool())

  val dec_tlu_flush_lower_wb = Input(Bool())
  val iccm_rd_ecc_double_err = Output(UInt(2.W))
  val iccm_dma_sb_error = Output(Bool())

  val ic_hit_f = Output(Bool())
  val ic_access_fault_f = Output(UInt(2.W))
  val ic_access_fault_type_f = Output(UInt(2.W))
  val ifu_async_error_start = Output(Bool())
  val ic_fetch_val_f = Output(UInt(2.W))
  val ic_data_f = Output(UInt(32.W))
  val scan_mode = Input(Bool())
}

class ifu_mem_ctl extends Module with lib with RequireAsyncReset {
  val io = IO(new mem_ctl_io)

  val idle_C :: crit_byp_ok_C :: hit_u_miss_C :: miss_wait_C :: crit_wrd_rdy_C :: scnd_miss_C :: stream_C :: stall_scnd_miss_C :: Nil = Enum(8)
  val err_stop_idle_C :: err_fetch1_C :: err_fetch2_C :: err_stop_fetch_C :: Nil = Enum(4)
  val err_idle_C :: ic_wff_C :: ecc_wff_C :: ecc_cor_C :: dma_sb_err_C :: Nil = Enum(5)

  val iccm_single_ecc_error = WireInit(UInt(2.W), 0.U)
  val ifc_fetch_req_f = WireInit(Bool(), 0.B)
  val miss_pending = WireInit(Bool(), 0.B)
  val scnd_miss_req = WireInit(Bool(), 0.B)
  val dma_iccm_req_f = WireInit(Bool(), 0.B)
  val iccm_correct_ecc = WireInit(Bool(), 0.B)
  val perr_state = WireInit(UInt(3.W), 0.U)
  val err_stop_state = WireInit(UInt(2.W), 0.U)
  val err_stop_fetch = WireInit(Bool(), 0.B)
  val miss_state = WireInit(UInt(3.W), 0.U)
  val miss_nxtstate = WireInit(UInt(3.W), 0.U)
  val miss_state_en = WireInit(Bool(), 0.B)
  val bus_ifu_bus_clk_en = WireInit(Bool(), 0.B)
  val uncacheable_miss_ff = WireInit(Bool(), 0.B)
  val ic_act_miss_f = WireInit(Bool(), 0.B)
  val ic_byp_hit_f = WireInit(Bool(), 0.B)
  val bus_new_data_beat_count = WireInit(UInt(ICACHE_BEAT_BITS.W), 0.U)
  val bus_ifu_wr_en_ff = WireInit(Bool(), 0.B)
  val last_beat = WireInit(Bool(), 0.B)
  val last_data_recieved_ff = WireInit(Bool(), 0.B)
  val stream_eol_f = WireInit(Bool(), 0.B)
  val ic_miss_under_miss_f = WireInit(Bool(), 0.B)
  val ic_ignore_2nd_miss_f = WireInit(Bool(), 0.B)
  val ic_debug_rd_en_ff = WireInit(Bool(), 0.B)

  val debug_data_clk = rvclkhdr(clock, ic_debug_rd_en_ff, io.scan_mode)
  val flush_final_f = rvdffie(io.exu_flush_final,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_l2clk){RegNext(io.exu_flush_final, 0.U)}
  val fetch_bf_f_c1_clken = io.ifc_fetch_req_bf_raw | ifc_fetch_req_f | miss_pending | io.exu_flush_final | scnd_miss_req
  val debug_c1_clken = io.ic.debug_rd_en | io.ic.debug_wr_en
  val fetch_bf_f_c1_clk = if(RV_FPGA_OPTIMIZE) 0.B.asClock() else rvclkhdr(clock, fetch_bf_f_c1_clken, io.scan_mode)
  val debug_c1_clk      = if(RV_FPGA_OPTIMIZE) 0.B.asClock() else rvclkhdr(clock, debug_c1_clken, io.scan_mode)

  io.iccm_dma_sb_error := iccm_single_ecc_error.orR() & dma_iccm_req_f.asBool()
  io.ifu_async_error_start := io.dec_mem_ctrl.ifu_iccm_rd_ecc_single_err | io.dec_mem_ctrl.ifu_ic_error_start
  io.ic_dma_active := iccm_correct_ecc | (perr_state === dma_sb_err_C) | (err_stop_state === err_stop_fetch_C) | err_stop_fetch | io.dec_mem_ctrl.dec_tlu_flush_err_wb

  val scnd_miss_req_in = io.ifu_axi.r.valid & bus_ifu_bus_clk_en & io.ifu_axi.r.ready & (bus_new_data_beat_count.andR) &
    !uncacheable_miss_ff & ((miss_state === scnd_miss_C)|(miss_nxtstate === scnd_miss_C)) & !io.exu_flush_final

  val ifu_bp_hit_taken_q_f = io.ifu_bp_hit_taken_f & io.ic_hit_f
  ///////////////////////////////// MISS FSM /////////////////////////////////
  switch(miss_state){
    is (idle_C){ // Idle meaning there is not pending miss
      miss_nxtstate := Mux((ic_act_miss_f & !io.exu_flush_final).asBool, crit_byp_ok_C, hit_u_miss_C)
      miss_state_en := ic_act_miss_f & !io.dec_mem_ctrl.dec_tlu_force_halt}

    is (crit_byp_ok_C){ // Miss started meaning each beat is checked if, it is the critical word
      miss_nxtstate := Mux((io.dec_mem_ctrl.dec_tlu_force_halt | (ic_byp_hit_f &  (last_data_recieved_ff | (bus_ifu_wr_en_ff & last_beat)) &  uncacheable_miss_ff)).asBool, idle_C,
        Mux((ic_byp_hit_f &  !last_data_recieved_ff &  uncacheable_miss_ff).asBool, miss_wait_C,
          Mux((!ic_byp_hit_f & !io.exu_flush_final & (bus_ifu_wr_en_ff & last_beat) &  uncacheable_miss_ff).asBool, crit_wrd_rdy_C,
            Mux(((bus_ifu_wr_en_ff & last_beat) & !uncacheable_miss_ff).asBool, idle_C,
              Mux((ic_byp_hit_f & !io.exu_flush_final & !(bus_ifu_wr_en_ff & last_beat) & !ifu_bp_hit_taken_q_f & !uncacheable_miss_ff).asBool, stream_C,
                Mux((bus_ifu_wr_en_ff & !io.exu_flush_final & !(bus_ifu_wr_en_ff & last_beat) & !ifu_bp_hit_taken_q_f & !uncacheable_miss_ff).asBool, stream_C,
                  Mux((!ic_byp_hit_f  &  !io.exu_flush_final &  (bus_ifu_wr_en_ff & last_beat)       & !uncacheable_miss_ff).asBool, idle_C,
                    Mux(((io.exu_flush_final | ifu_bp_hit_taken_q_f) & !(bus_ifu_wr_en_ff & last_beat)).asBool, hit_u_miss_C, idle_C))))))))
      miss_state_en := io.dec_mem_ctrl.dec_tlu_force_halt | io.exu_flush_final | ic_byp_hit_f | ifu_bp_hit_taken_q_f | (bus_ifu_wr_en_ff & last_beat) | (bus_ifu_wr_en_ff & !uncacheable_miss_ff)
    }
    is (crit_wrd_rdy_C){ // Critical word hit but not complete, its going to be available in next cycle
      miss_nxtstate := idle_C
      miss_state_en := io.exu_flush_final | flush_final_f | ic_byp_hit_f | io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is (stream_C){ // The miss was a miss of uncacheable range
      miss_nxtstate := Mux(((io.exu_flush_final | ifu_bp_hit_taken_q_f | stream_eol_f)&(!(bus_ifu_wr_en_ff & last_beat)) & !io.dec_mem_ctrl.dec_tlu_force_halt).asBool, hit_u_miss_C, idle_C)
      miss_state_en := io.exu_flush_final | ifu_bp_hit_taken_q_f  | stream_eol_f   |  (bus_ifu_wr_en_ff & last_beat) | io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is (miss_wait_C){ // Critial word hit but the miss is not complete
      miss_nxtstate := Mux((io.exu_flush_final & !(bus_ifu_wr_en_ff & last_beat) & !io.dec_mem_ctrl.dec_tlu_force_halt).asBool, hit_u_miss_C, idle_C)
      miss_state_en := io.exu_flush_final | (bus_ifu_wr_en_ff & last_beat) | io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is (hit_u_miss_C){ // The critical word was a hit taken, or miss due to a miss predicted pc occured
      miss_nxtstate := Mux((ic_miss_under_miss_f & !(bus_ifu_wr_en_ff & last_beat) & !io.dec_mem_ctrl.dec_tlu_force_halt).asBool, scnd_miss_C,
        Mux((ic_ignore_2nd_miss_f & !(bus_ifu_wr_en_ff & last_beat) & !io.dec_mem_ctrl.dec_tlu_force_halt).asBool, stall_scnd_miss_C, idle_C))
      miss_state_en := (bus_ifu_wr_en_ff & last_beat) | ic_miss_under_miss_f | ic_ignore_2nd_miss_f | io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is (scnd_miss_C){ // Miss of the different pc occured
      miss_nxtstate := Mux(io.dec_mem_ctrl.dec_tlu_force_halt, idle_C, Mux(io.exu_flush_final,
        Mux((bus_ifu_wr_en_ff & last_beat).asBool, idle_C, hit_u_miss_C), crit_byp_ok_C))
      miss_state_en := (bus_ifu_wr_en_ff & last_beat) | io.exu_flush_final | io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is (stall_scnd_miss_C){ // Miss from the same pc occured
      miss_nxtstate := Mux(io.dec_mem_ctrl.dec_tlu_force_halt, idle_C, Mux(io.exu_flush_final,
        Mux((bus_ifu_wr_en_ff & last_beat).asBool, idle_C, hit_u_miss_C), idle_C))
      miss_state_en := (bus_ifu_wr_en_ff & last_beat) | io.exu_flush_final | io.dec_mem_ctrl.dec_tlu_force_halt
    }
  }
  miss_state := withClock(io.active_clk){RegEnable(miss_nxtstate, 0.U, miss_state_en.asBool)}
  // Calculation all the relevant signals for the miss FSM
  val crit_byp_hit_f = WireInit(Bool(), 0.U)
  val way_status_mb_scnd_ff = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val tagv_mb_scnd_ff = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
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

  val tagv_mb_scnd_in = Mux(miss_state === scnd_miss_C, tagv_mb_scnd_ff, Fill(ICACHE_NUM_WAYS, !reset_all_tags & !io.exu_flush_final) & io.ic.tag_valid)
  val uncacheable_miss_scnd_in = Mux(sel_hold_imb_scnd.asBool, uncacheable_miss_scnd_ff, io.ifc_fetch_uncacheable_bf)
  uncacheable_miss_scnd_ff := rvdff_fpga(uncacheable_miss_scnd_in,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(uncacheable_miss_scnd_in, 0.U)}
  val imb_scnd_in = Mux(sel_hold_imb_scnd.asBool, imb_scnd_ff, io.ifc_fetch_addr_bf)
  imb_scnd_ff := rvdffpcie(imb_scnd_in,fetch_bf_f_c1_clken,reset.asAsyncReset(),clock,io.scan_mode)//withClock(fetch_bf_f_c1_clk){RegNext(imb_scnd_in, 0.U)}
  way_status_mb_scnd_ff :=  rvdff_fpga(way_status_mb_scnd_in,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(way_status_mb_scnd_in, 0.U)}
  tagv_mb_scnd_ff := rvdff_fpga(tagv_mb_scnd_in,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(tagv_mb_scnd_in, 0.U)}

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
  val ic_act_hit_f = io.ic.rd_hit.orR & fetch_req_icache_f & !reset_all_tags & (!miss_pending | (miss_state===hit_u_miss_C)) & !sel_mb_addr_ff
  ic_act_miss_f := (((!io.ic.rd_hit.orR | reset_all_tags) & fetch_req_icache_f & !miss_pending) | scnd_miss_req) & !ifc_region_acc_fault_final_f
  ic_miss_under_miss_f := (!io.ic.rd_hit | reset_all_tags) & fetch_req_icache_f & (miss_state===hit_u_miss_C) &
    (imb_ff(30,ICACHE_TAG_INDEX_LO-1) =/= ifu_fetch_addr_int_f(30,ICACHE_TAG_INDEX_LO-1)) & !uncacheable_miss_ff & !sel_mb_addr_ff & !ifc_region_acc_fault_final_f
  ic_ignore_2nd_miss_f := (!io.ic.rd_hit.orR | reset_all_tags) & fetch_req_icache_f & (miss_state === hit_u_miss_C) &
    ((imb_ff(30,ICACHE_TAG_INDEX_LO-1)===ifu_fetch_addr_int_f(30,ICACHE_TAG_INDEX_LO-1))  |   uncacheable_miss_ff)
  // Output
  io.ic_hit_f := ic_act_hit_f | ic_byp_hit_f | ic_iccm_hit_f | (ifc_region_acc_fault_final_f & ifc_fetch_req_f)
  val uncacheable_miss_in = Mux(scnd_miss_req.asBool, uncacheable_miss_scnd_ff, Mux(sel_hold_imb.asBool, uncacheable_miss_ff, io.ifc_fetch_uncacheable_bf))
  val imb_in = Mux(scnd_miss_req.asBool, imb_scnd_ff, Mux(sel_hold_imb.asBool, imb_ff, io.ifc_fetch_addr_bf))
  val ifu_wr_cumulative_err_data = WireInit(Bool(), 0.U)
  val scnd_miss_index_match = (imb_ff(ICACHE_INDEX_HI-1,ICACHE_TAG_INDEX_LO-1)===imb_scnd_ff(ICACHE_INDEX_HI-1,ICACHE_TAG_INDEX_LO-1))& scnd_miss_req & !ifu_wr_cumulative_err_data
  val way_status_mb_ff = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status_rep_new = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status_mb_in = Mux((scnd_miss_req & !scnd_miss_index_match).asBool, way_status_mb_scnd_ff,
    Mux((scnd_miss_req &  scnd_miss_index_match).asBool, way_status_rep_new,
      Mux(miss_pending.asBool, way_status_mb_ff, way_status)))
  val replace_way_mb_any = Wire(Vec(ICACHE_NUM_WAYS, UInt(1.W)))
  val tagv_mb_ff = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val tagv_mb_in = Mux(scnd_miss_req.asBool, tagv_mb_scnd_ff | (Fill(ICACHE_NUM_WAYS, scnd_miss_index_match) & replace_way_mb_any.reverse.reduce(Cat(_,_))),
    Mux(miss_pending.asBool, tagv_mb_ff, io.ic.tag_valid & Fill(ICACHE_NUM_WAYS, !reset_all_tags & !io.exu_flush_final)))
  val scnd_miss_req_q = WireInit(Bool(), 0.B)
  val reset_ic_ff = WireInit(Bool(), 0.B)
  val reset_ic_in = miss_pending & !scnd_miss_req_q &  (reset_all_tags |  reset_ic_ff)
  reset_ic_ff := rvdffie(reset_ic_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(reset_ic_in, false.B)}
  val fetch_uncacheable_ff = rvdffie(io.ifc_fetch_uncacheable_bf,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(io.ifc_fetch_uncacheable_bf, 0.U)}
  ifu_fetch_addr_int_f := rvdffpcie(io.ifc_fetch_addr_bf,fetch_bf_f_c1_clken,reset.asAsyncReset(),clock,io.scan_mode) // withClock(fetch_bf_f_c1_clk){RegNext(io.ifc_fetch_addr_bf, 0.U)}
  val vaddr_f = ifu_fetch_addr_int_f(ICACHE_BEAT_ADDR_HI-1, 0)
  uncacheable_miss_ff := rvdff_fpga(uncacheable_miss_in,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(uncacheable_miss_in, 0.U)}
  imb_ff := rvdffpcie(imb_in,fetch_bf_f_c1_clken,reset.asAsyncReset(),clock,io.scan_mode)//withClock(fetch_bf_f_c1_clk){RegNext(imb_in, 0.U)}
  val miss_addr = WireInit(UInt((31-ICACHE_BEAT_ADDR_HI).W), 0.U)
  val miss_addr_in = Mux(!miss_pending, imb_ff(30, ICACHE_BEAT_ADDR_HI),
    Mux(scnd_miss_req_q.asBool, imb_scnd_ff(30, ICACHE_BEAT_ADDR_HI), miss_addr))
  val busclk_reset = if(RV_FPGA_OPTIMIZE) 0.B.asClock() else rvclkhdr(clock, bus_ifu_bus_clk_en | ic_act_miss_f | io.dec_mem_ctrl.dec_tlu_force_halt, io.scan_mode)

  miss_addr := rvdfflie_UInt(miss_addr_in,clock,reset.asAsyncReset(),bus_ifu_bus_clk_en | ic_act_miss_f | io.dec_mem_ctrl.dec_tlu_force_halt,io.scan_mode)//withClock(busclk_reset) {RegNext(miss_addr_in, 0.U)}
  way_status_mb_ff := rvdff_fpga(way_status_mb_in,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(way_status_mb_in, 0.U)}
  tagv_mb_ff := rvdff_fpga(tagv_mb_in,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(tagv_mb_in, 0.U)}
  val stream_miss_f = WireInit(Bool(), 0.U)
  val ifc_fetch_req_qual_bf  = io.ifc_fetch_req_bf  & !((miss_state===crit_wrd_rdy_C) & flush_final_f) & !stream_miss_f
  val ifc_fetch_req_f_raw = rvdffie(ifc_fetch_req_qual_bf,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ifc_fetch_req_qual_bf, 0.U)}
  ifc_fetch_req_f := ifc_fetch_req_f_raw & !io.exu_flush_final
  ifc_iccm_access_f := rvdff_fpga(io.ifc_iccm_access_bf,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(io.ifc_iccm_access_bf, 0.U)}
  val ifc_region_acc_fault_final_bf = WireInit(Bool(), 0.U)
  ifc_region_acc_fault_final_f := rvdff_fpga(ifc_region_acc_fault_final_bf,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)// withClock(fetch_bf_f_c1_clk){RegNext(ifc_region_acc_fault_final_bf, 0.U)}
  val ifc_region_acc_fault_f = rvdff_fpga(io.ifc_region_acc_fault_bf,fetch_bf_f_c1_clk,fetch_bf_f_c1_clken,clock)//withClock(fetch_bf_f_c1_clk){RegNext(io.ifc_region_acc_fault_bf, 0.U)}
  val ifu_ic_req_addr_f = Cat(miss_addr, ic_req_addr_bits_hi_3)
  io.ifu_ic_mb_empty := (((miss_state===hit_u_miss_C) | (miss_state===stream_C)) & !(bus_ifu_wr_en_ff & last_beat)) | !miss_pending
  io.dec_mem_ctrl.ifu_miss_state_idle := miss_state === idle_C
  val write_ic_16_bytes = WireInit(Bool(), 0.B)
  val reset_tag_valid_for_miss = WireInit(Bool(), 0.B)
  val sel_mb_addr = (miss_pending & write_ic_16_bytes & !uncacheable_miss_ff) | reset_tag_valid_for_miss
  io.ic.rw_addr := Mux1H(Seq(sel_mb_addr -> Cat(imb_ff(30,ICACHE_BEAT_ADDR_HI) , ic_wr_addr_bits_hi_3 , imb_ff(1,0)),
    !sel_mb_addr -> io.ifc_fetch_addr_bf))
  val bus_ifu_wr_en_ff_q = WireInit(Bool(), 0.B)
  val sel_mb_status_addr = (miss_pending & write_ic_16_bytes & !uncacheable_miss_ff & last_beat & bus_ifu_wr_en_ff_q) | reset_tag_valid_for_miss
  val ifu_status_wr_addr = Mux(sel_mb_status_addr, Cat(imb_ff(30, ICACHE_BEAT_ADDR_HI),ic_wr_addr_bits_hi_3, imb_ff(1,0)), ifu_fetch_addr_int_f)
  sel_mb_addr_ff := rvdffie(sel_mb_addr,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(sel_mb_addr, 0.U)}
  val ifu_bus_rdata_ff = rvdffe(io.ifu_axi.r.bits.data,io.ifu_bus_clk_en & io.ifu_axi.r.valid,clock,io.scan_mode)
  val ic_miss_buff_half = WireInit(UInt(64.W), 0.U)

  // Ecc of the read data from the AXI
  val ic_wr_ecc = rvecc_encode_64(ifu_bus_rdata_ff)
  val ic_miss_buff_ecc = rvecc_encode_64(ic_miss_buff_half)
  val ic_wr_16bytes_data = WireInit(UInt((ICACHE_BANKS_WAY * (if(ICACHE_ECC) 71 else 68)).W), 0.U)
  io.ic.wr_data := (0 until ICACHE_BANKS_WAY).map(i=>ic_wr_16bytes_data((i*(if(ICACHE_ECC) 71 else 68))+(if(ICACHE_ECC) 70 else 67),(if(ICACHE_ECC) 71 else 68)*i))
  io.ic.debug_wr_data := io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_wrdata
  val ic_rd_parity_final_err = WireInit(Bool(), 0.U)
  io.dec_mem_ctrl.ifu_ic_error_start := ((if(ICACHE_ECC)io.ic.eccerr.orR()else io.ic.parerr.orR()) & ic_act_hit_f) | ic_rd_parity_final_err
  val ic_debug_tag_val_rd_out = WireInit(Bool(), 0.U)
  val ic_debug_ict_array_sel_ff = WireInit(Bool(), 0.U)

  val ifu_ic_debug_rd_data_in = Mux(ic_debug_ict_array_sel_ff.asBool, if(ICACHE_ECC) Cat(0.U(2.W),io.ic.tag_debug_rd_data(25,21),0.U(32.W),io.ic.tag_debug_rd_data(20,0), 0.U((7-ICACHE_STATUS_BITS).W), way_status, 0.U(3.W),ic_debug_tag_val_rd_out)
  else Cat(0.U(6.W),io.ic.tag_debug_rd_data(21),0.U(32.W),io.ic.tag_debug_rd_data(20,0),0.U(7-ICACHE_STATUS_BITS),way_status ,0.U(3.W) ,ic_debug_tag_val_rd_out) ,
    io.ic.debug_rd_data)

  io.dec_mem_ctrl.ifu_ic_debug_rd_data := rvdffe(ifu_ic_debug_rd_data_in,ic_debug_rd_en_ff,clock,io.scan_mode)//withClock(debug_data_clk){RegNext(ifu_ic_debug_rd_data_in, 0.U)}
  val ic_wr_parity = (0 until 4).map(i=>rveven_paritygen(ifu_bus_rdata_ff((16*i)+15,16*i))).reverse.reduce(Cat(_,_))
  val ic_miss_buff_parity = (0 until 4).map(i=>rveven_paritygen(ic_miss_buff_half((16*i)+15,16*i))).reverse.reduce(Cat(_,_))

  ic_wr_16bytes_data := Mux(ifu_bus_rid_ff(0).asBool,Cat(if(ICACHE_ECC)ic_wr_ecc else ic_wr_parity, ifu_bus_rdata_ff,  if(ICACHE_ECC)ic_miss_buff_ecc else ic_miss_buff_parity, ic_miss_buff_half),
    Cat(if(ICACHE_ECC)ic_miss_buff_ecc else ic_miss_buff_parity, ic_miss_buff_half, if(ICACHE_ECC)ic_wr_ecc else ic_wr_parity, ifu_bus_rdata_ff))

  val bus_ifu_wr_data_error_ff = WireInit(Bool(), 0.U)
  val ifu_wr_data_comb_err_ff = WireInit(Bool(), 0.U)
  val reset_beat_cnt = WireInit(Bool(), 0.U)
  val ifu_wr_cumulative_err = (bus_ifu_wr_data_error_ff | ifu_wr_data_comb_err_ff) & !reset_beat_cnt
  ifu_wr_cumulative_err_data :=  bus_ifu_wr_data_error_ff | ifu_wr_data_comb_err_ff
  ifu_wr_data_comb_err_ff := rvdffie(ifu_wr_cumulative_err,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk) {RegNext(ifu_wr_cumulative_err, 0.U)}
  val ic_crit_wd_rdy = WireInit(Bool(), 0.U)
  val ifu_byp_data_err_f = WireInit(UInt(2.W), 0.U)
  val sel_byp_data = (ic_crit_wd_rdy | (miss_state===stream_C) | (miss_state===crit_byp_ok_C))
  val sel_ic_data = !(ic_crit_wd_rdy | (miss_state===stream_C) | (miss_state===crit_byp_ok_C) | (miss_state === miss_wait_C)) & !fetch_req_iccm_f & !ifc_region_acc_fault_final_f

  val ic_byp_data_only_new = WireInit(UInt(80.W), 0.U)

  val ic_final_data = if(ICCM_ICACHE) Fill(64, sel_byp_data | fetch_req_iccm_f | sel_ic_data) & io.ic.rd_data else
    if (ICCM_ONLY) (Fill(64, sel_byp_data) & ic_byp_data_only_new) | (Fill(64, fetch_req_iccm_f) & io.iccm.rd_data) else
      if (ICACHE_ONLY) Fill(64, sel_byp_data | sel_ic_data) & io.ic.rd_data else
        if (NO_ICCM_NO_ICACHE) Fill(64, sel_byp_data) & ic_byp_data_only_new else 0.U
  val ic_premux_data_temp = if(ICCM_ICACHE) (Fill(64,fetch_req_iccm_f) & io.iccm.rd_data) | (Fill(64, sel_byp_data) & ic_byp_data_only_new)
  else if(ICACHE_ONLY) Fill(64, sel_byp_data) & ic_byp_data_only_new else 0.U
  val ic_sel_premux_data_temp = if(ICCM_ICACHE) fetch_req_iccm_f | sel_byp_data else if(ICACHE_ONLY) sel_byp_data else 0.U
  io.ic.premux_data := ic_premux_data_temp
  io.ic.sel_premux_data := ic_sel_premux_data_temp
  val ifc_bus_acc_fault_f = Fill(2,ic_byp_hit_f) & ifu_byp_data_err_f
  io.ic_data_f := ic_final_data
  val fetch_req_f_qual = io.ic_hit_f & !io.exu_flush_final
  val ifc_region_acc_fault_memory_f = WireInit(Bool(), 0.U)
  io.ic_access_fault_f := (Fill(2,ifc_region_acc_fault_final_f) | ifc_bus_acc_fault_f) & Fill(2,!io.exu_flush_final)
  io.ic_access_fault_type_f := Mux(io.iccm_rd_ecc_double_err.orR, 1.U, Mux(ifc_region_acc_fault_f, 2.U, Mux(ifc_region_acc_fault_memory_f, 3.U, 0.U)))

  io.ic_fetch_val_f := Cat(fetch_req_f_qual & io.ifu_bp_inst_mask_f & !(vaddr_f===Fill(ICACHE_BEAT_ADDR_HI,1.U)) & (err_stop_state=/=err_fetch2_C), fetch_req_f_qual)
  val two_byte_instr = io.ic_data_f(1,0) =/= 3.U
  //// Creating full buffer
  val ic_miss_buff_data_in = io.ifu_axi.r.bits.data
  val bus_ifu_wr_en = WireInit(Bool(), 0.B)
  val write_fill_data = (0 until ICACHE_NUM_BEATS).map(i=>bus_ifu_wr_en & (io.ifu_axi.r.bits.id===i.U))
  val ic_miss_buff_data = Wire(Vec(2*ICACHE_NUM_BEATS, UInt(32.W)))
  for(i<- 0 until ICACHE_NUM_BEATS) {
    //val wr_data_c1_clk = write_fill_data.map(rvclkhdr(clock, _ , io.scan_mode))
    ic_miss_buff_data(2 * i) := rvdffe(ic_miss_buff_data_in(31, 0), write_fill_data(i), clock, io.scan_mode) //withClock(wr_data_c1_clk(i)){RegNext(ic_miss_buff_data_in(31,0), 0.U)}
    ic_miss_buff_data(2 * i + 1) := rvdffe(ic_miss_buff_data_in(63, 32), write_fill_data(i), clock, io.scan_mode) //withClock(wr_data_c1_clk(i)){RegNext(ic_miss_buff_data_in(63,32), 0.U)}}
  }
  val ic_miss_buff_data_valid = WireInit(UInt(ICACHE_NUM_BEATS.W), 0.U)
  val ic_miss_buff_data_valid_in = (0 until ICACHE_NUM_BEATS).map(i=>write_fill_data(i)|(ic_miss_buff_data_valid(i)&(!ic_act_miss_f)))
  ic_miss_buff_data_valid := withClock(io.active_clk){RegNext(ic_miss_buff_data_valid_in.map(i=>i.asUInt()).reverse.reduce(Cat(_,_)), 0.U)}
  val bus_ifu_wr_data_error = WireInit(Bool(), 0.U)
  val ic_miss_buff_data_error = WireInit(UInt(ICACHE_NUM_BEATS.W), 0.U)
  val ic_miss_buff_data_error_in =(0 until ICACHE_NUM_BEATS).map(i=>Mux(write_fill_data(i).asBool,bus_ifu_wr_data_error,
    ic_miss_buff_data_error(i) & !ic_act_miss_f))
  ic_miss_buff_data_error := withClock(io.active_clk){RegNext(ic_miss_buff_data_error_in.reverse.reduce(Cat(_,_)), 0.U)}

  // New Bypass ready
  val bypass_index = imb_ff(ICACHE_BEAT_ADDR_HI-1, 0)
  val bypass_index_5_3_inc = bypass_index(bypass_index.getWidth-1,2) + 1.U
  val bypass_valid_value_check = Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(bypass_index(bypass_index.getWidth-1,2)===i.U).asBool->ic_miss_buff_data_valid_in(i)))
  val bypass_data_ready_in = (bypass_valid_value_check & !bypass_index(1) & !bypass_index(0)) |
    (bypass_valid_value_check & !bypass_index(1) & bypass_index(0)) |
    (bypass_valid_value_check & bypass_index(1) & !bypass_index(0)) |
    (bypass_valid_value_check & bypass_index(1) & bypass_index(0) & Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(bypass_index_5_3_inc===i.U).asBool->ic_miss_buff_data_valid_in(i)))) |
    (bypass_valid_value_check & bypass_index(ICACHE_BEAT_ADDR_HI-1,2)===Fill(ICACHE_BEAT_ADDR_HI,1.U))


  val ic_crit_wd_rdy_new_ff = WireInit(Bool(), 0.U)
  val ic_crit_wd_rdy_new_in = (bypass_data_ready_in & crit_wd_byp_ok_ff &  uncacheable_miss_ff & !io.exu_flush_final & !ifu_bp_hit_taken_q_f) |
    (                       crit_wd_byp_ok_ff & !uncacheable_miss_ff & !io.exu_flush_final & !ifu_bp_hit_taken_q_f) |
    (ic_crit_wd_rdy_new_ff & crit_wd_byp_ok_ff & !fetch_req_icache_f & !io.exu_flush_final)
  ic_crit_wd_rdy_new_ff := rvdffie(ic_crit_wd_rdy_new_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(ic_crit_wd_rdy_new_in, 0.U)}
  val byp_fetch_index = ifu_fetch_addr_int_f(ICACHE_BEAT_ADDR_HI-1,0)
  val byp_fetch_index_0 = Cat(ifu_fetch_addr_int_f(ICACHE_BEAT_ADDR_HI-1,2), 0.U)
  val byp_fetch_index_1 = Cat(ifu_fetch_addr_int_f(ICACHE_BEAT_ADDR_HI-1,2), 1.U)
  val byp_fetch_index_inc = ifu_fetch_addr_int_f(ICACHE_BEAT_ADDR_HI-1,2) + 1.U
  val byp_fetch_index_inc_0 = Cat(byp_fetch_index_inc, 0.U)
  val byp_fetch_index_inc_1 = Cat(byp_fetch_index_inc, 1.U)
  val ic_miss_buff_data_error_bypass = Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(bypass_index(ICACHE_BEAT_ADDR_HI-1,2)===i.U).asBool->ic_miss_buff_data_error(i)))
  val ic_miss_buff_data_error_bypass_inc = Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_inc===i.U).asBool->ic_miss_buff_data_error(i)))
  val miss_wrap_f = WireInit(Bool(),0.B)
  ifu_byp_data_err_f  :=   Mux(ic_miss_buff_data_error(byp_fetch_index(ICACHE_BEAT_ADDR_HI-1,2) ) , 3.U,
    Mux((ifu_fetch_addr_int_f(1) &  ifu_fetch_addr_int_f(0) & ~(ic_miss_buff_data_error(byp_fetch_index(ICACHE_BEAT_ADDR_HI-1,2))) &
      (~miss_wrap_f & ic_miss_buff_data_error(byp_fetch_index_inc))), 2.U, 0.U))

  val ic_byp_data_only_pre_new = Mux(!ifu_fetch_addr_int_f(1).asBool,
    Cat(Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_inc_0===i.U).asBool->ic_miss_buff_data(i)(15,0))), Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_1===i.U).asBool->ic_miss_buff_data(i)(31,0))), Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_0===i.U).asBool->ic_miss_buff_data(i)(31,0)))),
    Cat(Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_inc_1===i.U).asBool->ic_miss_buff_data(i)(15,0))), Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_inc_0===i.U).asBool->ic_miss_buff_data(i)(31,0))), Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_1===i.U).asBool->ic_miss_buff_data(i)(31,0)))))

  ic_byp_data_only_new := Mux(!ifu_fetch_addr_int_f(0).asBool(),ic_byp_data_only_pre_new,Cat(0.U(16.W),ic_byp_data_only_pre_new(79,16)))

  miss_wrap_f := imb_ff(ICACHE_TAG_INDEX_LO-1) =/= ifu_fetch_addr_int_f(ICACHE_TAG_INDEX_LO-1)
  val ic_miss_buff_data_valid_bypass_index = Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(byp_fetch_index(ICACHE_BEAT_ADDR_HI-1,2)===i.U).asBool->ic_miss_buff_data_valid(i)))
  val ic_miss_buff_data_valid_inc_bypass_index = Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(byp_fetch_index_inc===i.U).asBool->ic_miss_buff_data_valid(i)))
  val miss_buff_hit_unq_f = (ic_miss_buff_data_valid_bypass_index & !byp_fetch_index(1) & !byp_fetch_index(0)) |
    (ic_miss_buff_data_valid_bypass_index & !byp_fetch_index(1) &  byp_fetch_index(0)) |
    (ic_miss_buff_data_valid_bypass_index &  byp_fetch_index(1) & !byp_fetch_index(0)) |
    (ic_miss_buff_data_valid_bypass_index &  byp_fetch_index(1) &  byp_fetch_index(0) & ic_miss_buff_data_valid_inc_bypass_index) |
    (ic_miss_buff_data_valid_bypass_index & (byp_fetch_index(ICACHE_BEAT_ADDR_HI-1,2) === Fill(ICACHE_BEAT_BITS,1.U)))

  stream_hit_f := (miss_state===stream_C) & (miss_buff_hit_unq_f & !miss_wrap_f)
  stream_miss_f := (miss_state===stream_C) & !(miss_buff_hit_unq_f & !miss_wrap_f) & ifc_fetch_req_f
  stream_eol_f := (byp_fetch_index(ICACHE_BEAT_ADDR_HI-1,1)===Fill(ICACHE_BEAT_BITS+1, 1.U)) & ifc_fetch_req_f & stream_hit_f
  crit_byp_hit_f := miss_buff_hit_unq_f & ((miss_state===crit_wrd_rdy_C) | (miss_state===crit_byp_ok_C))


  val other_tag = Cat(ifu_bus_rid_ff(IFU_BUS_TAG-1,1),!ifu_bus_rid_ff(0))
  val second_half_available = Mux1H((0 until ICACHE_NUM_BEATS).map(i=>(other_tag===i.U).asBool->ic_miss_buff_data_valid(i)))
  write_ic_16_bytes := second_half_available & bus_ifu_wr_en_ff
  ic_miss_buff_half := Cat(Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(Cat(other_tag,1.U)===i.U).asBool->ic_miss_buff_data(i))),
    Mux1H((0 until 2*ICACHE_NUM_BEATS).map(i=>(Cat(other_tag,0.U)===i.U).asBool->ic_miss_buff_data(i))))

  // Parity check for the I$ logic
  ic_rd_parity_final_err := io.ic.tag_perr & !io.exu_flush_final & sel_ic_data & !(ifc_region_acc_fault_final_f | (ifc_bus_acc_fault_f.orR)) &
    (fetch_req_icache_f & !reset_all_tags & (!miss_pending | (miss_state===hit_u_miss_C)) & !sel_mb_addr_ff);

  val ifu_ic_rw_int_addr_ff = WireInit(UInt((ICACHE_INDEX_HI-ICACHE_TAG_INDEX_LO+1).W), 0.U)

  val perr_sb_write_status = WireInit(Bool(), 0.B)
  val perr_ic_index_ff = rvdffe(ifu_ic_rw_int_addr_ff,perr_sb_write_status,clock,io.scan_mode)//withClock(io.active_clk){RegEnable(ifu_ic_rw_int_addr_ff, 0.U, perr_sb_write_status)}
  val perr_sel_invalidate = WireInit(Bool(), 0.B)
  val perr_err_inv_way = Fill(ICACHE_NUM_WAYS, perr_sel_invalidate)
  iccm_correct_ecc := perr_state === ecc_cor_C
  val dma_sb_err_state_ff = rvdffie(perr_state === dma_sb_err_C,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)
  io.iccm.buf_correct_ecc := iccm_correct_ecc & !dma_sb_err_state_ff

  ///////////////////////////////// PARITY ERROR FSM /////////////////////////////////
  val perr_nxtstate = WireInit(UInt(3.W), 0.U)
  val perr_state_en = WireInit(Bool(), 0.B)
  val iccm_error_start = if(ICCM_ENABLE)  io.dec_mem_ctrl.ifu_iccm_rd_ecc_single_err else 0.U
  switch(perr_state){
    is(err_idle_C){
      perr_nxtstate := Mux(io.iccm_dma_sb_error, dma_sb_err_C, Mux((io.dec_mem_ctrl.ifu_ic_error_start & !io.exu_flush_final).asBool, ic_wff_C, ecc_wff_C))
      perr_state_en := (((iccm_error_start | io.dec_mem_ctrl.ifu_ic_error_start) & !io.exu_flush_final) | io.iccm_dma_sb_error) & !io.dec_mem_ctrl.dec_tlu_force_halt
      perr_sb_write_status := perr_state_en
    }
    is(ic_wff_C){
      perr_nxtstate := err_idle_C
      perr_state_en := io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_force_halt
      perr_sel_invalidate := io.dec_tlu_flush_lower_wb & io.dec_mem_ctrl.dec_tlu_flush_err_wb
    }
    is(ecc_wff_C){
      perr_nxtstate := Mux(((!io.dec_mem_ctrl.dec_tlu_flush_err_wb & io.dec_tlu_flush_lower_wb ) | io.dec_mem_ctrl.dec_tlu_force_halt).asBool(), err_idle_C, ecc_cor_C)
      perr_state_en := io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is(dma_sb_err_C){
      perr_nxtstate := Mux(io.dec_mem_ctrl.dec_tlu_force_halt, err_idle_C, ecc_cor_C)
      perr_state_en := 1.B
    }
    is(ecc_cor_C){
      perr_nxtstate := err_idle_C
      perr_state_en := 1.B
    }
  }
  perr_state := withClock(io.active_clk){RegEnable(perr_nxtstate, 0.U, perr_state_en)}
  ///////////////////////////////// STOP FETCH FSM /////////////////////////////////
  val err_stop_nxtstate = WireInit(UInt(2.W), 0.U)
  val err_stop_state_en = WireInit(Bool(), 0.B)
  io.iccm.correction_state := 0.B
  switch(err_stop_state){
    is(err_stop_idle_C){
      err_stop_nxtstate := err_fetch1_C
      err_stop_state_en := io.dec_mem_ctrl.dec_tlu_flush_err_wb & (perr_state === ecc_wff_C) & !io.dec_mem_ctrl.dec_tlu_force_halt
    }
    is(err_fetch1_C){
      err_stop_nxtstate := Mux((io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt | io.dec_mem_ctrl.dec_tlu_force_halt).asBool(), err_stop_idle_C,
        Mux(((io.ifu_fetch_val===3.U)|(io.ifu_fetch_val(0)&two_byte_instr)).asBool(), err_stop_fetch_C,
          Mux(io.ifu_fetch_val(0).asBool(), err_fetch2_C, err_fetch1_C)))
      err_stop_state_en := io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt | io.ifu_fetch_val(0) | ifu_bp_hit_taken_q_f | io.dec_mem_ctrl.dec_tlu_force_halt
      err_stop_fetch := ((io.ifu_fetch_val(1,0)===3.U) | (io.ifu_fetch_val(0) & two_byte_instr))  & !(io.exu_flush_final | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt)
      io.iccm.correction_state := 1.B
    }
    is(err_fetch2_C){
      err_stop_nxtstate := Mux((io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt | io.dec_mem_ctrl.dec_tlu_force_halt).asBool,
        err_stop_idle_C, Mux(io.ifu_fetch_val(0).asBool, err_stop_fetch_C, err_fetch2_C))
      err_stop_state_en := io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt | io.ifu_fetch_val(0) | io.dec_mem_ctrl.dec_tlu_force_halt
      err_stop_fetch := io.ifu_fetch_val(0) & !io.exu_flush_final & !io.dec_mem_ctrl.dec_tlu_i0_commit_cmt
      io.iccm.correction_state := 1.B
    }
    is(err_stop_fetch_C){
      err_stop_nxtstate := Mux(((io.dec_tlu_flush_lower_wb & !io.dec_mem_ctrl.dec_tlu_flush_err_wb) | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt | io.dec_mem_ctrl.dec_tlu_force_halt).asBool,
        err_stop_idle_C, Mux(io.dec_mem_ctrl.dec_tlu_flush_err_wb.asBool(), err_fetch1_C, err_stop_fetch_C))
      err_stop_state_en := io.dec_tlu_flush_lower_wb | io.dec_mem_ctrl.dec_tlu_i0_commit_cmt | io.dec_mem_ctrl.dec_tlu_force_halt
      err_stop_fetch := 1.B
      io.iccm.correction_state := 1.B
    }
  }
  err_stop_state := withClock(io.active_clk){RegEnable(err_stop_nxtstate, 0.U, err_stop_state_en)}
  bus_ifu_bus_clk_en := io.ifu_bus_clk_en

  val busclk = if(RV_FPGA_OPTIMIZE) 0.B.asClock() else rvclkhdr(clock, bus_ifu_bus_clk_en, io.scan_mode)
  val busclk_force = if(RV_FPGA_OPTIMIZE) 0.B.asClock() else rvclkhdr(clock, bus_ifu_bus_clk_en | io.dec_mem_ctrl.dec_tlu_force_halt , io.scan_mode)



  val bus_ifu_bus_clk_en_ff = rvdffie(bus_ifu_bus_clk_en,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(bus_ifu_bus_clk_en, 0.U)}
  scnd_miss_req_q := rvdffie(scnd_miss_req_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(scnd_miss_req_in, 0.U)}
  scnd_miss_req := scnd_miss_req_q & (!io.exu_flush_final)
  val bus_cmd_req_hold = WireInit(Bool(), 0.B)
  val ifu_bus_cmd_valid = WireInit(Bool(), 0.B)
  val bus_cmd_beat_count = WireInit(UInt(ICACHE_BEAT_BITS.W), 0.U)
  val ifc_bus_ic_req_ff_in = (ic_act_miss_f | bus_cmd_req_hold | ifu_bus_cmd_valid) & !io.dec_mem_ctrl.dec_tlu_force_halt & !((bus_cmd_beat_count===Fill(ICACHE_BEAT_BITS,1.U)) & ifu_bus_cmd_valid & io.ifu_axi.ar.ready & miss_pending)
  ifu_bus_cmd_valid := rvdff_fpga(ifc_bus_ic_req_ff_in,busclk_force,bus_ifu_bus_clk_en | io.dec_mem_ctrl.dec_tlu_force_halt,clock)//withClock(busclk_force){RegNext(ifc_bus_ic_req_ff_in, 0.U)}
  val bus_cmd_sent = WireInit(Bool(), 0.B)
  val bus_cmd_req_in = (ic_act_miss_f | bus_cmd_req_hold) & !bus_cmd_sent & !io.dec_mem_ctrl.dec_tlu_force_halt
  bus_cmd_req_hold := rvdffie(bus_cmd_req_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(bus_cmd_req_in, false.B)}
  // AXI Read-Channel
  io.ifu_axi <> 0.U.asTypeOf(io.ifu_axi)
  io.ifu_axi.ar.bits.prot := 5.U
  io.ifu_axi.ar.valid := ifu_bus_cmd_valid
  io.ifu_axi.ar.bits.id := bus_rd_addr_count & Fill(IFU_BUS_TAG, ifu_bus_cmd_valid)
  io.ifu_axi.ar.bits.addr := Cat(ifu_ic_req_addr_f, 0.U(3.W)) & Fill(32, ifu_bus_cmd_valid)
  io.ifu_axi.ar.bits.size := 3.U
  io.ifu_axi.ar.bits.cache := 15.U
  io.ifu_axi.ar.bits.region := ifu_ic_req_addr_f(28,25)
  io.ifu_axi.ar.bits.burst := 1.U
  io.ifu_axi.r.ready := 1.B

  val ifu_bus_arready_unq_ff = rvdff_fpga(io.ifu_axi.ar.ready,busclk,bus_ifu_bus_clk_en,clock)//withClock(busclk){RegNext(io.ifu_axi.ar.ready, false.B)}
  val ifu_bus_rvalid_unq_ff  = rvdff_fpga(io.ifu_axi.r.valid,busclk,bus_ifu_bus_clk_en,clock)//withClock(busclk){RegNext(io.ifu_axi.r.valid, false.B)}
  val ifu_bus_arvalid_ff     = rvdff_fpga(io.ifu_axi.ar.valid,busclk,bus_ifu_bus_clk_en,clock)//withClock(busclk){RegNext(io.ifu_axi.ar.valid, false.B)}
  val ifu_bus_rresp_ff       = rvdff_fpga(io.ifu_axi.r.bits.resp,busclk,bus_ifu_bus_clk_en,clock)//withClock(busclk){RegNext(io.ifu_axi.r.bits.resp, 0.U)}
  //withClock(busclk){RegNext(io.ifu_axi.r.bits.data, 0.U)}
  ifu_bus_rid_ff := rvdff_fpga(io.ifu_axi.r.bits.id,busclk,bus_ifu_bus_clk_en,clock)//withClock(busclk){RegNext(io.ifu_axi.r.bits.id, 0.U)}
  val ifu_bus_rvalid = io.ifu_axi.r.valid & bus_ifu_bus_clk_en
  val ifu_bus_arready = io.ifu_axi.ar.ready & bus_ifu_bus_clk_en
  val ifu_bus_arready_ff = ifu_bus_arready_unq_ff & bus_ifu_bus_clk_en_ff
  val ifu_bus_rvalid_ff = ifu_bus_rvalid_unq_ff & bus_ifu_bus_clk_en_ff
  // Write signals to write to the bus
  bus_cmd_sent := io.ifu_axi.ar.valid & ifu_bus_arready & miss_pending & !io.dec_mem_ctrl.dec_tlu_force_halt
  val bus_last_data_beat = WireInit(Bool(), 0.B)
  val bus_inc_data_beat_cnt = bus_ifu_wr_en_ff & !bus_last_data_beat & !io.dec_mem_ctrl.dec_tlu_force_halt
  val bus_reset_data_beat_cnt =  ic_act_miss_f | (bus_ifu_wr_en_ff &  bus_last_data_beat) | io.dec_mem_ctrl.dec_tlu_force_halt
  val bus_hold_data_beat_cnt = !bus_inc_data_beat_cnt & !bus_reset_data_beat_cnt
  val bus_data_beat_count = WireInit(UInt(ICACHE_BEAT_BITS.W), 0.U)
  bus_new_data_beat_count := Mux1H(Seq(bus_reset_data_beat_cnt->0.U, bus_inc_data_beat_cnt-> (bus_data_beat_count + 1.U), bus_hold_data_beat_cnt->bus_data_beat_count))
  bus_data_beat_count := rvdffie(bus_new_data_beat_count,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(bus_new_data_beat_count, 0.U)}
  val last_data_recieved_in = (bus_ifu_wr_en_ff &  bus_last_data_beat & !scnd_miss_req) | (last_data_recieved_ff & !ic_act_miss_f)
  last_data_recieved_ff := rvdffie(last_data_recieved_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(last_data_recieved_in, 0.U)}
  // Request Address Count
  val bus_new_rd_addr_count = Mux(!miss_pending, imb_ff(ICACHE_BEAT_ADDR_HI-1, 2),
    Mux(scnd_miss_req_q, imb_scnd_ff(ICACHE_BEAT_ADDR_HI-1, 2),
      Mux(bus_cmd_sent, bus_rd_addr_count + 1.U, bus_rd_addr_count)))
  bus_rd_addr_count := rvdff_fpga(bus_new_rd_addr_count,busclk_reset,bus_ifu_bus_clk_en | ic_act_miss_f | io.dec_mem_ctrl.dec_tlu_force_halt,clock)//withClock(busclk_reset){RegNext(bus_new_rd_addr_count, 0.U)}
  // Command beat Count
  val bus_inc_cmd_beat_cnt = ifu_bus_cmd_valid & io.ifu_axi.ar.ready & miss_pending & !io.dec_mem_ctrl.dec_tlu_force_halt
  val bus_reset_cmd_beat_cnt_0 = (ic_act_miss_f & !uncacheable_miss_in) | io.dec_mem_ctrl.dec_tlu_force_halt
  val bus_reset_cmd_beat_cnt_secondlast = ic_act_miss_f & uncacheable_miss_in
  val bus_hold_cmd_beat_cnt = !bus_inc_cmd_beat_cnt & !(ic_act_miss_f | scnd_miss_req | io.dec_mem_ctrl.dec_tlu_force_halt)
  val bus_cmd_beat_en = bus_inc_cmd_beat_cnt | ic_act_miss_f | io.dec_mem_ctrl.dec_tlu_force_halt
  val bus_new_cmd_beat_count = Mux1H(Seq(bus_reset_cmd_beat_cnt_0->0.U, bus_reset_cmd_beat_cnt_secondlast.asBool->ICACHE_SCND_LAST.U,
    bus_inc_cmd_beat_cnt->(bus_cmd_beat_count+1.U), bus_hold_cmd_beat_cnt->bus_cmd_beat_count))
  bus_cmd_beat_count := rvdffs_fpga(bus_new_cmd_beat_count,bus_cmd_beat_en,busclk_reset,bus_ifu_bus_clk_en | ic_act_miss_f | io.dec_mem_ctrl.dec_tlu_force_halt,clock)//withClock(busclk_reset){RegEnable(bus_new_cmd_beat_count, 0.U, bus_cmd_beat_en)}
  bus_last_data_beat := Mux(uncacheable_miss_ff, bus_data_beat_count===1.U, bus_data_beat_count.andR())
  bus_ifu_wr_en := ifu_bus_rvalid & miss_pending
  bus_ifu_wr_en_ff := ifu_bus_rvalid_ff & miss_pending
  bus_ifu_wr_en_ff_q := ifu_bus_rvalid_ff  & miss_pending & !uncacheable_miss_ff & !(ifu_bus_rresp_ff.orR) & write_ic_16_bytes
  val bus_ifu_wr_en_ff_wo_err = ifu_bus_rvalid_ff & miss_pending & !uncacheable_miss_ff
  val ic_act_miss_f_delayed = rvdffie(ic_act_miss_f,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(ic_act_miss_f, false.B)}
  reset_tag_valid_for_miss := ic_act_miss_f_delayed & (miss_state===crit_byp_ok_C) & !uncacheable_miss_ff
  bus_ifu_wr_data_error := io.ifu_axi.r.bits.resp.orR() & ifu_bus_rvalid  & miss_pending
  bus_ifu_wr_data_error_ff := ifu_bus_rresp_ff.orR & ifu_bus_rvalid_ff  & miss_pending
  val ifc_dma_access_ok_d = io.ifc_dma_access_ok &  !iccm_correct_ecc & !io.iccm_dma_sb_error
  val ifc_dma_access_ok_prev = rvdffie(ifc_dma_access_ok_d,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(ifc_dma_access_ok_d, false.B)}
  ic_crit_wd_rdy := ic_crit_wd_rdy_new_in | ic_crit_wd_rdy_new_ff
  last_beat := bus_last_data_beat & bus_ifu_wr_en_ff
  reset_beat_cnt := bus_reset_data_beat_cnt
  // DMA

  io.iccm_ready  := io.ifc_dma_access_ok &  !iccm_correct_ecc & ifc_dma_access_ok_prev &  (perr_state===err_idle_C)  & !io.iccm_dma_sb_error
  dma_iccm_req_f := rvdffie(io.dma_mem_ctl.dma_iccm_req,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(io.dma_mem_ctl.dma_iccm_req, false.B)}
  io.iccm.wren := (io.iccm_ready & io.dma_mem_ctl.dma_iccm_req &  io.dma_mem_ctl.dma_mem_write) | iccm_correct_ecc
  io.iccm.rden := (io.iccm_ready & io.dma_mem_ctl.dma_iccm_req & !io.dma_mem_ctl.dma_mem_write) | (io.ifc_iccm_access_bf & io.ifc_fetch_req_bf)
  val iccm_dma_rden = io.iccm_ready & io.dma_mem_ctl.dma_iccm_req & !io.dma_mem_ctl.dma_mem_write
  io.iccm.wr_size := Fill(3, io.dma_mem_ctl.dma_iccm_req) & io.dma_mem_ctl.dma_mem_sz

  val dma_mem_ecc = Cat(rvecc_encode(io.dma_mem_ctl.dma_mem_wdata(63,32)), rvecc_encode(io.dma_mem_ctl.dma_mem_wdata(31,0)))
  val iccm_ecc_corr_data_ff = WireInit(UInt(39.W), 0.U)
  io.iccm.wr_data := Mux(iccm_correct_ecc & !(io.iccm_ready & io.dma_mem_ctl.dma_iccm_req), Fill(2,iccm_ecc_corr_data_ff),
    Cat(dma_mem_ecc(13,7),io.dma_mem_ctl.dma_mem_wdata(63,32), dma_mem_ecc(6,0), io.dma_mem_ctl.dma_mem_wdata(31,0)))
  val iccm_corrected_data = Wire(Vec(2, UInt(32.W)))
  val dma_mem_addr_ff = WireInit(UInt(2.W), 0.U)
  val iccm_dma_rdata_1_muxed = Mux(dma_mem_addr_ff(0).asBool, iccm_corrected_data(0), iccm_corrected_data(1))
  val iccm_double_ecc_error = WireInit(UInt(2.W), 0.U)
  val iccm_dma_rdata_in = Mux(iccm_double_ecc_error.orR, Fill(2, io.dma_mem_ctl.dma_mem_addr), Cat(iccm_dma_rdata_1_muxed, iccm_corrected_data(0)))
  val dma_mem_tag_ff = rvdffie(io.dma_mem_ctl.dma_mem_tag,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(io.dma_mem_ctl.dma_mem_tag, 0.U)}
  val iccm_dma_rtag_temp = if(ICCM_ENABLE) rvdffie(dma_mem_tag_ff,io.free_l2clk,reset.asAsyncReset(),io.scan_mode) else 0.U
  io.iccm_dma_rtag := iccm_dma_rtag_temp
  dma_mem_addr_ff := rvdffie(io.dma_mem_ctl.dma_mem_addr(3,2),io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk) {RegNext(io.dma_mem_ctl.dma_mem_addr(3,2), 0.U)}
  val iccm_dma_rvalid_in = rvdffie(iccm_dma_rden,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk) {RegNext(iccm_dma_rden, false.B)}
  val iccm_dma_rvalid_temp = if(ICCM_ENABLE) rvdffie(iccm_dma_rvalid_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode) else 0.U
  io.iccm_dma_rvalid := iccm_dma_rvalid_temp
  val iccm_dma_ecc_error = if(ICCM_ENABLE) rvdffie(iccm_double_ecc_error.orR,io.free_l2clk,reset.asAsyncReset(),io.scan_mode) else 0.U
  io.iccm_dma_ecc_error := iccm_dma_ecc_error
  val iccm_dma_rdata_temp = if(ICCM_ENABLE) rvdffe(iccm_dma_rdata_in,iccm_dma_rvalid_in,clock,io.scan_mode) else 0.U
  io.iccm_dma_rdata := iccm_dma_rdata_temp
  val iccm_ecc_corr_index_ff = WireInit(UInt((ICCM_BITS-2).W), 0.U)
  io.iccm.rw_addr := Mux(io.iccm_ready & io.dma_mem_ctl.dma_iccm_req  & !iccm_correct_ecc, io.dma_mem_ctl.dma_mem_addr(ICCM_BITS-1,1),
    Mux(!(io.iccm_ready & io.dma_mem_ctl.dma_iccm_req) & iccm_correct_ecc, Cat(iccm_ecc_corr_index_ff, 0.U), io.ifc_fetch_addr_bf(ICCM_BITS-2,0)))
  val ic_fetch_val_int_f = Cat(0.U(2.W), io.ic_fetch_val_f)
  val ic_fetch_val_shift_right = ic_fetch_val_int_f << ifu_fetch_addr_int_f(0)
  // ICCM ECC Check logic
  val iccm_ecc_word_enable = (0 until 2).map(i=>((ic_fetch_val_shift_right((2*i+1),(2*i)).orR & !io.exu_flush_final & fetch_req_iccm_f) | iccm_dma_rvalid_in) & !io.dec_mem_ctrl.dec_tlu_core_ecc_disable).reverse.reduce(Cat(_,_))
  val ecc_decoded = (0 until 2).map(i=>rvecc_decode(iccm_ecc_word_enable(i), io.iccm.rd_data_ecc((39*i+31),(39*i)), io.iccm.rd_data_ecc((39*i+38),(39*i+32)), 0.U))
  val iccm_corrected_ecc = Wire(Vec(2, UInt(7.W)))
  iccm_corrected_ecc := VecInit(ecc_decoded(0)._1,ecc_decoded(1)._1)
  iccm_corrected_data := VecInit(ecc_decoded(0)._2,ecc_decoded(1)._2)
  iccm_single_ecc_error := Cat(ecc_decoded(1)._3,ecc_decoded(0)._3)
  iccm_double_ecc_error := Cat(ecc_decoded(1)._4,ecc_decoded(0)._4)
  if(ICCM_ENABLE){
    io.dec_mem_ctrl.ifu_iccm_rd_ecc_single_err := iccm_single_ecc_error.orR & ifc_iccm_access_f & ifc_fetch_req_f
    io.iccm_rd_ecc_double_err :=  Mux(!ifu_fetch_addr_int_f(0), (Cat(iccm_double_ecc_error(0), iccm_double_ecc_error(0)) ) & Fill(2,ifc_iccm_access_f),
      (Cat(iccm_double_ecc_error(1), iccm_double_ecc_error(0)) ) & Fill(2,ifc_iccm_access_f))
  }
  else {
    io.iccm_rd_ecc_double_err :=  0.U
    io.dec_mem_ctrl.ifu_iccm_rd_ecc_single_err := 0.U
  }

  val iccm_corrected_data_f_mux = Mux(iccm_single_ecc_error(0).asBool, iccm_corrected_data(0), iccm_corrected_data(1))
  val iccm_corrected_ecc_f_mux = Mux(iccm_single_ecc_error(0).asBool, iccm_corrected_ecc(0), iccm_corrected_ecc(1))
  val iccm_rd_ecc_single_err_hold_in = WireInit(Bool(),0.B)
  val iccm_rd_ecc_single_err_ff =  if(ICCM_ENABLE) rvdffie(iccm_rd_ecc_single_err_hold_in,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)  else  0.U
  val iccm_ecc_write_status = if(ICCM_ENABLE)((io.dec_mem_ctrl.ifu_iccm_rd_ecc_single_err & !iccm_rd_ecc_single_err_ff) & !io.exu_flush_final) | io.iccm_dma_sb_error else 0.U
  iccm_rd_ecc_single_err_hold_in := (io.dec_mem_ctrl.ifu_iccm_rd_ecc_single_err | iccm_rd_ecc_single_err_ff) & !io.exu_flush_final

  val iccm_rw_addr_f = WireInit(UInt((ICCM_BITS-2).W), 0.U)
  val iccm_ecc_corr_index_in = Mux(iccm_single_ecc_error(0).asBool(), iccm_rw_addr_f, iccm_rw_addr_f + 1.U)
  iccm_rw_addr_f := rvdffie(io.iccm.rw_addr(ICCM_BITS-2,1),io.free_l2clk,reset.asAsyncReset(),io.scan_mode)
  iccm_ecc_corr_data_ff := rvdffe(Cat(iccm_corrected_ecc_f_mux, iccm_corrected_data_f_mux),iccm_ecc_write_status,clock,io.scan_mode)//withClock(io.free_clk){RegEnable(Cat(iccm_corrected_ecc_f_mux, iccm_corrected_data_f_mux), 0.U, iccm_ecc_write_status.asBool())}
  if(ICCM_ENABLE) iccm_ecc_corr_index_ff := rvdffe(iccm_ecc_corr_index_in,iccm_ecc_write_status,clock,io.scan_mode) else  iccm_ecc_corr_index_ff := 0.U//withClock(io.free_clk){RegEnable(iccm_ecc_corr_index_in, 0.U, iccm_ecc_write_status.asBool())}
  io.ic.rd_en := (io.ifc_fetch_req_bf & !io.ifc_fetch_uncacheable_bf & !io.ifc_iccm_access_bf  &
    !(((miss_state===stream_C) & !miss_state_en)                                       |
      ((miss_state===crit_byp_ok_C) & !miss_state_en)                                  |
      ((miss_state===stall_scnd_miss_C) & !miss_state_en)                              |
      ((miss_state===miss_wait_C) & !miss_state_en)                                    |
      ((miss_state===crit_wrd_rdy_C) & !miss_state_en)  |
      ((miss_state===crit_byp_ok_C) &  miss_state_en &  (miss_nxtstate===miss_wait_C))  ))  |
    (io.ifc_fetch_req_bf & io.exu_flush_final  & !io.ifc_fetch_uncacheable_bf & !io.ifc_iccm_access_bf)
  val bus_ic_wr_en = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  io.ic.wr_en := bus_ic_wr_en & Fill(ICACHE_NUM_WAYS, write_ic_16_bytes)
  io.ic_write_stall := write_ic_16_bytes & !((((miss_state===crit_byp_ok_C) | ((miss_state===stream_C) & !(io.exu_flush_final | ifu_bp_hit_taken_q_f  | stream_eol_f ))) & !(bus_ifu_wr_en_ff & last_beat & !uncacheable_miss_ff)))
  reset_all_tags := rvdffie(io.dec_mem_ctrl.dec_tlu_fence_i_wb,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(io.dec_mem_ctrl.dec_tlu_fence_i_wb, false.B)}
  // I$ status and P-LRU
  val ic_valid = !ifu_wr_cumulative_err_data & !(reset_ic_in | reset_ic_ff) & !reset_tag_valid_for_miss
  val ifu_status_wr_addr_w_debug = Mux((io.ic.debug_rd_en | io.ic.debug_wr_en) & io.ic.debug_tag_array, io.ic.debug_addr(ICACHE_INDEX_HI - 3, ICACHE_TAG_INDEX_LO - 3),
    ifu_status_wr_addr(ICACHE_INDEX_HI - 1, ICACHE_TAG_INDEX_LO - 1))
  val ifu_status_wr_addr_ff = rvdffie(ifu_status_wr_addr_w_debug,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  val way_status_wr_en = WireInit(Bool(), 0.B)
  val way_status_wr_en_w_debug = way_status_wr_en | (io.ic.debug_wr_en & io.ic.debug_tag_array)
  val way_status_wr_en_ff =    rvdffie(way_status_wr_en_w_debug,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  val way_status_new = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  val way_status_new_w_debug = Mux(io.ic.debug_wr_en & io.ic.debug_tag_array,
    if (ICACHE_STATUS_BITS == 1) io.ic.debug_wr_data(4) else io.ic.debug_wr_data(6, 4), way_status_new)
  val way_status_new_ff = rvdffie(way_status_new_w_debug,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  val way_status_clken = (0 until ICACHE_TAG_DEPTH / 8).map(i => ifu_status_wr_addr_ff(ICACHE_INDEX_HI - ICACHE_TAG_INDEX_LO, 3) === i.U)
  val way_status_clk = if(RV_FPGA_OPTIMIZE) way_status_clken.map(rvclkhdr(clock, _, io.scan_mode)) else (0 until ICACHE_TAG_DEPTH/8).map(i=>0.B.asClock())
  val way_status_out = Wire(Vec(ICACHE_TAG_DEPTH, UInt(ICACHE_STATUS_BITS.W)))
  for (i <- 0 until ICACHE_TAG_DEPTH / 8; j <- 0 until 8)
    way_status_out((8 * i) + j) := rvdffs_fpga(way_status_new_ff,(ifu_status_wr_addr_ff(2,0)===j.U) & way_status_wr_en_ff,way_status_clk(i),way_status_clken(i),clock)//withClock(way_status_clk(i)){RegEnable(way_status_new_ff, 0.U, (ifu_status_wr_addr_ff(2,0)===j.U) & way_status_wr_en_ff)}
  val test_way_status_out = (0 until ICACHE_TAG_DEPTH).map(i=>way_status_out(i).asUInt).reverse.reduce(Cat(_,_))
  // io.test_way_status_out := test_way_status_out
  val test_way_status_clken = (0 until ICACHE_TAG_DEPTH/8).map(i=>way_status_clken(i).asUInt()).reverse.reduce(Cat(_,_))
  //io.test_way_status_clken := test_way_status_clken
  way_status := Mux1H((0 until ICACHE_TAG_DEPTH).map(i=>(ifu_ic_rw_int_addr_ff === i.U) -> way_status_out(i)))
  val ifu_ic_rw_int_addr_w_debug = Mux((io.ic.debug_rd_en | io.ic.debug_wr_en) & io.ic.debug_tag_array,
    io.ic.debug_addr(ICACHE_INDEX_HI - 3, ICACHE_TAG_INDEX_LO - 3), io.ic.rw_addr(ICACHE_INDEX_HI - 1, ICACHE_TAG_INDEX_LO - 1))
  ifu_ic_rw_int_addr_ff := rvdffie(ifu_ic_rw_int_addr_w_debug,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)
  //    withClock(io.free_clk) {
  //    RegNext(ifu_ic_rw_int_addr_w_debug, 0.U)
  //  }
  val ifu_tag_wren = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val ic_debug_tag_wr_en = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val ifu_tag_wren_w_debug = ifu_tag_wren | ic_debug_tag_wr_en
  val ifu_tag_wren_ff = rvdffie(ifu_tag_wren_w_debug,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  val ic_valid_w_debug = Mux(io.ic.debug_wr_en & io.ic.debug_tag_array, io.ic.debug_wr_data(0), ic_valid)
  val ic_valid_ff =rvdffie(ic_valid_w_debug,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  val tag_valid_clken = (0 until (ICACHE_TAG_DEPTH / 32)).map(i => (0 until ICACHE_NUM_WAYS).map(j =>
    if (ICACHE_TAG_DEPTH == 32) ifu_tag_wren_ff(j) | perr_err_inv_way(j) | reset_all_tags
    else ((ifu_ic_rw_int_addr_ff(ICACHE_INDEX_HI - ICACHE_TAG_INDEX_LO, 5) === i.U) & ifu_tag_wren_ff(j)) |
      ((perr_ic_index_ff(ICACHE_INDEX_HI - ICACHE_TAG_INDEX_LO, 5) === i.U) & perr_err_inv_way(j)) |
      reset_all_tags).reverse.reduce(Cat(_, _)))
  val tag_valid_clk = if(RV_FPGA_OPTIMIZE) (0 until ICACHE_TAG_DEPTH / 32).map(i => (0 until ICACHE_NUM_WAYS).map(j => rvclkhdr(clock, tag_valid_clken(i)(j), io.scan_mode))) else (0 until ICACHE_TAG_DEPTH / 32).map(i => (0 until ICACHE_NUM_WAYS).map(j => 0.B.asClock()))
  val ic_tag_valid_out = Wire(Vec(ICACHE_NUM_WAYS, Vec(ICACHE_TAG_DEPTH, Bool())))
  // io.valids := Cat((0 until ICACHE_TAG_DEPTH).map(i=>ic_tag_valid_out(1)(i).asUInt()).reverse.reduce(Cat(_,_)),
  // (0 until ICACHE_TAG_DEPTH).map(i=>ic_tag_valid_out(0)(i).asUInt()).reverse.reduce(Cat(_,_)))

  for (i <- 0 until (ICACHE_TAG_DEPTH / 32); j <- 0 until ICACHE_NUM_WAYS; k <- 0 until 32)
    ic_tag_valid_out(j)((32 * i) + k) := rvdffs_fpga(ic_valid_ff & !reset_all_tags.asBool & !perr_sel_invalidate,(((ifu_ic_rw_int_addr_ff === (k + (32 * i)).U) & ifu_tag_wren_ff(j)) | ((perr_ic_index_ff === (k + (32 * i)).U) & perr_err_inv_way(j)) | reset_all_tags),tag_valid_clk(i)(j),tag_valid_clken(i)(j),clock)
  val ic_tag_valid_unq = if(ICACHE_ENABLE)(0 until ICACHE_NUM_WAYS).map(k => (0 until ICACHE_TAG_DEPTH).map(j =>
    Mux(ifu_ic_rw_int_addr_ff === j.U, ic_tag_valid_out(k)(j), 0.B).asUInt).reduce(_|_)).reverse.reduce(Cat(_,_))
  else 0.U(ICACHE_NUM_WAYS.W)
  // Making sudo LRU
  val way_status_hit_new = WireInit(UInt(ICACHE_STATUS_BITS.W), 0.U)
  if (ICACHE_NUM_WAYS == 4) {
    replace_way_mb_any(3) := (way_status_mb_ff(2) & way_status_mb_ff(0) & tagv_mb_ff(3, 0).andR) |
      (!tagv_mb_ff(3) & tagv_mb_ff(2) & tagv_mb_ff(1) & tagv_mb_ff(0))
    replace_way_mb_any(2) := (!way_status_mb_ff(2) & way_status_mb_ff(0) & tagv_mb_ff(3, 0).andR) |
      (!tagv_mb_ff(2) & tagv_mb_ff(1) & tagv_mb_ff(0))
    replace_way_mb_any(1) := (way_status_mb_ff(1) & !way_status_mb_ff(0) & tagv_mb_ff(3, 0).andR) |
      (!tagv_mb_ff(1) & tagv_mb_ff(0))
    replace_way_mb_any(0) := (!way_status_mb_ff(1) & !way_status_mb_ff(0) & tagv_mb_ff(3, 0).andR) | !tagv_mb_ff(0)

    way_status_hit_new := Mux1H(Seq((!io.exu_flush_final & io.ic.rd_hit(0)) -> Cat(way_status(2), 3.U),
      (!io.exu_flush_final & io.ic.rd_hit(1)) -> Cat(way_status(2), 1.U(2.W)),
      (!io.exu_flush_final & io.ic.rd_hit(2)) -> Cat(1.U, way_status(1), 0.U),
      (!io.exu_flush_final & io.ic.rd_hit(3)) -> Cat(0.U, way_status(1), 0.U)))

    way_status_rep_new := Mux1H(Seq(replace_way_mb_any(0).asBool -> Cat(way_status_mb_ff(2), 3.U),
      replace_way_mb_any(1).asBool -> Cat(way_status_mb_ff(2), 1.U(2.W)),
      replace_way_mb_any(2).asBool -> Cat(1.U, way_status_mb_ff(1), 0.U),
      replace_way_mb_any(3).asBool -> Cat(0.U, way_status_mb_ff(1), 0.U)))
  }
  else {
    replace_way_mb_any(0) := (!way_status_mb_ff & tagv_mb_ff(0) & tagv_mb_ff(1)) | !tagv_mb_ff(0)
    replace_way_mb_any(1) := (way_status_mb_ff & tagv_mb_ff(0) & tagv_mb_ff(1)) | !tagv_mb_ff(1) & tagv_mb_ff(0)
    way_status_hit_new := io.ic.rd_hit(0)
    way_status_rep_new := replace_way_mb_any(0)
  }
  way_status_new := Mux((bus_ifu_wr_en_ff_q & last_beat).asBool, way_status_rep_new, way_status_hit_new)
  way_status_wr_en := (bus_ifu_wr_en_ff_q & last_beat) | ic_act_hit_f
  val bus_wren = if(ICACHE_ENABLE)(0 until ICACHE_NUM_WAYS).map(i => bus_ifu_wr_en_ff_q & replace_way_mb_any(i) & miss_pending)
  else (0 until ICACHE_NUM_WAYS).map(i => 0.U)
  val bus_wren_last = (0 until ICACHE_NUM_WAYS).map(i => bus_ifu_wr_en_ff_wo_err & replace_way_mb_any(i) & miss_pending & bus_last_data_beat)
  val wren_reset_miss = (0 until ICACHE_NUM_WAYS).map(i => replace_way_mb_any(i) & reset_tag_valid_for_miss)
  ifu_tag_wren := (0 until ICACHE_NUM_WAYS).map(i => bus_wren_last(i) | wren_reset_miss(i)).reverse.reduce(Cat(_, _))

  bus_ic_wr_en := bus_wren.reverse.reduce(Cat(_,_))
  if(!ICACHE_ENABLE){
    way_status := 0.U
    replace_way_mb_any := (0 until ICACHE_NUM_WAYS).map(i =>0.U)
    way_status_hit_new := 0.U
    way_status_rep_new := 0.U
    way_status_new := 0.U
    way_status_wr_en := 0.U
  }
  io.ic.tag_valid := ic_tag_valid_unq & Fill(ICACHE_NUM_WAYS, !fetch_uncacheable_ff & ifc_fetch_req_f_raw)

  val ic_debug_way_ff = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  ic_debug_tag_val_rd_out := (ic_tag_valid_unq & (ic_debug_way_ff & Fill(ICACHE_NUM_WAYS, ic_debug_rd_en_ff))).orR()

  io.dec_mem_ctrl.ifu_pmu_ic_miss   := rvdffie(ic_act_miss_f,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ic_act_miss_f, false.B)}
  io.dec_mem_ctrl.ifu_pmu_ic_hit    := rvdffie(ic_act_hit_f,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ic_act_hit_f, false.B)}
  io.dec_mem_ctrl.ifu_pmu_bus_error := rvdffie(ifc_bus_acc_fault_f.orR,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ifc_bus_acc_fault_f.orR, false.B)}
  io.dec_mem_ctrl.ifu_pmu_bus_busy  := rvdffie(ifu_bus_arvalid_ff & !ifu_bus_arready_ff & miss_pending,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ifu_bus_arvalid_ff & !ifu_bus_arready_ff & miss_pending, false.B)}
  io.dec_mem_ctrl.ifu_pmu_bus_trxn  := rvdffie(bus_cmd_sent,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(bus_cmd_sent, false.B)}


  io.ic.debug_addr := io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_dicawics
  io.ic.debug_tag_array := io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_dicawics(16)
  io.ic.debug_rd_en := io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_rd_valid
  io.ic.debug_wr_en := io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_wr_valid
  io.ic.debug_way := Cat(io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_dicawics(15,14)===3.U, io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_dicawics(15,14)===2.U,
    io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_dicawics(15,14)===1.U, io.dec_mem_ctrl.dec_tlu_ic_diag_pkt.icache_dicawics(15,14)===0.U)
  ic_debug_tag_wr_en := Fill(ICACHE_NUM_WAYS, io.ic.debug_wr_en & io.ic.debug_tag_array) & io.ic.debug_way
  val ic_debug_ict_array_sel_in = io.ic.debug_rd_en & io.ic.debug_tag_array
  ic_debug_way_ff := rvdff_fpga(io.ic.debug_way,debug_c1_clk,debug_c1_clken,clock)//withClock(debug_c1_clk){RegNext(io.ic.debug_way, 0.U)}
  ic_debug_ict_array_sel_ff := rvdff_fpga(ic_debug_ict_array_sel_in,debug_c1_clk,debug_c1_clken,clock)//withClock(debug_c1_clk){RegNext(ic_debug_ict_array_sel_in, 0.U)}
  ic_debug_rd_en_ff := rvdffie(io.ic.debug_rd_en,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.free_clk){RegNext(io.ic.debug_rd_en, false.B)}
  io.dec_mem_ctrl.ifu_ic_debug_rd_data_valid := rvdffie(ic_debug_rd_en_ff,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ic_debug_rd_en_ff, 0.U)}
  // Memory protection each access enable with its Mask
  val ifc_region_acc_okay = !(Cat(INST_ACCESS_ENABLE0.U,INST_ACCESS_ENABLE1.U,INST_ACCESS_ENABLE2.U,INST_ACCESS_ENABLE3.U,INST_ACCESS_ENABLE4.U,INST_ACCESS_ENABLE5.U,INST_ACCESS_ENABLE6.U,INST_ACCESS_ENABLE7.U).orR()) |
    (INST_ACCESS_ENABLE0.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK0).U) === (aslong(INST_ACCESS_ADDR0).U | aslong(INST_ACCESS_MASK0).U))) |
    (INST_ACCESS_ENABLE1.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK1).U) === (aslong(INST_ACCESS_ADDR1).U | aslong(INST_ACCESS_MASK1).U))) |
    (INST_ACCESS_ENABLE2.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK2).U) === (aslong(INST_ACCESS_ADDR2).U | aslong(INST_ACCESS_MASK2).U))) |
    (INST_ACCESS_ENABLE3.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK3).U) === (aslong(INST_ACCESS_ADDR3).U | aslong(INST_ACCESS_MASK3).U))) |
    (INST_ACCESS_ENABLE4.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK4).U) === (aslong(INST_ACCESS_ADDR4).U | aslong(INST_ACCESS_MASK4).U))) |
    (INST_ACCESS_ENABLE5.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK5).U) === (aslong(INST_ACCESS_ADDR5).U | aslong(INST_ACCESS_MASK5).U))) |
    (INST_ACCESS_ENABLE6.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK6).U) === (aslong(INST_ACCESS_ADDR6).U | aslong(INST_ACCESS_MASK6).U))) |
    (INST_ACCESS_ENABLE7.U & ((Cat(io.ifc_fetch_addr_bf, 0.U) | aslong(INST_ACCESS_MASK7).U) === (aslong(INST_ACCESS_ADDR7).U | aslong(INST_ACCESS_MASK7).U)))
  dontTouch(ifc_region_acc_okay)
  val ifc_region_acc_fault_memory_bf = !io.ifc_iccm_access_bf & !ifc_region_acc_okay & io.ifc_fetch_req_bf
  ifc_region_acc_fault_final_bf := io.ifc_region_acc_fault_bf | ifc_region_acc_fault_memory_bf
  ifc_region_acc_fault_memory_f := rvdffie(ifc_region_acc_fault_memory_bf,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)//withClock(io.active_clk){RegNext(ifc_region_acc_fault_memory_bf, false.B)}

}

//object ifumem_ctl extends App {
//  println((new chisel3.stage.ChiselStage).emitVerilog(new ifu_mem_ctl()))
//}
