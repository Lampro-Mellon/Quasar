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
  output [63:0] io_wdata_in,
  output [11:0] io_buf_state
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
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_buffer.scala 135:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_buffer.scala 136:46]
  reg [31:0] buf_addr_0; // @[el2_lib.scala 491:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 138:74]
  reg  _T_4405; // @[Reg.scala 27:20]
  reg  _T_4402; // @[Reg.scala 27:20]
  reg  _T_4399; // @[Reg.scala 27:20]
  reg  _T_4396; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4405,_T_4402,_T_4399,_T_4396}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 138:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[el2_lsu_bus_buffer.scala 138:129]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu_bus_buffer.scala 138:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 138:141]
  reg [31:0] buf_addr_1; // @[el2_lib.scala 491:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 138:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 138:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[el2_lsu_bus_buffer.scala 138:129]
  wire  _T_13 = _T_11 & _T_12; // @[el2_lsu_bus_buffer.scala 138:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 138:141]
  reg [31:0] buf_addr_2; // @[el2_lib.scala 491:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 138:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 138:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[el2_lsu_bus_buffer.scala 138:129]
  wire  _T_20 = _T_18 & _T_19; // @[el2_lsu_bus_buffer.scala 138:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 138:141]
  reg [31:0] buf_addr_3; // @[el2_lib.scala 491:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 138:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 138:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[el2_lsu_bus_buffer.scala 138:129]
  wire  _T_27 = _T_25 & _T_26; // @[el2_lsu_bus_buffer.scala 138:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 138:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 139:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 139:98]
  wire  _T_34 = _T_32 & _T_5; // @[el2_lsu_bus_buffer.scala 139:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 139:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 139:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 139:98]
  wire  _T_41 = _T_39 & _T_12; // @[el2_lsu_bus_buffer.scala 139:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 139:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 139:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 139:98]
  wire  _T_48 = _T_46 & _T_19; // @[el2_lsu_bus_buffer.scala 139:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 139:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 139:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 139:98]
  wire  _T_55 = _T_53 & _T_26; // @[el2_lsu_bus_buffer.scala 139:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 139:141]
  reg [3:0] buf_byteen_3; // @[Reg.scala 27:20]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 201:114]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 201:114]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 201:114]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2666 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_4152 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4175 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4179 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1891; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1891}; // @[el2_lsu_bus_buffer.scala 411:13]
  wire  _T_4186 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 515:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_4187 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_4188 = obuf_merge & _T_4187; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_4189 = _T_4186 | _T_4188; // @[el2_lsu_bus_buffer.scala 515:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 405:54]
  wire  _T_4190 = _T_4189 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 404:55]
  wire  _T_4191 = _T_4190 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_280 = _T_4179 & _T_4191; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4175 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4152 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2667 = _T_2666 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2668 = ~_T_2667; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2669 = buf_ageQ_3[3] & _T_2668; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2661 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_3959 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3982 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3986 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3993 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 515:48]
  wire  _T_3994 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_3995 = obuf_merge & _T_3994; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_3996 = _T_3993 | _T_3995; // @[el2_lsu_bus_buffer.scala 515:77]
  wire  _T_3997 = _T_3996 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  wire  _T_3998 = _T_3997 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_204 = _T_3986 & _T_3998; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3982 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3959 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2662 = _T_2661 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2663 = ~_T_2662; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2664 = buf_ageQ_3[2] & _T_2663; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2656 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_3766 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3789 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3793 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3800 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 515:48]
  wire  _T_3801 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_3802 = obuf_merge & _T_3801; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_3803 = _T_3800 | _T_3802; // @[el2_lsu_bus_buffer.scala 515:77]
  wire  _T_3804 = _T_3803 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  wire  _T_3805 = _T_3804 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_128 = _T_3793 & _T_3805; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3789 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3766 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2657 = _T_2656 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2658 = ~_T_2657; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2659 = buf_ageQ_3[1] & _T_2658; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2651 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_3573 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3596 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3600 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3607 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 515:48]
  wire  _T_3608 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_3609 = obuf_merge & _T_3608; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_3610 = _T_3607 | _T_3609; // @[el2_lsu_bus_buffer.scala 515:77]
  wire  _T_3611 = _T_3610 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  wire  _T_3612 = _T_3611 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_52 = _T_3600 & _T_3612; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3596 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3573 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2652 = _T_2651 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2653 = ~_T_2652; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2654 = buf_ageQ_3[0] & _T_2653; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_3 = {_T_2669,_T_2664,_T_2659,_T_2654}; // @[Cat.scala 29:58]
  wire  _T_2768 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2770 = _T_2768 & _T_19; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2762 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2764 = _T_2762 & _T_12; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2756 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2758 = _T_2756 & _T_5; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2770,_T_2764,_T_2758}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 206:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 212:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[el2_lsu_bus_buffer.scala 212:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 298:24]
  wire  _T_514 = _T_513 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 212:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 212:99]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire  _T_545 = ld_addr_ibuf_hit_lo & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 217:48]
  wire  _T_547 = _T_545 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 217:65]
  wire [3:0] ld_byte_ibuf_hit_lo = {{3'd0}, _T_547}; // @[el2_lsu_bus_buffer.scala 217:25 el2_lsu_bus_buffer.scala 217:25 el2_lsu_bus_buffer.scala 217:25 el2_lsu_bus_buffer.scala 217:25]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 206:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2646 = buf_ageQ_2[3] & _T_2668; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2641 = buf_ageQ_2[2] & _T_2663; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2636 = buf_ageQ_2[1] & _T_2658; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2631 = buf_ageQ_2[0] & _T_2653; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_2 = {_T_2646,_T_2641,_T_2636,_T_2631}; // @[Cat.scala 29:58]
  wire  _T_2747 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2749 = _T_2747 & _T_26; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2735 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2737 = _T_2735 & _T_12; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2729 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2731 = _T_2729 & _T_5; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_2 = {_T_2749,1'h0,_T_2737,_T_2731}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2623 = buf_ageQ_1[3] & _T_2668; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2618 = buf_ageQ_1[2] & _T_2663; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2613 = buf_ageQ_1[1] & _T_2658; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2608 = buf_ageQ_1[0] & _T_2653; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_1 = {_T_2623,_T_2618,_T_2613,_T_2608}; // @[Cat.scala 29:58]
  wire  _T_2720 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2722 = _T_2720 & _T_26; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2714 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2716 = _T_2714 & _T_19; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2702 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2704 = _T_2702 & _T_5; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_1 = {_T_2722,_T_2716,1'h0,_T_2704}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2600 = buf_ageQ_0[3] & _T_2668; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2595 = buf_ageQ_0[2] & _T_2663; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2590 = buf_ageQ_0[1] & _T_2658; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2585 = buf_ageQ_0[0] & _T_2653; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_0 = {_T_2600,_T_2595,_T_2590,_T_2585}; // @[Cat.scala 29:58]
  wire  _T_2693 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2695 = _T_2693 & _T_26; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2687 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2689 = _T_2687 & _T_19; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2681 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2683 = _T_2681 & _T_12; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_0 = {_T_2695,_T_2689,_T_2683,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_232 = |_T_231; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_233 = ~_T_232; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_237 = _T_234 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[el2_lsu_bus_buffer.scala 198:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 198:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_291 = |_T_290; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_292 = ~_T_291; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 206:150]
  wire  _T_296 = _T_293 & _T_295; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_283 = |_T_282; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_284 = ~_T_283; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_288 = _T_285 & _T_295; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_275 = |_T_274; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_276 = ~_T_275; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_280 = _T_277 & _T_295; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_267 = |_T_266; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_268 = ~_T_267; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_272 = _T_269 & _T_295; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[el2_lsu_bus_buffer.scala 198:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 198:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_326 = |_T_325; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_327 = ~_T_326; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 206:150]
  wire  _T_331 = _T_328 & _T_330; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_318 = |_T_317; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_319 = ~_T_318; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_323 = _T_320 & _T_330; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_310 = |_T_309; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_311 = ~_T_310; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_315 = _T_312 & _T_330; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_302 = |_T_301; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_303 = ~_T_302; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_307 = _T_304 & _T_330; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[el2_lsu_bus_buffer.scala 198:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 198:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 201:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 201:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_361 = |_T_360; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_362 = ~_T_361; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 206:150]
  wire  _T_366 = _T_363 & _T_365; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_353 = |_T_352; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_354 = ~_T_353; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_358 = _T_355 & _T_365; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_345 = |_T_344; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_346 = ~_T_345; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_350 = _T_347 & _T_365; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_337 = |_T_336; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_338 = ~_T_337; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_342 = _T_339 & _T_365; // @[el2_lsu_bus_buffer.scala 206:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[el2_lsu_bus_buffer.scala 198:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 198:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_396 = |_T_395; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_397 = ~_T_396; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 213:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[el2_lsu_bus_buffer.scala 213:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 213:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 213:99]
  wire  _T_549 = ld_addr_ibuf_hit_hi & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 218:48]
  wire  _T_551 = _T_549 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 218:65]
  wire [3:0] ld_byte_ibuf_hit_hi = {{3'd0}, _T_551}; // @[el2_lsu_bus_buffer.scala 218:25 el2_lsu_bus_buffer.scala 218:25 el2_lsu_bus_buffer.scala 218:25 el2_lsu_bus_buffer.scala 218:25]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_401 = _T_398 & _T_400; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_388 = |_T_387; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_389 = ~_T_388; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_393 = _T_390 & _T_400; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_380 = |_T_379; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_381 = ~_T_380; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_385 = _T_382 & _T_400; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_372 = |_T_371; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_373 = ~_T_372; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_377 = _T_374 & _T_400; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_431 = |_T_430; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_432 = ~_T_431; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_436 = _T_433 & _T_435; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_423 = |_T_422; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_424 = ~_T_423; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_428 = _T_425 & _T_435; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_415 = |_T_414; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_416 = ~_T_415; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_420 = _T_417 & _T_435; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_407 = |_T_406; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_408 = ~_T_407; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_412 = _T_409 & _T_435; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_466 = |_T_465; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_467 = ~_T_466; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_471 = _T_468 & _T_470; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_458 = |_T_457; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_459 = ~_T_458; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_463 = _T_460 & _T_470; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_450 = |_T_449; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_451 = ~_T_450; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_455 = _T_452 & _T_470; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_442 = |_T_441; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_443 = ~_T_442; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_447 = _T_444 & _T_470; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_501 = |_T_500; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_502 = ~_T_501; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_506 = _T_503 & _T_505; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_493 = |_T_492; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_494 = ~_T_493; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_498 = _T_495 & _T_505; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_485 = |_T_484; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_486 = ~_T_485; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_490 = _T_487 & _T_505; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_477 = |_T_476; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_478 = ~_T_477; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_482 = _T_479 & _T_505; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire [2:0] _T_84 = {_T_82,_T_79,_T_76}; // @[Cat.scala 29:58]
  wire [7:0] _T_554 = ld_byte_ibuf_hit_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_557 = ld_byte_ibuf_hit_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_560 = ld_byte_ibuf_hit_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_563 = ld_byte_ibuf_hit_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ld_fwddata_buf_lo_initial = {_T_563,_T_560,_T_557,_T_554}; // @[Cat.scala 29:58]
  wire [7:0] _T_568 = ld_byte_ibuf_hit_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_571 = ld_byte_ibuf_hit_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_574 = ld_byte_ibuf_hit_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_577 = ld_byte_ibuf_hit_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ld_fwddata_buf_hi_initial = {_T_577,_T_574,_T_571,_T_568}; // @[Cat.scala 29:58]
  wire [7:0] _T_582 = ld_byte_hitvecfn_lo_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_0; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_354 = {{1'd0}, _T_582}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_584 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_587 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_355 = {{1'd0}, _T_587}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_589 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_592 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_356 = {{1'd0}, _T_592}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_594 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_597 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_357 = {{1'd0}, _T_597}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_599 = _GEN_357 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_600 = _T_584 | _T_589; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [8:0] _T_601 = _T_600 | _T_594; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [8:0] _T_602 = _T_601 | _T_599; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [7:0] _T_605 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_607 = _T_605 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_610 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_612 = _T_610 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_615 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_617 = _T_615 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_620 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_622 = _T_620 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_623 = _T_607 | _T_612; // @[el2_lsu_bus_buffer.scala 226:97]
  wire [7:0] _T_624 = _T_623 | _T_617; // @[el2_lsu_bus_buffer.scala 226:97]
  wire [7:0] _T_625 = _T_624 | _T_622; // @[el2_lsu_bus_buffer.scala 226:97]
  wire [7:0] _T_628 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_630 = _T_628 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_633 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_635 = _T_633 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_638 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_640 = _T_638 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_643 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_645 = _T_643 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_646 = _T_630 | _T_635; // @[el2_lsu_bus_buffer.scala 227:96]
  wire [7:0] _T_647 = _T_646 | _T_640; // @[el2_lsu_bus_buffer.scala 227:96]
  wire [7:0] _T_648 = _T_647 | _T_645; // @[el2_lsu_bus_buffer.scala 227:96]
  wire [7:0] _T_651 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_653 = _T_651 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_656 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_658 = _T_656 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_661 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_663 = _T_661 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_666 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_668 = _T_666 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_669 = _T_653 | _T_658; // @[el2_lsu_bus_buffer.scala 228:95]
  wire [7:0] _T_670 = _T_669 | _T_663; // @[el2_lsu_bus_buffer.scala 228:95]
  wire [7:0] _T_671 = _T_670 | _T_668; // @[el2_lsu_bus_buffer.scala 228:95]
  wire [32:0] _T_674 = {_T_602,_T_625,_T_648,_T_671}; // @[Cat.scala 29:58]
  wire [32:0] _GEN_358 = {{1'd0}, ld_fwddata_buf_lo_initial}; // @[el2_lsu_bus_buffer.scala 228:101]
  wire [32:0] _T_675 = _T_674 | _GEN_358; // @[el2_lsu_bus_buffer.scala 228:101]
  wire [7:0] _T_678 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_359 = {{1'd0}, _T_678}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_680 = _GEN_359 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [7:0] _T_683 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_360 = {{1'd0}, _T_683}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_685 = _GEN_360 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [7:0] _T_688 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_361 = {{1'd0}, _T_688}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_690 = _GEN_361 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [7:0] _T_693 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_362 = {{1'd0}, _T_693}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_695 = _GEN_362 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_696 = _T_680 | _T_685; // @[el2_lsu_bus_buffer.scala 230:123]
  wire [8:0] _T_697 = _T_696 | _T_690; // @[el2_lsu_bus_buffer.scala 230:123]
  wire [8:0] _T_698 = _T_697 | _T_695; // @[el2_lsu_bus_buffer.scala 230:123]
  wire [7:0] _T_701 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_703 = _T_701 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_706 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_708 = _T_706 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_711 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_713 = _T_711 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_716 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_718 = _T_716 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_719 = _T_703 | _T_708; // @[el2_lsu_bus_buffer.scala 231:97]
  wire [7:0] _T_720 = _T_719 | _T_713; // @[el2_lsu_bus_buffer.scala 231:97]
  wire [7:0] _T_721 = _T_720 | _T_718; // @[el2_lsu_bus_buffer.scala 231:97]
  wire [7:0] _T_724 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_726 = _T_724 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_729 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_731 = _T_729 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_734 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_736 = _T_734 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_739 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_741 = _T_739 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_742 = _T_726 | _T_731; // @[el2_lsu_bus_buffer.scala 232:96]
  wire [7:0] _T_743 = _T_742 | _T_736; // @[el2_lsu_bus_buffer.scala 232:96]
  wire [7:0] _T_744 = _T_743 | _T_741; // @[el2_lsu_bus_buffer.scala 232:96]
  wire [7:0] _T_747 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_749 = _T_747 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_752 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_754 = _T_752 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_757 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_759 = _T_757 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_762 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_764 = _T_762 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_765 = _T_749 | _T_754; // @[el2_lsu_bus_buffer.scala 233:95]
  wire [7:0] _T_766 = _T_765 | _T_759; // @[el2_lsu_bus_buffer.scala 233:95]
  wire [7:0] _T_767 = _T_766 | _T_764; // @[el2_lsu_bus_buffer.scala 233:95]
  wire [32:0] _T_770 = {_T_698,_T_721,_T_744,_T_767}; // @[Cat.scala 29:58]
  wire [32:0] _GEN_363 = {{1'd0}, ld_fwddata_buf_hi_initial}; // @[el2_lsu_bus_buffer.scala 233:101]
  wire [32:0] _T_771 = _T_770 | _GEN_363; // @[el2_lsu_bus_buffer.scala 233:101]
  wire [3:0] _T_772 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_773 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_774 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_775 = _T_772 | _T_773; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_775 | _T_774; // @[Mux.scala 27:72]
  wire  _T_778 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 240:55]
  wire  _T_780 = io_lsu_addr_r[1:0] == 2'h1; // @[el2_lsu_bus_buffer.scala 241:55]
  wire [3:0] _T_782 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_784 = io_lsu_addr_r[1:0] == 2'h2; // @[el2_lsu_bus_buffer.scala 242:55]
  wire [3:0] _T_786 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_788 = io_lsu_addr_r[1:0] == 2'h3; // @[el2_lsu_bus_buffer.scala 243:55]
  wire [3:0] _T_790 = {1'h0,ldst_byteen_r[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_792 = _T_780 ? _T_782 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_793 = _T_784 ? _T_786 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_794 = _T_788 ? _T_790 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_796 = _T_792 | _T_793; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_hi_r = _T_796 | _T_794; // @[Mux.scala 27:72]
  wire [3:0] _T_803 = {ldst_byteen_r[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_807 = {ldst_byteen_r[1:0],2'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_811 = {ldst_byteen_r[0],3'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_812 = _T_778 ? ldst_byteen_r : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_813 = _T_780 ? _T_803 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_814 = _T_784 ? _T_807 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_815 = _T_788 ? _T_811 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_816 = _T_812 | _T_813; // @[Mux.scala 27:72]
  wire [3:0] _T_817 = _T_816 | _T_814; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_lo_r = _T_817 | _T_815; // @[Mux.scala 27:72]
  wire [31:0] _T_824 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_828 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_832 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
  wire [31:0] _T_834 = _T_780 ? _T_824 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_835 = _T_784 ? _T_828 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_836 = _T_788 ? _T_832 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_838 = _T_834 | _T_835; // @[Mux.scala 27:72]
  wire [31:0] store_data_hi_r = _T_838 | _T_836; // @[Mux.scala 27:72]
  wire [31:0] _T_845 = {io_store_data_r[23:0],8'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_849 = {io_store_data_r[15:0],16'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_853 = {io_store_data_r[7:0],24'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_854 = _T_778 ? io_store_data_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_855 = _T_780 ? _T_845 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_856 = _T_784 ? _T_849 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_857 = _T_788 ? _T_853 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_858 = _T_854 | _T_855; // @[Mux.scala 27:72]
  wire [31:0] _T_859 = _T_858 | _T_856; // @[Mux.scala 27:72]
  wire [31:0] store_data_lo_r = _T_859 | _T_857; // @[Mux.scala 27:72]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 261:40]
  wire  _T_866 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 263:26]
  wire  _T_867 = io_lsu_pkt_r_word & _T_778; // @[Mux.scala 27:72]
  wire  _T_868 = io_lsu_pkt_r_half & _T_866; // @[Mux.scala 27:72]
  wire  _T_870 = _T_867 | _T_868; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_870 | io_lsu_pkt_r_by; // @[Mux.scala 27:72]
  wire  _T_872 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 265:55]
  wire  _T_873 = io_lsu_busreq_r & _T_872; // @[el2_lsu_bus_buffer.scala 265:34]
  wire  _T_874 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 265:79]
  wire  ibuf_byp = _T_873 & _T_874; // @[el2_lsu_bus_buffer.scala 265:77]
  wire  _T_875 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 266:36]
  wire  _T_876 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 266:56]
  wire  ibuf_wr_en = _T_875 & _T_876; // @[el2_lsu_bus_buffer.scala 266:54]
  wire  _T_877 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 268:36]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 311:59]
  wire  _T_886 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 274:62]
  wire  _T_887 = ibuf_wr_en | _T_886; // @[el2_lsu_bus_buffer.scala 274:48]
  wire  _T_951 = _T_875 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 293:54]
  wire  _T_952 = _T_951 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 293:75]
  wire  _T_953 = _T_952 & ibuf_write; // @[el2_lsu_bus_buffer.scala 293:88]
  wire  _T_956 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 293:124]
  wire  _T_957 = _T_953 & _T_956; // @[el2_lsu_bus_buffer.scala 293:101]
  wire  _T_958 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 293:147]
  wire  _T_959 = _T_957 & _T_958; // @[el2_lsu_bus_buffer.scala 293:145]
  wire  _T_960 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 293:170]
  wire  ibuf_merge_en = _T_959 & _T_960; // @[el2_lsu_bus_buffer.scala 293:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 294:20]
  wire  _T_888 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 274:98]
  wire  _T_889 = ~_T_888; // @[el2_lsu_bus_buffer.scala 274:82]
  wire  _T_890 = _T_887 & _T_889; // @[el2_lsu_bus_buffer.scala 274:80]
  wire  _T_891 = _T_890 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 275:5]
  wire  _T_879 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 269:44]
  wire  _T_880 = io_lsu_busreq_m & _T_879; // @[el2_lsu_bus_buffer.scala 269:42]
  wire  _T_881 = _T_880 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 269:61]
  wire  _T_884 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 269:115]
  wire  _T_885 = io_lsu_pkt_m_load | _T_884; // @[el2_lsu_bus_buffer.scala 269:95]
  wire  ibuf_force_drain = _T_881 & _T_885; // @[el2_lsu_bus_buffer.scala 269:74]
  wire  _T_892 = _T_891 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 275:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_893 = _T_892 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 275:35]
  wire  _T_894 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 275:55]
  wire  _T_895 = _T_893 | _T_894; // @[el2_lsu_bus_buffer.scala 275:53]
  wire  _T_896 = _T_895 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 275:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_896; // @[el2_lsu_bus_buffer.scala 274:32]
  wire  _T_878 = ibuf_drain_vld & _T_877; // @[el2_lsu_bus_buffer.scala 268:34]
  wire  ibuf_rst = _T_878 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 268:49]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 677:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 676:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_903 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 284:77]
  reg [31:0] ibuf_data; // @[el2_lib.scala 491:16]
  wire [7:0] _T_911 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_914 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_915 = _T_888 ? _T_911 : _T_914; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [7:0] _T_920 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_923 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_924 = _T_888 ? _T_920 : _T_923; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [7:0] _T_929 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_932 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_933 = _T_888 ? _T_929 : _T_932; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [7:0] _T_938 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_941 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_942 = _T_888 ? _T_938 : _T_941; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [23:0] _T_944 = {_T_942,_T_933,_T_924}; // @[Cat.scala 29:58]
  wire  _T_945 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 291:59]
  wire [2:0] _T_948 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 291:93]
  wire  _T_963 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 295:65]
  wire  _T_964 = ibuf_merge_en & _T_963; // @[el2_lsu_bus_buffer.scala 295:63]
  wire  _T_967 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_969 = _T_964 ? _T_967 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire  _T_974 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_976 = _T_964 ? _T_974 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire  _T_981 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_983 = _T_964 ? _T_981 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire  _T_988 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_990 = _T_964 ? _T_988 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire [3:0] ibuf_byteen_out = {_T_990,_T_983,_T_976,_T_969}; // @[Cat.scala 29:58]
  wire [7:0] _T_1000 = _T_964 ? _T_911 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [7:0] _T_1008 = _T_964 ? _T_920 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [7:0] _T_1016 = _T_964 ? _T_929 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [7:0] _T_1024 = _T_964 ? _T_938 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [31:0] ibuf_data_out = {_T_1024,_T_1016,_T_1008,_T_1000}; // @[Cat.scala 29:58]
  wire  _T_1027 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 298:28]
  wire  _T_1028 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 298:63]
  wire  _T_1033 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 299:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4494 = buf_write[3] & _T_2666; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4495 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4496 = _T_4494 & _T_4495; // @[el2_lsu_bus_buffer.scala 582:89]
  wire  _T_4489 = buf_write[2] & _T_2661; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4490 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4491 = _T_4489 & _T_4490; // @[el2_lsu_bus_buffer.scala 582:89]
  wire [1:0] _T_4497 = _T_4496 + _T_4491; // @[el2_lsu_bus_buffer.scala 582:142]
  wire  _T_4484 = buf_write[1] & _T_2656; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4485 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4486 = _T_4484 & _T_4485; // @[el2_lsu_bus_buffer.scala 582:89]
  wire [1:0] _GEN_364 = {{1'd0}, _T_4486}; // @[el2_lsu_bus_buffer.scala 582:142]
  wire [2:0] _T_4498 = _T_4497 + _GEN_364; // @[el2_lsu_bus_buffer.scala 582:142]
  wire  _T_4479 = buf_write[0] & _T_2651; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4480 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4481 = _T_4479 & _T_4480; // @[el2_lsu_bus_buffer.scala 582:89]
  wire [2:0] _GEN_365 = {{2'd0}, _T_4481}; // @[el2_lsu_bus_buffer.scala 582:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4498 + _GEN_365; // @[el2_lsu_bus_buffer.scala 582:142]
  wire  _T_1059 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 321:43]
  wire  _T_4511 = _T_2666 & _T_4495; // @[el2_lsu_bus_buffer.scala 583:73]
  wire  _T_4508 = _T_2661 & _T_4490; // @[el2_lsu_bus_buffer.scala 583:73]
  wire [1:0] _T_4512 = _T_4511 + _T_4508; // @[el2_lsu_bus_buffer.scala 583:126]
  wire  _T_4505 = _T_2656 & _T_4485; // @[el2_lsu_bus_buffer.scala 583:73]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4505}; // @[el2_lsu_bus_buffer.scala 583:126]
  wire [2:0] _T_4513 = _T_4512 + _GEN_366; // @[el2_lsu_bus_buffer.scala 583:126]
  wire  _T_4502 = _T_2651 & _T_4480; // @[el2_lsu_bus_buffer.scala 583:73]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4502}; // @[el2_lsu_bus_buffer.scala 583:126]
  wire [3:0] buf_numvld_cmd_any = _T_4513 + _GEN_367; // @[el2_lsu_bus_buffer.scala 583:126]
  wire  _T_1060 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 321:72]
  wire  _T_1061 = _T_1059 & _T_1060; // @[el2_lsu_bus_buffer.scala 321:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 420:54]
  wire  _T_1062 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 321:97]
  wire  _T_1063 = _T_1061 & _T_1062; // @[el2_lsu_bus_buffer.scala 321:80]
  wire  _T_1065 = _T_1063 & _T_960; // @[el2_lsu_bus_buffer.scala 321:114]
  wire  _T_2024 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_2025 = ~_T_2024; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_2027 = _T_2025 & _T_2666; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_2029 = _T_2027 & _T_4495; // @[el2_lsu_bus_buffer.scala 437:88]
  wire  _T_2018 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_2019 = ~_T_2018; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_2021 = _T_2019 & _T_2661; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_2023 = _T_2021 & _T_4490; // @[el2_lsu_bus_buffer.scala 437:88]
  wire  _T_2012 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_2013 = ~_T_2012; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_2015 = _T_2013 & _T_2656; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_2017 = _T_2015 & _T_4485; // @[el2_lsu_bus_buffer.scala 437:88]
  wire  _T_2006 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_2007 = ~_T_2006; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_2009 = _T_2007 & _T_2651; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_2011 = _T_2009 & _T_4480; // @[el2_lsu_bus_buffer.scala 437:88]
  wire [3:0] CmdPtr0Dec = {_T_2029,_T_2023,_T_2017,_T_2011}; // @[Cat.scala 29:58]
  wire [7:0] _T_2099 = {4'h0,_T_2029,_T_2023,_T_2017,_T_2011}; // @[Cat.scala 29:58]
  wire  _T_2102 = _T_2099[4] | _T_2099[5]; // @[el2_lsu_bus_buffer.scala 445:42]
  wire  _T_2104 = _T_2102 | _T_2099[6]; // @[el2_lsu_bus_buffer.scala 445:48]
  wire  _T_2106 = _T_2104 | _T_2099[7]; // @[el2_lsu_bus_buffer.scala 445:54]
  wire  _T_2109 = _T_2099[2] | _T_2099[3]; // @[el2_lsu_bus_buffer.scala 445:67]
  wire  _T_2111 = _T_2109 | _T_2099[6]; // @[el2_lsu_bus_buffer.scala 445:73]
  wire  _T_2113 = _T_2111 | _T_2099[7]; // @[el2_lsu_bus_buffer.scala 445:79]
  wire  _T_2116 = _T_2099[1] | _T_2099[3]; // @[el2_lsu_bus_buffer.scala 445:92]
  wire  _T_2118 = _T_2116 | _T_2099[5]; // @[el2_lsu_bus_buffer.scala 445:98]
  wire  _T_2120 = _T_2118 | _T_2099[7]; // @[el2_lsu_bus_buffer.scala 445:104]
  wire [2:0] _T_2122 = {_T_2106,_T_2113,_T_2120}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2122[1:0]; // @[el2_lsu_bus_buffer.scala 451:11]
  wire  _T_1066 = CmdPtr0 == 2'h0; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_1067 = CmdPtr0 == 2'h1; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_1068 = CmdPtr0 == 2'h2; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_1069 = CmdPtr0 == 2'h3; // @[el2_lsu_bus_buffer.scala 322:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_1070 = _T_1066 & buf_nomerge_0; // @[Mux.scala 27:72]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _T_1071 = _T_1067 & buf_nomerge_1; // @[Mux.scala 27:72]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _T_1072 = _T_1068 & buf_nomerge_2; // @[Mux.scala 27:72]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1073 = _T_1069 & buf_nomerge_3; // @[Mux.scala 27:72]
  wire  _T_1074 = _T_1070 | _T_1071; // @[Mux.scala 27:72]
  wire  _T_1075 = _T_1074 | _T_1072; // @[Mux.scala 27:72]
  wire  _T_1076 = _T_1075 | _T_1073; // @[Mux.scala 27:72]
  wire  _T_1078 = ~_T_1076; // @[el2_lsu_bus_buffer.scala 322:31]
  wire  _T_1079 = _T_1065 & _T_1078; // @[el2_lsu_bus_buffer.scala 322:29]
  reg  _T_4375; // @[Reg.scala 27:20]
  reg  _T_4372; // @[Reg.scala 27:20]
  reg  _T_4369; // @[Reg.scala 27:20]
  reg  _T_4366; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4375,_T_4372,_T_4369,_T_4366}; // @[Cat.scala 29:58]
  wire  _T_1088 = _T_1066 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1089 = _T_1067 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1090 = _T_1068 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1091 = _T_1069 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1092 = _T_1088 | _T_1089; // @[Mux.scala 27:72]
  wire  _T_1093 = _T_1092 | _T_1090; // @[Mux.scala 27:72]
  wire  _T_1094 = _T_1093 | _T_1091; // @[Mux.scala 27:72]
  wire  _T_1096 = ~_T_1094; // @[el2_lsu_bus_buffer.scala 323:5]
  wire  _T_1097 = _T_1079 & _T_1096; // @[el2_lsu_bus_buffer.scala 322:140]
  wire  _T_1108 = _T_880 & _T_874; // @[el2_lsu_bus_buffer.scala 325:58]
  wire  _T_1110 = _T_1108 & _T_1060; // @[el2_lsu_bus_buffer.scala 325:72]
  wire [29:0] _T_1120 = _T_1066 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1121 = _T_1067 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire [29:0] _T_1122 = _T_1068 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire [29:0] _T_1123 = _T_1069 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = io_lsu_addr_m[31:2] != _T_1126; // @[el2_lsu_bus_buffer.scala 325:123]
  wire  obuf_force_wr_en = _T_1110 & _T_1128; // @[el2_lsu_bus_buffer.scala 325:101]
  wire  _T_1098 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 323:119]
  wire  obuf_wr_wait = _T_1097 & _T_1098; // @[el2_lsu_bus_buffer.scala 323:117]
  wire  _T_1099 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 324:75]
  wire  _T_1100 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 324:95]
  wire  _T_1101 = _T_1099 & _T_1100; // @[el2_lsu_bus_buffer.scala 324:79]
  wire [2:0] _T_1103 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 324:121]
  wire  _T_4530 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4534 = _T_4530 | _T_4511; // @[el2_lsu_bus_buffer.scala 584:74]
  wire  _T_4525 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4529 = _T_4525 | _T_4508; // @[el2_lsu_bus_buffer.scala 584:74]
  wire [1:0] _T_4535 = _T_4534 + _T_4529; // @[el2_lsu_bus_buffer.scala 584:154]
  wire  _T_4520 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4524 = _T_4520 | _T_4505; // @[el2_lsu_bus_buffer.scala 584:74]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4524}; // @[el2_lsu_bus_buffer.scala 584:154]
  wire [2:0] _T_4536 = _T_4535 + _GEN_368; // @[el2_lsu_bus_buffer.scala 584:154]
  wire  _T_4515 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4519 = _T_4515 | _T_4502; // @[el2_lsu_bus_buffer.scala 584:74]
  wire [2:0] _GEN_369 = {{2'd0}, _T_4519}; // @[el2_lsu_bus_buffer.scala 584:154]
  wire [3:0] buf_numvld_pend_any = _T_4536 + _GEN_369; // @[el2_lsu_bus_buffer.scala 584:154]
  wire  _T_1130 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 327:53]
  wire  _T_1131 = ibuf_byp & _T_1130; // @[el2_lsu_bus_buffer.scala 327:31]
  wire  _T_1132 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 327:64]
  wire  _T_1133 = _T_1132 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 327:84]
  wire  ibuf_buf_byp = _T_1131 & _T_1133; // @[el2_lsu_bus_buffer.scala 327:61]
  wire  _T_1134 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 342:32]
  wire  _T_4826 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4828 = _T_4826 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4829 = _T_4828 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  _T_4830 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4832 = _T_4830 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4833 = _T_4832 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  _T_4842 = _T_4829 | _T_4833; // @[el2_lsu_bus_buffer.scala 613:141]
  wire  _T_4834 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4836 = _T_4834 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4837 = _T_4836 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  _T_4843 = _T_4842 | _T_4837; // @[el2_lsu_bus_buffer.scala 613:141]
  wire  _T_4838 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4840 = _T_4838 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4841 = _T_4840 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  bus_sideeffect_pend = _T_4843 | _T_4841; // @[el2_lsu_bus_buffer.scala 613:141]
  wire  _T_1135 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 342:74]
  wire  _T_1136 = ~_T_1135; // @[el2_lsu_bus_buffer.scala 342:52]
  wire  _T_1137 = _T_1134 & _T_1136; // @[el2_lsu_bus_buffer.scala 342:50]
  wire [2:0] _T_1142 = _T_1066 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1143 = _T_1067 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1146 = _T_1142 | _T_1143; // @[Mux.scala 27:72]
  wire [2:0] _T_1144 = _T_1068 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1147 = _T_1146 | _T_1144; // @[Mux.scala 27:72]
  wire [2:0] _T_1145 = _T_1069 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1148 = _T_1147 | _T_1145; // @[Mux.scala 27:72]
  wire  _T_1150 = _T_1148 == 3'h2; // @[el2_lsu_bus_buffer.scala 343:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 442:31]
  wire  _T_1151 = _T_1150 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 343:47]
  wire [3:0] _T_1154 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1163 = _T_1066 & _T_1154[0]; // @[Mux.scala 27:72]
  wire  _T_1164 = _T_1067 & _T_1154[1]; // @[Mux.scala 27:72]
  wire  _T_1167 = _T_1163 | _T_1164; // @[Mux.scala 27:72]
  wire  _T_1165 = _T_1068 & _T_1154[2]; // @[Mux.scala 27:72]
  wire  _T_1168 = _T_1167 | _T_1165; // @[Mux.scala 27:72]
  wire  _T_1166 = _T_1069 & _T_1154[3]; // @[Mux.scala 27:72]
  wire  _T_1169 = _T_1168 | _T_1166; // @[Mux.scala 27:72]
  wire  _T_1171 = ~_T_1169; // @[el2_lsu_bus_buffer.scala 344:23]
  wire  _T_1172 = _T_1151 & _T_1171; // @[el2_lsu_bus_buffer.scala 344:21]
  wire  _T_1189 = _T_1094 & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 344:141]
  wire  _T_1190 = ~_T_1189; // @[el2_lsu_bus_buffer.scala 344:105]
  wire  _T_1191 = _T_1172 & _T_1190; // @[el2_lsu_bus_buffer.scala 344:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1194 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  wire  _T_1203 = _T_1066 & _T_1194[0]; // @[Mux.scala 27:72]
  wire  _T_1204 = _T_1067 & _T_1194[1]; // @[Mux.scala 27:72]
  wire  _T_1207 = _T_1203 | _T_1204; // @[Mux.scala 27:72]
  wire  _T_1205 = _T_1068 & _T_1194[2]; // @[Mux.scala 27:72]
  wire  _T_1208 = _T_1207 | _T_1205; // @[Mux.scala 27:72]
  wire  _T_1206 = _T_1069 & _T_1194[3]; // @[Mux.scala 27:72]
  wire  _T_1209 = _T_1208 | _T_1206; // @[Mux.scala 27:72]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1213 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1222 = _T_1066 & _T_1213[0]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1067 & _T_1213[1]; // @[Mux.scala 27:72]
  wire  _T_1226 = _T_1222 | _T_1223; // @[Mux.scala 27:72]
  wire  _T_1224 = _T_1068 & _T_1213[2]; // @[Mux.scala 27:72]
  wire  _T_1227 = _T_1226 | _T_1224; // @[Mux.scala 27:72]
  wire  _T_1225 = _T_1069 & _T_1213[3]; // @[Mux.scala 27:72]
  wire  _T_1228 = _T_1227 | _T_1225; // @[Mux.scala 27:72]
  wire  _T_1230 = _T_1209 & _T_1228; // @[el2_lsu_bus_buffer.scala 345:77]
  wire  _T_1239 = _T_1066 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1240 = _T_1067 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1243 = _T_1239 | _T_1240; // @[Mux.scala 27:72]
  wire  _T_1241 = _T_1068 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1244 = _T_1243 | _T_1241; // @[Mux.scala 27:72]
  wire  _T_1242 = _T_1069 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1245 = _T_1244 | _T_1242; // @[Mux.scala 27:72]
  wire  _T_1247 = ~_T_1245; // @[el2_lsu_bus_buffer.scala 345:150]
  wire  _T_1248 = _T_1230 & _T_1247; // @[el2_lsu_bus_buffer.scala 345:148]
  wire  _T_1249 = ~_T_1248; // @[el2_lsu_bus_buffer.scala 345:8]
  wire [3:0] _T_2065 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 438:62]
  wire [3:0] _T_2066 = buf_age_3 & _T_2065; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2067 = |_T_2066; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2068 = ~_T_2067; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2070 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2071 = _T_2068 & _T_2070; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2073 = _T_2071 & _T_2666; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2075 = _T_2073 & _T_4495; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] _T_2055 = buf_age_2 & _T_2065; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2056 = |_T_2055; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2057 = ~_T_2056; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2059 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2060 = _T_2057 & _T_2059; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2062 = _T_2060 & _T_2661; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2064 = _T_2062 & _T_4490; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] _T_2044 = buf_age_1 & _T_2065; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2045 = |_T_2044; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2046 = ~_T_2045; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2048 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2049 = _T_2046 & _T_2048; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2051 = _T_2049 & _T_2656; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2053 = _T_2051 & _T_4485; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] _T_2033 = buf_age_0 & _T_2065; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2034 = |_T_2033; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2035 = ~_T_2034; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2037 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2038 = _T_2035 & _T_2037; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2040 = _T_2038 & _T_2651; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2042 = _T_2040 & _T_4480; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] CmdPtr1Dec = {_T_2075,_T_2064,_T_2053,_T_2042}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 443:31]
  wire  _T_1250 = _T_1249 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 345:181]
  wire [3:0] _T_1253 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1262 = _T_1066 & _T_1253[0]; // @[Mux.scala 27:72]
  wire  _T_1263 = _T_1067 & _T_1253[1]; // @[Mux.scala 27:72]
  wire  _T_1266 = _T_1262 | _T_1263; // @[Mux.scala 27:72]
  wire  _T_1264 = _T_1068 & _T_1253[2]; // @[Mux.scala 27:72]
  wire  _T_1267 = _T_1266 | _T_1264; // @[Mux.scala 27:72]
  wire  _T_1265 = _T_1069 & _T_1253[3]; // @[Mux.scala 27:72]
  wire  _T_1268 = _T_1267 | _T_1265; // @[Mux.scala 27:72]
  wire  _T_1270 = _T_1250 | _T_1268; // @[el2_lsu_bus_buffer.scala 345:197]
  wire  _T_1271 = _T_1270 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 345:269]
  wire  _T_1272 = _T_1191 & _T_1271; // @[el2_lsu_bus_buffer.scala 344:164]
  wire  _T_1273 = _T_1137 | _T_1272; // @[el2_lsu_bus_buffer.scala 342:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 407:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 408:55]
  wire  _T_4901 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 617:54]
  wire  _T_4902 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 617:75]
  wire  _T_4904 = _T_4901 ? _T_4902 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 617:39]
  wire  bus_cmd_ready = obuf_write ? _T_4904 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 617:23]
  wire  _T_1274 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 346:48]
  wire  _T_1275 = bus_cmd_ready | _T_1274; // @[el2_lsu_bus_buffer.scala 346:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1276 = _T_1275 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 346:60]
  wire  _T_1277 = _T_1273 & _T_1276; // @[el2_lsu_bus_buffer.scala 346:29]
  wire  _T_1278 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 346:77]
  wire  _T_1279 = _T_1277 & _T_1278; // @[el2_lsu_bus_buffer.scala 346:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4849 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4850 = obuf_valid & _T_4849; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4852 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4853 = obuf_merge & _T_4852; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4854 = _T_3607 | _T_4853; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4855 = ~_T_4854; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4856 = _T_4850 & _T_4855; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4893 = _T_4826 & _T_4856; // @[Mux.scala 27:72]
  wire  _T_4861 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4862 = obuf_valid & _T_4861; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4864 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4865 = obuf_merge & _T_4864; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4866 = _T_3800 | _T_4865; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4867 = ~_T_4866; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4868 = _T_4862 & _T_4867; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4894 = _T_4830 & _T_4868; // @[Mux.scala 27:72]
  wire  _T_4897 = _T_4893 | _T_4894; // @[Mux.scala 27:72]
  wire  _T_4873 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4874 = obuf_valid & _T_4873; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4876 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4877 = obuf_merge & _T_4876; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4878 = _T_3993 | _T_4877; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4879 = ~_T_4878; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4880 = _T_4874 & _T_4879; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4895 = _T_4834 & _T_4880; // @[Mux.scala 27:72]
  wire  _T_4898 = _T_4897 | _T_4895; // @[Mux.scala 27:72]
  wire  _T_4885 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4886 = obuf_valid & _T_4885; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4888 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4889 = obuf_merge & _T_4888; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4890 = _T_4186 | _T_4889; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4891 = ~_T_4890; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4892 = _T_4886 & _T_4891; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4896 = _T_4838 & _T_4892; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4898 | _T_4896; // @[Mux.scala 27:72]
  wire  _T_1282 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 346:118]
  wire  _T_1283 = _T_1279 & _T_1282; // @[el2_lsu_bus_buffer.scala 346:116]
  wire  obuf_wr_en = _T_1283 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 346:142]
  wire  _T_1285 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 348:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 618:39]
  wire  _T_4908 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 620:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 619:39]
  wire  _T_4909 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 620:70]
  wire  _T_4910 = _T_4908 & _T_4909; // @[el2_lsu_bus_buffer.scala 620:52]
  wire  _T_4911 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 620:111]
  wire  bus_cmd_sent = _T_4910 | _T_4911; // @[el2_lsu_bus_buffer.scala 620:89]
  wire  _T_1286 = bus_cmd_sent | _T_1285; // @[el2_lsu_bus_buffer.scala 348:33]
  wire  _T_1287 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 348:65]
  wire  _T_1288 = _T_1286 & _T_1287; // @[el2_lsu_bus_buffer.scala 348:63]
  wire  _T_1289 = _T_1288 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 348:77]
  wire  obuf_rst = _T_1289 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 348:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : _T_1245; // @[el2_lsu_bus_buffer.scala 349:26]
  wire [31:0] _T_1326 = _T_1066 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1327 = _T_1067 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1328 = _T_1068 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1329 = _T_1069 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1330 = _T_1326 | _T_1327; // @[Mux.scala 27:72]
  wire [31:0] _T_1331 = _T_1330 | _T_1328; // @[Mux.scala 27:72]
  wire [31:0] _T_1332 = _T_1331 | _T_1329; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1332; // @[el2_lsu_bus_buffer.scala 351:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1339 = _T_1066 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1340 = _T_1067 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1341 = _T_1068 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1342 = _T_1069 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1343 = _T_1339 | _T_1340; // @[Mux.scala 27:72]
  wire [1:0] _T_1344 = _T_1343 | _T_1341; // @[Mux.scala 27:72]
  wire [1:0] _T_1345 = _T_1344 | _T_1342; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1345; // @[el2_lsu_bus_buffer.scala 354:23]
  wire  _T_1347 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 363:39]
  wire  _T_1348 = ~_T_1347; // @[el2_lsu_bus_buffer.scala 363:26]
  wire  _T_1354 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 367:72]
  wire  _T_1357 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 367:98]
  wire  _T_1358 = obuf_sz_in[0] & _T_1357; // @[el2_lsu_bus_buffer.scala 367:96]
  wire  _T_1359 = _T_1354 | _T_1358; // @[el2_lsu_bus_buffer.scala 367:79]
  wire  _T_1362 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 367:153]
  wire  _T_1363 = ~_T_1362; // @[el2_lsu_bus_buffer.scala 367:134]
  wire  _T_1364 = obuf_sz_in[1] & _T_1363; // @[el2_lsu_bus_buffer.scala 367:132]
  wire  _T_1365 = _T_1359 | _T_1364; // @[el2_lsu_bus_buffer.scala 367:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1365; // @[el2_lsu_bus_buffer.scala 367:28]
  wire  _T_1382 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 381:40]
  wire  _T_1383 = _T_1382 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 381:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1384 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 381:80]
  wire  _T_1385 = _T_1383 & _T_1384; // @[el2_lsu_bus_buffer.scala 381:78]
  wire  _T_1386 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 381:99]
  wire  _T_1387 = _T_1385 & _T_1386; // @[el2_lsu_bus_buffer.scala 381:97]
  wire  _T_1388 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 381:113]
  wire  _T_1389 = _T_1387 & _T_1388; // @[el2_lsu_bus_buffer.scala 381:111]
  wire  _T_1390 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 381:130]
  wire  _T_1391 = _T_1389 & _T_1390; // @[el2_lsu_bus_buffer.scala 381:128]
  wire  _T_1392 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 382:20]
  wire  _T_1393 = obuf_valid & _T_1392; // @[el2_lsu_bus_buffer.scala 382:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 409:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 621:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 410:55]
  wire  _T_1394 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 382:90]
  wire  _T_1395 = bus_rsp_read & _T_1394; // @[el2_lsu_bus_buffer.scala 382:70]
  wire  _T_1396 = ~_T_1395; // @[el2_lsu_bus_buffer.scala 382:55]
  wire  _T_1397 = obuf_rdrsp_pend & _T_1396; // @[el2_lsu_bus_buffer.scala 382:53]
  wire  _T_1398 = _T_1393 | _T_1397; // @[el2_lsu_bus_buffer.scala 382:34]
  wire  obuf_nosend_in = _T_1391 & _T_1398; // @[el2_lsu_bus_buffer.scala 381:165]
  wire  _T_1366 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 375:44]
  wire  _T_1367 = obuf_wr_en & _T_1366; // @[el2_lsu_bus_buffer.scala 375:42]
  wire  _T_1368 = ~_T_1367; // @[el2_lsu_bus_buffer.scala 375:29]
  wire  _T_1369 = _T_1368 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 375:61]
  wire  _T_1373 = _T_1369 & _T_1396; // @[el2_lsu_bus_buffer.scala 375:79]
  wire  _T_1375 = bus_cmd_sent & _T_1386; // @[el2_lsu_bus_buffer.scala 376:20]
  wire  _T_1376 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 376:37]
  wire  _T_1377 = _T_1375 & _T_1376; // @[el2_lsu_bus_buffer.scala 376:35]
  wire  _T_1379 = bus_cmd_sent | _T_1386; // @[el2_lsu_bus_buffer.scala 378:44]
  wire [7:0] _T_1401 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1402 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1403 = io_lsu_addr_r[2] ? _T_1401 : _T_1402; // @[el2_lsu_bus_buffer.scala 383:46]
  wire [3:0] _T_1422 = _T_1066 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1423 = _T_1067 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1424 = _T_1068 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1425 = _T_1069 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1426 = _T_1422 | _T_1423; // @[Mux.scala 27:72]
  wire [3:0] _T_1427 = _T_1426 | _T_1424; // @[Mux.scala 27:72]
  wire [3:0] _T_1428 = _T_1427 | _T_1425; // @[Mux.scala 27:72]
  wire [7:0] _T_1430 = {_T_1428,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1443 = {4'h0,_T_1428}; // @[Cat.scala 29:58]
  wire [7:0] _T_1444 = _T_1332[2] ? _T_1430 : _T_1443; // @[el2_lsu_bus_buffer.scala 384:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1403 : _T_1444; // @[el2_lsu_bus_buffer.scala 383:28]
  wire [7:0] _T_1446 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1447 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1448 = io_end_addr_r[2] ? _T_1446 : _T_1447; // @[el2_lsu_bus_buffer.scala 385:46]
  wire [7:0] _T_1475 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1488 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1489 = buf_addr_0[2] ? _T_1475 : _T_1488; // @[el2_lsu_bus_buffer.scala 386:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1448 : _T_1489; // @[el2_lsu_bus_buffer.scala 385:28]
  wire [63:0] _T_1491 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1492 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1493 = io_lsu_addr_r[2] ? _T_1491 : _T_1492; // @[el2_lsu_bus_buffer.scala 388:44]
  wire [31:0] _T_1512 = _T_1066 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1513 = _T_1067 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1514 = _T_1068 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1515 = _T_1069 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1516 = _T_1512 | _T_1513; // @[Mux.scala 27:72]
  wire [31:0] _T_1517 = _T_1516 | _T_1514; // @[Mux.scala 27:72]
  wire [31:0] _T_1518 = _T_1517 | _T_1515; // @[Mux.scala 27:72]
  wire [63:0] _T_1520 = {_T_1518,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1533 = {32'h0,_T_1518}; // @[Cat.scala 29:58]
  wire [63:0] _T_1534 = _T_1332[2] ? _T_1520 : _T_1533; // @[el2_lsu_bus_buffer.scala 389:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1493 : _T_1534; // @[el2_lsu_bus_buffer.scala 388:26]
  wire [63:0] _T_1536 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1537 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1538 = io_lsu_addr_r[2] ? _T_1536 : _T_1537; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [63:0] _T_1565 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1578 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1579 = buf_addr_0[2] ? _T_1565 : _T_1578; // @[el2_lsu_bus_buffer.scala 391:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1538 : _T_1579; // @[el2_lsu_bus_buffer.scala 390:26]
  wire  _T_1664 = CmdPtr0 != 2'h0; // @[el2_lsu_bus_buffer.scala 397:30]
  wire  _T_1665 = _T_1664 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 397:43]
  wire  _T_1666 = _T_1665 & found_cmdptr1; // @[el2_lsu_bus_buffer.scala 397:59]
  wire  _T_1680 = _T_1666 & _T_1150; // @[el2_lsu_bus_buffer.scala 397:75]
  wire  _T_1694 = _T_1680 & _T_2651; // @[el2_lsu_bus_buffer.scala 397:118]
  wire  _T_1715 = _T_1694 & _T_1171; // @[el2_lsu_bus_buffer.scala 397:161]
  wire  _T_1733 = _T_1715 & _T_1096; // @[el2_lsu_bus_buffer.scala 398:83]
  wire  _T_1835 = _T_1247 & _T_1209; // @[el2_lsu_bus_buffer.scala 401:36]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1838 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1847 = _T_1066 & _T_1838[0]; // @[Mux.scala 27:72]
  wire  _T_1848 = _T_1067 & _T_1838[1]; // @[Mux.scala 27:72]
  wire  _T_1851 = _T_1847 | _T_1848; // @[Mux.scala 27:72]
  wire  _T_1849 = _T_1068 & _T_1838[2]; // @[Mux.scala 27:72]
  wire  _T_1852 = _T_1851 | _T_1849; // @[Mux.scala 27:72]
  wire  _T_1850 = _T_1069 & _T_1838[3]; // @[Mux.scala 27:72]
  wire  _T_1853 = _T_1852 | _T_1850; // @[Mux.scala 27:72]
  wire  _T_1855 = ~_T_1853; // @[el2_lsu_bus_buffer.scala 401:107]
  wire  _T_1856 = _T_1835 & _T_1855; // @[el2_lsu_bus_buffer.scala 401:105]
  wire  _T_1876 = _T_1856 & _T_1228; // @[el2_lsu_bus_buffer.scala 401:177]
  wire  _T_1878 = _T_1733 & _T_1876; // @[el2_lsu_bus_buffer.scala 398:120]
  wire  _T_1879 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 402:19]
  wire  _T_1880 = _T_1879 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 402:35]
  wire  obuf_merge_en = _T_1878 | _T_1880; // @[el2_lsu_bus_buffer.scala 401:251]
  wire  _T_1582 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1583 = obuf_byteen0_in[0] | _T_1582; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1586 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1587 = obuf_byteen0_in[1] | _T_1586; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1590 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1591 = obuf_byteen0_in[2] | _T_1590; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1594 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1595 = obuf_byteen0_in[3] | _T_1594; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1598 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1599 = obuf_byteen0_in[4] | _T_1598; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1602 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1603 = obuf_byteen0_in[5] | _T_1602; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1606 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1607 = obuf_byteen0_in[6] | _T_1606; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1610 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1611 = obuf_byteen0_in[7] | _T_1610; // @[el2_lsu_bus_buffer.scala 392:63]
  wire [7:0] obuf_byteen_in = {_T_1611,_T_1607,_T_1603,_T_1599,_T_1595,_T_1591,_T_1587,_T_1583}; // @[Cat.scala 29:58]
  wire [7:0] _T_1622 = _T_1582 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1627 = _T_1586 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1632 = _T_1590 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1637 = _T_1594 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1642 = _T_1598 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1647 = _T_1602 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1652 = _T_1606 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1657 = _T_1610 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [55:0] _T_1663 = {_T_1657,_T_1652,_T_1647,_T_1642,_T_1637,_T_1632,_T_1627}; // @[Cat.scala 29:58]
  wire  _T_1882 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 405:58]
  wire  _T_1883 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 405:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 491:16]
  wire  _T_1896 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1897 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1898 = ibuf_valid & _T_1897; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1899 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1900 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1901 = io_ldst_dual_r & _T_1900; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1902 = _T_1899 | _T_1901; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1903 = io_lsu_busreq_r & _T_1902; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1904 = _T_1898 | _T_1903; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1905 = ~_T_1904; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1906 = _T_1896 & _T_1905; // @[el2_lsu_bus_buffer.scala 423:76]
  wire  _T_1907 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1908 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1909 = ibuf_valid & _T_1908; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1910 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1911 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1912 = io_ldst_dual_r & _T_1911; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1913 = _T_1910 | _T_1912; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1914 = io_lsu_busreq_r & _T_1913; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1915 = _T_1909 | _T_1914; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1916 = ~_T_1915; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1917 = _T_1907 & _T_1916; // @[el2_lsu_bus_buffer.scala 423:76]
  wire  _T_1918 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1919 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1920 = ibuf_valid & _T_1919; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1921 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1922 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1923 = io_ldst_dual_r & _T_1922; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1924 = _T_1921 | _T_1923; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1925 = io_lsu_busreq_r & _T_1924; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1926 = _T_1920 | _T_1925; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1927 = ~_T_1926; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1928 = _T_1918 & _T_1927; // @[el2_lsu_bus_buffer.scala 423:76]
  wire  _T_1929 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1930 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1931 = ibuf_valid & _T_1930; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1932 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1933 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1934 = io_ldst_dual_r & _T_1933; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1935 = _T_1932 | _T_1934; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1936 = io_lsu_busreq_r & _T_1935; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1937 = _T_1931 | _T_1936; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1938 = ~_T_1937; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1939 = _T_1929 & _T_1938; // @[el2_lsu_bus_buffer.scala 423:76]
  wire [1:0] _T_1940 = _T_1939 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1941 = _T_1928 ? 2'h2 : _T_1940; // @[Mux.scala 98:16]
  wire [1:0] _T_1942 = _T_1917 ? 2'h1 : _T_1941; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1906 ? 2'h0 : _T_1942; // @[Mux.scala 98:16]
  wire [8:0] _T_1945 = {buf_state_0,buf_state_1,buf_state_2}; // @[Cat.scala 29:58]
  wire  _T_1950 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1951 = io_lsu_busreq_m & _T_1950; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1952 = _T_1898 | _T_1951; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1958 = _T_1952 | _T_1903; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1959 = ~_T_1958; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1960 = _T_1896 & _T_1959; // @[el2_lsu_bus_buffer.scala 428:79]
  wire  _T_1964 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1965 = io_lsu_busreq_m & _T_1964; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1966 = _T_1909 | _T_1965; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1972 = _T_1966 | _T_1914; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1973 = ~_T_1972; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1974 = _T_1907 & _T_1973; // @[el2_lsu_bus_buffer.scala 428:79]
  wire  _T_1978 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1979 = io_lsu_busreq_m & _T_1978; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1980 = _T_1920 | _T_1979; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1986 = _T_1980 | _T_1925; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1987 = ~_T_1986; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1988 = _T_1918 & _T_1987; // @[el2_lsu_bus_buffer.scala 428:79]
  wire  _T_1992 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1993 = io_lsu_busreq_m & _T_1992; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1994 = _T_1931 | _T_1993; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_2000 = _T_1994 | _T_1936; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_2001 = ~_T_2000; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_2002 = _T_1929 & _T_2001; // @[el2_lsu_bus_buffer.scala 428:79]
  wire [1:0] _T_2003 = _T_2002 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_2004 = _T_1988 ? 2'h2 : _T_2003; // @[Mux.scala 98:16]
  wire [1:0] _T_2005 = _T_1974 ? 2'h1 : _T_2004; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2791 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2792 = buf_rspageQ_0[3] & _T_2791; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2788 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2789 = buf_rspageQ_0[2] & _T_2788; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2785 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2786 = buf_rspageQ_0[1] & _T_2785; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2782 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2783 = buf_rspageQ_0[0] & _T_2782; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2792,_T_2789,_T_2786,_T_2783}; // @[Cat.scala 29:58]
  wire  _T_2078 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2079 = ~_T_2078; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2081 = _T_2079 & _T_2782; // @[el2_lsu_bus_buffer.scala 441:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2807 = buf_rspageQ_1[3] & _T_2791; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2804 = buf_rspageQ_1[2] & _T_2788; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2801 = buf_rspageQ_1[1] & _T_2785; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2798 = buf_rspageQ_1[0] & _T_2782; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2807,_T_2804,_T_2801,_T_2798}; // @[Cat.scala 29:58]
  wire  _T_2082 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2083 = ~_T_2082; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2085 = _T_2083 & _T_2785; // @[el2_lsu_bus_buffer.scala 441:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2822 = buf_rspageQ_2[3] & _T_2791; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2819 = buf_rspageQ_2[2] & _T_2788; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2816 = buf_rspageQ_2[1] & _T_2785; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2813 = buf_rspageQ_2[0] & _T_2782; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2822,_T_2819,_T_2816,_T_2813}; // @[Cat.scala 29:58]
  wire  _T_2086 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2087 = ~_T_2086; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2089 = _T_2087 & _T_2788; // @[el2_lsu_bus_buffer.scala 441:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2837 = buf_rspageQ_3[3] & _T_2791; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2834 = buf_rspageQ_3[2] & _T_2788; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2831 = buf_rspageQ_3[1] & _T_2785; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2828 = buf_rspageQ_3[0] & _T_2782; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2837,_T_2834,_T_2831,_T_2828}; // @[Cat.scala 29:58]
  wire  _T_2090 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2091 = ~_T_2090; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2093 = _T_2091 & _T_2791; // @[el2_lsu_bus_buffer.scala 441:70]
  wire [7:0] _T_2149 = {4'h0,_T_2093,_T_2089,_T_2085,_T_2081}; // @[Cat.scala 29:58]
  wire  _T_2152 = _T_2149[4] | _T_2149[5]; // @[el2_lsu_bus_buffer.scala 445:42]
  wire  _T_2154 = _T_2152 | _T_2149[6]; // @[el2_lsu_bus_buffer.scala 445:48]
  wire  _T_2156 = _T_2154 | _T_2149[7]; // @[el2_lsu_bus_buffer.scala 445:54]
  wire  _T_2159 = _T_2149[2] | _T_2149[3]; // @[el2_lsu_bus_buffer.scala 445:67]
  wire  _T_2161 = _T_2159 | _T_2149[6]; // @[el2_lsu_bus_buffer.scala 445:73]
  wire  _T_2163 = _T_2161 | _T_2149[7]; // @[el2_lsu_bus_buffer.scala 445:79]
  wire  _T_2166 = _T_2149[1] | _T_2149[3]; // @[el2_lsu_bus_buffer.scala 445:92]
  wire  _T_2168 = _T_2166 | _T_2149[5]; // @[el2_lsu_bus_buffer.scala 445:98]
  wire  _T_2170 = _T_2168 | _T_2149[7]; // @[el2_lsu_bus_buffer.scala 445:104]
  wire [2:0] _T_2172 = {_T_2156,_T_2163,_T_2170}; // @[Cat.scala 29:58]
  wire  _T_3577 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 504:77]
  wire  _T_3578 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 504:97]
  wire  _T_3579 = _T_3577 & _T_3578; // @[el2_lsu_bus_buffer.scala 504:95]
  wire  _T_3580 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_3581 = _T_3579 & _T_3580; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_3582 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 504:144]
  wire  _T_3583 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_3584 = _T_3582 & _T_3583; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_3585 = _T_3581 | _T_3584; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_3586 = _T_875 & _T_3585; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_3587 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_3588 = ibuf_drain_vld & _T_3587; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_3589 = _T_3586 | _T_3588; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_3599 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 511:46]
  wire  _T_3634 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 622:38]
  wire  _T_3679 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_3680 = bus_rsp_write & _T_3679; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_3681 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 530:46]
  reg  _T_4352; // @[Reg.scala 27:20]
  reg  _T_4350; // @[Reg.scala 27:20]
  reg  _T_4348; // @[Reg.scala 27:20]
  reg  _T_4346; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4352,_T_4350,_T_4348,_T_4346}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_370 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3683 = io_lsu_axi_rid == _GEN_370; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3684 = buf_ldfwd[0] & _T_3683; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_3685 = _T_3681 | _T_3684; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_3686 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_3688 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_3689 = _T_3686 & _T_3688; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_3690 = _T_3689 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_371 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3691 = io_lsu_axi_rid == _GEN_371; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3692 = _T_3690 & _T_3691; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_3693 = _T_3685 | _T_3692; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_3694 = bus_rsp_read & _T_3693; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_3695 = _T_3680 | _T_3694; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_42 = _T_3634 & _T_3695; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3600 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3596 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3573 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3721 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3731 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 544:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_373 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3733 = io_lsu_axi_rid == _GEN_373; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3734 = _T_3731[0] & _T_3733; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_3735 = _T_3691 | _T_3734; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_3736 = bus_rsp_read & _T_3735; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_36 = _T_3721 & _T_3736; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3634 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3600 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3596 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3573 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3613 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_3614 = _T_3613 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_3739 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2172[1:0]; // @[el2_lsu_bus_buffer.scala 454:10]
  wire  _T_3742 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_3743 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_3744 = buf_dual_0 & _T_3743; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_3745 = _T_3742 | _T_3744; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_3746 = _T_3745 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_3747 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3739 ? _T_3746 : _T_3747; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3721 ? _T_3614 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3634 ? _T_3614 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3600 ? _T_3614 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3596 ? _T_3599 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3573 ? _T_3589 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2174 = _T_1896 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2180 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 468:23]
  wire  _T_2182 = _T_2180 & _T_3577; // @[el2_lsu_bus_buffer.scala 468:41]
  wire  _T_2184 = _T_2182 & _T_1899; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2186 = _T_2184 & _T_1897; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2187 = _T_4519 | _T_2186; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2188 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 469:17]
  wire  _T_2189 = _T_2188 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 469:35]
  wire  _T_2191 = _T_2189 & _T_1900; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2193 = _T_2191 & _T_1899; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2194 = _T_2187 | _T_2193; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2195 = _T_2174 & _T_2194; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2197 = _T_2195 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2211 = _T_2184 & _T_1908; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2212 = _T_4524 | _T_2211; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2218 = _T_2191 & _T_1910; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2219 = _T_2212 | _T_2218; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2220 = _T_2174 & _T_2219; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2222 = _T_2220 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2236 = _T_2184 & _T_1919; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2237 = _T_4529 | _T_2236; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2243 = _T_2191 & _T_1921; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2244 = _T_2237 | _T_2243; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2245 = _T_2174 & _T_2244; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2247 = _T_2245 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2261 = _T_2184 & _T_1930; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2262 = _T_4534 | _T_2261; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2268 = _T_2191 & _T_1932; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2269 = _T_2262 | _T_2268; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2270 = _T_2174 & _T_2269; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2272 = _T_2270 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2274 = {_T_2272,_T_2247,_T_2222}; // @[Cat.scala 29:58]
  wire  _T_3773 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_3774 = _T_3579 & _T_3773; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_3776 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_3777 = _T_3582 & _T_3776; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_3778 = _T_3774 | _T_3777; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_3779 = _T_875 & _T_3778; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_3780 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_3781 = ibuf_drain_vld & _T_3780; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_3782 = _T_3779 | _T_3781; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_3827 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3872 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_3873 = bus_rsp_write & _T_3872; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_3874 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 530:46]
  wire [2:0] _GEN_374 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3876 = io_lsu_axi_rid == _GEN_374; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3877 = buf_ldfwd[1] & _T_3876; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_3878 = _T_3874 | _T_3877; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_3879 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_3881 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_3882 = _T_3879 & _T_3881; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_3883 = _T_3882 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_375 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3884 = io_lsu_axi_rid == _GEN_375; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3885 = _T_3883 & _T_3884; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_3886 = _T_3878 | _T_3885; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_3887 = bus_rsp_read & _T_3886; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_3888 = _T_3873 | _T_3887; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_118 = _T_3827 & _T_3888; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3793 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3789 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3766 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3914 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3924 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 544:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_377 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3926 = io_lsu_axi_rid == _GEN_377; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3927 = _T_3924[0] & _T_3926; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_3928 = _T_3884 | _T_3927; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_3929 = bus_rsp_read & _T_3928; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_112 = _T_3914 & _T_3929; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3827 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3793 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3789 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3766 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3806 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_3807 = _T_3806 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_3932 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3935 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_3936 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_3937 = buf_dual_1 & _T_3936; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_3938 = _T_3935 | _T_3937; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_3939 = _T_3938 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_3940 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3932 ? _T_3939 : _T_3940; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3914 ? _T_3807 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3827 ? _T_3807 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3793 ? _T_3807 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3789 ? _T_3599 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3766 ? _T_3782 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2276 = _T_1907 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2286 = _T_2182 & _T_1910; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2288 = _T_2286 & _T_1897; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2289 = _T_4519 | _T_2288; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2293 = _T_2189 & _T_1911; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2295 = _T_2293 & _T_1899; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2296 = _T_2289 | _T_2295; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2297 = _T_2276 & _T_2296; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2299 = _T_2297 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2313 = _T_2286 & _T_1908; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2314 = _T_4524 | _T_2313; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2320 = _T_2293 & _T_1910; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2321 = _T_2314 | _T_2320; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2322 = _T_2276 & _T_2321; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2324 = _T_2322 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2338 = _T_2286 & _T_1919; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2339 = _T_4529 | _T_2338; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2345 = _T_2293 & _T_1921; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2346 = _T_2339 | _T_2345; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2347 = _T_2276 & _T_2346; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2349 = _T_2347 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2363 = _T_2286 & _T_1930; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2364 = _T_4534 | _T_2363; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2370 = _T_2293 & _T_1932; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2371 = _T_2364 | _T_2370; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2372 = _T_2276 & _T_2371; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2374 = _T_2372 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2376 = {_T_2374,_T_2349,_T_2324}; // @[Cat.scala 29:58]
  wire  _T_3966 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_3967 = _T_3579 & _T_3966; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_3969 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_3970 = _T_3582 & _T_3969; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_3971 = _T_3967 | _T_3970; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_3972 = _T_875 & _T_3971; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_3973 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_3974 = ibuf_drain_vld & _T_3973; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_3975 = _T_3972 | _T_3974; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_4020 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4065 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_4066 = bus_rsp_write & _T_4065; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_4067 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 530:46]
  wire [2:0] _GEN_378 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4069 = io_lsu_axi_rid == _GEN_378; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4070 = buf_ldfwd[2] & _T_4069; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_4071 = _T_4067 | _T_4070; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_4072 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_4074 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_4075 = _T_4072 & _T_4074; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_4076 = _T_4075 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_379 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4077 = io_lsu_axi_rid == _GEN_379; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4078 = _T_4076 & _T_4077; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_4079 = _T_4071 | _T_4078; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_4080 = bus_rsp_read & _T_4079; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_4081 = _T_4066 | _T_4080; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_194 = _T_4020 & _T_4081; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3986 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3982 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3959 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4107 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4117 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 544:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_381 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4119 = io_lsu_axi_rid == _GEN_381; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4120 = _T_4117[0] & _T_4119; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_4121 = _T_4077 | _T_4120; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_4122 = bus_rsp_read & _T_4121; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_188 = _T_4107 & _T_4122; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_4020 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3986 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3982 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3959 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3999 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_4000 = _T_3999 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_4125 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4128 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_4129 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_4130 = buf_dual_2 & _T_4129; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_4131 = _T_4128 | _T_4130; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4132 = _T_4131 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_4133 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4125 ? _T_4132 : _T_4133; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4107 ? _T_4000 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_4020 ? _T_4000 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3986 ? _T_4000 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3982 ? _T_3599 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3959 ? _T_3975 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2378 = _T_1918 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2388 = _T_2182 & _T_1921; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2390 = _T_2388 & _T_1897; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2391 = _T_4519 | _T_2390; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2395 = _T_2189 & _T_1922; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2397 = _T_2395 & _T_1899; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2398 = _T_2391 | _T_2397; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2399 = _T_2378 & _T_2398; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2401 = _T_2399 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2415 = _T_2388 & _T_1908; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2416 = _T_4524 | _T_2415; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2422 = _T_2395 & _T_1910; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2423 = _T_2416 | _T_2422; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2424 = _T_2378 & _T_2423; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2426 = _T_2424 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2440 = _T_2388 & _T_1919; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2441 = _T_4529 | _T_2440; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2447 = _T_2395 & _T_1921; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2448 = _T_2441 | _T_2447; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2449 = _T_2378 & _T_2448; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2451 = _T_2449 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2465 = _T_2388 & _T_1930; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2466 = _T_4534 | _T_2465; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2472 = _T_2395 & _T_1932; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2473 = _T_2466 | _T_2472; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2474 = _T_2378 & _T_2473; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2476 = _T_2474 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2478 = {_T_2476,_T_2451,_T_2426}; // @[Cat.scala 29:58]
  wire  _T_4159 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_4160 = _T_3579 & _T_4159; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_4162 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_4163 = _T_3582 & _T_4162; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_4164 = _T_4160 | _T_4163; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_4165 = _T_875 & _T_4164; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_4166 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_4167 = ibuf_drain_vld & _T_4166; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_4168 = _T_4165 | _T_4167; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_4213 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4258 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_4259 = bus_rsp_write & _T_4258; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_4260 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 530:46]
  wire [2:0] _GEN_382 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4262 = io_lsu_axi_rid == _GEN_382; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4263 = buf_ldfwd[3] & _T_4262; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_4264 = _T_4260 | _T_4263; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_4265 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_4267 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_4268 = _T_4265 & _T_4267; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_4269 = _T_4268 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_383 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4270 = io_lsu_axi_rid == _GEN_383; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4271 = _T_4269 & _T_4270; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_4272 = _T_4264 | _T_4271; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_4273 = bus_rsp_read & _T_4272; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_4274 = _T_4259 | _T_4273; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_270 = _T_4213 & _T_4274; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4179 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4175 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4152 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4300 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4310 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 544:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_385 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4312 = io_lsu_axi_rid == _GEN_385; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4313 = _T_4310[0] & _T_4312; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_4314 = _T_4270 | _T_4313; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_4315 = bus_rsp_read & _T_4314; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_264 = _T_4300 & _T_4315; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4213 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4179 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4175 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4152 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4192 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_4193 = _T_4192 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_4318 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4321 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_4322 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_4323 = buf_dual_3 & _T_4322; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_4324 = _T_4321 | _T_4323; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4325 = _T_4324 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_4326 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4318 ? _T_4325 : _T_4326; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4300 ? _T_4193 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4213 ? _T_4193 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4179 ? _T_4193 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4175 ? _T_3599 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4152 ? _T_4168 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2480 = _T_1929 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2490 = _T_2182 & _T_1932; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2492 = _T_2490 & _T_1897; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2493 = _T_4519 | _T_2492; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2497 = _T_2189 & _T_1933; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2499 = _T_2497 & _T_1899; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2500 = _T_2493 | _T_2499; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2501 = _T_2480 & _T_2500; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2503 = _T_2501 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2517 = _T_2490 & _T_1908; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2518 = _T_4524 | _T_2517; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2524 = _T_2497 & _T_1910; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2525 = _T_2518 | _T_2524; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2526 = _T_2480 & _T_2525; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2528 = _T_2526 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2542 = _T_2490 & _T_1919; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2543 = _T_4529 | _T_2542; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2549 = _T_2497 & _T_1921; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2550 = _T_2543 | _T_2549; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2551 = _T_2480 & _T_2550; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2553 = _T_2551 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2567 = _T_2490 & _T_1930; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2568 = _T_4534 | _T_2567; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2574 = _T_2497 & _T_1932; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2575 = _T_2568 | _T_2574; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2576 = _T_2480 & _T_2575; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2578 = _T_2576 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2580 = {_T_2578,_T_2553,_T_2528}; // @[Cat.scala 29:58]
  wire  _T_2844 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2845 = _T_1896 | _T_2844; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2846 = ~_T_2845; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2854 = _T_2846 | _T_2186; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2861 = _T_2854 | _T_2193; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2862 = _T_2174 & _T_2861; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2866 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2867 = _T_1907 | _T_2866; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2868 = ~_T_2867; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2876 = _T_2868 | _T_2211; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2883 = _T_2876 | _T_2218; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2884 = _T_2174 & _T_2883; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2888 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2889 = _T_1918 | _T_2888; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2890 = ~_T_2889; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2898 = _T_2890 | _T_2236; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2905 = _T_2898 | _T_2243; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2906 = _T_2174 & _T_2905; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2910 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2911 = _T_1929 | _T_2910; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2912 = ~_T_2911; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2920 = _T_2912 | _T_2261; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2927 = _T_2920 | _T_2268; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2928 = _T_2174 & _T_2927; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_0 = {_T_2928,_T_2906,_T_2884,_T_2862}; // @[Cat.scala 29:58]
  wire  _T_2945 = _T_2846 | _T_2288; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2952 = _T_2945 | _T_2295; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2953 = _T_2276 & _T_2952; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2967 = _T_2868 | _T_2313; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2974 = _T_2967 | _T_2320; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2975 = _T_2276 & _T_2974; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2989 = _T_2890 | _T_2338; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2996 = _T_2989 | _T_2345; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2997 = _T_2276 & _T_2996; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3011 = _T_2912 | _T_2363; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3018 = _T_3011 | _T_2370; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3019 = _T_2276 & _T_3018; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_1 = {_T_3019,_T_2997,_T_2975,_T_2953}; // @[Cat.scala 29:58]
  wire  _T_3036 = _T_2846 | _T_2390; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3043 = _T_3036 | _T_2397; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3044 = _T_2378 & _T_3043; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3058 = _T_2868 | _T_2415; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3065 = _T_3058 | _T_2422; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3066 = _T_2378 & _T_3065; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3080 = _T_2890 | _T_2440; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3087 = _T_3080 | _T_2447; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3088 = _T_2378 & _T_3087; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3102 = _T_2912 | _T_2465; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3109 = _T_3102 | _T_2472; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3110 = _T_2378 & _T_3109; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_2 = {_T_3110,_T_3088,_T_3066,_T_3044}; // @[Cat.scala 29:58]
  wire  _T_3127 = _T_2846 | _T_2492; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3134 = _T_3127 | _T_2499; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3135 = _T_2480 & _T_3134; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3149 = _T_2868 | _T_2517; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3156 = _T_3149 | _T_2524; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3157 = _T_2480 & _T_3156; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3171 = _T_2890 | _T_2542; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3178 = _T_3171 | _T_2549; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3179 = _T_2480 & _T_3178; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3193 = _T_2912 | _T_2567; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3200 = _T_3193 | _T_2574; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3201 = _T_2480 & _T_3200; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_3 = {_T_3201,_T_3179,_T_3157,_T_3135}; // @[Cat.scala 29:58]
  wire  _T_3286 = _T_2910 | _T_1929; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3287 = ~_T_3286; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3288 = buf_rspageQ_0[3] & _T_3287; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3280 = _T_2888 | _T_1918; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3281 = ~_T_3280; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3282 = buf_rspageQ_0[2] & _T_3281; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3274 = _T_2866 | _T_1907; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3275 = ~_T_3274; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3276 = buf_rspageQ_0[1] & _T_3275; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3268 = _T_2844 | _T_1896; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3269 = ~_T_3268; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3270 = buf_rspageQ_0[0] & _T_3269; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_0 = {_T_3288,_T_3282,_T_3276,_T_3270}; // @[Cat.scala 29:58]
  wire  _T_3207 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3210 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3213 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3216 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3218 = {_T_3216,_T_3213,_T_3210}; // @[Cat.scala 29:58]
  wire  _T_3315 = buf_rspageQ_1[3] & _T_3287; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3309 = buf_rspageQ_1[2] & _T_3281; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3303 = buf_rspageQ_1[1] & _T_3275; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3297 = buf_rspageQ_1[0] & _T_3269; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_1 = {_T_3315,_T_3309,_T_3303,_T_3297}; // @[Cat.scala 29:58]
  wire  _T_3222 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3225 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3228 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3231 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3233 = {_T_3231,_T_3228,_T_3225}; // @[Cat.scala 29:58]
  wire  _T_3342 = buf_rspageQ_2[3] & _T_3287; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3336 = buf_rspageQ_2[2] & _T_3281; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3330 = buf_rspageQ_2[1] & _T_3275; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3324 = buf_rspageQ_2[0] & _T_3269; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_2 = {_T_3342,_T_3336,_T_3330,_T_3324}; // @[Cat.scala 29:58]
  wire  _T_3237 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3240 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3243 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3246 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3248 = {_T_3246,_T_3243,_T_3240}; // @[Cat.scala 29:58]
  wire  _T_3369 = buf_rspageQ_3[3] & _T_3287; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3363 = buf_rspageQ_3[2] & _T_3281; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3357 = buf_rspageQ_3[1] & _T_3275; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3351 = buf_rspageQ_3[0] & _T_3269; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_3 = {_T_3369,_T_3363,_T_3357,_T_3351}; // @[Cat.scala 29:58]
  wire  _T_3252 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3255 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3258 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3261 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3263 = {_T_3261,_T_3258,_T_3255}; // @[Cat.scala 29:58]
  wire  _T_3374 = ibuf_drain_vld & _T_1897; // @[el2_lsu_bus_buffer.scala 486:65]
  wire  _T_3376 = ibuf_drain_vld & _T_1908; // @[el2_lsu_bus_buffer.scala 486:65]
  wire  _T_3378 = ibuf_drain_vld & _T_1919; // @[el2_lsu_bus_buffer.scala 486:65]
  wire  _T_3380 = ibuf_drain_vld & _T_1930; // @[el2_lsu_bus_buffer.scala 486:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3380,_T_3378,_T_3376,_T_3374}; // @[Cat.scala 29:58]
  wire  _T_3388 = _T_3582 & _T_1900; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3397 = _T_3582 & _T_1911; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3406 = _T_3582 & _T_1922; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3415 = _T_3582 & _T_1933; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3445 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire  _T_3447 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire  _T_3449 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire  _T_3451 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire [3:0] buf_dual_in = {_T_3451,_T_3449,_T_3447,_T_3445}; // @[Cat.scala 29:58]
  wire  _T_3456 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire  _T_3458 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire  _T_3460 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire  _T_3462 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire [3:0] buf_samedw_in = {_T_3462,_T_3460,_T_3458,_T_3456}; // @[Cat.scala 29:58]
  wire  _T_3467 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 492:86]
  wire  _T_3468 = ibuf_drainvec_vld[0] ? _T_3467 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire  _T_3471 = ibuf_drainvec_vld[1] ? _T_3467 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire  _T_3474 = ibuf_drainvec_vld[2] ? _T_3467 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire  _T_3477 = ibuf_drainvec_vld[3] ? _T_3467 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire [3:0] buf_nomerge_in = {_T_3477,_T_3474,_T_3471,_T_3468}; // @[Cat.scala 29:58]
  wire  _T_3485 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3388; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3490 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3397; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3495 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3406; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3500 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3415; // @[el2_lsu_bus_buffer.scala 493:49]
  wire [3:0] buf_dualhi_in = {_T_3500,_T_3495,_T_3490,_T_3485}; // @[Cat.scala 29:58]
  wire  _T_3529 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire  _T_3531 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire  _T_3533 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire  _T_3535 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire [3:0] buf_sideeffect_in = {_T_3535,_T_3533,_T_3531,_T_3529}; // @[Cat.scala 29:58]
  wire  _T_3540 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire  _T_3542 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire  _T_3544 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire  _T_3546 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire [3:0] buf_unsign_in = {_T_3546,_T_3544,_T_3542,_T_3540}; // @[Cat.scala 29:58]
  wire  _T_3563 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire  _T_3565 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire  _T_3567 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire  _T_3569 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire [3:0] buf_write_in = {_T_3569,_T_3567,_T_3565,_T_3563}; // @[Cat.scala 29:58]
  wire  _T_3602 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 514:89]
  wire  _T_3604 = _T_3602 & _T_1394; // @[el2_lsu_bus_buffer.scala 514:104]
  wire  _T_3617 = buf_state_en_0 & _T_3688; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_3618 = _T_3617 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_3620 = _T_3618 & _T_1376; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_3623 = _T_3613 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_3624 = _T_3623 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_4917 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 626:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4917; // @[el2_lsu_bus_buffer.scala 626:38]
  wire  _T_3627 = _T_3623 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_3702 = bus_rsp_read_error & _T_3681; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_3704 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_3706 = _T_3704 & _T_3683; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_3707 = _T_3702 | _T_3706; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4917; // @[el2_lsu_bus_buffer.scala 625:40]
  wire  _T_3710 = bus_rsp_write_error & _T_3679; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_3711 = _T_3707 | _T_3710; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_3712 = _T_3613 & _T_3711; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_46 = _T_3634 & _T_3712; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3600 ? _T_3627 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3596 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3573 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3637 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 526:73]
  wire  _T_3638 = buf_write[0] & _T_3637; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_3639 = io_dec_tlu_force_halt | _T_3638; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_3641 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_3642 = buf_dual_0 & _T_3641; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_3645 = _T_3642 & _T_3688; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3646 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3647 = _T_3645 & _T_3646; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_4542 = _T_2791 | _T_2788; // @[el2_lsu_bus_buffer.scala 585:93]
  wire  _T_4543 = _T_4542 | _T_2785; // @[el2_lsu_bus_buffer.scala 585:93]
  wire  any_done_wait_state = _T_4543 | _T_2782; // @[el2_lsu_bus_buffer.scala 585:93]
  wire  _T_3649 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3655 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3657 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3659 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3661 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3663 = _T_3655 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3664 = _T_3657 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3665 = _T_3659 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3666 = _T_3661 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3667 = _T_3663 | _T_3664; // @[Mux.scala 27:72]
  wire  _T_3668 = _T_3667 | _T_3665; // @[Mux.scala 27:72]
  wire  _T_3669 = _T_3668 | _T_3666; // @[Mux.scala 27:72]
  wire  _T_3671 = _T_3645 & _T_3669; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_3672 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_3673 = _T_3671 & _T_3672; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_3674 = _T_3673 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_3675 = _T_3649 | _T_3674; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_3698 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_3699 = _T_3698 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_3713 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_3714 = buf_state_en_0 & _T_3713; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_3726 = buf_ldfwd[0] | _T_3731[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_3727 = _T_3726 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_29 = _T_3747 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3739 ? 1'h0 : _T_3747; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3739 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3721 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3721 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3634 & _T_3699; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3634 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3634 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3600 ? _T_3620 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3600 ? _T_3624 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3600 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3596 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3596 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3596 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3573 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3573 ? buf_state_en_0 : _GEN_70; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3573 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3573 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3810 = buf_state_en_1 & _T_3881; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_3811 = _T_3810 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_3813 = _T_3811 & _T_1376; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_3816 = _T_3806 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_3817 = _T_3816 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_3820 = _T_3816 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_3895 = bus_rsp_read_error & _T_3874; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_3897 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_3899 = _T_3897 & _T_3876; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_3900 = _T_3895 | _T_3899; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  _T_3903 = bus_rsp_write_error & _T_3872; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_3904 = _T_3900 | _T_3903; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_3905 = _T_3806 & _T_3904; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_122 = _T_3827 & _T_3905; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3793 ? _T_3820 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3789 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3766 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3831 = buf_write[1] & _T_3637; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_3832 = io_dec_tlu_force_halt | _T_3831; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_3834 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_3835 = buf_dual_1 & _T_3834; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_3838 = _T_3835 & _T_3881; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3839 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3840 = _T_3838 & _T_3839; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_3842 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3848 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3850 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3852 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3854 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3856 = _T_3848 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3857 = _T_3850 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3858 = _T_3852 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3859 = _T_3854 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3860 = _T_3856 | _T_3857; // @[Mux.scala 27:72]
  wire  _T_3861 = _T_3860 | _T_3858; // @[Mux.scala 27:72]
  wire  _T_3862 = _T_3861 | _T_3859; // @[Mux.scala 27:72]
  wire  _T_3864 = _T_3838 & _T_3862; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_3865 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_3866 = _T_3864 & _T_3865; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_3867 = _T_3866 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_3868 = _T_3842 | _T_3867; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_3891 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_3892 = _T_3891 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_3906 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_3907 = buf_state_en_1 & _T_3906; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_3919 = buf_ldfwd[1] | _T_3924[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_3920 = _T_3919 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_105 = _T_3940 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3932 ? 1'h0 : _T_3940; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3932 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3914 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3914 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3827 & _T_3892; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3827 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3827 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3793 ? _T_3813 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3793 ? _T_3817 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3793 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3789 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3789 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3789 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3766 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3766 ? buf_state_en_1 : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3766 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3766 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_4003 = buf_state_en_2 & _T_4074; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_4004 = _T_4003 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_4006 = _T_4004 & _T_1376; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_4009 = _T_3999 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_4010 = _T_4009 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_4013 = _T_4009 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_4088 = bus_rsp_read_error & _T_4067; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_4090 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_4092 = _T_4090 & _T_4069; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_4093 = _T_4088 | _T_4092; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  _T_4096 = bus_rsp_write_error & _T_4065; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_4097 = _T_4093 | _T_4096; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_4098 = _T_3999 & _T_4097; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_198 = _T_4020 & _T_4098; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3986 ? _T_4013 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3982 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3959 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_4024 = buf_write[2] & _T_3637; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_4025 = io_dec_tlu_force_halt | _T_4024; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_4027 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_4028 = buf_dual_2 & _T_4027; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_4031 = _T_4028 & _T_4074; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4032 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4033 = _T_4031 & _T_4032; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_4035 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4041 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4043 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4045 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4047 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4049 = _T_4041 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4050 = _T_4043 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4051 = _T_4045 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4052 = _T_4047 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4053 = _T_4049 | _T_4050; // @[Mux.scala 27:72]
  wire  _T_4054 = _T_4053 | _T_4051; // @[Mux.scala 27:72]
  wire  _T_4055 = _T_4054 | _T_4052; // @[Mux.scala 27:72]
  wire  _T_4057 = _T_4031 & _T_4055; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_4058 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_4059 = _T_4057 & _T_4058; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_4060 = _T_4059 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_4061 = _T_4035 | _T_4060; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_4084 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_4085 = _T_4084 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_4099 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_4100 = buf_state_en_2 & _T_4099; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_4112 = buf_ldfwd[2] | _T_4117[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_4113 = _T_4112 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_181 = _T_4133 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4125 ? 1'h0 : _T_4133; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4125 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4107 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4107 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_4020 & _T_4085; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_4020 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_4020 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3986 ? _T_4006 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3986 ? _T_4010 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3986 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3982 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3982 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3982 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3959 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3959 ? buf_state_en_2 : _GEN_222; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3959 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3959 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4196 = buf_state_en_3 & _T_4267; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_4197 = _T_4196 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_4199 = _T_4197 & _T_1376; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_4202 = _T_4192 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_4203 = _T_4202 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_4206 = _T_4202 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_4281 = bus_rsp_read_error & _T_4260; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_4283 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_4285 = _T_4283 & _T_4262; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_4286 = _T_4281 | _T_4285; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  _T_4289 = bus_rsp_write_error & _T_4258; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_4290 = _T_4286 | _T_4289; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_4291 = _T_4192 & _T_4290; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_274 = _T_4213 & _T_4291; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4179 ? _T_4206 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4175 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4152 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4217 = buf_write[3] & _T_3637; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_4218 = io_dec_tlu_force_halt | _T_4217; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_4220 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_4221 = buf_dual_3 & _T_4220; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_4224 = _T_4221 & _T_4267; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4225 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4226 = _T_4224 & _T_4225; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_4228 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4234 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4236 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4238 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4240 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4242 = _T_4234 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4243 = _T_4236 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4244 = _T_4238 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4245 = _T_4240 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4246 = _T_4242 | _T_4243; // @[Mux.scala 27:72]
  wire  _T_4247 = _T_4246 | _T_4244; // @[Mux.scala 27:72]
  wire  _T_4248 = _T_4247 | _T_4245; // @[Mux.scala 27:72]
  wire  _T_4250 = _T_4224 & _T_4248; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_4251 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_4252 = _T_4250 & _T_4251; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_4253 = _T_4252 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_4254 = _T_4228 | _T_4253; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_4277 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_4278 = _T_4277 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_4292 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_4293 = buf_state_en_3 & _T_4292; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_4305 = buf_ldfwd[3] | _T_4310[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_4306 = _T_4305 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_257 = _T_4326 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4318 ? 1'h0 : _T_4326; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4318 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4300 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4300 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4213 & _T_4278; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4213 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4213 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4179 ? _T_4199 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4179 ? _T_4203 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4179 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4175 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4175 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4175 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4152 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_4152 ? buf_state_en_3 : _GEN_298; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4152 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4152 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4381; // @[Reg.scala 27:20]
  reg  _T_4384; // @[Reg.scala 27:20]
  reg  _T_4387; // @[Reg.scala 27:20]
  reg  _T_4390; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4390,_T_4387,_T_4384,_T_4381}; // @[Cat.scala 29:58]
  reg  _T_4456; // @[el2_lsu_bus_buffer.scala 578:82]
  reg  _T_4451; // @[el2_lsu_bus_buffer.scala 578:82]
  reg  _T_4446; // @[el2_lsu_bus_buffer.scala 578:82]
  reg  _T_4441; // @[el2_lsu_bus_buffer.scala 578:82]
  wire [3:0] buf_error = {_T_4456,_T_4451,_T_4446,_T_4441}; // @[Cat.scala 29:58]
  wire  _T_4438 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4439 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 578:128]
  wire  _T_4443 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4444 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 578:128]
  wire  _T_4448 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4449 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 578:128]
  wire  _T_4453 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4454 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 578:128]
  wire [2:0] _T_4461 = {buf_data_en_3,buf_data_en_2,buf_data_en_1}; // @[Cat.scala 29:58]
  wire [1:0] _T_4463 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4464 = io_ldst_dual_m ? _T_4463 : {{1'd0}, io_lsu_busreq_m}; // @[el2_lsu_bus_buffer.scala 581:28]
  wire [1:0] _T_4465 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4466 = io_ldst_dual_r ? _T_4465 : {{1'd0}, io_lsu_busreq_r}; // @[el2_lsu_bus_buffer.scala 581:94]
  wire [2:0] _T_4467 = _T_4464 + _T_4466; // @[el2_lsu_bus_buffer.scala 581:88]
  wire [2:0] _GEN_390 = {{2'd0}, ibuf_valid}; // @[el2_lsu_bus_buffer.scala 581:154]
  wire [3:0] _T_4468 = _T_4467 + _GEN_390; // @[el2_lsu_bus_buffer.scala 581:154]
  wire [1:0] _T_4473 = _T_5 + _T_12; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [1:0] _GEN_391 = {{1'd0}, _T_19}; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [2:0] _T_4474 = _T_4473 + _GEN_391; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [2:0] _GEN_392 = {{2'd0}, _T_26}; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [3:0] _T_4475 = _T_4474 + _GEN_392; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [3:0] buf_numvld_any = _T_4468 + _T_4475; // @[el2_lsu_bus_buffer.scala 581:169]
  wire  _T_4546 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 587:52]
  wire  _T_4547 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 587:92]
  wire  _T_4548 = buf_numvld_any == 4'h4; // @[el2_lsu_bus_buffer.scala 587:121]
  wire  _T_4550 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4551 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4552 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4553 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4554 = _T_4550 | _T_4551; // @[el2_lsu_bus_buffer.scala 588:65]
  wire  _T_4555 = _T_4554 | _T_4552; // @[el2_lsu_bus_buffer.scala 588:65]
  wire  _T_4556 = _T_4555 | _T_4553; // @[el2_lsu_bus_buffer.scala 588:65]
  wire  _T_4557 = ~_T_4556; // @[el2_lsu_bus_buffer.scala 588:34]
  wire  _T_4559 = _T_4557 & _T_874; // @[el2_lsu_bus_buffer.scala 588:70]
  wire  _T_4562 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 590:51]
  wire  _T_4563 = _T_4562 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 590:72]
  wire  _T_4564 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 590:94]
  wire  _T_4565 = _T_4563 & _T_4564; // @[el2_lsu_bus_buffer.scala 590:92]
  wire  _T_4566 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 590:111]
  wire  _T_4568 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 593:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 679:66]
  wire  _T_4586 = _T_2844 & _T_3688; // @[Mux.scala 27:72]
  wire  _T_4587 = _T_2866 & _T_3881; // @[Mux.scala 27:72]
  wire  _T_4588 = _T_2888 & _T_4074; // @[Mux.scala 27:72]
  wire  _T_4589 = _T_2910 & _T_4267; // @[Mux.scala 27:72]
  wire  _T_4590 = _T_4586 | _T_4587; // @[Mux.scala 27:72]
  wire  _T_4591 = _T_4590 | _T_4588; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4591 | _T_4589; // @[Mux.scala 27:72]
  wire  _T_4597 = buf_error[0] & _T_3688; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4602 = buf_error[1] & _T_3881; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4607 = buf_error[2] & _T_4074; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4612 = buf_error[3] & _T_4267; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4613 = _T_2844 & _T_4597; // @[Mux.scala 27:72]
  wire  _T_4614 = _T_2866 & _T_4602; // @[Mux.scala 27:72]
  wire  _T_4615 = _T_2888 & _T_4607; // @[Mux.scala 27:72]
  wire  _T_4616 = _T_2910 & _T_4612; // @[Mux.scala 27:72]
  wire  _T_4617 = _T_4613 | _T_4614; // @[Mux.scala 27:72]
  wire  _T_4618 = _T_4617 | _T_4615; // @[Mux.scala 27:72]
  wire  _T_4625 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4626 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4627 = _T_4625 | _T_4626; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4628 = _T_4586 & _T_4627; // @[el2_lsu_bus_buffer.scala 597:106]
  wire  _T_4633 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4634 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4635 = _T_4633 | _T_4634; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4636 = _T_4587 & _T_4635; // @[el2_lsu_bus_buffer.scala 597:106]
  wire  _T_4641 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4642 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4643 = _T_4641 | _T_4642; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4644 = _T_4588 & _T_4643; // @[el2_lsu_bus_buffer.scala 597:106]
  wire  _T_4649 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4650 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4651 = _T_4649 | _T_4650; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4652 = _T_4589 & _T_4651; // @[el2_lsu_bus_buffer.scala 597:106]
  wire [1:0] _T_4655 = _T_4644 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4656 = _T_4652 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_393 = {{1'd0}, _T_4636}; // @[Mux.scala 27:72]
  wire [1:0] _T_4658 = _GEN_393 | _T_4655; // @[Mux.scala 27:72]
  wire [31:0] _T_4693 = _T_4628 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4694 = _T_4636 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4695 = _T_4644 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4696 = _T_4652 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4697 = _T_4693 | _T_4694; // @[Mux.scala 27:72]
  wire [31:0] _T_4698 = _T_4697 | _T_4695; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4698 | _T_4696; // @[Mux.scala 27:72]
  wire  _T_4704 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4705 = _T_4586 & _T_4704; // @[el2_lsu_bus_buffer.scala 599:105]
  wire  _T_4710 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4711 = _T_4587 & _T_4710; // @[el2_lsu_bus_buffer.scala 599:105]
  wire  _T_4716 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4717 = _T_4588 & _T_4716; // @[el2_lsu_bus_buffer.scala 599:105]
  wire  _T_4722 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4723 = _T_4589 & _T_4722; // @[el2_lsu_bus_buffer.scala 599:105]
  wire [31:0] _T_4724 = _T_4705 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4725 = _T_4711 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4726 = _T_4717 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4727 = _T_4723 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4728 = _T_4724 | _T_4725; // @[Mux.scala 27:72]
  wire [31:0] _T_4729 = _T_4728 | _T_4726; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4729 | _T_4727; // @[Mux.scala 27:72]
  wire  _T_4731 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4732 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4733 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4734 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 120:123]
  wire [31:0] _T_4735 = _T_4731 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4736 = _T_4732 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4737 = _T_4733 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4738 = _T_4734 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4739 = _T_4735 | _T_4736; // @[Mux.scala 27:72]
  wire [31:0] _T_4740 = _T_4739 | _T_4737; // @[Mux.scala 27:72]
  wire [31:0] _T_4741 = _T_4740 | _T_4738; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4741[1:0]; // @[el2_lsu_bus_buffer.scala 600:83]
  wire [1:0] _T_4747 = _T_4731 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4748 = _T_4732 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4749 = _T_4733 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4750 = _T_4734 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4751 = _T_4747 | _T_4748; // @[Mux.scala 27:72]
  wire [1:0] _T_4752 = _T_4751 | _T_4749; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4752 | _T_4750; // @[Mux.scala 27:72]
  wire  _T_4762 = _T_4731 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4763 = _T_4732 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4764 = _T_4733 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4765 = _T_4734 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4766 = _T_4762 | _T_4763; // @[Mux.scala 27:72]
  wire  _T_4767 = _T_4766 | _T_4764; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4767 | _T_4765; // @[Mux.scala 27:72]
  wire [63:0] _T_4787 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_394 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 604:121]
  wire [5:0] _T_4788 = _GEN_394 * 4'h8; // @[el2_lsu_bus_buffer.scala 604:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4787 >> _T_4788; // @[el2_lsu_bus_buffer.scala 604:92]
  wire  _T_4789 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 607:69]
  wire  _T_4791 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 608:81]
  wire  _T_4792 = lsu_nonblock_unsign & _T_4791; // @[el2_lsu_bus_buffer.scala 608:63]
  wire [31:0] _T_4794 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4795 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 609:45]
  wire  _T_4796 = lsu_nonblock_unsign & _T_4795; // @[el2_lsu_bus_buffer.scala 609:26]
  wire [31:0] _T_4798 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4799 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 610:6]
  wire  _T_4801 = _T_4799 & _T_4791; // @[el2_lsu_bus_buffer.scala 610:27]
  wire [23:0] _T_4804 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4806 = {_T_4804,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4809 = _T_4799 & _T_4795; // @[el2_lsu_bus_buffer.scala 611:27]
  wire [15:0] _T_4812 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4814 = {_T_4812,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4815 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 612:21]
  wire [31:0] _T_4816 = _T_4792 ? _T_4794 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4817 = _T_4796 ? _T_4798 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4818 = _T_4801 ? _T_4806 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4819 = _T_4809 ? _T_4814 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4820 = _T_4815 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4821 = _T_4816 | _T_4817; // @[Mux.scala 27:72]
  wire [31:0] _T_4822 = _T_4821 | _T_4818; // @[Mux.scala 27:72]
  wire [31:0] _T_4823 = _T_4822 | _T_4819; // @[Mux.scala 27:72]
  wire [63:0] _GEN_395 = {{32'd0}, _T_4823}; // @[Mux.scala 27:72]
  wire [63:0] _T_4824 = _GEN_395 | _T_4820; // @[Mux.scala 27:72]
  wire  _T_4919 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 630:36]
  wire  _T_4920 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 630:51]
  wire  _T_4921 = _T_4919 & _T_4920; // @[el2_lsu_bus_buffer.scala 630:49]
  wire [31:0] _T_4925 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4927 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4932 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 642:50]
  wire  _T_4933 = _T_4919 & _T_4932; // @[el2_lsu_bus_buffer.scala 642:48]
  wire [7:0] _T_4937 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4940 = obuf_valid & _T_1386; // @[el2_lsu_bus_buffer.scala 647:36]
  wire  _T_4942 = _T_4940 & _T_1392; // @[el2_lsu_bus_buffer.scala 647:50]
  wire  _T_4954 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4956 = _T_4954 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4959 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4961 = _T_4959 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4964 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4966 = _T_4964 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4969 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4971 = _T_4969 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4972 = _T_2844 & _T_4956; // @[Mux.scala 27:72]
  wire  _T_4973 = _T_2866 & _T_4961; // @[Mux.scala 27:72]
  wire  _T_4974 = _T_2888 & _T_4966; // @[Mux.scala 27:72]
  wire  _T_4975 = _T_2910 & _T_4971; // @[Mux.scala 27:72]
  wire  _T_4976 = _T_4972 | _T_4973; // @[Mux.scala 27:72]
  wire  _T_4977 = _T_4976 | _T_4974; // @[Mux.scala 27:72]
  wire  _T_4987 = _T_2866 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 661:98]
  wire  lsu_imprecise_error_store_tag = _T_4987 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 661:113]
  wire  _T_4993 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 663:72]
  wire  _T_4995 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 120:123]
  wire [31:0] _T_4997 = _T_4995 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4998 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4999 = _T_4997 | _T_4998; // @[Mux.scala 27:72]
  wire  _T_5016 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 670:68]
  wire  _T_5019 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 671:48]
  wire  _T_5022 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 674:48]
  wire  _T_5023 = io_lsu_axi_awvalid & _T_5022; // @[el2_lsu_bus_buffer.scala 674:46]
  wire  _T_5024 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 674:92]
  wire  _T_5025 = io_lsu_axi_wvalid & _T_5024; // @[el2_lsu_bus_buffer.scala 674:90]
  wire  _T_5026 = _T_5023 | _T_5025; // @[el2_lsu_bus_buffer.scala 674:69]
  wire  _T_5027 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 674:136]
  wire  _T_5028 = io_lsu_axi_arvalid & _T_5027; // @[el2_lsu_bus_buffer.scala 674:134]
  wire  _T_5032 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 678:75]
  wire  _T_5033 = io_lsu_busreq_m & _T_5032; // @[el2_lsu_bus_buffer.scala 678:73]
  reg  _T_5036; // @[el2_lsu_bus_buffer.scala 678:56]
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
  assign io_lsu_busreq_r = _T_5036; // @[el2_lsu_bus_buffer.scala 678:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 586:30]
  assign io_lsu_bus_buffer_full_any = _T_4546 ? _T_4547 : _T_4548; // @[el2_lsu_bus_buffer.scala 587:30]
  assign io_lsu_bus_buffer_empty_any = _T_4559 & _T_1274; // @[el2_lsu_bus_buffer.scala 588:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 667:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 198:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 199:25]
  assign io_ld_fwddata_buf_lo = _T_675[31:0]; // @[el2_lsu_bus_buffer.scala 225:24]
  assign io_ld_fwddata_buf_hi = _T_771[31:0]; // @[el2_lsu_bus_buffer.scala 230:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4993; // @[el2_lsu_bus_buffer.scala 663:35]
  assign io_lsu_imprecise_error_store_any = _T_4977 | _T_4975; // @[el2_lsu_bus_buffer.scala 660:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4999 : _T_4741; // @[el2_lsu_bus_buffer.scala 664:35]
  assign io_lsu_nonblock_load_valid_m = _T_4565 & _T_4566; // @[el2_lsu_bus_buffer.scala 590:32]
  assign io_lsu_nonblock_load_tag_m = _T_1906 ? 2'h0 : _T_1942; // @[el2_lsu_bus_buffer.scala 591:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4568; // @[el2_lsu_bus_buffer.scala 593:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 594:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4789; // @[el2_lsu_bus_buffer.scala 607:35]
  assign io_lsu_nonblock_load_data_error = _T_4618 | _T_4616; // @[el2_lsu_bus_buffer.scala 596:35]
  assign io_lsu_nonblock_load_data_tag = _T_4658 | _T_4656; // @[el2_lsu_bus_buffer.scala 597:33]
  assign io_lsu_nonblock_load_data = _T_4824[31:0]; // @[el2_lsu_bus_buffer.scala 608:29]
  assign io_lsu_pmu_bus_trxn = _T_5016 | _T_4911; // @[el2_lsu_bus_buffer.scala 670:23]
  assign io_lsu_pmu_bus_misaligned = _T_5019 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 671:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 672:24]
  assign io_lsu_pmu_bus_busy = _T_5026 | _T_5028; // @[el2_lsu_bus_buffer.scala 674:23]
  assign io_lsu_axi_awvalid = _T_4921 & _T_1282; // @[el2_lsu_bus_buffer.scala 630:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1891}; // @[el2_lsu_bus_buffer.scala 631:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4925; // @[el2_lsu_bus_buffer.scala 632:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 636:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 637:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4927 : 3'h3; // @[el2_lsu_bus_buffer.scala 633:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 638:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 640:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 635:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 634:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 639:20]
  assign io_lsu_axi_wvalid = _T_4933 & _T_1282; // @[el2_lsu_bus_buffer.scala 642:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 644:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4937; // @[el2_lsu_bus_buffer.scala 643:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 645:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 658:21]
  assign io_lsu_axi_arvalid = _T_4942 & _T_1282; // @[el2_lsu_bus_buffer.scala 647:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1891}; // @[el2_lsu_bus_buffer.scala 648:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4925; // @[el2_lsu_bus_buffer.scala 649:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 653:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 654:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4927 : 3'h3; // @[el2_lsu_bus_buffer.scala 650:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 655:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 657:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 652:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 651:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 656:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 659:21]
  assign io_test = _T_775 | _T_774; // @[el2_lsu_bus_buffer.scala 259:11]
  assign io_data_hi = _T_4729 | _T_4727; // @[el2_lsu_bus_buffer.scala 605:14]
  assign io_data_lo = _T_4698 | _T_4696; // @[el2_lsu_bus_buffer.scala 606:14]
  assign io_data_en = {_T_4461,buf_data_en_0}; // @[el2_lsu_bus_buffer.scala 579:14]
  assign io_Cmdptr0 = _T_2122[1:0]; // @[el2_lsu_bus_buffer.scala 448:14]
  assign io_Cmdptr1 = 2'h0; // @[el2_lsu_bus_buffer.scala 359:14]
  assign io_WrPtr1_r = WrPtr1_r; // @[el2_lsu_bus_buffer.scala 279:15]
  assign io_WrPtr1_m = _T_1960 ? 2'h0 : _T_2005; // @[el2_lsu_bus_buffer.scala 433:15]
  assign io_wdata_in = {_T_1663,_T_1622}; // @[el2_lsu_bus_buffer.scala 394:15]
  assign io_buf_state = {_T_1945,buf_state_3}; // @[el2_lsu_bus_buffer.scala 426:16]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_io_en = _T_875 & _T_876; // @[el2_lib.scala 488:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_1_io_en = _T_875 & _T_876; // @[el2_lib.scala 488:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_2_io_en = _T_1283 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_3_io_en = _T_1283 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_4_io_en = _T_3573 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3766 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3959 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4152 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3573 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3766 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3959 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4152 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4405 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4402 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4399 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4396 = _RAND_4[0:0];
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
  _T_1891 = _RAND_17[1:0];
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
  _T_4375 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4372 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4369 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4366 = _RAND_53[0:0];
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
  _T_4352 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4350 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4348 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4346 = _RAND_88[0:0];
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
  _T_4381 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4384 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4387 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4390 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4456 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4451 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4446 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4441 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_5036 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4405 = 1'h0;
  end
  if (reset) begin
    _T_4402 = 1'h0;
  end
  if (reset) begin
    _T_4399 = 1'h0;
  end
  if (reset) begin
    _T_4396 = 1'h0;
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
    _T_1891 = 2'h0;
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
    _T_4375 = 1'h0;
  end
  if (reset) begin
    _T_4372 = 1'h0;
  end
  if (reset) begin
    _T_4369 = 1'h0;
  end
  if (reset) begin
    _T_4366 = 1'h0;
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
    _T_4352 = 1'h0;
  end
  if (reset) begin
    _T_4350 = 1'h0;
  end
  if (reset) begin
    _T_4348 = 1'h0;
  end
  if (reset) begin
    _T_4346 = 1'h0;
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
    _T_4381 = 1'h0;
  end
  if (reset) begin
    _T_4384 = 1'h0;
  end
  if (reset) begin
    _T_4387 = 1'h0;
  end
  if (reset) begin
    _T_4390 = 1'h0;
  end
  if (reset) begin
    _T_4456 = 1'h0;
  end
  if (reset) begin
    _T_4451 = 1'h0;
  end
  if (reset) begin
    _T_4446 = 1'h0;
  end
  if (reset) begin
    _T_4441 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_5036 = 1'h0;
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
    end else if (_T_3388) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4405 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4405 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4402 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4402 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4399 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4399 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4396 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4396 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3573) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3596) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3600) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3604) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3634) begin
        if (_T_3639) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3647) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3675) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3721) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3727) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3739) begin
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
    end else if (_T_3397) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3766) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3789) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3793) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3604) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3827) begin
        if (_T_3832) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3840) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3868) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3914) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3920) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3932) begin
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
    end else if (_T_3406) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3959) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3982) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3986) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3604) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_4020) begin
        if (_T_4025) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4033) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4061) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4107) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4113) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4125) begin
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
    end else if (_T_3415) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4152) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4175) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4179) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3604) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4213) begin
        if (_T_4218) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4226) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4254) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4300) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4306) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4318) begin
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
      end else if (_T_3415) begin
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
      end else if (_T_3406) begin
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
      end else if (_T_3397) begin
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
      end else if (_T_3388) begin
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
      buf_ageQ_3 <= {_T_2580,_T_2503};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1891 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1891 <= WrPtr0_r;
      end else begin
        _T_1891 <= CmdPtr0;
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
      obuf_valid <= _T_1882 & _T_1883;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1283 & io_lsu_bus_clk_en;
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
      ibuf_valid <= _T_1027 & _T_1028;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_888) begin
        ibuf_byteen <= _T_903;
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
      buf_ageQ_2 <= {_T_2478,_T_2401};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2376,_T_2299};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2274,_T_2197};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3573) begin
      if (_T_3588) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3596) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3600) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3634) begin
      if (_T_3714) begin
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
    end else if (_T_3766) begin
      if (_T_3781) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3789) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3793) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3827) begin
      if (_T_3907) begin
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
    end else if (_T_3959) begin
      if (_T_3974) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3982) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3986) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4020) begin
      if (_T_4100) begin
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
    end else if (_T_4152) begin
      if (_T_4167) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4175) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4179) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4213) begin
      if (_T_4293) begin
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
    end else if (_T_945) begin
      ibuf_timer <= _T_948;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (_T_1033) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1960) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1974) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1988) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_2002) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1906) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1917) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1928) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1939) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_1033) begin
      if (!(_T_888)) begin
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
      ibuf_data <= {_T_944,_T_915};
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (_T_1033) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_1033) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_1033) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_1033) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_1033) begin
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
    end else if (_T_1101) begin
      obuf_wr_timer <= _T_1103;
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
      _T_4375 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4375 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4372 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4372 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4369 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4369 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4366 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4366 <= buf_sideeffect_in[0];
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
        obuf_write <= _T_1245;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1348 & _T_4908;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1348 & _T_4909;
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
      obuf_addr <= _T_1332;
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
        obuf_sideeffect <= _T_1094;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1373 | _T_1377;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1379) begin
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
        obuf_sz <= _T_1345;
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
      obuf_data <= {_T_1663,_T_1622};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3218,_T_3207};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3233,_T_3222};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3248,_T_3237};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3263,_T_3252};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4352 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4152) begin
        _T_4352 <= 1'h0;
      end else if (_T_4175) begin
        _T_4352 <= 1'h0;
      end else begin
        _T_4352 <= _T_4179;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4350 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3959) begin
        _T_4350 <= 1'h0;
      end else if (_T_3982) begin
        _T_4350 <= 1'h0;
      end else begin
        _T_4350 <= _T_3986;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4348 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3766) begin
        _T_4348 <= 1'h0;
      end else if (_T_3789) begin
        _T_4348 <= 1'h0;
      end else begin
        _T_4348 <= _T_3793;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4346 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3573) begin
        _T_4346 <= 1'h0;
      end else if (_T_3596) begin
        _T_4346 <= 1'h0;
      end else begin
        _T_4346 <= _T_3600;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3573) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3596) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3600) begin
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
      end else if (_T_3388) begin
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
      if (_T_4152) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4175) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4179) begin
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
      if (_T_3959) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3982) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3986) begin
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
      if (_T_3766) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3789) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3793) begin
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
      end else if (_T_3397) begin
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
      end else if (_T_3406) begin
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
      end else if (_T_3415) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4381 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4381 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4384 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4384 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4387 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4387 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4390 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4390 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4456 <= 1'h0;
    end else begin
      _T_4456 <= _T_4453 & _T_4454;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4451 <= 1'h0;
    end else begin
      _T_4451 <= _T_4448 & _T_4449;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4446 <= 1'h0;
    end else begin
      _T_4446 <= _T_4443 & _T_4444;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4441 <= 1'h0;
    end else begin
      _T_4441 <= _T_4438 & _T_4439;
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
      _T_5036 <= 1'h0;
    end else begin
      _T_5036 <= _T_5033 & _T_4566;
    end
  end
endmodule
