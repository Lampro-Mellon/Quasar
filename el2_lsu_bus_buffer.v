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
  reg  _T_4210; // @[Reg.scala 27:20]
  reg  _T_4207; // @[Reg.scala 27:20]
  reg  _T_4204; // @[Reg.scala 27:20]
  reg  _T_4201; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4210,_T_4207,_T_4204,_T_4201}; // @[Cat.scala 29:58]
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
  reg [2:0] _T_4237; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4237}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4235; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4235}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4233; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4233}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4231; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4231}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2472 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3957 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3980 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3984 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1772; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1772}; // @[el2_lsu_bus_buffer.scala 381:13]
  wire  _T_3991 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 471:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3992 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3993 = obuf_merge & _T_3992; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3994 = _T_3991 | _T_3993; // @[el2_lsu_bus_buffer.scala 471:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 375:51]
  wire  _T_3995 = _T_3994 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 374:55]
  wire  _T_3996 = _T_3995 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_280 = _T_3984 & _T_3996; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_3980 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_3957 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2473 = _T_2472 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2474 = buf_ageQ_3[3] & _T_2473; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2468 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3764 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3787 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3791 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3798 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3799 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3800 = obuf_merge & _T_3799; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3801 = _T_3798 | _T_3800; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3802 = _T_3801 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3803 = _T_3802 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_204 = _T_3791 & _T_3803; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3787 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3764 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2469 = _T_2468 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2470 = buf_ageQ_3[2] & _T_2469; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2464 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3571 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3594 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3598 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3605 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3606 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3607 = obuf_merge & _T_3606; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3608 = _T_3605 | _T_3607; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3609 = _T_3608 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3610 = _T_3609 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_128 = _T_3598 & _T_3610; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3594 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3571 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2465 = _T_2464 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2466 = buf_ageQ_3[1] & _T_2465; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2460 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3378 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3401 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3405 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3412 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3413 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3414 = obuf_merge & _T_3413; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3415 = _T_3412 | _T_3414; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3416 = _T_3415 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3417 = _T_3416 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_52 = _T_3405 & _T_3417; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3401 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3378 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2461 = _T_2460 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2462 = buf_ageQ_3[0] & _T_2461; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_3 = {_T_2474,_T_2470,_T_2466,_T_2462}; // @[Cat.scala 29:58]
  wire  _T_2573 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2575 = _T_2573 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2567 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2569 = _T_2567 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2561 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2563 = _T_2561 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2575,_T_2569,_T_2563}; // @[Cat.scala 29:58]
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
  wire  _T_2455 = buf_ageQ_2[3] & _T_2473; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2451 = buf_ageQ_2[2] & _T_2469; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2447 = buf_ageQ_2[1] & _T_2465; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2443 = buf_ageQ_2[0] & _T_2461; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_2 = {_T_2455,_T_2451,_T_2447,_T_2443}; // @[Cat.scala 29:58]
  wire  _T_2552 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2554 = _T_2552 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2540 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2542 = _T_2540 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2534 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2536 = _T_2534 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_2 = {_T_2554,1'h0,_T_2542,_T_2536}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2436 = buf_ageQ_1[3] & _T_2473; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2432 = buf_ageQ_1[2] & _T_2469; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2428 = buf_ageQ_1[1] & _T_2465; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2424 = buf_ageQ_1[0] & _T_2461; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_1 = {_T_2436,_T_2432,_T_2428,_T_2424}; // @[Cat.scala 29:58]
  wire  _T_2525 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2527 = _T_2525 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2519 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2521 = _T_2519 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2507 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2509 = _T_2507 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_1 = {_T_2527,_T_2521,1'h0,_T_2509}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2417 = buf_ageQ_0[3] & _T_2473; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2413 = buf_ageQ_0[2] & _T_2469; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2409 = buf_ageQ_0[1] & _T_2465; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2405 = buf_ageQ_0[0] & _T_2461; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_0 = {_T_2417,_T_2413,_T_2409,_T_2405}; // @[Cat.scala 29:58]
  wire  _T_2498 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2500 = _T_2498 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2492 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2494 = _T_2492 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2486 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2488 = _T_2486 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_0 = {_T_2500,_T_2494,_T_2488,1'h0}; // @[Cat.scala 29:58]
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
  reg [3:0] _T_4238; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_0 = {{28'd0}, _T_4238}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_354 = {{1'd0}, _T_554}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_556 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_559 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4239; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_1 = {{28'd0}, _T_4239}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_355 = {{1'd0}, _T_559}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_561 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_564 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4240; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_2 = {{28'd0}, _T_4240}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_356 = {{1'd0}, _T_564}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_566 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_569 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4241; // @[el2_lib.scala 478:16]
  wire [31:0] buf_data_3 = {{28'd0}, _T_4241}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
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
  wire  _T_4287 = _GEN_365 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4288 = buf_write[3] & _T_4287; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4289 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4290 = _T_4288 & _T_4289; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [2:0] _GEN_366 = {{2'd0}, buf_write[2]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4281 = _GEN_366 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4282 = buf_write[2] & _T_4281; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4283 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4284 = _T_4282 & _T_4283; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [1:0] _T_4291 = _T_4290 + _T_4284; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _GEN_367 = {{2'd0}, buf_write[1]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4275 = _GEN_367 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4276 = buf_write[1] & _T_4275; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4277 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4278 = _T_4276 & _T_4277; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4278}; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _T_4292 = _T_4291 + _GEN_368; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _GEN_369 = {{2'd0}, buf_write[0]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4269 = _GEN_369 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4270 = buf_write[0] & _T_4269; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4271 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4272 = _T_4270 & _T_4271; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [2:0] _GEN_370 = {{2'd0}, _T_4272}; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4292 + _GEN_370; // @[el2_lsu_bus_buffer.scala 537:142]
  wire  _T_941 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:43]
  wire  _T_4309 = _T_4287 & _T_4289; // @[el2_lsu_bus_buffer.scala 538:73]
  wire  _T_4305 = _T_4281 & _T_4283; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [1:0] _T_4310 = _T_4309 + _T_4305; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_4301 = _T_4275 & _T_4277; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [1:0] _GEN_374 = {{1'd0}, _T_4301}; // @[el2_lsu_bus_buffer.scala 538:126]
  wire [2:0] _T_4311 = _T_4310 + _GEN_374; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_4297 = _T_4269 & _T_4271; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [2:0] _GEN_376 = {{2'd0}, _T_4297}; // @[el2_lsu_bus_buffer.scala 538:126]
  wire [3:0] buf_numvld_cmd_any = _T_4311 + _GEN_376; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_942 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:72]
  wire  _T_943 = _T_941 & _T_942; // @[el2_lsu_bus_buffer.scala 293:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 390:54]
  wire  _T_944 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 293:97]
  wire  _T_945 = _T_943 & _T_944; // @[el2_lsu_bus_buffer.scala 293:80]
  wire  _T_947 = _T_945 & _T_843; // @[el2_lsu_bus_buffer.scala 293:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_960 = ~buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 294:31]
  wire  _T_961 = _T_947 & _T_960; // @[el2_lsu_bus_buffer.scala 294:29]
  reg  _T_4180; // @[Reg.scala 27:20]
  reg  _T_4177; // @[Reg.scala 27:20]
  reg  _T_4174; // @[Reg.scala 27:20]
  reg  _T_4171; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4180,_T_4177,_T_4174,_T_4171}; // @[Cat.scala 29:58]
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
  wire  _T_4335 = _GEN_365 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4338 = _T_4335 | _T_4287; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4340 = _T_4338 & _T_4289; // @[el2_lsu_bus_buffer.scala 539:100]
  wire  _T_4328 = _GEN_366 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4331 = _T_4328 | _T_4281; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4333 = _T_4331 & _T_4283; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [1:0] _T_4341 = _T_4340 + _T_4333; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_4321 = _GEN_367 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4324 = _T_4321 | _T_4275; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4326 = _T_4324 & _T_4277; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [1:0] _GEN_383 = {{1'd0}, _T_4326}; // @[el2_lsu_bus_buffer.scala 539:153]
  wire [2:0] _T_4342 = _T_4341 + _GEN_383; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_4314 = _GEN_369 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4317 = _T_4314 | _T_4269; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4319 = _T_4317 & _T_4271; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [2:0] _GEN_386 = {{2'd0}, _T_4319}; // @[el2_lsu_bus_buffer.scala 539:153]
  wire [3:0] buf_numvld_pend_any = _T_4342 + _GEN_386; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_1012 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 299:53]
  wire  _T_1013 = ibuf_byp & _T_1012; // @[el2_lsu_bus_buffer.scala 299:31]
  wire  _T_1014 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 299:64]
  wire  _T_1015 = _T_1014 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 299:84]
  wire  ibuf_buf_byp = _T_1013 & _T_1015; // @[el2_lsu_bus_buffer.scala 299:61]
  wire  _T_1016 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 314:32]
  wire  _T_4631 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4633 = buf_sideeffect[0] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4643 = _T_4631 & _T_4633; // @[Mux.scala 27:72]
  wire  _T_4634 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4636 = buf_sideeffect[1] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4644 = _T_4634 & _T_4636; // @[Mux.scala 27:72]
  wire  _T_4647 = _T_4643 | _T_4644; // @[Mux.scala 27:72]
  wire  _T_4637 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4639 = buf_sideeffect[2] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4645 = _T_4637 & _T_4639; // @[Mux.scala 27:72]
  wire  _T_4648 = _T_4647 | _T_4645; // @[Mux.scala 27:72]
  wire  _T_4640 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4642 = buf_sideeffect[3] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4646 = _T_4640 & _T_4642; // @[Mux.scala 27:72]
  wire  bus_sideeffect_pend = _T_4648 | _T_4646; // @[Mux.scala 27:72]
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
  wire  _T_4707 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 570:54]
  wire  _T_4708 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 570:75]
  wire  _T_4710 = _T_4707 ? _T_4708 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 570:39]
  wire  bus_cmd_ready = obuf_write ? _T_4710 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 570:23]
  wire  _T_1156 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 318:48]
  wire  _T_1157 = bus_cmd_ready | _T_1156; // @[el2_lsu_bus_buffer.scala 318:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1158 = _T_1157 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 318:60]
  wire  _T_1159 = _T_1019 & _T_1158; // @[el2_lsu_bus_buffer.scala 318:29]
  wire  _T_1160 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 318:77]
  wire  _T_1161 = _T_1159 & _T_1160; // @[el2_lsu_bus_buffer.scala 318:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 478:16]
  wire  _T_4655 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4656 = obuf_valid & _T_4655; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4658 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4659 = obuf_merge & _T_4658; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4660 = _T_3412 | _T_4659; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4661 = ~_T_4660; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4662 = _T_4656 & _T_4661; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4699 = _T_4631 & _T_4662; // @[Mux.scala 27:72]
  wire  _T_4667 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4668 = obuf_valid & _T_4667; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4670 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4671 = obuf_merge & _T_4670; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4672 = _T_3605 | _T_4671; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4673 = ~_T_4672; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4674 = _T_4668 & _T_4673; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4700 = _T_4634 & _T_4674; // @[Mux.scala 27:72]
  wire  _T_4703 = _T_4699 | _T_4700; // @[Mux.scala 27:72]
  wire  _T_4679 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4680 = obuf_valid & _T_4679; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4682 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4683 = obuf_merge & _T_4682; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4684 = _T_3798 | _T_4683; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4685 = ~_T_4684; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4686 = _T_4680 & _T_4685; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4701 = _T_4637 & _T_4686; // @[Mux.scala 27:72]
  wire  _T_4704 = _T_4703 | _T_4701; // @[Mux.scala 27:72]
  wire  _T_4691 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4692 = obuf_valid & _T_4691; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4694 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4695 = obuf_merge & _T_4694; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4696 = _T_3991 | _T_4695; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4697 = ~_T_4696; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4698 = _T_4692 & _T_4697; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4702 = _T_4640 & _T_4698; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4704 | _T_4702; // @[Mux.scala 27:72]
  wire  _T_1164 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 318:118]
  wire  _T_1165 = _T_1161 & _T_1164; // @[el2_lsu_bus_buffer.scala 318:116]
  wire  obuf_wr_en = _T_1165 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 318:142]
  wire  _T_1167 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 320:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 571:39]
  wire  _T_4714 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 573:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 572:39]
  wire  _T_4715 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 573:70]
  wire  _T_4716 = _T_4714 & _T_4715; // @[el2_lsu_bus_buffer.scala 573:52]
  wire  _T_4717 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 573:111]
  wire  bus_cmd_sent = _T_4716 | _T_4717; // @[el2_lsu_bus_buffer.scala 573:89]
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
  wire  _T_1778 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1779 = ibuf_valid & _T_1778; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1780 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1781 = io_lsu_busreq_m & _T_1780; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1782 = _T_1779 | _T_1781; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1783 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1784 = io_ldst_dual_r & _T_1783; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1785 = _T_1782 | _T_1784; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1786 = ~_T_1785; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1787 = _T_1777 & _T_1786; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1788 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1789 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1790 = ibuf_valid & _T_1789; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1791 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1792 = io_lsu_busreq_m & _T_1791; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1793 = _T_1790 | _T_1792; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1794 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1795 = io_ldst_dual_r & _T_1794; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1796 = _T_1793 | _T_1795; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1797 = ~_T_1796; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1798 = _T_1788 & _T_1797; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1799 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1800 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1801 = ibuf_valid & _T_1800; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1802 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1803 = io_lsu_busreq_m & _T_1802; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1804 = _T_1801 | _T_1803; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1805 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1806 = io_ldst_dual_r & _T_1805; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1807 = _T_1804 | _T_1806; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1808 = ~_T_1807; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1809 = _T_1799 & _T_1808; // @[el2_lsu_bus_buffer.scala 392:70]
  wire  _T_1810 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 392:59]
  wire  _T_1811 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 392:97]
  wire  _T_1812 = ibuf_valid & _T_1811; // @[el2_lsu_bus_buffer.scala 392:86]
  wire  _T_1813 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 393:33]
  wire  _T_1814 = io_lsu_busreq_m & _T_1813; // @[el2_lsu_bus_buffer.scala 393:22]
  wire  _T_1815 = _T_1812 | _T_1814; // @[el2_lsu_bus_buffer.scala 392:106]
  wire  _T_1816 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 393:72]
  wire  _T_1817 = io_ldst_dual_r & _T_1816; // @[el2_lsu_bus_buffer.scala 393:60]
  wire  _T_1818 = _T_1815 | _T_1817; // @[el2_lsu_bus_buffer.scala 393:42]
  wire  _T_1819 = ~_T_1818; // @[el2_lsu_bus_buffer.scala 392:72]
  wire  _T_1820 = _T_1810 & _T_1819; // @[el2_lsu_bus_buffer.scala 392:70]
  wire [1:0] _T_1821 = _T_1820 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1822 = _T_1809 ? 2'h2 : _T_1821; // @[Mux.scala 98:16]
  wire [1:0] _T_1823 = _T_1798 ? 2'h1 : _T_1822; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1787 ? 2'h0 : _T_1823; // @[Mux.scala 98:16]
  wire  _T_1828 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1829 = io_lsu_busreq_m & _T_1828; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1830 = _T_1779 | _T_1829; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1832 = io_lsu_busreq_r & _T_1780; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1833 = _T_1830 | _T_1832; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1836 = _T_1833 | _T_1784; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1837 = ~_T_1836; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1838 = _T_1777 & _T_1837; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1842 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1843 = io_lsu_busreq_m & _T_1842; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1844 = _T_1790 | _T_1843; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1846 = io_lsu_busreq_r & _T_1791; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1847 = _T_1844 | _T_1846; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1850 = _T_1847 | _T_1795; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1851 = ~_T_1850; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1852 = _T_1788 & _T_1851; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1856 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1857 = io_lsu_busreq_m & _T_1856; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1858 = _T_1801 | _T_1857; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1860 = io_lsu_busreq_r & _T_1802; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1861 = _T_1858 | _T_1860; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1864 = _T_1861 | _T_1806; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1865 = ~_T_1864; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1866 = _T_1799 & _T_1865; // @[el2_lsu_bus_buffer.scala 395:70]
  wire  _T_1870 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 396:33]
  wire  _T_1871 = io_lsu_busreq_m & _T_1870; // @[el2_lsu_bus_buffer.scala 396:22]
  wire  _T_1872 = _T_1812 | _T_1871; // @[el2_lsu_bus_buffer.scala 395:106]
  wire  _T_1874 = io_lsu_busreq_r & _T_1813; // @[el2_lsu_bus_buffer.scala 396:61]
  wire  _T_1875 = _T_1872 | _T_1874; // @[el2_lsu_bus_buffer.scala 396:42]
  wire  _T_1878 = _T_1875 | _T_1817; // @[el2_lsu_bus_buffer.scala 396:83]
  wire  _T_1879 = ~_T_1878; // @[el2_lsu_bus_buffer.scala 395:72]
  wire  _T_1880 = _T_1810 & _T_1879; // @[el2_lsu_bus_buffer.scala 395:70]
  wire [1:0] _T_1881 = _T_1880 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1882 = _T_1866 ? 2'h2 : _T_1881; // @[Mux.scala 98:16]
  wire [1:0] _T_1883 = _T_1852 ? 2'h1 : _T_1882; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2596 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2597 = buf_rspageQ_0[3] & _T_2596; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2593 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2594 = buf_rspageQ_0[2] & _T_2593; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2590 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2591 = buf_rspageQ_0[1] & _T_2590; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2587 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2588 = buf_rspageQ_0[0] & _T_2587; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2597,_T_2594,_T_2591,_T_2588}; // @[Cat.scala 29:58]
  wire  _T_1956 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1957 = ~_T_1956; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1959 = _T_1957 & _T_2587; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2612 = buf_rspageQ_1[3] & _T_2596; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2609 = buf_rspageQ_1[2] & _T_2593; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2606 = buf_rspageQ_1[1] & _T_2590; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2603 = buf_rspageQ_1[0] & _T_2587; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2612,_T_2609,_T_2606,_T_2603}; // @[Cat.scala 29:58]
  wire  _T_1960 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1961 = ~_T_1960; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1963 = _T_1961 & _T_2590; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2627 = buf_rspageQ_2[3] & _T_2596; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2624 = buf_rspageQ_2[2] & _T_2593; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2621 = buf_rspageQ_2[1] & _T_2590; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2618 = buf_rspageQ_2[0] & _T_2587; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2627,_T_2624,_T_2621,_T_2618}; // @[Cat.scala 29:58]
  wire  _T_1964 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1965 = ~_T_1964; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1967 = _T_1965 & _T_2593; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2642 = buf_rspageQ_3[3] & _T_2596; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2639 = buf_rspageQ_3[2] & _T_2593; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2636 = buf_rspageQ_3[1] & _T_2590; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2633 = buf_rspageQ_3[0] & _T_2587; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2642,_T_2639,_T_2636,_T_2633}; // @[Cat.scala 29:58]
  wire  _T_1968 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1969 = ~_T_1968; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1971 = _T_1969 & _T_2596; // @[el2_lsu_bus_buffer.scala 405:70]
  wire [3:0] RspPtrDec = {_T_1971,_T_1967,_T_1963,_T_1959}; // @[Cat.scala 29:58]
  wire [1:0] _T_1992 = RspPtrDec[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_1993 = RspPtrDec[1] ? 2'h1 : _T_1992; // @[Mux.scala 47:69]
  wire [1:0] RspPtr = RspPtrDec[0] ? 2'h0 : _T_1993; // @[Mux.scala 47:69]
  wire  _T_3382 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:77]
  wire  _T_3383 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_3384 = _T_3382 & _T_3383; // @[el2_lsu_bus_buffer.scala 460:95]
  wire  _T_3385 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3386 = _T_3384 & _T_3385; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3387 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:144]
  wire  _T_3388 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3389 = _T_3387 & _T_3388; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3390 = _T_3386 | _T_3389; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3391 = _T_766 & _T_3390; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3392 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3393 = ibuf_drain_vld & _T_3392; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3394 = _T_3391 | _T_3393; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3404 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 467:46]
  wire  _T_3439 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 575:38]
  wire  _T_3484 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3485 = bus_rsp_write & _T_3484; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3486 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 486:46]
  reg  _T_4157; // @[Reg.scala 27:20]
  reg  _T_4155; // @[Reg.scala 27:20]
  reg  _T_4153; // @[Reg.scala 27:20]
  reg  _T_4151; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4157,_T_4155,_T_4153,_T_4151}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_387 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3488 = io_lsu_axi_rid == _GEN_387; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3489 = buf_ldfwd[0] & _T_3488; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3490 = _T_3486 | _T_3489; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3491 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3494 = _T_3491 & _T_1129; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3495 = _T_3494 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_388 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3496 = io_lsu_axi_rid == _GEN_388; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3497 = _T_3495 & _T_3496; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3498 = _T_3490 | _T_3497; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3499 = bus_rsp_read & _T_3498; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3500 = _T_3485 | _T_3499; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_42 = _T_3439 & _T_3500; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3405 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3401 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3378 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3526 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3536 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 500:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_390 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3538 = io_lsu_axi_rid == _GEN_390; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3539 = _T_3536[0] & _T_3538; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3540 = _T_3496 | _T_3539; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3541 = bus_rsp_read & _T_3540; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_36 = _T_3526 & _T_3541; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3439 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3405 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3401 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3378 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3418 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3419 = _T_3418 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3544 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3547 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3548 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3549 = buf_dual_0 & _T_3548; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3550 = _T_3547 | _T_3549; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3551 = _T_3550 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3552 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3544 ? _T_3551 : _T_3552; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3526 ? _T_3419 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3439 ? _T_3419 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3405 ? _T_3419 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3401 ? _T_3404 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3378 ? _T_3394 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_1995 = _T_1777 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_1996 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_1999 = _T_2460 & _T_4271; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2000 = _T_1996 | _T_1999; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2001 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 425:23]
  wire  _T_2003 = _T_2001 & _T_3382; // @[el2_lsu_bus_buffer.scala 425:41]
  wire  _T_2005 = _T_2003 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2007 = _T_2005 & _T_1778; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2008 = _T_2000 | _T_2007; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2009 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 426:17]
  wire  _T_2010 = _T_2009 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 426:35]
  wire  _T_2012 = _T_2010 & _T_1783; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2014 = _T_2012 & _T_1780; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2015 = _T_2008 | _T_2014; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2016 = _T_1995 & _T_2015; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2018 = _T_2016 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2021 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2024 = _T_2464 & _T_4277; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2025 = _T_2021 | _T_2024; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2032 = _T_2005 & _T_1789; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2033 = _T_2025 | _T_2032; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2039 = _T_2012 & _T_1791; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2040 = _T_2033 | _T_2039; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2041 = _T_1995 & _T_2040; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2043 = _T_2041 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2046 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2049 = _T_2468 & _T_4283; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2050 = _T_2046 | _T_2049; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2057 = _T_2005 & _T_1800; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2058 = _T_2050 | _T_2057; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2064 = _T_2012 & _T_1802; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2065 = _T_2058 | _T_2064; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2066 = _T_1995 & _T_2065; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2068 = _T_2066 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2071 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2074 = _T_2472 & _T_4289; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2075 = _T_2071 | _T_2074; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2082 = _T_2005 & _T_1811; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2083 = _T_2075 | _T_2082; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2089 = _T_2012 & _T_1813; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2090 = _T_2083 | _T_2089; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2091 = _T_1995 & _T_2090; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2093 = _T_2091 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2095 = {_T_2093,_T_2068,_T_2043}; // @[Cat.scala 29:58]
  wire  _T_3578 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3579 = _T_3384 & _T_3578; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3581 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3582 = _T_3387 & _T_3581; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3583 = _T_3579 | _T_3582; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3584 = _T_766 & _T_3583; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3585 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3586 = ibuf_drain_vld & _T_3585; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3587 = _T_3584 | _T_3586; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3632 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3677 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3678 = bus_rsp_write & _T_3677; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3679 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_391 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3681 = io_lsu_axi_rid == _GEN_391; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3682 = buf_ldfwd[1] & _T_3681; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3683 = _T_3679 | _T_3682; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3684 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3686 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_3687 = _T_3684 & _T_3686; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3688 = _T_3687 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_392 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3689 = io_lsu_axi_rid == _GEN_392; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3690 = _T_3688 & _T_3689; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3691 = _T_3683 | _T_3690; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3692 = bus_rsp_read & _T_3691; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3693 = _T_3678 | _T_3692; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_118 = _T_3632 & _T_3693; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3598 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3594 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3571 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3719 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3729 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_394 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3731 = io_lsu_axi_rid == _GEN_394; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3732 = _T_3729[0] & _T_3731; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3733 = _T_3689 | _T_3732; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3734 = bus_rsp_read & _T_3733; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_112 = _T_3719 & _T_3734; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3632 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3598 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3594 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3571 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3611 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3612 = _T_3611 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3737 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3740 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3741 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3742 = buf_dual_1 & _T_3741; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3743 = _T_3740 | _T_3742; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3744 = _T_3743 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3745 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3737 ? _T_3744 : _T_3745; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3719 ? _T_3612 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3632 ? _T_3612 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3598 ? _T_3612 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3594 ? _T_3404 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3571 ? _T_3587 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2097 = _T_1788 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2107 = _T_2003 & _T_1791; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2109 = _T_2107 & _T_1778; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2110 = _T_2000 | _T_2109; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2114 = _T_2010 & _T_1794; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2116 = _T_2114 & _T_1780; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2117 = _T_2110 | _T_2116; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2118 = _T_2097 & _T_2117; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2120 = _T_2118 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2134 = _T_2107 & _T_1789; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2135 = _T_2025 | _T_2134; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2141 = _T_2114 & _T_1791; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2142 = _T_2135 | _T_2141; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2143 = _T_2097 & _T_2142; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2145 = _T_2143 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2159 = _T_2107 & _T_1800; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2160 = _T_2050 | _T_2159; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2166 = _T_2114 & _T_1802; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2167 = _T_2160 | _T_2166; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2168 = _T_2097 & _T_2167; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2170 = _T_2168 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2184 = _T_2107 & _T_1811; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2185 = _T_2075 | _T_2184; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2191 = _T_2114 & _T_1813; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2192 = _T_2185 | _T_2191; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2193 = _T_2097 & _T_2192; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2195 = _T_2193 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2197 = {_T_2195,_T_2170,_T_2145}; // @[Cat.scala 29:58]
  wire  _T_3771 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3772 = _T_3384 & _T_3771; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3774 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3775 = _T_3387 & _T_3774; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3776 = _T_3772 | _T_3775; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3777 = _T_766 & _T_3776; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3778 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3779 = ibuf_drain_vld & _T_3778; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3780 = _T_3777 | _T_3779; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3825 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3870 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3871 = bus_rsp_write & _T_3870; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3872 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_395 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3874 = io_lsu_axi_rid == _GEN_395; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3875 = buf_ldfwd[2] & _T_3874; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3876 = _T_3872 | _T_3875; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3877 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3879 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_3880 = _T_3877 & _T_3879; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3881 = _T_3880 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_396 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3882 = io_lsu_axi_rid == _GEN_396; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3883 = _T_3881 & _T_3882; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3884 = _T_3876 | _T_3883; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3885 = bus_rsp_read & _T_3884; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3886 = _T_3871 | _T_3885; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_194 = _T_3825 & _T_3886; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3791 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3787 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3764 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_3912 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_3922 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_398 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3924 = io_lsu_axi_rid == _GEN_398; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3925 = _T_3922[0] & _T_3924; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3926 = _T_3882 | _T_3925; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3927 = bus_rsp_read & _T_3926; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_188 = _T_3912 & _T_3927; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3825 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3791 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3787 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3764 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3804 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3805 = _T_3804 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3930 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3933 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3934 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3935 = buf_dual_2 & _T_3934; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3936 = _T_3933 | _T_3935; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3937 = _T_3936 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3938 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_3930 ? _T_3937 : _T_3938; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_3912 ? _T_3805 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3825 ? _T_3805 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3791 ? _T_3805 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3787 ? _T_3404 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3764 ? _T_3780 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2199 = _T_1799 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2209 = _T_2003 & _T_1802; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2211 = _T_2209 & _T_1778; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2212 = _T_2000 | _T_2211; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2216 = _T_2010 & _T_1805; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2218 = _T_2216 & _T_1780; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2219 = _T_2212 | _T_2218; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2220 = _T_2199 & _T_2219; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2222 = _T_2220 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2236 = _T_2209 & _T_1789; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2237 = _T_2025 | _T_2236; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2243 = _T_2216 & _T_1791; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2244 = _T_2237 | _T_2243; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2245 = _T_2199 & _T_2244; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2247 = _T_2245 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2261 = _T_2209 & _T_1800; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2262 = _T_2050 | _T_2261; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2268 = _T_2216 & _T_1802; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2269 = _T_2262 | _T_2268; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2270 = _T_2199 & _T_2269; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2272 = _T_2270 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2286 = _T_2209 & _T_1811; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2287 = _T_2075 | _T_2286; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2293 = _T_2216 & _T_1813; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2294 = _T_2287 | _T_2293; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2295 = _T_2199 & _T_2294; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2297 = _T_2295 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2299 = {_T_2297,_T_2272,_T_2247}; // @[Cat.scala 29:58]
  wire  _T_3964 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3965 = _T_3384 & _T_3964; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3967 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3968 = _T_3387 & _T_3967; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3969 = _T_3965 | _T_3968; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3970 = _T_766 & _T_3969; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3971 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3972 = ibuf_drain_vld & _T_3971; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3973 = _T_3970 | _T_3972; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_4018 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4063 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_4064 = bus_rsp_write & _T_4063; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_4065 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_399 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_4067 = io_lsu_axi_rid == _GEN_399; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_4068 = buf_ldfwd[3] & _T_4067; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_4069 = _T_4065 | _T_4068; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_4070 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_4072 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_4073 = _T_4070 & _T_4072; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_4074 = _T_4073 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_400 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_4075 = io_lsu_axi_rid == _GEN_400; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_4076 = _T_4074 & _T_4075; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_4077 = _T_4069 | _T_4076; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_4078 = bus_rsp_read & _T_4077; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_4079 = _T_4064 | _T_4078; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_270 = _T_4018 & _T_4079; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_3984 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_3980 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_3957 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4105 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4115 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_402 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_4117 = io_lsu_axi_rid == _GEN_402; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_4118 = _T_4115[0] & _T_4117; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_4119 = _T_4075 | _T_4118; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_4120 = bus_rsp_read & _T_4119; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_264 = _T_4105 & _T_4120; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4018 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_3984 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_3980 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_3957 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_3997 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3998 = _T_3997 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_4123 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4126 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_4127 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_4128 = buf_dual_3 & _T_4127; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_4129 = _T_4126 | _T_4128; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_4130 = _T_4129 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_4131 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4123 ? _T_4130 : _T_4131; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4105 ? _T_3998 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4018 ? _T_3998 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_3984 ? _T_3998 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_3980 ? _T_3404 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_3957 ? _T_3973 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2301 = _T_1810 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2311 = _T_2003 & _T_1813; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2313 = _T_2311 & _T_1778; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2314 = _T_2000 | _T_2313; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2318 = _T_2010 & _T_1816; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2320 = _T_2318 & _T_1780; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2321 = _T_2314 | _T_2320; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2322 = _T_2301 & _T_2321; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2324 = _T_2322 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2338 = _T_2311 & _T_1789; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2339 = _T_2025 | _T_2338; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2345 = _T_2318 & _T_1791; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2346 = _T_2339 | _T_2345; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2347 = _T_2301 & _T_2346; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2349 = _T_2347 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2363 = _T_2311 & _T_1800; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2364 = _T_2050 | _T_2363; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2370 = _T_2318 & _T_1802; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2371 = _T_2364 | _T_2370; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2372 = _T_2301 & _T_2371; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2374 = _T_2372 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2388 = _T_2311 & _T_1811; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2389 = _T_2075 | _T_2388; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2395 = _T_2318 & _T_1813; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2396 = _T_2389 | _T_2395; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2397 = _T_2301 & _T_2396; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2399 = _T_2397 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2401 = {_T_2399,_T_2374,_T_2349}; // @[Cat.scala 29:58]
  wire  _T_2649 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2650 = _T_1777 | _T_2649; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2651 = ~_T_2650; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2659 = _T_2651 | _T_2007; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2666 = _T_2659 | _T_2014; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2667 = _T_1995 & _T_2666; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2671 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2672 = _T_1788 | _T_2671; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2673 = ~_T_2672; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2681 = _T_2673 | _T_2032; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2688 = _T_2681 | _T_2039; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2689 = _T_1995 & _T_2688; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2693 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2694 = _T_1799 | _T_2693; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2695 = ~_T_2694; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2703 = _T_2695 | _T_2057; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2710 = _T_2703 | _T_2064; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2711 = _T_1995 & _T_2710; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2715 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2716 = _T_1810 | _T_2715; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2717 = ~_T_2716; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2725 = _T_2717 | _T_2082; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2732 = _T_2725 | _T_2089; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2733 = _T_1995 & _T_2732; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_0 = {_T_2733,_T_2711,_T_2689,_T_2667}; // @[Cat.scala 29:58]
  wire  _T_2750 = _T_2651 | _T_2109; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2757 = _T_2750 | _T_2116; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2758 = _T_2097 & _T_2757; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2772 = _T_2673 | _T_2134; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2779 = _T_2772 | _T_2141; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2780 = _T_2097 & _T_2779; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2794 = _T_2695 | _T_2159; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2801 = _T_2794 | _T_2166; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2802 = _T_2097 & _T_2801; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2816 = _T_2717 | _T_2184; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2823 = _T_2816 | _T_2191; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2824 = _T_2097 & _T_2823; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_1 = {_T_2824,_T_2802,_T_2780,_T_2758}; // @[Cat.scala 29:58]
  wire  _T_2841 = _T_2651 | _T_2211; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2848 = _T_2841 | _T_2218; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2849 = _T_2199 & _T_2848; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2863 = _T_2673 | _T_2236; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2870 = _T_2863 | _T_2243; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2871 = _T_2199 & _T_2870; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2885 = _T_2695 | _T_2261; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2892 = _T_2885 | _T_2268; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2893 = _T_2199 & _T_2892; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2907 = _T_2717 | _T_2286; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2914 = _T_2907 | _T_2293; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2915 = _T_2199 & _T_2914; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_2 = {_T_2915,_T_2893,_T_2871,_T_2849}; // @[Cat.scala 29:58]
  wire  _T_2932 = _T_2651 | _T_2313; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2939 = _T_2932 | _T_2320; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2940 = _T_2301 & _T_2939; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2954 = _T_2673 | _T_2338; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2961 = _T_2954 | _T_2345; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2962 = _T_2301 & _T_2961; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2976 = _T_2695 | _T_2363; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2983 = _T_2976 | _T_2370; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2984 = _T_2301 & _T_2983; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2998 = _T_2717 | _T_2388; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_3005 = _T_2998 | _T_2395; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_3006 = _T_2301 & _T_3005; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_3 = {_T_3006,_T_2984,_T_2962,_T_2940}; // @[Cat.scala 29:58]
  wire  _T_3091 = _T_2715 | _T_1810; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3092 = ~_T_3091; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3093 = buf_rspageQ_0[3] & _T_3092; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3085 = _T_2693 | _T_1799; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3086 = ~_T_3085; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3087 = buf_rspageQ_0[2] & _T_3086; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3079 = _T_2671 | _T_1788; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3080 = ~_T_3079; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3081 = buf_rspageQ_0[1] & _T_3080; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3073 = _T_2649 | _T_1777; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3074 = ~_T_3073; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3075 = buf_rspageQ_0[0] & _T_3074; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_0 = {_T_3093,_T_3087,_T_3081,_T_3075}; // @[Cat.scala 29:58]
  wire  _T_3012 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3015 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3018 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3021 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3023 = {_T_3021,_T_3018,_T_3015}; // @[Cat.scala 29:58]
  wire  _T_3120 = buf_rspageQ_1[3] & _T_3092; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3114 = buf_rspageQ_1[2] & _T_3086; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3108 = buf_rspageQ_1[1] & _T_3080; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3102 = buf_rspageQ_1[0] & _T_3074; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_1 = {_T_3120,_T_3114,_T_3108,_T_3102}; // @[Cat.scala 29:58]
  wire  _T_3027 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3030 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3033 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3036 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3038 = {_T_3036,_T_3033,_T_3030}; // @[Cat.scala 29:58]
  wire  _T_3147 = buf_rspageQ_2[3] & _T_3092; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3141 = buf_rspageQ_2[2] & _T_3086; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3135 = buf_rspageQ_2[1] & _T_3080; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3129 = buf_rspageQ_2[0] & _T_3074; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_2 = {_T_3147,_T_3141,_T_3135,_T_3129}; // @[Cat.scala 29:58]
  wire  _T_3042 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3045 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3048 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3051 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3053 = {_T_3051,_T_3048,_T_3045}; // @[Cat.scala 29:58]
  wire  _T_3174 = buf_rspageQ_3[3] & _T_3092; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3168 = buf_rspageQ_3[2] & _T_3086; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3162 = buf_rspageQ_3[1] & _T_3080; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3156 = buf_rspageQ_3[0] & _T_3074; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_3 = {_T_3174,_T_3168,_T_3162,_T_3156}; // @[Cat.scala 29:58]
  wire  _T_3057 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3060 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3063 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3066 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3068 = {_T_3066,_T_3063,_T_3060}; // @[Cat.scala 29:58]
  wire  _T_3179 = ibuf_drain_vld & _T_1778; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3181 = ibuf_drain_vld & _T_1789; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3183 = ibuf_drain_vld & _T_1800; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3185 = ibuf_drain_vld & _T_1811; // @[el2_lsu_bus_buffer.scala 443:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3185,_T_3183,_T_3181,_T_3179}; // @[Cat.scala 29:58]
  wire  _T_3193 = _T_3387 & _T_1783; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3196 = _T_3193 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3197 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3196; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3202 = _T_3387 & _T_1794; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3205 = _T_3202 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3206 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3205; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3211 = _T_3387 & _T_1805; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3214 = _T_3211 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3215 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3214; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3220 = _T_3387 & _T_1816; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3223 = _T_3220 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3224 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3223; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3250 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3252 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3254 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3256 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire [3:0] buf_dual_in = {_T_3256,_T_3254,_T_3252,_T_3250}; // @[Cat.scala 29:58]
  wire  _T_3261 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3263 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3265 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3267 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire [3:0] buf_samedw_in = {_T_3267,_T_3265,_T_3263,_T_3261}; // @[Cat.scala 29:58]
  wire  _T_3272 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 448:86]
  wire  _T_3273 = ibuf_drainvec_vld[0] ? _T_3272 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3276 = ibuf_drainvec_vld[1] ? _T_3272 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3279 = ibuf_drainvec_vld[2] ? _T_3272 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3282 = ibuf_drainvec_vld[3] ? _T_3272 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire [3:0] buf_nomerge_in = {_T_3282,_T_3279,_T_3276,_T_3273}; // @[Cat.scala 29:58]
  wire  _T_3290 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3193; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3295 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3202; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3300 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3211; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3305 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3220; // @[el2_lsu_bus_buffer.scala 449:49]
  wire [3:0] buf_dualhi_in = {_T_3305,_T_3300,_T_3295,_T_3290}; // @[Cat.scala 29:58]
  wire  _T_3334 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3336 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3338 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3340 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire [3:0] buf_sideeffect_in = {_T_3340,_T_3338,_T_3336,_T_3334}; // @[Cat.scala 29:58]
  wire  _T_3345 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3347 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3349 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3351 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire [3:0] buf_unsign_in = {_T_3351,_T_3349,_T_3347,_T_3345}; // @[Cat.scala 29:58]
  wire  _T_3368 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3370 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3372 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3374 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire [3:0] buf_write_in = {_T_3374,_T_3372,_T_3370,_T_3368}; // @[Cat.scala 29:58]
  wire [31:0] _T_3400 = _T_3393 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3407 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 470:89]
  wire  _T_3409 = _T_3407 & _T_1276; // @[el2_lsu_bus_buffer.scala 470:104]
  wire  _T_3422 = buf_state_en_0 & _T_1129; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3423 = _T_3422 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3425 = _T_3423 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3428 = _T_3418 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3429 = _T_3428 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_4723 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 579:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4723; // @[el2_lsu_bus_buffer.scala 579:38]
  wire  _T_3432 = _T_3428 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3437 = buf_addr_0[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3507 = bus_rsp_read_error & _T_3486; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3509 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3511 = _T_3509 & _T_3488; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3512 = _T_3507 | _T_3511; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4723; // @[el2_lsu_bus_buffer.scala 578:40]
  wire  _T_3515 = bus_rsp_write_error & _T_3484; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3516 = _T_3512 | _T_3515; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3517 = _T_3418 & _T_3516; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_46 = _T_3439 & _T_3517; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3405 ? _T_3432 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3401 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3378 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire [31:0] _T_3438 = buf_error_en_0 ? io_lsu_axi_rdata[31:0] : _T_3437; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3442 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 482:73]
  wire  _T_3443 = buf_write[0] & _T_3442; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3444 = io_dec_tlu_force_halt | _T_3443; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3446 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3447 = buf_dual_0 & _T_3446; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3450 = _T_3447 & _T_1129; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3451 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3452 = _T_3450 & _T_3451; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_4348 = _T_2596 | _T_2593; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  _T_4349 = _T_4348 | _T_2590; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  any_done_wait_state = _T_4349 | _T_2587; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  _T_3454 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3460 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3462 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3464 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3466 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3468 = _T_3460 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3469 = _T_3462 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3470 = _T_3464 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3471 = _T_3466 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3472 = _T_3468 | _T_3469; // @[Mux.scala 27:72]
  wire  _T_3473 = _T_3472 | _T_3470; // @[Mux.scala 27:72]
  wire  _T_3474 = _T_3473 | _T_3471; // @[Mux.scala 27:72]
  wire  _T_3476 = _T_3450 & _T_3474; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3477 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3478 = _T_3476 & _T_3477; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3479 = _T_3478 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3480 = _T_3454 | _T_3479; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3503 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3504 = _T_3503 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3518 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3519 = buf_state_en_0 & _T_3518; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3525 = _T_3519 ? _T_3437 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3531 = buf_ldfwd[0] | _T_3536[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3532 = _T_3531 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_29 = _T_3552 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3544 ? 1'h0 : _T_3552; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3544 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3526 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3526 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3439 & _T_3504; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_47 = _T_3439 ? _T_3525 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3439 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3439 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3405 ? _T_3425 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3405 ? _T_3429 : _GEN_45; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_60 = _T_3405 ? _T_3438 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3405 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3401 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3401 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_72 = _T_3401 ? 32'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3401 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3378 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_79 = _T_3378 ? _T_3400 : _GEN_72; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3378 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3378 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire [31:0] _T_3593 = _T_3586 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3615 = buf_state_en_1 & _T_3686; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3616 = _T_3615 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3618 = _T_3616 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3621 = _T_3611 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3622 = _T_3621 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_3625 = _T_3621 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3630 = buf_addr_1[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3700 = bus_rsp_read_error & _T_3679; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3702 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3704 = _T_3702 & _T_3681; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3705 = _T_3700 | _T_3704; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_3708 = bus_rsp_write_error & _T_3677; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3709 = _T_3705 | _T_3708; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3710 = _T_3611 & _T_3709; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_122 = _T_3632 & _T_3710; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3598 ? _T_3625 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3594 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3571 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire [31:0] _T_3631 = buf_error_en_1 ? io_lsu_axi_rdata[31:0] : _T_3630; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3636 = buf_write[1] & _T_3442; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3637 = io_dec_tlu_force_halt | _T_3636; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3639 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3640 = buf_dual_1 & _T_3639; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3643 = _T_3640 & _T_3686; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3644 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3645 = _T_3643 & _T_3644; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_3647 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3653 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3655 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3657 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3659 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3661 = _T_3653 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3662 = _T_3655 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3663 = _T_3657 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3664 = _T_3659 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3665 = _T_3661 | _T_3662; // @[Mux.scala 27:72]
  wire  _T_3666 = _T_3665 | _T_3663; // @[Mux.scala 27:72]
  wire  _T_3667 = _T_3666 | _T_3664; // @[Mux.scala 27:72]
  wire  _T_3669 = _T_3643 & _T_3667; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3670 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3671 = _T_3669 & _T_3670; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3672 = _T_3671 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3673 = _T_3647 | _T_3672; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3696 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3697 = _T_3696 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3711 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3712 = buf_state_en_1 & _T_3711; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3718 = _T_3712 ? _T_3630 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3724 = buf_ldfwd[1] | _T_3729[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3725 = _T_3724 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_105 = _T_3745 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3737 ? 1'h0 : _T_3745; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3737 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3719 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3719 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3632 & _T_3697; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_123 = _T_3632 ? _T_3718 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3632 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3632 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3598 ? _T_3618 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3598 ? _T_3622 : _GEN_121; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_136 = _T_3598 ? _T_3631 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3598 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3594 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3594 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_148 = _T_3594 ? 32'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3594 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3571 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_155 = _T_3571 ? _T_3593 : _GEN_148; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3571 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3571 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire [31:0] _T_3786 = _T_3779 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3808 = buf_state_en_2 & _T_3879; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3809 = _T_3808 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3811 = _T_3809 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3814 = _T_3804 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3815 = _T_3814 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_3818 = _T_3814 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3823 = buf_addr_2[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3893 = bus_rsp_read_error & _T_3872; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3895 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3897 = _T_3895 & _T_3874; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3898 = _T_3893 | _T_3897; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_3901 = bus_rsp_write_error & _T_3870; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3902 = _T_3898 | _T_3901; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3903 = _T_3804 & _T_3902; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_198 = _T_3825 & _T_3903; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3791 ? _T_3818 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3787 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3764 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire [31:0] _T_3824 = buf_error_en_2 ? io_lsu_axi_rdata[31:0] : _T_3823; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3829 = buf_write[2] & _T_3442; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3830 = io_dec_tlu_force_halt | _T_3829; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3832 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3833 = buf_dual_2 & _T_3832; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3836 = _T_3833 & _T_3879; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3837 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3838 = _T_3836 & _T_3837; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_3840 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3846 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3848 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3850 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3852 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3854 = _T_3846 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3855 = _T_3848 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3856 = _T_3850 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3857 = _T_3852 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3858 = _T_3854 | _T_3855; // @[Mux.scala 27:72]
  wire  _T_3859 = _T_3858 | _T_3856; // @[Mux.scala 27:72]
  wire  _T_3860 = _T_3859 | _T_3857; // @[Mux.scala 27:72]
  wire  _T_3862 = _T_3836 & _T_3860; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3863 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3864 = _T_3862 & _T_3863; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3865 = _T_3864 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3866 = _T_3840 | _T_3865; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3889 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3890 = _T_3889 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3904 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3905 = buf_state_en_2 & _T_3904; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3911 = _T_3905 ? _T_3823 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3917 = buf_ldfwd[2] | _T_3922[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3918 = _T_3917 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_181 = _T_3938 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_3930 ? 1'h0 : _T_3938; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_3930 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_3912 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_3912 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3825 & _T_3890; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_199 = _T_3825 ? _T_3911 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3825 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3825 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3791 ? _T_3811 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3791 ? _T_3815 : _GEN_197; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_212 = _T_3791 ? _T_3824 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3791 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3787 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3787 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_224 = _T_3787 ? 32'h0 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3787 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3764 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_231 = _T_3764 ? _T_3786 : _GEN_224; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3764 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3764 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire [31:0] _T_3979 = _T_3972 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_4001 = buf_state_en_3 & _T_4072; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_4002 = _T_4001 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_4004 = _T_4002 & _T_1258; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_4007 = _T_3997 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_4008 = _T_4007 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_4011 = _T_4007 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_4016 = buf_addr_3[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_4086 = bus_rsp_read_error & _T_4065; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_4088 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_4090 = _T_4088 & _T_4067; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_4091 = _T_4086 | _T_4090; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_4094 = bus_rsp_write_error & _T_4063; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_4095 = _T_4091 | _T_4094; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_4096 = _T_3997 & _T_4095; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_274 = _T_4018 & _T_4096; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_3984 ? _T_4011 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_3980 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_3957 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire [31:0] _T_4017 = buf_error_en_3 ? io_lsu_axi_rdata[31:0] : _T_4016; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_4022 = buf_write[3] & _T_3442; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_4023 = io_dec_tlu_force_halt | _T_4022; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_4025 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_4026 = buf_dual_3 & _T_4025; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_4029 = _T_4026 & _T_4072; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_4030 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_4031 = _T_4029 & _T_4030; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_4033 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_4039 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4041 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4043 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4045 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4047 = _T_4039 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4048 = _T_4041 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4049 = _T_4043 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4050 = _T_4045 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4051 = _T_4047 | _T_4048; // @[Mux.scala 27:72]
  wire  _T_4052 = _T_4051 | _T_4049; // @[Mux.scala 27:72]
  wire  _T_4053 = _T_4052 | _T_4050; // @[Mux.scala 27:72]
  wire  _T_4055 = _T_4029 & _T_4053; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_4056 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_4057 = _T_4055 & _T_4056; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_4058 = _T_4057 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_4059 = _T_4033 | _T_4058; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_4082 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_4083 = _T_4082 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_4097 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_4098 = buf_state_en_3 & _T_4097; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_4104 = _T_4098 ? _T_4016 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_4110 = buf_ldfwd[3] | _T_4115[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_4111 = _T_4110 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_257 = _T_4131 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4123 ? 1'h0 : _T_4131; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4123 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4105 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4105 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4018 & _T_4083; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_275 = _T_4018 ? _T_4104 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4018 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4018 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_3984 ? _T_4004 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_3984 ? _T_4008 : _GEN_273; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_288 = _T_3984 ? _T_4017 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_3984 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_3980 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_3980 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_300 = _T_3980 ? 32'h0 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_3980 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_3957 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_307 = _T_3957 ? _T_3979 : _GEN_300; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_3957 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_3957 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4186; // @[Reg.scala 27:20]
  reg  _T_4189; // @[Reg.scala 27:20]
  reg  _T_4192; // @[Reg.scala 27:20]
  reg  _T_4195; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4195,_T_4192,_T_4189,_T_4186}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3197[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_1 = _T_3206[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_2 = _T_3215[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_3 = _T_3224[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  reg  _T_4257; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4253; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4249; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4245; // @[el2_lsu_bus_buffer.scala 534:82]
  wire [3:0] buf_error = {_T_4257,_T_4253,_T_4249,_T_4245}; // @[Cat.scala 29:58]
  wire  _T_4243 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4247 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4251 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4255 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire [1:0] _T_4265 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [1:0] _GEN_407 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [2:0] _T_4266 = _T_4265 + _GEN_407; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [2:0] _GEN_408 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [3:0] buf_numvld_any = _T_4266 + _GEN_408; // @[el2_lsu_bus_buffer.scala 536:96]
  wire  _T_4352 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 542:52]
  wire  _T_4353 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 542:92]
  wire  _T_4354 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 542:119]
  wire  _T_4356 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4357 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4358 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4359 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4360 = _T_4356 | _T_4357; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4361 = _T_4360 | _T_4358; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4362 = _T_4361 | _T_4359; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4363 = ~_T_4362; // @[el2_lsu_bus_buffer.scala 543:34]
  wire  _T_4365 = _T_4363 & _T_765; // @[el2_lsu_bus_buffer.scala 543:70]
  wire  _T_4368 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 545:51]
  wire  _T_4369 = _T_4368 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 545:72]
  wire  _T_4370 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 545:94]
  wire  _T_4371 = _T_4369 & _T_4370; // @[el2_lsu_bus_buffer.scala 545:92]
  wire  _T_4372 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 545:111]
  wire  _T_4374 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 548:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 632:66]
  wire  _T_4392 = _T_2649 & _T_1129; // @[Mux.scala 27:72]
  wire  _T_4393 = _T_2671 & _T_3686; // @[Mux.scala 27:72]
  wire  _T_4394 = _T_2693 & _T_3879; // @[Mux.scala 27:72]
  wire  _T_4395 = _T_2715 & _T_4072; // @[Mux.scala 27:72]
  wire  _T_4396 = _T_4392 | _T_4393; // @[Mux.scala 27:72]
  wire  _T_4397 = _T_4396 | _T_4394; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4397 | _T_4395; // @[Mux.scala 27:72]
  wire  _T_4403 = buf_error[0] & _T_1129; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4408 = buf_error[1] & _T_3686; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4413 = buf_error[2] & _T_3879; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4418 = buf_error[3] & _T_4072; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4419 = _T_2649 & _T_4403; // @[Mux.scala 27:72]
  wire  _T_4420 = _T_2671 & _T_4408; // @[Mux.scala 27:72]
  wire  _T_4421 = _T_2693 & _T_4413; // @[Mux.scala 27:72]
  wire  _T_4422 = _T_2715 & _T_4418; // @[Mux.scala 27:72]
  wire  _T_4423 = _T_4419 | _T_4420; // @[Mux.scala 27:72]
  wire  _T_4424 = _T_4423 | _T_4421; // @[Mux.scala 27:72]
  wire  _T_4431 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4432 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4433 = _T_4431 | _T_4432; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4434 = _T_4392 & _T_4433; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4439 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4440 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4441 = _T_4439 | _T_4440; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4442 = _T_4393 & _T_4441; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4447 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4448 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4449 = _T_4447 | _T_4448; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4450 = _T_4394 & _T_4449; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4455 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4456 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4457 = _T_4455 | _T_4456; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4458 = _T_4395 & _T_4457; // @[el2_lsu_bus_buffer.scala 552:106]
  wire [1:0] _T_4461 = _T_4450 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4462 = _T_4458 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_409 = {{1'd0}, _T_4442}; // @[Mux.scala 27:72]
  wire [1:0] _T_4464 = _GEN_409 | _T_4461; // @[Mux.scala 27:72]
  wire [31:0] _T_4499 = _T_4434 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4500 = _T_4442 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4501 = _T_4450 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4502 = _T_4458 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4503 = _T_4499 | _T_4500; // @[Mux.scala 27:72]
  wire [31:0] _T_4504 = _T_4503 | _T_4501; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4504 | _T_4502; // @[Mux.scala 27:72]
  wire  _T_4510 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4511 = _T_4392 & _T_4510; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4516 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4517 = _T_4393 & _T_4516; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4522 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4523 = _T_4394 & _T_4522; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4528 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4529 = _T_4395 & _T_4528; // @[el2_lsu_bus_buffer.scala 554:105]
  wire [31:0] _T_4530 = _T_4511 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4531 = _T_4517 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4532 = _T_4523 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4533 = _T_4529 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4534 = _T_4530 | _T_4531; // @[Mux.scala 27:72]
  wire [31:0] _T_4535 = _T_4534 | _T_4532; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4535 | _T_4533; // @[Mux.scala 27:72]
  wire  _T_4537 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4538 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4539 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4540 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4541 = _T_4537 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4542 = _T_4538 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4543 = _T_4539 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4544 = _T_4540 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4545 = _T_4541 | _T_4542; // @[Mux.scala 27:72]
  wire [31:0] _T_4546 = _T_4545 | _T_4543; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_addr_offset = _T_4546 | _T_4544; // @[Mux.scala 27:72]
  wire [1:0] _T_4552 = _T_4537 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4553 = _T_4538 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4554 = _T_4539 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4555 = _T_4540 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4556 = _T_4552 | _T_4553; // @[Mux.scala 27:72]
  wire [1:0] _T_4557 = _T_4556 | _T_4554; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4557 | _T_4555; // @[Mux.scala 27:72]
  wire  _T_4567 = _T_4537 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4568 = _T_4538 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4569 = _T_4539 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4570 = _T_4540 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4571 = _T_4567 | _T_4568; // @[Mux.scala 27:72]
  wire  _T_4572 = _T_4571 | _T_4569; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4572 | _T_4570; // @[Mux.scala 27:72]
  wire [63:0] _T_4592 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [35:0] _T_4593 = lsu_nonblock_addr_offset * 32'h8; // @[el2_lsu_bus_buffer.scala 559:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4592 >> _T_4593; // @[el2_lsu_bus_buffer.scala 559:92]
  wire  _T_4594 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 560:69]
  wire  _T_4596 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 561:81]
  wire  _T_4597 = lsu_nonblock_unsign & _T_4596; // @[el2_lsu_bus_buffer.scala 561:63]
  wire [31:0] _T_4599 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4600 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 562:45]
  wire  _T_4601 = lsu_nonblock_unsign & _T_4600; // @[el2_lsu_bus_buffer.scala 562:26]
  wire [31:0] _T_4603 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4604 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 563:6]
  wire  _T_4606 = _T_4604 & _T_4596; // @[el2_lsu_bus_buffer.scala 563:27]
  wire [23:0] _T_4609 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4611 = {_T_4609,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4614 = _T_4604 & _T_4600; // @[el2_lsu_bus_buffer.scala 564:27]
  wire [15:0] _T_4617 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4619 = {_T_4617,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4620 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 565:21]
  wire [31:0] _T_4621 = _T_4597 ? _T_4599 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4622 = _T_4601 ? _T_4603 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4623 = _T_4606 ? _T_4611 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4624 = _T_4614 ? _T_4619 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4625 = _T_4620 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4626 = _T_4621 | _T_4622; // @[Mux.scala 27:72]
  wire [31:0] _T_4627 = _T_4626 | _T_4623; // @[Mux.scala 27:72]
  wire [31:0] _T_4628 = _T_4627 | _T_4624; // @[Mux.scala 27:72]
  wire [63:0] _GEN_410 = {{32'd0}, _T_4628}; // @[Mux.scala 27:72]
  wire [63:0] _T_4629 = _GEN_410 | _T_4625; // @[Mux.scala 27:72]
  wire  _T_4725 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 583:36]
  wire  _T_4726 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 583:51]
  wire  _T_4727 = _T_4725 & _T_4726; // @[el2_lsu_bus_buffer.scala 583:49]
  wire [31:0] _T_4731 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4733 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4738 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 595:50]
  wire  _T_4739 = _T_4725 & _T_4738; // @[el2_lsu_bus_buffer.scala 595:48]
  wire [7:0] _T_4743 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4746 = obuf_valid & _T_1268; // @[el2_lsu_bus_buffer.scala 600:36]
  wire  _T_4748 = _T_4746 & _T_1274; // @[el2_lsu_bus_buffer.scala 600:50]
  wire  _T_4760 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4762 = _T_4760 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4765 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4767 = _T_4765 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4770 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4772 = _T_4770 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4775 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4777 = _T_4775 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4778 = _T_2649 & _T_4762; // @[Mux.scala 27:72]
  wire  _T_4779 = _T_2671 & _T_4767; // @[Mux.scala 27:72]
  wire  _T_4780 = _T_2693 & _T_4772; // @[Mux.scala 27:72]
  wire  _T_4781 = _T_2715 & _T_4777; // @[Mux.scala 27:72]
  wire  _T_4782 = _T_4778 | _T_4779; // @[Mux.scala 27:72]
  wire  _T_4783 = _T_4782 | _T_4780; // @[Mux.scala 27:72]
  wire  _T_4793 = _T_2671 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 614:98]
  wire  lsu_imprecise_error_store_tag = _T_4793 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 614:113]
  wire  _T_4799 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 616:72]
  wire  _T_4801 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4803 = _T_4801 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4804 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4805 = _T_4803 | _T_4804; // @[Mux.scala 27:72]
  wire  _T_4822 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 623:68]
  wire  _T_4825 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 624:48]
  wire  _T_4828 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 627:48]
  wire  _T_4829 = io_lsu_axi_awvalid & _T_4828; // @[el2_lsu_bus_buffer.scala 627:46]
  wire  _T_4830 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 627:92]
  wire  _T_4831 = io_lsu_axi_wvalid & _T_4830; // @[el2_lsu_bus_buffer.scala 627:90]
  wire  _T_4832 = _T_4829 | _T_4831; // @[el2_lsu_bus_buffer.scala 627:69]
  wire  _T_4833 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 627:136]
  wire  _T_4834 = io_lsu_axi_arvalid & _T_4833; // @[el2_lsu_bus_buffer.scala 627:134]
  wire  _T_4838 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 631:75]
  wire  _T_4839 = io_lsu_busreq_m & _T_4838; // @[el2_lsu_bus_buffer.scala 631:73]
  reg  _T_4842; // @[el2_lsu_bus_buffer.scala 631:56]
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
  assign io_lsu_busreq_r = _T_4842; // @[el2_lsu_bus_buffer.scala 631:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 541:30]
  assign io_lsu_bus_buffer_full_any = _T_4352 ? _T_4353 : _T_4354; // @[el2_lsu_bus_buffer.scala 542:30]
  assign io_lsu_bus_buffer_empty_any = _T_4365 & _T_1156; // @[el2_lsu_bus_buffer.scala 543:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 620:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 188:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 189:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 214:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 219:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4799; // @[el2_lsu_bus_buffer.scala 616:35]
  assign io_lsu_imprecise_error_store_any = _T_4783 | _T_4781; // @[el2_lsu_bus_buffer.scala 613:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4805 : lsu_nonblock_addr_offset; // @[el2_lsu_bus_buffer.scala 617:35]
  assign io_lsu_nonblock_load_valid_m = _T_4371 & _T_4372; // @[el2_lsu_bus_buffer.scala 545:32]
  assign io_lsu_nonblock_load_tag_m = _T_1787 ? 2'h0 : _T_1823; // @[el2_lsu_bus_buffer.scala 546:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4374; // @[el2_lsu_bus_buffer.scala 548:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 549:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4594; // @[el2_lsu_bus_buffer.scala 560:35]
  assign io_lsu_nonblock_load_data_error = _T_4424 | _T_4422; // @[el2_lsu_bus_buffer.scala 551:35]
  assign io_lsu_nonblock_load_data_tag = _T_4464 | _T_4462; // @[el2_lsu_bus_buffer.scala 552:33]
  assign io_lsu_nonblock_load_data = _T_4629[31:0]; // @[el2_lsu_bus_buffer.scala 561:29]
  assign io_lsu_pmu_bus_trxn = _T_4822 | _T_4717; // @[el2_lsu_bus_buffer.scala 623:23]
  assign io_lsu_pmu_bus_misaligned = _T_4825 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 624:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 625:24]
  assign io_lsu_pmu_bus_busy = _T_4832 | _T_4834; // @[el2_lsu_bus_buffer.scala 627:23]
  assign io_lsu_axi_awvalid = _T_4727 & _T_1164; // @[el2_lsu_bus_buffer.scala 583:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1772}; // @[el2_lsu_bus_buffer.scala 584:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4731; // @[el2_lsu_bus_buffer.scala 585:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 589:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 590:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4733 : 3'h2; // @[el2_lsu_bus_buffer.scala 586:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 591:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 593:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 588:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 587:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 592:20]
  assign io_lsu_axi_wvalid = _T_4739 & _T_1164; // @[el2_lsu_bus_buffer.scala 595:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 597:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4743; // @[el2_lsu_bus_buffer.scala 596:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 598:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 611:21]
  assign io_lsu_axi_arvalid = _T_4748 & _T_1164; // @[el2_lsu_bus_buffer.scala 600:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1772}; // @[el2_lsu_bus_buffer.scala 601:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4731; // @[el2_lsu_bus_buffer.scala 602:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 606:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 607:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4733 : 3'h3; // @[el2_lsu_bus_buffer.scala 603:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 608:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 610:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 605:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 604:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 609:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 612:21]
  assign io_test = _T_1838 ? 2'h0 : _T_1883; // @[el2_lsu_bus_buffer.scala 398:11]
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
  assign rvclkhdr_4_io_en = _T_3378 & buf_state_en_0; // @[el2_lib.scala 475:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_5_io_en = _T_3571 & buf_state_en_1; // @[el2_lib.scala 475:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_6_io_en = _T_3764 & buf_state_en_2; // @[el2_lib.scala 475:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_7_io_en = _T_3957 & buf_state_en_3; // @[el2_lib.scala 475:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_8_io_en = _T_3378 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 475:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_9_io_en = _T_3571 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 475:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_10_io_en = _T_3764 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 475:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 476:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 474:18]
  assign rvclkhdr_11_io_en = _T_3957 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 475:17]
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
  _T_4210 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4207 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4204 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4201 = _RAND_4[0:0];
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
  _T_4237 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4235 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4233 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4231 = _RAND_15[2:0];
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
  _T_4238 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  _T_4239 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  _T_4240 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_4241 = _RAND_32[3:0];
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
  _T_4180 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  _T_4177 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  _T_4174 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4171 = _RAND_50[0:0];
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
  _T_4157 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  _T_4155 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  _T_4153 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  _T_4151 = _RAND_85[0:0];
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
  _T_4186 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  _T_4189 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  _T_4192 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  _T_4195 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4257 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4253 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4249 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4245 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4842 = _RAND_103[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4210 = 1'h0;
  end
  if (reset) begin
    _T_4207 = 1'h0;
  end
  if (reset) begin
    _T_4204 = 1'h0;
  end
  if (reset) begin
    _T_4201 = 1'h0;
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
    _T_4237 = 3'h0;
  end
  if (reset) begin
    _T_4235 = 3'h0;
  end
  if (reset) begin
    _T_4233 = 3'h0;
  end
  if (reset) begin
    _T_4231 = 3'h0;
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
    _T_4238 = 4'h0;
  end
  if (reset) begin
    _T_4239 = 4'h0;
  end
  if (reset) begin
    _T_4240 = 4'h0;
  end
  if (reset) begin
    _T_4241 = 4'h0;
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
    _T_4180 = 1'h0;
  end
  if (reset) begin
    _T_4177 = 1'h0;
  end
  if (reset) begin
    _T_4174 = 1'h0;
  end
  if (reset) begin
    _T_4171 = 1'h0;
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
    _T_4157 = 1'h0;
  end
  if (reset) begin
    _T_4155 = 1'h0;
  end
  if (reset) begin
    _T_4153 = 1'h0;
  end
  if (reset) begin
    _T_4151 = 1'h0;
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
    _T_4186 = 1'h0;
  end
  if (reset) begin
    _T_4189 = 1'h0;
  end
  if (reset) begin
    _T_4192 = 1'h0;
  end
  if (reset) begin
    _T_4195 = 1'h0;
  end
  if (reset) begin
    _T_4257 = 1'h0;
  end
  if (reset) begin
    _T_4253 = 1'h0;
  end
  if (reset) begin
    _T_4249 = 1'h0;
  end
  if (reset) begin
    _T_4245 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4842 = 1'h0;
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
    end else if (_T_3193) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4210 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4210 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4207 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4207 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4204 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4204 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4201 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4201 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3378) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3401) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3405) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3409) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3439) begin
        if (_T_3444) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3452) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3480) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3526) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3532) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3544) begin
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
    end else if (_T_3202) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3571) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3594) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3598) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3409) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3632) begin
        if (_T_3637) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3645) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3673) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3719) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3725) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3737) begin
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
    end else if (_T_3211) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3764) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3787) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3791) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3409) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3825) begin
        if (_T_3830) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3838) begin
          buf_state_2 <= 3'h4;
        end else if (_T_3866) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3912) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3918) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3930) begin
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
    end else if (_T_3220) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_3957) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_3980) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_3984) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3409) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4018) begin
        if (_T_4023) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4031) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4059) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4105) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4111) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4123) begin
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
      _T_4237 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4237 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4235 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4235 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4233 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4233 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4231 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4231 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2401,_T_2324};
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
      buf_ageQ_2 <= {_T_2299,_T_2222};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2197,_T_2120};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2095,_T_2018};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4238 <= 4'h0;
    end else begin
      _T_4238 <= _GEN_79[3:0];
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4239 <= 4'h0;
    end else begin
      _T_4239 <= _GEN_155[3:0];
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4240 <= 4'h0;
    end else begin
      _T_4240 <= _GEN_231[3:0];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4241 <= 4'h0;
    end else begin
      _T_4241 <= _GEN_307[3:0];
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
    end else if (_T_1838) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1852) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1866) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1880) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1787) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1798) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1809) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1820) begin
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
      _T_4180 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4180 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4177 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4177 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4174 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4174 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4171 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4171 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1230 & _T_4714;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1230 & _T_4715;
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
      buf_rspageQ_0 <= {_T_3023,_T_3012};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3038,_T_3027};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3053,_T_3042};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3068,_T_3057};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4157 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_3957) begin
        _T_4157 <= 1'h0;
      end else if (_T_3980) begin
        _T_4157 <= 1'h0;
      end else begin
        _T_4157 <= _T_3984;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4155 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3764) begin
        _T_4155 <= 1'h0;
      end else if (_T_3787) begin
        _T_4155 <= 1'h0;
      end else begin
        _T_4155 <= _T_3791;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4153 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3571) begin
        _T_4153 <= 1'h0;
      end else if (_T_3594) begin
        _T_4153 <= 1'h0;
      end else begin
        _T_4153 <= _T_3598;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4151 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3378) begin
        _T_4151 <= 1'h0;
      end else if (_T_3401) begin
        _T_4151 <= 1'h0;
      end else begin
        _T_4151 <= _T_3405;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3378) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3401) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3405) begin
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
      end else if (_T_3193) begin
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
      if (_T_3957) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_3980) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_3984) begin
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
      if (_T_3764) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3787) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3791) begin
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
      if (_T_3571) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3594) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3598) begin
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
      end else if (_T_3202) begin
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
      end else if (_T_3211) begin
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
      end else if (_T_3220) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4186 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4186 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4189 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4189 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4192 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4192 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4195 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4195 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4257 <= 1'h0;
    end else begin
      _T_4257 <= _T_4255 & buf_rst_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4253 <= 1'h0;
    end else begin
      _T_4253 <= _T_4251 & buf_rst_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4249 <= 1'h0;
    end else begin
      _T_4249 <= _T_4247 & buf_rst_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4245 <= 1'h0;
    end else begin
      _T_4245 <= _T_4243 & buf_rst_0;
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
      _T_4842 <= 1'h0;
    end else begin
      _T_4842 <= _T_4839 & _T_4372;
    end
  end
endmodule
