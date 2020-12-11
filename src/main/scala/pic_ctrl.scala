import chisel3._
import chisel3.util._
import include._
import lib._
import chisel3.experimental.chiselName

@chiselName
class pic_ctrl extends Module with RequireAsyncReset with lib {
  val io = IO (new Bundle {
    val scan_mode              = Input(Bool())
    val free_clk               = Input(Clock () )
    val active_clk             = Input(Clock () )
    val clk_override           = Input(Bool () )
    val extintsrc_req          = Input(UInt (PIC_TOTAL_INT_PLUS1.W))
    val lsu_pic = Flipped(new lsu_pic())
    val dec_pic = Flipped(new dec_pic)
//    val dec_tlu_meicurpl               = Input(UInt(4.W))
//    val dec_tlu_meipt                  = Input(UInt(4.W))
//
//    val mexintpend             = Output(Bool())
//    val pic_claimid                = Output(UInt(8.W))
//    val pic_pl                     = Output(UInt(4.W))
//    val mhwakeup               = Output(Bool())
  })

  def cmp_and_mux (a_id : UInt, a_priority : UInt, b_id : UInt, b_priority : UInt) =
    (Mux(a_priority<b_priority, b_id, a_id), Mux(a_priority<b_priority, b_priority, a_priority))

  def configurable_gw (clk : Clock, extintsrc_req_sync : UInt, meigwctrl_polarity : UInt, meigwctrl_type : UInt, meigwclr : UInt) = {
    val gw_int_pending = WireInit(UInt(1.W),0.U)
    val gw_int_pending_in =  (extintsrc_req_sync ^ meigwctrl_polarity) | (gw_int_pending & !meigwclr)
    gw_int_pending := withClock(clk){RegNext(gw_int_pending_in,0.U)}
    Mux(meigwctrl_type.asBool(), ((extintsrc_req_sync ^  meigwctrl_polarity) | gw_int_pending), (extintsrc_req_sync ^  meigwctrl_polarity))
  }

  // io.mexintpend    := 0.U
  // io.pic_claimid       := 0.U
  // io.pic_pl            := 0.U
  //io.picm_rd_data  := 0.U
  //io.mhwakeup      := 0.U

  val NUM_LEVELS            = log2Ceil(PIC_TOTAL_INT_PLUS1)
  val INTPRIORITY_BASE_ADDR = aslong(PIC_BASE_ADDR)
  val INTPEND_BASE_ADDR     = aslong(PIC_BASE_ADDR + 0x00001000)
  val INTENABLE_BASE_ADDR   = aslong(PIC_BASE_ADDR + 0x00002000)
  val EXT_INTR_PIC_CONFIG   = aslong(PIC_BASE_ADDR + 0x00003000)
  val EXT_INTR_GW_CONFIG    = aslong(PIC_BASE_ADDR + 0x00004000)
  val EXT_INTR_GW_CLEAR     = aslong(PIC_BASE_ADDR + 0x00005000)

  val INTPEND_SIZE =  PIC_TOTAL_INT_PLUS1 match {
    case x if x < 32  => 32
    case x if x < 64  => 64
    case x if x < 128 => 128
    case x if x < 256 => 256
    case x if x < 512 => 512
    case _            => 1024

  }

  val INT_GRPS = INTPEND_SIZE / 32
  val INTPRIORITY_BITS = 4
  val ID_BITS = 8
  val GW_CONFIG = WireInit(UInt(PIC_TOTAL_INT_PLUS1.W), init=0.U)

