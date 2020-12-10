package lsu
import chisel3._
import chisel3.util._
import lib._
import include._
import ifu._

class  lsu_bus_intf extends Module with RequireAsyncReset with lib {
  val io = IO (new Bundle {
    val scan_mode   = Input(Bool())
    val tlu_busbuff = new tlu_busbuff()
    val lsu_c1_m_clk        = Input(Clock())
    val lsu_c1_r_clk        = Input(Clock())
    val lsu_c2_r_clk        = Input(Clock())
    val lsu_bus_ibuf_c1_clk = Input(Clock())
    val lsu_bus_obuf_c1_clk = Input(Clock())
    val lsu_bus_buf_c1_clk  = Input(Clock())
    val lsu_free_c2_clk     = Input(Clock())
    val free_clk            = Input(Clock())
    val lsu_busm_clk        = Input(Clock())
    val axi                 = new axi_channels(LSU_BUS_TAG)
    val dec_lsu_valid_raw_d = Input(Bool())
    val lsu_busreq_m        = Input(Bool())

    val lsu_pkt_m           = Flipped(Valid(new lsu_pkt_t()))
    val lsu_pkt_r           = Flipped(Valid(new lsu_pkt_t()))

    val lsu_addr_d          = Input(UInt(32.W))
    val lsu_addr_m          = Input(UInt(32.W))
    val lsu_addr_r          = Input(UInt(32.W))

    val end_addr_d          = Input(UInt(32.W))
    val end_addr_m          = Input(UInt(32.W))
    val end_addr_r          = Input(UInt(32.W))

    val store_data_r        = Input(UInt(32.W))
    val dec_tlu_force_halt  = Input(Bool())

    val lsu_commit_r        = Input(Bool())
    val is_sideeffects_m    = Input(Bool())
    val flush_m_up          = Input(Bool())
    val flush_r             = Input(Bool())

    val lsu_busreq_r                  = Output(Bool())
    val lsu_bus_buffer_pend_any       = Output(Bool())
    val lsu_bus_buffer_full_any       = Output(Bool())
    val lsu_bus_buffer_empty_any      = Output(Bool())
    val lsu_bus_idle_any              = Output(Bool())
    val bus_read_data_m               = Output(UInt(32.W))

    val dctl_busbuff = new dctl_busbuff()

    val lsu_bus_clk_en      = Input(Bool())
  })

  val lsu_bus_clk_en_q        = WireInit(Bool(), init = false.B)
  val ldst_dual_d             = WireInit(Bool(), init = false.B)
  val ldst_dual_m             = WireInit(Bool(), init = false.B)
  val ldst_dual_r             = WireInit(Bool(), init = false.B)
  val ldst_byteen_m           = WireInit(UInt(4.W), init = 0.U)
  val ldst_byteen_r           = WireInit(UInt(4.W), init = 0.U)
  val ldst_byteen_ext_m       = WireInit(UInt(8.W), init = 0.U)
  val ldst_byteen_ext_r       = WireInit(UInt(8.W), init = 0.U)
  val ldst_byteen_hi_m        = WireInit(UInt(4.W), init = 0.U)
  val ldst_byteen_hi_r        = WireInit(UInt(4.W), init = 0.U)
  val ldst_byteen_lo_m        = WireInit(UInt(4.W), init = 0.U)
  val ldst_byteen_lo_r        = WireInit(UInt(4.W), init = 0.U)
  val is_sideeffects_r        = WireInit(Bool(), init = false.B)
  val store_data_ext_r        = WireInit(UInt(64.W), init = 0.U)
  val store_data_hi_r         = WireInit(UInt(32.W), init = 0.U)
  val store_data_lo_r         = WireInit(UInt(32.W), init = 0.U)
  val addr_match_dw_lo_r_m    = WireInit(Bool(), init = false.B)
  val addr_match_word_lo_r_m  = WireInit(Bool(), init = false.B)
  val no_word_merge_r         = WireInit(Bool(), init = false.B)
  val no_dword_merge_r        = WireInit(Bool(), init = false.B)
  val ld_addr_rhit_lo_lo      = WireInit(Bool(), init = false.B)
  val ld_addr_rhit_hi_lo      = WireInit(Bool(), init = false.B)
  val ld_addr_rhit_lo_hi      = WireInit(Bool(), init = false.B)
  val ld_addr_rhit_hi_hi      = WireInit(Bool(), init = false.B)
  val ld_byte_rhit_lo_lo      = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_rhit_hi_lo      = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_rhit_lo_hi      = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_rhit_hi_hi      = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_hit_lo          = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_rhit_lo         = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_hit_hi          = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_rhit_hi         = WireInit(UInt(4.W), init = 0.U)
  val ld_fwddata_rpipe_lo     = WireInit(UInt(32.W), init = 0.U)
  val ld_fwddata_rpipe_hi     = WireInit(UInt(32.W), init = 0.U)
  val ld_byte_hit_buf_lo      = WireInit(UInt(4.W), init = 0.U)
  val ld_byte_hit_buf_hi      = WireInit(UInt(4.W), init = 0.U)
  val ld_fwddata_buf_lo       = WireInit(UInt(32.W), init = 0.U)
  val ld_fwddata_buf_hi       = WireInit(UInt(32.W), init = 0.U)
  val ld_fwddata_lo           = WireInit(UInt(64.W), init = 0.U)
  val ld_fwddata_hi           = WireInit(UInt(64.W), init = 0.U)
  val ld_fwddata_m            = WireInit(UInt(64.W), init = 0.U)
  val ld_full_hit_hi_m        = WireInit(Bool(), init = true.B)
  val ld_full_hit_lo_m        = WireInit(Bool(), init = true.B)
  val ld_full_hit_m           = WireInit(Bool(), init = false.B)

