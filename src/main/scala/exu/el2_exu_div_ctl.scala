package exu

import chisel3._
import chisel3.experimental.chiselName
import chisel3.util._
import include._
import lib._

@chiselName
class el2_exu_div_ctl extends Module with RequireAsyncReset with el2_lib {
  val io = IO(new Bundle{
    val scan_mode          = Input(Bool())
//    val div_p                 = Flipped(Valid(new el2_div_pkt_t ))
    val dividend           = Input(UInt(32.W))
    val divisor            = Input(UInt(32.W))
//    val dec_div_cancel             = Input(UInt(1.W))

    val exu_div_result                = Output(UInt(32.W))
    val exu_div_wren         = Output(UInt(1.W))
    val dec_div = new dec_div
  })
  // val exu_div_clk          = Wire(Clock())
  val run_state            = WireInit(0.U(1.W))
  val count                = WireInit(0.U(6.W))
  val m_ff                 = WireInit(0.U(33.W))
  val q_in                 = WireInit(0.U(33.W))
  val q_ff                 = WireInit(0.U(33.W))
  val a_in                 = WireInit(0.U(33.W))
  val a_ff                 = WireInit(0.U(33.W))
  val m_eff                = WireInit(0.U(33.W))
  val dividend_neg_ff      = WireInit(0.U(1.W))
  val divisor_neg_ff       = WireInit(0.U(1.W))
  val dividend_comp        = WireInit(0.U(32.W))
  val q_ff_comp            = WireInit(0.U(32.W))
  val a_ff_comp            = WireInit(0.U(32.W))
  val sign_ff              = WireInit(0.U(1.W))
  val rem_ff               = WireInit(0.U(1.W))
  val add                  = WireInit(0.U(1.W))
  val a_eff                = WireInit(0.U(33.W))
  val a_eff_shift          = WireInit(0.U(56.W))
  val rem_correct          = WireInit(0.U(1.W))
  val valid_ff_x           = WireInit(0.U(1.W))
  val finish_ff            = WireInit(0.U(1.W))
  val smallnum_case_ff     = WireInit(0.U(1.W))
  val smallnum_ff          = WireInit(0.U(4.W))
  val smallnum_case        = WireInit(0.U(1.W))
  val count_in             = WireInit(0.U(6.W))
  val dividend_eff         = WireInit(0.U(32.W))
  val a_shift              = WireInit(0.U(33.W))

//  io.exu_div_result := 0.U
//  io.exu_div_wren := 0.U


  val valid_x = valid_ff_x & !io.dec_div.dec_div_cancel

  // START - short circuit logic for small numbers {{
  // small number divides - any 4b / 4b is done in 1 cycle (divisor != 0)
  // smallnum case does not cover divide by 0

  smallnum_case :=  ((q_ff(31,4) === 0.U) & (m_ff(31,4) === 0.U) & (m_ff(31,0) =/= 0.U) & !rem_ff & valid_x) |
    ((q_ff(31,0) === 0.U) & (m_ff(31,0) =/= 0.U) & !rem_ff & valid_x)

  def pat(x : List[Int], y : List[Int]) = {
    val pat1 = (0 until x.size).map(i=> if(x(i)>=0) q_ff(x(i)) else !q_ff(x(i).abs)).reduce(_&_)
    val pat2 = (0 until y.size).map(i=> if(y(i)>=0) m_ff(y(i)) else !m_ff(y(i).abs)).reduce(_&_)
    pat1 & pat2
  }

  val smallnum = Cat(
    pat(List(3),List(-3, -2, -1)),

    pat(List(3),List(-3, -2))& !m_ff(0) | pat(List(2),List(-3, -2, -1)) | pat(List(3, 2),List(-3, -2)),

    pat(List(2),List(-3, -2))& !m_ff(0) | pat(List(1),List(-3, -2, -1))    | pat(List(3),List(-3, -1))& !m_ff(0) |
      pat(List(3, -2),List(-3, -2, 1, 0)) | pat(List(-3, 2, 1),List(-3, -2)) | pat(List(3, 2),List(-3))& !m_ff(0)  |
      pat(List(3, 2),List(-3, 2, -1))     | pat(List(3, 1),List(-3,-1))     | pat(List(3, 2, 1),List(-3, 2)),

    pat(List(2, 1, 0),List(-3, -1))        | pat(List(3, -2, 0),List(-3, 1, 0))    | pat(List(2),List(-3, -1))& !m_ff(0)     |
      pat(List(1),List(-3, -2))& !m_ff(0)    | pat(List(0),List(-3, -2, -1))         | pat(List(-3, 2, -1),List(-3, -2, 1, 0)) |
      pat(List(-3, 2, 1),List(-3))& !m_ff(0) | pat(List(3),List(-2, -1)) & !m_ff(0)  | pat(List(3, -2),List(-3, 2, 1))         |
      pat(List(-3, 2, 1),List(-3, 2, -1))    | pat(List(-3, 2, 0),List(-3, -1))      | pat(List(3, -2, -1),List(-3, 2, 0))     |
      pat(List(-2, 1, 0),List(-3, -2))       | pat(List(3, 2),List(-1)) & !m_ff(0)   | pat(List(-3, 2, 1, 0),List(-3, 2))      |
      pat(List(3, 2),List(3, -2))            | pat(List(3, 1),List(3,-2,-1))         | pat(List(3, 0),List(-2, -1))            |
      pat(List(3, -1),List(-3, 2, 1, 0))     | pat(List(3, 2, 1),List(3)) & !m_ff(0) | pat(List(3, 2, 1),List(3, -1))          |
      pat(List(3, 2, 0),List(3, -1))         | pat(List(3, -2, 1),List(-3, 1))       | pat(List(3, 1, 0),List(-2))             |
      pat(List(3, 2, 1, 0),List(3))          |pat(List(3, 1),List(-2)) & !m_ff(0)
  )
  //io.test := smallnum
  // END   - short circuit logic for small numbers }}

