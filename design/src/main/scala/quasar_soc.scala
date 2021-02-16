import chisel3._
import chisel3.util._
import include._
import lib._
class quasar_soc extends MultiIOModule with lib with RequireAsyncReset {
  val dbg_rst_l                         = IO(Input(AsyncReset()))
  val rst_vec                           = IO(Input(UInt(31.W)))
  val nmi_int                           = IO(Input(Bool()))
  val nmi_vec                           = IO(Input(UInt(31.W)))
  val core_rst_l                        = IO(Output(AsyncReset()))
  val trace_rv_i_insn_ip                = IO(Output(UInt(32.W)))
  val trace_rv_i_address_ip             = IO(Output(UInt(32.W)))
  val trace_rv_i_valid_ip               = IO(Output(UInt(2.W)))
  val trace_rv_i_exception_ip           = IO(Output(UInt(2.W)))
  val trace_rv_i_ecause_ip              = IO(Output(UInt(5.W)))
  val trace_rv_i_interrupt_ip           = IO(Output(UInt(2.W)))
  val trace_rv_i_tval_ip                = IO(Output(UInt(32.W)))
  val dccm_clk_override                 = IO(Output(Bool()))
  val icm_clk_override                  = IO(Output(Bool()))
  val dec_tlu_core_ecc_disable          = IO(Output(Bool()))
  val i_cpu_halt_req                    = IO(Input(Bool()))
  val i_cpu_run_req                     = IO(Input(Bool()))
  val o_cpu_halt_ack                    = IO(Output(Bool()))
  val o_cpu_halt_status                 = IO(Output(Bool()))
  val o_cpu_run_ack                     = IO(Output(Bool()))
  val o_debug_mode_status               = IO(Output(Bool()))

  val core_id                           = IO(Input(UInt(27.W)))
  val mpc_debug_halt_req                = IO(Input(Bool()))
  val mpc_debug_run_req                 = IO(Input(Bool()))
  val mpc_reset_run_req                 = IO(Input(Bool()))
  val mpc_debug_halt_ack                = IO(Output(Bool()))
  val mpc_debug_run_ack                 = IO(Output(Bool()))
  val debug_brkpt_status                = IO(Output(Bool()))
  val dec_tlu_perfcnt0                  = IO(Output(Bool()))
  val dec_tlu_perfcnt1                  = IO(Output(Bool()))
  val dec_tlu_perfcnt2                  = IO(Output(Bool()))
  val dec_tlu_perfcnt3                  = IO(Output(Bool()))
  val dccm_wren                         = IO(Output(Bool()))
  val dccm_rden                         = IO(Output(Bool()))
  val dccm_wr_addr_lo                   = IO(Output(UInt(DCCM_BITS.W)))
  val dccm_wr_addr_hi                   = IO(Output(UInt(DCCM_BITS.W)))
  val dccm_rd_addr_lo                   = IO(Output(UInt(DCCM_BITS.W)))
  val dccm_rd_addr_hi                   = IO(Output(UInt(DCCM_BITS.W)))
  val dccm_wr_data_lo                   = IO(Output(UInt(DCCM_FDATA_WIDTH.W)))
  val dccm_wr_data_hi                   = IO(Output(UInt(DCCM_FDATA_WIDTH.W)))
  val dccm_rd_data_lo                   = IO(Input(UInt(DCCM_FDATA_WIDTH.W)))
  val dccm_rd_data_hi                   = IO(Input(UInt(DCCM_FDATA_WIDTH.W)))
  val iccm_rw_addr                      = IO(Output(UInt((ICCM_BITS-1).W)))
  val iccm_wren                         = IO(Output(Bool()))
  val iccm_rden                         = IO(Output(Bool()))
  val iccm_wr_size                      = IO(Output(UInt(3.W)))
  val iccm_wr_data                      = IO(Output(UInt(78.W)))
  val iccm_buf_correct_ecc              = IO(Output(Bool()))
  val iccm_correction_state             = IO(Output(Bool()))
  val iccm_rd_data                      = IO(Input(UInt(64.W)))
  val iccm_rd_data_ecc                  = IO(Input(UInt(78.W)))

