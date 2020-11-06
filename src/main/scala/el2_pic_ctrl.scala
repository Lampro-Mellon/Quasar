//import chisel3._
//import chisel3.util._
//import include._
//import lib._
//import snapshot._
//
//class el2_pic_ctrl extends Module with RequireAsyncReset with el2_lib {
//  val io = IO (new Bundle {
//    val scan_mode              = Input(Bool())
//    val free_clk               = Input(Clock () )
//    val active_clk             = Input(Clock () )
//    val clk_override           = Input(Bool () )
//    val extintsrc_req          = Input(UInt (PIC_TOTAL_INT_PLUS1.W))
//    val picm_rdaddr            = Input(UInt(32.W))
//    val picm_wraddr            = Input(UInt(32.W))
//    val picm_wr_data           = Input(UInt(32.W))
//    val picm_wren              = Input(Bool())
//    val picm_rden              = Input(Bool())
//    val picm_mken              = Input(Bool())
//    val meicurpl               = Input(UInt(4.W))
//    val meipt                  = Input(UInt(4.W))
//
//    val mexintpend             = Output(Bool())
//    val claimid                = Output(UInt(8.W))
//    val pl                     = Output(UInt(4.W))
//    val picm_rd_data           = Output(UInt(32.W))
//    val mhwakeup               = Output(Bool())
//    val test                   = Output(UInt())
//  })
//
//  io.mexintpend    := 0.U
//  io.claimid       := 0.U
//  io.pl            := 0.U
//  io.picm_rd_data  := 0.U
//  io.mhwakeup      := 0.U
//
//  val NUM_LEVELS            = log2Ceil(PIC_TOTAL_INT_PLUS1)
//  val INTPRIORITY_BASE_ADDR = PIC_BASE_ADDR
//  val INTPEND_BASE_ADDR     = PIC_BASE_ADDR + 0x00001000L
//  val INTENABLE_BASE_ADDR   = PIC_BASE_ADDR + 0x00002000L
//  val EXT_INTR_PIC_CONFIG   = PIC_BASE_ADDR + 0x00003000L
//  val EXT_INTR_GW_CONFIG    = PIC_BASE_ADDR + 0x00004000L
//  val EXT_INTR_GW_CLEAR     = PIC_BASE_ADDR + 0x00005000L
//
//  val INTPEND_SIZE =  PIC_TOTAL_INT_PLUS1 match {
//    case x if x < 32  => 32
//    case x if x < 64  => 64
//    case x if x < 128 => 128
//    case x if x < 256 => 256
//    case x if x < 512 => 512
//    case _            => 1024
//
//  }
//
//  val INT_GRPS = INTPEND_SIZE / 32
//  val INTPRIORITY_BITS = 4
//  val ID_BITS = 8
//  val GW_CONFIG = WireInit(UInt(PIC_TOTAL_INT_PLUS1.W), init=0.U)
//
// // val addr_intpend_base_match      = WireInit(0.U(1.W))
// // val raddr_config_pic_match       = WireInit(0.U(1.W))
// // val raddr_intenable_base_match   = WireInit(0.U(1.W))
////  val raddr_intpriority_base_match = WireInit(0.U(1.W))
// // val raddr_config_gw_base_match   = WireInit(0.U(1.W))
// // val waddr_config_pic_match       = WireInit(0.U(1.W))
// // val waddr_intpriority_base_match = WireInit(0.U(1.W))
// // val waddr_intenable_base_match   = WireInit(0.U(1.W))
// // val waddr_config_gw_base_match   = WireInit(0.U(1.W))
// // val addr_clear_gw_base_match     = WireInit(0.U(1.W))
////  val mexintpend_in                = WireInit(0.U(1.W))
// // val mhwakeup_in                  = WireInit(0.U(1.W))
// // val intpend_reg_read             = WireInit(0.U(1.W))
//  val picm_rd_data_in              = WireInit(0.U(32.W))
//  val intpend_rd_out               = WireInit(0.U(32.W))
////  val intenable_rd_out             = WireInit(0.U(1.W))
//  val intpriority_rd_out           = WireInit(0.U (INTPRIORITY_BITS.W))
//  val gw_config_rd_out             = WireInit(0.U(2.W))
//  val intpriority_reg              = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))
//  intpriority_reg := (0 until PIC_TOTAL_INT_PLUS1).map(i => 0.U)
// // val intpriority_reg_inv          = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))
// // intpriority_reg_inv := (0 until PIC_TOTAL_INT_PLUS1).map(i => 0.U)
//  val intpriority_reg_we           = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
//  val intpriority_reg_re           = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
//  val gw_config_reg                = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(2.W)))
//  val intenable_reg                = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
//  val intenable_reg_we             = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
//  val intenable_reg_re             = WireInit(Bool(), init = false.B)
//  val gw_config_reg_we             = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
//  val gw_config_reg_re             = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
//  val gw_clear_reg_we              = WireInit(0.U (PIC_TOTAL_INT_PLUS1.W))
// //
//  val intpend_reg_extended         = WireInit(0.U (INTPEND_SIZE.W))
////  val maxint                       = WireInit(0.U (INTPRIORITY_BITS.W))
//  val selected_int_priority        = WireInit(0.U (INTPRIORITY_BITS.W))
////  val intpend_w_prior_en           = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(INTPRIORITY_BITS.W)))
////  val intpend_id                   = Wire(Vec(PIC_TOTAL_INT_PLUS1,UInt(ID_BITS.W)))
//  //val intpend_rd_part_out          = Wire(Vec(INT_GRPS,UInt(32.W)))
// // val levelx_intpend_w_prior_en    = Wire(Vec(NUM_LEVELS - NUM_LEVELS/2 ,Vec ((PIC_TOTAL_INT_PLUS1 / math.pow(2,NUM_LEVELS/2).asInstanceOf[Int])+1,UInt(INTPRIORITY_BITS.W))))
////  val levelx_intpend_id            = Wire(Vec(NUM_LEVELS - NUM_LEVELS/2 ,Vec ((PIC_TOTAL_INT_PLUS1 / math.pow(2,NUM_LEVELS/2).asInstanceOf[Int])+1,UInt(ID_BITS.W))))
////  val l2_intpend_w_prior_en_ff     = Wire(Vec(PIC_TOTAL_INT_PLUS1 / math.pow(2,NUM_LEVELS/2).asInstanceOf[Int],UInt(INTPRIORITY_BITS.W)))
// // val l2_intpend_id_ff             = Wire(Vec(PIC_TOTAL_INT_PLUS1 / math.pow(2,NUM_LEVELS/2).asInstanceOf[Int],UInt(ID_BITS.W)))
//  val config_reg                   = WireInit(0.U(1.W))
////  val intpriord                    = WireInit(0.U(1.W))
////  val config_reg_we                = WireInit(0.U(1.W))
////  val config_reg_re                = WireInit(0.U(1.W))
////  val config_reg_in                = WireInit(0.U(1.W))
//  val prithresh_reg_write          = WireInit(0.U(1.W))
//  val prithresh_reg_read           = WireInit(0.U(1.W))
// // val intpriority_reg_read         = WireInit(0.U(1.W))
//  //val intenable_reg_read           = WireInit(0.U(1.W))
//  //val gw_config_reg_read           = WireInit(0.U(1.W))
//  val picm_wren_ff                 = WireInit(0.U(1.W))
//  val picm_rden_ff                 = WireInit(0.U(1.W))
//  val picm_raddr_ff                = WireInit(0.U(32.W))
//  val picm_waddr_ff                = WireInit(0.U(32.W))
//  val picm_wr_data_ff              = WireInit(0.U(32.W))
//  val mask                         = WireInit(0.U(4.W))
//  val picm_mken_ff                 = WireInit(0.U(1.W))
//  val claimid_in                   = WireInit(0.U(ID_BITS.W))
//  val pl_in                        = WireInit(0.U(INTPRIORITY_BITS.W))
// // val pl_in_q                      = WireInit(0.U(INTPRIORITY_BITS.W))
//  val extintsrc_req_sync           = WireInit(0.U(PIC_TOTAL_INT_PLUS1.W))
//  val extintsrc_req_gw             = WireInit(0.U(PIC_TOTAL_INT_PLUS1.W))
// // val picm_bypass_ff               = WireInit(0.U(1.W))
//
//  // clocks
//  val pic_raddr_c1_clk             = Wire(Clock())
//  val pic_data_c1_clk              = Wire(Clock())
//  val pic_pri_c1_clk               = Wire(Clock())
//  val pic_int_c1_clk               = Wire(Clock())
//  val gw_config_c1_clk             = Wire(Clock())
//
//  withClock(pic_raddr_c1_clk) {picm_raddr_ff := RegNext(io.picm_rdaddr,0.U)}
//  withClock(pic_data_c1_clk)  {picm_waddr_ff := RegNext (io.picm_wraddr,0.U)}
//  withClock(io.active_clk)    {picm_wren_ff := RegNext(io.picm_wren,0.U)}
//  withClock(io.active_clk)    {picm_rden_ff := RegNext(io.picm_rden,0.U)}
//  withClock(io.active_clk)    {picm_mken_ff := RegNext(io.picm_mken,0.U)}
//  withClock(pic_data_c1_clk)  {picm_wr_data_ff := RegNext(io.picm_wr_data,0.U)}
//
//  val raddr_intenable_base_match     = picm_raddr_ff(31,NUM_LEVELS+2) === (INTENABLE_BASE_ADDR >>(NUM_LEVELS+2)).asUInt////   (31,NUM_LEVELS+2)
//  val raddr_intpriority_base_match   = picm_raddr_ff(31,NUM_LEVELS+2) === (INTPRIORITY_BASE_ADDR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
//  val raddr_config_gw_base_match     = picm_raddr_ff(31,NUM_LEVELS+2) === (EXT_INTR_GW_CONFIG>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
//  val raddr_config_pic_match         = picm_raddr_ff(31,0)            === (EXT_INTR_PIC_CONFIG).asUInt //(31,0)
//  val addr_intpend_base_match        = picm_raddr_ff(31,6)            === (INTPEND_BASE_ADDR>>6).asUInt
//
//  val waddr_config_pic_match         = picm_waddr_ff(31,0)            === (EXT_INTR_PIC_CONFIG).asUInt //(31,0)
//  val addr_clear_gw_base_match       = picm_waddr_ff(31,NUM_LEVELS+2) === (EXT_INTR_GW_CLEAR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
//  val waddr_intpriority_base_match   = picm_waddr_ff(31,NUM_LEVELS+2) === (INTPRIORITY_BASE_ADDR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
//  val waddr_intenable_base_match     = picm_waddr_ff(31,NUM_LEVELS+2) === (INTENABLE_BASE_ADDR>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
//  val waddr_config_gw_base_match     = picm_waddr_ff(31,NUM_LEVELS+2) === (EXT_INTR_GW_CONFIG>>NUM_LEVELS+2).asUInt//   (31,NUM_LEVELS+2)
//  val picm_bypass_ff                 = picm_rden_ff & picm_wren_ff & ( picm_raddr_ff === picm_waddr_ff)
//
//  // ---- Clock gating section ------
//  // c1 clock enables
//  val pic_raddr_c1_clken  = io.picm_mken | io.picm_rden | io.clk_override
//  val pic_data_c1_clken   = io.picm_wren | io.clk_override
//  val pic_pri_c1_clken    = (waddr_intpriority_base_match & picm_wren_ff)  | (raddr_intpriority_base_match & picm_rden_ff) | io.clk_override
//  val pic_int_c1_clken    = (waddr_intpriority_base_match & picm_wren_ff)  | (raddr_intenable_base_match & picm_rden_ff) | io.clk_override
//  val gw_config_c1_clken  = (waddr_config_gw_base_match   & picm_wren_ff)  | (raddr_config_gw_base_match   & picm_rden_ff) | io.clk_override
//
//  // C1 - 1 clock pulse for data
//  val pic_addr_c1_cgc  = Module(new rvclkhdr)
//  pic_addr_c1_cgc.io.en          := pic_raddr_c1_clken ; pic_raddr_c1_clk               := pic_addr_c1_cgc.io.l1clk
//  pic_addr_c1_cgc.io.clk         := clock              ; pic_addr_c1_cgc.io.scan_mode   := io.scan_mode
//
//  val pic_data_c1_cgc  = Module(new rvclkhdr)
//  pic_data_c1_cgc.io.en          := pic_data_c1_clken  ; pic_data_c1_clk                := pic_data_c1_cgc.io.l1clk
//  pic_data_c1_cgc.io.clk         := clock              ; pic_data_c1_cgc.io.scan_mode   := io.scan_mode
//
//  val pic_pri_c1_cgc  = Module(new rvclkhdr)
//  pic_pri_c1_cgc.io.en          := pic_pri_c1_clken   ; pic_pri_c1_clk                := pic_pri_c1_cgc.io.l1clk
//  pic_pri_c1_cgc.io.clk         := clock              ; pic_pri_c1_cgc.io.scan_mode   := io.scan_mode
//
//  val  pic_int_c1_cgc  = Module(new rvclkhdr)
//  pic_int_c1_cgc.io.en          := pic_int_c1_clken   ; pic_int_c1_clk                := pic_int_c1_cgc.io.l1clk
//  pic_int_c1_cgc.io.clk         := clock              ; pic_int_c1_cgc.io.scan_mode   := io.scan_mode
//
//  val gw_config_c1_cgc  = Module(new rvclkhdr)
//  gw_config_c1_cgc.io.en          := gw_config_c1_clken ; gw_config_c1_clk               := gw_config_c1_cgc.io.l1clk
//  gw_config_c1_cgc.io.clk         := clock              ; gw_config_c1_cgc.io.scan_mode   := io.scan_mode
//
//  // ------ end clock gating section ------------------------
//
//
//  val sync_inst  = Module(new rvsyncss(PIC_TOTAL_INT_PLUS1-1))
//  sync_inst.io.din          := io.extintsrc_req>>1
//  extintsrc_req_sync        := Cat(sync_inst.io.dout, io.extintsrc_req(0))
//  sync_inst.io.clk          := io.free_clk
//
//  io.test := extintsrc_req_sync
//  ///////////////////////////////////////////////////////////////////////
//  // Config Reg`
//  ///////////////////////////////////////////////////////////////////////
//
//  val config_reg_we  = waddr_config_pic_match & picm_wren_ff
//  val config_reg_re  = raddr_config_pic_match & picm_rden_ff
//  val config_reg_in  = picm_wr_data_ff(0)
//  withClock(io.free_clk){config_reg := RegEnable(config_reg_in,0.U,config_reg_we.asBool)}
//  val intpriord  = config_reg
//
////  ///////////////////////////////////////////////////////////
////  /// ClaimId  Reg and Corresponding PL
////  ///////////////////////////////////////////////////////////
////  val pl_in_q = Mux(intpriord.asBool,~pl_in,pl_in).asUInt
////  withClock(io.free_clk){io.claimid := RegNext(claimid_in,0.U)}
////  withClock(io.free_clk){io.pl := RegNext(pl_in_q,0.U)}
////  val meipt_inv = Mux(intpriord.asBool,!io.meipt,io.meipt)
////  val meicurpl_inv = Mux(intpriord.asBool,!io.meicurpl,io.meicurpl)
////  val mexintpend_in = ( selected_int_priority > meipt_inv) & ( selected_int_priority > meicurpl_inv)
////  withClock(io.free_clk){io.mexintpend := RegNext(mexintpend_in,0.U)}
////  val maxint = Mux(intpriord.asBool,0.U,15.U)
////  val mhwakeup_in = pl_in_q === maxint
////  withClock(io.free_clk){io.mhwakeup := RegNext(mhwakeup_in,0.U)}
////
////  //////////////////////////////////////////////////////////////////////////
////  //  Reads of register.
////  //  1- intpending
////  //////////////////////////////////////////////////////////////////////////
////  val intpend_reg_read     =  addr_intpend_base_match      & picm_rden_ff
////  val intpriority_reg_read =  raddr_intpriority_base_match & picm_rden_ff
////  val intenable_reg_read   =  raddr_intenable_base_match   & picm_rden_ff
////  val gw_config_reg_read   =  raddr_config_gw_base_match   & picm_rden_ff
////
////// val intpend_reg_extended  = Cat(INTPEND_SIZE - PIC_TOTAL_INT_PLUS1 , extintsrc_req_gw)
//////  assign intpend_reg_extended[INTPEND_SIZE-1:0]  = {{INTPEND_SIZE-pt.PIC_TOTAL_INT_PLUS1{1'b0}},extintsrc_req_gw[pt.PIC_TOTAL_INT_PLUS1-1:0]} ;
////
////   val intpend_rd_part_out = (0 until INT_GRPS).map (i=> Fill(32,intpend_reg_read & picm_raddr_ff(5,2) === i.asUInt) & intpend_reg_extended((32*i)+31,32*i)).reverse.reduce(Cat(_,_))
////   intpend_rd_out         := VecInit.tabulate(INT_GRPS)(i=>intpend_rd_part_out(i)).reverse.reduce (_|_)
////  val intenable_rd_out = (0 until PIC_TOTAL_INT_PLUS1).map (i=> if (intenable_reg_re(i)) intenable_reg(i) else 0.U)
////  val intpriority_rd_out = (0 until PIC_TOTAL_INT_PLUS1).map (i=> if (intpriority_reg_re(i)) intpriority_reg(i) else 0.U)
////  val gw_config_rd_out = (0 until PIC_TOTAL_INT_PLUS1).map (i=> if (gw_config_reg_re(i)) gw_config_reg(i) else 0.U)
////  //////////////////////////////////////////////////////////////////////////////////////////////////
////  /*
////
//// for (int i=0; i<pt.PIC_TOTAL_INT_PLUS1; i++) begin
////              if (intenable_reg_re[i]) begin
////               intenable_rd_out    =  intenable_reg[i]  ;
////              end
////              if (intpriority_reg_re[i]) begin
////               intpriority_rd_out  =  intpriority_reg[i] ;
////              end
////              if (gw_config_reg_re[i]) begin
////               gw_config_rd_out  =  gw_config_reg[i] ;
////              end
////         end
////   end
////
////
////
////   always_comb begin : INTPEND_RD
////         intpend_rd_out =  '0 ;
////         for (int i=0; i<INT_GRPS; i++) begin
////               intpend_rd_out |=  intpend_rd_part_out[i] ;
////         end
////   end
////
////
////
////
////
////
////
////
////*/
////  //////////////////////////////////////////////////////////////////////////////////////////////////////
//}
//
//object pic_main extends App{
//  println("Generate Verilog")
//  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_pic_ctrl()))
//}
