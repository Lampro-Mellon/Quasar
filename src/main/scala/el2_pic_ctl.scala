import chisel3._
import chisel3.util._
import include._
import lib._

class el2_pic_ctrl extends Module with RequireAsyncReset with el2_lib {
  val io = IO (new Bundle {
    val scan_mode              = Input(Bool())
    val free_clk               = Input(Clock () )
    val active_clk             = Input(Clock () )
    val clk_override           = Input(Bool () )
    val extintsrc_req          = Input(UInt (PIC_TOTAL_INT_PLUS1.W))
    val picm_rdaddr            = Input(UInt(32.W))
    val picm_wraddr            = Input(UInt(32.W))
    val picm_wr_data           = Input(UInt(32.W))
    val picm_wren              = Input(Bool())
    val picm_rden              = Input(Bool())
    val picm_mken              = Input(Bool())
    val meicurpl               = Input(UInt(4.W))
    val meipt                  = Input(UInt(4.W))

    val mexintpend             = Output(Bool())
    val claimid                = Output(UInt(8.W))
    val pl                     = Output(UInt(4.W))
    val picm_rd_data           = Output(UInt(32.W))
    val mhwakeup               = Output(Bool())

    val test = Output(UInt())
  })

  io.mexintpend    := 0.U
  io.claimid       := 0.U
  io.pl            := 0.U
  io.picm_rd_data  := 0.U
  io.mhwakeup      := 0.U

  val NUM_LEVELS            = log2Ceil(PIC_TOTAL_INT_PLUS1)
  val INTPRIORITY_BASE_ADDR = PIC_BASE_ADDR.U
  val INTPEND_BASE_ADDR     = (PIC_BASE_ADDR + 0x00001000L).U
  val INTENABLE_BASE_ADDR   = (PIC_BASE_ADDR + 0x00002000L).U
  val EXT_INTR_PIC_CONFIG   = (PIC_BASE_ADDR + 0x00003000L).U
  val EXT_INTR_GW_CONFIG    = (PIC_BASE_ADDR + 0x00004000L).U
  val EXT_INTR_GW_CLEAR     = (PIC_BASE_ADDR + 0x00005000L).U

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

  // ---- Clock gating section ------
  // c1 clock enables
  val pic_raddr_c1_clken  = io.picm_mken | io.picm_rden | io.clk_override
  val pic_data_c1_clken   = io.picm_wren | io.clk_override
  val waddr_intpriority_base_match = WireInit(Bool(), false.B)
  val picm_wren_ff = WireInit(Bool(), false.B)
  val raddr_intpriority_base_match = WireInit(Bool(), false.B)
  val picm_rden_ff = WireInit(Bool(), false.B)
  val raddr_intenable_base_match = WireInit(Bool(), false.B)
  val waddr_config_gw_base_match = WireInit(Bool(), false.B)
  val raddr_config_gw_base_match = WireInit(Bool(), false.B)
  val pic_pri_c1_clken    = (waddr_intpriority_base_match & picm_wren_ff)  | (raddr_intpriority_base_match & picm_rden_ff) | io.clk_override
  val pic_int_c1_clken    = (waddr_intpriority_base_match & picm_wren_ff)  | (raddr_intenable_base_match & picm_rden_ff) | io.clk_override
  val gw_config_c1_clken  = (waddr_config_gw_base_match   & picm_wren_ff)  | (raddr_config_gw_base_match   & picm_rden_ff) | io.clk_override

  // C1 - 1 clock pulse for data
  val pic_raddr_c1_clk  = rvclkhdr(clock,pic_raddr_c1_clken,io.scan_mode)
  val pic_data_c1_clk   = rvclkhdr(clock,pic_data_c1_clken,io.scan_mode)
  val pic_pri_c1_clk    = rvclkhdr(clock,pic_pri_c1_clken.asBool,io.scan_mode)
  val pic_int_c1_clk    = rvclkhdr(clock,pic_int_c1_clken.asBool,io.scan_mode)
  val gw_config_c1_clk  = rvclkhdr(clock,gw_config_c1_clken.asBool,io.scan_mode)


  val picm_raddr_ff = WireInit(UInt(32.W), 0.U)
  raddr_intenable_base_match  := picm_raddr_ff(31,NUM_LEVELS+2)===INTENABLE_BASE_ADDR(31,NUM_LEVELS+2)////   (31,NUM_LEVELS+2)
  io.test := INTENABLE_BASE_ADDR

