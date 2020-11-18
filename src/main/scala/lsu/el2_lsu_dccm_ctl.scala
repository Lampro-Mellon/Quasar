package lsu
import include._
import lib._
import chisel3._
import chisel3.util._



import chisel3.experimental.chiselName
@chiselName
class  el2_lsu_dccm_ctl extends Module with RequireAsyncReset with el2_lib
{
  val io = IO(new Bundle{
    //val rst_l = IO(Input(1.W)) //implicit
    val lsu_c2_m_clk         = Input(Clock())
    val lsu_c2_r_clk         = Input(Clock())
    val lsu_free_c2_clk      = Input(Clock())  //tbd
    val lsu_c1_r_clk         = Input(Clock())
    val lsu_store_c1_r_clk   = Input(Clock())
    // val clk                  = Input(Clock())   //tbd

    val lsu_pkt_d            = Input(new el2_lsu_pkt_t())
    val lsu_pkt_m            = Input(new el2_lsu_pkt_t())
    val lsu_pkt_r            = Input(new el2_lsu_pkt_t())

    val addr_in_dccm_d       = Input(UInt(1.W))
    val addr_in_dccm_m       = Input(UInt(1.W))
    val addr_in_dccm_r       = Input(UInt(1.W))
    val addr_in_pic_d        = Input(UInt(1.W))
    val addr_in_pic_m        = Input(UInt(1.W))
    val addr_in_pic_r        = Input(UInt(1.W))

    val lsu_raw_fwd_lo_r     = Input(UInt(1.W))
    val lsu_raw_fwd_hi_r     = Input(UInt(1.W))
    val lsu_commit_r         = Input(UInt(1.W))

    // lsu address down the pipe
    val lsu_addr_d           = Input(UInt(32.W))//verify bits
    val lsu_addr_m           = Input(UInt(DCCM_BITS.W))
    val lsu_addr_r           = Input(UInt(32.W))

    // lsu address down the pipe - needed to check unaligned
    val end_addr_d           = Input(UInt(DCCM_BITS.W))
    val end_addr_m           = Input(UInt(DCCM_BITS.W))
    val end_addr_r           = Input(UInt(DCCM_BITS.W))

    val stbuf_reqvld_any     = Input(UInt(1.W))
    val stbuf_addr_any       = Input(UInt(LSU_SB_BITS.W))
    val stbuf_data_any       = Input(UInt(DCCM_DATA_WIDTH.W))
    val stbuf_ecc_any        = Input(UInt(DCCM_ECC_WIDTH.W))
    val stbuf_fwddata_hi_m   = Input(UInt(DCCM_DATA_WIDTH.W))
    val stbuf_fwddata_lo_m   = Input(UInt(DCCM_DATA_WIDTH.W))
    val stbuf_fwdbyteen_lo_m = Input(UInt(DCCM_BYTE_WIDTH.W))
    val stbuf_fwdbyteen_hi_m = Input(UInt(DCCM_BYTE_WIDTH.W))
    val dccm_rdata_hi_r      = Output(UInt(DCCM_DATA_WIDTH.W))
    val dccm_rdata_lo_r      = Output(UInt(DCCM_DATA_WIDTH.W))
    val dccm_data_ecc_hi_r   = Output(UInt(DCCM_ECC_WIDTH.W))
    val dccm_data_ecc_lo_r   = Output(UInt(DCCM_ECC_WIDTH.W))
    val lsu_ld_data_r        = Output(UInt(DCCM_DATA_WIDTH.W))
    val lsu_ld_data_corr_r   = Output(UInt(DCCM_DATA_WIDTH.W))
    val lsu_double_ecc_error_r = Input(UInt(1.W))
    val single_ecc_error_hi_r  = Input(UInt(1.W))
    val single_ecc_error_lo_r  = Input(UInt(1.W))
    val sec_data_hi_r          = Input(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_lo_r          = Input(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_hi_r_ff       = Input(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_lo_r_ff       = Input(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_ecc_hi_r_ff   = Input(UInt(DCCM_ECC_WIDTH.W))
    val sec_data_ecc_lo_r_ff   = Input(UInt(DCCM_ECC_WIDTH.W))
    val dccm_rdata_hi_m        = Output(UInt(DCCM_DATA_WIDTH.W))
    val dccm_rdata_lo_m        = Output(UInt(DCCM_DATA_WIDTH.W))
    val dccm_data_ecc_hi_m     = Output(UInt(DCCM_ECC_WIDTH.W))
    val dccm_data_ecc_lo_m     = Output(UInt(DCCM_ECC_WIDTH.W))
    val lsu_ld_data_m          = Output(UInt(DCCM_DATA_WIDTH.W))
    val lsu_double_ecc_error_m = Input(UInt(1.W))
    val sec_data_hi_m          = Input(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_lo_m          = Input(UInt(DCCM_DATA_WIDTH.W))
    val store_data_m           = Input(UInt(32.W))
    val dma_dccm_wen           = Input(UInt(1.W))
    val dma_pic_wen            = Input(UInt(1.W))
    val dma_mem_tag_m          = Input(UInt(3.W))
    val dma_mem_addr           = Input(UInt(32.W))
    val dma_mem_wdata          = Input(UInt(64.W))
    val dma_dccm_wdata_lo      = Input(UInt(32.W))
    val dma_dccm_wdata_hi      = Input(UInt(32.W))
    val dma_dccm_wdata_ecc_hi  = Input(UInt(DCCM_ECC_WIDTH.W))
    val dma_dccm_wdata_ecc_lo  = Input(UInt(DCCM_ECC_WIDTH.W))
    val store_data_hi_r        = Output(UInt(DCCM_DATA_WIDTH.W))
    val store_data_lo_r        = Output(UInt(DCCM_DATA_WIDTH.W))
    val store_datafn_hi_r      = Output(UInt(DCCM_DATA_WIDTH.W))
    val store_datafn_lo_r      = Output(UInt(DCCM_DATA_WIDTH.W))
    val store_data_r           = Output(UInt(32.W))
    val ld_single_ecc_error_r    = Output(UInt(1.W))
    val ld_single_ecc_error_r_ff = Output(UInt(1.W))
    val picm_mask_data_m       = Output(UInt(32.W))
    val lsu_stbuf_commit_any   = Output(UInt(1.W))
    val lsu_dccm_rden_m        = Output(UInt(1.W))
    val lsu_dccm_rden_r        = Output(UInt(1.W))
    val dccm_dma_rvalid        = Output(UInt(1.W))
    val dccm_dma_ecc_error     = Output(UInt(1.W))
    val dccm_dma_rtag          = Output(UInt(3.W))
    val dccm_dma_rdata         = Output(UInt(64.W))
    val dccm_wren              = Output(UInt(1.W))
    val dccm_rden              = Output(UInt(1.W))
    val dccm_wr_addr_lo        = Output(UInt(DCCM_BITS.W))
    val dccm_wr_data_lo        = Output(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_rd_addr_lo        = Output(UInt(DCCM_BITS.W))
    val dccm_rd_data_lo        = Input(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_wr_addr_hi        = Output(UInt(DCCM_BITS.W))
    val dccm_wr_data_hi        = Output(UInt(DCCM_FDATA_WIDTH.W))
    val dccm_rd_addr_hi        = Output(UInt(DCCM_BITS.W))
    val dccm_rd_data_hi        = Input(UInt(DCCM_FDATA_WIDTH.W))
    val picm_wren              = Output(UInt(1.W))
    val picm_rden              = Output(UInt(1.W))
    val picm_mken              = Output(UInt(1.W))
    val picm_rdaddr            = Output(UInt(32.W))
    val picm_wraddr            = Output(UInt(32.W))
    val picm_wr_data           = Output(UInt(32.W))
    val picm_rd_data           = Input(UInt(32.W))
    val scan_mode              = Input(UInt(1.W))
  })
  val picm_rd_data_m     = Cat(io.picm_rd_data,io.picm_rd_data) //used in both if and else
  val dccm_rdata_corr_r  = Cat(io.sec_data_hi_r,io.sec_data_lo_r)
  val dccm_rdata_corr_m  = Cat(io.sec_data_hi_m,io.sec_data_lo_m)
  val dccm_rdata_r       = Cat(io.dccm_rdata_hi_r,io.dccm_rdata_lo_r)
  val dccm_rdata_m       = Cat(io.dccm_rdata_hi_m,io.dccm_rdata_lo_m)
  val lsu_rdata_r        = WireInit(UInt(64.W),0.U)
  val lsu_rdata_m        = WireInit(UInt(64.W),0.U)
  val lsu_rdata_corr_r   = WireInit(UInt(64.W),0.U)
  val lsu_rdata_corr_m   = WireInit(UInt(64.W),0.U)
  val stbuf_fwddata_r    = WireInit(UInt(64.W),0.U)
  val stbuf_fwdbyteen_r  = WireInit(UInt(64.W),0.U)
  val picm_rd_data_r_32  = WireInit(UInt(32.W),0.U)
  val picm_rd_data_r     = WireInit(UInt(64.W),0.U)
  val lsu_ld_data_corr_m = WireInit(UInt(64.W),0.U)


  //Forwarding stbuf
  if (LOAD_TO_USE_PLUS1 == 1){
    io.dccm_dma_rvalid    := io.lsu_pkt_r.valid & io.lsu_pkt_r.load & io.lsu_pkt_r.dma
    io.dccm_dma_ecc_error := io.lsu_double_ecc_error_r //from ecc
    io.dccm_dma_rdata     := lsu_rdata_corr_r
    //Registers
    io.dccm_rdata_hi_r    := rvdffe(io.dccm_rdata_hi_m,io.lsu_dccm_rden_m.asBool,clock,io.scan_mode.asBool)
    io.dccm_rdata_lo_r    := rvdffe(io.dccm_rdata_lo_m,io.lsu_dccm_rden_m.asBool,clock,io.scan_mode.asBool)
    io.dccm_data_ecc_hi_r := rvdffe(io.dccm_data_ecc_hi_m,io.lsu_dccm_rden_m.asBool,clock,io.scan_mode.asBool)
    io.dccm_data_ecc_lo_r := rvdffe(io.dccm_data_ecc_lo_m,io.lsu_dccm_rden_m.asBool,clock,io.scan_mode.asBool)
    stbuf_fwdbyteen_r     := withClock(io.lsu_c2_r_clk){RegNext(Cat(io.stbuf_fwdbyteen_hi_m,io.stbuf_fwdbyteen_lo_m),0.U)}
    stbuf_fwddata_r       := withClock(io.lsu_c2_r_clk){RegNext(Cat(io.stbuf_fwddata_hi_m  ,io.stbuf_fwddata_lo_m  ),0.U)}
    picm_rd_data_r_32     := withClock(io.lsu_c2_r_clk){RegNext(picm_rd_data_m(31,0),0.U)}
    picm_rd_data_r        := Cat(picm_rd_data_r_32,picm_rd_data_r_32)
    io.dccm_dma_rtag      := withClock(io.lsu_c1_r_clk){RegNext(io.dma_mem_tag_m,0.U)}

    lsu_rdata_corr_r      := Reverse(Cat(VecInit.tabulate(8)(i=> Reverse(Mux(stbuf_fwdbyteen_r(i).asBool,stbuf_fwddata_r((8*i)+7,8*i),Mux(io.addr_in_pic_r.asBool,picm_rd_data_r((8*i)+7,8*i),dccm_rdata_corr_r((8*i)+7,8*i)))))))
    lsu_rdata_r           := Reverse(Cat(VecInit.tabulate(8)(i=> Reverse(Mux(stbuf_fwdbyteen_r(i).asBool,stbuf_fwddata_r((8*i)+7,8*i),Mux(io.addr_in_pic_r.asBool,picm_rd_data_r((8*i)+7,8*i),dccm_rdata_r((8*i)+7,8*i)))))))
    io.lsu_ld_data_r      := lsu_rdata_r>> 8.U*io.lsu_addr_r(1,0)
    io.lsu_ld_data_corr_r := lsu_rdata_corr_r >> 8.U*io.lsu_addr_r(1,0)
  }

  else{
    io.dccm_dma_rvalid     := io.lsu_pkt_m.valid & io.lsu_pkt_m.load & io.lsu_pkt_m.dma
    io.dccm_dma_ecc_error  := io.lsu_double_ecc_error_m //from ecc
    io.dccm_dma_rdata      := lsu_rdata_corr_m
    io.dccm_dma_rtag       := io.dma_mem_tag_m
    io.dccm_rdata_lo_r     := 0.U
    io.dccm_rdata_hi_r     := 0.U
    io.dccm_data_ecc_hi_r  := 0.U
    io.dccm_data_ecc_lo_r  := 0.U
    io.lsu_ld_data_r       := 0.U
    //Registers
    io.lsu_ld_data_corr_r  := withClock(io.lsu_c2_r_clk){RegNext(lsu_ld_data_corr_m,0.U)}
    lsu_rdata_corr_m       := Reverse(Cat(VecInit.tabulate(8)(i=> Reverse(Mux(((Cat(io.stbuf_fwdbyteen_hi_m,io.stbuf_fwdbyteen_lo_m))(i)).asBool,(Cat(io.stbuf_fwddata_hi_m,io.stbuf_fwddata_lo_m))((8*i)+7,8*i),Mux(io.addr_in_pic_m.asBool,picm_rd_data_m((8*i)+7,8*i),dccm_rdata_corr_m((8*i)+7,8*i)))))))
    lsu_rdata_m            := Reverse(Cat(VecInit.tabulate(8)(i=> Reverse(Mux(((Cat(io.stbuf_fwdbyteen_hi_m,io.stbuf_fwdbyteen_lo_m))(i)).asBool,(Cat(io.stbuf_fwddata_hi_m,io.stbuf_fwddata_lo_m))((8*i)+7,8*i),Mux(io.addr_in_pic_m.asBool,picm_rd_data_m((8*i)+7,8*i),dccm_rdata_m((8*i)+7,8*i)))))))
    io.lsu_ld_data_m       := lsu_rdata_m >> 8.U*io.lsu_addr_m(1,0)
    lsu_ld_data_corr_m     := lsu_rdata_corr_m >> 8.U*io.lsu_addr_m(1,0)
  }

  //Ecc error kill
  val kill_ecc_corr_lo_r = (((io.lsu_addr_d(DCCM_BITS-1,2) === io.lsu_addr_r(DCCM_BITS-1,2)).asUInt | (io.end_addr_d(DCCM_BITS-1,2) === io.lsu_addr_r(DCCM_BITS-1,2)).asUInt) & io.lsu_pkt_d.valid & io.lsu_pkt_d.store & io.lsu_pkt_d.dma & io.addr_in_dccm_d) |
    (((io.lsu_addr_m(DCCM_BITS-1,2) === io.lsu_addr_r(DCCM_BITS-1,2)).asUInt | (io.end_addr_m(DCCM_BITS-1,2) === io.lsu_addr_r(DCCM_BITS-1,2)).asUInt) & io.lsu_pkt_m.valid & io.lsu_pkt_m.store & io.lsu_pkt_m.dma & io.addr_in_dccm_m)

  val kill_ecc_corr_hi_r = (((io.lsu_addr_d(DCCM_BITS-1,2) === io.end_addr_r(DCCM_BITS-1,2)).asUInt | (io.end_addr_d(DCCM_BITS-1,2) === io.end_addr_r(DCCM_BITS-1,2)).asUInt) & io.lsu_pkt_d.valid & io.lsu_pkt_d.store & io.lsu_pkt_d.dma & io.addr_in_dccm_d) |
    (((io.lsu_addr_m(DCCM_BITS-1,2) === io.end_addr_r(DCCM_BITS-1,2)).asUInt | (io.end_addr_m(DCCM_BITS-1,2) === io.end_addr_r(DCCM_BITS-1,2)).asUInt) & io.lsu_pkt_m.valid & io.lsu_pkt_m.store & io.lsu_pkt_m.dma & io.addr_in_dccm_m)

  val ld_single_ecc_error_lo_r    = io.lsu_pkt_r.load & io.single_ecc_error_lo_r & !io.lsu_raw_fwd_lo_r
  val ld_single_ecc_error_hi_r    = io.lsu_pkt_r.load & io.single_ecc_error_hi_r & !io.lsu_raw_fwd_hi_r
  io.ld_single_ecc_error_r       := (ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r) & !io.lsu_double_ecc_error_r
  val ld_single_ecc_error_lo_r_ns = ld_single_ecc_error_lo_r & (io.lsu_commit_r | io.lsu_pkt_r.dma) & !kill_ecc_corr_lo_r
  val ld_single_ecc_error_hi_r_ns = ld_single_ecc_error_hi_r & (io.lsu_commit_r | io.lsu_pkt_r.dma) & !kill_ecc_corr_hi_r

  val lsu_double_ecc_error_r_ff   = withClock(io.lsu_free_c2_clk){RegNext(io.lsu_double_ecc_error_r,0.U)}
  val ld_single_ecc_error_hi_r_ff = withClock(io.lsu_free_c2_clk){RegNext(ld_single_ecc_error_hi_r_ns,0.U)}
  val ld_single_ecc_error_lo_r_ff = withClock(io.lsu_free_c2_clk){RegNext(ld_single_ecc_error_lo_r_ns,0.U)}

  val ld_sec_addr_hi_r_ff = rvdffe(io.end_addr_r(DCCM_BITS-1,0),io.ld_single_ecc_error_r.asBool,clock,io.scan_mode.asBool)
  val ld_sec_addr_lo_r_ff = rvdffe(io.lsu_addr_r(DCCM_BITS-1,0),io.ld_single_ecc_error_r.asBool,clock,io.scan_mode.asBool)
  val lsu_dccm_rden_d = io.lsu_pkt_d.valid & (io.lsu_pkt_d.load | (io.lsu_pkt_d.store & (!(io.lsu_pkt_d.word | io.lsu_pkt_d.dword) | (io.lsu_addr_d(1,0) =/= 0.U(2.W))))) & io.addr_in_dccm_d
  val lsu_dccm_wren_d = io.dma_dccm_wen

  io.ld_single_ecc_error_r_ff := (ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff) & !lsu_double_ecc_error_r_ff
  io.lsu_stbuf_commit_any     := io.stbuf_reqvld_any & (!(lsu_dccm_rden_d | lsu_dccm_wren_d | io.ld_single_ecc_error_r_ff) |
    (lsu_dccm_rden_d & !((io.stbuf_addr_any(DCCM_WIDTH_BITS+DCCM_BANK_BITS-1,DCCM_WIDTH_BITS) === io.lsu_addr_d(DCCM_WIDTH_BITS+DCCM_BANK_BITS-1,DCCM_WIDTH_BITS)).asUInt |
      (io.stbuf_addr_any(DCCM_WIDTH_BITS+DCCM_BANK_BITS-1,DCCM_WIDTH_BITS) === io.end_addr_d(DCCM_WIDTH_BITS+DCCM_BANK_BITS-1,DCCM_WIDTH_BITS)).asUInt)))


  //DCCM inputs
  io.dccm_wren       := lsu_dccm_wren_d | io.lsu_stbuf_commit_any | io.ld_single_ecc_error_r_ff
  io.dccm_rden       := lsu_dccm_rden_d & io.addr_in_dccm_d

  io.dccm_wr_addr_lo := Mux(io.ld_single_ecc_error_r_ff.asBool,
    Mux(ld_single_ecc_error_lo_r_ff===1.U,ld_sec_addr_lo_r_ff(DCCM_BITS-1,0),ld_sec_addr_hi_r_ff(DCCM_BITS-1,0)),
    Mux(lsu_dccm_wren_d.asBool,io.lsu_addr_d(DCCM_BITS-1,0),io.stbuf_addr_any(DCCM_BITS-1,0)))

  io.dccm_wr_addr_hi := Mux(io.ld_single_ecc_error_r_ff.asBool,
    Mux(ld_single_ecc_error_hi_r_ff===1.U, ld_sec_addr_hi_r_ff(DCCM_BITS-1,0), ld_sec_addr_lo_r_ff(DCCM_BITS-1,0)),
    Mux(lsu_dccm_wren_d.asBool, io.end_addr_d(DCCM_BITS-1,0),io.stbuf_addr_any(DCCM_BITS-1,0)))

  io.dccm_rd_addr_lo := io.lsu_addr_d(DCCM_BITS-1,0)
  io.dccm_rd_addr_hi := io.end_addr_d(DCCM_BITS-1,0)

  io.dccm_wr_data_lo := Mux(io.ld_single_ecc_error_r_ff.asBool,
    Mux(ld_single_ecc_error_lo_r_ff===1.U,Cat(io.sec_data_ecc_lo_r_ff(DCCM_ECC_WIDTH-1,0),io.sec_data_lo_r_ff(DCCM_DATA_WIDTH-1,0))  ,
      Cat(io.sec_data_ecc_hi_r_ff(DCCM_ECC_WIDTH-1,0),io.sec_data_hi_r_ff(DCCM_DATA_WIDTH-1,0))) ,
    Mux(io.dma_dccm_wen.asBool,Cat(io.dma_dccm_wdata_ecc_lo(DCCM_ECC_WIDTH-1,0),io.dma_dccm_wdata_lo(DCCM_DATA_WIDTH-1,0)),
      Cat(io.stbuf_ecc_any(DCCM_ECC_WIDTH-1,0),io.stbuf_data_any(DCCM_DATA_WIDTH-1,0))))

  io.dccm_wr_data_hi := Mux(io.ld_single_ecc_error_r_ff.asBool,
    Mux(ld_single_ecc_error_hi_r_ff===1.U, Cat(io.sec_data_ecc_hi_r_ff(DCCM_ECC_WIDTH-1,0),io.sec_data_hi_r_ff(DCCM_DATA_WIDTH-1,0)),
      Cat(io.sec_data_ecc_lo_r_ff(DCCM_ECC_WIDTH-1,0),io.sec_data_lo_r_ff(DCCM_DATA_WIDTH-1,0))),
    Mux(io.dma_dccm_wen.asBool, Cat(io.dma_dccm_wdata_ecc_hi(DCCM_ECC_WIDTH-1,0),io.dma_dccm_wdata_hi(DCCM_DATA_WIDTH-1,0)),
      Cat(io.stbuf_ecc_any(DCCM_ECC_WIDTH-1,0),io.stbuf_data_any(DCCM_DATA_WIDTH-1,0))))
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // DCCM outputs
  val store_byteen_m = (Fill(4,io.lsu_pkt_m.store)) & ((Fill(4,io.lsu_pkt_m.by)    & 1.U(4.W))  |
    (Fill(4,io.lsu_pkt_m.half)  & 3.U(4.W))  |
    (Fill(4,io.lsu_pkt_m.word)  & 15.U(4.W)))

  val store_byteen_r = (Fill(4,io.lsu_pkt_r.store)) & ((Fill(4,io.lsu_pkt_r.by)    & 1.U(4.W))  |
    (Fill(4,io.lsu_pkt_r.half)  & 3.U(4.W))  |
    (Fill(4,io.lsu_pkt_r.word)  & 15.U(4.W)))
  val store_byteen_ext_m = WireInit(UInt(8.W),0.U)
  store_byteen_ext_m := store_byteen_m(3,0) << io.lsu_addr_m(1,0)      // The packet in m
  val store_byteen_ext_r = WireInit(UInt(8.W),0.U)
  store_byteen_ext_r := store_byteen_r(3,0) << io.lsu_addr_r(1,0)

  //LM: If store buffer addr matches with the address in the m-stage then there will be bypassed
  val dccm_wr_bypass_d_m_lo   = (io.stbuf_addr_any(DCCM_BITS-1,2) === io.lsu_addr_m(DCCM_BITS-1,2)) & io.addr_in_dccm_m
  val dccm_wr_bypass_d_m_hi   = (io.stbuf_addr_any(DCCM_BITS-1,2) === io.end_addr_m(DCCM_BITS-1,2)) & io.addr_in_dccm_m

  val dccm_wr_bypass_d_r_lo   = (io.stbuf_addr_any(DCCM_BITS-1,2) === io.lsu_addr_r(DCCM_BITS-1,2)) & io.addr_in_dccm_r
  val dccm_wr_bypass_d_r_hi   = (io.stbuf_addr_any(DCCM_BITS-1,2) === io.end_addr_r(DCCM_BITS-1,2)) & io.addr_in_dccm_r

  val dccm_wr_bypass_d_m_hi_Q = WireInit(0.U(1.W))
  val dccm_wr_bypass_d_m_lo_Q = WireInit(0.U(1.W))
  val dccm_wren_Q             = WireInit(0.U(1.W))
  val dccm_wr_data_Q          = WireInit(0.U(32.W))
  val store_data_pre_r        = WireInit(0.U(64.W))
  val store_data_pre_hi_r     = WireInit(0.U(32.W))
  val store_data_pre_lo_r     = WireInit(0.U(32.W))
  val store_data_pre_m        = WireInit(0.U(64.W))
  val store_data_hi_m         = WireInit(0.U(32.W))
  val store_data_lo_m         = WireInit(0.U(32.W))

  if(LOAD_TO_USE_PLUS1 == 1){
    store_data_pre_r        := Cat(Fill(32,0.U),io.store_data_r(31,0)) << 8.U*io.lsu_addr_r(1,0)
    store_data_pre_hi_r     := store_data_pre_r(63,32)
    store_data_pre_lo_r     := store_data_pre_r(31, 0)
    io.store_data_lo_r      := Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux(store_byteen_ext_r(i).asBool,  store_data_pre_lo_r((8*i)+7,8*i), Mux((dccm_wren_Q & dccm_wr_bypass_d_m_lo_Q).asBool, dccm_wr_data_Q((8*i)+7,8*i),io.sec_data_lo_r((8*i)+7,8*i)))))))
    io.store_data_hi_r      := Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux(store_byteen_ext_r(i+4).asBool,store_data_pre_hi_r((8*i)+7,8*i), Mux((dccm_wren_Q & dccm_wr_bypass_d_m_hi_Q).asBool, dccm_wr_data_Q((8*i)+7,8*i),io.sec_data_hi_r((8*i)+7,8*i)))))))
    io.store_datafn_lo_r    := Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux(store_byteen_ext_r(i).asBool,  store_data_pre_lo_r((8*i)+7,8*i), Mux((io.lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo).asBool,io.stbuf_data_any((8*i)+7,(8*i)),Mux((dccm_wren_Q & dccm_wr_bypass_d_m_lo_Q).asBool, dccm_wr_data_Q((8*i)+7,8*i),io.sec_data_lo_r((8*i)+7,8*i))))))))
    io.store_datafn_hi_r    := Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux(store_byteen_ext_r(i+4).asBool,store_data_pre_hi_r((8*i)+7,8*i), Mux((io.lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo).asBool,io.stbuf_data_any((8*i)+7,(8*i)),Mux((dccm_wren_Q & dccm_wr_bypass_d_m_hi_Q).asBool, dccm_wr_data_Q((8*i)+7,8*i),io.sec_data_hi_r((8*i)+7,8*i))))))))
    dccm_wren_Q             := withClock(io.lsu_free_c2_clk){RegNext(io.lsu_stbuf_commit_any,0.U)}
    dccm_wr_data_Q          := rvdffe(io.stbuf_data_any,io.lsu_stbuf_commit_any.asBool,clock,io.scan_mode.asBool)
    dccm_wr_bypass_d_m_lo_Q := withClock(io.lsu_free_c2_clk){RegNext(dccm_wr_bypass_d_m_lo,0.U)}
    dccm_wr_bypass_d_m_hi_Q := withClock(io.lsu_free_c2_clk){RegNext(dccm_wr_bypass_d_m_hi,0.U)}
    io.store_data_r         := withClock(io.lsu_store_c1_r_clk){RegNext(io.store_data_m,0.U)}
  }
  else
  {
    store_data_pre_m        := Cat(Fill(32,0.U),io.store_data_m(31,0)) << 8.U*io.lsu_addr_m(1,0)
    store_data_hi_m         := store_data_pre_m(63,32)
    store_data_lo_m         := store_data_pre_m(31, 0)
    io.store_data_lo_r      := withClock(io.lsu_store_c1_r_clk){RegNext(Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux(store_byteen_ext_m(i).asBool,  store_data_lo_m((8*i)+7,8*i), Mux((io.lsu_stbuf_commit_any &  dccm_wr_bypass_d_m_lo).asBool, io.stbuf_data_any((8*i)+7,8*i),io.sec_data_lo_m((8*i)+7,8*i))))))),0.U)}
    io.store_data_hi_r      := withClock(io.lsu_store_c1_r_clk){RegNext(Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux(store_byteen_ext_m(i+4).asBool,store_data_hi_m((8*i)+7,8*i), Mux((io.lsu_stbuf_commit_any &  dccm_wr_bypass_d_m_hi).asBool, io.stbuf_data_any((8*i)+7,8*i),io.sec_data_hi_m((8*i)+7,8*i))))))),0.U)}
    io.store_datafn_lo_r    := Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux((io.lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo & !store_byteen_ext_r(i)).asBool,io.stbuf_data_any((8*i)+7,8*i),io.store_data_lo_r((8*i)+7,8*i))))))
    io.store_datafn_hi_r    := Reverse(Cat(VecInit.tabulate(4)(i=> Reverse(Mux((io.lsu_stbuf_commit_any & dccm_wr_bypass_d_r_hi & !store_byteen_ext_r(i+4)).asBool,io.stbuf_data_any((8*i)+7,8*i),io.store_data_hi_r((8*i)+7,8*i))))))
    io.store_data_r         := (Cat(io.store_data_hi_r(31,0),io.store_data_lo_r(31,0)) >> 8.U*io.lsu_addr_r(1,0)) & Reverse(Cat(VecInit.tabulate(4)(i=> Fill(8,store_byteen_r(i)))))
  }
  io.dccm_rdata_lo_m      := io.dccm_rd_data_lo(DCCM_DATA_WIDTH-1,0)  //4 lines
  io.dccm_rdata_hi_m      := io.dccm_rd_data_hi(DCCM_DATA_WIDTH-1,0)
  io.dccm_data_ecc_lo_m   := io.dccm_rd_data_lo(DCCM_FDATA_WIDTH-1,DCCM_DATA_WIDTH)
  io.dccm_data_ecc_hi_m   := io.dccm_rd_data_hi(DCCM_FDATA_WIDTH-1,DCCM_DATA_WIDTH)

  io.picm_wren            := (io.lsu_pkt_r.valid & io.lsu_pkt_r.store & io.addr_in_pic_r & io.lsu_commit_r) | io.dma_pic_wen
  io.picm_rden            := io.lsu_pkt_d.valid  & io.lsu_pkt_d.load  & io.addr_in_pic_d
  io.picm_mken            := io.lsu_pkt_d.valid  & io.lsu_pkt_d.store & io.addr_in_pic_d
  io.picm_rdaddr          := aslong(PIC_BASE_ADDR).U | Cat(Fill(32-PIC_BITS,0.U),io.lsu_addr_d(PIC_BITS-1,0))
  io.picm_wraddr          := aslong(PIC_BASE_ADDR).U | Cat(Fill(32-PIC_BITS,0.U),Mux(io.dma_pic_wen.asBool,io.dma_mem_addr(PIC_BITS-1,0),io.lsu_addr_r(PIC_BITS-1,0)))
  io.picm_mask_data_m     := picm_rd_data_m(31,0)
  io.picm_wr_data         := Mux(io.dma_pic_wen.asBool,io.dma_mem_wdata(31,0),io.store_datafn_lo_r(31,0))

  if(DCCM_ENABLE){
    io.lsu_dccm_rden_m := withClock(io.lsu_c2_m_clk){RegNext(lsu_dccm_rden_d,0.U)}
    io.lsu_dccm_rden_r := withClock(io.lsu_c2_r_clk){RegNext(io.lsu_dccm_rden_m,0.U)}
  }
  else{
    io.lsu_dccm_rden_m := 0.U
    io.lsu_dccm_rden_r := 0.U}

}

object dccm_ctl extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_lsu_dccm_ctl()))
}

