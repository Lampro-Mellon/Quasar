package lib
import chisel3._
import chisel3.util._
import chisel3.experimental.chiselName
import include._

@chiselName
class ahb_to_axi4(TAG : Int) extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle {
    val scan_mode       = Input(Bool())
    val bus_clk_en      = Input(Bool())
    val clk_override    = Input(Bool())

    val axi = new axi_channels(TAG)
    val ahb = new Bundle{
      val sig = Flipped(new ahb_channel())
      val hsel = Input(Bool())
      val hreadyin = Input(Bool())}
  })
  io.axi <> 0.U.asTypeOf(io.axi)
  val idle:: wr :: rd :: pend :: Nil = Enum(4)
  val master_wstrb        = WireInit(0.U(8.W))
  val buf_state_en        = WireInit(false.B)

  // Buffer signals (one entry buffer)
  val buf_read_error_in   = WireInit(false.B)
  val buf_read_error      = WireInit(false.B)
  val buf_rdata           = WireInit(0.U(64.W))
  val ahb_hready          = WireInit(Bool(), false.B)
  val ahb_hready_q        = WireInit(Bool(), false.B)
  val ahb_htrans_in       = WireInit(0.U(2.W))
  val ahb_htrans_q        = WireInit(0.U(2.W))
  val ahb_hsize_q         = WireInit(0.U(3.W))
  val ahb_hwrite_q        = WireInit(Bool(), false.B)
  val ahb_haddr_q         = WireInit(0.U(32.W))
  val ahb_hwdata_q        = WireInit(0.U(64.W))
  val ahb_hresp_q         = WireInit(Bool(), false.B)

  // signals needed for the read data coming back from the core and to block any further commands as AHB is a blocking bus
  val buf_rdata_en        = WireInit(Bool(), false.B)
  val ahb_addr_clk_en = WireInit(Bool(), false.B)
  val buf_rdata_clk_en    = WireInit(Bool(), false.B)
  val bus_clk             = Wire(Clock())
  val ahb_addr_clk        = Wire(Clock())
  val buf_rdata_clk       = Wire(Clock())

  // Command buffer is the holding station where we convert to AXI and send to core
  val cmdbuf_wr_en        = WireInit(Bool(), false.B)
  val cmdbuf_rst          = WireInit(Bool(), false.B)
  val cmdbuf_full         = WireInit(Bool(), false.B)
  val cmdbuf_vld          = WireInit(Bool(), false.B)
  val cmdbuf_write        = WireInit(Bool(), false.B)
  val cmdbuf_size         = WireInit(0.U(2.W))
  val cmdbuf_wstrb        = WireInit(0.U(8.W))
  val cmdbuf_addr         = WireInit(0.U(32.W))
  val cmdbuf_wdata        = WireInit(0.U(64.W))

  // Address check  dccm
  val (ahb_addr_in_dccm_region_nc,ahb_addr_in_dccm) = rvrangecheck(DCCM_SADR,DCCM_SIZE,ahb_haddr_q)
  val (ahb_addr_in_iccm_region_nc,ahb_addr_in_iccm) = if(ICCM_ENABLE) rvrangecheck(ICCM_SADR ,ICCM_SIZE,ahb_haddr_q) else (0.U,0.U)
  val (ahb_addr_in_pic_region_nc, ahb_addr_in_pic) = rvrangecheck(PIC_BASE_ADDR,PIC_SIZE,ahb_haddr_q)
  // PIC memory address check
  // FSM to control the bus states and when to block the hready and load the command buffer
  val buf_state                = WireInit(idle)
  val buf_nxtstate             = WireInit(idle)
  buf_nxtstate                := idle
  buf_state_en                := false.B
  buf_rdata_en                := false.B      // signal to load the buffer when the core sends read data back
  buf_read_error_in           := false.B      // signal indicating that an error came back with the read from the core
  cmdbuf_wr_en                := false.B      // all clear from the gasket to load the buffer with the command for reads, command/dat for writes
  switch(buf_state) {

    is(idle) {
      buf_nxtstate := Mux(io.ahb.sig.out.hwrite, wr, rd)
      buf_state_en := ahb_hready & io.ahb.sig.out.htrans(1) & io.ahb.hsel // only transition on a valid hrtans
    }
    is(wr) { // Write command recieved last cycle
      buf_nxtstate := Mux((io.ahb.sig.in.hresp | (io.ahb.sig.out.htrans(1, 0) === "b0".U) | !io.ahb.hsel).asBool, idle, Mux(io.ahb.sig.out.hwrite, wr, rd))
      buf_state_en := (!cmdbuf_full | io.ahb.sig.in.hresp)
      cmdbuf_wr_en := !cmdbuf_full & !(io.ahb.sig.in.hresp | ((io.ahb.sig.out.htrans(1, 0) === "b01".U(2.W)) & io.ahb.hsel)) // Dont send command to the buffer in case of an error or when the master is not ready with the data now.
    }
    is(rd) { // Read command recieved last cycle.
      buf_nxtstate := Mux(io.ahb.sig.in.hresp, idle, pend) // If error go to idle, else wait for read data
      buf_state_en := (!cmdbuf_full | io.ahb.sig.in.hresp) // only when command can go, or if its an error
      cmdbuf_wr_en := !io.ahb.sig.in.hresp & !cmdbuf_full // send command only when no error
    }
    is(pend) { // Read Command has been sent. Waiting on Data.
      buf_nxtstate := idle // go back for next command and present data next cycle
      buf_state_en := io.axi.r.valid & !cmdbuf_write // read data is back
      buf_rdata_en := buf_state_en // buffer the read data coming back from core
      buf_read_error_in := buf_state_en & io.axi.r.bits.resp(1, 0).orR // buffer error flag if return has Error ( ECC )
    }
  }
  buf_state                   := rvdffs_fpga(buf_nxtstate,buf_state_en.asBool(),bus_clk,io.bus_clk_en,clock)

  master_wstrb                :=  (Fill(8,ahb_hsize_q(2,0) === 0.U)  & (1.U  << ahb_haddr_q(2,0)).asUInt()) |
    (Fill(8,ahb_hsize_q(2,0) === 1.U)  & (3.U  << ahb_haddr_q(2,0)).asUInt()) |
    (Fill(8,ahb_hsize_q(2,0) === 2.U)  & (15.U << ahb_haddr_q(2,0)).asUInt()) |
    (Fill(8,ahb_hsize_q(2,0) === 3.U)  &  255.U)

  // AHB signals
  io.ahb.sig.in.hready               := Mux(io.ahb.sig.in.hresp,(ahb_hresp_q & !ahb_hready_q), ((!cmdbuf_full | (buf_state === idle)) & !(buf_state === rd | buf_state === pend)  & !buf_read_error))
  ahb_hready                  := io.ahb.sig.in.hready & io.ahb.hreadyin
  ahb_htrans_in               := Fill(2,io.ahb.hsel) & io.ahb.sig.out.htrans(1,0)
  io.ahb.sig.in.hrdata               := buf_rdata(63,0)
  io.ahb.sig.in.hresp                := ((ahb_htrans_q(1,0) =/= 0.U) & (buf_state =/= idle)  &
    ((!(ahb_addr_in_dccm | ahb_addr_in_iccm)) |                                                                                   // request not for ICCM or DCCM
      ((ahb_addr_in_iccm | (ahb_addr_in_dccm &  ahb_hwrite_q)) & !((ahb_hsize_q(1,0) === 2.U) | (ahb_hsize_q(1,0) === 3.U))) |    // ICCM Rd/Wr OR DCCM Wr not the right size
      ((ahb_hsize_q(2,0) === 1.U) & ahb_haddr_q(0))   |                                                                             // HW size but unaligned
      ((ahb_hsize_q(2,0) === 2.U) & (ahb_haddr_q(1,0)).orR) |                                                                          // W size but unaligned
      ((ahb_hsize_q(2,0) === 3.U) & (ahb_haddr_q(2,0)).orR))) |                                                                        // DW size but unaligned
    buf_read_error |                                                                                                              // Read ECC error
    (ahb_hresp_q & !ahb_hready_q)
  // Buffer signals - needed for the read data and ECC error response
  buf_rdata                   := rvdff_fpga(io.axi.r.bits.data,buf_rdata_clk,buf_rdata_clk_en,clock)
  buf_read_error              := rvdff_fpga(buf_read_error_in,bus_clk,io.bus_clk_en,clock)

  // All the Master signals are captured before presenting it to the command buffer. We check for Hresp before sending it to the cmd buffer.
  ahb_hresp_q                 := rvdff_fpga (io.ahb.sig.in.hresp,bus_clk,io.bus_clk_en,clock)
  ahb_hready_q                := rvdff_fpga (ahb_hready,bus_clk,io.bus_clk_en,clock)
  ahb_htrans_q                := rvdff_fpga (ahb_htrans_in,bus_clk,io.bus_clk_en,clock)
  ahb_hsize_q                 := rvdff_fpga (io.ahb.sig.out.hsize,ahb_addr_clk,ahb_addr_clk_en,clock)
  ahb_hwrite_q                := rvdff_fpga (io.ahb.sig.out.hwrite,ahb_addr_clk,ahb_addr_clk_en,clock)
  ahb_haddr_q                 := rvdff_fpga (io.ahb.sig.out.haddr,ahb_addr_clk,ahb_addr_clk_en,clock)

  // Clock header logic
  ahb_addr_clk_en         := io.bus_clk_en & (ahb_hready & io.ahb.sig.out.htrans(1))
  buf_rdata_clk_en            := io.bus_clk_en & buf_rdata_en

  if(RV_FPGA_OPTIMIZE){
     bus_clk       := 0.B.asClock()
     ahb_addr_clk  := 0.B.asClock()
     buf_rdata_clk := 0.B.asClock()
    }
  else {
    bus_clk := rvclkhdr(clock, io.bus_clk_en, io.scan_mode)
    ahb_addr_clk := rvclkhdr(clock, ahb_addr_clk_en, io.scan_mode)
    buf_rdata_clk := rvclkhdr(clock, buf_rdata_clk_en, io.scan_mode)
  }
  cmdbuf_rst                  := (((io.axi.aw.valid & io.axi.aw.ready) | (io.axi.ar.valid & io.axi.ar.ready)) & !cmdbuf_wr_en) | (io.ahb.sig.in.hresp & !cmdbuf_write)
  cmdbuf_full                 := (cmdbuf_vld & !((io.axi.aw.valid & io.axi.aw.ready) | (io.axi.ar.valid & io.axi.ar.ready)))
  //rvdffsc
  cmdbuf_vld                  := rvdffsc_fpga("b1".U,cmdbuf_wr_en.asBool(),cmdbuf_rst,bus_clk,io.bus_clk_en,clock)
  //dffs
  cmdbuf_write                := rvdffs_fpga(ahb_hwrite_q, cmdbuf_wr_en.asBool(),bus_clk,io.bus_clk_en,clock)
  cmdbuf_size                 := rvdffs_fpga(ahb_hsize_q(1,0), cmdbuf_wr_en.asBool(),bus_clk,io.bus_clk_en,clock)
  cmdbuf_wstrb                := rvdffs_fpga(master_wstrb, cmdbuf_wr_en.asBool(),bus_clk,io.bus_clk_en,clock)
  //rvdffe
  cmdbuf_addr := rvdffe(ahb_haddr_q, cmdbuf_wr_en.asBool()& io.bus_clk_en,clock,io.scan_mode)
  cmdbuf_wdata := rvdffe(io.ahb.sig.out.hwdata, cmdbuf_wr_en.asBool()& io.bus_clk_en,clock,io.scan_mode)

  // AXI Write Command Channel
  io.axi.aw.valid          := cmdbuf_vld & cmdbuf_write
  io.axi.aw.bits.id             := Fill(TAG, 0.U)
  io.axi.aw.bits.addr           := cmdbuf_addr
  io.axi.aw.bits.size           := Cat("b0".U, cmdbuf_size(1, 0))
  io.axi.aw.bits.prot           := Fill(3, 0.U)
  io.axi.aw.bits.len            := Fill(8, 0.U)
  io.axi.aw.bits.burst          := "b01".U(2.W)
  // AXI Write Data Channel - This is tied to the command channel as we only write the command buffer once we have the data.
  io.axi.w.valid           := cmdbuf_vld & cmdbuf_write
  io.axi.w.bits.data            := cmdbuf_wdata
  io.axi.w.bits.strb            := cmdbuf_wstrb
  io.axi.w.bits.last            := "b1".U
  // AXI Write Response - Always ready. AHB does not require a write response.
  io.axi.b.ready           := "b1".U
  // AXI Read Channels
  io.axi.ar.valid          := cmdbuf_vld & !cmdbuf_write
  io.axi.ar.bits.id             := Fill(TAG, 0.U)
  io.axi.ar.bits.addr           := cmdbuf_addr
  io.axi.ar.bits.size           := Cat("b0".U, cmdbuf_size(1, 0))
  io.axi.ar.bits.prot           := Fill(3, 0.U)
  io.axi.ar.bits.len            := Fill(8, 0.U)
  io.axi.ar.bits.burst          := "b01".U(2.W)
  // AXI Read Response Channel - Always ready as AHB reads are blocking and the the buffer is available for the read coming back always.
  io.axi.r.ready           := true.B
}

object ahb_to_axi4 extends App {
 println((new chisel3.stage.ChiselStage).emitVerilog(new ahb_to_axi4(1)))
}