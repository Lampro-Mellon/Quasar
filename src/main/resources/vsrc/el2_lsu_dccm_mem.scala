package lsu
import include._
import lib._
import snapshot._
import scala.math._
import chisel3._
import chisel3.util._
class el2_lsu_dccm_mem extends Module  {
  val io = IO(new Bundle{
    //implicit clk and rst_l
    val clk_override    = Input(UInt(1.W))
    val scan_mode       = Input(UInt(1.W))
    val dccm_wren       = Input(UInt(1.W))
    val dccm_rden       = Input(UInt(1.W))
    val dccm_wr_addr_lo = Input(UInt(pt1.DCCM_BITS.W))
    val dccm_wr_addr_hi = Input(UInt(pt1.DCCM_BITS.W))
    val dccm_rd_addr_lo = Input(UInt(pt1.DCCM_BITS.W))
    val dccm_rd_addr_hi = Input(UInt(pt1.DCCM_BITS.W))
    val dccm_wr_data_lo = Input(UInt(pt1.DCCM_FDATA_WIDTH.W))
    val dccm_wr_data_hi = Input(UInt(pt1.DCCM_FDATA_WIDTH.W))
    val dccm_rd_data_lo = Output(UInt(pt1.DCCM_FDATA_WIDTH.W))
    val dccm_rd_data_hi = Output(UInt(pt1.DCCM_FDATA_WIDTH.W))
  })
  //DCCM_BYTE_WIDTH  = 4
  //DCCM_WIDTH_BITS  = 2

  //DCCM_NUM_BANKS   = 4
  //DCCM_BANK_BITS   = 2

  //DCCM_BITS        = 16
  //DCCM_FDATA_WIDTH = 39

  //DCCM_SIZE        = 64

  //DCCM_INDEX_BITS  = 12
  //DCCM_INDEX_DEPTH = 4K


  val DCCM_WIDTH_BITS  = log2Ceil(pt1.DCCM_BYTE_WIDTH)
  val DCCM_INDEX_BITS  = pt1.DCCM_BITS - pt1.DCCM_BANK_BITS - pt1.DCCM_WIDTH_BITS
  val DCCM_INDEX_DEPTH = (pt1.DCCM_SIZE*1024)/(pt1.DCCM_BYTE_WIDTH*pt1.DCCM_NUM_BANKS)

  val addr_bank        = Wire(Vec(pt1.DCCM_NUM_BANKS,UInt((pt1.DCCM_BITS-pt1.DCCM_BANK_BITS+2).W))) //[15:4] => [11:0] 12 bits per bank =>

  //val rd_addr_even     = Wire(UInt((pt1.DCCM_BITS-(pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS)).W)) //[15:4]
  //val rd_addr_odd      = Wire(UInt((pt1.DCCM_BITS-(pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS)).W)) //[15:4]

  //  val dccm_bank_dout   = Wire(Vec(pt1.DCCM_NUM_BANKS,UInt(pt1.DCCM_FDATA_WIDTH.W))) // 3:0, 38:0
  val wr_data_bank     = Wire(Vec(pt1.DCCM_NUM_BANKS,UInt(pt1.DCCM_FDATA_WIDTH.W))) // 3:0, 38:0

  val dccm_rd_addr_lo_q = RegNext(io.dccm_rd_addr_lo(DCCM_WIDTH_BITS+pt1.DCCM_BANK_BITS-1,DCCM_WIDTH_BITS),0.U) //[3:2] => [1:0]
  val dccm_rd_addr_hi_q = RegNext(io.dccm_rd_addr_hi(DCCM_WIDTH_BITS+pt1.DCCM_BANK_BITS-1,DCCM_WIDTH_BITS),0.U)


  //2+2:2 => 4:2rd_unaligned
  val rd_unaligned     = io.dccm_rd_addr_lo(pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1,DCCM_WIDTH_BITS) =/= io.dccm_rd_addr_hi(pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1,DCCM_WIDTH_BITS)
  val wr_unaligned     = io.dccm_wr_addr_lo(pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1,DCCM_WIDTH_BITS) =/= io.dccm_wr_addr_hi(pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1,DCCM_WIDTH_BITS)



  val wren_bank  = Reverse(Cat(VecInit.tabulate(pt1.DCCM_NUM_BANKS)(i=> io.dccm_wren & ((io.dccm_wr_addr_hi(pt1.DCCM_BANK_BITS+1,2) === i.U) | (io.dccm_wr_addr_lo(pt1.DCCM_BANK_BITS+1,2) === i.U)).asUInt)))
  val rden_bank  = Reverse(Cat(VecInit.tabulate(pt1.DCCM_NUM_BANKS)(i=> io.dccm_rden & ((io.dccm_rd_addr_hi(pt1.DCCM_BANK_BITS+1,2) === i.U) | (io.dccm_rd_addr_lo(pt1.DCCM_BANK_BITS+1,2) === i.U)).asUInt)))
  val dccm_clken =  Reverse(Cat(VecInit.tabulate(pt1.DCCM_NUM_BANKS)(i=> wren_bank(i) | rden_bank(i) | io.clk_override)))


  //[15:4] => [11:0] 12 bits per bank
  addr_bank := VecInit.tabulate(pt1.DCCM_NUM_BANKS)(i=>  Mux(wren_bank(i).asBool,
    Mux(((io.dccm_wr_addr_hi(pt1.DCCM_BANK_BITS+1,2) === i.U) & wr_unaligned),
      io.dccm_wr_addr_hi(DCCM_INDEX_BITS+pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1, pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS),
      io.dccm_wr_addr_lo(DCCM_INDEX_BITS+pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1, pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS)),

    Mux(((io.dccm_rd_addr_hi(pt1.DCCM_BANK_BITS+1,2) === i.U) & rd_unaligned),
      io.dccm_rd_addr_hi(DCCM_INDEX_BITS+pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1, pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS),
      io.dccm_rd_addr_lo(DCCM_INDEX_BITS+pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS-1, pt1.DCCM_BANK_BITS+DCCM_WIDTH_BITS))))

  wr_data_bank := VecInit.tabulate(pt1.DCCM_NUM_BANKS)(i=>
    Mux(((io.dccm_wr_addr_hi(pt1.DCCM_BANK_BITS+1,2) === i.U) & wr_unaligned),
      io.dccm_wr_data_hi(pt1.DCCM_FDATA_WIDTH-1,0),
      io.dccm_wr_data_lo(pt1.DCCM_FDATA_WIDTH-1,0)))




  val mem =SyncReadMem(DCCM_INDEX_DEPTH, Vec(pt1.DCCM_NUM_BANKS, UInt(39.W)))
  // Create one write port and one read port
  (0 to pt1.DCCM_NUM_BANKS-1).foreach(i =>
    when(wren_bank(i)& dccm_clken(i)){
      mem.write(addr_bank(i), wr_data_bank)})

  val dccm_bank_dout = VecInit.tabulate(pt1.DCCM_NUM_BANKS)(i => mem.read(addr_bank(i), ~wren_bank(i)& dccm_clken(i)))//ME && ~WE

  io.dccm_rd_data_lo  := dccm_bank_dout(dccm_rd_addr_lo_q).asUInt
  io.dccm_rd_data_hi  := dccm_bank_dout(dccm_rd_addr_hi_q).asUInt
}

object DCCM extends App{
  println("Generate Verilog")
  chisel3.Driver.execute(args, ()=> new el2_lsu_dccm_mem)
}
