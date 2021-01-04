

module el2_dec_decode_ctl
`include "parameter.sv"
  (

   input logic dec_tlu_flush_extint,

   input logic dec_tlu_force_halt, // invalidate nonblock load cam on a force halt event

   output logic dec_extint_stall,

   input  logic [15:0] ifu_i0_cinst,          // 16b compressed instruction
   output logic [31:0] dec_i0_inst_wb1,       // 32b instruction at wb+1 for trace encoder
   output logic [31:1] dec_i0_pc_wb1,         // 31b pc at wb+1 for trace encoder


   input logic                                lsu_nonblock_load_valid_m,       // valid nonblock load at m
   input logic [LSU_NUM_NBLOAD_WIDTH-1:0]  lsu_nonblock_load_tag_m,         // -> corresponding tag
   input logic                                lsu_nonblock_load_inv_r,         // invalidate request for nonblock load r
   input logic [LSU_NUM_NBLOAD_WIDTH-1:0]  lsu_nonblock_load_inv_tag_r,     // -> corresponding tag
   input logic                                lsu_nonblock_load_data_valid,    // valid nonblock load data back
   input logic                                lsu_nonblock_load_data_error,    // nonblock load bus error
   input logic [LSU_NUM_NBLOAD_WIDTH-1:0]  lsu_nonblock_load_data_tag,      // -> corresponding tag

   input logic [31:0]                         lsu_nonblock_load_data,          // nonblock load data


   input logic [3:0] dec_i0_trigger_match_d,          // i0 decode trigger matches

   input logic dec_tlu_wr_pause_r,                    // pause instruction at r
   input logic dec_tlu_pipelining_disable,            // pipeline disable - presync, i0 decode only

   input logic [3:0]  lsu_trigger_match_m,            // lsu trigger matches

   input logic lsu_pmu_misaligned_m,                  // perf mon: load/store misalign
   input logic dec_tlu_debug_stall,                   // debug stall decode
   input logic dec_tlu_flush_leak_one_r,              // leak1 instruction

   input logic dec_debug_fence_d,                     // debug fence instruction

   input logic [1:0] dbg_cmd_wrdata,                  // disambiguate fence, fence_i

   input logic dec_i0_icaf_d,                         // icache access fault
   input logic dec_i0_icaf_f1_d,                      // i0 instruction access fault at decode for f1 fetch group
   input logic [1:0] dec_i0_icaf_type_d,              // i0 instruction access fault type

   input logic dec_i0_dbecc_d,                        // icache/iccm double-bit error

   input el2_br_pkt_t dec_i0_brp,                         // branch packet
   input logic [BTB_ADDR_HI:BTB_ADDR_LO] dec_i0_bp_index,            // i0 branch index
   input logic [BHT_GHR_SIZE-1:0] dec_i0_bp_fghr, // BP FGHR
   input logic [BTB_BTAG_SIZE-1:0] dec_i0_bp_btag, // BP tag

   input logic [31:1] dec_i0_pc_d,                    // pc

   input logic lsu_idle_any,                          // lsu idle: if fence instr & ~lsu_idle then stall decode

   input logic lsu_load_stall_any,                    // stall any load at decode
   input logic lsu_store_stall_any,                   // stall any store at decode
   input logic dma_dccm_stall_any,                    // stall any load/store at decode

   input logic exu_div_wren,                          // nonblocking divide write enable to GPR.

   input logic dec_tlu_i0_kill_writeb_wb,             // I0 is flushed, don't writeback any results to arch state
   input logic dec_tlu_flush_lower_wb,                // trap lower flush
   input logic dec_tlu_i0_kill_writeb_r,              // I0 is flushed, don't writeback any results to arch state
   input logic dec_tlu_flush_lower_r,                 // trap lower flush
   input logic dec_tlu_flush_pause_r,                 // don't clear pause state on initial lower flush
   input logic dec_tlu_presync_d,                     // CSR read needs to be presync'd
   input logic dec_tlu_postsync_d,                    // CSR ops that need to be postsync'd

   input logic dec_i0_pc4_d,                          // inst is 4B inst else 2B

   input logic [31:0] dec_csr_rddata_d,               // csr read data at wb
   input logic dec_csr_legal_d,                       // csr indicates legal operation

   input logic [31:0] exu_csr_rs1_x,                  // rs1 for csr instr

   input logic [31:0] lsu_result_m,                   // load result
   input logic [31:0] lsu_result_corr_r,              // load result - corrected data for writing gpr's, not for bypassing

   input logic exu_flush_final,                       // lower flush or i0 flush at X or D

   input logic [31:1] exu_i0_pc_x,                    // pcs at e1

   input logic [31:0] dec_i0_instr_d,                 // inst at decode

   input logic  dec_ib0_valid_d,                      // inst valid at decode

   input logic [31:0] exu_i0_result_x,                // from primary alu's

   input logic  clk,                                  // for rvdffe's
   input logic  free_clk,
   input logic  active_clk,                           // clk except for halt / pause

   input logic  clk_override,                         // test stuff
   input logic  rst_l,



   output logic         dec_i0_rs1_en_d,              // rs1 enable at decode
   output logic         dec_i0_rs2_en_d,

   output logic [4:0] dec_i0_rs1_d,                   // rs1 logical source
   output logic [4:0] dec_i0_rs2_d,

   output logic [31:0] dec_i0_immed_d,                // 32b immediate data decode


   output logic [12:1] dec_i0_br_immed_d,             // 12b branch immediate

   output el2_alu_pkt_t i0_ap,                            // alu packets

   output logic          dec_i0_decode_d,             // i0 decode

   output logic          dec_i0_alu_decode_d,         // decode to D-stage alu

   output logic [31:0]   dec_i0_rs1_bypass_data_d,    // i0 rs1 bypass data
   output logic [31:0]   dec_i0_rs2_bypass_data_d,    // i0 rs2 bypass data


   output logic [4:0]  dec_i0_waddr_r,                // i0 logical source to write to gpr's
   output logic        dec_i0_wen_r,                  // i0 write enable
   output logic [31:0] dec_i0_wdata_r,                // i0 write data

   output logic          dec_i0_select_pc_d,          // i0 select pc for rs1 - branches

   output logic [1:0]    dec_i0_rs1_bypass_en_d,      // i0 rs1 bypass enable
   output logic [1:0]    dec_i0_rs2_bypass_en_d,      // i0 rs2 bypass enable

   output el2_lsu_pkt_t    lsu_p,                    // load/store packet

   output el2_mul_pkt_t    mul_p,                    // multiply packet

   output el2_div_pkt_t    div_p,                    // divide packet
   output logic [4:0]       div_waddr_wb,             // DIV write address to GPR
   output logic             dec_div_cancel,           // cancel the divide operation

   output logic        dec_lsu_valid_raw_d,
   output logic [11:0] dec_lsu_offset_d,

   output logic        dec_csr_ren_d,                 // valid csr decode
   output logic        dec_csr_wen_unq_d,             // valid csr with write - for csr legal
   output logic        dec_csr_any_unq_d,             // valid csr - for csr legal
   output logic [11:0] dec_csr_rdaddr_d,              // read address for csr
   output logic        dec_csr_wen_r,                 // csr write enable at r
   output logic [11:0] dec_csr_wraddr_r,              // write address for csr
   output logic [31:0] dec_csr_wrdata_r,              // csr write data at r
   output logic        dec_csr_stall_int_ff,          // csr is mie/mstatus

   output              dec_tlu_i0_valid_r,            // i0 valid inst at c

   output el2_trap_pkt_t   dec_tlu_packet_r,              // trap packet

   output logic [31:1] dec_tlu_i0_pc_r,               // i0 trap pc

   output logic [31:0] dec_illegal_inst,              // illegal inst
   output logic [31:1] pred_correct_npc_x,            // npc e2 if the prediction is correct

   output el2_predict_pkt_t dec_i0_predict_p_d,      // i0 predict packet decode
   output logic [BHT_GHR_SIZE-1:0] i0_predict_fghr_d, // i0 predict fghr
   output logic [BTB_ADDR_HI:BTB_ADDR_LO] i0_predict_index_d, // i0 predict index
   output logic [BTB_BTAG_SIZE-1:0] i0_predict_btag_d, // i0_predict branch tag

   output logic [1:0] dec_data_en,                    // clock-gating logic
   output logic [1:0] dec_ctl_en,

   output logic       dec_pmu_instr_decoded,          // number of instructions decode this cycle encoded
   output logic       dec_pmu_decode_stall,           // decode is stalled
   output logic       dec_pmu_presync_stall,          // decode has presync stall
   output logic       dec_pmu_postsync_stall,         // decode has postsync stall

   output logic       dec_nonblock_load_wen,          // write enable for nonblock load
   output logic [4:0] dec_nonblock_load_waddr,        // logical write addr for nonblock load
   output logic       dec_pause_state,                // core in pause state
   output logic       dec_pause_state_cg,             // pause state for clock-gating

   output logic       dec_div_active,                 // non-block divide is active

   input  logic       scan_mode
   );




   el2_dec_pkt_t           i0_dp_raw, i0_dp;

   logic [31:0]        i0;
   logic               i0_valid_d;

   logic [31:0]        i0_result_r;

   logic [2:0]         i0_rs1bypass, i0_rs2bypass;

   logic               i0_jalimm20;
   logic               i0_uiimm20;

   logic               lsu_decode_d;
   logic [31:0]        i0_immed_d;
   logic               i0_presync;
   logic               i0_postsync;

   logic               postsync_stall;
   logic               ps_stall;

   logic               prior_inflight, prior_inflight_wb;

   logic               csr_clr_d, csr_set_d, csr_write_d;

   logic               csr_clr_x,csr_set_x,csr_write_x,csr_imm_x;
   logic [31:0]        csr_mask_x;
   logic [31:0]        write_csr_data_x;
   logic [31:0]        write_csr_data_in;
   logic [31:0]        write_csr_data;
   logic               csr_data_wen;

   logic [4:0]         csrimm_x;

   logic [31:0]        csr_rddata_x;

   logic               mul_decode_d;
   logic               div_decode_d;
   logic               div_e1_to_r;
   logic               div_flush;
   logic               div_active_in;
   logic               div_active;
   logic               i0_nonblock_div_stall;
   logic               i0_div_prior_div_stall;
   logic               nonblock_div_cancel;

   logic               i0_legal;
   logic               shift_illegal;
   logic               illegal_inst_en;
   logic               illegal_lockout_in, illegal_lockout;
   logic               i0_legal_decode_d;
   logic               i0_exulegal_decode_d, i0_exudecode_d, i0_exublock_d;

   logic [12:1]        last_br_immed_d;
   logic               i0_rs1_depend_i0_x, i0_rs1_depend_i0_r;
   logic               i0_rs2_depend_i0_x, i0_rs2_depend_i0_r;

   logic               i0_div_decode_d;
   logic               i0_load_block_d;
   logic [1:0]         i0_rs1_depth_d, i0_rs2_depth_d;

   logic               i0_load_stall_d;
   logic               i0_store_stall_d;

   logic               i0_predict_nt, i0_predict_t;

   logic               i0_notbr_error, i0_br_toffset_error;
   logic               i0_ret_error;
   logic               i0_br_error;
   logic               i0_br_error_all;
   logic [11:0]        i0_br_offset;

   logic [20:1]        i0_pcall_imm;                          // predicted jal's
   logic               i0_pcall_12b_offset;
   logic               i0_pcall_raw;
   logic               i0_pcall_case;
   logic               i0_pcall;

   logic               i0_pja_raw;
   logic               i0_pja_case;
   logic               i0_pja;

   logic               i0_pret_case;
   logic               i0_pret_raw, i0_pret;

   logic               i0_jal;                                // jal's that are not predicted


   logic               i0_predict_br;

   logic               store_data_bypass_d, store_data_bypass_m;

   el2_class_pkt_t         i0_rs1_class_d, i0_rs2_class_d;

   el2_class_pkt_t         i0_d_c, i0_x_c, i0_r_c;


   logic               i0_ap_pc2, i0_ap_pc4;

   logic               i0_rd_en_d;

   logic               load_ldst_bypass_d;

   logic               leak1_i0_stall_in, leak1_i0_stall;
   logic               leak1_i1_stall_in, leak1_i1_stall;
   logic               leak1_mode;

   logic               i0_csr_write_only_d;

   logic               prior_inflight_x, prior_inflight_eff;
   logic               any_csr_d;

   logic               prior_csr_write;

   logic [3:0]        i0_pipe_en;
   logic              i0_r_ctl_en,  i0_x_ctl_en,  i0_wb_ctl_en;
   logic              i0_x_data_en, i0_r_data_en, i0_wb_data_en, i0_wb1_data_en;

   logic              debug_fence_i;
   logic              debug_fence;

   logic              i0_csr_write;
   logic              presync_stall;

   logic              i0_instr_error;
   logic              i0_icaf_d;

   logic              clear_pause;
   logic              pause_state_in, pause_state;
   logic              pause_stall;

   logic              i0_brp_valid;
   logic              nonblock_load_cancel;
   logic              lsu_idle;
   logic              lsu_pmu_misaligned_r;
   logic              csr_ren_qual_d;
   logic              csr_read_x;
   logic              i0_block_d;
   logic              i0_block_raw_d;  // This is use to create the raw valid
   logic              ps_stall_in;
   logic [31:0]       i0_result_x;

   el2_dest_pkt_t         d_d, x_d, r_d, wbd;
   el2_dest_pkt_t         x_d_in, r_d_in;

   el2_trap_pkt_t         d_t, x_t, x_t_in, r_t_in, r_t;

   logic [3:0]        lsu_trigger_match_r;

   logic [31:1]       dec_i0_pc_r;

   logic csr_read, csr_write;
   logic i0_br_unpred;

   logic nonblock_load_valid_m_delay;
   logic i0_wen_r;

   logic tlu_wr_pause_r1;
   logic tlu_wr_pause_r2;

   logic flush_final_r;

   logic              data_gate_en;
   logic              data_gate_clk;


   localparam NBLOAD_SIZE     = LSU_NUM_NBLOAD;
   localparam NBLOAD_SIZE_MSB = int'(LSU_NUM_NBLOAD)-1;
   localparam NBLOAD_TAG_MSB  = LSU_NUM_NBLOAD_WIDTH-1;


   logic                     cam_write, cam_inv_reset, cam_data_reset;
   logic [NBLOAD_TAG_MSB:0]  cam_write_tag, cam_inv_reset_tag, cam_data_reset_tag;
   logic [NBLOAD_SIZE_MSB:0] cam_wen;

   logic [NBLOAD_TAG_MSB:0]  load_data_tag;
   logic [NBLOAD_SIZE_MSB:0] nonblock_load_write;

   el2_load_cam_pkt_t [NBLOAD_SIZE_MSB:0] cam;
   el2_load_cam_pkt_t [NBLOAD_SIZE_MSB:0] cam_in;
   el2_load_cam_pkt_t [NBLOAD_SIZE_MSB:0] cam_raw;

   logic [4:0] nonblock_load_rd;
   logic i0_nonblock_load_stall;
   logic i0_nonblock_boundary_stall;

   logic i0_rs1_nonblock_load_bypass_en_d, i0_rs2_nonblock_load_bypass_en_d;

   logic i0_load_kill_wen_r;

   logic found;

   logic [NBLOAD_SIZE_MSB:0] cam_inv_reset_val, cam_data_reset_val;

   logic debug_fence_raw;

   logic [31:0] i0_result_r_raw;
   logic [31:0] i0_result_corr_r;

   logic [12:1] last_br_immed_x;

   logic [24:7]        div_inst;
   logic [31:0]        i0_inst_d;
   logic [31:0]        i0_inst_x;
   logic [31:0]        i0_inst_r;
   logic [31:0]        i0_inst_wb_in;
   logic [31:0]        i0_inst_wb;

   logic [31:1]        i0_pc_wb;

   logic               i0_wb_en;
   logic               i0_wb1_en;

   el2_inst_pkt_t i0_itype;
   el2_reg_pkt_t i0r;




   // Start - Data gating {{


   assign data_gate_en  = (dec_tlu_wr_pause_r    ^  tlu_wr_pause_r1   ) |   // replaces free_clk
                          (tlu_wr_pause_r1       ^  tlu_wr_pause_r2   ) |   // replaces free_clk
                          (dec_tlu_flush_extint  ^  dec_extint_stall  ) |
                          (leak1_i1_stall_in     ^  leak1_i1_stall    ) |   // replaces free_clk
                          (leak1_i0_stall_in     ^  leak1_i0_stall    ) |   // replaces free_clk
                          (pause_state_in        ^  pause_state       ) |   // replaces free_clk
                          (ps_stall_in           ^  ps_stall          ) |   // replaces free_clk
                          (exu_flush_final       ^  flush_final_r     ) |   // replaces free_clk
                          (illegal_lockout_in    ^  illegal_lockout   );    // replaces active_clk

   rvclkhdr data_gated_cgc        (.*, .en(data_gate_en),    .l1clk(data_gate_clk));

   // End  - Data gating }}



// branch prediction


   // in leak1_mode, ignore any predictions for i0, treat branch as if we haven't seen it before
   // in leak1 mode, also ignore branch errors for i0
   assign i0_brp_valid                        =  dec_i0_brp.valid & ~leak1_mode;

   assign dec_i0_predict_p_d.misp        =  '0;
   assign dec_i0_predict_p_d.ataken      =  '0;
   assign dec_i0_predict_p_d.boffset     =  '0;

   assign dec_i0_predict_p_d.pcall       =  i0_pcall;  // don't mark as pcall if branch error
   assign dec_i0_predict_p_d.pja         =  i0_pja;
   assign dec_i0_predict_p_d.pret        =  i0_pret;
   assign dec_i0_predict_p_d.prett[31:1] =  dec_i0_brp.prett[31:1];
   assign dec_i0_predict_p_d.pc4         =  dec_i0_pc4_d;
   assign dec_i0_predict_p_d.hist[1:0]   =  dec_i0_brp.hist[1:0];
   assign dec_i0_predict_p_d.valid       =  i0_brp_valid & i0_legal_decode_d;
   assign i0_notbr_error                 =  i0_brp_valid & ~(i0_dp_raw.condbr | i0_pcall_raw | i0_pja_raw | i0_pret_raw);

   // no toffset error for a pret
   assign i0_br_toffset_error                               =  i0_brp_valid & dec_i0_brp.hist[1] & (dec_i0_brp.toffset[11:0] != i0_br_offset[11:0]) & ~i0_pret_raw;
   assign i0_ret_error                                      =  i0_brp_valid & dec_i0_brp.ret & ~i0_pret_raw;
   assign i0_br_error                                       =  dec_i0_brp.br_error | i0_notbr_error | i0_br_toffset_error | i0_ret_error;
   assign dec_i0_predict_p_d.br_error                       =  i0_br_error & i0_legal_decode_d & ~leak1_mode;
   assign dec_i0_predict_p_d.br_start_error                 =  dec_i0_brp.br_start_error & i0_legal_decode_d & ~leak1_mode;
   assign i0_predict_index_d[BTB_ADDR_HI:BTB_ADDR_LO] =  dec_i0_bp_index;

   assign i0_predict_btag_d[BTB_BTAG_SIZE-1:0]           =  dec_i0_bp_btag[BTB_BTAG_SIZE-1:0];
   assign i0_br_error_all                                   = (i0_br_error | dec_i0_brp.br_start_error) & ~leak1_mode;
   assign dec_i0_predict_p_d.toffset[11:0]                  =  i0_br_offset[11:0];
   assign i0_predict_fghr_d[BHT_GHR_SIZE-1:0]            =  dec_i0_bp_fghr[BHT_GHR_SIZE-1:0];
   assign dec_i0_predict_p_d.way                            =  dec_i0_brp.way;

   //   end

   // on br error turn anything into a nop
   // on i0 instruction fetch access fault turn anything into a nop
   // nop =>   alu rs1 imm12 rd lor

   assign i0_icaf_d = dec_i0_icaf_d | dec_i0_dbecc_d;

   assign i0_instr_error = i0_icaf_d;

   always_comb begin
      i0_dp = i0_dp_raw;
      if (i0_br_error_all | i0_instr_error) begin
         i0_dp          =   '0;
         i0_dp.alu      = 1'b1;
         i0_dp.rs1      = 1'b1;
         i0_dp.rs2      = 1'b1;
         i0_dp.lor      = 1'b1;
         i0_dp.legal    = 1'b1;
         i0_dp.postsync = 1'b1;
      end
   end

   assign i0[31:0] = dec_i0_instr_d[31:0];

   assign dec_i0_select_pc_d = i0_dp.pc;

   // branches that can be predicted

   assign i0_predict_br =  i0_dp.condbr | i0_pcall | i0_pja | i0_pret;

   assign i0_predict_nt = ~(dec_i0_brp.hist[1] & i0_brp_valid) & i0_predict_br;
   assign i0_predict_t  =  (dec_i0_brp.hist[1] & i0_brp_valid) & i0_predict_br;

   assign i0_ap.add     =  i0_dp.add;
   assign i0_ap.sub     =  i0_dp.sub;
   assign i0_ap.land    =  i0_dp.land;
   assign i0_ap.lor     =  i0_dp.lor;
   assign i0_ap.lxor    =  i0_dp.lxor;
   assign i0_ap.sll     =  i0_dp.sll;
   assign i0_ap.srl     =  i0_dp.srl;
   assign i0_ap.sra     =  i0_dp.sra;
   assign i0_ap.slt     =  i0_dp.slt;
   assign i0_ap.unsign  =  i0_dp.unsign;
   assign i0_ap.beq     =  i0_dp.beq;
   assign i0_ap.bne     =  i0_dp.bne;
   assign i0_ap.blt     =  i0_dp.blt;
   assign i0_ap.bge     =  i0_dp.bge;

   assign i0_ap.csr_write =  i0_csr_write_only_d;
   assign i0_ap.csr_imm   =  i0_dp.csr_imm;
   assign i0_ap.jal       =  i0_jal;

   assign i0_ap_pc2 = ~dec_i0_pc4_d;
   assign i0_ap_pc4 =  dec_i0_pc4_d;

   assign i0_ap.predict_nt = i0_predict_nt;
   assign i0_ap.predict_t  = i0_predict_t;


// non block load cam logic

   always_comb begin
      found = 0;
      cam_wen[NBLOAD_SIZE_MSB:0] = '0;
      for (int i=0; i<32'(NBLOAD_SIZE); i++) begin
         if (~found) begin
            if (~cam[i].valid) begin
               cam_wen[i] = cam_write;
               found = 1'b1;
            end
         end
      end
   end


   assign cam_write          = lsu_nonblock_load_valid_m;
   assign cam_write_tag[NBLOAD_TAG_MSB:0] = lsu_nonblock_load_tag_m[NBLOAD_TAG_MSB:0];

   assign cam_inv_reset          = lsu_nonblock_load_inv_r;
   assign cam_inv_reset_tag[NBLOAD_TAG_MSB:0] = lsu_nonblock_load_inv_tag_r[NBLOAD_TAG_MSB:0];

   assign cam_data_reset          = lsu_nonblock_load_data_valid | lsu_nonblock_load_data_error;
   assign cam_data_reset_tag[NBLOAD_TAG_MSB:0] = lsu_nonblock_load_data_tag[NBLOAD_TAG_MSB:0];

   assign nonblock_load_rd[4:0] = (x_d.i0load) ? x_d.i0rd[4:0] : 5'b0;  // rd data


   // checks

`ifdef ASSERT_ON
   assert_dec_data_valid_data_error_onehot:    assert #0 ($onehot0({lsu_nonblock_load_data_valid,lsu_nonblock_load_data_error}));
   assert_dec_cam_inv_reset_onehot:            assert #0 ($onehot0(cam_inv_reset_val[NBLOAD_SIZE_MSB:0]));
   assert_dec_cam_data_reset_onehot:           assert #0 ($onehot0(cam_data_reset_val[NBLOAD_SIZE_MSB:0]));
