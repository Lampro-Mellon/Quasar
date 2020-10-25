package lib
import chisel3._
import chisel3.util._
trait param {
  val BHT_ADDR_HI            = 9
  val BHT_ADDR_LO            = 2
  val BHT_ARRAY_DEPTH        = 256
  val BHT_GHR_HASH_1         = false
  val BHT_GHR_SIZE           = 8
  val BHT_SIZE               = 512
  val BTB_ADDR_HI            = 9
  val BTB_ADDR_LO            = 2
  val BTB_ARRAY_DEPTH        = 256
  val BTB_BTAG_FOLD          = false
  val BTB_BTAG_SIZE          = 5
  val BTB_FOLD2_INDEX_HASH   = false
  val BTB_INDEX1_HI          = 9
  val BTB_INDEX1_LO          = 2
  val BTB_INDEX2_HI          = 17
  val BTB_INDEX2_LO          = 10
  val BTB_INDEX3_HI          = 25
  val BTB_INDEX3_LO          = 18
  val BTB_SIZE               = 512
  val BUILD_AHB_LITE         = false
  val BUILD_AXI4             = true
  val BUILD_AXI_NATIVE       = true
  val BUS_PRTY_DEFAULT       = 3
  val DATA_ACCESS_ADDR0      = 0x00000000 //.U(32.W)
  val DATA_ACCESS_ADDR1      = 0xC0000000 //.U(32.W)
  val DATA_ACCESS_ADDR2      = 0xA0000000 //.U(32.W)
  val DATA_ACCESS_ADDR3      = 0x80000000 //.U(32.W)
  val DATA_ACCESS_ADDR4      = 0x00000000 //.U(32.W)
  val DATA_ACCESS_ADDR5      = 0x00000000 //.U(32.W)
  val DATA_ACCESS_ADDR6      = 0x00000000 //.U(32.W)
  val DATA_ACCESS_ADDR7      = 0x00000000 //.U(32.W)
  val DATA_ACCESS_ENABLE0    = true //.U(1.W)
  val DATA_ACCESS_ENABLE1    = true //.U(1.W)
  val DATA_ACCESS_ENABLE2    = true //.U(1.W)
  val DATA_ACCESS_ENABLE3    = true //.U(1.W)
  val DATA_ACCESS_ENABLE4    = false //.U(1.W)
  val DATA_ACCESS_ENABLE5    = false //.U(1.W)
  val DATA_ACCESS_ENABLE6    = false //.U(1.W)
  val DATA_ACCESS_ENABLE7    = false //.U(1.W)
  val DATA_ACCESS_MASK0      = 0x7FFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK1      = 0x3FFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK2      = 0x1FFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK3      = 0x0FFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK4      = 0xFFFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK5      = 0xFFFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK6      = 0xFFFFFFFF //.U(32.W)
  val DATA_ACCESS_MASK7      = 0xFFFFFFFF //.U(32.W)
  val DCCM_BANK_BITS         = 2  //.U(3.W)
  val DCCM_BITS              = 16 //.U(5.W)
  val DCCM_BYTE_WIDTH        = 4  //.U(3.W)
  val DCCM_DATA_WIDTH        = 32 //.U(6.W)
  val DCCM_ECC_WIDTH         = 7  //.U(3.W)
  val DCCM_ENABLE            = true  //.U(1.W)
  val DCCM_FDATA_WIDTH       = 0x27 //.U(6.W)
  val DCCM_INDEX_BITS        = 0xC  //.U(4.W)
  val DCCM_NUM_BANKS         = 0x04 //.U(5.W)
  val DCCM_REGION            = 15  //.U(4.W)
  val DCCM_SADR              = 0xF0040000
  val DCCM_SIZE              = 0x040
  val DCCM_WIDTH_BITS        = 2 //.U(2.W)
  val DMA_BUF_DEPTH          = 5 //.U(3.W)
  val DMA_BUS_ID             = true //.U(1.W)
  val DMA_BUS_PRTY           = 0x2 //.U(2.W)
  val DMA_BUS_TAG            = 0x1 //.U(4.W)
  val FAST_INTERRUPT_REDIRECT= 0x1 //.U(1.W)
  val ICACHE_2BANKS          = 1
  val ICACHE_BANK_BITS       = 1
  val ICACHE_BANK_HI         = 3
  val ICACHE_BANK_LO         = 3
  val ICACHE_BANK_WIDTH      = 8
  val ICACHE_BANKS_WAY       = 2
  val ICACHE_BEAT_ADDR_HI    = 5
  val ICACHE_BEAT_BITS       = 3
  val ICACHE_DATA_DEPTH      = 512
  val ICACHE_DATA_INDEX_LO   = 4
  val ICACHE_DATA_WIDTH      = 64
  val ICACHE_ECC             = true
  val ICACHE_ENABLE          = true
  val ICACHE_FDATA_WIDTH     = 71
  val ICACHE_INDEX_HI        = 12
  val ICACHE_LN_SZ           = 64
  val ICACHE_NUM_BEATS       = 8
  val ICACHE_NUM_WAYS        = 2
  val ICACHE_ONLY            = false
  val ICACHE_SCND_LAST       = 6
  val ICACHE_SIZE            = 16
  val ICACHE_STATUS_BITS     = 1
  val ICACHE_TAG_DEPTH       = 128
  val ICACHE_TAG_INDEX_LO    = 6
  val ICACHE_TAG_LO          = 13
  val ICACHE_WAYPACK         = false
  val ICCM_BANK_BITS         = 2
  val ICCM_BANK_HI           = 3  //.U(5.W)
  val ICCM_BANK_INDEX_LO     = 4  //.U(5.W)
  val ICCM_BITS              = 16  //.U(5.W)
  val ICCM_ENABLE            = true   //.U(1.W)
  val ICCM_ICACHE            = true   //.U(1.W)
  val ICCM_INDEX_BITS        = 0xC   //.U(4.W)
  val ICCM_NUM_BANKS         = 0x04  //.U(5.W)
  val ICCM_ONLY              = false   //.U(1.W)
  val ICCM_REGION            = 0xE   //.U(4.W)
  val ICCM_SADR              = 0xEE000000L //.U(32.W)
  val ICCM_SIZE              = 0x040 //.U(10.W)
  val IFU_BUS_ID             = 0x1   //.U(1.W)
  val IFU_BUS_PRTY           = 0x2   //.U(2.W)
  val IFU_BUS_TAG            = 0x3   //.U(4.W)
  val INST_ACCESS_ADDR0      = 0x00000000L //.U(32.W)
  val INST_ACCESS_ADDR1      = 0xC0000000L //.U(32.W)
  val INST_ACCESS_ADDR2      = 0xA0000000L //.U(32.W)
  val INST_ACCESS_ADDR3      = 0x80000000L //.U(32.W)
  val INST_ACCESS_ADDR4      = 0x00000000L //.U(32.W)
  val INST_ACCESS_ADDR5      = 0x00000000L //.U(32.W)
  val INST_ACCESS_ADDR6      = 0x00000000L //.U(32.W)
  val INST_ACCESS_ADDR7      = 0x00000000L //.U(32.W)
  val INST_ACCESS_ENABLE0    = 0x1 //.U(1.W)
  val INST_ACCESS_ENABLE1    = 0x1 //.U(1.W)
  val INST_ACCESS_ENABLE2    = 0x1 //.U(1.W)
  val INST_ACCESS_ENABLE3    = 0x1 //.U(1.W)
  val INST_ACCESS_ENABLE4    = 0x0 //.U(1.W)
  val INST_ACCESS_ENABLE5    = 0x0 //.U(1.W)
  val INST_ACCESS_ENABLE6    = 0x0 //.U(1.W)
  val INST_ACCESS_ENABLE7    = 0x0 //.U(1.W)
  val INST_ACCESS_MASK0      = 0x7FFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK1      = 0x3FFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK2      = 0x1FFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK3      = 0x0FFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK4      = 0xFFFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK5      = 0xFFFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK6      = 0xFFFFFFFFL //.U(32.W)
  val INST_ACCESS_MASK7      = 0xFFFFFFFFL //.U(32.W)
  val LOAD_TO_USE_PLUS1      = 0x0 //.U(1.W)
  val LSU2DMA                = 0x0 //.U(1.W)
  val LSU_BUS_ID             = 0x1 //.U(1.W)
  val LSU_BUS_PRTY           = 0x2 //.U(2.W)
  val LSU_BUS_TAG            = 0x3 //.U(4.W)
  val LSU_NUM_NBLOAD         = 0x04 //.U(5.W)
  val LSU_NUM_NBLOAD_WIDTH   = 0x2  //.U(3.W)
  val LSU_SB_BITS            = 0x10 //.U(5.W)
  val LSU_STBUF_DEPTH        = 0x4  //.U(4.W)
  val NO_ICCM_NO_ICACHE      = false  //.U(1.W)
  val PIC_2CYCLE             = 0x0  //.U(1.W)
  val PIC_BASE_ADDR          = 0xF00C0000 //.U(32.W)
  val PIC_BITS               = 0x0F  //.U(5.W)
  val PIC_INT_WORDS          = 0x1   //.U(4.W)
  val PIC_REGION             = 0xF   //.U(4.W)
  val PIC_SIZE               = 0x020 //.U(9.W)
  val PIC_TOTAL_INT          = 0x1F  //.U(8.W)
  val PIC_TOTAL_INT_PLUS1    = 0x020 //.U(9.W)
  val RET_STACK_SIZE         = 0x8   //.U(4.W)
  val SB_BUS_ID              = 0x1   //.U(1.W)
  val SB_BUS_PRTY            = 0x2   //.U(2.W)
  val SB_BUS_TAG             = 0x1   //.U(4.W)
  val TIMER_LEGAL_EN         = 0x1   //.U(1.W)
}

