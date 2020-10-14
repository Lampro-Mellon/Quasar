package ifu
import lib._
import chisel3.{util, _}
import chisel3.util._

class el2_ifu_ic_mem extends Module with param{
  val io = IO(new Bundle{
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
    val ic_wr_data = Input(Vec(ICACHE_BANKS_WAY, Input(UInt(71.W))))
    val ic_rd_data = Output(UInt(64.W))
    val ic_debug_rd_data = Output(UInt(71.W))
    val ictag_debug_rd_data = Output(UInt(26.W))
    val ic_debug_wr_data = Input(UInt(71.W))
    val ic_eccerr = Output(UInt(ICACHE_BANKS_WAY.W))
    val ic_parerr = Output(UInt(ICACHE_BANKS_WAY.W))
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
}

/////////// ICACHE TAG
class EL2_IC_TAG extends Module with el2_lib with param {
  val io = IO(new Bundle{
    val scan_mode                 = Input(Bool())
    val clk_override              = Input(Bool())
    val dec_tlu_core_ecc_disable  = Input(Bool())
    val ic_rw_addr                = Input(UInt(29.W)) // 32:3
    val ic_wr_en                  = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_valid              = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_en                  = Input(Bool())
    val ic_debug_addr             = Input(UInt((ICACHE_INDEX_HI-2).W)) // 12-2 = 10-bit value
    val ic_debug_rd_en            = Input(Bool())
    val ic_debug_wr_en            = Input(Bool())
    val ic_debug_tag_array        = Input(Bool())
    val ic_debug_way              = Input(UInt(ICACHE_NUM_WAYS.W))
    val ictag_debug_rd_data       = Output(UInt(26.W))
    val ic_debug_wr_data          = Input(UInt(71.W))
    val ic_rd_hit                 = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_tag_perr               = Output(Bool())
  })
  io.ictag_debug_rd_data := 0.U
  io.ic_rd_hit := 0.U
  io.ic_tag_perr := 0.U
  val ic_debug_wr_way_en = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)
  val ic_debug_rd_way_en = WireInit(UInt(ICACHE_NUM_WAYS.W), 0.U)

  val ic_tag_wren = io.ic_wr_en & Fill(ICACHE_NUM_WAYS, io.ic_rw_addr(ICACHE_BEAT_ADDR_HI-3,1)=== Fill(ICACHE_NUM_WAYS-1, 1.U))
  val ic_tag_clken = Fill(ICACHE_NUM_WAYS, io.ic_rd_en|io.clk_override) | io.ic_wr_en | ic_debug_wr_way_en | ic_debug_rd_way_en

  val ic_rd_en_ff = RegNext(io.ic_rd_en, 0.U)
  val ic_rw_addr_ff = RegNext(io.ic_rw_addr(31-ICACHE_TAG_LO, 0), 0.U)

  val PAD_BITS = 21 - (32 - ICACHE_TAG_LO)

  ic_debug_rd_way_en := Fill(ICACHE_NUM_WAYS, io.ic_debug_rd_en & io.ic_debug_tag_array) & io.ic_debug_way
  ic_debug_wr_way_en := Fill(ICACHE_NUM_WAYS, io.ic_debug_wr_en & io.ic_debug_tag_array) & io.ic_debug_way

  val ic_tag_wren_q = ic_tag_wren | ic_debug_wr_way_en

  val ic_tag_ecc = if(ICACHE_ECC) rvecc_encode(Cat(Fill(ICACHE_TAG_LO,0.U),io.ic_rw_addr(31-3, ICACHE_TAG_LO-3))) else 0.U

  val ic_tag_parity = if(ICACHE_ECC) rveven_paritygen(Cat(Fill(ICACHE_TAG_LO,0.U),io.ic_rw_addr(31-3, ICACHE_TAG_LO-3))) else 0.U

  val ic_tag_wr_data = if(ICACHE_TAG_LO==1)Mux(io.ic_debug_wr_en & io.ic_debug_tag_array, Cat(if(ICACHE_ECC) io.ic_debug_wr_data(68,64) else io.ic_debug_wr_data(64), io.ic_debug_wr_data(31,11)),
    Cat(if(ICACHE_ECC) ic_tag_ecc(4,0) else ic_tag_parity, io.ic_rw_addr(31-3,ICACHE_TAG_LO-3)))
  else Mux(io.ic_debug_wr_en & io.ic_debug_tag_array, Cat(if(ICACHE_ECC) io.ic_debug_wr_data(68,64) else io.ic_debug_wr_data(64), io.ic_debug_wr_data(31,11)),
    Cat(if(ICACHE_ECC) Cat(ic_tag_ecc(4,0),Fill(PAD_BITS,0.U)) else Cat(ic_tag_parity,Fill(PAD_BITS,0.U)), io.ic_rw_addr(31-3,ICACHE_TAG_LO-3)))

  val ic_rw_addr_q = Mux((io.ic_debug_rd_en | io.ic_debug_wr_en).asBool,io.ic_debug_addr(ICACHE_INDEX_HI-3,ICACHE_TAG_INDEX_LO-3),io.ic_rw_addr)

  val ic_debug_rd_way_en_ff = RegNext(ic_debug_rd_way_en, 0.U)

  val tag_mem = Mem(ICACHE_TAG_DEPTH, Vec(ICACHE_NUM_WAYS, UInt(Tag_Word.W)))

  val write_vec = VecInit.tabulate(ICACHE_NUM_WAYS)(i=>ic_tag_wren_q(i)&ic_tag_clken(i))
  tag_mem.write(ic_rw_addr_q, VecInit.tabulate(ICACHE_NUM_WAYS)(i=>ic_tag_wr_data), write_vec)

  val read_enable = VecInit.tabulate(ICACHE_NUM_WAYS)(i=>(!ic_tag_wren_q(i))&ic_tag_clken(i))

  val ic_tag_data_raw = (0 until ICACHE_NUM_WAYS).map(i=>Fill(Tag_Word,read_enable(i))&tag_mem.read(ic_rw_addr_q)(i))

  val w_tout = if(ICACHE_ECC) VecInit.tabulate(ICACHE_NUM_WAYS)(i=>Cat(ic_tag_data_raw(i)(25,21), ic_tag_data_raw(i)(31-ICACHE_TAG_LO,0)))
  else VecInit.tabulate(ICACHE_NUM_WAYS)(i=>Cat(ic_tag_data_raw(i)(21), ic_tag_data_raw(i)(31-ICACHE_TAG_LO,0)))

  val ic_tag_corrected_ecc_unc = Wire(Vec(ICACHE_NUM_WAYS, UInt(7.W)))
  val ic_tag_corrected_data_unc = Wire(Vec(ICACHE_NUM_WAYS, UInt(32.W)))
  val ic_tag_single_ecc_error = Wire(Vec(ICACHE_NUM_WAYS, UInt(1.W)))
  val ic_tag_double_ecc_error = Wire(Vec(ICACHE_NUM_WAYS, UInt(1.W)))
  for(i<- 0 until ICACHE_NUM_WAYS){
    val decoded_ecc = if(ICACHE_ECC) rvecc_decode(~io.dec_tlu_core_ecc_disable & ic_rd_en_ff, Cat(0.U(11.W),ic_tag_data_raw(i)(20,0)), Cat(0.U(2.W),ic_tag_data_raw(i)(25,21)), 1.U)
    else (0.U, 0.U, 0.U, 0.U)
    ic_tag_corrected_ecc_unc(i) := decoded_ecc._1
    ic_tag_corrected_data_unc(i) := decoded_ecc._2
    ic_tag_single_ecc_error(i):= decoded_ecc._3
    ic_tag_double_ecc_error(i) := decoded_ecc._4
  }

  val ic_tag_way_perr = if(ICACHE_ECC)ic_tag_single_ecc_error.reverse.reduce(Cat(_,_)) | ic_tag_double_ecc_error.reverse.reduce(Cat(_,_))
  else (0 until ICACHE_NUM_WAYS).map(i=>rveven_paritycheck(ic_tag_data_raw(i)(31-ICACHE_TAG_LO,0), ic_tag_data_raw(i)(21))).reverse.reduce(Cat(_,_))

  io.ictag_debug_rd_data := (0 until ICACHE_NUM_WAYS).map(i=> if(ICACHE_ECC) Fill(26, ic_debug_rd_way_en_ff(i))&ic_tag_data_raw(i) else Cat(0.U(4.W), Fill(22, ic_debug_rd_way_en_ff(i)),ic_tag_data_raw(i)(21,0))).reduce(_|_)
  io.ic_rd_hit := (0 until ICACHE_NUM_WAYS).map(i=>((w_tout(i)(31-ICACHE_TAG_LO,0)===ic_rw_addr_ff)&io.ic_tag_valid(i)).asUInt()).reverse.reduce(Cat(_,_))
  io.ic_tag_perr := (ic_tag_way_perr & io.ic_tag_valid).orR()
}


////////////////////////////////////////////////

class EL2_IC_DATA extends Module with el2_lib {
  val io = IO (new Bundle{
    val clk_override        = Input(Bool())
    val ic_rw_addr          = Input(UInt(ICACHE_INDEX_HI.W))
    val ic_wr_en            = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_rd_en            = Input(Bool())
    val ic_wr_data          = Input(Vec(ICACHE_NUM_WAYS, UInt(71.W)))
    val ic_rd_data          = Output(UInt(64.W))
    val ic_debug_wr_data    = Input(UInt(71.W))
    val ic_debug_rd_data    = Output(UInt(71.W))
    val ic_parerr           = Output(UInt(ICACHE_NUM_WAYS.W))
    val ic_eccerr           = Output(UInt(ICACHE_BANKS_WAY.W))
    val ic_debug_addr       = Input(UInt((ICACHE_INDEX_HI-3).W))
    val ic_debug_rd_en      = Input(Bool())
    val ic_debug_wr_en      = Input(Bool())
    val ic_debug_tag_array  = Input(Bool())
    val ic_debug_way        = Input(UInt(ICACHE_NUM_WAYS.W))
    val ic_premux_data      = Input(UInt(64.W))
    val ic_sel_premux_data  = Input(Bool())
    val ic_rd_hit           = Input(UInt(ICACHE_NUM_WAYS.W))
    val scan_mode           = Input(UInt(1.W))
  })

