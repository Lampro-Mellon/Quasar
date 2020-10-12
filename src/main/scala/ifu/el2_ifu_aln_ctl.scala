package ifu
import lib._
import chisel3._
import chisel3.util._
import include._

class el2_ifu_aln_ctl extends Module with el2_lib {
  val io = IO(new Bundle{
    val scan_mode = Input(Bool())
    val active_clk              = Input(Clock())
    val ifu_async_error_start   = Input(Bool())
    val iccm_rd_ecc_double_err  = Input(Bool())
    val ic_access_fault_f       = Input(Bool())
    val ic_access_fault_type_f  = Input(UInt(2.W))
    val ifu_bp_fghr_f           = Input(UInt(BHT_GHR_SIZE.W))
    val ifu_bp_btb_target_f     = Input(UInt(32.W))
    val ifu_bp_poffset_f        = Input(UInt(12.W))
    val ifu_bp_hist0_f          = Input(UInt(2.W))
    val ifu_bp_hist1_f          = Input(UInt(2.W))
    val ifu_bp_pc4_f            = Input(UInt(2.W))
    val ifu_bp_way_f            = Input(UInt(2.W))
    val ifu_bp_valid_f          = Input(UInt(2.W))
    val ifu_bp_ret_f            = Input(UInt(2.W))
    val exu_flush_final         = Input(Bool())
    val dec_i0_decode_d         = Input(Bool())
    val ifu_fetch_data_f        = Input(UInt(32.W))
    val ifu_fetch_val           = Input(UInt(2.W))
    val ifu_fetch_pc            = Input(UInt(31.W))
    val ifu_i0_valid            = Output(Bool())
    val ifu_i0_icaf             = Output(Bool())
    val ifu_i0_icaf_type        = Output(UInt(2.W))
    val ifu_i0_icaf_f1          = Output(Bool())
    val ifu_i0_dbecc            = Output(Bool())
    val ifu_i0_instr            = Output(UInt(32.W))
    val ifu_i0_pc               = Output(UInt(32.W))
    val ifu_i0_pc4              = Output(Bool())
    val ifu_fb_consume1         = Output(Bool())
    val ifu_fb_consume2         = Output(Bool())
    val ifu_i0_bp_index         = Output(UInt((BTB_ADDR_HI-BTB_ADDR_LO).W))
    val ifu_i0_bp_fghr          = Output(UInt(BHT_GHR_SIZE.W))
    val ifu_i0_bp_btag          = Output(UInt(BTB_BTAG_SIZE.W))
    val ifu_pmu_instr_aligned   = Output(Bool())
    val ifu_i0_cinst            = Output(UInt(16.W))
    val i0_brp                  = Output(new el2_br_pkt_t)
  })
  val MHI = 46+BHT_GHR_SIZE // 54
  val MSIZE = 47+BHT_GHR_SIZE // 55
  val BRDATA_SIZE = 12
  val error_stall_in = WireInit(Bool(),0.U)
  val alignval = WireInit(UInt(2.W), 0.U)
  val q0final = WireInit(UInt(16.W), 0.U)
  val q1final = WireInit(UInt(16.W), 0.U)
  val wrptr_in = WireInit(UInt(2.W), init = 0.U)
  val rdptr_in = WireInit(UInt(2.W), init = 0.U)

  val f2val_in = WireInit(UInt(2.W), init = 0.U)
  val f1val_in = WireInit(UInt(2.W), init = 0.U)
  val f0val_in = WireInit(UInt(2.W), init = 0.U)

  val q2off_in = WireInit(UInt(1.W), init = 0.U)
  val q1off_in = WireInit(UInt(1.W), init = 0.U)
  val q0off_in = WireInit(UInt(1.W), init = 0.U)

  val sf0_valid = WireInit(Bool(), init = 0.U)
  val sf1_valid = WireInit(Bool(), init = 0.U)

  val f2_valid = WireInit(Bool(), init = 0.U)
  val ifvalid = WireInit(Bool(), init = 0.U)
  val shift_f2_f1 = WireInit(Bool(), init = 0.U)
  val shift_f2_f0 = WireInit(Bool(), init = 0.U)
  val shift_f1_f0 = WireInit(Bool(), init = 0.U)