trait el2_lib extends param{
  def repl(b:Int, a:UInt) = VecInit.tabulate(b)(i => a).reduce(Cat(_,_))

  // IMC
//  def IMC =
//    (ICCM_ICACHE, ICCM_ONLY, ICACHE_ONLY, NO_ICCM_NO_ICACHE) match {
//      case ()
//    }

  // Configuration Methods
  def MEM_CAL : (Int, Int, Int, Int)=
    (ICACHE_WAYPACK, ICACHE_ECC) match{
      case(false,false) => (68, 22, 68, 22)
      case(false,true)  => (71, 26, 71, 26)
      case(true,false)  => (68*ICACHE_NUM_WAYS, 22*ICACHE_NUM_WAYS, 68, 22)
      case(true,true)   => (71*ICACHE_NUM_WAYS, 26*ICACHE_NUM_WAYS, 71, 26)
    }
  val DATA_MEM_LINE = MEM_CAL
  val Tag_Word = MEM_CAL._4

  object rvsyncss {
    def apply(din:UInt,clk:Clock) =withClock(clk){RegNext(withClock(clk){RegNext(din,0.U)},0.U)}
  }


  ///////////////////////////////////////////////////////////////////
  def el2_btb_tag_hash(pc : UInt) =
    VecInit.tabulate(3)(i => pc(BTB_ADDR_HI-1+((i+1)*(BTB_BTAG_SIZE)),BTB_ADDR_HI+(i*BTB_BTAG_SIZE))).reduce(_^_)

