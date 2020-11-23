package lsu
import lib._
import chisel3._
import chisel3.experimental.chiselName
import chisel3.util._
import include._

@chiselName
class el2_lsu_stbuf extends Module with el2_lib with RequireAsyncReset {
  val io = IO (new Bundle {
    val lsu_c1_m_clk              = Input(Clock())
    val lsu_c1_r_clk        	    = Input(Clock())
    val lsu_stbuf_c1_clk       	  = Input(Clock())
    val lsu_free_c2_clk        	  = Input(Clock())
    val lsu_pkt_m           	    = Flipped(Valid(new el2_lsu_pkt_t))
    val lsu_pkt_r           	    = Flipped(Valid(new el2_lsu_pkt_t))
    val store_stbuf_reqvld_r	    = Input(Bool())
    val lsu_commit_r              = Input(Bool())
    val dec_lsu_valid_raw_d       = Input(Bool())
    val store_data_hi_r	   	  	  = Input(UInt(DCCM_DATA_WIDTH.W))
    val store_data_lo_r	   	  	  = Input(UInt(DCCM_DATA_WIDTH.W))
    val store_datafn_hi_r         = Input(UInt(DCCM_DATA_WIDTH.W))
    val store_datafn_lo_r	  	    = Input(UInt(DCCM_DATA_WIDTH.W))
    val lsu_stbuf_commit_any	  	= Input(Bool())
    val lsu_addr_d	   	  		    = Input(UInt(LSU_SB_BITS.W))
    val lsu_addr_m	   	  		    = Input(UInt(32.W))
    val lsu_addr_r	   	  		    = Input(UInt(32.W))
    val end_addr_d	   	  		    = Input(UInt(LSU_SB_BITS.W))
    val end_addr_m	   	  		    = Input(UInt(32.W))
    val end_addr_r	   	  		    = Input(UInt(32.W))

    val addr_in_dccm_m            = Input(Bool())
    val addr_in_dccm_r   	  	    = Input(Bool())
    val lsu_cmpen_m   	          = Input(Bool())
    val scan_mode                 = Input(Bool())

    //Outputs
    val stbuf_reqvld_any  	  	  = Output(Bool())
    val stbuf_reqvld_flushed_any  = Output(Bool())
    val stbuf_addr_any   	  	    = Output(UInt(LSU_SB_BITS.W))
    val stbuf_data_any   	  	    = Output(UInt(DCCM_DATA_WIDTH.W))
    val lsu_stbuf_full_any   	    = Output(Bool())
    val lsu_stbuf_empty_any   	  = Output(Bool())
    val ldst_stbuf_reqvld_r   	  = Output(Bool())
    val stbuf_fwddata_hi_m   	    = Output(UInt(DCCM_DATA_WIDTH.W))
    val stbuf_fwddata_lo_m   	    = Output(UInt(DCCM_DATA_WIDTH.W))
    val stbuf_fwdbyteen_hi_m   	  = Output(UInt(DCCM_BYTE_WIDTH.W))
    val stbuf_fwdbyteen_lo_m   	  = Output(UInt(DCCM_BYTE_WIDTH.W))
  })

  io.stbuf_reqvld_any 			      := 0.U
  io.stbuf_reqvld_flushed_any     := 0.U
  io.stbuf_addr_any   	          := 0.U
  io.stbuf_data_any   	          := 0.U
  io.lsu_stbuf_full_any   	  	  := 0.U
  io.lsu_stbuf_empty_any   	  	  := 0.U
  io.ldst_stbuf_reqvld_r   	  	  := 0.U
  io.stbuf_fwddata_hi_m   	  	  := 0.U
  io.stbuf_fwddata_lo_m   	  	  := 0.U
  io.stbuf_fwdbyteen_hi_m   	    := 0.U
  io.stbuf_fwdbyteen_lo_m   	    := 0.U