  val picm_waddr_ff = WireInit(UInt(32.W), 0.U)
  raddr_intpriority_base_match   := picm_raddr_ff(31,NUM_LEVELS+2) === INTPRIORITY_BASE_ADDR(31,NUM_LEVELS+2)//   (31,NUM_LEVELS+2)
  raddr_config_gw_base_match     := picm_raddr_ff(31,NUM_LEVELS+2) === EXT_INTR_GW_CONFIG(31,NUM_LEVELS+2)// EXT_INTR_GW_CONFIG>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
  val raddr_config_pic_match         = picm_raddr_ff(31,0)            === EXT_INTR_PIC_CONFIG
  val addr_intpend_base_match        = picm_raddr_ff(31,6)            === INTPEND_BASE_ADDR(31,6)
  val waddr_config_pic_match         = picm_waddr_ff(31,0)            === (EXT_INTR_PIC_CONFIG).asUInt //(31,0)

  val addr_clear_gw_base_match       = picm_waddr_ff(31,NUM_LEVELS+2) === EXT_INTR_GW_CLEAR(31, NUM_LEVELS+2)
  waddr_intpriority_base_match   := picm_waddr_ff(31,NUM_LEVELS+2) === INTPRIORITY_BASE_ADDR(31,NUM_LEVELS+2)
  val waddr_intenable_base_match     = picm_waddr_ff(31,NUM_LEVELS+2) === INTENABLE_BASE_ADDR(31, NUM_LEVELS+2)
  waddr_config_gw_base_match     := picm_waddr_ff(31,NUM_LEVELS+2) === EXT_INTR_GW_CONFIG(31, NUM_LEVELS+2)

  val picm_bypass_ff                 = picm_rden_ff & picm_wren_ff & ( picm_raddr_ff === picm_waddr_ff)

  picm_raddr_ff := withClock(pic_raddr_c1_clk){RegNext(io.picm_rdaddr, 0.U)}
  picm_waddr_ff := withClock(pic_data_c1_clk){RegNext(io.picm_wraddr, 0.U)}
  picm_wren_ff := withClock(io.active_clk){RegNext(io.picm_wren, false.B)}
  picm_rden_ff := withClock(io.active_clk){RegNext(io.picm_rden, false.B)}
  val picm_mken_ff = withClock(io.active_clk){RegNext(io.picm_mken, false.B)}
  val picm_wr_data_ff = withClock(pic_data_c1_clk){RegNext(io.picm_wr_data, 0.U)}


  def el2_cmp_and_mux (a_id : UInt, a_priority : UInt, b_id : UInt, b_priority : UInt) =
    (Mux(a_priority<b_priority, b_id, a_id), Mux(a_priority<b_priority, b_priority, a_priority))

  // ------ end clock gating section ------------------------
  val extintsrc_req_sync  = Cat(rvsyncss(io.extintsrc_req(PIC_TOTAL_INT_PLUS1-1,1),io.free_clk),io.extintsrc_req(0))

