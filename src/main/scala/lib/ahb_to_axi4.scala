package lib
import chisel3._
import chisel3.util._
import chisel3.experimental.chiselName

@chiselName
class ahb_to_axi4 extends Module with el2_lib with RequireAsyncReset {
  val TAG = 1
  val io = IO(new Bundle {
    val scan_mode = Input(Bool())
    val bus_clk_en = Input(Bool())
    val clk_override = Input(Bool())
    val axi_awready = Input(Bool())
    val axi_wready = Input(Bool())
    val axi_bvalid = Input(Bool())
    val axi_bresp = Input(UInt(2.W))
    val axi_bid = Input(UInt(TAG.W))
    val axi_arready = Input(Bool())
    val axi_rvalid = Input(Bool())
    val axi_rid = Input(UInt(TAG.W))
    val axi_rdata = Input(UInt(64.W))
    val axi_rresp = Input(UInt(2.W))
    val ahb_haddr = Input(UInt(32.W)) // ahb bus address
    val ahb_hburst = Input(UInt(3.W)) // tied to 0
    val ahb_hmastlock = Input(Bool()) // tied to 0
    val ahb_hprot = Input(UInt(4.W)) // tied to 4'b0011
    val ahb_hsize = Input(UInt(3.W)) // size of bus transaction (possible values 0          =1          =2          =3)
    val ahb_htrans = Input(UInt(2.W)) // Transaction type (possible values 0          =2 only right now)
    val ahb_hwrite = Input(Bool()) // ahb bus write
    val ahb_hwdata = Input(UInt(64.W)) // ahb bus write data
    val ahb_hsel = Input(Bool()) // this slave was selected
    val ahb_hreadyin = Input(Bool()) // previous hready was accepted or not
    // outputs
    val axi_awvalid = Output(Bool())
    val axi_awid = Output(UInt(TAG.W))
    val axi_awaddr = Output(UInt(32.W))
    val axi_awsize = Output(UInt(3.W))
    val axi_awprot = Output(UInt(3.W))
    val axi_awlen = Output(UInt(8.W))
    val axi_awburst = Output(UInt(2.W))
    val axi_wvalid = Output(Bool())
    val axi_wdata = Output(UInt(64.W))
    val axi_wstrb = Output(UInt(8.W))
    val axi_wlast = Output(Bool())
    val axi_bready = Output(Bool())
    val axi_arvalid = Output(Bool())
    val axi_arid = Output(UInt(TAG.W))
    val axi_araddr = Output(UInt(32.W))
    val axi_arsize = Output(UInt(3.W))
    val axi_arprot = Output(UInt(3.W))
    val axi_arlen = Output(UInt(8.W))
    val axi_arburst = Output(UInt(2.W))
    val axi_rready = Output(Bool())
    val ahb_hrdata = Output(UInt(64.W)) // ahb bus read data
    val ahb_hreadyout = Output(Bool()) // slave ready to accept transaction
    val ahb_hresp = Output(Bool()) // slave response (high indicates erro)
  })
  io.axi_awvalid := 0.U
  io.axi_awid := 0.U
  io.axi_awaddr := 0.U
  io.axi_awsize := 0.U
  io.axi_awprot := 0.U
  io.axi_awlen := 0.U
  io.axi_awburst := 0.U
  io.axi_wvalid := 0.U
  io.axi_wdata := 0.U
  io.axi_wstrb := 0.U
  io.axi_wlast := 0.U
  io.axi_bready := 0.U
  io.axi_arvalid := 0.U
  io.axi_arid := 0.U
  io.axi_araddr := 0.U
  io.axi_arsize := 0.U
  io.axi_arprot := 0.U
  io.axi_arlen := 0.U
  io.axi_arburst := 0.U
  io.axi_rready := 0.U
  io.ahb_hrdata := 0.U
  io.ahb_hreadyout := 0.U
  io.ahb_hresp := 0.U
}
object AHB_main extends App {
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new ahb_to_axi4()))
}