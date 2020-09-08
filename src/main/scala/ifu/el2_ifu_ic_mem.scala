package ifu
import lib._
import chisel3._
import chisel3.util._

class el2_ifu_ic_mem extends Module with param{
  val io = IO(new Bundle{
    val clk = Input(Bool())
    val rst_l = Input(Bool())
    val clk_override = Input(Bool())
    val dec_tlu_core_ecc_disable = Input(Bool())
    val ic_rw_addr = Input(UInt(31.W))
    val ic_wr_en = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_en = Input(Bool())
    val ic_debug_addr = Input(UInt((ICACHE_INDEX_HI-3).W))
    val ic_debug_rd_en = Input(Bool())
    val ic_debug_wr_en = Input(Bool())
    val ic_debug_tag_array = Input(Bool())
    val ic_debug_way = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_premux_data = Input(UInt(64.W))
    val ic_sel_premux_data = Input(Bool())
    val ic_wr_data = Vec(ICACHE_BANK_WAY, Input(UInt(71.W)))
    val ic_rd_data = Output(UInt(64.W))
    val ic_debug_rd_data = Output(UInt(71.W))
    val ictag_debug_rd_data = Output(UInt(26.W))
    val ic_debug_wr_data = Input(UInt(71.W))
    val ic_eccerr = Output(UInt(ICACHE_BANK_WAY.W))
    val ic_parerr = Output(UInt(ICACHE_BANK_WAY.W))
    val ic_tag_valid = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_hit = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_perr = Output(Bool())
    val scan_mode = Input(Bool())
  })
  io.ic_tag_perr := 0.U
  io.ic_rd_hit := 0.U
  io.ic_parerr := 0.U
  io.ic_eccerr := 0.U
  io.ictag_debug_rd_data := 0.U
  io.ic_debug_rd_data := 0.U
  io.ic_rd_data := 0.U
  //val icache_tag = Module(new kncpa)
}
class EL2_IC_TAG extends Module with el2_lib with param {
  val io = IO(new Bundle{
    val clk = Input(Bool())
    val rst_l = Input(Bool())
    val clk_override = Input(Bool())
    val dec_tlu_core_ecc_disable = Input(Bool())
    val ic_rw_addr = Input(UInt(29.W))
    val ic_wr_en = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_valid = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_en = Input(Bool())
    val ic_debug_addr = Input(UInt((ICACHE_INDEX_HI-3).W))
    val ic_debug_rd_en = Input(Bool())
    val ic_debug_wr_en = Input(Bool())
    val ic_debug_tag_array = Input(Bool())
    val ic_debug_way = Input(UInt(ICACHE_NUM_WAYS.W))
    val ictag_debug_rd_data = Output(UInt(26.W))
    val ic_debug_wr_data = Input(UInt(71.W))
    val ic_rd_hit = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_perr = Output(Bool())
    val scan_mode = Input(Bool())

    val test = Output(UInt())
  })


  val ic_tag_wren = io.ic_wr_en & repl(ICACHE_NUM_WAYS, io.ic_rw_addr(ICACHE_BEAT_ADDR_HI,4)===
    repl(ICACHE_NUM_WAYS-1, 1.U))
  val ic_debug_rd_way_en = repl(ICACHE_NUM_WAYS, io.ic_debug_rd_en & io.ic_debug_tag_array) & io.ic_debug_way
  val ic_debug_wr_way_en = repl(ICACHE_NUM_WAYS, io.ic_debug_wr_en & io.ic_debug_tag_array) & io.ic_debug_way
  val ic_tag_clken = repl(ICACHE_NUM_WAYS,io.ic_rd_en | io.clk_override) | io.ic_wr_en | ic_debug_wr_way_en |
    ic_debug_rd_way_en
  val ic_rd_en_ff = RegNext(io.ic_rd_en, init=0.U)
  val ic_rw_addr_ff = RegNext(io.ic_rw_addr(31,ICACHE_TAG_LO))
  val PAD_BITS = 21 - (32 - ICACHE_TAG_LO)
  val ic_tag_wren_q = ic_tag_wren | ic_debug_wr_way_en

  io.test:= ic_tag_wren
  io.ic_tag_perr := 0.U
  io.ic_rd_hit := 0.U
  io.ictag_debug_rd_data := 0.U
}
object ifu_ic extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new EL2_IC_TAG()))
}