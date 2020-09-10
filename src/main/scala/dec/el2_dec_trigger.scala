package dec

import Chisel.{Cat, Fill}
import chisel3._
import include.el2_trigger_pkt_t
import lib._

class el2_dec_trigger extends Module with el2_lib{
  val io = IO(new Bundle{
    val trigger_pkt_any     		  = Input(Vec (4,new el2_trigger_pkt_t))
    val dec_i0_pc_d           		= Input(UInt(31.W))
    val dec_i0_trigger_match_d    = Output(UInt(4.W))
  })
  val dec_i0_match_data         = Reg(Vec(4,UInt(32.W)))
  val dec_i0_trigger_data_match = RegInit(0.U(4.W))
  val temp_logic = Reg(Vec(4,Bool()))
  val temp_out = Reg(Vec(4,Bool()))
  for(i <- 0 until 4 ) {

    dec_i0_match_data(i):= repl(32,(!io.trigger_pkt_any(i).select & io.trigger_pkt_any(i).execute)) & Cat(io.dec_i0_pc_d,io.trigger_pkt_any(i).tdata2(0))
    //val dec_i0_match_data = VecInit.tabulate(4)(i=>(repl(32,(!io.trigger_pkt_any(i).select & io.trigger_pkt_any(i).execute)) & Cat(io.dec_i0_pc_d,io.trigger_pkt_any(i).tdata2(0))))

    val trigger_i0_match = Module(new rvmaskandmatch)
    trigger_i0_match.io.mask := io.trigger_pkt_any(i).tdata2
    trigger_i0_match.io.data := dec_i0_match_data(i)
    trigger_i0_match.io.masken:= io.trigger_pkt_any(i).match_
    temp_logic(i) := trigger_i0_match.io.match_out

    temp_out(i) := io.trigger_pkt_any(i).execute & io.trigger_pkt_any(i).m & temp_logic(i)//dec_i0_trigger_data_match(i)
  }
  io.dec_i0_trigger_match_d:=Cat(temp_out(3),temp_out(2),temp_out(1),temp_out(0))
}

object dec_trig extends App {
 chisel3.Driver execute(args, () => new el2_dec_trigger())
}
