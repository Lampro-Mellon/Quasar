package dec
import chisel3._
import include._
import lib._

class dec_dec_ctl extends Module with lib{
  val io = IO (new Bundle{
    val ins = Input(UInt(32.W))
    val out = Output(new dec_pkt_t)
  })

  def pattern(y : List[Int]) : UInt = {
    val pat : Array[UInt] = new Array[UInt](y.size)
    for (i <- 0 until y.size){
      pat(i) = if(y(i)>=0) io.ins(y(i)) else !io.ins(y(i).abs)
    }
    pat.reduce(_&_)
  }

  io.out.alu :=  pattern(List(30,24,23,-22,-21,-20,14,-5,4)) | pattern(List(29,-27,-24,4)) |
    pattern(List(-25,-13,-12,4)) |  pattern(List(-30,-25,13,12)) | pattern(List(27,25,14,4)) |
    pattern(List(29,27,-14,4)) | pattern(List(29,-14,5,4)) | pattern(List(-27,-25,14,4)) |
    pattern(List(30,-29,-13,4)) | pattern(List(-30,-27,-25,4)) | pattern(List(13,-5,4)) |
    pattern(List(-12,-5,4)) | pattern(List(2)) | pattern(List(6)) | pattern(List(30,24,23,22,21,20,-5,4)) |
    pattern(List(-30,29,-24,-23,22,21,20,-5,4)) | pattern(List(-30,24,-23,-22,-21,-20,-5,4))

  io.out.rs1 := pattern(List(-14,-13,-2)) | pattern(List(-13,11,-2)) | pattern(List(19,13,-2)) |
    pattern(List(-13,10,-2)) |  pattern(List(18,13,-2)) | pattern(List(-13,9,-2)) | pattern(List(17,13,-2)) |
    pattern(List(-13,8,-2)) | pattern(List(16,13,-2)) | pattern(List(-13,7,-2)) |
    pattern(List(15,13,-2)) | pattern(List(-4,-3)) | pattern(List(-6,-2))

  io.out.rs2 := pattern(List(5,-4,-2)) | pattern(List(-6,5,-2))

  io.out.imm12 := pattern(List(-4,-3,2)) | pattern(List(13,-5,4,-2)) | pattern(List(-13,-12,6,4)) | pattern(List(-12,-5,4,-2))

  io.out.rd := pattern(List(-5,-2)) | pattern(List(5,2)) | pattern(List(4))

  io.out.shimm5 := pattern(List(27,-13,12,-5,4,-2)) | pattern(List(-30,-13,12,-5,4,-2)) | pattern(List(14,-13,12,-5,4,-2))

  io.out.imm20 := pattern(List(5,3)) | pattern(List(4,2))

  io.out.pc := pattern(List(-5,-3,2)) | pattern(List(5,3))

  io.out.load := pattern(List(-5,-4,-2))

  io.out.store := pattern(List(-6,5,-4))

  io.out.lsu := pattern(List(-6,-4,-2))

  io.out.add := pattern(List(-14,-13,-12,-5,4)) | pattern(List(-5,-3,2)) | pattern(List(-30,-25,-14,-13,-12,-6,4,-2))

  io.out.sub := pattern(List(30,-14,-12,-6,5,4,-2)) | pattern(List(-29,-25,-14,13,-6,4,-2)) |
    pattern(List(27,25,14,-6,5,-2)) | pattern(List(-14,13,-5,4,-2)) | pattern(List(6,-4,-2))

  io.out.land := pattern(List(-27,-25,14,13,12,-6,-2)) | pattern(List(14,13,12,-5,-2))

  io.out.lor := pattern(List(-6,3)) | pattern(List(-29,-27,-25,14,13,-12,-6,-2)) | pattern(List(5,4,2)) |
    pattern(List(-13,-12,6,4)) | pattern(List(14,13,-12,-5,-2))

  io.out.lxor := pattern(List(-29,-27,-25,14,-13,-12,4,-2)) | pattern(List(14,-13,-12,-5,4,-2))

  io.out.sll := pattern(List(-29,-27,-25,-14,-13,12,-6,4,-2))

  io.out.sra := pattern(List(30,-29,-27,-13,12,-6,4,-2))

  io.out.srl := pattern(List(-30,-29,-27,-25,14,-13,12,-6,4,-2))

  io.out.slt := pattern(List(-29,-25,-14,13,-6,4,-2)) | pattern(List(-14,13,-5,4,-2))

  io.out.unsign := pattern(List(-27,25,14,12,-6,5,-2)) | pattern(List(-14,13,12,-5,-2)) |
    pattern(List(13,6,-4,-2)) | pattern(List(14,-5,-4)) | pattern(List(-25,-14,13,12,-6,-2)) |
    pattern(List(27,25,14,13,-6,5,-2))

  io.out.condbr := pattern(List(6,-4,-2))

