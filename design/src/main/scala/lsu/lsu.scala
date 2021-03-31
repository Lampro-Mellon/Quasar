package lsu

import lib._
import chisel3._
import chisel3.util._
import include._
import mem._

class lsu extends Module with RequireAsyncReset with param with lib {
  val io = IO (new Bundle {
    val clk_override                      = Input(Bool())
    val lsu_dma = new lsu_dma
    val lsu_pic = new lsu_pic
    val lsu_exu = new lsu_exu
    val lsu_dec = new lsu_dec
    val dccm = Flipped(new mem_lsu)
    val lsu_tlu = new lsu_tlu
    val axi = new axi_channels(LSU_BUS_TAG)

    val dec_tlu_flush_lower_r             = Input(Bool())
    val dec_tlu_i0_kill_writeb_r          = Input(Bool())
    val dec_tlu_force_halt                = Input(Bool())

    val dec_tlu_core_ecc_disable          = Input(Bool())

    val dec_lsu_offset_d                  = Input(UInt(12.W))
    val lsu_p                             = Flipped(Valid(new lsu_pkt_t()))
    val trigger_pkt_any                   = Input(Vec(4, new trigger_pkt_t()))

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
    val lsu_error_pkt_r                   = Valid(new lsu_error_pkt_t())
    val lsu_pmu_misaligned_m              = Output(Bool())
    val lsu_trigger_match_m               = Output(UInt(4.W))

    val lsu_bus_clk_en                    = Input(Bool())

    val scan_mode                         = Input(Bool())
    val free_clk                          = Input(Clock())

  })
  val dma_dccm_wdata               = WireInit(0.U(64.W))
  val dma_dccm_wdata_lo            = WireInit(0.U(32.W))
  val dma_dccm_wdata_hi            = WireInit(0.U(32.W))
  val dma_mem_tag_m                = WireInit(0.U(3.W))
  val lsu_raw_fwd_lo_r             = WireInit(0.U(1.W))
  val lsu_raw_fwd_hi_r             = WireInit(0.U(1.W))

  val lsu_lsc_ctl    = Module(new lsu_lsc_ctl())
  io.lsu_result_m := lsu_lsc_ctl.io.lsu_result_m
  io.lsu_result_corr_r := lsu_lsc_ctl.io.lsu_result_corr_r
  val dccm_ctl       = Module(new lsu_dccm_ctl())
  val stbuf          = Module(new lsu_stbuf())
  val ecc            = Module(new lsu_ecc())
  val trigger        = Module(new lsu_trigger())
  val clkdomain      = Module(new lsu_clkdomain())
  val bus_intf       = Module(new lsu_bus_intf())

  val lsu_raw_fwd_lo_m = stbuf.io.stbuf_fwdbyteen_lo_m.orR
  val lsu_raw_fwd_hi_m = stbuf.io.stbuf_fwdbyteen_hi_m.orR

  // block stores in decode  - for either bus or stbuf reasons
  io.lsu_store_stall_any := stbuf.io.lsu_stbuf_full_any | bus_intf.io.lsu_bus_buffer_full_any | dccm_ctl.io.ld_single_ecc_error_r_ff
  io.lsu_load_stall_any := bus_intf.io.lsu_bus_buffer_full_any | dccm_ctl.io.ld_single_ecc_error_r_ff
  io.lsu_fastint_stall_any := dccm_ctl.io.ld_single_ecc_error_r  // Stall the fastint in decode-1 stage