  val f0icaf = WireInit(Bool(), init = 0.U)
  val f1icaf = WireInit(Bool(), init = 0.U)

  val sf0val = WireInit(UInt(2.W), 0.U)
  val sf1val = WireInit(UInt(2.W), 0.U)

  val misc0 = WireInit(UInt(MHI.W), 0.U)
  val misc1 = WireInit(UInt(MHI.W), 0.U)
  val misc2 = WireInit(UInt(MHI.W), 0.U)

  val brdata1 = WireInit(UInt(12.W), init = 0.U)
  val brdata0 = WireInit(UInt(12.W), init = 0.U)
  val brdata2 = WireInit(UInt(12.W), init = 0.U)

  val q0 = WireInit(UInt(32.W), init = 0.U)
  val q1 = WireInit(UInt(32.W), init = 0.U)
  val q2 = WireInit(UInt(32.W), init = 0.U)

  val f1pc_in = WireInit(UInt(31.W), 0.U)
  val f0pc_in = WireInit(UInt(31.W), 0.U)
  val error_stall = WireInit(Bool(), 0.U)
  val f2_wr_en = WireInit(Bool(), 0.U)
  val shift_4B = WireInit(Bool(), 0.U)
  val f1_shift_wr_en = WireInit(Bool(), 0.U)
  val f0_shift_wr_en = WireInit(Bool(), 0.U)
  val qwen = WireInit(UInt(3.W), 0.U)
  val brdata_in = WireInit(UInt(BRDATA_SIZE.W), 0.U)
  val misc_data_in = WireInit(UInt((MHI+1).W), 0.U)

  val fetch_to_f0 = WireInit(Bool(), 0.U)
  val fetch_to_f1 = WireInit(Bool(), 0.U)
  val fetch_to_f2 = WireInit(Bool(), 0.U)
  val f1_shift_2B = WireInit(Bool(), 0.U)
  val first4B = WireInit(Bool(), 0.U)
  val shift_2B = WireInit(Bool(), 0.U)
  val f0_shift_2B = WireInit(Bool(), 0.U)

  error_stall_in := (error_stall | io.ifu_async_error_start) & !io.exu_flush_final

  error_stall := withClock(io.active_clk) {RegNext(error_stall_in, init = 0.U)}
  val wrptr = withClock(io.active_clk) {RegNext(wrptr_in, init = 0.U)}
  val rdptr = withClock(io.active_clk) {RegNext(rdptr_in, init = 0.U)}

  val f2val = withClock(io.active_clk) {RegNext(f2val_in, init = 0.U)}
  val f1val = withClock(io.active_clk) {RegNext(f1val_in, init = 0.U)}
  val f0val = withClock(io.active_clk) {RegNext(f0val_in, init = 0.U)}

  val q2off = withClock(io.active_clk) {RegNext(q2off_in, init = 0.U)}
  val q1off = withClock(io.active_clk) {RegNext(q1off_in, init = 0.U)}
  val q0off = withClock(io.active_clk) {RegNext(q0off_in, init = 0.U)}

  val f2pc = RegEnable(io.ifu_fetch_pc, 0.U, f2_wr_en.asBool)
  val f1pc = RegEnable(f1pc_in, 0.U, f1_shift_wr_en.asBool)
  val f0pc = RegEnable(f0pc_in, 0.U, f0_shift_wr_en.asBool)

  brdata2 := RegEnable(brdata_in, 0.U, qwen(2))
  brdata1 := RegEnable(brdata_in, 0.U, qwen(1))
  brdata0 := RegEnable(brdata_in, 0.U, qwen(0))

  misc2 := RegEnable(misc_data_in, 0.U, qwen(2))
  misc1 := RegEnable(misc_data_in, 0.U, qwen(1))
  misc0 := RegEnable(misc_data_in, 0.U, qwen(0))

  q2 := RegEnable(io.ifu_fetch_data_f, 0.U, qwen(2))
  q1 := RegEnable(io.ifu_fetch_data_f, 0.U, qwen(1))
  q0 := RegEnable(io.ifu_fetch_data_f, 0.U, qwen(0))

  f2_wr_en       := fetch_to_f2
  f1_shift_wr_en := fetch_to_f1 | shift_f2_f1 | f1_shift_2B
  f0_shift_wr_en := fetch_to_f0 | shift_f2_f0 | shift_f1_f0 | shift_2B | shift_4B

