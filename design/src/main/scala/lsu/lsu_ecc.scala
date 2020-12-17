package lsu
import chisel3._
import chisel3.util._
import chisel3.experimental.chiselName
import include._
import lib._

@chiselName
class lsu_ecc extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle{

    val lsu_c2_r_clk        	     = Input(Clock())
    val lsu_pkt_m           	     = Flipped(Valid(new lsu_pkt_t))
    val lsu_pkt_r           	     = Flipped(Valid(new lsu_pkt_t))
    val stbuf_data_any	   	       = Input(UInt(DCCM_DATA_WIDTH.W))
    val dec_tlu_core_ecc_disable   = Input(Bool())
    val lsu_dccm_rden_r        	   = Input(Bool())
    val addr_in_dccm_r             = Input(Bool())

    val lsu_addr_r	   	           = Input(UInt(DCCM_BITS.W))
    val end_addr_r	   	           = Input(UInt(DCCM_BITS.W))
    val lsu_addr_m	   	           = Input(UInt(DCCM_BITS.W))
    val end_addr_m	   	           = Input(UInt(DCCM_BITS.W))

    val dccm_rdata_hi_r   	       = Input(UInt(DCCM_DATA_WIDTH.W))
    val dccm_rdata_lo_r   	       = Input(UInt(DCCM_DATA_WIDTH.W))
    val dccm_rdata_hi_m   	       = Input(UInt(DCCM_DATA_WIDTH.W))
    val dccm_rdata_lo_m   	       = Input(UInt(DCCM_DATA_WIDTH.W))

    val dccm_data_ecc_hi_r         = Input(UInt(DCCM_ECC_WIDTH.W))
    val dccm_data_ecc_lo_r         = Input(UInt(DCCM_ECC_WIDTH.W))
    val dccm_data_ecc_hi_m         = Input(UInt(DCCM_ECC_WIDTH.W))
    val dccm_data_ecc_lo_m         = Input(UInt(DCCM_ECC_WIDTH.W))

    val ld_single_ecc_error_r      = Input(Bool())
    val ld_single_ecc_error_r_ff   = Input(Bool())
    val lsu_dccm_rden_m            = Input(Bool())
    val addr_in_dccm_m             = Input(Bool())

    val dma_dccm_wen               = Input(Bool())
    val dma_dccm_wdata_lo          = Input(UInt(32.W))
    val dma_dccm_wdata_hi          = Input(UInt(32.W))

    val scan_mode                  = Input(Bool())

