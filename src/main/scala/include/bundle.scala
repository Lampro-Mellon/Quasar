package include
import chisel3._
import chisel3.util._
import exu._
import ifu._
import dec._
import lsu._
import lib._
class dec_pic extends Bundle{
  val pic_claimid               = Input(UInt(8.W))      // PIC claimid
  val pic_pl                    = Input(UInt(4.W))      // PIC priv level
  val mhwakeup                  = Input(Bool())      // High priority wakeup
  val dec_tlu_meicurpl          = Output(UInt(4.W))     // to PIC, Current priv level
  val dec_tlu_meipt             = Output(UInt(4.W))     // to PIC
  val mexintpend               = Input(UInt(1.W)) // external interrupt pending
}

class dec_dma extends Bundle{
  val dctl_dma = new dctl_dma()
  val tlu_dma  = new tlu_dma()
}
class dctl_dma extends Bundle{
  val dma_dccm_stall_any            = Input(Bool())            // stall any load/store at decode, pmu event
}
class tlu_dma extends Bundle{
  val dma_pmu_dccm_read             = Input(Bool())      // DMA DCCM read
  val dma_pmu_dccm_write            = Input(Bool())      // DMA DCCM write
  val dma_pmu_any_read              = Input(Bool())      // DMA read
  val dma_pmu_any_write             = Input(Bool())      // DMA write
  val dec_tlu_dma_qos_prty      = Output(UInt(3.W))       // DMA QoS priority coming from MFDC [18:16]
  val dma_dccm_stall_any            = Input(Bool())            // stall any load/store at decode, pmu event
  val dma_iccm_stall_any            = Input(Bool())            // iccm stalled, pmu event
}

class dec_bp extends Bundle{
  val dec_tlu_br0_r_pkt = Flipped(Valid(new br_tlu_pkt_t))
//  val dec_tlu_flush_lower_wb = Input(Bool())
  val dec_tlu_flush_leak_one_wb = Input(Bool())
  val dec_tlu_bpred_disable = Input(Bool())
}

class dec_ifc extends Bundle{
  val dec_tlu_flush_noredir_wb = Input(Bool())
  val dec_tlu_mrac_ff = Input(UInt(32.W))
  val ifu_pmu_fetch_stall = Output(Bool())
}
class axi_channels(val BUS_TAG :Int=3) extends Bundle with lib{
  val aw = Decoupled(new write_addr(BUS_TAG))
  val w = Decoupled(new write_data())
  val b = Flipped(Decoupled(new write_resp(BUS_TAG)))
  val ar = Decoupled(new read_addr(BUS_TAG))
  val r = Flipped(Decoupled(new read_data(BUS_TAG)))
}
class read_addr(val TAG : Int=3) extends Bundle with lib { // read_address
  val id = UInt(TAG.W)
  val addr = UInt(32.W)
  val region = UInt(4.W)
  val len = UInt(8.W)
  val size = UInt(3.W)
  val burst = UInt(2.W)
  val lock = Bool()
  val cache = UInt(4.W)
  val prot = UInt(3.W)
  val qos = UInt(4.W)
}
class read_data(val TAG : Int=3) extends Bundle with lib {   // read_data
  val id = UInt(TAG.W)
  val data = UInt(64.W)
  val resp = UInt(2.W)
  val last = Bool()
}
class write_addr(val TAG : Int=3) extends Bundle with lib { // write_address
  val id = UInt(TAG.W)
  val addr = UInt(32.W)
  val region = UInt(4.W)
  val len = UInt(8.W)
  val size = UInt(3.W)
  val burst = UInt(2.W)
  val lock = Bool()
  val cache = UInt(4.W)
  val prot = UInt(3.W)
  val qos = UInt(4.W)
}
class write_data extends Bundle with lib{ // write_data
  val data = UInt(64.W)
  val strb = UInt(8.W)
  val last = Bool()
}
class write_resp(val TAG : Int=3) extends Bundle with lib{ // write_response
  val resp = UInt(2.W)
  val id = UInt(TAG.W)
}