  io.out.beq := pattern(List(-14,-12,6,-4,-2))

  io.out.bne := pattern(List(-14,12,6,-4,-2))

  io.out.bge := pattern(List(14,12,5,-4,-2))

  io.out.blt := pattern(List(14,-12,5,-4,-2))

  io.out.jal := pattern(List(6,2))

  io.out.by := pattern(List(-13,-12,-6,-4,-2))

  io.out.half := pattern(List(12,-6,-4,-2))

  io.out.word := pattern(List(13,-6,-4))

  io.out.csr_read := pattern(List(13,6,4)) | pattern(List(7,6,4)) | pattern(List(8,6,4)) |
    pattern(List(9,6,4)) | pattern(List(10,6,4)) | pattern(List(11,6,4))

  io.out.csr_clr := pattern(List(15,13,12,6,4)) | pattern(List(16,13,12,6,4)) |
    pattern(List(17,13,12,6,4)) | pattern(List(18,13,12,6,4)) | pattern(List(19,13,12,6,4))

  io.out.csr_set := pattern(List(15,-12,6,4)) | pattern(List(16,-12,6,4)) | pattern(List(17,-12,6,4)) |
    pattern(List(18,-12,6,4)) | pattern(List(19,-12,6,4))

  io.out.csr_write := pattern(List(-13,12,6,4))

  io.out.csr_imm := pattern(List(14,-13,6,4)) | pattern(List(15,14,6,4)) | pattern(List(16,14,6,4)) |
    pattern(List(17,14,6,4)) | pattern(List(18,14,6,4)) | pattern(List(19,14,6,4))

  io.out.presync := pattern(List(-5,3)) | pattern(List(-13,7,6,4)) | pattern(List(-13,8,6,4)) |
    pattern(List(-13,9,6,4)) | pattern(List(-13,10,6,4)) | pattern(List(-13,11,6,4)) |
    pattern(List(15,13,6,4)) | pattern(List(16,13,6,4)) | pattern(List(17,13,6,4)) |
    pattern(List(18,13,6,4)) | pattern(List(19,13,6,4))

  io.out.postsync := pattern(List(12,-5,3)) | pattern(List(-22,-13,-12,6,4)) |
    pattern(List(-13,7,6,4)) | pattern(List(-13,8,6,4)) | pattern(List(-13,9,6,4)) | pattern(List(-13,10,6,4)) |
    pattern(List(-13,11,6,4)) | pattern(List(15,13,6,4)) | pattern(List(16,13,6,4)) | pattern(List(17,13,6,4)) |
    pattern(List(18,13,6,4)) | pattern(List(19,13,6,4))

  io.out.ebreak := pattern(List(-22,20,-13,-12,6,4))

  io.out.ecall := pattern(List(-21,-20,-13,-12,6,4))

  io.out.mret := pattern(List(29,-13,-12,6,4))

  io.out.mul := pattern(List(-30,27,24,20,14,-13,12,-5,4,-2)) | pattern(List(29,27,-24,23,14,-13,12,-5,4,-2)) |
    pattern(List(29,27,-24,-20,14,-13,12,-5,4,-2)) | pattern(List(27,-25,13,-12,-6,5,4,-2)) |
    pattern(List(30,27,13,-6,5,4,-2)) | pattern(List(29,27,22,-20,14,-13,12,-5,4,-2)) |
    pattern(List(29,27,-21,20,14,-13,12,-5,4,-2)) | pattern(List(29,27,-22,21,14,-13,12,-5,4,-2)) |
    pattern(List(30,29,27,-23,14,-13,12,-5,4,-2)) | pattern(List(-30,27,23,14,-13,12,-5,4,-2)) |
    pattern(List(-30,-29,27,-25,-13,12,-6,4,-2)) | pattern(List(25,-14,-6,5,4,-2)) |
    pattern(List(30,-27,24,-14,-13,12,-5,4,-2)) | pattern(List(29,27,14,-6,5,-2))

  io.out.rs1_sign := pattern(List(-27,25,-14,13,-12,-6,5,4,-2)) | pattern(List(-27,25,-14,-13,12,-6,4,-2))

  io.out.rs2_sign := pattern(List(-27,25,-14,-13,12,-6,4,-2))

  io.out.low := pattern(List(25,-14,-13,-12,5,4,-2))

  io.out.div := pattern(List(-27,25,14,-6,5,-2))

  io.out.rem := pattern(List(-27,25,14,13,-6,5,-2))

  io.out.fence := pattern(List(-5,3))

  io.out.fence_i := pattern(List(12,-5,3))

  io.out.clz := pattern(List(30,-27,-24,-22,-21,-20,-14,-13,12,-5,4,-2))

  io.out.ctz := pattern(List(30,-27,-24,-22,20,-14,-13,12,-5,4,-2))

