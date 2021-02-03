package dbg

import chisel3._
import chisel3.util._
import lib._
import include._

object state_t {
  val idle            = 0.U(4.W)
  val halting         = 1.U(4.W)
  val halted          = 2.U(4.W)
  val core_cmd_start  = 3.U(4.W)
  val core_cmd_wait   = 4.U(4.W)
  val sb_cmd_start    = 5.U(4.W)
  val sb_cmd_send     = 6.U(4.W)
  val sb_cmd_resp     = 7.U(4.W)
  val cmd_done        = 8.U(4.W)
  val resuming        = 9.U(4.W)
}

object sb_state_t {
  val sbidle          = 0.U(4.W)
  val wait_rd         = 1.U(4.W)
  val wait_wr         = 2.U(4.W)
  val cmd_rd          = 3.U(4.W)
  val cmd_wr          = 4.U(4.W)
  val cmd_wr_addr     = 5.U(4.W)
  val cmd_wr_data     = 6.U(4.W)
  val rsp_rd          = 7.U(4.W)
  val rsp_wr          = 8.U(4.W)
  val done            = 9.U(4.W)
}

class dbg extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle {
    val dbg_cmd_size              = Output(UInt(2.W))
    val dbg_core_rst_l            = Output(Bool())
    val core_dbg_rddata           = Input(UInt(32.W))
    val core_dbg_cmd_done         = Input(Bool())
    val core_dbg_cmd_fail         = Input(Bool())
    val dbg_halt_req              = Output(Bool())
    val dbg_resume_req            = Output(Bool())
    val dec_tlu_debug_mode        = Input(Bool())
    val dec_tlu_dbg_halted        = Input(Bool())
    val dec_tlu_mpc_halted_only   = Input(Bool())
    val dec_tlu_resume_ack        = Input(Bool())
    val dmi_reg_en                = Input(Bool())
    val dmi_reg_addr              = Input(UInt(7.W))
    val dmi_reg_wr_en             = Input(Bool())
    val dmi_reg_wdata             = Input(UInt(32.W))
    val dmi_reg_rdata             = Output(UInt(32.W))

    val sb_axi = new axi_channels(SB_BUS_TAG)
    val dbg_dec_dma = Flipped(new dec_dbg)
    val dbg_dma = Flipped(new dbg_dma)