class dec_mem_ctrl extends Bundle with lib{
//  val dec_tlu_flush_lower_wb = Input(Bool())
  val dec_tlu_flush_err_wb = Input(Bool())
  val dec_tlu_i0_commit_cmt = Input(Bool())
  val dec_tlu_force_halt = Input(Bool())
  val dec_tlu_fence_i_wb = Input(Bool())
  val dec_tlu_ic_diag_pkt = Input(new cache_debug_pkt_t)
  val dec_tlu_core_ecc_disable = Input(Bool())
  val ifu_pmu_ic_miss = Output(Bool())
  val ifu_pmu_ic_hit = Output(Bool())
  val ifu_pmu_bus_error = Output(Bool())
  val ifu_pmu_bus_busy = Output(Bool())
  val ifu_pmu_bus_trxn = Output(Bool())
  val ifu_ic_error_start = Output(Bool())
  val ifu_iccm_rd_ecc_single_err = Output(Bool())
  val ifu_ic_debug_rd_data = Output(UInt(71.W))
  val ifu_ic_debug_rd_data_valid = Output(Bool())
  val ifu_miss_state_idle = Output(Bool())
}

class lsu_pic extends Bundle {
  val picm_wren                         = Output(Bool())
  val picm_rden                         = Output(Bool())
  val picm_mken                         = Output(Bool())
  val picm_rdaddr                       = Output(UInt(32.W))
  val picm_wraddr                       = Output(UInt(32.W))
  val picm_wr_data                      = Output(UInt(32.W))
  val picm_rd_data                      = Input(UInt(32.W))
}

class lsu_dma extends Bundle{
  val dma_lsc_ctl  = new dma_lsc_ctl
  val dma_dccm_ctl = new dma_dccm_ctl
  val dccm_ready   = Output(Bool())
  val dma_mem_tag  = Input(UInt(3.W))

}

