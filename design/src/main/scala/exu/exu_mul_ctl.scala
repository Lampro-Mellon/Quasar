package exu

import chisel3._
import chisel3.util._
import include._
import lib._
import chisel3.stage.ChiselStage

class exu_mul_ctl extends Module with RequireAsyncReset with lib {
  val io = IO(new Bundle{
    val scan_mode          = Input(Bool())
    val mul_p              = Flipped(Valid(new mul_pkt_t ))
    val rs1_in             = Input(UInt(32.W))
    val rs2_in             = Input(UInt(32.W))
    val result_x           = Output(UInt(32.W))
  })

  val rs1_ext_in           = WireInit(SInt(33.W), 0.S)
  val rs2_ext_in           = WireInit(SInt(33.W), 0.S)
  val rs1_x                = WireInit(SInt(33.W), 0.S)
  val rs2_x                = WireInit(SInt(33.W), 0.S)
  val prod_x               = WireInit(SInt(66.W), 0.S)
  val low_x                = WireInit(0.U(1.W))

  // *** Start - BitManip ***
  // ZBE
  val        ap_bext = WireInit(Bool(),0.B)
  val        ap_bdep = WireInit(Bool(),0.B)

  // ZBC
  val        ap_clmul   = WireInit(Bool(),0.B)
  val        ap_clmulh  = WireInit(Bool(),0.B)
  val        ap_clmulr  = WireInit(Bool(),0.B)

  // ZBP
  val         ap_grev    = WireInit(Bool(),0.B)
  val         ap_gorc    = WireInit(Bool(),0.B)
  val         ap_shfl    = WireInit(Bool(),0.B)
  val         ap_unshfl  = WireInit(Bool(),0.B)

  // ZBR
  val         ap_crc32_b   = WireInit(Bool(),0.B)
  val         ap_crc32_h   = WireInit(Bool(),0.B)
  val         ap_crc32_w   = WireInit(Bool(),0.B)
  val         ap_crc32c_b  = WireInit(Bool(),0.B)
  val         ap_crc32c_h  = WireInit(Bool(),0.B)
  val         ap_crc32c_w  = WireInit(Bool(),0.B)

  // ZBF
  val         ap_bfp = WireInit(Bool(),0.B)


  if (BITMANIP_ZBE == 1) {
    ap_bext         :=  io.mul_p.bits.bext
    ap_bdep         :=  io.mul_p.bits.bdep

  }
  else{
    ap_bext         :=  0.U
    ap_bdep         :=  0.U
  }

  if (BITMANIP_ZBC == 1) {
    ap_clmul        :=  io.mul_p.bits.clmul
    ap_clmulh       :=  io.mul_p.bits.clmulh
    ap_clmulr       :=  io.mul_p.bits.clmulr
  }
  else{
    ap_clmul        :=  0.U
    ap_clmulh       :=  0.U
    ap_clmulr       :=  0.U
  }

  if (BITMANIP_ZBP == 1) {
    ap_grev         :=  io.mul_p.bits.grev
    ap_gorc         :=  io.mul_p.bits.gorc
    ap_shfl         :=  io.mul_p.bits.shfl
    ap_unshfl       :=  io.mul_p.bits.unshfl
  }
  else{
    ap_grev         :=  0.U
    ap_gorc         :=  0.U
    ap_shfl         :=  0.U
    ap_unshfl       :=  0.U
  }

  if (BITMANIP_ZBR == 1) {
    ap_crc32_b      :=  io.mul_p.bits.crc32_b
    ap_crc32_h      :=  io.mul_p.bits.crc32_h
    ap_crc32_w      :=  io.mul_p.bits.crc32_w
    ap_crc32c_b     :=  io.mul_p.bits.crc32c_b
    ap_crc32c_h     :=  io.mul_p.bits.crc32c_h
    ap_crc32c_w     :=  io.mul_p.bits.crc32c_w
  }
  else{
    ap_crc32_b      :=  0.U
    ap_crc32_h      :=  0.U
    ap_crc32_w      :=  0.U
    ap_crc32c_b     :=  0.U
    ap_crc32c_h     :=  0.U
    ap_crc32c_w     :=  0.U
  }