  ///////////////////////////////////////////////////////////////////
  def el2_btb_tag_hash_fold(pc : UInt) =
    pc(BTB_ADDR_HI+(2*BTB_BTAG_SIZE),BTB_ADDR_HI+BTB_BTAG_SIZE+1)^pc(BTB_ADDR_HI+BTB_BTAG_SIZE,BTB_ADDR_HI+1)

  ///////////////////////////////////////////////////////////////////
  def el2_btb_addr_hash(pc : UInt) =
    if(BTB_FOLD2_INDEX_HASH) pc(BTB_INDEX1_HI-1,BTB_INDEX1_LO-1) ^ pc(BTB_INDEX3_HI-1,BTB_INDEX3_LO-1)
    else (pc(BTB_INDEX1_HI-1,BTB_INDEX1_LO-1) ^ pc(BTB_INDEX2_HI-1,BTB_INDEX2_LO-1) ^ pc(BTB_INDEX3_HI-1,BTB_INDEX3_LO-1))

  ///////////////////////////////////////////////////////////////////
  def el2_btb_ghr_hash(hashin : UInt, ghr :UInt) =
    if(BHT_GHR_HASH_1) Cat(ghr(BHT_GHR_SIZE-1,BTB_INDEX1_HI-1), hashin(BTB_INDEX1_HI,2) ^ ghr(BTB_INDEX1_HI-2,0))
    else hashin(BHT_GHR_SIZE+1,2) ^ ghr(BHT_GHR_SIZE-1,0)