  val ic_debug_rd_way_en = Fill(ICACHE_NUM_WAYS, io.ic_debug_rd_en & !io.ic_debug_tag_array) & io.ic_debug_way
  val ic_debug_wr_way_en = Fill(ICACHE_NUM_WAYS, io.ic_debug_wr_en & !io.ic_debug_tag_array) & io.ic_debug_way

  val ic_bank_wr_data = Wire(Vec(ICACHE_BANKS_WAY,UInt(71.W)))
  val ic_rd_en_with_debug = WireInit(Bool(), 0.U)

  val ic_rw_addr_q = Mux((io.ic_debug_rd_en | io.ic_debug_wr_en).asBool, Cat(io.ic_debug_addr,0.U(2.W)), io.ic_rw_addr)

  val ic_rw_addr_q_inc = ic_rw_addr_q(ICACHE_TAG_LO-2,ICACHE_DATA_INDEX_LO-1) + 1.U
  val ic_b_sb_wren = (0 until ICACHE_NUM_WAYS).map(i=>
    io.ic_wr_en | ic_debug_wr_way_en & Fill(ICACHE_NUM_WAYS, io.ic_debug_addr(ICACHE_BANK_HI-3,ICACHE_BANK_LO-3)===i.U))
  val ic_debug_sel_sb = (0 until ICACHE_NUM_WAYS).map(i=> (io.ic_debug_addr(ICACHE_BANK_HI-3,ICACHE_BANK_LO-3)===i.U).asUInt).reverse.reduce(Cat(_,_))
  val ic_sb_wr_data = (0 until ICACHE_NUM_WAYS).map(i=> Mux((ic_debug_sel_sb(i)&io.ic_debug_wr_en).asBool, io.ic_debug_wr_data, ic_bank_wr_data(i)))
  val ic_b_rden = (0 until ICACHE_NUM_WAYS).map(i=>
    (Mux1H(Seq(!ic_rw_addr_q(ICACHE_BANK_HI-1).asBool -> (i.U === 0.U),
                            (ic_rw_addr_q(ICACHE_BANK_HI-1)).asBool -> ((ic_rw_addr_q(1,0)===3.U)&(i.U===0.U)),
                             ic_rw_addr_q(ICACHE_BANK_HI-1).asBool -> (i.U === 1.U),
                            (!ic_rw_addr_q(ICACHE_BANK_HI-1)).asBool -> ((ic_rw_addr_q(1,0)===3.U)&(i.U === 1.U)))) & ic_rd_en_with_debug).asUInt).reverse.reduce(Cat(_,_))
  val ic_b_sb_rden = (0 until ic_b_rden.getWidth).map(i=>Fill(ICACHE_NUM_WAYS, ic_b_rden(i)))
  val ic_bank_way_clken = (0 until ICACHE_BANKS_WAY).map(i=>(0 until ICACHE_NUM_WAYS).map(j=>
    (ic_b_sb_rden(i)(j) | io.clk_override | ic_b_sb_wren(i)(j)).asUInt).reduce(Cat(_,_)))

