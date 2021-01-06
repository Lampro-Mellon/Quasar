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
  wire  rvclkhdr_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 390:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[lsu_bus_buffer.scala 76:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[lsu_bus_buffer.scala 77:46]
  reg [31:0] buf_addr_0; // @[Reg.scala 27:20]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 79:74]
  reg  _T_4355; // @[Reg.scala 27:20]
  reg  _T_4352; // @[Reg.scala 27:20]
  reg  _T_4349; // @[Reg.scala 27:20]
  reg  _T_4346; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4355,_T_4352,_T_4349,_T_4346}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_6 = _T_4 & _T_5; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_1; // @[Reg.scala 27:20]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_13 = _T_11 & _T_12; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_2; // @[Reg.scala 27:20]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_20 = _T_18 & _T_19; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_3; // @[Reg.scala 27:20]
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
  reg [3:0] buf_ageQ_3; // @[lsu_bus_buffer.scala 511:60]
  wire  _T_2590 = buf_state_3 == 3'h2; // @[lsu_bus_buffer.scala 415:93]
  wire  _T_4104 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4127 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4131 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1781; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1781}; // @[lsu_bus_buffer.scala 355:13]
  wire  _T_4138 = obuf_tag0 == 3'h3; // @[lsu_bus_buffer.scala 458:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_376 = {{1'd0}, obuf_tag1}; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_4139 = _GEN_376 == 3'h3; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_4140 = obuf_merge & _T_4139; // @[lsu_bus_buffer.scala 458:91]
  wire  _T_4141 = _T_4138 | _T_4140; // @[lsu_bus_buffer.scala 458:77]
  reg  obuf_valid; // @[lsu_bus_buffer.scala 348:54]
  wire  _T_4142 = _T_4141 & obuf_valid; // @[lsu_bus_buffer.scala 458:135]
  reg  obuf_wr_enQ; // @[Reg.scala 27:20]
  wire  _T_4143 = _T_4142 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 458:148]
  wire  _T_4165 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4250 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4268 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4276 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_290 = _T_4131 & _T_4143; // @[Conditional.scala 39:67]
  wire  _GEN_303 = _T_4127 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4104 ? 1'h0 : _GEN_303; // @[Conditional.scala 40:58]
  wire  _T_2591 = _T_2590 & buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 415:103]
  wire  _T_2592 = ~_T_2591; // @[lsu_bus_buffer.scala 415:78]
  wire  _T_2593 = buf_ageQ_3[3] & _T_2592; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2594 = ~io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 415:132]
  wire  _T_2595 = _T_2593 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2583 = buf_state_2 == 3'h2; // @[lsu_bus_buffer.scala 415:93]
  wire  _T_3913 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3936 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3940 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3947 = obuf_tag0 == 3'h2; // @[lsu_bus_buffer.scala 458:48]
  wire  _T_3948 = _GEN_376 == 3'h2; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_3949 = obuf_merge & _T_3948; // @[lsu_bus_buffer.scala 458:91]
  wire  _T_3950 = _T_3947 | _T_3949; // @[lsu_bus_buffer.scala 458:77]
  wire  _T_3951 = _T_3950 & obuf_valid; // @[lsu_bus_buffer.scala 458:135]
  wire  _T_3952 = _T_3951 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 458:148]
  wire  _T_3974 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4059 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4077 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4085 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_214 = _T_3940 & _T_3952; // @[Conditional.scala 39:67]
  wire  _GEN_227 = _T_3936 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3913 ? 1'h0 : _GEN_227; // @[Conditional.scala 40:58]
  wire  _T_2584 = _T_2583 & buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 415:103]
  wire  _T_2585 = ~_T_2584; // @[lsu_bus_buffer.scala 415:78]
  wire  _T_2586 = buf_ageQ_3[2] & _T_2585; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2588 = _T_2586 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2576 = buf_state_1 == 3'h2; // @[lsu_bus_buffer.scala 415:93]
  wire  _T_3722 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3745 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3749 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3756 = obuf_tag0 == 3'h1; // @[lsu_bus_buffer.scala 458:48]
  wire  _T_3757 = _GEN_376 == 3'h1; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_3758 = obuf_merge & _T_3757; // @[lsu_bus_buffer.scala 458:91]
  wire  _T_3759 = _T_3756 | _T_3758; // @[lsu_bus_buffer.scala 458:77]
  wire  _T_3760 = _T_3759 & obuf_valid; // @[lsu_bus_buffer.scala 458:135]
  wire  _T_3761 = _T_3760 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 458:148]
  wire  _T_3783 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3868 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3886 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3894 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_138 = _T_3749 & _T_3761; // @[Conditional.scala 39:67]
  wire  _GEN_151 = _T_3745 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3722 ? 1'h0 : _GEN_151; // @[Conditional.scala 40:58]
  wire  _T_2577 = _T_2576 & buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 415:103]
  wire  _T_2578 = ~_T_2577; // @[lsu_bus_buffer.scala 415:78]
  wire  _T_2579 = buf_ageQ_3[1] & _T_2578; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2581 = _T_2579 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2569 = buf_state_0 == 3'h2; // @[lsu_bus_buffer.scala 415:93]
  wire  _T_3531 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3554 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3558 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3565 = obuf_tag0 == 3'h0; // @[lsu_bus_buffer.scala 458:48]
  wire  _T_3566 = _GEN_376 == 3'h0; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_3567 = obuf_merge & _T_3566; // @[lsu_bus_buffer.scala 458:91]
  wire  _T_3568 = _T_3565 | _T_3567; // @[lsu_bus_buffer.scala 458:77]
  wire  _T_3569 = _T_3568 & obuf_valid; // @[lsu_bus_buffer.scala 458:135]
  wire  _T_3570 = _T_3569 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 458:148]
  wire  _T_3592 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3677 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3695 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3703 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_62 = _T_3558 & _T_3570; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_3554 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3531 ? 1'h0 : _GEN_75; // @[Conditional.scala 40:58]
  wire  _T_2570 = _T_2569 & buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 415:103]
  wire  _T_2571 = ~_T_2570; // @[lsu_bus_buffer.scala 415:78]
  wire  _T_2572 = buf_ageQ_3[0] & _T_2571; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2574 = _T_2572 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire [3:0] buf_age_3 = {_T_2595,_T_2588,_T_2581,_T_2574}; // @[Cat.scala 29:58]
  wire  _T_2694 = ~buf_age_3[2]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2696 = _T_2694 & _T_19; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2688 = ~buf_age_3[1]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2690 = _T_2688 & _T_12; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2682 = ~buf_age_3[0]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2684 = _T_2682 & _T_5; // @[lsu_bus_buffer.scala 416:104]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2696,_T_2690,_T_2684}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_256 = |_T_255; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_257 = ~_T_256; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[lsu_bus_buffer.scala 149:97]
  reg [31:0] ibuf_addr; // @[Reg.scala 27:20]
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
  reg [3:0] buf_ageQ_2; // @[lsu_bus_buffer.scala 511:60]
  wire  _T_2562 = buf_ageQ_2[3] & _T_2592; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2564 = _T_2562 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2555 = buf_ageQ_2[2] & _T_2585; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2557 = _T_2555 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2548 = buf_ageQ_2[1] & _T_2578; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2550 = _T_2548 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2541 = buf_ageQ_2[0] & _T_2571; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2543 = _T_2541 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire [3:0] buf_age_2 = {_T_2564,_T_2557,_T_2550,_T_2543}; // @[Cat.scala 29:58]
  wire  _T_2673 = ~buf_age_2[3]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2675 = _T_2673 & _T_26; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2661 = ~buf_age_2[1]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2663 = _T_2661 & _T_12; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2655 = ~buf_age_2[0]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2657 = _T_2655 & _T_5; // @[lsu_bus_buffer.scala 416:104]
  wire [3:0] buf_age_younger_2 = {_T_2675,1'h0,_T_2663,_T_2657}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_248 = |_T_247; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_249 = ~_T_248; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_253 = _T_250 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_1; // @[lsu_bus_buffer.scala 511:60]
  wire  _T_2531 = buf_ageQ_1[3] & _T_2592; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2533 = _T_2531 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2524 = buf_ageQ_1[2] & _T_2585; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2526 = _T_2524 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2517 = buf_ageQ_1[1] & _T_2578; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2519 = _T_2517 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2510 = buf_ageQ_1[0] & _T_2571; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2512 = _T_2510 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire [3:0] buf_age_1 = {_T_2533,_T_2526,_T_2519,_T_2512}; // @[Cat.scala 29:58]
  wire  _T_2646 = ~buf_age_1[3]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2648 = _T_2646 & _T_26; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2640 = ~buf_age_1[2]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2642 = _T_2640 & _T_19; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2628 = ~buf_age_1[0]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2630 = _T_2628 & _T_5; // @[lsu_bus_buffer.scala 416:104]
  wire [3:0] buf_age_younger_1 = {_T_2648,_T_2642,1'h0,_T_2630}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_240 = |_T_239; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_241 = ~_T_240; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_245 = _T_242 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_0; // @[lsu_bus_buffer.scala 511:60]
  wire  _T_2500 = buf_ageQ_0[3] & _T_2592; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2502 = _T_2500 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2493 = buf_ageQ_0[2] & _T_2585; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2495 = _T_2493 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2486 = buf_ageQ_0[1] & _T_2578; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2488 = _T_2486 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire  _T_2479 = buf_ageQ_0[0] & _T_2571; // @[lsu_bus_buffer.scala 415:76]
  wire  _T_2481 = _T_2479 & _T_2594; // @[lsu_bus_buffer.scala 415:130]
  wire [3:0] buf_age_0 = {_T_2502,_T_2495,_T_2488,_T_2481}; // @[Cat.scala 29:58]
  wire  _T_2619 = ~buf_age_0[3]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2621 = _T_2619 & _T_26; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2613 = ~buf_age_0[2]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2615 = _T_2613 & _T_19; // @[lsu_bus_buffer.scala 416:104]
  wire  _T_2607 = ~buf_age_0[1]; // @[lsu_bus_buffer.scala 416:89]
  wire  _T_2609 = _T_2607 & _T_12; // @[lsu_bus_buffer.scala 416:104]
  wire [3:0] buf_age_younger_0 = {_T_2621,_T_2615,_T_2609,1'h0}; // @[Cat.scala 29:58]
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
  reg [31:0] buf_data_0; // @[Reg.scala 27:20]
  wire [7:0] _T_560 = _T_558 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[Reg.scala 27:20]
  wire [7:0] _T_565 = _T_563 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[Reg.scala 27:20]
  wire [7:0] _T_570 = _T_568 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[Reg.scala 27:20]
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
  reg [31:0] ibuf_data; // @[Reg.scala 27:20]
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
  reg [1:0] WrPtr1_r; // @[lsu_bus_buffer.scala 625:49]
  reg [1:0] WrPtr0_r; // @[lsu_bus_buffer.scala 624:49]
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
  wire [31:0] ibuf_data_in = {_T_920,_T_911,_T_902,_T_893}; // @[Cat.scala 29:58]
  wire  _T_923 = ibuf_timer < 3'h7; // @[lsu_bus_buffer.scala 236:60]
  wire [2:0] _T_926 = ibuf_timer + 3'h1; // @[lsu_bus_buffer.scala 236:95]
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
  wire  _T_4441 = buf_write[3] & _T_2590; // @[lsu_bus_buffer.scala 531:64]
  wire  _T_4442 = ~buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 531:91]
  wire  _T_4443 = _T_4441 & _T_4442; // @[lsu_bus_buffer.scala 531:89]
  wire  _T_4436 = buf_write[2] & _T_2583; // @[lsu_bus_buffer.scala 531:64]
  wire  _T_4437 = ~buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 531:91]
  wire  _T_4438 = _T_4436 & _T_4437; // @[lsu_bus_buffer.scala 531:89]
  wire [1:0] _T_4444 = _T_4443 + _T_4438; // @[lsu_bus_buffer.scala 531:142]
  wire  _T_4431 = buf_write[1] & _T_2576; // @[lsu_bus_buffer.scala 531:64]
  wire  _T_4432 = ~buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 531:91]
  wire  _T_4433 = _T_4431 & _T_4432; // @[lsu_bus_buffer.scala 531:89]
  wire [1:0] _GEN_380 = {{1'd0}, _T_4433}; // @[lsu_bus_buffer.scala 531:142]
  wire [2:0] _T_4445 = _T_4444 + _GEN_380; // @[lsu_bus_buffer.scala 531:142]
  wire  _T_4426 = buf_write[0] & _T_2569; // @[lsu_bus_buffer.scala 531:64]
  wire  _T_4427 = ~buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 531:91]
  wire  _T_4428 = _T_4426 & _T_4427; // @[lsu_bus_buffer.scala 531:89]
  wire [2:0] _GEN_381 = {{2'd0}, _T_4428}; // @[lsu_bus_buffer.scala 531:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4445 + _GEN_381; // @[lsu_bus_buffer.scala 531:142]
  wire  _T_1016 = buf_numvld_wrcmd_any == 4'h1; // @[lsu_bus_buffer.scala 266:43]
  wire  _T_4458 = _T_2590 & _T_4442; // @[lsu_bus_buffer.scala 532:73]
  wire  _T_4455 = _T_2583 & _T_4437; // @[lsu_bus_buffer.scala 532:73]
  wire [1:0] _T_4459 = _T_4458 + _T_4455; // @[lsu_bus_buffer.scala 532:126]
  wire  _T_4452 = _T_2576 & _T_4432; // @[lsu_bus_buffer.scala 532:73]
  wire [1:0] _GEN_382 = {{1'd0}, _T_4452}; // @[lsu_bus_buffer.scala 532:126]
  wire [2:0] _T_4460 = _T_4459 + _GEN_382; // @[lsu_bus_buffer.scala 532:126]
  wire  _T_4449 = _T_2569 & _T_4427; // @[lsu_bus_buffer.scala 532:73]
  wire [2:0] _GEN_383 = {{2'd0}, _T_4449}; // @[lsu_bus_buffer.scala 532:126]
  wire [3:0] buf_numvld_cmd_any = _T_4460 + _GEN_383; // @[lsu_bus_buffer.scala 532:126]
  wire  _T_1017 = buf_numvld_cmd_any == 4'h1; // @[lsu_bus_buffer.scala 266:72]
  wire  _T_1018 = _T_1016 & _T_1017; // @[lsu_bus_buffer.scala 266:51]
  reg  _T_1791; // @[Reg.scala 27:20]
  wire [2:0] obuf_wr_timer = {{2'd0}, _T_1791}; // @[lsu_bus_buffer.scala 364:17]
  wire  _T_1019 = obuf_wr_timer != 3'h7; // @[lsu_bus_buffer.scala 266:97]
  wire  _T_1020 = _T_1018 & _T_1019; // @[lsu_bus_buffer.scala 266:80]
  wire  _T_1022 = _T_1020 & _T_938; // @[lsu_bus_buffer.scala 266:114]
  wire  _T_1918 = |buf_age_3; // @[lsu_bus_buffer.scala 381:58]
  wire  _T_1919 = ~_T_1918; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1921 = _T_1919 & _T_2590; // @[lsu_bus_buffer.scala 381:63]
  wire  _T_1923 = _T_1921 & _T_4442; // @[lsu_bus_buffer.scala 381:88]
  wire  _T_1912 = |buf_age_2; // @[lsu_bus_buffer.scala 381:58]
  wire  _T_1913 = ~_T_1912; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1915 = _T_1913 & _T_2583; // @[lsu_bus_buffer.scala 381:63]
  wire  _T_1917 = _T_1915 & _T_4437; // @[lsu_bus_buffer.scala 381:88]
  wire  _T_1906 = |buf_age_1; // @[lsu_bus_buffer.scala 381:58]
  wire  _T_1907 = ~_T_1906; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1909 = _T_1907 & _T_2576; // @[lsu_bus_buffer.scala 381:63]
  wire  _T_1911 = _T_1909 & _T_4432; // @[lsu_bus_buffer.scala 381:88]
  wire  _T_1900 = |buf_age_0; // @[lsu_bus_buffer.scala 381:58]
  wire  _T_1901 = ~_T_1900; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1903 = _T_1901 & _T_2569; // @[lsu_bus_buffer.scala 381:63]
  wire  _T_1905 = _T_1903 & _T_4427; // @[lsu_bus_buffer.scala 381:88]
  wire [3:0] CmdPtr0Dec = {_T_1923,_T_1917,_T_1911,_T_1905}; // @[Cat.scala 29:58]
  wire [7:0] _T_1993 = {4'h0,_T_1923,_T_1917,_T_1911,_T_1905}; // @[Cat.scala 29:58]
  wire  _T_1996 = _T_1993[4] | _T_1993[5]; // @[lsu_bus_buffer.scala 389:42]
  wire  _T_1998 = _T_1996 | _T_1993[6]; // @[lsu_bus_buffer.scala 389:48]
  wire  _T_2000 = _T_1998 | _T_1993[7]; // @[lsu_bus_buffer.scala 389:54]
  wire  _T_2003 = _T_1993[2] | _T_1993[3]; // @[lsu_bus_buffer.scala 389:67]
  wire  _T_2005 = _T_2003 | _T_1993[6]; // @[lsu_bus_buffer.scala 389:73]
  wire  _T_2007 = _T_2005 | _T_1993[7]; // @[lsu_bus_buffer.scala 389:79]
  wire  _T_2010 = _T_1993[1] | _T_1993[3]; // @[lsu_bus_buffer.scala 389:92]
  wire  _T_2012 = _T_2010 | _T_1993[5]; // @[lsu_bus_buffer.scala 389:98]
  wire  _T_2014 = _T_2012 | _T_1993[7]; // @[lsu_bus_buffer.scala 389:104]
  wire [2:0] _T_2016 = {_T_2000,_T_2007,_T_2014}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2016[1:0]; // @[lsu_bus_buffer.scala 394:11]
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
  reg  _T_4325; // @[Reg.scala 27:20]
  reg  _T_4322; // @[Reg.scala 27:20]
  reg  _T_4319; // @[Reg.scala 27:20]
  reg  _T_4316; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4325,_T_4322,_T_4319,_T_4316}; // @[Cat.scala 29:58]
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
  wire  _T_4477 = buf_state_3 == 3'h1; // @[lsu_bus_buffer.scala 533:63]
  wire  _T_4481 = _T_4477 | _T_4458; // @[lsu_bus_buffer.scala 533:74]
  wire  _T_4472 = buf_state_2 == 3'h1; // @[lsu_bus_buffer.scala 533:63]
  wire  _T_4476 = _T_4472 | _T_4455; // @[lsu_bus_buffer.scala 533:74]
  wire [1:0] _T_4482 = _T_4481 + _T_4476; // @[lsu_bus_buffer.scala 533:154]
  wire  _T_4467 = buf_state_1 == 3'h1; // @[lsu_bus_buffer.scala 533:63]
  wire  _T_4471 = _T_4467 | _T_4452; // @[lsu_bus_buffer.scala 533:74]
  wire [1:0] _GEN_384 = {{1'd0}, _T_4471}; // @[lsu_bus_buffer.scala 533:154]
  wire [2:0] _T_4483 = _T_4482 + _GEN_384; // @[lsu_bus_buffer.scala 533:154]
  wire  _T_4462 = buf_state_0 == 3'h1; // @[lsu_bus_buffer.scala 533:63]
  wire  _T_4466 = _T_4462 | _T_4449; // @[lsu_bus_buffer.scala 533:74]
  wire [2:0] _GEN_385 = {{2'd0}, _T_4466}; // @[lsu_bus_buffer.scala 533:154]
  wire [3:0] buf_numvld_pend_any = _T_4483 + _GEN_385; // @[lsu_bus_buffer.scala 533:154]
  wire  _T_1087 = buf_numvld_pend_any == 4'h0; // @[lsu_bus_buffer.scala 272:53]
  wire  _T_1088 = ibuf_byp & _T_1087; // @[lsu_bus_buffer.scala 272:31]
  wire  _T_1089 = ~io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 272:64]
  wire  _T_1090 = _T_1089 | io_no_dword_merge_r; // @[lsu_bus_buffer.scala 272:89]
  wire  ibuf_buf_byp = _T_1088 & _T_1090; // @[lsu_bus_buffer.scala 272:61]
  wire  _T_1091 = ibuf_buf_byp & io_lsu_commit_r; // @[lsu_bus_buffer.scala 288:32]
  wire  _T_4751 = buf_state_0 == 3'h3; // @[lsu_bus_buffer.scala 561:62]
  wire  _T_4753 = _T_4751 & buf_sideeffect[0]; // @[lsu_bus_buffer.scala 561:73]
  wire  _T_4754 = _T_4753 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 561:93]
  wire  _T_4755 = buf_state_1 == 3'h3; // @[lsu_bus_buffer.scala 561:62]
  wire  _T_4757 = _T_4755 & buf_sideeffect[1]; // @[lsu_bus_buffer.scala 561:73]
  wire  _T_4758 = _T_4757 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 561:93]
  wire  _T_4767 = _T_4754 | _T_4758; // @[lsu_bus_buffer.scala 561:153]
  wire  _T_4759 = buf_state_2 == 3'h3; // @[lsu_bus_buffer.scala 561:62]
  wire  _T_4761 = _T_4759 & buf_sideeffect[2]; // @[lsu_bus_buffer.scala 561:73]
  wire  _T_4762 = _T_4761 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 561:93]
  wire  _T_4768 = _T_4767 | _T_4762; // @[lsu_bus_buffer.scala 561:153]
  wire  _T_4763 = buf_state_3 == 3'h3; // @[lsu_bus_buffer.scala 561:62]
  wire  _T_4765 = _T_4763 & buf_sideeffect[3]; // @[lsu_bus_buffer.scala 561:73]
  wire  _T_4766 = _T_4765 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 561:93]
  wire  _T_4769 = _T_4768 | _T_4766; // @[lsu_bus_buffer.scala 561:153]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_4770 = obuf_valid & obuf_sideeffect; // @[lsu_bus_buffer.scala 561:171]
  wire  _T_4771 = _T_4770 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 561:189]
  wire  bus_sideeffect_pend = _T_4769 | _T_4771; // @[lsu_bus_buffer.scala 561:157]
  wire  _T_1092 = io_is_sideeffects_r & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 288:74]
  wire  _T_1093 = ~_T_1092; // @[lsu_bus_buffer.scala 288:52]
  wire  _T_1094 = _T_1091 & _T_1093; // @[lsu_bus_buffer.scala 288:50]
  wire [2:0] _T_1099 = _T_1023 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1100 = _T_1024 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1103 = _T_1099 | _T_1100; // @[Mux.scala 27:72]
  wire [2:0] _T_1101 = _T_1025 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1104 = _T_1103 | _T_1101; // @[Mux.scala 27:72]
  wire [2:0] _T_1102 = _T_1026 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1105 = _T_1104 | _T_1102; // @[Mux.scala 27:72]
  wire  _T_1107 = _T_1105 == 3'h2; // @[lsu_bus_buffer.scala 289:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[lsu_bus_buffer.scala 386:31]
  wire  _T_1108 = _T_1107 & found_cmdptr0; // @[lsu_bus_buffer.scala 289:47]
  wire [3:0] _T_1111 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1120 = _T_1023 & _T_1111[0]; // @[Mux.scala 27:72]
  wire  _T_1121 = _T_1024 & _T_1111[1]; // @[Mux.scala 27:72]
  wire  _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1122 = _T_1025 & _T_1111[2]; // @[Mux.scala 27:72]
  wire  _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire  _T_1123 = _T_1026 & _T_1111[3]; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = ~_T_1126; // @[lsu_bus_buffer.scala 290:23]
  wire  _T_1129 = _T_1108 & _T_1128; // @[lsu_bus_buffer.scala 290:21]
  wire  _T_1146 = _T_1051 & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 290:141]
  wire  _T_1147 = ~_T_1146; // @[lsu_bus_buffer.scala 290:105]
  wire  _T_1148 = _T_1129 & _T_1147; // @[lsu_bus_buffer.scala 290:103]
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
  wire  _T_1187 = _T_1166 & _T_1185; // @[lsu_bus_buffer.scala 291:77]
  wire  _T_1196 = _T_1023 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1197 = _T_1024 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1200 = _T_1196 | _T_1197; // @[Mux.scala 27:72]
  wire  _T_1198 = _T_1025 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1200 | _T_1198; // @[Mux.scala 27:72]
  wire  _T_1199 = _T_1026 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1201 | _T_1199; // @[Mux.scala 27:72]
  wire  _T_1204 = ~_T_1202; // @[lsu_bus_buffer.scala 291:150]
  wire  _T_1205 = _T_1187 & _T_1204; // @[lsu_bus_buffer.scala 291:148]
  wire  _T_1206 = ~_T_1205; // @[lsu_bus_buffer.scala 291:8]
  wire [3:0] _T_1959 = ~CmdPtr0Dec; // @[lsu_bus_buffer.scala 382:62]
  wire [3:0] _T_1960 = buf_age_3 & _T_1959; // @[lsu_bus_buffer.scala 382:59]
  wire  _T_1961 = |_T_1960; // @[lsu_bus_buffer.scala 382:76]
  wire  _T_1962 = ~_T_1961; // @[lsu_bus_buffer.scala 382:45]
  wire  _T_1964 = ~CmdPtr0Dec[3]; // @[lsu_bus_buffer.scala 382:83]
  wire  _T_1965 = _T_1962 & _T_1964; // @[lsu_bus_buffer.scala 382:81]
  wire  _T_1967 = _T_1965 & _T_2590; // @[lsu_bus_buffer.scala 382:98]
  wire  _T_1969 = _T_1967 & _T_4442; // @[lsu_bus_buffer.scala 382:123]
  wire [3:0] _T_1949 = buf_age_2 & _T_1959; // @[lsu_bus_buffer.scala 382:59]
  wire  _T_1950 = |_T_1949; // @[lsu_bus_buffer.scala 382:76]
  wire  _T_1951 = ~_T_1950; // @[lsu_bus_buffer.scala 382:45]
  wire  _T_1953 = ~CmdPtr0Dec[2]; // @[lsu_bus_buffer.scala 382:83]
  wire  _T_1954 = _T_1951 & _T_1953; // @[lsu_bus_buffer.scala 382:81]
  wire  _T_1956 = _T_1954 & _T_2583; // @[lsu_bus_buffer.scala 382:98]
  wire  _T_1958 = _T_1956 & _T_4437; // @[lsu_bus_buffer.scala 382:123]
  wire [3:0] _T_1938 = buf_age_1 & _T_1959; // @[lsu_bus_buffer.scala 382:59]
  wire  _T_1939 = |_T_1938; // @[lsu_bus_buffer.scala 382:76]
  wire  _T_1940 = ~_T_1939; // @[lsu_bus_buffer.scala 382:45]
  wire  _T_1942 = ~CmdPtr0Dec[1]; // @[lsu_bus_buffer.scala 382:83]
  wire  _T_1943 = _T_1940 & _T_1942; // @[lsu_bus_buffer.scala 382:81]
  wire  _T_1945 = _T_1943 & _T_2576; // @[lsu_bus_buffer.scala 382:98]
  wire  _T_1947 = _T_1945 & _T_4432; // @[lsu_bus_buffer.scala 382:123]
  wire [3:0] _T_1927 = buf_age_0 & _T_1959; // @[lsu_bus_buffer.scala 382:59]
  wire  _T_1928 = |_T_1927; // @[lsu_bus_buffer.scala 382:76]
  wire  _T_1929 = ~_T_1928; // @[lsu_bus_buffer.scala 382:45]
  wire  _T_1931 = ~CmdPtr0Dec[0]; // @[lsu_bus_buffer.scala 382:83]
  wire  _T_1932 = _T_1929 & _T_1931; // @[lsu_bus_buffer.scala 382:81]
  wire  _T_1934 = _T_1932 & _T_2569; // @[lsu_bus_buffer.scala 382:98]
  wire  _T_1936 = _T_1934 & _T_4427; // @[lsu_bus_buffer.scala 382:123]
  wire [3:0] CmdPtr1Dec = {_T_1969,_T_1958,_T_1947,_T_1936}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[lsu_bus_buffer.scala 387:31]
  wire  _T_1207 = _T_1206 | found_cmdptr1; // @[lsu_bus_buffer.scala 291:181]
  wire [3:0] _T_1210 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1219 = _T_1023 & _T_1210[0]; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1024 & _T_1210[1]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1219 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1025 & _T_1210[2]; // @[Mux.scala 27:72]
  wire  _T_1224 = _T_1223 | _T_1221; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1026 & _T_1210[3]; // @[Mux.scala 27:72]
  wire  _T_1225 = _T_1224 | _T_1222; // @[Mux.scala 27:72]
  wire  _T_1227 = _T_1207 | _T_1225; // @[lsu_bus_buffer.scala 291:197]
  wire  _T_1228 = _T_1227 | obuf_force_wr_en; // @[lsu_bus_buffer.scala 291:269]
  wire  _T_1229 = _T_1148 & _T_1228; // @[lsu_bus_buffer.scala 290:164]
  wire  _T_1230 = _T_1094 | _T_1229; // @[lsu_bus_buffer.scala 288:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[Reg.scala 27:20]
  reg  obuf_data_done; // @[Reg.scala 27:20]
  wire  _T_4825 = obuf_cmd_done | obuf_data_done; // @[lsu_bus_buffer.scala 565:54]
  wire  _T_4826 = obuf_cmd_done ? io_lsu_axi_w_ready : io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 565:75]
  wire  _T_4827 = io_lsu_axi_aw_ready & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 565:153]
  wire  _T_4828 = _T_4825 ? _T_4826 : _T_4827; // @[lsu_bus_buffer.scala 565:39]
  wire  bus_cmd_ready = obuf_write ? _T_4828 : io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 565:23]
  wire  _T_1231 = ~obuf_valid; // @[lsu_bus_buffer.scala 292:48]
  wire  _T_1232 = bus_cmd_ready | _T_1231; // @[lsu_bus_buffer.scala 292:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1233 = _T_1232 | obuf_nosend; // @[lsu_bus_buffer.scala 292:60]
  wire  _T_1234 = _T_1230 & _T_1233; // @[lsu_bus_buffer.scala 292:29]
  wire  _T_1235 = ~obuf_wr_wait; // @[lsu_bus_buffer.scala 292:77]
  wire  _T_1236 = _T_1234 & _T_1235; // @[lsu_bus_buffer.scala 292:75]
  reg [31:0] obuf_addr; // @[Reg.scala 27:20]
  wire  _T_4776 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[lsu_bus_buffer.scala 563:37]
  wire  _T_4777 = obuf_valid & _T_4776; // @[lsu_bus_buffer.scala 563:19]
  wire  _T_4779 = obuf_tag1 == 2'h0; // @[lsu_bus_buffer.scala 563:107]
  wire  _T_4780 = obuf_merge & _T_4779; // @[lsu_bus_buffer.scala 563:95]
  wire  _T_4781 = _T_3565 | _T_4780; // @[lsu_bus_buffer.scala 563:81]
  wire  _T_4782 = ~_T_4781; // @[lsu_bus_buffer.scala 563:61]
  wire  _T_4783 = _T_4777 & _T_4782; // @[lsu_bus_buffer.scala 563:59]
  wire  _T_4817 = _T_4751 & _T_4783; // @[Mux.scala 27:72]
  wire  _T_4787 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[lsu_bus_buffer.scala 563:37]
  wire  _T_4788 = obuf_valid & _T_4787; // @[lsu_bus_buffer.scala 563:19]
  wire  _T_4790 = obuf_tag1 == 2'h1; // @[lsu_bus_buffer.scala 563:107]
  wire  _T_4791 = obuf_merge & _T_4790; // @[lsu_bus_buffer.scala 563:95]
  wire  _T_4792 = _T_3756 | _T_4791; // @[lsu_bus_buffer.scala 563:81]
  wire  _T_4793 = ~_T_4792; // @[lsu_bus_buffer.scala 563:61]
  wire  _T_4794 = _T_4788 & _T_4793; // @[lsu_bus_buffer.scala 563:59]
  wire  _T_4818 = _T_4755 & _T_4794; // @[Mux.scala 27:72]
  wire  _T_4821 = _T_4817 | _T_4818; // @[Mux.scala 27:72]
  wire  _T_4798 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[lsu_bus_buffer.scala 563:37]
  wire  _T_4799 = obuf_valid & _T_4798; // @[lsu_bus_buffer.scala 563:19]
  wire  _T_4801 = obuf_tag1 == 2'h2; // @[lsu_bus_buffer.scala 563:107]
  wire  _T_4802 = obuf_merge & _T_4801; // @[lsu_bus_buffer.scala 563:95]
  wire  _T_4803 = _T_3947 | _T_4802; // @[lsu_bus_buffer.scala 563:81]
  wire  _T_4804 = ~_T_4803; // @[lsu_bus_buffer.scala 563:61]
  wire  _T_4805 = _T_4799 & _T_4804; // @[lsu_bus_buffer.scala 563:59]
  wire  _T_4819 = _T_4759 & _T_4805; // @[Mux.scala 27:72]
  wire  _T_4822 = _T_4821 | _T_4819; // @[Mux.scala 27:72]
  wire  _T_4809 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[lsu_bus_buffer.scala 563:37]
  wire  _T_4810 = obuf_valid & _T_4809; // @[lsu_bus_buffer.scala 563:19]
  wire  _T_4812 = obuf_tag1 == 2'h3; // @[lsu_bus_buffer.scala 563:107]
  wire  _T_4813 = obuf_merge & _T_4812; // @[lsu_bus_buffer.scala 563:95]
  wire  _T_4814 = _T_4138 | _T_4813; // @[lsu_bus_buffer.scala 563:81]
  wire  _T_4815 = ~_T_4814; // @[lsu_bus_buffer.scala 563:61]
  wire  _T_4816 = _T_4810 & _T_4815; // @[lsu_bus_buffer.scala 563:59]
  wire  _T_4820 = _T_4763 & _T_4816; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4822 | _T_4820; // @[Mux.scala 27:72]
  wire  _T_1237 = ~bus_addr_match_pending; // @[lsu_bus_buffer.scala 292:94]
  wire  _T_1238 = _T_1236 & _T_1237; // @[lsu_bus_buffer.scala 292:92]
  wire  obuf_wr_en = _T_1238 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 292:118]
  wire  _T_1240 = obuf_valid & obuf_nosend; // @[lsu_bus_buffer.scala 295:47]
  wire  bus_wcmd_sent = io_lsu_axi_aw_valid & io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 566:40]
  wire  _T_4832 = obuf_cmd_done | bus_wcmd_sent; // @[lsu_bus_buffer.scala 568:35]
  wire  bus_wdata_sent = io_lsu_axi_w_valid & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 567:40]
  wire  _T_4833 = obuf_data_done | bus_wdata_sent; // @[lsu_bus_buffer.scala 568:70]
  wire  _T_4834 = _T_4832 & _T_4833; // @[lsu_bus_buffer.scala 568:52]
  wire  _T_4835 = io_lsu_axi_ar_valid & io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 568:112]
  wire  bus_cmd_sent = _T_4834 | _T_4835; // @[lsu_bus_buffer.scala 568:89]
  wire  _T_1241 = bus_cmd_sent | _T_1240; // @[lsu_bus_buffer.scala 295:33]
  wire  _T_1242 = ~obuf_wr_en; // @[lsu_bus_buffer.scala 295:65]
  wire  _T_1243 = _T_1241 & _T_1242; // @[lsu_bus_buffer.scala 295:63]
  wire  _T_1244 = _T_1243 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 295:77]
  wire  obuf_rst = _T_1244 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 295:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_bits_store : _T_1202; // @[lsu_bus_buffer.scala 296:26]
  wire [31:0] _T_1281 = _T_1023 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1282 = _T_1024 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1283 = _T_1025 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1284 = _T_1026 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1285 = _T_1281 | _T_1282; // @[Mux.scala 27:72]
  wire [31:0] _T_1286 = _T_1285 | _T_1283; // @[Mux.scala 27:72]
  wire [31:0] _T_1287 = _T_1286 | _T_1284; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1287; // @[lsu_bus_buffer.scala 298:25]
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
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1300; // @[lsu_bus_buffer.scala 301:23]
  wire [7:0] _T_2018 = {4'h0,_T_1969,_T_1958,_T_1947,_T_1936}; // @[Cat.scala 29:58]
  wire  _T_2021 = _T_2018[4] | _T_2018[5]; // @[lsu_bus_buffer.scala 389:42]
  wire  _T_2023 = _T_2021 | _T_2018[6]; // @[lsu_bus_buffer.scala 389:48]
  wire  _T_2025 = _T_2023 | _T_2018[7]; // @[lsu_bus_buffer.scala 389:54]
  wire  _T_2028 = _T_2018[2] | _T_2018[3]; // @[lsu_bus_buffer.scala 389:67]
  wire  _T_2030 = _T_2028 | _T_2018[6]; // @[lsu_bus_buffer.scala 389:73]
  wire  _T_2032 = _T_2030 | _T_2018[7]; // @[lsu_bus_buffer.scala 389:79]
  wire  _T_2035 = _T_2018[1] | _T_2018[3]; // @[lsu_bus_buffer.scala 389:92]
  wire  _T_2037 = _T_2035 | _T_2018[5]; // @[lsu_bus_buffer.scala 389:98]
  wire  _T_2039 = _T_2037 | _T_2018[7]; // @[lsu_bus_buffer.scala 389:104]
  wire [2:0] _T_2041 = {_T_2025,_T_2032,_T_2039}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr1 = _T_2041[1:0]; // @[lsu_bus_buffer.scala 396:11]
  wire  _T_1302 = obuf_wr_en | obuf_rst; // @[lsu_bus_buffer.scala 309:39]
  wire  _T_1303 = ~_T_1302; // @[lsu_bus_buffer.scala 309:26]
  wire  obuf_cmd_done_in = _T_1303 & _T_4832; // @[lsu_bus_buffer.scala 309:51]
  wire  obuf_data_done_in = _T_1303 & _T_4833; // @[lsu_bus_buffer.scala 312:52]
  wire  _T_1309 = obuf_sz_in == 2'h0; // @[lsu_bus_buffer.scala 313:72]
  wire  _T_1312 = ~obuf_addr_in[0]; // @[lsu_bus_buffer.scala 313:98]
  wire  _T_1313 = obuf_sz_in[0] & _T_1312; // @[lsu_bus_buffer.scala 313:96]
  wire  _T_1314 = _T_1309 | _T_1313; // @[lsu_bus_buffer.scala 313:79]
  wire  _T_1317 = |obuf_addr_in[1:0]; // @[lsu_bus_buffer.scala 313:153]
  wire  _T_1318 = ~_T_1317; // @[lsu_bus_buffer.scala 313:134]
  wire  _T_1319 = obuf_sz_in[1] & _T_1318; // @[lsu_bus_buffer.scala 313:132]
  wire  _T_1320 = _T_1314 | _T_1319; // @[lsu_bus_buffer.scala 313:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1320; // @[lsu_bus_buffer.scala 313:28]
  wire  _T_1337 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[lsu_bus_buffer.scala 327:40]
  wire  _T_1338 = _T_1337 & obuf_aligned_in; // @[lsu_bus_buffer.scala 327:60]
  wire  _T_1339 = ~obuf_sideeffect; // @[lsu_bus_buffer.scala 327:80]
  wire  _T_1340 = _T_1338 & _T_1339; // @[lsu_bus_buffer.scala 327:78]
  wire  _T_1341 = ~obuf_write; // @[lsu_bus_buffer.scala 327:99]
  wire  _T_1342 = _T_1340 & _T_1341; // @[lsu_bus_buffer.scala 327:97]
  wire  _T_1343 = ~obuf_write_in; // @[lsu_bus_buffer.scala 327:113]
  wire  _T_1344 = _T_1342 & _T_1343; // @[lsu_bus_buffer.scala 327:111]
  wire  _T_1345 = ~io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_buffer.scala 327:130]
  wire  _T_1346 = _T_1344 & _T_1345; // @[lsu_bus_buffer.scala 327:128]
  wire  _T_1347 = ~obuf_nosend; // @[lsu_bus_buffer.scala 328:20]
  wire  _T_1348 = obuf_valid & _T_1347; // @[lsu_bus_buffer.scala 328:18]
  reg  obuf_rdrsp_pend; // @[Reg.scala 27:20]
  wire  bus_rsp_read = io_lsu_axi_r_valid & io_lsu_axi_r_ready; // @[lsu_bus_buffer.scala 569:38]
  reg [2:0] obuf_rdrsp_tag; // @[Reg.scala 27:20]
  wire  _T_1349 = io_lsu_axi_r_bits_id == obuf_rdrsp_tag; // @[lsu_bus_buffer.scala 328:90]
  wire  _T_1350 = bus_rsp_read & _T_1349; // @[lsu_bus_buffer.scala 328:70]
  wire  _T_1351 = ~_T_1350; // @[lsu_bus_buffer.scala 328:55]
  wire  _T_1352 = obuf_rdrsp_pend & _T_1351; // @[lsu_bus_buffer.scala 328:53]
  wire  _T_1353 = _T_1348 | _T_1352; // @[lsu_bus_buffer.scala 328:34]
  wire  obuf_nosend_in = _T_1346 & _T_1353; // @[lsu_bus_buffer.scala 327:177]
  wire  _T_1321 = ~obuf_nosend_in; // @[lsu_bus_buffer.scala 321:45]
  wire  _T_1322 = obuf_wr_en & _T_1321; // @[lsu_bus_buffer.scala 321:43]
  wire  _T_1323 = ~_T_1322; // @[lsu_bus_buffer.scala 321:30]
  wire  _T_1324 = _T_1323 & obuf_rdrsp_pend; // @[lsu_bus_buffer.scala 321:62]
  wire  _T_1328 = _T_1324 & _T_1351; // @[lsu_bus_buffer.scala 321:80]
  wire  _T_1330 = bus_cmd_sent & _T_1341; // @[lsu_bus_buffer.scala 321:155]
  wire  _T_1331 = _T_1328 | _T_1330; // @[lsu_bus_buffer.scala 321:139]
  wire  obuf_rdrsp_pend_in = _T_1331 & _T_2594; // @[lsu_bus_buffer.scala 321:171]
  wire  obuf_rdrsp_pend_en = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 322:47]
  wire [7:0] _T_1356 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1357 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1358 = io_lsu_addr_r[2] ? _T_1356 : _T_1357; // @[lsu_bus_buffer.scala 329:46]
  wire [3:0] _T_1377 = _T_1023 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1378 = _T_1024 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1379 = _T_1025 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1380 = _T_1026 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1381 = _T_1377 | _T_1378; // @[Mux.scala 27:72]
  wire [3:0] _T_1382 = _T_1381 | _T_1379; // @[Mux.scala 27:72]
  wire [3:0] _T_1383 = _T_1382 | _T_1380; // @[Mux.scala 27:72]
  wire [7:0] _T_1385 = {_T_1383,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1398 = {4'h0,_T_1383}; // @[Cat.scala 29:58]
  wire [7:0] _T_1399 = _T_1287[2] ? _T_1385 : _T_1398; // @[lsu_bus_buffer.scala 330:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1358 : _T_1399; // @[lsu_bus_buffer.scala 329:28]
  wire [7:0] _T_1401 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1402 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1403 = io_end_addr_r[2] ? _T_1401 : _T_1402; // @[lsu_bus_buffer.scala 331:46]
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
  wire [7:0] _T_1444 = _T_1414[2] ? _T_1430 : _T_1443; // @[lsu_bus_buffer.scala 332:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1403 : _T_1444; // @[lsu_bus_buffer.scala 331:28]
  wire [63:0] _T_1446 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1447 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1448 = io_lsu_addr_r[2] ? _T_1446 : _T_1447; // @[lsu_bus_buffer.scala 334:44]
  wire [31:0] _T_1467 = _T_1023 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1468 = _T_1024 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1469 = _T_1025 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1470 = _T_1026 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1471 = _T_1467 | _T_1468; // @[Mux.scala 27:72]
  wire [31:0] _T_1472 = _T_1471 | _T_1469; // @[Mux.scala 27:72]
  wire [31:0] _T_1473 = _T_1472 | _T_1470; // @[Mux.scala 27:72]
  wire [63:0] _T_1475 = {_T_1473,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1488 = {32'h0,_T_1473}; // @[Cat.scala 29:58]
  wire [63:0] _T_1489 = _T_1287[2] ? _T_1475 : _T_1488; // @[lsu_bus_buffer.scala 335:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1448 : _T_1489; // @[lsu_bus_buffer.scala 334:26]
  wire [63:0] _T_1491 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1492 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1493 = io_end_addr_r[2] ? _T_1491 : _T_1492; // @[lsu_bus_buffer.scala 336:44]
  wire [31:0] _T_1512 = _T_1404 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1513 = _T_1405 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1514 = _T_1406 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1515 = _T_1407 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1516 = _T_1512 | _T_1513; // @[Mux.scala 27:72]
  wire [31:0] _T_1517 = _T_1516 | _T_1514; // @[Mux.scala 27:72]
  wire [31:0] _T_1518 = _T_1517 | _T_1515; // @[Mux.scala 27:72]
  wire [63:0] _T_1520 = {_T_1518,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1533 = {32'h0,_T_1518}; // @[Cat.scala 29:58]
  wire [63:0] _T_1534 = _T_1414[2] ? _T_1520 : _T_1533; // @[lsu_bus_buffer.scala 337:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1493 : _T_1534; // @[lsu_bus_buffer.scala 336:26]
  wire  _T_1619 = CmdPtr0 != CmdPtr1; // @[lsu_bus_buffer.scala 343:30]
  wire  _T_1620 = _T_1619 & found_cmdptr0; // @[lsu_bus_buffer.scala 343:43]
  wire  _T_1621 = _T_1620 & found_cmdptr1; // @[lsu_bus_buffer.scala 343:59]
  wire  _T_1635 = _T_1621 & _T_1107; // @[lsu_bus_buffer.scala 343:75]
  wire [2:0] _T_1640 = _T_1404 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1641 = _T_1405 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1644 = _T_1640 | _T_1641; // @[Mux.scala 27:72]
  wire [2:0] _T_1642 = _T_1406 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1645 = _T_1644 | _T_1642; // @[Mux.scala 27:72]
  wire [2:0] _T_1643 = _T_1407 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1646 = _T_1645 | _T_1643; // @[Mux.scala 27:72]
  wire  _T_1648 = _T_1646 == 3'h2; // @[lsu_bus_buffer.scala 343:150]
  wire  _T_1649 = _T_1635 & _T_1648; // @[lsu_bus_buffer.scala 343:118]
  wire  _T_1670 = _T_1649 & _T_1128; // @[lsu_bus_buffer.scala 343:161]
  wire  _T_1688 = _T_1670 & _T_1053; // @[lsu_bus_buffer.scala 344:85]
  wire  _T_1725 = _T_1204 & _T_1166; // @[lsu_bus_buffer.scala 345:36]
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
  wire  _T_1745 = ~_T_1743; // @[lsu_bus_buffer.scala 345:107]
  wire  _T_1746 = _T_1725 & _T_1745; // @[lsu_bus_buffer.scala 345:105]
  wire  _T_1766 = _T_1746 & _T_1185; // @[lsu_bus_buffer.scala 345:177]
  wire  _T_1767 = _T_1688 & _T_1766; // @[lsu_bus_buffer.scala 344:122]
  wire  _T_1768 = ibuf_buf_byp & ldst_samedw_r; // @[lsu_bus_buffer.scala 346:19]
  wire  _T_1769 = _T_1768 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 346:35]
  wire  obuf_merge_en = _T_1767 | _T_1769; // @[lsu_bus_buffer.scala 345:250]
  wire  _T_1537 = obuf_merge_en & obuf_byteen1_in[0]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1538 = obuf_byteen0_in[0] | _T_1537; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1541 = obuf_merge_en & obuf_byteen1_in[1]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1542 = obuf_byteen0_in[1] | _T_1541; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1545 = obuf_merge_en & obuf_byteen1_in[2]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1546 = obuf_byteen0_in[2] | _T_1545; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1549 = obuf_merge_en & obuf_byteen1_in[3]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1550 = obuf_byteen0_in[3] | _T_1549; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1553 = obuf_merge_en & obuf_byteen1_in[4]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1554 = obuf_byteen0_in[4] | _T_1553; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1557 = obuf_merge_en & obuf_byteen1_in[5]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1558 = obuf_byteen0_in[5] | _T_1557; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1561 = obuf_merge_en & obuf_byteen1_in[6]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1562 = obuf_byteen0_in[6] | _T_1561; // @[lsu_bus_buffer.scala 338:63]
  wire  _T_1565 = obuf_merge_en & obuf_byteen1_in[7]; // @[lsu_bus_buffer.scala 338:80]
  wire  _T_1566 = obuf_byteen0_in[7] | _T_1565; // @[lsu_bus_buffer.scala 338:63]
  wire [7:0] obuf_byteen_in = {_T_1566,_T_1562,_T_1558,_T_1554,_T_1550,_T_1546,_T_1542,_T_1538}; // @[Cat.scala 29:58]
  wire [7:0] _T_1577 = _T_1537 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1582 = _T_1541 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1587 = _T_1545 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1592 = _T_1549 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1597 = _T_1553 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1602 = _T_1557 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1607 = _T_1561 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[lsu_bus_buffer.scala 339:44]
  wire [7:0] _T_1612 = _T_1565 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[lsu_bus_buffer.scala 339:44]
  wire [63:0] obuf_data_in = {_T_1612,_T_1607,_T_1602,_T_1597,_T_1592,_T_1587,_T_1582,_T_1577}; // @[Cat.scala 29:58]
  wire  _T_1771 = obuf_wr_en | obuf_valid; // @[lsu_bus_buffer.scala 348:58]
  wire  _T_1772 = ~obuf_rst; // @[lsu_bus_buffer.scala 348:93]
  wire  _T_1780 = io_lsu_bus_obuf_c1_clken & obuf_wr_en; // @[lib.scala 383:57]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[Reg.scala 27:20]
  wire  _T_1792 = buf_state_0 == 3'h0; // @[lsu_bus_buffer.scala 367:65]
  wire  _T_1793 = ibuf_tag == 2'h0; // @[lsu_bus_buffer.scala 368:30]
  wire  _T_1794 = ibuf_valid & _T_1793; // @[lsu_bus_buffer.scala 368:19]
  wire  _T_1795 = WrPtr0_r == 2'h0; // @[lsu_bus_buffer.scala 369:18]
  wire  _T_1796 = WrPtr1_r == 2'h0; // @[lsu_bus_buffer.scala 369:57]
  wire  _T_1797 = io_ldst_dual_r & _T_1796; // @[lsu_bus_buffer.scala 369:45]
  wire  _T_1798 = _T_1795 | _T_1797; // @[lsu_bus_buffer.scala 369:27]
  wire  _T_1799 = io_lsu_busreq_r & _T_1798; // @[lsu_bus_buffer.scala 368:58]
  wire  _T_1800 = _T_1794 | _T_1799; // @[lsu_bus_buffer.scala 368:39]
  wire  _T_1801 = ~_T_1800; // @[lsu_bus_buffer.scala 368:5]
  wire  _T_1802 = _T_1792 & _T_1801; // @[lsu_bus_buffer.scala 367:76]
  wire  _T_1803 = buf_state_1 == 3'h0; // @[lsu_bus_buffer.scala 367:65]
  wire  _T_1804 = ibuf_tag == 2'h1; // @[lsu_bus_buffer.scala 368:30]
  wire  _T_1805 = ibuf_valid & _T_1804; // @[lsu_bus_buffer.scala 368:19]
  wire  _T_1806 = WrPtr0_r == 2'h1; // @[lsu_bus_buffer.scala 369:18]
  wire  _T_1807 = WrPtr1_r == 2'h1; // @[lsu_bus_buffer.scala 369:57]
  wire  _T_1808 = io_ldst_dual_r & _T_1807; // @[lsu_bus_buffer.scala 369:45]
  wire  _T_1809 = _T_1806 | _T_1808; // @[lsu_bus_buffer.scala 369:27]
  wire  _T_1810 = io_lsu_busreq_r & _T_1809; // @[lsu_bus_buffer.scala 368:58]
  wire  _T_1811 = _T_1805 | _T_1810; // @[lsu_bus_buffer.scala 368:39]
  wire  _T_1812 = ~_T_1811; // @[lsu_bus_buffer.scala 368:5]
  wire  _T_1813 = _T_1803 & _T_1812; // @[lsu_bus_buffer.scala 367:76]
  wire  _T_1814 = buf_state_2 == 3'h0; // @[lsu_bus_buffer.scala 367:65]
  wire  _T_1815 = ibuf_tag == 2'h2; // @[lsu_bus_buffer.scala 368:30]
  wire  _T_1816 = ibuf_valid & _T_1815; // @[lsu_bus_buffer.scala 368:19]
  wire  _T_1817 = WrPtr0_r == 2'h2; // @[lsu_bus_buffer.scala 369:18]
  wire  _T_1818 = WrPtr1_r == 2'h2; // @[lsu_bus_buffer.scala 369:57]
  wire  _T_1819 = io_ldst_dual_r & _T_1818; // @[lsu_bus_buffer.scala 369:45]
  wire  _T_1820 = _T_1817 | _T_1819; // @[lsu_bus_buffer.scala 369:27]
  wire  _T_1821 = io_lsu_busreq_r & _T_1820; // @[lsu_bus_buffer.scala 368:58]
  wire  _T_1822 = _T_1816 | _T_1821; // @[lsu_bus_buffer.scala 368:39]
  wire  _T_1823 = ~_T_1822; // @[lsu_bus_buffer.scala 368:5]
  wire  _T_1824 = _T_1814 & _T_1823; // @[lsu_bus_buffer.scala 367:76]
  wire  _T_1825 = buf_state_3 == 3'h0; // @[lsu_bus_buffer.scala 367:65]
  wire  _T_1826 = ibuf_tag == 2'h3; // @[lsu_bus_buffer.scala 368:30]
  wire  _T_1828 = WrPtr0_r == 2'h3; // @[lsu_bus_buffer.scala 369:18]
  wire  _T_1829 = WrPtr1_r == 2'h3; // @[lsu_bus_buffer.scala 369:57]
  wire [1:0] _T_1837 = _T_1824 ? 2'h2 : 2'h3; // @[Mux.scala 98:16]
  wire [1:0] _T_1838 = _T_1813 ? 2'h1 : _T_1837; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1802 ? 2'h0 : _T_1838; // @[Mux.scala 98:16]
  wire  _T_1843 = WrPtr0_m == 2'h0; // @[lsu_bus_buffer.scala 374:33]
  wire  _T_1844 = io_lsu_busreq_m & _T_1843; // @[lsu_bus_buffer.scala 374:22]
  wire  _T_1845 = _T_1794 | _T_1844; // @[lsu_bus_buffer.scala 373:112]
  wire  _T_1851 = _T_1845 | _T_1799; // @[lsu_bus_buffer.scala 374:42]
  wire  _T_1852 = ~_T_1851; // @[lsu_bus_buffer.scala 373:78]
  wire  _T_1853 = _T_1792 & _T_1852; // @[lsu_bus_buffer.scala 373:76]
  wire  _T_1857 = WrPtr0_m == 2'h1; // @[lsu_bus_buffer.scala 374:33]
  wire  _T_1858 = io_lsu_busreq_m & _T_1857; // @[lsu_bus_buffer.scala 374:22]
  wire  _T_1859 = _T_1805 | _T_1858; // @[lsu_bus_buffer.scala 373:112]
  wire  _T_1865 = _T_1859 | _T_1810; // @[lsu_bus_buffer.scala 374:42]
  wire  _T_1866 = ~_T_1865; // @[lsu_bus_buffer.scala 373:78]
  wire  _T_1867 = _T_1803 & _T_1866; // @[lsu_bus_buffer.scala 373:76]
  wire  _T_1871 = WrPtr0_m == 2'h2; // @[lsu_bus_buffer.scala 374:33]
  wire  _T_1872 = io_lsu_busreq_m & _T_1871; // @[lsu_bus_buffer.scala 374:22]
  wire  _T_1873 = _T_1816 | _T_1872; // @[lsu_bus_buffer.scala 373:112]
  wire  _T_1879 = _T_1873 | _T_1821; // @[lsu_bus_buffer.scala 374:42]
  wire  _T_1880 = ~_T_1879; // @[lsu_bus_buffer.scala 373:78]
  wire  _T_1881 = _T_1814 & _T_1880; // @[lsu_bus_buffer.scala 373:76]
  reg [3:0] buf_rspageQ_0; // @[lsu_bus_buffer.scala 512:63]
  wire  _T_2717 = buf_state_3 == 3'h5; // @[lsu_bus_buffer.scala 417:102]
  wire  _T_2718 = buf_rspageQ_0[3] & _T_2717; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2714 = buf_state_2 == 3'h5; // @[lsu_bus_buffer.scala 417:102]
  wire  _T_2715 = buf_rspageQ_0[2] & _T_2714; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2711 = buf_state_1 == 3'h5; // @[lsu_bus_buffer.scala 417:102]
  wire  _T_2712 = buf_rspageQ_0[1] & _T_2711; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2708 = buf_state_0 == 3'h5; // @[lsu_bus_buffer.scala 417:102]
  wire  _T_2709 = buf_rspageQ_0[0] & _T_2708; // @[lsu_bus_buffer.scala 417:87]
  wire [3:0] buf_rsp_pickage_0 = {_T_2718,_T_2715,_T_2712,_T_2709}; // @[Cat.scala 29:58]
  wire  _T_1972 = |buf_rsp_pickage_0; // @[lsu_bus_buffer.scala 385:65]
  wire  _T_1973 = ~_T_1972; // @[lsu_bus_buffer.scala 385:44]
  wire  _T_1975 = _T_1973 & _T_2708; // @[lsu_bus_buffer.scala 385:70]
  reg [3:0] buf_rspageQ_1; // @[lsu_bus_buffer.scala 512:63]
  wire  _T_2733 = buf_rspageQ_1[3] & _T_2717; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2730 = buf_rspageQ_1[2] & _T_2714; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2727 = buf_rspageQ_1[1] & _T_2711; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2724 = buf_rspageQ_1[0] & _T_2708; // @[lsu_bus_buffer.scala 417:87]
  wire [3:0] buf_rsp_pickage_1 = {_T_2733,_T_2730,_T_2727,_T_2724}; // @[Cat.scala 29:58]
  wire  _T_1976 = |buf_rsp_pickage_1; // @[lsu_bus_buffer.scala 385:65]
  wire  _T_1977 = ~_T_1976; // @[lsu_bus_buffer.scala 385:44]
  wire  _T_1979 = _T_1977 & _T_2711; // @[lsu_bus_buffer.scala 385:70]
  reg [3:0] buf_rspageQ_2; // @[lsu_bus_buffer.scala 512:63]
  wire  _T_2748 = buf_rspageQ_2[3] & _T_2717; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2745 = buf_rspageQ_2[2] & _T_2714; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2742 = buf_rspageQ_2[1] & _T_2711; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2739 = buf_rspageQ_2[0] & _T_2708; // @[lsu_bus_buffer.scala 417:87]
  wire [3:0] buf_rsp_pickage_2 = {_T_2748,_T_2745,_T_2742,_T_2739}; // @[Cat.scala 29:58]
  wire  _T_1980 = |buf_rsp_pickage_2; // @[lsu_bus_buffer.scala 385:65]
  wire  _T_1981 = ~_T_1980; // @[lsu_bus_buffer.scala 385:44]
  wire  _T_1983 = _T_1981 & _T_2714; // @[lsu_bus_buffer.scala 385:70]
  reg [3:0] buf_rspageQ_3; // @[lsu_bus_buffer.scala 512:63]
  wire  _T_2763 = buf_rspageQ_3[3] & _T_2717; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2760 = buf_rspageQ_3[2] & _T_2714; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2757 = buf_rspageQ_3[1] & _T_2711; // @[lsu_bus_buffer.scala 417:87]
  wire  _T_2754 = buf_rspageQ_3[0] & _T_2708; // @[lsu_bus_buffer.scala 417:87]
  wire [3:0] buf_rsp_pickage_3 = {_T_2763,_T_2760,_T_2757,_T_2754}; // @[Cat.scala 29:58]
  wire  _T_1984 = |buf_rsp_pickage_3; // @[lsu_bus_buffer.scala 385:65]
  wire  _T_1985 = ~_T_1984; // @[lsu_bus_buffer.scala 385:44]
  wire  _T_1987 = _T_1985 & _T_2717; // @[lsu_bus_buffer.scala 385:70]
  wire [7:0] _T_2043 = {4'h0,_T_1987,_T_1983,_T_1979,_T_1975}; // @[Cat.scala 29:58]
  wire  _T_2046 = _T_2043[4] | _T_2043[5]; // @[lsu_bus_buffer.scala 389:42]
  wire  _T_2048 = _T_2046 | _T_2043[6]; // @[lsu_bus_buffer.scala 389:48]
  wire  _T_2050 = _T_2048 | _T_2043[7]; // @[lsu_bus_buffer.scala 389:54]
  wire  _T_2053 = _T_2043[2] | _T_2043[3]; // @[lsu_bus_buffer.scala 389:67]
  wire  _T_2055 = _T_2053 | _T_2043[6]; // @[lsu_bus_buffer.scala 389:73]
  wire  _T_2057 = _T_2055 | _T_2043[7]; // @[lsu_bus_buffer.scala 389:79]
  wire  _T_2060 = _T_2043[1] | _T_2043[3]; // @[lsu_bus_buffer.scala 389:92]
  wire  _T_2062 = _T_2060 | _T_2043[5]; // @[lsu_bus_buffer.scala 389:98]
  wire  _T_2064 = _T_2062 | _T_2043[7]; // @[lsu_bus_buffer.scala 389:104]
  wire [2:0] _T_2066 = {_T_2050,_T_2057,_T_2064}; // @[Cat.scala 29:58]
  wire  _T_3535 = ibuf_byp | io_ldst_dual_r; // @[lsu_bus_buffer.scala 443:77]
  wire  _T_3536 = ~ibuf_merge_en; // @[lsu_bus_buffer.scala 443:97]
  wire  _T_3537 = _T_3535 & _T_3536; // @[lsu_bus_buffer.scala 443:95]
  wire  _T_3538 = 2'h0 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_3539 = _T_3537 & _T_3538; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_3540 = ibuf_byp & io_ldst_dual_r; // @[lsu_bus_buffer.scala 443:144]
  wire  _T_3541 = 2'h0 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_3542 = _T_3540 & _T_3541; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_3543 = _T_3539 | _T_3542; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_3544 = _T_853 & _T_3543; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_3545 = 2'h0 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_3546 = ibuf_drain_vld & _T_3545; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_3547 = _T_3544 | _T_3546; // @[lsu_bus_buffer.scala 443:183]
  wire  bus_rsp_write = io_lsu_axi_b_valid & io_lsu_axi_b_ready; // @[lsu_bus_buffer.scala 570:39]
  wire  _T_3636 = io_lsu_axi_b_bits_id == 3'h0; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_3637 = bus_rsp_write & _T_3636; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_3638 = io_lsu_axi_r_bits_id == 3'h0; // @[lsu_bus_buffer.scala 474:46]
  reg  _T_4302; // @[Reg.scala 27:20]
  reg  _T_4300; // @[Reg.scala 27:20]
  reg  _T_4298; // @[Reg.scala 27:20]
  reg  _T_4296; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4302,_T_4300,_T_4298,_T_4296}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_386 = {{1'd0}, buf_ldfwdtag_0}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3640 = io_lsu_axi_r_bits_id == _GEN_386; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3641 = buf_ldfwd[0] & _T_3640; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_3642 = _T_3638 | _T_3641; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_3643 = buf_dual_0 & buf_dualhi_0; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_3645 = ~buf_write[0]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_3646 = _T_3643 & _T_3645; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_3647 = _T_3646 & buf_samedw_0; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_387 = {{1'd0}, buf_dualtag_0}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3648 = io_lsu_axi_r_bits_id == _GEN_387; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3649 = _T_3647 & _T_3648; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_3650 = _T_3642 | _T_3649; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_3651 = bus_rsp_read & _T_3650; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_3652 = _T_3637 | _T_3651; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_52 = _T_3592 & _T_3652; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_3558 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_3554 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3531 ? 1'h0 : _GEN_84; // @[Conditional.scala 40:58]
  wire [3:0] _T_3687 = buf_ldfwd >> buf_dualtag_0; // @[lsu_bus_buffer.scala 490:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_33 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_34 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_33; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_35 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_34; // @[lsu_bus_buffer.scala 490:58]
  wire [2:0] _GEN_389 = {{1'd0}, _GEN_35}; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_3689 = io_lsu_axi_r_bits_id == _GEN_389; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_3690 = _T_3687[0] & _T_3689; // @[lsu_bus_buffer.scala 490:38]
  wire  _T_3691 = _T_3648 | _T_3690; // @[lsu_bus_buffer.scala 489:95]
  wire  _T_3692 = bus_rsp_read & _T_3691; // @[lsu_bus_buffer.scala 489:45]
  wire  _GEN_46 = _T_3677 & _T_3692; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3592 ? buf_resp_state_bus_en_0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_3558 ? buf_cmd_state_bus_en_0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_3554 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3531 ? 1'h0 : _GEN_77; // @[Conditional.scala 40:58]
  wire  _T_3571 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 460:49]
  wire  _T_3572 = _T_3571 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 460:70]
  wire [1:0] RspPtr = _T_2066[1:0]; // @[lsu_bus_buffer.scala 397:10]
  wire  _T_3698 = RspPtr == 2'h0; // @[lsu_bus_buffer.scala 497:37]
  wire  _T_3699 = buf_dualtag_0 == RspPtr; // @[lsu_bus_buffer.scala 497:98]
  wire  _T_3700 = buf_dual_0 & _T_3699; // @[lsu_bus_buffer.scala 497:80]
  wire  _T_3701 = _T_3698 | _T_3700; // @[lsu_bus_buffer.scala 497:65]
  wire  _T_3702 = _T_3701 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 497:112]
  wire  _GEN_41 = _T_3695 ? _T_3702 : _T_3703; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_3677 ? _T_3572 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3592 ? _T_3572 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3558 ? _T_3572 : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3554 ? obuf_rdrsp_pend_en : _GEN_64; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3531 ? _T_3547 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_2068 = _T_1792 & buf_state_en_0; // @[lsu_bus_buffer.scala 409:94]
  wire  _T_2074 = ibuf_drain_vld & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 411:23]
  wire  _T_2076 = _T_2074 & _T_3535; // @[lsu_bus_buffer.scala 411:41]
  wire  _T_2078 = _T_2076 & _T_1795; // @[lsu_bus_buffer.scala 411:71]
  wire  _T_2080 = _T_2078 & _T_1793; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2081 = _T_4466 | _T_2080; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2082 = ibuf_byp & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 412:17]
  wire  _T_2083 = _T_2082 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 412:35]
  wire  _T_2085 = _T_2083 & _T_1796; // @[lsu_bus_buffer.scala 412:52]
  wire  _T_2087 = _T_2085 & _T_1795; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2088 = _T_2081 | _T_2087; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2089 = _T_2068 & _T_2088; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2091 = _T_2089 | buf_age_0[0]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2105 = _T_2078 & _T_1804; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2106 = _T_4471 | _T_2105; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2112 = _T_2085 & _T_1806; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2113 = _T_2106 | _T_2112; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2114 = _T_2068 & _T_2113; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2116 = _T_2114 | buf_age_0[1]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2130 = _T_2078 & _T_1815; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2131 = _T_4476 | _T_2130; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2137 = _T_2085 & _T_1817; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2138 = _T_2131 | _T_2137; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2139 = _T_2068 & _T_2138; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2141 = _T_2139 | buf_age_0[2]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2155 = _T_2078 & _T_1826; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2156 = _T_4481 | _T_2155; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2162 = _T_2085 & _T_1828; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2163 = _T_2156 | _T_2162; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2164 = _T_2068 & _T_2163; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2166 = _T_2164 | buf_age_0[3]; // @[lsu_bus_buffer.scala 412:97]
  wire [2:0] _T_2168 = {_T_2166,_T_2141,_T_2116}; // @[Cat.scala 29:58]
  wire  _T_3729 = 2'h1 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_3730 = _T_3537 & _T_3729; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_3732 = 2'h1 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_3733 = _T_3540 & _T_3732; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_3734 = _T_3730 | _T_3733; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_3735 = _T_853 & _T_3734; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_3736 = 2'h1 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_3737 = ibuf_drain_vld & _T_3736; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_3738 = _T_3735 | _T_3737; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_3827 = io_lsu_axi_b_bits_id == 3'h1; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_3828 = bus_rsp_write & _T_3827; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_3829 = io_lsu_axi_r_bits_id == 3'h1; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_390 = {{1'd0}, buf_ldfwdtag_1}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3831 = io_lsu_axi_r_bits_id == _GEN_390; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3832 = buf_ldfwd[1] & _T_3831; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_3833 = _T_3829 | _T_3832; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_3834 = buf_dual_1 & buf_dualhi_1; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_3836 = ~buf_write[1]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_3837 = _T_3834 & _T_3836; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_3838 = _T_3837 & buf_samedw_1; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_391 = {{1'd0}, buf_dualtag_1}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3839 = io_lsu_axi_r_bits_id == _GEN_391; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3840 = _T_3838 & _T_3839; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_3841 = _T_3833 | _T_3840; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_3842 = bus_rsp_read & _T_3841; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_3843 = _T_3828 | _T_3842; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_128 = _T_3783 & _T_3843; // @[Conditional.scala 39:67]
  wire  _GEN_148 = _T_3749 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  _GEN_160 = _T_3745 ? 1'h0 : _GEN_148; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3722 ? 1'h0 : _GEN_160; // @[Conditional.scala 40:58]
  wire [3:0] _T_3878 = buf_ldfwd >> buf_dualtag_1; // @[lsu_bus_buffer.scala 490:21]
  wire [1:0] _GEN_109 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_110 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_109; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_111 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_110; // @[lsu_bus_buffer.scala 490:58]
  wire [2:0] _GEN_393 = {{1'd0}, _GEN_111}; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_3880 = io_lsu_axi_r_bits_id == _GEN_393; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_3881 = _T_3878[0] & _T_3880; // @[lsu_bus_buffer.scala 490:38]
  wire  _T_3882 = _T_3839 | _T_3881; // @[lsu_bus_buffer.scala 489:95]
  wire  _T_3883 = bus_rsp_read & _T_3882; // @[lsu_bus_buffer.scala 489:45]
  wire  _GEN_122 = _T_3868 & _T_3883; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3783 ? buf_resp_state_bus_en_1 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_139 = _T_3749 ? buf_cmd_state_bus_en_1 : _GEN_129; // @[Conditional.scala 39:67]
  wire  _GEN_153 = _T_3745 ? 1'h0 : _GEN_139; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3722 ? 1'h0 : _GEN_153; // @[Conditional.scala 40:58]
  wire  _T_3762 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 460:49]
  wire  _T_3763 = _T_3762 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 460:70]
  wire  _T_3889 = RspPtr == 2'h1; // @[lsu_bus_buffer.scala 497:37]
  wire  _T_3890 = buf_dualtag_1 == RspPtr; // @[lsu_bus_buffer.scala 497:98]
  wire  _T_3891 = buf_dual_1 & _T_3890; // @[lsu_bus_buffer.scala 497:80]
  wire  _T_3892 = _T_3889 | _T_3891; // @[lsu_bus_buffer.scala 497:65]
  wire  _T_3893 = _T_3892 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 497:112]
  wire  _GEN_117 = _T_3886 ? _T_3893 : _T_3894; // @[Conditional.scala 39:67]
  wire  _GEN_123 = _T_3868 ? _T_3763 : _GEN_117; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3783 ? _T_3763 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3749 ? _T_3763 : _GEN_130; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3745 ? obuf_rdrsp_pend_en : _GEN_140; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3722 ? _T_3738 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_2170 = _T_1803 & buf_state_en_1; // @[lsu_bus_buffer.scala 409:94]
  wire  _T_2180 = _T_2076 & _T_1806; // @[lsu_bus_buffer.scala 411:71]
  wire  _T_2182 = _T_2180 & _T_1793; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2183 = _T_4466 | _T_2182; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2187 = _T_2083 & _T_1807; // @[lsu_bus_buffer.scala 412:52]
  wire  _T_2189 = _T_2187 & _T_1795; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2190 = _T_2183 | _T_2189; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2191 = _T_2170 & _T_2190; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2193 = _T_2191 | buf_age_1[0]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2207 = _T_2180 & _T_1804; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2208 = _T_4471 | _T_2207; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2214 = _T_2187 & _T_1806; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2215 = _T_2208 | _T_2214; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2216 = _T_2170 & _T_2215; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2218 = _T_2216 | buf_age_1[1]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2232 = _T_2180 & _T_1815; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2233 = _T_4476 | _T_2232; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2239 = _T_2187 & _T_1817; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2240 = _T_2233 | _T_2239; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2241 = _T_2170 & _T_2240; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2243 = _T_2241 | buf_age_1[2]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2257 = _T_2180 & _T_1826; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2258 = _T_4481 | _T_2257; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2264 = _T_2187 & _T_1828; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2265 = _T_2258 | _T_2264; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2266 = _T_2170 & _T_2265; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2268 = _T_2266 | buf_age_1[3]; // @[lsu_bus_buffer.scala 412:97]
  wire [2:0] _T_2270 = {_T_2268,_T_2243,_T_2218}; // @[Cat.scala 29:58]
  wire  _T_3920 = 2'h2 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_3921 = _T_3537 & _T_3920; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_3923 = 2'h2 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_3924 = _T_3540 & _T_3923; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_3925 = _T_3921 | _T_3924; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_3926 = _T_853 & _T_3925; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_3927 = 2'h2 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_3928 = ibuf_drain_vld & _T_3927; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_3929 = _T_3926 | _T_3928; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_4018 = io_lsu_axi_b_bits_id == 3'h2; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_4019 = bus_rsp_write & _T_4018; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_4020 = io_lsu_axi_r_bits_id == 3'h2; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_394 = {{1'd0}, buf_ldfwdtag_2}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4022 = io_lsu_axi_r_bits_id == _GEN_394; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4023 = buf_ldfwd[2] & _T_4022; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_4024 = _T_4020 | _T_4023; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_4025 = buf_dual_2 & buf_dualhi_2; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_4027 = ~buf_write[2]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_4028 = _T_4025 & _T_4027; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_4029 = _T_4028 & buf_samedw_2; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_395 = {{1'd0}, buf_dualtag_2}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4030 = io_lsu_axi_r_bits_id == _GEN_395; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4031 = _T_4029 & _T_4030; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_4032 = _T_4024 | _T_4031; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_4033 = bus_rsp_read & _T_4032; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_4034 = _T_4019 | _T_4033; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_204 = _T_3974 & _T_4034; // @[Conditional.scala 39:67]
  wire  _GEN_224 = _T_3940 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  _GEN_236 = _T_3936 ? 1'h0 : _GEN_224; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3913 ? 1'h0 : _GEN_236; // @[Conditional.scala 40:58]
  wire [3:0] _T_4069 = buf_ldfwd >> buf_dualtag_2; // @[lsu_bus_buffer.scala 490:21]
  wire [1:0] _GEN_185 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_186 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_185; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_187 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_186; // @[lsu_bus_buffer.scala 490:58]
  wire [2:0] _GEN_397 = {{1'd0}, _GEN_187}; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_4071 = io_lsu_axi_r_bits_id == _GEN_397; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_4072 = _T_4069[0] & _T_4071; // @[lsu_bus_buffer.scala 490:38]
  wire  _T_4073 = _T_4030 | _T_4072; // @[lsu_bus_buffer.scala 489:95]
  wire  _T_4074 = bus_rsp_read & _T_4073; // @[lsu_bus_buffer.scala 489:45]
  wire  _GEN_198 = _T_4059 & _T_4074; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3974 ? buf_resp_state_bus_en_2 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_215 = _T_3940 ? buf_cmd_state_bus_en_2 : _GEN_205; // @[Conditional.scala 39:67]
  wire  _GEN_229 = _T_3936 ? 1'h0 : _GEN_215; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3913 ? 1'h0 : _GEN_229; // @[Conditional.scala 40:58]
  wire  _T_3953 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 460:49]
  wire  _T_3954 = _T_3953 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 460:70]
  wire  _T_4080 = RspPtr == 2'h2; // @[lsu_bus_buffer.scala 497:37]
  wire  _T_4081 = buf_dualtag_2 == RspPtr; // @[lsu_bus_buffer.scala 497:98]
  wire  _T_4082 = buf_dual_2 & _T_4081; // @[lsu_bus_buffer.scala 497:80]
  wire  _T_4083 = _T_4080 | _T_4082; // @[lsu_bus_buffer.scala 497:65]
  wire  _T_4084 = _T_4083 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 497:112]
  wire  _GEN_193 = _T_4077 ? _T_4084 : _T_4085; // @[Conditional.scala 39:67]
  wire  _GEN_199 = _T_4059 ? _T_3954 : _GEN_193; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3974 ? _T_3954 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3940 ? _T_3954 : _GEN_206; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3936 ? obuf_rdrsp_pend_en : _GEN_216; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3913 ? _T_3929 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_2272 = _T_1814 & buf_state_en_2; // @[lsu_bus_buffer.scala 409:94]
  wire  _T_2282 = _T_2076 & _T_1817; // @[lsu_bus_buffer.scala 411:71]
  wire  _T_2284 = _T_2282 & _T_1793; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2285 = _T_4466 | _T_2284; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2289 = _T_2083 & _T_1818; // @[lsu_bus_buffer.scala 412:52]
  wire  _T_2291 = _T_2289 & _T_1795; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2292 = _T_2285 | _T_2291; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2293 = _T_2272 & _T_2292; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2295 = _T_2293 | buf_age_2[0]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2309 = _T_2282 & _T_1804; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2310 = _T_4471 | _T_2309; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2316 = _T_2289 & _T_1806; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2317 = _T_2310 | _T_2316; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2318 = _T_2272 & _T_2317; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2320 = _T_2318 | buf_age_2[1]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2334 = _T_2282 & _T_1815; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2335 = _T_4476 | _T_2334; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2341 = _T_2289 & _T_1817; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2342 = _T_2335 | _T_2341; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2343 = _T_2272 & _T_2342; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2345 = _T_2343 | buf_age_2[2]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2359 = _T_2282 & _T_1826; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2360 = _T_4481 | _T_2359; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2366 = _T_2289 & _T_1828; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2367 = _T_2360 | _T_2366; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2368 = _T_2272 & _T_2367; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2370 = _T_2368 | buf_age_2[3]; // @[lsu_bus_buffer.scala 412:97]
  wire [2:0] _T_2372 = {_T_2370,_T_2345,_T_2320}; // @[Cat.scala 29:58]
  wire  _T_4111 = 2'h3 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_4112 = _T_3537 & _T_4111; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_4114 = 2'h3 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_4115 = _T_3540 & _T_4114; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_4116 = _T_4112 | _T_4115; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_4117 = _T_853 & _T_4116; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_4118 = 2'h3 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_4119 = ibuf_drain_vld & _T_4118; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_4120 = _T_4117 | _T_4119; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_4209 = io_lsu_axi_b_bits_id == 3'h3; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_4210 = bus_rsp_write & _T_4209; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_4211 = io_lsu_axi_r_bits_id == 3'h3; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_398 = {{1'd0}, buf_ldfwdtag_3}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4213 = io_lsu_axi_r_bits_id == _GEN_398; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4214 = buf_ldfwd[3] & _T_4213; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_4215 = _T_4211 | _T_4214; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_4216 = buf_dual_3 & buf_dualhi_3; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_4218 = ~buf_write[3]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_4219 = _T_4216 & _T_4218; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_4220 = _T_4219 & buf_samedw_3; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_399 = {{1'd0}, buf_dualtag_3}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4221 = io_lsu_axi_r_bits_id == _GEN_399; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4222 = _T_4220 & _T_4221; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_4223 = _T_4215 | _T_4222; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_4224 = bus_rsp_read & _T_4223; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_4225 = _T_4210 | _T_4224; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_280 = _T_4165 & _T_4225; // @[Conditional.scala 39:67]
  wire  _GEN_300 = _T_4131 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  _GEN_312 = _T_4127 ? 1'h0 : _GEN_300; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4104 ? 1'h0 : _GEN_312; // @[Conditional.scala 40:58]
  wire [3:0] _T_4260 = buf_ldfwd >> buf_dualtag_3; // @[lsu_bus_buffer.scala 490:21]
  wire [1:0] _GEN_261 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_262 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_261; // @[lsu_bus_buffer.scala 490:58]
  wire [1:0] _GEN_263 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_262; // @[lsu_bus_buffer.scala 490:58]
  wire [2:0] _GEN_401 = {{1'd0}, _GEN_263}; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_4262 = io_lsu_axi_r_bits_id == _GEN_401; // @[lsu_bus_buffer.scala 490:58]
  wire  _T_4263 = _T_4260[0] & _T_4262; // @[lsu_bus_buffer.scala 490:38]
  wire  _T_4264 = _T_4221 | _T_4263; // @[lsu_bus_buffer.scala 489:95]
  wire  _T_4265 = bus_rsp_read & _T_4264; // @[lsu_bus_buffer.scala 489:45]
  wire  _GEN_274 = _T_4250 & _T_4265; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4165 ? buf_resp_state_bus_en_3 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_291 = _T_4131 ? buf_cmd_state_bus_en_3 : _GEN_281; // @[Conditional.scala 39:67]
  wire  _GEN_305 = _T_4127 ? 1'h0 : _GEN_291; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4104 ? 1'h0 : _GEN_305; // @[Conditional.scala 40:58]
  wire  _T_4144 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 460:49]
  wire  _T_4145 = _T_4144 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 460:70]
  wire  _T_4271 = RspPtr == 2'h3; // @[lsu_bus_buffer.scala 497:37]
  wire  _T_4272 = buf_dualtag_3 == RspPtr; // @[lsu_bus_buffer.scala 497:98]
  wire  _T_4273 = buf_dual_3 & _T_4272; // @[lsu_bus_buffer.scala 497:80]
  wire  _T_4274 = _T_4271 | _T_4273; // @[lsu_bus_buffer.scala 497:65]
  wire  _T_4275 = _T_4274 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 497:112]
  wire  _GEN_269 = _T_4268 ? _T_4275 : _T_4276; // @[Conditional.scala 39:67]
  wire  _GEN_275 = _T_4250 ? _T_4145 : _GEN_269; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4165 ? _T_4145 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4131 ? _T_4145 : _GEN_282; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4127 ? obuf_rdrsp_pend_en : _GEN_292; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4104 ? _T_4120 : _GEN_302; // @[Conditional.scala 40:58]
  wire  _T_2374 = _T_1825 & buf_state_en_3; // @[lsu_bus_buffer.scala 409:94]
  wire  _T_2384 = _T_2076 & _T_1828; // @[lsu_bus_buffer.scala 411:71]
  wire  _T_2386 = _T_2384 & _T_1793; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2387 = _T_4466 | _T_2386; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2391 = _T_2083 & _T_1829; // @[lsu_bus_buffer.scala 412:52]
  wire  _T_2393 = _T_2391 & _T_1795; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2394 = _T_2387 | _T_2393; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2395 = _T_2374 & _T_2394; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2397 = _T_2395 | buf_age_3[0]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2411 = _T_2384 & _T_1804; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2412 = _T_4471 | _T_2411; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2418 = _T_2391 & _T_1806; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2419 = _T_2412 | _T_2418; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2420 = _T_2374 & _T_2419; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2422 = _T_2420 | buf_age_3[1]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2436 = _T_2384 & _T_1815; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2437 = _T_4476 | _T_2436; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2443 = _T_2391 & _T_1817; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2444 = _T_2437 | _T_2443; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2445 = _T_2374 & _T_2444; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2447 = _T_2445 | buf_age_3[2]; // @[lsu_bus_buffer.scala 412:97]
  wire  _T_2461 = _T_2384 & _T_1826; // @[lsu_bus_buffer.scala 411:92]
  wire  _T_2462 = _T_4481 | _T_2461; // @[lsu_bus_buffer.scala 410:86]
  wire  _T_2468 = _T_2391 & _T_1828; // @[lsu_bus_buffer.scala 412:73]
  wire  _T_2469 = _T_2462 | _T_2468; // @[lsu_bus_buffer.scala 411:114]
  wire  _T_2470 = _T_2374 & _T_2469; // @[lsu_bus_buffer.scala 409:113]
  wire  _T_2472 = _T_2470 | buf_age_3[3]; // @[lsu_bus_buffer.scala 412:97]
  wire [2:0] _T_2474 = {_T_2472,_T_2447,_T_2422}; // @[Cat.scala 29:58]
  wire  _T_2770 = buf_state_0 == 3'h6; // @[lsu_bus_buffer.scala 420:47]
  wire  _T_2771 = _T_1792 | _T_2770; // @[lsu_bus_buffer.scala 420:32]
  wire  _T_2772 = ~_T_2771; // @[lsu_bus_buffer.scala 420:6]
  wire  _T_2780 = _T_2772 | _T_2080; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2787 = _T_2780 | _T_2087; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2788 = _T_2068 & _T_2787; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2792 = buf_state_1 == 3'h6; // @[lsu_bus_buffer.scala 420:47]
  wire  _T_2793 = _T_1803 | _T_2792; // @[lsu_bus_buffer.scala 420:32]
  wire  _T_2794 = ~_T_2793; // @[lsu_bus_buffer.scala 420:6]
  wire  _T_2802 = _T_2794 | _T_2105; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2809 = _T_2802 | _T_2112; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2810 = _T_2068 & _T_2809; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2814 = buf_state_2 == 3'h6; // @[lsu_bus_buffer.scala 420:47]
  wire  _T_2815 = _T_1814 | _T_2814; // @[lsu_bus_buffer.scala 420:32]
  wire  _T_2816 = ~_T_2815; // @[lsu_bus_buffer.scala 420:6]
  wire  _T_2824 = _T_2816 | _T_2130; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2831 = _T_2824 | _T_2137; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2832 = _T_2068 & _T_2831; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2836 = buf_state_3 == 3'h6; // @[lsu_bus_buffer.scala 420:47]
  wire  _T_2837 = _T_1825 | _T_2836; // @[lsu_bus_buffer.scala 420:32]
  wire  _T_2838 = ~_T_2837; // @[lsu_bus_buffer.scala 420:6]
  wire  _T_2846 = _T_2838 | _T_2155; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2853 = _T_2846 | _T_2162; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2854 = _T_2068 & _T_2853; // @[lsu_bus_buffer.scala 419:112]
  wire [3:0] buf_rspage_set_0 = {_T_2854,_T_2832,_T_2810,_T_2788}; // @[Cat.scala 29:58]
  wire  _T_2871 = _T_2772 | _T_2182; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2878 = _T_2871 | _T_2189; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2879 = _T_2170 & _T_2878; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2893 = _T_2794 | _T_2207; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2900 = _T_2893 | _T_2214; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2901 = _T_2170 & _T_2900; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2915 = _T_2816 | _T_2232; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2922 = _T_2915 | _T_2239; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2923 = _T_2170 & _T_2922; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2937 = _T_2838 | _T_2257; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2944 = _T_2937 | _T_2264; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2945 = _T_2170 & _T_2944; // @[lsu_bus_buffer.scala 419:112]
  wire [3:0] buf_rspage_set_1 = {_T_2945,_T_2923,_T_2901,_T_2879}; // @[Cat.scala 29:58]
  wire  _T_2962 = _T_2772 | _T_2284; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2969 = _T_2962 | _T_2291; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2970 = _T_2272 & _T_2969; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_2984 = _T_2794 | _T_2309; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_2991 = _T_2984 | _T_2316; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_2992 = _T_2272 & _T_2991; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_3006 = _T_2816 | _T_2334; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_3013 = _T_3006 | _T_2341; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_3014 = _T_2272 & _T_3013; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_3028 = _T_2838 | _T_2359; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_3035 = _T_3028 | _T_2366; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_3036 = _T_2272 & _T_3035; // @[lsu_bus_buffer.scala 419:112]
  wire [3:0] buf_rspage_set_2 = {_T_3036,_T_3014,_T_2992,_T_2970}; // @[Cat.scala 29:58]
  wire  _T_3053 = _T_2772 | _T_2386; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_3060 = _T_3053 | _T_2393; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_3061 = _T_2374 & _T_3060; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_3075 = _T_2794 | _T_2411; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_3082 = _T_3075 | _T_2418; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_3083 = _T_2374 & _T_3082; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_3097 = _T_2816 | _T_2436; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_3104 = _T_3097 | _T_2443; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_3105 = _T_2374 & _T_3104; // @[lsu_bus_buffer.scala 419:112]
  wire  _T_3119 = _T_2838 | _T_2461; // @[lsu_bus_buffer.scala 420:59]
  wire  _T_3126 = _T_3119 | _T_2468; // @[lsu_bus_buffer.scala 421:110]
  wire  _T_3127 = _T_2374 & _T_3126; // @[lsu_bus_buffer.scala 419:112]
  wire [3:0] buf_rspage_set_3 = {_T_3127,_T_3105,_T_3083,_T_3061}; // @[Cat.scala 29:58]
  wire  _T_3218 = _T_2836 | _T_1825; // @[lsu_bus_buffer.scala 424:110]
  wire  _T_3219 = ~_T_3218; // @[lsu_bus_buffer.scala 424:84]
  wire  _T_3220 = buf_rspageQ_0[3] & _T_3219; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3222 = _T_3220 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3210 = _T_2814 | _T_1814; // @[lsu_bus_buffer.scala 424:110]
  wire  _T_3211 = ~_T_3210; // @[lsu_bus_buffer.scala 424:84]
  wire  _T_3212 = buf_rspageQ_0[2] & _T_3211; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3214 = _T_3212 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3202 = _T_2792 | _T_1803; // @[lsu_bus_buffer.scala 424:110]
  wire  _T_3203 = ~_T_3202; // @[lsu_bus_buffer.scala 424:84]
  wire  _T_3204 = buf_rspageQ_0[1] & _T_3203; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3206 = _T_3204 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3194 = _T_2770 | _T_1792; // @[lsu_bus_buffer.scala 424:110]
  wire  _T_3195 = ~_T_3194; // @[lsu_bus_buffer.scala 424:84]
  wire  _T_3196 = buf_rspageQ_0[0] & _T_3195; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3198 = _T_3196 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire [3:0] buf_rspage_0 = {_T_3222,_T_3214,_T_3206,_T_3198}; // @[Cat.scala 29:58]
  wire  _T_3133 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3136 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3139 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3142 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[lsu_bus_buffer.scala 423:88]
  wire [2:0] _T_3144 = {_T_3142,_T_3139,_T_3136}; // @[Cat.scala 29:58]
  wire  _T_3255 = buf_rspageQ_1[3] & _T_3219; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3257 = _T_3255 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3247 = buf_rspageQ_1[2] & _T_3211; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3249 = _T_3247 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3239 = buf_rspageQ_1[1] & _T_3203; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3241 = _T_3239 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3231 = buf_rspageQ_1[0] & _T_3195; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3233 = _T_3231 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire [3:0] buf_rspage_1 = {_T_3257,_T_3249,_T_3241,_T_3233}; // @[Cat.scala 29:58]
  wire  _T_3148 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3151 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3154 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3157 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[lsu_bus_buffer.scala 423:88]
  wire [2:0] _T_3159 = {_T_3157,_T_3154,_T_3151}; // @[Cat.scala 29:58]
  wire  _T_3290 = buf_rspageQ_2[3] & _T_3219; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3292 = _T_3290 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3282 = buf_rspageQ_2[2] & _T_3211; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3284 = _T_3282 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3274 = buf_rspageQ_2[1] & _T_3203; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3276 = _T_3274 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3266 = buf_rspageQ_2[0] & _T_3195; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3268 = _T_3266 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire [3:0] buf_rspage_2 = {_T_3292,_T_3284,_T_3276,_T_3268}; // @[Cat.scala 29:58]
  wire  _T_3163 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3166 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3169 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3172 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[lsu_bus_buffer.scala 423:88]
  wire [2:0] _T_3174 = {_T_3172,_T_3169,_T_3166}; // @[Cat.scala 29:58]
  wire  _T_3325 = buf_rspageQ_3[3] & _T_3219; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3327 = _T_3325 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3317 = buf_rspageQ_3[2] & _T_3211; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3319 = _T_3317 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3309 = buf_rspageQ_3[1] & _T_3203; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3311 = _T_3309 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire  _T_3301 = buf_rspageQ_3[0] & _T_3195; // @[lsu_bus_buffer.scala 424:82]
  wire  _T_3303 = _T_3301 & _T_2594; // @[lsu_bus_buffer.scala 424:136]
  wire [3:0] buf_rspage_3 = {_T_3327,_T_3319,_T_3311,_T_3303}; // @[Cat.scala 29:58]
  wire  _T_3178 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3181 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3184 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[lsu_bus_buffer.scala 423:88]
  wire  _T_3187 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[lsu_bus_buffer.scala 423:88]
  wire [2:0] _T_3189 = {_T_3187,_T_3184,_T_3181}; // @[Cat.scala 29:58]
  wire  _T_3332 = ibuf_drain_vld & _T_1793; // @[lsu_bus_buffer.scala 425:63]
  wire  _T_3334 = ibuf_drain_vld & _T_1804; // @[lsu_bus_buffer.scala 425:63]
  wire  _T_3336 = ibuf_drain_vld & _T_1815; // @[lsu_bus_buffer.scala 425:63]
  wire  _T_3338 = ibuf_drain_vld & _T_1826; // @[lsu_bus_buffer.scala 425:63]
  wire [3:0] ibuf_drainvec_vld = {_T_3338,_T_3336,_T_3334,_T_3332}; // @[Cat.scala 29:58]
  wire  _T_3346 = _T_3540 & _T_1796; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3355 = _T_3540 & _T_1807; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3364 = _T_3540 & _T_1818; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3373 = _T_3540 & _T_1829; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3403 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire  _T_3405 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire  _T_3407 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire  _T_3409 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire [3:0] buf_dual_in = {_T_3409,_T_3407,_T_3405,_T_3403}; // @[Cat.scala 29:58]
  wire  _T_3414 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire  _T_3416 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire  _T_3418 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire  _T_3420 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire [3:0] buf_samedw_in = {_T_3420,_T_3418,_T_3416,_T_3414}; // @[Cat.scala 29:58]
  wire  _T_3425 = ibuf_nomerge | ibuf_force_drain; // @[lsu_bus_buffer.scala 431:84]
  wire  _T_3426 = ibuf_drainvec_vld[0] ? _T_3425 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire  _T_3429 = ibuf_drainvec_vld[1] ? _T_3425 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire  _T_3432 = ibuf_drainvec_vld[2] ? _T_3425 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire  _T_3435 = ibuf_drainvec_vld[3] ? _T_3425 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire [3:0] buf_nomerge_in = {_T_3435,_T_3432,_T_3429,_T_3426}; // @[Cat.scala 29:58]
  wire  _T_3443 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3346; // @[lsu_bus_buffer.scala 432:47]
  wire  _T_3448 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3355; // @[lsu_bus_buffer.scala 432:47]
  wire  _T_3453 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3364; // @[lsu_bus_buffer.scala 432:47]
  wire  _T_3458 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3373; // @[lsu_bus_buffer.scala 432:47]
  wire [3:0] buf_dualhi_in = {_T_3458,_T_3453,_T_3448,_T_3443}; // @[Cat.scala 29:58]
  wire  _T_3487 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire  _T_3489 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire  _T_3491 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire  _T_3493 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire [3:0] buf_sideeffect_in = {_T_3493,_T_3491,_T_3489,_T_3487}; // @[Cat.scala 29:58]
  wire  _T_3498 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3500 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3502 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3504 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire [3:0] buf_unsign_in = {_T_3504,_T_3502,_T_3500,_T_3498}; // @[Cat.scala 29:58]
  wire  _T_3521 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire  _T_3523 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire  _T_3525 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire  _T_3527 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire [3:0] buf_write_in = {_T_3527,_T_3525,_T_3523,_T_3521}; // @[Cat.scala 29:58]
  wire  _T_3560 = obuf_nosend & bus_rsp_read; // @[lsu_bus_buffer.scala 457:89]
  wire  _T_3562 = _T_3560 & _T_1349; // @[lsu_bus_buffer.scala 457:104]
  wire  _T_3575 = buf_state_en_0 & _T_3645; // @[lsu_bus_buffer.scala 462:44]
  wire  _T_3576 = _T_3575 & obuf_nosend; // @[lsu_bus_buffer.scala 462:60]
  wire  _T_3578 = _T_3576 & _T_2594; // @[lsu_bus_buffer.scala 462:74]
  wire  _T_3581 = _T_3571 & obuf_nosend; // @[lsu_bus_buffer.scala 464:67]
  wire  _T_3582 = _T_3581 & bus_rsp_read; // @[lsu_bus_buffer.scala 464:81]
  wire  _T_4841 = io_lsu_axi_r_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 574:64]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4841; // @[lsu_bus_buffer.scala 574:38]
  wire  _T_3585 = _T_3581 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 465:82]
  wire  _T_3659 = bus_rsp_read_error & _T_3638; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_3661 = bus_rsp_read_error & buf_ldfwd[0]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_3663 = _T_3661 & _T_3640; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_3664 = _T_3659 | _T_3663; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4839 = io_lsu_axi_b_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 573:66]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4839; // @[lsu_bus_buffer.scala 573:40]
  wire  _T_3666 = bus_rsp_write_error & _T_3636; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_3667 = _T_3664 | _T_3666; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_3668 = _T_3571 & _T_3667; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_56 = _T_3592 & _T_3668; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_3558 ? _T_3585 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_3554 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3531 ? 1'h0 : _GEN_82; // @[Conditional.scala 40:58]
  wire  _T_3594 = ~bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:75]
  wire  _T_3595 = buf_write[0] & _T_3594; // @[lsu_bus_buffer.scala 470:73]
  wire  _T_3596 = io_dec_tlu_force_halt | _T_3595; // @[lsu_bus_buffer.scala 470:57]
  wire  _T_3598 = ~buf_samedw_0; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3599 = buf_dual_0 & _T_3598; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3602 = _T_3599 & _T_3645; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_29 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_30 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_29; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_31 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_30; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3603 = _GEN_31 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3604 = _T_3602 & _T_3603; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_4489 = _T_2717 | _T_2714; // @[lsu_bus_buffer.scala 534:93]
  wire  _T_4490 = _T_4489 | _T_2711; // @[lsu_bus_buffer.scala 534:93]
  wire  any_done_wait_state = _T_4490 | _T_2708; // @[lsu_bus_buffer.scala 534:93]
  wire  _T_3606 = buf_ldfwd[0] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3612 = buf_dualtag_0 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3614 = buf_dualtag_0 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3616 = buf_dualtag_0 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3618 = buf_dualtag_0 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3620 = _T_3612 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3621 = _T_3614 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3622 = _T_3616 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3623 = _T_3618 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3624 = _T_3620 | _T_3621; // @[Mux.scala 27:72]
  wire  _T_3625 = _T_3624 | _T_3622; // @[Mux.scala 27:72]
  wire  _T_3626 = _T_3625 | _T_3623; // @[Mux.scala 27:72]
  wire  _T_3628 = _T_3602 & _T_3626; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_3629 = _GEN_31 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_3630 = _T_3628 & _T_3629; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_3631 = _T_3630 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_3632 = _T_3606 | _T_3631; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_3655 = buf_state_bus_en_0 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_3656 = _T_3655 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_3669 = ~buf_error_en_0; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_3670 = buf_state_en_0 & _T_3669; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_3682 = buf_ldfwd[0] | _T_3687[0]; // @[lsu_bus_buffer.scala 488:90]
  wire  _T_3683 = _T_3682 | any_done_wait_state; // @[lsu_bus_buffer.scala 488:118]
  wire  _GEN_39 = _T_3703 ? buf_state_en_0 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3695 ? io_dec_tlu_force_halt : _T_3703; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3695 ? io_dec_tlu_force_halt : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_3677 ? io_dec_tlu_force_halt : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3677 ? io_dec_tlu_force_halt : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_3592 & _T_3656; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3592 ? io_dec_tlu_force_halt : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_3592 ? io_dec_tlu_force_halt : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3558 ? _T_3578 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3558 ? _T_3582 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3558 ? io_dec_tlu_force_halt : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_3554 ? io_dec_tlu_force_halt : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_3554 ? io_dec_tlu_force_halt : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_3554 ? 1'h0 : _GEN_68; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3531 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3531 ? buf_state_en_0 : _GEN_81; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3531 ? io_dec_tlu_force_halt : _GEN_76; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3531 ? io_dec_tlu_force_halt : _GEN_79; // @[Conditional.scala 40:58]
  wire  _T_3766 = buf_state_en_1 & _T_3836; // @[lsu_bus_buffer.scala 462:44]
  wire  _T_3767 = _T_3766 & obuf_nosend; // @[lsu_bus_buffer.scala 462:60]
  wire  _T_3769 = _T_3767 & _T_2594; // @[lsu_bus_buffer.scala 462:74]
  wire  _T_3772 = _T_3762 & obuf_nosend; // @[lsu_bus_buffer.scala 464:67]
  wire  _T_3773 = _T_3772 & bus_rsp_read; // @[lsu_bus_buffer.scala 464:81]
  wire  _T_3776 = _T_3772 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 465:82]
  wire  _T_3850 = bus_rsp_read_error & _T_3829; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_3852 = bus_rsp_read_error & buf_ldfwd[1]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_3854 = _T_3852 & _T_3831; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_3855 = _T_3850 | _T_3854; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_3857 = bus_rsp_write_error & _T_3827; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_3858 = _T_3855 | _T_3857; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_3859 = _T_3762 & _T_3858; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_132 = _T_3783 & _T_3859; // @[Conditional.scala 39:67]
  wire  _GEN_145 = _T_3749 ? _T_3776 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_158 = _T_3745 ? 1'h0 : _GEN_145; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3722 ? 1'h0 : _GEN_158; // @[Conditional.scala 40:58]
  wire  _T_3786 = buf_write[1] & _T_3594; // @[lsu_bus_buffer.scala 470:73]
  wire  _T_3787 = io_dec_tlu_force_halt | _T_3786; // @[lsu_bus_buffer.scala 470:57]
  wire  _T_3789 = ~buf_samedw_1; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3790 = buf_dual_1 & _T_3789; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3793 = _T_3790 & _T_3836; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_105 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_106 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_105; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_107 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_106; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3794 = _GEN_107 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3795 = _T_3793 & _T_3794; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_3797 = buf_ldfwd[1] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3803 = buf_dualtag_1 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3805 = buf_dualtag_1 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3807 = buf_dualtag_1 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3809 = buf_dualtag_1 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3811 = _T_3803 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3812 = _T_3805 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3813 = _T_3807 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3814 = _T_3809 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3815 = _T_3811 | _T_3812; // @[Mux.scala 27:72]
  wire  _T_3816 = _T_3815 | _T_3813; // @[Mux.scala 27:72]
  wire  _T_3817 = _T_3816 | _T_3814; // @[Mux.scala 27:72]
  wire  _T_3819 = _T_3793 & _T_3817; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_3820 = _GEN_107 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_3821 = _T_3819 & _T_3820; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_3822 = _T_3821 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_3823 = _T_3797 | _T_3822; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_3846 = buf_state_bus_en_1 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_3847 = _T_3846 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_3860 = ~buf_error_en_1; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_3861 = buf_state_en_1 & _T_3860; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_3873 = buf_ldfwd[1] | _T_3878[0]; // @[lsu_bus_buffer.scala 488:90]
  wire  _T_3874 = _T_3873 | any_done_wait_state; // @[lsu_bus_buffer.scala 488:118]
  wire  _GEN_115 = _T_3894 ? buf_state_en_1 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3886 ? io_dec_tlu_force_halt : _T_3894; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3886 ? io_dec_tlu_force_halt : _GEN_115; // @[Conditional.scala 39:67]
  wire  _GEN_125 = _T_3868 ? io_dec_tlu_force_halt : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3868 ? io_dec_tlu_force_halt : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_131 = _T_3783 & _T_3847; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3783 ? io_dec_tlu_force_halt : _GEN_125; // @[Conditional.scala 39:67]
  wire  _GEN_136 = _T_3783 ? io_dec_tlu_force_halt : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3749 ? _T_3769 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3749 ? _T_3773 : _GEN_131; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3749 ? io_dec_tlu_force_halt : _GEN_135; // @[Conditional.scala 39:67]
  wire  _GEN_152 = _T_3745 ? io_dec_tlu_force_halt : _GEN_147; // @[Conditional.scala 39:67]
  wire  _GEN_155 = _T_3745 ? io_dec_tlu_force_halt : _GEN_142; // @[Conditional.scala 39:67]
  wire  _GEN_157 = _T_3745 ? 1'h0 : _GEN_144; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3722 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3722 ? buf_state_en_1 : _GEN_157; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3722 ? io_dec_tlu_force_halt : _GEN_152; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3722 ? io_dec_tlu_force_halt : _GEN_155; // @[Conditional.scala 40:58]
  wire  _T_3957 = buf_state_en_2 & _T_4027; // @[lsu_bus_buffer.scala 462:44]
  wire  _T_3958 = _T_3957 & obuf_nosend; // @[lsu_bus_buffer.scala 462:60]
  wire  _T_3960 = _T_3958 & _T_2594; // @[lsu_bus_buffer.scala 462:74]
  wire  _T_3963 = _T_3953 & obuf_nosend; // @[lsu_bus_buffer.scala 464:67]
  wire  _T_3964 = _T_3963 & bus_rsp_read; // @[lsu_bus_buffer.scala 464:81]
  wire  _T_3967 = _T_3963 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 465:82]
  wire  _T_4041 = bus_rsp_read_error & _T_4020; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_4043 = bus_rsp_read_error & buf_ldfwd[2]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_4045 = _T_4043 & _T_4022; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_4046 = _T_4041 | _T_4045; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4048 = bus_rsp_write_error & _T_4018; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_4049 = _T_4046 | _T_4048; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_4050 = _T_3953 & _T_4049; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_208 = _T_3974 & _T_4050; // @[Conditional.scala 39:67]
  wire  _GEN_221 = _T_3940 ? _T_3967 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_234 = _T_3936 ? 1'h0 : _GEN_221; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3913 ? 1'h0 : _GEN_234; // @[Conditional.scala 40:58]
  wire  _T_3977 = buf_write[2] & _T_3594; // @[lsu_bus_buffer.scala 470:73]
  wire  _T_3978 = io_dec_tlu_force_halt | _T_3977; // @[lsu_bus_buffer.scala 470:57]
  wire  _T_3980 = ~buf_samedw_2; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3981 = buf_dual_2 & _T_3980; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3984 = _T_3981 & _T_4027; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_181 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_182 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_181; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_183 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_182; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3985 = _GEN_183 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3986 = _T_3984 & _T_3985; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_3988 = buf_ldfwd[2] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3994 = buf_dualtag_2 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3996 = buf_dualtag_2 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3998 = buf_dualtag_2 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4000 = buf_dualtag_2 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4002 = _T_3994 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4003 = _T_3996 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4004 = _T_3998 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4005 = _T_4000 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4006 = _T_4002 | _T_4003; // @[Mux.scala 27:72]
  wire  _T_4007 = _T_4006 | _T_4004; // @[Mux.scala 27:72]
  wire  _T_4008 = _T_4007 | _T_4005; // @[Mux.scala 27:72]
  wire  _T_4010 = _T_3984 & _T_4008; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_4011 = _GEN_183 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_4012 = _T_4010 & _T_4011; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_4013 = _T_4012 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_4014 = _T_3988 | _T_4013; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_4037 = buf_state_bus_en_2 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_4038 = _T_4037 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_4051 = ~buf_error_en_2; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_4052 = buf_state_en_2 & _T_4051; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_4064 = buf_ldfwd[2] | _T_4069[0]; // @[lsu_bus_buffer.scala 488:90]
  wire  _T_4065 = _T_4064 | any_done_wait_state; // @[lsu_bus_buffer.scala 488:118]
  wire  _GEN_191 = _T_4085 ? buf_state_en_2 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_4077 ? io_dec_tlu_force_halt : _T_4085; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_4077 ? io_dec_tlu_force_halt : _GEN_191; // @[Conditional.scala 39:67]
  wire  _GEN_201 = _T_4059 ? io_dec_tlu_force_halt : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_4059 ? io_dec_tlu_force_halt : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_207 = _T_3974 & _T_4038; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3974 ? io_dec_tlu_force_halt : _GEN_201; // @[Conditional.scala 39:67]
  wire  _GEN_212 = _T_3974 ? io_dec_tlu_force_halt : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3940 ? _T_3960 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3940 ? _T_3964 : _GEN_207; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3940 ? io_dec_tlu_force_halt : _GEN_211; // @[Conditional.scala 39:67]
  wire  _GEN_228 = _T_3936 ? io_dec_tlu_force_halt : _GEN_223; // @[Conditional.scala 39:67]
  wire  _GEN_231 = _T_3936 ? io_dec_tlu_force_halt : _GEN_218; // @[Conditional.scala 39:67]
  wire  _GEN_233 = _T_3936 ? 1'h0 : _GEN_220; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3913 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3913 ? buf_state_en_2 : _GEN_233; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3913 ? io_dec_tlu_force_halt : _GEN_228; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3913 ? io_dec_tlu_force_halt : _GEN_231; // @[Conditional.scala 40:58]
  wire  _T_4148 = buf_state_en_3 & _T_4218; // @[lsu_bus_buffer.scala 462:44]
  wire  _T_4149 = _T_4148 & obuf_nosend; // @[lsu_bus_buffer.scala 462:60]
  wire  _T_4151 = _T_4149 & _T_2594; // @[lsu_bus_buffer.scala 462:74]
  wire  _T_4154 = _T_4144 & obuf_nosend; // @[lsu_bus_buffer.scala 464:67]
  wire  _T_4155 = _T_4154 & bus_rsp_read; // @[lsu_bus_buffer.scala 464:81]
  wire  _T_4158 = _T_4154 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 465:82]
  wire  _T_4232 = bus_rsp_read_error & _T_4211; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_4234 = bus_rsp_read_error & buf_ldfwd[3]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_4236 = _T_4234 & _T_4213; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_4237 = _T_4232 | _T_4236; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4239 = bus_rsp_write_error & _T_4209; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_4240 = _T_4237 | _T_4239; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_4241 = _T_4144 & _T_4240; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_284 = _T_4165 & _T_4241; // @[Conditional.scala 39:67]
  wire  _GEN_297 = _T_4131 ? _T_4158 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_310 = _T_4127 ? 1'h0 : _GEN_297; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4104 ? 1'h0 : _GEN_310; // @[Conditional.scala 40:58]
  wire  _T_4168 = buf_write[3] & _T_3594; // @[lsu_bus_buffer.scala 470:73]
  wire  _T_4169 = io_dec_tlu_force_halt | _T_4168; // @[lsu_bus_buffer.scala 470:57]
  wire  _T_4171 = ~buf_samedw_3; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_4172 = buf_dual_3 & _T_4171; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_4175 = _T_4172 & _T_4218; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_257 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_258 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_257; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_259 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_258; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_4176 = _GEN_259 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_4177 = _T_4175 & _T_4176; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_4179 = buf_ldfwd[3] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_4185 = buf_dualtag_3 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4187 = buf_dualtag_3 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4189 = buf_dualtag_3 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4191 = buf_dualtag_3 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4193 = _T_4185 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4194 = _T_4187 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4195 = _T_4189 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4196 = _T_4191 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4197 = _T_4193 | _T_4194; // @[Mux.scala 27:72]
  wire  _T_4198 = _T_4197 | _T_4195; // @[Mux.scala 27:72]
  wire  _T_4199 = _T_4198 | _T_4196; // @[Mux.scala 27:72]
  wire  _T_4201 = _T_4175 & _T_4199; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_4202 = _GEN_259 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_4203 = _T_4201 & _T_4202; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_4204 = _T_4203 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_4205 = _T_4179 | _T_4204; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_4228 = buf_state_bus_en_3 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_4229 = _T_4228 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_4242 = ~buf_error_en_3; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_4243 = buf_state_en_3 & _T_4242; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_4255 = buf_ldfwd[3] | _T_4260[0]; // @[lsu_bus_buffer.scala 488:90]
  wire  _T_4256 = _T_4255 | any_done_wait_state; // @[lsu_bus_buffer.scala 488:118]
  wire  _GEN_267 = _T_4276 ? buf_state_en_3 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4268 ? io_dec_tlu_force_halt : _T_4276; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4268 ? io_dec_tlu_force_halt : _GEN_267; // @[Conditional.scala 39:67]
  wire  _GEN_277 = _T_4250 ? io_dec_tlu_force_halt : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4250 ? io_dec_tlu_force_halt : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_283 = _T_4165 & _T_4229; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4165 ? io_dec_tlu_force_halt : _GEN_277; // @[Conditional.scala 39:67]
  wire  _GEN_288 = _T_4165 ? io_dec_tlu_force_halt : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4131 ? _T_4151 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4131 ? _T_4155 : _GEN_283; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4131 ? io_dec_tlu_force_halt : _GEN_287; // @[Conditional.scala 39:67]
  wire  _GEN_304 = _T_4127 ? io_dec_tlu_force_halt : _GEN_299; // @[Conditional.scala 39:67]
  wire  _GEN_307 = _T_4127 ? io_dec_tlu_force_halt : _GEN_294; // @[Conditional.scala 39:67]
  wire  _GEN_309 = _T_4127 ? 1'h0 : _GEN_296; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4104 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_4104 ? buf_state_en_3 : _GEN_309; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4104 ? io_dec_tlu_force_halt : _GEN_304; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4104 ? io_dec_tlu_force_halt : _GEN_307; // @[Conditional.scala 40:58]
  reg  _T_4331; // @[Reg.scala 27:20]
  reg  _T_4334; // @[Reg.scala 27:20]
  reg  _T_4337; // @[Reg.scala 27:20]
  reg  _T_4340; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4340,_T_4337,_T_4334,_T_4331}; // @[Cat.scala 29:58]
  wire  _T_4387 = ~buf_rst_0; // @[lsu_bus_buffer.scala 529:81]
  reg  _T_4406; // @[lsu_bus_buffer.scala 529:80]
  reg  _T_4401; // @[lsu_bus_buffer.scala 529:80]
  reg  _T_4396; // @[lsu_bus_buffer.scala 529:80]
  reg  _T_4391; // @[lsu_bus_buffer.scala 529:80]
  wire [3:0] buf_error = {_T_4406,_T_4401,_T_4396,_T_4391}; // @[Cat.scala 29:58]
  wire  _T_4389 = buf_error_en_0 | buf_error[0]; // @[lsu_bus_buffer.scala 529:98]
  wire  _T_4392 = ~buf_rst_1; // @[lsu_bus_buffer.scala 529:81]
  wire  _T_4394 = buf_error_en_1 | buf_error[1]; // @[lsu_bus_buffer.scala 529:98]
  wire  _T_4397 = ~buf_rst_2; // @[lsu_bus_buffer.scala 529:81]
  wire  _T_4399 = buf_error_en_2 | buf_error[2]; // @[lsu_bus_buffer.scala 529:98]
  wire  _T_4402 = ~buf_rst_3; // @[lsu_bus_buffer.scala 529:81]
  wire  _T_4404 = buf_error_en_3 | buf_error[3]; // @[lsu_bus_buffer.scala 529:98]
  wire [1:0] _T_4410 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4411 = io_ldst_dual_m ? _T_4410 : {{1'd0}, io_lsu_busreq_m}; // @[lsu_bus_buffer.scala 530:28]
  wire [1:0] _T_4412 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4413 = io_ldst_dual_r ? _T_4412 : {{1'd0}, io_lsu_busreq_r}; // @[lsu_bus_buffer.scala 530:94]
  wire [2:0] _T_4414 = _T_4411 + _T_4413; // @[lsu_bus_buffer.scala 530:88]
  wire [2:0] _GEN_406 = {{2'd0}, ibuf_valid}; // @[lsu_bus_buffer.scala 530:154]
  wire [3:0] _T_4415 = _T_4414 + _GEN_406; // @[lsu_bus_buffer.scala 530:154]
  wire [1:0] _T_4420 = _T_5 + _T_12; // @[lsu_bus_buffer.scala 530:217]
  wire [1:0] _GEN_407 = {{1'd0}, _T_19}; // @[lsu_bus_buffer.scala 530:217]
  wire [2:0] _T_4421 = _T_4420 + _GEN_407; // @[lsu_bus_buffer.scala 530:217]
  wire [2:0] _GEN_408 = {{2'd0}, _T_26}; // @[lsu_bus_buffer.scala 530:217]
  wire [3:0] _T_4422 = _T_4421 + _GEN_408; // @[lsu_bus_buffer.scala 530:217]
  wire [3:0] buf_numvld_any = _T_4415 + _T_4422; // @[lsu_bus_buffer.scala 530:169]
  wire  _T_4493 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[lsu_bus_buffer.scala 536:52]
  wire  _T_4494 = buf_numvld_any >= 4'h3; // @[lsu_bus_buffer.scala 536:92]
  wire  _T_4495 = buf_numvld_any == 4'h4; // @[lsu_bus_buffer.scala 536:121]
  wire  _T_4497 = |buf_state_0; // @[lsu_bus_buffer.scala 537:52]
  wire  _T_4498 = |buf_state_1; // @[lsu_bus_buffer.scala 537:52]
  wire  _T_4499 = |buf_state_2; // @[lsu_bus_buffer.scala 537:52]
  wire  _T_4500 = |buf_state_3; // @[lsu_bus_buffer.scala 537:52]
  wire  _T_4501 = _T_4497 | _T_4498; // @[lsu_bus_buffer.scala 537:65]
  wire  _T_4502 = _T_4501 | _T_4499; // @[lsu_bus_buffer.scala 537:65]
  wire  _T_4503 = _T_4502 | _T_4500; // @[lsu_bus_buffer.scala 537:65]
  wire  _T_4504 = ~_T_4503; // @[lsu_bus_buffer.scala 537:34]
  wire  _T_4506 = _T_4504 & _T_852; // @[lsu_bus_buffer.scala 537:70]
  wire  _T_4509 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[lsu_bus_buffer.scala 539:64]
  wire  _T_4510 = _T_4509 & io_lsu_pkt_m_bits_load; // @[lsu_bus_buffer.scala 539:85]
  wire  _T_4511 = ~io_flush_m_up; // @[lsu_bus_buffer.scala 539:112]
  wire  _T_4512 = _T_4510 & _T_4511; // @[lsu_bus_buffer.scala 539:110]
  wire  _T_4513 = ~io_ld_full_hit_m; // @[lsu_bus_buffer.scala 539:129]
  wire  _T_4515 = ~io_lsu_commit_r; // @[lsu_bus_buffer.scala 542:74]
  reg  lsu_nonblock_load_valid_r; // @[lsu_bus_buffer.scala 627:66]
  wire  _T_4529 = _T_2770 & _T_3645; // @[Mux.scala 27:72]
  wire  _T_4530 = _T_2792 & _T_3836; // @[Mux.scala 27:72]
  wire  _T_4531 = _T_2814 & _T_4027; // @[Mux.scala 27:72]
  wire  _T_4532 = _T_2836 & _T_4218; // @[Mux.scala 27:72]
  wire  _T_4533 = _T_4529 | _T_4530; // @[Mux.scala 27:72]
  wire  _T_4534 = _T_4533 | _T_4531; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4534 | _T_4532; // @[Mux.scala 27:72]
  wire  _T_4540 = buf_error[0] & _T_3645; // @[lsu_bus_buffer.scala 545:121]
  wire  _T_4545 = buf_error[1] & _T_3836; // @[lsu_bus_buffer.scala 545:121]
  wire  _T_4550 = buf_error[2] & _T_4027; // @[lsu_bus_buffer.scala 545:121]
  wire  _T_4555 = buf_error[3] & _T_4218; // @[lsu_bus_buffer.scala 545:121]
  wire  _T_4556 = _T_2770 & _T_4540; // @[Mux.scala 27:72]
  wire  _T_4557 = _T_2792 & _T_4545; // @[Mux.scala 27:72]
  wire  _T_4558 = _T_2814 & _T_4550; // @[Mux.scala 27:72]
  wire  _T_4559 = _T_2836 & _T_4555; // @[Mux.scala 27:72]
  wire  _T_4560 = _T_4556 | _T_4557; // @[Mux.scala 27:72]
  wire  _T_4561 = _T_4560 | _T_4558; // @[Mux.scala 27:72]
  wire  _T_4568 = ~buf_dual_0; // @[lsu_bus_buffer.scala 546:121]
  wire  _T_4569 = ~buf_dualhi_0; // @[lsu_bus_buffer.scala 546:136]
  wire  _T_4570 = _T_4568 | _T_4569; // @[lsu_bus_buffer.scala 546:134]
  wire  _T_4571 = _T_4529 & _T_4570; // @[lsu_bus_buffer.scala 546:118]
  wire  _T_4576 = ~buf_dual_1; // @[lsu_bus_buffer.scala 546:121]
  wire  _T_4577 = ~buf_dualhi_1; // @[lsu_bus_buffer.scala 546:136]
  wire  _T_4578 = _T_4576 | _T_4577; // @[lsu_bus_buffer.scala 546:134]
  wire  _T_4579 = _T_4530 & _T_4578; // @[lsu_bus_buffer.scala 546:118]
  wire  _T_4584 = ~buf_dual_2; // @[lsu_bus_buffer.scala 546:121]
  wire  _T_4585 = ~buf_dualhi_2; // @[lsu_bus_buffer.scala 546:136]
  wire  _T_4586 = _T_4584 | _T_4585; // @[lsu_bus_buffer.scala 546:134]
  wire  _T_4587 = _T_4531 & _T_4586; // @[lsu_bus_buffer.scala 546:118]
  wire  _T_4592 = ~buf_dual_3; // @[lsu_bus_buffer.scala 546:121]
  wire  _T_4593 = ~buf_dualhi_3; // @[lsu_bus_buffer.scala 546:136]
  wire  _T_4594 = _T_4592 | _T_4593; // @[lsu_bus_buffer.scala 546:134]
  wire  _T_4595 = _T_4532 & _T_4594; // @[lsu_bus_buffer.scala 546:118]
  wire [1:0] _T_4598 = _T_4587 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4599 = _T_4595 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_409 = {{1'd0}, _T_4579}; // @[Mux.scala 27:72]
  wire [1:0] _T_4601 = _GEN_409 | _T_4598; // @[Mux.scala 27:72]
  wire [31:0] _T_4636 = _T_4571 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4637 = _T_4579 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4638 = _T_4587 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4639 = _T_4595 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4640 = _T_4636 | _T_4637; // @[Mux.scala 27:72]
  wire [31:0] _T_4641 = _T_4640 | _T_4638; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4641 | _T_4639; // @[Mux.scala 27:72]
  wire  _T_4648 = _T_4529 & _T_3643; // @[lsu_bus_buffer.scala 548:105]
  wire  _T_4654 = _T_4530 & _T_3834; // @[lsu_bus_buffer.scala 548:105]
  wire  _T_4660 = _T_4531 & _T_4025; // @[lsu_bus_buffer.scala 548:105]
  wire  _T_4666 = _T_4532 & _T_4216; // @[lsu_bus_buffer.scala 548:105]
  wire [31:0] _T_4667 = _T_4648 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4668 = _T_4654 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4669 = _T_4660 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4670 = _T_4666 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4667 | _T_4668; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4671 | _T_4669; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4672 | _T_4670; // @[Mux.scala 27:72]
  wire  _T_4674 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h0; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4675 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h1; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4676 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h2; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4677 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h3; // @[lsu_bus_buffer.scala 61:123]
  wire [31:0] _T_4678 = _T_4674 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4679 = _T_4675 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4680 = _T_4676 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4681 = _T_4677 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4682 = _T_4678 | _T_4679; // @[Mux.scala 27:72]
  wire [31:0] _T_4683 = _T_4682 | _T_4680; // @[Mux.scala 27:72]
  wire [31:0] _T_4684 = _T_4683 | _T_4681; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4684[1:0]; // @[lsu_bus_buffer.scala 549:96]
  wire [1:0] _T_4690 = _T_4674 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4691 = _T_4675 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4692 = _T_4676 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4693 = _T_4677 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4694 = _T_4690 | _T_4691; // @[Mux.scala 27:72]
  wire [1:0] _T_4695 = _T_4694 | _T_4692; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4695 | _T_4693; // @[Mux.scala 27:72]
  wire  _T_4705 = _T_4674 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4706 = _T_4675 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4707 = _T_4676 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4708 = _T_4677 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4709 = _T_4705 | _T_4706; // @[Mux.scala 27:72]
  wire  _T_4710 = _T_4709 | _T_4707; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4710 | _T_4708; // @[Mux.scala 27:72]
  wire [63:0] _T_4712 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_410 = {{2'd0}, lsu_nonblock_addr_offset}; // @[lsu_bus_buffer.scala 553:121]
  wire [5:0] _T_4713 = _GEN_410 * 4'h8; // @[lsu_bus_buffer.scala 553:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4712 >> _T_4713; // @[lsu_bus_buffer.scala 553:92]
  wire  _T_4714 = ~io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_buffer.scala 555:82]
  wire  _T_4716 = lsu_nonblock_sz == 2'h0; // @[lsu_bus_buffer.scala 556:94]
  wire  _T_4717 = lsu_nonblock_unsign & _T_4716; // @[lsu_bus_buffer.scala 556:76]
  wire [31:0] _T_4719 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4720 = lsu_nonblock_sz == 2'h1; // @[lsu_bus_buffer.scala 557:45]
  wire  _T_4721 = lsu_nonblock_unsign & _T_4720; // @[lsu_bus_buffer.scala 557:26]
  wire [31:0] _T_4723 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4724 = ~lsu_nonblock_unsign; // @[lsu_bus_buffer.scala 558:6]
  wire  _T_4726 = _T_4724 & _T_4716; // @[lsu_bus_buffer.scala 558:27]
  wire [23:0] _T_4729 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4731 = {_T_4729,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4734 = _T_4724 & _T_4720; // @[lsu_bus_buffer.scala 559:27]
  wire [15:0] _T_4737 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4739 = {_T_4737,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4740 = lsu_nonblock_sz == 2'h2; // @[lsu_bus_buffer.scala 560:21]
  wire [31:0] _T_4741 = _T_4717 ? _T_4719 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4742 = _T_4721 ? _T_4723 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4743 = _T_4726 ? _T_4731 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4744 = _T_4734 ? _T_4739 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4745 = _T_4740 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4746 = _T_4741 | _T_4742; // @[Mux.scala 27:72]
  wire [31:0] _T_4747 = _T_4746 | _T_4743; // @[Mux.scala 27:72]
  wire [31:0] _T_4748 = _T_4747 | _T_4744; // @[Mux.scala 27:72]
  wire [63:0] _GEN_411 = {{32'd0}, _T_4748}; // @[Mux.scala 27:72]
  wire [63:0] _T_4749 = _GEN_411 | _T_4745; // @[Mux.scala 27:72]
  wire  _T_4843 = obuf_valid & obuf_write; // @[lsu_bus_buffer.scala 578:37]
  wire  _T_4844 = ~obuf_cmd_done; // @[lsu_bus_buffer.scala 578:52]
  wire  _T_4845 = _T_4843 & _T_4844; // @[lsu_bus_buffer.scala 578:50]
  wire [31:0] _T_4849 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4851 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4856 = ~obuf_data_done; // @[lsu_bus_buffer.scala 590:51]
  wire  _T_4857 = _T_4843 & _T_4856; // @[lsu_bus_buffer.scala 590:49]
  wire [7:0] _T_4861 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4864 = obuf_valid & _T_1341; // @[lsu_bus_buffer.scala 595:37]
  wire  _T_4866 = _T_4864 & _T_1347; // @[lsu_bus_buffer.scala 595:51]
  wire  _T_4878 = io_lsu_bus_clk_en_q & buf_error[0]; // @[lsu_bus_buffer.scala 608:126]
  wire  _T_4880 = _T_4878 & buf_write[0]; // @[lsu_bus_buffer.scala 608:141]
  wire  _T_4883 = io_lsu_bus_clk_en_q & buf_error[1]; // @[lsu_bus_buffer.scala 608:126]
  wire  _T_4885 = _T_4883 & buf_write[1]; // @[lsu_bus_buffer.scala 608:141]
  wire  _T_4888 = io_lsu_bus_clk_en_q & buf_error[2]; // @[lsu_bus_buffer.scala 608:126]
  wire  _T_4890 = _T_4888 & buf_write[2]; // @[lsu_bus_buffer.scala 608:141]
  wire  _T_4893 = io_lsu_bus_clk_en_q & buf_error[3]; // @[lsu_bus_buffer.scala 608:126]
  wire  _T_4895 = _T_4893 & buf_write[3]; // @[lsu_bus_buffer.scala 608:141]
  wire  _T_4896 = _T_2770 & _T_4880; // @[Mux.scala 27:72]
  wire  _T_4897 = _T_2792 & _T_4885; // @[Mux.scala 27:72]
  wire  _T_4898 = _T_2814 & _T_4890; // @[Mux.scala 27:72]
  wire  _T_4899 = _T_2836 & _T_4895; // @[Mux.scala 27:72]
  wire  _T_4900 = _T_4896 | _T_4897; // @[Mux.scala 27:72]
  wire  _T_4901 = _T_4900 | _T_4898; // @[Mux.scala 27:72]
  wire  _T_4911 = _T_2792 & buf_error[1]; // @[lsu_bus_buffer.scala 609:93]
  wire  _T_4913 = _T_4911 & buf_write[1]; // @[lsu_bus_buffer.scala 609:108]
  wire  _T_4916 = _T_2814 & buf_error[2]; // @[lsu_bus_buffer.scala 609:93]
  wire  _T_4918 = _T_4916 & buf_write[2]; // @[lsu_bus_buffer.scala 609:108]
  wire  _T_4921 = _T_2836 & buf_error[3]; // @[lsu_bus_buffer.scala 609:93]
  wire  _T_4923 = _T_4921 & buf_write[3]; // @[lsu_bus_buffer.scala 609:108]
  wire [1:0] _T_4926 = _T_4918 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4927 = _T_4923 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_412 = {{1'd0}, _T_4913}; // @[Mux.scala 27:72]
  wire [1:0] _T_4929 = _GEN_412 | _T_4926; // @[Mux.scala 27:72]
  wire [1:0] lsu_imprecise_error_store_tag = _T_4929 | _T_4927; // @[Mux.scala 27:72]
  wire  _T_4931 = ~io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 611:97]
  wire [31:0] _GEN_369 = 2'h1 == lsu_imprecise_error_store_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 612:53]
  wire [31:0] _GEN_370 = 2'h2 == lsu_imprecise_error_store_tag ? buf_addr_2 : _GEN_369; // @[lsu_bus_buffer.scala 612:53]
  wire [31:0] _GEN_371 = 2'h3 == lsu_imprecise_error_store_tag ? buf_addr_3 : _GEN_370; // @[lsu_bus_buffer.scala 612:53]
  wire [31:0] _GEN_373 = 2'h1 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 612:53]
  wire [31:0] _GEN_374 = 2'h2 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_2 : _GEN_373; // @[lsu_bus_buffer.scala 612:53]
  wire [31:0] _GEN_375 = 2'h3 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_3 : _GEN_374; // @[lsu_bus_buffer.scala 612:53]
  wire  _T_4936 = bus_wcmd_sent | bus_wdata_sent; // @[lsu_bus_buffer.scala 618:82]
  wire  _T_4939 = io_lsu_busreq_r & io_ldst_dual_r; // @[lsu_bus_buffer.scala 619:60]
  wire  _T_4942 = ~io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 622:61]
  wire  _T_4943 = io_lsu_axi_aw_valid & _T_4942; // @[lsu_bus_buffer.scala 622:59]
  wire  _T_4944 = ~io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 622:107]
  wire  _T_4945 = io_lsu_axi_w_valid & _T_4944; // @[lsu_bus_buffer.scala 622:105]
  wire  _T_4946 = _T_4943 | _T_4945; // @[lsu_bus_buffer.scala 622:83]
  wire  _T_4947 = ~io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 622:153]
  wire  _T_4948 = io_lsu_axi_ar_valid & _T_4947; // @[lsu_bus_buffer.scala 622:151]
  wire  _T_4952 = ~io_flush_r; // @[lsu_bus_buffer.scala 626:75]
  wire  _T_4953 = io_lsu_busreq_m & _T_4952; // @[lsu_bus_buffer.scala 626:73]
  reg  _T_4956; // @[lsu_bus_buffer.scala 626:56]
  rvclkhdr rvclkhdr ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  assign io_tlu_busbuff_lsu_pmu_bus_trxn = _T_4936 | _T_4835; // @[lsu_bus_buffer.scala 618:35]
  assign io_tlu_busbuff_lsu_pmu_bus_misaligned = _T_4939 & io_lsu_commit_r; // @[lsu_bus_buffer.scala 619:41]
  assign io_tlu_busbuff_lsu_pmu_bus_error = io_tlu_busbuff_lsu_imprecise_error_load_any | io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 620:36]
  assign io_tlu_busbuff_lsu_pmu_bus_busy = _T_4946 | _T_4948; // @[lsu_bus_buffer.scala 622:35]
  assign io_tlu_busbuff_lsu_imprecise_error_load_any = io_dctl_busbuff_lsu_nonblock_load_data_error & _T_4931; // @[lsu_bus_buffer.scala 611:47]
  assign io_tlu_busbuff_lsu_imprecise_error_store_any = _T_4901 | _T_4899; // @[lsu_bus_buffer.scala 608:48]
  assign io_tlu_busbuff_lsu_imprecise_error_addr_any = io_tlu_busbuff_lsu_imprecise_error_store_any ? _GEN_371 : _GEN_375; // @[lsu_bus_buffer.scala 612:47]
  assign io_dctl_busbuff_lsu_nonblock_load_valid_m = _T_4512 & _T_4513; // @[lsu_bus_buffer.scala 539:45]
  assign io_dctl_busbuff_lsu_nonblock_load_tag_m = _T_1802 ? 2'h0 : _T_1838; // @[lsu_bus_buffer.scala 540:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4515; // @[lsu_bus_buffer.scala 542:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[lsu_bus_buffer.scala 543:47]
  assign io_dctl_busbuff_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4714; // @[lsu_bus_buffer.scala 555:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_error = _T_4561 | _T_4559; // @[lsu_bus_buffer.scala 545:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_tag = _T_4601 | _T_4599; // @[lsu_bus_buffer.scala 546:45]
  assign io_dctl_busbuff_lsu_nonblock_load_data = _T_4749[31:0]; // @[lsu_bus_buffer.scala 556:42]
  assign io_lsu_axi_aw_valid = _T_4845 & _T_1237; // @[lsu_bus_buffer.scala 578:23]
  assign io_lsu_axi_aw_bits_id = {{1'd0}, _T_1781}; // @[lsu_bus_buffer.scala 579:25]
  assign io_lsu_axi_aw_bits_addr = obuf_sideeffect ? obuf_addr : _T_4849; // @[lsu_bus_buffer.scala 580:27]
  assign io_lsu_axi_aw_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 584:29]
  assign io_lsu_axi_aw_bits_len = 8'h0; // @[lsu_bus_buffer.scala 585:26]
  assign io_lsu_axi_aw_bits_size = obuf_sideeffect ? _T_4851 : 3'h3; // @[lsu_bus_buffer.scala 581:27]
  assign io_lsu_axi_aw_bits_burst = 2'h1; // @[lsu_bus_buffer.scala 586:28]
  assign io_lsu_axi_aw_bits_lock = 1'h0; // @[lsu_bus_buffer.scala 588:27]
  assign io_lsu_axi_aw_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 583:28]
  assign io_lsu_axi_aw_bits_prot = 3'h1; // @[lsu_bus_buffer.scala 582:27]
  assign io_lsu_axi_aw_bits_qos = 4'h0; // @[lsu_bus_buffer.scala 587:26]
  assign io_lsu_axi_w_valid = _T_4857 & _T_1237; // @[lsu_bus_buffer.scala 590:22]
  assign io_lsu_axi_w_bits_data = obuf_data; // @[lsu_bus_buffer.scala 592:26]
  assign io_lsu_axi_w_bits_strb = obuf_byteen & _T_4861; // @[lsu_bus_buffer.scala 591:26]
  assign io_lsu_axi_w_bits_last = 1'h1; // @[lsu_bus_buffer.scala 593:26]
  assign io_lsu_axi_b_ready = 1'h1; // @[lsu_bus_buffer.scala 606:22]
  assign io_lsu_axi_ar_valid = _T_4866 & _T_1237; // @[lsu_bus_buffer.scala 595:23]
  assign io_lsu_axi_ar_bits_id = {{1'd0}, _T_1781}; // @[lsu_bus_buffer.scala 596:25]
  assign io_lsu_axi_ar_bits_addr = obuf_sideeffect ? obuf_addr : _T_4849; // @[lsu_bus_buffer.scala 597:27]
  assign io_lsu_axi_ar_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 601:29]
  assign io_lsu_axi_ar_bits_len = 8'h0; // @[lsu_bus_buffer.scala 602:26]
  assign io_lsu_axi_ar_bits_size = obuf_sideeffect ? _T_4851 : 3'h3; // @[lsu_bus_buffer.scala 598:27]
  assign io_lsu_axi_ar_bits_burst = 2'h1; // @[lsu_bus_buffer.scala 603:28]
  assign io_lsu_axi_ar_bits_lock = 1'h0; // @[lsu_bus_buffer.scala 605:27]
  assign io_lsu_axi_ar_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 600:28]
  assign io_lsu_axi_ar_bits_prot = 3'h1; // @[lsu_bus_buffer.scala 599:27]
  assign io_lsu_axi_ar_bits_qos = 4'h0; // @[lsu_bus_buffer.scala 604:26]
  assign io_lsu_axi_r_ready = 1'h1; // @[lsu_bus_buffer.scala 607:22]
  assign io_lsu_busreq_r = _T_4956; // @[lsu_bus_buffer.scala 626:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[lsu_bus_buffer.scala 535:30]
  assign io_lsu_bus_buffer_full_any = _T_4493 ? _T_4494 : _T_4495; // @[lsu_bus_buffer.scala 536:30]
  assign io_lsu_bus_buffer_empty_any = _T_4506 & _T_1231; // @[lsu_bus_buffer.scala 537:31]
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
  assign rvclkhdr_4_io_en = _T_3531 & buf_state_en_0; // @[lib.scala 393:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_5_io_en = _T_3722 & buf_state_en_1; // @[lib.scala 393:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_6_io_en = _T_3913 & buf_state_en_2; // @[lib.scala 393:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_7_io_en = _T_4104 & buf_state_en_3; // @[lib.scala 393:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_8_io_en = _T_3531 ? buf_state_en_0 : _GEN_81; // @[lib.scala 393:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_9_io_en = _T_3722 ? buf_state_en_1 : _GEN_157; // @[lib.scala 393:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_10_io_en = _T_3913 ? buf_state_en_2 : _GEN_233; // @[lib.scala 393:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_11_io_en = _T_4104 ? buf_state_en_3 : _GEN_309; // @[lib.scala 393:17]
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
  _T_4355 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4352 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4349 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4346 = _RAND_4[0:0];
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
  _T_1781 = _RAND_17[1:0];
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
  _T_1791 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  buf_nomerge_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  buf_nomerge_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  buf_nomerge_2 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  buf_nomerge_3 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4325 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4322 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4319 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4316 = _RAND_53[0:0];
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
  _T_4302 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4300 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4298 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4296 = _RAND_88[0:0];
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
  _T_4331 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4334 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4337 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4340 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4406 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4401 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4396 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4391 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4956 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (!reset) begin
    buf_addr_0 = 32'h0;
  end
  if (!reset) begin
    _T_4355 = 1'h0;
  end
  if (!reset) begin
    _T_4352 = 1'h0;
  end
  if (!reset) begin
    _T_4349 = 1'h0;
  end
  if (!reset) begin
    _T_4346 = 1'h0;
  end
  if (!reset) begin
    buf_state_0 = 3'h0;
  end
  if (!reset) begin
    buf_addr_1 = 32'h0;
  end
  if (!reset) begin
    buf_state_1 = 3'h0;
  end
  if (!reset) begin
    buf_addr_2 = 32'h0;
  end
  if (!reset) begin
    buf_state_2 = 3'h0;
  end
  if (!reset) begin
    buf_addr_3 = 32'h0;
  end
  if (!reset) begin
    buf_state_3 = 3'h0;
  end
  if (!reset) begin
    buf_byteen_3 = 4'h0;
  end
  if (!reset) begin
    buf_byteen_2 = 4'h0;
  end
  if (!reset) begin
    buf_byteen_1 = 4'h0;
  end
  if (!reset) begin
    buf_byteen_0 = 4'h0;
  end
  if (!reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (!reset) begin
    _T_1781 = 2'h0;
  end
  if (!reset) begin
    obuf_merge = 1'h0;
  end
  if (!reset) begin
    obuf_tag1 = 2'h0;
  end
  if (!reset) begin
    obuf_valid = 1'h0;
  end
  if (!reset) begin
    obuf_wr_enQ = 1'h0;
  end
  if (!reset) begin
    ibuf_addr = 32'h0;
  end
  if (!reset) begin
    ibuf_write = 1'h0;
  end
  if (!reset) begin
    ibuf_valid = 1'h0;
  end
  if (!reset) begin
    ibuf_byteen = 4'h0;
  end
  if (!reset) begin
    buf_ageQ_2 = 4'h0;
  end
  if (!reset) begin
    buf_ageQ_1 = 4'h0;
  end
  if (!reset) begin
    buf_ageQ_0 = 4'h0;
  end
  if (!reset) begin
    buf_data_0 = 32'h0;
  end
  if (!reset) begin
    buf_data_1 = 32'h0;
  end
  if (!reset) begin
    buf_data_2 = 32'h0;
  end
  if (!reset) begin
    buf_data_3 = 32'h0;
  end
  if (!reset) begin
    ibuf_data = 32'h0;
  end
  if (!reset) begin
    ibuf_timer = 3'h0;
  end
  if (!reset) begin
    ibuf_sideeffect = 1'h0;
  end
  if (!reset) begin
    WrPtr1_r = 2'h0;
  end
  if (!reset) begin
    WrPtr0_r = 2'h0;
  end
  if (!reset) begin
    ibuf_tag = 2'h0;
  end
  if (!reset) begin
    ibuf_dualtag = 2'h0;
  end
  if (!reset) begin
    ibuf_dual = 1'h0;
  end
  if (!reset) begin
    ibuf_samedw = 1'h0;
  end
  if (!reset) begin
    ibuf_nomerge = 1'h0;
  end
  if (!reset) begin
    ibuf_unsign = 1'h0;
  end
  if (!reset) begin
    ibuf_sz = 2'h0;
  end
  if (!reset) begin
    _T_1791 = 1'h0;
  end
  if (!reset) begin
    buf_nomerge_0 = 1'h0;
  end
  if (!reset) begin
    buf_nomerge_1 = 1'h0;
  end
  if (!reset) begin
    buf_nomerge_2 = 1'h0;
  end
  if (!reset) begin
    buf_nomerge_3 = 1'h0;
  end
  if (!reset) begin
    _T_4325 = 1'h0;
  end
  if (!reset) begin
    _T_4322 = 1'h0;
  end
  if (!reset) begin
    _T_4319 = 1'h0;
  end
  if (!reset) begin
    _T_4316 = 1'h0;
  end
  if (!reset) begin
    obuf_sideeffect = 1'h0;
  end
  if (!reset) begin
    buf_dual_3 = 1'h0;
  end
  if (!reset) begin
    buf_dual_2 = 1'h0;
  end
  if (!reset) begin
    buf_dual_1 = 1'h0;
  end
  if (!reset) begin
    buf_dual_0 = 1'h0;
  end
  if (!reset) begin
    buf_samedw_3 = 1'h0;
  end
  if (!reset) begin
    buf_samedw_2 = 1'h0;
  end
  if (!reset) begin
    buf_samedw_1 = 1'h0;
  end
  if (!reset) begin
    buf_samedw_0 = 1'h0;
  end
  if (!reset) begin
    obuf_write = 1'h0;
  end
  if (!reset) begin
    obuf_cmd_done = 1'h0;
  end
  if (!reset) begin
    obuf_data_done = 1'h0;
  end
  if (!reset) begin
    obuf_nosend = 1'h0;
  end
  if (!reset) begin
    obuf_addr = 32'h0;
  end
  if (!reset) begin
    buf_sz_0 = 2'h0;
  end
  if (!reset) begin
    buf_sz_1 = 2'h0;
  end
  if (!reset) begin
    buf_sz_2 = 2'h0;
  end
  if (!reset) begin
    buf_sz_3 = 2'h0;
  end
  if (!reset) begin
    obuf_rdrsp_pend = 1'h0;
  end
  if (!reset) begin
    obuf_rdrsp_tag = 3'h0;
  end
  if (!reset) begin
    buf_dualhi_3 = 1'h0;
  end
  if (!reset) begin
    buf_dualhi_2 = 1'h0;
  end
  if (!reset) begin
    buf_dualhi_1 = 1'h0;
  end
  if (!reset) begin
    buf_dualhi_0 = 1'h0;
  end
  if (!reset) begin
    obuf_sz = 2'h0;
  end
  if (!reset) begin
    obuf_byteen = 8'h0;
  end
  if (!reset) begin
    obuf_data = 64'h0;
  end
  if (!reset) begin
    buf_rspageQ_0 = 4'h0;
  end
  if (!reset) begin
    buf_rspageQ_1 = 4'h0;
  end
  if (!reset) begin
    buf_rspageQ_2 = 4'h0;
  end
  if (!reset) begin
    buf_rspageQ_3 = 4'h0;
  end
  if (!reset) begin
    _T_4302 = 1'h0;
  end
  if (!reset) begin
    _T_4300 = 1'h0;
  end
  if (!reset) begin
    _T_4298 = 1'h0;
  end
  if (!reset) begin
    _T_4296 = 1'h0;
  end
  if (!reset) begin
    buf_ldfwdtag_0 = 2'h0;
  end
  if (!reset) begin
    buf_dualtag_0 = 2'h0;
  end
  if (!reset) begin
    buf_ldfwdtag_3 = 2'h0;
  end
  if (!reset) begin
    buf_ldfwdtag_2 = 2'h0;
  end
  if (!reset) begin
    buf_ldfwdtag_1 = 2'h0;
  end
  if (!reset) begin
    buf_dualtag_1 = 2'h0;
  end
  if (!reset) begin
    buf_dualtag_2 = 2'h0;
  end
  if (!reset) begin
    buf_dualtag_3 = 2'h0;
  end
  if (!reset) begin
    _T_4331 = 1'h0;
  end
  if (!reset) begin
    _T_4334 = 1'h0;
  end
  if (!reset) begin
    _T_4337 = 1'h0;
  end
  if (!reset) begin
    _T_4340 = 1'h0;
  end
  if (!reset) begin
    _T_4406 = 1'h0;
  end
  if (!reset) begin
    _T_4401 = 1'h0;
  end
  if (!reset) begin
    _T_4396 = 1'h0;
  end
  if (!reset) begin
    _T_4391 = 1'h0;
  end
  if (!reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (!reset) begin
    _T_4956 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_addr_0 <= 32'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_addr_0 <= ibuf_addr;
      end else if (_T_3346) begin
        buf_addr_0 <= io_end_addr_r;
      end else begin
        buf_addr_0 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4355 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4355 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4352 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4352 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4349 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4349 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4346 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4346 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3531) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3554) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3558) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3562) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3592) begin
        if (_T_3596) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3604) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3632) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3677) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3683) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3695) begin
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
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_addr_1 <= 32'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_addr_1 <= ibuf_addr;
      end else if (_T_3355) begin
        buf_addr_1 <= io_end_addr_r;
      end else begin
        buf_addr_1 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3722) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3745) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3749) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3562) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3783) begin
        if (_T_3787) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3795) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3823) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3868) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3874) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3886) begin
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
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_addr_2 <= 32'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_addr_2 <= ibuf_addr;
      end else if (_T_3364) begin
        buf_addr_2 <= io_end_addr_r;
      end else begin
        buf_addr_2 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3913) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3936) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3940) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3562) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3974) begin
        if (_T_3978) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3986) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4014) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4059) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4065) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4077) begin
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
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_addr_3 <= 32'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_addr_3 <= ibuf_addr;
      end else if (_T_3373) begin
        buf_addr_3 <= io_end_addr_r;
      end else begin
        buf_addr_3 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4104) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4127) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4131) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3562) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4165) begin
        if (_T_4169) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4177) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4205) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4250) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4256) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4268) begin
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
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_byteen_3 <= 4'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_byteen_3 <= ibuf_byteen_out;
      end else if (_T_3373) begin
        buf_byteen_3 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_3 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_byteen_2 <= 4'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_byteen_2 <= ibuf_byteen_out;
      end else if (_T_3364) begin
        buf_byteen_2 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_2 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_byteen_1 <= 4'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_byteen_1 <= ibuf_byteen_out;
      end else if (_T_3355) begin
        buf_byteen_1 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_1 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_byteen_0 <= 4'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_byteen_0 <= ibuf_byteen_out;
      end else if (_T_3346) begin
        buf_byteen_0 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_0 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2474,_T_2397};
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      _T_1781 <= 2'h0;
    end else if (_T_1780) begin
      if (ibuf_buf_byp) begin
        _T_1781 <= WrPtr0_r;
      end else begin
        _T_1781 <= CmdPtr0;
      end
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_merge <= 1'h0;
    end else if (_T_1780) begin
      obuf_merge <= obuf_merge_en;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_tag1 <= 2'h0;
    end else if (_T_1780) begin
      if (ibuf_buf_byp) begin
        obuf_tag1 <= WrPtr1_r;
      end else begin
        obuf_tag1 <= CmdPtr1;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or negedge reset) begin
    if (!reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1771 & _T_1772;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_wr_enQ <= 1'h0;
    end else if (io_lsu_busm_clken) begin
      obuf_wr_enQ <= obuf_wr_en;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      ibuf_addr <= 32'h0;
    end else if (ibuf_wr_en) begin
      if (io_ldst_dual_r) begin
        ibuf_addr <= io_end_addr_r;
      end else begin
        ibuf_addr <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_write <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_write <= io_lsu_pkt_r_bits_store;
    end
  end
  always @(posedge io_lsu_free_c2_clk or negedge reset) begin
    if (!reset) begin
      ibuf_valid <= 1'h0;
    end else begin
      ibuf_valid <= _T_1005 & _T_1006;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
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
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ageQ_2 <= 4'h0;
    end else begin
      buf_ageQ_2 <= {_T_2372,_T_2295};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2270,_T_2193};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2168,_T_2091};
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_data_0 <= 32'h0;
    end else if (buf_data_en_0) begin
      if (_T_3531) begin
        if (_T_3546) begin
          buf_data_0 <= ibuf_data_out;
        end else begin
          buf_data_0 <= store_data_lo_r;
        end
      end else if (_T_3554) begin
        buf_data_0 <= 32'h0;
      end else if (_T_3558) begin
        if (buf_error_en_0) begin
          buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
        end else if (buf_addr_0[2]) begin
          buf_data_0 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else if (_T_3592) begin
        if (_T_3670) begin
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
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_data_1 <= 32'h0;
    end else if (buf_data_en_1) begin
      if (_T_3722) begin
        if (_T_3737) begin
          buf_data_1 <= ibuf_data_out;
        end else begin
          buf_data_1 <= store_data_lo_r;
        end
      end else if (_T_3745) begin
        buf_data_1 <= 32'h0;
      end else if (_T_3749) begin
        if (buf_error_en_1) begin
          buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
        end else if (buf_addr_1[2]) begin
          buf_data_1 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else if (_T_3783) begin
        if (_T_3861) begin
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
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_data_2 <= 32'h0;
    end else if (buf_data_en_2) begin
      if (_T_3913) begin
        if (_T_3928) begin
          buf_data_2 <= ibuf_data_out;
        end else begin
          buf_data_2 <= store_data_lo_r;
        end
      end else if (_T_3936) begin
        buf_data_2 <= 32'h0;
      end else if (_T_3940) begin
        if (buf_error_en_2) begin
          buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
        end else if (buf_addr_2[2]) begin
          buf_data_2 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else if (_T_3974) begin
        if (_T_4052) begin
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
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      buf_data_3 <= 32'h0;
    end else if (buf_data_en_3) begin
      if (_T_4104) begin
        if (_T_4119) begin
          buf_data_3 <= ibuf_data_out;
        end else begin
          buf_data_3 <= store_data_lo_r;
        end
      end else if (_T_4127) begin
        buf_data_3 <= 32'h0;
      end else if (_T_4131) begin
        if (buf_error_en_3) begin
          buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
        end else if (buf_addr_3[2]) begin
          buf_data_3 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else if (_T_4165) begin
        if (_T_4243) begin
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
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      ibuf_data <= 32'h0;
    end else if (ibuf_wr_en) begin
      ibuf_data <= ibuf_data_in;
    end
  end
  always @(posedge io_lsu_free_c2_clk or negedge reset) begin
    if (!reset) begin
      ibuf_timer <= 3'h0;
    end else if (ibuf_wr_en) begin
      ibuf_timer <= 3'h0;
    end else if (_T_923) begin
      ibuf_timer <= _T_926;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or negedge reset) begin
    if (!reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1853) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1867) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1881) begin
      WrPtr1_r <= 2'h2;
    end else begin
      WrPtr1_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_c2_r_clk or negedge reset) begin
    if (!reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1802) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1813) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1824) begin
      WrPtr0_r <= 2'h2;
    end else begin
      WrPtr0_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
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
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_dual <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_samedw <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_unsign <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_unsign <= io_lsu_pkt_r_bits_unsign;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or negedge reset) begin
    if (!reset) begin
      ibuf_sz <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sz <= ibuf_sz_in;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      _T_1791 <= 1'h0;
    end else if (obuf_wr_en) begin
      _T_1791 <= obuf_data_done_in;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_nomerge_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_nomerge_0 <= buf_nomerge_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_nomerge_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_nomerge_1 <= buf_nomerge_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_nomerge_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_nomerge_2 <= buf_nomerge_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_nomerge_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_nomerge_3 <= buf_nomerge_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4325 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4325 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4322 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4322 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4319 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4319 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4316 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4316 <= buf_sideeffect_in[0];
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_sideeffect <= 1'h0;
    end else if (_T_1780) begin
      if (ibuf_buf_byp) begin
        obuf_sideeffect <= io_is_sideeffects_r;
      end else begin
        obuf_sideeffect <= _T_1051;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dual_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_dual_3 <= buf_dual_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dual_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_dual_2 <= buf_dual_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dual_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_dual_1 <= buf_dual_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dual_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_dual_0 <= buf_dual_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_samedw_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_samedw_3 <= buf_samedw_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_samedw_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_samedw_2 <= buf_samedw_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_samedw_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_samedw_1 <= buf_samedw_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_samedw_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_samedw_0 <= buf_samedw_in[0];
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_write <= 1'h0;
    end else if (_T_1780) begin
      if (ibuf_buf_byp) begin
        obuf_write <= io_lsu_pkt_r_bits_store;
      end else begin
        obuf_write <= _T_1202;
      end
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_cmd_done <= 1'h0;
    end else if (io_lsu_busm_clken) begin
      obuf_cmd_done <= obuf_cmd_done_in;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_data_done <= 1'h0;
    end else if (io_lsu_busm_clken) begin
      obuf_data_done <= obuf_data_done_in;
    end
  end
  always @(posedge io_lsu_free_c2_clk or negedge reset) begin
    if (!reset) begin
      obuf_nosend <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_nosend <= obuf_nosend_in;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_addr <= 32'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_addr <= io_lsu_addr_r;
      end else begin
        obuf_addr <= _T_1287;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_sz_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_sz_0 <= ibuf_sz;
      end else begin
        buf_sz_0 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_sz_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_sz_1 <= ibuf_sz;
      end else begin
        buf_sz_1 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_sz_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_sz_2 <= ibuf_sz;
      end else begin
        buf_sz_2 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_sz_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_sz_3 <= ibuf_sz;
      end else begin
        buf_sz_3 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or negedge reset) begin
    if (!reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else if (obuf_rdrsp_pend_en) begin
      obuf_rdrsp_pend <= obuf_rdrsp_pend_in;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (io_lsu_busm_clken) begin
      if (_T_1330) begin
        obuf_rdrsp_tag <= obuf_tag0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualhi_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_dualhi_3 <= buf_dualhi_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualhi_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_dualhi_2 <= buf_dualhi_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualhi_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_dualhi_1 <= buf_dualhi_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualhi_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_dualhi_0 <= buf_dualhi_in[0];
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_sz <= 2'h0;
    end else if (_T_1780) begin
      if (ibuf_buf_byp) begin
        obuf_sz <= ibuf_sz_in;
      end else begin
        obuf_sz <= _T_1300;
      end
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_byteen <= 8'h0;
    end else if (_T_1780) begin
      obuf_byteen <= obuf_byteen_in;
    end
  end
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      obuf_data <= 64'h0;
    end else if (obuf_wr_en) begin
      obuf_data <= obuf_data_in;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3144,_T_3133};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3159,_T_3148};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3174,_T_3163};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3189,_T_3178};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4302 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4104) begin
        _T_4302 <= 1'h0;
      end else if (_T_4127) begin
        _T_4302 <= 1'h0;
      end else begin
        _T_4302 <= _T_4131;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4300 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3913) begin
        _T_4300 <= 1'h0;
      end else if (_T_3936) begin
        _T_4300 <= 1'h0;
      end else begin
        _T_4300 <= _T_3940;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4298 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3722) begin
        _T_4298 <= 1'h0;
      end else if (_T_3745) begin
        _T_4298 <= 1'h0;
      end else begin
        _T_4298 <= _T_3749;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4296 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3531) begin
        _T_4296 <= 1'h0;
      end else if (_T_3554) begin
        _T_4296 <= 1'h0;
      end else begin
        _T_4296 <= _T_3558;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3531) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3554) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3558) begin
        buf_ldfwdtag_0 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_0 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualtag_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_dualtag_0 <= ibuf_dualtag;
      end else if (_T_3346) begin
        buf_dualtag_0 <= WrPtr0_r;
      end else begin
        buf_dualtag_0 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ldfwdtag_3 <= 2'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4104) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4127) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4131) begin
        buf_ldfwdtag_3 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_3 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ldfwdtag_2 <= 2'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3913) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3936) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3940) begin
        buf_ldfwdtag_2 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_2 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_ldfwdtag_1 <= 2'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3722) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3745) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3749) begin
        buf_ldfwdtag_1 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_1 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualtag_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_dualtag_1 <= ibuf_dualtag;
      end else if (_T_3355) begin
        buf_dualtag_1 <= WrPtr0_r;
      end else begin
        buf_dualtag_1 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualtag_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_dualtag_2 <= ibuf_dualtag;
      end else if (_T_3364) begin
        buf_dualtag_2 <= WrPtr0_r;
      end else begin
        buf_dualtag_2 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      buf_dualtag_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_dualtag_3 <= ibuf_dualtag;
      end else if (_T_3373) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4331 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4331 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4334 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4334 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4337 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4337 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4340 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4340 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4406 <= 1'h0;
    end else begin
      _T_4406 <= _T_4402 & _T_4404;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4401 <= 1'h0;
    end else begin
      _T_4401 <= _T_4397 & _T_4399;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4396 <= 1'h0;
    end else begin
      _T_4396 <= _T_4392 & _T_4394;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or negedge reset) begin
    if (!reset) begin
      _T_4391 <= 1'h0;
    end else begin
      _T_4391 <= _T_4387 & _T_4389;
    end
  end
  always @(posedge io_lsu_c2_r_clk or negedge reset) begin
    if (!reset) begin
      lsu_nonblock_load_valid_r <= 1'h0;
    end else begin
      lsu_nonblock_load_valid_r <= io_dctl_busbuff_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or negedge reset) begin
    if (!reset) begin
      _T_4956 <= 1'h0;
    end else begin
      _T_4956 <= _T_4953 & _T_4513;
    end
  end
endmodule