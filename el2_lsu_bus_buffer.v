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
  output [2:0]  io_test
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
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_buffer.scala 125:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_buffer.scala 126:46]
  reg [31:0] buf_addr_0; // @[el2_lib.scala 491:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  reg  _T_4266; // @[Reg.scala 27:20]
  reg  _T_4263; // @[Reg.scala 27:20]
  reg  _T_4260; // @[Reg.scala 27:20]
  reg  _T_4257; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4266,_T_4263,_T_4260,_T_4257}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_1; // @[el2_lib.scala 491:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_13 = _T_11 & _T_12; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_2; // @[el2_lib.scala 491:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_20 = _T_18 & _T_19; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_3; // @[el2_lib.scala 491:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_27 = _T_25 & _T_26; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_34 = _T_32 & _T_5; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_41 = _T_39 & _T_12; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_48 = _T_46 & _T_19; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_55 = _T_53 & _T_26; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  reg [2:0] _T_4293; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4293}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 536:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4291; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4291}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 536:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4289; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4289}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 536:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4287; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4287}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 536:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 520:60]
  wire  _T_2528 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 433:94]
  wire  _T_4013 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4036 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4040 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1774; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 381:13]
  wire  _T_4047 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 475:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 475:104]
  wire  _T_4048 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 475:104]
  wire  _T_4049 = obuf_merge & _T_4048; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_4050 = _T_4047 | _T_4049; // @[el2_lsu_bus_buffer.scala 475:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 375:54]
  wire  _T_4051 = _T_4050 & obuf_valid; // @[el2_lsu_bus_buffer.scala 475:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 374:55]
  wire  _T_4052 = _T_4051 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 475:148]
  wire  _GEN_280 = _T_4040 & _T_4052; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4036 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4013 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2529 = _T_2528 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 433:104]
  wire  _T_2530 = buf_ageQ_3[3] & _T_2529; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2524 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 433:94]
  wire  _T_3820 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3843 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3847 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3854 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 475:48]
  wire  _T_3855 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 475:104]
  wire  _T_3856 = obuf_merge & _T_3855; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_3857 = _T_3854 | _T_3856; // @[el2_lsu_bus_buffer.scala 475:77]
  wire  _T_3858 = _T_3857 & obuf_valid; // @[el2_lsu_bus_buffer.scala 475:135]
  wire  _T_3859 = _T_3858 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 475:148]
  wire  _GEN_204 = _T_3847 & _T_3859; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3843 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3820 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2525 = _T_2524 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 433:104]
  wire  _T_2526 = buf_ageQ_3[2] & _T_2525; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2520 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 433:94]
  wire  _T_3627 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3650 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3654 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3661 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 475:48]
  wire  _T_3662 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 475:104]
  wire  _T_3663 = obuf_merge & _T_3662; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_3664 = _T_3661 | _T_3663; // @[el2_lsu_bus_buffer.scala 475:77]
  wire  _T_3665 = _T_3664 & obuf_valid; // @[el2_lsu_bus_buffer.scala 475:135]
  wire  _T_3666 = _T_3665 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 475:148]
  wire  _GEN_128 = _T_3654 & _T_3666; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3650 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3627 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2521 = _T_2520 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 433:104]
  wire  _T_2522 = buf_ageQ_3[1] & _T_2521; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2516 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 433:94]
  wire  _T_3434 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3457 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3461 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3468 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 475:48]
  wire  _T_3469 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 475:104]
  wire  _T_3470 = obuf_merge & _T_3469; // @[el2_lsu_bus_buffer.scala 475:91]
  wire  _T_3471 = _T_3468 | _T_3470; // @[el2_lsu_bus_buffer.scala 475:77]
  wire  _T_3472 = _T_3471 & obuf_valid; // @[el2_lsu_bus_buffer.scala 475:135]
  wire  _T_3473 = _T_3472 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 475:148]
  wire  _GEN_52 = _T_3461 & _T_3473; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3457 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3434 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2517 = _T_2516 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 433:104]
  wire  _T_2518 = buf_ageQ_3[0] & _T_2517; // @[el2_lsu_bus_buffer.scala 433:78]
  wire [3:0] buf_age_3 = {_T_2530,_T_2526,_T_2522,_T_2518}; // @[Cat.scala 29:58]
  wire  _T_2629 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2631 = _T_2629 & _T_19; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2623 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2625 = _T_2623 & _T_12; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2617 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2619 = _T_2617 & _T_5; // @[el2_lsu_bus_buffer.scala 434:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2631,_T_2625,_T_2619}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 196:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 202:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[el2_lsu_bus_buffer.scala 202:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 270:24]
  wire  _T_514 = _T_513 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 202:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 202:99]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire  _T_545 = ld_addr_ibuf_hit_lo & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 207:48]
  wire  _T_547 = _T_545 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 207:65]
  wire [3:0] ld_byte_ibuf_hit_lo = {{3'd0}, _T_547}; // @[el2_lsu_bus_buffer.scala 207:25 el2_lsu_bus_buffer.scala 207:25 el2_lsu_bus_buffer.scala 207:25 el2_lsu_bus_buffer.scala 207:25]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 196:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 520:60]
  wire  _T_2511 = buf_ageQ_2[3] & _T_2529; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2507 = buf_ageQ_2[2] & _T_2525; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2503 = buf_ageQ_2[1] & _T_2521; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2499 = buf_ageQ_2[0] & _T_2517; // @[el2_lsu_bus_buffer.scala 433:78]
  wire [3:0] buf_age_2 = {_T_2511,_T_2507,_T_2503,_T_2499}; // @[Cat.scala 29:58]
  wire  _T_2608 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2610 = _T_2608 & _T_26; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2596 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2598 = _T_2596 & _T_12; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2590 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2592 = _T_2590 & _T_5; // @[el2_lsu_bus_buffer.scala 434:106]
  wire [3:0] buf_age_younger_2 = {_T_2610,1'h0,_T_2598,_T_2592}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 520:60]
  wire  _T_2492 = buf_ageQ_1[3] & _T_2529; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2488 = buf_ageQ_1[2] & _T_2525; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2484 = buf_ageQ_1[1] & _T_2521; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2480 = buf_ageQ_1[0] & _T_2517; // @[el2_lsu_bus_buffer.scala 433:78]
  wire [3:0] buf_age_1 = {_T_2492,_T_2488,_T_2484,_T_2480}; // @[Cat.scala 29:58]
  wire  _T_2581 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2583 = _T_2581 & _T_26; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2575 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2577 = _T_2575 & _T_19; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2563 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2565 = _T_2563 & _T_5; // @[el2_lsu_bus_buffer.scala 434:106]
  wire [3:0] buf_age_younger_1 = {_T_2583,_T_2577,1'h0,_T_2565}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 520:60]
  wire  _T_2473 = buf_ageQ_0[3] & _T_2529; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2469 = buf_ageQ_0[2] & _T_2525; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2465 = buf_ageQ_0[1] & _T_2521; // @[el2_lsu_bus_buffer.scala 433:78]
  wire  _T_2461 = buf_ageQ_0[0] & _T_2517; // @[el2_lsu_bus_buffer.scala 433:78]
  wire [3:0] buf_age_0 = {_T_2473,_T_2469,_T_2465,_T_2461}; // @[Cat.scala 29:58]
  wire  _T_2554 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2556 = _T_2554 & _T_26; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2548 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2550 = _T_2548 & _T_19; // @[el2_lsu_bus_buffer.scala 434:106]
  wire  _T_2542 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 434:91]
  wire  _T_2544 = _T_2542 & _T_12; // @[el2_lsu_bus_buffer.scala 434:106]
  wire [3:0] buf_age_younger_0 = {_T_2556,_T_2550,_T_2544,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_232 = |_T_231; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_233 = ~_T_232; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_237 = _T_234 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[el2_lsu_bus_buffer.scala 188:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 188:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_291 = |_T_290; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_292 = ~_T_291; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 196:150]
  wire  _T_296 = _T_293 & _T_295; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_283 = |_T_282; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_284 = ~_T_283; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_288 = _T_285 & _T_295; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_275 = |_T_274; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_276 = ~_T_275; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_280 = _T_277 & _T_295; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_267 = |_T_266; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_268 = ~_T_267; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_272 = _T_269 & _T_295; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[el2_lsu_bus_buffer.scala 188:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 188:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_326 = |_T_325; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_327 = ~_T_326; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 196:150]
  wire  _T_331 = _T_328 & _T_330; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_318 = |_T_317; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_319 = ~_T_318; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_323 = _T_320 & _T_330; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_310 = |_T_309; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_311 = ~_T_310; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_315 = _T_312 & _T_330; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_302 = |_T_301; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_303 = ~_T_302; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_307 = _T_304 & _T_330; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[el2_lsu_bus_buffer.scala 188:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 188:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_361 = |_T_360; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_362 = ~_T_361; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 196:150]
  wire  _T_366 = _T_363 & _T_365; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_353 = |_T_352; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_354 = ~_T_353; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_358 = _T_355 & _T_365; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_345 = |_T_344; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_346 = ~_T_345; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_350 = _T_347 & _T_365; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_337 = |_T_336; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_338 = ~_T_337; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_342 = _T_339 & _T_365; // @[el2_lsu_bus_buffer.scala 196:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[el2_lsu_bus_buffer.scala 188:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 188:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_396 = |_T_395; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_397 = ~_T_396; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 203:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[el2_lsu_bus_buffer.scala 203:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 203:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 203:99]
  wire  _T_549 = ld_addr_ibuf_hit_hi & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 208:48]
  wire  _T_551 = _T_549 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 208:65]
  wire [3:0] ld_byte_ibuf_hit_hi = {{3'd0}, _T_551}; // @[el2_lsu_bus_buffer.scala 208:25 el2_lsu_bus_buffer.scala 208:25 el2_lsu_bus_buffer.scala 208:25 el2_lsu_bus_buffer.scala 208:25]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_401 = _T_398 & _T_400; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_388 = |_T_387; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_389 = ~_T_388; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_393 = _T_390 & _T_400; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_380 = |_T_379; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_381 = ~_T_380; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_385 = _T_382 & _T_400; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_372 = |_T_371; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_373 = ~_T_372; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_377 = _T_374 & _T_400; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_431 = |_T_430; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_432 = ~_T_431; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_436 = _T_433 & _T_435; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_423 = |_T_422; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_424 = ~_T_423; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_428 = _T_425 & _T_435; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_415 = |_T_414; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_416 = ~_T_415; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_420 = _T_417 & _T_435; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_407 = |_T_406; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_408 = ~_T_407; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_412 = _T_409 & _T_435; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_466 = |_T_465; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_467 = ~_T_466; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_471 = _T_468 & _T_470; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_458 = |_T_457; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_459 = ~_T_458; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_463 = _T_460 & _T_470; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_450 = |_T_449; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_451 = ~_T_450; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_455 = _T_452 & _T_470; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_442 = |_T_441; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_443 = ~_T_442; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_447 = _T_444 & _T_470; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_501 = |_T_500; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_502 = ~_T_501; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_506 = _T_503 & _T_505; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_493 = |_T_492; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_494 = ~_T_493; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_498 = _T_495 & _T_505; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_485 = |_T_484; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_486 = ~_T_485; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_490 = _T_487 & _T_505; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_477 = |_T_476; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_478 = ~_T_477; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_482 = _T_479 & _T_505; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire [2:0] _T_84 = {_T_82,_T_79,_T_76}; // @[Cat.scala 29:58]
  wire [7:0] _T_554 = ld_byte_hitvecfn_lo_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4294; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_0 = {{28'd0}, _T_4294}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 537:14]
  wire [8:0] _GEN_354 = {{1'd0}, _T_554}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_556 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_559 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4295; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_1 = {{28'd0}, _T_4295}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 537:14]
  wire [8:0] _GEN_355 = {{1'd0}, _T_559}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_561 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_564 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4296; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_2 = {{28'd0}, _T_4296}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 537:14]
  wire [8:0] _GEN_356 = {{1'd0}, _T_564}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_566 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_569 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4297; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_3 = {{28'd0}, _T_4297}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 537:14]
  wire [8:0] _GEN_357 = {{1'd0}, _T_569}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_571 = _GEN_357 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_572 = _T_556 | _T_561; // @[el2_lsu_bus_buffer.scala 214:123]
  wire [8:0] _T_573 = _T_572 | _T_566; // @[el2_lsu_bus_buffer.scala 214:123]
  wire [8:0] _T_574 = _T_573 | _T_571; // @[el2_lsu_bus_buffer.scala 214:123]
  wire [7:0] _T_577 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_579 = _T_577 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 215:65]
  wire [7:0] _T_582 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_584 = _T_582 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 215:65]
  wire [7:0] _T_587 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_589 = _T_587 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 215:65]
  wire [7:0] _T_592 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_594 = _T_592 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 215:65]
  wire [7:0] _T_595 = _T_579 | _T_584; // @[el2_lsu_bus_buffer.scala 215:97]
  wire [7:0] _T_596 = _T_595 | _T_589; // @[el2_lsu_bus_buffer.scala 215:97]
  wire [7:0] _T_597 = _T_596 | _T_594; // @[el2_lsu_bus_buffer.scala 215:97]
  wire [7:0] _T_600 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_602 = _T_600 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 216:65]
  wire [7:0] _T_605 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_607 = _T_605 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 216:65]
  wire [7:0] _T_610 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_612 = _T_610 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 216:65]
  wire [7:0] _T_615 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_617 = _T_615 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 216:65]
  wire [7:0] _T_618 = _T_602 | _T_607; // @[el2_lsu_bus_buffer.scala 216:96]
  wire [7:0] _T_619 = _T_618 | _T_612; // @[el2_lsu_bus_buffer.scala 216:96]
  wire [7:0] _T_620 = _T_619 | _T_617; // @[el2_lsu_bus_buffer.scala 216:96]
  wire [7:0] _T_623 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_625 = _T_623 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 217:65]
  wire [7:0] _T_628 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_630 = _T_628 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 217:65]
  wire [7:0] _T_633 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_635 = _T_633 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 217:65]
  wire [7:0] _T_638 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_640 = _T_638 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 217:65]
  wire [7:0] _T_641 = _T_625 | _T_630; // @[el2_lsu_bus_buffer.scala 217:95]
  wire [7:0] _T_642 = _T_641 | _T_635; // @[el2_lsu_bus_buffer.scala 217:95]
  wire [7:0] _T_643 = _T_642 | _T_640; // @[el2_lsu_bus_buffer.scala 217:95]
  wire [32:0] _T_646 = {_T_574,_T_597,_T_620,_T_643}; // @[Cat.scala 29:58]
  wire [7:0] _T_649 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_358 = {{1'd0}, _T_649}; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [8:0] _T_651 = _GEN_358 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_654 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_359 = {{1'd0}, _T_654}; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [8:0] _T_656 = _GEN_359 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_659 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_360 = {{1'd0}, _T_659}; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [8:0] _T_661 = _GEN_360 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_664 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _GEN_361 = {{1'd0}, _T_664}; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [8:0] _T_666 = _GEN_361 & buf_data_3[31:23]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [8:0] _T_667 = _T_651 | _T_656; // @[el2_lsu_bus_buffer.scala 219:123]
  wire [8:0] _T_668 = _T_667 | _T_661; // @[el2_lsu_bus_buffer.scala 219:123]
  wire [8:0] _T_669 = _T_668 | _T_666; // @[el2_lsu_bus_buffer.scala 219:123]
  wire [7:0] _T_672 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_674 = _T_672 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 220:65]
  wire [7:0] _T_677 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_679 = _T_677 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 220:65]
  wire [7:0] _T_682 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_684 = _T_682 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 220:65]
  wire [7:0] _T_687 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_689 = _T_687 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 220:65]
  wire [7:0] _T_690 = _T_674 | _T_679; // @[el2_lsu_bus_buffer.scala 220:97]
  wire [7:0] _T_691 = _T_690 | _T_684; // @[el2_lsu_bus_buffer.scala 220:97]
  wire [7:0] _T_692 = _T_691 | _T_689; // @[el2_lsu_bus_buffer.scala 220:97]
  wire [7:0] _T_695 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_697 = _T_695 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 221:65]
  wire [7:0] _T_700 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_702 = _T_700 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 221:65]
  wire [7:0] _T_705 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_707 = _T_705 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 221:65]
  wire [7:0] _T_710 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_712 = _T_710 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 221:65]
  wire [7:0] _T_713 = _T_697 | _T_702; // @[el2_lsu_bus_buffer.scala 221:96]
  wire [7:0] _T_714 = _T_713 | _T_707; // @[el2_lsu_bus_buffer.scala 221:96]
  wire [7:0] _T_715 = _T_714 | _T_712; // @[el2_lsu_bus_buffer.scala 221:96]
  wire [7:0] _T_718 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_720 = _T_718 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 222:65]
  wire [7:0] _T_723 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_725 = _T_723 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 222:65]
  wire [7:0] _T_728 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_730 = _T_728 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 222:65]
  wire [7:0] _T_733 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_735 = _T_733 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 222:65]
  wire [7:0] _T_736 = _T_720 | _T_725; // @[el2_lsu_bus_buffer.scala 222:95]
  wire [7:0] _T_737 = _T_736 | _T_730; // @[el2_lsu_bus_buffer.scala 222:95]
  wire [7:0] _T_738 = _T_737 | _T_735; // @[el2_lsu_bus_buffer.scala 222:95]
  wire [32:0] _T_741 = {_T_669,_T_692,_T_715,_T_738}; // @[Cat.scala 29:58]
  wire [3:0] _T_742 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_743 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_744 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_745 = _T_742 | _T_743; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_745 | _T_744; // @[Mux.scala 27:72]
  wire [7:0] _T_747 = {4'h0,ldst_byteen_r}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_362 = {{3'd0}, _T_747}; // @[el2_lsu_bus_buffer.scala 228:45]
  wire [10:0] byteen = _GEN_362 << io_lsu_addr_r[1:0]; // @[el2_lsu_bus_buffer.scala 228:45]
  wire [3:0] ldst_byteen_hi_r = byteen[7:4]; // @[el2_lsu_bus_buffer.scala 229:32]
  wire [3:0] ldst_byteen_lo_r = byteen[3:0]; // @[el2_lsu_bus_buffer.scala 230:32]
  wire [63:0] _T_749 = {32'h0,io_store_data_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_363 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[el2_lsu_bus_buffer.scala 231:58]
  wire [5:0] _T_751 = 4'h8 * _GEN_363; // @[el2_lsu_bus_buffer.scala 231:58]
  wire [126:0] _GEN_364 = {{63'd0}, _T_749}; // @[el2_lsu_bus_buffer.scala 231:52]
  wire [126:0] store_data = _GEN_364 << _T_751; // @[el2_lsu_bus_buffer.scala 231:52]
  wire [31:0] store_data_hi_r = store_data[63:32]; // @[el2_lsu_bus_buffer.scala 232:35]
  wire [31:0] store_data_lo_r = store_data[31:0]; // @[el2_lsu_bus_buffer.scala 233:35]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 234:40]
  wire  _T_755 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 235:74]
  wire  _T_757 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 236:26]
  wire  _T_758 = io_lsu_pkt_r_word & _T_755; // @[Mux.scala 27:72]
  wire  _T_759 = io_lsu_pkt_r_half & _T_757; // @[Mux.scala 27:72]
  wire  _T_761 = _T_758 | _T_759; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_761 | io_lsu_pkt_r_by; // @[Mux.scala 27:72]
  wire  _T_763 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 238:55]
  wire  _T_764 = io_lsu_busreq_r & _T_763; // @[el2_lsu_bus_buffer.scala 238:34]
  wire  _T_765 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 238:79]
  wire  ibuf_byp = _T_764 & _T_765; // @[el2_lsu_bus_buffer.scala 238:77]
  wire  _T_766 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 239:36]
  wire  _T_767 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 239:56]
  wire  ibuf_wr_en = _T_766 & _T_767; // @[el2_lsu_bus_buffer.scala 239:54]
  wire  _T_768 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 241:36]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 283:59]
  wire  _T_777 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 247:62]
  wire  _T_778 = ibuf_wr_en | _T_777; // @[el2_lsu_bus_buffer.scala 247:48]
  wire  _T_834 = _T_766 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 265:54]
  wire  _T_835 = _T_834 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 265:75]
  wire  _T_836 = _T_835 & ibuf_write; // @[el2_lsu_bus_buffer.scala 265:88]
  wire  _T_839 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 265:124]
  wire  _T_840 = _T_836 & _T_839; // @[el2_lsu_bus_buffer.scala 265:101]
  wire  _T_841 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 265:147]
  wire  _T_842 = _T_840 & _T_841; // @[el2_lsu_bus_buffer.scala 265:145]
  wire  _T_843 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 265:170]
  wire  ibuf_merge_en = _T_842 & _T_843; // @[el2_lsu_bus_buffer.scala 265:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 266:20]
  wire  _T_779 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 247:98]
  wire  _T_780 = ~_T_779; // @[el2_lsu_bus_buffer.scala 247:82]
  wire  _T_781 = _T_778 & _T_780; // @[el2_lsu_bus_buffer.scala 247:80]
  wire  _T_782 = _T_781 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 248:5]
  wire  _T_770 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 242:44]
  wire  _T_771 = io_lsu_busreq_m & _T_770; // @[el2_lsu_bus_buffer.scala 242:42]
  wire  _T_772 = _T_771 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 242:61]
  wire  _T_775 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 242:115]
  wire  _T_776 = io_lsu_pkt_m_load | _T_775; // @[el2_lsu_bus_buffer.scala 242:95]
  wire  ibuf_force_drain = _T_772 & _T_776; // @[el2_lsu_bus_buffer.scala 242:74]
  wire  _T_783 = _T_782 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 248:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_784 = _T_783 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 248:35]
  wire  _T_785 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 248:55]
  wire  _T_786 = _T_784 | _T_785; // @[el2_lsu_bus_buffer.scala 248:53]
  wire  _T_787 = _T_786 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 248:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_787; // @[el2_lsu_bus_buffer.scala 247:32]
  wire  _T_769 = ibuf_drain_vld & _T_768; // @[el2_lsu_bus_buffer.scala 241:34]
  wire  ibuf_rst = _T_769 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 241:49]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 634:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 633:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_794 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 257:77]
  reg [31:0] ibuf_data; // @[el2_lib.scala 491:16]
  wire [7:0] _T_802 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 262:8]
  wire [7:0] _T_804 = _T_779 ? _T_802 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 261:46]
  wire [7:0] _T_809 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 262:8]
  wire [7:0] _T_811 = _T_779 ? _T_809 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 261:46]
  wire [7:0] _T_816 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 262:8]
  wire [7:0] _T_818 = _T_779 ? _T_816 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 261:46]
  wire [7:0] _T_823 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 262:8]
  wire [7:0] _T_825 = _T_779 ? _T_823 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 261:46]
  wire [23:0] _T_827 = {_T_825,_T_818,_T_811}; // @[Cat.scala 29:58]
  wire  _T_828 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 263:59]
  wire [2:0] _T_831 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 263:93]
  wire  _T_846 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 267:65]
  wire  _T_847 = ibuf_merge_en & _T_846; // @[el2_lsu_bus_buffer.scala 267:63]
  wire  _T_850 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 267:96]
  wire  _T_852 = _T_847 ? _T_850 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 267:48]
  wire  _T_857 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 267:96]
  wire  _T_859 = _T_847 ? _T_857 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 267:48]
  wire  _T_864 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 267:96]
  wire  _T_866 = _T_847 ? _T_864 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 267:48]
  wire  _T_871 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 267:96]
  wire  _T_873 = _T_847 ? _T_871 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 267:48]
  wire [3:0] ibuf_byteen_out = {_T_873,_T_866,_T_859,_T_852}; // @[Cat.scala 29:58]
  wire [7:0] _T_883 = _T_847 ? _T_802 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 268:45]
  wire [7:0] _T_891 = _T_847 ? _T_809 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 268:45]
  wire [7:0] _T_899 = _T_847 ? _T_816 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 268:45]
  wire [7:0] _T_907 = _T_847 ? _T_823 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 268:45]
  wire [31:0] ibuf_data_out = {_T_907,_T_899,_T_891,_T_883}; // @[Cat.scala 29:58]
  wire  _T_910 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 270:28]
  wire  _T_911 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 270:63]
  wire  _T_916 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 271:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire [2:0] _GEN_365 = {{2'd0}, buf_write[3]}; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4347 = _GEN_365 == 3'h2; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4348 = buf_write[3] & _T_4347; // @[el2_lsu_bus_buffer.scala 541:64]
  wire  _T_4349 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 541:91]
  wire  _T_4350 = _T_4348 & _T_4349; // @[el2_lsu_bus_buffer.scala 541:89]
  wire [2:0] _GEN_366 = {{2'd0}, buf_write[2]}; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4341 = _GEN_366 == 3'h2; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4342 = buf_write[2] & _T_4341; // @[el2_lsu_bus_buffer.scala 541:64]
  wire  _T_4343 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 541:91]
  wire  _T_4344 = _T_4342 & _T_4343; // @[el2_lsu_bus_buffer.scala 541:89]
  wire [1:0] _T_4351 = _T_4350 + _T_4344; // @[el2_lsu_bus_buffer.scala 541:142]
  wire [2:0] _GEN_367 = {{2'd0}, buf_write[1]}; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4335 = _GEN_367 == 3'h2; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4336 = buf_write[1] & _T_4335; // @[el2_lsu_bus_buffer.scala 541:64]
  wire  _T_4337 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 541:91]
  wire  _T_4338 = _T_4336 & _T_4337; // @[el2_lsu_bus_buffer.scala 541:89]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4338}; // @[el2_lsu_bus_buffer.scala 541:142]
  wire [2:0] _T_4352 = _T_4351 + _GEN_368; // @[el2_lsu_bus_buffer.scala 541:142]
  wire [2:0] _GEN_369 = {{2'd0}, buf_write[0]}; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4329 = _GEN_369 == 3'h2; // @[el2_lsu_bus_buffer.scala 541:79]
  wire  _T_4330 = buf_write[0] & _T_4329; // @[el2_lsu_bus_buffer.scala 541:64]
  wire  _T_4331 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 541:91]
  wire  _T_4332 = _T_4330 & _T_4331; // @[el2_lsu_bus_buffer.scala 541:89]
  wire [2:0] _GEN_370 = {{2'd0}, _T_4332}; // @[el2_lsu_bus_buffer.scala 541:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4352 + _GEN_370; // @[el2_lsu_bus_buffer.scala 541:142]
  wire  _T_942 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:43]
  wire  _T_4369 = _T_4347 & _T_4349; // @[el2_lsu_bus_buffer.scala 542:73]
  wire  _T_4365 = _T_4341 & _T_4343; // @[el2_lsu_bus_buffer.scala 542:73]
  wire [1:0] _T_4370 = _T_4369 + _T_4365; // @[el2_lsu_bus_buffer.scala 542:126]
  wire  _T_4361 = _T_4335 & _T_4337; // @[el2_lsu_bus_buffer.scala 542:73]
  wire [1:0] _GEN_374 = {{1'd0}, _T_4361}; // @[el2_lsu_bus_buffer.scala 542:126]
  wire [2:0] _T_4371 = _T_4370 + _GEN_374; // @[el2_lsu_bus_buffer.scala 542:126]
  wire  _T_4357 = _T_4329 & _T_4331; // @[el2_lsu_bus_buffer.scala 542:73]
  wire [2:0] _GEN_376 = {{2'd0}, _T_4357}; // @[el2_lsu_bus_buffer.scala 542:126]
  wire [3:0] buf_numvld_cmd_any = _T_4371 + _GEN_376; // @[el2_lsu_bus_buffer.scala 542:126]
  wire  _T_943 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:72]
  wire  _T_944 = _T_942 & _T_943; // @[el2_lsu_bus_buffer.scala 293:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 390:54]
  wire  _T_945 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 293:97]
  wire  _T_946 = _T_944 & _T_945; // @[el2_lsu_bus_buffer.scala 293:80]
  wire  _T_948 = _T_946 & _T_843; // @[el2_lsu_bus_buffer.scala 293:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_961 = ~buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 294:31]
  wire  _T_962 = _T_948 & _T_961; // @[el2_lsu_bus_buffer.scala 294:29]
  reg  _T_4236; // @[Reg.scala 27:20]
  reg  _T_4233; // @[Reg.scala 27:20]
  reg  _T_4230; // @[Reg.scala 27:20]
  reg  _T_4227; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4236,_T_4233,_T_4230,_T_4227}; // @[Cat.scala 29:58]
  wire  _T_979 = ~buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 295:5]
  wire  _T_980 = _T_962 & _T_979; // @[el2_lsu_bus_buffer.scala 294:140]
  wire  _T_991 = _T_771 & _T_765; // @[el2_lsu_bus_buffer.scala 297:58]
  wire  _T_993 = _T_991 & _T_943; // @[el2_lsu_bus_buffer.scala 297:72]
  wire  _T_1011 = io_lsu_addr_m[31:2] != buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 297:123]
  wire  obuf_force_wr_en = _T_993 & _T_1011; // @[el2_lsu_bus_buffer.scala 297:101]
  wire  _T_981 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 295:119]
  wire  obuf_wr_wait = _T_980 & _T_981; // @[el2_lsu_bus_buffer.scala 295:117]
  wire  _T_982 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 296:75]
  wire  _T_983 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 296:95]
  wire  _T_984 = _T_982 & _T_983; // @[el2_lsu_bus_buffer.scala 296:79]
  wire [2:0] _T_986 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 296:121]
  wire  _T_4395 = _GEN_365 == 3'h1; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4398 = _T_4395 | _T_4347; // @[el2_lsu_bus_buffer.scala 543:74]
  wire  _T_4400 = _T_4398 & _T_4349; // @[el2_lsu_bus_buffer.scala 543:100]
  wire  _T_4388 = _GEN_366 == 3'h1; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4391 = _T_4388 | _T_4341; // @[el2_lsu_bus_buffer.scala 543:74]
  wire  _T_4393 = _T_4391 & _T_4343; // @[el2_lsu_bus_buffer.scala 543:100]
  wire [1:0] _T_4401 = _T_4400 + _T_4393; // @[el2_lsu_bus_buffer.scala 543:153]
  wire  _T_4381 = _GEN_367 == 3'h1; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4384 = _T_4381 | _T_4335; // @[el2_lsu_bus_buffer.scala 543:74]
  wire  _T_4386 = _T_4384 & _T_4337; // @[el2_lsu_bus_buffer.scala 543:100]
  wire [1:0] _GEN_383 = {{1'd0}, _T_4386}; // @[el2_lsu_bus_buffer.scala 543:153]
  wire [2:0] _T_4402 = _T_4401 + _GEN_383; // @[el2_lsu_bus_buffer.scala 543:153]
  wire  _T_4374 = _GEN_369 == 3'h1; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4377 = _T_4374 | _T_4329; // @[el2_lsu_bus_buffer.scala 543:74]
  wire  _T_4379 = _T_4377 & _T_4331; // @[el2_lsu_bus_buffer.scala 543:100]
  wire [2:0] _GEN_386 = {{2'd0}, _T_4379}; // @[el2_lsu_bus_buffer.scala 543:153]
  wire [3:0] buf_numvld_pend_any = _T_4402 + _GEN_386; // @[el2_lsu_bus_buffer.scala 543:153]
  wire  _T_1013 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 299:53]
  wire  _T_1014 = ibuf_byp & _T_1013; // @[el2_lsu_bus_buffer.scala 299:31]
  wire  _T_1015 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 299:64]
  wire  _T_1016 = _T_1015 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 299:84]
  wire  ibuf_buf_byp = _T_1014 & _T_1016; // @[el2_lsu_bus_buffer.scala 299:61]
  wire  _T_1017 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 314:32]
  wire  _T_4691 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 570:62]
  wire  _T_4693 = _T_4691 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 570:73]
  wire  _T_4694 = _T_4693 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 570:93]
  wire  _T_4695 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 570:62]
  wire  _T_4697 = _T_4695 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 570:73]
  wire  _T_4698 = _T_4697 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 570:93]
  wire  _T_4707 = _T_4694 | _T_4698; // @[el2_lsu_bus_buffer.scala 570:141]
  wire  _T_4699 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 570:62]
  wire  _T_4701 = _T_4699 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 570:73]
  wire  _T_4702 = _T_4701 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 570:93]
  wire  _T_4708 = _T_4707 | _T_4702; // @[el2_lsu_bus_buffer.scala 570:141]
  wire  _T_4703 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 570:62]
  wire  _T_4705 = _T_4703 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 570:73]
  wire  _T_4706 = _T_4705 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 570:93]
  wire  bus_sideeffect_pend = _T_4708 | _T_4706; // @[el2_lsu_bus_buffer.scala 570:141]
  wire  _T_1018 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 314:74]
  wire  _T_1019 = ~_T_1018; // @[el2_lsu_bus_buffer.scala 314:52]
  wire  _T_1020 = _T_1017 & _T_1019; // @[el2_lsu_bus_buffer.scala 314:50]
  wire  _T_1904 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 402:58]
  wire  _T_1905 = ~_T_1904; // @[el2_lsu_bus_buffer.scala 402:45]
  wire  _T_1907 = _T_1905 & _T_2528; // @[el2_lsu_bus_buffer.scala 402:63]
  wire  _T_1909 = _T_1907 & _T_4349; // @[el2_lsu_bus_buffer.scala 402:88]
  wire  _T_1898 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 402:58]
  wire  _T_1899 = ~_T_1898; // @[el2_lsu_bus_buffer.scala 402:45]
  wire  _T_1901 = _T_1899 & _T_2524; // @[el2_lsu_bus_buffer.scala 402:63]
  wire  _T_1903 = _T_1901 & _T_4343; // @[el2_lsu_bus_buffer.scala 402:88]
  wire  _T_1892 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 402:58]
  wire  _T_1893 = ~_T_1892; // @[el2_lsu_bus_buffer.scala 402:45]
  wire  _T_1895 = _T_1893 & _T_2520; // @[el2_lsu_bus_buffer.scala 402:63]
  wire  _T_1897 = _T_1895 & _T_4337; // @[el2_lsu_bus_buffer.scala 402:88]
  wire  _T_1886 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 402:58]
  wire  _T_1887 = ~_T_1886; // @[el2_lsu_bus_buffer.scala 402:45]
  wire  _T_1889 = _T_1887 & _T_2516; // @[el2_lsu_bus_buffer.scala 402:63]
  wire  _T_1891 = _T_1889 & _T_4331; // @[el2_lsu_bus_buffer.scala 402:88]
  wire [3:0] CmdPtr0Dec = {_T_1909,_T_1903,_T_1897,_T_1891}; // @[Cat.scala 29:58]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 407:31]
  wire  _T_1034 = _T_2516 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 315:47]
  wire [3:0] _T_1037 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1054 = ~_T_1037[0]; // @[el2_lsu_bus_buffer.scala 316:23]
  wire  _T_1055 = _T_1034 & _T_1054; // @[el2_lsu_bus_buffer.scala 316:21]
  wire  _T_1072 = buf_sideeffect[0] & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 316:141]
  wire  _T_1073 = ~_T_1072; // @[el2_lsu_bus_buffer.scala 316:105]
  wire  _T_1074 = _T_1055 & _T_1073; // @[el2_lsu_bus_buffer.scala 316:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1077 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1096 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1113 = _T_1077[0] & _T_1096[0]; // @[el2_lsu_bus_buffer.scala 317:77]
  wire  _T_1130 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 317:150]
  wire  _T_1131 = _T_1113 & _T_1130; // @[el2_lsu_bus_buffer.scala 317:148]
  wire  _T_1132 = ~_T_1131; // @[el2_lsu_bus_buffer.scala 317:8]
  wire [3:0] _T_1945 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 403:62]
  wire [3:0] _T_1946 = buf_age_3 & _T_1945; // @[el2_lsu_bus_buffer.scala 403:59]
  wire  _T_1947 = |_T_1946; // @[el2_lsu_bus_buffer.scala 403:76]
  wire  _T_1948 = ~_T_1947; // @[el2_lsu_bus_buffer.scala 403:45]
  wire  _T_1950 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 403:83]
  wire  _T_1951 = _T_1948 & _T_1950; // @[el2_lsu_bus_buffer.scala 403:81]
  wire  _T_1953 = _T_1951 & _T_2528; // @[el2_lsu_bus_buffer.scala 403:98]
  wire  _T_1955 = _T_1953 & _T_4349; // @[el2_lsu_bus_buffer.scala 403:123]
  wire [3:0] _T_1935 = buf_age_2 & _T_1945; // @[el2_lsu_bus_buffer.scala 403:59]
  wire  _T_1936 = |_T_1935; // @[el2_lsu_bus_buffer.scala 403:76]
  wire  _T_1937 = ~_T_1936; // @[el2_lsu_bus_buffer.scala 403:45]
  wire  _T_1939 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 403:83]
  wire  _T_1940 = _T_1937 & _T_1939; // @[el2_lsu_bus_buffer.scala 403:81]
  wire  _T_1942 = _T_1940 & _T_2524; // @[el2_lsu_bus_buffer.scala 403:98]
  wire  _T_1944 = _T_1942 & _T_4343; // @[el2_lsu_bus_buffer.scala 403:123]
  wire [3:0] _T_1924 = buf_age_1 & _T_1945; // @[el2_lsu_bus_buffer.scala 403:59]
  wire  _T_1925 = |_T_1924; // @[el2_lsu_bus_buffer.scala 403:76]
  wire  _T_1926 = ~_T_1925; // @[el2_lsu_bus_buffer.scala 403:45]
  wire  _T_1928 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 403:83]
  wire  _T_1929 = _T_1926 & _T_1928; // @[el2_lsu_bus_buffer.scala 403:81]
  wire  _T_1931 = _T_1929 & _T_2520; // @[el2_lsu_bus_buffer.scala 403:98]
  wire  _T_1933 = _T_1931 & _T_4337; // @[el2_lsu_bus_buffer.scala 403:123]
  wire [3:0] _T_1913 = buf_age_0 & _T_1945; // @[el2_lsu_bus_buffer.scala 403:59]
  wire  _T_1914 = |_T_1913; // @[el2_lsu_bus_buffer.scala 403:76]
  wire  _T_1915 = ~_T_1914; // @[el2_lsu_bus_buffer.scala 403:45]
  wire  _T_1917 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 403:83]
  wire  _T_1918 = _T_1915 & _T_1917; // @[el2_lsu_bus_buffer.scala 403:81]
  wire  _T_1920 = _T_1918 & _T_2516; // @[el2_lsu_bus_buffer.scala 403:98]
  wire  _T_1922 = _T_1920 & _T_4331; // @[el2_lsu_bus_buffer.scala 403:123]
  wire [3:0] CmdPtr1Dec = {_T_1955,_T_1944,_T_1933,_T_1922}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 408:31]
  wire  _T_1133 = _T_1132 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 317:181]
  wire [3:0] _T_1136 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1153 = _T_1133 | _T_1136[0]; // @[el2_lsu_bus_buffer.scala 317:197]
  wire  _T_1154 = _T_1153 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 317:269]
  wire  _T_1155 = _T_1074 & _T_1154; // @[el2_lsu_bus_buffer.scala 316:164]
  wire  _T_1156 = _T_1020 | _T_1155; // @[el2_lsu_bus_buffer.scala 314:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 377:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 378:55]
  wire  _T_4766 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 574:54]
  wire  _T_4767 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 574:75]
  wire  _T_4769 = _T_4766 ? _T_4767 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 574:39]
  wire  bus_cmd_ready = obuf_write ? _T_4769 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 574:23]
  wire  _T_1157 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 318:48]
  wire  _T_1158 = bus_cmd_ready | _T_1157; // @[el2_lsu_bus_buffer.scala 318:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1159 = _T_1158 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 318:60]
  wire  _T_1160 = _T_1156 & _T_1159; // @[el2_lsu_bus_buffer.scala 318:29]
  wire  _T_1161 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 318:77]
  wire  _T_1162 = _T_1160 & _T_1161; // @[el2_lsu_bus_buffer.scala 318:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4714 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 572:56]
  wire  _T_4715 = obuf_valid & _T_4714; // @[el2_lsu_bus_buffer.scala 572:38]
  wire  _T_4717 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 572:126]
  wire  _T_4718 = obuf_merge & _T_4717; // @[el2_lsu_bus_buffer.scala 572:114]
  wire  _T_4719 = _T_3468 | _T_4718; // @[el2_lsu_bus_buffer.scala 572:100]
  wire  _T_4720 = ~_T_4719; // @[el2_lsu_bus_buffer.scala 572:80]
  wire  _T_4721 = _T_4715 & _T_4720; // @[el2_lsu_bus_buffer.scala 572:78]
  wire  _T_4758 = _T_4691 & _T_4721; // @[Mux.scala 27:72]
  wire  _T_4726 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 572:56]
  wire  _T_4727 = obuf_valid & _T_4726; // @[el2_lsu_bus_buffer.scala 572:38]
  wire  _T_4729 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 572:126]
  wire  _T_4730 = obuf_merge & _T_4729; // @[el2_lsu_bus_buffer.scala 572:114]
  wire  _T_4731 = _T_3661 | _T_4730; // @[el2_lsu_bus_buffer.scala 572:100]
  wire  _T_4732 = ~_T_4731; // @[el2_lsu_bus_buffer.scala 572:80]
  wire  _T_4733 = _T_4727 & _T_4732; // @[el2_lsu_bus_buffer.scala 572:78]
  wire  _T_4759 = _T_4695 & _T_4733; // @[Mux.scala 27:72]
  wire  _T_4762 = _T_4758 | _T_4759; // @[Mux.scala 27:72]
  wire  _T_4738 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 572:56]
  wire  _T_4739 = obuf_valid & _T_4738; // @[el2_lsu_bus_buffer.scala 572:38]
  wire  _T_4741 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 572:126]
  wire  _T_4742 = obuf_merge & _T_4741; // @[el2_lsu_bus_buffer.scala 572:114]
  wire  _T_4743 = _T_3854 | _T_4742; // @[el2_lsu_bus_buffer.scala 572:100]
  wire  _T_4744 = ~_T_4743; // @[el2_lsu_bus_buffer.scala 572:80]
  wire  _T_4745 = _T_4739 & _T_4744; // @[el2_lsu_bus_buffer.scala 572:78]
  wire  _T_4760 = _T_4699 & _T_4745; // @[Mux.scala 27:72]
  wire  _T_4763 = _T_4762 | _T_4760; // @[Mux.scala 27:72]
  wire  _T_4750 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 572:56]
  wire  _T_4751 = obuf_valid & _T_4750; // @[el2_lsu_bus_buffer.scala 572:38]
  wire  _T_4753 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 572:126]
  wire  _T_4754 = obuf_merge & _T_4753; // @[el2_lsu_bus_buffer.scala 572:114]
  wire  _T_4755 = _T_4047 | _T_4754; // @[el2_lsu_bus_buffer.scala 572:100]
  wire  _T_4756 = ~_T_4755; // @[el2_lsu_bus_buffer.scala 572:80]
  wire  _T_4757 = _T_4751 & _T_4756; // @[el2_lsu_bus_buffer.scala 572:78]
  wire  _T_4761 = _T_4703 & _T_4757; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4763 | _T_4761; // @[Mux.scala 27:72]
  wire  _T_1165 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 318:118]
  wire  _T_1166 = _T_1162 & _T_1165; // @[el2_lsu_bus_buffer.scala 318:116]
  wire  obuf_wr_en = _T_1166 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 318:142]
  wire  _T_1168 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 320:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 575:39]
  wire  _T_4773 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 577:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 576:39]
  wire  _T_4774 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 577:70]
  wire  _T_4775 = _T_4773 & _T_4774; // @[el2_lsu_bus_buffer.scala 577:52]
  wire  _T_4776 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 577:111]
  wire  bus_cmd_sent = _T_4775 | _T_4776; // @[el2_lsu_bus_buffer.scala 577:89]
  wire  _T_1169 = bus_cmd_sent | _T_1168; // @[el2_lsu_bus_buffer.scala 320:33]
  wire  _T_1170 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 320:65]
  wire  _T_1171 = _T_1169 & _T_1170; // @[el2_lsu_bus_buffer.scala 320:63]
  wire  _T_1172 = _T_1171 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 320:77]
  wire  obuf_rst = _T_1172 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 320:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : buf_write[0]; // @[el2_lsu_bus_buffer.scala 321:26]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : buf_addr_0; // @[el2_lsu_bus_buffer.scala 323:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : buf_sz_0; // @[el2_lsu_bus_buffer.scala 326:23]
  wire  _T_1230 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 334:39]
  wire  _T_1231 = ~_T_1230; // @[el2_lsu_bus_buffer.scala 334:26]
  wire  _T_1237 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 338:72]
  wire  _T_1240 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 338:98]
  wire  _T_1241 = obuf_sz_in[0] & _T_1240; // @[el2_lsu_bus_buffer.scala 338:96]
  wire  _T_1242 = _T_1237 | _T_1241; // @[el2_lsu_bus_buffer.scala 338:79]
  wire  _T_1245 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 338:153]
  wire  _T_1246 = ~_T_1245; // @[el2_lsu_bus_buffer.scala 338:134]
  wire  _T_1247 = obuf_sz_in[1] & _T_1246; // @[el2_lsu_bus_buffer.scala 338:132]
  wire  _T_1248 = _T_1242 | _T_1247; // @[el2_lsu_bus_buffer.scala 338:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1248; // @[el2_lsu_bus_buffer.scala 338:28]
  wire  _T_1265 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 352:40]
  wire  _T_1266 = _T_1265 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 352:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1267 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 352:80]
  wire  _T_1268 = _T_1266 & _T_1267; // @[el2_lsu_bus_buffer.scala 352:78]
  wire  _T_1269 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 352:99]
  wire  _T_1270 = _T_1268 & _T_1269; // @[el2_lsu_bus_buffer.scala 352:97]
  wire  _T_1271 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 352:113]
  wire  _T_1272 = _T_1270 & _T_1271; // @[el2_lsu_bus_buffer.scala 352:111]
  wire  _T_1273 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 352:130]
  wire  _T_1274 = _T_1272 & _T_1273; // @[el2_lsu_bus_buffer.scala 352:128]
  wire  _T_1275 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 353:20]
  wire  _T_1276 = obuf_valid & _T_1275; // @[el2_lsu_bus_buffer.scala 353:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 379:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 578:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 380:55]
  wire  _T_1277 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 353:90]
  wire  _T_1278 = bus_rsp_read & _T_1277; // @[el2_lsu_bus_buffer.scala 353:70]
  wire  _T_1279 = ~_T_1278; // @[el2_lsu_bus_buffer.scala 353:55]
  wire  _T_1280 = obuf_rdrsp_pend & _T_1279; // @[el2_lsu_bus_buffer.scala 353:53]
  wire  _T_1281 = _T_1276 | _T_1280; // @[el2_lsu_bus_buffer.scala 353:34]
  wire  obuf_nosend_in = _T_1274 & _T_1281; // @[el2_lsu_bus_buffer.scala 352:165]
  wire  _T_1249 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 346:44]
  wire  _T_1250 = obuf_wr_en & _T_1249; // @[el2_lsu_bus_buffer.scala 346:42]
  wire  _T_1251 = ~_T_1250; // @[el2_lsu_bus_buffer.scala 346:29]
  wire  _T_1252 = _T_1251 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 346:61]
  wire  _T_1256 = _T_1252 & _T_1279; // @[el2_lsu_bus_buffer.scala 346:79]
  wire  _T_1258 = bus_cmd_sent & _T_1269; // @[el2_lsu_bus_buffer.scala 347:20]
  wire  _T_1259 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 347:37]
  wire  _T_1260 = _T_1258 & _T_1259; // @[el2_lsu_bus_buffer.scala 347:35]
  wire  _T_1262 = bus_cmd_sent | _T_1269; // @[el2_lsu_bus_buffer.scala 349:44]
  wire [7:0] _T_1284 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1285 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1286 = io_lsu_addr_r[2] ? _T_1284 : _T_1285; // @[el2_lsu_bus_buffer.scala 354:46]
  wire [7:0] _T_1313 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1326 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1327 = buf_addr_0[2] ? _T_1313 : _T_1326; // @[el2_lsu_bus_buffer.scala 355:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1286 : _T_1327; // @[el2_lsu_bus_buffer.scala 354:28]
  wire [7:0] _T_1329 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1330 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1331 = io_end_addr_r[2] ? _T_1329 : _T_1330; // @[el2_lsu_bus_buffer.scala 356:46]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1331 : _T_1327; // @[el2_lsu_bus_buffer.scala 356:28]
  wire [63:0] _T_1403 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1416 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1417 = buf_addr_0[2] ? _T_1403 : _T_1416; // @[el2_lsu_bus_buffer.scala 360:8]
  wire [63:0] _T_1419 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1420 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1421 = io_lsu_addr_r[2] ? _T_1419 : _T_1420; // @[el2_lsu_bus_buffer.scala 361:44]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1421 : _T_1417; // @[el2_lsu_bus_buffer.scala 361:26]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire  _T_1762 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 372:19]
  wire  obuf_merge_en = _T_1762 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 372:35]
  wire  _T_1465 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1466 = obuf_byteen0_in[0] | _T_1465; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1469 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1470 = obuf_byteen0_in[1] | _T_1469; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1473 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1474 = obuf_byteen0_in[2] | _T_1473; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1477 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1478 = obuf_byteen0_in[3] | _T_1477; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1481 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1482 = obuf_byteen0_in[4] | _T_1481; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1485 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1486 = obuf_byteen0_in[5] | _T_1485; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1489 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1490 = obuf_byteen0_in[6] | _T_1489; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1493 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1494 = obuf_byteen0_in[7] | _T_1493; // @[el2_lsu_bus_buffer.scala 363:63]
  wire [7:0] obuf_byteen_in = {_T_1494,_T_1490,_T_1486,_T_1482,_T_1478,_T_1474,_T_1470,_T_1466}; // @[Cat.scala 29:58]
  wire [7:0] _T_1505 = _T_1465 ? obuf_data1_in[7:0] : obuf_data1_in[7:0]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1510 = _T_1469 ? obuf_data1_in[15:8] : obuf_data1_in[15:8]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1515 = _T_1473 ? obuf_data1_in[23:16] : obuf_data1_in[23:16]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1520 = _T_1477 ? obuf_data1_in[31:24] : obuf_data1_in[31:24]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1525 = _T_1481 ? obuf_data1_in[39:32] : obuf_data1_in[39:32]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1530 = _T_1485 ? obuf_data1_in[47:40] : obuf_data1_in[47:40]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1535 = _T_1489 ? obuf_data1_in[55:48] : obuf_data1_in[55:48]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1540 = _T_1493 ? obuf_data1_in[63:56] : obuf_data1_in[63:56]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [55:0] _T_1546 = {_T_1540,_T_1535,_T_1530,_T_1525,_T_1520,_T_1515,_T_1510}; // @[Cat.scala 29:58]
  wire  _T_1765 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 375:58]
  wire  _T_1766 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 375:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 491:16]
  wire  _T_1779 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1780 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1781 = ibuf_valid & _T_1780; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1782 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1783 = io_lsu_busreq_r & _T_1782; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1784 = _T_1781 | _T_1783; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1785 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1786 = io_ldst_dual_r & _T_1785; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1787 = _T_1784 | _T_1786; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1788 = ~_T_1787; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1789 = _T_1779 & _T_1788; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1790 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1791 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1792 = ibuf_valid & _T_1791; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1793 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1794 = io_lsu_busreq_r & _T_1793; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1795 = _T_1792 | _T_1794; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1796 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1797 = io_ldst_dual_r & _T_1796; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1798 = _T_1795 | _T_1797; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1799 = ~_T_1798; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1800 = _T_1790 & _T_1799; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1801 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1802 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1803 = ibuf_valid & _T_1802; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1804 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1805 = io_lsu_busreq_r & _T_1804; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1806 = _T_1803 | _T_1805; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1807 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1808 = io_ldst_dual_r & _T_1807; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1809 = _T_1806 | _T_1808; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1810 = ~_T_1809; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1811 = _T_1801 & _T_1810; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1812 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1813 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1814 = ibuf_valid & _T_1813; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1815 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1816 = io_lsu_busreq_r & _T_1815; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1817 = _T_1814 | _T_1816; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1818 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1819 = io_ldst_dual_r & _T_1818; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1820 = _T_1817 | _T_1819; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1821 = ~_T_1820; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1822 = _T_1812 & _T_1821; // @[el2_lsu_bus_buffer.scala 392:70]
  wire [1:0] _T_1823 = _T_1822 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1824 = _T_1811 ? 2'h2 : _T_1823; // @[Mux.scala 98:16]
  wire [1:0] _T_1825 = _T_1800 ? 2'h1 : _T_1824; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1789 ? 2'h0 : _T_1825; // @[Mux.scala 98:16]
  wire  _T_1830 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1831 = io_lsu_busreq_m & _T_1830; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1832 = _T_1781 | _T_1831; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1835 = _T_1832 | _T_1783; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1838 = _T_1835 | _T_1786; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1839 = ~_T_1838; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1840 = _T_1779 & _T_1839; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1844 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1845 = io_lsu_busreq_m & _T_1844; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1846 = _T_1792 | _T_1845; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1849 = _T_1846 | _T_1794; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1852 = _T_1849 | _T_1797; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1853 = ~_T_1852; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1854 = _T_1790 & _T_1853; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1858 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1859 = io_lsu_busreq_m & _T_1858; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1860 = _T_1803 | _T_1859; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1863 = _T_1860 | _T_1805; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1866 = _T_1863 | _T_1808; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1867 = ~_T_1866; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1868 = _T_1801 & _T_1867; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1872 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1873 = io_lsu_busreq_m & _T_1872; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1874 = _T_1814 | _T_1873; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1877 = _T_1874 | _T_1816; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1880 = _T_1877 | _T_1819; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1881 = ~_T_1880; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1882 = _T_1812 & _T_1881; // @[el2_lsu_bus_buffer.scala 395:70]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 521:63]
  wire  _T_2652 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2653 = buf_rspageQ_0[3] & _T_2652; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2649 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2650 = buf_rspageQ_0[2] & _T_2649; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2646 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2647 = buf_rspageQ_0[1] & _T_2646; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2643 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2644 = buf_rspageQ_0[0] & _T_2643; // @[el2_lsu_bus_buffer.scala 435:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2653,_T_2650,_T_2647,_T_2644}; // @[Cat.scala 29:58]
  wire  _T_1958 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 406:65]
  wire  _T_1959 = ~_T_1958; // @[el2_lsu_bus_buffer.scala 406:44]
  wire  _T_1961 = _T_1959 & _T_2643; // @[el2_lsu_bus_buffer.scala 406:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 521:63]
  wire  _T_2668 = buf_rspageQ_1[3] & _T_2652; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2665 = buf_rspageQ_1[2] & _T_2649; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2662 = buf_rspageQ_1[1] & _T_2646; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2659 = buf_rspageQ_1[0] & _T_2643; // @[el2_lsu_bus_buffer.scala 435:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2668,_T_2665,_T_2662,_T_2659}; // @[Cat.scala 29:58]
  wire  _T_1962 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 406:65]
  wire  _T_1963 = ~_T_1962; // @[el2_lsu_bus_buffer.scala 406:44]
  wire  _T_1965 = _T_1963 & _T_2646; // @[el2_lsu_bus_buffer.scala 406:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 521:63]
  wire  _T_2683 = buf_rspageQ_2[3] & _T_2652; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2680 = buf_rspageQ_2[2] & _T_2649; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2677 = buf_rspageQ_2[1] & _T_2646; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2674 = buf_rspageQ_2[0] & _T_2643; // @[el2_lsu_bus_buffer.scala 435:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2683,_T_2680,_T_2677,_T_2674}; // @[Cat.scala 29:58]
  wire  _T_1966 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 406:65]
  wire  _T_1967 = ~_T_1966; // @[el2_lsu_bus_buffer.scala 406:44]
  wire  _T_1969 = _T_1967 & _T_2649; // @[el2_lsu_bus_buffer.scala 406:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 521:63]
  wire  _T_2698 = buf_rspageQ_3[3] & _T_2652; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2695 = buf_rspageQ_3[2] & _T_2649; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2692 = buf_rspageQ_3[1] & _T_2646; // @[el2_lsu_bus_buffer.scala 435:89]
  wire  _T_2689 = buf_rspageQ_3[0] & _T_2643; // @[el2_lsu_bus_buffer.scala 435:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2698,_T_2695,_T_2692,_T_2689}; // @[Cat.scala 29:58]
  wire  _T_1970 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 406:65]
  wire  _T_1971 = ~_T_1970; // @[el2_lsu_bus_buffer.scala 406:44]
  wire  _T_1973 = _T_1971 & _T_2652; // @[el2_lsu_bus_buffer.scala 406:70]
  wire [7:0] _T_1979 = {4'h0,_T_1909,_T_1903,_T_1897,_T_1891}; // @[Cat.scala 29:58]
  wire  _T_1982 = _T_1979[4] | _T_1979[5]; // @[el2_lsu_bus_buffer.scala 410:42]
  wire  _T_1984 = _T_1982 | _T_1979[6]; // @[el2_lsu_bus_buffer.scala 410:48]
  wire  _T_1986 = _T_1984 | _T_1979[7]; // @[el2_lsu_bus_buffer.scala 410:54]
  wire  _T_1989 = _T_1979[2] | _T_1979[3]; // @[el2_lsu_bus_buffer.scala 410:67]
  wire  _T_1991 = _T_1989 | _T_1979[6]; // @[el2_lsu_bus_buffer.scala 410:73]
  wire  _T_1993 = _T_1991 | _T_1979[7]; // @[el2_lsu_bus_buffer.scala 410:79]
  wire  _T_1996 = _T_1979[1] | _T_1979[3]; // @[el2_lsu_bus_buffer.scala 410:92]
  wire  _T_1998 = _T_1996 | _T_1979[5]; // @[el2_lsu_bus_buffer.scala 410:98]
  wire  _T_2000 = _T_1998 | _T_1979[7]; // @[el2_lsu_bus_buffer.scala 410:104]
  wire [1:0] _T_2001 = {_T_1986,_T_1993}; // @[Cat.scala 29:58]
  wire [7:0] _T_2027 = {4'h0,_T_1973,_T_1969,_T_1965,_T_1961}; // @[Cat.scala 29:58]
  wire  _T_2030 = _T_2027[4] | _T_2027[5]; // @[el2_lsu_bus_buffer.scala 410:42]
  wire  _T_2032 = _T_2030 | _T_2027[6]; // @[el2_lsu_bus_buffer.scala 410:48]
  wire  _T_2034 = _T_2032 | _T_2027[7]; // @[el2_lsu_bus_buffer.scala 410:54]
  wire  _T_2037 = _T_2027[2] | _T_2027[3]; // @[el2_lsu_bus_buffer.scala 410:67]
  wire  _T_2039 = _T_2037 | _T_2027[6]; // @[el2_lsu_bus_buffer.scala 410:73]
  wire  _T_2041 = _T_2039 | _T_2027[7]; // @[el2_lsu_bus_buffer.scala 410:79]
  wire  _T_2044 = _T_2027[1] | _T_2027[3]; // @[el2_lsu_bus_buffer.scala 410:92]
  wire  _T_2046 = _T_2044 | _T_2027[5]; // @[el2_lsu_bus_buffer.scala 410:98]
  wire  _T_2048 = _T_2046 | _T_2027[7]; // @[el2_lsu_bus_buffer.scala 410:104]
  wire [2:0] RspPtr = {_T_2034,_T_2041,_T_2048}; // @[Cat.scala 29:58]
  wire  _T_3438 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 464:77]
  wire  _T_3439 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 464:97]
  wire  _T_3440 = _T_3438 & _T_3439; // @[el2_lsu_bus_buffer.scala 464:95]
  wire  _T_3441 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 464:117]
  wire  _T_3442 = _T_3440 & _T_3441; // @[el2_lsu_bus_buffer.scala 464:112]
  wire  _T_3443 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 464:144]
  wire  _T_3444 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 464:166]
  wire  _T_3445 = _T_3443 & _T_3444; // @[el2_lsu_bus_buffer.scala 464:161]
  wire  _T_3446 = _T_3442 | _T_3445; // @[el2_lsu_bus_buffer.scala 464:132]
  wire  _T_3447 = _T_766 & _T_3446; // @[el2_lsu_bus_buffer.scala 464:63]
  wire  _T_3448 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 464:206]
  wire  _T_3449 = ibuf_drain_vld & _T_3448; // @[el2_lsu_bus_buffer.scala 464:201]
  wire  _T_3450 = _T_3447 | _T_3449; // @[el2_lsu_bus_buffer.scala 464:183]
  wire  _T_3460 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 471:46]
  wire  _T_3495 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 579:38]
  wire  _T_3540 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 489:73]
  wire  _T_3541 = bus_rsp_write & _T_3540; // @[el2_lsu_bus_buffer.scala 489:52]
  wire  _T_3542 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 490:46]
  reg  _T_4213; // @[Reg.scala 27:20]
  reg  _T_4211; // @[Reg.scala 27:20]
  reg  _T_4209; // @[Reg.scala 27:20]
  reg  _T_4207; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4213,_T_4211,_T_4209,_T_4207}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_387 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3544 = io_lsu_axi_rid == _GEN_387; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3545 = buf_ldfwd[0] & _T_3544; // @[el2_lsu_bus_buffer.scala 491:27]
  wire  _T_3546 = _T_3542 | _T_3545; // @[el2_lsu_bus_buffer.scala 490:77]
  wire  _T_3547 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 492:26]
  wire  _T_3550 = _T_3547 & _T_1130; // @[el2_lsu_bus_buffer.scala 492:42]
  wire  _T_3551 = _T_3550 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 492:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_388 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_3552 = io_lsu_axi_rid == _GEN_388; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_3553 = _T_3551 & _T_3552; // @[el2_lsu_bus_buffer.scala 492:74]
  wire  _T_3554 = _T_3546 | _T_3553; // @[el2_lsu_bus_buffer.scala 491:71]
  wire  _T_3555 = bus_rsp_read & _T_3554; // @[el2_lsu_bus_buffer.scala 490:25]
  wire  _T_3556 = _T_3541 | _T_3555; // @[el2_lsu_bus_buffer.scala 489:105]
  wire  _GEN_42 = _T_3495 & _T_3556; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3461 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3457 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3434 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3582 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3592 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 504:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [2:0] _GEN_390 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_3594 = io_lsu_axi_rid == _GEN_390; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_3595 = _T_3592[0] & _T_3594; // @[el2_lsu_bus_buffer.scala 504:38]
  wire  _T_3596 = _T_3552 | _T_3595; // @[el2_lsu_bus_buffer.scala 503:95]
  wire  _T_3597 = bus_rsp_read & _T_3596; // @[el2_lsu_bus_buffer.scala 503:45]
  wire  _GEN_36 = _T_3582 & _T_3597; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3495 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3461 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3457 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3434 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3474 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_3475 = _T_3474 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 477:70]
  wire  _T_3600 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3603 = RspPtr == 3'h0; // @[el2_lsu_bus_buffer.scala 509:37]
  wire  _T_3604 = _GEN_388 == RspPtr; // @[el2_lsu_bus_buffer.scala 509:98]
  wire  _T_3605 = buf_dual_0 & _T_3604; // @[el2_lsu_bus_buffer.scala 509:80]
  wire  _T_3606 = _T_3603 | _T_3605; // @[el2_lsu_bus_buffer.scala 509:65]
  wire  _T_3607 = _T_3606 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 509:112]
  wire  _T_3608 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3600 ? _T_3607 : _T_3608; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3582 ? _T_3475 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3495 ? _T_3475 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3461 ? _T_3475 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3457 ? _T_3460 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3434 ? _T_3450 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2051 = _T_1779 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 427:94]
  wire  _T_2052 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 428:20]
  wire  _T_2055 = _T_2516 & _T_4331; // @[el2_lsu_bus_buffer.scala 428:57]
  wire  _T_2056 = _T_2052 | _T_2055; // @[el2_lsu_bus_buffer.scala 428:31]
  wire  _T_2057 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 429:23]
  wire  _T_2059 = _T_2057 & _T_3438; // @[el2_lsu_bus_buffer.scala 429:41]
  wire  _T_2061 = _T_2059 & _T_1782; // @[el2_lsu_bus_buffer.scala 429:71]
  wire  _T_2063 = _T_2061 & _T_1780; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2064 = _T_2056 | _T_2063; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2065 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 430:17]
  wire  _T_2066 = _T_2065 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 430:35]
  wire  _T_2068 = _T_2066 & _T_1785; // @[el2_lsu_bus_buffer.scala 430:52]
  wire  _T_2070 = _T_2068 & _T_1782; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2071 = _T_2064 | _T_2070; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2072 = _T_2051 & _T_2071; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2074 = _T_2072 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2077 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 428:20]
  wire  _T_2080 = _T_2520 & _T_4337; // @[el2_lsu_bus_buffer.scala 428:57]
  wire  _T_2081 = _T_2077 | _T_2080; // @[el2_lsu_bus_buffer.scala 428:31]
  wire  _T_2088 = _T_2061 & _T_1791; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2089 = _T_2081 | _T_2088; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2095 = _T_2068 & _T_1793; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2096 = _T_2089 | _T_2095; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2097 = _T_2051 & _T_2096; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2099 = _T_2097 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2102 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 428:20]
  wire  _T_2105 = _T_2524 & _T_4343; // @[el2_lsu_bus_buffer.scala 428:57]
  wire  _T_2106 = _T_2102 | _T_2105; // @[el2_lsu_bus_buffer.scala 428:31]
  wire  _T_2113 = _T_2061 & _T_1802; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2114 = _T_2106 | _T_2113; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2120 = _T_2068 & _T_1804; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2121 = _T_2114 | _T_2120; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2122 = _T_2051 & _T_2121; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2124 = _T_2122 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2127 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 428:20]
  wire  _T_2130 = _T_2528 & _T_4349; // @[el2_lsu_bus_buffer.scala 428:57]
  wire  _T_2131 = _T_2127 | _T_2130; // @[el2_lsu_bus_buffer.scala 428:31]
  wire  _T_2138 = _T_2061 & _T_1813; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2139 = _T_2131 | _T_2138; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2145 = _T_2068 & _T_1815; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2146 = _T_2139 | _T_2145; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2147 = _T_2051 & _T_2146; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2149 = _T_2147 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire [2:0] _T_2151 = {_T_2149,_T_2124,_T_2099}; // @[Cat.scala 29:58]
  wire  _T_3634 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 464:117]
  wire  _T_3635 = _T_3440 & _T_3634; // @[el2_lsu_bus_buffer.scala 464:112]
  wire  _T_3637 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 464:166]
  wire  _T_3638 = _T_3443 & _T_3637; // @[el2_lsu_bus_buffer.scala 464:161]
  wire  _T_3639 = _T_3635 | _T_3638; // @[el2_lsu_bus_buffer.scala 464:132]
  wire  _T_3640 = _T_766 & _T_3639; // @[el2_lsu_bus_buffer.scala 464:63]
  wire  _T_3641 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 464:206]
  wire  _T_3642 = ibuf_drain_vld & _T_3641; // @[el2_lsu_bus_buffer.scala 464:201]
  wire  _T_3643 = _T_3640 | _T_3642; // @[el2_lsu_bus_buffer.scala 464:183]
  wire  _T_3688 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3733 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 489:73]
  wire  _T_3734 = bus_rsp_write & _T_3733; // @[el2_lsu_bus_buffer.scala 489:52]
  wire  _T_3735 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 490:46]
  wire [2:0] _GEN_392 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3737 = io_lsu_axi_rid == _GEN_392; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3738 = buf_ldfwd[1] & _T_3737; // @[el2_lsu_bus_buffer.scala 491:27]
  wire  _T_3739 = _T_3735 | _T_3738; // @[el2_lsu_bus_buffer.scala 490:77]
  wire  _T_3740 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 492:26]
  wire  _T_3742 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 492:44]
  wire  _T_3743 = _T_3740 & _T_3742; // @[el2_lsu_bus_buffer.scala 492:42]
  wire  _T_3744 = _T_3743 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 492:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_393 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_3745 = io_lsu_axi_rid == _GEN_393; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_3746 = _T_3744 & _T_3745; // @[el2_lsu_bus_buffer.scala 492:74]
  wire  _T_3747 = _T_3739 | _T_3746; // @[el2_lsu_bus_buffer.scala 491:71]
  wire  _T_3748 = bus_rsp_read & _T_3747; // @[el2_lsu_bus_buffer.scala 490:25]
  wire  _T_3749 = _T_3734 | _T_3748; // @[el2_lsu_bus_buffer.scala 489:105]
  wire  _GEN_118 = _T_3688 & _T_3749; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3654 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3650 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3627 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3775 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3785 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 504:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [2:0] _GEN_395 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_3787 = io_lsu_axi_rid == _GEN_395; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_3788 = _T_3785[0] & _T_3787; // @[el2_lsu_bus_buffer.scala 504:38]
  wire  _T_3789 = _T_3745 | _T_3788; // @[el2_lsu_bus_buffer.scala 503:95]
  wire  _T_3790 = bus_rsp_read & _T_3789; // @[el2_lsu_bus_buffer.scala 503:45]
  wire  _GEN_112 = _T_3775 & _T_3790; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3688 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3654 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3650 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3627 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3667 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_3668 = _T_3667 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 477:70]
  wire  _T_3793 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3796 = RspPtr == 3'h1; // @[el2_lsu_bus_buffer.scala 509:37]
  wire  _T_3797 = _GEN_393 == RspPtr; // @[el2_lsu_bus_buffer.scala 509:98]
  wire  _T_3798 = buf_dual_1 & _T_3797; // @[el2_lsu_bus_buffer.scala 509:80]
  wire  _T_3799 = _T_3796 | _T_3798; // @[el2_lsu_bus_buffer.scala 509:65]
  wire  _T_3800 = _T_3799 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 509:112]
  wire  _T_3801 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3793 ? _T_3800 : _T_3801; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3775 ? _T_3668 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3688 ? _T_3668 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3654 ? _T_3668 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3650 ? _T_3460 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3627 ? _T_3643 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2153 = _T_1790 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 427:94]
  wire  _T_2163 = _T_2059 & _T_1793; // @[el2_lsu_bus_buffer.scala 429:71]
  wire  _T_2165 = _T_2163 & _T_1780; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2166 = _T_2056 | _T_2165; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2170 = _T_2066 & _T_1796; // @[el2_lsu_bus_buffer.scala 430:52]
  wire  _T_2172 = _T_2170 & _T_1782; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2173 = _T_2166 | _T_2172; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2174 = _T_2153 & _T_2173; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2176 = _T_2174 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2190 = _T_2163 & _T_1791; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2191 = _T_2081 | _T_2190; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2197 = _T_2170 & _T_1793; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2198 = _T_2191 | _T_2197; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2199 = _T_2153 & _T_2198; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2201 = _T_2199 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2215 = _T_2163 & _T_1802; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2216 = _T_2106 | _T_2215; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2222 = _T_2170 & _T_1804; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2223 = _T_2216 | _T_2222; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2224 = _T_2153 & _T_2223; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2226 = _T_2224 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2240 = _T_2163 & _T_1813; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2241 = _T_2131 | _T_2240; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2247 = _T_2170 & _T_1815; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2248 = _T_2241 | _T_2247; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2249 = _T_2153 & _T_2248; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2251 = _T_2249 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire [2:0] _T_2253 = {_T_2251,_T_2226,_T_2201}; // @[Cat.scala 29:58]
  wire  _T_3827 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 464:117]
  wire  _T_3828 = _T_3440 & _T_3827; // @[el2_lsu_bus_buffer.scala 464:112]
  wire  _T_3830 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 464:166]
  wire  _T_3831 = _T_3443 & _T_3830; // @[el2_lsu_bus_buffer.scala 464:161]
  wire  _T_3832 = _T_3828 | _T_3831; // @[el2_lsu_bus_buffer.scala 464:132]
  wire  _T_3833 = _T_766 & _T_3832; // @[el2_lsu_bus_buffer.scala 464:63]
  wire  _T_3834 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 464:206]
  wire  _T_3835 = ibuf_drain_vld & _T_3834; // @[el2_lsu_bus_buffer.scala 464:201]
  wire  _T_3836 = _T_3833 | _T_3835; // @[el2_lsu_bus_buffer.scala 464:183]
  wire  _T_3881 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3926 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 489:73]
  wire  _T_3927 = bus_rsp_write & _T_3926; // @[el2_lsu_bus_buffer.scala 489:52]
  wire  _T_3928 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 490:46]
  wire [2:0] _GEN_397 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3930 = io_lsu_axi_rid == _GEN_397; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3931 = buf_ldfwd[2] & _T_3930; // @[el2_lsu_bus_buffer.scala 491:27]
  wire  _T_3932 = _T_3928 | _T_3931; // @[el2_lsu_bus_buffer.scala 490:77]
  wire  _T_3933 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 492:26]
  wire  _T_3935 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 492:44]
  wire  _T_3936 = _T_3933 & _T_3935; // @[el2_lsu_bus_buffer.scala 492:42]
  wire  _T_3937 = _T_3936 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 492:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_398 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_3938 = io_lsu_axi_rid == _GEN_398; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_3939 = _T_3937 & _T_3938; // @[el2_lsu_bus_buffer.scala 492:74]
  wire  _T_3940 = _T_3932 | _T_3939; // @[el2_lsu_bus_buffer.scala 491:71]
  wire  _T_3941 = bus_rsp_read & _T_3940; // @[el2_lsu_bus_buffer.scala 490:25]
  wire  _T_3942 = _T_3927 | _T_3941; // @[el2_lsu_bus_buffer.scala 489:105]
  wire  _GEN_194 = _T_3881 & _T_3942; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3847 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3843 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3820 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_3968 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_3978 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 504:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [2:0] _GEN_400 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_3980 = io_lsu_axi_rid == _GEN_400; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_3981 = _T_3978[0] & _T_3980; // @[el2_lsu_bus_buffer.scala 504:38]
  wire  _T_3982 = _T_3938 | _T_3981; // @[el2_lsu_bus_buffer.scala 503:95]
  wire  _T_3983 = bus_rsp_read & _T_3982; // @[el2_lsu_bus_buffer.scala 503:45]
  wire  _GEN_188 = _T_3968 & _T_3983; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3881 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3847 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3843 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3820 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3860 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_3861 = _T_3860 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 477:70]
  wire  _T_3986 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3989 = RspPtr == 3'h2; // @[el2_lsu_bus_buffer.scala 509:37]
  wire  _T_3990 = _GEN_398 == RspPtr; // @[el2_lsu_bus_buffer.scala 509:98]
  wire  _T_3991 = buf_dual_2 & _T_3990; // @[el2_lsu_bus_buffer.scala 509:80]
  wire  _T_3992 = _T_3989 | _T_3991; // @[el2_lsu_bus_buffer.scala 509:65]
  wire  _T_3993 = _T_3992 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 509:112]
  wire  _T_3994 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_3986 ? _T_3993 : _T_3994; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_3968 ? _T_3861 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3881 ? _T_3861 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3847 ? _T_3861 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3843 ? _T_3460 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3820 ? _T_3836 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2255 = _T_1801 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 427:94]
  wire  _T_2265 = _T_2059 & _T_1804; // @[el2_lsu_bus_buffer.scala 429:71]
  wire  _T_2267 = _T_2265 & _T_1780; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2268 = _T_2056 | _T_2267; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2272 = _T_2066 & _T_1807; // @[el2_lsu_bus_buffer.scala 430:52]
  wire  _T_2274 = _T_2272 & _T_1782; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2275 = _T_2268 | _T_2274; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2276 = _T_2255 & _T_2275; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2278 = _T_2276 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2292 = _T_2265 & _T_1791; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2293 = _T_2081 | _T_2292; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2299 = _T_2272 & _T_1793; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2300 = _T_2293 | _T_2299; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2301 = _T_2255 & _T_2300; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2303 = _T_2301 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2317 = _T_2265 & _T_1802; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2318 = _T_2106 | _T_2317; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2324 = _T_2272 & _T_1804; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2325 = _T_2318 | _T_2324; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2326 = _T_2255 & _T_2325; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2328 = _T_2326 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2342 = _T_2265 & _T_1813; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2343 = _T_2131 | _T_2342; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2349 = _T_2272 & _T_1815; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2350 = _T_2343 | _T_2349; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2351 = _T_2255 & _T_2350; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2353 = _T_2351 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire [2:0] _T_2355 = {_T_2353,_T_2328,_T_2303}; // @[Cat.scala 29:58]
  wire  _T_4020 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 464:117]
  wire  _T_4021 = _T_3440 & _T_4020; // @[el2_lsu_bus_buffer.scala 464:112]
  wire  _T_4023 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 464:166]
  wire  _T_4024 = _T_3443 & _T_4023; // @[el2_lsu_bus_buffer.scala 464:161]
  wire  _T_4025 = _T_4021 | _T_4024; // @[el2_lsu_bus_buffer.scala 464:132]
  wire  _T_4026 = _T_766 & _T_4025; // @[el2_lsu_bus_buffer.scala 464:63]
  wire  _T_4027 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 464:206]
  wire  _T_4028 = ibuf_drain_vld & _T_4027; // @[el2_lsu_bus_buffer.scala 464:201]
  wire  _T_4029 = _T_4026 | _T_4028; // @[el2_lsu_bus_buffer.scala 464:183]
  wire  _T_4074 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4119 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 489:73]
  wire  _T_4120 = bus_rsp_write & _T_4119; // @[el2_lsu_bus_buffer.scala 489:52]
  wire  _T_4121 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 490:46]
  wire [2:0] _GEN_402 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_4123 = io_lsu_axi_rid == _GEN_402; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_4124 = buf_ldfwd[3] & _T_4123; // @[el2_lsu_bus_buffer.scala 491:27]
  wire  _T_4125 = _T_4121 | _T_4124; // @[el2_lsu_bus_buffer.scala 490:77]
  wire  _T_4126 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 492:26]
  wire  _T_4128 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 492:44]
  wire  _T_4129 = _T_4126 & _T_4128; // @[el2_lsu_bus_buffer.scala 492:42]
  wire  _T_4130 = _T_4129 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 492:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_403 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_4131 = io_lsu_axi_rid == _GEN_403; // @[el2_lsu_bus_buffer.scala 492:94]
  wire  _T_4132 = _T_4130 & _T_4131; // @[el2_lsu_bus_buffer.scala 492:74]
  wire  _T_4133 = _T_4125 | _T_4132; // @[el2_lsu_bus_buffer.scala 491:71]
  wire  _T_4134 = bus_rsp_read & _T_4133; // @[el2_lsu_bus_buffer.scala 490:25]
  wire  _T_4135 = _T_4120 | _T_4134; // @[el2_lsu_bus_buffer.scala 489:105]
  wire  _GEN_270 = _T_4074 & _T_4135; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4040 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4036 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4013 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4161 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4171 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 504:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 504:58]
  wire [2:0] _GEN_405 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_4173 = io_lsu_axi_rid == _GEN_405; // @[el2_lsu_bus_buffer.scala 504:58]
  wire  _T_4174 = _T_4171[0] & _T_4173; // @[el2_lsu_bus_buffer.scala 504:38]
  wire  _T_4175 = _T_4131 | _T_4174; // @[el2_lsu_bus_buffer.scala 503:95]
  wire  _T_4176 = bus_rsp_read & _T_4175; // @[el2_lsu_bus_buffer.scala 503:45]
  wire  _GEN_264 = _T_4161 & _T_4176; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4074 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4040 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4036 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4013 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4053 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 477:49]
  wire  _T_4054 = _T_4053 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 477:70]
  wire  _T_4179 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4182 = RspPtr == 3'h3; // @[el2_lsu_bus_buffer.scala 509:37]
  wire  _T_4183 = _GEN_403 == RspPtr; // @[el2_lsu_bus_buffer.scala 509:98]
  wire  _T_4184 = buf_dual_3 & _T_4183; // @[el2_lsu_bus_buffer.scala 509:80]
  wire  _T_4185 = _T_4182 | _T_4184; // @[el2_lsu_bus_buffer.scala 509:65]
  wire  _T_4186 = _T_4185 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 509:112]
  wire  _T_4187 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4179 ? _T_4186 : _T_4187; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4161 ? _T_4054 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4074 ? _T_4054 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4040 ? _T_4054 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4036 ? _T_3460 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4013 ? _T_4029 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2357 = _T_1812 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 427:94]
  wire  _T_2367 = _T_2059 & _T_1815; // @[el2_lsu_bus_buffer.scala 429:71]
  wire  _T_2369 = _T_2367 & _T_1780; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2370 = _T_2056 | _T_2369; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2374 = _T_2066 & _T_1818; // @[el2_lsu_bus_buffer.scala 430:52]
  wire  _T_2376 = _T_2374 & _T_1782; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2377 = _T_2370 | _T_2376; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2378 = _T_2357 & _T_2377; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2380 = _T_2378 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2394 = _T_2367 & _T_1791; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2395 = _T_2081 | _T_2394; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2401 = _T_2374 & _T_1793; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2402 = _T_2395 | _T_2401; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2403 = _T_2357 & _T_2402; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2405 = _T_2403 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2419 = _T_2367 & _T_1802; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2420 = _T_2106 | _T_2419; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2426 = _T_2374 & _T_1804; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2427 = _T_2420 | _T_2426; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2428 = _T_2357 & _T_2427; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2430 = _T_2428 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire  _T_2444 = _T_2367 & _T_1813; // @[el2_lsu_bus_buffer.scala 429:92]
  wire  _T_2445 = _T_2131 | _T_2444; // @[el2_lsu_bus_buffer.scala 428:86]
  wire  _T_2451 = _T_2374 & _T_1815; // @[el2_lsu_bus_buffer.scala 430:73]
  wire  _T_2452 = _T_2445 | _T_2451; // @[el2_lsu_bus_buffer.scala 429:114]
  wire  _T_2453 = _T_2357 & _T_2452; // @[el2_lsu_bus_buffer.scala 427:113]
  wire  _T_2455 = _T_2453 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 430:97]
  wire [2:0] _T_2457 = {_T_2455,_T_2430,_T_2405}; // @[Cat.scala 29:58]
  wire  _T_2705 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 438:49]
  wire  _T_2706 = _T_1779 | _T_2705; // @[el2_lsu_bus_buffer.scala 438:34]
  wire  _T_2707 = ~_T_2706; // @[el2_lsu_bus_buffer.scala 438:8]
  wire  _T_2715 = _T_2707 | _T_2063; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2722 = _T_2715 | _T_2070; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2723 = _T_2051 & _T_2722; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2727 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 438:49]
  wire  _T_2728 = _T_1790 | _T_2727; // @[el2_lsu_bus_buffer.scala 438:34]
  wire  _T_2729 = ~_T_2728; // @[el2_lsu_bus_buffer.scala 438:8]
  wire  _T_2737 = _T_2729 | _T_2088; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2744 = _T_2737 | _T_2095; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2745 = _T_2051 & _T_2744; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2749 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 438:49]
  wire  _T_2750 = _T_1801 | _T_2749; // @[el2_lsu_bus_buffer.scala 438:34]
  wire  _T_2751 = ~_T_2750; // @[el2_lsu_bus_buffer.scala 438:8]
  wire  _T_2759 = _T_2751 | _T_2113; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2766 = _T_2759 | _T_2120; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2767 = _T_2051 & _T_2766; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2771 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 438:49]
  wire  _T_2772 = _T_1812 | _T_2771; // @[el2_lsu_bus_buffer.scala 438:34]
  wire  _T_2773 = ~_T_2772; // @[el2_lsu_bus_buffer.scala 438:8]
  wire  _T_2781 = _T_2773 | _T_2138; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2788 = _T_2781 | _T_2145; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2789 = _T_2051 & _T_2788; // @[el2_lsu_bus_buffer.scala 437:114]
  wire [3:0] buf_rspage_set_0 = {_T_2789,_T_2767,_T_2745,_T_2723}; // @[Cat.scala 29:58]
  wire  _T_2806 = _T_2707 | _T_2165; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2813 = _T_2806 | _T_2172; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2814 = _T_2153 & _T_2813; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2828 = _T_2729 | _T_2190; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2835 = _T_2828 | _T_2197; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2836 = _T_2153 & _T_2835; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2850 = _T_2751 | _T_2215; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2857 = _T_2850 | _T_2222; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2858 = _T_2153 & _T_2857; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2872 = _T_2773 | _T_2240; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2879 = _T_2872 | _T_2247; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2880 = _T_2153 & _T_2879; // @[el2_lsu_bus_buffer.scala 437:114]
  wire [3:0] buf_rspage_set_1 = {_T_2880,_T_2858,_T_2836,_T_2814}; // @[Cat.scala 29:58]
  wire  _T_2897 = _T_2707 | _T_2267; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2904 = _T_2897 | _T_2274; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2905 = _T_2255 & _T_2904; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2919 = _T_2729 | _T_2292; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2926 = _T_2919 | _T_2299; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2927 = _T_2255 & _T_2926; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2941 = _T_2751 | _T_2317; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2948 = _T_2941 | _T_2324; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2949 = _T_2255 & _T_2948; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_2963 = _T_2773 | _T_2342; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2970 = _T_2963 | _T_2349; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2971 = _T_2255 & _T_2970; // @[el2_lsu_bus_buffer.scala 437:114]
  wire [3:0] buf_rspage_set_2 = {_T_2971,_T_2949,_T_2927,_T_2905}; // @[Cat.scala 29:58]
  wire  _T_2988 = _T_2707 | _T_2369; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_2995 = _T_2988 | _T_2376; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_2996 = _T_2357 & _T_2995; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_3010 = _T_2729 | _T_2394; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_3017 = _T_3010 | _T_2401; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_3018 = _T_2357 & _T_3017; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_3032 = _T_2751 | _T_2419; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_3039 = _T_3032 | _T_2426; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_3040 = _T_2357 & _T_3039; // @[el2_lsu_bus_buffer.scala 437:114]
  wire  _T_3054 = _T_2773 | _T_2444; // @[el2_lsu_bus_buffer.scala 438:61]
  wire  _T_3061 = _T_3054 | _T_2451; // @[el2_lsu_bus_buffer.scala 439:112]
  wire  _T_3062 = _T_2357 & _T_3061; // @[el2_lsu_bus_buffer.scala 437:114]
  wire [3:0] buf_rspage_set_3 = {_T_3062,_T_3040,_T_3018,_T_2996}; // @[Cat.scala 29:58]
  wire  _T_3147 = _T_2771 | _T_1812; // @[el2_lsu_bus_buffer.scala 442:112]
  wire  _T_3148 = ~_T_3147; // @[el2_lsu_bus_buffer.scala 442:86]
  wire  _T_3149 = buf_rspageQ_0[3] & _T_3148; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3141 = _T_2749 | _T_1801; // @[el2_lsu_bus_buffer.scala 442:112]
  wire  _T_3142 = ~_T_3141; // @[el2_lsu_bus_buffer.scala 442:86]
  wire  _T_3143 = buf_rspageQ_0[2] & _T_3142; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3135 = _T_2727 | _T_1790; // @[el2_lsu_bus_buffer.scala 442:112]
  wire  _T_3136 = ~_T_3135; // @[el2_lsu_bus_buffer.scala 442:86]
  wire  _T_3137 = buf_rspageQ_0[1] & _T_3136; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3129 = _T_2705 | _T_1779; // @[el2_lsu_bus_buffer.scala 442:112]
  wire  _T_3130 = ~_T_3129; // @[el2_lsu_bus_buffer.scala 442:86]
  wire  _T_3131 = buf_rspageQ_0[0] & _T_3130; // @[el2_lsu_bus_buffer.scala 442:84]
  wire [3:0] buf_rspage_0 = {_T_3149,_T_3143,_T_3137,_T_3131}; // @[Cat.scala 29:58]
  wire  _T_3068 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3071 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3074 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3077 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire [2:0] _T_3079 = {_T_3077,_T_3074,_T_3071}; // @[Cat.scala 29:58]
  wire  _T_3176 = buf_rspageQ_1[3] & _T_3148; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3170 = buf_rspageQ_1[2] & _T_3142; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3164 = buf_rspageQ_1[1] & _T_3136; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3158 = buf_rspageQ_1[0] & _T_3130; // @[el2_lsu_bus_buffer.scala 442:84]
  wire [3:0] buf_rspage_1 = {_T_3176,_T_3170,_T_3164,_T_3158}; // @[Cat.scala 29:58]
  wire  _T_3083 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3086 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3089 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3092 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire [2:0] _T_3094 = {_T_3092,_T_3089,_T_3086}; // @[Cat.scala 29:58]
  wire  _T_3203 = buf_rspageQ_2[3] & _T_3148; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3197 = buf_rspageQ_2[2] & _T_3142; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3191 = buf_rspageQ_2[1] & _T_3136; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3185 = buf_rspageQ_2[0] & _T_3130; // @[el2_lsu_bus_buffer.scala 442:84]
  wire [3:0] buf_rspage_2 = {_T_3203,_T_3197,_T_3191,_T_3185}; // @[Cat.scala 29:58]
  wire  _T_3098 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3101 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3104 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3107 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire [2:0] _T_3109 = {_T_3107,_T_3104,_T_3101}; // @[Cat.scala 29:58]
  wire  _T_3230 = buf_rspageQ_3[3] & _T_3148; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3224 = buf_rspageQ_3[2] & _T_3142; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3218 = buf_rspageQ_3[1] & _T_3136; // @[el2_lsu_bus_buffer.scala 442:84]
  wire  _T_3212 = buf_rspageQ_3[0] & _T_3130; // @[el2_lsu_bus_buffer.scala 442:84]
  wire [3:0] buf_rspage_3 = {_T_3230,_T_3224,_T_3218,_T_3212}; // @[Cat.scala 29:58]
  wire  _T_3113 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3116 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3119 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire  _T_3122 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 441:90]
  wire [2:0] _T_3124 = {_T_3122,_T_3119,_T_3116}; // @[Cat.scala 29:58]
  wire  _T_3235 = ibuf_drain_vld & _T_1780; // @[el2_lsu_bus_buffer.scala 447:65]
  wire  _T_3237 = ibuf_drain_vld & _T_1791; // @[el2_lsu_bus_buffer.scala 447:65]
  wire  _T_3239 = ibuf_drain_vld & _T_1802; // @[el2_lsu_bus_buffer.scala 447:65]
  wire  _T_3241 = ibuf_drain_vld & _T_1813; // @[el2_lsu_bus_buffer.scala 447:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3241,_T_3239,_T_3237,_T_3235}; // @[Cat.scala 29:58]
  wire  _T_3249 = _T_3443 & _T_1785; // @[el2_lsu_bus_buffer.scala 448:123]
  wire [3:0] _T_3252 = _T_3249 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 448:96]
  wire [3:0] _T_3253 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3252; // @[el2_lsu_bus_buffer.scala 448:48]
  wire  _T_3258 = _T_3443 & _T_1796; // @[el2_lsu_bus_buffer.scala 448:123]
  wire [3:0] _T_3261 = _T_3258 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 448:96]
  wire [3:0] _T_3262 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3261; // @[el2_lsu_bus_buffer.scala 448:48]
  wire  _T_3267 = _T_3443 & _T_1807; // @[el2_lsu_bus_buffer.scala 448:123]
  wire [3:0] _T_3270 = _T_3267 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 448:96]
  wire [3:0] _T_3271 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3270; // @[el2_lsu_bus_buffer.scala 448:48]
  wire  _T_3276 = _T_3443 & _T_1818; // @[el2_lsu_bus_buffer.scala 448:123]
  wire [3:0] _T_3279 = _T_3276 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 448:96]
  wire [3:0] _T_3280 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3279; // @[el2_lsu_bus_buffer.scala 448:48]
  wire  _T_3306 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 450:47]
  wire  _T_3308 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 450:47]
  wire  _T_3310 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 450:47]
  wire  _T_3312 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 450:47]
  wire [3:0] buf_dual_in = {_T_3312,_T_3310,_T_3308,_T_3306}; // @[Cat.scala 29:58]
  wire  _T_3317 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 451:49]
  wire  _T_3319 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 451:49]
  wire  _T_3321 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 451:49]
  wire  _T_3323 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 451:49]
  wire [3:0] buf_samedw_in = {_T_3323,_T_3321,_T_3319,_T_3317}; // @[Cat.scala 29:58]
  wire  _T_3328 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 452:86]
  wire  _T_3329 = ibuf_drainvec_vld[0] ? _T_3328 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 452:50]
  wire  _T_3332 = ibuf_drainvec_vld[1] ? _T_3328 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 452:50]
  wire  _T_3335 = ibuf_drainvec_vld[2] ? _T_3328 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 452:50]
  wire  _T_3338 = ibuf_drainvec_vld[3] ? _T_3328 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 452:50]
  wire [3:0] buf_nomerge_in = {_T_3338,_T_3335,_T_3332,_T_3329}; // @[Cat.scala 29:58]
  wire  _T_3346 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3249; // @[el2_lsu_bus_buffer.scala 453:49]
  wire  _T_3351 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3258; // @[el2_lsu_bus_buffer.scala 453:49]
  wire  _T_3356 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3267; // @[el2_lsu_bus_buffer.scala 453:49]
  wire  _T_3361 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3276; // @[el2_lsu_bus_buffer.scala 453:49]
  wire [3:0] buf_dualhi_in = {_T_3361,_T_3356,_T_3351,_T_3346}; // @[Cat.scala 29:58]
  wire  _T_3390 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 455:53]
  wire  _T_3392 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 455:53]
  wire  _T_3394 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 455:53]
  wire  _T_3396 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 455:53]
  wire [3:0] buf_sideeffect_in = {_T_3396,_T_3394,_T_3392,_T_3390}; // @[Cat.scala 29:58]
  wire  _T_3401 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 456:49]
  wire  _T_3403 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 456:49]
  wire  _T_3405 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 456:49]
  wire  _T_3407 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 456:49]
  wire [3:0] buf_unsign_in = {_T_3407,_T_3405,_T_3403,_T_3401}; // @[Cat.scala 29:58]
  wire  _T_3424 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 458:48]
  wire  _T_3426 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 458:48]
  wire  _T_3428 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 458:48]
  wire  _T_3430 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 458:48]
  wire [3:0] buf_write_in = {_T_3430,_T_3428,_T_3426,_T_3424}; // @[Cat.scala 29:58]
  wire [31:0] _T_3456 = _T_3449 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 467:30]
  wire  _T_3463 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 474:89]
  wire  _T_3465 = _T_3463 & _T_1277; // @[el2_lsu_bus_buffer.scala 474:104]
  wire  _T_3478 = buf_state_en_0 & _T_1130; // @[el2_lsu_bus_buffer.scala 479:44]
  wire  _T_3479 = _T_3478 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 479:60]
  wire  _T_3481 = _T_3479 & _T_1259; // @[el2_lsu_bus_buffer.scala 479:74]
  wire  _T_3484 = _T_3474 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:67]
  wire  _T_3485 = _T_3484 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 481:81]
  wire  _T_4782 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 583:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4782; // @[el2_lsu_bus_buffer.scala 583:38]
  wire  _T_3488 = _T_3484 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 482:82]
  wire [31:0] _T_3493 = buf_addr_0[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 483:73]
  wire  _T_3563 = bus_rsp_read_error & _T_3542; // @[el2_lsu_bus_buffer.scala 496:91]
  wire  _T_3565 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 497:31]
  wire  _T_3567 = _T_3565 & _T_3544; // @[el2_lsu_bus_buffer.scala 497:46]
  wire  _T_3568 = _T_3563 | _T_3567; // @[el2_lsu_bus_buffer.scala 496:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4782; // @[el2_lsu_bus_buffer.scala 582:40]
  wire  _T_3571 = bus_rsp_write_error & _T_3540; // @[el2_lsu_bus_buffer.scala 498:53]
  wire  _T_3572 = _T_3568 | _T_3571; // @[el2_lsu_bus_buffer.scala 497:88]
  wire  _T_3573 = _T_3474 & _T_3572; // @[el2_lsu_bus_buffer.scala 496:68]
  wire  _GEN_46 = _T_3495 & _T_3573; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3461 ? _T_3488 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3457 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3434 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire [31:0] _T_3494 = buf_error_en_0 ? io_lsu_axi_rdata[31:0] : _T_3493; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3498 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 486:73]
  wire  _T_3499 = buf_write[0] & _T_3498; // @[el2_lsu_bus_buffer.scala 486:71]
  wire  _T_3500 = io_dec_tlu_force_halt | _T_3499; // @[el2_lsu_bus_buffer.scala 486:55]
  wire  _T_3502 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 487:30]
  wire  _T_3503 = buf_dual_0 & _T_3502; // @[el2_lsu_bus_buffer.scala 487:28]
  wire  _T_3506 = _T_3503 & _T_1130; // @[el2_lsu_bus_buffer.scala 487:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_3507 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_3508 = _T_3506 & _T_3507; // @[el2_lsu_bus_buffer.scala 487:61]
  wire  _T_4408 = _T_2652 | _T_2649; // @[el2_lsu_bus_buffer.scala 544:93]
  wire  _T_4409 = _T_4408 | _T_2646; // @[el2_lsu_bus_buffer.scala 544:93]
  wire  any_done_wait_state = _T_4409 | _T_2643; // @[el2_lsu_bus_buffer.scala 544:93]
  wire  _T_3510 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:31]
  wire  _T_3516 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3518 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3520 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3522 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3524 = _T_3516 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3525 = _T_3518 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3526 = _T_3520 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3527 = _T_3522 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3528 = _T_3524 | _T_3525; // @[Mux.scala 27:72]
  wire  _T_3529 = _T_3528 | _T_3526; // @[Mux.scala 27:72]
  wire  _T_3530 = _T_3529 | _T_3527; // @[Mux.scala 27:72]
  wire  _T_3532 = _T_3506 & _T_3530; // @[el2_lsu_bus_buffer.scala 488:101]
  wire  _T_3533 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 488:167]
  wire  _T_3534 = _T_3532 & _T_3533; // @[el2_lsu_bus_buffer.scala 488:138]
  wire  _T_3535 = _T_3534 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:187]
  wire  _T_3536 = _T_3510 | _T_3535; // @[el2_lsu_bus_buffer.scala 488:53]
  wire  _T_3559 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 495:47]
  wire  _T_3560 = _T_3559 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 495:62]
  wire  _T_3574 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 499:50]
  wire  _T_3575 = buf_state_en_0 & _T_3574; // @[el2_lsu_bus_buffer.scala 499:48]
  wire [31:0] _T_3581 = _T_3575 ? _T_3493 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 499:30]
  wire  _T_3587 = buf_ldfwd[0] | _T_3592[0]; // @[el2_lsu_bus_buffer.scala 502:90]
  wire  _T_3588 = _T_3587 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 502:118]
  wire  _GEN_29 = _T_3608 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3600 ? 1'h0 : _T_3608; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3600 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3582 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3582 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3495 & _T_3560; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_47 = _T_3495 ? _T_3581 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3495 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3495 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3461 ? _T_3481 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3461 ? _T_3485 : _GEN_45; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_60 = _T_3461 ? _T_3494 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3461 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3457 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3457 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_72 = _T_3457 ? 32'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3457 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3434 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_79 = _T_3434 ? _T_3456 : _GEN_72; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3434 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3434 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire [31:0] _T_3649 = _T_3642 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 467:30]
  wire  _T_3671 = buf_state_en_1 & _T_3742; // @[el2_lsu_bus_buffer.scala 479:44]
  wire  _T_3672 = _T_3671 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 479:60]
  wire  _T_3674 = _T_3672 & _T_1259; // @[el2_lsu_bus_buffer.scala 479:74]
  wire  _T_3677 = _T_3667 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:67]
  wire  _T_3678 = _T_3677 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 481:81]
  wire  _T_3681 = _T_3677 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 482:82]
  wire [31:0] _T_3686 = buf_addr_1[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 483:73]
  wire  _T_3756 = bus_rsp_read_error & _T_3735; // @[el2_lsu_bus_buffer.scala 496:91]
  wire  _T_3758 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 497:31]
  wire  _T_3760 = _T_3758 & _T_3737; // @[el2_lsu_bus_buffer.scala 497:46]
  wire  _T_3761 = _T_3756 | _T_3760; // @[el2_lsu_bus_buffer.scala 496:143]
  wire  _T_3764 = bus_rsp_write_error & _T_3733; // @[el2_lsu_bus_buffer.scala 498:53]
  wire  _T_3765 = _T_3761 | _T_3764; // @[el2_lsu_bus_buffer.scala 497:88]
  wire  _T_3766 = _T_3667 & _T_3765; // @[el2_lsu_bus_buffer.scala 496:68]
  wire  _GEN_122 = _T_3688 & _T_3766; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3654 ? _T_3681 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3650 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3627 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire [31:0] _T_3687 = buf_error_en_1 ? io_lsu_axi_rdata[31:0] : _T_3686; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3692 = buf_write[1] & _T_3498; // @[el2_lsu_bus_buffer.scala 486:71]
  wire  _T_3693 = io_dec_tlu_force_halt | _T_3692; // @[el2_lsu_bus_buffer.scala 486:55]
  wire  _T_3695 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 487:30]
  wire  _T_3696 = buf_dual_1 & _T_3695; // @[el2_lsu_bus_buffer.scala 487:28]
  wire  _T_3699 = _T_3696 & _T_3742; // @[el2_lsu_bus_buffer.scala 487:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_3700 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_3701 = _T_3699 & _T_3700; // @[el2_lsu_bus_buffer.scala 487:61]
  wire  _T_3703 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:31]
  wire  _T_3709 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3711 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3713 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3715 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3717 = _T_3709 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3718 = _T_3711 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3719 = _T_3713 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3720 = _T_3715 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3721 = _T_3717 | _T_3718; // @[Mux.scala 27:72]
  wire  _T_3722 = _T_3721 | _T_3719; // @[Mux.scala 27:72]
  wire  _T_3723 = _T_3722 | _T_3720; // @[Mux.scala 27:72]
  wire  _T_3725 = _T_3699 & _T_3723; // @[el2_lsu_bus_buffer.scala 488:101]
  wire  _T_3726 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 488:167]
  wire  _T_3727 = _T_3725 & _T_3726; // @[el2_lsu_bus_buffer.scala 488:138]
  wire  _T_3728 = _T_3727 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:187]
  wire  _T_3729 = _T_3703 | _T_3728; // @[el2_lsu_bus_buffer.scala 488:53]
  wire  _T_3752 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 495:47]
  wire  _T_3753 = _T_3752 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 495:62]
  wire  _T_3767 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 499:50]
  wire  _T_3768 = buf_state_en_1 & _T_3767; // @[el2_lsu_bus_buffer.scala 499:48]
  wire [31:0] _T_3774 = _T_3768 ? _T_3686 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 499:30]
  wire  _T_3780 = buf_ldfwd[1] | _T_3785[0]; // @[el2_lsu_bus_buffer.scala 502:90]
  wire  _T_3781 = _T_3780 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 502:118]
  wire  _GEN_105 = _T_3801 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3793 ? 1'h0 : _T_3801; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3793 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3775 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3775 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3688 & _T_3753; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_123 = _T_3688 ? _T_3774 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3688 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3688 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3654 ? _T_3674 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3654 ? _T_3678 : _GEN_121; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_136 = _T_3654 ? _T_3687 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3654 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3650 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3650 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_148 = _T_3650 ? 32'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3650 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3627 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_155 = _T_3627 ? _T_3649 : _GEN_148; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3627 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3627 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire [31:0] _T_3842 = _T_3835 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 467:30]
  wire  _T_3864 = buf_state_en_2 & _T_3935; // @[el2_lsu_bus_buffer.scala 479:44]
  wire  _T_3865 = _T_3864 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 479:60]
  wire  _T_3867 = _T_3865 & _T_1259; // @[el2_lsu_bus_buffer.scala 479:74]
  wire  _T_3870 = _T_3860 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:67]
  wire  _T_3871 = _T_3870 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 481:81]
  wire  _T_3874 = _T_3870 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 482:82]
  wire [31:0] _T_3879 = buf_addr_2[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 483:73]
  wire  _T_3949 = bus_rsp_read_error & _T_3928; // @[el2_lsu_bus_buffer.scala 496:91]
  wire  _T_3951 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 497:31]
  wire  _T_3953 = _T_3951 & _T_3930; // @[el2_lsu_bus_buffer.scala 497:46]
  wire  _T_3954 = _T_3949 | _T_3953; // @[el2_lsu_bus_buffer.scala 496:143]
  wire  _T_3957 = bus_rsp_write_error & _T_3926; // @[el2_lsu_bus_buffer.scala 498:53]
  wire  _T_3958 = _T_3954 | _T_3957; // @[el2_lsu_bus_buffer.scala 497:88]
  wire  _T_3959 = _T_3860 & _T_3958; // @[el2_lsu_bus_buffer.scala 496:68]
  wire  _GEN_198 = _T_3881 & _T_3959; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3847 ? _T_3874 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3843 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3820 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire [31:0] _T_3880 = buf_error_en_2 ? io_lsu_axi_rdata[31:0] : _T_3879; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3885 = buf_write[2] & _T_3498; // @[el2_lsu_bus_buffer.scala 486:71]
  wire  _T_3886 = io_dec_tlu_force_halt | _T_3885; // @[el2_lsu_bus_buffer.scala 486:55]
  wire  _T_3888 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 487:30]
  wire  _T_3889 = buf_dual_2 & _T_3888; // @[el2_lsu_bus_buffer.scala 487:28]
  wire  _T_3892 = _T_3889 & _T_3935; // @[el2_lsu_bus_buffer.scala 487:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_3893 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_3894 = _T_3892 & _T_3893; // @[el2_lsu_bus_buffer.scala 487:61]
  wire  _T_3896 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:31]
  wire  _T_3902 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3904 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3906 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3908 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3910 = _T_3902 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3911 = _T_3904 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3912 = _T_3906 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3913 = _T_3908 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3914 = _T_3910 | _T_3911; // @[Mux.scala 27:72]
  wire  _T_3915 = _T_3914 | _T_3912; // @[Mux.scala 27:72]
  wire  _T_3916 = _T_3915 | _T_3913; // @[Mux.scala 27:72]
  wire  _T_3918 = _T_3892 & _T_3916; // @[el2_lsu_bus_buffer.scala 488:101]
  wire  _T_3919 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 488:167]
  wire  _T_3920 = _T_3918 & _T_3919; // @[el2_lsu_bus_buffer.scala 488:138]
  wire  _T_3921 = _T_3920 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:187]
  wire  _T_3922 = _T_3896 | _T_3921; // @[el2_lsu_bus_buffer.scala 488:53]
  wire  _T_3945 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 495:47]
  wire  _T_3946 = _T_3945 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 495:62]
  wire  _T_3960 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 499:50]
  wire  _T_3961 = buf_state_en_2 & _T_3960; // @[el2_lsu_bus_buffer.scala 499:48]
  wire [31:0] _T_3967 = _T_3961 ? _T_3879 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 499:30]
  wire  _T_3973 = buf_ldfwd[2] | _T_3978[0]; // @[el2_lsu_bus_buffer.scala 502:90]
  wire  _T_3974 = _T_3973 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 502:118]
  wire  _GEN_181 = _T_3994 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_3986 ? 1'h0 : _T_3994; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_3986 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_3968 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_3968 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3881 & _T_3946; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_199 = _T_3881 ? _T_3967 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3881 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3881 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3847 ? _T_3867 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3847 ? _T_3871 : _GEN_197; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_212 = _T_3847 ? _T_3880 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3847 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3843 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3843 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_224 = _T_3843 ? 32'h0 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3843 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3820 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_231 = _T_3820 ? _T_3842 : _GEN_224; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3820 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3820 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire [31:0] _T_4035 = _T_4028 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 467:30]
  wire  _T_4057 = buf_state_en_3 & _T_4128; // @[el2_lsu_bus_buffer.scala 479:44]
  wire  _T_4058 = _T_4057 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 479:60]
  wire  _T_4060 = _T_4058 & _T_1259; // @[el2_lsu_bus_buffer.scala 479:74]
  wire  _T_4063 = _T_4053 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:67]
  wire  _T_4064 = _T_4063 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 481:81]
  wire  _T_4067 = _T_4063 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 482:82]
  wire [31:0] _T_4072 = buf_addr_3[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 483:73]
  wire  _T_4142 = bus_rsp_read_error & _T_4121; // @[el2_lsu_bus_buffer.scala 496:91]
  wire  _T_4144 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 497:31]
  wire  _T_4146 = _T_4144 & _T_4123; // @[el2_lsu_bus_buffer.scala 497:46]
  wire  _T_4147 = _T_4142 | _T_4146; // @[el2_lsu_bus_buffer.scala 496:143]
  wire  _T_4150 = bus_rsp_write_error & _T_4119; // @[el2_lsu_bus_buffer.scala 498:53]
  wire  _T_4151 = _T_4147 | _T_4150; // @[el2_lsu_bus_buffer.scala 497:88]
  wire  _T_4152 = _T_4053 & _T_4151; // @[el2_lsu_bus_buffer.scala 496:68]
  wire  _GEN_274 = _T_4074 & _T_4152; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4040 ? _T_4067 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4036 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4013 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire [31:0] _T_4073 = buf_error_en_3 ? io_lsu_axi_rdata[31:0] : _T_4072; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_4078 = buf_write[3] & _T_3498; // @[el2_lsu_bus_buffer.scala 486:71]
  wire  _T_4079 = io_dec_tlu_force_halt | _T_4078; // @[el2_lsu_bus_buffer.scala 486:55]
  wire  _T_4081 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 487:30]
  wire  _T_4082 = buf_dual_3 & _T_4081; // @[el2_lsu_bus_buffer.scala 487:28]
  wire  _T_4085 = _T_4082 & _T_4128; // @[el2_lsu_bus_buffer.scala 487:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 487:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_4086 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 487:90]
  wire  _T_4087 = _T_4085 & _T_4086; // @[el2_lsu_bus_buffer.scala 487:61]
  wire  _T_4089 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:31]
  wire  _T_4095 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4097 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4099 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4101 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4103 = _T_4095 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4104 = _T_4097 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4105 = _T_4099 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4106 = _T_4101 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4107 = _T_4103 | _T_4104; // @[Mux.scala 27:72]
  wire  _T_4108 = _T_4107 | _T_4105; // @[Mux.scala 27:72]
  wire  _T_4109 = _T_4108 | _T_4106; // @[Mux.scala 27:72]
  wire  _T_4111 = _T_4085 & _T_4109; // @[el2_lsu_bus_buffer.scala 488:101]
  wire  _T_4112 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 488:167]
  wire  _T_4113 = _T_4111 & _T_4112; // @[el2_lsu_bus_buffer.scala 488:138]
  wire  _T_4114 = _T_4113 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 488:187]
  wire  _T_4115 = _T_4089 | _T_4114; // @[el2_lsu_bus_buffer.scala 488:53]
  wire  _T_4138 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 495:47]
  wire  _T_4139 = _T_4138 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 495:62]
  wire  _T_4153 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 499:50]
  wire  _T_4154 = buf_state_en_3 & _T_4153; // @[el2_lsu_bus_buffer.scala 499:48]
  wire [31:0] _T_4160 = _T_4154 ? _T_4072 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 499:30]
  wire  _T_4166 = buf_ldfwd[3] | _T_4171[0]; // @[el2_lsu_bus_buffer.scala 502:90]
  wire  _T_4167 = _T_4166 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 502:118]
  wire  _GEN_257 = _T_4187 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4179 ? 1'h0 : _T_4187; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4179 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4161 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4161 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4074 & _T_4139; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_275 = _T_4074 ? _T_4160 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4074 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4074 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4040 ? _T_4060 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4040 ? _T_4064 : _GEN_273; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_288 = _T_4040 ? _T_4073 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4040 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4036 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4036 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_300 = _T_4036 ? 32'h0 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4036 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4013 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_307 = _T_4013 ? _T_4035 : _GEN_300; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4013 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4013 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4242; // @[Reg.scala 27:20]
  reg  _T_4245; // @[Reg.scala 27:20]
  reg  _T_4248; // @[Reg.scala 27:20]
  reg  _T_4251; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4251,_T_4248,_T_4245,_T_4242}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3253[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 448:19]
  wire [2:0] buf_byteen_in_1 = _T_3262[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 448:19]
  wire [2:0] buf_byteen_in_2 = _T_3271[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 448:19]
  wire [2:0] buf_byteen_in_3 = _T_3280[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 448:19]
  reg  _T_4317; // @[el2_lsu_bus_buffer.scala 538:82]
  reg  _T_4312; // @[el2_lsu_bus_buffer.scala 538:82]
  reg  _T_4307; // @[el2_lsu_bus_buffer.scala 538:82]
  reg  _T_4302; // @[el2_lsu_bus_buffer.scala 538:82]
  wire [3:0] buf_error = {_T_4317,_T_4312,_T_4307,_T_4302}; // @[Cat.scala 29:58]
  wire  _T_4299 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 538:86]
  wire  _T_4300 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 538:128]
  wire  _T_4304 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 538:86]
  wire  _T_4305 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 538:128]
  wire  _T_4309 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 538:86]
  wire  _T_4310 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 538:128]
  wire  _T_4314 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 538:86]
  wire  _T_4315 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 538:128]
  wire [1:0] _T_4325 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 540:96]
  wire [1:0] _GEN_411 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 540:96]
  wire [2:0] _T_4326 = _T_4325 + _GEN_411; // @[el2_lsu_bus_buffer.scala 540:96]
  wire [2:0] _GEN_412 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 540:96]
  wire [3:0] buf_numvld_any = _T_4326 + _GEN_412; // @[el2_lsu_bus_buffer.scala 540:96]
  wire  _T_4412 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 546:52]
  wire  _T_4413 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 546:92]
  wire  _T_4414 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 546:119]
  wire  _T_4416 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 547:52]
  wire  _T_4417 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 547:52]
  wire  _T_4418 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 547:52]
  wire  _T_4419 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 547:52]
  wire  _T_4420 = _T_4416 | _T_4417; // @[el2_lsu_bus_buffer.scala 547:65]
  wire  _T_4421 = _T_4420 | _T_4418; // @[el2_lsu_bus_buffer.scala 547:65]
  wire  _T_4422 = _T_4421 | _T_4419; // @[el2_lsu_bus_buffer.scala 547:65]
  wire  _T_4423 = ~_T_4422; // @[el2_lsu_bus_buffer.scala 547:34]
  wire  _T_4425 = _T_4423 & _T_765; // @[el2_lsu_bus_buffer.scala 547:70]
  wire  _T_4428 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 549:51]
  wire  _T_4429 = _T_4428 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 549:72]
  wire  _T_4430 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 549:94]
  wire  _T_4431 = _T_4429 & _T_4430; // @[el2_lsu_bus_buffer.scala 549:92]
  wire  _T_4432 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 549:111]
  wire  _T_4434 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 552:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 636:66]
  wire  _T_4452 = _T_2705 & _T_1130; // @[Mux.scala 27:72]
  wire  _T_4453 = _T_2727 & _T_3742; // @[Mux.scala 27:72]
  wire  _T_4454 = _T_2749 & _T_3935; // @[Mux.scala 27:72]
  wire  _T_4455 = _T_2771 & _T_4128; // @[Mux.scala 27:72]
  wire  _T_4456 = _T_4452 | _T_4453; // @[Mux.scala 27:72]
  wire  _T_4457 = _T_4456 | _T_4454; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4457 | _T_4455; // @[Mux.scala 27:72]
  wire  _T_4463 = buf_error[0] & _T_1130; // @[el2_lsu_bus_buffer.scala 555:108]
  wire  _T_4468 = buf_error[1] & _T_3742; // @[el2_lsu_bus_buffer.scala 555:108]
  wire  _T_4473 = buf_error[2] & _T_3935; // @[el2_lsu_bus_buffer.scala 555:108]
  wire  _T_4478 = buf_error[3] & _T_4128; // @[el2_lsu_bus_buffer.scala 555:108]
  wire  _T_4479 = _T_2705 & _T_4463; // @[Mux.scala 27:72]
  wire  _T_4480 = _T_2727 & _T_4468; // @[Mux.scala 27:72]
  wire  _T_4481 = _T_2749 & _T_4473; // @[Mux.scala 27:72]
  wire  _T_4482 = _T_2771 & _T_4478; // @[Mux.scala 27:72]
  wire  _T_4483 = _T_4479 | _T_4480; // @[Mux.scala 27:72]
  wire  _T_4484 = _T_4483 | _T_4481; // @[Mux.scala 27:72]
  wire  _T_4491 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 556:109]
  wire  _T_4492 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 556:124]
  wire  _T_4493 = _T_4491 | _T_4492; // @[el2_lsu_bus_buffer.scala 556:122]
  wire  _T_4494 = _T_4452 & _T_4493; // @[el2_lsu_bus_buffer.scala 556:106]
  wire  _T_4499 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 556:109]
  wire  _T_4500 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 556:124]
  wire  _T_4501 = _T_4499 | _T_4500; // @[el2_lsu_bus_buffer.scala 556:122]
  wire  _T_4502 = _T_4453 & _T_4501; // @[el2_lsu_bus_buffer.scala 556:106]
  wire  _T_4507 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 556:109]
  wire  _T_4508 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 556:124]
  wire  _T_4509 = _T_4507 | _T_4508; // @[el2_lsu_bus_buffer.scala 556:122]
  wire  _T_4510 = _T_4454 & _T_4509; // @[el2_lsu_bus_buffer.scala 556:106]
  wire  _T_4515 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 556:109]
  wire  _T_4516 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 556:124]
  wire  _T_4517 = _T_4515 | _T_4516; // @[el2_lsu_bus_buffer.scala 556:122]
  wire  _T_4518 = _T_4455 & _T_4517; // @[el2_lsu_bus_buffer.scala 556:106]
  wire [1:0] _T_4521 = _T_4510 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4522 = _T_4518 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_413 = {{1'd0}, _T_4502}; // @[Mux.scala 27:72]
  wire [1:0] _T_4524 = _GEN_413 | _T_4521; // @[Mux.scala 27:72]
  wire [31:0] _T_4559 = _T_4494 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4560 = _T_4502 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4561 = _T_4510 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4562 = _T_4518 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4563 = _T_4559 | _T_4560; // @[Mux.scala 27:72]
  wire [31:0] _T_4564 = _T_4563 | _T_4561; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4564 | _T_4562; // @[Mux.scala 27:72]
  wire  _T_4570 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 558:120]
  wire  _T_4571 = _T_4452 & _T_4570; // @[el2_lsu_bus_buffer.scala 558:105]
  wire  _T_4576 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 558:120]
  wire  _T_4577 = _T_4453 & _T_4576; // @[el2_lsu_bus_buffer.scala 558:105]
  wire  _T_4582 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 558:120]
  wire  _T_4583 = _T_4454 & _T_4582; // @[el2_lsu_bus_buffer.scala 558:105]
  wire  _T_4588 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 558:120]
  wire  _T_4589 = _T_4455 & _T_4588; // @[el2_lsu_bus_buffer.scala 558:105]
  wire [31:0] _T_4590 = _T_4571 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4591 = _T_4577 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4592 = _T_4583 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4593 = _T_4589 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4594 = _T_4590 | _T_4591; // @[Mux.scala 27:72]
  wire [31:0] _T_4595 = _T_4594 | _T_4592; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4595 | _T_4593; // @[Mux.scala 27:72]
  wire  _T_4597 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4598 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4599 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4600 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4601 = _T_4597 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4602 = _T_4598 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4603 = _T_4599 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4604 = _T_4600 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4605 = _T_4601 | _T_4602; // @[Mux.scala 27:72]
  wire [31:0] _T_4606 = _T_4605 | _T_4603; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_addr_offset = _T_4606 | _T_4604; // @[Mux.scala 27:72]
  wire [1:0] _T_4612 = _T_4597 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4613 = _T_4598 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4614 = _T_4599 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4615 = _T_4600 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4616 = _T_4612 | _T_4613; // @[Mux.scala 27:72]
  wire [1:0] _T_4617 = _T_4616 | _T_4614; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4617 | _T_4615; // @[Mux.scala 27:72]
  wire  _T_4627 = _T_4597 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4628 = _T_4598 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4629 = _T_4599 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4630 = _T_4600 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4631 = _T_4627 | _T_4628; // @[Mux.scala 27:72]
  wire  _T_4632 = _T_4631 | _T_4629; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4632 | _T_4630; // @[Mux.scala 27:72]
  wire [63:0] _T_4652 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [35:0] _T_4653 = lsu_nonblock_addr_offset * 32'h8; // @[el2_lsu_bus_buffer.scala 563:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4652 >> _T_4653; // @[el2_lsu_bus_buffer.scala 563:92]
  wire  _T_4654 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 564:69]
  wire  _T_4656 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 565:81]
  wire  _T_4657 = lsu_nonblock_unsign & _T_4656; // @[el2_lsu_bus_buffer.scala 565:63]
  wire [31:0] _T_4659 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4660 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 566:45]
  wire  _T_4661 = lsu_nonblock_unsign & _T_4660; // @[el2_lsu_bus_buffer.scala 566:26]
  wire [31:0] _T_4663 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4664 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 567:6]
  wire  _T_4666 = _T_4664 & _T_4656; // @[el2_lsu_bus_buffer.scala 567:27]
  wire [23:0] _T_4669 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4671 = {_T_4669,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4674 = _T_4664 & _T_4660; // @[el2_lsu_bus_buffer.scala 568:27]
  wire [15:0] _T_4677 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4679 = {_T_4677,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4680 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 569:21]
  wire [31:0] _T_4681 = _T_4657 ? _T_4659 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4682 = _T_4661 ? _T_4663 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4683 = _T_4666 ? _T_4671 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4684 = _T_4674 ? _T_4679 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4685 = _T_4680 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4686 = _T_4681 | _T_4682; // @[Mux.scala 27:72]
  wire [31:0] _T_4687 = _T_4686 | _T_4683; // @[Mux.scala 27:72]
  wire [31:0] _T_4688 = _T_4687 | _T_4684; // @[Mux.scala 27:72]
  wire [63:0] _GEN_414 = {{32'd0}, _T_4688}; // @[Mux.scala 27:72]
  wire [63:0] _T_4689 = _GEN_414 | _T_4685; // @[Mux.scala 27:72]
  wire  _T_4784 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 587:36]
  wire  _T_4785 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 587:51]
  wire  _T_4786 = _T_4784 & _T_4785; // @[el2_lsu_bus_buffer.scala 587:49]
  wire [31:0] _T_4790 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4792 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4797 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 599:50]
  wire  _T_4798 = _T_4784 & _T_4797; // @[el2_lsu_bus_buffer.scala 599:48]
  wire [7:0] _T_4802 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4805 = obuf_valid & _T_1269; // @[el2_lsu_bus_buffer.scala 604:36]
  wire  _T_4807 = _T_4805 & _T_1275; // @[el2_lsu_bus_buffer.scala 604:50]
  wire  _T_4819 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4821 = _T_4819 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 617:129]
  wire  _T_4824 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4826 = _T_4824 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 617:129]
  wire  _T_4829 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4831 = _T_4829 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 617:129]
  wire  _T_4834 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 617:114]
  wire  _T_4836 = _T_4834 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 617:129]
  wire  _T_4837 = _T_2705 & _T_4821; // @[Mux.scala 27:72]
  wire  _T_4838 = _T_2727 & _T_4826; // @[Mux.scala 27:72]
  wire  _T_4839 = _T_2749 & _T_4831; // @[Mux.scala 27:72]
  wire  _T_4840 = _T_2771 & _T_4836; // @[Mux.scala 27:72]
  wire  _T_4841 = _T_4837 | _T_4838; // @[Mux.scala 27:72]
  wire  _T_4842 = _T_4841 | _T_4839; // @[Mux.scala 27:72]
  wire  _T_4852 = _T_2727 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 618:98]
  wire  lsu_imprecise_error_store_tag = _T_4852 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 618:113]
  wire  _T_4858 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 620:72]
  wire  _T_4860 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4862 = _T_4860 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4863 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4864 = _T_4862 | _T_4863; // @[Mux.scala 27:72]
  wire  _T_4881 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 627:68]
  wire  _T_4884 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 628:48]
  wire  _T_4887 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 631:48]
  wire  _T_4888 = io_lsu_axi_awvalid & _T_4887; // @[el2_lsu_bus_buffer.scala 631:46]
  wire  _T_4889 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 631:92]
  wire  _T_4890 = io_lsu_axi_wvalid & _T_4889; // @[el2_lsu_bus_buffer.scala 631:90]
  wire  _T_4891 = _T_4888 | _T_4890; // @[el2_lsu_bus_buffer.scala 631:69]
  wire  _T_4892 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 631:136]
  wire  _T_4893 = io_lsu_axi_arvalid & _T_4892; // @[el2_lsu_bus_buffer.scala 631:134]
  wire  _T_4897 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 635:75]
  wire  _T_4898 = io_lsu_busreq_m & _T_4897; // @[el2_lsu_bus_buffer.scala 635:73]
  reg  _T_4901; // @[el2_lsu_bus_buffer.scala 635:56]
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
  assign io_lsu_busreq_r = _T_4901; // @[el2_lsu_bus_buffer.scala 635:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 545:30]
  assign io_lsu_bus_buffer_full_any = _T_4412 ? _T_4413 : _T_4414; // @[el2_lsu_bus_buffer.scala 546:30]
  assign io_lsu_bus_buffer_empty_any = _T_4425 & _T_1157; // @[el2_lsu_bus_buffer.scala 547:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 624:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 188:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 189:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 214:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 219:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4858; // @[el2_lsu_bus_buffer.scala 620:35]
  assign io_lsu_imprecise_error_store_any = _T_4842 | _T_4840; // @[el2_lsu_bus_buffer.scala 617:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4864 : lsu_nonblock_addr_offset; // @[el2_lsu_bus_buffer.scala 621:35]
  assign io_lsu_nonblock_load_valid_m = _T_4431 & _T_4432; // @[el2_lsu_bus_buffer.scala 549:32]
  assign io_lsu_nonblock_load_tag_m = _T_1789 ? 2'h0 : _T_1825; // @[el2_lsu_bus_buffer.scala 550:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4434; // @[el2_lsu_bus_buffer.scala 552:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 553:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4654; // @[el2_lsu_bus_buffer.scala 564:35]
  assign io_lsu_nonblock_load_data_error = _T_4484 | _T_4482; // @[el2_lsu_bus_buffer.scala 555:35]
  assign io_lsu_nonblock_load_data_tag = _T_4524 | _T_4522; // @[el2_lsu_bus_buffer.scala 556:33]
  assign io_lsu_nonblock_load_data = _T_4689[31:0]; // @[el2_lsu_bus_buffer.scala 565:29]
  assign io_lsu_pmu_bus_trxn = _T_4881 | _T_4776; // @[el2_lsu_bus_buffer.scala 627:23]
  assign io_lsu_pmu_bus_misaligned = _T_4884 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 628:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 629:24]
  assign io_lsu_pmu_bus_busy = _T_4891 | _T_4893; // @[el2_lsu_bus_buffer.scala 631:23]
  assign io_lsu_axi_awvalid = _T_4786 & _T_1165; // @[el2_lsu_bus_buffer.scala 587:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 588:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4790; // @[el2_lsu_bus_buffer.scala 589:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 593:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 594:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4792 : 3'h2; // @[el2_lsu_bus_buffer.scala 590:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 595:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 597:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 592:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 591:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 596:20]
  assign io_lsu_axi_wvalid = _T_4798 & _T_1165; // @[el2_lsu_bus_buffer.scala 599:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 601:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4802; // @[el2_lsu_bus_buffer.scala 600:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 602:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 615:21]
  assign io_lsu_axi_arvalid = _T_4807 & _T_1165; // @[el2_lsu_bus_buffer.scala 604:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 605:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4790; // @[el2_lsu_bus_buffer.scala 606:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 610:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 611:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4792 : 3'h3; // @[el2_lsu_bus_buffer.scala 607:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 612:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 614:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 609:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 608:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 613:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 616:21]
  assign io_test = {_T_2001,_T_2000}; // @[el2_lsu_bus_buffer.scala 413:11]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_io_en = _T_766 & _T_767; // @[el2_lib.scala 488:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_1_io_en = _T_766 & _T_767; // @[el2_lib.scala 488:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_2_io_en = _T_1166 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_3_io_en = _T_1166 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_4_io_en = _T_3434 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3627 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3820 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4013 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3434 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3627 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3820 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4013 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4266 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4263 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4260 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4257 = _RAND_4[0:0];
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
  _T_4293 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4291 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4289 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4287 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  buf_ageQ_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1774 = _RAND_17[1:0];
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
  _T_4294 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  _T_4295 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  _T_4296 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_4297 = _RAND_32[3:0];
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
  _T_4236 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4233 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4230 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4227 = _RAND_53[0:0];
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
  _T_4213 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4211 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4209 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4207 = _RAND_88[0:0];
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
  _T_4242 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4245 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4248 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4251 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4317 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4312 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4307 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4302 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4901 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4266 = 1'h0;
  end
  if (reset) begin
    _T_4263 = 1'h0;
  end
  if (reset) begin
    _T_4260 = 1'h0;
  end
  if (reset) begin
    _T_4257 = 1'h0;
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
    _T_4293 = 3'h0;
  end
  if (reset) begin
    _T_4291 = 3'h0;
  end
  if (reset) begin
    _T_4289 = 3'h0;
  end
  if (reset) begin
    _T_4287 = 3'h0;
  end
  if (reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_1774 = 2'h0;
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
    _T_4294 = 4'h0;
  end
  if (reset) begin
    _T_4295 = 4'h0;
  end
  if (reset) begin
    _T_4296 = 4'h0;
  end
  if (reset) begin
    _T_4297 = 4'h0;
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
    _T_4236 = 1'h0;
  end
  if (reset) begin
    _T_4233 = 1'h0;
  end
  if (reset) begin
    _T_4230 = 1'h0;
  end
  if (reset) begin
    _T_4227 = 1'h0;
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
    _T_4213 = 1'h0;
  end
  if (reset) begin
    _T_4211 = 1'h0;
  end
  if (reset) begin
    _T_4209 = 1'h0;
  end
  if (reset) begin
    _T_4207 = 1'h0;
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
    _T_4242 = 1'h0;
  end
  if (reset) begin
    _T_4245 = 1'h0;
  end
  if (reset) begin
    _T_4248 = 1'h0;
  end
  if (reset) begin
    _T_4251 = 1'h0;
  end
  if (reset) begin
    _T_4317 = 1'h0;
  end
  if (reset) begin
    _T_4312 = 1'h0;
  end
  if (reset) begin
    _T_4307 = 1'h0;
  end
  if (reset) begin
    _T_4302 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4901 = 1'h0;
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
    end else if (_T_3249) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4266 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4266 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4263 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4263 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4260 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4260 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4257 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4257 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3434) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3457) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3461) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3465) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3495) begin
        if (_T_3500) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3508) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3536) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3582) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3588) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3600) begin
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
    end else if (_T_3258) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3627) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3650) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3654) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3465) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3688) begin
        if (_T_3693) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3701) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3729) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3775) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3781) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3793) begin
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
    end else if (_T_3267) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3820) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3843) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3847) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3465) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3881) begin
        if (_T_3886) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3894) begin
          buf_state_2 <= 3'h4;
        end else if (_T_3922) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3968) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3974) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3986) begin
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
    end else if (_T_3276) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4013) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4036) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4040) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3465) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4074) begin
        if (_T_4079) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4087) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4115) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4161) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4167) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4179) begin
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
      _T_4293 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4293 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4291 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4291 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4289 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4289 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4287 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4287 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2457,_T_2380};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1774 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1774 <= WrPtr0_r;
      end else begin
        _T_1774 <= 2'h0;
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
      obuf_valid <= _T_1765 & _T_1766;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1166 & io_lsu_bus_clk_en;
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
      ibuf_valid <= _T_910 & _T_911;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_779) begin
        ibuf_byteen <= _T_794;
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
      buf_ageQ_2 <= {_T_2355,_T_2278};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2253,_T_2176};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2151,_T_2074};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4294 <= 4'h0;
    end else begin
      _T_4294 <= _GEN_79[3:0];
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4295 <= 4'h0;
    end else begin
      _T_4295 <= _GEN_155[3:0];
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4296 <= 4'h0;
    end else begin
      _T_4296 <= _GEN_231[3:0];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4297 <= 4'h0;
    end else begin
      _T_4297 <= _GEN_307[3:0];
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_timer <= 3'h0;
    end else if (ibuf_wr_en) begin
      ibuf_timer <= 3'h0;
    end else if (_T_828) begin
      ibuf_timer <= _T_831;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (_T_916) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1840) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1854) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1868) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1882) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1789) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1800) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1811) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1822) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_916) begin
      if (!(_T_779)) begin
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
      ibuf_data <= {_T_827,_T_804};
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (_T_916) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_916) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_916) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_916) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_916) begin
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
    end else if (_T_984) begin
      obuf_wr_timer <= _T_986;
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
      _T_4236 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4236 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4233 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4233 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4230 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4230 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4227 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4227 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1231 & _T_4773;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1231 & _T_4774;
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
      obuf_rdrsp_pend <= _T_1256 | _T_1260;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1262) begin
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
      obuf_data <= {_T_1546,_T_1505};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3079,_T_3068};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3094,_T_3083};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3109,_T_3098};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3124,_T_3113};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4213 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4013) begin
        _T_4213 <= 1'h0;
      end else if (_T_4036) begin
        _T_4213 <= 1'h0;
      end else begin
        _T_4213 <= _T_4040;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4211 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3820) begin
        _T_4211 <= 1'h0;
      end else if (_T_3843) begin
        _T_4211 <= 1'h0;
      end else begin
        _T_4211 <= _T_3847;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4209 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3627) begin
        _T_4209 <= 1'h0;
      end else if (_T_3650) begin
        _T_4209 <= 1'h0;
      end else begin
        _T_4209 <= _T_3654;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4207 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3434) begin
        _T_4207 <= 1'h0;
      end else if (_T_3457) begin
        _T_4207 <= 1'h0;
      end else begin
        _T_4207 <= _T_3461;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3434) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3457) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3461) begin
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
      end else if (_T_3249) begin
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
      if (_T_4013) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4036) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4040) begin
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
      if (_T_3820) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3843) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3847) begin
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
      if (_T_3627) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3650) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3654) begin
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
      end else if (_T_3258) begin
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
      end else if (_T_3267) begin
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
      end else if (_T_3276) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4242 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4242 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4245 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4245 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4248 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4248 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4251 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4251 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4317 <= 1'h0;
    end else begin
      _T_4317 <= _T_4314 & _T_4315;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4312 <= 1'h0;
    end else begin
      _T_4312 <= _T_4309 & _T_4310;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4307 <= 1'h0;
    end else begin
      _T_4307 <= _T_4304 & _T_4305;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4302 <= 1'h0;
    end else begin
      _T_4302 <= _T_4299 & _T_4300;
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
      _T_4901 <= 1'h0;
    end else begin
      _T_4901 <= _T_4898 & _T_4432;
    end
  end
endmodule