  val bus_buffer              = Module(new lsu_bus_buffer)

  bus_buffer.io.scan_mode   := io.scan_mode
  io.tlu_busbuff <> bus_buffer.io.tlu_busbuff

  bus_buffer.io.dec_tlu_force_halt                := io.dec_tlu_force_halt
  bus_buffer.io.lsu_c2_r_clk                      := io.lsu_c2_r_clk
  bus_buffer.io.lsu_bus_ibuf_c1_clk               := io.lsu_bus_ibuf_c1_clk
  bus_buffer.io.lsu_bus_obuf_c1_clk               := io.lsu_bus_obuf_c1_clk
  bus_buffer.io.lsu_bus_buf_c1_clk                := io.lsu_bus_buf_c1_clk
  bus_buffer.io.lsu_free_c2_clk                   := io.lsu_free_c2_clk
  bus_buffer.io.lsu_busm_clk                      := io.lsu_busm_clk
  bus_buffer.io.dec_lsu_valid_raw_d               := io.dec_lsu_valid_raw_d

  //
  bus_buffer.io.lsu_pkt_m <> io.lsu_pkt_m
  bus_buffer.io.lsu_pkt_r <> io.lsu_pkt_r
  //

  bus_buffer.io.lsu_addr_m                        := io.lsu_addr_m
  bus_buffer.io.end_addr_m                        := io.end_addr_m
  bus_buffer.io.lsu_addr_r                        := io.lsu_addr_r
  bus_buffer.io.end_addr_r                        := io.end_addr_r
  bus_buffer.io.store_data_r                      := io.store_data_r

  bus_buffer.io.lsu_busreq_m                      := io.lsu_busreq_m
  bus_buffer.io.flush_m_up                        := io.flush_m_up
  bus_buffer.io.flush_r                           := io.flush_r
  bus_buffer.io.lsu_commit_r                      := io.lsu_commit_r
  bus_buffer.io.lsu_axi                   <> io.axi
  bus_buffer.io.lsu_bus_clk_en                    := io.lsu_bus_clk_en

