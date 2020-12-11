module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[lib.scala 318:26]
  wire  clkhdr_CK; // @[lib.scala 318:26]
  wire  clkhdr_EN; // @[lib.scala 318:26]
  wire  clkhdr_SE; // @[lib.scala 318:26]
  gated_latch clkhdr ( // @[lib.scala 318:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[lib.scala 319:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 320:18]
  assign clkhdr_EN = io_en; // @[lib.scala 321:18]
  assign clkhdr_SE = io_scan_mode; // @[lib.scala 322:18]
endmodule
module dma_ctrl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_dma_bus_clk_en,
  input         io_clk_override,
  input         io_scan_mode,
  input  [1:0]  io_dbg_cmd_size,
  output [31:0] io_dma_dbg_rddata,
  output        io_dma_dbg_cmd_done,
  output        io_dma_dbg_cmd_fail,
  input         io_dbg_dma_dbg_ib_dbg_cmd_valid,
  input         io_dbg_dma_dbg_ib_dbg_cmd_write,
  input  [1:0]  io_dbg_dma_dbg_ib_dbg_cmd_type,
  input  [31:0] io_dbg_dma_dbg_ib_dbg_cmd_addr,
  input  [31:0] io_dbg_dma_dbg_dctl_dbg_cmd_wrdata,
  input         io_dbg_dma_io_dbg_dma_bubble,
  output        io_dbg_dma_io_dma_dbg_ready,
  output        io_dec_dma_dctl_dma_dma_dccm_stall_any,
  output        io_dec_dma_tlu_dma_dma_pmu_dccm_read,
  output        io_dec_dma_tlu_dma_dma_pmu_dccm_write,
  output        io_dec_dma_tlu_dma_dma_pmu_any_read,
  output        io_dec_dma_tlu_dma_dma_pmu_any_write,
  input  [2:0]  io_dec_dma_tlu_dma_dec_tlu_dma_qos_prty,
  output        io_dec_dma_tlu_dma_dma_dccm_stall_any,
  output        io_dec_dma_tlu_dma_dma_iccm_stall_any,
  input         io_iccm_dma_rvalid,
  input         io_iccm_dma_ecc_error,
  input  [2:0]  io_iccm_dma_rtag,
  input  [63:0] io_iccm_dma_rdata,
  input         io_iccm_ready,
  output        io_dma_axi_aw_ready,
  input         io_dma_axi_aw_valid,
  input         io_dma_axi_aw_bits_id,
  input  [31:0] io_dma_axi_aw_bits_addr,
  input  [3:0]  io_dma_axi_aw_bits_region,
  input  [7:0]  io_dma_axi_aw_bits_len,
  input  [2:0]  io_dma_axi_aw_bits_size,
  input  [1:0]  io_dma_axi_aw_bits_burst,
  input         io_dma_axi_aw_bits_lock,
  input  [3:0]  io_dma_axi_aw_bits_cache,
  input  [2:0]  io_dma_axi_aw_bits_prot,
  input  [3:0]  io_dma_axi_aw_bits_qos,
  output        io_dma_axi_w_ready,
  input         io_dma_axi_w_valid,
  input  [63:0] io_dma_axi_w_bits_data,
  input  [7:0]  io_dma_axi_w_bits_strb,
  input         io_dma_axi_w_bits_last,
  input         io_dma_axi_b_ready,
  output        io_dma_axi_b_valid,
  output [1:0]  io_dma_axi_b_bits_resp,
  output        io_dma_axi_b_bits_id,
  output        io_dma_axi_ar_ready,
  input         io_dma_axi_ar_valid,
  input         io_dma_axi_ar_bits_id,
  input  [31:0] io_dma_axi_ar_bits_addr,
  input  [3:0]  io_dma_axi_ar_bits_region,
  input  [7:0]  io_dma_axi_ar_bits_len,
  input  [2:0]  io_dma_axi_ar_bits_size,
  input  [1:0]  io_dma_axi_ar_bits_burst,
  input         io_dma_axi_ar_bits_lock,
  input  [3:0]  io_dma_axi_ar_bits_cache,
  input  [2:0]  io_dma_axi_ar_bits_prot,
  input  [3:0]  io_dma_axi_ar_bits_qos,
  input         io_dma_axi_r_ready,
  output        io_dma_axi_r_valid,
  output        io_dma_axi_r_bits_id,
  output [63:0] io_dma_axi_r_bits_data,
  output [1:0]  io_dma_axi_r_bits_resp,
  output        io_dma_axi_r_bits_last,
  output        io_lsu_dma_dma_lsc_ctl_dma_dccm_req,
  output [31:0] io_lsu_dma_dma_lsc_ctl_dma_mem_addr,
  output [2:0]  io_lsu_dma_dma_lsc_ctl_dma_mem_sz,
  output        io_lsu_dma_dma_lsc_ctl_dma_mem_write,
  output [63:0] io_lsu_dma_dma_lsc_ctl_dma_mem_wdata,
  output [31:0] io_lsu_dma_dma_dccm_ctl_dma_mem_addr,
  output [63:0] io_lsu_dma_dma_dccm_ctl_dma_mem_wdata,
  input         io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid,
  input         io_lsu_dma_dma_dccm_ctl_dccm_dma_ecc_error,
  input  [2:0]  io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag,
  input  [63:0] io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata,
  input         io_lsu_dma_dccm_ready,
  output [2:0]  io_lsu_dma_dma_mem_tag,
  output        io_ifu_dma_dma_ifc_dma_iccm_stall_any,
  output        io_ifu_dma_dma_mem_ctl_dma_iccm_req,
  output [31:0] io_ifu_dma_dma_mem_ctl_dma_mem_addr,
  output [2:0]  io_ifu_dma_dma_mem_ctl_dma_mem_sz,
  output        io_ifu_dma_dma_mem_ctl_dma_mem_write,
  output [63:0] io_ifu_dma_dma_mem_ctl_dma_mem_wdata,
  output [2:0]  io_ifu_dma_dma_mem_ctl_dma_mem_tag
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
  reg [63:0] _RAND_49;
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
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [63:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_scan_mode; // @[lib.scala 352:23]
  wire  dma_buffer_c1cgc_io_l1clk; // @[dma_ctrl.scala 389:32]
  wire  dma_buffer_c1cgc_io_clk; // @[dma_ctrl.scala 389:32]
  wire  dma_buffer_c1cgc_io_en; // @[dma_ctrl.scala 389:32]
  wire  dma_buffer_c1cgc_io_scan_mode; // @[dma_ctrl.scala 389:32]
  wire  dma_free_cgc_io_l1clk; // @[dma_ctrl.scala 395:28]
  wire  dma_free_cgc_io_clk; // @[dma_ctrl.scala 395:28]
  wire  dma_free_cgc_io_en; // @[dma_ctrl.scala 395:28]
  wire  dma_free_cgc_io_scan_mode; // @[dma_ctrl.scala 395:28]
  wire  dma_bus_cgc_io_l1clk; // @[dma_ctrl.scala 401:27]
  wire  dma_bus_cgc_io_clk; // @[dma_ctrl.scala 401:27]
  wire  dma_bus_cgc_io_en; // @[dma_ctrl.scala 401:27]
  wire  dma_bus_cgc_io_scan_mode; // @[dma_ctrl.scala 401:27]
  wire  rvclkhdr_10_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_12_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_12_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_12_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_12_io_scan_mode; // @[lib.scala 352:23]
  wire  dma_free_clk = dma_free_cgc_io_l1clk; // @[dma_ctrl.scala 168:26 dma_ctrl.scala 399:29]
  reg [2:0] RdPtr; // @[Reg.scala 27:20]
  reg [31:0] fifo_addr_4; // @[lib.scala 358:16]
  reg [31:0] fifo_addr_3; // @[lib.scala 358:16]
  reg [31:0] fifo_addr_2; // @[lib.scala 358:16]
  reg [31:0] fifo_addr_1; // @[lib.scala 358:16]
  reg [31:0] fifo_addr_0; // @[lib.scala 358:16]
  wire [31:0] _GEN_60 = 3'h1 == RdPtr ? fifo_addr_1 : fifo_addr_0; // @[dma_ctrl.scala 355:20]
  wire [31:0] _GEN_61 = 3'h2 == RdPtr ? fifo_addr_2 : _GEN_60; // @[dma_ctrl.scala 355:20]
  wire [31:0] _GEN_62 = 3'h3 == RdPtr ? fifo_addr_3 : _GEN_61; // @[dma_ctrl.scala 355:20]
  wire [31:0] dma_mem_addr_int = 3'h4 == RdPtr ? fifo_addr_4 : _GEN_62; // @[dma_ctrl.scala 355:20]
  wire  dma_mem_addr_in_dccm = dma_mem_addr_int[31:16] == 16'hf004; // @[lib.scala 345:39]
  wire  dma_mem_addr_in_pic = dma_mem_addr_int[31:15] == 17'h1e018; // @[lib.scala 345:39]
  wire  dma_mem_addr_in_iccm = dma_mem_addr_int[31:16] == 16'hee00; // @[lib.scala 345:39]
  wire  dma_bus_clk = dma_bus_cgc_io_l1clk; // @[dma_ctrl.scala 170:25 dma_ctrl.scala 405:28]
  reg  wrbuf_vld; // @[dma_ctrl.scala 415:59]
  reg  wrbuf_data_vld; // @[dma_ctrl.scala 417:59]
  wire  _T_1260 = wrbuf_vld & wrbuf_data_vld; // @[dma_ctrl.scala 473:43]
  reg  rdbuf_vld; // @[dma_ctrl.scala 441:47]
  wire  _T_1261 = _T_1260 & rdbuf_vld; // @[dma_ctrl.scala 473:60]
  reg  axi_mstr_priority; // @[Reg.scala 27:20]
  wire  axi_mstr_sel = _T_1261 ? axi_mstr_priority : _T_1260; // @[dma_ctrl.scala 473:31]
  reg [31:0] wrbuf_addr; // @[lib.scala 358:16]
  reg [31:0] rdbuf_addr; // @[lib.scala 358:16]
  wire [31:0] bus_cmd_addr = axi_mstr_sel ? wrbuf_addr : rdbuf_addr; // @[dma_ctrl.scala 463:43]
  wire [2:0] _GEN_90 = {{2'd0}, io_dbg_dma_dbg_ib_dbg_cmd_addr[2]}; // @[dma_ctrl.scala 195:91]
  wire [3:0] _T_17 = 3'h4 * _GEN_90; // @[dma_ctrl.scala 195:91]
  wire [18:0] _T_18 = 19'hf << _T_17; // @[dma_ctrl.scala 195:83]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  wire [18:0] _T_20 = io_dbg_dma_dbg_ib_dbg_cmd_valid ? _T_18 : {{11'd0}, wrbuf_byteen}; // @[dma_ctrl.scala 195:34]
  wire [2:0] _T_23 = {1'h0,io_dbg_cmd_size}; // @[Cat.scala 29:58]
  reg [2:0] wrbuf_sz; // @[Reg.scala 27:20]
  reg [2:0] rdbuf_sz; // @[Reg.scala 27:20]
  wire [2:0] bus_cmd_sz = axi_mstr_sel ? wrbuf_sz : rdbuf_sz; // @[dma_ctrl.scala 464:45]
  wire [2:0] fifo_sz_in = io_dbg_dma_dbg_ib_dbg_cmd_valid ? _T_23 : bus_cmd_sz; // @[dma_ctrl.scala 197:33]
  wire  fifo_write_in = io_dbg_dma_dbg_ib_dbg_cmd_valid ? io_dbg_dma_dbg_ib_dbg_cmd_write : axi_mstr_sel; // @[dma_ctrl.scala 199:33]
  wire  bus_cmd_valid = _T_1260 | rdbuf_vld; // @[dma_ctrl.scala 459:69]
  reg  fifo_full; // @[dma_ctrl.scala 373:12]
  reg  dbg_dma_bubble_bus; // @[dma_ctrl.scala 377:12]
  wire  _T_989 = fifo_full | dbg_dma_bubble_bus; // @[dma_ctrl.scala 299:39]
  wire  dma_fifo_ready = ~_T_989; // @[dma_ctrl.scala 299:27]
  wire  axi_mstr_prty_en = bus_cmd_valid & dma_fifo_ready; // @[dma_ctrl.scala 460:54]
  wire  _T_28 = axi_mstr_prty_en & io_dma_bus_clk_en; // @[dma_ctrl.scala 206:80]
  wire  _T_31 = io_dbg_dma_dbg_ib_dbg_cmd_valid & io_dbg_dma_dbg_ib_dbg_cmd_type[1]; // @[dma_ctrl.scala 206:136]
  wire  _T_32 = _T_28 | _T_31; // @[dma_ctrl.scala 206:101]
  reg [2:0] WrPtr; // @[Reg.scala 27:20]
  wire  _T_33 = 3'h0 == WrPtr; // @[dma_ctrl.scala 206:188]
  wire  _T_34 = _T_32 & _T_33; // @[dma_ctrl.scala 206:181]
  wire  _T_41 = 3'h1 == WrPtr; // @[dma_ctrl.scala 206:188]
  wire  _T_42 = _T_32 & _T_41; // @[dma_ctrl.scala 206:181]
  wire  _T_49 = 3'h2 == WrPtr; // @[dma_ctrl.scala 206:188]
  wire  _T_50 = _T_32 & _T_49; // @[dma_ctrl.scala 206:181]
  wire  _T_57 = 3'h3 == WrPtr; // @[dma_ctrl.scala 206:188]
  wire  _T_58 = _T_32 & _T_57; // @[dma_ctrl.scala 206:181]
  wire  _T_65 = 3'h4 == WrPtr; // @[dma_ctrl.scala 206:188]
  wire  _T_66 = _T_32 & _T_65; // @[dma_ctrl.scala 206:181]
  wire [4:0] fifo_cmd_en = {_T_66,_T_58,_T_50,_T_42,_T_34}; // @[Cat.scala 29:58]
  wire  _T_71 = axi_mstr_prty_en & fifo_write_in; // @[dma_ctrl.scala 208:73]
  wire  _T_72 = _T_71 & io_dma_bus_clk_en; // @[dma_ctrl.scala 208:89]
  wire  _T_75 = _T_31 & io_dbg_dma_dbg_ib_dbg_cmd_write; // @[dma_ctrl.scala 208:181]
  wire  _T_76 = _T_72 | _T_75; // @[dma_ctrl.scala 208:110]
  wire  _T_78 = _T_76 & _T_33; // @[dma_ctrl.scala 208:217]
  reg  _T_598; // @[dma_ctrl.scala 226:82]
  reg  _T_591; // @[dma_ctrl.scala 226:82]
  reg  _T_584; // @[dma_ctrl.scala 226:82]
  reg  _T_577; // @[dma_ctrl.scala 226:82]
  reg  _T_570; // @[dma_ctrl.scala 226:82]
  wire [4:0] fifo_valid = {_T_598,_T_591,_T_584,_T_577,_T_570}; // @[Cat.scala 29:58]
  wire [4:0] _T_990 = fifo_valid >> RdPtr; // @[dma_ctrl.scala 303:38]
  reg  _T_760; // @[dma_ctrl.scala 234:89]
  reg  _T_753; // @[dma_ctrl.scala 234:89]
  reg  _T_746; // @[dma_ctrl.scala 234:89]
  reg  _T_739; // @[dma_ctrl.scala 234:89]
  reg  _T_732; // @[dma_ctrl.scala 234:89]
  wire [4:0] fifo_done = {_T_760,_T_753,_T_746,_T_739,_T_732}; // @[Cat.scala 29:58]
  wire [4:0] _T_992 = fifo_done >> RdPtr; // @[dma_ctrl.scala 303:58]
  wire  _T_994 = ~_T_992[0]; // @[dma_ctrl.scala 303:48]
  wire  _T_995 = _T_990[0] & _T_994; // @[dma_ctrl.scala 303:46]
  wire  dma_buffer_c1_clk = dma_buffer_c1cgc_io_l1clk; // @[dma_ctrl.scala 172:31 dma_ctrl.scala 393:33]
  reg  _T_886; // @[Reg.scala 27:20]
  reg  _T_884; // @[Reg.scala 27:20]
  reg  _T_882; // @[Reg.scala 27:20]
  reg  _T_880; // @[Reg.scala 27:20]
  reg  _T_878; // @[Reg.scala 27:20]
  wire [4:0] fifo_dbg = {_T_886,_T_884,_T_882,_T_880,_T_878}; // @[Cat.scala 29:58]
  wire [4:0] _T_996 = fifo_dbg >> RdPtr; // @[dma_ctrl.scala 303:77]
  wire  _T_998 = ~_T_996[0]; // @[dma_ctrl.scala 303:68]
  wire  _T_999 = _T_995 & _T_998; // @[dma_ctrl.scala 303:66]
  wire  _T_1000 = dma_mem_addr_in_dccm | dma_mem_addr_in_iccm; // @[dma_ctrl.scala 303:111]
  wire  _T_1001 = ~_T_1000; // @[dma_ctrl.scala 303:88]
  wire  dma_address_error = _T_999 & _T_1001; // @[dma_ctrl.scala 303:85]
  wire  _T_1009 = ~dma_address_error; // @[dma_ctrl.scala 304:68]
  wire  _T_1010 = _T_995 & _T_1009; // @[dma_ctrl.scala 304:66]
  reg [2:0] fifo_sz_4; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_3; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_2; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_1; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_65 = 3'h1 == RdPtr ? fifo_sz_1 : fifo_sz_0; // @[dma_ctrl.scala 356:20]
  wire [2:0] _GEN_66 = 3'h2 == RdPtr ? fifo_sz_2 : _GEN_65; // @[dma_ctrl.scala 356:20]
  wire [2:0] _GEN_67 = 3'h3 == RdPtr ? fifo_sz_3 : _GEN_66; // @[dma_ctrl.scala 356:20]
  wire [2:0] dma_mem_sz_int = 3'h4 == RdPtr ? fifo_sz_4 : _GEN_67; // @[dma_ctrl.scala 356:20]
  wire  _T_1012 = dma_mem_sz_int == 3'h1; // @[dma_ctrl.scala 305:28]
  wire  _T_1014 = _T_1012 & dma_mem_addr_int[0]; // @[dma_ctrl.scala 305:37]
  wire  _T_1016 = dma_mem_sz_int == 3'h2; // @[dma_ctrl.scala 306:29]
  wire  _T_1018 = |dma_mem_addr_int[1:0]; // @[dma_ctrl.scala 306:64]
  wire  _T_1019 = _T_1016 & _T_1018; // @[dma_ctrl.scala 306:38]
  wire  _T_1020 = _T_1014 | _T_1019; // @[dma_ctrl.scala 305:60]
  wire  _T_1022 = dma_mem_sz_int == 3'h3; // @[dma_ctrl.scala 307:29]
  wire  _T_1024 = |dma_mem_addr_int[2:0]; // @[dma_ctrl.scala 307:64]
  wire  _T_1025 = _T_1022 & _T_1024; // @[dma_ctrl.scala 307:38]
  wire  _T_1026 = _T_1020 | _T_1025; // @[dma_ctrl.scala 306:70]
  wire  _T_1028 = dma_mem_sz_int[1:0] == 2'h2; // @[dma_ctrl.scala 308:55]
  wire  _T_1030 = dma_mem_sz_int[1:0] == 2'h3; // @[dma_ctrl.scala 308:88]
  wire  _T_1031 = _T_1028 | _T_1030; // @[dma_ctrl.scala 308:64]
  wire  _T_1032 = ~_T_1031; // @[dma_ctrl.scala 308:31]
  wire  _T_1033 = dma_mem_addr_in_iccm & _T_1032; // @[dma_ctrl.scala 308:29]
  wire  _T_1034 = _T_1026 | _T_1033; // @[dma_ctrl.scala 307:70]
  wire  _T_1035 = dma_mem_addr_in_dccm & io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[dma_ctrl.scala 309:29]
  wire  _T_1042 = _T_1035 & _T_1032; // @[dma_ctrl.scala 309:68]
  wire  _T_1043 = _T_1034 | _T_1042; // @[dma_ctrl.scala 308:108]
  wire  _T_1046 = io_lsu_dma_dma_lsc_ctl_dma_mem_write & _T_1016; // @[dma_ctrl.scala 310:45]
  wire  _T_1048 = dma_mem_addr_int[2:0] == 3'h0; // @[dma_ctrl.scala 310:114]
  reg [7:0] fifo_byteen_4; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_3; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_2; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_1; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_0; // @[Reg.scala 27:20]
  wire [7:0] _GEN_70 = 3'h1 == RdPtr ? fifo_byteen_1 : fifo_byteen_0; // @[dma_ctrl.scala 359:20]
  wire [7:0] _GEN_71 = 3'h2 == RdPtr ? fifo_byteen_2 : _GEN_70; // @[dma_ctrl.scala 359:20]
  wire [7:0] _GEN_72 = 3'h3 == RdPtr ? fifo_byteen_3 : _GEN_71; // @[dma_ctrl.scala 359:20]
  wire [7:0] dma_mem_byteen = 3'h4 == RdPtr ? fifo_byteen_4 : _GEN_72; // @[dma_ctrl.scala 359:20]
  wire [3:0] _T_1071 = _T_1048 ? dma_mem_byteen[3:0] : 4'h0; // @[Mux.scala 27:72]
  wire  _T_1051 = dma_mem_addr_int[2:0] == 3'h1; // @[dma_ctrl.scala 311:32]
  wire [3:0] _T_1072 = _T_1051 ? dma_mem_byteen[4:1] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1079 = _T_1071 | _T_1072; // @[Mux.scala 27:72]
  wire  _T_1054 = dma_mem_addr_int[2:0] == 3'h2; // @[dma_ctrl.scala 312:32]
  wire [3:0] _T_1073 = _T_1054 ? dma_mem_byteen[5:2] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1080 = _T_1079 | _T_1073; // @[Mux.scala 27:72]
  wire  _T_1057 = dma_mem_addr_int[2:0] == 3'h3; // @[dma_ctrl.scala 313:32]
  wire [3:0] _T_1074 = _T_1057 ? dma_mem_byteen[6:3] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1081 = _T_1080 | _T_1074; // @[Mux.scala 27:72]
  wire  _T_1060 = dma_mem_addr_int[2:0] == 3'h4; // @[dma_ctrl.scala 314:32]
  wire [3:0] _T_1075 = _T_1060 ? dma_mem_byteen[7:4] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1082 = _T_1081 | _T_1075; // @[Mux.scala 27:72]
  wire  _T_1063 = dma_mem_addr_int[2:0] == 3'h5; // @[dma_ctrl.scala 315:32]
  wire [2:0] _T_1076 = _T_1063 ? dma_mem_byteen[7:5] : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _GEN_91 = {{1'd0}, _T_1076}; // @[Mux.scala 27:72]
  wire [3:0] _T_1083 = _T_1082 | _GEN_91; // @[Mux.scala 27:72]
  wire  _T_1066 = dma_mem_addr_int[2:0] == 3'h6; // @[dma_ctrl.scala 316:32]
  wire [1:0] _T_1077 = _T_1066 ? dma_mem_byteen[7:6] : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _GEN_92 = {{2'd0}, _T_1077}; // @[Mux.scala 27:72]
  wire [3:0] _T_1084 = _T_1083 | _GEN_92; // @[Mux.scala 27:72]
  wire  _T_1069 = dma_mem_addr_int[2:0] == 3'h7; // @[dma_ctrl.scala 317:32]
  wire  _T_1078 = _T_1069 & dma_mem_byteen[7]; // @[Mux.scala 27:72]
  wire [3:0] _GEN_93 = {{3'd0}, _T_1078}; // @[Mux.scala 27:72]
  wire [3:0] _T_1085 = _T_1084 | _GEN_93; // @[Mux.scala 27:72]
  wire  _T_1087 = _T_1085 != 4'hf; // @[dma_ctrl.scala 317:66]
  wire  _T_1088 = _T_1046 & _T_1087; // @[dma_ctrl.scala 310:78]
  wire  _T_1089 = _T_1043 | _T_1088; // @[dma_ctrl.scala 309:145]
  wire  _T_1092 = io_lsu_dma_dma_lsc_ctl_dma_mem_write & _T_1022; // @[dma_ctrl.scala 318:45]
  wire  _T_1094 = dma_mem_byteen == 8'hf; // @[dma_ctrl.scala 318:103]
  wire  _T_1096 = dma_mem_byteen == 8'hf0; // @[dma_ctrl.scala 318:139]
  wire  _T_1097 = _T_1094 | _T_1096; // @[dma_ctrl.scala 318:116]
  wire  _T_1099 = dma_mem_byteen == 8'hff; // @[dma_ctrl.scala 318:175]
  wire  _T_1100 = _T_1097 | _T_1099; // @[dma_ctrl.scala 318:152]
  wire  _T_1101 = ~_T_1100; // @[dma_ctrl.scala 318:80]
  wire  _T_1102 = _T_1092 & _T_1101; // @[dma_ctrl.scala 318:78]
  wire  _T_1103 = _T_1089 | _T_1102; // @[dma_ctrl.scala 317:79]
  wire  dma_alignment_error = _T_1010 & _T_1103; // @[dma_ctrl.scala 304:87]
  wire  _T_79 = dma_address_error | dma_alignment_error; // @[dma_ctrl.scala 208:258]
  wire  _T_80 = 3'h0 == RdPtr; // @[dma_ctrl.scala 208:288]
  wire  _T_81 = _T_79 & _T_80; // @[dma_ctrl.scala 208:281]
  wire  _T_82 = _T_78 | _T_81; // @[dma_ctrl.scala 208:236]
  wire  _T_83 = 3'h0 == io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag; // @[dma_ctrl.scala 208:350]
  wire  _T_84 = io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid & _T_83; // @[dma_ctrl.scala 208:343]
  wire  _T_85 = _T_82 | _T_84; // @[dma_ctrl.scala 208:300]
  wire  _T_86 = 3'h0 == io_iccm_dma_rtag; // @[dma_ctrl.scala 208:423]
  wire  _T_87 = io_iccm_dma_rvalid & _T_86; // @[dma_ctrl.scala 208:416]
  wire  _T_88 = _T_85 | _T_87; // @[dma_ctrl.scala 208:394]
  wire  _T_96 = _T_76 & _T_41; // @[dma_ctrl.scala 208:217]
  wire  _T_98 = 3'h1 == RdPtr; // @[dma_ctrl.scala 208:288]
  wire  _T_99 = _T_79 & _T_98; // @[dma_ctrl.scala 208:281]
  wire  _T_100 = _T_96 | _T_99; // @[dma_ctrl.scala 208:236]
  wire  _T_101 = 3'h1 == io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag; // @[dma_ctrl.scala 208:350]
  wire  _T_102 = io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid & _T_101; // @[dma_ctrl.scala 208:343]
  wire  _T_103 = _T_100 | _T_102; // @[dma_ctrl.scala 208:300]
  wire  _T_104 = 3'h1 == io_iccm_dma_rtag; // @[dma_ctrl.scala 208:423]
  wire  _T_105 = io_iccm_dma_rvalid & _T_104; // @[dma_ctrl.scala 208:416]
  wire  _T_106 = _T_103 | _T_105; // @[dma_ctrl.scala 208:394]
  wire  _T_114 = _T_76 & _T_49; // @[dma_ctrl.scala 208:217]
  wire  _T_116 = 3'h2 == RdPtr; // @[dma_ctrl.scala 208:288]
  wire  _T_117 = _T_79 & _T_116; // @[dma_ctrl.scala 208:281]
  wire  _T_118 = _T_114 | _T_117; // @[dma_ctrl.scala 208:236]
  wire  _T_119 = 3'h2 == io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag; // @[dma_ctrl.scala 208:350]
  wire  _T_120 = io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid & _T_119; // @[dma_ctrl.scala 208:343]
  wire  _T_121 = _T_118 | _T_120; // @[dma_ctrl.scala 208:300]
  wire  _T_122 = 3'h2 == io_iccm_dma_rtag; // @[dma_ctrl.scala 208:423]
  wire  _T_123 = io_iccm_dma_rvalid & _T_122; // @[dma_ctrl.scala 208:416]
  wire  _T_124 = _T_121 | _T_123; // @[dma_ctrl.scala 208:394]
  wire  _T_132 = _T_76 & _T_57; // @[dma_ctrl.scala 208:217]
  wire  _T_134 = 3'h3 == RdPtr; // @[dma_ctrl.scala 208:288]
  wire  _T_135 = _T_79 & _T_134; // @[dma_ctrl.scala 208:281]
  wire  _T_136 = _T_132 | _T_135; // @[dma_ctrl.scala 208:236]
  wire  _T_137 = 3'h3 == io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag; // @[dma_ctrl.scala 208:350]
  wire  _T_138 = io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid & _T_137; // @[dma_ctrl.scala 208:343]
  wire  _T_139 = _T_136 | _T_138; // @[dma_ctrl.scala 208:300]
  wire  _T_140 = 3'h3 == io_iccm_dma_rtag; // @[dma_ctrl.scala 208:423]
  wire  _T_141 = io_iccm_dma_rvalid & _T_140; // @[dma_ctrl.scala 208:416]
  wire  _T_142 = _T_139 | _T_141; // @[dma_ctrl.scala 208:394]
  wire  _T_150 = _T_76 & _T_65; // @[dma_ctrl.scala 208:217]
  wire  _T_152 = 3'h4 == RdPtr; // @[dma_ctrl.scala 208:288]
  wire  _T_153 = _T_79 & _T_152; // @[dma_ctrl.scala 208:281]
  wire  _T_154 = _T_150 | _T_153; // @[dma_ctrl.scala 208:236]
  wire  _T_155 = 3'h4 == io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag; // @[dma_ctrl.scala 208:350]
  wire  _T_156 = io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid & _T_155; // @[dma_ctrl.scala 208:343]
  wire  _T_157 = _T_154 | _T_156; // @[dma_ctrl.scala 208:300]
  wire  _T_158 = 3'h4 == io_iccm_dma_rtag; // @[dma_ctrl.scala 208:423]
  wire  _T_159 = io_iccm_dma_rvalid & _T_158; // @[dma_ctrl.scala 208:416]
  wire  _T_160 = _T_157 | _T_159; // @[dma_ctrl.scala 208:394]
  wire [4:0] fifo_data_en = {_T_160,_T_142,_T_124,_T_106,_T_88}; // @[Cat.scala 29:58]
  wire  _T_165 = io_lsu_dma_dma_lsc_ctl_dma_dccm_req | io_ifu_dma_dma_mem_ctl_dma_iccm_req; // @[dma_ctrl.scala 210:95]
  wire  _T_166 = ~io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[dma_ctrl.scala 210:136]
  wire  _T_167 = _T_165 & _T_166; // @[dma_ctrl.scala 210:134]
  wire  _T_169 = _T_167 & _T_80; // @[dma_ctrl.scala 210:174]
  wire  _T_174 = _T_167 & _T_98; // @[dma_ctrl.scala 210:174]
  wire  _T_179 = _T_167 & _T_116; // @[dma_ctrl.scala 210:174]
  wire  _T_184 = _T_167 & _T_134; // @[dma_ctrl.scala 210:174]
  wire  _T_189 = _T_167 & _T_152; // @[dma_ctrl.scala 210:174]
  wire [4:0] fifo_pend_en = {_T_189,_T_184,_T_179,_T_174,_T_169}; // @[Cat.scala 29:58]
  wire  _T_1127 = _T_995 & _T_996[0]; // @[dma_ctrl.scala 328:66]
  wire  _T_1129 = _T_1000 | dma_mem_addr_in_pic; // @[dma_ctrl.scala 328:134]
  wire  _T_1130 = ~_T_1129; // @[dma_ctrl.scala 328:88]
  wire  _T_1133 = dma_mem_sz_int[1:0] != 2'h2; // @[dma_ctrl.scala 328:191]
  wire  _T_1134 = _T_1130 | _T_1133; // @[dma_ctrl.scala 328:167]
  wire  dma_dbg_cmd_error = _T_1127 & _T_1134; // @[dma_ctrl.scala 328:84]
  wire  _T_197 = _T_79 | dma_dbg_cmd_error; // @[dma_ctrl.scala 212:114]
  wire  _T_199 = _T_197 & _T_80; // @[dma_ctrl.scala 212:135]
  wire  _T_200 = io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid & io_lsu_dma_dma_dccm_ctl_dccm_dma_ecc_error; // @[dma_ctrl.scala 212:198]
  wire  _T_202 = _T_200 & _T_83; // @[dma_ctrl.scala 212:244]
  wire  _T_203 = _T_199 | _T_202; // @[dma_ctrl.scala 212:154]
  wire  _T_204 = io_iccm_dma_rvalid & io_iccm_dma_ecc_error; // @[dma_ctrl.scala 212:318]
  wire  _T_206 = _T_204 & _T_86; // @[dma_ctrl.scala 212:343]
  wire  _T_207 = _T_203 | _T_206; // @[dma_ctrl.scala 212:295]
  wire  _T_213 = _T_197 & _T_98; // @[dma_ctrl.scala 212:135]
  wire  _T_216 = _T_200 & _T_101; // @[dma_ctrl.scala 212:244]
  wire  _T_217 = _T_213 | _T_216; // @[dma_ctrl.scala 212:154]
  wire  _T_220 = _T_204 & _T_104; // @[dma_ctrl.scala 212:343]
  wire  _T_221 = _T_217 | _T_220; // @[dma_ctrl.scala 212:295]
  wire  _T_227 = _T_197 & _T_116; // @[dma_ctrl.scala 212:135]
  wire  _T_230 = _T_200 & _T_119; // @[dma_ctrl.scala 212:244]
  wire  _T_231 = _T_227 | _T_230; // @[dma_ctrl.scala 212:154]
  wire  _T_234 = _T_204 & _T_122; // @[dma_ctrl.scala 212:343]
  wire  _T_235 = _T_231 | _T_234; // @[dma_ctrl.scala 212:295]
  wire  _T_241 = _T_197 & _T_134; // @[dma_ctrl.scala 212:135]
  wire  _T_244 = _T_200 & _T_137; // @[dma_ctrl.scala 212:244]
  wire  _T_245 = _T_241 | _T_244; // @[dma_ctrl.scala 212:154]
  wire  _T_248 = _T_204 & _T_140; // @[dma_ctrl.scala 212:343]
  wire  _T_249 = _T_245 | _T_248; // @[dma_ctrl.scala 212:295]
  wire  _T_255 = _T_197 & _T_152; // @[dma_ctrl.scala 212:135]
  wire  _T_258 = _T_200 & _T_155; // @[dma_ctrl.scala 212:244]
  wire  _T_259 = _T_255 | _T_258; // @[dma_ctrl.scala 212:154]
  wire  _T_262 = _T_204 & _T_158; // @[dma_ctrl.scala 212:343]
  wire  _T_263 = _T_259 | _T_262; // @[dma_ctrl.scala 212:295]
  wire [4:0] fifo_error_en = {_T_263,_T_249,_T_235,_T_221,_T_207}; // @[Cat.scala 29:58]
  wire [1:0] _T_436 = {1'h0,io_lsu_dma_dma_dccm_ctl_dccm_dma_ecc_error}; // @[Cat.scala 29:58]
  wire [1:0] _T_439 = {1'h0,io_iccm_dma_ecc_error}; // @[Cat.scala 29:58]
  wire [1:0] _T_442 = {_T_197,dma_alignment_error}; // @[Cat.scala 29:58]
  wire [1:0] _T_443 = _T_87 ? _T_439 : _T_442; // @[dma_ctrl.scala 222:209]
  wire [1:0] fifo_error_in_0 = _T_84 ? _T_436 : _T_443; // @[dma_ctrl.scala 222:60]
  wire  _T_269 = |fifo_error_in_0; // @[dma_ctrl.scala 214:83]
  reg [1:0] fifo_error_0; // @[dma_ctrl.scala 228:85]
  wire  _T_272 = |fifo_error_0; // @[dma_ctrl.scala 214:125]
  wire [1:0] _T_454 = _T_105 ? _T_439 : _T_442; // @[dma_ctrl.scala 222:209]
  wire [1:0] fifo_error_in_1 = _T_102 ? _T_436 : _T_454; // @[dma_ctrl.scala 222:60]
  wire  _T_276 = |fifo_error_in_1; // @[dma_ctrl.scala 214:83]
  reg [1:0] fifo_error_1; // @[dma_ctrl.scala 228:85]
  wire  _T_279 = |fifo_error_1; // @[dma_ctrl.scala 214:125]
  wire [1:0] _T_465 = _T_123 ? _T_439 : _T_442; // @[dma_ctrl.scala 222:209]
  wire [1:0] fifo_error_in_2 = _T_120 ? _T_436 : _T_465; // @[dma_ctrl.scala 222:60]
  wire  _T_283 = |fifo_error_in_2; // @[dma_ctrl.scala 214:83]
  reg [1:0] fifo_error_2; // @[dma_ctrl.scala 228:85]
  wire  _T_286 = |fifo_error_2; // @[dma_ctrl.scala 214:125]
  wire [1:0] _T_476 = _T_141 ? _T_439 : _T_442; // @[dma_ctrl.scala 222:209]
  wire [1:0] fifo_error_in_3 = _T_138 ? _T_436 : _T_476; // @[dma_ctrl.scala 222:60]
  wire  _T_290 = |fifo_error_in_3; // @[dma_ctrl.scala 214:83]
  reg [1:0] fifo_error_3; // @[dma_ctrl.scala 228:85]
  wire  _T_293 = |fifo_error_3; // @[dma_ctrl.scala 214:125]
  wire [1:0] _T_487 = _T_159 ? _T_439 : _T_442; // @[dma_ctrl.scala 222:209]
  wire [1:0] fifo_error_in_4 = _T_156 ? _T_436 : _T_487; // @[dma_ctrl.scala 222:60]
  wire  _T_297 = |fifo_error_in_4; // @[dma_ctrl.scala 214:83]
  reg [1:0] fifo_error_4; // @[dma_ctrl.scala 228:85]
  wire  _T_300 = |fifo_error_4; // @[dma_ctrl.scala 214:125]
  wire  _T_309 = _T_272 | fifo_error_en[0]; // @[dma_ctrl.scala 216:78]
  wire  _T_311 = _T_165 & io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[dma_ctrl.scala 216:176]
  wire  _T_312 = _T_309 | _T_311; // @[dma_ctrl.scala 216:97]
  wire  _T_314 = _T_312 & _T_80; // @[dma_ctrl.scala 216:217]
  wire  _T_317 = _T_314 | _T_84; // @[dma_ctrl.scala 216:236]
  wire  _T_320 = _T_317 | _T_87; // @[dma_ctrl.scala 216:330]
  wire  _T_323 = _T_279 | fifo_error_en[1]; // @[dma_ctrl.scala 216:78]
  wire  _T_326 = _T_323 | _T_311; // @[dma_ctrl.scala 216:97]
  wire  _T_328 = _T_326 & _T_98; // @[dma_ctrl.scala 216:217]
  wire  _T_331 = _T_328 | _T_102; // @[dma_ctrl.scala 216:236]
  wire  _T_334 = _T_331 | _T_105; // @[dma_ctrl.scala 216:330]
  wire  _T_337 = _T_286 | fifo_error_en[2]; // @[dma_ctrl.scala 216:78]
  wire  _T_340 = _T_337 | _T_311; // @[dma_ctrl.scala 216:97]
  wire  _T_342 = _T_340 & _T_116; // @[dma_ctrl.scala 216:217]
  wire  _T_345 = _T_342 | _T_120; // @[dma_ctrl.scala 216:236]
  wire  _T_348 = _T_345 | _T_123; // @[dma_ctrl.scala 216:330]
  wire  _T_351 = _T_293 | fifo_error_en[3]; // @[dma_ctrl.scala 216:78]
  wire  _T_354 = _T_351 | _T_311; // @[dma_ctrl.scala 216:97]
  wire  _T_356 = _T_354 & _T_134; // @[dma_ctrl.scala 216:217]
  wire  _T_359 = _T_356 | _T_138; // @[dma_ctrl.scala 216:236]
  wire  _T_362 = _T_359 | _T_141; // @[dma_ctrl.scala 216:330]
  wire  _T_365 = _T_300 | fifo_error_en[4]; // @[dma_ctrl.scala 216:78]
  wire  _T_368 = _T_365 | _T_311; // @[dma_ctrl.scala 216:97]
  wire  _T_370 = _T_368 & _T_152; // @[dma_ctrl.scala 216:217]
  wire  _T_373 = _T_370 | _T_156; // @[dma_ctrl.scala 216:236]
  wire  _T_376 = _T_373 | _T_159; // @[dma_ctrl.scala 216:330]
  wire [4:0] fifo_done_en = {_T_376,_T_362,_T_348,_T_334,_T_320}; // @[Cat.scala 29:58]
  wire  _T_383 = fifo_done_en[0] | fifo_done[0]; // @[dma_ctrl.scala 218:75]
  wire  _T_384 = _T_383 & io_dma_bus_clk_en; // @[dma_ctrl.scala 218:91]
  wire  _T_387 = fifo_done_en[1] | fifo_done[1]; // @[dma_ctrl.scala 218:75]
  wire  _T_388 = _T_387 & io_dma_bus_clk_en; // @[dma_ctrl.scala 218:91]
  wire  _T_391 = fifo_done_en[2] | fifo_done[2]; // @[dma_ctrl.scala 218:75]
  wire  _T_392 = _T_391 & io_dma_bus_clk_en; // @[dma_ctrl.scala 218:91]
  wire  _T_395 = fifo_done_en[3] | fifo_done[3]; // @[dma_ctrl.scala 218:75]
  wire  _T_396 = _T_395 & io_dma_bus_clk_en; // @[dma_ctrl.scala 218:91]
  wire  _T_399 = fifo_done_en[4] | fifo_done[4]; // @[dma_ctrl.scala 218:75]
  wire  _T_400 = _T_399 & io_dma_bus_clk_en; // @[dma_ctrl.scala 218:91]
  wire [4:0] fifo_done_bus_en = {_T_400,_T_396,_T_392,_T_388,_T_384}; // @[Cat.scala 29:58]
  wire  _T_1285 = io_dma_axi_b_valid & io_dma_axi_b_ready; // @[dma_ctrl.scala 502:61]
  wire  _T_1286 = io_dma_axi_r_valid & io_dma_axi_r_ready; // @[dma_ctrl.scala 502:105]
  wire  bus_rsp_sent = _T_1285 | _T_1286; // @[dma_ctrl.scala 502:83]
  wire  _T_406 = bus_rsp_sent & io_dma_bus_clk_en; // @[dma_ctrl.scala 220:99]
  wire  _T_407 = _T_406 | io_dma_dbg_cmd_done; // @[dma_ctrl.scala 220:120]
  reg [2:0] RspPtr; // @[Reg.scala 27:20]
  wire  _T_408 = 3'h0 == RspPtr; // @[dma_ctrl.scala 220:150]
  wire  _T_409 = _T_407 & _T_408; // @[dma_ctrl.scala 220:143]
  wire  _T_413 = 3'h1 == RspPtr; // @[dma_ctrl.scala 220:150]
  wire  _T_414 = _T_407 & _T_413; // @[dma_ctrl.scala 220:143]
  wire  _T_418 = 3'h2 == RspPtr; // @[dma_ctrl.scala 220:150]
  wire  _T_419 = _T_407 & _T_418; // @[dma_ctrl.scala 220:143]
  wire  _T_423 = 3'h3 == RspPtr; // @[dma_ctrl.scala 220:150]
  wire  _T_424 = _T_407 & _T_423; // @[dma_ctrl.scala 220:143]
  wire  _T_428 = 3'h4 == RspPtr; // @[dma_ctrl.scala 220:150]
  wire  _T_429 = _T_407 & _T_428; // @[dma_ctrl.scala 220:143]
  wire [4:0] fifo_reset = {_T_429,_T_424,_T_419,_T_414,_T_409}; // @[Cat.scala 29:58]
  wire  _T_491 = fifo_error_en[0] & _T_269; // @[dma_ctrl.scala 224:77]
  wire [63:0] _T_493 = {32'h0,fifo_addr_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_498 = {io_dbg_dma_dbg_dctl_dbg_cmd_wrdata,io_dbg_dma_dbg_dctl_dbg_cmd_wrdata}; // @[Cat.scala 29:58]
  reg [63:0] wrbuf_data; // @[lib.scala 358:16]
  wire [63:0] _T_500 = io_dbg_dma_dbg_ib_dbg_cmd_valid ? _T_498 : wrbuf_data; // @[dma_ctrl.scala 224:347]
  wire  _T_506 = fifo_error_en[1] & _T_276; // @[dma_ctrl.scala 224:77]
  wire [63:0] _T_508 = {32'h0,fifo_addr_1}; // @[Cat.scala 29:58]
  wire  _T_521 = fifo_error_en[2] & _T_283; // @[dma_ctrl.scala 224:77]
  wire [63:0] _T_523 = {32'h0,fifo_addr_2}; // @[Cat.scala 29:58]
  wire  _T_536 = fifo_error_en[3] & _T_290; // @[dma_ctrl.scala 224:77]
  wire [63:0] _T_538 = {32'h0,fifo_addr_3}; // @[Cat.scala 29:58]
  wire  _T_551 = fifo_error_en[4] & _T_297; // @[dma_ctrl.scala 224:77]
  wire [63:0] _T_553 = {32'h0,fifo_addr_4}; // @[Cat.scala 29:58]
  wire  _T_566 = fifo_cmd_en[0] | fifo_valid[0]; // @[dma_ctrl.scala 226:86]
  wire  _T_568 = ~fifo_reset[0]; // @[dma_ctrl.scala 226:125]
  wire  _T_573 = fifo_cmd_en[1] | fifo_valid[1]; // @[dma_ctrl.scala 226:86]
  wire  _T_575 = ~fifo_reset[1]; // @[dma_ctrl.scala 226:125]
  wire  _T_580 = fifo_cmd_en[2] | fifo_valid[2]; // @[dma_ctrl.scala 226:86]
  wire  _T_582 = ~fifo_reset[2]; // @[dma_ctrl.scala 226:125]
  wire  _T_587 = fifo_cmd_en[3] | fifo_valid[3]; // @[dma_ctrl.scala 226:86]
  wire  _T_589 = ~fifo_reset[3]; // @[dma_ctrl.scala 226:125]
  wire  _T_594 = fifo_cmd_en[4] | fifo_valid[4]; // @[dma_ctrl.scala 226:86]
  wire  _T_596 = ~fifo_reset[4]; // @[dma_ctrl.scala 226:125]
  wire [1:0] _T_605 = fifo_error_en[0] ? fifo_error_in_0 : fifo_error_0; // @[dma_ctrl.scala 228:89]
  wire [1:0] _T_609 = _T_568 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_614 = fifo_error_en[1] ? fifo_error_in_1 : fifo_error_1; // @[dma_ctrl.scala 228:89]
  wire [1:0] _T_618 = _T_575 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_623 = fifo_error_en[2] ? fifo_error_in_2 : fifo_error_2; // @[dma_ctrl.scala 228:89]
  wire [1:0] _T_627 = _T_582 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_632 = fifo_error_en[3] ? fifo_error_in_3 : fifo_error_3; // @[dma_ctrl.scala 228:89]
  wire [1:0] _T_636 = _T_589 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_641 = fifo_error_en[4] ? fifo_error_in_4 : fifo_error_4; // @[dma_ctrl.scala 228:89]
  wire [1:0] _T_645 = _T_596 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  _T_721; // @[dma_ctrl.scala 232:89]
  reg  _T_714; // @[dma_ctrl.scala 232:89]
  reg  _T_707; // @[dma_ctrl.scala 232:89]
  reg  _T_700; // @[dma_ctrl.scala 232:89]
  reg  _T_693; // @[dma_ctrl.scala 232:89]
  wire [4:0] fifo_rpend = {_T_721,_T_714,_T_707,_T_700,_T_693}; // @[Cat.scala 29:58]
  wire  _T_689 = fifo_pend_en[0] | fifo_rpend[0]; // @[dma_ctrl.scala 232:93]
  wire  _T_696 = fifo_pend_en[1] | fifo_rpend[1]; // @[dma_ctrl.scala 232:93]
  wire  _T_703 = fifo_pend_en[2] | fifo_rpend[2]; // @[dma_ctrl.scala 232:93]
  wire  _T_710 = fifo_pend_en[3] | fifo_rpend[3]; // @[dma_ctrl.scala 232:93]
  wire  _T_717 = fifo_pend_en[4] | fifo_rpend[4]; // @[dma_ctrl.scala 232:93]
  reg  _T_799; // @[dma_ctrl.scala 236:89]
  reg  _T_792; // @[dma_ctrl.scala 236:89]
  reg  _T_785; // @[dma_ctrl.scala 236:89]
  reg  _T_778; // @[dma_ctrl.scala 236:89]
  reg  _T_771; // @[dma_ctrl.scala 236:89]
  wire [4:0] fifo_done_bus = {_T_799,_T_792,_T_785,_T_778,_T_771}; // @[Cat.scala 29:58]
  wire  _T_767 = fifo_done_bus_en[0] | fifo_done_bus[0]; // @[dma_ctrl.scala 236:93]
  wire  _T_774 = fifo_done_bus_en[1] | fifo_done_bus[1]; // @[dma_ctrl.scala 236:93]
  wire  _T_781 = fifo_done_bus_en[2] | fifo_done_bus[2]; // @[dma_ctrl.scala 236:93]
  wire  _T_788 = fifo_done_bus_en[3] | fifo_done_bus[3]; // @[dma_ctrl.scala 236:93]
  wire  _T_795 = fifo_done_bus_en[4] | fifo_done_bus[4]; // @[dma_ctrl.scala 236:93]
  wire [7:0] fifo_byteen_in = _T_20[7:0]; // @[dma_ctrl.scala 195:28]
  reg  _T_850; // @[Reg.scala 27:20]
  reg  _T_852; // @[Reg.scala 27:20]
  reg  _T_854; // @[Reg.scala 27:20]
  reg  _T_856; // @[Reg.scala 27:20]
  reg  _T_858; // @[Reg.scala 27:20]
  wire [4:0] fifo_write = {_T_858,_T_856,_T_854,_T_852,_T_850}; // @[Cat.scala 29:58]
  reg [63:0] fifo_data_0; // @[lib.scala 358:16]
  reg [63:0] fifo_data_1; // @[lib.scala 358:16]
  reg [63:0] fifo_data_2; // @[lib.scala 358:16]
  reg [63:0] fifo_data_3; // @[lib.scala 358:16]
  reg [63:0] fifo_data_4; // @[lib.scala 358:16]
  reg  fifo_tag_0; // @[Reg.scala 27:20]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg  rdbuf_tag; // @[Reg.scala 27:20]
  wire  bus_cmd_tag = axi_mstr_sel ? wrbuf_tag : rdbuf_tag; // @[dma_ctrl.scala 467:43]
  reg  fifo_tag_1; // @[Reg.scala 27:20]
  reg  fifo_tag_2; // @[Reg.scala 27:20]
  reg  fifo_tag_3; // @[Reg.scala 27:20]
  reg  fifo_tag_4; // @[Reg.scala 27:20]
  wire  _T_931 = WrPtr == 3'h4; // @[dma_ctrl.scala 260:30]
  wire [2:0] _T_934 = WrPtr + 3'h1; // @[dma_ctrl.scala 260:76]
  wire  _T_936 = RdPtr == 3'h4; // @[dma_ctrl.scala 262:30]
  wire [2:0] _T_939 = RdPtr + 3'h1; // @[dma_ctrl.scala 262:76]
  wire  _T_941 = RspPtr == 3'h4; // @[dma_ctrl.scala 264:31]
  wire [2:0] _T_944 = RspPtr + 3'h1; // @[dma_ctrl.scala 264:78]
  wire  WrPtrEn = |fifo_cmd_en; // @[dma_ctrl.scala 266:30]
  wire  RdPtrEn = _T_165 | _T_197; // @[dma_ctrl.scala 268:93]
  wire  RspPtrEn = io_dma_dbg_cmd_done | _T_406; // @[dma_ctrl.scala 270:39]
  wire [3:0] _T_959 = {3'h0,axi_mstr_prty_en}; // @[Cat.scala 29:58]
  wire [3:0] _T_961 = {3'h0,bus_rsp_sent}; // @[Cat.scala 29:58]
  wire [3:0] num_fifo_vld_tmp = _T_959 - _T_961; // @[dma_ctrl.scala 291:62]
  wire [3:0] _T_966 = {3'h0,fifo_valid[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_969 = {3'h0,fifo_valid[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_972 = {3'h0,fifo_valid[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_975 = {3'h0,fifo_valid[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_978 = {3'h0,fifo_valid[4]}; // @[Cat.scala 29:58]
  wire [3:0] _T_980 = _T_966 + _T_969; // @[dma_ctrl.scala 293:102]
  wire [3:0] _T_982 = _T_980 + _T_972; // @[dma_ctrl.scala 293:102]
  wire [3:0] _T_984 = _T_982 + _T_975; // @[dma_ctrl.scala 293:102]
  wire [3:0] num_fifo_vld_tmp2 = _T_984 + _T_978; // @[dma_ctrl.scala 293:102]
  wire [3:0] num_fifo_vld = num_fifo_vld_tmp + num_fifo_vld_tmp2; // @[dma_ctrl.scala 295:45]
  wire  _T_1143 = |fifo_valid; // @[dma_ctrl.scala 338:30]
  wire  fifo_empty = ~_T_1143; // @[dma_ctrl.scala 338:17]
  wire [4:0] _T_1106 = fifo_valid >> RspPtr; // @[dma_ctrl.scala 324:39]
  wire [4:0] _T_1108 = fifo_dbg >> RspPtr; // @[dma_ctrl.scala 324:58]
  wire  _T_1110 = _T_1106[0] & _T_1108[0]; // @[dma_ctrl.scala 324:48]
  wire [4:0] _T_1111 = fifo_done >> RspPtr; // @[dma_ctrl.scala 324:78]
  wire [31:0] _GEN_44 = 3'h1 == RspPtr ? fifo_addr_1 : fifo_addr_0; // @[dma_ctrl.scala 325:49]
  wire [31:0] _GEN_45 = 3'h2 == RspPtr ? fifo_addr_2 : _GEN_44; // @[dma_ctrl.scala 325:49]
  wire [31:0] _GEN_46 = 3'h3 == RspPtr ? fifo_addr_3 : _GEN_45; // @[dma_ctrl.scala 325:49]
  wire [31:0] _GEN_47 = 3'h4 == RspPtr ? fifo_addr_4 : _GEN_46; // @[dma_ctrl.scala 325:49]
  wire [63:0] _GEN_49 = 3'h1 == RspPtr ? fifo_data_1 : fifo_data_0; // @[dma_ctrl.scala 325:71]
  wire [63:0] _GEN_50 = 3'h2 == RspPtr ? fifo_data_2 : _GEN_49; // @[dma_ctrl.scala 325:71]
  wire [63:0] _GEN_51 = 3'h3 == RspPtr ? fifo_data_3 : _GEN_50; // @[dma_ctrl.scala 325:71]
  wire [63:0] _GEN_52 = 3'h4 == RspPtr ? fifo_data_4 : _GEN_51; // @[dma_ctrl.scala 325:71]
  wire [1:0] _GEN_54 = 3'h1 == RspPtr ? fifo_error_1 : fifo_error_0; // @[dma_ctrl.scala 326:47]
  wire [1:0] _GEN_55 = 3'h2 == RspPtr ? fifo_error_2 : _GEN_54; // @[dma_ctrl.scala 326:47]
  wire [1:0] _GEN_56 = 3'h3 == RspPtr ? fifo_error_3 : _GEN_55; // @[dma_ctrl.scala 326:47]
  wire [1:0] _GEN_57 = 3'h4 == RspPtr ? fifo_error_4 : _GEN_56; // @[dma_ctrl.scala 326:47]
  wire  _T_1136 = dma_mem_addr_in_dccm | dma_mem_addr_in_pic; // @[dma_ctrl.scala 332:80]
  wire [4:0] _T_1165 = fifo_rpend >> RdPtr; // @[dma_ctrl.scala 351:54]
  wire  _T_1167 = ~_T_1165[0]; // @[dma_ctrl.scala 351:43]
  wire  _T_1168 = _T_990[0] & _T_1167; // @[dma_ctrl.scala 351:41]
  wire  _T_1172 = _T_1168 & _T_994; // @[dma_ctrl.scala 351:62]
  wire  _T_1175 = ~_T_197; // @[dma_ctrl.scala 351:84]
  wire  dma_mem_req = _T_1172 & _T_1175; // @[dma_ctrl.scala 351:82]
  wire  _T_1137 = dma_mem_req & _T_1136; // @[dma_ctrl.scala 332:56]
  reg [2:0] dma_nack_count; // @[Reg.scala 27:20]
  wire  _T_1138 = dma_nack_count >= io_dec_dma_tlu_dma_dec_tlu_dma_qos_prty; // @[dma_ctrl.scala 332:121]
  wire  _T_1140 = dma_mem_req & dma_mem_addr_in_iccm; // @[dma_ctrl.scala 333:56]
  wire  _T_1147 = ~_T_165; // @[dma_ctrl.scala 343:77]
  wire [2:0] _T_1149 = _T_1147 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_1151 = _T_1149 & dma_nack_count; // @[dma_ctrl.scala 343:155]
  wire  _T_1155 = dma_mem_req & _T_1147; // @[dma_ctrl.scala 343:203]
  wire [2:0] _T_1158 = dma_nack_count + 3'h1; // @[dma_ctrl.scala 343:304]
  wire  _T_1184 = io_lsu_dma_dma_lsc_ctl_dma_mem_write & _T_1096; // @[dma_ctrl.scala 357:84]
  wire [31:0] _T_1188 = {dma_mem_addr_int[31:3],1'h1,dma_mem_addr_int[1:0]}; // @[Cat.scala 29:58]
  wire  _T_1196 = io_lsu_dma_dma_lsc_ctl_dma_mem_write & _T_1097; // @[dma_ctrl.scala 358:84]
  wire [4:0] _T_1199 = fifo_write >> RdPtr; // @[dma_ctrl.scala 360:53]
  wire [63:0] _GEN_75 = 3'h1 == RdPtr ? fifo_data_1 : fifo_data_0; // @[dma_ctrl.scala 361:40]
  wire [63:0] _GEN_76 = 3'h2 == RdPtr ? fifo_data_2 : _GEN_75; // @[dma_ctrl.scala 361:40]
  wire [63:0] _GEN_77 = 3'h3 == RdPtr ? fifo_data_3 : _GEN_76; // @[dma_ctrl.scala 361:40]
  reg  dma_dbg_cmd_done_q; // @[dma_ctrl.scala 381:12]
  wire  _T_1212 = bus_cmd_valid & io_dma_bus_clk_en; // @[dma_ctrl.scala 386:44]
  wire  _T_1213 = _T_1212 | io_dbg_dma_dbg_ib_dbg_cmd_valid; // @[dma_ctrl.scala 386:65]
  wire  bus_rsp_valid = io_dma_axi_b_valid | io_dma_axi_r_valid; // @[dma_ctrl.scala 501:60]
  wire  _T_1214 = bus_cmd_valid | bus_rsp_valid; // @[dma_ctrl.scala 387:44]
  wire  _T_1215 = _T_1214 | io_dbg_dma_dbg_ib_dbg_cmd_valid; // @[dma_ctrl.scala 387:60]
  wire  _T_1216 = _T_1215 | io_dma_dbg_cmd_done; // @[dma_ctrl.scala 387:94]
  wire  _T_1217 = _T_1216 | dma_dbg_cmd_done_q; // @[dma_ctrl.scala 387:116]
  wire  _T_1219 = _T_1217 | _T_1143; // @[dma_ctrl.scala 387:137]
  wire  wrbuf_en = io_dma_axi_aw_valid & io_dma_axi_aw_ready; // @[dma_ctrl.scala 409:47]
  wire  wrbuf_data_en = io_dma_axi_w_valid & io_dma_axi_w_ready; // @[dma_ctrl.scala 410:46]
  wire  wrbuf_cmd_sent = axi_mstr_prty_en & axi_mstr_sel; // @[dma_ctrl.scala 411:40]
  wire  _T_1221 = ~wrbuf_en; // @[dma_ctrl.scala 412:51]
  wire  wrbuf_rst = wrbuf_cmd_sent & _T_1221; // @[dma_ctrl.scala 412:49]
  wire  _T_1223 = ~wrbuf_data_en; // @[dma_ctrl.scala 413:51]
  wire  wrbuf_data_rst = wrbuf_cmd_sent & _T_1223; // @[dma_ctrl.scala 413:49]
  wire  _T_1224 = wrbuf_en | wrbuf_vld; // @[dma_ctrl.scala 415:63]
  wire  _T_1225 = ~wrbuf_rst; // @[dma_ctrl.scala 415:92]
  wire  _T_1228 = wrbuf_data_en | wrbuf_data_vld; // @[dma_ctrl.scala 417:63]
  wire  _T_1229 = ~wrbuf_data_rst; // @[dma_ctrl.scala 417:102]
  wire  rdbuf_en = io_dma_axi_ar_valid & io_dma_axi_ar_ready; // @[dma_ctrl.scala 437:59]
  wire  _T_1234 = ~axi_mstr_sel; // @[dma_ctrl.scala 438:44]
  wire  rdbuf_cmd_sent = axi_mstr_prty_en & _T_1234; // @[dma_ctrl.scala 438:42]
  wire  _T_1236 = ~rdbuf_en; // @[dma_ctrl.scala 439:63]
  wire  rdbuf_rst = rdbuf_cmd_sent & _T_1236; // @[dma_ctrl.scala 439:61]
  wire  _T_1237 = rdbuf_en | rdbuf_vld; // @[dma_ctrl.scala 441:51]
  wire  _T_1238 = ~rdbuf_rst; // @[dma_ctrl.scala 441:80]
  wire  _T_1242 = ~wrbuf_cmd_sent; // @[dma_ctrl.scala 453:44]
  wire  _T_1243 = wrbuf_vld & _T_1242; // @[dma_ctrl.scala 453:42]
  wire  _T_1246 = wrbuf_data_vld & _T_1242; // @[dma_ctrl.scala 454:47]
  wire  _T_1248 = ~rdbuf_cmd_sent; // @[dma_ctrl.scala 455:44]
  wire  _T_1249 = rdbuf_vld & _T_1248; // @[dma_ctrl.scala 455:42]
  wire  axi_mstr_prty_in = ~axi_mstr_priority; // @[dma_ctrl.scala 474:27]
  wire  _T_1271 = ~_T_1108[0]; // @[dma_ctrl.scala 481:50]
  wire  _T_1272 = _T_1106[0] & _T_1271; // @[dma_ctrl.scala 481:48]
  wire [4:0] _T_1273 = fifo_done_bus >> RspPtr; // @[dma_ctrl.scala 481:83]
  wire  axi_rsp_valid = _T_1272 & _T_1273[0]; // @[dma_ctrl.scala 481:68]
  wire [4:0] _T_1275 = fifo_write >> RspPtr; // @[dma_ctrl.scala 483:39]
  wire  axi_rsp_write = _T_1275[0]; // @[dma_ctrl.scala 483:39]
  wire [1:0] _T_1278 = _GEN_57[1] ? 2'h3 : 2'h0; // @[dma_ctrl.scala 484:64]
  wire  _GEN_86 = 3'h1 == RspPtr ? fifo_tag_1 : fifo_tag_0; // @[dma_ctrl.scala 492:33]
  wire  _GEN_87 = 3'h2 == RspPtr ? fifo_tag_2 : _GEN_86; // @[dma_ctrl.scala 492:33]
  wire  _GEN_88 = 3'h3 == RspPtr ? fifo_tag_3 : _GEN_87; // @[dma_ctrl.scala 492:33]
  wire  _T_1281 = ~axi_rsp_write; // @[dma_ctrl.scala 494:46]
  rvclkhdr rvclkhdr ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr dma_buffer_c1cgc ( // @[dma_ctrl.scala 389:32]
    .io_l1clk(dma_buffer_c1cgc_io_l1clk),
    .io_clk(dma_buffer_c1cgc_io_clk),
    .io_en(dma_buffer_c1cgc_io_en),
    .io_scan_mode(dma_buffer_c1cgc_io_scan_mode)
  );
  rvclkhdr dma_free_cgc ( // @[dma_ctrl.scala 395:28]
    .io_l1clk(dma_free_cgc_io_l1clk),
    .io_clk(dma_free_cgc_io_clk),
    .io_en(dma_free_cgc_io_en),
    .io_scan_mode(dma_free_cgc_io_scan_mode)
  );
  rvclkhdr dma_bus_cgc ( // @[dma_ctrl.scala 401:27]
    .io_l1clk(dma_bus_cgc_io_l1clk),
    .io_clk(dma_bus_cgc_io_clk),
    .io_en(dma_bus_cgc_io_en),
    .io_scan_mode(dma_bus_cgc_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  rvclkhdr rvclkhdr_12 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_12_io_l1clk),
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en),
    .io_scan_mode(rvclkhdr_12_io_scan_mode)
  );
  assign io_dma_dbg_rddata = _GEN_47[2] ? _GEN_52[63:32] : _GEN_52[31:0]; // @[dma_ctrl.scala 325:25]
  assign io_dma_dbg_cmd_done = _T_1110 & _T_1111[0]; // @[dma_ctrl.scala 324:25]
  assign io_dma_dbg_cmd_fail = |_GEN_57; // @[dma_ctrl.scala 326:25]
  assign io_dbg_dma_io_dma_dbg_ready = fifo_empty & dbg_dma_bubble_bus; // @[dma_ctrl.scala 323:36]
  assign io_dec_dma_dctl_dma_dma_dccm_stall_any = io_dec_dma_tlu_dma_dma_dccm_stall_any; // @[dma_ctrl.scala 335:42]
  assign io_dec_dma_tlu_dma_dma_pmu_dccm_read = io_lsu_dma_dma_lsc_ctl_dma_dccm_req & _T_166; // @[dma_ctrl.scala 365:42]
  assign io_dec_dma_tlu_dma_dma_pmu_dccm_write = io_lsu_dma_dma_lsc_ctl_dma_dccm_req & io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[dma_ctrl.scala 366:42]
  assign io_dec_dma_tlu_dma_dma_pmu_any_read = _T_165 & _T_166; // @[dma_ctrl.scala 367:42]
  assign io_dec_dma_tlu_dma_dma_pmu_any_write = _T_165 & io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[dma_ctrl.scala 368:42]
  assign io_dec_dma_tlu_dma_dma_dccm_stall_any = _T_1137 & _T_1138; // @[dma_ctrl.scala 332:41]
  assign io_dec_dma_tlu_dma_dma_iccm_stall_any = io_ifu_dma_dma_ifc_dma_iccm_stall_any; // @[dma_ctrl.scala 334:41]
  assign io_dma_axi_aw_ready = ~_T_1243; // @[dma_ctrl.scala 453:27]
  assign io_dma_axi_w_ready = ~_T_1246; // @[dma_ctrl.scala 454:27]
  assign io_dma_axi_b_valid = axi_rsp_valid & axi_rsp_write; // @[dma_ctrl.scala 490:27]
  assign io_dma_axi_b_bits_resp = _GEN_57[0] ? 2'h2 : _T_1278; // @[dma_ctrl.scala 491:41]
  assign io_dma_axi_b_bits_id = 3'h4 == RspPtr ? fifo_tag_4 : _GEN_88; // @[dma_ctrl.scala 492:33]
  assign io_dma_axi_ar_ready = ~_T_1249; // @[dma_ctrl.scala 455:27]
  assign io_dma_axi_r_valid = axi_rsp_valid & _T_1281; // @[dma_ctrl.scala 494:27]
  assign io_dma_axi_r_bits_id = 3'h4 == RspPtr ? fifo_tag_4 : _GEN_88; // @[dma_ctrl.scala 498:37]
  assign io_dma_axi_r_bits_data = 3'h4 == RspPtr ? fifo_data_4 : _GEN_51; // @[dma_ctrl.scala 496:43]
  assign io_dma_axi_r_bits_resp = _GEN_57[0] ? 2'h2 : _T_1278; // @[dma_ctrl.scala 495:41]
  assign io_dma_axi_r_bits_last = 1'h1; // @[dma_ctrl.scala 497:41]
  assign io_lsu_dma_dma_lsc_ctl_dma_dccm_req = _T_1137 & io_lsu_dma_dccm_ready; // @[dma_ctrl.scala 352:40]
  assign io_lsu_dma_dma_lsc_ctl_dma_mem_addr = _T_1184 ? _T_1188 : dma_mem_addr_int; // @[dma_ctrl.scala 357:40]
  assign io_lsu_dma_dma_lsc_ctl_dma_mem_sz = _T_1196 ? 3'h2 : dma_mem_sz_int; // @[dma_ctrl.scala 358:40]
  assign io_lsu_dma_dma_lsc_ctl_dma_mem_write = _T_1199[0]; // @[dma_ctrl.scala 360:40]
  assign io_lsu_dma_dma_lsc_ctl_dma_mem_wdata = 3'h4 == RdPtr ? fifo_data_4 : _GEN_77; // @[dma_ctrl.scala 361:40]
  assign io_lsu_dma_dma_dccm_ctl_dma_mem_addr = io_lsu_dma_dma_lsc_ctl_dma_mem_addr; // @[dma_ctrl.scala 503:40]
  assign io_lsu_dma_dma_dccm_ctl_dma_mem_wdata = io_lsu_dma_dma_lsc_ctl_dma_mem_wdata; // @[dma_ctrl.scala 504:41]
  assign io_lsu_dma_dma_mem_tag = RdPtr; // @[dma_ctrl.scala 354:28]
  assign io_ifu_dma_dma_ifc_dma_iccm_stall_any = _T_1140 & _T_1138; // @[dma_ctrl.scala 333:41]
  assign io_ifu_dma_dma_mem_ctl_dma_iccm_req = _T_1140 & io_iccm_ready; // @[dma_ctrl.scala 353:40]
  assign io_ifu_dma_dma_mem_ctl_dma_mem_addr = io_lsu_dma_dma_lsc_ctl_dma_mem_addr; // @[dma_ctrl.scala 506:39]
  assign io_ifu_dma_dma_mem_ctl_dma_mem_sz = io_lsu_dma_dma_lsc_ctl_dma_mem_sz; // @[dma_ctrl.scala 505:37]
  assign io_ifu_dma_dma_mem_ctl_dma_mem_write = io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[dma_ctrl.scala 508:40]
  assign io_ifu_dma_dma_mem_ctl_dma_mem_wdata = io_lsu_dma_dma_lsc_ctl_dma_mem_wdata; // @[dma_ctrl.scala 507:40]
  assign io_ifu_dma_dma_mem_ctl_dma_mem_tag = io_lsu_dma_dma_mem_tag; // @[dma_ctrl.scala 509:38]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_io_en = fifo_cmd_en[0]; // @[lib.scala 355:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_1_io_en = fifo_cmd_en[1]; // @[lib.scala 355:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_2_io_en = fifo_cmd_en[2]; // @[lib.scala 355:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_3_io_en = fifo_cmd_en[3]; // @[lib.scala 355:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_4_io_en = fifo_cmd_en[4]; // @[lib.scala 355:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_5_io_en = fifo_data_en[0]; // @[lib.scala 355:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_6_io_en = fifo_data_en[1]; // @[lib.scala 355:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_7_io_en = fifo_data_en[2]; // @[lib.scala 355:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_8_io_en = fifo_data_en[3]; // @[lib.scala 355:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_9_io_en = fifo_data_en[4]; // @[lib.scala 355:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign dma_buffer_c1cgc_io_clk = clock; // @[dma_ctrl.scala 392:33]
  assign dma_buffer_c1cgc_io_en = _T_1213 | io_clk_override; // @[dma_ctrl.scala 390:33]
  assign dma_buffer_c1cgc_io_scan_mode = io_scan_mode; // @[dma_ctrl.scala 391:33]
  assign dma_free_cgc_io_clk = clock; // @[dma_ctrl.scala 398:29]
  assign dma_free_cgc_io_en = _T_1219 | io_clk_override; // @[dma_ctrl.scala 396:29]
  assign dma_free_cgc_io_scan_mode = io_scan_mode; // @[dma_ctrl.scala 397:29]
  assign dma_bus_cgc_io_clk = clock; // @[dma_ctrl.scala 404:28]
  assign dma_bus_cgc_io_en = io_dma_bus_clk_en; // @[dma_ctrl.scala 402:28]
  assign dma_bus_cgc_io_scan_mode = io_scan_mode; // @[dma_ctrl.scala 403:28]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_10_io_en = wrbuf_en & io_dma_bus_clk_en; // @[lib.scala 355:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_11_io_en = wrbuf_data_en & io_dma_bus_clk_en; // @[lib.scala 355:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_12_io_en = rdbuf_en & io_dma_bus_clk_en; // @[lib.scala 355:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
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
  RdPtr = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  fifo_addr_4 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  fifo_addr_3 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  fifo_addr_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  fifo_addr_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  fifo_addr_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  wrbuf_vld = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  wrbuf_data_vld = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rdbuf_vld = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  axi_mstr_priority = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  wrbuf_addr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  rdbuf_addr = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  wrbuf_byteen = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  wrbuf_sz = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  rdbuf_sz = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  fifo_full = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  dbg_dma_bubble_bus = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  WrPtr = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  _T_598 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_591 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_584 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_577 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_570 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_760 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_753 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_746 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_739 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_732 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_886 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_884 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_882 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  _T_880 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  _T_878 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  fifo_sz_4 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  fifo_sz_3 = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  fifo_sz_2 = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  fifo_sz_1 = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  fifo_sz_0 = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  fifo_byteen_4 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  fifo_byteen_3 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  fifo_byteen_2 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  fifo_byteen_1 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  fifo_byteen_0 = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  fifo_error_0 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  fifo_error_1 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  fifo_error_2 = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  fifo_error_3 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  fifo_error_4 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  RspPtr = _RAND_48[2:0];
  _RAND_49 = {2{`RANDOM}};
  wrbuf_data = _RAND_49[63:0];
  _RAND_50 = {1{`RANDOM}};
  _T_721 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_714 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_707 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_700 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  _T_693 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  _T_799 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  _T_792 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  _T_785 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  _T_778 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  _T_771 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  _T_850 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  _T_852 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  _T_854 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  _T_856 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  _T_858 = _RAND_64[0:0];
  _RAND_65 = {2{`RANDOM}};
  fifo_data_0 = _RAND_65[63:0];
  _RAND_66 = {2{`RANDOM}};
  fifo_data_1 = _RAND_66[63:0];
  _RAND_67 = {2{`RANDOM}};
  fifo_data_2 = _RAND_67[63:0];
  _RAND_68 = {2{`RANDOM}};
  fifo_data_3 = _RAND_68[63:0];
  _RAND_69 = {2{`RANDOM}};
  fifo_data_4 = _RAND_69[63:0];
  _RAND_70 = {1{`RANDOM}};
  fifo_tag_0 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  wrbuf_tag = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  rdbuf_tag = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  fifo_tag_1 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  fifo_tag_2 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  fifo_tag_3 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  fifo_tag_4 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  dma_nack_count = _RAND_77[2:0];
  _RAND_78 = {1{`RANDOM}};
  dma_dbg_cmd_done_q = _RAND_78[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    RdPtr = 3'h0;
  end
  if (reset) begin
    fifo_addr_4 = 32'h0;
  end
  if (reset) begin
    fifo_addr_3 = 32'h0;
  end
  if (reset) begin
    fifo_addr_2 = 32'h0;
  end
  if (reset) begin
    fifo_addr_1 = 32'h0;
  end
  if (reset) begin
    fifo_addr_0 = 32'h0;
  end
  if (reset) begin
    wrbuf_vld = 1'h0;
  end
  if (reset) begin
    wrbuf_data_vld = 1'h0;
  end
  if (reset) begin
    rdbuf_vld = 1'h0;
  end
  if (reset) begin
    axi_mstr_priority = 1'h0;
  end
  if (reset) begin
    wrbuf_addr = 32'h0;
  end
  if (reset) begin
    rdbuf_addr = 32'h0;
  end
  if (reset) begin
    wrbuf_byteen = 8'h0;
  end
  if (reset) begin
    wrbuf_sz = 3'h0;
  end
  if (reset) begin
    rdbuf_sz = 3'h0;
  end
  if (reset) begin
    fifo_full = 1'h0;
  end
  if (reset) begin
    dbg_dma_bubble_bus = 1'h0;
  end
  if (reset) begin
    WrPtr = 3'h0;
  end
  if (reset) begin
    _T_598 = 1'h0;
  end
  if (reset) begin
    _T_591 = 1'h0;
  end
  if (reset) begin
    _T_584 = 1'h0;
  end
  if (reset) begin
    _T_577 = 1'h0;
  end
  if (reset) begin
    _T_570 = 1'h0;
  end
  if (reset) begin
    _T_760 = 1'h0;
  end
  if (reset) begin
    _T_753 = 1'h0;
  end
  if (reset) begin
    _T_746 = 1'h0;
  end
  if (reset) begin
    _T_739 = 1'h0;
  end
  if (reset) begin
    _T_732 = 1'h0;
  end
  if (reset) begin
    _T_886 = 1'h0;
  end
  if (reset) begin
    _T_884 = 1'h0;
  end
  if (reset) begin
    _T_882 = 1'h0;
  end
  if (reset) begin
    _T_880 = 1'h0;
  end
  if (reset) begin
    _T_878 = 1'h0;
  end
  if (reset) begin
    fifo_sz_4 = 3'h0;
  end
  if (reset) begin
    fifo_sz_3 = 3'h0;
  end
  if (reset) begin
    fifo_sz_2 = 3'h0;
  end
  if (reset) begin
    fifo_sz_1 = 3'h0;
  end
  if (reset) begin
    fifo_sz_0 = 3'h0;
  end
  if (reset) begin
    fifo_byteen_4 = 8'h0;
  end
  if (reset) begin
    fifo_byteen_3 = 8'h0;
  end
  if (reset) begin
    fifo_byteen_2 = 8'h0;
  end
  if (reset) begin
    fifo_byteen_1 = 8'h0;
  end
  if (reset) begin
    fifo_byteen_0 = 8'h0;
  end
  if (reset) begin
    fifo_error_0 = 2'h0;
  end
  if (reset) begin
    fifo_error_1 = 2'h0;
  end
  if (reset) begin
    fifo_error_2 = 2'h0;
  end
  if (reset) begin
    fifo_error_3 = 2'h0;
  end
  if (reset) begin
    fifo_error_4 = 2'h0;
  end
  if (reset) begin
    RspPtr = 3'h0;
  end
  if (reset) begin
    wrbuf_data = 64'h0;
  end
  if (reset) begin
    _T_721 = 1'h0;
  end
  if (reset) begin
    _T_714 = 1'h0;
  end
  if (reset) begin
    _T_707 = 1'h0;
  end
  if (reset) begin
    _T_700 = 1'h0;
  end
  if (reset) begin
    _T_693 = 1'h0;
  end
  if (reset) begin
    _T_799 = 1'h0;
  end
  if (reset) begin
    _T_792 = 1'h0;
  end
  if (reset) begin
    _T_785 = 1'h0;
  end
  if (reset) begin
    _T_778 = 1'h0;
  end
  if (reset) begin
    _T_771 = 1'h0;
  end
  if (reset) begin
    _T_850 = 1'h0;
  end
  if (reset) begin
    _T_852 = 1'h0;
  end
  if (reset) begin
    _T_854 = 1'h0;
  end
  if (reset) begin
    _T_856 = 1'h0;
  end
  if (reset) begin
    _T_858 = 1'h0;
  end
  if (reset) begin
    fifo_data_0 = 64'h0;
  end
  if (reset) begin
    fifo_data_1 = 64'h0;
  end
  if (reset) begin
    fifo_data_2 = 64'h0;
  end
  if (reset) begin
    fifo_data_3 = 64'h0;
  end
  if (reset) begin
    fifo_data_4 = 64'h0;
  end
  if (reset) begin
    fifo_tag_0 = 1'h0;
  end
  if (reset) begin
    wrbuf_tag = 1'h0;
  end
  if (reset) begin
    rdbuf_tag = 1'h0;
  end
  if (reset) begin
    fifo_tag_1 = 1'h0;
  end
  if (reset) begin
    fifo_tag_2 = 1'h0;
  end
  if (reset) begin
    fifo_tag_3 = 1'h0;
  end
  if (reset) begin
    fifo_tag_4 = 1'h0;
  end
  if (reset) begin
    dma_nack_count = 3'h0;
  end
  if (reset) begin
    dma_dbg_cmd_done_q = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      RdPtr <= 3'h0;
    end else if (RdPtrEn) begin
      if (_T_936) begin
        RdPtr <= 3'h0;
      end else begin
        RdPtr <= _T_939;
      end
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_4 <= 32'h0;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_addr_4 <= io_dbg_dma_dbg_ib_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_4 <= wrbuf_addr;
    end else begin
      fifo_addr_4 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_3 <= 32'h0;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_addr_3 <= io_dbg_dma_dbg_ib_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_3 <= wrbuf_addr;
    end else begin
      fifo_addr_3 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_2 <= 32'h0;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_addr_2 <= io_dbg_dma_dbg_ib_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_2 <= wrbuf_addr;
    end else begin
      fifo_addr_2 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_1 <= 32'h0;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_addr_1 <= io_dbg_dma_dbg_ib_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_1 <= wrbuf_addr;
    end else begin
      fifo_addr_1 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_0 <= 32'h0;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_addr_0 <= io_dbg_dma_dbg_ib_dbg_cmd_addr;
    end else begin
      fifo_addr_0 <= bus_cmd_addr;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else begin
      wrbuf_vld <= _T_1224 & _T_1225;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else begin
      wrbuf_data_vld <= _T_1228 & _T_1229;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      rdbuf_vld <= 1'h0;
    end else begin
      rdbuf_vld <= _T_1237 & _T_1238;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      axi_mstr_priority <= 1'h0;
    end else if (axi_mstr_prty_en) begin
      axi_mstr_priority <= axi_mstr_prty_in;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      wrbuf_addr <= 32'h0;
    end else begin
      wrbuf_addr <= io_dma_axi_aw_bits_addr;
    end
  end
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      rdbuf_addr <= 32'h0;
    end else begin
      rdbuf_addr <= io_dma_axi_ar_bits_addr;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_byteen <= 8'h0;
    end else if (wrbuf_data_en) begin
      wrbuf_byteen <= io_dma_axi_w_bits_strb;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_sz <= 3'h0;
    end else if (wrbuf_en) begin
      wrbuf_sz <= io_dma_axi_aw_bits_size;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      rdbuf_sz <= 3'h0;
    end else if (rdbuf_en) begin
      rdbuf_sz <= io_dma_axi_ar_bits_size;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      fifo_full <= 1'h0;
    end else begin
      fifo_full <= num_fifo_vld >= 4'h5;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      dbg_dma_bubble_bus <= 1'h0;
    end else begin
      dbg_dma_bubble_bus <= io_dbg_dma_io_dbg_dma_bubble;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      WrPtr <= 3'h0;
    end else if (WrPtrEn) begin
      if (_T_931) begin
        WrPtr <= 3'h0;
      end else begin
        WrPtr <= _T_934;
      end
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_598 <= 1'h0;
    end else begin
      _T_598 <= _T_594 & _T_596;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_591 <= 1'h0;
    end else begin
      _T_591 <= _T_587 & _T_589;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_584 <= 1'h0;
    end else begin
      _T_584 <= _T_580 & _T_582;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_577 <= 1'h0;
    end else begin
      _T_577 <= _T_573 & _T_575;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_570 <= 1'h0;
    end else begin
      _T_570 <= _T_566 & _T_568;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_760 <= 1'h0;
    end else begin
      _T_760 <= _T_399 & _T_596;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_753 <= 1'h0;
    end else begin
      _T_753 <= _T_395 & _T_589;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_746 <= 1'h0;
    end else begin
      _T_746 <= _T_391 & _T_582;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_739 <= 1'h0;
    end else begin
      _T_739 <= _T_387 & _T_575;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_732 <= 1'h0;
    end else begin
      _T_732 <= _T_383 & _T_568;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_886 <= 1'h0;
    end else if (fifo_cmd_en[4]) begin
      _T_886 <= io_dbg_dma_dbg_ib_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_884 <= 1'h0;
    end else if (fifo_cmd_en[3]) begin
      _T_884 <= io_dbg_dma_dbg_ib_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_882 <= 1'h0;
    end else if (fifo_cmd_en[2]) begin
      _T_882 <= io_dbg_dma_dbg_ib_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_880 <= 1'h0;
    end else if (fifo_cmd_en[1]) begin
      _T_880 <= io_dbg_dma_dbg_ib_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_878 <= 1'h0;
    end else if (fifo_cmd_en[0]) begin
      _T_878 <= io_dbg_dma_dbg_ib_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_sz_4 <= 3'h0;
    end else if (fifo_cmd_en[4]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        fifo_sz_4 <= _T_23;
      end else if (axi_mstr_sel) begin
        fifo_sz_4 <= wrbuf_sz;
      end else begin
        fifo_sz_4 <= rdbuf_sz;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_sz_3 <= 3'h0;
    end else if (fifo_cmd_en[3]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        fifo_sz_3 <= _T_23;
      end else if (axi_mstr_sel) begin
        fifo_sz_3 <= wrbuf_sz;
      end else begin
        fifo_sz_3 <= rdbuf_sz;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_sz_2 <= 3'h0;
    end else if (fifo_cmd_en[2]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        fifo_sz_2 <= _T_23;
      end else if (axi_mstr_sel) begin
        fifo_sz_2 <= wrbuf_sz;
      end else begin
        fifo_sz_2 <= rdbuf_sz;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_sz_1 <= 3'h0;
    end else if (fifo_cmd_en[1]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        fifo_sz_1 <= _T_23;
      end else if (axi_mstr_sel) begin
        fifo_sz_1 <= wrbuf_sz;
      end else begin
        fifo_sz_1 <= rdbuf_sz;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_sz_0 <= 3'h0;
    end else if (fifo_cmd_en[0]) begin
      fifo_sz_0 <= fifo_sz_in;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_byteen_4 <= 8'h0;
    end else if (fifo_cmd_en[4]) begin
      fifo_byteen_4 <= fifo_byteen_in;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_byteen_3 <= 8'h0;
    end else if (fifo_cmd_en[3]) begin
      fifo_byteen_3 <= fifo_byteen_in;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_byteen_2 <= 8'h0;
    end else if (fifo_cmd_en[2]) begin
      fifo_byteen_2 <= fifo_byteen_in;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_byteen_1 <= 8'h0;
    end else if (fifo_cmd_en[1]) begin
      fifo_byteen_1 <= fifo_byteen_in;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_byteen_0 <= 8'h0;
    end else if (fifo_cmd_en[0]) begin
      fifo_byteen_0 <= fifo_byteen_in;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      fifo_error_0 <= 2'h0;
    end else begin
      fifo_error_0 <= _T_605 & _T_609;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      fifo_error_1 <= 2'h0;
    end else begin
      fifo_error_1 <= _T_614 & _T_618;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      fifo_error_2 <= 2'h0;
    end else begin
      fifo_error_2 <= _T_623 & _T_627;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      fifo_error_3 <= 2'h0;
    end else begin
      fifo_error_3 <= _T_632 & _T_636;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      fifo_error_4 <= 2'h0;
    end else begin
      fifo_error_4 <= _T_641 & _T_645;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      RspPtr <= 3'h0;
    end else if (RspPtrEn) begin
      if (_T_941) begin
        RspPtr <= 3'h0;
      end else begin
        RspPtr <= _T_944;
      end
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      wrbuf_data <= 64'h0;
    end else begin
      wrbuf_data <= io_dma_axi_w_bits_data;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_721 <= 1'h0;
    end else begin
      _T_721 <= _T_717 & _T_596;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_714 <= 1'h0;
    end else begin
      _T_714 <= _T_710 & _T_589;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_707 <= 1'h0;
    end else begin
      _T_707 <= _T_703 & _T_582;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_700 <= 1'h0;
    end else begin
      _T_700 <= _T_696 & _T_575;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_693 <= 1'h0;
    end else begin
      _T_693 <= _T_689 & _T_568;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_799 <= 1'h0;
    end else begin
      _T_799 <= _T_795 & _T_596;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_792 <= 1'h0;
    end else begin
      _T_792 <= _T_788 & _T_589;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_785 <= 1'h0;
    end else begin
      _T_785 <= _T_781 & _T_582;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_778 <= 1'h0;
    end else begin
      _T_778 <= _T_774 & _T_575;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      _T_771 <= 1'h0;
    end else begin
      _T_771 <= _T_767 & _T_568;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_850 <= 1'h0;
    end else if (fifo_cmd_en[0]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        _T_850 <= io_dbg_dma_dbg_ib_dbg_cmd_write;
      end else if (_T_1261) begin
        _T_850 <= axi_mstr_priority;
      end else begin
        _T_850 <= _T_1260;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_852 <= 1'h0;
    end else if (fifo_cmd_en[1]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        _T_852 <= io_dbg_dma_dbg_ib_dbg_cmd_write;
      end else if (_T_1261) begin
        _T_852 <= axi_mstr_priority;
      end else begin
        _T_852 <= _T_1260;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_854 <= 1'h0;
    end else if (fifo_cmd_en[2]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        _T_854 <= io_dbg_dma_dbg_ib_dbg_cmd_write;
      end else if (_T_1261) begin
        _T_854 <= axi_mstr_priority;
      end else begin
        _T_854 <= _T_1260;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_856 <= 1'h0;
    end else if (fifo_cmd_en[3]) begin
      if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
        _T_856 <= io_dbg_dma_dbg_ib_dbg_cmd_write;
      end else if (_T_1261) begin
        _T_856 <= axi_mstr_priority;
      end else begin
        _T_856 <= _T_1260;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_858 <= 1'h0;
    end else if (fifo_cmd_en[4]) begin
      _T_858 <= fifo_write_in;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_data_0 <= 64'h0;
    end else if (_T_491) begin
      fifo_data_0 <= _T_493;
    end else if (_T_84) begin
      fifo_data_0 <= io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata;
    end else if (_T_87) begin
      fifo_data_0 <= io_iccm_dma_rdata;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_data_0 <= _T_498;
    end else begin
      fifo_data_0 <= wrbuf_data;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_data_1 <= 64'h0;
    end else if (_T_506) begin
      fifo_data_1 <= _T_508;
    end else if (_T_102) begin
      fifo_data_1 <= io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata;
    end else if (_T_105) begin
      fifo_data_1 <= io_iccm_dma_rdata;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_data_1 <= _T_498;
    end else begin
      fifo_data_1 <= wrbuf_data;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_data_2 <= 64'h0;
    end else if (_T_521) begin
      fifo_data_2 <= _T_523;
    end else if (_T_120) begin
      fifo_data_2 <= io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata;
    end else if (_T_123) begin
      fifo_data_2 <= io_iccm_dma_rdata;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_data_2 <= _T_498;
    end else begin
      fifo_data_2 <= wrbuf_data;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_data_3 <= 64'h0;
    end else if (_T_536) begin
      fifo_data_3 <= _T_538;
    end else if (_T_138) begin
      fifo_data_3 <= io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata;
    end else if (_T_141) begin
      fifo_data_3 <= io_iccm_dma_rdata;
    end else if (io_dbg_dma_dbg_ib_dbg_cmd_valid) begin
      fifo_data_3 <= _T_498;
    end else begin
      fifo_data_3 <= wrbuf_data;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_data_4 <= 64'h0;
    end else if (_T_551) begin
      fifo_data_4 <= _T_553;
    end else if (_T_156) begin
      fifo_data_4 <= io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata;
    end else if (_T_159) begin
      fifo_data_4 <= io_iccm_dma_rdata;
    end else begin
      fifo_data_4 <= _T_500;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_tag_0 <= 1'h0;
    end else if (fifo_cmd_en[0]) begin
      if (axi_mstr_sel) begin
        fifo_tag_0 <= wrbuf_tag;
      end else begin
        fifo_tag_0 <= rdbuf_tag;
      end
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_tag <= 1'h0;
    end else if (wrbuf_en) begin
      wrbuf_tag <= io_dma_axi_aw_bits_id;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      rdbuf_tag <= 1'h0;
    end else if (rdbuf_en) begin
      rdbuf_tag <= io_dma_axi_ar_bits_id;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_tag_1 <= 1'h0;
    end else if (fifo_cmd_en[1]) begin
      if (axi_mstr_sel) begin
        fifo_tag_1 <= wrbuf_tag;
      end else begin
        fifo_tag_1 <= rdbuf_tag;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_tag_2 <= 1'h0;
    end else if (fifo_cmd_en[2]) begin
      if (axi_mstr_sel) begin
        fifo_tag_2 <= wrbuf_tag;
      end else begin
        fifo_tag_2 <= rdbuf_tag;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_tag_3 <= 1'h0;
    end else if (fifo_cmd_en[3]) begin
      if (axi_mstr_sel) begin
        fifo_tag_3 <= wrbuf_tag;
      end else begin
        fifo_tag_3 <= rdbuf_tag;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_tag_4 <= 1'h0;
    end else if (fifo_cmd_en[4]) begin
      fifo_tag_4 <= bus_cmd_tag;
    end
  end
  always @(posedge dma_free_clk or posedge reset) begin
    if (reset) begin
      dma_nack_count <= 3'h0;
    end else if (dma_mem_req) begin
      if (_T_1138) begin
        dma_nack_count <= _T_1151;
      end else if (_T_1155) begin
        dma_nack_count <= _T_1158;
      end else begin
        dma_nack_count <= 3'h0;
      end
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dma_dbg_cmd_done_q <= 1'h0;
    end else begin
      dma_dbg_cmd_done_q <= io_dma_dbg_cmd_done;
    end
  end
endmodule
