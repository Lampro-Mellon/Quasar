package ifu
import lib._
import chisel3._
import chisel3.util._
import include._

class ifu_aln_ctl extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val scan_mode               = Input(Bool())
    val active_clk              = Input(Clock())
    val ifu_async_error_start   = Input(Bool()) // Error coming from mem-ctl
    val iccm_rd_ecc_double_err  = Input(UInt(2.W)) // ICCM double error coming from mem-ctl
    val ic_access_fault_f       = Input(UInt(2.W)) // Access fault in I$
    val ic_access_fault_type_f  = Input(UInt(2.W)) // Type of access fault occured
    val dec_i0_decode_d         = Input(Bool())
    val dec_aln                 = new dec_aln()
  //  val ifu_i0_valid            = Output(Bool())
 //   val ifu_i0_icaf             = Output(Bool())
 //   val ifu_i0_icaf_type        = Output(UInt(2.W))
 //   val ifu_i0_icaf_second      = Output(Bool())
  //  val ifu_i0_dbecc            = Output(Bool())
   // val ifu_i0_instr            = Output(UInt(32.W))
  //  val ifu_i0_pc               = Output(UInt(31.W))
 //   val ifu_i0_pc4              = Output(Bool())
    val ifu_bp_fa_index_f       = Vec(2, Input(UInt(log2Ceil(BTB_SIZE).W)))
 //   val i0_brp                  = Output(Valid(new br_pkt_t()))
