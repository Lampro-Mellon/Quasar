package lsu
import chisel3._
import chisel3.util._
import lib._
import include._
import chisel3.experimental.{ChiselEnum, chiselName}
import chisel3.util.ImplicitConversions.intToUInt

@chiselName
class  el2_lsu_bus_buffer extends Module with RequireAsyncReset with el2_lib {
  val io = IO(new Bundle {
    val scan_mode = Input(Bool())
    val dec_tlu_external_ldfwd_disable = Input(Bool())
    val dec_tlu_wb_coalescing_disable = Input(Bool())
    val dec_tlu_sideeffect_posted_disable = Input(Bool())
    val dec_tlu_force_halt = Input(Bool())
    val lsu_c2_r_clk = Input(Clock())
    val lsu_bus_ibuf_c1_clk = Input(Clock())
    val lsu_bus_obuf_c1_clk = Input(Clock())
    val lsu_bus_buf_c1_clk = Input(Clock())
    val lsu_free_c2_clk = Input(Clock())
    val lsu_busm_clk = Input(Clock())
    val dec_lsu_valid_raw_d = Input(Bool())
    val lsu_pkt_m = Flipped(Valid(new el2_lsu_pkt_t))
    val lsu_pkt_r = Flipped(Valid(new el2_lsu_pkt_t))
    val lsu_addr_m = Input(UInt(32.W))
    val end_addr_m = Input(UInt(32.W))
    val lsu_addr_r = Input(UInt(32.W))
    val end_addr_r = Input(UInt(32.W))
    val store_data_r = Input(UInt(32.W))
    val no_word_merge_r = Input(Bool())
    val no_dword_merge_r = Input(Bool())
    val lsu_busreq_m = Input(Bool())
    val ld_full_hit_m = Input(Bool())
    val flush_m_up = Input(Bool())
    val flush_r = Input(Bool())
    val lsu_commit_r = Input(Bool())
    val is_sideeffects_r = Input(Bool())
    val ldst_dual_d = Input(Bool())
    val ldst_dual_m = Input(Bool())
    val ldst_dual_r = Input(Bool())
    val ldst_byteen_ext_m = Input(UInt(8.W))
    val lsu_axi_wready = Input(Bool())
    val lsu_axi_bvalid = Input(Bool())
    val lsu_axi_bresp = Input(UInt(2.W))
    val lsu_axi_bid = Input(UInt(LSU_BUS_TAG.W))
    val lsu_axi_arready = Input(Bool())
    val lsu_axi_rvalid = Input(Bool())
    val lsu_axi_rid = Input(UInt(LSU_BUS_TAG.W))
    val lsu_axi_rdata = Input(UInt(64.W))
    val lsu_axi_rresp = Input(UInt(2.W))
    val lsu_bus_clk_en = Input(Bool())
    val lsu_bus_clk_en_q = Input(Bool())

    val lsu_busreq_r = Output(Bool())
    val lsu_bus_buffer_pend_any = Output(Bool())
    val lsu_bus_buffer_full_any = Output(Bool())
    val lsu_bus_buffer_empty_any = Output(Bool())
    val lsu_bus_idle_any = Output(Bool())
    val ld_byte_hit_buf_lo = Output((UInt(4.W)))
    val ld_byte_hit_buf_hi = Output((UInt(4.W)))
    val ld_fwddata_buf_lo = Output((UInt(32.W)))
    val ld_fwddata_buf_hi = Output((UInt(32.W)))
    val lsu_imprecise_error_load_any = Output(Bool())
    val lsu_imprecise_error_store_any = Output(Bool())
    val lsu_imprecise_error_addr_any = Output(UInt(32.W))
    val lsu_nonblock_load_valid_m = Output(Bool())
    val lsu_nonblock_load_tag_m = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
    val lsu_nonblock_load_inv_r = Output(Bool())
    val lsu_nonblock_load_inv_tag_r = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
    val lsu_nonblock_load_data_valid = Output(Bool())
    val lsu_nonblock_load_data_error = Output(Bool())
    val lsu_nonblock_load_data_tag = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
    val lsu_nonblock_load_data = Output(UInt(32.W))
    val lsu_pmu_bus_trxn = Output(Bool())
    val lsu_pmu_bus_misaligned = Output(Bool())
    val lsu_pmu_bus_error = Output(Bool())
    val lsu_pmu_bus_busy = Output(Bool())

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
    val lsu_axi_wdata = Output(UInt(64.W))
    val lsu_axi_wstrb = Output(UInt(8.W))
    val lsu_axi_wlast = Output(Bool())
    val lsu_axi_bready = Output(Bool())
    val lsu_axi_arvalid = Output(Bool())
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
    val lsu_axi_rready = Output(Bool())
  })
  def indexing(in : UInt, index : UInt) = Mux1H((0 until math.pow(2, index.getWidth).asInstanceOf[Int]).map(i=>(index===i.U)->in(i)))
  def indexing(in : Vec[UInt], index : UInt) = Mux1H((0 until math.pow(2, index.getWidth).asInstanceOf[Int]).map(i=>(index===i.U)->in(i)))

  val DEPTH = LSU_NUM_NBLOAD
  val DEPTH_LOG2 = LSU_NUM_NBLOAD_WIDTH
  val TIMER = 8
  val TIMER_MAX = TIMER - 1
  val TIMER_LOG2 = if (TIMER < 2) 1 else log2Ceil(TIMER)

  val idle_C :: wait_C :: cmd_C :: resp_C :: done_partial_C :: done_wait_C :: done_C :: Nil = Enum(7)
  val buf_addr = Wire(Vec(DEPTH, UInt(32.W)))
  val buf_state = Wire(Vec(DEPTH, UInt(3.W)))
  val buf_write = WireInit(UInt(DEPTH.W), 0.U)
  val CmdPtr0 = WireInit(UInt(DEPTH_LOG2.W), 0.U)


  val ldst_byteen_hi_m = io.ldst_byteen_ext_m(7, 4)
  val ldst_byteen_lo_m = io.ldst_byteen_ext_m(3, 0)

