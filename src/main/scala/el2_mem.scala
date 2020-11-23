package el2_mem
import chisel3._
import chisel3.util.HasBlackBoxResource
import lib._
class Mem_bundle extends Bundle with el2_lib {
  val clk = Input(Clock())
  val rst_l = Input(AsyncReset())
  val dccm_clk_override = Input(Bool())
  val icm_clk_override = Input(Bool())
  val dec_tlu_core_ecc_disable = Input(Bool())
  val dccm_wren = Input(Bool())
  val dccm_rden = Input(Bool())
  val dccm_wr_addr_lo = Input(UInt(DCCM_BITS.W))
  val dccm_wr_addr_hi = Input(UInt(DCCM_BITS.W))
  val dccm_rd_addr_lo = Input(UInt(DCCM_BITS.W))
  val dccm_rd_addr_hi = Input(UInt(DCCM_BITS.W))
  val dccm_wr_data_lo = Input(UInt(DCCM_FDATA_WIDTH.W))
  val dccm_wr_data_hi = Input(UInt(DCCM_FDATA_WIDTH.W))
  val dccm_rd_data_lo = Output(UInt(DCCM_FDATA_WIDTH.W))

  val iccm_rw_addr = Input(UInt((ICCM_BITS-1).W))
  val iccm_buf_correct_ecc = Input(Bool())
  val iccm_correction_state = Input(Bool())
  val iccm_wren = Input(Bool())
  val iccm_rden = Input(Bool())
  val iccm_wr_size = Input(UInt(3.W))
  val iccm_wr_data = Input(UInt(78.W))


  val ic_rw_addr = Input(UInt(31.W))
  val ic_tag_valid = Input(UInt(ICACHE_NUM_WAYS.W))
  val ic_wr_en = Input(UInt(ICACHE_NUM_WAYS.W))
  val ic_rd_en = Input(Bool())
  val ic_premux_data = Input(UInt(64.W))
  val ic_sel_premux_data = Input(Bool())
  val ic_wr_data = Input(Vec(ICACHE_BANKS_WAY, UInt(71.W)))
  val ic_debug_wr_data = Input(UInt(71.W))

  val ic_debug_addr = Input(UInt((ICACHE_INDEX_HI-2).W))
  val ic_debug_rd_en = Input(Bool())
  val ic_debug_wr_en = Input(Bool())
  val ic_debug_tag_array = Input(Bool())
  val ic_debug_way = Input(UInt(ICACHE_NUM_WAYS.W))
  val scan_mode = Input(Bool())

  val iccm_rd_data_ecc = Output(UInt(78.W))
  val dccm_rd_data_hi = Output(UInt(DCCM_FDATA_WIDTH.W))
  val ic_rd_data = Output(UInt(64.W))
  val ictag_debug_rd_data = Output(UInt(26.W))
  val ic_eccerr = Output(UInt(ICACHE_BANKS_WAY.W))
  val ic_parerr = Output(UInt(ICACHE_BANKS_WAY.W))
  val ic_rd_hit = Output(UInt(ICACHE_NUM_WAYS.W))
  val ic_tag_perr = Output(Bool())
  val ic_debug_rd_data = Output(UInt(71.W))
  val iccm_rd_data = Output(UInt(64.W))

}
object waleed extends el2_lib {
  class el2_mem extends BlackBox(Map("DCCM_BITS" -> DCCM_BITS,
    "DCCM_FDATA_WIDTH" -> DCCM_FDATA_WIDTH,
    "ICCM_BITS" -> ICCM_BITS,
    "ICACHE_NUM_WAYS" -> ICACHE_NUM_WAYS,
    "ICACHE_BANKS_WAY" -> ICACHE_BANKS_WAY,
    "ICACHE_INDEX_HI" -> ICACHE_INDEX_HI,
    "DCCM_ENABLE" -> bool2int(DCCM_ENABLE),
    "ICACHE_ENABLE" -> bool2int(ICCM_ENABLE),
    "ICCM_ENABLE" -> bool2int(ICCM_ENABLE),
    "ICACHE_TAG_INDEX_LO" -> ICACHE_TAG_INDEX_LO,
    "ICACHE_DATA_INDEX_LO" -> ICACHE_DATA_INDEX_LO,
    "ICACHE_TAG_LO" -> ICACHE_TAG_LO,
    "ICACHE_BANK_LO" -> ICACHE_BANK_LO,
    "ICACHE_BANK_HI" -> ICACHE_BANK_HI,
    "ICACHE_WAYPACK" -> bool2int(ICACHE_WAYPACK),
    "ICACHE_ECC" -> bool2int(ICACHE_ECC),
    "ICACHE_DATA_DEPTH" -> ICACHE_DATA_DEPTH,
    "ICACHE_BANK_BITS" -> ICACHE_BANK_BITS,
    "ICACHE_BEAT_ADDR_HI" -> ICACHE_BEAT_ADDR_HI,
    "ICACHE_BEAT_BITS" -> ICACHE_BEAT_BITS,
    "ICACHE_TAG_DEPTH" -> ICACHE_TAG_DEPTH,
    "ICCM_BANK_INDEX_LO" -> ICCM_BANK_INDEX_LO,
    "ICCM_NUM_BANKS" -> ICCM_NUM_BANKS,
    "ICCM_BANK_HI" -> ICCM_BANK_HI,
    "ICCM_INDEX_BITS" -> ICCM_INDEX_BITS,
    "ICCM_BANK_BITS" -> ICCM_BANK_BITS,
    "DCCM_BYTE_WIDTH" -> DCCM_BYTE_WIDTH,
    "DCCM_BANK_BITS" -> DCCM_BANK_BITS,
    "DCCM_SIZE" -> DCCM_SIZE,
    "DCCM_NUM_BANKS" -> DCCM_NUM_BANKS)) with HasBlackBoxResource {
    val io = IO(new Mem_bundle)
    addResource("/vsrc/el2_mem.sv")
  }
}
class blackbox_mem extends Module with el2_lib {
  val io = IO(new Mem_bundle)
  val it = Module(new waleed.el2_mem)
  io <> it.io
}

object mem extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new blackbox_mem))
}