class dma_lsc_ctl extends Bundle {
  val dma_dccm_req                      = Input(Bool())
  val dma_mem_addr                      = Input(UInt(32.W))
  val dma_mem_sz                        = Input(UInt(3.W))
  val dma_mem_write                     = Input(Bool())
  val dma_mem_wdata                     = Input(UInt(64.W))
}
class dma_dccm_ctl extends Bundle{
  val dma_mem_addr                      = Input(UInt(32.W))
  val dma_mem_wdata                     = Input(UInt(64.W))
  val dccm_dma_rvalid                   = Output(Bool())
  val dccm_dma_ecc_error                = Output(Bool())
  val dccm_dma_rtag                     = Output(UInt(3.W))
  val dccm_dma_rdata                    = Output(UInt(64.W))
}
class lsu_exu extends Bundle{
  val exu_lsu_rs1_d                     = Input(UInt(32.W))
  val exu_lsu_rs2_d                     = Input(UInt(32.W))
}
class lsu_dec extends Bundle {
  val tlu_busbuff = new tlu_busbuff
  val dctl_busbuff = new dctl_busbuff

}
class tlu_busbuff extends Bundle {
  val lsu_pmu_bus_trxn                  = Output(Bool())
  val lsu_pmu_bus_misaligned            = Output(Bool())
  val lsu_pmu_bus_error                 = Output(Bool())
  val lsu_pmu_bus_busy                  = Output(Bool())
  val dec_tlu_external_ldfwd_disable    = Input(Bool())
  val dec_tlu_wb_coalescing_disable     = Input(Bool())
  val dec_tlu_sideeffect_posted_disable = Input(Bool())
  val lsu_imprecise_error_load_any      = Output(Bool())
  val lsu_imprecise_error_store_any     = Output(Bool())
  val lsu_imprecise_error_addr_any      = Output(UInt(32.W))

}
class dctl_busbuff extends Bundle with lib{
  val lsu_nonblock_load_valid_m         = Output(Bool())
  val lsu_nonblock_load_tag_m           = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
  val lsu_nonblock_load_inv_r           = Output(Bool())
  val lsu_nonblock_load_inv_tag_r       = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
  val lsu_nonblock_load_data_valid      = Output(Bool())
  val lsu_nonblock_load_data_error      = Output(Bool())
  val lsu_nonblock_load_data_tag        = Output(UInt(LSU_NUM_NBLOAD_WIDTH.W))
  val lsu_nonblock_load_data            = Output(UInt(32.W))
}
class lsu_tlu extends Bundle {
  val lsu_pmu_load_external_m           = Output(Bool())
  val lsu_pmu_store_external_m          = Output(Bool())
}
class iccm_mem extends Bundle with lib {
  val rw_addr = Output(UInt((ICCM_BITS-1).W))
  val buf_correct_ecc = Output(Bool())
  val correction_state = Output(Bool())
  val wren = Output(Bool())
  val rden = Output(Bool())
  val wr_size = Output(UInt(3.W))
  val wr_data = Output(UInt(78.W))
  val rd_data = Input(UInt(64.W))
  val rd_data_ecc = Input(UInt(78.W))
}
class ic_mem extends Bundle with lib {
  val rw_addr = Output(UInt(31.W))
  val tag_valid = Output(UInt(ICACHE_NUM_WAYS.W))
  val wr_en = Output(UInt(ICACHE_NUM_WAYS.W))
  val rd_en = Output(Bool())
  val wr_data = Output(Vec(ICACHE_BANKS_WAY, UInt(71.W)))
  val debug_wr_data = Output(UInt(71.W))
  val debug_addr = Output(UInt((ICACHE_INDEX_HI-2).W))
  val rd_data = Input(UInt(64.W))
  val debug_rd_data = Input(UInt(71.W))
  val tag_debug_rd_data = Input(UInt(26.W))
  val eccerr = Input(UInt(ICACHE_BANKS_WAY.W))
  val parerr = Input(UInt(ICACHE_BANKS_WAY.W))
  val rd_hit = Input(UInt(ICACHE_NUM_WAYS.W))
  val tag_perr = Input(Bool())
  val debug_rd_en = Output(Bool())
  val debug_wr_en = Output(Bool())
  val debug_tag_array = Output(Bool())
  val debug_way = Output(UInt(ICACHE_NUM_WAYS.W))
  val premux_data = Output(UInt(64.W))
  val sel_premux_data = Output(Bool())
}
class aln_ib extends Bundle with lib{
  val ifu_i0_icaf             = Output(Bool())
  val ifu_i0_icaf_type        = Output(UInt(2.W))
  val ifu_i0_icaf_f1          = Output(Bool())
  val ifu_i0_dbecc            = Output(Bool())
  val ifu_i0_bp_index         = Output(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W))
  val ifu_i0_bp_fghr          = Output(UInt(BHT_GHR_SIZE.W))
  val ifu_i0_bp_btag          = Output(UInt(BTB_BTAG_SIZE.W))
  val ifu_i0_valid            = Output(Bool())
  val ifu_i0_instr            = Output(UInt(32.W))
  val ifu_i0_pc               = Output(UInt(31.W))
  val ifu_i0_pc4              = Output(Bool())
  val i0_brp                  = Valid(new br_pkt_t)
}
class aln_dec extends Bundle{
  val dec_i0_decode_d = Input(Bool()) // Dec
  val ifu_i0_cinst            = Output(UInt(16.W)) // Dec
}
class dec_aln extends Bundle with lib {
  val aln_dec = new aln_dec
  val aln_ib = new aln_ib
  val ifu_pmu_instr_aligned   = Output(Bool()) // TLU
}

class ifu_dec extends Bundle{
  val dec_aln = new dec_aln
  val dec_mem_ctrl = new dec_mem_ctrl
  val dec_ifc = new dec_ifc
  val dec_bp = new dec_bp
}
class exu_ifu extends Bundle{
  val exu_bp = Flipped(new exu_bp())
}
class ifu_dma extends Bundle{
  val dma_ifc  = new dma_ifc
  val dma_mem_ctl = new dma_mem_ctl
}
class dma_mem_ctl extends Bundle{
  val dma_iccm_req = Input(Bool())
  val dma_mem_addr = Input(UInt(32.W))
  val dma_mem_sz = Input(UInt(3.W))
  val dma_mem_write = Input(Bool())
  val dma_mem_wdata = Input(UInt(64.W))
  val dma_mem_tag = Input(UInt(3.W))
}
class dma_ifc extends  Bundle{
  val dma_iccm_stall_any = Input(Bool())
}

class trace_pkt_t extends Bundle{
  val rv_i_valid_ip      = Output(UInt(2.W)  )
  val rv_i_insn_ip       = Output(UInt(32.W) )
  val rv_i_address_ip    = Output(UInt(32.W) )
  val rv_i_exception_ip  = Output(UInt(2.W)  )
  val rv_i_ecause_ip     = Output(UInt(5.W)  )
  val rv_i_interrupt_ip  = Output(UInt(2.W)  )
  val rv_i_tval_ip       = Output(UInt(32.W) )
}




