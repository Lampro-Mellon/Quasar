module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 465:26]
  wire  clkhdr_CK; // @[el2_lib.scala 465:26]
  wire  clkhdr_EN; // @[el2_lib.scala 465:26]
  wire  clkhdr_SE; // @[el2_lib.scala 465:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 465:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 466:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 467:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 468:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 469:18]
endmodule
module el2_lsu_bus_buffer(
  input         clock,
  input         reset,
  input         io_scan_mode,
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
  output        io_lsu_bus_idle_any,
  output [3:0]  io_ld_byte_hit_buf_lo,
  output [3:0]  io_ld_byte_hit_buf_hi,
  output [31:0] io_ld_fwddata_buf_lo,
  output [31:0] io_ld_fwddata_buf_hi,
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
  output        io_lsu_axi_rready,
  output [3:0]  io_test,
  output [31:0] io_data_hi,
  output [31:0] io_data_lo,
  output [3:0]  io_data_en,
  output [1:0]  io_Cmdptr0,
  output [1:0]  io_Cmdptr1,
  output [1:0]  io_WrPtr1_r,
  output [1:0]  io_WrPtr1_m,
  output [63:0] io_wdata_in
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 485:23]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 485:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_buffer.scala 133:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_buffer.scala 134:46]
  reg [31:0] buf_addr_0; // @[el2_lib.scala 491:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 136:74]
  reg  _T_4348; // @[Reg.scala 27:20]
  reg  _T_4345; // @[Reg.scala 27:20]
  reg  _T_4342; // @[Reg.scala 27:20]
  reg  _T_4339; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4348,_T_4345,_T_4342,_T_4339}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 136:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[el2_lsu_bus_buffer.scala 136:129]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu_bus_buffer.scala 136:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 136:141]
  reg [31:0] buf_addr_1; // @[el2_lib.scala 491:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 136:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 136:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[el2_lsu_bus_buffer.scala 136:129]
  wire  _T_13 = _T_11 & _T_12; // @[el2_lsu_bus_buffer.scala 136:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 136:141]
  reg [31:0] buf_addr_2; // @[el2_lib.scala 491:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 136:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 136:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[el2_lsu_bus_buffer.scala 136:129]
  wire  _T_20 = _T_18 & _T_19; // @[el2_lsu_bus_buffer.scala 136:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 136:141]
  reg [31:0] buf_addr_3; // @[el2_lib.scala 491:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 136:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 136:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[el2_lsu_bus_buffer.scala 136:129]
  wire  _T_27 = _T_25 & _T_26; // @[el2_lsu_bus_buffer.scala 136:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 136:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 137:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 137:98]
  wire  _T_34 = _T_32 & _T_5; // @[el2_lsu_bus_buffer.scala 137:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 137:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 137:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 137:98]
  wire  _T_41 = _T_39 & _T_12; // @[el2_lsu_bus_buffer.scala 137:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 137:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 137:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 137:98]
  wire  _T_48 = _T_46 & _T_19; // @[el2_lsu_bus_buffer.scala 137:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 137:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 137:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 137:98]
  wire  _T_55 = _T_53 & _T_26; // @[el2_lsu_bus_buffer.scala 137:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 137:141]
  reg [2:0] _T_4375; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4375}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 566:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  reg [2:0] _T_4373; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4373}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 566:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  reg [2:0] _T_4371; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4371}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 566:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  reg [2:0] _T_4369; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4369}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 566:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 550:60]
  wire  _T_2610 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:94]
  wire  _T_4095 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4118 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4122 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1853; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1853}; // @[el2_lsu_bus_buffer.scala 408:13]
  wire  _T_4129 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 505:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_4130 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_4131 = obuf_merge & _T_4130; // @[el2_lsu_bus_buffer.scala 505:91]
  wire  _T_4132 = _T_4129 | _T_4131; // @[el2_lsu_bus_buffer.scala 505:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 402:54]
  wire  _T_4133 = _T_4132 & obuf_valid; // @[el2_lsu_bus_buffer.scala 505:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 401:55]
  wire  _T_4134 = _T_4133 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 505:148]
  wire  _GEN_280 = _T_4122 & _T_4134; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4118 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4095 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2611 = _T_2610 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 463:104]
  wire  _T_2612 = buf_ageQ_3[3] & _T_2611; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2606 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:94]
  wire  _T_3902 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3925 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3929 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3936 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 505:48]
  wire  _T_3937 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_3938 = obuf_merge & _T_3937; // @[el2_lsu_bus_buffer.scala 505:91]
  wire  _T_3939 = _T_3936 | _T_3938; // @[el2_lsu_bus_buffer.scala 505:77]
  wire  _T_3940 = _T_3939 & obuf_valid; // @[el2_lsu_bus_buffer.scala 505:135]
  wire  _T_3941 = _T_3940 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 505:148]
  wire  _GEN_204 = _T_3929 & _T_3941; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3925 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3902 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2607 = _T_2606 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 463:104]
  wire  _T_2608 = buf_ageQ_3[2] & _T_2607; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2602 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:94]
  wire  _T_3709 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3732 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3736 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3743 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 505:48]
  wire  _T_3744 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_3745 = obuf_merge & _T_3744; // @[el2_lsu_bus_buffer.scala 505:91]
  wire  _T_3746 = _T_3743 | _T_3745; // @[el2_lsu_bus_buffer.scala 505:77]
  wire  _T_3747 = _T_3746 & obuf_valid; // @[el2_lsu_bus_buffer.scala 505:135]
  wire  _T_3748 = _T_3747 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 505:148]
  wire  _GEN_128 = _T_3736 & _T_3748; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3732 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3709 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2603 = _T_2602 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 463:104]
  wire  _T_2604 = buf_ageQ_3[1] & _T_2603; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2598 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:94]
  wire  _T_3516 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3539 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3543 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3550 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 505:48]
  wire  _T_3551 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_3552 = obuf_merge & _T_3551; // @[el2_lsu_bus_buffer.scala 505:91]
  wire  _T_3553 = _T_3550 | _T_3552; // @[el2_lsu_bus_buffer.scala 505:77]
  wire  _T_3554 = _T_3553 & obuf_valid; // @[el2_lsu_bus_buffer.scala 505:135]
  wire  _T_3555 = _T_3554 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 505:148]
  wire  _GEN_52 = _T_3543 & _T_3555; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3539 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3516 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2599 = _T_2598 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 463:104]
  wire  _T_2600 = buf_ageQ_3[0] & _T_2599; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_3 = {_T_2612,_T_2608,_T_2604,_T_2600}; // @[Cat.scala 29:58]
  wire  _T_2711 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2713 = _T_2711 & _T_19; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2705 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2707 = _T_2705 & _T_12; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2699 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2701 = _T_2699 & _T_5; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2713,_T_2707,_T_2701}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 204:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 210:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[el2_lsu_bus_buffer.scala 210:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 294:24]
  wire  _T_514 = _T_513 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 210:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 210:99]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire  _T_545 = ld_addr_ibuf_hit_lo & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 215:48]
  wire  _T_547 = _T_545 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 215:65]
  wire [3:0] ld_byte_ibuf_hit_lo = {{3'd0}, _T_547}; // @[el2_lsu_bus_buffer.scala 215:25 el2_lsu_bus_buffer.scala 215:25 el2_lsu_bus_buffer.scala 215:25 el2_lsu_bus_buffer.scala 215:25]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 204:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 550:60]
  wire  _T_2593 = buf_ageQ_2[3] & _T_2611; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2589 = buf_ageQ_2[2] & _T_2607; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2585 = buf_ageQ_2[1] & _T_2603; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2581 = buf_ageQ_2[0] & _T_2599; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_2 = {_T_2593,_T_2589,_T_2585,_T_2581}; // @[Cat.scala 29:58]
  wire  _T_2690 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2692 = _T_2690 & _T_26; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2678 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2680 = _T_2678 & _T_12; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2672 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2674 = _T_2672 & _T_5; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_2 = {_T_2692,1'h0,_T_2680,_T_2674}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 550:60]
  wire  _T_2574 = buf_ageQ_1[3] & _T_2611; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2570 = buf_ageQ_1[2] & _T_2607; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2566 = buf_ageQ_1[1] & _T_2603; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2562 = buf_ageQ_1[0] & _T_2599; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_1 = {_T_2574,_T_2570,_T_2566,_T_2562}; // @[Cat.scala 29:58]
  wire  _T_2663 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2665 = _T_2663 & _T_26; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2657 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2659 = _T_2657 & _T_19; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2645 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2647 = _T_2645 & _T_5; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_1 = {_T_2665,_T_2659,1'h0,_T_2647}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 550:60]
  wire  _T_2555 = buf_ageQ_0[3] & _T_2611; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2551 = buf_ageQ_0[2] & _T_2607; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2547 = buf_ageQ_0[1] & _T_2603; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2543 = buf_ageQ_0[0] & _T_2599; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_0 = {_T_2555,_T_2551,_T_2547,_T_2543}; // @[Cat.scala 29:58]
  wire  _T_2636 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2638 = _T_2636 & _T_26; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2630 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2632 = _T_2630 & _T_19; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2624 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2626 = _T_2624 & _T_12; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_0 = {_T_2638,_T_2632,_T_2626,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_232 = |_T_231; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_233 = ~_T_232; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_237 = _T_234 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[el2_lsu_bus_buffer.scala 196:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 196:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_291 = |_T_290; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_292 = ~_T_291; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 204:150]
  wire  _T_296 = _T_293 & _T_295; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_283 = |_T_282; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_284 = ~_T_283; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_288 = _T_285 & _T_295; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_275 = |_T_274; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_276 = ~_T_275; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_280 = _T_277 & _T_295; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_267 = |_T_266; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_268 = ~_T_267; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_272 = _T_269 & _T_295; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[el2_lsu_bus_buffer.scala 196:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 196:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_326 = |_T_325; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_327 = ~_T_326; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 204:150]
  wire  _T_331 = _T_328 & _T_330; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_318 = |_T_317; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_319 = ~_T_318; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_323 = _T_320 & _T_330; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_310 = |_T_309; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_311 = ~_T_310; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_315 = _T_312 & _T_330; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_302 = |_T_301; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_303 = ~_T_302; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_307 = _T_304 & _T_330; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[el2_lsu_bus_buffer.scala 196:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 196:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_361 = |_T_360; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_362 = ~_T_361; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 204:150]
  wire  _T_366 = _T_363 & _T_365; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_353 = |_T_352; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_354 = ~_T_353; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_358 = _T_355 & _T_365; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_345 = |_T_344; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_346 = ~_T_345; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_350 = _T_347 & _T_365; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_337 = |_T_336; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_338 = ~_T_337; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_342 = _T_339 & _T_365; // @[el2_lsu_bus_buffer.scala 204:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[el2_lsu_bus_buffer.scala 196:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 196:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_396 = |_T_395; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_397 = ~_T_396; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 211:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[el2_lsu_bus_buffer.scala 211:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 211:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 211:99]
  wire  _T_549 = ld_addr_ibuf_hit_hi & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 216:48]
  wire  _T_551 = _T_549 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 216:65]
  wire [3:0] ld_byte_ibuf_hit_hi = {{3'd0}, _T_551}; // @[el2_lsu_bus_buffer.scala 216:25 el2_lsu_bus_buffer.scala 216:25 el2_lsu_bus_buffer.scala 216:25 el2_lsu_bus_buffer.scala 216:25]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 205:150]
  wire  _T_401 = _T_398 & _T_400; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_388 = |_T_387; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_389 = ~_T_388; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_393 = _T_390 & _T_400; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_380 = |_T_379; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_381 = ~_T_380; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_385 = _T_382 & _T_400; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_372 = |_T_371; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_373 = ~_T_372; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_377 = _T_374 & _T_400; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[el2_lsu_bus_buffer.scala 197:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 197:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_431 = |_T_430; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_432 = ~_T_431; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 205:150]
  wire  _T_436 = _T_433 & _T_435; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_423 = |_T_422; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_424 = ~_T_423; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_428 = _T_425 & _T_435; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_415 = |_T_414; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_416 = ~_T_415; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_420 = _T_417 & _T_435; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_407 = |_T_406; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_408 = ~_T_407; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_412 = _T_409 & _T_435; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[el2_lsu_bus_buffer.scala 197:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 197:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_466 = |_T_465; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_467 = ~_T_466; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 205:150]
  wire  _T_471 = _T_468 & _T_470; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_458 = |_T_457; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_459 = ~_T_458; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_463 = _T_460 & _T_470; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_450 = |_T_449; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_451 = ~_T_450; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_455 = _T_452 & _T_470; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_442 = |_T_441; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_443 = ~_T_442; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_447 = _T_444 & _T_470; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[el2_lsu_bus_buffer.scala 197:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 197:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 200:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 200:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_501 = |_T_500; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_502 = ~_T_501; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 205:150]
  wire  _T_506 = _T_503 & _T_505; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_493 = |_T_492; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_494 = ~_T_493; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_498 = _T_495 & _T_505; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_485 = |_T_484; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_486 = ~_T_485; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_490 = _T_487 & _T_505; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 205:122]
  wire  _T_477 = |_T_476; // @[el2_lsu_bus_buffer.scala 205:144]
  wire  _T_478 = ~_T_477; // @[el2_lsu_bus_buffer.scala 205:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[el2_lsu_bus_buffer.scala 205:97]
  wire  _T_482 = _T_479 & _T_505; // @[el2_lsu_bus_buffer.scala 205:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[el2_lsu_bus_buffer.scala 197:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 197:77]
  wire [2:0] _T_84 = {_T_82,_T_79,_T_76}; // @[Cat.scala 29:58]
  wire [7:0] _T_554 = ld_byte_hitvecfn_lo_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_0; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_354 = {{1'd0}, _T_554}; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [8:0] _T_556 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_559 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_355 = {{1'd0}, _T_559}; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [8:0] _T_561 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_564 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_356 = {{1'd0}, _T_564}; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [8:0] _T_566 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_569 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_357 = {{1'd0}, _T_569}; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [8:0] _T_571 = _GEN_357 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [8:0] _T_572 = _T_556 | _T_561; // @[el2_lsu_bus_buffer.scala 222:123]
  wire [8:0] _T_573 = _T_572 | _T_566; // @[el2_lsu_bus_buffer.scala 222:123]
  wire [8:0] _T_574 = _T_573 | _T_571; // @[el2_lsu_bus_buffer.scala 222:123]
  wire [7:0] _T_577 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_579 = _T_577 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 223:65]
  wire [7:0] _T_582 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_584 = _T_582 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 223:65]
  wire [7:0] _T_587 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_589 = _T_587 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 223:65]
  wire [7:0] _T_592 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_594 = _T_592 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 223:65]
  wire [7:0] _T_595 = _T_579 | _T_584; // @[el2_lsu_bus_buffer.scala 223:97]
  wire [7:0] _T_596 = _T_595 | _T_589; // @[el2_lsu_bus_buffer.scala 223:97]
  wire [7:0] _T_597 = _T_596 | _T_594; // @[el2_lsu_bus_buffer.scala 223:97]
  wire [7:0] _T_600 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_602 = _T_600 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 224:65]
  wire [7:0] _T_605 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_607 = _T_605 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 224:65]
  wire [7:0] _T_610 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_612 = _T_610 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 224:65]
  wire [7:0] _T_615 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_617 = _T_615 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 224:65]
  wire [7:0] _T_618 = _T_602 | _T_607; // @[el2_lsu_bus_buffer.scala 224:96]
  wire [7:0] _T_619 = _T_618 | _T_612; // @[el2_lsu_bus_buffer.scala 224:96]
  wire [7:0] _T_620 = _T_619 | _T_617; // @[el2_lsu_bus_buffer.scala 224:96]
  wire [7:0] _T_623 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_625 = _T_623 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 225:65]
  wire [7:0] _T_628 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_630 = _T_628 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 225:65]
  wire [7:0] _T_633 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_635 = _T_633 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 225:65]
  wire [7:0] _T_638 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_640 = _T_638 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 225:65]
  wire [7:0] _T_641 = _T_625 | _T_630; // @[el2_lsu_bus_buffer.scala 225:95]
  wire [7:0] _T_642 = _T_641 | _T_635; // @[el2_lsu_bus_buffer.scala 225:95]
  wire [7:0] _T_643 = _T_642 | _T_640; // @[el2_lsu_bus_buffer.scala 225:95]
  wire [32:0] _T_646 = {_T_574,_T_597,_T_620,_T_643}; // @[Cat.scala 29:58]
  wire [7:0] _T_649 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_358 = {{1'd0}, _T_649}; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [8:0] _T_651 = _GEN_358 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [7:0] _T_654 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_359 = {{1'd0}, _T_654}; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [8:0] _T_656 = _GEN_359 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [7:0] _T_659 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_360 = {{1'd0}, _T_659}; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [8:0] _T_661 = _GEN_360 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [7:0] _T_664 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_361 = {{1'd0}, _T_664}; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [8:0] _T_666 = _GEN_361 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 227:91]
  wire [8:0] _T_667 = _T_651 | _T_656; // @[el2_lsu_bus_buffer.scala 227:123]
  wire [8:0] _T_668 = _T_667 | _T_661; // @[el2_lsu_bus_buffer.scala 227:123]
  wire [8:0] _T_669 = _T_668 | _T_666; // @[el2_lsu_bus_buffer.scala 227:123]
  wire [7:0] _T_672 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_674 = _T_672 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_677 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_679 = _T_677 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_682 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_684 = _T_682 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_687 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_689 = _T_687 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_690 = _T_674 | _T_679; // @[el2_lsu_bus_buffer.scala 228:97]
  wire [7:0] _T_691 = _T_690 | _T_684; // @[el2_lsu_bus_buffer.scala 228:97]
  wire [7:0] _T_692 = _T_691 | _T_689; // @[el2_lsu_bus_buffer.scala 228:97]
  wire [7:0] _T_695 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_697 = _T_695 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_700 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_702 = _T_700 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_705 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_707 = _T_705 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_710 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_712 = _T_710 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_713 = _T_697 | _T_702; // @[el2_lsu_bus_buffer.scala 229:96]
  wire [7:0] _T_714 = _T_713 | _T_707; // @[el2_lsu_bus_buffer.scala 229:96]
  wire [7:0] _T_715 = _T_714 | _T_712; // @[el2_lsu_bus_buffer.scala 229:96]
  wire [7:0] _T_718 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_720 = _T_718 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 230:65]
  wire [7:0] _T_723 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_725 = _T_723 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 230:65]
  wire [7:0] _T_728 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_730 = _T_728 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 230:65]
  wire [7:0] _T_733 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_735 = _T_733 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 230:65]
  wire [7:0] _T_736 = _T_720 | _T_725; // @[el2_lsu_bus_buffer.scala 230:95]
  wire [7:0] _T_737 = _T_736 | _T_730; // @[el2_lsu_bus_buffer.scala 230:95]
  wire [7:0] _T_738 = _T_737 | _T_735; // @[el2_lsu_bus_buffer.scala 230:95]
  wire [32:0] _T_741 = {_T_669,_T_692,_T_715,_T_738}; // @[Cat.scala 29:58]
  wire [3:0] _T_742 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_743 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_744 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_745 = _T_742 | _T_743; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_745 | _T_744; // @[Mux.scala 27:72]
  wire  _T_748 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 237:55]
  wire  _T_750 = io_lsu_addr_r[1:0] == 2'h1; // @[el2_lsu_bus_buffer.scala 238:55]
  wire [3:0] _T_752 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_754 = io_lsu_addr_r[1:0] == 2'h2; // @[el2_lsu_bus_buffer.scala 239:55]
  wire [3:0] _T_756 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_758 = io_lsu_addr_r[1:0] == 2'h3; // @[el2_lsu_bus_buffer.scala 240:55]
  wire [3:0] _T_760 = {1'h0,ldst_byteen_r[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_762 = _T_750 ? _T_752 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_763 = _T_754 ? _T_756 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_764 = _T_758 ? _T_760 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_766 = _T_762 | _T_763; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_hi_r = _T_766 | _T_764; // @[Mux.scala 27:72]
  wire [3:0] _T_773 = {ldst_byteen_r[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_777 = {ldst_byteen_r[1:0],2'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_781 = {ldst_byteen_r[0],3'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_782 = _T_748 ? ldst_byteen_r : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_783 = _T_750 ? _T_773 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_784 = _T_754 ? _T_777 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_785 = _T_758 ? _T_781 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_786 = _T_782 | _T_783; // @[Mux.scala 27:72]
  wire [3:0] _T_787 = _T_786 | _T_784; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_lo_r = _T_787 | _T_785; // @[Mux.scala 27:72]
  wire [31:0] _T_794 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_798 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_802 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
  wire [31:0] _T_804 = _T_750 ? _T_794 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_805 = _T_754 ? _T_798 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_806 = _T_758 ? _T_802 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_808 = _T_804 | _T_805; // @[Mux.scala 27:72]
  wire [31:0] store_data_hi_r = _T_808 | _T_806; // @[Mux.scala 27:72]
  wire [31:0] _T_815 = {io_store_data_r[23:0],8'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_819 = {io_store_data_r[15:0],16'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_823 = {io_store_data_r[7:0],24'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_824 = _T_748 ? io_store_data_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_825 = _T_750 ? _T_815 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_826 = _T_754 ? _T_819 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_827 = _T_758 ? _T_823 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_828 = _T_824 | _T_825; // @[Mux.scala 27:72]
  wire [31:0] _T_829 = _T_828 | _T_826; // @[Mux.scala 27:72]
  wire [31:0] store_data_lo_r = _T_829 | _T_827; // @[Mux.scala 27:72]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 258:40]
  wire  _T_836 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 260:26]
  wire  _T_837 = io_lsu_pkt_r_word & _T_748; // @[Mux.scala 27:72]
  wire  _T_838 = io_lsu_pkt_r_half & _T_836; // @[Mux.scala 27:72]
  wire  _T_840 = _T_837 | _T_838; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_840 | io_lsu_pkt_r_by; // @[Mux.scala 27:72]
  wire  _T_842 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 262:55]
  wire  _T_843 = io_lsu_busreq_r & _T_842; // @[el2_lsu_bus_buffer.scala 262:34]
  wire  _T_844 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 262:79]
  wire  ibuf_byp = _T_843 & _T_844; // @[el2_lsu_bus_buffer.scala 262:77]
  wire  _T_845 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 263:36]
  wire  _T_846 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 263:56]
  wire  ibuf_wr_en = _T_845 & _T_846; // @[el2_lsu_bus_buffer.scala 263:54]
  wire  _T_847 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 265:36]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 307:59]
  wire  _T_856 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 271:62]
  wire  _T_857 = ibuf_wr_en | _T_856; // @[el2_lsu_bus_buffer.scala 271:48]
  wire  _T_913 = _T_845 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 289:54]
  wire  _T_914 = _T_913 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 289:75]
  wire  _T_915 = _T_914 & ibuf_write; // @[el2_lsu_bus_buffer.scala 289:88]
  wire  _T_918 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 289:124]
  wire  _T_919 = _T_915 & _T_918; // @[el2_lsu_bus_buffer.scala 289:101]
  wire  _T_920 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 289:147]
  wire  _T_921 = _T_919 & _T_920; // @[el2_lsu_bus_buffer.scala 289:145]
  wire  _T_922 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 289:170]
  wire  ibuf_merge_en = _T_921 & _T_922; // @[el2_lsu_bus_buffer.scala 289:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 290:20]
  wire  _T_858 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 271:98]
  wire  _T_859 = ~_T_858; // @[el2_lsu_bus_buffer.scala 271:82]
  wire  _T_860 = _T_857 & _T_859; // @[el2_lsu_bus_buffer.scala 271:80]
  wire  _T_861 = _T_860 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 272:5]
  wire  _T_849 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 266:44]
  wire  _T_850 = io_lsu_busreq_m & _T_849; // @[el2_lsu_bus_buffer.scala 266:42]
  wire  _T_851 = _T_850 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 266:61]
  wire  _T_854 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 266:115]
  wire  _T_855 = io_lsu_pkt_m_load | _T_854; // @[el2_lsu_bus_buffer.scala 266:95]
  wire  ibuf_force_drain = _T_851 & _T_855; // @[el2_lsu_bus_buffer.scala 266:74]
  wire  _T_862 = _T_861 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 272:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_863 = _T_862 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 272:35]
  wire  _T_864 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 272:55]
  wire  _T_865 = _T_863 | _T_864; // @[el2_lsu_bus_buffer.scala 272:53]
  wire  _T_866 = _T_865 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 272:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_866; // @[el2_lsu_bus_buffer.scala 271:32]
  wire  _T_848 = ibuf_drain_vld & _T_847; // @[el2_lsu_bus_buffer.scala 265:34]
  wire  ibuf_rst = _T_848 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 265:49]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 667:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 666:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_873 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 281:77]
  reg [31:0] ibuf_data; // @[el2_lib.scala 491:16]
  wire [7:0] _T_881 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_883 = _T_858 ? _T_881 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [7:0] _T_888 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_890 = _T_858 ? _T_888 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [7:0] _T_895 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_897 = _T_858 ? _T_895 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [7:0] _T_902 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_904 = _T_858 ? _T_902 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [23:0] _T_906 = {_T_904,_T_897,_T_890}; // @[Cat.scala 29:58]
  wire  _T_907 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 287:59]
  wire [2:0] _T_910 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 287:93]
  wire  _T_925 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 291:65]
  wire  _T_926 = ibuf_merge_en & _T_925; // @[el2_lsu_bus_buffer.scala 291:63]
  wire  _T_929 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 291:96]
  wire  _T_931 = _T_926 ? _T_929 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 291:48]
  wire  _T_936 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 291:96]
  wire  _T_938 = _T_926 ? _T_936 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 291:48]
  wire  _T_943 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 291:96]
  wire  _T_945 = _T_926 ? _T_943 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 291:48]
  wire  _T_950 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 291:96]
  wire  _T_952 = _T_926 ? _T_950 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 291:48]
  wire [3:0] ibuf_byteen_out = {_T_952,_T_945,_T_938,_T_931}; // @[Cat.scala 29:58]
  wire [7:0] _T_962 = _T_926 ? _T_881 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 292:45]
  wire [7:0] _T_970 = _T_926 ? _T_888 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 292:45]
  wire [7:0] _T_978 = _T_926 ? _T_895 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 292:45]
  wire [7:0] _T_986 = _T_926 ? _T_902 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 292:45]
  wire [31:0] ibuf_data_out = {_T_986,_T_978,_T_970,_T_962}; // @[Cat.scala 29:58]
  wire  _T_989 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 294:28]
  wire  _T_990 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 294:63]
  wire  _T_995 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 295:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4429 = buf_write[3] & _T_2610; // @[el2_lsu_bus_buffer.scala 572:64]
  wire  _T_4430 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 572:91]
  wire  _T_4431 = _T_4429 & _T_4430; // @[el2_lsu_bus_buffer.scala 572:89]
  wire  _T_4424 = buf_write[2] & _T_2606; // @[el2_lsu_bus_buffer.scala 572:64]
  wire  _T_4425 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 572:91]
  wire  _T_4426 = _T_4424 & _T_4425; // @[el2_lsu_bus_buffer.scala 572:89]
  wire [1:0] _T_4432 = _T_4431 + _T_4426; // @[el2_lsu_bus_buffer.scala 572:142]
  wire  _T_4419 = buf_write[1] & _T_2602; // @[el2_lsu_bus_buffer.scala 572:64]
  wire  _T_4420 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 572:91]
  wire  _T_4421 = _T_4419 & _T_4420; // @[el2_lsu_bus_buffer.scala 572:89]
  wire [1:0] _GEN_362 = {{1'd0}, _T_4421}; // @[el2_lsu_bus_buffer.scala 572:142]
  wire [2:0] _T_4433 = _T_4432 + _GEN_362; // @[el2_lsu_bus_buffer.scala 572:142]
  wire  _T_4414 = buf_write[0] & _T_2598; // @[el2_lsu_bus_buffer.scala 572:64]
  wire  _T_4415 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 572:91]
  wire  _T_4416 = _T_4414 & _T_4415; // @[el2_lsu_bus_buffer.scala 572:89]
  wire [2:0] _GEN_363 = {{2'd0}, _T_4416}; // @[el2_lsu_bus_buffer.scala 572:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4433 + _GEN_363; // @[el2_lsu_bus_buffer.scala 572:142]
  wire  _T_1021 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 318:43]
  wire  _T_4446 = _T_2610 & _T_4430; // @[el2_lsu_bus_buffer.scala 573:73]
  wire  _T_4443 = _T_2606 & _T_4425; // @[el2_lsu_bus_buffer.scala 573:73]
  wire [1:0] _T_4447 = _T_4446 + _T_4443; // @[el2_lsu_bus_buffer.scala 573:126]
  wire  _T_4440 = _T_2602 & _T_4420; // @[el2_lsu_bus_buffer.scala 573:73]
  wire [1:0] _GEN_364 = {{1'd0}, _T_4440}; // @[el2_lsu_bus_buffer.scala 573:126]
  wire [2:0] _T_4448 = _T_4447 + _GEN_364; // @[el2_lsu_bus_buffer.scala 573:126]
  wire  _T_4437 = _T_2598 & _T_4415; // @[el2_lsu_bus_buffer.scala 573:73]
  wire [2:0] _GEN_365 = {{2'd0}, _T_4437}; // @[el2_lsu_bus_buffer.scala 573:126]
  wire [3:0] buf_numvld_cmd_any = _T_4448 + _GEN_365; // @[el2_lsu_bus_buffer.scala 573:126]
  wire  _T_1022 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 318:72]
  wire  _T_1023 = _T_1021 & _T_1022; // @[el2_lsu_bus_buffer.scala 318:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 417:54]
  wire  _T_1024 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 318:97]
  wire  _T_1025 = _T_1023 & _T_1024; // @[el2_lsu_bus_buffer.scala 318:80]
  wire  _T_1027 = _T_1025 & _T_922; // @[el2_lsu_bus_buffer.scala 318:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1040 = ~buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 319:31]
  wire  _T_1041 = _T_1027 & _T_1040; // @[el2_lsu_bus_buffer.scala 319:29]
  reg  _T_4318; // @[Reg.scala 27:20]
  reg  _T_4315; // @[Reg.scala 27:20]
  reg  _T_4312; // @[Reg.scala 27:20]
  reg  _T_4309; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4318,_T_4315,_T_4312,_T_4309}; // @[Cat.scala 29:58]
  wire  _T_1058 = ~buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 320:5]
  wire  _T_1059 = _T_1041 & _T_1058; // @[el2_lsu_bus_buffer.scala 319:140]
  wire  _T_1070 = _T_850 & _T_844; // @[el2_lsu_bus_buffer.scala 322:58]
  wire  _T_1072 = _T_1070 & _T_1022; // @[el2_lsu_bus_buffer.scala 322:72]
  wire  _T_1090 = io_lsu_addr_m[31:2] != buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 322:123]
  wire  obuf_force_wr_en = _T_1072 & _T_1090; // @[el2_lsu_bus_buffer.scala 322:101]
  wire  _T_1060 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 320:119]
  wire  obuf_wr_wait = _T_1059 & _T_1060; // @[el2_lsu_bus_buffer.scala 320:117]
  wire  _T_1061 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 321:75]
  wire  _T_1062 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 321:95]
  wire  _T_1063 = _T_1061 & _T_1062; // @[el2_lsu_bus_buffer.scala 321:79]
  wire [2:0] _T_1065 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 321:121]
  wire  _T_4465 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 574:63]
  wire  _T_4469 = _T_4465 | _T_4446; // @[el2_lsu_bus_buffer.scala 574:74]
  wire  _T_4460 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 574:63]
  wire  _T_4464 = _T_4460 | _T_4443; // @[el2_lsu_bus_buffer.scala 574:74]
  wire [1:0] _T_4470 = _T_4469 + _T_4464; // @[el2_lsu_bus_buffer.scala 574:154]
  wire  _T_4455 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 574:63]
  wire  _T_4459 = _T_4455 | _T_4440; // @[el2_lsu_bus_buffer.scala 574:74]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4459}; // @[el2_lsu_bus_buffer.scala 574:154]
  wire [2:0] _T_4471 = _T_4470 + _GEN_366; // @[el2_lsu_bus_buffer.scala 574:154]
  wire  _T_4450 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 574:63]
  wire  _T_4454 = _T_4450 | _T_4437; // @[el2_lsu_bus_buffer.scala 574:74]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4454}; // @[el2_lsu_bus_buffer.scala 574:154]
  wire [3:0] buf_numvld_pend_any = _T_4471 + _GEN_367; // @[el2_lsu_bus_buffer.scala 574:154]
  wire  _T_1092 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 324:53]
  wire  _T_1093 = ibuf_byp & _T_1092; // @[el2_lsu_bus_buffer.scala 324:31]
  wire  _T_1094 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 324:64]
  wire  _T_1095 = _T_1094 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 324:84]
  wire  ibuf_buf_byp = _T_1093 & _T_1095; // @[el2_lsu_bus_buffer.scala 324:61]
  wire  _T_1096 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 339:32]
  wire  _T_4761 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4763 = _T_4761 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4764 = _T_4763 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  _T_4765 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4767 = _T_4765 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4768 = _T_4767 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  _T_4777 = _T_4764 | _T_4768; // @[el2_lsu_bus_buffer.scala 603:141]
  wire  _T_4769 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4771 = _T_4769 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4772 = _T_4771 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  _T_4778 = _T_4777 | _T_4772; // @[el2_lsu_bus_buffer.scala 603:141]
  wire  _T_4773 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4775 = _T_4773 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4776 = _T_4775 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  bus_sideeffect_pend = _T_4778 | _T_4776; // @[el2_lsu_bus_buffer.scala 603:141]
  wire  _T_1097 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 339:74]
  wire  _T_1098 = ~_T_1097; // @[el2_lsu_bus_buffer.scala 339:52]
  wire  _T_1099 = _T_1096 & _T_1098; // @[el2_lsu_bus_buffer.scala 339:50]
  wire  _T_1983 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1984 = ~_T_1983; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1986 = _T_1984 & _T_2610; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1988 = _T_1986 & _T_4430; // @[el2_lsu_bus_buffer.scala 429:88]
  wire  _T_1977 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1978 = ~_T_1977; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1980 = _T_1978 & _T_2606; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1982 = _T_1980 & _T_4425; // @[el2_lsu_bus_buffer.scala 429:88]
  wire  _T_1971 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1972 = ~_T_1971; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1974 = _T_1972 & _T_2602; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1976 = _T_1974 & _T_4420; // @[el2_lsu_bus_buffer.scala 429:88]
  wire  _T_1965 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1966 = ~_T_1965; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1968 = _T_1966 & _T_2598; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1970 = _T_1968 & _T_4415; // @[el2_lsu_bus_buffer.scala 429:88]
  wire [3:0] CmdPtr0Dec = {_T_1988,_T_1982,_T_1976,_T_1970}; // @[Cat.scala 29:58]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 434:31]
  wire  _T_1113 = _T_2598 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 340:47]
  wire [3:0] _T_1116 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1133 = ~_T_1116[0]; // @[el2_lsu_bus_buffer.scala 341:23]
  wire  _T_1134 = _T_1113 & _T_1133; // @[el2_lsu_bus_buffer.scala 341:21]
  wire  _T_1151 = buf_sideeffect[0] & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 341:141]
  wire  _T_1152 = ~_T_1151; // @[el2_lsu_bus_buffer.scala 341:105]
  wire  _T_1153 = _T_1134 & _T_1152; // @[el2_lsu_bus_buffer.scala 341:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1156 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1175 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1192 = _T_1156[0] & _T_1175[0]; // @[el2_lsu_bus_buffer.scala 342:77]
  wire  _T_1209 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 342:150]
  wire  _T_1210 = _T_1192 & _T_1209; // @[el2_lsu_bus_buffer.scala 342:148]
  wire  _T_1211 = ~_T_1210; // @[el2_lsu_bus_buffer.scala 342:8]
  wire [3:0] _T_2024 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 430:62]
  wire [3:0] _T_2025 = buf_age_3 & _T_2024; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2026 = |_T_2025; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2027 = ~_T_2026; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2029 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2030 = _T_2027 & _T_2029; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2032 = _T_2030 & _T_2610; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2034 = _T_2032 & _T_4430; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] _T_2014 = buf_age_2 & _T_2024; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2015 = |_T_2014; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2016 = ~_T_2015; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2018 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2019 = _T_2016 & _T_2018; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2021 = _T_2019 & _T_2606; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2023 = _T_2021 & _T_4425; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] _T_2003 = buf_age_1 & _T_2024; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2004 = |_T_2003; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2005 = ~_T_2004; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2007 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2008 = _T_2005 & _T_2007; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2010 = _T_2008 & _T_2602; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2012 = _T_2010 & _T_4420; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] _T_1992 = buf_age_0 & _T_2024; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_1993 = |_T_1992; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_1994 = ~_T_1993; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_1996 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_1997 = _T_1994 & _T_1996; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_1999 = _T_1997 & _T_2598; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2001 = _T_1999 & _T_4415; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] CmdPtr1Dec = {_T_2034,_T_2023,_T_2012,_T_2001}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 435:31]
  wire  _T_1212 = _T_1211 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 342:181]
  wire [3:0] _T_1215 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1232 = _T_1212 | _T_1215[0]; // @[el2_lsu_bus_buffer.scala 342:197]
  wire  _T_1233 = _T_1232 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 342:269]
  wire  _T_1234 = _T_1153 & _T_1233; // @[el2_lsu_bus_buffer.scala 341:164]
  wire  _T_1235 = _T_1099 | _T_1234; // @[el2_lsu_bus_buffer.scala 339:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 404:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 405:55]
  wire  _T_4836 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 607:54]
  wire  _T_4837 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 607:75]
  wire  _T_4839 = _T_4836 ? _T_4837 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 607:39]
  wire  bus_cmd_ready = obuf_write ? _T_4839 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 607:23]
  wire  _T_1236 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 343:48]
  wire  _T_1237 = bus_cmd_ready | _T_1236; // @[el2_lsu_bus_buffer.scala 343:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1238 = _T_1237 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 343:60]
  wire  _T_1239 = _T_1235 & _T_1238; // @[el2_lsu_bus_buffer.scala 343:29]
  wire  _T_1240 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 343:77]
  wire  _T_1241 = _T_1239 & _T_1240; // @[el2_lsu_bus_buffer.scala 343:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4784 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4785 = obuf_valid & _T_4784; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4787 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4788 = obuf_merge & _T_4787; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4789 = _T_3550 | _T_4788; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4790 = ~_T_4789; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4791 = _T_4785 & _T_4790; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4828 = _T_4761 & _T_4791; // @[Mux.scala 27:72]
  wire  _T_4796 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4797 = obuf_valid & _T_4796; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4799 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4800 = obuf_merge & _T_4799; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4801 = _T_3743 | _T_4800; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4802 = ~_T_4801; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4803 = _T_4797 & _T_4802; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4829 = _T_4765 & _T_4803; // @[Mux.scala 27:72]
  wire  _T_4832 = _T_4828 | _T_4829; // @[Mux.scala 27:72]
  wire  _T_4808 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4809 = obuf_valid & _T_4808; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4811 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4812 = obuf_merge & _T_4811; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4813 = _T_3936 | _T_4812; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4814 = ~_T_4813; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4815 = _T_4809 & _T_4814; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4830 = _T_4769 & _T_4815; // @[Mux.scala 27:72]
  wire  _T_4833 = _T_4832 | _T_4830; // @[Mux.scala 27:72]
  wire  _T_4820 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4821 = obuf_valid & _T_4820; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4823 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4824 = obuf_merge & _T_4823; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4825 = _T_4129 | _T_4824; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4826 = ~_T_4825; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4827 = _T_4821 & _T_4826; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4831 = _T_4773 & _T_4827; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4833 | _T_4831; // @[Mux.scala 27:72]
  wire  _T_1244 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 343:118]
  wire  _T_1245 = _T_1241 & _T_1244; // @[el2_lsu_bus_buffer.scala 343:116]
  wire  obuf_wr_en = _T_1245 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 343:142]
  wire  _T_1247 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 345:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 608:39]
  wire  _T_4843 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 610:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 609:39]
  wire  _T_4844 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 610:70]
  wire  _T_4845 = _T_4843 & _T_4844; // @[el2_lsu_bus_buffer.scala 610:52]
  wire  _T_4846 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 610:111]
  wire  bus_cmd_sent = _T_4845 | _T_4846; // @[el2_lsu_bus_buffer.scala 610:89]
  wire  _T_1248 = bus_cmd_sent | _T_1247; // @[el2_lsu_bus_buffer.scala 345:33]
  wire  _T_1249 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 345:65]
  wire  _T_1250 = _T_1248 & _T_1249; // @[el2_lsu_bus_buffer.scala 345:63]
  wire  _T_1251 = _T_1250 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 345:77]
  wire  obuf_rst = _T_1251 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 345:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : buf_write[0]; // @[el2_lsu_bus_buffer.scala 346:26]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : buf_addr_0; // @[el2_lsu_bus_buffer.scala 348:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : buf_sz_0; // @[el2_lsu_bus_buffer.scala 351:23]
  wire  _T_1309 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 360:39]
  wire  _T_1310 = ~_T_1309; // @[el2_lsu_bus_buffer.scala 360:26]
  wire  _T_1316 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 364:72]
  wire  _T_1319 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 364:98]
  wire  _T_1320 = obuf_sz_in[0] & _T_1319; // @[el2_lsu_bus_buffer.scala 364:96]
  wire  _T_1321 = _T_1316 | _T_1320; // @[el2_lsu_bus_buffer.scala 364:79]
  wire  _T_1324 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 364:153]
  wire  _T_1325 = ~_T_1324; // @[el2_lsu_bus_buffer.scala 364:134]
  wire  _T_1326 = obuf_sz_in[1] & _T_1325; // @[el2_lsu_bus_buffer.scala 364:132]
  wire  _T_1327 = _T_1321 | _T_1326; // @[el2_lsu_bus_buffer.scala 364:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1327; // @[el2_lsu_bus_buffer.scala 364:28]
  wire  _T_1344 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 378:40]
  wire  _T_1345 = _T_1344 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 378:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1346 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 378:80]
  wire  _T_1347 = _T_1345 & _T_1346; // @[el2_lsu_bus_buffer.scala 378:78]
  wire  _T_1348 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 378:99]
  wire  _T_1349 = _T_1347 & _T_1348; // @[el2_lsu_bus_buffer.scala 378:97]
  wire  _T_1350 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 378:113]
  wire  _T_1351 = _T_1349 & _T_1350; // @[el2_lsu_bus_buffer.scala 378:111]
  wire  _T_1352 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 378:130]
  wire  _T_1353 = _T_1351 & _T_1352; // @[el2_lsu_bus_buffer.scala 378:128]
  wire  _T_1354 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 379:20]
  wire  _T_1355 = obuf_valid & _T_1354; // @[el2_lsu_bus_buffer.scala 379:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 406:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 611:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 407:55]
  wire  _T_1356 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 379:90]
  wire  _T_1357 = bus_rsp_read & _T_1356; // @[el2_lsu_bus_buffer.scala 379:70]
  wire  _T_1358 = ~_T_1357; // @[el2_lsu_bus_buffer.scala 379:55]
  wire  _T_1359 = obuf_rdrsp_pend & _T_1358; // @[el2_lsu_bus_buffer.scala 379:53]
  wire  _T_1360 = _T_1355 | _T_1359; // @[el2_lsu_bus_buffer.scala 379:34]
  wire  obuf_nosend_in = _T_1353 & _T_1360; // @[el2_lsu_bus_buffer.scala 378:165]
  wire  _T_1328 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 372:44]
  wire  _T_1329 = obuf_wr_en & _T_1328; // @[el2_lsu_bus_buffer.scala 372:42]
  wire  _T_1330 = ~_T_1329; // @[el2_lsu_bus_buffer.scala 372:29]
  wire  _T_1331 = _T_1330 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 372:61]
  wire  _T_1335 = _T_1331 & _T_1358; // @[el2_lsu_bus_buffer.scala 372:79]
  wire  _T_1337 = bus_cmd_sent & _T_1348; // @[el2_lsu_bus_buffer.scala 373:20]
  wire  _T_1338 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 373:37]
  wire  _T_1339 = _T_1337 & _T_1338; // @[el2_lsu_bus_buffer.scala 373:35]
  wire  _T_1341 = bus_cmd_sent | _T_1348; // @[el2_lsu_bus_buffer.scala 375:44]
  wire [7:0] _T_1363 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1364 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1365 = io_lsu_addr_r[2] ? _T_1363 : _T_1364; // @[el2_lsu_bus_buffer.scala 380:46]
  wire [7:0] _T_1392 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1405 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1406 = buf_addr_0[2] ? _T_1392 : _T_1405; // @[el2_lsu_bus_buffer.scala 381:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1365 : _T_1406; // @[el2_lsu_bus_buffer.scala 380:28]
  wire [7:0] _T_1408 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1409 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1410 = io_end_addr_r[2] ? _T_1408 : _T_1409; // @[el2_lsu_bus_buffer.scala 382:46]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1410 : _T_1406; // @[el2_lsu_bus_buffer.scala 382:28]
  wire [63:0] _T_1453 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1454 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1455 = io_lsu_addr_r[2] ? _T_1453 : _T_1454; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [63:0] _T_1482 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1495 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1496 = buf_addr_0[2] ? _T_1482 : _T_1495; // @[el2_lsu_bus_buffer.scala 386:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1455 : _T_1496; // @[el2_lsu_bus_buffer.scala 385:26]
  wire [63:0] _T_1498 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1499 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1500 = io_lsu_addr_r[2] ? _T_1498 : _T_1499; // @[el2_lsu_bus_buffer.scala 387:44]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1500 : _T_1496; // @[el2_lsu_bus_buffer.scala 387:26]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire  _T_1841 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 399:19]
  wire  obuf_merge_en = _T_1841 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 399:35]
  wire  _T_1544 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1545 = obuf_byteen0_in[0] | _T_1544; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1548 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1549 = obuf_byteen0_in[1] | _T_1548; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1552 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1553 = obuf_byteen0_in[2] | _T_1552; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1556 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1557 = obuf_byteen0_in[3] | _T_1556; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1560 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1561 = obuf_byteen0_in[4] | _T_1560; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1564 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1565 = obuf_byteen0_in[5] | _T_1564; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1568 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1569 = obuf_byteen0_in[6] | _T_1568; // @[el2_lsu_bus_buffer.scala 389:63]
  wire  _T_1572 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 389:80]
  wire  _T_1573 = obuf_byteen0_in[7] | _T_1572; // @[el2_lsu_bus_buffer.scala 389:63]
  wire [7:0] obuf_byteen_in = {_T_1573,_T_1569,_T_1565,_T_1561,_T_1557,_T_1553,_T_1549,_T_1545}; // @[Cat.scala 29:58]
  wire [7:0] _T_1584 = _T_1544 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1589 = _T_1548 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1594 = _T_1552 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1599 = _T_1556 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1604 = _T_1560 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1609 = _T_1564 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1614 = _T_1568 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [7:0] _T_1619 = _T_1572 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [55:0] _T_1625 = {_T_1619,_T_1614,_T_1609,_T_1604,_T_1599,_T_1594,_T_1589}; // @[Cat.scala 29:58]
  wire  _T_1844 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 402:58]
  wire  _T_1845 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 402:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 491:16]
  wire  _T_1858 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 419:59]
  wire  _T_1859 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 419:97]
  wire  _T_1860 = ibuf_valid & _T_1859; // @[el2_lsu_bus_buffer.scala 419:86]
  wire  _T_1861 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 420:33]
  wire  _T_1862 = io_lsu_busreq_r & _T_1861; // @[el2_lsu_bus_buffer.scala 420:22]
  wire  _T_1863 = _T_1860 | _T_1862; // @[el2_lsu_bus_buffer.scala 419:106]
  wire  _T_1864 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1865 = io_ldst_dual_r & _T_1864; // @[el2_lsu_bus_buffer.scala 420:60]
  wire  _T_1866 = _T_1863 | _T_1865; // @[el2_lsu_bus_buffer.scala 420:42]
  wire  _T_1867 = ~_T_1866; // @[el2_lsu_bus_buffer.scala 419:72]
  wire  _T_1868 = _T_1858 & _T_1867; // @[el2_lsu_bus_buffer.scala 419:70]
  wire  _T_1869 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 419:59]
  wire  _T_1870 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 419:97]
  wire  _T_1871 = ibuf_valid & _T_1870; // @[el2_lsu_bus_buffer.scala 419:86]
  wire  _T_1872 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 420:33]
  wire  _T_1873 = io_lsu_busreq_r & _T_1872; // @[el2_lsu_bus_buffer.scala 420:22]
  wire  _T_1874 = _T_1871 | _T_1873; // @[el2_lsu_bus_buffer.scala 419:106]
  wire  _T_1875 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1876 = io_ldst_dual_r & _T_1875; // @[el2_lsu_bus_buffer.scala 420:60]
  wire  _T_1877 = _T_1874 | _T_1876; // @[el2_lsu_bus_buffer.scala 420:42]
  wire  _T_1878 = ~_T_1877; // @[el2_lsu_bus_buffer.scala 419:72]
  wire  _T_1879 = _T_1869 & _T_1878; // @[el2_lsu_bus_buffer.scala 419:70]
  wire  _T_1880 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 419:59]
  wire  _T_1881 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 419:97]
  wire  _T_1882 = ibuf_valid & _T_1881; // @[el2_lsu_bus_buffer.scala 419:86]
  wire  _T_1883 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 420:33]
  wire  _T_1884 = io_lsu_busreq_r & _T_1883; // @[el2_lsu_bus_buffer.scala 420:22]
  wire  _T_1885 = _T_1882 | _T_1884; // @[el2_lsu_bus_buffer.scala 419:106]
  wire  _T_1886 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1887 = io_ldst_dual_r & _T_1886; // @[el2_lsu_bus_buffer.scala 420:60]
  wire  _T_1888 = _T_1885 | _T_1887; // @[el2_lsu_bus_buffer.scala 420:42]
  wire  _T_1889 = ~_T_1888; // @[el2_lsu_bus_buffer.scala 419:72]
  wire  _T_1890 = _T_1880 & _T_1889; // @[el2_lsu_bus_buffer.scala 419:70]
  wire  _T_1891 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 419:59]
  wire  _T_1892 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 419:97]
  wire  _T_1893 = ibuf_valid & _T_1892; // @[el2_lsu_bus_buffer.scala 419:86]
  wire  _T_1894 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 420:33]
  wire  _T_1895 = io_lsu_busreq_r & _T_1894; // @[el2_lsu_bus_buffer.scala 420:22]
  wire  _T_1896 = _T_1893 | _T_1895; // @[el2_lsu_bus_buffer.scala 419:106]
  wire  _T_1897 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1898 = io_ldst_dual_r & _T_1897; // @[el2_lsu_bus_buffer.scala 420:60]
  wire  _T_1899 = _T_1896 | _T_1898; // @[el2_lsu_bus_buffer.scala 420:42]
  wire  _T_1900 = ~_T_1899; // @[el2_lsu_bus_buffer.scala 419:72]
  wire  _T_1901 = _T_1891 & _T_1900; // @[el2_lsu_bus_buffer.scala 419:70]
  wire [1:0] _T_1902 = _T_1901 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1903 = _T_1890 ? 2'h2 : _T_1902; // @[Mux.scala 98:16]
  wire [1:0] _T_1904 = _T_1879 ? 2'h1 : _T_1903; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1868 ? 2'h0 : _T_1904; // @[Mux.scala 98:16]
  wire  _T_1909 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 423:33]
  wire  _T_1910 = io_lsu_busreq_m & _T_1909; // @[el2_lsu_bus_buffer.scala 423:22]
  wire  _T_1911 = _T_1860 | _T_1910; // @[el2_lsu_bus_buffer.scala 422:106]
  wire  _T_1914 = _T_1911 | _T_1862; // @[el2_lsu_bus_buffer.scala 423:42]
  wire  _T_1917 = _T_1914 | _T_1865; // @[el2_lsu_bus_buffer.scala 423:83]
  wire  _T_1918 = ~_T_1917; // @[el2_lsu_bus_buffer.scala 422:72]
  wire  _T_1919 = _T_1858 & _T_1918; // @[el2_lsu_bus_buffer.scala 422:70]
  wire  _T_1923 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 423:33]
  wire  _T_1924 = io_lsu_busreq_m & _T_1923; // @[el2_lsu_bus_buffer.scala 423:22]
  wire  _T_1925 = _T_1871 | _T_1924; // @[el2_lsu_bus_buffer.scala 422:106]
  wire  _T_1928 = _T_1925 | _T_1873; // @[el2_lsu_bus_buffer.scala 423:42]
  wire  _T_1931 = _T_1928 | _T_1876; // @[el2_lsu_bus_buffer.scala 423:83]
  wire  _T_1932 = ~_T_1931; // @[el2_lsu_bus_buffer.scala 422:72]
  wire  _T_1933 = _T_1869 & _T_1932; // @[el2_lsu_bus_buffer.scala 422:70]
  wire  _T_1937 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 423:33]
  wire  _T_1938 = io_lsu_busreq_m & _T_1937; // @[el2_lsu_bus_buffer.scala 423:22]
  wire  _T_1939 = _T_1882 | _T_1938; // @[el2_lsu_bus_buffer.scala 422:106]
  wire  _T_1942 = _T_1939 | _T_1884; // @[el2_lsu_bus_buffer.scala 423:42]
  wire  _T_1945 = _T_1942 | _T_1887; // @[el2_lsu_bus_buffer.scala 423:83]
  wire  _T_1946 = ~_T_1945; // @[el2_lsu_bus_buffer.scala 422:72]
  wire  _T_1947 = _T_1880 & _T_1946; // @[el2_lsu_bus_buffer.scala 422:70]
  wire  _T_1951 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 423:33]
  wire  _T_1952 = io_lsu_busreq_m & _T_1951; // @[el2_lsu_bus_buffer.scala 423:22]
  wire  _T_1953 = _T_1893 | _T_1952; // @[el2_lsu_bus_buffer.scala 422:106]
  wire  _T_1956 = _T_1953 | _T_1895; // @[el2_lsu_bus_buffer.scala 423:42]
  wire  _T_1959 = _T_1956 | _T_1898; // @[el2_lsu_bus_buffer.scala 423:83]
  wire  _T_1960 = ~_T_1959; // @[el2_lsu_bus_buffer.scala 422:72]
  wire  _T_1961 = _T_1891 & _T_1960; // @[el2_lsu_bus_buffer.scala 422:70]
  wire [1:0] _T_1962 = _T_1961 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1963 = _T_1947 ? 2'h2 : _T_1962; // @[Mux.scala 98:16]
  wire [1:0] _T_1964 = _T_1933 ? 2'h1 : _T_1963; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 551:63]
  wire  _T_2734 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2735 = buf_rspageQ_0[3] & _T_2734; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2731 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2732 = buf_rspageQ_0[2] & _T_2731; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2728 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2729 = buf_rspageQ_0[1] & _T_2728; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2725 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2726 = buf_rspageQ_0[0] & _T_2725; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2735,_T_2732,_T_2729,_T_2726}; // @[Cat.scala 29:58]
  wire  _T_2037 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2038 = ~_T_2037; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2040 = _T_2038 & _T_2725; // @[el2_lsu_bus_buffer.scala 433:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 551:63]
  wire  _T_2750 = buf_rspageQ_1[3] & _T_2734; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2747 = buf_rspageQ_1[2] & _T_2731; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2744 = buf_rspageQ_1[1] & _T_2728; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2741 = buf_rspageQ_1[0] & _T_2725; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2750,_T_2747,_T_2744,_T_2741}; // @[Cat.scala 29:58]
  wire  _T_2041 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2042 = ~_T_2041; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2044 = _T_2042 & _T_2728; // @[el2_lsu_bus_buffer.scala 433:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 551:63]
  wire  _T_2765 = buf_rspageQ_2[3] & _T_2734; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2762 = buf_rspageQ_2[2] & _T_2731; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2759 = buf_rspageQ_2[1] & _T_2728; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2756 = buf_rspageQ_2[0] & _T_2725; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2765,_T_2762,_T_2759,_T_2756}; // @[Cat.scala 29:58]
  wire  _T_2045 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2046 = ~_T_2045; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2048 = _T_2046 & _T_2731; // @[el2_lsu_bus_buffer.scala 433:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 551:63]
  wire  _T_2780 = buf_rspageQ_3[3] & _T_2734; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2777 = buf_rspageQ_3[2] & _T_2731; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2774 = buf_rspageQ_3[1] & _T_2728; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2771 = buf_rspageQ_3[0] & _T_2725; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2780,_T_2777,_T_2774,_T_2771}; // @[Cat.scala 29:58]
  wire  _T_2049 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2050 = ~_T_2049; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2052 = _T_2050 & _T_2734; // @[el2_lsu_bus_buffer.scala 433:70]
  wire [7:0] _T_2108 = {4'h0,_T_2052,_T_2048,_T_2044,_T_2040}; // @[Cat.scala 29:58]
  wire  _T_2111 = _T_2108[4] | _T_2108[5]; // @[el2_lsu_bus_buffer.scala 437:42]
  wire  _T_2113 = _T_2111 | _T_2108[6]; // @[el2_lsu_bus_buffer.scala 437:48]
  wire  _T_2115 = _T_2113 | _T_2108[7]; // @[el2_lsu_bus_buffer.scala 437:54]
  wire  _T_2118 = _T_2108[2] | _T_2108[3]; // @[el2_lsu_bus_buffer.scala 437:67]
  wire  _T_2120 = _T_2118 | _T_2108[6]; // @[el2_lsu_bus_buffer.scala 437:73]
  wire  _T_2122 = _T_2120 | _T_2108[7]; // @[el2_lsu_bus_buffer.scala 437:79]
  wire  _T_2125 = _T_2108[1] | _T_2108[3]; // @[el2_lsu_bus_buffer.scala 437:92]
  wire  _T_2127 = _T_2125 | _T_2108[5]; // @[el2_lsu_bus_buffer.scala 437:98]
  wire  _T_2129 = _T_2127 | _T_2108[7]; // @[el2_lsu_bus_buffer.scala 437:104]
  wire [2:0] _T_2131 = {_T_2115,_T_2122,_T_2129}; // @[Cat.scala 29:58]
  wire  _T_3520 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 494:77]
  wire  _T_3521 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 494:97]
  wire  _T_3522 = _T_3520 & _T_3521; // @[el2_lsu_bus_buffer.scala 494:95]
  wire  _T_3523 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 494:117]
  wire  _T_3524 = _T_3522 & _T_3523; // @[el2_lsu_bus_buffer.scala 494:112]
  wire  _T_3525 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 494:144]
  wire  _T_3526 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 494:166]
  wire  _T_3527 = _T_3525 & _T_3526; // @[el2_lsu_bus_buffer.scala 494:161]
  wire  _T_3528 = _T_3524 | _T_3527; // @[el2_lsu_bus_buffer.scala 494:132]
  wire  _T_3529 = _T_845 & _T_3528; // @[el2_lsu_bus_buffer.scala 494:63]
  wire  _T_3530 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 494:206]
  wire  _T_3531 = ibuf_drain_vld & _T_3530; // @[el2_lsu_bus_buffer.scala 494:201]
  wire  _T_3532 = _T_3529 | _T_3531; // @[el2_lsu_bus_buffer.scala 494:183]
  wire  _T_3542 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 501:46]
  wire  _T_3577 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 612:38]
  wire  _T_3622 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 519:73]
  wire  _T_3623 = bus_rsp_write & _T_3622; // @[el2_lsu_bus_buffer.scala 519:52]
  wire  _T_3624 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 520:46]
  reg  _T_4295; // @[Reg.scala 27:20]
  reg  _T_4293; // @[Reg.scala 27:20]
  reg  _T_4291; // @[Reg.scala 27:20]
  reg  _T_4289; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4295,_T_4293,_T_4291,_T_4289}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_368 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_3626 = io_lsu_axi_rid == _GEN_368; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_3627 = buf_ldfwd[0] & _T_3626; // @[el2_lsu_bus_buffer.scala 521:27]
  wire  _T_3628 = _T_3624 | _T_3627; // @[el2_lsu_bus_buffer.scala 520:77]
  wire  _T_3629 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 522:26]
  wire  _T_3632 = _T_3629 & _T_1209; // @[el2_lsu_bus_buffer.scala 522:42]
  wire  _T_3633 = _T_3632 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 522:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_369 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_3634 = io_lsu_axi_rid == _GEN_369; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_3635 = _T_3633 & _T_3634; // @[el2_lsu_bus_buffer.scala 522:74]
  wire  _T_3636 = _T_3628 | _T_3635; // @[el2_lsu_bus_buffer.scala 521:71]
  wire  _T_3637 = bus_rsp_read & _T_3636; // @[el2_lsu_bus_buffer.scala 520:25]
  wire  _T_3638 = _T_3623 | _T_3637; // @[el2_lsu_bus_buffer.scala 519:105]
  wire  _GEN_42 = _T_3577 & _T_3638; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3543 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3539 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3516 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3664 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3674 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 534:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [2:0] _GEN_371 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_3676 = io_lsu_axi_rid == _GEN_371; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_3677 = _T_3674[0] & _T_3676; // @[el2_lsu_bus_buffer.scala 534:38]
  wire  _T_3678 = _T_3634 | _T_3677; // @[el2_lsu_bus_buffer.scala 533:95]
  wire  _T_3679 = bus_rsp_read & _T_3678; // @[el2_lsu_bus_buffer.scala 533:45]
  wire  _GEN_36 = _T_3664 & _T_3679; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3577 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3543 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3539 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3516 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3556 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 507:49]
  wire  _T_3557 = _T_3556 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 507:70]
  wire  _T_3682 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2131[1:0]; // @[el2_lsu_bus_buffer.scala 445:10]
  wire  _T_3685 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 539:37]
  wire  _T_3686 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 539:98]
  wire  _T_3687 = buf_dual_0 & _T_3686; // @[el2_lsu_bus_buffer.scala 539:80]
  wire  _T_3688 = _T_3685 | _T_3687; // @[el2_lsu_bus_buffer.scala 539:65]
  wire  _T_3689 = _T_3688 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 539:112]
  wire  _T_3690 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3682 ? _T_3689 : _T_3690; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3664 ? _T_3557 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3577 ? _T_3557 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3543 ? _T_3557 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3539 ? _T_3542 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3516 ? _T_3532 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2133 = _T_1858 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2139 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 459:23]
  wire  _T_2141 = _T_2139 & _T_3520; // @[el2_lsu_bus_buffer.scala 459:41]
  wire  _T_2143 = _T_2141 & _T_1861; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2145 = _T_2143 & _T_1859; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2146 = _T_4454 | _T_2145; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2147 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 460:17]
  wire  _T_2148 = _T_2147 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:35]
  wire  _T_2150 = _T_2148 & _T_1864; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2152 = _T_2150 & _T_1861; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2153 = _T_2146 | _T_2152; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2154 = _T_2133 & _T_2153; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2156 = _T_2154 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2170 = _T_2143 & _T_1870; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2171 = _T_4459 | _T_2170; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2177 = _T_2150 & _T_1872; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2178 = _T_2171 | _T_2177; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2179 = _T_2133 & _T_2178; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2181 = _T_2179 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2195 = _T_2143 & _T_1881; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2196 = _T_4464 | _T_2195; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2202 = _T_2150 & _T_1883; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2203 = _T_2196 | _T_2202; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2204 = _T_2133 & _T_2203; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2206 = _T_2204 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2220 = _T_2143 & _T_1892; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2221 = _T_4469 | _T_2220; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2227 = _T_2150 & _T_1894; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2228 = _T_2221 | _T_2227; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2229 = _T_2133 & _T_2228; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2231 = _T_2229 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2233 = {_T_2231,_T_2206,_T_2181}; // @[Cat.scala 29:58]
  wire  _T_3716 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 494:117]
  wire  _T_3717 = _T_3522 & _T_3716; // @[el2_lsu_bus_buffer.scala 494:112]
  wire  _T_3719 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 494:166]
  wire  _T_3720 = _T_3525 & _T_3719; // @[el2_lsu_bus_buffer.scala 494:161]
  wire  _T_3721 = _T_3717 | _T_3720; // @[el2_lsu_bus_buffer.scala 494:132]
  wire  _T_3722 = _T_845 & _T_3721; // @[el2_lsu_bus_buffer.scala 494:63]
  wire  _T_3723 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 494:206]
  wire  _T_3724 = ibuf_drain_vld & _T_3723; // @[el2_lsu_bus_buffer.scala 494:201]
  wire  _T_3725 = _T_3722 | _T_3724; // @[el2_lsu_bus_buffer.scala 494:183]
  wire  _T_3770 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3815 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 519:73]
  wire  _T_3816 = bus_rsp_write & _T_3815; // @[el2_lsu_bus_buffer.scala 519:52]
  wire  _T_3817 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 520:46]
  wire [2:0] _GEN_372 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_3819 = io_lsu_axi_rid == _GEN_372; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_3820 = buf_ldfwd[1] & _T_3819; // @[el2_lsu_bus_buffer.scala 521:27]
  wire  _T_3821 = _T_3817 | _T_3820; // @[el2_lsu_bus_buffer.scala 520:77]
  wire  _T_3822 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 522:26]
  wire  _T_3824 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 522:44]
  wire  _T_3825 = _T_3822 & _T_3824; // @[el2_lsu_bus_buffer.scala 522:42]
  wire  _T_3826 = _T_3825 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 522:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_373 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_3827 = io_lsu_axi_rid == _GEN_373; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_3828 = _T_3826 & _T_3827; // @[el2_lsu_bus_buffer.scala 522:74]
  wire  _T_3829 = _T_3821 | _T_3828; // @[el2_lsu_bus_buffer.scala 521:71]
  wire  _T_3830 = bus_rsp_read & _T_3829; // @[el2_lsu_bus_buffer.scala 520:25]
  wire  _T_3831 = _T_3816 | _T_3830; // @[el2_lsu_bus_buffer.scala 519:105]
  wire  _GEN_118 = _T_3770 & _T_3831; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3736 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3732 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3709 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3857 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3867 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 534:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [2:0] _GEN_375 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_3869 = io_lsu_axi_rid == _GEN_375; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_3870 = _T_3867[0] & _T_3869; // @[el2_lsu_bus_buffer.scala 534:38]
  wire  _T_3871 = _T_3827 | _T_3870; // @[el2_lsu_bus_buffer.scala 533:95]
  wire  _T_3872 = bus_rsp_read & _T_3871; // @[el2_lsu_bus_buffer.scala 533:45]
  wire  _GEN_112 = _T_3857 & _T_3872; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3770 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3736 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3732 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3709 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3749 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 507:49]
  wire  _T_3750 = _T_3749 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 507:70]
  wire  _T_3875 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3878 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 539:37]
  wire  _T_3879 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 539:98]
  wire  _T_3880 = buf_dual_1 & _T_3879; // @[el2_lsu_bus_buffer.scala 539:80]
  wire  _T_3881 = _T_3878 | _T_3880; // @[el2_lsu_bus_buffer.scala 539:65]
  wire  _T_3882 = _T_3881 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 539:112]
  wire  _T_3883 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3875 ? _T_3882 : _T_3883; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3857 ? _T_3750 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3770 ? _T_3750 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3736 ? _T_3750 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3732 ? _T_3542 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3709 ? _T_3725 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2235 = _T_1869 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2245 = _T_2141 & _T_1872; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2247 = _T_2245 & _T_1859; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2248 = _T_4454 | _T_2247; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2252 = _T_2148 & _T_1875; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2254 = _T_2252 & _T_1861; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2255 = _T_2248 | _T_2254; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2256 = _T_2235 & _T_2255; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2258 = _T_2256 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2272 = _T_2245 & _T_1870; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2273 = _T_4459 | _T_2272; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2279 = _T_2252 & _T_1872; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2280 = _T_2273 | _T_2279; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2281 = _T_2235 & _T_2280; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2283 = _T_2281 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2297 = _T_2245 & _T_1881; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2298 = _T_4464 | _T_2297; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2304 = _T_2252 & _T_1883; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2305 = _T_2298 | _T_2304; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2306 = _T_2235 & _T_2305; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2308 = _T_2306 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2322 = _T_2245 & _T_1892; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2323 = _T_4469 | _T_2322; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2329 = _T_2252 & _T_1894; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2330 = _T_2323 | _T_2329; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2331 = _T_2235 & _T_2330; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2333 = _T_2331 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2335 = {_T_2333,_T_2308,_T_2283}; // @[Cat.scala 29:58]
  wire  _T_3909 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 494:117]
  wire  _T_3910 = _T_3522 & _T_3909; // @[el2_lsu_bus_buffer.scala 494:112]
  wire  _T_3912 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 494:166]
  wire  _T_3913 = _T_3525 & _T_3912; // @[el2_lsu_bus_buffer.scala 494:161]
  wire  _T_3914 = _T_3910 | _T_3913; // @[el2_lsu_bus_buffer.scala 494:132]
  wire  _T_3915 = _T_845 & _T_3914; // @[el2_lsu_bus_buffer.scala 494:63]
  wire  _T_3916 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 494:206]
  wire  _T_3917 = ibuf_drain_vld & _T_3916; // @[el2_lsu_bus_buffer.scala 494:201]
  wire  _T_3918 = _T_3915 | _T_3917; // @[el2_lsu_bus_buffer.scala 494:183]
  wire  _T_3963 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4008 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 519:73]
  wire  _T_4009 = bus_rsp_write & _T_4008; // @[el2_lsu_bus_buffer.scala 519:52]
  wire  _T_4010 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 520:46]
  wire [2:0] _GEN_376 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_4012 = io_lsu_axi_rid == _GEN_376; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_4013 = buf_ldfwd[2] & _T_4012; // @[el2_lsu_bus_buffer.scala 521:27]
  wire  _T_4014 = _T_4010 | _T_4013; // @[el2_lsu_bus_buffer.scala 520:77]
  wire  _T_4015 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 522:26]
  wire  _T_4017 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 522:44]
  wire  _T_4018 = _T_4015 & _T_4017; // @[el2_lsu_bus_buffer.scala 522:42]
  wire  _T_4019 = _T_4018 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 522:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_377 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_4020 = io_lsu_axi_rid == _GEN_377; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_4021 = _T_4019 & _T_4020; // @[el2_lsu_bus_buffer.scala 522:74]
  wire  _T_4022 = _T_4014 | _T_4021; // @[el2_lsu_bus_buffer.scala 521:71]
  wire  _T_4023 = bus_rsp_read & _T_4022; // @[el2_lsu_bus_buffer.scala 520:25]
  wire  _T_4024 = _T_4009 | _T_4023; // @[el2_lsu_bus_buffer.scala 519:105]
  wire  _GEN_194 = _T_3963 & _T_4024; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3929 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3925 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3902 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4050 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4060 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 534:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [2:0] _GEN_379 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_4062 = io_lsu_axi_rid == _GEN_379; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_4063 = _T_4060[0] & _T_4062; // @[el2_lsu_bus_buffer.scala 534:38]
  wire  _T_4064 = _T_4020 | _T_4063; // @[el2_lsu_bus_buffer.scala 533:95]
  wire  _T_4065 = bus_rsp_read & _T_4064; // @[el2_lsu_bus_buffer.scala 533:45]
  wire  _GEN_188 = _T_4050 & _T_4065; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3963 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3929 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3925 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3902 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3942 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 507:49]
  wire  _T_3943 = _T_3942 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 507:70]
  wire  _T_4068 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4071 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 539:37]
  wire  _T_4072 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 539:98]
  wire  _T_4073 = buf_dual_2 & _T_4072; // @[el2_lsu_bus_buffer.scala 539:80]
  wire  _T_4074 = _T_4071 | _T_4073; // @[el2_lsu_bus_buffer.scala 539:65]
  wire  _T_4075 = _T_4074 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 539:112]
  wire  _T_4076 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4068 ? _T_4075 : _T_4076; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4050 ? _T_3943 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3963 ? _T_3943 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3929 ? _T_3943 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3925 ? _T_3542 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3902 ? _T_3918 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2337 = _T_1880 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2347 = _T_2141 & _T_1883; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2349 = _T_2347 & _T_1859; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2350 = _T_4454 | _T_2349; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2354 = _T_2148 & _T_1886; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2356 = _T_2354 & _T_1861; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2357 = _T_2350 | _T_2356; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2358 = _T_2337 & _T_2357; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2360 = _T_2358 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2374 = _T_2347 & _T_1870; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2375 = _T_4459 | _T_2374; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2381 = _T_2354 & _T_1872; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2382 = _T_2375 | _T_2381; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2383 = _T_2337 & _T_2382; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2385 = _T_2383 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2399 = _T_2347 & _T_1881; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2400 = _T_4464 | _T_2399; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2406 = _T_2354 & _T_1883; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2407 = _T_2400 | _T_2406; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2408 = _T_2337 & _T_2407; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2410 = _T_2408 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2424 = _T_2347 & _T_1892; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2425 = _T_4469 | _T_2424; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2431 = _T_2354 & _T_1894; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2432 = _T_2425 | _T_2431; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2433 = _T_2337 & _T_2432; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2435 = _T_2433 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2437 = {_T_2435,_T_2410,_T_2385}; // @[Cat.scala 29:58]
  wire  _T_4102 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 494:117]
  wire  _T_4103 = _T_3522 & _T_4102; // @[el2_lsu_bus_buffer.scala 494:112]
  wire  _T_4105 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 494:166]
  wire  _T_4106 = _T_3525 & _T_4105; // @[el2_lsu_bus_buffer.scala 494:161]
  wire  _T_4107 = _T_4103 | _T_4106; // @[el2_lsu_bus_buffer.scala 494:132]
  wire  _T_4108 = _T_845 & _T_4107; // @[el2_lsu_bus_buffer.scala 494:63]
  wire  _T_4109 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 494:206]
  wire  _T_4110 = ibuf_drain_vld & _T_4109; // @[el2_lsu_bus_buffer.scala 494:201]
  wire  _T_4111 = _T_4108 | _T_4110; // @[el2_lsu_bus_buffer.scala 494:183]
  wire  _T_4156 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4201 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 519:73]
  wire  _T_4202 = bus_rsp_write & _T_4201; // @[el2_lsu_bus_buffer.scala 519:52]
  wire  _T_4203 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 520:46]
  wire [2:0] _GEN_380 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_4205 = io_lsu_axi_rid == _GEN_380; // @[el2_lsu_bus_buffer.scala 521:47]
  wire  _T_4206 = buf_ldfwd[3] & _T_4205; // @[el2_lsu_bus_buffer.scala 521:27]
  wire  _T_4207 = _T_4203 | _T_4206; // @[el2_lsu_bus_buffer.scala 520:77]
  wire  _T_4208 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 522:26]
  wire  _T_4210 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 522:44]
  wire  _T_4211 = _T_4208 & _T_4210; // @[el2_lsu_bus_buffer.scala 522:42]
  wire  _T_4212 = _T_4211 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 522:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_381 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_4213 = io_lsu_axi_rid == _GEN_381; // @[el2_lsu_bus_buffer.scala 522:94]
  wire  _T_4214 = _T_4212 & _T_4213; // @[el2_lsu_bus_buffer.scala 522:74]
  wire  _T_4215 = _T_4207 | _T_4214; // @[el2_lsu_bus_buffer.scala 521:71]
  wire  _T_4216 = bus_rsp_read & _T_4215; // @[el2_lsu_bus_buffer.scala 520:25]
  wire  _T_4217 = _T_4202 | _T_4216; // @[el2_lsu_bus_buffer.scala 519:105]
  wire  _GEN_270 = _T_4156 & _T_4217; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4122 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4118 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4095 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4243 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4253 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 534:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 534:58]
  wire [2:0] _GEN_383 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_4255 = io_lsu_axi_rid == _GEN_383; // @[el2_lsu_bus_buffer.scala 534:58]
  wire  _T_4256 = _T_4253[0] & _T_4255; // @[el2_lsu_bus_buffer.scala 534:38]
  wire  _T_4257 = _T_4213 | _T_4256; // @[el2_lsu_bus_buffer.scala 533:95]
  wire  _T_4258 = bus_rsp_read & _T_4257; // @[el2_lsu_bus_buffer.scala 533:45]
  wire  _GEN_264 = _T_4243 & _T_4258; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4156 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4122 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4118 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4095 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4135 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 507:49]
  wire  _T_4136 = _T_4135 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 507:70]
  wire  _T_4261 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4264 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 539:37]
  wire  _T_4265 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 539:98]
  wire  _T_4266 = buf_dual_3 & _T_4265; // @[el2_lsu_bus_buffer.scala 539:80]
  wire  _T_4267 = _T_4264 | _T_4266; // @[el2_lsu_bus_buffer.scala 539:65]
  wire  _T_4268 = _T_4267 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 539:112]
  wire  _T_4269 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4261 ? _T_4268 : _T_4269; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4243 ? _T_4136 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4156 ? _T_4136 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4122 ? _T_4136 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4118 ? _T_3542 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4095 ? _T_4111 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2439 = _T_1891 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2449 = _T_2141 & _T_1894; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2451 = _T_2449 & _T_1859; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2452 = _T_4454 | _T_2451; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2456 = _T_2148 & _T_1897; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2458 = _T_2456 & _T_1861; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2459 = _T_2452 | _T_2458; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2460 = _T_2439 & _T_2459; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2462 = _T_2460 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2476 = _T_2449 & _T_1870; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2477 = _T_4459 | _T_2476; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2483 = _T_2456 & _T_1872; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2484 = _T_2477 | _T_2483; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2485 = _T_2439 & _T_2484; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2487 = _T_2485 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2501 = _T_2449 & _T_1881; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2502 = _T_4464 | _T_2501; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2508 = _T_2456 & _T_1883; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2509 = _T_2502 | _T_2508; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2510 = _T_2439 & _T_2509; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2512 = _T_2510 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2526 = _T_2449 & _T_1892; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2527 = _T_4469 | _T_2526; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2533 = _T_2456 & _T_1894; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2534 = _T_2527 | _T_2533; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2535 = _T_2439 & _T_2534; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2537 = _T_2535 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2539 = {_T_2537,_T_2512,_T_2487}; // @[Cat.scala 29:58]
  wire  _T_2787 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2788 = _T_1858 | _T_2787; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2789 = ~_T_2788; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2797 = _T_2789 | _T_2145; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2804 = _T_2797 | _T_2152; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2805 = _T_2133 & _T_2804; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2809 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2810 = _T_1869 | _T_2809; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2811 = ~_T_2810; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2819 = _T_2811 | _T_2170; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2826 = _T_2819 | _T_2177; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2827 = _T_2133 & _T_2826; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2831 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2832 = _T_1880 | _T_2831; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2833 = ~_T_2832; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2841 = _T_2833 | _T_2195; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2848 = _T_2841 | _T_2202; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2849 = _T_2133 & _T_2848; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2853 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2854 = _T_1891 | _T_2853; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2855 = ~_T_2854; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2863 = _T_2855 | _T_2220; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2870 = _T_2863 | _T_2227; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2871 = _T_2133 & _T_2870; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_0 = {_T_2871,_T_2849,_T_2827,_T_2805}; // @[Cat.scala 29:58]
  wire  _T_2888 = _T_2789 | _T_2247; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2895 = _T_2888 | _T_2254; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2896 = _T_2235 & _T_2895; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2910 = _T_2811 | _T_2272; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2917 = _T_2910 | _T_2279; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2918 = _T_2235 & _T_2917; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2932 = _T_2833 | _T_2297; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2939 = _T_2932 | _T_2304; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2940 = _T_2235 & _T_2939; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2954 = _T_2855 | _T_2322; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2961 = _T_2954 | _T_2329; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2962 = _T_2235 & _T_2961; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_1 = {_T_2962,_T_2940,_T_2918,_T_2896}; // @[Cat.scala 29:58]
  wire  _T_2979 = _T_2789 | _T_2349; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2986 = _T_2979 | _T_2356; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2987 = _T_2337 & _T_2986; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3001 = _T_2811 | _T_2374; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3008 = _T_3001 | _T_2381; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3009 = _T_2337 & _T_3008; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3023 = _T_2833 | _T_2399; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3030 = _T_3023 | _T_2406; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3031 = _T_2337 & _T_3030; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3045 = _T_2855 | _T_2424; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3052 = _T_3045 | _T_2431; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3053 = _T_2337 & _T_3052; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_2 = {_T_3053,_T_3031,_T_3009,_T_2987}; // @[Cat.scala 29:58]
  wire  _T_3070 = _T_2789 | _T_2451; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3077 = _T_3070 | _T_2458; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3078 = _T_2439 & _T_3077; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3092 = _T_2811 | _T_2476; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3099 = _T_3092 | _T_2483; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3100 = _T_2439 & _T_3099; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3114 = _T_2833 | _T_2501; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3121 = _T_3114 | _T_2508; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3122 = _T_2439 & _T_3121; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3136 = _T_2855 | _T_2526; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3143 = _T_3136 | _T_2533; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3144 = _T_2439 & _T_3143; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_3 = {_T_3144,_T_3122,_T_3100,_T_3078}; // @[Cat.scala 29:58]
  wire  _T_3229 = _T_2853 | _T_1891; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3230 = ~_T_3229; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3231 = buf_rspageQ_0[3] & _T_3230; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3223 = _T_2831 | _T_1880; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3224 = ~_T_3223; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3225 = buf_rspageQ_0[2] & _T_3224; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3217 = _T_2809 | _T_1869; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3218 = ~_T_3217; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3219 = buf_rspageQ_0[1] & _T_3218; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3211 = _T_2787 | _T_1858; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3212 = ~_T_3211; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3213 = buf_rspageQ_0[0] & _T_3212; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_0 = {_T_3231,_T_3225,_T_3219,_T_3213}; // @[Cat.scala 29:58]
  wire  _T_3150 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3153 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3156 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3159 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3161 = {_T_3159,_T_3156,_T_3153}; // @[Cat.scala 29:58]
  wire  _T_3258 = buf_rspageQ_1[3] & _T_3230; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3252 = buf_rspageQ_1[2] & _T_3224; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3246 = buf_rspageQ_1[1] & _T_3218; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3240 = buf_rspageQ_1[0] & _T_3212; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_1 = {_T_3258,_T_3252,_T_3246,_T_3240}; // @[Cat.scala 29:58]
  wire  _T_3165 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3168 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3171 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3174 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3176 = {_T_3174,_T_3171,_T_3168}; // @[Cat.scala 29:58]
  wire  _T_3285 = buf_rspageQ_2[3] & _T_3230; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3279 = buf_rspageQ_2[2] & _T_3224; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3273 = buf_rspageQ_2[1] & _T_3218; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3267 = buf_rspageQ_2[0] & _T_3212; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_2 = {_T_3285,_T_3279,_T_3273,_T_3267}; // @[Cat.scala 29:58]
  wire  _T_3180 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3183 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3186 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3189 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3191 = {_T_3189,_T_3186,_T_3183}; // @[Cat.scala 29:58]
  wire  _T_3312 = buf_rspageQ_3[3] & _T_3230; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3306 = buf_rspageQ_3[2] & _T_3224; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3300 = buf_rspageQ_3[1] & _T_3218; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3294 = buf_rspageQ_3[0] & _T_3212; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_3 = {_T_3312,_T_3306,_T_3300,_T_3294}; // @[Cat.scala 29:58]
  wire  _T_3195 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3198 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3201 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3204 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3206 = {_T_3204,_T_3201,_T_3198}; // @[Cat.scala 29:58]
  wire  _T_3317 = ibuf_drain_vld & _T_1859; // @[el2_lsu_bus_buffer.scala 477:65]
  wire  _T_3319 = ibuf_drain_vld & _T_1870; // @[el2_lsu_bus_buffer.scala 477:65]
  wire  _T_3321 = ibuf_drain_vld & _T_1881; // @[el2_lsu_bus_buffer.scala 477:65]
  wire  _T_3323 = ibuf_drain_vld & _T_1892; // @[el2_lsu_bus_buffer.scala 477:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3323,_T_3321,_T_3319,_T_3317}; // @[Cat.scala 29:58]
  wire  _T_3331 = _T_3525 & _T_1864; // @[el2_lsu_bus_buffer.scala 478:123]
  wire [3:0] _T_3334 = _T_3331 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 478:96]
  wire [3:0] _T_3335 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3334; // @[el2_lsu_bus_buffer.scala 478:48]
  wire  _T_3340 = _T_3525 & _T_1875; // @[el2_lsu_bus_buffer.scala 478:123]
  wire [3:0] _T_3343 = _T_3340 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 478:96]
  wire [3:0] _T_3344 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3343; // @[el2_lsu_bus_buffer.scala 478:48]
  wire  _T_3349 = _T_3525 & _T_1886; // @[el2_lsu_bus_buffer.scala 478:123]
  wire [3:0] _T_3352 = _T_3349 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 478:96]
  wire [3:0] _T_3353 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3352; // @[el2_lsu_bus_buffer.scala 478:48]
  wire  _T_3358 = _T_3525 & _T_1897; // @[el2_lsu_bus_buffer.scala 478:123]
  wire [3:0] _T_3361 = _T_3358 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 478:96]
  wire [3:0] _T_3362 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3361; // @[el2_lsu_bus_buffer.scala 478:48]
  wire  _T_3388 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 480:47]
  wire  _T_3390 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 480:47]
  wire  _T_3392 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 480:47]
  wire  _T_3394 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 480:47]
  wire [3:0] buf_dual_in = {_T_3394,_T_3392,_T_3390,_T_3388}; // @[Cat.scala 29:58]
  wire  _T_3399 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 481:49]
  wire  _T_3401 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 481:49]
  wire  _T_3403 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 481:49]
  wire  _T_3405 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 481:49]
  wire [3:0] buf_samedw_in = {_T_3405,_T_3403,_T_3401,_T_3399}; // @[Cat.scala 29:58]
  wire  _T_3410 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 482:86]
  wire  _T_3411 = ibuf_drainvec_vld[0] ? _T_3410 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 482:50]
  wire  _T_3414 = ibuf_drainvec_vld[1] ? _T_3410 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 482:50]
  wire  _T_3417 = ibuf_drainvec_vld[2] ? _T_3410 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 482:50]
  wire  _T_3420 = ibuf_drainvec_vld[3] ? _T_3410 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 482:50]
  wire [3:0] buf_nomerge_in = {_T_3420,_T_3417,_T_3414,_T_3411}; // @[Cat.scala 29:58]
  wire  _T_3428 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3331; // @[el2_lsu_bus_buffer.scala 483:49]
  wire  _T_3433 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3340; // @[el2_lsu_bus_buffer.scala 483:49]
  wire  _T_3438 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3349; // @[el2_lsu_bus_buffer.scala 483:49]
  wire  _T_3443 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3358; // @[el2_lsu_bus_buffer.scala 483:49]
  wire [3:0] buf_dualhi_in = {_T_3443,_T_3438,_T_3433,_T_3428}; // @[Cat.scala 29:58]
  wire  _T_3472 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 485:53]
  wire  _T_3474 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 485:53]
  wire  _T_3476 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 485:53]
  wire  _T_3478 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 485:53]
  wire [3:0] buf_sideeffect_in = {_T_3478,_T_3476,_T_3474,_T_3472}; // @[Cat.scala 29:58]
  wire  _T_3483 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 486:49]
  wire  _T_3485 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 486:49]
  wire  _T_3487 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 486:49]
  wire  _T_3489 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 486:49]
  wire [3:0] buf_unsign_in = {_T_3489,_T_3487,_T_3485,_T_3483}; // @[Cat.scala 29:58]
  wire  _T_3506 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 488:48]
  wire  _T_3508 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 488:48]
  wire  _T_3510 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 488:48]
  wire  _T_3512 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 488:48]
  wire [3:0] buf_write_in = {_T_3512,_T_3510,_T_3508,_T_3506}; // @[Cat.scala 29:58]
  wire  _T_3545 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 504:89]
  wire  _T_3547 = _T_3545 & _T_1356; // @[el2_lsu_bus_buffer.scala 504:104]
  wire  _T_3560 = buf_state_en_0 & _T_1209; // @[el2_lsu_bus_buffer.scala 509:44]
  wire  _T_3561 = _T_3560 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 509:60]
  wire  _T_3563 = _T_3561 & _T_1338; // @[el2_lsu_bus_buffer.scala 509:74]
  wire  _T_3566 = _T_3556 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 511:67]
  wire  _T_3567 = _T_3566 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 511:81]
  wire  _T_4852 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 616:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4852; // @[el2_lsu_bus_buffer.scala 616:38]
  wire  _T_3570 = _T_3566 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 512:82]
  wire  _T_3645 = bus_rsp_read_error & _T_3624; // @[el2_lsu_bus_buffer.scala 526:91]
  wire  _T_3647 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 527:31]
  wire  _T_3649 = _T_3647 & _T_3626; // @[el2_lsu_bus_buffer.scala 527:46]
  wire  _T_3650 = _T_3645 | _T_3649; // @[el2_lsu_bus_buffer.scala 526:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4852; // @[el2_lsu_bus_buffer.scala 615:40]
  wire  _T_3653 = bus_rsp_write_error & _T_3622; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_3654 = _T_3650 | _T_3653; // @[el2_lsu_bus_buffer.scala 527:88]
  wire  _T_3655 = _T_3556 & _T_3654; // @[el2_lsu_bus_buffer.scala 526:68]
  wire  _GEN_46 = _T_3577 & _T_3655; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3543 ? _T_3570 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3539 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3516 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3580 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 516:73]
  wire  _T_3581 = buf_write[0] & _T_3580; // @[el2_lsu_bus_buffer.scala 516:71]
  wire  _T_3582 = io_dec_tlu_force_halt | _T_3581; // @[el2_lsu_bus_buffer.scala 516:55]
  wire  _T_3584 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 517:30]
  wire  _T_3585 = buf_dual_0 & _T_3584; // @[el2_lsu_bus_buffer.scala 517:28]
  wire  _T_3588 = _T_3585 & _T_1209; // @[el2_lsu_bus_buffer.scala 517:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_3589 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_3590 = _T_3588 & _T_3589; // @[el2_lsu_bus_buffer.scala 517:61]
  wire  _T_4477 = _T_2734 | _T_2731; // @[el2_lsu_bus_buffer.scala 575:93]
  wire  _T_4478 = _T_4477 | _T_2728; // @[el2_lsu_bus_buffer.scala 575:93]
  wire  any_done_wait_state = _T_4478 | _T_2725; // @[el2_lsu_bus_buffer.scala 575:93]
  wire  _T_3592 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:31]
  wire  _T_3598 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3600 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3602 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3604 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3606 = _T_3598 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3607 = _T_3600 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3608 = _T_3602 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3609 = _T_3604 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3610 = _T_3606 | _T_3607; // @[Mux.scala 27:72]
  wire  _T_3611 = _T_3610 | _T_3608; // @[Mux.scala 27:72]
  wire  _T_3612 = _T_3611 | _T_3609; // @[Mux.scala 27:72]
  wire  _T_3614 = _T_3588 & _T_3612; // @[el2_lsu_bus_buffer.scala 518:101]
  wire  _T_3615 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 518:167]
  wire  _T_3616 = _T_3614 & _T_3615; // @[el2_lsu_bus_buffer.scala 518:138]
  wire  _T_3617 = _T_3616 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:187]
  wire  _T_3618 = _T_3592 | _T_3617; // @[el2_lsu_bus_buffer.scala 518:53]
  wire  _T_3641 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 525:47]
  wire  _T_3642 = _T_3641 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 525:62]
  wire  _T_3656 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 529:50]
  wire  _T_3657 = buf_state_en_0 & _T_3656; // @[el2_lsu_bus_buffer.scala 529:48]
  wire  _T_3669 = buf_ldfwd[0] | _T_3674[0]; // @[el2_lsu_bus_buffer.scala 532:90]
  wire  _T_3670 = _T_3669 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 532:118]
  wire  _GEN_29 = _T_3690 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3682 ? 1'h0 : _T_3690; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3682 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3664 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3664 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3577 & _T_3642; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3577 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3577 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3543 ? _T_3563 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3543 ? _T_3567 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3543 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3539 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3539 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3539 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3516 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3516 ? buf_state_en_0 : _GEN_70; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3516 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3516 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3753 = buf_state_en_1 & _T_3824; // @[el2_lsu_bus_buffer.scala 509:44]
  wire  _T_3754 = _T_3753 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 509:60]
  wire  _T_3756 = _T_3754 & _T_1338; // @[el2_lsu_bus_buffer.scala 509:74]
  wire  _T_3759 = _T_3749 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 511:67]
  wire  _T_3760 = _T_3759 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 511:81]
  wire  _T_3763 = _T_3759 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 512:82]
  wire  _T_3838 = bus_rsp_read_error & _T_3817; // @[el2_lsu_bus_buffer.scala 526:91]
  wire  _T_3840 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 527:31]
  wire  _T_3842 = _T_3840 & _T_3819; // @[el2_lsu_bus_buffer.scala 527:46]
  wire  _T_3843 = _T_3838 | _T_3842; // @[el2_lsu_bus_buffer.scala 526:143]
  wire  _T_3846 = bus_rsp_write_error & _T_3815; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_3847 = _T_3843 | _T_3846; // @[el2_lsu_bus_buffer.scala 527:88]
  wire  _T_3848 = _T_3749 & _T_3847; // @[el2_lsu_bus_buffer.scala 526:68]
  wire  _GEN_122 = _T_3770 & _T_3848; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3736 ? _T_3763 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3732 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3709 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3774 = buf_write[1] & _T_3580; // @[el2_lsu_bus_buffer.scala 516:71]
  wire  _T_3775 = io_dec_tlu_force_halt | _T_3774; // @[el2_lsu_bus_buffer.scala 516:55]
  wire  _T_3777 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 517:30]
  wire  _T_3778 = buf_dual_1 & _T_3777; // @[el2_lsu_bus_buffer.scala 517:28]
  wire  _T_3781 = _T_3778 & _T_3824; // @[el2_lsu_bus_buffer.scala 517:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_3782 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_3783 = _T_3781 & _T_3782; // @[el2_lsu_bus_buffer.scala 517:61]
  wire  _T_3785 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:31]
  wire  _T_3791 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3793 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3795 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3797 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3799 = _T_3791 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3800 = _T_3793 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3801 = _T_3795 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3802 = _T_3797 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3803 = _T_3799 | _T_3800; // @[Mux.scala 27:72]
  wire  _T_3804 = _T_3803 | _T_3801; // @[Mux.scala 27:72]
  wire  _T_3805 = _T_3804 | _T_3802; // @[Mux.scala 27:72]
  wire  _T_3807 = _T_3781 & _T_3805; // @[el2_lsu_bus_buffer.scala 518:101]
  wire  _T_3808 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 518:167]
  wire  _T_3809 = _T_3807 & _T_3808; // @[el2_lsu_bus_buffer.scala 518:138]
  wire  _T_3810 = _T_3809 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:187]
  wire  _T_3811 = _T_3785 | _T_3810; // @[el2_lsu_bus_buffer.scala 518:53]
  wire  _T_3834 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 525:47]
  wire  _T_3835 = _T_3834 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 525:62]
  wire  _T_3849 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 529:50]
  wire  _T_3850 = buf_state_en_1 & _T_3849; // @[el2_lsu_bus_buffer.scala 529:48]
  wire  _T_3862 = buf_ldfwd[1] | _T_3867[0]; // @[el2_lsu_bus_buffer.scala 532:90]
  wire  _T_3863 = _T_3862 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 532:118]
  wire  _GEN_105 = _T_3883 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3875 ? 1'h0 : _T_3883; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3875 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3857 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3857 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3770 & _T_3835; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3770 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3770 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3736 ? _T_3756 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3736 ? _T_3760 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3736 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3732 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3732 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3732 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3709 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3709 ? buf_state_en_1 : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3709 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3709 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3946 = buf_state_en_2 & _T_4017; // @[el2_lsu_bus_buffer.scala 509:44]
  wire  _T_3947 = _T_3946 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 509:60]
  wire  _T_3949 = _T_3947 & _T_1338; // @[el2_lsu_bus_buffer.scala 509:74]
  wire  _T_3952 = _T_3942 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 511:67]
  wire  _T_3953 = _T_3952 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 511:81]
  wire  _T_3956 = _T_3952 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 512:82]
  wire  _T_4031 = bus_rsp_read_error & _T_4010; // @[el2_lsu_bus_buffer.scala 526:91]
  wire  _T_4033 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 527:31]
  wire  _T_4035 = _T_4033 & _T_4012; // @[el2_lsu_bus_buffer.scala 527:46]
  wire  _T_4036 = _T_4031 | _T_4035; // @[el2_lsu_bus_buffer.scala 526:143]
  wire  _T_4039 = bus_rsp_write_error & _T_4008; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_4040 = _T_4036 | _T_4039; // @[el2_lsu_bus_buffer.scala 527:88]
  wire  _T_4041 = _T_3942 & _T_4040; // @[el2_lsu_bus_buffer.scala 526:68]
  wire  _GEN_198 = _T_3963 & _T_4041; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3929 ? _T_3956 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3925 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3902 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_3967 = buf_write[2] & _T_3580; // @[el2_lsu_bus_buffer.scala 516:71]
  wire  _T_3968 = io_dec_tlu_force_halt | _T_3967; // @[el2_lsu_bus_buffer.scala 516:55]
  wire  _T_3970 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 517:30]
  wire  _T_3971 = buf_dual_2 & _T_3970; // @[el2_lsu_bus_buffer.scala 517:28]
  wire  _T_3974 = _T_3971 & _T_4017; // @[el2_lsu_bus_buffer.scala 517:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_3975 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_3976 = _T_3974 & _T_3975; // @[el2_lsu_bus_buffer.scala 517:61]
  wire  _T_3978 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:31]
  wire  _T_3984 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3986 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3988 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3990 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3992 = _T_3984 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3993 = _T_3986 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3994 = _T_3988 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3995 = _T_3990 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3996 = _T_3992 | _T_3993; // @[Mux.scala 27:72]
  wire  _T_3997 = _T_3996 | _T_3994; // @[Mux.scala 27:72]
  wire  _T_3998 = _T_3997 | _T_3995; // @[Mux.scala 27:72]
  wire  _T_4000 = _T_3974 & _T_3998; // @[el2_lsu_bus_buffer.scala 518:101]
  wire  _T_4001 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 518:167]
  wire  _T_4002 = _T_4000 & _T_4001; // @[el2_lsu_bus_buffer.scala 518:138]
  wire  _T_4003 = _T_4002 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:187]
  wire  _T_4004 = _T_3978 | _T_4003; // @[el2_lsu_bus_buffer.scala 518:53]
  wire  _T_4027 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 525:47]
  wire  _T_4028 = _T_4027 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 525:62]
  wire  _T_4042 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 529:50]
  wire  _T_4043 = buf_state_en_2 & _T_4042; // @[el2_lsu_bus_buffer.scala 529:48]
  wire  _T_4055 = buf_ldfwd[2] | _T_4060[0]; // @[el2_lsu_bus_buffer.scala 532:90]
  wire  _T_4056 = _T_4055 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 532:118]
  wire  _GEN_181 = _T_4076 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4068 ? 1'h0 : _T_4076; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4068 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4050 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4050 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3963 & _T_4028; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3963 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3963 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3929 ? _T_3949 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3929 ? _T_3953 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3929 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3925 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3925 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3925 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3902 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3902 ? buf_state_en_2 : _GEN_222; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3902 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3902 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4139 = buf_state_en_3 & _T_4210; // @[el2_lsu_bus_buffer.scala 509:44]
  wire  _T_4140 = _T_4139 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 509:60]
  wire  _T_4142 = _T_4140 & _T_1338; // @[el2_lsu_bus_buffer.scala 509:74]
  wire  _T_4145 = _T_4135 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 511:67]
  wire  _T_4146 = _T_4145 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 511:81]
  wire  _T_4149 = _T_4145 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 512:82]
  wire  _T_4224 = bus_rsp_read_error & _T_4203; // @[el2_lsu_bus_buffer.scala 526:91]
  wire  _T_4226 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 527:31]
  wire  _T_4228 = _T_4226 & _T_4205; // @[el2_lsu_bus_buffer.scala 527:46]
  wire  _T_4229 = _T_4224 | _T_4228; // @[el2_lsu_bus_buffer.scala 526:143]
  wire  _T_4232 = bus_rsp_write_error & _T_4201; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_4233 = _T_4229 | _T_4232; // @[el2_lsu_bus_buffer.scala 527:88]
  wire  _T_4234 = _T_4135 & _T_4233; // @[el2_lsu_bus_buffer.scala 526:68]
  wire  _GEN_274 = _T_4156 & _T_4234; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4122 ? _T_4149 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4118 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4095 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4160 = buf_write[3] & _T_3580; // @[el2_lsu_bus_buffer.scala 516:71]
  wire  _T_4161 = io_dec_tlu_force_halt | _T_4160; // @[el2_lsu_bus_buffer.scala 516:55]
  wire  _T_4163 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 517:30]
  wire  _T_4164 = buf_dual_3 & _T_4163; // @[el2_lsu_bus_buffer.scala 517:28]
  wire  _T_4167 = _T_4164 & _T_4210; // @[el2_lsu_bus_buffer.scala 517:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 517:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_4168 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 517:90]
  wire  _T_4169 = _T_4167 & _T_4168; // @[el2_lsu_bus_buffer.scala 517:61]
  wire  _T_4171 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:31]
  wire  _T_4177 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4179 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4181 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4183 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4185 = _T_4177 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4186 = _T_4179 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4187 = _T_4181 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4188 = _T_4183 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4189 = _T_4185 | _T_4186; // @[Mux.scala 27:72]
  wire  _T_4190 = _T_4189 | _T_4187; // @[Mux.scala 27:72]
  wire  _T_4191 = _T_4190 | _T_4188; // @[Mux.scala 27:72]
  wire  _T_4193 = _T_4167 & _T_4191; // @[el2_lsu_bus_buffer.scala 518:101]
  wire  _T_4194 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 518:167]
  wire  _T_4195 = _T_4193 & _T_4194; // @[el2_lsu_bus_buffer.scala 518:138]
  wire  _T_4196 = _T_4195 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 518:187]
  wire  _T_4197 = _T_4171 | _T_4196; // @[el2_lsu_bus_buffer.scala 518:53]
  wire  _T_4220 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 525:47]
  wire  _T_4221 = _T_4220 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 525:62]
  wire  _T_4235 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 529:50]
  wire  _T_4236 = buf_state_en_3 & _T_4235; // @[el2_lsu_bus_buffer.scala 529:48]
  wire  _T_4248 = buf_ldfwd[3] | _T_4253[0]; // @[el2_lsu_bus_buffer.scala 532:90]
  wire  _T_4249 = _T_4248 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 532:118]
  wire  _GEN_257 = _T_4269 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4261 ? 1'h0 : _T_4269; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4261 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4243 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4243 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4156 & _T_4221; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4156 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4156 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4122 ? _T_4142 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4122 ? _T_4146 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4122 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4118 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4118 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4118 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4095 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_4095 ? buf_state_en_3 : _GEN_298; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4095 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4095 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4324; // @[Reg.scala 27:20]
  reg  _T_4327; // @[Reg.scala 27:20]
  reg  _T_4330; // @[Reg.scala 27:20]
  reg  _T_4333; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4333,_T_4330,_T_4327,_T_4324}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3335[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 478:19]
  wire [2:0] buf_byteen_in_1 = _T_3344[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 478:19]
  wire [2:0] buf_byteen_in_2 = _T_3353[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 478:19]
  wire [2:0] buf_byteen_in_3 = _T_3362[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 478:19]
  reg  _T_4399; // @[el2_lsu_bus_buffer.scala 568:82]
  reg  _T_4394; // @[el2_lsu_bus_buffer.scala 568:82]
  reg  _T_4389; // @[el2_lsu_bus_buffer.scala 568:82]
  reg  _T_4384; // @[el2_lsu_bus_buffer.scala 568:82]
  wire [3:0] buf_error = {_T_4399,_T_4394,_T_4389,_T_4384}; // @[Cat.scala 29:58]
  wire  _T_4381 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 568:86]
  wire  _T_4382 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 568:128]
  wire  _T_4386 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 568:86]
  wire  _T_4387 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 568:128]
  wire  _T_4391 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 568:86]
  wire  _T_4392 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 568:128]
  wire  _T_4396 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 568:86]
  wire  _T_4397 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 568:128]
  wire [2:0] _T_4404 = {buf_data_en_3,buf_data_en_2,buf_data_en_1}; // @[Cat.scala 29:58]
  wire [1:0] _T_4410 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 571:96]
  wire [1:0] _GEN_388 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 571:96]
  wire [2:0] _T_4411 = _T_4410 + _GEN_388; // @[el2_lsu_bus_buffer.scala 571:96]
  wire [2:0] _GEN_389 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 571:96]
  wire [3:0] buf_numvld_any = _T_4411 + _GEN_389; // @[el2_lsu_bus_buffer.scala 571:96]
  wire  _T_4481 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 577:52]
  wire  _T_4482 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 577:92]
  wire  _T_4483 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 577:119]
  wire  _T_4485 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 578:52]
  wire  _T_4486 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 578:52]
  wire  _T_4487 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 578:52]
  wire  _T_4488 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 578:52]
  wire  _T_4489 = _T_4485 | _T_4486; // @[el2_lsu_bus_buffer.scala 578:65]
  wire  _T_4490 = _T_4489 | _T_4487; // @[el2_lsu_bus_buffer.scala 578:65]
  wire  _T_4491 = _T_4490 | _T_4488; // @[el2_lsu_bus_buffer.scala 578:65]
  wire  _T_4492 = ~_T_4491; // @[el2_lsu_bus_buffer.scala 578:34]
  wire  _T_4494 = _T_4492 & _T_844; // @[el2_lsu_bus_buffer.scala 578:70]
  wire  _T_4497 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 580:51]
  wire  _T_4498 = _T_4497 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 580:72]
  wire  _T_4499 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 580:94]
  wire  _T_4500 = _T_4498 & _T_4499; // @[el2_lsu_bus_buffer.scala 580:92]
  wire  _T_4501 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 580:111]
  wire  _T_4503 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 583:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 669:66]
  wire  _T_4521 = _T_2787 & _T_1209; // @[Mux.scala 27:72]
  wire  _T_4522 = _T_2809 & _T_3824; // @[Mux.scala 27:72]
  wire  _T_4523 = _T_2831 & _T_4017; // @[Mux.scala 27:72]
  wire  _T_4524 = _T_2853 & _T_4210; // @[Mux.scala 27:72]
  wire  _T_4525 = _T_4521 | _T_4522; // @[Mux.scala 27:72]
  wire  _T_4526 = _T_4525 | _T_4523; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4526 | _T_4524; // @[Mux.scala 27:72]
  wire  _T_4532 = buf_error[0] & _T_1209; // @[el2_lsu_bus_buffer.scala 586:108]
  wire  _T_4537 = buf_error[1] & _T_3824; // @[el2_lsu_bus_buffer.scala 586:108]
  wire  _T_4542 = buf_error[2] & _T_4017; // @[el2_lsu_bus_buffer.scala 586:108]
  wire  _T_4547 = buf_error[3] & _T_4210; // @[el2_lsu_bus_buffer.scala 586:108]
  wire  _T_4548 = _T_2787 & _T_4532; // @[Mux.scala 27:72]
  wire  _T_4549 = _T_2809 & _T_4537; // @[Mux.scala 27:72]
  wire  _T_4550 = _T_2831 & _T_4542; // @[Mux.scala 27:72]
  wire  _T_4551 = _T_2853 & _T_4547; // @[Mux.scala 27:72]
  wire  _T_4552 = _T_4548 | _T_4549; // @[Mux.scala 27:72]
  wire  _T_4553 = _T_4552 | _T_4550; // @[Mux.scala 27:72]
  wire  _T_4560 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 587:109]
  wire  _T_4561 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 587:124]
  wire  _T_4562 = _T_4560 | _T_4561; // @[el2_lsu_bus_buffer.scala 587:122]
  wire  _T_4563 = _T_4521 & _T_4562; // @[el2_lsu_bus_buffer.scala 587:106]
  wire  _T_4568 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 587:109]
  wire  _T_4569 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 587:124]
  wire  _T_4570 = _T_4568 | _T_4569; // @[el2_lsu_bus_buffer.scala 587:122]
  wire  _T_4571 = _T_4522 & _T_4570; // @[el2_lsu_bus_buffer.scala 587:106]
  wire  _T_4576 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 587:109]
  wire  _T_4577 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 587:124]
  wire  _T_4578 = _T_4576 | _T_4577; // @[el2_lsu_bus_buffer.scala 587:122]
  wire  _T_4579 = _T_4523 & _T_4578; // @[el2_lsu_bus_buffer.scala 587:106]
  wire  _T_4584 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 587:109]
  wire  _T_4585 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 587:124]
  wire  _T_4586 = _T_4584 | _T_4585; // @[el2_lsu_bus_buffer.scala 587:122]
  wire  _T_4587 = _T_4524 & _T_4586; // @[el2_lsu_bus_buffer.scala 587:106]
  wire [1:0] _T_4590 = _T_4579 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4591 = _T_4587 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_390 = {{1'd0}, _T_4571}; // @[Mux.scala 27:72]
  wire [1:0] _T_4593 = _GEN_390 | _T_4590; // @[Mux.scala 27:72]
  wire [31:0] _T_4628 = _T_4563 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4629 = _T_4571 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4630 = _T_4579 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4631 = _T_4587 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4632 = _T_4628 | _T_4629; // @[Mux.scala 27:72]
  wire [31:0] _T_4633 = _T_4632 | _T_4630; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4633 | _T_4631; // @[Mux.scala 27:72]
  wire  _T_4639 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 589:120]
  wire  _T_4640 = _T_4521 & _T_4639; // @[el2_lsu_bus_buffer.scala 589:105]
  wire  _T_4645 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 589:120]
  wire  _T_4646 = _T_4522 & _T_4645; // @[el2_lsu_bus_buffer.scala 589:105]
  wire  _T_4651 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 589:120]
  wire  _T_4652 = _T_4523 & _T_4651; // @[el2_lsu_bus_buffer.scala 589:105]
  wire  _T_4657 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 589:120]
  wire  _T_4658 = _T_4524 & _T_4657; // @[el2_lsu_bus_buffer.scala 589:105]
  wire [31:0] _T_4659 = _T_4640 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4660 = _T_4646 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4661 = _T_4652 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4662 = _T_4658 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4663 = _T_4659 | _T_4660; // @[Mux.scala 27:72]
  wire [31:0] _T_4664 = _T_4663 | _T_4661; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4664 | _T_4662; // @[Mux.scala 27:72]
  wire  _T_4666 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 119:123]
  wire  _T_4667 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 119:123]
  wire  _T_4668 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 119:123]
  wire  _T_4669 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 119:123]
  wire [31:0] _T_4670 = _T_4666 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4667 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4668 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4673 = _T_4669 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4674 = _T_4670 | _T_4671; // @[Mux.scala 27:72]
  wire [31:0] _T_4675 = _T_4674 | _T_4672; // @[Mux.scala 27:72]
  wire [31:0] _T_4676 = _T_4675 | _T_4673; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4676[1:0]; // @[el2_lsu_bus_buffer.scala 590:83]
  wire [1:0] _T_4682 = _T_4666 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4683 = _T_4667 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4684 = _T_4668 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4685 = _T_4669 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4686 = _T_4682 | _T_4683; // @[Mux.scala 27:72]
  wire [1:0] _T_4687 = _T_4686 | _T_4684; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4687 | _T_4685; // @[Mux.scala 27:72]
  wire  _T_4697 = _T_4666 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4698 = _T_4667 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4699 = _T_4668 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4700 = _T_4669 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4701 = _T_4697 | _T_4698; // @[Mux.scala 27:72]
  wire  _T_4702 = _T_4701 | _T_4699; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4702 | _T_4700; // @[Mux.scala 27:72]
  wire [63:0] _T_4722 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_391 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 594:121]
  wire [5:0] _T_4723 = _GEN_391 * 4'h8; // @[el2_lsu_bus_buffer.scala 594:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4722 >> _T_4723; // @[el2_lsu_bus_buffer.scala 594:92]
  wire  _T_4724 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 597:69]
  wire  _T_4726 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 598:81]
  wire  _T_4727 = lsu_nonblock_unsign & _T_4726; // @[el2_lsu_bus_buffer.scala 598:63]
  wire [31:0] _T_4729 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4730 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 599:45]
  wire  _T_4731 = lsu_nonblock_unsign & _T_4730; // @[el2_lsu_bus_buffer.scala 599:26]
  wire [31:0] _T_4733 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4734 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 600:6]
  wire  _T_4736 = _T_4734 & _T_4726; // @[el2_lsu_bus_buffer.scala 600:27]
  wire [23:0] _T_4739 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4741 = {_T_4739,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4744 = _T_4734 & _T_4730; // @[el2_lsu_bus_buffer.scala 601:27]
  wire [15:0] _T_4747 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4749 = {_T_4747,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4750 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 602:21]
  wire [31:0] _T_4751 = _T_4727 ? _T_4729 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4752 = _T_4731 ? _T_4733 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4753 = _T_4736 ? _T_4741 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4754 = _T_4744 ? _T_4749 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4755 = _T_4750 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4756 = _T_4751 | _T_4752; // @[Mux.scala 27:72]
  wire [31:0] _T_4757 = _T_4756 | _T_4753; // @[Mux.scala 27:72]
  wire [31:0] _T_4758 = _T_4757 | _T_4754; // @[Mux.scala 27:72]
  wire [63:0] _GEN_392 = {{32'd0}, _T_4758}; // @[Mux.scala 27:72]
  wire [63:0] _T_4759 = _GEN_392 | _T_4755; // @[Mux.scala 27:72]
  wire  _T_4854 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 620:36]
  wire  _T_4855 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 620:51]
  wire  _T_4856 = _T_4854 & _T_4855; // @[el2_lsu_bus_buffer.scala 620:49]
  wire [31:0] _T_4860 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4862 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4867 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 632:50]
  wire  _T_4868 = _T_4854 & _T_4867; // @[el2_lsu_bus_buffer.scala 632:48]
  wire [7:0] _T_4872 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4875 = obuf_valid & _T_1348; // @[el2_lsu_bus_buffer.scala 637:36]
  wire  _T_4877 = _T_4875 & _T_1354; // @[el2_lsu_bus_buffer.scala 637:50]
  wire  _T_4889 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4891 = _T_4889 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4894 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4896 = _T_4894 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4899 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4901 = _T_4899 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4904 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4906 = _T_4904 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4907 = _T_2787 & _T_4891; // @[Mux.scala 27:72]
  wire  _T_4908 = _T_2809 & _T_4896; // @[Mux.scala 27:72]
  wire  _T_4909 = _T_2831 & _T_4901; // @[Mux.scala 27:72]
  wire  _T_4910 = _T_2853 & _T_4906; // @[Mux.scala 27:72]
  wire  _T_4911 = _T_4907 | _T_4908; // @[Mux.scala 27:72]
  wire  _T_4912 = _T_4911 | _T_4909; // @[Mux.scala 27:72]
  wire  _T_4922 = _T_2809 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 651:98]
  wire  lsu_imprecise_error_store_tag = _T_4922 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 651:113]
  wire  _T_4928 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 653:72]
  wire  _T_4930 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 119:123]
  wire [31:0] _T_4932 = _T_4930 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4933 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4934 = _T_4932 | _T_4933; // @[Mux.scala 27:72]
  wire  _T_4951 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 660:68]
  wire  _T_4954 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 661:48]
  wire  _T_4957 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 664:48]
  wire  _T_4958 = io_lsu_axi_awvalid & _T_4957; // @[el2_lsu_bus_buffer.scala 664:46]
  wire  _T_4959 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 664:92]
  wire  _T_4960 = io_lsu_axi_wvalid & _T_4959; // @[el2_lsu_bus_buffer.scala 664:90]
  wire  _T_4961 = _T_4958 | _T_4960; // @[el2_lsu_bus_buffer.scala 664:69]
  wire  _T_4962 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 664:136]
  wire  _T_4963 = io_lsu_axi_arvalid & _T_4962; // @[el2_lsu_bus_buffer.scala 664:134]
  wire  _T_4967 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 668:75]
  wire  _T_4968 = io_lsu_busreq_m & _T_4967; // @[el2_lsu_bus_buffer.scala 668:73]
  reg  _T_4971; // @[el2_lsu_bus_buffer.scala 668:56]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 485:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_busreq_r = _T_4971; // @[el2_lsu_bus_buffer.scala 668:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 576:30]
  assign io_lsu_bus_buffer_full_any = _T_4481 ? _T_4482 : _T_4483; // @[el2_lsu_bus_buffer.scala 577:30]
  assign io_lsu_bus_buffer_empty_any = _T_4494 & _T_1236; // @[el2_lsu_bus_buffer.scala 578:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 657:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 196:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 197:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 222:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 227:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4928; // @[el2_lsu_bus_buffer.scala 653:35]
  assign io_lsu_imprecise_error_store_any = _T_4912 | _T_4910; // @[el2_lsu_bus_buffer.scala 650:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4934 : _T_4676; // @[el2_lsu_bus_buffer.scala 654:35]
  assign io_lsu_nonblock_load_valid_m = _T_4500 & _T_4501; // @[el2_lsu_bus_buffer.scala 580:32]
  assign io_lsu_nonblock_load_tag_m = _T_1868 ? 2'h0 : _T_1904; // @[el2_lsu_bus_buffer.scala 581:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4503; // @[el2_lsu_bus_buffer.scala 583:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 584:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4724; // @[el2_lsu_bus_buffer.scala 597:35]
  assign io_lsu_nonblock_load_data_error = _T_4553 | _T_4551; // @[el2_lsu_bus_buffer.scala 586:35]
  assign io_lsu_nonblock_load_data_tag = _T_4593 | _T_4591; // @[el2_lsu_bus_buffer.scala 587:33]
  assign io_lsu_nonblock_load_data = _T_4759[31:0]; // @[el2_lsu_bus_buffer.scala 598:29]
  assign io_lsu_pmu_bus_trxn = _T_4951 | _T_4846; // @[el2_lsu_bus_buffer.scala 660:23]
  assign io_lsu_pmu_bus_misaligned = _T_4954 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 661:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 662:24]
  assign io_lsu_pmu_bus_busy = _T_4961 | _T_4963; // @[el2_lsu_bus_buffer.scala 664:23]
  assign io_lsu_axi_awvalid = _T_4856 & _T_1244; // @[el2_lsu_bus_buffer.scala 620:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1853}; // @[el2_lsu_bus_buffer.scala 621:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4860; // @[el2_lsu_bus_buffer.scala 622:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 626:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 627:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4862 : 3'h3; // @[el2_lsu_bus_buffer.scala 623:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 628:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 630:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 625:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 624:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 629:20]
  assign io_lsu_axi_wvalid = _T_4868 & _T_1244; // @[el2_lsu_bus_buffer.scala 632:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 634:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4872; // @[el2_lsu_bus_buffer.scala 633:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 635:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 648:21]
  assign io_lsu_axi_arvalid = _T_4877 & _T_1244; // @[el2_lsu_bus_buffer.scala 637:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1853}; // @[el2_lsu_bus_buffer.scala 638:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4860; // @[el2_lsu_bus_buffer.scala 639:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 643:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 644:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4862 : 3'h3; // @[el2_lsu_bus_buffer.scala 640:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 645:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 647:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 642:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 641:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 646:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 649:21]
  assign io_test = _T_745 | _T_744; // @[el2_lsu_bus_buffer.scala 256:11]
  assign io_data_hi = _T_4664 | _T_4662; // @[el2_lsu_bus_buffer.scala 595:14]
  assign io_data_lo = _T_4633 | _T_4631; // @[el2_lsu_bus_buffer.scala 596:14]
  assign io_data_en = {_T_4404,buf_data_en_0}; // @[el2_lsu_bus_buffer.scala 569:14]
  assign io_Cmdptr0 = 2'h0; // @[el2_lsu_bus_buffer.scala 314:14]
  assign io_Cmdptr1 = 2'h0; // @[el2_lsu_bus_buffer.scala 356:14]
  assign io_WrPtr1_r = WrPtr1_r; // @[el2_lsu_bus_buffer.scala 276:15]
  assign io_WrPtr1_m = _T_1919 ? 2'h0 : _T_1964; // @[el2_lsu_bus_buffer.scala 425:15]
  assign io_wdata_in = {_T_1625,_T_1584}; // @[el2_lsu_bus_buffer.scala 391:15]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_io_en = _T_845 & _T_846; // @[el2_lib.scala 488:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_1_io_en = _T_845 & _T_846; // @[el2_lib.scala 488:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_2_io_en = _T_1245 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_3_io_en = _T_1245 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_4_io_en = _T_3516 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3709 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3902 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4095 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3516 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3709 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3902 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4095 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
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
  _T_4348 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4345 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4342 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4339 = _RAND_4[0:0];
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
  _T_4375 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4373 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4371 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4369 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  buf_ageQ_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1853 = _RAND_17[1:0];
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
  ibuf_timer = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  ibuf_sideeffect = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  WrPtr1_r = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  WrPtr0_r = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  ibuf_tag = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  ibuf_data = _RAND_38[31:0];
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
  obuf_wr_timer = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  buf_nomerge_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  buf_nomerge_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  buf_nomerge_2 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  buf_nomerge_3 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4318 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4315 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4312 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4309 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  buf_dual_3 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  buf_dual_2 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  buf_dual_1 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  buf_dual_0 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  buf_samedw_3 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  buf_samedw_2 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  buf_samedw_1 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  buf_samedw_0 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  obuf_write = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  obuf_cmd_done = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  obuf_data_done = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  obuf_nosend = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  obuf_addr = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  buf_sz_0 = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  buf_sz_1 = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  buf_sz_2 = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  buf_sz_3 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  obuf_sideeffect = _RAND_71[0:0];
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
  _T_4295 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4293 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4291 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4289 = _RAND_88[0:0];
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
  _T_4324 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4327 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4330 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4333 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4399 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4394 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4389 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4384 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4971 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4348 = 1'h0;
  end
  if (reset) begin
    _T_4345 = 1'h0;
  end
  if (reset) begin
    _T_4342 = 1'h0;
  end
  if (reset) begin
    _T_4339 = 1'h0;
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
    _T_4375 = 3'h0;
  end
  if (reset) begin
    _T_4373 = 3'h0;
  end
  if (reset) begin
    _T_4371 = 3'h0;
  end
  if (reset) begin
    _T_4369 = 3'h0;
  end
  if (reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_1853 = 2'h0;
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
    ibuf_data = 32'h0;
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
    _T_4318 = 1'h0;
  end
  if (reset) begin
    _T_4315 = 1'h0;
  end
  if (reset) begin
    _T_4312 = 1'h0;
  end
  if (reset) begin
    _T_4309 = 1'h0;
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
    obuf_sideeffect = 1'h0;
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
    _T_4295 = 1'h0;
  end
  if (reset) begin
    _T_4293 = 1'h0;
  end
  if (reset) begin
    _T_4291 = 1'h0;
  end
  if (reset) begin
    _T_4289 = 1'h0;
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
    _T_4324 = 1'h0;
  end
  if (reset) begin
    _T_4327 = 1'h0;
  end
  if (reset) begin
    _T_4330 = 1'h0;
  end
  if (reset) begin
    _T_4333 = 1'h0;
  end
  if (reset) begin
    _T_4399 = 1'h0;
  end
  if (reset) begin
    _T_4394 = 1'h0;
  end
  if (reset) begin
    _T_4389 = 1'h0;
  end
  if (reset) begin
    _T_4384 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4971 = 1'h0;
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
    end else if (_T_3331) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4348 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4348 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4345 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4345 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4342 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4342 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4339 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4339 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3516) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3539) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3543) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3547) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3577) begin
        if (_T_3582) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3590) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3618) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3664) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3670) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3682) begin
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
    end else if (_T_3340) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3709) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3732) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3736) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3547) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3770) begin
        if (_T_3775) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3783) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3811) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3857) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3863) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3875) begin
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
    end else if (_T_3349) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3902) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3925) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3929) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3547) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3963) begin
        if (_T_3968) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3976) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4004) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4050) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4056) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4068) begin
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
    end else if (_T_3358) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4095) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4118) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4122) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3547) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4156) begin
        if (_T_4161) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4169) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4197) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4243) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4249) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4261) begin
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
      _T_4375 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4375 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4373 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4373 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4371 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4371 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4369 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4369 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2539,_T_2462};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1853 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1853 <= WrPtr0_r;
      end else begin
        _T_1853 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_merge <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_merge <= obuf_merge_en;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_tag1 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_tag1 <= WrPtr1_r;
      end else begin
        obuf_tag1 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1844 & _T_1845;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1245 & io_lsu_bus_clk_en;
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
      ibuf_write <= io_lsu_pkt_r_store;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ibuf_valid <= 1'h0;
    end else begin
      ibuf_valid <= _T_989 & _T_990;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_858) begin
        ibuf_byteen <= _T_873;
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
      buf_ageQ_2 <= {_T_2437,_T_2360};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2335,_T_2258};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2233,_T_2156};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3516) begin
      if (_T_3531) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3539) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3543) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3577) begin
      if (_T_3657) begin
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
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3709) begin
      if (_T_3724) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3732) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3736) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3770) begin
      if (_T_3850) begin
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
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3902) begin
      if (_T_3917) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3925) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3929) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3963) begin
      if (_T_4043) begin
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
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4095) begin
      if (_T_4110) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4118) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4122) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4156) begin
      if (_T_4236) begin
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
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_timer <= 3'h0;
    end else if (ibuf_wr_en) begin
      ibuf_timer <= 3'h0;
    end else if (_T_907) begin
      ibuf_timer <= _T_910;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (_T_995) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1919) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1933) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1947) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1961) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1868) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1879) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1890) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1901) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_995) begin
      if (!(_T_858)) begin
        if (io_ldst_dual_r) begin
          ibuf_tag <= WrPtr1_r;
        end else begin
          ibuf_tag <= WrPtr0_r;
        end
      end
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      ibuf_data <= 32'h0;
    end else begin
      ibuf_data <= {_T_906,_T_883};
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (_T_995) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_995) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_995) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_995) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_995) begin
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_timer <= 3'h0;
    end else if (obuf_wr_en) begin
      obuf_wr_timer <= 3'h0;
    end else if (_T_1063) begin
      obuf_wr_timer <= _T_1065;
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
      _T_4318 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4318 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4315 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4315 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4312 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4312 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4309 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4309 <= buf_sideeffect_in[0];
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_write <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_write <= io_lsu_pkt_r_store;
      end else begin
        obuf_write <= buf_write[0];
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1310 & _T_4843;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1310 & _T_4844;
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
      obuf_addr <= buf_addr_0;
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_sideeffect <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sideeffect <= io_is_sideeffects_r;
      end else begin
        obuf_sideeffect <= buf_sideeffect[0];
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1335 | _T_1339;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1341) begin
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_sz <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sz <= ibuf_sz_in;
      end else begin
        obuf_sz <= buf_sz_0;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
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
      obuf_data <= {_T_1625,_T_1584};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3161,_T_3150};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3176,_T_3165};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3191,_T_3180};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3206,_T_3195};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4295 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4095) begin
        _T_4295 <= 1'h0;
      end else if (_T_4118) begin
        _T_4295 <= 1'h0;
      end else begin
        _T_4295 <= _T_4122;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4293 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3902) begin
        _T_4293 <= 1'h0;
      end else if (_T_3925) begin
        _T_4293 <= 1'h0;
      end else begin
        _T_4293 <= _T_3929;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4291 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3709) begin
        _T_4291 <= 1'h0;
      end else if (_T_3732) begin
        _T_4291 <= 1'h0;
      end else begin
        _T_4291 <= _T_3736;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4289 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3516) begin
        _T_4289 <= 1'h0;
      end else if (_T_3539) begin
        _T_4289 <= 1'h0;
      end else begin
        _T_4289 <= _T_3543;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3516) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3539) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3543) begin
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
      end else if (_T_3331) begin
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
      if (_T_4095) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4118) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4122) begin
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
      if (_T_3902) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3925) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3929) begin
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
      if (_T_3709) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3732) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3736) begin
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
      end else if (_T_3340) begin
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
      end else if (_T_3349) begin
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
      end else if (_T_3358) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4324 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4324 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4327 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4327 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4330 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4330 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4333 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4333 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4399 <= 1'h0;
    end else begin
      _T_4399 <= _T_4396 & _T_4397;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4394 <= 1'h0;
    end else begin
      _T_4394 <= _T_4391 & _T_4392;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4389 <= 1'h0;
    end else begin
      _T_4389 <= _T_4386 & _T_4387;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4384 <= 1'h0;
    end else begin
      _T_4384 <= _T_4381 & _T_4382;
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
      _T_4971 <= 1'h0;
    end else begin
      _T_4971 <= _T_4968 & _T_4501;
    end
  end
endmodule
