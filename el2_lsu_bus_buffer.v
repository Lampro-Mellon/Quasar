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
  reg  _T_4263; // @[Reg.scala 27:20]
  reg  _T_4260; // @[Reg.scala 27:20]
  reg  _T_4257; // @[Reg.scala 27:20]
  reg  _T_4254; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4263,_T_4260,_T_4257,_T_4254}; // @[Cat.scala 29:58]
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
  reg [2:0] _T_4290; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4290}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 538:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4288; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4288}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 538:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4286; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4286}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 538:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  reg [2:0] _T_4284; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4284}; // @[el2_lsu_bus_buffer.scala 134:24 el2_lsu_bus_buffer.scala 135:14 el2_lsu_bus_buffer.scala 538:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 191:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 191:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 522:60]
  wire  _T_2525 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 435:94]
  wire  _T_4010 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4033 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4037 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1774; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 381:13]
  wire  _T_4044 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 477:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 477:104]
  wire  _T_4045 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 477:104]
  wire  _T_4046 = obuf_merge & _T_4045; // @[el2_lsu_bus_buffer.scala 477:91]
  wire  _T_4047 = _T_4044 | _T_4046; // @[el2_lsu_bus_buffer.scala 477:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 375:54]
  wire  _T_4048 = _T_4047 & obuf_valid; // @[el2_lsu_bus_buffer.scala 477:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 374:55]
  wire  _T_4049 = _T_4048 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 477:148]
  wire  _GEN_280 = _T_4037 & _T_4049; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4033 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4010 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2526 = _T_2525 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2527 = buf_ageQ_3[3] & _T_2526; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2521 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 435:94]
  wire  _T_3817 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3840 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3844 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3851 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 477:48]
  wire  _T_3852 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 477:104]
  wire  _T_3853 = obuf_merge & _T_3852; // @[el2_lsu_bus_buffer.scala 477:91]
  wire  _T_3854 = _T_3851 | _T_3853; // @[el2_lsu_bus_buffer.scala 477:77]
  wire  _T_3855 = _T_3854 & obuf_valid; // @[el2_lsu_bus_buffer.scala 477:135]
  wire  _T_3856 = _T_3855 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 477:148]
  wire  _GEN_204 = _T_3844 & _T_3856; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3840 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3817 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2522 = _T_2521 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2523 = buf_ageQ_3[2] & _T_2522; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2517 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 435:94]
  wire  _T_3624 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3647 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3651 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3658 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 477:48]
  wire  _T_3659 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 477:104]
  wire  _T_3660 = obuf_merge & _T_3659; // @[el2_lsu_bus_buffer.scala 477:91]
  wire  _T_3661 = _T_3658 | _T_3660; // @[el2_lsu_bus_buffer.scala 477:77]
  wire  _T_3662 = _T_3661 & obuf_valid; // @[el2_lsu_bus_buffer.scala 477:135]
  wire  _T_3663 = _T_3662 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 477:148]
  wire  _GEN_128 = _T_3651 & _T_3663; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3647 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3624 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2518 = _T_2517 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2519 = buf_ageQ_3[1] & _T_2518; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2513 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 435:94]
  wire  _T_3431 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3454 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3458 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3465 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 477:48]
  wire  _T_3466 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 477:104]
  wire  _T_3467 = obuf_merge & _T_3466; // @[el2_lsu_bus_buffer.scala 477:91]
  wire  _T_3468 = _T_3465 | _T_3467; // @[el2_lsu_bus_buffer.scala 477:77]
  wire  _T_3469 = _T_3468 & obuf_valid; // @[el2_lsu_bus_buffer.scala 477:135]
  wire  _T_3470 = _T_3469 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 477:148]
  wire  _GEN_52 = _T_3458 & _T_3470; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3454 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3431 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2514 = _T_2513 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 435:104]
  wire  _T_2515 = buf_ageQ_3[0] & _T_2514; // @[el2_lsu_bus_buffer.scala 435:78]
  wire [3:0] buf_age_3 = {_T_2527,_T_2523,_T_2519,_T_2515}; // @[Cat.scala 29:58]
  wire  _T_2626 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2628 = _T_2626 & _T_19; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2620 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2622 = _T_2620 & _T_12; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2614 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2616 = _T_2614 & _T_5; // @[el2_lsu_bus_buffer.scala 436:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2628,_T_2622,_T_2616}; // @[Cat.scala 29:58]
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
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 522:60]
  wire  _T_2508 = buf_ageQ_2[3] & _T_2526; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2504 = buf_ageQ_2[2] & _T_2522; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2500 = buf_ageQ_2[1] & _T_2518; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2496 = buf_ageQ_2[0] & _T_2514; // @[el2_lsu_bus_buffer.scala 435:78]
  wire [3:0] buf_age_2 = {_T_2508,_T_2504,_T_2500,_T_2496}; // @[Cat.scala 29:58]
  wire  _T_2605 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2607 = _T_2605 & _T_26; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2593 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2595 = _T_2593 & _T_12; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2587 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2589 = _T_2587 & _T_5; // @[el2_lsu_bus_buffer.scala 436:106]
  wire [3:0] buf_age_younger_2 = {_T_2607,1'h0,_T_2595,_T_2589}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 522:60]
  wire  _T_2489 = buf_ageQ_1[3] & _T_2526; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2485 = buf_ageQ_1[2] & _T_2522; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2481 = buf_ageQ_1[1] & _T_2518; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2477 = buf_ageQ_1[0] & _T_2514; // @[el2_lsu_bus_buffer.scala 435:78]
  wire [3:0] buf_age_1 = {_T_2489,_T_2485,_T_2481,_T_2477}; // @[Cat.scala 29:58]
  wire  _T_2578 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2580 = _T_2578 & _T_26; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2572 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2574 = _T_2572 & _T_19; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2560 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2562 = _T_2560 & _T_5; // @[el2_lsu_bus_buffer.scala 436:106]
  wire [3:0] buf_age_younger_1 = {_T_2580,_T_2574,1'h0,_T_2562}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 196:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 196:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 196:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 196:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 196:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 522:60]
  wire  _T_2470 = buf_ageQ_0[3] & _T_2526; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2466 = buf_ageQ_0[2] & _T_2522; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2462 = buf_ageQ_0[1] & _T_2518; // @[el2_lsu_bus_buffer.scala 435:78]
  wire  _T_2458 = buf_ageQ_0[0] & _T_2514; // @[el2_lsu_bus_buffer.scala 435:78]
  wire [3:0] buf_age_0 = {_T_2470,_T_2466,_T_2462,_T_2458}; // @[Cat.scala 29:58]
  wire  _T_2551 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2553 = _T_2551 & _T_26; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2545 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2547 = _T_2545 & _T_19; // @[el2_lsu_bus_buffer.scala 436:106]
  wire  _T_2539 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 436:91]
  wire  _T_2541 = _T_2539 & _T_12; // @[el2_lsu_bus_buffer.scala 436:106]
  wire [3:0] buf_age_younger_0 = {_T_2553,_T_2547,_T_2541,1'h0}; // @[Cat.scala 29:58]
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
  reg [3:0] _T_4291; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_0 = {{28'd0}, _T_4291}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 539:14]
  wire [8:0] _GEN_354 = {{1'd0}, _T_554}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_556 = _GEN_354 & buf_data_0[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_559 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4292; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_1 = {{28'd0}, _T_4292}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 539:14]
  wire [8:0] _GEN_355 = {{1'd0}, _T_559}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_561 = _GEN_355 & buf_data_1[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_564 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4293; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_2 = {{28'd0}, _T_4293}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 539:14]
  wire [8:0] _GEN_356 = {{1'd0}, _T_564}; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [8:0] _T_566 = _GEN_356 & buf_data_2[31:23]; // @[el2_lsu_bus_buffer.scala 214:91]
  wire [7:0] _T_569 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [3:0] _T_4294; // @[el2_lib.scala 491:16]
  wire [31:0] buf_data_3 = {{28'd0}, _T_4294}; // @[el2_lsu_bus_buffer.scala 210:22 el2_lsu_bus_buffer.scala 211:12 el2_lsu_bus_buffer.scala 539:14]
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
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 636:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 635:49]
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
  wire [2:0] _GEN_365 = {{2'd0}, buf_write[3]}; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4344 = _GEN_365 == 3'h2; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4345 = buf_write[3] & _T_4344; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4346 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 543:91]
  wire  _T_4347 = _T_4345 & _T_4346; // @[el2_lsu_bus_buffer.scala 543:89]
  wire [2:0] _GEN_366 = {{2'd0}, buf_write[2]}; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4338 = _GEN_366 == 3'h2; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4339 = buf_write[2] & _T_4338; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4340 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 543:91]
  wire  _T_4341 = _T_4339 & _T_4340; // @[el2_lsu_bus_buffer.scala 543:89]
  wire [1:0] _T_4348 = _T_4347 + _T_4341; // @[el2_lsu_bus_buffer.scala 543:142]
  wire [2:0] _GEN_367 = {{2'd0}, buf_write[1]}; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4332 = _GEN_367 == 3'h2; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4333 = buf_write[1] & _T_4332; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4334 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 543:91]
  wire  _T_4335 = _T_4333 & _T_4334; // @[el2_lsu_bus_buffer.scala 543:89]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4335}; // @[el2_lsu_bus_buffer.scala 543:142]
  wire [2:0] _T_4349 = _T_4348 + _GEN_368; // @[el2_lsu_bus_buffer.scala 543:142]
  wire [2:0] _GEN_369 = {{2'd0}, buf_write[0]}; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4326 = _GEN_369 == 3'h2; // @[el2_lsu_bus_buffer.scala 543:79]
  wire  _T_4327 = buf_write[0] & _T_4326; // @[el2_lsu_bus_buffer.scala 543:64]
  wire  _T_4328 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 543:91]
  wire  _T_4329 = _T_4327 & _T_4328; // @[el2_lsu_bus_buffer.scala 543:89]
  wire [2:0] _GEN_370 = {{2'd0}, _T_4329}; // @[el2_lsu_bus_buffer.scala 543:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4349 + _GEN_370; // @[el2_lsu_bus_buffer.scala 543:142]
  wire  _T_942 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 293:43]
  wire  _T_4366 = _T_4344 & _T_4346; // @[el2_lsu_bus_buffer.scala 544:73]
  wire  _T_4362 = _T_4338 & _T_4340; // @[el2_lsu_bus_buffer.scala 544:73]
  wire [1:0] _T_4367 = _T_4366 + _T_4362; // @[el2_lsu_bus_buffer.scala 544:126]
  wire  _T_4358 = _T_4332 & _T_4334; // @[el2_lsu_bus_buffer.scala 544:73]
  wire [1:0] _GEN_374 = {{1'd0}, _T_4358}; // @[el2_lsu_bus_buffer.scala 544:126]
  wire [2:0] _T_4368 = _T_4367 + _GEN_374; // @[el2_lsu_bus_buffer.scala 544:126]
  wire  _T_4354 = _T_4326 & _T_4328; // @[el2_lsu_bus_buffer.scala 544:73]
  wire [2:0] _GEN_376 = {{2'd0}, _T_4354}; // @[el2_lsu_bus_buffer.scala 544:126]
  wire [3:0] buf_numvld_cmd_any = _T_4368 + _GEN_376; // @[el2_lsu_bus_buffer.scala 544:126]
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
  reg  _T_4233; // @[Reg.scala 27:20]
  reg  _T_4230; // @[Reg.scala 27:20]
  reg  _T_4227; // @[Reg.scala 27:20]
  reg  _T_4224; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4233,_T_4230,_T_4227,_T_4224}; // @[Cat.scala 29:58]
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
  wire  _T_4392 = _GEN_365 == 3'h1; // @[el2_lsu_bus_buffer.scala 545:64]
  wire  _T_4395 = _T_4392 | _T_4344; // @[el2_lsu_bus_buffer.scala 545:74]
  wire  _T_4397 = _T_4395 & _T_4346; // @[el2_lsu_bus_buffer.scala 545:100]
  wire  _T_4385 = _GEN_366 == 3'h1; // @[el2_lsu_bus_buffer.scala 545:64]
  wire  _T_4388 = _T_4385 | _T_4338; // @[el2_lsu_bus_buffer.scala 545:74]
  wire  _T_4390 = _T_4388 & _T_4340; // @[el2_lsu_bus_buffer.scala 545:100]
  wire [1:0] _T_4398 = _T_4397 + _T_4390; // @[el2_lsu_bus_buffer.scala 545:153]
  wire  _T_4378 = _GEN_367 == 3'h1; // @[el2_lsu_bus_buffer.scala 545:64]
  wire  _T_4381 = _T_4378 | _T_4332; // @[el2_lsu_bus_buffer.scala 545:74]
  wire  _T_4383 = _T_4381 & _T_4334; // @[el2_lsu_bus_buffer.scala 545:100]
  wire [1:0] _GEN_383 = {{1'd0}, _T_4383}; // @[el2_lsu_bus_buffer.scala 545:153]
  wire [2:0] _T_4399 = _T_4398 + _GEN_383; // @[el2_lsu_bus_buffer.scala 545:153]
  wire  _T_4371 = _GEN_369 == 3'h1; // @[el2_lsu_bus_buffer.scala 545:64]
  wire  _T_4374 = _T_4371 | _T_4326; // @[el2_lsu_bus_buffer.scala 545:74]
  wire  _T_4376 = _T_4374 & _T_4328; // @[el2_lsu_bus_buffer.scala 545:100]
  wire [2:0] _GEN_386 = {{2'd0}, _T_4376}; // @[el2_lsu_bus_buffer.scala 545:153]
  wire [3:0] buf_numvld_pend_any = _T_4399 + _GEN_386; // @[el2_lsu_bus_buffer.scala 545:153]
  wire  _T_1013 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 299:53]
  wire  _T_1014 = ibuf_byp & _T_1013; // @[el2_lsu_bus_buffer.scala 299:31]
  wire  _T_1015 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 299:64]
  wire  _T_1016 = _T_1015 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 299:84]
  wire  ibuf_buf_byp = _T_1014 & _T_1016; // @[el2_lsu_bus_buffer.scala 299:61]
  wire  _T_1017 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 314:32]
  wire  _T_4688 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 572:62]
  wire  _T_4690 = _T_4688 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 572:73]
  wire  _T_4691 = _T_4690 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 572:93]
  wire  _T_4692 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 572:62]
  wire  _T_4694 = _T_4692 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 572:73]
  wire  _T_4695 = _T_4694 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 572:93]
  wire  _T_4704 = _T_4691 | _T_4695; // @[el2_lsu_bus_buffer.scala 572:141]
  wire  _T_4696 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 572:62]
  wire  _T_4698 = _T_4696 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 572:73]
  wire  _T_4699 = _T_4698 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 572:93]
  wire  _T_4705 = _T_4704 | _T_4699; // @[el2_lsu_bus_buffer.scala 572:141]
  wire  _T_4700 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 572:62]
  wire  _T_4702 = _T_4700 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 572:73]
  wire  _T_4703 = _T_4702 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 572:93]
  wire  bus_sideeffect_pend = _T_4705 | _T_4703; // @[el2_lsu_bus_buffer.scala 572:141]
  wire  _T_1018 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 314:74]
  wire  _T_1019 = ~_T_1018; // @[el2_lsu_bus_buffer.scala 314:52]
  wire  _T_1020 = _T_1017 & _T_1019; // @[el2_lsu_bus_buffer.scala 314:50]
  wire  _T_1904 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 403:55]
  wire  _T_1905 = ~_T_1904; // @[el2_lsu_bus_buffer.scala 403:42]
  wire  _T_1907 = _T_1905 & _T_2525; // @[el2_lsu_bus_buffer.scala 403:60]
  wire  _T_1909 = _T_1907 & _T_4346; // @[el2_lsu_bus_buffer.scala 403:85]
  wire  _T_1898 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 403:55]
  wire  _T_1899 = ~_T_1898; // @[el2_lsu_bus_buffer.scala 403:42]
  wire  _T_1901 = _T_1899 & _T_2521; // @[el2_lsu_bus_buffer.scala 403:60]
  wire  _T_1903 = _T_1901 & _T_4340; // @[el2_lsu_bus_buffer.scala 403:85]
  wire  _T_1892 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 403:55]
  wire  _T_1893 = ~_T_1892; // @[el2_lsu_bus_buffer.scala 403:42]
  wire  _T_1895 = _T_1893 & _T_2517; // @[el2_lsu_bus_buffer.scala 403:60]
  wire  _T_1897 = _T_1895 & _T_4334; // @[el2_lsu_bus_buffer.scala 403:85]
  wire  _T_1886 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 403:55]
  wire  _T_1887 = ~_T_1886; // @[el2_lsu_bus_buffer.scala 403:42]
  wire  _T_1889 = _T_1887 & _T_2513; // @[el2_lsu_bus_buffer.scala 403:60]
  wire  _T_1891 = _T_1889 & _T_4328; // @[el2_lsu_bus_buffer.scala 403:85]
  wire [3:0] _T_1912 = {_T_1909,_T_1903,_T_1897,_T_1891}; // @[Cat.scala 29:58]
  wire [7:0] CmdPtr0Dec = {{4'd0}, _T_1912}; // @[el2_lsu_bus_buffer.scala 403:14]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 409:31]
  wire  _T_1034 = _T_2513 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 315:47]
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
  wire [7:0] _T_1946 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 404:59]
  wire [7:0] _GEN_387 = {{4'd0}, buf_age_3}; // @[el2_lsu_bus_buffer.scala 404:56]
  wire [7:0] _T_1947 = _GEN_387 & _T_1946; // @[el2_lsu_bus_buffer.scala 404:56]
  wire  _T_1948 = |_T_1947; // @[el2_lsu_bus_buffer.scala 404:73]
  wire  _T_1949 = ~_T_1948; // @[el2_lsu_bus_buffer.scala 404:42]
  wire  _T_1951 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 404:80]
  wire  _T_1952 = _T_1949 & _T_1951; // @[el2_lsu_bus_buffer.scala 404:78]
  wire  _T_1954 = _T_1952 & _T_2525; // @[el2_lsu_bus_buffer.scala 404:95]
  wire  _T_1956 = _T_1954 & _T_4346; // @[el2_lsu_bus_buffer.scala 404:120]
  wire [7:0] _GEN_388 = {{4'd0}, buf_age_2}; // @[el2_lsu_bus_buffer.scala 404:56]
  wire [7:0] _T_1936 = _GEN_388 & _T_1946; // @[el2_lsu_bus_buffer.scala 404:56]
  wire  _T_1937 = |_T_1936; // @[el2_lsu_bus_buffer.scala 404:73]
  wire  _T_1938 = ~_T_1937; // @[el2_lsu_bus_buffer.scala 404:42]
  wire  _T_1940 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 404:80]
  wire  _T_1941 = _T_1938 & _T_1940; // @[el2_lsu_bus_buffer.scala 404:78]
  wire  _T_1943 = _T_1941 & _T_2521; // @[el2_lsu_bus_buffer.scala 404:95]
  wire  _T_1945 = _T_1943 & _T_4340; // @[el2_lsu_bus_buffer.scala 404:120]
  wire [7:0] _GEN_389 = {{4'd0}, buf_age_1}; // @[el2_lsu_bus_buffer.scala 404:56]
  wire [7:0] _T_1925 = _GEN_389 & _T_1946; // @[el2_lsu_bus_buffer.scala 404:56]
  wire  _T_1926 = |_T_1925; // @[el2_lsu_bus_buffer.scala 404:73]
  wire  _T_1927 = ~_T_1926; // @[el2_lsu_bus_buffer.scala 404:42]
  wire  _T_1929 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 404:80]
  wire  _T_1930 = _T_1927 & _T_1929; // @[el2_lsu_bus_buffer.scala 404:78]
  wire  _T_1932 = _T_1930 & _T_2517; // @[el2_lsu_bus_buffer.scala 404:95]
  wire  _T_1934 = _T_1932 & _T_4334; // @[el2_lsu_bus_buffer.scala 404:120]
  wire [7:0] _GEN_390 = {{4'd0}, buf_age_0}; // @[el2_lsu_bus_buffer.scala 404:56]
  wire [7:0] _T_1914 = _GEN_390 & _T_1946; // @[el2_lsu_bus_buffer.scala 404:56]
  wire  _T_1915 = |_T_1914; // @[el2_lsu_bus_buffer.scala 404:73]
  wire  _T_1916 = ~_T_1915; // @[el2_lsu_bus_buffer.scala 404:42]
  wire  _T_1918 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 404:80]
  wire  _T_1919 = _T_1916 & _T_1918; // @[el2_lsu_bus_buffer.scala 404:78]
  wire  _T_1921 = _T_1919 & _T_2513; // @[el2_lsu_bus_buffer.scala 404:95]
  wire  _T_1923 = _T_1921 & _T_4328; // @[el2_lsu_bus_buffer.scala 404:120]
  wire [3:0] _T_1959 = {_T_1956,_T_1945,_T_1934,_T_1923}; // @[Cat.scala 29:58]
  wire [7:0] CmdPtr1Dec = {{4'd0}, _T_1959}; // @[el2_lsu_bus_buffer.scala 404:14]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 410:31]
  wire  _T_1133 = _T_1132 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 317:181]
  wire [3:0] _T_1136 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1153 = _T_1133 | _T_1136[0]; // @[el2_lsu_bus_buffer.scala 317:197]
  wire  _T_1154 = _T_1153 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 317:269]
  wire  _T_1155 = _T_1074 & _T_1154; // @[el2_lsu_bus_buffer.scala 316:164]
  wire  _T_1156 = _T_1020 | _T_1155; // @[el2_lsu_bus_buffer.scala 314:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 377:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 378:55]
  wire  _T_4763 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 576:54]
  wire  _T_4764 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 576:75]
  wire  _T_4766 = _T_4763 ? _T_4764 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 576:39]
  wire  bus_cmd_ready = obuf_write ? _T_4766 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 576:23]
  wire  _T_1157 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 318:48]
  wire  _T_1158 = bus_cmd_ready | _T_1157; // @[el2_lsu_bus_buffer.scala 318:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1159 = _T_1158 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 318:60]
  wire  _T_1160 = _T_1156 & _T_1159; // @[el2_lsu_bus_buffer.scala 318:29]
  wire  _T_1161 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 318:77]
  wire  _T_1162 = _T_1160 & _T_1161; // @[el2_lsu_bus_buffer.scala 318:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4711 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 574:56]
  wire  _T_4712 = obuf_valid & _T_4711; // @[el2_lsu_bus_buffer.scala 574:38]
  wire  _T_4714 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4715 = obuf_merge & _T_4714; // @[el2_lsu_bus_buffer.scala 574:114]
  wire  _T_4716 = _T_3465 | _T_4715; // @[el2_lsu_bus_buffer.scala 574:100]
  wire  _T_4717 = ~_T_4716; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_4718 = _T_4712 & _T_4717; // @[el2_lsu_bus_buffer.scala 574:78]
  wire  _T_4755 = _T_4688 & _T_4718; // @[Mux.scala 27:72]
  wire  _T_4723 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 574:56]
  wire  _T_4724 = obuf_valid & _T_4723; // @[el2_lsu_bus_buffer.scala 574:38]
  wire  _T_4726 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4727 = obuf_merge & _T_4726; // @[el2_lsu_bus_buffer.scala 574:114]
  wire  _T_4728 = _T_3658 | _T_4727; // @[el2_lsu_bus_buffer.scala 574:100]
  wire  _T_4729 = ~_T_4728; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_4730 = _T_4724 & _T_4729; // @[el2_lsu_bus_buffer.scala 574:78]
  wire  _T_4756 = _T_4692 & _T_4730; // @[Mux.scala 27:72]
  wire  _T_4759 = _T_4755 | _T_4756; // @[Mux.scala 27:72]
  wire  _T_4735 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 574:56]
  wire  _T_4736 = obuf_valid & _T_4735; // @[el2_lsu_bus_buffer.scala 574:38]
  wire  _T_4738 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4739 = obuf_merge & _T_4738; // @[el2_lsu_bus_buffer.scala 574:114]
  wire  _T_4740 = _T_3851 | _T_4739; // @[el2_lsu_bus_buffer.scala 574:100]
  wire  _T_4741 = ~_T_4740; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_4742 = _T_4736 & _T_4741; // @[el2_lsu_bus_buffer.scala 574:78]
  wire  _T_4757 = _T_4696 & _T_4742; // @[Mux.scala 27:72]
  wire  _T_4760 = _T_4759 | _T_4757; // @[Mux.scala 27:72]
  wire  _T_4747 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 574:56]
  wire  _T_4748 = obuf_valid & _T_4747; // @[el2_lsu_bus_buffer.scala 574:38]
  wire  _T_4750 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4751 = obuf_merge & _T_4750; // @[el2_lsu_bus_buffer.scala 574:114]
  wire  _T_4752 = _T_4044 | _T_4751; // @[el2_lsu_bus_buffer.scala 574:100]
  wire  _T_4753 = ~_T_4752; // @[el2_lsu_bus_buffer.scala 574:80]
  wire  _T_4754 = _T_4748 & _T_4753; // @[el2_lsu_bus_buffer.scala 574:78]
  wire  _T_4758 = _T_4700 & _T_4754; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4760 | _T_4758; // @[Mux.scala 27:72]
  wire  _T_1165 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 318:118]
  wire  _T_1166 = _T_1162 & _T_1165; // @[el2_lsu_bus_buffer.scala 318:116]
  wire  obuf_wr_en = _T_1166 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 318:142]
  wire  _T_1168 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 320:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 577:39]
  wire  _T_4770 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 579:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 578:39]
  wire  _T_4771 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 579:70]
  wire  _T_4772 = _T_4770 & _T_4771; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4773 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 579:111]
  wire  bus_cmd_sent = _T_4772 | _T_4773; // @[el2_lsu_bus_buffer.scala 579:89]
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
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 580:37]
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
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 523:63]
  wire  _T_2649 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 437:104]
  wire  _T_2650 = buf_rspageQ_0[3] & _T_2649; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2646 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 437:104]
  wire  _T_2647 = buf_rspageQ_0[2] & _T_2646; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2643 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 437:104]
  wire  _T_2644 = buf_rspageQ_0[1] & _T_2643; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2640 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 437:104]
  wire  _T_2641 = buf_rspageQ_0[0] & _T_2640; // @[el2_lsu_bus_buffer.scala 437:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2650,_T_2647,_T_2644,_T_2641}; // @[Cat.scala 29:58]
  wire  _T_1960 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 408:62]
  wire  _T_1961 = ~_T_1960; // @[el2_lsu_bus_buffer.scala 408:41]
  wire  _T_1963 = _T_1961 & _T_2640; // @[el2_lsu_bus_buffer.scala 408:67]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 523:63]
  wire  _T_2665 = buf_rspageQ_1[3] & _T_2649; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2662 = buf_rspageQ_1[2] & _T_2646; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2659 = buf_rspageQ_1[1] & _T_2643; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2656 = buf_rspageQ_1[0] & _T_2640; // @[el2_lsu_bus_buffer.scala 437:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2665,_T_2662,_T_2659,_T_2656}; // @[Cat.scala 29:58]
  wire  _T_1964 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 408:62]
  wire  _T_1965 = ~_T_1964; // @[el2_lsu_bus_buffer.scala 408:41]
  wire  _T_1967 = _T_1965 & _T_2643; // @[el2_lsu_bus_buffer.scala 408:67]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 523:63]
  wire  _T_2680 = buf_rspageQ_2[3] & _T_2649; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2677 = buf_rspageQ_2[2] & _T_2646; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2674 = buf_rspageQ_2[1] & _T_2643; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2671 = buf_rspageQ_2[0] & _T_2640; // @[el2_lsu_bus_buffer.scala 437:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2680,_T_2677,_T_2674,_T_2671}; // @[Cat.scala 29:58]
  wire  _T_1968 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 408:62]
  wire  _T_1969 = ~_T_1968; // @[el2_lsu_bus_buffer.scala 408:41]
  wire  _T_1971 = _T_1969 & _T_2646; // @[el2_lsu_bus_buffer.scala 408:67]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 523:63]
  wire  _T_2695 = buf_rspageQ_3[3] & _T_2649; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2692 = buf_rspageQ_3[2] & _T_2646; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2689 = buf_rspageQ_3[1] & _T_2643; // @[el2_lsu_bus_buffer.scala 437:89]
  wire  _T_2686 = buf_rspageQ_3[0] & _T_2640; // @[el2_lsu_bus_buffer.scala 437:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2695,_T_2692,_T_2689,_T_2686}; // @[Cat.scala 29:58]
  wire  _T_1972 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 408:62]
  wire  _T_1973 = ~_T_1972; // @[el2_lsu_bus_buffer.scala 408:41]
  wire  _T_1975 = _T_1973 & _T_2649; // @[el2_lsu_bus_buffer.scala 408:67]
  wire [3:0] _T_1978 = {_T_1975,_T_1971,_T_1967,_T_1963}; // @[Cat.scala 29:58]
  wire  _T_1983 = CmdPtr0Dec[4] | CmdPtr0Dec[5]; // @[el2_lsu_bus_buffer.scala 412:42]
  wire  _T_1985 = _T_1983 | CmdPtr0Dec[6]; // @[el2_lsu_bus_buffer.scala 412:48]
  wire  _T_1987 = _T_1985 | CmdPtr0Dec[7]; // @[el2_lsu_bus_buffer.scala 412:54]
  wire  _T_1990 = CmdPtr0Dec[2] | CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 412:67]
  wire  _T_1992 = _T_1990 | CmdPtr0Dec[6]; // @[el2_lsu_bus_buffer.scala 412:73]
  wire  _T_1994 = _T_1992 | CmdPtr0Dec[7]; // @[el2_lsu_bus_buffer.scala 412:79]
  wire  _T_1997 = CmdPtr0Dec[1] | CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 412:92]
  wire  _T_1999 = _T_1997 | CmdPtr0Dec[5]; // @[el2_lsu_bus_buffer.scala 412:98]
  wire  _T_2001 = _T_1999 | CmdPtr0Dec[7]; // @[el2_lsu_bus_buffer.scala 412:104]
  wire [1:0] _T_2002 = {_T_1987,_T_1994}; // @[Cat.scala 29:58]
  wire [7:0] RspPtrDec = {{4'd0}, _T_1978}; // @[el2_lsu_bus_buffer.scala 408:13]
  wire  _T_2027 = RspPtrDec[4] | RspPtrDec[5]; // @[el2_lsu_bus_buffer.scala 412:42]
  wire  _T_2029 = _T_2027 | RspPtrDec[6]; // @[el2_lsu_bus_buffer.scala 412:48]
  wire  _T_2031 = _T_2029 | RspPtrDec[7]; // @[el2_lsu_bus_buffer.scala 412:54]
  wire  _T_2034 = RspPtrDec[2] | RspPtrDec[3]; // @[el2_lsu_bus_buffer.scala 412:67]
  wire  _T_2036 = _T_2034 | RspPtrDec[6]; // @[el2_lsu_bus_buffer.scala 412:73]
  wire  _T_2038 = _T_2036 | RspPtrDec[7]; // @[el2_lsu_bus_buffer.scala 412:79]
  wire  _T_2041 = RspPtrDec[1] | RspPtrDec[3]; // @[el2_lsu_bus_buffer.scala 412:92]
  wire  _T_2043 = _T_2041 | RspPtrDec[5]; // @[el2_lsu_bus_buffer.scala 412:98]
  wire  _T_2045 = _T_2043 | RspPtrDec[7]; // @[el2_lsu_bus_buffer.scala 412:104]
  wire [2:0] RspPtr = {_T_2031,_T_2038,_T_2045}; // @[Cat.scala 29:58]
  wire  _T_3435 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 466:77]
  wire  _T_3436 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 466:97]
  wire  _T_3437 = _T_3435 & _T_3436; // @[el2_lsu_bus_buffer.scala 466:95]
  wire  _T_3438 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 466:117]
  wire  _T_3439 = _T_3437 & _T_3438; // @[el2_lsu_bus_buffer.scala 466:112]
  wire  _T_3440 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 466:144]
  wire  _T_3441 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 466:166]
  wire  _T_3442 = _T_3440 & _T_3441; // @[el2_lsu_bus_buffer.scala 466:161]
  wire  _T_3443 = _T_3439 | _T_3442; // @[el2_lsu_bus_buffer.scala 466:132]
  wire  _T_3444 = _T_766 & _T_3443; // @[el2_lsu_bus_buffer.scala 466:63]
  wire  _T_3445 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 466:206]
  wire  _T_3446 = ibuf_drain_vld & _T_3445; // @[el2_lsu_bus_buffer.scala 466:201]
  wire  _T_3447 = _T_3444 | _T_3446; // @[el2_lsu_bus_buffer.scala 466:183]
  wire  _T_3457 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 473:46]
  wire  _T_3492 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 581:38]
  wire  _T_3537 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 491:73]
  wire  _T_3538 = bus_rsp_write & _T_3537; // @[el2_lsu_bus_buffer.scala 491:52]
  wire  _T_3539 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 492:46]
  reg  _T_4210; // @[Reg.scala 27:20]
  reg  _T_4208; // @[Reg.scala 27:20]
  reg  _T_4206; // @[Reg.scala 27:20]
  reg  _T_4204; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4210,_T_4208,_T_4206,_T_4204}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_391 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_3541 = io_lsu_axi_rid == _GEN_391; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_3542 = buf_ldfwd[0] & _T_3541; // @[el2_lsu_bus_buffer.scala 493:27]
  wire  _T_3543 = _T_3539 | _T_3542; // @[el2_lsu_bus_buffer.scala 492:77]
  wire  _T_3544 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 494:26]
  wire  _T_3547 = _T_3544 & _T_1130; // @[el2_lsu_bus_buffer.scala 494:42]
  wire  _T_3548 = _T_3547 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 494:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_392 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_3549 = io_lsu_axi_rid == _GEN_392; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_3550 = _T_3548 & _T_3549; // @[el2_lsu_bus_buffer.scala 494:74]
  wire  _T_3551 = _T_3543 | _T_3550; // @[el2_lsu_bus_buffer.scala 493:71]
  wire  _T_3552 = bus_rsp_read & _T_3551; // @[el2_lsu_bus_buffer.scala 492:25]
  wire  _T_3553 = _T_3538 | _T_3552; // @[el2_lsu_bus_buffer.scala 491:105]
  wire  _GEN_42 = _T_3492 & _T_3553; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3458 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3454 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3431 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3579 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3589 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 506:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [2:0] _GEN_394 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_3591 = io_lsu_axi_rid == _GEN_394; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_3592 = _T_3589[0] & _T_3591; // @[el2_lsu_bus_buffer.scala 506:38]
  wire  _T_3593 = _T_3549 | _T_3592; // @[el2_lsu_bus_buffer.scala 505:95]
  wire  _T_3594 = bus_rsp_read & _T_3593; // @[el2_lsu_bus_buffer.scala 505:45]
  wire  _GEN_36 = _T_3579 & _T_3594; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3492 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3458 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3454 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3431 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3471 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_3472 = _T_3471 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 479:70]
  wire  _T_3597 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3600 = RspPtr == 3'h0; // @[el2_lsu_bus_buffer.scala 511:37]
  wire  _T_3601 = _GEN_392 == RspPtr; // @[el2_lsu_bus_buffer.scala 511:98]
  wire  _T_3602 = buf_dual_0 & _T_3601; // @[el2_lsu_bus_buffer.scala 511:80]
  wire  _T_3603 = _T_3600 | _T_3602; // @[el2_lsu_bus_buffer.scala 511:65]
  wire  _T_3604 = _T_3603 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 511:112]
  wire  _T_3605 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3597 ? _T_3604 : _T_3605; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3579 ? _T_3472 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3492 ? _T_3472 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3458 ? _T_3472 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3454 ? _T_3457 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3431 ? _T_3447 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2048 = _T_1779 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_2049 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 430:20]
  wire  _T_2052 = _T_2513 & _T_4328; // @[el2_lsu_bus_buffer.scala 430:57]
  wire  _T_2053 = _T_2049 | _T_2052; // @[el2_lsu_bus_buffer.scala 430:31]
  wire  _T_2054 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 431:23]
  wire  _T_2056 = _T_2054 & _T_3435; // @[el2_lsu_bus_buffer.scala 431:41]
  wire  _T_2058 = _T_2056 & _T_1782; // @[el2_lsu_bus_buffer.scala 431:71]
  wire  _T_2060 = _T_2058 & _T_1780; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2061 = _T_2053 | _T_2060; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2062 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 432:17]
  wire  _T_2063 = _T_2062 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 432:35]
  wire  _T_2065 = _T_2063 & _T_1785; // @[el2_lsu_bus_buffer.scala 432:52]
  wire  _T_2067 = _T_2065 & _T_1782; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2068 = _T_2061 | _T_2067; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2069 = _T_2048 & _T_2068; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2071 = _T_2069 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2074 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 430:20]
  wire  _T_2077 = _T_2517 & _T_4334; // @[el2_lsu_bus_buffer.scala 430:57]
  wire  _T_2078 = _T_2074 | _T_2077; // @[el2_lsu_bus_buffer.scala 430:31]
  wire  _T_2085 = _T_2058 & _T_1791; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2086 = _T_2078 | _T_2085; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2092 = _T_2065 & _T_1793; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2093 = _T_2086 | _T_2092; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2094 = _T_2048 & _T_2093; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2096 = _T_2094 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2099 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 430:20]
  wire  _T_2102 = _T_2521 & _T_4340; // @[el2_lsu_bus_buffer.scala 430:57]
  wire  _T_2103 = _T_2099 | _T_2102; // @[el2_lsu_bus_buffer.scala 430:31]
  wire  _T_2110 = _T_2058 & _T_1802; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2111 = _T_2103 | _T_2110; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2117 = _T_2065 & _T_1804; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2118 = _T_2111 | _T_2117; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2119 = _T_2048 & _T_2118; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2121 = _T_2119 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2124 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 430:20]
  wire  _T_2127 = _T_2525 & _T_4346; // @[el2_lsu_bus_buffer.scala 430:57]
  wire  _T_2128 = _T_2124 | _T_2127; // @[el2_lsu_bus_buffer.scala 430:31]
  wire  _T_2135 = _T_2058 & _T_1813; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2136 = _T_2128 | _T_2135; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2142 = _T_2065 & _T_1815; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2143 = _T_2136 | _T_2142; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2144 = _T_2048 & _T_2143; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2146 = _T_2144 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire [2:0] _T_2148 = {_T_2146,_T_2121,_T_2096}; // @[Cat.scala 29:58]
  wire  _T_3631 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 466:117]
  wire  _T_3632 = _T_3437 & _T_3631; // @[el2_lsu_bus_buffer.scala 466:112]
  wire  _T_3634 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 466:166]
  wire  _T_3635 = _T_3440 & _T_3634; // @[el2_lsu_bus_buffer.scala 466:161]
  wire  _T_3636 = _T_3632 | _T_3635; // @[el2_lsu_bus_buffer.scala 466:132]
  wire  _T_3637 = _T_766 & _T_3636; // @[el2_lsu_bus_buffer.scala 466:63]
  wire  _T_3638 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 466:206]
  wire  _T_3639 = ibuf_drain_vld & _T_3638; // @[el2_lsu_bus_buffer.scala 466:201]
  wire  _T_3640 = _T_3637 | _T_3639; // @[el2_lsu_bus_buffer.scala 466:183]
  wire  _T_3685 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3730 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 491:73]
  wire  _T_3731 = bus_rsp_write & _T_3730; // @[el2_lsu_bus_buffer.scala 491:52]
  wire  _T_3732 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 492:46]
  wire [2:0] _GEN_396 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_3734 = io_lsu_axi_rid == _GEN_396; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_3735 = buf_ldfwd[1] & _T_3734; // @[el2_lsu_bus_buffer.scala 493:27]
  wire  _T_3736 = _T_3732 | _T_3735; // @[el2_lsu_bus_buffer.scala 492:77]
  wire  _T_3737 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 494:26]
  wire  _T_3739 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 494:44]
  wire  _T_3740 = _T_3737 & _T_3739; // @[el2_lsu_bus_buffer.scala 494:42]
  wire  _T_3741 = _T_3740 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 494:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_397 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_3742 = io_lsu_axi_rid == _GEN_397; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_3743 = _T_3741 & _T_3742; // @[el2_lsu_bus_buffer.scala 494:74]
  wire  _T_3744 = _T_3736 | _T_3743; // @[el2_lsu_bus_buffer.scala 493:71]
  wire  _T_3745 = bus_rsp_read & _T_3744; // @[el2_lsu_bus_buffer.scala 492:25]
  wire  _T_3746 = _T_3731 | _T_3745; // @[el2_lsu_bus_buffer.scala 491:105]
  wire  _GEN_118 = _T_3685 & _T_3746; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3651 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3647 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3624 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3772 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3782 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 506:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [2:0] _GEN_399 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_3784 = io_lsu_axi_rid == _GEN_399; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_3785 = _T_3782[0] & _T_3784; // @[el2_lsu_bus_buffer.scala 506:38]
  wire  _T_3786 = _T_3742 | _T_3785; // @[el2_lsu_bus_buffer.scala 505:95]
  wire  _T_3787 = bus_rsp_read & _T_3786; // @[el2_lsu_bus_buffer.scala 505:45]
  wire  _GEN_112 = _T_3772 & _T_3787; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3685 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3651 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3647 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3624 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3664 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_3665 = _T_3664 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 479:70]
  wire  _T_3790 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3793 = RspPtr == 3'h1; // @[el2_lsu_bus_buffer.scala 511:37]
  wire  _T_3794 = _GEN_397 == RspPtr; // @[el2_lsu_bus_buffer.scala 511:98]
  wire  _T_3795 = buf_dual_1 & _T_3794; // @[el2_lsu_bus_buffer.scala 511:80]
  wire  _T_3796 = _T_3793 | _T_3795; // @[el2_lsu_bus_buffer.scala 511:65]
  wire  _T_3797 = _T_3796 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 511:112]
  wire  _T_3798 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3790 ? _T_3797 : _T_3798; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3772 ? _T_3665 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3685 ? _T_3665 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3651 ? _T_3665 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3647 ? _T_3457 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3624 ? _T_3640 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2150 = _T_1790 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_2160 = _T_2056 & _T_1793; // @[el2_lsu_bus_buffer.scala 431:71]
  wire  _T_2162 = _T_2160 & _T_1780; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2163 = _T_2053 | _T_2162; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2167 = _T_2063 & _T_1796; // @[el2_lsu_bus_buffer.scala 432:52]
  wire  _T_2169 = _T_2167 & _T_1782; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2170 = _T_2163 | _T_2169; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2171 = _T_2150 & _T_2170; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2173 = _T_2171 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2187 = _T_2160 & _T_1791; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2188 = _T_2078 | _T_2187; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2194 = _T_2167 & _T_1793; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2195 = _T_2188 | _T_2194; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2196 = _T_2150 & _T_2195; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2198 = _T_2196 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2212 = _T_2160 & _T_1802; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2213 = _T_2103 | _T_2212; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2219 = _T_2167 & _T_1804; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2220 = _T_2213 | _T_2219; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2221 = _T_2150 & _T_2220; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2223 = _T_2221 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2237 = _T_2160 & _T_1813; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2238 = _T_2128 | _T_2237; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2244 = _T_2167 & _T_1815; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2245 = _T_2238 | _T_2244; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2246 = _T_2150 & _T_2245; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2248 = _T_2246 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire [2:0] _T_2250 = {_T_2248,_T_2223,_T_2198}; // @[Cat.scala 29:58]
  wire  _T_3824 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 466:117]
  wire  _T_3825 = _T_3437 & _T_3824; // @[el2_lsu_bus_buffer.scala 466:112]
  wire  _T_3827 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 466:166]
  wire  _T_3828 = _T_3440 & _T_3827; // @[el2_lsu_bus_buffer.scala 466:161]
  wire  _T_3829 = _T_3825 | _T_3828; // @[el2_lsu_bus_buffer.scala 466:132]
  wire  _T_3830 = _T_766 & _T_3829; // @[el2_lsu_bus_buffer.scala 466:63]
  wire  _T_3831 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 466:206]
  wire  _T_3832 = ibuf_drain_vld & _T_3831; // @[el2_lsu_bus_buffer.scala 466:201]
  wire  _T_3833 = _T_3830 | _T_3832; // @[el2_lsu_bus_buffer.scala 466:183]
  wire  _T_3878 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3923 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 491:73]
  wire  _T_3924 = bus_rsp_write & _T_3923; // @[el2_lsu_bus_buffer.scala 491:52]
  wire  _T_3925 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 492:46]
  wire [2:0] _GEN_401 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_3927 = io_lsu_axi_rid == _GEN_401; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_3928 = buf_ldfwd[2] & _T_3927; // @[el2_lsu_bus_buffer.scala 493:27]
  wire  _T_3929 = _T_3925 | _T_3928; // @[el2_lsu_bus_buffer.scala 492:77]
  wire  _T_3930 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 494:26]
  wire  _T_3932 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 494:44]
  wire  _T_3933 = _T_3930 & _T_3932; // @[el2_lsu_bus_buffer.scala 494:42]
  wire  _T_3934 = _T_3933 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 494:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_402 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_3935 = io_lsu_axi_rid == _GEN_402; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_3936 = _T_3934 & _T_3935; // @[el2_lsu_bus_buffer.scala 494:74]
  wire  _T_3937 = _T_3929 | _T_3936; // @[el2_lsu_bus_buffer.scala 493:71]
  wire  _T_3938 = bus_rsp_read & _T_3937; // @[el2_lsu_bus_buffer.scala 492:25]
  wire  _T_3939 = _T_3924 | _T_3938; // @[el2_lsu_bus_buffer.scala 491:105]
  wire  _GEN_194 = _T_3878 & _T_3939; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3844 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3840 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3817 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_3965 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_3975 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 506:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [2:0] _GEN_404 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_3977 = io_lsu_axi_rid == _GEN_404; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_3978 = _T_3975[0] & _T_3977; // @[el2_lsu_bus_buffer.scala 506:38]
  wire  _T_3979 = _T_3935 | _T_3978; // @[el2_lsu_bus_buffer.scala 505:95]
  wire  _T_3980 = bus_rsp_read & _T_3979; // @[el2_lsu_bus_buffer.scala 505:45]
  wire  _GEN_188 = _T_3965 & _T_3980; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3878 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3844 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3840 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3817 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3857 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_3858 = _T_3857 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 479:70]
  wire  _T_3983 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3986 = RspPtr == 3'h2; // @[el2_lsu_bus_buffer.scala 511:37]
  wire  _T_3987 = _GEN_402 == RspPtr; // @[el2_lsu_bus_buffer.scala 511:98]
  wire  _T_3988 = buf_dual_2 & _T_3987; // @[el2_lsu_bus_buffer.scala 511:80]
  wire  _T_3989 = _T_3986 | _T_3988; // @[el2_lsu_bus_buffer.scala 511:65]
  wire  _T_3990 = _T_3989 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 511:112]
  wire  _T_3991 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_3983 ? _T_3990 : _T_3991; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_3965 ? _T_3858 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3878 ? _T_3858 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3844 ? _T_3858 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3840 ? _T_3457 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3817 ? _T_3833 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2252 = _T_1801 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_2262 = _T_2056 & _T_1804; // @[el2_lsu_bus_buffer.scala 431:71]
  wire  _T_2264 = _T_2262 & _T_1780; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2265 = _T_2053 | _T_2264; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2269 = _T_2063 & _T_1807; // @[el2_lsu_bus_buffer.scala 432:52]
  wire  _T_2271 = _T_2269 & _T_1782; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2272 = _T_2265 | _T_2271; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2273 = _T_2252 & _T_2272; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2275 = _T_2273 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2289 = _T_2262 & _T_1791; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2290 = _T_2078 | _T_2289; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2296 = _T_2269 & _T_1793; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2297 = _T_2290 | _T_2296; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2298 = _T_2252 & _T_2297; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2300 = _T_2298 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2314 = _T_2262 & _T_1802; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2315 = _T_2103 | _T_2314; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2321 = _T_2269 & _T_1804; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2322 = _T_2315 | _T_2321; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2323 = _T_2252 & _T_2322; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2325 = _T_2323 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2339 = _T_2262 & _T_1813; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2340 = _T_2128 | _T_2339; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2346 = _T_2269 & _T_1815; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2347 = _T_2340 | _T_2346; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2348 = _T_2252 & _T_2347; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2350 = _T_2348 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire [2:0] _T_2352 = {_T_2350,_T_2325,_T_2300}; // @[Cat.scala 29:58]
  wire  _T_4017 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 466:117]
  wire  _T_4018 = _T_3437 & _T_4017; // @[el2_lsu_bus_buffer.scala 466:112]
  wire  _T_4020 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 466:166]
  wire  _T_4021 = _T_3440 & _T_4020; // @[el2_lsu_bus_buffer.scala 466:161]
  wire  _T_4022 = _T_4018 | _T_4021; // @[el2_lsu_bus_buffer.scala 466:132]
  wire  _T_4023 = _T_766 & _T_4022; // @[el2_lsu_bus_buffer.scala 466:63]
  wire  _T_4024 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 466:206]
  wire  _T_4025 = ibuf_drain_vld & _T_4024; // @[el2_lsu_bus_buffer.scala 466:201]
  wire  _T_4026 = _T_4023 | _T_4025; // @[el2_lsu_bus_buffer.scala 466:183]
  wire  _T_4071 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4116 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 491:73]
  wire  _T_4117 = bus_rsp_write & _T_4116; // @[el2_lsu_bus_buffer.scala 491:52]
  wire  _T_4118 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 492:46]
  wire [2:0] _GEN_406 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_4120 = io_lsu_axi_rid == _GEN_406; // @[el2_lsu_bus_buffer.scala 493:47]
  wire  _T_4121 = buf_ldfwd[3] & _T_4120; // @[el2_lsu_bus_buffer.scala 493:27]
  wire  _T_4122 = _T_4118 | _T_4121; // @[el2_lsu_bus_buffer.scala 492:77]
  wire  _T_4123 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 494:26]
  wire  _T_4125 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 494:44]
  wire  _T_4126 = _T_4123 & _T_4125; // @[el2_lsu_bus_buffer.scala 494:42]
  wire  _T_4127 = _T_4126 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 494:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_407 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_4128 = io_lsu_axi_rid == _GEN_407; // @[el2_lsu_bus_buffer.scala 494:94]
  wire  _T_4129 = _T_4127 & _T_4128; // @[el2_lsu_bus_buffer.scala 494:74]
  wire  _T_4130 = _T_4122 | _T_4129; // @[el2_lsu_bus_buffer.scala 493:71]
  wire  _T_4131 = bus_rsp_read & _T_4130; // @[el2_lsu_bus_buffer.scala 492:25]
  wire  _T_4132 = _T_4117 | _T_4131; // @[el2_lsu_bus_buffer.scala 491:105]
  wire  _GEN_270 = _T_4071 & _T_4132; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4037 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4033 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4010 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4158 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4168 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 506:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 506:58]
  wire [2:0] _GEN_409 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_4170 = io_lsu_axi_rid == _GEN_409; // @[el2_lsu_bus_buffer.scala 506:58]
  wire  _T_4171 = _T_4168[0] & _T_4170; // @[el2_lsu_bus_buffer.scala 506:38]
  wire  _T_4172 = _T_4128 | _T_4171; // @[el2_lsu_bus_buffer.scala 505:95]
  wire  _T_4173 = bus_rsp_read & _T_4172; // @[el2_lsu_bus_buffer.scala 505:45]
  wire  _GEN_264 = _T_4158 & _T_4173; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4071 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4037 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4033 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4010 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4050 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 479:49]
  wire  _T_4051 = _T_4050 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 479:70]
  wire  _T_4176 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4179 = RspPtr == 3'h3; // @[el2_lsu_bus_buffer.scala 511:37]
  wire  _T_4180 = _GEN_407 == RspPtr; // @[el2_lsu_bus_buffer.scala 511:98]
  wire  _T_4181 = buf_dual_3 & _T_4180; // @[el2_lsu_bus_buffer.scala 511:80]
  wire  _T_4182 = _T_4179 | _T_4181; // @[el2_lsu_bus_buffer.scala 511:65]
  wire  _T_4183 = _T_4182 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 511:112]
  wire  _T_4184 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4176 ? _T_4183 : _T_4184; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4158 ? _T_4051 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4071 ? _T_4051 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4037 ? _T_4051 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4033 ? _T_3457 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4010 ? _T_4026 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2354 = _T_1812 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 429:94]
  wire  _T_2364 = _T_2056 & _T_1815; // @[el2_lsu_bus_buffer.scala 431:71]
  wire  _T_2366 = _T_2364 & _T_1780; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2367 = _T_2053 | _T_2366; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2371 = _T_2063 & _T_1818; // @[el2_lsu_bus_buffer.scala 432:52]
  wire  _T_2373 = _T_2371 & _T_1782; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2374 = _T_2367 | _T_2373; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2375 = _T_2354 & _T_2374; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2377 = _T_2375 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2391 = _T_2364 & _T_1791; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2392 = _T_2078 | _T_2391; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2398 = _T_2371 & _T_1793; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2399 = _T_2392 | _T_2398; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2400 = _T_2354 & _T_2399; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2402 = _T_2400 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2416 = _T_2364 & _T_1802; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2417 = _T_2103 | _T_2416; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2423 = _T_2371 & _T_1804; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2424 = _T_2417 | _T_2423; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2425 = _T_2354 & _T_2424; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2427 = _T_2425 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire  _T_2441 = _T_2364 & _T_1813; // @[el2_lsu_bus_buffer.scala 431:92]
  wire  _T_2442 = _T_2128 | _T_2441; // @[el2_lsu_bus_buffer.scala 430:86]
  wire  _T_2448 = _T_2371 & _T_1815; // @[el2_lsu_bus_buffer.scala 432:73]
  wire  _T_2449 = _T_2442 | _T_2448; // @[el2_lsu_bus_buffer.scala 431:114]
  wire  _T_2450 = _T_2354 & _T_2449; // @[el2_lsu_bus_buffer.scala 429:113]
  wire  _T_2452 = _T_2450 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 432:97]
  wire [2:0] _T_2454 = {_T_2452,_T_2427,_T_2402}; // @[Cat.scala 29:58]
  wire  _T_2702 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 440:49]
  wire  _T_2703 = _T_1779 | _T_2702; // @[el2_lsu_bus_buffer.scala 440:34]
  wire  _T_2704 = ~_T_2703; // @[el2_lsu_bus_buffer.scala 440:8]
  wire  _T_2712 = _T_2704 | _T_2060; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2719 = _T_2712 | _T_2067; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2720 = _T_2048 & _T_2719; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2724 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 440:49]
  wire  _T_2725 = _T_1790 | _T_2724; // @[el2_lsu_bus_buffer.scala 440:34]
  wire  _T_2726 = ~_T_2725; // @[el2_lsu_bus_buffer.scala 440:8]
  wire  _T_2734 = _T_2726 | _T_2085; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2741 = _T_2734 | _T_2092; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2742 = _T_2048 & _T_2741; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2746 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 440:49]
  wire  _T_2747 = _T_1801 | _T_2746; // @[el2_lsu_bus_buffer.scala 440:34]
  wire  _T_2748 = ~_T_2747; // @[el2_lsu_bus_buffer.scala 440:8]
  wire  _T_2756 = _T_2748 | _T_2110; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2763 = _T_2756 | _T_2117; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2764 = _T_2048 & _T_2763; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2768 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 440:49]
  wire  _T_2769 = _T_1812 | _T_2768; // @[el2_lsu_bus_buffer.scala 440:34]
  wire  _T_2770 = ~_T_2769; // @[el2_lsu_bus_buffer.scala 440:8]
  wire  _T_2778 = _T_2770 | _T_2135; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2785 = _T_2778 | _T_2142; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2786 = _T_2048 & _T_2785; // @[el2_lsu_bus_buffer.scala 439:114]
  wire [3:0] buf_rspage_set_0 = {_T_2786,_T_2764,_T_2742,_T_2720}; // @[Cat.scala 29:58]
  wire  _T_2803 = _T_2704 | _T_2162; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2810 = _T_2803 | _T_2169; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2811 = _T_2150 & _T_2810; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2825 = _T_2726 | _T_2187; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2832 = _T_2825 | _T_2194; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2833 = _T_2150 & _T_2832; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2847 = _T_2748 | _T_2212; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2854 = _T_2847 | _T_2219; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2855 = _T_2150 & _T_2854; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2869 = _T_2770 | _T_2237; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2876 = _T_2869 | _T_2244; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2877 = _T_2150 & _T_2876; // @[el2_lsu_bus_buffer.scala 439:114]
  wire [3:0] buf_rspage_set_1 = {_T_2877,_T_2855,_T_2833,_T_2811}; // @[Cat.scala 29:58]
  wire  _T_2894 = _T_2704 | _T_2264; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2901 = _T_2894 | _T_2271; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2902 = _T_2252 & _T_2901; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2916 = _T_2726 | _T_2289; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2923 = _T_2916 | _T_2296; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2924 = _T_2252 & _T_2923; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2938 = _T_2748 | _T_2314; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2945 = _T_2938 | _T_2321; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2946 = _T_2252 & _T_2945; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_2960 = _T_2770 | _T_2339; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2967 = _T_2960 | _T_2346; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2968 = _T_2252 & _T_2967; // @[el2_lsu_bus_buffer.scala 439:114]
  wire [3:0] buf_rspage_set_2 = {_T_2968,_T_2946,_T_2924,_T_2902}; // @[Cat.scala 29:58]
  wire  _T_2985 = _T_2704 | _T_2366; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_2992 = _T_2985 | _T_2373; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_2993 = _T_2354 & _T_2992; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_3007 = _T_2726 | _T_2391; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_3014 = _T_3007 | _T_2398; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_3015 = _T_2354 & _T_3014; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_3029 = _T_2748 | _T_2416; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_3036 = _T_3029 | _T_2423; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_3037 = _T_2354 & _T_3036; // @[el2_lsu_bus_buffer.scala 439:114]
  wire  _T_3051 = _T_2770 | _T_2441; // @[el2_lsu_bus_buffer.scala 440:61]
  wire  _T_3058 = _T_3051 | _T_2448; // @[el2_lsu_bus_buffer.scala 441:112]
  wire  _T_3059 = _T_2354 & _T_3058; // @[el2_lsu_bus_buffer.scala 439:114]
  wire [3:0] buf_rspage_set_3 = {_T_3059,_T_3037,_T_3015,_T_2993}; // @[Cat.scala 29:58]
  wire  _T_3144 = _T_2768 | _T_1812; // @[el2_lsu_bus_buffer.scala 444:112]
  wire  _T_3145 = ~_T_3144; // @[el2_lsu_bus_buffer.scala 444:86]
  wire  _T_3146 = buf_rspageQ_0[3] & _T_3145; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3138 = _T_2746 | _T_1801; // @[el2_lsu_bus_buffer.scala 444:112]
  wire  _T_3139 = ~_T_3138; // @[el2_lsu_bus_buffer.scala 444:86]
  wire  _T_3140 = buf_rspageQ_0[2] & _T_3139; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3132 = _T_2724 | _T_1790; // @[el2_lsu_bus_buffer.scala 444:112]
  wire  _T_3133 = ~_T_3132; // @[el2_lsu_bus_buffer.scala 444:86]
  wire  _T_3134 = buf_rspageQ_0[1] & _T_3133; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3126 = _T_2702 | _T_1779; // @[el2_lsu_bus_buffer.scala 444:112]
  wire  _T_3127 = ~_T_3126; // @[el2_lsu_bus_buffer.scala 444:86]
  wire  _T_3128 = buf_rspageQ_0[0] & _T_3127; // @[el2_lsu_bus_buffer.scala 444:84]
  wire [3:0] buf_rspage_0 = {_T_3146,_T_3140,_T_3134,_T_3128}; // @[Cat.scala 29:58]
  wire  _T_3065 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3068 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3071 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3074 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire [2:0] _T_3076 = {_T_3074,_T_3071,_T_3068}; // @[Cat.scala 29:58]
  wire  _T_3173 = buf_rspageQ_1[3] & _T_3145; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3167 = buf_rspageQ_1[2] & _T_3139; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3161 = buf_rspageQ_1[1] & _T_3133; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3155 = buf_rspageQ_1[0] & _T_3127; // @[el2_lsu_bus_buffer.scala 444:84]
  wire [3:0] buf_rspage_1 = {_T_3173,_T_3167,_T_3161,_T_3155}; // @[Cat.scala 29:58]
  wire  _T_3080 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3083 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3086 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3089 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire [2:0] _T_3091 = {_T_3089,_T_3086,_T_3083}; // @[Cat.scala 29:58]
  wire  _T_3200 = buf_rspageQ_2[3] & _T_3145; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3194 = buf_rspageQ_2[2] & _T_3139; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3188 = buf_rspageQ_2[1] & _T_3133; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3182 = buf_rspageQ_2[0] & _T_3127; // @[el2_lsu_bus_buffer.scala 444:84]
  wire [3:0] buf_rspage_2 = {_T_3200,_T_3194,_T_3188,_T_3182}; // @[Cat.scala 29:58]
  wire  _T_3095 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3098 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3101 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3104 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire [2:0] _T_3106 = {_T_3104,_T_3101,_T_3098}; // @[Cat.scala 29:58]
  wire  _T_3227 = buf_rspageQ_3[3] & _T_3145; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3221 = buf_rspageQ_3[2] & _T_3139; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3215 = buf_rspageQ_3[1] & _T_3133; // @[el2_lsu_bus_buffer.scala 444:84]
  wire  _T_3209 = buf_rspageQ_3[0] & _T_3127; // @[el2_lsu_bus_buffer.scala 444:84]
  wire [3:0] buf_rspage_3 = {_T_3227,_T_3221,_T_3215,_T_3209}; // @[Cat.scala 29:58]
  wire  _T_3110 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3113 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3116 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire  _T_3119 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 443:90]
  wire [2:0] _T_3121 = {_T_3119,_T_3116,_T_3113}; // @[Cat.scala 29:58]
  wire  _T_3232 = ibuf_drain_vld & _T_1780; // @[el2_lsu_bus_buffer.scala 449:65]
  wire  _T_3234 = ibuf_drain_vld & _T_1791; // @[el2_lsu_bus_buffer.scala 449:65]
  wire  _T_3236 = ibuf_drain_vld & _T_1802; // @[el2_lsu_bus_buffer.scala 449:65]
  wire  _T_3238 = ibuf_drain_vld & _T_1813; // @[el2_lsu_bus_buffer.scala 449:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3238,_T_3236,_T_3234,_T_3232}; // @[Cat.scala 29:58]
  wire  _T_3246 = _T_3440 & _T_1785; // @[el2_lsu_bus_buffer.scala 450:123]
  wire [3:0] _T_3249 = _T_3246 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 450:96]
  wire [3:0] _T_3250 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3249; // @[el2_lsu_bus_buffer.scala 450:48]
  wire  _T_3255 = _T_3440 & _T_1796; // @[el2_lsu_bus_buffer.scala 450:123]
  wire [3:0] _T_3258 = _T_3255 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 450:96]
  wire [3:0] _T_3259 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3258; // @[el2_lsu_bus_buffer.scala 450:48]
  wire  _T_3264 = _T_3440 & _T_1807; // @[el2_lsu_bus_buffer.scala 450:123]
  wire [3:0] _T_3267 = _T_3264 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 450:96]
  wire [3:0] _T_3268 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3267; // @[el2_lsu_bus_buffer.scala 450:48]
  wire  _T_3273 = _T_3440 & _T_1818; // @[el2_lsu_bus_buffer.scala 450:123]
  wire [3:0] _T_3276 = _T_3273 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 450:96]
  wire [3:0] _T_3277 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3276; // @[el2_lsu_bus_buffer.scala 450:48]
  wire  _T_3303 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 452:47]
  wire  _T_3305 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 452:47]
  wire  _T_3307 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 452:47]
  wire  _T_3309 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 452:47]
  wire [3:0] buf_dual_in = {_T_3309,_T_3307,_T_3305,_T_3303}; // @[Cat.scala 29:58]
  wire  _T_3314 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 453:49]
  wire  _T_3316 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 453:49]
  wire  _T_3318 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 453:49]
  wire  _T_3320 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 453:49]
  wire [3:0] buf_samedw_in = {_T_3320,_T_3318,_T_3316,_T_3314}; // @[Cat.scala 29:58]
  wire  _T_3325 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 454:86]
  wire  _T_3326 = ibuf_drainvec_vld[0] ? _T_3325 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 454:50]
  wire  _T_3329 = ibuf_drainvec_vld[1] ? _T_3325 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 454:50]
  wire  _T_3332 = ibuf_drainvec_vld[2] ? _T_3325 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 454:50]
  wire  _T_3335 = ibuf_drainvec_vld[3] ? _T_3325 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 454:50]
  wire [3:0] buf_nomerge_in = {_T_3335,_T_3332,_T_3329,_T_3326}; // @[Cat.scala 29:58]
  wire  _T_3343 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3246; // @[el2_lsu_bus_buffer.scala 455:49]
  wire  _T_3348 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3255; // @[el2_lsu_bus_buffer.scala 455:49]
  wire  _T_3353 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3264; // @[el2_lsu_bus_buffer.scala 455:49]
  wire  _T_3358 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3273; // @[el2_lsu_bus_buffer.scala 455:49]
  wire [3:0] buf_dualhi_in = {_T_3358,_T_3353,_T_3348,_T_3343}; // @[Cat.scala 29:58]
  wire  _T_3387 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 457:53]
  wire  _T_3389 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 457:53]
  wire  _T_3391 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 457:53]
  wire  _T_3393 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 457:53]
  wire [3:0] buf_sideeffect_in = {_T_3393,_T_3391,_T_3389,_T_3387}; // @[Cat.scala 29:58]
  wire  _T_3398 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 458:49]
  wire  _T_3400 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 458:49]
  wire  _T_3402 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 458:49]
  wire  _T_3404 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 458:49]
  wire [3:0] buf_unsign_in = {_T_3404,_T_3402,_T_3400,_T_3398}; // @[Cat.scala 29:58]
  wire  _T_3421 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 460:48]
  wire  _T_3423 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 460:48]
  wire  _T_3425 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 460:48]
  wire  _T_3427 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 460:48]
  wire [3:0] buf_write_in = {_T_3427,_T_3425,_T_3423,_T_3421}; // @[Cat.scala 29:58]
  wire [31:0] _T_3453 = _T_3446 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 469:30]
  wire  _T_3460 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 476:89]
  wire  _T_3462 = _T_3460 & _T_1277; // @[el2_lsu_bus_buffer.scala 476:104]
  wire  _T_3475 = buf_state_en_0 & _T_1130; // @[el2_lsu_bus_buffer.scala 481:44]
  wire  _T_3476 = _T_3475 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:60]
  wire  _T_3478 = _T_3476 & _T_1259; // @[el2_lsu_bus_buffer.scala 481:74]
  wire  _T_3481 = _T_3471 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 483:67]
  wire  _T_3482 = _T_3481 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 483:81]
  wire  _T_4779 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 585:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4779; // @[el2_lsu_bus_buffer.scala 585:38]
  wire  _T_3485 = _T_3481 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 484:82]
  wire [31:0] _T_3490 = buf_addr_0[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3560 = bus_rsp_read_error & _T_3539; // @[el2_lsu_bus_buffer.scala 498:91]
  wire  _T_3562 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 499:31]
  wire  _T_3564 = _T_3562 & _T_3541; // @[el2_lsu_bus_buffer.scala 499:46]
  wire  _T_3565 = _T_3560 | _T_3564; // @[el2_lsu_bus_buffer.scala 498:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4779; // @[el2_lsu_bus_buffer.scala 584:40]
  wire  _T_3568 = bus_rsp_write_error & _T_3537; // @[el2_lsu_bus_buffer.scala 500:53]
  wire  _T_3569 = _T_3565 | _T_3568; // @[el2_lsu_bus_buffer.scala 499:88]
  wire  _T_3570 = _T_3471 & _T_3569; // @[el2_lsu_bus_buffer.scala 498:68]
  wire  _GEN_46 = _T_3492 & _T_3570; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3458 ? _T_3485 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3454 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3431 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire [31:0] _T_3491 = buf_error_en_0 ? io_lsu_axi_rdata[31:0] : _T_3490; // @[el2_lsu_bus_buffer.scala 485:30]
  wire  _T_3495 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 488:73]
  wire  _T_3496 = buf_write[0] & _T_3495; // @[el2_lsu_bus_buffer.scala 488:71]
  wire  _T_3497 = io_dec_tlu_force_halt | _T_3496; // @[el2_lsu_bus_buffer.scala 488:55]
  wire  _T_3499 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 489:30]
  wire  _T_3500 = buf_dual_0 & _T_3499; // @[el2_lsu_bus_buffer.scala 489:28]
  wire  _T_3503 = _T_3500 & _T_1130; // @[el2_lsu_bus_buffer.scala 489:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_3504 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_3505 = _T_3503 & _T_3504; // @[el2_lsu_bus_buffer.scala 489:61]
  wire  _T_4405 = _T_2649 | _T_2646; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  _T_4406 = _T_4405 | _T_2643; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  any_done_wait_state = _T_4406 | _T_2640; // @[el2_lsu_bus_buffer.scala 546:93]
  wire  _T_3507 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:31]
  wire  _T_3513 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3515 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3517 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3519 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3521 = _T_3513 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3522 = _T_3515 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3523 = _T_3517 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3524 = _T_3519 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3525 = _T_3521 | _T_3522; // @[Mux.scala 27:72]
  wire  _T_3526 = _T_3525 | _T_3523; // @[Mux.scala 27:72]
  wire  _T_3527 = _T_3526 | _T_3524; // @[Mux.scala 27:72]
  wire  _T_3529 = _T_3503 & _T_3527; // @[el2_lsu_bus_buffer.scala 490:101]
  wire  _T_3530 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 490:167]
  wire  _T_3531 = _T_3529 & _T_3530; // @[el2_lsu_bus_buffer.scala 490:138]
  wire  _T_3532 = _T_3531 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:187]
  wire  _T_3533 = _T_3507 | _T_3532; // @[el2_lsu_bus_buffer.scala 490:53]
  wire  _T_3556 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 497:47]
  wire  _T_3557 = _T_3556 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 497:62]
  wire  _T_3571 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 501:50]
  wire  _T_3572 = buf_state_en_0 & _T_3571; // @[el2_lsu_bus_buffer.scala 501:48]
  wire [31:0] _T_3578 = _T_3572 ? _T_3490 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 501:30]
  wire  _T_3584 = buf_ldfwd[0] | _T_3589[0]; // @[el2_lsu_bus_buffer.scala 504:90]
  wire  _T_3585 = _T_3584 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 504:118]
  wire  _GEN_29 = _T_3605 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3597 ? 1'h0 : _T_3605; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3597 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3579 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3579 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3492 & _T_3557; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_47 = _T_3492 ? _T_3578 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3492 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3492 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3458 ? _T_3478 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3458 ? _T_3482 : _GEN_45; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_60 = _T_3458 ? _T_3491 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3458 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3454 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3454 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_72 = _T_3454 ? 32'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3454 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3431 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_79 = _T_3431 ? _T_3453 : _GEN_72; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3431 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3431 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire [31:0] _T_3646 = _T_3639 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 469:30]
  wire  _T_3668 = buf_state_en_1 & _T_3739; // @[el2_lsu_bus_buffer.scala 481:44]
  wire  _T_3669 = _T_3668 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:60]
  wire  _T_3671 = _T_3669 & _T_1259; // @[el2_lsu_bus_buffer.scala 481:74]
  wire  _T_3674 = _T_3664 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 483:67]
  wire  _T_3675 = _T_3674 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 483:81]
  wire  _T_3678 = _T_3674 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 484:82]
  wire [31:0] _T_3683 = buf_addr_1[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3753 = bus_rsp_read_error & _T_3732; // @[el2_lsu_bus_buffer.scala 498:91]
  wire  _T_3755 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 499:31]
  wire  _T_3757 = _T_3755 & _T_3734; // @[el2_lsu_bus_buffer.scala 499:46]
  wire  _T_3758 = _T_3753 | _T_3757; // @[el2_lsu_bus_buffer.scala 498:143]
  wire  _T_3761 = bus_rsp_write_error & _T_3730; // @[el2_lsu_bus_buffer.scala 500:53]
  wire  _T_3762 = _T_3758 | _T_3761; // @[el2_lsu_bus_buffer.scala 499:88]
  wire  _T_3763 = _T_3664 & _T_3762; // @[el2_lsu_bus_buffer.scala 498:68]
  wire  _GEN_122 = _T_3685 & _T_3763; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3651 ? _T_3678 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3647 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3624 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire [31:0] _T_3684 = buf_error_en_1 ? io_lsu_axi_rdata[31:0] : _T_3683; // @[el2_lsu_bus_buffer.scala 485:30]
  wire  _T_3689 = buf_write[1] & _T_3495; // @[el2_lsu_bus_buffer.scala 488:71]
  wire  _T_3690 = io_dec_tlu_force_halt | _T_3689; // @[el2_lsu_bus_buffer.scala 488:55]
  wire  _T_3692 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 489:30]
  wire  _T_3693 = buf_dual_1 & _T_3692; // @[el2_lsu_bus_buffer.scala 489:28]
  wire  _T_3696 = _T_3693 & _T_3739; // @[el2_lsu_bus_buffer.scala 489:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_3697 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_3698 = _T_3696 & _T_3697; // @[el2_lsu_bus_buffer.scala 489:61]
  wire  _T_3700 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:31]
  wire  _T_3706 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3708 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3710 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3712 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3714 = _T_3706 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3715 = _T_3708 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3716 = _T_3710 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3717 = _T_3712 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3718 = _T_3714 | _T_3715; // @[Mux.scala 27:72]
  wire  _T_3719 = _T_3718 | _T_3716; // @[Mux.scala 27:72]
  wire  _T_3720 = _T_3719 | _T_3717; // @[Mux.scala 27:72]
  wire  _T_3722 = _T_3696 & _T_3720; // @[el2_lsu_bus_buffer.scala 490:101]
  wire  _T_3723 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 490:167]
  wire  _T_3724 = _T_3722 & _T_3723; // @[el2_lsu_bus_buffer.scala 490:138]
  wire  _T_3725 = _T_3724 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:187]
  wire  _T_3726 = _T_3700 | _T_3725; // @[el2_lsu_bus_buffer.scala 490:53]
  wire  _T_3749 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 497:47]
  wire  _T_3750 = _T_3749 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 497:62]
  wire  _T_3764 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 501:50]
  wire  _T_3765 = buf_state_en_1 & _T_3764; // @[el2_lsu_bus_buffer.scala 501:48]
  wire [31:0] _T_3771 = _T_3765 ? _T_3683 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 501:30]
  wire  _T_3777 = buf_ldfwd[1] | _T_3782[0]; // @[el2_lsu_bus_buffer.scala 504:90]
  wire  _T_3778 = _T_3777 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 504:118]
  wire  _GEN_105 = _T_3798 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3790 ? 1'h0 : _T_3798; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3790 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3772 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3772 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3685 & _T_3750; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_123 = _T_3685 ? _T_3771 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3685 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3685 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3651 ? _T_3671 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3651 ? _T_3675 : _GEN_121; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_136 = _T_3651 ? _T_3684 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3651 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3647 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3647 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_148 = _T_3647 ? 32'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3647 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3624 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_155 = _T_3624 ? _T_3646 : _GEN_148; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3624 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3624 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire [31:0] _T_3839 = _T_3832 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 469:30]
  wire  _T_3861 = buf_state_en_2 & _T_3932; // @[el2_lsu_bus_buffer.scala 481:44]
  wire  _T_3862 = _T_3861 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:60]
  wire  _T_3864 = _T_3862 & _T_1259; // @[el2_lsu_bus_buffer.scala 481:74]
  wire  _T_3867 = _T_3857 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 483:67]
  wire  _T_3868 = _T_3867 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 483:81]
  wire  _T_3871 = _T_3867 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 484:82]
  wire [31:0] _T_3876 = buf_addr_2[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_3946 = bus_rsp_read_error & _T_3925; // @[el2_lsu_bus_buffer.scala 498:91]
  wire  _T_3948 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 499:31]
  wire  _T_3950 = _T_3948 & _T_3927; // @[el2_lsu_bus_buffer.scala 499:46]
  wire  _T_3951 = _T_3946 | _T_3950; // @[el2_lsu_bus_buffer.scala 498:143]
  wire  _T_3954 = bus_rsp_write_error & _T_3923; // @[el2_lsu_bus_buffer.scala 500:53]
  wire  _T_3955 = _T_3951 | _T_3954; // @[el2_lsu_bus_buffer.scala 499:88]
  wire  _T_3956 = _T_3857 & _T_3955; // @[el2_lsu_bus_buffer.scala 498:68]
  wire  _GEN_198 = _T_3878 & _T_3956; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3844 ? _T_3871 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3840 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3817 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire [31:0] _T_3877 = buf_error_en_2 ? io_lsu_axi_rdata[31:0] : _T_3876; // @[el2_lsu_bus_buffer.scala 485:30]
  wire  _T_3882 = buf_write[2] & _T_3495; // @[el2_lsu_bus_buffer.scala 488:71]
  wire  _T_3883 = io_dec_tlu_force_halt | _T_3882; // @[el2_lsu_bus_buffer.scala 488:55]
  wire  _T_3885 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 489:30]
  wire  _T_3886 = buf_dual_2 & _T_3885; // @[el2_lsu_bus_buffer.scala 489:28]
  wire  _T_3889 = _T_3886 & _T_3932; // @[el2_lsu_bus_buffer.scala 489:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_3890 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_3891 = _T_3889 & _T_3890; // @[el2_lsu_bus_buffer.scala 489:61]
  wire  _T_3893 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:31]
  wire  _T_3899 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3901 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3903 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3905 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_3907 = _T_3899 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3908 = _T_3901 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3909 = _T_3903 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3910 = _T_3905 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3911 = _T_3907 | _T_3908; // @[Mux.scala 27:72]
  wire  _T_3912 = _T_3911 | _T_3909; // @[Mux.scala 27:72]
  wire  _T_3913 = _T_3912 | _T_3910; // @[Mux.scala 27:72]
  wire  _T_3915 = _T_3889 & _T_3913; // @[el2_lsu_bus_buffer.scala 490:101]
  wire  _T_3916 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 490:167]
  wire  _T_3917 = _T_3915 & _T_3916; // @[el2_lsu_bus_buffer.scala 490:138]
  wire  _T_3918 = _T_3917 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:187]
  wire  _T_3919 = _T_3893 | _T_3918; // @[el2_lsu_bus_buffer.scala 490:53]
  wire  _T_3942 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 497:47]
  wire  _T_3943 = _T_3942 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 497:62]
  wire  _T_3957 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 501:50]
  wire  _T_3958 = buf_state_en_2 & _T_3957; // @[el2_lsu_bus_buffer.scala 501:48]
  wire [31:0] _T_3964 = _T_3958 ? _T_3876 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 501:30]
  wire  _T_3970 = buf_ldfwd[2] | _T_3975[0]; // @[el2_lsu_bus_buffer.scala 504:90]
  wire  _T_3971 = _T_3970 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 504:118]
  wire  _GEN_181 = _T_3991 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_3983 ? 1'h0 : _T_3991; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_3983 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_3965 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_3965 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3878 & _T_3943; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_199 = _T_3878 ? _T_3964 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3878 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3878 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3844 ? _T_3864 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3844 ? _T_3868 : _GEN_197; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_212 = _T_3844 ? _T_3877 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3844 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3840 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3840 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_224 = _T_3840 ? 32'h0 : _GEN_212; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3840 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3817 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_231 = _T_3817 ? _T_3839 : _GEN_224; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3817 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3817 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire [31:0] _T_4032 = _T_4025 ? ibuf_data_out : store_data_lo_r; // @[el2_lsu_bus_buffer.scala 469:30]
  wire  _T_4054 = buf_state_en_3 & _T_4125; // @[el2_lsu_bus_buffer.scala 481:44]
  wire  _T_4055 = _T_4054 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 481:60]
  wire  _T_4057 = _T_4055 & _T_1259; // @[el2_lsu_bus_buffer.scala 481:74]
  wire  _T_4060 = _T_4050 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 483:67]
  wire  _T_4061 = _T_4060 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 483:81]
  wire  _T_4064 = _T_4060 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 484:82]
  wire [31:0] _T_4069 = buf_addr_3[2] ? io_lsu_axi_rdata[63:32] : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 485:73]
  wire  _T_4139 = bus_rsp_read_error & _T_4118; // @[el2_lsu_bus_buffer.scala 498:91]
  wire  _T_4141 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 499:31]
  wire  _T_4143 = _T_4141 & _T_4120; // @[el2_lsu_bus_buffer.scala 499:46]
  wire  _T_4144 = _T_4139 | _T_4143; // @[el2_lsu_bus_buffer.scala 498:143]
  wire  _T_4147 = bus_rsp_write_error & _T_4116; // @[el2_lsu_bus_buffer.scala 500:53]
  wire  _T_4148 = _T_4144 | _T_4147; // @[el2_lsu_bus_buffer.scala 499:88]
  wire  _T_4149 = _T_4050 & _T_4148; // @[el2_lsu_bus_buffer.scala 498:68]
  wire  _GEN_274 = _T_4071 & _T_4149; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4037 ? _T_4064 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4033 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4010 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire [31:0] _T_4070 = buf_error_en_3 ? io_lsu_axi_rdata[31:0] : _T_4069; // @[el2_lsu_bus_buffer.scala 485:30]
  wire  _T_4075 = buf_write[3] & _T_3495; // @[el2_lsu_bus_buffer.scala 488:71]
  wire  _T_4076 = io_dec_tlu_force_halt | _T_4075; // @[el2_lsu_bus_buffer.scala 488:55]
  wire  _T_4078 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 489:30]
  wire  _T_4079 = buf_dual_3 & _T_4078; // @[el2_lsu_bus_buffer.scala 489:28]
  wire  _T_4082 = _T_4079 & _T_4125; // @[el2_lsu_bus_buffer.scala 489:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 489:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_4083 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 489:90]
  wire  _T_4084 = _T_4082 & _T_4083; // @[el2_lsu_bus_buffer.scala 489:61]
  wire  _T_4086 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:31]
  wire  _T_4092 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4094 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4096 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4098 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 110:118]
  wire  _T_4100 = _T_4092 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4101 = _T_4094 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4102 = _T_4096 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4103 = _T_4098 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4104 = _T_4100 | _T_4101; // @[Mux.scala 27:72]
  wire  _T_4105 = _T_4104 | _T_4102; // @[Mux.scala 27:72]
  wire  _T_4106 = _T_4105 | _T_4103; // @[Mux.scala 27:72]
  wire  _T_4108 = _T_4082 & _T_4106; // @[el2_lsu_bus_buffer.scala 490:101]
  wire  _T_4109 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 490:167]
  wire  _T_4110 = _T_4108 & _T_4109; // @[el2_lsu_bus_buffer.scala 490:138]
  wire  _T_4111 = _T_4110 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 490:187]
  wire  _T_4112 = _T_4086 | _T_4111; // @[el2_lsu_bus_buffer.scala 490:53]
  wire  _T_4135 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 497:47]
  wire  _T_4136 = _T_4135 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 497:62]
  wire  _T_4150 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 501:50]
  wire  _T_4151 = buf_state_en_3 & _T_4150; // @[el2_lsu_bus_buffer.scala 501:48]
  wire [31:0] _T_4157 = _T_4151 ? _T_4069 : io_lsu_axi_rdata[31:0]; // @[el2_lsu_bus_buffer.scala 501:30]
  wire  _T_4163 = buf_ldfwd[3] | _T_4168[0]; // @[el2_lsu_bus_buffer.scala 504:90]
  wire  _T_4164 = _T_4163 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 504:118]
  wire  _GEN_257 = _T_4184 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4176 ? 1'h0 : _T_4184; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4176 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4158 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4158 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4071 & _T_4136; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_275 = _T_4071 ? _T_4157 : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4071 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4071 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4037 ? _T_4057 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4037 ? _T_4061 : _GEN_273; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_288 = _T_4037 ? _T_4070 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4037 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4033 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4033 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_300 = _T_4033 ? 32'h0 : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4033 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4010 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_307 = _T_4010 ? _T_4032 : _GEN_300; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4010 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4010 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4239; // @[Reg.scala 27:20]
  reg  _T_4242; // @[Reg.scala 27:20]
  reg  _T_4245; // @[Reg.scala 27:20]
  reg  _T_4248; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4248,_T_4245,_T_4242,_T_4239}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3250[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 450:19]
  wire [2:0] buf_byteen_in_1 = _T_3259[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 450:19]
  wire [2:0] buf_byteen_in_2 = _T_3268[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 450:19]
  wire [2:0] buf_byteen_in_3 = _T_3277[2:0]; // @[el2_lsu_bus_buffer.scala 170:27 el2_lsu_bus_buffer.scala 171:17 el2_lsu_bus_buffer.scala 450:19]
  reg  _T_4314; // @[el2_lsu_bus_buffer.scala 540:82]
  reg  _T_4309; // @[el2_lsu_bus_buffer.scala 540:82]
  reg  _T_4304; // @[el2_lsu_bus_buffer.scala 540:82]
  reg  _T_4299; // @[el2_lsu_bus_buffer.scala 540:82]
  wire [3:0] buf_error = {_T_4314,_T_4309,_T_4304,_T_4299}; // @[Cat.scala 29:58]
  wire  _T_4296 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 540:86]
  wire  _T_4297 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 540:128]
  wire  _T_4301 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 540:86]
  wire  _T_4302 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 540:128]
  wire  _T_4306 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 540:86]
  wire  _T_4307 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 540:128]
  wire  _T_4311 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 540:86]
  wire  _T_4312 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 540:128]
  wire [1:0] _T_4322 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 542:96]
  wire [1:0] _GEN_415 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 542:96]
  wire [2:0] _T_4323 = _T_4322 + _GEN_415; // @[el2_lsu_bus_buffer.scala 542:96]
  wire [2:0] _GEN_416 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 542:96]
  wire [3:0] buf_numvld_any = _T_4323 + _GEN_416; // @[el2_lsu_bus_buffer.scala 542:96]
  wire  _T_4409 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 548:52]
  wire  _T_4410 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 548:92]
  wire  _T_4411 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 548:119]
  wire  _T_4413 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 549:52]
  wire  _T_4414 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 549:52]
  wire  _T_4415 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 549:52]
  wire  _T_4416 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 549:52]
  wire  _T_4417 = _T_4413 | _T_4414; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4418 = _T_4417 | _T_4415; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4419 = _T_4418 | _T_4416; // @[el2_lsu_bus_buffer.scala 549:65]
  wire  _T_4420 = ~_T_4419; // @[el2_lsu_bus_buffer.scala 549:34]
  wire  _T_4422 = _T_4420 & _T_765; // @[el2_lsu_bus_buffer.scala 549:70]
  wire  _T_4425 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 551:51]
  wire  _T_4426 = _T_4425 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 551:72]
  wire  _T_4427 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 551:94]
  wire  _T_4428 = _T_4426 & _T_4427; // @[el2_lsu_bus_buffer.scala 551:92]
  wire  _T_4429 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 551:111]
  wire  _T_4431 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 554:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 638:66]
  wire  _T_4449 = _T_2702 & _T_1130; // @[Mux.scala 27:72]
  wire  _T_4450 = _T_2724 & _T_3739; // @[Mux.scala 27:72]
  wire  _T_4451 = _T_2746 & _T_3932; // @[Mux.scala 27:72]
  wire  _T_4452 = _T_2768 & _T_4125; // @[Mux.scala 27:72]
  wire  _T_4453 = _T_4449 | _T_4450; // @[Mux.scala 27:72]
  wire  _T_4454 = _T_4453 | _T_4451; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4454 | _T_4452; // @[Mux.scala 27:72]
  wire  _T_4460 = buf_error[0] & _T_1130; // @[el2_lsu_bus_buffer.scala 557:108]
  wire  _T_4465 = buf_error[1] & _T_3739; // @[el2_lsu_bus_buffer.scala 557:108]
  wire  _T_4470 = buf_error[2] & _T_3932; // @[el2_lsu_bus_buffer.scala 557:108]
  wire  _T_4475 = buf_error[3] & _T_4125; // @[el2_lsu_bus_buffer.scala 557:108]
  wire  _T_4476 = _T_2702 & _T_4460; // @[Mux.scala 27:72]
  wire  _T_4477 = _T_2724 & _T_4465; // @[Mux.scala 27:72]
  wire  _T_4478 = _T_2746 & _T_4470; // @[Mux.scala 27:72]
  wire  _T_4479 = _T_2768 & _T_4475; // @[Mux.scala 27:72]
  wire  _T_4480 = _T_4476 | _T_4477; // @[Mux.scala 27:72]
  wire  _T_4481 = _T_4480 | _T_4478; // @[Mux.scala 27:72]
  wire  _T_4488 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 558:109]
  wire  _T_4489 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 558:124]
  wire  _T_4490 = _T_4488 | _T_4489; // @[el2_lsu_bus_buffer.scala 558:122]
  wire  _T_4491 = _T_4449 & _T_4490; // @[el2_lsu_bus_buffer.scala 558:106]
  wire  _T_4496 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 558:109]
  wire  _T_4497 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 558:124]
  wire  _T_4498 = _T_4496 | _T_4497; // @[el2_lsu_bus_buffer.scala 558:122]
  wire  _T_4499 = _T_4450 & _T_4498; // @[el2_lsu_bus_buffer.scala 558:106]
  wire  _T_4504 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 558:109]
  wire  _T_4505 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 558:124]
  wire  _T_4506 = _T_4504 | _T_4505; // @[el2_lsu_bus_buffer.scala 558:122]
  wire  _T_4507 = _T_4451 & _T_4506; // @[el2_lsu_bus_buffer.scala 558:106]
  wire  _T_4512 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 558:109]
  wire  _T_4513 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 558:124]
  wire  _T_4514 = _T_4512 | _T_4513; // @[el2_lsu_bus_buffer.scala 558:122]
  wire  _T_4515 = _T_4452 & _T_4514; // @[el2_lsu_bus_buffer.scala 558:106]
  wire [1:0] _T_4518 = _T_4507 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4519 = _T_4515 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_417 = {{1'd0}, _T_4499}; // @[Mux.scala 27:72]
  wire [1:0] _T_4521 = _GEN_417 | _T_4518; // @[Mux.scala 27:72]
  wire [31:0] _T_4556 = _T_4491 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4557 = _T_4499 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4558 = _T_4507 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4559 = _T_4515 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4560 = _T_4556 | _T_4557; // @[Mux.scala 27:72]
  wire [31:0] _T_4561 = _T_4560 | _T_4558; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4561 | _T_4559; // @[Mux.scala 27:72]
  wire  _T_4567 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 560:120]
  wire  _T_4568 = _T_4449 & _T_4567; // @[el2_lsu_bus_buffer.scala 560:105]
  wire  _T_4573 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 560:120]
  wire  _T_4574 = _T_4450 & _T_4573; // @[el2_lsu_bus_buffer.scala 560:105]
  wire  _T_4579 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 560:120]
  wire  _T_4580 = _T_4451 & _T_4579; // @[el2_lsu_bus_buffer.scala 560:105]
  wire  _T_4585 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 560:120]
  wire  _T_4586 = _T_4452 & _T_4585; // @[el2_lsu_bus_buffer.scala 560:105]
  wire [31:0] _T_4587 = _T_4568 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4588 = _T_4574 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4589 = _T_4580 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4590 = _T_4586 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4591 = _T_4587 | _T_4588; // @[Mux.scala 27:72]
  wire [31:0] _T_4592 = _T_4591 | _T_4589; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4592 | _T_4590; // @[Mux.scala 27:72]
  wire  _T_4594 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4595 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4596 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 111:123]
  wire  _T_4597 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4598 = _T_4594 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4599 = _T_4595 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4600 = _T_4596 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4601 = _T_4597 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4602 = _T_4598 | _T_4599; // @[Mux.scala 27:72]
  wire [31:0] _T_4603 = _T_4602 | _T_4600; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_addr_offset = _T_4603 | _T_4601; // @[Mux.scala 27:72]
  wire [1:0] _T_4609 = _T_4594 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4610 = _T_4595 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4611 = _T_4596 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4612 = _T_4597 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4613 = _T_4609 | _T_4610; // @[Mux.scala 27:72]
  wire [1:0] _T_4614 = _T_4613 | _T_4611; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4614 | _T_4612; // @[Mux.scala 27:72]
  wire  _T_4624 = _T_4594 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4625 = _T_4595 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4626 = _T_4596 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4627 = _T_4597 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4628 = _T_4624 | _T_4625; // @[Mux.scala 27:72]
  wire  _T_4629 = _T_4628 | _T_4626; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4629 | _T_4627; // @[Mux.scala 27:72]
  wire [63:0] _T_4649 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [35:0] _T_4650 = lsu_nonblock_addr_offset * 32'h8; // @[el2_lsu_bus_buffer.scala 565:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4649 >> _T_4650; // @[el2_lsu_bus_buffer.scala 565:92]
  wire  _T_4651 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 566:69]
  wire  _T_4653 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 567:81]
  wire  _T_4654 = lsu_nonblock_unsign & _T_4653; // @[el2_lsu_bus_buffer.scala 567:63]
  wire [31:0] _T_4656 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4657 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 568:45]
  wire  _T_4658 = lsu_nonblock_unsign & _T_4657; // @[el2_lsu_bus_buffer.scala 568:26]
  wire [31:0] _T_4660 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4661 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 569:6]
  wire  _T_4663 = _T_4661 & _T_4653; // @[el2_lsu_bus_buffer.scala 569:27]
  wire [23:0] _T_4666 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4668 = {_T_4666,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4671 = _T_4661 & _T_4657; // @[el2_lsu_bus_buffer.scala 570:27]
  wire [15:0] _T_4674 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4676 = {_T_4674,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4677 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 571:21]
  wire [31:0] _T_4678 = _T_4654 ? _T_4656 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4679 = _T_4658 ? _T_4660 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4680 = _T_4663 ? _T_4668 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4681 = _T_4671 ? _T_4676 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4682 = _T_4677 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4683 = _T_4678 | _T_4679; // @[Mux.scala 27:72]
  wire [31:0] _T_4684 = _T_4683 | _T_4680; // @[Mux.scala 27:72]
  wire [31:0] _T_4685 = _T_4684 | _T_4681; // @[Mux.scala 27:72]
  wire [63:0] _GEN_418 = {{32'd0}, _T_4685}; // @[Mux.scala 27:72]
  wire [63:0] _T_4686 = _GEN_418 | _T_4682; // @[Mux.scala 27:72]
  wire  _T_4781 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 589:36]
  wire  _T_4782 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 589:51]
  wire  _T_4783 = _T_4781 & _T_4782; // @[el2_lsu_bus_buffer.scala 589:49]
  wire [31:0] _T_4787 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4789 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4794 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 601:50]
  wire  _T_4795 = _T_4781 & _T_4794; // @[el2_lsu_bus_buffer.scala 601:48]
  wire [7:0] _T_4799 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4802 = obuf_valid & _T_1269; // @[el2_lsu_bus_buffer.scala 606:36]
  wire  _T_4804 = _T_4802 & _T_1275; // @[el2_lsu_bus_buffer.scala 606:50]
  wire  _T_4816 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 619:114]
  wire  _T_4818 = _T_4816 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 619:129]
  wire  _T_4821 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 619:114]
  wire  _T_4823 = _T_4821 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 619:129]
  wire  _T_4826 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 619:114]
  wire  _T_4828 = _T_4826 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 619:129]
  wire  _T_4831 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 619:114]
  wire  _T_4833 = _T_4831 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 619:129]
  wire  _T_4834 = _T_2702 & _T_4818; // @[Mux.scala 27:72]
  wire  _T_4835 = _T_2724 & _T_4823; // @[Mux.scala 27:72]
  wire  _T_4836 = _T_2746 & _T_4828; // @[Mux.scala 27:72]
  wire  _T_4837 = _T_2768 & _T_4833; // @[Mux.scala 27:72]
  wire  _T_4838 = _T_4834 | _T_4835; // @[Mux.scala 27:72]
  wire  _T_4839 = _T_4838 | _T_4836; // @[Mux.scala 27:72]
  wire  _T_4849 = _T_2724 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 620:98]
  wire  lsu_imprecise_error_store_tag = _T_4849 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 620:113]
  wire  _T_4855 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 622:72]
  wire  _T_4857 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 111:123]
  wire [31:0] _T_4859 = _T_4857 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4860 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4861 = _T_4859 | _T_4860; // @[Mux.scala 27:72]
  wire  _T_4878 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 629:68]
  wire  _T_4881 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 630:48]
  wire  _T_4884 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 633:48]
  wire  _T_4885 = io_lsu_axi_awvalid & _T_4884; // @[el2_lsu_bus_buffer.scala 633:46]
  wire  _T_4886 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 633:92]
  wire  _T_4887 = io_lsu_axi_wvalid & _T_4886; // @[el2_lsu_bus_buffer.scala 633:90]
  wire  _T_4888 = _T_4885 | _T_4887; // @[el2_lsu_bus_buffer.scala 633:69]
  wire  _T_4889 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 633:136]
  wire  _T_4890 = io_lsu_axi_arvalid & _T_4889; // @[el2_lsu_bus_buffer.scala 633:134]
  wire  _T_4894 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 637:75]
  wire  _T_4895 = io_lsu_busreq_m & _T_4894; // @[el2_lsu_bus_buffer.scala 637:73]
  reg  _T_4898; // @[el2_lsu_bus_buffer.scala 637:56]
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
  assign io_lsu_busreq_r = _T_4898; // @[el2_lsu_bus_buffer.scala 637:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 547:30]
  assign io_lsu_bus_buffer_full_any = _T_4409 ? _T_4410 : _T_4411; // @[el2_lsu_bus_buffer.scala 548:30]
  assign io_lsu_bus_buffer_empty_any = _T_4422 & _T_1157; // @[el2_lsu_bus_buffer.scala 549:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 626:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 188:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 189:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 214:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 219:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4855; // @[el2_lsu_bus_buffer.scala 622:35]
  assign io_lsu_imprecise_error_store_any = _T_4839 | _T_4837; // @[el2_lsu_bus_buffer.scala 619:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4861 : lsu_nonblock_addr_offset; // @[el2_lsu_bus_buffer.scala 623:35]
  assign io_lsu_nonblock_load_valid_m = _T_4428 & _T_4429; // @[el2_lsu_bus_buffer.scala 551:32]
  assign io_lsu_nonblock_load_tag_m = _T_1789 ? 2'h0 : _T_1825; // @[el2_lsu_bus_buffer.scala 552:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4431; // @[el2_lsu_bus_buffer.scala 554:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 555:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4651; // @[el2_lsu_bus_buffer.scala 566:35]
  assign io_lsu_nonblock_load_data_error = _T_4481 | _T_4479; // @[el2_lsu_bus_buffer.scala 557:35]
  assign io_lsu_nonblock_load_data_tag = _T_4521 | _T_4519; // @[el2_lsu_bus_buffer.scala 558:33]
  assign io_lsu_nonblock_load_data = _T_4686[31:0]; // @[el2_lsu_bus_buffer.scala 567:29]
  assign io_lsu_pmu_bus_trxn = _T_4878 | _T_4773; // @[el2_lsu_bus_buffer.scala 629:23]
  assign io_lsu_pmu_bus_misaligned = _T_4881 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 630:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 631:24]
  assign io_lsu_pmu_bus_busy = _T_4888 | _T_4890; // @[el2_lsu_bus_buffer.scala 633:23]
  assign io_lsu_axi_awvalid = _T_4783 & _T_1165; // @[el2_lsu_bus_buffer.scala 589:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 590:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4787; // @[el2_lsu_bus_buffer.scala 591:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 595:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 596:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4789 : 3'h2; // @[el2_lsu_bus_buffer.scala 592:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 597:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 599:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 594:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 593:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 598:20]
  assign io_lsu_axi_wvalid = _T_4795 & _T_1165; // @[el2_lsu_bus_buffer.scala 601:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 603:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4799; // @[el2_lsu_bus_buffer.scala 602:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 604:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 617:21]
  assign io_lsu_axi_arvalid = _T_4804 & _T_1165; // @[el2_lsu_bus_buffer.scala 606:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1774}; // @[el2_lsu_bus_buffer.scala 607:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4787; // @[el2_lsu_bus_buffer.scala 608:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 612:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 613:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4789 : 3'h3; // @[el2_lsu_bus_buffer.scala 609:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 614:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 616:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 611:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 610:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 615:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 618:21]
  assign io_test = {_T_2002,_T_2001}; // @[el2_lsu_bus_buffer.scala 415:11]
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
  assign rvclkhdr_4_io_en = _T_3431 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3624 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3817 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4010 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3431 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3624 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3817 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4010 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4263 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4260 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4257 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4254 = _RAND_4[0:0];
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
  _T_4290 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4288 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4286 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4284 = _RAND_15[2:0];
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
  _T_4291 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  _T_4292 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  _T_4293 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_4294 = _RAND_32[3:0];
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
  _T_4233 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4230 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4227 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4224 = _RAND_53[0:0];
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
  _T_4210 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4208 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4206 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4204 = _RAND_88[0:0];
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
  _T_4239 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4242 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4245 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4248 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4314 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4309 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4304 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4299 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4898 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
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
    _T_4254 = 1'h0;
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
    _T_4290 = 3'h0;
  end
  if (reset) begin
    _T_4288 = 3'h0;
  end
  if (reset) begin
    _T_4286 = 3'h0;
  end
  if (reset) begin
    _T_4284 = 3'h0;
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
    _T_4291 = 4'h0;
  end
  if (reset) begin
    _T_4292 = 4'h0;
  end
  if (reset) begin
    _T_4293 = 4'h0;
  end
  if (reset) begin
    _T_4294 = 4'h0;
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
    _T_4233 = 1'h0;
  end
  if (reset) begin
    _T_4230 = 1'h0;
  end
  if (reset) begin
    _T_4227 = 1'h0;
  end
  if (reset) begin
    _T_4224 = 1'h0;
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
    _T_4210 = 1'h0;
  end
  if (reset) begin
    _T_4208 = 1'h0;
  end
  if (reset) begin
    _T_4206 = 1'h0;
  end
  if (reset) begin
    _T_4204 = 1'h0;
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
    _T_4239 = 1'h0;
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
    _T_4314 = 1'h0;
  end
  if (reset) begin
    _T_4309 = 1'h0;
  end
  if (reset) begin
    _T_4304 = 1'h0;
  end
  if (reset) begin
    _T_4299 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4898 = 1'h0;
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
    end else if (_T_3246) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4263 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4263 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4260 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4260 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4257 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4257 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4254 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4254 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3431) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3454) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3458) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3462) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3492) begin
        if (_T_3497) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3505) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3533) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3579) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3585) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3597) begin
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
    end else if (_T_3255) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3624) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3647) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3651) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3462) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3685) begin
        if (_T_3690) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3698) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3726) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3772) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3778) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3790) begin
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
    end else if (_T_3264) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3817) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3840) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3844) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3462) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3878) begin
        if (_T_3883) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3891) begin
          buf_state_2 <= 3'h4;
        end else if (_T_3919) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3965) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3971) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_3983) begin
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
    end else if (_T_3273) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4010) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4033) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4037) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3462) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4071) begin
        if (_T_4076) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4084) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4112) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4158) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4164) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4176) begin
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
      _T_4290 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4290 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4288 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4288 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4286 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4286 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4284 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4284 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2454,_T_2377};
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
      buf_ageQ_2 <= {_T_2352,_T_2275};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2250,_T_2173};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2148,_T_2071};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4291 <= 4'h0;
    end else begin
      _T_4291 <= _GEN_79[3:0];
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4292 <= 4'h0;
    end else begin
      _T_4292 <= _GEN_155[3:0];
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4293 <= 4'h0;
    end else begin
      _T_4293 <= _GEN_231[3:0];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_4294 <= 4'h0;
    end else begin
      _T_4294 <= _GEN_307[3:0];
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
      _T_4233 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4233 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4230 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4230 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4227 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4227 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4224 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4224 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1231 & _T_4770;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1231 & _T_4771;
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
      buf_rspageQ_0 <= {_T_3076,_T_3065};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3091,_T_3080};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3106,_T_3095};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3121,_T_3110};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4210 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4010) begin
        _T_4210 <= 1'h0;
      end else if (_T_4033) begin
        _T_4210 <= 1'h0;
      end else begin
        _T_4210 <= _T_4037;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4208 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3817) begin
        _T_4208 <= 1'h0;
      end else if (_T_3840) begin
        _T_4208 <= 1'h0;
      end else begin
        _T_4208 <= _T_3844;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4206 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3624) begin
        _T_4206 <= 1'h0;
      end else if (_T_3647) begin
        _T_4206 <= 1'h0;
      end else begin
        _T_4206 <= _T_3651;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4204 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3431) begin
        _T_4204 <= 1'h0;
      end else if (_T_3454) begin
        _T_4204 <= 1'h0;
      end else begin
        _T_4204 <= _T_3458;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3431) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3454) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3458) begin
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
      end else if (_T_3246) begin
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
      if (_T_4010) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4033) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4037) begin
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
      if (_T_3817) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3840) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3844) begin
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
      if (_T_3624) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3647) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3651) begin
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
      end else if (_T_3255) begin
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
      end else if (_T_3264) begin
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
      end else if (_T_3273) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4239 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4239 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4242 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4242 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4245 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4245 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4248 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4248 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4314 <= 1'h0;
    end else begin
      _T_4314 <= _T_4311 & _T_4312;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4309 <= 1'h0;
    end else begin
      _T_4309 <= _T_4306 & _T_4307;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4304 <= 1'h0;
    end else begin
      _T_4304 <= _T_4301 & _T_4302;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4299 <= 1'h0;
    end else begin
      _T_4299 <= _T_4296 & _T_4297;
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
      _T_4898 <= 1'h0;
    end else begin
      _T_4898 <= _T_4895 & _T_4429;
    end
  end
endmodule
