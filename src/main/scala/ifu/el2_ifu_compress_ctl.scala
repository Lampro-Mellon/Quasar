package ifu
import lib._
import chisel3._
import chisel3.util._

class el2_ifu_compress_ctl extends Module with el2_lib{
  val io = IO(new Bundle{
    val din = Input(UInt(16.W))
    val dout = Output(UInt(32.W))
  })

  def pat(y : List[Int]) = (0 until y.size).map(i=> if(y(i)>=0) io.din(y(i)) else !io.din(y(i).abs)).reduce(_&_)

  val out = Wire(Vec(32, UInt(1.W)))
  out := (0 until 32).map(i=> 0.U.asBool)

  out(30) := pat(List(15, -14, -13, 10, -6, -5, 0)) | pat(List(15, -14, -13, -11, 10, 0))

  out(20) := pat(List(-14, 12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, 1))

  out(14) := pat(List(15, -14, -13, -11, 0)) | pat(List(15, -14, -13, -10, 0)) |  pat(List(15, -14, -13, 6, 0)) | pat(List(15, -14, -13, 5, 0))

  out(13) := pat(List(15, -14, -13, 11, -10, 0)) | pat(List(15, -14, -13, 11, 6, 0)) | (io.din(14)&(!io.din(0)))

  out(12) := pat(List(15, -14, -13, 6, 5, 0)) | pat(List(15, -14, -13, -11, 0)) | pat(List(15, -14, -13, -10, 0)) |
  pat(List(-15, -14, 1)) | pat(List(15, 14, 13))

  out(6) := (pat(List(15, -14, -6, -5, -4, -3, -2)) & !io.din(0)) | pat(List(-14, 13)) | pat(List(15, 14, 0))

  out(5) := (io.din(15)&(!io.din(0))) | pat(List(15, 11, 10)) | pat(List(13, -8)) | pat(List(13, 7)) |
    pat(List(13, 9)) | pat(List(13, 10)) | pat(List(13, 11)) | pat(List(-14, 13)) | pat(List(15, 14))

  out(4) := (pat(List(-14, -11, -10, -9, -8, -7))&(!io.din(0))) | (pat(List(-15, -14))&(!io.din(0))) |
    (pat(List(-14, 6))&(!io.din(0))) | pat(List(-15, 14, 0)) | (pat(List(-14, 5))&(!io.din(0))) |
    (pat(List(-14, 4))&(!io.din(0))) | (pat(List(-14, 3))&(!io.din(0))) | (pat(List(-14, 2))&(!io.din(0))) |
    pat(List(-14, -13, 0))

  out(3) := pat(List(-14, 13))

  out(2) := pat(List(-14, 12, 11, -6, -5, -4, -3, -2, 1)) | pat(List(-14, 12, 10, -6, -5, -4, -3, -2, 1)) |
    pat(List(-14, 12, 9, -6, -5, -4, -3, -2, 1)) | pat(List(-14, 12, 8, -6,-5,-4, -3, -2,1)) |
    pat(List(-14, 12, 7, -6, -5, -4, -3, -2,1)) | (pat(List(15, -14,-12, -6, -5, -4, -3, -2))&(!io.din(0))) |
    pat(List(-15,13,-8)) | pat(List(-15,13,7)) | pat(List(-15,13,9)) | pat(List(-15,13,10)) |
    pat(List(-15,13,11)) | pat(List(-14,13))

  out(1) := 1.U.asBool

  out(0) := 1.U.asBool

  val rs2d = io.din(6,2)
  val rdd = io.din(11,7)
  val rdpd = Cat(1.U(2.W), io.din(9,7))
  val rs2pd = Cat(1.U(2.W), io.din(4,2))

  val rdrd = pat(List(-14,6,1)) | pat(List(-15,14,11,0)) | pat(List(-14,5,1)) | pat(List(-15,14,10,0)) |
    pat(List(-14,4,1)) | pat(List(-15,14,9,0)) | pat(List(-14,3,1)) | pat(List(-15,14,-8,0)) |
  pat(List(-14,2,1)) | pat(List(-15,14,7,0)) | pat(List(-15,1)) | pat(List(-15,-13,0))

