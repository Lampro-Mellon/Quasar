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
  reg  _T_4212; // @[Reg.scala 27:20]
  reg  _T_4209; // @[Reg.scala 27:20]
  reg  _T_4206; // @[Reg.scala 27:20]
  reg  _T_4203; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4212,_T_4209,_T_4206,_T_4203}; // @[Cat.scala 29:58]
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
  reg [2:0] _T_4239; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4239}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4237; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4237}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4235; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4235}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4233; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4233}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 532:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2474 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3959 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3982 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_3986 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1774; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 381:13]
  wire  _T_3993 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 471:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3994 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3995 = obuf_merge & _T_3994; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3996 = _T_3993 | _T_3995; // @[el2_lsu_bus_buffer.scala 471:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 375:54]
  wire  _T_3997 = _T_3996 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 374:55]
  wire  _T_3998 = _T_3997 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_280 = _T_3986 & _T_3998; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_3982 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_3959 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2475 = _T_2474 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2476 = buf_ageQ_3[3] & _T_2475; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2470 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3766 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3789 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3793 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3800 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3801 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3802 = obuf_merge & _T_3801; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3803 = _T_3800 | _T_3802; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3804 = _T_3803 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3805 = _T_3804 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_204 = _T_3793 & _T_3805; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3789 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3766 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2471 = _T_2470 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2472 = buf_ageQ_3[2] & _T_2471; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2466 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3573 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3596 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3600 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3607 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3608 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3609 = obuf_merge & _T_3608; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3610 = _T_3607 | _T_3609; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3611 = _T_3610 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3612 = _T_3611 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_128 = _T_3600 & _T_3612; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3596 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3573 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2467 = _T_2466 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2468 = buf_ageQ_3[1] & _T_2467; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2462 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_3380 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3403 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3407 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3414 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 471:48]
  wire  _T_3415 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 471:104]
  wire  _T_3416 = obuf_merge & _T_3415; // @[el2_lsu_bus_buffer.scala 471:91]
  wire  _T_3417 = _T_3414 | _T_3416; // @[el2_lsu_bus_buffer.scala 471:77]
  wire  _T_3418 = _T_3417 & obuf_valid; // @[el2_lsu_bus_buffer.scala 471:135]
  wire  _T_3419 = _T_3418 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 471:148]
  wire  _GEN_52 = _T_3407 & _T_3419; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3403 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3380 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2463 = _T_2462 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 429:104]
  wire  _T_2464 = buf_ageQ_3[0] & _T_2463; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_3 = {_T_2476,_T_2472,_T_2468,_T_2464}; // @[Cat.scala 29:58]
  wire  _T_2575 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2577 = _T_2575 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2569 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2571 = _T_2569 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2563 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2565 = _T_2563 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2577,_T_2571,_T_2565}; // @[Cat.scala 29:58]
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
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2457 = buf_ageQ_2[3] & _T_2475; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2453 = buf_ageQ_2[2] & _T_2471; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2449 = buf_ageQ_2[1] & _T_2467; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2445 = buf_ageQ_2[0] & _T_2463; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_2 = {_T_2457,_T_2453,_T_2449,_T_2445}; // @[Cat.scala 29:58]
  wire  _T_2554 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2556 = _T_2554 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2542 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2544 = _T_2542 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2536 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2538 = _T_2536 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_2 = {_T_2556,1'h0,_T_2544,_T_2538}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2438 = buf_ageQ_1[3] & _T_2475; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2434 = buf_ageQ_1[2] & _T_2471; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2430 = buf_ageQ_1[1] & _T_2467; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2426 = buf_ageQ_1[0] & _T_2463; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_1 = {_T_2438,_T_2434,_T_2430,_T_2426}; // @[Cat.scala 29:58]
  wire  _T_2527 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2529 = _T_2527 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2521 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2523 = _T_2521 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2509 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2511 = _T_2509 & _T_5; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_1 = {_T_2529,_T_2523,1'h0,_T_2511}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 516:60]
  wire  _T_2419 = buf_ageQ_0[3] & _T_2475; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2415 = buf_ageQ_0[2] & _T_2471; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2411 = buf_ageQ_0[1] & _T_2467; // @[el2_lsu_bus_buffer.scala 429:78]
  wire  _T_2407 = buf_ageQ_0[0] & _T_2463; // @[el2_lsu_bus_buffer.scala 429:78]
  wire [3:0] buf_age_0 = {_T_2419,_T_2415,_T_2411,_T_2407}; // @[Cat.scala 29:58]
  wire  _T_2500 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2502 = _T_2500 & _T_26; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2494 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2496 = _T_2494 & _T_19; // @[el2_lsu_bus_buffer.scala 430:106]
  wire  _T_2488 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 430:91]
  wire  _T_2490 = _T_2488 & _T_12; // @[el2_lsu_bus_buffer.scala 430:106]
  wire [3:0] buf_age_younger_0 = {_T_2502,_T_2496,_T_2490,1'h0}; // @[Cat.scala 29:58]
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
  reg [3:0] _T_4240; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_0 = {{28'd0}, _T_4240}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_354 = {{1'd0}, _T_554}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_556 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_559 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4241; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_1 = {{28'd0}, _T_4241}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_355 = {{1'd0}, _T_559}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_561 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_564 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4242; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_2 = {{28'd0}, _T_4242}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
  wire [8:0] _GEN_356 = {{1'd0}, _T_564}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_566 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_569 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4243; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_3 = {{28'd0}, _T_4243}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 533:14]
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
  wire [2:0] _GEN_365 = {{2'd0}, buf_write[3]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4293 = _GEN_365 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4294 = buf_write[3] & _T_4293; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4295 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4296 = _T_4294 & _T_4295; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [2:0] _GEN_366 = {{2'd0}, buf_write[2]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4287 = _GEN_366 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4288 = buf_write[2] & _T_4287; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4289 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4290 = _T_4288 & _T_4289; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [1:0] _T_4297 = _T_4296 + _T_4290; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _GEN_367 = {{2'd0}, buf_write[1]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4281 = _GEN_367 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4282 = buf_write[1] & _T_4281; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4283 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4284 = _T_4282 & _T_4283; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4284}; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _T_4298 = _T_4297 + _GEN_368; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [2:0] _GEN_369 = {{2'd0}, buf_write[0]}; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4275 = _GEN_369 == 3'h2; // @[el2_lsu_bus_buffer.scala 537:79]
  wire  _T_4276 = buf_write[0] & _T_4275; // @[el2_lsu_bus_buffer.scala 537:64]
  wire  _T_4277 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 537:91]
  wire  _T_4278 = _T_4276 & _T_4277; // @[el2_lsu_bus_buffer.scala 537:89]
  wire [2:0] _GEN_370 = {{2'd0}, _T_4278}; // @[el2_lsu_bus_buffer.scala 537:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4298 + _GEN_370; // @[el2_lsu_bus_buffer.scala 537:142]
  wire  _T_942 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:43]
  wire  _T_4315 = _T_4293 & _T_4295; // @[el2_lsu_bus_buffer.scala 538:73]
  wire  _T_4311 = _T_4287 & _T_4289; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [1:0] _T_4316 = _T_4315 + _T_4311; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_4307 = _T_4281 & _T_4283; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [1:0] _GEN_374 = {{1'd0}, _T_4307}; // @[el2_lsu_bus_buffer.scala 538:126]
  wire [2:0] _T_4317 = _T_4316 + _GEN_374; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_4303 = _T_4275 & _T_4277; // @[el2_lsu_bus_buffer.scala 538:73]
  wire [2:0] _GEN_376 = {{2'd0}, _T_4303}; // @[el2_lsu_bus_buffer.scala 538:126]
  wire [3:0] buf_numvld_cmd_any = _T_4317 + _GEN_376; // @[el2_lsu_bus_buffer.scala 538:126]
  wire  _T_943 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:72]
  wire  _T_944 = _T_942 & _T_943; // @[el2_lsu_bus_buffer.scala 293:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 390:54]
  wire  _T_945 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 293:97]
  wire  _T_946 = _T_944 & _T_945; // @[el2_lsu_bus_buffer.scala 293:80]
  wire  _T_948 = _T_946 & _T_843; // @[el2_lsu_bus_buffer.scala 293:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_961 = ~buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 294:31]
  wire  _T_962 = _T_948 & _T_961; // @[el2_lsu_bus_buffer.scala 294:29]
  reg  _T_4182; // @[Reg.scala 27:20]
  reg  _T_4179; // @[Reg.scala 27:20]
  reg  _T_4176; // @[Reg.scala 27:20]
  reg  _T_4173; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4182,_T_4179,_T_4176,_T_4173}; // @[Cat.scala 29:58]
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
  wire  _T_4341 = _GEN_365 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4344 = _T_4341 | _T_4293; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4346 = _T_4344 & _T_4295; // @[el2_lsu_bus_buffer.scala 539:100]
  wire  _T_4334 = _GEN_366 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4337 = _T_4334 | _T_4287; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4339 = _T_4337 & _T_4289; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [1:0] _T_4347 = _T_4346 + _T_4339; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_4327 = _GEN_367 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4330 = _T_4327 | _T_4281; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4332 = _T_4330 & _T_4283; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [1:0] _GEN_383 = {{1'd0}, _T_4332}; // @[el2_lsu_bus_buffer.scala 539:153]
  wire [2:0] _T_4348 = _T_4347 + _GEN_383; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_4320 = _GEN_369 == 3'h1; // @[el2_lsu_bus_buffer.scala 539:64]
  wire  _T_4323 = _T_4320 | _T_4275; // @[el2_lsu_bus_buffer.scala 539:74]
  wire  _T_4325 = _T_4323 & _T_4277; // @[el2_lsu_bus_buffer.scala 539:100]
  wire [2:0] _GEN_386 = {{2'd0}, _T_4325}; // @[el2_lsu_bus_buffer.scala 539:153]
  wire [3:0] buf_numvld_pend_any = _T_4348 + _GEN_386; // @[el2_lsu_bus_buffer.scala 539:153]
  wire  _T_1013 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 299:53]
  wire  _T_1014 = ibuf_byp & _T_1013; // @[el2_lsu_bus_buffer.scala 299:31]
  wire  _T_1015 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 299:64]
  wire  _T_1016 = _T_1015 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 299:84]
  wire  ibuf_buf_byp = _T_1014 & _T_1016; // @[el2_lsu_bus_buffer.scala 299:61]
  wire  _T_1017 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 314:32]
  wire  _T_4637 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4639 = buf_sideeffect[0] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4649 = _T_4637 & _T_4639; // @[Mux.scala 27:72]
  wire  _T_4640 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4642 = buf_sideeffect[1] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4650 = _T_4640 & _T_4642; // @[Mux.scala 27:72]
  wire  _T_4653 = _T_4649 | _T_4650; // @[Mux.scala 27:72]
  wire  _T_4643 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4645 = buf_sideeffect[2] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4651 = _T_4643 & _T_4645; // @[Mux.scala 27:72]
  wire  _T_4654 = _T_4653 | _T_4651; // @[Mux.scala 27:72]
  wire  _T_4646 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 566:68]
  wire  _T_4648 = buf_sideeffect[3] & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 566:99]
  wire  _T_4652 = _T_4646 & _T_4648; // @[Mux.scala 27:72]
  wire  bus_sideeffect_pend = _T_4654 | _T_4652; // @[Mux.scala 27:72]
  wire  _T_1018 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 314:74]
  wire  _T_1019 = ~_T_1018; // @[el2_lsu_bus_buffer.scala 314:52]
  wire  _T_1020 = _T_1017 & _T_1019; // @[el2_lsu_bus_buffer.scala 314:50]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire  _T_1130 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 317:150]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 377:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 378:55]
  wire  _T_4713 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 570:54]
  wire  _T_4714 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 570:75]
  wire  _T_4716 = _T_4713 ? _T_4714 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 570:39]
  wire  bus_cmd_ready = obuf_write ? _T_4716 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 570:23]
  wire  _T_1157 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 318:48]
  wire  _T_1158 = bus_cmd_ready | _T_1157; // @[el2_lsu_bus_buffer.scala 318:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1159 = _T_1158 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 318:60]
  wire  _T_1160 = _T_1020 & _T_1159; // @[el2_lsu_bus_buffer.scala 318:29]
  wire  _T_1161 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 318:77]
  wire  _T_1162 = _T_1160 & _T_1161; // @[el2_lsu_bus_buffer.scala 318:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4661 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4662 = obuf_valid & _T_4661; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4664 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4665 = obuf_merge & _T_4664; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4666 = _T_3414 | _T_4665; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4667 = ~_T_4666; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4668 = _T_4662 & _T_4667; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4705 = _T_4637 & _T_4668; // @[Mux.scala 27:72]
  wire  _T_4673 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4674 = obuf_valid & _T_4673; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4676 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4677 = obuf_merge & _T_4676; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4678 = _T_3607 | _T_4677; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4679 = ~_T_4678; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4680 = _T_4674 & _T_4679; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4706 = _T_4640 & _T_4680; // @[Mux.scala 27:72]
  wire  _T_4709 = _T_4705 | _T_4706; // @[Mux.scala 27:72]
  wire  _T_4685 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4686 = obuf_valid & _T_4685; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4688 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4689 = obuf_merge & _T_4688; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4690 = _T_3800 | _T_4689; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4691 = ~_T_4690; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4692 = _T_4686 & _T_4691; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4707 = _T_4643 & _T_4692; // @[Mux.scala 27:72]
  wire  _T_4710 = _T_4709 | _T_4707; // @[Mux.scala 27:72]
  wire  _T_4697 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 568:56]
  wire  _T_4698 = obuf_valid & _T_4697; // @[el2_lsu_bus_buffer.scala 568:38]
  wire  _T_4700 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 568:126]
  wire  _T_4701 = obuf_merge & _T_4700; // @[el2_lsu_bus_buffer.scala 568:114]
  wire  _T_4702 = _T_3993 | _T_4701; // @[el2_lsu_bus_buffer.scala 568:100]
  wire  _T_4703 = ~_T_4702; // @[el2_lsu_bus_buffer.scala 568:80]
  wire  _T_4704 = _T_4698 & _T_4703; // @[el2_lsu_bus_buffer.scala 568:78]
  wire  _T_4708 = _T_4646 & _T_4704; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4710 | _T_4708; // @[Mux.scala 27:72]
  wire  _T_1165 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 318:118]
  wire  _T_1166 = _T_1162 & _T_1165; // @[el2_lsu_bus_buffer.scala 318:116]
  wire  obuf_wr_en = _T_1166 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 318:142]
  wire  _T_1168 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 320:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 571:39]
  wire  _T_4720 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 573:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 572:39]
  wire  _T_4721 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 573:70]
  wire  _T_4722 = _T_4720 & _T_4721; // @[el2_lsu_bus_buffer.scala 573:52]
  wire  _T_4723 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 573:111]
  wire  bus_cmd_sent = _T_4722 | _T_4723; // @[el2_lsu_bus_buffer.scala 573:89]
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
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 574:37]
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
  wire  _T_1766 = obuf_wr_en | _T_1157; // @[el2_lsu_bus_buffer.scala 375:58]
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
  wire [1:0] _T_1883 = _T_1882 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1884 = _T_1868 ? 2'h2 : _T_1883; // @[Mux.scala 98:16]
  wire [1:0] _T_1885 = _T_1854 ? 2'h1 : _T_1884; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2598 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2599 = buf_rspageQ_0[3] & _T_2598; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2595 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2596 = buf_rspageQ_0[2] & _T_2595; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2592 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2593 = buf_rspageQ_0[1] & _T_2592; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2589 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 431:104]
  wire  _T_2590 = buf_rspageQ_0[0] & _T_2589; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2599,_T_2596,_T_2593,_T_2590}; // @[Cat.scala 29:58]
  wire  _T_1958 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1959 = ~_T_1958; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1961 = _T_1959 & _T_2589; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2614 = buf_rspageQ_1[3] & _T_2598; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2611 = buf_rspageQ_1[2] & _T_2595; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2608 = buf_rspageQ_1[1] & _T_2592; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2605 = buf_rspageQ_1[0] & _T_2589; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2614,_T_2611,_T_2608,_T_2605}; // @[Cat.scala 29:58]
  wire  _T_1962 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1963 = ~_T_1962; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1965 = _T_1963 & _T_2592; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2629 = buf_rspageQ_2[3] & _T_2598; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2626 = buf_rspageQ_2[2] & _T_2595; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2623 = buf_rspageQ_2[1] & _T_2592; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2620 = buf_rspageQ_2[0] & _T_2589; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2629,_T_2626,_T_2623,_T_2620}; // @[Cat.scala 29:58]
  wire  _T_1966 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1967 = ~_T_1966; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1969 = _T_1967 & _T_2595; // @[el2_lsu_bus_buffer.scala 405:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 517:63]
  wire  _T_2644 = buf_rspageQ_3[3] & _T_2598; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2641 = buf_rspageQ_3[2] & _T_2595; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2638 = buf_rspageQ_3[1] & _T_2592; // @[el2_lsu_bus_buffer.scala 431:89]
  wire  _T_2635 = buf_rspageQ_3[0] & _T_2589; // @[el2_lsu_bus_buffer.scala 431:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2644,_T_2641,_T_2638,_T_2635}; // @[Cat.scala 29:58]
  wire  _T_1970 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 405:65]
  wire  _T_1971 = ~_T_1970; // @[el2_lsu_bus_buffer.scala 405:44]
  wire  _T_1973 = _T_1971 & _T_2598; // @[el2_lsu_bus_buffer.scala 405:70]
  wire [3:0] RspPtrDec = {_T_1973,_T_1969,_T_1965,_T_1961}; // @[Cat.scala 29:58]
  wire [1:0] _T_1994 = RspPtrDec[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_1995 = RspPtrDec[1] ? 2'h1 : _T_1994; // @[Mux.scala 47:69]
  wire [1:0] RspPtr = RspPtrDec[0] ? 2'h0 : _T_1995; // @[Mux.scala 47:69]
  wire  _T_3384 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:77]
  wire  _T_3385 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_3386 = _T_3384 & _T_3385; // @[el2_lsu_bus_buffer.scala 460:95]
  wire  _T_3387 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3388 = _T_3386 & _T_3387; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3389 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:144]
  wire  _T_3390 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3391 = _T_3389 & _T_3390; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3392 = _T_3388 | _T_3391; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3393 = _T_766 & _T_3392; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3394 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3395 = ibuf_drain_vld & _T_3394; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3396 = _T_3393 | _T_3395; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3406 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 467:46]
  wire  _T_3441 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 575:38]
  wire  _T_3486 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3487 = bus_rsp_write & _T_3486; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3488 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 486:46]
  reg  _T_4159; // @[Reg.scala 27:20]
  reg  _T_4157; // @[Reg.scala 27:20]
  reg  _T_4155; // @[Reg.scala 27:20]
  reg  _T_4153; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4159,_T_4157,_T_4155,_T_4153}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_387 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3490 = io_lsu_axi_rid == _GEN_387; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3491 = buf_ldfwd[0] & _T_3490; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3492 = _T_3488 | _T_3491; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3493 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3496 = _T_3493 & _T_1130; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3497 = _T_3496 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_388 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3498 = io_lsu_axi_rid == _GEN_388; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3499 = _T_3497 & _T_3498; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3500 = _T_3492 | _T_3499; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3501 = bus_rsp_read & _T_3500; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3502 = _T_3487 | _T_3501; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_42 = _T_3441 & _T_3502; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3407 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3403 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3380 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3528 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3538 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 500:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_390 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3540 = io_lsu_axi_rid == _GEN_390; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3541 = _T_3538[0] & _T_3540; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3542 = _T_3498 | _T_3541; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3543 = bus_rsp_read & _T_3542; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_36 = _T_3528 & _T_3543; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3441 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3407 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3403 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3380 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3420 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3421 = _T_3420 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3546 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3549 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3550 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3551 = buf_dual_0 & _T_3550; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3552 = _T_3549 | _T_3551; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3553 = _T_3552 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3554 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3546 ? _T_3553 : _T_3554; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3528 ? _T_3421 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3441 ? _T_3421 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3407 ? _T_3421 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3403 ? _T_3406 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3380 ? _T_3396 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_1997 = _T_1779 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_1998 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2001 = _T_2462 & _T_4277; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2002 = _T_1998 | _T_2001; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2003 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 425:23]
  wire  _T_2005 = _T_2003 & _T_3384; // @[el2_lsu_bus_buffer.scala 425:41]
  wire  _T_2007 = _T_2005 & _T_1782; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2009 = _T_2007 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2010 = _T_2002 | _T_2009; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2011 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 426:17]
  wire  _T_2012 = _T_2011 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 426:35]
  wire  _T_2014 = _T_2012 & _T_1785; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2016 = _T_2014 & _T_1782; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2017 = _T_2010 | _T_2016; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2018 = _T_1997 & _T_2017; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2020 = _T_2018 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2023 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2026 = _T_2466 & _T_4283; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2027 = _T_2023 | _T_2026; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2034 = _T_2007 & _T_1791; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2035 = _T_2027 | _T_2034; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2041 = _T_2014 & _T_1793; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2042 = _T_2035 | _T_2041; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2043 = _T_1997 & _T_2042; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2045 = _T_2043 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2048 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2051 = _T_2470 & _T_4289; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2052 = _T_2048 | _T_2051; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2059 = _T_2007 & _T_1802; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2060 = _T_2052 | _T_2059; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2066 = _T_2014 & _T_1804; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2067 = _T_2060 | _T_2066; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2068 = _T_1997 & _T_2067; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2070 = _T_2068 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2073 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 424:20]
  wire  _T_2076 = _T_2474 & _T_4295; // @[el2_lsu_bus_buffer.scala 424:57]
  wire  _T_2077 = _T_2073 | _T_2076; // @[el2_lsu_bus_buffer.scala 424:31]
  wire  _T_2084 = _T_2007 & _T_1813; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2085 = _T_2077 | _T_2084; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2091 = _T_2014 & _T_1815; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2092 = _T_2085 | _T_2091; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2093 = _T_1997 & _T_2092; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2095 = _T_2093 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2097 = {_T_2095,_T_2070,_T_2045}; // @[Cat.scala 29:58]
  wire  _T_3580 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3581 = _T_3386 & _T_3580; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3583 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3584 = _T_3389 & _T_3583; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3585 = _T_3581 | _T_3584; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3586 = _T_766 & _T_3585; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3587 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3588 = ibuf_drain_vld & _T_3587; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3589 = _T_3586 | _T_3588; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3634 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3679 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3680 = bus_rsp_write & _T_3679; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3681 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_391 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3683 = io_lsu_axi_rid == _GEN_391; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3684 = buf_ldfwd[1] & _T_3683; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3685 = _T_3681 | _T_3684; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3686 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3688 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_3689 = _T_3686 & _T_3688; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3690 = _T_3689 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_392 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3691 = io_lsu_axi_rid == _GEN_392; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3692 = _T_3690 & _T_3691; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3693 = _T_3685 | _T_3692; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3694 = bus_rsp_read & _T_3693; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3695 = _T_3680 | _T_3694; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_118 = _T_3634 & _T_3695; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3600 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3596 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3573 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3721 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3731 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_394 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3733 = io_lsu_axi_rid == _GEN_394; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3734 = _T_3731[0] & _T_3733; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3735 = _T_3691 | _T_3734; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3736 = bus_rsp_read & _T_3735; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_112 = _T_3721 & _T_3736; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3634 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3600 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3596 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3573 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3613 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3614 = _T_3613 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3739 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3742 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3743 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3744 = buf_dual_1 & _T_3743; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3745 = _T_3742 | _T_3744; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3746 = _T_3745 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3747 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3739 ? _T_3746 : _T_3747; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3721 ? _T_3614 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3634 ? _T_3614 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3600 ? _T_3614 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3596 ? _T_3406 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3573 ? _T_3589 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2099 = _T_1790 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2109 = _T_2005 & _T_1793; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2111 = _T_2109 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2112 = _T_2002 | _T_2111; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2116 = _T_2012 & _T_1796; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2118 = _T_2116 & _T_1782; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2119 = _T_2112 | _T_2118; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2120 = _T_2099 & _T_2119; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2122 = _T_2120 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2136 = _T_2109 & _T_1791; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2137 = _T_2027 | _T_2136; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2143 = _T_2116 & _T_1793; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2144 = _T_2137 | _T_2143; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2145 = _T_2099 & _T_2144; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2147 = _T_2145 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2161 = _T_2109 & _T_1802; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2162 = _T_2052 | _T_2161; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2168 = _T_2116 & _T_1804; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2169 = _T_2162 | _T_2168; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2170 = _T_2099 & _T_2169; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2172 = _T_2170 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2186 = _T_2109 & _T_1813; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2187 = _T_2077 | _T_2186; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2193 = _T_2116 & _T_1815; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2194 = _T_2187 | _T_2193; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2195 = _T_2099 & _T_2194; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2197 = _T_2195 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2199 = {_T_2197,_T_2172,_T_2147}; // @[Cat.scala 29:58]
  wire  _T_3773 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3774 = _T_3386 & _T_3773; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3776 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3777 = _T_3389 & _T_3776; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3778 = _T_3774 | _T_3777; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3779 = _T_766 & _T_3778; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3780 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3781 = ibuf_drain_vld & _T_3780; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3782 = _T_3779 | _T_3781; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_3827 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3872 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3873 = bus_rsp_write & _T_3872; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_3874 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_395 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3876 = io_lsu_axi_rid == _GEN_395; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_3877 = buf_ldfwd[2] & _T_3876; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_3878 = _T_3874 | _T_3877; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_3879 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_3881 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_3882 = _T_3879 & _T_3881; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_3883 = _T_3882 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_396 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3884 = io_lsu_axi_rid == _GEN_396; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_3885 = _T_3883 & _T_3884; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_3886 = _T_3878 | _T_3885; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_3887 = bus_rsp_read & _T_3886; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_3888 = _T_3873 | _T_3887; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_194 = _T_3827 & _T_3888; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3793 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3789 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3766 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_3914 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_3924 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_398 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3926 = io_lsu_axi_rid == _GEN_398; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_3927 = _T_3924[0] & _T_3926; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_3928 = _T_3884 | _T_3927; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_3929 = bus_rsp_read & _T_3928; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_188 = _T_3914 & _T_3929; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3827 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3793 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3789 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3766 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3806 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_3807 = _T_3806 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_3932 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3935 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_3936 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_3937 = buf_dual_2 & _T_3936; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_3938 = _T_3935 | _T_3937; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_3939 = _T_3938 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_3940 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_3932 ? _T_3939 : _T_3940; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_3914 ? _T_3807 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3827 ? _T_3807 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3793 ? _T_3807 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3789 ? _T_3406 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3766 ? _T_3782 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2201 = _T_1801 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2211 = _T_2005 & _T_1804; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2213 = _T_2211 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2214 = _T_2002 | _T_2213; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2218 = _T_2012 & _T_1807; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2220 = _T_2218 & _T_1782; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2221 = _T_2214 | _T_2220; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2222 = _T_2201 & _T_2221; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2224 = _T_2222 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2238 = _T_2211 & _T_1791; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2239 = _T_2027 | _T_2238; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2245 = _T_2218 & _T_1793; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2246 = _T_2239 | _T_2245; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2247 = _T_2201 & _T_2246; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2249 = _T_2247 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2263 = _T_2211 & _T_1802; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2264 = _T_2052 | _T_2263; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2270 = _T_2218 & _T_1804; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2271 = _T_2264 | _T_2270; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2272 = _T_2201 & _T_2271; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2274 = _T_2272 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2288 = _T_2211 & _T_1813; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2289 = _T_2077 | _T_2288; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2295 = _T_2218 & _T_1815; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2296 = _T_2289 | _T_2295; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2297 = _T_2201 & _T_2296; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2299 = _T_2297 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2301 = {_T_2299,_T_2274,_T_2249}; // @[Cat.scala 29:58]
  wire  _T_3966 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 460:117]
  wire  _T_3967 = _T_3386 & _T_3966; // @[el2_lsu_bus_buffer.scala 460:112]
  wire  _T_3969 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 460:166]
  wire  _T_3970 = _T_3389 & _T_3969; // @[el2_lsu_bus_buffer.scala 460:161]
  wire  _T_3971 = _T_3967 | _T_3970; // @[el2_lsu_bus_buffer.scala 460:132]
  wire  _T_3972 = _T_766 & _T_3971; // @[el2_lsu_bus_buffer.scala 460:63]
  wire  _T_3973 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 460:206]
  wire  _T_3974 = ibuf_drain_vld & _T_3973; // @[el2_lsu_bus_buffer.scala 460:201]
  wire  _T_3975 = _T_3972 | _T_3974; // @[el2_lsu_bus_buffer.scala 460:183]
  wire  _T_4020 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4065 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_4066 = bus_rsp_write & _T_4065; // @[el2_lsu_bus_buffer.scala 485:52]
  wire  _T_4067 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 486:46]
  wire [2:0] _GEN_399 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_4069 = io_lsu_axi_rid == _GEN_399; // @[el2_lsu_bus_buffer.scala 487:47]
  wire  _T_4070 = buf_ldfwd[3] & _T_4069; // @[el2_lsu_bus_buffer.scala 487:27]
  wire  _T_4071 = _T_4067 | _T_4070; // @[el2_lsu_bus_buffer.scala 486:77]
  wire  _T_4072 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 488:26]
  wire  _T_4074 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 488:44]
  wire  _T_4075 = _T_4072 & _T_4074; // @[el2_lsu_bus_buffer.scala 488:42]
  wire  _T_4076 = _T_4075 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 488:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_400 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_4077 = io_lsu_axi_rid == _GEN_400; // @[el2_lsu_bus_buffer.scala 488:94]
  wire  _T_4078 = _T_4076 & _T_4077; // @[el2_lsu_bus_buffer.scala 488:74]
  wire  _T_4079 = _T_4071 | _T_4078; // @[el2_lsu_bus_buffer.scala 487:71]
  wire  _T_4080 = bus_rsp_read & _T_4079; // @[el2_lsu_bus_buffer.scala 486:25]
  wire  _T_4081 = _T_4066 | _T_4080; // @[el2_lsu_bus_buffer.scala 485:105]
  wire  _GEN_270 = _T_4020 & _T_4081; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_3986 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_3982 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_3959 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4107 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4117 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 500:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 500:58]
  wire [2:0] _GEN_402 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_4119 = io_lsu_axi_rid == _GEN_402; // @[el2_lsu_bus_buffer.scala 500:58]
  wire  _T_4120 = _T_4117[0] & _T_4119; // @[el2_lsu_bus_buffer.scala 500:38]
  wire  _T_4121 = _T_4077 | _T_4120; // @[el2_lsu_bus_buffer.scala 499:95]
  wire  _T_4122 = bus_rsp_read & _T_4121; // @[el2_lsu_bus_buffer.scala 499:45]
  wire  _GEN_264 = _T_4107 & _T_4122; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4020 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_3986 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_3982 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_3959 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_3999 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 473:49]
  wire  _T_4000 = _T_3999 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:70]
  wire  _T_4125 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4128 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 505:37]
  wire  _T_4129 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 505:98]
  wire  _T_4130 = buf_dual_3 & _T_4129; // @[el2_lsu_bus_buffer.scala 505:80]
  wire  _T_4131 = _T_4128 | _T_4130; // @[el2_lsu_bus_buffer.scala 505:65]
  wire  _T_4132 = _T_4131 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 505:112]
  wire  _T_4133 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4125 ? _T_4132 : _T_4133; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4107 ? _T_4000 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4020 ? _T_4000 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_3986 ? _T_4000 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_3982 ? _T_3406 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_3959 ? _T_3975 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2303 = _T_1812 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 423:94]
  wire  _T_2313 = _T_2005 & _T_1815; // @[el2_lsu_bus_buffer.scala 425:71]
  wire  _T_2315 = _T_2313 & _T_1780; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2316 = _T_2002 | _T_2315; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2320 = _T_2012 & _T_1818; // @[el2_lsu_bus_buffer.scala 426:52]
  wire  _T_2322 = _T_2320 & _T_1782; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2323 = _T_2316 | _T_2322; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2324 = _T_2303 & _T_2323; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2326 = _T_2324 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2340 = _T_2313 & _T_1791; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2341 = _T_2027 | _T_2340; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2347 = _T_2320 & _T_1793; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2348 = _T_2341 | _T_2347; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2349 = _T_2303 & _T_2348; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2351 = _T_2349 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2365 = _T_2313 & _T_1802; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2366 = _T_2052 | _T_2365; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2372 = _T_2320 & _T_1804; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2373 = _T_2366 | _T_2372; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2374 = _T_2303 & _T_2373; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2376 = _T_2374 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire  _T_2390 = _T_2313 & _T_1813; // @[el2_lsu_bus_buffer.scala 425:92]
  wire  _T_2391 = _T_2077 | _T_2390; // @[el2_lsu_bus_buffer.scala 424:86]
  wire  _T_2397 = _T_2320 & _T_1815; // @[el2_lsu_bus_buffer.scala 426:73]
  wire  _T_2398 = _T_2391 | _T_2397; // @[el2_lsu_bus_buffer.scala 425:114]
  wire  _T_2399 = _T_2303 & _T_2398; // @[el2_lsu_bus_buffer.scala 423:113]
  wire  _T_2401 = _T_2399 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 426:97]
  wire [2:0] _T_2403 = {_T_2401,_T_2376,_T_2351}; // @[Cat.scala 29:58]
  wire  _T_2651 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2652 = _T_1779 | _T_2651; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2653 = ~_T_2652; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2661 = _T_2653 | _T_2009; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2668 = _T_2661 | _T_2016; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2669 = _T_1997 & _T_2668; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2673 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2674 = _T_1790 | _T_2673; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2675 = ~_T_2674; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2683 = _T_2675 | _T_2034; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2690 = _T_2683 | _T_2041; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2691 = _T_1997 & _T_2690; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2695 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2696 = _T_1801 | _T_2695; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2697 = ~_T_2696; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2705 = _T_2697 | _T_2059; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2712 = _T_2705 | _T_2066; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2713 = _T_1997 & _T_2712; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2717 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 434:49]
  wire  _T_2718 = _T_1812 | _T_2717; // @[el2_lsu_bus_buffer.scala 434:34]
  wire  _T_2719 = ~_T_2718; // @[el2_lsu_bus_buffer.scala 434:8]
  wire  _T_2727 = _T_2719 | _T_2084; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2734 = _T_2727 | _T_2091; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2735 = _T_1997 & _T_2734; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_0 = {_T_2735,_T_2713,_T_2691,_T_2669}; // @[Cat.scala 29:58]
  wire  _T_2752 = _T_2653 | _T_2111; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2759 = _T_2752 | _T_2118; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2760 = _T_2099 & _T_2759; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2774 = _T_2675 | _T_2136; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2781 = _T_2774 | _T_2143; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2782 = _T_2099 & _T_2781; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2796 = _T_2697 | _T_2161; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2803 = _T_2796 | _T_2168; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2804 = _T_2099 & _T_2803; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2818 = _T_2719 | _T_2186; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2825 = _T_2818 | _T_2193; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2826 = _T_2099 & _T_2825; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_1 = {_T_2826,_T_2804,_T_2782,_T_2760}; // @[Cat.scala 29:58]
  wire  _T_2843 = _T_2653 | _T_2213; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2850 = _T_2843 | _T_2220; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2851 = _T_2201 & _T_2850; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2865 = _T_2675 | _T_2238; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2872 = _T_2865 | _T_2245; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2873 = _T_2201 & _T_2872; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2887 = _T_2697 | _T_2263; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2894 = _T_2887 | _T_2270; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2895 = _T_2201 & _T_2894; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2909 = _T_2719 | _T_2288; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2916 = _T_2909 | _T_2295; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2917 = _T_2201 & _T_2916; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_2 = {_T_2917,_T_2895,_T_2873,_T_2851}; // @[Cat.scala 29:58]
  wire  _T_2934 = _T_2653 | _T_2315; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2941 = _T_2934 | _T_2322; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2942 = _T_2303 & _T_2941; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2956 = _T_2675 | _T_2340; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2963 = _T_2956 | _T_2347; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2964 = _T_2303 & _T_2963; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_2978 = _T_2697 | _T_2365; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_2985 = _T_2978 | _T_2372; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_2986 = _T_2303 & _T_2985; // @[el2_lsu_bus_buffer.scala 433:114]
  wire  _T_3000 = _T_2719 | _T_2390; // @[el2_lsu_bus_buffer.scala 434:61]
  wire  _T_3007 = _T_3000 | _T_2397; // @[el2_lsu_bus_buffer.scala 435:112]
  wire  _T_3008 = _T_2303 & _T_3007; // @[el2_lsu_bus_buffer.scala 433:114]
  wire [3:0] buf_rspage_set_3 = {_T_3008,_T_2986,_T_2964,_T_2942}; // @[Cat.scala 29:58]
  wire  _T_3093 = _T_2717 | _T_1812; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3094 = ~_T_3093; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3095 = buf_rspageQ_0[3] & _T_3094; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3087 = _T_2695 | _T_1801; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3088 = ~_T_3087; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3089 = buf_rspageQ_0[2] & _T_3088; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3081 = _T_2673 | _T_1790; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3082 = ~_T_3081; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3083 = buf_rspageQ_0[1] & _T_3082; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3075 = _T_2651 | _T_1779; // @[el2_lsu_bus_buffer.scala 438:112]
  wire  _T_3076 = ~_T_3075; // @[el2_lsu_bus_buffer.scala 438:86]
  wire  _T_3077 = buf_rspageQ_0[0] & _T_3076; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_0 = {_T_3095,_T_3089,_T_3083,_T_3077}; // @[Cat.scala 29:58]
  wire  _T_3014 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3017 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3020 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3023 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3025 = {_T_3023,_T_3020,_T_3017}; // @[Cat.scala 29:58]
  wire  _T_3122 = buf_rspageQ_1[3] & _T_3094; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3116 = buf_rspageQ_1[2] & _T_3088; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3110 = buf_rspageQ_1[1] & _T_3082; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3104 = buf_rspageQ_1[0] & _T_3076; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_1 = {_T_3122,_T_3116,_T_3110,_T_3104}; // @[Cat.scala 29:58]
  wire  _T_3029 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3032 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3035 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3038 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3040 = {_T_3038,_T_3035,_T_3032}; // @[Cat.scala 29:58]
  wire  _T_3149 = buf_rspageQ_2[3] & _T_3094; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3143 = buf_rspageQ_2[2] & _T_3088; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3137 = buf_rspageQ_2[1] & _T_3082; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3131 = buf_rspageQ_2[0] & _T_3076; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_2 = {_T_3149,_T_3143,_T_3137,_T_3131}; // @[Cat.scala 29:58]
  wire  _T_3044 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3047 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3050 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3053 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3055 = {_T_3053,_T_3050,_T_3047}; // @[Cat.scala 29:58]
  wire  _T_3176 = buf_rspageQ_3[3] & _T_3094; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3170 = buf_rspageQ_3[2] & _T_3088; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3164 = buf_rspageQ_3[1] & _T_3082; // @[el2_lsu_bus_buffer.scala 438:84]
  wire  _T_3158 = buf_rspageQ_3[0] & _T_3076; // @[el2_lsu_bus_buffer.scala 438:84]
  wire [3:0] buf_rspage_3 = {_T_3176,_T_3170,_T_3164,_T_3158}; // @[Cat.scala 29:58]
  wire  _T_3059 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3062 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3065 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire  _T_3068 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 437:90]
  wire [2:0] _T_3070 = {_T_3068,_T_3065,_T_3062}; // @[Cat.scala 29:58]
  wire  _T_3181 = ibuf_drain_vld & _T_1780; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3183 = ibuf_drain_vld & _T_1791; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3185 = ibuf_drain_vld & _T_1802; // @[el2_lsu_bus_buffer.scala 443:65]
  wire  _T_3187 = ibuf_drain_vld & _T_1813; // @[el2_lsu_bus_buffer.scala 443:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3187,_T_3185,_T_3183,_T_3181}; // @[Cat.scala 29:58]
  wire  _T_3195 = _T_3389 & _T_1785; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3198 = _T_3195 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3199 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3198; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3204 = _T_3389 & _T_1796; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3207 = _T_3204 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3208 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3207; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3213 = _T_3389 & _T_1807; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3216 = _T_3213 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3217 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3216; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3222 = _T_3389 & _T_1818; // @[el2_lsu_bus_buffer.scala 444:123]
  wire [3:0] _T_3225 = _T_3222 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 444:96]
  wire [3:0] _T_3226 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3225; // @[el2_lsu_bus_buffer.scala 444:48]
  wire  _T_3252 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3254 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3256 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire  _T_3258 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 446:47]
  wire [3:0] buf_dual_in = {_T_3258,_T_3256,_T_3254,_T_3252}; // @[Cat.scala 29:58]
  wire  _T_3263 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3265 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3267 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire  _T_3269 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 447:49]
  wire [3:0] buf_samedw_in = {_T_3269,_T_3267,_T_3265,_T_3263}; // @[Cat.scala 29:58]
  wire  _T_3274 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 448:86]
  wire  _T_3275 = ibuf_drainvec_vld[0] ? _T_3274 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3278 = ibuf_drainvec_vld[1] ? _T_3274 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3281 = ibuf_drainvec_vld[2] ? _T_3274 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire  _T_3284 = ibuf_drainvec_vld[3] ? _T_3274 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 448:50]
  wire [3:0] buf_nomerge_in = {_T_3284,_T_3281,_T_3278,_T_3275}; // @[Cat.scala 29:58]
  wire  _T_3292 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3195; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3297 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3204; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3302 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3213; // @[el2_lsu_bus_buffer.scala 449:49]
  wire  _T_3307 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3222; // @[el2_lsu_bus_buffer.scala 449:49]
  wire [3:0] buf_dualhi_in = {_T_3307,_T_3302,_T_3297,_T_3292}; // @[Cat.scala 29:58]
  wire  _T_3336 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3338 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3340 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire  _T_3342 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 451:53]
  wire [3:0] buf_sideeffect_in = {_T_3342,_T_3340,_T_3338,_T_3336}; // @[Cat.scala 29:58]
  wire  _T_3347 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3349 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3351 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire  _T_3353 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 452:49]
  wire [3:0] buf_unsign_in = {_T_3353,_T_3351,_T_3349,_T_3347}; // @[Cat.scala 29:58]
  wire  _T_3370 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3372 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3374 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire  _T_3376 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 454:48]
  wire [3:0] buf_write_in = {_T_3376,_T_3374,_T_3372,_T_3370}; // @[Cat.scala 29:58]
  wire [31:0] _T_3402 = _T_3395 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3409 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 470:89]
  wire  _T_3411 = _T_3409 & _T_1277; // @[el2_lsu_bus_buffer.scala 470:104]
  wire  _T_3424 = buf_state_en_0 & _T_1130; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3425 = _T_3424 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3427 = _T_3425 & _T_1259; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3430 = _T_3420 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3431 = _T_3430 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_4729 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 579:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4729; // @[el2_lsu_bus_buffer.scala 579:38]
  wire  _T_3434 = _T_3430 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3439 = buf_addr_0[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3509 = bus_rsp_read_error & _T_3488; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3511 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3513 = _T_3511 & _T_3490; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3514 = _T_3509 | _T_3513; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4729; // @[el2_lsu_bus_buffer.scala 578:40]
  wire  _T_3517 = bus_rsp_write_error & _T_3486; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3518 = _T_3514 | _T_3517; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3519 = _T_3420 & _T_3518; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_46 = _T_3441 & _T_3519; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3407 ? _T_3434 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3403 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3380 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire [31:0] _T_3440 = buf_error_en_0 ? io_lsu_axi_rdata[31:0] : _T_3439; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3444 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 482:73]
  wire  _T_3445 = buf_write[0] & _T_3444; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3446 = io_dec_tlu_force_halt | _T_3445; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3448 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3449 = buf_dual_0 & _T_3448; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3452 = _T_3449 & _T_1130; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3453 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3454 = _T_3452 & _T_3453; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_4354 = _T_2598 | _T_2595; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  _T_4355 = _T_4354 | _T_2592; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  any_done_wait_state = _T_4355 | _T_2589; // @[el2_lsu_bus_buffer.scala 540:93]
  wire  _T_3456 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3462 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3464 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3466 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3468 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3470 = _T_3462 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3471 = _T_3464 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3472 = _T_3466 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3473 = _T_3468 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3474 = _T_3470 | _T_3471; // @[Mux.scala 27:72]
  wire  _T_3475 = _T_3474 | _T_3472; // @[Mux.scala 27:72]
  wire  _T_3476 = _T_3475 | _T_3473; // @[Mux.scala 27:72]
  wire  _T_3478 = _T_3452 & _T_3476; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3479 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3480 = _T_3478 & _T_3479; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3481 = _T_3480 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3482 = _T_3456 | _T_3481; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3505 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3506 = _T_3505 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3520 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3521 = buf_state_en_0 & _T_3520; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3527 = _T_3521 ? _T_3439 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3533 = buf_ldfwd[0] | _T_3538[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3534 = _T_3533 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_29 = _T_3554 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3546 ? 1'h0 : _T_3554; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3546 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3528 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3528 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3441 & _T_3506; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_47 = _T_3441 ? _T_3527 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3441 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3441 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3407 ? _T_3427 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3407 ? _T_3431 : _GEN_45; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_60 = _T_3407 ? _T_3440 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3407 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3403 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3403 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_72 = _T_3403 ? 32'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3403 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3380 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_79 = _T_3380 ? _T_3402 : _GEN_72; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3380 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3380 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire [31:0] _T_3595 = _T_3588 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3617 = buf_state_en_1 & _T_3688; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3618 = _T_3617 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3620 = _T_3618 & _T_1259; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3623 = _T_3613 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3624 = _T_3623 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_3627 = _T_3623 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3632 = buf_addr_1[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3702 = bus_rsp_read_error & _T_3681; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3704 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3706 = _T_3704 & _T_3683; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3707 = _T_3702 | _T_3706; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_3710 = bus_rsp_write_error & _T_3679; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3711 = _T_3707 | _T_3710; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3712 = _T_3613 & _T_3711; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_122 = _T_3634 & _T_3712; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3600 ? _T_3627 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3596 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3573 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire [31:0] _T_3633 = buf_error_en_1 ? io_lsu_axi_rdata[31:0] : _T_3632; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3638 = buf_write[1] & _T_3444; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3639 = io_dec_tlu_force_halt | _T_3638; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3641 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3642 = buf_dual_1 & _T_3641; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3645 = _T_3642 & _T_3688; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3646 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3647 = _T_3645 & _T_3646; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_3649 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3655 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3657 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3659 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3661 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3663 = _T_3655 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3664 = _T_3657 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3665 = _T_3659 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3666 = _T_3661 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3667 = _T_3663 | _T_3664; // @[Mux.scala 27:72]
  wire  _T_3668 = _T_3667 | _T_3665; // @[Mux.scala 27:72]
  wire  _T_3669 = _T_3668 | _T_3666; // @[Mux.scala 27:72]
  wire  _T_3671 = _T_3645 & _T_3669; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3672 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3673 = _T_3671 & _T_3672; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3674 = _T_3673 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3675 = _T_3649 | _T_3674; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3698 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3699 = _T_3698 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3713 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3714 = buf_state_en_1 & _T_3713; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3720 = _T_3714 ? _T_3632 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3726 = buf_ldfwd[1] | _T_3731[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3727 = _T_3726 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_105 = _T_3747 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3739 ? 1'h0 : _T_3747; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3739 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3721 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3721 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3634 & _T_3699; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_123 = _T_3634 ? _T_3720 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3634 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3634 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3600 ? _T_3620 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3600 ? _T_3624 : _GEN_121; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_136 = _T_3600 ? _T_3633 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3600 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3596 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3596 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_148 = _T_3596 ? 32'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3596 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3573 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_155 = _T_3573 ? _T_3595 : _GEN_148; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3573 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3573 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire [31:0] _T_3788 = _T_3781 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_3810 = buf_state_en_2 & _T_3881; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_3811 = _T_3810 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_3813 = _T_3811 & _T_1259; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_3816 = _T_3806 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_3817 = _T_3816 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_3820 = _T_3816 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_3825 = buf_addr_2[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_3895 = bus_rsp_read_error & _T_3874; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_3897 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_3899 = _T_3897 & _T_3876; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_3900 = _T_3895 | _T_3899; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_3903 = bus_rsp_write_error & _T_3872; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_3904 = _T_3900 | _T_3903; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_3905 = _T_3806 & _T_3904; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_198 = _T_3827 & _T_3905; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3793 ? _T_3820 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3789 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3766 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire [31:0] _T_3826 = buf_error_en_2 ? io_lsu_axi_rdata[31:0] : _T_3825; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_3831 = buf_write[2] & _T_3444; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_3832 = io_dec_tlu_force_halt | _T_3831; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_3834 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_3835 = buf_dual_2 & _T_3834; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_3838 = _T_3835 & _T_3881; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3839 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_3840 = _T_3838 & _T_3839; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_3842 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_3848 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3850 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3852 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3854 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3856 = _T_3848 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3857 = _T_3850 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3858 = _T_3852 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3859 = _T_3854 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3860 = _T_3856 | _T_3857; // @[Mux.scala 27:72]
  wire  _T_3861 = _T_3860 | _T_3858; // @[Mux.scala 27:72]
  wire  _T_3862 = _T_3861 | _T_3859; // @[Mux.scala 27:72]
  wire  _T_3864 = _T_3838 & _T_3862; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_3865 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_3866 = _T_3864 & _T_3865; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_3867 = _T_3866 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_3868 = _T_3842 | _T_3867; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_3891 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_3892 = _T_3891 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_3906 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_3907 = buf_state_en_2 & _T_3906; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_3913 = _T_3907 ? _T_3825 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_3919 = buf_ldfwd[2] | _T_3924[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_3920 = _T_3919 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_181 = _T_3940 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_3932 ? 1'h0 : _T_3940; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_3932 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_3914 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_3914 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3827 & _T_3892; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_199 = _T_3827 ? _T_3913 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3827 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3827 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3793 ? _T_3813 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3793 ? _T_3817 : _GEN_197; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_212 = _T_3793 ? _T_3826 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3793 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3789 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3789 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_224 = _T_3789 ? 32'h0 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3789 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3766 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_231 = _T_3766 ? _T_3788 : _GEN_224; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3766 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3766 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire [31:0] _T_3981 = _T_3974 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 463:30]
  wire  _T_4003 = buf_state_en_3 & _T_4074; // @[el2_lsu_bus_buffer.scala 475:44]
  wire  _T_4004 = _T_4003 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 475:60]
  wire  _T_4006 = _T_4004 & _T_1259; // @[el2_lsu_bus_buffer.scala 475:74]
  wire  _T_4009 = _T_3999 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 477:67]
  wire  _T_4010 = _T_4009 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 477:81]
  wire  _T_4013 = _T_4009 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 478:82]
  wire [31:0] _T_4018 = buf_addr_3[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 479:73]
  wire  _T_4088 = bus_rsp_read_error & _T_4067; // @[el2_lsu_bus_buffer.scala 492:91]
  wire  _T_4090 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 493:31]
  wire  _T_4092 = _T_4090 & _T_4069; // @[el2_lsu_bus_buffer.scala 493:46]
  wire  _T_4093 = _T_4088 | _T_4092; // @[el2_lsu_bus_buffer.scala 492:143]
  wire  _T_4096 = bus_rsp_write_error & _T_4065; // @[el2_lsu_bus_buffer.scala 494:53]
  wire  _T_4097 = _T_4093 | _T_4096; // @[el2_lsu_bus_buffer.scala 493:88]
  wire  _T_4098 = _T_3999 & _T_4097; // @[el2_lsu_bus_buffer.scala 492:68]
  wire  _GEN_274 = _T_4020 & _T_4098; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_3986 ? _T_4013 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_3982 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_3959 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire [31:0] _T_4019 = buf_error_en_3 ? io_lsu_axi_rdata[31:0] : _T_4018; // @[el2_lsu_bus_buffer.scala 479:30]
  wire  _T_4024 = buf_write[3] & _T_3444; // @[el2_lsu_bus_buffer.scala 482:71]
  wire  _T_4025 = io_dec_tlu_force_halt | _T_4024; // @[el2_lsu_bus_buffer.scala 482:55]
  wire  _T_4027 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 483:30]
  wire  _T_4028 = buf_dual_3 & _T_4027; // @[el2_lsu_bus_buffer.scala 483:28]
  wire  _T_4031 = _T_4028 & _T_4074; // @[el2_lsu_bus_buffer.scala 483:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 483:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_4032 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 483:90]
  wire  _T_4033 = _T_4031 & _T_4032; // @[el2_lsu_bus_buffer.scala 483:61]
  wire  _T_4035 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:31]
  wire  _T_4041 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4043 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4045 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4047 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4049 = _T_4041 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4050 = _T_4043 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4051 = _T_4045 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4052 = _T_4047 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4053 = _T_4049 | _T_4050; // @[Mux.scala 27:72]
  wire  _T_4054 = _T_4053 | _T_4051; // @[Mux.scala 27:72]
  wire  _T_4055 = _T_4054 | _T_4052; // @[Mux.scala 27:72]
  wire  _T_4057 = _T_4031 & _T_4055; // @[el2_lsu_bus_buffer.scala 484:101]
  wire  _T_4058 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 484:167]
  wire  _T_4059 = _T_4057 & _T_4058; // @[el2_lsu_bus_buffer.scala 484:138]
  wire  _T_4060 = _T_4059 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 484:187]
  wire  _T_4061 = _T_4035 | _T_4060; // @[el2_lsu_bus_buffer.scala 484:53]
  wire  _T_4084 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 491:47]
  wire  _T_4085 = _T_4084 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 491:62]
  wire  _T_4099 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 495:50]
  wire  _T_4100 = buf_state_en_3 & _T_4099; // @[el2_lsu_bus_buffer.scala 495:48]
  wire [31:0] _T_4106 = _T_4100 ? _T_4018 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 495:30]
  wire  _T_4112 = buf_ldfwd[3] | _T_4117[0]; // @[el2_lsu_bus_buffer.scala 498:90]
  wire  _T_4113 = _T_4112 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 498:118]
  wire  _GEN_257 = _T_4133 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4125 ? 1'h0 : _T_4133; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4125 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4107 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4107 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4020 & _T_4085; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_275 = _T_4020 ? _T_4106 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4020 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4020 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_3986 ? _T_4006 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_3986 ? _T_4010 : _GEN_273; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_288 = _T_3986 ? _T_4019 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_3986 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_3982 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_3982 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_300 = _T_3982 ? 32'h0 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_3982 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_3959 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_307 = _T_3959 ? _T_3981 : _GEN_300; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_3959 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_3959 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4188; // @[Reg.scala 27:20]
  reg  _T_4191; // @[Reg.scala 27:20]
  reg  _T_4194; // @[Reg.scala 27:20]
  reg  _T_4197; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4197,_T_4194,_T_4191,_T_4188}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3199[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_1 = _T_3208[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_2 = _T_3217[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  wire [2:0] buf_byteen_in_3 = _T_3226[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 444:19]
  reg  _T_4263; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4258; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4253; // @[el2_lsu_bus_buffer.scala 534:82]
  reg  _T_4248; // @[el2_lsu_bus_buffer.scala 534:82]
  wire [3:0] buf_error = {_T_4263,_T_4258,_T_4253,_T_4248}; // @[Cat.scala 29:58]
  wire  _T_4245 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4246 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 534:128]
  wire  _T_4250 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4251 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 534:128]
  wire  _T_4255 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4256 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 534:128]
  wire  _T_4260 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 534:86]
  wire  _T_4261 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 534:128]
  wire [1:0] _T_4271 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [1:0] _GEN_407 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [2:0] _T_4272 = _T_4271 + _GEN_407; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [2:0] _GEN_408 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 536:96]
  wire [3:0] buf_numvld_any = _T_4272 + _GEN_408; // @[el2_lsu_bus_buffer.scala 536:96]
  wire  _T_4358 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 542:52]
  wire  _T_4359 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 542:92]
  wire  _T_4360 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 542:119]
  wire  _T_4362 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4363 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4364 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4365 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 543:52]
  wire  _T_4366 = _T_4362 | _T_4363; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4367 = _T_4366 | _T_4364; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4368 = _T_4367 | _T_4365; // @[el2_lsu_bus_buffer.scala 543:65]
  wire  _T_4369 = ~_T_4368; // @[el2_lsu_bus_buffer.scala 543:34]
  wire  _T_4371 = _T_4369 & _T_765; // @[el2_lsu_bus_buffer.scala 543:70]
  wire  _T_4374 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 545:51]
  wire  _T_4375 = _T_4374 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 545:72]
  wire  _T_4376 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 545:94]
  wire  _T_4377 = _T_4375 & _T_4376; // @[el2_lsu_bus_buffer.scala 545:92]
  wire  _T_4378 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 545:111]
  wire  _T_4380 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 548:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 632:66]
  wire  _T_4398 = _T_2651 & _T_1130; // @[Mux.scala 27:72]
  wire  _T_4399 = _T_2673 & _T_3688; // @[Mux.scala 27:72]
  wire  _T_4400 = _T_2695 & _T_3881; // @[Mux.scala 27:72]
  wire  _T_4401 = _T_2717 & _T_4074; // @[Mux.scala 27:72]
  wire  _T_4402 = _T_4398 | _T_4399; // @[Mux.scala 27:72]
  wire  _T_4403 = _T_4402 | _T_4400; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4403 | _T_4401; // @[Mux.scala 27:72]
  wire  _T_4409 = buf_error[0] & _T_1130; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4414 = buf_error[1] & _T_3688; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4419 = buf_error[2] & _T_3881; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4424 = buf_error[3] & _T_4074; // @[el2_lsu_bus_buffer.scala 551:108]
  wire  _T_4425 = _T_2651 & _T_4409; // @[Mux.scala 27:72]
  wire  _T_4426 = _T_2673 & _T_4414; // @[Mux.scala 27:72]
  wire  _T_4427 = _T_2695 & _T_4419; // @[Mux.scala 27:72]
  wire  _T_4428 = _T_2717 & _T_4424; // @[Mux.scala 27:72]
  wire  _T_4429 = _T_4425 | _T_4426; // @[Mux.scala 27:72]
  wire  _T_4430 = _T_4429 | _T_4427; // @[Mux.scala 27:72]
  wire  _T_4437 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4438 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4439 = _T_4437 | _T_4438; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4440 = _T_4398 & _T_4439; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4445 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4446 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4447 = _T_4445 | _T_4446; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4448 = _T_4399 & _T_4447; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4453 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4454 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4455 = _T_4453 | _T_4454; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4456 = _T_4400 & _T_4455; // @[el2_lsu_bus_buffer.scala 552:106]
  wire  _T_4461 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 552:109]
  wire  _T_4462 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 552:124]
  wire  _T_4463 = _T_4461 | _T_4462; // @[el2_lsu_bus_buffer.scala 552:122]
  wire  _T_4464 = _T_4401 & _T_4463; // @[el2_lsu_bus_buffer.scala 552:106]
  wire [1:0] _T_4467 = _T_4456 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4468 = _T_4464 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_409 = {{1'd0}, _T_4448}; // @[Mux.scala 27:72]
  wire [1:0] _T_4470 = _GEN_409 | _T_4467; // @[Mux.scala 27:72]
  wire [31:0] _T_4505 = _T_4440 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4506 = _T_4448 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4507 = _T_4456 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4508 = _T_4464 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4509 = _T_4505 | _T_4506; // @[Mux.scala 27:72]
  wire [31:0] _T_4510 = _T_4509 | _T_4507; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4510 | _T_4508; // @[Mux.scala 27:72]
  wire  _T_4516 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4517 = _T_4398 & _T_4516; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4522 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4523 = _T_4399 & _T_4522; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4528 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4529 = _T_4400 & _T_4528; // @[el2_lsu_bus_buffer.scala 554:105]
  wire  _T_4534 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 554:120]
  wire  _T_4535 = _T_4401 & _T_4534; // @[el2_lsu_bus_buffer.scala 554:105]
  wire [31:0] _T_4536 = _T_4517 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4537 = _T_4523 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4538 = _T_4529 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4539 = _T_4535 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4540 = _T_4536 | _T_4537; // @[Mux.scala 27:72]
  wire [31:0] _T_4541 = _T_4540 | _T_4538; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4541 | _T_4539; // @[Mux.scala 27:72]
  wire  _T_4543 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4544 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4545 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4546 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4547 = _T_4543 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4548 = _T_4544 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4549 = _T_4545 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4550 = _T_4546 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4551 = _T_4547 | _T_4548; // @[Mux.scala 27:72]
  wire [31:0] _T_4552 = _T_4551 | _T_4549; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_addr_offset = _T_4552 | _T_4550; // @[Mux.scala 27:72]
  wire [1:0] _T_4558 = _T_4543 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4559 = _T_4544 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4560 = _T_4545 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4561 = _T_4546 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4562 = _T_4558 | _T_4559; // @[Mux.scala 27:72]
  wire [1:0] _T_4563 = _T_4562 | _T_4560; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4563 | _T_4561; // @[Mux.scala 27:72]
  wire  _T_4573 = _T_4543 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4574 = _T_4544 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4575 = _T_4545 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4576 = _T_4546 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4577 = _T_4573 | _T_4574; // @[Mux.scala 27:72]
  wire  _T_4578 = _T_4577 | _T_4575; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4578 | _T_4576; // @[Mux.scala 27:72]
  wire [63:0] _T_4598 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [35:0] _T_4599 = lsu_nonblock_addr_offset * 32'h8; // @[el2_lsu_bus_buffer.scala 559:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4598 >> _T_4599; // @[el2_lsu_bus_buffer.scala 559:92]
  wire  _T_4600 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 560:69]
  wire  _T_4602 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 561:81]
  wire  _T_4603 = lsu_nonblock_unsign & _T_4602; // @[el2_lsu_bus_buffer.scala 561:63]
  wire [31:0] _T_4605 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4606 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 562:45]
  wire  _T_4607 = lsu_nonblock_unsign & _T_4606; // @[el2_lsu_bus_buffer.scala 562:26]
  wire [31:0] _T_4609 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4610 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 563:6]
  wire  _T_4612 = _T_4610 & _T_4602; // @[el2_lsu_bus_buffer.scala 563:27]
  wire [23:0] _T_4615 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4617 = {_T_4615,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4620 = _T_4610 & _T_4606; // @[el2_lsu_bus_buffer.scala 564:27]
  wire [15:0] _T_4623 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4625 = {_T_4623,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4626 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 565:21]
  wire [31:0] _T_4627 = _T_4603 ? _T_4605 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4628 = _T_4607 ? _T_4609 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4629 = _T_4612 ? _T_4617 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4630 = _T_4620 ? _T_4625 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4631 = _T_4626 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4632 = _T_4627 | _T_4628; // @[Mux.scala 27:72]
  wire [31:0] _T_4633 = _T_4632 | _T_4629; // @[Mux.scala 27:72]
  wire [31:0] _T_4634 = _T_4633 | _T_4630; // @[Mux.scala 27:72]
  wire [63:0] _GEN_410 = {{32'd0}, _T_4634}; // @[Mux.scala 27:72]
  wire [63:0] _T_4635 = _GEN_410 | _T_4631; // @[Mux.scala 27:72]
  wire  _T_4731 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 583:36]
  wire  _T_4732 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 583:51]
  wire  _T_4733 = _T_4731 & _T_4732; // @[el2_lsu_bus_buffer.scala 583:49]
  wire [31:0] _T_4737 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4739 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4744 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 595:50]
  wire  _T_4745 = _T_4731 & _T_4744; // @[el2_lsu_bus_buffer.scala 595:48]
  wire [7:0] _T_4749 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4752 = obuf_valid & _T_1269; // @[el2_lsu_bus_buffer.scala 600:36]
  wire  _T_4754 = _T_4752 & _T_1275; // @[el2_lsu_bus_buffer.scala 600:50]
  wire  _T_4766 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4768 = _T_4766 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4771 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4773 = _T_4771 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4776 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4778 = _T_4776 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4781 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 613:114]
  wire  _T_4783 = _T_4781 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 613:129]
  wire  _T_4784 = _T_2651 & _T_4768; // @[Mux.scala 27:72]
  wire  _T_4785 = _T_2673 & _T_4773; // @[Mux.scala 27:72]
  wire  _T_4786 = _T_2695 & _T_4778; // @[Mux.scala 27:72]
  wire  _T_4787 = _T_2717 & _T_4783; // @[Mux.scala 27:72]
  wire  _T_4788 = _T_4784 | _T_4785; // @[Mux.scala 27:72]
  wire  _T_4789 = _T_4788 | _T_4786; // @[Mux.scala 27:72]
  wire  _T_4799 = _T_2673 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 614:98]
  wire  lsu_imprecise_error_store_tag = _T_4799 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 614:113]
  wire  _T_4805 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 616:72]
  wire  _T_4807 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4809 = _T_4807 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4810 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4811 = _T_4809 | _T_4810; // @[Mux.scala 27:72]
  wire  _T_4828 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 623:68]
  wire  _T_4831 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 624:48]
  wire  _T_4834 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 627:48]
  wire  _T_4835 = io_lsu_axi_awvalid & _T_4834; // @[el2_lsu_bus_buffer.scala 627:46]
  wire  _T_4836 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 627:92]
  wire  _T_4837 = io_lsu_axi_wvalid & _T_4836; // @[el2_lsu_bus_buffer.scala 627:90]
  wire  _T_4838 = _T_4835 | _T_4837; // @[el2_lsu_bus_buffer.scala 627:69]
  wire  _T_4839 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 627:136]
  wire  _T_4840 = io_lsu_axi_arvalid & _T_4839; // @[el2_lsu_bus_buffer.scala 627:134]
  wire  _T_4844 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 631:75]
  wire  _T_4845 = io_lsu_busreq_m & _T_4844; // @[el2_lsu_bus_buffer.scala 631:73]
  reg  _T_4848; // @[el2_lsu_bus_buffer.scala 631:56]
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
  assign io_lsu_busreq_r = _T_4848; // @[el2_lsu_bus_buffer.scala 631:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 541:30]
  assign io_lsu_bus_buffer_full_any = _T_4358 ? _T_4359 : _T_4360; // @[el2_lsu_bus_buffer.scala 542:30]
  assign io_lsu_bus_buffer_empty_any = _T_4371 & _T_1157; // @[el2_lsu_bus_buffer.scala 543:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 620:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 188:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 189:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 214:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 219:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4805; // @[el2_lsu_bus_buffer.scala 616:35]
  assign io_lsu_imprecise_error_store_any = _T_4789 | _T_4787; // @[el2_lsu_bus_buffer.scala 613:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4811 : lsu_nonblock_addr_offset; // @[el2_lsu_bus_buffer.scala 617:35]
  assign io_lsu_nonblock_load_valid_m = _T_4377 & _T_4378; // @[el2_lsu_bus_buffer.scala 545:32]
  assign io_lsu_nonblock_load_tag_m = _T_1789 ? 2'h0 : _T_1825; // @[el2_lsu_bus_buffer.scala 546:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4380; // @[el2_lsu_bus_buffer.scala 548:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 549:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4600; // @[el2_lsu_bus_buffer.scala 560:35]
  assign io_lsu_nonblock_load_data_error = _T_4430 | _T_4428; // @[el2_lsu_bus_buffer.scala 551:35]
  assign io_lsu_nonblock_load_data_tag = _T_4470 | _T_4468; // @[el2_lsu_bus_buffer.scala 552:33]
  assign io_lsu_nonblock_load_data = _T_4635[31:0]; // @[el2_lsu_bus_buffer.scala 561:29]
  assign io_lsu_pmu_bus_trxn = _T_4828 | _T_4723; // @[el2_lsu_bus_buffer.scala 623:23]
  assign io_lsu_pmu_bus_misaligned = _T_4831 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 624:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 625:24]
  assign io_lsu_pmu_bus_busy = _T_4838 | _T_4840; // @[el2_lsu_bus_buffer.scala 627:23]
  assign io_lsu_axi_awvalid = _T_4733 & _T_1165; // @[el2_lsu_bus_buffer.scala 583:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 584:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4737; // @[el2_lsu_bus_buffer.scala 585:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 589:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 590:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4739 : 3'h2; // @[el2_lsu_bus_buffer.scala 586:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 591:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 593:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 588:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 587:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 592:20]
  assign io_lsu_axi_wvalid = _T_4745 & _T_1165; // @[el2_lsu_bus_buffer.scala 595:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 597:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4749; // @[el2_lsu_bus_buffer.scala 596:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 598:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 611:21]
  assign io_lsu_axi_arvalid = _T_4754 & _T_1165; // @[el2_lsu_bus_buffer.scala 600:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 601:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4737; // @[el2_lsu_bus_buffer.scala 602:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 606:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 607:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4739 : 3'h3; // @[el2_lsu_bus_buffer.scala 603:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 608:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 610:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 605:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 604:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 609:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 612:21]
  assign io_test = _T_1840 ? 2'h0 : _T_1885; // @[el2_lsu_bus_buffer.scala 398:11]
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
  assign rvclkhdr_4_io_en = _T_3380 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3573 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3766 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_3959 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3380 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3573 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3766 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_3959 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4212 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4209 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4206 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4203 = _RAND_4[0:0];
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
  _T_4239 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4237 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4235 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4233 = _RAND_15[2:0];
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
  _T_4240 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  _T_4241 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  _T_4242 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_4243 = _RAND_32[3:0];
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
  _T_4182 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  _T_4179 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  _T_4176 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4173 = _RAND_50[0:0];
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
  _T_4159 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  _T_4157 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  _T_4155 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  _T_4153 = _RAND_85[0:0];
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
  _T_4188 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  _T_4191 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  _T_4194 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  _T_4197 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4263 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4258 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4253 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4248 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4848 = _RAND_103[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4212 = 1'h0;
  end
  if (reset) begin
    _T_4209 = 1'h0;
  end
  if (reset) begin
    _T_4206 = 1'h0;
  end
  if (reset) begin
    _T_4203 = 1'h0;
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
    _T_4239 = 3'h0;
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
    _T_4240 = 4'h0;
  end
  if (reset) begin
    _T_4241 = 4'h0;
  end
  if (reset) begin
    _T_4242 = 4'h0;
  end
  if (reset) begin
    _T_4243 = 4'h0;
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
    _T_4182 = 1'h0;
  end
  if (reset) begin
    _T_4179 = 1'h0;
  end
  if (reset) begin
    _T_4176 = 1'h0;
  end
  if (reset) begin
    _T_4173 = 1'h0;
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
    _T_4159 = 1'h0;
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
    _T_4188 = 1'h0;
  end
  if (reset) begin
    _T_4191 = 1'h0;
  end
  if (reset) begin
    _T_4194 = 1'h0;
  end
  if (reset) begin
    _T_4197 = 1'h0;
  end
  if (reset) begin
    _T_4263 = 1'h0;
  end
  if (reset) begin
    _T_4258 = 1'h0;
  end
  if (reset) begin
    _T_4253 = 1'h0;
  end
  if (reset) begin
    _T_4248 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4848 = 1'h0;
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
    end else if (_T_3195) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4212 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4212 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4209 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4209 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4206 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4206 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4203 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4203 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3380) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3403) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3407) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3411) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3441) begin
        if (_T_3446) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3454) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3482) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3528) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3534) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3546) begin
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
    end else if (_T_3204) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3573) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3596) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3600) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3411) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3634) begin
        if (_T_3639) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3647) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3675) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3721) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3727) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3739) begin
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
    end else if (_T_3213) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3766) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3789) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3793) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3411) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3827) begin
        if (_T_3832) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3840) begin
          buf_state_2 <= 3'h4;
        end else if (_T_3868) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3914) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3920) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3932) begin
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
    end else if (_T_3222) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_3959) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_3982) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_3986) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3411) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4020) begin
        if (_T_4025) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4033) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4061) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4107) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4113) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4125) begin
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
      _T_4239 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4239 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4237 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4237 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4235 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4235 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4233 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4233 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2403,_T_2326};
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
      obuf_valid <= _T_1766 & obuf_rst;
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
      buf_ageQ_2 <= {_T_2301,_T_2224};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2199,_T_2122};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2097,_T_2020};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4240 <= 4'h0;
    end else begin
      _T_4240 <= _GEN_79[3:0];
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4241 <= 4'h0;
    end else begin
      _T_4241 <= _GEN_155[3:0];
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4242 <= 4'h0;
    end else begin
      _T_4242 <= _GEN_231[3:0];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4243 <= 4'h0;
    end else begin
      _T_4243 <= _GEN_307[3:0];
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
      _T_4182 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4182 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4179 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4179 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4176 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4176 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4173 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4173 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1231 & _T_4720;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1231 & _T_4721;
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
      buf_rspageQ_0 <= {_T_3025,_T_3014};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3040,_T_3029};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3055,_T_3044};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3070,_T_3059};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4159 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_3959) begin
        _T_4159 <= 1'h0;
      end else if (_T_3982) begin
        _T_4159 <= 1'h0;
      end else begin
        _T_4159 <= _T_3986;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4157 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3766) begin
        _T_4157 <= 1'h0;
      end else if (_T_3789) begin
        _T_4157 <= 1'h0;
      end else begin
        _T_4157 <= _T_3793;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4155 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3573) begin
        _T_4155 <= 1'h0;
      end else if (_T_3596) begin
        _T_4155 <= 1'h0;
      end else begin
        _T_4155 <= _T_3600;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4153 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3380) begin
        _T_4153 <= 1'h0;
      end else if (_T_3403) begin
        _T_4153 <= 1'h0;
      end else begin
        _T_4153 <= _T_3407;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3380) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3403) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3407) begin
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
      end else if (_T_3195) begin
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
      if (_T_3959) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_3982) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_3986) begin
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
      if (_T_3766) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3789) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3793) begin
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
      if (_T_3573) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3596) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3600) begin
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
      end else if (_T_3204) begin
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
      end else if (_T_3213) begin
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
      end else if (_T_3222) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4188 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4188 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4191 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4191 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4194 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4194 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4197 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4197 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4263 <= 1'h0;
    end else begin
      _T_4263 <= _T_4260 & _T_4261;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4258 <= 1'h0;
    end else begin
      _T_4258 <= _T_4255 & _T_4256;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4253 <= 1'h0;
    end else begin
      _T_4253 <= _T_4250 & _T_4251;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4248 <= 1'h0;
    end else begin
      _T_4248 <= _T_4245 & _T_4246;
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
      _T_4848 <= 1'h0;
    end else begin
      _T_4848 <= _T_4845 & _T_4378;
    end
  end
endmodule
