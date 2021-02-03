package ifu
import include._
import lib._
import exu._
import chisel3._
import chisel3.util._
import chisel3.experimental.chiselName

@chiselName
class ifu_bp_ctl extends Module with lib with RequireAsyncReset {
  val io = IO (new Bundle {
    val active_clk = Input(Clock())
    val ic_hit_f = Input(Bool())
    val exu_flush_final = Input(Bool())
    val ifc_fetch_addr_f = Input(UInt(31.W))
    val ifc_fetch_req_f = Input(Bool())           // Fetch request generated by the IFC
    val dec_bp = new dec_bp()
    val dec_tlu_flush_lower_wb = Input(Bool())
    val exu_bp = Flipped(new exu_bp())
    val dec_fa_error_index = Input(UInt(log2Ceil(BTB_SIZE).W))// Fully associative btb error index
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
    val ifu_bp_fa_index_f = Output(Vec(2,UInt(log2Ceil(BTB_SIZE).W)))// predicted branch index (fully associative option)
    val scan_mode = Input(Bool())
  })
  io.ifu_bp_fa_index_f := io.ifu_bp_fa_index_f.map(i=> 0.U)
  val BTB_DWIDTH =  BTB_TOFFSET_SIZE+ BTB_BTAG_SIZE + 5
  val BTB_DWIDTH_TOP = BTB_TOFFSET_SIZE + BTB_BTAG_SIZE + 4
  val BTB_FA_INDEX = log2Ceil(BTB_SIZE) - 1
  val FA_CMP_LOWER = log2Ceil(ICACHE_LN_SZ)
  val FA_TAG_END_UPPER = 5 + BTB_TOFFSET_SIZE + FA_CMP_LOWER - 1 // must cast to int or vcs build fails
  val FA_TAG_START_LOWER =3 + BTB_TOFFSET_SIZE + FA_CMP_LOWER
  val FA_TAG_END_LOWER = 5 + BTB_TOFFSET_SIZE

  val TAG_START = BTB_DWIDTH - 1
  val PC4 = 4 // Branch = pc + 4 (BTB Index)
  val BOFF = 3 // Branch offset (BTB Index)
  val CALL = 2 // Branch CALL (BTB Index)
  val RET = 1 // Branch RET (BTB Index)
  val BV = 0 // Branch Valid (BTB Index)

  val LRU_SIZE = BTB_ARRAY_DEPTH
  val NUM_BHT_LOOP = if(BHT_ARRAY_DEPTH > 16) 16 else BHT_ARRAY_DEPTH
  val NUM_BHT_LOOP_INNER_HI = if(BHT_ARRAY_DEPTH > 16) BHT_ADDR_LO+3 else BHT_ADDR_HI
  val NUM_BHT_LOOP_OUTER_LO = if(BHT_ARRAY_DEPTH > 16) BHT_ADDR_LO+4 else BHT_ADDR_LO
  val BHT_NO_ADDR_MATCH = BHT_ARRAY_DEPTH <= 16
  /////////////////////////////////////////////////////////
  val leak_one_f = WireInit(Bool(), 0.U)
  val leak_one_f_d1 = WireInit(Bool(), 0.U)
  val bht_dir_f = WireInit(UInt(2.W), 0.U)
  val dec_tlu_error_wb = WireInit(Bool(), 0.U)
  val btb_error_addr_wb = WireInit(UInt((BTB_ADDR_HI-BTB_ADDR_LO+1).W), 0.U)

  val btb_vbank0_rd_data_f = WireInit(UInt((BTB_DWIDTH).W), 0.U)
  val btb_vbank1_rd_data_f = WireInit(UInt((BTB_DWIDTH).W), 0.U)
  val btb_bank0_rd_data_way0_f = WireInit(UInt((BTB_DWIDTH).W), 0.U)
  val btb_bank0_rd_data_way1_f = WireInit(UInt((BTB_DWIDTH).W), 0.U)
  val btb_bank0_rd_data_way0_p1_f = WireInit(UInt((BTB_DWIDTH).W), 0.U)
  val btb_bank0_rd_data_way1_p1_f = WireInit(UInt((BTB_DWIDTH).W), 0.U)
  val eoc_mask = WireInit(Bool(), 0.U)
  val btb_lru_b0_f = WireInit(UInt(LRU_SIZE.W), init = 0.U)
  val dec_tlu_way_wb = WireInit(Bool(), 0.U)

  val btb_vlru_rd_f = WireInit(UInt(2.W), 0.U)
  val vwayhit_f = WireInit(UInt(2.W), 0.U)
  val tag_match_vway1_expanded_f = WireInit(UInt(2.W), 0.U)
  val wayhit_f    = WireInit(UInt(2.W), 0.U)
  val wayhit_p1_f = WireInit(UInt(2.W), 0.U)
  val way_raw = WireInit(UInt(2.W), 0.U)
  val exu_flush_final_d1 = WireInit(Bool(), 0.U)
  /////////////////////////////////////////////////////////
  // Misprediction packet
  val exu_mp_valid    = io.exu_bp.exu_mp_pkt.bits.misp & !leak_one_f
  val exu_mp_boffset  = io.exu_bp.exu_mp_pkt.bits.boffset
  val exu_mp_pc4      = io.exu_bp.exu_mp_pkt.bits.pc4
  val exu_mp_call     = io.exu_bp.exu_mp_pkt.bits.pcall
  val exu_mp_ret      = io.exu_bp.exu_mp_pkt.bits.pret
  val exu_mp_ja       = io.exu_bp.exu_mp_pkt.bits.pja
  val exu_mp_way      = io.exu_bp.exu_mp_pkt.bits.way
  val exu_mp_hist     = io.exu_bp.exu_mp_pkt.bits.hist
  val exu_mp_tgt      = io.exu_bp.exu_mp_pkt.bits.toffset
  val exu_mp_addr     = io.exu_bp.exu_mp_index
  val exu_mp_ataken   = io.exu_bp.exu_mp_pkt.bits.ataken
  val exu_mp_way_f    = WireInit(Bool(), 0.U)

