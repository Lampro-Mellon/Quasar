package dmi
import chisel3._
import chisel3.util._
import include._
import lib._

class rvjtag_tap extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val trst            = Input(AsyncReset())
    val tck             = Input(Clock())
    val tms             = Input(Bool())
    val tdi             = Input(Bool())
    val dmi_reset       = Output(Bool())
    val dmi_hard_reset  = Output(Bool())
    val rd_status       = Input(UInt(2.W))
    val dmi_stat        = Input(UInt(2.W))
    val idle            = Input(UInt(3.W))
    val  version        = Input(UInt(4.W))
    val jtag_id         = Input(UInt(31.W))
    val rd_data         = Input(UInt(32.W))

    val tdo             = Output(Bool())
    val tdoEnable       = Output(Bool())
    val wr_en           = Output(Bool())
    val rd_en           = Output(Bool())
    val wr_data         = Output(UInt(32.W))
    val wr_addr         = Output(UInt(AWIDTH.W))
  })
  val AWIDTH = 7
  val USER_DR_LENGTH = AWIDTH + 34
  val nsr = WireInit(0.U(USER_DR_LENGTH.W))
  val sr = withClockAndReset (io.tck,io.trst) {RegNext(nsr,0.U)}
  val dr  = WireInit(0.U(USER_DR_LENGTH.W))
  ///////////////////////////////////////////////////////
  //                      Tap controller
  ///////////////////////////////////////////////////////
  val test_logic_reset_state :: run_test_idle_state :: select_dr_scan_state :: capture_dr_state :: shift_dr_state :: exit1_dr_state :: pause_dr_state :: exit2_dr_state :: update_dr_state :: select_ir_scan_state :: capture_ir_state :: shift_ir_state :: exit1_ir_state :: pause_ir_state :: exit2_ir_state :: update_ir_state :: Nil = Enum(16)
  val nstate                = WireInit(test_logic_reset_state)
  val state = withClockAndReset(io.tck,io.trst) {RegNext(nstate,test_logic_reset_state)}
  val ir          = WireInit(0.U(5.W))
  val jtag_reset  = WireInit(Bool(),false.B)
  val shift_dr    = WireInit(UInt(1.W),init = 0.U)
  val pause_dr    = WireInit(UInt(1.W),init = 0.U)
  val update_dr   = WireInit(Bool(),false.B)
  val capture_dr  = WireInit(UInt(1.W),init = 0.U)
  val shift_ir    = WireInit(UInt(1.W),init = 0.U)
  val pause_ir    = WireInit(UInt(1.W),init = 0.U)
  val update_ir   = WireInit(Bool(),false.B)
  val capture_ir  = WireInit(UInt(1.W),init = 0.U)
  val dr_en       = WireInit(UInt(2.W),init = 0.U)
  val devid_sel   = WireInit(Bool(),false.B)
  val abits       = AWIDTH.U(6.W)

  switch (state) {
    is(test_logic_reset_state) {nstate := Mux(io.tms, test_logic_reset_state, run_test_idle_state)
      jtag_reset := 1.U }
    is(run_test_idle_state)     {nstate := Mux(io.tms,select_dr_scan_state,run_test_idle_state) }
    is(select_dr_scan_state)    {nstate := Mux(io.tms,select_ir_scan_state,capture_dr_state) }
    is(capture_dr_state)        {nstate := Mux(io.tms,exit1_dr_state,shift_dr_state)
      capture_dr := 1.U }
    is(shift_dr_state)          {nstate := Mux(io.tms,exit1_dr_state,shift_dr_state)
      shift_dr := 1.U }
    is(exit1_dr_state)          {nstate := Mux(io.tms,update_dr_state,pause_dr_state) }
    is(pause_dr_state)          {nstate := Mux(io.tms,exit2_dr_state,pause_dr_state)
      pause_dr := 1.U }
    is(exit2_dr_state)          {nstate := Mux(io.tms,update_dr_state,shift_dr_state) }
    is(update_dr_state)         {nstate := Mux(io.tms,select_dr_scan_state,run_test_idle_state)
      update_dr := 1.U }
    is(select_ir_scan_state)    {nstate := Mux(io.tms,test_logic_reset_state,capture_ir_state) }
    is(capture_ir_state)        {nstate := Mux(io.tms,exit1_ir_state,shift_ir_state)
      capture_ir := 1.U }
    is(shift_ir_state)          {nstate := Mux(io.tms,exit1_ir_state,shift_ir_state)
      shift_ir := 1.U }
    is(exit1_ir_state)          {nstate := Mux(io.tms,update_ir_state,pause_ir_state) }
    is(pause_ir_state)          {nstate := Mux(io.tms,exit2_ir_state,pause_ir_state)
      pause_ir := 1.U }
    is(exit2_ir_state)          {nstate := Mux(io.tms,update_ir_state,shift_ir_state) }
    is(update_ir_state)         {nstate := Mux(io.tms,select_dr_scan_state,run_test_idle_state)
      update_ir := 1.U }
  }
  io.tdoEnable := shift_dr | shift_ir
  ///////////////////////////////////////////////////////
  //                      IR register
  //////////////////////////////////////////////////////
  ir :=  withClockAndReset(io.tck,io.trst) {RegNext(Mux(jtag_reset,1.U,Mux(update_ir,Mux((sr(4,0)===0.U).asBool,"h1f".U,sr(4,0)),0.U)),1.U)}
  devid_sel := ir==="b00001".U(5.W)
  dr_en     := Cat(ir===17.U,ir===16.U)
  ///////////////////////////////////////////////////////
  //                      Shift register
  ///////////////////////////////////////////////////////

  when(shift_dr===1.U){
    when(dr_en(1)===true.B){nsr :=Cat(io.tdi, sr(USER_DR_LENGTH-1,1))}
      .elsewhen(dr_en(0)===1.U || devid_sel===true.B){nsr := Cat(Fill(USER_DR_LENGTH-32,0.U) , io.tdi, sr(31,1))}
      .otherwise{nsr := Cat(Fill(USER_DR_LENGTH-1,0.U),io.tdi)} // bypass
  }
    .elsewhen(capture_dr ===1.U){
      when(dr_en(0)){nsr := Cat(Fill(USER_DR_LENGTH-15,0.U) ,io.idle, io.dmi_stat,abits,io.version)}
        .elsewhen(dr_en(1)){nsr := Cat(Fill(AWIDTH,0.U),io.rd_data,io.rd_status)}
        .elsewhen(devid_sel){nsr := Cat(Fill(USER_DR_LENGTH-32,0.U),io.jtag_id,1.U)}
    }
    .elsewhen(shift_ir===1.U){nsr := Cat(Fill(USER_DR_LENGTH-5,0.U),io.tdi,sr(4,1))}
    .elsewhen(capture_ir===1.U){nsr := Cat(Fill(USER_DR_LENGTH-1,0.U),1.U)}

  // TDO retiming
  withClock(io.tck) {io.tdo:=RegNext(sr(0),0.U)}
  // DMI CS register
  withClockAndReset (io.tck,io.trst) {io.dmi_hard_reset := RegNext(Mux(update_dr & dr_en(0).asBool(),sr(17),0.U),0.U)}
  withClockAndReset (io.tck,io.trst) {io.dmi_reset := RegNext(Mux(update_dr & dr_en(0).asBool(),sr(16),0.U),0.U)}
  // DR register
  withClockAndReset (io.tck,io.trst) {dr := RegNext(Mux(update_dr & dr_en(1).asBool(),sr,Cat(dr(USER_DR_LENGTH-1,2),0.U(2.W))),0.U)}

  io.rd_en   := dr(0)
  io.wr_en   := dr(1)
  io.wr_data := dr(33,2)
  io.wr_addr := dr(40,34)

}
object tapmain extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new rvjtag_tap()))
}
