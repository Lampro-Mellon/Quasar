package exu

import chisel3._
import chisel3.util._
import include._
import lib._

class exu_alu_ctl extends Module with lib with RequireAsyncReset{
  val io = IO(new Bundle{
    val dec_alu = new dec_alu()

    val                  csr_rddata_in                = Input(UInt(32.W))     // CSR data
    val                  dec_i0_pc_d                  = Input(UInt(31.W))              // for pc=pc+2,4 calculations
    val                  scan_mode                    = Input(UInt(1.W))  // Scan control
    val                  flush_upper_x                = Input(UInt(1.W))  // Branch flush from previous cycle
    val                  dec_tlu_flush_lower_r        = Input(UInt(1.W))  // Master flush of entire pipeline
    val                  enable                       = Input(Bool())  // Clock enable
    val                  i0_ap                           = Input( new alu_pkt_t )                // predecodes
    val                  a_in                         = Input(SInt(32.W))               // A operand
    val                  b_in                         = Input(UInt(32.W))               // B operand
    val                  pp_in                        = Flipped(Valid(new predict_pkt_t))              // Predicted branch structure
    //////////  Outputs  /////////
    val                  result_ff         = Output(UInt(32.W))          // final result
    val                  flush_upper_out   = Output(UInt(1.W)) // Branch flush
    val                  flush_final_out   = Output(UInt(1.W)) // Branch flush or flush entire pipeline
    val                  flush_path_out    = Output(UInt(31.W)) // Branch flush PC
    val                  pred_correct_out  = Output(UInt(1.W)) // NPC control
    val                  predict_p_out     = Valid(new predict_pkt_t)     // Predicted branch structure
  })
  //zbb
  val                  ap_clz        = WireInit(Bool(),0.B)
  val                  ap_ctz        = WireInit(Bool(),0.B)
  val                  ap_pcnt       = WireInit(Bool(),0.B)
  val                  ap_sext_b     = WireInit(Bool(),0.B)
  val                  ap_sext_h     = WireInit(Bool(),0.B)
  val                  ap_min        = WireInit(Bool(),0.B)
  val                  ap_max        = WireInit(Bool(),0.B)
  val                  ap_pack       = WireInit(Bool(),0.B)
  val                  ap_packu      = WireInit(Bool(),0.B)
  val                  ap_packh      = WireInit(Bool(),0.B)
  val                  ap_rol        = WireInit(Bool(),0.B)
  val                  ap_ror        = WireInit(Bool(),0.B)
  val                  ap_rev        = WireInit(Bool(),0.B)
  val                  ap_rev8       = WireInit(Bool(),0.B)
  val                  ap_orc_b      = WireInit(Bool(),0.B)
  val                  ap_orc16      = WireInit(Bool(),0.B)
  val                  ap_zbb        = WireInit(Bool(),0.B)
  // Zbs
  val ap_sbset = WireInit(Bool(),0.B)
  val ap_sbclr = WireInit(Bool(),0.B)
  val ap_sbinv = WireInit(Bool(),0.B)
  val ap_sbext = WireInit(Bool(),0.B)

  // Zbr
  val  ap_slo  = WireInit(Bool(),0.B)
  val  ap_sro  = WireInit(Bool(),0.B)

  // Zba
  val  ap_sh1add    = WireInit(Bool(),0.B)
  val  ap_sh2add    = WireInit(Bool(),0.B)
  val  ap_sh3add    = WireInit(Bool(),0.B)
  val  ap_zba       = WireInit(Bool(),0.B)

