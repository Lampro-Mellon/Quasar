import chisel3._
import el2_mem._
import chisel3.util._
import dmi._
import lib._
class el2_swerv_wrapper extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val dbg_rst_l = Input(AsyncReset())
    val rst_vec = Input(UInt(31.W))
    val nmi_int = Input(Bool())
    val nmi_vec = Input(UInt(31.W))
    val jtag_id = Input(UInt(31.W))

    val trace_rv_i_insn_ip = Output(UInt(32.W))
    val trace_rv_i_address_ip = Output(UInt(32.W))
    val trace_rv_i_valid_ip = Output(UInt(2.W))
    val trace_rv_i_exception_ip = Output(UInt(2.W))
    val trace_rv_i_ecause_ip = Output(UInt(5.W))
    val trace_rv_i_interrupt_ip = Output(UInt(2.W))
    val trace_rv_i_tval_ip = Output(UInt(32.W))

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
    val ifu_axi_wready = Input(Bool())
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
    val dma_axi_awlen         = Input(UInt(8.W))
    val dma_axi_awburst       = Input(UInt(2.W))

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
//    val haddr = Output(UInt(32.W))
//    val hburst = Output(UInt(3.W))
//    val hmastlock = Output(Bool())
//    val hprot = Output(UInt(4.W))
//    val hsize = Output(UInt(3.W))
//    val htrans = Output(UInt(2.W))
//    val hwrite = Output(Bool())
//    val hrdata = Input(UInt(64.W))
//    val hready = Input(Bool())
//    val hresp = Input(Bool())
//
//    // AHB Master
//    val lsu_haddr = Output(UInt(32.W))
//    val lsu_hburst = Output(UInt(3.W))
//    val lsu_hmastlock = Output(Bool())
//    val lsu_hprot = Output(UInt(4.W))
//    val lsu_hsize = Output(UInt(3.W))
//    val lsu_htrans = Output(UInt(2.W))
//    val lsu_hwrite = Output(Bool())
//    val lsu_hwdata = Output(UInt(64.W))
//    val lsu_hrdata = Input(UInt(64.W))
//    val lsu_hready = Input(Bool())
//    val lsu_hresp = Input(Bool())

    // System Bus Debug Master