  val qren = Cat(rdptr === 2.U, rdptr === 1.U, rdptr === 0.U)
  qwen := Cat(wrptr === 2.U & ifvalid, wrptr === 1.U & ifvalid, wrptr === 0.U & ifvalid)

  rdptr_in := Mux1H(Seq((qren(0) & io.ifu_fb_consume1 & !io.exu_flush_final).asBool -> 1.U,
    (qren(1) & io.ifu_fb_consume1 & !io.exu_flush_final).asBool -> 2.U,
    (qren(2) & io.ifu_fb_consume1 & !io.exu_flush_final).asBool -> 0.U,
    (qren(0) & io.ifu_fb_consume2 & !io.exu_flush_final).asBool -> 2.U,
    (qren(1) & io.ifu_fb_consume2 & !io.exu_flush_final).asBool -> 0.U,
    (qren(2) & io.ifu_fb_consume2 & !io.exu_flush_final).asBool -> 1.U,
    (!io.ifu_fb_consume1 & !io.ifu_fb_consume2 & !io.exu_flush_final).asBool -> rdptr))

  wrptr_in := Mux1H(Seq((qwen(0) & !io.exu_flush_final).asBool -> 1.U,
    (qwen(1) & !io.exu_flush_final).asBool -> 2.U,
    (qwen(2) & !io.exu_flush_final).asBool -> 0.U,
    (!ifvalid & !io.exu_flush_final).asBool->wrptr))

  q2off_in := Mux1H(Seq((!qwen(2) & (rdptr===2.U)).asBool->(q2off.asUInt | f0_shift_2B),
    (!qwen(2) & (rdptr===1.U)).asBool->(q2off.asUInt | f1_shift_2B),
    (!qwen(2) & (rdptr===0.U)).asBool->q2off))

  q1off_in := Mux1H(Seq((!qwen(1) & (rdptr===1.U)).asBool->(q1off.asUInt | f0_shift_2B),
    (!qwen(1) & (rdptr===0.U)).asBool->(q1off.asUInt | f1_shift_2B),
    (!qwen(1) & (rdptr===2.U)).asBool->q1off))

  q0off_in := Mux1H(Seq((!qwen(0) & (rdptr===0.U)).asBool -> (q0off.asUInt | f0_shift_2B),
    (!qwen(0) & (rdptr===2.U)).asBool -> (q0off.asUInt | f1_shift_2B),
    (!qwen(0) & (rdptr===1.U)).asBool ->  q0off))

  val q0ptr = Mux1H(Seq((rdptr===0.U)->q0off,
    (rdptr===1.U)->q1off,
    (rdptr===2.U)->q2off))

  val  q1ptr = Mux1H(Seq((rdptr===0.U) -> q1off, (rdptr === 1.U) -> q2off, (rdptr === 2.U) -> q0off))

  val q0sel = Cat(q0ptr, !q0ptr)

  val q1sel = Cat(q1ptr, !q1ptr)

  misc_data_in := Cat(io.iccm_rd_ecc_double_err, io.ic_access_fault_f, io.ic_access_fault_type_f,
    io.ifu_bp_btb_target_f(31,1), io.ifu_bp_poffset_f, io.ifu_bp_fghr_f)

  val misceff = Mux1H(Seq(qren(0).asBool() -> Cat(misc1, misc0),
    qren(1).asBool()->Cat(misc2, misc1),
    qren(2).asBool()->Cat(misc0, misc2)))

  val misc1eff = misceff(misceff.getWidth-1,MHI+1)
  val misc0eff = misceff(MHI, 0)


  val f1dbecc = misc1eff(misc1eff.getWidth-1)
  f1icaf := misc1eff(misc1eff.getWidth-2)
  val f1ictype = misc1eff(misc1eff.getWidth-3,misc1eff.getWidth-4)
  val f1prett = misc1eff(misc1eff.getWidth-5,misc1eff.getWidth-35)
  val f1poffset = misc1eff(BHT_GHR_SIZE+11, BHT_GHR_SIZE)
  val f1fghr = misc1eff(BHT_GHR_SIZE-1, 0)