  val rdrs1 = pat(List(-14,12,11,1)) | pat(List(-14,12,10,1)) | pat(List(-14,12,9,1)) |
    pat(List(-14,12,8,1)) | pat(List(-14,12,7,1)) | pat(List(-14,-12,-6,-5,-4,-3,-2,1)) |
    pat(List(-14,12,6,1)) | pat(List(-14,12,5,1)) | pat(List(-14,12,4,1)) | pat(List(-14,12,3,1)) |
    pat(List(-14,12,2,1)) | pat(List(-15,-14,-13,0)) | pat(List(-15,-14,1))

  val rs2rs2 = pat(List(15,6,1)) | pat(List(15,5,1)) | pat(List(15,4,1)) | pat(List(15,3,1)) | pat(List(15,2,1)) | pat(List(15,14,1))

  val rdprd = pat(List(15,-14,-13,0))

  val rdprs1 = pat(List(15,-13,0)) | pat(List(15,14,0)) | (pat(List(14,-1))&(!io.din(0)))

  val rs2prs2 = pat(List(15,-14,-13,11,10,0)) | (pat(List(15,-1))&(!io.din(0)))

  val rs2prd = pat(List(-15,-1))&(!io.din(0))

  val uimm9_2 = pat(List(-14,-1))&(!io.din(0))

  val ulwimm6_2 = pat(List(-15,14,-1))&(!io.din(0))

  val ulwspimm7_2 = pat(List(-15,14,1))

  val rdeq2 = pat(List(-15,14,13,-11,-10,-9,8,-7))

  val rdeq1 = pat(List(-14,12,11,-6,-5,-4,-3,-2,1)) | pat(List(-14,12,10,-6,-5,-4,-3,-2,1)) |
    pat(List(-14,12,9,-6,-5,-4,-3,-2,1)) | pat(List(-14,12,8,-6,-5,-4,-3,-2,1)) |
    pat(List(-14,12,7,-6,-5,-4,-3,-2,1)) | pat(List(-15,-14,13))

  val rs1eq2 = pat(List(-15,14,13,-11,-10,-9,8,-7)) | pat(List(14,1)) | (pat(List(-14,-1))&(!io.din(0)))

  val sbroffset8_1 = pat(List(15,14,0))

  val simm9_4 = pat(List(-15,14,13,-11,-10,-9,8,-7))

  val simm5_0 = pat(List(-14,-13,11,-10,0)) | pat(List(-15,-13,0))

  val sjaloffset11_1 = pat(List(-14,13))

  val sluimm17_12 = pat(List(-15,14,13,7)) | pat(List(-15,14,13,-8)) | pat(List(-15,14,13,9)) | pat(List(-15,14,13,10)) | pat(List(-15,14,13,11))

  val uimm5_0 = pat(List(15,-14,-13,-11,0)) | pat(List(-15,-14,1))

  val uswimm6_2 = pat(List(15,-1))&(!io.din(0))

  val uswspimm7_2 = pat(List(15,14,1))

  val l1_6 = Cat(out(6),out(5),out(4),out(3),out(2),out(1),out(0)).asUInt()

  val l1_11 = Cat(out(11),out(10),out(9),out(8),out(7)).asUInt | Mux1H(Seq(rdrd.asBool->rdd,
  rdprd.asBool->rdpd, rs2prd.asBool->rs2pd, rdeq1.asBool->1.U(5.W), rdeq2.asBool->2.U(5.W)))

  val l1_14 = Cat(out(14),out(13),out(12))

  val l1_19 = Cat(out(19),out(18),out(17),out(16),out(15)).asUInt | Mux1H(Seq(rdrs1.asBool->rdd,
    rdprs1.asBool->rdpd, rs1eq2.asBool->2.U(5.W)))

  val l1_24 = Cat(out(24),out(23),out(22),out(21),out(20)).asUInt | Mux1H(Seq(rs2rs2.asBool->rs2d,
    rs2prs2.asBool->rs2pd))

  val l1_31 = Cat(out(31),out(30),out(29),out(28),out(27),out(26),out(25)).asUInt

  val l1 = Cat(l1_31,l1_24,l1_19,l1_14,l1_11,l1_6)

  val simm5d = Cat(io.din(12), io.din(6,2))
  val uimm9d = Cat(io.din(10,7), io.din(12,11), io.din(5), io.din(6))
  val simm9d = Cat(io.din(12), io.din(4,3), io.din(5), io.din(2), io.din(6))
  val ulwimm6d = Cat(io.din(5), io.din(12,10), io.din(6))
  val ulwspimm7d = Cat(io.din(3,2), io.din(12), io.din(6,4))
  val uimm5d = Cat(io.din(12), io.din(6,2))
  val sjald_1 = Cat(io.din(12), io.din(8), io.din(10,9), io.din(6), io.din(7), io.din(2), io.din(11),
    io.din(5,4), io.din(3))
  val sjald_12 = repl(9, io.din(12))
  val sjald = Cat(sjald_12,sjald_1)
  val sluimmd = Cat(repl(15, io.din(12)), io.din(6,2))