  val ic_rw_addr                        = IO(Output(UInt(31.W)))
  val ic_tag_valid                      = IO(Output(UInt(ICACHE_NUM_WAYS.W)))
  val ic_wr_en                          = IO(Output(UInt(ICACHE_NUM_WAYS.W)))
  val ic_rd_en                          = IO(Output(Bool()))
  val ic_wr_data                        = IO(Vec(ICACHE_BANKS_WAY, Output(UInt(71.W))))
  val ic_rd_data                        = IO(Input(UInt(64.W)))
  val ic_debug_rd_data                  = IO(Input(UInt(71.W)))
  val ictag_debug_rd_data               = IO(Input(UInt(26.W)))
  val ic_debug_wr_data                  = IO(Output(UInt(71.W)))
  val ic_eccerr                         = IO(Input(UInt(ICACHE_BANKS_WAY.W)))
  val ic_parerr                         = IO(Input(UInt(ICACHE_BANKS_WAY.W)))
  val ic_premux_data                    = IO(Output(UInt(64.W)))
  val ic_sel_premux_data                = IO(Output(Bool()))
  val ic_debug_addr                     = IO(Output(UInt((ICACHE_INDEX_HI-4).W)))
  val ic_debug_rd_en                    = IO(Output(Bool()))
  val ic_debug_wr_en                    = IO(Output(Bool()))
  val ic_debug_tag_array                = IO(Output(Bool()))
  val ic_debug_way                      = IO(Output(UInt(ICACHE_NUM_WAYS.W)))
  val ic_rd_hit                         = IO(Input(UInt(ICACHE_NUM_WAYS.W)))
  val ic_tag_perr                       = IO(Input(Bool()))
  val lsu_axi_awvalid                   = IO(Output(Bool()))
  val lsu_axi_awready                   = IO(Input(Bool()))
  val lsu_axi_awid                      = IO(Output(UInt(LSU_BUS_TAG.W)))
  val lsu_axi_awaddr                    = IO(Output(UInt(32.W)))
  val lsu_axi_awregion                  = IO(Output(UInt(4.W)))
  val lsu_axi_awlen                     = IO(Output(UInt(8.W)))
  val lsu_axi_awsize                    = IO(Output(UInt(3.W)))
  val lsu_axi_awburst                   = IO(Output(UInt(2.W)))
  val lsu_axi_awlock                    = IO(Output(Bool()))
  val lsu_axi_awcache                   = IO(Output(UInt(4.W)))
  val lsu_axi_awprot                    = IO(Output(UInt(3.W)))
  val lsu_axi_awqos                     = IO(Output(UInt(4.W)))
  val lsu_axi_wvalid                    = IO(Output(Bool()))
  val lsu_axi_wready                    = IO(Input(Bool()))
  val lsu_axi_wdata                     = IO(Output(UInt(64.W)))
  val lsu_axi_wstrb                     = IO(Output(UInt(8.W)))
  val lsu_axi_wlast                     = IO(Output(Bool()))
  val lsu_axi_bvalid                    = IO(Input(Bool()))
  val lsu_axi_bready                    = IO(Output(Bool()))
  val lsu_axi_bresp                     = IO(Input(UInt(2.W)))
  val lsu_axi_bid                       = IO(Input(UInt(LSU_BUS_TAG.W)))  // Till here
  val lsu_axi_arvalid                   = IO(Output(Bool()))
  val lsu_axi_arready                   = IO(Input(Bool()))
  val lsu_axi_arid                      = IO(Output(UInt(LSU_BUS_TAG.W)))
  val lsu_axi_araddr                    = IO(Output(UInt(32.W)))
  val lsu_axi_arregion                  = IO(Output(UInt(4.W)))
  val lsu_axi_arlen                     = IO(Output(UInt(8.W)))
  val lsu_axi_arsize                    = IO(Output(UInt(3.W)))
  val lsu_axi_arburst                   = IO(Output(UInt(2.W)))
  val lsu_axi_arlock                    = IO(Output(Bool()))
  val lsu_axi_arcache                   = IO(Output(UInt(4.W)))
  val lsu_axi_arprot                    = IO(Output(UInt(3.W)))
  val lsu_axi_arqos                     = IO(Output(UInt(4.W)))
  val lsu_axi_rvalid                    = IO(Input(Bool()))
  val lsu_axi_rready                    = IO(Output(Bool()))
  val lsu_axi_rid                       = IO(Input(UInt(LSU_BUS_TAG.W)))
  val lsu_axi_rdata                     = IO(Input(UInt(64.W)))
  val lsu_axi_rresp                     = IO(Input(UInt(2.W)))
  val lsu_axi_rlast                     = IO(Input(Bool()))
  val ifu_axi_awvalid                   = IO(Output(Bool()))
  val ifu_axi_awready                   = IO(Input(Bool()))
  val ifu_axi_awid                      = IO(Output(UInt(IFU_BUS_TAG.W)))
  val ifu_axi_awaddr                    = IO(Output(UInt(32.W)))
  val ifu_axi_awregion                  = IO(Output(UInt(4.W)))
  val ifu_axi_awlen                     = IO(Output(UInt(8.W)))
  val ifu_axi_awsize                    = IO(Output(UInt(3.W)))
  val ifu_axi_awburst                   = IO(Output(UInt(2.W)))
  val ifu_axi_awlock                    = IO(Output(Bool()))
  val ifu_axi_awcache                   = IO(Output(UInt(4.W)))
  val ifu_axi_awprot                    = IO(Output(UInt(3.W)))
  val ifu_axi_awqos                     = IO(Output(UInt(4.W)))
  val ifu_axi_wvalid                    = IO(Output(Bool()))
  val ifu_axi_wready                    = IO(Input(Bool()))
  val ifu_axi_wdata                     = IO(Output(UInt(64.W)))
  val ifu_axi_wstrb                     = IO(Output(UInt(8.W)))
  val ifu_axi_wlast                     = IO(Output(Bool()))
  val ifu_axi_bvalid                    = IO(Input(Bool()))
  val ifu_axi_bready                    = IO(Output(Bool()))
  val ifu_axi_bresp                     = IO(Input(UInt(2.W)))
  val ifu_axi_bid                       = IO(Input(UInt(IFU_BUS_TAG.W)))
  val ifu_axi_arvalid                   = IO(Output(Bool()))
  val ifu_axi_arready                   = IO(Input(Bool()))
  val ifu_axi_arid                      = IO(Output(UInt(IFU_BUS_TAG.W)))
  val ifu_axi_araddr                    = IO(Output(UInt(32.W)))
  val ifu_axi_arregion                  = IO(Output(UInt(4.W)))
  val ifu_axi_arlen                     = IO(Output(UInt(8.W)))
  val ifu_axi_arsize                    = IO(Output(UInt(3.W)))
  val ifu_axi_arburst                   = IO(Output(UInt(2.W)))
  val ifu_axi_arlock                    = IO(Output(Bool()))
  val ifu_axi_arcache                   = IO(Output(UInt(4.W)))
  val ifu_axi_arprot                    = IO(Output(UInt(3.W)))
  val ifu_axi_arqos                     = IO(Output(UInt(4.W)))
  val ifu_axi_rvalid                    = IO(Input(Bool()))
  val ifu_axi_rready                    = IO(Output(Bool()))
  val ifu_axi_rid                       = IO(Input(UInt(IFU_BUS_TAG.W)))
  val ifu_axi_rdata                     = IO(Input(UInt(64.W)))
  val ifu_axi_rresp                     = IO(Input(UInt(2.W)))
  val ifu_axi_rlast                     = IO(Input(Bool()))
  val sb_axi_awvalid                    = IO(Output(Bool()))
  val sb_axi_awready                    = IO(Input(Bool()))
  val sb_axi_awid                       = IO(Output(UInt(SB_BUS_TAG.W)))
  val sb_axi_awaddr                     = IO(Output(UInt(32.W)))
  val sb_axi_awregion                   = IO(Output(UInt(4.W)))
  val sb_axi_awlen                      = IO(Output(UInt(8.W)))
  val sb_axi_awsize                     = IO(Output(UInt(3.W)))
  val sb_axi_awburst                    = IO(Output(UInt(2.W)))
  val sb_axi_awlock                     = IO(Output(Bool()))
  val sb_axi_awcache                    = IO(Output(UInt(4.W)))
  val sb_axi_awprot                     = IO(Output(UInt(3.W)))
  val sb_axi_awqos                      = IO(Output(UInt(4.W)))
  val sb_axi_wvalid                     = IO(Output(Bool()))
  val sb_axi_wready                     = IO(Input(Bool()))
  val sb_axi_wdata                      = IO(Output(UInt(64.W)))
  val sb_axi_wstrb                      = IO(Output(UInt(8.W)))
  val sb_axi_wlast                      = IO(Output(Bool()))
  val sb_axi_bvalid                     = IO(Input(Bool()))
  val sb_axi_bready                     = IO(Output(Bool()))
  val sb_axi_bresp                      = IO(Input(UInt(2.W)))
  val sb_axi_bid                        = IO(Input(UInt(SB_BUS_TAG.W)))
  val sb_axi_arvalid                    = IO(Output(Bool()))
  val sb_axi_arready                    = IO(Input(Bool()))
  val sb_axi_arid                       = IO(Output(UInt(SB_BUS_TAG.W)))
  val sb_axi_araddr                     = IO(Output(UInt(32.W)))
  val sb_axi_arregion                   = IO(Output(UInt(4.W)))
  val sb_axi_arlen                      = IO(Output(UInt(8.W)))
  val sb_axi_arsize                     = IO(Output(UInt(2.W)))
  val sb_axi_arburst                    = IO(Output(UInt(2.W)))
  val sb_axi_arlock                     = IO(Output(Bool()))
  val sb_axi_arcache                    = IO(Output(UInt(4.W)))
  val sb_axi_arprot                     = IO(Output(UInt(3.W)))
  val sb_axi_arqos                      = IO(Output(UInt(4.W)))
  val sb_axi_rvalid                     = IO(Input(Bool()))
  val sb_axi_rready                     = IO(Output(Bool()))
  val sb_axi_rid                        = IO(Input(UInt(SB_BUS_TAG.W)))
  val sb_axi_rdata                      = IO(Input(UInt(64.W)))
  val sb_axi_rresp                      = IO(Input(UInt(2.W)))
  val sb_axi_rlast                      = IO(Input(Bool()))