  val intpriority_reg_we =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){waddr_intpriority_base_match & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val intpriority_reg_re =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){raddr_intpriority_base_match & (picm_raddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_rden_ff} else 0.U)
  val intenable_reg_we   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){waddr_intenable_base_match   & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val intenable_reg_re   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){raddr_intenable_base_match   & (picm_raddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_rden_ff} else 0.U)
  val gw_config_reg_we   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){waddr_config_gw_base_match   & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val gw_config_reg_re   =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){raddr_config_gw_base_match   & (picm_raddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_rden_ff} else 0.U)
  val gw_clear_reg_we    =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){addr_clear_gw_base_match     & (picm_waddr_ff(NUM_LEVELS+1,2) === i.asUInt) & picm_wren_ff} else 0.U)
  val intpriority_reg  = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))
  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){ intpriority_reg(i) := withClock(pic_pri_c1_clk){RegEnable(picm_wr_data_ff(INTPRIORITY_BITS-1,0),0.U,intpriority_reg_we(i).asBool)}} else intpriority_reg(i) := 0.U(INTPRIORITY_BITS.W))
  val intenable_reg      =  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){withClock(pic_int_c1_clk){RegEnable(picm_wr_data_ff(0),0.U,intenable_reg_we(i).asBool)}} else 0.U)
  val gw_config_reg                = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(2.W)))
  (0 until PIC_TOTAL_INT_PLUS1).map (i => if(i>0){ gw_config_reg(i)  := withClock(gw_config_c1_clk){RegEnable(picm_wr_data_ff(1,0),0.U,gw_config_reg_we(i).asBool)}} else  gw_config_reg(i)  := 0.U)


  val extintsrc_req_gw = (0 until PIC_TOTAL_INT_PLUS1).map(i=>if(i>0) el2_configurable_gw(clock, reset.asAsyncReset(), extintsrc_req_sync(i), gw_config_reg(i)(0), gw_config_reg(i)(1), gw_clear_reg_we(i).asBool()) else 0.U)


  val intpriord = WireInit(Bool(), false.B)
  val intpriority_reg_inv = (0 until PIC_TOTAL_INT_PLUS1).map(i=>Mux(intpriord.asBool, !intpriority_reg(i), intpriority_reg(i)))
  val intpend_w_prior_en = (0 until PIC_TOTAL_INT_PLUS1).map(i=>Fill(INTPRIORITY_BITS, extintsrc_req_gw(i) & intenable_reg(i)) & intpriority_reg_inv(i))
  val intpend_id = (0 until PIC_TOTAL_INT_PLUS1).map(_.U)

  val selected_int_priority = WireInit(UInt(INTPRIORITY_BITS.W), 0.U)
  val pl_in = selected_int_priority


  val level_intpend_w_prior_en = Wire(Vec((NUM_LEVELS/2)+1, Vec(PIC_TOTAL_INT_PLUS1+3, UInt(INTPRIORITY_BITS.W))))
  val level_intpend_id = Wire(Vec((NUM_LEVELS/2)+1, Vec(PIC_TOTAL_INT_PLUS1+3, UInt(ID_BITS.W))))
  for(i<-1 until (NUM_LEVELS/2)+1; j<-0 until  PIC_TOTAL_INT_PLUS1+3){
    level_intpend_w_prior_en(i)(j) := 0.U
    level_intpend_id(i)(j) := 0.U
  }
  level_intpend_w_prior_en(0) := IndexedSeq(0.U(4.W), 0.U(4.W), 0.U(4.W)) ++ (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_w_prior_en(i))
  level_intpend_id(0) := IndexedSeq(0.U(8.W), 0.U(8.W), 0.U(8.W)) ++ (0 until PIC_TOTAL_INT_PLUS1).map(i=> intpend_id(i))

  for(l<- 0 until NUM_LEVELS/2; m<- 0 to PIC_TOTAL_INT_PLUS1/math.pow(2, l+1).asInstanceOf[Int]){
    if(m == PIC_TOTAL_INT_PLUS1/math.pow(2, l+1).asInstanceOf[Int]) {
      level_intpend_w_prior_en(l+1)(m+1) := 0.U
      level_intpend_id(l+1)(m+1) := 0.U}
    else{ val a = 0.U}
      val (out_id, out_priority) = el2_cmp_and_mux(level_intpend_id(l)(2*m), level_intpend_w_prior_en(l)(2*m), level_intpend_id(l)((2*m)+1), level_intpend_w_prior_en(l)((2*m)+1))
      level_intpend_id(l+1)(m) := out_id
      level_intpend_w_prior_en(l+1)(m) := out_priority
  }
  val temp = PIC_TOTAL_INT_PLUS1/math.pow(2, 1).asInstanceOf[Int]