//    val ifu_i0_bp_index         = Output(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W))
//    val ifu_i0_bp_fghr          = Output(UInt(BHT_GHR_SIZE.W))
  //  val ifu_i0_bp_btag          = Output(UInt(BTB_BTAG_SIZE.W))
    val ifu_i0_fa_index         = Output(UInt(log2Ceil(BTB_SIZE).W))
 //   val ifu_pmu_instr_aligned   = Output(Bool())
 //   val ifu_i0_cinst            = Output(UInt(16.W))
    val ifu_bp_fghr_f           = Input(UInt(BHT_GHR_SIZE.W)) // Data coming from the branch predictor to put in the FP
    val ifu_bp_btb_target_f     = Input(UInt(31.W)) // Target for the instruction enqueue in the FP
    val ifu_bp_poffset_f        = Input(UInt(12.W)) // Offset to the current PC for branch
    val ifu_bp_hist0_f          = Input(UInt(2.W)) // History to EXU
    val ifu_bp_hist1_f          = Input(UInt(2.W)) // History to EXU
    val ifu_bp_pc4_f            = Input(UInt(2.W)) // PC4
    val ifu_bp_way_f            = Input(UInt(2.W)) // Way to help in miss prediction
    val ifu_bp_valid_f          = Input(UInt(2.W)) // Valid Branch prediction
    val ifu_bp_ret_f            = Input(UInt(2.W)) // BP ret
    val exu_flush_final         = Input(Bool()) // Miss prediction
    val ifu_fetch_data_f        = Input(UInt(32.W)) // PC of the current instruction in the FP
    val ifu_fetch_val           = Input(UInt(2.W)) // PC boundary i.e 'x' of 2 or 4
    val ifu_fetch_pc            = Input(UInt(31.W)) // Current PC
    /////////////////////////////////////////////////
    val ifu_fb_consume1         = Output(Bool()) // FP used 1
    val ifu_fb_consume2         = Output(Bool()) // FP used 2

  })
  val MHI   = 1 + (BTB_ENABLE * (43+BHT_GHR_SIZE))
  val MSIZE = 2 + (BTB_ENABLE * (43+BHT_GHR_SIZE))
  val BRDATA_SIZE = if(BTB_ENABLE) 16+log2Ceil(BTB_SIZE) * 2 * BTB_FULLYA else 2
  val BRDATA_WIDTH = if(BTB_ENABLE)  8+log2Ceil(BTB_SIZE)*BTB_FULLYA else 1

  val alignval = WireInit(UInt(2.W), 0.U)
  val q0final = WireInit(UInt(32.W), 0.U)
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

  val f0icaf = WireInit(UInt(2.W), init = 0.U)
  val f1icaf = WireInit(UInt(2.W), init = 0.U)

  val sf0val = WireInit(UInt(2.W), 0.U)
  val sf1val = WireInit(UInt(2.W), 0.U)

  val misc0 = WireInit(UInt((MHI+1).W), 0.U)
  val misc1 = WireInit(UInt((MHI+1).W), 0.U)
  val misc2 = WireInit(UInt((MHI+1).W), 0.U)

  val brdata1 = WireInit(UInt(BRDATA_SIZE.W), init = 0.U)
  val brdata0 = WireInit(UInt(BRDATA_SIZE.W), init = 0.U)
  val brdata2 = WireInit(UInt(BRDATA_SIZE.W), init = 0.U)

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
  implicit val clk = clock
  implicit val rst = reset.asAsyncReset()
  implicit val scan_mode = io.scan_mode
  // Stall if there is an error in the instrucion
  val error_stall_in = (error_stall | io.ifu_async_error_start) & !io.exu_flush_final
  val wrptr = withClock(io.active_clk) {RegNext(wrptr_in, init = 0.U)}
  val rdptr = withClock(io.active_clk) {RegNext(rdptr_in, init = 0.U)}
  val q2off = withClock(io.active_clk) {RegNext(q2off_in, init = 0.U)}
  val q1off = withClock(io.active_clk) {RegNext(q1off_in, init = 0.U)}
  val q0off = withClock(io.active_clk) {RegNext(q0off_in, init = 0.U)}

  // Flop the stall until flush
  error_stall := rvdffie(error_stall_in,clock,reset.asAsyncReset(),io.scan_mode)
  val f2val = rvdffie(f2val_in,clock,reset.asAsyncReset(),io.scan_mode)
  val f1val = rvdffie(f1val_in,clock,reset.asAsyncReset(),io.scan_mode)
  val f0val = rvdffie(f0val_in,clock,reset.asAsyncReset(),io.scan_mode)
  // Branch data to the FP
  if(BTB_ENABLE){
    brdata2 := rvdffe(brdata_in, qwen(2),clock,io.scan_mode)
    brdata1 := rvdffe(brdata_in, qwen(1),clock,io.scan_mode)
    brdata0 := rvdffe(brdata_in, qwen(0),clock,io.scan_mode)
    // Miscalanious data to the FP including error's
    misc2 := rvdffe(misc_data_in, qwen(2),clock,io.scan_mode)
    misc1 := rvdffe(misc_data_in, qwen(1),clock,io.scan_mode)
    misc0 := rvdffe(misc_data_in, qwen(0),clock,io.scan_mode)
  }
  else{
    brdata2 := rvdffie(Mux(qwen(2),brdata_in, brdata2),clock,reset.asAsyncReset(),io.scan_mode)
    brdata1 := rvdffie(Mux(qwen(1),brdata_in, brdata1),clock,reset.asAsyncReset(),io.scan_mode)
    brdata0 := rvdffie(Mux(qwen(0),brdata_in, brdata0),clock,reset.asAsyncReset(),io.scan_mode)
    // Miscalanious data to the FP including error's
    misc2 := rvdffie(Mux(qwen(2),misc_data_in, misc2),clock,reset.asAsyncReset(),io.scan_mode)
    misc1 := rvdffie(Mux(qwen(1),misc_data_in, misc1),clock,reset.asAsyncReset(),io.scan_mode)
    misc0 := rvdffie(Mux(qwen(0),misc_data_in, misc0),clock,reset.asAsyncReset(),io.scan_mode)
  }

  // Instruction in the FP
  q2 := rvdffe(io.ifu_fetch_data_f, qwen(2),clock,io.scan_mode)
  q1 := rvdffe(io.ifu_fetch_data_f, qwen(1),clock,io.scan_mode)
  q0 := rvdffe(io.ifu_fetch_data_f, qwen(0),clock,io.scan_mode)

  val q2pc = rvdffe(io.ifu_fetch_pc, qwen(2),clock,io.scan_mode)
  val q1pc = rvdffe(io.ifu_fetch_pc, qwen(1),clock,io.scan_mode)
  val q0pc = rvdffe(io.ifu_fetch_pc, qwen(0),clock,io.scan_mode)

  val qren = Cat(rdptr === 2.U, rdptr === 1.U, rdptr === 0.U)

  qwen := Cat((wrptr === 2.U) & ifvalid, (wrptr === 1.U) & ifvalid, (wrptr === 0.U) & ifvalid)

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
    (!ifvalid & !io.exu_flush_final).asBool-> wrptr))

  q2off_in := Mux1H(Seq((!qwen(2) & (rdptr===2.U)).asBool -> (q2off.asUInt | f0_shift_2B),
    (!qwen(2) & (rdptr===1.U)).asBool -> (q2off.asUInt | f1_shift_2B),
    (!qwen(2) & (rdptr===0.U)).asBool ->  q2off))

  q1off_in := Mux1H(Seq((!qwen(1) & (rdptr===1.U)).asBool -> (q1off.asUInt | f0_shift_2B),
    (!qwen(1) & (rdptr===0.U)).asBool -> (q1off.asUInt | f1_shift_2B),
    (!qwen(1) & (rdptr===2.U)).asBool ->  q1off))

  q0off_in := Mux1H(Seq((!qwen(0) & (rdptr===0.U)).asBool -> (q0off.asUInt | f0_shift_2B),
    (!qwen(0) & (rdptr===2.U)).asBool -> (q0off.asUInt | f1_shift_2B),
    (!qwen(0) & (rdptr===1.U)).asBool ->  q0off))

  // Shift FP logic

  val q0ptr = Mux1H(Seq((rdptr===0.U) -> q0off,
    (rdptr===1.U) -> q1off,
    (rdptr===2.U) -> q2off))

  val q1ptr = Mux1H(Seq((rdptr===0.U) -> q1off, (rdptr === 1.U) -> q2off, (rdptr === 2.U) -> q0off))

  val q0sel = Cat(q0ptr, !q0ptr)

  val q1sel = Cat(q1ptr, !q1ptr)
  // Misc data error, access-fault, type of fault, target, offset and ghr value

  if(BTB_ENABLE){
    misc_data_in := Cat(io.ic_access_fault_type_f, io.ifu_bp_btb_target_f, io.ifu_bp_poffset_f, io.ifu_bp_fghr_f)

  }else{
    misc_data_in := io.ic_access_fault_type_f
  }

  val misceff = Mux1H(Seq(qren(0).asBool() -> Cat(misc1, misc0),
    qren(1).asBool() -> Cat(misc2, misc1),
    qren(2).asBool() -> Cat(misc0, misc2)))

  val misc1eff = misceff(misceff.getWidth-1,MHI+1)
  val misc0eff = misceff(MHI, 0)

  ///////////////////////////////////////////////////////////////////////
  val f1ictype = if(BTB_ENABLE)   misc1eff(misc1eff.getWidth-1, misc1eff.getWidth-2)      else misc1eff
  val f1prett = if(BTB_ENABLE)    misc1eff(misc1eff.getWidth-3, misc1eff.getWidth-33)     else 0.U
  val f1poffset = if(BTB_ENABLE)  misc1eff(misc1eff.getWidth-34, misc1eff.getWidth-45)    else 0.U
  val f1fghr = if(BTB_ENABLE)     misc1eff(BHT_GHR_SIZE-1, 0)                             else 0.U

  val f0ictype = if(BTB_ENABLE)   misc0eff(misc0eff.getWidth-1, misc0eff.getWidth-2)      else misc0eff
  val f0prett = if(BTB_ENABLE)    misc0eff(misc0eff.getWidth-3, misc0eff.getWidth-33)     else 0.U
  val f0poffset = if(BTB_ENABLE)  misc0eff(misc0eff.getWidth-34, misc0eff.getWidth-45)    else 0.U
  val f0fghr = if(BTB_ENABLE)     misc0eff(BHT_GHR_SIZE-1, 0)                             else 0.U

  val f0ret = WireInit(UInt(2.W), 0.U)
  val f0brend = WireInit(UInt(2.W), 0.U)
  val f0way = WireInit(UInt(2.W), 0.U)
  val f0pc4 = WireInit(UInt(2.W), 0.U)
  val f0hist0 = WireInit(UInt(2.W), 0.U)
  val f0hist1 = WireInit(UInt(2.W), 0.U)
  val f1ret = WireInit(UInt(2.W), 0.U)
  val f1brend = WireInit(UInt(2.W), 0.U)
  val f1way = WireInit(UInt(2.W), 0.U)
  val f1pc4 = WireInit(UInt(2.W), 0.U)
  val f1hist0 = WireInit(UInt(2.W), 0.U)
  val f1hist1 = WireInit(UInt(2.W), 0.U)


  val f0dbecc = WireInit(UInt(2.W), 0.U)
  val f1dbecc = WireInit(UInt(2.W), 0.U)
  val f0index = Wire(Vec(2,UInt(log2Ceil(BTB_SIZE).W)))
  val f1index = Wire(Vec(2,UInt(log2Ceil(BTB_SIZE).W)))
  f0index := (0 until 2).map(i => 0.U)
  f1index := (0 until 2).map(i => 0.U)
  val brdataeff = WireInit(UInt(((2*BRDATA_SIZE)).W),0.U)
  brdataeff := Mux1H(Seq(qren(0).asBool -> Cat(brdata1,brdata0),
    qren(1).asBool -> Cat(brdata2,brdata1),
    qren(2).asBool -> Cat(brdata0,brdata2)))
  val brdata1eff = WireInit(UInt(BRDATA_SIZE.W),0.U)
  val brdata0eff = WireInit(UInt(BRDATA_SIZE.W),0.U)
  brdata1eff := brdataeff(brdataeff.getWidth - 1,brdataeff.getWidth/2)
  brdata0eff := brdataeff(brdataeff.getWidth/2 - 1,0)
  val brdata0final = Mux1H(Seq(q0sel(0).asBool -> brdata0eff(2*BRDATA_WIDTH-1,0),
    q0sel(1).asBool -> brdata0eff(BRDATA_SIZE-1,BRDATA_WIDTH)))
  val brdata1final = Mux1H(Seq(q1sel(0).asBool -> brdata1eff(2*BRDATA_WIDTH-1,0),
    q1sel(1).asBool -> brdata1eff(BRDATA_SIZE-1,BRDATA_WIDTH)))
  if(BTB_ENABLE){
    if(BTB_FULLYA){
      brdata_in := Cat(io.ifu_bp_fa_index_f(1), io.iccm_rd_ecc_double_err(1), io.ic_access_fault_f(1), io.ifu_bp_hist1_f(1), io.ifu_bp_hist0_f(1), io.ifu_bp_pc4_f(1), io.ifu_bp_way_f(1), io.ifu_bp_valid_f(1), io.ifu_bp_ret_f(1),
        io.ifu_bp_fa_index_f(0), io.iccm_rd_ecc_double_err(0), io.ic_access_fault_f(0), io.ifu_bp_hist1_f(0), io.ifu_bp_hist0_f(0), io.ifu_bp_pc4_f(0), io.ifu_bp_way_f(0), io.ifu_bp_valid_f(0), io.ifu_bp_ret_f(0))

      f0ret   := Cat(brdata0final(17) , brdata0final(0))
      f0brend := Cat(brdata0final(18), brdata0final(1))
      f0way   := Cat(brdata0final(19), brdata0final(2))
      f0pc4   := Cat(brdata0final(20), brdata0final(3))
      f0hist0 := Cat(brdata0final(21), brdata0final(4))
      f0hist1 := Cat(brdata0final(22), brdata0final(5))
      f0icaf  := Cat(brdata0final(23), brdata0final(6))
      f0dbecc := Cat(brdata0final(24), brdata0final(7))
      f0index(1) := Cat(brdata0final(33), brdata0final(32), brdata0final(31), brdata0final(30), brdata0final(29), brdata0final(28), brdata0final(27), brdata0final(26), brdata0final(25))
      f0index(0) := Cat(brdata0final(16), brdata0final(15), brdata0final(14), brdata0final(13), brdata0final(12), brdata0final(11), brdata0final(10), brdata0final(9), brdata0final(8))

      f1ret   := Cat(brdata1final(17) , brdata1final(0))
      f1brend := Cat(brdata1final(18), brdata1final(1))
      f1way   := Cat(brdata1final(19), brdata1final(2))
      f1pc4   := Cat(brdata1final(20), brdata1final(3))
      f1hist0 := Cat(brdata1final(21), brdata1final(4))
      f1hist1 := Cat(brdata1final(22), brdata1final(5))
      f1icaf  := Cat(brdata1final(23), brdata1final(6))
      f1dbecc := Cat(brdata1final(24), brdata1final(7))
      f1index(1) := Cat(brdata1final(33), brdata1final(32), brdata1final(31), brdata1final(30), brdata1final(29), brdata1final(28), brdata1final(27), brdata1final(26), brdata1final(25))
      f1index(0) := Cat(brdata1final(16), brdata1final(15), brdata1final(14), brdata1final(13), brdata1final(12), brdata1final(11), brdata1final(10), brdata1final(9), brdata1final(8))

    }else{
      brdata_in := Cat(io.iccm_rd_ecc_double_err(1), io.ic_access_fault_f(1), io.ifu_bp_hist1_f(1), io.ifu_bp_hist0_f(1), io.ifu_bp_pc4_f(1), io.ifu_bp_way_f(1), io.ifu_bp_valid_f(1), io.ifu_bp_ret_f(1),
        io.iccm_rd_ecc_double_err(0), io.ic_access_fault_f(0), io.ifu_bp_hist1_f(0), io.ifu_bp_hist0_f(0), io.ifu_bp_pc4_f(0), io.ifu_bp_way_f(0), io.ifu_bp_valid_f(0), io.ifu_bp_ret_f(0))
      f0ret   := Cat(brdata0final(8) , brdata0final(0))
      f0brend := Cat(brdata0final(9) , brdata0final(1))
      f0way   := Cat(brdata0final(10), brdata0final(2))
      f0pc4   := Cat(brdata0final(11), brdata0final(3))
      f0hist0 := Cat(brdata0final(12), brdata0final(4))
      f0hist1 := Cat(brdata0final(13), brdata0final(5))
      f0icaf  := Cat(brdata0final(14), brdata0final(6))
      f0dbecc := Cat(brdata0final(15), brdata0final(7))

      f1ret   := Cat(brdata1final(8) , brdata1final(0))
      f1brend := Cat(brdata1final(9) , brdata1final(1))
      f1way   := Cat(brdata1final(10), brdata1final(2))
      f1pc4   := Cat(brdata1final(11), brdata1final(3))
      f1hist0 := Cat(brdata1final(12), brdata1final(4))
      f1hist1 := Cat(brdata1final(13), brdata1final(5))
      f1icaf  := Cat(brdata1final(14), brdata1final(6))
      f1dbecc := Cat(brdata1final(15), brdata1final(7))

    }
  }else{
    brdata_in := Cat(io.iccm_rd_ecc_double_err(1),io.ic_access_fault_f(1),
      io.iccm_rd_ecc_double_err(0),io.ic_access_fault_f(0))


    f0dbecc := Cat(brdata0final(3),brdata0final(1))
    f0icaf := Cat(brdata0final(2),brdata0final(0))

    f1dbecc  := Cat(brdata1final(3),brdata1final(1))
    f1icaf  := Cat(brdata1final(2),brdata1final(0))


  }


  f2_valid := f2val(0)
  sf1_valid := sf1val(0)
  sf0_valid := sf0val(0)

  val consume_fb0 = !sf0val(0) & f0val(0)
  val consume_fb1 = !sf1val(0) & f1val(0)

  // Depending on type of instruction and boundary determine how many FP to consume
  io.ifu_fb_consume1 := consume_fb0 & !consume_fb1 & !io.exu_flush_final
  io.ifu_fb_consume2 := consume_fb0 &  consume_fb1 & !io.exu_flush_final

  ifvalid := io.ifu_fetch_val(0)

  // Shift logic for each dequeue
  shift_f1_f0 := !sf0_valid &  sf1_valid
  shift_f2_f0 := !sf0_valid & !sf1_valid &  f2_valid
  shift_f2_f1 := !sf0_valid &  sf1_valid &  f2_valid

  fetch_to_f0        :=  !sf0_valid & !sf1_valid & !f2_valid & ifvalid
  fetch_to_f1        := (!sf0_valid & !sf1_valid &  f2_valid & ifvalid)  |
    (!sf0_valid &  sf1_valid & !f2_valid & ifvalid)  |
    ( sf0_valid & !sf1_valid & !f2_valid & ifvalid)

  fetch_to_f2        := (!sf0_valid &  sf1_valid &  f2_valid & ifvalid)  |
    ( sf0_valid &  sf1_valid & !f2_valid & ifvalid)

  f2val_in := Mux1H(Seq((fetch_to_f2 & !io.exu_flush_final).asBool->io.ifu_fetch_val,
    (!fetch_to_f2 & !shift_f2_f1 & !shift_f2_f0 & !io.exu_flush_final).asBool->f2val))

  sf1val := Mux1H(Seq(f1_shift_2B.asBool->f1val(1), !f1_shift_2B.asBool->f1val))

  f1val_in := Mux1H(Seq(( fetch_to_f1 &                               !io.exu_flush_final).asBool -> io.ifu_fetch_val,
    (                shift_f2_f1 &                !io.exu_flush_final).asBool->f2val,
    (!fetch_to_f1 & !shift_f2_f1 & !shift_f1_f0 & !io.exu_flush_final).asBool->sf1val))

  sf0val := Mux1H(Seq(shift_2B.asBool->Cat(0.U, f0val(1)),
    (!shift_2B & !shift_4B).asBool->f0val))

  f0val_in := Mux1H(Seq((fetch_to_f0 &                                !io.exu_flush_final).asBool->io.ifu_fetch_val,
    (                shift_f2_f0 &                !io.exu_flush_final).asBool->f2val,
    (                               shift_f1_f0 & !io.exu_flush_final).asBool->sf1val,
    (!fetch_to_f0 & !shift_f2_f0 & !shift_f1_f0 & !io.exu_flush_final).asBool->sf0val))

  val qeff = Mux1H(Seq(qren(0).asBool -> Cat(q1,q0),
    qren(1).asBool -> Cat(q2,q1),
    qren(2).asBool -> Cat(q0,q2)))
  val (q1eff, q0eff) = (qeff(63,32), qeff(31,0))

  q0final := Mux1H(Seq(q0sel(0).asBool->q0eff,
    q0sel(1).asBool->q0eff(31,16)))

  q1final := Mux1H(Seq(q1sel(0).asBool->q1eff(15,0), q1sel(1).asBool->q1eff(31,16)))

  val qpceff = Mux1H(Seq(qren(0).asBool -> Cat(q1pc, q0pc),
    qren(1).asBool -> Cat(q2pc, q1pc),
    qren(2).asBool -> Cat(q0pc, q2pc)))
  val q1pceff = qpceff(61, 31)
  val q0pceff = qpceff(30, 0)
  val q0pcfinal = Mux1H(Seq(q0sel(0) -> q0pceff, q0sel(1) -> (q0pceff+1.U)))
  // Alinging the data according to the boundary of PC
  val aligndata = Mux1H(Seq(f0val(1).asBool -> q0final, (!f0val(1) & f0val(0)).asBool -> Cat(q1final(15,0),q0final(15,0))))

  alignval := Mux1H(Seq(f0val(1).asBool->3.U, (!f0val(1) & f0val(0)) -> Cat(f1val(0),1.U)))

  val alignicaf = Mux1H(Seq(f0val(1).asBool -> f0icaf, (~f0val(1) & f0val(0)).asBool -> Cat(f1icaf(0),f0icaf(0))))

  val aligndbecc = Mux1H(Seq(f0val(1).asBool -> f0dbecc, (!f0val(1) & f0val(0)).asBool -> Cat(f1dbecc(0),f0dbecc(0))))

  /////////////////////////////////////////////////////////
  val alignbrend = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool()->f0brend, (!f0val(1) & f0val(0)).asBool->Cat(f1brend(0),f0brend(0)))) else 0.U

  val alignpc4 = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool()->f0pc4, (!f0val(1) & f0val(0)).asBool->Cat(f1pc4(0),f0pc4(0)))) else 0.U

  val alignret = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool()->f0ret, (!f0val(1) & f0val(0)).asBool->Cat(f1ret(0),f0ret(0)))) else 0.U

  val alignway = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool()->f0way, (!f0val(1) & f0val(0)).asBool->Cat(f1way(0),f0way(0)))) else 0.U

  val alignhist1 = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool()->f0hist1, (!f0val(1) & f0val(0)).asBool->Cat(f1hist1(0),f0hist1(0)))) else 0.U

  val alignhist0 = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool()->f0hist0, (!f0val(1) & f0val(0)).asBool->Cat(f1hist0(0),f0hist0(0)))) else 0.U

  val secondpc = if(BTB_ENABLE) Mux1H(Seq(f0val(1).asBool() -> (q0pceff + 1.U), (!f0val(1) & f0val(0)).asBool -> q1pceff)) else 0.U

  val firstpc = if(BTB_ENABLE) q0pcfinal else 0.U

  val alignindex = Wire(Vec(2,UInt(log2Ceil(BTB_SIZE).W)))
  alignindex := (0 until 2).map(i => 0.U)
  if(BTB_ENABLE){if(BTB_FULLYA) {
    alignindex(0):= f0index(0)
    alignindex(1):= Mux(f0val(1).asBool, f0index(1), f1index(0))
  }           }
  /////////////////////////////////////////////////////////

  val alignfromf1 = !f0val(1) & f0val(0)

  io.dec_aln.aln_ib.ifu_i0_pc := q0pcfinal

  io.dec_aln.aln_ib.ifu_i0_pc4 := first4B

  io.dec_aln.aln_dec.ifu_i0_cinst := aligndata(15,0)

  // Instruction is compressed or not
  first4B := aligndata(1,0) === 3.U

  val first2B = !first4B

  io.dec_aln.aln_ib.ifu_i0_valid := Mux1H(Seq(first4B.asBool -> alignval(1), first2B.asBool -> alignval(0)))

  io.dec_aln.aln_ib.ifu_i0_icaf := Mux1H(Seq(first4B.asBool -> alignicaf.orR, first2B.asBool -> alignicaf(0)))

  io.dec_aln.aln_ib.ifu_i0_icaf_type := Mux((first4B & !f0val(1) & f0val(0) & !alignicaf(0) & !aligndbecc(0)).asBool, f1ictype, f0ictype)

  val icaf_eff = alignicaf | aligndbecc

  io.dec_aln.aln_ib.ifu_i0_icaf_second := first4B & !icaf_eff(0) & icaf_eff(1)

  io.dec_aln.aln_ib.ifu_i0_dbecc := Mux1H(Seq(first4B.asBool->aligndbecc.orR, first2B.asBool->aligndbecc(0)))

  val ifirst = aligndata
  // Expander from 16-bit to 32-bit
  val decompressed = Module(new ifu_compress_ctl())

  io.dec_aln.aln_ib.ifu_i0_instr := Mux1H(Seq((first4B & alignval(1)).asBool -> ifirst,
    (first2B & alignval(0)).asBool -> decompressed.io.dout))

  ////////////////////////////////////////////////////////////////////////////////////////////
  val firstpc_hash =  btb_addr_hash(firstpc)

  val secondpc_hash = btb_addr_hash(secondpc)

  val firstbrtag_hash  = WireInit(UInt(BTB_BTAG_SIZE.W),0.U)
  val secondbrtag_hash = WireInit(UInt(BTB_BTAG_SIZE.W),0.U)
  if(BTB_ENABLE){if(BTB_FULLYA)
    firstbrtag_hash :=  firstpc else {if(BTB_BTAG_FOLD) firstbrtag_hash := btb_tag_hash_fold(firstpc) else firstbrtag_hash := btb_tag_hash(firstpc)}       }
  if(BTB_ENABLE){if(BTB_FULLYA)
    secondbrtag_hash := secondpc else {if(BTB_BTAG_FOLD) secondbrtag_hash := btb_tag_hash_fold(secondpc) else secondbrtag_hash := btb_tag_hash(secondpc)}      }

  if(BTB_ENABLE){
    io.dec_aln.aln_ib.i0_brp.valid := (first2B & alignbrend(0)) | (first4B & alignbrend(1)) | (first4B & alignval(1) & alignbrend(0))

    val i0_brp_pc4 = (first2B & alignpc4(0)) | (first4B & alignpc4(1))

    io.dec_aln.aln_ib.i0_brp.bits.ret := (first2B & alignret(0)) | (first4B & alignret(1))

    io.dec_aln.aln_ib.i0_brp.bits.way := Mux((first2B | alignbrend(0)).asBool, alignway(0),  alignway(1))

    io.dec_aln.aln_ib.i0_brp.bits.hist := Cat((first2B & alignhist1(0)) | (first4B & alignhist1(1)),
      (first2B & alignhist0(0)) | (first4B & alignhist0(1)))

    val i0_ends_f1 = first4B & alignfromf1
    io.dec_aln.aln_ib.i0_brp.bits.toffset := Mux(i0_ends_f1.asBool, f1poffset, f0poffset)

    io.dec_aln.aln_ib.i0_brp.bits.prett := Mux(i0_ends_f1.asBool, f1prett, f0prett)

    io.dec_aln.aln_ib.i0_brp.bits.br_start_error  := (first4B & alignval(1) & alignbrend(0))

    io.dec_aln.aln_ib.i0_brp.bits.bank            := Mux((first2B | alignbrend(0)).asBool, firstpc(0), secondpc(0))

    io.dec_aln.aln_ib.i0_brp.bits.br_error := (io.dec_aln.aln_ib.i0_brp.valid &  i0_brp_pc4 &  first2B) | (io.dec_aln.aln_ib.i0_brp.valid & !i0_brp_pc4 &  first4B)

    io.dec_aln.aln_ib.ifu_i0_bp_index :=  Mux((first2B | alignbrend(0)).asBool, firstpc_hash, secondpc_hash)
    io.dec_aln.aln_ib.ifu_i0_bp_fghr := Mux((first4B & alignfromf1).asBool, f1fghr, f0fghr)
    io.dec_aln.aln_ib.ifu_i0_bp_btag := Mux((first2B | alignbrend(0)).asBool, firstbrtag_hash, secondbrtag_hash)

    if(BTB_FULLYA){
      io.ifu_i0_fa_index := Mux((first2B | alignbrend(0)).asBool, alignindex(0), alignindex(1))
    }else{
      io.ifu_i0_fa_index := 0.U
    }
  }else{
    io.dec_aln.aln_ib.ifu_i0_bp_index :=  0.U
    io.dec_aln.aln_ib.ifu_i0_bp_fghr := 0.U
    io.dec_aln.aln_ib.ifu_i0_bp_btag := 0.U
    io.dec_aln.aln_ib.i0_brp := 0.U.asTypeOf(io.dec_aln.aln_ib.i0_brp)
  }



  decompressed.io.din := Mux(first2B.asBool(),aligndata,0.U)

  val i0_shift = io.dec_i0_decode_d & !error_stall

  io.dec_aln.ifu_pmu_instr_aligned := i0_shift

  shift_2B := i0_shift & first2B
  shift_4B := i0_shift & first4B
  ////
  f0_shift_2B := Mux1H(Seq(shift_2B.asBool -> f0val(0), shift_4B.asBool -> (f0val(0) & !f0val(1))))
  f1_shift_2B :=  f0val(0) & !f0val(1) & shift_4B
}
//object Aligner extends App {
//  (new chisel3.stage.ChiselStage).emitVerilog(new ifu_aln_ctl())
//}