  val dma_axi_awvalid                   = IO(Input(Bool()))
  val dma_axi_awready                   = IO(Output(Bool()))
  val dma_axi_awid                      = IO(Input(UInt(DMA_BUS_TAG.W)))
  val dma_axi_awaddr                    = IO(Input(UInt(32.W)))
  val dma_axi_awsize                    = IO(Input(UInt(3.W)))
  val dma_axi_awprot                    = IO(Input(UInt(3.W)))
  val dma_axi_awlen                     = IO(Input(UInt(8.W)))
  val dma_axi_awburst                   = IO(Input(UInt(2.W)))
  val dma_axi_wvalid                    = IO(Input(Bool()))
  val dma_axi_wready                    = IO(Output(Bool()))
  val dma_axi_wdata                     = IO(Input(UInt(64.W)))
  val dma_axi_wstrb                     = IO(Input(UInt(8.W)))
  val dma_axi_wlast                     = IO(Input(Bool()))
  val dma_axi_bvalid                    = IO(Output(Bool()))
  val dma_axi_bready                    = IO(Input(Bool()))
  val dma_axi_bresp                     = IO(Output(UInt(2.W)))
  val dma_axi_bid                       = IO(Output(UInt(DMA_BUS_TAG.W)))
  val dma_axi_arvalid                   = IO(Input(Bool()))
  val dma_axi_arready                   = IO(Output(Bool()))
  val dma_axi_arid                      = IO(Input(UInt(DMA_BUS_TAG.W)))
  val dma_axi_araddr                    = IO(Input(UInt(32.W)))
  val dma_axi_arsize                    = IO(Input(UInt(3.W)))
  val dma_axi_arprot                    = IO(Input(UInt(3.W)))
  val dma_axi_arlen                     = IO(Input(UInt(8.W)))
  val dma_axi_arburst                   = IO(Input(UInt(2.W)))
  val dma_axi_rvalid                    = IO(Output(Bool()))
  val dma_axi_rready                    = IO(Input(Bool()))
  val dma_axi_rid                       = IO(Output(UInt(DMA_BUS_TAG.W)))
  val dma_axi_rdata                     = IO(Output(UInt(64.W)))
  val dma_axi_rresp                     = IO(Output(UInt(2.W)))
  val dma_axi_rlast                     = IO(Output(Bool()))
  val lsu_bus_clk_en                    = IO(Input(Bool()))
  val ifu_bus_clk_en                    = IO(Input(Bool()))
  val dbg_bus_clk_en                    = IO(Input(Bool()))
  val dma_bus_clk_en                    = IO(Input(Bool()))

