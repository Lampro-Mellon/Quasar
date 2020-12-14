package lib

import chisel3._
import chisel3.util._
import include._

trait Config {
  val TAG = 1
}

class axi4_to_ahb_IO extends Bundle with Config {

  val scan_mode = Input(Bool())
  val bus_clk_en = Input(Bool())
  val clk_override = Input(Bool())
  val axi_awvalid = Input(Bool())
  val axi_awid = Input(UInt(TAG.W)) // [TAG-1:0]
  val axi_awaddr = Input(UInt(32.W)) // [31:0]
  val axi_awsize = Input(UInt(3.W)) // [2:0]
  val axi_awprot = Input(UInt(3.W)) // [2:0]
  val axi_wvalid = Input(Bool())
  val axi_wdata = Input(UInt(64.W)) // [63:0]
  val axi_wstrb = Input(UInt(8.W)) // [7:0]
  val axi_wlast = Input(Bool())
  val axi_bready = Input(Bool())
  val axi_arvalid = Input(Bool())
  val axi_arid = Input(UInt(TAG.W)) // [TAG-1:0]
  val axi_araddr = Input(UInt(32.W)) // [31:0]
  val axi_arsize = Input(UInt(3.W)) // [2:0]
  val axi_arprot = Input(UInt(3.W)) // [2:0]
  val axi_rready = Input(Bool())
  //----------------------------outputs---------------------------
  val axi_awready = Output(Bool())
  val axi_wready = Output(Bool())
  val axi_bvalid = Output(Bool())
  val axi_bresp = Output(UInt(2.W)) // [1:0]]
  val axi_bid = Output(UInt(TAG.W)) // [TAG-1:0]
  // AXI Read Channels
  val axi_arready = Output(Bool())
  val axi_rvalid = Output(Bool())
  val axi_rid = Output(UInt(TAG.W)) // [TAG-1:0]
  val axi_rdata = Output(UInt(64.W)) // [63:0]
  val axi_rresp = Output(UInt(2.W)) // 1:0]
  val axi_rlast = Output(Bool())
  // AHB-Lite signals
  val ahb = new ahb_channel
}




class axi4_to_ahb extends Module with lib with RequireAsyncReset with Config {
  val io = IO(new axi4_to_ahb_IO)
  val buf_rst = WireInit(0.U(1.W))
  buf_rst :=0.U
  val buf_state_en = WireInit(Bool(), init = false.B)
  val ahbm_clk = Wire(Clock())
  val ahbm_addr_clk = Wire(Clock())
  val ahbm_data_clk = Wire(Clock())
  val idle :: cmd_rd :: cmd_wr :: data_rd :: data_wr :: done :: stream_rd :: stream_err_rd :: Nil = Enum(8)
  val buf_state = WireInit(0.U(3.W))
  val buf_nxtstate = WireInit(0.U(3.W))
  buf_state := withClock(ahbm_clk) { RegNext((Mux(buf_state_en.asBool() ,buf_nxtstate,buf_state) & Fill(3, !buf_rst)), 0.U) }
  //logic signals
  val slave_valid = WireInit(Bool(), init = false.B)
  val slave_ready = WireInit(Bool(), init = false.B)
  val slave_tag = WireInit(0.U(TAG.W)) // [TAG-1:0]
  val slave_rdata = WireInit(0.U(64.W)) // [63:0]
  val slave_opc = WireInit(0.U(4.W)) // [3:0]
  val wrbuf_en = WireInit(Bool(), init = false.B)
  val wrbuf_data_en = WireInit(Bool(), init = false.B)
  val wrbuf_cmd_sent = WireInit(Bool(), init = false.B)
  val wrbuf_rst = WireInit(Bool(), init = false.B)
  val wrbuf_vld = WireInit(Bool(), init = false.B)
  val wrbuf_data_vld = WireInit(Bool(), init = false.B)
  val wrbuf_tag = WireInit(0.U(TAG.W)) // [TAG-1:0]
  val wrbuf_size = WireInit(0.U(3.W)) // [2:0]
  val wrbuf_addr = WireInit(0.U(32.W)) // [31:0]
  val wrbuf_data = WireInit(0.U(64.W)) // [63:0]
  val wrbuf_byteen = WireInit(0.U(8.W)) // [7:0]