  ///////////////////////////////////////////////////////////////////
  def rveven_paritycheck(data_in:UInt, parity_in:UInt) : UInt =
    (data_in.xorR.asUInt) ^ parity_in

  def rveven_paritygen(data_in : UInt) =
    data_in.xorR.asUInt
//rvbradder(Cat(pc, 0.U), Cat(offset, 0.U))
  def rvbradder (pc:UInt, offset:UInt) = {
    val dout_lower = pc(12,1) +& offset(12,1)
    val pc_inc = pc(31,13)+1.U
    val pc_dec = pc(31,13)-1.U
    val sign = offset(12)
    Cat(Mux1H(Seq(( sign ^ !dout_lower(dout_lower.getWidth-1)).asBool -> pc(31,13),
                  (!sign &  dout_lower(dout_lower.getWidth-1)).asBool -> pc_inc,
                  ( sign & !dout_lower(dout_lower.getWidth-1)).asBool -> pc_dec)), dout_lower(11,0), 0.U)
  }

  // RV range
  def rvrangecheck(CCM_SADR:Long, CCM_SIZE:Int, addr:UInt) = {
    val REGION_BITS = 4;
    val MASK_BITS = 10 + log2Ceil(CCM_SIZE)
    val start_addr = CCM_SADR.U(32.W)
    val region = start_addr(31,32-REGION_BITS)
    val in_region = addr(31,(32-REGION_BITS)) === region
    val in_range = if(CCM_SIZE==48)
      (addr(31, MASK_BITS) === start_addr(31,MASK_BITS)) & ~addr(MASK_BITS-1 , MASK_BITS-2).andR
    else addr(31,MASK_BITS) === start_addr(31,MASK_BITS)
    (in_region, in_range)
  }

  def rvmaskandmatch(mask:UInt, data:UInt, masken:Bool):UInt={
    val matchvec = Wire(Vec(data.getWidth,UInt(1.W)))
    val masken_or_fullmask = masken & ~mask.andR
    matchvec(0)  :=  masken_or_fullmask | (mask(0) === data(0)).asUInt
    for(i <- 1 to data.getWidth-1)
    matchvec(i) := Mux(mask(i-1,0).andR & masken_or_fullmask,"b1".U,(mask(i) === data(i)).asUInt)
    matchvec.asUInt
  }

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


  def rvecc_decode(en:UInt,din:UInt,ecc_in:UInt,sed_ded:UInt)= {
    val mask0 = Array(1,1,0,1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0)
    val mask1 = Array(1,0,1,1,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1)
    val mask2 = Array(0,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1)
    val mask3 = Array(0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0)
    val mask4 = Array(0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0)
    val mask5 = Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1)

    val w0 = Wire(Vec(18,UInt(1.W)))
    val w1 = Wire(Vec(18,UInt(1.W)))
    val w2 = Wire(Vec(18,UInt(1.W)))
    val w3 = Wire(Vec(15,UInt(1.W)))
    val w4 = Wire(Vec(15,UInt(1.W)))
    val w5 = Wire(Vec(6,UInt(1.W)))

    var j = 0;var k = 0;var m = 0;  var n =0;
    var x = 0;var y = 0;

    for(i <- 0 to 31)
    {
      if(mask0(i)==1) {w0(j) := din(i); j = j +1 }
      if(mask1(i)==1) {w1(k) := din(i); k = k +1 }
      if(mask2(i)==1) {w2(m) := din(i); m = m +1 }
      if(mask3(i)==1) {w3(n) := din(i); n = n +1 }
      if(mask4(i)==1) {w4(x) := din(i); x = x +1 }
      if(mask5(i)==1) {w5(y) := din(i); y = y +1 }
    }