  io.out.pcnt := pattern(List(30,-27,-24,21,-14,-13,12,-5,4,-2))

  io.out.sext_b := pattern(List(30,-27,22,-20,-14,-13,12,-5,4,-2))

  io.out.sext_h := pattern(List(30,-27,22,20,-14,-13,12,-5,4,-2))

  io.out.slo := pattern(List(-30,29,-27,-14,-13,12,-6,4,-2))

  io.out.sro := pattern(List(-30,29,-27,14,-13,12,-6,4,-2))

  io.out.min := pattern(List(27,25,14,-12,-6,5,-2))

  io.out.max := pattern(List(27,25,14,12,-6,5,-2))

  io.out.pack := pattern(List(-30,27,-25,-13,-12,5,4,-2))

  io.out.packu := pattern(List(30,27,-13,-12,5,4,-2))

  io.out.packh := pattern(List(-30,27,-25,13,12,-6,5,-2))

  io.out.rol := pattern(List(30,-27,-14,12,-6,5,4,-2))

  io.out.ror := pattern(List(30,29,-27,14,-13,12,-6,4,-2))

  io.out.zbb := pattern(List(30,-27,-24,-14,-13,12,-5,4,-2)) | pattern(List(-30,27,14,13,12,-6,5,-2)) |
    pattern(List(30,29,-27,14,-13,12,-5,4,-2)) | pattern(List(27,-13,-12,5,4,-2)) |
    pattern(List(30,14,-13,-12,-6,5,-2)) | pattern(List(30,-27,13,-6,5,4,-2)) |
    pattern(List(30,29,-27,-6,5,4,-2)) | pattern(List(30,29,24,23,22,21,20,14,-13,12,-5,4,-2)) |
    pattern(List(-30,29,27,-24,-23,22,21,20,14,-13,12,-5,4,-2)) |
    pattern(List(-30,27,24,-23,-22,-21,-20,14,-13,12,-5,4,-2)) |
    pattern(List(30,29,24,23,-22,-21,-20,14,-13,12,-5,4,-2)) | pattern(List(27,25,14,-6,5,-2))

  io.out.sbset := pattern(List(-30,29,27,-14,-13,12,-6,4,-2))

  io.out.sbclr := pattern(List(30,-29,-14,-13,12,-6,4,-2))

  io.out.sbinv := pattern(List(30,29,27,-14,-13,12,-6,4,-2))

  io.out.sbext := pattern(List(30,-29,27,14,-13,12,-6,4,-2))

  io.out.zbs := pattern(List(29,27,-14,-13,12,-6,4,-2)) | pattern(List(30,-29,27,-13,12,-6,4,-2))

  io.out.bext := pattern(List(-30,27,-25,13,-12,-6,5,4,-2))

  io.out.bdep := pattern(List(30,27,13,-12,-6,5,4,-2))

  io.out.zbe := pattern(List(27,-25,13,-12,-6,5,4,-2))

  io.out.clmul := pattern(List(27,25,-14,-13,-6,5,4,-2))

  io.out.clmulh := pattern(List(27,-14,13,12,-6,5,-2))

  io.out.clmulr := pattern(List(27,-14,-12,-6,5,4,-2))

  io.out.zbc := pattern(List(27,25,-14,-6,5,4,-2))

  io.out.grev := pattern(List(30,29,27,14,-13,12,-6,4,-2))

  io.out.gorc := pattern(List(-30,29,27,14,-13,12,-6,4,-2))

  io.out.shfl := pattern(List(-30,-29,27,-25,-14,-13,12,-6,4,-2))

  io.out.unshfl := pattern(List(-30,-29,27,-25,14,-13,12,-6,4,-2))

  io.out.zbp := pattern(List(-30,29,-27,-13,12,-5,4,-2)) | pattern(List(-30,-29,27,-13,12,-5,4,-2)) |
    pattern(List(30,-27,13,-6,5,4,-2)) | pattern(List(27,-25,-13,-12,5,4,-2)) |
    pattern(List(30,14,-13,-12,5,4,-2)) | pattern(List(29,-27,12,-6,5,4,-2)) |
    pattern(List(-30,-29,27,-25,12,-6,5,4,-2)) | pattern(List(29,14,-13,12,-6,4,-2))

  io.out.crc32_b := pattern(List(30,-27,24,-23,-21,-20,-14,-13,12,-5,4,-2))

  io.out.crc32_h := pattern(List(30,-27,24,-23,20,-14,-13,12,-5,4,-2))

  io.out.crc32_w := pattern(List(30,-27,24,-23,21,-14,-13,12,-5,4,-2))

  io.out.crc32c_b := pattern(List(30,-27,23,-21,-20,-14,-13,12,-5 ,4,-2))

  io.out.crc32c_h := pattern(List(30,-27,23,20,-14,-13,12,-5,4,-2))