  if (BITMANIP_ZBF == 1) {
    ap_bfp          :=  io.mul_p.bits.bfp
  }
  else{
    ap_bfp          :=  0.U
  }

  // *** End   - BitManip ***

  val mul_x_enable         = io.mul_p.valid
  val bit_x_enable         = io.mul_p.valid
  rs1_ext_in := Cat(io.mul_p.bits.rs1_sign & io.rs1_in(31),io.rs1_in).asSInt
  rs2_ext_in := Cat(io.mul_p.bits.rs2_sign & io.rs2_in(31),io.rs2_in).asSInt

  low_x := rvdffe (io.mul_p.bits.low, mul_x_enable.asBool,clock,io.scan_mode)
  rs1_x := rvdffe(rs1_ext_in, mul_x_enable.asBool,clock,io.scan_mode)
  rs2_x := rvdffe (rs2_ext_in, mul_x_enable.asBool,clock,io.scan_mode)

  prod_x := rs1_x  *  rs2_x

  // * * * * * * * * * * * * * * * * * *  BitManip  :  BEXT, BDEP   * * * * * * * * * * * * * * * * * *


  // *** BEXT == "gather"  ***

  def one_cal (ind:Int) : UInt = if (ind == 0) io.rs2_in(ind) else (0 to ind).map(io.rs2_in(_).asUInt).reduce(_+&_)
  val bext_d = (0 until 32).map(i=> MuxCase(false.B, (0 until 32).map(j=> (one_cal(j) === (i+1).U).asBool -> io.rs1_in(j).asUInt))).reverse.reduce(Cat(_,_))

  // *** BDEP == "scatter" ***
  val bdep_d =(0 until 32).map(j => Mux((io.rs2_in(j) === 1.U), io.rs1_in(one_cal(j)-1.U),0.U)).reverse.reduce(Cat(_,_))
  // * * * * * * * * * * * * * * * * * *  BitManip  :  CLMUL, CLMULH, CLMULR  * * * * * * * * * * * * *

  val clmul_raw_d = WireInit(UInt(63.W),0.U)
  clmul_raw_d := (1 until 31).map(i => Fill(63,io.rs2_in(i)) & Cat(Fill(31-i,0.U),io.rs1_in(31,0),Fill(i,0.U))).reduce(_^_) ^ ( Fill(63,io.rs2_in(0)) & Cat(Fill(31,0.U),io.rs1_in) ) ^ ( Fill(63,io.rs2_in(31)) & Cat(io.rs1_in,Fill(31,0.U)) )


  // * * * * * * * * * * * * * * * * * *  BitManip  :  GREV         * * * * * * * * * * * * * * * * * *

  // uint32_t grev32(uint32_t rs1, uint32_t rs2)
  // {
  //     uint32_t x = rs1;
  //     int shamt = rs2 & 31;
  //
  //     if (shamt &  1)  x = ( (x & 0x55555555) <<  1) | ( (x & 0xAAAAAAAA) >>  1);
  //     if (shamt &  2)  x = ( (x & 0x33333333) <<  2) | ( (x & 0xCCCCCCCC) >>  2);
  //     if (shamt &  4)  x = ( (x & 0x0F0F0F0F) <<  4) | ( (x & 0xF0F0F0F0) >>  4);
  //     if (shamt &  8)  x = ( (x & 0x00FF00FF) <<  8) | ( (x & 0xFF00FF00) >>  8);
  //     if (shamt & 16)  x = ( (x & 0x0000FFFF) << 16) | ( (x & 0xFFFF0000) >> 16);
  //
  //     return x;
  //  }


  val grev1_d = Mux(io.rs2_in(0), Range(0, 31, 2).map(i=> Cat(io.rs1_in(i),io.rs1_in(i+1))).reverse.reduce(Cat(_,_)),  io.rs1_in)