  if (BITMANIP_ZBB) {
    ap_clz          :=  io.i0_ap.clz
    ap_ctz          :=  io.i0_ap.ctz
    ap_pcnt         :=  io.i0_ap.pcnt
    ap_sext_b       :=  io.i0_ap.sext_b
    ap_sext_h       :=  io.i0_ap.sext_h
    ap_min          :=  io.i0_ap.min
    ap_max          :=  io.i0_ap.max
  }  else{
    ap_clz          :=  0.U
    ap_ctz          :=  0.U
    ap_pcnt         :=  0.U
    ap_sext_b       :=  0.U
    ap_sext_h       :=  0.U
    ap_min          :=  0.U
    ap_max          :=  0.U
  }
  if ( (BITMANIP_ZBB) | (BITMANIP_ZBP) ) {
    ap_pack         :=  io.i0_ap.pack
    ap_packu        :=  io.i0_ap.packu
    ap_packh        :=  io.i0_ap.packh
    ap_rol          :=  io.i0_ap.rol
    ap_ror          :=  io.i0_ap.ror
    ap_rev          :=  io.i0_ap.grev & (io.b_in(4,0) === "b11111".U)
    ap_rev8         :=  io.i0_ap.grev & (io.b_in(4,0) === "b11000".U)
    ap_orc_b        :=  io.i0_ap.gorc & (io.b_in(4,0) === "b00111".U)
    ap_orc16        :=  io.i0_ap.gorc & (io.b_in(4,0) === "b10000".U)
    ap_zbb          :=  io.i0_ap.zbb
  } else{
    ap_pack         :=  0.U
    ap_packu        :=  0.U
    ap_packh        :=  0.U
    ap_rol          :=  0.U
    ap_ror          :=  0.U
    ap_rev          :=  0.U
    ap_rev8         :=  0.U
    ap_orc_b        :=  0.U
    ap_orc16        :=  0.U
    ap_zbb          :=  0.U
  }
  if (BITMANIP_ZBS) {
    ap_sbset        :=  io.i0_ap.sbset
    ap_sbclr        :=  io.i0_ap.sbclr
    ap_sbinv        :=  io.i0_ap.sbinv
    ap_sbext        :=  io.i0_ap.sbext
  }else  {
    ap_sbset        :=  0.U
    ap_sbclr        :=  0.U
    ap_sbinv        :=  0.U
    ap_sbext        :=  0.U
  }
  if (BITMANIP_ZBP) {
    ap_slo          :=  io.i0_ap.slo
    ap_sro          :=  io.i0_ap.sro
  } else  {
    ap_slo          :=  0.U
    ap_sro          :=  0.U
  }
  if (BITMANIP_ZBA) {
    ap_sh1add       :=  io.i0_ap.sh1add
    ap_sh2add       :=  io.i0_ap.sh2add
    ap_sh3add       :=  io.i0_ap.sh3add
    ap_zba          :=  io.i0_ap.zba
  } else {
    ap_sh1add       :=  0.U
    ap_sh2add       :=  0.U
    ap_sh3add       :=  0.U
    ap_zba          :=  0.U
  }
  io.dec_alu.exu_i0_pc_x := rvdffpcie(io.dec_i0_pc_d,io.enable,reset.asAsyncReset(),clock,io.scan_mode.asBool) // any PC is run through here - doesn't have to be alu
  val result = WireInit(UInt(32.W),0.U)
  io.result_ff := rvdffe(result,io.enable & io.dec_alu.dec_i0_alu_decode_d,clock,io.scan_mode.asBool)

  val zba_a_in      = Mux1H(Seq(
    ap_sh1add -> Cat(io.a_in(30,0),0.U(1.W)).asSInt ,
    ap_sh2add -> Cat(io.a_in(29,0),0.U(2.W)).asSInt ,
    ap_sh3add -> Cat(io.a_in(28,0),0.U(3.W)).asSInt ,
    ~ap_zba    -> io.a_in       ))

  val   bm = Mux( io.i0_ap.sub.asBool, ~io.b_in, io.b_in) //H:b modified

  val aout = WireInit(UInt(33.W),0.U)
  aout := Mux(io.i0_ap.sub.asBool,(Cat(0.U(1.W),zba_a_in) + Cat(0.U(1.W),~io.b_in) + Cat(0.U(32.W),io.i0_ap.sub)), (Cat(0.U(1.W),io.a_in) + Cat(0.U(1.W), io.b_in) + Cat(0.U(32.W),io.i0_ap.sub)))
  val cout = aout(32)

  val ov  = (!io.a_in(31) & !bm(31) &  aout(31)) | ( io.a_in(31) &  bm(31) & !aout(31) ) //overflow check from last bits

  val eq                  = (io.a_in === io.b_in.asSInt)
  val ne                  = ~eq
  val neg                 =  aout(31)// check for the last signed bit (for neg)
  val lt                  = (!io.i0_ap.unsign & (neg ^ ov)) |  ( io.i0_ap.unsign & !cout)  //if alu packet sends unsigned and there is no cout(i.e no overflow and unsigned pkt)
  val ge                  = !lt // if not less then


