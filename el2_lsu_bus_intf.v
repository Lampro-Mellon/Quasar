module el2_lsu_bus_buffer(
  input         clock,
  input         reset,
  input         io_dec_tlu_external_ldfwd_disable,
  input         io_dec_tlu_wb_coalescing_disable,
  input         io_dec_tlu_sideeffect_posted_disable,
  input         io_dec_tlu_force_halt,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_obuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_busm_clk,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_unsign,
  input  [31:0] io_lsu_addr_m,
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
  input         io_lsu_axi_awready,
  input         io_lsu_axi_wready,
  input         io_lsu_axi_bvalid,
  input  [1:0]  io_lsu_axi_bresp,
  input  [2:0]  io_lsu_axi_bid,
  input         io_lsu_axi_arready,
  input         io_lsu_axi_rvalid,
  input  [2:0]  io_lsu_axi_rid,
  input  [63:0] io_lsu_axi_rdata,
  input  [1:0]  io_lsu_axi_rresp,
  input         io_lsu_bus_clk_en,
  input         io_lsu_bus_clk_en_q,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output [3:0]  io_ld_byte_hit_buf_lo,
  output [3:0]  io_ld_byte_hit_buf_hi,
  output        io_lsu_imprecise_error_load_any,
  output        io_lsu_imprecise_error_store_any,
  output [31:0] io_lsu_imprecise_error_addr_any,
  output        io_lsu_nonblock_load_valid_m,
  output [1:0]  io_lsu_nonblock_load_tag_m,
  output        io_lsu_nonblock_load_inv_r,
  output [1:0]  io_lsu_nonblock_load_inv_tag_r,
  output        io_lsu_nonblock_load_data_valid,
  output        io_lsu_nonblock_load_data_error,
  output [1:0]  io_lsu_nonblock_load_data_tag,
  output [31:0] io_lsu_nonblock_load_data,
  output        io_lsu_pmu_bus_trxn,
  output        io_lsu_pmu_bus_misaligned,
  output        io_lsu_pmu_bus_error,
  output        io_lsu_pmu_bus_busy,
  output        io_lsu_axi_awvalid,
  output [2:0]  io_lsu_axi_awid,
  output [31:0] io_lsu_axi_awaddr,
  output [3:0]  io_lsu_axi_awregion,
  output [2:0]  io_lsu_axi_awsize,
  output [3:0]  io_lsu_axi_awcache,
  output        io_lsu_axi_wvalid,
  output [63:0] io_lsu_axi_wdata,
  output [7:0]  io_lsu_axi_wstrb,
  output        io_lsu_axi_bready,
  output        io_lsu_axi_arvalid,
  output [2:0]  io_lsu_axi_arid,
  output [31:0] io_lsu_axi_araddr,
  output [3:0]  io_lsu_axi_arregion,
  output [2:0]  io_lsu_axi_arsize,
  output [3:0]  io_lsu_axi_arcache,
  output        io_lsu_axi_rready
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
  reg [63:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [63:0] _RAND_90;
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
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_buffer.scala 401:51]
  reg [31:0] ibuf_addr; // @[Reg.scala 27:20]
  wire  _T_4 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 403:52]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_5 = _T_4 & ibuf_write; // @[el2_lsu_bus_buffer.scala 403:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 464:28]
  wire  _T_6 = _T_5 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 403:86]
  wire  ld_addr_ibuf_hit_lo = _T_6 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 403:99]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire  _T_15 = ld_addr_ibuf_hit_lo & ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 406:72]
  wire  _T_17 = _T_15 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 406:89]
  wire  _T_19 = ld_addr_ibuf_hit_lo & ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 406:72]
  wire  _T_21 = _T_19 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 406:89]
  wire  _T_23 = ld_addr_ibuf_hit_lo & ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 406:72]
  wire  _T_25 = _T_23 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 406:89]
  wire  _T_27 = ld_addr_ibuf_hit_lo & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 406:72]
  wire  _T_29 = _T_27 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 406:89]
  wire [3:0] ld_byte_ibuf_hit_lo = {_T_29,_T_25,_T_21,_T_17}; // @[Cat.scala 29:58]
  reg [31:0] buf_addr_0; // @[Reg.scala 27:20]
  wire  _T_54 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 409:77]
  reg  buf_write_0; // @[Reg.scala 27:20]
  wire  _T_55 = _T_54 & buf_write_0; // @[el2_lsu_bus_buffer.scala 409:100]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_56 = buf_state_0 != 3'h0; // @[el2_lsu_bus_buffer.scala 409:131]
  wire  _T_57 = _T_55 & _T_56; // @[el2_lsu_bus_buffer.scala 409:115]
  wire  _T_58 = _T_57 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 409:143]
  reg [31:0] buf_addr_1; // @[Reg.scala 27:20]
  wire  _T_61 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 409:77]
  reg  buf_write_1; // @[Reg.scala 27:20]
  wire  _T_62 = _T_61 & buf_write_1; // @[el2_lsu_bus_buffer.scala 409:100]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_63 = buf_state_1 != 3'h0; // @[el2_lsu_bus_buffer.scala 409:131]
  wire  _T_64 = _T_62 & _T_63; // @[el2_lsu_bus_buffer.scala 409:115]
  wire  _T_65 = _T_64 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 409:143]
  reg [31:0] buf_addr_2; // @[Reg.scala 27:20]
  wire  _T_68 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 409:77]
  reg  buf_write_2; // @[Reg.scala 27:20]
  wire  _T_69 = _T_68 & buf_write_2; // @[el2_lsu_bus_buffer.scala 409:100]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_70 = buf_state_2 != 3'h0; // @[el2_lsu_bus_buffer.scala 409:131]
  wire  _T_71 = _T_69 & _T_70; // @[el2_lsu_bus_buffer.scala 409:115]
  wire  _T_72 = _T_71 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 409:143]
  reg [31:0] buf_addr_3; // @[Reg.scala 27:20]
  wire  _T_75 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 409:77]
  reg  buf_write_3; // @[Reg.scala 27:20]
  wire  _T_76 = _T_75 & buf_write_3; // @[el2_lsu_bus_buffer.scala 409:100]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_77 = buf_state_3 != 3'h0; // @[el2_lsu_bus_buffer.scala 409:131]
  wire  _T_78 = _T_76 & _T_77; // @[el2_lsu_bus_buffer.scala 409:115]
  wire  _T_79 = _T_78 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 409:143]
  wire [3:0] ld_addr_hitvec_lo = {_T_79,_T_72,_T_65,_T_58}; // @[Cat.scala 29:58]
  reg [3:0] buf_byteen_3; // @[Reg.scala 27:20]
  wire  _T_161 = ld_addr_hitvec_lo[3] & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_163 = _T_161 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 415:116]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_156 = ld_addr_hitvec_lo[2] & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_158 = _T_156 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 415:116]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_151 = ld_addr_hitvec_lo[1] & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_153 = _T_151 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 415:116]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_146 = ld_addr_hitvec_lo[0] & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_148 = _T_146 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_163,_T_158,_T_153,_T_148}; // @[Cat.scala 29:58]
  reg  buf_ageQ_3_3; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  _T_3015 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 567:65]
  wire  _T_3756 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3779 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3783 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [2:0] obuf_tag0; // @[Reg.scala 27:20]
  wire  _T_3790 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 628:52]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [2:0] obuf_tag1; // @[Reg.scala 27:20]
  wire  _T_3791 = obuf_tag1 == 3'h3; // @[el2_lsu_bus_buffer.scala 628:112]
  wire  _T_3792 = obuf_merge & _T_3791; // @[el2_lsu_bus_buffer.scala 628:99]
  wire  _T_3793 = _T_3790 | _T_3792; // @[el2_lsu_bus_buffer.scala 628:85]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 531:28]
  wire  _T_3794 = _T_3793 & obuf_valid; // @[el2_lsu_bus_buffer.scala 628:147]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 528:35]
  wire  _T_3795 = _T_3794 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 628:160]
  wire  _GEN_398 = _T_3783 & _T_3795; // @[Conditional.scala 39:67]
  wire  _GEN_411 = _T_3779 ? 1'h0 : _GEN_398; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_3756 ? 1'h0 : _GEN_411; // @[Conditional.scala 40:58]
  wire  _T_3016 = _T_3015 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 567:76]
  wire  _T_3017 = ~_T_3016; // @[el2_lsu_bus_buffer.scala 567:49]
  wire  buf_age_3_3 = buf_ageQ_3_3 & _T_3017; // @[el2_lsu_bus_buffer.scala 567:47]
  reg  buf_ageQ_3_2; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  _T_2920 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 567:65]
  wire  _T_3548 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3571 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3575 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3582 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 628:52]
  wire  _T_3583 = obuf_tag1 == 3'h2; // @[el2_lsu_bus_buffer.scala 628:112]
  wire  _T_3584 = obuf_merge & _T_3583; // @[el2_lsu_bus_buffer.scala 628:99]
  wire  _T_3585 = _T_3582 | _T_3584; // @[el2_lsu_bus_buffer.scala 628:85]
  wire  _T_3586 = _T_3585 & obuf_valid; // @[el2_lsu_bus_buffer.scala 628:147]
  wire  _T_3587 = _T_3586 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 628:160]
  wire  _GEN_308 = _T_3575 & _T_3587; // @[Conditional.scala 39:67]
  wire  _GEN_321 = _T_3571 ? 1'h0 : _GEN_308; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3548 ? 1'h0 : _GEN_321; // @[Conditional.scala 40:58]
  wire  _T_2921 = _T_2920 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 567:76]
  wire  _T_2922 = ~_T_2921; // @[el2_lsu_bus_buffer.scala 567:49]
  wire  buf_age_3_2 = buf_ageQ_3_2 & _T_2922; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2925 = ~buf_age_3_2; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_3_2 = _T_2925 & _T_70; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_3_1; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  _T_2825 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 567:65]
  wire  _T_3340 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3363 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3367 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3374 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 628:52]
  wire  _T_3375 = obuf_tag1 == 3'h1; // @[el2_lsu_bus_buffer.scala 628:112]
  wire  _T_3376 = obuf_merge & _T_3375; // @[el2_lsu_bus_buffer.scala 628:99]
  wire  _T_3377 = _T_3374 | _T_3376; // @[el2_lsu_bus_buffer.scala 628:85]
  wire  _T_3378 = _T_3377 & obuf_valid; // @[el2_lsu_bus_buffer.scala 628:147]
  wire  _T_3379 = _T_3378 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 628:160]
  wire  _GEN_218 = _T_3367 & _T_3379; // @[Conditional.scala 39:67]
  wire  _GEN_231 = _T_3363 ? 1'h0 : _GEN_218; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3340 ? 1'h0 : _GEN_231; // @[Conditional.scala 40:58]
  wire  _T_2826 = _T_2825 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 567:76]
  wire  _T_2827 = ~_T_2826; // @[el2_lsu_bus_buffer.scala 567:49]
  wire  buf_age_3_1 = buf_ageQ_3_1 & _T_2827; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2830 = ~buf_age_3_1; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_3_1 = _T_2830 & _T_63; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_3_0; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  _T_2730 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 567:65]
  wire  _T_3132 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3155 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3159 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3166 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 628:52]
  wire  _T_3167 = obuf_tag1 == 3'h0; // @[el2_lsu_bus_buffer.scala 628:112]
  wire  _T_3168 = obuf_merge & _T_3167; // @[el2_lsu_bus_buffer.scala 628:99]
  wire  _T_3169 = _T_3166 | _T_3168; // @[el2_lsu_bus_buffer.scala 628:85]
  wire  _T_3170 = _T_3169 & obuf_valid; // @[el2_lsu_bus_buffer.scala 628:147]
  wire  _T_3171 = _T_3170 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 628:160]
  wire  _GEN_128 = _T_3159 & _T_3171; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3155 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3132 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2731 = _T_2730 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 567:76]
  wire  _T_2732 = ~_T_2731; // @[el2_lsu_bus_buffer.scala 567:49]
  wire  buf_age_3_0 = buf_ageQ_3_0 & _T_2732; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2735 = ~buf_age_3_0; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_3_0 = _T_2735 & _T_56; // @[el2_lsu_bus_buffer.scala 568:108]
  wire [3:0] _T_364 = {1'h0,buf_age_younger_3_2,buf_age_younger_3_1,buf_age_younger_3_0}; // @[el2_lsu_bus_buffer.scala 418:147]
  wire [3:0] _T_365 = ld_byte_hitvec_lo_0 & _T_364; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_366 = |_T_365; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_367 = ~_T_366; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_368 = ld_byte_hitvec_lo_0[3] & _T_367; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_370 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 418:162]
  wire  _T_371 = _T_368 & _T_370; // @[el2_lsu_bus_buffer.scala 418:160]
  reg  buf_ageQ_2_3; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_2_3 = buf_ageQ_2_3 & _T_3017; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2640 = ~buf_age_2_3; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_2_3 = _T_2640 & _T_77; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_2_2; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_2_2 = buf_ageQ_2_2 & _T_2922; // @[el2_lsu_bus_buffer.scala 567:47]
  reg  buf_ageQ_2_1; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_2_1 = buf_ageQ_2_1 & _T_2827; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2450 = ~buf_age_2_1; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_2_1 = _T_2450 & _T_63; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_2_0; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_2_0 = buf_ageQ_2_0 & _T_2732; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2355 = ~buf_age_2_0; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_2_0 = _T_2355 & _T_56; // @[el2_lsu_bus_buffer.scala 568:108]
  wire [3:0] _T_353 = {buf_age_younger_2_3,1'h0,buf_age_younger_2_1,buf_age_younger_2_0}; // @[el2_lsu_bus_buffer.scala 418:147]
  wire [3:0] _T_354 = ld_byte_hitvec_lo_0 & _T_353; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_355 = |_T_354; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_356 = ~_T_355; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_357 = ld_byte_hitvec_lo_0[2] & _T_356; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_360 = _T_357 & _T_370; // @[el2_lsu_bus_buffer.scala 418:160]
  reg  buf_ageQ_1_3; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_1_3 = buf_ageQ_1_3 & _T_3017; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2260 = ~buf_age_1_3; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_1_3 = _T_2260 & _T_77; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_1_2; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_1_2 = buf_ageQ_1_2 & _T_2922; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_2165 = ~buf_age_1_2; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_1_2 = _T_2165 & _T_70; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_1_1; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_1_1 = buf_ageQ_1_1 & _T_2827; // @[el2_lsu_bus_buffer.scala 567:47]
  reg  buf_ageQ_1_0; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_1_0 = buf_ageQ_1_0 & _T_2732; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_1975 = ~buf_age_1_0; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_1_0 = _T_1975 & _T_56; // @[el2_lsu_bus_buffer.scala 568:108]
  wire [3:0] _T_342 = {buf_age_younger_1_3,buf_age_younger_1_2,1'h0,buf_age_younger_1_0}; // @[el2_lsu_bus_buffer.scala 418:147]
  wire [3:0] _T_343 = ld_byte_hitvec_lo_0 & _T_342; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_344 = |_T_343; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_345 = ~_T_344; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_346 = ld_byte_hitvec_lo_0[1] & _T_345; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_349 = _T_346 & _T_370; // @[el2_lsu_bus_buffer.scala 418:160]
  reg  buf_ageQ_0_3; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_0_3 = buf_ageQ_0_3 & _T_3017; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_1880 = ~buf_age_0_3; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_0_3 = _T_1880 & _T_77; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_0_2; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_0_2 = buf_ageQ_0_2 & _T_2922; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_1785 = ~buf_age_0_2; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_0_2 = _T_1785 & _T_70; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_0_1; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_0_1 = buf_ageQ_0_1 & _T_2827; // @[el2_lsu_bus_buffer.scala 567:47]
  wire  _T_1690 = ~buf_age_0_1; // @[el2_lsu_bus_buffer.scala 568:93]
  wire  buf_age_younger_0_1 = _T_1690 & _T_63; // @[el2_lsu_bus_buffer.scala 568:108]
  reg  buf_ageQ_0_0; // @[el2_lsu_bus_buffer.scala 690:41]
  wire  buf_age_0_0 = buf_ageQ_0_0 & _T_2732; // @[el2_lsu_bus_buffer.scala 567:47]
  wire [3:0] _T_331 = {buf_age_younger_0_3,buf_age_younger_0_2,buf_age_younger_0_1,1'h0}; // @[el2_lsu_bus_buffer.scala 418:147]
  wire [3:0] _T_332 = ld_byte_hitvec_lo_0 & _T_331; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_333 = |_T_332; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_334 = ~_T_333; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_335 = ld_byte_hitvec_lo_0[0] & _T_334; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_338 = _T_335 & _T_370; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_371,_T_360,_T_349,_T_338}; // @[Cat.scala 29:58]
  wire  _T_115 = |ld_byte_hitvecfn_lo_0; // @[el2_lsu_bus_buffer.scala 412:100]
  wire  _T_116 = ld_byte_ibuf_hit_lo[0] | _T_115; // @[el2_lsu_bus_buffer.scala 412:75]
  wire  _T_184 = ld_addr_hitvec_lo[3] & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_186 = _T_184 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_179 = ld_addr_hitvec_lo[2] & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_181 = _T_179 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_174 = ld_addr_hitvec_lo[1] & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_176 = _T_174 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_169 = ld_addr_hitvec_lo[0] & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_171 = _T_169 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_186,_T_181,_T_176,_T_171}; // @[Cat.scala 29:58]
  wire [3:0] _T_412 = ld_byte_hitvec_lo_1 & _T_364; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_413 = |_T_412; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_414 = ~_T_413; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_415 = ld_byte_hitvec_lo_1[3] & _T_414; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_417 = ~ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 418:162]
  wire  _T_418 = _T_415 & _T_417; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_401 = ld_byte_hitvec_lo_1 & _T_353; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_402 = |_T_401; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_403 = ~_T_402; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_404 = ld_byte_hitvec_lo_1[2] & _T_403; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_407 = _T_404 & _T_417; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_390 = ld_byte_hitvec_lo_1 & _T_342; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_391 = |_T_390; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_392 = ~_T_391; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_393 = ld_byte_hitvec_lo_1[1] & _T_392; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_396 = _T_393 & _T_417; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_379 = ld_byte_hitvec_lo_1 & _T_331; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_380 = |_T_379; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_381 = ~_T_380; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_382 = ld_byte_hitvec_lo_1[0] & _T_381; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_385 = _T_382 & _T_417; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_418,_T_407,_T_396,_T_385}; // @[Cat.scala 29:58]
  wire  _T_118 = |ld_byte_hitvecfn_lo_1; // @[el2_lsu_bus_buffer.scala 412:100]
  wire  _T_119 = ld_byte_ibuf_hit_lo[1] | _T_118; // @[el2_lsu_bus_buffer.scala 412:75]
  wire  _T_207 = ld_addr_hitvec_lo[3] & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_209 = _T_207 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_202 = ld_addr_hitvec_lo[2] & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_204 = _T_202 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_197 = ld_addr_hitvec_lo[1] & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_199 = _T_197 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_192 = ld_addr_hitvec_lo[0] & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_194 = _T_192 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_209,_T_204,_T_199,_T_194}; // @[Cat.scala 29:58]
  wire [3:0] _T_459 = ld_byte_hitvec_lo_2 & _T_364; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_460 = |_T_459; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_461 = ~_T_460; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_462 = ld_byte_hitvec_lo_2[3] & _T_461; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_464 = ~ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 418:162]
  wire  _T_465 = _T_462 & _T_464; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_448 = ld_byte_hitvec_lo_2 & _T_353; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_449 = |_T_448; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_450 = ~_T_449; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_451 = ld_byte_hitvec_lo_2[2] & _T_450; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_454 = _T_451 & _T_464; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_437 = ld_byte_hitvec_lo_2 & _T_342; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_438 = |_T_437; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_439 = ~_T_438; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_440 = ld_byte_hitvec_lo_2[1] & _T_439; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_443 = _T_440 & _T_464; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_426 = ld_byte_hitvec_lo_2 & _T_331; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_427 = |_T_426; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_428 = ~_T_427; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_429 = ld_byte_hitvec_lo_2[0] & _T_428; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_432 = _T_429 & _T_464; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_465,_T_454,_T_443,_T_432}; // @[Cat.scala 29:58]
  wire  _T_121 = |ld_byte_hitvecfn_lo_2; // @[el2_lsu_bus_buffer.scala 412:100]
  wire  _T_122 = ld_byte_ibuf_hit_lo[2] | _T_121; // @[el2_lsu_bus_buffer.scala 412:75]
  wire  _T_230 = ld_addr_hitvec_lo[3] & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_232 = _T_230 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_225 = ld_addr_hitvec_lo[2] & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_227 = _T_225 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_220 = ld_addr_hitvec_lo[1] & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_222 = _T_220 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire  _T_215 = ld_addr_hitvec_lo[0] & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 415:97]
  wire  _T_217 = _T_215 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 415:116]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_232,_T_227,_T_222,_T_217}; // @[Cat.scala 29:58]
  wire [3:0] _T_506 = ld_byte_hitvec_lo_3 & _T_364; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_507 = |_T_506; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_508 = ~_T_507; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_509 = ld_byte_hitvec_lo_3[3] & _T_508; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_511 = ~ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 418:162]
  wire  _T_512 = _T_509 & _T_511; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_495 = ld_byte_hitvec_lo_3 & _T_353; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_496 = |_T_495; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_497 = ~_T_496; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_498 = ld_byte_hitvec_lo_3[2] & _T_497; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_501 = _T_498 & _T_511; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_484 = ld_byte_hitvec_lo_3 & _T_342; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_485 = |_T_484; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_486 = ~_T_485; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_487 = ld_byte_hitvec_lo_3[1] & _T_486; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_490 = _T_487 & _T_511; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] _T_473 = ld_byte_hitvec_lo_3 & _T_331; // @[el2_lsu_bus_buffer.scala 418:126]
  wire  _T_474 = |_T_473; // @[el2_lsu_bus_buffer.scala 418:155]
  wire  _T_475 = ~_T_474; // @[el2_lsu_bus_buffer.scala 418:102]
  wire  _T_476 = ld_byte_hitvec_lo_3[0] & _T_475; // @[el2_lsu_bus_buffer.scala 418:100]
  wire  _T_479 = _T_476 & _T_511; // @[el2_lsu_bus_buffer.scala 418:160]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_512,_T_501,_T_490,_T_479}; // @[Cat.scala 29:58]
  wire  _T_124 = |ld_byte_hitvecfn_lo_3; // @[el2_lsu_bus_buffer.scala 412:100]
  wire  _T_125 = ld_byte_ibuf_hit_lo[3] | _T_124; // @[el2_lsu_bus_buffer.scala 412:75]
  wire [2:0] _T_127 = {_T_125,_T_122,_T_119}; // @[Cat.scala 29:58]
  reg [31:0] ibuf_data; // @[Reg.scala 27:20]
  reg [31:0] buf_data_0; // @[Reg.scala 27:20]
  reg [31:0] buf_data_1; // @[Reg.scala 27:20]
  reg [31:0] buf_data_2; // @[Reg.scala 27:20]
  reg [31:0] buf_data_3; // @[Reg.scala 27:20]
  wire [3:0] _T_866 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_867 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_868 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_869 = _T_866 | _T_867; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_869 | _T_868; // @[Mux.scala 27:72]
  wire [7:0] _T_874 = {4'h0,ldst_byteen_r}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_471 = {{3'd0}, _T_874}; // @[el2_lsu_bus_buffer.scala 432:71]
  wire [10:0] ldst_byteen_extended_r = _GEN_471 << io_lsu_addr_r[1:0]; // @[el2_lsu_bus_buffer.scala 432:71]
  wire [63:0] _T_878 = {32'h0,io_store_data_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_472 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[el2_lsu_bus_buffer.scala 433:82]
  wire [5:0] _T_880 = 4'h8 * _GEN_472; // @[el2_lsu_bus_buffer.scala 433:82]
  wire [126:0] _GEN_473 = {{63'd0}, _T_878}; // @[el2_lsu_bus_buffer.scala 433:75]
  wire [126:0] store_data_extended_r = _GEN_473 << _T_880; // @[el2_lsu_bus_buffer.scala 433:75]
  wire [3:0] ldst_byteen_hi_r = ldst_byteen_extended_r[7:4]; // @[el2_lsu_bus_buffer.scala 434:58]
  wire [3:0] ldst_byteen_lo_r = ldst_byteen_extended_r[3:0]; // @[el2_lsu_bus_buffer.scala 435:58]
  wire [31:0] store_data_hi_r = store_data_extended_r[63:32]; // @[el2_lsu_bus_buffer.scala 436:57]
  wire [31:0] store_data_lo_r = store_data_extended_r[31:0]; // @[el2_lsu_bus_buffer.scala 437:57]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 438:53]
  wire  _T_891 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 441:96]
  wire  _T_894 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 442:98]
  wire  _T_896 = io_lsu_pkt_r_half & _T_891; // @[Mux.scala 27:72]
  wire  _T_897 = io_lsu_pkt_r_word & _T_894; // @[Mux.scala 27:72]
  wire  _T_898 = io_lsu_pkt_r_by | _T_896; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_898 | _T_897; // @[Mux.scala 27:72]
  wire  _T_901 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 445:71]
  wire  _T_902 = io_lsu_busreq_r & _T_901; // @[el2_lsu_bus_buffer.scala 445:50]
  wire  _T_903 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 445:95]
  wire  ibuf_byp = _T_902 & _T_903; // @[el2_lsu_bus_buffer.scala 445:93]
  wire  _T_906 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 446:50]
  wire  _T_907 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 446:70]
  wire  ibuf_wr_en = _T_906 & _T_907; // @[el2_lsu_bus_buffer.scala 446:68]
  wire  _T_910 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 447:52]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 465:35]
  wire  _T_923 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 449:74]
  wire  _T_924 = ibuf_wr_en | _T_923; // @[el2_lsu_bus_buffer.scala 449:60]
  wire  _T_1061 = _T_906 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 460:67]
  wire  _T_1062 = _T_1061 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 460:88]
  wire  _T_1063 = _T_1062 & ibuf_write; // @[el2_lsu_bus_buffer.scala 460:101]
  wire  _T_1066 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 460:135]
  wire  _T_1067 = _T_1063 & _T_1066; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_1068 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 460:156]
  wire  _T_1069 = _T_1067 & _T_1068; // @[el2_lsu_bus_buffer.scala 460:154]
  wire  _T_1070 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 460:179]
  wire  ibuf_merge_en = _T_1069 & _T_1070; // @[el2_lsu_bus_buffer.scala 460:177]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 461:33]
  wire  _T_925 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 449:131]
  wire  _T_926 = ~_T_925; // @[el2_lsu_bus_buffer.scala 449:115]
  wire  _T_927 = _T_924 & _T_926; // @[el2_lsu_bus_buffer.scala 449:113]
  wire  _T_928 = _T_927 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 449:149]
  wire  _T_914 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 448:52]
  wire  _T_915 = io_lsu_busreq_m & _T_914; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_916 = _T_915 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 448:69]
  wire  _T_919 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 448:122]
  wire  _T_920 = io_lsu_pkt_m_load | _T_919; // @[el2_lsu_bus_buffer.scala 448:103]
  wire  ibuf_force_drain = _T_916 & _T_920; // @[el2_lsu_bus_buffer.scala 448:82]
  wire  _T_929 = _T_928 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 450:45]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_930 = _T_929 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 450:64]
  wire  _T_931 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 450:84]
  wire  _T_932 = _T_930 | _T_931; // @[el2_lsu_bus_buffer.scala 450:82]
  wire  _T_933 = _T_932 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 450:96]
  wire  ibuf_drain_vld = ibuf_valid & _T_933; // @[el2_lsu_bus_buffer.scala 449:44]
  wire  _T_911 = ibuf_drain_vld & _T_910; // @[el2_lsu_bus_buffer.scala 447:50]
  wire  ibuf_rst = _T_911 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 447:65]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 751:44]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 750:44]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_945 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 455:85]
  wire [7:0] _T_954 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 456:93]
  wire [7:0] _T_957 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[el2_lsu_bus_buffer.scala 456:176]
  wire [7:0] _T_958 = _T_925 ? _T_954 : _T_957; // @[el2_lsu_bus_buffer.scala 456:57]
  wire [7:0] _T_963 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 456:93]
  wire [7:0] _T_966 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[el2_lsu_bus_buffer.scala 456:176]
  wire [7:0] _T_967 = _T_925 ? _T_963 : _T_966; // @[el2_lsu_bus_buffer.scala 456:57]
  wire [7:0] _T_972 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 456:93]
  wire [7:0] _T_975 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[el2_lsu_bus_buffer.scala 456:176]
  wire [7:0] _T_976 = _T_925 ? _T_972 : _T_975; // @[el2_lsu_bus_buffer.scala 456:57]
  wire [7:0] _T_981 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 456:93]
  wire [7:0] _T_984 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[el2_lsu_bus_buffer.scala 456:176]
  wire [7:0] _T_985 = _T_925 ? _T_981 : _T_984; // @[el2_lsu_bus_buffer.scala 456:57]
  wire [31:0] ibuf_data_in = {_T_985,_T_976,_T_967,_T_958}; // @[Cat.scala 29:58]
  wire  _T_989 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 457:69]
  wire [2:0] _T_991 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 457:115]
  wire  _T_994 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 458:75]
  wire  _T_995 = ibuf_merge_en & _T_994; // @[el2_lsu_bus_buffer.scala 458:73]
  wire  _T_998 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 458:106]
  wire  _T_1000 = _T_995 ? _T_998 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 458:57]
  wire  _T_1005 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 458:106]
  wire  _T_1007 = _T_995 ? _T_1005 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 458:57]
  wire  _T_1012 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 458:106]
  wire  _T_1014 = _T_995 ? _T_1012 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 458:57]
  wire  _T_1019 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 458:106]
  wire  _T_1021 = _T_995 ? _T_1019 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 458:57]
  wire [3:0] ibuf_byteen_out = {_T_1021,_T_1014,_T_1007,_T_1000}; // @[Cat.scala 29:58]
  wire [7:0] _T_1032 = _T_995 ? _T_954 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 459:57]
  wire [7:0] _T_1040 = _T_995 ? _T_963 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 459:57]
  wire [7:0] _T_1048 = _T_995 ? _T_972 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 459:57]
  wire [7:0] _T_1056 = _T_995 ? _T_981 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 459:57]
  wire [31:0] ibuf_data_out = {_T_1056,_T_1048,_T_1040,_T_1032}; // @[Cat.scala 29:58]
  wire  _T_1074 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 464:32]
  wire  _T_1075 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 464:72]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  wire  _T_3984 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 700:88]
  wire  _T_3985 = _T_2730 & _T_3984; // @[el2_lsu_bus_buffer.scala 700:86]
  wire  _T_3986 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 700:130]
  wire  _T_3987 = _T_3985 | _T_3986; // @[el2_lsu_bus_buffer.scala 700:114]
  wire  _T_3989 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 700:88]
  wire  _T_3990 = _T_2825 & _T_3989; // @[el2_lsu_bus_buffer.scala 700:86]
  wire  _T_3991 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 700:130]
  wire  _T_3992 = _T_3990 | _T_3991; // @[el2_lsu_bus_buffer.scala 700:114]
  wire  _T_4004 = _T_3987 + _T_3992; // @[el2_lsu_bus_buffer.scala 700:160]
  wire  _T_3994 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 700:88]
  wire  _T_3995 = _T_2920 & _T_3994; // @[el2_lsu_bus_buffer.scala 700:86]
  wire  _T_3996 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 700:130]
  wire  _T_3997 = _T_3995 | _T_3996; // @[el2_lsu_bus_buffer.scala 700:114]
  wire  _T_4006 = _T_4004 + _T_3997; // @[el2_lsu_bus_buffer.scala 700:160]
  wire  _T_3999 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 700:88]
  wire  _T_4000 = _T_3015 & _T_3999; // @[el2_lsu_bus_buffer.scala 700:86]
  wire  _T_4001 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 700:130]
  wire  _T_4002 = _T_4000 | _T_4001; // @[el2_lsu_bus_buffer.scala 700:114]
  wire  _T_4008 = _T_4006 + _T_4002; // @[el2_lsu_bus_buffer.scala 700:160]
  wire [3:0] buf_numvld_pend_any = {{3'd0}, _T_4008}; // @[el2_lsu_bus_buffer.scala 700:25]
  wire  _T_1095 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 483:67]
  wire  _T_1096 = ibuf_byp & _T_1095; // @[el2_lsu_bus_buffer.scala 483:39]
  wire  _T_1097 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 483:79]
  wire  _T_1098 = _T_1097 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:99]
  wire  ibuf_buf_byp = _T_1096 & _T_1098; // @[el2_lsu_bus_buffer.scala 483:76]
  wire  _T_1103 = _T_915 & _T_903; // @[el2_lsu_bus_buffer.scala 484:64]
  wire  _T_3978 = _T_3985 + _T_3990; // @[el2_lsu_bus_buffer.scala 699:158]
  wire  _T_3980 = _T_3978 + _T_3995; // @[el2_lsu_bus_buffer.scala 699:158]
  wire  _T_3982 = _T_3980 + _T_4000; // @[el2_lsu_bus_buffer.scala 699:158]
  wire [3:0] buf_numvld_cmd_any = {{3'd0}, _T_3982}; // @[el2_lsu_bus_buffer.scala 699:25]
  wire  _T_1105 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 484:105]
  wire  _T_1106 = _T_1103 & _T_1105; // @[el2_lsu_bus_buffer.scala 484:78]
  wire [3:0] _T_2961 = {buf_age_3_3,buf_age_3_2,buf_age_3_1,buf_age_3_0}; // @[el2_lsu_bus_buffer.scala 558:45]
  wire  _T_2962 = |_T_2961; // @[el2_lsu_bus_buffer.scala 558:55]
  wire  _T_2963 = ~_T_2962; // @[el2_lsu_bus_buffer.scala 558:32]
  wire  _T_2965 = _T_2963 & _T_3015; // @[el2_lsu_bus_buffer.scala 558:59]
  wire  CmdPtr0Dec_3 = _T_2965 & _T_3999; // @[el2_lsu_bus_buffer.scala 558:86]
  wire [3:0] _T_2581 = {buf_age_2_3,buf_age_2_2,buf_age_2_1,buf_age_2_0}; // @[el2_lsu_bus_buffer.scala 558:45]
  wire  _T_2582 = |_T_2581; // @[el2_lsu_bus_buffer.scala 558:55]
  wire  _T_2583 = ~_T_2582; // @[el2_lsu_bus_buffer.scala 558:32]
  wire  _T_2585 = _T_2583 & _T_2920; // @[el2_lsu_bus_buffer.scala 558:59]
  wire  CmdPtr0Dec_2 = _T_2585 & _T_3994; // @[el2_lsu_bus_buffer.scala 558:86]
  wire [3:0] _T_2201 = {buf_age_1_3,buf_age_1_2,buf_age_1_1,buf_age_1_0}; // @[el2_lsu_bus_buffer.scala 558:45]
  wire  _T_2202 = |_T_2201; // @[el2_lsu_bus_buffer.scala 558:55]
  wire  _T_2203 = ~_T_2202; // @[el2_lsu_bus_buffer.scala 558:32]
  wire  _T_2205 = _T_2203 & _T_2825; // @[el2_lsu_bus_buffer.scala 558:59]
  wire  CmdPtr0Dec_1 = _T_2205 & _T_3989; // @[el2_lsu_bus_buffer.scala 558:86]
  wire [3:0] _T_1821 = {buf_age_0_3,buf_age_0_2,buf_age_0_1,buf_age_0_0}; // @[el2_lsu_bus_buffer.scala 558:45]
  wire  _T_1822 = |_T_1821; // @[el2_lsu_bus_buffer.scala 558:55]
  wire  _T_1823 = ~_T_1822; // @[el2_lsu_bus_buffer.scala 558:32]
  wire  _T_1825 = _T_1823 & _T_2730; // @[el2_lsu_bus_buffer.scala 558:59]
  wire  CmdPtr0Dec_0 = _T_1825 & _T_3984; // @[el2_lsu_bus_buffer.scala 558:86]
  wire [3:0] _T_3056 = {CmdPtr0Dec_3,CmdPtr0Dec_2,CmdPtr0Dec_1,CmdPtr0Dec_0}; // @[el2_lsu_bus_buffer.scala 578:59]
  wire [3:0] _T_3061 = _T_3056[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:69]
  wire [3:0] _T_3062 = _T_3056[2] ? 4'h4 : _T_3061; // @[Mux.scala 47:69]
  wire [3:0] _T_3063 = _T_3056[1] ? 4'h2 : _T_3062; // @[Mux.scala 47:69]
  wire [3:0] _T_3064 = _T_3056[0] ? 4'h1 : _T_3063; // @[Mux.scala 47:69]
  wire [1:0] CmdPtr0 = _T_3064[1:0]; // @[el2_lsu_bus_buffer.scala 578:27]
  wire [31:0] _GEN_13 = 2'h1 == CmdPtr0 ? buf_addr_1 : buf_addr_0; // @[el2_lsu_bus_buffer.scala 484:163]
  wire [31:0] _GEN_14 = 2'h2 == CmdPtr0 ? buf_addr_2 : _GEN_13; // @[el2_lsu_bus_buffer.scala 484:163]
  wire [31:0] _GEN_15 = 2'h3 == CmdPtr0 ? buf_addr_3 : _GEN_14; // @[el2_lsu_bus_buffer.scala 484:163]
  wire  _T_1109 = io_lsu_addr_m[31:2] != _GEN_15[31:2]; // @[el2_lsu_bus_buffer.scala 484:142]
  wire  obuf_force_wr_en = _T_1106 & _T_1109; // @[el2_lsu_bus_buffer.scala 484:119]
  wire  _T_3946 = _T_3985 & buf_write_0; // @[el2_lsu_bus_buffer.scala 698:113]
  wire  _T_3950 = _T_3990 & buf_write_1; // @[el2_lsu_bus_buffer.scala 698:113]
  wire  _T_3960 = _T_3946 + _T_3950; // @[el2_lsu_bus_buffer.scala 698:158]
  wire  _T_3954 = _T_3995 & buf_write_2; // @[el2_lsu_bus_buffer.scala 698:113]
  wire  _T_3962 = _T_3960 + _T_3954; // @[el2_lsu_bus_buffer.scala 698:158]
  wire  _T_3958 = _T_4000 & buf_write_3; // @[el2_lsu_bus_buffer.scala 698:113]
  wire  _T_3964 = _T_3962 + _T_3958; // @[el2_lsu_bus_buffer.scala 698:158]
  wire [3:0] buf_numvld_wrcmd_any = {{3'd0}, _T_3964}; // @[el2_lsu_bus_buffer.scala 698:25]
  wire  _T_1112 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 485:56]
  wire  _T_1115 = _T_1112 & _T_1105; // @[el2_lsu_bus_buffer.scala 485:70]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 527:35]
  wire  _T_1116 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 485:128]
  wire  _T_1117 = _T_1115 & _T_1116; // @[el2_lsu_bus_buffer.scala 485:111]
  wire  _T_1119 = _T_1117 & _T_1070; // @[el2_lsu_bus_buffer.scala 485:166]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _GEN_17 = 2'h1 == CmdPtr0 ? buf_nomerge_1 : buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 486:59]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _GEN_18 = 2'h2 == CmdPtr0 ? buf_nomerge_2 : _GEN_17; // @[el2_lsu_bus_buffer.scala 486:59]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _GEN_19 = 2'h3 == CmdPtr0 ? buf_nomerge_3 : _GEN_18; // @[el2_lsu_bus_buffer.scala 486:59]
  wire  _T_1120 = ~_GEN_19; // @[el2_lsu_bus_buffer.scala 486:59]
  wire  _T_1121 = _T_1119 & _T_1120; // @[el2_lsu_bus_buffer.scala 486:57]
  reg  buf_sideeffect_0; // @[Reg.scala 27:20]
  reg  buf_sideeffect_1; // @[Reg.scala 27:20]
  wire  _GEN_21 = 2'h1 == CmdPtr0 ? buf_sideeffect_1 : buf_sideeffect_0; // @[el2_lsu_bus_buffer.scala 486:83]
  reg  buf_sideeffect_2; // @[Reg.scala 27:20]
  wire  _GEN_22 = 2'h2 == CmdPtr0 ? buf_sideeffect_2 : _GEN_21; // @[el2_lsu_bus_buffer.scala 486:83]
  reg  buf_sideeffect_3; // @[Reg.scala 27:20]
  wire  _GEN_23 = 2'h3 == CmdPtr0 ? buf_sideeffect_3 : _GEN_22; // @[el2_lsu_bus_buffer.scala 486:83]
  wire  _T_1122 = ~_GEN_23; // @[el2_lsu_bus_buffer.scala 486:83]
  wire  _T_1123 = _T_1121 & _T_1122; // @[el2_lsu_bus_buffer.scala 486:81]
  wire  _T_1124 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 486:110]
  wire  obuf_wr_wait = _T_1123 & _T_1124; // @[el2_lsu_bus_buffer.scala 486:108]
  wire  _T_1126 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 487:44]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_4231 = obuf_sideeffect & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 731:62]
  wire  _T_4232 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 731:145]
  wire  _T_4233 = buf_sideeffect_0 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 731:179]
  wire  _T_4240 = _T_4232 & _T_4233; // @[Mux.scala 27:72]
  wire  _T_4234 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 731:145]
  wire  _T_4235 = buf_sideeffect_1 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 731:179]
  wire  _T_4241 = _T_4234 & _T_4235; // @[Mux.scala 27:72]
  wire  _T_4244 = _T_4240 | _T_4241; // @[Mux.scala 27:72]
  wire  _T_4236 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 731:145]
  wire  _T_4237 = buf_sideeffect_2 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 731:179]
  wire  _T_4242 = _T_4236 & _T_4237; // @[Mux.scala 27:72]
  wire  _T_4245 = _T_4244 | _T_4242; // @[Mux.scala 27:72]
  wire  _T_4238 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 731:145]
  wire  _T_4239 = buf_sideeffect_3 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 731:179]
  wire  _T_4243 = _T_4238 & _T_4239; // @[Mux.scala 27:72]
  wire  _T_4246 = _T_4245 | _T_4243; // @[Mux.scala 27:72]
  wire  bus_sideeffect_pend = obuf_valid ? _T_4231 : _T_4246; // @[el2_lsu_bus_buffer.scala 731:34]
  wire  _T_1127 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 487:86]
  wire  _T_1128 = ~_T_1127; // @[el2_lsu_bus_buffer.scala 487:64]
  wire  _T_1129 = _T_1126 & _T_1128; // @[el2_lsu_bus_buffer.scala 487:62]
  wire [2:0] _GEN_25 = 2'h1 == CmdPtr0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 488:54]
  wire [2:0] _GEN_26 = 2'h2 == CmdPtr0 ? buf_state_2 : _GEN_25; // @[el2_lsu_bus_buffer.scala 488:54]
  wire [2:0] _GEN_27 = 2'h3 == CmdPtr0 ? buf_state_3 : _GEN_26; // @[el2_lsu_bus_buffer.scala 488:54]
  wire  _T_1130 = _GEN_27 == 3'h2; // @[el2_lsu_bus_buffer.scala 488:54]
  wire  _T_3087 = CmdPtr0Dec_0 | CmdPtr0Dec_1; // @[el2_lsu_bus_buffer.scala 581:49]
  wire  _T_3088 = _T_3087 | CmdPtr0Dec_2; // @[el2_lsu_bus_buffer.scala 581:49]
  wire  found_cmdptr0 = _T_3088 | CmdPtr0Dec_3; // @[el2_lsu_bus_buffer.scala 581:49]
  wire  _T_1131 = _T_1130 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 488:65]
  wire  _GEN_29 = 2'h1 == CmdPtr0 ? buf_cmd_state_bus_en_1 : buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 488:83]
  wire  _GEN_30 = 2'h2 == CmdPtr0 ? buf_cmd_state_bus_en_2 : _GEN_29; // @[el2_lsu_bus_buffer.scala 488:83]
  wire  _GEN_31 = 2'h3 == CmdPtr0 ? buf_cmd_state_bus_en_3 : _GEN_30; // @[el2_lsu_bus_buffer.scala 488:83]
  wire  _T_1132 = ~_GEN_31; // @[el2_lsu_bus_buffer.scala 488:83]
  wire  _T_1133 = _T_1131 & _T_1132; // @[el2_lsu_bus_buffer.scala 488:81]
  wire  _T_1134 = _GEN_23 & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 488:142]
  wire  _T_1135 = ~_T_1134; // @[el2_lsu_bus_buffer.scala 488:116]
  wire  _T_1136 = _T_1133 & _T_1135; // @[el2_lsu_bus_buffer.scala 488:114]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  wire  _GEN_33 = 2'h1 == CmdPtr0 ? buf_dual_1 : buf_dual_0; // @[el2_lsu_bus_buffer.scala 489:58]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  wire  _GEN_34 = 2'h2 == CmdPtr0 ? buf_dual_2 : _GEN_33; // @[el2_lsu_bus_buffer.scala 489:58]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  wire  _GEN_35 = 2'h3 == CmdPtr0 ? buf_dual_3 : _GEN_34; // @[el2_lsu_bus_buffer.scala 489:58]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  wire  _GEN_37 = 2'h1 == CmdPtr0 ? buf_samedw_1 : buf_samedw_0; // @[el2_lsu_bus_buffer.scala 489:58]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  wire  _GEN_38 = 2'h2 == CmdPtr0 ? buf_samedw_2 : _GEN_37; // @[el2_lsu_bus_buffer.scala 489:58]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  wire  _GEN_39 = 2'h3 == CmdPtr0 ? buf_samedw_3 : _GEN_38; // @[el2_lsu_bus_buffer.scala 489:58]
  wire  _T_1137 = _GEN_35 & _GEN_39; // @[el2_lsu_bus_buffer.scala 489:58]
  wire  _GEN_41 = 2'h1 == CmdPtr0 ? buf_write_1 : buf_write_0; // @[el2_lsu_bus_buffer.scala 489:82]
  wire  _GEN_42 = 2'h2 == CmdPtr0 ? buf_write_2 : _GEN_41; // @[el2_lsu_bus_buffer.scala 489:82]
  wire  _GEN_43 = 2'h3 == CmdPtr0 ? buf_write_3 : _GEN_42; // @[el2_lsu_bus_buffer.scala 489:82]
  wire  _T_1138 = ~_GEN_43; // @[el2_lsu_bus_buffer.scala 489:82]
  wire  _T_1139 = _T_1137 & _T_1138; // @[el2_lsu_bus_buffer.scala 489:80]
  wire  _T_1140 = ~_T_1139; // @[el2_lsu_bus_buffer.scala 489:38]
  wire [3:0] _T_1834 = ~_T_3056; // @[el2_lsu_bus_buffer.scala 559:55]
  wire [3:0] _T_1835 = _T_1821 & _T_1834; // @[el2_lsu_bus_buffer.scala 559:53]
  wire  _T_1836 = |_T_1835; // @[el2_lsu_bus_buffer.scala 559:78]
  wire  _T_1837 = ~_T_1836; // @[el2_lsu_bus_buffer.scala 559:32]
  wire  _T_1838 = ~CmdPtr0Dec_0; // @[el2_lsu_bus_buffer.scala 559:84]
  wire  _T_1839 = _T_1837 & _T_1838; // @[el2_lsu_bus_buffer.scala 559:82]
  wire  _T_1841 = _T_1839 & _T_2730; // @[el2_lsu_bus_buffer.scala 559:99]
  wire  CmdPtr1Dec_0 = _T_1841 & _T_3984; // @[el2_lsu_bus_buffer.scala 559:126]
  wire [3:0] _T_2215 = _T_2201 & _T_1834; // @[el2_lsu_bus_buffer.scala 559:53]
  wire  _T_2216 = |_T_2215; // @[el2_lsu_bus_buffer.scala 559:78]
  wire  _T_2217 = ~_T_2216; // @[el2_lsu_bus_buffer.scala 559:32]
  wire  _T_2218 = ~CmdPtr0Dec_1; // @[el2_lsu_bus_buffer.scala 559:84]
  wire  _T_2219 = _T_2217 & _T_2218; // @[el2_lsu_bus_buffer.scala 559:82]
  wire  _T_2221 = _T_2219 & _T_2825; // @[el2_lsu_bus_buffer.scala 559:99]
  wire  CmdPtr1Dec_1 = _T_2221 & _T_3989; // @[el2_lsu_bus_buffer.scala 559:126]
  wire  _T_3090 = CmdPtr1Dec_0 | CmdPtr1Dec_1; // @[el2_lsu_bus_buffer.scala 582:49]
  wire [3:0] _T_2595 = _T_2581 & _T_1834; // @[el2_lsu_bus_buffer.scala 559:53]
  wire  _T_2596 = |_T_2595; // @[el2_lsu_bus_buffer.scala 559:78]
  wire  _T_2597 = ~_T_2596; // @[el2_lsu_bus_buffer.scala 559:32]
  wire  _T_2598 = ~CmdPtr0Dec_2; // @[el2_lsu_bus_buffer.scala 559:84]
  wire  _T_2599 = _T_2597 & _T_2598; // @[el2_lsu_bus_buffer.scala 559:82]
  wire  _T_2601 = _T_2599 & _T_2920; // @[el2_lsu_bus_buffer.scala 559:99]
  wire  CmdPtr1Dec_2 = _T_2601 & _T_3994; // @[el2_lsu_bus_buffer.scala 559:126]
  wire  _T_3091 = _T_3090 | CmdPtr1Dec_2; // @[el2_lsu_bus_buffer.scala 582:49]
  wire [3:0] _T_2975 = _T_2961 & _T_1834; // @[el2_lsu_bus_buffer.scala 559:53]
  wire  _T_2976 = |_T_2975; // @[el2_lsu_bus_buffer.scala 559:78]
  wire  _T_2977 = ~_T_2976; // @[el2_lsu_bus_buffer.scala 559:32]
  wire  _T_2978 = ~CmdPtr0Dec_3; // @[el2_lsu_bus_buffer.scala 559:84]
  wire  _T_2979 = _T_2977 & _T_2978; // @[el2_lsu_bus_buffer.scala 559:82]
  wire  _T_2981 = _T_2979 & _T_3015; // @[el2_lsu_bus_buffer.scala 559:99]
  wire  CmdPtr1Dec_3 = _T_2981 & _T_3999; // @[el2_lsu_bus_buffer.scala 559:126]
  wire  found_cmdptr1 = _T_3091 | CmdPtr1Dec_3; // @[el2_lsu_bus_buffer.scala 582:49]
  wire  _T_1141 = _T_1140 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 489:103]
  wire  _T_1142 = _T_1141 | _GEN_19; // @[el2_lsu_bus_buffer.scala 489:119]
  wire  _T_1143 = _T_1142 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 489:142]
  wire  _T_1144 = _T_1136 & _T_1143; // @[el2_lsu_bus_buffer.scala 488:165]
  wire  _T_1145 = _T_1129 | _T_1144; // @[el2_lsu_bus_buffer.scala 487:110]
  wire  _T_1146 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 490:57]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 525:35]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 526:35]
  wire  _T_4309 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 734:66]
  wire  _T_4310 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 734:88]
  wire  _T_4311 = io_lsu_axi_awready & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 734:164]
  wire  _T_4312 = _T_4309 ? _T_4310 : _T_4311; // @[el2_lsu_bus_buffer.scala 734:50]
  wire  bus_cmd_ready = obuf_write ? _T_4312 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 734:34]
  wire  _T_1147 = bus_cmd_ready | _T_1146; // @[el2_lsu_bus_buffer.scala 490:55]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1148 = _T_1147 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 490:69]
  wire  _T_1149 = _T_1145 & _T_1148; // @[el2_lsu_bus_buffer.scala 489:164]
  wire  _T_1150 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 490:86]
  wire  _T_1151 = _T_1149 & _T_1150; // @[el2_lsu_bus_buffer.scala 490:84]
  reg [63:0] _T_1397; // @[Reg.scala 27:20]
  wire [31:0] obuf_addr = _T_1397[31:0]; // @[el2_lsu_bus_buffer.scala 520:25]
  wire  _T_4252 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 732:114]
  wire  _T_4253 = obuf_valid & _T_4252; // @[el2_lsu_bus_buffer.scala 732:95]
  wire  _T_4260 = ~_T_3169; // @[el2_lsu_bus_buffer.scala 732:177]
  wire  _T_4261 = _T_4232 & _T_4260; // @[el2_lsu_bus_buffer.scala 732:175]
  wire  _T_4301 = _T_4253 & _T_4261; // @[Mux.scala 27:72]
  wire  _T_4265 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 732:114]
  wire  _T_4266 = obuf_valid & _T_4265; // @[el2_lsu_bus_buffer.scala 732:95]
  wire  _T_4273 = ~_T_3377; // @[el2_lsu_bus_buffer.scala 732:177]
  wire  _T_4274 = _T_4234 & _T_4273; // @[el2_lsu_bus_buffer.scala 732:175]
  wire  _T_4302 = _T_4266 & _T_4274; // @[Mux.scala 27:72]
  wire  _T_4305 = _T_4301 | _T_4302; // @[Mux.scala 27:72]
  wire  _T_4278 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 732:114]
  wire  _T_4279 = obuf_valid & _T_4278; // @[el2_lsu_bus_buffer.scala 732:95]
  wire  _T_4286 = ~_T_3585; // @[el2_lsu_bus_buffer.scala 732:177]
  wire  _T_4287 = _T_4236 & _T_4286; // @[el2_lsu_bus_buffer.scala 732:175]
  wire  _T_4303 = _T_4279 & _T_4287; // @[Mux.scala 27:72]
  wire  _T_4306 = _T_4305 | _T_4303; // @[Mux.scala 27:72]
  wire  _T_4291 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 732:114]
  wire  _T_4292 = obuf_valid & _T_4291; // @[el2_lsu_bus_buffer.scala 732:95]
  wire  _T_4299 = ~_T_3793; // @[el2_lsu_bus_buffer.scala 732:177]
  wire  _T_4300 = _T_4238 & _T_4299; // @[el2_lsu_bus_buffer.scala 732:175]
  wire  _T_4304 = _T_4292 & _T_4300; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4306 | _T_4304; // @[Mux.scala 27:72]
  wire  _T_1154 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 490:127]
  wire  _T_1155 = _T_1151 & _T_1154; // @[el2_lsu_bus_buffer.scala 490:125]
  wire  obuf_wr_en = _T_1155 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 490:151]
  wire  _T_1157 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 491:58]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 735:50]
  wire  _T_4316 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 737:47]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 736:49]
  wire  _T_4317 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 737:82]
  wire  _T_4318 = _T_4316 & _T_4317; // @[el2_lsu_bus_buffer.scala 737:64]
  wire  _T_4319 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 737:123]
  wire  bus_cmd_sent = _T_4318 | _T_4319; // @[el2_lsu_bus_buffer.scala 737:101]
  wire  _T_1158 = bus_cmd_sent | _T_1157; // @[el2_lsu_bus_buffer.scala 491:44]
  wire  _T_1159 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 491:76]
  wire  _T_1160 = _T_1158 & _T_1159; // @[el2_lsu_bus_buffer.scala 491:74]
  wire  _T_1161 = _T_1160 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:88]
  wire  obuf_rst = _T_1161 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 491:109]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : _GEN_43; // @[el2_lsu_bus_buffer.scala 492:32]
  wire [31:0] _T_1212 = ibuf_buf_byp ? io_lsu_addr_r : _GEN_15; // @[el2_lsu_bus_buffer.scala 498:32]
  wire [63:0] obuf_addr_in = {{32'd0}, _T_1212}; // @[el2_lsu_bus_buffer.scala 498:26]
  wire  _T_1166 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 493:49]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _GEN_45 = 2'h1 == CmdPtr0 ? buf_sz_1 : buf_sz_0; // @[el2_lsu_bus_buffer.scala 500:32]
  wire [1:0] _GEN_46 = 2'h2 == CmdPtr0 ? buf_sz_2 : _GEN_45; // @[el2_lsu_bus_buffer.scala 500:32]
  wire [1:0] _GEN_47 = 2'h3 == CmdPtr0 ? buf_sz_3 : _GEN_46; // @[el2_lsu_bus_buffer.scala 500:32]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _GEN_47; // @[el2_lsu_bus_buffer.scala 500:32]
  wire  _T_1199 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 497:78]
  wire  _T_1202 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 497:110]
  wire  _T_1203 = obuf_sz_in[0] & _T_1202; // @[el2_lsu_bus_buffer.scala 497:108]
  wire  _T_1204 = _T_1199 | _T_1203; // @[el2_lsu_bus_buffer.scala 497:91]
  wire  _T_1207 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 497:167]
  wire  _T_1208 = ~_T_1207; // @[el2_lsu_bus_buffer.scala 497:147]
  wire  _T_1209 = obuf_sz_in[1] & _T_1208; // @[el2_lsu_bus_buffer.scala 497:145]
  wire  _T_1210 = _T_1204 | _T_1209; // @[el2_lsu_bus_buffer.scala 497:128]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1210; // @[el2_lsu_bus_buffer.scala 497:32]
  wire  _T_1167 = _T_1166 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 493:70]
  wire  _T_1168 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 493:90]
  wire  _T_1169 = _T_1167 & _T_1168; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_1170 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 493:109]
  wire  _T_1171 = _T_1169 & _T_1170; // @[el2_lsu_bus_buffer.scala 493:107]
  wire  _T_1172 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 493:123]
  wire  _T_1173 = _T_1171 & _T_1172; // @[el2_lsu_bus_buffer.scala 493:121]
  wire  _T_1174 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 493:140]
  wire  _T_1175 = _T_1173 & _T_1174; // @[el2_lsu_bus_buffer.scala 493:138]
  wire  _T_1176 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 494:48]
  wire  _T_1177 = obuf_valid & _T_1176; // @[el2_lsu_bus_buffer.scala 494:46]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 524:35]
  wire  _T_1178 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 494:118]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 739:49]
  wire  _T_1179 = bus_rsp_read & _T_1178; // @[el2_lsu_bus_buffer.scala 494:98]
  wire  _T_1180 = ~_T_1179; // @[el2_lsu_bus_buffer.scala 494:83]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 523:35]
  wire  _T_1181 = obuf_rdrsp_pend & _T_1180; // @[el2_lsu_bus_buffer.scala 494:81]
  wire  _T_1182 = _T_1177 | _T_1181; // @[el2_lsu_bus_buffer.scala 494:62]
  wire  obuf_nosend_in = _T_1175 & _T_1182; // @[el2_lsu_bus_buffer.scala 493:175]
  wire  _T_1184 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 495:45]
  wire  _T_1185 = obuf_wr_en & _T_1184; // @[el2_lsu_bus_buffer.scala 495:43]
  wire  _T_1186 = ~_T_1185; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_1187 = _T_1186 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 495:62]
  wire  _T_1191 = _T_1187 & _T_1180; // @[el2_lsu_bus_buffer.scala 495:80]
  wire  _T_1193 = bus_cmd_sent & _T_1170; // @[el2_lsu_bus_buffer.scala 495:156]
  wire  _T_1194 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 495:173]
  wire  _T_1195 = _T_1193 & _T_1194; // @[el2_lsu_bus_buffer.scala 495:171]
  wire [7:0] _T_1366 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1368 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1369 = io_end_addr_r[2] ? _T_1366 : _T_1368; // @[el2_lsu_bus_buffer.scala 516:49]
  wire [3:0] _T_3067 = {CmdPtr1Dec_3,CmdPtr1Dec_2,CmdPtr1Dec_1,CmdPtr1Dec_0}; // @[el2_lsu_bus_buffer.scala 579:59]
  wire [3:0] _T_3072 = _T_3067[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:69]
  wire [3:0] _T_3073 = _T_3067[2] ? 4'h4 : _T_3072; // @[Mux.scala 47:69]
  wire [3:0] _T_3074 = _T_3067[1] ? 4'h2 : _T_3073; // @[Mux.scala 47:69]
  wire [3:0] _T_3075 = _T_3067[0] ? 4'h1 : _T_3074; // @[Mux.scala 47:69]
  wire [1:0] CmdPtr1 = _T_3075[1:0]; // @[el2_lsu_bus_buffer.scala 579:27]
  wire [31:0] _GEN_57 = 2'h1 == CmdPtr1 ? buf_addr_1 : buf_addr_0; // @[el2_lsu_bus_buffer.scala 511:124]
  wire [31:0] _GEN_58 = 2'h2 == CmdPtr1 ? buf_addr_2 : _GEN_57; // @[el2_lsu_bus_buffer.scala 511:124]
  wire [31:0] _GEN_59 = 2'h3 == CmdPtr1 ? buf_addr_3 : _GEN_58; // @[el2_lsu_bus_buffer.scala 511:124]
  wire [3:0] _GEN_69 = 2'h1 == CmdPtr1 ? buf_byteen_1 : buf_byteen_0; // @[Cat.scala 29:58]
  wire [3:0] _GEN_70 = 2'h2 == CmdPtr1 ? buf_byteen_2 : _GEN_69; // @[Cat.scala 29:58]
  wire [3:0] _GEN_71 = 2'h3 == CmdPtr1 ? buf_byteen_3 : _GEN_70; // @[Cat.scala 29:58]
  wire [7:0] _T_1371 = {_GEN_71,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1372 = {4'h0,_GEN_71}; // @[Cat.scala 29:58]
  wire [7:0] _T_1373 = _GEN_59[2] ? _T_1371 : _T_1372; // @[el2_lsu_bus_buffer.scala 516:150]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1369 : _T_1373; // @[el2_lsu_bus_buffer.scala 516:31]
  wire  _T_1316 = CmdPtr0 != CmdPtr1; // @[el2_lsu_bus_buffer.scala 509:39]
  wire  _T_1317 = _T_1316 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 509:52]
  wire  _T_1318 = _T_1317 & found_cmdptr1; // @[el2_lsu_bus_buffer.scala 509:68]
  wire  _T_1320 = _T_1318 & _T_1130; // @[el2_lsu_bus_buffer.scala 509:84]
  wire [2:0] _GEN_49 = 2'h1 == CmdPtr1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 509:139]
  wire [2:0] _GEN_50 = 2'h2 == CmdPtr1 ? buf_state_2 : _GEN_49; // @[el2_lsu_bus_buffer.scala 509:139]
  wire [2:0] _GEN_51 = 2'h3 == CmdPtr1 ? buf_state_3 : _GEN_50; // @[el2_lsu_bus_buffer.scala 509:139]
  wire  _T_1321 = _GEN_51 == 3'h2; // @[el2_lsu_bus_buffer.scala 509:139]
  wire  _T_1322 = _T_1320 & _T_1321; // @[el2_lsu_bus_buffer.scala 509:117]
  wire  _T_1324 = _T_1322 & _T_1132; // @[el2_lsu_bus_buffer.scala 509:150]
  wire  _T_1326 = _T_1324 & _T_1122; // @[el2_lsu_bus_buffer.scala 510:62]
  wire  _T_1337 = _T_1138 & _GEN_35; // @[el2_lsu_bus_buffer.scala 512:58]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire  _GEN_61 = 2'h1 == CmdPtr0 ? buf_dualhi_1 : buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 512:80]
  wire  _GEN_62 = 2'h2 == CmdPtr0 ? buf_dualhi_2 : _GEN_61; // @[el2_lsu_bus_buffer.scala 512:80]
  wire  _GEN_63 = 2'h3 == CmdPtr0 ? buf_dualhi_3 : _GEN_62; // @[el2_lsu_bus_buffer.scala 512:80]
  wire  _T_1338 = ~_GEN_63; // @[el2_lsu_bus_buffer.scala 512:80]
  wire  _T_1339 = _T_1337 & _T_1338; // @[el2_lsu_bus_buffer.scala 512:78]
  wire  _T_1340 = _T_1339 & _GEN_39; // @[el2_lsu_bus_buffer.scala 512:101]
  wire  _T_1342 = _T_1326 & _T_1340; // @[el2_lsu_bus_buffer.scala 510:89]
  wire  _T_1343 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 513:54]
  wire  _T_1344 = _T_1343 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 513:70]
  wire  obuf_merge_en = _T_1342 | _T_1344; // @[el2_lsu_bus_buffer.scala 512:126]
  wire  _T_1214 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [63:0] _T_1388 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1390 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1391 = io_lsu_addr_r[2] ? _T_1388 : _T_1390; // @[el2_lsu_bus_buffer.scala 518:49]
  wire [31:0] _GEN_77 = 2'h1 == CmdPtr1 ? buf_data_1 : buf_data_0; // @[Cat.scala 29:58]
  wire [31:0] _GEN_78 = 2'h2 == CmdPtr1 ? buf_data_2 : _GEN_77; // @[Cat.scala 29:58]
  wire [31:0] _GEN_79 = 2'h3 == CmdPtr1 ? buf_data_3 : _GEN_78; // @[Cat.scala 29:58]
  wire [63:0] _T_1393 = {_GEN_79,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1394 = {32'h0,_GEN_79}; // @[Cat.scala 29:58]
  wire [63:0] _T_1395 = _GEN_59[2] ? _T_1393 : _T_1394; // @[el2_lsu_bus_buffer.scala 518:150]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1391 : _T_1395; // @[el2_lsu_bus_buffer.scala 518:31]
  wire [63:0] _T_1377 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1379 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1380 = io_lsu_addr_r[2] ? _T_1377 : _T_1379; // @[el2_lsu_bus_buffer.scala 517:49]
  wire [31:0] _GEN_73 = 2'h1 == CmdPtr0 ? buf_data_1 : buf_data_0; // @[Cat.scala 29:58]
  wire [31:0] _GEN_74 = 2'h2 == CmdPtr0 ? buf_data_2 : _GEN_73; // @[Cat.scala 29:58]
  wire [31:0] _GEN_75 = 2'h3 == CmdPtr0 ? buf_data_3 : _GEN_74; // @[Cat.scala 29:58]
  wire [63:0] _T_1382 = {_GEN_75,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1383 = {32'h0,_GEN_75}; // @[Cat.scala 29:58]
  wire [63:0] _T_1384 = _GEN_15[2] ? _T_1382 : _T_1383; // @[el2_lsu_bus_buffer.scala 517:150]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1380 : _T_1384; // @[el2_lsu_bus_buffer.scala 517:31]
  wire [7:0] _T_1217 = _T_1214 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1219 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1222 = _T_1219 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1224 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1227 = _T_1224 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1229 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1232 = _T_1229 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1234 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1237 = _T_1234 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1239 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1242 = _T_1239 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1244 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1247 = _T_1244 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire  _T_1249 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 499:69]
  wire [7:0] _T_1252 = _T_1249 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 499:53]
  wire [63:0] obuf_data_in = {_T_1252,_T_1247,_T_1242,_T_1237,_T_1232,_T_1227,_T_1222,_T_1217}; // @[Cat.scala 29:58]
  wire [7:0] _T_1355 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1357 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1358 = io_lsu_addr_r[2] ? _T_1355 : _T_1357; // @[el2_lsu_bus_buffer.scala 515:49]
  wire [3:0] _GEN_65 = 2'h1 == CmdPtr0 ? buf_byteen_1 : buf_byteen_0; // @[Cat.scala 29:58]
  wire [3:0] _GEN_66 = 2'h2 == CmdPtr0 ? buf_byteen_2 : _GEN_65; // @[Cat.scala 29:58]
  wire [3:0] _GEN_67 = 2'h3 == CmdPtr0 ? buf_byteen_3 : _GEN_66; // @[Cat.scala 29:58]
  wire [7:0] _T_1360 = {_GEN_67,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1361 = {4'h0,_GEN_67}; // @[Cat.scala 29:58]
  wire [7:0] _T_1362 = _GEN_15[2] ? _T_1360 : _T_1361; // @[el2_lsu_bus_buffer.scala 515:150]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1358 : _T_1362; // @[el2_lsu_bus_buffer.scala 515:31]
  wire  _T_1265 = obuf_byteen0_in[0] | _T_1214; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1269 = obuf_byteen0_in[1] | _T_1219; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1273 = obuf_byteen0_in[2] | _T_1224; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1277 = obuf_byteen0_in[3] | _T_1229; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1281 = obuf_byteen0_in[4] | _T_1234; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1285 = obuf_byteen0_in[5] | _T_1239; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1289 = obuf_byteen0_in[6] | _T_1244; // @[el2_lsu_bus_buffer.scala 501:69]
  wire  _T_1293 = obuf_byteen0_in[7] | _T_1249; // @[el2_lsu_bus_buffer.scala 501:69]
  wire [7:0] obuf_byteen_in = {_T_1293,_T_1289,_T_1285,_T_1281,_T_1277,_T_1273,_T_1269,_T_1265}; // @[Cat.scala 29:58]
  wire  _T_1301 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 503:42]
  wire  _T_1302 = ~_T_1301; // @[el2_lsu_bus_buffer.scala 503:29]
  wire [1:0] _T_1309 = ibuf_buf_byp ? WrPtr0_r : CmdPtr0; // @[el2_lsu_bus_buffer.scala 505:32]
  wire [1:0] _T_1310 = ibuf_buf_byp ? WrPtr1_r : CmdPtr0; // @[el2_lsu_bus_buffer.scala 506:32]
  wire  _T_1346 = buf_numvld_cmd_any > 4'h0; // @[el2_lsu_bus_buffer.scala 514:74]
  wire  _T_1347 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 514:103]
  wire  _T_1348 = _T_1346 & _T_1347; // @[el2_lsu_bus_buffer.scala 514:86]
  wire [2:0] _T_1350 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 514:154]
  reg [63:0] obuf_data; // @[Reg.scala 27:20]
  wire  _T_1406 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 531:32]
  wire  _T_1407 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 531:72]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0_in = {{1'd0}, _T_1309}; // @[el2_lsu_bus_buffer.scala 505:26]
  wire [2:0] obuf_tag1_in = {{1'd0}, _T_1310}; // @[el2_lsu_bus_buffer.scala 506:26]
  wire  _T_1418 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 546:56]
  wire  _T_1419 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  _T_1420 = ibuf_valid & _T_1419; // @[el2_lsu_bus_buffer.scala 546:83]
  wire  _T_1421 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 547:35]
  wire  _T_1422 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 547:72]
  wire  _T_1423 = io_ldst_dual_r & _T_1422; // @[el2_lsu_bus_buffer.scala 547:61]
  wire  _T_1424 = _T_1421 | _T_1423; // @[el2_lsu_bus_buffer.scala 547:43]
  wire  _T_1425 = io_lsu_busreq_r & _T_1424; // @[el2_lsu_bus_buffer.scala 547:23]
  wire  _T_1426 = _T_1420 | _T_1425; // @[el2_lsu_bus_buffer.scala 546:101]
  wire  _T_1427 = ~_T_1426; // @[el2_lsu_bus_buffer.scala 546:69]
  wire  _T_1428 = _T_1418 & _T_1427; // @[el2_lsu_bus_buffer.scala 546:67]
  wire  _T_1430 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 546:56]
  wire  _T_1431 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  _T_1432 = ibuf_valid & _T_1431; // @[el2_lsu_bus_buffer.scala 546:83]
  wire  _T_1433 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 547:35]
  wire  _T_1434 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 547:72]
  wire  _T_1435 = io_ldst_dual_r & _T_1434; // @[el2_lsu_bus_buffer.scala 547:61]
  wire  _T_1436 = _T_1433 | _T_1435; // @[el2_lsu_bus_buffer.scala 547:43]
  wire  _T_1437 = io_lsu_busreq_r & _T_1436; // @[el2_lsu_bus_buffer.scala 547:23]
  wire  _T_1438 = _T_1432 | _T_1437; // @[el2_lsu_bus_buffer.scala 546:101]
  wire  _T_1439 = ~_T_1438; // @[el2_lsu_bus_buffer.scala 546:69]
  wire  _T_1440 = _T_1430 & _T_1439; // @[el2_lsu_bus_buffer.scala 546:67]
  wire  _T_1442 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 546:56]
  wire  _T_1443 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  _T_1444 = ibuf_valid & _T_1443; // @[el2_lsu_bus_buffer.scala 546:83]
  wire  _T_1445 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 547:35]
  wire  _T_1446 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 547:72]
  wire  _T_1447 = io_ldst_dual_r & _T_1446; // @[el2_lsu_bus_buffer.scala 547:61]
  wire  _T_1448 = _T_1445 | _T_1447; // @[el2_lsu_bus_buffer.scala 547:43]
  wire  _T_1449 = io_lsu_busreq_r & _T_1448; // @[el2_lsu_bus_buffer.scala 547:23]
  wire  _T_1450 = _T_1444 | _T_1449; // @[el2_lsu_bus_buffer.scala 546:101]
  wire  _T_1451 = ~_T_1450; // @[el2_lsu_bus_buffer.scala 546:69]
  wire  _T_1452 = _T_1442 & _T_1451; // @[el2_lsu_bus_buffer.scala 546:67]
  wire  _T_1454 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 546:56]
  wire  _T_1455 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  _T_1456 = ibuf_valid & _T_1455; // @[el2_lsu_bus_buffer.scala 546:83]
  wire  _T_1457 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 547:35]
  wire  _T_1458 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 547:72]
  wire  _T_1459 = io_ldst_dual_r & _T_1458; // @[el2_lsu_bus_buffer.scala 547:61]
  wire  _T_1460 = _T_1457 | _T_1459; // @[el2_lsu_bus_buffer.scala 547:43]
  wire  _T_1461 = io_lsu_busreq_r & _T_1460; // @[el2_lsu_bus_buffer.scala 547:23]
  wire  _T_1462 = _T_1456 | _T_1461; // @[el2_lsu_bus_buffer.scala 546:101]
  wire  _T_1463 = ~_T_1462; // @[el2_lsu_bus_buffer.scala 546:69]
  wire  _T_1464 = _T_1454 & _T_1463; // @[el2_lsu_bus_buffer.scala 546:67]
  wire [1:0] _T_1466 = _T_1464 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1467 = _T_1452 ? 2'h2 : _T_1466; // @[Mux.scala 98:16]
  wire [1:0] _T_1468 = _T_1440 ? 2'h1 : _T_1467; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1428 ? 2'h0 : _T_1468; // @[Mux.scala 98:16]
  wire  _T_1473 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 550:35]
  wire  _T_1474 = io_lsu_busreq_m & _T_1473; // @[el2_lsu_bus_buffer.scala 550:23]
  wire  _T_1475 = _T_1420 | _T_1474; // @[el2_lsu_bus_buffer.scala 549:108]
  wire  _T_1477 = io_lsu_busreq_r & _T_1421; // @[el2_lsu_bus_buffer.scala 550:64]
  wire  _T_1480 = _T_1477 | _T_1423; // @[el2_lsu_bus_buffer.scala 550:85]
  wire  _T_1481 = _T_1475 | _T_1480; // @[el2_lsu_bus_buffer.scala 550:45]
  wire  _T_1482 = ~_T_1481; // @[el2_lsu_bus_buffer.scala 549:72]
  wire  _T_1483 = _T_1418 & _T_1482; // @[el2_lsu_bus_buffer.scala 549:70]
  wire  _T_1488 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 550:35]
  wire  _T_1489 = io_lsu_busreq_m & _T_1488; // @[el2_lsu_bus_buffer.scala 550:23]
  wire  _T_1490 = _T_1432 | _T_1489; // @[el2_lsu_bus_buffer.scala 549:108]
  wire  _T_1492 = io_lsu_busreq_r & _T_1433; // @[el2_lsu_bus_buffer.scala 550:64]
  wire  _T_1495 = _T_1492 | _T_1435; // @[el2_lsu_bus_buffer.scala 550:85]
  wire  _T_1496 = _T_1490 | _T_1495; // @[el2_lsu_bus_buffer.scala 550:45]
  wire  _T_1497 = ~_T_1496; // @[el2_lsu_bus_buffer.scala 549:72]
  wire  _T_1498 = _T_1430 & _T_1497; // @[el2_lsu_bus_buffer.scala 549:70]
  wire  _T_1503 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 550:35]
  wire  _T_1504 = io_lsu_busreq_m & _T_1503; // @[el2_lsu_bus_buffer.scala 550:23]
  wire  _T_1505 = _T_1444 | _T_1504; // @[el2_lsu_bus_buffer.scala 549:108]
  wire  _T_1507 = io_lsu_busreq_r & _T_1445; // @[el2_lsu_bus_buffer.scala 550:64]
  wire  _T_1510 = _T_1507 | _T_1447; // @[el2_lsu_bus_buffer.scala 550:85]
  wire  _T_1511 = _T_1505 | _T_1510; // @[el2_lsu_bus_buffer.scala 550:45]
  wire  _T_1512 = ~_T_1511; // @[el2_lsu_bus_buffer.scala 549:72]
  wire  _T_1513 = _T_1442 & _T_1512; // @[el2_lsu_bus_buffer.scala 549:70]
  wire  _T_1518 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 550:35]
  wire  _T_1519 = io_lsu_busreq_m & _T_1518; // @[el2_lsu_bus_buffer.scala 550:23]
  wire  _T_1520 = _T_1456 | _T_1519; // @[el2_lsu_bus_buffer.scala 549:108]
  wire  _T_1522 = io_lsu_busreq_r & _T_1457; // @[el2_lsu_bus_buffer.scala 550:64]
  wire  _T_1525 = _T_1522 | _T_1459; // @[el2_lsu_bus_buffer.scala 550:85]
  wire  _T_1526 = _T_1520 | _T_1525; // @[el2_lsu_bus_buffer.scala 550:45]
  wire  _T_1527 = ~_T_1526; // @[el2_lsu_bus_buffer.scala 549:72]
  wire  _T_1528 = _T_1454 & _T_1527; // @[el2_lsu_bus_buffer.scala 549:70]
  reg  buf_rspageQ_0_1; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  _T_1722 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 575:66]
  wire  buf_rsp_pickage_0_1 = buf_rspageQ_0_1 & _T_1722; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_0_0; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  _T_1627 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 575:66]
  wire  buf_rsp_pickage_0_0 = buf_rspageQ_0_0 & _T_1627; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_0_3; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  _T_1912 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 575:66]
  wire  buf_rsp_pickage_0_3 = buf_rspageQ_0_3 & _T_1912; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_0_2; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  _T_1817 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 575:66]
  wire  buf_rsp_pickage_0_2 = buf_rspageQ_0_2 & _T_1817; // @[el2_lsu_bus_buffer.scala 575:50]
  wire [3:0] _T_1561 = {buf_rsp_pickage_0_3,buf_rsp_pickage_0_2,buf_rsp_pickage_0_1,buf_rsp_pickage_0_0}; // @[el2_lsu_bus_buffer.scala 560:53]
  wire  _T_1562 = |_T_1561; // @[el2_lsu_bus_buffer.scala 560:63]
  wire  _T_1563 = ~_T_1562; // @[el2_lsu_bus_buffer.scala 560:32]
  wire  _T_1565 = _T_1563 & _T_1627; // @[el2_lsu_bus_buffer.scala 560:67]
  wire  _T_3136 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 617:83]
  wire  _T_3137 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 617:103]
  wire  _T_3138 = _T_3136 & _T_3137; // @[el2_lsu_bus_buffer.scala 617:101]
  wire  _T_3139 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 617:123]
  wire  _T_3140 = _T_3138 & _T_3139; // @[el2_lsu_bus_buffer.scala 617:118]
  wire  _T_3141 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 617:150]
  wire  _T_3142 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 617:172]
  wire  _T_3143 = _T_3141 & _T_3142; // @[el2_lsu_bus_buffer.scala 617:167]
  wire  _T_3144 = _T_3140 | _T_3143; // @[el2_lsu_bus_buffer.scala 617:138]
  wire  _T_3145 = _T_906 & _T_3144; // @[el2_lsu_bus_buffer.scala 617:69]
  wire  _T_3146 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 617:212]
  wire  _T_3147 = ibuf_drain_vld & _T_3146; // @[el2_lsu_bus_buffer.scala 617:207]
  wire  _T_3148 = _T_3145 | _T_3147; // @[el2_lsu_bus_buffer.scala 617:189]
  wire  _T_3158 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 624:52]
  wire  _T_3192 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 740:49]
  wire  _T_3217 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 642:76]
  wire  _T_3218 = bus_rsp_write & _T_3217; // @[el2_lsu_bus_buffer.scala 642:55]
  wire  _T_3219 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 643:78]
  reg  buf_ldfwd_0; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_474 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3220 = io_lsu_axi_rid == _GEN_474; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3221 = buf_ldfwd_0 & _T_3220; // @[el2_lsu_bus_buffer.scala 644:60]
  wire  _T_3222 = _T_3219 | _T_3221; // @[el2_lsu_bus_buffer.scala 643:113]
  wire  _T_3223 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 645:62]
  wire  _T_3224 = ~buf_write_0; // @[el2_lsu_bus_buffer.scala 645:80]
  wire  _T_3225 = _T_3223 & _T_3224; // @[el2_lsu_bus_buffer.scala 645:78]
  wire  _T_3226 = _T_3225 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 645:94]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_475 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3227 = io_lsu_axi_rid == _GEN_475; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3228 = _T_3226 & _T_3227; // @[el2_lsu_bus_buffer.scala 645:110]
  wire  _T_3229 = _T_3222 | _T_3228; // @[el2_lsu_bus_buffer.scala 644:104]
  wire  _T_3230 = bus_rsp_read & _T_3229; // @[el2_lsu_bus_buffer.scala 643:57]
  wire  _T_3231 = _T_3218 | _T_3230; // @[el2_lsu_bus_buffer.scala 642:112]
  wire  _GEN_118 = _T_3192 & _T_3231; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3159 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3155 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3132 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3256 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  reg  buf_ldfwd_3; // @[Reg.scala 27:20]
  reg  buf_ldfwd_2; // @[Reg.scala 27:20]
  reg  buf_ldfwd_1; // @[Reg.scala 27:20]
  wire  _GEN_95 = 2'h1 == buf_dualtag_0 ? buf_ldfwd_1 : buf_ldfwd_0; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_96 = 2'h2 == buf_dualtag_0 ? buf_ldfwd_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_97 = 2'h3 == buf_dualtag_0 ? buf_ldfwd_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 641:136]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [2:0] _GEN_477 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3263 = io_lsu_axi_rid == _GEN_477; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3264 = _GEN_97 & _T_3263; // @[el2_lsu_bus_buffer.scala 657:67]
  wire  _T_3265 = _T_3227 | _T_3264; // @[el2_lsu_bus_buffer.scala 656:100]
  wire  _T_3266 = bus_rsp_read & _T_3265; // @[el2_lsu_bus_buffer.scala 656:50]
  wire  _GEN_112 = _T_3256 & _T_3266; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3192 ? buf_resp_state_bus_en_0 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3159 ? buf_cmd_state_bus_en_0 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3155 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3132 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3172 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 630:61]
  wire  _T_3173 = _T_3172 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 630:82]
  wire  _T_3269 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  reg  buf_rspageQ_3_3; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_3_3 = buf_rspageQ_3_3 & _T_1912; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_3_2; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_3_2 = buf_rspageQ_3_2 & _T_1817; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_3_1; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_3_1 = buf_rspageQ_3_1 & _T_1722; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_3_0; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_3_0 = buf_rspageQ_3_0 & _T_1627; // @[el2_lsu_bus_buffer.scala 575:50]
  wire [3:0] _T_2986 = {buf_rsp_pickage_3_3,buf_rsp_pickage_3_2,buf_rsp_pickage_3_1,buf_rsp_pickage_3_0}; // @[el2_lsu_bus_buffer.scala 560:53]
  wire  _T_2987 = |_T_2986; // @[el2_lsu_bus_buffer.scala 560:63]
  wire  _T_2988 = ~_T_2987; // @[el2_lsu_bus_buffer.scala 560:32]
  wire  RspPtrDec_3 = _T_2988 & _T_1912; // @[el2_lsu_bus_buffer.scala 560:67]
  reg  buf_rspageQ_2_3; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_2_3 = buf_rspageQ_2_3 & _T_1912; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_2_2; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_2_2 = buf_rspageQ_2_2 & _T_1817; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_2_1; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_2_1 = buf_rspageQ_2_1 & _T_1722; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_2_0; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_2_0 = buf_rspageQ_2_0 & _T_1627; // @[el2_lsu_bus_buffer.scala 575:50]
  wire [3:0] _T_2606 = {buf_rsp_pickage_2_3,buf_rsp_pickage_2_2,buf_rsp_pickage_2_1,buf_rsp_pickage_2_0}; // @[el2_lsu_bus_buffer.scala 560:53]
  wire  _T_2607 = |_T_2606; // @[el2_lsu_bus_buffer.scala 560:63]
  wire  _T_2608 = ~_T_2607; // @[el2_lsu_bus_buffer.scala 560:32]
  wire  RspPtrDec_2 = _T_2608 & _T_1817; // @[el2_lsu_bus_buffer.scala 560:67]
  reg  buf_rspageQ_1_3; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_1_3 = buf_rspageQ_1_3 & _T_1912; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_1_2; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_1_2 = buf_rspageQ_1_2 & _T_1817; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_1_1; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_1_1 = buf_rspageQ_1_1 & _T_1722; // @[el2_lsu_bus_buffer.scala 575:50]
  reg  buf_rspageQ_1_0; // @[el2_lsu_bus_buffer.scala 691:41]
  wire  buf_rsp_pickage_1_0 = buf_rspageQ_1_0 & _T_1627; // @[el2_lsu_bus_buffer.scala 575:50]
  wire [3:0] _T_2226 = {buf_rsp_pickage_1_3,buf_rsp_pickage_1_2,buf_rsp_pickage_1_1,buf_rsp_pickage_1_0}; // @[el2_lsu_bus_buffer.scala 560:53]
  wire  _T_2227 = |_T_2226; // @[el2_lsu_bus_buffer.scala 560:63]
  wire  _T_2228 = ~_T_2227; // @[el2_lsu_bus_buffer.scala 560:32]
  wire  RspPtrDec_1 = _T_2228 & _T_1722; // @[el2_lsu_bus_buffer.scala 560:67]
  wire [3:0] _T_3078 = {RspPtrDec_3,RspPtrDec_2,RspPtrDec_1,_T_1565}; // @[el2_lsu_bus_buffer.scala 580:58]
  wire [3:0] _T_3083 = _T_3078[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:69]
  wire [3:0] _T_3084 = _T_3078[2] ? 4'h4 : _T_3083; // @[Mux.scala 47:69]
  wire [3:0] _T_3085 = _T_3078[1] ? 4'h2 : _T_3084; // @[Mux.scala 47:69]
  wire [3:0] _T_3086 = _T_3078[0] ? 4'h1 : _T_3085; // @[Mux.scala 47:69]
  wire [1:0] RspPtr = _T_3086[1:0]; // @[el2_lsu_bus_buffer.scala 580:27]
  wire  _T_3272 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 662:43]
  wire  _T_3273 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 662:103]
  wire  _T_3274 = buf_dual_0 & _T_3273; // @[el2_lsu_bus_buffer.scala 662:85]
  wire  _T_3275 = _T_3272 | _T_3274; // @[el2_lsu_bus_buffer.scala 662:71]
  wire  _T_3276 = _T_3275 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 662:117]
  wire  _T_3277 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3269 ? _T_3276 : _T_3277; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3256 ? _T_3173 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3192 ? _T_3173 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3159 ? _T_3173 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3155 ? _T_3158 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3132 ? _T_3148 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_1567 = _T_1418 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_1572 = _T_3986 | _T_3985; // @[el2_lsu_bus_buffer.scala 563:35]
  wire  _T_1573 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 564:25]
  wire  _T_1575 = _T_1573 & _T_3136; // @[el2_lsu_bus_buffer.scala 564:43]
  wire  _T_1577 = _T_1575 & _T_3139; // @[el2_lsu_bus_buffer.scala 564:73]
  wire  _T_1579 = _T_1577 & _T_3146; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_1580 = _T_1572 | _T_1579; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_1581 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 565:19]
  wire  _T_1582 = _T_1581 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 565:37]
  wire  _T_1584 = _T_1582 & _T_3142; // @[el2_lsu_bus_buffer.scala 565:54]
  wire  _T_1586 = _T_1584 & _T_3139; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_1587 = _T_1580 | _T_1586; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_1588 = _T_1567 & _T_1587; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_1602 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 570:125]
  wire  _T_1603 = _T_1418 | _T_1602; // @[el2_lsu_bus_buffer.scala 570:109]
  wire  _T_1604 = ~_T_1603; // @[el2_lsu_bus_buffer.scala 570:81]
  wire  _T_1612 = _T_1604 | _T_1579; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_1619 = _T_1612 | _T_1586; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_0_0 = _T_1567 & _T_1619; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  _T_1624 = _T_1602 | _T_1418; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_1625 = ~_T_1624; // @[el2_lsu_bus_buffer.scala 574:52]
  wire  buf_rspage_0_0 = buf_rspageQ_0_0 & _T_1625; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_1667 = _T_3991 | _T_3990; // @[el2_lsu_bus_buffer.scala 563:35]
  wire  _T_1673 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 564:97]
  wire  _T_1674 = _T_1577 & _T_1673; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_1675 = _T_1667 | _T_1674; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_1680 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 565:78]
  wire  _T_1681 = _T_1584 & _T_1680; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_1682 = _T_1675 | _T_1681; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_1683 = _T_1567 & _T_1682; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_1697 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 570:125]
  wire  _T_1698 = _T_1430 | _T_1697; // @[el2_lsu_bus_buffer.scala 570:109]
  wire  _T_1699 = ~_T_1698; // @[el2_lsu_bus_buffer.scala 570:81]
  wire  _T_1707 = _T_1699 | _T_1674; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_1714 = _T_1707 | _T_1681; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_0_1 = _T_1567 & _T_1714; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  _T_1719 = _T_1697 | _T_1430; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_1720 = ~_T_1719; // @[el2_lsu_bus_buffer.scala 574:52]
  wire  buf_rspage_0_1 = buf_rspageQ_0_1 & _T_1720; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_1762 = _T_3996 | _T_3995; // @[el2_lsu_bus_buffer.scala 563:35]
  wire  _T_1768 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 564:97]
  wire  _T_1769 = _T_1577 & _T_1768; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_1770 = _T_1762 | _T_1769; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_1775 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 565:78]
  wire  _T_1776 = _T_1584 & _T_1775; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_1777 = _T_1770 | _T_1776; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_1778 = _T_1567 & _T_1777; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_1792 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 570:125]
  wire  _T_1793 = _T_1442 | _T_1792; // @[el2_lsu_bus_buffer.scala 570:109]
  wire  _T_1794 = ~_T_1793; // @[el2_lsu_bus_buffer.scala 570:81]
  wire  _T_1802 = _T_1794 | _T_1769; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_1809 = _T_1802 | _T_1776; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_0_2 = _T_1567 & _T_1809; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  _T_1814 = _T_1792 | _T_1442; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_1815 = ~_T_1814; // @[el2_lsu_bus_buffer.scala 574:52]
  wire  buf_rspage_0_2 = buf_rspageQ_0_2 & _T_1815; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_1857 = _T_4001 | _T_4000; // @[el2_lsu_bus_buffer.scala 563:35]
  wire  _T_1863 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 564:97]
  wire  _T_1864 = _T_1577 & _T_1863; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_1865 = _T_1857 | _T_1864; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_1870 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 565:78]
  wire  _T_1871 = _T_1584 & _T_1870; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_1872 = _T_1865 | _T_1871; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_1873 = _T_1567 & _T_1872; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_1887 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 570:125]
  wire  _T_1888 = _T_1454 | _T_1887; // @[el2_lsu_bus_buffer.scala 570:109]
  wire  _T_1889 = ~_T_1888; // @[el2_lsu_bus_buffer.scala 570:81]
  wire  _T_1897 = _T_1889 | _T_1864; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_1904 = _T_1897 | _T_1871; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_0_3 = _T_1567 & _T_1904; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  _T_1909 = _T_1887 | _T_1454; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_1910 = ~_T_1909; // @[el2_lsu_bus_buffer.scala 574:52]
  wire  buf_rspage_0_3 = buf_rspageQ_0_3 & _T_1910; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_3348 = _T_3138 & _T_1680; // @[el2_lsu_bus_buffer.scala 617:118]
  wire  _T_3350 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 617:172]
  wire  _T_3351 = _T_3141 & _T_3350; // @[el2_lsu_bus_buffer.scala 617:167]
  wire  _T_3352 = _T_3348 | _T_3351; // @[el2_lsu_bus_buffer.scala 617:138]
  wire  _T_3353 = _T_906 & _T_3352; // @[el2_lsu_bus_buffer.scala 617:69]
  wire  _T_3355 = ibuf_drain_vld & _T_1673; // @[el2_lsu_bus_buffer.scala 617:207]
  wire  _T_3356 = _T_3353 | _T_3355; // @[el2_lsu_bus_buffer.scala 617:189]
  wire  _T_3400 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3425 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 642:76]
  wire  _T_3426 = bus_rsp_write & _T_3425; // @[el2_lsu_bus_buffer.scala 642:55]
  wire  _T_3427 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 643:78]
  wire [2:0] _GEN_478 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3428 = io_lsu_axi_rid == _GEN_478; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3429 = buf_ldfwd_1 & _T_3428; // @[el2_lsu_bus_buffer.scala 644:60]
  wire  _T_3430 = _T_3427 | _T_3429; // @[el2_lsu_bus_buffer.scala 643:113]
  wire  _T_3431 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 645:62]
  wire  _T_3432 = ~buf_write_1; // @[el2_lsu_bus_buffer.scala 645:80]
  wire  _T_3433 = _T_3431 & _T_3432; // @[el2_lsu_bus_buffer.scala 645:78]
  wire  _T_3434 = _T_3433 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 645:94]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_479 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3435 = io_lsu_axi_rid == _GEN_479; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3436 = _T_3434 & _T_3435; // @[el2_lsu_bus_buffer.scala 645:110]
  wire  _T_3437 = _T_3430 | _T_3436; // @[el2_lsu_bus_buffer.scala 644:104]
  wire  _T_3438 = bus_rsp_read & _T_3437; // @[el2_lsu_bus_buffer.scala 643:57]
  wire  _T_3439 = _T_3426 | _T_3438; // @[el2_lsu_bus_buffer.scala 642:112]
  wire  _GEN_208 = _T_3400 & _T_3439; // @[Conditional.scala 39:67]
  wire  _GEN_227 = _T_3367 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_239 = _T_3363 ? 1'h0 : _GEN_227; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3340 ? 1'h0 : _GEN_239; // @[Conditional.scala 40:58]
  wire  _T_3464 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_185 = 2'h1 == buf_dualtag_1 ? buf_ldfwd_1 : buf_ldfwd_0; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_186 = 2'h2 == buf_dualtag_1 ? buf_ldfwd_2 : _GEN_185; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_187 = 2'h3 == buf_dualtag_1 ? buf_ldfwd_3 : _GEN_186; // @[el2_lsu_bus_buffer.scala 641:136]
  wire [1:0] _GEN_189 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_190 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_189; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_191 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_190; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [2:0] _GEN_481 = {{1'd0}, _GEN_191}; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3471 = io_lsu_axi_rid == _GEN_481; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3472 = _GEN_187 & _T_3471; // @[el2_lsu_bus_buffer.scala 657:67]
  wire  _T_3473 = _T_3435 | _T_3472; // @[el2_lsu_bus_buffer.scala 656:100]
  wire  _T_3474 = bus_rsp_read & _T_3473; // @[el2_lsu_bus_buffer.scala 656:50]
  wire  _GEN_202 = _T_3464 & _T_3474; // @[Conditional.scala 39:67]
  wire  _GEN_209 = _T_3400 ? buf_resp_state_bus_en_1 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_219 = _T_3367 ? buf_cmd_state_bus_en_1 : _GEN_209; // @[Conditional.scala 39:67]
  wire  _GEN_232 = _T_3363 ? 1'h0 : _GEN_219; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3340 ? 1'h0 : _GEN_232; // @[Conditional.scala 40:58]
  wire  _T_3380 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 630:61]
  wire  _T_3381 = _T_3380 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 630:82]
  wire  _T_3477 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3480 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 662:43]
  wire  _T_3481 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 662:103]
  wire  _T_3482 = buf_dual_1 & _T_3481; // @[el2_lsu_bus_buffer.scala 662:85]
  wire  _T_3483 = _T_3480 | _T_3482; // @[el2_lsu_bus_buffer.scala 662:71]
  wire  _T_3484 = _T_3483 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 662:117]
  wire  _T_3485 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_197 = _T_3477 ? _T_3484 : _T_3485; // @[Conditional.scala 39:67]
  wire  _GEN_203 = _T_3464 ? _T_3381 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3400 ? _T_3381 : _GEN_203; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3367 ? _T_3381 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_230 = _T_3363 ? _T_3158 : _GEN_220; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3340 ? _T_3356 : _GEN_230; // @[Conditional.scala 40:58]
  wire  _T_1947 = _T_1430 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_1957 = _T_1575 & _T_1680; // @[el2_lsu_bus_buffer.scala 564:73]
  wire  _T_1959 = _T_1957 & _T_3146; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_1960 = _T_1572 | _T_1959; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_1964 = _T_1582 & _T_3350; // @[el2_lsu_bus_buffer.scala 565:54]
  wire  _T_1966 = _T_1964 & _T_3139; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_1967 = _T_1960 | _T_1966; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_1968 = _T_1947 & _T_1967; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_1992 = _T_1604 | _T_1959; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_1999 = _T_1992 | _T_1966; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_1_0 = _T_1947 & _T_1999; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_1_0 = buf_rspageQ_1_0 & _T_1625; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2054 = _T_1957 & _T_1673; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2055 = _T_1667 | _T_2054; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2061 = _T_1964 & _T_1680; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2062 = _T_2055 | _T_2061; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2063 = _T_1947 & _T_2062; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2087 = _T_1699 | _T_2054; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2094 = _T_2087 | _T_2061; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_1_1 = _T_1947 & _T_2094; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_1_1 = buf_rspageQ_1_1 & _T_1720; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2149 = _T_1957 & _T_1768; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2150 = _T_1762 | _T_2149; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2156 = _T_1964 & _T_1775; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2157 = _T_2150 | _T_2156; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2158 = _T_1947 & _T_2157; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2182 = _T_1794 | _T_2149; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2189 = _T_2182 | _T_2156; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_1_2 = _T_1947 & _T_2189; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_1_2 = buf_rspageQ_1_2 & _T_1815; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2244 = _T_1957 & _T_1863; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2245 = _T_1857 | _T_2244; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2251 = _T_1964 & _T_1870; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2252 = _T_2245 | _T_2251; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2253 = _T_1947 & _T_2252; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2277 = _T_1889 | _T_2244; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2284 = _T_2277 | _T_2251; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_1_3 = _T_1947 & _T_2284; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_1_3 = buf_rspageQ_1_3 & _T_1910; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_3556 = _T_3138 & _T_1775; // @[el2_lsu_bus_buffer.scala 617:118]
  wire  _T_3558 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 617:172]
  wire  _T_3559 = _T_3141 & _T_3558; // @[el2_lsu_bus_buffer.scala 617:167]
  wire  _T_3560 = _T_3556 | _T_3559; // @[el2_lsu_bus_buffer.scala 617:138]
  wire  _T_3561 = _T_906 & _T_3560; // @[el2_lsu_bus_buffer.scala 617:69]
  wire  _T_3563 = ibuf_drain_vld & _T_1768; // @[el2_lsu_bus_buffer.scala 617:207]
  wire  _T_3564 = _T_3561 | _T_3563; // @[el2_lsu_bus_buffer.scala 617:189]
  wire  _T_3608 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3633 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 642:76]
  wire  _T_3634 = bus_rsp_write & _T_3633; // @[el2_lsu_bus_buffer.scala 642:55]
  wire  _T_3635 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 643:78]
  wire [2:0] _GEN_482 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3636 = io_lsu_axi_rid == _GEN_482; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3637 = buf_ldfwd_2 & _T_3636; // @[el2_lsu_bus_buffer.scala 644:60]
  wire  _T_3638 = _T_3635 | _T_3637; // @[el2_lsu_bus_buffer.scala 643:113]
  wire  _T_3639 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 645:62]
  wire  _T_3640 = ~buf_write_2; // @[el2_lsu_bus_buffer.scala 645:80]
  wire  _T_3641 = _T_3639 & _T_3640; // @[el2_lsu_bus_buffer.scala 645:78]
  wire  _T_3642 = _T_3641 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 645:94]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_483 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3643 = io_lsu_axi_rid == _GEN_483; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3644 = _T_3642 & _T_3643; // @[el2_lsu_bus_buffer.scala 645:110]
  wire  _T_3645 = _T_3638 | _T_3644; // @[el2_lsu_bus_buffer.scala 644:104]
  wire  _T_3646 = bus_rsp_read & _T_3645; // @[el2_lsu_bus_buffer.scala 643:57]
  wire  _T_3647 = _T_3634 | _T_3646; // @[el2_lsu_bus_buffer.scala 642:112]
  wire  _GEN_298 = _T_3608 & _T_3647; // @[Conditional.scala 39:67]
  wire  _GEN_317 = _T_3575 ? 1'h0 : _GEN_298; // @[Conditional.scala 39:67]
  wire  _GEN_329 = _T_3571 ? 1'h0 : _GEN_317; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3548 ? 1'h0 : _GEN_329; // @[Conditional.scala 40:58]
  wire  _T_3672 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_275 = 2'h1 == buf_dualtag_2 ? buf_ldfwd_1 : buf_ldfwd_0; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_276 = 2'h2 == buf_dualtag_2 ? buf_ldfwd_2 : _GEN_275; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_277 = 2'h3 == buf_dualtag_2 ? buf_ldfwd_3 : _GEN_276; // @[el2_lsu_bus_buffer.scala 641:136]
  wire [1:0] _GEN_279 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_280 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_279; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_281 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_280; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [2:0] _GEN_485 = {{1'd0}, _GEN_281}; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3679 = io_lsu_axi_rid == _GEN_485; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3680 = _GEN_277 & _T_3679; // @[el2_lsu_bus_buffer.scala 657:67]
  wire  _T_3681 = _T_3643 | _T_3680; // @[el2_lsu_bus_buffer.scala 656:100]
  wire  _T_3682 = bus_rsp_read & _T_3681; // @[el2_lsu_bus_buffer.scala 656:50]
  wire  _GEN_292 = _T_3672 & _T_3682; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_3608 ? buf_resp_state_bus_en_2 : _GEN_292; // @[Conditional.scala 39:67]
  wire  _GEN_309 = _T_3575 ? buf_cmd_state_bus_en_2 : _GEN_299; // @[Conditional.scala 39:67]
  wire  _GEN_322 = _T_3571 ? 1'h0 : _GEN_309; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3548 ? 1'h0 : _GEN_322; // @[Conditional.scala 40:58]
  wire  _T_3588 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 630:61]
  wire  _T_3589 = _T_3588 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 630:82]
  wire  _T_3685 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3688 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 662:43]
  wire  _T_3689 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 662:103]
  wire  _T_3690 = buf_dual_2 & _T_3689; // @[el2_lsu_bus_buffer.scala 662:85]
  wire  _T_3691 = _T_3688 | _T_3690; // @[el2_lsu_bus_buffer.scala 662:71]
  wire  _T_3692 = _T_3691 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 662:117]
  wire  _T_3693 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_287 = _T_3685 ? _T_3692 : _T_3693; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_3672 ? _T_3589 : _GEN_287; // @[Conditional.scala 39:67]
  wire  _GEN_300 = _T_3608 ? _T_3589 : _GEN_293; // @[Conditional.scala 39:67]
  wire  _GEN_310 = _T_3575 ? _T_3589 : _GEN_300; // @[Conditional.scala 39:67]
  wire  _GEN_320 = _T_3571 ? _T_3158 : _GEN_310; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3548 ? _T_3564 : _GEN_320; // @[Conditional.scala 40:58]
  wire  _T_2327 = _T_1442 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_2337 = _T_1575 & _T_1775; // @[el2_lsu_bus_buffer.scala 564:73]
  wire  _T_2339 = _T_2337 & _T_3146; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2340 = _T_1572 | _T_2339; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2344 = _T_1582 & _T_3558; // @[el2_lsu_bus_buffer.scala 565:54]
  wire  _T_2346 = _T_2344 & _T_3139; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2347 = _T_2340 | _T_2346; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2348 = _T_2327 & _T_2347; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2372 = _T_1604 | _T_2339; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2379 = _T_2372 | _T_2346; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_2_0 = _T_2327 & _T_2379; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_2_0 = buf_rspageQ_2_0 & _T_1625; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2434 = _T_2337 & _T_1673; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2435 = _T_1667 | _T_2434; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2441 = _T_2344 & _T_1680; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2442 = _T_2435 | _T_2441; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2443 = _T_2327 & _T_2442; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2467 = _T_1699 | _T_2434; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2474 = _T_2467 | _T_2441; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_2_1 = _T_2327 & _T_2474; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_2_1 = buf_rspageQ_2_1 & _T_1720; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2529 = _T_2337 & _T_1768; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2530 = _T_1762 | _T_2529; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2536 = _T_2344 & _T_1775; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2537 = _T_2530 | _T_2536; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2538 = _T_2327 & _T_2537; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2562 = _T_1794 | _T_2529; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2569 = _T_2562 | _T_2536; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_2_2 = _T_2327 & _T_2569; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_2_2 = buf_rspageQ_2_2 & _T_1815; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2624 = _T_2337 & _T_1863; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2625 = _T_1857 | _T_2624; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2631 = _T_2344 & _T_1870; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2632 = _T_2625 | _T_2631; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2633 = _T_2327 & _T_2632; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2657 = _T_1889 | _T_2624; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2664 = _T_2657 | _T_2631; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_2_3 = _T_2327 & _T_2664; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_2_3 = buf_rspageQ_2_3 & _T_1910; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_3764 = _T_3138 & _T_1870; // @[el2_lsu_bus_buffer.scala 617:118]
  wire  _T_3766 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 617:172]
  wire  _T_3767 = _T_3141 & _T_3766; // @[el2_lsu_bus_buffer.scala 617:167]
  wire  _T_3768 = _T_3764 | _T_3767; // @[el2_lsu_bus_buffer.scala 617:138]
  wire  _T_3769 = _T_906 & _T_3768; // @[el2_lsu_bus_buffer.scala 617:69]
  wire  _T_3771 = ibuf_drain_vld & _T_1863; // @[el2_lsu_bus_buffer.scala 617:207]
  wire  _T_3772 = _T_3769 | _T_3771; // @[el2_lsu_bus_buffer.scala 617:189]
  wire  _T_3816 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3841 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 642:76]
  wire  _T_3842 = bus_rsp_write & _T_3841; // @[el2_lsu_bus_buffer.scala 642:55]
  wire  _T_3843 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 643:78]
  wire [2:0] _GEN_486 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3844 = io_lsu_axi_rid == _GEN_486; // @[el2_lsu_bus_buffer.scala 644:80]
  wire  _T_3845 = buf_ldfwd_3 & _T_3844; // @[el2_lsu_bus_buffer.scala 644:60]
  wire  _T_3846 = _T_3843 | _T_3845; // @[el2_lsu_bus_buffer.scala 643:113]
  wire  _T_3847 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 645:62]
  wire  _T_3848 = ~buf_write_3; // @[el2_lsu_bus_buffer.scala 645:80]
  wire  _T_3849 = _T_3847 & _T_3848; // @[el2_lsu_bus_buffer.scala 645:78]
  wire  _T_3850 = _T_3849 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 645:94]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_487 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3851 = io_lsu_axi_rid == _GEN_487; // @[el2_lsu_bus_buffer.scala 645:130]
  wire  _T_3852 = _T_3850 & _T_3851; // @[el2_lsu_bus_buffer.scala 645:110]
  wire  _T_3853 = _T_3846 | _T_3852; // @[el2_lsu_bus_buffer.scala 644:104]
  wire  _T_3854 = bus_rsp_read & _T_3853; // @[el2_lsu_bus_buffer.scala 643:57]
  wire  _T_3855 = _T_3842 | _T_3854; // @[el2_lsu_bus_buffer.scala 642:112]
  wire  _GEN_388 = _T_3816 & _T_3855; // @[Conditional.scala 39:67]
  wire  _GEN_407 = _T_3783 ? 1'h0 : _GEN_388; // @[Conditional.scala 39:67]
  wire  _GEN_419 = _T_3779 ? 1'h0 : _GEN_407; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_3756 ? 1'h0 : _GEN_419; // @[Conditional.scala 40:58]
  wire  _T_3880 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_365 = 2'h1 == buf_dualtag_3 ? buf_ldfwd_1 : buf_ldfwd_0; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_366 = 2'h2 == buf_dualtag_3 ? buf_ldfwd_2 : _GEN_365; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _GEN_367 = 2'h3 == buf_dualtag_3 ? buf_ldfwd_3 : _GEN_366; // @[el2_lsu_bus_buffer.scala 641:136]
  wire [1:0] _GEN_369 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_370 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_369; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [1:0] _GEN_371 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_370; // @[el2_lsu_bus_buffer.scala 657:87]
  wire [2:0] _GEN_489 = {{1'd0}, _GEN_371}; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3887 = io_lsu_axi_rid == _GEN_489; // @[el2_lsu_bus_buffer.scala 657:87]
  wire  _T_3888 = _GEN_367 & _T_3887; // @[el2_lsu_bus_buffer.scala 657:67]
  wire  _T_3889 = _T_3851 | _T_3888; // @[el2_lsu_bus_buffer.scala 656:100]
  wire  _T_3890 = bus_rsp_read & _T_3889; // @[el2_lsu_bus_buffer.scala 656:50]
  wire  _GEN_382 = _T_3880 & _T_3890; // @[Conditional.scala 39:67]
  wire  _GEN_389 = _T_3816 ? buf_resp_state_bus_en_3 : _GEN_382; // @[Conditional.scala 39:67]
  wire  _GEN_399 = _T_3783 ? buf_cmd_state_bus_en_3 : _GEN_389; // @[Conditional.scala 39:67]
  wire  _GEN_412 = _T_3779 ? 1'h0 : _GEN_399; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_3756 ? 1'h0 : _GEN_412; // @[Conditional.scala 40:58]
  wire  _T_3796 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 630:61]
  wire  _T_3797 = _T_3796 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 630:82]
  wire  _T_3893 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3896 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 662:43]
  wire  _T_3897 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 662:103]
  wire  _T_3898 = buf_dual_3 & _T_3897; // @[el2_lsu_bus_buffer.scala 662:85]
  wire  _T_3899 = _T_3896 | _T_3898; // @[el2_lsu_bus_buffer.scala 662:71]
  wire  _T_3900 = _T_3899 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 662:117]
  wire  _T_3901 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_377 = _T_3893 ? _T_3900 : _T_3901; // @[Conditional.scala 39:67]
  wire  _GEN_383 = _T_3880 ? _T_3797 : _GEN_377; // @[Conditional.scala 39:67]
  wire  _GEN_390 = _T_3816 ? _T_3797 : _GEN_383; // @[Conditional.scala 39:67]
  wire  _GEN_400 = _T_3783 ? _T_3797 : _GEN_390; // @[Conditional.scala 39:67]
  wire  _GEN_410 = _T_3779 ? _T_3158 : _GEN_400; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_3756 ? _T_3772 : _GEN_410; // @[Conditional.scala 40:58]
  wire  _T_2707 = _T_1454 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_2717 = _T_1575 & _T_1870; // @[el2_lsu_bus_buffer.scala 564:73]
  wire  _T_2719 = _T_2717 & _T_3146; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2720 = _T_1572 | _T_2719; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2724 = _T_1582 & _T_3766; // @[el2_lsu_bus_buffer.scala 565:54]
  wire  _T_2726 = _T_2724 & _T_3139; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2727 = _T_2720 | _T_2726; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2728 = _T_2707 & _T_2727; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2752 = _T_1604 | _T_2719; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2759 = _T_2752 | _T_2726; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_3_0 = _T_2707 & _T_2759; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_3_0 = buf_rspageQ_3_0 & _T_1625; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2814 = _T_2717 & _T_1673; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2815 = _T_1667 | _T_2814; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2821 = _T_2724 & _T_1680; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2822 = _T_2815 | _T_2821; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2823 = _T_2707 & _T_2822; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2847 = _T_1699 | _T_2814; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2854 = _T_2847 | _T_2821; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_3_1 = _T_2707 & _T_2854; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_3_1 = buf_rspageQ_3_1 & _T_1720; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_2909 = _T_2717 & _T_1768; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_2910 = _T_1762 | _T_2909; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_2916 = _T_2724 & _T_1775; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_2917 = _T_2910 | _T_2916; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_2918 = _T_2707 & _T_2917; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_2942 = _T_1794 | _T_2909; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_2949 = _T_2942 | _T_2916; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_3_2 = _T_2707 & _T_2949; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_3_2 = buf_rspageQ_3_2 & _T_1815; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_3004 = _T_2717 & _T_1863; // @[el2_lsu_bus_buffer.scala 564:92]
  wire  _T_3005 = _T_1857 | _T_3004; // @[el2_lsu_bus_buffer.scala 563:93]
  wire  _T_3011 = _T_2724 & _T_1870; // @[el2_lsu_bus_buffer.scala 565:73]
  wire  _T_3012 = _T_3005 | _T_3011; // @[el2_lsu_bus_buffer.scala 564:113]
  wire  _T_3013 = _T_2707 & _T_3012; // @[el2_lsu_bus_buffer.scala 562:79]
  wire  _T_3037 = _T_1889 | _T_3004; // @[el2_lsu_bus_buffer.scala 570:139]
  wire  _T_3044 = _T_3037 | _T_3011; // @[el2_lsu_bus_buffer.scala 571:110]
  wire  buf_rspage_set_3_3 = _T_2707 & _T_3044; // @[el2_lsu_bus_buffer.scala 570:78]
  wire  buf_rspage_3_3 = buf_rspageQ_3_3 & _T_1910; // @[el2_lsu_bus_buffer.scala 574:50]
  wire  _T_3115 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 605:77]
  wire  _T_3161 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 627:101]
  wire  _T_3163 = _T_3161 & _T_1178; // @[el2_lsu_bus_buffer.scala 627:116]
  wire  _T_3175 = buf_state_en_0 & _T_3224; // @[el2_lsu_bus_buffer.scala 632:56]
  wire  _T_3176 = _T_3175 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 632:72]
  wire  _T_3178 = _T_3176 & _T_1194; // @[el2_lsu_bus_buffer.scala 632:86]
  wire  _T_3181 = _T_3172 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 634:80]
  wire  _T_3182 = _T_3181 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 634:94]
  wire  _T_4329 = io_lsu_axi_rresp != 2'h0; // @[el2_lsu_bus_buffer.scala 744:70]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4329; // @[el2_lsu_bus_buffer.scala 744:45]
  wire  _T_3185 = _T_3181 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 635:94]
  wire  _T_3238 = bus_rsp_read_error & _T_3219; // @[el2_lsu_bus_buffer.scala 649:103]
  wire  _T_3239 = bus_rsp_read_error & buf_ldfwd_0; // @[el2_lsu_bus_buffer.scala 650:63]
  wire  _T_3241 = _T_3239 & _T_3220; // @[el2_lsu_bus_buffer.scala 650:78]
  wire  _T_3242 = _T_3238 | _T_3241; // @[el2_lsu_bus_buffer.scala 649:160]
  wire  _T_4326 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 743:70]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4326; // @[el2_lsu_bus_buffer.scala 743:45]
  wire  _T_3245 = bus_rsp_write_error & _T_3217; // @[el2_lsu_bus_buffer.scala 651:89]
  wire  _T_3246 = _T_3242 | _T_3245; // @[el2_lsu_bus_buffer.scala 650:120]
  wire  _T_3247 = _T_3172 & _T_3246; // @[el2_lsu_bus_buffer.scala 649:80]
  wire  _GEN_122 = _T_3192 & _T_3247; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3159 ? _T_3185 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3155 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3132 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3194 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 639:85]
  wire  _T_3195 = buf_write_0 & _T_3194; // @[el2_lsu_bus_buffer.scala 639:83]
  wire  _T_3196 = io_dec_tlu_force_halt | _T_3195; // @[el2_lsu_bus_buffer.scala 639:67]
  wire  _T_3198 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 640:62]
  wire  _T_3199 = buf_dual_0 & _T_3198; // @[el2_lsu_bus_buffer.scala 640:60]
  wire  _T_3201 = _T_3199 & _T_3224; // @[el2_lsu_bus_buffer.scala 640:78]
  wire [2:0] _GEN_91 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_92 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_91; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_93 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_92; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3202 = _GEN_93 != 3'h4; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3203 = _T_3201 & _T_3202; // @[el2_lsu_bus_buffer.scala 640:95]
  wire  _T_4013 = _T_1627 | _T_1722; // @[el2_lsu_bus_buffer.scala 701:158]
  wire  _T_4014 = _T_4013 | _T_1817; // @[el2_lsu_bus_buffer.scala 701:158]
  wire  any_done_wait_state = _T_4014 | _T_1912; // @[el2_lsu_bus_buffer.scala 701:158]
  wire  _T_3204 = buf_ldfwd_0 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:64]
  wire  _T_3209 = _T_3201 & _GEN_97; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _T_3210 = _GEN_93 == 3'h4; // @[el2_lsu_bus_buffer.scala 641:193]
  wire  _T_3211 = _T_3209 & _T_3210; // @[el2_lsu_bus_buffer.scala 641:164]
  wire  _T_3212 = _T_3211 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:213]
  wire  _T_3213 = _T_3204 | _T_3212; // @[el2_lsu_bus_buffer.scala 641:86]
  wire  _T_3234 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 648:60]
  wire  _T_3235 = _T_3234 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 648:75]
  wire  _T_3248 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 652:63]
  wire  _T_3249 = buf_state_en_0 & _T_3248; // @[el2_lsu_bus_buffer.scala 652:61]
  wire  _T_3258 = buf_ldfwd_0 | _GEN_97; // @[el2_lsu_bus_buffer.scala 655:99]
  wire  _T_3259 = _T_3258 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 655:127]
  wire  _GEN_105 = _T_3277 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3269 ? 1'h0 : _T_3277; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3269 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3256 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3256 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3192 & _T_3235; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3192 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3192 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3159 ? _T_3178 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3159 ? _T_3182 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3159 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3155 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3155 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3155 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3132 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3132 ? buf_state_en_0 : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3132 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3132 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  reg  buf_unsign_0; // @[Reg.scala 27:20]
  wire  _T_3293 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 689:44]
  wire  _T_3294 = buf_error_en_0 | buf_rst_0; // @[el2_lsu_bus_buffer.scala 689:99]
  reg  buf_error_0; // @[Reg.scala 27:20]
  wire  _T_3383 = buf_state_en_1 & _T_3432; // @[el2_lsu_bus_buffer.scala 632:56]
  wire  _T_3384 = _T_3383 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 632:72]
  wire  _T_3386 = _T_3384 & _T_1194; // @[el2_lsu_bus_buffer.scala 632:86]
  wire  _T_3389 = _T_3380 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 634:80]
  wire  _T_3390 = _T_3389 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 634:94]
  wire  _T_3393 = _T_3389 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 635:94]
  wire  _T_3446 = bus_rsp_read_error & _T_3427; // @[el2_lsu_bus_buffer.scala 649:103]
  wire  _T_3447 = bus_rsp_read_error & buf_ldfwd_1; // @[el2_lsu_bus_buffer.scala 650:63]
  wire  _T_3449 = _T_3447 & _T_3428; // @[el2_lsu_bus_buffer.scala 650:78]
  wire  _T_3450 = _T_3446 | _T_3449; // @[el2_lsu_bus_buffer.scala 649:160]
  wire  _T_3453 = bus_rsp_write_error & _T_3425; // @[el2_lsu_bus_buffer.scala 651:89]
  wire  _T_3454 = _T_3450 | _T_3453; // @[el2_lsu_bus_buffer.scala 650:120]
  wire  _T_3455 = _T_3380 & _T_3454; // @[el2_lsu_bus_buffer.scala 649:80]
  wire  _GEN_212 = _T_3400 & _T_3455; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3367 ? _T_3393 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_237 = _T_3363 ? 1'h0 : _GEN_225; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3340 ? 1'h0 : _GEN_237; // @[Conditional.scala 40:58]
  wire  _T_3403 = buf_write_1 & _T_3194; // @[el2_lsu_bus_buffer.scala 639:83]
  wire  _T_3404 = io_dec_tlu_force_halt | _T_3403; // @[el2_lsu_bus_buffer.scala 639:67]
  wire  _T_3406 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 640:62]
  wire  _T_3407 = buf_dual_1 & _T_3406; // @[el2_lsu_bus_buffer.scala 640:60]
  wire  _T_3409 = _T_3407 & _T_3432; // @[el2_lsu_bus_buffer.scala 640:78]
  wire [2:0] _GEN_181 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_182 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_181; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_183 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_182; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3410 = _GEN_183 != 3'h4; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3411 = _T_3409 & _T_3410; // @[el2_lsu_bus_buffer.scala 640:95]
  wire  _T_3412 = buf_ldfwd_1 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:64]
  wire  _T_3417 = _T_3409 & _GEN_187; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _T_3418 = _GEN_183 == 3'h4; // @[el2_lsu_bus_buffer.scala 641:193]
  wire  _T_3419 = _T_3417 & _T_3418; // @[el2_lsu_bus_buffer.scala 641:164]
  wire  _T_3420 = _T_3419 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:213]
  wire  _T_3421 = _T_3412 | _T_3420; // @[el2_lsu_bus_buffer.scala 641:86]
  wire  _T_3442 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 648:60]
  wire  _T_3443 = _T_3442 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 648:75]
  wire  _T_3456 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 652:63]
  wire  _T_3457 = buf_state_en_1 & _T_3456; // @[el2_lsu_bus_buffer.scala 652:61]
  wire  _T_3466 = buf_ldfwd_1 | _GEN_187; // @[el2_lsu_bus_buffer.scala 655:99]
  wire  _T_3467 = _T_3466 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 655:127]
  wire  _GEN_195 = _T_3485 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_198 = _T_3477 ? 1'h0 : _T_3485; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3477 ? 1'h0 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_204 = _T_3464 ? 1'h0 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3464 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3400 & _T_3443; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3400 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3400 ? 1'h0 : _GEN_206; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3367 ? _T_3386 : _GEN_216; // @[Conditional.scala 39:67]
  wire  _GEN_224 = _T_3367 ? _T_3390 : _GEN_211; // @[Conditional.scala 39:67]
  wire  _GEN_228 = _T_3367 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  _GEN_234 = _T_3363 ? 1'h0 : _GEN_222; // @[Conditional.scala 39:67]
  wire  _GEN_236 = _T_3363 ? 1'h0 : _GEN_224; // @[Conditional.scala 39:67]
  wire  _GEN_240 = _T_3363 ? 1'h0 : _GEN_228; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3340 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3340 ? buf_state_en_1 : _GEN_236; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3340 ? 1'h0 : _GEN_234; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3340 ? 1'h0 : _GEN_240; // @[Conditional.scala 40:58]
  reg  buf_unsign_1; // @[Reg.scala 27:20]
  wire  _T_3501 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 689:44]
  wire  _T_3502 = buf_error_en_1 | buf_rst_1; // @[el2_lsu_bus_buffer.scala 689:99]
  reg  buf_error_1; // @[Reg.scala 27:20]
  wire  _T_3591 = buf_state_en_2 & _T_3640; // @[el2_lsu_bus_buffer.scala 632:56]
  wire  _T_3592 = _T_3591 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 632:72]
  wire  _T_3594 = _T_3592 & _T_1194; // @[el2_lsu_bus_buffer.scala 632:86]
  wire  _T_3597 = _T_3588 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 634:80]
  wire  _T_3598 = _T_3597 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 634:94]
  wire  _T_3601 = _T_3597 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 635:94]
  wire  _T_3654 = bus_rsp_read_error & _T_3635; // @[el2_lsu_bus_buffer.scala 649:103]
  wire  _T_3655 = bus_rsp_read_error & buf_ldfwd_2; // @[el2_lsu_bus_buffer.scala 650:63]
  wire  _T_3657 = _T_3655 & _T_3636; // @[el2_lsu_bus_buffer.scala 650:78]
  wire  _T_3658 = _T_3654 | _T_3657; // @[el2_lsu_bus_buffer.scala 649:160]
  wire  _T_3661 = bus_rsp_write_error & _T_3633; // @[el2_lsu_bus_buffer.scala 651:89]
  wire  _T_3662 = _T_3658 | _T_3661; // @[el2_lsu_bus_buffer.scala 650:120]
  wire  _T_3663 = _T_3588 & _T_3662; // @[el2_lsu_bus_buffer.scala 649:80]
  wire  _GEN_302 = _T_3608 & _T_3663; // @[Conditional.scala 39:67]
  wire  _GEN_315 = _T_3575 ? _T_3601 : _GEN_302; // @[Conditional.scala 39:67]
  wire  _GEN_327 = _T_3571 ? 1'h0 : _GEN_315; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3548 ? 1'h0 : _GEN_327; // @[Conditional.scala 40:58]
  wire  _T_3611 = buf_write_2 & _T_3194; // @[el2_lsu_bus_buffer.scala 639:83]
  wire  _T_3612 = io_dec_tlu_force_halt | _T_3611; // @[el2_lsu_bus_buffer.scala 639:67]
  wire  _T_3614 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 640:62]
  wire  _T_3615 = buf_dual_2 & _T_3614; // @[el2_lsu_bus_buffer.scala 640:60]
  wire  _T_3617 = _T_3615 & _T_3640; // @[el2_lsu_bus_buffer.scala 640:78]
  wire [2:0] _GEN_271 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_272 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_271; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_273 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_272; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3618 = _GEN_273 != 3'h4; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3619 = _T_3617 & _T_3618; // @[el2_lsu_bus_buffer.scala 640:95]
  wire  _T_3620 = buf_ldfwd_2 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:64]
  wire  _T_3625 = _T_3617 & _GEN_277; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _T_3626 = _GEN_273 == 3'h4; // @[el2_lsu_bus_buffer.scala 641:193]
  wire  _T_3627 = _T_3625 & _T_3626; // @[el2_lsu_bus_buffer.scala 641:164]
  wire  _T_3628 = _T_3627 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:213]
  wire  _T_3629 = _T_3620 | _T_3628; // @[el2_lsu_bus_buffer.scala 641:86]
  wire  _T_3650 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 648:60]
  wire  _T_3651 = _T_3650 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 648:75]
  wire  _T_3664 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 652:63]
  wire  _T_3665 = buf_state_en_2 & _T_3664; // @[el2_lsu_bus_buffer.scala 652:61]
  wire  _T_3674 = buf_ldfwd_2 | _GEN_277; // @[el2_lsu_bus_buffer.scala 655:99]
  wire  _T_3675 = _T_3674 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 655:127]
  wire  _GEN_285 = _T_3693 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_288 = _T_3685 ? 1'h0 : _T_3693; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_3685 ? 1'h0 : _GEN_285; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_3672 ? 1'h0 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_3672 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_3608 & _T_3651; // @[Conditional.scala 39:67]
  wire  _GEN_304 = _T_3608 ? 1'h0 : _GEN_294; // @[Conditional.scala 39:67]
  wire  _GEN_306 = _T_3608 ? 1'h0 : _GEN_296; // @[Conditional.scala 39:67]
  wire  _GEN_312 = _T_3575 ? _T_3594 : _GEN_306; // @[Conditional.scala 39:67]
  wire  _GEN_314 = _T_3575 ? _T_3598 : _GEN_301; // @[Conditional.scala 39:67]
  wire  _GEN_318 = _T_3575 ? 1'h0 : _GEN_304; // @[Conditional.scala 39:67]
  wire  _GEN_324 = _T_3571 ? 1'h0 : _GEN_312; // @[Conditional.scala 39:67]
  wire  _GEN_326 = _T_3571 ? 1'h0 : _GEN_314; // @[Conditional.scala 39:67]
  wire  _GEN_330 = _T_3571 ? 1'h0 : _GEN_318; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3548 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3548 ? buf_state_en_2 : _GEN_326; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3548 ? 1'h0 : _GEN_324; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3548 ? 1'h0 : _GEN_330; // @[Conditional.scala 40:58]
  reg  buf_unsign_2; // @[Reg.scala 27:20]
  wire  _T_3709 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 689:44]
  wire  _T_3710 = buf_error_en_2 | buf_rst_2; // @[el2_lsu_bus_buffer.scala 689:99]
  reg  buf_error_2; // @[Reg.scala 27:20]
  wire  _T_3799 = buf_state_en_3 & _T_3848; // @[el2_lsu_bus_buffer.scala 632:56]
  wire  _T_3800 = _T_3799 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 632:72]
  wire  _T_3802 = _T_3800 & _T_1194; // @[el2_lsu_bus_buffer.scala 632:86]
  wire  _T_3805 = _T_3796 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 634:80]
  wire  _T_3806 = _T_3805 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 634:94]
  wire  _T_3809 = _T_3805 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 635:94]
  wire  _T_3862 = bus_rsp_read_error & _T_3843; // @[el2_lsu_bus_buffer.scala 649:103]
  wire  _T_3863 = bus_rsp_read_error & buf_ldfwd_3; // @[el2_lsu_bus_buffer.scala 650:63]
  wire  _T_3865 = _T_3863 & _T_3844; // @[el2_lsu_bus_buffer.scala 650:78]
  wire  _T_3866 = _T_3862 | _T_3865; // @[el2_lsu_bus_buffer.scala 649:160]
  wire  _T_3869 = bus_rsp_write_error & _T_3841; // @[el2_lsu_bus_buffer.scala 651:89]
  wire  _T_3870 = _T_3866 | _T_3869; // @[el2_lsu_bus_buffer.scala 650:120]
  wire  _T_3871 = _T_3796 & _T_3870; // @[el2_lsu_bus_buffer.scala 649:80]
  wire  _GEN_392 = _T_3816 & _T_3871; // @[Conditional.scala 39:67]
  wire  _GEN_405 = _T_3783 ? _T_3809 : _GEN_392; // @[Conditional.scala 39:67]
  wire  _GEN_417 = _T_3779 ? 1'h0 : _GEN_405; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_3756 ? 1'h0 : _GEN_417; // @[Conditional.scala 40:58]
  wire  _T_3819 = buf_write_3 & _T_3194; // @[el2_lsu_bus_buffer.scala 639:83]
  wire  _T_3820 = io_dec_tlu_force_halt | _T_3819; // @[el2_lsu_bus_buffer.scala 639:67]
  wire  _T_3822 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 640:62]
  wire  _T_3823 = buf_dual_3 & _T_3822; // @[el2_lsu_bus_buffer.scala 640:60]
  wire  _T_3825 = _T_3823 & _T_3848; // @[el2_lsu_bus_buffer.scala 640:78]
  wire [2:0] _GEN_361 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_362 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_361; // @[el2_lsu_bus_buffer.scala 640:123]
  wire [2:0] _GEN_363 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_362; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3826 = _GEN_363 != 3'h4; // @[el2_lsu_bus_buffer.scala 640:123]
  wire  _T_3827 = _T_3825 & _T_3826; // @[el2_lsu_bus_buffer.scala 640:95]
  wire  _T_3828 = buf_ldfwd_3 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:64]
  wire  _T_3833 = _T_3825 & _GEN_367; // @[el2_lsu_bus_buffer.scala 641:136]
  wire  _T_3834 = _GEN_363 == 3'h4; // @[el2_lsu_bus_buffer.scala 641:193]
  wire  _T_3835 = _T_3833 & _T_3834; // @[el2_lsu_bus_buffer.scala 641:164]
  wire  _T_3836 = _T_3835 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 641:213]
  wire  _T_3837 = _T_3828 | _T_3836; // @[el2_lsu_bus_buffer.scala 641:86]
  wire  _T_3858 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 648:60]
  wire  _T_3859 = _T_3858 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 648:75]
  wire  _T_3872 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 652:63]
  wire  _T_3873 = buf_state_en_3 & _T_3872; // @[el2_lsu_bus_buffer.scala 652:61]
  wire  _T_3882 = buf_ldfwd_3 | _GEN_367; // @[el2_lsu_bus_buffer.scala 655:99]
  wire  _T_3883 = _T_3882 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 655:127]
  wire  _GEN_375 = _T_3901 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_378 = _T_3893 ? 1'h0 : _T_3901; // @[Conditional.scala 39:67]
  wire  _GEN_380 = _T_3893 ? 1'h0 : _GEN_375; // @[Conditional.scala 39:67]
  wire  _GEN_384 = _T_3880 ? 1'h0 : _GEN_378; // @[Conditional.scala 39:67]
  wire  _GEN_386 = _T_3880 ? 1'h0 : _GEN_380; // @[Conditional.scala 39:67]
  wire  _GEN_391 = _T_3816 & _T_3859; // @[Conditional.scala 39:67]
  wire  _GEN_394 = _T_3816 ? 1'h0 : _GEN_384; // @[Conditional.scala 39:67]
  wire  _GEN_396 = _T_3816 ? 1'h0 : _GEN_386; // @[Conditional.scala 39:67]
  wire  _GEN_402 = _T_3783 ? _T_3802 : _GEN_396; // @[Conditional.scala 39:67]
  wire  _GEN_404 = _T_3783 ? _T_3806 : _GEN_391; // @[Conditional.scala 39:67]
  wire  _GEN_408 = _T_3783 ? 1'h0 : _GEN_394; // @[Conditional.scala 39:67]
  wire  _GEN_414 = _T_3779 ? 1'h0 : _GEN_402; // @[Conditional.scala 39:67]
  wire  _GEN_416 = _T_3779 ? 1'h0 : _GEN_404; // @[Conditional.scala 39:67]
  wire  _GEN_420 = _T_3779 ? 1'h0 : _GEN_408; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_3756 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_3756 ? buf_state_en_3 : _GEN_416; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_3756 ? 1'h0 : _GEN_414; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_3756 ? 1'h0 : _GEN_420; // @[Conditional.scala 40:58]
  reg  buf_unsign_3; // @[Reg.scala 27:20]
  wire  _T_3917 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 689:44]
  wire  _T_3918 = buf_error_en_3 | buf_rst_3; // @[el2_lsu_bus_buffer.scala 689:99]
  reg  buf_error_3; // @[Reg.scala 27:20]
  wire [1:0] _GEN_494 = {{1'd0}, io_lsu_busreq_m}; // @[el2_lsu_bus_buffer.scala 696:45]
  wire [1:0] _T_3925 = _GEN_494 << io_ldst_dual_m; // @[el2_lsu_bus_buffer.scala 696:45]
  wire [1:0] _GEN_495 = {{1'd0}, io_lsu_busreq_r}; // @[el2_lsu_bus_buffer.scala 696:83]
  wire [1:0] _T_3926 = _GEN_495 << io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 696:83]
  wire [1:0] _T_3928 = _T_3925 + _T_3926; // @[el2_lsu_bus_buffer.scala 696:64]
  wire [1:0] _GEN_496 = {{1'd0}, ibuf_valid}; // @[el2_lsu_bus_buffer.scala 696:102]
  wire [1:0] _T_3930 = _T_3928 + _GEN_496; // @[el2_lsu_bus_buffer.scala 696:102]
  wire  _T_3936 = _T_56 + _T_63; // @[el2_lsu_bus_buffer.scala 697:158]
  wire  _T_3938 = _T_3936 + _T_70; // @[el2_lsu_bus_buffer.scala 697:158]
  wire  _T_3940 = _T_3938 + _T_77; // @[el2_lsu_bus_buffer.scala 697:158]
  wire [1:0] _GEN_497 = {{1'd0}, _T_3940}; // @[el2_lsu_bus_buffer.scala 696:115]
  wire [1:0] _T_3942 = _T_3930 + _GEN_497; // @[el2_lsu_bus_buffer.scala 696:115]
  wire  _T_4017 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 704:60]
  wire [3:0] buf_numvld_any = {{2'd0}, _T_3942}; // @[el2_lsu_bus_buffer.scala 696:25]
  wire  _T_4019 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 704:106]
  wire  _T_4021 = buf_numvld_any == 4'h4; // @[el2_lsu_bus_buffer.scala 704:152]
  wire [2:0] _T_4023 = buf_state_0 | buf_state_1; // @[el2_lsu_bus_buffer.scala 705:97]
  wire [2:0] _T_4024 = _T_4023 | buf_state_2; // @[el2_lsu_bus_buffer.scala 705:97]
  wire [2:0] _T_4025 = _T_4024 | buf_state_3; // @[el2_lsu_bus_buffer.scala 705:97]
  wire [2:0] _T_4026 = ~_T_4025; // @[el2_lsu_bus_buffer.scala 705:40]
  wire [2:0] _GEN_498 = {{2'd0}, _T_903}; // @[el2_lsu_bus_buffer.scala 705:102]
  wire [2:0] _T_4028 = _T_4026 & _GEN_498; // @[el2_lsu_bus_buffer.scala 705:102]
  wire [2:0] _GEN_499 = {{2'd0}, _T_1146}; // @[el2_lsu_bus_buffer.scala 705:116]
  wire [2:0] _T_4030 = _T_4028 & _GEN_499; // @[el2_lsu_bus_buffer.scala 705:116]
  wire  _T_4031 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 707:56]
  wire  _T_4032 = _T_4031 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 707:77]
  wire  _T_4033 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 707:99]
  wire  _T_4034 = _T_4032 & _T_4033; // @[el2_lsu_bus_buffer.scala 707:97]
  wire  _T_4035 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 707:116]
  wire  _T_4038 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 709:68]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 752:44]
  wire  _T_4053 = _T_1602 & _T_3224; // @[Mux.scala 27:72]
  wire  _T_4054 = _T_1697 & _T_3432; // @[Mux.scala 27:72]
  wire  _T_4055 = _T_1792 & _T_3640; // @[Mux.scala 27:72]
  wire  _T_4056 = _T_1887 & _T_3848; // @[Mux.scala 27:72]
  wire  _T_4057 = _T_4053 | _T_4054; // @[Mux.scala 27:72]
  wire  _T_4058 = _T_4057 | _T_4055; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4058 | _T_4056; // @[Mux.scala 27:72]
  wire  _T_4073 = _T_4053 & buf_error_0; // @[Mux.scala 27:72]
  wire  _T_4074 = _T_4054 & buf_error_1; // @[Mux.scala 27:72]
  wire  _T_4075 = _T_4055 & buf_error_2; // @[Mux.scala 27:72]
  wire  _T_4076 = _T_4056 & buf_error_3; // @[Mux.scala 27:72]
  wire  _T_4077 = _T_4073 | _T_4074; // @[Mux.scala 27:72]
  wire  _T_4078 = _T_4077 | _T_4075; // @[Mux.scala 27:72]
  wire  _T_4082 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 714:98]
  wire  _T_4083 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 714:113]
  wire  _T_4084 = _T_4082 | _T_4083; // @[el2_lsu_bus_buffer.scala 714:111]
  wire  _T_4089 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 714:98]
  wire  _T_4090 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 714:113]
  wire  _T_4091 = _T_4089 | _T_4090; // @[el2_lsu_bus_buffer.scala 714:111]
  wire  _T_4092 = _T_1697 & _T_4091; // @[el2_lsu_bus_buffer.scala 714:95]
  wire  _T_4094 = _T_4092 & _T_3432; // @[el2_lsu_bus_buffer.scala 714:129]
  wire  _T_4096 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 714:98]
  wire  _T_4097 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 714:113]
  wire  _T_4098 = _T_4096 | _T_4097; // @[el2_lsu_bus_buffer.scala 714:111]
  wire  _T_4099 = _T_1792 & _T_4098; // @[el2_lsu_bus_buffer.scala 714:95]
  wire  _T_4101 = _T_4099 & _T_3640; // @[el2_lsu_bus_buffer.scala 714:129]
  wire  _T_4103 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 714:98]
  wire  _T_4104 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 714:113]
  wire  _T_4105 = _T_4103 | _T_4104; // @[el2_lsu_bus_buffer.scala 714:111]
  wire  _T_4106 = _T_1887 & _T_4105; // @[el2_lsu_bus_buffer.scala 714:95]
  wire  _T_4108 = _T_4106 & _T_3848; // @[el2_lsu_bus_buffer.scala 714:129]
  wire [1:0] _T_4111 = _T_4101 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4112 = _T_4108 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_500 = {{1'd0}, _T_4094}; // @[Mux.scala 27:72]
  wire [1:0] _T_4114 = _GEN_500 | _T_4111; // @[Mux.scala 27:72]
  wire  _T_4123 = _T_4053 & _T_4084; // @[el2_lsu_bus_buffer.scala 715:111]
  wire  _T_4130 = _T_4054 & _T_4091; // @[el2_lsu_bus_buffer.scala 715:111]
  wire  _T_4137 = _T_4055 & _T_4098; // @[el2_lsu_bus_buffer.scala 715:111]
  wire  _T_4144 = _T_4056 & _T_4105; // @[el2_lsu_bus_buffer.scala 715:111]
  wire [31:0] _T_4145 = _T_4123 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4146 = _T_4130 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4147 = _T_4137 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4148 = _T_4144 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4149 = _T_4145 | _T_4146; // @[Mux.scala 27:72]
  wire [31:0] _T_4150 = _T_4149 | _T_4147; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4150 | _T_4148; // @[Mux.scala 27:72]
  wire  _T_4157 = _T_4053 & _T_3223; // @[el2_lsu_bus_buffer.scala 716:111]
  wire  _T_4162 = _T_4054 & _T_3431; // @[el2_lsu_bus_buffer.scala 716:111]
  wire  _T_4167 = _T_4055 & _T_3639; // @[el2_lsu_bus_buffer.scala 716:111]
  wire  _T_4172 = _T_4056 & _T_3847; // @[el2_lsu_bus_buffer.scala 716:111]
  wire [31:0] _T_4173 = _T_4157 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4174 = _T_4162 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4175 = _T_4167 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4176 = _T_4172 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4177 = _T_4173 | _T_4174; // @[Mux.scala 27:72]
  wire [31:0] _T_4178 = _T_4177 | _T_4175; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4178 | _T_4176; // @[Mux.scala 27:72]
  wire [31:0] _GEN_451 = 2'h1 == io_lsu_nonblock_load_data_tag ? buf_addr_1 : buf_addr_0; // @[el2_lsu_bus_buffer.scala 718:79]
  wire [31:0] _GEN_452 = 2'h2 == io_lsu_nonblock_load_data_tag ? buf_addr_2 : _GEN_451; // @[el2_lsu_bus_buffer.scala 718:79]
  wire [31:0] _GEN_453 = 2'h3 == io_lsu_nonblock_load_data_tag ? buf_addr_3 : _GEN_452; // @[el2_lsu_bus_buffer.scala 718:79]
  wire [1:0] lsu_nonblock_addr_offset = _GEN_453[1:0]; // @[el2_lsu_bus_buffer.scala 718:79]
  wire [1:0] _GEN_455 = 2'h1 == io_lsu_nonblock_load_data_tag ? buf_sz_1 : buf_sz_0; // @[el2_lsu_bus_buffer.scala 719:77]
  wire [1:0] _GEN_456 = 2'h2 == io_lsu_nonblock_load_data_tag ? buf_sz_2 : _GEN_455; // @[el2_lsu_bus_buffer.scala 719:77]
  wire [1:0] lsu_nonblock_sz = 2'h3 == io_lsu_nonblock_load_data_tag ? buf_sz_3 : _GEN_456; // @[el2_lsu_bus_buffer.scala 719:77]
  wire  _GEN_459 = 2'h1 == io_lsu_nonblock_load_data_tag ? buf_unsign_1 : buf_unsign_0; // @[el2_lsu_bus_buffer.scala 720:37]
  wire  _GEN_460 = 2'h2 == io_lsu_nonblock_load_data_tag ? buf_unsign_2 : _GEN_459; // @[el2_lsu_bus_buffer.scala 720:37]
  wire  lsu_nonblock_unsign = 2'h3 == io_lsu_nonblock_load_data_tag ? buf_unsign_3 : _GEN_460; // @[el2_lsu_bus_buffer.scala 720:37]
  wire [63:0] _T_4185 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_501 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 722:115]
  wire [5:0] _T_4187 = 4'h8 * _GEN_501; // @[el2_lsu_bus_buffer.scala 722:115]
  wire [63:0] _T_4188 = _T_4185 >> _T_4187; // @[el2_lsu_bus_buffer.scala 722:111]
  wire [31:0] lsu_nonblock_data_unalgn = _T_4188[31:0]; // @[el2_lsu_bus_buffer.scala 722:146]
  wire  _T_4190 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 723:71]
  wire  _T_4192 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 725:83]
  wire  _T_4193 = lsu_nonblock_unsign & _T_4192; // @[el2_lsu_bus_buffer.scala 725:65]
  wire [31:0] _T_4196 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4197 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 726:83]
  wire  _T_4198 = lsu_nonblock_unsign & _T_4197; // @[el2_lsu_bus_buffer.scala 726:65]
  wire [31:0] _T_4201 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4202 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 727:44]
  wire  _T_4204 = _T_4202 & _T_4192; // @[el2_lsu_bus_buffer.scala 727:65]
  wire [23:0] _T_4207 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4209 = {_T_4207,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4212 = _T_4202 & _T_4197; // @[el2_lsu_bus_buffer.scala 728:65]
  wire [15:0] _T_4215 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4217 = {_T_4215,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4218 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 729:83]
  wire  _T_4219 = lsu_nonblock_unsign & _T_4218; // @[el2_lsu_bus_buffer.scala 729:65]
  wire [31:0] _T_4221 = _T_4193 ? _T_4196 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4222 = _T_4198 ? _T_4201 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4223 = _T_4204 ? _T_4209 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4224 = _T_4212 ? _T_4217 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4225 = _T_4219 ? lsu_nonblock_data_unalgn : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4226 = _T_4221 | _T_4222; // @[Mux.scala 27:72]
  wire [31:0] _T_4227 = _T_4226 | _T_4223; // @[Mux.scala 27:72]
  wire [31:0] _T_4228 = _T_4227 | _T_4224; // @[Mux.scala 27:72]
  wire  _T_4334 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 749:64]
  wire  _T_4335 = io_lsu_busreq_m & _T_4334; // @[el2_lsu_bus_buffer.scala 749:62]
  reg  _T_4338; // @[el2_lsu_bus_buffer.scala 749:44]
  wire  _T_4360 = _T_1697 & buf_error_1; // @[el2_lsu_bus_buffer.scala 775:99]
  wire  _T_4361 = _T_4360 & buf_write_1; // @[el2_lsu_bus_buffer.scala 775:114]
  wire  _T_4363 = _T_1792 & buf_error_2; // @[el2_lsu_bus_buffer.scala 775:99]
  wire  _T_4364 = _T_4363 & buf_write_2; // @[el2_lsu_bus_buffer.scala 775:114]
  wire  _T_4366 = _T_1887 & buf_error_3; // @[el2_lsu_bus_buffer.scala 775:99]
  wire  _T_4367 = _T_4366 & buf_write_3; // @[el2_lsu_bus_buffer.scala 775:114]
  wire [1:0] _T_4370 = _T_4364 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4371 = _T_4367 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_502 = {{1'd0}, _T_4361}; // @[Mux.scala 27:72]
  wire [1:0] _T_4373 = _GEN_502 | _T_4370; // @[Mux.scala 27:72]
  wire [1:0] lsu_imprecise_error_store_tag = _T_4373 | _T_4371; // @[Mux.scala 27:72]
  wire  _T_4376 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 776:74]
  wire  _T_4379 = io_lsu_bus_clk_en_q & _T_1602; // @[el2_lsu_bus_buffer.scala 777:91]
  wire  _T_4380 = _T_4379 & buf_error_0; // @[el2_lsu_bus_buffer.scala 777:119]
  wire  _T_4381 = _T_4380 & buf_write_0; // @[el2_lsu_bus_buffer.scala 777:134]
  wire  _T_4383 = io_lsu_bus_clk_en_q & _T_1697; // @[el2_lsu_bus_buffer.scala 777:91]
  wire  _T_4384 = _T_4383 & buf_error_1; // @[el2_lsu_bus_buffer.scala 777:119]
  wire  _T_4385 = _T_4384 & buf_write_1; // @[el2_lsu_bus_buffer.scala 777:134]
  wire  _T_4387 = io_lsu_bus_clk_en_q & _T_1792; // @[el2_lsu_bus_buffer.scala 777:91]
  wire  _T_4388 = _T_4387 & buf_error_2; // @[el2_lsu_bus_buffer.scala 777:119]
  wire  _T_4389 = _T_4388 & buf_write_2; // @[el2_lsu_bus_buffer.scala 777:134]
  wire  _T_4391 = io_lsu_bus_clk_en_q & _T_1887; // @[el2_lsu_bus_buffer.scala 777:91]
  wire  _T_4392 = _T_4391 & buf_error_3; // @[el2_lsu_bus_buffer.scala 777:119]
  wire  _T_4393 = _T_4392 & buf_write_3; // @[el2_lsu_bus_buffer.scala 777:134]
  wire  _T_4394 = _T_4381 | _T_4385; // @[el2_lsu_bus_buffer.scala 777:158]
  wire  _T_4395 = _T_4394 | _T_4389; // @[el2_lsu_bus_buffer.scala 777:158]
  wire [31:0] _GEN_468 = 2'h1 == lsu_imprecise_error_store_tag ? buf_addr_1 : buf_addr_0; // @[el2_lsu_bus_buffer.scala 778:43]
  wire [31:0] _GEN_469 = 2'h2 == lsu_imprecise_error_store_tag ? buf_addr_2 : _GEN_468; // @[el2_lsu_bus_buffer.scala 778:43]
  wire [31:0] _GEN_470 = 2'h3 == lsu_imprecise_error_store_tag ? buf_addr_3 : _GEN_469; // @[el2_lsu_bus_buffer.scala 778:43]
  wire  _T_4400 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 786:82]
  wire  _T_4403 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 787:56]
  wire  _T_4406 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 789:62]
  wire  _T_4407 = io_lsu_axi_awvalid & _T_4406; // @[el2_lsu_bus_buffer.scala 789:60]
  wire  _T_4408 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 789:105]
  wire  _T_4409 = io_lsu_axi_wvalid & _T_4408; // @[el2_lsu_bus_buffer.scala 789:103]
  wire  _T_4410 = _T_4407 | _T_4409; // @[el2_lsu_bus_buffer.scala 789:82]
  wire  _T_4411 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 789:149]
  wire  _T_4412 = io_lsu_axi_arvalid & _T_4411; // @[el2_lsu_bus_buffer.scala 789:147]
  wire  _T_4414 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 791:51]
  wire  _T_4415 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 791:66]
  wire  _T_4416 = _T_4414 & _T_4415; // @[el2_lsu_bus_buffer.scala 791:64]
  wire [31:0] _T_4420 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4423 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4427 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 803:66]
  wire  _T_4428 = _T_4414 & _T_4427; // @[el2_lsu_bus_buffer.scala 803:64]
  wire [7:0] _T_4432 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4435 = obuf_valid & _T_1170; // @[el2_lsu_bus_buffer.scala 808:51]
  wire  _T_4437 = _T_4435 & _T_1176; // @[el2_lsu_bus_buffer.scala 808:65]
  assign io_lsu_busreq_r = _T_4338; // @[el2_lsu_bus_buffer.scala 749:34]
  assign io_lsu_bus_buffer_pend_any = buf_numvld_pend_any != 4'h0; // @[el2_lsu_bus_buffer.scala 703:37]
  assign io_lsu_bus_buffer_full_any = _T_4017 ? _T_4019 : _T_4021; // @[el2_lsu_bus_buffer.scala 704:37]
  assign io_lsu_bus_buffer_empty_any = _T_4030[0]; // @[el2_lsu_bus_buffer.scala 705:37]
  assign io_ld_byte_hit_buf_lo = {_T_127,_T_116}; // @[el2_lsu_bus_buffer.scala 412:28]
  assign io_ld_byte_hit_buf_hi = {_T_127,_T_116}; // @[el2_lsu_bus_buffer.scala 413:28]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4376; // @[el2_lsu_bus_buffer.scala 776:37]
  assign io_lsu_imprecise_error_store_any = _T_4395 | _T_4393; // @[el2_lsu_bus_buffer.scala 777:37]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _GEN_470 : _GEN_453; // @[el2_lsu_bus_buffer.scala 778:37]
  assign io_lsu_nonblock_load_valid_m = _T_4034 & _T_4035; // @[el2_lsu_bus_buffer.scala 707:37]
  assign io_lsu_nonblock_load_tag_m = _T_1428 ? 2'h0 : _T_1468; // @[el2_lsu_bus_buffer.scala 708:37]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4038; // @[el2_lsu_bus_buffer.scala 709:37]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 710:37]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4190; // @[el2_lsu_bus_buffer.scala 723:37]
  assign io_lsu_nonblock_load_data_error = _T_4078 | _T_4076; // @[el2_lsu_bus_buffer.scala 713:37]
  assign io_lsu_nonblock_load_data_tag = _T_4114 | _T_4112; // @[el2_lsu_bus_buffer.scala 714:37]
  assign io_lsu_nonblock_load_data = _T_4228 | _T_4225; // @[el2_lsu_bus_buffer.scala 724:37]
  assign io_lsu_pmu_bus_trxn = _T_4400 | _T_4319; // @[el2_lsu_bus_buffer.scala 786:37]
  assign io_lsu_pmu_bus_misaligned = _T_4403 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 787:37]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 788:37]
  assign io_lsu_pmu_bus_busy = _T_4410 | _T_4412; // @[el2_lsu_bus_buffer.scala 789:37]
  assign io_lsu_axi_awvalid = _T_4416 & _T_1154; // @[el2_lsu_bus_buffer.scala 791:37]
  assign io_lsu_axi_awid = obuf_tag0; // @[el2_lsu_bus_buffer.scala 792:37]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4420; // @[el2_lsu_bus_buffer.scala 793:37]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 794:37]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4423 : 3'h3; // @[el2_lsu_bus_buffer.scala 796:37]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 799:37]
  assign io_lsu_axi_wvalid = _T_4428 & _T_1154; // @[el2_lsu_bus_buffer.scala 803:37]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 804:37]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4432; // @[el2_lsu_bus_buffer.scala 805:37]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 820:37]
  assign io_lsu_axi_arvalid = _T_4437 & _T_1154; // @[el2_lsu_bus_buffer.scala 808:37]
  assign io_lsu_axi_arid = obuf_tag0; // @[el2_lsu_bus_buffer.scala 809:37]
  assign io_lsu_axi_araddr = io_lsu_axi_awaddr; // @[el2_lsu_bus_buffer.scala 810:37]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 811:37]
  assign io_lsu_axi_arsize = io_lsu_axi_awsize; // @[el2_lsu_bus_buffer.scala 813:37]
  assign io_lsu_axi_arcache = io_lsu_axi_awcache; // @[el2_lsu_bus_buffer.scala 816:37]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 821:37]
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
  ibuf_addr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ibuf_write = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ibuf_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ibuf_byteen = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  buf_addr_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  buf_write_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  buf_state_0 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  buf_addr_1 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  buf_write_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  buf_state_1 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  buf_addr_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  buf_write_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  buf_state_2 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  buf_addr_3 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  buf_write_3 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  buf_state_3 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  buf_byteen_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  buf_byteen_2 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  buf_byteen_1 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  buf_byteen_0 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  buf_ageQ_3_3 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  obuf_tag0 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  obuf_merge = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  obuf_tag1 = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  obuf_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  obuf_wr_enQ = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  buf_ageQ_3_2 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  buf_ageQ_3_1 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  buf_ageQ_3_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  buf_ageQ_2_3 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  buf_ageQ_2_2 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  buf_ageQ_2_1 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  buf_ageQ_2_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  buf_ageQ_1_3 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  buf_ageQ_1_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  buf_ageQ_1_1 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  buf_ageQ_1_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  buf_ageQ_0_3 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  buf_ageQ_0_2 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  buf_ageQ_0_1 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  buf_ageQ_0_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  ibuf_data = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  buf_data_0 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  buf_data_1 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  buf_data_2 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  buf_data_3 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  ibuf_timer = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  ibuf_sideeffect = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  ibuf_tag = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  WrPtr1_r = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  WrPtr0_r = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  ibuf_dual = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  ibuf_samedw = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  ibuf_nomerge = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  ibuf_unsign = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  ibuf_sz = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  ibuf_dualtag = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  obuf_wr_timer = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  buf_nomerge_0 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  buf_nomerge_1 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  buf_nomerge_2 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  buf_nomerge_3 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  buf_sideeffect_0 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  buf_sideeffect_1 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  buf_sideeffect_2 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  buf_sideeffect_3 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  obuf_sideeffect = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  buf_dual_0 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  buf_dual_1 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  buf_dual_2 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  buf_dual_3 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  buf_samedw_0 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  buf_samedw_1 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  buf_samedw_2 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  buf_samedw_3 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  obuf_write = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  obuf_cmd_done = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  obuf_data_done = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  obuf_nosend = _RAND_78[0:0];
  _RAND_79 = {2{`RANDOM}};
  _T_1397 = _RAND_79[63:0];
  _RAND_80 = {1{`RANDOM}};
  buf_sz_3 = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  buf_sz_2 = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  buf_sz_1 = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  buf_sz_0 = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  obuf_rdrsp_tag = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  obuf_rdrsp_pend = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  buf_dualhi_3 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  buf_dualhi_2 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  buf_dualhi_1 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  buf_dualhi_0 = _RAND_89[0:0];
  _RAND_90 = {2{`RANDOM}};
  obuf_data = _RAND_90[63:0];
  _RAND_91 = {1{`RANDOM}};
  obuf_sz = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  obuf_byteen = _RAND_92[7:0];
  _RAND_93 = {1{`RANDOM}};
  buf_rspageQ_0_1 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  buf_rspageQ_0_0 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  buf_rspageQ_0_3 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  buf_rspageQ_0_2 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  buf_ldfwd_0 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  buf_ldfwdtag_0 = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  buf_dualtag_0 = _RAND_99[1:0];
  _RAND_100 = {1{`RANDOM}};
  buf_ldfwd_3 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  buf_ldfwd_2 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  buf_ldfwd_1 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  buf_ldfwdtag_3 = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  buf_ldfwdtag_2 = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  buf_ldfwdtag_1 = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  buf_rspageQ_3_3 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  buf_rspageQ_3_2 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  buf_rspageQ_3_1 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  buf_rspageQ_3_0 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  buf_rspageQ_2_3 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  buf_rspageQ_2_2 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  buf_rspageQ_2_1 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  buf_rspageQ_2_0 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  buf_rspageQ_1_3 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  buf_rspageQ_1_2 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  buf_rspageQ_1_1 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  buf_rspageQ_1_0 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  buf_dualtag_1 = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  buf_dualtag_2 = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  buf_dualtag_3 = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  buf_unsign_0 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  buf_error_0 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  buf_unsign_1 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  buf_error_1 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  buf_unsign_2 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  buf_error_2 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  buf_unsign_3 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  buf_error_3 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  _T_4338 = _RAND_130[0:0];
