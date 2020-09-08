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
  val BHT_GHR_HASH_1   = true
  val BHT_GHR_SIZE     = 8
  val ICACHE_NUM_WAYS = 2
  val ICACHE_INDEX_HI = 12
  val ICACHE_BANK_WAY = 2
  val ICACHE_BEAT_ADDR_HI = 5
  val ICACHE_TAG_LO = 13
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
    if(BHT_GHR_HASH_1) Cat(ghr(BHT_GHR_SIZE-1,BTB_INDEX1_HI-1), hashin(BTB_INDEX1_HI,2) ^ ghr(BTB_INDEX1_HI-2,0))
    else hashin(BHT_GHR_SIZE+1,2) ^ ghr(BHT_GHR_SIZE-1,0)

  def repl(b:Int, a:UInt) : UInt =
    VecInit.tabulate(b)(i => a).reduce(Cat(_,_))




  // Move rvecc_encode to a proper trait
  def rvecc_encode(din:UInt) = {   //Done for verification and testing
    val mask0 = Array(0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,1,0,1,1)
    val mask1 = Array(1,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,1,1,0,1)
    val mask2 = Array(1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,0)
    val mask3 = Array(0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0)
    val mask4 = Array(0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0)
    val mask5 = Array(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
    val w0 = Wire(Vec(18,UInt(1.W)))
    val w1 = Wire(Vec(18,UInt(1.W)))
    val w2 = Wire(Vec(18,UInt(1.W)))
    val w3 = Wire(Vec(15,UInt(1.W)))
    val w4 = Wire(Vec(15,UInt(1.W)))
    val w5 = Wire(Vec(6, UInt(1.W)))
    var j = 0;var k = 0;var m = 0;
    var x = 0;var y = 0;var z = 0

    for(i <- 0 to 31)
    {
      if(mask0(i)==1) {w0(j) := din(i); j = j +1 }
      if(mask1(i)==1) {w1(k) := din(i); k = k +1 }
      if(mask2(i)==1) {w2(m) := din(i); m = m +1 }
      if(mask3(i)==1) {w3(x) := din(i); x = x +1 }
      if(mask4(i)==1) {w4(y) := din(i); y = y +1 }
      if(mask5(i)==1) {w5(z) := din(i); z = z +1 }
    }
    val w6 = Cat((w0.asUInt.xorR),(w1.asUInt.xorR),(w2.asUInt.xorR),(w3.asUInt.xorR),(w4.asUInt.xorR),(w5.asUInt.xorR))
    Cat(din.xorR ^ w6.xorR, w6)
  }

}
