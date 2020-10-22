package lsu
import chisel3._
import lib._
import chisel3.util._
import include._
class el2_lsu_trigger extends Module with RequireAsyncReset with el2_lib {
  val io = IO(new Bundle{
    val trigger_pkt_any        = Input(Vec (4,(new el2_trigger_pkt_t)))
    val lsu_pkt_m              = Input(new el2_lsu_pkt_t)
    val lsu_addr_m             = Input(UInt(32.W))
    val store_data_m           = Input(UInt(32.W))
    val lsu_trigger_match_m    = Output(UInt(4.W))

  })

  val store_data_trigger_m= Cat((Fill(16,io.lsu_pkt_m.word) & io.store_data_m(31,16)),(Fill(8,(io.lsu_pkt_m.half | io.lsu_pkt_m.word)) & io.store_data_m(15,8)), io.store_data_m(7,0))
  val lsu_match_data = (0 until 4).map(i=>Mux1H(Seq(!io.trigger_pkt_any(i).select.asBool->io.lsu_addr_m, (io.trigger_pkt_any(i).select & io.trigger_pkt_any(i).store).asBool->store_data_trigger_m)))
  io.lsu_trigger_match_m :=  (0 until 4).map(i =>io.lsu_pkt_m.valid & !io.lsu_pkt_m.dma & ((io.trigger_pkt_any(i).store & io.lsu_pkt_m.store)|
    (io.trigger_pkt_any(i).load & io.lsu_pkt_m.load & !io.trigger_pkt_any(i).select) )&
      rvmaskandmatch(io.trigger_pkt_any(i).tdata2, lsu_match_data(i), io.trigger_pkt_any(i).match_.asBool())).reverse.reduce(Cat(_,_))

}

object main_trigger extends App{
  println("Generate Verilog")
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_lsu_trigger()))
}