  val stbuf_vld                = WireInit(UInt(LSU_STBUF_DEPTH.W), init = 0.U)
  val stbuf_wr_en               = WireInit(UInt(LSU_STBUF_DEPTH.W), init = 0.U)
  val stbuf_dma_kill_en        = WireInit(UInt(LSU_STBUF_DEPTH.W), init = 0.U)
  val stbuf_dma_kill           = WireInit(UInt(LSU_STBUF_DEPTH.W), init = 0.U)
  val stbuf_reset              = WireInit(UInt(LSU_STBUF_DEPTH.W), init = 0.U)
  val store_byteen_ext_r       = WireInit(UInt(8.W), init= 0.U)
  val stbuf_addr               = Wire(Vec(LSU_STBUF_DEPTH,UInt(LSU_SB_BITS.W)))
  stbuf_addr := (0 until LSU_STBUF_DEPTH).map(i => 0.U)
  val stbuf_byteen             = Wire(Vec(LSU_STBUF_DEPTH,UInt(DCCM_BYTE_WIDTH.W)))
  stbuf_byteen := (0 until LSU_STBUF_DEPTH).map(i => 0.U)
  val stbuf_data               = Wire(Vec(LSU_STBUF_DEPTH,UInt(DCCM_DATA_WIDTH.W)))
  stbuf_data := (0 until LSU_STBUF_DEPTH).map(i => 0.U)
  val stbuf_addrin             = Wire(Vec(LSU_STBUF_DEPTH,UInt(LSU_SB_BITS.W)))
  stbuf_addrin := (0 until LSU_STBUF_DEPTH).map(i => 0.U)
  val stbuf_datain             = Wire(Vec(LSU_STBUF_DEPTH,UInt(DCCM_DATA_WIDTH.W)))
  stbuf_datain := (0 until LSU_STBUF_DEPTH).map(i => 0.U)
  val stbuf_byteenin           = Wire(Vec(LSU_STBUF_DEPTH,UInt(DCCM_BYTE_WIDTH.W)))
  stbuf_byteenin := (0 until LSU_STBUF_DEPTH).map(i => 0.U)
  val WrPtr                    = WireInit(UInt(log2Ceil(LSU_STBUF_DEPTH).W),init = 0.U)
  val RdPtr                    = WireInit(UInt(log2Ceil(LSU_STBUF_DEPTH).W),init = 0.U)
  val ldst_dual_m              = WireInit(Bool(),init = 0.U)
  val ldst_dual_r              = WireInit(Bool(),init = 0.U)
  val cmpaddr_hi_m             = WireInit(0.U(16.W))
  val stbuf_specvld_m          = WireInit(0.U(2.W))
  val stbuf_specvld_r          = WireInit(0.U(2.W))
  val cmpaddr_lo_m             = WireInit(0.U(16.W))
  val stbuf_fwdata_hi_pre_m	= WireInit(UInt(DCCM_DATA_WIDTH.W),init = 0.U)
  val stbuf_fwdata_lo_pre_m	= WireInit(UInt(DCCM_DATA_WIDTH.W),init = 0.U)
  val ld_byte_rhit_lo_lo	  	= WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_rhit_hi_lo	  	= WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_rhit_lo_hi	  	= WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_rhit_hi_hi	  	= WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_hit_lo	        = WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_rhit_lo	        = WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_hit_hi	        = WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ld_byte_rhit_hi	        = WireInit(UInt(DCCM_BYTE_WIDTH.W),init = 0.U)
  val ldst_byteen_ext_r	  	= WireInit(UInt(8.W),init = 0.U)
  val ld_fwddata_rpipe_lo	  	= WireInit(UInt(32.W),init = 0.U)
  val ld_fwddata_rpipe_hi	  	= WireInit(UInt(32.W),init = 0.U)

  //
  val datain1             = Wire(Vec(LSU_STBUF_DEPTH,UInt(8.W)))
  val datain2             = Wire(Vec(LSU_STBUF_DEPTH,UInt(8.W)))
  val datain3             = Wire(Vec(LSU_STBUF_DEPTH,UInt(8.W)))
  val datain4             = Wire(Vec(LSU_STBUF_DEPTH,UInt(8.W)))