`endif



    // case of multiple loads to same dest ie. x1 ... you have to invalidate the older one

   for (genvar i=0; i<NBLOAD_SIZE; i++) begin : cam_array

      assign cam_inv_reset_val[i] = cam_inv_reset   & (cam_inv_reset_tag[NBLOAD_TAG_MSB:0]  == cam[i].tag[NBLOAD_TAG_MSB:0]) & cam[i].valid;

      assign cam_data_reset_val[i] = cam_data_reset & (cam_data_reset_tag[NBLOAD_TAG_MSB:0] == cam_raw[i].tag[NBLOAD_TAG_MSB:0]) & cam_raw[i].valid;

      always_comb begin

         cam[i] = cam_raw[i];

         if (cam_data_reset_val[i])
           cam[i].valid = 1'b0;

         cam_in[i] = '0;

         if (cam_wen[i]) begin
            cam_in[i].valid    = 1'b1;
            cam_in[i].wb       = 1'b0;
            cam_in[i].tag[NBLOAD_TAG_MSB:0] = cam_write_tag[NBLOAD_TAG_MSB:0];
            cam_in[i].rd[4:0]  = nonblock_load_rd[4:0];
         end
         else if ( (cam_inv_reset_val[i]) |
                   (i0_wen_r & (r_d_in.i0rd[4:0] == cam[i].rd[4:0]) & cam[i].wb) )
           cam_in[i].valid = 1'b0;
         else
           cam_in[i] = cam[i];

         if (nonblock_load_valid_m_delay & (lsu_nonblock_load_inv_tag_r[NBLOAD_TAG_MSB:0]==cam[i].tag[NBLOAD_TAG_MSB:0]) & cam[i].valid)
           cam_in[i].wb = 1'b1;

         // force debug halt forces cam valids to 0; highest priority
         if (dec_tlu_force_halt)
           cam_in[i].valid = 1'b0;
      end

   rvdff #( $bits(el2_load_cam_pkt_t) ) cam_ff (.*, .clk(free_clk), .din(cam_in[i]), .dout(cam_raw[i]));


   assign nonblock_load_write[i] = (load_data_tag[NBLOAD_TAG_MSB:0] == cam_raw[i].tag[NBLOAD_TAG_MSB:0]) & cam_raw[i].valid;


end : cam_array



   assign load_data_tag[NBLOAD_TAG_MSB:0] = lsu_nonblock_load_data_tag[NBLOAD_TAG_MSB:0];

`ifdef ASSERT_ON
   assert_dec_cam_nonblock_load_write_onehot:   assert #0 ($onehot0(nonblock_load_write[NBLOAD_SIZE_MSB:0]));