  val lout        = Mux1H(Seq(
    io.dec_alu.dec_csr_ren_d            ->  io.csr_rddata_in.asSInt      ,
    (io.i0_ap.land & !ap_zbb).asBool    -> (Cat(0.U(1.W),io.a_in).asSInt &  io.b_in.asSInt) ,
    (io.i0_ap.lor  & !ap_zbb).asBool    -> (Cat(0.U(1.W),io.a_in).asSInt |  io.b_in.asSInt) ,
    (io.i0_ap.lxor & !ap_zbb).asBool    -> (Cat(0.U(1.W),io.a_in).asSInt ^  io.b_in.asSInt) ,
    (io.i0_ap.land &  ap_zbb).asBool    -> (Cat(0.U(1.W),io.a_in).asSInt & ~io.b_in.asSInt) ,
    (io.i0_ap.lor  &  ap_zbb).asBool    -> (Cat(0.U(1.W),io.a_in).asSInt | ~io.b_in.asSInt) ,
    (io.i0_ap.lxor &  ap_zbb).asBool    -> (Cat(0.U(1.W),io.a_in).asSInt ^ ~io.b_in.asSInt) ))


  //  val lout                =  Mux1H(Seq(
  //    io.dec_alu.dec_csr_ren_d.asBool ->              io.b_in.asSInt,  //read enable read rs2
  //    io.i0_ap.land.asBool    ->  (io.a_in &  io.b_in.asSInt),  //and rs1 and 2
  //    io.i0_ap.lor.asBool     ->  (io.a_in |  io.b_in.asSInt),
  //    io.i0_ap.lxor.asBool    ->  (io.a_in ^  io.b_in.asSInt)))

  // * * * * * * * * * * * * * * * * * *  BitManip  :  SLO,SRO      * * * * * * * * * * * * * * * * * *
  // * * * * * * * * * * * * * * * * * *  BitManip  :  ROL,ROR      * * * * * * * * * * * * * * * * * *
  // * * * * * * * * * * * * * * * * * *  BitManip  :  ZBEXT        * * * * * * * * * * * * * * * * * *

  val shift_amount   = Mux1H(Seq (
    io.i0_ap.sll.asBool   -> (32.U(6.W) - Cat(0.U(1.W),io.b_in(4,0))),    // [5] unused
    io.i0_ap.srl.asBool   ->              Cat(0.U(1.W),io.b_in(4,0)) ,
    io.i0_ap.sra.asBool   ->              Cat(0.U(1.W),io.b_in(4,0)) ,
    ap_rol                -> (32.U(6.W) - Cat(0.U(1.W),io.b_in(4,0)) ) ,
    ap_ror                ->              Cat(0.U(1.W),io.b_in(4,0))   ,
    ap_slo                -> (32.U(6.W) - Cat(0.U(1.W),io.b_in(4,0)) ) ,
    ap_sro                ->              Cat(0.U(1.W),io.b_in(4,0))   ,
    ap_sbext              ->              Cat(0.U(1.W),io.b_in(4,0))  ))

  val shift_mask = WireInit(UInt(32.W),0.U)
  shift_mask := ( "hffffffff".U(32.W) << (repl(5,io.i0_ap.sll | ap_slo) & io.b_in(4,0)) )

  val shift_extend = WireInit(UInt(63.W),0.U)
  shift_extend :=  Cat((repl(31,io.i0_ap.sra) & repl(31,io.a_in(31))) | (repl(31,io.i0_ap.sll) & io.a_in(30,0)), io.a_in)

  shift_extend :=  Cat( Mux1H(Seq(io.i0_ap.sra.asBool() -> Fill(31,io.a_in(31)) ,
    io.i0_ap.sll.asBool() ->     io.a_in(30,0) ,
    ap_rol                ->     io.a_in(30,0) ,
    ap_ror                ->     io.a_in(30,0) ,
    ap_slo                ->     io.a_in(30,0) ,
    ap_sro                ->     Fill(31,1.U) )),io.a_in)

  val shift_long = WireInit(UInt(63.W),0.U)
  shift_long := ( shift_extend >> shift_amount(4,0) )   // 62-32 unused

