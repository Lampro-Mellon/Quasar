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
  reg  _T_4356; // @[Reg.scala 27:20]
  reg  _T_4353; // @[Reg.scala 27:20]
  reg  _T_4350; // @[Reg.scala 27:20]
  reg  _T_4347; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4356,_T_4353,_T_4350,_T_4347}; // @[Cat.scala 29:58]
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
  reg [2:0] _T_4383; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_3 = {{1'd0}, _T_4383}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 567:16]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  reg [2:0] _T_4381; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_2 = {{1'd0}, _T_4381}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 567:16]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  reg [2:0] _T_4379; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_1 = {{1'd0}, _T_4379}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 567:16]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  reg [2:0] _T_4377; // @[Reg.scala 27:20]
  wire [3:0] buf_byteen_0 = {{1'd0}, _T_4377}; // @[el2_lsu_bus_buffer.scala 142:24 el2_lsu_bus_buffer.scala 143:14 el2_lsu_bus_buffer.scala 567:16]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 199:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 199:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2618 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 464:94]
  wire  _T_4103 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4126 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4130 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1861; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1861}; // @[el2_lsu_bus_buffer.scala 409:13]
  wire  _T_4137 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 506:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_4138 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_4139 = obuf_merge & _T_4138; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_4140 = _T_4137 | _T_4139; // @[el2_lsu_bus_buffer.scala 506:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 403:54]
  wire  _T_4141 = _T_4140 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 402:55]
  wire  _T_4142 = _T_4141 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_280 = _T_4130 & _T_4142; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4126 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4103 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2619 = _T_2618 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 464:104]
  wire  _T_2620 = buf_ageQ_3[3] & _T_2619; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2614 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 464:94]
  wire  _T_3910 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3933 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3937 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3944 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 506:48]
  wire  _T_3945 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_3946 = obuf_merge & _T_3945; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_3947 = _T_3944 | _T_3946; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3948 = _T_3947 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  wire  _T_3949 = _T_3948 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_204 = _T_3937 & _T_3949; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3933 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3910 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2615 = _T_2614 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 464:104]
  wire  _T_2616 = buf_ageQ_3[2] & _T_2615; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2610 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 464:94]
  wire  _T_3717 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3740 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3744 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3751 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 506:48]
  wire  _T_3752 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_3753 = obuf_merge & _T_3752; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_3754 = _T_3751 | _T_3753; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3755 = _T_3754 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  wire  _T_3756 = _T_3755 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_128 = _T_3744 & _T_3756; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3740 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3717 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2611 = _T_2610 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 464:104]
  wire  _T_2612 = buf_ageQ_3[1] & _T_2611; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2606 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 464:94]
  wire  _T_3524 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3547 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3551 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3558 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 506:48]
  wire  _T_3559 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_3560 = obuf_merge & _T_3559; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_3561 = _T_3558 | _T_3560; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3562 = _T_3561 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  wire  _T_3563 = _T_3562 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_52 = _T_3551 & _T_3563; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3547 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2607 = _T_2606 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 464:104]
  wire  _T_2608 = buf_ageQ_3[0] & _T_2607; // @[el2_lsu_bus_buffer.scala 464:78]
  wire [3:0] buf_age_3 = {_T_2620,_T_2616,_T_2612,_T_2608}; // @[Cat.scala 29:58]
  wire  _T_2719 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2721 = _T_2719 & _T_19; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2713 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2715 = _T_2713 & _T_12; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2707 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2709 = _T_2707 & _T_5; // @[el2_lsu_bus_buffer.scala 465:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2721,_T_2715,_T_2709}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 204:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 210:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[el2_lsu_bus_buffer.scala 210:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 295:24]
  wire  _T_514 = _T_513 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 210:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 210:99]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire  _T_545 = ld_addr_ibuf_hit_lo & ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 215:48]
  wire  _T_547 = _T_545 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 215:65]
  wire [3:0] ld_byte_ibuf_hit_lo = {{3'd0}, _T_547}; // @[el2_lsu_bus_buffer.scala 215:25 el2_lsu_bus_buffer.scala 215:25 el2_lsu_bus_buffer.scala 215:25 el2_lsu_bus_buffer.scala 215:25]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 204:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2601 = buf_ageQ_2[3] & _T_2619; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2597 = buf_ageQ_2[2] & _T_2615; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2593 = buf_ageQ_2[1] & _T_2611; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2589 = buf_ageQ_2[0] & _T_2607; // @[el2_lsu_bus_buffer.scala 464:78]
  wire [3:0] buf_age_2 = {_T_2601,_T_2597,_T_2593,_T_2589}; // @[Cat.scala 29:58]
  wire  _T_2698 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2700 = _T_2698 & _T_26; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2686 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2688 = _T_2686 & _T_12; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2680 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2682 = _T_2680 & _T_5; // @[el2_lsu_bus_buffer.scala 465:106]
  wire [3:0] buf_age_younger_2 = {_T_2700,1'h0,_T_2688,_T_2682}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2582 = buf_ageQ_1[3] & _T_2619; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2578 = buf_ageQ_1[2] & _T_2615; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2574 = buf_ageQ_1[1] & _T_2611; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2570 = buf_ageQ_1[0] & _T_2607; // @[el2_lsu_bus_buffer.scala 464:78]
  wire [3:0] buf_age_1 = {_T_2582,_T_2578,_T_2574,_T_2570}; // @[Cat.scala 29:58]
  wire  _T_2671 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2673 = _T_2671 & _T_26; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2665 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2667 = _T_2665 & _T_19; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2653 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2655 = _T_2653 & _T_5; // @[el2_lsu_bus_buffer.scala 465:106]
  wire [3:0] buf_age_younger_1 = {_T_2673,_T_2667,1'h0,_T_2655}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 204:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 204:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 204:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 204:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 204:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2563 = buf_ageQ_0[3] & _T_2619; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2559 = buf_ageQ_0[2] & _T_2615; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2555 = buf_ageQ_0[1] & _T_2611; // @[el2_lsu_bus_buffer.scala 464:78]
  wire  _T_2551 = buf_ageQ_0[0] & _T_2607; // @[el2_lsu_bus_buffer.scala 464:78]
  wire [3:0] buf_age_0 = {_T_2563,_T_2559,_T_2555,_T_2551}; // @[Cat.scala 29:58]
  wire  _T_2644 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2646 = _T_2644 & _T_26; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2638 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2640 = _T_2638 & _T_19; // @[el2_lsu_bus_buffer.scala 465:106]
  wire  _T_2632 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 465:91]
  wire  _T_2634 = _T_2632 & _T_12; // @[el2_lsu_bus_buffer.scala 465:106]
  wire [3:0] buf_age_younger_0 = {_T_2646,_T_2640,_T_2634,1'h0}; // @[Cat.scala 29:58]
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
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 308:59]
  wire  _T_856 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 271:62]
  wire  _T_857 = ibuf_wr_en | _T_856; // @[el2_lsu_bus_buffer.scala 271:48]
  wire  _T_921 = _T_845 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 290:54]
  wire  _T_922 = _T_921 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 290:75]
  wire  _T_923 = _T_922 & ibuf_write; // @[el2_lsu_bus_buffer.scala 290:88]
  wire  _T_926 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 290:124]
  wire  _T_927 = _T_923 & _T_926; // @[el2_lsu_bus_buffer.scala 290:101]
  wire  _T_928 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 290:147]
  wire  _T_929 = _T_927 & _T_928; // @[el2_lsu_bus_buffer.scala 290:145]
  wire  _T_930 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 290:170]
  wire  ibuf_merge_en = _T_929 & _T_930; // @[el2_lsu_bus_buffer.scala 290:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 291:20]
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
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 668:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 667:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_873 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 281:77]
  reg [31:0] ibuf_data; // @[el2_lib.scala 491:16]
  wire [7:0] _T_881 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_884 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[el2_lsu_bus_buffer.scala 287:8]
  wire [7:0] _T_885 = _T_858 ? _T_881 : _T_884; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [7:0] _T_890 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_893 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[el2_lsu_bus_buffer.scala 287:8]
  wire [7:0] _T_894 = _T_858 ? _T_890 : _T_893; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [7:0] _T_899 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_902 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[el2_lsu_bus_buffer.scala 287:8]
  wire [7:0] _T_903 = _T_858 ? _T_899 : _T_902; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [7:0] _T_908 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 286:8]
  wire [7:0] _T_911 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[el2_lsu_bus_buffer.scala 287:8]
  wire [7:0] _T_912 = _T_858 ? _T_908 : _T_911; // @[el2_lsu_bus_buffer.scala 285:46]
  wire [23:0] _T_914 = {_T_912,_T_903,_T_894}; // @[Cat.scala 29:58]
  wire  _T_915 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 288:59]
  wire [2:0] _T_918 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 288:93]
  wire  _T_933 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 292:65]
  wire  _T_934 = ibuf_merge_en & _T_933; // @[el2_lsu_bus_buffer.scala 292:63]
  wire  _T_937 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 292:96]
  wire  _T_939 = _T_934 ? _T_937 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 292:48]
  wire  _T_944 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 292:96]
  wire  _T_946 = _T_934 ? _T_944 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 292:48]
  wire  _T_951 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 292:96]
  wire  _T_953 = _T_934 ? _T_951 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 292:48]
  wire  _T_958 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 292:96]
  wire  _T_960 = _T_934 ? _T_958 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 292:48]
  wire [3:0] ibuf_byteen_out = {_T_960,_T_953,_T_946,_T_939}; // @[Cat.scala 29:58]
  wire [7:0] _T_970 = _T_934 ? _T_881 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 293:45]
  wire [7:0] _T_978 = _T_934 ? _T_890 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 293:45]
  wire [7:0] _T_986 = _T_934 ? _T_899 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 293:45]
  wire [7:0] _T_994 = _T_934 ? _T_908 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 293:45]
  wire [31:0] ibuf_data_out = {_T_994,_T_986,_T_978,_T_970}; // @[Cat.scala 29:58]
  wire  _T_997 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 295:28]
  wire  _T_998 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 295:63]
  wire  _T_1003 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 296:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4437 = buf_write[3] & _T_2618; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4438 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4439 = _T_4437 & _T_4438; // @[el2_lsu_bus_buffer.scala 573:89]
  wire  _T_4432 = buf_write[2] & _T_2614; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4433 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4434 = _T_4432 & _T_4433; // @[el2_lsu_bus_buffer.scala 573:89]
  wire [1:0] _T_4440 = _T_4439 + _T_4434; // @[el2_lsu_bus_buffer.scala 573:142]
  wire  _T_4427 = buf_write[1] & _T_2610; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4428 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4429 = _T_4427 & _T_4428; // @[el2_lsu_bus_buffer.scala 573:89]
  wire [1:0] _GEN_362 = {{1'd0}, _T_4429}; // @[el2_lsu_bus_buffer.scala 573:142]
  wire [2:0] _T_4441 = _T_4440 + _GEN_362; // @[el2_lsu_bus_buffer.scala 573:142]
  wire  _T_4422 = buf_write[0] & _T_2606; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4423 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4424 = _T_4422 & _T_4423; // @[el2_lsu_bus_buffer.scala 573:89]
  wire [2:0] _GEN_363 = {{2'd0}, _T_4424}; // @[el2_lsu_bus_buffer.scala 573:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4441 + _GEN_363; // @[el2_lsu_bus_buffer.scala 573:142]
  wire  _T_1029 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 319:43]
  wire  _T_4454 = _T_2618 & _T_4438; // @[el2_lsu_bus_buffer.scala 574:73]
  wire  _T_4451 = _T_2614 & _T_4433; // @[el2_lsu_bus_buffer.scala 574:73]
  wire [1:0] _T_4455 = _T_4454 + _T_4451; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4448 = _T_2610 & _T_4428; // @[el2_lsu_bus_buffer.scala 574:73]
  wire [1:0] _GEN_364 = {{1'd0}, _T_4448}; // @[el2_lsu_bus_buffer.scala 574:126]
  wire [2:0] _T_4456 = _T_4455 + _GEN_364; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4445 = _T_2606 & _T_4423; // @[el2_lsu_bus_buffer.scala 574:73]
  wire [2:0] _GEN_365 = {{2'd0}, _T_4445}; // @[el2_lsu_bus_buffer.scala 574:126]
  wire [3:0] buf_numvld_cmd_any = _T_4456 + _GEN_365; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_1030 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 319:72]
  wire  _T_1031 = _T_1029 & _T_1030; // @[el2_lsu_bus_buffer.scala 319:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 418:54]
  wire  _T_1032 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 319:97]
  wire  _T_1033 = _T_1031 & _T_1032; // @[el2_lsu_bus_buffer.scala 319:80]
  wire  _T_1035 = _T_1033 & _T_930; // @[el2_lsu_bus_buffer.scala 319:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1048 = ~buf_nomerge_0; // @[el2_lsu_bus_buffer.scala 320:31]
  wire  _T_1049 = _T_1035 & _T_1048; // @[el2_lsu_bus_buffer.scala 320:29]
  reg  _T_4326; // @[Reg.scala 27:20]
  reg  _T_4323; // @[Reg.scala 27:20]
  reg  _T_4320; // @[Reg.scala 27:20]
  reg  _T_4317; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4326,_T_4323,_T_4320,_T_4317}; // @[Cat.scala 29:58]
  wire  _T_1066 = ~buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 321:5]
  wire  _T_1067 = _T_1049 & _T_1066; // @[el2_lsu_bus_buffer.scala 320:140]
  wire  _T_1078 = _T_850 & _T_844; // @[el2_lsu_bus_buffer.scala 323:58]
  wire  _T_1080 = _T_1078 & _T_1030; // @[el2_lsu_bus_buffer.scala 323:72]
  wire  _T_1098 = io_lsu_addr_m[31:2] != buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 323:123]
  wire  obuf_force_wr_en = _T_1080 & _T_1098; // @[el2_lsu_bus_buffer.scala 323:101]
  wire  _T_1068 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 321:119]
  wire  obuf_wr_wait = _T_1067 & _T_1068; // @[el2_lsu_bus_buffer.scala 321:117]
  wire  _T_1069 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 322:75]
  wire  _T_1070 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 322:95]
  wire  _T_1071 = _T_1069 & _T_1070; // @[el2_lsu_bus_buffer.scala 322:79]
  wire [2:0] _T_1073 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 322:121]
  wire  _T_4473 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4477 = _T_4473 | _T_4454; // @[el2_lsu_bus_buffer.scala 575:74]
  wire  _T_4468 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4472 = _T_4468 | _T_4451; // @[el2_lsu_bus_buffer.scala 575:74]
  wire [1:0] _T_4478 = _T_4477 + _T_4472; // @[el2_lsu_bus_buffer.scala 575:154]
  wire  _T_4463 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4467 = _T_4463 | _T_4448; // @[el2_lsu_bus_buffer.scala 575:74]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4467}; // @[el2_lsu_bus_buffer.scala 575:154]
  wire [2:0] _T_4479 = _T_4478 + _GEN_366; // @[el2_lsu_bus_buffer.scala 575:154]
  wire  _T_4458 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4462 = _T_4458 | _T_4445; // @[el2_lsu_bus_buffer.scala 575:74]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4462}; // @[el2_lsu_bus_buffer.scala 575:154]
  wire [3:0] buf_numvld_pend_any = _T_4479 + _GEN_367; // @[el2_lsu_bus_buffer.scala 575:154]
  wire  _T_1100 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 325:53]
  wire  _T_1101 = ibuf_byp & _T_1100; // @[el2_lsu_bus_buffer.scala 325:31]
  wire  _T_1102 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 325:64]
  wire  _T_1103 = _T_1102 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 325:84]
  wire  ibuf_buf_byp = _T_1101 & _T_1103; // @[el2_lsu_bus_buffer.scala 325:61]
  wire  _T_1104 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 340:32]
  wire  _T_4769 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 604:62]
  wire  _T_4771 = _T_4769 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 604:73]
  wire  _T_4772 = _T_4771 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 604:93]
  wire  _T_4773 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 604:62]
  wire  _T_4775 = _T_4773 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 604:73]
  wire  _T_4776 = _T_4775 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 604:93]
  wire  _T_4785 = _T_4772 | _T_4776; // @[el2_lsu_bus_buffer.scala 604:141]
  wire  _T_4777 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 604:62]
  wire  _T_4779 = _T_4777 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 604:73]
  wire  _T_4780 = _T_4779 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 604:93]
  wire  _T_4786 = _T_4785 | _T_4780; // @[el2_lsu_bus_buffer.scala 604:141]
  wire  _T_4781 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 604:62]
  wire  _T_4783 = _T_4781 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 604:73]
  wire  _T_4784 = _T_4783 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 604:93]
  wire  bus_sideeffect_pend = _T_4786 | _T_4784; // @[el2_lsu_bus_buffer.scala 604:141]
  wire  _T_1105 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 340:74]
  wire  _T_1106 = ~_T_1105; // @[el2_lsu_bus_buffer.scala 340:52]
  wire  _T_1107 = _T_1104 & _T_1106; // @[el2_lsu_bus_buffer.scala 340:50]
  wire  _T_1991 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 430:58]
  wire  _T_1992 = ~_T_1991; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_1994 = _T_1992 & _T_2618; // @[el2_lsu_bus_buffer.scala 430:63]
  wire  _T_1996 = _T_1994 & _T_4438; // @[el2_lsu_bus_buffer.scala 430:88]
  wire  _T_1985 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 430:58]
  wire  _T_1986 = ~_T_1985; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_1988 = _T_1986 & _T_2614; // @[el2_lsu_bus_buffer.scala 430:63]
  wire  _T_1990 = _T_1988 & _T_4433; // @[el2_lsu_bus_buffer.scala 430:88]
  wire  _T_1979 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 430:58]
  wire  _T_1980 = ~_T_1979; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_1982 = _T_1980 & _T_2610; // @[el2_lsu_bus_buffer.scala 430:63]
  wire  _T_1984 = _T_1982 & _T_4428; // @[el2_lsu_bus_buffer.scala 430:88]
  wire  _T_1973 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 430:58]
  wire  _T_1974 = ~_T_1973; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_1976 = _T_1974 & _T_2606; // @[el2_lsu_bus_buffer.scala 430:63]
  wire  _T_1978 = _T_1976 & _T_4423; // @[el2_lsu_bus_buffer.scala 430:88]
  wire [3:0] CmdPtr0Dec = {_T_1996,_T_1990,_T_1984,_T_1978}; // @[Cat.scala 29:58]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 435:31]
  wire  _T_1121 = _T_2606 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 341:47]
  wire [3:0] _T_1124 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1141 = ~_T_1124[0]; // @[el2_lsu_bus_buffer.scala 342:23]
  wire  _T_1142 = _T_1121 & _T_1141; // @[el2_lsu_bus_buffer.scala 342:21]
  wire  _T_1159 = buf_sideeffect[0] & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 342:141]
  wire  _T_1160 = ~_T_1159; // @[el2_lsu_bus_buffer.scala 342:105]
  wire  _T_1161 = _T_1142 & _T_1160; // @[el2_lsu_bus_buffer.scala 342:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1164 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1183 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1200 = _T_1164[0] & _T_1183[0]; // @[el2_lsu_bus_buffer.scala 343:77]
  wire  _T_1217 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 343:150]
  wire  _T_1218 = _T_1200 & _T_1217; // @[el2_lsu_bus_buffer.scala 343:148]
  wire  _T_1219 = ~_T_1218; // @[el2_lsu_bus_buffer.scala 343:8]
  wire [3:0] _T_2032 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 431:62]
  wire [3:0] _T_2033 = buf_age_3 & _T_2032; // @[el2_lsu_bus_buffer.scala 431:59]
  wire  _T_2034 = |_T_2033; // @[el2_lsu_bus_buffer.scala 431:76]
  wire  _T_2035 = ~_T_2034; // @[el2_lsu_bus_buffer.scala 431:45]
  wire  _T_2037 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 431:83]
  wire  _T_2038 = _T_2035 & _T_2037; // @[el2_lsu_bus_buffer.scala 431:81]
  wire  _T_2040 = _T_2038 & _T_2618; // @[el2_lsu_bus_buffer.scala 431:98]
  wire  _T_2042 = _T_2040 & _T_4438; // @[el2_lsu_bus_buffer.scala 431:123]
  wire [3:0] _T_2022 = buf_age_2 & _T_2032; // @[el2_lsu_bus_buffer.scala 431:59]
  wire  _T_2023 = |_T_2022; // @[el2_lsu_bus_buffer.scala 431:76]
  wire  _T_2024 = ~_T_2023; // @[el2_lsu_bus_buffer.scala 431:45]
  wire  _T_2026 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 431:83]
  wire  _T_2027 = _T_2024 & _T_2026; // @[el2_lsu_bus_buffer.scala 431:81]
  wire  _T_2029 = _T_2027 & _T_2614; // @[el2_lsu_bus_buffer.scala 431:98]
  wire  _T_2031 = _T_2029 & _T_4433; // @[el2_lsu_bus_buffer.scala 431:123]
  wire [3:0] _T_2011 = buf_age_1 & _T_2032; // @[el2_lsu_bus_buffer.scala 431:59]
  wire  _T_2012 = |_T_2011; // @[el2_lsu_bus_buffer.scala 431:76]
  wire  _T_2013 = ~_T_2012; // @[el2_lsu_bus_buffer.scala 431:45]
  wire  _T_2015 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 431:83]
  wire  _T_2016 = _T_2013 & _T_2015; // @[el2_lsu_bus_buffer.scala 431:81]
  wire  _T_2018 = _T_2016 & _T_2610; // @[el2_lsu_bus_buffer.scala 431:98]
  wire  _T_2020 = _T_2018 & _T_4428; // @[el2_lsu_bus_buffer.scala 431:123]
  wire [3:0] _T_2000 = buf_age_0 & _T_2032; // @[el2_lsu_bus_buffer.scala 431:59]
  wire  _T_2001 = |_T_2000; // @[el2_lsu_bus_buffer.scala 431:76]
  wire  _T_2002 = ~_T_2001; // @[el2_lsu_bus_buffer.scala 431:45]
  wire  _T_2004 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 431:83]
  wire  _T_2005 = _T_2002 & _T_2004; // @[el2_lsu_bus_buffer.scala 431:81]
  wire  _T_2007 = _T_2005 & _T_2606; // @[el2_lsu_bus_buffer.scala 431:98]
  wire  _T_2009 = _T_2007 & _T_4423; // @[el2_lsu_bus_buffer.scala 431:123]
  wire [3:0] CmdPtr1Dec = {_T_2042,_T_2031,_T_2020,_T_2009}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 436:31]
  wire  _T_1220 = _T_1219 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 343:181]
  wire [3:0] _T_1223 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1240 = _T_1220 | _T_1223[0]; // @[el2_lsu_bus_buffer.scala 343:197]
  wire  _T_1241 = _T_1240 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 343:269]
  wire  _T_1242 = _T_1161 & _T_1241; // @[el2_lsu_bus_buffer.scala 342:164]
  wire  _T_1243 = _T_1107 | _T_1242; // @[el2_lsu_bus_buffer.scala 340:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 405:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 406:55]
  wire  _T_4844 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 608:54]
  wire  _T_4845 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 608:75]
  wire  _T_4847 = _T_4844 ? _T_4845 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 608:39]
  wire  bus_cmd_ready = obuf_write ? _T_4847 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 608:23]
  wire  _T_1244 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 344:48]
  wire  _T_1245 = bus_cmd_ready | _T_1244; // @[el2_lsu_bus_buffer.scala 344:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1246 = _T_1245 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 344:60]
  wire  _T_1247 = _T_1243 & _T_1246; // @[el2_lsu_bus_buffer.scala 344:29]
  wire  _T_1248 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 344:77]
  wire  _T_1249 = _T_1247 & _T_1248; // @[el2_lsu_bus_buffer.scala 344:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 491:16]
  wire  _T_4792 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 606:56]
  wire  _T_4793 = obuf_valid & _T_4792; // @[el2_lsu_bus_buffer.scala 606:38]
  wire  _T_4795 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 606:126]
  wire  _T_4796 = obuf_merge & _T_4795; // @[el2_lsu_bus_buffer.scala 606:114]
  wire  _T_4797 = _T_3558 | _T_4796; // @[el2_lsu_bus_buffer.scala 606:100]
  wire  _T_4798 = ~_T_4797; // @[el2_lsu_bus_buffer.scala 606:80]
  wire  _T_4799 = _T_4793 & _T_4798; // @[el2_lsu_bus_buffer.scala 606:78]
  wire  _T_4836 = _T_4769 & _T_4799; // @[Mux.scala 27:72]
  wire  _T_4804 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 606:56]
  wire  _T_4805 = obuf_valid & _T_4804; // @[el2_lsu_bus_buffer.scala 606:38]
  wire  _T_4807 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 606:126]
  wire  _T_4808 = obuf_merge & _T_4807; // @[el2_lsu_bus_buffer.scala 606:114]
  wire  _T_4809 = _T_3751 | _T_4808; // @[el2_lsu_bus_buffer.scala 606:100]
  wire  _T_4810 = ~_T_4809; // @[el2_lsu_bus_buffer.scala 606:80]
  wire  _T_4811 = _T_4805 & _T_4810; // @[el2_lsu_bus_buffer.scala 606:78]
  wire  _T_4837 = _T_4773 & _T_4811; // @[Mux.scala 27:72]
  wire  _T_4840 = _T_4836 | _T_4837; // @[Mux.scala 27:72]
  wire  _T_4816 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 606:56]
  wire  _T_4817 = obuf_valid & _T_4816; // @[el2_lsu_bus_buffer.scala 606:38]
  wire  _T_4819 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 606:126]
  wire  _T_4820 = obuf_merge & _T_4819; // @[el2_lsu_bus_buffer.scala 606:114]
  wire  _T_4821 = _T_3944 | _T_4820; // @[el2_lsu_bus_buffer.scala 606:100]
  wire  _T_4822 = ~_T_4821; // @[el2_lsu_bus_buffer.scala 606:80]
  wire  _T_4823 = _T_4817 & _T_4822; // @[el2_lsu_bus_buffer.scala 606:78]
  wire  _T_4838 = _T_4777 & _T_4823; // @[Mux.scala 27:72]
  wire  _T_4841 = _T_4840 | _T_4838; // @[Mux.scala 27:72]
  wire  _T_4828 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 606:56]
  wire  _T_4829 = obuf_valid & _T_4828; // @[el2_lsu_bus_buffer.scala 606:38]
  wire  _T_4831 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 606:126]
  wire  _T_4832 = obuf_merge & _T_4831; // @[el2_lsu_bus_buffer.scala 606:114]
  wire  _T_4833 = _T_4137 | _T_4832; // @[el2_lsu_bus_buffer.scala 606:100]
  wire  _T_4834 = ~_T_4833; // @[el2_lsu_bus_buffer.scala 606:80]
  wire  _T_4835 = _T_4829 & _T_4834; // @[el2_lsu_bus_buffer.scala 606:78]
  wire  _T_4839 = _T_4781 & _T_4835; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4841 | _T_4839; // @[Mux.scala 27:72]
  wire  _T_1252 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 344:118]
  wire  _T_1253 = _T_1249 & _T_1252; // @[el2_lsu_bus_buffer.scala 344:116]
  wire  obuf_wr_en = _T_1253 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 344:142]
  wire  _T_1255 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 346:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 609:39]
  wire  _T_4851 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 611:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 610:39]
  wire  _T_4852 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 611:70]
  wire  _T_4853 = _T_4851 & _T_4852; // @[el2_lsu_bus_buffer.scala 611:52]
  wire  _T_4854 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 611:111]
  wire  bus_cmd_sent = _T_4853 | _T_4854; // @[el2_lsu_bus_buffer.scala 611:89]
  wire  _T_1256 = bus_cmd_sent | _T_1255; // @[el2_lsu_bus_buffer.scala 346:33]
  wire  _T_1257 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 346:65]
  wire  _T_1258 = _T_1256 & _T_1257; // @[el2_lsu_bus_buffer.scala 346:63]
  wire  _T_1259 = _T_1258 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 346:77]
  wire  obuf_rst = _T_1259 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 346:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : buf_write[0]; // @[el2_lsu_bus_buffer.scala 347:26]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : buf_addr_0; // @[el2_lsu_bus_buffer.scala 349:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : buf_sz_0; // @[el2_lsu_bus_buffer.scala 352:23]
  wire  _T_1317 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 361:39]
  wire  _T_1318 = ~_T_1317; // @[el2_lsu_bus_buffer.scala 361:26]
  wire  _T_1324 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 365:72]
  wire  _T_1327 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 365:98]
  wire  _T_1328 = obuf_sz_in[0] & _T_1327; // @[el2_lsu_bus_buffer.scala 365:96]
  wire  _T_1329 = _T_1324 | _T_1328; // @[el2_lsu_bus_buffer.scala 365:79]
  wire  _T_1332 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 365:153]
  wire  _T_1333 = ~_T_1332; // @[el2_lsu_bus_buffer.scala 365:134]
  wire  _T_1334 = obuf_sz_in[1] & _T_1333; // @[el2_lsu_bus_buffer.scala 365:132]
  wire  _T_1335 = _T_1329 | _T_1334; // @[el2_lsu_bus_buffer.scala 365:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1335; // @[el2_lsu_bus_buffer.scala 365:28]
  wire  _T_1352 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 379:40]
  wire  _T_1353 = _T_1352 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 379:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1354 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 379:80]
  wire  _T_1355 = _T_1353 & _T_1354; // @[el2_lsu_bus_buffer.scala 379:78]
  wire  _T_1356 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 379:99]
  wire  _T_1357 = _T_1355 & _T_1356; // @[el2_lsu_bus_buffer.scala 379:97]
  wire  _T_1358 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 379:113]
  wire  _T_1359 = _T_1357 & _T_1358; // @[el2_lsu_bus_buffer.scala 379:111]
  wire  _T_1360 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 379:130]
  wire  _T_1361 = _T_1359 & _T_1360; // @[el2_lsu_bus_buffer.scala 379:128]
  wire  _T_1362 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 380:20]
  wire  _T_1363 = obuf_valid & _T_1362; // @[el2_lsu_bus_buffer.scala 380:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 407:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 612:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 408:55]
  wire  _T_1364 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 380:90]
  wire  _T_1365 = bus_rsp_read & _T_1364; // @[el2_lsu_bus_buffer.scala 380:70]
  wire  _T_1366 = ~_T_1365; // @[el2_lsu_bus_buffer.scala 380:55]
  wire  _T_1367 = obuf_rdrsp_pend & _T_1366; // @[el2_lsu_bus_buffer.scala 380:53]
  wire  _T_1368 = _T_1363 | _T_1367; // @[el2_lsu_bus_buffer.scala 380:34]
  wire  obuf_nosend_in = _T_1361 & _T_1368; // @[el2_lsu_bus_buffer.scala 379:165]
  wire  _T_1336 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 373:44]
  wire  _T_1337 = obuf_wr_en & _T_1336; // @[el2_lsu_bus_buffer.scala 373:42]
  wire  _T_1338 = ~_T_1337; // @[el2_lsu_bus_buffer.scala 373:29]
  wire  _T_1339 = _T_1338 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 373:61]
  wire  _T_1343 = _T_1339 & _T_1366; // @[el2_lsu_bus_buffer.scala 373:79]
  wire  _T_1345 = bus_cmd_sent & _T_1356; // @[el2_lsu_bus_buffer.scala 374:20]
  wire  _T_1346 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 374:37]
  wire  _T_1347 = _T_1345 & _T_1346; // @[el2_lsu_bus_buffer.scala 374:35]
  wire  _T_1349 = bus_cmd_sent | _T_1356; // @[el2_lsu_bus_buffer.scala 376:44]
  wire [7:0] _T_1371 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1372 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1373 = io_lsu_addr_r[2] ? _T_1371 : _T_1372; // @[el2_lsu_bus_buffer.scala 381:46]
  wire [7:0] _T_1400 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1413 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1414 = buf_addr_0[2] ? _T_1400 : _T_1413; // @[el2_lsu_bus_buffer.scala 382:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1373 : _T_1414; // @[el2_lsu_bus_buffer.scala 381:28]
  wire [7:0] _T_1416 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1417 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1418 = io_end_addr_r[2] ? _T_1416 : _T_1417; // @[el2_lsu_bus_buffer.scala 383:46]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1418 : _T_1414; // @[el2_lsu_bus_buffer.scala 383:28]
  wire [63:0] _T_1461 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1462 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1463 = io_lsu_addr_r[2] ? _T_1461 : _T_1462; // @[el2_lsu_bus_buffer.scala 386:44]
  wire [63:0] _T_1490 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1503 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1504 = buf_addr_0[2] ? _T_1490 : _T_1503; // @[el2_lsu_bus_buffer.scala 387:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1463 : _T_1504; // @[el2_lsu_bus_buffer.scala 386:26]
  wire [63:0] _T_1506 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1507 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1508 = io_lsu_addr_r[2] ? _T_1506 : _T_1507; // @[el2_lsu_bus_buffer.scala 388:44]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1508 : _T_1504; // @[el2_lsu_bus_buffer.scala 388:26]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire  _T_1849 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 400:19]
  wire  obuf_merge_en = _T_1849 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 400:35]
  wire  _T_1552 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1553 = obuf_byteen0_in[0] | _T_1552; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1556 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1557 = obuf_byteen0_in[1] | _T_1556; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1560 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1561 = obuf_byteen0_in[2] | _T_1560; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1564 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1565 = obuf_byteen0_in[3] | _T_1564; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1568 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1569 = obuf_byteen0_in[4] | _T_1568; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1572 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1573 = obuf_byteen0_in[5] | _T_1572; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1576 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1577 = obuf_byteen0_in[6] | _T_1576; // @[el2_lsu_bus_buffer.scala 390:63]
  wire  _T_1580 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 390:80]
  wire  _T_1581 = obuf_byteen0_in[7] | _T_1580; // @[el2_lsu_bus_buffer.scala 390:63]
  wire [7:0] obuf_byteen_in = {_T_1581,_T_1577,_T_1573,_T_1569,_T_1565,_T_1561,_T_1557,_T_1553}; // @[Cat.scala 29:58]
  wire [7:0] _T_1592 = _T_1552 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1597 = _T_1556 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1602 = _T_1560 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1607 = _T_1564 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1612 = _T_1568 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1617 = _T_1572 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1622 = _T_1576 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [7:0] _T_1627 = _T_1580 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 391:44]
  wire [55:0] _T_1633 = {_T_1627,_T_1622,_T_1617,_T_1612,_T_1607,_T_1602,_T_1597}; // @[Cat.scala 29:58]
  wire  _T_1852 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 403:58]
  wire  _T_1853 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 403:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 491:16]
  wire  _T_1866 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 420:59]
  wire  _T_1867 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 420:97]
  wire  _T_1868 = ibuf_valid & _T_1867; // @[el2_lsu_bus_buffer.scala 420:86]
  wire  _T_1869 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 421:33]
  wire  _T_1870 = io_lsu_busreq_r & _T_1869; // @[el2_lsu_bus_buffer.scala 421:22]
  wire  _T_1871 = _T_1868 | _T_1870; // @[el2_lsu_bus_buffer.scala 420:106]
  wire  _T_1872 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 421:72]
  wire  _T_1873 = io_ldst_dual_r & _T_1872; // @[el2_lsu_bus_buffer.scala 421:60]
  wire  _T_1874 = _T_1871 | _T_1873; // @[el2_lsu_bus_buffer.scala 421:42]
  wire  _T_1875 = ~_T_1874; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1876 = _T_1866 & _T_1875; // @[el2_lsu_bus_buffer.scala 420:70]
  wire  _T_1877 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 420:59]
  wire  _T_1878 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 420:97]
  wire  _T_1879 = ibuf_valid & _T_1878; // @[el2_lsu_bus_buffer.scala 420:86]
  wire  _T_1880 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 421:33]
  wire  _T_1881 = io_lsu_busreq_r & _T_1880; // @[el2_lsu_bus_buffer.scala 421:22]
  wire  _T_1882 = _T_1879 | _T_1881; // @[el2_lsu_bus_buffer.scala 420:106]
  wire  _T_1883 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 421:72]
  wire  _T_1884 = io_ldst_dual_r & _T_1883; // @[el2_lsu_bus_buffer.scala 421:60]
  wire  _T_1885 = _T_1882 | _T_1884; // @[el2_lsu_bus_buffer.scala 421:42]
  wire  _T_1886 = ~_T_1885; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1887 = _T_1877 & _T_1886; // @[el2_lsu_bus_buffer.scala 420:70]
  wire  _T_1888 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 420:59]
  wire  _T_1889 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 420:97]
  wire  _T_1890 = ibuf_valid & _T_1889; // @[el2_lsu_bus_buffer.scala 420:86]
  wire  _T_1891 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 421:33]
  wire  _T_1892 = io_lsu_busreq_r & _T_1891; // @[el2_lsu_bus_buffer.scala 421:22]
  wire  _T_1893 = _T_1890 | _T_1892; // @[el2_lsu_bus_buffer.scala 420:106]
  wire  _T_1894 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 421:72]
  wire  _T_1895 = io_ldst_dual_r & _T_1894; // @[el2_lsu_bus_buffer.scala 421:60]
  wire  _T_1896 = _T_1893 | _T_1895; // @[el2_lsu_bus_buffer.scala 421:42]
  wire  _T_1897 = ~_T_1896; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1898 = _T_1888 & _T_1897; // @[el2_lsu_bus_buffer.scala 420:70]
  wire  _T_1899 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 420:59]
  wire  _T_1900 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 420:97]
  wire  _T_1901 = ibuf_valid & _T_1900; // @[el2_lsu_bus_buffer.scala 420:86]
  wire  _T_1902 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 421:33]
  wire  _T_1903 = io_lsu_busreq_r & _T_1902; // @[el2_lsu_bus_buffer.scala 421:22]
  wire  _T_1904 = _T_1901 | _T_1903; // @[el2_lsu_bus_buffer.scala 420:106]
  wire  _T_1905 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 421:72]
  wire  _T_1906 = io_ldst_dual_r & _T_1905; // @[el2_lsu_bus_buffer.scala 421:60]
  wire  _T_1907 = _T_1904 | _T_1906; // @[el2_lsu_bus_buffer.scala 421:42]
  wire  _T_1908 = ~_T_1907; // @[el2_lsu_bus_buffer.scala 420:72]
  wire  _T_1909 = _T_1899 & _T_1908; // @[el2_lsu_bus_buffer.scala 420:70]
  wire [1:0] _T_1910 = _T_1909 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1911 = _T_1898 ? 2'h2 : _T_1910; // @[Mux.scala 98:16]
  wire [1:0] _T_1912 = _T_1887 ? 2'h1 : _T_1911; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1876 ? 2'h0 : _T_1912; // @[Mux.scala 98:16]
  wire  _T_1917 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 424:33]
  wire  _T_1918 = io_lsu_busreq_m & _T_1917; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1919 = _T_1868 | _T_1918; // @[el2_lsu_bus_buffer.scala 423:106]
  wire  _T_1922 = _T_1919 | _T_1870; // @[el2_lsu_bus_buffer.scala 424:42]
  wire  _T_1925 = _T_1922 | _T_1873; // @[el2_lsu_bus_buffer.scala 424:83]
  wire  _T_1926 = ~_T_1925; // @[el2_lsu_bus_buffer.scala 423:72]
  wire  _T_1927 = _T_1866 & _T_1926; // @[el2_lsu_bus_buffer.scala 423:70]
  wire  _T_1931 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 424:33]
  wire  _T_1932 = io_lsu_busreq_m & _T_1931; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1933 = _T_1879 | _T_1932; // @[el2_lsu_bus_buffer.scala 423:106]
  wire  _T_1936 = _T_1933 | _T_1881; // @[el2_lsu_bus_buffer.scala 424:42]
  wire  _T_1939 = _T_1936 | _T_1884; // @[el2_lsu_bus_buffer.scala 424:83]
  wire  _T_1940 = ~_T_1939; // @[el2_lsu_bus_buffer.scala 423:72]
  wire  _T_1941 = _T_1877 & _T_1940; // @[el2_lsu_bus_buffer.scala 423:70]
  wire  _T_1945 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 424:33]
  wire  _T_1946 = io_lsu_busreq_m & _T_1945; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1947 = _T_1890 | _T_1946; // @[el2_lsu_bus_buffer.scala 423:106]
  wire  _T_1950 = _T_1947 | _T_1892; // @[el2_lsu_bus_buffer.scala 424:42]
  wire  _T_1953 = _T_1950 | _T_1895; // @[el2_lsu_bus_buffer.scala 424:83]
  wire  _T_1954 = ~_T_1953; // @[el2_lsu_bus_buffer.scala 423:72]
  wire  _T_1955 = _T_1888 & _T_1954; // @[el2_lsu_bus_buffer.scala 423:70]
  wire  _T_1959 = WrPtr0_m == 2'h3; // @[el2_lsu_bus_buffer.scala 424:33]
  wire  _T_1960 = io_lsu_busreq_m & _T_1959; // @[el2_lsu_bus_buffer.scala 424:22]
  wire  _T_1961 = _T_1901 | _T_1960; // @[el2_lsu_bus_buffer.scala 423:106]
  wire  _T_1964 = _T_1961 | _T_1903; // @[el2_lsu_bus_buffer.scala 424:42]
  wire  _T_1967 = _T_1964 | _T_1906; // @[el2_lsu_bus_buffer.scala 424:83]
  wire  _T_1968 = ~_T_1967; // @[el2_lsu_bus_buffer.scala 423:72]
  wire  _T_1969 = _T_1899 & _T_1968; // @[el2_lsu_bus_buffer.scala 423:70]
  wire [1:0] _T_1970 = _T_1969 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1971 = _T_1955 ? 2'h2 : _T_1970; // @[Mux.scala 98:16]
  wire [1:0] _T_1972 = _T_1941 ? 2'h1 : _T_1971; // @[Mux.scala 98:16]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2742 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 466:104]
  wire  _T_2743 = buf_rspageQ_0[3] & _T_2742; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2739 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 466:104]
  wire  _T_2740 = buf_rspageQ_0[2] & _T_2739; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2736 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 466:104]
  wire  _T_2737 = buf_rspageQ_0[1] & _T_2736; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2733 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 466:104]
  wire  _T_2734 = buf_rspageQ_0[0] & _T_2733; // @[el2_lsu_bus_buffer.scala 466:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2743,_T_2740,_T_2737,_T_2734}; // @[Cat.scala 29:58]
  wire  _T_2045 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 434:65]
  wire  _T_2046 = ~_T_2045; // @[el2_lsu_bus_buffer.scala 434:44]
  wire  _T_2048 = _T_2046 & _T_2733; // @[el2_lsu_bus_buffer.scala 434:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2758 = buf_rspageQ_1[3] & _T_2742; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2755 = buf_rspageQ_1[2] & _T_2739; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2752 = buf_rspageQ_1[1] & _T_2736; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2749 = buf_rspageQ_1[0] & _T_2733; // @[el2_lsu_bus_buffer.scala 466:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2758,_T_2755,_T_2752,_T_2749}; // @[Cat.scala 29:58]
  wire  _T_2049 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 434:65]
  wire  _T_2050 = ~_T_2049; // @[el2_lsu_bus_buffer.scala 434:44]
  wire  _T_2052 = _T_2050 & _T_2736; // @[el2_lsu_bus_buffer.scala 434:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2773 = buf_rspageQ_2[3] & _T_2742; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2770 = buf_rspageQ_2[2] & _T_2739; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2767 = buf_rspageQ_2[1] & _T_2736; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2764 = buf_rspageQ_2[0] & _T_2733; // @[el2_lsu_bus_buffer.scala 466:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2773,_T_2770,_T_2767,_T_2764}; // @[Cat.scala 29:58]
  wire  _T_2053 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 434:65]
  wire  _T_2054 = ~_T_2053; // @[el2_lsu_bus_buffer.scala 434:44]
  wire  _T_2056 = _T_2054 & _T_2739; // @[el2_lsu_bus_buffer.scala 434:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2788 = buf_rspageQ_3[3] & _T_2742; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2785 = buf_rspageQ_3[2] & _T_2739; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2782 = buf_rspageQ_3[1] & _T_2736; // @[el2_lsu_bus_buffer.scala 466:89]
  wire  _T_2779 = buf_rspageQ_3[0] & _T_2733; // @[el2_lsu_bus_buffer.scala 466:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2788,_T_2785,_T_2782,_T_2779}; // @[Cat.scala 29:58]
  wire  _T_2057 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 434:65]
  wire  _T_2058 = ~_T_2057; // @[el2_lsu_bus_buffer.scala 434:44]
  wire  _T_2060 = _T_2058 & _T_2742; // @[el2_lsu_bus_buffer.scala 434:70]
  wire [7:0] _T_2116 = {4'h0,_T_2060,_T_2056,_T_2052,_T_2048}; // @[Cat.scala 29:58]
  wire  _T_2119 = _T_2116[4] | _T_2116[5]; // @[el2_lsu_bus_buffer.scala 438:42]
  wire  _T_2121 = _T_2119 | _T_2116[6]; // @[el2_lsu_bus_buffer.scala 438:48]
  wire  _T_2123 = _T_2121 | _T_2116[7]; // @[el2_lsu_bus_buffer.scala 438:54]
  wire  _T_2126 = _T_2116[2] | _T_2116[3]; // @[el2_lsu_bus_buffer.scala 438:67]
  wire  _T_2128 = _T_2126 | _T_2116[6]; // @[el2_lsu_bus_buffer.scala 438:73]
  wire  _T_2130 = _T_2128 | _T_2116[7]; // @[el2_lsu_bus_buffer.scala 438:79]
  wire  _T_2133 = _T_2116[1] | _T_2116[3]; // @[el2_lsu_bus_buffer.scala 438:92]
  wire  _T_2135 = _T_2133 | _T_2116[5]; // @[el2_lsu_bus_buffer.scala 438:98]
  wire  _T_2137 = _T_2135 | _T_2116[7]; // @[el2_lsu_bus_buffer.scala 438:104]
  wire [2:0] _T_2139 = {_T_2123,_T_2130,_T_2137}; // @[Cat.scala 29:58]
  wire  _T_3528 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 495:77]
  wire  _T_3529 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 495:97]
  wire  _T_3530 = _T_3528 & _T_3529; // @[el2_lsu_bus_buffer.scala 495:95]
  wire  _T_3531 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_3532 = _T_3530 & _T_3531; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_3533 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 495:144]
  wire  _T_3534 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_3535 = _T_3533 & _T_3534; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_3536 = _T_3532 | _T_3535; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_3537 = _T_845 & _T_3536; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_3538 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_3539 = ibuf_drain_vld & _T_3538; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_3540 = _T_3537 | _T_3539; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_3550 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 502:46]
  wire  _T_3585 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 613:38]
  wire  _T_3630 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_3631 = bus_rsp_write & _T_3630; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_3632 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 521:46]
  reg  _T_4303; // @[Reg.scala 27:20]
  reg  _T_4301; // @[Reg.scala 27:20]
  reg  _T_4299; // @[Reg.scala 27:20]
  reg  _T_4297; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4303,_T_4301,_T_4299,_T_4297}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_368 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3634 = io_lsu_axi_rid == _GEN_368; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3635 = buf_ldfwd[0] & _T_3634; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_3636 = _T_3632 | _T_3635; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_3637 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_3640 = _T_3637 & _T_1217; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_3641 = _T_3640 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_369 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3642 = io_lsu_axi_rid == _GEN_369; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3643 = _T_3641 & _T_3642; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_3644 = _T_3636 | _T_3643; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_3645 = bus_rsp_read & _T_3644; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_3646 = _T_3631 | _T_3645; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_42 = _T_3585 & _T_3646; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3551 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3547 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3672 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3682 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 535:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_371 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3684 = io_lsu_axi_rid == _GEN_371; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3685 = _T_3682[0] & _T_3684; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_3686 = _T_3642 | _T_3685; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_3687 = bus_rsp_read & _T_3686; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_36 = _T_3672 & _T_3687; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3585 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3551 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3547 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3564 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_3565 = _T_3564 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_3690 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2139[1:0]; // @[el2_lsu_bus_buffer.scala 446:10]
  wire  _T_3693 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_3694 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_3695 = buf_dual_0 & _T_3694; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_3696 = _T_3693 | _T_3695; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_3697 = _T_3696 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_3698 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3690 ? _T_3697 : _T_3698; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3672 ? _T_3565 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3585 ? _T_3565 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3551 ? _T_3565 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3547 ? _T_3550 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3524 ? _T_3540 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2141 = _T_1866 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 458:94]
  wire  _T_2147 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 460:23]
  wire  _T_2149 = _T_2147 & _T_3528; // @[el2_lsu_bus_buffer.scala 460:41]
  wire  _T_2151 = _T_2149 & _T_1869; // @[el2_lsu_bus_buffer.scala 460:71]
  wire  _T_2153 = _T_2151 & _T_1867; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2154 = _T_4462 | _T_2153; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2155 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 461:17]
  wire  _T_2156 = _T_2155 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 461:35]
  wire  _T_2158 = _T_2156 & _T_1872; // @[el2_lsu_bus_buffer.scala 461:52]
  wire  _T_2160 = _T_2158 & _T_1869; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2161 = _T_2154 | _T_2160; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2162 = _T_2141 & _T_2161; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2164 = _T_2162 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2178 = _T_2151 & _T_1878; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2179 = _T_4467 | _T_2178; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2185 = _T_2158 & _T_1880; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2186 = _T_2179 | _T_2185; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2187 = _T_2141 & _T_2186; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2189 = _T_2187 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2203 = _T_2151 & _T_1889; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2204 = _T_4472 | _T_2203; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2210 = _T_2158 & _T_1891; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2211 = _T_2204 | _T_2210; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2212 = _T_2141 & _T_2211; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2214 = _T_2212 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2228 = _T_2151 & _T_1900; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2229 = _T_4477 | _T_2228; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2235 = _T_2158 & _T_1902; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2236 = _T_2229 | _T_2235; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2237 = _T_2141 & _T_2236; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2239 = _T_2237 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire [2:0] _T_2241 = {_T_2239,_T_2214,_T_2189}; // @[Cat.scala 29:58]
  wire  _T_3724 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_3725 = _T_3530 & _T_3724; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_3727 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_3728 = _T_3533 & _T_3727; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_3729 = _T_3725 | _T_3728; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_3730 = _T_845 & _T_3729; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_3731 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_3732 = ibuf_drain_vld & _T_3731; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_3733 = _T_3730 | _T_3732; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_3778 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3823 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_3824 = bus_rsp_write & _T_3823; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_3825 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 521:46]
  wire [2:0] _GEN_372 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3827 = io_lsu_axi_rid == _GEN_372; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3828 = buf_ldfwd[1] & _T_3827; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_3829 = _T_3825 | _T_3828; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_3830 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_3832 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_3833 = _T_3830 & _T_3832; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_3834 = _T_3833 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_373 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3835 = io_lsu_axi_rid == _GEN_373; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3836 = _T_3834 & _T_3835; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_3837 = _T_3829 | _T_3836; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_3838 = bus_rsp_read & _T_3837; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_3839 = _T_3824 | _T_3838; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_118 = _T_3778 & _T_3839; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3744 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3740 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3717 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3865 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3875 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 535:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_375 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3877 = io_lsu_axi_rid == _GEN_375; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3878 = _T_3875[0] & _T_3877; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_3879 = _T_3835 | _T_3878; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_3880 = bus_rsp_read & _T_3879; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_112 = _T_3865 & _T_3880; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3778 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3744 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3740 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3717 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3757 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_3758 = _T_3757 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_3883 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3886 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_3887 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_3888 = buf_dual_1 & _T_3887; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_3889 = _T_3886 | _T_3888; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_3890 = _T_3889 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_3891 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3883 ? _T_3890 : _T_3891; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3865 ? _T_3758 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3778 ? _T_3758 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3744 ? _T_3758 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3740 ? _T_3550 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3717 ? _T_3733 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2243 = _T_1877 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 458:94]
  wire  _T_2253 = _T_2149 & _T_1880; // @[el2_lsu_bus_buffer.scala 460:71]
  wire  _T_2255 = _T_2253 & _T_1867; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2256 = _T_4462 | _T_2255; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2260 = _T_2156 & _T_1883; // @[el2_lsu_bus_buffer.scala 461:52]
  wire  _T_2262 = _T_2260 & _T_1869; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2263 = _T_2256 | _T_2262; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2264 = _T_2243 & _T_2263; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2266 = _T_2264 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2280 = _T_2253 & _T_1878; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2281 = _T_4467 | _T_2280; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2287 = _T_2260 & _T_1880; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2288 = _T_2281 | _T_2287; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2289 = _T_2243 & _T_2288; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2291 = _T_2289 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2305 = _T_2253 & _T_1889; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2306 = _T_4472 | _T_2305; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2312 = _T_2260 & _T_1891; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2313 = _T_2306 | _T_2312; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2314 = _T_2243 & _T_2313; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2316 = _T_2314 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2330 = _T_2253 & _T_1900; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2331 = _T_4477 | _T_2330; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2337 = _T_2260 & _T_1902; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2338 = _T_2331 | _T_2337; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2339 = _T_2243 & _T_2338; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2341 = _T_2339 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire [2:0] _T_2343 = {_T_2341,_T_2316,_T_2291}; // @[Cat.scala 29:58]
  wire  _T_3917 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_3918 = _T_3530 & _T_3917; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_3920 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_3921 = _T_3533 & _T_3920; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_3922 = _T_3918 | _T_3921; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_3923 = _T_845 & _T_3922; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_3924 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_3925 = ibuf_drain_vld & _T_3924; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_3926 = _T_3923 | _T_3925; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_3971 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4016 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_4017 = bus_rsp_write & _T_4016; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_4018 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 521:46]
  wire [2:0] _GEN_376 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4020 = io_lsu_axi_rid == _GEN_376; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4021 = buf_ldfwd[2] & _T_4020; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_4022 = _T_4018 | _T_4021; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_4023 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_4025 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_4026 = _T_4023 & _T_4025; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_4027 = _T_4026 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_377 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4028 = io_lsu_axi_rid == _GEN_377; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4029 = _T_4027 & _T_4028; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_4030 = _T_4022 | _T_4029; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_4031 = bus_rsp_read & _T_4030; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_4032 = _T_4017 | _T_4031; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_194 = _T_3971 & _T_4032; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3937 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3933 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3910 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4058 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4068 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 535:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_379 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4070 = io_lsu_axi_rid == _GEN_379; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4071 = _T_4068[0] & _T_4070; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_4072 = _T_4028 | _T_4071; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_4073 = bus_rsp_read & _T_4072; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_188 = _T_4058 & _T_4073; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3971 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3937 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3933 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3910 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3950 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_3951 = _T_3950 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_4076 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4079 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_4080 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_4081 = buf_dual_2 & _T_4080; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_4082 = _T_4079 | _T_4081; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_4083 = _T_4082 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_4084 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4076 ? _T_4083 : _T_4084; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4058 ? _T_3951 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3971 ? _T_3951 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3937 ? _T_3951 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3933 ? _T_3550 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3910 ? _T_3926 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2345 = _T_1888 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 458:94]
  wire  _T_2355 = _T_2149 & _T_1891; // @[el2_lsu_bus_buffer.scala 460:71]
  wire  _T_2357 = _T_2355 & _T_1867; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2358 = _T_4462 | _T_2357; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2362 = _T_2156 & _T_1894; // @[el2_lsu_bus_buffer.scala 461:52]
  wire  _T_2364 = _T_2362 & _T_1869; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2365 = _T_2358 | _T_2364; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2366 = _T_2345 & _T_2365; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2368 = _T_2366 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2382 = _T_2355 & _T_1878; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2383 = _T_4467 | _T_2382; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2389 = _T_2362 & _T_1880; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2390 = _T_2383 | _T_2389; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2391 = _T_2345 & _T_2390; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2393 = _T_2391 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2407 = _T_2355 & _T_1889; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2408 = _T_4472 | _T_2407; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2414 = _T_2362 & _T_1891; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2415 = _T_2408 | _T_2414; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2416 = _T_2345 & _T_2415; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2418 = _T_2416 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2432 = _T_2355 & _T_1900; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2433 = _T_4477 | _T_2432; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2439 = _T_2362 & _T_1902; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2440 = _T_2433 | _T_2439; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2441 = _T_2345 & _T_2440; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2443 = _T_2441 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire [2:0] _T_2445 = {_T_2443,_T_2418,_T_2393}; // @[Cat.scala 29:58]
  wire  _T_4110 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_4111 = _T_3530 & _T_4110; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_4113 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_4114 = _T_3533 & _T_4113; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_4115 = _T_4111 | _T_4114; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_4116 = _T_845 & _T_4115; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_4117 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_4118 = ibuf_drain_vld & _T_4117; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_4119 = _T_4116 | _T_4118; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_4164 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4209 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_4210 = bus_rsp_write & _T_4209; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_4211 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 521:46]
  wire [2:0] _GEN_380 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4213 = io_lsu_axi_rid == _GEN_380; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4214 = buf_ldfwd[3] & _T_4213; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_4215 = _T_4211 | _T_4214; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_4216 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_4218 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_4219 = _T_4216 & _T_4218; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_4220 = _T_4219 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_381 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4221 = io_lsu_axi_rid == _GEN_381; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4222 = _T_4220 & _T_4221; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_4223 = _T_4215 | _T_4222; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_4224 = bus_rsp_read & _T_4223; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_4225 = _T_4210 | _T_4224; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_270 = _T_4164 & _T_4225; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4130 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4126 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4103 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4251 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4261 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 535:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_383 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4263 = io_lsu_axi_rid == _GEN_383; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4264 = _T_4261[0] & _T_4263; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_4265 = _T_4221 | _T_4264; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_4266 = bus_rsp_read & _T_4265; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_264 = _T_4251 & _T_4266; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4164 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4130 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4126 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4103 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4143 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_4144 = _T_4143 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_4269 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4272 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_4273 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_4274 = buf_dual_3 & _T_4273; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_4275 = _T_4272 | _T_4274; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_4276 = _T_4275 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_4277 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4269 ? _T_4276 : _T_4277; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4251 ? _T_4144 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4164 ? _T_4144 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4130 ? _T_4144 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4126 ? _T_3550 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4103 ? _T_4119 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2447 = _T_1899 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 458:94]
  wire  _T_2457 = _T_2149 & _T_1902; // @[el2_lsu_bus_buffer.scala 460:71]
  wire  _T_2459 = _T_2457 & _T_1867; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2460 = _T_4462 | _T_2459; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2464 = _T_2156 & _T_1905; // @[el2_lsu_bus_buffer.scala 461:52]
  wire  _T_2466 = _T_2464 & _T_1869; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2467 = _T_2460 | _T_2466; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2468 = _T_2447 & _T_2467; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2470 = _T_2468 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2484 = _T_2457 & _T_1878; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2485 = _T_4467 | _T_2484; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2491 = _T_2464 & _T_1880; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2492 = _T_2485 | _T_2491; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2493 = _T_2447 & _T_2492; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2495 = _T_2493 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2509 = _T_2457 & _T_1889; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2510 = _T_4472 | _T_2509; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2516 = _T_2464 & _T_1891; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2517 = _T_2510 | _T_2516; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2518 = _T_2447 & _T_2517; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2520 = _T_2518 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire  _T_2534 = _T_2457 & _T_1900; // @[el2_lsu_bus_buffer.scala 460:92]
  wire  _T_2535 = _T_4477 | _T_2534; // @[el2_lsu_bus_buffer.scala 459:86]
  wire  _T_2541 = _T_2464 & _T_1902; // @[el2_lsu_bus_buffer.scala 461:73]
  wire  _T_2542 = _T_2535 | _T_2541; // @[el2_lsu_bus_buffer.scala 460:114]
  wire  _T_2543 = _T_2447 & _T_2542; // @[el2_lsu_bus_buffer.scala 458:113]
  wire  _T_2545 = _T_2543 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 461:97]
  wire [2:0] _T_2547 = {_T_2545,_T_2520,_T_2495}; // @[Cat.scala 29:58]
  wire  _T_2795 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 469:49]
  wire  _T_2796 = _T_1866 | _T_2795; // @[el2_lsu_bus_buffer.scala 469:34]
  wire  _T_2797 = ~_T_2796; // @[el2_lsu_bus_buffer.scala 469:8]
  wire  _T_2805 = _T_2797 | _T_2153; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2812 = _T_2805 | _T_2160; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2813 = _T_2141 & _T_2812; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2817 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 469:49]
  wire  _T_2818 = _T_1877 | _T_2817; // @[el2_lsu_bus_buffer.scala 469:34]
  wire  _T_2819 = ~_T_2818; // @[el2_lsu_bus_buffer.scala 469:8]
  wire  _T_2827 = _T_2819 | _T_2178; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2834 = _T_2827 | _T_2185; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2835 = _T_2141 & _T_2834; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2839 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 469:49]
  wire  _T_2840 = _T_1888 | _T_2839; // @[el2_lsu_bus_buffer.scala 469:34]
  wire  _T_2841 = ~_T_2840; // @[el2_lsu_bus_buffer.scala 469:8]
  wire  _T_2849 = _T_2841 | _T_2203; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2856 = _T_2849 | _T_2210; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2857 = _T_2141 & _T_2856; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2861 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 469:49]
  wire  _T_2862 = _T_1899 | _T_2861; // @[el2_lsu_bus_buffer.scala 469:34]
  wire  _T_2863 = ~_T_2862; // @[el2_lsu_bus_buffer.scala 469:8]
  wire  _T_2871 = _T_2863 | _T_2228; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2878 = _T_2871 | _T_2235; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2879 = _T_2141 & _T_2878; // @[el2_lsu_bus_buffer.scala 468:114]
  wire [3:0] buf_rspage_set_0 = {_T_2879,_T_2857,_T_2835,_T_2813}; // @[Cat.scala 29:58]
  wire  _T_2896 = _T_2797 | _T_2255; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2903 = _T_2896 | _T_2262; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2904 = _T_2243 & _T_2903; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2918 = _T_2819 | _T_2280; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2925 = _T_2918 | _T_2287; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2926 = _T_2243 & _T_2925; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2940 = _T_2841 | _T_2305; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2947 = _T_2940 | _T_2312; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2948 = _T_2243 & _T_2947; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_2962 = _T_2863 | _T_2330; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2969 = _T_2962 | _T_2337; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2970 = _T_2243 & _T_2969; // @[el2_lsu_bus_buffer.scala 468:114]
  wire [3:0] buf_rspage_set_1 = {_T_2970,_T_2948,_T_2926,_T_2904}; // @[Cat.scala 29:58]
  wire  _T_2987 = _T_2797 | _T_2357; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_2994 = _T_2987 | _T_2364; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_2995 = _T_2345 & _T_2994; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_3009 = _T_2819 | _T_2382; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3016 = _T_3009 | _T_2389; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3017 = _T_2345 & _T_3016; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_3031 = _T_2841 | _T_2407; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3038 = _T_3031 | _T_2414; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3039 = _T_2345 & _T_3038; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_3053 = _T_2863 | _T_2432; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3060 = _T_3053 | _T_2439; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3061 = _T_2345 & _T_3060; // @[el2_lsu_bus_buffer.scala 468:114]
  wire [3:0] buf_rspage_set_2 = {_T_3061,_T_3039,_T_3017,_T_2995}; // @[Cat.scala 29:58]
  wire  _T_3078 = _T_2797 | _T_2459; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3085 = _T_3078 | _T_2466; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3086 = _T_2447 & _T_3085; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_3100 = _T_2819 | _T_2484; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3107 = _T_3100 | _T_2491; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3108 = _T_2447 & _T_3107; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_3122 = _T_2841 | _T_2509; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3129 = _T_3122 | _T_2516; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3130 = _T_2447 & _T_3129; // @[el2_lsu_bus_buffer.scala 468:114]
  wire  _T_3144 = _T_2863 | _T_2534; // @[el2_lsu_bus_buffer.scala 469:61]
  wire  _T_3151 = _T_3144 | _T_2541; // @[el2_lsu_bus_buffer.scala 470:112]
  wire  _T_3152 = _T_2447 & _T_3151; // @[el2_lsu_bus_buffer.scala 468:114]
  wire [3:0] buf_rspage_set_3 = {_T_3152,_T_3130,_T_3108,_T_3086}; // @[Cat.scala 29:58]
  wire  _T_3237 = _T_2861 | _T_1899; // @[el2_lsu_bus_buffer.scala 473:112]
  wire  _T_3238 = ~_T_3237; // @[el2_lsu_bus_buffer.scala 473:86]
  wire  _T_3239 = buf_rspageQ_0[3] & _T_3238; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3231 = _T_2839 | _T_1888; // @[el2_lsu_bus_buffer.scala 473:112]
  wire  _T_3232 = ~_T_3231; // @[el2_lsu_bus_buffer.scala 473:86]
  wire  _T_3233 = buf_rspageQ_0[2] & _T_3232; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3225 = _T_2817 | _T_1877; // @[el2_lsu_bus_buffer.scala 473:112]
  wire  _T_3226 = ~_T_3225; // @[el2_lsu_bus_buffer.scala 473:86]
  wire  _T_3227 = buf_rspageQ_0[1] & _T_3226; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3219 = _T_2795 | _T_1866; // @[el2_lsu_bus_buffer.scala 473:112]
  wire  _T_3220 = ~_T_3219; // @[el2_lsu_bus_buffer.scala 473:86]
  wire  _T_3221 = buf_rspageQ_0[0] & _T_3220; // @[el2_lsu_bus_buffer.scala 473:84]
  wire [3:0] buf_rspage_0 = {_T_3239,_T_3233,_T_3227,_T_3221}; // @[Cat.scala 29:58]
  wire  _T_3158 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3161 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3164 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3167 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire [2:0] _T_3169 = {_T_3167,_T_3164,_T_3161}; // @[Cat.scala 29:58]
  wire  _T_3266 = buf_rspageQ_1[3] & _T_3238; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3260 = buf_rspageQ_1[2] & _T_3232; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3254 = buf_rspageQ_1[1] & _T_3226; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3248 = buf_rspageQ_1[0] & _T_3220; // @[el2_lsu_bus_buffer.scala 473:84]
  wire [3:0] buf_rspage_1 = {_T_3266,_T_3260,_T_3254,_T_3248}; // @[Cat.scala 29:58]
  wire  _T_3173 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3176 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3179 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3182 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire [2:0] _T_3184 = {_T_3182,_T_3179,_T_3176}; // @[Cat.scala 29:58]
  wire  _T_3293 = buf_rspageQ_2[3] & _T_3238; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3287 = buf_rspageQ_2[2] & _T_3232; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3281 = buf_rspageQ_2[1] & _T_3226; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3275 = buf_rspageQ_2[0] & _T_3220; // @[el2_lsu_bus_buffer.scala 473:84]
  wire [3:0] buf_rspage_2 = {_T_3293,_T_3287,_T_3281,_T_3275}; // @[Cat.scala 29:58]
  wire  _T_3188 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3191 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3194 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3197 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire [2:0] _T_3199 = {_T_3197,_T_3194,_T_3191}; // @[Cat.scala 29:58]
  wire  _T_3320 = buf_rspageQ_3[3] & _T_3238; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3314 = buf_rspageQ_3[2] & _T_3232; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3308 = buf_rspageQ_3[1] & _T_3226; // @[el2_lsu_bus_buffer.scala 473:84]
  wire  _T_3302 = buf_rspageQ_3[0] & _T_3220; // @[el2_lsu_bus_buffer.scala 473:84]
  wire [3:0] buf_rspage_3 = {_T_3320,_T_3314,_T_3308,_T_3302}; // @[Cat.scala 29:58]
  wire  _T_3203 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3206 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3209 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire  _T_3212 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 472:90]
  wire [2:0] _T_3214 = {_T_3212,_T_3209,_T_3206}; // @[Cat.scala 29:58]
  wire  _T_3325 = ibuf_drain_vld & _T_1867; // @[el2_lsu_bus_buffer.scala 478:65]
  wire  _T_3327 = ibuf_drain_vld & _T_1878; // @[el2_lsu_bus_buffer.scala 478:65]
  wire  _T_3329 = ibuf_drain_vld & _T_1889; // @[el2_lsu_bus_buffer.scala 478:65]
  wire  _T_3331 = ibuf_drain_vld & _T_1900; // @[el2_lsu_bus_buffer.scala 478:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3331,_T_3329,_T_3327,_T_3325}; // @[Cat.scala 29:58]
  wire  _T_3339 = _T_3533 & _T_1872; // @[el2_lsu_bus_buffer.scala 479:123]
  wire [3:0] _T_3342 = _T_3339 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 479:96]
  wire [3:0] _T_3343 = ibuf_drainvec_vld[0] ? ibuf_byteen_out : _T_3342; // @[el2_lsu_bus_buffer.scala 479:48]
  wire  _T_3348 = _T_3533 & _T_1883; // @[el2_lsu_bus_buffer.scala 479:123]
  wire [3:0] _T_3351 = _T_3348 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 479:96]
  wire [3:0] _T_3352 = ibuf_drainvec_vld[1] ? ibuf_byteen_out : _T_3351; // @[el2_lsu_bus_buffer.scala 479:48]
  wire  _T_3357 = _T_3533 & _T_1894; // @[el2_lsu_bus_buffer.scala 479:123]
  wire [3:0] _T_3360 = _T_3357 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 479:96]
  wire [3:0] _T_3361 = ibuf_drainvec_vld[2] ? ibuf_byteen_out : _T_3360; // @[el2_lsu_bus_buffer.scala 479:48]
  wire  _T_3366 = _T_3533 & _T_1905; // @[el2_lsu_bus_buffer.scala 479:123]
  wire [3:0] _T_3369 = _T_3366 ? ldst_byteen_hi_r : ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 479:96]
  wire [3:0] _T_3370 = ibuf_drainvec_vld[3] ? ibuf_byteen_out : _T_3369; // @[el2_lsu_bus_buffer.scala 479:48]
  wire  _T_3396 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire  _T_3398 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire  _T_3400 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire  _T_3402 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire [3:0] buf_dual_in = {_T_3402,_T_3400,_T_3398,_T_3396}; // @[Cat.scala 29:58]
  wire  _T_3407 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire  _T_3409 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire  _T_3411 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire  _T_3413 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire [3:0] buf_samedw_in = {_T_3413,_T_3411,_T_3409,_T_3407}; // @[Cat.scala 29:58]
  wire  _T_3418 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 483:86]
  wire  _T_3419 = ibuf_drainvec_vld[0] ? _T_3418 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire  _T_3422 = ibuf_drainvec_vld[1] ? _T_3418 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire  _T_3425 = ibuf_drainvec_vld[2] ? _T_3418 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire  _T_3428 = ibuf_drainvec_vld[3] ? _T_3418 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire [3:0] buf_nomerge_in = {_T_3428,_T_3425,_T_3422,_T_3419}; // @[Cat.scala 29:58]
  wire  _T_3436 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3339; // @[el2_lsu_bus_buffer.scala 484:49]
  wire  _T_3441 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3348; // @[el2_lsu_bus_buffer.scala 484:49]
  wire  _T_3446 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3357; // @[el2_lsu_bus_buffer.scala 484:49]
  wire  _T_3451 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3366; // @[el2_lsu_bus_buffer.scala 484:49]
  wire [3:0] buf_dualhi_in = {_T_3451,_T_3446,_T_3441,_T_3436}; // @[Cat.scala 29:58]
  wire  _T_3480 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire  _T_3482 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire  _T_3484 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire  _T_3486 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire [3:0] buf_sideeffect_in = {_T_3486,_T_3484,_T_3482,_T_3480}; // @[Cat.scala 29:58]
  wire  _T_3491 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire  _T_3493 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire  _T_3495 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire  _T_3497 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire [3:0] buf_unsign_in = {_T_3497,_T_3495,_T_3493,_T_3491}; // @[Cat.scala 29:58]
  wire  _T_3514 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire  _T_3516 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire  _T_3518 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire  _T_3520 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire [3:0] buf_write_in = {_T_3520,_T_3518,_T_3516,_T_3514}; // @[Cat.scala 29:58]
  wire  _T_3553 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 505:89]
  wire  _T_3555 = _T_3553 & _T_1364; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_3568 = buf_state_en_0 & _T_1217; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_3569 = _T_3568 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_3571 = _T_3569 & _T_1346; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_3574 = _T_3564 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_3575 = _T_3574 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_4860 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 617:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4860; // @[el2_lsu_bus_buffer.scala 617:38]
  wire  _T_3578 = _T_3574 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_3653 = bus_rsp_read_error & _T_3632; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_3655 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3657 = _T_3655 & _T_3634; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_3658 = _T_3653 | _T_3657; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4860; // @[el2_lsu_bus_buffer.scala 616:40]
  wire  _T_3661 = bus_rsp_write_error & _T_3630; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_3662 = _T_3658 | _T_3661; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_3663 = _T_3564 & _T_3662; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_46 = _T_3585 & _T_3663; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3551 ? _T_3578 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3547 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3524 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3588 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 517:73]
  wire  _T_3589 = buf_write[0] & _T_3588; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_3590 = io_dec_tlu_force_halt | _T_3589; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_3592 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_3593 = buf_dual_0 & _T_3592; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_3596 = _T_3593 & _T_1217; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3597 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3598 = _T_3596 & _T_3597; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_4485 = _T_2742 | _T_2739; // @[el2_lsu_bus_buffer.scala 576:93]
  wire  _T_4486 = _T_4485 | _T_2736; // @[el2_lsu_bus_buffer.scala 576:93]
  wire  any_done_wait_state = _T_4486 | _T_2733; // @[el2_lsu_bus_buffer.scala 576:93]
  wire  _T_3600 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_3606 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3608 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3610 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3612 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3614 = _T_3606 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3615 = _T_3608 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3616 = _T_3610 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3617 = _T_3612 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3618 = _T_3614 | _T_3615; // @[Mux.scala 27:72]
  wire  _T_3619 = _T_3618 | _T_3616; // @[Mux.scala 27:72]
  wire  _T_3620 = _T_3619 | _T_3617; // @[Mux.scala 27:72]
  wire  _T_3622 = _T_3596 & _T_3620; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_3623 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_3624 = _T_3622 & _T_3623; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_3625 = _T_3624 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_3626 = _T_3600 | _T_3625; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_3649 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_3650 = _T_3649 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_3664 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_3665 = buf_state_en_0 & _T_3664; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_3677 = buf_ldfwd[0] | _T_3682[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_3678 = _T_3677 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_29 = _T_3698 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3690 ? 1'h0 : _T_3698; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3690 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3672 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3672 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3585 & _T_3650; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3585 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3585 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3551 ? _T_3571 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3551 ? _T_3575 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3551 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3547 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3547 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3547 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3524 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_data_en_0 = _T_3524 ? buf_state_en_0 : _GEN_70; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3524 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3524 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3761 = buf_state_en_1 & _T_3832; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_3762 = _T_3761 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_3764 = _T_3762 & _T_1346; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_3767 = _T_3757 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_3768 = _T_3767 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_3771 = _T_3767 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_3846 = bus_rsp_read_error & _T_3825; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_3848 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3850 = _T_3848 & _T_3827; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_3851 = _T_3846 | _T_3850; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  _T_3854 = bus_rsp_write_error & _T_3823; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_3855 = _T_3851 | _T_3854; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_3856 = _T_3757 & _T_3855; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_122 = _T_3778 & _T_3856; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3744 ? _T_3771 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3740 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3717 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3782 = buf_write[1] & _T_3588; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_3783 = io_dec_tlu_force_halt | _T_3782; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_3785 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_3786 = buf_dual_1 & _T_3785; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_3789 = _T_3786 & _T_3832; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3790 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3791 = _T_3789 & _T_3790; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_3793 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_3799 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3801 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3803 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3805 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3807 = _T_3799 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3808 = _T_3801 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3809 = _T_3803 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3810 = _T_3805 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3811 = _T_3807 | _T_3808; // @[Mux.scala 27:72]
  wire  _T_3812 = _T_3811 | _T_3809; // @[Mux.scala 27:72]
  wire  _T_3813 = _T_3812 | _T_3810; // @[Mux.scala 27:72]
  wire  _T_3815 = _T_3789 & _T_3813; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_3816 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_3817 = _T_3815 & _T_3816; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_3818 = _T_3817 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_3819 = _T_3793 | _T_3818; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_3842 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_3843 = _T_3842 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_3857 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_3858 = buf_state_en_1 & _T_3857; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_3870 = buf_ldfwd[1] | _T_3875[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_3871 = _T_3870 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_105 = _T_3891 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3883 ? 1'h0 : _T_3891; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3883 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3865 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3865 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3778 & _T_3843; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3778 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3778 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3744 ? _T_3764 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3744 ? _T_3768 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3744 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3740 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3740 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3740 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3717 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_data_en_1 = _T_3717 ? buf_state_en_1 : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3717 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3717 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3954 = buf_state_en_2 & _T_4025; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_3955 = _T_3954 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_3957 = _T_3955 & _T_1346; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_3960 = _T_3950 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_3961 = _T_3960 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_3964 = _T_3960 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_4039 = bus_rsp_read_error & _T_4018; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_4041 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4043 = _T_4041 & _T_4020; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_4044 = _T_4039 | _T_4043; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  _T_4047 = bus_rsp_write_error & _T_4016; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_4048 = _T_4044 | _T_4047; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_4049 = _T_3950 & _T_4048; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_198 = _T_3971 & _T_4049; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3937 ? _T_3964 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3933 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3910 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_3975 = buf_write[2] & _T_3588; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_3976 = io_dec_tlu_force_halt | _T_3975; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_3978 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_3979 = buf_dual_2 & _T_3978; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_3982 = _T_3979 & _T_4025; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3983 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3984 = _T_3982 & _T_3983; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_3986 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_3992 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3994 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3996 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_3998 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4000 = _T_3992 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4001 = _T_3994 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4002 = _T_3996 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4003 = _T_3998 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4004 = _T_4000 | _T_4001; // @[Mux.scala 27:72]
  wire  _T_4005 = _T_4004 | _T_4002; // @[Mux.scala 27:72]
  wire  _T_4006 = _T_4005 | _T_4003; // @[Mux.scala 27:72]
  wire  _T_4008 = _T_3982 & _T_4006; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_4009 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_4010 = _T_4008 & _T_4009; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_4011 = _T_4010 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_4012 = _T_3986 | _T_4011; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_4035 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_4036 = _T_4035 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_4050 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_4051 = buf_state_en_2 & _T_4050; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_4063 = buf_ldfwd[2] | _T_4068[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_4064 = _T_4063 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_181 = _T_4084 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4076 ? 1'h0 : _T_4084; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4076 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4058 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4058 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3971 & _T_4036; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3971 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3971 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3937 ? _T_3957 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3937 ? _T_3961 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3937 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3933 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3933 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3933 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3910 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_data_en_2 = _T_3910 ? buf_state_en_2 : _GEN_222; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3910 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3910 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4147 = buf_state_en_3 & _T_4218; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_4148 = _T_4147 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_4150 = _T_4148 & _T_1346; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_4153 = _T_4143 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_4154 = _T_4153 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_4157 = _T_4153 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_4232 = bus_rsp_read_error & _T_4211; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_4234 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4236 = _T_4234 & _T_4213; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_4237 = _T_4232 | _T_4236; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  _T_4240 = bus_rsp_write_error & _T_4209; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_4241 = _T_4237 | _T_4240; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_4242 = _T_4143 & _T_4241; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_274 = _T_4164 & _T_4242; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4130 ? _T_4157 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4126 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4103 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4168 = buf_write[3] & _T_3588; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_4169 = io_dec_tlu_force_halt | _T_4168; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_4171 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_4172 = buf_dual_3 & _T_4171; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_4175 = _T_4172 & _T_4218; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_4176 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_4177 = _T_4175 & _T_4176; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_4179 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_4185 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4187 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4189 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4191 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 118:118]
  wire  _T_4193 = _T_4185 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4194 = _T_4187 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4195 = _T_4189 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4196 = _T_4191 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4197 = _T_4193 | _T_4194; // @[Mux.scala 27:72]
  wire  _T_4198 = _T_4197 | _T_4195; // @[Mux.scala 27:72]
  wire  _T_4199 = _T_4198 | _T_4196; // @[Mux.scala 27:72]
  wire  _T_4201 = _T_4175 & _T_4199; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_4202 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_4203 = _T_4201 & _T_4202; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_4204 = _T_4203 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_4205 = _T_4179 | _T_4204; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_4228 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_4229 = _T_4228 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_4243 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_4244 = buf_state_en_3 & _T_4243; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_4256 = buf_ldfwd[3] | _T_4261[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_4257 = _T_4256 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_257 = _T_4277 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4269 ? 1'h0 : _T_4277; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4269 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4251 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4251 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4164 & _T_4229; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4164 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4164 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4130 ? _T_4150 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4130 ? _T_4154 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4130 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4126 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4126 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4126 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4103 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_data_en_3 = _T_4103 ? buf_state_en_3 : _GEN_298; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4103 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4103 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4332; // @[Reg.scala 27:20]
  reg  _T_4335; // @[Reg.scala 27:20]
  reg  _T_4338; // @[Reg.scala 27:20]
  reg  _T_4341; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4341,_T_4338,_T_4335,_T_4332}; // @[Cat.scala 29:58]
  wire [2:0] buf_byteen_in_0 = _T_3343[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 479:19]
  wire [2:0] buf_byteen_in_1 = _T_3352[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 479:19]
  wire [2:0] buf_byteen_in_2 = _T_3361[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 479:19]
  wire [2:0] buf_byteen_in_3 = _T_3370[2:0]; // @[el2_lsu_bus_buffer.scala 178:27 el2_lsu_bus_buffer.scala 179:17 el2_lsu_bus_buffer.scala 479:19]
  reg  _T_4407; // @[el2_lsu_bus_buffer.scala 569:82]
  reg  _T_4402; // @[el2_lsu_bus_buffer.scala 569:82]
  reg  _T_4397; // @[el2_lsu_bus_buffer.scala 569:82]
  reg  _T_4392; // @[el2_lsu_bus_buffer.scala 569:82]
  wire [3:0] buf_error = {_T_4407,_T_4402,_T_4397,_T_4392}; // @[Cat.scala 29:58]
  wire  _T_4389 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4390 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 569:128]
  wire  _T_4394 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4395 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 569:128]
  wire  _T_4399 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4400 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 569:128]
  wire  _T_4404 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4405 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 569:128]
  wire [2:0] _T_4412 = {buf_data_en_3,buf_data_en_2,buf_data_en_1}; // @[Cat.scala 29:58]
  wire [1:0] _T_4418 = _T_26 + _T_19; // @[el2_lsu_bus_buffer.scala 572:96]
  wire [1:0] _GEN_388 = {{1'd0}, _T_12}; // @[el2_lsu_bus_buffer.scala 572:96]
  wire [2:0] _T_4419 = _T_4418 + _GEN_388; // @[el2_lsu_bus_buffer.scala 572:96]
  wire [2:0] _GEN_389 = {{2'd0}, _T_5}; // @[el2_lsu_bus_buffer.scala 572:96]
  wire [3:0] buf_numvld_any = _T_4419 + _GEN_389; // @[el2_lsu_bus_buffer.scala 572:96]
  wire  _T_4489 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 578:52]
  wire  _T_4490 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 578:92]
  wire  _T_4491 = buf_numvld_any == 4'h3; // @[el2_lsu_bus_buffer.scala 578:119]
  wire  _T_4493 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4494 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4495 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4496 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4497 = _T_4493 | _T_4494; // @[el2_lsu_bus_buffer.scala 579:65]
  wire  _T_4498 = _T_4497 | _T_4495; // @[el2_lsu_bus_buffer.scala 579:65]
  wire  _T_4499 = _T_4498 | _T_4496; // @[el2_lsu_bus_buffer.scala 579:65]
  wire  _T_4500 = ~_T_4499; // @[el2_lsu_bus_buffer.scala 579:34]
  wire  _T_4502 = _T_4500 & _T_844; // @[el2_lsu_bus_buffer.scala 579:70]
  wire  _T_4505 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 581:51]
  wire  _T_4506 = _T_4505 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 581:72]
  wire  _T_4507 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 581:94]
  wire  _T_4508 = _T_4506 & _T_4507; // @[el2_lsu_bus_buffer.scala 581:92]
  wire  _T_4509 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 581:111]
  wire  _T_4511 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 584:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 670:66]
  wire  _T_4529 = _T_2795 & _T_1217; // @[Mux.scala 27:72]
  wire  _T_4530 = _T_2817 & _T_3832; // @[Mux.scala 27:72]
  wire  _T_4531 = _T_2839 & _T_4025; // @[Mux.scala 27:72]
  wire  _T_4532 = _T_2861 & _T_4218; // @[Mux.scala 27:72]
  wire  _T_4533 = _T_4529 | _T_4530; // @[Mux.scala 27:72]
  wire  _T_4534 = _T_4533 | _T_4531; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4534 | _T_4532; // @[Mux.scala 27:72]
  wire  _T_4540 = buf_error[0] & _T_1217; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4545 = buf_error[1] & _T_3832; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4550 = buf_error[2] & _T_4025; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4555 = buf_error[3] & _T_4218; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4556 = _T_2795 & _T_4540; // @[Mux.scala 27:72]
  wire  _T_4557 = _T_2817 & _T_4545; // @[Mux.scala 27:72]
  wire  _T_4558 = _T_2839 & _T_4550; // @[Mux.scala 27:72]
  wire  _T_4559 = _T_2861 & _T_4555; // @[Mux.scala 27:72]
  wire  _T_4560 = _T_4556 | _T_4557; // @[Mux.scala 27:72]
  wire  _T_4561 = _T_4560 | _T_4558; // @[Mux.scala 27:72]
  wire  _T_4568 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4569 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4570 = _T_4568 | _T_4569; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4571 = _T_4529 & _T_4570; // @[el2_lsu_bus_buffer.scala 588:106]
  wire  _T_4576 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4577 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4578 = _T_4576 | _T_4577; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4579 = _T_4530 & _T_4578; // @[el2_lsu_bus_buffer.scala 588:106]
  wire  _T_4584 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4585 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4586 = _T_4584 | _T_4585; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4587 = _T_4531 & _T_4586; // @[el2_lsu_bus_buffer.scala 588:106]
  wire  _T_4592 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4593 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4594 = _T_4592 | _T_4593; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4595 = _T_4532 & _T_4594; // @[el2_lsu_bus_buffer.scala 588:106]
  wire [1:0] _T_4598 = _T_4587 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4599 = _T_4595 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_390 = {{1'd0}, _T_4579}; // @[Mux.scala 27:72]
  wire [1:0] _T_4601 = _GEN_390 | _T_4598; // @[Mux.scala 27:72]
  wire [31:0] _T_4636 = _T_4571 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4637 = _T_4579 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4638 = _T_4587 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4639 = _T_4595 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4640 = _T_4636 | _T_4637; // @[Mux.scala 27:72]
  wire [31:0] _T_4641 = _T_4640 | _T_4638; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4641 | _T_4639; // @[Mux.scala 27:72]
  wire  _T_4647 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4648 = _T_4529 & _T_4647; // @[el2_lsu_bus_buffer.scala 590:105]
  wire  _T_4653 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4654 = _T_4530 & _T_4653; // @[el2_lsu_bus_buffer.scala 590:105]
  wire  _T_4659 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4660 = _T_4531 & _T_4659; // @[el2_lsu_bus_buffer.scala 590:105]
  wire  _T_4665 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4666 = _T_4532 & _T_4665; // @[el2_lsu_bus_buffer.scala 590:105]
  wire [31:0] _T_4667 = _T_4648 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4668 = _T_4654 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4669 = _T_4660 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4670 = _T_4666 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4667 | _T_4668; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4671 | _T_4669; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4672 | _T_4670; // @[Mux.scala 27:72]
  wire  _T_4674 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 119:123]
  wire  _T_4675 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 119:123]
  wire  _T_4676 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 119:123]
  wire  _T_4677 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 119:123]
  wire [31:0] _T_4678 = _T_4674 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4679 = _T_4675 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4680 = _T_4676 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4681 = _T_4677 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4682 = _T_4678 | _T_4679; // @[Mux.scala 27:72]
  wire [31:0] _T_4683 = _T_4682 | _T_4680; // @[Mux.scala 27:72]
  wire [31:0] _T_4684 = _T_4683 | _T_4681; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4684[1:0]; // @[el2_lsu_bus_buffer.scala 591:83]
  wire [1:0] _T_4690 = _T_4674 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4691 = _T_4675 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4692 = _T_4676 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4693 = _T_4677 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4694 = _T_4690 | _T_4691; // @[Mux.scala 27:72]
  wire [1:0] _T_4695 = _T_4694 | _T_4692; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4695 | _T_4693; // @[Mux.scala 27:72]
  wire  _T_4705 = _T_4674 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4706 = _T_4675 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4707 = _T_4676 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4708 = _T_4677 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4709 = _T_4705 | _T_4706; // @[Mux.scala 27:72]
  wire  _T_4710 = _T_4709 | _T_4707; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4710 | _T_4708; // @[Mux.scala 27:72]
  wire [63:0] _T_4730 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_391 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 595:121]
  wire [5:0] _T_4731 = _GEN_391 * 4'h8; // @[el2_lsu_bus_buffer.scala 595:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4730 >> _T_4731; // @[el2_lsu_bus_buffer.scala 595:92]
  wire  _T_4732 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 598:69]
  wire  _T_4734 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 599:81]
  wire  _T_4735 = lsu_nonblock_unsign & _T_4734; // @[el2_lsu_bus_buffer.scala 599:63]
  wire [31:0] _T_4737 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4738 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 600:45]
  wire  _T_4739 = lsu_nonblock_unsign & _T_4738; // @[el2_lsu_bus_buffer.scala 600:26]
  wire [31:0] _T_4741 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4742 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 601:6]
  wire  _T_4744 = _T_4742 & _T_4734; // @[el2_lsu_bus_buffer.scala 601:27]
  wire [23:0] _T_4747 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4749 = {_T_4747,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4752 = _T_4742 & _T_4738; // @[el2_lsu_bus_buffer.scala 602:27]
  wire [15:0] _T_4755 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4757 = {_T_4755,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4758 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 603:21]
  wire [31:0] _T_4759 = _T_4735 ? _T_4737 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4760 = _T_4739 ? _T_4741 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4761 = _T_4744 ? _T_4749 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4762 = _T_4752 ? _T_4757 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4763 = _T_4758 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4764 = _T_4759 | _T_4760; // @[Mux.scala 27:72]
  wire [31:0] _T_4765 = _T_4764 | _T_4761; // @[Mux.scala 27:72]
  wire [31:0] _T_4766 = _T_4765 | _T_4762; // @[Mux.scala 27:72]
  wire [63:0] _GEN_392 = {{32'd0}, _T_4766}; // @[Mux.scala 27:72]
  wire [63:0] _T_4767 = _GEN_392 | _T_4763; // @[Mux.scala 27:72]
  wire  _T_4862 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 621:36]
  wire  _T_4863 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 621:51]
  wire  _T_4864 = _T_4862 & _T_4863; // @[el2_lsu_bus_buffer.scala 621:49]
  wire [31:0] _T_4868 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4870 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4875 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 633:50]
  wire  _T_4876 = _T_4862 & _T_4875; // @[el2_lsu_bus_buffer.scala 633:48]
  wire [7:0] _T_4880 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4883 = obuf_valid & _T_1356; // @[el2_lsu_bus_buffer.scala 638:36]
  wire  _T_4885 = _T_4883 & _T_1362; // @[el2_lsu_bus_buffer.scala 638:50]
  wire  _T_4897 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 651:114]
  wire  _T_4899 = _T_4897 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 651:129]
  wire  _T_4902 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 651:114]
  wire  _T_4904 = _T_4902 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 651:129]
  wire  _T_4907 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 651:114]
  wire  _T_4909 = _T_4907 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 651:129]
  wire  _T_4912 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 651:114]
  wire  _T_4914 = _T_4912 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 651:129]
  wire  _T_4915 = _T_2795 & _T_4899; // @[Mux.scala 27:72]
  wire  _T_4916 = _T_2817 & _T_4904; // @[Mux.scala 27:72]
  wire  _T_4917 = _T_2839 & _T_4909; // @[Mux.scala 27:72]
  wire  _T_4918 = _T_2861 & _T_4914; // @[Mux.scala 27:72]
  wire  _T_4919 = _T_4915 | _T_4916; // @[Mux.scala 27:72]
  wire  _T_4920 = _T_4919 | _T_4917; // @[Mux.scala 27:72]
  wire  _T_4930 = _T_2817 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 652:98]
  wire  lsu_imprecise_error_store_tag = _T_4930 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 652:113]
  wire  _T_4936 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 654:72]
  wire  _T_4938 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 119:123]
  wire [31:0] _T_4940 = _T_4938 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4941 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4942 = _T_4940 | _T_4941; // @[Mux.scala 27:72]
  wire  _T_4959 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 661:68]
  wire  _T_4962 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 662:48]
  wire  _T_4965 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 665:48]
  wire  _T_4966 = io_lsu_axi_awvalid & _T_4965; // @[el2_lsu_bus_buffer.scala 665:46]
  wire  _T_4967 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 665:92]
  wire  _T_4968 = io_lsu_axi_wvalid & _T_4967; // @[el2_lsu_bus_buffer.scala 665:90]
  wire  _T_4969 = _T_4966 | _T_4968; // @[el2_lsu_bus_buffer.scala 665:69]
  wire  _T_4970 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 665:136]
  wire  _T_4971 = io_lsu_axi_arvalid & _T_4970; // @[el2_lsu_bus_buffer.scala 665:134]
  wire  _T_4975 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 669:75]
  wire  _T_4976 = io_lsu_busreq_m & _T_4975; // @[el2_lsu_bus_buffer.scala 669:73]
  reg  _T_4979; // @[el2_lsu_bus_buffer.scala 669:56]
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
  assign io_lsu_busreq_r = _T_4979; // @[el2_lsu_bus_buffer.scala 669:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 577:30]
  assign io_lsu_bus_buffer_full_any = _T_4489 ? _T_4490 : _T_4491; // @[el2_lsu_bus_buffer.scala 578:30]
  assign io_lsu_bus_buffer_empty_any = _T_4502 & _T_1244; // @[el2_lsu_bus_buffer.scala 579:31]
  assign io_lsu_bus_idle_any = 1'h1; // @[el2_lsu_bus_buffer.scala 658:23]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 196:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 197:25]
  assign io_ld_fwddata_buf_lo = _T_646[31:0]; // @[el2_lsu_bus_buffer.scala 222:24]
  assign io_ld_fwddata_buf_hi = _T_741[31:0]; // @[el2_lsu_bus_buffer.scala 227:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4936; // @[el2_lsu_bus_buffer.scala 654:35]
  assign io_lsu_imprecise_error_store_any = _T_4920 | _T_4918; // @[el2_lsu_bus_buffer.scala 651:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4942 : _T_4684; // @[el2_lsu_bus_buffer.scala 655:35]
  assign io_lsu_nonblock_load_valid_m = _T_4508 & _T_4509; // @[el2_lsu_bus_buffer.scala 581:32]
  assign io_lsu_nonblock_load_tag_m = _T_1876 ? 2'h0 : _T_1912; // @[el2_lsu_bus_buffer.scala 582:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4511; // @[el2_lsu_bus_buffer.scala 584:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 585:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4732; // @[el2_lsu_bus_buffer.scala 598:35]
  assign io_lsu_nonblock_load_data_error = _T_4561 | _T_4559; // @[el2_lsu_bus_buffer.scala 587:35]
  assign io_lsu_nonblock_load_data_tag = _T_4601 | _T_4599; // @[el2_lsu_bus_buffer.scala 588:33]
  assign io_lsu_nonblock_load_data = _T_4767[31:0]; // @[el2_lsu_bus_buffer.scala 599:29]
  assign io_lsu_pmu_bus_trxn = _T_4959 | _T_4854; // @[el2_lsu_bus_buffer.scala 661:23]
  assign io_lsu_pmu_bus_misaligned = _T_4962 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 662:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 663:24]
  assign io_lsu_pmu_bus_busy = _T_4969 | _T_4971; // @[el2_lsu_bus_buffer.scala 665:23]
  assign io_lsu_axi_awvalid = _T_4864 & _T_1252; // @[el2_lsu_bus_buffer.scala 621:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1861}; // @[el2_lsu_bus_buffer.scala 622:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4868; // @[el2_lsu_bus_buffer.scala 623:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 627:23]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu_bus_buffer.scala 628:20]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4870 : 3'h3; // @[el2_lsu_bus_buffer.scala 624:21]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu_bus_buffer.scala 629:22]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu_bus_buffer.scala 631:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 626:22]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu_bus_buffer.scala 625:21]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu_bus_buffer.scala 630:20]
  assign io_lsu_axi_wvalid = _T_4876 & _T_1252; // @[el2_lsu_bus_buffer.scala 633:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 635:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4880; // @[el2_lsu_bus_buffer.scala 634:20]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu_bus_buffer.scala 636:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 649:21]
  assign io_lsu_axi_arvalid = _T_4885 & _T_1252; // @[el2_lsu_bus_buffer.scala 638:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1861}; // @[el2_lsu_bus_buffer.scala 639:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4868; // @[el2_lsu_bus_buffer.scala 640:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 644:23]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu_bus_buffer.scala 645:20]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4870 : 3'h3; // @[el2_lsu_bus_buffer.scala 641:21]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu_bus_buffer.scala 646:22]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu_bus_buffer.scala 648:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 643:22]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu_bus_buffer.scala 642:21]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu_bus_buffer.scala 647:20]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 650:21]
  assign io_test = _T_745 | _T_744; // @[el2_lsu_bus_buffer.scala 256:11]
  assign io_data_hi = _T_4672 | _T_4670; // @[el2_lsu_bus_buffer.scala 596:14]
  assign io_data_lo = _T_4641 | _T_4639; // @[el2_lsu_bus_buffer.scala 597:14]
  assign io_data_en = {_T_4412,buf_data_en_0}; // @[el2_lsu_bus_buffer.scala 570:14]
  assign io_Cmdptr0 = 2'h0; // @[el2_lsu_bus_buffer.scala 315:14]
  assign io_Cmdptr1 = 2'h0; // @[el2_lsu_bus_buffer.scala 357:14]
  assign io_WrPtr1_r = WrPtr1_r; // @[el2_lsu_bus_buffer.scala 276:15]
  assign io_WrPtr1_m = _T_1927 ? 2'h0 : _T_1972; // @[el2_lsu_bus_buffer.scala 426:15]
  assign io_wdata_in = {_T_1633,_T_1592}; // @[el2_lsu_bus_buffer.scala 392:15]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_io_en = _T_845 & _T_846; // @[el2_lib.scala 488:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_1_io_en = _T_845 & _T_846; // @[el2_lib.scala 488:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_2_io_en = _T_1253 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 487:18]
  assign rvclkhdr_3_io_en = _T_1253 & io_lsu_bus_clk_en; // @[el2_lib.scala 488:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_4_io_en = _T_3524 & buf_state_en_0; // @[el2_lib.scala 488:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_5_io_en = _T_3717 & buf_state_en_1; // @[el2_lib.scala 488:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_6_io_en = _T_3910 & buf_state_en_2; // @[el2_lib.scala 488:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_7_io_en = _T_4103 & buf_state_en_3; // @[el2_lib.scala 488:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_8_io_en = _T_3524 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 488:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_9_io_en = _T_3717 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 488:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_10_io_en = _T_3910 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 488:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 489:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 487:18]
  assign rvclkhdr_11_io_en = _T_4103 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 488:17]
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
  _T_4356 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4353 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4350 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4347 = _RAND_4[0:0];
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
  _T_4383 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  _T_4381 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  _T_4379 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  _T_4377 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  buf_ageQ_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1861 = _RAND_17[1:0];
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
  _T_4326 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4323 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4320 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4317 = _RAND_53[0:0];
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
  _T_4303 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4301 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4299 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4297 = _RAND_88[0:0];
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
  _T_4332 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4335 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4338 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4341 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4407 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4402 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4397 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4392 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4979 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4356 = 1'h0;
  end
  if (reset) begin
    _T_4353 = 1'h0;
  end
  if (reset) begin
    _T_4350 = 1'h0;
  end
  if (reset) begin
    _T_4347 = 1'h0;
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
    _T_4383 = 3'h0;
  end
  if (reset) begin
    _T_4381 = 3'h0;
  end
  if (reset) begin
    _T_4379 = 3'h0;
  end
  if (reset) begin
    _T_4377 = 3'h0;
  end
  if (reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_1861 = 2'h0;
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
    _T_4326 = 1'h0;
  end
  if (reset) begin
    _T_4323 = 1'h0;
  end
  if (reset) begin
    _T_4320 = 1'h0;
  end
  if (reset) begin
    _T_4317 = 1'h0;
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
    _T_4303 = 1'h0;
  end
  if (reset) begin
    _T_4301 = 1'h0;
  end
  if (reset) begin
    _T_4299 = 1'h0;
  end
  if (reset) begin
    _T_4297 = 1'h0;
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
    _T_4332 = 1'h0;
  end
  if (reset) begin
    _T_4335 = 1'h0;
  end
  if (reset) begin
    _T_4338 = 1'h0;
  end
  if (reset) begin
    _T_4341 = 1'h0;
  end
  if (reset) begin
    _T_4407 = 1'h0;
  end
  if (reset) begin
    _T_4402 = 1'h0;
  end
  if (reset) begin
    _T_4397 = 1'h0;
  end
  if (reset) begin
    _T_4392 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4979 = 1'h0;
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
    end else if (_T_3339) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4356 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4356 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4353 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4353 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4350 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4350 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4347 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4347 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3524) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3547) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3551) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3585) begin
        if (_T_3590) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3598) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3626) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3672) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3678) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3690) begin
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
    end else if (_T_3348) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3717) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3740) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3744) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3778) begin
        if (_T_3783) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3791) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3819) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3865) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3871) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3883) begin
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
    end else if (_T_3357) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3910) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3933) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3937) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3971) begin
        if (_T_3976) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3984) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4012) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4058) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4064) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4076) begin
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
    end else if (_T_3366) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4103) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4126) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4130) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4164) begin
        if (_T_4169) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4177) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4205) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4251) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4257) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4269) begin
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
      _T_4383 <= 3'h0;
    end else if (buf_wr_en_3) begin
      _T_4383 <= buf_byteen_in_3;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4381 <= 3'h0;
    end else if (buf_wr_en_2) begin
      _T_4381 <= buf_byteen_in_2;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4379 <= 3'h0;
    end else if (buf_wr_en_1) begin
      _T_4379 <= buf_byteen_in_1;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4377 <= 3'h0;
    end else if (buf_wr_en_0) begin
      _T_4377 <= buf_byteen_in_0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2547,_T_2470};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1861 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1861 <= WrPtr0_r;
      end else begin
        _T_1861 <= 2'h0;
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
      obuf_valid <= _T_1852 & _T_1853;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1253 & io_lsu_bus_clk_en;
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
      ibuf_valid <= _T_997 & _T_998;
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
      buf_ageQ_2 <= {_T_2445,_T_2368};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2343,_T_2266};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2241,_T_2164};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3524) begin
      if (_T_3539) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3547) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3551) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3585) begin
      if (_T_3665) begin
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
    end else if (_T_3717) begin
      if (_T_3732) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3740) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3744) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3778) begin
      if (_T_3858) begin
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
    end else if (_T_3910) begin
      if (_T_3925) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3933) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3937) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3971) begin
      if (_T_4051) begin
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
    end else if (_T_4103) begin
      if (_T_4118) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4126) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4130) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4164) begin
      if (_T_4244) begin
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
    end else if (_T_915) begin
      ibuf_timer <= _T_918;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (_T_1003) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1927) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1941) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1955) begin
      WrPtr1_r <= 2'h2;
    end else if (_T_1969) begin
      WrPtr1_r <= 2'h3;
    end else begin
      WrPtr1_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1876) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1887) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1898) begin
      WrPtr0_r <= 2'h2;
    end else if (_T_1909) begin
      WrPtr0_r <= 2'h3;
    end else begin
      WrPtr0_r <= 2'h0;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_1003) begin
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
      ibuf_data <= {_T_914,_T_885};
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (_T_1003) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_1003) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_1003) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_1003) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_1003) begin
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
    end else if (_T_1071) begin
      obuf_wr_timer <= _T_1073;
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
      _T_4326 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4326 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4323 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4323 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4320 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4320 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4317 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4317 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1318 & _T_4851;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1318 & _T_4852;
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
      obuf_rdrsp_pend <= _T_1343 | _T_1347;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1349) begin
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
      obuf_data <= {_T_1633,_T_1592};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3169,_T_3158};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3184,_T_3173};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3199,_T_3188};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3214,_T_3203};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4303 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4103) begin
        _T_4303 <= 1'h0;
      end else if (_T_4126) begin
        _T_4303 <= 1'h0;
      end else begin
        _T_4303 <= _T_4130;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4301 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3910) begin
        _T_4301 <= 1'h0;
      end else if (_T_3933) begin
        _T_4301 <= 1'h0;
      end else begin
        _T_4301 <= _T_3937;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4299 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3717) begin
        _T_4299 <= 1'h0;
      end else if (_T_3740) begin
        _T_4299 <= 1'h0;
      end else begin
        _T_4299 <= _T_3744;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4297 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3524) begin
        _T_4297 <= 1'h0;
      end else if (_T_3547) begin
        _T_4297 <= 1'h0;
      end else begin
        _T_4297 <= _T_3551;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3524) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3547) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3551) begin
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
      end else if (_T_3339) begin
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
      if (_T_4103) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4126) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4130) begin
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
      if (_T_3910) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3933) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3937) begin
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
      if (_T_3717) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3740) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3744) begin
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
      end else if (_T_3348) begin
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
      end else if (_T_3357) begin
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
      end else if (_T_3366) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4332 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4332 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4335 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4335 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4338 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4338 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4341 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4341 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4407 <= 1'h0;
    end else begin
      _T_4407 <= _T_4404 & _T_4405;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4402 <= 1'h0;
    end else begin
      _T_4402 <= _T_4399 & _T_4400;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4397 <= 1'h0;
    end else begin
      _T_4397 <= _T_4394 & _T_4395;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4392 <= 1'h0;
    end else begin
      _T_4392 <= _T_4389 & _T_4390;
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
      _T_4979 <= 1'h0;
    end else begin
      _T_4979 <= _T_4976 & _T_4509;
    end
  end
endmodule
