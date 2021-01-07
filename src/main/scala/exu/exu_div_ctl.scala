package exu

import chisel3.{util, _}
import chisel3.experimental.chiselName
import chisel3.util._
import include._
import lib._

@chiselName
class exu_div_ctl extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle {
    val scan_mode = Input(Bool())
    val dividend = Input(UInt(32.W))
    val divisor = Input(UInt(32.W))
    val exu_div_result = Output(UInt(32.W))
    val exu_div_wren = Output(UInt(1.W))
    val dec_div = new dec_div()
  })

  val out_raw =WireInit(0.U(32.W))
  io.exu_div_result := Fill(32,io.exu_div_wren) & out_raw
if(!DIV_NEW) {
  val divider_old = Module(new exu_div_existing_1bit_cheapshortq())
  divider_old.io.scan_mode    := io.scan_mode
  divider_old.io.cancel       := io.dec_div.dec_div_cancel
  divider_old.io.valid_in     := io.dec_div.div_p.valid
  divider_old.io.signed_in    := ~io.dec_div.div_p.bits.unsign
  divider_old.io.rem_in       := io.dec_div.div_p.bits.rem
  divider_old.io.dividend_in  := io.dividend
  divider_old.io.divisor_in   := io.divisor
  out_raw                 := divider_old.io.data_out
  io.exu_div_wren         := divider_old.io.valid_out
}
  if(DIV_NEW & DIV_BIT==1) {
    val divider_new1 = Module(new exu_div_new_1bit_fullshortq())
    divider_new1.io.scan_mode    := io.scan_mode
    divider_new1.io.cancel       := io.dec_div.dec_div_cancel
    divider_new1.io.valid_in     := io.dec_div.div_p.valid
    divider_new1.io.signed_in    := ~io.dec_div.div_p.bits.unsign
    divider_new1.io.rem_in       := io.dec_div.div_p.bits.rem
    divider_new1.io.dividend_in  := io.dividend
    divider_new1.io.divisor_in   := io.divisor
    out_raw                 := divider_new1.io.data_out
    io.exu_div_wren         := divider_new1.io.valid_out
  }
  if(DIV_NEW & DIV_BIT==2) {
    val divider_new2 = Module(new exu_div_new_2bit_fullshortq())
    divider_new2.io.scan_mode    := io.scan_mode
    divider_new2.io.cancel       := io.dec_div.dec_div_cancel
    divider_new2.io.valid_in     := io.dec_div.div_p.valid
    divider_new2.io.signed_in    := ~io.dec_div.div_p.bits.unsign
    divider_new2.io.rem_in       := io.dec_div.div_p.bits.rem
    divider_new2.io.dividend_in  := io.dividend
    divider_new2.io.divisor_in   := io.divisor
    out_raw                 := divider_new2.io.data_out
    io.exu_div_wren         := divider_new2.io.valid_out
  }
  if(DIV_NEW & DIV_BIT==3) {
    val divider_new3 = Module(new exu_div_new_3bit_fullshortq())
    divider_new3.io.scan_mode    := io.scan_mode
    divider_new3.io.cancel       := io.dec_div.dec_div_cancel
    divider_new3.io.valid_in     := io.dec_div.div_p.valid
    divider_new3.io.signed_in    := ~io.dec_div.div_p.bits.unsign
    divider_new3.io.rem_in       := io.dec_div.div_p.bits.rem
    divider_new3.io.dividend_in  := io.dividend
    divider_new3.io.divisor_in   := io.divisor
    out_raw                 := divider_new3.io.data_out
    io.exu_div_wren         := divider_new3.io.valid_out
  }
  if(DIV_NEW & DIV_BIT==4) {
    val divider_new4 = Module(new exu_div_new_4bit_fullshortq())
    divider_new4.io.scan_mode    := io.scan_mode
    divider_new4.io.cancel       := io.dec_div.dec_div_cancel
    divider_new4.io.valid_in     := io.dec_div.div_p.valid
    divider_new4.io.signed_in    := ~io.dec_div.div_p.bits.unsign
    divider_new4.io.rem_in       := io.dec_div.div_p.bits.rem
    divider_new4.io.dividend_in  := io.dividend
    divider_new4.io.divisor_in   := io.divisor
    out_raw                 := divider_new4.io.data_out
    io.exu_div_wren         := divider_new4.io.valid_out
  }
}
object div_main extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new exu_div_ctl()))
}
////////////////////////////////////////// OLD DIVIDER /////////////////////////////////////
class exu_div_existing_1bit_cheapshortq extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle{
    val scan_mode             = Input(Bool())
    val cancel                = Input(Bool())
    val valid_in              = Input(Bool())
    val signed_in             = Input(Bool())
    val rem_in                = Input(Bool())
    val dividend_in           = Input(UInt(32.W))
    val divisor_in            = Input(UInt(32.W))
    val data_out              = Output(UInt(32.W))
    val valid_out             = Output(UInt(1.W))
  })
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
  val a_eff_shift          = WireInit(0.U(65.W))
  val rem_correct          = WireInit(0.U(1.W))
  val valid_ff_x           = WireInit(0.U(1.W))
  val finish_ff            = WireInit(0.U(1.W))
  val smallnum_case_ff     = WireInit(0.U(1.W))
  val smallnum_ff          = WireInit(0.U(4.W))
  val smallnum_case        = WireInit(0.U(1.W))
  val count_in             = WireInit(0.U(6.W))
  val dividend_eff         = WireInit(0.U(32.W))
  val a_shift              = WireInit(0.U(33.W))
  val shortq               = WireInit(0.U(6.W))
  val valid_x = valid_ff_x & !io.cancel

  // START - short circuit logic for small numbers {{
  // small number divides - any 4b / 4b is done in 1 cycle (divisor != 0)
  // smallnum case does not cover divide by 0

  smallnum_case :=  ((q_ff(31,4) === 0.U) & (m_ff(31,4) === 0.U) & (m_ff(31,0) =/= 0.U) & !rem_ff & valid_x) |
    ((q_ff(31,0) === 0.U) & (m_ff(31,0) =/= 0.U) & !rem_ff & valid_x)

  def pat(x : List[Int], y : List[Int]) = {
    val pat_a = (0 until x.size).map(i=> if(x(i)>=0) q_ff(x(i)) else !q_ff(x(i).abs)).reduce(_&_)
    val pat_b = (0 until y.size).map(i=> if(y(i)>=0) m_ff(y(i)) else !m_ff(y(i).abs)).reduce(_&_)
    pat_a & pat_b
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
  // END   - short circuit logic for small numbers }}

  // *** Start Short Q *** {{
  val shortq_enable_ff     = WireInit(0.U(1.W))
  val short_dividend       = WireInit(0.U(33.W))
  val shortq_shift_xx      = WireInit(0.U(4.W))

  short_dividend := Cat (sign_ff & q_ff(31),q_ff(31,0))


  val a_cls = Cat(0.U(2.W),
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
  val b_cls = Cat(0.U(2.W),
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
  val shortq_shift = Cat(0.U(2.W),Fill(4,shortq_enable) & shortq_raw)
  val shortq_shift_ff = Cat(0.U(1.W),Mux1H(Seq (
    shortq_shift_xx(3).asBool -> "b11111".U,
    shortq_shift_xx(2).asBool -> "b11000".U,
    shortq_shift_xx(1).asBool -> "b10000".U,
    shortq_shift_xx(0).asBool -> "b01000".U
  )))
  // *** End   Short *** }}

  val finish     = smallnum_case | Mux(!rem_ff ,count === 32.U(6.W) ,count === 33.U(6.W))
  val div_clken  = io.valid_in | run_state | finish | finish_ff
  val run_in     = (io.valid_in | run_state) & !finish & !io.cancel
  count_in   := Fill(6,(run_state & !finish & !io.cancel & !shortq_enable)) & (count + Cat(0.U,shortq_shift_ff(4,0)) + (1.U)(6.W))
  io.valid_out  :=  finish_ff & !io.cancel
  val sign_eff   = io.signed_in & (io.divisor_in =/= 0.U(32.W))

  q_in := Mux1H(Seq(
    (!run_state).asBool -> Cat(0.U(1.W),io.dividend_in) ,
    (run_state & (valid_ff_x | shortq_enable_ff)).asBool -> (Cat(dividend_eff(31,0),!a_in(32)) << shortq_shift_ff(4,0)) ,
    (run_state & !(valid_ff_x | shortq_enable_ff)).asBool -> Cat(q_ff(31,0),!a_in(32))
  ))
  val qff_enable   =  io.valid_in | (run_state & !shortq_enable)
  dividend_eff := Mux((sign_ff & dividend_neg_ff).asBool, rvtwoscomp(q_ff(31,0)),q_ff(31,0))
  m_eff := Mux(add.asBool , m_ff, ~m_ff )
  a_eff_shift := Cat(0.U(33.W), dividend_eff) << shortq_shift_ff(4,0)
  a_eff := Mux1H(Seq(
    rem_correct.asBool -> a_ff ,
    (!rem_correct & !shortq_enable_ff).asBool -> Cat(a_ff(31,0), q_ff(32)) ,
    (!rem_correct &  shortq_enable_ff).asBool -> a_eff_shift(64,32)
  ))
  val aff_enable  =  io.valid_in | (run_state & !shortq_enable & (count =/= 33.U(6.W))) | rem_correct
  a_shift := Fill(33,run_state) & a_eff
  a_in := Fill(33,run_state) & (a_shift + m_eff + Cat(0.U(32.W),!add))
  val m_already_comp          = divisor_neg_ff & sign_ff
  // if m already complemented, then invert operation add->sub, sub->add
  add  := (a_ff(32) | rem_correct) ^ m_already_comp
  rem_correct  := (count === 33.U(6.W)) & rem_ff & a_ff(32)
  val q_ff_eff = Mux((sign_ff & (dividend_neg_ff ^ divisor_neg_ff)).asBool,rvtwoscomp(q_ff(31,0)), q_ff(31,0))
  val a_ff_eff = Mux((sign_ff & dividend_neg_ff ).asBool, rvtwoscomp(a_ff(31,0)), a_ff(31,0))

  io.data_out := Mux1H(Seq(
    smallnum_case_ff.asBool -> Cat(0.U(28.W), smallnum_ff),
    rem_ff.asBool -> a_ff_eff ,
    (!smallnum_case_ff & !rem_ff).asBool -> q_ff_eff
  ))
    valid_ff_x := rvdffe(io.valid_in & !io.cancel, div_clken,clock,io.scan_mode)
    finish_ff := rvdffe(finish & !io.cancel, div_clken,clock,io.scan_mode)
    run_state := rvdffe(run_in,div_clken,clock,io.scan_mode)
    count := rvdffe(count_in, div_clken,clock,io.scan_mode)
    dividend_neg_ff := rvdffe((io.valid_in & io.dividend_in(31)) | (!io.valid_in & dividend_neg_ff), div_clken,clock,io.scan_mode)
    divisor_neg_ff := rvdffe((io.valid_in & io.divisor_in(31)) | (!io.valid_in & divisor_neg_ff), div_clken,clock,io.scan_mode)
    sign_ff := rvdffe((io.valid_in & sign_eff) | (!io.valid_in & sign_ff), div_clken,clock,io.scan_mode)
    rem_ff := rvdffe((io.valid_in & io.rem_in) | (!io.valid_in & rem_ff), div_clken,clock,io.scan_mode)
    smallnum_case_ff := rvdffe(smallnum_case, div_clken,clock,io.scan_mode)
    smallnum_ff := rvdffe(smallnum, div_clken,clock,io.scan_mode)
    shortq_enable_ff := rvdffe(shortq_enable, div_clken,clock,io.scan_mode)
    shortq_shift_xx := rvdffe(shortq_shift, div_clken,clock,io.scan_mode)

  q_ff := rvdffe(q_in, qff_enable,clock,io.scan_mode)
  a_ff := rvdffe(a_in, aff_enable,clock,io.scan_mode)
  m_ff := rvdffe(Cat(io.signed_in & io.divisor_in(31), io.divisor_in(31,0)), io.valid_in,clock,io.scan_mode)

}
/////////////////////////////////////////////// 1 BIT FULL DIVIDER//////////////////////////////////
class exu_div_new_1bit_fullshortq extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle{
    val scan_mode             = Input(Bool())
    val cancel                = Input(Bool())
    val valid_in              = Input(Bool())
    val signed_in             = Input(Bool())
    val rem_in                = Input(Bool())
    val dividend_in           = Input(UInt(32.W))
    val divisor_in            = Input(UInt(32.W))
    val data_out              = Output(UInt(32.W))
    val valid_out             = Output(UInt(1.W))
  })
  val valid_ff             = WireInit(Bool(),init=false.B)
  val finish_ff            = WireInit(Bool(),init=false.B)
  val control_ff           = WireInit(0.U(3.W))
  val count_ff             = WireInit(0.U(7.W))
  val smallnum             = WireInit(0.U(4.W))
  val a_ff                 = WireInit(0.U(32.W))
  val b_ff                 = WireInit(0.U(33.W))
  val q_ff                 = WireInit(0.U(32.W))
  val r_ff                 = WireInit(0.U(32.W))
  val quotient_set         = WireInit(Bool(),init=false.B)
  val shortq_enable        = WireInit(Bool(),init=false.B)
  val shortq_enable_ff     = WireInit(Bool(),init=false.B)
  val by_zero_case_ff      = WireInit(Bool(),init=false.B)
  val adder_out            = WireInit(0.U(33.W))
  val ar_shifted           = WireInit(0.U(64.W))
  val shortq_shift_ff      = WireInit(0.U(5.W))
  val dividend_sign_ff     = control_ff(2)
  val divisor_sign_ff      = control_ff(1)
  val rem_ff               = control_ff(0)
  val by_zero_case         =  valid_ff & (b_ff(31,0) === 0.U)
  val smallnum_case =  ((a_ff(31,4) === 0.U) & (b_ff(31,4) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel) |
    ((a_ff(31,0) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel)
  val valid_ff_in          =  io.valid_in & !io.cancel
  val control_in           = Cat((!io.valid_in & control_ff(2)) | (io.valid_in & io.signed_in  & io.dividend_in(31)), (!io.valid_in & control_ff(1)) | (io.valid_in & io.signed_in  &  io.divisor_in(31)), (!io.valid_in & control_ff(0)) | (io.valid_in & io.rem_in))
  val running_state        = count_ff.orR() | shortq_enable_ff
  val misc_enable          =  io.valid_in | valid_ff | io.cancel | running_state | finish_ff
  val finish_raw           =  smallnum_case | by_zero_case | (count_ff === 32.U)
  val finish               = finish_raw & !io.cancel
  val count_enable         = (valid_ff | running_state) & !finish & !finish_ff & !io.cancel & !shortq_enable
  val count_in             = Fill(7,count_enable) & (count_ff + Cat(0.U(6.W),1.U) + Cat(0.U(2.W),shortq_shift_ff))
  val a_enable             =  io.valid_in | running_state
  val a_shift              =  running_state & !shortq_enable_ff
  ar_shifted               := Cat (Fill(32,dividend_sign_ff),a_ff) << shortq_shift_ff
  val b_twos_comp          =  valid_ff & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_b_sel      =  valid_ff  & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_q_sel      = !valid_ff & !rem_ff &  (dividend_sign_ff ^ divisor_sign_ff) & !by_zero_case_ff
  val b_enable             =  io.valid_in | b_twos_comp
  val rq_enable            =  io.valid_in | valid_ff | running_state
  val r_sign_sel           =  valid_ff & dividend_sign_ff & !by_zero_case
  val r_restore_sel        =  running_state & !quotient_set & !shortq_enable_ff
  val r_adder_sel          =  running_state &  quotient_set & !shortq_enable_ff
  val twos_comp_in = Mux1H(Seq (
    twos_comp_q_sel                       -> q_ff,
    twos_comp_b_sel                     -> b_ff(31,0)
  ))
  val twos_comp_out = rvtwoscomp(twos_comp_in)

  val a_in = Mux1H(Seq (
    (!a_shift & !shortq_enable_ff).asBool -> io.dividend_in,
      a_shift                             -> Cat(a_ff(30,0),0.U),
      shortq_enable_ff                    -> ar_shifted(31,0)
  ))
  val b_in = Mux1H(Seq (
    !b_twos_comp                          -> Cat(io.signed_in & io.divisor_in(31),io.divisor_in(31,0)),
     b_twos_comp                          -> Cat(!divisor_sign_ff,twos_comp_out(31,0))
  ))
  val r_in = Mux1H (Seq(
    r_sign_sel                            -> "hffffffff".U(32.W),
    r_restore_sel                         -> Cat(r_ff(30,0),a_ff(31)),
    r_adder_sel                           -> adder_out(31,0),
    shortq_enable_ff                      -> ar_shifted(63,32),
    by_zero_case                          -> a_ff
  ))
  val q_in = Mux1H (Seq(
   !valid_ff                              -> Cat(q_ff(30,0),quotient_set),
    smallnum_case                         -> Cat(0.U(28.W),smallnum),
    by_zero_case                          -> Fill(32,1.U)
))
  adder_out := Cat(r_ff,a_ff(31)) + b_ff
  quotient_set := (!adder_out(32) ^ dividend_sign_ff) | ((a_ff(30,0) === 0.U) & (adder_out === 0.U))
  io.valid_out := finish_ff & !io.cancel
  io.data_out := Mux1H(Seq(
    (!rem_ff & !twos_comp_q_sel).asBool() -> q_ff,
      rem_ff                              -> r_ff,
      twos_comp_q_sel                     -> twos_comp_out
  ))
  def pat1(x : List[Int], y : List[Int]) = {
    val pat_a = (0 until x.size).map(i=> if(x(i)>=0) a_ff(x(i)) else !a_ff(x(i).abs)).reduce(_&_)
    val pat_b = (0 until y.size).map(i=> if(y(i)>=0) b_ff(y(i)) else !b_ff(y(i).abs)).reduce(_&_)
    pat_a & pat_b
  }

  smallnum := Cat(
    pat1(List(3),List(-3, -2, -1)),

    pat1(List(3),List(-3, -2))& !b_ff(0) | pat1(List(2),List(-3, -2, -1)) | pat1(List(3, 2),List(-3, -2)),

    pat1(List(2),List(-3, -2))& !b_ff(0) | pat1(List(1),List(-3, -2, -1))    | pat1(List(3),List(-3, -1))& !b_ff(0) |
      pat1(List(3, -2),List(-3, -2, 1, 0)) | pat1(List(-3, 2, 1),List(-3, -2)) | pat1(List(3, 2),List(-3))& !b_ff(0)  |
      pat1(List(3, 2),List(-3, 2, -1))     | pat1(List(3, 1),List(-3,-1))     | pat1(List(3, 2, 1),List(-3, 2)),

    pat1(List(2, 1, 0),List(-3, -1))        | pat1(List(3, -2, 0),List(-3, 1, 0))    | pat1(List(2),List(-3, -1))& !b_ff(0)     |
      pat1(List(1),List(-3, -2))& !b_ff(0)    | pat1(List(0),List(-3, -2, -1))         | pat1(List(-3, 2, -1),List(-3, -2, 1, 0)) |
      pat1(List(-3, 2, 1),List(-3))& !b_ff(0) | pat1(List(3),List(-2, -1)) & !b_ff(0)  | pat1(List(3, -2),List(-3, 2, 1))         |
      pat1(List(-3, 2, 1),List(-3, 2, -1))    | pat1(List(-3, 2, 0),List(-3, -1))      | pat1(List(3, -2, -1),List(-3, 2, 0))     |
      pat1(List(-2, 1, 0),List(-3, -2))       | pat1(List(3, 2),List(-1)) & !b_ff(0)   | pat1(List(-3, 2, 1, 0),List(-3, 2))      |
      pat1(List(3, 2),List(3, -2))            | pat1(List(3, 1),List(3,-2,-1))         | pat1(List(3, 0),List(-2, -1))            |
      pat1(List(3, -1),List(-3, 2, 1, 0))     | pat1(List(3, 2, 1),List(3)) & !b_ff(0) | pat1(List(3, 2, 1),List(3, -1))          |
      pat1(List(3, 2, 0),List(3, -1))         | pat1(List(3, -2, 1),List(-3, 1))       | pat1(List(3, 1, 0),List(-2))             |
      pat1(List(3, 2, 1, 0),List(3))          |pat1(List(3, 1),List(-2)) & !b_ff(0))

val shortq_dividend = Cat(dividend_sign_ff,a_ff)
  val a_enc = Module(new exu_div_cls)
  a_enc.io.operand := shortq_dividend
  val dw_a_enc1 = a_enc.io.cls
  val b_enc = Module(new exu_div_cls)
  b_enc.io.operand := b_ff
  val dw_b_enc1 = b_enc.io.cls
  val dw_a_enc = Cat (0.U, dw_a_enc1)
  val dw_b_enc = Cat (0.U, dw_b_enc1)
  val dw_shortq_raw = Cat(0.U,dw_b_enc) - Cat(0.U,dw_a_enc) + 1.U(7.W)
  val shortq = Mux(dw_shortq_raw(6).asBool(),0.U,dw_shortq_raw(5,0))
  shortq_enable := valid_ff & !shortq(5) & !(shortq(4,1) ===  "b1111".U) & !io.cancel
  val shortq_shift = Mux(!shortq_enable,0.U,("b11111".U - shortq(4,0)))
  valid_ff := rvdffe(valid_ff_in, misc_enable,clock,io.scan_mode)
  control_ff   := rvdffe(control_in, misc_enable,clock,io.scan_mode)
  by_zero_case_ff := rvdffe(by_zero_case,misc_enable,clock,io.scan_mode)
  shortq_enable_ff := rvdffe(shortq_enable, misc_enable,clock,io.scan_mode)
  shortq_shift_ff := rvdffe(shortq_shift, misc_enable,clock,io.scan_mode)
  finish_ff := rvdffe(finish, misc_enable,clock,io.scan_mode)
  count_ff := rvdffe(count_in, misc_enable,clock,io.scan_mode)

  a_ff := rvdffe(a_in, a_enable,clock,io.scan_mode)
  b_ff := rvdffe(b_in, b_enable,clock,io.scan_mode)
  r_ff := rvdffe(r_in, rq_enable,clock,io.scan_mode)
  q_ff := rvdffe(q_in, rq_enable,clock,io.scan_mode)
}
/////////////////////////////////////////////// 2 BIT FULL DIVIDER//////////////////////////////////
class exu_div_new_2bit_fullshortq extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle{
    val scan_mode             = Input(Bool())
    val cancel                = Input(Bool())
    val valid_in              = Input(Bool())
    val signed_in             = Input(Bool())
    val rem_in                = Input(Bool())
    val dividend_in           = Input(UInt(32.W))
    val divisor_in            = Input(UInt(32.W))
    val data_out              = Output(UInt(32.W))
    val valid_out             = Output(UInt(1.W))
  })
  val valid_ff             = WireInit(Bool(),init=false.B)
  val finish_ff            = WireInit(Bool(),init=false.B)
  val control_ff           = WireInit(0.U(3.W))
  val count_ff             = WireInit(0.U(7.W))
  val smallnum             = WireInit(0.U(4.W))
  val a_ff                 = WireInit(0.U(32.W))
  val b_ff1                = WireInit(0.U(33.W))
  val b_ff                 = WireInit(0.U(35.W))
  val q_ff                 = WireInit(0.U(32.W))
  val r_ff                 = WireInit(0.U(32.W))
  val quotient_raw         = WireInit(0.U(4.W))
  val quotient_new         = WireInit(0.U(2.W))
  val shortq_enable        = WireInit(Bool(),init=false.B)
  val shortq_enable_ff     = WireInit(Bool(),init=false.B)
  val by_zero_case_ff      = WireInit(Bool(),init=false.B)
  val ar_shifted           = WireInit(0.U(64.W))
  val shortq_shift_ff      = WireInit(0.U(5.W))
  val valid_ff_in = io.valid_in & !io.cancel
  val control_in           = Cat((!io.valid_in & control_ff(2)) | (io.valid_in & io.signed_in  & io.dividend_in(31)), (!io.valid_in & control_ff(1)) | (io.valid_in & io.signed_in  &  io.divisor_in(31)), (!io.valid_in & control_ff(0)) | (io.valid_in & io.rem_in))
  val dividend_sign_ff     = control_ff(2)
  val divisor_sign_ff      = control_ff(1)
  val rem_ff               = control_ff(0)
  val by_zero_case         =  valid_ff & (b_ff(31,0) === 0.U)
  val smallnum_case =  ((a_ff(31,4) === 0.U) & (b_ff(31,4) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel) |
    ((a_ff(31,0) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel)
  val running_state        = count_ff.orR() | shortq_enable_ff
  val misc_enable          =  io.valid_in | valid_ff | io.cancel | running_state | finish_ff
  val finish_raw           =  smallnum_case | by_zero_case | (count_ff === 32.U)
  val finish               = finish_raw & !io.cancel
  val count_enable         = (valid_ff | running_state) & !finish & !finish_ff & !io.cancel & !shortq_enable
  val count_in             = Fill(7,count_enable) & (count_ff + Cat(0.U(5.W),2.U) + Cat(0.U(2.W),shortq_shift_ff(4,1),0.U))
  val a_enable             =  io.valid_in | running_state
  val a_shift              =  running_state & !shortq_enable_ff
  ar_shifted               := Cat (Fill(32,dividend_sign_ff),a_ff) << Cat(shortq_shift_ff(4,1),0.U)
  val b_twos_comp          =  valid_ff & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_b_sel      =  valid_ff  & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_q_sel      = !valid_ff & !rem_ff &  (dividend_sign_ff ^ divisor_sign_ff) & !by_zero_case_ff
  val b_enable             =  io.valid_in | b_twos_comp
  val rq_enable            =  io.valid_in | valid_ff | running_state
  val r_sign_sel           =  valid_ff & dividend_sign_ff & !by_zero_case
  val r_restore_sel        =  running_state & (quotient_new === 0.U) & !shortq_enable_ff
  val r_adder1_sel         =  running_state & (quotient_new === 1.U) & !shortq_enable_ff
  val r_adder2_sel         =  running_state & (quotient_new === 2.U) & !shortq_enable_ff
  val r_adder3_sel         =  running_state & (quotient_new === 3.U) & !shortq_enable_ff
  val adder1_out = Cat(r_ff(30,0),a_ff(31,30)) + b_ff(32,0)
  val adder2_out = Cat(r_ff(31,0),a_ff(31,30)) + Cat(b_ff(32,0),0.U)
  val adder3_out = Cat(r_ff(31),r_ff(31,0),a_ff(31,30)) + Cat(b_ff(33,0),0.U) + b_ff
  quotient_raw := Cat((!adder3_out(34) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder3_out === 0.U)),
    (!adder2_out(33) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder2_out === 0.U)),
    (!adder1_out(32) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder1_out === 0.U)),0.U)
  quotient_new := Cat ((quotient_raw(3) |  quotient_raw(2)) , (quotient_raw(3) |(!quotient_raw(2) & quotient_raw(1))))
  val twos_comp_in = Mux1H(Seq (
    twos_comp_q_sel                       -> q_ff,
    twos_comp_b_sel                     -> b_ff(31,0)
  ))
  val twos_comp_out = rvtwoscomp(twos_comp_in)

  val a_in = Mux1H(Seq (
    (!a_shift & !shortq_enable_ff).asBool -> io.dividend_in,
    a_shift                             -> Cat(a_ff(29,0),0.U(2.W)),
    shortq_enable_ff                    -> ar_shifted(31,0)
  ))

  val b_in = Mux1H(Seq (
    !b_twos_comp                          -> Cat(io.signed_in & io.divisor_in(31),io.divisor_in(31,0)),
    b_twos_comp                          -> Cat(!divisor_sign_ff,twos_comp_out(31,0))
  ))
  val r_in = Mux1H (Seq(
    r_sign_sel                            -> "hffffffff".U(32.W),
    r_restore_sel                         -> Cat(r_ff(29,0),a_ff(31,30)),
    r_adder1_sel                           -> adder1_out(31,0),
    r_adder2_sel                           -> adder2_out(31,0),
    r_adder3_sel                           -> adder3_out(31,0),
    shortq_enable_ff                      -> ar_shifted(63,32),
    by_zero_case                          -> a_ff
  ))
  val q_in = Mux1H (Seq(
    !valid_ff                              -> Cat(q_ff(29,0),quotient_new),
    smallnum_case                         -> Cat(0.U(28.W),smallnum),
    by_zero_case                          -> Fill(32,1.U)
  ))
  io.valid_out := finish_ff & !io.cancel
  io.data_out := Mux1H(Seq(
    (!rem_ff & !twos_comp_q_sel).asBool() -> q_ff,
    rem_ff                              -> r_ff,
    twos_comp_q_sel                     -> twos_comp_out
  ))
  def pat1(x : List[Int], y : List[Int]) = {
    val pat_a = (0 until x.size).map(i=> if(x(i)>=0) a_ff(x(i)) else !a_ff(x(i).abs)).reduce(_&_)
    val pat_b = (0 until y.size).map(i=> if(y(i)>=0) b_ff(y(i)) else !b_ff(y(i).abs)).reduce(_&_)
    pat_a & pat_b
  }
  smallnum := Cat(
    pat1(List(3),List(-3, -2, -1)),

    pat1(List(3),List(-3, -2))& !b_ff(0) | pat1(List(2),List(-3, -2, -1)) | pat1(List(3, 2),List(-3, -2)),

    pat1(List(2),List(-3, -2))& !b_ff(0) | pat1(List(1),List(-3, -2, -1))    | pat1(List(3),List(-3, -1))& !b_ff(0) |
      pat1(List(3, -2),List(-3, -2, 1, 0)) | pat1(List(-3, 2, 1),List(-3, -2)) | pat1(List(3, 2),List(-3))& !b_ff(0)  |
      pat1(List(3, 2),List(-3, 2, -1))     | pat1(List(3, 1),List(-3,-1))     | pat1(List(3, 2, 1),List(-3, 2)),

    pat1(List(2, 1, 0),List(-3, -1))        | pat1(List(3, -2, 0),List(-3, 1, 0))    | pat1(List(2),List(-3, -1))& !b_ff(0)     |
      pat1(List(1),List(-3, -2))& !b_ff(0)    | pat1(List(0),List(-3, -2, -1))         | pat1(List(-3, 2, -1),List(-3, -2, 1, 0)) |
      pat1(List(-3, 2, 1),List(-3))& !b_ff(0) | pat1(List(3),List(-2, -1)) & !b_ff(0)  | pat1(List(3, -2),List(-3, 2, 1))         |
      pat1(List(-3, 2, 1),List(-3, 2, -1))    | pat1(List(-3, 2, 0),List(-3, -1))      | pat1(List(3, -2, -1),List(-3, 2, 0))     |
      pat1(List(-2, 1, 0),List(-3, -2))       | pat1(List(3, 2),List(-1)) & !b_ff(0)   | pat1(List(-3, 2, 1, 0),List(-3, 2))      |
      pat1(List(3, 2),List(3, -2))            | pat1(List(3, 1),List(3,-2,-1))         | pat1(List(3, 0),List(-2, -1))            |
      pat1(List(3, -1),List(-3, 2, 1, 0))     | pat1(List(3, 2, 1),List(3)) & !b_ff(0) | pat1(List(3, 2, 1),List(3, -1))          |
      pat1(List(3, 2, 0),List(3, -1))         | pat1(List(3, -2, 1),List(-3, 1))       | pat1(List(3, 1, 0),List(-2))             |
      pat1(List(3, 2, 1, 0),List(3))          |pat1(List(3, 1),List(-2)) & !b_ff(0))

  val shortq_dividend = Cat(dividend_sign_ff,a_ff)
  val a_enc = Module(new exu_div_cls)
  a_enc.io.operand := shortq_dividend
  val dw_a_enc1 = a_enc.io.cls
  val b_enc = Module(new exu_div_cls)
  b_enc.io.operand := b_ff(32,0)
  val dw_b_enc1 = b_enc.io.cls
  val dw_a_enc = Cat (0.U, dw_a_enc1)
  val dw_b_enc = Cat (0.U, dw_b_enc1)
  val dw_shortq_raw = Cat(0.U,dw_b_enc) - Cat(0.U,dw_a_enc) + 1.U(7.W)
  val shortq = Mux(dw_shortq_raw(6).asBool(),0.U,dw_shortq_raw(5,0))
  shortq_enable := valid_ff & !shortq(5) & !(shortq(4,1) ===  "b1111".U) & !io.cancel
  val shortq_shift = Mux(!shortq_enable,0.U,("b11111".U - shortq(4,0)))
  b_ff := Cat(b_ff1(32),b_ff1(32),b_ff1)
  valid_ff := rvdffe(valid_ff_in, misc_enable,clock,io.scan_mode)
  control_ff   := rvdffe(control_in, misc_enable,clock,io.scan_mode)
  by_zero_case_ff := rvdffe(by_zero_case,misc_enable,clock,io.scan_mode)
  shortq_enable_ff := rvdffe(shortq_enable, misc_enable,clock,io.scan_mode)
  shortq_shift_ff := Cat(rvdffe(shortq_shift(4,1), misc_enable,clock,io.scan_mode),0.U)
  finish_ff := rvdffe(finish, misc_enable,clock,io.scan_mode)
  count_ff := rvdffe(count_in, misc_enable,clock,io.scan_mode)

  a_ff := rvdffe(a_in, a_enable,clock,io.scan_mode)
  b_ff1 := rvdffe(b_in(32,0), b_enable,clock,io.scan_mode)
  r_ff := rvdffe(r_in, rq_enable,clock,io.scan_mode)
  q_ff := rvdffe(q_in, rq_enable,clock,io.scan_mode)

}
/////////////////////////////////////////////// 3 BIT FULL DIVIDER//////////////////////////////////
class exu_div_new_3bit_fullshortq extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle{
    val scan_mode             = Input(Bool())
    val cancel                = Input(Bool())
    val valid_in              = Input(Bool())
    val signed_in             = Input(Bool())
    val rem_in                = Input(Bool())
    val dividend_in           = Input(UInt(32.W))
    val divisor_in            = Input(UInt(32.W))
    val data_out              = Output(UInt(32.W))
    val valid_out             = Output(UInt(1.W))
  })
  val valid_ff             = WireInit(Bool(),init=false.B)
  val finish_ff            = WireInit(Bool(),init=false.B)
  val control_ff           = WireInit(0.U(3.W))
  val count_ff             = WireInit(0.U(7.W))
  val smallnum             = WireInit(0.U(4.W))
  val a_ff                 = WireInit(0.U(33.W))
  val b_ff1                = WireInit(0.U(33.W))
  val b_ff                 = WireInit(0.U(37.W))
  val q_ff                 = WireInit(0.U(32.W))
  val r_ff                 = WireInit(0.U(33.W))
  val quotient_raw         = WireInit(0.U(8.W))
  val quotient_new         = WireInit(0.U(3.W))
  val shortq_enable        = WireInit(Bool(),init=false.B)
  val shortq_enable_ff     = WireInit(Bool(),init=false.B)
  val by_zero_case_ff      = WireInit(Bool(),init=false.B)
  val ar_shifted           = WireInit(0.U(66.W))
  val shortq_shift         = WireInit(0.U(5.W))
  val shortq_decode        = WireInit(0.U(5.W))
  val shortq_shift_ff      = WireInit(0.U(5.W))
  val valid_ff_in = io.valid_in & !io.cancel
  val control_in           = Cat((!io.valid_in & control_ff(2)) | (io.valid_in & io.signed_in  & io.dividend_in(31)), (!io.valid_in & control_ff(1)) | (io.valid_in & io.signed_in  &  io.divisor_in(31)), (!io.valid_in & control_ff(0)) | (io.valid_in & io.rem_in))
  val dividend_sign_ff     = control_ff(2)
  val divisor_sign_ff      = control_ff(1)
  val rem_ff               = control_ff(0)
  val by_zero_case         =  valid_ff & (b_ff(31,0) === 0.U)

  val smallnum_case =  ((a_ff(31,4) === 0.U) & (b_ff(31,4) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel) |
    ((a_ff(31,0) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel)
  val running_state        = count_ff.orR() | shortq_enable_ff
  val misc_enable          =  io.valid_in | valid_ff | io.cancel | running_state | finish_ff
  val finish_raw           =  smallnum_case | by_zero_case | (count_ff === 33.U)
  val finish               = finish_raw & !io.cancel
  val count_enable         = (valid_ff | running_state) & !finish & !finish_ff & !io.cancel & !shortq_enable
  val count_in             = Fill(7,count_enable) & (count_ff + Cat(0.U(5.W),3.U(2.W)) + Cat(0.U(2.W),shortq_shift_ff))
  val a_enable             =  io.valid_in | running_state
  val a_shift              =  running_state & !shortq_enable_ff
  ar_shifted               := Cat (Fill(33,dividend_sign_ff),a_ff) << shortq_shift_ff(4,0)
  val b_twos_comp          =  valid_ff & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_b_sel      =  valid_ff  & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_q_sel      = !valid_ff & !rem_ff &  (dividend_sign_ff ^ divisor_sign_ff) & !by_zero_case_ff
  val b_enable             =  io.valid_in | b_twos_comp
  val rq_enable            =  io.valid_in | valid_ff | running_state
  val r_sign_sel           =  valid_ff & dividend_sign_ff & !by_zero_case

  val r_adder_sel = (0 to 7 ).map(i=> (running_state & (quotient_new === i.asUInt) & !shortq_enable_ff))
  val adder1_out = Cat(r_ff(30,0),a_ff(32,30)) + b_ff(33,0)
  val adder2_out = Cat(r_ff(31,0),a_ff(32,30)) + Cat(b_ff(33,0),0.U)
  val adder3_out = Cat(r_ff(32,0),a_ff(32,30)) + Cat(b_ff(34,0),0.U) + b_ff(35,0)
  val adder4_out = Cat(r_ff(32),r_ff(32,0),a_ff(32,30)) + Cat(b_ff(34,0),0.U(2.W))
  val adder5_out = Cat(r_ff(32),r_ff(32,0),a_ff(32,30)) + Cat(b_ff(34,0),0.U(2.W)) + b_ff
  val adder6_out = Cat(r_ff(32),r_ff(32,0),a_ff(32,30)) + Cat(b_ff(34,0),0.U(2.W)) + Cat(b_ff(35,0),0.U)
  val adder7_out = Cat(r_ff(32),r_ff(32,0),a_ff(32,30)) + Cat(b_ff(34,0),0.U(2.W)) + Cat(b_ff(35,0),0.U) + b_ff
  quotient_raw := Cat((!adder7_out(36) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder7_out === 0.U)),
                     (!adder6_out(36) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder6_out === 0.U)),
                     (!adder5_out(36) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder5_out === 0.U)),
                     (!adder4_out(36) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder4_out === 0.U)),
                     (!adder3_out(35) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder3_out === 0.U)),
                     (!adder2_out(34) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder2_out === 0.U)),
                     (!adder1_out(33) ^ dividend_sign_ff) | ((a_ff(29,0) === 0.U) & (adder1_out === 0.U)), 0.U)
    quotient_new := Cat ((quotient_raw(7) |  quotient_raw(6) | quotient_raw(5) |  quotient_raw(4)),
                        (quotient_raw(7) |  quotient_raw(6) |(!quotient_raw(4) & quotient_raw(3)) |(!quotient_raw(3) & quotient_raw(2))),
                        (quotient_raw(7) |  (!quotient_raw(6) & quotient_raw(5)) | (!quotient_raw(4) & quotient_raw(3)) |(!quotient_raw(2) & quotient_raw(1))))
  val twos_comp_in = Mux1H(Seq (
    twos_comp_q_sel                       -> q_ff,
    twos_comp_b_sel                     -> b_ff(31,0)
  ))
  val twos_comp_out = rvtwoscomp(twos_comp_in)
  val a_in = Mux1H(Seq (
    (!a_shift & !shortq_enable_ff).asBool -> Cat(io.signed_in & io.dividend_in(31),io.dividend_in(31,0)),
    a_shift                             -> Cat(a_ff(29,0),0.U(3.W)),
    shortq_enable_ff                    -> ar_shifted(32,0)
  ))
  val b_in = Mux1H(Seq (
    !b_twos_comp                          -> Cat(io.signed_in & io.divisor_in(31),io.divisor_in(31,0)),
     b_twos_comp                          -> Cat(!divisor_sign_ff,twos_comp_out(31,0))
  ))
  val r_in = Mux1H (Seq(
    r_sign_sel                            -> Fill(33,1.U),
    r_adder_sel(0)                         -> Cat(r_ff(29,0),a_ff(32,30)),
    r_adder_sel(1)                           -> adder1_out(32,0),
    r_adder_sel(2)                           -> adder2_out(32,0),
    r_adder_sel(3)                           -> adder3_out(32,0),
    r_adder_sel(4)                           -> adder4_out(32,0),
    r_adder_sel(5)                           -> adder5_out(32,0),
    r_adder_sel(6)                           -> adder6_out(32,0),
    r_adder_sel(7)                           -> adder7_out(32,0),
    shortq_enable_ff                       -> ar_shifted(65,33),
    by_zero_case                           -> Cat(0.U,a_ff(31,0))
))
  val q_in = Mux1H (Seq(
   !valid_ff                              -> Cat(q_ff(28,0),quotient_new),
    smallnum_case                         -> Cat(0.U(28.W),smallnum),
    by_zero_case                          -> Fill(32,1.U)
  ))
 io.valid_out := finish_ff & !io.cancel
  io.data_out := Mux1H(Seq(
    (!rem_ff & !twos_comp_q_sel).asBool() -> q_ff,
    rem_ff                              -> r_ff(31,0),
    twos_comp_q_sel                     -> twos_comp_out
  ))
  def pat1(x : List[Int], y : List[Int]) = {
    val pat_a = (0 until x.size).map(i=> if(x(i)>=0) a_ff(x(i)) else !a_ff(x(i).abs)).reduce(_&_)
    val pat_b = (0 until y.size).map(i=> if(y(i)>=0) b_ff(y(i)) else !b_ff(y(i).abs)).reduce(_&_)
    pat_a & pat_b
  }
  smallnum := Cat(
    pat1(List(3),List(-3, -2, -1)),

    pat1(List(3),List(-3, -2))& !b_ff(0) | pat1(List(2),List(-3, -2, -1)) | pat1(List(3, 2),List(-3, -2)),

    pat1(List(2),List(-3, -2))& !b_ff(0) | pat1(List(1),List(-3, -2, -1))    | pat1(List(3),List(-3, -1))& !b_ff(0) |
      pat1(List(3, -2),List(-3, -2, 1, 0)) | pat1(List(-3, 2, 1),List(-3, -2)) | pat1(List(3, 2),List(-3))& !b_ff(0)  |
      pat1(List(3, 2),List(-3, 2, -1))     | pat1(List(3, 1),List(-3,-1))     | pat1(List(3, 2, 1),List(-3, 2)),

    pat1(List(2, 1, 0),List(-3, -1))        | pat1(List(3, -2, 0),List(-3, 1, 0))    | pat1(List(2),List(-3, -1))& !b_ff(0)     |
      pat1(List(1),List(-3, -2))& !b_ff(0)    | pat1(List(0),List(-3, -2, -1))         | pat1(List(-3, 2, -1),List(-3, -2, 1, 0)) |
      pat1(List(-3, 2, 1),List(-3))& !b_ff(0) | pat1(List(3),List(-2, -1)) & !b_ff(0)  | pat1(List(3, -2),List(-3, 2, 1))         |
      pat1(List(-3, 2, 1),List(-3, 2, -1))    | pat1(List(-3, 2, 0),List(-3, -1))      | pat1(List(3, -2, -1),List(-3, 2, 0))     |
      pat1(List(-2, 1, 0),List(-3, -2))       | pat1(List(3, 2),List(-1)) & !b_ff(0)   | pat1(List(-3, 2, 1, 0),List(-3, 2))      |
      pat1(List(3, 2),List(3, -2))            | pat1(List(3, 1),List(3,-2,-1))         | pat1(List(3, 0),List(-2, -1))            |
      pat1(List(3, -1),List(-3, 2, 1, 0))     | pat1(List(3, 2, 1),List(3)) & !b_ff(0) | pat1(List(3, 2, 1),List(3, -1))          |
      pat1(List(3, 2, 0),List(3, -1))         | pat1(List(3, -2, 1),List(-3, 1))       | pat1(List(3, 1, 0),List(-2))             |
      pat1(List(3, 2, 1, 0),List(3))          |pat1(List(3, 1),List(-2)) & !b_ff(0))

 val shortq_dividend = Cat(dividend_sign_ff,a_ff(31,0))
  val a_enc = Module(new exu_div_cls)
  a_enc.io.operand := shortq_dividend
  val dw_a_enc1 = a_enc.io.cls
 val b_enc = Module(new exu_div_cls)
  b_enc.io.operand := b_ff(32,0)
  val dw_b_enc1 = b_enc.io.cls
  val dw_a_enc = Cat (0.U, dw_a_enc1)
  val dw_b_enc = Cat (0.U, dw_b_enc1)

   val dw_shortq_raw = Cat(0.U,dw_b_enc) - Cat(0.U,dw_a_enc) + 1.U(7.W)
  val shortq = Mux(dw_shortq_raw(6).asBool(),0.U,dw_shortq_raw(5,0))
  shortq_enable := valid_ff & !shortq(5) & !(shortq(4,2) ===  "b111".U) & !io.cancel
  val list = Array(27,27,27,27,27,27,24,24,24,21,21,21,18,18,18,15,15,15,12,12,12,9,9,9,6,6,6,3,0,0,0,0)
  shortq_decode := Mux1H((31 to 0 by -1).map(i=> (shortq === i.U) -> list(i).U))
  shortq_shift := Mux(!shortq_enable,0.U,shortq_decode)
  b_ff := Cat(b_ff1(32),b_ff1(32),b_ff1(32),b_ff1(32),b_ff1)
  valid_ff := rvdffe(valid_ff_in, misc_enable,clock,io.scan_mode)
  control_ff   := rvdffe(control_in, misc_enable,clock,io.scan_mode)
  by_zero_case_ff := rvdffe(by_zero_case,misc_enable,clock,io.scan_mode)
  shortq_enable_ff := rvdffe(shortq_enable, misc_enable,clock,io.scan_mode)
  shortq_shift_ff := rvdffe(shortq_shift, misc_enable,clock,io.scan_mode)
  finish_ff := rvdffe(finish, misc_enable,clock,io.scan_mode)
  count_ff := rvdffe(count_in, misc_enable,clock,io.scan_mode)

  a_ff := rvdffe(a_in, a_enable,clock,io.scan_mode)
  b_ff1 := rvdffe(b_in(32,0), b_enable,clock,io.scan_mode)
  r_ff := rvdffe(r_in, rq_enable,clock,io.scan_mode)
  q_ff := rvdffe(q_in, rq_enable,clock,io.scan_mode)

}
/////////////////////////////////////////////// 4 BIT FULL DIVIDER//////////////////////////////////
class exu_div_new_4bit_fullshortq extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle {
    val scan_mode = Input(Bool())
    val cancel = Input(Bool())
    val valid_in = Input(Bool())
    val signed_in = Input(Bool())
    val rem_in = Input(Bool())
    val dividend_in = Input(UInt(32.W))
    val divisor_in = Input(UInt(32.W))
    val data_out = Output(UInt(32.W))
    val valid_out = Output(UInt(1.W))
  })

  val valid_ff             = WireInit(Bool(),init=false.B)
  val finish_ff            = WireInit(Bool(),init=false.B)
  val control_ff           = WireInit(0.U(3.W))
  val count_ff             = WireInit(0.U(7.W))
  val smallnum             = WireInit(0.U(4.W))
  val a_ff                 = WireInit(0.U(32.W))
  val b_ff1                = WireInit(0.U(33.W))
  val b_ff                 = WireInit(0.U(38.W))
  val q_ff                 = WireInit(0.U(32.W))
  val r_ff                 = WireInit(0.U(33.W))
  val quotient_raw         = WireInit(0.U(16.W))
  val quotient_new         = WireInit(0.U(4.W))
  val shortq_enable        = WireInit(Bool(),init=false.B)
  val shortq_enable_ff     = WireInit(Bool(),init=false.B)
  val by_zero_case_ff      = WireInit(Bool(),init=false.B)
  val ar_shifted           = WireInit(0.U(65.W))
  val shortq_shift         = WireInit(0.U(5.W))
  val shortq_decode        = WireInit(0.U(5.W))
  val shortq_shift_ff      = WireInit(0.U(5.W))
  val valid_ff_in = io.valid_in & !io.cancel
  val control_in           = Cat((!io.valid_in & control_ff(2)) | (io.valid_in & io.signed_in  & io.dividend_in(31)), (!io.valid_in & control_ff(1)) | (io.valid_in & io.signed_in  &  io.divisor_in(31)), (!io.valid_in & control_ff(0)) | (io.valid_in & io.rem_in))
  val dividend_sign_ff     = control_ff(2)
  val divisor_sign_ff      = control_ff(1)
  val rem_ff               = control_ff(0)
  val by_zero_case         =  valid_ff & (b_ff(31,0) === 0.U)

  val smallnum_case =  ((a_ff(31,4) === 0.U) & (b_ff(31,4) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel) |
    ((a_ff(31,0) === 0.U) & !by_zero_case & !rem_ff & valid_ff & !io.cancel)
  val running_state        = count_ff.orR() | shortq_enable_ff
  val misc_enable          =  io.valid_in | valid_ff | io.cancel | running_state | finish_ff
  val finish_raw           =  smallnum_case | by_zero_case | (count_ff === 32.U)
  val finish               = finish_raw & !io.cancel
  val count_enable         = (valid_ff | running_state) & !finish & !finish_ff & !io.cancel & !shortq_enable
  val count_in             = Fill(7,count_enable) & (count_ff + 4.U(7.W) + Cat(0.U(2.W),shortq_shift_ff))
  val a_enable             =  io.valid_in | running_state
  val a_shift              =  running_state & !shortq_enable_ff
  ar_shifted               := Cat (Fill(33,dividend_sign_ff),a_ff(31,0)) << shortq_shift_ff
  val b_twos_comp          =  valid_ff & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_b_sel      =  valid_ff  & !(dividend_sign_ff ^ divisor_sign_ff)
  val twos_comp_q_sel      = !valid_ff & !rem_ff &  (dividend_sign_ff ^ divisor_sign_ff) & !by_zero_case_ff
  val b_enable             =  io.valid_in | b_twos_comp
  val rq_enable            =  io.valid_in | valid_ff | running_state
  val r_sign_sel           =  valid_ff & dividend_sign_ff & !by_zero_case
  val r_adder_sel = (0 to 15 ).map(i=> (running_state & (quotient_new === i.asUInt) & !shortq_enable_ff))
  val adder1_out = Cat(r_ff(30,0),a_ff(31,28)) + b_ff(34,0)
  val adder2_out = Cat(r_ff(31,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U)
  val adder3_out = Cat(r_ff(32,0),a_ff(31,28)) + Cat(b_ff(35,0),0.U) + b_ff(36,0)
  val adder4_out  = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(35,0),0.U(2.W))
  val adder5_out  = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(35,0),0.U(2.W)) + b_ff
  val adder6_out  = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(35,0),0.U(2.W)) + Cat(b_ff(36,0),0.U)
  val adder7_out  = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(35,0),0.U(2.W)) + Cat(b_ff(36,0),0.U) + b_ff
  val adder8_out  = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W))
  val adder9_out  = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + b_ff
  val adder10_out = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + Cat(b_ff(36,0),0.U)
  val adder11_out = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + Cat(b_ff(36,0),0.U) + b_ff
  val adder12_out = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + Cat(b_ff(35,0),0.U(2.W))
  val adder13_out = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + Cat(b_ff(35,0),0.U(2.W)) + b_ff
  val adder14_out = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + Cat(b_ff(35,0),0.U(2.W)) + Cat(b_ff(36,0),0.U)
  val adder15_out = Cat(r_ff(32),r_ff(32,0),a_ff(31,28)) + Cat(b_ff(34,0),0.U(3.W)) + Cat(b_ff(35,0),0.U(2.W)) + Cat(b_ff(36,0),0.U) + b_ff

  quotient_raw := Cat(
    (!adder15_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder15_out === 0.U)),
    (!adder14_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder14_out === 0.U)),
    (!adder13_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder13_out === 0.U)),
    (!adder12_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder12_out === 0.U)),
    (!adder11_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder11_out === 0.U)),
    (!adder10_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder10_out === 0.U)),
    (!adder9_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder9_out === 0.U)),
    (!adder8_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder8_out === 0.U)),
    (!adder7_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder7_out === 0.U)),
    (!adder6_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder6_out === 0.U)),
    (!adder5_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder5_out === 0.U)),
    (!adder4_out(37) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder4_out === 0.U)),
    (!adder3_out(36) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder3_out === 0.U)),
    (!adder2_out(35) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder2_out === 0.U)),
    (!adder1_out(34) ^ dividend_sign_ff) | ((a_ff(27,0) === 0.U) & (adder1_out === 0.U)), 0.U)

  quotient_new := Cat(
    (Mux1H((8 to 14).map(i=> (quotient_raw(15,i)=== Cat(Fill(15-i,0.U),1.U)).asBool -> 1.U)) | (quotient_raw(15)===1.U)),

    ( quotient_raw(15,4) === "b000000000001".U(12.W))| ( quotient_raw(15,5) === "b00000000001".U(11.W)) | ( quotient_raw(15,6) === "b0000000001".U(10.W)) |
      ( quotient_raw(15,7) === "b000000001".U(9.W)) | ( quotient_raw(15,12)=== "b0001".U(4.W)) | ( quotient_raw(15,13)=== "b001".U(3.W)) |
      ( quotient_raw(15,14)=== "b01".U(2.W)) | ( quotient_raw(15)   === "b1".U),

    ( quotient_raw(15,2) === "b00000000000001".U(14.W))| ( quotient_raw(15,3) === "b0000000000001".U(13.W)) | ( quotient_raw(15,6) === "b0000000001".U(10.W)) |
        ( quotient_raw(15,7) === "b000000001".U(9.W)) | ( quotient_raw(15,10)=== "b000001".U(6.W)) | ( quotient_raw(15,11)=== "b00001".U(5.W)) |
        ( quotient_raw(15,14)=== "b01".U(2.W)) | ( quotient_raw(15)   === "b1".U),

    (Mux1H((1 to 13 by 2).map(i=> (quotient_raw(15,i)=== Cat(Fill(15-i,0.U),1.U)).asBool -> 1.U)) | (quotient_raw(15)===1.U) ))
  val twos_comp_in = Mux1H(Seq (
    twos_comp_q_sel                       -> q_ff,
    twos_comp_b_sel                     -> b_ff(31,0)
  ))
  val twos_comp_out = rvtwoscomp(twos_comp_in)
  val a_in = Mux1H(Seq (
    (!a_shift & !shortq_enable_ff).asBool -> io.dividend_in(31,0),
     a_shift                             -> Cat(a_ff(27,0),0.U(4.W)),
     shortq_enable_ff                    -> ar_shifted(31,0)
  ))
 val b_in = Mux1H(Seq (
    !b_twos_comp                          -> Cat(io.signed_in & io.divisor_in(31),io.divisor_in(31,0)),
    b_twos_comp                          -> Cat(!divisor_sign_ff,twos_comp_out(31,0))
  ))
    val r_in = Mux1H (Seq(
    r_sign_sel                            -> Fill(33,1.U),
    r_adder_sel(0)                        -> Cat(r_ff(28,0),a_ff(31,28)),
    r_adder_sel(1)                        -> adder1_out(32,0),
    r_adder_sel(2)                        -> adder2_out(32,0),
    r_adder_sel(3)                        -> adder3_out(32,0),
    r_adder_sel(4)                        -> adder4_out(32,0),
    r_adder_sel(5)                        -> adder5_out(32,0),
    r_adder_sel(6)                        -> adder6_out(32,0),
    r_adder_sel(7)                        -> adder7_out(32,0),
    r_adder_sel(8)                        -> adder8_out(32,0),
    r_adder_sel(9)                        -> adder9_out(32,0),
    r_adder_sel(10)                       -> adder10_out(32,0),
    r_adder_sel(11)                       -> adder11_out(32,0),
    r_adder_sel(12)                       -> adder12_out(32,0),
    r_adder_sel(13)                       -> adder13_out(32,0),
    r_adder_sel(14)                       -> adder14_out(32,0),
    r_adder_sel(15)                       -> adder15_out(32,0),
    shortq_enable_ff                      -> ar_shifted(64,32),
    by_zero_case                          -> Cat(0.U,a_ff(31,0))
  ))
  val q_in = Mux1H (Seq(
    !valid_ff                              -> Cat(q_ff(27,0),quotient_new),
    smallnum_case                         -> Cat(0.U(28.W),smallnum),
    by_zero_case                          -> Fill(32,1.U)
  ))
  io.valid_out := finish_ff & !io.cancel
  io.data_out := Mux1H(Seq(
    (!rem_ff & !twos_comp_q_sel).asBool() -> q_ff,
    rem_ff                              -> r_ff(31,0),
    twos_comp_q_sel                     -> twos_comp_out
  ))
    def pat1(x : List[Int], y : List[Int]) = {
    val pat_a = (0 until x.size).map(i=> if(x(i)>=0) a_ff(x(i)) else !a_ff(x(i).abs)).reduce(_&_)
    val pat_b = (0 until y.size).map(i=> if(y(i)>=0) b_ff(y(i)) else !b_ff(y(i).abs)).reduce(_&_)
    pat_a & pat_b
  }
  smallnum := Cat(
    pat1(List(3),List(-3, -2, -1)),

    pat1(List(3),List(-3, -2))& !b_ff(0) | pat1(List(2),List(-3, -2, -1)) | pat1(List(3, 2),List(-3, -2)),

    pat1(List(2),List(-3, -2))& !b_ff(0) | pat1(List(1),List(-3, -2, -1))    | pat1(List(3),List(-3, -1))& !b_ff(0) |
      pat1(List(3, -2),List(-3, -2, 1, 0)) | pat1(List(-3, 2, 1),List(-3, -2)) | pat1(List(3, 2),List(-3))& !b_ff(0)  |
      pat1(List(3, 2),List(-3, 2, -1))     | pat1(List(3, 1),List(-3,-1))     | pat1(List(3, 2, 1),List(-3, 2)),

    pat1(List(2, 1, 0),List(-3, -1))        | pat1(List(3, -2, 0),List(-3, 1, 0))    | pat1(List(2),List(-3, -1))& !b_ff(0)     |
      pat1(List(1),List(-3, -2))& !b_ff(0)    | pat1(List(0),List(-3, -2, -1))         | pat1(List(-3, 2, -1),List(-3, -2, 1, 0)) |
      pat1(List(-3, 2, 1),List(-3))& !b_ff(0) | pat1(List(3),List(-2, -1)) & !b_ff(0)  | pat1(List(3, -2),List(-3, 2, 1))         |
      pat1(List(-3, 2, 1),List(-3, 2, -1))    | pat1(List(-3, 2, 0),List(-3, -1))      | pat1(List(3, -2, -1),List(-3, 2, 0))     |
      pat1(List(-2, 1, 0),List(-3, -2))       | pat1(List(3, 2),List(-1)) & !b_ff(0)   | pat1(List(-3, 2, 1, 0),List(-3, 2))      |
      pat1(List(3, 2),List(3, -2))            | pat1(List(3, 1),List(3,-2,-1))         | pat1(List(3, 0),List(-2, -1))            |
      pat1(List(3, -1),List(-3, 2, 1, 0))     | pat1(List(3, 2, 1),List(3)) & !b_ff(0) | pat1(List(3, 2, 1),List(3, -1))          |
      pat1(List(3, 2, 0),List(3, -1))         | pat1(List(3, -2, 1),List(-3, 1))       | pat1(List(3, 1, 0),List(-2))             |
      pat1(List(3, 2, 1, 0),List(3))          |pat1(List(3, 1),List(-2)) & !b_ff(0))


  val shortq_dividend = Cat(dividend_sign_ff,a_ff(31,0))
  val a_enc = Module(new exu_div_cls)
  a_enc.io.operand := shortq_dividend
  val dw_a_enc1 = a_enc.io.cls
  val b_enc = Module(new exu_div_cls)
  b_enc.io.operand := b_ff(32,0)
  val dw_b_enc1 = b_enc.io.cls
  val dw_a_enc = Cat (0.U, dw_a_enc1)
  val dw_b_enc = Cat (0.U, dw_b_enc1)
  val dw_shortq_raw = Cat(0.U,dw_b_enc) - Cat(0.U,dw_a_enc) + 1.U(7.W)
  val shortq = Mux(dw_shortq_raw(6).asBool(),0.U,dw_shortq_raw(5,0))
  shortq_enable := valid_ff & !shortq(5) & !(shortq(4,2) ===  "b111".U) & !io.cancel
  val list = Array(28,28,28,28,24,24,24,24,20,20,20,20,16,16,16,16,12,12,12,12,8,8,8,8,4,4,4,4,0,0,0,0)
  shortq_decode := Mux1H((31 to 0 by -1).map(i=> (shortq === i.U) -> list(i).U))
  shortq_shift := Mux(!shortq_enable,0.U,shortq_decode)
  b_ff := Cat(b_ff1(32),b_ff1(32),b_ff1(32),b_ff1(32),b_ff1(32),b_ff1)
  valid_ff := rvdffe(valid_ff_in, misc_enable,clock,io.scan_mode)
  control_ff   := rvdffe(control_in, misc_enable,clock,io.scan_mode)
  by_zero_case_ff := rvdffe(by_zero_case,misc_enable,clock,io.scan_mode)
  shortq_enable_ff := rvdffe(shortq_enable, misc_enable,clock,io.scan_mode)
  shortq_shift_ff := rvdffe(shortq_shift, misc_enable,clock,io.scan_mode)
  finish_ff := rvdffe(finish, misc_enable,clock,io.scan_mode)
  count_ff := rvdffe(count_in, misc_enable,clock,io.scan_mode)

  a_ff := rvdffe(a_in, a_enable,clock,io.scan_mode)
  b_ff1 := rvdffe(b_in(32,0), b_enable,clock,io.scan_mode)
  r_ff := rvdffe(r_in, rq_enable,clock,io.scan_mode)
  q_ff := rvdffe(q_in, rq_enable,clock,io.scan_mode)

}
class exu_div_cls extends Module{
  val io= IO(new Bundle{
    val operand = Input(UInt(33.W))
    val cls     = Output(UInt(5.W))
  })
  val cls_zeros = WireInit(0.U(5.W))
  val cls_ones  = WireInit(0.U(5.W))

  cls_zeros := Mux1H((0 until 32).map(i=> (io.operand(31,31-i)===1.U)->i.U))

  when(io.operand(31,0) === "hffffffff".U) { cls_ones := 31.U}
    .otherwise{cls_ones := Mux1H((1 until 32).map(i=> (io.operand(31,31-i) === Cat(Fill(i,1.U),0.U)).asBool -> (i-1).U ))}
  io.cls := Mux(io.operand(32),cls_ones,cls_zeros)
}