package ifu
import chisel3._
import chisel3.util._
import lib._
import scala.math.pow

class el2_ifu_iccm_mem extends Module with el2_lib {
  val io = IO(new Bundle{
    val clk_override = Input(Bool())
    val iccm_wren = Input(Bool())
    val iccm_rden = Input(Bool())
    val iccm_rw_addr = Input(UInt((ICCM_BITS-1).W))
    val iccm_buf_correct_ecc = Input(Bool())
    val iccm_correction_state = Input(Bool())
    val iccm_wr_size = Input(UInt(3.W))
    val iccm_wr_data = Input(UInt(78.W))
    val iccm_rd_data = Output(UInt(64.W))
    val iccm_rd_data_ecc = Output(UInt(78.W))
    val scan_mode = Input(Bool())
    val iccm_bank_wr_data = Output(Vec(ICCM_NUM_BANKS, UInt(39.W)))
  })
  io.iccm_rd_data := 0.U
  io.iccm_rd_data_ecc := 0.U
  val addr_inc = Mux((io.iccm_wr_size(1,0)===3.U).asBool, 2.U(2.W), 1.U(2.W))
  val addr_bank_inc = io.iccm_rw_addr(ICCM_BITS-2,0) + addr_inc

  val iccm_bank_wr_data_vec = Wire(Vec(ICCM_NUM_BANKS, UInt(39.W)))
  for(i<- 0 until ICCM_NUM_BANKS/2){
    iccm_bank_wr_data_vec(2*i) := io.iccm_wr_data(38,0)
    iccm_bank_wr_data_vec((2*i)+1) := io.iccm_wr_data(77,39)
  }

  val wren_bank = (0 until ICCM_NUM_BANKS).map(i=> io.iccm_wren&((io.iccm_rw_addr(ICCM_BANK_HI-1,1)===i.U)|(addr_bank_inc(ICCM_BANK_HI-1,1)===i.U)))
  val iccm_bank_wr_data = iccm_bank_wr_data_vec
  io.iccm_bank_wr_data := iccm_bank_wr_data
  val rden_bank = (0 until ICCM_NUM_BANKS).map(i=> io.iccm_rden&(io.iccm_rw_addr(ICCM_BANK_HI-1,1)===i.U)|(addr_bank_inc(ICCM_BANK_HI-1,1)===i.U))
  val iccm_clken = for(i<- 0 until ICCM_NUM_BANKS) yield  wren_bank(i) | rden_bank(i) | io.clk_override
  val addr_bank = (0 until ICCM_NUM_BANKS).map(i=> Mux(wren_bank(i).asBool, io.iccm_rw_addr(ICCM_BITS-2, ICCM_BANK_INDEX_LO-1),
    Mux((addr_bank_inc(ICCM_BANK_HI-1,1)===i.U),addr_bank_inc(ICCM_BITS-2,ICCM_BANK_INDEX_LO-1),io.iccm_rw_addr(ICCM_BITS-2,ICCM_BANK_INDEX_LO-1))))

  val iccm_mem = Mem(pow(2, ICCM_INDEX_BITS).intValue, Vec(ICCM_NUM_BANKS, UInt(39.W)))

  val write_vec = VecInit.tabulate(ICCM_NUM_BANKS)(i=>iccm_clken(i)&wren_bank(i))
  val read_enable = VecInit.tabulate(ICCM_NUM_BANKS)(i=>iccm_clken(i)&(!wren_bank(i)))
  //io.test := addr_bank
  val iccm_bank_dout = Wire(Vec(ICCM_NUM_BANKS, UInt(39.W)))
  val inter = Wire(Vec(ICCM_NUM_BANKS, UInt(39.W)))
  for(i<-0 until ICCM_NUM_BANKS) iccm_mem.write(addr_bank(i), iccm_bank_wr_data, write_vec)
  inter := iccm_mem.read(addr_bank(0))
  for(i<-0 until ICCM_NUM_BANKS) iccm_bank_dout(i) := RegNext(inter(i))

  val redundant_valid = WireInit(UInt(2.W), init = 0.U)
  val redundant_address = Wire(Vec(2, UInt((ICCM_BITS-2).W)))
  redundant_address := (0 until 2).map(i=>0.U)

  val sel_red1 = (0 until ICCM_NUM_BANKS).map(i=> (redundant_valid(1) & ((io.iccm_rw_addr(ICCM_BITS-2,1)===redundant_address(1)(ICCM_BITS-3,0)) & (io.iccm_rw_addr(2,1) === i.U)) |
      ((addr_bank_inc(ICCM_BITS-2,1)===redundant_address(1)(ICCM_BITS-3,0)) & (addr_bank_inc(2,1) === i.U))).asUInt).reverse.reduce(Cat(_,_))
  val sel_red0 = (0 until ICCM_NUM_BANKS).map(i=> (redundant_valid(0) & ((io.iccm_rw_addr(ICCM_BITS-2,1)===redundant_address(0)(ICCM_BITS-3,0)) & (io.iccm_rw_addr(2,1) === i.U)) |
      ((addr_bank_inc(ICCM_BITS-2,1)===redundant_address(0)(ICCM_BITS-3,0)) & (addr_bank_inc(2,1) === i.U))).asUInt).reverse.reduce(Cat(_,_))