  ic_rd_en_with_debug := io.ic_rd_en | io.ic_debug_rd_en & (!io.ic_wr_en.orR)

  val ic_rw_addr_wrap = ic_rw_addr_q(ICACHE_BANK_HI-1) & (ic_rw_addr_q(1,0) === 3.U) & ic_rd_en_with_debug & !(io.ic_wr_en.orR)

  val ic_rw_addr_bank_q = VecInit(Mux((!ic_rw_addr_wrap).asBool,ic_rw_addr_q(ICACHE_INDEX_HI-1,ICACHE_DATA_INDEX_LO-1),
    Cat(ic_rw_addr_q(ICACHE_INDEX_HI-1, ICACHE_TAG_INDEX_LO-1) , ic_rw_addr_q_inc(ICACHE_TAG_INDEX_LO-2,ICACHE_DATA_INDEX_LO-1))),
    ic_rw_addr_q(ICACHE_INDEX_HI-1,ICACHE_DATA_INDEX_LO-1))

  val ic_b_rden_ff = RegNext(ic_b_rden, 0.U)
  val ic_rw_addr_ff = RegNext(ic_rw_addr_q(ICACHE_TAG_INDEX_LO-2,0), 0.U)
  val ic_debug_rd_way_en_ff = RegNext(ic_debug_rd_way_en, 0.U)
  val ic_debug_rd_en_ff = RegNext(io.ic_debug_rd_en, 0.U)