`endif


   assign nonblock_load_cancel = ((r_d_in.i0rd[4:0] == dec_nonblock_load_waddr[4:0]) & i0_wen_r);     // cancel if any younger inst (including another nonblock) committing this cycle


   assign dec_nonblock_load_wen = lsu_nonblock_load_data_valid & |nonblock_load_write[NBLOAD_SIZE_MSB:0] & ~nonblock_load_cancel;

   always_comb begin

      dec_nonblock_load_waddr[4:0] = '0;
      i0_nonblock_load_stall = i0_nonblock_boundary_stall;

      for (int i=0; i<32'(NBLOAD_SIZE); i++) begin
         dec_nonblock_load_waddr[4:0] |= ({5{nonblock_load_write[i]}} & cam[i].rd[4:0]);
         i0_nonblock_load_stall |= dec_i0_rs1_en_d & cam[i].valid & (cam[i].rd[4:0] == i0r.rs1[4:0]);
         i0_nonblock_load_stall |= dec_i0_rs2_en_d & cam[i].valid & (cam[i].rd[4:0] == i0r.rs2[4:0]);
      end

   end

   assign i0_nonblock_boundary_stall = ((nonblock_load_rd[4:0]==i0r.rs1[4:0]) & lsu_nonblock_load_valid_m & dec_i0_rs1_en_d) |
                                       ((nonblock_load_rd[4:0]==i0r.rs2[4:0]) & lsu_nonblock_load_valid_m & dec_i0_rs2_en_d);



// don't writeback a nonblock load

   rvdffs #(1) wbnbloaddelayff (.*, .clk(active_clk), .en(i0_r_ctl_en ), .din(lsu_nonblock_load_valid_m),        .dout(nonblock_load_valid_m_delay) );

   assign i0_load_kill_wen_r = nonblock_load_valid_m_delay &  r_d.i0load;



// end non block load cam logic

// pmu start




   assign csr_read = csr_ren_qual_d;
   assign csr_write = dec_csr_wen_unq_d;

   assign i0_br_unpred = i0_dp.jal & ~i0_predict_br;

   // the classes must be mutually exclusive with one another

   always_comb begin
      i0_itype = NULL;

      if (i0_legal_decode_d) begin
         if (i0_dp.mul)                  i0_itype = MUL;
         if (i0_dp.load)                 i0_itype = LOAD;
         if (i0_dp.store)                i0_itype = STORE;
         if (i0_dp.pm_alu)               i0_itype = ALU;
         if ( csr_read & ~csr_write)     i0_itype = CSRREAD;
         if (~csr_read &  csr_write)     i0_itype = CSRWRITE;
         if ( csr_read &  csr_write)     i0_itype = CSRRW;
         if (i0_dp.ebreak)               i0_itype = EBREAK;
         if (i0_dp.ecall)                i0_itype = ECALL;
         if (i0_dp.fence)                i0_itype = FENCE;
         if (i0_dp.fence_i)              i0_itype = FENCEI;  // fencei will set this even with fence attribute
         if (i0_dp.mret)                 i0_itype = MRET;
         if (i0_dp.condbr)               i0_itype = CONDBR;
         if (i0_dp.jal)                  i0_itype = JAL;
      end
   end





// end pmu


   el2_dec_dec_ctl i0_dec (.inst(i0[31:0]),.out(i0_dp_raw));




   rvdff #(1) lsu_idle_ff (.*, .clk(active_clk), .din(lsu_idle_any), .dout(lsu_idle));



   // can't make this clock active_clock
   assign leak1_i1_stall_in = (dec_tlu_flush_leak_one_r | (leak1_i1_stall & ~dec_tlu_flush_lower_r));

   rvdff #(1) leak1_i1_stall_ff (.*, .clk(data_gate_clk), .din(leak1_i1_stall_in), .dout(leak1_i1_stall));

   assign leak1_mode = leak1_i1_stall;

   assign leak1_i0_stall_in = ((dec_i0_decode_d & leak1_i1_stall) | (leak1_i0_stall & ~dec_tlu_flush_lower_r));

   rvdff #(1) leak1_i0_stall_ff (.*, .clk(data_gate_clk), .din(leak1_i0_stall_in), .dout(leak1_i0_stall));



   // 12b jal's can be predicted - these are calls

   assign i0_pcall_imm[20:1] = {i0[31],i0[19:12],i0[20],i0[30:21]};

   assign i0_pcall_12b_offset = (i0_pcall_imm[12]) ? (i0_pcall_imm[20:13] == 8'hff) : (i0_pcall_imm[20:13] == 8'h0);

   assign i0_pcall_case  = i0_pcall_12b_offset & i0_dp_raw.imm20 &  (i0r.rd[4:0] == 5'd1 | i0r.rd[4:0] == 5'd5);
   assign i0_pja_case    = i0_pcall_12b_offset & i0_dp_raw.imm20 & ~(i0r.rd[4:0] == 5'd1 | i0r.rd[4:0] == 5'd5);

   assign i0_pcall_raw   = i0_dp_raw.jal &   i0_pcall_case;   // this includes ja
   assign i0_pcall       = i0_dp.jal     &   i0_pcall_case;

   assign i0_pja_raw     = i0_dp_raw.jal &   i0_pja_case;
   assign i0_pja         = i0_dp.jal     &   i0_pja_case;


   assign i0_br_offset[11:0] = (i0_pcall_raw | i0_pja_raw) ? i0_pcall_imm[12:1] : {i0[31],i0[7],i0[30:25],i0[11:8]};

   assign i0_pret_case = (i0_dp_raw.jal & i0_dp_raw.imm12 & (i0r.rd[4:0] == 5'b0) & (i0r.rs1[4:0] == 5'd1 | i0r.rs1[4:0] == 5'd5));  // jalr with rd==0, rs1==1 or rs1==5 is a ret

   assign i0_pret_raw = i0_dp_raw.jal &   i0_pret_case;
   assign i0_pret     = i0_dp.jal     &   i0_pret_case;

   assign i0_jal      = i0_dp.jal     &  ~i0_pcall_case & ~i0_pja_case & ~i0_pret_case;

   // lsu stuff
   // load/store mutually exclusive
   assign dec_lsu_offset_d[11:0] = ({12{ ~dec_extint_stall & i0_dp.lsu & i0_dp.load}} &               i0[31:20]) |
                                   ({12{ ~dec_extint_stall & i0_dp.lsu & i0_dp.store}} &             {i0[31:25],i0[11:7]});



   assign div_p.valid    =  div_decode_d;

   assign div_p.unsign   =  i0_dp.unsign;
   assign div_p.rem      =  i0_dp.rem;


   assign mul_p.valid    =  mul_decode_d;

   assign mul_p.rs1_sign =  i0_dp.rs1_sign;
   assign mul_p.rs2_sign =  i0_dp.rs2_sign;
   assign mul_p.low      =  i0_dp.low;


   rvdff #(1) extint_stall_ff (.*, .clk(data_gate_clk), .din(dec_tlu_flush_extint), .dout(dec_extint_stall));


   always_comb  begin
      lsu_p = '0;

      if (dec_extint_stall) begin
         lsu_p.load = 1'b1;
         lsu_p.word = 1'b1;
         lsu_p.fast_int = 1'b1;
         lsu_p.valid = 1'b1;
      end
      else begin
         lsu_p.valid = lsu_decode_d;

         lsu_p.load                         =  i0_dp.load ;
         lsu_p.store                        =  i0_dp.store;
         lsu_p.by                           =  i0_dp.by   ;
         lsu_p.half                         =  i0_dp.half ;
         lsu_p.word                         =  i0_dp.word ;

         lsu_p.load_ldst_bypass_d          =  load_ldst_bypass_d ;
         lsu_p.store_data_bypass_d         =  store_data_bypass_d;
         lsu_p.store_data_bypass_m         =  store_data_bypass_m;

         lsu_p.unsign  =  i0_dp.unsign;
      end
   end // always_comb begin

   assign  dec_lsu_valid_raw_d    = (i0_valid_d & (i0_dp_raw.load | i0_dp_raw.store) & ~dma_dccm_stall_any & ~i0_block_raw_d) | dec_extint_stall;



   assign i0r.rs1[4:0] = i0[19:15];
   assign i0r.rs2[4:0] = i0[24:20];
   assign i0r.rd[4:0]  = i0[11:7];


   assign dec_i0_rs1_en_d   =  i0_dp.rs1 & (i0r.rs1[4:0] != 5'd0);  // if rs1_en=0 then read will be all 0's
   assign dec_i0_rs2_en_d   =  i0_dp.rs2 & (i0r.rs2[4:0] != 5'd0);
   assign i0_rd_en_d        =  i0_dp.rd  & (i0r.rd[4:0]  != 5'd0);

   assign dec_i0_rs1_d[4:0] =  i0r.rs1[4:0];
   assign dec_i0_rs2_d[4:0] =  i0r.rs2[4:0];


   assign i0_jalimm20       =  i0_dp.jal & i0_dp.imm20;   // jal
   assign i0_uiimm20        = ~i0_dp.jal & i0_dp.imm20;


   // csr logic

   assign dec_csr_ren_d  = i0_dp.csr_read;
   assign csr_ren_qual_d = i0_dp.csr_read & i0_legal_decode_d;

   assign csr_clr_d =   i0_dp.csr_clr   & i0_legal_decode_d;
   assign csr_set_d   = i0_dp.csr_set   & i0_legal_decode_d;
   assign csr_write_d = i0_csr_write    & i0_legal_decode_d;

   assign i0_csr_write_only_d = i0_csr_write & ~i0_dp.csr_read;

   assign dec_csr_wen_unq_d = (i0_dp.csr_clr | i0_dp.csr_set | i0_csr_write);   // for csr legal, can't write read-only csr

   assign dec_csr_any_unq_d = any_csr_d;


   assign dec_csr_rdaddr_d[11:0]  =  i0[31:20];
   assign dec_csr_wraddr_r[11:0] =  r_d.csrwaddr[11:0];


   // make sure csr doesn't write same cycle as dec_tlu_flush_lower_wb
   // also use valid so it's flushable
   assign dec_csr_wen_r = r_d.csrwen & r_d.i0valid & ~dec_tlu_i0_kill_writeb_r;

   // If we are writing MIE or MSTATUS, hold off the external interrupt for a cycle on the write.
   assign dec_csr_stall_int_ff = ((r_d.csrwaddr[11:0] == 12'h300) | (r_d.csrwaddr[11:0] == 12'h304)) & r_d.csrwen & r_d.i0valid & ~dec_tlu_i0_kill_writeb_wb;


   rvdff #(5) csrmiscff (.*,
                        .clk (active_clk),
                        .din ({csr_ren_qual_d, csr_clr_d, csr_set_d, csr_write_d, i0_dp.csr_imm}),
                        .dout({csr_read_x,     csr_clr_x, csr_set_x, csr_write_x, csr_imm_x})
                       );




   // perform the update operation if any

   rvdffe #(37) csr_rddata_x_ff (.*, .en(i0_x_data_en), .din( {i0[19:15],dec_csr_rddata_d[31:0]}), .dout({csrimm_x[4:0],csr_rddata_x[31:0]}));


   assign csr_mask_x[31:0]       = ({32{ csr_imm_x}} & {27'b0,csrimm_x[4:0]}) |
                                   ({32{~csr_imm_x}} &  exu_csr_rs1_x[31:0] );


   assign write_csr_data_x[31:0] = ({32{csr_clr_x}}   & (csr_rddata_x[31:0] & ~csr_mask_x[31:0])) |
                                   ({32{csr_set_x}}   & (csr_rddata_x[31:0] |  csr_mask_x[31:0])) |
                                   ({32{csr_write_x}} & (                      csr_mask_x[31:0]));


// pause instruction




   assign clear_pause = (dec_tlu_flush_lower_r & ~dec_tlu_flush_pause_r) |
                        (pause_state & (write_csr_data[31:1] == 31'b0));        // if 0 or 1 then exit pause state - 1 cycle pause

   assign pause_state_in = (dec_tlu_wr_pause_r | pause_state) & ~clear_pause;

   rvdff #(1) pause_state_f (.*, .clk(data_gate_clk), .din(pause_state_in), .dout(pause_state));


   assign dec_pause_state = pause_state;

   rvdff #(2) pause_state_r_ff (.*, .clk(data_gate_clk), .din({dec_tlu_wr_pause_r,tlu_wr_pause_r1}), .dout({tlu_wr_pause_r1,tlu_wr_pause_r2}));


   assign dec_pause_state_cg = pause_state & ~tlu_wr_pause_r1 & ~tlu_wr_pause_r2;

// end pause


   assign csr_data_wen = ((csr_clr_x | csr_set_x | csr_write_x) & csr_read_x) | dec_tlu_wr_pause_r | pause_state;

   assign write_csr_data_in[31:0] = (pause_state)         ? (write_csr_data[31:0] - 32'b1) :
                                    (dec_tlu_wr_pause_r) ? dec_csr_wrdata_r[31:0] : write_csr_data_x[31:0];

   // will hold until write-back at which time the CSR will be updated while GPR is possibly written with prior CSR
   rvdffe #(32) write_csr_ff (.*, .en(csr_data_wen), .din(write_csr_data_in[31:0]), .dout(write_csr_data[31:0]));

   assign pause_stall = pause_state;

   // for csr write only data is produced by the alu
   assign dec_csr_wrdata_r[31:0]  = (r_d.csrwonly) ? i0_result_corr_r[31:0] : write_csr_data[31:0];



// read the csr value through rs2 immed port
   assign dec_i0_immed_d[31:0] = ({32{ i0_dp.csr_read}} & dec_csr_rddata_d[31:0]) |
                                 ({32{~i0_dp.csr_read}} & i0_immed_d[31:0]);
// end csr stuff

   assign     i0_immed_d[31:0] = ({32{i0_dp.imm12}}                         & { {20{i0[31]}},i0[31:20] }) |  // jalr
                                 ({32{i0_dp.shimm5}}                        & {  27'b0,      i0[24:20] }) |
                                 ({32{i0_jalimm20}}                         & { {12{i0[31]}},i0[19:12],i0[20],i0[30:21],1'b0}) |
                                 ({32{i0_uiimm20}}                          & { i0[31:12],12'b0 }) |
                                 ({32{i0_csr_write_only_d & i0_dp.csr_imm}} & {  27'b0,      i0[19:15]});  // for csr's that only write csr, dont read csr


   // all conditional branches are currently predict_nt
   // change this to generate the sequential address for all other cases for NPC requirements at commit
   assign dec_i0_br_immed_d[12:1] = (i0_ap.predict_nt & ~i0_dp.jal) ? i0_br_offset[11:0] : {10'b0,i0_ap_pc4,i0_ap_pc2};


   assign last_br_immed_d[12:1] = ((i0_ap.predict_nt) ? {10'b0,i0_ap_pc4,i0_ap_pc2} : i0_br_offset[11:0] );

   assign i0_valid_d = dec_ib0_valid_d;

   assign i0_load_stall_d =   i0_dp.load & (lsu_load_stall_any | dma_dccm_stall_any);

   assign i0_store_stall_d =  i0_dp.store & (lsu_store_stall_any | dma_dccm_stall_any);



// some CSR reads need to be presync'd
   assign i0_presync = i0_dp.presync | dec_tlu_presync_d | debug_fence_i | debug_fence_raw | dec_tlu_pipelining_disable;  // both fence's presync

// some CSR writes need to be postsync'd
   assign i0_postsync = i0_dp.postsync | dec_tlu_postsync_d | debug_fence_i | // only fence_i postsync
                        (i0_csr_write_only_d & (i0[31:20] == 12'h7c2));   // wr_pause must postsync


// debug fence csr
   assign debug_fence_i     = dec_debug_fence_d & dbg_cmd_wrdata[0];
   assign debug_fence_raw   = dec_debug_fence_d & dbg_cmd_wrdata[1];

   assign debug_fence       = debug_fence_raw | debug_fence_i;    // fence_i causes a fence

   assign i0_csr_write = i0_dp.csr_write & ~dec_debug_fence_d;
// end debug


   // lets make ebreak, ecall, mret postsync, so break sync into pre and post

   assign presync_stall      = (i0_presync & prior_inflight_eff);

   assign prior_inflight_eff = (i0_dp.div)  ?  prior_inflight_x  :  prior_inflight;

   assign i0_div_prior_div_stall = i0_dp.div & div_active;

   // Raw block has everything excepts the stalls coming from the lsu
   assign i0_block_raw_d = (i0_dp.csr_read & prior_csr_write) |
                            dec_extint_stall |
                            pause_stall |
                            leak1_i0_stall |
                            dec_tlu_debug_stall |
                            postsync_stall |
                            presync_stall  |
                            ((i0_dp.fence | debug_fence) & ~lsu_idle) |
                            i0_nonblock_load_stall |
                            i0_load_block_d |
                            i0_nonblock_div_stall |
                            i0_div_prior_div_stall;

   assign i0_block_d    = i0_block_raw_d | i0_store_stall_d | i0_load_stall_d;
   assign i0_exublock_d = i0_block_raw_d;


   // block reads if there is a prior csr write in the pipeline
   assign prior_csr_write = x_d.csrwonly |
                            r_d.csrwonly |
                            wbd.csrwonly;





   assign any_csr_d      =  i0_dp.csr_read | i0_csr_write;

   assign i0_legal       =  i0_dp.legal & (~any_csr_d | dec_csr_legal_d);



   // illegal inst handling


   assign shift_illegal      = dec_i0_decode_d & ~i0_legal;

   assign illegal_inst_en    = shift_illegal & ~illegal_lockout;

   rvdffe #(32) illegal_any_ff (.*, .en(illegal_inst_en), .din(i0_inst_d[31:0]), .dout(dec_illegal_inst[31:0]));

   assign illegal_lockout_in = (shift_illegal | illegal_lockout) & ~flush_final_r;

   rvdff #(1) illegal_lockout_any_ff (.*, .clk(data_gate_clk), .din(illegal_lockout_in), .dout(illegal_lockout));


   // allow illegals to flow down the pipe
   assign dec_i0_decode_d = i0_valid_d & ~i0_block_d    & ~dec_tlu_flush_lower_r & ~flush_final_r;
   assign i0_exudecode_d  = i0_valid_d & ~i0_exublock_d & ~dec_tlu_flush_lower_r & ~flush_final_r;

   // define i0 legal decode
   assign i0_legal_decode_d    = dec_i0_decode_d & i0_legal;
   assign i0_exulegal_decode_d = i0_exudecode_d  & i0_legal;


   // performance monitor signals
   assign dec_pmu_instr_decoded = dec_i0_decode_d;

   assign dec_pmu_decode_stall = i0_valid_d & ~dec_i0_decode_d;

   assign dec_pmu_postsync_stall = postsync_stall;
   assign dec_pmu_presync_stall  = presync_stall;



   // illegals will postsync
   assign ps_stall_in =  ( dec_i0_decode_d & (i0_postsync | ~i0_legal) ) |
                         ( ps_stall & prior_inflight_x                 );


   rvdff #(1) postsync_stallff (.*, .clk(data_gate_clk), .din(ps_stall_in), .dout(ps_stall));

   assign postsync_stall =  ps_stall;


   assign prior_inflight_x    =  x_d.i0valid;
   assign prior_inflight_wb   =  r_d.i0valid;

   assign prior_inflight = prior_inflight_x | prior_inflight_wb;

   assign dec_i0_alu_decode_d = i0_exulegal_decode_d & i0_dp.alu;

   assign lsu_decode_d = i0_legal_decode_d    & i0_dp.lsu;
   assign mul_decode_d = i0_exulegal_decode_d & i0_dp.mul;
   assign div_decode_d = i0_exulegal_decode_d & i0_dp.div;




   rvdff  #(1) flushff (.*, .clk(data_gate_clk), .din(exu_flush_final), .dout(flush_final_r));



// scheduling logic for primary alu's

   assign i0_rs1_depend_i0_x  = dec_i0_rs1_en_d & x_d.i0v & (x_d.i0rd[4:0] == i0r.rs1[4:0]);
   assign i0_rs1_depend_i0_r  = dec_i0_rs1_en_d & r_d.i0v & (r_d.i0rd[4:0] == i0r.rs1[4:0]);

   assign i0_rs2_depend_i0_x  = dec_i0_rs2_en_d & x_d.i0v & (x_d.i0rd[4:0] == i0r.rs2[4:0]);
   assign i0_rs2_depend_i0_r  = dec_i0_rs2_en_d & r_d.i0v & (r_d.i0rd[4:0] == i0r.rs2[4:0]);


// order the producers as follows:  , i0_x, i0_r, i0_wb

   assign {i0_rs1_class_d, i0_rs1_depth_d[1:0]} = (i0_rs1_depend_i0_x ) ? { i0_x_c,  2'd1  } :
                                                  (i0_rs1_depend_i0_r ) ? { i0_r_c,  2'd2  } : '0;

   assign {i0_rs2_class_d, i0_rs2_depth_d[1:0]} = (i0_rs2_depend_i0_x ) ? { i0_x_c,  2'd1  } :
                                                  (i0_rs2_depend_i0_r ) ? { i0_r_c,  2'd2  } : '0;


// stores will bypass load data in the lsu pipe

   if (LOAD_TO_USE_PLUS1 == 1) begin : genblock
      assign i0_load_block_d = (i0_rs1_class_d.load & i0_rs1_depth_d[0]) |
                               (i0_rs2_class_d.load & i0_rs2_depth_d[0] & ~i0_dp.store);

      assign load_ldst_bypass_d    =  (i0_dp.load | i0_dp.store) & i0_rs1_depth_d[1] & i0_rs1_class_d.load;

      assign store_data_bypass_d =                  i0_dp.store  & i0_rs2_depth_d[1] & i0_rs2_class_d.load;

      assign store_data_bypass_m =                  i0_dp.store  & i0_rs2_depth_d[0] & i0_rs2_class_d.load;
   end
   else begin : genblock

      assign i0_load_block_d = 1'b0;

      assign load_ldst_bypass_d    =  (i0_dp.load | i0_dp.store) & i0_rs1_depth_d[0] & i0_rs1_class_d.load;

      assign store_data_bypass_d =                  i0_dp.store  & i0_rs2_depth_d[0] & i0_rs2_class_d.load;

      assign store_data_bypass_m = 1'b0;
   end






   assign dec_tlu_i0_valid_r     =  r_d.i0valid & ~dec_tlu_flush_lower_wb;


   assign d_t.legal              =  i0_legal_decode_d;
   assign d_t.icaf               =  i0_icaf_d & i0_legal_decode_d;            // dbecc is icaf exception
   assign d_t.icaf_f1            =  dec_i0_icaf_f1_d & i0_legal_decode_d;     // this includes icaf and dbecc
   assign d_t.icaf_type[1:0]     =  dec_i0_icaf_type_d[1:0];

   assign d_t.fence_i            = (i0_dp.fence_i | debug_fence_i) & i0_legal_decode_d;

// put pmu info into the trap packet
   assign d_t.pmu_i0_itype       =  i0_itype;
   assign d_t.pmu_i0_br_unpred   =  i0_br_unpred;
   assign d_t.pmu_divide         =  1'b0;
   assign d_t.pmu_lsu_misaligned =  1'b0;

   assign d_t.i0trigger[3:0]     =  dec_i0_trigger_match_d[3:0] & {4{dec_i0_decode_d}};



   rvdffe #( $bits(el2_trap_pkt_t) ) trap_xff (.*, .en(i0_x_ctl_en), .din(d_t),  .dout(x_t));

   always_comb begin
      x_t_in = x_t;
      x_t_in.i0trigger[3:0] = x_t.i0trigger & ~{4{dec_tlu_flush_lower_wb}};
   end


   rvdffe  #($bits(el2_trap_pkt_t) ) trap_r_ff (.*, .en(i0_x_ctl_en), .din(x_t_in),  .dout(r_t));

   rvdff   #(4) lsu_trigger_match_rff    (.*, .din(lsu_trigger_match_m[3:0]),  .dout(lsu_trigger_match_r[3:0]));
   rvdff   #(1) lsu_pmu_misaligned_m_rff (.*, .din(lsu_pmu_misaligned_m),      .dout(lsu_pmu_misaligned_r));

    always_comb begin

      r_t_in                             =  r_t;

      r_t_in.i0trigger[3:0]              = ({4{(r_d.i0load | r_d.i0store)}} & lsu_trigger_match_r[3:0]) | r_t.i0trigger[3:0];
      r_t_in.pmu_lsu_misaligned          = lsu_pmu_misaligned_r;   // only valid if a load/store is valid in DC3 stage

      if (dec_tlu_flush_lower_wb) r_t_in = '0 ;

   end


   always_comb begin

      dec_tlu_packet_r                 =  r_t_in;
      dec_tlu_packet_r.pmu_divide      =  r_d.i0div & r_d.i0valid;

   end


// end tlu stuff


   assign i0_d_c.mul                =  i0_dp.mul  & i0_legal_decode_d;
   assign i0_d_c.load               =  i0_dp.load & i0_legal_decode_d;
   assign i0_d_c.alu                =  i0_dp.alu  & i0_legal_decode_d;

   rvdffs #( $bits(el2_class_pkt_t) ) i0_x_c_ff   (.*, .en(i0_x_ctl_en),  .clk(active_clk), .din(i0_d_c),  .dout(i0_x_c));
   rvdffs #( $bits(el2_class_pkt_t) ) i0_r_c_ff   (.*, .en(i0_r_ctl_en),  .clk(active_clk), .din(i0_x_c),  .dout(i0_r_c));


   assign d_d.i0rd[4:0]             =  i0r.rd[4:0];
   assign d_d.i0v                   =  i0_rd_en_d  & i0_legal_decode_d;
   assign d_d.i0valid               =  dec_i0_decode_d;  // has flush_final_r

   assign d_d.i0load                =  i0_dp.load  & i0_legal_decode_d;
   assign d_d.i0store               =  i0_dp.store & i0_legal_decode_d;
   assign d_d.i0div                 =  i0_dp.div   & i0_legal_decode_d;


   assign d_d.csrwen                =  dec_csr_wen_unq_d   & i0_legal_decode_d;
   assign d_d.csrwonly              =  i0_csr_write_only_d & dec_i0_decode_d;
   assign d_d.csrwaddr[11:0]        =  i0[31:20];    // csr write address for rd==0 case


   rvdff  #(3) i0cgff               (.*, .clk(active_clk),            .din(i0_pipe_en[3:1]), .dout(i0_pipe_en[2:0]));

   assign i0_pipe_en[3]             =  dec_i0_decode_d;

   assign i0_x_ctl_en               = (|i0_pipe_en[3:2] | clk_override);
   assign i0_r_ctl_en               = (|i0_pipe_en[2:1] | clk_override);
   assign i0_wb_ctl_en              = (|i0_pipe_en[1:0] | clk_override);
   assign i0_x_data_en              = ( i0_pipe_en[3]   | clk_override);
   assign i0_r_data_en              = ( i0_pipe_en[2]   | clk_override);
   assign i0_wb_data_en             = ( i0_pipe_en[1]   | clk_override);
   assign i0_wb1_data_en            = ( i0_pipe_en[0]   | clk_override);

   assign dec_data_en[1:0]          = {i0_x_data_en, i0_r_data_en};
   assign dec_ctl_en[1:0]           = {i0_x_ctl_en,  i0_r_ctl_en};



   rvdffe #( $bits(el2_dest_pkt_t) ) e1ff (.*, .en(i0_x_ctl_en), .din(d_d),  .dout(x_d));

   always_comb begin
      x_d_in = x_d;

      x_d_in.i0v         = x_d.i0v     & ~dec_tlu_flush_lower_wb & ~dec_tlu_flush_lower_r;
      x_d_in.i0valid     = x_d.i0valid & ~dec_tlu_flush_lower_wb & ~dec_tlu_flush_lower_r;
   end

   rvdffe #( $bits(el2_dest_pkt_t) ) r_d_ff (.*, .en(i0_r_ctl_en), .din(x_d_in), .dout(r_d));


   always_comb begin

        r_d_in = r_d;


      r_d_in.i0rd[4:0]   =  r_d.i0rd[4:0];

      r_d_in.i0v         = (r_d.i0v      & ~dec_tlu_flush_lower_wb);
      r_d_in.i0valid     = (r_d.i0valid  & ~dec_tlu_flush_lower_wb);

      r_d_in.i0load      =  r_d.i0load   & ~dec_tlu_flush_lower_wb;
      r_d_in.i0store     =  r_d.i0store  & ~dec_tlu_flush_lower_wb;

   end


   rvdffe #($bits(el2_dest_pkt_t)) wbff (.*, .en(i0_wb_ctl_en), .din(r_d_in), .dout(wbd));

   assign dec_i0_waddr_r[4:0]       =  r_d_in.i0rd[4:0];

   assign     i0_wen_r              =  r_d_in.i0v & ~dec_tlu_i0_kill_writeb_r;
   assign dec_i0_wen_r              =  i0_wen_r   & ~r_d_in.i0div & ~i0_load_kill_wen_r;  // don't write a nonblock load 1st time down the pipe
   assign dec_i0_wdata_r[31:0]      =  i0_result_corr_r[31:0];


   // divide stuff

   assign div_e1_to_r         = (x_d.i0div & x_d.i0valid) |
                                (r_d.i0div & r_d.i0valid);

   assign div_active_in = i0_div_decode_d | (div_active & ~exu_div_wren & ~nonblock_div_cancel);

   rvdff  #(1) divactiveff   (.*, .clk(free_clk), .din(div_active_in), .dout(div_active));

   assign dec_div_active = div_active;

   // nonblocking div scheme

   assign i0_nonblock_div_stall  = (dec_i0_rs1_en_d & div_active & (div_waddr_wb[4:0] == i0r.rs1[4:0])) |
                                   (dec_i0_rs2_en_d & div_active & (div_waddr_wb[4:0] == i0r.rs2[4:0]));


   assign div_flush              = (x_d.i0div & x_d.i0valid & (x_d.i0rd[4:0]==5'b0)                           ) |
                                   (x_d.i0div & x_d.i0valid & dec_tlu_flush_lower_r                           ) |
                                   (r_d.i0div & r_d.i0valid & dec_tlu_flush_lower_r & dec_tlu_i0_kill_writeb_r);


   // cancel if any younger inst committing this cycle to same dest as nonblock divide
   assign nonblock_div_cancel    = (div_active &  div_flush) |
                                   (div_active & ~div_e1_to_r & (r_d.i0rd[4:0] == div_waddr_wb[4:0]) & i0_wen_r);

   assign dec_div_cancel         =  nonblock_div_cancel;



   assign i0_div_decode_d            =  i0_legal_decode_d & i0_dp.div;

   rvdffs #(5) divff                 (.*, .en(i0_div_decode_d), .din(i0r.rd[4:0]),  .dout(div_waddr_wb[4:0]));


// for load_to_use_plus1, the load result data is merged in R stage instead of D

   if ( LOAD_TO_USE_PLUS1 == 1 ) begin : genblock1
      assign i0_result_x[31:0]          = exu_i0_result_x[31:0];
      assign i0_result_r[31:0]          = (r_d.i0v & r_d.i0load) ? lsu_result_m[31:0] : i0_result_r_raw[31:0];
   end
   else begin : genblock1
      assign i0_result_x[31:0]          = (x_d.i0v & x_d.i0load) ? lsu_result_m[31:0] : exu_i0_result_x[31:0];
      assign i0_result_r[31:0]          = i0_result_r_raw[31:0];
   end


   rvdffe #(32) i0_result_r_ff       (.*, .en(i0_r_data_en),  .din(i0_result_x[31:0]),       .dout(i0_result_r_raw[31:0]));

   // correct lsu load data - don't use for bypass, do pass down the pipe
   assign i0_result_corr_r[31:0]     = (r_d.i0v & r_d.i0load) ? lsu_result_corr_r[31:0] : i0_result_r_raw[31:0];


   rvdffe #(12) e1brpcff             (.*, .en(i0_x_data_en), .din(last_br_immed_d[12:1] ), .dout(last_br_immed_x[12:1]));




   assign i0_wb_en                   =  i0_wb_data_en;
   assign i0_wb1_en                  =  i0_wb1_data_en;
   assign i0_inst_wb_in[31:0]        =  i0_inst_r[31:0];
   assign i0_inst_d[31:0]            = (dec_i0_pc4_d)    ?  i0[31:0]                                  :  {16'b0, ifu_i0_cinst[15:0]};

   rvdffe #(18) divinstff            (.*, .en(i0_div_decode_d), .din(i0_inst_d[24:7]),         .dout(div_inst[24:7]));
   rvdffe #(32) i0xinstff            (.*, .en(i0_x_data_en),    .din(i0_inst_d[31:0]),         .dout(i0_inst_x[31:0]));
   rvdffe #(32) i0cinstff            (.*, .en(i0_r_data_en),    .din(i0_inst_x[31:0]),         .dout(i0_inst_r[31:0]));
   rvdffe #(32) i0wbinstff           (.*, .en(i0_wb_en),        .din(i0_inst_wb_in[31:0]),     .dout(i0_inst_wb[31:0]));
   rvdffe #(32) i0wb1instff          (.*, .en(i0_wb1_en),       .din(i0_inst_wb[31:0]),        .dout(dec_i0_inst_wb1[31:0]));
   rvdffe #(31) i0wbpcff             (.*, .en(i0_wb_en),        .din(dec_tlu_i0_pc_r[31:1]),   .dout(    i0_pc_wb[31:1]));
   rvdffe #(31) i0wb1pcff            (.*, .en(i0_wb1_en),       .din(        i0_pc_wb[31:1]),  .dout(dec_i0_pc_wb1[31:1]));


   rvdffe #(31) i0_pc_r_ff           (.*, .en(i0_r_data_en), .din(exu_i0_pc_x[31:1]), .dout(dec_i0_pc_r[31:1]));

   assign dec_tlu_i0_pc_r[31:1]      = dec_i0_pc_r[31:1];


   rvbradder ibradder_correct (
                     .pc(exu_i0_pc_x[31:1]),
                     .offset(last_br_immed_x[12:1]),
                     .dout(pred_correct_npc_x[31:1]));



   // add nonblock load rs1/rs2 bypass cases

   assign i0_rs1_nonblock_load_bypass_en_d  = dec_i0_rs1_en_d & dec_nonblock_load_wen & (dec_nonblock_load_waddr[4:0] == i0r.rs1[4:0]);

   assign i0_rs2_nonblock_load_bypass_en_d  = dec_i0_rs2_en_d & dec_nonblock_load_wen & (dec_nonblock_load_waddr[4:0] == i0r.rs2[4:0]);



   // bit 2 is priority match, bit 0 lowest priority, i0_x, i0_r

   assign i0_rs1bypass[2]                =  i0_rs1_depth_d[0] & (i0_rs1_class_d.alu | i0_rs1_class_d.mul                      );
   assign i0_rs1bypass[1]                =  i0_rs1_depth_d[0] & (                                          i0_rs1_class_d.load);
   assign i0_rs1bypass[0]                =  i0_rs1_depth_d[1] & (i0_rs1_class_d.alu | i0_rs1_class_d.mul | i0_rs1_class_d.load);

   assign i0_rs2bypass[2]                =  i0_rs2_depth_d[0] & (i0_rs2_class_d.alu | i0_rs2_class_d.mul                      );
   assign i0_rs2bypass[1]                =  i0_rs2_depth_d[0] & (                                          i0_rs2_class_d.load);
   assign i0_rs2bypass[0]                =  i0_rs2_depth_d[1] & (i0_rs2_class_d.alu | i0_rs2_class_d.mul | i0_rs2_class_d.load);


   assign dec_i0_rs1_bypass_en_d[1]      =  i0_rs1bypass[2];
   assign dec_i0_rs1_bypass_en_d[0]      =  i0_rs1bypass[1] | i0_rs1bypass[0] | (~i0_rs1bypass[2] & i0_rs1_nonblock_load_bypass_en_d);
   assign dec_i0_rs2_bypass_en_d[1]      =  i0_rs2bypass[2];
   assign dec_i0_rs2_bypass_en_d[0]      =  i0_rs2bypass[1] | i0_rs2bypass[0] | (~i0_rs2bypass[2] & i0_rs2_nonblock_load_bypass_en_d);


   assign dec_i0_rs1_bypass_data_d[31:0] = ({32{ i0_rs1bypass[1]                                                      }} & lsu_result_m[31:0]) |
                                           ({32{                    i0_rs1bypass[0]                                   }} & i0_result_r[31:0] ) |
                                           ({32{~i0_rs1bypass[1] & ~i0_rs1bypass[0] & i0_rs1_nonblock_load_bypass_en_d}} & lsu_nonblock_load_data[31:0]);

   assign dec_i0_rs2_bypass_data_d[31:0] = ({32{ i0_rs2bypass[1]                                                      }} & lsu_result_m[31:0]) |
                                           ({32{                    i0_rs2bypass[0]                                   }} & i0_result_r[31:0] ) |
                                           ({32{~i0_rs2bypass[1] & ~i0_rs2bypass[0] & i0_rs2_nonblock_load_bypass_en_d}} & lsu_nonblock_load_data[31:0]);


endmodule // el2_dec_decode_ctl





// file "decode" is human readable file that has all of the instruction decodes defined and is part of git repo
// modify this file as needed

// to generate all the equations below from "decode" except legal equation:

// 1) coredecode -in decode > coredecode.e

// 2) espresso -Dso -oeqntott coredecode.e | addassign -pre out.  > equations

// to generate the legal (32b instruction is legal) equation below:

// 1) coredecode -in decode -legal > legal.e

// 2) espresso -Dso -oeqntott legal.e | addassign -pre out. > legal_equation

module el2_dec_dec_ctl
`include "parameter.sv"
  (
   input logic [31:0] inst,

   output el2_dec_pkt_t out
   );

   logic [31:0] i;


   assign i[31:0] = inst[31:0];