  val grev2_d = Mux(io.rs2_in(1), Range(0, 31, 4).map(i=> Cat(grev1_d(i+1,i),grev1_d(i+1+2,i+2))).reverse.reduce(Cat(_,_)) ,  grev1_d(31,0))

  val grev4_d = Mux(io.rs2_in(2), Range(0, 31, 8).map(i=> Cat(grev2_d(i+3,i),grev2_d(i+3+4,i+4))).reverse.reduce(Cat(_,_)) ,  grev2_d(31,0))

  val grev8_d = Mux(io.rs2_in(3), Range(0, 31, 16).map(i=> Cat(grev4_d(i+7,i),grev4_d(i+7+8,i+8))).reverse.reduce(Cat(_,_)),  grev4_d(31,0))

  val grev_d  = Mux(io.rs2_in(4),  Cat(grev8_d(15,0),grev8_d(31,16)), grev8_d(31,0)  )

  // * * * * * * * * * * * * * * * * * *  BitManip  :  GORC         * * * * * * * * * * * * * * * * * *

  // uint32_t gorc32(uint32_t rs1, uint32_t rs2)
  // {
  //     uint32_t x = rs1;
  //     int shamt = rs2 & 31;
  //
  //     if (shamt &  1)  x |= ( (x & 0x55555555) <<  1) | ( (x & 0xAAAAAAAA) >>  1);
  //     if (shamt &  2)  x |= ( (x & 0x33333333) <<  2) | ( (x & 0xCCCCCCCC) >>  2);
  //     if (shamt &  4)  x |= ( (x & 0x0F0F0F0F) <<  4) | ( (x & 0xF0F0F0F0) >>  4);
  //     if (shamt &  8)  x |= ( (x & 0x00FF00FF) <<  8) | ( (x & 0xFF00FF00) >>  8);
  //     if (shamt & 16)  x |= ( (x & 0x0000FFFF) << 16) | ( (x & 0xFFFF0000) >> 16);
  //
  //     return x;
  //  }

  val gorc1_d  = ( Fill(32,io.rs2_in(0)) & Range(0, 31, 2).map(i=> Cat(io.rs1_in(i),io.rs1_in(i+1))).reverse.reduce(Cat(_,_)) ) | io.rs1_in

  val gorc2_d  = ( Fill(32,io.rs2_in(1)) & Range(0, 31, 4).map(i=> Cat(gorc1_d(i+1,i),gorc1_d(i+1+2,i+2))).reverse.reduce(Cat(_,_)) ) | gorc1_d

  val gorc4_d  = ( Fill(32,io.rs2_in(2)) & Range(0, 31, 8).map(i=> Cat(gorc2_d(i+3,i),gorc2_d(i+3+4,i+4))).reverse.reduce(Cat(_,_)) ) | gorc2_d

  val gorc8_d  = ( Fill(32,io.rs2_in(3)) & Range(0, 31, 16).map(i=> Cat(gorc4_d(i+7,i),gorc4_d(i+7+8,i+8))).reverse.reduce(Cat(_,_)) ) | gorc4_d

  val gorc_d   = ( Fill(32,io.rs2_in(4)) & Cat(gorc8_d(15,0),gorc8_d(31,16)) ) | gorc8_d


  // * * * * * * * * * * * * * * * * * *  BitManip  :  SHFL, UNSHLF * * * * * * * * * * * * * * * * * *

  // uint32_t shuffle32_stage (uint32_t src, uint32_t maskL, uint32_t maskR, int N)
  // {
  //     uint32_t x  = src & ~(maskL | maskR);
  //     x          |= ((src << N) & maskL) | ((src >> N) & maskR);
  //     return x;
  // }
  //
  //
  //
  // uint32_t shfl32(uint32_t rs1, uint32_t rs2)
  // {
  //     uint32_t x = rs1;
  //     int shamt = rs2 & 15
  //
  //     if (shamt & 8)  x = shuffle32_stage(x, 0x00ff0000, 0x0000ff00, 8);
  //     if (shamt & 4)  x = shuffle32_stage(x, 0x0f000f00, 0x00f000f0, 4);
  //     if (shamt & 2)  x = shuffle32_stage(x, 0x30303030, 0xc0c0c0c0, 2);
  //     if (shamt & 1)  x = shuffle32_stage(x, 0x44444444, 0x22222222, 1);
  //
  //     return x;
  // }



