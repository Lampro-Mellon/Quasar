package mem
import chisel3._
import chisel3.util.HasBlackBoxResource
import lib._
import include._

class mem_lsu extends Bundle with lib{
  val wren = Input(Bool())
  val rden = Input(Bool())
  val wr_addr_lo = Input(UInt(DCCM_BITS.W))
  val wr_addr_hi = Input(UInt(DCCM_BITS.W))
  val rd_addr_lo = Input(UInt(DCCM_BITS.W))
  val rd_addr_hi = Input(UInt(DCCM_BITS.W))
  val wr_data_lo = Input(UInt(DCCM_FDATA_WIDTH.W))
  val wr_data_hi = Input(UInt(DCCM_FDATA_WIDTH.W))
  val rd_data_lo = Output(UInt(DCCM_FDATA_WIDTH.W))
  val rd_data_hi = Output(UInt(DCCM_FDATA_WIDTH.W))
}


class Mem_bundle extends Bundle with lib {
  val clk = Input(Clock())
  val rst_l = Input(AsyncReset())
  val dccm_clk_override = Input(Bool())
  val icm_clk_override = Input(Bool())
  val dec_tlu_core_ecc_disable = Input(Bool())
  val dccm = new mem_lsu()
  val iccm = Flipped(new iccm_mem())
  val ic = Flipped (new ic_mem())
  val scan_mode = Input(Bool())
}
object quasar extends lib {
  class mem extends BlackBox(Map("DCCM_BITS" -> DCCM_BITS,
    "DCCM_FDATA_WIDTH" -> DCCM_FDATA_WIDTH,
    "ICCM_BITS" -> ICCM_BITS,
    "ICACHE_NUM_WAYS" -> ICACHE_NUM_WAYS,
    "ICACHE_BANKS_WAY" -> ICACHE_BANKS_WAY,
    "ICACHE_INDEX_HI" -> ICACHE_INDEX_HI,
    "DCCM_ENABLE" -> DCCM_ENABLE,
    "ICACHE_ENABLE" -> ICCM_ENABLE,
    "ICCM_ENABLE" -> ICCM_ENABLE,
    "ICACHE_TAG_INDEX_LO" -> ICACHE_TAG_INDEX_LO,
    "ICACHE_DATA_INDEX_LO" -> ICACHE_DATA_INDEX_LO,
    "ICACHE_TAG_LO" -> ICACHE_TAG_LO,
    "ICACHE_BANK_LO" -> ICACHE_BANK_LO,
    "ICACHE_BANK_HI" -> ICACHE_BANK_HI,
    "ICACHE_WAYPACK" -> ICACHE_WAYPACK,
    "ICACHE_ECC" -> ICACHE_ECC,
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
    addResource("/vsrc/mem.sv")
  }
}
class blackbox_mem extends Module with lib {
  val io = IO(new Mem_bundle)
  val it = Module(new quasar.mem)
  io <> it.io
}