    val ecc_check = Cat((din.xorR ^ ecc_in.xorR) & ~sed_ded ,ecc_in(5)^(w5.asUInt.xorR),ecc_in(4)^(w4.asUInt.xorR),ecc_in(3)^(w3.asUInt.xorR),ecc_in(2)^(w2.asUInt.xorR),ecc_in(1)^(w1.asUInt.xorR),ecc_in(0)^(w0.asUInt.xorR))
    val single_ecc_error =  en & (ecc_check=/= 0.U) & ecc_check(6)
    val double_ecc_error =  en & (ecc_check=/= 0.U) & ~ecc_check(6)
    val error_mask = Wire(Vec(39,UInt(1.W)))

    for(i <- 1 until 40){
      error_mask(i-1) := ecc_check(5,0) === i.asUInt
    }
    val din_plus_parity = Cat(ecc_in(6), din(31,26), ecc_in(5), din(25,11), ecc_in(4), din(10,4), ecc_in(3), din(3,1), ecc_in(2), din(0), ecc_in(1,0))
    val dout_plus_parity = Mux(single_ecc_error.asBool, (error_mask.asUInt ^ din_plus_parity), din_plus_parity)

    val dout =  Cat(dout_plus_parity(37,32),dout_plus_parity(30,16), dout_plus_parity(14,8), dout_plus_parity(6,4), dout_plus_parity(2))
    val ecc_out = Cat(dout_plus_parity(38) ^ (ecc_check(6,0) === "b1000000".U(7.W)), dout_plus_parity(31), dout_plus_parity(15), dout_plus_parity(7), dout_plus_parity(3), dout_plus_parity(1,0))
    (ecc_out,dout,single_ecc_error,double_ecc_error)
  }

  def rvecc_encode_64(din:UInt):UInt = {
    val mask0 = Array(1,1,0,1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1)
    val mask1 = Array(1,0,1,1,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1)
    val mask2 = Array(0,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1)
    val mask3 = Array(0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0)
    val mask4 = Array(0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0)
    val mask5 = Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0)
    val mask6 = Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1)

    val w0 = Wire(Vec(35,UInt(1.W)))
    val w1 = Wire(Vec(35,UInt(1.W)))
    val w2 = Wire(Vec(35,UInt(1.W)))
    val w3 = Wire(Vec(31,UInt(1.W)))
    val w4 = Wire(Vec(31,UInt(1.W)))
    val w5 = Wire(Vec(31,UInt(1.W)))
    val w6 = Wire(Vec(7, UInt(1.W)))

    var j = 0;var k = 0;var m = 0; var n =0;
    var x = 0;var y = 0;var z = 0

    for(i <- 0 to 63)
    {
      if(mask0(i)==1) {w0(j) := din(i); j = j +1 }
      if(mask1(i)==1) {w1(k) := din(i); k = k +1 }
      if(mask2(i)==1) {w2(m) := din(i); m = m +1 }
      if(mask3(i)==1) {w3(n) := din(i); n = n +1 }
      if(mask4(i)==1) {w4(x) := din(i); x = x +1 }
      if(mask5(i)==1) {w5(y) := din(i); y = y +1 }
      if(mask6(i)==1) {w6(z) := din(i); z = z +1 }
    }
    val ecc_out = Cat((w0.asUInt.xorR),(w1.asUInt.xorR),(w2.asUInt.xorR),(w3.asUInt.xorR),(w4.asUInt.xorR),(w5.asUInt.xorR),(w6.asUInt.xorR))
    ecc_out
  }

  def rvecc_decode_64(en:UInt,din:UInt,ecc_in:UInt) = {
    val mask0 = Array(1,1,0,1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1)
    val mask1 = Array(1,0,1,1,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1)
    val mask2 = Array(0,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1)
    val mask3 = Array(0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0)
    val mask4 = Array(0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0)
    val mask5 = Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0)
    val mask6 = Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1)

    val w0 = Wire(Vec(35,UInt(1.W)))
    val w1 = Wire(Vec(35,UInt(1.W)))
    val w2 = Wire(Vec(35,UInt(1.W)))
    val w3 = Wire(Vec(31,UInt(1.W)))
    val w4 = Wire(Vec(31,UInt(1.W)))
    val w5 = Wire(Vec(31,UInt(1.W)))
    val w6 = Wire(Vec(7, UInt(1.W)))

    var j = 0;var k = 0;var m = 0;  var n =0;
    var x = 0;var y = 0;var z = 0

    for(i <- 0 to 63)
    {
      if(mask0(i)==1) {w0(j) := din(i); j = j +1 }
      if(mask1(i)==1) {w1(k) := din(i); k = k +1 }
      if(mask2(i)==1) {w2(m) := din(i); m = m +1 }
      if(mask3(i)==1) {w3(n) := din(i); n = n +1 }
      if(mask4(i)==1) {w4(x) := din(i); x = x +1 }
      if(mask5(i)==1) {w5(y) := din(i); y = y +1 }
      if(mask6(i)==1) {w6(z) := din(i); z = z +1 }
    }

    val ecc_check = Cat((ecc_in(6) ^ w6.asUInt.xorR) ,ecc_in(5)^(w5.asUInt.xorR),ecc_in(4)^(w4.asUInt.xorR),ecc_in(3)^(w3.asUInt.xorR),ecc_in(2)^(w2.asUInt.xorR),ecc_in(1)^(w1.asUInt.xorR),ecc_in(0)^(w0.asUInt.xorR))
    val ecc_error = en & (ecc_check(6,0) =/= 0.U)
    ecc_error
  }



  class TEC_RV_ICG extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
      val Q = Output(Clock())
      val CK  = Input(Clock())
      val EN  = Input(Bool())
      val SE = Input(Bool())
    })
    addResource("/vsrc/TEC_RV_ICG.v")
  }

  class rvclkhdr extends Module {
    val io = IO(new Bundle {
      val l1clk = Output(Clock())
      val clk  = Input(Clock())
      val en  = Input(Bool())
      val scan_mode = Input(Bool())
    })
    val clkhdr = { Module(new TEC_RV_ICG) }
    io.l1clk := clkhdr.io.Q
    clkhdr.io.CK := io.clk
    clkhdr.io.EN := io.en
    clkhdr.io.SE := io.scan_mode
  }

  object rvclkhdr {
    def apply(clk: Clock, en: Bool, scan_mode: Bool): Clock = {
      val cg = Module(new rvclkhdr)
      cg.io.clk := clk
      cg.io.en := en
      cg.io.scan_mode := scan_mode
      cg.io.l1clk
    }
  }

