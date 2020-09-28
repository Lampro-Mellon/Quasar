package ifu

import chisel3._
import chisel3.util._

class el2_ifu_compress_ctl extends Module {
  val io = IO(new Bundle{
    val din = Input(UInt(16.W))
    val dout = Output(UInt(32.W))
    val l1 = Output(UInt(32.W))
    val l2 = Output(UInt(32.W))
    val l3 = Output(UInt(32.W))
    val legal = Output(Bool())
    val o = Output(UInt(32.W))
    //val test = Output(Bool())
  })

  //io.dout := (0 until 32).map(i=> 0.U.asBool)

  def pat(y : List[Int]) = (0 until y.size).map(i=> if(y(i)>=0) io.din(y(i)) else !io.din(y(i).abs)).reduce(_&_)
  val out = Wire(Vec(32, UInt(1.W)))
  out := (0 until 32).map(i=> 0.U.asBool)
  out(30) := pat(List(15, -14, -13, 10, -6, -5, 0)) | pat(List(15, -14, -13, -11, 10, 0))
  out(20) := pat(List(-14, 12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, 1))
  out(14) := pat(List(15, -14, -13, -11, 0)) | pat(List(15, -14, -13, -10, 0)) |  pat(List(15, -14, -13, 6, 0)) |
  pat(List(15, -14, -13, 5, 0))
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
  out(2) := pat(List(-14, 12, 11, -6, -5, -4, -3, -2, 1)) |
            pat(List(-14, 12, 10, -6, -5, -4, -3, -2, 1)) |
            pat(List(-14, 12, 9, -6, -5, -4, -3, -2, 1)) |
            pat(List(-14, 12, 8, -6,-5,-4, -3, -2,1)) |
            pat(List(-14, 12, 7, -6, -5, -4, -3, -2,1)) |
            (pat(List(15, -14,-12, -6, -5, -4, -3, -2))&(!io.din(0))) |
            pat(List(-15,13,-8)) |
            pat(List(-15,13,7)) |
            pat(List(-15,13,9)) |
            pat(List(-15,13,10)) |
            pat(List(-15,13,11)) |
            pat(List(-14,13))
  out(1) := 1.U.asBool
  out(0) := 1.U.asBool





  val rs2d = io.din(6,2)
  val rdd = io.din(11,7)
  val rdpd = Cat(1.U(2.W), io.din(9,7))
  val rs2pd = Cat(1.U(2.W), io.din(4,2))

  val rdrd = pat(List(-14,6,1)) | pat(List(-15,14,11,0)) | pat(List(-14,5,1)) | pat(List(-15,14,10,0)) |
    pat(List(-14,4,1)) | pat(List(-15,14,9,0)) | pat(List(-14,3,1)) | pat(List(-15,14,-8,0)) |
  pat(List(-14,2,1)) | pat(List(-15,14,7,0)) | pat(List(-15,1)) | pat(List(-15,-13,0))

  val rdrs1 = pat(List(-14,12,11,1)) | pat(List(-14,12,10,1)) | pat(List(-14,12,9,1)) | pat(List(-14,12,8,1)) |
    pat(List(-14,12,7,1)) | pat(List(-14,-12,-6,-5,-4,-3,-2,1)) | pat(List(-14,12,6,1)) | pat(List(-14,12,5,1)) |
    pat(List(-14,12,4,1)) | pat(List(-14,12,3,1)) | pat(List(-14,12,2,1)) | pat(List(-15,-14,-13,0))

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
  val sluimm17_12 = pat(List(-15,14,13,7)) | pat(List(-15,14,13,-8)) | pat(List(-15,14,13,9)) |
    pat(List(-15,14,13,10)) | pat(List(-15,14,13,11))
  val uimm5_0 = pat(List(15,-14,-13,-11,0)) | pat(List(-15,-14,1))
  val uswimm6_2 = pat(List(15,-1))&(!io.din(0))
  val uswspimm7_2 = pat(List(15,14,1))