  val ld_addr_hitvec_lo = (0 until DEPTH).map(i => (io.lsu_addr_m(31, 2) === buf_addr(i)(31, 2)) & buf_write(i) & (buf_state(i) =/= idle_C) & io.lsu_busreq_m)
  val ld_addr_hitvec_hi = (0 until DEPTH).map(i => (io.end_addr_m(31, 2) === buf_addr(i)(31, 2)) & buf_write(i) & (buf_state(i) =/= idle_C) & io.lsu_busreq_m)
  val ld_byte_hitvecfn_lo = Wire(Vec(4, UInt(DEPTH.W)))
  val ld_byte_ibuf_hit_lo = WireInit(UInt(4.W), 0.U)
  val ld_byte_hitvecfn_hi = Wire(Vec(4, UInt(DEPTH.W)))
  val ld_byte_ibuf_hit_hi = WireInit(UInt(4.W), 0.U)
  val buf_byteen = Wire(Vec(DEPTH, UInt(4.W)))
  buf_byteen := buf_byteen.map(i=>0.U)
  val buf_nxtstate = Wire(Vec(DEPTH, UInt(3.W)))
  buf_nxtstate := buf_nxtstate.map(i=>0.U)
  val buf_wr_en = Wire(Vec(DEPTH, Bool()))
  buf_wr_en := buf_wr_en.map(i=> false.B)
  val buf_data_en = Wire(Vec(DEPTH, Bool()))
  buf_data_en := buf_data_en.map(i=> false.B)
  val buf_state_bus_en = Wire(Vec(DEPTH, Bool()))
  buf_state_bus_en := buf_state_bus_en.map(i=> false.B)
  val buf_ldfwd_in = Wire(Vec(DEPTH, Bool()))
  buf_ldfwd_in := buf_ldfwd_in.map(i=> false.B)
  val buf_ldfwd_en = Wire(Vec(DEPTH, Bool()))
  buf_ldfwd_en := buf_ldfwd_en.map(i=> false.B)
  val buf_data_in = Wire(Vec(DEPTH, UInt(32.W)))
  buf_data_in := buf_data_in.map(i=> 0.U)
  val buf_ldfwdtag_in = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
  buf_ldfwdtag_in := buf_ldfwdtag_in.map(i=> 0.U)
  val buf_error_en = Wire(Vec(DEPTH, Bool()))
  buf_error_en := buf_error_en.map(i=> false.B)
  val bus_rsp_read_error = WireInit(Bool(), false.B)
  val bus_rsp_rdata = WireInit(UInt(64.W), 0.U)
  val bus_rsp_write_error = WireInit(Bool(), false.B)
  val buf_dualtag = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
  buf_dualtag := buf_dualtag.map(i=> 0.U)
  val buf_ldfwd = WireInit(UInt(DEPTH.W), 0.U)
  val buf_resp_state_bus_en = Wire(Vec(DEPTH, Bool()))
  buf_resp_state_bus_en := buf_resp_state_bus_en.map(i=> false.B)
  val any_done_wait_state = WireInit(Bool(), false.B)
  val bus_rsp_write = WireInit(Bool(), false.B)
  val bus_rsp_write_tag = WireInit(UInt(LSU_BUS_TAG.W), 0.U)
  val buf_ldfwdtag = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
  buf_ldfwdtag := buf_ldfwdtag.map(i=> 0.U)
  val buf_rst = Wire(Vec(DEPTH, Bool()))
  buf_rst := buf_rst.map(i=> false.B)
  val ibuf_drainvec_vld = WireInit(UInt(DEPTH.W), 0.U)
  val buf_byteen_in = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_byteen_in := buf_byteen_in.map(i=> 0.U)
  val buf_addr_in = Wire(Vec(DEPTH, UInt(32.W)))
  buf_addr_in := buf_addr_in.map(i=> 0.U)
  val buf_dual_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_samedw_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_nomerge_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_dualhi_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_dualtag_in = Wire(Vec(DEPTH, UInt(DEPTH_LOG2.W)))
  buf_dualtag_in := buf_dualtag_in.map(i=> 0.U)
  val buf_sideeffect_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_unsign_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_sz_in = Wire(Vec(DEPTH, UInt(2.W)))
  buf_sz_in := buf_sz_in.map(i=> 0.U)
  val buf_write_in = WireInit(UInt(DEPTH.W), 0.U)
  val buf_unsign = WireInit(UInt(DEPTH.W), 0.U)
  val buf_error = WireInit(UInt(DEPTH.W), 0.U)
  val CmdPtr1 = WireInit(UInt(DEPTH_LOG2.W), 0.U)

  val ibuf_data = WireInit(UInt(32.W), 0.U)
  io.ld_byte_hit_buf_lo := (0 until 4).map(i => (ld_byte_hitvecfn_lo(i).orR | ld_byte_ibuf_hit_lo(i)).asUInt).reverse.reduce(Cat(_, _))
  io.ld_byte_hit_buf_hi := (0 until 4).map(i => (ld_byte_hitvecfn_hi(i).orR | ld_byte_ibuf_hit_hi(i)).asUInt).reverse.reduce(Cat(_, _))

  val ld_byte_hitvec_lo = (0 until 4).map(j => (0 until DEPTH).map(i => (ld_addr_hitvec_lo(i) & buf_byteen(i)(j) & ldst_byteen_lo_m(j)).asUInt).reverse.reduce(Cat(_, _)))
  val ld_byte_hitvec_hi = (0 until 4).map(j => (0 until DEPTH).map(i => (ld_addr_hitvec_hi(i) & buf_byteen(i)(j) & ldst_byteen_hi_m(j)).asUInt).reverse.reduce(Cat(_, _)))

  val buf_age_younger = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_age_younger := buf_age_younger.map(i=> 0.U)
  ld_byte_hitvecfn_lo := (0 until 4).map(j => (0 until DEPTH).map(i => (ld_byte_hitvec_lo(j)(i) & !(ld_byte_hitvec_lo(j) & buf_age_younger(i)).orR & !ld_byte_ibuf_hit_lo(j)).asUInt).reverse.reduce(Cat(_, _)))
  ld_byte_hitvecfn_hi := (0 until 4).map(j => (0 until DEPTH).map(i => (ld_byte_hitvec_hi(j)(i) & !(ld_byte_hitvec_hi(j) & buf_age_younger(i)).orR & !ld_byte_ibuf_hit_hi(j)).asUInt).reverse.reduce(Cat(_, _)))

  val ibuf_addr = WireInit(UInt(32.W), 0.U)
  val ibuf_write = WireInit(Bool(), false.B)
  val ibuf_valid = WireInit(Bool(), false.B)
  val ld_addr_ibuf_hit_lo = (io.lsu_addr_m(31, 2) === ibuf_addr(31, 2)) & ibuf_write & ibuf_valid & io.lsu_busreq_m
  val ld_addr_ibuf_hit_hi = (io.end_addr_m(31, 2) === ibuf_addr(31, 2)) & ibuf_write & ibuf_valid & io.lsu_busreq_m

  val ibuf_byteen = WireInit(UInt(4.W), 0.U)

  ld_byte_ibuf_hit_lo := Fill(4, ld_addr_ibuf_hit_lo) & ibuf_byteen & ldst_byteen_lo_m
  ld_byte_ibuf_hit_hi := Fill(4, ld_addr_ibuf_hit_hi) & ibuf_byteen & ldst_byteen_hi_m