  val ic_cacheline_wrap_ff = ic_rw_addr_ff(ICACHE_TAG_INDEX_LO-2,ICACHE_BANK_LO-1) === Fill(ICACHE_TAG_INDEX_LO-ICACHE_BANK_LO, 1.U)

//////////////////////////////////////////// Memory stated
  val (data_mem_word, tag_mem_word, ecc_offset, tag_word) = DATA_MEM_LINE
  val wb_dout = Wire(Vec(ICACHE_BANKS_WAY,Vec(ICACHE_NUM_WAYS, UInt(data_mem_word.W))))
  val data_mem = Mem(ICACHE_DATA_DEPTH, Vec(ICACHE_BANKS_WAY,Vec(ICACHE_NUM_WAYS, UInt(data_mem_word.W))))
  for(i<-0 until ICACHE_NUM_WAYS; k<-0 until ICACHE_BANKS_WAY){
    wb_dout(i)(k) := 0.U
    val WE = if(ICACHE_WAYPACK) ic_b_sb_wren(k).orR else ic_b_sb_wren(k)(i)
    val ME = if(ICACHE_WAYPACK) ic_bank_way_clken(k).orR else ic_bank_way_clken(k)(i)
    when((ic_b_sb_wren(k)(i) & ic_bank_way_clken(k)(i)).asBool){
      data_mem(ic_rw_addr_bank_q(k))(k)(i) := ic_sb_wr_data(k)
    }.elsewhen((!ic_b_sb_wren(k)(i)&ic_bank_way_clken(k)(i)).asBool){
      wb_dout(i)(k) := data_mem(ic_rw_addr_bank_q(k))(k)(i)
    }
  }
  val ic_rd_hit_q = Mux(ic_debug_rd_en_ff.asBool, ic_debug_rd_way_en_ff, io.ic_rd_hit)
  ic_bank_wr_data := (0 until ICACHE_BANKS_WAY).map(io.ic_wr_data(_))