  val bus_write_clk_en = WireInit(Bool(), init = false.B)
  val bus_clk = Wire(Clock())
  val bus_write_clk = Wire(Clock())

  val master_valid = WireInit(Bool(), init = false.B)
  val master_ready = WireInit(0.U(1.W))
  val master_tag = WireInit(0.U(TAG.W)) // [TAG-1:0]
  val master_addr = WireInit(0.U(32.W)) // [31:0]
  val master_wdata = WireInit(0.U(64.W)) // [63:0]
  val master_size = WireInit(0.U(3.W)) // [2:0]
  val master_opc = WireInit(0.U(3.W)) // [2:0]
  val master_byteen = WireInit(0.U(8.W)) // [7:0]
  // Buffer signals (one entry buffer)
  val buf_addr = WireInit(0.U(32.W)) // [31:0]
  val buf_size = WireInit(0.U(2.W)) // [1:0]
  val buf_write = WireInit(Bool(), init = false.B)
  val buf_byteen = WireInit(0.U(8.W)) // [7:0]
  val buf_aligned = WireInit(Bool(), init = false.B)
  val buf_data = WireInit(0.U(64.W)) // [63:0]
  val buf_tag = WireInit(0.U(TAG.W)) // [TAG-1:0]
  //Miscellaneous signals
  //  val buf_rst = WireInit(Bool(), init = false.B)
  val buf_tag_in = WireInit(0.U(TAG.W)) // [TAG-1:0]
  val buf_addr_in = WireInit(0.U(32.W)) // [31:0]
  val buf_byteen_in = WireInit(0.U(8.W)) // [7:0]
  val buf_data_in = WireInit(0.U(64.W)) // [63:0]
  val buf_write_in = WireInit(Bool(), init = false.B)
  val buf_aligned_in = WireInit(Bool(), init = false.B)
  val buf_size_in = WireInit(0.U(3.W)) // [2:0]

  // val buf_state_en = WireInit(Bool(), init = false.B)
  val buf_wr_en = WireInit(Bool(), init = false.B)
  val buf_data_wr_en = WireInit(Bool(), init = false.B)
  val slvbuf_error_en = WireInit(Bool(), init = false.B)
  val wr_cmd_vld = WireInit(Bool(), init = false.B)

  val cmd_done_rst = WireInit(Bool(), init = false.B)
  val cmd_done = WireInit(Bool(), init = false.B)
  val cmd_doneQ = WireInit(Bool(), init = false.B)
  val trxn_done = WireInit(Bool(), init = false.B)
  val buf_cmd_byte_ptr = WireInit(0.U(3.W)) // [2:0]
  val buf_cmd_byte_ptrQ = WireInit(0.U(3.W)) // [2:0]
  val buf_cmd_nxtbyte_ptr = WireInit(0.U(3.W)) // [2:0]
  val buf_cmd_byte_ptr_en = WireInit(Bool(), init = false.B)
  val found = WireInit(Bool(), init = false.B)

  val slave_valid_pre = WireInit(Bool(), init = false.B)
  val ahb_hready_q = WireInit(Bool(), init = false.B)
  val ahb_hresp_q = WireInit(Bool(), init = false.B)
  val ahb_htrans_q = WireInit(0.U(2.W)) // [1:0]
  val ahb_hwrite_q = WireInit(Bool(), init = false.B)
  val ahb_hrdata_q = WireInit(0.U(64.W)) // [63:0]

