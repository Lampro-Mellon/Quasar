package exu

import chisel3._
import chisel3.util._
import include._
import lib._


class el2_exu_mul_ctl extends Module with RequireAsyncReset with el2_lib {
  val io = IO(new Bundle{
    val scan_mode          = Input(Bool())
    val mul_p              = Flipped(Valid(new el2_mul_pkt_t ))
    val rs1_in             = Input(UInt(32.W))
    val rs2_in             = Input(UInt(32.W))
    val result_x           = Output(UInt(32.W))
  })

  val rs1_ext_in           = WireInit(SInt(33.W), 0.S)
  val rs2_ext_in           = WireInit(SInt(33.W), 0.S)
  val rs1_x                = WireInit(SInt(33.W), 0.S)
  val rs2_x                = WireInit(SInt(33.W), 0.S)
  val prod_x               = WireInit(SInt(66.W), 0.S)
  val low_x                = WireInit(0.U(1.W))

  val mul_x_enable         = io.mul_p.valid
  rs1_ext_in := Cat(io.mul_p.bits.rs1_sign & io.rs1_in(31),io.rs1_in).asSInt
  rs2_ext_in := Cat(io.mul_p.bits.rs2_sign & io.rs2_in(31),io.rs2_in).asSInt

  low_x := rvdffe (io.mul_p.bits.low, mul_x_enable.asBool,clock,io.scan_mode)
  rs1_x := rvdffe(rs1_ext_in, mul_x_enable.asBool,clock,io.scan_mode)
  rs2_x := rvdffe (rs2_ext_in, mul_x_enable.asBool,clock,io.scan_mode)

  prod_x := rs1_x  *  rs2_x
  io.result_x := Mux1H (Seq(!low_x.asBool -> prod_x(63,32), low_x.asBool -> prod_x(31,0)))
}
object mul_main extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_exu_mul_ctl()))
}
