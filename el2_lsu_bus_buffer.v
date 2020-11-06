module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 452:26]
  wire  clkhdr_CK; // @[el2_lib.scala 452:26]
  wire  clkhdr_EN; // @[el2_lib.scala 452:26]
  wire  clkhdr_SE; // @[el2_lib.scala 452:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 452:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 453:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 454:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 455:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 456:18]
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
  output [1:0]  io_test
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
  reg [63:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 472:23]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 472:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_buffer.scala 125:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_buffer.scala 126:46]
  reg [31:0] buf_addr_0; // @[el2_lib.scala 478:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  reg  _T_4234; // @[Reg.scala 27:20]
  reg  _T_4231; // @[Reg.scala 27:20]
  reg  _T_4228; // @[Reg.scala 27:20]
  reg  _T_4225; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4234,_T_4231,_T_4228,_T_4225}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_1; // @[el2_lib.scala 478:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_13 = _T_11 & _T_12; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_2; // @[el2_lib.scala 478:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_20 = _T_18 & _T_19; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_3; // @[el2_lib.scala 478:16]
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
  reg [2:0] _T_4261; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4261}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4259; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4259}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4257; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4257}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4255; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4255}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2496 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3981 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4004 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4008 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1772; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1772}; // @[el2_lsu_bus_buffer.scala 381:13]
  wire  _T_4015 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 471:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_4016 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_4017 = obuf_merge & _T_4016; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_4018 = _T_4015 | _T_4017; // @[el2_lsu_bus_buffer.scala 471:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 375:51]
  wire  _T_4019 = _T_4018 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 374:55]
  wire  _T_4020 = _T_4019 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_280 = _T_4008 & _T_4020; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4004 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_3981 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2497 = _T_2496 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2498 = buf_ageQ_3[3] & _T_2497; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2492 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3788 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3811 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3815 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3822 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3823 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3824 = obuf_merge & _T_3823; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3825 = _T_3822 | _T_3824; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3826 = _T_3825 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3827 = _T_3826 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_204 = _T_3815 & _T_3827; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3811 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3788 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2493 = _T_2492 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2494 = buf_ageQ_3[2] & _T_2493; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2488 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3595 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3618 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3622 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3629 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3630 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3631 = obuf_merge & _T_3630; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3632 = _T_3629 | _T_3631; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3633 = _T_3632 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3634 = _T_3633 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_128 = _T_3622 & _T_3634; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3618 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3595 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2489 = _T_2488 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2490 = buf_ageQ_3[1] & _T_2489; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2484 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3402 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3425 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3429 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3436 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3437 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3438 = obuf_merge & _T_3437; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3439 = _T_3436 | _T_3438; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3440 = _T_3439 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3441 = _T_3440 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_52 = _T_3429 & _T_3441; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3425 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3402 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2485 = _T_2484 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2486 = buf_ageQ_3[0] & _T_2485; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_3 = {_T_2498,_T_2494,_T_2490,_T_2486}; // @[Cat.scala 29:58]
  wire  _T_2597 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2599 = _T_2597 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2591 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2593 = _T_2591 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2585 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2587 = _T_2585 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2599,_T_2593,_T_2587}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 196:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 478:16]
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
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2479 = buf_ageQ_2[3] & _T_2497; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2475 = buf_ageQ_2[2] & _T_2493; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2471 = buf_ageQ_2[1] & _T_2489; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2467 = buf_ageQ_2[0] & _T_2485; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_2 = {_T_2479,_T_2475,_T_2471,_T_2467}; // @[Cat.scala 29:58]
  wire  _T_2576 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2578 = _T_2576 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2564 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2566 = _T_2564 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2558 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2560 = _T_2558 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_2 = {_T_2578,1'h0,_T_2566,_T_2560}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2460 = buf_ageQ_1[3] & _T_2497; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2456 = buf_ageQ_1[2] & _T_2493; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2452 = buf_ageQ_1[1] & _T_2489; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2448 = buf_ageQ_1[0] & _T_2485; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_1 = {_T_2460,_T_2456,_T_2452,_T_2448}; // @[Cat.scala 29:58]
  wire  _T_2549 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2551 = _T_2549 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2543 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2545 = _T_2543 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2531 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2533 = _T_2531 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_1 = {_T_2551,_T_2545,1'h0,_T_2533}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2441 = buf_ageQ_0[3] & _T_2497; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2437 = buf_ageQ_0[2] & _T_2493; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2433 = buf_ageQ_0[1] & _T_2489; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2429 = buf_ageQ_0[0] & _T_2485; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_0 = {_T_2441,_T_2437,_T_2433,_T_2429}; // @[Cat.scala 29:58]
  wire  _T_2522 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2524 = _T_2522 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2516 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2518 = _T_2516 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2510 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2512 = _T_2510 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_0 = {_T_2524,_T_2518,_T_2512,1'h0}; // @[Cat.scala 29:58]
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
  reg [3:0] _T_4262; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_0 = {{28'd0}, _T_4262}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_354 = {{1'd0}, _T_554}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_556 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_559 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4263; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_1 = {{28'd0}, _T_4263}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_355 = {{1'd0}, _T_559}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_561 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_564 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4264; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_2 = {{28'd0}, _T_4264}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_356 = {{1'd0}, _T_564}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_566 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_569 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4265; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_3 = {{28'd0}, _T_4265}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
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
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 630:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 629:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_794 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 257:77]
  reg [31:0] ibuf_data; // @[el2_lib.scala 478:16]
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
  wire  _T_915 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 271:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire [2:0] _GEN_365 = {{2'd0}, buf_write[3]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4311 = _GEN_365 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4312 = buf_write[3] & _T_4311; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4313 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4314 = _T_4312 & _T_4313; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [2:0] _GEN_366 = {{2'd0}, buf_write[2]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4305 = _GEN_366 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4306 = buf_write[2] & _T_4305; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4307 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4308 = _T_4306 & _T_4307; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [1:0] _T_4315 = _T_4314 + _T_4308; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _GEN_367 = {{2'd0}, buf_write[1]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4299 = _GEN_367 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4300 = buf_write[1] & _T_4299; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4301 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4302 = _T_4300 & _T_4301; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4302}; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _T_4316 = _T_4315 + _GEN_368; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _GEN_369 = {{2'd0}, buf_write[0]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4293 = _GEN_369 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4294 = buf_write[0] & _T_4293; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4295 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4296 = _T_4294 & _T_4295; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [2:0] _GEN_370 = {{2'd0}, _T_4296}; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4316 + _GEN_370; // @[el2_lsu_bus_buffer.scala 537:142]
  wire  _T_941 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:43]
  wire  _T_4333 = _T_4311 & _T_4313; // @[el2_lsu_bus_buffer.scala 538:73]
  wire  _T_4329 = _T_4305 & _T_4307; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [1:0] _T_4334 = _T_4333 + _T_4329; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_4325 = _T_4299 & _T_4301; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [1:0] _GEN_374 = {{1'd0}, _T_4325}; // @[el2_lsu_bus_buffer.scala 538:126]
  wire [2:0] _T_4335 = _T_4334 + _GEN_374; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_4321 = _T_4293 & _T_4295; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [2:0] _GEN_376 = {{2'd0}, _T_4321}; // @[el2_lsu_bus_buffer.scala 538:126]
  wire [3:0] buf_numvld_cmd_any = _T_4335 + _GEN_376; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_942 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:72]
  wire  _T_943 = _T_941 & _T_942; // @[el2_lsu_bus_buffer.scala 293:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 390:54]
  wire  _T_944 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 293:97]
  wire  _T_945 = _T_943 & _T_944; // @[el2_lsu_bus_buffer.scala 293:80]
  wire  _T_947 = _T_945 & _T_843; // @[el2_lsu_bus_buffer.scala 293:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_960 = ~buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 294:31]
  wire  _T_961 = _T_947 & _T_960; // @[el2_lsu_bus_buffer.scala 294:29]
  reg  _T_4204; // @[Reg.scala 27:20]
  reg  _T_4201; // @[Reg.scala 27:20]
  reg  _T_4198; // @[Reg.scala 27:20]
  reg  _T_4195; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4204,_T_4201,_T_4198,_T_4195}; // @[Cat.scala 29:58]
  wire  _T_978 = ~buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 295:5]
  wire  _T_979 = _T_961 & _T_978; // @[el2_lsu_bus_buffer.scala 294:140]
  wire  _T_990 = _T_771 & _T_765; // @[el2_lsu_bus_buffer.scala 297:58]
  wire  _T_992 = _T_990 & _T_942; // @[el2_lsu_bus_buffer.scala 297:72]
  wire  _T_1010 = io_lsu_addr_m[31:2] != buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 297:123]
  wire  obuf_force_wr_en = _T_992 & _T_1010; // @[el2_lsu_bus_buffer.scala 297:101]
  wire  _T_980 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 295:119]
  wire  obuf_wr_wait = _T_979 & _T_980; // @[el2_lsu_bus_buffer.scala 295:117]
  wire  _T_981 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 296:75]
  wire  _T_982 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 296:95]
  wire  _T_983 = _T_981 & _T_982; // @[el2_lsu_bus_buffer.scala 296:79]
  wire [2:0] _T_985 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 296:121]
  wire  _T_4359 = _GEN_365 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4362 = _T_4359 | _T_4311; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4364 = _T_4362 & _T_4313; // @[el2_lsu_bus_buffer.scala 539:100]
  wire  _T_4352 = _GEN_366 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4355 = _T_4352 | _T_4305; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4357 = _T_4355 & _T_4307; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [1:0] _T_4365 = _T_4364 + _T_4357; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_4345 = _GEN_367 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4348 = _T_4345 | _T_4299; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4350 = _T_4348 & _T_4301; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [1:0] _GEN_383 = {{1'd0}, _T_4350}; // @[el2_lsu_bus_buffer.scala 539:153]
  wire [2:0] _T_4366 = _T_4365 + _GEN_383; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_4338 = _GEN_369 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4341 = _T_4338 | _T_4293; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4343 = _T_4341 & _T_4295; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [2:0] _GEN_386 = {{2'd0}, _T_4343}; // @[el2_lsu_bus_buffer.scala 539:153]
  wire [3:0] buf_numvld_pend_any = _T_4366 + _GEN_386; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_1012 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 299:53]
  wire  _T_1013 = ibuf_byp & _T_1012; // @[el2_lsu_bus_buffer.scala 299:31]
  wire  _T_1014 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 299:64]
  wire  _T_1015 = _T_1014 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 299:84]
  wire  ibuf_buf_byp = _T_1013 & _T_1015; // @[el2_lsu_bus_buffer.scala 299:61]
  wire  _T_1016 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 314:32]
  wire  _T_4655 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4657 = buf_sideeffect[0] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4667 = _T_4655 & _T_4657; // @[Mux.scala 27:72]
  wire  _T_4658 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4660 = buf_sideeffect[1] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4668 = _T_4658 & _T_4660; // @[Mux.scala 27:72]
  wire  _T_4671 = _T_4667 | _T_4668; // @[Mux.scala 27:72]
  wire  _T_4661 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4663 = buf_sideeffect[2] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4669 = _T_4661 & _T_4663; // @[Mux.scala 27:72]
  wire  _T_4672 = _T_4671 | _T_4669; // @[Mux.scala 27:72]
  wire  _T_4664 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4666 = buf_sideeffect[3] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4670 = _T_4664 & _T_4666; // @[Mux.scala 27:72]
  wire  bus_sideeffect_pend = _T_4672 | _T_4670; // @[Mux.scala 27:72]
  wire  _T_1017 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 314:74]
  wire  _T_1018 = ~_T_1017; // @[el2_lsu_bus_buffer.scala 314:52]
  wire  _T_1019 = _T_1016 & _T_1018; // @[el2_lsu_bus_buffer.scala 314:50]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire  _T_1129 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 317:150]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 377:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 378:55]
  wire  _T_4731 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 570:54]
  wire  _T_4732 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 570:75]
  wire  _T_4734 = _T_4731 ? _T_4732 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 570:39]
  wire  bus_cmd_ready = obuf_write ? _T_4734 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 570:23]
  wire  _T_1156 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 318:48]
  wire  _T_1157 = bus_cmd_ready | _T_1156; // @[el2_lsu_bus_buffer.scala 318:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1158 = _T_1157 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 318:60]
  wire  _T_1159 = _T_1019 & _T_1158; // @[el2_lsu_bus_buffer.scala 318:29]
  wire  _T_1160 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 318:77]
  wire  _T_1161 = _T_1159 & _T_1160; // @[el2_lsu_bus_buffer.scala 318:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 478:16]
  wire  _T_4679 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4680 = obuf_valid & _T_4679; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4682 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4683 = obuf_merge & _T_4682; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4684 = _T_3436 | _T_4683; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4685 = ~_T_4684; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4686 = _T_4680 & _T_4685; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4723 = _T_4655 & _T_4686; // @[Mux.scala 27:72]
  wire  _T_4691 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4692 = obuf_valid & _T_4691; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4694 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4695 = obuf_merge & _T_4694; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4696 = _T_3629 | _T_4695; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4697 = ~_T_4696; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4698 = _T_4692 & _T_4697; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4724 = _T_4658 & _T_4698; // @[Mux.scala 27:72]
  wire  _T_4727 = _T_4723 | _T_4724; // @[Mux.scala 27:72]
  wire  _T_4703 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4704 = obuf_valid & _T_4703; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4706 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4707 = obuf_merge & _T_4706; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4708 = _T_3822 | _T_4707; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4709 = ~_T_4708; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4710 = _T_4704 & _T_4709; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4725 = _T_4661 & _T_4710; // @[Mux.scala 27:72]
  wire  _T_4728 = _T_4727 | _T_4725; // @[Mux.scala 27:72]
  wire  _T_4715 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4716 = obuf_valid & _T_4715; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4718 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4719 = obuf_merge & _T_4718; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4720 = _T_4015 | _T_4719; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4721 = ~_T_4720; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4722 = _T_4716 & _T_4721; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4726 = _T_4664 & _T_4722; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4728 | _T_4726; // @[Mux.scala 27:72]
  wire  _T_1164 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 318:118]
  wire  _T_1165 = _T_1161 & _T_1164; // @[el2_lsu_bus_buffer.scala 318:116]
  wire  obuf_wr_en = _T_1165 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 318:142]
  wire  _T_1167 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 320:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 571:39]
  wire  _T_4738 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 573:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 572:39]
  wire  _T_4739 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 573:70]
  wire  _T_4740 = _T_4738 & _T_4739; // @[el2_lsu_bus_buffer.scala 573:52]
  wire  _T_4741 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 573:111]
  wire  bus_cmd_sent = _T_4740 | _T_4741; // @[el2_lsu_bus_buffer.scala 573:89]
  wire  _T_1168 = bus_cmd_sent | _T_1167; // @[el2_lsu_bus_buffer.scala 320:33]
  wire  _T_1169 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 320:65]
  wire  _T_1170 = _T_1168 & _T_1169; // @[el2_lsu_bus_buffer.scala 320:63]
  wire  _T_1171 = _T_1170 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 320:77]
  wire  obuf_rst = _T_1171 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 320:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : buf_write[0]; // @[el2_lsu_bus_buffer.scala 321:26]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : buf_addr_0; // @[el2_lsu_bus_buffer.scala 323:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : buf_sz_0; // @[el2_lsu_bus_buffer.scala 326:23]
  wire  _T_1229 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 334:39]
  wire  _T_1230 = ~_T_1229; // @[el2_lsu_bus_buffer.scala 334:26]
  wire  _T_1236 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 338:72]
  wire  _T_1239 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 338:98]
  wire  _T_1240 = obuf_sz_in[0] & _T_1239; // @[el2_lsu_bus_buffer.scala 338:96]
  wire  _T_1241 = _T_1236 | _T_1240; // @[el2_lsu_bus_buffer.scala 338:79]
  wire  _T_1244 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 338:153]
  wire  _T_1245 = ~_T_1244; // @[el2_lsu_bus_buffer.scala 338:134]
  wire  _T_1246 = obuf_sz_in[1] & _T_1245; // @[el2_lsu_bus_buffer.scala 338:132]
  wire  _T_1247 = _T_1241 | _T_1246; // @[el2_lsu_bus_buffer.scala 338:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1247; // @[el2_lsu_bus_buffer.scala 338:28]
  wire  _T_1264 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 352:40]
  wire  _T_1265 = _T_1264 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 352:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1266 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 352:80]
  wire  _T_1267 = _T_1265 & _T_1266; // @[el2_lsu_bus_buffer.scala 352:78]
  wire  _T_1268 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 352:99]
  wire  _T_1269 = _T_1267 & _T_1268; // @[el2_lsu_bus_buffer.scala 352:97]
  wire  _T_1270 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 352:113]
  wire  _T_1271 = _T_1269 & _T_1270; // @[el2_lsu_bus_buffer.scala 352:111]
  wire  _T_1272 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 352:130]
  wire  _T_1273 = _T_1271 & _T_1272; // @[el2_lsu_bus_buffer.scala 352:128]
  wire  _T_1274 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 353:20]
  wire  _T_1275 = obuf_valid & _T_1274; // @[el2_lsu_bus_buffer.scala 353:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 379:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 574:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 380:55]
  wire  _T_1276 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 353:90]
  wire  _T_1277 = bus_rsp_read & _T_1276; // @[el2_lsu_bus_buffer.scala 353:70]
  wire  _T_1278 = ~_T_1277; // @[el2_lsu_bus_buffer.scala 353:55]
  wire  _T_1279 = obuf_rdrsp_pend & _T_1278; // @[el2_lsu_bus_buffer.scala 353:53]
  wire  _T_1280 = _T_1275 | _T_1279; // @[el2_lsu_bus_buffer.scala 353:34]
  wire  obuf_nosend_in = _T_1273 & _T_1280; // @[el2_lsu_bus_buffer.scala 352:165]
  wire  _T_1248 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 346:44]
  wire  _T_1249 = obuf_wr_en & _T_1248; // @[el2_lsu_bus_buffer.scala 346:42]
  wire  _T_1250 = ~_T_1249; // @[el2_lsu_bus_buffer.scala 346:29]
  wire  _T_1251 = _T_1250 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 346:61]
  wire  _T_1255 = _T_1251 & _T_1278; // @[el2_lsu_bus_buffer.scala 346:79]
  wire  _T_1257 = bus_cmd_sent & _T_1268; // @[el2_lsu_bus_buffer.scala 347:20]
  wire  _T_1258 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 347:37]
  wire  _T_1259 = _T_1257 & _T_1258; // @[el2_lsu_bus_buffer.scala 347:35]
  wire  _T_1261 = bus_cmd_sent | _T_1268; // @[el2_lsu_bus_buffer.scala 349:44]
  wire [7:0] _T_1283 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1284 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1285 = io_lsu_addr_r[2] ? _T_1283 : _T_1284; // @[el2_lsu_bus_buffer.scala 354:46]
  wire [7:0] _T_1312 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1325 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1326 = buf_addr_0[2] ? _T_1312 : _T_1325; // @[el2_lsu_bus_buffer.scala 355:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1285 : _T_1326; // @[el2_lsu_bus_buffer.scala 354:28]
  wire [7:0] _T_1328 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1329 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1330 = io_end_addr_r[2] ? _T_1328 : _T_1329; // @[el2_lsu_bus_buffer.scala 356:46]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1330 : _T_1326; // @[el2_lsu_bus_buffer.scala 356:28]
  wire [63:0] _T_1402 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1415 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1416 = buf_addr_0[2] ? _T_1402 : _T_1415; // @[el2_lsu_bus_buffer.scala 360:8]
  wire [63:0] _T_1418 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1419 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1420 = io_lsu_addr_r[2] ? _T_1418 : _T_1419; // @[el2_lsu_bus_buffer.scala 361:44]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1420 : _T_1416; // @[el2_lsu_bus_buffer.scala 361:26]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire  _T_1761 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 372:19]
  wire  obuf_merge_en = _T_1761 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 372:35]
  wire  _T_1464 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1465 = obuf_byteen0_in[0] | _T_1464; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1468 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1469 = obuf_byteen0_in[1] | _T_1468; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1472 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1473 = obuf_byteen0_in[2] | _T_1472; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1476 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1477 = obuf_byteen0_in[3] | _T_1476; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1480 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1481 = obuf_byteen0_in[4] | _T_1480; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1484 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1485 = obuf_byteen0_in[5] | _T_1484; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1488 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1489 = obuf_byteen0_in[6] | _T_1488; // @[el2_lsu_bus_buffer.scala 363:63]
  wire  _T_1492 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 363:80]
  wire  _T_1493 = obuf_byteen0_in[7] | _T_1492; // @[el2_lsu_bus_buffer.scala 363:63]
  wire [7:0] obuf_byteen_in = {_T_1493,_T_1489,_T_1485,_T_1481,_T_1477,_T_1473,_T_1469,_T_1465}; // @[Cat.scala 29:58]
  wire [7:0] _T_1504 = _T_1464 ? obuf_data1_in[7:0] : obuf_data1_in[7:0]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1509 = _T_1468 ? obuf_data1_in[15:8] : obuf_data1_in[15:8]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1514 = _T_1472 ? obuf_data1_in[23:16] : obuf_data1_in[23:16]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1519 = _T_1476 ? obuf_data1_in[31:24] : obuf_data1_in[31:24]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1524 = _T_1480 ? obuf_data1_in[39:32] : obuf_data1_in[39:32]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1529 = _T_1484 ? obuf_data1_in[47:40] : obuf_data1_in[47:40]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1534 = _T_1488 ? obuf_data1_in[55:48] : obuf_data1_in[55:48]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [7:0] _T_1539 = _T_1492 ? obuf_data1_in[63:56] : obuf_data1_in[63:56]; // @[el2_lsu_bus_buffer.scala 364:44]
  wire [55:0] _T_1545 = {_T_1539,_T_1534,_T_1529,_T_1524,_T_1519,_T_1514,_T_1509}; // @[Cat.scala 29:58]
  wire  _T_1764 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 375:55]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 478:16]
  wire  _T_1777 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire [1:0] _T_1779 = ibuf_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_1780 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 392:114]
  wire [1:0] _GEN_387 = {{1'd0}, _T_1780}; // @[el2_lsu_bus_buffer.scala 392:103]
  wire [1:0] _T_1781 = _T_1779 & _GEN_387; // @[el2_lsu_bus_buffer.scala 392:103]
  wire [1:0] _T_1783 = io_lsu_busreq_m ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_1784 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 393:51]
  wire [1:0] _GEN_388 = {{1'd0}, _T_1784}; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1785 = _T_1783 & _GEN_388; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1786 = _T_1781 | _T_1785; // @[el2_lsu_bus_buffer.scala 392:123]
  wire [1:0] _T_1788 = io_ldst_dual_r ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_1789 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 393:108]
  wire [1:0] _GEN_389 = {{1'd0}, _T_1789}; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1790 = _T_1788 & _GEN_389; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1791 = _T_1786 | _T_1790; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1792 = _T_1791 == 2'h0; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1793 = _T_1777 & _T_1792; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1794 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1797 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 392:114]
  wire [1:0] _GEN_390 = {{1'd0}, _T_1797}; // @[el2_lsu_bus_buffer.scala 392:103]
  wire [1:0] _T_1798 = _T_1779 & _GEN_390; // @[el2_lsu_bus_buffer.scala 392:103]
  wire  _T_1801 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 393:51]
  wire [1:0] _GEN_391 = {{1'd0}, _T_1801}; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1802 = _T_1783 & _GEN_391; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1803 = _T_1798 | _T_1802; // @[el2_lsu_bus_buffer.scala 392:123]
  wire  _T_1806 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 393:108]
  wire [1:0] _GEN_392 = {{1'd0}, _T_1806}; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1807 = _T_1788 & _GEN_392; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1808 = _T_1803 | _T_1807; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1809 = _T_1808 == 2'h0; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1810 = _T_1794 & _T_1809; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1811 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1814 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 392:114]
  wire [1:0] _GEN_393 = {{1'd0}, _T_1814}; // @[el2_lsu_bus_buffer.scala 392:103]
  wire [1:0] _T_1815 = _T_1779 & _GEN_393; // @[el2_lsu_bus_buffer.scala 392:103]
  wire  _T_1818 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 393:51]
  wire [1:0] _GEN_394 = {{1'd0}, _T_1818}; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1819 = _T_1783 & _GEN_394; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1820 = _T_1815 | _T_1819; // @[el2_lsu_bus_buffer.scala 392:123]
  wire  _T_1823 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 393:108]
  wire [1:0] _GEN_395 = {{1'd0}, _T_1823}; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1824 = _T_1788 & _GEN_395; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1825 = _T_1820 | _T_1824; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1826 = _T_1825 == 2'h0; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1827 = _T_1811 & _T_1826; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1828 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1831 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 392:114]
  wire [1:0] _GEN_396 = {{1'd0}, _T_1831}; // @[el2_lsu_bus_buffer.scala 392:103]
  wire [1:0] _T_1832 = _T_1779 & _GEN_396; // @[el2_lsu_bus_buffer.scala 392:103]
  wire  _T_1835 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 393:51]
  wire [1:0] _GEN_397 = {{1'd0}, _T_1835}; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1836 = _T_1783 & _GEN_397; // @[el2_lsu_bus_buffer.scala 393:40]
  wire [1:0] _T_1837 = _T_1832 | _T_1836; // @[el2_lsu_bus_buffer.scala 392:123]
  wire  _T_1840 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 393:108]
  wire [1:0] _GEN_398 = {{1'd0}, _T_1840}; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1841 = _T_1788 & _GEN_398; // @[el2_lsu_bus_buffer.scala 393:96]
  wire [1:0] _T_1842 = _T_1837 | _T_1841; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1843 = _T_1842 == 2'h0; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1844 = _T_1828 & _T_1843; // @[el2_lsu_bus_buffer.scala 392:70]
  wire [1:0] _T_1845 = _T_1844 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1846 = _T_1827 ? 2'h2 : _T_1845; // @[Mux.scala 98:16]
  wire [1:0] _T_1847 = _T_1810 ? 2'h1 : _T_1846; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1793 ? 2'h0 : _T_1847; // @[Mux.scala 98:16]
  wire  _T_1851 = ibuf_valid & _T_1780; // @[el2_lsu_bus_buffer.scala 395:86]
  wire  _T_1852 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1853 = io_lsu_busreq_m & _T_1852; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1854 = _T_1851 | _T_1853; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1856 = io_lsu_busreq_r & _T_1784; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1857 = _T_1854 | _T_1856; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1859 = io_ldst_dual_r & _T_1789; // @[el2_lsu_bus_buffer.scala 396:101]
  wire  _T_1860 = _T_1857 | _T_1859; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1861 = ~_T_1860; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1862 = _T_1777 & _T_1861; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1865 = ibuf_valid & _T_1797; // @[el2_lsu_bus_buffer.scala 395:86]
  wire  _T_1866 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1867 = io_lsu_busreq_m & _T_1866; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1868 = _T_1865 | _T_1867; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1870 = io_lsu_busreq_r & _T_1801; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1871 = _T_1868 | _T_1870; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1873 = io_ldst_dual_r & _T_1806; // @[el2_lsu_bus_buffer.scala 396:101]
  wire  _T_1874 = _T_1871 | _T_1873; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1875 = ~_T_1874; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1876 = _T_1794 & _T_1875; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1879 = ibuf_valid & _T_1814; // @[el2_lsu_bus_buffer.scala 395:86]
  wire  _T_1880 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1881 = io_lsu_busreq_m & _T_1880; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1882 = _T_1879 | _T_1881; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1884 = io_lsu_busreq_r & _T_1818; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1885 = _T_1882 | _T_1884; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1887 = io_ldst_dual_r & _T_1823; // @[el2_lsu_bus_buffer.scala 396:101]
  wire  _T_1888 = _T_1885 | _T_1887; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1889 = ~_T_1888; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1890 = _T_1811 & _T_1889; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1893 = ibuf_valid & _T_1831; // @[el2_lsu_bus_buffer.scala 395:86]
  wire  _T_1894 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1895 = io_lsu_busreq_m & _T_1894; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1896 = _T_1893 | _T_1895; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1898 = io_lsu_busreq_r & _T_1835; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1899 = _T_1896 | _T_1898; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1901 = io_ldst_dual_r & _T_1840; // @[el2_lsu_bus_buffer.scala 396:101]
  wire  _T_1902 = _T_1899 | _T_1901; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1903 = ~_T_1902; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1904 = _T_1828 & _T_1903; // @[el2_lsu_bus_buffer.scala 395:70]
  wire [1:0] _T_1905 = _T_1904 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1906 = _T_1890 ? 2'h2 : _T_1905; // @[Mux.scala 98:16]
  wire [1:0] _T_1907 = _T_1876 ? 2'h1 : _T_1906; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2620 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2621 = buf_rspageQ_0[3] & _T_2620; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2617 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2618 = buf_rspageQ_0[2] & _T_2617; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2614 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2615 = buf_rspageQ_0[1] & _T_2614; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2611 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2612 = buf_rspageQ_0[0] & _T_2611; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2621,_T_2618,_T_2615,_T_2612}; // @[Cat.scala 29:58]
  wire  _T_1980 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1981 = ~_T_1980; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1983 = _T_1981 & _T_2611; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2636 = buf_rspageQ_1[3] & _T_2620; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2633 = buf_rspageQ_1[2] & _T_2617; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2630 = buf_rspageQ_1[1] & _T_2614; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2627 = buf_rspageQ_1[0] & _T_2611; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2636,_T_2633,_T_2630,_T_2627}; // @[Cat.scala 29:58]
  wire  _T_1984 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1985 = ~_T_1984; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1987 = _T_1985 & _T_2614; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2651 = buf_rspageQ_2[3] & _T_2620; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2648 = buf_rspageQ_2[2] & _T_2617; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2645 = buf_rspageQ_2[1] & _T_2614; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2642 = buf_rspageQ_2[0] & _T_2611; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2651,_T_2648,_T_2645,_T_2642}; // @[Cat.scala 29:58]
  wire  _T_1988 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1989 = ~_T_1988; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1991 = _T_1989 & _T_2617; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2666 = buf_rspageQ_3[3] & _T_2620; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2663 = buf_rspageQ_3[2] & _T_2617; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2660 = buf_rspageQ_3[1] & _T_2614; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2657 = buf_rspageQ_3[0] & _T_2611; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2666,_T_2663,_T_2660,_T_2657}; // @[Cat.scala 29:58]
  wire  _T_1992 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1993 = ~_T_1992; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1995 = _T_1993 & _T_2620; // @[el2_lsu_bus_buffer.scala 405:70]
  wire [3:0] RspPtrDec = {_T_1995,_T_1991,_T_1987,_T_1983}; // @[Cat.scala 29:58]
  wire [1:0] _T_2016 = RspPtrDec[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_2017 = RspPtrDec[1] ? 2'h1 : _T_2016; // @[Mux.scala 47:69]
  wire [1:0] RspPtr = RspPtrDec[0] ? 2'h0 : _T_2017; // @[Mux.scala 47:69]
  wire  _T_3406 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:77]
  wire  _T_3407 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_3408 = _T_3406 & _T_3407; // @[el2_lsu_bus_buffer.scala 460:95]
  wire  _T_3409 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3410 = _T_3408 & _T_3409; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3411 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:144]
  wire  _T_3412 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3413 = _T_3411 & _T_3412; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3414 = _T_3410 | _T_3413; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3415 = _T_766 & _T_3414; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3416 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3417 = ibuf_drain_vld & _T_3416; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3418 = _T_3415 | _T_3417; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3428 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 467:46]
  wire  _T_3463 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 575:38]
  wire  _T_3508 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3509 = bus_rsp_write & _T_3508; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3510 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 486:46]
  reg  _T_4181; // @[Reg.scala 27:20]
  reg  _T_4179; // @[Reg.scala 27:20]
  reg  _T_4177; // @[Reg.scala 27:20]
  reg  _T_4175; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4181,_T_4179,_T_4177,_T_4175}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_399 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3512 = io_lsu_axi_rid == _GEN_399; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3513 = buf_ldfwd[0] & _T_3512; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3514 = _T_3510 | _T_3513; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3515 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3518 = _T_3515 & _T_1129; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3519 = _T_3518 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_400 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3520 = io_lsu_axi_rid == _GEN_400; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3521 = _T_3519 & _T_3520; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3522 = _T_3514 | _T_3521; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3523 = bus_rsp_read & _T_3522; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3524 = _T_3509 | _T_3523; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_42 = _T_3463 & _T_3524; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3429 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3425 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3402 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3550 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3560 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 500:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_402 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3562 = io_lsu_axi_rid == _GEN_402; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3563 = _T_3560[0] & _T_3562; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3564 = _T_3520 | _T_3563; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3565 = bus_rsp_read & _T_3564; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_36 = _T_3550 & _T_3565; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3463 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3429 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3425 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3402 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3442 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3443 = _T_3442 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3568 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3571 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3572 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3573 = buf_dual_0 & _T_3572; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3574 = _T_3571 | _T_3573; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3575 = _T_3574 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3576 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3568 ? _T_3575 : _T_3576; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3550 ? _T_3443 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3463 ? _T_3443 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3429 ? _T_3443 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3425 ? _T_3428 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3402 ? _T_3418 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2019 = _T_1777 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2020 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2023 = _T_2484 & _T_4295; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2024 = _T_2020 | _T_2023; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2025 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 425:23]
  wire  _T_2027 = _T_2025 & _T_3406; // @[el2_lsu_bus_buffer.scala 425:41]
  wire  _T_2029 = _T_2027 & _T_1784; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2031 = _T_2029 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2032 = _T_2024 | _T_2031; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2033 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 426:17]
  wire  _T_2034 = _T_2033 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 426:35]
  wire  _T_2036 = _T_2034 & _T_1789; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2038 = _T_2036 & _T_1784; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2039 = _T_2032 | _T_2038; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2040 = _T_2019 & _T_2039; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2042 = _T_2040 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2045 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2048 = _T_2488 & _T_4301; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2049 = _T_2045 | _T_2048; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2056 = _T_2029 & _T_1797; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2057 = _T_2049 | _T_2056; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2063 = _T_2036 & _T_1801; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2064 = _T_2057 | _T_2063; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2065 = _T_2019 & _T_2064; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2067 = _T_2065 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2070 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2073 = _T_2492 & _T_4307; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2074 = _T_2070 | _T_2073; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2081 = _T_2029 & _T_1814; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2082 = _T_2074 | _T_2081; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2088 = _T_2036 & _T_1818; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2089 = _T_2082 | _T_2088; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2090 = _T_2019 & _T_2089; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2092 = _T_2090 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2095 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2098 = _T_2496 & _T_4313; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2099 = _T_2095 | _T_2098; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2106 = _T_2029 & _T_1831; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2107 = _T_2099 | _T_2106; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2113 = _T_2036 & _T_1835; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2114 = _T_2107 | _T_2113; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2115 = _T_2019 & _T_2114; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2117 = _T_2115 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2119 = {_T_2117,_T_2092,_T_2067}; // @[Cat.scala 29:58]
  wire  _T_3602 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3603 = _T_3408 & _T_3602; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3605 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3606 = _T_3411 & _T_3605; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3607 = _T_3603 | _T_3606; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3608 = _T_766 & _T_3607; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3609 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3610 = ibuf_drain_vld & _T_3609; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3611 = _T_3608 | _T_3610; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3656 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3701 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3702 = bus_rsp_write & _T_3701; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3703 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_403 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3705 = io_lsu_axi_rid == _GEN_403; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3706 = buf_ldfwd[1] & _T_3705; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3707 = _T_3703 | _T_3706; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3708 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3710 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_3711 = _T_3708 & _T_3710; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3712 = _T_3711 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_404 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3713 = io_lsu_axi_rid == _GEN_404; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3714 = _T_3712 & _T_3713; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3715 = _T_3707 | _T_3714; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3716 = bus_rsp_read & _T_3715; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3717 = _T_3702 | _T_3716; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_118 = _T_3656 & _T_3717; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3622 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3618 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3595 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3743 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3753 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_406 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3755 = io_lsu_axi_rid == _GEN_406; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3756 = _T_3753[0] & _T_3755; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3757 = _T_3713 | _T_3756; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3758 = bus_rsp_read & _T_3757; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_112 = _T_3743 & _T_3758; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3656 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3622 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3618 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3595 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3635 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3636 = _T_3635 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3761 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3764 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3765 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3766 = buf_dual_1 & _T_3765; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3767 = _T_3764 | _T_3766; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3768 = _T_3767 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3769 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3761 ? _T_3768 : _T_3769; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3743 ? _T_3636 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3656 ? _T_3636 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3622 ? _T_3636 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3618 ? _T_3428 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3595 ? _T_3611 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2121 = _T_1794 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2131 = _T_2027 & _T_1801; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2133 = _T_2131 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2134 = _T_2024 | _T_2133; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2138 = _T_2034 & _T_1806; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2140 = _T_2138 & _T_1784; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2141 = _T_2134 | _T_2140; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2142 = _T_2121 & _T_2141; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2144 = _T_2142 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2158 = _T_2131 & _T_1797; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2159 = _T_2049 | _T_2158; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2165 = _T_2138 & _T_1801; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2166 = _T_2159 | _T_2165; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2167 = _T_2121 & _T_2166; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2169 = _T_2167 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2183 = _T_2131 & _T_1814; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2184 = _T_2074 | _T_2183; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2190 = _T_2138 & _T_1818; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2191 = _T_2184 | _T_2190; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2192 = _T_2121 & _T_2191; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2194 = _T_2192 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2208 = _T_2131 & _T_1831; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2209 = _T_2099 | _T_2208; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2215 = _T_2138 & _T_1835; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2216 = _T_2209 | _T_2215; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2217 = _T_2121 & _T_2216; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2219 = _T_2217 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2221 = {_T_2219,_T_2194,_T_2169}; // @[Cat.scala 29:58]
  wire  _T_3795 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3796 = _T_3408 & _T_3795; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3798 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3799 = _T_3411 & _T_3798; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3800 = _T_3796 | _T_3799; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3801 = _T_766 & _T_3800; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3802 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3803 = ibuf_drain_vld & _T_3802; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3804 = _T_3801 | _T_3803; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3849 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3894 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3895 = bus_rsp_write & _T_3894; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3896 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_407 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3898 = io_lsu_axi_rid == _GEN_407; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3899 = buf_ldfwd[2] & _T_3898; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3900 = _T_3896 | _T_3899; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3901 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3903 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_3904 = _T_3901 & _T_3903; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3905 = _T_3904 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_408 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3906 = io_lsu_axi_rid == _GEN_408; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3907 = _T_3905 & _T_3906; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3908 = _T_3900 | _T_3907; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3909 = bus_rsp_read & _T_3908; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3910 = _T_3895 | _T_3909; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_194 = _T_3849 & _T_3910; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3815 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3811 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3788 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_3936 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_3946 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_410 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3948 = io_lsu_axi_rid == _GEN_410; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3949 = _T_3946[0] & _T_3948; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3950 = _T_3906 | _T_3949; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3951 = bus_rsp_read & _T_3950; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_188 = _T_3936 & _T_3951; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3849 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3815 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3811 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3788 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3828 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3829 = _T_3828 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3954 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3957 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3958 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3959 = buf_dual_2 & _T_3958; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3960 = _T_3957 | _T_3959; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3961 = _T_3960 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3962 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_3954 ? _T_3961 : _T_3962; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_3936 ? _T_3829 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3849 ? _T_3829 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3815 ? _T_3829 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3811 ? _T_3428 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3788 ? _T_3804 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2223 = _T_1811 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2233 = _T_2027 & _T_1818; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2235 = _T_2233 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2236 = _T_2024 | _T_2235; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2240 = _T_2034 & _T_1823; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2242 = _T_2240 & _T_1784; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2243 = _T_2236 | _T_2242; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2244 = _T_2223 & _T_2243; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2246 = _T_2244 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2260 = _T_2233 & _T_1797; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2261 = _T_2049 | _T_2260; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2267 = _T_2240 & _T_1801; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2268 = _T_2261 | _T_2267; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2269 = _T_2223 & _T_2268; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2271 = _T_2269 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2285 = _T_2233 & _T_1814; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2286 = _T_2074 | _T_2285; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2292 = _T_2240 & _T_1818; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2293 = _T_2286 | _T_2292; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2294 = _T_2223 & _T_2293; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2296 = _T_2294 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2310 = _T_2233 & _T_1831; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2311 = _T_2099 | _T_2310; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2317 = _T_2240 & _T_1835; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2318 = _T_2311 | _T_2317; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2319 = _T_2223 & _T_2318; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2321 = _T_2319 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2323 = {_T_2321,_T_2296,_T_2271}; // @[Cat.scala 29:58]
  wire  _T_3988 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3989 = _T_3408 & _T_3988; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3991 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3992 = _T_3411 & _T_3991; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3993 = _T_3989 | _T_3992; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3994 = _T_766 & _T_3993; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3995 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3996 = ibuf_drain_vld & _T_3995; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3997 = _T_3994 | _T_3996; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_4042 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4087 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_4088 = bus_rsp_write & _T_4087; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_4089 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_411 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_4091 = io_lsu_axi_rid == _GEN_411; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_4092 = buf_ldfwd[3] & _T_4091; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_4093 = _T_4089 | _T_4092; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_4094 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_4096 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_4097 = _T_4094 & _T_4096; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_4098 = _T_4097 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_412 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_4099 = io_lsu_axi_rid == _GEN_412; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_4100 = _T_4098 & _T_4099; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_4101 = _T_4093 | _T_4100; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_4102 = bus_rsp_read & _T_4101; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_4103 = _T_4088 | _T_4102; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_270 = _T_4042 & _T_4103; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4008 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4004 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_3981 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4129 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4139 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_414 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_4141 = io_lsu_axi_rid == _GEN_414; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_4142 = _T_4139[0] & _T_4141; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_4143 = _T_4099 | _T_4142; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_4144 = bus_rsp_read & _T_4143; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_264 = _T_4129 & _T_4144; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4042 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4008 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4004 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_3981 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4021 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_4022 = _T_4021 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_4147 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4150 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_4151 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_4152 = buf_dual_3 & _T_4151; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_4153 = _T_4150 | _T_4152; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_4154 = _T_4153 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_4155 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4147 ? _T_4154 : _T_4155; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4129 ? _T_4022 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4042 ? _T_4022 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4008 ? _T_4022 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4004 ? _T_3428 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_3981 ? _T_3997 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2325 = _T_1828 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2335 = _T_2027 & _T_1835; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2337 = _T_2335 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2338 = _T_2024 | _T_2337; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2342 = _T_2034 & _T_1840; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2344 = _T_2342 & _T_1784; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2345 = _T_2338 | _T_2344; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2346 = _T_2325 & _T_2345; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2348 = _T_2346 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2362 = _T_2335 & _T_1797; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2363 = _T_2049 | _T_2362; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2369 = _T_2342 & _T_1801; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2370 = _T_2363 | _T_2369; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2371 = _T_2325 & _T_2370; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2373 = _T_2371 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2387 = _T_2335 & _T_1814; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2388 = _T_2074 | _T_2387; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2394 = _T_2342 & _T_1818; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2395 = _T_2388 | _T_2394; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2396 = _T_2325 & _T_2395; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2398 = _T_2396 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2412 = _T_2335 & _T_1831; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2413 = _T_2099 | _T_2412; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2419 = _T_2342 & _T_1835; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2420 = _T_2413 | _T_2419; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2421 = _T_2325 & _T_2420; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2423 = _T_2421 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2425 = {_T_2423,_T_2398,_T_2373}; // @[Cat.scala 29:58]
  wire  _T_2673 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2674 = _T_1777 | _T_2673; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2675 = ~_T_2674; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2683 = _T_2675 | _T_2031; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2690 = _T_2683 | _T_2038; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2691 = _T_2019 & _T_2690; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2695 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2696 = _T_1794 | _T_2695; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2697 = ~_T_2696; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2705 = _T_2697 | _T_2056; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2712 = _T_2705 | _T_2063; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2713 = _T_2019 & _T_2712; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2717 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2718 = _T_1811 | _T_2717; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2719 = ~_T_2718; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2727 = _T_2719 | _T_2081; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2734 = _T_2727 | _T_2088; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2735 = _T_2019 & _T_2734; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2739 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2740 = _T_1828 | _T_2739; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2741 = ~_T_2740; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2749 = _T_2741 | _T_2106; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2756 = _T_2749 | _T_2113; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2757 = _T_2019 & _T_2756; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_0 = {_T_2757,_T_2735,_T_2713,_T_2691}; // @[Cat.scala 29:58]
  wire  _T_2774 = _T_2675 | _T_2133; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2781 = _T_2774 | _T_2140; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2782 = _T_2121 & _T_2781; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2796 = _T_2697 | _T_2158; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2803 = _T_2796 | _T_2165; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2804 = _T_2121 & _T_2803; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2818 = _T_2719 | _T_2183; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2825 = _T_2818 | _T_2190; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2826 = _T_2121 & _T_2825; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2840 = _T_2741 | _T_2208; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2847 = _T_2840 | _T_2215; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2848 = _T_2121 & _T_2847; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_1 = {_T_2848,_T_2826,_T_2804,_T_2782}; // @[Cat.scala 29:58]
  wire  _T_2865 = _T_2675 | _T_2235; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2872 = _T_2865 | _T_2242; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2873 = _T_2223 & _T_2872; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2887 = _T_2697 | _T_2260; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2894 = _T_2887 | _T_2267; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2895 = _T_2223 & _T_2894; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2909 = _T_2719 | _T_2285; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2916 = _T_2909 | _T_2292; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2917 = _T_2223 & _T_2916; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2931 = _T_2741 | _T_2310; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2938 = _T_2931 | _T_2317; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2939 = _T_2223 & _T_2938; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_2 = {_T_2939,_T_2917,_T_2895,_T_2873}; // @[Cat.scala 29:58]
  wire  _T_2956 = _T_2675 | _T_2337; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2963 = _T_2956 | _T_2344; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2964 = _T_2325 & _T_2963; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2978 = _T_2697 | _T_2362; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2985 = _T_2978 | _T_2369; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2986 = _T_2325 & _T_2985; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_3000 = _T_2719 | _T_2387; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_3007 = _T_3000 | _T_2394; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_3008 = _T_2325 & _T_3007; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_3022 = _T_2741 | _T_2412; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_3029 = _T_3022 | _T_2419; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_3030 = _T_2325 & _T_3029; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_3 = {_T_3030,_T_3008,_T_2986,_T_2964}; // @[Cat.scala 29:58]
  wire  _T_3115 = _T_2739 | _T_1828; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3116 = ~_T_3115; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3117 = buf_rspageQ_0[3] & _T_3116; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3109 = _T_2717 | _T_1811; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3110 = ~_T_3109; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3111 = buf_rspageQ_0[2] & _T_3110; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3103 = _T_2695 | _T_1794; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3104 = ~_T_3103; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3105 = buf_rspageQ_0[1] & _T_3104; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3097 = _T_2673 | _T_1777; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3098 = ~_T_3097; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3099 = buf_rspageQ_0[0] & _T_3098; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_0 = {_T_3117,_T_3111,_T_3105,_T_3099}; // @[Cat.scala 29:58]
  wire  _T_3036 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3039 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3042 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3045 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3047 = {_T_3045,_T_3042,_T_3039}; // @[Cat.scala 29:58]
  wire  _T_3144 = buf_rspageQ_1[3] & _T_3116; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3138 = buf_rspageQ_1[2] & _T_3110; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3132 = buf_rspageQ_1[1] & _T_3104; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3126 = buf_rspageQ_1[0] & _T_3098; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_1 = {_T_3144,_T_3138,_T_3132,_T_3126}; // @[Cat.scala 29:58]
  wire  _T_3051 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3054 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3057 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3060 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3062 = {_T_3060,_T_3057,_T_3054}; // @[Cat.scala 29:58]
  wire  _T_3171 = buf_rspageQ_2[3] & _T_3116; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3165 = buf_rspageQ_2[2] & _T_3110; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3159 = buf_rspageQ_2[1] & _T_3104; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3153 = buf_rspageQ_2[0] & _T_3098; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_2 = {_T_3171,_T_3165,_T_3159,_T_3153}; // @[Cat.scala 29:58]
  wire  _T_3066 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3069 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3072 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3075 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3077 = {_T_3075,_T_3072,_T_3069}; // @[Cat.scala 29:58]
  wire  _T_3198 = buf_rspageQ_3[3] & _T_3116; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3192 = buf_rspageQ_3[2] & _T_3110; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3186 = buf_rspageQ_3[1] & _T_3104; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3180 = buf_rspageQ_3[0] & _T_3098; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_3 = {_T_3198,_T_3192,_T_3186,_T_3180}; // @[Cat.scala 29:58]
  wire  _T_3081 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3084 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3087 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3090 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3092 = {_T_3090,_T_3087,_T_3084}; // @[Cat.scala 29:58]
  wire  _T_3203 = ibuf_drain_vld & _T_1780; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3205 = ibuf_drain_vld & _T_1797; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3207 = ibuf_drain_vld & _T_1814; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3209 = ibuf_drain_vld & _T_1831; // @[el2_lsu_bus_buffer.scala 443:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3209,_T_3207,_T_3205,_T_3203}; // @[Cat.scala 29:58]
  wire  _T_3217 = _T_3411 & _T_1789; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3220 = _T_3217 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3221 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3220; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3226 = _T_3411 & _T_1806; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3229 = _T_3226 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3230 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3229; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3235 = _T_3411 & _T_1823; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3238 = _T_3235 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3239 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3238; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3244 = _T_3411 & _T_1840; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3247 = _T_3244 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3248 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3247; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3274 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3276 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3278 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3280 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire [3:0] buf_dual_in = {_T_3280,_T_3278,_T_3276,_T_3274}; // @[Cat.scala 29:58]
  wire  _T_3285 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3287 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3289 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3291 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire [3:0] buf_samedw_in = {_T_3291,_T_3289,_T_3287,_T_3285}; // @[Cat.scala 29:58]
  wire  _T_3296 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 448:86]
  wire  _T_3297 = ibuf_drainvec_vld[0] ? _T_3296 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3300 = ibuf_drainvec_vld[1] ? _T_3296 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3303 = ibuf_drainvec_vld[2] ? _T_3296 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3306 = ibuf_drainvec_vld[3] ? _T_3296 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire [3:0] buf_nomerge_in = {_T_3306,_T_3303,_T_3300,_T_3297}; // @[Cat.scala 29:58]
  wire  _T_3314 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3217; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3319 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3226; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3324 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3235; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3329 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3244; // @[el2_lsu_bus_buffer.scala 449:49]
  wire [3:0] buf_dualhi_in = {_T_3329,_T_3324,_T_3319,_T_3314}; // @[Cat.scala 29:58]
  wire  _T_3358 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3360 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3362 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3364 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire [3:0] buf_sideeffect_in = {_T_3364,_T_3362,_T_3360,_T_3358}; // @[Cat.scala 29:58]
  wire  _T_3369 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3371 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3373 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3375 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire [3:0] buf_unsign_in = {_T_3375,_T_3373,_T_3371,_T_3369}; // @[Cat.scala 29:58]
  wire  _T_3392 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3394 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3396 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3398 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire [3:0] buf_write_in = {_T_3398,_T_3396,_T_3394,_T_3392}; // @[Cat.scala 29:58]
  wire [31:0] _T_3424 = _T_3417 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3431 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 470:89]
  wire  _T_3433 = _T_3431 & _T_1276; // @[el2_lsu_bus_buffer.scala 470:104]
  wire  _T_3446 = buf_state_en_0 & _T_1129; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3447 = _T_3446 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3449 = _T_3447 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3452 = _T_3442 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3453 = _T_3452 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_4747 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 579:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4747; // @[el2_lsu_bus_buffer.scala 579:38]
  wire  _T_3456 = _T_3452 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3461 = buf_addr_0[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3531 = bus_rsp_read_error & _T_3510; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3533 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3535 = _T_3533 & _T_3512; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3536 = _T_3531 | _T_3535; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4747; // @[el2_lsu_bus_buffer.scala 578:40]
  wire  _T_3539 = bus_rsp_write_error & _T_3508; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3540 = _T_3536 | _T_3539; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3541 = _T_3442 & _T_3540; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_46 = _T_3463 & _T_3541; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3429 ? _T_3456 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3425 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3402 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire [31:0] _T_3462 = buf_error_en_0 ? io_lsu_axi_rdata[31:0] : _T_3461; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3466 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 482:73]
  wire  _T_3467 = buf_write[0] & _T_3466; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3468 = io_dec_tlu_force_halt | _T_3467; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3470 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3471 = buf_dual_0 & _T_3470; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3474 = _T_3471 & _T_1129; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3475 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3476 = _T_3474 & _T_3475; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_4372 = _T_2620 | _T_2617; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  _T_4373 = _T_4372 | _T_2614; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  any_done_wait_state = _T_4373 | _T_2611; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  _T_3478 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3484 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3486 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3488 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3490 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3492 = _T_3484 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3493 = _T_3486 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3494 = _T_3488 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3495 = _T_3490 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3496 = _T_3492 | _T_3493; // @[Mux.scala 27:72]
  wire  _T_3497 = _T_3496 | _T_3494; // @[Mux.scala 27:72]
  wire  _T_3498 = _T_3497 | _T_3495; // @[Mux.scala 27:72]
  wire  _T_3500 = _T_3474 & _T_3498; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3501 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3502 = _T_3500 & _T_3501; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3503 = _T_3502 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3504 = _T_3478 | _T_3503; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3527 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3528 = _T_3527 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3542 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3543 = buf_state_en_0 & _T_3542; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3549 = _T_3543 ? _T_3461 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3555 = buf_ldfwd[0] | _T_3560[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3556 = _T_3555 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_29 = _T_3576 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3568 ? 1'h0 : _T_3576; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3568 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3550 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3550 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3463 & _T_3528; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_47 = _T_3463 ? _T_3549 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3463 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3463 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3429 ? _T_3449 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3429 ? _T_3453 : _GEN_45; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_60 = _T_3429 ? _T_3462 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3429 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3425 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3425 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_72 = _T_3425 ? 32'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3425 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3402 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_79 = _T_3402 ? _T_3424 : _GEN_72; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3402 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3402 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire [31:0] _T_3617 = _T_3610 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3639 = buf_state_en_1 & _T_3710; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3640 = _T_3639 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3642 = _T_3640 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3645 = _T_3635 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3646 = _T_3645 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_3649 = _T_3645 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3654 = buf_addr_1[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3724 = bus_rsp_read_error & _T_3703; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3726 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3728 = _T_3726 & _T_3705; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3729 = _T_3724 | _T_3728; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_3732 = bus_rsp_write_error & _T_3701; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3733 = _T_3729 | _T_3732; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3734 = _T_3635 & _T_3733; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_122 = _T_3656 & _T_3734; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3622 ? _T_3649 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3618 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3595 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire [31:0] _T_3655 = buf_error_en_1 ? io_lsu_axi_rdata[31:0] : _T_3654; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3660 = buf_write[1] & _T_3466; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3661 = io_dec_tlu_force_halt | _T_3660; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3663 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3664 = buf_dual_1 & _T_3663; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3667 = _T_3664 & _T_3710; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3668 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3669 = _T_3667 & _T_3668; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_3671 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3677 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3679 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3681 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3683 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3685 = _T_3677 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3686 = _T_3679 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3687 = _T_3681 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3688 = _T_3683 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3689 = _T_3685 | _T_3686; // @[Mux.scala 27:72]
  wire  _T_3690 = _T_3689 | _T_3687; // @[Mux.scala 27:72]
  wire  _T_3691 = _T_3690 | _T_3688; // @[Mux.scala 27:72]
  wire  _T_3693 = _T_3667 & _T_3691; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3694 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3695 = _T_3693 & _T_3694; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3696 = _T_3695 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3697 = _T_3671 | _T_3696; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3720 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3721 = _T_3720 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3735 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3736 = buf_state_en_1 & _T_3735; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3742 = _T_3736 ? _T_3654 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3748 = buf_ldfwd[1] | _T_3753[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3749 = _T_3748 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_105 = _T_3769 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3761 ? 1'h0 : _T_3769; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3761 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3743 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3743 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3656 & _T_3721; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_123 = _T_3656 ? _T_3742 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3656 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3656 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3622 ? _T_3642 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3622 ? _T_3646 : _GEN_121; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_136 = _T_3622 ? _T_3655 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3622 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3618 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3618 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_148 = _T_3618 ? 32'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3618 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3595 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_155 = _T_3595 ? _T_3617 : _GEN_148; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3595 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3595 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire [31:0] _T_3810 = _T_3803 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3832 = buf_state_en_2 & _T_3903; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3833 = _T_3832 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3835 = _T_3833 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3838 = _T_3828 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3839 = _T_3838 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_3842 = _T_3838 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3847 = buf_addr_2[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3917 = bus_rsp_read_error & _T_3896; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3919 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3921 = _T_3919 & _T_3898; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3922 = _T_3917 | _T_3921; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_3925 = bus_rsp_write_error & _T_3894; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3926 = _T_3922 | _T_3925; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3927 = _T_3828 & _T_3926; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_198 = _T_3849 & _T_3927; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3815 ? _T_3842 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3811 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3788 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire [31:0] _T_3848 = buf_error_en_2 ? io_lsu_axi_rdata[31:0] : _T_3847; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3853 = buf_write[2] & _T_3466; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3854 = io_dec_tlu_force_halt | _T_3853; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3856 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3857 = buf_dual_2 & _T_3856; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3860 = _T_3857 & _T_3903; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3861 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3862 = _T_3860 & _T_3861; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_3864 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3870 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3872 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3874 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3876 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3878 = _T_3870 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3879 = _T_3872 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3880 = _T_3874 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3881 = _T_3876 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3882 = _T_3878 | _T_3879; // @[Mux.scala 27:72]
  wire  _T_3883 = _T_3882 | _T_3880; // @[Mux.scala 27:72]
  wire  _T_3884 = _T_3883 | _T_3881; // @[Mux.scala 27:72]
  wire  _T_3886 = _T_3860 & _T_3884; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3887 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3888 = _T_3886 & _T_3887; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3889 = _T_3888 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3890 = _T_3864 | _T_3889; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3913 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3914 = _T_3913 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3928 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3929 = buf_state_en_2 & _T_3928; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3935 = _T_3929 ? _T_3847 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3941 = buf_ldfwd[2] | _T_3946[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3942 = _T_3941 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_181 = _T_3962 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_3954 ? 1'h0 : _T_3962; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_3954 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_3936 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_3936 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3849 & _T_3914; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_199 = _T_3849 ? _T_3935 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3849 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3849 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3815 ? _T_3835 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3815 ? _T_3839 : _GEN_197; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_212 = _T_3815 ? _T_3848 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3815 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3811 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3811 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_224 = _T_3811 ? 32'h0 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3811 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3788 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_231 = _T_3788 ? _T_3810 : _GEN_224; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3788 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3788 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire [31:0] _T_4003 = _T_3996 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_4025 = buf_state_en_3 & _T_4096; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_4026 = _T_4025 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_4028 = _T_4026 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_4031 = _T_4021 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_4032 = _T_4031 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_4035 = _T_4031 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_4040 = buf_addr_3[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_4110 = bus_rsp_read_error & _T_4089; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_4112 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_4114 = _T_4112 & _T_4091; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_4115 = _T_4110 | _T_4114; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_4118 = bus_rsp_write_error & _T_4087; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_4119 = _T_4115 | _T_4118; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_4120 = _T_4021 & _T_4119; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_274 = _T_4042 & _T_4120; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4008 ? _T_4035 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4004 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_3981 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire [31:0] _T_4041 = buf_error_en_3 ? io_lsu_axi_rdata[31:0] : _T_4040; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_4046 = buf_write[3] & _T_3466; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_4047 = io_dec_tlu_force_halt | _T_4046; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_4049 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_4050 = buf_dual_3 & _T_4049; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_4053 = _T_4050 & _T_4096; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_4054 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_4055 = _T_4053 & _T_4054; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_4057 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_4063 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4065 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4067 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4069 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4071 = _T_4063 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4072 = _T_4065 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4073 = _T_4067 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4074 = _T_4069 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4075 = _T_4071 | _T_4072; // @[Mux.scala 27:72]
  wire  _T_4076 = _T_4075 | _T_4073; // @[Mux.scala 27:72]
  wire  _T_4077 = _T_4076 | _T_4074; // @[Mux.scala 27:72]
  wire  _T_4079 = _T_4053 & _T_4077; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_4080 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_4081 = _T_4079 & _T_4080; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_4082 = _T_4081 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_4083 = _T_4057 | _T_4082; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_4106 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_4107 = _T_4106 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_4121 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_4122 = buf_state_en_3 & _T_4121; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_4128 = _T_4122 ? _T_4040 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_4134 = buf_ldfwd[3] | _T_4139[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_4135 = _T_4134 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_257 = _T_4155 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4147 ? 1'h0 : _T_4155; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4147 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4129 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4129 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4042 & _T_4107; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_275 = _T_4042 ? _T_4128 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4042 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4042 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4008 ? _T_4028 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4008 ? _T_4032 : _GEN_273; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_288 = _T_4008 ? _T_4041 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4008 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4004 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4004 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_300 = _T_4004 ? 32'h0 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4004 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_3981 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_307 = _T_3981 ? _T_4003 : _GEN_300; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_3981 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_3981 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4210; // @[Reg.scala 27:20]
  reg  _T_4213; // @[Reg.scala 27:20]
  reg  _T_4216; // @[Reg.scala 27:20]
  reg  _T_4219; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4219,_T_4216,_T_4213,_T_4210}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3221[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_1 = _T_3230[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_2 = _T_3239[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_3 = _T_3248[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  reg  _T_4281; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4277; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4273; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4269; // @[el2_lsu_bus_buffer.scala 534:82]
  wire [3:0] buf_error = {_T_4281,_T_4277,_T_4273,_T_4269}; // @[Cat.scala 29:58]
  wire  _T_4267 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4271 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4275 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4279 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire [1:0] _T_4289 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [1:0] _GEN_419 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [2:0] _T_4290 = _T_4289 + _GEN_419; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [2:0] _GEN_420 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [3:0] buf_numvld_any = _T_4290 + _GEN_420; // @[el2_lsu_bus_buffer.scala 536:96]
  wire  _T_4376 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 542:52]
  wire  _T_4377 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 542:92]
  wire  _T_4378 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 542:119]
  wire  _T_4380 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4381 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4382 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4383 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4384 = _T_4380 | _T_4381; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4385 = _T_4384 | _T_4382; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4386 = _T_4385 | _T_4383; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4387 = ~_T_4386; // @[el2_lsu_bus_buffer.scala 543:34]
  wire  _T_4389 = _T_4387 & _T_765; // @[el2_lsu_bus_buffer.scala 543:70]
  wire  _T_4392 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 545:51]
  wire  _T_4393 = _T_4392 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 545:72]
  wire  _T_4394 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 545:94]
  wire  _T_4395 = _T_4393 & _T_4394; // @[el2_lsu_bus_buffer.scala 545:92]
  wire  _T_4396 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 545:111]
  wire  _T_4398 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 548:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 632:66]
  wire  _T_4416 = _T_2673 & _T_1129; // @[Mux.scala 27:72]
  wire  _T_4417 = _T_2695 & _T_3710; // @[Mux.scala 27:72]
  wire  _T_4418 = _T_2717 & _T_3903; // @[Mux.scala 27:72]
  wire  _T_4419 = _T_2739 & _T_4096; // @[Mux.scala 27:72]
  wire  _T_4420 = _T_4416 | _T_4417; // @[Mux.scala 27:72]
  wire  _T_4421 = _T_4420 | _T_4418; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4421 | _T_4419; // @[Mux.scala 27:72]
  wire  _T_4427 = buf_error[0] & _T_1129; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4432 = buf_error[1] & _T_3710; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4437 = buf_error[2] & _T_3903; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4442 = buf_error[3] & _T_4096; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4443 = _T_2673 & _T_4427; // @[Mux.scala 27:72]
  wire  _T_4444 = _T_2695 & _T_4432; // @[Mux.scala 27:72]
  wire  _T_4445 = _T_2717 & _T_4437; // @[Mux.scala 27:72]
  wire  _T_4446 = _T_2739 & _T_4442; // @[Mux.scala 27:72]
  wire  _T_4447 = _T_4443 | _T_4444; // @[Mux.scala 27:72]
  wire  _T_4448 = _T_4447 | _T_4445; // @[Mux.scala 27:72]
  wire  _T_4455 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4456 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4457 = _T_4455 | _T_4456; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4458 = _T_4416 & _T_4457; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4463 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4464 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4465 = _T_4463 | _T_4464; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4466 = _T_4417 & _T_4465; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4471 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4472 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4473 = _T_4471 | _T_4472; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4474 = _T_4418 & _T_4473; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4479 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4480 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4481 = _T_4479 | _T_4480; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4482 = _T_4419 & _T_4481; // @[el2_lsu_bus_buffer.scala 552:106]
  wire [1:0] _T_4485 = _T_4474 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4486 = _T_4482 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_421 = {{1'd0}, _T_4466}; // @[Mux.scala 27:72]
  wire [1:0] _T_4488 = _GEN_421 | _T_4485; // @[Mux.scala 27:72]
  wire [31:0] _T_4523 = _T_4458 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4524 = _T_4466 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4525 = _T_4474 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4526 = _T_4482 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4527 = _T_4523 | _T_4524; // @[Mux.scala 27:72]
  wire [31:0] _T_4528 = _T_4527 | _T_4525; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4528 | _T_4526; // @[Mux.scala 27:72]
  wire  _T_4534 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4535 = _T_4416 & _T_4534; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4540 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4541 = _T_4417 & _T_4540; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4546 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4547 = _T_4418 & _T_4546; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4552 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4553 = _T_4419 & _T_4552; // @[el2_lsu_bus_buffer.scala 554:105]
  wire [31:0] _T_4554 = _T_4535 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4555 = _T_4541 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4556 = _T_4547 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4557 = _T_4553 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4558 = _T_4554 | _T_4555; // @[Mux.scala 27:72]
  wire [31:0] _T_4559 = _T_4558 | _T_4556; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4559 | _T_4557; // @[Mux.scala 27:72]
  wire  _T_4561 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4562 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4563 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4564 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4565 = _T_4561 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4566 = _T_4562 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4567 = _T_4563 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4568 = _T_4564 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4569 = _T_4565 | _T_4566; // @[Mux.scala 27:72]
  wire [31:0] _T_4570 = _T_4569 | _T_4567; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_addr_offset = _T_4570 | _T_4568; // @[Mux.scala 27:72]
  wire [1:0] _T_4576 = _T_4561 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4577 = _T_4562 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4578 = _T_4563 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4579 = _T_4564 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4580 = _T_4576 | _T_4577; // @[Mux.scala 27:72]
  wire [1:0] _T_4581 = _T_4580 | _T_4578; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4581 | _T_4579; // @[Mux.scala 27:72]
  wire  _T_4591 = _T_4561 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4592 = _T_4562 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4593 = _T_4563 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4594 = _T_4564 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4595 = _T_4591 | _T_4592; // @[Mux.scala 27:72]
  wire  _T_4596 = _T_4595 | _T_4593; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4596 | _T_4594; // @[Mux.scala 27:72]
  wire [63:0] _T_4616 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [35:0] _T_4617 = lsu_nonblock_addr_offset * 32'h8; // @[el2_lsu_bus_buffer.scala 559:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4616 >> _T_4617; // @[el2_lsu_bus_buffer.scala 559:92]
  wire  _T_4618 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 560:69]
  wire  _T_4620 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 561:81]
  wire  _T_4621 = lsu_nonblock_unsign & _T_4620; // @[el2_lsu_bus_buffer.scala 561:63]
  wire [31:0] _T_4623 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4624 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 562:45]
  wire  _T_4625 = lsu_nonblock_unsign & _T_4624; // @[el2_lsu_bus_buffer.scala 562:26]
  wire [31:0] _T_4627 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4628 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 563:6]
  wire  _T_4630 = _T_4628 & _T_4620; // @[el2_lsu_bus_buffer.scala 563:27]
  wire [23:0] _T_4633 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4635 = {_T_4633,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4638 = _T_4628 & _T_4624; // @[el2_lsu_bus_buffer.scala 564:27]
  wire [15:0] _T_4641 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4643 = {_T_4641,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4644 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 565:21]
  wire [31:0] _T_4645 = _T_4621 ? _T_4623 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4646 = _T_4625 ? _T_4627 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4647 = _T_4630 ? _T_4635 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4648 = _T_4638 ? _T_4643 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4649 = _T_4644 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4650 = _T_4645 | _T_4646; // @[Mux.scala 27:72]
  wire [31:0] _T_4651 = _T_4650 | _T_4647; // @[Mux.scala 27:72]
  wire [31:0] _T_4652 = _T_4651 | _T_4648; // @[Mux.scala 27:72]
  wire [63:0] _GEN_422 = {{32'd0}, _T_4652}; // @[Mux.scala 27:72]
  wire [63:0] _T_4653 = _GEN_422 | _T_4649; // @[Mux.scala 27:72]
  wire  _T_4749 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 583:36]
  wire  _T_4750 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 583:51]
  wire  _T_4751 = _T_4749 & _T_4750; // @[el2_lsu_bus_buffer.scala 583:49]
  wire [31:0] _T_4755 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4757 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4762 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 595:50]
  wire  _T_4763 = _T_4749 & _T_4762; // @[el2_lsu_bus_buffer.scala 595:48]
  wire [7:0] _T_4767 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4770 = obuf_valid & _T_1268; // @[el2_lsu_bus_buffer.scala 600:36]
  wire  _T_4772 = _T_4770 & _T_1274; // @[el2_lsu_bus_buffer.scala 600:50]
  wire  _T_4784 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4786 = _T_4784 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4789 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4791 = _T_4789 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4794 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4796 = _T_4794 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4799 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4801 = _T_4799 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4802 = _T_2673 & _T_4786; // @[Mux.scala 27:72]
  wire  _T_4803 = _T_2695 & _T_4791; // @[Mux.scala 27:72]
  wire  _T_4804 = _T_2717 & _T_4796; // @[Mux.scala 27:72]
  wire  _T_4805 = _T_2739 & _T_4801; // @[Mux.scala 27:72]
  wire  _T_4806 = _T_4802 | _T_4803; // @[Mux.scala 27:72]
  wire  _T_4807 = _T_4806 | _T_4804; // @[Mux.scala 27:72]
  wire  _T_4817 = _T_2695 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 614:98]
  wire  lsu_imprecise_error_store_tag = _T_4817 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 614:113]
  wire  _T_4823 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 616:72]
  wire  _T_4825 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4827 = _T_4825 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4828 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4829 = _T_4827 | _T_4828; // @[Mux.scala 27:72]
  wire  _T_4846 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 623:68]
  wire  _T_4849 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 624:48]
  wire  _T_4852 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 627:48]
  wire  _T_4853 = io_lsu_axi_awvalid & _T_4852; // @[el2_lsu_bus_buffer.scala 627:46]
  wire  _T_4854 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 627:92]
  wire  _T_4855 = io_lsu_axi_wvalid & _T_4854; // @[el2_lsu_bus_buffer.scala 627:90]
  wire  _T_4856 = _T_4853 | _T_4855; // @[el2_lsu_bus_buffer.scala 627:69]
  wire  _T_4857 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 627:136]
  wire  _T_4858 = io_lsu_axi_arvalid & _T_4857; // @[el2_lsu_bus_buffer.scala 627:134]
  wire  _T_4862 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 631:75]
  wire  _T_4863 = io_lsu_busreq_m & _T_4862; // @[el2_lsu_bus_buffer.scala 631:73]
  reg  _T_4866; // @[el2_lsu_bus_buffer.scala 631:56]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 472:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_busreq_r = _T_4866; // @[el2_lsu_bus_buffer.scala 631:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 541:30]
  assign io_lsu_bus_buffer_full_any = _T_4376 ? _T_4377 : _T_4378; // @[el2_lsu_bus_buffer.scala 542:30]
  assign io_lsu_bus_buffer_empty_any = _T_4389 & _T_1156; // @[el2_lsu_bus_buffer.scala 543:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 620:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 188:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 189:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 214:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 219:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4823; // @[el2_lsu_bus_buffer.scala 616:35]
  assign io_lsu_imprecise_error_store_any = _T_4807 | _T_4805; // @[el2_lsu_bus_buffer.scala 613:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4829 : lsu_nonblock_addr_offset; // @[el2_lsu_bus_buffer.scala 617:35]
  assign io_lsu_nonblock_load_valid_m = _T_4395 & _T_4396; // @[el2_lsu_bus_buffer.scala 545:32]
  assign io_lsu_nonblock_load_tag_m = _T_1793 ? 2'h0 : _T_1847; // @[el2_lsu_bus_buffer.scala 546:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4398; // @[el2_lsu_bus_buffer.scala 548:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 549:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4618; // @[el2_lsu_bus_buffer.scala 560:35]
  assign io_lsu_nonblock_load_data_error = _T_4448 | _T_4446; // @[el2_lsu_bus_buffer.scala 551:35]
  assign io_lsu_nonblock_load_data_tag = _T_4488 | _T_4486; // @[el2_lsu_bus_buffer.scala 552:33]
  assign io_lsu_nonblock_load_data = _T_4653[31:0]; // @[el2_lsu_bus_buffer.scala 561:29]
  assign io_lsu_pmu_bus_trxn = _T_4846 | _T_4741; // @[el2_lsu_bus_buffer.scala 623:23]
  assign io_lsu_pmu_bus_misaligned = _T_4849 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 624:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 625:24]
  assign io_lsu_pmu_bus_busy = _T_4856 | _T_4858; // @[el2_lsu_bus_buffer.scala 627:23]
  assign io_lsu_axi_awvalid = _T_4751 & _T_1164; // @[el2_lsu_bus_buffer.scala 583:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1772}; // @[el2_lsu_bus_buffer.scala 584:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4755; // @[el2_lsu_bus_buffer.scala 585:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 589:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 590:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4757 : 3'h2; // @[el2_lsu_bus_buffer.scala 586:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 591:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 593:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 588:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 587:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 592:20]
  assign io_lsu_axi_wvalid = _T_4763 & _T_1164; // @[el2_lsu_bus_buffer.scala 595:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 597:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4767; // @[el2_lsu_bus_buffer.scala 596:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 598:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 611:21]
  assign io_lsu_axi_arvalid = _T_4772 & _T_1164; // @[el2_lsu_bus_buffer.scala 600:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1772}; // @[el2_lsu_bus_buffer.scala 601:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4755; // @[el2_lsu_bus_buffer.scala 602:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 606:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 607:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4757 : 3'h3; // @[el2_lsu_bus_buffer.scala 603:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 608:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 610:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 605:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 604:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 609:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 612:21]
  assign io_test = _T_1862 ? 2'h0 : _T_1907; // @[el2_lsu_bus_buffer.scala 398:11]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_io_en = _T_766 & _T_767; // @[el2_lib.scala 475:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_1_io_en = _T_766 & _T_767; // @[el2_lib.scala 475:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 474:18]
  assign rvclkhdr_2_io_en = _T_1165 & io_lsu_bus_clk_en; // @[el2_lib.scala 475:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 474:18]
  assign rvclkhdr_3_io_en = _T_1165 & io_lsu_bus_clk_en; // @[el2_lib.scala 475:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_4_io_en = _T_3402 & buf_state_en_0; // @[el2_lib.scala 475:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_5_io_en = _T_3595 & buf_state_en_1; // @[el2_lib.scala 475:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_6_io_en = _T_3788 & buf_state_en_2; // @[el2_lib.scala 475:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_7_io_en = _T_3981 & buf_state_en_3; // @[el2_lib.scala 475:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_8_io_en = _T_3402 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 475:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_9_io_en = _T_3595 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 475:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_10_io_en = _T_3788 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 475:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_11_io_en = _T_3981 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 475:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
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
  _T_4234 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4231 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4228 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4225 = _RAND_4[0:0];
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
  _T_4261 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4259 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4257 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4255 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  buf_ageQ_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1772 = _RAND_17[1:0];
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
  _T_4262 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  _T_4263 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  _T_4264 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_4265 = _RAND_32[3:0];
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
  _T_4204 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  _T_4201 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  _T_4198 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4195 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  buf_dual_3 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  buf_dual_2 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  buf_dual_1 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  buf_dual_0 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  buf_samedw_3 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  buf_samedw_2 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  buf_samedw_1 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  buf_samedw_0 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  obuf_write = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  obuf_cmd_done = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  obuf_data_done = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  obuf_nosend = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  obuf_addr = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  buf_sz_0 = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  buf_sz_1 = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  buf_sz_2 = _RAND_66[1:0];
  _RAND_67 = {1{`RANDOM}};
  buf_sz_3 = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  obuf_sideeffect = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  obuf_rdrsp_pend = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  obuf_rdrsp_tag = _RAND_70[2:0];
  _RAND_71 = {1{`RANDOM}};
  buf_dualhi_3 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  buf_dualhi_2 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  buf_dualhi_1 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  buf_dualhi_0 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  obuf_sz = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  obuf_byteen = _RAND_76[7:0];
  _RAND_77 = {2{`RANDOM}};
  obuf_data = _RAND_77[63:0];
  _RAND_78 = {1{`RANDOM}};
  buf_rspageQ_0 = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  buf_rspageQ_1 = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  buf_rspageQ_2 = _RAND_80[3:0];
  _RAND_81 = {1{`RANDOM}};
  buf_rspageQ_3 = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  _T_4181 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  _T_4179 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  _T_4177 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  _T_4175 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  buf_ldfwdtag_0 = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  buf_dualtag_0 = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  buf_ldfwdtag_3 = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  buf_ldfwdtag_2 = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  buf_ldfwdtag_1 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  buf_dualtag_1 = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  buf_dualtag_2 = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  buf_dualtag_3 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  _T_4210 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  _T_4213 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  _T_4216 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  _T_4219 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4281 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4277 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4273 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4269 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4866 = _RAND_103[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4234 = 1'h0;
  end
  if (reset) begin
    _T_4231 = 1'h0;
  end
  if (reset) begin
    _T_4228 = 1'h0;
  end
  if (reset) begin
    _T_4225 = 1'h0;
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
    _T_4261 = 3'h0;
  end
  if (reset) begin
    _T_4259 = 3'h0;
  end
  if (reset) begin
    _T_4257 = 3'h0;
  end
  if (reset) begin
    _T_4255 = 3'h0;
  end
  if (reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_1772 = 2'h0;
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
    _T_4262 = 4'h0;
  end
  if (reset) begin
    _T_4263 = 4'h0;
  end
  if (reset) begin
    _T_4264 = 4'h0;
  end
  if (reset) begin
    _T_4265 = 4'h0;
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
    _T_4204 = 1'h0;
  end
  if (reset) begin
    _T_4201 = 1'h0;
  end
  if (reset) begin
    _T_4198 = 1'h0;
  end
  if (reset) begin
    _T_4195 = 1'h0;
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
    _T_4181 = 1'h0;
  end
  if (reset) begin
    _T_4179 = 1'h0;
  end
  if (reset) begin
    _T_4177 = 1'h0;
  end
  if (reset) begin
    _T_4175 = 1'h0;
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
    _T_4210 = 1'h0;
  end
  if (reset) begin
    _T_4213 = 1'h0;
  end
  if (reset) begin
    _T_4216 = 1'h0;
  end
  if (reset) begin
    _T_4219 = 1'h0;
  end
  if (reset) begin
    _T_4281 = 1'h0;
  end
  if (reset) begin
    _T_4277 = 1'h0;
  end
  if (reset) begin
    _T_4273 = 1'h0;
  end
  if (reset) begin
    _T_4269 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4866 = 1'h0;
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
    end else if (_T_3217) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4234 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4234 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4231 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4231 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4228 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4228 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4225 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4225 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3402) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3425) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3429) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3433) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3463) begin
        if (_T_3468) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3476) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3504) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3550) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3556) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3568) begin
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
    end else if (_T_3226) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3595) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3618) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3622) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3433) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3656) begin
        if (_T_3661) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3669) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3697) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3743) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3749) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3761) begin
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
    end else if (_T_3235) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3788) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3811) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3815) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3433) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3849) begin
        if (_T_3854) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3862) begin
          buf_state_2 <= 3'h4;
        end else if (_T_3890) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3936) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3942) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3954) begin
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
    end else if (_T_3244) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_3981) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4004) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4008) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3433) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4042) begin
        if (_T_4047) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4055) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4083) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4129) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4135) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4147) begin
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
      _T_4261 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4261 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4259 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4259 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4257 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4257 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4255 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4255 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2425,_T_2348};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1772 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1772 <= WrPtr0_r;
      end else begin
        _T_1772 <= 2'h0;
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1764 & obuf_rst;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1165 & io_lsu_bus_clk_en;
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
      ibuf_valid <= _T_910 & ibuf_rst;
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
      buf_ageQ_2 <= {_T_2323,_T_2246};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2221,_T_2144};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2119,_T_2042};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4262 <= 4'h0;
    end else begin
      _T_4262 <= _GEN_79[3:0];
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4263 <= 4'h0;
    end else begin
      _T_4263 <= _GEN_155[3:0];
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4264 <= 4'h0;
    end else begin
      _T_4264 <= _GEN_231[3:0];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4265 <= 4'h0;
    end else begin
      _T_4265 <= _GEN_307[3:0];
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
    end else if (_T_915) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1862) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1876) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1890) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1904) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1793) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1810) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1827) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1844) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_915) begin
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
    end else if (_T_915) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_915) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_915) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_915) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_915) begin
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
    end else if (_T_983) begin
      obuf_wr_timer <= _T_985;
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
      _T_4204 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4204 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4201 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4201 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4198 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4198 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4195 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4195 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1230 & _T_4738;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1230 & _T_4739;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
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
      obuf_rdrsp_pend <= _T_1255 | _T_1259;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1261) begin
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
      obuf_data <= {_T_1545,_T_1504};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3047,_T_3036};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3062,_T_3051};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3077,_T_3066};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3092,_T_3081};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4181 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_3981) begin
        _T_4181 <= 1'h0;
      end else if (_T_4004) begin
        _T_4181 <= 1'h0;
      end else begin
        _T_4181 <= _T_4008;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4179 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3788) begin
        _T_4179 <= 1'h0;
      end else if (_T_3811) begin
        _T_4179 <= 1'h0;
      end else begin
        _T_4179 <= _T_3815;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4177 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3595) begin
        _T_4177 <= 1'h0;
      end else if (_T_3618) begin
        _T_4177 <= 1'h0;
      end else begin
        _T_4177 <= _T_3622;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4175 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3402) begin
        _T_4175 <= 1'h0;
      end else if (_T_3425) begin
        _T_4175 <= 1'h0;
      end else begin
        _T_4175 <= _T_3429;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3402) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3425) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3429) begin
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
      end else if (_T_3217) begin
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
      if (_T_3981) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4004) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4008) begin
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
      if (_T_3788) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3811) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3815) begin
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
      if (_T_3595) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3618) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3622) begin
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
      end else if (_T_3226) begin
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
      end else if (_T_3235) begin
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
      end else if (_T_3244) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4210 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4210 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4213 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4213 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4216 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4216 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4219 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4219 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4281 <= 1'h0;
    end else begin
      _T_4281 <= _T_4279 & buf_rst_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4277 <= 1'h0;
    end else begin
      _T_4277 <= _T_4275 & buf_rst_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4273 <= 1'h0;
    end else begin
      _T_4273 <= _T_4271 & buf_rst_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4269 <= 1'h0;
    end else begin
      _T_4269 <= _T_4267 & buf_rst_0;
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
      _T_4866 <= 1'h0;
    end else begin
      _T_4866 <= _T_4863 & _T_4396;
    end
  end
endmodule