  val slvbuf_write = WireInit(Bool(), init = false.B)
  val slvbuf_error = WireInit(Bool(), init = false.B)
  val slvbuf_tag = WireInit(0.U(TAG.W)) // [TAG-1:0]

  val slvbuf_error_in = WireInit(Bool(), init = false.B)
  val slvbuf_wr_en = WireInit(Bool(), init = false.B)
  val bypass_en = WireInit(Bool(), init = false.B)
  val rd_bypass_idle = WireInit(Bool(), init = false.B)

  val last_addr_en = WireInit(Bool(), init = false.B)
  val last_bus_addr = WireInit(0.U(32.W)) // [31:0]
  // Clocks
  val buf_clken = WireInit(Bool(), init = false.B)
  val slvbuf_clken = WireInit(Bool(), init = false.B)
  val ahbm_addr_clken = WireInit(Bool(), init = false.B)
  val ahbm_data_clken = WireInit(Bool(), init = false.B)
  val buf_clk = Wire(Clock())

  def get_write_size(byteen: UInt) = {
    val size = ("b11".U & Fill(2, (byteen(7, 0) === "hff".U))) |
      ("b10".U & (Fill(2, ((byteen(7, 0) === "hf0".U) | (byteen(7, 0) === "h0f".U(8.W)))))) |
      ("b01".U(2.W) & (Fill(2, ((byteen(7, 0) === "hc0".U) | (byteen(7, 0) === "h30".U) | (byteen(7, 0) === "h0c".U(8.W)) | (byteen(7, 0) === "h03".U(8.W))))))
    size
  }
  def get_write_addr(byteen_e: UInt) = {
    val addr = ("h0".U(3.W) & (Fill(3, ((byteen_e(7, 0) === "hff".U) | (byteen_e(7, 0) === "h0f".U(8.W)) | (byteen_e(7, 0) === "h03".U(8.W)))))) |
      ("h2".U & (Fill(3, (byteen_e(7, 0) === "h0c".U(8.W))))) |
      ("h4".U & (Fill(3, ((byteen_e(7, 0) === "hf0".U) | (byteen_e(7, 0) === "h03".U(8.W)))))) |
      ("h6".U & (Fill(3, (byteen_e(7, 0) === "hc0".U))))
    ("h6".U & (Fill(3, (byteen_e(7, 0) === "hc0".U))))
    addr
  }
  def get_nxtbyte_ptr(current_byte_ptr: UInt, byteen: UInt, get_next: Bool): UInt = {
    val start_ptr = Mux(get_next, current_byte_ptr + 1.U, current_byte_ptr)
    val temp = (0 until 8).map(j => (byteen(j) & (j.asUInt() >= start_ptr)) -> j.U)
    MuxCase(7.U, temp)
  }
  wr_cmd_vld := wrbuf_vld & wrbuf_data_vld
  master_valid := wr_cmd_vld | io.axi_arvalid
  master_tag := Mux(wr_cmd_vld.asBool(), wrbuf_tag(TAG - 1, 0), io.axi_arid(TAG - 1, 0))
  master_opc := Mux(wr_cmd_vld.asBool(), "b011".U, "b0".U)
  master_addr := Mux(wr_cmd_vld.asBool(), wrbuf_addr(31, 0), io.axi_araddr(31, 0))
  master_size := Mux(wr_cmd_vld.asBool(), wrbuf_size(2, 0), io.axi_arsize(2, 0))
  master_byteen := wrbuf_byteen(7, 0)
  master_wdata := wrbuf_data(63, 0)

  // AXI response channel signals
  io.axi_bvalid := slave_valid & slave_ready & slave_opc(3)
  io.axi_bresp := Mux(slave_opc(0), "b10".U, Mux(slave_opc(1), "b11".U, "b0".U))
  io.axi_bid := slave_tag(TAG - 1, 0)