  val dmi_reg_en                        = IO(Input(Bool()))
  val dmi_reg_addr                      = IO(Input(UInt(7.W)))
  val dmi_reg_wr_en                     = IO(Input(Bool()))
  val dmi_reg_wdata                     = IO(Input(UInt(32.W)))

  val dmi_reg_rdata                     = IO(Output(UInt(32.W)))
  val dmi_hard_reset                    = IO(Input(Bool()))

  val extintsrc_req                     = IO(Input(UInt((PIC_TOTAL_INT-2).W)))
  val timer_int                         = IO(Input(Bool()))
  val soft_int                          = IO(Input(Bool()))
  val scan_mode                         = IO(Input(Bool()))

  val core = Module(new quasar())
  core.io.lsu_ahb          <> 0.U.asTypeOf(core.io.lsu_ahb)
  core.io.ifu_ahb          <> 0.U.asTypeOf(core.io.ifu_ahb)
  core.io.sb_ahb           <> 0.U.asTypeOf(core.io.sb_ahb)
  core.io.dma_ahb          <> 0.U.asTypeOf(core.io.dma_ahb)
  core.io.dma_axi          <> 0.U.asTypeOf(core.io.dma_axi)

  core.io.dbg_rst_l                 <> dbg_rst_l
  core.io.rst_vec                   <> rst_vec
  core.io.nmi_int                   <> nmi_int
  core.io.nmi_vec                   <> nmi_vec
  core_rst_l                        <> core.io.core_rst_l
  trace_rv_i_insn_ip                <> core.io.rv_trace_pkt.rv_i_insn_ip
  trace_rv_i_address_ip             <> core.io.rv_trace_pkt.rv_i_address_ip
  trace_rv_i_valid_ip               <> core.io.rv_trace_pkt.rv_i_valid_ip
  trace_rv_i_exception_ip           <> core.io.rv_trace_pkt.rv_i_exception_ip
  trace_rv_i_ecause_ip              <> core.io.rv_trace_pkt.rv_i_ecause_ip
  trace_rv_i_interrupt_ip           <> core.io.rv_trace_pkt.rv_i_tval_ip
  trace_rv_i_tval_ip                <> core.io.rv_trace_pkt.rv_i_tval_ip
  dccm_clk_override                 <> core.io.dccm_clk_override
  icm_clk_override                  <> core.io.icm_clk_override
  dec_tlu_core_ecc_disable          <> core.io.dec_tlu_core_ecc_disable
  i_cpu_halt_req                    <> core.io.i_cpu_halt_req
  i_cpu_run_req                     <> core.io.i_cpu_run_req
  o_cpu_halt_ack                    <> core.io.o_cpu_halt_ack
  o_cpu_halt_status                 <> core.io.o_cpu_halt_status
  o_cpu_run_ack                     <> core.io.o_cpu_run_ack
  o_debug_mode_status               <> core.io.o_debug_mode_status