class dec_dbg extends Bundle{
  val dbg_ib = new dbg_ib
  val dbg_dctl = new dbg_dctl

}
class dbg_ib extends Bundle{
  val dbg_cmd_valid           = Input(Bool())    // debugger abstract command valid
  val dbg_cmd_write           = Input(Bool())    // command is a write
  val dbg_cmd_type            = Input(UInt(2.W))    //  command type
  val dbg_cmd_addr            = Input(UInt(32.W))    // command address
}

class dbg_dctl extends Bundle{
  val dbg_cmd_wrdata          = Input(UInt(2.W))    // command write data, for fence/fence_i
}



class dec_alu extends Bundle {
  val                  dec_i0_alu_decode_d          = Input(UInt(1.W))          // Valid
  val                  dec_csr_ren_d                = Input(Bool())          // extra decode
  val                  dec_i0_br_immed_d            = Input(UInt(12.W))         // Branch offset
  val                  exu_i0_pc_x                  = Output(UInt(31.W))        // flopped PC
}
class dec_div extends Bundle {
  val		div_p					        =Flipped(Valid(new div_pkt_t))                   // DEC {valid, unsigned, rem}
  val		dec_div_cancel			  =Input(UInt(1.W))                           // Cancel the divide operation
}

class tlu_exu extends Bundle with lib{
  val		dec_tlu_meihap			  =Input(UInt(30.W))                          // External stall mux data
  val   dec_tlu_flush_lower_r	=Input(UInt(1.W))                         	// Flush divide and secondary ALUs
  val		dec_tlu_flush_path_r	=Input(UInt(31.W))                          // Redirect target
  val		exu_i0_br_hist_r		  =Output(UInt(2.W))                          // to DEC  I0 branch history
  val		exu_i0_br_error_r		  =Output(UInt(1.W))                          // to DEC  I0 branch error
  val		exu_i0_br_start_error_r	=Output(UInt(1.W))                       	// to DEC  I0 branch start error
  val		exu_i0_br_index_r		  =Output(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))  // to DEC  I0 branch index
  val		exu_i0_br_valid_r		  =Output(UInt(1.W))                          // to DEC  I0 branch valid
  val		exu_i0_br_mp_r			  =Output(UInt(1.W))                          // to DEC  I0 branch mispredict
  val		exu_i0_br_middle_r		=Output(UInt(1.W))                          // to DEC  I0 branch middle
  val		exu_pmu_i0_br_misp		=Output(UInt(1.W))                          // to PMU - I0 E4 branch mispredict
  val		exu_pmu_i0_br_ataken	=Output(UInt(1.W))                          // to PMU - I0 E4 taken
  val		exu_pmu_i0_pc4			  =Output(UInt(1.W))                          // to PMU - I0 E4 PC
  val		exu_npc_r				      =Output(UInt(31.W))                         // Divide NPC
}
class ib_exu extends Bundle {
  val dec_i0_pc_d				    =Input(UInt(31.W))                          // Instruction PC
  val	dec_debug_wdata_rs1_d	=Input(UInt(1.W))                           // Debug select to primary I0 RS1
}
class gpr_exu extends Bundle{
  val		gpr_i0_rs1_d			    =Input(UInt(32.W))                          // DEC data gpr
  val		gpr_i0_rs2_d			    =Input(UInt(32.W))                          // DEC data gpr
}
class decode_exu extends Bundle with lib{
  val   dec_data_en				    =Input(UInt(2.W))                           // Clock enable {x,r}, one cycle pulse
  val   dec_ctl_en				    =Input(UInt(2.W))                           // Clock enable {x,r}, two cycle pulse
  val		i0_ap					        =Input(new alu_pkt_t)                   // DEC alu {valid,predecodes}
  val  	dec_i0_predict_p_d		=Flipped(Valid(new predict_pkt_t))               // DEC branch predict packet
  val		i0_predict_fghr_d		  =Input(UInt(BHT_GHR_SIZE.W))                // DEC predict fghr
  val		i0_predict_index_d		=Input(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))   // DEC predict index
  val		i0_predict_btag_d		  =Input(UInt(BTB_BTAG_SIZE.W))               // DEC predict branch tag
  val		dec_i0_rs1_en_d			  =Input(UInt(1.W))                           // Qualify GPR RS1 data
  val		dec_i0_rs2_en_d			  =Input(UInt(1.W))                           // Qualify GPR RS2 data
  val		dec_i0_immed_d			  =Input(UInt(32.W))                          // DEC data immediate
  val		dec_i0_rs1_bypass_data_d=Input(UInt(32.W))                      	// DEC bypass data
  val		dec_i0_rs2_bypass_data_d=Input(UInt(32.W))                      	// DEC bypass data
  val		dec_i0_select_pc_d		=Input(UInt(1.W))                           // PC select to RS1
  val		dec_i0_rs1_bypass_en_d	=Input(UInt(2.W))                       	// DEC bypass select  1 - X-stage, 0 - dec bypass data
  val		dec_i0_rs2_bypass_en_d	=Input(UInt(2.W))                        	// DEC bypass select  1 - X-stage, 0 - dec bypass data
  val		mul_p					        =Flipped(Valid(new mul_pkt_t))                   // DEC {valid, operand signs, low, operand bypass}
  val		pred_correct_npc_x		=Input(UInt(31.W))                          // DEC NPC for correctly predicted branch
  val		dec_extint_stall		  =Input(Bool())                           // External stall mux select
  val		exu_i0_result_x			  =Output(UInt(32.W))                         // Primary ALU result to DEC
  val		exu_csr_rs1_x			    =Output(UInt(32.W))                         // RS1 source for a CSR instruction

}
class dec_exu extends Bundle with lib{
  val dec_alu = new dec_alu()
  val dec_div = new dec_div()
  val decode_exu = new decode_exu()
  val tlu_exu = new tlu_exu()
  val ib_exu = new ib_exu()
  val gpr_exu = new gpr_exu()
}
class exu_bp extends Bundle with lib{
  val   exu_i0_br_index_r = Output(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W)) // Way from where the btb got a hit
  val		exu_i0_br_fghr_r		  =Output(UInt(BHT_GHR_SIZE.W))               // to DEC  I0 branch fghr
  val		exu_i0_br_way_r			  =Output(UInt(1.W))                          // to DEC  I0 branch way
  val		exu_mp_pkt				    =Valid(new predict_pkt_t)              // Mispredict branch packet
  val		exu_mp_eghr				    =Output(UInt(BHT_GHR_SIZE.W))               // Mispredict global history
  val		exu_mp_fghr				    =Output(UInt(BHT_GHR_SIZE.W))               // Mispredict fghr
  val		exu_mp_index			    =Output(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))  // Mispredict index
  val		exu_mp_btag				    =Output(UInt(BTB_BTAG_SIZE.W))              // Mispredict btag
}
object inst_pkt_t extends Enumeration{
  val NULL      = "b0000".U(4.W)
  val MUL       = "b0001".U(4.W)
  val LOAD      = "b0010".U(4.W)
  val STORE     = "b0011".U(4.W)
  val ALU       = "b0100".U(4.W)
  val CSRREAD   = "b0101".U(4.W)
  val CSRWRITE  = "b0110".U(4.W)
  val CSRRW     = "b0111".U(4.W)
  val EBREAK    = "b1000".U(4.W)
  val ECALL     = "b1001".U(4.W)
  val FENCE     = "b1010".U(4.W)
  val FENCEI    = "b1011".U(4.W)
  val MRET      = "b1100".U(4.W)
  val CONDBR    = "b1101".U(4.W)
  val JAL       = "b1110".U(4.W)
  val BITMANIPU = "b1111".U(4.W)
}

