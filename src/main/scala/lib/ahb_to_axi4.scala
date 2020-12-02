package lib
import chisel3._
import chisel3.util._
//import chisel3.experimental.chiselName

//@chiselName
class ahb_to_axi4 extends Module with el2_lib with RequireAsyncReset {
    val io = IO(new Bundle {
        val scan_mode       = Input(Bool())
        val bus_clk_en      = Input(Bool())
        val clk_override    = Input(Bool())
        val axi_awready     = Input(Bool())
        val axi_wready      = Input(Bool())
        val axi_bvalid      = Input(Bool())
        val axi_bresp       = Input(UInt(2.W))
        val axi_bid         = Input(UInt(TAG.W))
        val axi_arready     = Input(Bool())
        val axi_rvalid      = Input(Bool())
        val axi_rid         = Input(UInt(TAG.W))
        val axi_rdata       = Input(UInt(64.W))
        val axi_rresp       = Input(UInt(2.W))
        val ahb_haddr       = Input(UInt(32.W)) // ahb bus address
        val ahb_hburst      = Input(UInt(3.W)) // tied to 0
        val ahb_hmastlock   = Input(Bool()) // tied to 0
        val ahb_hprot       = Input(UInt(4.W)) // tied to 4'b0011
        val ahb_hsize       = Input(UInt(3.W)) // size of bus transaction (possible values 0          =1          =2          =3)
        val ahb_htrans      = Input(UInt(2.W)) // Transaction type (possible values 0          =2 only right now)
        val ahb_hwrite      = Input(Bool()) // ahb bus write
        val ahb_hwdata      = Input(UInt(64.W)) // ahb bus write data
        val ahb_hsel        = Input(Bool()) // this slave was selected
        val ahb_hreadyin    = Input(Bool()) // previous hready was accepted or not
        // outputs
        val axi_awvalid     = Output(Bool())
        val axi_awid        = Output(UInt(TAG.W))
        val axi_awaddr      = Output(UInt(32.W))
        val axi_awsize      = Output(UInt(3.W))
        val axi_awprot      = Output(UInt(3.W))
        val axi_awlen       = Output(UInt(8.W))
        val axi_awburst     = Output(UInt(2.W))
        val axi_wvalid      = Output(Bool())
        val axi_wdata       = Output(UInt(64.W))
        val axi_wstrb       = Output(UInt(8.W))
        val axi_wlast       = Output(Bool())
        val axi_bready      = Output(Bool())
        val axi_arvalid     = Output(Bool())
        val axi_arid        = Output(UInt(TAG.W))
        val axi_araddr      = Output(UInt(32.W))
        val axi_arsize      = Output(UInt(3.W))
        val axi_arprot      = Output(UInt(3.W))
        val axi_arlen       = Output(UInt(8.W))
        val axi_arburst     = Output(UInt(2.W))
        val axi_rready      = Output(Bool())
        val ahb_hrdata      = Output(UInt(64.W)) // ahb bus read data
        val ahb_hreadyout   = Output(Bool()) // slave ready to accept transaction
        val ahb_hresp       = Output(Bool()) // slave response (high indicates erro)
    })
  val idle:: wr :: rd :: pend :: Nil = Enum(4)
    val TAG= 1
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

    //Miscellaneous signals
    val ahb_addr_in_iccm    = WireInit(Bool(), false.B)
    val ahb_addr_in_iccm_region_nc = WireInit(Bool(), false.B)

    // signals needed for the read data coming back from the core and to block any further commands as AHB is a blocking bus
    val buf_rdata_en        = WireInit(Bool(), false.B)
    val ahb_bus_addr_clk_en = WireInit(Bool(), false.B)
    val buf_rdata_clk_en    = WireInit(Bool(), false.B)
    val ahb_clk             = Wire(Clock())
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
    val bus_clk             = Wire(Clock())

  // Address check  dccm
    val (ahb_addr_in_dccm, ahb_addr_in_dccm_region_nc) = rvrangecheck_ch(ahb_haddr_q.asUInt,aslong(DCCM_SADR).asUInt(),DCCM_SIZE)

