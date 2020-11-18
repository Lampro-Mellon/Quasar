import chisel3._
import chisel3.util._
import ifu._
import dec._
import exu._
import lsu._
import lib._
import include._
import dbg._

class el2_swerv extends Module with RequireAsyncReset with el2_lib {
  val io = IO (new Bundle{
    val dbg_rst_l = Input(Bool())
    val rst_vec = Input(UInt(31.W))
    val nmi_int = Input(Bool())
    val nmi_vec = Input(UInt(31.W))
    val core_rst_l = Output(AsyncReset())
    val trace_rv_i_insn_ip = Output(UInt(32.W))
    val trace_rv_i_address_ip = Output(UInt(32.W))
    val trace_rv_i_valid_ip = Output(UInt(2.W))
    val trace_rv_i_exception_ip = Output(UInt(2.W))
    val trace_rv_i_ecause_ip = Output(UInt(5.W))
    val trace_rv_i_interrupt_ip = Output(UInt(2.W))
    val trace_rv_i_tval_ip = Output(UInt(32.W))
    val dccm_clk_override = Output(Bool())
    val icm_clk_override = Output(Bool())
    val dec_tlu_core_ecc_disable = Output(Bool())
    val i_cpu_halt_req = Input(Bool())
    val i_cpu_run_req = Input(Bool())
    val o_cpu_halt_ack = Output(Bool())
    val o_cpu_halt_status = Output(Bool())
    val o_cpu_run_ack = Output(Bool())
    val o_debug_mode_status = Output(Bool())
    val core_id = Input(UInt(28.W))
    val mpc_debug_halt_req = Input(Bool())
    val mpc_debug_run_req = Input(Bool())
    val mpc_reset_run_req = Input(Bool())
    val mpc_debug_halt_ack = Output(Bool())
    val mpc_debug_run_ack = Output(Bool())
    val debug_brkpt_status = Output(Bool())
    val dec_tlu_perfcnt0 = Output(Bool())
    val dec_tlu_perfcnt1 = Output(Bool())
    val dec_tlu_perfcnt2 = Output(Bool())
    val dec_tlu_perfcnt3 = Output(Bool())
    val dccm_wren = Output(Bool())
    val dccm_rden = Output(Bool())
    val dccm_wr_addr_lo = Output(UInt(DCCM_BITS.W))
    val dccm_wr_addr_hi = Output(UInt(DCCM_BITS.W))
    val dccm_rd_addr_lo = Output(UInt(DCCM_BITS.W))
    val dccm_rd_addr_hi = Output(UInt(DCCM_BITS.W))

    val dccm_wr_data_lo = Output(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_wr_data_hi = Output(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_rd_data_lo = Input(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_rd_data_hi = Input(UInt(DCCM_FDATA_WIDTH.W))

    val iccm_rw_addr = Output(UInt(ICCM_BITS.W))
    val iccm_wren = Output(Bool())
    val iccm_rden = Output(Bool())
    val iccm_wr_size = Output(UInt(3.W))
    val iccm_wr_data = Output(UInt(78.W))
    val iccm_buf_correct_ecc = Output(Bool())
    val iccm_correction_state = Output(Bool())

    val iccm_rd_data = Input(UInt(64.W))
    val iccm_rd_data_ecc = Input(UInt(78.W))

    val ic_rw_addr = Output(UInt(31.W))
    val ic_tag_valid = Output(UInt(ICACHE_NUM_WAYS.W))
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
    val ic_rd_hit = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_perr = Input(Bool())

    // AXI Signals
    val lsu_axi_awvalid = Output(Bool())
    val lsu_axi_awready = Input(Bool())
    val lsu_axi_awid = Output(UInt(LSU_BUS_TAG.W))
    val lsu_axi_awaddr = Output(UInt(32.W))
    val lsu_axi_awregion = Output(UInt(4.W))
    val lsu_axi_awlen = Output(UInt(8.W))
    val lsu_axi_awsize = Output(UInt(3.W))
    val lsu_axi_awburst = Output(UInt(2.W))
    val lsu_axi_awlock = Output(Bool())
    val lsu_axi_awcache = Output(UInt(4.W))
    val lsu_axi_awprot = Output(UInt(3.W))
    val lsu_axi_awqos = Output(UInt(4.W))
    val lsu_axi_wvalid = Output(Bool())
    val lsu_axi_wready = Input(Bool())
    val lsu_axi_wdata = Output(UInt(64.W))
    val lsu_axi_wstrb = Output(UInt(8.W))
    val lsu_axi_wlast = Output(Bool())
    val lsu_axi_bvalid = Input(Bool())
    val lsu_axi_bready = Output(Bool())
    val lsu_axi_bresp = Input(UInt(2.W))
    val lsu_axi_bid = Input(UInt(LSU_BUS_TAG.W))


    val lsu_axi_arvalid = Output(Bool())
    val lsu_axi_arready = Input(Bool())
    val lsu_axi_arid = Output(UInt(LSU_BUS_TAG.W))
    val lsu_axi_araddr = Output(UInt(32.W))
    val lsu_axi_arregion = Output(UInt(4.W))
    val lsu_axi_arlen = Output(UInt(8.W))
    val lsu_axi_arsize = Output(UInt(3.W))
    val lsu_axi_arburst = Output(UInt(2.W))
    val lsu_axi_arlock = Output(Bool())
    val lsu_axi_arcache = Output(UInt(4.W))
    val lsu_axi_arprot = Output(UInt(3.W))
    val lsu_axi_arqos = Output(UInt(4.W))
    val lsu_axi_rvalid = Input(Bool())
    val lsu_axi_rready = Output(Bool())
    val lsu_axi_rid = Input(UInt(LSU_BUS_TAG.W))
    val lsu_axi_rdata = Input(UInt(64.W))
    val lsu_axi_rresp = Input(UInt(2.W))
    val lsu_axi_rlast = Input(Bool())


    // AXI IFU Signals
    val ifu_axi_awvalid = Output(Bool())
    val ifu_axi_awready = Input(Bool())
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
    val ifu_axi_wready = Output(Bool())
    val ifu_axi_wdata = Output(UInt(64.W))
    val ifu_axi_wstrb = Output(UInt(8.W))
    val ifu_axi_wlast = Output(Bool())
    val ifu_axi_bvalid = Input(Bool())
    val ifu_axi_bready = Output(Bool())
    val ifu_axi_bresp = Input(UInt(2.W))
    val ifu_axi_bid = Input(UInt(IFU_BUS_TAG.W))
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
    val ifu_axi_rlast = Input(Bool())

    // SB AXI Signals
    val sb_axi_awvalid = Output(Bool())
    val sb_axi_awready = Input(Bool())
    val sb_axi_awid = Output(UInt(SB_BUS_TAG.W))
    val sb_axi_awaddr = Output(UInt(32.W))
    val sb_axi_awregion = Output(UInt(4.W))
    val sb_axi_awlen = Output(UInt(8.W))
    val sb_axi_awsize = Output(UInt(3.W))
    val sb_axi_awburst = Output(UInt(2.W))
    val sb_axi_awlock = Output(Bool())
    val sb_axi_awcache = Output(UInt(4.W))
    val sb_axi_awprot = Output(UInt(3.W))
    val sb_axi_awqos = Output(UInt(4.W))
    val sb_axi_wvalid = Output(Bool())
    val sb_axi_wready = Input(Bool())
    val sb_axi_wdata = Output(UInt(64.W))
    val sb_axi_wstrb = Output(UInt(8.W))
    val sb_axi_wlast = Output(Bool())
    val sb_axi_bvalid = Input(Bool())
    val sb_axi_bready = Output(Bool())
    val sb_axi_bresp = Input(UInt(2.W))
    val sb_axi_bid = Input(UInt(SB_BUS_TAG.W))
    val sb_axi_arvalid = Output(Bool())
    val sb_axi_arready = Input(Bool())
    val sb_axi_arid = Output(UInt(SB_BUS_TAG.W))
    val sb_axi_araddr = Output(UInt(32.W))
    val sb_axi_arregion = Output(UInt(4.W))
    val sb_axi_arlen = Output(UInt(8.W))
    val sb_axi_arsize = Output(UInt(3.W))
    val sb_axi_arburst = Output(UInt(2.W))
    val sb_axi_arlock = Output(Bool())
    val sb_axi_arcache = Output(UInt(4.W))
    val sb_axi_arprot = Output(UInt(3.W))
    val sb_axi_arqos = Output(UInt(4.W))
    val sb_axi_rvalid = Input(Bool())
    val sb_axi_rready = Output(Bool())
    val sb_axi_rid = Input(UInt(SB_BUS_TAG.W))
    val sb_axi_rdata = Input(UInt(64.W))
    val sb_axi_rresp = Input(UInt(2.W))
    val sb_axi_rlast = Input(Bool())
    // DMA signals
    val dma_axi_awvalid       = Input(Bool())
    val dma_axi_awready       = Output(Bool())
    val dma_axi_awid          = Input(UInt(DMA_BUS_TAG.W))
    val dma_axi_awaddr        = Input(UInt(32.W))
    val dma_axi_awsize        = Input(UInt(3.W))
    val dma_axi_awprot        = Input(UInt(3.W))
    val dma_axi_awlen = Input(UInt(8.W))
    val dma_axi_awburst = Input(UInt(2.W))
    val dma_axi_wvalid        = Input(Bool())
    val dma_axi_wready        = Output(Bool())
    val dma_axi_wdata         = Input(UInt(64.W))
    val dma_axi_wstrb         = Input(UInt(8.W))
    val dma_axi_wlast   = Input(Bool())
    val dma_axi_bvalid        = Output(Bool())
    val dma_axi_bready        = Input(Bool())
    val dma_axi_bresp         = Output(UInt(2.W))
    val dma_axi_bid           = Output(UInt(DMA_BUS_TAG.W))

    // AXI Read Channels
    val dma_axi_arvalid       = Input(Bool())
    val dma_axi_arready       = Output(Bool())
    val dma_axi_arid          = Input(UInt(DMA_BUS_TAG.W))

    val dma_axi_araddr        = Input(UInt(32.W))
    val dma_axi_arsize        = Input(UInt(3.W))

    val dma_axi_arprot = Input(UInt(3.W))
    val dma_axi_arlen = Input(UInt(8.W))
    val dma_axi_arburst = Input(UInt(2.W))
    val dma_axi_rvalid        = Output(Bool())
    val dma_axi_rready        = Input(Bool())

    val dma_axi_rid           = Output(UInt(DMA_BUS_TAG.W))
    val dma_axi_rdata         = Output(UInt(64.W))
    val dma_axi_rresp         = Output(UInt(2.W))
    val dma_axi_rlast         = Output(Bool())

    // AHB Lite Bus
    val haddr = Output(UInt(32.W))
    val hburst = Output(UInt(3.W))
    val hmastlock = Output(Bool())
    val hprot = Output(UInt(4.W))
    val hsize = Output(UInt(3.W))
    val htrans = Output(UInt(2.W))
    val hwrite = Output(Bool())
    val hrdata = Input(UInt(64.W))
    val hready = Input(Bool())
    val hresp = Input(Bool())

    // AHB Master
    val lsu_haddr = Output(UInt(32.W))
    val lsu_hburst = Output(UInt(3.W))
    val lsu_hmastlock = Output(Bool())
    val lsu_hprot = Output(UInt(4.W))
    val lsu_hsize = Output(UInt(3.W))
    val lsu_htrans = Output(UInt(2.W))
    val lsu_hwrite = Output(Bool())
    val lsu_hwdata = Output(UInt(64.W))
    val lsu_hrdata = Input(UInt(64.W))
    val lsu_hready = Input(Bool())
    val lsu_hresp = Input(Bool())

    // System Bus Debug Master
    val sb_haddr = Output(UInt(32.W))
    val sb_hburst = Output(UInt(3.W))
    val sb_hmastlock = Output(Bool())
    val sb_hprot = Output(UInt(4.W))
    val sb_hsize = Output(UInt(3.W))
    val sb_htrans = Output(UInt(2.W))
    val sb_hwrite = Output(Bool())
    val sb_hwdata = Output(UInt(64.W))
    val sb_hrdata = Input(UInt(64.W))
    val sb_hready = Input(Bool())
    val sb_hresp = Input(Bool())

    // DMA slave
    val dma_hsel = Input(Bool())
    val dma_haddr = Input(UInt(32.W))
    val dma_hburst = Input(UInt(3.W))
    val dma_hmastlock = Input(Bool())
    val dma_hprot = Input(UInt(4.W))
    val dma_hsize = Input(UInt(3.W))
    val dma_htrans = Input(UInt(2.W))
    val dma_hwrite = Input(Bool())
    val dma_hwdata = Input(UInt(64.W))
    val dma_hreadyin = Input(Bool())
    val dma_hrdata = Output(UInt(64.W))
    val dma_hreadyout = Output(Bool())
    val dma_hresp = Output(Bool())
    val lsu_bus_clk_en = Input(Bool())
    val ifu_bus_clk_en = Input(Bool())
    val dbg_bus_clk_en = Input(Bool())
    val dma_bus_clk_en = Input(Bool())
    val dmi_reg_en = Input(Bool())
    val dmi_reg_addr = Input(UInt(7.W))
    val dmi_reg_wr_en = Input(Bool())
    val dmi_reg_wdata = Input(UInt(32.W))
    val dmi_reg_rdata = Output(UInt(32.W))
    val dmi_hard_reset = Input(Bool())
    val extintsrc_req = Input(UInt(PIC_TOTAL_INT.W))
    val timer_int = Input(Bool())
    val soft_int = Input(Bool())
    val scan_mode = Input(Bool())
  })


  val ifu = Module(new el2_ifu)
  val dec = Module(new el2_dec)
  val dbg = Module(new el2_dbg)
  val exu = Module(new el2_exu)
  val lsu = Module(new el2_lsu)
  val pic_ctl_inst = Module(new el2_pic_ctrl)
  val dma_ctrl = Module(new el2_dma_ctrl)
  //val lsu_axi4_to_ahb = Module(new axi4_to_ahb)
  //val ifu_axi4_to_ahb = Module(new axi4_to_ahb)
  //val sb_axi4_to_ahb = Module(new axi4_to_ahb)

  io.core_rst_l := (!(reset.asBool() & (dbg.io.dbg_core_rst_l.asBool() | io.scan_mode))).asAsyncReset()
  val active_state = (!dec.io.dec_pause_state_cg | dec.io.dec_tlu_flush_lower_r) | dec.io.dec_tlu_misc_clk_override
  val free_clk = rvclkhdr(clock, true.B, io.scan_mode)
  val active_clk = rvclkhdr(clock, active_state, io.scan_mode)
  val core_dbg_cmd_done = dma_ctrl.io.dma_dbg_cmd_done | dec.io.dec_dbg_cmd_done
  val core_dbg_cmd_fail = dma_ctrl.io.dma_dbg_cmd_fail | dec.io.dec_dbg_cmd_fail
  val core_dbg_rddata = Mux(dma_ctrl.io.dma_dbg_cmd_done, dma_ctrl.io.dma_dbg_rddata, dec.io.dec_dbg_rddata)

  // AHB to AXI-4 still remaining


  // Lets start with IFU
  ifu.reset := io.core_rst_l
  ifu.io.scan_mode := io.scan_mode
  ifu.io.free_clk := free_clk
  ifu.io.active_clk := active_clk
  ifu.io.iccm_rd_data_ecc := io.iccm_rd_data_ecc
  ifu.io.dec_i0_decode_d := dec.io.dec_i0_decode_d
  ifu.io.exu_flush_final := dec.io.exu_flush_final
  ifu.io.dec_tlu_i0_commit_cmt := dec.io.dec_tlu_i0_commit_cmt
  ifu.io.dec_tlu_flush_err_wb := dec.io.dec_tlu_flush_err_r
  ifu.io.dec_tlu_flush_noredir_wb := dec.io.dec_tlu_flush_noredir_r
  ifu.io.exu_flush_path_final := exu.io.exu_flush_path_final
  ifu.io.dec_tlu_mrac_ff := dec.io.dec_tlu_mrac_ff
  ifu.io.dec_tlu_fence_i_wb := dec.io.dec_tlu_fence_i_r
  ifu.io.dec_tlu_flush_leak_one_wb := dec.io.dec_tlu_flush_leak_one_r
  ifu.io.dec_tlu_bpred_disable := dec.io.dec_tlu_bpred_disable
  ifu.io.dec_tlu_core_ecc_disable := dec.io.dec_tlu_core_ecc_disable
  ifu.io.dec_tlu_force_halt := dec.io.dec_tlu_force_halt
  ifu.io.ifu_axi_arready := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi_arready)
  ifu.io.ifu_axi_rvalid := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi_rvalid)
  ifu.io.ifu_axi_rid := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi_rid)
  ifu.io.ifu_axi_rdata := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi_rdata)
  ifu.io.ifu_axi_rresp := Mux(BUILD_AHB_LITE.B, 0.U, io.ifu_axi_rresp)
  ifu.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  ifu.io.dma_iccm_req := dma_ctrl.io.dma_iccm_req
  ifu.io.dma_mem_addr := dma_ctrl.io.dma_mem_addr
  ifu.io.dma_mem_sz := dma_ctrl.io.dma_mem_sz
  ifu.io.dma_mem_write := dma_ctrl.io.dma_mem_write
  ifu.io.dma_mem_wdata := dma_ctrl.io.dma_mem_wdata
  ifu.io.dma_mem_tag := dma_ctrl.io.dma_mem_tag
  ifu.io.dma_iccm_stall_any := dma_ctrl.io.dma_iccm_stall_any
  ifu.io.ic_rd_data := io.ic_rd_data
  ifu.io.ic_debug_rd_data := io.ic_debug_rd_data
  ifu.io.ictag_debug_rd_data := io.ictag_debug_rd_data
  ifu.io.ic_eccerr := io.ic_eccerr
  ifu.io.ic_parerr := io.ic_parerr
  ifu.io.ic_rd_hit := io.ic_rd_hit
  ifu.io.ic_tag_perr := io.ic_tag_perr
  ifu.io.iccm_rd_data := io.iccm_rd_data
  ifu.io.exu_mp_pkt <> exu.io.exu_mp_pkt
  ifu.io.exu_mp_eghr := exu.io.exu_mp_eghr
  ifu.io.exu_mp_fghr := exu.io.exu_mp_fghr
  ifu.io.exu_mp_index := exu.io.exu_mp_index
  ifu.io.exu_mp_btag := exu.io.exu_mp_btag
  ifu.io.dec_tlu_br0_r_pkt <> dec.io.dec_tlu_br0_r_pkt
  ifu.io.exu_i0_br_fghr_r := exu.io.exu_i0_br_fghr_r
  ifu.io.exu_i0_br_index_r := exu.io.exu_i0_br_index_r
  ifu.io.dec_tlu_flush_lower_wb := dec.io.dec_tlu_flush_lower_r
  ifu.io.dec_tlu_ic_diag_pkt <> dec.io.dec_tlu_ic_diag_pkt

  // Lets start with Dec
  dec.reset := io.core_rst_l
  dec.io.free_clk := free_clk
  dec.io.active_clk := active_clk
  dec.io.lsu_fastint_stall_any := lsu.io.lsu_fastint_stall_any
  dec.io.rst_vec := io.rst_vec
  dec.io.nmi_int := io.nmi_int
  dec.io.nmi_vec := io.nmi_vec
  dec.io.i_cpu_halt_req := io.i_cpu_halt_req
  dec.io.i_cpu_run_req := io.i_cpu_run_req
  dec.io.core_id := io.core_id
  dec.io.mpc_debug_halt_req := io.mpc_debug_halt_req
  dec.io.mpc_debug_run_req := io.mpc_debug_run_req
  dec.io.mpc_reset_run_req := io.mpc_reset_run_req
  dec.io.exu_pmu_i0_br_misp := exu.io.exu_pmu_i0_br_misp
  dec.io.exu_pmu_i0_br_ataken := exu.io.exu_pmu_i0_br_ataken
  dec.io.exu_pmu_i0_pc4 := exu.io.exu_pmu_i0_pc4
  dec.io.lsu_nonblock_load_valid_m := lsu.io.lsu_nonblock_load_valid_m
  dec.io.lsu_nonblock_load_tag_m := lsu.io.lsu_nonblock_load_tag_m
  dec.io.lsu_nonblock_load_inv_r := lsu.io.lsu_nonblock_load_inv_r
  dec.io.lsu_nonblock_load_inv_tag_r := lsu.io.lsu_nonblock_load_inv_tag_r
  dec.io.lsu_nonblock_load_data_valid := lsu.io.lsu_nonblock_load_data_valid
  dec.io.lsu_nonblock_load_data_error := lsu.io.lsu_nonblock_load_data_error
  dec.io.lsu_nonblock_load_data_tag := lsu.io.lsu_nonblock_load_data_tag
  dec.io.lsu_nonblock_load_data := lsu.io.lsu_nonblock_load_data
  dec.io.lsu_pmu_bus_trxn := lsu.io.lsu_pmu_bus_trxn
  dec.io.lsu_pmu_bus_misaligned := lsu.io.lsu_pmu_bus_misaligned
  dec.io.lsu_pmu_bus_error := lsu.io.lsu_pmu_bus_error
  dec.io.lsu_pmu_bus_busy := lsu.io.lsu_pmu_bus_busy
  dec.io.lsu_pmu_misaligned_m := lsu.io.lsu_pmu_misaligned_m
  dec.io.lsu_pmu_load_external_m := lsu.io.lsu_pmu_load_external_m
  dec.io.lsu_pmu_store_external_m := lsu.io.lsu_pmu_store_external_m
  dec.io.dma_pmu_dccm_read := dma_ctrl.io.dma_pmu_dccm_read
  dec.io.dma_pmu_dccm_write := dma_ctrl.io.dma_pmu_dccm_write
  dec.io.dma_pmu_any_read := dma_ctrl.io.dma_pmu_any_read
  dec.io.dma_pmu_any_write := dma_ctrl.io.dma_pmu_any_write
  dec.io.lsu_fir_addr := lsu.io.lsu_fir_addr
  dec.io.lsu_fir_error := lsu.io.lsu_fir_error
  dec.io.ifu_pmu_instr_aligned := ifu.io.ifu_pmu_instr_aligned
  dec.io.ifu_pmu_fetch_stall := ifu.io.ifu_pmu_fetch_stall
  dec.io.ifu_pmu_ic_miss := ifu.io.ifu_pmu_ic_miss
  dec.io.ifu_pmu_ic_hit := ifu.io.ifu_pmu_ic_hit
  dec.io.ifu_pmu_bus_error := ifu.io.ifu_pmu_bus_error
  dec.io.ifu_pmu_bus_busy := ifu.io.ifu_pmu_bus_busy
  dec.io.ifu_pmu_bus_trxn := ifu.io.ifu_pmu_bus_trxn
  dec.io.ifu_ic_error_start := ifu.io.ifu_ic_error_start
  dec.io.ifu_iccm_rd_ecc_single_err := ifu.io.ifu_iccm_rd_ecc_single_err
  dec.io.lsu_trigger_match_m := lsu.io.lsu_trigger_match_m
  dec.io.dbg_cmd_valid := dbg.io.dbg_cmd_valid
  dec.io.dbg_cmd_write := dbg.io.dbg_cmd_write
  dec.io.dbg_cmd_type := dbg.io.dbg_cmd_type
  dec.io.dbg_cmd_addr := dbg.io.dbg_cmd_addr
  dec.io.dbg_cmd_wrdata := dbg.io.dbg_cmd_wrdata
  dec.io.ifu_i0_icaf := ifu.io.ifu_i0_icaf
  dec.io.ifu_i0_icaf_type := ifu.io.ifu_i0_icaf_type
  dec.io.ifu_i0_icaf_f1 := ifu.io.ifu_i0_icaf_f1
  dec.io.ifu_i0_dbecc := ifu.io.ifu_i0_dbecc
  dec.io.lsu_idle_any := lsu.io.lsu_idle_any
  dec.io.i0_brp := ifu.io.i0_brp
  dec.io.ifu_i0_bp_index := ifu.io.ifu_i0_bp_index
  dec.io.ifu_i0_bp_fghr := ifu.io.ifu_i0_bp_fghr
  dec.io.ifu_i0_bp_btag := ifu.io.ifu_i0_bp_btag
  dec.io.lsu_error_pkt_r <> lsu.io.lsu_error_pkt_r
  dec.io.lsu_single_ecc_error_incr := lsu.io.lsu_single_ecc_error_incr
  dec.io.lsu_imprecise_error_load_any := lsu.io.lsu_imprecise_error_load_any
  dec.io.lsu_imprecise_error_store_any := lsu.io.lsu_imprecise_error_store_any
  dec.io.lsu_imprecise_error_addr_any := lsu.io.lsu_imprecise_error_addr_any
  dec.io.exu_div_result := exu.io.exu_div_result
  dec.io.exu_div_wren := exu.io.exu_div_wren
  dec.io.exu_csr_rs1_x := exu.io.exu_csr_rs1_x
  dec.io.lsu_result_m := lsu.io.lsu_result_m
  dec.io.lsu_result_corr_r := lsu.io.lsu_result_corr_r
  dec.io.lsu_load_stall_any := lsu.io.lsu_load_stall_any
  dec.io.lsu_store_stall_any := lsu.io.lsu_store_stall_any
  dec.io.dma_dccm_stall_any := dma_ctrl.io.dma_dccm_stall_any
  dec.io.dma_iccm_stall_any := dma_ctrl.io.dma_iccm_stall_any
  dec.io.iccm_dma_sb_error := ifu.io.iccm_dma_sb_error
  dec.io.exu_flush_final := exu.io.exu_flush_final
  dec.io.exu_npc_r := exu.io.exu_npc_r
  dec.io.exu_i0_result_x := exu.io.exu_i0_result_x
  dec.io.ifu_i0_valid := ifu.io.ifu_i0_valid
  dec.io.ifu_i0_instr := ifu.io.ifu_i0_instr
  dec.io.ifu_i0_pc := ifu.io.ifu_i0_pc
  dec.io.ifu_i0_pc4 := ifu.io.ifu_i0_pc4
  dec.io.exu_i0_pc_x := exu.io.exu_i0_pc_x
  dec.io.mexintpend := pic_ctl_inst.io.mexintpend
  dec.io.soft_int := io.soft_int
  dec.io.pic_claimid := pic_ctl_inst.io.claimid
  dec.io.pic_pl := pic_ctl_inst.io.pl
  dec.io.mhwakeup := pic_ctl_inst.io.mhwakeup
  dec.io.ifu_ic_debug_rd_data := ifu.io.ifu_ic_debug_rd_data
  dec.io.ifu_ic_debug_rd_data_valid := ifu.io.ifu_ic_debug_rd_data_valid
  dec.io.dbg_halt_req := dbg.io.dbg_halt_req
  dec.io.dbg_resume_req := dbg.io.dbg_resume_req
  dec.io.ifu_miss_state_idle := ifu.io.ifu_miss_state_idle
  dec.io.exu_i0_br_hist_r := exu.io.exu_i0_br_hist_r
  dec.io.exu_i0_br_error_r := exu.io.exu_i0_br_error_r
  dec.io.exu_i0_br_start_error_r := exu.io.exu_i0_br_start_error_r
  dec.io.exu_i0_br_valid_r := exu.io.exu_i0_br_valid_r
  dec.io.exu_i0_br_mp_r := exu.io.exu_i0_br_mp_r
  dec.io.exu_i0_br_middle_r := exu.io.exu_i0_br_middle_r
  dec.io.exu_i0_br_way_r := exu.io.exu_i0_br_way_r
  dec.io.ifu_i0_cinst := ifu.io.ifu_i0_cinst
  dec.io.timer_int := io.timer_int
  dec.io.scan_mode := io.scan_mode

  // EXU lets go
  exu.reset := io.core_rst_l
  exu.io.scan_mode := io.scan_mode
  exu.io.dec_data_en := dec.io.dec_data_en
  exu.io.dec_ctl_en := dec.io.dec_ctl_en
  exu.io.dbg_cmd_wrdata := dbg.io.dbg_cmd_wrdata
  exu.io.i0_ap := dec.io.i0_ap
  exu.io.dec_debug_wdata_rs1_d := dec.io.dec_debug_wdata_rs1_d
  exu.io.dec_i0_predict_p_d <> dec.io.dec_i0_predict_p_d
  exu.io.i0_predict_fghr_d := dec.io.i0_predict_fghr_d
  exu.io.i0_predict_index_d := dec.io.i0_predict_index_d
  exu.io.i0_predict_btag_d := dec.io.i0_predict_btag_d
  exu.io.dec_i0_rs1_en_d := dec.io.dec_i0_rs1_en_d
  exu.io.dec_i0_rs2_en_d := dec.io.dec_i0_rs2_en_d
  exu.io.gpr_i0_rs1_d := dec.io.gpr_i0_rs1_d
  exu.io.gpr_i0_rs2_d := dec.io.gpr_i0_rs2_d
  exu.io.dec_i0_immed_d := dec.io.dec_i0_immed_d
  exu.io.dec_i0_rs1_bypass_data_d := dec.io.dec_i0_rs1_bypass_data_d
  exu.io.dec_i0_rs2_bypass_data_d := dec.io.dec_i0_rs2_bypass_data_d
  exu.io.dec_i0_br_immed_d := dec.io.dec_i0_br_immed_d
  exu.io.dec_i0_alu_decode_d := dec.io.dec_i0_alu_decode_d
  exu.io.dec_i0_select_pc_d := dec.io.dec_i0_select_pc_d
  exu.io.dec_i0_pc_d := dec.io.dec_i0_pc_d
  exu.io.dec_i0_rs1_bypass_en_d := dec.io.dec_i0_rs1_bypass_en_d
  exu.io.dec_i0_rs2_bypass_en_d := dec.io.dec_i0_rs2_bypass_en_d
  exu.io.dec_csr_ren_d := dec.io.dec_csr_ren_d
  exu.io.mul_p <> dec.io.mul_p
  exu.io.div_p <> dec.io.div_p
  exu.io.dec_div_cancel := dec.io.dec_div_cancel
  exu.io.pred_correct_npc_x := dec.io.pred_correct_npc_x
  exu.io.dec_tlu_flush_lower_r := dec.io.dec_tlu_flush_lower_r
  exu.io.dec_tlu_flush_path_r := dec.io.dec_tlu_flush_path_r
  exu.io.dec_extint_stall := dec.io.dec_extint_stall
  exu.io.dec_tlu_meihap := dec.io.dec_tlu_meihap


  // LSU Lets go
  lsu.reset := io.core_rst_l
  lsu.io.clk_override := dec.io.dec_tlu_lsu_clk_override
  lsu.io.dec_tlu_flush_lower_r := dec.io.dec_tlu_flush_lower_r
  lsu.io.dec_tlu_i0_kill_writeb_r := dec.io.dec_tlu_i0_kill_writeb_r
  lsu.io.dec_tlu_force_halt := dec.io.dec_tlu_force_halt
  lsu.io.dec_tlu_external_ldfwd_disable := dec.io.dec_tlu_external_ldfwd_disable
  lsu.io.dec_tlu_wb_coalescing_disable := dec.io.dec_tlu_wb_coalescing_disable
  lsu.io.dec_tlu_sideeffect_posted_disable := dec.io.dec_tlu_sideeffect_posted_disable
  lsu.io.dec_tlu_core_ecc_disable := dec.io.dec_tlu_core_ecc_disable
  lsu.io.exu_lsu_rs1_d := exu.io.exu_lsu_rs1_d
  lsu.io.exu_lsu_rs2_d := exu.io.exu_lsu_rs2_d
  lsu.io.dec_lsu_offset_d := dec.io.dec_lsu_offset_d
  lsu.io.lsu_p <> dec.io.lsu_p
  lsu.io.dec_lsu_valid_raw_d := dec.io.dec_lsu_valid_raw_d
  lsu.io.dec_tlu_mrac_ff := dec.io.dec_tlu_mrac_ff
  lsu.io.trigger_pkt_any <> dec.io.trigger_pkt_any
  lsu.io.dccm_rd_data_lo := io.dccm_rd_data_lo
  lsu.io.dccm_rd_data_hi := io.dccm_rd_data_hi
  lsu.io.lsu_axi_awready := Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_awready)
  lsu.io.lsu_axi_wready :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_wready)
  lsu.io.lsu_axi_bvalid :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_bvalid)
  lsu.io.lsu_axi_bresp :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_bresp)
  lsu.io.lsu_axi_bid :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_bid)
  lsu.io.lsu_axi_arready :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_arready)
  lsu.io.lsu_axi_rvalid :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_rvalid)
  lsu.io.lsu_axi_rid :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_rid)
  lsu.io.lsu_axi_rdata :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_rdata)
  lsu.io.lsu_axi_rresp :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_rresp)
  lsu.io.lsu_axi_rlast :=  Mux(BUILD_AHB_LITE.B, 0.U, io.lsu_axi_rlast)
  lsu.io.lsu_bus_clk_en := io.lsu_bus_clk_en
  lsu.io.dma_dccm_req := dma_ctrl.io.dma_dccm_req
  lsu.io.dma_mem_tag := dma_ctrl.io.dma_mem_tag
  lsu.io.dma_mem_addr := dma_ctrl.io.dma_mem_addr
  lsu.io.dma_mem_sz := dma_ctrl.io.dma_mem_sz
  lsu.io.dma_mem_write := dma_ctrl.io.dma_mem_write
  lsu.io.dma_mem_wdata := dma_ctrl.io.dma_mem_wdata
  lsu.io.scan_mode := io.scan_mode
  lsu.io.free_clk := free_clk

  // Debug lets go
  dbg.reset := io.core_rst_l
  dbg.io.core_dbg_rddata := Mux(dma_ctrl.io.dma_dbg_cmd_done, dma_ctrl.io.dma_dbg_rddata, dec.io.dec_dbg_rddata)
  dbg.io.core_dbg_cmd_done := dma_ctrl.io.dma_dbg_cmd_done | dec.io.dec_dbg_cmd_done
  dbg.io.core_dbg_cmd_fail := dma_ctrl.io.dma_dbg_cmd_fail | dec.io.dec_dbg_cmd_fail
  dbg.io.dma_dbg_ready := dma_ctrl.io.dma_dbg_ready
  dbg.io.dec_tlu_debug_mode := dec.io.dec_tlu_debug_mode
  dbg.io.dec_tlu_dbg_halted := dec.io.dec_tlu_dbg_halted
  dbg.io.dec_tlu_mpc_halted_only := dec.io.dec_tlu_mpc_halted_only
  dbg.io.dec_tlu_resume_ack := dec.io.dec_tlu_resume_ack
  dbg.io.dmi_reg_en := io.dmi_reg_en
  dbg.io.dmi_reg_addr := io.dmi_reg_addr
  dbg.io.dmi_reg_wr_en := io.dmi_reg_wr_en
  dbg.io.dmi_reg_wdata := io.dmi_reg_wdata
  dbg.io.sb_axi_awready := io.sb_axi_awready
  dbg.io.sb_axi_wready := io.sb_axi_wready
  dbg.io.sb_axi_bvalid := io.sb_axi_bvalid
  dbg.io.sb_axi_bresp := io.sb_axi_bresp
  dbg.io.sb_axi_arready := io.sb_axi_arready
  dbg.io.sb_axi_rvalid := io.sb_axi_rvalid
  dbg.io.sb_axi_rdata := io.sb_axi_rdata
  dbg.io.sb_axi_rresp := io.sb_axi_rresp
  dbg.io.dbg_bus_clk_en := io.dbg_bus_clk_en
  dbg.io.dbg_rst_l := io.dbg_rst_l
  dbg.io.clk_override := dec.io.dec_tlu_misc_clk_override
  dbg.io.scan_mode := io.scan_mode


  // DMA Lets go
  dma_ctrl.reset := io.core_rst_l
  dma_ctrl.io.free_clk := free_clk
  dma_ctrl.io.dma_bus_clk_en := io.dma_bus_clk_en
  dma_ctrl.io.clk_override := dec.io.dec_tlu_misc_clk_override
  dma_ctrl.io.scan_mode := io.scan_mode
  dma_ctrl.io.dbg_cmd_addr := dbg.io.dbg_cmd_addr
  dma_ctrl.io.dbg_cmd_wrdata := dbg.io.dbg_cmd_wrdata
  dma_ctrl.io.dbg_cmd_valid := dbg.io.dbg_cmd_valid
  dma_ctrl.io.dbg_cmd_write := dbg.io.dbg_cmd_write
  dma_ctrl.io.dbg_cmd_type := dbg.io.dbg_cmd_type
  dma_ctrl.io.dbg_cmd_size := dbg.io.dbg_cmd_size
  dma_ctrl.io.dbg_dma_bubble := dbg.io.dbg_dma_bubble
  dma_ctrl.io.dccm_dma_rvalid := lsu.io.dccm_dma_rvalid
  dma_ctrl.io.dccm_dma_ecc_error := lsu.io.dccm_dma_ecc_error
  dma_ctrl.io.dccm_dma_rtag := lsu.io.dccm_dma_rtag
  dma_ctrl.io.dccm_dma_rdata := lsu.io.dccm_dma_rdata
  dma_ctrl.io.iccm_dma_rvalid := ifu.io.iccm_dma_rvalid
  dma_ctrl.io.iccm_dma_rtag := ifu.io.iccm_dma_rtag
  dma_ctrl.io.iccm_dma_rdata := ifu.io.iccm_dma_rdata
  dma_ctrl.io.dccm_ready := lsu.io.dccm_ready
  dma_ctrl.io.iccm_ready := ifu.io.iccm_ready
  dma_ctrl.io.dec_tlu_dma_qos_prty := dec.io.dec_tlu_dma_qos_prty
  dma_ctrl.io.dma_axi_awvalid := io.dma_axi_awvalid
  dma_ctrl.io.dma_axi_awid := io.dma_axi_awid
  dma_ctrl.io.dma_axi_awaddr := io.dma_axi_awaddr
  dma_ctrl.io.dma_axi_awsize := io.dma_axi_awsize
  dma_ctrl.io.dma_axi_wvalid := io.dma_axi_wvalid
  dma_ctrl.io.dma_axi_wdata := io.dma_axi_wdata
  dma_ctrl.io.dma_axi_wstrb := io.dma_axi_wstrb
  dma_ctrl.io.dma_axi_bready := io.dma_axi_bready
  dma_ctrl.io.dma_axi_arvalid := io.dma_axi_arvalid
  dma_ctrl.io.dma_axi_arid := io.dma_axi_arid
  dma_ctrl.io.dma_axi_araddr := io.dma_axi_araddr
  dma_ctrl.io.dma_axi_arsize := io.dma_axi_arsize
  dma_ctrl.io.dma_axi_rready := io.dma_axi_rready
  dma_ctrl.io.iccm_dma_ecc_error := ifu.io.iccm_dma_ecc_error


  // PIC lets go
  pic_ctl_inst.io.scan_mode := io.scan_mode
  pic_ctl_inst.reset := io.core_rst_l
  pic_ctl_inst.io.free_clk := free_clk
  pic_ctl_inst.io.active_clk := active_clk
  pic_ctl_inst.io.clk_override := dec.io.dec_tlu_pic_clk_override
  pic_ctl_inst.io.extintsrc_req := io.extintsrc_req
  pic_ctl_inst.io.picm_rdaddr := lsu.io.picm_rdaddr
  pic_ctl_inst.io.picm_wraddr := lsu.io.picm_wraddr
  pic_ctl_inst.io.picm_wr_data := lsu.io.picm_wr_data
  pic_ctl_inst.io.picm_wren := lsu.io.picm_wren
  pic_ctl_inst.io.picm_rden := lsu.io.picm_rden
  pic_ctl_inst.io.picm_mken := lsu.io.picm_mken
  pic_ctl_inst.io.meicurpl := dec.io.dec_tlu_meicurpl
  pic_ctl_inst.io.meipt := dec.io.dec_tlu_meipt
  lsu.io.picm_rd_data := pic_ctl_inst.io.picm_rd_data



  // Trace Packet

  io.trace_rv_i_insn_ip := dec.io.rv_trace_pkt.rv_i_insn_ip
  io.trace_rv_i_address_ip := dec.io.rv_trace_pkt.rv_i_address_ip
  io.trace_rv_i_valid_ip := dec.io.rv_trace_pkt.rv_i_valid_ip
  io.trace_rv_i_exception_ip := dec.io.rv_trace_pkt.rv_i_exception_ip
  io.trace_rv_i_ecause_ip := dec.io.rv_trace_pkt.rv_i_ecause_ip
  io.trace_rv_i_interrupt_ip := dec.io.rv_trace_pkt.rv_i_interrupt_ip
  io.trace_rv_i_tval_ip := dec.io.rv_trace_pkt.rv_i_tval_ip


  // Outputs
  io.dccm_clk_override := dec.io.dec_tlu_dccm_clk_override
  io.icm_clk_override := dec.io.dec_tlu_icm_clk_override
  io.dec_tlu_core_ecc_disable := dec.io.dec_tlu_core_ecc_disable
  io.o_cpu_halt_ack := dec.io.o_cpu_halt_ack
  io.o_cpu_halt_status := dec.io.o_cpu_halt_status
  io.o_cpu_run_ack := dec.io.o_cpu_run_ack
  io.o_debug_mode_status := dec.io.o_debug_mode_status
  io.mpc_debug_halt_ack := dec.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack := dec.io.mpc_debug_run_ack
  io.debug_brkpt_status := dec.io.debug_brkpt_status
  io.dec_tlu_perfcnt0 := dec.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1 := dec.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2 := dec.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3 := dec.io.dec_tlu_perfcnt3
  // LSU Outputs
  io.dccm_wren := lsu.io.dccm_wren
  io.dccm_rden := lsu.io.dccm_rden
  io.dccm_wr_addr_lo := lsu.io.dccm_wr_addr_lo
  io.dccm_wr_addr_hi := lsu.io.dccm_wr_addr_hi
  io.dccm_rd_addr_lo := lsu.io.dccm_rd_addr_lo
  io.dccm_rd_addr_hi := lsu.io.dccm_rd_addr_hi
  io.dccm_wr_data_lo := lsu.io.dccm_wr_data_lo
  io.dccm_wr_data_hi := lsu.io.dccm_wr_data_hi
  // IFU Outputs
  io.iccm_rw_addr := ifu.io.iccm_rw_addr
  io.iccm_wren := ifu.io.iccm_wren
  io.iccm_rden := ifu.io.iccm_rden
  io.iccm_wr_size := ifu.io.iccm_wr_size
  io.iccm_wr_data := ifu.io.iccm_wr_data
  io.iccm_buf_correct_ecc := ifu.io.iccm_buf_correct_ecc
  io.iccm_correction_state := ifu.io.iccm_correction_state
  io.ic_rw_addr := ifu.io.ic_rw_addr
  io.ic_tag_valid := ifu.io.ic_tag_valid
  io.ic_wr_en := ifu.io.ic_wr_en
  io.ic_rd_en := ifu.io.ic_rd_en
  io.ic_wr_data := ifu.io.ic_wr_data
  io.ic_debug_wr_data := ifu.io.ic_debug_wr_data
  io.ic_premux_data := ifu.io.ic_premux_data
  io.ic_sel_premux_data := ifu.io.ic_sel_premux_data
  io.ic_debug_addr := ifu.io.ic_debug_addr
  io.ic_debug_rd_en := ifu.io.ic_debug_rd_en
  io.ic_debug_wr_en := ifu.io.ic_debug_wr_en
  io.ic_debug_tag_array := ifu.io.ic_debug_tag_array
  io.ic_debug_way := ifu.io.ic_debug_way

  // AXI LSU SIDE
  io.lsu_axi_awvalid := lsu.io.lsu_axi_awvalid
  io.lsu_axi_awid := lsu.io.lsu_axi_awid
  io.lsu_axi_awaddr := lsu.io.lsu_axi_awaddr
  io.lsu_axi_awregion := lsu.io.lsu_axi_awregion
  io.lsu_axi_awlen := lsu.io.lsu_axi_awlen
  io.lsu_axi_awsize := lsu.io.lsu_axi_awsize
  io.lsu_axi_awburst := lsu.io.lsu_axi_awburst
  io.lsu_axi_awlock := lsu.io.lsu_axi_awlock
  io.lsu_axi_awcache := lsu.io.lsu_axi_awcache
  io.lsu_axi_awprot := lsu.io.lsu_axi_awprot
  io.lsu_axi_awqos := lsu.io.lsu_axi_awqos
  io.lsu_axi_wvalid := lsu.io.lsu_axi_wvalid
  io.lsu_axi_wdata := lsu.io.lsu_axi_wdata
  io.lsu_axi_wstrb := lsu.io.lsu_axi_wstrb
  io.lsu_axi_wlast := lsu.io.lsu_axi_wlast
  io.lsu_axi_bready := lsu.io.lsu_axi_bready
  io.lsu_axi_arvalid := lsu.io.lsu_axi_arvalid
  io.lsu_axi_arid := lsu.io.lsu_axi_arid
  io.lsu_axi_araddr := lsu.io.lsu_axi_araddr
  io.lsu_axi_arregion := lsu.io.lsu_axi_arregion
  io.lsu_axi_arlen := lsu.io.lsu_axi_arlen
  io.lsu_axi_arsize := lsu.io.lsu_axi_arsize
  io.lsu_axi_arburst := lsu.io.lsu_axi_arburst
  io.lsu_axi_arlock := lsu.io.lsu_axi_arlock
  io.lsu_axi_arcache := lsu.io.lsu_axi_arcache
  io.lsu_axi_arprot := lsu.io.lsu_axi_arprot
  io.lsu_axi_arqos := lsu.io.lsu_axi_arqos
  io.lsu_axi_rready := lsu.io.lsu_axi_rready

  // AXI IFU
  io.ifu_axi_awvalid := ifu.io.ifu_axi_awvalid
  io.ifu_axi_awid := ifu.io.ifu_axi_awid
  io.ifu_axi_awaddr := ifu.io.ifu_axi_awaddr
  io.ifu_axi_awregion := ifu.io.ifu_axi_awregion
  io.ifu_axi_awlen := ifu.io.ifu_axi_awlen
  io.ifu_axi_awsize := ifu.io.ifu_axi_awsize
  io.ifu_axi_awburst := ifu.io.ifu_axi_awburst
  io.ifu_axi_awlock := ifu.io.ifu_axi_awlock
  io.ifu_axi_awcache := ifu.io.ifu_axi_awcache
  io.ifu_axi_awprot := ifu.io.ifu_axi_awprot
  io.ifu_axi_awqos := ifu.io.ifu_axi_awqos
  io.ifu_axi_wvalid := ifu.io.ifu_axi_wvalid
  io.ifu_axi_wdata := ifu.io.ifu_axi_wdata
  io.ifu_axi_wstrb := ifu.io.ifu_axi_wstrb
  io.ifu_axi_wlast := ifu.io.ifu_axi_wlast
  io.ifu_axi_bready := ifu.io.ifu_axi_bready
  io.ifu_axi_arvalid := ifu.io.ifu_axi_arvalid
  io.ifu_axi_arid := ifu.io.ifu_axi_arid
  io.ifu_axi_araddr := ifu.io.ifu_axi_araddr
  io.ifu_axi_arregion := ifu.io.ifu_axi_arregion
  io.ifu_axi_arlen := ifu.io.ifu_axi_arlen
  io.ifu_axi_arsize := ifu.io.ifu_axi_arsize
  io.ifu_axi_arburst := ifu.io.ifu_axi_arburst
  io.ifu_axi_arlock := ifu.io.ifu_axi_arlock
  io.ifu_axi_arcache := ifu.io.ifu_axi_arcache
  io.ifu_axi_arprot := ifu.io.ifu_axi_arprot
  io.ifu_axi_arqos := ifu.io.ifu_axi_arqos
  io.ifu_axi_rready := ifu.io.ifu_axi_rready


  // AXI SB Signals
  io.sb_axi_awvalid := dbg.io.sb_axi_awvalid
  io.sb_axi_awid := dbg.io.sb_axi_awid
  io.sb_axi_awaddr := dbg.io.sb_axi_awaddr
  io.sb_axi_awregion := dbg.io.sb_axi_awregion
  io.sb_axi_awlen := dbg.io.sb_axi_awlen
  io.sb_axi_awsize := dbg.io.sb_axi_awsize
  io.sb_axi_awburst := dbg.io.sb_axi_awburst
  io.sb_axi_awlock := dbg.io.sb_axi_awlock
  io.sb_axi_awcache := dbg.io.sb_axi_awcache
  io.sb_axi_awprot := dbg.io.sb_axi_awprot
  io.sb_axi_awqos := dbg.io.sb_axi_awqos
  io.sb_axi_wvalid := dbg.io.sb_axi_wvalid
  io.sb_axi_wdata := dbg.io.sb_axi_wdata
  io.sb_axi_wstrb := dbg.io.sb_axi_wstrb
  io.sb_axi_wlast := dbg.io.sb_axi_wlast
  io.sb_axi_bready := dbg.io.sb_axi_bready
  io.sb_axi_arvalid := dbg.io.sb_axi_arvalid
  io.sb_axi_arid := dbg.io.sb_axi_arid
  io.sb_axi_araddr := dbg.io.sb_axi_araddr
  io.sb_axi_arregion := dbg.io.sb_axi_arregion
  io.sb_axi_arlen := dbg.io.sb_axi_arlen
  io.sb_axi_arsize := dbg.io.sb_axi_arsize
  io.sb_axi_arburst := dbg.io.sb_axi_arburst
  io.sb_axi_arlock := dbg.io.sb_axi_arlock
  io.sb_axi_arcache := dbg.io.sb_axi_arcache
  io.sb_axi_arprot := dbg.io.sb_axi_arprot
  io.sb_axi_arqos := dbg.io.sb_axi_arqos
  io.sb_axi_rready := dbg.io.sb_axi_rready

  // DMA Output Signals
  io.dma_axi_awready := dma_ctrl.io.dma_axi_awready
  io.dma_axi_wready := dma_ctrl.io.dma_axi_wready
  io.dma_axi_bvalid := dma_ctrl.io.dma_axi_bvalid
  io.dma_axi_bresp := dma_ctrl.io.dma_axi_bresp
  io.dma_axi_bid := dma_ctrl.io.dma_axi_bid
  io.dma_axi_arready := dma_ctrl.io.dma_axi_arready
  io.dma_axi_rvalid := dma_ctrl.io.dma_axi_rvalid
  io.dma_axi_rid := dma_ctrl.io.dma_axi_rid
  io.dma_axi_rdata := dma_ctrl.io.dma_axi_rdata
  io.dma_axi_rresp := dma_ctrl.io.dma_axi_rresp
  io.dma_axi_rlast := dma_ctrl.io.dma_axi_rlast

  // AHB Signals
  io.hburst := 0.U
  io.hmastlock := 0.U
  io.hprot := 0.U
  io.hsize := 0.U
  io.htrans := 0.U
  io.hwrite := 0.U
  io.haddr := 0.U

  io.lsu_haddr := 0.U
  io.lsu_hburst := 0.U
  io.lsu_hmastlock := 0.U
  io.lsu_hprot := 0.U
  io.lsu_hsize := 0.U
  io.lsu_htrans := 0.U
  io.lsu_hwrite := 0.U
  io.lsu_hwdata := 0.U


  io.sb_haddr := 0.U
  io.sb_hburst := 0.U
  io.sb_hmastlock := 0.U
  io.sb_hprot := 0.U
  io.sb_hsize := 0.U
  io.sb_htrans := 0.U
  io.sb_hwrite := 0.U
  io.sb_hwdata := 0.U

  io.dma_hrdata := 0.U
  io.dma_hreadyout := 0.U
  io.dma_hresp := 0.U

  io.ifu_axi_wready := 0.U

  io.dma_hresp := 0.U //dbg.io.dma_hresp

  io.dmi_reg_rdata := 0.U

}

object SWERV extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_swerv()))
}



