package dmi
import chisel3._
import lib._

class dmi_wrapper extends Module with el2_lib {
  val io = IO(new Bundle{
    val trst_n         = Input(Bool())
    val tck            = Input(Clock())
    val tms            = Input(UInt(1.W))
    val tdi            = Input(UInt(1.W))
    val tdo            = Output(UInt(1.W))
    val tdoEnable      = Output(UInt(1.W))
    val core_rst_n     = Input(AsyncReset())
    val core_clk       = Input(Clock())
    val jtag_id        = Input(UInt(32.W))
    val rd_data        = Input(UInt(32.W))
    val reg_wr_data    = Output(UInt(32.W))
    val reg_wr_addr    = Output(UInt(7.W))
    val reg_en         = Output(UInt(1.W))
    val reg_wr_en      = Output(UInt(1.W))
    val dmi_hard_reset = Output(UInt(1.W))
  })
  val dwrap = {Module(new dmi_wrapper)}

  dwrap.io.trst_n         := io.trst_n
  dwrap.io.tck            := io.tck
  dwrap.io.tms            := io.tms
  dwrap.io.tdi            := io.tdi
  io.tdo                  := dwrap.io.tdo
  io.tdoEnable            := dwrap.io.tdoEnable
  dwrap.io.core_rst_n     := io.core_rst_n
  dwrap.io.core_clk       := io.core_clk
  dwrap.io.jtag_id        := io.jtag_id
  dwrap.io.rd_data        := io.rd_data
  io.reg_wr_data          := dwrap.io.reg_wr_data
  io.reg_wr_addr          := dwrap.io.reg_wr_addr
  io.reg_en               := dwrap.io.reg_en
  io.reg_wr_en            := dwrap.io.reg_wr_en
  io.dmi_hard_reset       := dwrap.io.dmi_hard_reset
}
object dmiwrapper_main extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new dmi_wrapper()))
}