  val sout  = ( shift_long(31,0) & shift_mask(31,0) ) | ( Fill(32,ap_slo) & ~shift_mask(31,0) )  //incase of sra shift_mask is 1

  // * * * * * * * * * * * * * * * * * *  BitManip  :  CLZ,CTZ      * * * * * * * * * * * * * * * * * *

  val bitmanip_a_reverse_ff  = (0 until io.a_in.getWidth).map(i=> io.a_in(i).asUInt).reduce(Cat(_,_))
  //  {a_in[0],  a_in[1],  a_in[2],  a_in[3],  a_in[4],  a_in[5],  a_in[6],  a_in[7],
  //    a_in[8],  a_in[9],  a_in[10], a_in[11], a_in[12], a_in[13], a_in[14], a_in[15],
  //    a_in[16], a_in[17], a_in[18], a_in[19], a_in[20], a_in[21], a_in[22], a_in[23],
  //    a_in[24], a_in[25], a_in[26], a_in[27], a_in[28], a_in[29], a_in[30], a_in[31]};

  val bitmanip_lzd_in        = Mux1H(Seq(ap_clz -> io.a_in, ap_ctz -> bitmanip_a_reverse_ff.asSInt))
  /////////////////////
  val bitmanip_lzd_os   =  bitmanip_lzd_in
  val bitmanip_dw_lzd_enc =  WireInit(UInt(6.W),0.U)

  bitmanip_dw_lzd_enc := MuxCase(0.U,(0 until 32).map(i=> (bitmanip_lzd_os(31,i)===0.U)->(32-i).U))//return leading zeros

  val bitmanip_clz_ctz_result = Cat(Fill(6, ap_clz | ap_ctz) & bitmanip_dw_lzd_enc(5),  Fill(5,!bitmanip_dw_lzd_enc(5)) & bitmanip_dw_lzd_enc(4,0) )
  // * * * * * * * * * * * * * * * * * *  BitManip  :  PCNT         * * * * * * * * * * * * * * * * * *

  val bitmanip_pcnt_result    =  Fill(6,ap_pcnt) & PopCount(io.a_in)
  // * * * * * * * * * * * * * * * * * *  BitManip  :  SEXT_B,SEXT_H  * * * * * * * * * * * * * * * * *


  val bitmanip_sext_result   = Mux1H(Seq(ap_sext_b -> Cat( Fill(24,io.a_in(7)) ,io.a_in(7,0)),
    ap_sext_h -> Cat( Fill(16,io.a_in(15)),io.a_in(15,0))) )

  // * * * * * * * * * * * * * * * * * *  BitManip  :  MIN,MAX,MINU,MAXU  * * * * * * * * * * * * * * *

  val bitmanip_minmax_sel          =  ap_min | ap_max;

  val bitmanip_minmax_sel_a        =  ge  ^ ap_min;

  val bitmanip_minmax_result = Mux1H(Seq(
    (bitmanip_minmax_sel &  bitmanip_minmax_sel_a)  ->  io.a_in,
    (bitmanip_minmax_sel & !bitmanip_minmax_sel_a)  ->  io.b_in.asSInt  ))

  // * * * * * * * * * * * * * * * * * *  BitManip  :  PACK, PACKU, PACKH * * * * * * * * * * * * * * *


  val bitmanip_pack_result   = Fill(32,ap_pack)  & Cat(io.b_in(15,0), io.a_in(15,0))
  val bitmanip_packu_result  = Fill(32,ap_packu) & Cat(io.b_in(31,16),io.a_in(31,16))
  val bitmanip_packh_result  = Fill(32,ap_packh) & Cat(0.U(16.W),io.b_in(7,0),io.a_in(7,0))



  // * * * * * * * * * * * * * * * * * *  BitManip  :  REV, REV8, ORC_B * * * * * * * * * * * * * * * *

  val bitmanip_rev_result    = Fill(32,ap_rev) & (0 until io.a_in.getWidth).map(i=> io.a_in(i).asUInt).reduce(Cat(_,_))

  val bitmanip_rev8_result   = Fill(32,ap_rev8)  & (0 until io.a_in.getWidth/8).map(i=> io.a_in(7+i*8,0+i*8).asUInt).reduce(Cat(_,_))  //{a_in[7:0],a_in[15:8],a_in[23:16],a_in[31:24]};