  // Its a commit or update packet
  val dec_tlu_br0_v_wb            = io.dec_bp.dec_tlu_br0_r_pkt.valid
  val dec_tlu_br0_hist_wb         = io.dec_bp.dec_tlu_br0_r_pkt.bits.hist
  val dec_tlu_br0_addr_wb         = io.exu_bp.exu_i0_br_index_r
  val dec_tlu_br0_error_wb        = io.dec_bp.dec_tlu_br0_r_pkt.bits.br_error
  val dec_tlu_br0_middle_wb       = io.dec_bp.dec_tlu_br0_r_pkt.bits.middle
  val dec_tlu_br0_way_wb          = io.dec_bp.dec_tlu_br0_r_pkt.bits.way
  val dec_tlu_br0_start_error_wb  = io.dec_bp.dec_tlu_br0_r_pkt.bits.br_start_error
  val exu_i0_br_fghr_wb           = io.exu_bp.exu_i0_br_fghr_r

  dec_tlu_error_wb := dec_tlu_br0_start_error_wb | dec_tlu_br0_error_wb
  btb_error_addr_wb := dec_tlu_br0_addr_wb
  dec_tlu_way_wb := dec_tlu_br0_way_wb

  // Hash the first PC
  val btb_rd_addr_f = btb_addr_hash(io.ifc_fetch_addr_f)

  // Second pc = pc +4
  val fetch_addr_p1_f = io.ifc_fetch_addr_f(30,1) + 1.U

  // Hash the second pc
  val btb_rd_addr_p1_f = btb_addr_hash(Cat(fetch_addr_p1_f,0.U))

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

  // Hashing the PC to generate the index for the btb