/*
  val pl_in                =      selected_int_priority
  val level_intpend_w_prior_en    = Wire(Vec((NUM_LEVELS/2)+1 ,Vec((PIC_TOTAL_INT_PLUS1+2)+1,UInt(INTPRIORITY_BITS.W))))
  for(i<- 0 until (NUM_LEVELS/2)+1; j<- 0 until (PIC_TOTAL_INT_PLUS1+2)+1) level_intpend_w_prior_en(i)(j) := 0.U //(0 until (NUM_LEVELS/2)+1).map(i => (0 until (PIC_TOTAL_INT_PLUS1+2)+1).map(j => 0.U(INTPRIORITY_BITS.W)))
  val level_intpend_id            = Wire(Vec((NUM_LEVELS/2)+1 ,Vec((PIC_TOTAL_INT_PLUS1+2)+1,UInt(ID_BITS.W))))
  for(i<- 0 until (NUM_LEVELS/2)+1; j<- 0 until (PIC_TOTAL_INT_PLUS1+2)+1) level_intpend_id(i)(j) := 0.U

  if (PIC_2CYCLE == 1) {

    level_intpend_w_prior_en(0) := intpend_w_prior_en
    level_intpend_id(0)         := intpend_id

    levelx_intpend_w_prior_en(NUM_LEVELS/2) := l2_intpend_w_prior_en_ff
    levelx_intpend_id(NUM_LEVELS/2)        := /*Cat((1.U((1*ID_BITS).W)),*/l2_intpend_id_ff//)
    ///  Do the prioritization of the interrupts here  ////////////
    for (l <-0 until NUM_LEVELS/2 ; m <- 0 until ((PIC_TOTAL_INT_PLUS1)/math.pow(2,(l+1)).asInstanceOf[Int])) {

      if ( m == (PIC_TOTAL_INT_PLUS1)/math.pow(2,(l+1)).asInstanceOf[Int]) {
        level_intpend_w_prior_en(l+1)(m+1) := 0.U
        level_intpend_id(l+1)(m+1)         := 0.U
      }
      val cmp_l1 = Module (new el2_cmp_and_mux(ID_BITS,INTPRIORITY_BITS))
      cmp_l1.io.a_id          :=  (level_intpend_id(l)(2*m)  )
      cmp_l1.io.a_priority    :=  (level_intpend_w_prior_en(l)(2*m))
      cmp_l1.io.b_id          :=  (level_intpend_id(l)(2*m+1))
      cmp_l1.io.b_priority    :=  (level_intpend_w_prior_en(l)(2*m+1))
      (level_intpend_id(l+1)(m))          :=  cmp_l1.io.out_id
      (level_intpend_w_prior_en(l+1)(m))  :=  cmp_l1.io.out_priority
    }



    (0 until PIC_TOTAL_INT_PLUS1 / math.pow(2,NUM_LEVELS/2).asInstanceOf[Int]).map(i =>  l2_intpend_w_prior_en_ff(i) := withClock(io.free_clk){RegNext(level_intpend_w_prior_en(NUM_LEVELS/2)(i))})
    (0 until PIC_TOTAL_INT_PLUS1 / math.pow(2,NUM_LEVELS/2).asInstanceOf[Int]).map(i =>  l2_intpend_id_ff(i) := withClock(io.free_clk){RegNext(level_intpend_id(NUM_LEVELS/2)(i))})


    for (j <-0 until NUM_LEVELS/2 ; k <- 0 until ((PIC_TOTAL_INT_PLUS1)/math.pow(2,(j+1)).asInstanceOf[Int])) {

      if ( k  == (PIC_TOTAL_INT_PLUS1)/math.pow(2,(j+1)).asInstanceOf[Int]) {
        levelx_intpend_w_prior_en(j + 1)(k + 1)  := 0.U
        levelx_intpend_id(j + 1)(k + 1)          := 0.U
      }
      val cmp_l1 = Module (new el2_cmp_and_mux(ID_BITS,INTPRIORITY_BITS))
      cmp_l1.io.a_id          :=  (levelx_intpend_id(j)(2*k))
      cmp_l1.io.a_priority    :=  (levelx_intpend_w_prior_en(j)(2*k))
      cmp_l1.io.b_id          :=  (levelx_intpend_id(j)(2*k+1))
      cmp_l1.io.b_priority    :=  (levelx_intpend_w_prior_en(j)(2*k+1))
      (levelx_intpend_id(j+1)(k))          :=   cmp_l1.io.out_id
      (levelx_intpend_w_prior_en(j+1)(k))  :=   cmp_l1.io.out_priority

    }
    claimid_in           :=      levelx_intpend_id((NUM_LEVELS - NUM_LEVELS/2)+1)(0)   // This is the last level output
    selected_int_priority   :=     levelx_intpend_w_prior_en((NUM_LEVELS - NUM_LEVELS/2)+1)(0)
  }
  else {
    //TODO: concatenate zeroes and ones in the vector see orignal code LINES 270, 274, 325, 395, 426, 176
    //level_intpend_w_prior_en(0) := VecInit.tabulate(PIC_TOTAL_INT_PLUS1)(i=>Cat(0.U(3.W),intpend_w_prior_en(i))       )
    //val t = VecInit.tabulate(4)(i=> Cat(0.U(3.W),intpend_w_prior_en))
    val t = Wire(Vec((PIC_TOTAL_INT_PLUS1+2)+1,UInt(INTPRIORITY_BITS.W)))
    for(i<- 0 until (PIC_TOTAL_INT_PLUS1+2)+1) t(i) := 0.U
    val t2 = Wire(Vec((PIC_TOTAL_INT_PLUS1+2)+1,UInt(ID_BITS.W)))
    for(i<- 0 until (PIC_TOTAL_INT_PLUS1+2)+1) t2(i) := 0.U
    level_intpend_w_prior_en(0) :=  t//intpend_w_prior_en
    level_intpend_id(0) := t2//intpend_id

    ///  Do the prioritization of the interrupts here  ////////////
    for (l <-0 until NUM_LEVELS/2 ; m <- 0 until ((PIC_TOTAL_INT_PLUS1)/math.pow(2,(l+1)).asInstanceOf[Int])) {
      if ( m  == (PIC_TOTAL_INT_PLUS1)/math.pow(2,(l+1)).asInstanceOf[Int]) {
        level_intpend_w_prior_en(l+1)(m+1) := 0.U
        level_intpend_id(l+1)(m+1)         := 0.U
      }
      val cmp_l1 = Module (new el2_cmp_and_mux(ID_BITS,INTPRIORITY_BITS))
      cmp_l1.io.a_id          :=  (level_intpend_id(l)(2*m)  )
      cmp_l1.io.a_priority    :=  (level_intpend_w_prior_en(l)(2*m))
      cmp_l1.io.b_id          :=  (level_intpend_id(l)(2*m+1))
      cmp_l1.io.b_priority    :=  (level_intpend_w_prior_en(l)(2*m+1))
      (level_intpend_id(l+1)(m))          :=  cmp_l1.io.out_id
      (level_intpend_w_prior_en(l+1)(m))  :=  cmp_l1.io.out_priority
    }
    claimid_in           :=      levelx_intpend_id((NUM_LEVELS - NUM_LEVELS/2))(0)   // This is the last level output
    selected_int_priority   :=     levelx_intpend_w_prior_en((NUM_LEVELS - NUM_LEVELS/2))(0)

  }


  ///////////////////////////////////////////////////////////////////////
  // Config Reg`
  ///////////////////////////////////////////////////////////////////////

  val config_reg_we  = waddr_config_pic_match & picm_wren_ff
  val config_reg_re  = raddr_config_pic_match & picm_rden_ff
  val config_reg_in  = picm_wr_data_ff(0)
  withClock(io.free_clk){config_reg := RegEnable(config_reg_in,0.U,config_reg_we.asBool)}
  intpriord  := config_reg

  ///////////////////////////////////////////////////////////
  /// ClaimId  Reg and Corresponding PL
  ///////////////////////////////////////////////////////////
  val pl_in_q = Mux(intpriord.asBool,~pl_in,pl_in).asUInt
  withClock(io.free_clk){io.claimid := RegNext(claimid_in,0.U)}
  withClock(io.free_clk){io.pl := RegNext(pl_in_q,0.U)}
  val meipt_inv = Mux(intpriord.asBool,!io.meipt,io.meipt)
  val meicurpl_inv = Mux(intpriord.asBool,!io.meicurpl,io.meicurpl)
  val mexintpend_in = ( selected_int_priority > meipt_inv) & ( selected_int_priority > meicurpl_inv)
  withClock(io.free_clk){io.mexintpend := RegNext(mexintpend_in,0.U)}
  val maxint = Mux(intpriord.asBool,0.U,15.U)
  val mhwakeup_in = pl_in_q === maxint
  withClock(io.free_clk){io.mhwakeup := RegNext(mhwakeup_in,0.U)}

  //////////////////////////////////////////////////////////////////////////
  //  Reads of register.
  //  1- intpending
  //////////////////////////////////////////////////////////////////////////
  val intpend_reg_read     =  addr_intpend_base_match      & picm_rden_ff
  val intpriority_reg_read =  raddr_intpriority_base_match & picm_rden_ff
  val intenable_reg_read   =  raddr_intenable_base_match   & picm_rden_ff
  val gw_config_reg_read   =  raddr_config_gw_base_match   & picm_rden_ff

  intpend_reg_extended  := Cat(0.U(32.W),(0 until extintsrc_req_gw.size).map(i => extintsrc_req_gw(i)).reverse.reduce(Cat(_,_)))

  val intpend_rd_part_out = (0 until INT_GRPS).map (i=> Fill(32,intpend_reg_read & picm_raddr_ff(5,2) === i.asUInt) & intpend_reg_extended(((32*i)+31),(32*i))).reverse.reduce(Cat(_,_))
  intpend_rd_out         := (0 until INT_GRPS).map (i=>intpend_rd_part_out(i)).reduce (_|_)
  for(i <- 0 until PIC_TOTAL_INT_PLUS1) { when (intenable_reg_re(i).asBool){ intenable_rd_out := intenable_reg(i)}.otherwise {intenable_rd_out :=0.U} }

  val intpriority_rd_out  = MuxCase(0.U,(0 until PIC_TOTAL_INT_PLUS1).map (i=> intpriority_reg_re(i).asBool -> intpriority_reg(i)))
  val gw_config_rd_out    = MuxCase(0.U,(0 until PIC_TOTAL_INT_PLUS1).map (i=> gw_config_reg_re(i).asBool -> gw_config_reg(i)))
  //////////////////////////////////////////////////////////////////////////////////////////////////

  val picm_rd_data_in = WireInit(UInt(32.W),0.U)
  picm_rd_data_in := Mux1H(Seq(
    intpend_reg_read.asBool          ->  intpend_rd_out,
    intpriority_reg_read.asBool      ->  intpriority_rd_out   ,
    intenable_reg_read.asBool        ->  intenable_rd_out,
    gw_config_reg_read.asBool        ->  gw_config_rd_out ,
    config_reg_re.asBool             ->  config_reg ,
    (picm_mken_ff & mask(3)).asBool  ->  Cat("b0".U(30.W) , "b11".U(2.W)) ,
    (picm_mken_ff & mask(2)).asBool  ->  Cat("b0".U(31.W) , "b1".U(1.W)),
    (picm_mken_ff & mask(1)).asBool  ->  Cat("b0".U(28.W) , "b1111".U(4.W)) ,
    (picm_mken_ff & mask(0)).asBool  ->  "b0".U(32.W)   ))


  val picm_rd_data = Mux(picm_bypass_ff.asBool, picm_wr_data_ff, picm_rd_data_in)
  val address = picm_raddr_ff(14,0)
}