  io.axi_rvalid := slave_valid & slave_ready & (slave_opc(3, 2) === "b0".U)
  io.axi_rresp := Mux(slave_opc(0), "b10".U, Mux(slave_opc(1), "b11".U, "b0".U))
  io.axi_rid := slave_tag(TAG - 1, 0)
  io.axi_rdata := slave_rdata(63, 0)
  slave_ready := io.axi_bready & io.axi_rready

  // Clock header logic
  bus_write_clk_en := io.bus_clk_en & ((io.axi_awvalid & io.axi_awready) | (io.axi_wvalid & io.axi_wready))

  bus_clk := rvclkhdr(clock, io.bus_clk_en, io.scan_mode)
  bus_write_clk := rvclkhdr(clock, bus_write_clk_en.asBool(), io.scan_mode)

  //State machine
  io.ahb.out.htrans := 0.U
  master_ready := 0.U
  buf_state_en := false.B
  buf_nxtstate   := idle
  //buf_wr_en      := 0.U
  buf_data_wr_en := 0.U
  slvbuf_error_in   := 0.U
  slvbuf_error_en   := 0.U
  buf_write_in   := 0.U
  cmd_done       := 0.U
  trxn_done      := 0.U
  buf_cmd_byte_ptr_en := 0.U
  buf_cmd_byte_ptr := 0.U
  slave_valid_pre   := 0.U
  slvbuf_wr_en    := 0.U
  bypass_en        := 0.U
  rd_bypass_idle := 0.U