  // If there is a flush from the lower pipe wait until the flush gets deasserted from the (decode) side
  leak_one_f := (io.dec_bp.dec_tlu_flush_leak_one_wb & io.dec_tlu_flush_lower_wb) | (leak_one_f_d1 & !io.dec_tlu_flush_lower_wb)
if(!BTB_FULLYA) {
  val fetch_rd_tag_f = if (BTB_BTAG_FOLD) btb_tag_hash_fold(io.ifc_fetch_addr_f) else btb_tag_hash(io.ifc_fetch_addr_f)
  val fetch_rd_tag_p1_f = if (BTB_BTAG_FOLD) btb_tag_hash_fold(Cat(fetch_addr_p1_f, 0.U)) else btb_tag_hash(Cat(fetch_addr_p1_f, 0.U))
  // There is a misprediction and the exu is writing back
  val fetch_mp_collision_f = (io.exu_bp.exu_mp_btag === fetch_rd_tag_f) & exu_mp_valid & io.ifc_fetch_req_f & (exu_mp_addr === btb_rd_addr_f)
  val fetch_mp_collision_p1_f = (io.exu_bp.exu_mp_btag === fetch_rd_tag_p1_f) & exu_mp_valid & io.ifc_fetch_req_f & (exu_mp_addr === btb_rd_addr_p1_f)
  // For a tag to match the branch should be valid tag should match and a fetch request should be generated
  // Also there should be no bank conflict or leak-one
  val tag_match_way0_f = btb_bank0_rd_data_way0_f(BV) & (btb_bank0_rd_data_way0_f(TAG_START, 17) === fetch_rd_tag_f) &
    !(dec_tlu_way_wb & branch_error_bank_conflict_f) & io.ifc_fetch_req_f & !leak_one_f

  // Similar to the way-0 -> way-1
  val tag_match_way1_f = btb_bank0_rd_data_way1_f(BV) & (btb_bank0_rd_data_way1_f(TAG_START, 17) === fetch_rd_tag_f) &
    !(dec_tlu_way_wb & branch_error_bank_conflict_f) & io.ifc_fetch_req_f & !leak_one_f

  // Similar to above matches
  val tag_match_way0_p1_f = btb_bank0_rd_data_way0_p1_f(BV) & (btb_bank0_rd_data_way0_p1_f(TAG_START, 17) === fetch_rd_tag_p1_f) &
    !(dec_tlu_way_wb & branch_error_bank_conflict_p1_f) & io.ifc_fetch_req_f & !leak_one_f
  // Similar to above matches
  val tag_match_way1_p1_f = btb_bank0_rd_data_way1_p1_f(BV) & (btb_bank0_rd_data_way1_p1_f(TAG_START, 17) === fetch_rd_tag_p1_f) &
    !(dec_tlu_way_wb & branch_error_bank_conflict_p1_f) & io.ifc_fetch_req_f & !leak_one_f

  // Reordering to avoid multiple hit
  val tag_match_way0_expanded_f = Cat(tag_match_way0_f & (btb_bank0_rd_data_way0_f(BOFF) ^ btb_bank0_rd_data_way0_f(PC4)),
    tag_match_way0_f & !(btb_bank0_rd_data_way0_f(BOFF) ^ btb_bank0_rd_data_way0_f(PC4)))

  val tag_match_way1_expanded_f = Cat(tag_match_way1_f & (btb_bank0_rd_data_way1_f(BOFF) ^ btb_bank0_rd_data_way1_f(PC4)),
    tag_match_way1_f & !(btb_bank0_rd_data_way1_f(BOFF) ^ btb_bank0_rd_data_way1_f(PC4)))

  val tag_match_way0_expanded_p1_f = Cat(tag_match_way0_p1_f & (btb_bank0_rd_data_way0_p1_f(BOFF) ^ btb_bank0_rd_data_way0_p1_f(PC4)),
    tag_match_way0_p1_f & !(btb_bank0_rd_data_way0_p1_f(BOFF) ^ btb_bank0_rd_data_way0_p1_f(PC4)))

  val tag_match_way1_expanded_p1_f = Cat(tag_match_way1_p1_f & (btb_bank0_rd_data_way1_p1_f(BOFF) ^ btb_bank0_rd_data_way1_p1_f(PC4)),
    tag_match_way1_p1_f & !(btb_bank0_rd_data_way1_p1_f(BOFF) ^ btb_bank0_rd_data_way1_p1_f(PC4)))

  // Final hit calculation
  wayhit_f := tag_match_way0_expanded_f | tag_match_way1_expanded_f

  wayhit_p1_f := tag_match_way0_expanded_p1_f | tag_match_way1_expanded_p1_f

  // Chopping off the ways that had a hit btb_vbank0_rd_data_f
  // e-> Lower half o-> Upper half
  val btb_bank0e_rd_data_f = Mux1H(Seq(tag_match_way0_expanded_f(0).asBool -> btb_bank0_rd_data_way0_f,
    tag_match_way1_expanded_f(0).asBool -> btb_bank0_rd_data_way1_f))

  val btb_bank0o_rd_data_f = Mux1H(Seq(tag_match_way0_expanded_f(1).asBool -> btb_bank0_rd_data_way0_f,
    tag_match_way1_expanded_f(1).asBool -> btb_bank0_rd_data_way1_f))

  val btb_bank0e_rd_data_p1_f = Mux1H(Seq(tag_match_way0_expanded_p1_f(0).asBool -> btb_bank0_rd_data_way0_p1_f,
    tag_match_way1_expanded_p1_f(0).asBool -> btb_bank0_rd_data_way1_p1_f))

  // Making virtual banks, made from pc-bit(1) if it comes from a multiple of 4 we get the lower half of the bank
  // and the upper half of the bank-0 in vbank 1
  btb_vbank0_rd_data_f := Mux1H(Seq(!io.ifc_fetch_addr_f(0) -> btb_bank0e_rd_data_f,
    io.ifc_fetch_addr_f(0) -> btb_bank0o_rd_data_f))
  btb_vbank1_rd_data_f := Mux1H(Seq(!io.ifc_fetch_addr_f(0) -> btb_bank0o_rd_data_f,
    io.ifc_fetch_addr_f(0) -> btb_bank0e_rd_data_p1_f))

  way_raw := tag_match_vway1_expanded_f | (~vwayhit_f & btb_vlru_rd_f)

  // Branch prediction info is sent with the 2byte lane associated with the end of the branch.
  // Cases
  //       BANK1         BANK0
  // -------------------------------
  // |      :       |      :       |
  // -------------------------------
  //         <------------>                   : PC4 branch, offset, should be in B1 (indicated on [2])
  //                <------------>            : PC4 branch, no offset, indicate PC4, VALID, HIST on [1]
  //                       <------------>     : PC4 branch, offset, indicate PC4, VALID, HIST on [0]
  //                <------>                  : PC2 branch, offset, indicate VALID, HIST on [1]
  //                       <------>           : PC2 branch, no offset, indicate VALID, HIST on [0]


  // Make an LRU value with execution mis-prediction
  val mp_wrindex_dec = 1.U << exu_mp_addr

  // Make an LRU value with current read pc
  val fetch_wrindex_dec = 1.U << btb_rd_addr_f

  // Make an LRU value with current read pc + 4
  val fetch_wrindex_p1_dec = 1.U << btb_rd_addr_p1_f

  // Checking if the mis-prediction was valid or not and make a new LRU value
  val mp_wrlru_b0 = mp_wrindex_dec & Fill(LRU_SIZE, exu_mp_valid)

  // Is the update of the lru valid or not
  val lru_update_valid_f = (vwayhit_f(0) | vwayhit_f(1)) & io.ifc_fetch_req_f & !leak_one_f

  val fetch_wrlru_b0 = fetch_wrindex_dec & Fill(LRU_SIZE, lru_update_valid_f)
  val fetch_wrlru_p1_b0 = fetch_wrindex_p1_dec & Fill(LRU_SIZE, lru_update_valid_f)

  val btb_lru_b0_hold = ~mp_wrlru_b0 & ~fetch_wrlru_b0

  // If there is a collision the use the mis-predicted value as output and update accordingly
  val use_mp_way = fetch_mp_collision_f
  val use_mp_way_p1 = fetch_mp_collision_p1_f

  // Calculate the lru next value and flop it
  val btb_lru_b0_ns: UInt = Mux1H(Seq(!exu_mp_way.asBool -> mp_wrlru_b0,
    tag_match_way0_f.asBool -> fetch_wrlru_b0,
    tag_match_way0_p1_f.asBool -> fetch_wrlru_p1_b0)) | btb_lru_b0_hold & btb_lru_b0_f


  val btb_lru_rd_f = Mux(use_mp_way.asBool, exu_mp_way_f, (fetch_wrindex_dec & btb_lru_b0_f).orR)

  val btb_lru_rd_p1_f = Mux(use_mp_way_p1.asBool, exu_mp_way_f, (fetch_wrindex_p1_dec & btb_lru_b0_f).orR)

  // Similar to the vbank make vlru
  btb_vlru_rd_f := Mux1H(Seq(!io.ifc_fetch_addr_f(0) -> Cat(btb_lru_rd_f, btb_lru_rd_f),
    io.ifc_fetch_addr_f(0).asBool -> Cat(btb_lru_rd_p1_f, btb_lru_rd_f)))

  // virtual way depending on pc value
  tag_match_vway1_expanded_f := Mux1H(Seq(!io.ifc_fetch_addr_f(0).asBool -> tag_match_way1_expanded_f,
    io.ifc_fetch_addr_f(0).asBool -> Cat(tag_match_way1_expanded_p1_f(0), tag_match_way1_expanded_f(1))))

  btb_lru_b0_f := rvdffe(btb_lru_b0_ns, (io.ifc_fetch_req_f|exu_mp_valid).asBool, clock, io.scan_mode)
}