assign out.alu = (i[2]) | (i[6]) | (!i[25]&i[4]) | (!i[5]&i[4]);

assign out.rs1 = (!i[14]&!i[13]&!i[2]) | (!i[13]&i[11]&!i[2]) | (i[19]&i[13]&!i[2]) | (
    !i[13]&i[10]&!i[2]) | (i[18]&i[13]&!i[2]) | (!i[13]&i[9]&!i[2]) | (
    i[17]&i[13]&!i[2]) | (!i[13]&i[8]&!i[2]) | (i[16]&i[13]&!i[2]) | (
    !i[13]&i[7]&!i[2]) | (i[15]&i[13]&!i[2]) | (!i[4]&!i[3]) | (!i[6]
    &!i[2]);

assign out.rs2 = (i[5]&!i[4]&!i[2]) | (!i[6]&i[5]&!i[2]);

assign out.imm12 = (!i[4]&!i[3]&i[2]) | (i[13]&!i[5]&i[4]&!i[2]) | (!i[13]&!i[12]
    &i[6]&i[4]) | (!i[12]&!i[5]&i[4]&!i[2]);

assign out.rd = (!i[5]&!i[2]) | (i[5]&i[2]) | (i[4]);

assign out.shimm5 = (!i[13]&i[12]&!i[5]&i[4]&!i[2]);

