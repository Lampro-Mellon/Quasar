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
  wire  _T_248 = ~io_ifc_fetch_addr_f[0]; // @[ifu_bp_ctl.scala 292:40]
  wire [9:0] _T_580 = {btb_rd_addr_f,2'h0}; // @[Cat.scala 29:58]
  reg [7:0] fghr; // @[Reg.scala 27:20]
  wire [7:0] bht_rd_addr_hashed_f = _T_580[9:2] ^ fghr; // @[lib.scala 56:35]
  wire  _T_1945 = bht_rd_addr_hashed_f == 8'h0; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1977 = _T_1945 ? bht_bank_rd_data_out_1_0 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_1947 = bht_rd_addr_hashed_f == 8'h1; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1978 = _T_1947 ? bht_bank_rd_data_out_1_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1993 = _T_1977 | _T_1978; // @[Mux.scala 27:72]
  wire  _T_1949 = bht_rd_addr_hashed_f == 8'h2; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1979 = _T_1949 ? bht_bank_rd_data_out_1_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1994 = _T_1993 | _T_1979; // @[Mux.scala 27:72]
  wire  _T_1951 = bht_rd_addr_hashed_f == 8'h3; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1980 = _T_1951 ? bht_bank_rd_data_out_1_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1995 = _T_1994 | _T_1980; // @[Mux.scala 27:72]
  wire  _T_1953 = bht_rd_addr_hashed_f == 8'h4; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_4; // @[Reg.scala 27:20]
  wire [1:0] _T_1981 = _T_1953 ? bht_bank_rd_data_out_1_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1996 = _T_1995 | _T_1981; // @[Mux.scala 27:72]
  wire  _T_1955 = bht_rd_addr_hashed_f == 8'h5; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_5; // @[Reg.scala 27:20]
  wire [1:0] _T_1982 = _T_1955 ? bht_bank_rd_data_out_1_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1997 = _T_1996 | _T_1982; // @[Mux.scala 27:72]
  wire  _T_1957 = bht_rd_addr_hashed_f == 8'h6; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_6; // @[Reg.scala 27:20]
  wire [1:0] _T_1983 = _T_1957 ? bht_bank_rd_data_out_1_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1998 = _T_1997 | _T_1983; // @[Mux.scala 27:72]
  wire  _T_1959 = bht_rd_addr_hashed_f == 8'h7; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_7; // @[Reg.scala 27:20]
  wire [1:0] _T_1984 = _T_1959 ? bht_bank_rd_data_out_1_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1999 = _T_1998 | _T_1984; // @[Mux.scala 27:72]
  wire  _T_1961 = bht_rd_addr_hashed_f == 8'h8; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_8; // @[Reg.scala 27:20]
  wire [1:0] _T_1985 = _T_1961 ? bht_bank_rd_data_out_1_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2000 = _T_1999 | _T_1985; // @[Mux.scala 27:72]
  wire  _T_1963 = bht_rd_addr_hashed_f == 8'h9; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_9; // @[Reg.scala 27:20]
  wire [1:0] _T_1986 = _T_1963 ? bht_bank_rd_data_out_1_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2001 = _T_2000 | _T_1986; // @[Mux.scala 27:72]
  wire  _T_1965 = bht_rd_addr_hashed_f == 8'ha; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_10; // @[Reg.scala 27:20]
  wire [1:0] _T_1987 = _T_1965 ? bht_bank_rd_data_out_1_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2002 = _T_2001 | _T_1987; // @[Mux.scala 27:72]
  wire  _T_1967 = bht_rd_addr_hashed_f == 8'hb; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_11; // @[Reg.scala 27:20]
  wire [1:0] _T_1988 = _T_1967 ? bht_bank_rd_data_out_1_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2003 = _T_2002 | _T_1988; // @[Mux.scala 27:72]
  wire  _T_1969 = bht_rd_addr_hashed_f == 8'hc; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_12; // @[Reg.scala 27:20]
  wire [1:0] _T_1989 = _T_1969 ? bht_bank_rd_data_out_1_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2004 = _T_2003 | _T_1989; // @[Mux.scala 27:72]
  wire  _T_1971 = bht_rd_addr_hashed_f == 8'hd; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_13; // @[Reg.scala 27:20]
  wire [1:0] _T_1990 = _T_1971 ? bht_bank_rd_data_out_1_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2005 = _T_2004 | _T_1990; // @[Mux.scala 27:72]
  wire  _T_1973 = bht_rd_addr_hashed_f == 8'he; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_14; // @[Reg.scala 27:20]
  wire [1:0] _T_1991 = _T_1973 ? bht_bank_rd_data_out_1_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2006 = _T_2005 | _T_1991; // @[Mux.scala 27:72]
  wire  _T_1975 = bht_rd_addr_hashed_f == 8'hf; // @[ifu_bp_ctl.scala 544:79]
  reg [1:0] bht_bank_rd_data_out_1_15; // @[Reg.scala 27:20]
  wire [1:0] _T_1992 = _T_1975 ? bht_bank_rd_data_out_1_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank1_rd_data_f = _T_2006 | _T_1992; // @[Mux.scala 27:72]
  wire [1:0] _T_251 = _T_248 ? bht_bank1_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [9:0] _T_583 = {btb_rd_addr_p1_f,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] bht_rd_addr_hashed_p1_f = _T_583[9:2] ^ fghr; // @[lib.scala 56:35]
  wire  _T_2009 = bht_rd_addr_hashed_p1_f == 8'h0; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_0; // @[Reg.scala 27:20]
  wire [1:0] _T_2041 = _T_2009 ? bht_bank_rd_data_out_0_0 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_2011 = bht_rd_addr_hashed_p1_f == 8'h1; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_1; // @[Reg.scala 27:20]
  wire [1:0] _T_2042 = _T_2011 ? bht_bank_rd_data_out_0_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2057 = _T_2041 | _T_2042; // @[Mux.scala 27:72]
  wire  _T_2013 = bht_rd_addr_hashed_p1_f == 8'h2; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_2; // @[Reg.scala 27:20]
  wire [1:0] _T_2043 = _T_2013 ? bht_bank_rd_data_out_0_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2058 = _T_2057 | _T_2043; // @[Mux.scala 27:72]
  wire  _T_2015 = bht_rd_addr_hashed_p1_f == 8'h3; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_3; // @[Reg.scala 27:20]
  wire [1:0] _T_2044 = _T_2015 ? bht_bank_rd_data_out_0_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2059 = _T_2058 | _T_2044; // @[Mux.scala 27:72]
  wire  _T_2017 = bht_rd_addr_hashed_p1_f == 8'h4; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_4; // @[Reg.scala 27:20]
  wire [1:0] _T_2045 = _T_2017 ? bht_bank_rd_data_out_0_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2060 = _T_2059 | _T_2045; // @[Mux.scala 27:72]
  wire  _T_2019 = bht_rd_addr_hashed_p1_f == 8'h5; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_5; // @[Reg.scala 27:20]
  wire [1:0] _T_2046 = _T_2019 ? bht_bank_rd_data_out_0_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2061 = _T_2060 | _T_2046; // @[Mux.scala 27:72]
  wire  _T_2021 = bht_rd_addr_hashed_p1_f == 8'h6; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_6; // @[Reg.scala 27:20]
  wire [1:0] _T_2047 = _T_2021 ? bht_bank_rd_data_out_0_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2062 = _T_2061 | _T_2047; // @[Mux.scala 27:72]
  wire  _T_2023 = bht_rd_addr_hashed_p1_f == 8'h7; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_7; // @[Reg.scala 27:20]
  wire [1:0] _T_2048 = _T_2023 ? bht_bank_rd_data_out_0_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2063 = _T_2062 | _T_2048; // @[Mux.scala 27:72]
  wire  _T_2025 = bht_rd_addr_hashed_p1_f == 8'h8; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_8; // @[Reg.scala 27:20]
  wire [1:0] _T_2049 = _T_2025 ? bht_bank_rd_data_out_0_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2064 = _T_2063 | _T_2049; // @[Mux.scala 27:72]
  wire  _T_2027 = bht_rd_addr_hashed_p1_f == 8'h9; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_9; // @[Reg.scala 27:20]
  wire [1:0] _T_2050 = _T_2027 ? bht_bank_rd_data_out_0_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2065 = _T_2064 | _T_2050; // @[Mux.scala 27:72]
  wire  _T_2029 = bht_rd_addr_hashed_p1_f == 8'ha; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_10; // @[Reg.scala 27:20]
  wire [1:0] _T_2051 = _T_2029 ? bht_bank_rd_data_out_0_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2066 = _T_2065 | _T_2051; // @[Mux.scala 27:72]
  wire  _T_2031 = bht_rd_addr_hashed_p1_f == 8'hb; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_11; // @[Reg.scala 27:20]
  wire [1:0] _T_2052 = _T_2031 ? bht_bank_rd_data_out_0_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2067 = _T_2066 | _T_2052; // @[Mux.scala 27:72]
  wire  _T_2033 = bht_rd_addr_hashed_p1_f == 8'hc; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_12; // @[Reg.scala 27:20]
  wire [1:0] _T_2053 = _T_2033 ? bht_bank_rd_data_out_0_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2068 = _T_2067 | _T_2053; // @[Mux.scala 27:72]
  wire  _T_2035 = bht_rd_addr_hashed_p1_f == 8'hd; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_13; // @[Reg.scala 27:20]
  wire [1:0] _T_2054 = _T_2035 ? bht_bank_rd_data_out_0_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2069 = _T_2068 | _T_2054; // @[Mux.scala 27:72]
  wire  _T_2037 = bht_rd_addr_hashed_p1_f == 8'he; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_14; // @[Reg.scala 27:20]
  wire [1:0] _T_2055 = _T_2037 ? bht_bank_rd_data_out_0_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2070 = _T_2069 | _T_2055; // @[Mux.scala 27:72]
  wire  _T_2039 = bht_rd_addr_hashed_p1_f == 8'hf; // @[ifu_bp_ctl.scala 545:85]
  reg [1:0] bht_bank_rd_data_out_0_15; // @[Reg.scala 27:20]
  wire [1:0] _T_2056 = _T_2039 ? bht_bank_rd_data_out_0_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank0_rd_data_p1_f = _T_2070 | _T_2056; // @[Mux.scala 27:72]
  wire [1:0] _T_252 = io_ifc_fetch_addr_f[0] ? bht_bank0_rd_data_p1_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_vbank1_rd_data_f = _T_251 | _T_252; // @[Mux.scala 27:72]
  wire  _T_707 = btb_rd_addr_f == 8'h0; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_0; // @[Reg.scala 27:20]
  wire [21:0] _T_739 = _T_707 ? btb_bank0_rd_data_way0_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire  _T_709 = btb_rd_addr_f == 8'h1; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_1; // @[Reg.scala 27:20]
  wire [21:0] _T_740 = _T_709 ? btb_bank0_rd_data_way0_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_755 = _T_739 | _T_740; // @[Mux.scala 27:72]
  wire  _T_711 = btb_rd_addr_f == 8'h2; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_2; // @[Reg.scala 27:20]
  wire [21:0] _T_741 = _T_711 ? btb_bank0_rd_data_way0_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_756 = _T_755 | _T_741; // @[Mux.scala 27:72]
  wire  _T_713 = btb_rd_addr_f == 8'h3; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_3; // @[Reg.scala 27:20]
  wire [21:0] _T_742 = _T_713 ? btb_bank0_rd_data_way0_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_757 = _T_756 | _T_742; // @[Mux.scala 27:72]
  wire  _T_715 = btb_rd_addr_f == 8'h4; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_4; // @[Reg.scala 27:20]
  wire [21:0] _T_743 = _T_715 ? btb_bank0_rd_data_way0_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_758 = _T_757 | _T_743; // @[Mux.scala 27:72]
  wire  _T_717 = btb_rd_addr_f == 8'h5; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_5; // @[Reg.scala 27:20]
  wire [21:0] _T_744 = _T_717 ? btb_bank0_rd_data_way0_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_759 = _T_758 | _T_744; // @[Mux.scala 27:72]
  wire  _T_719 = btb_rd_addr_f == 8'h6; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_6; // @[Reg.scala 27:20]
  wire [21:0] _T_745 = _T_719 ? btb_bank0_rd_data_way0_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_760 = _T_759 | _T_745; // @[Mux.scala 27:72]
  wire  _T_721 = btb_rd_addr_f == 8'h7; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_7; // @[Reg.scala 27:20]
  wire [21:0] _T_746 = _T_721 ? btb_bank0_rd_data_way0_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_761 = _T_760 | _T_746; // @[Mux.scala 27:72]
  wire  _T_723 = btb_rd_addr_f == 8'h8; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_8; // @[Reg.scala 27:20]
  wire [21:0] _T_747 = _T_723 ? btb_bank0_rd_data_way0_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_762 = _T_761 | _T_747; // @[Mux.scala 27:72]
  wire  _T_725 = btb_rd_addr_f == 8'h9; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_9; // @[Reg.scala 27:20]
  wire [21:0] _T_748 = _T_725 ? btb_bank0_rd_data_way0_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_763 = _T_762 | _T_748; // @[Mux.scala 27:72]
  wire  _T_727 = btb_rd_addr_f == 8'ha; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_10; // @[Reg.scala 27:20]
  wire [21:0] _T_749 = _T_727 ? btb_bank0_rd_data_way0_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_764 = _T_763 | _T_749; // @[Mux.scala 27:72]
  wire  _T_729 = btb_rd_addr_f == 8'hb; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_11; // @[Reg.scala 27:20]
  wire [21:0] _T_750 = _T_729 ? btb_bank0_rd_data_way0_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_765 = _T_764 | _T_750; // @[Mux.scala 27:72]
  wire  _T_731 = btb_rd_addr_f == 8'hc; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_12; // @[Reg.scala 27:20]
  wire [21:0] _T_751 = _T_731 ? btb_bank0_rd_data_way0_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_766 = _T_765 | _T_751; // @[Mux.scala 27:72]
  wire  _T_733 = btb_rd_addr_f == 8'hd; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_13; // @[Reg.scala 27:20]
  wire [21:0] _T_752 = _T_733 ? btb_bank0_rd_data_way0_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_767 = _T_766 | _T_752; // @[Mux.scala 27:72]
  wire  _T_735 = btb_rd_addr_f == 8'he; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_14; // @[Reg.scala 27:20]
  wire [21:0] _T_753 = _T_735 ? btb_bank0_rd_data_way0_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_768 = _T_767 | _T_753; // @[Mux.scala 27:72]
  wire  _T_737 = btb_rd_addr_f == 8'hf; // @[ifu_bp_ctl.scala 448:80]
  reg [21:0] btb_bank0_rd_data_way0_out_15; // @[Reg.scala 27:20]
  wire [21:0] _T_754 = _T_737 ? btb_bank0_rd_data_way0_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way0_f = _T_768 | _T_754; // @[Mux.scala 27:72]
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
  reg [21:0] btb_bank0_rd_data_way1_out_0; // @[Reg.scala 27:20]
  wire [21:0] _T_803 = _T_707 ? btb_bank0_rd_data_way1_out_0 : 22'h0; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_1; // @[Reg.scala 27:20]
  wire [21:0] _T_804 = _T_709 ? btb_bank0_rd_data_way1_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_819 = _T_803 | _T_804; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_2; // @[Reg.scala 27:20]
  wire [21:0] _T_805 = _T_711 ? btb_bank0_rd_data_way1_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_820 = _T_819 | _T_805; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_3; // @[Reg.scala 27:20]
  wire [21:0] _T_806 = _T_713 ? btb_bank0_rd_data_way1_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_821 = _T_820 | _T_806; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_4; // @[Reg.scala 27:20]
  wire [21:0] _T_807 = _T_715 ? btb_bank0_rd_data_way1_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_822 = _T_821 | _T_807; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_5; // @[Reg.scala 27:20]
  wire [21:0] _T_808 = _T_717 ? btb_bank0_rd_data_way1_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_823 = _T_822 | _T_808; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_6; // @[Reg.scala 27:20]
  wire [21:0] _T_809 = _T_719 ? btb_bank0_rd_data_way1_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_824 = _T_823 | _T_809; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_7; // @[Reg.scala 27:20]
  wire [21:0] _T_810 = _T_721 ? btb_bank0_rd_data_way1_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_825 = _T_824 | _T_810; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_8; // @[Reg.scala 27:20]
  wire [21:0] _T_811 = _T_723 ? btb_bank0_rd_data_way1_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_826 = _T_825 | _T_811; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_9; // @[Reg.scala 27:20]
  wire [21:0] _T_812 = _T_725 ? btb_bank0_rd_data_way1_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_827 = _T_826 | _T_812; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_10; // @[Reg.scala 27:20]
  wire [21:0] _T_813 = _T_727 ? btb_bank0_rd_data_way1_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_828 = _T_827 | _T_813; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_11; // @[Reg.scala 27:20]
  wire [21:0] _T_814 = _T_729 ? btb_bank0_rd_data_way1_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_829 = _T_828 | _T_814; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_12; // @[Reg.scala 27:20]
  wire [21:0] _T_815 = _T_731 ? btb_bank0_rd_data_way1_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_830 = _T_829 | _T_815; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_13; // @[Reg.scala 27:20]
  wire [21:0] _T_816 = _T_733 ? btb_bank0_rd_data_way1_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_831 = _T_830 | _T_816; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_14; // @[Reg.scala 27:20]
  wire [21:0] _T_817 = _T_735 ? btb_bank0_rd_data_way1_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_832 = _T_831 | _T_817; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_15; // @[Reg.scala 27:20]
  wire [21:0] _T_818 = _T_737 ? btb_bank0_rd_data_way1_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way1_f = _T_832 | _T_818; // @[Mux.scala 27:72]
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
  wire [1:0] wayhit_f = tag_match_way0_expanded_f | tag_match_way1_expanded_f; // @[ifu_bp_ctl.scala 172:41]
  wire [1:0] _T_605 = _T_248 ? wayhit_f : 2'h0; // @[Mux.scala 27:72]
  wire  _T_835 = btb_rd_addr_p1_f == 8'h0; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_867 = _T_835 ? btb_bank0_rd_data_way0_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire  _T_837 = btb_rd_addr_p1_f == 8'h1; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_868 = _T_837 ? btb_bank0_rd_data_way0_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_883 = _T_867 | _T_868; // @[Mux.scala 27:72]
  wire  _T_839 = btb_rd_addr_p1_f == 8'h2; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_869 = _T_839 ? btb_bank0_rd_data_way0_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_884 = _T_883 | _T_869; // @[Mux.scala 27:72]
  wire  _T_841 = btb_rd_addr_p1_f == 8'h3; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_870 = _T_841 ? btb_bank0_rd_data_way0_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_885 = _T_884 | _T_870; // @[Mux.scala 27:72]
  wire  _T_843 = btb_rd_addr_p1_f == 8'h4; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_871 = _T_843 ? btb_bank0_rd_data_way0_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_886 = _T_885 | _T_871; // @[Mux.scala 27:72]
  wire  _T_845 = btb_rd_addr_p1_f == 8'h5; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_872 = _T_845 ? btb_bank0_rd_data_way0_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_887 = _T_886 | _T_872; // @[Mux.scala 27:72]
  wire  _T_847 = btb_rd_addr_p1_f == 8'h6; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_873 = _T_847 ? btb_bank0_rd_data_way0_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_888 = _T_887 | _T_873; // @[Mux.scala 27:72]
  wire  _T_849 = btb_rd_addr_p1_f == 8'h7; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_874 = _T_849 ? btb_bank0_rd_data_way0_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_889 = _T_888 | _T_874; // @[Mux.scala 27:72]
  wire  _T_851 = btb_rd_addr_p1_f == 8'h8; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_875 = _T_851 ? btb_bank0_rd_data_way0_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_890 = _T_889 | _T_875; // @[Mux.scala 27:72]
  wire  _T_853 = btb_rd_addr_p1_f == 8'h9; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_876 = _T_853 ? btb_bank0_rd_data_way0_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_891 = _T_890 | _T_876; // @[Mux.scala 27:72]
  wire  _T_855 = btb_rd_addr_p1_f == 8'ha; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_877 = _T_855 ? btb_bank0_rd_data_way0_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_892 = _T_891 | _T_877; // @[Mux.scala 27:72]
  wire  _T_857 = btb_rd_addr_p1_f == 8'hb; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_878 = _T_857 ? btb_bank0_rd_data_way0_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_893 = _T_892 | _T_878; // @[Mux.scala 27:72]
  wire  _T_859 = btb_rd_addr_p1_f == 8'hc; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_879 = _T_859 ? btb_bank0_rd_data_way0_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_894 = _T_893 | _T_879; // @[Mux.scala 27:72]
  wire  _T_861 = btb_rd_addr_p1_f == 8'hd; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_880 = _T_861 ? btb_bank0_rd_data_way0_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_895 = _T_894 | _T_880; // @[Mux.scala 27:72]
  wire  _T_863 = btb_rd_addr_p1_f == 8'he; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_881 = _T_863 ? btb_bank0_rd_data_way0_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_896 = _T_895 | _T_881; // @[Mux.scala 27:72]
  wire  _T_865 = btb_rd_addr_p1_f == 8'hf; // @[ifu_bp_ctl.scala 452:86]
  wire [21:0] _T_882 = _T_865 ? btb_bank0_rd_data_way0_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way0_p1_f = _T_896 | _T_882; // @[Mux.scala 27:72]
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
  wire [21:0] _T_931 = _T_835 ? btb_bank0_rd_data_way1_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_932 = _T_837 ? btb_bank0_rd_data_way1_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_947 = _T_931 | _T_932; // @[Mux.scala 27:72]
  wire [21:0] _T_933 = _T_839 ? btb_bank0_rd_data_way1_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_948 = _T_947 | _T_933; // @[Mux.scala 27:72]
  wire [21:0] _T_934 = _T_841 ? btb_bank0_rd_data_way1_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_949 = _T_948 | _T_934; // @[Mux.scala 27:72]
  wire [21:0] _T_935 = _T_843 ? btb_bank0_rd_data_way1_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_950 = _T_949 | _T_935; // @[Mux.scala 27:72]
  wire [21:0] _T_936 = _T_845 ? btb_bank0_rd_data_way1_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_951 = _T_950 | _T_936; // @[Mux.scala 27:72]
  wire [21:0] _T_937 = _T_847 ? btb_bank0_rd_data_way1_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_952 = _T_951 | _T_937; // @[Mux.scala 27:72]
  wire [21:0] _T_938 = _T_849 ? btb_bank0_rd_data_way1_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_953 = _T_952 | _T_938; // @[Mux.scala 27:72]
  wire [21:0] _T_939 = _T_851 ? btb_bank0_rd_data_way1_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_954 = _T_953 | _T_939; // @[Mux.scala 27:72]
  wire [21:0] _T_940 = _T_853 ? btb_bank0_rd_data_way1_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_955 = _T_954 | _T_940; // @[Mux.scala 27:72]
  wire [21:0] _T_941 = _T_855 ? btb_bank0_rd_data_way1_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_956 = _T_955 | _T_941; // @[Mux.scala 27:72]
  wire [21:0] _T_942 = _T_857 ? btb_bank0_rd_data_way1_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_957 = _T_956 | _T_942; // @[Mux.scala 27:72]
  wire [21:0] _T_943 = _T_859 ? btb_bank0_rd_data_way1_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_958 = _T_957 | _T_943; // @[Mux.scala 27:72]
  wire [21:0] _T_944 = _T_861 ? btb_bank0_rd_data_way1_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_959 = _T_958 | _T_944; // @[Mux.scala 27:72]
  wire [21:0] _T_945 = _T_863 ? btb_bank0_rd_data_way1_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_960 = _T_959 | _T_945; // @[Mux.scala 27:72]
  wire [21:0] _T_946 = _T_865 ? btb_bank0_rd_data_way1_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way1_p1_f = _T_960 | _T_946; // @[Mux.scala 27:72]
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
  wire [1:0] wayhit_p1_f = tag_match_way0_expanded_p1_f | tag_match_way1_expanded_p1_f; // @[ifu_bp_ctl.scala 174:47]
  wire [1:0] _T_604 = {wayhit_p1_f[0],wayhit_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_606 = io_ifc_fetch_addr_f[0] ? _T_604 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_607 = _T_605 | _T_606; // @[Mux.scala 27:72]
  wire  eoc_near = &io_ifc_fetch_addr_f[4:2]; // @[ifu_bp_ctl.scala 257:64]
  wire  _T_210 = ~eoc_near; // @[ifu_bp_ctl.scala 259:15]
  wire [1:0] _T_212 = ~io_ifc_fetch_addr_f[1:0]; // @[ifu_bp_ctl.scala 259:28]
  wire  _T_213 = |_T_212; // @[ifu_bp_ctl.scala 259:58]
  wire  eoc_mask = _T_210 | _T_213; // @[ifu_bp_ctl.scala 259:25]
  wire [1:0] _T_609 = {eoc_mask,1'h1}; // @[Cat.scala 29:58]
  wire [1:0] vwayhit_f = _T_607 & _T_609; // @[ifu_bp_ctl.scala 441:71]
  wire  _T_258 = bht_vbank1_rd_data_f[1] & vwayhit_f[1]; // @[ifu_bp_ctl.scala 296:69]
  wire [1:0] _T_1913 = _T_1945 ? bht_bank_rd_data_out_0_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1914 = _T_1947 ? bht_bank_rd_data_out_0_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1929 = _T_1913 | _T_1914; // @[Mux.scala 27:72]
  wire [1:0] _T_1915 = _T_1949 ? bht_bank_rd_data_out_0_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1930 = _T_1929 | _T_1915; // @[Mux.scala 27:72]
  wire [1:0] _T_1916 = _T_1951 ? bht_bank_rd_data_out_0_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1931 = _T_1930 | _T_1916; // @[Mux.scala 27:72]
  wire [1:0] _T_1917 = _T_1953 ? bht_bank_rd_data_out_0_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1932 = _T_1931 | _T_1917; // @[Mux.scala 27:72]
  wire [1:0] _T_1918 = _T_1955 ? bht_bank_rd_data_out_0_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1933 = _T_1932 | _T_1918; // @[Mux.scala 27:72]
  wire [1:0] _T_1919 = _T_1957 ? bht_bank_rd_data_out_0_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1934 = _T_1933 | _T_1919; // @[Mux.scala 27:72]
  wire [1:0] _T_1920 = _T_1959 ? bht_bank_rd_data_out_0_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1935 = _T_1934 | _T_1920; // @[Mux.scala 27:72]
  wire [1:0] _T_1921 = _T_1961 ? bht_bank_rd_data_out_0_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1936 = _T_1935 | _T_1921; // @[Mux.scala 27:72]
  wire [1:0] _T_1922 = _T_1963 ? bht_bank_rd_data_out_0_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1937 = _T_1936 | _T_1922; // @[Mux.scala 27:72]
  wire [1:0] _T_1923 = _T_1965 ? bht_bank_rd_data_out_0_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1938 = _T_1937 | _T_1923; // @[Mux.scala 27:72]
  wire [1:0] _T_1924 = _T_1967 ? bht_bank_rd_data_out_0_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1939 = _T_1938 | _T_1924; // @[Mux.scala 27:72]
  wire [1:0] _T_1925 = _T_1969 ? bht_bank_rd_data_out_0_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1940 = _T_1939 | _T_1925; // @[Mux.scala 27:72]
  wire [1:0] _T_1926 = _T_1971 ? bht_bank_rd_data_out_0_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1941 = _T_1940 | _T_1926; // @[Mux.scala 27:72]
  wire [1:0] _T_1927 = _T_1973 ? bht_bank_rd_data_out_0_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1942 = _T_1941 | _T_1927; // @[Mux.scala 27:72]
  wire [1:0] _T_1928 = _T_1975 ? bht_bank_rd_data_out_0_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank0_rd_data_f = _T_1942 | _T_1928; // @[Mux.scala 27:72]
  wire [1:0] _T_243 = _T_248 ? bht_bank0_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_244 = io_ifc_fetch_addr_f[0] ? bht_bank1_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_vbank0_rd_data_f = _T_243 | _T_244; // @[Mux.scala 27:72]
  wire  _T_263 = bht_vbank0_rd_data_f[1] & vwayhit_f[0]; // @[ifu_bp_ctl.scala 297:72]
  wire [1:0] bht_dir_f = {_T_258,_T_263}; // @[Cat.scala 29:58]
  wire  _T_14 = ~bht_dir_f[0]; // @[ifu_bp_ctl.scala 119:23]
  wire [1:0] btb_sel_f = {_T_14,bht_dir_f[0]}; // @[Cat.scala 29:58]
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
  wire [1:0] _T_151 = ~vwayhit_f; // @[ifu_bp_ctl.scala 194:44]
  reg  exu_mp_way_f; // @[Reg.scala 27:20]
  wire [255:0] fetch_wrindex_dec = 256'h1 << btb_rd_addr_f; // @[ifu_bp_ctl.scala 213:31]
  reg [255:0] _T_208; // @[Reg.scala 27:20]
  wire [15:0] btb_lru_b0_f = _T_208[15:0]; // @[ifu_bp_ctl.scala 251:16]
  wire [255:0] _GEN_78 = {{240'd0}, btb_lru_b0_f}; // @[ifu_bp_ctl.scala 239:78]
  wire [255:0] _T_179 = fetch_wrindex_dec & _GEN_78; // @[ifu_bp_ctl.scala 239:78]
  wire  _T_180 = |_T_179; // @[ifu_bp_ctl.scala 239:94]
  wire  btb_lru_rd_f = fetch_mp_collision_f ? exu_mp_way_f : _T_180; // @[ifu_bp_ctl.scala 239:25]
  wire [1:0] _T_186 = {btb_lru_rd_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_190 = _T_248 ? _T_186 : 2'h0; // @[Mux.scala 27:72]
  wire [255:0] fetch_wrindex_p1_dec = 256'h1 << btb_rd_addr_p1_f; // @[ifu_bp_ctl.scala 216:34]
  wire [255:0] _T_182 = fetch_wrindex_p1_dec & _GEN_78; // @[ifu_bp_ctl.scala 241:87]
  wire  _T_183 = |_T_182; // @[ifu_bp_ctl.scala 241:103]
  wire  btb_lru_rd_p1_f = fetch_mp_collision_p1_f ? exu_mp_way_f : _T_183; // @[ifu_bp_ctl.scala 241:28]
  wire [1:0] _T_189 = {btb_lru_rd_p1_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_191 = io_ifc_fetch_addr_f[0] ? _T_189 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] btb_vlru_rd_f = _T_190 | _T_191; // @[Mux.scala 27:72]
  wire [1:0] _T_152 = _T_151 & btb_vlru_rd_f; // @[ifu_bp_ctl.scala 194:55]
  wire [1:0] _T_202 = _T_248 ? tag_match_way1_expanded_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_201 = {tag_match_way1_expanded_p1_f[0],tag_match_way1_expanded_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_203 = io_ifc_fetch_addr_f[0] ? _T_201 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] tag_match_vway1_expanded_f = _T_202 | _T_203; // @[Mux.scala 27:72]
  wire [255:0] mp_wrindex_dec = 256'h1 << io_exu_bp_exu_mp_index; // @[ifu_bp_ctl.scala 210:28]
  wire [15:0] _T_155 = exu_mp_valid ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [255:0] _GEN_80 = {{240'd0}, _T_155}; // @[ifu_bp_ctl.scala 219:36]
  wire [255:0] mp_wrlru_b0 = mp_wrindex_dec & _GEN_80; // @[ifu_bp_ctl.scala 219:36]
  wire  _T_158 = vwayhit_f[0] | vwayhit_f[1]; // @[ifu_bp_ctl.scala 222:42]
  wire  _T_159 = _T_158 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 222:58]
  wire  lru_update_valid_f = _T_159 & _T; // @[ifu_bp_ctl.scala 222:79]
  wire [15:0] _T_162 = lru_update_valid_f ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [255:0] _GEN_81 = {{240'd0}, _T_162}; // @[ifu_bp_ctl.scala 224:42]
  wire [255:0] fetch_wrlru_b0 = fetch_wrindex_dec & _GEN_81; // @[ifu_bp_ctl.scala 224:42]
  wire [255:0] fetch_wrlru_p1_b0 = fetch_wrindex_p1_dec & _GEN_81; // @[ifu_bp_ctl.scala 225:48]
  wire [255:0] _T_165 = ~mp_wrlru_b0; // @[ifu_bp_ctl.scala 227:25]
  wire [255:0] _T_166 = ~fetch_wrlru_b0; // @[ifu_bp_ctl.scala 227:40]
  wire [255:0] btb_lru_b0_hold = _T_165 & _T_166; // @[ifu_bp_ctl.scala 227:38]
  wire  _T_168 = ~io_exu_bp_exu_mp_pkt_bits_way; // @[ifu_bp_ctl.scala 234:39]
  wire [255:0] _T_171 = _T_168 ? mp_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_172 = tag_match_way0_f ? fetch_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_173 = tag_match_way0_p1_f ? fetch_wrlru_p1_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_174 = _T_171 | _T_172; // @[Mux.scala 27:72]
  wire [255:0] _T_175 = _T_174 | _T_173; // @[Mux.scala 27:72]
  wire [255:0] _T_177 = btb_lru_b0_hold & _GEN_78; // @[ifu_bp_ctl.scala 236:73]
  wire [255:0] btb_lru_b0_ns = _T_175 | _T_177; // @[ifu_bp_ctl.scala 236:55]
  wire  _T_206 = io_ifc_fetch_req_f | exu_mp_valid; // @[ifu_bp_ctl.scala 251:60]
  wire [1:0] hist1_raw = {bht_vbank1_rd_data_f[1],bht_vbank0_rd_data_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_225 = vwayhit_f & hist1_raw; // @[ifu_bp_ctl.scala 276:39]
  wire  _T_226 = |_T_225; // @[ifu_bp_ctl.scala 276:52]
  wire  _T_227 = _T_226 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 276:56]
  wire  _T_228 = ~leak_one_f_d1; // @[ifu_bp_ctl.scala 276:79]
  wire  _T_229 = _T_227 & _T_228; // @[ifu_bp_ctl.scala 276:77]
  wire  _T_230 = ~io_dec_bp_dec_tlu_bpred_disable; // @[ifu_bp_ctl.scala 276:96]
  wire  _T_266 = io_ifu_bp_hit_taken_f & btb_sel_f[1]; // @[ifu_bp_ctl.scala 300:51]
  wire  _T_267 = ~io_ifu_bp_hit_taken_f; // @[ifu_bp_ctl.scala 300:69]
  wire [1:0] num_valids = vwayhit_f[1] + vwayhit_f[0]; // @[ifu_bp_ctl.scala 317:35]
  wire [1:0] _T_295 = btb_sel_f & bht_dir_f; // @[ifu_bp_ctl.scala 320:28]
  wire  final_h = |_T_295; // @[ifu_bp_ctl.scala 320:41]
  wire  _T_296 = num_valids == 2'h2; // @[ifu_bp_ctl.scala 324:41]
  wire [7:0] _T_300 = {fghr[5:0],1'h0,final_h}; // @[Cat.scala 29:58]
  wire  _T_301 = num_valids == 2'h1; // @[ifu_bp_ctl.scala 325:41]
  wire [7:0] _T_304 = {fghr[6:0],final_h}; // @[Cat.scala 29:58]
  wire  _T_305 = num_valids == 2'h0; // @[ifu_bp_ctl.scala 326:41]
  wire [7:0] _T_308 = _T_296 ? _T_300 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_309 = _T_301 ? _T_304 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_310 = _T_305 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_311 = _T_308 | _T_309; // @[Mux.scala 27:72]
  wire [7:0] merged_ghr = _T_311 | _T_310; // @[Mux.scala 27:72]
  reg  exu_flush_final_d1; // @[Reg.scala 27:20]
  wire  _T_314 = ~exu_flush_final_d1; // @[ifu_bp_ctl.scala 335:27]
  wire  _T_315 = _T_314 & io_ifc_fetch_req_f; // @[ifu_bp_ctl.scala 335:47]
  wire  _T_316 = _T_315 & io_ic_hit_f; // @[ifu_bp_ctl.scala 335:70]
  wire  _T_318 = _T_316 & _T_228; // @[ifu_bp_ctl.scala 335:84]
  wire  _T_321 = io_ifc_fetch_req_f & io_ic_hit_f; // @[ifu_bp_ctl.scala 336:70]
  wire  _T_323 = _T_321 & _T_228; // @[ifu_bp_ctl.scala 336:84]
  wire  _T_324 = ~_T_323; // @[ifu_bp_ctl.scala 336:49]
  wire  _T_325 = _T_314 & _T_324; // @[ifu_bp_ctl.scala 336:47]
  wire [7:0] _T_327 = exu_flush_final_d1 ? io_exu_bp_exu_mp_fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_328 = _T_318 ? merged_ghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_329 = _T_325 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_330 = _T_327 | _T_328; // @[Mux.scala 27:72]
  wire [7:0] fghr_ns = _T_330 | _T_329; // @[Mux.scala 27:72]
  wire  _T_334 = leak_one_f ^ leak_one_f_d1; // @[lib.scala 436:21]
  wire  _T_335 = |_T_334; // @[lib.scala 436:29]
  wire  _T_338 = io_exu_bp_exu_mp_pkt_bits_way ^ exu_mp_way_f; // @[lib.scala 436:21]
  wire  _T_339 = |_T_338; // @[lib.scala 436:29]
  wire  _T_342 = io_exu_flush_final ^ exu_flush_final_d1; // @[lib.scala 458:21]
  wire  _T_343 = |_T_342; // @[lib.scala 458:29]
  wire [7:0] _T_346 = fghr_ns ^ fghr; // @[lib.scala 436:21]
  wire  _T_347 = |_T_346; // @[lib.scala 436:29]
  wire [1:0] _T_350 = io_dec_bp_dec_tlu_bpred_disable ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_351 = ~_T_350; // @[ifu_bp_ctl.scala 348:36]
  wire  _T_550 = ~dec_tlu_error_wb; // @[ifu_bp_ctl.scala 395:35]
  wire  btb_valid = exu_mp_valid & _T_550; // @[ifu_bp_ctl.scala 395:32]
  wire  _T_551 = io_exu_bp_exu_mp_pkt_bits_pcall | io_exu_bp_exu_mp_pkt_bits_pja; // @[ifu_bp_ctl.scala 409:89]
  wire  _T_552 = io_exu_bp_exu_mp_pkt_bits_pret | io_exu_bp_exu_mp_pkt_bits_pja; // @[ifu_bp_ctl.scala 409:113]
  wire [21:0] btb_wr_data = {io_exu_bp_exu_mp_btag,io_exu_bp_exu_mp_pkt_bits_toffset,io_exu_bp_exu_mp_pkt_bits_pc4,io_exu_bp_exu_mp_pkt_bits_boffset,_T_551,_T_552,btb_valid}; // @[Cat.scala 29:58]
  wire  _T_558 = exu_mp_valid & io_exu_bp_exu_mp_pkt_bits_ataken; // @[ifu_bp_ctl.scala 410:41]
  wire  _T_559 = ~io_exu_bp_exu_mp_pkt_valid; // @[ifu_bp_ctl.scala 410:59]
  wire  exu_mp_valid_write = _T_558 & _T_559; // @[ifu_bp_ctl.scala 410:57]
  wire  middle_of_bank = io_exu_bp_exu_mp_pkt_bits_pc4 ^ io_exu_bp_exu_mp_pkt_bits_boffset; // @[ifu_bp_ctl.scala 411:35]
  wire  _T_560 = ~io_exu_bp_exu_mp_pkt_bits_pcall; // @[ifu_bp_ctl.scala 414:43]
  wire  _T_561 = exu_mp_valid & _T_560; // @[ifu_bp_ctl.scala 414:41]
  wire  _T_562 = ~io_exu_bp_exu_mp_pkt_bits_pret; // @[ifu_bp_ctl.scala 414:58]
  wire  _T_563 = _T_561 & _T_562; // @[ifu_bp_ctl.scala 414:56]
  wire  _T_564 = ~io_exu_bp_exu_mp_pkt_bits_pja; // @[ifu_bp_ctl.scala 414:72]
  wire  _T_565 = _T_563 & _T_564; // @[ifu_bp_ctl.scala 414:70]
  wire [1:0] _T_567 = _T_565 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_568 = ~middle_of_bank; // @[ifu_bp_ctl.scala 414:106]
  wire [1:0] _T_569 = {middle_of_bank,_T_568}; // @[Cat.scala 29:58]
  wire [1:0] bht_wr_en0 = _T_567 & _T_569; // @[ifu_bp_ctl.scala 414:84]
  wire [1:0] _T_571 = io_dec_bp_dec_tlu_br0_r_pkt_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_572 = ~io_dec_bp_dec_tlu_br0_r_pkt_bits_middle; // @[ifu_bp_ctl.scala 415:75]
  wire [1:0] _T_573 = {io_dec_bp_dec_tlu_br0_r_pkt_bits_middle,_T_572}; // @[Cat.scala 29:58]
  wire [1:0] bht_wr_en2 = _T_571 & _T_573; // @[ifu_bp_ctl.scala 415:46]
  wire [9:0] _T_574 = {io_exu_bp_exu_mp_index,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] mp_hashed = _T_574[9:2] ^ io_exu_bp_exu_mp_eghr; // @[lib.scala 56:35]
  wire [9:0] _T_577 = {io_exu_bp_exu_i0_br_index_r,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] br0_hashed_wb = _T_577[9:2] ^ io_exu_bp_exu_i0_br_fghr_r; // @[lib.scala 56:35]
  wire  _T_587 = _T_168 & exu_mp_valid_write; // @[ifu_bp_ctl.scala 434:39]
  wire  _T_589 = _T_587 & _T_550; // @[ifu_bp_ctl.scala 434:60]
  wire  _T_590 = ~io_dec_bp_dec_tlu_br0_r_pkt_bits_way; // @[ifu_bp_ctl.scala 434:87]
  wire  _T_591 = _T_590 & dec_tlu_error_wb; // @[ifu_bp_ctl.scala 434:104]
  wire  btb_wr_en_way0 = _T_589 | _T_591; // @[ifu_bp_ctl.scala 434:83]
  wire  _T_592 = io_exu_bp_exu_mp_pkt_bits_way & exu_mp_valid_write; // @[ifu_bp_ctl.scala 435:36]
  wire  _T_594 = _T_592 & _T_550; // @[ifu_bp_ctl.scala 435:57]
  wire  _T_595 = io_dec_bp_dec_tlu_br0_r_pkt_bits_way & dec_tlu_error_wb; // @[ifu_bp_ctl.scala 435:98]
  wire  btb_wr_en_way1 = _T_594 | _T_595; // @[ifu_bp_ctl.scala 435:80]
  wire [7:0] btb_wr_addr = dec_tlu_error_wb ? io_exu_bp_exu_i0_br_index_r : io_exu_bp_exu_mp_index; // @[ifu_bp_ctl.scala 438:24]
  wire  _T_611 = btb_wr_addr == 8'h0; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_612 = _T_611 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_614 = btb_wr_addr == 8'h1; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_615 = _T_614 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_617 = btb_wr_addr == 8'h2; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_618 = _T_617 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_620 = btb_wr_addr == 8'h3; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_621 = _T_620 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_623 = btb_wr_addr == 8'h4; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_624 = _T_623 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_626 = btb_wr_addr == 8'h5; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_627 = _T_626 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_629 = btb_wr_addr == 8'h6; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_630 = _T_629 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_632 = btb_wr_addr == 8'h7; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_633 = _T_632 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_635 = btb_wr_addr == 8'h8; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_636 = _T_635 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_638 = btb_wr_addr == 8'h9; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_639 = _T_638 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_641 = btb_wr_addr == 8'ha; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_642 = _T_641 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_644 = btb_wr_addr == 8'hb; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_645 = _T_644 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_647 = btb_wr_addr == 8'hc; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_648 = _T_647 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_650 = btb_wr_addr == 8'hd; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_651 = _T_650 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_653 = btb_wr_addr == 8'he; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_654 = _T_653 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_656 = btb_wr_addr == 8'hf; // @[ifu_bp_ctl.scala 445:98]
  wire  _T_657 = _T_656 & btb_wr_en_way0; // @[ifu_bp_ctl.scala 445:107]
  wire  _T_660 = _T_611 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_663 = _T_614 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_666 = _T_617 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_669 = _T_620 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_672 = _T_623 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_675 = _T_626 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_678 = _T_629 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_681 = _T_632 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_684 = _T_635 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_687 = _T_638 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_690 = _T_641 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_693 = _T_644 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_696 = _T_647 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_699 = _T_650 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_702 = _T_653 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_705 = _T_656 & btb_wr_en_way1; // @[ifu_bp_ctl.scala 446:107]
  wire  _T_965 = mp_hashed == 8'h0; // @[ifu_bp_ctl.scala 519:109]
  wire  _T_970 = br0_hashed_wb == 8'h0; // @[ifu_bp_ctl.scala 520:109]
  wire  _T_988 = bht_wr_en2[0] & _T_970; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_996 = br0_hashed_wb == 8'h1; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_997 = bht_wr_en2[0] & _T_996; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1005 = br0_hashed_wb == 8'h2; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1006 = bht_wr_en2[0] & _T_1005; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1014 = br0_hashed_wb == 8'h3; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1015 = bht_wr_en2[0] & _T_1014; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1023 = br0_hashed_wb == 8'h4; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1024 = bht_wr_en2[0] & _T_1023; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1032 = br0_hashed_wb == 8'h5; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1033 = bht_wr_en2[0] & _T_1032; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1041 = br0_hashed_wb == 8'h6; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1042 = bht_wr_en2[0] & _T_1041; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1050 = br0_hashed_wb == 8'h7; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1051 = bht_wr_en2[0] & _T_1050; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1059 = br0_hashed_wb == 8'h8; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1060 = bht_wr_en2[0] & _T_1059; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1068 = br0_hashed_wb == 8'h9; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1069 = bht_wr_en2[0] & _T_1068; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1077 = br0_hashed_wb == 8'ha; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1078 = bht_wr_en2[0] & _T_1077; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1086 = br0_hashed_wb == 8'hb; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1087 = bht_wr_en2[0] & _T_1086; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1095 = br0_hashed_wb == 8'hc; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1096 = bht_wr_en2[0] & _T_1095; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1104 = br0_hashed_wb == 8'hd; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1105 = bht_wr_en2[0] & _T_1104; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1113 = br0_hashed_wb == 8'he; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1114 = bht_wr_en2[0] & _T_1113; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1122 = br0_hashed_wb == 8'hf; // @[ifu_bp_ctl.scala 525:74]
  wire  _T_1123 = bht_wr_en2[0] & _T_1122; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1132 = bht_wr_en2[1] & _T_970; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1141 = bht_wr_en2[1] & _T_996; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1150 = bht_wr_en2[1] & _T_1005; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1159 = bht_wr_en2[1] & _T_1014; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1168 = bht_wr_en2[1] & _T_1023; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1177 = bht_wr_en2[1] & _T_1032; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1186 = bht_wr_en2[1] & _T_1041; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1195 = bht_wr_en2[1] & _T_1050; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1204 = bht_wr_en2[1] & _T_1059; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1213 = bht_wr_en2[1] & _T_1068; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1222 = bht_wr_en2[1] & _T_1077; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1231 = bht_wr_en2[1] & _T_1086; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1240 = bht_wr_en2[1] & _T_1095; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1249 = bht_wr_en2[1] & _T_1104; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1258 = bht_wr_en2[1] & _T_1113; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1267 = bht_wr_en2[1] & _T_1122; // @[ifu_bp_ctl.scala 525:23]
  wire  _T_1276 = bht_wr_en0[0] & _T_965; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_0 = _T_1276 | _T_988; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1292 = mp_hashed == 8'h1; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1293 = bht_wr_en0[0] & _T_1292; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_1 = _T_1293 | _T_997; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1309 = mp_hashed == 8'h2; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1310 = bht_wr_en0[0] & _T_1309; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_2 = _T_1310 | _T_1006; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1326 = mp_hashed == 8'h3; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1327 = bht_wr_en0[0] & _T_1326; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_3 = _T_1327 | _T_1015; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1343 = mp_hashed == 8'h4; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1344 = bht_wr_en0[0] & _T_1343; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_4 = _T_1344 | _T_1024; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1360 = mp_hashed == 8'h5; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1361 = bht_wr_en0[0] & _T_1360; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_5 = _T_1361 | _T_1033; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1377 = mp_hashed == 8'h6; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1378 = bht_wr_en0[0] & _T_1377; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_6 = _T_1378 | _T_1042; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1394 = mp_hashed == 8'h7; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1395 = bht_wr_en0[0] & _T_1394; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_7 = _T_1395 | _T_1051; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1411 = mp_hashed == 8'h8; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1412 = bht_wr_en0[0] & _T_1411; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_8 = _T_1412 | _T_1060; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1428 = mp_hashed == 8'h9; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1429 = bht_wr_en0[0] & _T_1428; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_9 = _T_1429 | _T_1069; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1445 = mp_hashed == 8'ha; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1446 = bht_wr_en0[0] & _T_1445; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_10 = _T_1446 | _T_1078; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1462 = mp_hashed == 8'hb; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1463 = bht_wr_en0[0] & _T_1462; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_11 = _T_1463 | _T_1087; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1479 = mp_hashed == 8'hc; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1480 = bht_wr_en0[0] & _T_1479; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_12 = _T_1480 | _T_1096; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1496 = mp_hashed == 8'hd; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1497 = bht_wr_en0[0] & _T_1496; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_13 = _T_1497 | _T_1105; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1513 = mp_hashed == 8'he; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1514 = bht_wr_en0[0] & _T_1513; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_14 = _T_1514 | _T_1114; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1530 = mp_hashed == 8'hf; // @[ifu_bp_ctl.scala 533:97]
  wire  _T_1531 = bht_wr_en0[0] & _T_1530; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_0_0_15 = _T_1531 | _T_1123; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1548 = bht_wr_en0[1] & _T_965; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_0 = _T_1548 | _T_1132; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1565 = bht_wr_en0[1] & _T_1292; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_1 = _T_1565 | _T_1141; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1582 = bht_wr_en0[1] & _T_1309; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_2 = _T_1582 | _T_1150; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1599 = bht_wr_en0[1] & _T_1326; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_3 = _T_1599 | _T_1159; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1616 = bht_wr_en0[1] & _T_1343; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_4 = _T_1616 | _T_1168; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1633 = bht_wr_en0[1] & _T_1360; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_5 = _T_1633 | _T_1177; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1650 = bht_wr_en0[1] & _T_1377; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_6 = _T_1650 | _T_1186; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1667 = bht_wr_en0[1] & _T_1394; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_7 = _T_1667 | _T_1195; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1684 = bht_wr_en0[1] & _T_1411; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_8 = _T_1684 | _T_1204; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1701 = bht_wr_en0[1] & _T_1428; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_9 = _T_1701 | _T_1213; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1718 = bht_wr_en0[1] & _T_1445; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_10 = _T_1718 | _T_1222; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1735 = bht_wr_en0[1] & _T_1462; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_11 = _T_1735 | _T_1231; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1752 = bht_wr_en0[1] & _T_1479; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_12 = _T_1752 | _T_1240; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1769 = bht_wr_en0[1] & _T_1496; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_13 = _T_1769 | _T_1249; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1786 = bht_wr_en0[1] & _T_1513; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_14 = _T_1786 | _T_1258; // @[ifu_bp_ctl.scala 533:223]
  wire  _T_1803 = bht_wr_en0[1] & _T_1530; // @[ifu_bp_ctl.scala 533:45]
  wire  bht_bank_sel_1_0_15 = _T_1803 | _T_1267; // @[ifu_bp_ctl.scala 533:223]
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
  assign io_ifu_bp_hit_taken_f = _T_229 & _T_230; // @[ifu_bp_ctl.scala 276:25]
  assign io_ifu_bp_btb_target_f = 31'h0; // @[ifu_bp_ctl.scala 373:26]
  assign io_ifu_bp_inst_mask_f = _T_266 | _T_267; // @[ifu_bp_ctl.scala 300:25]
  assign io_ifu_bp_fghr_f = fghr; // @[ifu_bp_ctl.scala 343:20]
  assign io_ifu_bp_way_f = tag_match_vway1_expanded_f | _T_152; // @[ifu_bp_ctl.scala 253:19]
  assign io_ifu_bp_ret_f = 2'h0; // @[ifu_bp_ctl.scala 349:19]
  assign io_ifu_bp_hist1_f = {bht_vbank1_rd_data_f[1],bht_vbank0_rd_data_f[1]}; // @[ifu_bp_ctl.scala 344:21]
  assign io_ifu_bp_hist0_f = {bht_vbank1_rd_data_f[0],bht_vbank0_rd_data_f[0]}; // @[ifu_bp_ctl.scala 345:21]
  assign io_ifu_bp_pc4_f = 2'h0; // @[ifu_bp_ctl.scala 346:19]
  assign io_ifu_bp_valid_f = vwayhit_f & _T_351; // @[ifu_bp_ctl.scala 348:21]
  assign io_ifu_bp_poffset_f = 12'h0; // @[ifu_bp_ctl.scala 361:23]
  assign io_ifu_bp_fa_index_f_0 = 4'h0; // @[ifu_bp_ctl.scala 35:24]
  assign io_ifu_bp_fa_index_f_1 = 4'h0; // @[ifu_bp_ctl.scala 35:24]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_io_en = io_ifc_fetch_req_f | exu_mp_valid; // @[lib.scala 402:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_1_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_2_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_3_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_4_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_5_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_6_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_7_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_8_io_en = 1'h0; // @[lib.scala 402:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_9_io_en = _T_611 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_10_io_en = _T_614 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_11_io_en = _T_617 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_12_io_en = _T_620 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_13_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_13_io_en = _T_623 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_14_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_14_io_en = _T_626 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_15_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_15_io_en = _T_629 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_16_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_16_io_en = _T_632 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_17_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_17_io_en = _T_635 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_18_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_18_io_en = _T_638 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_19_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_19_io_en = _T_641 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_20_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_20_io_en = _T_644 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_21_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_21_io_en = _T_647 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_22_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_22_io_en = _T_650 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_23_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_23_io_en = _T_653 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_24_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_24_io_en = _T_656 & btb_wr_en_way0; // @[lib.scala 402:17]
  assign rvclkhdr_25_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_25_io_en = _T_611 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_26_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_26_io_en = _T_614 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_27_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_27_io_en = _T_617 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_28_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_28_io_en = _T_620 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_29_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_29_io_en = _T_623 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_30_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_30_io_en = _T_626 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_31_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_31_io_en = _T_629 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_32_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_32_io_en = _T_632 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_33_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_33_io_en = _T_635 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_34_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_34_io_en = _T_638 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_35_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_35_io_en = _T_641 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_36_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_36_io_en = _T_644 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_37_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_37_io_en = _T_647 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_38_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_38_io_en = _T_650 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_39_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_39_io_en = _T_653 & btb_wr_en_way1; // @[lib.scala 402:17]
  assign rvclkhdr_40_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_40_io_en = _T_656 & btb_wr_en_way1; // @[lib.scala 402:17]
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
  fghr = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_0 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_1 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_2 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_3 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_4 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_5 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_6 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_7 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_8 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_9 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_10 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_11 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_12 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_13 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_14 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_15 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_0 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_1 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_2 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_3 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_4 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_5 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_6 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_7 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_8 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_9 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_10 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_11 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_12 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_13 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_14 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_15 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_0 = _RAND_34[21:0];
  _RAND_35 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_1 = _RAND_35[21:0];
  _RAND_36 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_2 = _RAND_36[21:0];
  _RAND_37 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_3 = _RAND_37[21:0];
  _RAND_38 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_4 = _RAND_38[21:0];
  _RAND_39 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_5 = _RAND_39[21:0];
  _RAND_40 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_6 = _RAND_40[21:0];
  _RAND_41 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_7 = _RAND_41[21:0];
  _RAND_42 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_8 = _RAND_42[21:0];
  _RAND_43 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_9 = _RAND_43[21:0];
  _RAND_44 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_10 = _RAND_44[21:0];
  _RAND_45 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_11 = _RAND_45[21:0];
  _RAND_46 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_12 = _RAND_46[21:0];
  _RAND_47 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_13 = _RAND_47[21:0];
  _RAND_48 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_14 = _RAND_48[21:0];
  _RAND_49 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_15 = _RAND_49[21:0];
  _RAND_50 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_0 = _RAND_50[21:0];
  _RAND_51 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_1 = _RAND_51[21:0];
  _RAND_52 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_2 = _RAND_52[21:0];
  _RAND_53 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_3 = _RAND_53[21:0];
  _RAND_54 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_4 = _RAND_54[21:0];
  _RAND_55 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_5 = _RAND_55[21:0];
  _RAND_56 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_6 = _RAND_56[21:0];
  _RAND_57 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_7 = _RAND_57[21:0];
  _RAND_58 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_8 = _RAND_58[21:0];
  _RAND_59 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_9 = _RAND_59[21:0];
  _RAND_60 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_10 = _RAND_60[21:0];
  _RAND_61 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_11 = _RAND_61[21:0];
  _RAND_62 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_12 = _RAND_62[21:0];
  _RAND_63 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_13 = _RAND_63[21:0];
  _RAND_64 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_14 = _RAND_64[21:0];
  _RAND_65 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_15 = _RAND_65[21:0];
  _RAND_66 = {1{`RANDOM}};
  exu_mp_way_f = _RAND_66[0:0];
  _RAND_67 = {8{`RANDOM}};
  _T_208 = _RAND_67[255:0];
  _RAND_68 = {1{`RANDOM}};
  exu_flush_final_d1 = _RAND_68[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    leak_one_f_d1 = 1'h0;
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
    exu_mp_way_f = 1'h0;
  end
  if (reset) begin
    _T_208 = 256'h0;
  end
  if (reset) begin
    exu_flush_final_d1 = 1'h0;
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
    end else if (_T_335) begin
      leak_one_f_d1 <= leak_one_f;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      fghr <= 8'h0;
    end else if (_T_347) begin
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
      btb_bank0_rd_data_way0_out_0 <= 22'h0;
    end else if (_T_612) begin
      btb_bank0_rd_data_way0_out_0 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_1 <= 22'h0;
    end else if (_T_615) begin
      btb_bank0_rd_data_way0_out_1 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_2 <= 22'h0;
    end else if (_T_618) begin
      btb_bank0_rd_data_way0_out_2 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_3 <= 22'h0;
    end else if (_T_621) begin
      btb_bank0_rd_data_way0_out_3 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_4 <= 22'h0;
    end else if (_T_624) begin
      btb_bank0_rd_data_way0_out_4 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_5 <= 22'h0;
    end else if (_T_627) begin
      btb_bank0_rd_data_way0_out_5 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_6 <= 22'h0;
    end else if (_T_630) begin
      btb_bank0_rd_data_way0_out_6 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_7 <= 22'h0;
    end else if (_T_633) begin
      btb_bank0_rd_data_way0_out_7 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_8 <= 22'h0;
    end else if (_T_636) begin
      btb_bank0_rd_data_way0_out_8 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_9 <= 22'h0;
    end else if (_T_639) begin
      btb_bank0_rd_data_way0_out_9 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_10 <= 22'h0;
    end else if (_T_642) begin
      btb_bank0_rd_data_way0_out_10 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_11 <= 22'h0;
    end else if (_T_645) begin
      btb_bank0_rd_data_way0_out_11 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_12 <= 22'h0;
    end else if (_T_648) begin
      btb_bank0_rd_data_way0_out_12 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_13 <= 22'h0;
    end else if (_T_651) begin
      btb_bank0_rd_data_way0_out_13 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_14 <= 22'h0;
    end else if (_T_654) begin
      btb_bank0_rd_data_way0_out_14 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way0_out_15 <= 22'h0;
    end else if (_T_657) begin
      btb_bank0_rd_data_way0_out_15 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_0 <= 22'h0;
    end else if (_T_660) begin
      btb_bank0_rd_data_way1_out_0 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_1 <= 22'h0;
    end else if (_T_663) begin
      btb_bank0_rd_data_way1_out_1 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_2 <= 22'h0;
    end else if (_T_666) begin
      btb_bank0_rd_data_way1_out_2 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_3 <= 22'h0;
    end else if (_T_669) begin
      btb_bank0_rd_data_way1_out_3 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_4 <= 22'h0;
    end else if (_T_672) begin
      btb_bank0_rd_data_way1_out_4 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_5 <= 22'h0;
    end else if (_T_675) begin
      btb_bank0_rd_data_way1_out_5 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_6 <= 22'h0;
    end else if (_T_678) begin
      btb_bank0_rd_data_way1_out_6 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_7 <= 22'h0;
    end else if (_T_681) begin
      btb_bank0_rd_data_way1_out_7 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_8 <= 22'h0;
    end else if (_T_684) begin
      btb_bank0_rd_data_way1_out_8 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_9 <= 22'h0;
    end else if (_T_687) begin
      btb_bank0_rd_data_way1_out_9 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_10 <= 22'h0;
    end else if (_T_690) begin
      btb_bank0_rd_data_way1_out_10 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_11 <= 22'h0;
    end else if (_T_693) begin
      btb_bank0_rd_data_way1_out_11 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_12 <= 22'h0;
    end else if (_T_696) begin
      btb_bank0_rd_data_way1_out_12 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_13 <= 22'h0;
    end else if (_T_699) begin
      btb_bank0_rd_data_way1_out_13 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_14 <= 22'h0;
    end else if (_T_702) begin
      btb_bank0_rd_data_way1_out_14 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      btb_bank0_rd_data_way1_out_15 <= 22'h0;
    end else if (_T_705) begin
      btb_bank0_rd_data_way1_out_15 <= btb_wr_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      exu_mp_way_f <= 1'h0;
    end else if (_T_339) begin
      exu_mp_way_f <= io_exu_bp_exu_mp_pkt_bits_way;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_208 <= 256'h0;
    end else if (_T_206) begin
      _T_208 <= btb_lru_b0_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      exu_flush_final_d1 <= 1'h0;
    end else if (_T_343) begin
      exu_flush_final_d1 <= io_exu_flush_final;
    end
  end
endmodule