  io.ifu_bp_way_f := way_raw
  // update the lru
//io.test := btb_lru_b0_ns
  // Checking if the end of line is near
  val eoc_near = io.ifc_fetch_addr_f(ICACHE_BEAT_ADDR_HI-1, 2).andR
  // Mask according to eoc-near and make the hit-final
  eoc_mask := !eoc_near | (~io.ifc_fetch_addr_f(1,0)).orR()

  val btb_sel_data_f = WireInit(UInt(16.W), init = 0.U)
  val hist1_raw = WireInit(UInt(2.W), init = 0.U)

  // Filteing out portion of BTB read after virtual banking
  // Entry -> tag[pt.BTB_BTAG_SIZE-1:0], toffset[11:0], pc4, boffset, call, ret, valid
  val btb_rd_tgt_f = btb_sel_data_f(15,4)
  val btb_rd_pc4_f = btb_sel_data_f(3)
  val btb_rd_call_f = btb_sel_data_f(1)
  val btb_rd_ret_f = btb_sel_data_f(0)

  // This is 1-index shifted to that of the btb-data-read so we have 1-bit shifted
  btb_sel_data_f := Mux1H(Seq(btb_sel_f(1).asBool-> btb_vbank1_rd_data_f(16,1),
                              btb_sel_f(0).asBool-> btb_vbank0_rd_data_f(16,1)))

  // No lower flush or bp-disabple and a fetch request is generated with virtual way hit
  io.ifu_bp_hit_taken_f := (vwayhit_f & hist1_raw).orR & io.ifc_fetch_req_f & !leak_one_f_d1 & !io.dec_bp.dec_tlu_bpred_disable

  // If the prediction is a call or ret btb entry then do not check the bht just force a taken with data from the RAS
  val bht_force_taken_f = Cat( btb_vbank1_rd_data_f(CALL) | btb_vbank1_rd_data_f(RET) ,
                               btb_vbank0_rd_data_f(CALL) | btb_vbank0_rd_data_f(RET))

  val bht_valid_f = vwayhit_f

  val bht_bank1_rd_data_f =WireInit(UInt(2.W), 0.U)
  val bht_bank0_rd_data_f =WireInit(UInt(2.W), 0.U)
  val bht_bank0_rd_data_p1_f =WireInit(UInt(2.W), 0.U)

  // Depending on pc make the virtual bank as commented above
  val bht_vbank0_rd_data_f = Mux1H(Seq(!io.ifc_fetch_addr_f(0).asBool->bht_bank0_rd_data_f,
                                        io.ifc_fetch_addr_f(0).asBool->bht_bank1_rd_data_f))

  val bht_vbank1_rd_data_f = Mux1H(Seq(!io.ifc_fetch_addr_f(0).asBool->bht_bank1_rd_data_f,
                                        io.ifc_fetch_addr_f(0).asBool->bht_bank0_rd_data_p1_f))


  // Direction containing data of both banks direction
  bht_dir_f := Cat((bht_force_taken_f(1) | bht_vbank1_rd_data_f(1)) & bht_valid_f(1),
                      (bht_force_taken_f(0) | bht_vbank0_rd_data_f(1)) & bht_valid_f(0))

  // If the branch is taken then pass btb sel else 0
  io.ifu_bp_inst_mask_f := (io.ifu_bp_hit_taken_f & btb_sel_f(1)) | !io.ifu_bp_hit_taken_f

  // hist 1 shows both banks direction
  hist1_raw := bht_force_taken_f | Cat(bht_vbank1_rd_data_f(1), bht_vbank0_rd_data_f(1))

  // hist 0 shows the both bank strength
  val hist0_raw = Cat(bht_vbank1_rd_data_f(0), bht_vbank0_rd_data_f(0))

  // pc4: if the branch is pc+4
  val pc4_raw = Cat(vwayhit_f(1) & btb_vbank1_rd_data_f(PC4),
                    vwayhit_f(0) & btb_vbank0_rd_data_f(PC4))

  // Its a call call or ret branch
  val pret_raw = Cat(vwayhit_f(1) & !btb_vbank1_rd_data_f(CALL) & btb_vbank1_rd_data_f(RET),
                     vwayhit_f(0) & !btb_vbank0_rd_data_f(CALL) & btb_vbank0_rd_data_f(RET))

  // count number of 1's in bht_valid
  val num_valids = bht_valid_f(1) +& bht_valid_f(0)

  // To calculate a merged ghr meaning the is a overlapping 1 in sel and dir
  val final_h = (btb_sel_f & bht_dir_f).orR

  val fghr = WireInit(UInt(BHT_GHR_SIZE.W), 0.U)