assign out.imm20 = (i[5]&i[3]) | (i[4]&i[2]);

assign out.pc = (!i[5]&!i[3]&i[2]) | (i[5]&i[3]);

assign out.load = (!i[5]&!i[4]&!i[2]);

assign out.store = (!i[6]&i[5]&!i[4]);

assign out.lsu = (!i[6]&!i[4]&!i[2]);

assign out.add = (!i[14]&!i[13]&!i[12]&!i[5]&i[4]) | (!i[5]&!i[3]&i[2]) | (!i[30]
    &!i[25]&!i[14]&!i[13]&!i[12]&!i[6]&i[4]&!i[2]);

assign out.sub = (i[30]&!i[12]&!i[6]&i[5]&i[4]&!i[2]) | (!i[25]&!i[14]&i[13]&!i[6]
    &i[4]&!i[2]) | (!i[14]&i[13]&!i[5]&i[4]&!i[2]) | (i[6]&!i[4]&!i[2]);

assign out.land = (i[14]&i[13]&i[12]&!i[5]&!i[2]) | (!i[25]&i[14]&i[13]&i[12]&!i[6]
    &!i[2]);

assign out.lor = (!i[6]&i[3]) | (!i[25]&i[14]&i[13]&!i[12]&!i[6]&!i[2]) | (i[5]&i[4]
    &i[2]) | (!i[13]&!i[12]&i[6]&i[4]) | (i[14]&i[13]&!i[12]&!i[5]&!i[2]);

