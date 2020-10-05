package ifu
import include._
import lib._
import chisel3._
import chisel3.util._

class el2_ifu_bp_ctl extends Module with el2_lib {
  val io = IO (new Bundle {
    val active_clk = Input(Clock())
    val ic_hit_f = Input(Bool())
    val ifc_fetch_addr_f = Input(UInt(31.W))
    val ifc_fetch_req_f = Input(Bool())           // Fetch request generated by the IFC
    // Decode packet containing information if its a brnach or not
    val dec_tlu_br0_r_pkt = Input(new el2_br_tlu_pkt_t)
    val exu_i0_br_fghr_r = Input(UInt(BHT_GHR_SIZE.W)) // Updated GHR from the exu
    val exu_i0_br_index_r = Input(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W)) // Way from where the btb got a hit
    val dec_tlu_flush_lower_wb = Input(Bool())
    val dec_tlu_flush_leak_one_wb = Input(Bool())
    val dec_tlu_bpred_disable = Input(Bool())
    // Exu misprediction packet
    val exu_mp_pkt = Input(new el2_predict_pkt_t)
    val exu_mp_eghr = Input(UInt(BHT_GHR_SIZE.W))
    val exu_mp_fghr = Input(UInt(BHT_GHR_SIZE.W))
    val exu_mp_index = Input(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W)) // Misprediction index
    val exu_mp_btag = Input(UInt(BTB_BTAG_SIZE.W))
    val exu_flush_final = Input(Bool())

    val ifu_bp_hit_taken_f = Output(Bool())
    val ifu_bp_btb_target_f = Output(UInt(31.W))
    val ifu_bp_inst_mask_f = Output(Bool())
    val ifu_bp_fghr_f = Output(UInt(BHT_GHR_SIZE.W))
    val ifu_bp_way_f = Output(UInt(2.W))
    val ifu_bp_ret_f = Output(UInt(2.W))
    val ifu_bp_hist1_f = Output(UInt(2.W))
    val ifu_bp_hist0_f = Output(UInt(2.W))
    val ifu_bp_pc4_f = Output(UInt(2.W))
    val ifu_bp_valid_f = Output(UInt(2.W))
    val ifu_bp_poffset_f = Output(UInt(12.W))