  val merged_ghr = Mux1H(Seq((num_valids===2.U).asBool->Cat(fghr(BHT_GHR_SIZE-3,0), 0.U, final_h),
                             (num_valids===1.U).asBool->Cat(fghr(BHT_GHR_SIZE-2,0), final_h),
                             (num_valids===0.U).asBool->Cat(fghr(BHT_GHR_SIZE-1,0))))

  val exu_flush_ghr = io.exu_bp.exu_mp_fghr
  val fghr_ns = Wire(UInt(BHT_GHR_SIZE.W))

  // If there is a exu-flush use its ghr
  // If there is a hit and a fetch then use the merged-ghr
  // If there is no hit or fetch then hold value
  fghr_ns := Mux1H(Seq(exu_flush_final_d1.asBool->exu_flush_ghr,
                         (!exu_flush_final_d1 &   io.ifc_fetch_req_f & io.ic_hit_f & !leak_one_f_d1).asBool  -> merged_ghr,
                         (!exu_flush_final_d1 & !(io.ifc_fetch_req_f & io.ic_hit_f & !leak_one_f_d1)).asBool -> fghr))
  leak_one_f_d1 := rvdffie(leak_one_f,clock,reset.asAsyncReset(),io.scan_mode)
  //val dec_tlu_way_wb_f = withClock(io.active_clk) {RegNext(dec_tlu_way_wb, init = 0.U)
  exu_mp_way_f := rvdffie(exu_mp_way,clock,reset.asAsyncReset(),io.scan_mode)
  exu_flush_final_d1 := rvdffie(io.exu_flush_final,clock,reset.asAsyncReset(),io.scan_mode)
  fghr := rvdffie(fghr_ns,clock,reset.asAsyncReset(),io.scan_mode)

  io.ifu_bp_fghr_f := fghr
  io.ifu_bp_hist1_f := hist1_raw
  io.ifu_bp_hist0_f := hist0_raw
  io.ifu_bp_pc4_f := pc4_raw

  io.ifu_bp_valid_f := vwayhit_f & ~Fill(2, io.dec_bp.dec_tlu_bpred_disable)
  io.ifu_bp_ret_f := pret_raw

  // block fetch to calculate if there is a hit with fetch request and a taken branch then compute the branch offset
  val bloc_f = Cat((bht_dir_f(0) & !fetch_start_f(0)) | (!bht_dir_f(0) & fetch_start_f(0)),
                   (bht_dir_f(0) & fetch_start_f(0)) | (!bht_dir_f(0) & !fetch_start_f(0)))

  val use_fa_plus = !bht_dir_f(0) & io.ifc_fetch_addr_f(0) & !btb_rd_pc4_f

  val btb_fg_crossing_f = fetch_start_f(0) & btb_sel_f(0) & btb_rd_pc4_f
  val bp_total_branch_offset_f = bloc_f(1)^btb_rd_pc4_f
  val ifc_fetch_adder_prior = rvdfflie_UInt(io.ifc_fetch_addr_f(30,1), clock,reset.asAsyncReset,(io.ifc_fetch_req_f & !io.ifu_bp_hit_taken_f & io.ic_hit_f).asBool,io.scan_mode,WIDTH =30, LEFT =19 )
  io.ifu_bp_poffset_f := btb_rd_tgt_f

  val adder_pc_in_f = Mux1H(Seq(use_fa_plus.asBool                      -> fetch_addr_p1_f,
                                btb_fg_crossing_f.asBool                -> ifc_fetch_adder_prior,
                              (!btb_fg_crossing_f & !use_fa_plus).asBool-> io.ifc_fetch_addr_f(30,1)))

  // Calculate the branch target by adding the offset
  val bp_btb_target_adder_f = rvbradder(Cat(adder_pc_in_f(29,0),bp_total_branch_offset_f, 0.U), Cat(btb_rd_tgt_f,0.U))

  val rets_out = Wire(Vec(RET_STACK_SIZE, UInt(32.W)))
  rets_out := (0 until RET_STACK_SIZE).map(i=>0.U)
  // Final target if its a RET then pop else take the target pc
  io.ifu_bp_btb_target_f := ((Fill(31,(btb_rd_ret_f & !btb_rd_call_f & rets_out(0)(0) & io.ifu_bp_hit_taken_f)) & rets_out(0)(31,1)) |
    (Fill(31,(!(btb_rd_ret_f & !btb_rd_call_f & rets_out(0)(0)) & io.ifu_bp_hit_taken_f)) & bp_btb_target_adder_f(31,1)))
  // Return stack
  val bp_rs_call_target_f = rvbradder(Cat(adder_pc_in_f(29,0),bp_total_branch_offset_f, 0.U), Cat(Fill(11, 0.U),~btb_rd_pc4_f, 0.U))

  val rs_push = btb_rd_call_f & !btb_rd_ret_f & io.ifu_bp_hit_taken_f
  val rs_pop = btb_rd_ret_f & !btb_rd_call_f & io.ifu_bp_hit_taken_f
  val rs_hold = !rs_push & !rs_pop

  val rsenable = (0 until RET_STACK_SIZE).map(i=> if(i==0) !rs_hold else if(i==RET_STACK_SIZE-1) rs_push else rs_push | rs_pop)
  // Make the input of the RAS
  val rets_in = (0 until RET_STACK_SIZE).map(i=> if(i==0)
    Mux1H(Seq(rs_push.asBool -> Cat(bp_rs_call_target_f(31,1),1.U),
              rs_pop.asBool  -> rets_out(1)))
    else if(i==RET_STACK_SIZE-1) rets_out(i-1)
    else Mux1H(Seq(rs_push.asBool->rets_out(i-1),
                   rs_pop.asBool ->rets_out(i+1))))

