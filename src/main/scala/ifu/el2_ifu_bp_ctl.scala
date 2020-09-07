package ifu

import lib._
import chisel3._
import chisel3.util._

class el2_ifu_bp_ctl extends Module with el2_lib {
  val io = IO (new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(UInt())
  })
  io.out := el2_btb_tag_hash(io.in)
}

object ifu extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_bp_ctl()))
}