    val dbg_bus_clk_en            = Input(Bool())
    val dbg_rst_l                 = Input(AsyncReset())
    val clk_override              = Input(Bool())
    val scan_mode                 = Input(Bool())
  })

  val dbg_state                   = WireInit(state_t.idle)
  val dbg_state_en                = WireInit(false.B)
  val sb_state                    = WireInit(sb_state_t.sbidle)
  val sb_state_en                 = WireInit(Bool(), false.B)
  val dmcontrol_reg               = WireInit(0.U(32.W))
  val sbaddress0_reg              = WireInit(0.U(32.W))
  val sbcs_sbbusy_wren            = WireInit(false.B)
  val sbcs_sberror_wren           = WireInit(false.B)
  val sb_bus_rdata                = WireInit(0.U(64.W))
  val sbaddress0_reg_wren1        = WireInit(false.B)
  val dmstatus_reg                = WireInit(0.U(32.W))
  val dmstatus_havereset          = WireInit(false.B)
  val dmstatus_haveresetn         = WireInit(false.B)
  val dmstatus_resumeack          = WireInit(false.B)
  val dmstatus_unavail            = WireInit(false.B)
  val dmstatus_running            = WireInit(false.B)
  val dmstatus_halted             = WireInit(false.B)
  val abstractcs_busy_wren        = WireInit(false.B)
  val abstractcs_busy_din         = WireInit(false.B)
  val sb_bus_cmd_read             = WireInit(false.B)
  val sb_bus_cmd_write_addr       = WireInit(false.B)
  val sb_bus_cmd_write_data       = WireInit(false.B)
  val sb_bus_rsp_read             = WireInit(false.B)
  val sb_bus_rsp_error            = WireInit(false.B)
  val sb_bus_rsp_write            = WireInit(false.B)
  val sbcs_sbbusy_din             = WireInit(false.B)
  val sbcs_sberror_din            = WireInit(0.U(3.W))
  val data1_reg                   = WireInit(0.U(32.W))
  val sbcs_reg                    = WireInit(0.U(32.W))
  val execute_command             = WireInit(false.B)
  val command_reg                 = WireInit(0.U(32.W))
  val dbg_sb_bus_error            = WireInit(false.B)
  val command_wren                = WireInit(false.B)
  val command_din                 = WireInit(0.U(32.W))
  val dbg_cmd_next_addr           = WireInit(0.U(32.W))
  val data0_reg_wren2             = WireInit(false.B)
  val sb_abmem_cmd_done_in        = WireInit(false.B)
  val sb_abmem_data_done_in       = WireInit(false.B)
  val sb_abmem_cmd_done_en        = WireInit(false.B)
  val sb_abmem_data_done_en       = WireInit(false.B)
  val abmem_addr_external         = WireInit(false.B)
  val sb_cmd_pending              = WireInit(false.B)
  val sb_abmem_cmd_write          = WireInit(false.B)
  val abmem_addr_in_dccm_region   = WireInit(false.B)
  val abmem_addr_in_iccm_region   = WireInit(false.B)
  val abmem_addr_in_pic_region    = WireInit(false.B)
  val sb_abmem_cmd_size           = WireInit(0.U(4.W))
  val abstractcs_error_din        = WireInit(0.U(3.W))
  val dmcontrol_wren_Q            = WireInit(false.B)
  val abstractcs_reg              = WireInit(2.U(32.W))

  val dbg_free_clken  = io.dmi_reg_en | execute_command | (dbg_state =/= state_t.idle) | dbg_state_en | io.dec_tlu_dbg_halted |
    io.dec_tlu_mpc_halted_only | io.dec_tlu_debug_mode | io.dbg_halt_req | io.clk_override
  val sb_free_clken   = io.dmi_reg_en | execute_command | sb_state_en | (sb_state =/= sb_state_t.sbidle) | io.clk_override;

  val dbg_free_clk = rvclkhdr(clock, dbg_free_clken, io.scan_mode) // dbg_free_cgc
  val sb_free_clk  = rvclkhdr(clock, sb_free_clken, io.scan_mode) // sb_free_cgc

  val dbg_dm_rst_l          = (io.dbg_rst_l.asBool() & (dmcontrol_reg(0) | io.scan_mode)).asAsyncReset()
  io.dbg_core_rst_l        := (!dmcontrol_reg(1)).asBool() | io.scan_mode
  val sbcs_wren             = (io.dmi_reg_addr === "h38".U(7.W)) & io.dmi_reg_en & io.dmi_reg_wr_en & (sb_state === sb_state_t.sbidle)
  val sbcs_sbbusyerror_wren = (sbcs_wren & io.dmi_reg_wdata(22)) | (sbcs_reg(21) & io.dmi_reg_en & ((io.dmi_reg_wr_en &
    (io.dmi_reg_addr === "h39".U(7.W))) | (io.dmi_reg_addr === "h3c".U(7.W)) |
    (io.dmi_reg_addr === "h3d".U(7.W))))

  val sbcs_sbbusyerror_din  = (~(sbcs_wren & io.dmi_reg_wdata(22))).asUInt()
  val temp_sbcs_22          = withClockAndReset(sb_free_clk, dbg_dm_rst_l) {
    RegEnable(sbcs_sbbusyerror_din, 0.U, sbcs_sbbusyerror_wren)} // sbcs_sbbusyerror_reg
  val temp_sbcs_21          = withClockAndReset(sb_free_clk, dbg_dm_rst_l) {
    RegEnable(sbcs_sbbusy_din, 0.U, sbcs_sbbusy_wren)} // sbcs_sbbusy_reg
  val temp_sbcs_20          = withClockAndReset(sb_free_clk, dbg_dm_rst_l) {
    RegEnable(io.dmi_reg_wdata(20), 0.U, sbcs_wren)} // sbcs_sbreadonaddr_reg
  val temp_sbcs_19_15       = withClockAndReset(sb_free_clk, dbg_dm_rst_l) {
    RegEnable(Cat(io.dmi_reg_wdata(19), ~io.dmi_reg_wdata(18), io.dmi_reg_wdata(17, 15)), 0.U, sbcs_wren)} // sbcs_misc_reg
  val temp_sbcs_14_12       = withClockAndReset(sb_free_clk, dbg_dm_rst_l) {
    RegEnable(sbcs_sberror_din(2, 0), 0.U, sbcs_sberror_wren)} // sbcs_error_reg

  sbcs_reg := Cat(1.U(3.W), 0.U(6.W), temp_sbcs_22, temp_sbcs_21, temp_sbcs_20, temp_sbcs_19_15(4), ~temp_sbcs_19_15(3),
    temp_sbcs_19_15(2,0), temp_sbcs_14_12, "h20".U(7.W), "b01111".U(5.W))

  val sbcs_unaligned = (sbcs_reg(19, 17) === 1.U(3.W)) & sbaddress0_reg(0) |
    (sbcs_reg(19, 17) === 2.U(3.W)) & sbaddress0_reg(1, 0).orR |
    (sbcs_reg(19, 17) === 3.U(3.W)) & sbaddress0_reg(2, 0).orR

  val sbcs_illegal_size = sbcs_reg(19)
  val sbaddress0_incr   = Fill(4, (sbcs_reg(19, 17) === 0.U(3.W))) & 1.U(4.W) | Fill(4, (sbcs_reg(19, 17) === 1.U(3.W))) & 2.U(4.W) |
    Fill(4, (sbcs_reg(19, 17) === 2.U(3.W))) & 4.U(4.W) | Fill(4, (sbcs_reg(19, 17) === 3.U(3.W))) & 8.U(4.W)

  val sbdata0_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3c".U)
  val sbdata0_reg_wren1 = (sb_state === sb_state_t.rsp_rd) & sb_state_en & !sbcs_sberror_wren
  val sbdata0_reg_wren  = sbdata0_reg_wren0 | sbdata0_reg_wren1
  val sbdata1_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3d".U)
  val sbdata1_reg_wren1 = (sb_state === sb_state_t.rsp_rd) & sb_state_en & !sbcs_sberror_wren
  val sbdata1_reg_wren  = sbdata1_reg_wren0 | sbdata1_reg_wren1
  val sbdata0_din       = Fill(32, sbdata0_reg_wren0) & io.dmi_reg_wdata | Fill(32, sbdata0_reg_wren1) & sb_bus_rdata(31, 0)
  val sbdata1_din       = Fill(32, sbdata1_reg_wren0) & io.dmi_reg_wdata | Fill(32, sbdata1_reg_wren1) & sb_bus_rdata(63, 32)

  val sbdata0_reg = withReset(dbg_dm_rst_l) { rvdffe(sbdata0_din, sbdata0_reg_wren, clock, io.scan_mode)} // dbg_sbdata0_reg
  val sbdata1_reg = withReset(dbg_dm_rst_l) { rvdffe(sbdata1_din, sbdata1_reg_wren, clock, io.scan_mode)} // dbg_sbdata1_reg

  val sbaddress0_reg_wren0  = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h39".U)
  val sbaddress0_reg_wren   = sbaddress0_reg_wren0 | sbaddress0_reg_wren1
  val sbaddress0_reg_din    = Fill(32, sbaddress0_reg_wren0) & io.dmi_reg_wdata |
    Fill(32, sbaddress0_reg_wren1) & (sbaddress0_reg + Cat(0.U(28.W), sbaddress0_incr))

  sbaddress0_reg := withReset(dbg_dm_rst_l) { rvdffe(sbaddress0_reg_din, sbaddress0_reg_wren, clock, io.scan_mode)} // dbg_sbaddress0_reg

  val sbreadonaddr_access = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h39".U) & sbcs_reg(20)
  val sbreadondata_access = io.dmi_reg_en & !io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3c".U) & sbcs_reg(15)
  val sbdata0wr_access    = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h3c".U)
  val dmcontrol_wren      = (io.dmi_reg_addr === "h10".U) & io.dmi_reg_en & io.dmi_reg_wr_en
  val resumereq           = (dmcontrol_reg(30) & !dmcontrol_reg(31) & dmcontrol_wren_Q).asBool()

  val dm_temp     = withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegEnable(Cat(io.dmi_reg_wdata(31, 30), io.dmi_reg_wdata(28), io.dmi_reg_wdata(1)),0.U, dmcontrol_wren)} // dmcontrolff
  val dm_temp_0   = withClockAndReset(dbg_free_clk, io.dbg_rst_l) {
    RegEnable(io.dmi_reg_wdata(0), 0.U, dmcontrol_wren)} // dmcontrol_dmactive_ff
  val temp        = Cat(dm_temp(3, 2), 0.U, dm_temp(1), 0.U(26.W), dm_temp(0), dm_temp_0)
  dmcontrol_reg  := temp

  dmcontrol_wren_Q  := withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegNext(dmcontrol_wren, 0.U)} // dmcontrol_wrenff

  dmstatus_reg := Cat(0.U(12.W), Fill(2, dmstatus_havereset), Fill(2, dmstatus_resumeack), 0.U(2.W), Fill(2, dmstatus_unavail),
    Fill(2, dmstatus_running), Fill(2, dmstatus_halted), 1.U(1.W), 0.U(3.W), 2.U(4.W))

  val dmstatus_resumeack_wren = (dbg_state === state_t.resuming) & io.dec_tlu_resume_ack | dmstatus_resumeack & resumereq & dmstatus_halted
  val dmstatus_resumeack_din  = (dbg_state === state_t.resuming) & io.dec_tlu_resume_ack
  val dmstatus_haveresetn_wren = (io.dmi_reg_addr === "h10".U) & io.dmi_reg_wdata(28) & io.dmi_reg_en & io.dmi_reg_wr_en & dmcontrol_reg(0)
  dmstatus_havereset  := ~dmstatus_haveresetn

  val temp_rst      = reset.asBool()
  dmstatus_unavail := (dmcontrol_reg(1) | !(temp_rst)).asBool()
  dmstatus_running := ~(dmstatus_unavail | dmstatus_halted)

  dmstatus_resumeack := withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegEnable(dmstatus_resumeack_din, 0.U, dmstatus_resumeack_wren.asBool())} // dmstatus_resumeack_reg
  dmstatus_halted    := withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegNext(io.dec_tlu_dbg_halted & !io.dec_tlu_mpc_halted_only, 0.U)} // dmstatus_halted_reg
  dmstatus_haveresetn := withClock(dbg_free_clk) {
    RegEnable(true.B, 0.U, dmstatus_haveresetn_wren)} // dmstatus_haveresetn_reg

  val haltsum0_reg    = Cat(0.U(31.W), dmstatus_halted)

  val abstractcs_error_sel0 = abstractcs_reg(12) & ~(abstractcs_reg(10,8).orR) & io.dmi_reg_en & ((io.dmi_reg_wr_en & ((io.dmi_reg_addr === "h16".U(7.W)) |
    (io.dmi_reg_addr === "h17".U(7.W))) | (io.dmi_reg_addr === "h18".U(7.W))) | (io.dmi_reg_addr === 4.U(7.W)) |
    (io.dmi_reg_addr === 5.U(7.W)))
  val abstractcs_error_sel1 = execute_command & ~(abstractcs_reg(10,8).orR) &
    ((!((command_reg(31,24) === 0.U(8.W)) | (command_reg(31,24) === 2.U(8.W)))) |                             // Illegal command
      (((command_reg(22,20) === 3.U(3.W)) | (command_reg(22))) & (command_reg(31,24) === 2.U(8.W))) |           // Illegal abstract memory size (can't be DW or higher)
      ((command_reg(22,20) =/= 2.U(3.W)) & ((command_reg(31,24) === 0.U(8.W)) & command_reg(17)))   |           // Illegal abstract reg size
      ((command_reg(31,24) === 0.U(8.W)) & command_reg(18)))                                                    // postexec for abstract register access
  val abstractcs_error_sel2 = ((io.core_dbg_cmd_done & io.core_dbg_cmd_fail) |                                                          // exception from core
    (execute_command & (command_reg(31,24) === 0.U(8.W)) &                                                    // unimplemented regs
      (((command_reg(15,12) === 1.U(4.W)) & (command_reg(11,5) =/= 0.U(7.W))) | (command_reg(15,13) =/= 0.U(3.W))))) & ~(abstractcs_reg(10,8).orR)
  val abstractcs_error_sel3 = execute_command & (dbg_state =/= state_t.halted) & ~(abstractcs_reg(10,8).orR)
  val abstractcs_error_sel4 = dbg_sb_bus_error & io.dbg_bus_clk_en & ~(abstractcs_reg(10,8).orR)                                        // sb bus error for abstract memory command
  val abstractcs_error_sel5 = execute_command & (command_reg(31,24) === 2.U(8.W)) & ~(abstractcs_reg(10,8).orR) &
    (((command_reg(22,20) === 1.U(3.W)) & data1_reg(0)) | ((command_reg(22,20) === 2.U(3.W)) & (data1_reg(1,0).orR)))  //Unaligned address for abstract memory
  val abstractcs_error_sel6 = (io.dmi_reg_addr ===  "h16".U(7.W)) & io.dmi_reg_en & io.dmi_reg_wr_en

  abstractcs_error_din  := MuxCase(abstractcs_reg(10,8), Array(
    abstractcs_error_sel0 -> 1.U(3.W),
    abstractcs_error_sel1 -> 2.U(3.W),
    abstractcs_error_sel2 -> 3.U(3.W),
    abstractcs_error_sel3 -> 4.U(3.W),
    abstractcs_error_sel4 -> 5.U(3.W),
    abstractcs_error_sel5 -> 7.U(3.W),
    abstractcs_error_sel6 -> (~io.dmi_reg_wdata(10,8) & abstractcs_reg(10,8))
  ))
  val abs_temp_12   = withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegEnable(abstractcs_busy_din, 0.U, abstractcs_busy_wren)} // dmabstractcs_busy_reg
  val abs_temp_10_8 = withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegNext(abstractcs_error_din, 0.U)} // dmabstractcs_error_reg

  abstractcs_reg   := Cat(0.U(19.W), abs_temp_12, 0.U(1.W), abs_temp_10_8, 2.U(8.W))

  val abstractauto_reg_wren = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h18".U(7.W)) & !abstractcs_reg(12)
  val abstractauto_reg      = withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegEnable(io.dmi_reg_wdata(1,0), 0.U, abstractauto_reg_wren)}   // dbg_abstractauto_reg

  val execute_command_ns = command_wren | (io.dmi_reg_en & !abstractcs_reg(12) & (((io.dmi_reg_addr === 4.U(7.W)) &
    abstractauto_reg(0)) | ((io.dmi_reg_addr === 5.U(7.W)) & abstractauto_reg(1))))
  command_wren          := (io.dmi_reg_addr ===  "h17".U(7.W)) & io.dmi_reg_en & io.dmi_reg_wr_en
  val command_regno_wren = command_wren | ((command_reg(31,24) === 0.U(8.W)) & command_reg(19) & (dbg_state === state_t.cmd_done) &
    ~(abstractcs_reg(10,8).orR))  // aarpostincrement

  val command_postexec_din    = (io.dmi_reg_wdata(31,24) === 0.U(8.W)) & io.dmi_reg_wdata(18)
  val command_transfer_din    = (io.dmi_reg_wdata(31,24) === 0.U(8.W)) & io.dmi_reg_wdata(17)
  val temp_command_din_31_16  = Cat(io.dmi_reg_wdata(31,24), 0.U, io.dmi_reg_wdata(22,19), command_postexec_din, command_transfer_din, io.dmi_reg_wdata(16))
  val temp_command_din_15_0   =  Mux(command_wren, io.dmi_reg_wdata(15,0), dbg_cmd_next_addr(15,0))

  command_din     := Cat(temp_command_din_31_16, temp_command_din_15_0)
  execute_command := withClockAndReset(dbg_free_clk, dbg_dm_rst_l) {
    RegNext(execute_command_ns, false.B)}     // execute_commandff

  val temp_command_reg_31_16  = withReset(dbg_dm_rst_l) {
    rvdffe(command_din(31,16), command_wren, clock, io.scan_mode)}  // dmcommand_reg
  val temp_command_reg_15_0   = withReset(dbg_dm_rst_l) {
    rvdffe(command_din(15,0), command_regno_wren, clock, io.scan_mode)}  // dmcommand_regno_reg

  command_reg := Cat(temp_command_reg_31_16, temp_command_reg_15_0)

  val data0_reg_wren0 = io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === "h4".U) & (dbg_state === state_t.halted) & !abstractcs_reg(12)
  val data0_reg_wren1 = io.core_dbg_cmd_done & (dbg_state === state_t.core_cmd_wait) & !command_reg(16)
  val data0_reg_wren  = data0_reg_wren0 | data0_reg_wren1 | data0_reg_wren2

  val data0_din = Fill(32, data0_reg_wren0) & io.dmi_reg_wdata |
    Fill(32, data0_reg_wren1) & io.core_dbg_rddata |
    Fill(32, data0_reg_wren2) & sb_bus_rdata(31,0)
  val data0_reg = withReset(dbg_dm_rst_l.asAsyncReset()) {
    rvdffe(data0_din, data0_reg_wren, clock, io.scan_mode)
  } // dbg_data0_reg

  val data1_reg_wren0 = (io.dmi_reg_en & io.dmi_reg_wr_en & (io.dmi_reg_addr === 5.U(7.W)) & (dbg_state === state_t.halted)) & !abstractcs_reg(12)
  val data1_reg_wren1 = (dbg_state === state_t.cmd_done) & (command_reg(31,24) === 2.U(8.W)) & command_reg(19) & ~(abstractcs_reg(10,8).orR) // aampostincrement
  val data1_reg_wren  = data1_reg_wren0 | data1_reg_wren1

  val data1_din = Fill(32, data1_reg_wren0) & io.dmi_reg_wdata | Fill(32, data1_reg_wren1) & dbg_cmd_next_addr(31,0)
  data1_reg    := withReset(dbg_dm_rst_l.asAsyncReset()) {
    rvdffe(data1_din, data1_reg_wren, clock, io.scan_mode)} // dbg_data1_reg
  val sb_abmem_cmd_done   = withClockAndReset(dbg_free_clk, dbg_dm_rst_l){
    RegEnable(sb_abmem_cmd_done_in, false.B, sb_abmem_cmd_done_en)}   // sb_abmem_cmd_doneff
  val sb_abmem_data_done  = withClockAndReset(dbg_free_clk, dbg_dm_rst_l){
    RegEnable(sb_abmem_data_done_in, false.B, sb_abmem_data_done_en)}   // sb_abmem_data_doneff

  val dbg_nxtstate = WireInit(state_t.idle)
  dbg_nxtstate          := state_t.idle
  dbg_state_en          := false.B
  abstractcs_busy_wren  := false.B
  abstractcs_busy_din   := false.B
  io.dbg_halt_req       := false.B
  io.dbg_resume_req     := false.B
  dbg_sb_bus_error      := false.B
  data0_reg_wren2       := false.B
  sb_abmem_cmd_done_in  := false.B
  sb_abmem_data_done_in := false.B
  sb_abmem_cmd_done_en  := false.B
  sb_abmem_data_done_en := false.B
  switch(dbg_state) {
    is(state_t.idle) {
      dbg_nxtstate    := Mux(dmstatus_reg(9) | io.dec_tlu_mpc_halted_only, state_t.halted, state_t.halting)
      dbg_state_en    := ((dmcontrol_reg(31) | dmstatus_reg(9) | io.dec_tlu_mpc_halted_only))
      io.dbg_halt_req := dmcontrol_reg(31).asBool()
    }
    is(state_t.halting) {
      dbg_nxtstate    := state_t.halted
      dbg_state_en    := dmstatus_reg(9) | io.dec_tlu_mpc_halted_only
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.halted) {
      dbg_nxtstate := Mux(dmstatus_reg(9), Mux(resumereq, state_t.resuming, Mux((command_reg(31, 24) === 2.U(8.W)) & abmem_addr_external,
        state_t.sb_cmd_start, state_t.core_cmd_start)), Mux(dmcontrol_reg(31), state_t.halting, state_t.idle)) // This is MPC halted case
      dbg_state_en := dmstatus_reg(9) & resumereq | execute_command | !(dmstatus_reg(9) | io.dec_tlu_mpc_halted_only)

      abstractcs_busy_wren  := dbg_state_en & ((dbg_nxtstate === state_t.core_cmd_start) | (dbg_nxtstate === state_t.sb_cmd_start))
      abstractcs_busy_din   := "b1".U
      io.dbg_resume_req     := (dbg_state_en & (dbg_nxtstate === state_t.resuming)).asBool()
      io.dbg_halt_req       := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.core_cmd_start) {
      dbg_nxtstate    := Mux(abstractcs_reg(10, 8).orR | ((command_reg(31, 24) === 0.U(8.W)) & !command_reg(17)), state_t.cmd_done, state_t.core_cmd_wait)
      dbg_state_en    := io.dbg_dec_dma.dbg_ib.dbg_cmd_valid | abstractcs_reg(10, 8).orR | ((command_reg(31, 24) === 0.U(8.W)) & !command_reg(17))
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.core_cmd_wait) {
      dbg_nxtstate    := state_t.cmd_done
      dbg_state_en    := io.core_dbg_cmd_done
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.sb_cmd_start) {
      dbg_nxtstate    := Mux(abstractcs_reg(10, 8).orR, state_t.cmd_done, state_t.sb_cmd_send)
      dbg_state_en    := (io.dbg_bus_clk_en & !sb_cmd_pending) | abstractcs_reg(10, 8).orR
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.sb_cmd_send) {
      sb_abmem_cmd_done_in  := true.B
      sb_abmem_data_done_in := true.B
      sb_abmem_cmd_done_en  := (sb_bus_cmd_read | sb_bus_cmd_write_addr) & io.dbg_bus_clk_en
      sb_abmem_data_done_en := (sb_bus_cmd_read | sb_bus_cmd_write_data) & io.dbg_bus_clk_en
      dbg_nxtstate          := state_t.sb_cmd_resp
      dbg_state_en          := (sb_abmem_cmd_done | sb_abmem_cmd_done_en) & (sb_abmem_data_done | sb_abmem_data_done_en) & io.dbg_bus_clk_en
      io.dbg_halt_req       := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.sb_cmd_resp) {
      dbg_nxtstate      := state_t.cmd_done
      dbg_state_en      := (sb_bus_rsp_read | sb_bus_rsp_write) & io.dbg_bus_clk_en
      dbg_sb_bus_error  := (sb_bus_rsp_read | sb_bus_rsp_write) & sb_bus_rsp_error & io.dbg_bus_clk_en
      data0_reg_wren2   := dbg_state_en & !sb_abmem_cmd_write & !dbg_sb_bus_error
      io.dbg_halt_req   := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.cmd_done) {
      dbg_nxtstate          := state_t.halted
      dbg_state_en          := true.B
      abstractcs_busy_wren  := dbg_state_en
      abstractcs_busy_din   := false.B
      io.dbg_halt_req       := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
      sb_abmem_cmd_done_in  := false.B
      sb_abmem_data_done_in := false.B
      sb_abmem_cmd_done_en  := true.B
      sb_abmem_data_done_en := true.B
      io.dbg_halt_req       := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }
    is(state_t.resuming) {
      dbg_nxtstate := state_t.idle;
      dbg_state_en := dmstatus_reg(17)
      io.dbg_halt_req := (dmcontrol_wren_Q & dmcontrol_reg(31)).asBool()
    }}

  val dmi_reg_rdata_din = Fill(32, io.dmi_reg_addr === "h4".U(7.W)).asUInt & data0_reg |
    Fill(32, io.dmi_reg_addr === "h5".U(7.W)) & data1_reg |
    Fill(32, io.dmi_reg_addr === "h10".U(7.W)) & Cat(0.U(2.W), dmcontrol_reg(29), 0.U, dmcontrol_reg(27,0)) |
    Fill(32, io.dmi_reg_addr === "h11".U(7.W)) & dmstatus_reg |
    Fill(32, io.dmi_reg_addr === "h16".U(7.W)) & abstractcs_reg |
    Fill(32, io.dmi_reg_addr === "h17".U(7.W)) & command_reg |
    Fill(32, io.dmi_reg_addr === "h18".U(7.W)) & Cat(0.U(30.W), abstractauto_reg(1,0)) |
    Fill(32, io.dmi_reg_addr === "h40".U(7.W)) & haltsum0_reg |
    Fill(32, io.dmi_reg_addr === "h38".U(7.W)) & sbcs_reg |
    Fill(32, io.dmi_reg_addr === "h39".U(7.W)) & sbaddress0_reg |
    Fill(32, io.dmi_reg_addr === "h3c".U(7.W)) & sbdata0_reg |
    Fill(32, io.dmi_reg_addr === "h3d".U(7.W)) & sbdata1_reg

  dbg_state := withClockAndReset(dbg_free_clk, (dbg_dm_rst_l.asBool() & temp_rst).asAsyncReset()) {
    RegEnable(dbg_nxtstate, 0.U, dbg_state_en)} // dbg_state_reg

  io.dmi_reg_rdata  := withReset(dbg_dm_rst_l) {
    rvdffe(dmi_reg_rdata_din, io.dmi_reg_en, clock, io.scan_mode)} // dmi_rddata_reg

  val abmem_addr            = data1_reg
  val abmem_addr_core_local = (abmem_addr_in_dccm_region | abmem_addr_in_iccm_region | abmem_addr_in_pic_region)
  abmem_addr_external      := !abmem_addr_core_local

  abmem_addr_in_dccm_region := (abmem_addr(31,28) === DCCM_REGION.asUInt) & (DCCM_ENABLE==1).B
  abmem_addr_in_iccm_region := (abmem_addr(31,28) === ICCM_REGION.asUInt) & (ICCM_ENABLE==1).B
  abmem_addr_in_pic_region  := (abmem_addr(31,28) === PIC_REGION.asUInt)

  io.dbg_dec_dma.dbg_ib.dbg_cmd_addr   := Mux((command_reg(31, 24) === "h2".U), data1_reg, Cat(0.U(20.W), command_reg(11, 0)))
  io.dbg_dec_dma.dbg_dctl.dbg_cmd_wrdata := data0_reg(31, 0)
  io.dbg_dec_dma.dbg_ib.dbg_cmd_valid  := (dbg_state === state_t.core_cmd_start) & !((abstractcs_reg(10,8).orR) | ((command_reg(31,24) === 0.U(8.W)) & !command_reg(17)) |
    ((command_reg(31,24) === 2.U(8.W)) & abmem_addr_external)) & io.dbg_dma.dma_dbg_ready
  io.dbg_dec_dma.dbg_ib.dbg_cmd_write  := command_reg(16).asBool()
  io.dbg_dec_dma.dbg_ib.dbg_cmd_type   := Mux((command_reg(31, 24) === "h2".U), "b10".U, Cat("b0".U, (command_reg(15, 12) === "b0".U)))
  io.dbg_cmd_size   := command_reg(21, 20)

  val dbg_cmd_addr_incr = Mux((command_reg(31,24) === 2.U(8.W)), (1.U(4.W) << sb_abmem_cmd_size(1,0)), 1.U(4.W))
  val dbg_cmd_curr_addr = Mux((command_reg(31,24) === 2.U(8.W)), data1_reg, Cat(0.U(16.W), command_reg(15,0)))
  dbg_cmd_next_addr    := dbg_cmd_curr_addr + Cat(0.U(28.W), dbg_cmd_addr_incr)

  io.dbg_dma.dbg_dma_bubble := ((dbg_state === state_t.core_cmd_start) & ~(abstractcs_reg(10, 8).orR) | (dbg_state === state_t.core_cmd_wait)).asBool()

  sb_cmd_pending           := (sb_state === sb_state_t.cmd_rd) | (sb_state === sb_state_t.cmd_wr) | (sb_state === sb_state_t.cmd_wr_addr) |
    (sb_state === sb_state_t.cmd_wr_data) | (sb_state === sb_state_t.rsp_rd) | (sb_state === sb_state_t.rsp_wr)
  val sb_abmem_cmd_pending  = (dbg_state === state_t.sb_cmd_start) | (dbg_state === state_t.sb_cmd_send) | (dbg_state === state_t.sb_cmd_resp)

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
      sb_state_en := (sbdata0wr_access | sbreadondata_access | sbreadonaddr_access) & ~(sbcs_reg(14,12).orR) & !sbcs_reg(22)
      sbcs_sbbusy_wren := sb_state_en
      sbcs_sbbusy_din := true.B
      sbcs_sberror_wren := sbcs_wren & io.dmi_reg_wdata(14, 12).orR
      sbcs_sberror_din := ~io.dmi_reg_wdata(14, 12) & sbcs_reg(14, 12)
    }
    is(sb_state_t.wait_rd) {
      sb_nxtstate       := Mux(sbcs_unaligned | sbcs_illegal_size, sb_state_t.done, sb_state_t.cmd_rd)
      sb_state_en       := (io.dbg_bus_clk_en & !sb_abmem_cmd_pending) | sbcs_unaligned | sbcs_illegal_size
      sbcs_sberror_wren := sbcs_unaligned | sbcs_illegal_size
      sbcs_sberror_din  := Mux(sbcs_unaligned, "b011".U(3.W), "b100".U(3.W))
    }
    is(sb_state_t.wait_wr) {
      sb_nxtstate       := Mux(sbcs_unaligned | sbcs_illegal_size, sb_state_t.done, sb_state_t.cmd_wr)
      sb_state_en       := (io.dbg_bus_clk_en & !sb_abmem_cmd_pending) | sbcs_unaligned | sbcs_illegal_size
      sbcs_sberror_wren := sbcs_unaligned | sbcs_illegal_size;
      sbcs_sberror_din  := Mux(sbcs_unaligned, "b011".U(3.W), "b100".U(3.W))
    }
    is(sb_state_t.cmd_rd) {
      sb_nxtstate := sb_state_t.rsp_rd
      sb_state_en := sb_bus_cmd_read & io.dbg_bus_clk_en
    }
    is(sb_state_t.cmd_wr) {
      sb_nxtstate := Mux(sb_bus_cmd_write_addr & sb_bus_cmd_write_data, sb_state_t.rsp_wr,
        Mux(sb_bus_cmd_write_data, sb_state_t.cmd_wr_addr, sb_state_t.cmd_wr_data))
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
      sbaddress0_reg_wren1 := sbcs_reg(16) & (sbcs_reg(14,12) === 0.U(3.W))
    }}

  sb_state := withClockAndReset(sb_free_clk, dbg_dm_rst_l.asAsyncReset()) {
    RegEnable(sb_nxtstate, 0.U, sb_state_en)
  } // sb_state_reg

  sb_abmem_cmd_write             := command_reg(16)
  sb_abmem_cmd_size              := Cat(0.U(1.W), command_reg(21,20))
  val sb_abmem_cmd_addr           = abmem_addr
  val sb_abmem_cmd_wdata          = data0_reg

  val sb_cmd_size   = sbcs_reg(19,17)
  val sb_cmd_wdata  = Cat(sbdata1_reg(31,0), sbdata0_reg(31,0))
  val sb_cmd_addr   = sbaddress0_reg(31,0)

  val sb_abmem_cmd_awvalid  = (dbg_state === state_t.sb_cmd_send) & sb_abmem_cmd_write & !sb_abmem_cmd_done
  val sb_abmem_cmd_wvalid   = (dbg_state === state_t.sb_cmd_send) & sb_abmem_cmd_write & !sb_abmem_data_done
  val sb_abmem_cmd_arvalid  = (dbg_state === state_t.sb_cmd_send) & !sb_abmem_cmd_write & !sb_abmem_cmd_done & !sb_abmem_data_done
  val sb_abmem_read_pend    = (dbg_state === state_t.sb_cmd_resp) & !sb_abmem_cmd_write

  val sb_cmd_awvalid  = ((sb_state === sb_state_t.cmd_wr) | (sb_state === sb_state_t.cmd_wr_addr))
  val sb_cmd_wvalid   = ((sb_state === sb_state_t.cmd_wr) | (sb_state === sb_state_t.cmd_wr_data))
  val sb_cmd_arvalid  = (sb_state === sb_state_t.cmd_rd)
  val sb_read_pend    = (sb_state === sb_state_t.cmd_rd)

  val sb_axi_size   = Mux((sb_abmem_cmd_awvalid | sb_abmem_cmd_wvalid | sb_abmem_cmd_arvalid | sb_abmem_read_pend), sb_abmem_cmd_size(2,0), sb_cmd_size(2,0))
  val sb_axi_addr   = Mux((sb_abmem_cmd_awvalid | sb_abmem_cmd_wvalid | sb_abmem_cmd_arvalid | sb_abmem_read_pend), sb_abmem_cmd_addr(31,0), sb_cmd_addr(31,0))
  val sb_axi_wrdata = Mux((sb_abmem_cmd_awvalid | sb_abmem_cmd_wvalid), Fill(2, sb_abmem_cmd_wdata(31,0)), sb_cmd_wdata(63,0))

  sb_bus_cmd_read       := io.sb_axi.ar.valid & io.sb_axi.ar.ready
  sb_bus_cmd_write_addr := io.sb_axi.aw.valid & io.sb_axi.aw.ready
  sb_bus_cmd_write_data := io.sb_axi.w.valid & io.sb_axi.w.ready
  sb_bus_rsp_read       := io.sb_axi.r.valid & io.sb_axi.r.ready
  sb_bus_rsp_write      := io.sb_axi.b.valid & io.sb_axi.b.ready
  sb_bus_rsp_error      := sb_bus_rsp_read & io.sb_axi.r.bits.resp(1, 0).orR | sb_bus_rsp_write & io.sb_axi.b.bits.resp(1, 0).orR

  io.sb_axi.aw.valid   := sb_abmem_cmd_awvalid | sb_cmd_awvalid
  io.sb_axi.aw.bits.addr    := sb_axi_addr
  io.sb_axi.aw.bits.id      := 0.U
  io.sb_axi.aw.bits.size    := sb_axi_size
  io.sb_axi.aw.bits.prot    := 1.U(3.W)
  io.sb_axi.aw.bits.cache   := "b1111".U(4.W)
  io.sb_axi.aw.bits.region  := sb_axi_addr(31, 28)
  io.sb_axi.aw.bits.len     := 0.U
  io.sb_axi.aw.bits.burst   := "b01".U(2.W)
  io.sb_axi.aw.bits.qos     := 0.U
  io.sb_axi.aw.bits.lock    := false.B

  io.sb_axi.w.valid  := sb_abmem_cmd_wvalid | sb_cmd_wvalid
  io.sb_axi.w.bits.data   := Fill(64, (sb_axi_size === 0.U(3.W))) & Fill(8, (sb_axi_wrdata(7, 0))) |
    Fill(64, (sb_axi_size === 1.U(3.W))) & Fill(4, sb_axi_wrdata(15, 0)) |
    Fill(64, (sb_axi_size === 2.U(3.W))) & Fill(2, (sb_axi_wrdata(31, 0))) |
    Fill(64, (sb_axi_size === 3.U(3.W))) & sb_axi_wrdata

  io.sb_axi.w.bits.strb := Fill(8, (sb_axi_size === 0.U(3.W))) & ("h1".U(8.W) << sb_axi_addr(2, 0)) |
    Fill(8, (sb_axi_size === 1.U(3.W))) & ("h3".U(8.W) << Cat(sb_axi_addr(2, 1), 0.U(1.W))) |
    Fill(8, (sb_axi_size === 2.U(3.W))) & ("hf".U(8.W) << Cat(sb_axi_addr(2), 0.U(2.W))) |
    Fill(8, (sb_axi_size === 3.U(3.W))) & "hff".U(8.W)

  io.sb_axi.w.bits.last     := true.B
  io.sb_axi.ar.valid   := sb_abmem_cmd_arvalid | sb_cmd_arvalid
  io.sb_axi.ar.bits.addr    := sb_axi_addr
  io.sb_axi.ar.bits.id      := 0.U
  io.sb_axi.ar.bits.size    := sb_axi_size
  io.sb_axi.ar.bits.prot    := 1.U(3.W)
  io.sb_axi.ar.bits.cache   := 0.U(4.W)
  io.sb_axi.ar.bits.region  := sb_axi_addr(31, 28)
  io.sb_axi.ar.bits.len     := 0.U
  io.sb_axi.ar.bits.burst   := 1.U(2.W)
  io.sb_axi.ar.bits.qos     := 0.U
  io.sb_axi.ar.bits.lock    := false.B

  io.sb_axi.b.ready := true.B
  io.sb_axi.r.ready := true.B

  sb_bus_rdata := Fill(64, (sb_axi_size === "h0".U)) & ((io.sb_axi.r.bits.data(63, 0) >> 8.U * sb_axi_addr(2, 0)) & "hff".U(64.W)) |
    Fill(64, (sb_axi_size === "h1".U)) & ((io.sb_axi.r.bits.data(63, 0) >> 16.U * sb_axi_addr(2, 1)) & "hffff".U(64.W)) |
    Fill(64, (sb_axi_size === "h2".U)) & ((io.sb_axi.r.bits.data(63, 0) >> 32.U * sb_axi_addr(2)) & "hffff_ffff".U(64.W)) |
    Fill(64, (sb_axi_size === "h3".U)) & io.sb_axi.r.bits.data(63, 0)
}

object debug extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new dbg)
}
