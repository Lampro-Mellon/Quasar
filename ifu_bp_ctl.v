module rvclkhdr(
  input   io_clk,
  input   io_en
);
  wire  clkhdr_Q; // @[lib.scala 334:26]
  wire  clkhdr_CK; // @[lib.scala 334:26]
  wire  clkhdr_EN; // @[lib.scala 334:26]
  wire  clkhdr_SE; // @[lib.scala 334:26]
  gated_latch clkhdr ( // @[lib.scala 334:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module ifu_bp_ctl(
  input         clock,
  input         reset,
  input         io_active_clk,
  input         io_ic_hit_f,
  input         io_exu_flush_final,
  input  [30:0] io_ifc_fetch_addr_f,
  input         io_ifc_fetch_req_f,
  input         io_dec_bp_dec_tlu_br0_r_pkt_valid,
  input  [1:0]  io_dec_bp_dec_tlu_br0_r_pkt_bits_hist,
  input         io_dec_bp_dec_tlu_br0_r_pkt_bits_br_error,
  input         io_dec_bp_dec_tlu_br0_r_pkt_bits_br_start_error,
  input         io_dec_bp_dec_tlu_br0_r_pkt_bits_way,
  input         io_dec_bp_dec_tlu_br0_r_pkt_bits_middle,
  input         io_dec_bp_dec_tlu_flush_leak_one_wb,
  input         io_dec_bp_dec_tlu_bpred_disable,
  input         io_dec_tlu_flush_lower_wb,
  input  [7:0]  io_exu_bp_exu_i0_br_index_r,
  input  [7:0]  io_exu_bp_exu_i0_br_fghr_r,
  input         io_exu_bp_exu_i0_br_way_r,
  input         io_exu_bp_exu_mp_pkt_valid,
  input         io_exu_bp_exu_mp_pkt_bits_misp,
  input         io_exu_bp_exu_mp_pkt_bits_ataken,
  input         io_exu_bp_exu_mp_pkt_bits_boffset,
  input         io_exu_bp_exu_mp_pkt_bits_pc4,
  input  [1:0]  io_exu_bp_exu_mp_pkt_bits_hist,
  input  [11:0] io_exu_bp_exu_mp_pkt_bits_toffset,
  input         io_exu_bp_exu_mp_pkt_bits_br_error,
  input         io_exu_bp_exu_mp_pkt_bits_br_start_error,
  input  [30:0] io_exu_bp_exu_mp_pkt_bits_prett,
  input         io_exu_bp_exu_mp_pkt_bits_pcall,
  input         io_exu_bp_exu_mp_pkt_bits_pret,
  input         io_exu_bp_exu_mp_pkt_bits_pja,
  input         io_exu_bp_exu_mp_pkt_bits_way,
  input  [7:0]  io_exu_bp_exu_mp_eghr,
  input  [7:0]  io_exu_bp_exu_mp_fghr,
  input  [7:0]  io_exu_bp_exu_mp_index,
  input  [4:0]  io_exu_bp_exu_mp_btag,
  input  [3:0]  io_dec_fa_error_index,
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
  output [11:0] io_ifu_bp_poffset_f,
  output [3:0]  io_ifu_bp_fa_index_f_0,
  output [3:0]  io_ifu_bp_fa_index_f_1,
  input         io_scan_mode
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [255:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_12_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_12_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_13_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_13_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_14_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_14_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_15_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_15_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_16_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_16_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_17_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_17_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_18_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_18_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_19_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_19_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_20_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_20_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_21_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_21_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_22_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_22_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_23_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_23_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_24_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_24_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_25_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_25_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_26_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_26_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_27_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_27_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_28_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_28_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_29_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_29_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_30_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_30_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_31_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_31_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_32_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_32_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_33_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_33_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_34_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_34_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_35_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_35_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_36_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_36_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_37_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_37_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_38_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_38_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_39_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_39_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_40_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_40_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_41_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_41_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_42_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_42_io_en; // @[lib.scala 343:22]
  wire  _T_21 = io_dec_bp_dec_tlu_flush_leak_one_wb & io_dec_tlu_flush_lower_wb; // @[ifu_bp_ctl.scala 135:54]
  reg  leak_one_f_d1; // @[Reg.scala 27:20]
  wire  _T_22 = ~io_dec_tlu_flush_lower_wb; // @[ifu_bp_ctl.scala 135:102]
  wire  _T_23 = leak_one_f_d1 & _T_22; // @[ifu_bp_ctl.scala 135:100]
  wire  leak_one_f = _T_21 | _T_23; // @[ifu_bp_ctl.scala 135:83]
  wire  _T = ~leak_one_f; // @[ifu_bp_ctl.scala 82:58]
  wire  exu_mp_valid = io_exu_bp_exu_mp_pkt_bits_misp & _T; // @[ifu_bp_ctl.scala 82:56]
  wire  dec_tlu_error_wb = io_dec_bp_dec_tlu_br0_r_pkt_bits_br_start_error | io_dec_bp_dec_tlu_br0_r_pkt_bits_br_error; // @[ifu_bp_ctl.scala 105:50]
  wire [7:0] _T_4 = io_ifc_fetch_addr_f[8:1] ^ io_ifc_fetch_addr_f[16:9]; // @[lib.scala 51:47]
  wire [7:0] btb_rd_addr_f = _T_4 ^ io_ifc_fetch_addr_f[24:17]; // @[lib.scala 51:85]
  wire [29:0] fetch_addr_p1_f = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[ifu_bp_ctl.scala 113:51]
  wire [30:0] _T_8 = {fetch_addr_p1_f,1'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_11 = _T_8[8:1] ^ _T_8[16:9]; // @[lib.scala 51:47]
  wire [7:0] btb_rd_addr_p1_f = _T_11 ^ _T_8[24:17]; // @[lib.scala 51:85]
  wire  _T_147 = ~io_ifc_fetch_addr_f[0]; // @[ifu_bp_ctl.scala 191:37]
  wire  _T_709 = btb_rd_addr_f == 8'h0; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_0; // @[Reg.scala 27:20]
  wire [21:0] _T_741 = _T_709 ? btb_bank0_rd_data_way0_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire  _T_711 = btb_rd_addr_f == 8'h1; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_1; // @[Reg.scala 27:20]
  wire [21:0] _T_742 = _T_711 ? btb_bank0_rd_data_way0_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_757 = _T_741 | _T_742; // @[Mux.scala 27:72]
  wire  _T_713 = btb_rd_addr_f == 8'h2; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_2; // @[Reg.scala 27:20]
  wire [21:0] _T_743 = _T_713 ? btb_bank0_rd_data_way0_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_758 = _T_757 | _T_743; // @[Mux.scala 27:72]
  wire  _T_715 = btb_rd_addr_f == 8'h3; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_3; // @[Reg.scala 27:20]
  wire [21:0] _T_744 = _T_715 ? btb_bank0_rd_data_way0_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_759 = _T_758 | _T_744; // @[Mux.scala 27:72]
  wire  _T_717 = btb_rd_addr_f == 8'h4; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_4; // @[Reg.scala 27:20]
  wire [21:0] _T_745 = _T_717 ? btb_bank0_rd_data_way0_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_760 = _T_759 | _T_745; // @[Mux.scala 27:72]
  wire  _T_719 = btb_rd_addr_f == 8'h5; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_5; // @[Reg.scala 27:20]
  wire [21:0] _T_746 = _T_719 ? btb_bank0_rd_data_way0_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_761 = _T_760 | _T_746; // @[Mux.scala 27:72]
  wire  _T_721 = btb_rd_addr_f == 8'h6; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_6; // @[Reg.scala 27:20]
  wire [21:0] _T_747 = _T_721 ? btb_bank0_rd_data_way0_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_762 = _T_761 | _T_747; // @[Mux.scala 27:72]
  wire  _T_723 = btb_rd_addr_f == 8'h7; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_7; // @[Reg.scala 27:20]
  wire [21:0] _T_748 = _T_723 ? btb_bank0_rd_data_way0_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_763 = _T_762 | _T_748; // @[Mux.scala 27:72]
  wire  _T_725 = btb_rd_addr_f == 8'h8; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_8; // @[Reg.scala 27:20]
  wire [21:0] _T_749 = _T_725 ? btb_bank0_rd_data_way0_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_764 = _T_763 | _T_749; // @[Mux.scala 27:72]
  wire  _T_727 = btb_rd_addr_f == 8'h9; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_9; // @[Reg.scala 27:20]
  wire [21:0] _T_750 = _T_727 ? btb_bank0_rd_data_way0_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_765 = _T_764 | _T_750; // @[Mux.scala 27:72]
  wire  _T_729 = btb_rd_addr_f == 8'ha; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_10; // @[Reg.scala 27:20]
  wire [21:0] _T_751 = _T_729 ? btb_bank0_rd_data_way0_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_766 = _T_765 | _T_751; // @[Mux.scala 27:72]
  wire  _T_731 = btb_rd_addr_f == 8'hb; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_11; // @[Reg.scala 27:20]
  wire [21:0] _T_752 = _T_731 ? btb_bank0_rd_data_way0_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_767 = _T_766 | _T_752; // @[Mux.scala 27:72]
  wire  _T_733 = btb_rd_addr_f == 8'hc; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_12; // @[Reg.scala 27:20]
  wire [21:0] _T_753 = _T_733 ? btb_bank0_rd_data_way0_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_768 = _T_767 | _T_753; // @[Mux.scala 27:72]
  wire  _T_735 = btb_rd_addr_f == 8'hd; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_13; // @[Reg.scala 27:20]
  wire [21:0] _T_754 = _T_735 ? btb_bank0_rd_data_way0_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_769 = _T_768 | _T_754; // @[Mux.scala 27:72]
  wire  _T_737 = btb_rd_addr_f == 8'he; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_14; // @[Reg.scala 27:20]
  wire [21:0] _T_755 = _T_737 ? btb_bank0_rd_data_way0_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_770 = _T_769 | _T_755; // @[Mux.scala 27:72]
  wire  _T_739 = btb_rd_addr_f == 8'hf; // @[ifu_bp_ctl.scala 445:80]
  reg [21:0] btb_bank0_rd_data_way0_out_15; // @[Reg.scala 27:20]
  wire [21:0] _T_756 = _T_739 ? btb_bank0_rd_data_way0_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way0_f = _T_770 | _T_756; // @[Mux.scala 27:72]
  wire [4:0] _T_29 = io_ifc_fetch_addr_f[13:9] ^ io_ifc_fetch_addr_f[18:14]; // @[lib.scala 42:111]
  wire [4:0] fetch_rd_tag_f = _T_29 ^ io_ifc_fetch_addr_f[23:19]; // @[lib.scala 42:111]
  wire  _T_46 = btb_bank0_rd_data_way0_f[21:17] == fetch_rd_tag_f; // @[ifu_bp_ctl.scala 144:98]
  wire  _T_47 = btb_bank0_rd_data_way0_f[0] & _T_46; // @[ifu_bp_ctl.scala 144:55]
  wire  _T_19 = io_exu_bp_exu_i0_br_index_r == btb_rd_addr_f; // @[ifu_bp_ctl.scala 125:72]
  wire  branch_error_collision_f = dec_tlu_error_wb & _T_19; // @[ifu_bp_ctl.scala 125:51]
  wire  branch_error_bank_conflict_f = branch_error_collision_f & dec_tlu_error_wb; // @[ifu_bp_ctl.scala 129:63]
  wire  _T_48 = io_dec_bp_dec_tlu_br0_r_pkt_bits_way & branch_error_bank_conflict_f; // @[ifu_bp_ctl.scala 145:22]
  wire  _T_49 = ~_T_48; // @[ifu_bp_ctl.scala 145:5]
  wire  _T_50 = _T_47 & _T_49; // @[ifu_bp_ctl.scala 144:118]
  wire  _T_51 = _T_50 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 145:54]
  wire  tag_match_way0_f = _T_51 & _T; // @[ifu_bp_ctl.scala 145:75]
  wire  _T_82 = btb_bank0_rd_data_way0_f[3] ^ btb_bank0_rd_data_way0_f[4]; // @[ifu_bp_ctl.scala 159:90]
  wire  _T_83 = tag_match_way0_f & _T_82; // @[ifu_bp_ctl.scala 159:56]
  wire  _T_87 = ~_T_82; // @[ifu_bp_ctl.scala 160:24]
  wire  _T_88 = tag_match_way0_f & _T_87; // @[ifu_bp_ctl.scala 160:22]
  wire [1:0] tag_match_way0_expanded_f = {_T_83,_T_88}; // @[Cat.scala 29:58]
  wire [21:0] _T_129 = tag_match_way0_expanded_f[1] ? btb_bank0_rd_data_way0_f : 22'h0; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_0; // @[Reg.scala 27:20]
  wire [21:0] _T_805 = _T_709 ? btb_bank0_rd_data_way1_out_0 : 22'h0; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_1; // @[Reg.scala 27:20]
  wire [21:0] _T_806 = _T_711 ? btb_bank0_rd_data_way1_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_821 = _T_805 | _T_806; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_2; // @[Reg.scala 27:20]
  wire [21:0] _T_807 = _T_713 ? btb_bank0_rd_data_way1_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_822 = _T_821 | _T_807; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_3; // @[Reg.scala 27:20]
  wire [21:0] _T_808 = _T_715 ? btb_bank0_rd_data_way1_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_823 = _T_822 | _T_808; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_4; // @[Reg.scala 27:20]
  wire [21:0] _T_809 = _T_717 ? btb_bank0_rd_data_way1_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_824 = _T_823 | _T_809; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_5; // @[Reg.scala 27:20]
  wire [21:0] _T_810 = _T_719 ? btb_bank0_rd_data_way1_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_825 = _T_824 | _T_810; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_6; // @[Reg.scala 27:20]
  wire [21:0] _T_811 = _T_721 ? btb_bank0_rd_data_way1_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_826 = _T_825 | _T_811; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_7; // @[Reg.scala 27:20]
  wire [21:0] _T_812 = _T_723 ? btb_bank0_rd_data_way1_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_827 = _T_826 | _T_812; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_8; // @[Reg.scala 27:20]
  wire [21:0] _T_813 = _T_725 ? btb_bank0_rd_data_way1_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_828 = _T_827 | _T_813; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_9; // @[Reg.scala 27:20]
  wire [21:0] _T_814 = _T_727 ? btb_bank0_rd_data_way1_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_829 = _T_828 | _T_814; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_10; // @[Reg.scala 27:20]
  wire [21:0] _T_815 = _T_729 ? btb_bank0_rd_data_way1_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_830 = _T_829 | _T_815; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_11; // @[Reg.scala 27:20]
  wire [21:0] _T_816 = _T_731 ? btb_bank0_rd_data_way1_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_831 = _T_830 | _T_816; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_12; // @[Reg.scala 27:20]
  wire [21:0] _T_817 = _T_733 ? btb_bank0_rd_data_way1_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_832 = _T_831 | _T_817; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_13; // @[Reg.scala 27:20]
  wire [21:0] _T_818 = _T_735 ? btb_bank0_rd_data_way1_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_833 = _T_832 | _T_818; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_14; // @[Reg.scala 27:20]
  wire [21:0] _T_819 = _T_737 ? btb_bank0_rd_data_way1_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_834 = _T_833 | _T_819; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_15; // @[Reg.scala 27:20]
  wire [21:0] _T_820 = _T_739 ? btb_bank0_rd_data_way1_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way1_f = _T_834 | _T_820; // @[Mux.scala 27:72]
  wire  _T_55 = btb_bank0_rd_data_way1_f[21:17] == fetch_rd_tag_f; // @[ifu_bp_ctl.scala 148:98]
  wire  _T_56 = btb_bank0_rd_data_way1_f[0] & _T_55; // @[ifu_bp_ctl.scala 148:55]
  wire  _T_59 = _T_56 & _T_49; // @[ifu_bp_ctl.scala 148:118]
  wire  _T_60 = _T_59 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 149:54]
  wire  tag_match_way1_f = _T_60 & _T; // @[ifu_bp_ctl.scala 149:75]
  wire  _T_91 = btb_bank0_rd_data_way1_f[3] ^ btb_bank0_rd_data_way1_f[4]; // @[ifu_bp_ctl.scala 162:90]
  wire  _T_92 = tag_match_way1_f & _T_91; // @[ifu_bp_ctl.scala 162:56]
  wire  _T_96 = ~_T_91; // @[ifu_bp_ctl.scala 163:24]
  wire  _T_97 = tag_match_way1_f & _T_96; // @[ifu_bp_ctl.scala 163:22]
  wire [1:0] tag_match_way1_expanded_f = {_T_92,_T_97}; // @[Cat.scala 29:58]
  wire [21:0] _T_130 = tag_match_way1_expanded_f[1] ? btb_bank0_rd_data_way1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0o_rd_data_f = _T_129 | _T_130; // @[Mux.scala 27:72]
  wire [21:0] _T_149 = _T_147 ? btb_bank0o_rd_data_f : 22'h0; // @[Mux.scala 27:72]
  wire  _T_837 = btb_rd_addr_p1_f == 8'h0; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_869 = _T_837 ? btb_bank0_rd_data_way0_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire  _T_839 = btb_rd_addr_p1_f == 8'h1; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_870 = _T_839 ? btb_bank0_rd_data_way0_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_885 = _T_869 | _T_870; // @[Mux.scala 27:72]
  wire  _T_841 = btb_rd_addr_p1_f == 8'h2; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_871 = _T_841 ? btb_bank0_rd_data_way0_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_886 = _T_885 | _T_871; // @[Mux.scala 27:72]
  wire  _T_843 = btb_rd_addr_p1_f == 8'h3; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_872 = _T_843 ? btb_bank0_rd_data_way0_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_887 = _T_886 | _T_872; // @[Mux.scala 27:72]
  wire  _T_845 = btb_rd_addr_p1_f == 8'h4; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_873 = _T_845 ? btb_bank0_rd_data_way0_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_888 = _T_887 | _T_873; // @[Mux.scala 27:72]
  wire  _T_847 = btb_rd_addr_p1_f == 8'h5; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_874 = _T_847 ? btb_bank0_rd_data_way0_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_889 = _T_888 | _T_874; // @[Mux.scala 27:72]
  wire  _T_849 = btb_rd_addr_p1_f == 8'h6; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_875 = _T_849 ? btb_bank0_rd_data_way0_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_890 = _T_889 | _T_875; // @[Mux.scala 27:72]
  wire  _T_851 = btb_rd_addr_p1_f == 8'h7; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_876 = _T_851 ? btb_bank0_rd_data_way0_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_891 = _T_890 | _T_876; // @[Mux.scala 27:72]
  wire  _T_853 = btb_rd_addr_p1_f == 8'h8; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_877 = _T_853 ? btb_bank0_rd_data_way0_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_892 = _T_891 | _T_877; // @[Mux.scala 27:72]
  wire  _T_855 = btb_rd_addr_p1_f == 8'h9; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_878 = _T_855 ? btb_bank0_rd_data_way0_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_893 = _T_892 | _T_878; // @[Mux.scala 27:72]
  wire  _T_857 = btb_rd_addr_p1_f == 8'ha; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_879 = _T_857 ? btb_bank0_rd_data_way0_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_894 = _T_893 | _T_879; // @[Mux.scala 27:72]
  wire  _T_859 = btb_rd_addr_p1_f == 8'hb; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_880 = _T_859 ? btb_bank0_rd_data_way0_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_895 = _T_894 | _T_880; // @[Mux.scala 27:72]
  wire  _T_861 = btb_rd_addr_p1_f == 8'hc; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_881 = _T_861 ? btb_bank0_rd_data_way0_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_896 = _T_895 | _T_881; // @[Mux.scala 27:72]
  wire  _T_863 = btb_rd_addr_p1_f == 8'hd; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_882 = _T_863 ? btb_bank0_rd_data_way0_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_897 = _T_896 | _T_882; // @[Mux.scala 27:72]
  wire  _T_865 = btb_rd_addr_p1_f == 8'he; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_883 = _T_865 ? btb_bank0_rd_data_way0_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_898 = _T_897 | _T_883; // @[Mux.scala 27:72]
  wire  _T_867 = btb_rd_addr_p1_f == 8'hf; // @[ifu_bp_ctl.scala 449:86]
  wire [21:0] _T_884 = _T_867 ? btb_bank0_rd_data_way0_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way0_p1_f = _T_898 | _T_884; // @[Mux.scala 27:72]
  wire [4:0] _T_35 = _T_8[13:9] ^ _T_8[18:14]; // @[lib.scala 42:111]
  wire [4:0] fetch_rd_tag_p1_f = _T_35 ^ _T_8[23:19]; // @[lib.scala 42:111]
  wire  _T_64 = btb_bank0_rd_data_way0_p1_f[21:17] == fetch_rd_tag_p1_f; // @[ifu_bp_ctl.scala 152:107]
  wire  _T_65 = btb_bank0_rd_data_way0_p1_f[0] & _T_64; // @[ifu_bp_ctl.scala 152:61]
  wire  _T_20 = io_exu_bp_exu_i0_br_index_r == btb_rd_addr_p1_f; // @[ifu_bp_ctl.scala 126:75]
  wire  branch_error_collision_p1_f = dec_tlu_error_wb & _T_20; // @[ifu_bp_ctl.scala 126:54]
  wire  branch_error_bank_conflict_p1_f = branch_error_collision_p1_f & dec_tlu_error_wb; // @[ifu_bp_ctl.scala 130:69]
  wire  _T_66 = io_dec_bp_dec_tlu_br0_r_pkt_bits_way & branch_error_bank_conflict_p1_f; // @[ifu_bp_ctl.scala 153:22]
  wire  _T_67 = ~_T_66; // @[ifu_bp_ctl.scala 153:5]
  wire  _T_68 = _T_65 & _T_67; // @[ifu_bp_ctl.scala 152:130]
  wire  _T_69 = _T_68 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 153:57]
  wire  tag_match_way0_p1_f = _T_69 & _T; // @[ifu_bp_ctl.scala 153:78]
  wire  _T_100 = btb_bank0_rd_data_way0_p1_f[3] ^ btb_bank0_rd_data_way0_p1_f[4]; // @[ifu_bp_ctl.scala 165:99]
  wire  _T_101 = tag_match_way0_p1_f & _T_100; // @[ifu_bp_ctl.scala 165:62]
  wire  _T_105 = ~_T_100; // @[ifu_bp_ctl.scala 166:27]
  wire  _T_106 = tag_match_way0_p1_f & _T_105; // @[ifu_bp_ctl.scala 166:25]
  wire [1:0] tag_match_way0_expanded_p1_f = {_T_101,_T_106}; // @[Cat.scala 29:58]
  wire [21:0] _T_136 = tag_match_way0_expanded_p1_f[0] ? btb_bank0_rd_data_way0_p1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_933 = _T_837 ? btb_bank0_rd_data_way1_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_934 = _T_839 ? btb_bank0_rd_data_way1_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_949 = _T_933 | _T_934; // @[Mux.scala 27:72]
  wire [21:0] _T_935 = _T_841 ? btb_bank0_rd_data_way1_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_950 = _T_949 | _T_935; // @[Mux.scala 27:72]
  wire [21:0] _T_936 = _T_843 ? btb_bank0_rd_data_way1_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_951 = _T_950 | _T_936; // @[Mux.scala 27:72]
  wire [21:0] _T_937 = _T_845 ? btb_bank0_rd_data_way1_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_952 = _T_951 | _T_937; // @[Mux.scala 27:72]
  wire [21:0] _T_938 = _T_847 ? btb_bank0_rd_data_way1_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_953 = _T_952 | _T_938; // @[Mux.scala 27:72]
  wire [21:0] _T_939 = _T_849 ? btb_bank0_rd_data_way1_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_954 = _T_953 | _T_939; // @[Mux.scala 27:72]
  wire [21:0] _T_940 = _T_851 ? btb_bank0_rd_data_way1_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_955 = _T_954 | _T_940; // @[Mux.scala 27:72]
  wire [21:0] _T_941 = _T_853 ? btb_bank0_rd_data_way1_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_956 = _T_955 | _T_941; // @[Mux.scala 27:72]
  wire [21:0] _T_942 = _T_855 ? btb_bank0_rd_data_way1_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_957 = _T_956 | _T_942; // @[Mux.scala 27:72]
  wire [21:0] _T_943 = _T_857 ? btb_bank0_rd_data_way1_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_958 = _T_957 | _T_943; // @[Mux.scala 27:72]
  wire [21:0] _T_944 = _T_859 ? btb_bank0_rd_data_way1_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_959 = _T_958 | _T_944; // @[Mux.scala 27:72]
  wire [21:0] _T_945 = _T_861 ? btb_bank0_rd_data_way1_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_960 = _T_959 | _T_945; // @[Mux.scala 27:72]
  wire [21:0] _T_946 = _T_863 ? btb_bank0_rd_data_way1_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_961 = _T_960 | _T_946; // @[Mux.scala 27:72]
  wire [21:0] _T_947 = _T_865 ? btb_bank0_rd_data_way1_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_962 = _T_961 | _T_947; // @[Mux.scala 27:72]
  wire [21:0] _T_948 = _T_867 ? btb_bank0_rd_data_way1_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way1_p1_f = _T_962 | _T_948; // @[Mux.scala 27:72]
  wire  _T_73 = btb_bank0_rd_data_way1_p1_f[21:17] == fetch_rd_tag_p1_f; // @[ifu_bp_ctl.scala 155:107]
  wire  _T_74 = btb_bank0_rd_data_way1_p1_f[0] & _T_73; // @[ifu_bp_ctl.scala 155:61]
  wire  _T_77 = _T_74 & _T_67; // @[ifu_bp_ctl.scala 155:130]
  wire  _T_78 = _T_77 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 156:57]
  wire  tag_match_way1_p1_f = _T_78 & _T; // @[ifu_bp_ctl.scala 156:78]
  wire  _T_109 = btb_bank0_rd_data_way1_p1_f[3] ^ btb_bank0_rd_data_way1_p1_f[4]; // @[ifu_bp_ctl.scala 168:99]
  wire  _T_110 = tag_match_way1_p1_f & _T_109; // @[ifu_bp_ctl.scala 168:62]
  wire  _T_114 = ~_T_109; // @[ifu_bp_ctl.scala 169:27]
  wire  _T_115 = tag_match_way1_p1_f & _T_114; // @[ifu_bp_ctl.scala 169:25]
  wire [1:0] tag_match_way1_expanded_p1_f = {_T_110,_T_115}; // @[Cat.scala 29:58]
  wire [21:0] _T_137 = tag_match_way1_expanded_p1_f[0] ? btb_bank0_rd_data_way1_p1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0e_rd_data_p1_f = _T_136 | _T_137; // @[Mux.scala 27:72]
  wire [21:0] _T_150 = io_ifc_fetch_addr_f[0] ? btb_bank0e_rd_data_p1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_vbank1_rd_data_f = _T_149 | _T_150; // @[Mux.scala 27:72]
  wire  _T_236 = btb_vbank1_rd_data_f[2] | btb_vbank1_rd_data_f[1]; // @[ifu_bp_ctl.scala 280:59]
  wire [21:0] _T_122 = tag_match_way0_expanded_f[0] ? btb_bank0_rd_data_way0_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_123 = tag_match_way1_expanded_f[0] ? btb_bank0_rd_data_way1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0e_rd_data_f = _T_122 | _T_123; // @[Mux.scala 27:72]
  wire [21:0] _T_142 = _T_147 ? btb_bank0e_rd_data_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_143 = io_ifc_fetch_addr_f[0] ? btb_bank0o_rd_data_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_vbank0_rd_data_f = _T_142 | _T_143; // @[Mux.scala 27:72]
  wire  _T_239 = btb_vbank0_rd_data_f[2] | btb_vbank0_rd_data_f[1]; // @[ifu_bp_ctl.scala 281:59]
  wire [1:0] bht_force_taken_f = {_T_236,_T_239}; // @[Cat.scala 29:58]
  wire [9:0] _T_582 = {btb_rd_addr_f,2'h0}; // @[Cat.scala 29:58]
  reg [7:0] fghr; // @[Reg.scala 27:20]
  wire [7:0] bht_rd_addr_hashed_f = _T_582[9:2] ^ fghr; // @[lib.scala 56:35]
  wire  _T_1947 = bht_rd_addr_hashed_f == 8'h0; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1979 = _T_1947 ? bht_bank_rd_data_out_1_0 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_1949 = bht_rd_addr_hashed_f == 8'h1; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1980 = _T_1949 ? bht_bank_rd_data_out_1_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1995 = _T_1979 | _T_1980; // @[Mux.scala 27:72]
  wire  _T_1951 = bht_rd_addr_hashed_f == 8'h2; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1981 = _T_1951 ? bht_bank_rd_data_out_1_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1996 = _T_1995 | _T_1981; // @[Mux.scala 27:72]
  wire  _T_1953 = bht_rd_addr_hashed_f == 8'h3; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1982 = _T_1953 ? bht_bank_rd_data_out_1_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1997 = _T_1996 | _T_1982; // @[Mux.scala 27:72]
  wire  _T_1955 = bht_rd_addr_hashed_f == 8'h4; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_4; // @[Reg.scala 27:20]
  wire [1:0] _T_1983 = _T_1955 ? bht_bank_rd_data_out_1_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1998 = _T_1997 | _T_1983; // @[Mux.scala 27:72]
  wire  _T_1957 = bht_rd_addr_hashed_f == 8'h5; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_5; // @[Reg.scala 27:20]
  wire [1:0] _T_1984 = _T_1957 ? bht_bank_rd_data_out_1_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1999 = _T_1998 | _T_1984; // @[Mux.scala 27:72]
  wire  _T_1959 = bht_rd_addr_hashed_f == 8'h6; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_6; // @[Reg.scala 27:20]
  wire [1:0] _T_1985 = _T_1959 ? bht_bank_rd_data_out_1_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2000 = _T_1999 | _T_1985; // @[Mux.scala 27:72]
  wire  _T_1961 = bht_rd_addr_hashed_f == 8'h7; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_7; // @[Reg.scala 27:20]
  wire [1:0] _T_1986 = _T_1961 ? bht_bank_rd_data_out_1_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2001 = _T_2000 | _T_1986; // @[Mux.scala 27:72]
  wire  _T_1963 = bht_rd_addr_hashed_f == 8'h8; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_8; // @[Reg.scala 27:20]
  wire [1:0] _T_1987 = _T_1963 ? bht_bank_rd_data_out_1_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2002 = _T_2001 | _T_1987; // @[Mux.scala 27:72]
  wire  _T_1965 = bht_rd_addr_hashed_f == 8'h9; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_9; // @[Reg.scala 27:20]
  wire [1:0] _T_1988 = _T_1965 ? bht_bank_rd_data_out_1_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2003 = _T_2002 | _T_1988; // @[Mux.scala 27:72]
  wire  _T_1967 = bht_rd_addr_hashed_f == 8'ha; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_10; // @[Reg.scala 27:20]
  wire [1:0] _T_1989 = _T_1967 ? bht_bank_rd_data_out_1_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2004 = _T_2003 | _T_1989; // @[Mux.scala 27:72]
  wire  _T_1969 = bht_rd_addr_hashed_f == 8'hb; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_11; // @[Reg.scala 27:20]
  wire [1:0] _T_1990 = _T_1969 ? bht_bank_rd_data_out_1_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2005 = _T_2004 | _T_1990; // @[Mux.scala 27:72]
  wire  _T_1971 = bht_rd_addr_hashed_f == 8'hc; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_12; // @[Reg.scala 27:20]
  wire [1:0] _T_1991 = _T_1971 ? bht_bank_rd_data_out_1_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2006 = _T_2005 | _T_1991; // @[Mux.scala 27:72]
  wire  _T_1973 = bht_rd_addr_hashed_f == 8'hd; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_13; // @[Reg.scala 27:20]
  wire [1:0] _T_1992 = _T_1973 ? bht_bank_rd_data_out_1_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2007 = _T_2006 | _T_1992; // @[Mux.scala 27:72]
  wire  _T_1975 = bht_rd_addr_hashed_f == 8'he; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_14; // @[Reg.scala 27:20]
  wire [1:0] _T_1993 = _T_1975 ? bht_bank_rd_data_out_1_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2008 = _T_2007 | _T_1993; // @[Mux.scala 27:72]
  wire  _T_1977 = bht_rd_addr_hashed_f == 8'hf; // @[ifu_bp_ctl.scala 540:79]
  reg [1:0] bht_bank_rd_data_out_1_15; // @[Reg.scala 27:20]
  wire [1:0] _T_1994 = _T_1977 ? bht_bank_rd_data_out_1_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank1_rd_data_f = _T_2008 | _T_1994; // @[Mux.scala 27:72]
  wire [1:0] _T_253 = _T_147 ? bht_bank1_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [9:0] _T_585 = {btb_rd_addr_p1_f,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] bht_rd_addr_hashed_p1_f = _T_585[9:2] ^ fghr; // @[lib.scala 56:35]
  wire  _T_2011 = bht_rd_addr_hashed_p1_f == 8'h0; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_0; // @[Reg.scala 27:20]
  wire [1:0] _T_2043 = _T_2011 ? bht_bank_rd_data_out_0_0 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_2013 = bht_rd_addr_hashed_p1_f == 8'h1; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_1; // @[Reg.scala 27:20]
  wire [1:0] _T_2044 = _T_2013 ? bht_bank_rd_data_out_0_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2059 = _T_2043 | _T_2044; // @[Mux.scala 27:72]
  wire  _T_2015 = bht_rd_addr_hashed_p1_f == 8'h2; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_2; // @[Reg.scala 27:20]
  wire [1:0] _T_2045 = _T_2015 ? bht_bank_rd_data_out_0_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2060 = _T_2059 | _T_2045; // @[Mux.scala 27:72]
  wire  _T_2017 = bht_rd_addr_hashed_p1_f == 8'h3; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_3; // @[Reg.scala 27:20]
  wire [1:0] _T_2046 = _T_2017 ? bht_bank_rd_data_out_0_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2061 = _T_2060 | _T_2046; // @[Mux.scala 27:72]
  wire  _T_2019 = bht_rd_addr_hashed_p1_f == 8'h4; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_4; // @[Reg.scala 27:20]
  wire [1:0] _T_2047 = _T_2019 ? bht_bank_rd_data_out_0_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2062 = _T_2061 | _T_2047; // @[Mux.scala 27:72]
  wire  _T_2021 = bht_rd_addr_hashed_p1_f == 8'h5; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_5; // @[Reg.scala 27:20]
  wire [1:0] _T_2048 = _T_2021 ? bht_bank_rd_data_out_0_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2063 = _T_2062 | _T_2048; // @[Mux.scala 27:72]
  wire  _T_2023 = bht_rd_addr_hashed_p1_f == 8'h6; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_6; // @[Reg.scala 27:20]
  wire [1:0] _T_2049 = _T_2023 ? bht_bank_rd_data_out_0_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2064 = _T_2063 | _T_2049; // @[Mux.scala 27:72]
  wire  _T_2025 = bht_rd_addr_hashed_p1_f == 8'h7; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_7; // @[Reg.scala 27:20]
  wire [1:0] _T_2050 = _T_2025 ? bht_bank_rd_data_out_0_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2065 = _T_2064 | _T_2050; // @[Mux.scala 27:72]
  wire  _T_2027 = bht_rd_addr_hashed_p1_f == 8'h8; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_8; // @[Reg.scala 27:20]
  wire [1:0] _T_2051 = _T_2027 ? bht_bank_rd_data_out_0_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2066 = _T_2065 | _T_2051; // @[Mux.scala 27:72]
  wire  _T_2029 = bht_rd_addr_hashed_p1_f == 8'h9; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_9; // @[Reg.scala 27:20]
  wire [1:0] _T_2052 = _T_2029 ? bht_bank_rd_data_out_0_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2067 = _T_2066 | _T_2052; // @[Mux.scala 27:72]
  wire  _T_2031 = bht_rd_addr_hashed_p1_f == 8'ha; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_10; // @[Reg.scala 27:20]
  wire [1:0] _T_2053 = _T_2031 ? bht_bank_rd_data_out_0_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2068 = _T_2067 | _T_2053; // @[Mux.scala 27:72]
  wire  _T_2033 = bht_rd_addr_hashed_p1_f == 8'hb; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_11; // @[Reg.scala 27:20]
  wire [1:0] _T_2054 = _T_2033 ? bht_bank_rd_data_out_0_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2069 = _T_2068 | _T_2054; // @[Mux.scala 27:72]
  wire  _T_2035 = bht_rd_addr_hashed_p1_f == 8'hc; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_12; // @[Reg.scala 27:20]
  wire [1:0] _T_2055 = _T_2035 ? bht_bank_rd_data_out_0_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2070 = _T_2069 | _T_2055; // @[Mux.scala 27:72]
  wire  _T_2037 = bht_rd_addr_hashed_p1_f == 8'hd; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_13; // @[Reg.scala 27:20]
  wire [1:0] _T_2056 = _T_2037 ? bht_bank_rd_data_out_0_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2071 = _T_2070 | _T_2056; // @[Mux.scala 27:72]
  wire  _T_2039 = bht_rd_addr_hashed_p1_f == 8'he; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_14; // @[Reg.scala 27:20]
  wire [1:0] _T_2057 = _T_2039 ? bht_bank_rd_data_out_0_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2072 = _T_2071 | _T_2057; // @[Mux.scala 27:72]
  wire  _T_2041 = bht_rd_addr_hashed_p1_f == 8'hf; // @[ifu_bp_ctl.scala 541:85]
  reg [1:0] bht_bank_rd_data_out_0_15; // @[Reg.scala 27:20]
  wire [1:0] _T_2058 = _T_2041 ? bht_bank_rd_data_out_0_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank0_rd_data_p1_f = _T_2072 | _T_2058; // @[Mux.scala 27:72]
  wire [1:0] _T_254 = io_ifc_fetch_addr_f[0] ? bht_bank0_rd_data_p1_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_vbank1_rd_data_f = _T_253 | _T_254; // @[Mux.scala 27:72]
  wire  _T_258 = bht_force_taken_f[1] | bht_vbank1_rd_data_f[1]; // @[ifu_bp_ctl.scala 298:42]
  wire [1:0] wayhit_f = tag_match_way0_expanded_f | tag_match_way1_expanded_f; // @[ifu_bp_ctl.scala 172:41]
  wire [1:0] _T_607 = _T_147 ? wayhit_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] wayhit_p1_f = tag_match_way0_expanded_p1_f | tag_match_way1_expanded_p1_f; // @[ifu_bp_ctl.scala 174:47]
  wire [1:0] _T_606 = {wayhit_p1_f[0],wayhit_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_608 = io_ifc_fetch_addr_f[0] ? _T_606 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_609 = _T_607 | _T_608; // @[Mux.scala 27:72]
  wire  eoc_near = &io_ifc_fetch_addr_f[4:2]; // @[ifu_bp_ctl.scala 258:64]
  wire  _T_212 = ~eoc_near; // @[ifu_bp_ctl.scala 260:15]
  wire [1:0] _T_214 = ~io_ifc_fetch_addr_f[1:0]; // @[ifu_bp_ctl.scala 260:28]
  wire  _T_215 = |_T_214; // @[ifu_bp_ctl.scala 260:58]
  wire  eoc_mask = _T_212 | _T_215; // @[ifu_bp_ctl.scala 260:25]
  wire [1:0] _T_611 = {eoc_mask,1'h1}; // @[Cat.scala 29:58]
  wire [1:0] vwayhit_f = _T_609 & _T_611; // @[ifu_bp_ctl.scala 441:71]
  wire  _T_260 = _T_258 & vwayhit_f[1]; // @[ifu_bp_ctl.scala 298:69]
  wire [1:0] _T_1915 = _T_1947 ? bht_bank_rd_data_out_0_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1916 = _T_1949 ? bht_bank_rd_data_out_0_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1931 = _T_1915 | _T_1916; // @[Mux.scala 27:72]
  wire [1:0] _T_1917 = _T_1951 ? bht_bank_rd_data_out_0_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1932 = _T_1931 | _T_1917; // @[Mux.scala 27:72]
  wire [1:0] _T_1918 = _T_1953 ? bht_bank_rd_data_out_0_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1933 = _T_1932 | _T_1918; // @[Mux.scala 27:72]
  wire [1:0] _T_1919 = _T_1955 ? bht_bank_rd_data_out_0_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1934 = _T_1933 | _T_1919; // @[Mux.scala 27:72]
  wire [1:0] _T_1920 = _T_1957 ? bht_bank_rd_data_out_0_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1935 = _T_1934 | _T_1920; // @[Mux.scala 27:72]
  wire [1:0] _T_1921 = _T_1959 ? bht_bank_rd_data_out_0_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1936 = _T_1935 | _T_1921; // @[Mux.scala 27:72]
  wire [1:0] _T_1922 = _T_1961 ? bht_bank_rd_data_out_0_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1937 = _T_1936 | _T_1922; // @[Mux.scala 27:72]
  wire [1:0] _T_1923 = _T_1963 ? bht_bank_rd_data_out_0_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1938 = _T_1937 | _T_1923; // @[Mux.scala 27:72]
  wire [1:0] _T_1924 = _T_1965 ? bht_bank_rd_data_out_0_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1939 = _T_1938 | _T_1924; // @[Mux.scala 27:72]
  wire [1:0] _T_1925 = _T_1967 ? bht_bank_rd_data_out_0_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1940 = _T_1939 | _T_1925; // @[Mux.scala 27:72]
  wire [1:0] _T_1926 = _T_1969 ? bht_bank_rd_data_out_0_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1941 = _T_1940 | _T_1926; // @[Mux.scala 27:72]
  wire [1:0] _T_1927 = _T_1971 ? bht_bank_rd_data_out_0_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1942 = _T_1941 | _T_1927; // @[Mux.scala 27:72]
  wire [1:0] _T_1928 = _T_1973 ? bht_bank_rd_data_out_0_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1943 = _T_1942 | _T_1928; // @[Mux.scala 27:72]
  wire [1:0] _T_1929 = _T_1975 ? bht_bank_rd_data_out_0_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1944 = _T_1943 | _T_1929; // @[Mux.scala 27:72]
  wire [1:0] _T_1930 = _T_1977 ? bht_bank_rd_data_out_0_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank0_rd_data_f = _T_1944 | _T_1930; // @[Mux.scala 27:72]
  wire [1:0] _T_245 = _T_147 ? bht_bank0_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_246 = io_ifc_fetch_addr_f[0] ? bht_bank1_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_vbank0_rd_data_f = _T_245 | _T_246; // @[Mux.scala 27:72]
  wire  _T_263 = bht_force_taken_f[0] | bht_vbank0_rd_data_f[1]; // @[ifu_bp_ctl.scala 299:45]
  wire  _T_265 = _T_263 & vwayhit_f[0]; // @[ifu_bp_ctl.scala 299:72]
  wire [1:0] bht_dir_f = {_T_260,_T_265}; // @[Cat.scala 29:58]
  wire  _T_14 = ~bht_dir_f[0]; // @[ifu_bp_ctl.scala 119:23]
  wire [1:0] btb_sel_f = {_T_14,bht_dir_f[0]}; // @[Cat.scala 29:58]
  wire [1:0] fetch_start_f = {io_ifc_fetch_addr_f[0],_T_147}; // @[Cat.scala 29:58]
  wire  _T_36 = io_exu_bp_exu_mp_btag == fetch_rd_tag_f; // @[ifu_bp_ctl.scala 140:53]
  wire  _T_37 = _T_36 & exu_mp_valid; // @[ifu_bp_ctl.scala 140:73]
  wire  _T_38 = _T_37 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 140:88]
  wire  _T_39 = io_exu_bp_exu_mp_index == btb_rd_addr_f; // @[ifu_bp_ctl.scala 140:124]
  wire  fetch_mp_collision_f = _T_38 & _T_39; // @[ifu_bp_ctl.scala 140:109]
  wire  _T_40 = io_exu_bp_exu_mp_btag == fetch_rd_tag_p1_f; // @[ifu_bp_ctl.scala 141:56]
  wire  _T_41 = _T_40 & exu_mp_valid; // @[ifu_bp_ctl.scala 141:79]
  wire  _T_42 = _T_41 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 141:94]
  wire  _T_43 = io_exu_bp_exu_mp_index == btb_rd_addr_p1_f; // @[ifu_bp_ctl.scala 141:130]
  wire  fetch_mp_collision_p1_f = _T_42 & _T_43; // @[ifu_bp_ctl.scala 141:115]
  wire [1:0] _T_153 = ~vwayhit_f; // @[ifu_bp_ctl.scala 194:44]
  reg  exu_mp_way_f; // @[Reg.scala 27:20]
  wire [255:0] fetch_wrindex_dec = 256'h1 << btb_rd_addr_f; // @[ifu_bp_ctl.scala 213:31]
  reg [255:0] _T_210; // @[Reg.scala 27:20]
  wire [15:0] btb_lru_b0_f = _T_210[15:0]; // @[ifu_bp_ctl.scala 251:16]
  wire [255:0] _GEN_78 = {{240'd0}, btb_lru_b0_f}; // @[ifu_bp_ctl.scala 239:78]
  wire [255:0] _T_181 = fetch_wrindex_dec & _GEN_78; // @[ifu_bp_ctl.scala 239:78]
  wire  _T_182 = |_T_181; // @[ifu_bp_ctl.scala 239:94]
  wire  btb_lru_rd_f = fetch_mp_collision_f ? exu_mp_way_f : _T_182; // @[ifu_bp_ctl.scala 239:25]
  wire [1:0] _T_188 = {btb_lru_rd_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_192 = _T_147 ? _T_188 : 2'h0; // @[Mux.scala 27:72]
  wire [255:0] fetch_wrindex_p1_dec = 256'h1 << btb_rd_addr_p1_f; // @[ifu_bp_ctl.scala 216:34]
  wire [255:0] _T_184 = fetch_wrindex_p1_dec & _GEN_78; // @[ifu_bp_ctl.scala 241:87]
  wire  _T_185 = |_T_184; // @[ifu_bp_ctl.scala 241:103]
  wire  btb_lru_rd_p1_f = fetch_mp_collision_p1_f ? exu_mp_way_f : _T_185; // @[ifu_bp_ctl.scala 241:28]
  wire [1:0] _T_191 = {btb_lru_rd_p1_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_193 = io_ifc_fetch_addr_f[0] ? _T_191 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] btb_vlru_rd_f = _T_192 | _T_193; // @[Mux.scala 27:72]
  wire [1:0] _T_154 = _T_153 & btb_vlru_rd_f; // @[ifu_bp_ctl.scala 194:55]
  wire [1:0] _T_204 = _T_147 ? tag_match_way1_expanded_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_203 = {tag_match_way1_expanded_p1_f[0],tag_match_way1_expanded_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_205 = io_ifc_fetch_addr_f[0] ? _T_203 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] tag_match_vway1_expanded_f = _T_204 | _T_205; // @[Mux.scala 27:72]
  wire [255:0] mp_wrindex_dec = 256'h1 << io_exu_bp_exu_mp_index; // @[ifu_bp_ctl.scala 210:28]
  wire [15:0] _T_157 = exu_mp_valid ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [255:0] _GEN_80 = {{240'd0}, _T_157}; // @[ifu_bp_ctl.scala 219:36]
  wire [255:0] mp_wrlru_b0 = mp_wrindex_dec & _GEN_80; // @[ifu_bp_ctl.scala 219:36]
  wire  _T_160 = vwayhit_f[0] | vwayhit_f[1]; // @[ifu_bp_ctl.scala 222:42]
  wire  _T_161 = _T_160 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 222:58]
  wire  lru_update_valid_f = _T_161 & _T; // @[ifu_bp_ctl.scala 222:79]
  wire [15:0] _T_164 = lru_update_valid_f ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [255:0] _GEN_81 = {{240'd0}, _T_164}; // @[ifu_bp_ctl.scala 224:42]
  wire [255:0] fetch_wrlru_b0 = fetch_wrindex_dec & _GEN_81; // @[ifu_bp_ctl.scala 224:42]
  wire [255:0] fetch_wrlru_p1_b0 = fetch_wrindex_p1_dec & _GEN_81; // @[ifu_bp_ctl.scala 225:48]
  wire [255:0] _T_167 = ~mp_wrlru_b0; // @[ifu_bp_ctl.scala 227:25]
  wire [255:0] _T_168 = ~fetch_wrlru_b0; // @[ifu_bp_ctl.scala 227:40]
  wire [255:0] btb_lru_b0_hold = _T_167 & _T_168; // @[ifu_bp_ctl.scala 227:38]
  wire  _T_170 = ~io_exu_bp_exu_mp_pkt_bits_way; // @[ifu_bp_ctl.scala 234:39]
  wire [255:0] _T_173 = _T_170 ? mp_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_174 = tag_match_way0_f ? fetch_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_175 = tag_match_way0_p1_f ? fetch_wrlru_p1_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_176 = _T_173 | _T_174; // @[Mux.scala 27:72]
  wire [255:0] _T_177 = _T_176 | _T_175; // @[Mux.scala 27:72]
  wire [255:0] _T_179 = btb_lru_b0_hold & _GEN_78; // @[ifu_bp_ctl.scala 236:73]
  wire [255:0] btb_lru_b0_ns = _T_177 | _T_179; // @[ifu_bp_ctl.scala 236:55]
  wire  _T_208 = io_ifc_fetch_req_f | exu_mp_valid; // @[ifu_bp_ctl.scala 251:60]
  wire [15:0] _T_223 = btb_sel_f[1] ? btb_vbank1_rd_data_f[16:1] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_224 = btb_sel_f[0] ? btb_vbank0_rd_data_f[16:1] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] btb_sel_data_f = _T_223 | _T_224; // @[Mux.scala 27:72]
  wire [11:0] btb_rd_tgt_f = btb_sel_data_f[15:4]; // @[ifu_bp_ctl.scala 267:36]
  wire  btb_rd_pc4_f = btb_sel_data_f[3]; // @[ifu_bp_ctl.scala 268:36]
  wire  btb_rd_call_f = btb_sel_data_f[1]; // @[ifu_bp_ctl.scala 269:37]
  wire  btb_rd_ret_f = btb_sel_data_f[0]; // @[ifu_bp_ctl.scala 270:36]
  wire [1:0] _T_273 = {bht_vbank1_rd_data_f[1],bht_vbank0_rd_data_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] hist1_raw = bht_force_taken_f | _T_273; // @[ifu_bp_ctl.scala 305:34]
  wire [1:0] _T_227 = vwayhit_f & hist1_raw; // @[ifu_bp_ctl.scala 277:39]
  wire  _T_228 = |_T_227; // @[ifu_bp_ctl.scala 277:52]
  wire  _T_229 = _T_228 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 277:56]
  wire  _T_230 = ~leak_one_f_d1; // @[ifu_bp_ctl.scala 277:79]
  wire  _T_231 = _T_229 & _T_230; // @[ifu_bp_ctl.scala 277:77]
  wire  _T_232 = ~io_dec_bp_dec_tlu_bpred_disable; // @[ifu_bp_ctl.scala 277:96]
  wire  _T_268 = io_ifu_bp_hit_taken_f & btb_sel_f[1]; // @[ifu_bp_ctl.scala 302:51]
  wire  _T_269 = ~io_ifu_bp_hit_taken_f; // @[ifu_bp_ctl.scala 302:69]
  wire  _T_279 = vwayhit_f[1] & btb_vbank1_rd_data_f[4]; // @[ifu_bp_ctl.scala 311:34]
  wire  _T_282 = vwayhit_f[0] & btb_vbank0_rd_data_f[4]; // @[ifu_bp_ctl.scala 312:34]
  wire  _T_285 = ~btb_vbank1_rd_data_f[2]; // @[ifu_bp_ctl.scala 315:37]
  wire  _T_286 = vwayhit_f[1] & _T_285; // @[ifu_bp_ctl.scala 315:35]
  wire  _T_288 = _T_286 & btb_vbank1_rd_data_f[1]; // @[ifu_bp_ctl.scala 315:65]
  wire  _T_291 = ~btb_vbank0_rd_data_f[2]; // @[ifu_bp_ctl.scala 316:37]
  wire  _T_292 = vwayhit_f[0] & _T_291; // @[ifu_bp_ctl.scala 316:35]
  wire  _T_294 = _T_292 & btb_vbank0_rd_data_f[1]; // @[ifu_bp_ctl.scala 316:65]
  wire [1:0] num_valids = vwayhit_f[1] + vwayhit_f[0]; // @[ifu_bp_ctl.scala 319:35]
  wire [1:0] _T_297 = btb_sel_f & bht_dir_f; // @[ifu_bp_ctl.scala 322:28]
  wire  final_h = |_T_297; // @[ifu_bp_ctl.scala 322:41]
  wire  _T_298 = num_valids == 2'h2; // @[ifu_bp_ctl.scala 326:41]
  wire [7:0] _T_302 = {fghr[5:0],1'h0,final_h}; // @[Cat.scala 29:58]
  wire  _T_303 = num_valids == 2'h1; // @[ifu_bp_ctl.scala 327:41]
  wire [7:0] _T_306 = {fghr[6:0],final_h}; // @[Cat.scala 29:58]
  wire  _T_307 = num_valids == 2'h0; // @[ifu_bp_ctl.scala 328:41]
  wire [7:0] _T_310 = _T_298 ? _T_302 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_311 = _T_303 ? _T_306 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_312 = _T_307 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_313 = _T_310 | _T_311; // @[Mux.scala 27:72]
  wire [7:0] merged_ghr = _T_313 | _T_312; // @[Mux.scala 27:72]
  reg  exu_flush_final_d1; // @[Reg.scala 27:20]
  wire  _T_316 = ~exu_flush_final_d1; // @[ifu_bp_ctl.scala 337:27]
  wire  _T_317 = _T_316 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 337:47]
  wire  _T_318 = _T_317 & io_ic_hit_f; // @[ifu_bp_ctl.scala 337:70]
  wire  _T_320 = _T_318 & _T_230; // @[ifu_bp_ctl.scala 337:84]
  wire  _T_323 = io_ifc_fetch_req_f & io_ic_hit_f; // @[ifu_bp_ctl.scala 338:70]
  wire  _T_325 = _T_323 & _T_230; // @[ifu_bp_ctl.scala 338:84]
  wire  _T_326 = ~_T_325; // @[ifu_bp_ctl.scala 338:49]
  wire  _T_327 = _T_316 & _T_326; // @[ifu_bp_ctl.scala 338:47]
  wire [7:0] _T_329 = exu_flush_final_d1 ? io_exu_bp_exu_mp_fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_330 = _T_320 ? merged_ghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_331 = _T_327 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_332 = _T_329 | _T_330; // @[Mux.scala 27:72]
  wire [7:0] fghr_ns = _T_332 | _T_331; // @[Mux.scala 27:72]
  wire  _T_336 = leak_one_f ^ leak_one_f_d1; // @[lib.scala 436:21]
  wire  _T_337 = |_T_336; // @[lib.scala 436:29]
  wire  _T_340 = io_exu_bp_exu_mp_pkt_bits_way ^ exu_mp_way_f; // @[lib.scala 436:21]
  wire  _T_341 = |_T_340; // @[lib.scala 436:29]
  wire  _T_344 = io_exu_flush_final ^ exu_flush_final_d1; // @[lib.scala 458:21]
  wire  _T_345 = |_T_344; // @[lib.scala 458:29]
  wire [7:0] _T_348 = fghr_ns ^ fghr; // @[lib.scala 436:21]
  wire  _T_349 = |_T_348; // @[lib.scala 436:29]
  wire [1:0] _T_352 = io_dec_bp_dec_tlu_bpred_disable ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_353 = ~_T_352; // @[ifu_bp_ctl.scala 350:36]
  wire  _T_357 = ~fetch_start_f[0]; // @[ifu_bp_ctl.scala 354:36]
  wire  _T_358 = bht_dir_f[0] & _T_357; // @[ifu_bp_ctl.scala 354:34]
  wire  _T_362 = _T_14 & fetch_start_f[0]; // @[ifu_bp_ctl.scala 354:72]
  wire  _T_363 = _T_358 | _T_362; // @[ifu_bp_ctl.scala 354:55]
  wire  _T_366 = bht_dir_f[0] & fetch_start_f[0]; // @[ifu_bp_ctl.scala 355:34]
  wire  _T_371 = _T_14 & _T_357; // @[ifu_bp_ctl.scala 355:71]
  wire  _T_372 = _T_366 | _T_371; // @[ifu_bp_ctl.scala 355:54]
  wire [1:0] bloc_f = {_T_363,_T_372}; // @[Cat.scala 29:58]
  wire  _T_376 = _T_14 & io_ifc_fetch_addr_f[0]; // @[ifu_bp_ctl.scala 357:35]
  wire  _T_377 = ~btb_rd_pc4_f; // @[ifu_bp_ctl.scala 357:62]
  wire  use_fa_plus = _T_376 & _T_377; // @[ifu_bp_ctl.scala 357:60]
  wire  _T_380 = fetch_start_f[0] & btb_sel_f[0]; // @[ifu_bp_ctl.scala 359:44]
  wire  btb_fg_crossing_f = _T_380 & btb_rd_pc4_f; // @[ifu_bp_ctl.scala 359:59]
  wire  bp_total_branch_offset_f = bloc_f[1] ^ btb_rd_pc4_f; // @[ifu_bp_ctl.scala 360:43]
  wire  _T_384 = io_ifc_fetch_req_f & _T_269; // @[ifu_bp_ctl.scala 361:117]
  wire  _T_385 = _T_384 & io_ic_hit_f; // @[ifu_bp_ctl.scala 361:142]
  reg [29:0] ifc_fetch_adder_prior; // @[Reg.scala 27:20]
  wire  _T_390 = ~btb_fg_crossing_f; // @[ifu_bp_ctl.scala 366:32]
  wire  _T_391 = ~use_fa_plus; // @[ifu_bp_ctl.scala 366:53]
  wire  _T_392 = _T_390 & _T_391; // @[ifu_bp_ctl.scala 366:51]
  wire [29:0] _T_395 = use_fa_plus ? fetch_addr_p1_f : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_396 = btb_fg_crossing_f ? ifc_fetch_adder_prior : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_397 = _T_392 ? io_ifc_fetch_addr_f[30:1] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_398 = _T_395 | _T_396; // @[Mux.scala 27:72]
  wire [29:0] adder_pc_in_f = _T_398 | _T_397; // @[Mux.scala 27:72]
  wire [31:0] _T_402 = {adder_pc_in_f,bp_total_branch_offset_f,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_403 = {btb_rd_tgt_f,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_406 = _T_402[12:1] + _T_403[12:1]; // @[lib.scala 68:31]
  wire [18:0] _T_409 = _T_402[31:13] + 19'h1; // @[lib.scala 69:27]
  wire [18:0] _T_412 = _T_402[31:13] - 19'h1; // @[lib.scala 70:27]
  wire  _T_415 = ~_T_406[12]; // @[lib.scala 72:28]
  wire  _T_416 = _T_403[12] ^ _T_415; // @[lib.scala 72:26]
  wire  _T_419 = ~_T_403[12]; // @[lib.scala 73:20]
  wire  _T_421 = _T_419 & _T_406[12]; // @[lib.scala 73:26]
  wire  _T_425 = _T_403[12] & _T_415; // @[lib.scala 74:26]
  wire [18:0] _T_427 = _T_416 ? _T_402[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_428 = _T_421 ? _T_409 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_429 = _T_425 ? _T_412 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_430 = _T_427 | _T_428; // @[Mux.scala 27:72]
  wire [18:0] _T_431 = _T_430 | _T_429; // @[Mux.scala 27:72]
  wire [31:0] bp_btb_target_adder_f = {_T_431,_T_406[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_435 = ~btb_rd_call_f; // @[ifu_bp_ctl.scala 374:55]
  wire  _T_436 = btb_rd_ret_f & _T_435; // @[ifu_bp_ctl.scala 374:53]
  reg [31:0] rets_out_0; // @[Reg.scala 27:20]
  wire  _T_438 = _T_436 & rets_out_0[0]; // @[ifu_bp_ctl.scala 374:70]
  wire  _T_439 = _T_438 & io_ifu_bp_hit_taken_f; // @[ifu_bp_ctl.scala 374:87]
  wire [30:0] _T_441 = _T_439 ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [30:0] _T_443 = _T_441 & rets_out_0[31:1]; // @[ifu_bp_ctl.scala 374:113]
  wire  _T_448 = ~_T_438; // @[ifu_bp_ctl.scala 375:15]
  wire  _T_449 = _T_448 & io_ifu_bp_hit_taken_f; // @[ifu_bp_ctl.scala 375:65]
  wire [30:0] _T_451 = _T_449 ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [30:0] _T_453 = _T_451 & bp_btb_target_adder_f[31:1]; // @[ifu_bp_ctl.scala 375:91]
  wire [12:0] _T_461 = {11'h0,_T_377,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_464 = _T_402[12:1] + _T_461[12:1]; // @[lib.scala 68:31]
  wire  _T_473 = ~_T_464[12]; // @[lib.scala 72:28]
  wire  _T_474 = _T_461[12] ^ _T_473; // @[lib.scala 72:26]
  wire  _T_477 = ~_T_461[12]; // @[lib.scala 73:20]
  wire  _T_479 = _T_477 & _T_464[12]; // @[lib.scala 73:26]
  wire  _T_483 = _T_461[12] & _T_473; // @[lib.scala 74:26]
  wire [18:0] _T_485 = _T_474 ? _T_402[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_486 = _T_479 ? _T_409 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_487 = _T_483 ? _T_412 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_488 = _T_485 | _T_486; // @[Mux.scala 27:72]
  wire [18:0] _T_489 = _T_488 | _T_487; // @[Mux.scala 27:72]
  wire [31:0] bp_rs_call_target_f = {_T_489,_T_464[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_493 = ~btb_rd_ret_f; // @[ifu_bp_ctl.scala 379:33]
  wire  _T_494 = btb_rd_call_f & _T_493; // @[ifu_bp_ctl.scala 379:31]
  wire  rs_push = _T_494 & io_ifu_bp_hit_taken_f; // @[ifu_bp_ctl.scala 379:47]
  wire  rs_pop = _T_436 & io_ifu_bp_hit_taken_f; // @[ifu_bp_ctl.scala 380:46]
  wire  _T_497 = ~rs_push; // @[ifu_bp_ctl.scala 381:17]
  wire  _T_498 = ~rs_pop; // @[ifu_bp_ctl.scala 381:28]
  wire  rs_hold = _T_497 & _T_498; // @[ifu_bp_ctl.scala 381:26]
  wire  rsenable_0 = ~rs_hold; // @[ifu_bp_ctl.scala 383:60]
  wire  rsenable_1 = rs_push | rs_pop; // @[ifu_bp_ctl.scala 383:119]
  wire [31:0] _T_501 = {bp_rs_call_target_f[31:1],1'h1}; // @[Cat.scala 29:58]
  wire [31:0] _T_503 = rs_push ? _T_501 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_1; // @[Reg.scala 27:20]
  wire [31:0] _T_504 = rs_pop ? rets_out_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_0 = _T_503 | _T_504; // @[Mux.scala 27:72]
  wire [31:0] _T_508 = rs_push ? rets_out_0 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_2; // @[Reg.scala 27:20]
  wire [31:0] _T_509 = rs_pop ? rets_out_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_1 = _T_508 | _T_509; // @[Mux.scala 27:72]
  wire [31:0] _T_513 = rs_push ? rets_out_1 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_3; // @[Reg.scala 27:20]
  wire [31:0] _T_514 = rs_pop ? rets_out_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_2 = _T_513 | _T_514; // @[Mux.scala 27:72]
  wire [31:0] _T_518 = rs_push ? rets_out_2 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_4; // @[Reg.scala 27:20]
  wire [31:0] _T_519 = rs_pop ? rets_out_4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_3 = _T_518 | _T_519; // @[Mux.scala 27:72]
  wire [31:0] _T_523 = rs_push ? rets_out_3 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_5; // @[Reg.scala 27:20]
  wire [31:0] _T_524 = rs_pop ? rets_out_5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_4 = _T_523 | _T_524; // @[Mux.scala 27:72]
  wire [31:0] _T_528 = rs_push ? rets_out_4 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_6; // @[Reg.scala 27:20]
  wire [31:0] _T_529 = rs_pop ? rets_out_6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_5 = _T_528 | _T_529; // @[Mux.scala 27:72]
  wire [31:0] _T_533 = rs_push ? rets_out_5 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_7; // @[Reg.scala 27:20]
  wire [31:0] _T_534 = rs_pop ? rets_out_7 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_6 = _T_533 | _T_534; // @[Mux.scala 27:72]
  wire  _T_552 = ~dec_tlu_error_wb; // @[ifu_bp_ctl.scala 395:35]
  wire  btb_valid = exu_mp_valid & _T_552; // @[ifu_bp_ctl.scala 395:32]
  wire  _T_553 = io_exu_bp_exu_mp_pkt_bits_pcall | io_exu_bp_exu_mp_pkt_bits_pja; // @[ifu_bp_ctl.scala 409:89]
  wire  _T_554 = io_exu_bp_exu_mp_pkt_bits_pret | io_exu_bp_exu_mp_pkt_bits_pja; // @[ifu_bp_ctl.scala 409:113]
  wire [21:0] btb_wr_data = {io_exu_bp_exu_mp_btag,io_exu_bp_exu_mp_pkt_bits_toffset,io_exu_bp_exu_mp_pkt_bits_pc4,io_exu_bp_exu_mp_pkt_bits_boffset,_T_553,_T_554,btb_valid}; // @[Cat.scala 29:58]
  wire  _T_560 = exu_mp_valid & io_exu_bp_exu_mp_pkt_bits_ataken; // @[ifu_bp_ctl.scala 410:41]
  wire  _T_561 = ~io_exu_bp_exu_mp_pkt_valid; // @[ifu_bp_ctl.scala 410:59]
  wire  exu_mp_valid_write = _T_560 & _T_561; // @[ifu_bp_ctl.scala 410:57]
  wire  middle_of_bank = io_exu_bp_exu_mp_pkt_bits_pc4 ^ io_exu_bp_exu_mp_pkt_bits_boffset; // @[ifu_bp_ctl.scala 411:35]
  wire  _T_562 = ~io_exu_bp_exu_mp_pkt_bits_pcall; // @[ifu_bp_ctl.scala 414:43]
  wire  _T_563 = exu_mp_valid & _T_562; // @[ifu_bp_ctl.scala 414:41]
  wire  _T_564 = ~io_exu_bp_exu_mp_pkt_bits_pret; // @[ifu_bp_ctl.scala 414:58]
  wire  _T_565 = _T_563 & _T_564; // @[ifu_bp_ctl.scala 414:56]
  wire  _T_566 = ~io_exu_bp_exu_mp_pkt_bits_pja; // @[ifu_bp_ctl.scala 414:72]
  wire  _T_567 = _T_565 & _T_566; // @[ifu_bp_ctl.scala 414:70]
  wire [1:0] _T_569 = _T_567 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_570 = ~middle_of_bank; // @[ifu_bp_ctl.scala 414:106]
  wire [1:0] _T_571 = {middle_of_bank,_T_570}; // @[Cat.scala 29:58]
  wire [1:0] bht_wr_en0 = _T_569 & _T_571; // @[ifu_bp_ctl.scala 414:84]
  wire [1:0] _T_573 = io_dec_bp_dec_tlu_br0_r_pkt_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_574 = ~io_dec_bp_dec_tlu_br0_r_pkt_bits_middle; // @[ifu_bp_ctl.scala 415:75]
  wire [1:0] _T_575 = {io_dec_bp_dec_tlu_br0_r_pkt_bits_middle,_T_574}; // @[Cat.scala 29:58]
  wire [1:0] bht_wr_en2 = _T_573 & _T_575; // @[ifu_bp_ctl.scala 415:46]
  wire [9:0] _T_576 = {io_exu_bp_exu_mp_index,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] mp_hashed = _T_576[9:2] ^ io_exu_bp_exu_mp_eghr; // @[lib.scala 56:35]
  wire [9:0] _T_579 = {io_exu_bp_exu_i0_br_index_r,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] br0_hashed_wb = _T_579[9:2] ^ io_exu_bp_exu_i0_br_fghr_r; // @[lib.scala 56:35]
  wire  _T_589 = _T_170 & exu_mp_valid_write; // @[ifu_bp_ctl.scala 434:39]
  wire  _T_591 = _T_589 & _T_552; // @[ifu_bp_ctl.scala 434:60]
  wire  _T_592 = ~io_dec_bp_dec_tlu_br0_r_pkt_bits_way; // @[ifu_bp_ctl.scala 434:87]
  wire  _T_593 = _T_592 & dec_tlu_error_wb; // @[ifu_bp_ctl.scala 434:104]
  wire  btb_wr_en_way0 = _T_591 | _T_593; // @[ifu_bp_ctl.scala 434:83]
  wire  _T_594 = io_exu_bp_exu_mp_pkt_bits_way & exu_mp_valid_write; // @[ifu_bp_ctl.scala 435:36]
  wire  _T_596 = _T_594 & _T_552; // @[ifu_bp_ctl.scala 435:57]
  wire  _T_597 = io_dec_bp_dec_tlu_br0_r_pkt_bits_way & dec_tlu_error_wb; // @[ifu_bp_ctl.scala 435:98]
  wire  btb_wr_en_way1 = _T_596 | _T_597; // @[ifu_bp_ctl.scala 435:80]
  wire [7:0] btb_wr_addr = dec_tlu_error_wb ? io_exu_bp_exu_i0_br_index_r : io_exu_bp_exu_mp_index; // @[ifu_bp_ctl.scala 438:24]
  wire  _T_613 = btb_wr_addr == 8'h0; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_614 = _T_613 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_616 = btb_wr_addr == 8'h1; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_617 = _T_616 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_619 = btb_wr_addr == 8'h2; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_620 = _T_619 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_622 = btb_wr_addr == 8'h3; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_623 = _T_622 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_625 = btb_wr_addr == 8'h4; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_626 = _T_625 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_628 = btb_wr_addr == 8'h5; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_629 = _T_628 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_631 = btb_wr_addr == 8'h6; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_632 = _T_631 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_634 = btb_wr_addr == 8'h7; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_635 = _T_634 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_637 = btb_wr_addr == 8'h8; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_638 = _T_637 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_640 = btb_wr_addr == 8'h9; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_641 = _T_640 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_643 = btb_wr_addr == 8'ha; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_644 = _T_643 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_646 = btb_wr_addr == 8'hb; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_647 = _T_646 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_649 = btb_wr_addr == 8'hc; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_650 = _T_649 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_652 = btb_wr_addr == 8'hd; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_653 = _T_652 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_655 = btb_wr_addr == 8'he; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_656 = _T_655 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_658 = btb_wr_addr == 8'hf; // @[ifu_bp_ctl.scala 442:98]
  wire  _T_659 = _T_658 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 442:107]
  wire  _T_662 = _T_613 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_665 = _T_616 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_668 = _T_619 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_671 = _T_622 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_674 = _T_625 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_677 = _T_628 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_680 = _T_631 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_683 = _T_634 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_686 = _T_637 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_689 = _T_640 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_692 = _T_643 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_695 = _T_646 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_698 = _T_649 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_701 = _T_652 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_704 = _T_655 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_707 = _T_658 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 443:107]
  wire  _T_967 = mp_hashed == 8'h0; // @[ifu_bp_ctl.scala 516:109]
  wire  _T_972 = br0_hashed_wb == 8'h0; // @[ifu_bp_ctl.scala 517:109]
  wire  _T_990 = bht_wr_en2[0] & _T_972; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_998 = br0_hashed_wb == 8'h1; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_999 = bht_wr_en2[0] & _T_998; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1007 = br0_hashed_wb == 8'h2; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1008 = bht_wr_en2[0] & _T_1007; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1016 = br0_hashed_wb == 8'h3; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1017 = bht_wr_en2[0] & _T_1016; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1025 = br0_hashed_wb == 8'h4; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1026 = bht_wr_en2[0] & _T_1025; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1034 = br0_hashed_wb == 8'h5; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1035 = bht_wr_en2[0] & _T_1034; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1043 = br0_hashed_wb == 8'h6; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1044 = bht_wr_en2[0] & _T_1043; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1052 = br0_hashed_wb == 8'h7; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1053 = bht_wr_en2[0] & _T_1052; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1061 = br0_hashed_wb == 8'h8; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1062 = bht_wr_en2[0] & _T_1061; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1070 = br0_hashed_wb == 8'h9; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1071 = bht_wr_en2[0] & _T_1070; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1079 = br0_hashed_wb == 8'ha; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1080 = bht_wr_en2[0] & _T_1079; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1088 = br0_hashed_wb == 8'hb; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1089 = bht_wr_en2[0] & _T_1088; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1097 = br0_hashed_wb == 8'hc; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1098 = bht_wr_en2[0] & _T_1097; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1106 = br0_hashed_wb == 8'hd; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1107 = bht_wr_en2[0] & _T_1106; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1115 = br0_hashed_wb == 8'he; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1116 = bht_wr_en2[0] & _T_1115; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1124 = br0_hashed_wb == 8'hf; // @[ifu_bp_ctl.scala 522:74]
  wire  _T_1125 = bht_wr_en2[0] & _T_1124; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1134 = bht_wr_en2[1] & _T_972; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1143 = bht_wr_en2[1] & _T_998; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1152 = bht_wr_en2[1] & _T_1007; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1161 = bht_wr_en2[1] & _T_1016; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1170 = bht_wr_en2[1] & _T_1025; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1179 = bht_wr_en2[1] & _T_1034; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1188 = bht_wr_en2[1] & _T_1043; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1197 = bht_wr_en2[1] & _T_1052; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1206 = bht_wr_en2[1] & _T_1061; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1215 = bht_wr_en2[1] & _T_1070; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1224 = bht_wr_en2[1] & _T_1079; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1233 = bht_wr_en2[1] & _T_1088; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1242 = bht_wr_en2[1] & _T_1097; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1251 = bht_wr_en2[1] & _T_1106; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1260 = bht_wr_en2[1] & _T_1115; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1269 = bht_wr_en2[1] & _T_1124; // @[ifu_bp_ctl.scala 522:23]
  wire  _T_1278 = bht_wr_en0[0] & _T_967; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_0 = _T_1278 | _T_990; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1294 = mp_hashed == 8'h1; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1295 = bht_wr_en0[0] & _T_1294; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_1 = _T_1295 | _T_999; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1311 = mp_hashed == 8'h2; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1312 = bht_wr_en0[0] & _T_1311; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_2 = _T_1312 | _T_1008; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1328 = mp_hashed == 8'h3; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1329 = bht_wr_en0[0] & _T_1328; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_3 = _T_1329 | _T_1017; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1345 = mp_hashed == 8'h4; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1346 = bht_wr_en0[0] & _T_1345; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_4 = _T_1346 | _T_1026; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1362 = mp_hashed == 8'h5; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1363 = bht_wr_en0[0] & _T_1362; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_5 = _T_1363 | _T_1035; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1379 = mp_hashed == 8'h6; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1380 = bht_wr_en0[0] & _T_1379; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_6 = _T_1380 | _T_1044; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1396 = mp_hashed == 8'h7; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1397 = bht_wr_en0[0] & _T_1396; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_7 = _T_1397 | _T_1053; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1413 = mp_hashed == 8'h8; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1414 = bht_wr_en0[0] & _T_1413; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_8 = _T_1414 | _T_1062; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1430 = mp_hashed == 8'h9; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1431 = bht_wr_en0[0] & _T_1430; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_9 = _T_1431 | _T_1071; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1447 = mp_hashed == 8'ha; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1448 = bht_wr_en0[0] & _T_1447; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_10 = _T_1448 | _T_1080; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1464 = mp_hashed == 8'hb; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1465 = bht_wr_en0[0] & _T_1464; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_11 = _T_1465 | _T_1089; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1481 = mp_hashed == 8'hc; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1482 = bht_wr_en0[0] & _T_1481; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_12 = _T_1482 | _T_1098; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1498 = mp_hashed == 8'hd; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1499 = bht_wr_en0[0] & _T_1498; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_13 = _T_1499 | _T_1107; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1515 = mp_hashed == 8'he; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1516 = bht_wr_en0[0] & _T_1515; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_14 = _T_1516 | _T_1116; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1532 = mp_hashed == 8'hf; // @[ifu_bp_ctl.scala 530:97]
  wire  _T_1533 = bht_wr_en0[0] & _T_1532; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_0_0_15 = _T_1533 | _T_1125; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1550 = bht_wr_en0[1] & _T_967; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_0 = _T_1550 | _T_1134; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1567 = bht_wr_en0[1] & _T_1294; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_1 = _T_1567 | _T_1143; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1584 = bht_wr_en0[1] & _T_1311; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_2 = _T_1584 | _T_1152; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1601 = bht_wr_en0[1] & _T_1328; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_3 = _T_1601 | _T_1161; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1618 = bht_wr_en0[1] & _T_1345; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_4 = _T_1618 | _T_1170; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1635 = bht_wr_en0[1] & _T_1362; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_5 = _T_1635 | _T_1179; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1652 = bht_wr_en0[1] & _T_1379; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_6 = _T_1652 | _T_1188; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1669 = bht_wr_en0[1] & _T_1396; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_7 = _T_1669 | _T_1197; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1686 = bht_wr_en0[1] & _T_1413; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_8 = _T_1686 | _T_1206; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1703 = bht_wr_en0[1] & _T_1430; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_9 = _T_1703 | _T_1215; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1720 = bht_wr_en0[1] & _T_1447; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_10 = _T_1720 | _T_1224; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1737 = bht_wr_en0[1] & _T_1464; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_11 = _T_1737 | _T_1233; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1754 = bht_wr_en0[1] & _T_1481; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_12 = _T_1754 | _T_1242; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1771 = bht_wr_en0[1] & _T_1498; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_13 = _T_1771 | _T_1251; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1788 = bht_wr_en0[1] & _T_1515; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_14 = _T_1788 | _T_1260; // @[ifu_bp_ctl.scala 530:223]
  wire  _T_1805 = bht_wr_en0[1] & _T_1532; // @[ifu_bp_ctl.scala 530:45]
  wire  bht_bank_sel_1_0_15 = _T_1805 | _T_1269; // @[ifu_bp_ctl.scala 530:223]
  rvclkhdr rvclkhdr ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  rvclkhdr rvclkhdr_12 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en)
  );
  rvclkhdr rvclkhdr_13 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en)
  );
  rvclkhdr rvclkhdr_14 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en)
  );
  rvclkhdr rvclkhdr_15 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en)
  );
  rvclkhdr rvclkhdr_16 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en)
  );
  rvclkhdr rvclkhdr_17 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en)
  );
  rvclkhdr rvclkhdr_18 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en)
  );
  rvclkhdr rvclkhdr_19 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_19_io_clk),
    .io_en(rvclkhdr_19_io_en)
  );
  rvclkhdr rvclkhdr_20 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_20_io_clk),
    .io_en(rvclkhdr_20_io_en)
  );
  rvclkhdr rvclkhdr_21 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_21_io_clk),
    .io_en(rvclkhdr_21_io_en)
  );
  rvclkhdr rvclkhdr_22 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_22_io_clk),
    .io_en(rvclkhdr_22_io_en)
  );
  rvclkhdr rvclkhdr_23 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_23_io_clk),
    .io_en(rvclkhdr_23_io_en)
  );
  rvclkhdr rvclkhdr_24 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_24_io_clk),
    .io_en(rvclkhdr_24_io_en)
  );
  rvclkhdr rvclkhdr_25 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_25_io_clk),
    .io_en(rvclkhdr_25_io_en)
  );
  rvclkhdr rvclkhdr_26 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_26_io_clk),
    .io_en(rvclkhdr_26_io_en)
  );
  rvclkhdr rvclkhdr_27 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_27_io_clk),
    .io_en(rvclkhdr_27_io_en)
  );
  rvclkhdr rvclkhdr_28 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_28_io_clk),
    .io_en(rvclkhdr_28_io_en)
  );
  rvclkhdr rvclkhdr_29 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_29_io_clk),
    .io_en(rvclkhdr_29_io_en)
  );
  rvclkhdr rvclkhdr_30 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_30_io_clk),
    .io_en(rvclkhdr_30_io_en)
  );
  rvclkhdr rvclkhdr_31 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_31_io_clk),
    .io_en(rvclkhdr_31_io_en)
  );
  rvclkhdr rvclkhdr_32 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_32_io_clk),
    .io_en(rvclkhdr_32_io_en)
  );
  rvclkhdr rvclkhdr_33 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_33_io_clk),
    .io_en(rvclkhdr_33_io_en)
  );
  rvclkhdr rvclkhdr_34 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_34_io_clk),
    .io_en(rvclkhdr_34_io_en)
  );
  rvclkhdr rvclkhdr_35 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_35_io_clk),
    .io_en(rvclkhdr_35_io_en)
  );
  rvclkhdr rvclkhdr_36 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_36_io_clk),
    .io_en(rvclkhdr_36_io_en)
  );
  rvclkhdr rvclkhdr_37 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_37_io_clk),
    .io_en(rvclkhdr_37_io_en)
  );
  rvclkhdr rvclkhdr_38 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_38_io_clk),
    .io_en(rvclkhdr_38_io_en)
  );
  rvclkhdr rvclkhdr_39 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_39_io_clk),
    .io_en(rvclkhdr_39_io_en)
  );
  rvclkhdr rvclkhdr_40 ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_40_io_clk),
    .io_en(rvclkhdr_40_io_en)
  );
  rvclkhdr rvclkhdr_41 ( // @[lib.scala 343:22]
    .io_clk(rvclkhdr_41_io_clk),
    .io_en(rvclkhdr_41_io_en)
  );
  rvclkhdr rvclkhdr_42 ( // @[lib.scala 343:22]
    .io_clk(rvclkhdr_42_io_clk),
    .io_en(rvclkhdr_42_io_en)
  );
  assign io_ifu_bp_hit_taken_f = _T_231 & _T_232; // @[ifu_bp_ctl.scala 277:25]
  assign io_ifu_bp_btb_target_f = _T_443 | _T_453; // @[ifu_bp_ctl.scala 374:26]
  assign io_ifu_bp_inst_mask_f = _T_268 | _T_269; // @[ifu_bp_ctl.scala 302:25]
  assign io_ifu_bp_fghr_f = fghr; // @[ifu_bp_ctl.scala 345:20]
  assign io_ifu_bp_way_f = tag_match_vway1_expanded_f | _T_154; // @[ifu_bp_ctl.scala 254:19]
  assign io_ifu_bp_ret_f = {_T_288,_T_294}; // @[ifu_bp_ctl.scala 351:19]
  assign io_ifu_bp_hist1_f = bht_force_taken_f | _T_273; // @[ifu_bp_ctl.scala 346:21]
  assign io_ifu_bp_hist0_f = {bht_vbank1_rd_data_f[0],bht_vbank0_rd_data_f[0]}; // @[ifu_bp_ctl.scala 347:21]
  assign io_ifu_bp_pc4_f = {_T_279,_T_282}; // @[ifu_bp_ctl.scala 348:19]
  assign io_ifu_bp_valid_f = vwayhit_f & _T_353; // @[ifu_bp_ctl.scala 350:21]
  assign io_ifu_bp_poffset_f = btb_sel_data_f[15:4]; // @[ifu_bp_ctl.scala 362:23]
  assign io_ifu_bp_fa_index_f_0 = 4'h0; // @[ifu_bp_ctl.scala 35:24]
  assign io_ifu_bp_fa_index_f_1 = 4'h0; // @[ifu_bp_ctl.scala 35:24]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_io_en = io_ifc_fetch_req_f | exu_mp_valid; // @[lib.scala 402:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_1_io_en = ~rs_hold; // @[lib.scala 402:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_2_io_en = rs_push | rs_pop; // @[lib.scala 402:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_3_io_en = rs_push | rs_pop; // @[lib.scala 402:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_4_io_en = rs_push | rs_pop; // @[lib.scala 402:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_5_io_en = rs_push | rs_pop; // @[lib.scala 402:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_6_io_en = rs_push | rs_pop; // @[lib.scala 402:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_7_io_en = rs_push | rs_pop; // @[lib.scala 402:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_8_io_en = _T_494 & io_ifu_bp_hit_taken_f; // @[lib.scala 402:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_9_io_en = _T_613 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_10_io_en = _T_616 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_11_io_en = _T_619 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_12_io_en = _T_622 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_13_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_13_io_en = _T_625 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_14_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_14_io_en = _T_628 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_15_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_15_io_en = _T_631 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_16_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_16_io_en = _T_634 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_17_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_17_io_en = _T_637 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_18_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_18_io_en = _T_640 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_19_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_19_io_en = _T_643 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_20_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_20_io_en = _T_646 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_21_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_21_io_en = _T_649 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_22_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_22_io_en = _T_652 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_23_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_23_io_en = _T_655 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_24_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_24_io_en = _T_658 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_25_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_25_io_en = _T_613 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_26_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_26_io_en = _T_616 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_27_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_27_io_en = _T_619 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_28_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_28_io_en = _T_622 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_29_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_29_io_en = _T_625 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_30_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_30_io_en = _T_628 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_31_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_31_io_en = _T_631 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_32_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_32_io_en = _T_634 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_33_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_33_io_en = _T_637 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_34_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_34_io_en = _T_640 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_35_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_35_io_en = _T_643 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_36_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_36_io_en = _T_646 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_37_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_37_io_en = _T_649 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_38_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_38_io_en = _T_652 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_39_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_39_io_en = _T_655 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_40_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_40_io_en = _T_658 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_41_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_41_io_en = bht_wr_en0[0] | bht_wr_en2[0]; // @[lib.scala 345:16]
  assign rvclkhdr_42_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_42_io_en = bht_wr_en0[1] | bht_wr_en2[1]; // @[lib.scala 345:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  leak_one_f_d1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_0 = _RAND_1[21:0];
  _RAND_2 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_1 = _RAND_2[21:0];
  _RAND_3 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_2 = _RAND_3[21:0];
  _RAND_4 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_3 = _RAND_4[21:0];
  _RAND_5 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_4 = _RAND_5[21:0];
  _RAND_6 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_5 = _RAND_6[21:0];
  _RAND_7 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_6 = _RAND_7[21:0];
  _RAND_8 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_7 = _RAND_8[21:0];
  _RAND_9 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_8 = _RAND_9[21:0];
  _RAND_10 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_9 = _RAND_10[21:0];
  _RAND_11 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_10 = _RAND_11[21:0];
  _RAND_12 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_11 = _RAND_12[21:0];
  _RAND_13 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_12 = _RAND_13[21:0];
  _RAND_14 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_13 = _RAND_14[21:0];
  _RAND_15 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_14 = _RAND_15[21:0];
  _RAND_16 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_15 = _RAND_16[21:0];
  _RAND_17 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_0 = _RAND_17[21:0];
  _RAND_18 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_1 = _RAND_18[21:0];
  _RAND_19 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_2 = _RAND_19[21:0];
  _RAND_20 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_3 = _RAND_20[21:0];
  _RAND_21 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_4 = _RAND_21[21:0];
  _RAND_22 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_5 = _RAND_22[21:0];
  _RAND_23 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_6 = _RAND_23[21:0];
  _RAND_24 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_7 = _RAND_24[21:0];
  _RAND_25 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_8 = _RAND_25[21:0];
  _RAND_26 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_9 = _RAND_26[21:0];
  _RAND_27 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_10 = _RAND_27[21:0];
  _RAND_28 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_11 = _RAND_28[21:0];
  _RAND_29 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_12 = _RAND_29[21:0];
  _RAND_30 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_13 = _RAND_30[21:0];
  _RAND_31 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_14 = _RAND_31[21:0];
  _RAND_32 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_15 = _RAND_32[21:0];
  _RAND_33 = {1{`RANDOM}};
  fghr = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_0 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_1 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_2 = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_3 = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_4 = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_5 = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_6 = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_7 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_8 = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_9 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_10 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_11 = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_12 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_13 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_14 = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_15 = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_0 = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_1 = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_2 = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_3 = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_4 = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_5 = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_6 = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_7 = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_8 = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_9 = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_10 = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_11 = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_12 = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_13 = _RAND_63[1:0];
  _RAND_64 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_14 = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_15 = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  exu_mp_way_f = _RAND_66[0:0];
  _RAND_67 = {8{`RANDOM}};
  _T_210 = _RAND_67[255:0];
  _RAND_68 = {1{`RANDOM}};
  exu_flush_final_d1 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  ifc_fetch_adder_prior = _RAND_69[29:0];
  _RAND_70 = {1{`RANDOM}};
  rets_out_0 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  rets_out_1 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  rets_out_2 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  rets_out_3 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  rets_out_4 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  rets_out_5 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  rets_out_6 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  rets_out_7 = _RAND_77[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    leak_one_f_d1 = 1'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_0 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_1 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_2 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_3 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_4 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_5 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_6 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_7 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_8 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_9 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_10 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_11 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_12 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_13 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_14 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way0_out_15 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_0 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_1 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_2 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_3 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_4 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_5 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_6 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_7 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_8 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_9 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_10 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_11 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_12 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_13 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_14 = 22'h0;
  end
  if (reset) begin
    btb_bank0_rd_data_way1_out_15 = 22'h0;
  end
  if (reset) begin
    fghr = 8'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_0 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_1 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_2 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_3 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_4 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_5 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_6 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_7 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_8 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_9 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_10 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_11 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_12 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_13 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_14 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_1_15 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_0 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_1 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_2 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_3 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_4 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_5 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_6 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_7 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_8 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_9 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_10 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_11 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_12 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_13 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_14 = 2'h0;
  end
  if (reset) begin
    bht_bank_rd_data_out_0_15 = 2'h0;
  end
  if (reset) begin
    exu_mp_way_f = 1'h0;
  end
  if (reset) begin
    _T_210 = 256'h0;
  end
  if (reset) begin
    exu_flush_final_d1 = 1'h0;
  end
  if (reset) begin
    ifc_fetch_adder_prior = 30'h0;
  end
  if (reset) begin
    rets_out_0 = 32'h0;
  end
  if (reset) begin
    rets_out_1 = 32'h0;
  end
  if (reset) begin
    rets_out_2 = 32'h0;
  end
  if (reset) begin
    rets_out_3 = 32'h0;
  end
  if (reset) begin
    rets_out_4 = 32'h0;
  end
  if (reset) begin
    rets_out_5 = 32'h0;
  end
  if (reset) begin
    rets_out_6 = 32'h0;
  end
  if (reset) begin
    rets_out_7 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      leak_one_f_d1 <= 1'h0;
    end else if (_T_337) begin
      leak_one_f_d1 <= leak_one_f;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_0 <= 22'h0;
    end else if (_T_614) begin
      btb_bank0_rd_data_way0_out_0 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_1 <= 22'h0;
    end else if (_T_617) begin
      btb_bank0_rd_data_way0_out_1 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_2 <= 22'h0;
    end else if (_T_620) begin
      btb_bank0_rd_data_way0_out_2 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_3 <= 22'h0;
    end else if (_T_623) begin
      btb_bank0_rd_data_way0_out_3 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_4 <= 22'h0;
    end else if (_T_626) begin
      btb_bank0_rd_data_way0_out_4 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_5 <= 22'h0;
    end else if (_T_629) begin
      btb_bank0_rd_data_way0_out_5 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_6 <= 22'h0;
    end else if (_T_632) begin
      btb_bank0_rd_data_way0_out_6 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_7 <= 22'h0;
    end else if (_T_635) begin
      btb_bank0_rd_data_way0_out_7 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_8 <= 22'h0;
    end else if (_T_638) begin
      btb_bank0_rd_data_way0_out_8 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_9 <= 22'h0;
    end else if (_T_641) begin
      btb_bank0_rd_data_way0_out_9 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_10 <= 22'h0;
    end else if (_T_644) begin
      btb_bank0_rd_data_way0_out_10 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_11 <= 22'h0;
    end else if (_T_647) begin
      btb_bank0_rd_data_way0_out_11 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_12 <= 22'h0;
    end else if (_T_650) begin
      btb_bank0_rd_data_way0_out_12 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_13 <= 22'h0;
    end else if (_T_653) begin
      btb_bank0_rd_data_way0_out_13 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_14 <= 22'h0;
    end else if (_T_656) begin
      btb_bank0_rd_data_way0_out_14 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_15 <= 22'h0;
    end else if (_T_659) begin
      btb_bank0_rd_data_way0_out_15 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_0 <= 22'h0;
    end else if (_T_662) begin
      btb_bank0_rd_data_way1_out_0 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_1 <= 22'h0;
    end else if (_T_665) begin
      btb_bank0_rd_data_way1_out_1 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_2 <= 22'h0;
    end else if (_T_668) begin
      btb_bank0_rd_data_way1_out_2 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_3 <= 22'h0;
    end else if (_T_671) begin
      btb_bank0_rd_data_way1_out_3 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_4 <= 22'h0;
    end else if (_T_674) begin
      btb_bank0_rd_data_way1_out_4 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_5 <= 22'h0;
    end else if (_T_677) begin
      btb_bank0_rd_data_way1_out_5 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_6 <= 22'h0;
    end else if (_T_680) begin
      btb_bank0_rd_data_way1_out_6 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_7 <= 22'h0;
    end else if (_T_683) begin
      btb_bank0_rd_data_way1_out_7 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_8 <= 22'h0;
    end else if (_T_686) begin
      btb_bank0_rd_data_way1_out_8 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_9 <= 22'h0;
    end else if (_T_689) begin
      btb_bank0_rd_data_way1_out_9 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_10 <= 22'h0;
    end else if (_T_692) begin
      btb_bank0_rd_data_way1_out_10 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_11 <= 22'h0;
    end else if (_T_695) begin
      btb_bank0_rd_data_way1_out_11 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_12 <= 22'h0;
    end else if (_T_698) begin
      btb_bank0_rd_data_way1_out_12 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_13 <= 22'h0;
    end else if (_T_701) begin
      btb_bank0_rd_data_way1_out_13 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_14 <= 22'h0;
    end else if (_T_704) begin
      btb_bank0_rd_data_way1_out_14 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_15 <= 22'h0;
    end else if (_T_707) begin
      btb_bank0_rd_data_way1_out_15 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      fghr <= 8'h0;
    end else if (_T_349) begin
      fghr <= fghr_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_0 <= 2'h0;
    end else if (bht_bank_sel_1_0_0) begin
      bht_bank_rd_data_out_1_0 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_1 <= 2'h0;
    end else if (bht_bank_sel_1_0_1) begin
      bht_bank_rd_data_out_1_1 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_2 <= 2'h0;
    end else if (bht_bank_sel_1_0_2) begin
      bht_bank_rd_data_out_1_2 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_3 <= 2'h0;
    end else if (bht_bank_sel_1_0_3) begin
      bht_bank_rd_data_out_1_3 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_4 <= 2'h0;
    end else if (bht_bank_sel_1_0_4) begin
      bht_bank_rd_data_out_1_4 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_5 <= 2'h0;
    end else if (bht_bank_sel_1_0_5) begin
      bht_bank_rd_data_out_1_5 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_6 <= 2'h0;
    end else if (bht_bank_sel_1_0_6) begin
      bht_bank_rd_data_out_1_6 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_7 <= 2'h0;
    end else if (bht_bank_sel_1_0_7) begin
      bht_bank_rd_data_out_1_7 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_8 <= 2'h0;
    end else if (bht_bank_sel_1_0_8) begin
      bht_bank_rd_data_out_1_8 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_9 <= 2'h0;
    end else if (bht_bank_sel_1_0_9) begin
      bht_bank_rd_data_out_1_9 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_10 <= 2'h0;
    end else if (bht_bank_sel_1_0_10) begin
      bht_bank_rd_data_out_1_10 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_11 <= 2'h0;
    end else if (bht_bank_sel_1_0_11) begin
      bht_bank_rd_data_out_1_11 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_12 <= 2'h0;
    end else if (bht_bank_sel_1_0_12) begin
      bht_bank_rd_data_out_1_12 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_13 <= 2'h0;
    end else if (bht_bank_sel_1_0_13) begin
      bht_bank_rd_data_out_1_13 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_14 <= 2'h0;
    end else if (bht_bank_sel_1_0_14) begin
      bht_bank_rd_data_out_1_14 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_1_15 <= 2'h0;
    end else if (bht_bank_sel_1_0_15) begin
      bht_bank_rd_data_out_1_15 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_0 <= 2'h0;
    end else if (bht_bank_sel_0_0_0) begin
      bht_bank_rd_data_out_0_0 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_1 <= 2'h0;
    end else if (bht_bank_sel_0_0_1) begin
      bht_bank_rd_data_out_0_1 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_2 <= 2'h0;
    end else if (bht_bank_sel_0_0_2) begin
      bht_bank_rd_data_out_0_2 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_3 <= 2'h0;
    end else if (bht_bank_sel_0_0_3) begin
      bht_bank_rd_data_out_0_3 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_4 <= 2'h0;
    end else if (bht_bank_sel_0_0_4) begin
      bht_bank_rd_data_out_0_4 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_5 <= 2'h0;
    end else if (bht_bank_sel_0_0_5) begin
      bht_bank_rd_data_out_0_5 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_6 <= 2'h0;
    end else if (bht_bank_sel_0_0_6) begin
      bht_bank_rd_data_out_0_6 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_7 <= 2'h0;
    end else if (bht_bank_sel_0_0_7) begin
      bht_bank_rd_data_out_0_7 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_8 <= 2'h0;
    end else if (bht_bank_sel_0_0_8) begin
      bht_bank_rd_data_out_0_8 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_9 <= 2'h0;
    end else if (bht_bank_sel_0_0_9) begin
      bht_bank_rd_data_out_0_9 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_10 <= 2'h0;
    end else if (bht_bank_sel_0_0_10) begin
      bht_bank_rd_data_out_0_10 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_11 <= 2'h0;
    end else if (bht_bank_sel_0_0_11) begin
      bht_bank_rd_data_out_0_11 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_12 <= 2'h0;
    end else if (bht_bank_sel_0_0_12) begin
      bht_bank_rd_data_out_0_12 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_13 <= 2'h0;
    end else if (bht_bank_sel_0_0_13) begin
      bht_bank_rd_data_out_0_13 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_14 <= 2'h0;
    end else if (bht_bank_sel_0_0_14) begin
      bht_bank_rd_data_out_0_14 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bht_bank_rd_data_out_0_15 <= 2'h0;
    end else if (bht_bank_sel_0_0_15) begin
      bht_bank_rd_data_out_0_15 <= io_dec_bp_dec_tlu_br0_r_pkt_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      exu_mp_way_f <= 1'h0;
    end else if (_T_341) begin
      exu_mp_way_f <= io_exu_bp_exu_mp_pkt_bits_way;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_210 <= 256'h0;
    end else if (_T_208) begin
      _T_210 <= btb_lru_b0_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      exu_flush_final_d1 <= 1'h0;
    end else if (_T_345) begin
      exu_flush_final_d1 <= io_exu_flush_final;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ifc_fetch_adder_prior <= 30'h0;
    end else if (_T_385) begin
      ifc_fetch_adder_prior <= io_ifc_fetch_addr_f[30:1];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_0 <= 32'h0;
    end else if (rsenable_0) begin
      rets_out_0 <= rets_in_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_1 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_1 <= rets_in_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_2 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_2 <= rets_in_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_3 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_3 <= rets_in_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_4 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_4 <= rets_in_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_5 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_5 <= rets_in_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_6 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_6 <= rets_in_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rets_out_7 <= 32'h0;
    end else if (rs_push) begin
      rets_out_7 <= rets_out_6;
    end
  end
endmodule