  switch(buf_state) {
    is(idle) {
      master_ready := 1.U
      buf_write_in := (master_opc(2, 1) === "b01".U)
      buf_nxtstate := Mux(buf_write_in.asBool(), cmd_wr, cmd_rd)
      buf_state_en := master_valid & 1.U
      buf_wr_en := buf_state_en
      buf_data_wr_en := buf_state_en & (buf_nxtstate === cmd_wr)
      buf_cmd_byte_ptr_en := buf_state_en
      // ---------------------FROM FUNCTION CHECK LATER
      buf_cmd_byte_ptr := Mux(buf_write_in.asBool(), (get_nxtbyte_ptr(0.U(3.W), buf_byteen_in(7, 0), false.B)), master_addr(2, 0))
      bypass_en := buf_state_en
      rd_bypass_idle := bypass_en & (buf_nxtstate === cmd_rd)
      io.ahb.out.htrans := (Fill(2, bypass_en)) & "b10".U
    }

    is(cmd_rd) {
      buf_nxtstate := Mux((master_valid & (master_opc(2, 0) === "b000".U)).asBool(), stream_rd, data_rd)
      buf_state_en := ahb_hready_q & (ahb_htrans_q(1, 0) =/= "b0".U) & !ahb_hwrite_q
      cmd_done := buf_state_en & !master_valid
      slvbuf_wr_en := buf_state_en
      master_ready := (ahb_hready_q & (ahb_htrans_q(1, 0) =/= "b0".U) & !ahb_hwrite_q) & (Mux((master_valid & (master_opc(2, 0) === "b000".U)).asBool(), stream_rd, data_rd) === stream_rd) ////////////TBD////////
      buf_wr_en := master_ready
      bypass_en := master_ready & master_valid
      buf_cmd_byte_ptr := Mux(bypass_en.asBool(), master_addr(2, 0), buf_addr(2, 0))
      io.ahb.out.htrans := "b10".U & (Fill(2, (!buf_state_en | bypass_en)))
    }

    is(stream_rd) {
      master_ready := (ahb_hready_q & !ahb_hresp_q) & ~(master_valid & master_opc(2, 1) === "b01".U)
      buf_wr_en := (master_valid & master_ready & (master_opc(2, 0) === "b000".U)) // update the fifo if we are streaming the read commands
      buf_nxtstate := Mux(ahb_hresp_q.asBool(), stream_err_rd, Mux((master_valid & master_ready & (master_opc(2, 0) === "b000".U)).asBool(), stream_rd, data_rd)) // assuming that the master accpets the slave response right away.
      buf_state_en := (ahb_hready_q | ahb_hresp_q)
      buf_data_wr_en := buf_state_en
      slvbuf_error_in := ahb_hresp_q
      slvbuf_error_en := buf_state_en
      slave_valid_pre := buf_state_en & !ahb_hresp_q // send a response right away if we are not going through an error response.
      cmd_done := buf_state_en & !master_valid // last one of the stream should not send a htrans
      bypass_en := master_ready & master_valid & (buf_nxtstate === stream_rd) & buf_state_en
      buf_cmd_byte_ptr := Mux(bypass_en.asBool(), master_addr(2, 0), buf_addr(2, 0))
      io.ahb.out.htrans := "b10".U & Fill(2, (!((buf_nxtstate =/= stream_rd) & buf_state_en)))
      slvbuf_wr_en := buf_wr_en// shifting the contents from the buf to slv_buf for streaming cases
    }

    is(stream_err_rd) {
      buf_nxtstate := data_rd
      buf_state_en := ahb_hready_q & (ahb_htrans_q(1, 0) =/= "b0".U) & !ahb_hwrite_q
      slave_valid_pre := buf_state_en
      slvbuf_wr_en := buf_state_en // Overwrite slvbuf with buffer
      buf_cmd_byte_ptr := buf_addr(2, 0)
      io.ahb.out.htrans := "b10".U(2.W) & Fill(2, !buf_state_en)
    }

    is(data_rd) {
      buf_nxtstate := done
      buf_state_en := (ahb_hready_q | ahb_hresp_q)
      buf_data_wr_en := buf_state_en
      slvbuf_error_in := ahb_hresp_q
      slvbuf_error_en := buf_state_en
      slvbuf_wr_en := buf_state_en
    }

    is(cmd_wr) {
      buf_nxtstate := data_wr
      trxn_done := ahb_hready_q & ahb_hwrite_q & (ahb_htrans_q(1, 0) =/= "b0".U)
      buf_state_en := trxn_done
      buf_cmd_byte_ptr_en := buf_state_en
      slvbuf_wr_en := buf_state_en
      buf_cmd_byte_ptr := Mux(trxn_done.asBool(), (get_nxtbyte_ptr(buf_cmd_byte_ptrQ(2, 0), buf_byteen(7, 0), true.B)), buf_cmd_byte_ptrQ)
      cmd_done := trxn_done & (buf_aligned | (buf_cmd_byte_ptrQ === "b111".U) | (buf_byteen((get_nxtbyte_ptr(buf_cmd_byte_ptrQ(2, 0), buf_byteen(7, 0), true.B))) === "b0".U))
      io.ahb.out.htrans := Fill(2, !(cmd_done | cmd_doneQ)) & "b10".U
    }

    is(data_wr) {
      buf_state_en := (cmd_doneQ & ahb_hready_q) | ahb_hresp_q
      master_ready := buf_state_en & !ahb_hresp_q & slave_ready
      buf_nxtstate := Mux((ahb_hresp_q | !slave_ready),done ,Mux((master_valid & master_valid),Mux((master_opc(2,1) === 1.U).asBool(),cmd_wr,cmd_rd),idle))
      slvbuf_error_in := ahb_hresp_q
      slvbuf_error_en := buf_state_en
      buf_write_in := master_opc(2,1) === 1.U
      buf_wr_en := buf_state_en & ((buf_nxtstate === cmd_wr) | (buf_nxtstate === cmd_rd))
      buf_data_wr_en := buf_wr_en
      cmd_done :=   (ahb_hresp_q | (ahb_hready_q & (ahb_htrans_q(1,0) =/= 0.U) &
        ((buf_cmd_byte_ptrQ === 7.U) | (buf_byteen(get_nxtbyte_ptr(buf_cmd_byte_ptrQ(2,0),buf_byteen(7,0),true.B)) === 0.U))))
      bypass_en := buf_state_en & buf_write_in & (buf_nxtstate === cmd_wr)
      io.ahb.out.htrans := Fill(2, (!(cmd_done | cmd_doneQ) | bypass_en)) & 2.U
      slave_valid_pre := buf_state_en & (buf_nxtstate =/= done)
      trxn_done := ahb_hready_q & ahb_hwrite_q & (ahb_htrans_q(1,0) =/= 0.U)
      buf_cmd_byte_ptr_en := trxn_done | bypass_en
      buf_cmd_byte_ptr := Mux(bypass_en,get_nxtbyte_ptr(0.U(3.W),buf_byteen_in(7,0),false.B),Mux(trxn_done,get_nxtbyte_ptr(buf_cmd_byte_ptrQ(2,0),buf_byteen(7,0),true.B),buf_cmd_byte_ptrQ))


      //
      //      buf_state_en := (cmd_doneQ & ahb_hready_q) | ahb_hresp_q
      //      master_ready := ((cmd_doneQ & ahb_hready_q) | ahb_hresp_q) & !ahb_hresp_q & slave_ready
      //      buf_nxtstate := Mux((ahb_hresp_q | !slave_ready).asBool(), done, Mux((master_valid & master_ready).asBool(), Mux((master_opc(2, 1) === "b01".U(2.W)), cmd_wr, cmd_rd), idle))
      //      slvbuf_error_in := ahb_hresp_q
      //      slvbuf_error_en := buf_state_en
      //      buf_write_in := (master_opc(2, 1) === "b01".U)
      //      buf_wr_en := buf_state_en & ((buf_nxtstate === cmd_wr) | (buf_nxtstate === cmd_rd))
      //      buf_data_wr_en := buf_wr_en
      //      cmd_done := (ahb_hresp_q | (ahb_hready_q & (ahb_htrans_q(1, 0) =/= "b0".U(2.W)) & ((buf_cmd_byte_ptrQ === "b111".U) | (buf_byteen(get_nxtbyte_ptr(buf_cmd_byte_ptrQ(2, 0), buf_byteen(7, 0), true.B)) === "b0".U))))
      //      bypass_en := buf_state_en & buf_write_in & (buf_nxtstate === cmd_wr) // Only bypass for writes for the time being
      //      io.ahb_htrans := Fill(2, (!(cmd_done | cmd_doneQ) | bypass_en)) & "b10".U
      //      slave_valid_pre := buf_state_en & (buf_nxtstate =/= done)
      //      trxn_done := ahb_hready_q & ahb_hwrite_q & (ahb_htrans_q(1, 0) =/= "b0".U(2.W))
      //      buf_cmd_byte_ptr_en := trxn_done | bypass_en
      //      buf_cmd_byte_ptr := Mux(bypass_en, get_nxtbyte_ptr(0.U(3.W), buf_byteen_in(7, 0), false.B), Mux(trxn_done, get_nxtbyte_ptr(buf_cmd_byte_ptrQ(2, 0), buf_byteen(7, 0), true.B), buf_cmd_byte_ptrQ))

    }
    is(done) {
      buf_nxtstate := idle
      buf_state_en := slave_ready
      slvbuf_error_en := true.B
      slave_valid_pre := true.B
    }
  }
  // buf_rst := 0.U
  cmd_done_rst := slave_valid_pre
  buf_addr_in := Cat(master_addr(31,3),Mux((buf_aligned_in & (master_opc(2, 1) === "b01".U)).asBool(), get_write_addr(master_byteen(7, 0)), master_addr(2, 0)))
  buf_tag_in := master_tag(TAG - 1, 0)
  buf_byteen_in := wrbuf_byteen(7,0)
  buf_data_in := Mux((buf_state === data_rd), ahb_hrdata_q(63, 0), master_wdata(63, 0))
  buf_size_in := Mux((buf_aligned_in & (master_size(1,0) === "b11".U) & (master_opc(2, 1) === "b01".U)).asBool(),get_write_size(master_byteen(7,0)), master_size(1,0))
  buf_aligned_in := (master_opc(2, 0) === 0.U) | // reads are always aligned since they are either DW or sideeffects
    (master_size(1, 0) === 0.U) | (master_size(1, 0) === "b01".U(2.W)) | (master_size(1, 0) === "b10".U) | // Always aligned for Byte/HW/Word since they can be only for non-idempotent. IFU/SB are always aligned
    ((master_size(1, 0) === "b11".U) & ((master_byteen(7, 0) === "h3".U) | (master_byteen(7, 0) === "hc".U) | (master_byteen(7, 0) === "h30".U) | (master_byteen(7, 0) === "hc0".U) |
      (master_byteen(7, 0) === "hf".U) | (master_byteen(7, 0) === "hf0".U) | (master_byteen(7, 0) === "hff".U)))
  // Generate the ahb signals
  io.ahb.out.haddr := Mux(bypass_en.asBool(), Cat(master_addr(31, 3), buf_cmd_byte_ptr(2, 0)), Cat(buf_addr(31, 3), buf_cmd_byte_ptr(2, 0)))
  io.ahb.out.hsize := Mux(bypass_en.asBool(), Cat(0.U, (Fill(2, buf_aligned_in) & buf_size_in(1, 0))), Cat("b0".U, (Fill(2, buf_aligned) & buf_size(1, 0))))