  // *** Start Short Q *** {{
  val shortq_enable_ff     = WireInit(0.U(1.W))
  val short_dividend       = WireInit(0.U(33.W))
  val shortq_shift_xx      = WireInit(0.U(4.W))

  short_dividend := Cat (sign_ff & q_ff(31),q_ff(31,0))


  val a_cls = Cat(
    Mux1H(Seq (
      !short_dividend(32).asBool -> (short_dividend(31,24) =/= Fill(8,0.U)),
      short_dividend(32).asBool -> (short_dividend(31,23) =/= Fill(9,1.U))
    )),
    Mux1H(Seq (
      !short_dividend(32).asBool -> (short_dividend(23,16) =/= Fill(8,0.U)),
      short_dividend(32).asBool -> (short_dividend(22,15) =/= Fill(8,1.U))
    )),
    Mux1H(Seq (
      !short_dividend(32).asBool -> (short_dividend(15,8) =/= Fill(8,0.U)),
      short_dividend(32).asBool -> (short_dividend(14,7) =/= Fill(8,1.U))
    ))
  )
  val b_cls = Cat(
    Mux1H(Seq (
      !m_ff(32).asBool -> (m_ff(31,24) =/= Fill(8,0.U)),
      m_ff(32).asBool -> (m_ff(31,24) =/= Fill(8,1.U))
    )),
    Mux1H(Seq (
      !m_ff(32).asBool -> (m_ff(23,16) =/= Fill(8,0.U)),
      m_ff(32).asBool -> (m_ff(23,16) =/= Fill(8,1.U))
    )),
    Mux1H(Seq (
      !m_ff(32).asBool -> (m_ff(15,8) =/= Fill(8,0.U)),
      m_ff(32).asBool -> (m_ff(15,8) =/= Fill(8,1.U))
    ))
  )
  val shortq_raw = Cat(
    ( (a_cls(2,1) === "b01".U )  & (b_cls(2)   === "b1".U   ) ) |  // Shift by 32
      ( (a_cls(2,0) === "b001".U ) & (b_cls(2)   === "b1".U   ) ) |
      ( (a_cls(2,0) === "b000".U ) & (b_cls(2)   === "b1".U   ) ) |
      ( (a_cls(2,0) === "b001".U ) & (b_cls(2,1) === "b01".U  ) ) |
      ( (a_cls(2,0) === "b000".U ) & (b_cls(2,1) === "b01".U  ) ) |
      ( (a_cls(2,0) === "b000".U ) & (b_cls(2,0) === "b001".U ) ) ,

    ( (a_cls(2)   === "b1".U   ) & (b_cls(2)   === "b1".U   ) ) |  // Shift by 24
      ( (a_cls(2,1) === "b01".U  ) & (b_cls(2,1) === "b01".U  ) ) |
      ( (a_cls(2,0) === "b001".U ) & (b_cls(2,0) === "b001".U ) ) |
      ( (a_cls(2,0) === "b000".U ) & (b_cls(2,0) === "b000".U ) ) ,

    ( (a_cls(2)   === "b1".U   ) & (b_cls(2,1) === "b01".U  ) ) |  // Shift by 16
      ( (a_cls(2,1) === "b01".U  ) & (b_cls(2,0) === "b001".U ) ) |
      ( (a_cls(2,0) === "b001".U ) & (b_cls(2,0) === "b000".U ) ) ,

    ( (a_cls(2)   === "b1".U   ) & (b_cls(2,0) === "b001".U ) ) |  // Shift by 8
      ( (a_cls(2,1) === "b01".U  ) & (b_cls(2,0) === "b000".U ) )

  )
  val shortq_enable =  valid_ff_x & (m_ff(31,0) =/= 0.U(32.W)) & (shortq_raw =/= 0.U(4.W))
  val shortq_shift = Fill(4,shortq_enable) & shortq_raw

  val shortq_shift_ff = Mux1H(Seq (
    shortq_shift_xx(3).asBool -> "b11111".U,
    shortq_shift_xx(2).asBool -> "b11000".U,
    shortq_shift_xx(1).asBool -> "b10000".U,
    shortq_shift_xx(0).asBool -> "b01000".U
  ))
  // *** End   Short *** }}