  // Make flops for poping the data
  rets_out := (0 until RET_STACK_SIZE).map(i=>rvdffe(rets_in(i), rsenable(i).asBool, clock, io.scan_mode))

  val btb_valid = exu_mp_valid & (!dec_tlu_error_wb)
  val btb_wr_tag = io.exu_bp.exu_mp_btag

  // Making the data to write into the BTB according the structure discribed above
  val btb_wr_data = Cat(btb_wr_tag, exu_mp_tgt, exu_mp_pc4, exu_mp_boffset, exu_mp_call | exu_mp_ja, exu_mp_ret | exu_mp_ja, btb_valid)
  val exu_mp_valid_write = exu_mp_valid & exu_mp_ataken & !io.exu_bp.exu_mp_pkt.valid
  val middle_of_bank = exu_mp_pc4 ^ exu_mp_boffset

  // Enable the clk enable according to the exu misprediction where it is not a RAS
  val bht_wr_en0 = Fill(2, exu_mp_valid & !exu_mp_call & !exu_mp_ret & !exu_mp_ja) & Cat(middle_of_bank, ~middle_of_bank)
  val bht_wr_en2 = Fill(2, dec_tlu_br0_v_wb) & Cat(dec_tlu_br0_middle_wb, ~dec_tlu_br0_middle_wb)
  val bht_wr_data0 = exu_mp_hist
  val bht_wr_data2 = dec_tlu_br0_hist_wb

  // Hash each read and write address
  val mp_hashed = btb_ghr_hash(Cat(exu_mp_addr,0.U(2.W)), io.exu_bp.exu_mp_eghr)
  val br0_hashed_wb = btb_ghr_hash(Cat(dec_tlu_br0_addr_wb,0.U(2.W)), exu_i0_br_fghr_wb)
  val bht_rd_addr_hashed_f = btb_ghr_hash(Cat(btb_rd_addr_f,0.U(2.W)), fghr)
  val bht_rd_addr_hashed_p1_f = btb_ghr_hash(Cat(btb_rd_addr_p1_f,0.U(2.W)), fghr)

  val bht_wr_addr0 = mp_hashed
  val bht_wr_addr2 = br0_hashed_wb
  val bht_rd_addr_f = bht_rd_addr_hashed_f
  val bht_rd_addr_p1_f = bht_rd_addr_hashed_p1_f

