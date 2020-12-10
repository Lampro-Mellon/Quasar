package dec
import chisel3._

import scala.collection._
import chisel3.util._
import include._
import lib._
import exu._
import lsu._

class dec_decode_ctl extends Module with lib with RequireAsyncReset{
  val io = IO(new Bundle{
    val decode_exu = Flipped(new decode_exu)
    val dec_alu = Flipped(new dec_alu)
    val dec_div = Flipped(new dec_div)
    val dctl_busbuff = Flipped(new dctl_busbuff())
    val dctl_dma = new dctl_dma
    val dec_tlu_flush_extint          = Input(Bool())
    val dec_tlu_force_halt            = Input(Bool()) // invalidate nonblock load cam on a force halt event
    val dec_i0_inst_wb1               = Output(UInt(32.W))      // 32b instruction at wb+1 for trace encoder
    val dec_i0_pc_wb1                 = Output(UInt(31.W))      // 31b pc at wb+1 for trace encoder
    val dec_i0_trigger_match_d        = Input(UInt(4.W))         // i0 decode trigger matches
    val dec_tlu_wr_pause_r         =   Input(Bool())           // pause instruction at r
    val dec_tlu_pipelining_disable =   Input(Bool())           // pipeline disable - presync, i0 decode only
    val lsu_trigger_match_m        =   Input(UInt(4.W))     // lsu trigger matches
    val lsu_pmu_misaligned_m       =   Input(Bool())            // perf mon: load/store misalign
    val dec_tlu_debug_stall        =   Input(Bool())            // debug stall decode
    val dec_tlu_flush_leak_one_r   =   Input(Bool())            // leak1 instruction
    val dec_debug_fence_d          =   Input(Bool())            // debug fence instruction
    val dec_i0_icaf_d              =   Input(Bool())            // icache access fault
    val dec_i0_icaf_f1_d           =   Input(Bool())            // i0 instruction access fault at decode for f1 fetch group
    val dec_i0_icaf_type_d         =   Input(UInt(2.W))      // i0 instruction access fault type
    val dec_i0_dbecc_d             =   Input(Bool())            // icache/iccm double-bit error
    val dec_i0_brp                 =   Flipped(Valid(new br_pkt_t))          // branch packet
    val dec_i0_bp_index            =   Input(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))    // i0 branch index
    val dec_i0_bp_fghr             =   Input(UInt(BHT_GHR_SIZE.W))   // BP FGHR
    val dec_i0_bp_btag             =   Input(UInt(BTB_BTAG_SIZE.W))   // BP tag
    val dec_i0_pc_d                =   Input(UInt(31.W))    // pc
    val lsu_idle_any               =   Input(Bool())        // lsu idle: if fence instr & !!!!!!!!!!!!!!!!!!!!!!!!!lsu_idle then stall decode
    val lsu_load_stall_any         =   Input(Bool())              // stall any load at decode
    val lsu_store_stall_any        =   Input(Bool())              // stall any store at decode6
    val exu_div_wren               =   Input(Bool())           // nonblocking divide write enable to GPR.
    val dec_tlu_i0_kill_writeb_wb  =   Input(Bool())           // I0 is flushed, don't writeback any results to arch state
    val dec_tlu_flush_lower_wb     =   Input(Bool())           // trap lower flush
    val dec_tlu_i0_kill_writeb_r   =   Input(Bool())           // I0 is flushed, don't writeback any results to arch state
    val dec_tlu_flush_lower_r      =   Input(Bool())           // trap lower flush
    val dec_tlu_flush_pause_r      =   Input(Bool())           // don't clear pause state on initial lower flush
    val dec_tlu_presync_d          =   Input(Bool())           // CSR read needs to be presync'd
    val dec_tlu_postsync_d         =   Input(Bool())           // CSR ops that need to be postsync'd
    val dec_i0_pc4_d               =   Input(Bool())           // inst is 4B inst else 2B
    val dec_csr_rddata_d           =   Input(UInt(32.W)) // csr read data at wb
    val dec_csr_legal_d            =   Input(Bool())           // csr indicates legal operation
    val lsu_result_m               =   Input(UInt(32.W))    // load result
    val lsu_result_corr_r          =   Input(UInt(32.W))   // load result - corrected data for writing gpr's, not for bypassing
    val exu_flush_final            =   Input(Bool())           // lower flush or i0 flush at X or D
    val dec_i0_instr_d             =   Input(UInt(32.W))    // inst at decode
    val dec_ib0_valid_d            =   Input(Bool())          // inst valid at decode
    val free_clk                   =   Input(Clock())
    val active_clk                 =   Input(Clock())              // clk except for halt / pause
    val clk_override               =   Input(Bool())              // test stuff
    val dec_i0_rs1_d               =   Output(UInt(5.W))    // rs1 logical source
    val dec_i0_rs2_d               =   Output(UInt(5.W))
    val dec_i0_waddr_r             =   Output(UInt(5.W))   // i0 logical source to write to gpr's
    val dec_i0_wen_r               =   Output(Bool())   // i0 write enable
    val dec_i0_wdata_r             =   Output(UInt(32.W))   // i0 write data
    val lsu_p                      =   Valid(new lsu_pkt_t) // load/store packet
    val div_waddr_wb               =   Output(UInt(5.W)) // DIV write address to GPR
    val dec_lsu_valid_raw_d        =   Output(Bool())
    val dec_lsu_offset_d           =   Output(UInt(12.W))
    val dec_csr_wen_unq_d          =   Output(Bool())   // valid csr with write - for csr legal
    val dec_csr_any_unq_d          =   Output(Bool())   // valid csr - for csr legal
    val dec_csr_rdaddr_d           =   Output(UInt(12.W))   // read address for csr
    val dec_csr_wen_r              =   Output(Bool())   // csr write enable at r
    val dec_csr_wraddr_r           =   Output(UInt(12.W))   // write address for csr
    val dec_csr_wrdata_r           =   Output(UInt(32.W))   // csr write data at r
    val dec_csr_stall_int_ff       =   Output(Bool())   // csr is mie/mstatus
    val dec_tlu_i0_valid_r         =   Output(Bool())   // i0 valid inst at c
    val dec_tlu_packet_r           =   Output(new trap_pkt_t)   // trap packet
    val dec_tlu_i0_pc_r            =   Output(UInt(31.W))   // i0 trap pc
    val dec_illegal_inst           =   Output(UInt(32.W))   // illegal inst
    val dec_pmu_instr_decoded      =   Output(Bool())    // number of instructions decode this cycle encoded
    val dec_pmu_decode_stall       =   Output(Bool())    // decode is stalled
    val dec_pmu_presync_stall      =   Output(Bool())    // decode has presync stall
    val dec_pmu_postsync_stall     =   Output(Bool())    // decode has postsync stall
    val dec_nonblock_load_wen      =   Output(Bool())    // write enable for nonblock load
    val dec_nonblock_load_waddr    =   Output(UInt(5.W))    // logical write addr for nonblock load
    val dec_pause_state            =   Output(Bool())    // core in pause state
    val dec_pause_state_cg         =   Output(Bool())    // pause state for clock-gating
    val dec_div_active             =   Output(Bool())    // non-block divide is active
    val scan_mode                  =   Input(Bool())

    val dec_aln = Flipped(new aln_dec)
    val dbg_dctl = new dbg_dctl()
})
  /////////////////////////////////////////////////////////////////////////////////////////