//    val sb_haddr = Output(UInt(32.W))
//    val sb_hburst = Output(UInt(3.W))
//    val sb_hmastlock = Output(Bool())
//    val sb_hprot = Output(UInt(4.W))
//    val sb_hsize = Output(UInt(3.W))
//    val sb_htrans = Output(UInt(2.W))
//    val sb_hwrite = Output(Bool())
//    val sb_hwdata = Output(UInt(64.W))
//    val sb_hrdata = Input(UInt(64.W))
//    val sb_hready = Input(Bool())
//    val sb_hresp = Input(Bool())

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

    val timer_int = Input(Bool())
    val soft_int = Input(Bool())

    val extintsrc_req = Input(UInt(PIC_TOTAL_INT.W))

    val dec_tlu_perfcnt0 = Output(Bool())
    val dec_tlu_perfcnt1 = Output(Bool())
    val dec_tlu_perfcnt2 = Output(Bool())
    val dec_tlu_perfcnt3 = Output(Bool())

    val jtag_tck = Input(Clock())
    val jtag_tms = Input(Bool())
    val jtag_tdi = Input(Bool())
    val jtag_trst_n = Input(Bool())
    val jtag_tdo = Output(Bool())

    val core_id = Input(UInt(28.W))

    val mpc_debug_halt_req = Input(Bool())
    val mpc_debug_run_req = Input(Bool())
    val mpc_reset_run_req = Input(Bool())
    val mpc_debug_halt_ack = Output(Bool())
    val mpc_debug_run_ack = Output(Bool())
    val debug_brkpt_status = Output(Bool())

    val i_cpu_halt_req = Input(Bool())
    val i_cpu_run_req = Input(Bool())
    val o_cpu_halt_ack = Output(Bool())
    val o_cpu_halt_status = Output(Bool())
    val o_debug_mode_status = Output(Bool())
    val o_cpu_run_ack = Output(Bool())
    val mbist_mode = Input(Bool())

    val scan_mode = Input(Bool())

    // AHB signals
  /*val haddr = Output(UInt(32.W))
  val hburst = Output(UInt(3.W))
  val hmastlock = Output(Bool())
  val hprot = Output(UInt(4.W))
  val hsize = Output(UInt(3.W))
  val htrans = Output(UInt(2.W))
  val hwrite = Output(Bool())

  val hrdata = Input(UInt(64.W))
  val hready = Input(Bool())
  val hresp = Input(Bool())

  // LSU AHB Master
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
  // Debug Syster Bus AHB
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

  // DMA Slave
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
  */
})
  val mem = Module(new waleed.el2_mem())
  val dmi_wrapper = Module(new dmi_wrapper())
  val swerv = Module(new el2_swerv())
  dmi_wrapper.io.trst_n := io.jtag_trst_n
  dmi_wrapper.io.tck := io.jtag_tck
  dmi_wrapper.io.tms := io.jtag_tms
  dmi_wrapper.io.tdi := io.jtag_tdi
  dmi_wrapper.io.core_clk := clock
  dmi_wrapper.io.jtag_id := io.jtag_id
  dmi_wrapper.io.rd_data := swerv.io.dmi_reg_rdata


  dmi_wrapper.io.core_rst_n := io.dbg_rst_l
  swerv.io.dmi_reg_wdata := dmi_wrapper.io.reg_wr_data
  swerv.io.dmi_reg_addr := dmi_wrapper.io.reg_wr_addr
  swerv.io.dmi_reg_en := dmi_wrapper.io.reg_en
  swerv.io.dmi_reg_wr_en := dmi_wrapper.io.reg_wr_en
  swerv.io.dmi_hard_reset := dmi_wrapper.io.dmi_hard_reset
  io.jtag_tdo := dmi_wrapper.io.tdo

  // Memory signals
  mem.io.dccm_clk_override := swerv.io.dccm_clk_override
  mem.io.icm_clk_override := swerv.io.icm_clk_override
  mem.io.dec_tlu_core_ecc_disable := swerv.io.dec_tlu_core_ecc_disable
  mem.io.dccm_wren := swerv.io.dccm_wren
  mem.io.dccm_rden := swerv.io.dccm_rden
  mem.io.dccm_wr_addr_lo := swerv.io.dccm_wr_addr_lo
  mem.io.dccm_wr_addr_hi := swerv.io.dccm_wr_addr_hi
  mem.io.dccm_rd_addr_lo := swerv.io.dccm_rd_addr_lo

  mem.io.dccm_wr_data_lo := swerv.io.dccm_wr_data_lo
  mem.io.dccm_wr_data_hi := swerv.io.dccm_wr_data_hi
  swerv.io.dccm_rd_data_lo := mem.io.dccm_rd_data_lo
  mem.io.dccm_rd_addr_hi := swerv.io.dccm_rd_addr_hi
  mem.io.iccm_rw_addr := swerv.io.iccm_rw_addr
  mem.io.iccm_buf_correct_ecc := swerv.io.iccm_buf_correct_ecc
  mem.io.iccm_correction_state := swerv.io.iccm_correction_state
  mem.io.iccm_wren := swerv.io.iccm_wren
  mem.io.iccm_rden := swerv.io.iccm_rden
  mem.io.iccm_wr_size := swerv.io.iccm_wr_size
  mem.io.iccm_wr_data := swerv.io.iccm_wr_data


  mem.io.ic_rw_addr := swerv.io.ic_rw_addr
  mem.io.ic_tag_valid := swerv.io.ic_tag_valid
  mem.io.ic_wr_en := swerv.io.ic_wr_en
  mem.io.ic_rd_en := swerv.io.ic_rd_en
  mem.io.ic_premux_data := swerv.io.ic_premux_data
  mem.io.ic_sel_premux_data := swerv.io.ic_sel_premux_data
  mem.io.ic_wr_data := swerv.io.ic_wr_data
  mem.io.ic_debug_wr_data := swerv.io.ic_debug_wr_data

  mem.io.ic_debug_addr := swerv.io.ic_debug_addr
  mem.io.ic_debug_rd_en := swerv.io.ic_debug_rd_en
  mem.io.ic_debug_wr_en := swerv.io.ic_debug_wr_en
  mem.io.ic_debug_tag_array := swerv.io.ic_debug_tag_array
  mem.io.ic_debug_way := swerv.io.ic_debug_way
  mem.io.rst_l := reset
  mem.io.clk := clock
  mem.io.scan_mode := io.scan_mode
  // Memory outputs
  swerv.io.dbg_rst_l := io.dbg_rst_l
  swerv.io.iccm_rd_data_ecc := mem.io.iccm_rd_data_ecc
  swerv.io.dccm_rd_data_hi := mem.io.dccm_rd_data_hi
  swerv.io.ic_rd_data := mem.io.ic_rd_data
  swerv.io.ictag_debug_rd_data := mem.io.ictag_debug_rd_data
  swerv.io.ic_eccerr := mem.io.ic_eccerr
  swerv.io.ic_parerr := mem.io.ic_parerr
  swerv.io.ic_rd_hit := mem.io.ic_rd_hit
  swerv.io.ic_tag_perr := mem.io.ic_tag_perr
  swerv.io.ic_debug_rd_data := mem.io.ic_debug_rd_data
  swerv.io.iccm_rd_data := mem.io.iccm_rd_data
  swerv.io.sb_hready := 0.U
  swerv.io.hrdata := 0.U
  swerv.io.sb_hresp := 0.U
  swerv.io.lsu_hrdata := 0.U
  swerv.io.lsu_hresp := 0.U
  swerv.io.lsu_hready := 0.U
  swerv.io.hready := 0.U
  swerv.io.hresp := 0.U
  swerv.io.sb_hrdata := 0.U
  swerv.io.scan_mode := io.scan_mode
  // SweRV Inputs
  swerv.io.dbg_rst_l := io.dbg_rst_l
  swerv.io.rst_vec := io.rst_vec
  swerv.io.nmi_int := io.nmi_int
  swerv.io.nmi_vec := io.nmi_vec

  // external halt/run interface
  swerv.io.i_cpu_halt_req := io.i_cpu_halt_req
  swerv.io.i_cpu_run_req := io.i_cpu_run_req
  swerv.io.core_id := io.core_id

  // external MPC halt/run interface
  swerv.io.mpc_debug_halt_req := io.mpc_debug_halt_req
  swerv.io.mpc_debug_run_req := io.mpc_debug_run_req
  swerv.io.mpc_reset_run_req := io.mpc_reset_run_req

  //-------------------------- LSU AXI signals--------------------------
  // AXI Write Channels
  swerv.io.lsu_axi_awready := io.lsu_axi_awready
  swerv.io.lsu_axi_wready := io.lsu_axi_wready

  swerv.io.lsu_axi_bvalid := io.lsu_axi_bvalid
  swerv.io.lsu_axi_bresp := io.lsu_axi_bresp
  swerv.io.lsu_axi_bid := io.lsu_axi_bid

  // AXI Read Channels
  swerv.io.lsu_axi_arready := io.lsu_axi_arready
  swerv.io.lsu_axi_rvalid := io.lsu_axi_rvalid
  swerv.io.lsu_axi_rid := io.lsu_axi_rid
  swerv.io.lsu_axi_rdata := io.lsu_axi_rdata
  swerv.io.lsu_axi_rresp := io.lsu_axi_rresp
  swerv.io.lsu_axi_rlast := io.lsu_axi_rlast

  //-------------------------- IFU AXI signals--------------------------
  // AXI Write Channels
  swerv.io.ifu_axi_awready := io.ifu_axi_awready
  swerv.io.ifu_axi_wready := io.ifu_axi_wready
  swerv.io.ifu_axi_bvalid := io.ifu_axi_bvalid
  swerv.io.ifu_axi_bresp := io.ifu_axi_bresp
  swerv.io.ifu_axi_bid := io.ifu_axi_bid

  // AXI Read Channels
  swerv.io.ifu_axi_arready := io.ifu_axi_arready
  swerv.io.ifu_axi_rvalid := io.ifu_axi_rvalid
  swerv.io.ifu_axi_rid := io.ifu_axi_rid
  swerv.io.ifu_axi_rdata := io.ifu_axi_rdata
  swerv.io.ifu_axi_rresp := io.ifu_axi_rresp
  swerv.io.ifu_axi_rlast := io.ifu_axi_rlast

  //-------------------------- SB AXI signals--------------------------
  // AXI Write Channels
  swerv.io.sb_axi_awready := io.sb_axi_awready
  swerv.io.sb_axi_wready := io.sb_axi_wready

  swerv.io.sb_axi_bvalid := io.sb_axi_bvalid
  swerv.io.sb_axi_bresp := io.sb_axi_bresp
  swerv.io.sb_axi_bid := io.sb_axi_bid

  // AXI Read Channels
  swerv.io.sb_axi_arready := io.sb_axi_arready
  swerv.io.sb_axi_rvalid := io.sb_axi_rvalid
  swerv.io.sb_axi_rid := io.sb_axi_rid
  swerv.io.sb_axi_rdata := io.sb_axi_rdata
  swerv.io.sb_axi_rresp := io.sb_axi_rresp
  swerv.io.sb_axi_rlast := io.sb_axi_rlast

  //-------------------------- DMA AXI signals--------------------------
  // AXI Write Channels
  swerv.io.dma_axi_awvalid := io.dma_axi_awvalid
  swerv.io.dma_axi_awid := io.dma_axi_awid
  swerv.io.dma_axi_awaddr := io.dma_axi_awaddr
  swerv.io.dma_axi_awsize := io.dma_axi_awsize
  swerv.io.dma_axi_awprot := io.dma_axi_awprot
  swerv.io.dma_axi_awlen := io.dma_axi_awlen
  swerv.io.dma_axi_awburst := io.dma_axi_awburst

  swerv.io.dma_axi_wvalid := io.dma_axi_wvalid
  swerv.io.dma_axi_wdata := io.dma_axi_wdata
  swerv.io.dma_axi_wstrb := io.dma_axi_wstrb
  swerv.io.dma_axi_wlast := io.dma_axi_wlast
  swerv.io.dma_axi_bready := io.dma_axi_bready

  // AXI Read Channels
  swerv.io.dma_axi_arvalid := io.dma_axi_arvalid
  swerv.io.dma_axi_arid := io.dma_axi_arid
  swerv.io.dma_axi_araddr := io.dma_axi_araddr
  swerv.io.dma_axi_arsize := io.dma_axi_arsize
  swerv.io.dma_axi_arprot := io.dma_axi_arprot
  swerv.io.dma_axi_arlen := io.dma_axi_arlen
  swerv.io.dma_axi_arburst := io.dma_axi_arburst
  swerv.io.dma_axi_rready := io.dma_axi_rready

  // DMA Slave
  swerv.io.dma_hsel := io.dma_hsel
  swerv.io.dma_haddr := io.dma_haddr
  swerv.io.dma_hburst := io.dma_hburst
  swerv.io.dma_hmastlock := io.dma_hmastlock
  swerv.io.dma_hprot := io.dma_hprot
  swerv.io.dma_hsize := io.dma_hsize
  swerv.io.dma_htrans := io.dma_htrans
  swerv.io.dma_hwrite := io.dma_hwrite
  swerv.io.dma_hwdata := io.dma_hwdata
  swerv.io.dma_hreadyin := io.dma_hreadyin

  swerv.io.lsu_bus_clk_en
  swerv.io.ifu_bus_clk_en
  swerv.io.dbg_bus_clk_en
  swerv.io.dma_bus_clk_en

  swerv.io.dmi_reg_en
  swerv.io.dmi_reg_addr
  swerv.io.dmi_reg_wr_en
  swerv.io.dmi_reg_wdata
  swerv.io.dmi_hard_reset

  swerv.io.extintsrc_req
  swerv.io.timer_int
  swerv.io.soft_int
  swerv.io.scan_mode

  swerv.io.lsu_bus_clk_en := io.lsu_bus_clk_en
  swerv.io.ifu_bus_clk_en := io.ifu_bus_clk_en
  swerv.io.dbg_bus_clk_en := io.dbg_bus_clk_en
  swerv.io.dma_bus_clk_en := io.dma_bus_clk_en

  swerv.io.timer_int := io.timer_int
  swerv.io.soft_int := io.soft_int
  swerv.io.extintsrc_req := io.extintsrc_req

  // Outputs
  val core_rst_l = swerv.io.core_rst_l
  io.trace_rv_i_insn_ip := swerv.io.trace_rv_i_insn_ip
  io.trace_rv_i_address_ip := swerv.io.trace_rv_i_address_ip
  io.trace_rv_i_valid_ip := swerv.io.trace_rv_i_valid_ip
  io.trace_rv_i_exception_ip := swerv.io.trace_rv_i_exception_ip
  io.trace_rv_i_ecause_ip := swerv.io.trace_rv_i_ecause_ip
  io.trace_rv_i_interrupt_ip := swerv.io.trace_rv_i_interrupt_ip
  io.trace_rv_i_tval_ip := swerv.io.trace_rv_i_tval_ip

  // external halt/run interface
  io.o_cpu_halt_ack := swerv.io.o_cpu_halt_ack
  io.o_cpu_halt_status := swerv.io.o_cpu_halt_status
  io.o_cpu_run_ack := swerv.io.o_cpu_run_ack
  io.o_debug_mode_status := swerv.io.o_debug_mode_status

  io.mpc_debug_halt_ack := swerv.io.mpc_debug_halt_ack
  io.mpc_debug_run_ack := swerv.io.mpc_debug_run_ack
  io.debug_brkpt_status := swerv.io.debug_brkpt_status

  io.dec_tlu_perfcnt0 := swerv.io.dec_tlu_perfcnt0
  io.dec_tlu_perfcnt1 := swerv.io.dec_tlu_perfcnt1
  io.dec_tlu_perfcnt2 := swerv.io.dec_tlu_perfcnt2
  io.dec_tlu_perfcnt3 := swerv.io.dec_tlu_perfcnt3


  //-------------------------- LSU AXI signals--------------------------
  // AXI Write Channels
  io.lsu_axi_awvalid := swerv.io.lsu_axi_awvalid
  io.lsu_axi_awid := swerv.io.lsu_axi_awid
  io.lsu_axi_awaddr := swerv.io.lsu_axi_awaddr
  io.lsu_axi_awregion := swerv.io.lsu_axi_awregion
  io.lsu_axi_awlen := swerv.io.lsu_axi_awlen
  io.lsu_axi_awsize := swerv.io.lsu_axi_awsize
  io.lsu_axi_awburst := swerv.io.lsu_axi_awburst
  io.lsu_axi_awlock := swerv.io.lsu_axi_awlock
  io.lsu_axi_awcache := swerv.io.lsu_axi_awcache
  io.lsu_axi_awprot := swerv.io.lsu_axi_awprot
  io.lsu_axi_awqos := swerv.io.lsu_axi_awqos

  io.lsu_axi_wvalid := swerv.io.lsu_axi_wvalid
  io.lsu_axi_wdata := swerv.io.lsu_axi_wdata
  io.lsu_axi_wstrb := swerv.io.lsu_axi_wstrb
  io.lsu_axi_wlast := swerv.io.lsu_axi_wlast
  io.lsu_axi_bready := swerv.io.lsu_axi_bready

  // AXI Read Channels
  io.lsu_axi_arvalid := swerv.io.lsu_axi_arvalid
  io.lsu_axi_arid := swerv.io.lsu_axi_arid
  io.lsu_axi_araddr := swerv.io.lsu_axi_araddr
  io.lsu_axi_arregion := swerv.io.lsu_axi_arregion
  io.lsu_axi_arlen := swerv.io.lsu_axi_arlen
  io.lsu_axi_arsize := swerv.io.lsu_axi_arsize
  io.lsu_axi_arburst := swerv.io.lsu_axi_arburst
  io.lsu_axi_arlock := swerv.io.lsu_axi_arlock
  io.lsu_axi_arcache := swerv.io.lsu_axi_arcache
  io.lsu_axi_arprot := swerv.io.lsu_axi_arprot
  io.lsu_axi_arqos := swerv.io.lsu_axi_arqos
  io.lsu_axi_rready := swerv.io.lsu_axi_rready
  // AXI Write Channels
  io.ifu_axi_awvalid := swerv.io.ifu_axi_awvalid
  io.ifu_axi_awid := swerv.io.ifu_axi_awid
  io.ifu_axi_awaddr := swerv.io.ifu_axi_awaddr
  io.ifu_axi_awregion := swerv.io.ifu_axi_awregion
  io.ifu_axi_awlen := swerv.io.ifu_axi_awlen
  io.ifu_axi_awsize := swerv.io.ifu_axi_awsize
  io.ifu_axi_awburst := swerv.io.ifu_axi_awburst
  io.ifu_axi_awlock := swerv.io.ifu_axi_awlock
  io.ifu_axi_awcache := swerv.io.ifu_axi_awcache
  io.ifu_axi_awprot := swerv.io.ifu_axi_awprot
  io.ifu_axi_awqos := swerv.io.ifu_axi_awqos
  io.ifu_axi_wvalid := swerv.io.ifu_axi_wvalid
  io.ifu_axi_wdata := swerv.io.ifu_axi_wdata
  io.ifu_axi_wstrb := swerv.io.ifu_axi_wstrb
  io.ifu_axi_wlast := swerv.io.ifu_axi_wlast

  io.ifu_axi_bready := swerv.io.ifu_axi_bready

  // AXI Read Channels
  io.ifu_axi_arvalid := swerv.io.ifu_axi_arvalid
  io.ifu_axi_arid := swerv.io.ifu_axi_arid
  io.ifu_axi_araddr := swerv.io.ifu_axi_araddr
  io.ifu_axi_arregion := swerv.io.ifu_axi_arregion
  io.ifu_axi_arlen := swerv.io.ifu_axi_arlen
  io.ifu_axi_arsize := swerv.io.ifu_axi_arsize
  io.ifu_axi_arburst := swerv.io.ifu_axi_arburst
  io.ifu_axi_arlock := swerv.io.ifu_axi_arlock
  io.ifu_axi_arcache := swerv.io.ifu_axi_arcache
  io.ifu_axi_arprot := swerv.io.ifu_axi_arprot
  io.ifu_axi_arqos := swerv.io.ifu_axi_arqos
  io.ifu_axi_rready := swerv.io.ifu_axi_rready
  //-------------------------- SB AXI signals--------------------------
  // AXI Write Channels
  io.sb_axi_awvalid := swerv.io.sb_axi_awvalid
  io.sb_axi_awid := swerv.io.sb_axi_awid
  io.sb_axi_awaddr := swerv.io.sb_axi_awaddr
  io.sb_axi_awregion := swerv.io.sb_axi_awregion
  io.sb_axi_awlen := swerv.io.sb_axi_awlen
  io.sb_axi_awsize := swerv.io.sb_axi_awsize
  io.sb_axi_awburst := swerv.io.sb_axi_awburst
  io.sb_axi_awlock := swerv.io.sb_axi_awlock
  io.sb_axi_awcache := swerv.io.sb_axi_awcache
  io.sb_axi_awprot := swerv.io.sb_axi_awprot
  io.sb_axi_awqos := swerv.io.sb_axi_awqos

  io.sb_axi_wvalid:= swerv.io.sb_axi_wvalid
  io.sb_axi_wdata := swerv.io.sb_axi_wdata
  io.sb_axi_wstrb := swerv.io.sb_axi_wstrb
  io.sb_axi_wlast := swerv.io.sb_axi_wlast
  io.sb_axi_bready := swerv.io.sb_axi_bready

  // AXI Read Channels
  io.sb_axi_arvalid := swerv.io.sb_axi_arvalid
  io.sb_axi_arid := swerv.io.sb_axi_arid
  io.sb_axi_araddr := swerv.io.sb_axi_araddr
  io.sb_axi_arregion := swerv.io.sb_axi_arregion
  io.sb_axi_arlen := swerv.io.sb_axi_arlen
  io.sb_axi_arsize := swerv.io.sb_axi_arsize
  io.sb_axi_arburst := swerv.io.sb_axi_arburst
  io.sb_axi_arlock := swerv.io.sb_axi_arlock
  io.sb_axi_arcache := swerv.io.sb_axi_arcache
  io.sb_axi_arprot := swerv.io.sb_axi_arprot
  io.sb_axi_arqos := swerv.io.sb_axi_arqos
  io.sb_axi_rready := swerv.io.sb_axi_rready
  //-------------------------- DMA AXI signals--------------------------
  // AXI Write Channels
  io.dma_axi_awready := swerv.io.dma_axi_awready
  io.dma_axi_wready := swerv.io.dma_axi_wready

  io.dma_axi_bvalid := swerv.io.dma_axi_bvalid
  io.dma_axi_bresp := swerv.io.dma_axi_bresp
  io.dma_axi_bid := swerv.io.dma_axi_bid

  // AXI Read Channels
  io.dma_axi_arready := swerv.io.dma_axi_arready
  io.dma_axi_rvalid := swerv.io.dma_axi_rvalid
  io.dma_axi_rid := swerv.io.dma_axi_rid
  io.dma_axi_rdata := swerv.io.dma_axi_rdata
  io.dma_axi_rresp := swerv.io.dma_axi_rresp
  io.dma_axi_rlast := swerv.io.dma_axi_rlast

  // DMA Slave
  io.dma_hrdata := swerv.io.dma_hrdata
  io.dma_hreadyout := swerv.io.dma_hreadyout
  io.dma_hresp := swerv.io.dma_hresp

}
object SWERV_Wrp extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_swerv_wrapper()))
}