class load_cam_pkt_t extends Bundle {
  //val valid = UInt(1.W)
  val wb    = UInt(1.W)
  val tag   = UInt(3.W)
  val rd    = UInt(5.W)
}

class rets_pkt_t extends Bundle {
  val pc0_call = UInt(1.W)
  val pc0_ret  = UInt(1.W)
  val pc0_pc4  = UInt(1.W)
}

class br_pkt_t extends Bundle {
 // val valid          = UInt(1.W)
  val toffset        = UInt(12.W)
  val hist           = UInt(2.W)
  val br_error       = UInt(1.W)
  val br_start_error = UInt(1.W)
  val bank           = UInt(1.W)
  val prett          = UInt(31.W)     // predicted ret target
  val way            = UInt(1.W)
  val ret            = UInt(1.W)
}


class br_tlu_pkt_t extends Bundle {
 // val valid           = UInt(1.W)
  val hist            = UInt(2.W)
  val br_error        = UInt(1.W)
  val br_start_error  = UInt(1.W)
  val way             = UInt(1.W)
  val middle          = UInt(1.W)
}

class predict_pkt_t extends Bundle {
  val misp       = UInt(1.W)
  val ataken     = UInt(1.W)
  val boffset    = UInt(1.W)
  val pc4        = UInt(1.W)
  val hist       = UInt(2.W)
  val toffset    = UInt(12.W)
 // val valid      = UInt(1.W)
  val br_error   = UInt(1.W)
  val br_start_error = UInt(1.W)
  val prett      = UInt(31.W)
  val pcall      = UInt(1.W)
  val pret       = UInt(1.W)
  val pja        = UInt(1.W)
  val way        = UInt(1.W)
}