  io.ahb.out.hburst := "b0".U
  io.ahb.out.hmastlock := "b0".U
  io.ahb.out.hprot := Cat("b001".U, ~io.axi_arprot(2))
  io.ahb.out.hwrite := Mux(bypass_en.asBool(), (master_opc(2, 1) === "b01".U), buf_write)
  io.ahb.out.hwdata := buf_data(63, 0)

  slave_valid := slave_valid_pre
  slave_opc := Cat(Mux(slvbuf_write.asBool(), "b11".U, "b00".U), Fill(2, slvbuf_error) & "b10".U)
  slave_rdata := Mux(slvbuf_error.asBool(), Fill(2, last_bus_addr(31, 0)), Mux((buf_state === done), buf_data(63, 0), ahb_hrdata_q(63, 0)))
  slave_tag := slvbuf_tag(TAG - 1, 0)

  last_addr_en := (io.ahb.out.htrans(1, 0) =/= "b0".U) & io.ahb.in.hready & io.ahb.out.hwrite
  // Write buffer
  wrbuf_en := io.axi_awvalid & io.axi_awready & master_ready
  wrbuf_data_en := io.axi_wvalid & io.axi_wready & master_ready
  wrbuf_cmd_sent := master_valid & master_ready & (master_opc(2, 1) === "b01".U)
  wrbuf_rst := wrbuf_cmd_sent & !wrbuf_en