  //////////////////////////////////////Code Start here///////////////////////////////
  val ldst_byteen_r = Mux1H(Seq(
    io.lsu_pkt_r.bits.by.asBool -> "b00000001".U,
    io.lsu_pkt_r.bits.half.asBool ->"b00000011".U,
    io.lsu_pkt_r.bits.word.asBool -> "b00001111".U,
    io.lsu_pkt_r.bits.dword.asBool -> "b11111111".U
  ))
  val ldst_dual_d = io.lsu_addr_d (2) =/= io.end_addr_d(2)
  val dual_stbuf_write_r = ldst_dual_r & io.store_stbuf_reqvld_r

  store_byteen_ext_r := ldst_byteen_r << io.lsu_addr_r(1,0)
  val store_byteen_hi_r = store_byteen_ext_r (7,4) & Fill(4, io.lsu_pkt_r.bits.store)
  val store_byteen_lo_r = store_byteen_ext_r (3,0) & Fill(4, io.lsu_pkt_r.bits.store)

  val RdPtrPlus1 = RdPtr + "b01".U
  val WrPtrPlus1 = WrPtr + "b01".U
  val WrPtrPlus2 = WrPtr + "b10".U

  io.ldst_stbuf_reqvld_r := io.lsu_commit_r & io.store_stbuf_reqvld_r