class trap_pkt_t extends Bundle {
  val legal     = UInt(1.W)
  val icaf      = UInt(1.W)
  val icaf_f1   = UInt(1.W)
  val icaf_type = UInt(2.W)
  val fence_i   = UInt(1.W)
  val i0trigger = UInt(4.W)
  val pmu_i0_itype =UInt(4.W) //new inst_pkt_t   //pmu-instructiontype
  val pmu_i0_br_unpred   = UInt(1.W)  //pmu
  val pmu_divide         = UInt(1.W)
  val pmu_lsu_misaligned = UInt(1.W)
}

class dest_pkt_t extends Bundle {
  val i0rd      = UInt(5.W)
  val i0load    = UInt(1.W)
  val i0store   = UInt(1.W)
  val i0div     = UInt(1.W)
  val i0v       = UInt(1.W)
 // val i0valid   = UInt(1.W)
  val csrwen    = UInt(1.W)
  val csrwonly  = UInt(1.W)
  val csrwaddr  = UInt(12.W)
}

class class_pkt_t extends Bundle {
  val mul       = UInt(1.W)
  val load      = UInt(1.W)
  val alu       = UInt(1.W)
}

class reg_pkt_t extends Bundle {
  val rs1       = UInt(5.W)
  val rs2       = UInt(5.W)
  val rd        = UInt(5.W)
}


class alu_pkt_t extends Bundle {
  val land     = UInt(1.W)
  val lor      = UInt(1.W)
  val lxor     = UInt(1.W)
  val sll      = UInt(1.W)
  val srl      = UInt(1.W)
  val sra      = UInt(1.W)
  val beq      = UInt(1.W)
  val bne      = UInt(1.W)
  val blt      = UInt(1.W)
  val bge      = UInt(1.W)
  val add      = UInt(1.W)
  val sub      = UInt(1.W)
  val slt      = UInt(1.W)
  val unsign   = UInt(1.W)
  val jal        = UInt(1.W)
  val predict_t  = UInt(1.W)
  val predict_nt = UInt(1.W)
  val csr_write  = UInt(1.W)
  val csr_imm    = UInt(1.W)
}

class lsu_pkt_t extends Bundle {
  val fast_int   = Bool()
  val by         = Bool()
  val half       = Bool()
  val word       = Bool()
  val dword      = Bool()    // for dma
  val load       = Bool()
  val store      = Bool()
  val unsign     = Bool()
  val dma        = Bool()    // dma pkt
  val store_data_bypass_d  = Bool()
  val load_ldst_bypass_d   = Bool()
  val store_data_bypass_m  = Bool()
//  val valid      = Bool()
}

class lsu_error_pkt_t extends Bundle {
 // val exc_valid   = UInt(1.W)
  val single_ecc_error  = UInt(1.W)
  val inst_type    = UInt(1.W)    //0: Load, 1: Store
  val exc_type     = UInt(1.W)    //0: MisAligned, 1: Access Fault
  val mscause      = UInt(4.W)
  val addr         = UInt(32.W)
}