//  //packets zero initialization
  io.decode_exu.mul_p := 0.U.asTypeOf(io.decode_exu.mul_p)
  // Vals defined
  val leak1_i1_stall_in = WireInit(UInt(1.W), 0.U)
  val leak1_i0_stall_in = WireInit(UInt(1.W), 0.U)
  val i0r = Wire(new reg_pkt_t)
  val d_t = Wire(new trap_pkt_t)
  val x_t = Wire(new trap_pkt_t)
  val x_t_in = Wire(new trap_pkt_t)
  val r_t = Wire(new trap_pkt_t)
  val r_t_in    = Wire(new trap_pkt_t)
  val d_d = Wire(Valid(new dest_pkt_t))
  val x_d = Wire(Valid(new dest_pkt_t))
  val r_d = Wire(Valid(new dest_pkt_t))
  val r_d_in = Wire(Valid(new dest_pkt_t))
  val wbd = Wire(Valid(new dest_pkt_t))
  val i0_d_c = Wire(new class_pkt_t)
  val i0_rs1_class_d = Wire(new class_pkt_t)
  val i0_rs2_class_d = Wire(new class_pkt_t)
  val i0_rs1_depth_d = WireInit(UInt(2.W),0.U)
  val i0_rs2_depth_d = WireInit(UInt(2.W),0.U)
  val cam_wen=WireInit(UInt(LSU_NUM_NBLOAD.W), 0.U)
  val cam = Wire(Vec(LSU_NUM_NBLOAD,Valid(new load_cam_pkt_t)))
  val cam_write=WireInit(UInt(1.W), 0.U)
  val cam_inv_reset_val=Wire(Vec(LSU_NUM_NBLOAD,UInt(1.W)))
  val cam_data_reset_val=Wire(Vec(LSU_NUM_NBLOAD,UInt(1.W)))
  val nonblock_load_write=Wire(Vec(LSU_NUM_NBLOAD,UInt(1.W)))
  val cam_raw =Wire(Vec(LSU_NUM_NBLOAD,Valid(new load_cam_pkt_t)))
  val cam_in  =Wire(Vec(LSU_NUM_NBLOAD,Valid(new load_cam_pkt_t)))
  //val i0_temp = Wire(new inst_pkt_t)
  val i0_dp= Wire(new dec_pkt_t)
  val i0_dp_raw= Wire(new dec_pkt_t)
  val i0_rs1bypass = WireInit(UInt(3.W), 0.U)
  val i0_rs2bypass = WireInit(UInt(3.W), 0.U)
  val illegal_lockout = WireInit(UInt(1.W), 0.U)
  val postsync_stall = WireInit(UInt(1.W), 0.U)
  val ps_stall_in = WireInit(UInt(1.W), 0.U)
  val i0_pipe_en = WireInit(UInt(4.W), 0.U)
  val i0_load_block_d = WireInit(UInt(1.W), 0.U)
  val load_ldst_bypass_d = WireInit(UInt(1.W), 0.U)
  val store_data_bypass_d = WireInit(UInt(1.W), 0.U)
  val store_data_bypass_m = WireInit(UInt(1.W), 0.U)
  val tlu_wr_pause_r1 = WireInit(UInt(1.W), 0.U)
  val tlu_wr_pause_r2 = WireInit(UInt(1.W), 0.U)
  val leak1_i1_stall = WireInit(UInt(1.W), 0.U)
  val leak1_i0_stall = WireInit(UInt(1.W), 0.U)
  val pause_state = WireInit(Bool(), 0.B)
  val flush_final_r =  WireInit(UInt(1.W), 0.U)
  val illegal_lockout_in = WireInit(UInt(1.W), 0.U)
  val lsu_idle = WireInit(Bool(), 0.B)
  val pause_state_in =  WireInit(Bool(), 0.B)
  val leak1_mode = WireInit(UInt(1.W), 0.U)
  val  i0_pcall = WireInit(UInt(1.W), 0.U)
  val  i0_pja = WireInit(UInt(1.W), 0.U)
  val i0_pret = WireInit(UInt(1.W), 0.U)
  val i0_legal_decode_d = WireInit(UInt(1.W), 0.U)
  val  i0_pcall_raw = WireInit(UInt(1.W), 0.U)
  val  i0_pja_raw = WireInit(UInt(1.W), 0.U)
  val i0_pret_raw = WireInit(UInt(1.W), 0.U)
  val i0_br_offset = WireInit(UInt(12.W), 0.U)
  val i0_csr_write_only_d = WireInit(UInt(1.W), 0.U)
  val i0_jal = WireInit(UInt(1.W), 0.U)
  val i0_wen_r = WireInit(UInt(1.W), 0.U)
  val i0_x_ctl_en    = WireInit(UInt(1.W), 0.U)
  val i0_r_ctl_en    = WireInit(UInt(1.W), 0.U)
  val i0_wb_ctl_en   = WireInit(UInt(1.W), 0.U)
  val i0_x_data_en   = WireInit(UInt(1.W), 0.U)
  val i0_r_data_en   = WireInit(UInt(1.W), 0.U)
  val i0_wb_data_en  = WireInit(UInt(1.W), 0.U)
  val i0_wb1_data_en = WireInit(UInt(1.W), 0.U)
  val  i0_nonblock_load_stall = WireInit(UInt(1.W), 0.U)
  val csr_ren_qual_d = WireInit(Bool(), 0.B)
  val lsu_decode_d = WireInit(UInt(1.W), 0.U)
  val mul_decode_d = WireInit(UInt(1.W), 0.U)
  val div_decode_d = WireInit(UInt(1.W), 0.U)
  val write_csr_data = WireInit(UInt(32.W),0.U)
  val i0_result_corr_r = WireInit(UInt(32.W),0.U)
  val presync_stall = WireInit(UInt(1.W), 0.U)
  val i0_nonblock_div_stall = WireInit(UInt(1.W), 0.U)
  val debug_fence = WireInit(Bool(), 0.B)
  val i0_immed_d = WireInit(UInt(32.W), 0.U)
  val i0_result_x = WireInit(UInt(32.W), 0.U)
  val i0_result_r = WireInit(UInt(32.W), 0.U)
  //////////////////////////////////////////////////////////////////////
  // Start - Data gating {{
  val data_gate_en     = (io.dec_tlu_wr_pause_r   ^  tlu_wr_pause_r1  ) |   // replaces free_clk
    (tlu_wr_pause_r1           ^  tlu_wr_pause_r2    ) |   // replaces free_clk
    (io.dec_tlu_flush_extint   ^  io.decode_exu.dec_extint_stall) |
    (leak1_i1_stall_in         ^  leak1_i1_stall     ) |   // replaces free_clk
    (leak1_i0_stall_in         ^  leak1_i0_stall     ) |   // replaces free_clk
    (pause_state_in            ^  pause_state        ) |   // replaces free_clk
    (ps_stall_in               ^  postsync_stall     ) |   // replaces free_clk
    (io.exu_flush_final        ^  flush_final_r      ) |   // replaces free_clk
    (illegal_lockout_in        ^  illegal_lockout    )     // replaces active_clk


  val data_gate_clk= rvclkhdr(clock,data_gate_en.asBool(),io.scan_mode)

  // End  - Data gating }}

  val i0_brp_valid                   = io.dec_i0_brp.valid & !leak1_mode
  io.decode_exu.dec_i0_predict_p_d.bits.misp         :=0.U
  io.decode_exu.dec_i0_predict_p_d.bits.ataken       :=0.U
  io.decode_exu.dec_i0_predict_p_d.bits.boffset      :=0.U
  io.decode_exu.dec_i0_predict_p_d.bits.pcall        :=  i0_pcall  // don't mark as pcall if branch error
  io.decode_exu.dec_i0_predict_p_d.bits.pja          :=  i0_pja
  io.decode_exu.dec_i0_predict_p_d.bits.pret         :=  i0_pret
  io.decode_exu.dec_i0_predict_p_d.bits.prett        :=  io.dec_i0_brp.bits.prett
  io.decode_exu.dec_i0_predict_p_d.bits.pc4          :=  io.dec_i0_pc4_d
  io.decode_exu.dec_i0_predict_p_d.bits.hist         :=  io.dec_i0_brp.bits.hist
  io.decode_exu.dec_i0_predict_p_d.valid        :=  i0_brp_valid & i0_legal_decode_d
  val i0_notbr_error                 =  i0_brp_valid & !(i0_dp_raw.condbr | i0_pcall_raw | i0_pja_raw | i0_pret_raw)

  // no toffset error for a pret
  val i0_br_toffset_error     =  i0_brp_valid & io.dec_i0_brp.bits.hist(1) & (io.dec_i0_brp.bits.toffset =/= i0_br_offset) & !i0_pret_raw
  val i0_ret_error            =  i0_brp_valid & io.dec_i0_brp.bits.ret & !i0_pret_raw;
  val i0_br_error             =  io.dec_i0_brp.bits.br_error | i0_notbr_error | i0_br_toffset_error | i0_ret_error
  io.decode_exu.dec_i0_predict_p_d.bits.br_error                  :=  i0_br_error & i0_legal_decode_d & !leak1_mode
  io.decode_exu.dec_i0_predict_p_d.bits.br_start_error            :=  io.dec_i0_brp.bits.br_start_error & i0_legal_decode_d & !leak1_mode
  io.decode_exu.i0_predict_index_d        :=  io.dec_i0_bp_index
  io.decode_exu.i0_predict_btag_d         :=  io.dec_i0_bp_btag
  val i0_br_error_all          = (i0_br_error | io.dec_i0_brp.bits.br_start_error) & !leak1_mode
  io.decode_exu.dec_i0_predict_p_d.bits.toffset            :=  i0_br_offset
  io.decode_exu.i0_predict_fghr_d         :=  io.dec_i0_bp_fghr
  io.decode_exu.dec_i0_predict_p_d.bits.way                       :=  io.dec_i0_brp.bits.way
  //   end

  // on br error turn anything into a nop
  // on i0 instruction fetch access fault turn anything into a nop
  // nop =>   alu rs1 imm12 rd lor
  val i0_icaf_d = io.dec_i0_icaf_d | io.dec_i0_dbecc_d

  val i0_instr_error = i0_icaf_d;
  i0_dp := i0_dp_raw
  when((i0_br_error_all | i0_instr_error).asBool){
    i0_dp          := 0.U.asTypeOf(i0_dp)
    i0_dp.alu      := 1.B
    i0_dp.rs1      := 1.B
    i0_dp.rs2      := 1.B
    i0_dp.lor      := 1.B
    i0_dp.legal    := 1.B
    i0_dp.postsync := 1.B
  }

  val i0 = io.dec_i0_instr_d
  io.decode_exu.dec_i0_select_pc_d := i0_dp.pc

  // branches that can be predicted
  val i0_predict_br    =  i0_dp.condbr | i0_pcall | i0_pja | i0_pret;

  val i0_predict_nt    = !(io.dec_i0_brp.bits.hist(1) & i0_brp_valid) & i0_predict_br
  val i0_predict_t     =  (io.dec_i0_brp.bits.hist(1) & i0_brp_valid) & i0_predict_br
  val i0_ap_pc2  = !io.dec_i0_pc4_d
  val i0_ap_pc4  =  io.dec_i0_pc4_d
  io.decode_exu.i0_ap.predict_nt    := i0_predict_nt
  io.decode_exu.i0_ap.predict_t     := i0_predict_t

  io.decode_exu.i0_ap.add     :=  i0_dp.add
  io.decode_exu.i0_ap.sub     :=  i0_dp.sub
  io.decode_exu.i0_ap.land    :=  i0_dp.land
  io.decode_exu.i0_ap.lor     :=  i0_dp.lor
  io.decode_exu.i0_ap.lxor    :=  i0_dp.lxor
  io.decode_exu.i0_ap.sll     :=  i0_dp.sll
  io.decode_exu.i0_ap.srl     :=  i0_dp.srl
  io.decode_exu.i0_ap.sra     :=  i0_dp.sra
  io.decode_exu.i0_ap.slt     :=  i0_dp.slt
  io.decode_exu.i0_ap.unsign  :=  i0_dp.unsign
  io.decode_exu.i0_ap.beq     :=  i0_dp.beq
  io.decode_exu.i0_ap.bne     :=  i0_dp.bne
  io.decode_exu.i0_ap.blt     :=  i0_dp.blt
  io.decode_exu.i0_ap.bge     :=  i0_dp.bge
  io.decode_exu.i0_ap.csr_write :=  i0_csr_write_only_d
  io.decode_exu.i0_ap.csr_imm   :=  i0_dp.csr_imm
  io.decode_exu.i0_ap.jal       :=  i0_jal
   
  // non block load cam logic
  // val found=Wire(UInt(1.W))
  cam_wen := Mux1H((0 until LSU_NUM_NBLOAD).map(i=>(0 to i).map(j=> if(i==j) !cam(j).valid else cam(j).valid).reduce(_.asBool&_.asBool).asBool -> (cam_write << i)))

  cam_write             := io.dctl_busbuff.lsu_nonblock_load_valid_m
  val cam_write_tag      = io.dctl_busbuff.lsu_nonblock_load_tag_m(LSU_NUM_NBLOAD_WIDTH-1,0)

  val cam_inv_reset       = io.dctl_busbuff.lsu_nonblock_load_inv_r
  val cam_inv_reset_tag   = io.dctl_busbuff.lsu_nonblock_load_inv_tag_r

  val cam_data_reset        = io.dctl_busbuff.lsu_nonblock_load_data_valid | io.dctl_busbuff.lsu_nonblock_load_data_error
  val cam_data_reset_tag    = io.dctl_busbuff.lsu_nonblock_load_data_tag

  val nonblock_load_rd   = Mux(x_d.bits.i0load.asBool, x_d.bits.i0rd, 0.U(5.W))  // rd data
  val load_data_tag = io.dctl_busbuff.lsu_nonblock_load_data_tag
  // case of multiple loads to same dest ie. x1 ... you have to invalidate the older one
  // don't writeback a nonblock load
  val nonblock_load_valid_m_delay=withClock(io.active_clk){RegEnable(io.dctl_busbuff.lsu_nonblock_load_valid_m,0.U, i0_r_ctl_en.asBool)}
  val i0_load_kill_wen_r = nonblock_load_valid_m_delay &  r_d.bits.i0load
  for(i <- 0 until  LSU_NUM_NBLOAD){
    cam_inv_reset_val(i) := cam_inv_reset   & (cam_inv_reset_tag === cam(i).bits.tag) & cam(i).valid
    cam_data_reset_val(i) := cam_data_reset & (cam_data_reset_tag === cam(i).bits.tag) & cam_raw(i).valid
    cam_in(i):=0.U.asTypeOf(cam(0))
    cam(i):=cam_raw(i)

    when(cam_data_reset_val(i).asBool){
      cam(i).valid := 0.U(1.W)
    }
    when(cam_wen(i).asBool){
      cam_in(i).valid     := 1.U(1.W)
      cam_in(i).bits.wb        := 0.U(1.W)
      cam_in(i).bits.tag       := cam_write_tag
      cam_in(i).bits.rd        := nonblock_load_rd
    }.elsewhen(cam_inv_reset_val(i).asBool || (i0_wen_r.asBool && (r_d_in.bits.i0rd === cam(i).bits.rd) && cam(i).bits.wb.asBool)){
      cam_in(i).valid := 0.U
    }.otherwise{
      cam_in(i)      := cam(i)
    }
    when(nonblock_load_valid_m_delay===1.U && (io.dctl_busbuff.lsu_nonblock_load_inv_tag_r === cam(i).bits.tag) && cam(i).valid===1.U){
      cam_in(i).bits.wb := 1.U
    }
    // force debug halt forces cam valids to 0; highest priority
    when(io.dec_tlu_force_halt){
      cam_in(i).valid := 0.U
    }

    cam_raw(i):=withClock(io.free_clk){RegNext(cam_in(i),0.U.asTypeOf(cam(0)))}
    nonblock_load_write(i) := (load_data_tag === cam_raw(i).bits.tag) & cam_raw(i).valid
  }

  io.dec_nonblock_load_waddr:=0.U(5.W)
  // cancel if any younger inst (including another nonblock) committing this cycle
  val nonblock_load_cancel = ((r_d_in.bits.i0rd === io.dec_nonblock_load_waddr) & i0_wen_r)
  io.dec_nonblock_load_wen := (io.dctl_busbuff.lsu_nonblock_load_data_valid && nonblock_load_write.reduce(_|_).asBool && !nonblock_load_cancel)
  val i0_nonblock_boundary_stall = ((nonblock_load_rd===i0r.rs1) & io.dctl_busbuff.lsu_nonblock_load_valid_m & io.decode_exu.dec_i0_rs1_en_d)|((nonblock_load_rd===i0r.rs2) & io.dctl_busbuff.lsu_nonblock_load_valid_m & io.decode_exu.dec_i0_rs2_en_d)

  i0_nonblock_load_stall := i0_nonblock_boundary_stall

  val cal_temp= for(i <-0 until LSU_NUM_NBLOAD) yield ((Fill(5,nonblock_load_write(i)) & cam(i).bits.rd), io.decode_exu.dec_i0_rs1_en_d & cam(i).valid & (cam(i).bits.rd === i0r.rs1), io.decode_exu.dec_i0_rs2_en_d & cam(i).valid & (cam(i).bits.rd === i0r.rs2))
  val (waddr, ld_stall_1, ld_stall_2) = (cal_temp.map(_._1).reduce(_|_) , cal_temp.map(_._2).reduce(_|_), cal_temp.map(_._3).reduce(_|_) )
  io.dec_nonblock_load_waddr:=waddr
  i0_nonblock_load_stall:=ld_stall_1 | ld_stall_2 | i0_nonblock_boundary_stall
  //i0_nonblock_load_stall:=ld_stall_2

  // end non block load cam logic

  // pmu start

  val csr_read = csr_ren_qual_d
  val csr_write = io.dec_csr_wen_unq_d
  val i0_br_unpred = i0_dp.jal & !i0_predict_br

  // the classes must be mutually exclusive with one another
  import inst_pkt_t._
  d_t.pmu_i0_itype  :=Fill(4,i0_legal_decode_d) & MuxCase(NULL ,Array(
    i0_dp.jal     -> JAL,
    i0_dp.condbr     -> CONDBR,
    i0_dp.mret      -> MRET,
    i0_dp.fence_i    -> FENCEI,
    i0_dp.fence     -> FENCE,
    i0_dp.ecall     -> ECALL,
    i0_dp.ebreak     -> EBREAK,
    ( csr_read &  csr_write).asBool  -> CSRRW,
    (!csr_read &  csr_write).asBool  -> CSRWRITE,
    ( csr_read & !csr_write).asBool    -> CSRREAD,
    i0_dp.pm_alu    -> ALU,
    i0_dp.store      -> STORE,
    i0_dp.load     -> LOAD,
    i0_dp.mul       -> MUL))
  // end pmu

  val  i0_dec =Module(new dec_dec_ctl)
  i0_dec.io.ins:= i0
  i0_dp_raw:=i0_dec.io.out

  lsu_idle:=withClock(io.active_clk){RegNext(io.lsu_idle_any,0.U)}

  // can't make this clock active_clock
  leak1_i1_stall_in := (io.dec_tlu_flush_leak_one_r | (leak1_i1_stall & !io.dec_tlu_flush_lower_r))
  leak1_i1_stall    := withClock(data_gate_clk){RegNext(leak1_i1_stall_in,0.U)}
  leak1_mode := leak1_i1_stall
  leak1_i0_stall_in := ((io.dec_aln.dec_i0_decode_d & leak1_i1_stall) | (leak1_i0_stall & !io.dec_tlu_flush_lower_r))
  leak1_i0_stall    := withClock(data_gate_clk){RegNext(leak1_i0_stall_in,0.U)}

  // 12b jal's can be predicted - these are calls

  val  i0_pcall_imm = Cat(i0(31),i0(19,12),i0(20),i0(30,21))
  val  i0_pcall_12b_offset = Mux(i0_pcall_imm(11).asBool, i0_pcall_imm(19,12) === 0xff.U , i0_pcall_imm(19,12) === 0.U(8.W))
  val  i0_pcall_case    = i0_pcall_12b_offset & i0_dp_raw.imm20 &  (i0r.rd === 1.U(5.W) | i0r.rd === 5.U(5.W))
  val  i0_pja_case      = i0_pcall_12b_offset & i0_dp_raw.imm20 & !(i0r.rd === 1.U(5.W) | i0r.rd === 5.U(5.W))
  i0_pcall_raw     := i0_dp_raw.jal  &   i0_pcall_case   // this includes ja
  i0_pcall         := i0_dp.jal      &   i0_pcall_case
  i0_pja_raw       := i0_dp_raw.jal  &   i0_pja_case
  i0_pja           := i0_dp.jal      &   i0_pja_case
  i0_br_offset     := Mux((i0_pcall_raw | i0_pja_raw).asBool, i0_pcall_imm(11,0) , Cat(i0(31),i0(7),i0(30,25),i0(11,8)))
  // jalr with rd==0, rs1==1 or rs1==5 is a ret
  val i0_pret_case = (i0_dp_raw.jal & i0_dp_raw.imm12 & (i0r.rd === 0.U(5.W)) & (i0r.rs1===1.U(5.W) | i0r.rs1 === 5.U(5.W)))
  i0_pret_raw := i0_dp_raw.jal &   i0_pret_case
  i0_pret     := i0_dp.jal     &   i0_pret_case
  i0_jal      := i0_dp.jal     &  !i0_pcall_case & !i0_pja_case & !i0_pret_case
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////

  io.dec_div.div_p.valid    :=  div_decode_d
  io.dec_div.div_p.bits.unsign   :=  i0_dp.unsign
  io.dec_div.div_p.bits.rem      :=  i0_dp.rem

  io.decode_exu.mul_p.valid    :=  mul_decode_d
  io.decode_exu.mul_p.bits.rs1_sign :=  i0_dp.rs1_sign
  io.decode_exu.mul_p.bits.rs2_sign :=  i0_dp.rs2_sign
  io.decode_exu.mul_p.bits.low      :=  i0_dp.low

  io.decode_exu.dec_extint_stall := withClock(data_gate_clk){RegNext(io.dec_tlu_flush_extint,0.U)}

  io.lsu_p := 0.U.asTypeOf(io.lsu_p)
  when (io.decode_exu.dec_extint_stall){
    io.lsu_p.bits.load      := 1.U(1.W)
    io.lsu_p.bits.word      := 1.U(1.W)
    io.lsu_p.bits.fast_int  := 1.U(1.W)
    io.lsu_p.valid     := 1.U(1.W)
  }.otherwise {
    io.lsu_p.valid                := lsu_decode_d
    io.lsu_p.bits.load                 := i0_dp.load
    io.lsu_p.bits.store                := i0_dp.store
    io.lsu_p.bits.by                   := i0_dp.by
    io.lsu_p.bits.half                 := i0_dp.half
    io.lsu_p.bits.word                 := i0_dp.word
    io.lsu_p.bits.load_ldst_bypass_d   := load_ldst_bypass_d
    io.lsu_p.bits.store_data_bypass_d  := store_data_bypass_d
    io.lsu_p.bits.store_data_bypass_m  := store_data_bypass_m
    io.lsu_p.bits.unsign               := i0_dp.unsign
  }

  //////////////////////////////////////
  io.dec_alu.dec_csr_ren_d  := i0_dp.csr_read //H: assigning csr read enable signal decoded from decode_ctl going as input to EXU
  csr_ren_qual_d := i0_dp.csr_read & i0_legal_decode_d.asBool //csr_ren_qual_d assigned as csr_read above

  val i0_csr_write   = i0_dp.csr_write & !io.dec_debug_fence_d
  val csr_clr_d     =   i0_dp.csr_clr   & i0_legal_decode_d.asBool
  val csr_set_d     = i0_dp.csr_set   & i0_legal_decode_d.asBool
  val csr_write_d   = i0_csr_write    & i0_legal_decode_d.asBool

  i0_csr_write_only_d := i0_csr_write & !i0_dp.csr_read
  io.dec_csr_wen_unq_d := (i0_dp.csr_clr | i0_dp.csr_set | i0_csr_write)   // for csr legal, can't write read-only csr
  //dec_csr_wen_unq_d assigned as csr_write above

  io.dec_csr_rdaddr_d  :=  i0(31,20)
  io.dec_csr_wraddr_r :=  r_d.bits.csrwaddr //r_d is a dest_pkt

  // make sure csr doesn't write same cycle as dec_tlu_flush_lower_wb
  // also use valid so it's flushable
  io.dec_csr_wen_r := r_d.bits.csrwen & r_d.valid & !io.dec_tlu_i0_kill_writeb_r;

  // If we are writing MIE or MSTATUS, hold off the external interrupt for a cycle on the write.
  io.dec_csr_stall_int_ff := ((r_d.bits.csrwaddr === "h300".U) | (r_d.bits.csrwaddr === "h304".U)) & r_d.bits.csrwen & r_d.valid & !io.dec_tlu_i0_kill_writeb_wb;

  val csr_read_x = withClock(io.active_clk){RegNext(csr_ren_qual_d,init=0.B)}
  val csr_clr_x = withClock(io.active_clk){RegNext(csr_clr_d, init=0.B)}
  val csr_set_x = withClock(io.active_clk){RegNext(csr_set_d, init=0.B)}
  val csr_write_x = withClock(io.active_clk){RegNext(csr_write_d, init=0.B)}
  val csr_imm_x = withClock(io.active_clk){RegNext(i0_dp.csr_imm, init=0.U)}

  // perform the update operation if any
  val csrimm_x = rvdffe(i0(19,15),i0_x_data_en.asBool,clock,io.scan_mode)
  val csr_rddata_x = rvdffe(io.dec_csr_rddata_d,i0_x_data_en.asBool,clock,io.scan_mode)

  val csr_mask_x       = Mux1H(Seq(
    csr_imm_x.asBool  ->   Cat(repl(27,0.U),csrimm_x(4,0)),
    !csr_imm_x.asBool ->   io.decode_exu.exu_csr_rs1_x))

  val write_csr_data_x = Mux1H(Seq(
    csr_clr_x   ->  (csr_rddata_x & (~csr_mask_x).asUInt),
    csr_set_x   ->  (csr_rddata_x |  csr_mask_x),
    csr_write_x ->  (                csr_mask_x)))
  // pause instruction
  val clear_pause = (io.dec_tlu_flush_lower_r & !io.dec_tlu_flush_pause_r) | (pause_state & (write_csr_data ===  Cat(Fill(31,0.U),write_csr_data(0))))        // if 0 or 1 then exit pause state - 1 cycle pause
  pause_state_in := (io.dec_tlu_wr_pause_r | pause_state) & !clear_pause
  pause_state := withClock(data_gate_clk){RegNext(pause_state_in, 0.U)}
  io.dec_pause_state := pause_state
  tlu_wr_pause_r1 :=  withClock(data_gate_clk){RegNext(io.dec_tlu_wr_pause_r, 0.U)}
  tlu_wr_pause_r2 :=  withClock(data_gate_clk){RegNext(tlu_wr_pause_r1, 0.U)}
  //pause for clock gating
  io.dec_pause_state_cg := (pause_state & (!tlu_wr_pause_r1 && !tlu_wr_pause_r2))
  // end pause

  val write_csr_data_in = Mux(pause_state,(write_csr_data - 1.U(32.W)),
    Mux(io.dec_tlu_wr_pause_r,io.dec_csr_wrdata_r,write_csr_data_x))
  val csr_data_wen = ((csr_clr_x | csr_set_x | csr_write_x) & csr_read_x) | io.dec_tlu_wr_pause_r | pause_state
  write_csr_data := rvdffe(write_csr_data_in,csr_data_wen,clock,io.scan_mode)

  // will hold until write-back at which time the CSR will be updated while GPR is possibly written with prior CSR
  val pause_stall = pause_state

  // for csr write only data is produced by the alu
  io.dec_csr_wrdata_r  := Mux(r_d.bits.csrwonly.asBool,i0_result_corr_r,write_csr_data)

  val prior_csr_write = x_d.bits.csrwonly | r_d.bits.csrwonly | wbd.bits.csrwonly;

  val debug_fence_i     = io.dec_debug_fence_d & io.dbg_dctl.dbg_cmd_wrdata(0)
  val debug_fence_raw   = io.dec_debug_fence_d & io.dbg_dctl.dbg_cmd_wrdata(1)
  debug_fence       := debug_fence_raw | debug_fence_i

  // some CSR reads need to be presync'd
  val i0_presync = i0_dp.presync | io.dec_tlu_presync_d | debug_fence_i | debug_fence_raw | io.dec_tlu_pipelining_disable  // both fence's presync

  // some CSR writes need to be postsync'd
  val i0_postsync = i0_dp.postsync | io.dec_tlu_postsync_d | debug_fence_i | (i0_csr_write_only_d & (i0(31,20) === "h7c2".U))

  val any_csr_d = i0_dp.csr_read | i0_csr_write
  io.dec_csr_any_unq_d := any_csr_d
  val i0_legal       =  i0_dp.legal & (!any_csr_d | io.dec_csr_legal_d)
  val i0_inst_d      = Mux(io.dec_i0_pc4_d,i0,Cat(repl(16,0.U), io.dec_aln.ifu_i0_cinst))
  // illegal inst handling

  val shift_illegal      = io.dec_aln.dec_i0_decode_d & !i0_legal//lm: valid but not legal
  val illegal_inst_en    = shift_illegal & !illegal_lockout
  io.dec_illegal_inst := rvdffe(i0_inst_d,illegal_inst_en,clock,io.scan_mode)
  illegal_lockout_in := (shift_illegal | illegal_lockout) & !flush_final_r
  illegal_lockout := withClock(data_gate_clk){RegNext(illegal_lockout_in, 0.U)}
  val i0_div_prior_div_stall = i0_dp.div & io.dec_div_active
  //stalls signals
  val i0_block_raw_d = (i0_dp.csr_read & prior_csr_write) | io.decode_exu.dec_extint_stall | pause_stall |
    leak1_i0_stall | io.dec_tlu_debug_stall | postsync_stall | presync_stall  |
    ((i0_dp.fence | debug_fence) & !lsu_idle) | i0_nonblock_load_stall |
    i0_load_block_d | i0_nonblock_div_stall | i0_div_prior_div_stall

  val i0_store_stall_d =  i0_dp.store & (io.lsu_store_stall_any | io.dctl_dma.dma_dccm_stall_any)
  val i0_load_stall_d =   i0_dp.load & (io.lsu_load_stall_any | io.dctl_dma.dma_dccm_stall_any)
  val i0_block_d    = i0_block_raw_d | i0_store_stall_d | i0_load_stall_d
  val i0_exublock_d = i0_block_raw_d

  //decode valid
  io.dec_aln.dec_i0_decode_d := io.dec_ib0_valid_d & !i0_block_d    & !io.dec_tlu_flush_lower_r & !flush_final_r
  val i0_exudecode_d  = io.dec_ib0_valid_d & !i0_exublock_d & !io.dec_tlu_flush_lower_r & !flush_final_r
  val i0_exulegal_decode_d = i0_exudecode_d  & i0_legal

  // performance monitor signals
  io.dec_pmu_instr_decoded := io.dec_aln.dec_i0_decode_d
  io.dec_pmu_decode_stall := io.dec_ib0_valid_d & !io.dec_aln.dec_i0_decode_d
  io.dec_pmu_postsync_stall := postsync_stall.asBool
  io.dec_pmu_presync_stall  := presync_stall.asBool

  val prior_inflight_x    =  x_d.valid
  val prior_inflight_wb   =  r_d.valid
  val prior_inflight = prior_inflight_x | prior_inflight_wb
  val prior_inflight_eff = Mux(i0_dp.div,prior_inflight_x,prior_inflight)

  presync_stall      := (i0_presync & prior_inflight_eff)
  postsync_stall := withClock(data_gate_clk){RegNext(ps_stall_in, 0.U)}
  // illegals will postsync
  ps_stall_in :=  (io.dec_aln.dec_i0_decode_d & (i0_postsync | !i0_legal) ) | ( postsync_stall & prior_inflight_x)

  io.dec_alu.dec_i0_alu_decode_d := i0_exulegal_decode_d & i0_dp.alu

  lsu_decode_d := i0_legal_decode_d    & i0_dp.lsu
  mul_decode_d := i0_exulegal_decode_d & i0_dp.mul
  div_decode_d := i0_exulegal_decode_d & i0_dp.div

  io.dec_tlu_i0_valid_r     :=  r_d.valid & !io.dec_tlu_flush_lower_wb

  //traps for TLU (tlu stuff)
  d_t.legal              :=  i0_legal_decode_d
  d_t.icaf               :=  i0_icaf_d & i0_legal_decode_d            // dbecc is icaf exception
  d_t.icaf_f1            :=  io.dec_i0_icaf_f1_d & i0_legal_decode_d     // this includes icaf and dbecc
  d_t.icaf_type          :=  io.dec_i0_icaf_type_d

  d_t.fence_i            := (i0_dp.fence_i | debug_fence_i) & i0_legal_decode_d

  // put pmu info into the trap packet
  d_t.pmu_i0_br_unpred   :=  i0_br_unpred
  d_t.pmu_divide         :=  0.U(1.W)
  d_t.pmu_lsu_misaligned :=  0.U(1.W)

  d_t.i0trigger          :=  io.dec_i0_trigger_match_d & repl(4,io.dec_aln.dec_i0_decode_d)


  x_t := rvdffe(d_t,i0_x_ctl_en.asBool,clock,io.scan_mode)

  x_t_in := x_t
  x_t_in.i0trigger := x_t.i0trigger & ~(repl(4,io.dec_tlu_flush_lower_wb))

  r_t := rvdffe(x_t_in,i0_x_ctl_en.asBool,clock,io.scan_mode)
  val lsu_trigger_match_r = RegNext(io.lsu_trigger_match_m, 0.U)
  val lsu_pmu_misaligned_r = RegNext(io.lsu_pmu_misaligned_m, 0.U)

  r_t_in :=  r_t

  r_t_in.i0trigger              := (repl(4,(r_d.bits.i0load | r_d.bits.i0store)) & lsu_trigger_match_r) | r_t.i0trigger
  r_t_in.pmu_lsu_misaligned     := lsu_pmu_misaligned_r   // only valid if a load/store is valid in DC3 stage

  when (io.dec_tlu_flush_lower_wb.asBool) {r_t_in := 0.U.asTypeOf(r_t_in) }

  io.dec_tlu_packet_r                 :=  r_t_in
  io.dec_tlu_packet_r.pmu_divide      :=  r_d.bits.i0div & r_d.valid
  // end tlu stuff

  flush_final_r := withClock(data_gate_clk){RegNext(io.exu_flush_final, 0.U)}

  io.dec_aln.dec_i0_decode_d := io.dec_ib0_valid_d & !i0_block_d & !io.dec_tlu_flush_lower_r & !flush_final_r

  i0r.rs1 := i0(19,15) //H: assigning reg packets the instructions bits
  i0r.rs2 := i0(24,20)
  i0r.rd  := i0(11,7)

  io.decode_exu.dec_i0_rs1_en_d   :=  i0_dp.rs1 & (i0r.rs1 =/= 0.U(5.W))  // if rs1_en=0 then read will be all 0's
  io.decode_exu.dec_i0_rs2_en_d   :=  i0_dp.rs2 & (i0r.rs2 =/= 0.U(5.W))
  val i0_rd_en_d       =  i0_dp.rd  & (i0r.rd  =/= 0.U(5.W))
  io.dec_i0_rs1_d :=  i0r.rs1//H:assiging packets to output signals leading to gprfile
  io.dec_i0_rs2_d :=  i0r.rs2

  val i0_jalimm20       =  i0_dp.jal & i0_dp.imm20   // H:jal (used at line 915)
  val i0_uiimm20        = !i0_dp.jal & i0_dp.imm20

  io.decode_exu.dec_i0_immed_d := Mux1H(Seq(
    i0_dp.csr_read -> io.dec_csr_rddata_d,
    !i0_dp.csr_read -> i0_immed_d))

  i0_immed_d := Mux1H(Seq(
    i0_dp.imm12  ->    Cat(repl(20,i0(31)),i0(31,20)),  // jalr
    i0_dp.shimm5 ->    Cat(repl(27,0.U),i0(24,20)),
    i0_jalimm20  ->    Cat(repl(12,i0(31)),i0(19,12),i0(20),i0(30,21),0.U),
    i0_uiimm20   ->    Cat(i0(31,12),repl(12,0.U)),
    (i0_csr_write_only_d & i0_dp.csr_imm).asBool -> Cat(repl(27,0.U),i0(19,15))))  // for csr's that only write

  i0_legal_decode_d    := io.dec_aln.dec_i0_decode_d & i0_legal

  i0_d_c.mul                :=  i0_dp.mul  & i0_legal_decode_d
  i0_d_c.load               :=  i0_dp.load & i0_legal_decode_d
  i0_d_c.alu                :=  i0_dp.alu  & i0_legal_decode_d

  val i0_x_c = withClock(io.active_clk){RegEnable(i0_d_c, i0_x_ctl_en.asBool)}
  val i0_r_c = withClock(io.active_clk){RegEnable(i0_x_c, i0_r_ctl_en.asBool)}
  i0_pipe_en := Cat(io.dec_aln.dec_i0_decode_d,withClock(io.active_clk){RegNext(i0_pipe_en(3,1), init=0.U)})

  i0_x_ctl_en               := (i0_pipe_en(3,2).orR | io.clk_override)
  i0_r_ctl_en               := (i0_pipe_en(2,1).orR | io.clk_override)
  i0_wb_ctl_en              := (i0_pipe_en(1,0).orR | io.clk_override)
  i0_x_data_en              := ( i0_pipe_en(3)   | io.clk_override)
  i0_r_data_en              := ( i0_pipe_en(2)   | io.clk_override)
  i0_wb_data_en             := ( i0_pipe_en(1)   | io.clk_override)
  i0_wb1_data_en            := ( i0_pipe_en(0)   | io.clk_override)

  io.decode_exu.dec_data_en          := Cat(i0_x_data_en, i0_r_data_en)
  io.decode_exu.dec_ctl_en           := Cat(i0_x_ctl_en,  i0_r_ctl_en)

  d_d.bits.i0rd                  :=  i0r.rd
  d_d.bits.i0v                   :=  i0_rd_en_d  & i0_legal_decode_d
  d_d.valid               :=  io.dec_aln.dec_i0_decode_d  // has flush_final_r

  d_d.bits.i0load                :=  i0_dp.load  & i0_legal_decode_d
  d_d.bits.i0store               :=  i0_dp.store & i0_legal_decode_d
  d_d.bits.i0div                 :=  i0_dp.div   & i0_legal_decode_d

  d_d.bits.csrwen                :=  io.dec_csr_wen_unq_d   & i0_legal_decode_d
  d_d.bits.csrwonly              :=  i0_csr_write_only_d & io.dec_aln.dec_i0_decode_d
  d_d.bits.csrwaddr              :=  i0(31,20)

  x_d := rvdffe(d_d, i0_x_ctl_en.asBool,clock,io.scan_mode)
  val x_d_in = Wire(Valid(new dest_pkt_t))
  x_d_in := x_d
  x_d_in.bits.i0v         := x_d.bits.i0v     & !io.dec_tlu_flush_lower_wb & !io.dec_tlu_flush_lower_r
  x_d_in.valid     := x_d.valid & !io.dec_tlu_flush_lower_wb & !io.dec_tlu_flush_lower_r

  r_d := rvdffe(x_d_in,i0_r_ctl_en.asBool,clock,io.scan_mode)
  r_d_in := r_d
  r_d_in.bits.i0rd   :=  r_d.bits.i0rd

  r_d_in.bits.i0v         := (r_d.bits.i0v      & !io.dec_tlu_flush_lower_wb)
  r_d_in.valid     := (r_d.valid  & !io.dec_tlu_flush_lower_wb)
  r_d_in.bits.i0load      :=  r_d.bits.i0load   & !io.dec_tlu_flush_lower_wb
  r_d_in.bits.i0store     :=  r_d.bits.i0store  & !io.dec_tlu_flush_lower_wb

  wbd := rvdffe(r_d_in,i0_wb_ctl_en.asBool,clock,io.scan_mode)

  io.dec_i0_waddr_r       :=  r_d_in.bits.i0rd
  i0_wen_r              :=  r_d_in.bits.i0v & !io.dec_tlu_i0_kill_writeb_r
  io.dec_i0_wen_r              :=  i0_wen_r   & !r_d_in.bits.i0div & !i0_load_kill_wen_r  // don't write a nonblock load 1st time down the pipe
  io.dec_i0_wdata_r      :=  i0_result_corr_r

  val i0_result_r_raw = rvdffe(i0_result_x,i0_r_data_en.asBool,clock,io.scan_mode)
  if ( LOAD_TO_USE_PLUS1 == 1 ) {
    i0_result_x         := io.decode_exu.exu_i0_result_x
    i0_result_r         := Mux((r_d.bits.i0v & r_d.bits.i0load).asBool,io.lsu_result_m, i0_result_r_raw)
  }
  else {
    i0_result_x          := Mux((x_d.bits.i0v & x_d.bits.i0load).asBool,io.lsu_result_m,io.decode_exu.exu_i0_result_x)
    i0_result_r          := i0_result_r_raw
  }

  // correct lsu load data - don't use for bypass, do pass down the pipe
  i0_result_corr_r  := Mux((r_d.bits.i0v & r_d.bits.i0load).asBool,io.lsu_result_corr_r,i0_result_r_raw)
  io.dec_alu.dec_i0_br_immed_d := Mux((io.decode_exu.i0_ap.predict_nt & !i0_dp.jal).asBool,i0_br_offset,Cat(repl(10,0.U),i0_ap_pc4,i0_ap_pc2))
  val last_br_immed_d = WireInit(UInt(12.W),0.U)
  last_br_immed_d := Mux((io.decode_exu.i0_ap.predict_nt).asBool,Cat(repl(10,0.U),i0_ap_pc4,i0_ap_pc2),i0_br_offset)
  val last_br_immed_x  = WireInit(UInt(12.W),0.U)
  last_br_immed_x := rvdffe(last_br_immed_d,i0_x_data_en.asBool,clock,io.scan_mode)

  // divide stuff

  val div_e1_to_r         = (x_d.bits.i0div & x_d.valid) | (r_d.bits.i0div & r_d.valid)

  val div_flush              = (x_d.bits.i0div & x_d.valid & (x_d.bits.i0rd === 0.U(5.W)))   |
    (x_d.bits.i0div & x_d.valid & io.dec_tlu_flush_lower_r ) |
    (r_d.bits.i0div & r_d.valid & io.dec_tlu_flush_lower_r & io.dec_tlu_i0_kill_writeb_r)

  // cancel if any younger inst committing this cycle to same dest as nonblock divide

  val nonblock_div_cancel    = (io.dec_div_active &  div_flush) |
    (io.dec_div_active & !div_e1_to_r & (r_d.bits.i0rd === io.div_waddr_wb) & i0_wen_r)

  io.dec_div.dec_div_cancel         :=  nonblock_div_cancel.asBool
  val i0_div_decode_d            =  i0_legal_decode_d & i0_dp.div

  val div_active_in = i0_div_decode_d | (io.dec_div_active & !io.exu_div_wren & !nonblock_div_cancel)

  io.dec_div_active := withClock(io.free_clk){RegNext(div_active_in, 0.U)}

  // nonblocking div scheme
  i0_nonblock_div_stall  := (io.decode_exu.dec_i0_rs1_en_d & io.dec_div_active & (io.div_waddr_wb === i0r.rs1)) |
    (io.decode_exu.dec_i0_rs2_en_d & io.dec_div_active & (io.div_waddr_wb === i0r.rs2))

  io.div_waddr_wb := RegEnable(i0r.rd,0.U,i0_div_decode_d.asBool)
  ///div end

  //for tracing instruction
  val i0_wb_en                   =  i0_wb_data_en
  val i0_wb1_en                  =  i0_wb1_data_en

  val div_inst = rvdffe(i0_inst_d(24,7),i0_div_decode_d.asBool,clock,io.scan_mode)
  val i0_inst_x = rvdffe(i0_inst_d,i0_x_data_en.asBool,clock,io.scan_mode)
  val i0_inst_r = rvdffe(i0_inst_x,i0_r_data_en.asBool,clock,io.scan_mode)
  val i0_inst_wb_in    =  i0_inst_r
  val i0_inst_wb = rvdffe(i0_inst_wb_in,i0_wb_en.asBool,clock,io.scan_mode)
  io.dec_i0_inst_wb1 := rvdffe(i0_inst_wb,i0_wb1_en.asBool,clock,io.scan_mode)
  val i0_pc_wb = rvdffe(io.dec_tlu_i0_pc_r,i0_wb_en.asBool,clock,io.scan_mode)

  io.dec_i0_pc_wb1 := rvdffe(i0_pc_wb,i0_wb1_en.asBool,clock,io.scan_mode)
  val dec_i0_pc_r = rvdffe(io.dec_alu.exu_i0_pc_x,i0_r_data_en.asBool,clock,io.scan_mode)

  io.dec_tlu_i0_pc_r      := dec_i0_pc_r

  //end tracing

  val temp_pred_correct_npc_x  = rvbradder(Cat(io.dec_alu.exu_i0_pc_x,0.U),Cat(last_br_immed_x,0.U))
  io.decode_exu.pred_correct_npc_x := temp_pred_correct_npc_x(31,1)

  // scheduling logic for primary alu's

  val i0_rs1_depend_i0_x  = io.decode_exu.dec_i0_rs1_en_d & x_d.bits.i0v & (x_d.bits.i0rd === i0r.rs1)
  val i0_rs1_depend_i0_r  = io.decode_exu.dec_i0_rs1_en_d & r_d.bits.i0v & (r_d.bits.i0rd === i0r.rs1)

  val i0_rs2_depend_i0_x  = io.decode_exu.dec_i0_rs2_en_d & x_d.bits.i0v & (x_d.bits.i0rd === i0r.rs2)
  val i0_rs2_depend_i0_r  = io.decode_exu.dec_i0_rs2_en_d & r_d.bits.i0v & (r_d.bits.i0rd === i0r.rs2)
  // order the producers as follows:  , i0_x, i0_r, i0_wb
  i0_rs1_class_d := Mux(i0_rs1_depend_i0_x.asBool,i0_x_c,Mux(i0_rs1_depend_i0_r.asBool, i0_r_c, 0.U.asTypeOf(i0_rs1_class_d)))
  i0_rs1_depth_d := Mux(i0_rs1_depend_i0_x.asBool,1.U(2.W),Mux(i0_rs1_depend_i0_r.asBool, 2.U(2.W), 0.U))
  i0_rs2_class_d := Mux(i0_rs2_depend_i0_x.asBool,i0_x_c,Mux(i0_rs2_depend_i0_r.asBool, i0_r_c, 0.U.asTypeOf(i0_rs2_class_d)))
  i0_rs2_depth_d := Mux(i0_rs2_depend_i0_x.asBool,1.U(2.W),Mux(i0_rs2_depend_i0_r.asBool, 2.U(2.W), 0.U))

  // stores will bypass load data in the lsu pipe
  if (LOAD_TO_USE_PLUS1 == 1) {
    i0_load_block_d  := (i0_rs1_class_d.load & i0_rs1_depth_d) | (i0_rs2_class_d.load & i0_rs2_depth_d(0) & !i0_dp.store)
    load_ldst_bypass_d := (i0_dp.load | i0_dp.store) & i0_rs1_depth_d(1) & i0_rs1_class_d.load
    store_data_bypass_d := i0_dp.store & (i0_rs2_depth_d(1) & i0_rs2_class_d.load)
    store_data_bypass_m := i0_dp.store & (i0_rs2_depth_d(0) & i0_rs2_class_d.load)
  }
  else {
    i0_load_block_d := 0.B
    load_ldst_bypass_d    :=  (i0_dp.load | i0_dp.store) & i0_rs1_depth_d(0) & i0_rs1_class_d.load
    store_data_bypass_d :=   i0_dp.store  & i0_rs2_depth_d(0) & i0_rs2_class_d.load
    store_data_bypass_m := 0.B
  }
  // add nonblock load rs1/rs2 bypass cases

  val i0_rs1_nonblock_load_bypass_en_d  = io.decode_exu.dec_i0_rs1_en_d & io.dec_nonblock_load_wen & (io.dec_nonblock_load_waddr === i0r.rs1)

  val i0_rs2_nonblock_load_bypass_en_d  = io.decode_exu.dec_i0_rs2_en_d & io.dec_nonblock_load_wen & (io.dec_nonblock_load_waddr === i0r.rs2)

  // bit 2 is priority match, bit 0 lowest priority	, i0_x, i0_r
  i0_rs1bypass   :=  Cat((i0_rs1_depth_d(0) &(i0_rs1_class_d.alu | i0_rs1_class_d.mul)),(i0_rs1_depth_d(0) & (i0_rs1_class_d.load)), (i0_rs1_depth_d(1) & (i0_rs1_class_d.alu | i0_rs1_class_d.mul | i0_rs1_class_d.load)))

  i0_rs2bypass   :=  Cat((i0_rs2_depth_d(0) & (i0_rs2_class_d.alu | i0_rs2_class_d.mul)),(i0_rs2_depth_d(0) & (i0_rs2_class_d.load)),(i0_rs2_depth_d(1) & (i0_rs2_class_d.alu | i0_rs2_class_d.mul | i0_rs2_class_d.load)))

  io.decode_exu.dec_i0_rs1_bypass_en_d      :=  Cat(i0_rs1bypass(2),(i0_rs1bypass(1) | i0_rs1bypass(0) | (!i0_rs1bypass(2) & i0_rs1_nonblock_load_bypass_en_d)))
  io.decode_exu.dec_i0_rs2_bypass_en_d      :=  Cat(i0_rs2bypass(2),(i0_rs2bypass(1) | i0_rs2bypass(0) | (!i0_rs2bypass(2) & i0_rs2_nonblock_load_bypass_en_d)))


  io.decode_exu.dec_i0_rs1_bypass_data_d := Mux1H(Seq(
    i0_rs1bypass(1).asBool -> io.lsu_result_m,
    i0_rs1bypass(0).asBool -> i0_result_r,
    (!i0_rs1bypass(1) & !i0_rs1bypass(0) & i0_rs1_nonblock_load_bypass_en_d).asBool -> io.dctl_busbuff.lsu_nonblock_load_data,
  ))
  io.decode_exu.dec_i0_rs2_bypass_data_d := Mux1H(Seq(
    i0_rs2bypass(1).asBool -> io.lsu_result_m,
    i0_rs2bypass(0).asBool -> i0_result_r,
    (!i0_rs2bypass(1) & !i0_rs2bypass(0) & i0_rs2_nonblock_load_bypass_en_d).asBool -> io.dctl_busbuff.lsu_nonblock_load_data,
  ))
  io.dec_lsu_valid_raw_d := ((io.dec_ib0_valid_d & (i0_dp_raw.load | i0_dp_raw.store) & !io.dctl_dma.dma_dccm_stall_any & !i0_block_raw_d) | io.decode_exu.dec_extint_stall)
  io.dec_lsu_offset_d := Mux1H(Seq(
    (!io.decode_exu.dec_extint_stall & i0_dp.lsu & i0_dp.load).asBool  ->     i0(31,20),
    (!io.decode_exu.dec_extint_stall & i0_dp.lsu & i0_dp.store).asBool ->     Cat(i0(31,25),i0(11,7))))
}