  val f0dbecc = misc0eff(misc0eff.getWidth-1)
  f0icaf := misc0eff(misc0eff.getWidth-2)
  val f0ictype = misc0eff(misc0eff.getWidth-3,misc0eff.getWidth-4)
  val f0prett = misc0eff(misc0eff.getWidth-5,misc0eff.getWidth-35)
  val f0poffset = misc0eff(BHT_GHR_SIZE+11, BHT_GHR_SIZE)
  val f0fghr = misc0eff(BHT_GHR_SIZE-1, 0)

  brdata_in := Cat(io.ifu_bp_hist1_f(1),io.ifu_bp_hist0_f(1),io.ifu_bp_pc4_f(1),io.ifu_bp_way_f(1),io.ifu_bp_valid_f(1),
    io.ifu_bp_ret_f(1), io.ifu_bp_hist1_f(0),io.ifu_bp_hist0_f(0),io.ifu_bp_pc4_f(0),io.ifu_bp_way_f(0),
    io.ifu_bp_valid_f(0),io.ifu_bp_ret_f(0))

  val brdataeff = Mux1H(Seq(qren(0).asBool->Cat(brdata1,brdata0),
    qren(1).asBool->Cat(brdata2,brdata1),
    qren(2).asBool->Cat(brdata0,brdata2)))

  val (brdata0eff,brdata1eff) = (brdataeff(11,0) , brdataeff(23,12))

  val brdata0final = Mux1H(Seq(q0sel(0).asBool -> brdata0eff, q0sel(1).asBool -> brdata0eff(11,6)))
  val brdata1final = Mux1H(Seq(q1sel(0).asBool -> brdata1eff, q1sel(1).asBool -> brdata1eff(11,6)))

  val f0ret = Cat(brdata0final(6),brdata0final(0))
  val f0brend = Cat(brdata0final(7),brdata0final(1))
  val f0way = Cat(brdata0final(8),brdata0final(2))
  val f0pc4 = Cat(brdata0final(9),brdata0final(3))
  val f0hist0 = Cat(brdata0final(10),brdata0final(4))
  val f0hist1 = Cat(brdata0final(11),brdata0final(5))

  val f1ret = Cat(brdata1final(6),brdata1final(0))
  val f1brend = Cat(brdata1final(7),brdata1final(1))
  val f1way = Cat(brdata1final(8),brdata1final(2))
  val f1pc4 = Cat(brdata1final(9),brdata1final(3))
  val f1hist0 = Cat(brdata1final(10),brdata1final(4))
  val f1hist1 = Cat(brdata1final(11),brdata1final(5))


  f2_valid := f2val(0)
  sf1_valid := sf1val(0)
  sf0_valid := sf0val(0)

  val consume_fb0 = !sf0val(0) & f0val(0)
  val consume_fb1 = !sf1val(0) & f1val(0)

  io.ifu_fb_consume1 := consume_fb0 & !consume_fb1 & !io.exu_flush_final
  io.ifu_fb_consume2 := consume_fb0 &  consume_fb1 & !io.exu_flush_final

  ifvalid := io.ifu_fetch_val(0)

  shift_f1_f0 := !sf0_valid &  sf1_valid
  shift_f2_f0 := !sf0_valid & !sf1_valid &  f2_valid
  shift_f2_f1 := !sf0_valid &  sf1_valid &  f2_valid

  fetch_to_f0        :=  !sf0_valid & !sf1_valid & !f2_valid & ifvalid
  fetch_to_f1        := (!sf0_valid & !sf1_valid &  f2_valid & ifvalid)  |
    (!sf0_valid &  sf1_valid & !f2_valid & ifvalid)  |
    ( sf0_valid & !sf1_valid & !f2_valid & ifvalid)

  fetch_to_f2        := (!sf0_valid &  sf1_valid &  f2_valid & ifvalid)  |
    ( sf0_valid &  sf1_valid & !f2_valid & ifvalid)

  val f0pc_plus1 = f0pc + 1.U

  val f1pc_plus1 = f1pc + 1.U

  val sf1pc = (Fill(31, f1_shift_2B) & f0pc_plus1) | (Fill(31, !f1_shift_2B) & f0pc)

  f1pc_in := Mux1H(Seq(fetch_to_f1.asBool->io.ifu_fetch_pc,
    shift_f2_f1.asBool->f2pc,
    (!fetch_to_f1 & !shift_f2_f1).asBool -> sf1pc))

