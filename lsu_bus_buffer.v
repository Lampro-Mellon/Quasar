module rvclkhdr(
  output  io_l1clk,
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
  assign io_l1clk = clkhdr_Q; // @[lib.scala 335:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module lsu_bus_buffer(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_scan_mode,
  output        io_tlu_busbuff_lsu_pmu_bus_trxn,
  output        io_tlu_busbuff_lsu_pmu_bus_misaligned,
  output        io_tlu_busbuff_lsu_pmu_bus_error,
  output        io_tlu_busbuff_lsu_pmu_bus_busy,
  input         io_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  input         io_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  input         io_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  output        io_tlu_busbuff_lsu_imprecise_error_load_any,
  output        io_tlu_busbuff_lsu_imprecise_error_store_any,
  output [31:0] io_tlu_busbuff_lsu_imprecise_error_addr_any,
  output        io_dctl_busbuff_lsu_nonblock_load_valid_m,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_tag_m,
  output        io_dctl_busbuff_lsu_nonblock_load_inv_r,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_inv_tag_r,
  output        io_dctl_busbuff_lsu_nonblock_load_data_valid,
  output        io_dctl_busbuff_lsu_nonblock_load_data_error,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_data_tag,
  output [31:0] io_dctl_busbuff_lsu_nonblock_load_data,
  input         io_dec_tlu_force_halt,
  input         io_lsu_bus_obuf_c1_clken,
  input         io_lsu_busm_clken,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_obuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_busm_clk,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_fast_int,
  input         io_lsu_pkt_m_bits_stack,
  input         io_lsu_pkt_m_bits_by,
  input         io_lsu_pkt_m_bits_half,
  input         io_lsu_pkt_m_bits_word,
  input         io_lsu_pkt_m_bits_dword,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_m_bits_store,
  input         io_lsu_pkt_m_bits_unsign,
  input         io_lsu_pkt_m_bits_dma,
  input         io_lsu_pkt_m_bits_store_data_bypass_d,
  input         io_lsu_pkt_m_bits_load_ldst_bypass_d,
  input         io_lsu_pkt_m_bits_store_data_bypass_m,
  input         io_lsu_pkt_r_valid,
  input         io_lsu_pkt_r_bits_fast_int,
  input         io_lsu_pkt_r_bits_stack,
  input         io_lsu_pkt_r_bits_by,
  input         io_lsu_pkt_r_bits_half,
  input         io_lsu_pkt_r_bits_word,
  input         io_lsu_pkt_r_bits_dword,
  input         io_lsu_pkt_r_bits_load,
  input         io_lsu_pkt_r_bits_store,
  input         io_lsu_pkt_r_bits_unsign,
  input         io_lsu_pkt_r_bits_dma,
  input         io_lsu_pkt_r_bits_store_data_bypass_d,
  input         io_lsu_pkt_r_bits_load_ldst_bypass_d,
  input         io_lsu_pkt_r_bits_store_data_bypass_m,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [31:0] io_end_addr_r,
  input  [31:0] io_store_data_r,
  input         io_no_word_merge_r,
  input         io_no_dword_merge_r,
  input         io_lsu_busreq_m,
  input         io_ld_full_hit_m,
  input         io_flush_m_up,
  input         io_flush_r,
  input         io_lsu_commit_r,
  input         io_is_sideeffects_r,
  input         io_ldst_dual_d,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
  input  [7:0]  io_ldst_byteen_ext_m,
  input         io_lsu_axi_aw_ready,
  output        io_lsu_axi_aw_valid,
  output [2:0]  io_lsu_axi_aw_bits_id,
  output [31:0] io_lsu_axi_aw_bits_addr,
  output [3:0]  io_lsu_axi_aw_bits_region,
  output [7:0]  io_lsu_axi_aw_bits_len,
  output [2:0]  io_lsu_axi_aw_bits_size,
  output [1:0]  io_lsu_axi_aw_bits_burst,
  output        io_lsu_axi_aw_bits_lock,
  output [3:0]  io_lsu_axi_aw_bits_cache,
  output [2:0]  io_lsu_axi_aw_bits_prot,
  output [3:0]  io_lsu_axi_aw_bits_qos,
  input         io_lsu_axi_w_ready,
  output        io_lsu_axi_w_valid,
  output [63:0] io_lsu_axi_w_bits_data,
  output [7:0]  io_lsu_axi_w_bits_strb,
  output        io_lsu_axi_w_bits_last,
  output        io_lsu_axi_b_ready,
  input         io_lsu_axi_b_valid,
  input  [1:0]  io_lsu_axi_b_bits_resp,
  input  [2:0]  io_lsu_axi_b_bits_id,
  input         io_lsu_axi_ar_ready,
  output        io_lsu_axi_ar_valid,
  output [2:0]  io_lsu_axi_ar_bits_id,
  output [31:0] io_lsu_axi_ar_bits_addr,
  output [3:0]  io_lsu_axi_ar_bits_region,
  output [7:0]  io_lsu_axi_ar_bits_len,
  output [2:0]  io_lsu_axi_ar_bits_size,
  output [1:0]  io_lsu_axi_ar_bits_burst,
  output        io_lsu_axi_ar_bits_lock,
  output [3:0]  io_lsu_axi_ar_bits_cache,
  output [2:0]  io_lsu_axi_ar_bits_prot,
  output [3:0]  io_lsu_axi_ar_bits_qos,
  output        io_lsu_axi_r_ready,
  input         io_lsu_axi_r_valid,
  input  [2:0]  io_lsu_axi_r_bits_id,
  input  [63:0] io_lsu_axi_r_bits_data,
  input  [1:0]  io_lsu_axi_r_bits_resp,
  input         io_lsu_axi_r_bits_last,
  input         io_lsu_bus_clk_en,
  input         io_lsu_bus_clk_en_q,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output [3:0]  io_ld_byte_hit_buf_lo,
  output [3:0]  io_ld_byte_hit_buf_hi,
  output [31:0] io_ld_fwddata_buf_lo,
  output [31:0] io_ld_fwddata_buf_hi
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
  reg [31:0] _RAND_67;
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
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_11_io_l1clk; // @[lib.scala 390:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 390:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[lsu_bus_buffer.scala 76:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[lsu_bus_buffer.scala 77:46]
  reg [31:0] buf_addr_0; // @[lib.scala 396:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 79:74]
  reg  _T_4344; // @[Reg.scala 27:20]
  reg  _T_4341; // @[Reg.scala 27:20]
  reg  _T_4338; // @[Reg.scala 27:20]
  reg  _T_4335; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4344,_T_4341,_T_4338,_T_4335}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_6 = _T_4 & _T_5; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_1; // @[lib.scala 396:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_13 = _T_11 & _T_12; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_2; // @[lib.scala 396:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_20 = _T_18 & _T_19; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_3; // @[lib.scala 396:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_27 = _T_25 & _T_26; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_34 = _T_32 & _T_5; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_41 = _T_39 & _T_12; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_48 = _T_46 & _T_19; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_55 = _T_53 & _T_26; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  reg [3:0] buf_byteen_3; // @[Reg.scala 27:20]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2583 = buf_state_3 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_4094 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4117 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4121 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1780; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1780}; // @[lsu_bus_buffer.scala 354:13]
  wire  _T_4128 = obuf_tag0 == 3'h3; // @[lsu_bus_buffer.scala 459:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_363 = {{1'd0}, obuf_tag1}; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_4129 = _GEN_363 == 3'h3; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_4130 = obuf_merge & _T_4129; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_4131 = _T_4128 | _T_4130; // @[lsu_bus_buffer.scala 459:77]
  reg  obuf_valid; // @[lsu_bus_buffer.scala 348:54]
  wire  _T_4132 = _T_4131 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  reg  obuf_wr_enQ; // @[lib.scala 377:33]
  wire  _T_4133 = _T_4132 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_4155 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4239 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4257 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4265 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_285 = _T_4121 & _T_4133; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4117 ? 1'h0 : _GEN_285; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4094 ? 1'h0 : _GEN_298; // @[Conditional.scala 40:58]
  wire  _T_2584 = _T_2583 & buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2585 = ~_T_2584; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2586 = buf_ageQ_3[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2587 = ~io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 414:140]
  wire  _T_2588 = _T_2586 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2576 = buf_state_2 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_3904 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3927 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3931 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3938 = obuf_tag0 == 3'h2; // @[lsu_bus_buffer.scala 459:48]
  wire  _T_3939 = _GEN_363 == 3'h2; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_3940 = obuf_merge & _T_3939; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_3941 = _T_3938 | _T_3940; // @[lsu_bus_buffer.scala 459:77]
  wire  _T_3942 = _T_3941 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  wire  _T_3943 = _T_3942 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_3965 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4049 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4067 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4075 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_208 = _T_3931 & _T_3943; // @[Conditional.scala 39:67]
  wire  _GEN_221 = _T_3927 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3904 ? 1'h0 : _GEN_221; // @[Conditional.scala 40:58]
  wire  _T_2577 = _T_2576 & buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2578 = ~_T_2577; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2579 = buf_ageQ_3[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2581 = _T_2579 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2569 = buf_state_1 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_3714 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3737 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3741 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3748 = obuf_tag0 == 3'h1; // @[lsu_bus_buffer.scala 459:48]
  wire  _T_3749 = _GEN_363 == 3'h1; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_3750 = obuf_merge & _T_3749; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_3751 = _T_3748 | _T_3750; // @[lsu_bus_buffer.scala 459:77]
  wire  _T_3752 = _T_3751 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  wire  _T_3753 = _T_3752 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_3775 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3859 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3877 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3885 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_131 = _T_3741 & _T_3753; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3737 ? 1'h0 : _GEN_131; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3714 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  _T_2570 = _T_2569 & buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2571 = ~_T_2570; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2572 = buf_ageQ_3[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2574 = _T_2572 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2562 = buf_state_0 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_3524 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3547 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3551 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3558 = obuf_tag0 == 3'h0; // @[lsu_bus_buffer.scala 459:48]
  wire  _T_3559 = _GEN_363 == 3'h0; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_3560 = obuf_merge & _T_3559; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_3561 = _T_3558 | _T_3560; // @[lsu_bus_buffer.scala 459:77]
  wire  _T_3562 = _T_3561 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  wire  _T_3563 = _T_3562 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_3585 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3669 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3687 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3695 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_54 = _T_3551 & _T_3563; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_3547 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_67; // @[Conditional.scala 40:58]
  wire  _T_2563 = _T_2562 & buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2564 = ~_T_2563; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2565 = buf_ageQ_3[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2567 = _T_2565 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_3 = {_T_2588,_T_2581,_T_2574,_T_2567}; // @[Cat.scala 29:58]
  wire  _T_2687 = ~buf_age_3[2]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2689 = _T_2687 & _T_19; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2681 = ~buf_age_3[1]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2683 = _T_2681 & _T_12; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2675 = ~buf_age_3[0]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2677 = _T_2675 & _T_5; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2689,_T_2683,_T_2677}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_256 = |_T_255; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_257 = ~_T_256; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[lsu_bus_buffer.scala 149:97]
  reg [31:0] ibuf_addr; // @[lib.scala 396:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 155:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[lsu_bus_buffer.scala 155:73]
  reg  ibuf_valid; // @[lsu_bus_buffer.scala 243:54]
  wire  _T_514 = _T_513 & ibuf_valid; // @[lsu_bus_buffer.scala 155:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 155:99]
  wire [3:0] _T_521 = ld_addr_ibuf_hit_lo ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire [3:0] _T_522 = _T_521 & ibuf_byteen; // @[lsu_bus_buffer.scala 160:55]
  wire [3:0] ld_byte_ibuf_hit_lo = _T_522 & ldst_byteen_lo_m; // @[lsu_bus_buffer.scala 160:69]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_261 = _T_258 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_2; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2555 = buf_ageQ_2[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2557 = _T_2555 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2548 = buf_ageQ_2[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2550 = _T_2548 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2541 = buf_ageQ_2[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2543 = _T_2541 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2534 = buf_ageQ_2[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2536 = _T_2534 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_2 = {_T_2557,_T_2550,_T_2543,_T_2536}; // @[Cat.scala 29:58]
  wire  _T_2666 = ~buf_age_2[3]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2668 = _T_2666 & _T_26; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2654 = ~buf_age_2[1]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2656 = _T_2654 & _T_12; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2648 = ~buf_age_2[0]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2650 = _T_2648 & _T_5; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_2 = {_T_2668,1'h0,_T_2656,_T_2650}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_248 = |_T_247; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_249 = ~_T_248; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_253 = _T_250 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_1; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2524 = buf_ageQ_1[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2526 = _T_2524 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2517 = buf_ageQ_1[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2519 = _T_2517 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2510 = buf_ageQ_1[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2512 = _T_2510 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2503 = buf_ageQ_1[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2505 = _T_2503 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_1 = {_T_2526,_T_2519,_T_2512,_T_2505}; // @[Cat.scala 29:58]
  wire  _T_2639 = ~buf_age_1[3]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2641 = _T_2639 & _T_26; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2633 = ~buf_age_1[2]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2635 = _T_2633 & _T_19; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2621 = ~buf_age_1[0]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2623 = _T_2621 & _T_5; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_1 = {_T_2641,_T_2635,1'h0,_T_2623}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_240 = |_T_239; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_241 = ~_T_240; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_245 = _T_242 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_0; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2493 = buf_ageQ_0[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2495 = _T_2493 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2486 = buf_ageQ_0[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2488 = _T_2486 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2479 = buf_ageQ_0[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2481 = _T_2479 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2472 = buf_ageQ_0[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2474 = _T_2472 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_0 = {_T_2495,_T_2488,_T_2481,_T_2474}; // @[Cat.scala 29:58]
  wire  _T_2612 = ~buf_age_0[3]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2614 = _T_2612 & _T_26; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2606 = ~buf_age_0[2]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2608 = _T_2606 & _T_19; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2600 = ~buf_age_0[1]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2602 = _T_2600 & _T_12; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_0 = {_T_2614,_T_2608,_T_2602,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_232 = |_T_231; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_233 = ~_T_232; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_237 = _T_234 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[lsu_bus_buffer.scala 141:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_291 = |_T_290; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_292 = ~_T_291; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_296 = _T_293 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_283 = |_T_282; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_284 = ~_T_283; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_288 = _T_285 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_275 = |_T_274; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_276 = ~_T_275; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_280 = _T_277 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_267 = |_T_266; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_268 = ~_T_267; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_272 = _T_269 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[lsu_bus_buffer.scala 141:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_326 = |_T_325; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_327 = ~_T_326; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_331 = _T_328 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_318 = |_T_317; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_319 = ~_T_318; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_323 = _T_320 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_310 = |_T_309; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_311 = ~_T_310; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_315 = _T_312 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_302 = |_T_301; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_303 = ~_T_302; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_307 = _T_304 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[lsu_bus_buffer.scala 141:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_361 = |_T_360; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_362 = ~_T_361; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_366 = _T_363 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_353 = |_T_352; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_354 = ~_T_353; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_358 = _T_355 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_345 = |_T_344; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_346 = ~_T_345; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_350 = _T_347 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_337 = |_T_336; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_338 = ~_T_337; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_342 = _T_339 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[lsu_bus_buffer.scala 141:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_396 = |_T_395; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_397 = ~_T_396; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 156:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[lsu_bus_buffer.scala 156:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[lsu_bus_buffer.scala 156:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 156:99]
  wire [3:0] _T_525 = ld_addr_ibuf_hit_hi ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_526 = _T_525 & ibuf_byteen; // @[lsu_bus_buffer.scala 161:55]
  wire [3:0] ld_byte_ibuf_hit_hi = _T_526 & ldst_byteen_hi_m; // @[lsu_bus_buffer.scala 161:69]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_401 = _T_398 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_388 = |_T_387; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_389 = ~_T_388; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_393 = _T_390 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_380 = |_T_379; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_381 = ~_T_380; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_385 = _T_382 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_372 = |_T_371; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_373 = ~_T_372; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_377 = _T_374 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[lsu_bus_buffer.scala 142:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_431 = |_T_430; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_432 = ~_T_431; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_436 = _T_433 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_423 = |_T_422; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_424 = ~_T_423; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_428 = _T_425 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_415 = |_T_414; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_416 = ~_T_415; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_420 = _T_417 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_407 = |_T_406; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_408 = ~_T_407; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_412 = _T_409 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[lsu_bus_buffer.scala 142:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_466 = |_T_465; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_467 = ~_T_466; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_471 = _T_468 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_458 = |_T_457; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_459 = ~_T_458; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_463 = _T_460 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_450 = |_T_449; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_451 = ~_T_450; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_455 = _T_452 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_442 = |_T_441; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_443 = ~_T_442; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_447 = _T_444 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[lsu_bus_buffer.scala 142:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_501 = |_T_500; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_502 = ~_T_501; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_506 = _T_503 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_493 = |_T_492; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_494 = ~_T_493; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_498 = _T_495 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_485 = |_T_484; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_486 = ~_T_485; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_490 = _T_487 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_477 = |_T_476; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_478 = ~_T_477; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_482 = _T_479 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[lsu_bus_buffer.scala 142:77]
  wire [2:0] _T_84 = {_T_82,_T_79,_T_76}; // @[Cat.scala 29:58]
  wire [7:0] _T_530 = ld_byte_ibuf_hit_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_533 = ld_byte_ibuf_hit_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_536 = ld_byte_ibuf_hit_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_539 = ld_byte_ibuf_hit_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ld_fwddata_buf_lo_initial = {_T_539,_T_536,_T_533,_T_530}; // @[Cat.scala 29:58]
  wire [7:0] _T_544 = ld_byte_ibuf_hit_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_547 = ld_byte_ibuf_hit_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_550 = ld_byte_ibuf_hit_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_553 = ld_byte_ibuf_hit_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ld_fwddata_buf_hi_initial = {_T_553,_T_550,_T_547,_T_544}; // @[Cat.scala 29:58]
  wire [7:0] _T_558 = ld_byte_hitvecfn_lo_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_0; // @[lib.scala 396:16]
  wire [7:0] _T_560 = _T_558 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[lib.scala 396:16]
  wire [7:0] _T_565 = _T_563 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[lib.scala 396:16]
  wire [7:0] _T_570 = _T_568 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[lib.scala 396:16]
  wire [7:0] _T_575 = _T_573 & buf_data_3[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_576 = _T_560 | _T_565; // @[lsu_bus_buffer.scala 168:123]
  wire [7:0] _T_577 = _T_576 | _T_570; // @[lsu_bus_buffer.scala 168:123]
  wire [7:0] _T_578 = _T_577 | _T_575; // @[lsu_bus_buffer.scala 168:123]
  wire [7:0] _T_581 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_583 = _T_581 & buf_data_0[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_586 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_588 = _T_586 & buf_data_1[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_591 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_593 = _T_591 & buf_data_2[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_596 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_598 = _T_596 & buf_data_3[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_599 = _T_583 | _T_588; // @[lsu_bus_buffer.scala 169:97]
  wire [7:0] _T_600 = _T_599 | _T_593; // @[lsu_bus_buffer.scala 169:97]
  wire [7:0] _T_601 = _T_600 | _T_598; // @[lsu_bus_buffer.scala 169:97]
  wire [7:0] _T_604 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_606 = _T_604 & buf_data_0[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_609 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_611 = _T_609 & buf_data_1[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_614 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_616 = _T_614 & buf_data_2[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_619 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_621 = _T_619 & buf_data_3[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_622 = _T_606 | _T_611; // @[lsu_bus_buffer.scala 170:97]
  wire [7:0] _T_623 = _T_622 | _T_616; // @[lsu_bus_buffer.scala 170:97]
  wire [7:0] _T_624 = _T_623 | _T_621; // @[lsu_bus_buffer.scala 170:97]
  wire [7:0] _T_627 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_629 = _T_627 & buf_data_0[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_632 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_634 = _T_632 & buf_data_1[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_637 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_639 = _T_637 & buf_data_2[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_642 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_644 = _T_642 & buf_data_3[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_645 = _T_629 | _T_634; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_646 = _T_645 | _T_639; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_647 = _T_646 | _T_644; // @[lsu_bus_buffer.scala 171:97]
  wire [31:0] _T_650 = {_T_578,_T_601,_T_624,_T_647}; // @[Cat.scala 29:58]
  reg [31:0] ibuf_data; // @[lib.scala 396:16]
  wire [31:0] _T_651 = ld_fwddata_buf_lo_initial & ibuf_data; // @[lsu_bus_buffer.scala 172:32]
  wire [7:0] _T_655 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_657 = _T_655 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_660 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_662 = _T_660 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_665 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_667 = _T_665 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_670 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_672 = _T_670 & buf_data_3[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_673 = _T_657 | _T_662; // @[lsu_bus_buffer.scala 174:123]
  wire [7:0] _T_674 = _T_673 | _T_667; // @[lsu_bus_buffer.scala 174:123]
  wire [7:0] _T_675 = _T_674 | _T_672; // @[lsu_bus_buffer.scala 174:123]
  wire [7:0] _T_678 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_680 = _T_678 & buf_data_0[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_683 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_685 = _T_683 & buf_data_1[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_688 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_690 = _T_688 & buf_data_2[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_693 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_695 = _T_693 & buf_data_3[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_696 = _T_680 | _T_685; // @[lsu_bus_buffer.scala 175:97]
  wire [7:0] _T_697 = _T_696 | _T_690; // @[lsu_bus_buffer.scala 175:97]
  wire [7:0] _T_698 = _T_697 | _T_695; // @[lsu_bus_buffer.scala 175:97]
  wire [7:0] _T_701 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_703 = _T_701 & buf_data_0[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_706 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_708 = _T_706 & buf_data_1[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_711 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_713 = _T_711 & buf_data_2[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_716 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_718 = _T_716 & buf_data_3[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_719 = _T_703 | _T_708; // @[lsu_bus_buffer.scala 176:97]
  wire [7:0] _T_720 = _T_719 | _T_713; // @[lsu_bus_buffer.scala 176:97]
  wire [7:0] _T_721 = _T_720 | _T_718; // @[lsu_bus_buffer.scala 176:97]
  wire [7:0] _T_724 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_726 = _T_724 & buf_data_0[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_729 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_731 = _T_729 & buf_data_1[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_734 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_736 = _T_734 & buf_data_2[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_739 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_741 = _T_739 & buf_data_3[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_742 = _T_726 | _T_731; // @[lsu_bus_buffer.scala 177:97]
  wire [7:0] _T_743 = _T_742 | _T_736; // @[lsu_bus_buffer.scala 177:97]
  wire [7:0] _T_744 = _T_743 | _T_741; // @[lsu_bus_buffer.scala 177:97]
  wire [31:0] _T_747 = {_T_675,_T_698,_T_721,_T_744}; // @[Cat.scala 29:58]
  wire [31:0] _T_748 = ld_fwddata_buf_hi_initial & ibuf_data; // @[lsu_bus_buffer.scala 178:32]
  wire [3:0] _T_750 = io_lsu_pkt_r_bits_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_751 = io_lsu_pkt_r_bits_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_752 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_753 = _T_750 | _T_751; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_753 | _T_752; // @[Mux.scala 27:72]
  wire  _T_756 = io_lsu_addr_r[1:0] == 2'h0; // @[lsu_bus_buffer.scala 185:55]
  wire  _T_758 = io_lsu_addr_r[1:0] == 2'h1; // @[lsu_bus_buffer.scala 186:24]
  wire [3:0] _T_760 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_762 = io_lsu_addr_r[1:0] == 2'h2; // @[lsu_bus_buffer.scala 187:24]
  wire [3:0] _T_764 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_766 = io_lsu_addr_r[1:0] == 2'h3; // @[lsu_bus_buffer.scala 188:24]
  wire [3:0] _T_768 = {1'h0,ldst_byteen_r[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_770 = _T_758 ? _T_760 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_771 = _T_762 ? _T_764 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_772 = _T_766 ? _T_768 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_774 = _T_770 | _T_771; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_hi_r = _T_774 | _T_772; // @[Mux.scala 27:72]
  wire [3:0] _T_781 = {ldst_byteen_r[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_785 = {ldst_byteen_r[1:0],2'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_789 = {ldst_byteen_r[0],3'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_790 = _T_756 ? ldst_byteen_r : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_791 = _T_758 ? _T_781 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_792 = _T_762 ? _T_785 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_793 = _T_766 ? _T_789 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_794 = _T_790 | _T_791; // @[Mux.scala 27:72]
  wire [3:0] _T_795 = _T_794 | _T_792; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_lo_r = _T_795 | _T_793; // @[Mux.scala 27:72]
  wire [31:0] _T_802 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
  wire [31:0] _T_806 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_810 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_812 = _T_758 ? _T_802 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_813 = _T_762 ? _T_806 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_814 = _T_766 ? _T_810 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_816 = _T_812 | _T_813; // @[Mux.scala 27:72]
  wire [31:0] store_data_hi_r = _T_816 | _T_814; // @[Mux.scala 27:72]
  wire [31:0] _T_823 = {io_store_data_r[23:0],8'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_827 = {io_store_data_r[15:0],16'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_831 = {io_store_data_r[7:0],24'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_832 = _T_756 ? io_store_data_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_833 = _T_758 ? _T_823 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_834 = _T_762 ? _T_827 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_835 = _T_766 ? _T_831 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_836 = _T_832 | _T_833; // @[Mux.scala 27:72]
  wire [31:0] _T_837 = _T_836 | _T_834; // @[Mux.scala 27:72]
  wire [31:0] store_data_lo_r = _T_837 | _T_835; // @[Mux.scala 27:72]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[lsu_bus_buffer.scala 206:40]
  wire  _T_844 = ~io_lsu_addr_r[0]; // @[lsu_bus_buffer.scala 208:31]
  wire  _T_845 = io_lsu_pkt_r_bits_word & _T_756; // @[Mux.scala 27:72]
  wire  _T_846 = io_lsu_pkt_r_bits_half & _T_844; // @[Mux.scala 27:72]
  wire  _T_848 = _T_845 | _T_846; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_848 | io_lsu_pkt_r_bits_by; // @[Mux.scala 27:72]
  wire  _T_850 = io_lsu_pkt_r_bits_load | io_no_word_merge_r; // @[lsu_bus_buffer.scala 210:60]
  wire  _T_851 = io_lsu_busreq_r & _T_850; // @[lsu_bus_buffer.scala 210:34]
  wire  _T_852 = ~ibuf_valid; // @[lsu_bus_buffer.scala 210:84]
  wire  ibuf_byp = _T_851 & _T_852; // @[lsu_bus_buffer.scala 210:82]
  wire  _T_853 = io_lsu_busreq_r & io_lsu_commit_r; // @[lsu_bus_buffer.scala 211:36]
  wire  _T_854 = ~ibuf_byp; // @[lsu_bus_buffer.scala 211:56]
  wire  ibuf_wr_en = _T_853 & _T_854; // @[lsu_bus_buffer.scala 211:54]
  wire  _T_855 = ~ibuf_wr_en; // @[lsu_bus_buffer.scala 213:36]
  reg [2:0] ibuf_timer; // @[lsu_bus_buffer.scala 256:55]
  wire  _T_864 = ibuf_timer == 3'h7; // @[lsu_bus_buffer.scala 219:62]
  wire  _T_865 = ibuf_wr_en | _T_864; // @[lsu_bus_buffer.scala 219:48]
  wire  _T_929 = _T_853 & io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 238:54]
  wire  _T_930 = _T_929 & ibuf_valid; // @[lsu_bus_buffer.scala 238:80]
  wire  _T_931 = _T_930 & ibuf_write; // @[lsu_bus_buffer.scala 238:93]
  wire  _T_934 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 238:129]
  wire  _T_935 = _T_931 & _T_934; // @[lsu_bus_buffer.scala 238:106]
  wire  _T_936 = ~io_is_sideeffects_r; // @[lsu_bus_buffer.scala 238:152]
  wire  _T_937 = _T_935 & _T_936; // @[lsu_bus_buffer.scala 238:150]
  wire  _T_938 = ~io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_buffer.scala 238:175]
  wire  ibuf_merge_en = _T_937 & _T_938; // @[lsu_bus_buffer.scala 238:173]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[lsu_bus_buffer.scala 239:20]
  wire  _T_866 = ibuf_merge_en & ibuf_merge_in; // @[lsu_bus_buffer.scala 219:98]
  wire  _T_867 = ~_T_866; // @[lsu_bus_buffer.scala 219:82]
  wire  _T_868 = _T_865 & _T_867; // @[lsu_bus_buffer.scala 219:80]
  wire  _T_869 = _T_868 | ibuf_byp; // @[lsu_bus_buffer.scala 220:5]
  wire  _T_857 = ~io_lsu_busreq_r; // @[lsu_bus_buffer.scala 214:44]
  wire  _T_858 = io_lsu_busreq_m & _T_857; // @[lsu_bus_buffer.scala 214:42]
  wire  _T_859 = _T_858 & ibuf_valid; // @[lsu_bus_buffer.scala 214:61]
  wire  _T_862 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[lsu_bus_buffer.scala 214:120]
  wire  _T_863 = io_lsu_pkt_m_bits_load | _T_862; // @[lsu_bus_buffer.scala 214:100]
  wire  ibuf_force_drain = _T_859 & _T_863; // @[lsu_bus_buffer.scala 214:74]
  wire  _T_870 = _T_869 | ibuf_force_drain; // @[lsu_bus_buffer.scala 220:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_871 = _T_870 | ibuf_sideeffect; // @[lsu_bus_buffer.scala 220:35]
  wire  _T_872 = ~ibuf_write; // @[lsu_bus_buffer.scala 220:55]
  wire  _T_873 = _T_871 | _T_872; // @[lsu_bus_buffer.scala 220:53]
  wire  _T_874 = _T_873 | io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_buffer.scala 220:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_874; // @[lsu_bus_buffer.scala 219:32]
  wire  _T_856 = ibuf_drain_vld & _T_855; // @[lsu_bus_buffer.scala 213:34]
  wire  ibuf_rst = _T_856 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 213:49]
  reg [1:0] WrPtr1_r; // @[lsu_bus_buffer.scala 623:49]
  reg [1:0] WrPtr0_r; // @[lsu_bus_buffer.scala 622:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_bits_word,io_lsu_pkt_r_bits_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_881 = ibuf_byteen | ldst_byteen_lo_r; // @[lsu_bus_buffer.scala 229:77]
  wire [7:0] _T_889 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_892 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_893 = _T_866 ? _T_889 : _T_892; // @[lsu_bus_buffer.scala 233:46]
  wire [7:0] _T_898 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_901 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_902 = _T_866 ? _T_898 : _T_901; // @[lsu_bus_buffer.scala 233:46]
  wire [7:0] _T_907 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_910 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_911 = _T_866 ? _T_907 : _T_910; // @[lsu_bus_buffer.scala 233:46]
  wire [7:0] _T_916 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_919 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_920 = _T_866 ? _T_916 : _T_919; // @[lsu_bus_buffer.scala 233:46]
  wire [23:0] _T_922 = {_T_920,_T_911,_T_902}; // @[Cat.scala 29:58]
  wire  _T_923 = ibuf_timer < 3'h7; // @[lsu_bus_buffer.scala 236:59]
  wire [2:0] _T_926 = ibuf_timer + 3'h1; // @[lsu_bus_buffer.scala 236:93]
  wire  _T_941 = ~ibuf_merge_in; // @[lsu_bus_buffer.scala 240:65]
  wire  _T_942 = ibuf_merge_en & _T_941; // @[lsu_bus_buffer.scala 240:63]
  wire  _T_945 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_947 = _T_942 ? _T_945 : ibuf_byteen[0]; // @[lsu_bus_buffer.scala 240:48]
  wire  _T_952 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_954 = _T_942 ? _T_952 : ibuf_byteen[1]; // @[lsu_bus_buffer.scala 240:48]
  wire  _T_959 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_961 = _T_942 ? _T_959 : ibuf_byteen[2]; // @[lsu_bus_buffer.scala 240:48]
  wire  _T_966 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_968 = _T_942 ? _T_966 : ibuf_byteen[3]; // @[lsu_bus_buffer.scala 240:48]
  wire [3:0] ibuf_byteen_out = {_T_968,_T_961,_T_954,_T_947}; // @[Cat.scala 29:58]
  wire [7:0] _T_978 = _T_942 ? _T_889 : ibuf_data[7:0]; // @[lsu_bus_buffer.scala 241:45]
  wire [7:0] _T_986 = _T_942 ? _T_898 : ibuf_data[15:8]; // @[lsu_bus_buffer.scala 241:45]
  wire [7:0] _T_994 = _T_942 ? _T_907 : ibuf_data[23:16]; // @[lsu_bus_buffer.scala 241:45]
  wire [7:0] _T_1002 = _T_942 ? _T_916 : ibuf_data[31:24]; // @[lsu_bus_buffer.scala 241:45]
  wire [31:0] ibuf_data_out = {_T_1002,_T_994,_T_986,_T_978}; // @[Cat.scala 29:58]
  wire  _T_1005 = ibuf_wr_en | ibuf_valid; // @[lsu_bus_buffer.scala 243:58]
  wire  _T_1006 = ~ibuf_rst; // @[lsu_bus_buffer.scala 243:93]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4430 = buf_write[3] & _T_2583; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4431 = ~buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4432 = _T_4430 & _T_4431; // @[lsu_bus_buffer.scala 529:89]
  wire  _T_4425 = buf_write[2] & _T_2576; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4426 = ~buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4427 = _T_4425 & _T_4426; // @[lsu_bus_buffer.scala 529:89]
  wire [1:0] _T_4433 = _T_4432 + _T_4427; // @[lsu_bus_buffer.scala 529:142]
  wire  _T_4420 = buf_write[1] & _T_2569; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4421 = ~buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4422 = _T_4420 & _T_4421; // @[lsu_bus_buffer.scala 529:89]
  wire [1:0] _GEN_367 = {{1'd0}, _T_4422}; // @[lsu_bus_buffer.scala 529:142]
  wire [2:0] _T_4434 = _T_4433 + _GEN_367; // @[lsu_bus_buffer.scala 529:142]
  wire  _T_4415 = buf_write[0] & _T_2562; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4416 = ~buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4417 = _T_4415 & _T_4416; // @[lsu_bus_buffer.scala 529:89]
  wire [2:0] _GEN_368 = {{2'd0}, _T_4417}; // @[lsu_bus_buffer.scala 529:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4434 + _GEN_368; // @[lsu_bus_buffer.scala 529:142]
  wire  _T_1016 = buf_numvld_wrcmd_any == 4'h1; // @[lsu_bus_buffer.scala 266:43]
  wire  _T_4447 = _T_2583 & _T_4431; // @[lsu_bus_buffer.scala 530:73]
  wire  _T_4444 = _T_2576 & _T_4426; // @[lsu_bus_buffer.scala 530:73]
  wire [1:0] _T_4448 = _T_4447 + _T_4444; // @[lsu_bus_buffer.scala 530:126]
  wire  _T_4441 = _T_2569 & _T_4421; // @[lsu_bus_buffer.scala 530:73]
  wire [1:0] _GEN_369 = {{1'd0}, _T_4441}; // @[lsu_bus_buffer.scala 530:126]
  wire [2:0] _T_4449 = _T_4448 + _GEN_369; // @[lsu_bus_buffer.scala 530:126]
  wire  _T_4438 = _T_2562 & _T_4416; // @[lsu_bus_buffer.scala 530:73]
  wire [2:0] _GEN_370 = {{2'd0}, _T_4438}; // @[lsu_bus_buffer.scala 530:126]
  wire [3:0] buf_numvld_cmd_any = _T_4449 + _GEN_370; // @[lsu_bus_buffer.scala 530:126]
  wire  _T_1017 = buf_numvld_cmd_any == 4'h1; // @[lsu_bus_buffer.scala 266:72]
  wire  _T_1018 = _T_1016 & _T_1017; // @[lsu_bus_buffer.scala 266:51]
  reg  _T_1784; // @[lib.scala 377:33]
  wire [2:0] obuf_wr_timer = {{2'd0}, _T_1784}; // @[lsu_bus_buffer.scala 363:17]
  wire  _T_1019 = obuf_wr_timer != 3'h7; // @[lsu_bus_buffer.scala 266:97]
  wire  _T_1020 = _T_1018 & _T_1019; // @[lsu_bus_buffer.scala 266:80]
  wire  _T_1022 = _T_1020 & _T_938; // @[lsu_bus_buffer.scala 266:114]
  wire  _T_1911 = |buf_age_3; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1912 = ~_T_1911; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1914 = _T_1912 & _T_2583; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1916 = _T_1914 & _T_4431; // @[lsu_bus_buffer.scala 380:88]
  wire  _T_1905 = |buf_age_2; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1906 = ~_T_1905; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1908 = _T_1906 & _T_2576; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1910 = _T_1908 & _T_4426; // @[lsu_bus_buffer.scala 380:88]
  wire  _T_1899 = |buf_age_1; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1900 = ~_T_1899; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1902 = _T_1900 & _T_2569; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1904 = _T_1902 & _T_4421; // @[lsu_bus_buffer.scala 380:88]
  wire  _T_1893 = |buf_age_0; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1894 = ~_T_1893; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1896 = _T_1894 & _T_2562; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1898 = _T_1896 & _T_4416; // @[lsu_bus_buffer.scala 380:88]
  wire [3:0] CmdPtr0Dec = {_T_1916,_T_1910,_T_1904,_T_1898}; // @[Cat.scala 29:58]
  wire [7:0] _T_1986 = {4'h0,_T_1916,_T_1910,_T_1904,_T_1898}; // @[Cat.scala 29:58]
  wire  _T_1989 = _T_1986[4] | _T_1986[5]; // @[lsu_bus_buffer.scala 388:42]
  wire  _T_1991 = _T_1989 | _T_1986[6]; // @[lsu_bus_buffer.scala 388:48]
  wire  _T_1993 = _T_1991 | _T_1986[7]; // @[lsu_bus_buffer.scala 388:54]
  wire  _T_1996 = _T_1986[2] | _T_1986[3]; // @[lsu_bus_buffer.scala 388:67]
  wire  _T_1998 = _T_1996 | _T_1986[6]; // @[lsu_bus_buffer.scala 388:73]
  wire  _T_2000 = _T_1998 | _T_1986[7]; // @[lsu_bus_buffer.scala 388:79]
  wire  _T_2003 = _T_1986[1] | _T_1986[3]; // @[lsu_bus_buffer.scala 388:92]
  wire  _T_2005 = _T_2003 | _T_1986[5]; // @[lsu_bus_buffer.scala 388:98]
  wire  _T_2007 = _T_2005 | _T_1986[7]; // @[lsu_bus_buffer.scala 388:104]
  wire [2:0] _T_2009 = {_T_1993,_T_2000,_T_2007}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2009[1:0]; // @[lsu_bus_buffer.scala 393:11]
  wire  _T_1023 = CmdPtr0 == 2'h0; // @[lsu_bus_buffer.scala 267:114]
  wire  _T_1024 = CmdPtr0 == 2'h1; // @[lsu_bus_buffer.scala 267:114]
  wire  _T_1025 = CmdPtr0 == 2'h2; // @[lsu_bus_buffer.scala 267:114]
  wire  _T_1026 = CmdPtr0 == 2'h3; // @[lsu_bus_buffer.scala 267:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_1027 = _T_1023 & buf_nomerge_0; // @[Mux.scala 27:72]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _T_1028 = _T_1024 & buf_nomerge_1; // @[Mux.scala 27:72]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _T_1029 = _T_1025 & buf_nomerge_2; // @[Mux.scala 27:72]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1030 = _T_1026 & buf_nomerge_3; // @[Mux.scala 27:72]
  wire  _T_1031 = _T_1027 | _T_1028; // @[Mux.scala 27:72]
  wire  _T_1032 = _T_1031 | _T_1029; // @[Mux.scala 27:72]
  wire  _T_1033 = _T_1032 | _T_1030; // @[Mux.scala 27:72]
  wire  _T_1035 = ~_T_1033; // @[lsu_bus_buffer.scala 267:31]
  wire  _T_1036 = _T_1022 & _T_1035; // @[lsu_bus_buffer.scala 267:29]
  reg  _T_4314; // @[Reg.scala 27:20]
  reg  _T_4311; // @[Reg.scala 27:20]
  reg  _T_4308; // @[Reg.scala 27:20]
  reg  _T_4305; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4314,_T_4311,_T_4308,_T_4305}; // @[Cat.scala 29:58]
  wire  _T_1045 = _T_1023 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1046 = _T_1024 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1047 = _T_1025 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1048 = _T_1026 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1049 = _T_1045 | _T_1046; // @[Mux.scala 27:72]
  wire  _T_1050 = _T_1049 | _T_1047; // @[Mux.scala 27:72]
  wire  _T_1051 = _T_1050 | _T_1048; // @[Mux.scala 27:72]
  wire  _T_1053 = ~_T_1051; // @[lsu_bus_buffer.scala 268:5]
  wire  _T_1054 = _T_1036 & _T_1053; // @[lsu_bus_buffer.scala 267:140]
  wire  _T_1065 = _T_858 & _T_852; // @[lsu_bus_buffer.scala 270:58]
  wire  _T_1067 = _T_1065 & _T_1017; // @[lsu_bus_buffer.scala 270:72]
  wire [29:0] _T_1077 = _T_1023 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1078 = _T_1024 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1081 = _T_1077 | _T_1078; // @[Mux.scala 27:72]
  wire [29:0] _T_1079 = _T_1025 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1082 = _T_1081 | _T_1079; // @[Mux.scala 27:72]
  wire [29:0] _T_1080 = _T_1026 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1083 = _T_1082 | _T_1080; // @[Mux.scala 27:72]
  wire  _T_1085 = io_lsu_addr_m[31:2] != _T_1083; // @[lsu_bus_buffer.scala 270:123]
  wire  obuf_force_wr_en = _T_1067 & _T_1085; // @[lsu_bus_buffer.scala 270:101]
  wire  _T_1055 = ~obuf_force_wr_en; // @[lsu_bus_buffer.scala 268:119]
  wire  obuf_wr_wait = _T_1054 & _T_1055; // @[lsu_bus_buffer.scala 268:117]
  wire  _T_4466 = buf_state_3 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4470 = _T_4466 | _T_4447; // @[lsu_bus_buffer.scala 531:74]
  wire  _T_4461 = buf_state_2 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4465 = _T_4461 | _T_4444; // @[lsu_bus_buffer.scala 531:74]
  wire [1:0] _T_4471 = _T_4470 + _T_4465; // @[lsu_bus_buffer.scala 531:154]
  wire  _T_4456 = buf_state_1 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4460 = _T_4456 | _T_4441; // @[lsu_bus_buffer.scala 531:74]
  wire [1:0] _GEN_371 = {{1'd0}, _T_4460}; // @[lsu_bus_buffer.scala 531:154]
  wire [2:0] _T_4472 = _T_4471 + _GEN_371; // @[lsu_bus_buffer.scala 531:154]
  wire  _T_4451 = buf_state_0 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4455 = _T_4451 | _T_4438; // @[lsu_bus_buffer.scala 531:74]
  wire [2:0] _GEN_372 = {{2'd0}, _T_4455}; // @[lsu_bus_buffer.scala 531:154]
  wire [3:0] buf_numvld_pend_any = _T_4472 + _GEN_372; // @[lsu_bus_buffer.scala 531:154]
  wire  _T_1087 = buf_numvld_pend_any == 4'h0; // @[lsu_bus_buffer.scala 272:53]
  wire  _T_1088 = ibuf_byp & _T_1087; // @[lsu_bus_buffer.scala 272:31]
  wire  _T_1089 = ~io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 272:64]
  wire  _T_1090 = _T_1089 | io_no_dword_merge_r; // @[lsu_bus_buffer.scala 272:89]
  wire  ibuf_buf_byp = _T_1088 & _T_1090; // @[lsu_bus_buffer.scala 272:61]
  wire  _T_1091 = ibuf_buf_byp & io_lsu_commit_r; // @[lsu_bus_buffer.scala 287:32]
  wire  _T_4740 = buf_state_0 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4742 = _T_4740 & buf_sideeffect[0]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4743 = _T_4742 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4744 = buf_state_1 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4746 = _T_4744 & buf_sideeffect[1]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4747 = _T_4746 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4756 = _T_4743 | _T_4747; // @[lsu_bus_buffer.scala 559:153]
  wire  _T_4748 = buf_state_2 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4750 = _T_4748 & buf_sideeffect[2]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4751 = _T_4750 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4757 = _T_4756 | _T_4751; // @[lsu_bus_buffer.scala 559:153]
  wire  _T_4752 = buf_state_3 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4754 = _T_4752 & buf_sideeffect[3]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4755 = _T_4754 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4758 = _T_4757 | _T_4755; // @[lsu_bus_buffer.scala 559:153]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_4759 = obuf_valid & obuf_sideeffect; // @[lsu_bus_buffer.scala 559:171]
  wire  _T_4760 = _T_4759 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:189]
  wire  bus_sideeffect_pend = _T_4758 | _T_4760; // @[lsu_bus_buffer.scala 559:157]
  wire  _T_1092 = io_is_sideeffects_r & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 287:74]
  wire  _T_1093 = ~_T_1092; // @[lsu_bus_buffer.scala 287:52]
  wire  _T_1094 = _T_1091 & _T_1093; // @[lsu_bus_buffer.scala 287:50]
  wire [2:0] _T_1099 = _T_1023 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1100 = _T_1024 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1103 = _T_1099 | _T_1100; // @[Mux.scala 27:72]
  wire [2:0] _T_1101 = _T_1025 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1104 = _T_1103 | _T_1101; // @[Mux.scala 27:72]
  wire [2:0] _T_1102 = _T_1026 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1105 = _T_1104 | _T_1102; // @[Mux.scala 27:72]
  wire  _T_1107 = _T_1105 == 3'h2; // @[lsu_bus_buffer.scala 288:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[lsu_bus_buffer.scala 385:31]
  wire  _T_1108 = _T_1107 & found_cmdptr0; // @[lsu_bus_buffer.scala 288:47]
  wire [3:0] _T_1111 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1120 = _T_1023 & _T_1111[0]; // @[Mux.scala 27:72]
  wire  _T_1121 = _T_1024 & _T_1111[1]; // @[Mux.scala 27:72]
  wire  _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1122 = _T_1025 & _T_1111[2]; // @[Mux.scala 27:72]
  wire  _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire  _T_1123 = _T_1026 & _T_1111[3]; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = ~_T_1126; // @[lsu_bus_buffer.scala 289:23]
  wire  _T_1129 = _T_1108 & _T_1128; // @[lsu_bus_buffer.scala 289:21]
  wire  _T_1146 = _T_1051 & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 289:141]
  wire  _T_1147 = ~_T_1146; // @[lsu_bus_buffer.scala 289:105]
  wire  _T_1148 = _T_1129 & _T_1147; // @[lsu_bus_buffer.scala 289:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1151 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  wire  _T_1160 = _T_1023 & _T_1151[0]; // @[Mux.scala 27:72]
  wire  _T_1161 = _T_1024 & _T_1151[1]; // @[Mux.scala 27:72]
  wire  _T_1164 = _T_1160 | _T_1161; // @[Mux.scala 27:72]
  wire  _T_1162 = _T_1025 & _T_1151[2]; // @[Mux.scala 27:72]
  wire  _T_1165 = _T_1164 | _T_1162; // @[Mux.scala 27:72]
  wire  _T_1163 = _T_1026 & _T_1151[3]; // @[Mux.scala 27:72]
  wire  _T_1166 = _T_1165 | _T_1163; // @[Mux.scala 27:72]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1170 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1179 = _T_1023 & _T_1170[0]; // @[Mux.scala 27:72]
  wire  _T_1180 = _T_1024 & _T_1170[1]; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1179 | _T_1180; // @[Mux.scala 27:72]
  wire  _T_1181 = _T_1025 & _T_1170[2]; // @[Mux.scala 27:72]
  wire  _T_1184 = _T_1183 | _T_1181; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1026 & _T_1170[3]; // @[Mux.scala 27:72]
  wire  _T_1185 = _T_1184 | _T_1182; // @[Mux.scala 27:72]
  wire  _T_1187 = _T_1166 & _T_1185; // @[lsu_bus_buffer.scala 290:77]
  wire  _T_1196 = _T_1023 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1197 = _T_1024 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1200 = _T_1196 | _T_1197; // @[Mux.scala 27:72]
  wire  _T_1198 = _T_1025 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1200 | _T_1198; // @[Mux.scala 27:72]
  wire  _T_1199 = _T_1026 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1201 | _T_1199; // @[Mux.scala 27:72]
  wire  _T_1204 = ~_T_1202; // @[lsu_bus_buffer.scala 290:150]
  wire  _T_1205 = _T_1187 & _T_1204; // @[lsu_bus_buffer.scala 290:148]
  wire  _T_1206 = ~_T_1205; // @[lsu_bus_buffer.scala 290:8]
  wire [3:0] _T_1952 = ~CmdPtr0Dec; // @[lsu_bus_buffer.scala 381:62]
  wire [3:0] _T_1953 = buf_age_3 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1954 = |_T_1953; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1955 = ~_T_1954; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1957 = ~CmdPtr0Dec[3]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1958 = _T_1955 & _T_1957; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1960 = _T_1958 & _T_2583; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1962 = _T_1960 & _T_4431; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] _T_1942 = buf_age_2 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1943 = |_T_1942; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1944 = ~_T_1943; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1946 = ~CmdPtr0Dec[2]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1947 = _T_1944 & _T_1946; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1949 = _T_1947 & _T_2576; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1951 = _T_1949 & _T_4426; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] _T_1931 = buf_age_1 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1932 = |_T_1931; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1933 = ~_T_1932; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1935 = ~CmdPtr0Dec[1]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1936 = _T_1933 & _T_1935; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1938 = _T_1936 & _T_2569; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1940 = _T_1938 & _T_4421; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] _T_1920 = buf_age_0 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1921 = |_T_1920; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1922 = ~_T_1921; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1924 = ~CmdPtr0Dec[0]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1925 = _T_1922 & _T_1924; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1927 = _T_1925 & _T_2562; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1929 = _T_1927 & _T_4416; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] CmdPtr1Dec = {_T_1962,_T_1951,_T_1940,_T_1929}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[lsu_bus_buffer.scala 386:31]
  wire  _T_1207 = _T_1206 | found_cmdptr1; // @[lsu_bus_buffer.scala 290:181]
  wire [3:0] _T_1210 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1219 = _T_1023 & _T_1210[0]; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1024 & _T_1210[1]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1219 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1025 & _T_1210[2]; // @[Mux.scala 27:72]
  wire  _T_1224 = _T_1223 | _T_1221; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1026 & _T_1210[3]; // @[Mux.scala 27:72]
  wire  _T_1225 = _T_1224 | _T_1222; // @[Mux.scala 27:72]
  wire  _T_1227 = _T_1207 | _T_1225; // @[lsu_bus_buffer.scala 290:197]
  wire  _T_1228 = _T_1227 | obuf_force_wr_en; // @[lsu_bus_buffer.scala 290:269]
  wire  _T_1229 = _T_1148 & _T_1228; // @[lsu_bus_buffer.scala 289:164]
  wire  _T_1230 = _T_1094 | _T_1229; // @[lsu_bus_buffer.scala 287:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[lib.scala 377:33]
  reg  obuf_data_done; // @[lib.scala 377:33]
  wire  _T_4814 = obuf_cmd_done | obuf_data_done; // @[lsu_bus_buffer.scala 563:54]
  wire  _T_4815 = obuf_cmd_done ? io_lsu_axi_w_ready : io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 563:75]
  wire  _T_4816 = io_lsu_axi_aw_ready & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 563:153]
  wire  _T_4817 = _T_4814 ? _T_4815 : _T_4816; // @[lsu_bus_buffer.scala 563:39]
  wire  bus_cmd_ready = obuf_write ? _T_4817 : io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 563:23]
  wire  _T_1231 = ~obuf_valid; // @[lsu_bus_buffer.scala 291:48]
  wire  _T_1232 = bus_cmd_ready | _T_1231; // @[lsu_bus_buffer.scala 291:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1233 = _T_1232 | obuf_nosend; // @[lsu_bus_buffer.scala 291:60]
  wire  _T_1234 = _T_1230 & _T_1233; // @[lsu_bus_buffer.scala 291:29]
  wire  _T_1235 = ~obuf_wr_wait; // @[lsu_bus_buffer.scala 291:77]
  wire  _T_1236 = _T_1234 & _T_1235; // @[lsu_bus_buffer.scala 291:75]
  reg [31:0] obuf_addr; // @[lib.scala 396:16]
  wire  _T_4765 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4766 = obuf_valid & _T_4765; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4768 = obuf_tag1 == 2'h0; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4769 = obuf_merge & _T_4768; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4770 = _T_3558 | _T_4769; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4771 = ~_T_4770; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4772 = _T_4766 & _T_4771; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4806 = _T_4740 & _T_4772; // @[Mux.scala 27:72]
  wire  _T_4776 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4777 = obuf_valid & _T_4776; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4779 = obuf_tag1 == 2'h1; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4780 = obuf_merge & _T_4779; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4781 = _T_3748 | _T_4780; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4782 = ~_T_4781; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4783 = _T_4777 & _T_4782; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4807 = _T_4744 & _T_4783; // @[Mux.scala 27:72]
  wire  _T_4810 = _T_4806 | _T_4807; // @[Mux.scala 27:72]
  wire  _T_4787 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4788 = obuf_valid & _T_4787; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4790 = obuf_tag1 == 2'h2; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4791 = obuf_merge & _T_4790; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4792 = _T_3938 | _T_4791; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4793 = ~_T_4792; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4794 = _T_4788 & _T_4793; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4808 = _T_4748 & _T_4794; // @[Mux.scala 27:72]
  wire  _T_4811 = _T_4810 | _T_4808; // @[Mux.scala 27:72]
  wire  _T_4798 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4799 = obuf_valid & _T_4798; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4801 = obuf_tag1 == 2'h3; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4802 = obuf_merge & _T_4801; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4803 = _T_4128 | _T_4802; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4804 = ~_T_4803; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4805 = _T_4799 & _T_4804; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4809 = _T_4752 & _T_4805; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4811 | _T_4809; // @[Mux.scala 27:72]
  wire  _T_1237 = ~bus_addr_match_pending; // @[lsu_bus_buffer.scala 291:94]
  wire  _T_1238 = _T_1236 & _T_1237; // @[lsu_bus_buffer.scala 291:92]
  wire  obuf_wr_en = _T_1238 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 291:118]
  wire  _T_1240 = obuf_valid & obuf_nosend; // @[lsu_bus_buffer.scala 293:47]
  wire  bus_wcmd_sent = io_lsu_axi_aw_valid & io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 564:40]
  wire  _T_4821 = obuf_cmd_done | bus_wcmd_sent; // @[lsu_bus_buffer.scala 566:35]
  wire  bus_wdata_sent = io_lsu_axi_w_valid & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 565:40]
  wire  _T_4822 = obuf_data_done | bus_wdata_sent; // @[lsu_bus_buffer.scala 566:70]
  wire  _T_4823 = _T_4821 & _T_4822; // @[lsu_bus_buffer.scala 566:52]
  wire  _T_4824 = io_lsu_axi_ar_valid & io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 566:112]
  wire  bus_cmd_sent = _T_4823 | _T_4824; // @[lsu_bus_buffer.scala 566:89]
  wire  _T_1241 = bus_cmd_sent | _T_1240; // @[lsu_bus_buffer.scala 293:33]
  wire  _T_1242 = ~obuf_wr_en; // @[lsu_bus_buffer.scala 293:65]
  wire  _T_1243 = _T_1241 & _T_1242; // @[lsu_bus_buffer.scala 293:63]
  wire  _T_1244 = _T_1243 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 293:77]
  wire  obuf_rst = _T_1244 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 293:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_bits_store : _T_1202; // @[lsu_bus_buffer.scala 294:26]
  wire [31:0] _T_1281 = _T_1023 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1282 = _T_1024 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1283 = _T_1025 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1284 = _T_1026 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1285 = _T_1281 | _T_1282; // @[Mux.scala 27:72]
  wire [31:0] _T_1286 = _T_1285 | _T_1283; // @[Mux.scala 27:72]
  wire [31:0] _T_1287 = _T_1286 | _T_1284; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1287; // @[lsu_bus_buffer.scala 296:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1294 = _T_1023 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1295 = _T_1024 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1296 = _T_1025 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1297 = _T_1026 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1298 = _T_1294 | _T_1295; // @[Mux.scala 27:72]
  wire [1:0] _T_1299 = _T_1298 | _T_1296; // @[Mux.scala 27:72]
  wire [1:0] _T_1300 = _T_1299 | _T_1297; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1300; // @[lsu_bus_buffer.scala 299:23]
  wire [7:0] _T_2011 = {4'h0,_T_1962,_T_1951,_T_1940,_T_1929}; // @[Cat.scala 29:58]
  wire  _T_2014 = _T_2011[4] | _T_2011[5]; // @[lsu_bus_buffer.scala 388:42]
  wire  _T_2016 = _T_2014 | _T_2011[6]; // @[lsu_bus_buffer.scala 388:48]
  wire  _T_2018 = _T_2016 | _T_2011[7]; // @[lsu_bus_buffer.scala 388:54]
  wire  _T_2021 = _T_2011[2] | _T_2011[3]; // @[lsu_bus_buffer.scala 388:67]
  wire  _T_2023 = _T_2021 | _T_2011[6]; // @[lsu_bus_buffer.scala 388:73]
  wire  _T_2025 = _T_2023 | _T_2011[7]; // @[lsu_bus_buffer.scala 388:79]
  wire  _T_2028 = _T_2011[1] | _T_2011[3]; // @[lsu_bus_buffer.scala 388:92]
  wire  _T_2030 = _T_2028 | _T_2011[5]; // @[lsu_bus_buffer.scala 388:98]
  wire  _T_2032 = _T_2030 | _T_2011[7]; // @[lsu_bus_buffer.scala 388:104]
  wire [2:0] _T_2034 = {_T_2018,_T_2025,_T_2032}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr1 = _T_2034[1:0]; // @[lsu_bus_buffer.scala 395:11]
  wire  _T_1302 = obuf_wr_en | obuf_rst; // @[lsu_bus_buffer.scala 307:39]
  wire  _T_1303 = ~_T_1302; // @[lsu_bus_buffer.scala 307:26]
  wire  _T_1309 = obuf_sz_in == 2'h0; // @[lsu_bus_buffer.scala 311:72]
  wire  _T_1312 = ~obuf_addr_in[0]; // @[lsu_bus_buffer.scala 311:98]
  wire  _T_1313 = obuf_sz_in[0] & _T_1312; // @[lsu_bus_buffer.scala 311:96]
  wire  _T_1314 = _T_1309 | _T_1313; // @[lsu_bus_buffer.scala 311:79]
  wire  _T_1317 = |obuf_addr_in[1:0]; // @[lsu_bus_buffer.scala 311:153]
  wire  _T_1318 = ~_T_1317; // @[lsu_bus_buffer.scala 311:134]
  wire  _T_1319 = obuf_sz_in[1] & _T_1318; // @[lsu_bus_buffer.scala 311:132]
  wire  _T_1320 = _T_1314 | _T_1319; // @[lsu_bus_buffer.scala 311:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1320; // @[lsu_bus_buffer.scala 311:28]
  wire  _T_1337 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[lsu_bus_buffer.scala 326:40]
  wire  _T_1338 = _T_1337 & obuf_aligned_in; // @[lsu_bus_buffer.scala 326:60]
  wire  _T_1339 = ~obuf_sideeffect; // @[lsu_bus_buffer.scala 326:80]
  wire  _T_1340 = _T_1338 & _T_1339; // @[lsu_bus_buffer.scala 326:78]
  wire  _T_1341 = ~obuf_write; // @[lsu_bus_buffer.scala 326:99]
  wire  _T_1342 = _T_1340 & _T_1341; // @[lsu_bus_buffer.scala 326:97]
  wire  _T_1343 = ~obuf_write_in; // @[lsu_bus_buffer.scala 326:113]
  wire  _T_1344 = _T_1342 & _T_1343; // @[lsu_bus_buffer.scala 326:111]
  wire  _T_1345 = ~io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_buffer.scala 326:130]
  wire  _T_1346 = _T_1344 & _T_1345; // @[lsu_bus_buffer.scala 326:128]
  wire  _T_1347 = ~obuf_nosend; // @[lsu_bus_buffer.scala 327:20]
  wire  _T_1348 = obuf_valid & _T_1347; // @[lsu_bus_buffer.scala 327:18]
  reg  obuf_rdrsp_pend; // @[Reg.scala 27:20]
  wire  bus_rsp_read = io_lsu_axi_r_valid & io_lsu_axi_r_ready; // @[lsu_bus_buffer.scala 567:38]
  reg [2:0] obuf_rdrsp_tag; // @[lib.scala 377:33]
  wire  _T_1349 = io_lsu_axi_r_bits_id == obuf_rdrsp_tag; // @[lsu_bus_buffer.scala 327:90]
  wire  _T_1350 = bus_rsp_read & _T_1349; // @[lsu_bus_buffer.scala 327:70]
  wire  _T_1351 = ~_T_1350; // @[lsu_bus_buffer.scala 327:55]
  wire  _T_1352 = obuf_rdrsp_pend & _T_1351; // @[lsu_bus_buffer.scala 327:53]
  wire  _T_1353 = _T_1348 | _T_1352; // @[lsu_bus_buffer.scala 327:34]
  wire  obuf_nosend_in = _T_1346 & _T_1353; // @[lsu_bus_buffer.scala 326:177]
  wire  _T_1321 = ~obuf_nosend_in; // @[lsu_bus_buffer.scala 319:45]
  wire  _T_1322 = obuf_wr_en & _T_1321; // @[lsu_bus_buffer.scala 319:43]
  wire  _T_1323 = ~_T_1322; // @[lsu_bus_buffer.scala 319:30]
  wire  _T_1324 = _T_1323 & obuf_rdrsp_pend; // @[lsu_bus_buffer.scala 319:62]
  wire  _T_1328 = _T_1324 & _T_1351; // @[lsu_bus_buffer.scala 319:80]
  wire  _T_1330 = bus_cmd_sent & _T_1341; // @[lsu_bus_buffer.scala 320:19]
  wire  _T_1331 = _T_1328 | _T_1330; // @[lsu_bus_buffer.scala 319:139]
  wire  obuf_rdrsp_pend_in = _T_1331 & _T_2587; // @[lsu_bus_buffer.scala 320:35]
  wire  obuf_rdrsp_pend_en = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 321:47]
  wire [7:0] _T_1356 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1357 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1358 = io_lsu_addr_r[2] ? _T_1356 : _T_1357; // @[lsu_bus_buffer.scala 328:46]
  wire [3:0] _T_1377 = _T_1023 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1378 = _T_1024 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1379 = _T_1025 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1380 = _T_1026 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1381 = _T_1377 | _T_1378; // @[Mux.scala 27:72]
  wire [3:0] _T_1382 = _T_1381 | _T_1379; // @[Mux.scala 27:72]
  wire [3:0] _T_1383 = _T_1382 | _T_1380; // @[Mux.scala 27:72]
  wire [7:0] _T_1385 = {_T_1383,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1398 = {4'h0,_T_1383}; // @[Cat.scala 29:58]
  wire [7:0] _T_1399 = _T_1287[2] ? _T_1385 : _T_1398; // @[lsu_bus_buffer.scala 329:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1358 : _T_1399; // @[lsu_bus_buffer.scala 328:28]
  wire [7:0] _T_1401 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1402 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1403 = io_end_addr_r[2] ? _T_1401 : _T_1402; // @[lsu_bus_buffer.scala 330:46]
  wire  _T_1404 = CmdPtr1 == 2'h0; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_1405 = CmdPtr1 == 2'h1; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_1406 = CmdPtr1 == 2'h2; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_1407 = CmdPtr1 == 2'h3; // @[lsu_bus_buffer.scala 61:123]
  wire [31:0] _T_1408 = _T_1404 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1409 = _T_1405 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1410 = _T_1406 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1411 = _T_1407 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1412 = _T_1408 | _T_1409; // @[Mux.scala 27:72]
  wire [31:0] _T_1413 = _T_1412 | _T_1410; // @[Mux.scala 27:72]
  wire [31:0] _T_1414 = _T_1413 | _T_1411; // @[Mux.scala 27:72]
  wire [3:0] _T_1422 = _T_1404 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1423 = _T_1405 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1424 = _T_1406 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1425 = _T_1407 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1426 = _T_1422 | _T_1423; // @[Mux.scala 27:72]
  wire [3:0] _T_1427 = _T_1426 | _T_1424; // @[Mux.scala 27:72]
  wire [3:0] _T_1428 = _T_1427 | _T_1425; // @[Mux.scala 27:72]
  wire [7:0] _T_1430 = {_T_1428,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1443 = {4'h0,_T_1428}; // @[Cat.scala 29:58]
  wire [7:0] _T_1444 = _T_1414[2] ? _T_1430 : _T_1443; // @[lsu_bus_buffer.scala 331:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1403 : _T_1444; // @[lsu_bus_buffer.scala 330:28]
  wire [63:0] _T_1446 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1447 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1448 = io_lsu_addr_r[2] ? _T_1446 : _T_1447; // @[lsu_bus_buffer.scala 333:44]
  wire [31:0] _T_1467 = _T_1023 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1468 = _T_1024 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1469 = _T_1025 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1470 = _T_1026 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1471 = _T_1467 | _T_1468; // @[Mux.scala 27:72]
  wire [31:0] _T_1472 = _T_1471 | _T_1469; // @[Mux.scala 27:72]
  wire [31:0] _T_1473 = _T_1472 | _T_1470; // @[Mux.scala 27:72]
  wire [63:0] _T_1475 = {_T_1473,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1488 = {32'h0,_T_1473}; // @[Cat.scala 29:58]
  wire [63:0] _T_1489 = _T_1287[2] ? _T_1475 : _T_1488; // @[lsu_bus_buffer.scala 334:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1448 : _T_1489; // @[lsu_bus_buffer.scala 333:26]
  wire [63:0] _T_1491 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1492 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1493 = io_end_addr_r[2] ? _T_1491 : _T_1492; // @[lsu_bus_buffer.scala 335:44]
  wire [31:0] _T_1512 = _T_1404 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1513 = _T_1405 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1514 = _T_1406 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1515 = _T_1407 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1516 = _T_1512 | _T_1513; // @[Mux.scala 27:72]
  wire [31:0] _T_1517 = _T_1516 | _T_1514; // @[Mux.scala 27:72]
  wire [31:0] _T_1518 = _T_1517 | _T_1515; // @[Mux.scala 27:72]
  wire [63:0] _T_1520 = {_T_1518,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1533 = {32'h0,_T_1518}; // @[Cat.scala 29:58]
  wire [63:0] _T_1534 = _T_1414[2] ? _T_1520 : _T_1533; // @[lsu_bus_buffer.scala 336:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1493 : _T_1534; // @[lsu_bus_buffer.scala 335:26]
  wire  _T_1619 = CmdPtr0 != CmdPtr1; // @[lsu_bus_buffer.scala 342:30]
  wire  _T_1620 = _T_1619 & found_cmdptr0; // @[lsu_bus_buffer.scala 342:43]
  wire  _T_1621 = _T_1620 & found_cmdptr1; // @[lsu_bus_buffer.scala 342:59]
  wire  _T_1635 = _T_1621 & _T_1107; // @[lsu_bus_buffer.scala 342:75]
  wire [2:0] _T_1640 = _T_1404 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1641 = _T_1405 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1644 = _T_1640 | _T_1641; // @[Mux.scala 27:72]
  wire [2:0] _T_1642 = _T_1406 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1645 = _T_1644 | _T_1642; // @[Mux.scala 27:72]
  wire [2:0] _T_1643 = _T_1407 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1646 = _T_1645 | _T_1643; // @[Mux.scala 27:72]
  wire  _T_1648 = _T_1646 == 3'h2; // @[lsu_bus_buffer.scala 342:150]
  wire  _T_1649 = _T_1635 & _T_1648; // @[lsu_bus_buffer.scala 342:118]
  wire  _T_1670 = _T_1649 & _T_1128; // @[lsu_bus_buffer.scala 342:161]
  wire  _T_1688 = _T_1670 & _T_1053; // @[lsu_bus_buffer.scala 343:85]
  wire  _T_1725 = _T_1204 & _T_1166; // @[lsu_bus_buffer.scala 344:36]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1728 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1737 = _T_1023 & _T_1728[0]; // @[Mux.scala 27:72]
  wire  _T_1738 = _T_1024 & _T_1728[1]; // @[Mux.scala 27:72]
  wire  _T_1741 = _T_1737 | _T_1738; // @[Mux.scala 27:72]
  wire  _T_1739 = _T_1025 & _T_1728[2]; // @[Mux.scala 27:72]
  wire  _T_1742 = _T_1741 | _T_1739; // @[Mux.scala 27:72]
  wire  _T_1740 = _T_1026 & _T_1728[3]; // @[Mux.scala 27:72]
  wire  _T_1743 = _T_1742 | _T_1740; // @[Mux.scala 27:72]
  wire  _T_1745 = ~_T_1743; // @[lsu_bus_buffer.scala 344:107]
  wire  _T_1746 = _T_1725 & _T_1745; // @[lsu_bus_buffer.scala 344:105]
  wire  _T_1766 = _T_1746 & _T_1185; // @[lsu_bus_buffer.scala 344:177]
  wire  _T_1767 = _T_1688 & _T_1766; // @[lsu_bus_buffer.scala 343:122]
  wire  _T_1768 = ibuf_buf_byp & ldst_samedw_r; // @[lsu_bus_buffer.scala 345:19]
  wire  _T_1769 = _T_1768 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 345:35]
  wire  obuf_merge_en = _T_1767 | _T_1769; // @[lsu_bus_buffer.scala 344:250]
  wire  _T_1537 = obuf_merge_en & obuf_byteen1_in[0]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1538 = obuf_byteen0_in[0] | _T_1537; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1541 = obuf_merge_en & obuf_byteen1_in[1]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1542 = obuf_byteen0_in[1] | _T_1541; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1545 = obuf_merge_en & obuf_byteen1_in[2]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1546 = obuf_byteen0_in[2] | _T_1545; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1549 = obuf_merge_en & obuf_byteen1_in[3]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1550 = obuf_byteen0_in[3] | _T_1549; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1553 = obuf_merge_en & obuf_byteen1_in[4]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1554 = obuf_byteen0_in[4] | _T_1553; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1557 = obuf_merge_en & obuf_byteen1_in[5]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1558 = obuf_byteen0_in[5] | _T_1557; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1561 = obuf_merge_en & obuf_byteen1_in[6]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1562 = obuf_byteen0_in[6] | _T_1561; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1565 = obuf_merge_en & obuf_byteen1_in[7]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1566 = obuf_byteen0_in[7] | _T_1565; // @[lsu_bus_buffer.scala 337:63]
  wire [7:0] obuf_byteen_in = {_T_1566,_T_1562,_T_1558,_T_1554,_T_1550,_T_1546,_T_1542,_T_1538}; // @[Cat.scala 29:58]
  wire [7:0] _T_1577 = _T_1537 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1582 = _T_1541 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1587 = _T_1545 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1592 = _T_1549 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1597 = _T_1553 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1602 = _T_1557 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1607 = _T_1561 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1612 = _T_1565 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[lsu_bus_buffer.scala 338:44]
  wire [55:0] _T_1618 = {_T_1612,_T_1607,_T_1602,_T_1597,_T_1592,_T_1587,_T_1582}; // @[Cat.scala 29:58]
  wire  _T_1771 = obuf_wr_en | obuf_valid; // @[lsu_bus_buffer.scala 348:58]
  wire  _T_1772 = ~obuf_rst; // @[lsu_bus_buffer.scala 348:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[lib.scala 396:16]
  wire  _T_1785 = buf_state_0 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1786 = ibuf_tag == 2'h0; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1787 = ibuf_valid & _T_1786; // @[lsu_bus_buffer.scala 367:19]
  wire  _T_1788 = WrPtr0_r == 2'h0; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1789 = WrPtr1_r == 2'h0; // @[lsu_bus_buffer.scala 368:57]
  wire  _T_1790 = io_ldst_dual_r & _T_1789; // @[lsu_bus_buffer.scala 368:45]
  wire  _T_1791 = _T_1788 | _T_1790; // @[lsu_bus_buffer.scala 368:27]
  wire  _T_1792 = io_lsu_busreq_r & _T_1791; // @[lsu_bus_buffer.scala 367:58]
  wire  _T_1793 = _T_1787 | _T_1792; // @[lsu_bus_buffer.scala 367:39]
  wire  _T_1794 = ~_T_1793; // @[lsu_bus_buffer.scala 367:5]
  wire  _T_1795 = _T_1785 & _T_1794; // @[lsu_bus_buffer.scala 366:76]
  wire  _T_1796 = buf_state_1 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1797 = ibuf_tag == 2'h1; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1798 = ibuf_valid & _T_1797; // @[lsu_bus_buffer.scala 367:19]
  wire  _T_1799 = WrPtr0_r == 2'h1; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1800 = WrPtr1_r == 2'h1; // @[lsu_bus_buffer.scala 368:57]
  wire  _T_1801 = io_ldst_dual_r & _T_1800; // @[lsu_bus_buffer.scala 368:45]
  wire  _T_1802 = _T_1799 | _T_1801; // @[lsu_bus_buffer.scala 368:27]
  wire  _T_1803 = io_lsu_busreq_r & _T_1802; // @[lsu_bus_buffer.scala 367:58]
  wire  _T_1804 = _T_1798 | _T_1803; // @[lsu_bus_buffer.scala 367:39]
  wire  _T_1805 = ~_T_1804; // @[lsu_bus_buffer.scala 367:5]
  wire  _T_1806 = _T_1796 & _T_1805; // @[lsu_bus_buffer.scala 366:76]
  wire  _T_1807 = buf_state_2 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1808 = ibuf_tag == 2'h2; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1809 = ibuf_valid & _T_1808; // @[lsu_bus_buffer.scala 367:19]
  wire  _T_1810 = WrPtr0_r == 2'h2; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1811 = WrPtr1_r == 2'h2; // @[lsu_bus_buffer.scala 368:57]
  wire  _T_1812 = io_ldst_dual_r & _T_1811; // @[lsu_bus_buffer.scala 368:45]
  wire  _T_1813 = _T_1810 | _T_1812; // @[lsu_bus_buffer.scala 368:27]
  wire  _T_1814 = io_lsu_busreq_r & _T_1813; // @[lsu_bus_buffer.scala 367:58]
  wire  _T_1815 = _T_1809 | _T_1814; // @[lsu_bus_buffer.scala 367:39]
  wire  _T_1816 = ~_T_1815; // @[lsu_bus_buffer.scala 367:5]
  wire  _T_1817 = _T_1807 & _T_1816; // @[lsu_bus_buffer.scala 366:76]
  wire  _T_1818 = buf_state_3 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1819 = ibuf_tag == 2'h3; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1821 = WrPtr0_r == 2'h3; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1822 = WrPtr1_r == 2'h3; // @[lsu_bus_buffer.scala 368:57]
  wire [1:0] _T_1830 = _T_1817 ? 2'h2 : 2'h3; // @[Mux.scala 98:16]
  wire [1:0] _T_1831 = _T_1806 ? 2'h1 : _T_1830; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1795 ? 2'h0 : _T_1831; // @[Mux.scala 98:16]
  wire  _T_1836 = WrPtr0_m == 2'h0; // @[lsu_bus_buffer.scala 373:33]
  wire  _T_1837 = io_lsu_busreq_m & _T_1836; // @[lsu_bus_buffer.scala 373:22]
  wire  _T_1838 = _T_1787 | _T_1837; // @[lsu_bus_buffer.scala 372:112]
  wire  _T_1844 = _T_1838 | _T_1792; // @[lsu_bus_buffer.scala 373:42]
  wire  _T_1845 = ~_T_1844; // @[lsu_bus_buffer.scala 372:78]
  wire  _T_1846 = _T_1785 & _T_1845; // @[lsu_bus_buffer.scala 372:76]
  wire  _T_1850 = WrPtr0_m == 2'h1; // @[lsu_bus_buffer.scala 373:33]
  wire  _T_1851 = io_lsu_busreq_m & _T_1850; // @[lsu_bus_buffer.scala 373:22]
  wire  _T_1852 = _T_1798 | _T_1851; // @[lsu_bus_buffer.scala 372:112]
  wire  _T_1858 = _T_1852 | _T_1803; // @[lsu_bus_buffer.scala 373:42]
  wire  _T_1859 = ~_T_1858; // @[lsu_bus_buffer.scala 372:78]
  wire  _T_1860 = _T_1796 & _T_1859; // @[lsu_bus_buffer.scala 372:76]
  wire  _T_1864 = WrPtr0_m == 2'h2; // @[lsu_bus_buffer.scala 373:33]
  wire  _T_1865 = io_lsu_busreq_m & _T_1864; // @[lsu_bus_buffer.scala 373:22]
  wire  _T_1866 = _T_1809 | _T_1865; // @[lsu_bus_buffer.scala 372:112]
  wire  _T_1872 = _T_1866 | _T_1814; // @[lsu_bus_buffer.scala 373:42]
  wire  _T_1873 = ~_T_1872; // @[lsu_bus_buffer.scala 372:78]
  wire  _T_1874 = _T_1807 & _T_1873; // @[lsu_bus_buffer.scala 372:76]
  reg [3:0] buf_rspageQ_0; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2710 = buf_state_3 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2711 = buf_rspageQ_0[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2707 = buf_state_2 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2708 = buf_rspageQ_0[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2704 = buf_state_1 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2705 = buf_rspageQ_0[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2701 = buf_state_0 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2702 = buf_rspageQ_0[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_0 = {_T_2711,_T_2708,_T_2705,_T_2702}; // @[Cat.scala 29:58]
  wire  _T_1965 = |buf_rsp_pickage_0; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1966 = ~_T_1965; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1968 = _T_1966 & _T_2701; // @[lsu_bus_buffer.scala 384:70]
  reg [3:0] buf_rspageQ_1; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2726 = buf_rspageQ_1[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2723 = buf_rspageQ_1[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2720 = buf_rspageQ_1[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2717 = buf_rspageQ_1[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_1 = {_T_2726,_T_2723,_T_2720,_T_2717}; // @[Cat.scala 29:58]
  wire  _T_1969 = |buf_rsp_pickage_1; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1970 = ~_T_1969; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1972 = _T_1970 & _T_2704; // @[lsu_bus_buffer.scala 384:70]
  reg [3:0] buf_rspageQ_2; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2741 = buf_rspageQ_2[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2738 = buf_rspageQ_2[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2735 = buf_rspageQ_2[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2732 = buf_rspageQ_2[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_2 = {_T_2741,_T_2738,_T_2735,_T_2732}; // @[Cat.scala 29:58]
  wire  _T_1973 = |buf_rsp_pickage_2; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1974 = ~_T_1973; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1976 = _T_1974 & _T_2707; // @[lsu_bus_buffer.scala 384:70]
  reg [3:0] buf_rspageQ_3; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2756 = buf_rspageQ_3[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2753 = buf_rspageQ_3[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2750 = buf_rspageQ_3[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2747 = buf_rspageQ_3[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_3 = {_T_2756,_T_2753,_T_2750,_T_2747}; // @[Cat.scala 29:58]
  wire  _T_1977 = |buf_rsp_pickage_3; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1978 = ~_T_1977; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1980 = _T_1978 & _T_2710; // @[lsu_bus_buffer.scala 384:70]
  wire [7:0] _T_2036 = {4'h0,_T_1980,_T_1976,_T_1972,_T_1968}; // @[Cat.scala 29:58]
  wire  _T_2039 = _T_2036[4] | _T_2036[5]; // @[lsu_bus_buffer.scala 388:42]
  wire  _T_2041 = _T_2039 | _T_2036[6]; // @[lsu_bus_buffer.scala 388:48]
  wire  _T_2043 = _T_2041 | _T_2036[7]; // @[lsu_bus_buffer.scala 388:54]
  wire  _T_2046 = _T_2036[2] | _T_2036[3]; // @[lsu_bus_buffer.scala 388:67]
  wire  _T_2048 = _T_2046 | _T_2036[6]; // @[lsu_bus_buffer.scala 388:73]
  wire  _T_2050 = _T_2048 | _T_2036[7]; // @[lsu_bus_buffer.scala 388:79]
  wire  _T_2053 = _T_2036[1] | _T_2036[3]; // @[lsu_bus_buffer.scala 388:92]
  wire  _T_2055 = _T_2053 | _T_2036[5]; // @[lsu_bus_buffer.scala 388:98]
  wire  _T_2057 = _T_2055 | _T_2036[7]; // @[lsu_bus_buffer.scala 388:104]
  wire [2:0] _T_2059 = {_T_2043,_T_2050,_T_2057}; // @[Cat.scala 29:58]
  wire  _T_3528 = ibuf_byp | io_ldst_dual_r; // @[lsu_bus_buffer.scala 446:77]
  wire  _T_3529 = ~ibuf_merge_en; // @[lsu_bus_buffer.scala 446:97]
  wire  _T_3530 = _T_3528 & _T_3529; // @[lsu_bus_buffer.scala 446:95]
  wire  _T_3531 = 2'h0 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_3532 = _T_3530 & _T_3531; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_3533 = ibuf_byp & io_ldst_dual_r; // @[lsu_bus_buffer.scala 446:144]
  wire  _T_3534 = 2'h0 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_3535 = _T_3533 & _T_3534; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_3536 = _T_3532 | _T_3535; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_3537 = _T_853 & _T_3536; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_3538 = 2'h0 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_3539 = ibuf_drain_vld & _T_3538; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_3540 = _T_3537 | _T_3539; // @[lsu_bus_buffer.scala 446:183]
  wire  bus_rsp_write = io_lsu_axi_b_valid & io_lsu_axi_b_ready; // @[lsu_bus_buffer.scala 568:39]
  wire  _T_3628 = io_lsu_axi_b_bits_id == 3'h0; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_3629 = bus_rsp_write & _T_3628; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_3630 = io_lsu_axi_r_bits_id == 3'h0; // @[lsu_bus_buffer.scala 474:46]
  reg  _T_4291; // @[Reg.scala 27:20]
  reg  _T_4289; // @[Reg.scala 27:20]
  reg  _T_4287; // @[Reg.scala 27:20]
  reg  _T_4285; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4291,_T_4289,_T_4287,_T_4285}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_373 = {{1'd0}, buf_ldfwdtag_0}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3632 = io_lsu_axi_r_bits_id == _GEN_373; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3633 = buf_ldfwd[0] & _T_3632; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_3634 = _T_3630 | _T_3633; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_3635 = buf_dual_0 & buf_dualhi_0; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_3637 = ~buf_write[0]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_3638 = _T_3635 & _T_3637; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_3639 = _T_3638 & buf_samedw_0; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_374 = {{1'd0}, buf_dualtag_0}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3640 = io_lsu_axi_r_bits_id == _GEN_374; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3641 = _T_3639 & _T_3640; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_3642 = _T_3634 | _T_3641; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_3643 = bus_rsp_read & _T_3642; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_3644 = _T_3629 | _T_3643; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_44 = _T_3585 & _T_3644; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_3551 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_3547 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_75; // @[Conditional.scala 40:58]
  wire [3:0] _T_3679 = buf_ldfwd >> buf_dualtag_0; // @[lsu_bus_buffer.scala 489:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_24 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_25 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_24; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_26 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_25; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_376 = {{1'd0}, _GEN_26}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3681 = io_lsu_axi_r_bits_id == _GEN_376; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3682 = _T_3679[0] & _T_3681; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_3683 = _T_3640 | _T_3682; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_3684 = bus_rsp_read & _T_3683; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_38 = _T_3669 & _T_3684; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3585 ? buf_resp_state_bus_en_0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_3551 ? buf_cmd_state_bus_en_0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3547 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  _T_3564 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_3565 = _T_3564 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire [1:0] RspPtr = _T_2059[1:0]; // @[lsu_bus_buffer.scala 396:10]
  wire  _T_3690 = RspPtr == 2'h0; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_3691 = buf_dualtag_0 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_3692 = buf_dual_0 & _T_3691; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_3693 = _T_3690 | _T_3692; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_3694 = _T_3693 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_33 = _T_3687 ? _T_3694 : _T_3695; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_3669 ? _T_3565 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_3585 ? _T_3565 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3551 ? _T_3565 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3547 ? obuf_rdrsp_pend_en : _GEN_56; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3524 ? _T_3540 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_2061 = _T_1785 & buf_state_en_0; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2067 = ibuf_drain_vld & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 410:23]
  wire  _T_2069 = _T_2067 & _T_3528; // @[lsu_bus_buffer.scala 410:41]
  wire  _T_2071 = _T_2069 & _T_1788; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2073 = _T_2071 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2074 = _T_4455 | _T_2073; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2075 = ibuf_byp & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 411:17]
  wire  _T_2076 = _T_2075 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 411:35]
  wire  _T_2078 = _T_2076 & _T_1789; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2080 = _T_2078 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2081 = _T_2074 | _T_2080; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2082 = _T_2061 & _T_2081; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2084 = _T_2082 | buf_age_0[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2098 = _T_2071 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2099 = _T_4460 | _T_2098; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2105 = _T_2078 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2106 = _T_2099 | _T_2105; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2107 = _T_2061 & _T_2106; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2109 = _T_2107 | buf_age_0[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2123 = _T_2071 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2124 = _T_4465 | _T_2123; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2130 = _T_2078 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2131 = _T_2124 | _T_2130; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2132 = _T_2061 & _T_2131; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2134 = _T_2132 | buf_age_0[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2148 = _T_2071 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2149 = _T_4470 | _T_2148; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2155 = _T_2078 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2156 = _T_2149 | _T_2155; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2157 = _T_2061 & _T_2156; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2159 = _T_2157 | buf_age_0[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2161 = {_T_2159,_T_2134,_T_2109}; // @[Cat.scala 29:58]
  wire  _T_3721 = 2'h1 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_3722 = _T_3530 & _T_3721; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_3724 = 2'h1 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_3725 = _T_3533 & _T_3724; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_3726 = _T_3722 | _T_3725; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_3727 = _T_853 & _T_3726; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_3728 = 2'h1 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_3729 = ibuf_drain_vld & _T_3728; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_3730 = _T_3727 | _T_3729; // @[lsu_bus_buffer.scala 446:183]
  wire  _T_3818 = io_lsu_axi_b_bits_id == 3'h1; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_3819 = bus_rsp_write & _T_3818; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_3820 = io_lsu_axi_r_bits_id == 3'h1; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_377 = {{1'd0}, buf_ldfwdtag_1}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3822 = io_lsu_axi_r_bits_id == _GEN_377; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3823 = buf_ldfwd[1] & _T_3822; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_3824 = _T_3820 | _T_3823; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_3825 = buf_dual_1 & buf_dualhi_1; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_3827 = ~buf_write[1]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_3828 = _T_3825 & _T_3827; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_3829 = _T_3828 & buf_samedw_1; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_378 = {{1'd0}, buf_dualtag_1}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3830 = io_lsu_axi_r_bits_id == _GEN_378; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3831 = _T_3829 & _T_3830; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_3832 = _T_3824 | _T_3831; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_3833 = bus_rsp_read & _T_3832; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_3834 = _T_3819 | _T_3833; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_121 = _T_3775 & _T_3834; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3741 ? 1'h0 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_152 = _T_3737 ? 1'h0 : _GEN_140; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3714 ? 1'h0 : _GEN_152; // @[Conditional.scala 40:58]
  wire [3:0] _T_3869 = buf_ldfwd >> buf_dualtag_1; // @[lsu_bus_buffer.scala 489:21]
  wire [1:0] _GEN_101 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_102 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_101; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_103 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_102; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_380 = {{1'd0}, _GEN_103}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3871 = io_lsu_axi_r_bits_id == _GEN_380; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3872 = _T_3869[0] & _T_3871; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_3873 = _T_3830 | _T_3872; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_3874 = bus_rsp_read & _T_3873; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_115 = _T_3859 & _T_3874; // @[Conditional.scala 39:67]
  wire  _GEN_122 = _T_3775 ? buf_resp_state_bus_en_1 : _GEN_115; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3741 ? buf_cmd_state_bus_en_1 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_145 = _T_3737 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3714 ? 1'h0 : _GEN_145; // @[Conditional.scala 40:58]
  wire  _T_3754 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_3755 = _T_3754 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire  _T_3880 = RspPtr == 2'h1; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_3881 = buf_dualtag_1 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_3882 = buf_dual_1 & _T_3881; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_3883 = _T_3880 | _T_3882; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_3884 = _T_3883 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_110 = _T_3877 ? _T_3884 : _T_3885; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3859 ? _T_3755 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_123 = _T_3775 ? _T_3755 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_133 = _T_3741 ? _T_3755 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_143 = _T_3737 ? obuf_rdrsp_pend_en : _GEN_133; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3714 ? _T_3730 : _GEN_143; // @[Conditional.scala 40:58]
  wire  _T_2163 = _T_1796 & buf_state_en_1; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2173 = _T_2069 & _T_1799; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2175 = _T_2173 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2176 = _T_4455 | _T_2175; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2180 = _T_2076 & _T_1800; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2182 = _T_2180 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2183 = _T_2176 | _T_2182; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2184 = _T_2163 & _T_2183; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2186 = _T_2184 | buf_age_1[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2200 = _T_2173 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2201 = _T_4460 | _T_2200; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2207 = _T_2180 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2208 = _T_2201 | _T_2207; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2209 = _T_2163 & _T_2208; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2211 = _T_2209 | buf_age_1[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2225 = _T_2173 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2226 = _T_4465 | _T_2225; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2232 = _T_2180 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2233 = _T_2226 | _T_2232; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2234 = _T_2163 & _T_2233; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2236 = _T_2234 | buf_age_1[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2250 = _T_2173 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2251 = _T_4470 | _T_2250; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2257 = _T_2180 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2258 = _T_2251 | _T_2257; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2259 = _T_2163 & _T_2258; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2261 = _T_2259 | buf_age_1[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2263 = {_T_2261,_T_2236,_T_2211}; // @[Cat.scala 29:58]
  wire  _T_3911 = 2'h2 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_3912 = _T_3530 & _T_3911; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_3914 = 2'h2 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_3915 = _T_3533 & _T_3914; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_3916 = _T_3912 | _T_3915; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_3917 = _T_853 & _T_3916; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_3918 = 2'h2 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_3919 = ibuf_drain_vld & _T_3918; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_3920 = _T_3917 | _T_3919; // @[lsu_bus_buffer.scala 446:183]
  wire  _T_4008 = io_lsu_axi_b_bits_id == 3'h2; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_4009 = bus_rsp_write & _T_4008; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_4010 = io_lsu_axi_r_bits_id == 3'h2; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_381 = {{1'd0}, buf_ldfwdtag_2}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4012 = io_lsu_axi_r_bits_id == _GEN_381; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4013 = buf_ldfwd[2] & _T_4012; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_4014 = _T_4010 | _T_4013; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_4015 = buf_dual_2 & buf_dualhi_2; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_4017 = ~buf_write[2]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_4018 = _T_4015 & _T_4017; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_4019 = _T_4018 & buf_samedw_2; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_382 = {{1'd0}, buf_dualtag_2}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4020 = io_lsu_axi_r_bits_id == _GEN_382; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4021 = _T_4019 & _T_4020; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_4022 = _T_4014 | _T_4021; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_4023 = bus_rsp_read & _T_4022; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_4024 = _T_4009 | _T_4023; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_198 = _T_3965 & _T_4024; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3931 ? 1'h0 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_229 = _T_3927 ? 1'h0 : _GEN_217; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3904 ? 1'h0 : _GEN_229; // @[Conditional.scala 40:58]
  wire [3:0] _T_4059 = buf_ldfwd >> buf_dualtag_2; // @[lsu_bus_buffer.scala 489:21]
  wire [1:0] _GEN_178 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_179 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_178; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_180 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_179; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_384 = {{1'd0}, _GEN_180}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4061 = io_lsu_axi_r_bits_id == _GEN_384; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4062 = _T_4059[0] & _T_4061; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_4063 = _T_4020 | _T_4062; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_4064 = bus_rsp_read & _T_4063; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_192 = _T_4049 & _T_4064; // @[Conditional.scala 39:67]
  wire  _GEN_199 = _T_3965 ? buf_resp_state_bus_en_2 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_209 = _T_3931 ? buf_cmd_state_bus_en_2 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3927 ? 1'h0 : _GEN_209; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3904 ? 1'h0 : _GEN_222; // @[Conditional.scala 40:58]
  wire  _T_3944 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_3945 = _T_3944 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire  _T_4070 = RspPtr == 2'h2; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_4071 = buf_dualtag_2 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_4072 = buf_dual_2 & _T_4071; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_4073 = _T_4070 | _T_4072; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_4074 = _T_4073 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_187 = _T_4067 ? _T_4074 : _T_4075; // @[Conditional.scala 39:67]
  wire  _GEN_193 = _T_4049 ? _T_3945 : _GEN_187; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3965 ? _T_3945 : _GEN_193; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3931 ? _T_3945 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3927 ? obuf_rdrsp_pend_en : _GEN_210; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3904 ? _T_3920 : _GEN_220; // @[Conditional.scala 40:58]
  wire  _T_2265 = _T_1807 & buf_state_en_2; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2275 = _T_2069 & _T_1810; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2277 = _T_2275 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2278 = _T_4455 | _T_2277; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2282 = _T_2076 & _T_1811; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2284 = _T_2282 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2285 = _T_2278 | _T_2284; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2286 = _T_2265 & _T_2285; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2288 = _T_2286 | buf_age_2[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2302 = _T_2275 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2303 = _T_4460 | _T_2302; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2309 = _T_2282 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2310 = _T_2303 | _T_2309; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2311 = _T_2265 & _T_2310; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2313 = _T_2311 | buf_age_2[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2327 = _T_2275 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2328 = _T_4465 | _T_2327; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2334 = _T_2282 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2335 = _T_2328 | _T_2334; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2336 = _T_2265 & _T_2335; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2338 = _T_2336 | buf_age_2[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2352 = _T_2275 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2353 = _T_4470 | _T_2352; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2359 = _T_2282 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2360 = _T_2353 | _T_2359; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2361 = _T_2265 & _T_2360; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2363 = _T_2361 | buf_age_2[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2365 = {_T_2363,_T_2338,_T_2313}; // @[Cat.scala 29:58]
  wire  _T_4101 = 2'h3 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_4102 = _T_3530 & _T_4101; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_4104 = 2'h3 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_4105 = _T_3533 & _T_4104; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_4106 = _T_4102 | _T_4105; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_4107 = _T_853 & _T_4106; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_4108 = 2'h3 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_4109 = ibuf_drain_vld & _T_4108; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_4110 = _T_4107 | _T_4109; // @[lsu_bus_buffer.scala 446:183]
  wire  _T_4198 = io_lsu_axi_b_bits_id == 3'h3; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_4199 = bus_rsp_write & _T_4198; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_4200 = io_lsu_axi_r_bits_id == 3'h3; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_385 = {{1'd0}, buf_ldfwdtag_3}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4202 = io_lsu_axi_r_bits_id == _GEN_385; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4203 = buf_ldfwd[3] & _T_4202; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_4204 = _T_4200 | _T_4203; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_4205 = buf_dual_3 & buf_dualhi_3; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_4207 = ~buf_write[3]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_4208 = _T_4205 & _T_4207; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_4209 = _T_4208 & buf_samedw_3; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_386 = {{1'd0}, buf_dualtag_3}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4210 = io_lsu_axi_r_bits_id == _GEN_386; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4211 = _T_4209 & _T_4210; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_4212 = _T_4204 | _T_4211; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_4213 = bus_rsp_read & _T_4212; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_4214 = _T_4199 | _T_4213; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_275 = _T_4155 & _T_4214; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4121 ? 1'h0 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_306 = _T_4117 ? 1'h0 : _GEN_294; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4094 ? 1'h0 : _GEN_306; // @[Conditional.scala 40:58]
  wire [3:0] _T_4249 = buf_ldfwd >> buf_dualtag_3; // @[lsu_bus_buffer.scala 489:21]
  wire [1:0] _GEN_255 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_256 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_255; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_257 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_256; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_388 = {{1'd0}, _GEN_257}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4251 = io_lsu_axi_r_bits_id == _GEN_388; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4252 = _T_4249[0] & _T_4251; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_4253 = _T_4210 | _T_4252; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_4254 = bus_rsp_read & _T_4253; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_269 = _T_4239 & _T_4254; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4155 ? buf_resp_state_bus_en_3 : _GEN_269; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4121 ? buf_cmd_state_bus_en_3 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4117 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4094 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4134 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_4135 = _T_4134 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire  _T_4260 = RspPtr == 2'h3; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_4261 = buf_dualtag_3 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_4262 = buf_dual_3 & _T_4261; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_4263 = _T_4260 | _T_4262; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_4264 = _T_4263 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_264 = _T_4257 ? _T_4264 : _T_4265; // @[Conditional.scala 39:67]
  wire  _GEN_270 = _T_4239 ? _T_4135 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_277 = _T_4155 ? _T_4135 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4121 ? _T_4135 : _GEN_277; // @[Conditional.scala 39:67]
  wire  _GEN_297 = _T_4117 ? obuf_rdrsp_pend_en : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4094 ? _T_4110 : _GEN_297; // @[Conditional.scala 40:58]
  wire  _T_2367 = _T_1818 & buf_state_en_3; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2377 = _T_2069 & _T_1821; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2379 = _T_2377 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2380 = _T_4455 | _T_2379; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2384 = _T_2076 & _T_1822; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2386 = _T_2384 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2387 = _T_2380 | _T_2386; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2388 = _T_2367 & _T_2387; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2390 = _T_2388 | buf_age_3[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2404 = _T_2377 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2405 = _T_4460 | _T_2404; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2411 = _T_2384 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2412 = _T_2405 | _T_2411; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2413 = _T_2367 & _T_2412; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2415 = _T_2413 | buf_age_3[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2429 = _T_2377 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2430 = _T_4465 | _T_2429; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2436 = _T_2384 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2437 = _T_2430 | _T_2436; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2438 = _T_2367 & _T_2437; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2440 = _T_2438 | buf_age_3[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2454 = _T_2377 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2455 = _T_4470 | _T_2454; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2461 = _T_2384 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2462 = _T_2455 | _T_2461; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2463 = _T_2367 & _T_2462; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2465 = _T_2463 | buf_age_3[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2467 = {_T_2465,_T_2440,_T_2415}; // @[Cat.scala 29:58]
  wire  _T_2763 = buf_state_0 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2764 = _T_1785 | _T_2763; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2765 = ~_T_2764; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2773 = _T_2765 | _T_2073; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2780 = _T_2773 | _T_2080; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2781 = _T_2061 & _T_2780; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2785 = buf_state_1 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2786 = _T_1796 | _T_2785; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2787 = ~_T_2786; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2795 = _T_2787 | _T_2098; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2802 = _T_2795 | _T_2105; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2803 = _T_2061 & _T_2802; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2807 = buf_state_2 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2808 = _T_1807 | _T_2807; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2809 = ~_T_2808; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2817 = _T_2809 | _T_2123; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2824 = _T_2817 | _T_2130; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2825 = _T_2061 & _T_2824; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2829 = buf_state_3 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2830 = _T_1818 | _T_2829; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2831 = ~_T_2830; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2839 = _T_2831 | _T_2148; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2846 = _T_2839 | _T_2155; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2847 = _T_2061 & _T_2846; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_0 = {_T_2847,_T_2825,_T_2803,_T_2781}; // @[Cat.scala 29:58]
  wire  _T_2864 = _T_2765 | _T_2175; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2871 = _T_2864 | _T_2182; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2872 = _T_2163 & _T_2871; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2886 = _T_2787 | _T_2200; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2893 = _T_2886 | _T_2207; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2894 = _T_2163 & _T_2893; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2908 = _T_2809 | _T_2225; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2915 = _T_2908 | _T_2232; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2916 = _T_2163 & _T_2915; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2930 = _T_2831 | _T_2250; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2937 = _T_2930 | _T_2257; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2938 = _T_2163 & _T_2937; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_1 = {_T_2938,_T_2916,_T_2894,_T_2872}; // @[Cat.scala 29:58]
  wire  _T_2955 = _T_2765 | _T_2277; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2962 = _T_2955 | _T_2284; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2963 = _T_2265 & _T_2962; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2977 = _T_2787 | _T_2302; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2984 = _T_2977 | _T_2309; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2985 = _T_2265 & _T_2984; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2999 = _T_2809 | _T_2327; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3006 = _T_2999 | _T_2334; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3007 = _T_2265 & _T_3006; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3021 = _T_2831 | _T_2352; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3028 = _T_3021 | _T_2359; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3029 = _T_2265 & _T_3028; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_2 = {_T_3029,_T_3007,_T_2985,_T_2963}; // @[Cat.scala 29:58]
  wire  _T_3046 = _T_2765 | _T_2379; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3053 = _T_3046 | _T_2386; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3054 = _T_2367 & _T_3053; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3068 = _T_2787 | _T_2404; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3075 = _T_3068 | _T_2411; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3076 = _T_2367 & _T_3075; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3090 = _T_2809 | _T_2429; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3097 = _T_3090 | _T_2436; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3098 = _T_2367 & _T_3097; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3112 = _T_2831 | _T_2454; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3119 = _T_3112 | _T_2461; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3120 = _T_2367 & _T_3119; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_3 = {_T_3120,_T_3098,_T_3076,_T_3054}; // @[Cat.scala 29:58]
  wire  _T_3211 = _T_2829 | _T_1818; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3212 = ~_T_3211; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3213 = buf_rspageQ_0[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3215 = _T_3213 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3203 = _T_2807 | _T_1807; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3204 = ~_T_3203; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3205 = buf_rspageQ_0[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3207 = _T_3205 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3195 = _T_2785 | _T_1796; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3196 = ~_T_3195; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3197 = buf_rspageQ_0[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3199 = _T_3197 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3187 = _T_2763 | _T_1785; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3188 = ~_T_3187; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3189 = buf_rspageQ_0[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3191 = _T_3189 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_0 = {_T_3215,_T_3207,_T_3199,_T_3191}; // @[Cat.scala 29:58]
  wire  _T_3126 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3129 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3132 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3135 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3137 = {_T_3135,_T_3132,_T_3129}; // @[Cat.scala 29:58]
  wire  _T_3248 = buf_rspageQ_1[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3250 = _T_3248 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3240 = buf_rspageQ_1[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3242 = _T_3240 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3232 = buf_rspageQ_1[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3234 = _T_3232 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3224 = buf_rspageQ_1[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3226 = _T_3224 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_1 = {_T_3250,_T_3242,_T_3234,_T_3226}; // @[Cat.scala 29:58]
  wire  _T_3141 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3144 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3147 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3150 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3152 = {_T_3150,_T_3147,_T_3144}; // @[Cat.scala 29:58]
  wire  _T_3283 = buf_rspageQ_2[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3285 = _T_3283 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3275 = buf_rspageQ_2[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3277 = _T_3275 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3267 = buf_rspageQ_2[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3269 = _T_3267 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3259 = buf_rspageQ_2[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3261 = _T_3259 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_2 = {_T_3285,_T_3277,_T_3269,_T_3261}; // @[Cat.scala 29:58]
  wire  _T_3156 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3159 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3162 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3165 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3167 = {_T_3165,_T_3162,_T_3159}; // @[Cat.scala 29:58]
  wire  _T_3318 = buf_rspageQ_3[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3320 = _T_3318 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3310 = buf_rspageQ_3[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3312 = _T_3310 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3302 = buf_rspageQ_3[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3304 = _T_3302 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3294 = buf_rspageQ_3[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3296 = _T_3294 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_3 = {_T_3320,_T_3312,_T_3304,_T_3296}; // @[Cat.scala 29:58]
  wire  _T_3171 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3174 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3177 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3180 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3182 = {_T_3180,_T_3177,_T_3174}; // @[Cat.scala 29:58]
  wire  _T_3325 = ibuf_drain_vld & _T_1786; // @[lsu_bus_buffer.scala 428:63]
  wire  _T_3327 = ibuf_drain_vld & _T_1797; // @[lsu_bus_buffer.scala 428:63]
  wire  _T_3329 = ibuf_drain_vld & _T_1808; // @[lsu_bus_buffer.scala 428:63]
  wire  _T_3331 = ibuf_drain_vld & _T_1819; // @[lsu_bus_buffer.scala 428:63]
  wire [3:0] ibuf_drainvec_vld = {_T_3331,_T_3329,_T_3327,_T_3325}; // @[Cat.scala 29:58]
  wire  _T_3339 = _T_3533 & _T_1789; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3348 = _T_3533 & _T_1800; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3357 = _T_3533 & _T_1811; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3366 = _T_3533 & _T_1822; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3396 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire  _T_3398 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire  _T_3400 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire  _T_3402 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire [3:0] buf_dual_in = {_T_3402,_T_3400,_T_3398,_T_3396}; // @[Cat.scala 29:58]
  wire  _T_3407 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire  _T_3409 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire  _T_3411 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire  _T_3413 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire [3:0] buf_samedw_in = {_T_3413,_T_3411,_T_3409,_T_3407}; // @[Cat.scala 29:58]
  wire  _T_3418 = ibuf_nomerge | ibuf_force_drain; // @[lsu_bus_buffer.scala 434:84]
  wire  _T_3419 = ibuf_drainvec_vld[0] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire  _T_3422 = ibuf_drainvec_vld[1] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire  _T_3425 = ibuf_drainvec_vld[2] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire  _T_3428 = ibuf_drainvec_vld[3] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire [3:0] buf_nomerge_in = {_T_3428,_T_3425,_T_3422,_T_3419}; // @[Cat.scala 29:58]
  wire  _T_3436 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3339; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3441 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3348; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3446 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3357; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3451 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3366; // @[lsu_bus_buffer.scala 435:47]
  wire [3:0] buf_dualhi_in = {_T_3451,_T_3446,_T_3441,_T_3436}; // @[Cat.scala 29:58]
  wire  _T_3480 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire  _T_3482 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire  _T_3484 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire  _T_3486 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire [3:0] buf_sideeffect_in = {_T_3486,_T_3484,_T_3482,_T_3480}; // @[Cat.scala 29:58]
  wire  _T_3491 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire  _T_3493 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire  _T_3495 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire  _T_3497 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire [3:0] buf_unsign_in = {_T_3497,_T_3495,_T_3493,_T_3491}; // @[Cat.scala 29:58]
  wire  _T_3514 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire  _T_3516 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire  _T_3518 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire  _T_3520 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire [3:0] buf_write_in = {_T_3520,_T_3518,_T_3516,_T_3514}; // @[Cat.scala 29:58]
  wire  _T_3553 = obuf_nosend & bus_rsp_read; // @[lsu_bus_buffer.scala 458:89]
  wire  _T_3555 = _T_3553 & _T_1349; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_3568 = buf_state_en_0 & _T_3637; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_3569 = _T_3568 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_3571 = _T_3569 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_3574 = _T_3564 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_3575 = _T_3574 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_4830 = io_lsu_axi_r_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 572:64]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4830; // @[lsu_bus_buffer.scala 572:38]
  wire  _T_3578 = _T_3574 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_3651 = bus_rsp_read_error & _T_3630; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_3653 = bus_rsp_read_error & buf_ldfwd[0]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_3655 = _T_3653 & _T_3632; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_3656 = _T_3651 | _T_3655; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4828 = io_lsu_axi_b_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 571:66]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4828; // @[lsu_bus_buffer.scala 571:40]
  wire  _T_3658 = bus_rsp_write_error & _T_3628; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_3659 = _T_3656 | _T_3658; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_3660 = _T_3564 & _T_3659; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_48 = _T_3585 & _T_3660; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3551 ? _T_3578 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3547 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3524 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3587 = buf_write[0] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3588 = io_dec_tlu_force_halt | _T_3587; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_3590 = ~buf_samedw_0; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3591 = buf_dual_0 & _T_3590; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3594 = _T_3591 & _T_3637; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_20 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_21 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_20; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_22 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_21; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3595 = _GEN_22 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3596 = _T_3594 & _T_3595; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_4478 = _T_2710 | _T_2707; // @[lsu_bus_buffer.scala 532:93]
  wire  _T_4479 = _T_4478 | _T_2704; // @[lsu_bus_buffer.scala 532:93]
  wire  any_done_wait_state = _T_4479 | _T_2701; // @[lsu_bus_buffer.scala 532:93]
  wire  _T_3598 = buf_ldfwd[0] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3604 = buf_dualtag_0 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3606 = buf_dualtag_0 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3608 = buf_dualtag_0 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3610 = buf_dualtag_0 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3612 = _T_3604 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3613 = _T_3606 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3614 = _T_3608 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3615 = _T_3610 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3616 = _T_3612 | _T_3613; // @[Mux.scala 27:72]
  wire  _T_3617 = _T_3616 | _T_3614; // @[Mux.scala 27:72]
  wire  _T_3618 = _T_3617 | _T_3615; // @[Mux.scala 27:72]
  wire  _T_3620 = _T_3594 & _T_3618; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_3621 = _GEN_22 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_3622 = _T_3620 & _T_3621; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_3623 = _T_3622 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_3624 = _T_3598 | _T_3623; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_3647 = buf_state_bus_en_0 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_3648 = _T_3647 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_3661 = ~buf_error_en_0; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_3662 = buf_state_en_0 & _T_3661; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_3674 = buf_ldfwd[0] | _T_3679[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_3675 = _T_3674 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_28 = _T_3695 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_3695 ? buf_state_en_0 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_3687 ? io_dec_tlu_force_halt : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_3687 ? io_dec_tlu_force_halt : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_3669 ? io_dec_tlu_force_halt : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_3669 ? io_dec_tlu_force_halt : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_3585 & _T_3648; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_3585 ? io_dec_tlu_force_halt : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_3585 ? io_dec_tlu_force_halt : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3551 ? _T_3571 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_3551 ? _T_3575 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3551 ? io_dec_tlu_force_halt : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3547 ? io_dec_tlu_force_halt : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_3547 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_3547 ? io_dec_tlu_force_halt : _GEN_64; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3524 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3524 ? io_dec_tlu_force_halt : _GEN_70; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3524 ? io_dec_tlu_force_halt : _GEN_76; // @[Conditional.scala 40:58]
  wire  _T_3758 = buf_state_en_1 & _T_3827; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_3759 = _T_3758 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_3761 = _T_3759 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_3764 = _T_3754 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_3765 = _T_3764 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_3768 = _T_3764 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_3841 = bus_rsp_read_error & _T_3820; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_3843 = bus_rsp_read_error & buf_ldfwd[1]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_3845 = _T_3843 & _T_3822; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_3846 = _T_3841 | _T_3845; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_3848 = bus_rsp_write_error & _T_3818; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_3849 = _T_3846 | _T_3848; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_3850 = _T_3754 & _T_3849; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_125 = _T_3775 & _T_3850; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3741 ? _T_3768 : _GEN_125; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3737 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3714 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3777 = buf_write[1] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3778 = io_dec_tlu_force_halt | _T_3777; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_3780 = ~buf_samedw_1; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3781 = buf_dual_1 & _T_3780; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3784 = _T_3781 & _T_3827; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_97 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_98 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_97; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_99 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_98; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3785 = _GEN_99 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3786 = _T_3784 & _T_3785; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_3788 = buf_ldfwd[1] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3794 = buf_dualtag_1 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3796 = buf_dualtag_1 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3798 = buf_dualtag_1 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3800 = buf_dualtag_1 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3802 = _T_3794 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3803 = _T_3796 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3804 = _T_3798 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3805 = _T_3800 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3806 = _T_3802 | _T_3803; // @[Mux.scala 27:72]
  wire  _T_3807 = _T_3806 | _T_3804; // @[Mux.scala 27:72]
  wire  _T_3808 = _T_3807 | _T_3805; // @[Mux.scala 27:72]
  wire  _T_3810 = _T_3784 & _T_3808; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_3811 = _GEN_99 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_3812 = _T_3810 & _T_3811; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_3813 = _T_3812 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_3814 = _T_3788 | _T_3813; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_3837 = buf_state_bus_en_1 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_3838 = _T_3837 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_3851 = ~buf_error_en_1; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_3852 = buf_state_en_1 & _T_3851; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_3864 = buf_ldfwd[1] | _T_3869[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_3865 = _T_3864 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_105 = _T_3885 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3885 ? buf_state_en_1 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_112 = _T_3877 ? io_dec_tlu_force_halt : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3877 ? io_dec_tlu_force_halt : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_118 = _T_3859 ? io_dec_tlu_force_halt : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3859 ? io_dec_tlu_force_halt : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3775 & _T_3838; // @[Conditional.scala 39:67]
  wire  _GEN_128 = _T_3775 ? io_dec_tlu_force_halt : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3775 ? io_dec_tlu_force_halt : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3741 ? _T_3761 : _GEN_129; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3741 ? _T_3765 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3741 ? io_dec_tlu_force_halt : _GEN_128; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3737 ? io_dec_tlu_force_halt : _GEN_135; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3737 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  _GEN_153 = _T_3737 ? io_dec_tlu_force_halt : _GEN_141; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3714 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3714 ? io_dec_tlu_force_halt : _GEN_147; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3714 ? io_dec_tlu_force_halt : _GEN_153; // @[Conditional.scala 40:58]
  wire  _T_3948 = buf_state_en_2 & _T_4017; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_3949 = _T_3948 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_3951 = _T_3949 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_3954 = _T_3944 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_3955 = _T_3954 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_3958 = _T_3954 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_4031 = bus_rsp_read_error & _T_4010; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_4033 = bus_rsp_read_error & buf_ldfwd[2]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_4035 = _T_4033 & _T_4012; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_4036 = _T_4031 | _T_4035; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4038 = bus_rsp_write_error & _T_4008; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_4039 = _T_4036 | _T_4038; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_4040 = _T_3944 & _T_4039; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_202 = _T_3965 & _T_4040; // @[Conditional.scala 39:67]
  wire  _GEN_215 = _T_3931 ? _T_3958 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_227 = _T_3927 ? 1'h0 : _GEN_215; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3904 ? 1'h0 : _GEN_227; // @[Conditional.scala 40:58]
  wire  _T_3967 = buf_write[2] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3968 = io_dec_tlu_force_halt | _T_3967; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_3970 = ~buf_samedw_2; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3971 = buf_dual_2 & _T_3970; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3974 = _T_3971 & _T_4017; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_174 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_175 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_174; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_176 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_175; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3975 = _GEN_176 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3976 = _T_3974 & _T_3975; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_3978 = buf_ldfwd[2] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3984 = buf_dualtag_2 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3986 = buf_dualtag_2 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3988 = buf_dualtag_2 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3990 = buf_dualtag_2 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3992 = _T_3984 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3993 = _T_3986 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3994 = _T_3988 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3995 = _T_3990 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3996 = _T_3992 | _T_3993; // @[Mux.scala 27:72]
  wire  _T_3997 = _T_3996 | _T_3994; // @[Mux.scala 27:72]
  wire  _T_3998 = _T_3997 | _T_3995; // @[Mux.scala 27:72]
  wire  _T_4000 = _T_3974 & _T_3998; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_4001 = _GEN_176 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_4002 = _T_4000 & _T_4001; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_4003 = _T_4002 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_4004 = _T_3978 | _T_4003; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_4027 = buf_state_bus_en_2 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_4028 = _T_4027 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_4041 = ~buf_error_en_2; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_4042 = buf_state_en_2 & _T_4041; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_4054 = buf_ldfwd[2] | _T_4059[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_4055 = _T_4054 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_182 = _T_4075 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_185 = _T_4075 ? buf_state_en_2 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4067 ? io_dec_tlu_force_halt : _GEN_182; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4067 ? io_dec_tlu_force_halt : _GEN_185; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_4049 ? io_dec_tlu_force_halt : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_4049 ? io_dec_tlu_force_halt : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_201 = _T_3965 & _T_4028; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3965 ? io_dec_tlu_force_halt : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3965 ? io_dec_tlu_force_halt : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_212 = _T_3931 ? _T_3951 : _GEN_206; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3931 ? _T_3955 : _GEN_201; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3931 ? io_dec_tlu_force_halt : _GEN_205; // @[Conditional.scala 39:67]
  wire  _GEN_224 = _T_3927 ? io_dec_tlu_force_halt : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3927 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  _GEN_230 = _T_3927 ? io_dec_tlu_force_halt : _GEN_218; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3904 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3904 ? io_dec_tlu_force_halt : _GEN_224; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3904 ? io_dec_tlu_force_halt : _GEN_230; // @[Conditional.scala 40:58]
  wire  _T_4138 = buf_state_en_3 & _T_4207; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_4139 = _T_4138 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_4141 = _T_4139 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_4144 = _T_4134 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_4145 = _T_4144 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_4148 = _T_4144 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_4221 = bus_rsp_read_error & _T_4200; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_4223 = bus_rsp_read_error & buf_ldfwd[3]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_4225 = _T_4223 & _T_4202; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_4226 = _T_4221 | _T_4225; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4228 = bus_rsp_write_error & _T_4198; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_4229 = _T_4226 | _T_4228; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_4230 = _T_4134 & _T_4229; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_279 = _T_4155 & _T_4230; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4121 ? _T_4148 : _GEN_279; // @[Conditional.scala 39:67]
  wire  _GEN_304 = _T_4117 ? 1'h0 : _GEN_292; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4094 ? 1'h0 : _GEN_304; // @[Conditional.scala 40:58]
  wire  _T_4157 = buf_write[3] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_4158 = io_dec_tlu_force_halt | _T_4157; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_4160 = ~buf_samedw_3; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_4161 = buf_dual_3 & _T_4160; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_4164 = _T_4161 & _T_4207; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_251; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_252; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_4165 = _GEN_253 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_4166 = _T_4164 & _T_4165; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_4168 = buf_ldfwd[3] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_4174 = buf_dualtag_3 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4176 = buf_dualtag_3 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4178 = buf_dualtag_3 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4180 = buf_dualtag_3 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4182 = _T_4174 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4183 = _T_4176 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4184 = _T_4178 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4185 = _T_4180 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4186 = _T_4182 | _T_4183; // @[Mux.scala 27:72]
  wire  _T_4187 = _T_4186 | _T_4184; // @[Mux.scala 27:72]
  wire  _T_4188 = _T_4187 | _T_4185; // @[Mux.scala 27:72]
  wire  _T_4190 = _T_4164 & _T_4188; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_4191 = _GEN_253 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_4192 = _T_4190 & _T_4191; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_4193 = _T_4192 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_4194 = _T_4168 | _T_4193; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_4217 = buf_state_bus_en_3 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_4218 = _T_4217 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_4231 = ~buf_error_en_3; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_4232 = buf_state_en_3 & _T_4231; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_4244 = buf_ldfwd[3] | _T_4249[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_4245 = _T_4244 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_259 = _T_4265 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4265 ? buf_state_en_3 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4257 ? io_dec_tlu_force_halt : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_267 = _T_4257 ? io_dec_tlu_force_halt : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4239 ? io_dec_tlu_force_halt : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4239 ? io_dec_tlu_force_halt : _GEN_267; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4155 & _T_4218; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4155 ? io_dec_tlu_force_halt : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_283 = _T_4155 ? io_dec_tlu_force_halt : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4121 ? _T_4141 : _GEN_283; // @[Conditional.scala 39:67]
  wire  _GEN_291 = _T_4121 ? _T_4145 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_295 = _T_4121 ? io_dec_tlu_force_halt : _GEN_282; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4117 ? io_dec_tlu_force_halt : _GEN_289; // @[Conditional.scala 39:67]
  wire  _GEN_303 = _T_4117 ? 1'h0 : _GEN_291; // @[Conditional.scala 39:67]
  wire  _GEN_307 = _T_4117 ? io_dec_tlu_force_halt : _GEN_295; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4094 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4094 ? io_dec_tlu_force_halt : _GEN_301; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4094 ? io_dec_tlu_force_halt : _GEN_307; // @[Conditional.scala 40:58]
  reg  _T_4320; // @[Reg.scala 27:20]
  reg  _T_4323; // @[Reg.scala 27:20]
  reg  _T_4326; // @[Reg.scala 27:20]
  reg  _T_4329; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4329,_T_4326,_T_4323,_T_4320}; // @[Cat.scala 29:58]
  reg  _T_4395; // @[lsu_bus_buffer.scala 526:80]
  reg  _T_4390; // @[lsu_bus_buffer.scala 526:80]
  reg  _T_4385; // @[lsu_bus_buffer.scala 526:80]
  reg  _T_4380; // @[lsu_bus_buffer.scala 526:80]
  wire [3:0] buf_error = {_T_4395,_T_4390,_T_4385,_T_4380}; // @[Cat.scala 29:58]
  wire  _T_4377 = buf_error_en_0 | buf_error[0]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4378 = ~buf_rst_0; // @[lsu_bus_buffer.scala 526:126]
  wire  _T_4382 = buf_error_en_1 | buf_error[1]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4383 = ~buf_rst_1; // @[lsu_bus_buffer.scala 526:126]
  wire  _T_4387 = buf_error_en_2 | buf_error[2]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4388 = ~buf_rst_2; // @[lsu_bus_buffer.scala 526:126]
  wire  _T_4392 = buf_error_en_3 | buf_error[3]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4393 = ~buf_rst_3; // @[lsu_bus_buffer.scala 526:126]
  wire [1:0] _T_4399 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4400 = io_ldst_dual_m ? _T_4399 : {{1'd0}, io_lsu_busreq_m}; // @[lsu_bus_buffer.scala 528:28]
  wire [1:0] _T_4401 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4402 = io_ldst_dual_r ? _T_4401 : {{1'd0}, io_lsu_busreq_r}; // @[lsu_bus_buffer.scala 528:94]
  wire [2:0] _T_4403 = _T_4400 + _T_4402; // @[lsu_bus_buffer.scala 528:88]
  wire [2:0] _GEN_393 = {{2'd0}, ibuf_valid}; // @[lsu_bus_buffer.scala 528:154]
  wire [3:0] _T_4404 = _T_4403 + _GEN_393; // @[lsu_bus_buffer.scala 528:154]
  wire [1:0] _T_4409 = _T_5 + _T_12; // @[lsu_bus_buffer.scala 528:217]
  wire [1:0] _GEN_394 = {{1'd0}, _T_19}; // @[lsu_bus_buffer.scala 528:217]
  wire [2:0] _T_4410 = _T_4409 + _GEN_394; // @[lsu_bus_buffer.scala 528:217]
  wire [2:0] _GEN_395 = {{2'd0}, _T_26}; // @[lsu_bus_buffer.scala 528:217]
  wire [3:0] _T_4411 = _T_4410 + _GEN_395; // @[lsu_bus_buffer.scala 528:217]
  wire [3:0] buf_numvld_any = _T_4404 + _T_4411; // @[lsu_bus_buffer.scala 528:169]
  wire  _T_4482 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[lsu_bus_buffer.scala 534:52]
  wire  _T_4483 = buf_numvld_any >= 4'h3; // @[lsu_bus_buffer.scala 534:92]
  wire  _T_4484 = buf_numvld_any == 4'h4; // @[lsu_bus_buffer.scala 534:121]
  wire  _T_4486 = |buf_state_0; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4487 = |buf_state_1; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4488 = |buf_state_2; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4489 = |buf_state_3; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4490 = _T_4486 | _T_4487; // @[lsu_bus_buffer.scala 535:65]
  wire  _T_4491 = _T_4490 | _T_4488; // @[lsu_bus_buffer.scala 535:65]
  wire  _T_4492 = _T_4491 | _T_4489; // @[lsu_bus_buffer.scala 535:65]
  wire  _T_4493 = ~_T_4492; // @[lsu_bus_buffer.scala 535:34]
  wire  _T_4495 = _T_4493 & _T_852; // @[lsu_bus_buffer.scala 535:70]
  wire  _T_4498 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[lsu_bus_buffer.scala 537:64]
  wire  _T_4499 = _T_4498 & io_lsu_pkt_m_bits_load; // @[lsu_bus_buffer.scala 537:85]
  wire  _T_4500 = ~io_flush_m_up; // @[lsu_bus_buffer.scala 537:112]
  wire  _T_4501 = _T_4499 & _T_4500; // @[lsu_bus_buffer.scala 537:110]
  wire  _T_4502 = ~io_ld_full_hit_m; // @[lsu_bus_buffer.scala 537:129]
  wire  _T_4504 = ~io_lsu_commit_r; // @[lsu_bus_buffer.scala 540:74]
  reg  lsu_nonblock_load_valid_r; // @[lsu_bus_buffer.scala 625:66]
  wire  _T_4518 = _T_2763 & _T_3637; // @[Mux.scala 27:72]
  wire  _T_4519 = _T_2785 & _T_3827; // @[Mux.scala 27:72]
  wire  _T_4520 = _T_2807 & _T_4017; // @[Mux.scala 27:72]
  wire  _T_4521 = _T_2829 & _T_4207; // @[Mux.scala 27:72]
  wire  _T_4522 = _T_4518 | _T_4519; // @[Mux.scala 27:72]
  wire  _T_4523 = _T_4522 | _T_4520; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4523 | _T_4521; // @[Mux.scala 27:72]
  wire  _T_4529 = buf_error[0] & _T_3637; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4534 = buf_error[1] & _T_3827; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4539 = buf_error[2] & _T_4017; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4544 = buf_error[3] & _T_4207; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4545 = _T_2763 & _T_4529; // @[Mux.scala 27:72]
  wire  _T_4546 = _T_2785 & _T_4534; // @[Mux.scala 27:72]
  wire  _T_4547 = _T_2807 & _T_4539; // @[Mux.scala 27:72]
  wire  _T_4548 = _T_2829 & _T_4544; // @[Mux.scala 27:72]
  wire  _T_4549 = _T_4545 | _T_4546; // @[Mux.scala 27:72]
  wire  _T_4550 = _T_4549 | _T_4547; // @[Mux.scala 27:72]
  wire  _T_4557 = ~buf_dual_0; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4558 = ~buf_dualhi_0; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4559 = _T_4557 | _T_4558; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4560 = _T_4518 & _T_4559; // @[lsu_bus_buffer.scala 544:119]
  wire  _T_4565 = ~buf_dual_1; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4566 = ~buf_dualhi_1; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4567 = _T_4565 | _T_4566; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4568 = _T_4519 & _T_4567; // @[lsu_bus_buffer.scala 544:119]
  wire  _T_4573 = ~buf_dual_2; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4574 = ~buf_dualhi_2; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4575 = _T_4573 | _T_4574; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4576 = _T_4520 & _T_4575; // @[lsu_bus_buffer.scala 544:119]
  wire  _T_4581 = ~buf_dual_3; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4582 = ~buf_dualhi_3; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4583 = _T_4581 | _T_4582; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4584 = _T_4521 & _T_4583; // @[lsu_bus_buffer.scala 544:119]
  wire [1:0] _T_4587 = _T_4576 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4588 = _T_4584 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_396 = {{1'd0}, _T_4568}; // @[Mux.scala 27:72]
  wire [1:0] _T_4590 = _GEN_396 | _T_4587; // @[Mux.scala 27:72]
  wire [31:0] _T_4625 = _T_4560 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4626 = _T_4568 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4627 = _T_4576 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4628 = _T_4584 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4629 = _T_4625 | _T_4626; // @[Mux.scala 27:72]
  wire [31:0] _T_4630 = _T_4629 | _T_4627; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4630 | _T_4628; // @[Mux.scala 27:72]
  wire  _T_4637 = _T_4518 & _T_3635; // @[lsu_bus_buffer.scala 546:105]
  wire  _T_4643 = _T_4519 & _T_3825; // @[lsu_bus_buffer.scala 546:105]
  wire  _T_4649 = _T_4520 & _T_4015; // @[lsu_bus_buffer.scala 546:105]
  wire  _T_4655 = _T_4521 & _T_4205; // @[lsu_bus_buffer.scala 546:105]
  wire [31:0] _T_4656 = _T_4637 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4657 = _T_4643 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4658 = _T_4649 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4659 = _T_4655 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4660 = _T_4656 | _T_4657; // @[Mux.scala 27:72]
  wire [31:0] _T_4661 = _T_4660 | _T_4658; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4661 | _T_4659; // @[Mux.scala 27:72]
  wire  _T_4663 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h0; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4664 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h1; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4665 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h2; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4666 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h3; // @[lsu_bus_buffer.scala 61:123]
  wire [31:0] _T_4667 = _T_4663 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4668 = _T_4664 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4669 = _T_4665 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4670 = _T_4666 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4667 | _T_4668; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4671 | _T_4669; // @[Mux.scala 27:72]
  wire [31:0] _T_4673 = _T_4672 | _T_4670; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4673[1:0]; // @[lsu_bus_buffer.scala 547:96]
  wire [1:0] _T_4679 = _T_4663 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4680 = _T_4664 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4681 = _T_4665 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4682 = _T_4666 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4683 = _T_4679 | _T_4680; // @[Mux.scala 27:72]
  wire [1:0] _T_4684 = _T_4683 | _T_4681; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4684 | _T_4682; // @[Mux.scala 27:72]
  wire  _T_4694 = _T_4663 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4695 = _T_4664 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4696 = _T_4665 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4697 = _T_4666 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4698 = _T_4694 | _T_4695; // @[Mux.scala 27:72]
  wire  _T_4699 = _T_4698 | _T_4696; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4699 | _T_4697; // @[Mux.scala 27:72]
  wire [63:0] _T_4701 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_397 = {{2'd0}, lsu_nonblock_addr_offset}; // @[lsu_bus_buffer.scala 551:121]
  wire [5:0] _T_4702 = _GEN_397 * 4'h8; // @[lsu_bus_buffer.scala 551:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4701 >> _T_4702; // @[lsu_bus_buffer.scala 551:92]
  wire  _T_4703 = ~io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_buffer.scala 553:82]
  wire  _T_4705 = lsu_nonblock_sz == 2'h0; // @[lsu_bus_buffer.scala 554:94]
  wire  _T_4706 = lsu_nonblock_unsign & _T_4705; // @[lsu_bus_buffer.scala 554:76]
  wire [31:0] _T_4708 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4709 = lsu_nonblock_sz == 2'h1; // @[lsu_bus_buffer.scala 555:45]
  wire  _T_4710 = lsu_nonblock_unsign & _T_4709; // @[lsu_bus_buffer.scala 555:26]
  wire [31:0] _T_4712 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4713 = ~lsu_nonblock_unsign; // @[lsu_bus_buffer.scala 556:6]
  wire  _T_4715 = _T_4713 & _T_4705; // @[lsu_bus_buffer.scala 556:27]
  wire [23:0] _T_4718 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4720 = {_T_4718,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4723 = _T_4713 & _T_4709; // @[lsu_bus_buffer.scala 557:27]
  wire [15:0] _T_4726 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4728 = {_T_4726,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4729 = lsu_nonblock_sz == 2'h2; // @[lsu_bus_buffer.scala 558:21]
  wire [31:0] _T_4730 = _T_4706 ? _T_4708 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4731 = _T_4710 ? _T_4712 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4732 = _T_4715 ? _T_4720 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4733 = _T_4723 ? _T_4728 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4734 = _T_4729 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4735 = _T_4730 | _T_4731; // @[Mux.scala 27:72]
  wire [31:0] _T_4736 = _T_4735 | _T_4732; // @[Mux.scala 27:72]
  wire [31:0] _T_4737 = _T_4736 | _T_4733; // @[Mux.scala 27:72]
  wire [63:0] _GEN_398 = {{32'd0}, _T_4737}; // @[Mux.scala 27:72]
  wire [63:0] _T_4738 = _GEN_398 | _T_4734; // @[Mux.scala 27:72]
  wire  _T_4832 = obuf_valid & obuf_write; // @[lsu_bus_buffer.scala 576:37]
  wire  _T_4833 = ~obuf_cmd_done; // @[lsu_bus_buffer.scala 576:52]
  wire  _T_4834 = _T_4832 & _T_4833; // @[lsu_bus_buffer.scala 576:50]
  wire [31:0] _T_4838 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4840 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4845 = ~obuf_data_done; // @[lsu_bus_buffer.scala 588:51]
  wire  _T_4846 = _T_4832 & _T_4845; // @[lsu_bus_buffer.scala 588:49]
  wire [7:0] _T_4850 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4853 = obuf_valid & _T_1341; // @[lsu_bus_buffer.scala 593:37]
  wire  _T_4855 = _T_4853 & _T_1347; // @[lsu_bus_buffer.scala 593:51]
  wire  _T_4867 = io_lsu_bus_clk_en_q & buf_error[0]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4869 = _T_4867 & buf_write[0]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4872 = io_lsu_bus_clk_en_q & buf_error[1]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4874 = _T_4872 & buf_write[1]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4877 = io_lsu_bus_clk_en_q & buf_error[2]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4879 = _T_4877 & buf_write[2]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4882 = io_lsu_bus_clk_en_q & buf_error[3]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4884 = _T_4882 & buf_write[3]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4885 = _T_2763 & _T_4869; // @[Mux.scala 27:72]
  wire  _T_4886 = _T_2785 & _T_4874; // @[Mux.scala 27:72]
  wire  _T_4887 = _T_2807 & _T_4879; // @[Mux.scala 27:72]
  wire  _T_4888 = _T_2829 & _T_4884; // @[Mux.scala 27:72]
  wire  _T_4889 = _T_4885 | _T_4886; // @[Mux.scala 27:72]
  wire  _T_4890 = _T_4889 | _T_4887; // @[Mux.scala 27:72]
  wire  _T_4900 = _T_2785 & buf_error[1]; // @[lsu_bus_buffer.scala 607:93]
  wire  _T_4902 = _T_4900 & buf_write[1]; // @[lsu_bus_buffer.scala 607:108]
  wire  _T_4905 = _T_2807 & buf_error[2]; // @[lsu_bus_buffer.scala 607:93]
  wire  _T_4907 = _T_4905 & buf_write[2]; // @[lsu_bus_buffer.scala 607:108]
  wire  _T_4910 = _T_2829 & buf_error[3]; // @[lsu_bus_buffer.scala 607:93]
  wire  _T_4912 = _T_4910 & buf_write[3]; // @[lsu_bus_buffer.scala 607:108]
  wire [1:0] _T_4915 = _T_4907 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4916 = _T_4912 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_399 = {{1'd0}, _T_4902}; // @[Mux.scala 27:72]
  wire [1:0] _T_4918 = _GEN_399 | _T_4915; // @[Mux.scala 27:72]
  wire [1:0] lsu_imprecise_error_store_tag = _T_4918 | _T_4916; // @[Mux.scala 27:72]
  wire  _T_4920 = ~io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 609:97]
  wire [31:0] _GEN_356 = 2'h1 == lsu_imprecise_error_store_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_357 = 2'h2 == lsu_imprecise_error_store_tag ? buf_addr_2 : _GEN_356; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_358 = 2'h3 == lsu_imprecise_error_store_tag ? buf_addr_3 : _GEN_357; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_360 = 2'h1 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_361 = 2'h2 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_2 : _GEN_360; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_362 = 2'h3 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_3 : _GEN_361; // @[lsu_bus_buffer.scala 610:53]
  wire  _T_4925 = bus_wcmd_sent | bus_wdata_sent; // @[lsu_bus_buffer.scala 616:82]
  wire  _T_4928 = io_lsu_busreq_r & io_ldst_dual_r; // @[lsu_bus_buffer.scala 617:60]
  wire  _T_4931 = ~io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 620:61]
  wire  _T_4932 = io_lsu_axi_aw_valid & _T_4931; // @[lsu_bus_buffer.scala 620:59]
  wire  _T_4933 = ~io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 620:107]
  wire  _T_4934 = io_lsu_axi_w_valid & _T_4933; // @[lsu_bus_buffer.scala 620:105]
  wire  _T_4935 = _T_4932 | _T_4934; // @[lsu_bus_buffer.scala 620:83]
  wire  _T_4936 = ~io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 620:153]
  wire  _T_4937 = io_lsu_axi_ar_valid & _T_4936; // @[lsu_bus_buffer.scala 620:151]
  wire  _T_4941 = ~io_flush_r; // @[lsu_bus_buffer.scala 624:75]
  wire  _T_4942 = io_lsu_busreq_m & _T_4941; // @[lsu_bus_buffer.scala 624:73]
  reg  _T_4945; // @[lsu_bus_buffer.scala 624:56]
  rvclkhdr rvclkhdr ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 390:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  assign io_tlu_busbuff_lsu_pmu_bus_trxn = _T_4925 | _T_4824; // @[lsu_bus_buffer.scala 616:35]
  assign io_tlu_busbuff_lsu_pmu_bus_misaligned = _T_4928 & io_lsu_commit_r; // @[lsu_bus_buffer.scala 617:41]
  assign io_tlu_busbuff_lsu_pmu_bus_error = io_tlu_busbuff_lsu_imprecise_error_load_any | io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 618:36]
  assign io_tlu_busbuff_lsu_pmu_bus_busy = _T_4935 | _T_4937; // @[lsu_bus_buffer.scala 620:35]
  assign io_tlu_busbuff_lsu_imprecise_error_load_any = io_dctl_busbuff_lsu_nonblock_load_data_error & _T_4920; // @[lsu_bus_buffer.scala 609:47]
  assign io_tlu_busbuff_lsu_imprecise_error_store_any = _T_4890 | _T_4888; // @[lsu_bus_buffer.scala 606:48]
  assign io_tlu_busbuff_lsu_imprecise_error_addr_any = io_tlu_busbuff_lsu_imprecise_error_store_any ? _GEN_358 : _GEN_362; // @[lsu_bus_buffer.scala 610:47]
  assign io_dctl_busbuff_lsu_nonblock_load_valid_m = _T_4501 & _T_4502; // @[lsu_bus_buffer.scala 537:45]
  assign io_dctl_busbuff_lsu_nonblock_load_tag_m = _T_1795 ? 2'h0 : _T_1831; // @[lsu_bus_buffer.scala 538:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4504; // @[lsu_bus_buffer.scala 540:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[lsu_bus_buffer.scala 541:47]
  assign io_dctl_busbuff_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4703; // @[lsu_bus_buffer.scala 553:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_error = _T_4550 | _T_4548; // @[lsu_bus_buffer.scala 543:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_tag = _T_4590 | _T_4588; // @[lsu_bus_buffer.scala 544:46]
  assign io_dctl_busbuff_lsu_nonblock_load_data = _T_4738[31:0]; // @[lsu_bus_buffer.scala 554:42]
  assign io_lsu_axi_aw_valid = _T_4834 & _T_1237; // @[lsu_bus_buffer.scala 576:23]
  assign io_lsu_axi_aw_bits_id = {{1'd0}, _T_1780}; // @[lsu_bus_buffer.scala 577:25]
  assign io_lsu_axi_aw_bits_addr = obuf_sideeffect ? obuf_addr : _T_4838; // @[lsu_bus_buffer.scala 578:27]
  assign io_lsu_axi_aw_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 582:29]
  assign io_lsu_axi_aw_bits_len = 8'h0; // @[lsu_bus_buffer.scala 583:26]
  assign io_lsu_axi_aw_bits_size = obuf_sideeffect ? _T_4840 : 3'h3; // @[lsu_bus_buffer.scala 579:27]
  assign io_lsu_axi_aw_bits_burst = 2'h1; // @[lsu_bus_buffer.scala 584:28]
  assign io_lsu_axi_aw_bits_lock = 1'h0; // @[lsu_bus_buffer.scala 586:27]
  assign io_lsu_axi_aw_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 581:28]
  assign io_lsu_axi_aw_bits_prot = 3'h1; // @[lsu_bus_buffer.scala 580:27]
  assign io_lsu_axi_aw_bits_qos = 4'h0; // @[lsu_bus_buffer.scala 585:26]
  assign io_lsu_axi_w_valid = _T_4846 & _T_1237; // @[lsu_bus_buffer.scala 588:22]
  assign io_lsu_axi_w_bits_data = obuf_data; // @[lsu_bus_buffer.scala 590:26]
  assign io_lsu_axi_w_bits_strb = obuf_byteen & _T_4850; // @[lsu_bus_buffer.scala 589:26]
  assign io_lsu_axi_w_bits_last = 1'h1; // @[lsu_bus_buffer.scala 591:26]
  assign io_lsu_axi_b_ready = 1'h1; // @[lsu_bus_buffer.scala 604:22]
  assign io_lsu_axi_ar_valid = _T_4855 & _T_1237; // @[lsu_bus_buffer.scala 593:23]
  assign io_lsu_axi_ar_bits_id = {{1'd0}, _T_1780}; // @[lsu_bus_buffer.scala 594:25]
  assign io_lsu_axi_ar_bits_addr = obuf_sideeffect ? obuf_addr : _T_4838; // @[lsu_bus_buffer.scala 595:27]
  assign io_lsu_axi_ar_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 599:29]
  assign io_lsu_axi_ar_bits_len = 8'h0; // @[lsu_bus_buffer.scala 600:26]
  assign io_lsu_axi_ar_bits_size = obuf_sideeffect ? _T_4840 : 3'h3; // @[lsu_bus_buffer.scala 596:27]
  assign io_lsu_axi_ar_bits_burst = 2'h1; // @[lsu_bus_buffer.scala 601:28]
  assign io_lsu_axi_ar_bits_lock = 1'h0; // @[lsu_bus_buffer.scala 603:27]
  assign io_lsu_axi_ar_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 598:28]
  assign io_lsu_axi_ar_bits_prot = 3'h1; // @[lsu_bus_buffer.scala 597:27]
  assign io_lsu_axi_ar_bits_qos = 4'h0; // @[lsu_bus_buffer.scala 602:26]
  assign io_lsu_axi_r_ready = 1'h1; // @[lsu_bus_buffer.scala 605:22]
  assign io_lsu_busreq_r = _T_4945; // @[lsu_bus_buffer.scala 624:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[lsu_bus_buffer.scala 533:30]
  assign io_lsu_bus_buffer_full_any = _T_4482 ? _T_4483 : _T_4484; // @[lsu_bus_buffer.scala 534:30]
  assign io_lsu_bus_buffer_empty_any = _T_4495 & _T_1231; // @[lsu_bus_buffer.scala 535:31]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[lsu_bus_buffer.scala 141:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[lsu_bus_buffer.scala 142:25]
  assign io_ld_fwddata_buf_lo = _T_650 | _T_651; // @[lsu_bus_buffer.scala 168:24]
  assign io_ld_fwddata_buf_hi = _T_747 | _T_748; // @[lsu_bus_buffer.scala 174:24]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_io_en = _T_853 & _T_854; // @[lib.scala 393:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_1_io_en = _T_853 & _T_854; // @[lib.scala 393:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_2_io_en = _T_1238 & io_lsu_bus_clk_en; // @[lib.scala 393:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_3_io_en = _T_1238 & io_lsu_bus_clk_en; // @[lib.scala 393:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_4_io_en = _T_3524 & buf_state_en_0; // @[lib.scala 393:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_5_io_en = _T_3714 & buf_state_en_1; // @[lib.scala 393:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_6_io_en = _T_3904 & buf_state_en_2; // @[lib.scala 393:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_7_io_en = _T_4094 & buf_state_en_3; // @[lib.scala 393:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_8_io_en = _T_3524 ? buf_state_en_0 : _GEN_72; // @[lib.scala 393:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_9_io_en = _T_3714 ? buf_state_en_1 : _GEN_149; // @[lib.scala 393:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_10_io_en = _T_3904 ? buf_state_en_2 : _GEN_226; // @[lib.scala 393:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_11_io_en = _T_4094 ? buf_state_en_3 : _GEN_303; // @[lib.scala 393:17]
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
  buf_addr_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  _T_4344 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4341 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4338 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4335 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  buf_state_0 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  buf_addr_1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  buf_state_1 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  buf_addr_2 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  buf_state_2 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  buf_addr_3 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  buf_state_3 = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  buf_byteen_3 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  buf_byteen_2 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  buf_byteen_1 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  buf_byteen_0 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  buf_ageQ_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1780 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  obuf_merge = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  obuf_tag1 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  obuf_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  obuf_wr_enQ = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ibuf_addr = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  ibuf_write = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ibuf_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ibuf_byteen = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  buf_ageQ_2 = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  buf_ageQ_1 = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  buf_ageQ_0 = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  buf_data_0 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  buf_data_1 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  buf_data_2 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  buf_data_3 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  ibuf_data = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  ibuf_timer = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  ibuf_sideeffect = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  WrPtr1_r = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  WrPtr0_r = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  ibuf_tag = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  ibuf_dualtag = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  ibuf_dual = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  ibuf_samedw = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  ibuf_nomerge = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  ibuf_unsign = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  ibuf_sz = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  _T_1784 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  buf_nomerge_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  buf_nomerge_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  buf_nomerge_2 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  buf_nomerge_3 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4314 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4311 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4308 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4305 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  obuf_sideeffect = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  buf_dual_3 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  buf_dual_2 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  buf_dual_1 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  buf_dual_0 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  buf_samedw_3 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  buf_samedw_2 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  buf_samedw_1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  buf_samedw_0 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  obuf_write = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  obuf_cmd_done = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  obuf_data_done = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  obuf_nosend = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  obuf_addr = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  buf_sz_0 = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  buf_sz_1 = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  buf_sz_2 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  buf_sz_3 = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  obuf_rdrsp_pend = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  obuf_rdrsp_tag = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  buf_dualhi_3 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  buf_dualhi_2 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  buf_dualhi_1 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  buf_dualhi_0 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  obuf_sz = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  obuf_byteen = _RAND_79[7:0];
  _RAND_80 = {2{`RANDOM}};
  obuf_data = _RAND_80[63:0];
  _RAND_81 = {1{`RANDOM}};
  buf_rspageQ_0 = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  buf_rspageQ_1 = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  buf_rspageQ_2 = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  buf_rspageQ_3 = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  _T_4291 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4289 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4287 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4285 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  buf_ldfwdtag_0 = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  buf_dualtag_0 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  buf_ldfwdtag_3 = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  buf_ldfwdtag_2 = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  buf_ldfwdtag_1 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  buf_dualtag_1 = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  buf_dualtag_2 = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  buf_dualtag_3 = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  _T_4320 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4323 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4326 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4329 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4395 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4390 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4385 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4380 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4945 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4344 = 1'h0;
  end
  if (reset) begin
    _T_4341 = 1'h0;
  end
  if (reset) begin
    _T_4338 = 1'h0;
  end
  if (reset) begin
    _T_4335 = 1'h0;
  end
  if (reset) begin
    buf_state_0 = 3'h0;
  end
  if (reset) begin
    buf_addr_1 = 32'h0;
  end
  if (reset) begin
    buf_state_1 = 3'h0;
  end
  if (reset) begin
    buf_addr_2 = 32'h0;
  end
  if (reset) begin
    buf_state_2 = 3'h0;
  end
  if (reset) begin
    buf_addr_3 = 32'h0;
  end
  if (reset) begin
    buf_state_3 = 3'h0;
  end
  if (reset) begin
    buf_byteen_3 = 4'h0;
  end
  if (reset) begin
    buf_byteen_2 = 4'h0;
  end
  if (reset) begin
    buf_byteen_1 = 4'h0;
  end
  if (reset) begin
    buf_byteen_0 = 4'h0;
  end
  if (reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_1780 = 2'h0;
  end
  if (reset) begin
    obuf_merge = 1'h0;
  end
  if (reset) begin
    obuf_tag1 = 2'h0;
  end
  if (reset) begin
    obuf_valid = 1'h0;
  end
  if (reset) begin
    obuf_wr_enQ = 1'h0;
  end
  if (reset) begin
    ibuf_addr = 32'h0;
  end
  if (reset) begin
    ibuf_write = 1'h0;
  end
  if (reset) begin
    ibuf_valid = 1'h0;
  end
  if (reset) begin
    ibuf_byteen = 4'h0;
  end
  if (reset) begin
    buf_ageQ_2 = 4'h0;
  end
  if (reset) begin
    buf_ageQ_1 = 4'h0;
  end
  if (reset) begin
    buf_ageQ_0 = 4'h0;
  end
  if (reset) begin
    buf_data_0 = 32'h0;
  end
  if (reset) begin
    buf_data_1 = 32'h0;
  end
  if (reset) begin
    buf_data_2 = 32'h0;
  end
  if (reset) begin
    buf_data_3 = 32'h0;
  end
  if (reset) begin
    ibuf_data = 32'h0;
  end
  if (reset) begin
    ibuf_timer = 3'h0;
  end
  if (reset) begin
    ibuf_sideeffect = 1'h0;
  end
  if (reset) begin
    WrPtr1_r = 2'h0;
  end
  if (reset) begin
    WrPtr0_r = 2'h0;
  end
  if (reset) begin
    ibuf_tag = 2'h0;
  end
  if (reset) begin
    ibuf_dualtag = 2'h0;
  end
  if (reset) begin
    ibuf_dual = 1'h0;
  end
  if (reset) begin
    ibuf_samedw = 1'h0;
  end
  if (reset) begin
    ibuf_nomerge = 1'h0;
  end
  if (reset) begin
    ibuf_unsign = 1'h0;
  end
  if (reset) begin
    ibuf_sz = 2'h0;
  end
  if (reset) begin
    _T_1784 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_0 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_1 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_2 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_3 = 1'h0;
  end
  if (reset) begin
    _T_4314 = 1'h0;
  end
  if (reset) begin
    _T_4311 = 1'h0;
  end
  if (reset) begin
    _T_4308 = 1'h0;
  end
  if (reset) begin
    _T_4305 = 1'h0;
  end
  if (reset) begin
    obuf_sideeffect = 1'h0;
  end
  if (reset) begin
    buf_dual_3 = 1'h0;
  end
  if (reset) begin
    buf_dual_2 = 1'h0;
  end
  if (reset) begin
    buf_dual_1 = 1'h0;
  end
  if (reset) begin
    buf_dual_0 = 1'h0;
  end
  if (reset) begin
    buf_samedw_3 = 1'h0;
  end
  if (reset) begin
    buf_samedw_2 = 1'h0;
  end
  if (reset) begin
    buf_samedw_1 = 1'h0;
  end
  if (reset) begin
    buf_samedw_0 = 1'h0;
  end
  if (reset) begin
    obuf_write = 1'h0;
  end
  if (reset) begin
    obuf_cmd_done = 1'h0;
  end
  if (reset) begin
    obuf_data_done = 1'h0;
  end
  if (reset) begin
    obuf_nosend = 1'h0;
  end
  if (reset) begin
    obuf_addr = 32'h0;
  end
  if (reset) begin
    buf_sz_0 = 2'h0;
  end
  if (reset) begin
    buf_sz_1 = 2'h0;
  end
  if (reset) begin
    buf_sz_2 = 2'h0;
  end
  if (reset) begin
    buf_sz_3 = 2'h0;
  end
  if (reset) begin
    obuf_rdrsp_pend = 1'h0;
  end
  if (reset) begin
    obuf_rdrsp_tag = 3'h0;
  end
  if (reset) begin
    buf_dualhi_3 = 1'h0;
  end
  if (reset) begin
    buf_dualhi_2 = 1'h0;
  end
  if (reset) begin
    buf_dualhi_1 = 1'h0;
  end
  if (reset) begin
    buf_dualhi_0 = 1'h0;
  end
  if (reset) begin
    obuf_sz = 2'h0;
  end
  if (reset) begin
    obuf_byteen = 8'h0;
  end
  if (reset) begin
    obuf_data = 64'h0;
  end
  if (reset) begin
    buf_rspageQ_0 = 4'h0;
  end
  if (reset) begin
    buf_rspageQ_1 = 4'h0;
  end
  if (reset) begin
    buf_rspageQ_2 = 4'h0;
  end
  if (reset) begin
    buf_rspageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_4291 = 1'h0;
  end
  if (reset) begin
    _T_4289 = 1'h0;
  end
  if (reset) begin
    _T_4287 = 1'h0;
  end
  if (reset) begin
    _T_4285 = 1'h0;
  end
  if (reset) begin
    buf_ldfwdtag_0 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_0 = 2'h0;
  end
  if (reset) begin
    buf_ldfwdtag_3 = 2'h0;
  end
  if (reset) begin
    buf_ldfwdtag_2 = 2'h0;
  end
  if (reset) begin
    buf_ldfwdtag_1 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_1 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_2 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_3 = 2'h0;
  end
  if (reset) begin
    _T_4320 = 1'h0;
  end
  if (reset) begin
    _T_4323 = 1'h0;
  end
  if (reset) begin
    _T_4326 = 1'h0;
  end
  if (reset) begin
    _T_4329 = 1'h0;
  end
  if (reset) begin
    _T_4395 = 1'h0;
  end
  if (reset) begin
    _T_4390 = 1'h0;
  end
  if (reset) begin
    _T_4385 = 1'h0;
  end
  if (reset) begin
    _T_4380 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4945 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_0 <= 32'h0;
    end else if (ibuf_drainvec_vld[0]) begin
      buf_addr_0 <= ibuf_addr;
    end else if (_T_3339) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4344 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4344 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4341 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4341 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4338 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4338 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4335 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4335 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3524) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3547) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3551) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3585) begin
        if (_T_3588) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3596) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3624) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3669) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3675) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3687) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else begin
        buf_state_0 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_1 <= 32'h0;
    end else if (ibuf_drainvec_vld[1]) begin
      buf_addr_1 <= ibuf_addr;
    end else if (_T_3348) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3714) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3737) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3741) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3775) begin
        if (_T_3778) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3786) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3814) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3859) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3865) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3877) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else begin
        buf_state_1 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_2 <= 32'h0;
    end else if (ibuf_drainvec_vld[2]) begin
      buf_addr_2 <= ibuf_addr;
    end else if (_T_3357) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3904) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3927) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3931) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3965) begin
        if (_T_3968) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3976) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4004) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4049) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4055) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4067) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else begin
        buf_state_2 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_3 <= 32'h0;
    end else if (ibuf_drainvec_vld[3]) begin
      buf_addr_3 <= ibuf_addr;
    end else if (_T_3366) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4094) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4117) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4121) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4155) begin
        if (_T_4158) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4166) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4194) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4239) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4245) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4257) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else begin
        buf_state_3 <= 3'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_3 <= 4'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_byteen_3 <= ibuf_byteen_out;
      end else if (_T_3366) begin
        buf_byteen_3 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_3 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_2 <= 4'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_byteen_2 <= ibuf_byteen_out;
      end else if (_T_3357) begin
        buf_byteen_2 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_2 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_1 <= 4'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_byteen_1 <= ibuf_byteen_out;
      end else if (_T_3348) begin
        buf_byteen_1 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_1 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_0 <= 4'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_byteen_0 <= ibuf_byteen_out;
      end else if (_T_3339) begin
        buf_byteen_0 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_0 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2467,_T_2390};
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_1780 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1780 <= WrPtr0_r;
      end else begin
        _T_1780 <= CmdPtr0;
      end
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_merge <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_merge <= obuf_merge_en;
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_tag1 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_tag1 <= WrPtr1_r;
      end else begin
        obuf_tag1 <= CmdPtr1;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1771 & _T_1772;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1238 & io_lsu_bus_clk_en;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      ibuf_addr <= 32'h0;
    end else if (io_ldst_dual_r) begin
      ibuf_addr <= io_end_addr_r;
    end else begin
      ibuf_addr <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_write <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_write <= io_lsu_pkt_r_bits_store;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ibuf_valid <= 1'h0;
    end else begin
      ibuf_valid <= _T_1005 & _T_1006;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_866) begin
        ibuf_byteen <= _T_881;
      end else if (io_ldst_dual_r) begin
        ibuf_byteen <= ldst_byteen_hi_r;
      end else begin
        ibuf_byteen <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_2 <= 4'h0;
    end else begin
      buf_ageQ_2 <= {_T_2365,_T_2288};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2263,_T_2186};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2161,_T_2084};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3524) begin
      if (_T_3539) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3547) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3551) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3585) begin
      if (_T_3662) begin
        if (buf_addr_0[2]) begin
          buf_data_0 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_0 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3714) begin
      if (_T_3729) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3737) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3741) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3775) begin
      if (_T_3852) begin
        if (buf_addr_1[2]) begin
          buf_data_1 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_1 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3904) begin
      if (_T_3919) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3927) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3931) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3965) begin
      if (_T_4042) begin
        if (buf_addr_2[2]) begin
          buf_data_2 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_2 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4094) begin
      if (_T_4109) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4117) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4121) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_4155) begin
      if (_T_4232) begin
        if (buf_addr_3[2]) begin
          buf_data_3 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_3 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      ibuf_data <= 32'h0;
    end else begin
      ibuf_data <= {_T_922,_T_893};
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ibuf_timer <= 3'h0;
    end else if (ibuf_wr_en) begin
      ibuf_timer <= 3'h0;
    end else if (_T_923) begin
      ibuf_timer <= _T_926;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1846) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1860) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1874) begin
      WrPtr1_r <= 2'h2;
    end else begin
      WrPtr1_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1795) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1806) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1817) begin
      WrPtr0_r <= 2'h2;
    end else begin
      WrPtr0_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (ibuf_wr_en) begin
      if (!(_T_866)) begin
        if (io_ldst_dual_r) begin
          ibuf_tag <= WrPtr1_r;
        end else begin
          ibuf_tag <= WrPtr0_r;
        end
      end
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_unsign <= io_lsu_pkt_r_bits_unsign;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sz <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sz <= ibuf_sz_in;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1784 <= 1'h0;
    end else begin
      _T_1784 <= _T_1303 & _T_4822;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_nomerge_0 <= buf_nomerge_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_nomerge_1 <= buf_nomerge_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_nomerge_2 <= buf_nomerge_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_nomerge_3 <= buf_nomerge_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4314 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4314 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4311 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4311 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4308 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4308 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4305 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4305 <= buf_sideeffect_in[0];
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_sideeffect <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sideeffect <= io_is_sideeffects_r;
      end else begin
        obuf_sideeffect <= _T_1051;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_dual_3 <= buf_dual_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_dual_2 <= buf_dual_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_dual_1 <= buf_dual_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_dual_0 <= buf_dual_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_samedw_3 <= buf_samedw_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_samedw_2 <= buf_samedw_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_samedw_1 <= buf_samedw_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_samedw_0 <= buf_samedw_in[0];
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_write <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_write <= io_lsu_pkt_r_bits_store;
      end else begin
        obuf_write <= _T_1202;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1303 & _T_4821;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1303 & _T_4822;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_nosend <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_nosend <= obuf_nosend_in;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      obuf_addr <= 32'h0;
    end else if (ibuf_buf_byp) begin
      obuf_addr <= io_lsu_addr_r;
    end else begin
      obuf_addr <= _T_1287;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_sz_0 <= ibuf_sz;
      end else begin
        buf_sz_0 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_sz_1 <= ibuf_sz;
      end else begin
        buf_sz_1 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_sz_2 <= ibuf_sz;
      end else begin
        buf_sz_2 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_sz_3 <= ibuf_sz;
      end else begin
        buf_sz_3 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else if (obuf_rdrsp_pend_en) begin
      obuf_rdrsp_pend <= obuf_rdrsp_pend_in;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1330) begin
      obuf_rdrsp_tag <= obuf_tag0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_dualhi_3 <= buf_dualhi_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_dualhi_2 <= buf_dualhi_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_dualhi_1 <= buf_dualhi_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_dualhi_0 <= buf_dualhi_in[0];
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_sz <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sz <= ibuf_sz_in;
      end else begin
        obuf_sz <= _T_1300;
      end
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_byteen <= 8'h0;
    end else if (obuf_wr_en) begin
      obuf_byteen <= obuf_byteen_in;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      obuf_data <= 64'h0;
    end else begin
      obuf_data <= {_T_1618,_T_1577};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3137,_T_3126};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3152,_T_3141};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3167,_T_3156};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3182,_T_3171};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4291 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4094) begin
        _T_4291 <= 1'h0;
      end else if (_T_4117) begin
        _T_4291 <= 1'h0;
      end else begin
        _T_4291 <= _T_4121;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4289 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3904) begin
        _T_4289 <= 1'h0;
      end else if (_T_3927) begin
        _T_4289 <= 1'h0;
      end else begin
        _T_4289 <= _T_3931;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4287 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3714) begin
        _T_4287 <= 1'h0;
      end else if (_T_3737) begin
        _T_4287 <= 1'h0;
      end else begin
        _T_4287 <= _T_3741;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4285 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3524) begin
        _T_4285 <= 1'h0;
      end else if (_T_3547) begin
        _T_4285 <= 1'h0;
      end else begin
        _T_4285 <= _T_3551;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3524) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3547) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3551) begin
        buf_ldfwdtag_0 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_0 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_dualtag_0 <= ibuf_dualtag;
      end else if (_T_3339) begin
        buf_dualtag_0 <= WrPtr0_r;
      end else begin
        buf_dualtag_0 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_3 <= 2'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4094) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4117) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4121) begin
        buf_ldfwdtag_3 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_3 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_2 <= 2'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3904) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3927) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3931) begin
        buf_ldfwdtag_2 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_2 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_1 <= 2'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3714) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3737) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3741) begin
        buf_ldfwdtag_1 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_1 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_dualtag_1 <= ibuf_dualtag;
      end else if (_T_3348) begin
        buf_dualtag_1 <= WrPtr0_r;
      end else begin
        buf_dualtag_1 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_dualtag_2 <= ibuf_dualtag;
      end else if (_T_3357) begin
        buf_dualtag_2 <= WrPtr0_r;
      end else begin
        buf_dualtag_2 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_dualtag_3 <= ibuf_dualtag;
      end else if (_T_3366) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4320 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4320 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4323 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4323 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4326 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4326 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4329 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4329 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4395 <= 1'h0;
    end else begin
      _T_4395 <= _T_4392 & _T_4393;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4390 <= 1'h0;
    end else begin
      _T_4390 <= _T_4387 & _T_4388;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4385 <= 1'h0;
    end else begin
      _T_4385 <= _T_4382 & _T_4383;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4380 <= 1'h0;
    end else begin
      _T_4380 <= _T_4377 & _T_4378;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      lsu_nonblock_load_valid_r <= 1'h0;
    end else begin
      lsu_nonblock_load_valid_r <= io_dctl_busbuff_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_4945 <= 1'h0;
    end else begin
      _T_4945 <= _T_4942 & _T_4502;
    end
  end
endmodule