  val l2_31 = l1(31,20) |
    Mux1H(Seq(simm5_0.asBool->Cat(repl(7, simm5d(5)), simm5d(4,0)),
              uimm9_2.asBool->Cat(0.U(2.W), uimm9d, 0.U(2.W)),
              simm9_4.asBool->Cat(repl(3, simm9d(5)), simm9d(4,0), 0.U(4.W)),
              ulwimm6_2.asBool->Cat(0.U(5.W), ulwimm6d, 0.U(2.W)),
              ulwspimm7_2.asBool->Cat(0.U(4.W), ulwspimm7d, 0.U(2.W)),
              uimm5_0.asBool->Cat(0.U(6.W), uimm5d),
              sjaloffset11_1.asBool->Cat(sjald(19), sjald(9,0), sjald(10)),
              sluimm17_12.asBool->sluimmd(19,8)))

  val l2_19 = l1(19,12) | Mux1H(Seq(sjaloffset11_1.asBool->sjald(19,12),
                                    sluimm17_12.asBool->sluimmd(7,0)))
  val l2 = Cat(l2_31, l2_19, l1(11,0))

  val sbr8d = Cat(io.din(12),io.din(6),io.din(5),io.din(2),io.din(11),io.din(10),io.din(4),io.din(3),0.U)
  val uswimm6d = Cat(io.din(5), io.din(12,10), io.din(6), 0.U(2.W))
  val uswspimm7d = Cat(io.din(8,7),io.din(12,9), 0.U(2.W))

  val l3_31 = l2(31,25) | Mux1H(Seq(sbroffset8_1.asBool->Cat(repl(4,sbr8d(8)),sbr8d(7,5)),
    uswimm6_2.asBool->Cat(0.U(5.W),uswimm6d(6,5)), uswspimm7_2.asBool->Cat(0.U(4.W),uswspimm7d(7,5))))

  val l3_24 = l2(24,12)

  val l3_11 = l2(11,7) | Mux1H(Seq(sbroffset8_1.asBool->Cat(sbr8d(4,1), sbr8d(8)),
    uswimm6_2.asBool->uswimm6d(4,0),
    uswspimm7_2.asBool->uswspimm7d(4,0)))

  val l3 = Cat(l3_31, l3_24, l3_11, l2(6,0))

  val legal = (pat(List(-13,-12,11,1))&(!io.din(0))) | (pat(List(-13,-12,6,1))&(!io.din(0))) |
    pat(List(-15,-13,11,-1)) | (pat(List(-13,-12,5,1))&(!io.din(0))) | (pat(List(-13,-12,10,1))&(!io.din(0))) |
    pat(List(-15,-13,6,-1)) | pat(List(15,-12,-1,0)) | (pat(List(-13,-12,9,1))&(!io.din(0))) | pat(List(-12,6,-1,0)) | pat(List(-15,-13,5,-1)) |
    (pat(List(-13,-12,8,1))&(!io.din(0))) | pat(List(-12,5,-1,0)) | pat(List(-15,-13,10,-1)) |
    (pat(List(-13,-12,7,1))&(!io.din(0))) | pat(List(12,11,-10,-1,0)) | pat(List(-15,-13,9,-1)) |
    (pat(List(-13,-12,4,1))&(!io.din(0))) | pat(List(13,12,-1,0)) | pat(List(-15,-13,8,-1)) |
    (pat(List(-13,-12,3,1))&(!io.din(0))) | pat(List(13,4,-1,0)) | (pat(List(-13,-12,2,1))&(!io.din(0))) |
    pat(List(-15,-13,7,-1)) | pat(List(13,3,-1,0)) | pat(List(13,2,-1,0)) | pat(List(14,-13,-1)) |
    pat(List(-14,-12,-1,0)) | (pat(List(15,-13,12,1))&(!io.din(0))) | (pat(List(-15,-13,-12,1))&(!io.din(0))) |
    pat(List(-15,-13,12,-1)) | (pat(List(14,-13))&(!io.din(0)))

  io.dout:= l3 & repl(32, legal)
}
object compress extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_compress_ctl())
}