  io.lsu_busreq_r                    := bus_buffer.io.lsu_busreq_r
  io.lsu_bus_buffer_pend_any         := bus_buffer.io.lsu_bus_buffer_pend_any
  io.lsu_bus_buffer_full_any         := bus_buffer.io.lsu_bus_buffer_full_any
  io.lsu_bus_buffer_empty_any        := bus_buffer.io.lsu_bus_buffer_empty_any
  io.lsu_bus_idle_any                := bus_buffer.io.lsu_bus_idle_any
  ld_byte_hit_buf_lo                 := bus_buffer.io.ld_byte_hit_buf_lo
  ld_byte_hit_buf_hi                 := bus_buffer.io.ld_byte_hit_buf_hi
  ld_fwddata_buf_lo                  := bus_buffer.io.ld_fwddata_buf_lo
  ld_fwddata_buf_hi                  := bus_buffer.io.ld_fwddata_buf_hi
  io.dctl_busbuff <> bus_buffer.io.dctl_busbuff
  bus_buffer.io.no_word_merge_r                   := no_word_merge_r
  bus_buffer.io.no_dword_merge_r                  := no_dword_merge_r
  bus_buffer.io.is_sideeffects_r                  := is_sideeffects_r
  bus_buffer.io.ldst_dual_d                       := ldst_dual_d
  bus_buffer.io.ldst_dual_m                       := ldst_dual_m
  bus_buffer.io.ldst_dual_r                       := ldst_dual_r
  bus_buffer.io.ldst_byteen_ext_m                 := ldst_byteen_ext_m
  bus_buffer.io.ld_full_hit_m                     := ld_full_hit_m
  bus_buffer.io.lsu_bus_clk_en_q                  := lsu_bus_clk_en_q

  ldst_byteen_m           := Mux1H(Seq(io.lsu_pkt_m.bits.word.asBool -> 15.U(4.W), io.lsu_pkt_m.bits.half.asBool -> 3.U(4.W), io.lsu_pkt_m.bits.by.asBool -> 1.U(4.W)))
  ldst_dual_d             := io.lsu_addr_d(2) =/= io.end_addr_d(2)
  addr_match_dw_lo_r_m    := (io.lsu_addr_r(31,3) === io.lsu_addr_m(31,3))
  addr_match_word_lo_r_m  := addr_match_dw_lo_r_m & !(io.lsu_addr_r(2)^io.lsu_addr_m(2))
  no_word_merge_r         := io.lsu_busreq_r & !ldst_dual_r & io.lsu_busreq_m & (io.lsu_pkt_m.bits.load | !addr_match_word_lo_r_m)
  no_dword_merge_r        := io.lsu_busreq_r & !ldst_dual_r & io.lsu_busreq_m & (io.lsu_pkt_m.bits.load | !addr_match_dw_lo_r_m)

  ldst_byteen_ext_m       := ldst_byteen_m(3,0) << io.lsu_addr_m(1,0)
  ldst_byteen_ext_r       := ldst_byteen_r(3,0) << io.lsu_addr_r(1,0)
  store_data_ext_r        := io.store_data_r(31,0) << Cat(io.lsu_addr_r(1,0),0.U(3.W))
  ldst_byteen_hi_m        := ldst_byteen_ext_m(7,4)
  ldst_byteen_lo_m        := ldst_byteen_ext_m(3,0)
  ldst_byteen_hi_r        := ldst_byteen_ext_r(7,4)
  ldst_byteen_lo_r        := ldst_byteen_ext_r(3,0)