  // BTB
  // Entry -> Tag[BTB-BTAG-SIZE], toffset[12], pc4, boffset, call, ret, valid
if(!BTB_FULLYA) {
  // Enable for write on each way
  val btb_wr_en_way0 = ((!exu_mp_way) & exu_mp_valid_write & (!dec_tlu_error_wb)) | ((!dec_tlu_way_wb) & dec_tlu_error_wb)
  val btb_wr_en_way1 = (exu_mp_way & exu_mp_valid_write & (!dec_tlu_error_wb)) | (dec_tlu_way_wb & dec_tlu_error_wb)

  // Writing is always done from dec or exu check if the dec have a valid data
  val btb_wr_addr = Mux(dec_tlu_error_wb.asBool, btb_error_addr_wb, exu_mp_addr)

   vwayhit_f := Mux1H(Seq(!io.ifc_fetch_addr_f(0).asBool->wayhit_f,
    io.ifc_fetch_addr_f(0).asBool->Cat(wayhit_p1_f(0), wayhit_f(1)))) & Cat(eoc_mask, 1.U(1.W))
  val btb_bank0_rd_data_way0_out = (0 until LRU_SIZE).map(i => rvdffe(btb_wr_data, ((btb_wr_addr === i.U) & btb_wr_en_way0).asBool, clock, io.scan_mode))
  val btb_bank0_rd_data_way1_out = (0 until LRU_SIZE).map(i => rvdffe(btb_wr_data, ((btb_wr_addr === i.U) & btb_wr_en_way1).asBool, clock, io.scan_mode))

  btb_bank0_rd_data_way0_f := Mux1H((0 until LRU_SIZE).map(i => (btb_rd_addr_f === i.U).asBool -> btb_bank0_rd_data_way0_out(i)))
  dontTouch(btb_bank0_rd_data_way0_f)

  btb_bank0_rd_data_way1_f := Mux1H((0 until LRU_SIZE).map(i => (btb_rd_addr_f === i.U).asBool -> btb_bank0_rd_data_way1_out(i)))
  dontTouch(btb_bank0_rd_data_way1_f)
  // BTB read muxing
  btb_bank0_rd_data_way0_p1_f := Mux1H((0 until LRU_SIZE).map(i => (btb_rd_addr_p1_f === i.U).asBool -> btb_bank0_rd_data_way0_out(i)))
  dontTouch(btb_bank0_rd_data_way0_p1_f)

  btb_bank0_rd_data_way1_p1_f := Mux1H((0 until LRU_SIZE).map(i => (btb_rd_addr_p1_f === i.U).asBool -> btb_bank0_rd_data_way1_out(i)))
  dontTouch(btb_bank0_rd_data_way1_p1_f)
}
//  if(BTB_FULLYA){
//    val fetch_mp_collision_f = WireInit(Bool(),init = false.B)
//    val fetch_mp_collision_p1_f = WireInit(Bool() ,init = false.B)
//
//    // Fully Associative tag hash uses bits 31:3. Bits 2:1 are the offset bits used for the 4 tag comp banks
//    // Full tag used to speed up lookup. There is one 31:3 cmp per entry, and 4 2:1 cmps per entry.
//    val ifc_fetch_addr_p1_f = io.ifc_fetch_addr_f(FA_CMP_LOWER-1,1) + 1.U
//
//
//    // val fetch_mp_collision_f = ((io.exu_bp.exu_mp_btag(BTB_BTAG_SIZE-1,0) === io.ifc_fetch_addr_f) & exu_mp_valid & io.ifc_fetch_req_f & ~io.exu_bp.exu_mp_pkt.bits.way)
// //   val fetch_mp_collision_p1_f = ( (io.exu_bp.exu_mp_btag(BTB_BTAG_SIZE-1,0) === Cat(io.ifc_fetch_addr_f(30,FA_CMP_LOWER), ifc_fetch_addr_p1_f(FA_CMP_LOWER-1,1))) & exu_mp_valid & io.ifc_fetch_req_f & ~io.exu_bp.exu_mp_pkt.bits.way)
// //   val btb_upper_hit = Wire(Vec(BTB_SIZE,Bool()))
//    val btb_offset_0 = WireInit(UInt(BTB_SIZE.W) ,init = 0.U)
//    val btb_used = WireInit(UInt(BTB_SIZE.W) ,init = 0.U)
//    val btb_offset_1 = WireInit(UInt(BTB_SIZE.W) ,init = 0.U)
//    val wr0_en       = WireInit(UInt(BTB_SIZE.W) ,init = 0.U)
//    val btbdata = Wire(Vec(BTB_SIZE,UInt(BTB_DWIDTH.W)))
//    btbdata := btbdata.map(i=> 0.U)
//    val hit0 = WireInit(UInt(1.W) ,init = 0.U)
//    val hit1 = WireInit(UInt(1.W) ,init = 0.U)
//
//  //  btb_upper_hit :=  (0 until BTB_SIZE).map(i=> ((btbdata(i)(BTB_DWIDTH_TOP,FA_TAG_END_UPPER) === io.ifc_fetch_addr_f(30,FA_CMP_LOWER)) & btbdata(i)(0) & ~wr0_en(i)))
//  //  val btb_offset_0  = (0 until BTB_SIZE).map(i=> (btbdata(i)(FA_TAG_START_LOWER,FA_TAG_END_LOWER) === io.ifc_fetch_addr_f(FA_CMP_LOWER-1,1)) & btb_upper_hit(i))
// //   val btb_offset_1  = (0 until BTB_SIZE).map(i=> (btbdata(i)(FA_TAG_START_LOWER,FA_TAG_END_LOWER) === ifc_fetch_addr_p1_f(FA_CMP_LOWER-1,1)) & btb_upper_hit(i))
//
//    // hit unless we are also writing this entry at the same time
//    val hit0_index = MuxCase(1.U, (0 until BTB_SIZE).map(i=> btb_offset_0(i) -> i.U))
//    val hit1_index = MuxCase(1.U, (0 until BTB_SIZE).map(i=> btb_offset_1(i) -> i.U))
//    // Mux out the 2 potential branches
//   btb_vbank0_rd_data_f := (0 until BTB_SIZE ).map(i=> if(btb_offset_1(i) == 1) Mux(fetch_mp_collision_f,btb_wr_data,btbdata(i)) else 0.U ).reverse.reduce(Cat(_,_))
//   btb_vbank1_rd_data_f :=(0 until BTB_SIZE).map(i=> if(btb_offset_1(i) == 1) Mux(fetch_mp_collision_p1_f,btb_wr_data,btbdata(i)) else 0.U).reverse.reduce(Cat(_,_))
//    val btb_fa_wr_addr0 = MuxCase(1.U, (0 until BTB_SIZE).map(i=> !btb_used(i) -> i.U))
//
//    vwayhit_f := Cat(hit1,hit0) & Cat(eoc_mask,1.U)
//    way_raw := vwayhit_f | Cat(fetch_mp_collision_p1_f, fetch_mp_collision_f)
//    wr0_en := (0 until BTB_SIZE).map(i=> ((btb_fa_wr_addr0(BTB_FA_INDEX,0) === i.asUInt()) & (exu_mp_valid_write & ~io.exu_bp.exu_mp_pkt.bits.way)) |
//    ((io.dec_fa_error_index === i.asUInt()) & dec_tlu_error_wb)).reverse.reduce(Cat(_,_))
//    btbdata := (0 until BTB_SIZE).map(i=> rvdffe(btb_wr_data,wr0_en(i),clock,io.scan_mode))
//
//    io.ifu_bp_fa_index_f(1) := Mux(hit1,hit1_index,0.U)
//    io.ifu_bp_fa_index_f(0) := Mux(hit0,hit0_index,0.U)
//
//    val btb_used_reset = btb_used.andR()
//    val btb_used_ns = Mux1H(Seq(
//      vwayhit_f(1).asBool -> (1.U(32.W) << hit1_index(BTB_FA_INDEX,0)),
//      vwayhit_f(0).asBool() -> (1.U(32.W) << hit0_index(BTB_FA_INDEX,0)),
//      (exu_mp_valid_write & !io.exu_bp.exu_mp_pkt.bits.way & !dec_tlu_error_wb).asBool() -> (1.U(32.W) << btb_fa_wr_addr0(BTB_FA_INDEX,0)),
//      btb_used_reset.asBool -> Fill(BTB_SIZE,0.U),
//      (!btb_used_reset & dec_tlu_error_wb ).asBool  -> (btb_used & ~(1.U(32.W) << io.dec_fa_error_index(BTB_FA_INDEX,0))),
//      !(btb_used_reset | dec_tlu_error_wb ).asBool() -> btb_used
//    ))
//    val write_used = btb_used_reset | io.ifu_bp_hit_taken_f | exu_mp_valid_write | dec_tlu_error_wb
//     btb_used := rvdffe(btb_used_ns,write_used.asBool(),clock,io.scan_mode)
//  }

