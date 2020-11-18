package dmi
import chisel3._
import scala.collection._
import chisel3.util._
import include._
import lib._

class dmi_wrapper extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    // JTAG signals
    val trst_n      = Input(AsyncReset())
    val tck       = Input(Clock())             // JTAG clock
    val tms       =Input(UInt(1.W))             // Test mode select
    val tdi       =Input(UInt(1.W))             // Test Data Input
    val tdo       =Output(UInt(1.W))          // Test Data Output
    val tdoEnable =Output(UInt(1.W))           // Test Data Output enable

    // Processor Signals
    // val              core_rst_n =Input(UInt(1.W))          // Core reset
    //  val              core_clk   =Input(UInt(1.W))         // Core clock
    val jtag_id        = Input(UInt(32.W))         // JTAG ID
    val rd_data        = Input(UInt(32.W))         // 32 bit Read data from  Processor
    val reg_wr_data    = Output(UInt(32.W))      // 32 bit Write data to Processor
    val reg_wr_addr    = Output(UInt(7.W))       // 7 bit reg address to Processor
    val reg_en         = Output(UInt(1.W))      // 1 bit  Read enable to Processor
    val reg_wr_en      = Output(UInt(1.W))      // 1 bit  Write enable to Processor
    val dmi_hard_reset = Output(UInt(1.W))
  })
  //Wire Declaration
  val rd_en    = WireInit(0.U(1.W))
  val wr_en    = WireInit(0.U(1.W))
  val dmireset = WireInit(0.U(1.W))

  //jtag_tap instantiation
  val  i_jtag_tap = Module(new rvjtag_tap())
  i_jtag_tap.io.trst      := io.trst_n                      // dedicated JTAG TRST (active low) pad signal or asynchronous active low power on reset
  i_jtag_tap.io.tck       := io.tck                          // dedicated JTAG TCK pad signal
  i_jtag_tap.io.tms       := io.tms                          // dedicated JTAG TMS pad signal
  i_jtag_tap.io.tdi       := io.tdi                          // dedicated JTAG TDI pad signal
  io.tdo                  := i_jtag_tap.io.tdo                          // dedicated JTAG TDO pad signal
  io.tdoEnable            := i_jtag_tap.io.tdoEnable              // enable for TDO pad
  io.reg_wr_data          := i_jtag_tap.io.wr_data              // 32 bit Write data
  io.reg_wr_addr          := i_jtag_tap.io.wr_addr              // 7 bit Write address
  rd_en                   := i_jtag_tap.io.rd_en                      // 1 bit  read enable
  wr_en                   := i_jtag_tap.io.wr_en                      // 1 bit  Write enable
  i_jtag_tap.io.rd_data   := io.rd_data                  // 32 bit Read data
  i_jtag_tap.io.rd_status := 0.U(2.W)
  i_jtag_tap.io.idle      := 0.U(3.W)                         // no need to wait to sample data
  i_jtag_tap.io.dmi_stat  := 0.U(2.W)                     // no need to wait or error possible
  i_jtag_tap.io.version   := 1.U(4.W)                      // debug spec 0.13 compliant
  i_jtag_tap.io.jtag_id   := io.jtag_id
  io.dmi_hard_reset       := i_jtag_tap.io.dmi_hard_reset
  dmireset               := i_jtag_tap.io.dmi_reset

  // dmi_jtag_to_core_sync instantiation
  val i_dmi_jtag_to_core_sync = Module(new dmi_jtag_to_core_sync())
  i_dmi_jtag_to_core_sync.io.wr_en := wr_en  // 1 bit  Write enable
  i_dmi_jtag_to_core_sync.io.rd_en := rd_en  // 1 bit  Read enable
  io.reg_en    :=i_dmi_jtag_to_core_sync.io.reg_en        // 1 bit  Write interface bit
  io.reg_wr_en := i_dmi_jtag_to_core_sync.io.reg_wr_en    // 1 bit  Write enable
}
object dmiwrapper_main extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new dmi_wrapper()))
}