  // Ready to accept dma trxns
  // There can't be any inpipe forwarding from non-dma packet to dma packet since they can be flushed so we can't have st in r when dma is in m
  val dma_mem_tag_d  = io.lsu_dma.dma_mem_tag
  val ldst_nodma_mtor = lsu_lsc_ctl.io.lsu_pkt_m.valid & !lsu_lsc_ctl.io.lsu_pkt_m.bits.dma & (lsu_lsc_ctl.io.addr_in_dccm_m | lsu_lsc_ctl.io.addr_in_pic_m) & lsu_lsc_ctl.io.lsu_pkt_m.bits.store
  io.lsu_dma.dccm_ready := !(io.dec_lsu_valid_raw_d | ldst_nodma_mtor | dccm_ctl.io.ld_single_ecc_error_r_ff)
  val dma_dccm_wen = io.lsu_dma.dma_lsc_ctl.dma_dccm_req & io.lsu_dma.dma_lsc_ctl.dma_mem_write & lsu_lsc_ctl.io.addr_in_dccm_d
  val dma_pic_wen  = io.lsu_dma.dma_lsc_ctl.dma_dccm_req & io.lsu_dma.dma_lsc_ctl.dma_mem_write & lsu_lsc_ctl.io.addr_in_pic_d
  dma_dccm_wdata := io.lsu_dma.dma_lsc_ctl.dma_mem_wdata >> Cat(io.lsu_dma.dma_lsc_ctl.dma_mem_addr(2,0), 0.U(3.W)) // Shift the dma data to lower bits to make it consistent to lsu stores
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
  io.lsu_tlu.lsu_pmu_load_external_m  := lsu_lsc_ctl.io.lsu_pkt_m.valid & lsu_lsc_ctl.io.lsu_pkt_m.bits.load & lsu_lsc_ctl.io.addr_external_m
  io.lsu_tlu.lsu_pmu_store_external_m := lsu_lsc_ctl.io.lsu_pkt_m.valid & lsu_lsc_ctl.io.lsu_pkt_m.bits.store & lsu_lsc_ctl.io.addr_external_m

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
  lsu_lsc_ctl.io.lsu_exu                     <> io.lsu_exu
  lsu_lsc_ctl.io.lsu_p                       <> io.lsu_p
  lsu_lsc_ctl.io.dec_lsu_valid_raw_d         := io.dec_lsu_valid_raw_d
  lsu_lsc_ctl.io.dec_lsu_offset_d            := io.dec_lsu_offset_d
  lsu_lsc_ctl.io.picm_mask_data_m            := dccm_ctl.io.picm_mask_data_m
  lsu_lsc_ctl.io.bus_read_data_m             := bus_intf.io.bus_read_data_m
  lsu_lsc_ctl.io.dma_lsc_ctl         <> io.lsu_dma.dma_lsc_ctl
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
  dccm_ctl.io.dma_dccm_wdata_lo              := dma_dccm_wdata_lo
  dccm_ctl.io.dma_dccm_wdata_hi              := dma_dccm_wdata_hi
  dccm_ctl.io.dma_dccm_wdata_ecc_hi          := ecc.io.dma_dccm_wdata_ecc_hi
  dccm_ctl.io.dma_dccm_wdata_ecc_lo          := ecc.io.dma_dccm_wdata_ecc_lo
  dccm_ctl.io.scan_mode                      := io.scan_mode
  //Outputs
  io.lsu_dma.dma_dccm_ctl <> dccm_ctl.io.dma_dccm_ctl
  io.dccm <> dccm_ctl.io.dccm
  io.lsu_pic <> dccm_ctl.io.lsu_pic
  //Store Buffer
  //Inputs
  stbuf.io.lsu_c1_m_clk                         := clkdomain.io.lsu_c1_m_clk
  stbuf.io.lsu_c1_r_clk        	               := clkdomain.io.lsu_c1_r_clk
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
  clkdomain.io.dma_dccm_req                      := io.lsu_dma.dma_lsc_ctl.dma_dccm_req
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
  io.lsu_dec.tlu_busbuff <> bus_intf.io.tlu_busbuff
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
  io.lsu_dec.dctl_busbuff <> bus_intf.io.dctl_busbuff
  io.axi                                        <> bus_intf.io.axi
  bus_intf.io.lsu_bus_clk_en                    := io.lsu_bus_clk_en

  withClock(clkdomain.io.lsu_c1_m_clk){dma_mem_tag_m    := RegNext(dma_mem_tag_d,0.U)}
  withClock(clkdomain.io.lsu_c2_r_clk){lsu_raw_fwd_hi_r := RegNext(lsu_raw_fwd_hi_m,0.U)}
  withClock(clkdomain.io.lsu_c2_r_clk){lsu_raw_fwd_lo_r := RegNext(lsu_raw_fwd_lo_m,0.U)}

}
