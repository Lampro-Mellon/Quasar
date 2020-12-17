package dec

import chisel3._
import chisel3.util._
import exu._
import include._
import lib._

class dec_ib_ctl_IO extends Bundle with param{
  val ifu_ib = Flipped(new aln_ib)
  val ib_exu = Flipped(new ib_exu)
  val dbg_ib = new dbg_ib
  val dec_ib0_valid_d       =Output(UInt(1.W))   // ib0 valid
  val dec_i0_icaf_type_d    =Output(UInt(2.W)) // i0 instruction access fault type
  val dec_i0_instr_d        =Output(UInt(32.W)) // i0 inst at decode
  val dec_i0_pc4_d          =Output(UInt(1.W))  // i0 is 4B inst else 2B
  val dec_i0_brp            =Valid(new br_pkt_t) // i0 branch packet at decode
  val dec_i0_bp_index       =Output(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))   // i0 branch index
  val dec_i0_bp_fghr        =Output(UInt(BHT_GHR_SIZE.W))   // BP FGHR
  val dec_i0_bp_btag        =Output(UInt(BTB_BTAG_SIZE.W))  // BP tag
  val dec_i0_icaf_d         =Output(UInt(1.W))  // i0 instruction access fault at decode
  val dec_i0_icaf_f1_d      =Output(UInt(1.W))  // i0 instruction access fault at decode for f1 fetch group
  val dec_i0_dbecc_d        =Output(UInt(1.W))  // i0 double-bit error at decode
  val dec_debug_fence_d     =Output(UInt(1.W))  // debug fence inst
}

class dec_ib_ctl extends Module with param{
  val io=IO(new dec_ib_ctl_IO)
  io.dec_i0_icaf_f1_d         :=io.ifu_ib.ifu_i0_icaf_f1
  io.dec_i0_dbecc_d           :=io.ifu_ib.ifu_i0_dbecc
  io.dec_i0_icaf_d            :=io.ifu_ib.ifu_i0_icaf
  io.ib_exu.dec_i0_pc_d       :=io.ifu_ib.ifu_i0_pc
  io.dec_i0_pc4_d             :=io.ifu_ib.ifu_i0_pc4
  io.dec_i0_icaf_type_d       :=io.ifu_ib.ifu_i0_icaf_type
  io.dec_i0_brp               :=io.ifu_ib.i0_brp
  io.dec_i0_bp_index          :=io.ifu_ib.ifu_i0_bp_index
  io.dec_i0_bp_fghr           :=io.ifu_ib.ifu_i0_bp_fghr
  io.dec_i0_bp_btag           :=io.ifu_ib.ifu_i0_bp_btag

  // GPR accesses
  // put reg to read on rs1
  // read ->   or %x0,  %reg,%x0      {000000000000,reg[4:0],110000000110011}
  // put write date on rs1
  // write ->  or %reg, %x0, %x0      {00000000000000000110,reg[4:0],0110011}
  // CSR accesses
  // csr is of form rd, csr, rs1
  // read  -> csrrs %x0, %csr, %x0     {csr[11:0],00000010000001110011}
  // put write data on rs1
  // write -> csrrw %x0, %csr, %x0     {csr[11:0],00000001000001110011}


  val debug_valid     =io.dbg_ib.dbg_cmd_valid & (io.dbg_ib.dbg_cmd_type =/= 2.U)
  val debug_read      =debug_valid & !io.dbg_ib.dbg_cmd_write
  val debug_write     =debug_valid &  io.dbg_ib.dbg_cmd_write

  val debug_read_gpr  = debug_read  & (io.dbg_ib.dbg_cmd_type===0.U)
  val debug_write_gpr = debug_write & (io.dbg_ib.dbg_cmd_type===0.U)
  val debug_read_csr  = debug_read  & (io.dbg_ib.dbg_cmd_type===1.U)
  val debug_write_csr = debug_write & (io.dbg_ib.dbg_cmd_type===1.U)

  val dreg            = io.dbg_ib.dbg_cmd_addr(4,0)
  val dcsr            = io.dbg_ib.dbg_cmd_addr(11,0)

  val ib0_debug_in    =Mux1H(Seq(
		  debug_read_gpr.asBool  	->  Cat(Fill(12,0.U(1.W)),dreg,"b110000000110011".U),
			debug_write_gpr.asBool 	->  Cat("b00000000000000000110".U(20.W),dreg,"b0110011".U(7.W)),
			debug_read_csr.asBool	->  Cat(dcsr,"b00000010000001110011".U(20.W)),
			debug_write_csr.asBool 	->  Cat(dcsr,"b00000001000001110011".U(20.W))
			))

  // machine is in halted state, pipe empty, write will always happen next cycle
  io.ib_exu.dec_debug_wdata_rs1_d := debug_write_gpr | debug_write_csr

  // special fence csr for use only in debug mode
  io.dec_debug_fence_d := debug_write_csr & (dcsr === 0x7C4.U)

  io.dec_ib0_valid_d := io.ifu_ib.ifu_i0_valid | debug_valid
  io.dec_i0_instr_d  := Mux(debug_valid.asBool,ib0_debug_in,io.ifu_ib.ifu_i0_instr)


}