  val finish     = smallnum_case | Mux(!rem_ff ,count === 32.U(6.W) ,count === 33.U(6.W))
  val div_clken  = io.dec_div.div_p.valid | run_state | finish | finish_ff
  val run_in     = (io.dec_div.div_p.valid | run_state) & !finish & !io.dec_div.dec_div_cancel
  count_in   := Fill(6,(run_state & !finish & !io.dec_div.dec_div_cancel & !shortq_enable)) & (count + Cat(0.U,shortq_shift_ff) + (1.U)(6.W))
  //io.test := count_in

  io.exu_div_wren  :=  finish_ff & !io.dec_div.dec_div_cancel
  val sign_eff   = !io.dec_div.div_p.bits.unsign & (io.divisor =/= 0.U(32.W))


  q_in := Mux1H(Seq(
    (!run_state).asBool -> Cat(0.U(1.W),io.dividend) ,
    (run_state & (valid_ff_x | shortq_enable_ff)).asBool -> (Cat(dividend_eff(31,0),!a_in(32)) << shortq_shift_ff) ,
    (run_state & !(valid_ff_x | shortq_enable_ff)).asBool -> Cat(q_ff(31,0),!a_in(32))
  ))
  val qff_enable   =  io.dec_div.div_p.valid | (run_state & !shortq_enable)
  dividend_eff := Mux((sign_ff & dividend_neg_ff).asBool, rvtwoscomp(q_ff(31,0)),q_ff(31,0))


  m_eff := Mux(add.asBool , m_ff, ~m_ff )
  a_eff_shift := Cat(0.U(24.W), dividend_eff) << shortq_shift_ff
  a_eff := Mux1H(Seq(
    rem_correct.asBool -> a_ff ,
    (!rem_correct & !shortq_enable_ff).asBool -> Cat(a_ff(31,0), q_ff(32)) ,
    (!rem_correct &  shortq_enable_ff).asBool -> Cat(0.U(9.W),a_eff_shift(55,32))
  ))
  val aff_enable  =  io.dec_div.div_p.valid | (run_state & !shortq_enable & (count =/= 33.U(6.W))) | rem_correct
  a_shift := Fill(33,run_state) & a_eff
  a_in := Fill(33,run_state) & (a_shift + m_eff + Cat(0.U(32.W),!add))
  val m_already_comp          = divisor_neg_ff & sign_ff
  // if m already complemented, then invert operation add->sub, sub->add
  add  := (a_ff(32) | rem_correct) ^ m_already_comp
  rem_correct  := (count === 33.U(6.W)) & rem_ff & a_ff(32)
  val q_ff_eff = Mux((sign_ff & (dividend_neg_ff ^ divisor_neg_ff)).asBool,rvtwoscomp(q_ff(31,0)), q_ff(31,0))
  val a_ff_eff = Mux((sign_ff & dividend_neg_ff ).asBool, rvtwoscomp(a_ff(31,0)), a_ff(31,0))

  io.exu_div_result := Mux1H(Seq(
    smallnum_case_ff.asBool -> Cat(0.U(28.W), smallnum_ff),
    rem_ff.asBool -> a_ff_eff ,
    (!smallnum_case_ff & !rem_ff).asBool -> q_ff_eff
  ))

  val exu_div_cgc = rvclkhdr(clock,div_clken.asBool,io.scan_mode)

  withClock(exu_div_cgc) {
    valid_ff_x := RegNext(io.dec_div.div_p.valid & !io.dec_div.dec_div_cancel, 0.U)
    finish_ff := RegNext(finish & !io.dec_div.dec_div_cancel, 0.U)
    run_state := RegNext(run_in, 0.U)
    count := RegNext(count_in, 0.U)
    dividend_neg_ff := RegEnable(io.dividend(31), 0.U, io.dec_div.div_p.valid.asBool)
    divisor_neg_ff := RegEnable(io.divisor(31), 0.U, io.dec_div.div_p.valid.asBool)
    sign_ff := RegEnable(sign_eff, 0.U, io.dec_div.div_p.valid.asBool)
    rem_ff := RegEnable(io.dec_div.div_p.bits.rem, 0.U, io.dec_div.div_p.valid.asBool)
    smallnum_case_ff := RegNext(smallnum_case, 0.U)
    smallnum_ff := RegNext(smallnum, 0.U)
    shortq_enable_ff := RegNext(shortq_enable, 0.U)
    shortq_shift_xx := RegNext(shortq_shift, 0.U)
  }
  q_ff := rvdffe(q_in, qff_enable.asBool,clock,io.scan_mode)
  a_ff := rvdffe(a_in, aff_enable.asBool,clock,io.scan_mode)
  m_ff := rvdffe(Cat(!io.dec_div.div_p.bits.unsign & io.divisor(31), io.divisor), io.dec_div.div_p.valid.asBool,clock,io.scan_mode)

}
object div_main extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_exu_div_ctl()))
}
