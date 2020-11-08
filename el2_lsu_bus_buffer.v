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
  reg  _T_4381; // @[Reg.scala 27:20]
  reg  _T_4378; // @[Reg.scala 27:20]
  reg  _T_4375; // @[Reg.scala 27:20]
  reg  _T_4372; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4381,_T_4378,_T_4375,_T_4372}; // @[Cat.scala 29:58]
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
  wire  _T_2642 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_4128 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4151 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4155 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1867; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1867}; // @[el2_lsu_bus_buffer.scala 411:13]
  wire  _T_4162 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 515:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_4163 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_4164 = obuf_merge & _T_4163; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_4165 = _T_4162 | _T_4164; // @[el2_lsu_bus_buffer.scala 515:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 405:54]
  wire  _T_4166 = _T_4165 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 404:55]
  wire  _T_4167 = _T_4166 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_280 = _T_4155 & _T_4167; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4151 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4128 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2643 = _T_2642 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2644 = ~_T_2643; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2645 = buf_ageQ_3[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2637 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_3935 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3958 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3962 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3969 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 515:48]
  wire  _T_3970 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_3971 = obuf_merge & _T_3970; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_3972 = _T_3969 | _T_3971; // @[el2_lsu_bus_buffer.scala 515:77]
  wire  _T_3973 = _T_3972 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  wire  _T_3974 = _T_3973 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_204 = _T_3962 & _T_3974; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3958 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3935 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2638 = _T_2637 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2639 = ~_T_2638; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2640 = buf_ageQ_3[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2632 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_3742 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3765 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3769 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3776 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 515:48]
  wire  _T_3777 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_3778 = obuf_merge & _T_3777; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_3779 = _T_3776 | _T_3778; // @[el2_lsu_bus_buffer.scala 515:77]
  wire  _T_3780 = _T_3779 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  wire  _T_3781 = _T_3780 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_128 = _T_3769 & _T_3781; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3765 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3742 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2633 = _T_2632 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2634 = ~_T_2633; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2635 = buf_ageQ_3[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2627 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 472:95]
  wire  _T_3549 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3572 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3576 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3583 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 515:48]
  wire  _T_3584 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 515:104]
  wire  _T_3585 = obuf_merge & _T_3584; // @[el2_lsu_bus_buffer.scala 515:91]
  wire  _T_3586 = _T_3583 | _T_3585; // @[el2_lsu_bus_buffer.scala 515:77]
  wire  _T_3587 = _T_3586 & obuf_valid; // @[el2_lsu_bus_buffer.scala 515:135]
  wire  _T_3588 = _T_3587 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 515:148]
  wire  _GEN_52 = _T_3576 & _T_3588; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3572 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3549 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2628 = _T_2627 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 472:105]
  wire  _T_2629 = ~_T_2628; // @[el2_lsu_bus_buffer.scala 472:80]
  wire  _T_2630 = buf_ageQ_3[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_3 = {_T_2645,_T_2640,_T_2635,_T_2630}; // @[Cat.scala 29:58]
  wire  _T_2744 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2746 = _T_2744 & _T_19; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2738 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2740 = _T_2738 & _T_12; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2732 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2734 = _T_2732 & _T_5; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2746,_T_2740,_T_2734}; // @[Cat.scala 29:58]
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
  wire [3:0] _T_521 = ld_addr_ibuf_hit_lo ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire [3:0] _T_522 = _T_521 & ibuf_byteen; // @[el2_lsu_bus_buffer.scala 217:55]
  wire [3:0] ld_byte_ibuf_hit_lo = _T_522 & ldst_byteen_lo_m; // @[el2_lsu_bus_buffer.scala 217:69]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 206:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2622 = buf_ageQ_2[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2617 = buf_ageQ_2[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2612 = buf_ageQ_2[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2607 = buf_ageQ_2[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_2 = {_T_2622,_T_2617,_T_2612,_T_2607}; // @[Cat.scala 29:58]
  wire  _T_2723 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2725 = _T_2723 & _T_26; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2711 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2713 = _T_2711 & _T_12; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2705 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2707 = _T_2705 & _T_5; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_2 = {_T_2725,1'h0,_T_2713,_T_2707}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2599 = buf_ageQ_1[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2594 = buf_ageQ_1[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2589 = buf_ageQ_1[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2584 = buf_ageQ_1[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_1 = {_T_2599,_T_2594,_T_2589,_T_2584}; // @[Cat.scala 29:58]
  wire  _T_2696 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2698 = _T_2696 & _T_26; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2690 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2692 = _T_2690 & _T_19; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2678 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2680 = _T_2678 & _T_5; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_1 = {_T_2698,_T_2692,1'h0,_T_2680}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 206:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 206:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 206:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 206:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 206:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 560:60]
  wire  _T_2576 = buf_ageQ_0[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2571 = buf_ageQ_0[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2566 = buf_ageQ_0[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 472:78]
  wire  _T_2561 = buf_ageQ_0[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 472:78]
  wire [3:0] buf_age_0 = {_T_2576,_T_2571,_T_2566,_T_2561}; // @[Cat.scala 29:58]
  wire  _T_2669 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2671 = _T_2669 & _T_26; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2663 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2665 = _T_2663 & _T_19; // @[el2_lsu_bus_buffer.scala 473:106]
  wire  _T_2657 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 473:91]
  wire  _T_2659 = _T_2657 & _T_12; // @[el2_lsu_bus_buffer.scala 473:106]
  wire [3:0] buf_age_younger_0 = {_T_2671,_T_2665,_T_2659,1'h0}; // @[Cat.scala 29:58]
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
  wire [3:0] _T_525 = ld_addr_ibuf_hit_hi ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_526 = _T_525 & ibuf_byteen; // @[el2_lsu_bus_buffer.scala 218:55]
  wire [3:0] ld_byte_ibuf_hit_hi = _T_526 & ldst_byteen_hi_m; // @[el2_lsu_bus_buffer.scala 218:69]
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
  wire [8:0] _GEN_354 = {{1'd0}, _T_558}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_560 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_355 = {{1'd0}, _T_563}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_565 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_356 = {{1'd0}, _T_568}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_570 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[el2_lib.scala 491:16]
  wire [8:0] _GEN_357 = {{1'd0}, _T_573}; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_575 = _GEN_357 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [8:0] _T_576 = _T_560 | _T_565; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [8:0] _T_577 = _T_576 | _T_570; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [8:0] _T_578 = _T_577 | _T_575; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [7:0] _T_581 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_583 = _T_581 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_586 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_588 = _T_586 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_591 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_593 = _T_591 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_596 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_598 = _T_596 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 226:65]
  wire [7:0] _T_599 = _T_583 | _T_588; // @[el2_lsu_bus_buffer.scala 226:97]
  wire [7:0] _T_600 = _T_599 | _T_593; // @[el2_lsu_bus_buffer.scala 226:97]
  wire [7:0] _T_601 = _T_600 | _T_598; // @[el2_lsu_bus_buffer.scala 226:97]
  wire [7:0] _T_604 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_606 = _T_604 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_609 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_611 = _T_609 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_614 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_616 = _T_614 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_619 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_621 = _T_619 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 227:65]
  wire [7:0] _T_622 = _T_606 | _T_611; // @[el2_lsu_bus_buffer.scala 227:96]
  wire [7:0] _T_623 = _T_622 | _T_616; // @[el2_lsu_bus_buffer.scala 227:96]
  wire [7:0] _T_624 = _T_623 | _T_621; // @[el2_lsu_bus_buffer.scala 227:96]
  wire [7:0] _T_627 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_629 = _T_627 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_632 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_634 = _T_632 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_637 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_639 = _T_637 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_642 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_644 = _T_642 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 228:65]
  wire [7:0] _T_645 = _T_629 | _T_634; // @[el2_lsu_bus_buffer.scala 228:95]
  wire [7:0] _T_646 = _T_645 | _T_639; // @[el2_lsu_bus_buffer.scala 228:95]
  wire [7:0] _T_647 = _T_646 | _T_644; // @[el2_lsu_bus_buffer.scala 228:95]
  wire [32:0] _T_650 = {_T_578,_T_601,_T_624,_T_647}; // @[Cat.scala 29:58]
  wire [32:0] _GEN_358 = {{1'd0}, ld_fwddata_buf_lo_initial}; // @[el2_lsu_bus_buffer.scala 228:101]
  wire [32:0] _T_651 = _T_650 | _GEN_358; // @[el2_lsu_bus_buffer.scala 228:101]
  wire [7:0] _T_654 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_359 = {{1'd0}, _T_654}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_656 = _GEN_359 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [7:0] _T_659 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_360 = {{1'd0}, _T_659}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_661 = _GEN_360 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [7:0] _T_664 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_361 = {{1'd0}, _T_664}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_666 = _GEN_361 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [7:0] _T_669 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_362 = {{1'd0}, _T_669}; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_671 = _GEN_362 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 230:91]
  wire [8:0] _T_672 = _T_656 | _T_661; // @[el2_lsu_bus_buffer.scala 230:123]
  wire [8:0] _T_673 = _T_672 | _T_666; // @[el2_lsu_bus_buffer.scala 230:123]
  wire [8:0] _T_674 = _T_673 | _T_671; // @[el2_lsu_bus_buffer.scala 230:123]
  wire [7:0] _T_677 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_679 = _T_677 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_682 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_684 = _T_682 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_687 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_689 = _T_687 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_692 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_694 = _T_692 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 231:65]
  wire [7:0] _T_695 = _T_679 | _T_684; // @[el2_lsu_bus_buffer.scala 231:97]
  wire [7:0] _T_696 = _T_695 | _T_689; // @[el2_lsu_bus_buffer.scala 231:97]
  wire [7:0] _T_697 = _T_696 | _T_694; // @[el2_lsu_bus_buffer.scala 231:97]
  wire [7:0] _T_700 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_702 = _T_700 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_705 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_707 = _T_705 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_710 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_712 = _T_710 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_715 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_717 = _T_715 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 232:65]
  wire [7:0] _T_718 = _T_702 | _T_707; // @[el2_lsu_bus_buffer.scala 232:96]
  wire [7:0] _T_719 = _T_718 | _T_712; // @[el2_lsu_bus_buffer.scala 232:96]
  wire [7:0] _T_720 = _T_719 | _T_717; // @[el2_lsu_bus_buffer.scala 232:96]
  wire [7:0] _T_723 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_725 = _T_723 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_728 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_730 = _T_728 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_733 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_735 = _T_733 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_738 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_740 = _T_738 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 233:65]
  wire [7:0] _T_741 = _T_725 | _T_730; // @[el2_lsu_bus_buffer.scala 233:95]
  wire [7:0] _T_742 = _T_741 | _T_735; // @[el2_lsu_bus_buffer.scala 233:95]
  wire [7:0] _T_743 = _T_742 | _T_740; // @[el2_lsu_bus_buffer.scala 233:95]
  wire [32:0] _T_746 = {_T_674,_T_697,_T_720,_T_743}; // @[Cat.scala 29:58]
  wire [32:0] _GEN_363 = {{1'd0}, ld_fwddata_buf_hi_initial}; // @[el2_lsu_bus_buffer.scala 233:101]
  wire [32:0] _T_747 = _T_746 | _GEN_363; // @[el2_lsu_bus_buffer.scala 233:101]
  wire [3:0] _T_748 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_749 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_750 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_751 = _T_748 | _T_749; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_751 | _T_750; // @[Mux.scala 27:72]
  wire  _T_754 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 240:55]
  wire  _T_756 = io_lsu_addr_r[1:0] == 2'h1; // @[el2_lsu_bus_buffer.scala 241:55]
  wire [3:0] _T_758 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_760 = io_lsu_addr_r[1:0] == 2'h2; // @[el2_lsu_bus_buffer.scala 242:55]
  wire [3:0] _T_762 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_764 = io_lsu_addr_r[1:0] == 2'h3; // @[el2_lsu_bus_buffer.scala 243:55]
  wire [3:0] _T_766 = {1'h0,ldst_byteen_r[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_768 = _T_756 ? _T_758 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_769 = _T_760 ? _T_762 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_770 = _T_764 ? _T_766 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_772 = _T_768 | _T_769; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_hi_r = _T_772 | _T_770; // @[Mux.scala 27:72]
  wire [3:0] _T_779 = {ldst_byteen_r[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_783 = {ldst_byteen_r[1:0],2'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_787 = {ldst_byteen_r[0],3'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_788 = _T_754 ? ldst_byteen_r : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_789 = _T_756 ? _T_779 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_790 = _T_760 ? _T_783 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_791 = _T_764 ? _T_787 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_792 = _T_788 | _T_789; // @[Mux.scala 27:72]
  wire [3:0] _T_793 = _T_792 | _T_790; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_lo_r = _T_793 | _T_791; // @[Mux.scala 27:72]
  wire [31:0] _T_800 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_804 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_808 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
  wire [31:0] _T_810 = _T_756 ? _T_800 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_811 = _T_760 ? _T_804 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_812 = _T_764 ? _T_808 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_814 = _T_810 | _T_811; // @[Mux.scala 27:72]
  wire [31:0] store_data_hi_r = _T_814 | _T_812; // @[Mux.scala 27:72]
  wire [31:0] _T_821 = {io_store_data_r[23:0],8'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_825 = {io_store_data_r[15:0],16'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_829 = {io_store_data_r[7:0],24'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_830 = _T_754 ? io_store_data_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_831 = _T_756 ? _T_821 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_832 = _T_760 ? _T_825 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_833 = _T_764 ? _T_829 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_834 = _T_830 | _T_831; // @[Mux.scala 27:72]
  wire [31:0] _T_835 = _T_834 | _T_832; // @[Mux.scala 27:72]
  wire [31:0] store_data_lo_r = _T_835 | _T_833; // @[Mux.scala 27:72]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 261:40]
  wire  _T_842 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 263:26]
  wire  _T_843 = io_lsu_pkt_r_word & _T_754; // @[Mux.scala 27:72]
  wire  _T_844 = io_lsu_pkt_r_half & _T_842; // @[Mux.scala 27:72]
  wire  _T_846 = _T_843 | _T_844; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_846 | io_lsu_pkt_r_by; // @[Mux.scala 27:72]
  wire  _T_848 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 265:55]
  wire  _T_849 = io_lsu_busreq_r & _T_848; // @[el2_lsu_bus_buffer.scala 265:34]
  wire  _T_850 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 265:79]
  wire  ibuf_byp = _T_849 & _T_850; // @[el2_lsu_bus_buffer.scala 265:77]
  wire  _T_851 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 266:36]
  wire  _T_852 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 266:56]
  wire  ibuf_wr_en = _T_851 & _T_852; // @[el2_lsu_bus_buffer.scala 266:54]
  wire  _T_853 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 268:36]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 311:59]
  wire  _T_862 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 274:62]
  wire  _T_863 = ibuf_wr_en | _T_862; // @[el2_lsu_bus_buffer.scala 274:48]
  wire  _T_927 = _T_851 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 293:54]
  wire  _T_928 = _T_927 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 293:75]
  wire  _T_929 = _T_928 & ibuf_write; // @[el2_lsu_bus_buffer.scala 293:88]
  wire  _T_932 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 293:124]
  wire  _T_933 = _T_929 & _T_932; // @[el2_lsu_bus_buffer.scala 293:101]
  wire  _T_934 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 293:147]
  wire  _T_935 = _T_933 & _T_934; // @[el2_lsu_bus_buffer.scala 293:145]
  wire  _T_936 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 293:170]
  wire  ibuf_merge_en = _T_935 & _T_936; // @[el2_lsu_bus_buffer.scala 293:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 294:20]
  wire  _T_864 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 274:98]
  wire  _T_865 = ~_T_864; // @[el2_lsu_bus_buffer.scala 274:82]
  wire  _T_866 = _T_863 & _T_865; // @[el2_lsu_bus_buffer.scala 274:80]
  wire  _T_867 = _T_866 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 275:5]
  wire  _T_855 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 269:44]
  wire  _T_856 = io_lsu_busreq_m & _T_855; // @[el2_lsu_bus_buffer.scala 269:42]
  wire  _T_857 = _T_856 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 269:61]
  wire  _T_860 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 269:115]
  wire  _T_861 = io_lsu_pkt_m_load | _T_860; // @[el2_lsu_bus_buffer.scala 269:95]
  wire  ibuf_force_drain = _T_857 & _T_861; // @[el2_lsu_bus_buffer.scala 269:74]
  wire  _T_868 = _T_867 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 275:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_869 = _T_868 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 275:35]
  wire  _T_870 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 275:55]
  wire  _T_871 = _T_869 | _T_870; // @[el2_lsu_bus_buffer.scala 275:53]
  wire  _T_872 = _T_871 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 275:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_872; // @[el2_lsu_bus_buffer.scala 274:32]
  wire  _T_854 = ibuf_drain_vld & _T_853; // @[el2_lsu_bus_buffer.scala 268:34]
  wire  ibuf_rst = _T_854 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 268:49]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 677:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 676:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_879 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 284:77]
  reg [31:0] ibuf_data; // @[el2_lib.scala 491:16]
  wire [7:0] _T_887 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_890 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_891 = _T_864 ? _T_887 : _T_890; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [7:0] _T_896 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_899 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_900 = _T_864 ? _T_896 : _T_899; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [7:0] _T_905 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_908 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_909 = _T_864 ? _T_905 : _T_908; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [7:0] _T_914 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 289:8]
  wire [7:0] _T_917 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[el2_lsu_bus_buffer.scala 290:8]
  wire [7:0] _T_918 = _T_864 ? _T_914 : _T_917; // @[el2_lsu_bus_buffer.scala 288:46]
  wire [23:0] _T_920 = {_T_918,_T_909,_T_900}; // @[Cat.scala 29:58]
  wire  _T_921 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 291:59]
  wire [2:0] _T_924 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 291:93]
  wire  _T_939 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 295:65]
  wire  _T_940 = ibuf_merge_en & _T_939; // @[el2_lsu_bus_buffer.scala 295:63]
  wire  _T_943 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_945 = _T_940 ? _T_943 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire  _T_950 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_952 = _T_940 ? _T_950 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire  _T_957 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_959 = _T_940 ? _T_957 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire  _T_964 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 295:96]
  wire  _T_966 = _T_940 ? _T_964 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 295:48]
  wire [3:0] ibuf_byteen_out = {_T_966,_T_959,_T_952,_T_945}; // @[Cat.scala 29:58]
  wire [7:0] _T_976 = _T_940 ? _T_887 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [7:0] _T_984 = _T_940 ? _T_896 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [7:0] _T_992 = _T_940 ? _T_905 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [7:0] _T_1000 = _T_940 ? _T_914 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 296:45]
  wire [31:0] ibuf_data_out = {_T_1000,_T_992,_T_984,_T_976}; // @[Cat.scala 29:58]
  wire  _T_1003 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 298:28]
  wire  _T_1004 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 298:63]
  wire  _T_1009 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 299:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4470 = buf_write[3] & _T_2642; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4471 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4472 = _T_4470 & _T_4471; // @[el2_lsu_bus_buffer.scala 582:89]
  wire  _T_4465 = buf_write[2] & _T_2637; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4466 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4467 = _T_4465 & _T_4466; // @[el2_lsu_bus_buffer.scala 582:89]
  wire [1:0] _T_4473 = _T_4472 + _T_4467; // @[el2_lsu_bus_buffer.scala 582:142]
  wire  _T_4460 = buf_write[1] & _T_2632; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4461 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4462 = _T_4460 & _T_4461; // @[el2_lsu_bus_buffer.scala 582:89]
  wire [1:0] _GEN_364 = {{1'd0}, _T_4462}; // @[el2_lsu_bus_buffer.scala 582:142]
  wire [2:0] _T_4474 = _T_4473 + _GEN_364; // @[el2_lsu_bus_buffer.scala 582:142]
  wire  _T_4455 = buf_write[0] & _T_2627; // @[el2_lsu_bus_buffer.scala 582:64]
  wire  _T_4456 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 582:91]
  wire  _T_4457 = _T_4455 & _T_4456; // @[el2_lsu_bus_buffer.scala 582:89]
  wire [2:0] _GEN_365 = {{2'd0}, _T_4457}; // @[el2_lsu_bus_buffer.scala 582:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4474 + _GEN_365; // @[el2_lsu_bus_buffer.scala 582:142]
  wire  _T_1035 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 321:43]
  wire  _T_4487 = _T_2642 & _T_4471; // @[el2_lsu_bus_buffer.scala 583:73]
  wire  _T_4484 = _T_2637 & _T_4466; // @[el2_lsu_bus_buffer.scala 583:73]
  wire [1:0] _T_4488 = _T_4487 + _T_4484; // @[el2_lsu_bus_buffer.scala 583:126]
  wire  _T_4481 = _T_2632 & _T_4461; // @[el2_lsu_bus_buffer.scala 583:73]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4481}; // @[el2_lsu_bus_buffer.scala 583:126]
  wire [2:0] _T_4489 = _T_4488 + _GEN_366; // @[el2_lsu_bus_buffer.scala 583:126]
  wire  _T_4478 = _T_2627 & _T_4456; // @[el2_lsu_bus_buffer.scala 583:73]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4478}; // @[el2_lsu_bus_buffer.scala 583:126]
  wire [3:0] buf_numvld_cmd_any = _T_4489 + _GEN_367; // @[el2_lsu_bus_buffer.scala 583:126]
  wire  _T_1036 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 321:72]
  wire  _T_1037 = _T_1035 & _T_1036; // @[el2_lsu_bus_buffer.scala 321:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 420:54]
  wire  _T_1038 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 321:97]
  wire  _T_1039 = _T_1037 & _T_1038; // @[el2_lsu_bus_buffer.scala 321:80]
  wire  _T_1041 = _T_1039 & _T_936; // @[el2_lsu_bus_buffer.scala 321:114]
  wire  _T_2000 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_2001 = ~_T_2000; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_2003 = _T_2001 & _T_2642; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_2005 = _T_2003 & _T_4471; // @[el2_lsu_bus_buffer.scala 437:88]
  wire  _T_1994 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_1995 = ~_T_1994; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_1997 = _T_1995 & _T_2637; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_1999 = _T_1997 & _T_4466; // @[el2_lsu_bus_buffer.scala 437:88]
  wire  _T_1988 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_1989 = ~_T_1988; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_1991 = _T_1989 & _T_2632; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_1993 = _T_1991 & _T_4461; // @[el2_lsu_bus_buffer.scala 437:88]
  wire  _T_1982 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 437:58]
  wire  _T_1983 = ~_T_1982; // @[el2_lsu_bus_buffer.scala 437:45]
  wire  _T_1985 = _T_1983 & _T_2627; // @[el2_lsu_bus_buffer.scala 437:63]
  wire  _T_1987 = _T_1985 & _T_4456; // @[el2_lsu_bus_buffer.scala 437:88]
  wire [3:0] CmdPtr0Dec = {_T_2005,_T_1999,_T_1993,_T_1987}; // @[Cat.scala 29:58]
  wire [7:0] _T_2075 = {4'h0,_T_2005,_T_1999,_T_1993,_T_1987}; // @[Cat.scala 29:58]
  wire  _T_2078 = _T_2075[4] | _T_2075[5]; // @[el2_lsu_bus_buffer.scala 445:42]
  wire  _T_2080 = _T_2078 | _T_2075[6]; // @[el2_lsu_bus_buffer.scala 445:48]
  wire  _T_2082 = _T_2080 | _T_2075[7]; // @[el2_lsu_bus_buffer.scala 445:54]
  wire  _T_2085 = _T_2075[2] | _T_2075[3]; // @[el2_lsu_bus_buffer.scala 445:67]
  wire  _T_2087 = _T_2085 | _T_2075[6]; // @[el2_lsu_bus_buffer.scala 445:73]
  wire  _T_2089 = _T_2087 | _T_2075[7]; // @[el2_lsu_bus_buffer.scala 445:79]
  wire  _T_2092 = _T_2075[1] | _T_2075[3]; // @[el2_lsu_bus_buffer.scala 445:92]
  wire  _T_2094 = _T_2092 | _T_2075[5]; // @[el2_lsu_bus_buffer.scala 445:98]
  wire  _T_2096 = _T_2094 | _T_2075[7]; // @[el2_lsu_bus_buffer.scala 445:104]
  wire [2:0] _T_2098 = {_T_2082,_T_2089,_T_2096}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2098[1:0]; // @[el2_lsu_bus_buffer.scala 451:11]
  wire  _T_1042 = CmdPtr0 == 2'h0; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_1043 = CmdPtr0 == 2'h1; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_1044 = CmdPtr0 == 2'h2; // @[el2_lsu_bus_buffer.scala 322:114]
  wire  _T_1045 = CmdPtr0 == 2'h3; // @[el2_lsu_bus_buffer.scala 322:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_1046 = _T_1042 & buf_nomerge_0; // @[Mux.scala 27:72]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _T_1047 = _T_1043 & buf_nomerge_1; // @[Mux.scala 27:72]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _T_1048 = _T_1044 & buf_nomerge_2; // @[Mux.scala 27:72]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1049 = _T_1045 & buf_nomerge_3; // @[Mux.scala 27:72]
  wire  _T_1050 = _T_1046 | _T_1047; // @[Mux.scala 27:72]
  wire  _T_1051 = _T_1050 | _T_1048; // @[Mux.scala 27:72]
  wire  _T_1052 = _T_1051 | _T_1049; // @[Mux.scala 27:72]
  wire  _T_1054 = ~_T_1052; // @[el2_lsu_bus_buffer.scala 322:31]
  wire  _T_1055 = _T_1041 & _T_1054; // @[el2_lsu_bus_buffer.scala 322:29]
  reg  _T_4351; // @[Reg.scala 27:20]
  reg  _T_4348; // @[Reg.scala 27:20]
  reg  _T_4345; // @[Reg.scala 27:20]
  reg  _T_4342; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4351,_T_4348,_T_4345,_T_4342}; // @[Cat.scala 29:58]
  wire  _T_1064 = _T_1042 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1065 = _T_1043 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1066 = _T_1044 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1067 = _T_1045 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1068 = _T_1064 | _T_1065; // @[Mux.scala 27:72]
  wire  _T_1069 = _T_1068 | _T_1066; // @[Mux.scala 27:72]
  wire  _T_1070 = _T_1069 | _T_1067; // @[Mux.scala 27:72]
  wire  _T_1072 = ~_T_1070; // @[el2_lsu_bus_buffer.scala 323:5]
  wire  _T_1073 = _T_1055 & _T_1072; // @[el2_lsu_bus_buffer.scala 322:140]
  wire  _T_1084 = _T_856 & _T_850; // @[el2_lsu_bus_buffer.scala 325:58]
  wire  _T_1086 = _T_1084 & _T_1036; // @[el2_lsu_bus_buffer.scala 325:72]
  wire [29:0] _T_1096 = _T_1042 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1097 = _T_1043 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1100 = _T_1096 | _T_1097; // @[Mux.scala 27:72]
  wire [29:0] _T_1098 = _T_1044 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1101 = _T_1100 | _T_1098; // @[Mux.scala 27:72]
  wire [29:0] _T_1099 = _T_1045 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1102 = _T_1101 | _T_1099; // @[Mux.scala 27:72]
  wire  _T_1104 = io_lsu_addr_m[31:2] != _T_1102; // @[el2_lsu_bus_buffer.scala 325:123]
  wire  obuf_force_wr_en = _T_1086 & _T_1104; // @[el2_lsu_bus_buffer.scala 325:101]
  wire  _T_1074 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 323:119]
  wire  obuf_wr_wait = _T_1073 & _T_1074; // @[el2_lsu_bus_buffer.scala 323:117]
  wire  _T_1075 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 324:75]
  wire  _T_1076 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 324:95]
  wire  _T_1077 = _T_1075 & _T_1076; // @[el2_lsu_bus_buffer.scala 324:79]
  wire [2:0] _T_1079 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 324:121]
  wire  _T_4506 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4510 = _T_4506 | _T_4487; // @[el2_lsu_bus_buffer.scala 584:74]
  wire  _T_4501 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4505 = _T_4501 | _T_4484; // @[el2_lsu_bus_buffer.scala 584:74]
  wire [1:0] _T_4511 = _T_4510 + _T_4505; // @[el2_lsu_bus_buffer.scala 584:154]
  wire  _T_4496 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4500 = _T_4496 | _T_4481; // @[el2_lsu_bus_buffer.scala 584:74]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4500}; // @[el2_lsu_bus_buffer.scala 584:154]
  wire [2:0] _T_4512 = _T_4511 + _GEN_368; // @[el2_lsu_bus_buffer.scala 584:154]
  wire  _T_4491 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 584:63]
  wire  _T_4495 = _T_4491 | _T_4478; // @[el2_lsu_bus_buffer.scala 584:74]
  wire [2:0] _GEN_369 = {{2'd0}, _T_4495}; // @[el2_lsu_bus_buffer.scala 584:154]
  wire [3:0] buf_numvld_pend_any = _T_4512 + _GEN_369; // @[el2_lsu_bus_buffer.scala 584:154]
  wire  _T_1106 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 327:53]
  wire  _T_1107 = ibuf_byp & _T_1106; // @[el2_lsu_bus_buffer.scala 327:31]
  wire  _T_1108 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 327:64]
  wire  _T_1109 = _T_1108 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 327:84]
  wire  ibuf_buf_byp = _T_1107 & _T_1109; // @[el2_lsu_bus_buffer.scala 327:61]
  wire  _T_1110 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 342:32]
  wire  _T_4802 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4804 = _T_4802 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4805 = _T_4804 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  _T_4806 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4808 = _T_4806 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4809 = _T_4808 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  _T_4818 = _T_4805 | _T_4809; // @[el2_lsu_bus_buffer.scala 613:141]
  wire  _T_4810 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4812 = _T_4810 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4813 = _T_4812 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  _T_4819 = _T_4818 | _T_4813; // @[el2_lsu_bus_buffer.scala 613:141]
  wire  _T_4814 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 613:62]
  wire  _T_4816 = _T_4814 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 613:73]
  wire  _T_4817 = _T_4816 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 613:93]
  wire  bus_sideeffect_pend = _T_4819 | _T_4817; // @[el2_lsu_bus_buffer.scala 613:141]
  wire  _T_1111 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 342:74]
  wire  _T_1112 = ~_T_1111; // @[el2_lsu_bus_buffer.scala 342:52]
  wire  _T_1113 = _T_1110 & _T_1112; // @[el2_lsu_bus_buffer.scala 342:50]
  wire [2:0] _T_1118 = _T_1042 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1119 = _T_1043 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1122 = _T_1118 | _T_1119; // @[Mux.scala 27:72]
  wire [2:0] _T_1120 = _T_1044 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1123 = _T_1122 | _T_1120; // @[Mux.scala 27:72]
  wire [2:0] _T_1121 = _T_1045 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1124 = _T_1123 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1124 == 3'h2; // @[el2_lsu_bus_buffer.scala 343:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 442:31]
  wire  _T_1127 = _T_1126 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 343:47]
  wire [3:0] _T_1130 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1139 = _T_1042 & _T_1130[0]; // @[Mux.scala 27:72]
  wire  _T_1140 = _T_1043 & _T_1130[1]; // @[Mux.scala 27:72]
  wire  _T_1143 = _T_1139 | _T_1140; // @[Mux.scala 27:72]
  wire  _T_1141 = _T_1044 & _T_1130[2]; // @[Mux.scala 27:72]
  wire  _T_1144 = _T_1143 | _T_1141; // @[Mux.scala 27:72]
  wire  _T_1142 = _T_1045 & _T_1130[3]; // @[Mux.scala 27:72]
  wire  _T_1145 = _T_1144 | _T_1142; // @[Mux.scala 27:72]
  wire  _T_1147 = ~_T_1145; // @[el2_lsu_bus_buffer.scala 344:23]
  wire  _T_1148 = _T_1127 & _T_1147; // @[el2_lsu_bus_buffer.scala 344:21]
  wire  _T_1165 = _T_1070 & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 344:141]
  wire  _T_1166 = ~_T_1165; // @[el2_lsu_bus_buffer.scala 344:105]
  wire  _T_1167 = _T_1148 & _T_1166; // @[el2_lsu_bus_buffer.scala 344:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1170 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  wire  _T_1179 = _T_1042 & _T_1170[0]; // @[Mux.scala 27:72]
  wire  _T_1180 = _T_1043 & _T_1170[1]; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1179 | _T_1180; // @[Mux.scala 27:72]
  wire  _T_1181 = _T_1044 & _T_1170[2]; // @[Mux.scala 27:72]
  wire  _T_1184 = _T_1183 | _T_1181; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1045 & _T_1170[3]; // @[Mux.scala 27:72]
  wire  _T_1185 = _T_1184 | _T_1182; // @[Mux.scala 27:72]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1189 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1198 = _T_1042 & _T_1189[0]; // @[Mux.scala 27:72]
  wire  _T_1199 = _T_1043 & _T_1189[1]; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1198 | _T_1199; // @[Mux.scala 27:72]
  wire  _T_1200 = _T_1044 & _T_1189[2]; // @[Mux.scala 27:72]
  wire  _T_1203 = _T_1202 | _T_1200; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1045 & _T_1189[3]; // @[Mux.scala 27:72]
  wire  _T_1204 = _T_1203 | _T_1201; // @[Mux.scala 27:72]
  wire  _T_1206 = _T_1185 & _T_1204; // @[el2_lsu_bus_buffer.scala 345:77]
  wire  _T_1215 = _T_1042 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1216 = _T_1043 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1219 = _T_1215 | _T_1216; // @[Mux.scala 27:72]
  wire  _T_1217 = _T_1044 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1219 | _T_1217; // @[Mux.scala 27:72]
  wire  _T_1218 = _T_1045 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1220 | _T_1218; // @[Mux.scala 27:72]
  wire  _T_1223 = ~_T_1221; // @[el2_lsu_bus_buffer.scala 345:150]
  wire  _T_1224 = _T_1206 & _T_1223; // @[el2_lsu_bus_buffer.scala 345:148]
  wire  _T_1225 = ~_T_1224; // @[el2_lsu_bus_buffer.scala 345:8]
  wire [3:0] _T_2041 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 438:62]
  wire [3:0] _T_2042 = buf_age_3 & _T_2041; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2043 = |_T_2042; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2044 = ~_T_2043; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2046 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2047 = _T_2044 & _T_2046; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2049 = _T_2047 & _T_2642; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2051 = _T_2049 & _T_4471; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] _T_2031 = buf_age_2 & _T_2041; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2032 = |_T_2031; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2033 = ~_T_2032; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2035 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2036 = _T_2033 & _T_2035; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2038 = _T_2036 & _T_2637; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2040 = _T_2038 & _T_4466; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] _T_2020 = buf_age_1 & _T_2041; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2021 = |_T_2020; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2022 = ~_T_2021; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2024 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2025 = _T_2022 & _T_2024; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2027 = _T_2025 & _T_2632; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2029 = _T_2027 & _T_4461; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] _T_2009 = buf_age_0 & _T_2041; // @[el2_lsu_bus_buffer.scala 438:59]
  wire  _T_2010 = |_T_2009; // @[el2_lsu_bus_buffer.scala 438:76]
  wire  _T_2011 = ~_T_2010; // @[el2_lsu_bus_buffer.scala 438:45]
  wire  _T_2013 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 438:83]
  wire  _T_2014 = _T_2011 & _T_2013; // @[el2_lsu_bus_buffer.scala 438:81]
  wire  _T_2016 = _T_2014 & _T_2627; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2018 = _T_2016 & _T_4456; // @[el2_lsu_bus_buffer.scala 438:123]
  wire [3:0] CmdPtr1Dec = {_T_2051,_T_2040,_T_2029,_T_2018}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 443:31]
  wire  _T_1226 = _T_1225 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 345:181]
  wire [3:0] _T_1229 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1238 = _T_1042 & _T_1229[0]; // @[Mux.scala 27:72]
  wire  _T_1239 = _T_1043 & _T_1229[1]; // @[Mux.scala 27:72]
  wire  _T_1242 = _T_1238 | _T_1239; // @[Mux.scala 27:72]
  wire  _T_1240 = _T_1044 & _T_1229[2]; // @[Mux.scala 27:72]
  wire  _T_1243 = _T_1242 | _T_1240; // @[Mux.scala 27:72]
  wire  _T_1241 = _T_1045 & _T_1229[3]; // @[Mux.scala 27:72]
  wire  _T_1244 = _T_1243 | _T_1241; // @[Mux.scala 27:72]
  wire  _T_1246 = _T_1226 | _T_1244; // @[el2_lsu_bus_buffer.scala 345:197]
  wire  _T_1247 = _T_1246 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 345:269]
  wire  _T_1248 = _T_1167 & _T_1247; // @[el2_lsu_bus_buffer.scala 344:164]
  wire  _T_1249 = _T_1113 | _T_1248; // @[el2_lsu_bus_buffer.scala 342:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 407:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 408:55]
  wire  _T_4877 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 617:54]
  wire  _T_4878 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 617:75]
  wire  _T_4880 = _T_4877 ? _T_4878 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 617:39]
  wire  bus_cmd_ready = obuf_write ? _T_4880 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 617:23]
  wire  _T_1250 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 346:48]
  wire  _T_1251 = bus_cmd_ready | _T_1250; // @[el2_lsu_bus_buffer.scala 346:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1252 = _T_1251 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 346:60]
  wire  _T_1253 = _T_1249 & _T_1252; // @[el2_lsu_bus_buffer.scala 346:29]
  wire  _T_1254 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 346:77]
  wire  _T_1255 = _T_1253 & _T_1254; // @[el2_lsu_bus_buffer.scala 346:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4825 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4826 = obuf_valid & _T_4825; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4828 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4829 = obuf_merge & _T_4828; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4830 = _T_3583 | _T_4829; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4831 = ~_T_4830; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4832 = _T_4826 & _T_4831; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4869 = _T_4802 & _T_4832; // @[Mux.scala 27:72]
  wire  _T_4837 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4838 = obuf_valid & _T_4837; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4840 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4841 = obuf_merge & _T_4840; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4842 = _T_3776 | _T_4841; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4843 = ~_T_4842; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4844 = _T_4838 & _T_4843; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4870 = _T_4806 & _T_4844; // @[Mux.scala 27:72]
  wire  _T_4873 = _T_4869 | _T_4870; // @[Mux.scala 27:72]
  wire  _T_4849 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4850 = obuf_valid & _T_4849; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4852 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4853 = obuf_merge & _T_4852; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4854 = _T_3969 | _T_4853; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4855 = ~_T_4854; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4856 = _T_4850 & _T_4855; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4871 = _T_4810 & _T_4856; // @[Mux.scala 27:72]
  wire  _T_4874 = _T_4873 | _T_4871; // @[Mux.scala 27:72]
  wire  _T_4861 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 615:56]
  wire  _T_4862 = obuf_valid & _T_4861; // @[el2_lsu_bus_buffer.scala 615:38]
  wire  _T_4864 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 615:126]
  wire  _T_4865 = obuf_merge & _T_4864; // @[el2_lsu_bus_buffer.scala 615:114]
  wire  _T_4866 = _T_4162 | _T_4865; // @[el2_lsu_bus_buffer.scala 615:100]
  wire  _T_4867 = ~_T_4866; // @[el2_lsu_bus_buffer.scala 615:80]
  wire  _T_4868 = _T_4862 & _T_4867; // @[el2_lsu_bus_buffer.scala 615:78]
  wire  _T_4872 = _T_4814 & _T_4868; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4874 | _T_4872; // @[Mux.scala 27:72]
  wire  _T_1258 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 346:118]
  wire  _T_1259 = _T_1255 & _T_1258; // @[el2_lsu_bus_buffer.scala 346:116]
  wire  obuf_wr_en = _T_1259 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 346:142]
  wire  _T_1261 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 348:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 618:39]
  wire  _T_4884 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 620:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 619:39]
  wire  _T_4885 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 620:70]
  wire  _T_4886 = _T_4884 & _T_4885; // @[el2_lsu_bus_buffer.scala 620:52]
  wire  _T_4887 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 620:111]
  wire  bus_cmd_sent = _T_4886 | _T_4887; // @[el2_lsu_bus_buffer.scala 620:89]
  wire  _T_1262 = bus_cmd_sent | _T_1261; // @[el2_lsu_bus_buffer.scala 348:33]
  wire  _T_1263 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 348:65]
  wire  _T_1264 = _T_1262 & _T_1263; // @[el2_lsu_bus_buffer.scala 348:63]
  wire  _T_1265 = _T_1264 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 348:77]
  wire  obuf_rst = _T_1265 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 348:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : _T_1221; // @[el2_lsu_bus_buffer.scala 349:26]
  wire [31:0] _T_1302 = _T_1042 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1303 = _T_1043 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1304 = _T_1044 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1305 = _T_1045 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1306 = _T_1302 | _T_1303; // @[Mux.scala 27:72]
  wire [31:0] _T_1307 = _T_1306 | _T_1304; // @[Mux.scala 27:72]
  wire [31:0] _T_1308 = _T_1307 | _T_1305; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1308; // @[el2_lsu_bus_buffer.scala 351:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1315 = _T_1042 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1316 = _T_1043 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1317 = _T_1044 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1318 = _T_1045 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1319 = _T_1315 | _T_1316; // @[Mux.scala 27:72]
  wire [1:0] _T_1320 = _T_1319 | _T_1317; // @[Mux.scala 27:72]
  wire [1:0] _T_1321 = _T_1320 | _T_1318; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1321; // @[el2_lsu_bus_buffer.scala 354:23]
  wire  _T_1323 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 363:39]
  wire  _T_1324 = ~_T_1323; // @[el2_lsu_bus_buffer.scala 363:26]
  wire  _T_1330 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 367:72]
  wire  _T_1333 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 367:98]
  wire  _T_1334 = obuf_sz_in[0] & _T_1333; // @[el2_lsu_bus_buffer.scala 367:96]
  wire  _T_1335 = _T_1330 | _T_1334; // @[el2_lsu_bus_buffer.scala 367:79]
  wire  _T_1338 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 367:153]
  wire  _T_1339 = ~_T_1338; // @[el2_lsu_bus_buffer.scala 367:134]
  wire  _T_1340 = obuf_sz_in[1] & _T_1339; // @[el2_lsu_bus_buffer.scala 367:132]
  wire  _T_1341 = _T_1335 | _T_1340; // @[el2_lsu_bus_buffer.scala 367:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1341; // @[el2_lsu_bus_buffer.scala 367:28]
  wire  _T_1358 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 381:40]
  wire  _T_1359 = _T_1358 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 381:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1360 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 381:80]
  wire  _T_1361 = _T_1359 & _T_1360; // @[el2_lsu_bus_buffer.scala 381:78]
  wire  _T_1362 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 381:99]
  wire  _T_1363 = _T_1361 & _T_1362; // @[el2_lsu_bus_buffer.scala 381:97]
  wire  _T_1364 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 381:113]
  wire  _T_1365 = _T_1363 & _T_1364; // @[el2_lsu_bus_buffer.scala 381:111]
  wire  _T_1366 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 381:130]
  wire  _T_1367 = _T_1365 & _T_1366; // @[el2_lsu_bus_buffer.scala 381:128]
  wire  _T_1368 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 382:20]
  wire  _T_1369 = obuf_valid & _T_1368; // @[el2_lsu_bus_buffer.scala 382:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 409:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 621:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 410:55]
  wire  _T_1370 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 382:90]
  wire  _T_1371 = bus_rsp_read & _T_1370; // @[el2_lsu_bus_buffer.scala 382:70]
  wire  _T_1372 = ~_T_1371; // @[el2_lsu_bus_buffer.scala 382:55]
  wire  _T_1373 = obuf_rdrsp_pend & _T_1372; // @[el2_lsu_bus_buffer.scala 382:53]
  wire  _T_1374 = _T_1369 | _T_1373; // @[el2_lsu_bus_buffer.scala 382:34]
  wire  obuf_nosend_in = _T_1367 & _T_1374; // @[el2_lsu_bus_buffer.scala 381:165]
  wire  _T_1342 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 375:44]
  wire  _T_1343 = obuf_wr_en & _T_1342; // @[el2_lsu_bus_buffer.scala 375:42]
  wire  _T_1344 = ~_T_1343; // @[el2_lsu_bus_buffer.scala 375:29]
  wire  _T_1345 = _T_1344 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 375:61]
  wire  _T_1349 = _T_1345 & _T_1372; // @[el2_lsu_bus_buffer.scala 375:79]
  wire  _T_1351 = bus_cmd_sent & _T_1362; // @[el2_lsu_bus_buffer.scala 376:20]
  wire  _T_1352 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 376:37]
  wire  _T_1353 = _T_1351 & _T_1352; // @[el2_lsu_bus_buffer.scala 376:35]
  wire  _T_1355 = bus_cmd_sent | _T_1362; // @[el2_lsu_bus_buffer.scala 378:44]
  wire [7:0] _T_1377 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1378 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1379 = io_lsu_addr_r[2] ? _T_1377 : _T_1378; // @[el2_lsu_bus_buffer.scala 383:46]
  wire [3:0] _T_1398 = _T_1042 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1399 = _T_1043 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1400 = _T_1044 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1401 = _T_1045 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1402 = _T_1398 | _T_1399; // @[Mux.scala 27:72]
  wire [3:0] _T_1403 = _T_1402 | _T_1400; // @[Mux.scala 27:72]
  wire [3:0] _T_1404 = _T_1403 | _T_1401; // @[Mux.scala 27:72]
  wire [7:0] _T_1406 = {_T_1404,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1419 = {4'h0,_T_1404}; // @[Cat.scala 29:58]
  wire [7:0] _T_1420 = _T_1308[2] ? _T_1406 : _T_1419; // @[el2_lsu_bus_buffer.scala 384:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1379 : _T_1420; // @[el2_lsu_bus_buffer.scala 383:28]
  wire [7:0] _T_1422 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1423 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1424 = io_end_addr_r[2] ? _T_1422 : _T_1423; // @[el2_lsu_bus_buffer.scala 385:46]
  wire [7:0] _T_1451 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1464 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1465 = buf_addr_0[2] ? _T_1451 : _T_1464; // @[el2_lsu_bus_buffer.scala 386:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1424 : _T_1465; // @[el2_lsu_bus_buffer.scala 385:28]
  wire [63:0] _T_1467 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1468 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1469 = io_lsu_addr_r[2] ? _T_1467 : _T_1468; // @[el2_lsu_bus_buffer.scala 388:44]
  wire [31:0] _T_1488 = _T_1042 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1489 = _T_1043 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1490 = _T_1044 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1491 = _T_1045 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1492 = _T_1488 | _T_1489; // @[Mux.scala 27:72]
  wire [31:0] _T_1493 = _T_1492 | _T_1490; // @[Mux.scala 27:72]
  wire [31:0] _T_1494 = _T_1493 | _T_1491; // @[Mux.scala 27:72]
  wire [63:0] _T_1496 = {_T_1494,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1509 = {32'h0,_T_1494}; // @[Cat.scala 29:58]
  wire [63:0] _T_1510 = _T_1308[2] ? _T_1496 : _T_1509; // @[el2_lsu_bus_buffer.scala 389:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1469 : _T_1510; // @[el2_lsu_bus_buffer.scala 388:26]
  wire [63:0] _T_1512 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1513 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1514 = io_lsu_addr_r[2] ? _T_1512 : _T_1513; // @[el2_lsu_bus_buffer.scala 390:44]
  wire [63:0] _T_1541 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1554 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1555 = buf_addr_0[2] ? _T_1541 : _T_1554; // @[el2_lsu_bus_buffer.scala 391:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1514 : _T_1555; // @[el2_lsu_bus_buffer.scala 390:26]
  wire  _T_1640 = CmdPtr0 != 2'h0; // @[el2_lsu_bus_buffer.scala 397:30]
  wire  _T_1641 = _T_1640 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 397:43]
  wire  _T_1642 = _T_1641 & found_cmdptr1; // @[el2_lsu_bus_buffer.scala 397:59]
  wire  _T_1656 = _T_1642 & _T_1126; // @[el2_lsu_bus_buffer.scala 397:75]
  wire  _T_1670 = _T_1656 & _T_2627; // @[el2_lsu_bus_buffer.scala 397:118]
  wire  _T_1691 = _T_1670 & _T_1147; // @[el2_lsu_bus_buffer.scala 397:161]
  wire  _T_1709 = _T_1691 & _T_1072; // @[el2_lsu_bus_buffer.scala 398:83]
  wire  _T_1811 = _T_1223 & _T_1185; // @[el2_lsu_bus_buffer.scala 401:36]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1814 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1823 = _T_1042 & _T_1814[0]; // @[Mux.scala 27:72]
  wire  _T_1824 = _T_1043 & _T_1814[1]; // @[Mux.scala 27:72]
  wire  _T_1827 = _T_1823 | _T_1824; // @[Mux.scala 27:72]
  wire  _T_1825 = _T_1044 & _T_1814[2]; // @[Mux.scala 27:72]
  wire  _T_1828 = _T_1827 | _T_1825; // @[Mux.scala 27:72]
  wire  _T_1826 = _T_1045 & _T_1814[3]; // @[Mux.scala 27:72]
  wire  _T_1829 = _T_1828 | _T_1826; // @[Mux.scala 27:72]
  wire  _T_1831 = ~_T_1829; // @[el2_lsu_bus_buffer.scala 401:107]
  wire  _T_1832 = _T_1811 & _T_1831; // @[el2_lsu_bus_buffer.scala 401:105]
  wire  _T_1852 = _T_1832 & _T_1204; // @[el2_lsu_bus_buffer.scala 401:177]
  wire  _T_1854 = _T_1709 & _T_1852; // @[el2_lsu_bus_buffer.scala 398:120]
  wire  _T_1855 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 402:19]
  wire  _T_1856 = _T_1855 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 402:35]
  wire  obuf_merge_en = _T_1854 | _T_1856; // @[el2_lsu_bus_buffer.scala 401:251]
  wire  _T_1558 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1559 = obuf_byteen0_in[0] | _T_1558; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1562 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1563 = obuf_byteen0_in[1] | _T_1562; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1566 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1567 = obuf_byteen0_in[2] | _T_1566; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1570 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1571 = obuf_byteen0_in[3] | _T_1570; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1574 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1575 = obuf_byteen0_in[4] | _T_1574; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1578 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1579 = obuf_byteen0_in[5] | _T_1578; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1582 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1583 = obuf_byteen0_in[6] | _T_1582; // @[el2_lsu_bus_buffer.scala 392:63]
  wire  _T_1586 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 392:80]
  wire  _T_1587 = obuf_byteen0_in[7] | _T_1586; // @[el2_lsu_bus_buffer.scala 392:63]
  wire [7:0] obuf_byteen_in = {_T_1587,_T_1583,_T_1579,_T_1575,_T_1571,_T_1567,_T_1563,_T_1559}; // @[Cat.scala 29:58]
  wire [7:0] _T_1598 = _T_1558 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1603 = _T_1562 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1608 = _T_1566 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1613 = _T_1570 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1618 = _T_1574 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1623 = _T_1578 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1628 = _T_1582 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [7:0] _T_1633 = _T_1586 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 393:44]
  wire [55:0] _T_1639 = {_T_1633,_T_1628,_T_1623,_T_1618,_T_1613,_T_1608,_T_1603}; // @[Cat.scala 29:58]
  wire  _T_1858 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 405:58]
  wire  _T_1859 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 405:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 491:16]
  wire  _T_1872 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1873 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1874 = ibuf_valid & _T_1873; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1875 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1876 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1877 = io_ldst_dual_r & _T_1876; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1878 = _T_1875 | _T_1877; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1879 = io_lsu_busreq_r & _T_1878; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1880 = _T_1874 | _T_1879; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1881 = ~_T_1880; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1882 = _T_1872 & _T_1881; // @[el2_lsu_bus_buffer.scala 423:76]
  wire  _T_1883 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1884 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1885 = ibuf_valid & _T_1884; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1886 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1887 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1888 = io_ldst_dual_r & _T_1887; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1889 = _T_1886 | _T_1888; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1890 = io_lsu_busreq_r & _T_1889; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1891 = _T_1885 | _T_1890; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1892 = ~_T_1891; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1893 = _T_1883 & _T_1892; // @[el2_lsu_bus_buffer.scala 423:76]
  wire  _T_1894 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1895 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1896 = ibuf_valid & _T_1895; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1897 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1898 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1899 = io_ldst_dual_r & _T_1898; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1900 = _T_1897 | _T_1899; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1901 = io_lsu_busreq_r & _T_1900; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1902 = _T_1896 | _T_1901; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1903 = ~_T_1902; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1904 = _T_1894 & _T_1903; // @[el2_lsu_bus_buffer.scala 423:76]
  wire  _T_1905 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 423:65]
  wire  _T_1906 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 423:103]
  wire  _T_1907 = ibuf_valid & _T_1906; // @[el2_lsu_bus_buffer.scala 423:92]
  wire  _T_1908 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 424:35]
  wire  _T_1909 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 425:33]
  wire  _T_1910 = io_ldst_dual_r & _T_1909; // @[el2_lsu_bus_buffer.scala 425:21]
  wire  _T_1911 = _T_1908 | _T_1910; // @[el2_lsu_bus_buffer.scala 424:44]
  wire  _T_1912 = io_lsu_busreq_r & _T_1911; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1913 = _T_1907 | _T_1912; // @[el2_lsu_bus_buffer.scala 423:112]
  wire  _T_1914 = ~_T_1913; // @[el2_lsu_bus_buffer.scala 423:78]
  wire  _T_1915 = _T_1905 & _T_1914; // @[el2_lsu_bus_buffer.scala 423:76]
  wire [1:0] _T_1916 = _T_1915 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1917 = _T_1904 ? 2'h2 : _T_1916; // @[Mux.scala 98:16]
  wire [1:0] _T_1918 = _T_1893 ? 2'h1 : _T_1917; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1882 ? 2'h0 : _T_1918; // @[Mux.scala 98:16]
  wire [8:0] _T_1921 = {buf_state_0,buf_state_1,buf_state_2}; // @[Cat.scala 29:58]
  wire  _T_1926 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1927 = io_lsu_busreq_m & _T_1926; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1928 = _T_1874 | _T_1927; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1934 = _T_1928 | _T_1879; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1935 = ~_T_1934; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1936 = _T_1872 & _T_1935; // @[el2_lsu_bus_buffer.scala 428:79]
  wire  _T_1940 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1941 = io_lsu_busreq_m & _T_1940; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1942 = _T_1885 | _T_1941; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1948 = _T_1942 | _T_1890; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1949 = ~_T_1948; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1950 = _T_1883 & _T_1949; // @[el2_lsu_bus_buffer.scala 428:79]
  wire  _T_1954 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1955 = io_lsu_busreq_m & _T_1954; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1956 = _T_1896 | _T_1955; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1962 = _T_1956 | _T_1901; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1963 = ~_T_1962; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1964 = _T_1894 & _T_1963; // @[el2_lsu_bus_buffer.scala 428:79]
  wire  _T_1968 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 429:33]
  wire  _T_1969 = io_lsu_busreq_m & _T_1968; // @[el2_lsu_bus_buffer.scala 429:22]
  wire  _T_1970 = _T_1907 | _T_1969; // @[el2_lsu_bus_buffer.scala 428:115]
  wire  _T_1976 = _T_1970 | _T_1912; // @[el2_lsu_bus_buffer.scala 429:42]
  wire  _T_1977 = ~_T_1976; // @[el2_lsu_bus_buffer.scala 428:81]
  wire  _T_1978 = _T_1905 & _T_1977; // @[el2_lsu_bus_buffer.scala 428:79]
  wire [1:0] _T_1979 = _T_1978 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1980 = _T_1964 ? 2'h2 : _T_1979; // @[Mux.scala 98:16]
  wire [1:0] _T_1981 = _T_1950 ? 2'h1 : _T_1980; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2767 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2768 = buf_rspageQ_0[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2764 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2765 = buf_rspageQ_0[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2761 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2762 = buf_rspageQ_0[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2758 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_2759 = buf_rspageQ_0[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2768,_T_2765,_T_2762,_T_2759}; // @[Cat.scala 29:58]
  wire  _T_2054 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2055 = ~_T_2054; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2057 = _T_2055 & _T_2758; // @[el2_lsu_bus_buffer.scala 441:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2783 = buf_rspageQ_1[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2780 = buf_rspageQ_1[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2777 = buf_rspageQ_1[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2774 = buf_rspageQ_1[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2783,_T_2780,_T_2777,_T_2774}; // @[Cat.scala 29:58]
  wire  _T_2058 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2059 = ~_T_2058; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2061 = _T_2059 & _T_2761; // @[el2_lsu_bus_buffer.scala 441:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2798 = buf_rspageQ_2[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2795 = buf_rspageQ_2[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2792 = buf_rspageQ_2[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2789 = buf_rspageQ_2[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2798,_T_2795,_T_2792,_T_2789}; // @[Cat.scala 29:58]
  wire  _T_2062 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2063 = ~_T_2062; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2065 = _T_2063 & _T_2764; // @[el2_lsu_bus_buffer.scala 441:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 561:63]
  wire  _T_2813 = buf_rspageQ_3[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2810 = buf_rspageQ_3[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2807 = buf_rspageQ_3[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_2804 = buf_rspageQ_3[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 474:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2813,_T_2810,_T_2807,_T_2804}; // @[Cat.scala 29:58]
  wire  _T_2066 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 441:65]
  wire  _T_2067 = ~_T_2066; // @[el2_lsu_bus_buffer.scala 441:44]
  wire  _T_2069 = _T_2067 & _T_2767; // @[el2_lsu_bus_buffer.scala 441:70]
  wire [7:0] _T_2125 = {4'h0,_T_2069,_T_2065,_T_2061,_T_2057}; // @[Cat.scala 29:58]
  wire  _T_2128 = _T_2125[4] | _T_2125[5]; // @[el2_lsu_bus_buffer.scala 445:42]
  wire  _T_2130 = _T_2128 | _T_2125[6]; // @[el2_lsu_bus_buffer.scala 445:48]
  wire  _T_2132 = _T_2130 | _T_2125[7]; // @[el2_lsu_bus_buffer.scala 445:54]
  wire  _T_2135 = _T_2125[2] | _T_2125[3]; // @[el2_lsu_bus_buffer.scala 445:67]
  wire  _T_2137 = _T_2135 | _T_2125[6]; // @[el2_lsu_bus_buffer.scala 445:73]
  wire  _T_2139 = _T_2137 | _T_2125[7]; // @[el2_lsu_bus_buffer.scala 445:79]
  wire  _T_2142 = _T_2125[1] | _T_2125[3]; // @[el2_lsu_bus_buffer.scala 445:92]
  wire  _T_2144 = _T_2142 | _T_2125[5]; // @[el2_lsu_bus_buffer.scala 445:98]
  wire  _T_2146 = _T_2144 | _T_2125[7]; // @[el2_lsu_bus_buffer.scala 445:104]
  wire [2:0] _T_2148 = {_T_2132,_T_2139,_T_2146}; // @[Cat.scala 29:58]
  wire  _T_3553 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 504:77]
  wire  _T_3554 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 504:97]
  wire  _T_3555 = _T_3553 & _T_3554; // @[el2_lsu_bus_buffer.scala 504:95]
  wire  _T_3556 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_3557 = _T_3555 & _T_3556; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_3558 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 504:144]
  wire  _T_3559 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_3560 = _T_3558 & _T_3559; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_3561 = _T_3557 | _T_3560; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_3562 = _T_851 & _T_3561; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_3563 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_3564 = ibuf_drain_vld & _T_3563; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_3565 = _T_3562 | _T_3564; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_3575 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 511:46]
  wire  _T_3610 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 622:38]
  wire  _T_3655 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_3656 = bus_rsp_write & _T_3655; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_3657 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 530:46]
  reg  _T_4328; // @[Reg.scala 27:20]
  reg  _T_4326; // @[Reg.scala 27:20]
  reg  _T_4324; // @[Reg.scala 27:20]
  reg  _T_4322; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4328,_T_4326,_T_4324,_T_4322}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_370 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3659 = io_lsu_axi_rid == _GEN_370; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3660 = buf_ldfwd[0] & _T_3659; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_3661 = _T_3657 | _T_3660; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_3662 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_3664 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_3665 = _T_3662 & _T_3664; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_3666 = _T_3665 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_371 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3667 = io_lsu_axi_rid == _GEN_371; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3668 = _T_3666 & _T_3667; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_3669 = _T_3661 | _T_3668; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_3670 = bus_rsp_read & _T_3669; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_3671 = _T_3656 | _T_3670; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_42 = _T_3610 & _T_3671; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3576 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3572 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3549 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3697 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3707 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 544:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_373 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3709 = io_lsu_axi_rid == _GEN_373; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3710 = _T_3707[0] & _T_3709; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_3711 = _T_3667 | _T_3710; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_3712 = bus_rsp_read & _T_3711; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_36 = _T_3697 & _T_3712; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3610 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3576 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3572 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3549 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3589 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_3590 = _T_3589 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_3715 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2148[1:0]; // @[el2_lsu_bus_buffer.scala 454:10]
  wire  _T_3718 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_3719 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_3720 = buf_dual_0 & _T_3719; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_3721 = _T_3718 | _T_3720; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_3722 = _T_3721 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_3723 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3715 ? _T_3722 : _T_3723; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3697 ? _T_3590 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3610 ? _T_3590 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3576 ? _T_3590 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3572 ? _T_3575 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3549 ? _T_3565 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2150 = _T_1872 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2156 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 468:23]
  wire  _T_2158 = _T_2156 & _T_3553; // @[el2_lsu_bus_buffer.scala 468:41]
  wire  _T_2160 = _T_2158 & _T_1875; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2162 = _T_2160 & _T_1873; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2163 = _T_4495 | _T_2162; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2164 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 469:17]
  wire  _T_2165 = _T_2164 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 469:35]
  wire  _T_2167 = _T_2165 & _T_1876; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2169 = _T_2167 & _T_1875; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2170 = _T_2163 | _T_2169; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2171 = _T_2150 & _T_2170; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2173 = _T_2171 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2187 = _T_2160 & _T_1884; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2188 = _T_4500 | _T_2187; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2194 = _T_2167 & _T_1886; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2195 = _T_2188 | _T_2194; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2196 = _T_2150 & _T_2195; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2198 = _T_2196 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2212 = _T_2160 & _T_1895; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2213 = _T_4505 | _T_2212; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2219 = _T_2167 & _T_1897; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2220 = _T_2213 | _T_2219; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2221 = _T_2150 & _T_2220; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2223 = _T_2221 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2237 = _T_2160 & _T_1906; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2238 = _T_4510 | _T_2237; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2244 = _T_2167 & _T_1908; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2245 = _T_2238 | _T_2244; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2246 = _T_2150 & _T_2245; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2248 = _T_2246 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2250 = {_T_2248,_T_2223,_T_2198}; // @[Cat.scala 29:58]
  wire  _T_3749 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_3750 = _T_3555 & _T_3749; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_3752 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_3753 = _T_3558 & _T_3752; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_3754 = _T_3750 | _T_3753; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_3755 = _T_851 & _T_3754; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_3756 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_3757 = ibuf_drain_vld & _T_3756; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_3758 = _T_3755 | _T_3757; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_3803 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3848 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_3849 = bus_rsp_write & _T_3848; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_3850 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 530:46]
  wire [2:0] _GEN_374 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3852 = io_lsu_axi_rid == _GEN_374; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_3853 = buf_ldfwd[1] & _T_3852; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_3854 = _T_3850 | _T_3853; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_3855 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_3857 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_3858 = _T_3855 & _T_3857; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_3859 = _T_3858 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_375 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3860 = io_lsu_axi_rid == _GEN_375; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_3861 = _T_3859 & _T_3860; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_3862 = _T_3854 | _T_3861; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_3863 = bus_rsp_read & _T_3862; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_3864 = _T_3849 | _T_3863; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_118 = _T_3803 & _T_3864; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3769 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3765 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3742 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3890 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3900 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 544:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_377 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3902 = io_lsu_axi_rid == _GEN_377; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_3903 = _T_3900[0] & _T_3902; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_3904 = _T_3860 | _T_3903; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_3905 = bus_rsp_read & _T_3904; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_112 = _T_3890 & _T_3905; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3803 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3769 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3765 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3742 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3782 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_3783 = _T_3782 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_3908 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3911 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_3912 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_3913 = buf_dual_1 & _T_3912; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_3914 = _T_3911 | _T_3913; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_3915 = _T_3914 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_3916 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3908 ? _T_3915 : _T_3916; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3890 ? _T_3783 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3803 ? _T_3783 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3769 ? _T_3783 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3765 ? _T_3575 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3742 ? _T_3758 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2252 = _T_1883 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2262 = _T_2158 & _T_1886; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2264 = _T_2262 & _T_1873; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2265 = _T_4495 | _T_2264; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2269 = _T_2165 & _T_1887; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2271 = _T_2269 & _T_1875; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2272 = _T_2265 | _T_2271; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2273 = _T_2252 & _T_2272; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2275 = _T_2273 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2289 = _T_2262 & _T_1884; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2290 = _T_4500 | _T_2289; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2296 = _T_2269 & _T_1886; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2297 = _T_2290 | _T_2296; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2298 = _T_2252 & _T_2297; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2300 = _T_2298 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2314 = _T_2262 & _T_1895; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2315 = _T_4505 | _T_2314; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2321 = _T_2269 & _T_1897; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2322 = _T_2315 | _T_2321; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2323 = _T_2252 & _T_2322; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2325 = _T_2323 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2339 = _T_2262 & _T_1906; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2340 = _T_4510 | _T_2339; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2346 = _T_2269 & _T_1908; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2347 = _T_2340 | _T_2346; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2348 = _T_2252 & _T_2347; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2350 = _T_2348 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2352 = {_T_2350,_T_2325,_T_2300}; // @[Cat.scala 29:58]
  wire  _T_3942 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_3943 = _T_3555 & _T_3942; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_3945 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_3946 = _T_3558 & _T_3945; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_3947 = _T_3943 | _T_3946; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_3948 = _T_851 & _T_3947; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_3949 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_3950 = ibuf_drain_vld & _T_3949; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_3951 = _T_3948 | _T_3950; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_3996 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4041 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_4042 = bus_rsp_write & _T_4041; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_4043 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 530:46]
  wire [2:0] _GEN_378 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4045 = io_lsu_axi_rid == _GEN_378; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4046 = buf_ldfwd[2] & _T_4045; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_4047 = _T_4043 | _T_4046; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_4048 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_4050 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_4051 = _T_4048 & _T_4050; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_4052 = _T_4051 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_379 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4053 = io_lsu_axi_rid == _GEN_379; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4054 = _T_4052 & _T_4053; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_4055 = _T_4047 | _T_4054; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_4056 = bus_rsp_read & _T_4055; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_4057 = _T_4042 | _T_4056; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_194 = _T_3996 & _T_4057; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3962 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3958 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3935 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4083 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4093 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 544:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_381 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4095 = io_lsu_axi_rid == _GEN_381; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4096 = _T_4093[0] & _T_4095; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_4097 = _T_4053 | _T_4096; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_4098 = bus_rsp_read & _T_4097; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_188 = _T_4083 & _T_4098; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3996 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3962 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3958 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3935 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3975 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_3976 = _T_3975 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_4101 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4104 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_4105 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_4106 = buf_dual_2 & _T_4105; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_4107 = _T_4104 | _T_4106; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4108 = _T_4107 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_4109 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4101 ? _T_4108 : _T_4109; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4083 ? _T_3976 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3996 ? _T_3976 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3962 ? _T_3976 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3958 ? _T_3575 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3935 ? _T_3951 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2354 = _T_1894 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2364 = _T_2158 & _T_1897; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2366 = _T_2364 & _T_1873; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2367 = _T_4495 | _T_2366; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2371 = _T_2165 & _T_1898; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2373 = _T_2371 & _T_1875; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2374 = _T_2367 | _T_2373; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2375 = _T_2354 & _T_2374; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2377 = _T_2375 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2391 = _T_2364 & _T_1884; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2392 = _T_4500 | _T_2391; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2398 = _T_2371 & _T_1886; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2399 = _T_2392 | _T_2398; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2400 = _T_2354 & _T_2399; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2402 = _T_2400 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2416 = _T_2364 & _T_1895; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2417 = _T_4505 | _T_2416; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2423 = _T_2371 & _T_1897; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2424 = _T_2417 | _T_2423; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2425 = _T_2354 & _T_2424; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2427 = _T_2425 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2441 = _T_2364 & _T_1906; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2442 = _T_4510 | _T_2441; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2448 = _T_2371 & _T_1908; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2449 = _T_2442 | _T_2448; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2450 = _T_2354 & _T_2449; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2452 = _T_2450 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2454 = {_T_2452,_T_2427,_T_2402}; // @[Cat.scala 29:58]
  wire  _T_4135 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 504:117]
  wire  _T_4136 = _T_3555 & _T_4135; // @[el2_lsu_bus_buffer.scala 504:112]
  wire  _T_4138 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 504:166]
  wire  _T_4139 = _T_3558 & _T_4138; // @[el2_lsu_bus_buffer.scala 504:161]
  wire  _T_4140 = _T_4136 | _T_4139; // @[el2_lsu_bus_buffer.scala 504:132]
  wire  _T_4141 = _T_851 & _T_4140; // @[el2_lsu_bus_buffer.scala 504:63]
  wire  _T_4142 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 504:206]
  wire  _T_4143 = ibuf_drain_vld & _T_4142; // @[el2_lsu_bus_buffer.scala 504:201]
  wire  _T_4144 = _T_4141 | _T_4143; // @[el2_lsu_bus_buffer.scala 504:183]
  wire  _T_4189 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4234 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 529:73]
  wire  _T_4235 = bus_rsp_write & _T_4234; // @[el2_lsu_bus_buffer.scala 529:52]
  wire  _T_4236 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 530:46]
  wire [2:0] _GEN_382 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4238 = io_lsu_axi_rid == _GEN_382; // @[el2_lsu_bus_buffer.scala 531:47]
  wire  _T_4239 = buf_ldfwd[3] & _T_4238; // @[el2_lsu_bus_buffer.scala 531:27]
  wire  _T_4240 = _T_4236 | _T_4239; // @[el2_lsu_bus_buffer.scala 530:77]
  wire  _T_4241 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 532:26]
  wire  _T_4243 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 532:44]
  wire  _T_4244 = _T_4241 & _T_4243; // @[el2_lsu_bus_buffer.scala 532:42]
  wire  _T_4245 = _T_4244 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 532:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_383 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4246 = io_lsu_axi_rid == _GEN_383; // @[el2_lsu_bus_buffer.scala 532:94]
  wire  _T_4247 = _T_4245 & _T_4246; // @[el2_lsu_bus_buffer.scala 532:74]
  wire  _T_4248 = _T_4240 | _T_4247; // @[el2_lsu_bus_buffer.scala 531:71]
  wire  _T_4249 = bus_rsp_read & _T_4248; // @[el2_lsu_bus_buffer.scala 530:25]
  wire  _T_4250 = _T_4235 | _T_4249; // @[el2_lsu_bus_buffer.scala 529:105]
  wire  _GEN_270 = _T_4189 & _T_4250; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4155 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4151 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4128 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4276 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4286 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 544:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 544:58]
  wire [2:0] _GEN_385 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4288 = io_lsu_axi_rid == _GEN_385; // @[el2_lsu_bus_buffer.scala 544:58]
  wire  _T_4289 = _T_4286[0] & _T_4288; // @[el2_lsu_bus_buffer.scala 544:38]
  wire  _T_4290 = _T_4246 | _T_4289; // @[el2_lsu_bus_buffer.scala 543:95]
  wire  _T_4291 = bus_rsp_read & _T_4290; // @[el2_lsu_bus_buffer.scala 543:45]
  wire  _GEN_264 = _T_4276 & _T_4291; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4189 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4155 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4151 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4128 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4168 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 517:49]
  wire  _T_4169 = _T_4168 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 517:70]
  wire  _T_4294 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4297 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 549:37]
  wire  _T_4298 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 549:98]
  wire  _T_4299 = buf_dual_3 & _T_4298; // @[el2_lsu_bus_buffer.scala 549:80]
  wire  _T_4300 = _T_4297 | _T_4299; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4301 = _T_4300 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 549:112]
  wire  _T_4302 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4294 ? _T_4301 : _T_4302; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4276 ? _T_4169 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4189 ? _T_4169 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4155 ? _T_4169 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4151 ? _T_3575 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4128 ? _T_4144 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2456 = _T_1905 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 466:94]
  wire  _T_2466 = _T_2158 & _T_1908; // @[el2_lsu_bus_buffer.scala 468:71]
  wire  _T_2468 = _T_2466 & _T_1873; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2469 = _T_4495 | _T_2468; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2473 = _T_2165 & _T_1909; // @[el2_lsu_bus_buffer.scala 469:52]
  wire  _T_2475 = _T_2473 & _T_1875; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2476 = _T_2469 | _T_2475; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2477 = _T_2456 & _T_2476; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2479 = _T_2477 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2493 = _T_2466 & _T_1884; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2494 = _T_4500 | _T_2493; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2500 = _T_2473 & _T_1886; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2501 = _T_2494 | _T_2500; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2502 = _T_2456 & _T_2501; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2504 = _T_2502 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2518 = _T_2466 & _T_1895; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2519 = _T_4505 | _T_2518; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2525 = _T_2473 & _T_1897; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2526 = _T_2519 | _T_2525; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2527 = _T_2456 & _T_2526; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2529 = _T_2527 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire  _T_2543 = _T_2466 & _T_1906; // @[el2_lsu_bus_buffer.scala 468:92]
  wire  _T_2544 = _T_4510 | _T_2543; // @[el2_lsu_bus_buffer.scala 467:86]
  wire  _T_2550 = _T_2473 & _T_1908; // @[el2_lsu_bus_buffer.scala 469:73]
  wire  _T_2551 = _T_2544 | _T_2550; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2552 = _T_2456 & _T_2551; // @[el2_lsu_bus_buffer.scala 466:113]
  wire  _T_2554 = _T_2552 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 469:97]
  wire [2:0] _T_2556 = {_T_2554,_T_2529,_T_2504}; // @[Cat.scala 29:58]
  wire  _T_2820 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2821 = _T_1872 | _T_2820; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2822 = ~_T_2821; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2830 = _T_2822 | _T_2162; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2837 = _T_2830 | _T_2169; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2838 = _T_2150 & _T_2837; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2842 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2843 = _T_1883 | _T_2842; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2844 = ~_T_2843; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2852 = _T_2844 | _T_2187; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2859 = _T_2852 | _T_2194; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2860 = _T_2150 & _T_2859; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2864 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2865 = _T_1894 | _T_2864; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2866 = ~_T_2865; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2874 = _T_2866 | _T_2212; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2881 = _T_2874 | _T_2219; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2882 = _T_2150 & _T_2881; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2886 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_2887 = _T_1905 | _T_2886; // @[el2_lsu_bus_buffer.scala 477:34]
  wire  _T_2888 = ~_T_2887; // @[el2_lsu_bus_buffer.scala 477:8]
  wire  _T_2896 = _T_2888 | _T_2237; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2903 = _T_2896 | _T_2244; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2904 = _T_2150 & _T_2903; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_0 = {_T_2904,_T_2882,_T_2860,_T_2838}; // @[Cat.scala 29:58]
  wire  _T_2921 = _T_2822 | _T_2264; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2928 = _T_2921 | _T_2271; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2929 = _T_2252 & _T_2928; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2943 = _T_2844 | _T_2289; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2950 = _T_2943 | _T_2296; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2951 = _T_2252 & _T_2950; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2965 = _T_2866 | _T_2314; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2972 = _T_2965 | _T_2321; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2973 = _T_2252 & _T_2972; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_2987 = _T_2888 | _T_2339; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_2994 = _T_2987 | _T_2346; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_2995 = _T_2252 & _T_2994; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_1 = {_T_2995,_T_2973,_T_2951,_T_2929}; // @[Cat.scala 29:58]
  wire  _T_3012 = _T_2822 | _T_2366; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3019 = _T_3012 | _T_2373; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3020 = _T_2354 & _T_3019; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3034 = _T_2844 | _T_2391; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3041 = _T_3034 | _T_2398; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3042 = _T_2354 & _T_3041; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3056 = _T_2866 | _T_2416; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3063 = _T_3056 | _T_2423; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3064 = _T_2354 & _T_3063; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3078 = _T_2888 | _T_2441; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3085 = _T_3078 | _T_2448; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3086 = _T_2354 & _T_3085; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_2 = {_T_3086,_T_3064,_T_3042,_T_3020}; // @[Cat.scala 29:58]
  wire  _T_3103 = _T_2822 | _T_2468; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3110 = _T_3103 | _T_2475; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3111 = _T_2456 & _T_3110; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3125 = _T_2844 | _T_2493; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3132 = _T_3125 | _T_2500; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3133 = _T_2456 & _T_3132; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3147 = _T_2866 | _T_2518; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3154 = _T_3147 | _T_2525; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3155 = _T_2456 & _T_3154; // @[el2_lsu_bus_buffer.scala 476:114]
  wire  _T_3169 = _T_2888 | _T_2543; // @[el2_lsu_bus_buffer.scala 477:61]
  wire  _T_3176 = _T_3169 | _T_2550; // @[el2_lsu_bus_buffer.scala 478:112]
  wire  _T_3177 = _T_2456 & _T_3176; // @[el2_lsu_bus_buffer.scala 476:114]
  wire [3:0] buf_rspage_set_3 = {_T_3177,_T_3155,_T_3133,_T_3111}; // @[Cat.scala 29:58]
  wire  _T_3262 = _T_2886 | _T_1905; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3263 = ~_T_3262; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3264 = buf_rspageQ_0[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3256 = _T_2864 | _T_1894; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3257 = ~_T_3256; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3258 = buf_rspageQ_0[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3250 = _T_2842 | _T_1883; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3251 = ~_T_3250; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3252 = buf_rspageQ_0[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3244 = _T_2820 | _T_1872; // @[el2_lsu_bus_buffer.scala 481:112]
  wire  _T_3245 = ~_T_3244; // @[el2_lsu_bus_buffer.scala 481:86]
  wire  _T_3246 = buf_rspageQ_0[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_0 = {_T_3264,_T_3258,_T_3252,_T_3246}; // @[Cat.scala 29:58]
  wire  _T_3183 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3186 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3189 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3192 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3194 = {_T_3192,_T_3189,_T_3186}; // @[Cat.scala 29:58]
  wire  _T_3291 = buf_rspageQ_1[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3285 = buf_rspageQ_1[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3279 = buf_rspageQ_1[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3273 = buf_rspageQ_1[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_1 = {_T_3291,_T_3285,_T_3279,_T_3273}; // @[Cat.scala 29:58]
  wire  _T_3198 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3201 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3204 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3207 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3209 = {_T_3207,_T_3204,_T_3201}; // @[Cat.scala 29:58]
  wire  _T_3318 = buf_rspageQ_2[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3312 = buf_rspageQ_2[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3306 = buf_rspageQ_2[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3300 = buf_rspageQ_2[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_2 = {_T_3318,_T_3312,_T_3306,_T_3300}; // @[Cat.scala 29:58]
  wire  _T_3213 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3216 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3219 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3222 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3224 = {_T_3222,_T_3219,_T_3216}; // @[Cat.scala 29:58]
  wire  _T_3345 = buf_rspageQ_3[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3339 = buf_rspageQ_3[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3333 = buf_rspageQ_3[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 481:84]
  wire  _T_3327 = buf_rspageQ_3[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 481:84]
  wire [3:0] buf_rspage_3 = {_T_3345,_T_3339,_T_3333,_T_3327}; // @[Cat.scala 29:58]
  wire  _T_3228 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3231 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3234 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire  _T_3237 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 480:90]
  wire [2:0] _T_3239 = {_T_3237,_T_3234,_T_3231}; // @[Cat.scala 29:58]
  wire  _T_3350 = ibuf_drain_vld & _T_1873; // @[el2_lsu_bus_buffer.scala 486:65]
  wire  _T_3352 = ibuf_drain_vld & _T_1884; // @[el2_lsu_bus_buffer.scala 486:65]
  wire  _T_3354 = ibuf_drain_vld & _T_1895; // @[el2_lsu_bus_buffer.scala 486:65]
  wire  _T_3356 = ibuf_drain_vld & _T_1906; // @[el2_lsu_bus_buffer.scala 486:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3356,_T_3354,_T_3352,_T_3350}; // @[Cat.scala 29:58]
  wire  _T_3364 = _T_3558 & _T_1876; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3373 = _T_3558 & _T_1887; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3382 = _T_3558 & _T_1898; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3391 = _T_3558 & _T_1909; // @[el2_lsu_bus_buffer.scala 488:37]
  wire  _T_3421 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire  _T_3423 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire  _T_3425 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire  _T_3427 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 490:47]
  wire [3:0] buf_dual_in = {_T_3427,_T_3425,_T_3423,_T_3421}; // @[Cat.scala 29:58]
  wire  _T_3432 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire  _T_3434 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire  _T_3436 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire  _T_3438 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 491:49]
  wire [3:0] buf_samedw_in = {_T_3438,_T_3436,_T_3434,_T_3432}; // @[Cat.scala 29:58]
  wire  _T_3443 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 492:86]
  wire  _T_3444 = ibuf_drainvec_vld[0] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire  _T_3447 = ibuf_drainvec_vld[1] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire  _T_3450 = ibuf_drainvec_vld[2] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire  _T_3453 = ibuf_drainvec_vld[3] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 492:50]
  wire [3:0] buf_nomerge_in = {_T_3453,_T_3450,_T_3447,_T_3444}; // @[Cat.scala 29:58]
  wire  _T_3461 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3364; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3466 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3373; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3471 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3382; // @[el2_lsu_bus_buffer.scala 493:49]
  wire  _T_3476 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3391; // @[el2_lsu_bus_buffer.scala 493:49]
  wire [3:0] buf_dualhi_in = {_T_3476,_T_3471,_T_3466,_T_3461}; // @[Cat.scala 29:58]
  wire  _T_3505 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire  _T_3507 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire  _T_3509 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire  _T_3511 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 495:53]
  wire [3:0] buf_sideeffect_in = {_T_3511,_T_3509,_T_3507,_T_3505}; // @[Cat.scala 29:58]
  wire  _T_3516 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire  _T_3518 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire  _T_3520 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire  _T_3522 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 496:49]
  wire [3:0] buf_unsign_in = {_T_3522,_T_3520,_T_3518,_T_3516}; // @[Cat.scala 29:58]
  wire  _T_3539 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire  _T_3541 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire  _T_3543 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire  _T_3545 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 498:48]
  wire [3:0] buf_write_in = {_T_3545,_T_3543,_T_3541,_T_3539}; // @[Cat.scala 29:58]
  wire  _T_3578 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 514:89]
  wire  _T_3580 = _T_3578 & _T_1370; // @[el2_lsu_bus_buffer.scala 514:104]
  wire  _T_3593 = buf_state_en_0 & _T_3664; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_3594 = _T_3593 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_3596 = _T_3594 & _T_1352; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_3599 = _T_3589 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_3600 = _T_3599 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_4893 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 626:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4893; // @[el2_lsu_bus_buffer.scala 626:38]
  wire  _T_3603 = _T_3599 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_3678 = bus_rsp_read_error & _T_3657; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_3680 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_3682 = _T_3680 & _T_3659; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_3683 = _T_3678 | _T_3682; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4893; // @[el2_lsu_bus_buffer.scala 625:40]
  wire  _T_3686 = bus_rsp_write_error & _T_3655; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_3687 = _T_3683 | _T_3686; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_3688 = _T_3589 & _T_3687; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_46 = _T_3610 & _T_3688; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3576 ? _T_3603 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3572 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3549 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3613 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 526:73]
  wire  _T_3614 = buf_write[0] & _T_3613; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_3615 = io_dec_tlu_force_halt | _T_3614; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_3617 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_3618 = buf_dual_0 & _T_3617; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_3621 = _T_3618 & _T_3664; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3622 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3623 = _T_3621 & _T_3622; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_4518 = _T_2767 | _T_2764; // @[el2_lsu_bus_buffer.scala 585:93]
  wire  _T_4519 = _T_4518 | _T_2761; // @[el2_lsu_bus_buffer.scala 585:93]
  wire  any_done_wait_state = _T_4519 | _T_2758; // @[el2_lsu_bus_buffer.scala 585:93]
  wire  _T_3625 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3631 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3633 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3635 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3637 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3639 = _T_3631 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3640 = _T_3633 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3641 = _T_3635 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3642 = _T_3637 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3643 = _T_3639 | _T_3640; // @[Mux.scala 27:72]
  wire  _T_3644 = _T_3643 | _T_3641; // @[Mux.scala 27:72]
  wire  _T_3645 = _T_3644 | _T_3642; // @[Mux.scala 27:72]
  wire  _T_3647 = _T_3621 & _T_3645; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_3648 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_3649 = _T_3647 & _T_3648; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_3650 = _T_3649 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_3651 = _T_3625 | _T_3650; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_3674 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_3675 = _T_3674 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_3689 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_3690 = buf_state_en_0 & _T_3689; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_3702 = buf_ldfwd[0] | _T_3707[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_3703 = _T_3702 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_29 = _T_3723 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3715 ? 1'h0 : _T_3723; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3715 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3697 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3697 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3610 & _T_3675; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3610 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3610 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3576 ? _T_3596 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3576 ? _T_3600 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3576 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3572 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3572 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3572 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3549 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3549 ? buf_state_en_0 : _GEN_70; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3549 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3549 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3786 = buf_state_en_1 & _T_3857; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_3787 = _T_3786 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_3789 = _T_3787 & _T_1352; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_3792 = _T_3782 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_3793 = _T_3792 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_3796 = _T_3792 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_3871 = bus_rsp_read_error & _T_3850; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_3873 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_3875 = _T_3873 & _T_3852; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_3876 = _T_3871 | _T_3875; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  _T_3879 = bus_rsp_write_error & _T_3848; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_3880 = _T_3876 | _T_3879; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_3881 = _T_3782 & _T_3880; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_122 = _T_3803 & _T_3881; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3769 ? _T_3796 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3765 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3742 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3807 = buf_write[1] & _T_3613; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_3808 = io_dec_tlu_force_halt | _T_3807; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_3810 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_3811 = buf_dual_1 & _T_3810; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_3814 = _T_3811 & _T_3857; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3815 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_3816 = _T_3814 & _T_3815; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_3818 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3824 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3826 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3828 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3830 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_3832 = _T_3824 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3833 = _T_3826 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3834 = _T_3828 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3835 = _T_3830 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3836 = _T_3832 | _T_3833; // @[Mux.scala 27:72]
  wire  _T_3837 = _T_3836 | _T_3834; // @[Mux.scala 27:72]
  wire  _T_3838 = _T_3837 | _T_3835; // @[Mux.scala 27:72]
  wire  _T_3840 = _T_3814 & _T_3838; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_3841 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_3842 = _T_3840 & _T_3841; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_3843 = _T_3842 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_3844 = _T_3818 | _T_3843; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_3867 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_3868 = _T_3867 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_3882 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_3883 = buf_state_en_1 & _T_3882; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_3895 = buf_ldfwd[1] | _T_3900[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_3896 = _T_3895 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_105 = _T_3916 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3908 ? 1'h0 : _T_3916; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3908 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3890 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3890 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3803 & _T_3868; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3803 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3803 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3769 ? _T_3789 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3769 ? _T_3793 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3769 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3765 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3765 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3765 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3742 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3742 ? buf_state_en_1 : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3742 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3742 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3979 = buf_state_en_2 & _T_4050; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_3980 = _T_3979 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_3982 = _T_3980 & _T_1352; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_3985 = _T_3975 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_3986 = _T_3985 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_3989 = _T_3985 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_4064 = bus_rsp_read_error & _T_4043; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_4066 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_4068 = _T_4066 & _T_4045; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_4069 = _T_4064 | _T_4068; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  _T_4072 = bus_rsp_write_error & _T_4041; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_4073 = _T_4069 | _T_4072; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_4074 = _T_3975 & _T_4073; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_198 = _T_3996 & _T_4074; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3962 ? _T_3989 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3958 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3935 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_4000 = buf_write[2] & _T_3613; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_4001 = io_dec_tlu_force_halt | _T_4000; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_4003 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_4004 = buf_dual_2 & _T_4003; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_4007 = _T_4004 & _T_4050; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4008 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4009 = _T_4007 & _T_4008; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_4011 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4017 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4019 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4021 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4023 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4025 = _T_4017 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4026 = _T_4019 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4027 = _T_4021 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4028 = _T_4023 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4029 = _T_4025 | _T_4026; // @[Mux.scala 27:72]
  wire  _T_4030 = _T_4029 | _T_4027; // @[Mux.scala 27:72]
  wire  _T_4031 = _T_4030 | _T_4028; // @[Mux.scala 27:72]
  wire  _T_4033 = _T_4007 & _T_4031; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_4034 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_4035 = _T_4033 & _T_4034; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_4036 = _T_4035 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_4037 = _T_4011 | _T_4036; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_4060 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_4061 = _T_4060 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_4075 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_4076 = buf_state_en_2 & _T_4075; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_4088 = buf_ldfwd[2] | _T_4093[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_4089 = _T_4088 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_181 = _T_4109 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4101 ? 1'h0 : _T_4109; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4101 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4083 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4083 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3996 & _T_4061; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3996 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3996 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3962 ? _T_3982 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3962 ? _T_3986 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3962 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3958 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3958 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3958 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3935 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3935 ? buf_state_en_2 : _GEN_222; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3935 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3935 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4172 = buf_state_en_3 & _T_4243; // @[el2_lsu_bus_buffer.scala 519:44]
  wire  _T_4173 = _T_4172 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 519:60]
  wire  _T_4175 = _T_4173 & _T_1352; // @[el2_lsu_bus_buffer.scala 519:74]
  wire  _T_4178 = _T_4168 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 521:67]
  wire  _T_4179 = _T_4178 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 521:81]
  wire  _T_4182 = _T_4178 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 522:82]
  wire  _T_4257 = bus_rsp_read_error & _T_4236; // @[el2_lsu_bus_buffer.scala 536:91]
  wire  _T_4259 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 537:31]
  wire  _T_4261 = _T_4259 & _T_4238; // @[el2_lsu_bus_buffer.scala 537:46]
  wire  _T_4262 = _T_4257 | _T_4261; // @[el2_lsu_bus_buffer.scala 536:143]
  wire  _T_4265 = bus_rsp_write_error & _T_4234; // @[el2_lsu_bus_buffer.scala 538:53]
  wire  _T_4266 = _T_4262 | _T_4265; // @[el2_lsu_bus_buffer.scala 537:88]
  wire  _T_4267 = _T_4168 & _T_4266; // @[el2_lsu_bus_buffer.scala 536:68]
  wire  _GEN_274 = _T_4189 & _T_4267; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4155 ? _T_4182 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4151 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4128 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4193 = buf_write[3] & _T_3613; // @[el2_lsu_bus_buffer.scala 526:71]
  wire  _T_4194 = io_dec_tlu_force_halt | _T_4193; // @[el2_lsu_bus_buffer.scala 526:55]
  wire  _T_4196 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 527:30]
  wire  _T_4197 = buf_dual_3 & _T_4196; // @[el2_lsu_bus_buffer.scala 527:28]
  wire  _T_4200 = _T_4197 & _T_4243; // @[el2_lsu_bus_buffer.scala 527:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 527:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4201 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 527:90]
  wire  _T_4202 = _T_4200 & _T_4201; // @[el2_lsu_bus_buffer.scala 527:61]
  wire  _T_4204 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4210 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4212 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4214 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4216 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 119:118]
  wire  _T_4218 = _T_4210 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4219 = _T_4212 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4220 = _T_4214 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4221 = _T_4216 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4222 = _T_4218 | _T_4219; // @[Mux.scala 27:72]
  wire  _T_4223 = _T_4222 | _T_4220; // @[Mux.scala 27:72]
  wire  _T_4224 = _T_4223 | _T_4221; // @[Mux.scala 27:72]
  wire  _T_4226 = _T_4200 & _T_4224; // @[el2_lsu_bus_buffer.scala 528:101]
  wire  _T_4227 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 528:167]
  wire  _T_4228 = _T_4226 & _T_4227; // @[el2_lsu_bus_buffer.scala 528:138]
  wire  _T_4229 = _T_4228 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 528:187]
  wire  _T_4230 = _T_4204 | _T_4229; // @[el2_lsu_bus_buffer.scala 528:53]
  wire  _T_4253 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 535:47]
  wire  _T_4254 = _T_4253 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 535:62]
  wire  _T_4268 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 539:50]
  wire  _T_4269 = buf_state_en_3 & _T_4268; // @[el2_lsu_bus_buffer.scala 539:48]
  wire  _T_4281 = buf_ldfwd[3] | _T_4286[0]; // @[el2_lsu_bus_buffer.scala 542:90]
  wire  _T_4282 = _T_4281 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 542:118]
  wire  _GEN_257 = _T_4302 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4294 ? 1'h0 : _T_4302; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4294 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4276 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4276 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4189 & _T_4254; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4189 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4189 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4155 ? _T_4175 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4155 ? _T_4179 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4155 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4151 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4151 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4151 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4128 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_4128 ? buf_state_en_3 : _GEN_298; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4128 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4128 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4357; // @[Reg.scala 27:20]
  reg  _T_4360; // @[Reg.scala 27:20]
  reg  _T_4363; // @[Reg.scala 27:20]
  reg  _T_4366; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4366,_T_4363,_T_4360,_T_4357}; // @[Cat.scala 29:58]
  reg  _T_4432; // @[el2_lsu_bus_buffer.scala 578:82]
  reg  _T_4427; // @[el2_lsu_bus_buffer.scala 578:82]
  reg  _T_4422; // @[el2_lsu_bus_buffer.scala 578:82]
  reg  _T_4417; // @[el2_lsu_bus_buffer.scala 578:82]
  wire [3:0] buf_error = {_T_4432,_T_4427,_T_4422,_T_4417}; // @[Cat.scala 29:58]
  wire  _T_4414 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4415 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 578:128]
  wire  _T_4419 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4420 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 578:128]
  wire  _T_4424 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4425 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 578:128]
  wire  _T_4429 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 578:86]
  wire  _T_4430 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 578:128]
  wire [2:0] _T_4437 = {buf_data_en_3,buf_data_en_2,buf_data_en_1}; // @[Cat.scala 29:58]
  wire [1:0] _T_4439 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4440 = io_ldst_dual_m ? _T_4439 : {{1'd0}, io_lsu_busreq_m}; // @[el2_lsu_bus_buffer.scala 581:28]
  wire [1:0] _T_4441 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4442 = io_ldst_dual_r ? _T_4441 : {{1'd0}, io_lsu_busreq_r}; // @[el2_lsu_bus_buffer.scala 581:94]
  wire [2:0] _T_4443 = _T_4440 + _T_4442; // @[el2_lsu_bus_buffer.scala 581:88]
  wire [2:0] _GEN_390 = {{2'd0}, ibuf_valid}; // @[el2_lsu_bus_buffer.scala 581:154]
  wire [3:0] _T_4444 = _T_4443 + _GEN_390; // @[el2_lsu_bus_buffer.scala 581:154]
  wire [1:0] _T_4449 = _T_5 + _T_12; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [1:0] _GEN_391 = {{1'd0}, _T_19}; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [2:0] _T_4450 = _T_4449 + _GEN_391; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [2:0] _GEN_392 = {{2'd0}, _T_26}; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [3:0] _T_4451 = _T_4450 + _GEN_392; // @[el2_lsu_bus_buffer.scala 581:217]
  wire [3:0] buf_numvld_any = _T_4444 + _T_4451; // @[el2_lsu_bus_buffer.scala 581:169]
  wire  _T_4522 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 587:52]
  wire  _T_4523 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 587:92]
  wire  _T_4524 = buf_numvld_any == 4'h4; // @[el2_lsu_bus_buffer.scala 587:121]
  wire  _T_4526 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4527 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4528 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4529 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 588:52]
  wire  _T_4530 = _T_4526 | _T_4527; // @[el2_lsu_bus_buffer.scala 588:65]
  wire  _T_4531 = _T_4530 | _T_4528; // @[el2_lsu_bus_buffer.scala 588:65]
  wire  _T_4532 = _T_4531 | _T_4529; // @[el2_lsu_bus_buffer.scala 588:65]
  wire  _T_4533 = ~_T_4532; // @[el2_lsu_bus_buffer.scala 588:34]
  wire  _T_4535 = _T_4533 & _T_850; // @[el2_lsu_bus_buffer.scala 588:70]
  wire  _T_4538 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 590:51]
  wire  _T_4539 = _T_4538 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 590:72]
  wire  _T_4540 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 590:94]
  wire  _T_4541 = _T_4539 & _T_4540; // @[el2_lsu_bus_buffer.scala 590:92]
  wire  _T_4542 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 590:111]
  wire  _T_4544 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 593:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 679:66]
  wire  _T_4562 = _T_2820 & _T_3664; // @[Mux.scala 27:72]
  wire  _T_4563 = _T_2842 & _T_3857; // @[Mux.scala 27:72]
  wire  _T_4564 = _T_2864 & _T_4050; // @[Mux.scala 27:72]
  wire  _T_4565 = _T_2886 & _T_4243; // @[Mux.scala 27:72]
  wire  _T_4566 = _T_4562 | _T_4563; // @[Mux.scala 27:72]
  wire  _T_4567 = _T_4566 | _T_4564; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4567 | _T_4565; // @[Mux.scala 27:72]
  wire  _T_4573 = buf_error[0] & _T_3664; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4578 = buf_error[1] & _T_3857; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4583 = buf_error[2] & _T_4050; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4588 = buf_error[3] & _T_4243; // @[el2_lsu_bus_buffer.scala 596:108]
  wire  _T_4589 = _T_2820 & _T_4573; // @[Mux.scala 27:72]
  wire  _T_4590 = _T_2842 & _T_4578; // @[Mux.scala 27:72]
  wire  _T_4591 = _T_2864 & _T_4583; // @[Mux.scala 27:72]
  wire  _T_4592 = _T_2886 & _T_4588; // @[Mux.scala 27:72]
  wire  _T_4593 = _T_4589 | _T_4590; // @[Mux.scala 27:72]
  wire  _T_4594 = _T_4593 | _T_4591; // @[Mux.scala 27:72]
  wire  _T_4601 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4602 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4603 = _T_4601 | _T_4602; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4604 = _T_4562 & _T_4603; // @[el2_lsu_bus_buffer.scala 597:106]
  wire  _T_4609 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4610 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4611 = _T_4609 | _T_4610; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4612 = _T_4563 & _T_4611; // @[el2_lsu_bus_buffer.scala 597:106]
  wire  _T_4617 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4618 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4619 = _T_4617 | _T_4618; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4620 = _T_4564 & _T_4619; // @[el2_lsu_bus_buffer.scala 597:106]
  wire  _T_4625 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 597:109]
  wire  _T_4626 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 597:124]
  wire  _T_4627 = _T_4625 | _T_4626; // @[el2_lsu_bus_buffer.scala 597:122]
  wire  _T_4628 = _T_4565 & _T_4627; // @[el2_lsu_bus_buffer.scala 597:106]
  wire [1:0] _T_4631 = _T_4620 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4632 = _T_4628 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_393 = {{1'd0}, _T_4612}; // @[Mux.scala 27:72]
  wire [1:0] _T_4634 = _GEN_393 | _T_4631; // @[Mux.scala 27:72]
  wire [31:0] _T_4669 = _T_4604 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4670 = _T_4612 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4620 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4628 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4673 = _T_4669 | _T_4670; // @[Mux.scala 27:72]
  wire [31:0] _T_4674 = _T_4673 | _T_4671; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4674 | _T_4672; // @[Mux.scala 27:72]
  wire  _T_4680 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4681 = _T_4562 & _T_4680; // @[el2_lsu_bus_buffer.scala 599:105]
  wire  _T_4686 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4687 = _T_4563 & _T_4686; // @[el2_lsu_bus_buffer.scala 599:105]
  wire  _T_4692 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4693 = _T_4564 & _T_4692; // @[el2_lsu_bus_buffer.scala 599:105]
  wire  _T_4698 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 599:120]
  wire  _T_4699 = _T_4565 & _T_4698; // @[el2_lsu_bus_buffer.scala 599:105]
  wire [31:0] _T_4700 = _T_4681 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4701 = _T_4687 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4702 = _T_4693 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4703 = _T_4699 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4704 = _T_4700 | _T_4701; // @[Mux.scala 27:72]
  wire [31:0] _T_4705 = _T_4704 | _T_4702; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4705 | _T_4703; // @[Mux.scala 27:72]
  wire  _T_4707 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4708 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4709 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 120:123]
  wire  _T_4710 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 120:123]
  wire [31:0] _T_4711 = _T_4707 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4712 = _T_4708 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4713 = _T_4709 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4714 = _T_4710 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4715 = _T_4711 | _T_4712; // @[Mux.scala 27:72]
  wire [31:0] _T_4716 = _T_4715 | _T_4713; // @[Mux.scala 27:72]
  wire [31:0] _T_4717 = _T_4716 | _T_4714; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4717[1:0]; // @[el2_lsu_bus_buffer.scala 600:83]
  wire [1:0] _T_4723 = _T_4707 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4724 = _T_4708 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4725 = _T_4709 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4726 = _T_4710 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4727 = _T_4723 | _T_4724; // @[Mux.scala 27:72]
  wire [1:0] _T_4728 = _T_4727 | _T_4725; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4728 | _T_4726; // @[Mux.scala 27:72]
  wire  _T_4738 = _T_4707 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4739 = _T_4708 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4740 = _T_4709 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4741 = _T_4710 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4742 = _T_4738 | _T_4739; // @[Mux.scala 27:72]
  wire  _T_4743 = _T_4742 | _T_4740; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4743 | _T_4741; // @[Mux.scala 27:72]
  wire [63:0] _T_4763 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_394 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 604:121]
  wire [5:0] _T_4764 = _GEN_394 * 4'h8; // @[el2_lsu_bus_buffer.scala 604:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4763 >> _T_4764; // @[el2_lsu_bus_buffer.scala 604:92]
  wire  _T_4765 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 607:69]
  wire  _T_4767 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 608:81]
  wire  _T_4768 = lsu_nonblock_unsign & _T_4767; // @[el2_lsu_bus_buffer.scala 608:63]
  wire [31:0] _T_4770 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4771 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 609:45]
  wire  _T_4772 = lsu_nonblock_unsign & _T_4771; // @[el2_lsu_bus_buffer.scala 609:26]
  wire [31:0] _T_4774 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4775 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 610:6]
  wire  _T_4777 = _T_4775 & _T_4767; // @[el2_lsu_bus_buffer.scala 610:27]
  wire [23:0] _T_4780 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4782 = {_T_4780,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4785 = _T_4775 & _T_4771; // @[el2_lsu_bus_buffer.scala 611:27]
  wire [15:0] _T_4788 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4790 = {_T_4788,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4791 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 612:21]
  wire [31:0] _T_4792 = _T_4768 ? _T_4770 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4793 = _T_4772 ? _T_4774 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4794 = _T_4777 ? _T_4782 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4795 = _T_4785 ? _T_4790 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4796 = _T_4791 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4797 = _T_4792 | _T_4793; // @[Mux.scala 27:72]
  wire [31:0] _T_4798 = _T_4797 | _T_4794; // @[Mux.scala 27:72]
  wire [31:0] _T_4799 = _T_4798 | _T_4795; // @[Mux.scala 27:72]
  wire [63:0] _GEN_395 = {{32'd0}, _T_4799}; // @[Mux.scala 27:72]
  wire [63:0] _T_4800 = _GEN_395 | _T_4796; // @[Mux.scala 27:72]
  wire  _T_4895 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 630:36]
  wire  _T_4896 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 630:51]
  wire  _T_4897 = _T_4895 & _T_4896; // @[el2_lsu_bus_buffer.scala 630:49]
  wire [31:0] _T_4901 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4903 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4908 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 642:50]
  wire  _T_4909 = _T_4895 & _T_4908; // @[el2_lsu_bus_buffer.scala 642:48]
  wire [7:0] _T_4913 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4916 = obuf_valid & _T_1362; // @[el2_lsu_bus_buffer.scala 647:36]
  wire  _T_4918 = _T_4916 & _T_1368; // @[el2_lsu_bus_buffer.scala 647:50]
  wire  _T_4930 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4932 = _T_4930 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4935 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4937 = _T_4935 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4940 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4942 = _T_4940 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4945 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 660:114]
  wire  _T_4947 = _T_4945 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 660:129]
  wire  _T_4948 = _T_2820 & _T_4932; // @[Mux.scala 27:72]
  wire  _T_4949 = _T_2842 & _T_4937; // @[Mux.scala 27:72]
  wire  _T_4950 = _T_2864 & _T_4942; // @[Mux.scala 27:72]
  wire  _T_4951 = _T_2886 & _T_4947; // @[Mux.scala 27:72]
  wire  _T_4952 = _T_4948 | _T_4949; // @[Mux.scala 27:72]
  wire  _T_4953 = _T_4952 | _T_4950; // @[Mux.scala 27:72]
  wire  _T_4963 = _T_2842 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 661:98]
  wire  lsu_imprecise_error_store_tag = _T_4963 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 661:113]
  wire  _T_4969 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 663:72]
  wire  _T_4971 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 120:123]
  wire [31:0] _T_4973 = _T_4971 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4974 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4975 = _T_4973 | _T_4974; // @[Mux.scala 27:72]
  wire  _T_4992 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 670:68]
  wire  _T_4995 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 671:48]
  wire  _T_4998 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 674:48]
  wire  _T_4999 = io_lsu_axi_awvalid & _T_4998; // @[el2_lsu_bus_buffer.scala 674:46]
  wire  _T_5000 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 674:92]
  wire  _T_5001 = io_lsu_axi_wvalid & _T_5000; // @[el2_lsu_bus_buffer.scala 674:90]
  wire  _T_5002 = _T_4999 | _T_5001; // @[el2_lsu_bus_buffer.scala 674:69]
  wire  _T_5003 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 674:136]
  wire  _T_5004 = io_lsu_axi_arvalid & _T_5003; // @[el2_lsu_bus_buffer.scala 674:134]
  wire  _T_5008 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 678:75]
  wire  _T_5009 = io_lsu_busreq_m & _T_5008; // @[el2_lsu_bus_buffer.scala 678:73]
  reg  _T_5012; // @[el2_lsu_bus_buffer.scala 678:56]
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
  assign io_lsu_busreq_r = _T_5012; // @[el2_lsu_bus_buffer.scala 678:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 586:30]
  assign io_lsu_bus_buffer_full_any = _T_4522 ? _T_4523 : _T_4524; // @[el2_lsu_bus_buffer.scala 587:30]
  assign io_lsu_bus_buffer_empty_any = _T_4535 & _T_1250; // @[el2_lsu_bus_buffer.scala 588:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 667:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 198:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 199:25]
  assign io_ld_fwddata_buf_lo = _T_651[31:0]; // @[el2_lsu_bus_buffer.scala 225:24]
  assign io_ld_fwddata_buf_hi = _T_747[31:0]; // @[el2_lsu_bus_buffer.scala 230:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4969; // @[el2_lsu_bus_buffer.scala 663:35]
  assign io_lsu_imprecise_error_store_any = _T_4953 | _T_4951; // @[el2_lsu_bus_buffer.scala 660:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4975 : _T_4717; // @[el2_lsu_bus_buffer.scala 664:35]
  assign io_lsu_nonblock_load_valid_m = _T_4541 & _T_4542; // @[el2_lsu_bus_buffer.scala 590:32]
  assign io_lsu_nonblock_load_tag_m = _T_1882 ? 2'h0 : _T_1918; // @[el2_lsu_bus_buffer.scala 591:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4544; // @[el2_lsu_bus_buffer.scala 593:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 594:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4765; // @[el2_lsu_bus_buffer.scala 607:35]
  assign io_lsu_nonblock_load_data_error = _T_4594 | _T_4592; // @[el2_lsu_bus_buffer.scala 596:35]
  assign io_lsu_nonblock_load_data_tag = _T_4634 | _T_4632; // @[el2_lsu_bus_buffer.scala 597:33]
  assign io_lsu_nonblock_load_data = _T_4800[31:0]; // @[el2_lsu_bus_buffer.scala 608:29]
  assign io_lsu_pmu_bus_trxn = _T_4992 | _T_4887; // @[el2_lsu_bus_buffer.scala 670:23]
  assign io_lsu_pmu_bus_misaligned = _T_4995 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 671:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 672:24]
  assign io_lsu_pmu_bus_busy = _T_5002 | _T_5004; // @[el2_lsu_bus_buffer.scala 674:23]
  assign io_lsu_axi_awvalid = _T_4897 & _T_1258; // @[el2_lsu_bus_buffer.scala 630:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1867}; // @[el2_lsu_bus_buffer.scala 631:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4901; // @[el2_lsu_bus_buffer.scala 632:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 636:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 637:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4903 : 3'h3; // @[el2_lsu_bus_buffer.scala 633:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 638:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 640:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 635:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 634:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 639:20]
  assign io_lsu_axi_wvalid = _T_4909 & _T_1258; // @[el2_lsu_bus_buffer.scala 642:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 644:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4913; // @[el2_lsu_bus_buffer.scala 643:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 645:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 658:21]
  assign io_lsu_axi_arvalid = _T_4918 & _T_1258; // @[el2_lsu_bus_buffer.scala 647:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1867}; // @[el2_lsu_bus_buffer.scala 648:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4901; // @[el2_lsu_bus_buffer.scala 649:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 653:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 654:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4903 : 3'h3; // @[el2_lsu_bus_buffer.scala 650:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 655:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 657:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 652:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 651:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 656:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 659:21]
  assign io_test = _T_751 | _T_750; // @[el2_lsu_bus_buffer.scala 259:11]
  assign io_data_hi = _T_4705 | _T_4703; // @[el2_lsu_bus_buffer.scala 605:14]
  assign io_data_lo = _T_4674 | _T_4672; // @[el2_lsu_bus_buffer.scala 606:14]
  assign io_data_en = {_T_4437,buf_data_en_0}; // @[el2_lsu_bus_buffer.scala 579:14]
  assign io_Cmdptr0 = _T_2098[1:0]; // @[el2_lsu_bus_buffer.scala 448:14]
  assign io_Cmdptr1 = 2'h0; // @[el2_lsu_bus_buffer.scala 359:14]
  assign io_WrPtr1_r = WrPtr1_r; // @[el2_lsu_bus_buffer.scala 279:15]
  assign io_WrPtr1_m = _T_1936 ? 2'h0 : _T_1981; // @[el2_lsu_bus_buffer.scala 433:15]
  assign io_wdata_in = {_T_1639,_T_1598}; // @[el2_lsu_bus_buffer.scala 394:15]
  assign io_buf_state = {_T_1921,buf_state_3}; // @[el2_lsu_bus_buffer.scala 426:16]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_io_en = _T_851 & _T_852; // @[el2_lib.scala 488:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_1_io_en = _T_851 & _T_852; // @[el2_lib.scala 488:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_2_io_en = _T_1259 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_3_io_en = _T_1259 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_4_io_en = _T_3549 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3742 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3935 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4128 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3549 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3742 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3935 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4128 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4381 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4378 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4375 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4372 = _RAND_4[0:0];
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
  _T_1867 = _RAND_17[1:0];
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
  _T_4351 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4348 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4345 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4342 = _RAND_53[0:0];
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
  _T_4328 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4326 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4324 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4322 = _RAND_88[0:0];
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
  _T_4357 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4360 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4363 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4366 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4432 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4427 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4422 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4417 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_5012 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
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
    _T_4372 = 1'h0;
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
    _T_1867 = 2'h0;
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
    _T_4351 = 1'h0;
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
    _T_4328 = 1'h0;
  end
  if (reset) begin
    _T_4326 = 1'h0;
  end
  if (reset) begin
    _T_4324 = 1'h0;
  end
  if (reset) begin
    _T_4322 = 1'h0;
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
    _T_4357 = 1'h0;
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
    _T_4432 = 1'h0;
  end
  if (reset) begin
    _T_4427 = 1'h0;
  end
  if (reset) begin
    _T_4422 = 1'h0;
  end
  if (reset) begin
    _T_4417 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_5012 = 1'h0;
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
    end else if (_T_3364) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4381 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4381 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4378 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4378 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4375 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4375 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4372 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4372 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3549) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3572) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3576) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3610) begin
        if (_T_3615) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3623) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3651) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3697) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3703) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3715) begin
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
    end else if (_T_3373) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3742) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3765) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3769) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3803) begin
        if (_T_3808) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3816) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3844) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3890) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3896) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3908) begin
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
    end else if (_T_3382) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3935) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3958) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3962) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3996) begin
        if (_T_4001) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4009) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4037) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4083) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4089) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4101) begin
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
    end else if (_T_3391) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4128) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4151) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4155) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4189) begin
        if (_T_4194) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4202) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4230) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4276) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4282) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4294) begin
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
      end else if (_T_3391) begin
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
      end else if (_T_3382) begin
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
      end else if (_T_3373) begin
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
      end else if (_T_3364) begin
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
      buf_ageQ_3 <= {_T_2556,_T_2479};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1867 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1867 <= WrPtr0_r;
      end else begin
        _T_1867 <= CmdPtr0;
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
      obuf_valid <= _T_1858 & _T_1859;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1259 & io_lsu_bus_clk_en;
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
      ibuf_valid <= _T_1003 & _T_1004;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_864) begin
        ibuf_byteen <= _T_879;
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
      buf_ageQ_2 <= {_T_2454,_T_2377};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2352,_T_2275};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2250,_T_2173};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3549) begin
      if (_T_3564) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3572) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3576) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3610) begin
      if (_T_3690) begin
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
    end else if (_T_3742) begin
      if (_T_3757) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3765) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3769) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3803) begin
      if (_T_3883) begin
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
    end else if (_T_3935) begin
      if (_T_3950) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3958) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3962) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3996) begin
      if (_T_4076) begin
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
    end else if (_T_4128) begin
      if (_T_4143) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4151) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4155) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4189) begin
      if (_T_4269) begin
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
    end else if (_T_921) begin
      ibuf_timer <= _T_924;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (_T_1009) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1936) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1950) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1964) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1978) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1882) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1893) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1904) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1915) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_1009) begin
      if (!(_T_864)) begin
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
      ibuf_data <= {_T_920,_T_891};
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (_T_1009) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_1009) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_1009) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_1009) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_1009) begin
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
    end else if (_T_1077) begin
      obuf_wr_timer <= _T_1079;
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
      _T_4351 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4351 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4348 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4348 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4345 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4345 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4342 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4342 <= buf_sideeffect_in[0];
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
        obuf_write <= _T_1221;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1324 & _T_4884;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1324 & _T_4885;
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
      obuf_addr <= _T_1308;
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
        obuf_sideeffect <= _T_1070;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1349 | _T_1353;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1355) begin
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
        obuf_sz <= _T_1321;
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
      obuf_data <= {_T_1639,_T_1598};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3194,_T_3183};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3209,_T_3198};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3224,_T_3213};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3239,_T_3228};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4328 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4128) begin
        _T_4328 <= 1'h0;
      end else if (_T_4151) begin
        _T_4328 <= 1'h0;
      end else begin
        _T_4328 <= _T_4155;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4326 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3935) begin
        _T_4326 <= 1'h0;
      end else if (_T_3958) begin
        _T_4326 <= 1'h0;
      end else begin
        _T_4326 <= _T_3962;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4324 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3742) begin
        _T_4324 <= 1'h0;
      end else if (_T_3765) begin
        _T_4324 <= 1'h0;
      end else begin
        _T_4324 <= _T_3769;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4322 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3549) begin
        _T_4322 <= 1'h0;
      end else if (_T_3572) begin
        _T_4322 <= 1'h0;
      end else begin
        _T_4322 <= _T_3576;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3549) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3572) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3576) begin
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
      end else if (_T_3364) begin
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
      if (_T_4128) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4151) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4155) begin
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
      if (_T_3935) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3958) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3962) begin
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
      if (_T_3742) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3765) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3769) begin
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
      end else if (_T_3373) begin
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
      end else if (_T_3382) begin
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
      end else if (_T_3391) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4357 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4357 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4360 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4360 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4363 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4363 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4366 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4366 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4432 <= 1'h0;
    end else begin
      _T_4432 <= _T_4429 & _T_4430;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4427 <= 1'h0;
    end else begin
      _T_4427 <= _T_4424 & _T_4425;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4422 <= 1'h0;
    end else begin
      _T_4422 <= _T_4419 & _T_4420;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4417 <= 1'h0;
    end else begin
      _T_4417 <= _T_4414 & _T_4415;
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
      _T_5012 <= 1'h0;
    end else begin
      _T_5012 <= _T_5009 & _T_4542;
    end
  end
endmodule