class dec_pkt_t extends Bundle {
  val alu       = Bool()
  val rs1       = Bool()
  val rs2       = Bool()
  val imm12     = Bool()
  val rd        = Bool()
  val shimm5    = Bool()
  val imm20     = Bool()
  val pc        = Bool()
  val load      = Bool()
  val store     = Bool()
  val lsu       = Bool()
  val add       = Bool()
  val sub       = Bool()
  val land      = Bool()
  val lor       = Bool()
  val lxor      = Bool()
  val sll       = Bool()
  val sra       = Bool()
  val srl       = Bool()
  val slt       = Bool()
  val unsign    = Bool()
  val condbr    = Bool()
  val beq       = Bool()
  val bne       = Bool()
  val bge       = Bool()
  val blt       = Bool()
  val jal       = Bool()
  val by        = Bool()
  val half      = Bool()
  val word      = Bool()
  val csr_read  = Bool()
  val csr_clr   = Bool()
  val csr_set   = Bool()
  val csr_write = Bool()
  val csr_imm   = Bool()
  val presync   = Bool()
  val postsync  = Bool()
  val ebreak    = Bool()
  val ecall     = Bool()
  val mret      = Bool()
  val mul       = Bool()
  val rs1_sign  = Bool()
  val rs2_sign  = Bool()
  val low       = Bool()
  val div       = Bool()
  val rem       = Bool()
  val fence     = Bool()
  val fence_i   = Bool()
  val pm_alu    = Bool()
  val legal     = Bool()
}

class mul_pkt_t extends Bundle {
 // val valid     = UInt(1.W)
  val rs1_sign  = UInt(1.W)
  val rs2_sign  = UInt(1.W)
  val low       = UInt(1.W)
  val bext      = UInt(1.W)
  val bdep      = UInt(1.W)
  val clmul     = UInt(1.W)
  val clmulh    = UInt(1.W)
  val clmulr    = UInt(1.W)
  val grev      = UInt(1.W)
  val shfl      = UInt(1.W)
  val unshfl    = UInt(1.W)
  val crc32_b   = UInt(1.W)
  val crc32_h   = UInt(1.W)
  val crc32_w   = UInt(1.W)
  val crc32c_b  = UInt(1.W)
  val crc32c_h  = UInt(1.W)
  val crc32c_w  = UInt(1.W)
  val bfp       = UInt(1.W)
}

class div_pkt_t extends Bundle {
 // val valid     = UInt(1.W)
  val unsign    = UInt(1.W)
  val rem       = UInt(1.W)
}

class ccm_ext_in_pkt_t extends Bundle {
  val        TEST1    = UInt(1.W)
  val        RME      = UInt(1.W)
  val        RM       = UInt(4.W)

  val        LS        = UInt(1.W)
  val        DS        = UInt(1.W)
  val        SD        = UInt(1.W)
  val        TEST_RNM  = UInt(1.W)
  val        BC1       = UInt(1.W)
  val        BC2       = UInt(1.W)
}

class dccm_ext_in_pkt_t extends Bundle {
  val        TEST1    = UInt(1.W)
  val        RME      = UInt(1.W)
  val        RM       = UInt(4.W)
  val        LS       = UInt(1.W)
  val        DS       = UInt(1.W)
  val        SD       = UInt(1.W)
  val        TEST_RNM = UInt(1.W)
  val        BC1      = UInt(1.W)
  val        BC2      = UInt(1.W)
}


class ic_data_ext_in_pkt_t extends Bundle {
  val        TEST1    = UInt(1.W)
  val        RME      = UInt(1.W)
  val        RM       = UInt(4.W)
  val        LS       = UInt(1.W)
  val        DS       = UInt(1.W)
  val        SD       = UInt(1.W)
  val        TEST_RNM = UInt(1.W)
  val        BC1      = UInt(1.W)
  val        BC2      = UInt(1.W)
}

class ic_tag_ext_in_pkt_t extends Bundle {
  val        TEST1    = UInt(1.W)
  val        RME      = UInt(1.W)
  val        RM       = UInt(4.W)
  val        LS       = UInt(1.W)
  val        DS       = UInt(1.W)
  val        SD       = UInt(1.W)
  val        TEST_RNM = UInt(1.W)
  val        BC1      = UInt(1.W)
  val        BC2      = UInt(1.W)
}

class trigger_pkt_t extends Bundle {
  val        select    = UInt(1.W)
  val        match_pkt    = UInt(1.W)
  val        store     = UInt(1.W)
  val        load      = UInt(1.W)
  val        execute   = UInt(1.W)
  val        m         = UInt(1.W)
  val        tdata2    = UInt(32.W)
}