assign out.lxor = (!i[25]&i[14]&!i[13]&!i[12]&i[4]&!i[2]) | (i[14]&!i[13]&!i[12]
    &!i[5]&i[4]&!i[2]);

assign out.sll = (!i[25]&!i[14]&!i[13]&i[12]&!i[6]&i[4]&!i[2]);

assign out.sra = (i[30]&!i[13]&i[12]&!i[6]&i[4]&!i[2]);

assign out.srl = (!i[30]&!i[25]&i[14]&!i[13]&i[12]&!i[6]&i[4]&!i[2]);

assign out.slt = (!i[25]&!i[14]&i[13]&!i[6]&i[4]&!i[2]) | (!i[14]&i[13]&!i[5]&i[4]
    &!i[2]);

assign out.unsign = (!i[14]&i[13]&i[12]&!i[5]&!i[2]) | (i[13]&i[6]&!i[4]&!i[2]) | (
    i[14]&!i[5]&!i[4]) | (!i[25]&!i[14]&i[13]&i[12]&!i[6]&!i[2]) | (
    i[25]&i[14]&i[12]&!i[6]&i[5]&!i[2]);

assign out.condbr = (i[6]&!i[4]&!i[2]);

assign out.beq = (!i[14]&!i[12]&i[6]&!i[4]&!i[2]);