  val l1_6 = VecInit(out(6),out(5),out(4),out(3),out(2),out(1),out(0)).asUInt()
  val l1_11 = VecInit(out(11),out(10),out(9),out(8),out(7)).asUInt | Mux1H(Seq(rdrd.asBool->rdd,
  rdprd.asBool->rdpd, rs2prd.asBool->rs2pd, rdeq1.asBool->1.U(5.W), rdeq2.asBool->2.U(5.W)))

  val l1_14 = Cat(out(14),out(13),out(12))
  val l1_19 = VecInit(out(19),out(18),out(17),out(16),out(15)).asUInt | Mux1H(Seq(rdrs1.asBool->rdd,
    rdprs1.asBool->rdpd, rs1eq2.asBool->2.U(5.W)))
  val l1_24 = VecInit(out(24),out(23),out(22),out(21),out(20)).asUInt | Mux1H(Seq(rs2rs2.asBool->rs2d,
    rs2prs2.asBool->rs2pd))
  val l1_31 = VecInit(out(31),out(30),out(29),out(28),out(27),out(26),out(25)).asUInt
  val l1 = Cat(l1_31,l1_24,l1_19,l1_14,l1_11,l1_6)

  val simm5d = Cat(io.din(12), io.din(6,2))
  val uimm9d = Cat(io.din(10,7), io.din(12,11), io.din(5), io.din(6))
  val simm9d = Cat(io.din(12), io.din(4,3), io.din(5), io.din(2), io.din(6))
  val ulwimm6d = Cat(io.din(5), io.din(12,10), io.din(6))
  val ulwspimm7d = Cat(io.din(3,2), io.din(12), io.din(6,4))
  val uimm5d = Cat(io.din(12), io.din(6,2))
  val sjald_1 = Cat(io.din(12), io.din(8), io.din(10,9), io.din(6), io.din(7), io.din(2), io.din(11),
    io.din(5,4), io.din(3))
  val sjald_12 = Fill(9, io.din(12))
  val sjald = Cat(sjald_12,sjald_1)
  val sluimmd = Cat(Fill(15, io.din(12)), io.din(6,2))
  val l2_31 = l1(31,20) |
    Mux1H(Seq(simm5_0.asBool->Cat(Fill(7, simm5d(5)),simm5d(4,0)),
              uimm9_2.asBool->Cat(0.U(2.W),uimm9d,0.U(2.W)),
              simm9_4.asBool->Cat(Fill(3, simm9d(5)),simm9d(4,0),0.U(4.W)),
              ulwimm6_2.asBool->Cat(0.U(5.W),ulwimm6d,0.U(2.W)),
              ulwspimm7_2.asBool->Cat(0.U(4.W),ulwspimm7d,0.U(2.W)),
              uimm5_0.asBool->Cat(0.U(6.W),uimm5d),
              sjaloffset11_1->Cat(sjald(19),sjald(9,0),sjald(10)),
              sluimm17_12->sluimmd(19,8)))

  val l2_19 = l1(19,12) | Mux1H(Seq(sjaloffset11_1.asBool->sjald(19,11),
    sluimm17_12.asBool->sluimmd(7,0)))
  val l2 = Cat(l2_31, l2_19, l1(11,0))
  val sbr8d = Cat(io.din(12),io.din(6),io.din(5),io.din(2),io.din(11),io.din(10),io.din(4),io.din(3),0.U)
  val uswimm6d = Cat(io.din(5), io.din(12,10), io.din(6), 0.U(2.W))
  val uswspimm7d = Cat(io.din(8,7),io.din(12,9), 0.U(2.W))
  val l3_31 = l2(31,25) | Mux1H(Seq(sbroffset8_1.asBool->Cat(Fill(4,sbr8d(8)),sbr8d(7,5)),
    uswimm6_2.asBool->Cat(0.U(5.W),uswimm6d(6,5)),
    uswspimm7_2.asBool->Cat(0.U(4.W),uswspimm7d(7,5))))
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

