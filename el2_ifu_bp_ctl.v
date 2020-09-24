module el2_ifu_bp_ctl(
  input         clock,
  input         reset,
  input         io_clk,
  input         io_active_clk,
  input         io_rst_l,
  input         io_ic_hit_f,
  input  [31:0] io_ifc_fetch_addr_f,
  input         io_ifc_fetch_req_f,
  input         io_dec_tlu_br0_r_pkt_valid,
  input  [1:0]  io_dec_tlu_br0_r_pkt_hist,
  input         io_dec_tlu_br0_r_pkt_br_error,
  input         io_dec_tlu_br0_r_pkt_br_start_error,
  input         io_dec_tlu_br0_r_pkt_way,
  input         io_dec_tlu_br0_r_pkt_middle,
  input  [7:0]  io_exu_i0_br_fghr_r,
  input  [6:0]  io_exu_i0_br_index_r,
  input         io_dec_tlu_flush_lower_wb,
  input         io_dec_tlu_flush_leak_one_wb,
  input         io_dec_tlu_bpred_disable,
  input         io_exu_mp_pkt_misp,
  input         io_exu_mp_pkt_ataken,
  input         io_exu_mp_pkt_boffset,
  input         io_exu_mp_pkt_pc4,
  input  [1:0]  io_exu_mp_pkt_hist,
  input  [11:0] io_exu_mp_pkt_toffset,
  input         io_exu_mp_pkt_valid,
  input         io_exu_mp_pkt_br_error,
  input         io_exu_mp_pkt_br_start_error,
  input  [31:0] io_exu_mp_pkt_prett,
  input         io_exu_mp_pkt_pcall,
  input         io_exu_mp_pkt_pret,
  input         io_exu_mp_pkt_pja,
  input         io_exu_mp_pkt_way,
  input  [7:0]  io_exu_mp_eghr,
  input  [7:0]  io_exu_mp_fghr,
  input  [6:0]  io_exu_mp_index,
  input  [4:0]  io_exu_mp_btag,
  input         io_exu_flush_final,
  output        io_ifu_bp_hit_taken_f,
  output [30:0] io_ifu_bp_btb_target_f,
  output        io_ifu_bp_inst_mask_f,
  output [7:0]  io_ifu_bp_fghr_f,
  output [1:0]  io_ifu_bp_way_f,
  output [1:0]  io_ifu_bp_ret_f,
  output [1:0]  io_ifu_bp_hist1_f,
  output [1:0]  io_ifu_bp_hist0_f,
  output [1:0]  io_ifu_bp_pc4_f,
  output [1:0]  io_ifu_bp_valid_f,
  output [11:0] io_ifu_bp_poffset_f
);
  assign io_ifu_bp_hit_taken_f = 1'h0; // @[el2_ifu_bp_ctl.scala 42:25]
  assign io_ifu_bp_btb_target_f = 31'h0; // @[el2_ifu_bp_ctl.scala 43:26]
  assign io_ifu_bp_inst_mask_f = 1'h0; // @[el2_ifu_bp_ctl.scala 44:25]
  assign io_ifu_bp_fghr_f = 8'h0; // @[el2_ifu_bp_ctl.scala 45:20]
  assign io_ifu_bp_way_f = 2'h0; // @[el2_ifu_bp_ctl.scala 46:19]
  assign io_ifu_bp_ret_f = 2'h0; // @[el2_ifu_bp_ctl.scala 47:19]
  assign io_ifu_bp_hist1_f = 2'h0; // @[el2_ifu_bp_ctl.scala 48:21]
  assign io_ifu_bp_hist0_f = 2'h0; // @[el2_ifu_bp_ctl.scala 49:21]
  assign io_ifu_bp_pc4_f = 2'h0; // @[el2_ifu_bp_ctl.scala 50:19]
  assign io_ifu_bp_valid_f = 2'h0; // @[el2_ifu_bp_ctl.scala 51:21]
  assign io_ifu_bp_poffset_f = 12'h0; // @[el2_ifu_bp_ctl.scala 52:23]
endmodule