`endif // RANDOMIZE_REG_INIT
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
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    buf_write_0 = 1'h0;
  end
  if (reset) begin
    buf_state_0 = 3'h0;
  end
  if (reset) begin
    buf_addr_1 = 32'h0;
  end
  if (reset) begin
    buf_write_1 = 1'h0;
  end
  if (reset) begin
    buf_state_1 = 3'h0;
  end
  if (reset) begin
    buf_addr_2 = 32'h0;
  end
  if (reset) begin
    buf_write_2 = 1'h0;
  end
  if (reset) begin
    buf_state_2 = 3'h0;
  end
  if (reset) begin
    buf_addr_3 = 32'h0;
  end
  if (reset) begin
    buf_write_3 = 1'h0;
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
    buf_ageQ_3_3 = 1'h0;
  end
  if (reset) begin
    obuf_tag0 = 3'h0;
  end
  if (reset) begin
    obuf_merge = 1'h0;
  end
  if (reset) begin
    obuf_tag1 = 3'h0;
  end
  if (reset) begin
    obuf_valid = 1'h0;
  end
  if (reset) begin
    obuf_wr_enQ = 1'h0;
  end
  if (reset) begin
    buf_ageQ_3_2 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_3_1 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_3_0 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_2_3 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_2_2 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_2_1 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_2_0 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_1_3 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_1_2 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_1_1 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_1_0 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_0_3 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_0_2 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_0_1 = 1'h0;
  end
  if (reset) begin
    buf_ageQ_0_0 = 1'h0;
  end
  if (reset) begin
    ibuf_data = 32'h0;
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
    ibuf_timer = 3'h0;
  end
  if (reset) begin
    ibuf_sideeffect = 1'h0;
  end
  if (reset) begin
    ibuf_tag = 2'h0;
  end
  if (reset) begin
    WrPtr1_r = 2'h0;
  end
  if (reset) begin
    WrPtr0_r = 2'h0;
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
    ibuf_dualtag = 2'h0;
  end
  if (reset) begin
    obuf_wr_timer = 3'h0;
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
    buf_sideeffect_0 = 1'h0;
  end
  if (reset) begin
    buf_sideeffect_1 = 1'h0;
  end
  if (reset) begin
    buf_sideeffect_2 = 1'h0;
  end
  if (reset) begin
    buf_sideeffect_3 = 1'h0;
  end
  if (reset) begin
    obuf_sideeffect = 1'h0;
  end
  if (reset) begin
    buf_dual_0 = 1'h0;
  end
  if (reset) begin
    buf_dual_1 = 1'h0;
  end
  if (reset) begin
    buf_dual_2 = 1'h0;
  end
  if (reset) begin
    buf_dual_3 = 1'h0;
  end
  if (reset) begin
    buf_samedw_0 = 1'h0;
  end
  if (reset) begin
    buf_samedw_1 = 1'h0;
  end
  if (reset) begin
    buf_samedw_2 = 1'h0;
  end
  if (reset) begin
    buf_samedw_3 = 1'h0;
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
    _T_1397 = 64'h0;
  end
  if (reset) begin
    buf_sz_3 = 2'h0;
  end
  if (reset) begin
    buf_sz_2 = 2'h0;
  end
  if (reset) begin
    buf_sz_1 = 2'h0;
  end
  if (reset) begin
    buf_sz_0 = 2'h0;
  end
  if (reset) begin
    obuf_rdrsp_tag = 3'h0;
  end
  if (reset) begin
    obuf_rdrsp_pend = 1'h0;
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
    obuf_data = 64'h0;
  end
  if (reset) begin
    obuf_sz = 2'h0;
  end
  if (reset) begin
    obuf_byteen = 8'h0;
  end
  if (reset) begin
    buf_rspageQ_0_1 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_0_0 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_0_3 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_0_2 = 1'h0;
  end
  if (reset) begin
    buf_ldfwd_0 = 1'h0;
  end
  if (reset) begin
    buf_ldfwdtag_0 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_0 = 2'h0;
  end
  if (reset) begin
    buf_ldfwd_3 = 1'h0;
  end
  if (reset) begin
    buf_ldfwd_2 = 1'h0;
  end
  if (reset) begin
    buf_ldfwd_1 = 1'h0;
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
    buf_rspageQ_3_3 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_3_2 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_3_1 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_3_0 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_2_3 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_2_2 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_2_1 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_2_0 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_1_3 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_1_2 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_1_1 = 1'h0;
  end
  if (reset) begin
    buf_rspageQ_1_0 = 1'h0;
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
    buf_unsign_0 = 1'h0;
  end
  if (reset) begin
    buf_error_0 = 1'h0;
  end
  if (reset) begin
    buf_unsign_1 = 1'h0;
  end
  if (reset) begin
    buf_error_1 = 1'h0;
  end
  if (reset) begin
    buf_unsign_2 = 1'h0;
  end
  if (reset) begin
    buf_error_2 = 1'h0;
  end
  if (reset) begin
    buf_unsign_3 = 1'h0;
  end
  if (reset) begin
    buf_error_3 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4338 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_addr <= 32'h0;
    end else if (ibuf_wr_en) begin
      if (io_ldst_dual_r) begin
        ibuf_addr <= io_end_addr_r;
      end else begin
        ibuf_addr <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_write <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_write <= io_lsu_pkt_r_store;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ibuf_valid <= 1'h0;
    end else begin
      ibuf_valid <= _T_1074 & _T_1075;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_925) begin
        ibuf_byteen <= _T_945;
      end else if (io_ldst_dual_r) begin
        ibuf_byteen <= ldst_byteen_hi_r;
      end else begin
        ibuf_byteen <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_addr_0 <= 32'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_addr_0 <= ibuf_addr;
      end else if (_T_3143) begin
        buf_addr_0 <= io_end_addr_r;
      end else begin
        buf_addr_0 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_write_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_write_0 <= ibuf_write;
      end else begin
        buf_write_0 <= io_lsu_pkt_r_store;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3132) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3155) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3159) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3163) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3192) begin
        if (_T_3196) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3203) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3213) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3256) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3259) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3269) begin
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
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_addr_1 <= 32'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_addr_1 <= ibuf_addr;
      end else if (_T_3351) begin
        buf_addr_1 <= io_end_addr_r;
      end else begin
        buf_addr_1 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_write_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_write_1 <= ibuf_write;
      end else begin
        buf_write_1 <= io_lsu_pkt_r_store;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3340) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3363) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3367) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3163) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3400) begin
        if (_T_3404) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3411) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3421) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3464) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3467) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3477) begin
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
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_addr_2 <= 32'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_addr_2 <= ibuf_addr;
      end else if (_T_3559) begin
        buf_addr_2 <= io_end_addr_r;
      end else begin
        buf_addr_2 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_write_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_write_2 <= ibuf_write;
      end else begin
        buf_write_2 <= io_lsu_pkt_r_store;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3548) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3571) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3575) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3163) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3608) begin
        if (_T_3612) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3619) begin
          buf_state_2 <= 3'h4;
        end else if (_T_3629) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3672) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3675) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3685) begin
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
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_addr_3 <= 32'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_addr_3 <= ibuf_addr;
      end else if (_T_3767) begin
        buf_addr_3 <= io_end_addr_r;
      end else begin
        buf_addr_3 <= io_lsu_addr_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_write_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_write_3 <= ibuf_write;
      end else begin
        buf_write_3 <= io_lsu_pkt_r_store;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_3756) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_3779) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_3783) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3163) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_3816) begin
        if (_T_3820) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3827) begin
          buf_state_3 <= 3'h4;
        end else if (_T_3837) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_3880) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3883) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_3893) begin
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_byteen_3 <= 4'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_byteen_3 <= ibuf_byteen_out;
      end else if (_T_3767) begin
        buf_byteen_3 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_3 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_byteen_2 <= 4'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_byteen_2 <= ibuf_byteen_out;
      end else if (_T_3559) begin
        buf_byteen_2 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_2 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_byteen_1 <= 4'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_byteen_1 <= ibuf_byteen_out;
      end else if (_T_3351) begin
        buf_byteen_1 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_1 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_byteen_0 <= 4'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_byteen_0 <= ibuf_byteen_out;
      end else if (_T_3143) begin
        buf_byteen_0 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_0 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3_3 <= 1'h0;
    end else begin
      buf_ageQ_3_3 <= _T_3013 | buf_age_3_3;
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_tag0 <= 3'h0;
    end else if (obuf_wr_en) begin
      obuf_tag0 <= obuf_tag0_in;
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
      obuf_tag1 <= 3'h0;
    end else if (obuf_wr_en) begin
      obuf_tag1 <= obuf_tag1_in;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1406 & _T_1407;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1155 & io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3_2 <= 1'h0;
    end else begin
      buf_ageQ_3_2 <= _T_2918 | buf_age_3_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3_1 <= 1'h0;
    end else begin
      buf_ageQ_3_1 <= _T_2823 | buf_age_3_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3_0 <= 1'h0;
    end else begin
      buf_ageQ_3_0 <= _T_2728 | buf_age_3_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_2_3 <= 1'h0;
    end else begin
      buf_ageQ_2_3 <= _T_2633 | buf_age_2_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_2_2 <= 1'h0;
    end else begin
      buf_ageQ_2_2 <= _T_2538 | buf_age_2_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_2_1 <= 1'h0;
    end else begin
      buf_ageQ_2_1 <= _T_2443 | buf_age_2_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_2_0 <= 1'h0;
    end else begin
      buf_ageQ_2_0 <= _T_2348 | buf_age_2_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1_3 <= 1'h0;
    end else begin
      buf_ageQ_1_3 <= _T_2253 | buf_age_1_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1_2 <= 1'h0;
    end else begin
      buf_ageQ_1_2 <= _T_2158 | buf_age_1_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1_1 <= 1'h0;
    end else begin
      buf_ageQ_1_1 <= _T_2063 | buf_age_1_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1_0 <= 1'h0;
    end else begin
      buf_ageQ_1_0 <= _T_1968 | buf_age_1_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0_3 <= 1'h0;
    end else begin
      buf_ageQ_0_3 <= _T_1873 | buf_age_0_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0_2 <= 1'h0;
    end else begin
      buf_ageQ_0_2 <= _T_1778 | buf_age_0_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0_1 <= 1'h0;
    end else begin
      buf_ageQ_0_1 <= _T_1683 | buf_age_0_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0_0 <= 1'h0;
    end else begin
      buf_ageQ_0_0 <= _T_1588 | buf_age_0_0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_data <= 32'h0;
    end else if (ibuf_wr_en) begin
      ibuf_data <= ibuf_data_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (buf_data_en_0) begin
      if (_T_3132) begin
        if (_T_3147) begin
          buf_data_0 <= ibuf_data_out;
        end else begin
          buf_data_0 <= store_data_lo_r;
        end
      end else if (_T_3155) begin
        buf_data_0 <= 32'h0;
      end else if (_T_3159) begin
        if (buf_error_en_0) begin
          buf_data_0 <= io_lsu_axi_rdata[31:0];
        end else if (buf_addr_0[2]) begin
          buf_data_0 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_0 <= io_lsu_axi_rdata[31:0];
        end
      end else if (_T_3192) begin
        if (_T_3249) begin
          if (buf_addr_0[2]) begin
            buf_data_0 <= io_lsu_axi_rdata[63:32];
          end else begin
            buf_data_0 <= io_lsu_axi_rdata[31:0];
          end
        end else begin
          buf_data_0 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_0 <= 32'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data_1 <= 32'h0;
    end else if (buf_data_en_1) begin
      if (_T_3340) begin
        if (_T_3355) begin
          buf_data_1 <= ibuf_data_out;
        end else begin
          buf_data_1 <= store_data_lo_r;
        end
      end else if (_T_3363) begin
        buf_data_1 <= 32'h0;
      end else if (_T_3367) begin
        if (buf_error_en_1) begin
          buf_data_1 <= io_lsu_axi_rdata[31:0];
        end else if (buf_addr_1[2]) begin
          buf_data_1 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_1 <= io_lsu_axi_rdata[31:0];
        end
      end else if (_T_3400) begin
        if (_T_3457) begin
          if (buf_addr_1[2]) begin
            buf_data_1 <= io_lsu_axi_rdata[63:32];
          end else begin
            buf_data_1 <= io_lsu_axi_rdata[31:0];
          end
        end else begin
          buf_data_1 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_1 <= 32'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data_2 <= 32'h0;
    end else if (buf_data_en_2) begin
      if (_T_3548) begin
        if (_T_3563) begin
          buf_data_2 <= ibuf_data_out;
        end else begin
          buf_data_2 <= store_data_lo_r;
        end
      end else if (_T_3571) begin
        buf_data_2 <= 32'h0;
      end else if (_T_3575) begin
        if (buf_error_en_2) begin
          buf_data_2 <= io_lsu_axi_rdata[31:0];
        end else if (buf_addr_2[2]) begin
          buf_data_2 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_2 <= io_lsu_axi_rdata[31:0];
        end
      end else if (_T_3608) begin
        if (_T_3665) begin
          if (buf_addr_2[2]) begin
            buf_data_2 <= io_lsu_axi_rdata[63:32];
          end else begin
            buf_data_2 <= io_lsu_axi_rdata[31:0];
          end
        end else begin
          buf_data_2 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_2 <= 32'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      buf_data_3 <= 32'h0;
    end else if (buf_data_en_3) begin
      if (_T_3756) begin
        if (_T_3771) begin
          buf_data_3 <= ibuf_data_out;
        end else begin
          buf_data_3 <= store_data_lo_r;
        end
      end else if (_T_3779) begin
        buf_data_3 <= 32'h0;
      end else if (_T_3783) begin
        if (buf_error_en_3) begin
          buf_data_3 <= io_lsu_axi_rdata[31:0];
        end else if (buf_addr_3[2]) begin
          buf_data_3 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_3 <= io_lsu_axi_rdata[31:0];
        end
      end else if (_T_3816) begin
        if (_T_3873) begin
          if (buf_addr_3[2]) begin
            buf_data_3 <= io_lsu_axi_rdata[63:32];
          end else begin
            buf_data_3 <= io_lsu_axi_rdata[31:0];
          end
        end else begin
          buf_data_3 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_3 <= 32'h0;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ibuf_timer <= 3'h0;
    end else if (ibuf_wr_en) begin
      ibuf_timer <= 3'h0;
    end else if (_T_989) begin
      ibuf_timer <= _T_991;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (ibuf_wr_en) begin
      if (!(_T_925)) begin
        if (io_ldst_dual_r) begin
          ibuf_tag <= WrPtr1_r;
        end else begin
          ibuf_tag <= WrPtr0_r;
        end
      end
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1483) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1498) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1513) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1528) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1428) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1440) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1452) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1464) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
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
      ibuf_unsign <= io_lsu_pkt_r_unsign;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sz <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sz <= ibuf_sz_in;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_timer <= 3'h0;
    end else if (obuf_wr_en) begin
      obuf_wr_timer <= 3'h0;
    end else if (_T_1348) begin
      obuf_wr_timer <= _T_1350;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_nomerge_0 <= _T_3115;
      end else begin
        buf_nomerge_0 <= io_no_dword_merge_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_nomerge_1 <= _T_3115;
      end else begin
        buf_nomerge_1 <= io_no_dword_merge_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_nomerge_2 <= _T_3115;
      end else begin
        buf_nomerge_2 <= io_no_dword_merge_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_nomerge_3 <= _T_3115;
      end else begin
        buf_nomerge_3 <= io_no_dword_merge_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sideeffect_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_sideeffect_0 <= ibuf_sideeffect;
      end else begin
        buf_sideeffect_0 <= io_is_sideeffects_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sideeffect_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_sideeffect_1 <= ibuf_sideeffect;
      end else begin
        buf_sideeffect_1 <= io_is_sideeffects_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sideeffect_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_sideeffect_2 <= ibuf_sideeffect;
      end else begin
        buf_sideeffect_2 <= io_is_sideeffects_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sideeffect_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_sideeffect_3 <= ibuf_sideeffect;
      end else begin
        buf_sideeffect_3 <= io_is_sideeffects_r;
      end
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_sideeffect <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sideeffect <= io_is_sideeffects_r;
      end else if (2'h3 == CmdPtr0) begin
        obuf_sideeffect <= buf_sideeffect_3;
      end else if (2'h2 == CmdPtr0) begin
        obuf_sideeffect <= buf_sideeffect_2;
      end else if (2'h1 == CmdPtr0) begin
        obuf_sideeffect <= buf_sideeffect_1;
      end else begin
        obuf_sideeffect <= buf_sideeffect_0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_dual_0 <= ibuf_dual;
      end else begin
        buf_dual_0 <= io_ldst_dual_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_dual_1 <= ibuf_dual;
      end else begin
        buf_dual_1 <= io_ldst_dual_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_dual_2 <= ibuf_dual;
      end else begin
        buf_dual_2 <= io_ldst_dual_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_dual_3 <= ibuf_dual;
      end else begin
        buf_dual_3 <= io_ldst_dual_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_samedw_0 <= ibuf_samedw;
      end else begin
        buf_samedw_0 <= ldst_samedw_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_samedw_1 <= ibuf_samedw;
      end else begin
        buf_samedw_1 <= ldst_samedw_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_samedw_2 <= ibuf_samedw;
      end else begin
        buf_samedw_2 <= ldst_samedw_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_samedw_3 <= ibuf_samedw;
      end else begin
        buf_samedw_3 <= ldst_samedw_r;
      end
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_write <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_write <= io_lsu_pkt_r_store;
      end else if (2'h3 == CmdPtr0) begin
        obuf_write <= buf_write_3;
      end else if (2'h2 == CmdPtr0) begin
        obuf_write <= buf_write_2;
      end else if (2'h1 == CmdPtr0) begin
        obuf_write <= buf_write_1;
      end else begin
        obuf_write <= buf_write_0;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1302 & _T_4316;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1302 & _T_4317;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_nosend <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_nosend <= obuf_nosend_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_1397 <= 64'h0;
    end else if (obuf_wr_en) begin
      _T_1397 <= obuf_addr_in;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_sz_3 <= ibuf_sz;
      end else begin
        buf_sz_3 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_sz_2 <= ibuf_sz;
      end else begin
        buf_sz_2 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_sz_1 <= ibuf_sz;
      end else begin
        buf_sz_1 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_sz_0 <= ibuf_sz;
      end else begin
        buf_sz_0 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1193) begin
      obuf_rdrsp_tag <= obuf_tag0;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1191 | _T_1195;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_dualhi_3 <= ibuf_dual;
      end else begin
        buf_dualhi_3 <= _T_3767;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_dualhi_2 <= ibuf_dual;
      end else begin
        buf_dualhi_2 <= _T_3559;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_dualhi_1 <= ibuf_dual;
      end else begin
        buf_dualhi_1 <= _T_3351;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_dualhi_0 <= ibuf_dual;
      end else begin
        buf_dualhi_0 <= _T_3143;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      obuf_data <= 64'h0;
    end else if (obuf_wr_en) begin
      obuf_data <= obuf_data_in;
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_sz <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sz <= ibuf_sz_in;
      end else if (2'h3 == CmdPtr0) begin
        obuf_sz <= buf_sz_3;
      end else if (2'h2 == CmdPtr0) begin
        obuf_sz <= buf_sz_2;
      end else if (2'h1 == CmdPtr0) begin
        obuf_sz <= buf_sz_1;
      end else begin
        obuf_sz <= buf_sz_0;
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
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0_1 <= 1'h0;
    end else begin
      buf_rspageQ_0_1 <= buf_rspage_set_0_1 | buf_rspage_0_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0_0 <= 1'h0;
    end else begin
      buf_rspageQ_0_0 <= buf_rspage_set_0_0 | buf_rspage_0_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0_3 <= 1'h0;
    end else begin
      buf_rspageQ_0_3 <= buf_rspage_set_0_3 | buf_rspage_0_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0_2 <= 1'h0;
    end else begin
      buf_rspageQ_0_2 <= buf_rspage_set_0_2 | buf_rspage_0_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwd_0 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3132) begin
        buf_ldfwd_0 <= 1'h0;
      end else if (_T_3155) begin
        buf_ldfwd_0 <= 1'h0;
      end else begin
        buf_ldfwd_0 <= _T_3159;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3132) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3155) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3159) begin
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
      if (_T_3147) begin
        buf_dualtag_0 <= ibuf_dualtag;
      end else if (_T_3143) begin
        buf_dualtag_0 <= WrPtr0_r;
      end else begin
        buf_dualtag_0 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwd_3 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_3756) begin
        buf_ldfwd_3 <= 1'h0;
      end else if (_T_3779) begin
        buf_ldfwd_3 <= 1'h0;
      end else begin
        buf_ldfwd_3 <= _T_3783;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwd_2 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3548) begin
        buf_ldfwd_2 <= 1'h0;
      end else if (_T_3571) begin
        buf_ldfwd_2 <= 1'h0;
      end else begin
        buf_ldfwd_2 <= _T_3575;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwd_1 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3340) begin
        buf_ldfwd_1 <= 1'h0;
      end else if (_T_3363) begin
        buf_ldfwd_1 <= 1'h0;
      end else begin
        buf_ldfwd_1 <= _T_3367;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_3 <= 2'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_3756) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_3779) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_3783) begin
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
      if (_T_3548) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3571) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3575) begin
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
      if (_T_3340) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3363) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3367) begin
        buf_ldfwdtag_1 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_1 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3_3 <= 1'h0;
    end else begin
      buf_rspageQ_3_3 <= buf_rspage_set_3_3 | buf_rspage_3_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3_2 <= 1'h0;
    end else begin
      buf_rspageQ_3_2 <= buf_rspage_set_3_2 | buf_rspage_3_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3_1 <= 1'h0;
    end else begin
      buf_rspageQ_3_1 <= buf_rspage_set_3_1 | buf_rspage_3_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3_0 <= 1'h0;
    end else begin
      buf_rspageQ_3_0 <= buf_rspage_set_3_0 | buf_rspage_3_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2_3 <= 1'h0;
    end else begin
      buf_rspageQ_2_3 <= buf_rspage_set_2_3 | buf_rspage_2_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2_2 <= 1'h0;
    end else begin
      buf_rspageQ_2_2 <= buf_rspage_set_2_2 | buf_rspage_2_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2_1 <= 1'h0;
    end else begin
      buf_rspageQ_2_1 <= buf_rspage_set_2_1 | buf_rspage_2_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2_0 <= 1'h0;
    end else begin
      buf_rspageQ_2_0 <= buf_rspage_set_2_0 | buf_rspage_2_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1_3 <= 1'h0;
    end else begin
      buf_rspageQ_1_3 <= buf_rspage_set_1_3 | buf_rspage_1_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1_2 <= 1'h0;
    end else begin
      buf_rspageQ_1_2 <= buf_rspage_set_1_2 | buf_rspage_1_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1_1 <= 1'h0;
    end else begin
      buf_rspageQ_1_1 <= buf_rspage_set_1_1 | buf_rspage_1_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1_0 <= 1'h0;
    end else begin
      buf_rspageQ_1_0 <= buf_rspage_set_1_0 | buf_rspage_1_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_dualtag_1 <= ibuf_dualtag;
      end else if (_T_3351) begin
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
      if (_T_3563) begin
        buf_dualtag_2 <= ibuf_dualtag;
      end else if (_T_3559) begin
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
      if (_T_3771) begin
        buf_dualtag_3 <= ibuf_dualtag;
      end else if (_T_3767) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_unsign_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      if (_T_3147) begin
        buf_unsign_0 <= ibuf_unsign;
      end else begin
        buf_unsign_0 <= io_lsu_pkt_r_unsign;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_error_0 <= 1'h0;
    end else if (_T_3294) begin
      buf_error_0 <= _T_3293;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_unsign_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      if (_T_3355) begin
        buf_unsign_1 <= ibuf_unsign;
      end else begin
        buf_unsign_1 <= io_lsu_pkt_r_unsign;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_error_1 <= 1'h0;
    end else if (_T_3502) begin
      buf_error_1 <= _T_3501;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_unsign_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      if (_T_3563) begin
        buf_unsign_2 <= ibuf_unsign;
      end else begin
        buf_unsign_2 <= io_lsu_pkt_r_unsign;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_error_2 <= 1'h0;
    end else if (_T_3710) begin
      buf_error_2 <= _T_3709;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_unsign_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      if (_T_3771) begin
        buf_unsign_3 <= ibuf_unsign;
      end else begin
        buf_unsign_3 <= io_lsu_pkt_r_unsign;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_error_3 <= 1'h0;
    end else if (_T_3918) begin
      buf_error_3 <= _T_3917;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      lsu_nonblock_load_valid_r <= 1'h0;
    end else begin
      lsu_nonblock_load_valid_r <= io_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_4338 <= 1'h0;
    end else begin
      _T_4338 <= _T_4335 & _T_4035;
    end
  end
endmodule
module el2_lsu_bus_intf(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dec_tlu_external_ldfwd_disable,
  input         io_dec_tlu_wb_coalescing_disable,
  input         io_dec_tlu_sideeffect_posted_disable,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_obuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_free_clk,
  input         io_lsu_busm_clk,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_busreq_m,
  input         io_lsu_pkt_m_fast_int,
  input         io_lsu_pkt_m_by,
  input         io_lsu_pkt_m_half,
  input         io_lsu_pkt_m_word,
  input         io_lsu_pkt_m_dword,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_unsign,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_store_data_bypass_d,
  input         io_lsu_pkt_m_load_ldst_bypass_d,
  input         io_lsu_pkt_m_store_data_bypass_m,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_fast_int,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_dword,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_unsign,
  input         io_lsu_pkt_r_dma,
  input         io_lsu_pkt_r_store_data_bypass_d,
  input         io_lsu_pkt_r_load_ldst_bypass_d,
  input         io_lsu_pkt_r_store_data_bypass_m,
  input         io_lsu_pkt_r_valid,
  input  [31:0] io_lsu_addr_d,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [31:0] io_end_addr_d,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_end_addr_r,
  input  [31:0] io_store_data_r,
  input         io_dec_tlu_force_halt,
  input         io_lsu_commit_r,
  input         io_is_sideeffects_m,
  input         io_flush_m_up,
  input         io_flush_r,
  input         io_lsu_axi_awready,
  input         io_lsu_axi_wready,
  input         io_lsu_axi_bvalid,
  input  [1:0]  io_lsu_axi_bresp,
  input  [2:0]  io_lsu_axi_bid,
  input         io_lsu_axi_arready,
  input         io_lsu_axi_rvalid,
  input  [2:0]  io_lsu_axi_rid,
  input  [63:0] io_lsu_axi_rdata,
  input  [1:0]  io_lsu_axi_rresp,
  input         io_lsu_axi_rlast,
  input         io_lsu_bus_clk_en,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output        io_lsu_bus_idle_any,
  output [31:0] io_bus_read_data_m,
  output        io_lsu_imprecise_error_load_any,
  output        io_lsu_imprecise_error_store_any,
  output [31:0] io_lsu_imprecise_error_addr_any,
  output        io_lsu_nonblock_load_valid_m,
  output [1:0]  io_lsu_nonblock_load_tag_m,
  output        io_lsu_nonblock_load_inv_r,
  output [1:0]  io_lsu_nonblock_load_inv_tag_r,
  output        io_lsu_nonblock_load_data_valid,
  output        io_lsu_nonblock_load_data_error,
  output [1:0]  io_lsu_nonblock_load_data_tag,
  output [31:0] io_lsu_nonblock_load_data,
  output        io_lsu_pmu_bus_trxn,
  output        io_lsu_pmu_bus_misaligned,
  output        io_lsu_pmu_bus_error,
  output        io_lsu_pmu_bus_busy,
  output        io_lsu_axi_awvalid,
  output [2:0]  io_lsu_axi_awid,
  output [31:0] io_lsu_axi_awaddr,
  output [3:0]  io_lsu_axi_awregion,
  output [7:0]  io_lsu_axi_awlen,
  output [2:0]  io_lsu_axi_awsize,
  output [1:0]  io_lsu_axi_awburst,
  output        io_lsu_axi_awlock,
  output [3:0]  io_lsu_axi_awcache,
  output [2:0]  io_lsu_axi_awprot,
  output [3:0]  io_lsu_axi_awqos,
  output        io_lsu_axi_wvalid,
  output [63:0] io_lsu_axi_wdata,
  output [7:0]  io_lsu_axi_wstrb,
  output        io_lsu_axi_wlast,
  output        io_lsu_axi_bready,
  output        io_lsu_axi_arvalid,
  output [2:0]  io_lsu_axi_arid,
  output [31:0] io_lsu_axi_araddr,
  output [3:0]  io_lsu_axi_arregion,
  output [7:0]  io_lsu_axi_arlen,
  output [2:0]  io_lsu_axi_arsize,
  output [1:0]  io_lsu_axi_arburst,
  output        io_lsu_axi_arlock,
  output [3:0]  io_lsu_axi_arcache,
  output [2:0]  io_lsu_axi_arprot,
  output [3:0]  io_lsu_axi_arqos,
  output        io_lsu_axi_rready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  bus_buffer_clock; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_reset; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_dec_tlu_force_halt; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_c2_r_clk; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_obuf_c1_clk; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_buf_c1_clk; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_free_c2_clk; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_busm_clk; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_m_load; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_m_valid; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_r_by; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_r_half; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_r_word; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_r_load; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pkt_r_unsign; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_lsu_addr_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_lsu_addr_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_end_addr_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_store_data_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_no_word_merge_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_no_dword_merge_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_ld_full_hit_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_flush_m_up; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_flush_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_commit_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_is_sideeffects_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_ldst_dual_d; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_ldst_dual_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_ldst_dual_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire [7:0] bus_buffer_io_ldst_byteen_ext_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_awready; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_wready; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_bvalid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [1:0] bus_buffer_io_lsu_axi_bresp; // @[el2_lsu_bus_intf.scala 148:40]
  wire [2:0] bus_buffer_io_lsu_axi_bid; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_arready; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_rvalid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [2:0] bus_buffer_io_lsu_axi_rid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [63:0] bus_buffer_io_lsu_axi_rdata; // @[el2_lsu_bus_intf.scala 148:40]
  wire [1:0] bus_buffer_io_lsu_axi_rresp; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_clk_en; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_clk_en_q; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_busreq_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_buffer_pend_any; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_buffer_full_any; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_bus_buffer_empty_any; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_lo; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_hi; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_imprecise_error_load_any; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_lsu_imprecise_error_addr_any; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_nonblock_load_valid_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire [1:0] bus_buffer_io_lsu_nonblock_load_tag_m; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_nonblock_load_inv_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire [1:0] bus_buffer_io_lsu_nonblock_load_inv_tag_r; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_nonblock_load_data_valid; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_intf.scala 148:40]
  wire [1:0] bus_buffer_io_lsu_nonblock_load_data_tag; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_lsu_nonblock_load_data; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pmu_bus_trxn; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pmu_bus_misaligned; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pmu_bus_error; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_pmu_bus_busy; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_awvalid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [2:0] bus_buffer_io_lsu_axi_awid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_lsu_axi_awaddr; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] bus_buffer_io_lsu_axi_awregion; // @[el2_lsu_bus_intf.scala 148:40]
  wire [2:0] bus_buffer_io_lsu_axi_awsize; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] bus_buffer_io_lsu_axi_awcache; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_wvalid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [63:0] bus_buffer_io_lsu_axi_wdata; // @[el2_lsu_bus_intf.scala 148:40]
  wire [7:0] bus_buffer_io_lsu_axi_wstrb; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_bready; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_arvalid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [2:0] bus_buffer_io_lsu_axi_arid; // @[el2_lsu_bus_intf.scala 148:40]
  wire [31:0] bus_buffer_io_lsu_axi_araddr; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] bus_buffer_io_lsu_axi_arregion; // @[el2_lsu_bus_intf.scala 148:40]
  wire [2:0] bus_buffer_io_lsu_axi_arsize; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] bus_buffer_io_lsu_axi_arcache; // @[el2_lsu_bus_intf.scala 148:40]
  wire  bus_buffer_io_lsu_axi_rready; // @[el2_lsu_bus_intf.scala 148:40]
  wire [3:0] _T_3 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_4 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_5 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = _T_3 | _T_4; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_m = _T_6 | _T_5; // @[Mux.scala 27:72]
  wire  addr_match_dw_lo_r_m = io_lsu_addr_r[31:3] == io_lsu_addr_m[31:3]; // @[el2_lsu_bus_intf.scala 248:52]
  wire  _T_17 = io_lsu_addr_r[2] ^ io_lsu_addr_m[2]; // @[el2_lsu_bus_intf.scala 249:72]
  wire  _T_18 = ~_T_17; // @[el2_lsu_bus_intf.scala 249:54]
  wire  addr_match_word_lo_r_m = addr_match_dw_lo_r_m & _T_18; // @[el2_lsu_bus_intf.scala 249:52]
  reg  ldst_dual_r; // @[el2_lsu_bus_intf.scala 290:35]
  wire  _T_20 = ~ldst_dual_r; // @[el2_lsu_bus_intf.scala 250:49]
  wire  _T_21 = io_lsu_busreq_r & _T_20; // @[el2_lsu_bus_intf.scala 250:47]
  wire  _T_22 = _T_21 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 250:62]
  wire  _T_23 = ~addr_match_word_lo_r_m; // @[el2_lsu_bus_intf.scala 250:103]
  wire  _T_24 = io_lsu_pkt_m_load | _T_23; // @[el2_lsu_bus_intf.scala 250:101]
  wire  _T_29 = ~addr_match_dw_lo_r_m; // @[el2_lsu_bus_intf.scala 251:103]
  wire  _T_30 = io_lsu_pkt_m_load | _T_29; // @[el2_lsu_bus_intf.scala 251:101]
  wire [7:0] _T_33 = {4'h0,ldst_byteen_m}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_0 = {{3'd0}, _T_33}; // @[el2_lsu_bus_intf.scala 252:64]
  wire [10:0] _T_35 = _GEN_0 << io_lsu_addr_m[1:0]; // @[el2_lsu_bus_intf.scala 252:64]
  reg  _T_389; // @[el2_lsu_bus_intf.scala 292:35]
  wire [3:0] ldst_byteen_r = {{3'd0}, _T_389}; // @[el2_lsu_bus_intf.scala 292:25]
  wire [7:0] _T_37 = {4'h0,ldst_byteen_r}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_1 = {{3'd0}, _T_37}; // @[el2_lsu_bus_intf.scala 253:64]
  wire [10:0] _T_39 = _GEN_1 << io_lsu_addr_r[1:0]; // @[el2_lsu_bus_intf.scala 253:64]
  wire [63:0] _T_41 = {32'h0,io_store_data_r}; // @[Cat.scala 29:58]
  wire [4:0] _T_43 = {io_lsu_addr_r[1:0],3'h0}; // @[Cat.scala 29:58]
  wire [94:0] _GEN_2 = {{31'd0}, _T_41}; // @[el2_lsu_bus_intf.scala 254:68]
  wire [94:0] _T_44 = _GEN_2 << _T_43; // @[el2_lsu_bus_intf.scala 254:68]
  wire [7:0] ldst_byteen_ext_m = _T_35[7:0]; // @[el2_lsu_bus_intf.scala 252:28]
  wire [3:0] ldst_byteen_hi_m = ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_intf.scala 255:48]
  wire [3:0] ldst_byteen_lo_m = ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_intf.scala 256:48]
  wire [7:0] ldst_byteen_ext_r = _T_39[7:0]; // @[el2_lsu_bus_intf.scala 253:28]
  wire [3:0] ldst_byteen_hi_r = ldst_byteen_ext_r[7:4]; // @[el2_lsu_bus_intf.scala 257:48]
  wire [3:0] ldst_byteen_lo_r = ldst_byteen_ext_r[3:0]; // @[el2_lsu_bus_intf.scala 258:48]
  wire [63:0] store_data_ext_r = _T_44[63:0]; // @[el2_lsu_bus_intf.scala 254:28]
  wire [31:0] store_data_hi_r = store_data_ext_r[63:32]; // @[el2_lsu_bus_intf.scala 259:47]
  wire [31:0] store_data_lo_r = store_data_ext_r[31:0]; // @[el2_lsu_bus_intf.scala 260:47]
  wire  _T_53 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 261:52]
  wire  _T_54 = _T_53 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 261:77]
  wire  _T_55 = _T_54 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 261:98]
  wire  ld_addr_rhit_lo_lo = _T_55 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 261:119]
  wire  _T_59 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 262:52]
  wire  _T_60 = _T_59 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 262:77]
  wire  _T_61 = _T_60 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 262:98]
  wire  ld_addr_rhit_lo_hi = _T_61 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 262:119]
  wire  _T_65 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 263:52]
  wire  _T_66 = _T_65 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 263:77]
  wire  _T_67 = _T_66 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 263:98]
  wire  ld_addr_rhit_hi_lo = _T_67 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 263:119]
  wire  _T_71 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 264:52]
  wire  _T_72 = _T_71 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 264:77]
  wire  _T_73 = _T_72 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 264:98]
  wire  ld_addr_rhit_hi_hi = _T_73 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 264:119]
  wire  _T_76 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[0]; // @[el2_lsu_bus_intf.scala 265:71]
  wire  _T_78 = _T_76 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_intf.scala 265:93]
  wire  _T_80 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[1]; // @[el2_lsu_bus_intf.scala 265:71]
  wire  _T_82 = _T_80 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_intf.scala 265:93]
  wire  _T_84 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[2]; // @[el2_lsu_bus_intf.scala 265:71]
  wire  _T_86 = _T_84 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_intf.scala 265:93]
  wire  _T_88 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[3]; // @[el2_lsu_bus_intf.scala 265:71]
  wire  _T_90 = _T_88 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_intf.scala 265:93]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_90,_T_86,_T_82,_T_78}; // @[Cat.scala 29:58]
  wire  _T_95 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[0]; // @[el2_lsu_bus_intf.scala 266:71]
  wire  _T_97 = _T_95 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_intf.scala 266:93]
  wire  _T_99 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[1]; // @[el2_lsu_bus_intf.scala 266:71]
  wire  _T_101 = _T_99 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_intf.scala 266:93]
  wire  _T_103 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[2]; // @[el2_lsu_bus_intf.scala 266:71]
  wire  _T_105 = _T_103 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_intf.scala 266:93]
  wire  _T_107 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[3]; // @[el2_lsu_bus_intf.scala 266:71]
  wire  _T_109 = _T_107 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_intf.scala 266:93]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_109,_T_105,_T_101,_T_97}; // @[Cat.scala 29:58]
  wire  _T_114 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[0]; // @[el2_lsu_bus_intf.scala 267:71]
  wire  _T_116 = _T_114 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_intf.scala 267:93]
  wire  _T_118 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[1]; // @[el2_lsu_bus_intf.scala 267:71]
  wire  _T_120 = _T_118 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_intf.scala 267:93]
  wire  _T_122 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[2]; // @[el2_lsu_bus_intf.scala 267:71]
  wire  _T_124 = _T_122 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_intf.scala 267:93]
  wire  _T_126 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[3]; // @[el2_lsu_bus_intf.scala 267:71]
  wire  _T_128 = _T_126 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_intf.scala 267:93]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_128,_T_124,_T_120,_T_116}; // @[Cat.scala 29:58]
  wire  _T_133 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[0]; // @[el2_lsu_bus_intf.scala 268:71]
  wire  _T_135 = _T_133 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_intf.scala 268:93]
  wire  _T_137 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[1]; // @[el2_lsu_bus_intf.scala 268:71]
  wire  _T_139 = _T_137 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_intf.scala 268:93]
  wire  _T_141 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[2]; // @[el2_lsu_bus_intf.scala 268:71]
  wire  _T_143 = _T_141 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_intf.scala 268:93]
  wire  _T_145 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[3]; // @[el2_lsu_bus_intf.scala 268:71]
  wire  _T_147 = _T_145 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_intf.scala 268:93]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_147,_T_143,_T_139,_T_135}; // @[Cat.scala 29:58]
  wire  _T_153 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[el2_lsu_bus_intf.scala 269:74]
  wire [3:0] ld_byte_hit_buf_lo = bus_buffer_io_ld_byte_hit_buf_lo; // @[el2_lsu_bus_intf.scala 198:39]
  wire  _T_155 = _T_153 | ld_byte_hit_buf_lo[0]; // @[el2_lsu_bus_intf.scala 269:98]
  wire  _T_158 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[el2_lsu_bus_intf.scala 269:74]
  wire  _T_160 = _T_158 | ld_byte_hit_buf_lo[1]; // @[el2_lsu_bus_intf.scala 269:98]
  wire  _T_163 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[el2_lsu_bus_intf.scala 269:74]
  wire  _T_165 = _T_163 | ld_byte_hit_buf_lo[2]; // @[el2_lsu_bus_intf.scala 269:98]
  wire  _T_168 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[el2_lsu_bus_intf.scala 269:74]
  wire  _T_170 = _T_168 | ld_byte_hit_buf_lo[3]; // @[el2_lsu_bus_intf.scala 269:98]
  wire [3:0] ld_byte_hit_lo = {_T_170,_T_165,_T_160,_T_155}; // @[Cat.scala 29:58]
  wire  _T_176 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[el2_lsu_bus_intf.scala 270:74]
  wire [3:0] ld_byte_hit_buf_hi = bus_buffer_io_ld_byte_hit_buf_hi; // @[el2_lsu_bus_intf.scala 199:39]
  wire  _T_178 = _T_176 | ld_byte_hit_buf_hi[0]; // @[el2_lsu_bus_intf.scala 270:98]
  wire  _T_181 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[el2_lsu_bus_intf.scala 270:74]
  wire  _T_183 = _T_181 | ld_byte_hit_buf_hi[1]; // @[el2_lsu_bus_intf.scala 270:98]
  wire  _T_186 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[el2_lsu_bus_intf.scala 270:74]
  wire  _T_188 = _T_186 | ld_byte_hit_buf_hi[2]; // @[el2_lsu_bus_intf.scala 270:98]
  wire  _T_191 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[el2_lsu_bus_intf.scala 270:74]
  wire  _T_193 = _T_191 | ld_byte_hit_buf_hi[3]; // @[el2_lsu_bus_intf.scala 270:98]
  wire [3:0] ld_byte_hit_hi = {_T_193,_T_188,_T_183,_T_178}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_lo = {_T_168,_T_163,_T_158,_T_153}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_hi = {_T_191,_T_186,_T_181,_T_176}; // @[Cat.scala 29:58]
  wire [7:0] _T_231 = ld_byte_rhit_lo_lo[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_232 = ld_byte_rhit_hi_lo[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_233 = _T_231 | _T_232; // @[Mux.scala 27:72]
  wire [7:0] _T_239 = ld_byte_rhit_lo_lo[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_240 = ld_byte_rhit_hi_lo[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_241 = _T_239 | _T_240; // @[Mux.scala 27:72]
  wire [7:0] _T_247 = ld_byte_rhit_lo_lo[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_248 = ld_byte_rhit_hi_lo[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_249 = _T_247 | _T_248; // @[Mux.scala 27:72]
  wire [7:0] _T_255 = ld_byte_rhit_lo_lo[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_256 = ld_byte_rhit_hi_lo[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_257 = _T_255 | _T_256; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_lo = {_T_257,_T_249,_T_241,_T_233}; // @[Cat.scala 29:58]
  wire [7:0] _T_266 = ld_byte_rhit_lo_hi[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_267 = ld_byte_rhit_hi_hi[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_268 = _T_266 | _T_267; // @[Mux.scala 27:72]
  wire [7:0] _T_274 = ld_byte_rhit_lo_hi[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_275 = ld_byte_rhit_hi_hi[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_276 = _T_274 | _T_275; // @[Mux.scala 27:72]
  wire [7:0] _T_282 = ld_byte_rhit_lo_hi[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_283 = ld_byte_rhit_hi_hi[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_284 = _T_282 | _T_283; // @[Mux.scala 27:72]
  wire [7:0] _T_290 = ld_byte_rhit_lo_hi[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_291 = ld_byte_rhit_hi_hi[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_292 = _T_290 | _T_291; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_hi = {_T_292,_T_284,_T_276,_T_268}; // @[Cat.scala 29:58]
  wire [7:0] _T_300 = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : 8'h0; // @[el2_lsu_bus_intf.scala 275:55]
  wire [7:0] _T_304 = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : 8'h0; // @[el2_lsu_bus_intf.scala 275:55]
  wire [7:0] _T_308 = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : 8'h0; // @[el2_lsu_bus_intf.scala 275:55]
  wire [7:0] _T_312 = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : 8'h0; // @[el2_lsu_bus_intf.scala 275:55]
  wire [31:0] _T_315 = {_T_312,_T_308,_T_304,_T_300}; // @[Cat.scala 29:58]
  wire [7:0] _T_319 = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : 8'h0; // @[el2_lsu_bus_intf.scala 276:55]
  wire [7:0] _T_323 = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : 8'h0; // @[el2_lsu_bus_intf.scala 276:55]
  wire [7:0] _T_327 = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : 8'h0; // @[el2_lsu_bus_intf.scala 276:55]
  wire [7:0] _T_331 = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : 8'h0; // @[el2_lsu_bus_intf.scala 276:55]
  wire [31:0] _T_334 = {_T_331,_T_327,_T_323,_T_319}; // @[Cat.scala 29:58]
  wire  _T_337 = ~ldst_byteen_lo_m[0]; // @[el2_lsu_bus_intf.scala 277:73]
  wire  _T_338 = ld_byte_hit_lo[0] | _T_337; // @[el2_lsu_bus_intf.scala 277:71]
  wire  _T_341 = ~ldst_byteen_lo_m[1]; // @[el2_lsu_bus_intf.scala 277:73]
  wire  _T_342 = ld_byte_hit_lo[1] | _T_341; // @[el2_lsu_bus_intf.scala 277:71]
  wire  _T_345 = ~ldst_byteen_lo_m[2]; // @[el2_lsu_bus_intf.scala 277:73]
  wire  _T_346 = ld_byte_hit_lo[2] | _T_345; // @[el2_lsu_bus_intf.scala 277:71]
  wire  _T_349 = ~ldst_byteen_lo_m[3]; // @[el2_lsu_bus_intf.scala 277:73]
  wire  _T_350 = ld_byte_hit_lo[3] | _T_349; // @[el2_lsu_bus_intf.scala 277:71]
  wire  _T_351 = _T_338 & _T_342; // @[el2_lsu_bus_intf.scala 277:112]
  wire  _T_352 = _T_351 & _T_346; // @[el2_lsu_bus_intf.scala 277:112]
  wire  ld_full_hit_lo_m = _T_352 & _T_350; // @[el2_lsu_bus_intf.scala 277:112]
  wire  _T_356 = ~ldst_byteen_hi_m[0]; // @[el2_lsu_bus_intf.scala 278:73]
  wire  _T_357 = ld_byte_hit_hi[0] | _T_356; // @[el2_lsu_bus_intf.scala 278:71]
  wire  _T_360 = ~ldst_byteen_hi_m[1]; // @[el2_lsu_bus_intf.scala 278:73]
  wire  _T_361 = ld_byte_hit_hi[1] | _T_360; // @[el2_lsu_bus_intf.scala 278:71]
  wire  _T_364 = ~ldst_byteen_hi_m[2]; // @[el2_lsu_bus_intf.scala 278:73]
  wire  _T_365 = ld_byte_hit_hi[2] | _T_364; // @[el2_lsu_bus_intf.scala 278:71]
  wire  _T_368 = ~ldst_byteen_hi_m[3]; // @[el2_lsu_bus_intf.scala 278:73]
  wire  _T_369 = ld_byte_hit_hi[3] | _T_368; // @[el2_lsu_bus_intf.scala 278:71]
  wire  _T_370 = _T_357 & _T_361; // @[el2_lsu_bus_intf.scala 278:112]
  wire  _T_371 = _T_370 & _T_365; // @[el2_lsu_bus_intf.scala 278:112]
  wire  ld_full_hit_hi_m = _T_371 & _T_369; // @[el2_lsu_bus_intf.scala 278:112]
  wire  _T_373 = ld_full_hit_lo_m & ld_full_hit_hi_m; // @[el2_lsu_bus_intf.scala 279:48]
  wire  _T_374 = _T_373 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 279:67]
  wire  _T_375 = _T_374 & io_lsu_pkt_m_load; // @[el2_lsu_bus_intf.scala 279:85]
  wire  _T_376 = ~io_is_sideeffects_m; // @[el2_lsu_bus_intf.scala 279:107]
  wire [63:0] ld_fwddata_hi = {{32'd0}, _T_334}; // @[el2_lsu_bus_intf.scala 276:28]
  wire [63:0] ld_fwddata_lo = {{32'd0}, _T_315}; // @[el2_lsu_bus_intf.scala 275:28]
  wire [63:0] _T_380 = {ld_fwddata_hi[31:0],ld_fwddata_lo[31:0]}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_3 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[el2_lsu_bus_intf.scala 280:84]
  wire [5:0] _T_382 = 4'h8 * _GEN_3; // @[el2_lsu_bus_intf.scala 280:84]
  wire [63:0] ld_fwddata_m = _T_380 >> _T_382; // @[el2_lsu_bus_intf.scala 280:77]
  reg  lsu_bus_clk_en_q; // @[el2_lsu_bus_intf.scala 284:34]
  reg  ldst_dual_m; // @[el2_lsu_bus_intf.scala 287:29]
  reg  is_sideeffects_r; // @[el2_lsu_bus_intf.scala 291:35]
  el2_lsu_bus_buffer bus_buffer ( // @[el2_lsu_bus_intf.scala 148:40]
    .clock(bus_buffer_clock),
    .reset(bus_buffer_reset),
    .io_dec_tlu_external_ldfwd_disable(bus_buffer_io_dec_tlu_external_ldfwd_disable),
    .io_dec_tlu_wb_coalescing_disable(bus_buffer_io_dec_tlu_wb_coalescing_disable),
    .io_dec_tlu_sideeffect_posted_disable(bus_buffer_io_dec_tlu_sideeffect_posted_disable),
    .io_dec_tlu_force_halt(bus_buffer_io_dec_tlu_force_halt),
    .io_lsu_c2_r_clk(bus_buffer_io_lsu_c2_r_clk),
    .io_lsu_bus_ibuf_c1_clk(bus_buffer_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_obuf_c1_clk(bus_buffer_io_lsu_bus_obuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(bus_buffer_io_lsu_bus_buf_c1_clk),
    .io_lsu_free_c2_clk(bus_buffer_io_lsu_free_c2_clk),
    .io_lsu_busm_clk(bus_buffer_io_lsu_busm_clk),
    .io_dec_lsu_valid_raw_d(bus_buffer_io_dec_lsu_valid_raw_d),
    .io_lsu_pkt_m_load(bus_buffer_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_valid(bus_buffer_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_by(bus_buffer_io_lsu_pkt_r_by),
    .io_lsu_pkt_r_half(bus_buffer_io_lsu_pkt_r_half),
    .io_lsu_pkt_r_word(bus_buffer_io_lsu_pkt_r_word),
    .io_lsu_pkt_r_load(bus_buffer_io_lsu_pkt_r_load),
    .io_lsu_pkt_r_store(bus_buffer_io_lsu_pkt_r_store),
    .io_lsu_pkt_r_unsign(bus_buffer_io_lsu_pkt_r_unsign),
    .io_lsu_addr_m(bus_buffer_io_lsu_addr_m),
    .io_lsu_addr_r(bus_buffer_io_lsu_addr_r),
    .io_end_addr_r(bus_buffer_io_end_addr_r),
    .io_store_data_r(bus_buffer_io_store_data_r),
    .io_no_word_merge_r(bus_buffer_io_no_word_merge_r),
    .io_no_dword_merge_r(bus_buffer_io_no_dword_merge_r),
    .io_lsu_busreq_m(bus_buffer_io_lsu_busreq_m),
    .io_ld_full_hit_m(bus_buffer_io_ld_full_hit_m),
    .io_flush_m_up(bus_buffer_io_flush_m_up),
    .io_flush_r(bus_buffer_io_flush_r),
    .io_lsu_commit_r(bus_buffer_io_lsu_commit_r),
    .io_is_sideeffects_r(bus_buffer_io_is_sideeffects_r),
    .io_ldst_dual_d(bus_buffer_io_ldst_dual_d),
    .io_ldst_dual_m(bus_buffer_io_ldst_dual_m),
    .io_ldst_dual_r(bus_buffer_io_ldst_dual_r),
    .io_ldst_byteen_ext_m(bus_buffer_io_ldst_byteen_ext_m),
    .io_lsu_axi_awready(bus_buffer_io_lsu_axi_awready),
    .io_lsu_axi_wready(bus_buffer_io_lsu_axi_wready),
    .io_lsu_axi_bvalid(bus_buffer_io_lsu_axi_bvalid),
    .io_lsu_axi_bresp(bus_buffer_io_lsu_axi_bresp),
    .io_lsu_axi_bid(bus_buffer_io_lsu_axi_bid),
    .io_lsu_axi_arready(bus_buffer_io_lsu_axi_arready),
    .io_lsu_axi_rvalid(bus_buffer_io_lsu_axi_rvalid),
    .io_lsu_axi_rid(bus_buffer_io_lsu_axi_rid),
    .io_lsu_axi_rdata(bus_buffer_io_lsu_axi_rdata),
    .io_lsu_axi_rresp(bus_buffer_io_lsu_axi_rresp),
    .io_lsu_bus_clk_en(bus_buffer_io_lsu_bus_clk_en),
    .io_lsu_bus_clk_en_q(bus_buffer_io_lsu_bus_clk_en_q),
    .io_lsu_busreq_r(bus_buffer_io_lsu_busreq_r),
    .io_lsu_bus_buffer_pend_any(bus_buffer_io_lsu_bus_buffer_pend_any),
    .io_lsu_bus_buffer_full_any(bus_buffer_io_lsu_bus_buffer_full_any),
    .io_lsu_bus_buffer_empty_any(bus_buffer_io_lsu_bus_buffer_empty_any),
    .io_ld_byte_hit_buf_lo(bus_buffer_io_ld_byte_hit_buf_lo),
    .io_ld_byte_hit_buf_hi(bus_buffer_io_ld_byte_hit_buf_hi),
    .io_lsu_imprecise_error_load_any(bus_buffer_io_lsu_imprecise_error_load_any),
    .io_lsu_imprecise_error_store_any(bus_buffer_io_lsu_imprecise_error_store_any),
    .io_lsu_imprecise_error_addr_any(bus_buffer_io_lsu_imprecise_error_addr_any),
    .io_lsu_nonblock_load_valid_m(bus_buffer_io_lsu_nonblock_load_valid_m),
    .io_lsu_nonblock_load_tag_m(bus_buffer_io_lsu_nonblock_load_tag_m),
    .io_lsu_nonblock_load_inv_r(bus_buffer_io_lsu_nonblock_load_inv_r),
    .io_lsu_nonblock_load_inv_tag_r(bus_buffer_io_lsu_nonblock_load_inv_tag_r),
    .io_lsu_nonblock_load_data_valid(bus_buffer_io_lsu_nonblock_load_data_valid),
    .io_lsu_nonblock_load_data_error(bus_buffer_io_lsu_nonblock_load_data_error),
    .io_lsu_nonblock_load_data_tag(bus_buffer_io_lsu_nonblock_load_data_tag),
    .io_lsu_nonblock_load_data(bus_buffer_io_lsu_nonblock_load_data),
    .io_lsu_pmu_bus_trxn(bus_buffer_io_lsu_pmu_bus_trxn),
    .io_lsu_pmu_bus_misaligned(bus_buffer_io_lsu_pmu_bus_misaligned),
    .io_lsu_pmu_bus_error(bus_buffer_io_lsu_pmu_bus_error),
    .io_lsu_pmu_bus_busy(bus_buffer_io_lsu_pmu_bus_busy),
    .io_lsu_axi_awvalid(bus_buffer_io_lsu_axi_awvalid),
    .io_lsu_axi_awid(bus_buffer_io_lsu_axi_awid),
    .io_lsu_axi_awaddr(bus_buffer_io_lsu_axi_awaddr),
    .io_lsu_axi_awregion(bus_buffer_io_lsu_axi_awregion),
    .io_lsu_axi_awsize(bus_buffer_io_lsu_axi_awsize),
    .io_lsu_axi_awcache(bus_buffer_io_lsu_axi_awcache),
    .io_lsu_axi_wvalid(bus_buffer_io_lsu_axi_wvalid),
    .io_lsu_axi_wdata(bus_buffer_io_lsu_axi_wdata),
    .io_lsu_axi_wstrb(bus_buffer_io_lsu_axi_wstrb),
    .io_lsu_axi_bready(bus_buffer_io_lsu_axi_bready),
    .io_lsu_axi_arvalid(bus_buffer_io_lsu_axi_arvalid),
    .io_lsu_axi_arid(bus_buffer_io_lsu_axi_arid),
    .io_lsu_axi_araddr(bus_buffer_io_lsu_axi_araddr),
    .io_lsu_axi_arregion(bus_buffer_io_lsu_axi_arregion),
    .io_lsu_axi_arsize(bus_buffer_io_lsu_axi_arsize),
    .io_lsu_axi_arcache(bus_buffer_io_lsu_axi_arcache),
    .io_lsu_axi_rready(bus_buffer_io_lsu_axi_rready)
  );
  assign io_lsu_busreq_r = bus_buffer_io_lsu_busreq_r; // @[el2_lsu_bus_intf.scala 193:39]
  assign io_lsu_bus_buffer_pend_any = bus_buffer_io_lsu_bus_buffer_pend_any; // @[el2_lsu_bus_intf.scala 194:39]
  assign io_lsu_bus_buffer_full_any = bus_buffer_io_lsu_bus_buffer_full_any; // @[el2_lsu_bus_intf.scala 195:39]
  assign io_lsu_bus_buffer_empty_any = bus_buffer_io_lsu_bus_buffer_empty_any; // @[el2_lsu_bus_intf.scala 196:39]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_intf.scala 197:39]
  assign io_bus_read_data_m = ld_fwddata_m[31:0]; // @[el2_lsu_bus_intf.scala 281:28]
  assign io_lsu_imprecise_error_load_any = bus_buffer_io_lsu_imprecise_error_load_any; // @[el2_lsu_bus_intf.scala 202:39]
  assign io_lsu_imprecise_error_store_any = bus_buffer_io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_intf.scala 203:39]
  assign io_lsu_imprecise_error_addr_any = bus_buffer_io_lsu_imprecise_error_addr_any; // @[el2_lsu_bus_intf.scala 204:39]
  assign io_lsu_nonblock_load_valid_m = bus_buffer_io_lsu_nonblock_load_valid_m; // @[el2_lsu_bus_intf.scala 205:39]
  assign io_lsu_nonblock_load_tag_m = bus_buffer_io_lsu_nonblock_load_tag_m; // @[el2_lsu_bus_intf.scala 206:39]
  assign io_lsu_nonblock_load_inv_r = bus_buffer_io_lsu_nonblock_load_inv_r; // @[el2_lsu_bus_intf.scala 207:39]
  assign io_lsu_nonblock_load_inv_tag_r = bus_buffer_io_lsu_nonblock_load_inv_tag_r; // @[el2_lsu_bus_intf.scala 208:39]
  assign io_lsu_nonblock_load_data_valid = bus_buffer_io_lsu_nonblock_load_data_valid; // @[el2_lsu_bus_intf.scala 209:39]
  assign io_lsu_nonblock_load_data_error = bus_buffer_io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_intf.scala 210:39]
  assign io_lsu_nonblock_load_data_tag = bus_buffer_io_lsu_nonblock_load_data_tag; // @[el2_lsu_bus_intf.scala 211:39]
  assign io_lsu_nonblock_load_data = bus_buffer_io_lsu_nonblock_load_data; // @[el2_lsu_bus_intf.scala 212:39]
  assign io_lsu_pmu_bus_trxn = bus_buffer_io_lsu_pmu_bus_trxn; // @[el2_lsu_bus_intf.scala 213:39]
  assign io_lsu_pmu_bus_misaligned = bus_buffer_io_lsu_pmu_bus_misaligned; // @[el2_lsu_bus_intf.scala 214:39]
  assign io_lsu_pmu_bus_error = bus_buffer_io_lsu_pmu_bus_error; // @[el2_lsu_bus_intf.scala 215:39]
  assign io_lsu_pmu_bus_busy = bus_buffer_io_lsu_pmu_bus_busy; // @[el2_lsu_bus_intf.scala 216:39]
  assign io_lsu_axi_awvalid = bus_buffer_io_lsu_axi_awvalid; // @[el2_lsu_bus_intf.scala 217:39]
  assign io_lsu_axi_awid = bus_buffer_io_lsu_axi_awid; // @[el2_lsu_bus_intf.scala 218:39]
  assign io_lsu_axi_awaddr = bus_buffer_io_lsu_axi_awaddr; // @[el2_lsu_bus_intf.scala 219:39]
  assign io_lsu_axi_awregion = bus_buffer_io_lsu_axi_awregion; // @[el2_lsu_bus_intf.scala 220:39]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_intf.scala 221:39]
  assign io_lsu_axi_awsize = bus_buffer_io_lsu_axi_awsize; // @[el2_lsu_bus_intf.scala 222:39]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_intf.scala 223:39]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_intf.scala 224:39]
  assign io_lsu_axi_awcache = bus_buffer_io_lsu_axi_awcache; // @[el2_lsu_bus_intf.scala 225:39]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_intf.scala 226:39]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_intf.scala 227:39]
  assign io_lsu_axi_wvalid = bus_buffer_io_lsu_axi_wvalid; // @[el2_lsu_bus_intf.scala 228:39]
  assign io_lsu_axi_wdata = bus_buffer_io_lsu_axi_wdata; // @[el2_lsu_bus_intf.scala 229:39]
  assign io_lsu_axi_wstrb = bus_buffer_io_lsu_axi_wstrb; // @[el2_lsu_bus_intf.scala 230:39]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_intf.scala 231:39]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_intf.scala 232:39]
  assign io_lsu_axi_arvalid = bus_buffer_io_lsu_axi_arvalid; // @[el2_lsu_bus_intf.scala 233:39]
  assign io_lsu_axi_arid = bus_buffer_io_lsu_axi_arid; // @[el2_lsu_bus_intf.scala 234:39]
  assign io_lsu_axi_araddr = bus_buffer_io_lsu_axi_araddr; // @[el2_lsu_bus_intf.scala 235:39]
  assign io_lsu_axi_arregion = bus_buffer_io_lsu_axi_arregion; // @[el2_lsu_bus_intf.scala 236:39]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_intf.scala 237:39]
  assign io_lsu_axi_arsize = bus_buffer_io_lsu_axi_arsize; // @[el2_lsu_bus_intf.scala 238:39]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_intf.scala 239:39]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_intf.scala 240:39]
  assign io_lsu_axi_arcache = bus_buffer_io_lsu_axi_arcache; // @[el2_lsu_bus_intf.scala 241:39]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_intf.scala 242:39]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_intf.scala 243:39]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_intf.scala 244:39]
  assign bus_buffer_clock = clock;
  assign bus_buffer_reset = reset;
  assign bus_buffer_io_dec_tlu_external_ldfwd_disable = io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_intf.scala 150:52]
  assign bus_buffer_io_dec_tlu_wb_coalescing_disable = io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_intf.scala 151:52]
  assign bus_buffer_io_dec_tlu_sideeffect_posted_disable = io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_intf.scala 152:52]
  assign bus_buffer_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[el2_lsu_bus_intf.scala 153:52]
  assign bus_buffer_io_lsu_c2_r_clk = io_lsu_c2_r_clk; // @[el2_lsu_bus_intf.scala 154:52]
  assign bus_buffer_io_lsu_bus_ibuf_c1_clk = io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_intf.scala 155:52]
  assign bus_buffer_io_lsu_bus_obuf_c1_clk = io_lsu_bus_obuf_c1_clk; // @[el2_lsu_bus_intf.scala 156:52]
  assign bus_buffer_io_lsu_bus_buf_c1_clk = io_lsu_bus_buf_c1_clk; // @[el2_lsu_bus_intf.scala 157:52]
  assign bus_buffer_io_lsu_free_c2_clk = io_lsu_free_c2_clk; // @[el2_lsu_bus_intf.scala 158:52]
  assign bus_buffer_io_lsu_busm_clk = io_lsu_busm_clk; // @[el2_lsu_bus_intf.scala 159:52]
  assign bus_buffer_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_intf.scala 160:52]
  assign bus_buffer_io_lsu_pkt_m_load = io_lsu_pkt_m_load; // @[el2_lsu_bus_intf.scala 161:52]
  assign bus_buffer_io_lsu_pkt_m_valid = io_lsu_pkt_m_valid; // @[el2_lsu_bus_intf.scala 161:52]
  assign bus_buffer_io_lsu_pkt_r_by = io_lsu_pkt_r_by; // @[el2_lsu_bus_intf.scala 162:52]
  assign bus_buffer_io_lsu_pkt_r_half = io_lsu_pkt_r_half; // @[el2_lsu_bus_intf.scala 162:52]
  assign bus_buffer_io_lsu_pkt_r_word = io_lsu_pkt_r_word; // @[el2_lsu_bus_intf.scala 162:52]
  assign bus_buffer_io_lsu_pkt_r_load = io_lsu_pkt_r_load; // @[el2_lsu_bus_intf.scala 162:52]
  assign bus_buffer_io_lsu_pkt_r_store = io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 162:52]
  assign bus_buffer_io_lsu_pkt_r_unsign = io_lsu_pkt_r_unsign; // @[el2_lsu_bus_intf.scala 162:52]
  assign bus_buffer_io_lsu_addr_m = io_lsu_addr_m; // @[el2_lsu_bus_intf.scala 163:52]
  assign bus_buffer_io_lsu_addr_r = io_lsu_addr_r; // @[el2_lsu_bus_intf.scala 165:52]
  assign bus_buffer_io_end_addr_r = io_end_addr_r; // @[el2_lsu_bus_intf.scala 166:52]
  assign bus_buffer_io_store_data_r = io_store_data_r; // @[el2_lsu_bus_intf.scala 167:52]
  assign bus_buffer_io_no_word_merge_r = _T_22 & _T_24; // @[el2_lsu_bus_intf.scala 168:52]
  assign bus_buffer_io_no_dword_merge_r = _T_22 & _T_30; // @[el2_lsu_bus_intf.scala 169:52]
  assign bus_buffer_io_lsu_busreq_m = io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 170:52]
  assign bus_buffer_io_ld_full_hit_m = _T_375 & _T_376; // @[el2_lsu_bus_intf.scala 171:52]
  assign bus_buffer_io_flush_m_up = io_flush_m_up; // @[el2_lsu_bus_intf.scala 172:52]
  assign bus_buffer_io_flush_r = io_flush_r; // @[el2_lsu_bus_intf.scala 173:52]
  assign bus_buffer_io_lsu_commit_r = io_lsu_commit_r; // @[el2_lsu_bus_intf.scala 174:52]
  assign bus_buffer_io_is_sideeffects_r = is_sideeffects_r; // @[el2_lsu_bus_intf.scala 175:52]
  assign bus_buffer_io_ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[el2_lsu_bus_intf.scala 176:52]
  assign bus_buffer_io_ldst_dual_m = ldst_dual_m; // @[el2_lsu_bus_intf.scala 177:52]
  assign bus_buffer_io_ldst_dual_r = ldst_dual_r; // @[el2_lsu_bus_intf.scala 178:52]
  assign bus_buffer_io_ldst_byteen_ext_m = _T_35[7:0]; // @[el2_lsu_bus_intf.scala 179:52]
  assign bus_buffer_io_lsu_axi_awready = io_lsu_axi_awready; // @[el2_lsu_bus_intf.scala 180:52]
  assign bus_buffer_io_lsu_axi_wready = io_lsu_axi_wready; // @[el2_lsu_bus_intf.scala 181:52]
  assign bus_buffer_io_lsu_axi_bvalid = io_lsu_axi_bvalid; // @[el2_lsu_bus_intf.scala 182:52]
  assign bus_buffer_io_lsu_axi_bresp = io_lsu_axi_bresp; // @[el2_lsu_bus_intf.scala 183:52]
  assign bus_buffer_io_lsu_axi_bid = io_lsu_axi_bid; // @[el2_lsu_bus_intf.scala 184:52]
  assign bus_buffer_io_lsu_axi_arready = io_lsu_axi_arready; // @[el2_lsu_bus_intf.scala 185:52]
  assign bus_buffer_io_lsu_axi_rvalid = io_lsu_axi_rvalid; // @[el2_lsu_bus_intf.scala 186:52]
  assign bus_buffer_io_lsu_axi_rid = io_lsu_axi_rid; // @[el2_lsu_bus_intf.scala 187:52]
  assign bus_buffer_io_lsu_axi_rdata = io_lsu_axi_rdata; // @[el2_lsu_bus_intf.scala 188:52]
  assign bus_buffer_io_lsu_axi_rresp = io_lsu_axi_rresp; // @[el2_lsu_bus_intf.scala 189:52]
  assign bus_buffer_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[el2_lsu_bus_intf.scala 190:52]
  assign bus_buffer_io_lsu_bus_clk_en_q = lsu_bus_clk_en_q; // @[el2_lsu_bus_intf.scala 191:52]
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
  ldst_dual_r = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_389 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_bus_clk_en_q = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ldst_dual_m = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  is_sideeffects_r = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ldst_dual_r = 1'h0;
  end
  if (reset) begin
    _T_389 = 1'h0;
  end
  if (reset) begin
    lsu_bus_clk_en_q = 1'h0;
  end
  if (reset) begin
    ldst_dual_m = 1'h0;
  end
  if (reset) begin
    is_sideeffects_r = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_r <= 1'h0;
    end else begin
      ldst_dual_r <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_389 <= 1'h0;
    end else begin
      _T_389 <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_bus_clk_en_q <= 1'h0;
    end else begin
      lsu_bus_clk_en_q <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_m <= 1'h0;
    end else begin
      ldst_dual_m <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      is_sideeffects_r <= 1'h0;
    end else begin
      is_sideeffects_r <= io_lsu_bus_clk_en;
    end
  end
endmodule