  val store_matchvec_lo_r =  (0 until LSU_STBUF_DEPTH).map(i=> (stbuf_addr(i)(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH)) === io.lsu_addr_r(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH)) &  stbuf_vld(i) & !stbuf_dma_kill(i) & !stbuf_reset(i)).asUInt).reverse.reduce(Cat(_,_))
  val store_matchvec_hi_r =  (0 until LSU_STBUF_DEPTH).map(i=> (stbuf_addr(i)(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH)) === io.end_addr_r(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH)) & stbuf_vld(i) & !stbuf_dma_kill(i) & dual_stbuf_write_r & !stbuf_reset(i)).asUInt).reverse.reduce(Cat(_,_))

  val store_coalesce_lo_r = store_matchvec_lo_r.orR
  val store_coalesce_hi_r = store_matchvec_hi_r.orR

  stbuf_wr_en := (0 until LSU_STBUF_DEPTH).map(i=> (io.ldst_stbuf_reqvld_r & (
    ((i.asUInt === WrPtr) & !store_coalesce_lo_r) |
      ((i.asUInt === WrPtr) & dual_stbuf_write_r & !store_coalesce_hi_r) |
      ((i.asUInt === WrPtrPlus1) & dual_stbuf_write_r & !(store_coalesce_lo_r | store_coalesce_hi_r)) |
      store_matchvec_lo_r(i) | store_matchvec_hi_r(i))).asUInt).reverse.reduce(Cat(_,_))
  stbuf_reset := (0 until LSU_STBUF_DEPTH).map(i=> ((io.lsu_stbuf_commit_any | io.stbuf_reqvld_flushed_any) & (i.asUInt === RdPtr).asBool).asUInt).reverse.reduce(Cat(_,_))
  val sel_lo = (0 until LSU_STBUF_DEPTH).map(i=> (((!ldst_dual_r | io.store_stbuf_reqvld_r) & (i.asUInt === WrPtr).asBool & !store_coalesce_lo_r) | store_matchvec_lo_r(i)).asUInt).reverse.reduce(Cat(_,_))

  stbuf_addrin := (0 until LSU_STBUF_DEPTH).map(i=> Mux(sel_lo(i), io.lsu_addr_r(LSU_SB_BITS-1,0), io.end_addr_r(LSU_SB_BITS-1,0)))
  stbuf_byteenin := (0 until LSU_STBUF_DEPTH).map(i=> Mux(sel_lo(i), stbuf_byteen(i) | store_byteen_lo_r, stbuf_byteen(i) | store_byteen_hi_r).asUInt)

  datain1 := (0 until LSU_STBUF_DEPTH).map(i=> Mux(sel_lo(i), Mux(!stbuf_byteen(i)(0) | store_byteen_lo_r(0), io.store_datafn_lo_r(7, 0), stbuf_data(i)(7, 0)),
    Mux(!stbuf_byteen(i)(0) | store_byteen_hi_r(0), io.store_datafn_hi_r(7, 0), stbuf_data(i)(7, 0))).asUInt)

  datain2  := (0 until LSU_STBUF_DEPTH).map(i=> Mux(sel_lo(i), Mux(!stbuf_byteen(i)(1) | store_byteen_lo_r(1), io.store_datafn_lo_r(15, 8), stbuf_data(i)(15, 8)),
    Mux(!stbuf_byteen(i)(1) | store_byteen_hi_r(1), io.store_datafn_hi_r(15, 8), stbuf_data(i)(15, 8))).asUInt)

  datain3  := (0 until LSU_STBUF_DEPTH).map(i=> Mux(sel_lo(i), Mux(!stbuf_byteen(i)(2) | store_byteen_lo_r(2), io.store_datafn_lo_r(23, 16), stbuf_data(i)(23, 16)),
    Mux(!stbuf_byteen(i)(2) | store_byteen_hi_r(2), io.store_datafn_hi_r(23, 16), stbuf_data(i)(23, 16))).asUInt)

  datain4  := (0 until LSU_STBUF_DEPTH).map(i=> Mux(sel_lo(i), Mux(!stbuf_byteen(i)(3) | store_byteen_lo_r(3), io.store_datafn_lo_r(31, 24), stbuf_data(i)(31, 24)),
    Mux(!stbuf_byteen(i)(3) | store_byteen_hi_r(3), io.store_datafn_hi_r(31, 24), stbuf_data(i)(31, 24))).asUInt)

  stbuf_datain := (0 until LSU_STBUF_DEPTH).map(i=>Cat(datain4(i), datain3(i), datain2(i), datain1(i)))



  stbuf_vld := (0 until LSU_STBUF_DEPTH).map(i=> withClock(io.lsu_free_c2_clk){ RegNext(Mux(stbuf_wr_en(i).asBool(),1.U ,stbuf_vld(i)) & !stbuf_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  stbuf_dma_kill := (0 until LSU_STBUF_DEPTH).map(i=> withClock(io.lsu_free_c2_clk){RegNext(Mux(stbuf_dma_kill_en(i).asBool,1.U ,stbuf_dma_kill(i)) & !stbuf_reset(i), 0.U)}).reverse.reduce(Cat(_,_))
  stbuf_byteen := (0 until LSU_STBUF_DEPTH).map(i=> withClock(io.lsu_stbuf_c1_clk){ RegNext(Mux(stbuf_wr_en(i).asBool(),stbuf_byteenin(i) , stbuf_byteen(i)) & Fill(stbuf_byteenin(i).getWidth , !stbuf_reset(i)), 0.U)})
  for (i<- 0 until LSU_STBUF_DEPTH) {
    stbuf_addr(i) := rvdffe(stbuf_addrin(i),stbuf_wr_en(i).asBool(),clock,io.scan_mode)
    stbuf_data(i) := rvdffe(stbuf_datain(i),stbuf_wr_en(i).asBool(),clock,io.scan_mode)
  }
  withClock(io.lsu_c1_m_clk){ldst_dual_m := RegNext(ldst_dual_d,0.U)}
  withClock(io.lsu_c1_r_clk){ldst_dual_r := RegNext(ldst_dual_m,0.U)}

  // Store Buffer drain logic
  io.stbuf_reqvld_flushed_any := stbuf_vld(RdPtr) & stbuf_dma_kill(RdPtr)
  io.stbuf_reqvld_any  := stbuf_vld(RdPtr) & !stbuf_dma_kill(RdPtr) & !(stbuf_dma_kill_en.orR)
  io.stbuf_addr_any  := stbuf_addr(RdPtr)
  io.stbuf_data_any  := stbuf_data(RdPtr)

  val WrPtrEn = ((io.ldst_stbuf_reqvld_r & !dual_stbuf_write_r & !(store_coalesce_hi_r | store_coalesce_lo_r))  |
    (io.ldst_stbuf_reqvld_r  &  dual_stbuf_write_r & !(store_coalesce_hi_r & store_coalesce_lo_r))).asBool
  val NxtWrPtr = Mux((io.ldst_stbuf_reqvld_r & dual_stbuf_write_r & !(store_coalesce_hi_r | store_coalesce_lo_r)).asBool, WrPtrPlus2, WrPtrPlus1)
  val RdPtrEn  = io.lsu_stbuf_commit_any | io.stbuf_reqvld_flushed_any
  val NxtRdPtr = RdPtrPlus1

  withClock(io.lsu_stbuf_c1_clk){ WrPtr := RegEnable(NxtWrPtr, 0.U, WrPtrEn)}
  withClock(io.lsu_stbuf_c1_clk){ RdPtr := RegEnable(NxtRdPtr, 0.U, RdPtrEn)}

  val stbuf_numvld_any = VecInit.tabulate(LSU_STBUF_DEPTH)(i=>Cat(0.U(3.W), stbuf_vld(i))).reduce (_+_)
  val isdccmst_m = io.lsu_pkt_m.valid & io.lsu_pkt_m.bits.store & io.addr_in_dccm_m & !io.lsu_pkt_m.bits.dma
  val isdccmst_r = io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & io.addr_in_dccm_r & !io.lsu_pkt_r.bits.dma

  stbuf_specvld_m := Cat(0.U(1.W),isdccmst_m) << (isdccmst_m & ldst_dual_m)
  stbuf_specvld_r := Cat(0.U(1.W),isdccmst_r) << (isdccmst_r & ldst_dual_r)
  val stbuf_specvld_any = stbuf_numvld_any +  Cat(0.U(2.W), stbuf_specvld_m) + Cat(0.U(2.W), stbuf_specvld_r)

  io.lsu_stbuf_full_any  := Mux((!ldst_dual_d & io.dec_lsu_valid_raw_d).asBool,(stbuf_specvld_any >= LSU_STBUF_DEPTH.U),(stbuf_specvld_any >= (LSU_STBUF_DEPTH-1).U))
  io.lsu_stbuf_empty_any := stbuf_numvld_any === 0.U

  val cmpen_hi_m  = io.lsu_cmpen_m & ldst_dual_m
  cmpaddr_hi_m := io.end_addr_m(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH))

  val cmpen_lo_m = io.lsu_cmpen_m
  cmpaddr_lo_m  := io.lsu_addr_m(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH))


  val stbuf_match_hi = (0 until LSU_STBUF_DEPTH).map(i=> ((stbuf_addr(i)(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH)) === cmpaddr_hi_m(13,0)) & stbuf_vld(i) & !stbuf_dma_kill(i) & io.addr_in_dccm_m).asUInt).reverse.reduce(Cat(_,_))
  val stbuf_match_lo = (0 until LSU_STBUF_DEPTH).map(i=> ((stbuf_addr(i)(LSU_SB_BITS-1,log2Ceil(DCCM_BYTE_WIDTH)) === cmpaddr_lo_m(13,0)) & stbuf_vld(i) & !stbuf_dma_kill(i) & io.addr_in_dccm_m).asUInt).reverse.reduce(Cat(_,_))
  stbuf_dma_kill_en := (0 until LSU_STBUF_DEPTH).map(i=> ((stbuf_match_hi(i) | stbuf_match_lo(i)) & io.lsu_pkt_m.valid & io.lsu_pkt_m.bits.dma & io.lsu_pkt_m.bits.store).asUInt).reverse.reduce(Cat(_,_))


  val stbuf_fwdbyteenvec_hi = (0 until LSU_STBUF_DEPTH).map(i=>(0 until DCCM_BYTE_WIDTH).map(j=> stbuf_match_hi(i) & stbuf_byteen(i)(j) & stbuf_vld(i).asUInt()))
  val stbuf_fwdbyteenvec_lo = (0 until LSU_STBUF_DEPTH).map(i=>(0 until DCCM_BYTE_WIDTH).map(j=> stbuf_match_lo(i) & stbuf_byteen(i)(j) & stbuf_vld(i).asUInt()))
  val stbuf_fwdbyteen_hi_pre_m = (0 until LSU_STBUF_DEPTH).map(j=>(0 until DCCM_BYTE_WIDTH).map(i=> stbuf_fwdbyteenvec_hi(i)(j).asUInt()).reduce(_|_))
  val stbuf_fwdbyteen_lo_pre_m = (0 until LSU_STBUF_DEPTH).map(j=>(0 until DCCM_BYTE_WIDTH).map(i=> stbuf_fwdbyteenvec_lo(i)(j).asUInt()).reduce(_|_))

  val stbuf_fwddata_hi_pre_m = VecInit.tabulate(LSU_STBUF_DEPTH)(i=> Fill(32,stbuf_match_hi(i)) & stbuf_data(i)).reverse.reduce(_|_)
  val stbuf_fwddata_lo_pre_m = VecInit.tabulate(LSU_STBUF_DEPTH)(i=> Fill(32,stbuf_match_lo(i)) & stbuf_data(i)).reverse.reduce(_|_)


  ldst_byteen_ext_r := ldst_byteen_r << io.lsu_addr_r(1,0)
  val ldst_byteen_hi_r = ldst_byteen_ext_r(7,4)
  val ldst_byteen_lo_r = ldst_byteen_ext_r(3,0)

  val ld_addr_rhit_lo_lo = (io.lsu_addr_m(31,2) === io.lsu_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & !io.lsu_pkt_r.bits.dma
  val ld_addr_rhit_lo_hi = (io.end_addr_m(31,2) === io.lsu_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & !io.lsu_pkt_r.bits.dma
  val ld_addr_rhit_hi_lo = (io.lsu_addr_m(31,2) === io.end_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & !io.lsu_pkt_r.bits.dma & dual_stbuf_write_r
  val ld_addr_rhit_hi_hi = (io.end_addr_m(31,2) === io.end_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & !io.lsu_pkt_r.bits.dma & dual_stbuf_write_r

  ld_byte_rhit_lo_lo := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_addr_rhit_lo_lo & ldst_byteen_lo_r(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_lo_hi := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_addr_rhit_lo_hi & ldst_byteen_lo_r(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_hi_lo := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_addr_rhit_hi_lo & ldst_byteen_hi_r(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_hi_hi := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_addr_rhit_hi_hi & ldst_byteen_hi_r(i)).asUInt).reverse.reduce(Cat(_,_))

  ld_byte_rhit_lo := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_byte_rhit_lo_lo(i) | ld_byte_rhit_hi_lo(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_hi := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_byte_rhit_lo_hi(i) | ld_byte_rhit_hi_hi(i)).asUInt).reverse.reduce(Cat(_,_))

  val fwdpipe1_lo = (Fill(8, ld_byte_rhit_lo_lo(0)) & io.store_data_lo_r(7,0)) | (Fill(8, ld_byte_rhit_hi_lo(0)) & io.store_data_hi_r(7,0))
  val fwdpipe2_lo = (Fill(8, ld_byte_rhit_lo_lo(1)) & io.store_data_lo_r(15,8)) | (Fill(8, ld_byte_rhit_hi_lo(1)) & io.store_data_hi_r(15,8))
  val fwdpipe3_lo = (Fill(8, ld_byte_rhit_lo_lo(2)) & io.store_data_lo_r(23,16)) | (Fill(8, ld_byte_rhit_hi_lo(2)) & io.store_data_hi_r(23,16))
  val fwdpipe4_lo = (Fill(8, ld_byte_rhit_lo_lo(3)) & io.store_data_lo_r(31,24)) | (Fill(8, ld_byte_rhit_hi_lo(3)) & io.store_data_hi_r(31,24))
  ld_fwddata_rpipe_lo := Cat(fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo)

  val fwdpipe1_hi = (Fill(8, ld_byte_rhit_lo_hi(0)) & io.store_data_lo_r(7,0)) | (Fill(8, ld_byte_rhit_hi_hi(0)) & io.store_data_hi_r(7,0))
  val fwdpipe2_hi = (Fill(8, ld_byte_rhit_lo_hi(1)) & io.store_data_lo_r(15,8)) | (Fill(8, ld_byte_rhit_hi_hi(1)) & io.store_data_hi_r(15,8))
  val fwdpipe3_hi = (Fill(8, ld_byte_rhit_lo_hi(2)) & io.store_data_lo_r(23,16)) | (Fill(8, ld_byte_rhit_hi_hi(2)) & io.store_data_hi_r(23,16))
  val fwdpipe4_hi = (Fill(8, ld_byte_rhit_lo_hi(3)) & io.store_data_lo_r(31,24)) | (Fill(8, ld_byte_rhit_hi_hi(3)) & io.store_data_hi_r(31,24))
  ld_fwddata_rpipe_hi := Cat(fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi)

  ld_byte_hit_lo := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_byte_rhit_lo_lo(i) | ld_byte_rhit_hi_lo(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_hit_hi := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_byte_rhit_lo_hi(i) | ld_byte_rhit_hi_hi(i)).asUInt).reverse.reduce(Cat(_,_))

  io.stbuf_fwdbyteen_hi_m := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_byte_hit_hi(i) | stbuf_fwdbyteen_hi_pre_m(i)).asUInt).reverse.reduce(Cat(_,_))
  io.stbuf_fwdbyteen_lo_m := (0 until DCCM_BYTE_WIDTH).map(i=> (ld_byte_hit_lo(i) | stbuf_fwdbyteen_lo_pre_m(i)).asUInt).reverse.reduce(Cat(_,_))

  // Pipe vs Store Queue priority
  val stbuf_fwdpipe1_lo = Mux(ld_byte_rhit_lo(0),ld_fwddata_rpipe_lo(7,0),stbuf_fwddata_lo_pre_m(7,0))
  val stbuf_fwdpipe2_lo = Mux(ld_byte_rhit_lo(1),ld_fwddata_rpipe_lo(15,8),stbuf_fwddata_lo_pre_m(15,8))
  val stbuf_fwdpipe3_lo = Mux(ld_byte_rhit_lo(2),ld_fwddata_rpipe_lo(23,16),stbuf_fwddata_lo_pre_m(23,16))
  val stbuf_fwdpipe4_lo = Mux(ld_byte_rhit_lo(3),ld_fwddata_rpipe_lo(31,24),stbuf_fwddata_lo_pre_m(31,24))
  io.stbuf_fwddata_lo_m := Cat(stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo,stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo)
  // Pipe vs Store Queue priority
  val stbuf_fwdpipe1_hi = Mux(ld_byte_rhit_hi(0),ld_fwddata_rpipe_hi(7,0),stbuf_fwddata_hi_pre_m(7,0))
  val stbuf_fwdpipe2_hi = Mux(ld_byte_rhit_hi(1),ld_fwddata_rpipe_hi(15,8),stbuf_fwddata_hi_pre_m(15,8))
  val stbuf_fwdpipe3_hi = Mux(ld_byte_rhit_hi(2),ld_fwddata_rpipe_hi(23,16),stbuf_fwddata_hi_pre_m(23,16))
  val stbuf_fwdpipe4_hi = Mux(ld_byte_rhit_hi(3),ld_fwddata_rpipe_hi(31,24),stbuf_fwddata_hi_pre_m(31,24))
  io.stbuf_fwddata_hi_m := Cat(stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi,stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi)



}
object stbmain extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_lsu_stbuf()))
}