  val buf_data = Wire(Vec(DEPTH, UInt(32.W)))
  buf_data := buf_data.map(i=> 0.U)
  val fwd_data = WireInit(UInt(32.W), 0.U)
  val ld_fwddata_buf_lo_initial = (0 until 4).map(i=>Fill(8, ld_byte_ibuf_hit_lo(i))).reverse.reduce(Cat(_,_))
  val ld_fwddata_buf_hi_initial = (0 until 4).map(i=>Fill(8, ld_byte_ibuf_hit_hi(i))).reverse.reduce(Cat(_,_))
  io.ld_fwddata_buf_lo := Cat((0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_lo(3)(i)) & buf_data(i)(31, 24)).reduce(_ | _),
    (0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_lo(2)(i)) & buf_data(i)(23, 16)).reduce(_ | _),
    (0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_lo(1)(i)) & buf_data(i)(15,  8)).reduce(_ | _),
    (0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_lo(0)(i)) & buf_data(i)(7 ,  0)).reduce(_ | _)) |
    (ld_fwddata_buf_lo_initial & ibuf_data)

  io.ld_fwddata_buf_hi := Cat((0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_hi(3)(i)) & buf_data(i)(31, 24)).reduce(_ | _),
    (0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_hi(2)(i)) & buf_data(i)(23, 16)).reduce(_ | _),
    (0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_hi(1)(i)) & buf_data(i)(15,  8)).reduce(_ | _),
    (0 until DEPTH).map(i => Fill(8, ld_byte_hitvecfn_hi(0)(i)) & buf_data(i)(7 ,  0)).reduce(_ | _)) |
    (ld_fwddata_buf_hi_initial & ibuf_data)

  val bus_coalescing_disable = io.dec_tlu_wb_coalescing_disable | BUILD_AHB_LITE.B
  val ldst_byteen_r = Mux1H(Seq(io.lsu_pkt_r.bits.by   -> 1.U(4.W),
    io.lsu_pkt_r.bits.half -> 3.U(4.W),
    io.lsu_pkt_r.bits.word -> 15.U(4.W)))

  val ldst_byteen_hi_r = Mux1H(Seq((io.lsu_addr_r(1,0)===0.U)->0.U(4.W),
    (io.lsu_addr_r(1,0)===1.U)->Cat(0.U(3.W), ldst_byteen_r(3)),
    (io.lsu_addr_r(1,0)===2.U)->Cat(0.U(2.W), ldst_byteen_r(3,2)),
    (io.lsu_addr_r(1,0)===3.U)->Cat(0.U(1.W), ldst_byteen_r(3,1))))
  val ldst_byteen_lo_r = Mux1H(Seq((io.lsu_addr_r(1,0)===0.U)->ldst_byteen_r,
    (io.lsu_addr_r(1,0)===1.U)->Cat(ldst_byteen_r(2,0), 0.U),
    (io.lsu_addr_r(1,0)===2.U)->Cat(ldst_byteen_r(1,0), 0.U(2.W)),
    (io.lsu_addr_r(1,0)===3.U)->Cat(ldst_byteen_r(0)  , 0.U(3.W))))

  val store_data_hi_r = Mux1H(Seq((io.lsu_addr_r(1,0)===0.U)->0.U(32.W),
    (io.lsu_addr_r(1,0)===1.U)->Cat(0.U(24.W) , io.store_data_r(31,24)),
    (io.lsu_addr_r(1,0)===2.U)->Cat(0.U(16.W), io.store_data_r(31,16)),
    (io.lsu_addr_r(1,0)===3.U)->Cat(0.U(8.W), io.store_data_r(31,8))))

  val store_data_lo_r = Mux1H(Seq((io.lsu_addr_r(1,0)===0.U)->io.store_data_r,
    (io.lsu_addr_r(1,0)===1.U)->Cat(io.store_data_r(23,0), 0.U(8.W)),
    (io.lsu_addr_r(1,0)===2.U)->Cat(io.store_data_r(15,0), 0.U(16.W)),
    (io.lsu_addr_r(1,0)===3.U)->Cat(io.store_data_r(7 ,0)  , 0.U(24.W))))


  val ldst_samedw_r = io.lsu_addr_r(3) === io.end_addr_r(3)
  val is_aligned_r = Mux1H(Seq(io.lsu_pkt_r.bits.word -> (io.lsu_addr_r(1, 0) === 0.U),
    io.lsu_pkt_r.bits.half -> !io.lsu_addr_r(0),
    io.lsu_pkt_r.bits.by -> 1.U))
  val ibuf_byp = io.lsu_busreq_r & (io.lsu_pkt_r.bits.load | io.no_word_merge_r) & !ibuf_valid
  val ibuf_wr_en = io.lsu_busreq_r & io.lsu_commit_r & !ibuf_byp
  val ibuf_drain_vld = WireInit(Bool(), false.B)
  val ibuf_rst = (ibuf_drain_vld & !ibuf_wr_en) | io.dec_tlu_force_halt
  val ibuf_force_drain = io.lsu_busreq_m & !io.lsu_busreq_r & ibuf_valid & (io.lsu_pkt_m.bits.load | (ibuf_addr(31, 2) =/= io.lsu_addr_m(31, 2)))
  val ibuf_sideeffect = WireInit(Bool(), false.B)
  val ibuf_timer = WireInit(UInt(TIMER_LOG2.W), 0.U)
  val ibuf_merge_en = WireInit(Bool(), false.B)
  val ibuf_merge_in = WireInit(Bool(), false.B)
  ibuf_drain_vld := ibuf_valid & (((ibuf_wr_en | (ibuf_timer === TIMER_MAX.U)) & !(ibuf_merge_en & ibuf_merge_in))
    | ibuf_byp | ibuf_force_drain | ibuf_sideeffect | !ibuf_write | bus_coalescing_disable)
  val ibuf_tag = WireInit(UInt(DEPTH_LOG2.W), 0.U)
  val WrPtr1_r = WireInit(UInt(DEPTH_LOG2.W), 0.U)
  val WrPtr0_r = WireInit(UInt(DEPTH_LOG2.W), 0.U)

  val ibuf_tag_in = Mux(ibuf_merge_en & ibuf_merge_in, ibuf_tag, Mux(io.ldst_dual_r, WrPtr1_r, WrPtr0_r))
  val ibuf_dualtag_in = WrPtr0_r
  val ibuf_sz_in = Cat(io.lsu_pkt_r.bits.word, io.lsu_pkt_r.bits.half)
  val ibuf_addr_in = Mux(io.ldst_dual_r, io.end_addr_r, io.lsu_addr_r)
  val ibuf_byteen_in = Mux(ibuf_merge_en & ibuf_merge_in, ibuf_byteen(3, 0) | ldst_byteen_lo_r(3, 0),
    Mux(io.ldst_dual_r, ldst_byteen_hi_r(3, 0), ldst_byteen_lo_r(3, 0)))


  val ibuf_data_in = (0 until 4).map(i => Mux(ibuf_merge_en & ibuf_merge_in,
    Mux(ldst_byteen_lo_r(i), store_data_lo_r((8 * i) + 7, 8 * i), ibuf_data((8 * i) + 7, 8 * i)),
    Mux(io.ldst_dual_r, store_data_hi_r((8 * i) + 7, 8 * i), store_data_lo_r((8 * i) + 7, 8 * i)))).reverse.reduce(Cat(_, _))
  val ibuf_timer_in = Mux(ibuf_wr_en, 0.U, Mux((ibuf_timer<TIMER_MAX.U).asBool(), ibuf_timer+1.U, ibuf_timer))

  ibuf_merge_en := io.lsu_busreq_r & io.lsu_commit_r & io.lsu_pkt_r.bits.store & ibuf_valid & ibuf_write & (io.lsu_addr_r(31,2) === ibuf_addr(31,2)) & !io.is_sideeffects_r & !bus_coalescing_disable
  ibuf_merge_in := !io.ldst_dual_r
  val ibuf_byteen_out = (0 until 4).map(i=>(Mux(ibuf_merge_en & !ibuf_merge_in, ibuf_byteen(i) | ldst_byteen_lo_r(i), ibuf_byteen(i))).asUInt).reverse.reduce(Cat(_,_))
  val ibuf_data_out = (0 until 4).map(i=>Mux(ibuf_merge_en & !ibuf_merge_in, Mux(ldst_byteen_lo_r(i), store_data_lo_r((8*i)+7, 8*i), ibuf_data((8*i)+7, 8*i)), ibuf_data((8*i)+7, 8*i))).reverse.reduce(Cat(_,_))

  ibuf_valid := withClock(io.lsu_free_c2_clk){RegNext(Mux(ibuf_wr_en, true.B, ibuf_valid) & !ibuf_rst, false.B)}
  ibuf_tag := withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(ibuf_tag_in, 0.U, ibuf_wr_en)}
  val ibuf_dualtag = withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(ibuf_dualtag_in, 0.U, ibuf_wr_en)}
  val ibuf_dual = withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(io.ldst_dual_r, 0.U, ibuf_wr_en)}
  val ibuf_samedw = withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(ldst_samedw_r, 0.U, ibuf_wr_en)}
  val ibuf_nomerge = withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(io.no_dword_merge_r, 0.U, ibuf_wr_en)}
  ibuf_sideeffect := withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(io.is_sideeffects_r, 0.U, ibuf_wr_en)}
  val ibuf_unsign = withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(io.lsu_pkt_r.bits.unsign, 0.U, ibuf_wr_en)}
  ibuf_write := withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(io.lsu_pkt_r.bits.store, 0.U, ibuf_wr_en)}
  val ibuf_sz = withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(ibuf_sz_in, 0.U, ibuf_wr_en)}
  ibuf_addr := rvdffe(ibuf_addr_in, ibuf_wr_en, clock, io.scan_mode)
  ibuf_byteen := withClock(io.lsu_bus_ibuf_c1_clk) {RegEnable(ibuf_byteen_in, 0.U, ibuf_wr_en)}
  ibuf_data := rvdffe(ibuf_data_in, ibuf_wr_en, clock, io.scan_mode)
  ibuf_timer := withClock(io.lsu_free_c2_clk) {RegNext(ibuf_timer_in, 0.U)}
  val buf_numvld_wrcmd_any = WireInit(UInt(4.W), 0.U)
  val buf_numvld_cmd_any = WireInit(UInt(4.W), 0.U)
  val obuf_wr_timer = WireInit(UInt(TIMER_LOG2.W), 0.U)
  val buf_nomerge = Wire(Vec(DEPTH, Bool()))
  buf_nomerge := buf_nomerge.map(i=> false.B)

  val buf_sideeffect = WireInit(UInt(LSU_NUM_NBLOAD.W), 0.U)
  val obuf_force_wr_en = WireInit(Bool(), false.B)
  val obuf_wr_en = WireInit(Bool(), false.B)
  val obuf_wr_wait = (buf_numvld_wrcmd_any===1.U) & (buf_numvld_cmd_any===1.U) & (obuf_wr_timer =/= TIMER_MAX.U) &
    !bus_coalescing_disable & !Mux1H((0 until math.pow(2,LSU_NUM_NBLOAD_WIDTH).asInstanceOf[Int]).map(i=>(CmdPtr0===i.U)->buf_nomerge(i))) &
    !Mux1H((0 until math.pow(2,LSU_NUM_NBLOAD_WIDTH).asInstanceOf[Int]).map(i=>(CmdPtr0===i.U)->buf_sideeffect(i))) & !obuf_force_wr_en
  val obuf_wr_timer_in = Mux(obuf_wr_en, 0.U(3.W), Mux(buf_numvld_cmd_any.orR & (obuf_wr_timer<TIMER_MAX.U), obuf_wr_timer+1.U, obuf_wr_timer))
  obuf_force_wr_en := io.lsu_busreq_m & !io.lsu_busreq_r & !ibuf_valid & (buf_numvld_cmd_any===1.U) & (io.lsu_addr_m(31,2)=/=Mux1H((0 until math.pow(2,LSU_NUM_NBLOAD_WIDTH).asInstanceOf[Int]).map(i=>(CmdPtr0===i.U)->buf_addr(i)(31,2))))
  val buf_numvld_pend_any = WireInit(UInt(4.W), 0.U)
  val ibuf_buf_byp = ibuf_byp & (buf_numvld_pend_any===0.U) & (!io.lsu_pkt_r.bits.store | io.no_dword_merge_r)
  val bus_sideeffect_pend = WireInit(Bool(), false.B)
  val found_cmdptr0 = WireInit(Bool(), false.B)
  val buf_cmd_state_bus_en = Wire(Vec(DEPTH, Bool()))
  buf_cmd_state_bus_en := buf_cmd_state_bus_en.map(i=> false.B)
  val buf_dual = Wire(Vec(DEPTH, Bool()))
  buf_dual := buf_dual.map(i=> false.B)
  val buf_samedw = Wire(Vec(DEPTH, Bool()))
  buf_samedw := buf_samedw.map(i=> false.B)
  val found_cmdptr1 = WireInit(Bool(), false.B)
  val bus_cmd_ready = WireInit(Bool(), false.B)
  val obuf_valid = WireInit(Bool(), false.B)
  val obuf_nosend = WireInit(Bool(), false.B)
  val lsu_bus_cntr_overflow = WireInit(Bool(), false.B)
  val bus_addr_match_pending = WireInit(Bool(), false.B)
  obuf_wr_en := ((ibuf_buf_byp & io.lsu_commit_r & !(io.is_sideeffects_r & bus_sideeffect_pend)) |
    ((indexing(buf_state, CmdPtr0) === cmd_C) &
      found_cmdptr0 & !indexing(buf_cmd_state_bus_en.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) & !(indexing(buf_sideeffect, CmdPtr0) & bus_sideeffect_pend) &
      (!(indexing(buf_dual.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) & indexing(buf_samedw.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) & !indexing(buf_write, CmdPtr0)) | found_cmdptr1 | indexing(buf_nomerge.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) |
        obuf_force_wr_en))) & (bus_cmd_ready | !obuf_valid | obuf_nosend) & !obuf_wr_wait & !lsu_bus_cntr_overflow & !bus_addr_match_pending & io.lsu_bus_clk_en
  val bus_cmd_sent = WireInit(Bool(), false.B)
  val obuf_rst = ((bus_cmd_sent | (obuf_valid & obuf_nosend)) & !obuf_wr_en & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
  val obuf_write_in = Mux(ibuf_buf_byp, io.lsu_pkt_r.bits.store, indexing(buf_write, CmdPtr0))
  val obuf_sideeffect_in = Mux(ibuf_buf_byp, io.is_sideeffects_r, indexing(buf_sideeffect, CmdPtr0))
  val obuf_addr_in = Mux(ibuf_buf_byp, io.lsu_addr_r, indexing(buf_addr, CmdPtr0))
  val buf_sz = Wire(Vec(DEPTH, UInt(2.W)))
  buf_sz := buf_sz.map(i=> 0.U)
  val obuf_sz_in = Mux(ibuf_buf_byp, Cat(io.lsu_pkt_r.bits.word, io.lsu_pkt_r.bits.half), indexing(buf_sz, CmdPtr0))
  val obuf_merge_en = WireInit(Bool(), false.B)
  val obuf_merge_in = obuf_merge_en
  val obuf_tag0_in = Mux(ibuf_buf_byp, WrPtr0_r, CmdPtr0)
  //val Cmdptr1 = WireInit(UInt(DEPTH_LOG2.W), 0.U)

  val obuf_tag1_in = Mux(ibuf_buf_byp, WrPtr1_r, CmdPtr1)
  val obuf_cmd_done = WireInit(Bool(), false.B)
  val bus_wcmd_sent = WireInit(Bool(), false.B)
  val obuf_cmd_done_in = !(obuf_wr_en | obuf_rst) & (obuf_cmd_done | bus_wcmd_sent)
  val obuf_data_done = WireInit(Bool(), false.B)
  val bus_wdata_sent = WireInit(Bool(), false.B)
  val obuf_data_done_in = !(obuf_wr_en | obuf_rst) & (obuf_data_done | bus_wdata_sent)
  val obuf_aligned_in = Mux(ibuf_buf_byp, is_aligned_r, obuf_sz_in(1,0)===0.U | (obuf_sz_in(0) & !obuf_addr_in(0)) | (obuf_sz_in(1)&(!obuf_addr_in(1,0).orR)))

  val obuf_nosend_in = WireInit(Bool(), false.B)
  val obuf_rdrsp_pend = WireInit(Bool(), false.B)
  val bus_rsp_read = WireInit(Bool(), false.B)
  val bus_rsp_read_tag = WireInit(UInt(LSU_BUS_TAG.W), 0.U)
  val obuf_rdrsp_tag = WireInit(UInt(LSU_BUS_TAG.W), 0.U)
  val obuf_write = WireInit(Bool(), false.B)
  val obuf_rdrsp_pend_in = (!(obuf_wr_en & !obuf_nosend_in) & obuf_rdrsp_pend & !(bus_rsp_read & (bus_rsp_read_tag === obuf_rdrsp_tag))) |
    ((bus_cmd_sent & !obuf_write) & !io.dec_tlu_force_halt)
  val obuf_tag0 = WireInit(UInt(LSU_BUS_TAG.W), 0.U)
  val obuf_rdrsp_tag_in = Mux(bus_cmd_sent & !obuf_write, obuf_tag0, obuf_rdrsp_tag)
  val obuf_addr = WireInit(UInt(32.W), 0.U)
  val obuf_sideeffect = WireInit(Bool(), false.B)
  obuf_nosend_in := (obuf_addr_in(31,3)===obuf_addr(31,3)) & obuf_aligned_in & !obuf_sideeffect & !obuf_write & !obuf_write_in & !io.dec_tlu_external_ldfwd_disable &
    ((obuf_valid & !obuf_nosend) | (obuf_rdrsp_pend & !(bus_rsp_read & (bus_rsp_read_tag === obuf_rdrsp_tag))))
  val obuf_byteen0_in = Mux(ibuf_buf_byp, Mux(io.lsu_addr_r(2), Cat(ldst_byteen_lo_r, 0.U(4.W)), Cat(0.U(4.W), ldst_byteen_lo_r)),
    Mux(indexing(buf_addr, CmdPtr0)(2).asBool(), Cat(indexing(buf_byteen, CmdPtr0), 0.U(4.W)), Cat(0.U(4.W),indexing(buf_byteen, CmdPtr0))))
  val obuf_byteen1_in = Mux(ibuf_buf_byp, Mux(io.end_addr_r(2), Cat(ldst_byteen_hi_r, 0.U(4.W)), Cat(0.U(4.W), ldst_byteen_hi_r)),
    Mux(indexing(buf_addr, CmdPtr1)(2).asBool(), Cat(indexing(buf_byteen, CmdPtr1), 0.U(4.W)), Cat(0.U(4.W),indexing(buf_byteen, CmdPtr1))))

  val obuf_data0_in = Mux(ibuf_buf_byp, Mux(io.lsu_addr_r(2), Cat(store_data_lo_r, 0.U(32.W)), Cat(0.U(32.W), store_data_lo_r)),
    Mux(indexing(buf_addr, CmdPtr0)(2).asBool(), Cat(indexing(buf_data, CmdPtr0), 0.U(32.W)), Cat(0.U(32.W),indexing(buf_data, CmdPtr0))))
  val obuf_data1_in = Mux(ibuf_buf_byp, Mux(io.lsu_addr_r(2), Cat(store_data_hi_r, 0.U(32.W)), Cat(0.U(32.W), store_data_hi_r)),
    Mux(indexing(buf_addr, CmdPtr1)(2).asBool(), Cat(indexing(buf_data, CmdPtr1), 0.U(32.W)), Cat(0.U(32.W),indexing(buf_data, CmdPtr1))))
  val obuf_byteen_in = (0 until 8).map(i=>(obuf_byteen0_in(i) | (obuf_merge_en & obuf_byteen1_in(i))).asUInt).reverse.reduce(Cat(_,_))
  val obuf_data_in = (0 until 8).map(i=>Mux(obuf_merge_en & obuf_byteen1_in(i), obuf_data1_in((8*i)+7, 8*i), obuf_data0_in((8*i)+7, 8*i))).reverse.reduce(Cat(_,_))

  val buf_dualhi = Wire(Vec(DEPTH, Bool()))
  buf_dualhi := buf_dualhi.map(i=> false.B)
  obuf_merge_en := ((CmdPtr0 =/= CmdPtr1) & found_cmdptr0 & found_cmdptr1 & (indexing(buf_state, CmdPtr0) === cmd_C) & (indexing(buf_state, CmdPtr1) === cmd_C) &
    !indexing(buf_cmd_state_bus_en.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) & !indexing(buf_sideeffect, CmdPtr0) &
    ((indexing(buf_write, CmdPtr0) & indexing(buf_write, CmdPtr1) &
      (indexing(buf_addr, CmdPtr0)(31,3)===indexing(buf_addr, CmdPtr1)(31,3)) & !bus_coalescing_disable & !BUILD_AXI_NATIVE.B) |
      (!indexing(buf_write, CmdPtr0) & indexing(buf_dual.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) & !indexing(buf_dualhi.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0) & indexing(buf_samedw.map(_.asUInt).reverse.reduce(Cat(_,_)), CmdPtr0)))) |
    (ibuf_buf_byp & ldst_samedw_r & io.ldst_dual_r)

  val obuf_wr_enQ = withClock(io.lsu_busm_clk){RegNext(obuf_wr_en, false.B)}
  obuf_valid := withClock(io.lsu_free_c2_clk){RegNext(Mux(obuf_wr_en, true.B, obuf_valid) & !obuf_rst, false.B)}
  obuf_nosend := withClock(io.lsu_free_c2_clk){RegEnable(obuf_nosend_in, false.B, obuf_wr_en)}
  obuf_cmd_done := withClock(io.lsu_busm_clk){RegNext(obuf_cmd_done_in, false.B)}
  obuf_data_done := withClock(io.lsu_busm_clk){RegNext(obuf_data_done_in, false.B)}
  obuf_rdrsp_pend := withClock(io.lsu_busm_clk){RegNext(obuf_rdrsp_pend_in, false.B)}
  obuf_rdrsp_tag := withClock(io.lsu_busm_clk){RegNext(obuf_rdrsp_tag_in, 0.U)}
  obuf_tag0 := withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_tag0_in, 0.U, obuf_wr_en)}
  val obuf_tag1 = withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_tag1_in, 0.U, obuf_wr_en)}
  val obuf_merge = withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_merge_in, false.B, obuf_wr_en)}
  obuf_write := withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_write_in, false.B, obuf_wr_en)}
  obuf_sideeffect := withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_sideeffect_in, false.B, obuf_wr_en)}
  val obuf_sz = withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_sz_in, 0.U, obuf_wr_en)}
  obuf_addr := rvdffe(obuf_addr_in, obuf_wr_en, clock, io.scan_mode)
  val obuf_byteen = withClock(io.lsu_bus_obuf_c1_clk){RegEnable(obuf_byteen_in, 0.U, obuf_wr_en)}
  val obuf_data = rvdffe(obuf_data_in, obuf_wr_en, clock, io.scan_mode)
  obuf_wr_timer := withClock(io.lsu_busm_clk){RegNext(obuf_wr_timer_in, 0.U)}
  val WrPtr0_m = WireInit(UInt(DEPTH_LOG2.W), 0.U)

  WrPtr0_m := MuxCase(3.U, (0 until DEPTH).map(i=>((buf_state(i)===idle_C) &
    !((ibuf_valid & (ibuf_tag===i.U)) | (io.lsu_busreq_r &
      ((WrPtr0_r === i.U) | (io.ldst_dual_r & (WrPtr1_r === i.U)))))) -> i.U))


  val WrPtr1_m = WireInit(UInt(DEPTH_LOG2.W), 0.U)
  WrPtr1_m := MuxCase(3.U, (0 until DEPTH).map(i=>((buf_state(i)===idle_C) & !((ibuf_valid & (ibuf_tag===i.U)) |
    (io.lsu_busreq_m & (WrPtr0_m===i.U)) |
    (io.lsu_busreq_r & (((WrPtr0_r === i.U)) |
      (io.ldst_dual_r & (WrPtr1_r===i.U))))))           ->  i.U))

  val buf_age = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_age := buf_age.map(i=> 0.U)

  val CmdPtr0Dec = (0 until DEPTH).map(i=> (!(buf_age(i).orR) & (buf_state(i)===cmd_C) & !buf_cmd_state_bus_en(i)).asUInt).reverse.reduce(Cat(_,_))
  val CmdPtr1Dec = (0 until DEPTH).map(i=> (!((buf_age(i) & (~CmdPtr0Dec)).orR) & !CmdPtr0Dec(i) & (buf_state(i)===cmd_C) & !buf_cmd_state_bus_en(i)).asUInt).reverse.reduce(Cat(_,_))
  val buf_rsp_pickage = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_rsp_pickage := buf_rsp_pickage.map(i=> 0.U)
  val RspPtrDec = (0 until DEPTH).map(i=> (!(buf_rsp_pickage(i).orR) & (buf_state(i)===done_wait_C)).asUInt).reverse.reduce(Cat(_,_))
  found_cmdptr0 := CmdPtr0Dec.orR
  found_cmdptr1 := CmdPtr1Dec.orR

  def Enc8x3(in: UInt) : UInt = Cat(in(4)|in(5)|in(6)|in(7), in(2)|in(3)|in(6)|in(7), in(1)|in(3)|in(5)|in(7))



  val RspPtr = WireInit(UInt(DEPTH_LOG2.W), 0.U)
  CmdPtr0 := Enc8x3(Cat(Fill(8-DEPTH, 0.U),CmdPtr0Dec))

  CmdPtr1 := Enc8x3(Cat(Fill(8-DEPTH, 0.U),CmdPtr1Dec))
  RspPtr := Enc8x3(Cat(Fill(8-DEPTH, 0.U),RspPtrDec))
  val buf_state_en = Wire(Vec(DEPTH, Bool()))
  buf_state_en := buf_state_en.map(i=> false.B)
  val buf_rspageQ = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_rspageQ := buf_rspageQ.map(i=> 0.U)
  val buf_rspage_set = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_rspage_set := buf_rspage_set.map(i=> 0.U)
  val buf_rspage_in = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_rspage_in := buf_rspage_in.map(i=> 0.U)
  val buf_rspage = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_rspage := buf_rspage.map(i=> 0.U)

  val buf_age_in = (0 until DEPTH).map(i=>(0 until DEPTH).map(j=> ((((buf_state(i)===idle_C) & buf_state_en(i)) &
    (((buf_state(j)===wait_C) | ((buf_state(j)===cmd_C) & !buf_cmd_state_bus_en(j))) |
      (ibuf_drain_vld & io.lsu_busreq_r & (ibuf_byp | io.ldst_dual_r) & (WrPtr0_r === i.U) & (ibuf_tag === j.U)) |
      (ibuf_byp & io.lsu_busreq_r & io.ldst_dual_r & (WrPtr1_r === i.U) & (WrPtr0_r === j.U)))) | buf_age(i)(j)).asUInt).reverse.reduce(Cat(_,_)))
  val buf_ageQ = Wire(Vec(DEPTH, UInt(DEPTH.W)))
  buf_ageQ := buf_ageQ.map(i=> 0.U)
  buf_age := (0 until DEPTH).map(i=>(0 until DEPTH).map(j=>(buf_ageQ(i)(j) & !((buf_state(j)===cmd_C) & buf_cmd_state_bus_en(j))).asUInt).reverse.reduce(Cat(_,_)))
  buf_age_younger := (0 until DEPTH).map(i=>(0 until DEPTH).map(j=>(Mux(i.U===j.U, 0.U, !buf_age(i)(j) & (buf_state(j)=/=idle_C))).asUInt).reverse.reduce(Cat(_,_)))
  buf_rsp_pickage := (0 until DEPTH).map(i=>(0 until DEPTH).map(j=>(buf_rspageQ(i)(j) & (buf_state(j)===done_wait_C)).asUInt).reverse.reduce(Cat(_,_)))

  buf_rspage_set := (0 until DEPTH).map(i=>(0 until DEPTH).map(j=>(((buf_state(i)===idle_C) & buf_state_en(i)) &
    (!((buf_state(j)===idle_C) | (buf_state(j)===done_C)) |
      (ibuf_drain_vld & io.lsu_busreq_r & (ibuf_byp | io.ldst_dual_r) & (WrPtr0_r===i.U) & (ibuf_tag===j.U)) |
      (ibuf_byp & io.lsu_busreq_r & io.ldst_dual_r & (WrPtr1_r===i.U) & (WrPtr0_r===j.U)))).asUInt).reverse.reduce(Cat(_,_)))
  buf_rspage_in := (0 until DEPTH).map(i=>(0 until DEPTH).map(j=>(buf_rspage_set(i)(j) | buf_rspage(i)(j)).asUInt).reverse.reduce(Cat(_,_)))
  buf_rspage := (0 until DEPTH).map(i=>(0 until DEPTH).map(j=>(buf_rspageQ(i)(j) & !((buf_state(j)===done_C) | (buf_state(j)===idle_C))).asUInt).reverse.reduce(Cat(_,_)))




  ibuf_drainvec_vld := (0 until DEPTH).map(i=>(ibuf_drain_vld & (ibuf_tag === i.U)).asUInt).reverse.reduce(Cat(_,_))
  buf_byteen_in := (0 until DEPTH).map(i=>Mux(ibuf_drainvec_vld(i), ibuf_byteen_out(3,0),
    Mux(ibuf_byp & io.ldst_dual_r & (WrPtr1_r===i.U), ldst_byteen_hi_r(3,0), ldst_byteen_lo_r(3,0))))
  buf_addr_in := (0 until DEPTH).map(i=>Mux(ibuf_drainvec_vld(i), ibuf_addr, Mux(ibuf_byp & io.ldst_dual_r & (WrPtr1_r===i.U), io.end_addr_r, io.lsu_addr_r)))
  buf_dual_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_dual, io.ldst_dual_r)).asUInt).reverse.reduce(Cat(_,_))
  buf_samedw_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_samedw, ldst_samedw_r)).asUInt).reverse.reduce(Cat(_,_))
  buf_nomerge_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_nomerge | ibuf_force_drain, io.no_dword_merge_r)).asUInt).reverse.reduce(Cat(_,_))
  buf_dualhi_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_dual ,ibuf_byp & io.ldst_dual_r & (WrPtr1_r===i.U))).asUInt).reverse.reduce(Cat(_,_))
  buf_dualtag_in := (0 until DEPTH).map(i=>Mux(ibuf_drainvec_vld(i), ibuf_dualtag, Mux(ibuf_byp & io.ldst_dual_r & (WrPtr1_r===i.U), WrPtr0_r, WrPtr1_r)))
  buf_sideeffect_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_sideeffect, io.is_sideeffects_r)).asUInt).reverse.reduce(Cat(_,_))
  buf_unsign_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_unsign, io.lsu_pkt_r.bits.unsign)).asUInt).reverse.reduce(Cat(_,_))
  buf_sz_in := (0 until DEPTH).map(i=>Mux(ibuf_drainvec_vld(i), ibuf_sz, Cat(io.lsu_pkt_r.bits.word, io.lsu_pkt_r.bits.half)))
  buf_write_in := (0 until DEPTH).map(i=>(Mux(ibuf_drainvec_vld(i), ibuf_write, io.lsu_pkt_r.bits.store)).asUInt).reverse.reduce(Cat(_,_))

  for(i<- 0 until DEPTH) {
    switch(buf_state(i)) {
      is(idle_C) {
        buf_nxtstate(i) := Mux(io.lsu_bus_clk_en.asBool(), cmd_C, wait_C)
        buf_state_en(i) := (io.lsu_busreq_r & io.lsu_commit_r & (((ibuf_byp | io.ldst_dual_r) & !ibuf_merge_en & (i === WrPtr0_r)) | (ibuf_byp & io.ldst_dual_r & (i === WrPtr1_r)))) | (ibuf_drain_vld & (i === ibuf_tag))
        buf_wr_en(i) := buf_state_en(i)
        buf_data_en(i) := buf_state_en(i)
        buf_data_in(i) := Mux((ibuf_drain_vld & (i === ibuf_tag)).asBool(), ibuf_data_out(31, 0), store_data_lo_r(31, 0))
      }
      is(wait_C) {
        buf_nxtstate(i) := Mux(io.dec_tlu_force_halt.asBool(), idle_C, cmd_C)
        buf_state_en(i) := io.lsu_bus_clk_en | io.dec_tlu_force_halt
      }
      is(cmd_C) {
        buf_nxtstate(i) := Mux(io.dec_tlu_force_halt.asBool(), idle_C, Mux((obuf_nosend & bus_rsp_read & (bus_rsp_read_tag === obuf_rdrsp_tag)), done_wait_C, resp_C))
        buf_cmd_state_bus_en(i) := ((obuf_tag0 === i.asUInt(LSU_BUS_TAG.W)) | (obuf_merge & (obuf_tag1 === i.asUInt(LSU_BUS_TAG.W)))) & obuf_valid & obuf_wr_enQ
        buf_state_bus_en(i) := buf_cmd_state_bus_en(i)
        buf_state_en(i) := (buf_state_bus_en(i) & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
        buf_ldfwd_in(i) := true.B
        buf_ldfwd_en(i) := buf_state_en(i) & !buf_write(i) & obuf_nosend & !io.dec_tlu_force_halt
        buf_ldfwdtag_in(i) := (obuf_rdrsp_tag(LSU_BUS_TAG - 2, 0)).asUInt
        buf_data_en(i) := buf_state_bus_en(i) & io.lsu_bus_clk_en & obuf_nosend & bus_rsp_read
        buf_error_en(i) := buf_state_bus_en(i) & io.lsu_bus_clk_en & obuf_nosend & bus_rsp_read_error
        buf_data_in(i) := Mux(buf_error_en(i), bus_rsp_rdata(31, 0), Mux(buf_addr(i)(2), bus_rsp_rdata(63, 32), bus_rsp_rdata(31, 0)))
      }
      is(resp_C) {
        buf_nxtstate(i) := Mux((io.dec_tlu_force_halt | (buf_write(i) & !(BUILD_AXI_NATIVE.B & bus_rsp_write_error))).asBool(), idle_C,
          Mux((buf_dual(i) & !buf_samedw(i) & !buf_write(i) & (buf_state(buf_dualtag(i)) =/= done_partial_C)), done_partial_C,
            Mux((buf_ldfwd(i) | any_done_wait_state | (buf_dual(i) & !buf_samedw(i) & !buf_write(i) & indexing(buf_ldfwd,buf_dualtag(i)) & (buf_state(buf_dualtag(i)) === done_partial_C) & any_done_wait_state)), done_wait_C, done_C)))
        buf_resp_state_bus_en(i) := (bus_rsp_write & (bus_rsp_write_tag === (i.asUInt(LSU_BUS_TAG.W)))) |
          (bus_rsp_read & ((bus_rsp_read_tag === (i.asUInt(LSU_BUS_TAG.W))) |
            (buf_ldfwd(i) & (bus_rsp_read_tag === (buf_ldfwdtag(i)))) |
            (buf_dual(i) & buf_dualhi(i) & ~buf_write(i) & buf_samedw(i) & (bus_rsp_read_tag === (buf_dualtag(i))))))
        buf_state_bus_en(i) := buf_resp_state_bus_en(i)
        buf_state_en(i) := (buf_state_bus_en(i) & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
        buf_data_en(i) := buf_state_bus_en(i) & bus_rsp_read & io.lsu_bus_clk_en
        buf_error_en(i) := buf_state_bus_en(i) & io.lsu_bus_clk_en & ((bus_rsp_read_error & (bus_rsp_read_tag === (i.asUInt(LSU_BUS_TAG.W)))) |
          (bus_rsp_read_error & buf_ldfwd(i) & (bus_rsp_read_tag === buf_ldfwdtag(i))) |
          (bus_rsp_write_error & BUILD_AXI_NATIVE.B & (bus_rsp_write_tag === i.asUInt(LSU_BUS_TAG.W))))
        buf_data_in(i) := Mux((buf_state_en(i) & !buf_error_en(i)), Mux(buf_addr(i)(2), bus_rsp_rdata(63, 32), bus_rsp_rdata(31, 0)), bus_rsp_rdata(31, 0))
      }
      is(done_partial_C) { // Other part of dual load hasn't returned
        buf_nxtstate(i) := Mux(io.dec_tlu_force_halt.asBool(), idle_C, Mux((buf_ldfwd(i) | buf_ldfwd(buf_dualtag(i)) | any_done_wait_state), done_wait_C, done_C))
        buf_state_bus_en(i) := bus_rsp_read & ((bus_rsp_read_tag === buf_dualtag(i).asUInt()) |
          (buf_ldfwd(buf_dualtag(i)) & (bus_rsp_read_tag === buf_ldfwdtag(buf_dualtag(i)).asUInt())))
        buf_state_en(i) := (buf_state_bus_en(i) & io.lsu_bus_clk_en) | io.dec_tlu_force_halt
      }
      is(done_wait_C) { // WAIT state if there are multiple outstanding nb returns
        buf_nxtstate(i) := Mux(io.dec_tlu_force_halt.asBool(), idle_C, done_C)
        buf_state_en(i) := ((RspPtr === i.asUInt(DEPTH_LOG2.W)) | (buf_dual(i) & (buf_dualtag(i) === RspPtr))) | io.dec_tlu_force_halt
      }
      is(done_C) {
        buf_nxtstate(i) := idle_C
        buf_rst(i) := 1.U
        buf_state_en(i) := 1.U
        buf_ldfwd_in(i) := false.B
        buf_ldfwd_en(i) := buf_state_en(i)
      }
    }
    buf_state(i) := withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_nxtstate(i), 0.U, buf_state_en(i).asBool())}
    buf_ageQ(i) := withClock(io.lsu_bus_buf_c1_clk){RegNext(buf_age_in(i), 0.U)}
    buf_rspageQ(i) := withClock(io.lsu_bus_buf_c1_clk){RegNext(buf_rspage_in(i), 0.U)}
    buf_dualtag(i) := withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_dualtag_in(i), 0.U, buf_wr_en(i).asBool())}
    buf_dual(i) := withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_dual_in(i), false.B, buf_wr_en(i).asBool())}
    buf_samedw(i) := withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_samedw_in(i), false.B, buf_wr_en(i).asBool())}
    buf_nomerge(i) := withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_nomerge_in(i), false.B, buf_wr_en(i).asBool())}
    buf_dualhi(i) := withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_dualhi_in(i), false.B, buf_wr_en(i).asBool())}
  }

  buf_ldfwd := (0 until DEPTH).map(i=>(withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_ldfwd_in(i), false.B, buf_ldfwd_en(i).asBool())}).asUInt()).reverse.reduce(Cat(_,_))
  buf_ldfwdtag := (0 until DEPTH).map(i=>withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_ldfwdtag_in(i), 0.U, buf_ldfwd_en(i).asBool())})
  buf_sideeffect := (0 until DEPTH).map(i=>(withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_sideeffect_in(i), false.B, buf_wr_en(i).asBool())}).asUInt()).reverse.reduce(Cat(_,_))
  buf_unsign := (0 until DEPTH).map(i=>(withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_unsign_in(i), false.B, buf_wr_en(i).asBool())}).asUInt()).reverse.reduce(Cat(_,_))
  buf_write := (0 until DEPTH).map(i=>(withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_write_in(i), false.B, buf_wr_en(i).asBool())}).asUInt()).reverse.reduce(Cat(_,_))
  buf_sz := (0 until DEPTH).map(i=>withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_sz_in(i), 0.U, buf_wr_en(i).asBool())})
  buf_addr := (0 until DEPTH).map(i=>rvdffe(buf_addr_in(i), buf_wr_en(i).asBool(), clock, io.scan_mode))
  buf_byteen := (0 until DEPTH).map(i=>withClock(io.lsu_bus_buf_c1_clk){RegEnable(buf_byteen_in(i), 0.U, buf_wr_en(i).asBool())})
  buf_data := (0 until DEPTH).map(i=>rvdffe(buf_data_in(i), buf_data_en(i), clock, io.scan_mode))
  buf_error := (0 until DEPTH).map(i=>(withClock(io.lsu_bus_buf_c1_clk){RegNext(Mux(buf_error_en(i), true.B, buf_error(i)) & !buf_rst(i), false.B)}).asUInt()).reverse.reduce(Cat(_,_))


  val buf_numvld_any = (Mux(io.ldst_dual_m, Cat(io.lsu_busreq_m, 0.U),io.lsu_busreq_m) +& Mux(io.ldst_dual_r, Cat(io.lsu_busreq_r, 0.U),io.lsu_busreq_r) +& ibuf_valid) + buf_state.map(i=>(i=/=idle_C).asUInt).reduce(_+&_)
  buf_numvld_wrcmd_any := (0 until DEPTH).map(i=>(buf_write(i) & (buf_state(i)===cmd_C) & !buf_cmd_state_bus_en(i)).asUInt).reverse.reduce(_ +& _)
  buf_numvld_cmd_any :=  (0 until DEPTH).map(i=>((buf_state(i)===cmd_C) & !buf_cmd_state_bus_en(i)).asUInt).reverse.reduce(_ +& _)
  buf_numvld_pend_any := (0 until DEPTH).map(i=>((buf_state(i)===wait_C) | ((buf_state(i)===cmd_C) & !buf_cmd_state_bus_en(i))).asUInt).reverse.reduce(_ +& _)
  any_done_wait_state := (0 until DEPTH).map(i=>buf_state(i)===done_wait_C).reverse.reduce(_|_)
  io.lsu_bus_buffer_pend_any := buf_numvld_pend_any.orR
  io.lsu_bus_buffer_full_any := Mux(io.ldst_dual_d & io.dec_lsu_valid_raw_d, buf_numvld_any>=(DEPTH-1).U, buf_numvld_any===DEPTH.U)
  io.lsu_bus_buffer_empty_any := !(buf_state.map(_.orR).reduce(_|_)) & !ibuf_valid & !obuf_valid

  io.lsu_nonblock_load_valid_m := io.lsu_busreq_m & io.lsu_pkt_m.valid & io.lsu_pkt_m.bits.load & !io.flush_m_up & !io.ld_full_hit_m
  io.lsu_nonblock_load_tag_m := WrPtr0_m
  val lsu_nonblock_load_valid_r = WireInit(Bool(), false.B)
  io.lsu_nonblock_load_inv_r := lsu_nonblock_load_valid_r & !io.lsu_commit_r
  io.lsu_nonblock_load_inv_tag_r := WrPtr0_r
  val lsu_nonblock_load_data_ready = Mux1H((0 until DEPTH).map(i=>(buf_state(i)===done_C) -> (!(BUILD_AXI_NATIVE.B & buf_write(i)))))
  io.lsu_nonblock_load_data_error := Mux1H((0 until DEPTH).map(i=>(buf_state(i)===done_C) -> (buf_error(i) & !buf_write(i))))
  io.lsu_nonblock_load_data_tag := Mux1H((0 until DEPTH).map(i=>((buf_state(i)===done_C) & !buf_write(i) & (!buf_dual(i) | !buf_dualhi(i))) -> i.U))
  val lsu_nonblock_load_data_lo = Mux1H((0 until DEPTH).map(i=>((buf_state(i)===done_C) & !buf_write(i) & (!buf_dual(i) | !buf_dualhi(i))) -> buf_data(i)))
  val lsu_nonblock_load_data_hi = Mux1H((0 until DEPTH).map(i=>((buf_state(i)===done_C) & !buf_write(i) & (buf_dual(i) & buf_dualhi(i))) -> buf_data(i)))
  val lsu_nonblock_addr_offset = indexing(buf_addr, io.lsu_nonblock_load_data_tag)(1,0)
  val lsu_nonblock_sz = indexing(buf_sz, io.lsu_nonblock_load_data_tag)
  val lsu_nonblock_unsign = indexing(buf_unsign, io.lsu_nonblock_load_data_tag)
  val lsu_nonblock_dual = indexing(buf_dual.map(_.asUInt).reverse.reduce(Cat(_,_)), io.lsu_nonblock_load_data_tag)
  val lsu_nonblock_data_unalgn = Cat(lsu_nonblock_load_data_hi, lsu_nonblock_load_data_lo) >> (lsu_nonblock_addr_offset * 8.U)

  io.lsu_nonblock_load_data_valid := lsu_nonblock_load_data_ready & !io.lsu_nonblock_load_data_error
  io.lsu_nonblock_load_data := Mux1H(Seq((lsu_nonblock_unsign & (lsu_nonblock_sz===0.U)) -> Cat(0.U(24.W),lsu_nonblock_data_unalgn(7,0)),
    (lsu_nonblock_unsign &  (lsu_nonblock_sz===1.U)) -> Cat(0.U(16.W),lsu_nonblock_data_unalgn(15,0)),
    (!lsu_nonblock_unsign & (lsu_nonblock_sz===0.U)) -> Cat(Fill(24,lsu_nonblock_data_unalgn(7)), lsu_nonblock_data_unalgn(7,0)),
    (!lsu_nonblock_unsign & (lsu_nonblock_sz===1.U)) -> Cat(Fill(16,lsu_nonblock_data_unalgn(15)), lsu_nonblock_data_unalgn(15,0)),
    (lsu_nonblock_sz===2.U)                          -> lsu_nonblock_data_unalgn))
  bus_sideeffect_pend := (0 until DEPTH).map(i=>(buf_state(i)===resp_C) & buf_sideeffect(i) & io.dec_tlu_sideeffect_posted_disable).reduce(_|_)
  bus_addr_match_pending := Mux1H((0 until DEPTH).map(i=>(buf_state(i)===resp_C)->
    (BUILD_AXI_NATIVE.B & obuf_valid & (obuf_addr(31,3)===buf_addr(i)(31,3)) & !((obuf_tag0===i.U) | (obuf_merge & (obuf_tag1===i.U))))))

  bus_cmd_ready := Mux(obuf_write, Mux(obuf_cmd_done | obuf_data_done, Mux(obuf_cmd_done, io.lsu_axi_wready, io.lsu_axi_awready), io.lsu_axi_awready & io.lsu_axi_awready), io.lsu_axi_arready)
  bus_wcmd_sent := io.lsu_axi_awvalid & io.lsu_axi_awready
  bus_wdata_sent := io.lsu_axi_wvalid & io.lsu_axi_wready
  bus_cmd_sent := ((obuf_cmd_done | bus_wcmd_sent) & (obuf_data_done | bus_wdata_sent)) | (io.lsu_axi_arvalid & io.lsu_axi_arready)
  bus_rsp_read := io.lsu_axi_rvalid & io.lsu_axi_rready
  bus_rsp_write := io.lsu_axi_bvalid & io.lsu_axi_bready
  bus_rsp_read_tag := io.lsu_axi_rid
  bus_rsp_write_tag := io.lsu_axi_bid
  bus_rsp_write_error := bus_rsp_write & (io.lsu_axi_bresp =/= 0.U)
  bus_rsp_read_error := bus_rsp_read & (io.lsu_axi_bresp =/= 0.U)
  bus_rsp_rdata := io.lsu_axi_rdata

  // AXI Command signals
  io.lsu_axi_awvalid := obuf_valid & obuf_write & !obuf_cmd_done & !bus_addr_match_pending
  io.lsu_axi_awid := obuf_tag0
  io.lsu_axi_awaddr := Mux(obuf_sideeffect, obuf_addr, Cat(obuf_addr(31,3), 0.U(3.W)))
  io.lsu_axi_awsize := Mux(obuf_sideeffect, Cat(0.U, obuf_sz), 3.U(3.W))
  io.lsu_axi_awprot := 0.U
  io.lsu_axi_awcache := Mux(obuf_sideeffect, 0.U, 15.U)
  io.lsu_axi_awregion := obuf_addr(31,28)
  io.lsu_axi_awlen := 0.U
  io.lsu_axi_awburst := 1.U(2.W)
  io.lsu_axi_awqos := 0.U
  io.lsu_axi_awlock := 0.U

  io.lsu_axi_wvalid := obuf_valid & obuf_write & !obuf_data_done & !bus_addr_match_pending
  io.lsu_axi_wstrb := obuf_byteen & Fill(8, obuf_write)
  io.lsu_axi_wdata := obuf_data
  io.lsu_axi_wlast := 1.U

  io.lsu_axi_arvalid := obuf_valid & !obuf_write & !obuf_nosend & !bus_addr_match_pending
  io.lsu_axi_arid := obuf_tag0
  io.lsu_axi_araddr := Mux(obuf_sideeffect, obuf_addr, Cat(obuf_addr(31,3),0.U(3.W)))
  io.lsu_axi_arsize := Mux(obuf_sideeffect, Cat(0.U, obuf_sz), 3.U(3.W))
  io.lsu_axi_arprot := 0.U
  io.lsu_axi_arcache := Mux(obuf_sideeffect, 0.U(4.W), 15.U)
  io.lsu_axi_arregion := obuf_addr(31,28)
  io.lsu_axi_arlen := 0.U
  io.lsu_axi_arburst := 1.U(2.W)
  io.lsu_axi_arqos := 0.U
  io.lsu_axi_arlock := 0.U
  io.lsu_axi_bready := 1.U
  io.lsu_axi_rready := 1.U
  io.lsu_imprecise_error_store_any := Mux1H((0 until DEPTH).map(i=>(buf_state(i)===done_C)->(io.lsu_bus_clk_en_q & buf_error(i) & buf_write(i))))
  val lsu_imprecise_error_store_tag = Mux1H((0 until DEPTH).map(i=>((buf_state(i)===done_C) & buf_error(i) & buf_write(i))->i.U))

  io.lsu_imprecise_error_load_any := io.lsu_nonblock_load_data_error & !io.lsu_imprecise_error_store_any
  io.lsu_imprecise_error_addr_any := Mux(io.lsu_imprecise_error_store_any, buf_addr(lsu_imprecise_error_store_tag), buf_addr(io.lsu_nonblock_load_data_tag))
  lsu_bus_cntr_overflow := 0.U

  io.lsu_bus_idle_any := 1.U

  // PMU signals
  io.lsu_pmu_bus_trxn := (io.lsu_axi_awvalid & io.lsu_axi_awready) | (io.lsu_axi_wvalid & io.lsu_axi_wready) | (io.lsu_axi_arvalid & io.lsu_axi_arready)
  io.lsu_pmu_bus_misaligned := io.lsu_busreq_r & io.ldst_dual_r & io.lsu_commit_r
  io.lsu_pmu_bus_error := io.lsu_imprecise_error_load_any | io.lsu_imprecise_error_store_any

  io.lsu_pmu_bus_busy := (io.lsu_axi_awvalid & !io.lsu_axi_awready) | (io.lsu_axi_wvalid & !io.lsu_axi_wready) | (io.lsu_axi_arvalid & !io.lsu_axi_arready)

  WrPtr0_r := withClock(io.lsu_c2_r_clk){RegNext(WrPtr0_m, 0.U)}
  WrPtr1_r := withClock(io.lsu_c2_r_clk){RegNext(WrPtr1_m, 0.U)}
  io.lsu_busreq_r := withClock(io.lsu_c2_r_clk){RegNext(io.lsu_busreq_m & !io.flush_r & !io.ld_full_hit_m, false.B)}
  lsu_nonblock_load_valid_r := withClock(io.lsu_c2_r_clk){RegNext(io.lsu_nonblock_load_valid_m, false.B)}
}

object BusBufmain extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog((new el2_lsu_bus_buffer())))
}