  val shfl8_d = Mux(io.rs2_in(3),Range(0, 9,8).map(i=> Cat(io.rs1_in(i+7+16,i+16),io.rs1_in(i+7,i))).reverse.reduce(Cat(_,_)) ,io.rs1_in)

  val shfl4_d = Mux(io.rs2_in(2),Range(0, 13,4).map(i=> if(i<8) Cat(shfl8_d(i+3+8,i+8),shfl8_d(i+3,i))else  Cat(shfl8_d(i+3+8+8,i+8+8),shfl8_d(i+3+8,i+8))).reverse.reduce(Cat(_,_)), shfl8_d)

  val shfl2_d = Mux(io.rs2_in(1), Range(0, 15,2).map(i=> if(i<4)Cat(shfl4_d(i+1+4,i+4),shfl4_d(i+1,i))else if(i<8)Cat(shfl4_d(i+9,i+8),shfl4_d(i+5,i+4))else if(i<12)Cat(shfl4_d(i+13,i+12),shfl4_d(i+9,i+8))else Cat(shfl4_d(i+17,i+16),shfl4_d(i+13,i+12))).reverse.reduce(Cat(_,_)),  shfl4_d)

  val shfl_d  = Mux(io.rs2_in(0), Range(0, 16,1).map(i=> if(i<2) Cat(shfl2_d(i+2),shfl2_d(i))else if(i<4)  Cat(shfl2_d(i+4),shfl2_d(i+2))else if(i<6)  Cat(shfl2_d(i+6),shfl2_d(i+4))else if(i<8)  Cat(shfl2_d(i+8),shfl2_d(i+6))else if(i<10)  Cat(shfl2_d(i+10),shfl2_d(i+8))else if(i<12)  Cat(shfl2_d(i+12),shfl2_d(i+10))else if(i<14)  Cat(shfl2_d(i+14),shfl2_d(i+12))else  Cat(shfl2_d(i+16),shfl2_d(i+14))).reverse.reduce(Cat(_,_)),  shfl2_d)




  //  // uint32_t unshfl32(uint32_t rs1, uint32_t rs2)
  //  // {
  //  //     uint32_t x = rs1;
  //  //     int shamt = rs2 & 15
  //  //
  //  //     if (shamt & 1)  x = shuffle32_stage(x, 0x44444444, 0x22222222, 1);
  //  //     if (shamt & 2)  x = shuffle32_stage(x, 0x30303030, 0xc0c0c0c0, 2);
  //  //     if (shamt & 4)  x = shuffle32_stage(x, 0x0f000f00, 0x00f000f0, 4);
  //  //     if (shamt & 8)  x = shuffle32_stage(x, 0x00ff0000, 0x0000ff00, 8);
  //  //
  //  //     return x;
  //  // }
  //
  //
  val unshfl1_d    = Mux(io.rs2_in(0) , Range(0, 16,1).map(i=> if(i<2) Cat(io.rs1_in(i+2),io.rs1_in(i))else if(i<4)  Cat(io.rs1_in(i+4),io.rs1_in(i+2))else if(i<6)  Cat(io.rs1_in(i+6),io.rs1_in(i+4))else if(i<8)  Cat(io.rs1_in(i+8),io.rs1_in(i+6))else if(i<10)  Cat(io.rs1_in(i+10),io.rs1_in(i+8))else if(i<12)  Cat(io.rs1_in(i+12),io.rs1_in(i+10))else if(i<14)  Cat(io.rs1_in(i+14),io.rs1_in(i+12))else  Cat(io.rs1_in(i+16),io.rs1_in(i+14))).reverse.reduce(Cat(_,_)) ,  io.rs1_in)

