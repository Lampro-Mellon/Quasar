package dec
import chisel3._
import chisel3.util._
class test extends Module{
val io = IO(new Bundle{
  val in = Input(UInt(3.W))
  val out = Output(UInt())
})
  io.out := Cat(io.in, "b100000000000010101".U)
}
object test extends App{
  println(chisel3.Driver.emitVerilog(new test))
}