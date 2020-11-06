package dmi
import chisel3._
import scala.collection._
import chisel3.util._
import include._
import lib._

class rvjtag_tap extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val trst            = Input(Bool())
    val tck             = Input(Bool())
    val tms             = Input(Bool())
    val tdi             = Input(Bool())
    val dmi_reset       = Input(Bool())
    val dmi_hard_reset  = Input(Bool())
    val rd_status       = Input(UInt(2.W))
    val dmi_stat        = Input(UInt(2.W))
    val idle            = Input(UInt(3.W))
    val  version        = Input(UInt(4.W))
    val jtag_id         = Input(UInt(32.W))
    val rd_data         = Input(UInt(32.W))

    val tdo             = Output(Bool())
    val tdoEnable       = Output(Bool())
    val wr_en           = Output(Bool())
    val rd_en           = Output(Bool())
    val wr_data         = Output(UInt(32.W))
    val wr_addr         = Output(UInt(AWIDTH.W))
  })
  val AWIDTH = 7.U(6.W)
  val USER_DR_LENGTH = AWIDTH + 34
  val sr  = RegInit(0.U(USER_DR_LENGTH.W))
  val nsr = RegInit(0.U(USER_DR_LENGTH.W))
  val dr  = RegInit(0.U(USER_DR_LENGTH.W))

  ///////////////////////////////////////////////////////
  //                      Tap controller
  ///////////////////////////////////////////////////////
  val state                = RegInit(test_logic_reset_state)
  val nstate               = RegInit(test_logic_reset_state)
  //logic[3:0] state, nstate;
  val ir          = WireInit(0.U(5.W))
  val jtag_reset  = WireInit(UInt(1.W))
  val shift_dr    = WireInit(UInt(1.W))
  val pause_dr    = WireInit(UInt(1.W))
  val update_dr   = WireInit(UInt(1.W))
  val capture_dr  = WireInit(UInt(1.W))
  val shift_ir    = WireInit(UInt(1.W))
  val pause_ir    = WireInit(UInt(1.W))
  val update_ir   = WireInit(UInt(1.W))
  val capture_ir  = WireInit(UInt(1.W))
  val dr_en       = WireInit(UInt(2.W))
  val devid_sel   = WireInit(UInt(1.W))
  val abits       = WireInit(UInt(6.W))
  val abits       = AWIDTH(5,0)

  val test_logic_reset_state :: run_test_idle_state :: select_dr_scan_state :: capture_dr_state :: shift_dr_state :: exit1_dr_state :: pause_dr_state :: exit2_dr_state :: update_dr_state :: select_ir_scan_state :: capture_ir_state :: shift_ir_state :: exit1_ir_state :: pause_ir_state :: exit2_ir_state :: update_ir_state :: Nil = Enum(16)
   switch(state){
     is(test_logic_reset_state){ nstate := Mux(io.tms,test_logic_reset_state,run_test_idle_state)}
     is(run_test_idle_state){nstate := Mux(io.tms,select_dr_scan_state,run_test_idle_state) }
     is(select_dr_scan_state){nstate := Mux(io.tms,select_ir_scan_state,capture_dr_state) }
     is(capture_dr_state){nstate := Mux(io.tms,exit1_dr_state,shift_dr_state) }
     is(shift_dr_state){nstate := Mux(io.tms,exit1_dr_state,shift_dr_state) }
     is(exit1_dr_state){nstate := Mux(io.tms,update_dr_state,pause_dr_state) }
     is(pause_dr_state){nstate := Mux(io.tms,exit2_dr_state,pause_dr_state) }
     is(exit2_dr_state){nstate := Mux(io.tms,update_dr_state,shift_dr_state) }
     is(update_dr_state){nstate := Mux(io.tms,select_dr_scan_state,run_test_idle_state) }
     is(select_ir_scan_state){nstate := Mux(io.tms,test_logic_reset_state,capture_ir_state) }
     is(capture_ir_state){nstate := Mux(io.tms,exit1_ir_state,shift_i``r_state) }
     is(shift_ir_state){nstate := Mux(io.tms,test_logic_reset_state,run_test_idle_state) }
     is(exit1_ir_state){nstate := Mux(io.tms,test_logic_reset_state,run_test_idle_state) }
     is(pause_ir_state){nstate := Mux(io.tms,test_logic_reset_state,run_test_idle_state) }
     is(exit2_ir_state){nstate := Mux(io.tms,test_logic_reset_state,run_test_idle_state) }
     is(update_ir_state){nstate := Mux(io.tms,test_logic_reset_state,run_test_idle_state) }
   }

/////////////////////////////////////////////////////////////////////////////////////////////////


  CAPTURE_IR_STATE:       nstate = tms ? EXIT1_IR_STATE         : SHIFT_IR_STATE;
  SHIFT_IR_STATE:         nstate = tms ? EXIT1_IR_STATE         : SHIFT_IR_STATE;
  EXIT1_IR_STATE:         nstate = tms ? UPDATE_IR_STATE        : PAUSE_IR_STATE;
  PAUSE_IR_STATE:         nstate = tms ? EXIT2_IR_STATE         : PAUSE_IR_STATE;
  EXIT2_IR_STATE:         nstate = tms ? UPDATE_IR_STATE        : SHIFT_IR_STATE;
  UPDATE_IR_STATE:        nstate = tms ? SELECT_DR_SCAN_STATE   : RUN_TEST_IDLE_STATE;


  ///////////////////////////////////////////////////////////////////////////////////////////////


}