  val unshfl2_d     =Mux(io.rs2_in(1) , Range(0, 15,2).map(i=> if(i<4)Cat(unshfl1_d(i+1+4,i+4),unshfl1_d(i+1,i))else if(i<8)Cat(unshfl1_d(i+9,i+8),unshfl1_d(i+5,i+4))else if(i<12)Cat(unshfl1_d(i+13,i+12),unshfl1_d(i+9,i+8))else Cat(unshfl1_d(i+17,i+16),unshfl1_d(i+13,i+12))).reverse.reduce(Cat(_,_)) ,  unshfl1_d)

  val unshfl4_d    = Mux(io.rs2_in(2) , Range(0, 13,4).map(i=> if(i<8) Cat(unshfl2_d(i+3+8,i+8),unshfl2_d(i+3,i))else  Cat(unshfl2_d(i+3+8+8,i+8+8),unshfl2_d(i+3+8,i+8))).reverse.reduce(Cat(_,_)) ,  unshfl2_d)

  val unshfl_d     = Mux(io.rs2_in(3) , Range(0, 9,8).map(i=> Cat(unshfl4_d(i+7+16,i+16),unshfl4_d(i+7,i))).reverse.reduce(Cat(_,_)) , unshfl4_d)

  // * * * * * * * * * * * * * * * * * *  BitManip  :  BFP          * * * * * * * * * * * * * * * * * *



  val bfp_len           =  Cat(io.rs2_in(27,24) === 0.U,io.rs2_in(27,24)) // If LEN field is zero, then LEN=16
  val bfp_off      =  io.rs2_in(20,16)

  val bfp_len_mask_    =  "hffff_ffff".U(32.W)  <<  bfp_len
  val bfp_preshift_data  =  io.rs2_in(15,0) & ~bfp_len_mask_(15,0)

  val bfp_shift_data   = Cat(Fill(16,0.U),bfp_preshift_data(15,0), Fill(16,0.U),bfp_preshift_data(15,0))  <<  bfp_off
  val bfp_shift_mask   = Cat(bfp_len_mask_(31,0), bfp_len_mask_(31,0))  <<  bfp_off

  val bfp_result_d     = bfp_shift_data(63,32) | (io.rs1_in & bfp_shift_mask(63,32))

  // * * * * * * * * * * * * * * * * * *  BitManip  :  CRC32, CRC32c  * * * * * * * * * * * * * * * * *

  // ***  computed from   https: //crccalc.com  ***
  //
  // "a" is 8'h61 = 8'b0110_0001    (8'h61 ^ 8'hff = 8'h9e)
  //
  // Input must first be XORed with 32'hffff_ffff
  //
  //
  // CRC32
  //
  // Input    Output        Input      Output
  // -----   --------      --------   --------
  // "a"     e8b7be43      ffffff9e   174841bc
  // "aa"    078a19d7      ffff9e9e   f875e628
  // "aaaa"  ad98e545      9e9e9e9e   5267a1ba
  //
  //
  //
  // CRC32c
  //
  // Input    Output        Input      Output
  // -----   --------      --------   --------
  // "a"     c1d04330      ffffff9e   3e2fbccf
  // "aa"    f1f2dac2      ffff9e9e   0e0d253d
  // "aaaa"  6a52eeb0      9e9e9e9e   95ad114f


  val crc32_all              =  ap_crc32_b  | ap_crc32_h  | ap_crc32_w | ap_crc32c_b | ap_crc32c_h | ap_crc32c_w

  val crc32_poly_rev   =  "hEDB88320".U(32.W)    // bit reverse of 32'h04C11DB7
  val crc32c_poly_rev  =  "h82F63B78".U(32.W)    // bit reverse of 32'h1EDC6F41


  val crc32_bd            =  Wire(Vec(9,UInt(32.W)))
  crc32_bd(0) := io.rs1_in
  for(i <- 1 to 8) {
    crc32_bd(i) := (crc32_bd(i-1) >> 1) ^ (crc32_poly_rev & Fill(32,crc32_bd(i-1)(0)))//io.rs1_in
  }