  io.dout:= l3 & Fill(32, legal)
  io.l1 := l1
  io.l2 := l2
  io.l3 := l3
  io.legal := legal
  io.o := out.reverse.reduce(Cat(_,_))
}
/*
class ExpandedInstruction extends Bundle {
  val bits = UInt(32.W)
  val rd = UInt(5.W)
  val rs1 = UInt(5.W)
  val rs2 = UInt(5.W)
  val rs3 = UInt(5.W)
}

class RVCDecoder(x: UInt, xLen: Int) {
  def inst(bits: UInt, rd: UInt = x(11,7), rs1: UInt = x(19,15), rs2: UInt = x(24,20), rs3: UInt = x(31,27)) = {
    val res = Wire(new ExpandedInstruction)
    res.bits := bits
    res.rd := rd
    res.rs1 := rs1
    res.rs2 := rs2
    res.rs3 := rs3
    res
  }

  def rs1p = Cat(1.U(2.W), x(9,7))
  def rs2p = Cat(1.U(2.W), x(4,2))
  def rs2 = x(6,2)
  def rd = x(11,7)
  def addi4spnImm = Cat(x(10,7), x(12,11), x(5), x(6), 0.U(2.W))
  def lwImm = Cat(x(5), x(12,10), x(6), 0.U(2.W))
  def ldImm = Cat(x(6,5), x(12,10), 0.U(3.W))
  def lwspImm = Cat(x(3,2), x(12), x(6,4), 0.U(2.W))
  def ldspImm = Cat(x(4,2), x(12), x(6,5), 0.U(3.W))
  def swspImm = Cat(x(8,7), x(12,9), 0.U(2.W))
  def sdspImm = Cat(x(9,7), x(12,10), 0.U(3.W))
  def luiImm = Cat(Fill(15, x(12)), x(6,2), 0.U(12.W))
  def addi16spImm = Cat(Fill(3, x(12)), x(4,3), x(5), x(2), x(6), 0.U(4.W))
  def addiImm = Cat(Fill(7, x(12)), x(6,2))
  def jImm = Cat(Fill(10, x(12)), x(8), x(10,9), x(6), x(7), x(2), x(11), x(5,3), 0.U(1.W))
  def bImm = Cat(Fill(5, x(12)), x(6,5), x(2), x(11,10), x(4,3), 0.U(1.W))
  def shamt = Cat(x(12), x(6,2))
  def x0 = 0.U(5.W)
  def ra = 1.U(5.W)
  def sp = 2.U(5.W)

  def q0 = {
    def addi4spn = {
      val opc = Mux(x(12,5).orR, 0x13.U(7.W), 0x1F.U(7.W))
      inst(Cat(addi4spnImm, sp, 0.U(3.W), rs2p, opc), rs2p, sp, rs2p)
    }
    def ld = inst(Cat(ldImm, rs1p, 3.U(3.W), rs2p, 0x03.U(7.W)), rs2p, rs1p, rs2p)
    def lw = inst(Cat(lwImm, rs1p, 2.U(3.W), rs2p, 0x03.U(7.W)), rs2p, rs1p, rs2p)
    def fld = inst(Cat(ldImm, rs1p, 3.U(3.W), rs2p, 0x07.U(7.W)), rs2p, rs1p, rs2p)
    def flw = {
      if (xLen == 32) inst(Cat(lwImm, rs1p, 2.U(3.W), rs2p, 0x07.U(7.W)), rs2p, rs1p, rs2p)
      else ld
    }
    def unimp = inst(Cat(lwImm >> 5, rs2p, rs1p, 2.U(3.W), lwImm(4,0), 0x3F.U(7.W)), rs2p, rs1p, rs2p)
    def sd = inst(Cat(ldImm >> 5, rs2p, rs1p, 3.U(3.W), ldImm(4,0), 0x23.U(7.W)), rs2p, rs1p, rs2p)
    def sw = inst(Cat(lwImm >> 5, rs2p, rs1p, 2.U(3.W), lwImm(4,0), 0x23.U(7.W)), rs2p, rs1p, rs2p)
    def fsd = inst(Cat(ldImm >> 5, rs2p, rs1p, 3.U(3.W), ldImm(4,0), 0x27.U(7.W)), rs2p, rs1p, rs2p)
    def fsw = {
      if (xLen == 32) inst(Cat(lwImm >> 5, rs2p, rs1p, 2.U(3.W), lwImm(4,0), 0x27.U(7.W)), rs2p, rs1p, rs2p)
      else sd
    }
    Seq(addi4spn, fld, lw, flw, unimp, fsd, sw, fsw)
  }

  def q1 = {
    def addi = inst(Cat(addiImm, rd, 0.U(3.W), rd, 0x13.U(7.W)), rd, rd, rs2p)
    def addiw = {
      val opc = Mux(rd.orR, 0x1B.U(7.W), 0x1F.U(7.W))
      inst(Cat(addiImm, rd, 0.U(3.W), rd, opc), rd, rd, rs2p)
    }
    def jal = {
      if (xLen == 32) inst(Cat(jImm(20), jImm(10,1), jImm(11), jImm(19,12), ra, 0x6F.U(7.W)), ra, rd, rs2p)
      else addiw
    }
    def li = inst(Cat(addiImm, x0, 0.U(3.W), rd, 0x13.U(7.W)), rd, x0, rs2p)
    def addi16sp = {
      val opc = Mux(addiImm.orR, 0x13.U(7.W), 0x1F.U(7.W))
      inst(Cat(addi16spImm, rd, 0.U(3.W), rd, opc), rd, rd, rs2p)
    }
    def lui = {
      val opc = Mux(addiImm.orR, 0x37.U(7.W), 0x3F.U(7.W))
      val me = inst(Cat(luiImm(31,12), rd, opc), rd, rd, rs2p)
      Mux(rd === x0 || rd === sp, addi16sp, me)
    }
    def j = inst(Cat(jImm(20), jImm(10,1), jImm(11), jImm(19,12), x0, 0x6F.U(7.W)), x0, rs1p, rs2p)
    def beqz = inst(Cat(bImm(12), bImm(10,5), x0, rs1p, 0.U(3.W), bImm(4,1), bImm(11), 0x63.U(7.W)), rs1p, rs1p, x0)
    def bnez = inst(Cat(bImm(12), bImm(10,5), x0, rs1p, 1.U(3.W), bImm(4,1), bImm(11), 0x63.U(7.W)), x0, rs1p, x0)
    def arith = {
      def srli = Cat(shamt, rs1p, 5.U(3.W), rs1p, 0x13.U(7.W))
      def srai = srli | (1 << 30).U
      def andi = Cat(addiImm, rs1p, 7.U(3.W), rs1p, 0x13.U(7.W))
      def rtype = {
        val funct = VecInit(0.U, 4.U, 6.U, 7.U, 0.U, 0.U, 2.U, 3.U)(Cat(x(12), x(6,5)))
        val sub = Mux(x(6,5) === 0.U, (1 << 30).U, 0.U)
        val opc = Mux(x(12), 0x3B.U(7.W), 0x33.U(7.W))
        Cat(rs2p, rs1p, funct, rs1p, opc) | sub
      }
      inst(VecInit(srli, srai, andi, rtype)(x(11,10)), rs1p, rs1p, rs2p)
    }
    Seq(addi, jal, li, lui, arith, j, beqz, bnez)
  }

  def q2 = {
    val load_opc = Mux(rd.orR, 0x03.U(7.W), 0x1F.U(7.W))
    def slli = inst(Cat(shamt, rd, 1.U(3.W), rd, 0x13.U(7.W)), rd, rd, rs2)
    def ldsp = inst(Cat(ldspImm, sp, 3.U(3.W), rd, load_opc), rd, sp, rs2)
    def lwsp = inst(Cat(lwspImm, sp, 2.U(3.W), rd, load_opc), rd, sp, rs2)
    def fldsp = inst(Cat(ldspImm, sp, 3.U(3.W), rd, 0x07.U(7.W)), rd, sp, rs2)
    def flwsp = {
      if (xLen == 32) inst(Cat(lwspImm, sp, 2.U(3.W), rd, 0x07.U(7.W)), rd, sp, rs2)
      else ldsp
    }
    def sdsp = inst(Cat(sdspImm >> 5, rs2, sp, 3.U(3.W), sdspImm(4,0), 0x23.U(7.W)), rd, sp, rs2)
    def swsp = inst(Cat(swspImm >> 5, rs2, sp, 2.U(3.W), swspImm(4,0), 0x23.U(7.W)), rd, sp, rs2)
    def fsdsp = inst(Cat(sdspImm >> 5, rs2, sp, 3.U(3.W), sdspImm(4,0), 0x27.U(7.W)), rd, sp, rs2)
    def fswsp = {
      if (xLen == 32) inst(Cat(swspImm >> 5, rs2, sp, 2.U(3.W), swspImm(4,0), 0x27.U(7.W)), rd, sp, rs2)
      else sdsp
    }
    def jalr = {
      val mv = inst(Cat(rs2, x0, 0.U(3.W), rd, 0x33.U(7.W)), rd, x0, rs2)
      val add = inst(Cat(rs2, rd, 0.U(3.W), rd, 0x33.U(7.W)), rd, rd, rs2)
      val jr = Cat(rs2, rd, 0.U(3.W), x0, 0x67.U(7.W))
      val reserved = Cat(jr >> 7, 0x1F.U(7.W))
      val jr_reserved = inst(Mux(rd.orR, jr, reserved), x0, rd, rs2)
      val jr_mv = Mux(rs2.orR, mv, jr_reserved)
      val jalr = Cat(rs2, rd, 0.U(3.W), ra, 0x67.U(7.W))
      val ebreak = Cat(jr >> 7, 0x73.U(7.W)) | (1 << 20).U
      val jalr_ebreak = inst(Mux(rd.orR, jalr, ebreak), ra, rd, rs2)
      val jalr_add = Mux(rs2.orR, add, jalr_ebreak)
      Mux(x(12), jalr_add, jr_mv)
    }
    Seq(slli, fldsp, lwsp, flwsp, jalr, fsdsp, swsp, fswsp)
  }

  def q3 = Seq.fill(8)(passthrough)

  def passthrough = inst(x)

  def decode = {
    val s = VecInit(q0 ++ q1 ++ q2 ++ q3)
    s(Cat(x(1,0), x(15,13)))
  }



  def changed_q0 = {
    def addi4spn = {
      val opc = Mux(x(12,5).orR, 0x13.U(7.W), 0x1F.U(7.W))
      inst(Cat(addi4spnImm, sp, 0.U(3.W), rs2p, opc), rs2p, sp, rs2p)
    }
    def ld = inst(Cat(ldImm, rs1p, 3.U(3.W), rs2p, 0x03.U(7.W)), rs2p, rs1p, rs2p)
    def lw = inst(Cat(lwImm, rs1p, 2.U(3.W), rs2p, 0x03.U(7.W)), rs2p, rs1p, rs2p)
    def fld = inst(Cat(ldImm, rs1p, 3.U(3.W), rs2p, 0x07.U(7.W)), rs2p, rs1p, rs2p)
    def flw = {
      if (xLen == 32) inst(Cat(lwImm, rs1p, 2.U(3.W), rs2p, 0x07.U(7.W)), rs2p, rs1p, rs2p)
      else ld
    }
    def unimp = inst(Cat(lwImm >> 5, rs2p, rs1p, 2.U(3.W), lwImm(4,0), 0x3F.U(7.W)), rs2p, rs1p, rs2p)
    def sd = inst(Cat(ldImm >> 5, rs2p, rs1p, 3.U(3.W), ldImm(4,0), 0x23.U(7.W)), rs2p, rs1p, rs2p)
    def sw = inst(Cat(lwImm >> 5, rs2p, rs1p, 2.U(3.W), lwImm(4,0), 0x23.U(7.W)), rs2p, rs1p, rs2p)
    def fsd = inst(Cat(ldImm >> 5, rs2p, rs1p, 3.U(3.W), ldImm(4,0), 0x27.U(7.W)), rs2p, rs1p, rs2p)
    def fsw = {
      if (xLen == 32) inst(Cat(lwImm >> 5, rs2p, rs1p, 2.U(3.W), lwImm(4,0), 0x27.U(7.W)), rs2p, rs1p, rs2p)
      else sd
    }
    addi4spn
  }

  def ret_q0 = VecInit(q0)
  def ret_q1 = q1
  def ret_q2 = q2
  def ret_q3 = q3
}

class el2_ifu_compress_ctl( val XLen: Int, val usingCompressed: Boolean) extends Module  {
  val io = IO(new Bundle {
    val din = Input(UInt(16.W))
    val dout = Output(UInt(32.W))
    //val rvc = Output(Bool())
    //val legal = Output(Bool())
    //val waleed_out = Output(UInt(32.W))
    //val q1_Out = Output(new ExpandedInstruction)
    //val q2_Out = Output(new ExpandedInstruction)
    //val q3_Out = Output(new ExpandedInstruction)
  })
  if (usingCompressed) {
    val rvc = io.din(1,0) =/= 3.U
    val inst = new RVCDecoder(Cat(Fill(16,0.U),io.din), XLen)
    val decoded = inst.decode
    io.dout := Mux(rvc, 0.U, decoded.bits)
    //io.out.rd := 0.U
    //io.out.rs1 := 0.U
    //io.out.rs2 := 0.U
    //io.out.rs3 := 0.U
    /*io.legal := (!io.in(13))&(!io.in(12))&(io.in(11))&io.in(1)&(!io.in(0)) |
      (!io.in(13))&(!io.in(12))&(io.in(6))&io.in(1)&(!io.in(0)) |
      (!io.in(15))&(!io.in(13))&io.in(11)(!io.in(1)) |
      (!io.in(13))&(!io.in(12))&io.in(5)&io.in(1)&(!io.in(0)) |
      (!io.in(13))&(!io.in(12))&io.in(10)&(!io.in(1))&io.in(0) |
      (!io.in(15))&(!io.in(13))&io.in(6)&(!io.in(1)) | io.in(15)&(!io.in(12))&(!io.in(1))&io.in(0) |
      (!io.in(13))&(!io.in(12))&io.in(9)&io.in(1)&(!io.in(0)) |
      (!io.in(12))&io.in(6)&(!io.in(1))&io.in(0) |
      (!io.in(15))&(!io.in(13))&io.in(5)&(!io.in(1)) |
      (!io.in(13))&(!io.in(12))&io.in(8)&io.in(1)&(!io.in(0)) |
      (!io.in(12))&io.in(5)&(!io.in(1))&io.in(0) |
      (!io.in(15))&(!io.in(13))&io.in(10)&(!io.in(1)) | (!io.in(13))&(!io.in(12))&io.in(7)&io.in(1)&(!io.in(0)) |
      io.in(12)&io.in(11)&(!io.in(10))&(!io.in(1))&io.in(0) | (!io.in(15))&(!io.in(13))&io.in(9)&(!io.in(1)) |
      (!io.in(13))&(!io.in(12))&io.in(4)&io.in(1)&(!io.in(0)) | io.in(13)&io.in(12)&(!io.in(1))&io.in(0) |
      (!io.in(15))&(!io.in(13))&io.in(8)&(!io.in(1)) | (!io.in(13))&(!io.in(12))&io.in(3)&io.in(1)&(!io.in(0)) |
      io.in(13)&io.in(4)&(!io.in(1))&io.in(0) | (!io.in(13))&(!io.in(12))&io.in(2)&io.in(1)&(!io.in(0)) |
      (!io.in(15))&(!io.in(13))&io.in(7)&(!io.in(1)) | io.in(13)&io.in(3)&(!io.in(1))&io.in(0) |
      io.in(13)&io.in(2)&(!io.in(1))&io.in(0) | io.in(14)&(!io.in(13))&(!io.in(1)) |
      (!io.in(14))&(!io.in(12))&(!io.in(1))&io.in(0) | io.in(15)&(!io.in(13))&io.in(12)&io.in(1)&(!io.in(0)) |
      (!io.in(15))&(!io.in(13))&(!io.in(12))&io.in(1)&(!io.in(0)) | (!io.in(15))&(!io.in(13))&io.in(12)&(!io.in(1)) |
      io.in(14)&(!io.in(13))&(!io.in(0))
    io.waleed_out := Mux(io.legal,io.out.bits,0.U)*/
  } else {
    //io.rvc := false.B
    io.dout := new RVCDecoder(io.din, XLen).passthrough
  }
}*/

object ifu_compress extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_compress_ctl()))
}