  // uint32_t gorc32(uint32_t rs1, uint32_t rs2)
  // {
  //      uint32_t x = rs1;
  //      int shamt = rs2 & 31;                                                        ORC.B  ORC16
  //      if (shamt &  1) x |= ((x & 0x55555555) <<  1) | ((x & 0xAAAAAAAA) >>  1);      1      0
  //      if (shamt &  2) x |= ((x & 0x33333333) <<  2) | ((x & 0xCCCCCCCC) >>  2);      1      0
  //      if (shamt &  4) x |= ((x & 0x0F0F0F0F) <<  4) | ((x & 0xF0F0F0F0) >>  4);      1      0
  //      if (shamt &  8) x |= ((x & 0x00FF00FF) <<  8) | ((x & 0xFF00FF00) >>  8);      0      0
  //      if (shamt & 16) x |= ((x & 0x0000FFFF) << 16) | ((x & 0xFFFF0000) >> 16);      0      1
  //      return x;
  // }


  // BEFORE              31  ,   30  ,   29  ,   28  ,    27  ,   26,     25,     24
  // shamt[0]  b =    a31|a30,a31|a30,a29|a28,a29|a28, a27|a26,a27|a26,a25|a24,a25|a24
  // shamt[1]  c =    b31|b29,b30|b28,b31|b29,b30|b28, b27|b25,b26|b24,b27|b25,b26|b24
  // shamt[2]  d =    c31|c27,c30|c26,c29|c25,c28|c24, c31|c27,c30|c26,c29|c25,c28|c24
  //
  // Expand d31 =        c31         |         c27;
  //            =   b31   |   b29    |    b27   |   b25;
  //            = a31|a30 | a29|a28  |  a27|a26 | a25|a24

  val bitmanip_orc_b_result  = Fill(32,ap_orc_b) & (0 until io.a_in.getWidth/8).map(i=> Fill(8,io.a_in(7+i*8,0+i*8).orR).asUInt).reverse.reduce(Cat(_,_))  //{ {8{| a_in[31:24]}}, {8{| a_in[23:16]}}, {8{| a_in[15:8]}}, {8{| a_in[7:0]}} };

  val bitmanip_orc16_result  = Fill(32,ap_orc16) & Cat(io.a_in(31,16) | io.a_in(15,0), io.a_in(31,16) | io.a_in(15,0))

  // * * * * * * * * * * * * * * * * * *  BitManip  :  ZBSET, ZBCLR, ZBINV  * * * * * * * * * * * * * *

  val bitmanip_sb_1hot       =  "h00000001".U(32.W) << io.b_in(4,0)

  val bitmanip_sb_data       = Mux1H(Seq(
    ap_sbset -> ( io.a_in |  bitmanip_sb_1hot(31,0).asSInt),
    ap_sbclr -> ( io.a_in & ~bitmanip_sb_1hot(31,0).asSInt),
    ap_sbinv -> ( io.a_in ^  bitmanip_sb_1hot(31,0).asSInt) ))


  val sel_shift           =  io.i0_ap.sll  | io.i0_ap.srl | io.i0_ap.sra | ap_slo | ap_sro | ap_rol | ap_ror
  val sel_adder           = (io.i0_ap.add  | io.i0_ap.sub | ap_zba) & !io.i0_ap.slt & !ap_min & !ap_max
  val sel_pc              =  io.i0_ap.jal  | io.pp_in.bits.pcall | io.pp_in.bits.pja | io.pp_in.bits.pret
  val csr_write_data      = Mux(io.i0_ap.csr_imm.asBool, io.b_in.asSInt, io.a_in)

  val slt_one             =  io.i0_ap.slt & lt

  // for a conditional br pcout[] will be the opposite of the branch prediction
  // for jal or pcall, it will be the link address pc+2 or pc+4
  val pcout =  rvbradder(Cat(io.dec_i0_pc_d,0.U),Cat(io.dec_alu.dec_i0_br_immed_d,0.U))

