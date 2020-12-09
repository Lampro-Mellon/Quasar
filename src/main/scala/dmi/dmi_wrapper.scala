package dmi
import chisel3._
import chisel3.util._
import lib._

class dmi_wrapper extends BlackBox with HasBlackBoxResource{
  val io = IO(new Bundle{
    val trst_n         = Input(Bool())
    val tck            = Input(Clock())
    val tms            = Input(UInt(1.W))
    val tdi            = Input(UInt(1.W))
    val tdo            = Output(UInt(1.W))
    val tdoEnable      = Output(UInt(1.W))
    val core_rst_n     = Input(AsyncReset())
    val core_clk       = Input(Clock())
    val jtag_id        = Input(UInt(31.W))
    val rd_data        = Input(UInt(32.W))
    val reg_wr_data    = Output(UInt(32.W))
    val reg_wr_addr    = Output(UInt(7.W))
    val reg_en         = Output(UInt(1.W))
    val reg_wr_en      = Output(UInt(1.W))
    val dmi_hard_reset = Output(UInt(1.W))
  })
  addResource("/vsrc/dmi_wrapper.sv")
}
class dmi_wrapper_module extends Module{
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
  //addResource("/vsrc/dmi_wrapper.v")
  val dwrap = Module(new dmi_wrapper)
  dwrap.io <> io
}

