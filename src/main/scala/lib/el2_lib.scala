package lib
import chisel3._
import chisel3.util._
trait param {
  val BTB_ADDR_HI      = 9
  val BTB_ADDR_LO      = 2
  val BTB_BTAG_SIZE    = 5
  val BTB_FOLD2_INDEX_HASH = false
  val BTB_INDEX1_HI    = 9
  val BTB_INDEX1_LO    = 2
  val BTB_INDEX2_HI    = 17
  val BTB_INDEX2_LO    = 10
  val BTB_INDEX3_HI    = 25
  val BTB_INDEX3_LO    = 18
  val BHT_GHR_HASH_1   = false
  val BHT_GHR_SIZE     = 8
}

trait el2_lib extends param{
  def el2_btb_tag_hash(pc : UInt) =
    (VecInit.tabulate(3)(i => pc(BTB_ADDR_HI+((i+1)*(BTB_BTAG_SIZE)),BTB_ADDR_HI+(i*BTB_BTAG_SIZE)+1))).reduce(_^_)

  def el2_btb_tag_hash_fold(pc : UInt) =
    pc(BTB_ADDR_HI+(2*BTB_BTAG_SIZE),BTB_ADDR_HI+BTB_BTAG_SIZE+1)^pc(BTB_ADDR_HI+BTB_BTAG_SIZE,BTB_ADDR_HI+1)

  def el2_btb_addr_hash(pc : UInt) =
    if(BTB_FOLD2_INDEX_HASH) pc(BTB_INDEX1_HI,BTB_INDEX1_LO) ^ pc(BTB_INDEX3_HI,BTB_INDEX3_LO)
    else pc(BTB_INDEX1_HI,BTB_INDEX1_LO) ^ pc(BTB_INDEX2_HI,BTB_INDEX2_LO) ^ pc(BTB_INDEX3_HI,BTB_INDEX3_LO)

  def el2_btb_ghr_hash(hashin : UInt, ghr :UInt) =
    if(BHT_GHR_HASH_1) Cat(ghr(BHT_GHR_SIZE-1,BTB_INDEX1_HI), hashin(BTB_INDEX1_HI,2) ^ ghr(BTB_INDEX1_HI-2,0))
    else hashin(BHT_GHR_SIZE+1,2) ^ ghr(BHT_GHR_SIZE-1,0)
}