  f0pc_in := Mux1H(Seq(fetch_to_f0.asBool->io.ifu_fetch_pc,
                       shift_f2_f0.asBool->f2pc,
                       shift_f1_f0.asBool->sf1pc,
                      (!fetch_to_f0 & !shift_f2_f0 & !shift_f1_f0).asBool->f0pc_plus1))

  f2val_in := Mux1H(Seq((fetch_to_f2 & !io.exu_flush_final).asBool->io.ifu_fetch_val,
    (!fetch_to_f2 & !shift_f2_f1 & !shift_f2_f0 & !io.exu_flush_final).asBool->f2val))

  sf1val := Mux1H(Seq(f1_shift_2B.asBool->f1val(1), !f1_shift_2B.asBool->f1val))

  f1val_in := Mux1H(Seq((fetch_to_f1 & !io.exu_flush_final).asBool -> io.ifu_fetch_val,
    (shift_f2_f1 & !io.exu_flush_final).asBool->f2val,
    (!fetch_to_f1 & !shift_f2_f1 & !shift_f1_f0 & !io.exu_flush_final).asBool->sf1val))

  sf0val := Mux1H(Seq(shift_2B.asBool->Cat(0.U, f0val(1)),
    (!shift_2B & !shift_4B).asBool->f1val))

  f0val_in := Mux1H(Seq((fetch_to_f0 & !io.exu_flush_final).asBool->io.ifu_fetch_val,
    (shift_f2_f0 & !io.exu_flush_final).asBool->f2val,
    (shift_f1_f0 & !io.exu_flush_final).asBool()->sf1val,
    (!fetch_to_f0 & !shift_f2_f0 & !shift_f1_f0 & !io.exu_flush_final).asBool->sf0val))

  val qeff = Mux1H(Seq(qren(0).asBool->Cat(q1,q0),
    qren(1).asBool->Cat(q2,q1),
    qren(2).asBool->Cat(q0,q2)))
  val (q1eff, q0eff) = (qeff(63,32), qeff(31,0))

  q0final := Mux1H(Seq(q0sel(0).asBool->q0eff, q0sel(1).asBool->q0eff(31,16)))

  q1final := Mux1H(Seq(q1sel(0).asBool->q1eff(15,0), q1sel(1).asBool->q1eff(31,16)))

  val aligndata = Mux1H(Seq(f0val(0).asBool -> q0final, (~f0val(1) & f0val(0)).asBool -> Cat(q1final,q0final)))

  alignval := Mux1H(Seq(f0val(1).asBool->3.U, (!f0val(1) & f0val(0)) -> Cat(f1val(0),1.U)))

  val alignicaf = Mux1H(Seq(f0val(1).asBool -> f0icaf, (~f0val(1) & f0val(0)).asBool -> Cat(f1icaf,f0icaf)))

  val aligndbecc = Mux1H(Seq(f0val(1).asBool -> Fill(2,f0dbecc), (!f0val(1) & f0val(0)).asBool -> Cat(f1dbecc,f0dbecc)))

  val alignbrend = Mux1H(Seq(f0val(1).asBool()->f0brend, (!f0val(1) & f0val(0)).asBool->Cat(f1brend(0),f0brend(0))))

  val alignpc4 = Mux1H(Seq(f0val(1).asBool()->f0pc4, (!f0val(1) & f0val(0)).asBool->Cat(f1pc4(0),f0pc4(0))))

  val alignret = Mux1H(Seq(f0val(1).asBool()->f0ret, (!f0val(1) & f0val(0)).asBool->Cat(f1ret(0),f0ret(0))))

  val alignway = Mux1H(Seq(f0val(1).asBool()->f0way, (!f0val(1) & f0val(0)).asBool->Cat(f1way(0),f0way(0))))

  val alignhist1 = Mux1H(Seq(f0val(1).asBool()->f0hist1, (!f0val(1) & f0val(0)).asBool->Cat(f1hist1(0),f0hist1(0))))

  val alignhist0 = Mux1H(Seq(f0val(1).asBool()->f0hist0, (!f0val(1) & f0val(0)).asBool->Cat(f1hist0(0),f0hist0(0))))

  val alignfromf1 = !f0val(1) & f0val(0)

