package lib
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource
import chisel3.withClock

object beh_ib_func { 
  // use this for rvdffsc = > io.out := RegEnable(io.din & repl(io.din.getWidth, io.clear), 0.U, io.en)
  // use this for rvdffs  = > io.out := RegEnable(io.din, 0.U, io.en)

  def repl(b:Int, a:UInt) = VecInit.tabulate(b)(i => a).reduce(Cat(_,_))
  def rvsyncss(din:UInt) = RegNext(RegNext(din,0.U),0.U)
  def rvlsadder(rs1:UInt,offset:UInt) = {
    val w1 =  Cat("b0".U,rs1(11,0)) + Cat("b0".U,offset(11,0))         //w1[12] =cout  offset[11]=sign
    val dout_upper = ((repl(20, ~(offset(11) ^ w1(12)))) & rs1(31,12)) |
      ((repl(20, ~offset(11) ^ w1(12))) & (rs1(31,12)+1.U)) | ((repl(20, offset(11) ^ ~w1(12))) & (rs1(31,12)-1.U))
    Cat(dout_upper,w1(11,0))}

  def rvbsadder(pc:UInt,offset:UInt) = { // lsb is not using in code
    val w1 =  Cat("b0".U,pc(12,1)) + Cat("b0".U,offset(12,1))  //w1[12] =cout  offset[12]=sign
    val dout_upper = ((repl(19, ~(offset(12) ^ w1(12))))&  pc(31,13))       |
      ((repl(19, ~offset(12) ^  w1(12))) & (pc(31,13)+1.U)) |
      ((repl(19, offset(12) ^  ~w1(12))) & (pc(31,13)-1.U))
    Cat(dout_upper,w1(11,0))}

  def rvtwoscomp(din:UInt) = {   //Done for verification and testing
    val temp = Wire(Vec(din.getWidth-1,UInt(1.W)))
    for(i <- 1 to din.getWidth-1){
      val done  = din(i-1,0).orR
      temp(i-1) := Mux(done ,~din(i),din(i))
    }
    Cat(temp.asUInt,din(0))}


  //WIDTH will be inferred
  def rvmaskandmatch(mask:UInt,data:UInt,masken:UInt) = {     //Done for verification and testing
    val matchvec = Wire(Vec(data.getWidth,UInt(1.W)))
    val masken_or_fullmask = masken.asBool & ~mask(data.getWidth-1,0).andR
    matchvec(0)  :=  masken_or_fullmask | (mask(0) === data(0)).asUInt
    for(i <- 1 to data.getWidth-1)
    {matchvec(i) := Mux(mask(i-1,0).andR & masken_or_fullmask,"b1".U,(mask(i) === data(i)).asUInt)}
    matchvec.asUInt
  }


  def rvrangecheck(addr:UInt,CCM_SADR:Int=0, CCM_SIZE:Int=128) = {
    val REGION_BITS = 4
    val MASK_BITS   = 10 + log2Ceil(CCM_SIZE)
    val start_addr  = Wire(CCM_SIZE.U(32.W))
    val region  = start_addr(31,(32-REGION_BITS))
    val in_region  = (addr(31,(32-REGION_BITS)) === region(REGION_BITS-1,0)).asUInt
    val in_range   = Wire(UInt(1.W))
    if(CCM_SIZE == 48)
      in_range := (addr(31,MASK_BITS) === start_addr(31,MASK_BITS)).asUInt //& ~(addr(MASK_BITS-1,MASK_BITS-2).andR.asUInt)
    else
      in_range := (addr(31,MASK_BITS) === start_addr(31,MASK_BITS)).asUInt
    (in_range,in_region)
  }


  def rvecc_encode(din:UInt):UInt = {
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
    val ecc_out = Cat(din.xorR ^ w6.xorR, w6)
    ecc_out
  }


  def rveven_paritygen(data_in:UInt):UInt = data_in.xorR.asUInt
  def rveven_paritycheck(data_in:UInt,parity_in:UInt) = (data_in.xorR.asUInt) ^ parity_in

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
    val single_ecc_error =  en & (ecc_check!= 0.U) & ((din.xorR ^ ecc_in.xorR) & ~sed_ded)
    val double_ecc_error =  en & (ecc_check!= 0.U) & ((din.xorR ^ ecc_in.xorR) & ~sed_ded)
    val error_mask = Wire(Vec(39,UInt(1.W)))

    for(i <- 1 until 40){
      error_mask(i-1) := ecc_check(5,0) === i.asUInt
    }
    val din_plus_parity = Cat(ecc_in(6), din(31,26), ecc_in(5), din(25,11), ecc_in(4), din(10,4), ecc_in(3), din(3,1), ecc_in(2), din(0), ecc_in(1,0))
    val dout_plus_parity = Mux(single_ecc_error.asBool, (error_mask.asUInt ^ din_plus_parity), din_plus_parity)

    val dout =  Cat(dout_plus_parity(37,32),dout_plus_parity(30,16), dout_plus_parity(14,8), dout_plus_parity(6,4), dout_plus_parity(2))
    val ecc_out = Cat(dout_plus_parity(38) ^ (ecc_check(6,0) === "b1000000".U), dout_plus_parity(31), dout_plus_parity(15), dout_plus_parity(7), dout_plus_parity(3), dout_plus_parity(1,0))
    (ecc_out,dout,dout,single_ecc_error,double_ecc_error)
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

    val ecc_check = Cat((ecc_in(6) ^ w5.asUInt.xorR) ,ecc_in(5)^(w5.asUInt.xorR),ecc_in(4)^(w4.asUInt.xorR),ecc_in(3)^(w3.asUInt.xorR),ecc_in(2)^(w2.asUInt.xorR),ecc_in(1)^(w1.asUInt.xorR),ecc_in(0)^(w0.asUInt.xorR))
    val ecc_error = en & (ecc_check(6,0) != 0.U)
    ecc_error
  }

  ////rvdffe ///////////////////////////////////////////////////////////////////////
  def rvdffe(din: UInt, en: Bool, clk: Clock, scan_mode: Bool): UInt = {
    val obj = Module(new rvclkhdr())
    val l1clk = obj.io.l1clk
    obj.io.clk := clk
    obj.io.en := en
    obj.io.scan_mode := scan_mode
    withClock(l1clk) {
      RegNext(din,0.U)
    }
  }


}