  val sel_red0_q = RegNext(sel_red0, init = 0.U)
  val sel_red1_q = RegNext(sel_red1, init = 0.U)
  val redundant_data = Wire(Vec(2, UInt(39.W)))
  redundant_data := (0 until 2).map(i=>0.U)
  val iccm_bank_dout_fn = (0 until ICCM_NUM_BANKS).map(i=>
                          Mux1H(Seq(sel_red1_q(i).asBool->redundant_data(1),
                                    sel_red0_q(i).asBool->redundant_data(0),
                                  (~sel_red0_q(i) & ~sel_red1_q(i)).asBool -> iccm_bank_dout(i))))
  val redundant_lru = WireInit(Bool(), init = 0.U)
  val r0_addr_en = !redundant_lru & io.iccm_buf_correct_ecc
  val r1_addr_en = redundant_lru  & io.iccm_buf_correct_ecc
  val redundant_lru_en = io.iccm_buf_correct_ecc | ((sel_red0.orR | sel_red1.orR) & io.iccm_rden & io.iccm_correction_state)
  val redundant_lru_in = Mux(io.iccm_buf_correct_ecc, !redundant_lru, Mux(sel_red0.orR, 1.U, 0.U))
  redundant_lru := RegEnable(redundant_lru_in, 0.U, redundant_lru_en)
  redundant_address(0) := RegEnable(io.iccm_rw_addr(ICCM_BITS-2,1), 0.U, r0_addr_en)
  redundant_address(1) := RegEnable(io.iccm_rw_addr(ICCM_BITS-2,1), 0.U, r1_addr_en.asBool)
  redundant_valid := Cat(RegEnable(1.U, 0.U, r1_addr_en.asBool),RegEnable(1.U, 0.U, r0_addr_en))

  val redundant_data0_en = ((io.iccm_rw_addr(ICCM_BITS-2,2) === redundant_address(0)(ICCM_BITS-3,1)) &
    ((io.iccm_rw_addr(1) & redundant_address(0)(0))| (io.iccm_wr_size(1,0)===3.U)) & redundant_valid(0) & io.iccm_wren) |
    (!redundant_lru & io.iccm_buf_correct_ecc)
  val redundant_data0_in = Mux(((io.iccm_rw_addr(1)&redundant_address(0)(0)) |(redundant_address(0)(0) & (io.iccm_wr_size(1,0)===3.U))).asBool,
    io.iccm_wr_data(77,39), io.iccm_wr_data(38,0))
  redundant_data(0) := RegEnable(redundant_data0_in, 0.U, redundant_data0_en.asBool)

  val redundant_data1_en = ((io.iccm_rw_addr(ICCM_BITS-2,2) === redundant_address(1)(ICCM_BITS-3,1)) &
    ((io.iccm_rw_addr(1) & redundant_address(1)(0))| (io.iccm_wr_size(1,0)===3.U)) & redundant_valid(1) & io.iccm_wren) |
    (!redundant_lru & io.iccm_buf_correct_ecc)
  val redundant_data1_in = Mux(((io.iccm_rw_addr(1)&redundant_address(1)(0)) |(redundant_address(1)(0) & (io.iccm_wr_size(1,0)===3.U))).asBool,
    io.iccm_wr_data(77,39), io.iccm_wr_data(38,0))
  redundant_data(1) := RegEnable(redundant_data1_in, 0.U, redundant_data1_en.asBool)

  val iccm_rd_addr_lo_q = RegNext(io.iccm_rw_addr(ICCM_BANK_HI-1,0), 0.U)
  val iccm_rd_addr_hi_q = RegNext(addr_bank_inc(ICCM_BANK_HI-1,1), 0.U)

  val iccm_rd_data_pre = Cat(Mux1H((0 until ICCM_NUM_BANKS).map(i=>(iccm_rd_addr_hi_q===i.U)->iccm_bank_dout_fn(i)(31,0))),
  Mux1H((0 until ICCM_NUM_BANKS).map(i=>(iccm_rd_addr_lo_q(ICCM_BANK_HI-2,0)===i.U)->iccm_bank_dout_fn(i)(31,0))))
  io.iccm_rd_data := Mux(iccm_rd_addr_lo_q(0).asBool(),Cat(Fill(16,0.U),iccm_rd_data_pre(63,16)) ,iccm_rd_data_pre)
  io.iccm_rd_data_ecc :=Cat(Mux1H((0 until ICCM_NUM_BANKS).map(i=>(iccm_rd_addr_hi_q===i.U)->iccm_bank_dout_fn(i))),
    Mux1H((0 until ICCM_NUM_BANKS).map(i=>(iccm_rd_addr_lo_q(ICCM_BANK_HI-2,0)===i.U)->iccm_bank_dout_fn(i))))
}
object ifu_iccm extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_iccm_mem()))
}