    val test_hash = Output(UInt())
    val test_hash_p1 = Output(UInt())
  })

  val TAG_START = 16+BTB_BTAG_SIZE
  val PC4 = 4
  val BOFF = 3
  val CALL = 2
  val RET = 1
  val BV = 0

  val LRU_SIZE = BTB_ARRAY_DEPTH
  val NUM_BHT_LOOP = if(BHT_ARRAY_DEPTH > 16) 16 else BHT_ARRAY_DEPTH
  val NUM_BHT_LOOP_INNER_HI = if(BHT_ARRAY_DEPTH > 16) BHT_ADDR_LO+3 else BHT_ADDR_HI
  val NUM_BHT_LOOP_OUTER_LO = if(BHT_ARRAY_DEPTH > 16) BHT_ADDR_LO+4 else BHT_ADDR_LO
  val BHT_NO_ADDR_MATCH = BHT_ARRAY_DEPTH <= 16
  /////////////////////////////////////////////////////////
  val leak_one_f = WireInit(Bool(), 0.U)
  val bht_dir_f = WireInit(UInt(2.W), 0.U)
  val dec_tlu_error_wb = WireInit(Bool(), 0.U)
  val btb_error_addr_wb = WireInit(UInt((BTB_ADDR_HI-BTB_ADDR_LO).W), 0.U)
  val btb_bank0_rd_data_way0_f = WireInit(UInt((TAG_START+1).W), 0.U)
  val btb_bank0_rd_data_way1_f = WireInit(UInt((TAG_START+1).W), 0.U)
  val btb_bank0_rd_data_way0_p1_f = WireInit(UInt((TAG_START+1).W), 0.U)
  val btb_bank0_rd_data_way1_p1_f = WireInit(UInt((TAG_START+1).W), 0.U)
  val eoc_mask = WireInit(Bool(), 0.U)
  val btb_lru_b0_f = WireInit(UInt(LRU_SIZE.W), init = 0.U)
  val dec_tlu_way_wb = WireInit(Bool(), 0.U)
  /////////////////////////////////////////////////////////
  // Misprediction packet
  val exu_mp_valid    = io.exu_mp_pkt.misp & !leak_one_f
  val exu_mp_boffset  = io.exu_mp_pkt.boffset
  val exu_mp_pc4      = io.exu_mp_pkt.pc4
  val exu_mp_call     = io.exu_mp_pkt.pcall
  val exu_mp_ret      = io.exu_mp_pkt.pret
  val exu_mp_ja       = io.exu_mp_pkt.pja
  val exu_mp_way      = io.exu_mp_pkt.way
  val exu_mp_hist     = io.exu_mp_pkt.hist
  val exu_mp_tgt      = io.exu_mp_pkt.toffset
  val exu_mp_addr     = io.exu_mp_index
  val exu_mp_ataken   = io.exu_mp_pkt.ataken

  // Its a commit or update packet
  val dec_tlu_br0_v_wb            = io.dec_tlu_br0_r_pkt.valid
  val dec_tlu_br0_hist_wb         = io.dec_tlu_br0_r_pkt.hist
  val dec_tlu_br0_addr_wb         = io.exu_i0_br_index_r
  val dec_tlu_br0_error_wb        = io.dec_tlu_br0_r_pkt.br_error
  val dec_tlu_br0_middle_wb       = io.dec_tlu_br0_r_pkt.middle
  val dec_tlu_br0_way_wb          = io.dec_tlu_br0_r_pkt.way
  val dec_tlu_br0_start_error_wb  = io.dec_tlu_br0_r_pkt.br_start_error
  val exu_i0_br_fghr_wb           = io.exu_i0_br_fghr_r

  // Hash the first PC
  val btb_rd_addr_f = el2_btb_addr_hash(io.ifc_fetch_addr_f)
  io.test_hash := btb_rd_addr_f
  // Second pc = pc +4
  val fetch_addr_p1_f = io.ifc_fetch_addr_f(30,1) + 1.U
  // Hash the second pc
  val btb_rd_addr_p1_f = el2_btb_addr_hash(Cat(fetch_addr_p1_f,0.U))
  io.test_hash_p1 := btb_rd_addr_p1_f
  // TODO
  val btb_sel_f = Cat(~bht_dir_f(0),bht_dir_f(0))

  // Checking of the pc is a multiple of 4, if it is fetch-start will be "01"
  val fetch_start_f = Cat(io.ifc_fetch_addr_f(0),~io.ifc_fetch_addr_f(0))

  // If there is an error write-back from the dec check if the current pc is equal to the write-bcak pc
  val branch_error_collision_f = dec_tlu_error_wb & (btb_error_addr_wb === btb_rd_addr_f)
  val branch_error_collision_p1_f = dec_tlu_error_wb & (btb_error_addr_wb === btb_rd_addr_p1_f)

  // If there is an error write back but the address are from different bank
  val branch_error_bank_conflict_f = branch_error_collision_f & dec_tlu_error_wb
  val branch_error_bank_conflict_p1_f = branch_error_collision_p1_f & dec_tlu_error_wb

  val fetch_rd_tag_f = if(BTB_BTAG_FOLD) el2_btb_tag_hash_fold(io.ifc_fetch_addr_f) else el2_btb_tag_hash(io.ifc_fetch_addr_f)
  val fetch_rd_tag_p1_f = if(BTB_BTAG_FOLD) el2_btb_tag_hash_fold(fetch_addr_p1_f) else el2_btb_tag_hash(fetch_addr_p1_f)
  // There is a misprediction and the exu is writing back
  val fetch_mp_collision_f = (io.exu_mp_btag === fetch_rd_tag_f) & exu_mp_valid & io.ifc_fetch_req_f & (exu_mp_addr === btb_rd_addr_f)
  val fetch_mp_collision_p1_f = (io.exu_mp_btag === fetch_rd_tag_p1_f) & exu_mp_valid & io.ifc_fetch_req_f & (exu_mp_addr === btb_rd_addr_p1_f)

  val leak_one_f_d1 = RegNext(leak_one_f, init = 0.U)
  val dec_tlu_way_wb_f = RegNext(dec_tlu_way_wb, init = 0.U)
  val exu_mp_way_f = RegNext(exu_mp_way, init = 0.U)
  val exu_flush_final_d1 = RegNext(io.exu_flush_final, init = 0.U)
  // TODO
  leak_one_f := (io.dec_tlu_flush_leak_one_wb & io.dec_tlu_flush_lower_wb) | (leak_one_f_d1 & io.dec_tlu_flush_lower_wb)

  // For a tag to match the branch should be valid tag should match and a fetch request should be generated
  val tag_match_way0_f = btb_bank0_rd_data_way0_f(BV) & (btb_bank0_rd_data_way0_f(TAG_START,17) === fetch_rd_tag_f) &
  !(dec_tlu_way_wb_f & branch_error_bank_conflict_f) & io.ifc_fetch_req_f & !leak_one_f

  val tag_match_way1_f = btb_bank0_rd_data_way1_f(BV) & (btb_bank0_rd_data_way1_f(TAG_START,17) === fetch_rd_tag_f) &
  !(dec_tlu_way_wb_f & branch_error_bank_conflict_f) & io.ifc_fetch_req_f & !leak_one_f

  val tag_match_way0_p1_f = btb_bank0_rd_data_way0_p1_f(BV) & (btb_bank0_rd_data_way0_p1_f(TAG_START,17) === fetch_rd_tag_p1_f) &
    !(dec_tlu_way_wb_f & branch_error_bank_conflict_f) & io.ifc_fetch_req_f & !leak_one_f

  val tag_match_way1_p1_f = btb_bank0_rd_data_way1_p1_f(BV) & (btb_bank0_rd_data_way1_p1_f(TAG_START,17) === fetch_rd_tag_p1_f) &
    !(dec_tlu_way_wb_f & branch_error_bank_conflict_f) & io.ifc_fetch_req_f & !leak_one_f

  // Reordering to avoid multiple hit
  val tag_match_way0_expanded_f = Cat(tag_match_way0_f &  (btb_bank0_rd_data_way0_f(BOFF) ^ btb_bank0_rd_data_way0_f(PC4)),
                                      tag_match_way0_f & !(btb_bank0_rd_data_way0_f(BOFF) ^ btb_bank0_rd_data_way0_f(PC4)))

  val tag_match_way1_expanded_f = Cat(tag_match_way1_f &  (btb_bank0_rd_data_way1_f(BOFF) ^ btb_bank0_rd_data_way1_f(PC4)),
                                      tag_match_way1_f & !(btb_bank0_rd_data_way1_f(BOFF) ^ btb_bank0_rd_data_way1_f(PC4)))


  val tag_match_way0_expanded_p1_f = Cat(tag_match_way0_p1_f &  (btb_bank0_rd_data_way0_p1_f(BOFF) ^ btb_bank0_rd_data_way0_p1_f(PC4)),
                                         tag_match_way0_p1_f & !(btb_bank0_rd_data_way0_p1_f(BOFF) ^ btb_bank0_rd_data_way0_p1_f(PC4)))

  val tag_match_way1_expanded_p1_f = Cat(tag_match_way1_p1_f &  (btb_bank0_rd_data_way1_p1_f(BOFF) ^ btb_bank0_rd_data_way1_p1_f(PC4)),
                                         tag_match_way1_p1_f & !(btb_bank0_rd_data_way1_p1_f(BOFF) ^ btb_bank0_rd_data_way1_p1_f(PC4)))

  val wayhit_f = tag_match_way0_expanded_f | tag_match_way1_expanded_f

  val wayhit_p1_f = tag_match_way0_expanded_p1_f | tag_match_way1_expanded_p1_f

  // Chopping off the ways that had a hit
  val btb_bank0e_rd_data_f = Mux1H(Seq(tag_match_way0_expanded_f(0).asBool->btb_bank0_rd_data_way0_f,
    tag_match_way1_expanded_f(0).asBool->btb_bank0_rd_data_way1_f))

  val btb_bank0o_rd_data_f = Mux1H(Seq(tag_match_way0_expanded_f(1).asBool->btb_bank0_rd_data_way0_f,
    tag_match_way1_expanded_f(1).asBool->btb_bank0_rd_data_way1_f))

  val btb_bank0e_rd_data_p1_f = Mux1H(Seq(tag_match_way0_expanded_p1_f(0).asBool->btb_bank0_rd_data_way0_p1_f,
    tag_match_way1_expanded_p1_f(1).asBool->btb_bank0_rd_data_way1_p1_f))

  // Making virtual banks, made bit 1 of the pc to check
  val btb_vbank0_rd_data_f = Mux1H(Seq(!io.ifc_fetch_addr_f(1)->btb_bank0e_rd_data_f,
                                        io.ifc_fetch_addr_f(1)->btb_bank0o_rd_data_f))

  val btb_vbank1_rd_data_f = Mux1H(Seq(!io.ifc_fetch_addr_f(1)->btb_bank0o_rd_data_f,
                                        io.ifc_fetch_addr_f(1)->btb_bank0e_rd_data_p1_f))

  // Implimenting the LRU for a 2-way BTB
  val mp_wrindex_dec = 1.U(LRU_SIZE) << exu_mp_addr

  val fetch_wrindex_dec = 1.U(LRU_SIZE) << btb_rd_addr_f

  val fetch_wrindex_p1_dec = 1.U(LRU_SIZE) << btb_rd_addr_p1_f

  val mp_wrlru_b0 = mp_wrindex_dec & Fill(LRU_SIZE, exu_mp_valid)

  val vwayhit_f = Mux1H(Seq(~io.ifc_fetch_addr_f(0).asBool->wayhit_f,
    io.ifc_fetch_addr_f(0).asBool->Cat(wayhit_p1_f(0), wayhit_f(1)))) & Cat(eoc_mask, 1.U(1.W))

  val lru_update_valid_f = (vwayhit_f(0) | vwayhit_f(1)) & io.ifc_fetch_req_f & !leak_one_f

  val fetch_wrlru_b0 = fetch_wrindex_dec & Fill(fetch_wrindex_dec.getWidth, lru_update_valid_f)
  val fetch_wrlru_p1_b0 = fetch_wrindex_p1_dec & Fill(fetch_wrindex_dec.getWidth, lru_update_valid_f)

  val btb_lru_b0_hold = !mp_wrlru_b0 & !fetch_wrlru_b0
  val use_mp_way = fetch_mp_collision_f
  val use_mp_way_p1 = fetch_mp_collision_p1_f

  val btb_lru_b0_ns = Mux1H(Seq(~exu_mp_way.asBool->mp_wrlru_b0,
                                 tag_match_way0_f.asBool->fetch_wrlru_b0,
                                 tag_match_way0_p1_f.asBool->fetch_wrlru_p1_b0)) | btb_lru_b0_hold & btb_lru_b0_f

  val btb_lru_rd_f = Mux(use_mp_way.asBool, exu_mp_way_f, (fetch_wrindex_dec & btb_lru_b0_f).orR)

  val btb_lru_rd_p1_f = Mux(use_mp_way_p1.asBool, exu_mp_way_f, (fetch_wrindex_p1_dec & btb_lru_b0_f).orR)

  val btb_vlru_rd_f = Mux1H(Seq(!io.ifc_fetch_addr_f(1) -> Cat(btb_lru_rd_f, btb_lru_rd_f),
    io.ifc_fetch_addr_f(1).asBool -> Cat(btb_lru_rd_p1_f, btb_lru_rd_f)))

  val tag_match_vway1_expanded_f = Mux1H(Seq(~io.ifc_fetch_addr_f(1).asBool->tag_match_way1_expanded_f,
    io.ifc_fetch_addr_f(1).asBool->Cat(tag_match_way1_expanded_p1_f(0),tag_match_way1_expanded_f(1))))

  val way_raw = tag_match_vway1_expanded_f | (!vwayhit_f & btb_vlru_rd_f)

  btb_lru_b0_f := RegEnable(btb_lru_b0_ns, init = 0.U, (io.ifc_fetch_req_f|exu_mp_valid).asBool)

  val eoc_near = io.ifc_fetch_addr_f(ICACHE_BEAT_ADDR_HI, 3).andR

  eoc_mask := !eoc_near | (!io.ifc_fetch_addr_f(1,0).orR())

  val btb_sel_data_f = WireInit(UInt(17.W), init = 0.U)
  val hist1_raw = WireInit(UInt(2.W), init = 0.U)
  val btb_rd_tgt_f = btb_sel_data_f(16,5)
  val btb_rd_pc4_f = btb_sel_data_f(4)
  val btb_rd_call_f = btb_sel_data_f(2)
  val btb_rd_ret_f = btb_sel_data_f(1)

  btb_sel_data_f := Mux1H(Seq(btb_sel_f(1).asBool-> btb_vbank1_rd_data_f(16,1),
                              btb_sel_f(0).asBool-> btb_vbank1_rd_data_f(16,1)))

  io.ifu_bp_hit_taken_f := (vwayhit_f & hist1_raw).orR & io.ifc_fetch_req_f & !leak_one_f_d1 & !io.dec_tlu_bpred_disable

  val bht_force_taken_f = Cat( btb_vbank1_rd_data_f(CALL) | btb_vbank1_rd_data_f(RET) ,
                               btb_vbank0_rd_data_f(CALL) | btb_vbank0_rd_data_f(RET))

  val bht_valid_f = vwayhit_f

  val bht_bank1_rd_data_f =WireInit(UInt(2.W), 0.U)
  val bht_bank0_rd_data_f =WireInit(UInt(2.W), 0.U)
  val bht_bank0_rd_data_p1_f =WireInit(UInt(2.W), 0.U)

  val bht_vbank0_rd_data_f = Mux1H(Seq(!io.ifc_fetch_addr_f(0).asBool->bht_bank0_rd_data_f,
                                        io.ifc_fetch_addr_f(0).asBool->bht_bank1_rd_data_f))

  val bht_vbank1_rd_data_f = Mux1H(Seq(!io.ifc_fetch_addr_f(0).asBool->bht_bank1_rd_data_f,
                                        io.ifc_fetch_addr_f(0).asBool->bht_bank0_rd_data_p1_f))

  bht_dir_f := Cat((bht_force_taken_f(1) | bht_vbank1_rd_data_f(1)) & bht_valid_f(1),
                      (bht_force_taken_f(0) | bht_vbank0_rd_data_f(1)) & bht_valid_f(0))

  io.ifu_bp_inst_mask_f := (io.ifu_bp_hit_taken_f & btb_sel_f(1)) | !io.ifu_bp_hit_taken_f
  // Bank explination

  hist1_raw := bht_force_taken_f | Cat(bht_vbank1_rd_data_f(1), bht_vbank0_rd_data_f(1))

  val hist0_raw = Cat(bht_vbank1_rd_data_f(0), bht_vbank0_rd_data_f(0))

  val pc4_raw = Cat(vwayhit_f(1) & btb_vbank1_rd_data_f(PC4),
                    vwayhit_f(0) & btb_vbank0_rd_data_f(PC4))

  val pret_raw = Cat(vwayhit_f(1) & !btb_vbank1_rd_data_f(CALL) & btb_vbank1_rd_data_f(RET),
                     vwayhit_f(0) & !btb_vbank0_rd_data_f(CALL) & btb_vbank0_rd_data_f(RET))

  //GHR
  val num_valids = bht_valid_f(1) +& bht_valid_f(0) // countones

  val final_h = (btb_sel_f & bht_dir_f).andR

  val fghr = WireInit(UInt(BHT_GHR_SIZE.W), 0.U)

  val merged_ghr = Mux1H(Seq((num_valids===2.U).asBool->Cat(fghr(BHT_GHR_SIZE-3,0), 0.U, final_h),
                             (num_valids===1.U).asBool->Cat(fghr(BHT_GHR_SIZE-2,0), final_h),
                             (num_valids===0.U).asBool->Cat(fghr(BHT_GHR_SIZE-1,0))))

  val exu_flush_ghr = io.exu_mp_fghr

  val fghr_ns = Mux1H(Seq(exu_flush_final_d1.asBool->exu_flush_ghr,
                         (!exu_flush_final_d1 & io.ifc_fetch_req_f & io.ic_hit_f & !leak_one_f_d1).asBool -> merged_ghr,
                         (!exu_flush_final_d1 & !(io.ifc_fetch_req_f & io.ic_hit_f & !leak_one_f_d1)).asBool -> fghr))

  fghr := RegNext(fghr_ns, init = 0.U)

  io.ifu_bp_fghr_f := fghr

  io.ifu_bp_way_f := way_raw
  io.ifu_bp_hist1_f := hist1_raw
  io.ifu_bp_hist0_f := hist0_raw
  io.ifu_bp_pc4_f := pc4_raw

  io.ifu_bp_valid_f := vwayhit_f & ~Fill(2, io.dec_tlu_bpred_disable)
  io.ifu_bp_ret_f := pret_raw

  val bloc_f = Cat((bht_dir_f(0) & !fetch_start_f(0)) | (!bht_dir_f(0) & fetch_start_f(0)),
    (bht_dir_f(0) & fetch_start_f(0)) | (!bht_dir_f(0) & !fetch_start_f(0)))

  val use_fa_plus = !bht_dir_f(0) & io.ifc_fetch_addr_f(0) & !btb_rd_pc4_f

  val btb_fg_crossing_f = fetch_start_f(0) & btb_sel_f(0) & btb_rd_pc4_f
  val bp_total_branch_offset_f = bloc_f(1)^btb_rd_pc4_f

  val ifc_fetch_adder_prior = RegEnable(io.ifc_fetch_addr_f, 0.U, (io.ifc_fetch_req_f & !io.ifu_bp_hit_taken_f & io.ic_hit_f).asBool)

  io.ifu_bp_poffset_f := btb_rd_tgt_f
  val adder_pc_in_f = Mux1H(Seq(use_fa_plus.asBool->fetch_addr_p1_f,
                                btb_fg_crossing_f.asBool->ifc_fetch_adder_prior,
                              (!btb_fg_crossing_f & !use_fa_plus).asBool->io.ifc_fetch_addr_f(30,1)))

  val bp_btb_target_adder_f = rvbradder(Cat(adder_pc_in_f(29,0),bp_total_branch_offset_f, 0.U), Cat(btb_rd_tgt_f,0.U))

  val rets_out = Wire(Vec(RET_STACK_SIZE, UInt(32.W)))
  rets_out := (0 until RET_STACK_SIZE).map(i=>0.U)

  io.ifu_bp_btb_target_f := Mux((btb_rd_ret_f & !btb_rd_call_f & rets_out(0)(0)).asBool,
    rets_out(0)(31,1),bp_btb_target_adder_f(31,1))

  // Return stack
  val bp_rs_call_target_f = rvbradder(Cat(adder_pc_in_f(29,0),bp_total_branch_offset_f, 0.U), Cat(Fill(11, 0.U),~btb_rd_pc4_f, 0.U))

  val rs_push = btb_rd_call_f & !btb_rd_ret_f & io.ifu_bp_hit_taken_f
  val rs_pop = btb_rd_ret_f & !btb_rd_call_f & io.ifu_bp_hit_taken_f
  val rs_hold = !rs_push & !rs_pop

  val rsenable = (0 until RET_STACK_SIZE).map(i=> if(i==0) !rs_hold else if(i==RET_STACK_SIZE-1) rs_push else rs_push | rs_pop)

  val rets_in = (0 until RET_STACK_SIZE).map(i=> if(i==0)
    Mux1H(Seq(rs_push.asBool -> Cat(bp_rs_call_target_f(31,1),1.U),
              rs_pop.asBool  -> rets_out(1)))
    else if(i==RET_STACK_SIZE-1) rets_out(i-1)
    else Mux1H(Seq(rs_push.asBool->rets_out(i-1),
                   rs_pop.asBool ->rets_out(i+1))))

  rets_out := (0 until RET_STACK_SIZE).map(i=>RegEnable(rets_in(i),0.U,rsenable(i).asBool))

  dec_tlu_error_wb := dec_tlu_br0_start_error_wb | dec_tlu_br0_error_wb
  btb_error_addr_wb := dec_tlu_br0_addr_wb
  dec_tlu_way_wb := dec_tlu_br0_way_wb
  val btb_valid = exu_mp_valid & (!dec_tlu_error_wb)
  val btb_wr_tag = io.exu_mp_btag

  val btb_wr_data = Cat(btb_wr_tag, exu_mp_tgt, exu_mp_pc4, exu_mp_boffset, exu_mp_call | exu_mp_ja, exu_mp_ret | exu_mp_ja, btb_valid)
  val exu_mp_valid_write = exu_mp_valid & exu_mp_ataken

  val btb_wr_en_way0 = ((!exu_mp_way) & exu_mp_valid_write & (!dec_tlu_error_wb)) | ((!dec_tlu_way_wb) & dec_tlu_error_wb)
  val btb_wr_en_way1 = (exu_mp_way & exu_mp_valid_write & (!dec_tlu_error_wb)) | (dec_tlu_way_wb & dec_tlu_error_wb)

  val btb_wr_addr = Mux(dec_tlu_error_wb.asBool , btb_error_addr_wb, exu_mp_addr)
  val middle_of_bank = exu_mp_pc4 ^ exu_mp_boffset
  val bht_wr_en0 = Fill(2, exu_mp_valid & !exu_mp_call & !exu_mp_ret & !exu_mp_ja) & Cat(middle_of_bank, ~middle_of_bank)
  val bht_wr_en2 = Fill(2, dec_tlu_br0_v_wb) & Cat(dec_tlu_br0_middle_wb, ~dec_tlu_br0_middle_wb)
  val bht_wr_data0 = exu_mp_hist
  val bht_wr_data2 = dec_tlu_br0_hist_wb

  val mp_hashed = el2_btb_ghr_hash(Cat(exu_mp_addr,0.U(2.W)), io.exu_mp_eghr)
  val br0_hashed_wb = el2_btb_ghr_hash(Cat(dec_tlu_br0_addr_wb,0.U(2.W)), exu_i0_br_fghr_wb)
  val bht_rd_addr_hashed_f = el2_btb_ghr_hash(Cat(btb_rd_addr_f,0.U(2.W)), fghr)
  val bht_rd_addr_hashed_p1_f = el2_btb_ghr_hash(Cat(btb_rd_addr_p1_f,0.U(2.W)), fghr)

  val bht_wr_addr0 = mp_hashed
  val bht_wr_addr2 = br0_hashed_wb
  val bht_rd_addr_f = bht_rd_addr_hashed_f
  val bht_rd_addr_p1_f = bht_rd_addr_hashed_p1_f

  // BTB
  // Entry -> Tag[BTB-BTAG-SIZE], toffset[12], pc4, boffset, call, ret, valid

  val btb_bank0_rd_data_way0_out = (0 until LRU_SIZE).map(i=>RegEnable(btb_wr_data,0.U,((btb_wr_addr===i.U) & btb_wr_en_way0).asBool))
  val btb_bank0_rd_data_way1_out = (0 until LRU_SIZE).map(i=>RegEnable(btb_wr_data,0.U,((btb_wr_addr===i.U) & btb_wr_en_way1).asBool))

  btb_bank0_rd_data_way0_f := Mux1H((0 until LRU_SIZE).map(i=>(btb_rd_addr_f===i.U).asBool->btb_bank0_rd_data_way0_out(i)))
  btb_bank0_rd_data_way1_f := Mux1H((0 until LRU_SIZE).map(i=>(btb_rd_addr_f===i.U).asBool->btb_bank0_rd_data_way1_out(i)))

  btb_bank0_rd_data_way0_p1_f := Mux1H((0 until LRU_SIZE).map(i=>(btb_rd_addr_p1_f===i.U).asBool->btb_bank0_rd_data_way0_out(i)))
  btb_bank0_rd_data_way1_p1_f := Mux1H((0 until LRU_SIZE).map(i=>(btb_rd_addr_p1_f===i.U).asBool->btb_bank0_rd_data_way1_out(i)))

  val bht_bank_wr_data = (0 until 2).map(i=>(0 until BHT_ARRAY_DEPTH/NUM_BHT_LOOP).map(k=>(0 until NUM_BHT_LOOP).map(j=>
    Mux((bht_wr_en2(i)&(bht_wr_addr2(NUM_BHT_LOOP_INNER_HI-BHT_ADDR_LO,0)===j.asUInt)&(bht_wr_addr2(BHT_ADDR_HI-NUM_BHT_LOOP_OUTER_LO+1,NUM_BHT_LOOP_OUTER_LO-BHT_ADDR_LO)===k.asUInt)|BHT_NO_ADDR_MATCH.B).asBool, bht_wr_data2, bht_wr_data0))))

  val bht_bank_sel = (0 until 2).map(i=>(0 until BHT_ARRAY_DEPTH/NUM_BHT_LOOP).map(k=>(0 until NUM_BHT_LOOP).map(j=>
  bht_wr_en0(i) & (bht_wr_addr0(NUM_BHT_LOOP_INNER_HI-BHT_ADDR_LO,0)===j.asUInt) & (bht_wr_addr0(BHT_ADDR_HI-NUM_BHT_LOOP_OUTER_LO+1, NUM_BHT_LOOP_OUTER_LO-BHT_ADDR_LO)===k.asUInt) | BHT_NO_ADDR_MATCH.B | bht_wr_en2(i) &
          (bht_wr_addr2(NUM_BHT_LOOP_INNER_HI-BHT_ADDR_LO,0)===j.asUInt) & (bht_wr_addr2(BHT_ADDR_HI-NUM_BHT_LOOP_OUTER_LO+1, NUM_BHT_LOOP_OUTER_LO-BHT_ADDR_LO)===k.asUInt) | BHT_NO_ADDR_MATCH.B)))

  val bht_bank_rd_data_out = Wire(Vec(2, Vec(BHT_ARRAY_DEPTH, UInt(2.W))))
  for(i<-0 until 2; k<-0 until BHT_ARRAY_DEPTH/NUM_BHT_LOOP; j<-0 until NUM_BHT_LOOP){
    bht_bank_rd_data_out(i)((16*k)+j) := RegEnable(bht_bank_wr_data(i)(j)(k), 0.U, bht_bank_sel(i)(j)(k))
  }

  bht_bank0_rd_data_f := Mux1H((0 until BHT_ARRAY_DEPTH).map(i=>(bht_rd_addr_f(BHT_ADDR_HI-BHT_ADDR_LO,0)===i.U).asBool->bht_bank_rd_data_out(0)(i)))
  bht_bank1_rd_data_f := Mux1H((0 until BHT_ARRAY_DEPTH).map(i=>(bht_rd_addr_f(BHT_ADDR_HI-BHT_ADDR_LO,0)===i.U).asBool->bht_bank_rd_data_out(1)(i)))
  bht_bank0_rd_data_p1_f := Mux1H((0 until BHT_ARRAY_DEPTH).map(i=>(bht_rd_addr_p1_f(BHT_ADDR_HI-BHT_ADDR_LO,0)===i.U).asBool->bht_bank_rd_data_out(1)(i)))
}

object ifu_bp extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_bp_ctl()))
}