  val intpend_rd_out               = WireInit(0.U(32.W))
//  val intenable_rd_out             = WireInit(0.U(1.W))
  val intpriority_reg_inv          = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))
  val intpend_reg_extended         = WireInit(0.U (INTPEND_SIZE.W))
  val selected_int_priority        = WireInit(0.U (INTPRIORITY_BITS.W))
  val intpend_w_prior_en           = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))///////////////////
  val intpend_id                   = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(ID_BITS.W)))
  val levelx_intpend_w_prior_en    = Wire(Vec((NUM_LEVELS - NUM_LEVELS/2)+1 ,Vec ((PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt)+2,UInt(INTPRIORITY_BITS.W))))
  for(i<- 0 until (NUM_LEVELS - NUM_LEVELS/2)+1; j<- 0 until (PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt)+2) levelx_intpend_w_prior_en(i)(j) := 0.U
  val levelx_intpend_id            = Wire(Vec((NUM_LEVELS - NUM_LEVELS/2)+1 ,Vec ((PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt)+2,UInt(ID_BITS.W))))
  for(i<- 0 until (NUM_LEVELS - NUM_LEVELS/2)+1; j<- 0 until (PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt)+2) levelx_intpend_id(i)(j) := 0.U
  val l2_intpend_w_prior_en_ff     = Wire(Vec(PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt,UInt(INTPRIORITY_BITS.W)))
  for(i<- 0 until (PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt)) l2_intpend_w_prior_en_ff(i) := 0.U
  val l2_intpend_id_ff             = Wire(Vec(PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt,UInt(ID_BITS.W)))
  for(i<- 0 until (PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt)) l2_intpend_id_ff(i) := 0.U
  val config_reg                   = WireInit(0.U(1.W))
  val intpriord                    = WireInit(0.U(1.W))
  val prithresh_reg_write          = WireInit(0.U(1.W))
  val prithresh_reg_read           = WireInit(0.U(1.W))
  val picm_wren_ff                 = WireInit(0.U(1.W))
  val picm_rden_ff                 = WireInit(0.U(1.W))
  val picm_raddr_ff                = WireInit(0.U(32.W))
  val picm_waddr_ff                = WireInit(0.U(32.W))
  val picm_wr_data_ff              = WireInit(0.U(32.W))
  val mask                         = WireInit(0.U(4.W))
  val picm_mken_ff                 = WireInit(0.U(1.W))
  val claimid_in                   = WireInit(0.U(ID_BITS.W))
  //val extintsrc_req_gw             = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(1.W)))

  // clocks
  val pic_raddr_c1_clk             = Wire(Clock())
  val pic_data_c1_clk              = Wire(Clock())
  val pic_pri_c1_clk               = Wire(Clock())
  val pic_int_c1_clk               = Wire(Clock())
  val gw_config_c1_clk             = Wire(Clock())

  withClock(pic_raddr_c1_clk) {picm_raddr_ff := RegNext(io.lsu_pic.picm_rdaddr,0.U)}
  withClock(pic_data_c1_clk)  {picm_waddr_ff := RegNext (io.lsu_pic.picm_wraddr,0.U)}
  withClock(io.active_clk)    {picm_wren_ff := RegNext(io.lsu_pic.picm_wren,0.U)}
  withClock(io.active_clk)    {picm_rden_ff := RegNext(io.lsu_pic.picm_rden,0.U)}
  withClock(io.active_clk)    {picm_mken_ff := RegNext(io.lsu_pic.picm_mken,0.U)}
  withClock(pic_data_c1_clk)  {picm_wr_data_ff := RegNext(io.lsu_pic.picm_wr_data,0.U)}

  val temp_raddr_intenable_base_match =   ~(picm_raddr_ff ^ INTENABLE_BASE_ADDR.asUInt)
  val raddr_intenable_base_match     = temp_raddr_intenable_base_match(31,NUM_LEVELS+2).andR////   (31,NUM_LEVELS+2)

  val raddr_intpriority_base_match   = picm_raddr_ff(31,NUM_LEVELS+2) === (INTPRIORITY_BASE_ADDR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val raddr_config_gw_base_match     = picm_raddr_ff(31,NUM_LEVELS+2) === (EXT_INTR_GW_CONFIG>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val raddr_config_pic_match         = picm_raddr_ff(31,0)            === (EXT_INTR_PIC_CONFIG).asUInt //(31,0)
  val addr_intpend_base_match        = picm_raddr_ff(31,6)            === (INTPEND_BASE_ADDR>>6).asUInt

  val waddr_config_pic_match         = picm_waddr_ff(31,0)            === (EXT_INTR_PIC_CONFIG).asUInt //(31,0)
  val addr_clear_gw_base_match       = picm_waddr_ff(31,NUM_LEVELS+2) === (EXT_INTR_GW_CLEAR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val waddr_intpriority_base_match   = picm_waddr_ff(31,NUM_LEVELS+2) === (INTPRIORITY_BASE_ADDR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val waddr_intenable_base_match     = picm_waddr_ff(31,NUM_LEVELS+2) === (INTENABLE_BASE_ADDR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val waddr_config_gw_base_match     = picm_waddr_ff(31,NUM_LEVELS+2) === (EXT_INTR_GW_CONFIG>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val picm_bypass_ff                 = picm_rden_ff & picm_wren_ff & ( picm_raddr_ff === picm_waddr_ff)

  // ---- Clock gating section ------
  // c1 clock enables
  val pic_raddr_c1_clken  = io.lsu_pic.picm_mken | io.lsu_pic.picm_rden | io.clk_override
  val pic_data_c1_clken   = io.lsu_pic.picm_wren | io.clk_override
  val pic_pri_c1_clken    = (waddr_intpriority_base_match & picm_wren_ff)  | (raddr_intpriority_base_match & picm_rden_ff) | io.clk_override
  val pic_int_c1_clken    = (waddr_intenable_base_match & picm_wren_ff)  | (raddr_intenable_base_match & picm_rden_ff) | io.clk_override
  val gw_config_c1_clken  = (waddr_config_gw_base_match   & picm_wren_ff)  | (raddr_config_gw_base_match   & picm_rden_ff) | io.clk_override

  // C1 - 1 clock pulse for data
  pic_raddr_c1_clk  := rvclkhdr(clock,pic_raddr_c1_clken,io.scan_mode)
  pic_data_c1_clk   := rvclkhdr(clock,pic_data_c1_clken,io.scan_mode)
  pic_pri_c1_clk    := rvclkhdr(clock,pic_pri_c1_clken.asBool,io.scan_mode)
  pic_int_c1_clk    := rvclkhdr(clock,pic_int_c1_clken.asBool,io.scan_mode)
  gw_config_c1_clk  := rvclkhdr(clock,gw_config_c1_clken.asBool,io.scan_mode)

  // ------ end clock gating section ------------------------
  val extintsrc_req_sync  = Cat(rvsyncss(io.extintsrc_req(PIC_TOTAL_INT_PLUS1-1,1),io.free_clk),io.extintsrc_req(0))

  val intpriority_reg_we =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){waddr_intpriority_base_match & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val intpriority_reg_re =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){raddr_intpriority_base_match & (picm_raddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_rden_ff} else 0.U)
  val intenable_reg_we   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){waddr_intenable_base_match   & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val intenable_reg_re   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){raddr_intenable_base_match   & (picm_raddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_rden_ff} else 0.U)
  val gw_config_reg_we   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){waddr_config_gw_base_match   & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val gw_config_reg_re   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){raddr_config_gw_base_match   & (picm_raddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_rden_ff} else 0.U)
  val gw_clear_reg_we    =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){addr_clear_gw_base_match     & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val intpriority_reg    = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))
  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){ intpriority_reg(i) := withClock(pic_pri_c1_clk){RegEnable(picm_wr_data_ff(INTPRIORITY_BITS-1,0),0.U,intpriority_reg_we(i).asBool)}} else intpriority_reg(i) := 0.U(INTPRIORITY_BITS.W))
  val intenable_reg      = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(1.W)))
  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){intenable_reg(i) := withClock(pic_int_c1_clk){RegEnable(picm_wr_data_ff(0),0.U,intenable_reg_we(i).asBool)}} else intenable_reg(i) := 0.U(1.W))
  val gw_config_reg      = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(2.W)))
  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){ gw_config_reg(i)  := withClock(gw_config_c1_clk){RegEnable(picm_wr_data_ff(1,0),0.U,gw_config_reg_we(i).asBool)}} else  gw_config_reg(i)  := 0.U(2.W))

  val extintsrc_req_gw =  (0 until PIC_TOTAL_INT_PLUS1).map(i=>if(i>0)
    configurable_gw(io.free_clk, extintsrc_req_sync(i), gw_config_reg(i)(0), gw_config_reg(i)(1), gw_clear_reg_we(i).asBool())
  else 0.U)

  //val intpriord = WireInit(Bool(), false.B)
   (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpriority_reg_inv(i) := Mux(intpriord.asBool, ~intpriority_reg(i), intpriority_reg(i)))
   (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_w_prior_en(i) := Fill(INTPRIORITY_BITS, extintsrc_req_gw(i) & intenable_reg(i)) & intpriority_reg_inv(i))
   (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_id(i) := i.U)





  if (PIC_2CYCLE) {
    val level_intpend_w_prior_en = Wire(Vec((NUM_LEVELS/2)+1, Vec(PIC_TOTAL_INT_PLUS1+3, UInt(INTPRIORITY_BITS.W))))  //PIC_TOTAL_INT_PLUS1+3 should be there
    val level_intpend_id = Wire(Vec((NUM_LEVELS/2)+1, Vec(PIC_TOTAL_INT_PLUS1+3, UInt(ID_BITS.W)))) //PIC_TOTAL_INT_PLUS1+3 should be there
    for(i<-0 until (NUM_LEVELS/2)+1; j<-0 until  PIC_TOTAL_INT_PLUS1+3){ //PIC_TOTAL_INT_PLUS1+3 should be there
      level_intpend_w_prior_en(i)(j) := 0.U
      level_intpend_id(i)(j) := 0.U
    }


    level_intpend_w_prior_en(0) := (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_w_prior_en(i)) ++ IndexedSeq(0.U(4.W), 0.U(4.W), 0.U(4.W))
    level_intpend_id(0)         := (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_id(i)) ++ IndexedSeq(0.U(8.W), 0.U(8.W), 0.U(8.W))

    levelx_intpend_w_prior_en(NUM_LEVELS/2) :=  (0 until (PIC_TOTAL_INT_PLUS1/scala.math.pow(2,(NUM_LEVELS/2))).toInt).map(i=> l2_intpend_w_prior_en_ff(i)) ++ IndexedSeq(0.U(INTPRIORITY_BITS.W))
    levelx_intpend_id(NUM_LEVELS/2)         :=  (0 until (PIC_TOTAL_INT_PLUS1/scala.math.pow(2,(NUM_LEVELS/2))).toInt).map(i=> l2_intpend_id_ff(i)) ++ IndexedSeq(1.U(ID_BITS.W))

    ///  Do the prioritization of the interrupts here  ////////////
    for (l <-0 until NUM_LEVELS/2 ; m <- 0 to ((PIC_TOTAL_INT_PLUS1)/scala.math.pow(2,(l+1)).toInt)) {

      if ( m == (PIC_TOTAL_INT_PLUS1)/scala.math.pow(2,(l+1)).toInt) {
        level_intpend_w_prior_en(l+1)(m+1) := 0.U
        level_intpend_id(l+1)(m+1)         := 0.U
      }else { val a = 0.U}
      val (out_id, out_priority) = cmp_and_mux(level_intpend_id(l)(2*m), level_intpend_w_prior_en(l)(2*m), level_intpend_id(l)((2*m)+1), level_intpend_w_prior_en(l)((2*m)+1))
      level_intpend_id(l+1)(m)         :=  out_id
      level_intpend_w_prior_en(l+1)(m) :=  out_priority
    }

    (0 to PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt).map(i =>  l2_intpend_w_prior_en_ff(i) := withClock(io.free_clk){RegNext(level_intpend_w_prior_en(NUM_LEVELS/2)(i))})
    (0 to PIC_TOTAL_INT_PLUS1 / scala.math.pow(2,NUM_LEVELS/2).toInt).map(i =>  l2_intpend_id_ff(i) := withClock(io.free_clk){RegNext(level_intpend_id(NUM_LEVELS/2)(i))})

    for (j <-NUM_LEVELS/2 until NUM_LEVELS ; k <- 0 to ((PIC_TOTAL_INT_PLUS1)/math.pow(2,(j+1)).toInt)) {

      if ( k  == (PIC_TOTAL_INT_PLUS1)/scala.math.pow(2,(j+1)).toInt) {
        levelx_intpend_w_prior_en(j + 1)(k + 1)  := 0.U
        levelx_intpend_id(j + 1)(k + 1)          := 0.U
      }else { val a = 0.U}
      val (out_id1, out_priority1) = cmp_and_mux(level_intpend_id(j)(2*k), level_intpend_w_prior_en(j)(2*k), level_intpend_id(j)(2*k+1), level_intpend_w_prior_en(j)(2*k+1))
      (levelx_intpend_id(j+1)(k))          :=   out_id1
      (levelx_intpend_w_prior_en(j+1)(k))  :=   out_priority1

    }
    claimid_in              :=     levelx_intpend_id(NUM_LEVELS - NUM_LEVELS/2)(0)   // This is the last level output
    selected_int_priority   :=     levelx_intpend_w_prior_en(NUM_LEVELS - NUM_LEVELS/2)(0)
  }
  else {
    val level_intpend_w_prior_en = Wire(Vec((NUM_LEVELS)+1, Vec(PIC_TOTAL_INT_PLUS1+2, UInt(INTPRIORITY_BITS.W))))
    val level_intpend_id = Wire(Vec((NUM_LEVELS)+1, Vec(PIC_TOTAL_INT_PLUS1+2, UInt(ID_BITS.W))))
    dontTouch(level_intpend_id)
    for(i<-0 until (NUM_LEVELS)+1; j<-0 until  PIC_TOTAL_INT_PLUS1+2){
      level_intpend_w_prior_en(i)(j) := 0.U
      level_intpend_id(i)(j) := 0.U
    }
    level_intpend_w_prior_en(0) :=  Range(0,PIC_TOTAL_INT_PLUS1).map(i=> intpend_w_prior_en(i)) ++ IndexedSeq(Fill(INTPRIORITY_BITS,0.U),Fill(INTPRIORITY_BITS,0.U))
    level_intpend_id(0)         :=  (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_id(i)) ++ IndexedSeq(Fill(ID_BITS,1.U),Fill(ID_BITS,1.U)) /*Cat((1.U((1*ID_BITS).W)),*///l2_intpend_id_ff//)
    dontTouch(level_intpend_w_prior_en(0))

    ///  Do the prioritization of the interrupts here  ////////////
    for (l <-0 until NUM_LEVELS ) {
      for (m <- 0 to ((PIC_TOTAL_INT_PLUS1)/scala.math.pow(2,l+1)).toInt) {
      if ( m  == (PIC_TOTAL_INT_PLUS1)/scala.math.pow(2,l+1).toInt) {
        level_intpend_w_prior_en(l+1)(m+1) := 0.U
        level_intpend_id(l+1)(m+1)         := 0.U
      }else { val a = 0.U}
      val (out_id, out_priority) = cmp_and_mux(level_intpend_id(l)(2*m), level_intpend_w_prior_en(l)(2*m), level_intpend_id(l)(2*m+1), level_intpend_w_prior_en(l)(2*m+1))
      level_intpend_id(l+1)(m)          :=  out_id
      level_intpend_w_prior_en(l+1)(m)  :=  out_priority
        dontTouch(level_intpend_id(l)(2*m))
    }}
    claimid_in              :=     level_intpend_id(NUM_LEVELS)(0)   // This is the last level output
    selected_int_priority   :=     level_intpend_w_prior_en(NUM_LEVELS)(0)
    dontTouch(selected_int_priority)

  }

  // io.level_intpend_w_prior_en := (0 to NUM_LEVELS).map(i=>(0 to PIC_TOTAL_INT_PLUS1+1).map(j=>
  // level_intpend_w_prior_en(i)(j)).reverse.reduce(Cat(_,_))).reverse.reduce(Cat(_,_))

  ///////////////////////////////////////////////////////////////////////
  // Config Reg`
  ///////////////////////////////////////////////////////////////////////

  val config_reg_we  = waddr_config_pic_match & picm_wren_ff
  val config_reg_re  = raddr_config_pic_match & picm_rden_ff
  val config_reg_in  = picm_wr_data_ff(0)
  withClock(io.free_clk){config_reg := RegEnable(config_reg_in,0.U,config_reg_we.asBool)}
  intpriord  := config_reg



  val pl_in                =      selected_int_priority
  ///////////////////////////////////////////////////////////
  /// pic_claimid  Reg and Corresponding pic_pl
  ///////////////////////////////////////////////////////////
  val pl_in_q = Mux(intpriord.asBool,~pl_in,pl_in).asUInt
  withClock(io.free_clk){io.dec_pic.pic_claimid := RegNext(claimid_in,0.U)}
  withClock(io.free_clk){io.dec_pic.pic_pl := RegNext(pl_in_q,0.U)}
  val meipt_inv = Mux(intpriord.asBool,~io.dec_pic.dec_tlu_meipt,io.dec_pic.dec_tlu_meipt)
  val meicurpl_inv = Mux(intpriord.asBool,~io.dec_pic.dec_tlu_meicurpl,io.dec_pic.dec_tlu_meicurpl)
  val mexintpend_in = ( selected_int_priority > meipt_inv) & ( selected_int_priority > meicurpl_inv)
  io.dec_pic.mexintpend := withClock(io.free_clk){RegNext(mexintpend_in,0.U)}
  val maxint = Mux(intpriord.asBool,0.U,15.U)
  val mhwakeup_in = pl_in_q === maxint
  io.dec_pic.mhwakeup := withClock(io.free_clk){RegNext(mhwakeup_in,0.U)}

  //////////////////////////////////////////////////////////////////////////
  //  Reads of register.
  //  1- intpending
  //////////////////////////////////////////////////////////////////////////
  val intpend_reg_read     =  addr_intpend_base_match      & picm_rden_ff
  val intpriority_reg_read =  raddr_intpriority_base_match & picm_rden_ff
  val intenable_reg_read   =  raddr_intenable_base_match   & picm_rden_ff
  val gw_config_reg_read   =  raddr_config_gw_base_match   & picm_rden_ff

  intpend_reg_extended  := Cat(Fill(INTPEND_SIZE-PIC_TOTAL_INT_PLUS1,0.U),(0 until PIC_TOTAL_INT_PLUS1/*extintsrc_req_gw.size*/).map(i => extintsrc_req_gw(i)).reverse.reduce(Cat(_,_)))

  val intpend_rd_part_out = Wire(Vec(INT_GRPS,UInt(32.W)))
    (0 until INT_GRPS).map (i=> intpend_rd_part_out(i) := Fill(32,(intpend_reg_read & (picm_raddr_ff(5,2) === i.asUInt))) & intpend_reg_extended((32*i)+31,32*i))//.reverse.reduce(Cat(_,_))
  intpend_rd_out         := intpend_rd_part_out.reduce (_|_)
  //for(i <- 0 until PIC_TOTAL_INT_PLUS1) { when (intenable_reg_re(i).asBool){ intenable_rd_out := intenable_reg(i)}.otherwise {intenable_rd_out :=0.U} }
  val intenable_rd_out = MuxCase(0.U,(0 until PIC_TOTAL_INT_PLUS1).map (i=> intenable_reg_re(i).asBool -> intenable_reg(i) ))
  val intpriority_rd_out  = MuxCase(0.U,(0 until PIC_TOTAL_INT_PLUS1).map (i=> intpriority_reg_re(i).asBool -> intpriority_reg(i)))
  val gw_config_rd_out    = MuxCase(0.U,(0 until PIC_TOTAL_INT_PLUS1).map (i=> gw_config_reg_re(i).asBool -> gw_config_reg(i)))
  //////////////////////////////////////////////////////////////////////////////////////////////////

  val picm_rd_data_in = WireInit(UInt(32.W),0.U)
  picm_rd_data_in := Mux1H(Seq(
    intpend_reg_read.asBool          ->  intpend_rd_out,
    intpriority_reg_read.asBool      ->  Cat(Fill(32-INTPRIORITY_BITS,0.U),intpriority_rd_out )  ,
    intenable_reg_read.asBool        ->  Cat(Fill(31,0.U),intenable_rd_out),
    gw_config_reg_read.asBool        ->  Cat(Fill(30,0.U),gw_config_rd_out) ,
    config_reg_re.asBool             ->  Cat(Fill(31,0.U),config_reg) ,
    (picm_mken_ff & mask(3)).asBool  ->  Cat(Fill(30,0.U)  , "b11".U(2.W)) ,
    (picm_mken_ff & mask(2)).asBool  ->  Cat(Fill(31,0.U)  , "b1".U(1.W)),
    (picm_mken_ff & mask(1)).asBool  ->  Cat(Fill(28,0.U)  , "b1111".U(4.W)) ,
    (picm_mken_ff & mask(0)).asBool  ->  Fill(32,0.U)   ))


  io.lsu_pic.picm_rd_data := Mux(picm_bypass_ff.asBool, picm_wr_data_ff, picm_rd_data_in)
  val address = picm_raddr_ff(14,0)

  mask := 1.U(4.W)
  switch (address) {
    is ("b011000000000000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b100000000000100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000001000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000001100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000010000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000010100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000011000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000011100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000100000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000100100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000101000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000101100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000110000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000110100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000111000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000000111100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001000000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001000100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001001000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001001100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001010000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001010100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001011000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001011100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001100000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001100100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001101000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001101100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001110000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001110100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001111000".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b100000001111100".U(15.W))  {mask := "b1000".U(4.W)}
    is ("b010000000000100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000001000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000001100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000010000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000010100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000011000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000011100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000100000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000100100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000101000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000101100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000110000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000110100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000111000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000000111100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001000000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001000100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001001000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001001100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001010000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001010100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001011000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001011100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001100000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001100100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001101000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001101100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001110000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001110100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001111000".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b010000001111100".U(15.W))  {mask := "b0100".U(4.W)}
    is ("b000000000000100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000001000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000001100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000010000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000010100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000011000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000011100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000100000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000100100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000101000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000101100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000110000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000110100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000111000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000000111100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001000000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001000100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001001000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001001100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001010000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001010100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001011000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001011100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001100000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001100100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001101000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001101100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001110000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001110100".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001111000".U(15.W))  {mask := "b0010".U(4.W)}
    is ("b000000001111100".U(15.W))  {mask := "b0010".U(4.W)}

  }

}