assign out.bne = (!i[14]&i[12]&i[6]&!i[4]&!i[2]);

assign out.bge = (i[14]&i[12]&i[5]&!i[4]&!i[2]);

assign out.blt = (i[14]&!i[12]&i[5]&!i[4]&!i[2]);

assign out.jal = (i[6]&i[2]);

assign out.by = (!i[13]&!i[12]&!i[6]&!i[4]&!i[2]);

assign out.half = (i[12]&!i[6]&!i[4]&!i[2]);

assign out.word = (i[13]&!i[6]&!i[4]);

assign out.csr_read = (i[13]&i[6]&i[4]) | (i[7]&i[6]&i[4]) | (i[8]&i[6]&i[4]) | (
    i[9]&i[6]&i[4]) | (i[10]&i[6]&i[4]) | (i[11]&i[6]&i[4]);

assign out.csr_clr = (i[15]&i[13]&i[12]&i[6]&i[4]) | (i[16]&i[13]&i[12]&i[6]&i[4]) | (
    i[17]&i[13]&i[12]&i[6]&i[4]) | (i[18]&i[13]&i[12]&i[6]&i[4]) | (
    i[19]&i[13]&i[12]&i[6]&i[4]);

assign out.csr_set = (i[15]&!i[12]&i[6]&i[4]) | (i[16]&!i[12]&i[6]&i[4]) | (i[17]
    &!i[12]&i[6]&i[4]) | (i[18]&!i[12]&i[6]&i[4]) | (i[19]&!i[12]&i[6]
    &i[4]);