  io.axi_awready := !(wrbuf_vld & !wrbuf_cmd_sent) & master_ready
  io.axi_wready := !(wrbuf_data_vld & !wrbuf_cmd_sent) & master_ready
  io.axi_arready := !(wrbuf_vld & wrbuf_data_vld) & master_ready
  io.axi_rlast := true.B

  wrbuf_vld         := withClock(bus_clk) {RegNext(Mux(wrbuf_en.asBool(),1.U,wrbuf_vld) & !wrbuf_rst, 0.U)}
  wrbuf_data_vld    := withClock(bus_clk) {RegNext(Mux(wrbuf_data_en.asBool(),1.U, wrbuf_data_vld) & !wrbuf_rst, 0.U)}
  wrbuf_tag         := withClock(bus_clk) {RegEnable(io.axi_awid(TAG - 1, 0), 0.U, wrbuf_en.asBool())}
  wrbuf_size        := withClock(bus_clk) {RegEnable(io.axi_awsize(2, 0), 0.U, wrbuf_en.asBool())}
  wrbuf_addr        := rvdffe(io.axi_awaddr, wrbuf_en.asBool,bus_clk,io.scan_mode)
  wrbuf_data        := rvdffe(io.axi_wdata, wrbuf_data_en.asBool,bus_clk,io.scan_mode)
  wrbuf_byteen      := withClock(bus_clk) {RegEnable(io.axi_wstrb(7, 0), 0.U, wrbuf_data_en.asBool())}
  last_bus_addr     := withClock(ahbm_clk) {RegEnable(io.ahb.out.haddr(31, 0), 0.U, last_addr_en.asBool())}
  buf_write         := withClock(buf_clk) {RegEnable(buf_write_in, 0.U, buf_wr_en.asBool())}
  buf_tag           := withClock(buf_clk) {RegEnable(buf_tag_in(TAG - 1, 0), 0.U, buf_wr_en.asBool())}
  buf_addr          := rvdffe(buf_addr_in(31, 0),(buf_wr_en & io.bus_clk_en).asBool,clock,io.scan_mode)
  buf_size          := withClock(buf_clk) {RegEnable(buf_size_in(1, 0), 0.U, buf_wr_en.asBool())}
  buf_aligned       := withClock(buf_clk) {RegEnable(buf_aligned_in, 0.U, buf_wr_en.asBool())}
  buf_byteen        := withClock(buf_clk) {RegEnable(buf_byteen_in(7, 0), 0.U, buf_wr_en.asBool())}
  buf_data          := rvdffe(buf_data_in(63, 0),(buf_data_wr_en & io.bus_clk_en).asBool(),clock,io.scan_mode)
  slvbuf_write      := withClock(buf_clk) {RegEnable(buf_write, 0.U, slvbuf_wr_en.asBool())}
  slvbuf_tag        := withClock(buf_clk) {RegEnable(buf_tag(TAG - 1, 0), 0.U, slvbuf_wr_en.asBool())}
  slvbuf_error      := withClock(ahbm_clk) {RegEnable(slvbuf_error_in, 0.U, slvbuf_error_en.asBool())}
  cmd_doneQ         := withClock(ahbm_clk) {RegNext(Mux(cmd_done.asBool(),1.U,cmd_doneQ) & !cmd_done_rst, 0.U)}
  buf_cmd_byte_ptrQ := withClock(ahbm_clk) {RegEnable(buf_cmd_byte_ptr(2, 0), 0.U, buf_cmd_byte_ptr_en.asBool())}
  ahb_hready_q      := withClock(ahbm_clk) {RegNext(io.ahb.in.hready, 0.U)}
  ahb_htrans_q      := withClock(ahbm_clk) {RegNext(io.ahb.out.htrans(1, 0), 0.U)}
  ahb_hwrite_q      := withClock(ahbm_addr_clk) {RegNext(io.ahb.out.hwrite, 0.U)}
  ahb_hresp_q       := withClock(ahbm_clk) {RegNext(io.ahb.in.hresp, 0.U)}
  ahb_hrdata_q      := withClock(ahbm_data_clk) {RegNext(io.ahb.in.hrdata(63, 0), 0.U)}

  buf_clken := io.bus_clk_en & (buf_wr_en | slvbuf_wr_en | io.clk_override)
  ahbm_addr_clken := io.bus_clk_en & ((io.ahb.in.hready & io.ahb.out.htrans(1)) | io.clk_override)
  ahbm_data_clken := io.bus_clk_en & ((buf_state =/= idle) | io.clk_override)

  //Clkhdr
  buf_clk  := rvclkhdr(clock, buf_clken, io.scan_mode)
  ahbm_clk := rvclkhdr(clock, io.bus_clk_en, io.scan_mode)
  ahbm_addr_clk := rvclkhdr(clock, ahbm_addr_clken, io.scan_mode)
  ahbm_data_clk := rvclkhdr(clock, ahbm_data_clken, io.scan_mode)
}