  val wb_dout_way_pre = (0 until ICACHE_BANKS_WAY).map(i=>Cat(
    Mux1H((0 until ICACHE_BANKS_WAY).map(j=>(ic_rw_addr_ff(ICACHE_BANK_HI-1, ICACHE_BANK_LO-1)===j.U).asBool->wb_dout(i)(j))),
    Mux1H((0 until ICACHE_BANKS_WAY).map(j=>(ic_rw_addr_ff(ICACHE_BANK_HI-1, ICACHE_BANK_LO-1)===(j.U-1.U)).asBool->wb_dout(i)(j)))))

  val wb_dout_way = (0 until ICACHE_NUM_WAYS).map(i=>Mux1H(Seq((ic_rw_addr_ff(1,0)===0.U).asBool->wb_dout_way_pre(i)(63,0),
    (ic_rw_addr_ff(1,0)===1.U).asBool->Cat(wb_dout_way_pre(i)(data_mem_word+15,data_mem_word),wb_dout_way_pre(i)(63,16)),
    (ic_rw_addr_ff(1,0)===2.U).asBool->Cat(wb_dout_way_pre(i)(data_mem_word+31,data_mem_word),wb_dout_way_pre(i)(63,32)),
    (ic_rw_addr_ff(1,0)===3.U).asBool->Cat(wb_dout_way_pre(i)(data_mem_word+47,data_mem_word),wb_dout_way_pre(i)(63,48)))))

  val wb_dout_way_with_premux = (0 until ICACHE_NUM_WAYS).map(i=>Mux(io.ic_sel_premux_data.asBool,io.ic_premux_data, wb_dout_way(i)))

  io.ic_rd_data := Mux1H((0 until ICACHE_NUM_WAYS).map(i=>(ic_rd_hit_q(i) | io.ic_sel_premux_data).asBool->wb_dout_way_with_premux(i)))
  io.ic_debug_rd_data := Mux1H((0 until ICACHE_NUM_WAYS).map(i=>ic_rd_hit_q(i).asBool->wb_dout_way_pre(i)(70,0)))
  val wb_dout_ecc = Mux1H((0 until ICACHE_NUM_WAYS).map(i=>ic_rd_hit_q(i).asBool->wb_dout_way_pre(i)))

  val bank_check_en = for(i<-0 until ICACHE_BANKS_WAY) yield io.ic_rd_hit.orR & ((i.U==0.U).asBool | (!ic_cacheline_wrap_ff & (ic_b_rden_ff(ICACHE_BANKS_WAY-1,0) === Fill(ICACHE_BANKS_WAY,1.U))))
  val wb_dout_ecc_bank = (0 until ICACHE_BANKS_WAY).map(i=> wb_dout_ecc((data_mem_word*i)+data_mem_word-1,data_mem_word*i))

  // TODO: RVECC
  io.ic_eccerr := (0 until ICACHE_NUM_WAYS).map(i=>rvecc_decode_64(bank_check_en(i),wb_dout_ecc_bank(i)(63,0),wb_dout_ecc_bank(i)(70,64)).asUInt).reverse.reduce(Cat(_,_))
  val ic_parerr_bank = Wire(Vec(ICACHE_NUM_WAYS, Vec(4, UInt(1.W))))
  for(i<-0 until ICACHE_NUM_WAYS; j<-0 until 4){ic_parerr_bank(i)(j):=rveven_paritycheck(wb_dout_ecc_bank(i)(16*(j+1)-1, 16*j), wb_dout_ecc_bank(i)(64+j))}

  io.ic_parerr := Cat(ic_parerr_bank(0).reduce(_|_) & bank_check_en(0), ic_parerr_bank(1).reduce(_|_) & bank_check_en(1))
}

object ifu_ic extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_ic_mem()))
}