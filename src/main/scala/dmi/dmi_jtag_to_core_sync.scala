package dmi
import chisel3._
import scala.collection._
import chisel3.util._
import include._
import lib._

class dmi_jtag_to_core_sync extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    // JTAG signals
    val rd_en = Input(UInt(1.W))// 1 bit  Read Enable from JTAG
    val wr_en = Input(UInt(1.W))// 1 bit  Write enable from JTAG

    // Processor Signals
    // val rst_n = Input(Bool())      // Core reset
    // val clk  = Input(Bool())      // Core clock
    val reg_en    = Output(UInt(1.W))  // 1 bit  Write interface bit to Processor
    val reg_wr_en = Output(UInt(1.W))  // 1 bit  Write enable to Processor
  })
  val c_rd_en    =WireInit(0.U(1.W))
  val c_wr_en    =WireInit(0.U(1.W))
  val rden       =WireInit(0.U(3.W))
  val wren       =WireInit(0.U(3.W))

  // synchronizers
  rden := RegNext(Cat(rden(1,0),io.rd_en),0.U)
  wren := RegNext(Cat(wren(1,0),io.wr_en),0.U)
  c_rd_en := rden(1) & !rden(2)
  c_wr_en := wren(1) & !wren(2)
  // Outputs
  io.reg_en     := c_wr_en | c_rd_en
  io.reg_wr_en  := c_wr_en
}
object dmijtag_main extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new dmi_jtag_to_core_sync()))
}