  core_id                           <> core.io.core_id
  mpc_debug_halt_req                <> core.io.mpc_debug_halt_req
  mpc_debug_run_req                 <> core.io.mpc_debug_run_req
  mpc_reset_run_req                 <> core.io.mpc_reset_run_req
  mpc_debug_halt_ack                <> core.io.mpc_debug_halt_ack
  mpc_debug_run_ack                 <> core.io.mpc_debug_run_ack
  debug_brkpt_status                <> core.io.debug_brkpt_status
  dec_tlu_perfcnt0                  <> core.io.dec_tlu_perfcnt0
  dec_tlu_perfcnt1                  <> core.io.dec_tlu_perfcnt1
  dec_tlu_perfcnt2                  <> core.io.dec_tlu_perfcnt2
  dec_tlu_perfcnt3                  <> core.io.dec_tlu_perfcnt3
  dccm_wren                         <> core.io.dccm.wren
  dccm_rden                         <> core.io.dccm.rden
  dccm_wr_addr_lo                   <> core.io.dccm.wr_addr_lo
  dccm_wr_addr_hi                   <> core.io.dccm.wr_addr_hi
  dccm_rd_addr_lo                   <> core.io.dccm.rd_addr_lo
  dccm_rd_addr_hi                   <> core.io.dccm.rd_addr_hi
  dccm_wr_data_lo                   <> core.io.dccm.wr_data_lo
  dccm_wr_data_hi                   <> core.io.dccm.wr_addr_hi
  dccm_rd_data_lo                   <> core.io.dccm.rd_data_lo
  dccm_rd_data_hi                   <> core.io.dccm.rd_data_hi
  iccm_rw_addr                      <> core.io.iccm.rw_addr
  iccm_wren                         <> core.io.iccm.wren
  iccm_rden                         <> core.io.iccm.rden
  iccm_wr_size                      <> core.io.iccm.wr_size
  iccm_wr_data                      <> core.io.iccm.wr_data
  iccm_buf_correct_ecc              <> core.io.iccm.buf_correct_ecc
  iccm_correction_state             <> core.io.iccm.correction_state
  iccm_rd_data                      <> core.io.iccm.rd_data
  iccm_rd_data_ecc                  <> core.io.iccm.rd_data_ecc

