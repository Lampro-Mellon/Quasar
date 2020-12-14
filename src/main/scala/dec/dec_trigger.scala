package dec

import chisel3.util._
import chisel3._
import include.trigger_pkt_t
import lib._

class dec_trigger extends Module with lib {
  val io = IO(new Bundle {
    val trigger_pkt_any = Input(Vec(4, new trigger_pkt_t))
    val dec_i0_pc_d = Input(UInt(31.W))
    val dec_i0_trigger_match_d = Output(UInt(4.W))
  })
  val dec_i0_match_data = VecInit.tabulate(4)(i =>  repl(32, (!io.trigger_pkt_any(i).select & io.trigger_pkt_any(i).execute)) & Cat(io.dec_i0_pc_d, io.trigger_pkt_any(i).tdata2(0)))
  io.dec_i0_trigger_match_d :=  (0 until 4).map(j =>io.trigger_pkt_any(j).execute & io.trigger_pkt_any(j).m & rvmaskandmatch(io.trigger_pkt_any(j).tdata2, dec_i0_match_data(j), io.trigger_pkt_any(j).match_pkt.asBool())).reverse.reduce(Cat(_,_))

}