  val secondpc = Mux1H(Seq(f0val(1).asBool()->f0pc_plus1 , (!f0val(1) & f0val(0)).asBool->f1pc))

  io.ifu_i0_pc := f0pc

  val firstpc = f0pc

  io.ifu_i0_pc4 := first4B

  io.ifu_i0_cinst := aligndata(15,0)

  first4B := aligndata(1,0) === 3.U

  val first2B = ~first4B

  io.ifu_i0_valid := Mux1H(Seq(first4B.asBool -> alignval(1), first2B.asBool -> alignval(0)))

  io.ifu_i0_icaf := Mux1H(Seq(first4B.asBool -> alignicaf.orR, first2B.asBool -> alignicaf(0)))

  io.ifu_i0_icaf_type := Mux((first4B & !f0val(1) & f0val(0) & !alignicaf(0) & !aligndbecc(0)).asBool, f1ictype, f0ictype)

  val icaf_eff = alignicaf(1) | aligndbecc(1)

  io.ifu_i0_icaf_f1 := first4B & icaf_eff & alignfromf1

  io.ifu_i0_dbecc := Mux1H(Seq(first4B.asBool->aligndbecc.orR, first2B.asBool->aligndbecc(0)))

  val ifirst = aligndata

  val decompressed = Module(new el2_ifu_compress_ctl())

  io.ifu_i0_instr := Mux1H(Seq(first4B.asBool -> ifirst, first2B.asBool -> decompressed.io.dout))

  val firstpc_hash =  el2_btb_addr_hash(f0pc)

  val secondpc_hash = el2_btb_addr_hash(secondpc)

  val firstbrtag_hash = if(BTB_BTAG_FOLD) el2_btb_tag_hash_fold(firstpc) else el2_btb_tag_hash(firstpc)

  val secondbrtag_hash = if(BTB_BTAG_FOLD) el2_btb_tag_hash_fold(secondpc) else el2_btb_tag_hash(secondpc)

  io.i0_brp.valid :=(first2B & alignbrend(0)) | (first4B & alignbrend(1)) | (first4B & alignval(1) & alignbrend(0))

  io.i0_brp.ret := (first2B & alignret(0)) | (first4B & alignret(1))

  val i0_brp_pc4 = (first2B & alignpc4(0)) | (first4B & alignpc4(1))

  io.i0_brp.way := Mux((first2B | alignbrend(0)).asBool, alignway(0),  alignway(1))

  io.i0_brp.hist := Cat((first2B & alignhist1(0)) | (first4B & alignhist1(1)),
    (first2B & alignhist0(0)) | (first4B & alignhist0(1)))

  val i0_ends_f1 = first4B & alignfromf1
  io.i0_brp.toffset := Mux(i0_ends_f1.asBool, f1poffset, f0poffset)

  io.i0_brp.prett := Mux(i0_ends_f1.asBool, f1prett, f0prett)

  io.i0_brp.br_start_error  := (first4B & alignval(1) & alignbrend(0))

  io.i0_brp.bank            := Mux((first2B | alignbrend(0)).asBool, firstpc(1), secondpc(1))

  io.i0_brp.br_error := (io.i0_brp.valid &  i0_brp_pc4 &  first2B) | (io.i0_brp.valid & !i0_brp_pc4 &  first4B)

  io.ifu_i0_bp_index := Mux((first2B | alignbrend(0)).asBool, firstpc_hash, secondpc_hash)

  io.ifu_i0_bp_fghr := Mux((first4B & alignfromf1).asBool, f1fghr, f0fghr)

  io.ifu_i0_bp_btag := Mux((first2B | alignbrend(0)).asBool, firstbrtag_hash, secondbrtag_hash)

  decompressed.io.din := aligndata

  val i0_shift = io.dec_i0_decode_d & ~error_stall

  io.ifu_pmu_instr_aligned := i0_shift

  shift_2B := i0_shift & first2B
  shift_4B := i0_shift & first4B

  f0_shift_2B := Mux1H(Seq(shift_2B.asBool -> f0val(0), shift_4B.asBool -> (!f0val(0) & f0val(0))))
  f1_shift_2B :=  f0val(0) & !f0val(1) & shift_4B

}
object ifu_aln extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_aln_ctl()))
}