class el2_cmp_and_mux(ID_BITS:Int=8,INTPRIORITY_BITS:Int=4) extends Module{
  val io = IO(new Bundle{
    val a_id          = Input (UInt(ID_BITS.W))
    val a_priority    = Input (UInt(INTPRIORITY_BITS.W))
    val b_id          = Input (UInt(ID_BITS.W))
    val b_priority    = Input (UInt(INTPRIORITY_BITS.W))
    val out_id        = Output (UInt(ID_BITS.W))
    val out_priority  = Output (UInt(INTPRIORITY_BITS.W))
  })
  //logic   a_is_lt_b ;

  val  a_is_lt_b  = ( io.a_priority(INTPRIORITY_BITS-1,0) < io.b_priority(INTPRIORITY_BITS-1,0) )

  io.out_id   := Mux(a_is_lt_b, io.b_id , io.a_id)
  io.out_priority := Mux(a_is_lt_b ,io.b_priority ,io.a_priority)
}



class el2_configurable_gw extends Module{
  val io = IO(new Bundle{
    val extintsrc_req_sync   = Input(UInt(1.W))
    val meigwctrl_polarity   = Input(UInt(1.W))
    val meigwctrl_type       = Input(UInt(1.W))
    val meigwclr             = Input(UInt(1.W))
    val extintsrc_req_config = Output(UInt(1.W))
  })

  val gw_int_pending = WireInit(UInt(1.W),0.U)

  val gw_int_pending_in =  (io.extintsrc_req_sync ^ io.meigwctrl_polarity) | (gw_int_pending & !io.meigwclr)
  gw_int_pending := RegNext(gw_int_pending_in,0.U)

  io.extintsrc_req_config :=  Mux(io.meigwctrl_type.asBool(), ((io.extintsrc_req_sync ^  io.meigwctrl_polarity) | gw_int_pending), (io.extintsrc_req_sync ^  io.meigwctrl_polarity))
*/
}





object pic_main extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_pic_ctrl()))
}