//  class rvclkhdr extends Module {
//    val io = IO(new Bundle {
//      val l1clk = Output(Clock())
//      val clk  = Input(Clock())
//      val en  = Input(Bool())
//      val scan_mode = Input(Bool())
//    })
//    val clkhdr = { Module(new TEC_RV_ICG) }
//    io.l1clk := clkhdr.io.Q
//    clkhdr.io.CK := io.clk
//    clkhdr.io.EN := io.en
//    clkhdr.io.SE := io.scan_mode
//  }


  object rvdffe {
    def apply(din: UInt, en: Bool, clk: Clock, scan_mode: Bool): UInt = {
      val obj = Module(new rvclkhdr())
      val l1clk = obj.io.l1clk
      obj.io.clk := clk
      obj.io.en := en
      obj.io.scan_mode := scan_mode
      withClock(l1clk) {
        RegNext(din, 0.U)
      }
    }
    def apply(din: Bundle, en: Bool, clk: Clock, scan_mode: Bool) = {
      val obj = Module(new rvclkhdr())
      val l1clk = obj.io.l1clk
      obj.io.clk := clk
      obj.io.en := en
      obj.io.scan_mode := scan_mode
      withClock(l1clk) {
        RegNext(din,0.U.asTypeOf(din.cloneType))
      }
    }
  }
//    def rvclkhdr_M(clk: Clock, en: Bool, scan_mode: Bool): Clock = {
//      val cg = Module(new rvclkhdr)
//      cg.io.clk := clk
//      cg.io.en := en
//      cg.io.scan_mode := scan_mode
//      cg.io.l1clk
//    }


}
