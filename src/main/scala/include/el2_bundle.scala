package include

import chisel3._

// use this for instance declaration val io = IO(Output(new el2_trace_pkt_t))
class el2_trace_pkt_t extends Bundle{
  val rv_i_valid_ip      = UInt(2.W)
  val rv_i_insn_ip       = UInt(32.W)
  val rv_i_address_ip    = UInt(32.W)
  val rv_i_exception_ip  = UInt(2.W)
  val rv_i_ecause_ip     = UInt(5.W)
  val rv_i_interrupt_ip  = UInt(2.W)
  val rv_i_tval_ip       = UInt(32.W)
}




object el2_inst_pkt_t extends Enumeration{
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

class el2_load_cam_pkt_t extends Bundle {
  //val valid = UInt(1.W)
  val wb    = UInt(1.W)
  val tag   = UInt(3.W)
  val rd    = UInt(5.W)
}

class el2_rets_pkt_t extends Bundle {
  val pc0_call = UInt(1.W)
  val pc0_ret  = UInt(1.W)
  val pc0_pc4  = UInt(1.W)
}

class el2_br_pkt_t extends Bundle {
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


class el2_br_tlu_pkt_t extends Bundle {
 // val valid           = UInt(1.W)
  val hist            = UInt(2.W)
  val br_error        = UInt(1.W)
  val br_start_error  = UInt(1.W)
  val way             = UInt(1.W)
  val middle          = UInt(1.W)
}

class el2_predict_pkt_t extends Bundle {
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


class el2_trap_pkt_t extends Bundle {
  val legal     = UInt(1.W)
  val icaf      = UInt(1.W)
  val icaf_f1   = UInt(1.W)
  val icaf_type = UInt(2.W)
  val fence_i   = UInt(1.W)
  val i0trigger = UInt(4.W)
  val pmu_i0_itype =UInt(4.W) //new el2_inst_pkt_t   //pmu-instructiontype
  val pmu_i0_br_unpred   = UInt(1.W)  //pmu
  val pmu_divide         = UInt(1.W)
  val pmu_lsu_misaligned = UInt(1.W)
}

class el2_dest_pkt_t extends Bundle {
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

class el2_class_pkt_t extends Bundle {
  val mul       = UInt(1.W)
  val load      = UInt(1.W)
  val alu       = UInt(1.W)
}

class el2_reg_pkt_t extends Bundle {
  val rs1       = UInt(5.W)
  val rs2       = UInt(5.W)
  val rd        = UInt(5.W)
}


class el2_alu_pkt_t extends Bundle {
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

class el2_lsu_pkt_t extends Bundle {
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

class el2_lsu_error_pkt_t extends Bundle {
 // val exc_valid   = UInt(1.W)
  val single_ecc_error  = UInt(1.W)
  val inst_type    = UInt(1.W)    //0: Load, 1: Store
  val exc_type     = UInt(1.W)    //0: MisAligned, 1: Access Fault
  val mscause      = UInt(4.W)
  val addr         = UInt(32.W)
}

class el2_dec_pkt_t extends Bundle {
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

class el2_mul_pkt_t extends Bundle {
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

class el2_div_pkt_t extends Bundle {
 // val valid     = UInt(1.W)
  val unsign    = UInt(1.W)
  val rem       = UInt(1.W)
}

class el2_ccm_ext_in_pkt_t extends Bundle {
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

class el2_dccm_ext_in_pkt_t extends Bundle {
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


class el2_ic_data_ext_in_pkt_t extends Bundle {
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

class el2_ic_tag_ext_in_pkt_t extends Bundle {
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

class el2_trigger_pkt_t extends Bundle {
  val        select    = UInt(1.W)
  val        match_pkt    = UInt(1.W)
  val        store     = UInt(1.W)
  val        load      = UInt(1.W)
  val        execute   = UInt(1.W)
  val        m         = UInt(1.W)
  val        tdata2    = UInt(32.W)
}

class el2_cache_debug_pkt_t extends Bundle {
  val         icache_wrdata      = UInt(71.W) // {dicad1[1:0], dicad0h[31:0], dicad0[31:0]}
  val         icache_dicawics    = UInt(17.W) // Arraysel:24, Waysel:21:20, Index:16:3
  val         icache_rd_valid    = UInt(1.W)
  val         icache_wr_valid    = UInt(1.W)
}

class el2_dec_tlu_csr_pkt extends Bundle{
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