  ic_rw_addr                        <> core.io.ic.rw_addr
  ic_tag_valid                      <> core.io.ic.tag_valid
  ic_wr_en                          <> core.io.ic.wr_en
  ic_rd_en                          <> core.io.ic.rd_en
  ic_wr_data                        <> core.io.ic.wr_data
  ic_rd_data                        <> core.io.ic.rd_data
  ic_debug_rd_data                  <> core.io.ic.debug_rd_data
  ictag_debug_rd_data               <> core.io.ic.tag_debug_rd_data
  ic_debug_wr_data                  <> core.io.ic.debug_wr_data
  ic_eccerr                         <> core.io.ic.eccerr
  ic_parerr                         <> core.io.ic.parerr
  ic_premux_data                    <> core.io.ic.premux_data
  ic_sel_premux_data                <> core.io.ic.sel_premux_data
  ic_debug_addr                     <> core.io.ic.debug_addr
  ic_debug_rd_en                    <> core.io.ic.debug_rd_en
  ic_debug_wr_en                    <> core.io.ic.debug_wr_en
  ic_debug_tag_array                <> core.io.ic.debug_tag_array
  ic_debug_way                      <> core.io.ic.debug_way
  ic_rd_hit                         <> core.io.ic.rd_hit
  ic_tag_perr                       <> core.io.ic.tag_perr
  lsu_axi_awvalid                   <> core.io.lsu_axi.aw.valid
  lsu_axi_awready                   <> core.io.lsu_axi.aw.ready
  lsu_axi_awid                      <> core.io.lsu_axi.aw.bits.id
  lsu_axi_awaddr                    <> core.io.lsu_axi.aw.bits.addr
  lsu_axi_awregion                  <> core.io.lsu_axi.aw.bits.region
  lsu_axi_awlen                     <> core.io.lsu_axi.aw.bits.len
  lsu_axi_awsize                    <> core.io.lsu_axi.aw.bits.size
  lsu_axi_awburst                   <> core.io.lsu_axi.aw.bits.burst
  lsu_axi_awlock                    <> core.io.lsu_axi.aw.bits.lock
  lsu_axi_awcache                   <> core.io.lsu_axi.aw.bits.cache
  lsu_axi_awprot                    <> core.io.lsu_axi.aw.bits.prot
  lsu_axi_awqos                     <> core.io.lsu_axi.aw.bits.qos
  lsu_axi_wvalid                    <> core.io.lsu_axi.w.valid
  lsu_axi_wready                    <> core.io.lsu_axi.w.ready
  lsu_axi_wdata                     <> core.io.lsu_axi.w.bits.data
  lsu_axi_wstrb                     <> core.io.lsu_axi.w.bits.strb
  lsu_axi_wlast                     <> core.io.lsu_axi.w.bits.last
  lsu_axi_bvalid                    <> core.io.lsu_axi.b.valid
  lsu_axi_bready                    <> core.io.lsu_axi.b.ready
  lsu_axi_bresp                     <> core.io.lsu_axi.b.bits.resp
  lsu_axi_bid                       <> core.io.lsu_axi.b.bits.id
  lsu_axi_arvalid                   <> core.io.lsu_axi.ar.valid
  lsu_axi_arready                   <> core.io.lsu_axi.ar.ready
  lsu_axi_arid                      <> core.io.lsu_axi.ar.bits.id
  lsu_axi_araddr                    <> core.io.lsu_axi.ar.bits.addr
  lsu_axi_arregion                  <> core.io.lsu_axi.ar.bits.region
  lsu_axi_arlen                     <> core.io.lsu_axi.ar.bits.len
  lsu_axi_arsize                    <> core.io.lsu_axi.ar.bits.size
  lsu_axi_arburst                   <> core.io.lsu_axi.ar.bits.burst
  lsu_axi_arlock                    <> core.io.lsu_axi.ar.bits.lock
  lsu_axi_arcache                   <> core.io.lsu_axi.ar.bits.cache
  lsu_axi_arprot                    <> core.io.lsu_axi.ar.bits.prot
  lsu_axi_arqos                     <> core.io.lsu_axi.ar.bits.qos
  lsu_axi_rvalid                    <> core.io.lsu_axi.r.valid
  lsu_axi_rready                    <> core.io.lsu_axi.r.ready
  lsu_axi_rid                       <> core.io.lsu_axi.r.bits.id
  lsu_axi_rdata                     <> core.io.lsu_axi.r.bits.data
  lsu_axi_rresp                     <> core.io.lsu_axi.r.bits.resp
  lsu_axi_rlast                     <> core.io.lsu_axi.r.bits.last
  // IFU AXI Start
  ifu_axi_awvalid                   <> core.io.ifu_axi.aw.valid
  ifu_axi_awready                   <> core.io.ifu_axi.aw.ready
  ifu_axi_awid                      <> core.io.ifu_axi.aw.bits.id
  ifu_axi_awaddr                    <> core.io.ifu_axi.aw.bits.addr
  ifu_axi_awregion                  <> core.io.ifu_axi.aw.bits.region
  ifu_axi_awlen                     <> core.io.ifu_axi.aw.bits.len
  ifu_axi_awsize                    <> core.io.ifu_axi.aw.bits.size
  ifu_axi_awburst                   <> core.io.ifu_axi.aw.bits.burst
  ifu_axi_awlock                    <> core.io.ifu_axi.aw.bits.lock
  ifu_axi_awcache                   <> core.io.ifu_axi.aw.bits.cache
  ifu_axi_awprot                    <> core.io.ifu_axi.aw.bits.prot
  ifu_axi_awqos                     <> core.io.ifu_axi.aw.bits.qos
  ifu_axi_wvalid                    <> core.io.ifu_axi.w.valid
  ifu_axi_wready                    <> core.io.ifu_axi.w.ready
  ifu_axi_wdata                     <> core.io.ifu_axi.w.bits.data
  ifu_axi_wstrb                     <> core.io.ifu_axi.w.bits.strb
  ifu_axi_wlast                     <> core.io.ifu_axi.w.bits.last
  ifu_axi_bvalid                    <> core.io.ifu_axi.b.valid
  ifu_axi_bready                    <> core.io.ifu_axi.b.ready
  ifu_axi_bresp                     <> core.io.ifu_axi.b.bits.resp
  ifu_axi_bid                       <> core.io.ifu_axi.b.bits.id
  ifu_axi_arvalid                   <> core.io.ifu_axi.ar.valid
  ifu_axi_arready                   <> core.io.ifu_axi.ar.ready
  ifu_axi_arid                      <> core.io.ifu_axi.ar.bits.id
  ifu_axi_araddr                    <> core.io.ifu_axi.ar.bits.addr
  ifu_axi_arregion                  <> core.io.ifu_axi.ar.bits.region
  ifu_axi_arlen                     <> core.io.ifu_axi.ar.bits.len
  ifu_axi_arsize                    <> core.io.ifu_axi.ar.bits.size
  ifu_axi_arburst                   <> core.io.ifu_axi.ar.bits.burst
  ifu_axi_arlock                    <> core.io.ifu_axi.ar.bits.lock
  ifu_axi_arcache                   <> core.io.ifu_axi.ar.bits.cache
  ifu_axi_arprot                    <> core.io.ifu_axi.ar.bits.prot
  ifu_axi_arqos                     <> core.io.ifu_axi.ar.bits.qos
  ifu_axi_rvalid                    <> core.io.ifu_axi.r.valid
  ifu_axi_rready                    <> core.io.ifu_axi.r.ready
  ifu_axi_rid                       <> core.io.ifu_axi.r.bits.id
  ifu_axi_rdata                     <> core.io.ifu_axi.r.bits.data
  ifu_axi_rresp                     <> core.io.ifu_axi.r.bits.resp
  ifu_axi_rlast                     <> core.io.ifu_axi.r.bits.last
  // SB AXI
  sb_axi_awvalid                    <> core.io.sb_axi.aw.valid
  sb_axi_awready                    <> core.io.sb_axi.aw.ready
  sb_axi_awid                       <> core.io.sb_axi.aw.bits.id
  sb_axi_awaddr                     <> core.io.sb_axi.aw.bits.addr
  sb_axi_awregion                   <> core.io.sb_axi.aw.bits.region
  sb_axi_awlen                      <> core.io.sb_axi.aw.bits.len
  sb_axi_awsize                     <> core.io.sb_axi.aw.bits.size
  sb_axi_awburst                    <> core.io.sb_axi.aw.bits.burst
  sb_axi_awlock                     <> core.io.sb_axi.aw.bits.lock
  sb_axi_awcache                    <> core.io.sb_axi.aw.bits.cache
  sb_axi_awprot                     <> core.io.sb_axi.aw.bits.prot
  sb_axi_awqos                      <> core.io.sb_axi.aw.bits.qos
  sb_axi_wvalid                     <> core.io.sb_axi.w.valid
  sb_axi_wready                     <> core.io.sb_axi.w.ready
  sb_axi_wdata                      <> core.io.sb_axi.w.bits.data
  sb_axi_wstrb                      <> core.io.sb_axi.w.bits.strb
  sb_axi_wlast                      <> core.io.sb_axi.w.bits.last
  sb_axi_bvalid                     <> core.io.sb_axi.b.valid
  sb_axi_bready                     <> core.io.sb_axi.b.ready
  sb_axi_bresp                      <> core.io.sb_axi.b.bits.resp
  sb_axi_bid                        <> core.io.sb_axi.b.bits.id
  sb_axi_arvalid                    <> core.io.sb_axi.ar.valid
  sb_axi_arready                    <> core.io.sb_axi.ar.ready
  sb_axi_arid                       <> core.io.sb_axi.ar.bits.id
  sb_axi_araddr                     <> core.io.sb_axi.ar.bits.addr
  sb_axi_arregion                   <> core.io.sb_axi.ar.bits.region
  sb_axi_arlen                      <> core.io.sb_axi.ar.bits.len
  sb_axi_arsize                     <> core.io.sb_axi.ar.bits.size
  sb_axi_arburst                    <> core.io.sb_axi.ar.bits.burst
  sb_axi_arlock                     <> core.io.sb_axi.ar.bits.lock
  sb_axi_arcache                    <> core.io.sb_axi.ar.bits.cache
  sb_axi_arprot                     <> core.io.sb_axi.ar.bits.prot
  sb_axi_arqos                      <> core.io.sb_axi.ar.bits.qos
  sb_axi_rvalid                     <> core.io.sb_axi.r.valid
  sb_axi_rready                     <> core.io.sb_axi.r.ready
  sb_axi_rid                        <> core.io.sb_axi.r.bits.id
  sb_axi_rdata                      <> core.io.sb_axi.r.bits.data
  sb_axi_rresp                      <> core.io.sb_axi.r.bits.resp
  sb_axi_rlast                      <> core.io.sb_axi.r.bits.last
  // DMA AXI
  dma_axi_awvalid                   <> core.io.dma_axi.aw.valid
  dma_axi_awready                   <> core.io.dma_axi.aw.ready
  dma_axi_awid                      <> core.io.dma_axi.aw.bits.id
  dma_axi_awaddr                    <> core.io.dma_axi.aw.bits.addr
  dma_axi_awsize                    <> core.io.dma_axi.aw.bits.size
  dma_axi_awprot                    <> core.io.dma_axi.aw.bits.prot
  dma_axi_awlen                     <> core.io.dma_axi.aw.bits.len
  dma_axi_awburst                   <> core.io.dma_axi.aw.bits.burst
  dma_axi_wvalid                    <> core.io.dma_axi.w.valid
  dma_axi_wready                    <> core.io.dma_axi.w.ready
  dma_axi_wdata                     <> core.io.dma_axi.w.bits.data
  dma_axi_wstrb                     <> core.io.dma_axi.w.bits.strb
  dma_axi_wlast                     <> core.io.dma_axi.w.bits.last
  dma_axi_bvalid                    <> core.io.dma_axi.b.valid
  dma_axi_bready                    <> core.io.dma_axi.b.ready
  dma_axi_bresp                     <> core.io.dma_axi.b.bits.resp
  dma_axi_bid                       <> core.io.dma_axi.b.bits.id
  dma_axi_arvalid                   <> core.io.dma_axi.ar.valid
  dma_axi_arready                   <> core.io.dma_axi.ar.ready
  dma_axi_arid                      <> core.io.dma_axi.ar.bits.id
  dma_axi_araddr                    <> core.io.dma_axi.ar.bits.addr
  dma_axi_arsize                    <> core.io.dma_axi.ar.bits.size
  dma_axi_arprot                    <> core.io.dma_axi.ar.bits.prot
  dma_axi_arlen                     <> core.io.dma_axi.ar.bits.len
  dma_axi_arburst                   <> core.io.dma_axi.ar.bits.burst
  dma_axi_rvalid                    <> core.io.dma_axi.r.valid
  dma_axi_rready                    <> core.io.dma_axi.r.ready
  dma_axi_rid                       <> core.io.dma_axi.r.bits.id
  dma_axi_rdata                     <> core.io.dma_axi.r.bits.data
  dma_axi_rresp                     <> core.io.dma_axi.r.bits.resp
  dma_axi_rlast                     <> core.io.dma_axi.r.bits.last

