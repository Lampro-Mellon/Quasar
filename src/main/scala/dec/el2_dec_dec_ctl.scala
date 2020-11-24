package dec
import chisel3._
import include._
import lib._

class el2_dec_dec_ctl extends Module with el2_lib{
  val io = IO (new Bundle{
    val ins = Input(UInt(32.W))
    val out = Output(new el2_dec_pkt_t)
  })

  def pattern(y : List[Int]) : UInt = {
    val pat : Array[UInt] = new Array[UInt](y.size)
    for (i <- 0 until y.size){
      pat(i) = if(y(i)>=0) io.ins(y(i)) else !io.ins(y(i).abs)
    }
    pat.reduce(_&_)
  }

  io.out.alu := io.ins(2) | io.ins(6) | (!io.ins(25)&io.ins(4)) | (!io.ins(5)&io.ins(4))
  io.out.rs1 := pattern(List(-14,-13,-2)) | pattern(List(-13,11,-2)) |
    pattern(List(19,13,-2)) | pattern(List(-13,10,-2)) |
    pattern(List(18,13,-2)) | pattern(List(-13,9,-2)) |
    pattern(List(17,13,-2)) | pattern(List(-13,8,-2)) |
    pattern(List(16,13,-2)) | pattern(List(-13,7,-2)) |
    pattern(List(15,13,-2)) |pattern(List(-4,-3)) | pattern(List(-6,-2))
  io.out.rs2 := pattern(List(5,-4,-2)) | pattern(List(-6,5,-2))
  io.out.imm12 := pattern(List(-4,-3,2)) | pattern(List(13,-5,4,-2)) |
    pattern(List(-13,-12,6,4)) | pattern(List(-12,-5,4,-2))
  io.out.rd := (!io.ins(5) & !io.ins(2)) | (io.ins(5) & io.ins(2)) | io.ins(4)
  io.out.shimm5 := pattern(List(-13,12,-5,4,-2))
  io.out.imm20 := (io.ins(5)&io.ins(3)) | (io.ins(4)&io.ins(2))
  io.out.pc := (!io.ins(5) & !io.ins(3) & io.ins(2)) | (io.ins(5) & io.ins(3))
  io.out.load := pattern(List(-5,-4,-2))
  io.out.store := pattern(List(-6,5,-4))
  io.out.lsu := pattern(List(-6,-4,-2))
  io.out.add := pattern(List(-14,-13,-12,-5,4)) | pattern(List(-5,-3,2)) |
    pattern(List(-30,-25,-14,-13,-12,-6,4,-2))
  io.out.sub := pattern(List(30,-12,-6,5,4,-2)) | pattern(List(-25,-14,13,-6,4,-2)) |
    pattern(List(-14,13,-5,4,-2)) | pattern(List(6,-4,-2))
  io.out.land := pattern(List(14,13,12,-5,-2)) | pattern(List(-25,14,13,12,-6,-2))
  io.out.lor := pattern(List(-6,3)) | pattern(List(-25,14,13,-12,-6,-2)) |
    pattern(List(5,4,2)) | pattern(List(-13,-12,6,4)) |
    pattern(List(14,13,-12,-5,-2))
  io.out.lxor := pattern(List(-25,14,-13,-12,4,-2)) | pattern(List(14,-13,-12,-5,4,-2))
  io.out.sll := pattern(List(-25,-14,-13,12,-6,4,-2))
  io.out.sra := pattern(List(30,-13,12,-6,4,-2))
  io.out.srl := pattern(List(-30,-25,14,-13,12,-6,4,-2))
  io.out.slt := pattern(List(-25,-14,13,-6,4,-2)) | pattern(List(-14,13,-5,4,-2))
  io.out.unsign := pattern(List(-14,13,12,-5,-2)) | pattern(List(13,6,-4,-2)) |
    pattern(List(14,-5,-4)) | pattern(List(-25,-14,13,12,-6,-2)) |
    pattern(List(25,14,12,-6,5,-2))
  io.out.condbr := pattern(List(6,-4,-2))
  io.out.beq := pattern(List(-14,-12,6,-4,-2))
  io.out.bne := pattern(List(-14,12,6,-4,-2))
  io.out.bge := pattern(List(14,12,5,-4,-2))
  io.out.blt := pattern(List(14,-12,5,-4,-2))
  io.out.jal := pattern(List(6,2))
  io.out.by := pattern(List(-13,-12,-6,-4,-2))
  io.out.half := pattern(List(12,-6,-4,-2))
  io.out.word := pattern(List(13,-6,-4))
  io.out.csr_read := pattern(List(13,6,4)) | pattern(List(7,6,4)) |
    pattern(List(8,6,4)) | pattern(List(9,6,4)) | pattern(List(10,6,4)) |
    pattern(List(11,6,4))
  io.out.csr_clr := pattern(List(15,13,12,6,4)) | pattern(List(16,13,12,6,4)) |
    pattern(List(17,13,12,6,4)) | pattern(List(18,13,12,6,4)) |
    pattern(List(19,13,12,6,4))
  io.out.csr_write := pattern(List(-13,12,6,4))
  io.out.csr_imm := pattern(List(14,-13,6,4)) | pattern(List(15,14,6,4)) |
    pattern(List(16,14,6,4)) | pattern(List(17,14,6,4)) |
    pattern(List(18,14,6,4)) | pattern(List(19,14,6,4))
  io.out.csr_set := pattern(List(15,-12,6,4)) | pattern(List(16,-12,6,4)) |
    pattern(List(17,-12,6,4)) | pattern(List(18,-12,6,4)) |
    pattern(List(19,-12,6,4))
  io.out.ebreak := pattern(List(-22,20,-13,-12,6,4))
  io.out.ecall := pattern(List(-21,-20,-13,-12,6,4))
  io.out.mret := pattern(List(29,-13,-12,6,4))
  io.out.mul := pattern(List(25,-14,-6,5,4,-2))
  io.out.rs1_sign := pattern(List(25,-14,13,-12,-6,5,4,-2)) |
    pattern(List(25,-14,-13,12,-6,4,-2))
  io.out.rs2_sign := pattern(List(25,-14,-13,12,-6,4,-2))
  io.out.low := pattern(List(25,-14,-13,-12,5,4,-2))
  io.out.div := pattern(List(25,14,-6,5,-2))
  io.out.rem := pattern(List(25,14,13,-6,5,-2))
  io.out.fence := pattern(List(-5,3))
  io.out.fence_i := pattern(List(12,-5,3))
  io.out.pm_alu := pattern(List(28,22,-13,-12,4)) | pattern(List(4,2)) |
    pattern(List(-25,-6,4)) | pattern(List(-5,4))
  io.out.presync := pattern(List(-5,3)) | pattern(List(-13,7,6,4)) |
    pattern(List(-13,8,6,4)) | pattern(List(-13,9,6,4)) |
    pattern(List(-13,10,6,4)) | pattern(List(-13,11,6,4)) |
    pattern(List(15,13,6,4)) | pattern(List(16,13,6,4)) |
    pattern(List(17,13,6,4)) | pattern(List(18,13,6,4)) |
    pattern(List(19,13,6,4))
  io.out.postsync := pattern(List(12,-5,3)) | pattern(List(-22,-13,-12,6,4)) |
    pattern(List(-13,7,6,4)) | pattern(List(-13,8,6,4)) |
    pattern(List(-13,9,6,4)) | pattern(List(-13,10,6,4)) |
    pattern(List(-13,11,6,4)) | pattern(List(15,13,6,4)) |
    pattern(List(16,13,6,4)) | pattern(List(17,13,6,4)) |
    pattern(List(18,13,6,4)) | pattern(List(19,13,6,4))
  io.out.legal := pattern(List(-31,-30,29,28,-27,-26,-25,-24,-23,-22,21,-20,-19,-18,-17,-16,-15,-14,-11,-10,-9,-8,-7,6,5,4,-3,-2,1,0)) |
    pattern(List(-31,-30,-29,28,-27,-26,-25,-24,-23,22,-21,20,-19,-18,-17,-16,-15,-14,-11,-10,-9,-8,-7,6,5,4,-3,-2,1,0)) |
    pattern(List(-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-19,-18,-17,-16,-15,-14,-11,-10,-9,-8,-7,5,4,-3,-2,1,0)) |
    pattern(List(-31,-30,-29,-28,-27,-26,-25,-6,4,-3,1,0)) |
    pattern(List(-31,-29,-28,-27,-26,-25,-14,-13,-12,-6,-3,-2,1,0)) |
    pattern(List(-31,-29,-28,-27,-26,-25,14,-13,12,-6,4,-3,1,0)) |
    pattern(List(-31,-30,-29,-28,-27,-26,-6,5,4,-3,1,0)) |
    pattern(List(-14,-13,-12,6,5,-4,-3,1,0)) |
    pattern(List(14,6,5,-4,-3,-2,1,0)) |
    pattern(List(-12,-6,-5,4,-3,1,0)) |
    pattern(List(-14,-13,5,-4,-3,-2,1,0)) |
    pattern(List(12,6,5,4,-3,-2,1,0)) |
    pattern(List(-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17,-16,-15,-14,-13,-11,-10,-9,-8,-7,-6,-5,-4,3,2,1,0)) |
    pattern(List(-31,-30,-29,-28,-19,-18,-17,-16,-15,-14,-13,-12,-11,-10,-9,-8,-7,-6,-5,-4,3,2,1,0)) |
    pattern(List(13,6,5,4,-3,-2,1,0)) |
    pattern(List(-13,-6,-5,-4,-3,-2,1,0)) |
    pattern(List(6,5,-4,3,2,1,0)) |
    pattern(List(13,-6,-5,4,-3,1,0)) |
    pattern(List(-14,-12,-6,-4,-3,-2,1,0)) |
    pattern(List(-6,4,-3,2,1,0))
}

object dec_dec_ctl extends App {
  chisel3.Driver execute(args, () => new el2_dec_dec_ctl())
}