  io.out.crc32c_w := pattern(List(30,-27,23,21,-14,-13,12,-5,4,-2))

  io.out.zbr := pattern(List(30,-27,24,-14,-13,12,-5,4,-2))

  io.out.bfp := pattern(List(30,27,13,12,-6,5,-2))

  io.out.zbf := pattern(List(30,27,13,12,-6,5,-2))

  io.out.sh1add := pattern(List(29,-14,-12,-6,5,4,-2))

  io.out.sh2add := pattern(List(29,14,-13,-12,5,4,-2))

  io.out.sh3add := pattern(List(29,14,13,-6,5,-2))

  io.out.zba := pattern(List(29,-12,-6,5,4,-2))

  io.out.pm_alu := pattern(List(28,22,-13,-12,4)) | pattern(List(-30,-29,-27,-25,-6,4)) |
    pattern(List(-29,-27,-25,-13,12,-6,4)) | pattern(List(-29,-27,-25,-14,-6,4)) |
    pattern(List(13,-5,4)) | pattern(List(4,2)) | pattern(List(-12,-5,4))


  io.out.legal := pattern(List(-31,-30,-29,28,-27,-26,-25,-24,-23,22,-21,20,-19,-18,-17,-16,-15,-14,-11,-10,-9,-8,-7,6,5,4,-3,-2,1,0)) |
    pattern(List(-31,-30,29,28,-27,-26,-25,-24,-23,-22,21,-20,-19,-18,-17,-16,-15,-14,-11,-10,-9,-8,-7,6,5,4,-3,-2,1,0)) |
    pattern(List(-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-19,-18,-17,-16,-15,-14,-11,-10,-9,-8,-7,5,4,-3,-2,1,0)) |
    pattern(List(-31,29,-28,-26,-25,24,-22,-20,-6,-5,4,-3,1,0)) | pattern(List(-31,29,-28,-26,-25,24,-22,-21,-6,-5,4,-3,1,0)) |
    pattern(List(-31,29,-28,-26,-25,-23,-22,-20,-6,-5,4,-3,1,0)) | pattern(List(-31,29,-28,-26,-25,-24,-23,-21,-6,-5,4,-3,1,0)) |
    pattern(List(-31,-30,-29,-28,-26,25,13,-6,4,-3,1,0)) | pattern(List(-31,-30,-28,-26,-25,-24,-6,-5,4,-3,1,0)) |
    pattern(List(-31,-30,-28,-27,-26,-25,14,-12,-6,4,-3,1,0)) | pattern(List(-31,-30,-28,-27,-26,-25,13,-12,-6,4,-3,1,0)) |
    pattern(List(-31,-29,-28,-27,-26,-25,-13,-12,-6,4,-3,1,0)) | pattern(List(-31,-28,-27,-26,-25,14,-6,-5,4,-3,1,0)) |
    pattern(List(-31,-30,-29,-28,-26,-13,12,5,4,-3,-2,1,0)) | pattern(List(-31,-30,-29,-28,-26,14,-6,5,4,-3,1,0)) |
    pattern(List(-31,30,-28,27,-26,-25,-13,12,-6,4,-3,1,0)) | pattern(List(-31,29,-28,27,-26,-25 ,-6,-5,4,-3,1,0)) |
    pattern(List(-31,-30,-28,-27,-26,-25,-6,-5,4,-3,1,0)) | pattern(List(-31,-30,-29,-28,-27,-26,-6,5,4,-3,1,0)) |
    pattern(List(-14,-13,-12,6,5,-4,-3,1,0)) | pattern(List(-31,-29,-28,-26,-25,14,-6,5,4,-3,1,0)) |
    pattern(List(-31,29,-28,-26,-25,-13,12,5,4,-3,-2,1,0)) | pattern(List(14,6,5,-4,-3,-2,1,0)) |
    pattern(List(-14,-13,5,-4,-3,-2,1,0)) | pattern(List(-12,-6,-5,4,-3,1,0)) | pattern(List(-13,12,6,5,-3,-2,1,0)) |
    pattern(List(-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17,-16,-15,-14,-13,-11,-10,-9,-8,-7,-6,-5,-4,3,2,1,0)) |
    pattern(List(-31,-30,-29,-28,-19,-18,-17,-16,-15,-14,-13,-12,-11,-10,-9,-8,-7,-6,-5,-4,3,2,1,0)) |
    pattern(List(13,6,5,4,-3,-2,1,0)) | pattern(List(6,5,-4,3,2,1,0)) | pattern(List(-14,-12,-6,-4,-3,-2,1,0)) |
    pattern(List(-13,-6,-5,-4,-3,-2,1,0)) | pattern(List(13,-6,-5,4,-3,1,0)) | pattern(List(-6,4,-3,2,1,0))

}
object dec_dec extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new dec_dec_ctl())
}