  val bht_bank_clken = Wire(Vec(2, Vec(BHT_ARRAY_DEPTH/NUM_BHT_LOOP, Bool())))

  val bht_bank_clk = Wire(Vec(2, Vec(BHT_ARRAY_DEPTH/NUM_BHT_LOOP, Clock())))
  if(RV_FPGA_OPTIMIZE) {
  for(i<-0 until 2; k<- 0 until (BHT_ARRAY_DEPTH/NUM_BHT_LOOP)) bht_bank_clk(i)(k) := rvclkhdr(clock, bht_bank_clken(i)(k), io.scan_mode)
//    (0 until 2).map(i=>(0 until (BHT_ARRAY_DEPTH/NUM_BHT_LOOP)).map(k=>rvclkhdr(clock, bht_bank_clken(i)(k), io.scan_mode)))

  }
  for(i<-0 until 2; k<- 0 until (BHT_ARRAY_DEPTH/NUM_BHT_LOOP)){
  // Checking if there is a write enable with address for the BHT
    bht_bank_clken(i)(k) := (bht_wr_en0(i) & ((bht_wr_addr0(BHT_ADDR_HI-BHT_ADDR_LO,NUM_BHT_LOOP_OUTER_LO-2)===k.U) |  BHT_NO_ADDR_MATCH.B)) |
                            (bht_wr_en2(i) & ((bht_wr_addr2(BHT_ADDR_HI-BHT_ADDR_LO,NUM_BHT_LOOP_OUTER_LO-2)===k.U) |  BHT_NO_ADDR_MATCH.B))
  }
  // Writing data into the BHT (DEC-side) or (EXU-side)
  val bht_bank_wr_data = (0 until 2).map(i=>(0 until BHT_ARRAY_DEPTH/NUM_BHT_LOOP).map(k=>(0 until NUM_BHT_LOOP).map(j=>
    Mux((bht_wr_en2(i)&(bht_wr_addr2(NUM_BHT_LOOP_INNER_HI-BHT_ADDR_LO,0)===j.U)&((bht_wr_addr2(BHT_ADDR_HI-BHT_ADDR_LO,NUM_BHT_LOOP_OUTER_LO-BHT_ADDR_LO)===k.U)|BHT_NO_ADDR_MATCH.B)).asBool, bht_wr_data2, bht_wr_data0))))

  val bht_bank_sel = Wire(Vec(2, Vec(BHT_ARRAY_DEPTH/NUM_BHT_LOOP, Vec(NUM_BHT_LOOP, Bool()))))

  // We have a 2 way bht with BHT_ARRAY_DEPTH/NUM_BHT_LOOP blocks and NUM_BHT_LOOP->offset in each block
  // Make enables of each flop according to the address dividing the address in 2-blocks upper block for BHT-Block and
    // the lower block for the offset and run this on both of the ways

  for(i<-0 until 2; k<-0 until BHT_ARRAY_DEPTH/NUM_BHT_LOOP; j<- 0 until NUM_BHT_LOOP){
    bht_bank_sel(i)(k)(j) := (bht_wr_en0(i) & (bht_wr_addr0(NUM_BHT_LOOP_INNER_HI-BHT_ADDR_LO,0)===j.asUInt) & ((bht_wr_addr0(BHT_ADDR_HI-BHT_ADDR_LO, NUM_BHT_LOOP_OUTER_LO-BHT_ADDR_LO)===k.asUInt) | BHT_NO_ADDR_MATCH.B)) |
      (bht_wr_en2(i) & (bht_wr_addr2(NUM_BHT_LOOP_INNER_HI-BHT_ADDR_LO,0)===j.asUInt) & ((bht_wr_addr2(BHT_ADDR_HI-BHT_ADDR_LO, NUM_BHT_LOOP_OUTER_LO-BHT_ADDR_LO)===k.asUInt) | BHT_NO_ADDR_MATCH.B))
  }
  // Reading the BHT with i->way, k->block and the j->offset
  val bht_bank_rd_data_out = Wire(Vec(2, Vec(BHT_ARRAY_DEPTH, UInt(2.W))))
  for(i<-0 until 2; k<-0 until BHT_ARRAY_DEPTH/NUM_BHT_LOOP; j<-0 until NUM_BHT_LOOP){
    bht_bank_rd_data_out(i)((16*k)+j) := rvdffs_fpga(bht_bank_wr_data(i)(k)(j), bht_bank_sel(i)(k)(j),bht_bank_clk(i)(k),bht_bank_sel(i)(k)(j),clock)}

    // Make the final read mux
  bht_bank0_rd_data_f := Mux1H((0 until BHT_ARRAY_DEPTH).map(i=>(bht_rd_addr_f===i.U).asBool->bht_bank_rd_data_out(0)(i)))
  bht_bank1_rd_data_f := Mux1H((0 until BHT_ARRAY_DEPTH).map(i=>(bht_rd_addr_f===i.U).asBool->bht_bank_rd_data_out(1)(i)))
  bht_bank0_rd_data_p1_f := Mux1H((0 until BHT_ARRAY_DEPTH).map(i=>(bht_rd_addr_p1_f===i.U).asBool->bht_bank_rd_data_out(0)(i)))
}
object bp_MAIN extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new ifu_bp_ctl()))
}