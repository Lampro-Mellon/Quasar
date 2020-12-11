package dbg

import chisel3._
import chisel3.util._
import include._
import lib._
import dec._

class dbg_dma extends Bundle {
  val dbg_dma_bubble        = Input(Bool())     // Debug needs a bubble to send a valid
  val dma_dbg_ready         = Output(Bool())    // DMA is ready to accept debug request

}

object state_t {
  val idle = 0.U(3.W)
  val halting = 1.U(3.W)
  val halted = 2.U(3.W)
  val cmd_start = 3.U(3.W)
  val cmd_wait = 4.U(3.W)
  val cmd_done = 5.U(3.W)
  val resuming = 6.U(3.W)
}

object sb_state_t {
  val sbidle = 0.U(4.W)
  val wait_rd = 1.U(4.W)
  val wait_wr = 2.U(4.W)
  val cmd_rd = 3.U(4.W)
  val cmd_wr = 4.U(4.W)
  val cmd_wr_addr = 5.U(4.W)
  val cmd_wr_data = 6.U(4.W)
  val rsp_rd = 7.U(4.W)
  val rsp_wr = 8.U(4.W)
  val done = 9.U(4.W)
}

class dbg extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle {
    val dbg_cmd_size = Output(UInt(2.W))
    val dbg_core_rst_l = Output(Bool())
    val core_dbg_rddata = Input(UInt(32.W))
    val core_dbg_cmd_done = Input(Bool())
    val core_dbg_cmd_fail = Input(Bool())
    val dbg_halt_req = Output(Bool())
    val dbg_resume_req = Output(Bool())
    val dec_tlu_debug_mode = Input(Bool())
    val dec_tlu_dbg_halted = Input(Bool())
    val dec_tlu_mpc_halted_only = Input(Bool())
    val dec_tlu_resume_ack = Input(Bool())
    val dmi_reg_en = Input(Bool())
    val dmi_reg_addr = Input(UInt(7.W))
    val dmi_reg_wr_en = Input(Bool())
    val dmi_reg_wdata = Input(UInt(32.W))
    val dmi_reg_rdata = Output(UInt(32.W))
    val sb_axi = new axi_channels(SB_BUS_TAG)
    val dbg_dec = Flipped(new dec_dbg)
    val dbg_dma = Flipped(new dec_dbg)
    val dbg_dma_io = Flipped(new dbg_dma)
    val dbg_bus_clk_en = Input(Bool())
    val dbg_rst_l = Input(Bool())
    val clk_override = Input(Bool())
    val scan_mode = Input(Bool())
  })

  val dbg_state = WireInit(state_t.idle)
  val dbg_state_en = WireInit(false.B)
  val sb_state = WireInit(sb_state_t.sbidle)
  val sb_state_en = WireInit(Bool(), false.B)
  val dmcontrol_reg = WireInit(0.U(32.W))
  val sbaddress0_reg = WireInit(0.U(32.W))
  val sbcs_sbbusy_wren = WireInit(false.B)
  val sbcs_sberror_wren = WireInit(false.B)
  val sb_bus_rdata = WireInit(0.U(64.W))
  val sbaddress0_reg_wren1 = WireInit(false.B)
  val dmstatus_reg = WireInit(0.U(32.W))
  val dmstatus_havereset = WireInit(false.B)
  val dmstatus_resumeack = WireInit(false.B)
  val dmstatus_unavail = WireInit(false.B)
  val dmstatus_running = WireInit(false.B)
  val dmstatus_halted = WireInit(false.B)
  val abstractcs_busy_wren = WireInit(false.B)
  val abstractcs_busy_din = WireInit(false.B)
  val sb_bus_cmd_read = WireInit(false.B)
  val sb_bus_cmd_write_addr = WireInit(false.B)
  val sb_bus_cmd_write_data = WireInit(false.B)
  val sb_bus_rsp_read = WireInit(false.B)
  val sb_bus_rsp_error = WireInit(false.B)
  val sb_bus_rsp_write = WireInit(false.B)
  val sbcs_sbbusy_din = WireInit(false.B)
  val sbcs_sberror_din = WireInit(0.U(3.W))
  val data1_reg = WireInit(0.U(32.W))
  val sbcs_reg = WireInit(0.U(32.W))

  val dbg_free_clken = io.dmi_reg_en | (dbg_state =/= state_t.idle) | dbg_state_en | io.dec_tlu_dbg_halted | io.clk_override
  val sb_free_clken = io.dmi_reg_en | sb_state_en | (sb_state =/= sb_state_t.sbidle) | io.clk_override;
  val dbg_free_clk = rvclkhdr(clock, dbg_free_clken, io.scan_mode) // dbg_free_cgc
  val sb_free_clk = rvclkhdr(clock, sb_free_clken, io.scan_mode) // sb_free_cgc
  val dbg_dm_rst_l = io.dbg_rst_l.asBool() & (dmcontrol_reg(0) | io.scan_mode)
  io.dbg_core_rst_l := (!dmcontrol_reg(1)).asBool()
  val sbcs_wren = (io.dmi_reg_addr === "h38".U) & io.dmi_reg_en & io.dmi_reg_wr_en & (sb_state === sb_state_t.sbidle)
  val sbcs_sbbusyerror_wren = (sbcs_wren & io.dmi_reg_wdata(22)) | ((sb_state =/= sb_state_t.sbidle) & io.dmi_reg_en &
    ((io.dmi_reg_addr === "h39".U) | (io.dmi_reg_addr === "h3c".U) | (io.dmi_reg_addr === "h3d".U)))

  val sbcs_sbbusyerror_din = (~(sbcs_wren & io.dmi_reg_wdata(22))).asUInt()
  val temp_sbcs_22 = withClockAndReset(sb_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(sbcs_sbbusyerror_din, 0.U, sbcs_sbbusyerror_wren)
  } // sbcs_sbbusyerror_reg

  val temp_sbcs_21 = withClockAndReset(sb_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(sbcs_sbbusy_din, 0.U, sbcs_sbbusy_wren)
  } // sbcs_sbbusy_reg

  val temp_sbcs_20 = withClockAndReset(sb_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(io.dmi_reg_wdata(20), 0.U, sbcs_wren)
  } // sbcs_sbreadonaddr_reg

  val temp_sbcs_19_15 = withClockAndReset(sb_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(io.dmi_reg_wdata(19, 15), 0.U, sbcs_wren)
  } // sbcs_misc_reg

  val temp_sbcs_14_12 = withClockAndReset(sb_free_clk, (!dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(sbcs_sberror_din(2, 0), 0.U, sbcs_sberror_wren)
  } // sbcs_error_reg
  sbcs_reg := Cat(1.U(3.W), 0.U(6.W), temp_sbcs_22, temp_sbcs_21, temp_sbcs_20, temp_sbcs_19_15, temp_sbcs_14_12, "h20".U(7.W), "b01111".U(5.W))

  val sbcs_unaligned = (sbcs_reg(19, 17) === "b001".U(3.W)) & sbaddress0_reg(0) |
    (sbcs_reg(19, 17) === "b010".U(3.W)) & sbaddress0_reg(1, 0).orR |
    (sbcs_reg(19, 17) === "b011".U(3.W)) & sbaddress0_reg(2, 0).orR

  val sbcs_illegal_size = sbcs_reg(19)
  val sbaddress0_incr = Fill(4, (sbcs_reg(19, 17) === "h0".U)) & "b0001".U(4.W) | Fill(4, (sbcs_reg(19, 17) === "h1".U)) & "b0010".U(4.W) |
    Fill(4, (sbcs_reg(19, 17) === "h2".U)) & "b0100".U(4.W) | Fill(4, (sbcs_reg(19, 17) === "h3".U)) & "b1000".U(4.W)

  val sbdata0_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3c".U)
  val sbdata0_reg_wren1 = (sb_state === sb_state_t.rsp_rd) & sb_state_en & !sbcs_sberror_wren
  val sbdata0_reg_wren = sbdata0_reg_wren0 | sbdata0_reg_wren1
  val sbdata1_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3d".U)
  val sbdata1_reg_wren1 = (sb_state === sb_state_t.rsp_rd) & sb_state_en & !sbcs_sberror_wren
  val sbdata1_reg_wren = sbdata1_reg_wren0 | sbdata1_reg_wren1
  val sbdata0_din = Fill(32, sbdata0_reg_wren0) & io.dmi_reg_wdata |
    Fill(32, sbdata0_reg_wren1) & sb_bus_rdata(31, 0)

  val sbdata1_din = Fill(32, sbdata1_reg_wren0) & io.dmi_reg_wdata |
    Fill(32, sbdata1_reg_wren1) & sb_bus_rdata(63, 32)

  val sbdata0_reg = withReset((dbg_dm_rst_l).asAsyncReset()) {
    rvdffe(sbdata0_din, sbdata0_reg_wren, clock, io.scan_mode)
  } // dbg_sbdata0_reg

  val sbdata1_reg = withReset((dbg_dm_rst_l).asAsyncReset()) {
    rvdffe(sbdata1_din, sbdata1_reg_wren, clock, io.scan_mode)
  } // dbg_sbdata1_reg

  val sbaddress0_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h39".U)
  val sbaddress0_reg_wren = sbaddress0_reg_wren0 | sbaddress0_reg_wren1
  val sbaddress0_reg_din = Fill(32, sbaddress0_reg_wren0) & io.dmi_reg_wdata |
    Fill(32, sbaddress0_reg_wren1) & (sbaddress0_reg + Cat(0.U(28.W), sbaddress0_incr))
  sbaddress0_reg := withReset((dbg_dm_rst_l).asAsyncReset()) {
    rvdffe(sbaddress0_reg_din, sbaddress0_reg_wren, clock, io.scan_mode)
  } // dbg_sbaddress0_reg

  val sbreadonaddr_access = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h39".U) & sbcs_reg(20)
  val sbreadondata_access = io.dmi_reg_en & !io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3c".U) & sbcs_reg(15)
  val sbdata0wr_access = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3c".U)
  val dmcontrol_wren = (io.dmi_reg_addr === "h10".U) & io.dmi_reg_en & io.dmi_reg_wr_en
  val dm_temp = withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(
      Cat(io.dmi_reg_wdata(31, 30), io.dmi_reg_wdata(28), io.dmi_reg_wdata(1)),
      0.U, dmcontrol_wren)
  } // dmcontrolff

  val dm_temp_0 = withClockAndReset(dbg_free_clk, io.dbg_rst_l.asAsyncReset()) {
    RegEnable(io.dmi_reg_wdata(0), 0.U, dmcontrol_wren)
  } // dmcontrol_dmactive_ff

  val temp = Cat(dm_temp(3, 2), 0.U, dm_temp(1), 0.U(26.W), dm_temp(0), dm_temp_0)
  dmcontrol_reg := temp

  val dmcontrol_wren_Q = withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegNext(dmcontrol_wren, 0.U)
  } // dmcontrol_wrenff

  dmstatus_reg := Cat(0.U(12.W), Fill(2, dmstatus_havereset), Fill(2, dmstatus_resumeack), 0.U(2.W), Fill(2, dmstatus_unavail), Fill(2, dmstatus_running), Fill(2, dmstatus_halted), 1.U(1.W), 0.U(3.W), 2.U(4.W))

  val dmstatus_resumeack_wren = (dbg_state === state_t.resuming) & io.dec_tlu_resume_ack | dmstatus_resumeack & !dmcontrol_reg(30)
  val dmstatus_resumeack_din = (dbg_state === state_t.resuming) & io.dec_tlu_resume_ack
  val dmstatus_havereset_wren = (io.dmi_reg_addr === "h10".U) & io.dmi_reg_wdata(1) & io.dmi_reg_en & io.dmi_reg_wr_en
  val dmstatus_havereset_rst = (io.dmi_reg_addr === "h10".U) & io.dmi_reg_wdata(28) & io.dmi_reg_en & io.dmi_reg_wr_en;
  val temp_rst = reset.asBool()
  dmstatus_unavail := (dmcontrol_reg(1) | !(temp_rst)).asBool()
  dmstatus_running := ~(dmstatus_unavail | dmstatus_halted)
  dmstatus_resumeack := withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(dmstatus_resumeack_din, 0.U, dmstatus_resumeack_wren)
  } // dmstatus_resumeack_reg

  dmstatus_halted := withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegNext(io.dec_tlu_dbg_halted & !io.dec_tlu_mpc_halted_only, 0.U)
  } // dmstatus_halted_reg

  dmstatus_havereset := withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegNext(Mux(dmstatus_havereset_wren, true.B, dmstatus_havereset) & !dmstatus_havereset_rst, false.B)
  } // dmstatus_havereset_reg

  val haltsum0_reg = Cat(0.U(31.W), dmstatus_halted)
  val abstractcs_reg = WireInit(2.U(32.W))

  val abstractcs_error_sel0 = abstractcs_reg(12) & io.dmi_reg_en & (io.dmi_reg_wr_en & ((io.dmi_reg_addr === "h16".U) | (io.dmi_reg_addr === "h17".U)) | (io.dmi_reg_addr === "h4".U))
  val abstractcs_error_sel1 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h17".U) & !((io.dmi_reg_wdata(31, 24) === 0.U) | (io.dmi_reg_wdata(31, 24) === "h2".U))
  val abstractcs_error_sel2 = io.core_dbg_cmd_done & io.core_dbg_cmd_fail
  val abstractcs_error_sel3 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h17".U) & !dmstatus_reg(9);
  val abstractcs_error_sel4 = (io.dmi_reg_addr === "h17".U) & io.dmi_reg_en & io.dmi_reg_wr_en &
    ((io.dmi_reg_wdata(22, 20) =/= "b010".U(3.W)) | ((io.dmi_reg_wdata(31, 24) === "h2".U) && data1_reg(1, 0).orR))

  val abstractcs_error_sel5 = (io.dmi_reg_addr === "h16".U) & io.dmi_reg_en & io.dmi_reg_wr_en
  val abstractcs_error_selor = abstractcs_error_sel0 | abstractcs_error_sel1 | abstractcs_error_sel2 | abstractcs_error_sel3 | abstractcs_error_sel4 | abstractcs_error_sel5
  val abstractcs_error_din = (Fill(3, abstractcs_error_sel0) & "b001".U(3.W)) |
    (Fill(3, abstractcs_error_sel1) & "b010".U(3.W)) |
    (Fill(3, abstractcs_error_sel2) & "b011".U(3.W)) |
    (Fill(3, abstractcs_error_sel3) & "b100".U(3.W)) |
    (Fill(3, abstractcs_error_sel4) & "b111".U(3.W)) |
    (Fill(3, abstractcs_error_sel5) & (~io.dmi_reg_wdata(10, 8)).asUInt() & abstractcs_reg(10, 8)) |
    (Fill(3, (~abstractcs_error_selor).asUInt()) & abstractcs_reg(10, 8))

  val abs_temp_12 = withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(abstractcs_busy_din, 0.U, abstractcs_busy_wren)
  } // dmabstractcs_busy_reg

  val abs_temp_10_8 = withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegNext(abstractcs_error_din(2, 0), 0.U)
  } // dmabstractcs_error_reg

  abstractcs_reg := Cat(0.U(19.W), abs_temp_12, 0.U(1.W), abs_temp_10_8, 2.U(8.W))

  val command_wren = (io.dmi_reg_addr === "h17".U) & io.dmi_reg_en & io.dmi_reg_wr_en & (dbg_state === state_t.halted)
  val command_din = Cat(io.dmi_reg_wdata(31, 24), 0.U(1.W), io.dmi_reg_wdata(22, 20), 0.U(3.W), io.dmi_reg_wdata(16, 0))
  val command_reg = withReset((dbg_dm_rst_l).asAsyncReset()) {
    rvdffe(command_din, command_wren,clock,io.scan_mode)
  } // dmcommand_reg

  val data0_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h4".U) & (dbg_state === state_t.halted)
  val data0_reg_wren1 = io.core_dbg_cmd_done & (dbg_state === state_t.cmd_wait) & !command_reg(16)

  val data0_reg_wren = data0_reg_wren0 | data0_reg_wren1
  val data0_din = Fill(32, data0_reg_wren0) & io.dmi_reg_wdata | Fill(32, data0_reg_wren1) & io.core_dbg_rddata
  val data0_reg = withReset((dbg_dm_rst_l).asAsyncReset()) {
    rvdffe(data0_din,data0_reg_wren,clock,io.scan_mode)
  } // dbg_data0_reg

  val data1_reg_wren = (io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h5".U) & (dbg_state === state_t.halted))
  val data1_din = Fill(32, data1_reg_wren) & io.dmi_reg_wdata
  data1_reg := withReset((dbg_dm_rst_l).asAsyncReset()) {
    rvdffe(data1_din, data1_reg_wren, clock, io.scan_mode)
  } // dbg_data1_reg

  val dbg_nxtstate = WireInit(state_t.idle)
  dbg_nxtstate := state_t.idle
  dbg_state_en := false.B
  abstractcs_busy_wren := false.B
  abstractcs_busy_din := false.B
  io.dbg_halt_req := false.B
  io.dbg_resume_req := false.B
  switch(dbg_state) {
    is(state_t.idle) {
      dbg_nxtstate := Mux(dmstatus_reg(9) | io.dec_tlu_mpc_halted_only, state_t.halted, state_t.halting)
      dbg_state_en := ((dmcontrol_reg(31) & !io.dec_tlu_debug_mode) | dmstatus_reg(9) | io.dec_tlu_mpc_halted_only) & !dmcontrol_reg(1)
      io.dbg_halt_req := (dmcontrol_reg(31) & !dmcontrol_reg(1)).asBool()
    }
    is(state_t.halting) {
      dbg_nxtstate := Mux(dmcontrol_reg(1), state_t.idle, state_t.halted)
      dbg_state_en := dmstatus_reg(9) | dmcontrol_reg(1)
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31) & (~dmcontrol_reg(1)).asUInt()).asBool()
    }
    is(state_t.halted) {
      dbg_nxtstate := Mux(dmstatus_reg(9) & !dmcontrol_reg(1),
        Mux(dmcontrol_reg(30) & !dmcontrol_reg(31), state_t.resuming, state_t.cmd_start),
        Mux(dmcontrol_reg(31), state_t.halting, state_t.idle))
      dbg_state_en := dmstatus_reg(9) & dmcontrol_reg(30) & !dmcontrol_reg(31) & dmcontrol_wren_Q | command_wren |
        dmcontrol_reg(1) | !(dmstatus_reg(9) | io.dec_tlu_mpc_halted_only)
      abstractcs_busy_wren := dbg_state_en & (dbg_nxtstate === state_t.cmd_start)
      abstractcs_busy_din := "b1".U
      io.dbg_resume_req := (dbg_state_en & (dbg_nxtstate === state_t.resuming)).asBool()
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31) & (~dmcontrol_reg(1)).asUInt()).asBool()
    }
    is(state_t.cmd_start) {
      dbg_nxtstate := Mux(dmcontrol_reg(1), state_t.idle, Mux(abstractcs_reg(10, 8).orR, state_t.cmd_done, state_t.cmd_wait))
      dbg_state_en := io.dbg_dec.dbg_ib.dbg_cmd_valid | abstractcs_reg(10, 8).orR | dmcontrol_reg(1)
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31) & (~dmcontrol_reg(1)).asUInt()).asBool()
    }
    is(state_t.cmd_wait) {
      dbg_nxtstate := Mux(dmcontrol_reg(1), state_t.idle, state_t.cmd_done)
      dbg_state_en := io.core_dbg_cmd_done | dmcontrol_reg(1)
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31) & (~dmcontrol_reg(1)).asUInt()).asBool()
    }
    is(state_t.cmd_done) {
      dbg_nxtstate := Mux(dmcontrol_reg(1), state_t.idle, state_t.halted)
      dbg_state_en := true.B
      abstractcs_busy_wren := dbg_state_en
      abstractcs_busy_din := "b0".U
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31) & (~dmcontrol_reg(1)).asUInt()).asBool()
    }
    is(state_t.resuming) {
      dbg_nxtstate := state_t.idle;
      dbg_state_en := dmstatus_reg(17) | dmcontrol_reg(1)
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31) & (~dmcontrol_reg(1)).asUInt()).asBool()
    }}

  val dmi_reg_rdata_din = Fill(32, io.dmi_reg_addr === "h4".U).asUInt & data0_reg | Fill(32, io.dmi_reg_addr === "h5".U) & data1_reg |
    Fill(32, io.dmi_reg_addr === "h10".U) & dmcontrol_reg | Fill(32, io.dmi_reg_addr === "h11".U) & dmstatus_reg |
    Fill(32, io.dmi_reg_addr === "h16".U) & abstractcs_reg | Fill(32, io.dmi_reg_addr === "h17".U) & command_reg |
    Fill(32, io.dmi_reg_addr === "h40".U) & haltsum0_reg | Fill(32, io.dmi_reg_addr === "h38".U) & sbcs_reg |
    Fill(32, io.dmi_reg_addr === "h39".U) & sbaddress0_reg | Fill(32, io.dmi_reg_addr === "h3c".U) & sbdata0_reg |
    Fill(32, io.dmi_reg_addr === "h3d".U) & sbdata1_reg

  dbg_state := withClockAndReset(dbg_free_clk, (dbg_dm_rst_l & temp_rst).asAsyncReset()) {
    RegEnable(dbg_nxtstate, 0.U, dbg_state_en)
  } // dbg_state_reg


  io.dmi_reg_rdata := withClockAndReset(dbg_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(dmi_reg_rdata_din, 0.U, io.dmi_reg_en)
  } // dmi_rddata_reg

  io.dbg_dec.dbg_ib.dbg_cmd_addr := Mux((command_reg(31, 24) === "h2".U), Cat(data1_reg(31, 2), "b00".U(2.W)), Cat(0.U(20.W), command_reg(11, 0)))
  io.dbg_dec.dbg_dctl.dbg_cmd_wrdata := data0_reg(31, 0)
  io.dbg_dec.dbg_ib.dbg_cmd_valid := ((dbg_state === state_t.cmd_start) & !(abstractcs_reg(10, 8).orR) & io.dbg_dma_io.dma_dbg_ready).asBool()
  io.dbg_dec.dbg_ib.dbg_cmd_write := command_reg(16).asBool()
  io.dbg_dec.dbg_ib.dbg_cmd_type := Mux((command_reg(31, 24) === "h2".U), "b10".U(2.W), Cat("b0".U, (command_reg(15, 12) === "b0".U)))
  io.dbg_cmd_size := command_reg(21, 20)
  io.dbg_dma_io.dbg_dma_bubble := ((dbg_state === state_t.cmd_start) & !(abstractcs_reg(10, 8).orR) | (dbg_state === state_t.cmd_wait)).asBool()

  val sb_nxtstate = WireInit(sb_state_t.sbidle)
  sb_nxtstate := sb_state_t.sbidle
  //sb_state_en := true.B
  sbcs_sbbusy_wren := false.B
  sbcs_sbbusy_din := false.B
  sbcs_sberror_wren := false.B
  sbcs_sberror_din := 0.U(3.W)
  sbaddress0_reg_wren1 := false.B
  switch(sb_state) {
    is(sb_state_t.sbidle) {
      sb_nxtstate := Mux(sbdata0wr_access, sb_state_t.wait_wr, sb_state_t.wait_rd)
      sb_state_en := sbdata0wr_access | sbreadondata_access | sbreadonaddr_access
      sbcs_sbbusy_wren := sb_state_en
      sbcs_sbbusy_din := true.B
      sbcs_sberror_wren := sbcs_wren & io.dmi_reg_wdata(14, 12).orR
      sbcs_sberror_din := ~io.dmi_reg_wdata(14, 12) & sbcs_reg(14, 12)
    }
    is(sb_state_t.wait_rd) {
      sb_nxtstate := Mux(sbcs_unaligned | sbcs_illegal_size, sb_state_t.done, sb_state_t.cmd_rd)
      sb_state_en := io.dbg_bus_clk_en | sbcs_unaligned | sbcs_illegal_size
      sbcs_sberror_wren := sbcs_unaligned | sbcs_illegal_size
      sbcs_sberror_din := Mux(sbcs_unaligned, "b011".U(3.W), "b100".U(3.W))
    }
    is(sb_state_t.wait_wr) {
      sb_nxtstate := Mux(sbcs_unaligned | sbcs_illegal_size, sb_state_t.done, sb_state_t.cmd_wr)
      sb_state_en := io.dbg_bus_clk_en | sbcs_unaligned | sbcs_illegal_size
      sbcs_sberror_wren := sbcs_unaligned | sbcs_illegal_size;
      sbcs_sberror_din := Mux(sbcs_unaligned, "b011".U(3.W), "b100".U)
    }
    is(sb_state_t.cmd_rd) {
      sb_nxtstate := sb_state_t.rsp_rd
      sb_state_en := sb_bus_cmd_read & io.dbg_bus_clk_en
    }
    is(sb_state_t.cmd_wr) {
      sb_nxtstate := Mux(sb_bus_cmd_write_addr & sb_bus_cmd_write_data, sb_state_t.rsp_wr, Mux(sb_bus_cmd_write_data, sb_state_t.cmd_wr_addr, sb_state_t.cmd_wr_data))
      sb_state_en := (sb_bus_cmd_write_addr | sb_bus_cmd_write_data) & io.dbg_bus_clk_en
    }
    is(sb_state_t.cmd_wr_addr) {
      sb_nxtstate := sb_state_t.rsp_wr
      sb_state_en := sb_bus_cmd_write_addr & io.dbg_bus_clk_en
    }
    is(sb_state_t.cmd_wr_data) {
      sb_nxtstate := sb_state_t.rsp_wr
      sb_state_en := sb_bus_cmd_write_data & io.dbg_bus_clk_en
    }
    is(sb_state_t.rsp_rd) {
      sb_nxtstate := sb_state_t.done
      sb_state_en := sb_bus_rsp_read & io.dbg_bus_clk_en
      sbcs_sberror_wren := sb_state_en & sb_bus_rsp_error
      sbcs_sberror_din := "b010".U(3.W)
    }
    is(sb_state_t.rsp_wr) {
      sb_nxtstate := sb_state_t.done;
      sb_state_en := sb_bus_rsp_write & io.dbg_bus_clk_en
      sbcs_sberror_wren := sb_state_en & sb_bus_rsp_error
      sbcs_sberror_din := "b010".U(3.W)
    }
    is(sb_state_t.done) {
      sb_nxtstate := sb_state_t.sbidle;
      sb_state_en := true.B
      sbcs_sbbusy_wren := true.B
      sbcs_sbbusy_din := false.B
      sbaddress0_reg_wren1 := sbcs_reg(16)
    }}

  sb_state := withClockAndReset(sb_free_clk, (dbg_dm_rst_l).asAsyncReset()) {
    RegEnable(sb_nxtstate, 0.U, sb_state_en)
  } // sb_state_reg

  sb_bus_cmd_read := io.sb_axi.ar.valid & io.sb_axi.ar.ready
  sb_bus_cmd_write_addr := io.sb_axi.aw.valid & io.sb_axi.aw.ready
  sb_bus_cmd_write_data := io.sb_axi.w.valid & io.sb_axi.w.ready
  sb_bus_rsp_read := io.sb_axi.r.valid & io.sb_axi.r.ready
  sb_bus_rsp_write := io.sb_axi.b.valid & io.sb_axi.b.ready
  sb_bus_rsp_error := sb_bus_rsp_read & io.sb_axi.r.bits.resp(1, 0).orR | sb_bus_rsp_write & io.sb_axi.b.bits.resp(1, 0).orR
  io.sb_axi.aw.valid := ((sb_state === sb_state_t.cmd_wr) | (sb_state === sb_state_t.cmd_wr_addr)).asBool()
  io.sb_axi.aw.bits.addr := sbaddress0_reg
  io.sb_axi.aw.bits.id := 0.U
  io.sb_axi.aw.bits.size := sbcs_reg(19, 17)
  io.sb_axi.aw.bits.prot := 0.U
  io.sb_axi.aw.bits.cache := "b1111".U
  io.sb_axi.aw.bits.region := sbaddress0_reg(31, 28)
  io.sb_axi.aw.bits.len := 0.U
  io.sb_axi.aw.bits.burst := "b01".U(2.W)
  io.sb_axi.aw.bits.qos := 0.U
  io.sb_axi.aw.bits.lock := false.B
  io.sb_axi.w.valid := ((sb_state === sb_state_t.cmd_wr) | (sb_state === sb_state_t.cmd_wr_data)).asBool()
  io.sb_axi.w.bits.data := Fill(64, (sbcs_reg(19, 17) === 0.U)) & Fill(8, (sbdata0_reg(7, 0))) | Fill(64, (sbcs_reg(19, 17) === "h1".U)) & Fill(4, sbdata0_reg(15, 0)) |
    Fill(64, (sbcs_reg(19, 17) === "h2".U)) & Fill(2, (sbdata0_reg(31, 0))) | Fill(64, (sbcs_reg(19, 17) === "h3".U)) & Cat(sbdata1_reg(31, 0), sbdata0_reg(31, 0))

  io.sb_axi.w.bits.strb := Fill(8, (sbcs_reg(19, 17) === "h0".U)) & ("h1".U(8.W) << sbaddress0_reg(2, 0)) |
    Fill(8, (sbcs_reg(19, 17) === "h1".U)) & ("h3".U(8.W) << Cat(sbaddress0_reg(2, 1), "b0".U)) |
    Fill(8, (sbcs_reg(19, 17) === "h2".U)) & ("hf".U(8.W) << Cat(sbaddress0_reg(2), "b00".U(2.W))) |
    Fill(8, (sbcs_reg(19, 17) === "h3".U)) & "hff".U

  io.sb_axi.w.bits.last := true.B
  io.sb_axi.ar.valid := (sb_state === sb_state_t.cmd_rd).asBool()
  io.sb_axi.ar.bits.addr := sbaddress0_reg
  io.sb_axi.ar.bits.id := 0.U
  io.sb_axi.ar.bits.size := sbcs_reg(19, 17)
  io.sb_axi.ar.bits.prot := 0.U
  io.sb_axi.ar.bits.cache := 0.U
  io.sb_axi.ar.bits.region := sbaddress0_reg(31, 28)
  io.sb_axi.ar.bits.len := 0.U
  io.sb_axi.ar.bits.burst := "b01".U(2.W)
  io.sb_axi.ar.bits.qos := 0.U
  io.sb_axi.ar.bits.lock := false.B
  io.sb_axi.b.ready := true.B
  io.sb_axi.r.ready := true.B
  sb_bus_rdata := Fill(64, (sbcs_reg(19, 17) === "h0".U)) & ((io.sb_axi.r.bits.data(63, 0) >> 8.U * sbaddress0_reg(2, 0)) & "hff".U(64.W)) |
    Fill(64, (sbcs_reg(19, 17) === "h1".U)) & ((io.sb_axi.r.bits.data(63, 0) >> 16.U * sbaddress0_reg(2, 1)) & "hffff".U(64.W)) |
    Fill(64, (sbcs_reg(19, 17) === "h2".U)) & ((io.sb_axi.r.bits.data(63, 0) >> 32.U * sbaddress0_reg(2)) & "hffff_ffff".U(64.W)) |
    Fill(64, (sbcs_reg(19, 17) === "h3".U)) & io.sb_axi.r.bits.data(63, 0)


  io.dbg_dma.dbg_ib.dbg_cmd_addr      := io.dbg_dec.dbg_ib.dbg_cmd_addr
  io.dbg_dma.dbg_dctl.dbg_cmd_wrdata  := io.dbg_dec.dbg_dctl.dbg_cmd_wrdata
  io.dbg_dma.dbg_ib.dbg_cmd_valid     := io.dbg_dec.dbg_ib.dbg_cmd_valid
  io.dbg_dma.dbg_ib.dbg_cmd_write     := io.dbg_dec.dbg_ib.dbg_cmd_write
  io.dbg_dma.dbg_ib.dbg_cmd_type      := io.dbg_dec.dbg_ib.dbg_cmd_type
}