  store_data_hi_r         := store_data_ext_r(63,32)
  store_data_lo_r         := store_data_ext_r(31,0)
  ld_addr_rhit_lo_lo      := (io.lsu_addr_m(31,2) === io.lsu_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & io.lsu_busreq_m
  ld_addr_rhit_lo_hi      := (io.end_addr_m(31,2) === io.lsu_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & io.lsu_busreq_m
  ld_addr_rhit_hi_lo      := (io.lsu_addr_m(31,2) === io.end_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & io.lsu_busreq_m
  ld_addr_rhit_hi_hi      := (io.end_addr_m(31,2) === io.end_addr_r(31,2)) & io.lsu_pkt_r.valid & io.lsu_pkt_r.bits.store & io.lsu_busreq_m

  ld_byte_rhit_lo_lo      := (0 until 4).map(i =>(ld_addr_rhit_lo_lo & ldst_byteen_lo_r(i) & ldst_byteen_lo_m(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_lo_hi      := (0 until 4).map(i =>(ld_addr_rhit_lo_hi & ldst_byteen_lo_r(i) & ldst_byteen_hi_m(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_hi_lo      := (0 until 4).map(i =>(ld_addr_rhit_hi_lo & ldst_byteen_hi_r(i) & ldst_byteen_lo_m(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_hi_hi      := (0 until 4).map(i =>(ld_addr_rhit_hi_hi & ldst_byteen_hi_r(i) & ldst_byteen_hi_m(i)).asUInt).reverse.reduce(Cat(_,_))

  ld_byte_hit_lo          := (0 until 4).map(i =>(ld_byte_rhit_lo_lo(i) | ld_byte_rhit_hi_lo(i) | ld_byte_hit_buf_lo(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_hit_hi          := (0 until 4).map(i =>(ld_byte_rhit_lo_hi(i) | ld_byte_rhit_hi_hi(i) | ld_byte_hit_buf_hi(i)).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_lo         := (0 until 4).map(i =>(ld_byte_rhit_lo_lo(i) | ld_byte_rhit_hi_lo(i)                        ).asUInt).reverse.reduce(Cat(_,_))
  ld_byte_rhit_hi         := (0 until 4).map(i =>(ld_byte_rhit_lo_hi(i) | ld_byte_rhit_hi_hi(i)                        ).asUInt).reverse.reduce(Cat(_,_))
  ld_fwddata_rpipe_lo     := (0 until 4).map(i =>(Mux1H(Seq(ld_byte_rhit_lo_lo(i) -> store_data_lo_r((8*i)+7,(8*i)), ld_byte_rhit_hi_lo(i) -> store_data_hi_r((8*i)+7,(8*i))))).asUInt).reverse.reduce(Cat(_,_))
  ld_fwddata_rpipe_hi     := (0 until 4).map(i =>(Mux1H(Seq(ld_byte_rhit_lo_hi(i) -> store_data_lo_r((8*i)+7,(8*i)), ld_byte_rhit_hi_hi(i) -> store_data_hi_r((8*i)+7,(8*i))))).asUInt).reverse.reduce(Cat(_,_))
  ld_fwddata_lo           := (0 until 4).map(i =>(Mux(ld_byte_rhit_lo(i), ld_fwddata_rpipe_lo((8*i)+7,(8*i)), ld_fwddata_buf_lo((8*i)+7,(8*i)))).asUInt).reverse.reduce(Cat(_,_))
  ld_fwddata_hi           := (0 until 4).map(i =>(Mux(ld_byte_rhit_hi(i), ld_fwddata_rpipe_hi((8*i)+7,(8*i)), ld_fwddata_buf_hi((8*i)+7,(8*i)))).asUInt).reverse.reduce(Cat(_,_))
  ld_full_hit_lo_m        := (0 until 4).map(i =>((ld_byte_hit_lo(i) | !ldst_byteen_lo_m(i))).asUInt).reduce(_&_)
  ld_full_hit_hi_m        := (0 until 4).map(i =>((ld_byte_hit_hi(i) | !ldst_byteen_hi_m(i))).asUInt).reduce(_&_)
  ld_full_hit_m           := ld_full_hit_lo_m & ld_full_hit_hi_m & io.lsu_busreq_m & io.lsu_pkt_m.bits.load & !io.is_sideeffects_m
  ld_fwddata_m            := Cat(ld_fwddata_hi(31,0), ld_fwddata_lo(31,0)) >> (8.U*io.lsu_addr_m(1,0))
  io.bus_read_data_m      := ld_fwddata_m(31,0)

  withClock(io.free_clk) {
    lsu_bus_clk_en_q := RegNext(io.lsu_bus_clk_en, init = 0.U)
  }
  withClock(io.lsu_c1_m_clk) {
    ldst_dual_m := RegNext(ldst_dual_d, init = 0.U)
  }
  withClock(io.lsu_c1_r_clk) {
    ldst_dual_r       := RegNext(ldst_dual_m, init = 0.U)
    is_sideeffects_r  := RegNext(io.is_sideeffects_m, init = 0.U)
    ldst_byteen_r     := RegNext(ldst_byteen_m, init = 0.U(4.W))
  }
}