  lsu_bus_clk_en                    <> core.io.lsu_bus_clk_en
  ifu_bus_clk_en                    <> core.io.ifu_bus_clk_en
  dbg_bus_clk_en                    <> core.io.dbg_bus_clk_en
  dma_bus_clk_en                    <> core.io.dma_bus_clk_en

  dmi_reg_en                        <> core.io.dmi_reg_en
  dmi_reg_addr                      <> core.io.dmi_reg_addr
  dmi_reg_wr_en                     <> core.io.dmi_reg_wr_en
  dmi_reg_wdata                     <> core.io.dmi_reg_wdata

  dmi_reg_rdata                     <> core.io.dmi_reg_rdata
  dmi_hard_reset                    <> core.io.dmi_hard_reset

  extintsrc_req                     <> core.io.extintsrc_req
  timer_int                         <> core.io.timer_int
  soft_int                          <> core.io.soft_int
  scan_mode                         <> core.io.scan_mode

}
//
//class axi2wb_bb(AW_C:Int, IW_C:Int) extends BlackBox(Map("AW" -> AW_C, "IW" -> IW_C)) with HasBlackBoxResource{
//  val io = IO(new Bundle{
//    val clk = Input(Clock())
//    val rst = Input(Bool())
//    val in_out = new axi2wb_bundle(AW_C, IW_C)
//  })
//  addResource("/vsrc/axi2wb.v")
//}
//class wb_mem_wrapper_bb (MEM_SIZE:Int, mem_clear:Int, INIT_FILE:String) extends BlackBox(Map("MEM_SIZE" -> MEM_SIZE,
//  "mem_clear" -> mem_clear,
//  "INIT_FILE" -> INIT_FILE)) with HasBlackBoxResource{
//  val io = IO(new Bundle{
//    val clk = Input(Clock())
//    val rst = Input(Bool())
//    val in_out = new wb_mem_wrapper_bundle(MEM_SIZE)
//  })
//  addResource("/vsrc/wb_mem_wrapper.v")
//}
//class wb_mem_wrapper (MEM_SIZE:Int, mem_clear:Int, INIT_FILE:String) extends Module{
//  val io = IO(new wb_mem_wrapper_bundle(MEM_SIZE))
//  val mem = Module(new wb_mem_wrapper_bb (MEM_SIZE, mem_clear, INIT_FILE))
//  mem.io.in_out <> io
//  mem.io.clk := clock
//  mem.io.rst := reset
//}
//class axi2wb(AW_C: Int, IW_C: Int) extends Module{
//  val io = IO(new axi2wb_bundle(AW_C, IW_C))
//  val axi_conv = Module(new axi2wb_bb(AW_C, IW_C))
//  axi_conv.io.clk := clock
//  axi_conv.io.rst := reset
//  axi_conv.io.in_out <> io
//}
//class swervolf_syscon (clk_freq_hz:Int) extends BlackBox(Map("clk_freq_hz" ->clk_freq_hz)) with HasBlackBoxResource{
//  val io = IO(new Bundle{
//    val clk = Input(Clock())
//    val rst = Input(Bool())
//    val in_out = new swervolf_syscon_bundle()
//  })
//  addResource("/vsrc/swervolf_syscon.v")
//}
//class swervolf_syscon_c(clk_freq_hz: Int) extends Module{
//  val io = IO(new swervolf_syscon_bundle())
//  val syscon = Module(new swervolf_syscon(clk_freq_hz))
//  syscon.io.clk := clock
//  syscon.io.rst := reset
//  syscon.io.in_out <> io
//}
//
//class simple_spi (SS_WIDTH:Int) extends BlackBox(Map("SS_WIDTH" -> SS_WIDTH)) with HasBlackBoxResource{
//  val io = IO(new Bundle{
//    val clk = Input(Clock())
//    val rst = Input(Bool())
//    val in_out = new spi_bundle(SS_WIDTH)
//  })
//  addResource("/vsrc/simple_spi_top.v")
//}
//class spi_c(SS_WIDTH: Int) extends Module{
//  val io = IO(new spi_bundle(SS_WIDTH))
//  val spi = Module(new simple_spi(SS_WIDTH))
//  spi.io.clk := clock
//  spi.io.rst := reset
//  spi.io.in_out <> io
//}
//
//class uart_top extends BlackBox with HasBlackBoxResource{
//  val io = IO(new Bundle{
//    val clk = Input(Clock())
//    val rst = Input(Bool())
//    val in_out = new uart_bundle()
//  })
//  addResource("/vsrc/uart_top.v")
//}
//class uart_c extends Module{
//  val io = IO(new uart_bundle())
//  val uart = Module(new uart_top())
//  uart.io.clk := clock
//  uart.io.rst := reset
//  uart.io.in_out <> io
//}
object soc extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new quasar_soc()))
}