  // Address check  iccm
    if (ICCM_ENABLE == 1) {
    ahb_addr_in_iccm            := rvrangecheck_ch(ahb_haddr_q.asUInt, aslong(ICCM_SADR).asUInt(), ICCM_SIZE)._1
    ahb_addr_in_iccm_region_nc  := rvrangecheck_ch(ahb_haddr_q.asUInt, aslong(ICCM_SADR).asUInt(), ICCM_SIZE)._2
  }
  else {
      ahb_addr_in_iccm := 0.U
      ahb_addr_in_iccm_region_nc := 0.U

    }
  // PIC memory address check
  val (ahb_addr_in_pic, ahb_addr_in_pic_region_nc) = rvrangecheck_ch(ahb_haddr_q.asUInt,aslong(PIC_BASE_ADDR).asUInt(),PIC_SIZE)

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
        buf_nxtstate := Mux(io.ahb_hwrite, wr, rd)
        buf_state_en := ahb_hready & io.ahb_htrans(1) & io.ahb_hsel // only transition on a valid hrtans
      }
      is(wr) { // Write command recieved last cycle
        buf_nxtstate := Mux((io.ahb_hresp | (io.ahb_htrans(1, 0) === "b0".U) | !io.ahb_hsel).asBool, idle, Mux(io.ahb_hwrite, wr, rd))
        buf_state_en := (!cmdbuf_full | io.ahb_hresp)
        cmdbuf_wr_en := !cmdbuf_full & !(io.ahb_hresp | ((io.ahb_htrans(1, 0) === "b01".U) & io.ahb_hsel)) // Dont send command to the buffer in case of an error or when the master is not ready with the data now.
      }
      is(rd) { // Read command recieved last cycle.
        buf_nxtstate := Mux(io.ahb_hresp, idle, pend) // If error go to idle, else wait for read data
        buf_state_en := (!cmdbuf_full | io.ahb_hresp) // only when command can go, or if its an error
        cmdbuf_wr_en := !io.ahb_hresp & !cmdbuf_full // send command only when no error
      }
      is(pend) { // Read Command has been sent. Waiting on Data.
        buf_nxtstate := idle // go back for next command and present data next cycle
        buf_state_en := io.axi_rvalid & !cmdbuf_write // read data is back
        buf_rdata_en := buf_state_en // buffer the read data coming back from core
        buf_read_error_in := buf_state_en & io.axi_rresp(1, 0).orR // buffer error flag if return has Error ( ECC )
      }
    }
    buf_state                   := withClock(ahb_clk){RegEnable(buf_nxtstate,0.U,buf_state_en.asBool())}

    master_wstrb                :=  (Fill(8,ahb_hsize_q(2,0) === 0.U)  & (1.U  << ahb_haddr_q(2,0)).asUInt()) |
                                    (Fill(8,ahb_hsize_q(2,0) === 1.U)  & (3.U  << ahb_haddr_q(2,0)).asUInt()) |
                                    (Fill(8,ahb_hsize_q(2,0) === 2.U)  & (15.U << ahb_haddr_q(2,0)).asUInt()) |
                                    (Fill(8,ahb_hsize_q(2,0) === 3.U)  &  255.U)

    // AHB signals
    io.ahb_hreadyout            := Mux(io.ahb_hresp,(ahb_hresp_q & !ahb_hready_q), ((!cmdbuf_full | (buf_state === idle)) & !(buf_state === rd | buf_state === pend)  & !buf_read_error))
    ahb_hready                  := io.ahb_hreadyout & io.ahb_hreadyin
    ahb_htrans_in               := Fill(2,io.ahb_hsel) & io.ahb_htrans(1,0)
    io.ahb_hrdata               := buf_rdata(63,0)
    io.ahb_hresp                := ((ahb_htrans_q(1,0) =/= 0.U) & (buf_state =/= idle)  &
                                   ((!(ahb_addr_in_dccm | ahb_addr_in_iccm)) |                                                                                   // request not for ICCM or DCCM
                                   ((ahb_addr_in_iccm | (ahb_addr_in_dccm &  ahb_hwrite_q)) & !((ahb_hsize_q(1,0) === 2.U) | (ahb_hsize_q(1,0) === 3.U))) |    // ICCM Rd/Wr OR DCCM Wr not the right size
                                   ((ahb_hsize_q(2,0) === 1.U) & ahb_haddr_q(0))   |                                                                             // HW size but unaligned
                                   ((ahb_hsize_q(2,0) === 2.U) & (ahb_haddr_q(1,0)).orR) |                                                                          // W size but unaligned
                                   ((ahb_hsize_q(2,0) === 3.U) & (ahb_haddr_q(2,0)).orR))) |                                                                        // DW size but unaligned
                                   buf_read_error |                                                                                                              // Read ECC error
                                   (ahb_hresp_q & !ahb_hready_q)

    // Buffer signals - needed for the read data and ECC error response
    buf_rdata                   := withClock(buf_rdata_clk){RegNext(io.axi_rdata,0.U)}
    buf_read_error              := withClock(ahb_clk){RegNext(buf_read_error_in,0.U)}

    // All the Master signals are captured before presenting it to the command buffer. We check for Hresp before sending it to the cmd buffer.
    ahb_hresp_q                 := withClock(ahb_clk){RegNext(io.ahb_hresp,0.U)}
    ahb_hready_q                := withClock(ahb_clk){RegNext(ahb_hready,0.U)}
    ahb_htrans_q                := withClock(ahb_clk){RegNext(ahb_htrans_in,0.U)}
    ahb_hsize_q                 := withClock(ahb_addr_clk){RegNext(io.ahb_hsize,0.U)}
    ahb_hwrite_q                := withClock(ahb_addr_clk){RegNext(io.ahb_hwrite,0.U)}
    ahb_haddr_q                 := withClock(ahb_addr_clk){RegNext(io.ahb_haddr,0.U)}

    // Clock header logic
    ahb_bus_addr_clk_en         := io.bus_clk_en & (ahb_hready & io.ahb_htrans(1))
    buf_rdata_clk_en            := io.bus_clk_en & buf_rdata_en;

    ahb_clk                     := rvclkhdr(clock, io.bus_clk_en, io.scan_mode)
    ahb_addr_clk                := rvclkhdr(clock, ahb_bus_addr_clk_en, io.scan_mode)
    buf_rdata_clk               := rvclkhdr(clock, buf_rdata_clk_en, io.scan_mode)

    cmdbuf_rst                  := (((io.axi_awvalid & io.axi_awready) | (io.axi_arvalid & io.axi_arready)) & !cmdbuf_wr_en) | (io.ahb_hresp & !cmdbuf_write)
    cmdbuf_full                 := (cmdbuf_vld & !((io.axi_awvalid & io.axi_awready) | (io.axi_arvalid & io.axi_arready)))

    //rvdffsc
    cmdbuf_vld                  := withClock(bus_clk) {
        RegEnable("b1".U & Fill("b1".U.getWidth, cmdbuf_rst), 0.U, cmdbuf_wr_en.asBool())}

    //dffs
    cmdbuf_write                := withClock(bus_clk) {
        RegEnable(ahb_hwrite_q, 0.U, cmdbuf_wr_en.asBool())}

    cmdbuf_size                 := withClock(bus_clk) {
        RegEnable(ahb_hsize_q, 0.U, cmdbuf_wr_en.asBool())}

    cmdbuf_wstrb                := withClock(bus_clk) {
        RegEnable(master_wstrb, 0.U, cmdbuf_wr_en.asBool())}

    //rvdffe
    cmdbuf_addr := rvdffe(ahb_haddr_q, cmdbuf_wr_en.asBool(),clock,io.scan_mode)
    cmdbuf_wdata := rvdffe(io.ahb_hwdata, cmdbuf_wr_en.asBool(),clock,io.scan_mode)

    // AXI Write Command Channel
    io.axi_awvalid          := cmdbuf_vld & cmdbuf_write
    io.axi_awid             := Fill(TAG, 0.U)
    io.axi_awaddr           := cmdbuf_addr
    io.axi_awsize           := Cat("b0".U, cmdbuf_size(1, 0))
    io.axi_awprot           := Fill(3, 0.U)
    io.axi_awlen            := Fill(8, 0.U)
    io.axi_awburst          := "b01".U
    // AXI Write Data Channel - This is tied to the command channel as we only write the command buffer once we have the data.
    io.axi_wvalid           := cmdbuf_vld & cmdbuf_write
    io.axi_wdata            := cmdbuf_wdata
    io.axi_wstrb            := cmdbuf_wstrb
    io.axi_wlast            := "b1".U
    // AXI Write Response - Always ready. AHB does not require a write response.
    io.axi_bready           := "b1".U
    // AXI Read Channels
    io.axi_arvalid          := cmdbuf_vld & !cmdbuf_write
    io.axi_arid             := Fill(TAG, 0.U)
    io.axi_araddr           := cmdbuf_addr
    io.axi_arsize           := Cat("b0".U, cmdbuf_size(1, 0))
    io.axi_arprot           := Fill(3, 0.U)
    io.axi_arlen            := Fill(8, 0.U)
    io.axi_arburst          := "b01".U
    // AXI Read Response Channel - Always ready as AHB reads are blocking and the the buffer is available for the read coming back always.
    io.axi_rready           := true.B


    bus_clk                 := rvclkhdr(clock, io.bus_clk_en, io.scan_mode)
}
object AHB_main extends App {
    println("Generate Verilog")
    println((new chisel3.stage.ChiselStage).emitVerilog(new ahb_to_axi4()))}