  result       :=  lout(31,0) | (Fill(32,sel_shift)    &  sout(31,0)) |
    (Fill(32,sel_adder)    &  aout(31,0)) |
    (Fill(32,sel_pc)       &  pcout   ) |
    (Fill(32,io.i0_ap.csr_write) &  csr_write_data(31,0)) |
    Cat(0.U(31.W), slt_one)                            |
    (Fill(32,ap_sbext)     &  Cat(0.U(31.W), sout(0))) |
    (Cat(0.U(26.W), bitmanip_clz_ctz_result(5,0))) |
    (Cat(0.U(26.W), bitmanip_pcnt_result(5,0)) )   |
    bitmanip_sext_result(31,0)    |
    bitmanip_minmax_result(31,0)  |
    bitmanip_pack_result(31,0)    |
    bitmanip_packu_result(31,0)   |
    bitmanip_packh_result(31,0)   |
    bitmanip_rev_result(31,0)     |
    bitmanip_rev8_result(31,0)    |
    bitmanip_orc_b_result(31,0)   |
    bitmanip_orc16_result(31,0)   |
    bitmanip_sb_data(31,0)
  //    lout(31,0) | Cat(0.U(31.W),slt_one) | (Mux1H(Seq(
  //    sel_shift.asBool       ->       sout(31,0),
  //    sel_adder.asBool       ->       aout(31,0),
  //    sel_pc.asBool          ->       pcout,
  //    io.i0_ap.csr_write.asBool ->       csr_write_data(31,0))))

  // *** branch handling ***

  val any_jal             =  io.i0_ap.jal      | //jal
    io.pp_in.bits.pcall | //branch is a call inst
    io.pp_in.bits.pja   | //branch is a jump always
    io.pp_in.bits.pret //return inst

  val actual_taken        = (io.i0_ap.beq & eq) | (io.i0_ap.bne & ne.asUInt) | (io.i0_ap.blt & lt) | (io.i0_ap.bge & ge) | any_jal

  // pred_correct is for the npc logic
  // pred_correct indicates not to use the flush_path
  // for any_jal pred_correct==0
  io.pred_correct_out    := (io.dec_alu.dec_i0_alu_decode_d & io.i0_ap.predict_nt & !actual_taken & !any_jal) | (io.dec_alu.dec_i0_alu_decode_d & io.i0_ap.predict_t  &  actual_taken & !any_jal)
  // for any_jal adder output is the flush path
  io.flush_path_out  := Mux(any_jal.asBool, aout(31,1), pcout(31,1))

  // pcall and pret are included here
  val cond_mispredict   = (io.i0_ap.predict_t  & !actual_taken) | (io.i0_ap.predict_nt &  actual_taken.asUInt)

  // target mispredicts on ret's
  val target_mispredict   =  io.pp_in.bits.pret & (io.pp_in.bits.prett =/= aout(31,1)) //predicted return target != aout

  io.flush_upper_out     :=   (io.i0_ap.jal | cond_mispredict | target_mispredict) & io.dec_alu.dec_i0_alu_decode_d & !io.flush_upper_x   & !io.dec_tlu_flush_lower_r
  io.flush_final_out     := ( (io.i0_ap.jal | cond_mispredict | target_mispredict) & io.dec_alu.dec_i0_alu_decode_d & !io.flush_upper_x ) |  io.dec_tlu_flush_lower_r
  //there was entire pipe flush or (there is mispred or a jal) therfore signAL 1 to flush entire pipe

  val  newhist = WireInit(UInt(2.W),0.U)
  newhist    := Cat((io.pp_in.bits.hist(1) &  io.pp_in.bits.hist(0)) | (!io.pp_in.bits.hist(0) & actual_taken),//newhist[1]
    (!io.pp_in.bits.hist(1) & !actual_taken)  | (io.pp_in.bits.hist(1) & actual_taken))   //newhist[0]

  io.predict_p_out           :=  io.pp_in
  io.predict_p_out.bits.misp      := !io.flush_upper_x & !io.dec_tlu_flush_lower_r & (cond_mispredict | target_mispredict)// if 1 tells that it was a	misprediction becauseprevious cycle was not a flush and these was no master flush(lower pipe flush) and ifu predicted taken but actually its nt
  io.predict_p_out.bits.ataken    :=  actual_taken; // send a control signal telling it branch taken or not
  io.predict_p_out.bits.hist      :=  newhist
}