assign out.csr_write = (!i[13]&i[12]&i[6]&i[4]);

assign out.csr_imm = (i[14]&!i[13]&i[6]&i[4]) | (i[15]&i[14]&i[6]&i[4]) | (i[16]
    &i[14]&i[6]&i[4]) | (i[17]&i[14]&i[6]&i[4]) | (i[18]&i[14]&i[6]&i[4]) | (
    i[19]&i[14]&i[6]&i[4]);

assign out.presync = (!i[5]&i[3]) | (!i[13]&i[7]&i[6]&i[4]) | (!i[13]&i[8]&i[6]&i[4]) | (
    !i[13]&i[9]&i[6]&i[4]) | (!i[13]&i[10]&i[6]&i[4]) | (!i[13]&i[11]
    &i[6]&i[4]) | (i[15]&i[13]&i[6]&i[4]) | (i[16]&i[13]&i[6]&i[4]) | (
    i[17]&i[13]&i[6]&i[4]) | (i[18]&i[13]&i[6]&i[4]) | (i[19]&i[13]&i[6]
    &i[4]);

assign out.postsync = (i[12]&!i[5]&i[3]) | (!i[22]&!i[13]&!i[12]&i[6]&i[4]) | (
    !i[13]&i[7]&i[6]&i[4]) | (!i[13]&i[8]&i[6]&i[4]) | (!i[13]&i[9]&i[6]
    &i[4]) | (!i[13]&i[10]&i[6]&i[4]) | (!i[13]&i[11]&i[6]&i[4]) | (
    i[15]&i[13]&i[6]&i[4]) | (i[16]&i[13]&i[6]&i[4]) | (i[17]&i[13]&i[6]
    &i[4]) | (i[18]&i[13]&i[6]&i[4]) | (i[19]&i[13]&i[6]&i[4]);

assign out.ebreak = (!i[22]&i[20]&!i[13]&!i[12]&i[6]&i[4]);

assign out.ecall = (!i[21]&!i[20]&!i[13]&!i[12]&i[6]&i[4]);

assign out.mret = (i[29]&!i[13]&!i[12]&i[6]&i[4]);

assign out.mul = (i[25]&!i[14]&!i[6]&i[5]&i[4]&!i[2]);

assign out.rs1_sign = (i[25]&!i[14]&i[13]&!i[12]&!i[6]&i[5]&i[4]&!i[2]) | (i[25]
    &!i[14]&!i[13]&i[12]&!i[6]&i[4]&!i[2]);

assign out.rs2_sign = (i[25]&!i[14]&!i[13]&i[12]&!i[6]&i[4]&!i[2]);

assign out.low = (i[25]&!i[14]&!i[13]&!i[12]&i[5]&i[4]&!i[2]);

assign out.div = (i[25]&i[14]&!i[6]&i[5]&!i[2]);

assign out.rem = (i[25]&i[14]&i[13]&!i[6]&i[5]&!i[2]);

assign out.fence = (!i[5]&i[3]);

assign out.fence_i = (i[12]&!i[5]&i[3]);

assign out.pm_alu = (i[28]&i[22]&!i[13]&!i[12]&i[4]) | (i[4]&i[2]) | (!i[25]&!i[6]
    &i[4]) | (!i[5]&i[4]);



assign out.legal = (!i[31]&!i[30]&i[29]&i[28]&!i[27]&!i[26]&!i[25]&!i[24]&!i[23]
    &!i[22]&i[21]&!i[20]&!i[19]&!i[18]&!i[17]&!i[16]&!i[15]&!i[14]&!i[11]
    &!i[10]&!i[9]&!i[8]&!i[7]&i[6]&i[5]&i[4]&!i[3]&!i[2]&i[1]&i[0]) | (
    !i[31]&!i[30]&!i[29]&i[28]&!i[27]&!i[26]&!i[25]&!i[24]&!i[23]&i[22]
    &!i[21]&i[20]&!i[19]&!i[18]&!i[17]&!i[16]&!i[15]&!i[14]&!i[11]&!i[10]
    &!i[9]&!i[8]&!i[7]&i[6]&i[5]&i[4]&!i[3]&!i[2]&i[1]&i[0]) | (!i[31]
    &!i[30]&!i[29]&!i[28]&!i[27]&!i[26]&!i[25]&!i[24]&!i[23]&!i[22]&!i[21]
    &!i[19]&!i[18]&!i[17]&!i[16]&!i[15]&!i[14]&!i[11]&!i[10]&!i[9]&!i[8]
    &!i[7]&i[5]&i[4]&!i[3]&!i[2]&i[1]&i[0]) | (!i[31]&!i[30]&!i[29]&!i[28]
    &!i[27]&!i[26]&!i[25]&!i[6]&i[4]&!i[3]&i[1]&i[0]) | (!i[31]&!i[29]
    &!i[28]&!i[27]&!i[26]&!i[25]&!i[14]&!i[13]&!i[12]&!i[6]&!i[3]&!i[2]
    &i[1]&i[0]) | (!i[31]&!i[29]&!i[28]&!i[27]&!i[26]&!i[25]&i[14]&!i[13]
    &i[12]&!i[6]&i[4]&!i[3]&i[1]&i[0]) | (!i[31]&!i[30]&!i[29]&!i[28]
    &!i[27]&!i[26]&!i[6]&i[5]&i[4]&!i[3]&i[1]&i[0]) | (!i[14]&!i[13]
    &!i[12]&i[6]&i[5]&!i[4]&!i[3]&i[1]&i[0]) | (i[14]&i[6]&i[5]&!i[4]
    &!i[3]&!i[2]&i[1]&i[0]) | (!i[12]&!i[6]&!i[5]&i[4]&!i[3]&i[1]&i[0]) | (
    !i[14]&!i[13]&i[5]&!i[4]&!i[3]&!i[2]&i[1]&i[0]) | (i[12]&i[6]&i[5]
    &i[4]&!i[3]&!i[2]&i[1]&i[0]) | (!i[31]&!i[30]&!i[29]&!i[28]&!i[27]
    &!i[26]&!i[25]&!i[24]&!i[23]&!i[22]&!i[21]&!i[20]&!i[19]&!i[18]&!i[17]
    &!i[16]&!i[15]&!i[14]&!i[13]&!i[11]&!i[10]&!i[9]&!i[8]&!i[7]&!i[6]
    &!i[5]&!i[4]&i[3]&i[2]&i[1]&i[0]) | (!i[31]&!i[30]&!i[29]&!i[28]
    &!i[19]&!i[18]&!i[17]&!i[16]&!i[15]&!i[14]&!i[13]&!i[12]&!i[11]&!i[10]
    &!i[9]&!i[8]&!i[7]&!i[6]&!i[5]&!i[4]&i[3]&i[2]&i[1]&i[0]) | (i[13]
    &i[6]&i[5]&i[4]&!i[3]&!i[2]&i[1]&i[0]) | (!i[13]&!i[6]&!i[5]&!i[4]
    &!i[3]&!i[2]&i[1]&i[0]) | (i[6]&i[5]&!i[4]&i[3]&i[2]&i[1]&i[0]) | (
    i[13]&!i[6]&!i[5]&i[4]&!i[3]&i[1]&i[0]) | (!i[14]&!i[12]&!i[6]&!i[4]
    &!i[3]&!i[2]&i[1]&i[0]) | (!i[6]&i[4]&!i[3]&i[2]&i[1]&i[0]);



endmodule // el2_dec_dec_ctl
