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
  reg  _T_4384; // @[Reg.scala 27:20]
  reg  _T_4381; // @[Reg.scala 27:20]
  reg  _T_4378; // @[Reg.scala 27:20]
  reg  _T_4375; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4384,_T_4381,_T_4378,_T_4375}; // @[Cat.scala 29:58]
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
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_2645 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 474:95]
  wire  _T_4131 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4154 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4158 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1869; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1869}; // @[el2_lsu_bus_buffer.scala 412:13]
  wire  _T_4165 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 517:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 517:104]
  wire  _T_4166 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 517:104]
  wire  _T_4167 = obuf_merge & _T_4166; // @[el2_lsu_bus_buffer.scala 517:91]
  wire  _T_4168 = _T_4165 | _T_4167; // @[el2_lsu_bus_buffer.scala 517:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 406:54]
  wire  _T_4169 = _T_4168 & obuf_valid; // @[el2_lsu_bus_buffer.scala 517:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 405:55]
  wire  _T_4170 = _T_4169 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 517:148]
  wire  _GEN_280 = _T_4158 & _T_4170; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4154 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4131 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2646 = _T_2645 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 474:105]
  wire  _T_2647 = ~_T_2646; // @[el2_lsu_bus_buffer.scala 474:80]
  wire  _T_2648 = buf_ageQ_3[3] & _T_2647; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2640 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 474:95]
  wire  _T_3938 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3961 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3965 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3972 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 517:48]
  wire  _T_3973 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 517:104]
  wire  _T_3974 = obuf_merge & _T_3973; // @[el2_lsu_bus_buffer.scala 517:91]
  wire  _T_3975 = _T_3972 | _T_3974; // @[el2_lsu_bus_buffer.scala 517:77]
  wire  _T_3976 = _T_3975 & obuf_valid; // @[el2_lsu_bus_buffer.scala 517:135]
  wire  _T_3977 = _T_3976 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 517:148]
  wire  _GEN_204 = _T_3965 & _T_3977; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3961 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3938 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2641 = _T_2640 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 474:105]
  wire  _T_2642 = ~_T_2641; // @[el2_lsu_bus_buffer.scala 474:80]
  wire  _T_2643 = buf_ageQ_3[2] & _T_2642; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2635 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 474:95]
  wire  _T_3745 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3768 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3772 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3779 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 517:48]
  wire  _T_3780 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 517:104]
  wire  _T_3781 = obuf_merge & _T_3780; // @[el2_lsu_bus_buffer.scala 517:91]
  wire  _T_3782 = _T_3779 | _T_3781; // @[el2_lsu_bus_buffer.scala 517:77]
  wire  _T_3783 = _T_3782 & obuf_valid; // @[el2_lsu_bus_buffer.scala 517:135]
  wire  _T_3784 = _T_3783 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 517:148]
  wire  _GEN_128 = _T_3772 & _T_3784; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3768 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3745 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2636 = _T_2635 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 474:105]
  wire  _T_2637 = ~_T_2636; // @[el2_lsu_bus_buffer.scala 474:80]
  wire  _T_2638 = buf_ageQ_3[1] & _T_2637; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2630 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 474:95]
  wire  _T_3552 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3575 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3579 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3586 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 517:48]
  wire  _T_3587 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 517:104]
  wire  _T_3588 = obuf_merge & _T_3587; // @[el2_lsu_bus_buffer.scala 517:91]
  wire  _T_3589 = _T_3586 | _T_3588; // @[el2_lsu_bus_buffer.scala 517:77]
  wire  _T_3590 = _T_3589 & obuf_valid; // @[el2_lsu_bus_buffer.scala 517:135]
  wire  _T_3591 = _T_3590 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 517:148]
  wire  _GEN_52 = _T_3579 & _T_3591; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3575 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3552 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2631 = _T_2630 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 474:105]
  wire  _T_2632 = ~_T_2631; // @[el2_lsu_bus_buffer.scala 474:80]
  wire  _T_2633 = buf_ageQ_3[0] & _T_2632; // @[el2_lsu_bus_buffer.scala 474:78]
  wire [3:0] buf_age_3 = {_T_2648,_T_2643,_T_2638,_T_2633}; // @[Cat.scala 29:58]
  wire  _T_2747 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2749 = _T_2747 & _T_19; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2741 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2743 = _T_2741 & _T_12; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2735 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2737 = _T_2735 & _T_5; // @[el2_lsu_bus_buffer.scala 475:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2749,_T_2743,_T_2737}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 207:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 213:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[el2_lsu_bus_buffer.scala 213:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 299:24]
  wire  _T_514 = _T_513 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 213:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 213:99]
  wire [3:0] _T_521 = ld_addr_ibuf_hit_lo ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire [3:0] _T_522 = _T_521 & ibuf_byteen; // @[el2_lsu_bus_buffer.scala 218:55]
  wire [3:0] ld_byte_ibuf_hit_lo = _T_522 & ldst_byteen_lo_m; // @[el2_lsu_bus_buffer.scala 218:69]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 207:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_2625 = buf_ageQ_2[3] & _T_2647; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2620 = buf_ageQ_2[2] & _T_2642; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2615 = buf_ageQ_2[1] & _T_2637; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2610 = buf_ageQ_2[0] & _T_2632; // @[el2_lsu_bus_buffer.scala 474:78]
  wire [3:0] buf_age_2 = {_T_2625,_T_2620,_T_2615,_T_2610}; // @[Cat.scala 29:58]
  wire  _T_2726 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2728 = _T_2726 & _T_26; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2714 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2716 = _T_2714 & _T_12; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2708 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2710 = _T_2708 & _T_5; // @[el2_lsu_bus_buffer.scala 475:106]
  wire [3:0] buf_age_younger_2 = {_T_2728,1'h0,_T_2716,_T_2710}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 207:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_2602 = buf_ageQ_1[3] & _T_2647; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2597 = buf_ageQ_1[2] & _T_2642; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2592 = buf_ageQ_1[1] & _T_2637; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2587 = buf_ageQ_1[0] & _T_2632; // @[el2_lsu_bus_buffer.scala 474:78]
  wire [3:0] buf_age_1 = {_T_2602,_T_2597,_T_2592,_T_2587}; // @[Cat.scala 29:58]
  wire  _T_2699 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2701 = _T_2699 & _T_26; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2693 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2695 = _T_2693 & _T_19; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2681 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2683 = _T_2681 & _T_5; // @[el2_lsu_bus_buffer.scala 475:106]
  wire [3:0] buf_age_younger_1 = {_T_2701,_T_2695,1'h0,_T_2683}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 207:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 562:60]
  wire  _T_2579 = buf_ageQ_0[3] & _T_2647; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2574 = buf_ageQ_0[2] & _T_2642; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2569 = buf_ageQ_0[1] & _T_2637; // @[el2_lsu_bus_buffer.scala 474:78]
  wire  _T_2564 = buf_ageQ_0[0] & _T_2632; // @[el2_lsu_bus_buffer.scala 474:78]
  wire [3:0] buf_age_0 = {_T_2579,_T_2574,_T_2569,_T_2564}; // @[Cat.scala 29:58]
  wire  _T_2672 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2674 = _T_2672 & _T_26; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2666 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2668 = _T_2666 & _T_19; // @[el2_lsu_bus_buffer.scala 475:106]
  wire  _T_2660 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_2662 = _T_2660 & _T_12; // @[el2_lsu_bus_buffer.scala 475:106]
  wire [3:0] buf_age_younger_0 = {_T_2674,_T_2668,_T_2662,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_232 = |_T_231; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_233 = ~_T_232; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_237 = _T_234 & _T_260; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_291 = |_T_290; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_292 = ~_T_291; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_296 = _T_293 & _T_295; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_283 = |_T_282; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_284 = ~_T_283; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_288 = _T_285 & _T_295; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_275 = |_T_274; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_276 = ~_T_275; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_280 = _T_277 & _T_295; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_267 = |_T_266; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_268 = ~_T_267; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_272 = _T_269 & _T_295; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_326 = |_T_325; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_327 = ~_T_326; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_331 = _T_328 & _T_330; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_318 = |_T_317; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_319 = ~_T_318; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_323 = _T_320 & _T_330; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_310 = |_T_309; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_311 = ~_T_310; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_315 = _T_312 & _T_330; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_302 = |_T_301; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_303 = ~_T_302; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_307 = _T_304 & _T_330; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 202:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 202:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_361 = |_T_360; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_362 = ~_T_361; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 207:150]
  wire  _T_366 = _T_363 & _T_365; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_353 = |_T_352; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_354 = ~_T_353; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_358 = _T_355 & _T_365; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_345 = |_T_344; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_346 = ~_T_345; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_350 = _T_347 & _T_365; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 207:122]
  wire  _T_337 = |_T_336; // @[el2_lsu_bus_buffer.scala 207:144]
  wire  _T_338 = ~_T_337; // @[el2_lsu_bus_buffer.scala 207:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[el2_lsu_bus_buffer.scala 207:97]
  wire  _T_342 = _T_339 & _T_365; // @[el2_lsu_bus_buffer.scala 207:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[el2_lsu_bus_buffer.scala 199:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 199:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_396 = |_T_395; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_397 = ~_T_396; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 214:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[el2_lsu_bus_buffer.scala 214:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 214:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 214:99]
  wire [3:0] _T_525 = ld_addr_ibuf_hit_hi ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_526 = _T_525 & ibuf_byteen; // @[el2_lsu_bus_buffer.scala 219:55]
  wire [3:0] ld_byte_ibuf_hit_hi = _T_526 & ldst_byteen_hi_m; // @[el2_lsu_bus_buffer.scala 219:69]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 208:150]
  wire  _T_401 = _T_398 & _T_400; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_388 = |_T_387; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_389 = ~_T_388; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_393 = _T_390 & _T_400; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_380 = |_T_379; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_381 = ~_T_380; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_385 = _T_382 & _T_400; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_372 = |_T_371; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_373 = ~_T_372; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_377 = _T_374 & _T_400; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[el2_lsu_bus_buffer.scala 200:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 200:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_431 = |_T_430; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_432 = ~_T_431; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 208:150]
  wire  _T_436 = _T_433 & _T_435; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_423 = |_T_422; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_424 = ~_T_423; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_428 = _T_425 & _T_435; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_415 = |_T_414; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_416 = ~_T_415; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_420 = _T_417 & _T_435; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_407 = |_T_406; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_408 = ~_T_407; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_412 = _T_409 & _T_435; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[el2_lsu_bus_buffer.scala 200:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 200:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_466 = |_T_465; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_467 = ~_T_466; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 208:150]
  wire  _T_471 = _T_468 & _T_470; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_458 = |_T_457; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_459 = ~_T_458; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_463 = _T_460 & _T_470; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_450 = |_T_449; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_451 = ~_T_450; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_455 = _T_452 & _T_470; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_442 = |_T_441; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_443 = ~_T_442; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_447 = _T_444 & _T_470; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[el2_lsu_bus_buffer.scala 200:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 200:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 203:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 203:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_501 = |_T_500; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_502 = ~_T_501; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 208:150]
  wire  _T_506 = _T_503 & _T_505; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_493 = |_T_492; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_494 = ~_T_493; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_498 = _T_495 & _T_505; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_485 = |_T_484; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_486 = ~_T_485; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_490 = _T_487 & _T_505; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 208:122]
  wire  _T_477 = |_T_476; // @[el2_lsu_bus_buffer.scala 208:144]
  wire  _T_478 = ~_T_477; // @[el2_lsu_bus_buffer.scala 208:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[el2_lsu_bus_buffer.scala 208:97]
  wire  _T_482 = _T_479 & _T_505; // @[el2_lsu_bus_buffer.scala 208:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[el2_lsu_bus_buffer.scala 200:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 200:77]
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
  reg [31:0] buf_data_0; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_354 = {{1'd0}, _T_558}; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [8:0] _T_560 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_355 = {{1'd0}, _T_563}; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [8:0] _T_565 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_356 = {{1'd0}, _T_568}; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [8:0] _T_570 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_357 = {{1'd0}, _T_573}; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [8:0] _T_575 = _GEN_357 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 226:91]
  wire [8:0] _T_576 = _T_560 | _T_565; // @[el2_lsu_bus_buffer.scala 226:123]
  wire [8:0] _T_577 = _T_576 | _T_570; // @[el2_lsu_bus_buffer.scala 226:123]
  wire [8:0] _T_578 = _T_577 | _T_575; // @[el2_lsu_bus_buffer.scala 226:123]
  wire [7:0] _T_581 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_583 = _T_581 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_586 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_588 = _T_586 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_591 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_593 = _T_591 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_596 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_598 = _T_596 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_599 = _T_583 | _T_588; // @[el2_lsu_bus_buffer.scala 227:97]
  wire [7:0] _T_600 = _T_599 | _T_593; // @[el2_lsu_bus_buffer.scala 227:97]
  wire [7:0] _T_601 = _T_600 | _T_598; // @[el2_lsu_bus_buffer.scala 227:97]
  wire [7:0] _T_604 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_606 = _T_604 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_609 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_611 = _T_609 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_614 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_616 = _T_614 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_619 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_621 = _T_619 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_622 = _T_606 | _T_611; // @[el2_lsu_bus_buffer.scala 228:96]
  wire [7:0] _T_623 = _T_622 | _T_616; // @[el2_lsu_bus_buffer.scala 228:96]
  wire [7:0] _T_624 = _T_623 | _T_621; // @[el2_lsu_bus_buffer.scala 228:96]
  wire [7:0] _T_627 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_629 = _T_627 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_632 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_634 = _T_632 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_637 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_639 = _T_637 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_642 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_644 = _T_642 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 229:65]
  wire [7:0] _T_645 = _T_629 | _T_634; // @[el2_lsu_bus_buffer.scala 229:95]
  wire [7:0] _T_646 = _T_645 | _T_639; // @[el2_lsu_bus_buffer.scala 229:95]
  wire [7:0] _T_647 = _T_646 | _T_644; // @[el2_lsu_bus_buffer.scala 229:95]
  wire [32:0] _T_650 = {_T_578,_T_601,_T_624,_T_647}; // @[Cat.scala 29:58]
  reg [31:0] ibuf_data; // @[el2_lib.scala 491:16]
  wire [31:0] _T_651 = ld_fwddata_buf_lo_initial & ibuf_data; // @[el2_lsu_bus_buffer.scala 229:130]
  wire [32:0] _GEN_358 = {{1'd0}, _T_651}; // @[el2_lsu_bus_buffer.scala 229:101]
  wire [32:0] _T_652 = _T_650 | _GEN_358; // @[el2_lsu_bus_buffer.scala 229:101]
  wire [7:0] _T_655 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_359 = {{1'd0}, _T_655}; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [8:0] _T_657 = _GEN_359 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [7:0] _T_660 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_360 = {{1'd0}, _T_660}; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [8:0] _T_662 = _GEN_360 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [7:0] _T_665 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_361 = {{1'd0}, _T_665}; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [8:0] _T_667 = _GEN_361 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [7:0] _T_670 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_362 = {{1'd0}, _T_670}; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [8:0] _T_672 = _GEN_362 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 231:91]
  wire [8:0] _T_673 = _T_657 | _T_662; // @[el2_lsu_bus_buffer.scala 231:123]
  wire [8:0] _T_674 = _T_673 | _T_667; // @[el2_lsu_bus_buffer.scala 231:123]
  wire [8:0] _T_675 = _T_674 | _T_672; // @[el2_lsu_bus_buffer.scala 231:123]
  wire [7:0] _T_678 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_680 = _T_678 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_683 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_685 = _T_683 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_688 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_690 = _T_688 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_693 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_695 = _T_693 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_696 = _T_680 | _T_685; // @[el2_lsu_bus_buffer.scala 232:97]
  wire [7:0] _T_697 = _T_696 | _T_690; // @[el2_lsu_bus_buffer.scala 232:97]
  wire [7:0] _T_698 = _T_697 | _T_695; // @[el2_lsu_bus_buffer.scala 232:97]
  wire [7:0] _T_701 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_703 = _T_701 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_706 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_708 = _T_706 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_711 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_713 = _T_711 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_716 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_718 = _T_716 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_719 = _T_703 | _T_708; // @[el2_lsu_bus_buffer.scala 233:96]
  wire [7:0] _T_720 = _T_719 | _T_713; // @[el2_lsu_bus_buffer.scala 233:96]
  wire [7:0] _T_721 = _T_720 | _T_718; // @[el2_lsu_bus_buffer.scala 233:96]
  wire [7:0] _T_724 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_726 = _T_724 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 234:65]
  wire [7:0] _T_729 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_731 = _T_729 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 234:65]
  wire [7:0] _T_734 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_736 = _T_734 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 234:65]
  wire [7:0] _T_739 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_741 = _T_739 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 234:65]
  wire [7:0] _T_742 = _T_726 | _T_731; // @[el2_lsu_bus_buffer.scala 234:95]
  wire [7:0] _T_743 = _T_742 | _T_736; // @[el2_lsu_bus_buffer.scala 234:95]
  wire [7:0] _T_744 = _T_743 | _T_741; // @[el2_lsu_bus_buffer.scala 234:95]
  wire [32:0] _T_747 = {_T_675,_T_698,_T_721,_T_744}; // @[Cat.scala 29:58]
  wire [31:0] _T_748 = ld_fwddata_buf_hi_initial & ibuf_data; // @[el2_lsu_bus_buffer.scala 234:130]
  wire [32:0] _GEN_363 = {{1'd0}, _T_748}; // @[el2_lsu_bus_buffer.scala 234:101]
  wire [32:0] _T_749 = _T_747 | _GEN_363; // @[el2_lsu_bus_buffer.scala 234:101]
  wire [3:0] _T_750 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_751 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_752 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_753 = _T_750 | _T_751; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_753 | _T_752; // @[Mux.scala 27:72]
  wire  _T_756 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 241:55]
  wire  _T_758 = io_lsu_addr_r[1:0] == 2'h1; // @[el2_lsu_bus_buffer.scala 242:55]
  wire [3:0] _T_760 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_762 = io_lsu_addr_r[1:0] == 2'h2; // @[el2_lsu_bus_buffer.scala 243:55]
  wire [3:0] _T_764 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_766 = io_lsu_addr_r[1:0] == 2'h3; // @[el2_lsu_bus_buffer.scala 244:55]
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
  wire [31:0] _T_802 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_806 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_810 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
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
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 262:40]
  wire  _T_844 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 264:26]
  wire  _T_845 = io_lsu_pkt_r_word & _T_756; // @[Mux.scala 27:72]
  wire  _T_846 = io_lsu_pkt_r_half & _T_844; // @[Mux.scala 27:72]
  wire  _T_848 = _T_845 | _T_846; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_848 | io_lsu_pkt_r_by; // @[Mux.scala 27:72]
  wire  _T_850 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 266:55]
  wire  _T_851 = io_lsu_busreq_r & _T_850; // @[el2_lsu_bus_buffer.scala 266:34]
  wire  _T_852 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 266:79]
  wire  ibuf_byp = _T_851 & _T_852; // @[el2_lsu_bus_buffer.scala 266:77]
  wire  _T_853 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 267:36]
  wire  _T_854 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 267:56]
  wire  ibuf_wr_en = _T_853 & _T_854; // @[el2_lsu_bus_buffer.scala 267:54]
  wire  _T_855 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 269:36]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 312:59]
  wire  _T_864 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 275:62]
  wire  _T_865 = ibuf_wr_en | _T_864; // @[el2_lsu_bus_buffer.scala 275:48]
  wire  _T_929 = _T_853 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 294:54]
  wire  _T_930 = _T_929 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 294:75]
  wire  _T_931 = _T_930 & ibuf_write; // @[el2_lsu_bus_buffer.scala 294:88]
  wire  _T_934 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 294:124]
  wire  _T_935 = _T_931 & _T_934; // @[el2_lsu_bus_buffer.scala 294:101]
  wire  _T_936 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 294:147]
  wire  _T_937 = _T_935 & _T_936; // @[el2_lsu_bus_buffer.scala 294:145]
  wire  _T_938 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 294:170]
  wire  ibuf_merge_en = _T_937 & _T_938; // @[el2_lsu_bus_buffer.scala 294:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 295:20]
  wire  _T_866 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 275:98]
  wire  _T_867 = ~_T_866; // @[el2_lsu_bus_buffer.scala 275:82]
  wire  _T_868 = _T_865 & _T_867; // @[el2_lsu_bus_buffer.scala 275:80]
  wire  _T_869 = _T_868 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 276:5]
  wire  _T_857 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 270:44]
  wire  _T_858 = io_lsu_busreq_m & _T_857; // @[el2_lsu_bus_buffer.scala 270:42]
  wire  _T_859 = _T_858 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 270:61]
  wire  _T_862 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 270:115]
  wire  _T_863 = io_lsu_pkt_m_load | _T_862; // @[el2_lsu_bus_buffer.scala 270:95]
  wire  ibuf_force_drain = _T_859 & _T_863; // @[el2_lsu_bus_buffer.scala 270:74]
  wire  _T_870 = _T_869 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 276:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_871 = _T_870 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 276:35]
  wire  _T_872 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 276:55]
  wire  _T_873 = _T_871 | _T_872; // @[el2_lsu_bus_buffer.scala 276:53]
  wire  _T_874 = _T_873 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 276:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_874; // @[el2_lsu_bus_buffer.scala 275:32]
  wire  _T_856 = ibuf_drain_vld & _T_855; // @[el2_lsu_bus_buffer.scala 269:34]
  wire  ibuf_rst = _T_856 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 269:49]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 679:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 678:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_881 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 285:77]
  wire [7:0] _T_889 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_892 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[el2_lsu_bus_buffer.scala 291:8]
  wire [7:0] _T_893 = _T_866 ? _T_889 : _T_892; // @[el2_lsu_bus_buffer.scala 289:46]
  wire [7:0] _T_898 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_901 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[el2_lsu_bus_buffer.scala 291:8]
  wire [7:0] _T_902 = _T_866 ? _T_898 : _T_901; // @[el2_lsu_bus_buffer.scala 289:46]
  wire [7:0] _T_907 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_910 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[el2_lsu_bus_buffer.scala 291:8]
  wire [7:0] _T_911 = _T_866 ? _T_907 : _T_910; // @[el2_lsu_bus_buffer.scala 289:46]
  wire [7:0] _T_916 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_919 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[el2_lsu_bus_buffer.scala 291:8]
  wire [7:0] _T_920 = _T_866 ? _T_916 : _T_919; // @[el2_lsu_bus_buffer.scala 289:46]
  wire [23:0] _T_922 = {_T_920,_T_911,_T_902}; // @[Cat.scala 29:58]
  wire  _T_923 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 292:59]
  wire [2:0] _T_926 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 292:93]
  wire  _T_941 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 296:65]
  wire  _T_942 = ibuf_merge_en & _T_941; // @[el2_lsu_bus_buffer.scala 296:63]
  wire  _T_945 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 296:96]
  wire  _T_947 = _T_942 ? _T_945 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 296:48]
  wire  _T_952 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 296:96]
  wire  _T_954 = _T_942 ? _T_952 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 296:48]
  wire  _T_959 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 296:96]
  wire  _T_961 = _T_942 ? _T_959 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 296:48]
  wire  _T_966 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 296:96]
  wire  _T_968 = _T_942 ? _T_966 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 296:48]
  wire [3:0] ibuf_byteen_out = {_T_968,_T_961,_T_954,_T_947}; // @[Cat.scala 29:58]
  wire [7:0] _T_978 = _T_942 ? _T_889 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 297:45]
  wire [7:0] _T_986 = _T_942 ? _T_898 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 297:45]
  wire [7:0] _T_994 = _T_942 ? _T_907 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 297:45]
  wire [7:0] _T_1002 = _T_942 ? _T_916 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 297:45]
  wire [31:0] ibuf_data_out = {_T_1002,_T_994,_T_986,_T_978}; // @[Cat.scala 29:58]
  wire  _T_1005 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 299:28]
  wire  _T_1006 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 299:63]
  wire  _T_1011 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 300:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4473 = buf_write[3] & _T_2645; // @[el2_lsu_bus_buffer.scala 584:64]
  wire  _T_4474 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 584:91]
  wire  _T_4475 = _T_4473 & _T_4474; // @[el2_lsu_bus_buffer.scala 584:89]
  wire  _T_4468 = buf_write[2] & _T_2640; // @[el2_lsu_bus_buffer.scala 584:64]
  wire  _T_4469 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 584:91]
  wire  _T_4470 = _T_4468 & _T_4469; // @[el2_lsu_bus_buffer.scala 584:89]
  wire [1:0] _T_4476 = _T_4475 + _T_4470; // @[el2_lsu_bus_buffer.scala 584:142]
  wire  _T_4463 = buf_write[1] & _T_2635; // @[el2_lsu_bus_buffer.scala 584:64]
  wire  _T_4464 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 584:91]
  wire  _T_4465 = _T_4463 & _T_4464; // @[el2_lsu_bus_buffer.scala 584:89]
  wire [1:0] _GEN_364 = {{1'd0}, _T_4465}; // @[el2_lsu_bus_buffer.scala 584:142]
  wire [2:0] _T_4477 = _T_4476 + _GEN_364; // @[el2_lsu_bus_buffer.scala 584:142]
  wire  _T_4458 = buf_write[0] & _T_2630; // @[el2_lsu_bus_buffer.scala 584:64]
  wire  _T_4459 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 584:91]
  wire  _T_4460 = _T_4458 & _T_4459; // @[el2_lsu_bus_buffer.scala 584:89]
  wire [2:0] _GEN_365 = {{2'd0}, _T_4460}; // @[el2_lsu_bus_buffer.scala 584:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4477 + _GEN_365; // @[el2_lsu_bus_buffer.scala 584:142]
  wire  _T_1037 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 322:43]
  wire  _T_4490 = _T_2645 & _T_4474; // @[el2_lsu_bus_buffer.scala 585:73]
  wire  _T_4487 = _T_2640 & _T_4469; // @[el2_lsu_bus_buffer.scala 585:73]
  wire [1:0] _T_4491 = _T_4490 + _T_4487; // @[el2_lsu_bus_buffer.scala 585:126]
  wire  _T_4484 = _T_2635 & _T_4464; // @[el2_lsu_bus_buffer.scala 585:73]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4484}; // @[el2_lsu_bus_buffer.scala 585:126]
  wire [2:0] _T_4492 = _T_4491 + _GEN_366; // @[el2_lsu_bus_buffer.scala 585:126]
  wire  _T_4481 = _T_2630 & _T_4459; // @[el2_lsu_bus_buffer.scala 585:73]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4481}; // @[el2_lsu_bus_buffer.scala 585:126]
  wire [3:0] buf_numvld_cmd_any = _T_4492 + _GEN_367; // @[el2_lsu_bus_buffer.scala 585:126]
  wire  _T_1038 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 322:72]
  wire  _T_1039 = _T_1037 & _T_1038; // @[el2_lsu_bus_buffer.scala 322:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 421:54]
  wire  _T_1040 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 322:97]
  wire  _T_1041 = _T_1039 & _T_1040; // @[el2_lsu_bus_buffer.scala 322:80]
  wire  _T_1043 = _T_1041 & _T_938; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_2003 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 439:58]
  wire  _T_2004 = ~_T_2003; // @[el2_lsu_bus_buffer.scala 439:45]
  wire  _T_2006 = _T_2004 & _T_2645; // @[el2_lsu_bus_buffer.scala 439:63]
  wire  _T_2008 = _T_2006 & _T_4474; // @[el2_lsu_bus_buffer.scala 439:88]
  wire  _T_1997 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 439:58]
  wire  _T_1998 = ~_T_1997; // @[el2_lsu_bus_buffer.scala 439:45]
  wire  _T_2000 = _T_1998 & _T_2640; // @[el2_lsu_bus_buffer.scala 439:63]
  wire  _T_2002 = _T_2000 & _T_4469; // @[el2_lsu_bus_buffer.scala 439:88]
  wire  _T_1991 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 439:58]
  wire  _T_1992 = ~_T_1991; // @[el2_lsu_bus_buffer.scala 439:45]
  wire  _T_1994 = _T_1992 & _T_2635; // @[el2_lsu_bus_buffer.scala 439:63]
  wire  _T_1996 = _T_1994 & _T_4464; // @[el2_lsu_bus_buffer.scala 439:88]
  wire  _T_1985 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 439:58]
  wire  _T_1986 = ~_T_1985; // @[el2_lsu_bus_buffer.scala 439:45]
  wire  _T_1988 = _T_1986 & _T_2630; // @[el2_lsu_bus_buffer.scala 439:63]
  wire  _T_1990 = _T_1988 & _T_4459; // @[el2_lsu_bus_buffer.scala 439:88]
  wire [3:0] CmdPtr0Dec = {_T_2008,_T_2002,_T_1996,_T_1990}; // @[Cat.scala 29:58]
  wire [7:0] _T_2078 = {4'h0,_T_2008,_T_2002,_T_1996,_T_1990}; // @[Cat.scala 29:58]
  wire  _T_2081 = _T_2078[4] | _T_2078[5]; // @[el2_lsu_bus_buffer.scala 447:42]
  wire  _T_2083 = _T_2081 | _T_2078[6]; // @[el2_lsu_bus_buffer.scala 447:48]
  wire  _T_2085 = _T_2083 | _T_2078[7]; // @[el2_lsu_bus_buffer.scala 447:54]
  wire  _T_2088 = _T_2078[2] | _T_2078[3]; // @[el2_lsu_bus_buffer.scala 447:67]
  wire  _T_2090 = _T_2088 | _T_2078[6]; // @[el2_lsu_bus_buffer.scala 447:73]
  wire  _T_2092 = _T_2090 | _T_2078[7]; // @[el2_lsu_bus_buffer.scala 447:79]
  wire  _T_2095 = _T_2078[1] | _T_2078[3]; // @[el2_lsu_bus_buffer.scala 447:92]
  wire  _T_2097 = _T_2095 | _T_2078[5]; // @[el2_lsu_bus_buffer.scala 447:98]
  wire  _T_2099 = _T_2097 | _T_2078[7]; // @[el2_lsu_bus_buffer.scala 447:104]
  wire [2:0] _T_2101 = {_T_2085,_T_2092,_T_2099}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2101[1:0]; // @[el2_lsu_bus_buffer.scala 453:11]
  wire  _T_1044 = CmdPtr0 == 2'h0; // @[el2_lsu_bus_buffer.scala 323:114]
  wire  _T_1045 = CmdPtr0 == 2'h1; // @[el2_lsu_bus_buffer.scala 323:114]
  wire  _T_1046 = CmdPtr0 == 2'h2; // @[el2_lsu_bus_buffer.scala 323:114]
  wire  _T_1047 = CmdPtr0 == 2'h3; // @[el2_lsu_bus_buffer.scala 323:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_1048 = _T_1044 & buf_nomerge_0; // @[Mux.scala 27:72]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _T_1049 = _T_1045 & buf_nomerge_1; // @[Mux.scala 27:72]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _T_1050 = _T_1046 & buf_nomerge_2; // @[Mux.scala 27:72]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1051 = _T_1047 & buf_nomerge_3; // @[Mux.scala 27:72]
  wire  _T_1052 = _T_1048 | _T_1049; // @[Mux.scala 27:72]
  wire  _T_1053 = _T_1052 | _T_1050; // @[Mux.scala 27:72]
  wire  _T_1054 = _T_1053 | _T_1051; // @[Mux.scala 27:72]
  wire  _T_1056 = ~_T_1054; // @[el2_lsu_bus_buffer.scala 323:31]
  wire  _T_1057 = _T_1043 & _T_1056; // @[el2_lsu_bus_buffer.scala 323:29]
  reg  _T_4354; // @[Reg.scala 27:20]
  reg  _T_4351; // @[Reg.scala 27:20]
  reg  _T_4348; // @[Reg.scala 27:20]
  reg  _T_4345; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4354,_T_4351,_T_4348,_T_4345}; // @[Cat.scala 29:58]
  wire  _T_1066 = _T_1044 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1067 = _T_1045 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1068 = _T_1046 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1069 = _T_1047 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1070 = _T_1066 | _T_1067; // @[Mux.scala 27:72]
  wire  _T_1071 = _T_1070 | _T_1068; // @[Mux.scala 27:72]
  wire  _T_1072 = _T_1071 | _T_1069; // @[Mux.scala 27:72]
  wire  _T_1074 = ~_T_1072; // @[el2_lsu_bus_buffer.scala 324:5]
  wire  _T_1075 = _T_1057 & _T_1074; // @[el2_lsu_bus_buffer.scala 323:140]
  wire  _T_1086 = _T_858 & _T_852; // @[el2_lsu_bus_buffer.scala 326:58]
  wire  _T_1088 = _T_1086 & _T_1038; // @[el2_lsu_bus_buffer.scala 326:72]
  wire [29:0] _T_1098 = _T_1044 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1099 = _T_1045 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1102 = _T_1098 | _T_1099; // @[Mux.scala 27:72]
  wire [29:0] _T_1100 = _T_1046 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1103 = _T_1102 | _T_1100; // @[Mux.scala 27:72]
  wire [29:0] _T_1101 = _T_1047 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1104 = _T_1103 | _T_1101; // @[Mux.scala 27:72]
  wire  _T_1106 = io_lsu_addr_m[31:2] != _T_1104; // @[el2_lsu_bus_buffer.scala 326:123]
  wire  obuf_force_wr_en = _T_1088 & _T_1106; // @[el2_lsu_bus_buffer.scala 326:101]
  wire  _T_1076 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 324:119]
  wire  obuf_wr_wait = _T_1075 & _T_1076; // @[el2_lsu_bus_buffer.scala 324:117]
  wire  _T_1077 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 325:75]
  wire  _T_1078 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 325:95]
  wire  _T_1079 = _T_1077 & _T_1078; // @[el2_lsu_bus_buffer.scala 325:79]
  wire [2:0] _T_1081 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 325:121]
  wire  _T_4509 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 586:63]
  wire  _T_4513 = _T_4509 | _T_4490; // @[el2_lsu_bus_buffer.scala 586:74]
  wire  _T_4504 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 586:63]
  wire  _T_4508 = _T_4504 | _T_4487; // @[el2_lsu_bus_buffer.scala 586:74]
  wire [1:0] _T_4514 = _T_4513 + _T_4508; // @[el2_lsu_bus_buffer.scala 586:154]
  wire  _T_4499 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 586:63]
  wire  _T_4503 = _T_4499 | _T_4484; // @[el2_lsu_bus_buffer.scala 586:74]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4503}; // @[el2_lsu_bus_buffer.scala 586:154]
  wire [2:0] _T_4515 = _T_4514 + _GEN_368; // @[el2_lsu_bus_buffer.scala 586:154]
  wire  _T_4494 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 586:63]
  wire  _T_4498 = _T_4494 | _T_4481; // @[el2_lsu_bus_buffer.scala 586:74]
  wire [2:0] _GEN_369 = {{2'd0}, _T_4498}; // @[el2_lsu_bus_buffer.scala 586:154]
  wire [3:0] buf_numvld_pend_any = _T_4515 + _GEN_369; // @[el2_lsu_bus_buffer.scala 586:154]
  wire  _T_1108 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 328:53]
  wire  _T_1109 = ibuf_byp & _T_1108; // @[el2_lsu_bus_buffer.scala 328:31]
  wire  _T_1110 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 328:64]
  wire  _T_1111 = _T_1110 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 328:84]
  wire  ibuf_buf_byp = _T_1109 & _T_1111; // @[el2_lsu_bus_buffer.scala 328:61]
  wire  _T_1112 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 343:32]
  wire  _T_4805 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 615:62]
  wire  _T_4807 = _T_4805 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 615:73]
  wire  _T_4808 = _T_4807 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 615:93]
  wire  _T_4809 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 615:62]
  wire  _T_4811 = _T_4809 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 615:73]
  wire  _T_4812 = _T_4811 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 615:93]
  wire  _T_4821 = _T_4808 | _T_4812; // @[el2_lsu_bus_buffer.scala 615:141]
  wire  _T_4813 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 615:62]
  wire  _T_4815 = _T_4813 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 615:73]
  wire  _T_4816 = _T_4815 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 615:93]
  wire  _T_4822 = _T_4821 | _T_4816; // @[el2_lsu_bus_buffer.scala 615:141]
  wire  _T_4817 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 615:62]
  wire  _T_4819 = _T_4817 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 615:73]
  wire  _T_4820 = _T_4819 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 615:93]
  wire  bus_sideeffect_pend = _T_4822 | _T_4820; // @[el2_lsu_bus_buffer.scala 615:141]
  wire  _T_1113 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 343:74]
  wire  _T_1114 = ~_T_1113; // @[el2_lsu_bus_buffer.scala 343:52]
  wire  _T_1115 = _T_1112 & _T_1114; // @[el2_lsu_bus_buffer.scala 343:50]
  wire [2:0] _T_1120 = _T_1044 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1121 = _T_1045 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire [2:0] _T_1122 = _T_1046 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire [2:0] _T_1123 = _T_1047 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = _T_1126 == 3'h2; // @[el2_lsu_bus_buffer.scala 344:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 444:31]
  wire  _T_1129 = _T_1128 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 344:47]
  wire [3:0] _T_1132 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1141 = _T_1044 & _T_1132[0]; // @[Mux.scala 27:72]
  wire  _T_1142 = _T_1045 & _T_1132[1]; // @[Mux.scala 27:72]
  wire  _T_1145 = _T_1141 | _T_1142; // @[Mux.scala 27:72]
  wire  _T_1143 = _T_1046 & _T_1132[2]; // @[Mux.scala 27:72]
  wire  _T_1146 = _T_1145 | _T_1143; // @[Mux.scala 27:72]
  wire  _T_1144 = _T_1047 & _T_1132[3]; // @[Mux.scala 27:72]
  wire  _T_1147 = _T_1146 | _T_1144; // @[Mux.scala 27:72]
  wire  _T_1149 = ~_T_1147; // @[el2_lsu_bus_buffer.scala 345:23]
  wire  _T_1150 = _T_1129 & _T_1149; // @[el2_lsu_bus_buffer.scala 345:21]
  wire  _T_1167 = _T_1072 & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 345:141]
  wire  _T_1168 = ~_T_1167; // @[el2_lsu_bus_buffer.scala 345:105]
  wire  _T_1169 = _T_1150 & _T_1168; // @[el2_lsu_bus_buffer.scala 345:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1172 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  wire  _T_1181 = _T_1044 & _T_1172[0]; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1045 & _T_1172[1]; // @[Mux.scala 27:72]
  wire  _T_1185 = _T_1181 | _T_1182; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1046 & _T_1172[2]; // @[Mux.scala 27:72]
  wire  _T_1186 = _T_1185 | _T_1183; // @[Mux.scala 27:72]
  wire  _T_1184 = _T_1047 & _T_1172[3]; // @[Mux.scala 27:72]
  wire  _T_1187 = _T_1186 | _T_1184; // @[Mux.scala 27:72]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1191 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1200 = _T_1044 & _T_1191[0]; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1045 & _T_1191[1]; // @[Mux.scala 27:72]
  wire  _T_1204 = _T_1200 | _T_1201; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1046 & _T_1191[2]; // @[Mux.scala 27:72]
  wire  _T_1205 = _T_1204 | _T_1202; // @[Mux.scala 27:72]
  wire  _T_1203 = _T_1047 & _T_1191[3]; // @[Mux.scala 27:72]
  wire  _T_1206 = _T_1205 | _T_1203; // @[Mux.scala 27:72]
  wire  _T_1208 = _T_1187 & _T_1206; // @[el2_lsu_bus_buffer.scala 346:77]
  wire  _T_1217 = _T_1044 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1218 = _T_1045 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1217 | _T_1218; // @[Mux.scala 27:72]
  wire  _T_1219 = _T_1046 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1221 | _T_1219; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1047 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1222 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1225 = ~_T_1223; // @[el2_lsu_bus_buffer.scala 346:150]
  wire  _T_1226 = _T_1208 & _T_1225; // @[el2_lsu_bus_buffer.scala 346:148]
  wire  _T_1227 = ~_T_1226; // @[el2_lsu_bus_buffer.scala 346:8]
  wire [3:0] _T_2044 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 440:62]
  wire [3:0] _T_2045 = buf_age_3 & _T_2044; // @[el2_lsu_bus_buffer.scala 440:59]
  wire  _T_2046 = |_T_2045; // @[el2_lsu_bus_buffer.scala 440:76]
  wire  _T_2047 = ~_T_2046; // @[el2_lsu_bus_buffer.scala 440:45]
  wire  _T_2049 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 440:83]
  wire  _T_2050 = _T_2047 & _T_2049; // @[el2_lsu_bus_buffer.scala 440:81]
  wire  _T_2052 = _T_2050 & _T_2645; // @[el2_lsu_bus_buffer.scala 440:98]
  wire  _T_2054 = _T_2052 & _T_4474; // @[el2_lsu_bus_buffer.scala 440:123]
  wire [3:0] _T_2034 = buf_age_2 & _T_2044; // @[el2_lsu_bus_buffer.scala 440:59]
  wire  _T_2035 = |_T_2034; // @[el2_lsu_bus_buffer.scala 440:76]
  wire  _T_2036 = ~_T_2035; // @[el2_lsu_bus_buffer.scala 440:45]
  wire  _T_2038 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 440:83]
  wire  _T_2039 = _T_2036 & _T_2038; // @[el2_lsu_bus_buffer.scala 440:81]
  wire  _T_2041 = _T_2039 & _T_2640; // @[el2_lsu_bus_buffer.scala 440:98]
  wire  _T_2043 = _T_2041 & _T_4469; // @[el2_lsu_bus_buffer.scala 440:123]
  wire [3:0] _T_2023 = buf_age_1 & _T_2044; // @[el2_lsu_bus_buffer.scala 440:59]
  wire  _T_2024 = |_T_2023; // @[el2_lsu_bus_buffer.scala 440:76]
  wire  _T_2025 = ~_T_2024; // @[el2_lsu_bus_buffer.scala 440:45]
  wire  _T_2027 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 440:83]
  wire  _T_2028 = _T_2025 & _T_2027; // @[el2_lsu_bus_buffer.scala 440:81]
  wire  _T_2030 = _T_2028 & _T_2635; // @[el2_lsu_bus_buffer.scala 440:98]
  wire  _T_2032 = _T_2030 & _T_4464; // @[el2_lsu_bus_buffer.scala 440:123]
  wire [3:0] _T_2012 = buf_age_0 & _T_2044; // @[el2_lsu_bus_buffer.scala 440:59]
  wire  _T_2013 = |_T_2012; // @[el2_lsu_bus_buffer.scala 440:76]
  wire  _T_2014 = ~_T_2013; // @[el2_lsu_bus_buffer.scala 440:45]
  wire  _T_2016 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 440:83]
  wire  _T_2017 = _T_2014 & _T_2016; // @[el2_lsu_bus_buffer.scala 440:81]
  wire  _T_2019 = _T_2017 & _T_2630; // @[el2_lsu_bus_buffer.scala 440:98]
  wire  _T_2021 = _T_2019 & _T_4459; // @[el2_lsu_bus_buffer.scala 440:123]
  wire [3:0] CmdPtr1Dec = {_T_2054,_T_2043,_T_2032,_T_2021}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 445:31]
  wire  _T_1228 = _T_1227 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 346:181]
  wire [3:0] _T_1231 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1240 = _T_1044 & _T_1231[0]; // @[Mux.scala 27:72]
  wire  _T_1241 = _T_1045 & _T_1231[1]; // @[Mux.scala 27:72]
  wire  _T_1244 = _T_1240 | _T_1241; // @[Mux.scala 27:72]
  wire  _T_1242 = _T_1046 & _T_1231[2]; // @[Mux.scala 27:72]
  wire  _T_1245 = _T_1244 | _T_1242; // @[Mux.scala 27:72]
  wire  _T_1243 = _T_1047 & _T_1231[3]; // @[Mux.scala 27:72]
  wire  _T_1246 = _T_1245 | _T_1243; // @[Mux.scala 27:72]
  wire  _T_1248 = _T_1228 | _T_1246; // @[el2_lsu_bus_buffer.scala 346:197]
  wire  _T_1249 = _T_1248 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 346:269]
  wire  _T_1250 = _T_1169 & _T_1249; // @[el2_lsu_bus_buffer.scala 345:164]
  wire  _T_1251 = _T_1115 | _T_1250; // @[el2_lsu_bus_buffer.scala 343:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 408:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 409:55]
  wire  _T_4880 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 619:54]
  wire  _T_4881 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 619:75]
  wire  _T_4883 = _T_4880 ? _T_4881 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 619:39]
  wire  bus_cmd_ready = obuf_write ? _T_4883 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 619:23]
  wire  _T_1252 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 347:48]
  wire  _T_1253 = bus_cmd_ready | _T_1252; // @[el2_lsu_bus_buffer.scala 347:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1254 = _T_1253 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 347:60]
  wire  _T_1255 = _T_1251 & _T_1254; // @[el2_lsu_bus_buffer.scala 347:29]
  wire  _T_1256 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 347:77]
  wire  _T_1257 = _T_1255 & _T_1256; // @[el2_lsu_bus_buffer.scala 347:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4828 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 617:56]
  wire  _T_4829 = obuf_valid & _T_4828; // @[el2_lsu_bus_buffer.scala 617:38]
  wire  _T_4831 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 617:126]
  wire  _T_4832 = obuf_merge & _T_4831; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4833 = _T_3586 | _T_4832; // @[el2_lsu_bus_buffer.scala 617:100]
  wire  _T_4834 = ~_T_4833; // @[el2_lsu_bus_buffer.scala 617:80]
  wire  _T_4835 = _T_4829 & _T_4834; // @[el2_lsu_bus_buffer.scala 617:78]
  wire  _T_4872 = _T_4805 & _T_4835; // @[Mux.scala 27:72]
  wire  _T_4840 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 617:56]
  wire  _T_4841 = obuf_valid & _T_4840; // @[el2_lsu_bus_buffer.scala 617:38]
  wire  _T_4843 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 617:126]
  wire  _T_4844 = obuf_merge & _T_4843; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4845 = _T_3779 | _T_4844; // @[el2_lsu_bus_buffer.scala 617:100]
  wire  _T_4846 = ~_T_4845; // @[el2_lsu_bus_buffer.scala 617:80]
  wire  _T_4847 = _T_4841 & _T_4846; // @[el2_lsu_bus_buffer.scala 617:78]
  wire  _T_4873 = _T_4809 & _T_4847; // @[Mux.scala 27:72]
  wire  _T_4876 = _T_4872 | _T_4873; // @[Mux.scala 27:72]
  wire  _T_4852 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 617:56]
  wire  _T_4853 = obuf_valid & _T_4852; // @[el2_lsu_bus_buffer.scala 617:38]
  wire  _T_4855 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 617:126]
  wire  _T_4856 = obuf_merge & _T_4855; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4857 = _T_3972 | _T_4856; // @[el2_lsu_bus_buffer.scala 617:100]
  wire  _T_4858 = ~_T_4857; // @[el2_lsu_bus_buffer.scala 617:80]
  wire  _T_4859 = _T_4853 & _T_4858; // @[el2_lsu_bus_buffer.scala 617:78]
  wire  _T_4874 = _T_4813 & _T_4859; // @[Mux.scala 27:72]
  wire  _T_4877 = _T_4876 | _T_4874; // @[Mux.scala 27:72]
  wire  _T_4864 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 617:56]
  wire  _T_4865 = obuf_valid & _T_4864; // @[el2_lsu_bus_buffer.scala 617:38]
  wire  _T_4867 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 617:126]
  wire  _T_4868 = obuf_merge & _T_4867; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4869 = _T_4165 | _T_4868; // @[el2_lsu_bus_buffer.scala 617:100]
  wire  _T_4870 = ~_T_4869; // @[el2_lsu_bus_buffer.scala 617:80]
  wire  _T_4871 = _T_4865 & _T_4870; // @[el2_lsu_bus_buffer.scala 617:78]
  wire  _T_4875 = _T_4817 & _T_4871; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4877 | _T_4875; // @[Mux.scala 27:72]
  wire  _T_1260 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 347:118]
  wire  _T_1261 = _T_1257 & _T_1260; // @[el2_lsu_bus_buffer.scala 347:116]
  wire  obuf_wr_en = _T_1261 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 347:142]
  wire  _T_1263 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 349:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 620:39]
  wire  _T_4887 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 622:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 621:39]
  wire  _T_4888 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 622:70]
  wire  _T_4889 = _T_4887 & _T_4888; // @[el2_lsu_bus_buffer.scala 622:52]
  wire  _T_4890 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 622:111]
  wire  bus_cmd_sent = _T_4889 | _T_4890; // @[el2_lsu_bus_buffer.scala 622:89]
  wire  _T_1264 = bus_cmd_sent | _T_1263; // @[el2_lsu_bus_buffer.scala 349:33]
  wire  _T_1265 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 349:65]
  wire  _T_1266 = _T_1264 & _T_1265; // @[el2_lsu_bus_buffer.scala 349:63]
  wire  _T_1267 = _T_1266 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 349:77]
  wire  obuf_rst = _T_1267 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 349:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : _T_1223; // @[el2_lsu_bus_buffer.scala 350:26]
  wire [31:0] _T_1304 = _T_1044 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1305 = _T_1045 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1306 = _T_1046 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1307 = _T_1047 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1308 = _T_1304 | _T_1305; // @[Mux.scala 27:72]
  wire [31:0] _T_1309 = _T_1308 | _T_1306; // @[Mux.scala 27:72]
  wire [31:0] _T_1310 = _T_1309 | _T_1307; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1310; // @[el2_lsu_bus_buffer.scala 352:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1317 = _T_1044 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1318 = _T_1045 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1319 = _T_1046 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1320 = _T_1047 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1321 = _T_1317 | _T_1318; // @[Mux.scala 27:72]
  wire [1:0] _T_1322 = _T_1321 | _T_1319; // @[Mux.scala 27:72]
  wire [1:0] _T_1323 = _T_1322 | _T_1320; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1323; // @[el2_lsu_bus_buffer.scala 355:23]
  wire  _T_1325 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 364:39]
  wire  _T_1326 = ~_T_1325; // @[el2_lsu_bus_buffer.scala 364:26]
  wire  _T_1332 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 368:72]
  wire  _T_1335 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 368:98]
  wire  _T_1336 = obuf_sz_in[0] & _T_1335; // @[el2_lsu_bus_buffer.scala 368:96]
  wire  _T_1337 = _T_1332 | _T_1336; // @[el2_lsu_bus_buffer.scala 368:79]
  wire  _T_1340 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 368:153]
  wire  _T_1341 = ~_T_1340; // @[el2_lsu_bus_buffer.scala 368:134]
  wire  _T_1342 = obuf_sz_in[1] & _T_1341; // @[el2_lsu_bus_buffer.scala 368:132]
  wire  _T_1343 = _T_1337 | _T_1342; // @[el2_lsu_bus_buffer.scala 368:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1343; // @[el2_lsu_bus_buffer.scala 368:28]
  wire  _T_1360 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 382:40]
  wire  _T_1361 = _T_1360 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 382:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1362 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 382:80]
  wire  _T_1363 = _T_1361 & _T_1362; // @[el2_lsu_bus_buffer.scala 382:78]
  wire  _T_1364 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 382:99]
  wire  _T_1365 = _T_1363 & _T_1364; // @[el2_lsu_bus_buffer.scala 382:97]
  wire  _T_1366 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 382:113]
  wire  _T_1367 = _T_1365 & _T_1366; // @[el2_lsu_bus_buffer.scala 382:111]
  wire  _T_1368 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 382:130]
  wire  _T_1369 = _T_1367 & _T_1368; // @[el2_lsu_bus_buffer.scala 382:128]
  wire  _T_1370 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 383:20]
  wire  _T_1371 = obuf_valid & _T_1370; // @[el2_lsu_bus_buffer.scala 383:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 410:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 623:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 411:55]
  wire  _T_1372 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 383:90]
  wire  _T_1373 = bus_rsp_read & _T_1372; // @[el2_lsu_bus_buffer.scala 383:70]
  wire  _T_1374 = ~_T_1373; // @[el2_lsu_bus_buffer.scala 383:55]
  wire  _T_1375 = obuf_rdrsp_pend & _T_1374; // @[el2_lsu_bus_buffer.scala 383:53]
  wire  _T_1376 = _T_1371 | _T_1375; // @[el2_lsu_bus_buffer.scala 383:34]
  wire  obuf_nosend_in = _T_1369 & _T_1376; // @[el2_lsu_bus_buffer.scala 382:165]
  wire  _T_1344 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 376:44]
  wire  _T_1345 = obuf_wr_en & _T_1344; // @[el2_lsu_bus_buffer.scala 376:42]
  wire  _T_1346 = ~_T_1345; // @[el2_lsu_bus_buffer.scala 376:29]
  wire  _T_1347 = _T_1346 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 376:61]
  wire  _T_1351 = _T_1347 & _T_1374; // @[el2_lsu_bus_buffer.scala 376:79]
  wire  _T_1353 = bus_cmd_sent & _T_1364; // @[el2_lsu_bus_buffer.scala 377:20]
  wire  _T_1354 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 377:37]
  wire  _T_1355 = _T_1353 & _T_1354; // @[el2_lsu_bus_buffer.scala 377:35]
  wire  _T_1357 = bus_cmd_sent | _T_1364; // @[el2_lsu_bus_buffer.scala 379:44]
  wire [7:0] _T_1379 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1380 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1381 = io_lsu_addr_r[2] ? _T_1379 : _T_1380; // @[el2_lsu_bus_buffer.scala 384:46]
  wire [3:0] _T_1400 = _T_1044 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1401 = _T_1045 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1402 = _T_1046 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1403 = _T_1047 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1404 = _T_1400 | _T_1401; // @[Mux.scala 27:72]
  wire [3:0] _T_1405 = _T_1404 | _T_1402; // @[Mux.scala 27:72]
  wire [3:0] _T_1406 = _T_1405 | _T_1403; // @[Mux.scala 27:72]
  wire [7:0] _T_1408 = {_T_1406,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1421 = {4'h0,_T_1406}; // @[Cat.scala 29:58]
  wire [7:0] _T_1422 = _T_1310[2] ? _T_1408 : _T_1421; // @[el2_lsu_bus_buffer.scala 385:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1381 : _T_1422; // @[el2_lsu_bus_buffer.scala 384:28]
  wire [7:0] _T_1424 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1425 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1426 = io_end_addr_r[2] ? _T_1424 : _T_1425; // @[el2_lsu_bus_buffer.scala 386:46]
  wire [7:0] _T_1453 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1466 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1467 = buf_addr_0[2] ? _T_1453 : _T_1466; // @[el2_lsu_bus_buffer.scala 387:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1426 : _T_1467; // @[el2_lsu_bus_buffer.scala 386:28]
  wire [63:0] _T_1469 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1470 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1471 = io_lsu_addr_r[2] ? _T_1469 : _T_1470; // @[el2_lsu_bus_buffer.scala 389:44]
  wire [31:0] _T_1490 = _T_1044 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1491 = _T_1045 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1492 = _T_1046 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1493 = _T_1047 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1494 = _T_1490 | _T_1491; // @[Mux.scala 27:72]
  wire [31:0] _T_1495 = _T_1494 | _T_1492; // @[Mux.scala 27:72]
  wire [31:0] _T_1496 = _T_1495 | _T_1493; // @[Mux.scala 27:72]
  wire [63:0] _T_1498 = {_T_1496,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1511 = {32'h0,_T_1496}; // @[Cat.scala 29:58]
  wire [63:0] _T_1512 = _T_1310[2] ? _T_1498 : _T_1511; // @[el2_lsu_bus_buffer.scala 390:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1471 : _T_1512; // @[el2_lsu_bus_buffer.scala 389:26]
  wire [63:0] _T_1514 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1515 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1516 = io_lsu_addr_r[2] ? _T_1514 : _T_1515; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [63:0] _T_1543 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1556 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1557 = buf_addr_0[2] ? _T_1543 : _T_1556; // @[el2_lsu_bus_buffer.scala 392:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1516 : _T_1557; // @[el2_lsu_bus_buffer.scala 391:26]
  wire  _T_1642 = CmdPtr0 != 2'h0; // @[el2_lsu_bus_buffer.scala 398:30]
  wire  _T_1643 = _T_1642 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 398:43]
  wire  _T_1644 = _T_1643 & found_cmdptr1; // @[el2_lsu_bus_buffer.scala 398:59]
  wire  _T_1658 = _T_1644 & _T_1128; // @[el2_lsu_bus_buffer.scala 398:75]
  wire  _T_1672 = _T_1658 & _T_2630; // @[el2_lsu_bus_buffer.scala 398:118]
  wire  _T_1693 = _T_1672 & _T_1149; // @[el2_lsu_bus_buffer.scala 398:161]
  wire  _T_1711 = _T_1693 & _T_1074; // @[el2_lsu_bus_buffer.scala 399:83]
  wire  _T_1813 = _T_1225 & _T_1187; // @[el2_lsu_bus_buffer.scala 402:36]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1816 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1825 = _T_1044 & _T_1816[0]; // @[Mux.scala 27:72]
  wire  _T_1826 = _T_1045 & _T_1816[1]; // @[Mux.scala 27:72]
  wire  _T_1829 = _T_1825 | _T_1826; // @[Mux.scala 27:72]
  wire  _T_1827 = _T_1046 & _T_1816[2]; // @[Mux.scala 27:72]
  wire  _T_1830 = _T_1829 | _T_1827; // @[Mux.scala 27:72]
  wire  _T_1828 = _T_1047 & _T_1816[3]; // @[Mux.scala 27:72]
  wire  _T_1831 = _T_1830 | _T_1828; // @[Mux.scala 27:72]
  wire  _T_1833 = ~_T_1831; // @[el2_lsu_bus_buffer.scala 402:107]
  wire  _T_1834 = _T_1813 & _T_1833; // @[el2_lsu_bus_buffer.scala 402:105]
  wire  _T_1854 = _T_1834 & _T_1206; // @[el2_lsu_bus_buffer.scala 402:177]
  wire  _T_1856 = _T_1711 & _T_1854; // @[el2_lsu_bus_buffer.scala 399:120]
  wire  _T_1857 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 403:19]
  wire  _T_1858 = _T_1857 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 403:35]
  wire  obuf_merge_en = _T_1856 | _T_1858; // @[el2_lsu_bus_buffer.scala 402:251]
  wire  _T_1560 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1561 = obuf_byteen0_in[0] | _T_1560; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1564 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1565 = obuf_byteen0_in[1] | _T_1564; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1568 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1569 = obuf_byteen0_in[2] | _T_1568; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1572 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1573 = obuf_byteen0_in[3] | _T_1572; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1576 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1577 = obuf_byteen0_in[4] | _T_1576; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1580 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1581 = obuf_byteen0_in[5] | _T_1580; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1584 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1585 = obuf_byteen0_in[6] | _T_1584; // @[el2_lsu_bus_buffer.scala 393:63]
  wire  _T_1588 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 393:80]
  wire  _T_1589 = obuf_byteen0_in[7] | _T_1588; // @[el2_lsu_bus_buffer.scala 393:63]
  wire [7:0] obuf_byteen_in = {_T_1589,_T_1585,_T_1581,_T_1577,_T_1573,_T_1569,_T_1565,_T_1561}; // @[Cat.scala 29:58]
  wire [7:0] _T_1600 = _T_1560 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1605 = _T_1564 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1610 = _T_1568 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1615 = _T_1572 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1620 = _T_1576 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1625 = _T_1580 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1630 = _T_1584 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [7:0] _T_1635 = _T_1588 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 394:44]
  wire [55:0] _T_1641 = {_T_1635,_T_1630,_T_1625,_T_1620,_T_1615,_T_1610,_T_1605}; // @[Cat.scala 29:58]
  wire  _T_1860 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 406:58]
  wire  _T_1861 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 406:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 491:16]
  wire  _T_1874 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 424:65]
  wire  _T_1875 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 425:30]
  wire  _T_1876 = ibuf_valid & _T_1875; // @[el2_lsu_bus_buffer.scala 425:19]
  wire  _T_1877 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 426:18]
  wire  _T_1878 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 426:57]
  wire  _T_1879 = io_ldst_dual_r & _T_1878; // @[el2_lsu_bus_buffer.scala 426:45]
  wire  _T_1880 = _T_1877 | _T_1879; // @[el2_lsu_bus_buffer.scala 426:27]
  wire  _T_1881 = io_lsu_busreq_r & _T_1880; // @[el2_lsu_bus_buffer.scala 425:58]
  wire  _T_1882 = _T_1876 | _T_1881; // @[el2_lsu_bus_buffer.scala 425:39]
  wire  _T_1883 = ~_T_1882; // @[el2_lsu_bus_buffer.scala 425:5]
  wire  _T_1884 = _T_1874 & _T_1883; // @[el2_lsu_bus_buffer.scala 424:76]
  wire  _T_1885 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 424:65]
  wire  _T_1886 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 425:30]
  wire  _T_1887 = ibuf_valid & _T_1886; // @[el2_lsu_bus_buffer.scala 425:19]
  wire  _T_1888 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 426:18]
  wire  _T_1889 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 426:57]
  wire  _T_1890 = io_ldst_dual_r & _T_1889; // @[el2_lsu_bus_buffer.scala 426:45]
  wire  _T_1891 = _T_1888 | _T_1890; // @[el2_lsu_bus_buffer.scala 426:27]
  wire  _T_1892 = io_lsu_busreq_r & _T_1891; // @[el2_lsu_bus_buffer.scala 425:58]
  wire  _T_1893 = _T_1887 | _T_1892; // @[el2_lsu_bus_buffer.scala 425:39]
  wire  _T_1894 = ~_T_1893; // @[el2_lsu_bus_buffer.scala 425:5]
  wire  _T_1895 = _T_1885 & _T_1894; // @[el2_lsu_bus_buffer.scala 424:76]
  wire  _T_1896 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 424:65]
  wire  _T_1897 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 425:30]
  wire  _T_1898 = ibuf_valid & _T_1897; // @[el2_lsu_bus_buffer.scala 425:19]
  wire  _T_1899 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 426:18]
  wire  _T_1900 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 426:57]
  wire  _T_1901 = io_ldst_dual_r & _T_1900; // @[el2_lsu_bus_buffer.scala 426:45]
  wire  _T_1902 = _T_1899 | _T_1901; // @[el2_lsu_bus_buffer.scala 426:27]
  wire  _T_1903 = io_lsu_busreq_r & _T_1902; // @[el2_lsu_bus_buffer.scala 425:58]
  wire  _T_1904 = _T_1898 | _T_1903; // @[el2_lsu_bus_buffer.scala 425:39]
  wire  _T_1905 = ~_T_1904; // @[el2_lsu_bus_buffer.scala 425:5]
  wire  _T_1906 = _T_1896 & _T_1905; // @[el2_lsu_bus_buffer.scala 424:76]
  wire  _T_1907 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 424:65]
  wire  _T_1908 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 425:30]
  wire  _T_1909 = ibuf_valid & _T_1908; // @[el2_lsu_bus_buffer.scala 425:19]
  wire  _T_1910 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 426:18]
  wire  _T_1911 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 426:57]
  wire  _T_1912 = io_ldst_dual_r & _T_1911; // @[el2_lsu_bus_buffer.scala 426:45]
  wire  _T_1913 = _T_1910 | _T_1912; // @[el2_lsu_bus_buffer.scala 426:27]
  wire  _T_1914 = io_lsu_busreq_r & _T_1913; // @[el2_lsu_bus_buffer.scala 425:58]
  wire  _T_1915 = _T_1909 | _T_1914; // @[el2_lsu_bus_buffer.scala 425:39]
  wire  _T_1916 = ~_T_1915; // @[el2_lsu_bus_buffer.scala 425:5]
  wire  _T_1917 = _T_1907 & _T_1916; // @[el2_lsu_bus_buffer.scala 424:76]
  wire [1:0] _T_1918 = _T_1917 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1919 = _T_1906 ? 2'h2 : _T_1918; // @[Mux.scala 98:16]
  wire [1:0] _T_1920 = _T_1895 ? 2'h1 : _T_1919; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1884 ? 2'h0 : _T_1920; // @[Mux.scala 98:16]
  wire [8:0] _T_1923 = {buf_state_3,buf_state_2,buf_state_1}; // @[Cat.scala 29:58]
  wire  _T_1928 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 431:33]
  wire  _T_1929 = io_lsu_busreq_m & _T_1928; // @[el2_lsu_bus_buffer.scala 431:22]
  wire  _T_1930 = _T_1876 | _T_1929; // @[el2_lsu_bus_buffer.scala 430:117]
  wire  _T_1936 = _T_1930 | _T_1881; // @[el2_lsu_bus_buffer.scala 431:42]
  wire  _T_1937 = ~_T_1936; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_1938 = _T_1874 & _T_1937; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_1942 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 431:33]
  wire  _T_1943 = io_lsu_busreq_m & _T_1942; // @[el2_lsu_bus_buffer.scala 431:22]
  wire  _T_1944 = _T_1887 | _T_1943; // @[el2_lsu_bus_buffer.scala 430:117]
  wire  _T_1950 = _T_1944 | _T_1892; // @[el2_lsu_bus_buffer.scala 431:42]
  wire  _T_1951 = ~_T_1950; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_1952 = _T_1885 & _T_1951; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_1956 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 431:33]
  wire  _T_1957 = io_lsu_busreq_m & _T_1956; // @[el2_lsu_bus_buffer.scala 431:22]
  wire  _T_1958 = _T_1898 | _T_1957; // @[el2_lsu_bus_buffer.scala 430:117]
  wire  _T_1964 = _T_1958 | _T_1903; // @[el2_lsu_bus_buffer.scala 431:42]
  wire  _T_1965 = ~_T_1964; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_1966 = _T_1896 & _T_1965; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_1970 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 431:33]
  wire  _T_1971 = io_lsu_busreq_m & _T_1970; // @[el2_lsu_bus_buffer.scala 431:22]
  wire  _T_1972 = _T_1909 | _T_1971; // @[el2_lsu_bus_buffer.scala 430:117]
  wire  _T_1978 = _T_1972 | _T_1914; // @[el2_lsu_bus_buffer.scala 431:42]
  wire  _T_1979 = ~_T_1978; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_1980 = _T_1907 & _T_1979; // @[el2_lsu_bus_buffer.scala 430:81]
  wire [1:0] _T_1981 = _T_1980 ? 2'h3 : WrPtr1_r; // @[Mux.scala 98:16]
  wire [1:0] _T_1982 = _T_1966 ? 2'h2 : _T_1981; // @[Mux.scala 98:16]
  wire [1:0] _T_1983 = _T_1952 ? 2'h1 : _T_1982; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 563:63]
  wire  _T_2770 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 476:104]
  wire  _T_2771 = buf_rspageQ_0[3] & _T_2770; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2767 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 476:104]
  wire  _T_2768 = buf_rspageQ_0[2] & _T_2767; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2764 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 476:104]
  wire  _T_2765 = buf_rspageQ_0[1] & _T_2764; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2761 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 476:104]
  wire  _T_2762 = buf_rspageQ_0[0] & _T_2761; // @[el2_lsu_bus_buffer.scala 476:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2771,_T_2768,_T_2765,_T_2762}; // @[Cat.scala 29:58]
  wire  _T_2057 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_2058 = ~_T_2057; // @[el2_lsu_bus_buffer.scala 443:44]
  wire  _T_2060 = _T_2058 & _T_2761; // @[el2_lsu_bus_buffer.scala 443:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 563:63]
  wire  _T_2786 = buf_rspageQ_1[3] & _T_2770; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2783 = buf_rspageQ_1[2] & _T_2767; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2780 = buf_rspageQ_1[1] & _T_2764; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2777 = buf_rspageQ_1[0] & _T_2761; // @[el2_lsu_bus_buffer.scala 476:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2786,_T_2783,_T_2780,_T_2777}; // @[Cat.scala 29:58]
  wire  _T_2061 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_2062 = ~_T_2061; // @[el2_lsu_bus_buffer.scala 443:44]
  wire  _T_2064 = _T_2062 & _T_2764; // @[el2_lsu_bus_buffer.scala 443:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 563:63]
  wire  _T_2801 = buf_rspageQ_2[3] & _T_2770; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2798 = buf_rspageQ_2[2] & _T_2767; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2795 = buf_rspageQ_2[1] & _T_2764; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2792 = buf_rspageQ_2[0] & _T_2761; // @[el2_lsu_bus_buffer.scala 476:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2801,_T_2798,_T_2795,_T_2792}; // @[Cat.scala 29:58]
  wire  _T_2065 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_2066 = ~_T_2065; // @[el2_lsu_bus_buffer.scala 443:44]
  wire  _T_2068 = _T_2066 & _T_2767; // @[el2_lsu_bus_buffer.scala 443:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 563:63]
  wire  _T_2816 = buf_rspageQ_3[3] & _T_2770; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2813 = buf_rspageQ_3[2] & _T_2767; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2810 = buf_rspageQ_3[1] & _T_2764; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_2807 = buf_rspageQ_3[0] & _T_2761; // @[el2_lsu_bus_buffer.scala 476:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2816,_T_2813,_T_2810,_T_2807}; // @[Cat.scala 29:58]
  wire  _T_2069 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_2070 = ~_T_2069; // @[el2_lsu_bus_buffer.scala 443:44]
  wire  _T_2072 = _T_2070 & _T_2770; // @[el2_lsu_bus_buffer.scala 443:70]
  wire [7:0] _T_2128 = {4'h0,_T_2072,_T_2068,_T_2064,_T_2060}; // @[Cat.scala 29:58]
  wire  _T_2131 = _T_2128[4] | _T_2128[5]; // @[el2_lsu_bus_buffer.scala 447:42]
  wire  _T_2133 = _T_2131 | _T_2128[6]; // @[el2_lsu_bus_buffer.scala 447:48]
  wire  _T_2135 = _T_2133 | _T_2128[7]; // @[el2_lsu_bus_buffer.scala 447:54]
  wire  _T_2138 = _T_2128[2] | _T_2128[3]; // @[el2_lsu_bus_buffer.scala 447:67]
  wire  _T_2140 = _T_2138 | _T_2128[6]; // @[el2_lsu_bus_buffer.scala 447:73]
  wire  _T_2142 = _T_2140 | _T_2128[7]; // @[el2_lsu_bus_buffer.scala 447:79]
  wire  _T_2145 = _T_2128[1] | _T_2128[3]; // @[el2_lsu_bus_buffer.scala 447:92]
  wire  _T_2147 = _T_2145 | _T_2128[5]; // @[el2_lsu_bus_buffer.scala 447:98]
  wire  _T_2149 = _T_2147 | _T_2128[7]; // @[el2_lsu_bus_buffer.scala 447:104]
  wire [2:0] _T_2151 = {_T_2135,_T_2142,_T_2149}; // @[Cat.scala 29:58]
  wire  _T_3556 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3557 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 506:97]
  wire  _T_3558 = _T_3556 & _T_3557; // @[el2_lsu_bus_buffer.scala 506:95]
  wire  _T_3559 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 506:117]
  wire  _T_3560 = _T_3558 & _T_3559; // @[el2_lsu_bus_buffer.scala 506:112]
  wire  _T_3561 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 506:144]
  wire  _T_3562 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 506:166]
  wire  _T_3563 = _T_3561 & _T_3562; // @[el2_lsu_bus_buffer.scala 506:161]
  wire  _T_3564 = _T_3560 | _T_3563; // @[el2_lsu_bus_buffer.scala 506:132]
  wire  _T_3565 = _T_853 & _T_3564; // @[el2_lsu_bus_buffer.scala 506:63]
  wire  _T_3566 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 506:206]
  wire  _T_3567 = ibuf_drain_vld & _T_3566; // @[el2_lsu_bus_buffer.scala 506:201]
  wire  _T_3568 = _T_3565 | _T_3567; // @[el2_lsu_bus_buffer.scala 506:183]
  wire  _T_3578 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 513:46]
  wire  _T_3613 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 624:38]
  wire  _T_3658 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 531:73]
  wire  _T_3659 = bus_rsp_write & _T_3658; // @[el2_lsu_bus_buffer.scala 531:52]
  wire  _T_3660 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 532:46]
  reg  _T_4331; // @[Reg.scala 27:20]
  reg  _T_4329; // @[Reg.scala 27:20]
  reg  _T_4327; // @[Reg.scala 27:20]
  reg  _T_4325; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4331,_T_4329,_T_4327,_T_4325}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_370 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_3662 = io_lsu_axi_rid == _GEN_370; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_3663 = buf_ldfwd[0] & _T_3662; // @[el2_lsu_bus_buffer.scala 533:27]
  wire  _T_3664 = _T_3660 | _T_3663; // @[el2_lsu_bus_buffer.scala 532:77]
  wire  _T_3665 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 534:26]
  wire  _T_3667 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 534:44]
  wire  _T_3668 = _T_3665 & _T_3667; // @[el2_lsu_bus_buffer.scala 534:42]
  wire  _T_3669 = _T_3668 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 534:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_371 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_3670 = io_lsu_axi_rid == _GEN_371; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_3671 = _T_3669 & _T_3670; // @[el2_lsu_bus_buffer.scala 534:74]
  wire  _T_3672 = _T_3664 | _T_3671; // @[el2_lsu_bus_buffer.scala 533:71]
  wire  _T_3673 = bus_rsp_read & _T_3672; // @[el2_lsu_bus_buffer.scala 532:25]
  wire  _T_3674 = _T_3659 | _T_3673; // @[el2_lsu_bus_buffer.scala 531:105]
  wire  _GEN_42 = _T_3613 & _T_3674; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3579 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3575 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3552 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3700 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3710 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 546:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [2:0] _GEN_373 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_3712 = io_lsu_axi_rid == _GEN_373; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_3713 = _T_3710[0] & _T_3712; // @[el2_lsu_bus_buffer.scala 546:38]
  wire  _T_3714 = _T_3670 | _T_3713; // @[el2_lsu_bus_buffer.scala 545:95]
  wire  _T_3715 = bus_rsp_read & _T_3714; // @[el2_lsu_bus_buffer.scala 545:45]
  wire  _GEN_36 = _T_3700 & _T_3715; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3613 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3579 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3575 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3552 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3592 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 519:49]
  wire  _T_3593 = _T_3592 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 519:70]
  wire  _T_3718 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2151[1:0]; // @[el2_lsu_bus_buffer.scala 456:10]
  wire  _T_3721 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 551:37]
  wire  _T_3722 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 551:98]
  wire  _T_3723 = buf_dual_0 & _T_3722; // @[el2_lsu_bus_buffer.scala 551:80]
  wire  _T_3724 = _T_3721 | _T_3723; // @[el2_lsu_bus_buffer.scala 551:65]
  wire  _T_3725 = _T_3724 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 551:112]
  wire  _T_3726 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3718 ? _T_3725 : _T_3726; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3700 ? _T_3593 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3613 ? _T_3593 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3579 ? _T_3593 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3575 ? _T_3578 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3552 ? _T_3568 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2153 = _T_1874 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 468:94]
  wire  _T_2159 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 470:23]
  wire  _T_2161 = _T_2159 & _T_3556; // @[el2_lsu_bus_buffer.scala 470:41]
  wire  _T_2163 = _T_2161 & _T_1877; // @[el2_lsu_bus_buffer.scala 470:71]
  wire  _T_2165 = _T_2163 & _T_1875; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2166 = _T_4498 | _T_2165; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2167 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 471:17]
  wire  _T_2168 = _T_2167 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 471:35]
  wire  _T_2170 = _T_2168 & _T_1878; // @[el2_lsu_bus_buffer.scala 471:52]
  wire  _T_2172 = _T_2170 & _T_1877; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2173 = _T_2166 | _T_2172; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2174 = _T_2153 & _T_2173; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2176 = _T_2174 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2190 = _T_2163 & _T_1886; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2191 = _T_4503 | _T_2190; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2197 = _T_2170 & _T_1888; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2198 = _T_2191 | _T_2197; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2199 = _T_2153 & _T_2198; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2201 = _T_2199 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2215 = _T_2163 & _T_1897; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2216 = _T_4508 | _T_2215; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2222 = _T_2170 & _T_1899; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2223 = _T_2216 | _T_2222; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2224 = _T_2153 & _T_2223; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2226 = _T_2224 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2240 = _T_2163 & _T_1908; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2241 = _T_4513 | _T_2240; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2247 = _T_2170 & _T_1910; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2248 = _T_2241 | _T_2247; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2249 = _T_2153 & _T_2248; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2251 = _T_2249 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire [2:0] _T_2253 = {_T_2251,_T_2226,_T_2201}; // @[Cat.scala 29:58]
  wire  _T_3752 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 506:117]
  wire  _T_3753 = _T_3558 & _T_3752; // @[el2_lsu_bus_buffer.scala 506:112]
  wire  _T_3755 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 506:166]
  wire  _T_3756 = _T_3561 & _T_3755; // @[el2_lsu_bus_buffer.scala 506:161]
  wire  _T_3757 = _T_3753 | _T_3756; // @[el2_lsu_bus_buffer.scala 506:132]
  wire  _T_3758 = _T_853 & _T_3757; // @[el2_lsu_bus_buffer.scala 506:63]
  wire  _T_3759 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 506:206]
  wire  _T_3760 = ibuf_drain_vld & _T_3759; // @[el2_lsu_bus_buffer.scala 506:201]
  wire  _T_3761 = _T_3758 | _T_3760; // @[el2_lsu_bus_buffer.scala 506:183]
  wire  _T_3806 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3851 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 531:73]
  wire  _T_3852 = bus_rsp_write & _T_3851; // @[el2_lsu_bus_buffer.scala 531:52]
  wire  _T_3853 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 532:46]
  wire [2:0] _GEN_374 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_3855 = io_lsu_axi_rid == _GEN_374; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_3856 = buf_ldfwd[1] & _T_3855; // @[el2_lsu_bus_buffer.scala 533:27]
  wire  _T_3857 = _T_3853 | _T_3856; // @[el2_lsu_bus_buffer.scala 532:77]
  wire  _T_3858 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 534:26]
  wire  _T_3860 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 534:44]
  wire  _T_3861 = _T_3858 & _T_3860; // @[el2_lsu_bus_buffer.scala 534:42]
  wire  _T_3862 = _T_3861 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 534:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_375 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_3863 = io_lsu_axi_rid == _GEN_375; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_3864 = _T_3862 & _T_3863; // @[el2_lsu_bus_buffer.scala 534:74]
  wire  _T_3865 = _T_3857 | _T_3864; // @[el2_lsu_bus_buffer.scala 533:71]
  wire  _T_3866 = bus_rsp_read & _T_3865; // @[el2_lsu_bus_buffer.scala 532:25]
  wire  _T_3867 = _T_3852 | _T_3866; // @[el2_lsu_bus_buffer.scala 531:105]
  wire  _GEN_118 = _T_3806 & _T_3867; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3772 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3768 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3745 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3893 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3903 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 546:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [2:0] _GEN_377 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_3905 = io_lsu_axi_rid == _GEN_377; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_3906 = _T_3903[0] & _T_3905; // @[el2_lsu_bus_buffer.scala 546:38]
  wire  _T_3907 = _T_3863 | _T_3906; // @[el2_lsu_bus_buffer.scala 545:95]
  wire  _T_3908 = bus_rsp_read & _T_3907; // @[el2_lsu_bus_buffer.scala 545:45]
  wire  _GEN_112 = _T_3893 & _T_3908; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3806 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3772 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3768 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3745 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3785 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 519:49]
  wire  _T_3786 = _T_3785 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 519:70]
  wire  _T_3911 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3914 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 551:37]
  wire  _T_3915 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 551:98]
  wire  _T_3916 = buf_dual_1 & _T_3915; // @[el2_lsu_bus_buffer.scala 551:80]
  wire  _T_3917 = _T_3914 | _T_3916; // @[el2_lsu_bus_buffer.scala 551:65]
  wire  _T_3918 = _T_3917 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 551:112]
  wire  _T_3919 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3911 ? _T_3918 : _T_3919; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3893 ? _T_3786 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3806 ? _T_3786 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3772 ? _T_3786 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3768 ? _T_3578 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3745 ? _T_3761 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2255 = _T_1885 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 468:94]
  wire  _T_2265 = _T_2161 & _T_1888; // @[el2_lsu_bus_buffer.scala 470:71]
  wire  _T_2267 = _T_2265 & _T_1875; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2268 = _T_4498 | _T_2267; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2272 = _T_2168 & _T_1889; // @[el2_lsu_bus_buffer.scala 471:52]
  wire  _T_2274 = _T_2272 & _T_1877; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2275 = _T_2268 | _T_2274; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2276 = _T_2255 & _T_2275; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2278 = _T_2276 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2292 = _T_2265 & _T_1886; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2293 = _T_4503 | _T_2292; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2299 = _T_2272 & _T_1888; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2300 = _T_2293 | _T_2299; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2301 = _T_2255 & _T_2300; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2303 = _T_2301 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2317 = _T_2265 & _T_1897; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2318 = _T_4508 | _T_2317; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2324 = _T_2272 & _T_1899; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2325 = _T_2318 | _T_2324; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2326 = _T_2255 & _T_2325; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2328 = _T_2326 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2342 = _T_2265 & _T_1908; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2343 = _T_4513 | _T_2342; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2349 = _T_2272 & _T_1910; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2350 = _T_2343 | _T_2349; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2351 = _T_2255 & _T_2350; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2353 = _T_2351 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire [2:0] _T_2355 = {_T_2353,_T_2328,_T_2303}; // @[Cat.scala 29:58]
  wire  _T_3945 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 506:117]
  wire  _T_3946 = _T_3558 & _T_3945; // @[el2_lsu_bus_buffer.scala 506:112]
  wire  _T_3948 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 506:166]
  wire  _T_3949 = _T_3561 & _T_3948; // @[el2_lsu_bus_buffer.scala 506:161]
  wire  _T_3950 = _T_3946 | _T_3949; // @[el2_lsu_bus_buffer.scala 506:132]
  wire  _T_3951 = _T_853 & _T_3950; // @[el2_lsu_bus_buffer.scala 506:63]
  wire  _T_3952 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 506:206]
  wire  _T_3953 = ibuf_drain_vld & _T_3952; // @[el2_lsu_bus_buffer.scala 506:201]
  wire  _T_3954 = _T_3951 | _T_3953; // @[el2_lsu_bus_buffer.scala 506:183]
  wire  _T_3999 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4044 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 531:73]
  wire  _T_4045 = bus_rsp_write & _T_4044; // @[el2_lsu_bus_buffer.scala 531:52]
  wire  _T_4046 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 532:46]
  wire [2:0] _GEN_378 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_4048 = io_lsu_axi_rid == _GEN_378; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_4049 = buf_ldfwd[2] & _T_4048; // @[el2_lsu_bus_buffer.scala 533:27]
  wire  _T_4050 = _T_4046 | _T_4049; // @[el2_lsu_bus_buffer.scala 532:77]
  wire  _T_4051 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 534:26]
  wire  _T_4053 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 534:44]
  wire  _T_4054 = _T_4051 & _T_4053; // @[el2_lsu_bus_buffer.scala 534:42]
  wire  _T_4055 = _T_4054 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 534:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_379 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_4056 = io_lsu_axi_rid == _GEN_379; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_4057 = _T_4055 & _T_4056; // @[el2_lsu_bus_buffer.scala 534:74]
  wire  _T_4058 = _T_4050 | _T_4057; // @[el2_lsu_bus_buffer.scala 533:71]
  wire  _T_4059 = bus_rsp_read & _T_4058; // @[el2_lsu_bus_buffer.scala 532:25]
  wire  _T_4060 = _T_4045 | _T_4059; // @[el2_lsu_bus_buffer.scala 531:105]
  wire  _GEN_194 = _T_3999 & _T_4060; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3965 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3961 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3938 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4086 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4096 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 546:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [2:0] _GEN_381 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_4098 = io_lsu_axi_rid == _GEN_381; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_4099 = _T_4096[0] & _T_4098; // @[el2_lsu_bus_buffer.scala 546:38]
  wire  _T_4100 = _T_4056 | _T_4099; // @[el2_lsu_bus_buffer.scala 545:95]
  wire  _T_4101 = bus_rsp_read & _T_4100; // @[el2_lsu_bus_buffer.scala 545:45]
  wire  _GEN_188 = _T_4086 & _T_4101; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3999 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3965 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3961 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3938 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3978 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 519:49]
  wire  _T_3979 = _T_3978 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 519:70]
  wire  _T_4104 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4107 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 551:37]
  wire  _T_4108 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 551:98]
  wire  _T_4109 = buf_dual_2 & _T_4108; // @[el2_lsu_bus_buffer.scala 551:80]
  wire  _T_4110 = _T_4107 | _T_4109; // @[el2_lsu_bus_buffer.scala 551:65]
  wire  _T_4111 = _T_4110 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 551:112]
  wire  _T_4112 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4104 ? _T_4111 : _T_4112; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4086 ? _T_3979 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3999 ? _T_3979 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3965 ? _T_3979 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3961 ? _T_3578 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3938 ? _T_3954 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2357 = _T_1896 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 468:94]
  wire  _T_2367 = _T_2161 & _T_1899; // @[el2_lsu_bus_buffer.scala 470:71]
  wire  _T_2369 = _T_2367 & _T_1875; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2370 = _T_4498 | _T_2369; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2374 = _T_2168 & _T_1900; // @[el2_lsu_bus_buffer.scala 471:52]
  wire  _T_2376 = _T_2374 & _T_1877; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2377 = _T_2370 | _T_2376; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2378 = _T_2357 & _T_2377; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2380 = _T_2378 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2394 = _T_2367 & _T_1886; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2395 = _T_4503 | _T_2394; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2401 = _T_2374 & _T_1888; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2402 = _T_2395 | _T_2401; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2403 = _T_2357 & _T_2402; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2405 = _T_2403 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2419 = _T_2367 & _T_1897; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2420 = _T_4508 | _T_2419; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2426 = _T_2374 & _T_1899; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2427 = _T_2420 | _T_2426; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2428 = _T_2357 & _T_2427; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2430 = _T_2428 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2444 = _T_2367 & _T_1908; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2445 = _T_4513 | _T_2444; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2451 = _T_2374 & _T_1910; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2452 = _T_2445 | _T_2451; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2453 = _T_2357 & _T_2452; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2455 = _T_2453 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire [2:0] _T_2457 = {_T_2455,_T_2430,_T_2405}; // @[Cat.scala 29:58]
  wire  _T_4138 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 506:117]
  wire  _T_4139 = _T_3558 & _T_4138; // @[el2_lsu_bus_buffer.scala 506:112]
  wire  _T_4141 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 506:166]
  wire  _T_4142 = _T_3561 & _T_4141; // @[el2_lsu_bus_buffer.scala 506:161]
  wire  _T_4143 = _T_4139 | _T_4142; // @[el2_lsu_bus_buffer.scala 506:132]
  wire  _T_4144 = _T_853 & _T_4143; // @[el2_lsu_bus_buffer.scala 506:63]
  wire  _T_4145 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 506:206]
  wire  _T_4146 = ibuf_drain_vld & _T_4145; // @[el2_lsu_bus_buffer.scala 506:201]
  wire  _T_4147 = _T_4144 | _T_4146; // @[el2_lsu_bus_buffer.scala 506:183]
  wire  _T_4192 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4237 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 531:73]
  wire  _T_4238 = bus_rsp_write & _T_4237; // @[el2_lsu_bus_buffer.scala 531:52]
  wire  _T_4239 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 532:46]
  wire [2:0] _GEN_382 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_4241 = io_lsu_axi_rid == _GEN_382; // @[el2_lsu_bus_buffer.scala 533:47]
  wire  _T_4242 = buf_ldfwd[3] & _T_4241; // @[el2_lsu_bus_buffer.scala 533:27]
  wire  _T_4243 = _T_4239 | _T_4242; // @[el2_lsu_bus_buffer.scala 532:77]
  wire  _T_4244 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 534:26]
  wire  _T_4246 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 534:44]
  wire  _T_4247 = _T_4244 & _T_4246; // @[el2_lsu_bus_buffer.scala 534:42]
  wire  _T_4248 = _T_4247 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 534:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_383 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_4249 = io_lsu_axi_rid == _GEN_383; // @[el2_lsu_bus_buffer.scala 534:94]
  wire  _T_4250 = _T_4248 & _T_4249; // @[el2_lsu_bus_buffer.scala 534:74]
  wire  _T_4251 = _T_4243 | _T_4250; // @[el2_lsu_bus_buffer.scala 533:71]
  wire  _T_4252 = bus_rsp_read & _T_4251; // @[el2_lsu_bus_buffer.scala 532:25]
  wire  _T_4253 = _T_4238 | _T_4252; // @[el2_lsu_bus_buffer.scala 531:105]
  wire  _GEN_270 = _T_4192 & _T_4253; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4158 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4154 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4131 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4279 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4289 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 546:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 546:58]
  wire [2:0] _GEN_385 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_4291 = io_lsu_axi_rid == _GEN_385; // @[el2_lsu_bus_buffer.scala 546:58]
  wire  _T_4292 = _T_4289[0] & _T_4291; // @[el2_lsu_bus_buffer.scala 546:38]
  wire  _T_4293 = _T_4249 | _T_4292; // @[el2_lsu_bus_buffer.scala 545:95]
  wire  _T_4294 = bus_rsp_read & _T_4293; // @[el2_lsu_bus_buffer.scala 545:45]
  wire  _GEN_264 = _T_4279 & _T_4294; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4192 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4158 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4154 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4131 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4171 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 519:49]
  wire  _T_4172 = _T_4171 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 519:70]
  wire  _T_4297 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4300 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 551:37]
  wire  _T_4301 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 551:98]
  wire  _T_4302 = buf_dual_3 & _T_4301; // @[el2_lsu_bus_buffer.scala 551:80]
  wire  _T_4303 = _T_4300 | _T_4302; // @[el2_lsu_bus_buffer.scala 551:65]
  wire  _T_4304 = _T_4303 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 551:112]
  wire  _T_4305 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4297 ? _T_4304 : _T_4305; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4279 ? _T_4172 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4192 ? _T_4172 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4158 ? _T_4172 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4154 ? _T_3578 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4131 ? _T_4147 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2459 = _T_1907 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 468:94]
  wire  _T_2469 = _T_2161 & _T_1910; // @[el2_lsu_bus_buffer.scala 470:71]
  wire  _T_2471 = _T_2469 & _T_1875; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2472 = _T_4498 | _T_2471; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2476 = _T_2168 & _T_1911; // @[el2_lsu_bus_buffer.scala 471:52]
  wire  _T_2478 = _T_2476 & _T_1877; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2479 = _T_2472 | _T_2478; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2480 = _T_2459 & _T_2479; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2482 = _T_2480 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2496 = _T_2469 & _T_1886; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2497 = _T_4503 | _T_2496; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2503 = _T_2476 & _T_1888; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2504 = _T_2497 | _T_2503; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2505 = _T_2459 & _T_2504; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2507 = _T_2505 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2521 = _T_2469 & _T_1897; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2522 = _T_4508 | _T_2521; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2528 = _T_2476 & _T_1899; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2529 = _T_2522 | _T_2528; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2530 = _T_2459 & _T_2529; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2532 = _T_2530 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire  _T_2546 = _T_2469 & _T_1908; // @[el2_lsu_bus_buffer.scala 470:92]
  wire  _T_2547 = _T_4513 | _T_2546; // @[el2_lsu_bus_buffer.scala 469:86]
  wire  _T_2553 = _T_2476 & _T_1910; // @[el2_lsu_bus_buffer.scala 471:73]
  wire  _T_2554 = _T_2547 | _T_2553; // @[el2_lsu_bus_buffer.scala 470:114]
  wire  _T_2555 = _T_2459 & _T_2554; // @[el2_lsu_bus_buffer.scala 468:113]
  wire  _T_2557 = _T_2555 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 471:97]
  wire [2:0] _T_2559 = {_T_2557,_T_2532,_T_2507}; // @[Cat.scala 29:58]
  wire  _T_2823 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_2824 = _T_1874 | _T_2823; // @[el2_lsu_bus_buffer.scala 479:34]
  wire  _T_2825 = ~_T_2824; // @[el2_lsu_bus_buffer.scala 479:8]
  wire  _T_2833 = _T_2825 | _T_2165; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2840 = _T_2833 | _T_2172; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2841 = _T_2153 & _T_2840; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_2845 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_2846 = _T_1885 | _T_2845; // @[el2_lsu_bus_buffer.scala 479:34]
  wire  _T_2847 = ~_T_2846; // @[el2_lsu_bus_buffer.scala 479:8]
  wire  _T_2855 = _T_2847 | _T_2190; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2862 = _T_2855 | _T_2197; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2863 = _T_2153 & _T_2862; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_2867 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_2868 = _T_1896 | _T_2867; // @[el2_lsu_bus_buffer.scala 479:34]
  wire  _T_2869 = ~_T_2868; // @[el2_lsu_bus_buffer.scala 479:8]
  wire  _T_2877 = _T_2869 | _T_2215; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2884 = _T_2877 | _T_2222; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2885 = _T_2153 & _T_2884; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_2889 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_2890 = _T_1907 | _T_2889; // @[el2_lsu_bus_buffer.scala 479:34]
  wire  _T_2891 = ~_T_2890; // @[el2_lsu_bus_buffer.scala 479:8]
  wire  _T_2899 = _T_2891 | _T_2240; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2906 = _T_2899 | _T_2247; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2907 = _T_2153 & _T_2906; // @[el2_lsu_bus_buffer.scala 478:114]
  wire [3:0] buf_rspage_set_0 = {_T_2907,_T_2885,_T_2863,_T_2841}; // @[Cat.scala 29:58]
  wire  _T_2924 = _T_2825 | _T_2267; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2931 = _T_2924 | _T_2274; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2932 = _T_2255 & _T_2931; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_2946 = _T_2847 | _T_2292; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2953 = _T_2946 | _T_2299; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2954 = _T_2255 & _T_2953; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_2968 = _T_2869 | _T_2317; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2975 = _T_2968 | _T_2324; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2976 = _T_2255 & _T_2975; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_2990 = _T_2891 | _T_2342; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_2997 = _T_2990 | _T_2349; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_2998 = _T_2255 & _T_2997; // @[el2_lsu_bus_buffer.scala 478:114]
  wire [3:0] buf_rspage_set_1 = {_T_2998,_T_2976,_T_2954,_T_2932}; // @[Cat.scala 29:58]
  wire  _T_3015 = _T_2825 | _T_2369; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3022 = _T_3015 | _T_2376; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3023 = _T_2357 & _T_3022; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_3037 = _T_2847 | _T_2394; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3044 = _T_3037 | _T_2401; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3045 = _T_2357 & _T_3044; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_3059 = _T_2869 | _T_2419; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3066 = _T_3059 | _T_2426; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3067 = _T_2357 & _T_3066; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_3081 = _T_2891 | _T_2444; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3088 = _T_3081 | _T_2451; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3089 = _T_2357 & _T_3088; // @[el2_lsu_bus_buffer.scala 478:114]
  wire [3:0] buf_rspage_set_2 = {_T_3089,_T_3067,_T_3045,_T_3023}; // @[Cat.scala 29:58]
  wire  _T_3106 = _T_2825 | _T_2471; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3113 = _T_3106 | _T_2478; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3114 = _T_2459 & _T_3113; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_3128 = _T_2847 | _T_2496; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3135 = _T_3128 | _T_2503; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3136 = _T_2459 & _T_3135; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_3150 = _T_2869 | _T_2521; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3157 = _T_3150 | _T_2528; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3158 = _T_2459 & _T_3157; // @[el2_lsu_bus_buffer.scala 478:114]
  wire  _T_3172 = _T_2891 | _T_2546; // @[el2_lsu_bus_buffer.scala 479:61]
  wire  _T_3179 = _T_3172 | _T_2553; // @[el2_lsu_bus_buffer.scala 480:112]
  wire  _T_3180 = _T_2459 & _T_3179; // @[el2_lsu_bus_buffer.scala 478:114]
  wire [3:0] buf_rspage_set_3 = {_T_3180,_T_3158,_T_3136,_T_3114}; // @[Cat.scala 29:58]
  wire  _T_3265 = _T_2889 | _T_1907; // @[el2_lsu_bus_buffer.scala 483:112]
  wire  _T_3266 = ~_T_3265; // @[el2_lsu_bus_buffer.scala 483:86]
  wire  _T_3267 = buf_rspageQ_0[3] & _T_3266; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3259 = _T_2867 | _T_1896; // @[el2_lsu_bus_buffer.scala 483:112]
  wire  _T_3260 = ~_T_3259; // @[el2_lsu_bus_buffer.scala 483:86]
  wire  _T_3261 = buf_rspageQ_0[2] & _T_3260; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3253 = _T_2845 | _T_1885; // @[el2_lsu_bus_buffer.scala 483:112]
  wire  _T_3254 = ~_T_3253; // @[el2_lsu_bus_buffer.scala 483:86]
  wire  _T_3255 = buf_rspageQ_0[1] & _T_3254; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3247 = _T_2823 | _T_1874; // @[el2_lsu_bus_buffer.scala 483:112]
  wire  _T_3248 = ~_T_3247; // @[el2_lsu_bus_buffer.scala 483:86]
  wire  _T_3249 = buf_rspageQ_0[0] & _T_3248; // @[el2_lsu_bus_buffer.scala 483:84]
  wire [3:0] buf_rspage_0 = {_T_3267,_T_3261,_T_3255,_T_3249}; // @[Cat.scala 29:58]
  wire  _T_3186 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3189 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3192 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3195 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire [2:0] _T_3197 = {_T_3195,_T_3192,_T_3189}; // @[Cat.scala 29:58]
  wire  _T_3294 = buf_rspageQ_1[3] & _T_3266; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3288 = buf_rspageQ_1[2] & _T_3260; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3282 = buf_rspageQ_1[1] & _T_3254; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3276 = buf_rspageQ_1[0] & _T_3248; // @[el2_lsu_bus_buffer.scala 483:84]
  wire [3:0] buf_rspage_1 = {_T_3294,_T_3288,_T_3282,_T_3276}; // @[Cat.scala 29:58]
  wire  _T_3201 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3204 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3207 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3210 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire [2:0] _T_3212 = {_T_3210,_T_3207,_T_3204}; // @[Cat.scala 29:58]
  wire  _T_3321 = buf_rspageQ_2[3] & _T_3266; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3315 = buf_rspageQ_2[2] & _T_3260; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3309 = buf_rspageQ_2[1] & _T_3254; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3303 = buf_rspageQ_2[0] & _T_3248; // @[el2_lsu_bus_buffer.scala 483:84]
  wire [3:0] buf_rspage_2 = {_T_3321,_T_3315,_T_3309,_T_3303}; // @[Cat.scala 29:58]
  wire  _T_3216 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3219 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3222 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3225 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire [2:0] _T_3227 = {_T_3225,_T_3222,_T_3219}; // @[Cat.scala 29:58]
  wire  _T_3348 = buf_rspageQ_3[3] & _T_3266; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3342 = buf_rspageQ_3[2] & _T_3260; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3336 = buf_rspageQ_3[1] & _T_3254; // @[el2_lsu_bus_buffer.scala 483:84]
  wire  _T_3330 = buf_rspageQ_3[0] & _T_3248; // @[el2_lsu_bus_buffer.scala 483:84]
  wire [3:0] buf_rspage_3 = {_T_3348,_T_3342,_T_3336,_T_3330}; // @[Cat.scala 29:58]
  wire  _T_3231 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3234 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3237 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire  _T_3240 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 482:90]
  wire [2:0] _T_3242 = {_T_3240,_T_3237,_T_3234}; // @[Cat.scala 29:58]
  wire  _T_3353 = ibuf_drain_vld & _T_1875; // @[el2_lsu_bus_buffer.scala 488:65]
  wire  _T_3355 = ibuf_drain_vld & _T_1886; // @[el2_lsu_bus_buffer.scala 488:65]
  wire  _T_3357 = ibuf_drain_vld & _T_1897; // @[el2_lsu_bus_buffer.scala 488:65]
  wire  _T_3359 = ibuf_drain_vld & _T_1908; // @[el2_lsu_bus_buffer.scala 488:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3359,_T_3357,_T_3355,_T_3353}; // @[Cat.scala 29:58]
  wire  _T_3367 = _T_3561 & _T_1878; // @[el2_lsu_bus_buffer.scala 490:37]
  wire  _T_3376 = _T_3561 & _T_1889; // @[el2_lsu_bus_buffer.scala 490:37]
  wire  _T_3385 = _T_3561 & _T_1900; // @[el2_lsu_bus_buffer.scala 490:37]
  wire  _T_3394 = _T_3561 & _T_1911; // @[el2_lsu_bus_buffer.scala 490:37]
  wire  _T_3424 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 492:47]
  wire  _T_3426 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 492:47]
  wire  _T_3428 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 492:47]
  wire  _T_3430 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 492:47]
  wire [3:0] buf_dual_in = {_T_3430,_T_3428,_T_3426,_T_3424}; // @[Cat.scala 29:58]
  wire  _T_3435 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3437 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3439 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3441 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 493:49]
  wire [3:0] buf_samedw_in = {_T_3441,_T_3439,_T_3437,_T_3435}; // @[Cat.scala 29:58]
  wire  _T_3446 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 494:86]
  wire  _T_3447 = ibuf_drainvec_vld[0] ? _T_3446 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 494:50]
  wire  _T_3450 = ibuf_drainvec_vld[1] ? _T_3446 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 494:50]
  wire  _T_3453 = ibuf_drainvec_vld[2] ? _T_3446 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 494:50]
  wire  _T_3456 = ibuf_drainvec_vld[3] ? _T_3446 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 494:50]
  wire [3:0] buf_nomerge_in = {_T_3456,_T_3453,_T_3450,_T_3447}; // @[Cat.scala 29:58]
  wire  _T_3464 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3367; // @[el2_lsu_bus_buffer.scala 495:49]
  wire  _T_3469 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3376; // @[el2_lsu_bus_buffer.scala 495:49]
  wire  _T_3474 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3385; // @[el2_lsu_bus_buffer.scala 495:49]
  wire  _T_3479 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3394; // @[el2_lsu_bus_buffer.scala 495:49]
  wire [3:0] buf_dualhi_in = {_T_3479,_T_3474,_T_3469,_T_3464}; // @[Cat.scala 29:58]
  wire  _T_3508 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 497:53]
  wire  _T_3510 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 497:53]
  wire  _T_3512 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 497:53]
  wire  _T_3514 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 497:53]
  wire [3:0] buf_sideeffect_in = {_T_3514,_T_3512,_T_3510,_T_3508}; // @[Cat.scala 29:58]
  wire  _T_3519 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 498:49]
  wire  _T_3521 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 498:49]
  wire  _T_3523 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 498:49]
  wire  _T_3525 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 498:49]
  wire [3:0] buf_unsign_in = {_T_3525,_T_3523,_T_3521,_T_3519}; // @[Cat.scala 29:58]
  wire  _T_3542 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 500:48]
  wire  _T_3544 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 500:48]
  wire  _T_3546 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 500:48]
  wire  _T_3548 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 500:48]
  wire [3:0] buf_write_in = {_T_3548,_T_3546,_T_3544,_T_3542}; // @[Cat.scala 29:58]
  wire  _T_3581 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 516:89]
  wire  _T_3583 = _T_3581 & _T_1372; // @[el2_lsu_bus_buffer.scala 516:104]
  wire  _T_3596 = buf_state_en_0 & _T_3667; // @[el2_lsu_bus_buffer.scala 521:44]
  wire  _T_3597 = _T_3596 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:60]
  wire  _T_3599 = _T_3597 & _T_1354; // @[el2_lsu_bus_buffer.scala 521:74]
  wire  _T_3602 = _T_3592 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 523:67]
  wire  _T_3603 = _T_3602 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 523:81]
  wire  _T_4896 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 628:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4896; // @[el2_lsu_bus_buffer.scala 628:38]
  wire  _T_3606 = _T_3602 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 524:82]
  wire  _T_3681 = bus_rsp_read_error & _T_3660; // @[el2_lsu_bus_buffer.scala 538:91]
  wire  _T_3683 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 539:31]
  wire  _T_3685 = _T_3683 & _T_3662; // @[el2_lsu_bus_buffer.scala 539:46]
  wire  _T_3686 = _T_3681 | _T_3685; // @[el2_lsu_bus_buffer.scala 538:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4896; // @[el2_lsu_bus_buffer.scala 627:40]
  wire  _T_3689 = bus_rsp_write_error & _T_3658; // @[el2_lsu_bus_buffer.scala 540:53]
  wire  _T_3690 = _T_3686 | _T_3689; // @[el2_lsu_bus_buffer.scala 539:88]
  wire  _T_3691 = _T_3592 & _T_3690; // @[el2_lsu_bus_buffer.scala 538:68]
  wire  _GEN_46 = _T_3613 & _T_3691; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3579 ? _T_3606 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3575 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3552 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3616 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 528:73]
  wire  _T_3617 = buf_write[0] & _T_3616; // @[el2_lsu_bus_buffer.scala 528:71]
  wire  _T_3618 = io_dec_tlu_force_halt | _T_3617; // @[el2_lsu_bus_buffer.scala 528:55]
  wire  _T_3620 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 529:30]
  wire  _T_3621 = buf_dual_0 & _T_3620; // @[el2_lsu_bus_buffer.scala 529:28]
  wire  _T_3624 = _T_3621 & _T_3667; // @[el2_lsu_bus_buffer.scala 529:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_3625 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_3626 = _T_3624 & _T_3625; // @[el2_lsu_bus_buffer.scala 529:61]
  wire  _T_4521 = _T_2770 | _T_2767; // @[el2_lsu_bus_buffer.scala 587:93]
  wire  _T_4522 = _T_4521 | _T_2764; // @[el2_lsu_bus_buffer.scala 587:93]
  wire  any_done_wait_state = _T_4522 | _T_2761; // @[el2_lsu_bus_buffer.scala 587:93]
  wire  _T_3628 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:31]
  wire  _T_3634 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3636 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3638 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3640 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3642 = _T_3634 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3643 = _T_3636 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3644 = _T_3638 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3645 = _T_3640 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3646 = _T_3642 | _T_3643; // @[Mux.scala 27:72]
  wire  _T_3647 = _T_3646 | _T_3644; // @[Mux.scala 27:72]
  wire  _T_3648 = _T_3647 | _T_3645; // @[Mux.scala 27:72]
  wire  _T_3650 = _T_3624 & _T_3648; // @[el2_lsu_bus_buffer.scala 530:101]
  wire  _T_3651 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 530:167]
  wire  _T_3652 = _T_3650 & _T_3651; // @[el2_lsu_bus_buffer.scala 530:138]
  wire  _T_3653 = _T_3652 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:187]
  wire  _T_3654 = _T_3628 | _T_3653; // @[el2_lsu_bus_buffer.scala 530:53]
  wire  _T_3677 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 537:47]
  wire  _T_3678 = _T_3677 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 537:62]
  wire  _T_3692 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 541:50]
  wire  _T_3693 = buf_state_en_0 & _T_3692; // @[el2_lsu_bus_buffer.scala 541:48]
  wire  _T_3705 = buf_ldfwd[0] | _T_3710[0]; // @[el2_lsu_bus_buffer.scala 544:90]
  wire  _T_3706 = _T_3705 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 544:118]
  wire  _GEN_29 = _T_3726 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3718 ? 1'h0 : _T_3726; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3718 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3700 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3700 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3613 & _T_3678; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3613 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3613 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3579 ? _T_3599 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3579 ? _T_3603 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3579 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3575 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3575 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3575 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3552 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3552 ? buf_state_en_0 : _GEN_70; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3552 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3552 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3789 = buf_state_en_1 & _T_3860; // @[el2_lsu_bus_buffer.scala 521:44]
  wire  _T_3790 = _T_3789 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:60]
  wire  _T_3792 = _T_3790 & _T_1354; // @[el2_lsu_bus_buffer.scala 521:74]
  wire  _T_3795 = _T_3785 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 523:67]
  wire  _T_3796 = _T_3795 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 523:81]
  wire  _T_3799 = _T_3795 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 524:82]
  wire  _T_3874 = bus_rsp_read_error & _T_3853; // @[el2_lsu_bus_buffer.scala 538:91]
  wire  _T_3876 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 539:31]
  wire  _T_3878 = _T_3876 & _T_3855; // @[el2_lsu_bus_buffer.scala 539:46]
  wire  _T_3879 = _T_3874 | _T_3878; // @[el2_lsu_bus_buffer.scala 538:143]
  wire  _T_3882 = bus_rsp_write_error & _T_3851; // @[el2_lsu_bus_buffer.scala 540:53]
  wire  _T_3883 = _T_3879 | _T_3882; // @[el2_lsu_bus_buffer.scala 539:88]
  wire  _T_3884 = _T_3785 & _T_3883; // @[el2_lsu_bus_buffer.scala 538:68]
  wire  _GEN_122 = _T_3806 & _T_3884; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3772 ? _T_3799 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3768 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3745 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3810 = buf_write[1] & _T_3616; // @[el2_lsu_bus_buffer.scala 528:71]
  wire  _T_3811 = io_dec_tlu_force_halt | _T_3810; // @[el2_lsu_bus_buffer.scala 528:55]
  wire  _T_3813 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 529:30]
  wire  _T_3814 = buf_dual_1 & _T_3813; // @[el2_lsu_bus_buffer.scala 529:28]
  wire  _T_3817 = _T_3814 & _T_3860; // @[el2_lsu_bus_buffer.scala 529:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_3818 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_3819 = _T_3817 & _T_3818; // @[el2_lsu_bus_buffer.scala 529:61]
  wire  _T_3821 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:31]
  wire  _T_3827 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3829 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3831 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3833 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3835 = _T_3827 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3836 = _T_3829 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3837 = _T_3831 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3838 = _T_3833 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3839 = _T_3835 | _T_3836; // @[Mux.scala 27:72]
  wire  _T_3840 = _T_3839 | _T_3837; // @[Mux.scala 27:72]
  wire  _T_3841 = _T_3840 | _T_3838; // @[Mux.scala 27:72]
  wire  _T_3843 = _T_3817 & _T_3841; // @[el2_lsu_bus_buffer.scala 530:101]
  wire  _T_3844 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 530:167]
  wire  _T_3845 = _T_3843 & _T_3844; // @[el2_lsu_bus_buffer.scala 530:138]
  wire  _T_3846 = _T_3845 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:187]
  wire  _T_3847 = _T_3821 | _T_3846; // @[el2_lsu_bus_buffer.scala 530:53]
  wire  _T_3870 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 537:47]
  wire  _T_3871 = _T_3870 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 537:62]
  wire  _T_3885 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 541:50]
  wire  _T_3886 = buf_state_en_1 & _T_3885; // @[el2_lsu_bus_buffer.scala 541:48]
  wire  _T_3898 = buf_ldfwd[1] | _T_3903[0]; // @[el2_lsu_bus_buffer.scala 544:90]
  wire  _T_3899 = _T_3898 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 544:118]
  wire  _GEN_105 = _T_3919 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3911 ? 1'h0 : _T_3919; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3911 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3893 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3893 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3806 & _T_3871; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3806 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3806 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3772 ? _T_3792 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3772 ? _T_3796 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3772 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3768 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3768 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3768 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3745 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3745 ? buf_state_en_1 : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3745 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3745 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3982 = buf_state_en_2 & _T_4053; // @[el2_lsu_bus_buffer.scala 521:44]
  wire  _T_3983 = _T_3982 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:60]
  wire  _T_3985 = _T_3983 & _T_1354; // @[el2_lsu_bus_buffer.scala 521:74]
  wire  _T_3988 = _T_3978 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 523:67]
  wire  _T_3989 = _T_3988 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 523:81]
  wire  _T_3992 = _T_3988 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 524:82]
  wire  _T_4067 = bus_rsp_read_error & _T_4046; // @[el2_lsu_bus_buffer.scala 538:91]
  wire  _T_4069 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 539:31]
  wire  _T_4071 = _T_4069 & _T_4048; // @[el2_lsu_bus_buffer.scala 539:46]
  wire  _T_4072 = _T_4067 | _T_4071; // @[el2_lsu_bus_buffer.scala 538:143]
  wire  _T_4075 = bus_rsp_write_error & _T_4044; // @[el2_lsu_bus_buffer.scala 540:53]
  wire  _T_4076 = _T_4072 | _T_4075; // @[el2_lsu_bus_buffer.scala 539:88]
  wire  _T_4077 = _T_3978 & _T_4076; // @[el2_lsu_bus_buffer.scala 538:68]
  wire  _GEN_198 = _T_3999 & _T_4077; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3965 ? _T_3992 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3961 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3938 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_4003 = buf_write[2] & _T_3616; // @[el2_lsu_bus_buffer.scala 528:71]
  wire  _T_4004 = io_dec_tlu_force_halt | _T_4003; // @[el2_lsu_bus_buffer.scala 528:55]
  wire  _T_4006 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 529:30]
  wire  _T_4007 = buf_dual_2 & _T_4006; // @[el2_lsu_bus_buffer.scala 529:28]
  wire  _T_4010 = _T_4007 & _T_4053; // @[el2_lsu_bus_buffer.scala 529:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_4011 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_4012 = _T_4010 & _T_4011; // @[el2_lsu_bus_buffer.scala 529:61]
  wire  _T_4014 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:31]
  wire  _T_4020 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4022 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4024 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4026 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4028 = _T_4020 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4029 = _T_4022 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4030 = _T_4024 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4031 = _T_4026 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4032 = _T_4028 | _T_4029; // @[Mux.scala 27:72]
  wire  _T_4033 = _T_4032 | _T_4030; // @[Mux.scala 27:72]
  wire  _T_4034 = _T_4033 | _T_4031; // @[Mux.scala 27:72]
  wire  _T_4036 = _T_4010 & _T_4034; // @[el2_lsu_bus_buffer.scala 530:101]
  wire  _T_4037 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 530:167]
  wire  _T_4038 = _T_4036 & _T_4037; // @[el2_lsu_bus_buffer.scala 530:138]
  wire  _T_4039 = _T_4038 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:187]
  wire  _T_4040 = _T_4014 | _T_4039; // @[el2_lsu_bus_buffer.scala 530:53]
  wire  _T_4063 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 537:47]
  wire  _T_4064 = _T_4063 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 537:62]
  wire  _T_4078 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 541:50]
  wire  _T_4079 = buf_state_en_2 & _T_4078; // @[el2_lsu_bus_buffer.scala 541:48]
  wire  _T_4091 = buf_ldfwd[2] | _T_4096[0]; // @[el2_lsu_bus_buffer.scala 544:90]
  wire  _T_4092 = _T_4091 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 544:118]
  wire  _GEN_181 = _T_4112 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4104 ? 1'h0 : _T_4112; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4104 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4086 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4086 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3999 & _T_4064; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3999 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3999 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3965 ? _T_3985 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3965 ? _T_3989 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3965 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3961 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3961 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3961 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3938 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3938 ? buf_state_en_2 : _GEN_222; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3938 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3938 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4175 = buf_state_en_3 & _T_4246; // @[el2_lsu_bus_buffer.scala 521:44]
  wire  _T_4176 = _T_4175 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:60]
  wire  _T_4178 = _T_4176 & _T_1354; // @[el2_lsu_bus_buffer.scala 521:74]
  wire  _T_4181 = _T_4171 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 523:67]
  wire  _T_4182 = _T_4181 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 523:81]
  wire  _T_4185 = _T_4181 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 524:82]
  wire  _T_4260 = bus_rsp_read_error & _T_4239; // @[el2_lsu_bus_buffer.scala 538:91]
  wire  _T_4262 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 539:31]
  wire  _T_4264 = _T_4262 & _T_4241; // @[el2_lsu_bus_buffer.scala 539:46]
  wire  _T_4265 = _T_4260 | _T_4264; // @[el2_lsu_bus_buffer.scala 538:143]
  wire  _T_4268 = bus_rsp_write_error & _T_4237; // @[el2_lsu_bus_buffer.scala 540:53]
  wire  _T_4269 = _T_4265 | _T_4268; // @[el2_lsu_bus_buffer.scala 539:88]
  wire  _T_4270 = _T_4171 & _T_4269; // @[el2_lsu_bus_buffer.scala 538:68]
  wire  _GEN_274 = _T_4192 & _T_4270; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4158 ? _T_4185 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4154 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4131 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4196 = buf_write[3] & _T_3616; // @[el2_lsu_bus_buffer.scala 528:71]
  wire  _T_4197 = io_dec_tlu_force_halt | _T_4196; // @[el2_lsu_bus_buffer.scala 528:55]
  wire  _T_4199 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 529:30]
  wire  _T_4200 = buf_dual_3 & _T_4199; // @[el2_lsu_bus_buffer.scala 529:28]
  wire  _T_4203 = _T_4200 & _T_4246; // @[el2_lsu_bus_buffer.scala 529:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 529:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_4204 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 529:90]
  wire  _T_4205 = _T_4203 & _T_4204; // @[el2_lsu_bus_buffer.scala 529:61]
  wire  _T_4207 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:31]
  wire  _T_4213 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4215 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4217 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4219 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4221 = _T_4213 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4222 = _T_4215 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4223 = _T_4217 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4224 = _T_4219 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4225 = _T_4221 | _T_4222; // @[Mux.scala 27:72]
  wire  _T_4226 = _T_4225 | _T_4223; // @[Mux.scala 27:72]
  wire  _T_4227 = _T_4226 | _T_4224; // @[Mux.scala 27:72]
  wire  _T_4229 = _T_4203 & _T_4227; // @[el2_lsu_bus_buffer.scala 530:101]
  wire  _T_4230 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 530:167]
  wire  _T_4231 = _T_4229 & _T_4230; // @[el2_lsu_bus_buffer.scala 530:138]
  wire  _T_4232 = _T_4231 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 530:187]
  wire  _T_4233 = _T_4207 | _T_4232; // @[el2_lsu_bus_buffer.scala 530:53]
  wire  _T_4256 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 537:47]
  wire  _T_4257 = _T_4256 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 537:62]
  wire  _T_4271 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 541:50]
  wire  _T_4272 = buf_state_en_3 & _T_4271; // @[el2_lsu_bus_buffer.scala 541:48]
  wire  _T_4284 = buf_ldfwd[3] | _T_4289[0]; // @[el2_lsu_bus_buffer.scala 544:90]
  wire  _T_4285 = _T_4284 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 544:118]
  wire  _GEN_257 = _T_4305 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4297 ? 1'h0 : _T_4305; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4297 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4279 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4279 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4192 & _T_4257; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4192 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4192 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4158 ? _T_4178 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4158 ? _T_4182 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4158 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4154 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4154 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4154 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4131 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_4131 ? buf_state_en_3 : _GEN_298; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4131 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4131 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4360; // @[Reg.scala 27:20]
  reg  _T_4363; // @[Reg.scala 27:20]
  reg  _T_4366; // @[Reg.scala 27:20]
  reg  _T_4369; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4369,_T_4366,_T_4363,_T_4360}; // @[Cat.scala 29:58]
  reg  _T_4435; // @[el2_lsu_bus_buffer.scala 580:82]
  reg  _T_4430; // @[el2_lsu_bus_buffer.scala 580:82]
  reg  _T_4425; // @[el2_lsu_bus_buffer.scala 580:82]
  reg  _T_4420; // @[el2_lsu_bus_buffer.scala 580:82]
  wire [3:0] buf_error = {_T_4435,_T_4430,_T_4425,_T_4420}; // @[Cat.scala 29:58]
  wire  _T_4417 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 580:86]
  wire  _T_4418 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 580:128]
  wire  _T_4422 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 580:86]
  wire  _T_4423 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 580:128]
  wire  _T_4427 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 580:86]
  wire  _T_4428 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 580:128]
  wire  _T_4432 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 580:86]
  wire  _T_4433 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 580:128]
  wire [2:0] _T_4440 = {buf_data_en_3,buf_data_en_2,buf_data_en_1}; // @[Cat.scala 29:58]
  wire [1:0] _T_4442 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4443 = io_ldst_dual_m ? _T_4442 : {{1'd0}, io_lsu_busreq_m}; // @[el2_lsu_bus_buffer.scala 583:28]
  wire [1:0] _T_4444 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4445 = io_ldst_dual_r ? _T_4444 : {{1'd0}, io_lsu_busreq_r}; // @[el2_lsu_bus_buffer.scala 583:94]
  wire [2:0] _T_4446 = _T_4443 + _T_4445; // @[el2_lsu_bus_buffer.scala 583:88]
  wire [2:0] _GEN_390 = {{2'd0}, ibuf_valid}; // @[el2_lsu_bus_buffer.scala 583:154]
  wire [3:0] _T_4447 = _T_4446 + _GEN_390; // @[el2_lsu_bus_buffer.scala 583:154]
  wire [1:0] _T_4452 = _T_5 + _T_12; // @[el2_lsu_bus_buffer.scala 583:217]
  wire [1:0] _GEN_391 = {{1'd0}, _T_19}; // @[el2_lsu_bus_buffer.scala 583:217]
  wire [2:0] _T_4453 = _T_4452 + _GEN_391; // @[el2_lsu_bus_buffer.scala 583:217]
  wire [2:0] _GEN_392 = {{2'd0}, _T_26}; // @[el2_lsu_bus_buffer.scala 583:217]
  wire [3:0] _T_4454 = _T_4453 + _GEN_392; // @[el2_lsu_bus_buffer.scala 583:217]
  wire [3:0] buf_numvld_any = _T_4447 + _T_4454; // @[el2_lsu_bus_buffer.scala 583:169]
  wire  _T_4525 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 589:52]
  wire  _T_4526 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 589:92]
  wire  _T_4527 = buf_numvld_any == 4'h4; // @[el2_lsu_bus_buffer.scala 589:121]
  wire  _T_4529 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 590:52]
  wire  _T_4530 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 590:52]
  wire  _T_4531 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 590:52]
  wire  _T_4532 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 590:52]
  wire  _T_4533 = _T_4529 | _T_4530; // @[el2_lsu_bus_buffer.scala 590:65]
  wire  _T_4534 = _T_4533 | _T_4531; // @[el2_lsu_bus_buffer.scala 590:65]
  wire  _T_4535 = _T_4534 | _T_4532; // @[el2_lsu_bus_buffer.scala 590:65]
  wire  _T_4536 = ~_T_4535; // @[el2_lsu_bus_buffer.scala 590:34]
  wire  _T_4538 = _T_4536 & _T_852; // @[el2_lsu_bus_buffer.scala 590:70]
  wire  _T_4541 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 592:51]
  wire  _T_4542 = _T_4541 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 592:72]
  wire  _T_4543 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 592:94]
  wire  _T_4544 = _T_4542 & _T_4543; // @[el2_lsu_bus_buffer.scala 592:92]
  wire  _T_4545 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 592:111]
  wire  _T_4547 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 595:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 681:66]
  wire  _T_4565 = _T_2823 & _T_3667; // @[Mux.scala 27:72]
  wire  _T_4566 = _T_2845 & _T_3860; // @[Mux.scala 27:72]
  wire  _T_4567 = _T_2867 & _T_4053; // @[Mux.scala 27:72]
  wire  _T_4568 = _T_2889 & _T_4246; // @[Mux.scala 27:72]
  wire  _T_4569 = _T_4565 | _T_4566; // @[Mux.scala 27:72]
  wire  _T_4570 = _T_4569 | _T_4567; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4570 | _T_4568; // @[Mux.scala 27:72]
  wire  _T_4576 = buf_error[0] & _T_3667; // @[el2_lsu_bus_buffer.scala 598:108]
  wire  _T_4581 = buf_error[1] & _T_3860; // @[el2_lsu_bus_buffer.scala 598:108]
  wire  _T_4586 = buf_error[2] & _T_4053; // @[el2_lsu_bus_buffer.scala 598:108]
  wire  _T_4591 = buf_error[3] & _T_4246; // @[el2_lsu_bus_buffer.scala 598:108]
  wire  _T_4592 = _T_2823 & _T_4576; // @[Mux.scala 27:72]
  wire  _T_4593 = _T_2845 & _T_4581; // @[Mux.scala 27:72]
  wire  _T_4594 = _T_2867 & _T_4586; // @[Mux.scala 27:72]
  wire  _T_4595 = _T_2889 & _T_4591; // @[Mux.scala 27:72]
  wire  _T_4596 = _T_4592 | _T_4593; // @[Mux.scala 27:72]
  wire  _T_4597 = _T_4596 | _T_4594; // @[Mux.scala 27:72]
  wire  _T_4604 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 599:109]
  wire  _T_4605 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 599:124]
  wire  _T_4606 = _T_4604 | _T_4605; // @[el2_lsu_bus_buffer.scala 599:122]
  wire  _T_4607 = _T_4565 & _T_4606; // @[el2_lsu_bus_buffer.scala 599:106]
  wire  _T_4612 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 599:109]
  wire  _T_4613 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 599:124]
  wire  _T_4614 = _T_4612 | _T_4613; // @[el2_lsu_bus_buffer.scala 599:122]
  wire  _T_4615 = _T_4566 & _T_4614; // @[el2_lsu_bus_buffer.scala 599:106]
  wire  _T_4620 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 599:109]
  wire  _T_4621 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 599:124]
  wire  _T_4622 = _T_4620 | _T_4621; // @[el2_lsu_bus_buffer.scala 599:122]
  wire  _T_4623 = _T_4567 & _T_4622; // @[el2_lsu_bus_buffer.scala 599:106]
  wire  _T_4628 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 599:109]
  wire  _T_4629 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 599:124]
  wire  _T_4630 = _T_4628 | _T_4629; // @[el2_lsu_bus_buffer.scala 599:122]
  wire  _T_4631 = _T_4568 & _T_4630; // @[el2_lsu_bus_buffer.scala 599:106]
  wire [1:0] _T_4634 = _T_4623 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4635 = _T_4631 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_393 = {{1'd0}, _T_4615}; // @[Mux.scala 27:72]
  wire [1:0] _T_4637 = _GEN_393 | _T_4634; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4607 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4673 = _T_4615 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4674 = _T_4623 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4675 = _T_4631 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4676 = _T_4672 | _T_4673; // @[Mux.scala 27:72]
  wire [31:0] _T_4677 = _T_4676 | _T_4674; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4677 | _T_4675; // @[Mux.scala 27:72]
  wire  _T_4683 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 601:120]
  wire  _T_4684 = _T_4565 & _T_4683; // @[el2_lsu_bus_buffer.scala 601:105]
  wire  _T_4689 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 601:120]
  wire  _T_4690 = _T_4566 & _T_4689; // @[el2_lsu_bus_buffer.scala 601:105]
  wire  _T_4695 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 601:120]
  wire  _T_4696 = _T_4567 & _T_4695; // @[el2_lsu_bus_buffer.scala 601:105]
  wire  _T_4701 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 601:120]
  wire  _T_4702 = _T_4568 & _T_4701; // @[el2_lsu_bus_buffer.scala 601:105]
  wire [31:0] _T_4703 = _T_4684 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4704 = _T_4690 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4705 = _T_4696 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4706 = _T_4702 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4707 = _T_4703 | _T_4704; // @[Mux.scala 27:72]
  wire [31:0] _T_4708 = _T_4707 | _T_4705; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4708 | _T_4706; // @[Mux.scala 27:72]
  wire  _T_4710 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4711 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4712 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4713 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 120:123]
  wire [31:0] _T_4714 = _T_4710 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4715 = _T_4711 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4716 = _T_4712 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4717 = _T_4713 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4718 = _T_4714 | _T_4715; // @[Mux.scala 27:72]
  wire [31:0] _T_4719 = _T_4718 | _T_4716; // @[Mux.scala 27:72]
  wire [31:0] _T_4720 = _T_4719 | _T_4717; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4720[1:0]; // @[el2_lsu_bus_buffer.scala 602:83]
  wire [1:0] _T_4726 = _T_4710 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4727 = _T_4711 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4728 = _T_4712 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4729 = _T_4713 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4730 = _T_4726 | _T_4727; // @[Mux.scala 27:72]
  wire [1:0] _T_4731 = _T_4730 | _T_4728; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4731 | _T_4729; // @[Mux.scala 27:72]
  wire  _T_4741 = _T_4710 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4742 = _T_4711 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4743 = _T_4712 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4744 = _T_4713 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4745 = _T_4741 | _T_4742; // @[Mux.scala 27:72]
  wire  _T_4746 = _T_4745 | _T_4743; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4746 | _T_4744; // @[Mux.scala 27:72]
  wire [63:0] _T_4766 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_394 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 606:121]
  wire [5:0] _T_4767 = _GEN_394 * 4'h8; // @[el2_lsu_bus_buffer.scala 606:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4766 >> _T_4767; // @[el2_lsu_bus_buffer.scala 606:92]
  wire  _T_4768 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 609:69]
  wire  _T_4770 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 610:81]
  wire  _T_4771 = lsu_nonblock_unsign & _T_4770; // @[el2_lsu_bus_buffer.scala 610:63]
  wire [31:0] _T_4773 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4774 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 611:45]
  wire  _T_4775 = lsu_nonblock_unsign & _T_4774; // @[el2_lsu_bus_buffer.scala 611:26]
  wire [31:0] _T_4777 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4778 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 612:6]
  wire  _T_4780 = _T_4778 & _T_4770; // @[el2_lsu_bus_buffer.scala 612:27]
  wire [23:0] _T_4783 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4785 = {_T_4783,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4788 = _T_4778 & _T_4774; // @[el2_lsu_bus_buffer.scala 613:27]
  wire [15:0] _T_4791 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4793 = {_T_4791,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4794 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 614:21]
  wire [31:0] _T_4795 = _T_4771 ? _T_4773 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4796 = _T_4775 ? _T_4777 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4797 = _T_4780 ? _T_4785 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4798 = _T_4788 ? _T_4793 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4799 = _T_4794 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4800 = _T_4795 | _T_4796; // @[Mux.scala 27:72]
  wire [31:0] _T_4801 = _T_4800 | _T_4797; // @[Mux.scala 27:72]
  wire [31:0] _T_4802 = _T_4801 | _T_4798; // @[Mux.scala 27:72]
  wire [63:0] _GEN_395 = {{32'd0}, _T_4802}; // @[Mux.scala 27:72]
  wire [63:0] _T_4803 = _GEN_395 | _T_4799; // @[Mux.scala 27:72]
  wire  _T_4898 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 632:36]
  wire  _T_4899 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 632:51]
  wire  _T_4900 = _T_4898 & _T_4899; // @[el2_lsu_bus_buffer.scala 632:49]
  wire [31:0] _T_4904 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4906 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4911 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 644:50]
  wire  _T_4912 = _T_4898 & _T_4911; // @[el2_lsu_bus_buffer.scala 644:48]
  wire [7:0] _T_4916 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4919 = obuf_valid & _T_1364; // @[el2_lsu_bus_buffer.scala 649:36]
  wire  _T_4921 = _T_4919 & _T_1370; // @[el2_lsu_bus_buffer.scala 649:50]
  wire  _T_4933 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 662:114]
  wire  _T_4935 = _T_4933 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 662:129]
  wire  _T_4938 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 662:114]
  wire  _T_4940 = _T_4938 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 662:129]
  wire  _T_4943 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 662:114]
  wire  _T_4945 = _T_4943 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 662:129]
  wire  _T_4948 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 662:114]
  wire  _T_4950 = _T_4948 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 662:129]
  wire  _T_4951 = _T_2823 & _T_4935; // @[Mux.scala 27:72]
  wire  _T_4952 = _T_2845 & _T_4940; // @[Mux.scala 27:72]
  wire  _T_4953 = _T_2867 & _T_4945; // @[Mux.scala 27:72]
  wire  _T_4954 = _T_2889 & _T_4950; // @[Mux.scala 27:72]
  wire  _T_4955 = _T_4951 | _T_4952; // @[Mux.scala 27:72]
  wire  _T_4956 = _T_4955 | _T_4953; // @[Mux.scala 27:72]
  wire  _T_4966 = _T_2845 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 663:98]
  wire  lsu_imprecise_error_store_tag = _T_4966 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 663:113]
  wire  _T_4972 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 665:72]
  wire  _T_4974 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 120:123]
  wire [31:0] _T_4976 = _T_4974 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4977 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4978 = _T_4976 | _T_4977; // @[Mux.scala 27:72]
  wire  _T_4995 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 672:68]
  wire  _T_4998 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 673:48]
  wire  _T_5001 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 676:48]
  wire  _T_5002 = io_lsu_axi_awvalid & _T_5001; // @[el2_lsu_bus_buffer.scala 676:46]
  wire  _T_5003 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 676:92]
  wire  _T_5004 = io_lsu_axi_wvalid & _T_5003; // @[el2_lsu_bus_buffer.scala 676:90]
  wire  _T_5005 = _T_5002 | _T_5004; // @[el2_lsu_bus_buffer.scala 676:69]
  wire  _T_5006 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 676:136]
  wire  _T_5007 = io_lsu_axi_arvalid & _T_5006; // @[el2_lsu_bus_buffer.scala 676:134]
  wire  _T_5011 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 680:75]
  wire  _T_5012 = io_lsu_busreq_m & _T_5011; // @[el2_lsu_bus_buffer.scala 680:73]
  reg  _T_5015; // @[el2_lsu_bus_buffer.scala 680:56]
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
  assign io_lsu_busreq_r = _T_5015; // @[el2_lsu_bus_buffer.scala 680:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 588:30]
  assign io_lsu_bus_buffer_full_any = _T_4525 ? _T_4526 : _T_4527; // @[el2_lsu_bus_buffer.scala 589:30]
  assign io_lsu_bus_buffer_empty_any = _T_4538 & _T_1252; // @[el2_lsu_bus_buffer.scala 590:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 669:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 199:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 200:25]
  assign io_ld_fwddata_buf_lo = _T_652[31:0]; // @[el2_lsu_bus_buffer.scala 226:24]
  assign io_ld_fwddata_buf_hi = _T_749[31:0]; // @[el2_lsu_bus_buffer.scala 231:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4972; // @[el2_lsu_bus_buffer.scala 665:35]
  assign io_lsu_imprecise_error_store_any = _T_4956 | _T_4954; // @[el2_lsu_bus_buffer.scala 662:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4978 : _T_4720; // @[el2_lsu_bus_buffer.scala 666:35]
  assign io_lsu_nonblock_load_valid_m = _T_4544 & _T_4545; // @[el2_lsu_bus_buffer.scala 592:32]
  assign io_lsu_nonblock_load_tag_m = _T_1884 ? 2'h0 : _T_1920; // @[el2_lsu_bus_buffer.scala 593:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4547; // @[el2_lsu_bus_buffer.scala 595:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 596:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4768; // @[el2_lsu_bus_buffer.scala 609:35]
  assign io_lsu_nonblock_load_data_error = _T_4597 | _T_4595; // @[el2_lsu_bus_buffer.scala 598:35]
  assign io_lsu_nonblock_load_data_tag = _T_4637 | _T_4635; // @[el2_lsu_bus_buffer.scala 599:33]
  assign io_lsu_nonblock_load_data = _T_4803[31:0]; // @[el2_lsu_bus_buffer.scala 610:29]
  assign io_lsu_pmu_bus_trxn = _T_4995 | _T_4890; // @[el2_lsu_bus_buffer.scala 672:23]
  assign io_lsu_pmu_bus_misaligned = _T_4998 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 673:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 674:24]
  assign io_lsu_pmu_bus_busy = _T_5005 | _T_5007; // @[el2_lsu_bus_buffer.scala 676:23]
  assign io_lsu_axi_awvalid = _T_4900 & _T_1260; // @[el2_lsu_bus_buffer.scala 632:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1869}; // @[el2_lsu_bus_buffer.scala 633:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4904; // @[el2_lsu_bus_buffer.scala 634:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 638:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 639:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4906 : 3'h3; // @[el2_lsu_bus_buffer.scala 635:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 640:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 642:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 637:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 636:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 641:20]
  assign io_lsu_axi_wvalid = _T_4912 & _T_1260; // @[el2_lsu_bus_buffer.scala 644:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 646:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4916; // @[el2_lsu_bus_buffer.scala 645:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 647:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 660:21]
  assign io_lsu_axi_arvalid = _T_4921 & _T_1260; // @[el2_lsu_bus_buffer.scala 649:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1869}; // @[el2_lsu_bus_buffer.scala 650:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4904; // @[el2_lsu_bus_buffer.scala 651:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 655:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 656:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4906 : 3'h3; // @[el2_lsu_bus_buffer.scala 652:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 657:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 659:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 654:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 653:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 658:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 661:21]
  assign io_test = _T_753 | _T_752; // @[el2_lsu_bus_buffer.scala 260:11]
  assign io_data_hi = _T_4708 | _T_4706; // @[el2_lsu_bus_buffer.scala 607:14]
  assign io_data_lo = _T_4677 | _T_4675; // @[el2_lsu_bus_buffer.scala 608:14]
  assign io_data_en = {_T_4440,buf_data_en_0}; // @[el2_lsu_bus_buffer.scala 581:14]
  assign io_Cmdptr0 = _T_2101[1:0]; // @[el2_lsu_bus_buffer.scala 450:14]
  assign io_Cmdptr1 = 2'h0; // @[el2_lsu_bus_buffer.scala 360:14]
  assign io_WrPtr1_r = WrPtr1_r; // @[el2_lsu_bus_buffer.scala 280:15]
  assign io_WrPtr1_m = _T_1938 ? 2'h0 : _T_1983; // @[el2_lsu_bus_buffer.scala 435:15]
  assign io_wdata_in = {_T_1641,_T_1600}; // @[el2_lsu_bus_buffer.scala 395:15]
  assign io_buf_state = {_T_1923,buf_state_0}; // @[el2_lsu_bus_buffer.scala 427:16]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_io_en = _T_853 & _T_854; // @[el2_lib.scala 488:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_1_io_en = _T_853 & _T_854; // @[el2_lib.scala 488:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_2_io_en = _T_1261 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_3_io_en = _T_1261 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_4_io_en = _T_3552 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3745 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3938 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4131 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3552 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3745 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3938 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4131 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4384 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4381 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4378 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4375 = _RAND_4[0:0];
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
  _T_1869 = _RAND_17[1:0];
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
  _T_4354 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4351 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4348 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4345 = _RAND_53[0:0];
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
  _T_4331 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4329 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4327 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4325 = _RAND_88[0:0];
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
  _T_4360 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4363 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4366 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4369 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4435 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4430 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4425 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4420 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_5015 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4384 = 1'h0;
  end
  if (reset) begin
    _T_4381 = 1'h0;
  end
  if (reset) begin
    _T_4378 = 1'h0;
  end
  if (reset) begin
    _T_4375 = 1'h0;
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
    _T_1869 = 2'h0;
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
    _T_4354 = 1'h0;
  end
  if (reset) begin
    _T_4351 = 1'h0;
  end
  if (reset) begin
    _T_4348 = 1'h0;
  end
  if (reset) begin
    _T_4345 = 1'h0;
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
    _T_4331 = 1'h0;
  end
  if (reset) begin
    _T_4329 = 1'h0;
  end
  if (reset) begin
    _T_4327 = 1'h0;
  end
  if (reset) begin
    _T_4325 = 1'h0;
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
    _T_4360 = 1'h0;
  end
  if (reset) begin
    _T_4363 = 1'h0;
  end
  if (reset) begin
    _T_4366 = 1'h0;
  end
  if (reset) begin
    _T_4369 = 1'h0;
  end
  if (reset) begin
    _T_4435 = 1'h0;
  end
  if (reset) begin
    _T_4430 = 1'h0;
  end
  if (reset) begin
    _T_4425 = 1'h0;
  end
  if (reset) begin
    _T_4420 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_5015 = 1'h0;
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
    end else if (_T_3367) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4384 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4384 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4381 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4381 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4378 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4378 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4375 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4375 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3552) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3575) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3579) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3583) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3613) begin
        if (_T_3618) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3626) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3654) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3700) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3706) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3718) begin
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
    end else if (_T_3376) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3745) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3768) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3772) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3583) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3806) begin
        if (_T_3811) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3819) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3847) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3893) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3899) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3911) begin
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
    end else if (_T_3385) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3938) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3961) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3965) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3583) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3999) begin
        if (_T_4004) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4012) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4040) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4086) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4092) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4104) begin
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
    end else if (_T_3394) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4131) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4154) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4158) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3583) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4192) begin
        if (_T_4197) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4205) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4233) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4279) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4285) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4297) begin
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
      end else if (_T_3394) begin
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
      end else if (_T_3385) begin
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
      end else if (_T_3376) begin
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
      end else if (_T_3367) begin
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
      buf_ageQ_3 <= {_T_2559,_T_2482};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1869 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1869 <= WrPtr0_r;
      end else begin
        _T_1869 <= CmdPtr0;
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
      obuf_valid <= _T_1860 & _T_1861;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1261 & io_lsu_bus_clk_en;
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
      buf_ageQ_2 <= {_T_2457,_T_2380};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2355,_T_2278};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2253,_T_2176};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3552) begin
      if (_T_3567) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3575) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3579) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3613) begin
      if (_T_3693) begin
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
    end else if (_T_3745) begin
      if (_T_3760) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3768) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3772) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3806) begin
      if (_T_3886) begin
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
    end else if (_T_3938) begin
      if (_T_3953) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3961) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3965) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3999) begin
      if (_T_4079) begin
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
    end else if (_T_4131) begin
      if (_T_4146) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4154) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4158) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4192) begin
      if (_T_4272) begin
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
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      ibuf_data <= 32'h0;
    end else begin
      ibuf_data <= {_T_922,_T_893};
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
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
    end else if (_T_1011) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1938) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1952) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1966) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1980) begin
      WrPtr1_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1884) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1895) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1906) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1917) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_1011) begin
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
    end else if (_T_1011) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_1011) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_1011) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_1011) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_1011) begin
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
    end else if (_T_1079) begin
      obuf_wr_timer <= _T_1081;
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
      _T_4354 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4354 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4351 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4351 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4348 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4348 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4345 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4345 <= buf_sideeffect_in[0];
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
        obuf_write <= _T_1223;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1326 & _T_4887;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1326 & _T_4888;
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
      obuf_addr <= _T_1310;
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
        obuf_sideeffect <= _T_1072;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1351 | _T_1355;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1357) begin
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
        obuf_sz <= _T_1323;
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
      obuf_data <= {_T_1641,_T_1600};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3197,_T_3186};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3212,_T_3201};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3227,_T_3216};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3242,_T_3231};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4331 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4131) begin
        _T_4331 <= 1'h0;
      end else if (_T_4154) begin
        _T_4331 <= 1'h0;
      end else begin
        _T_4331 <= _T_4158;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4329 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3938) begin
        _T_4329 <= 1'h0;
      end else if (_T_3961) begin
        _T_4329 <= 1'h0;
      end else begin
        _T_4329 <= _T_3965;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4327 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3745) begin
        _T_4327 <= 1'h0;
      end else if (_T_3768) begin
        _T_4327 <= 1'h0;
      end else begin
        _T_4327 <= _T_3772;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4325 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3552) begin
        _T_4325 <= 1'h0;
      end else if (_T_3575) begin
        _T_4325 <= 1'h0;
      end else begin
        _T_4325 <= _T_3579;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3552) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3575) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3579) begin
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
      end else if (_T_3367) begin
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
      if (_T_4131) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4154) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4158) begin
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
      if (_T_3938) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3961) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3965) begin
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
      if (_T_3745) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3768) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3772) begin
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
      end else if (_T_3376) begin
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
      end else if (_T_3385) begin
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
      end else if (_T_3394) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4360 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4360 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4363 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4363 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4366 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4366 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4369 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4369 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4435 <= 1'h0;
    end else begin
      _T_4435 <= _T_4432 & _T_4433;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4430 <= 1'h0;
    end else begin
      _T_4430 <= _T_4427 & _T_4428;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4425 <= 1'h0;
    end else begin
      _T_4425 <= _T_4422 & _T_4423;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4420 <= 1'h0;
    end else begin
      _T_4420 <= _T_4417 & _T_4418;
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
      _T_5015 <= 1'h0;
    end else begin
      _T_5015 <= _T_5012 & _T_4545;
    end
  end
endmodule