    //Outputs
    val sec_data_hi_r   	         = Output(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_lo_r   	         = Output(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_hi_m   	         = Output(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_lo_m   	         = Output(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_hi_r_ff   	       = Output(UInt(DCCM_DATA_WIDTH.W))
    val sec_data_lo_r_ff   	       = Output(UInt(DCCM_DATA_WIDTH.W))

    val dma_dccm_wdata_ecc_hi      = Output(UInt(DCCM_ECC_WIDTH.W))
    val dma_dccm_wdata_ecc_lo      = Output(UInt(DCCM_ECC_WIDTH.W))
    val stbuf_ecc_any              = Output(UInt(DCCM_ECC_WIDTH.W))
    val sec_data_ecc_hi_r_ff       = Output(UInt(DCCM_ECC_WIDTH.W))
    val sec_data_ecc_lo_r_ff       = Output(UInt(DCCM_ECC_WIDTH.W))

    val single_ecc_error_hi_r      = Output(Bool())
    val single_ecc_error_lo_r      = Output(Bool())
    val lsu_single_ecc_error_r     = Output(Bool())
    val lsu_double_ecc_error_r     = Output(Bool())
    val lsu_single_ecc_error_m     = Output(Bool())
    val lsu_double_ecc_error_m     = Output(Bool())
  })
  val is_ldst_r                    = WireInit(Bool(),init = 0.U)
  val is_ldst_hi_any               = WireInit(Bool(),init = 0.U)
  val is_ldst_lo_any               = WireInit(Bool(),init = 0.U)
  val dccm_wdata_hi_any            = WireInit(0.U(DCCM_DATA_WIDTH.W))
  val dccm_wdata_lo_any            = WireInit(0.U(DCCM_DATA_WIDTH.W))
  val dccm_rdata_hi_any            = WireInit(0.U(DCCM_DATA_WIDTH.W))
  val dccm_rdata_lo_any            = WireInit(0.U(DCCM_DATA_WIDTH.W))
  val dccm_data_ecc_hi_any         = WireInit(0.U(DCCM_ECC_WIDTH.W))
  val dccm_data_ecc_lo_any         = WireInit(0.U(DCCM_ECC_WIDTH.W))
  val double_ecc_error_hi_m	       = WireInit(Bool(),init = 0.U)
  val double_ecc_error_lo_m	       = WireInit(Bool(),init = 0.U)
  val double_ecc_error_hi_r	       = WireInit(Bool(),init = 0.U)
  val double_ecc_error_lo_r	       = WireInit(Bool(),init = 0.U)
  val ldst_dual_m	                 = WireInit(Bool(),init = 0.U)
  val ldst_dual_r 	               = WireInit(Bool(),init = 0.U)
  val is_ldst_m	                   = WireInit(Bool(),init = 0.U)
  val is_ldst_hi_m	               = WireInit(Bool(),init = 0.U)
  val is_ldst_lo_m	               = WireInit(Bool(),init = 0.U)
  val is_ldst_hi_r	               = WireInit(Bool(),init = 0.U)
  val is_ldst_lo_r	               = WireInit(Bool(),init = 0.U)

  io.sec_data_hi_m   	       :=0.U
  io.sec_data_lo_m   	       :=0.U
  io.lsu_single_ecc_error_m  :=0.U
  io.lsu_double_ecc_error_m  :=0.U

  //////////////////////////////CODE STARTS HERE///////////////////////
  val (ecc_out_hi_nc, sec_data_hi_any,  single_ecc_error_hi_any, double_ecc_error_hi_any) = if(DCCM_ENABLE)
    rvecc_decode(is_ldst_hi_any, dccm_rdata_hi_any, dccm_data_ecc_hi_any, 0.U) else (0.U, 0.U, 0.U, 0.U)
  val ( ecc_out_lo_nc, sec_data_lo_any, single_ecc_error_lo_any, double_ecc_error_lo_any) = if(DCCM_ENABLE)
    rvecc_decode(is_ldst_lo_any, dccm_rdata_lo_any, dccm_data_ecc_lo_any, 0.U) else (0.U, 0.U, 0.U, 0.U)
  val dccm_wdata_ecc_lo_any = if(DCCM_ENABLE) rvecc_encode(dccm_wdata_lo_any) else (0.U)
  val dccm_wdata_ecc_hi_any = if(DCCM_ENABLE) rvecc_encode(dccm_wdata_hi_any) else (0.U)

  when (LOAD_TO_USE_PLUS1.B) {
    ldst_dual_r := io.lsu_addr_r(2) =/= io.end_addr_r(2)
    is_ldst_r := io.lsu_pkt_r.valid & (io.lsu_pkt_r.bits.load | io.lsu_pkt_r.bits.store) & io.addr_in_dccm_r & io.lsu_dccm_rden_r
    is_ldst_lo_r := is_ldst_r & !io.dec_tlu_core_ecc_disable
    is_ldst_hi_r := is_ldst_r & (ldst_dual_r | io.lsu_pkt_r.bits.dma) & !io.dec_tlu_core_ecc_disable
    is_ldst_hi_any  := is_ldst_hi_r
    dccm_rdata_hi_any  := io.dccm_rdata_hi_r
    dccm_data_ecc_hi_any := io.dccm_data_ecc_hi_r
    is_ldst_lo_any := is_ldst_lo_r
    dccm_rdata_lo_any   := io.dccm_rdata_lo_r
    dccm_data_ecc_lo_any := io.dccm_data_ecc_lo_r
    io.sec_data_hi_r := sec_data_hi_any;
    io.single_ecc_error_hi_r  := single_ecc_error_hi_any
    double_ecc_error_hi_r  := double_ecc_error_hi_any
    io.sec_data_lo_r    := sec_data_lo_any
    io.single_ecc_error_lo_r  := single_ecc_error_lo_any
    double_ecc_error_lo_r  := double_ecc_error_lo_any
    io.lsu_single_ecc_error_r := io.single_ecc_error_hi_r | io.single_ecc_error_lo_r;
    io.lsu_double_ecc_error_r := double_ecc_error_hi_r | double_ecc_error_lo_r
  }
    .otherwise {
      ldst_dual_m := io.lsu_addr_m(2) =/= io.end_addr_m(2)
      is_ldst_m := io.lsu_pkt_m.valid & (io.lsu_pkt_m.bits.load | io.lsu_pkt_m.bits.store) & io.addr_in_dccm_m & io.lsu_dccm_rden_m
      is_ldst_lo_m := is_ldst_m & !io.dec_tlu_core_ecc_disable
      is_ldst_hi_m := is_ldst_m & (ldst_dual_m | io.lsu_pkt_m.bits.dma) & !io.dec_tlu_core_ecc_disable
      is_ldst_hi_any  := is_ldst_hi_m
      dccm_rdata_hi_any  := io.dccm_rdata_hi_m
      dccm_data_ecc_hi_any := io.dccm_data_ecc_hi_m
      is_ldst_lo_any := is_ldst_lo_m
      dccm_rdata_lo_any   := io.dccm_rdata_lo_m
      dccm_data_ecc_lo_any := io.dccm_data_ecc_lo_m
      io.sec_data_hi_m    := sec_data_hi_any
      double_ecc_error_hi_m  := double_ecc_error_hi_any
      io.sec_data_lo_m    := sec_data_lo_any
      double_ecc_error_lo_m  := double_ecc_error_lo_any
      io.lsu_single_ecc_error_m := single_ecc_error_hi_any | single_ecc_error_lo_any;
      io.lsu_double_ecc_error_m := double_ecc_error_hi_m | double_ecc_error_lo_m

      withClock(io.lsu_c2_r_clk) {io.lsu_single_ecc_error_r  := RegNext(io.lsu_single_ecc_error_m,0.U)}
      withClock(io.lsu_c2_r_clk) {io.lsu_double_ecc_error_r  := RegNext(io.lsu_double_ecc_error_m,0.U)}
      withClock(io.lsu_c2_r_clk) {io.single_ecc_error_lo_r   := RegNext(single_ecc_error_lo_any,0.U)}
      withClock(io.lsu_c2_r_clk) {io.single_ecc_error_hi_r   := RegNext(single_ecc_error_hi_any,0.U)}
      withClock(io.lsu_c2_r_clk) {io.sec_data_hi_r           := RegNext(io.sec_data_hi_m,0.U)}
      withClock(io.lsu_c2_r_clk) {io.sec_data_lo_r           := RegNext(io.sec_data_lo_m,0.U)}
    }
  // Logic for ECC generation during write
  dccm_wdata_lo_any := Mux(io.ld_single_ecc_error_r_ff.asBool, io.sec_data_lo_r_ff,Mux(io.dma_dccm_wen.asBool, io.dma_dccm_wdata_lo, io.stbuf_data_any))
  dccm_wdata_hi_any := Mux(io.ld_single_ecc_error_r_ff.asBool, io.sec_data_hi_r_ff,Mux(io.dma_dccm_wen.asBool, io.dma_dccm_wdata_hi, io.stbuf_data_any))
  io.sec_data_ecc_hi_r_ff  := dccm_wdata_ecc_hi_any
  io.sec_data_ecc_lo_r_ff  := dccm_wdata_ecc_lo_any
  io.stbuf_ecc_any         := dccm_wdata_ecc_lo_any
  io.dma_dccm_wdata_ecc_hi := dccm_wdata_ecc_hi_any
  io.dma_dccm_wdata_ecc_lo := dccm_wdata_ecc_lo_any

  io.sec_data_hi_r_ff := rvdffe(io.sec_data_hi_r, io.ld_single_ecc_error_r,clock,io.scan_mode)
  io.sec_data_lo_r_ff := rvdffe(io.sec_data_lo_r, io.ld_single_ecc_error_r,clock,io.scan_mode)

}