class cache_debug_pkt_t extends Bundle {
  val         icache_wrdata      = UInt(71.W) // {dicad1[1:0], dicad0h[31:0], dicad0[31:0]}
  val         icache_dicawics    = UInt(17.W) // Arraysel:24, Waysel:21:20, Index:16:3
  val         icache_rd_valid    = UInt(1.W)
  val         icache_wr_valid    = UInt(1.W)
}

class dec_tlu_csr_pkt extends Bundle{
  val csr_misa 				=UInt(1.W)
  val csr_mvendorid			=UInt(1.W)
  val csr_marchid				=UInt(1.W)
  val csr_mimpid 				=UInt(1.W)
  val csr_mhartid				=UInt(1.W)
  val csr_mstatus				=UInt(1.W)
  val csr_mtvec 				=UInt(1.W)
  val csr_mip 				=UInt(1.W)
  val csr_mie 				=UInt(1.W)
  val csr_mcyclel 			=UInt(1.W)
  val csr_mcycleh 			=UInt(1.W)
  val csr_minstretl 			=UInt(1.W)
  val csr_minstreth 			=UInt(1.W)
  val csr_mscratch 			=UInt(1.W)
  val csr_mepc 				=UInt(1.W)
  val csr_mcause 				=UInt(1.W)
  val csr_mscause 			=UInt(1.W)
  val csr_mtval 				=UInt(1.W)
  val csr_mrac 				=UInt(1.W)
  val csr_dmst 				=UInt(1.W)
  val csr_mdseac 				=UInt(1.W)
  val csr_meihap 				=UInt(1.W)
  val csr_meivt 				=UInt(1.W)
  val csr_meipt 				=UInt(1.W)
  val csr_meicurpl 			=UInt(1.W)
  val csr_meicidpl 			=UInt(1.W)
  val csr_dcsr 				=UInt(1.W)
  val csr_mcgc 				=UInt(1.W)
  val csr_mfdc 				=UInt(1.W)
  val csr_dpc 				=UInt(1.W)
  val csr_mtsel 				=UInt(1.W)
  val csr_mtdata1 			=UInt(1.W)
  val csr_mtdata2 			=UInt(1.W)
  val csr_mhpmc3 				=UInt(1.W)
  val csr_mhpmc4 				=UInt(1.W)
  val csr_mhpmc5 				=UInt(1.W)
  val csr_mhpmc6 				=UInt(1.W)
  val csr_mhpmc3h 			=UInt(1.W)
  val csr_mhpmc4h 			=UInt(1.W)
  val csr_mhpmc5h 			=UInt(1.W)
  val csr_mhpmc6h 			=UInt(1.W)
  val csr_mhpme3 				=UInt(1.W)
  val csr_mhpme4 				=UInt(1.W)
  val csr_mhpme5 				=UInt(1.W)
  val csr_mhpme6 				=UInt(1.W)
  val csr_mcountinhibit 			=UInt(1.W)
  val csr_mitctl0 			=UInt(1.W)
  val csr_mitctl1 			=UInt(1.W)
  val csr_mitb0 				=UInt(1.W)
  val csr_mitb1 				=UInt(1.W)
  val csr_mitcnt0 			=UInt(1.W)
  val csr_mitcnt1 			=UInt(1.W)
  val csr_mpmc 				=UInt(1.W)
  val csr_mcpc 				=UInt(1.W)
  val csr_meicpct 			=UInt(1.W)
  val csr_mdeau 				=UInt(1.W)
  val csr_micect 				=UInt(1.W)
  val csr_miccmect 			=UInt(1.W)
  val csr_mdccmect 			=UInt(1.W)
  val csr_mfdht 				=UInt(1.W)
  val csr_mfdhs 				=UInt(1.W)
  val csr_dicawics 			=UInt(1.W)
  val csr_dicad0h 			=UInt(1.W)
  val csr_dicad0 				=UInt(1.W)
  val csr_dicad1 				=UInt(1.W)
  val csr_dicago 				=UInt(1.W)
  val presync	 			=UInt(1.W)
  val postsync 				=UInt(1.W)
  val legal 				=UInt(1.W)
}