  val crc32_hd            =  Wire(Vec(17,UInt(32.W)))
  crc32_hd(0) := io.rs1_in
  for(i <- 1 to 16) {
    crc32_hd(i) := (crc32_hd(i-1) >> 1) ^ (crc32_poly_rev & Fill(32,crc32_hd(i-1)(0)))//io.rs1_in
  }

  val crc32_wd            =  Wire(Vec(33,UInt(32.W)))
  crc32_wd(0) := io.rs1_in
  for(i <- 1 to 32) {
    crc32_wd(i) := (crc32_wd(i-1) >> 1) ^ (crc32_poly_rev & Fill(32,crc32_wd(i-1)(0)))//io.rs1_in
  }
  /////////////////////////////////////////////////////////////////////////////////////////

  val crc32c_bd            =  Wire(Vec(9,UInt(32.W)))
  crc32c_bd(0) := io.rs1_in
  for(i <- 1 to 8) {
    crc32c_bd(i) := (crc32c_bd(i-1) >> 1) ^ (crc32c_poly_rev & Fill(32,crc32c_bd(i-1)(0)))//io.rs1_in
  }


  val crc32c_hd            =  Wire(Vec(17,UInt(32.W)))
  crc32c_hd(0) := io.rs1_in
  for(i <- 1 to 16) {
    crc32c_hd(i) := (crc32c_hd(i-1) >> 1) ^ (crc32c_poly_rev & Fill(32,crc32c_hd(i-1)(0)))//io.rs1_in
  }


  val crc32c_wd            =  Wire(Vec(33,UInt(32.W)))
  crc32c_wd(0) := io.rs1_in
  for(i <- 1 to 32) {
    crc32c_wd(i) := (crc32c_wd(i-1) >> 1) ^ (crc32c_poly_rev & Fill(32,crc32c_wd(i-1)(0)))//io.rs1_in
  }


  // * * * * * * * * * * * * * * * * * *  BitManip  :  Common logic * * * * * * * * * * * * * * * * * *


  val bitmanip_sel_d         =  ap_bext | ap_bdep | ap_clmul | ap_clmulh | ap_clmulr | ap_grev | ap_gorc | ap_shfl | ap_unshfl | crc32_all | ap_bfp

  val bitmanip_d       = Mux1H(Seq(
    ap_bext     ->       bext_d(31,0)                         ,
    ap_bdep     ->       bdep_d(31,0)                         ,
    ap_clmul    ->       clmul_raw_d(31,0)                    ,
    ap_clmulh   ->       Cat(0.U(1.W),clmul_raw_d(62,32))     ,
    ap_clmulr   ->       clmul_raw_d(62,31)                   ,
    ap_grev     ->       grev_d(31,0)                         ,
    ap_gorc     ->       gorc_d(31,0)                         ,
    ap_shfl     ->       shfl_d(31,0)                         ,
    ap_unshfl   ->       unshfl_d(31,0)                       ,
    ap_crc32_b  ->       crc32_bd(8)(31,0)                       ,
    ap_crc32_h  ->       crc32_hd(16)(31,0)                       ,
    ap_crc32_w  ->       crc32_wd(32)(31,0)                       ,
    ap_crc32c_b ->       crc32c_bd(8)(31,0)                      ,
    ap_crc32c_h ->       crc32c_hd(16)(31,0)                      ,
    ap_crc32c_w ->       crc32c_wd(32)(31,0)                      ,
    ap_bfp      ->       bfp_result_d(31,0) ))

  val bitmanip_sel_x = rvdffe(bitmanip_sel_d,bit_x_enable,clock,io.scan_mode)
  val bitmanip_x = rvdffe(bitmanip_d,bit_x_enable,clock,io.scan_mode)


  io.result_x :=  (Fill(32,~bitmanip_sel_x & ~low_x) & prod_x(63,32) )    |
    (Fill(32,~bitmanip_sel_x &  low_x) & prod_x(31,0)  )    |
    bitmanip_x

}
object mul extends App {
  println((new ChiselStage).emitVerilog(new exu_mul_ctl))}


