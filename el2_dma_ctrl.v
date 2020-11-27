module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 474:26]
  wire  clkhdr_CK; // @[el2_lib.scala 474:26]
  wire  clkhdr_EN; // @[el2_lib.scala 474:26]
  wire  clkhdr_SE; // @[el2_lib.scala 474:26]
  gated_latch clkhdr ( // @[el2_lib.scala 474:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 475:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 476:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 477:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 478:18]
endmodule
module el2_dma_ctrl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_dma_bus_clk_en,
  input         io_clk_override,
  input         io_scan_mode,
  input  [31:0] io_dbg_cmd_addr,
  input  [31:0] io_dbg_cmd_wrdata,
  input         io_dbg_cmd_valid,
  input         io_dbg_cmd_write,
  input  [1:0]  io_dbg_cmd_type,
  input  [1:0]  io_dbg_cmd_size,
  input         io_dbg_dma_bubble,
  output        io_dma_dbg_ready,
  output        io_dma_dbg_cmd_done,
  output        io_dma_dbg_cmd_fail,
  output [31:0] io_dma_dbg_rddata,
  output        io_dma_dccm_req,
  output        io_dma_iccm_req,
  output [2:0]  io_dma_mem_tag,
  output [31:0] io_dma_mem_addr,
  output [2:0]  io_dma_mem_sz,
  output        io_dma_mem_write,
  output [63:0] io_dma_mem_wdata,
  input         io_dccm_dma_rvalid,
  input         io_dccm_dma_ecc_error,
  input  [2:0]  io_dccm_dma_rtag,
  input  [63:0] io_dccm_dma_rdata,
  input         io_iccm_dma_rvalid,
  input         io_iccm_dma_ecc_error,
  input  [2:0]  io_iccm_dma_rtag,
  input  [63:0] io_iccm_dma_rdata,
  output        io_dma_dccm_stall_any,
  output        io_dma_iccm_stall_any,
  input         io_dccm_ready,
  input         io_iccm_ready,
  input  [2:0]  io_dec_tlu_dma_qos_prty,
  output        io_dma_pmu_dccm_read,
  output        io_dma_pmu_dccm_write,
  output        io_dma_pmu_any_read,
  output        io_dma_pmu_any_write,
  input         io_dma_axi_awvalid,
  output        io_dma_axi_awready,
  input         io_dma_axi_awid,
  input  [31:0] io_dma_axi_awaddr,
  input  [2:0]  io_dma_axi_awsize,
  input         io_dma_axi_wvalid,
  output        io_dma_axi_wready,
  input  [63:0] io_dma_axi_wdata,
  input  [7:0]  io_dma_axi_wstrb,
  output        io_dma_axi_bvalid,
  input         io_dma_axi_bready,
  output [1:0]  io_dma_axi_bresp,
  output        io_dma_axi_bid,
  input         io_dma_axi_arvalid,
  output        io_dma_axi_arready,
  input         io_dma_axi_arid,
  input  [31:0] io_dma_axi_araddr,
  input  [2:0]  io_dma_axi_arsize,
  output        io_dma_axi_rvalid,
  input         io_dma_axi_rready,
  output        io_dma_axi_rid,
  output [63:0] io_dma_axi_rdata,
  output [1:0]  io_dma_axi_rresp,
  output        io_dma_axi_rlast
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  dma_buffer_c1cgc_io_l1clk; // @[el2_dma_ctrl.scala 439:32]
  wire  dma_buffer_c1cgc_io_clk; // @[el2_dma_ctrl.scala 439:32]
  wire  dma_buffer_c1cgc_io_en; // @[el2_dma_ctrl.scala 439:32]
  wire  dma_buffer_c1cgc_io_scan_mode; // @[el2_dma_ctrl.scala 439:32]
  wire  dma_free_cgc_io_l1clk; // @[el2_dma_ctrl.scala 445:28]
  wire  dma_free_cgc_io_clk; // @[el2_dma_ctrl.scala 445:28]
  wire  dma_free_cgc_io_en; // @[el2_dma_ctrl.scala 445:28]
  wire  dma_free_cgc_io_scan_mode; // @[el2_dma_ctrl.scala 445:28]
  wire  dma_bus_cgc_io_l1clk; // @[el2_dma_ctrl.scala 451:27]
  wire  dma_bus_cgc_io_clk; // @[el2_dma_ctrl.scala 451:27]
  wire  dma_bus_cgc_io_en; // @[el2_dma_ctrl.scala 451:27]
  wire  dma_bus_cgc_io_scan_mode; // @[el2_dma_ctrl.scala 451:27]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_12_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  dma_free_clk = dma_free_cgc_io_l1clk; // @[el2_dma_ctrl.scala 224:26 el2_dma_ctrl.scala 449:29]
  reg [2:0] RdPtr; // @[Reg.scala 27:20]
  reg [31:0] fifo_addr_4; // @[el2_lib.scala 514:16]
  reg [31:0] fifo_addr_3; // @[el2_lib.scala 514:16]
  reg [31:0] fifo_addr_2; // @[el2_lib.scala 514:16]
  reg [31:0] fifo_addr_1; // @[el2_lib.scala 514:16]
  reg [31:0] fifo_addr_0; // @[el2_lib.scala 514:16]
  wire [31:0] _GEN_60 = 3'h1 == RdPtr ? fifo_addr_1 : fifo_addr_0; // @[el2_dma_ctrl.scala 405:20]
  wire [31:0] _GEN_61 = 3'h2 == RdPtr ? fifo_addr_2 : _GEN_60; // @[el2_dma_ctrl.scala 405:20]
  wire [31:0] _GEN_62 = 3'h3 == RdPtr ? fifo_addr_3 : _GEN_61; // @[el2_dma_ctrl.scala 405:20]
  wire [31:0] dma_mem_addr_int = 3'h4 == RdPtr ? fifo_addr_4 : _GEN_62; // @[el2_dma_ctrl.scala 405:20]
  wire  dma_mem_addr_in_dccm = dma_mem_addr_int[31:16] == 16'hf004; // @[el2_lib.scala 501:39]
  wire  dma_mem_addr_in_pic = dma_mem_addr_int[31:15] == 17'h1e018; // @[el2_lib.scala 501:39]
  wire  dma_mem_addr_in_iccm = dma_mem_addr_int[31:16] == 16'hee00; // @[el2_lib.scala 501:39]
  wire  dma_bus_clk = dma_bus_cgc_io_l1clk; // @[el2_dma_ctrl.scala 226:25 el2_dma_ctrl.scala 455:28]
  reg  wrbuf_vld; // @[el2_dma_ctrl.scala 465:59]
  reg  wrbuf_data_vld; // @[el2_dma_ctrl.scala 467:59]
  wire  _T_1240 = wrbuf_vld & wrbuf_data_vld; // @[el2_dma_ctrl.scala 523:43]
  reg  rdbuf_vld; // @[el2_dma_ctrl.scala 491:47]
  wire  _T_1241 = _T_1240 & rdbuf_vld; // @[el2_dma_ctrl.scala 523:60]
  reg  axi_mstr_priority; // @[Reg.scala 27:20]
  wire  axi_mstr_sel = _T_1241 ? axi_mstr_priority : _T_1240; // @[el2_dma_ctrl.scala 523:31]
  reg [31:0] wrbuf_addr; // @[el2_lib.scala 514:16]
  reg [31:0] rdbuf_addr; // @[el2_lib.scala 514:16]
  wire [31:0] bus_cmd_addr = axi_mstr_sel ? wrbuf_addr : rdbuf_addr; // @[el2_dma_ctrl.scala 513:43]
  wire [2:0] _GEN_90 = {{2'd0}, io_dbg_cmd_addr[2]}; // @[el2_dma_ctrl.scala 251:76]
  wire [3:0] _T_17 = 3'h4 * _GEN_90; // @[el2_dma_ctrl.scala 251:76]
  wire [18:0] _T_18 = 19'hf << _T_17; // @[el2_dma_ctrl.scala 251:68]
  reg [7:0] wrbuf_byteen; // @[Reg.scala 27:20]
  wire [18:0] _T_20 = io_dbg_cmd_valid ? _T_18 : {{11'd0}, wrbuf_byteen}; // @[el2_dma_ctrl.scala 251:34]
  wire [2:0] _T_23 = {1'h0,io_dbg_cmd_size}; // @[Cat.scala 29:58]
  reg [2:0] wrbuf_sz; // @[Reg.scala 27:20]
  reg [2:0] rdbuf_sz; // @[Reg.scala 27:20]
  wire [2:0] bus_cmd_sz = axi_mstr_sel ? wrbuf_sz : rdbuf_sz; // @[el2_dma_ctrl.scala 514:45]
  wire [2:0] fifo_sz_in = io_dbg_cmd_valid ? _T_23 : bus_cmd_sz; // @[el2_dma_ctrl.scala 253:33]
  wire  fifo_write_in = io_dbg_cmd_valid ? io_dbg_cmd_write : axi_mstr_sel; // @[el2_dma_ctrl.scala 255:33]
  wire  bus_cmd_valid = _T_1240 | rdbuf_vld; // @[el2_dma_ctrl.scala 509:69]
  reg  fifo_full; // @[el2_dma_ctrl.scala 423:12]
  reg  dbg_dma_bubble_bus; // @[el2_dma_ctrl.scala 427:12]
  wire  _T_989 = fifo_full | dbg_dma_bubble_bus; // @[el2_dma_ctrl.scala 355:39]
  wire  dma_fifo_ready = ~_T_989; // @[el2_dma_ctrl.scala 355:27]
  wire  axi_mstr_prty_en = bus_cmd_valid & dma_fifo_ready; // @[el2_dma_ctrl.scala 510:54]
  wire  _T_28 = axi_mstr_prty_en & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 262:80]
  wire  _T_31 = io_dbg_cmd_valid & io_dbg_cmd_type[1]; // @[el2_dma_ctrl.scala 262:121]
  wire  _T_32 = _T_28 | _T_31; // @[el2_dma_ctrl.scala 262:101]
  reg [2:0] WrPtr; // @[Reg.scala 27:20]
  wire  _T_33 = 3'h0 == WrPtr; // @[el2_dma_ctrl.scala 262:158]
  wire  _T_34 = _T_32 & _T_33; // @[el2_dma_ctrl.scala 262:151]
  wire  _T_41 = 3'h1 == WrPtr; // @[el2_dma_ctrl.scala 262:158]
  wire  _T_42 = _T_32 & _T_41; // @[el2_dma_ctrl.scala 262:151]
  wire  _T_49 = 3'h2 == WrPtr; // @[el2_dma_ctrl.scala 262:158]
  wire  _T_50 = _T_32 & _T_49; // @[el2_dma_ctrl.scala 262:151]
  wire  _T_57 = 3'h3 == WrPtr; // @[el2_dma_ctrl.scala 262:158]
  wire  _T_58 = _T_32 & _T_57; // @[el2_dma_ctrl.scala 262:151]
  wire  _T_65 = 3'h4 == WrPtr; // @[el2_dma_ctrl.scala 262:158]
  wire  _T_66 = _T_32 & _T_65; // @[el2_dma_ctrl.scala 262:151]
  wire [4:0] fifo_cmd_en = {_T_66,_T_58,_T_50,_T_42,_T_34}; // @[Cat.scala 29:58]
  wire  _T_71 = axi_mstr_prty_en & fifo_write_in; // @[el2_dma_ctrl.scala 264:73]
  wire  _T_72 = _T_71 & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 264:89]
  wire  _T_75 = _T_31 & io_dbg_cmd_write; // @[el2_dma_ctrl.scala 264:151]
  wire  _T_76 = _T_72 | _T_75; // @[el2_dma_ctrl.scala 264:110]
  wire  _T_78 = _T_76 & _T_33; // @[el2_dma_ctrl.scala 264:172]
  reg  _T_598; // @[el2_dma_ctrl.scala 282:82]
  reg  _T_591; // @[el2_dma_ctrl.scala 282:82]
  reg  _T_584; // @[el2_dma_ctrl.scala 282:82]
  reg  _T_577; // @[el2_dma_ctrl.scala 282:82]
  reg  _T_570; // @[el2_dma_ctrl.scala 282:82]
  wire [4:0] fifo_valid = {_T_598,_T_591,_T_584,_T_577,_T_570}; // @[Cat.scala 29:58]
  wire [4:0] _T_990 = fifo_valid >> RdPtr; // @[el2_dma_ctrl.scala 359:38]
  reg  _T_760; // @[el2_dma_ctrl.scala 290:89]
  reg  _T_753; // @[el2_dma_ctrl.scala 290:89]
  reg  _T_746; // @[el2_dma_ctrl.scala 290:89]
  reg  _T_739; // @[el2_dma_ctrl.scala 290:89]
  reg  _T_732; // @[el2_dma_ctrl.scala 290:89]
  wire [4:0] fifo_done = {_T_760,_T_753,_T_746,_T_739,_T_732}; // @[Cat.scala 29:58]
  wire [4:0] _T_992 = fifo_done >> RdPtr; // @[el2_dma_ctrl.scala 359:58]
  wire  _T_994 = ~_T_992[0]; // @[el2_dma_ctrl.scala 359:48]
  wire  _T_995 = _T_990[0] & _T_994; // @[el2_dma_ctrl.scala 359:46]
  wire  dma_buffer_c1_clk = dma_buffer_c1cgc_io_l1clk; // @[el2_dma_ctrl.scala 228:31 el2_dma_ctrl.scala 443:33]
  reg  _T_886; // @[Reg.scala 27:20]
  reg  _T_884; // @[Reg.scala 27:20]
  reg  _T_882; // @[Reg.scala 27:20]
  reg  _T_880; // @[Reg.scala 27:20]
  reg  _T_878; // @[Reg.scala 27:20]
  wire [4:0] fifo_dbg = {_T_886,_T_884,_T_882,_T_880,_T_878}; // @[Cat.scala 29:58]
  wire [4:0] _T_996 = fifo_dbg >> RdPtr; // @[el2_dma_ctrl.scala 359:77]
  wire  _T_998 = ~_T_996[0]; // @[el2_dma_ctrl.scala 359:68]
  wire  _T_999 = _T_995 & _T_998; // @[el2_dma_ctrl.scala 359:66]
  wire  _T_1000 = dma_mem_addr_in_dccm | dma_mem_addr_in_iccm; // @[el2_dma_ctrl.scala 359:111]
  wire  _T_1001 = ~_T_1000; // @[el2_dma_ctrl.scala 359:88]
  wire  dma_address_error = _T_999 & _T_1001; // @[el2_dma_ctrl.scala 359:85]
  wire  _T_1009 = ~dma_address_error; // @[el2_dma_ctrl.scala 360:68]
  wire  _T_1010 = _T_995 & _T_1009; // @[el2_dma_ctrl.scala 360:66]
  reg [2:0] fifo_sz_4; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_3; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_2; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_1; // @[Reg.scala 27:20]
  reg [2:0] fifo_sz_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_65 = 3'h1 == RdPtr ? fifo_sz_1 : fifo_sz_0; // @[el2_dma_ctrl.scala 406:20]
  wire [2:0] _GEN_66 = 3'h2 == RdPtr ? fifo_sz_2 : _GEN_65; // @[el2_dma_ctrl.scala 406:20]
  wire [2:0] _GEN_67 = 3'h3 == RdPtr ? fifo_sz_3 : _GEN_66; // @[el2_dma_ctrl.scala 406:20]
  wire [2:0] dma_mem_sz_int = 3'h4 == RdPtr ? fifo_sz_4 : _GEN_67; // @[el2_dma_ctrl.scala 406:20]
  wire  _T_1012 = dma_mem_sz_int == 3'h1; // @[el2_dma_ctrl.scala 361:28]
  wire  _T_1014 = _T_1012 & dma_mem_addr_int[0]; // @[el2_dma_ctrl.scala 361:37]
  wire  _T_1016 = dma_mem_sz_int == 3'h2; // @[el2_dma_ctrl.scala 362:29]
  wire  _T_1018 = |dma_mem_addr_int[1:0]; // @[el2_dma_ctrl.scala 362:64]
  wire  _T_1019 = _T_1016 & _T_1018; // @[el2_dma_ctrl.scala 362:38]
  wire  _T_1020 = _T_1014 | _T_1019; // @[el2_dma_ctrl.scala 361:60]
  wire  _T_1022 = dma_mem_sz_int == 3'h3; // @[el2_dma_ctrl.scala 363:29]
  wire  _T_1024 = |dma_mem_addr_int[2:0]; // @[el2_dma_ctrl.scala 363:64]
  wire  _T_1025 = _T_1022 & _T_1024; // @[el2_dma_ctrl.scala 363:38]
  wire  _T_1026 = _T_1020 | _T_1025; // @[el2_dma_ctrl.scala 362:70]
  wire  _T_1028 = dma_mem_sz_int[1:0] == 2'h2; // @[el2_dma_ctrl.scala 364:55]
  wire  _T_1030 = dma_mem_sz_int[1:0] == 2'h3; // @[el2_dma_ctrl.scala 364:88]
  wire  _T_1031 = _T_1028 | _T_1030; // @[el2_dma_ctrl.scala 364:64]
  wire  _T_1032 = ~_T_1031; // @[el2_dma_ctrl.scala 364:31]
  wire  _T_1033 = dma_mem_addr_in_iccm & _T_1032; // @[el2_dma_ctrl.scala 364:29]
  wire  _T_1034 = _T_1026 | _T_1033; // @[el2_dma_ctrl.scala 363:70]
  wire  _T_1035 = dma_mem_addr_in_dccm & io_dma_mem_write; // @[el2_dma_ctrl.scala 365:29]
  wire  _T_1042 = _T_1035 & _T_1032; // @[el2_dma_ctrl.scala 365:48]
  wire  _T_1043 = _T_1034 | _T_1042; // @[el2_dma_ctrl.scala 364:108]
  wire  _T_1046 = io_dma_mem_write & _T_1016; // @[el2_dma_ctrl.scala 366:25]
  wire  _T_1048 = dma_mem_addr_int[2:0] == 3'h0; // @[el2_dma_ctrl.scala 366:94]
  reg [7:0] fifo_byteen_4; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_3; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_2; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_1; // @[Reg.scala 27:20]
  reg [7:0] fifo_byteen_0; // @[Reg.scala 27:20]
  wire [7:0] _GEN_70 = 3'h1 == RdPtr ? fifo_byteen_1 : fifo_byteen_0; // @[el2_dma_ctrl.scala 409:20]
  wire [7:0] _GEN_71 = 3'h2 == RdPtr ? fifo_byteen_2 : _GEN_70; // @[el2_dma_ctrl.scala 409:20]
  wire [7:0] _GEN_72 = 3'h3 == RdPtr ? fifo_byteen_3 : _GEN_71; // @[el2_dma_ctrl.scala 409:20]
  wire [7:0] dma_mem_byteen = 3'h4 == RdPtr ? fifo_byteen_4 : _GEN_72; // @[el2_dma_ctrl.scala 409:20]
  wire [3:0] _T_1059 = _T_1048 ? dma_mem_byteen[3:0] : 4'h0; // @[Mux.scala 27:72]
  wire  _T_1051 = dma_mem_addr_int[2:0] == 3'h1; // @[el2_dma_ctrl.scala 367:32]
  wire [3:0] _T_1060 = _T_1051 ? dma_mem_byteen[4:1] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1063 = _T_1059 | _T_1060; // @[Mux.scala 27:72]
  wire  _T_1054 = dma_mem_addr_int[2:0] == 3'h2; // @[el2_dma_ctrl.scala 368:32]
  wire [3:0] _T_1061 = _T_1054 ? dma_mem_byteen[5:2] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1064 = _T_1063 | _T_1061; // @[Mux.scala 27:72]
  wire  _T_1057 = dma_mem_addr_int[2:0] == 3'h3; // @[el2_dma_ctrl.scala 369:32]
  wire [3:0] _T_1062 = _T_1057 ? dma_mem_byteen[6:3] : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1065 = _T_1064 | _T_1062; // @[Mux.scala 27:72]
  wire  _T_1067 = _T_1065 != 4'hf; // @[el2_dma_ctrl.scala 369:68]
  wire  _T_1068 = _T_1046 & _T_1067; // @[el2_dma_ctrl.scala 366:58]
  wire  _T_1069 = _T_1043 | _T_1068; // @[el2_dma_ctrl.scala 365:125]
  wire  _T_1072 = io_dma_mem_write & _T_1022; // @[el2_dma_ctrl.scala 370:25]
  wire  _T_1074 = dma_mem_byteen == 8'hf; // @[el2_dma_ctrl.scala 370:83]
  wire  _T_1076 = dma_mem_byteen == 8'hf0; // @[el2_dma_ctrl.scala 370:119]
  wire  _T_1077 = _T_1074 | _T_1076; // @[el2_dma_ctrl.scala 370:96]
  wire  _T_1079 = dma_mem_byteen == 8'hff; // @[el2_dma_ctrl.scala 370:155]
  wire  _T_1080 = _T_1077 | _T_1079; // @[el2_dma_ctrl.scala 370:132]
  wire  _T_1081 = ~_T_1080; // @[el2_dma_ctrl.scala 370:60]
  wire  _T_1082 = _T_1072 & _T_1081; // @[el2_dma_ctrl.scala 370:58]
  wire  _T_1083 = _T_1069 | _T_1082; // @[el2_dma_ctrl.scala 369:79]
  wire  dma_alignment_error = _T_1010 & _T_1083; // @[el2_dma_ctrl.scala 360:87]
  wire  _T_79 = dma_address_error | dma_alignment_error; // @[el2_dma_ctrl.scala 264:213]
  wire  _T_80 = 3'h0 == RdPtr; // @[el2_dma_ctrl.scala 264:243]
  wire  _T_81 = _T_79 & _T_80; // @[el2_dma_ctrl.scala 264:236]
  wire  _T_82 = _T_78 | _T_81; // @[el2_dma_ctrl.scala 264:191]
  wire  _T_83 = 3'h0 == io_dccm_dma_rtag; // @[el2_dma_ctrl.scala 264:284]
  wire  _T_84 = io_dccm_dma_rvalid & _T_83; // @[el2_dma_ctrl.scala 264:277]
  wire  _T_85 = _T_82 | _T_84; // @[el2_dma_ctrl.scala 264:255]
  wire  _T_86 = 3'h0 == io_iccm_dma_rtag; // @[el2_dma_ctrl.scala 264:336]
  wire  _T_87 = io_iccm_dma_rvalid & _T_86; // @[el2_dma_ctrl.scala 264:329]
  wire  _T_88 = _T_85 | _T_87; // @[el2_dma_ctrl.scala 264:307]
  wire  _T_96 = _T_76 & _T_41; // @[el2_dma_ctrl.scala 264:172]
  wire  _T_98 = 3'h1 == RdPtr; // @[el2_dma_ctrl.scala 264:243]
  wire  _T_99 = _T_79 & _T_98; // @[el2_dma_ctrl.scala 264:236]
  wire  _T_100 = _T_96 | _T_99; // @[el2_dma_ctrl.scala 264:191]
  wire  _T_101 = 3'h1 == io_dccm_dma_rtag; // @[el2_dma_ctrl.scala 264:284]
  wire  _T_102 = io_dccm_dma_rvalid & _T_101; // @[el2_dma_ctrl.scala 264:277]
  wire  _T_103 = _T_100 | _T_102; // @[el2_dma_ctrl.scala 264:255]
  wire  _T_104 = 3'h1 == io_iccm_dma_rtag; // @[el2_dma_ctrl.scala 264:336]
  wire  _T_105 = io_iccm_dma_rvalid & _T_104; // @[el2_dma_ctrl.scala 264:329]
  wire  _T_106 = _T_103 | _T_105; // @[el2_dma_ctrl.scala 264:307]
  wire  _T_114 = _T_76 & _T_49; // @[el2_dma_ctrl.scala 264:172]
  wire  _T_116 = 3'h2 == RdPtr; // @[el2_dma_ctrl.scala 264:243]
  wire  _T_117 = _T_79 & _T_116; // @[el2_dma_ctrl.scala 264:236]
  wire  _T_118 = _T_114 | _T_117; // @[el2_dma_ctrl.scala 264:191]
  wire  _T_119 = 3'h2 == io_dccm_dma_rtag; // @[el2_dma_ctrl.scala 264:284]
  wire  _T_120 = io_dccm_dma_rvalid & _T_119; // @[el2_dma_ctrl.scala 264:277]
  wire  _T_121 = _T_118 | _T_120; // @[el2_dma_ctrl.scala 264:255]
  wire  _T_122 = 3'h2 == io_iccm_dma_rtag; // @[el2_dma_ctrl.scala 264:336]
  wire  _T_123 = io_iccm_dma_rvalid & _T_122; // @[el2_dma_ctrl.scala 264:329]
  wire  _T_124 = _T_121 | _T_123; // @[el2_dma_ctrl.scala 264:307]
  wire  _T_132 = _T_76 & _T_57; // @[el2_dma_ctrl.scala 264:172]
  wire  _T_134 = 3'h3 == RdPtr; // @[el2_dma_ctrl.scala 264:243]
  wire  _T_135 = _T_79 & _T_134; // @[el2_dma_ctrl.scala 264:236]
  wire  _T_136 = _T_132 | _T_135; // @[el2_dma_ctrl.scala 264:191]
  wire  _T_137 = 3'h3 == io_dccm_dma_rtag; // @[el2_dma_ctrl.scala 264:284]
  wire  _T_138 = io_dccm_dma_rvalid & _T_137; // @[el2_dma_ctrl.scala 264:277]
  wire  _T_139 = _T_136 | _T_138; // @[el2_dma_ctrl.scala 264:255]
  wire  _T_140 = 3'h3 == io_iccm_dma_rtag; // @[el2_dma_ctrl.scala 264:336]
  wire  _T_141 = io_iccm_dma_rvalid & _T_140; // @[el2_dma_ctrl.scala 264:329]
  wire  _T_142 = _T_139 | _T_141; // @[el2_dma_ctrl.scala 264:307]
  wire  _T_150 = _T_76 & _T_65; // @[el2_dma_ctrl.scala 264:172]
  wire  _T_152 = 3'h4 == RdPtr; // @[el2_dma_ctrl.scala 264:243]
  wire  _T_153 = _T_79 & _T_152; // @[el2_dma_ctrl.scala 264:236]
  wire  _T_154 = _T_150 | _T_153; // @[el2_dma_ctrl.scala 264:191]
  wire  _T_155 = 3'h4 == io_dccm_dma_rtag; // @[el2_dma_ctrl.scala 264:284]
  wire  _T_156 = io_dccm_dma_rvalid & _T_155; // @[el2_dma_ctrl.scala 264:277]
  wire  _T_157 = _T_154 | _T_156; // @[el2_dma_ctrl.scala 264:255]
  wire  _T_158 = 3'h4 == io_iccm_dma_rtag; // @[el2_dma_ctrl.scala 264:336]
  wire  _T_159 = io_iccm_dma_rvalid & _T_158; // @[el2_dma_ctrl.scala 264:329]
  wire  _T_160 = _T_157 | _T_159; // @[el2_dma_ctrl.scala 264:307]
  wire [4:0] fifo_data_en = {_T_160,_T_142,_T_124,_T_106,_T_88}; // @[Cat.scala 29:58]
  wire  _T_165 = io_dma_dccm_req | io_dma_iccm_req; // @[el2_dma_ctrl.scala 266:75]
  wire  _T_166 = ~io_dma_mem_write; // @[el2_dma_ctrl.scala 266:96]
  wire  _T_167 = _T_165 & _T_166; // @[el2_dma_ctrl.scala 266:94]
  wire  _T_169 = _T_167 & _T_80; // @[el2_dma_ctrl.scala 266:114]
  wire  _T_174 = _T_167 & _T_98; // @[el2_dma_ctrl.scala 266:114]
  wire  _T_179 = _T_167 & _T_116; // @[el2_dma_ctrl.scala 266:114]
  wire  _T_184 = _T_167 & _T_134; // @[el2_dma_ctrl.scala 266:114]
  wire  _T_189 = _T_167 & _T_152; // @[el2_dma_ctrl.scala 266:114]
  wire [4:0] fifo_pend_en = {_T_189,_T_184,_T_179,_T_174,_T_169}; // @[Cat.scala 29:58]
  wire  _T_1107 = _T_995 & _T_996[0]; // @[el2_dma_ctrl.scala 379:66]
  wire  _T_1109 = _T_1000 | dma_mem_addr_in_pic; // @[el2_dma_ctrl.scala 379:134]
  wire  _T_1110 = ~_T_1109; // @[el2_dma_ctrl.scala 379:88]
  wire  _T_1113 = dma_mem_sz_int[1:0] != 2'h2; // @[el2_dma_ctrl.scala 379:191]
  wire  _T_1114 = _T_1110 | _T_1113; // @[el2_dma_ctrl.scala 379:167]
  wire  dma_dbg_cmd_error = _T_1107 & _T_1114; // @[el2_dma_ctrl.scala 379:84]
  wire  _T_197 = _T_79 | dma_dbg_cmd_error; // @[el2_dma_ctrl.scala 268:114]
  wire  _T_199 = _T_197 & _T_80; // @[el2_dma_ctrl.scala 268:135]
  wire  _T_200 = io_dccm_dma_rvalid & io_dccm_dma_ecc_error; // @[el2_dma_ctrl.scala 268:177]
  wire  _T_202 = _T_200 & _T_83; // @[el2_dma_ctrl.scala 268:202]
  wire  _T_203 = _T_199 | _T_202; // @[el2_dma_ctrl.scala 268:154]
  wire  _T_204 = io_iccm_dma_rvalid & io_iccm_dma_ecc_error; // @[el2_dma_ctrl.scala 268:255]
  wire  _T_206 = _T_204 & _T_86; // @[el2_dma_ctrl.scala 268:280]
  wire  _T_207 = _T_203 | _T_206; // @[el2_dma_ctrl.scala 268:232]
  wire  _T_213 = _T_197 & _T_98; // @[el2_dma_ctrl.scala 268:135]
  wire  _T_216 = _T_200 & _T_101; // @[el2_dma_ctrl.scala 268:202]
  wire  _T_217 = _T_213 | _T_216; // @[el2_dma_ctrl.scala 268:154]
  wire  _T_220 = _T_204 & _T_104; // @[el2_dma_ctrl.scala 268:280]
  wire  _T_221 = _T_217 | _T_220; // @[el2_dma_ctrl.scala 268:232]
  wire  _T_227 = _T_197 & _T_116; // @[el2_dma_ctrl.scala 268:135]
  wire  _T_230 = _T_200 & _T_119; // @[el2_dma_ctrl.scala 268:202]
  wire  _T_231 = _T_227 | _T_230; // @[el2_dma_ctrl.scala 268:154]
  wire  _T_234 = _T_204 & _T_122; // @[el2_dma_ctrl.scala 268:280]
  wire  _T_235 = _T_231 | _T_234; // @[el2_dma_ctrl.scala 268:232]
  wire  _T_241 = _T_197 & _T_134; // @[el2_dma_ctrl.scala 268:135]
  wire  _T_244 = _T_200 & _T_137; // @[el2_dma_ctrl.scala 268:202]
  wire  _T_245 = _T_241 | _T_244; // @[el2_dma_ctrl.scala 268:154]
  wire  _T_248 = _T_204 & _T_140; // @[el2_dma_ctrl.scala 268:280]
  wire  _T_249 = _T_245 | _T_248; // @[el2_dma_ctrl.scala 268:232]
  wire  _T_255 = _T_197 & _T_152; // @[el2_dma_ctrl.scala 268:135]
  wire  _T_258 = _T_200 & _T_155; // @[el2_dma_ctrl.scala 268:202]
  wire  _T_259 = _T_255 | _T_258; // @[el2_dma_ctrl.scala 268:154]
  wire  _T_262 = _T_204 & _T_158; // @[el2_dma_ctrl.scala 268:280]
  wire  _T_263 = _T_259 | _T_262; // @[el2_dma_ctrl.scala 268:232]
  wire [4:0] fifo_error_en = {_T_263,_T_249,_T_235,_T_221,_T_207}; // @[Cat.scala 29:58]
  wire [1:0] _T_436 = {1'h0,io_dccm_dma_ecc_error}; // @[Cat.scala 29:58]
  wire [1:0] _T_439 = {1'h0,io_iccm_dma_ecc_error}; // @[Cat.scala 29:58]
  wire [1:0] _T_442 = {_T_197,dma_alignment_error}; // @[Cat.scala 29:58]
  wire [1:0] _T_443 = _T_87 ? _T_439 : _T_442; // @[el2_dma_ctrl.scala 278:146]
  wire [1:0] fifo_error_in_0 = _T_84 ? _T_436 : _T_443; // @[el2_dma_ctrl.scala 278:60]
  wire  _T_269 = |fifo_error_in_0; // @[el2_dma_ctrl.scala 270:83]
  reg [1:0] fifo_error_0; // @[el2_dma_ctrl.scala 284:85]
  wire  _T_272 = |fifo_error_0; // @[el2_dma_ctrl.scala 270:125]
  wire [1:0] _T_454 = _T_105 ? _T_439 : _T_442; // @[el2_dma_ctrl.scala 278:146]
  wire [1:0] fifo_error_in_1 = _T_102 ? _T_436 : _T_454; // @[el2_dma_ctrl.scala 278:60]
  wire  _T_276 = |fifo_error_in_1; // @[el2_dma_ctrl.scala 270:83]
  reg [1:0] fifo_error_1; // @[el2_dma_ctrl.scala 284:85]
  wire  _T_279 = |fifo_error_1; // @[el2_dma_ctrl.scala 270:125]
  wire [1:0] _T_465 = _T_123 ? _T_439 : _T_442; // @[el2_dma_ctrl.scala 278:146]
  wire [1:0] fifo_error_in_2 = _T_120 ? _T_436 : _T_465; // @[el2_dma_ctrl.scala 278:60]
  wire  _T_283 = |fifo_error_in_2; // @[el2_dma_ctrl.scala 270:83]
  reg [1:0] fifo_error_2; // @[el2_dma_ctrl.scala 284:85]
  wire  _T_286 = |fifo_error_2; // @[el2_dma_ctrl.scala 270:125]
  wire [1:0] _T_476 = _T_141 ? _T_439 : _T_442; // @[el2_dma_ctrl.scala 278:146]
  wire [1:0] fifo_error_in_3 = _T_138 ? _T_436 : _T_476; // @[el2_dma_ctrl.scala 278:60]
  wire  _T_290 = |fifo_error_in_3; // @[el2_dma_ctrl.scala 270:83]
  reg [1:0] fifo_error_3; // @[el2_dma_ctrl.scala 284:85]
  wire  _T_293 = |fifo_error_3; // @[el2_dma_ctrl.scala 270:125]
  wire [1:0] _T_487 = _T_159 ? _T_439 : _T_442; // @[el2_dma_ctrl.scala 278:146]
  wire [1:0] fifo_error_in_4 = _T_156 ? _T_436 : _T_487; // @[el2_dma_ctrl.scala 278:60]
  wire  _T_297 = |fifo_error_in_4; // @[el2_dma_ctrl.scala 270:83]
  reg [1:0] fifo_error_4; // @[el2_dma_ctrl.scala 284:85]
  wire  _T_300 = |fifo_error_4; // @[el2_dma_ctrl.scala 270:125]
  wire  _T_309 = _T_272 | fifo_error_en[0]; // @[el2_dma_ctrl.scala 272:78]
  wire  _T_311 = _T_165 & io_dma_mem_write; // @[el2_dma_ctrl.scala 272:136]
  wire  _T_312 = _T_309 | _T_311; // @[el2_dma_ctrl.scala 272:97]
  wire  _T_314 = _T_312 & _T_80; // @[el2_dma_ctrl.scala 272:157]
  wire  _T_317 = _T_314 | _T_84; // @[el2_dma_ctrl.scala 272:176]
  wire  _T_320 = _T_317 | _T_87; // @[el2_dma_ctrl.scala 272:228]
  wire  _T_323 = _T_279 | fifo_error_en[1]; // @[el2_dma_ctrl.scala 272:78]
  wire  _T_326 = _T_323 | _T_311; // @[el2_dma_ctrl.scala 272:97]
  wire  _T_328 = _T_326 & _T_98; // @[el2_dma_ctrl.scala 272:157]
  wire  _T_331 = _T_328 | _T_102; // @[el2_dma_ctrl.scala 272:176]
  wire  _T_334 = _T_331 | _T_105; // @[el2_dma_ctrl.scala 272:228]
  wire  _T_337 = _T_286 | fifo_error_en[2]; // @[el2_dma_ctrl.scala 272:78]
  wire  _T_340 = _T_337 | _T_311; // @[el2_dma_ctrl.scala 272:97]
  wire  _T_342 = _T_340 & _T_116; // @[el2_dma_ctrl.scala 272:157]
  wire  _T_345 = _T_342 | _T_120; // @[el2_dma_ctrl.scala 272:176]
  wire  _T_348 = _T_345 | _T_123; // @[el2_dma_ctrl.scala 272:228]
  wire  _T_351 = _T_293 | fifo_error_en[3]; // @[el2_dma_ctrl.scala 272:78]
  wire  _T_354 = _T_351 | _T_311; // @[el2_dma_ctrl.scala 272:97]
  wire  _T_356 = _T_354 & _T_134; // @[el2_dma_ctrl.scala 272:157]
  wire  _T_359 = _T_356 | _T_138; // @[el2_dma_ctrl.scala 272:176]
  wire  _T_362 = _T_359 | _T_141; // @[el2_dma_ctrl.scala 272:228]
  wire  _T_365 = _T_300 | fifo_error_en[4]; // @[el2_dma_ctrl.scala 272:78]
  wire  _T_368 = _T_365 | _T_311; // @[el2_dma_ctrl.scala 272:97]
  wire  _T_370 = _T_368 & _T_152; // @[el2_dma_ctrl.scala 272:157]
  wire  _T_373 = _T_370 | _T_156; // @[el2_dma_ctrl.scala 272:176]
  wire  _T_376 = _T_373 | _T_159; // @[el2_dma_ctrl.scala 272:228]
  wire [4:0] fifo_done_en = {_T_376,_T_362,_T_348,_T_334,_T_320}; // @[Cat.scala 29:58]
  wire  _T_383 = fifo_done_en[0] | fifo_done[0]; // @[el2_dma_ctrl.scala 274:75]
  wire  _T_384 = _T_383 & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 274:91]
  wire  _T_387 = fifo_done_en[1] | fifo_done[1]; // @[el2_dma_ctrl.scala 274:75]
  wire  _T_388 = _T_387 & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 274:91]
  wire  _T_391 = fifo_done_en[2] | fifo_done[2]; // @[el2_dma_ctrl.scala 274:75]
  wire  _T_392 = _T_391 & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 274:91]
  wire  _T_395 = fifo_done_en[3] | fifo_done[3]; // @[el2_dma_ctrl.scala 274:75]
  wire  _T_396 = _T_395 & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 274:91]
  wire  _T_399 = fifo_done_en[4] | fifo_done[4]; // @[el2_dma_ctrl.scala 274:75]
  wire  _T_400 = _T_399 & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 274:91]
  wire [4:0] fifo_done_bus_en = {_T_400,_T_396,_T_392,_T_388,_T_384}; // @[Cat.scala 29:58]
  wire  _T_1265 = io_dma_axi_bvalid & io_dma_axi_bready; // @[el2_dma_ctrl.scala 552:60]
  wire  _T_1266 = io_dma_axi_rvalid & io_dma_axi_rready; // @[el2_dma_ctrl.scala 552:102]
  wire  bus_rsp_sent = _T_1265 | _T_1266; // @[el2_dma_ctrl.scala 552:81]
  wire  _T_406 = bus_rsp_sent & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 276:99]
  wire  _T_407 = _T_406 | io_dma_dbg_cmd_done; // @[el2_dma_ctrl.scala 276:120]
  reg [2:0] RspPtr; // @[Reg.scala 27:20]
  wire  _T_408 = 3'h0 == RspPtr; // @[el2_dma_ctrl.scala 276:150]
  wire  _T_409 = _T_407 & _T_408; // @[el2_dma_ctrl.scala 276:143]
  wire  _T_413 = 3'h1 == RspPtr; // @[el2_dma_ctrl.scala 276:150]
  wire  _T_414 = _T_407 & _T_413; // @[el2_dma_ctrl.scala 276:143]
  wire  _T_418 = 3'h2 == RspPtr; // @[el2_dma_ctrl.scala 276:150]
  wire  _T_419 = _T_407 & _T_418; // @[el2_dma_ctrl.scala 276:143]
  wire  _T_423 = 3'h3 == RspPtr; // @[el2_dma_ctrl.scala 276:150]
  wire  _T_424 = _T_407 & _T_423; // @[el2_dma_ctrl.scala 276:143]
  wire  _T_428 = 3'h4 == RspPtr; // @[el2_dma_ctrl.scala 276:150]
  wire  _T_429 = _T_407 & _T_428; // @[el2_dma_ctrl.scala 276:143]
  wire [4:0] fifo_reset = {_T_429,_T_424,_T_419,_T_414,_T_409}; // @[Cat.scala 29:58]
  wire  _T_491 = fifo_error_en[0] & _T_269; // @[el2_dma_ctrl.scala 280:77]
  wire [63:0] _T_493 = {32'h0,fifo_addr_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_498 = {io_dbg_cmd_wrdata,io_dbg_cmd_wrdata}; // @[Cat.scala 29:58]
  reg [63:0] wrbuf_data; // @[el2_lib.scala 514:16]
  wire [63:0] _T_500 = io_dbg_cmd_valid ? _T_498 : wrbuf_data; // @[el2_dma_ctrl.scala 280:284]
  wire  _T_506 = fifo_error_en[1] & _T_276; // @[el2_dma_ctrl.scala 280:77]
  wire [63:0] _T_508 = {32'h0,fifo_addr_1}; // @[Cat.scala 29:58]
  wire  _T_521 = fifo_error_en[2] & _T_283; // @[el2_dma_ctrl.scala 280:77]
  wire [63:0] _T_523 = {32'h0,fifo_addr_2}; // @[Cat.scala 29:58]
  wire  _T_536 = fifo_error_en[3] & _T_290; // @[el2_dma_ctrl.scala 280:77]
  wire [63:0] _T_538 = {32'h0,fifo_addr_3}; // @[Cat.scala 29:58]
  wire  _T_551 = fifo_error_en[4] & _T_297; // @[el2_dma_ctrl.scala 280:77]
  wire [63:0] _T_553 = {32'h0,fifo_addr_4}; // @[Cat.scala 29:58]
  wire  _T_566 = fifo_cmd_en[0] | fifo_valid[0]; // @[el2_dma_ctrl.scala 282:86]
  wire  _T_568 = ~fifo_reset[0]; // @[el2_dma_ctrl.scala 282:125]
  wire  _T_573 = fifo_cmd_en[1] | fifo_valid[1]; // @[el2_dma_ctrl.scala 282:86]
  wire  _T_575 = ~fifo_reset[1]; // @[el2_dma_ctrl.scala 282:125]
  wire  _T_580 = fifo_cmd_en[2] | fifo_valid[2]; // @[el2_dma_ctrl.scala 282:86]
  wire  _T_582 = ~fifo_reset[2]; // @[el2_dma_ctrl.scala 282:125]
  wire  _T_587 = fifo_cmd_en[3] | fifo_valid[3]; // @[el2_dma_ctrl.scala 282:86]
  wire  _T_589 = ~fifo_reset[3]; // @[el2_dma_ctrl.scala 282:125]
  wire  _T_594 = fifo_cmd_en[4] | fifo_valid[4]; // @[el2_dma_ctrl.scala 282:86]
  wire  _T_596 = ~fifo_reset[4]; // @[el2_dma_ctrl.scala 282:125]
  wire [1:0] _T_605 = fifo_error_en[0] ? fifo_error_in_0 : fifo_error_0; // @[el2_dma_ctrl.scala 284:89]
  wire [1:0] _T_609 = _T_568 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_614 = fifo_error_en[1] ? fifo_error_in_1 : fifo_error_1; // @[el2_dma_ctrl.scala 284:89]
  wire [1:0] _T_618 = _T_575 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_623 = fifo_error_en[2] ? fifo_error_in_2 : fifo_error_2; // @[el2_dma_ctrl.scala 284:89]
  wire [1:0] _T_627 = _T_582 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_632 = fifo_error_en[3] ? fifo_error_in_3 : fifo_error_3; // @[el2_dma_ctrl.scala 284:89]
  wire [1:0] _T_636 = _T_589 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_641 = fifo_error_en[4] ? fifo_error_in_4 : fifo_error_4; // @[el2_dma_ctrl.scala 284:89]
  wire [1:0] _T_645 = _T_596 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  _T_721; // @[el2_dma_ctrl.scala 288:89]
  reg  _T_714; // @[el2_dma_ctrl.scala 288:89]
  reg  _T_707; // @[el2_dma_ctrl.scala 288:89]
  reg  _T_700; // @[el2_dma_ctrl.scala 288:89]
  reg  _T_693; // @[el2_dma_ctrl.scala 288:89]
  wire [4:0] fifo_rpend = {_T_721,_T_714,_T_707,_T_700,_T_693}; // @[Cat.scala 29:58]
  wire  _T_689 = fifo_pend_en[0] | fifo_rpend[0]; // @[el2_dma_ctrl.scala 288:93]
  wire  _T_696 = fifo_pend_en[1] | fifo_rpend[1]; // @[el2_dma_ctrl.scala 288:93]
  wire  _T_703 = fifo_pend_en[2] | fifo_rpend[2]; // @[el2_dma_ctrl.scala 288:93]
  wire  _T_710 = fifo_pend_en[3] | fifo_rpend[3]; // @[el2_dma_ctrl.scala 288:93]
  wire  _T_717 = fifo_pend_en[4] | fifo_rpend[4]; // @[el2_dma_ctrl.scala 288:93]
  reg  _T_799; // @[el2_dma_ctrl.scala 292:89]
  reg  _T_792; // @[el2_dma_ctrl.scala 292:89]
  reg  _T_785; // @[el2_dma_ctrl.scala 292:89]
  reg  _T_778; // @[el2_dma_ctrl.scala 292:89]
  reg  _T_771; // @[el2_dma_ctrl.scala 292:89]
  wire [4:0] fifo_done_bus = {_T_799,_T_792,_T_785,_T_778,_T_771}; // @[Cat.scala 29:58]
  wire  _T_767 = fifo_done_bus_en[0] | fifo_done_bus[0]; // @[el2_dma_ctrl.scala 292:93]
  wire  _T_774 = fifo_done_bus_en[1] | fifo_done_bus[1]; // @[el2_dma_ctrl.scala 292:93]
  wire  _T_781 = fifo_done_bus_en[2] | fifo_done_bus[2]; // @[el2_dma_ctrl.scala 292:93]
  wire  _T_788 = fifo_done_bus_en[3] | fifo_done_bus[3]; // @[el2_dma_ctrl.scala 292:93]
  wire  _T_795 = fifo_done_bus_en[4] | fifo_done_bus[4]; // @[el2_dma_ctrl.scala 292:93]
  wire [7:0] fifo_byteen_in = _T_20[7:0]; // @[el2_dma_ctrl.scala 251:28]
  reg  _T_850; // @[Reg.scala 27:20]
  reg  _T_852; // @[Reg.scala 27:20]
  reg  _T_854; // @[Reg.scala 27:20]
  reg  _T_856; // @[Reg.scala 27:20]
  reg  _T_858; // @[Reg.scala 27:20]
  wire [4:0] fifo_write = {_T_858,_T_856,_T_854,_T_852,_T_850}; // @[Cat.scala 29:58]
  reg [63:0] fifo_data_0; // @[el2_lib.scala 514:16]
  reg [63:0] fifo_data_1; // @[el2_lib.scala 514:16]
  reg [63:0] fifo_data_2; // @[el2_lib.scala 514:16]
  reg [63:0] fifo_data_3; // @[el2_lib.scala 514:16]
  reg [63:0] fifo_data_4; // @[el2_lib.scala 514:16]
  reg  fifo_tag_0; // @[Reg.scala 27:20]
  reg  wrbuf_tag; // @[Reg.scala 27:20]
  reg  rdbuf_tag; // @[Reg.scala 27:20]
  wire  bus_cmd_tag = axi_mstr_sel ? wrbuf_tag : rdbuf_tag; // @[el2_dma_ctrl.scala 517:43]
  reg  fifo_tag_1; // @[Reg.scala 27:20]
  reg  fifo_tag_2; // @[Reg.scala 27:20]
  reg  fifo_tag_3; // @[Reg.scala 27:20]
  reg  fifo_tag_4; // @[Reg.scala 27:20]
  wire  _T_931 = WrPtr == 3'h4; // @[el2_dma_ctrl.scala 316:30]
  wire [2:0] _T_934 = WrPtr + 3'h1; // @[el2_dma_ctrl.scala 316:76]
  wire  _T_936 = RdPtr == 3'h4; // @[el2_dma_ctrl.scala 318:30]
  wire [2:0] _T_939 = RdPtr + 3'h1; // @[el2_dma_ctrl.scala 318:76]
  wire  _T_941 = RspPtr == 3'h4; // @[el2_dma_ctrl.scala 320:31]
  wire [2:0] _T_944 = RspPtr + 3'h1; // @[el2_dma_ctrl.scala 320:78]
  wire  WrPtrEn = |fifo_cmd_en; // @[el2_dma_ctrl.scala 322:30]
  wire  RdPtrEn = _T_165 | _T_197; // @[el2_dma_ctrl.scala 324:53]
  wire  RspPtrEn = io_dma_dbg_cmd_done | _T_406; // @[el2_dma_ctrl.scala 326:39]
  wire [3:0] _T_966 = {3'h0,fifo_valid[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_969 = {3'h0,fifo_valid[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_972 = {3'h0,fifo_valid[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_975 = {3'h0,fifo_valid[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_978 = {3'h0,fifo_valid[4]}; // @[Cat.scala 29:58]
  wire [3:0] _T_980 = _T_966 + _T_969; // @[el2_dma_ctrl.scala 349:102]
  wire [3:0] _T_982 = _T_980 + _T_972; // @[el2_dma_ctrl.scala 349:102]
  wire [3:0] _T_984 = _T_982 + _T_975; // @[el2_dma_ctrl.scala 349:102]
  wire [3:0] num_fifo_vld_tmp2 = _T_984 + _T_978; // @[el2_dma_ctrl.scala 349:102]
  wire  _T_1123 = |fifo_valid; // @[el2_dma_ctrl.scala 388:30]
  wire  fifo_empty = ~_T_1123; // @[el2_dma_ctrl.scala 388:17]
  wire [4:0] _T_1086 = fifo_valid >> RspPtr; // @[el2_dma_ctrl.scala 375:39]
  wire [4:0] _T_1088 = fifo_dbg >> RspPtr; // @[el2_dma_ctrl.scala 375:58]
  wire  _T_1090 = _T_1086[0] & _T_1088[0]; // @[el2_dma_ctrl.scala 375:48]
  wire [4:0] _T_1091 = fifo_done >> RspPtr; // @[el2_dma_ctrl.scala 375:78]
  wire [31:0] _GEN_44 = 3'h1 == RspPtr ? fifo_addr_1 : fifo_addr_0; // @[el2_dma_ctrl.scala 376:49]
  wire [31:0] _GEN_45 = 3'h2 == RspPtr ? fifo_addr_2 : _GEN_44; // @[el2_dma_ctrl.scala 376:49]
  wire [31:0] _GEN_46 = 3'h3 == RspPtr ? fifo_addr_3 : _GEN_45; // @[el2_dma_ctrl.scala 376:49]
  wire [31:0] _GEN_47 = 3'h4 == RspPtr ? fifo_addr_4 : _GEN_46; // @[el2_dma_ctrl.scala 376:49]
  wire [63:0] _GEN_49 = 3'h1 == RspPtr ? fifo_data_1 : fifo_data_0; // @[el2_dma_ctrl.scala 376:71]
  wire [63:0] _GEN_50 = 3'h2 == RspPtr ? fifo_data_2 : _GEN_49; // @[el2_dma_ctrl.scala 376:71]
  wire [63:0] _GEN_51 = 3'h3 == RspPtr ? fifo_data_3 : _GEN_50; // @[el2_dma_ctrl.scala 376:71]
  wire [63:0] _GEN_52 = 3'h4 == RspPtr ? fifo_data_4 : _GEN_51; // @[el2_dma_ctrl.scala 376:71]
  wire [1:0] _GEN_54 = 3'h1 == RspPtr ? fifo_error_1 : fifo_error_0; // @[el2_dma_ctrl.scala 377:47]
  wire [1:0] _GEN_55 = 3'h2 == RspPtr ? fifo_error_2 : _GEN_54; // @[el2_dma_ctrl.scala 377:47]
  wire [1:0] _GEN_56 = 3'h3 == RspPtr ? fifo_error_3 : _GEN_55; // @[el2_dma_ctrl.scala 377:47]
  wire [1:0] _GEN_57 = 3'h4 == RspPtr ? fifo_error_4 : _GEN_56; // @[el2_dma_ctrl.scala 377:47]
  wire  _T_1116 = dma_mem_addr_in_dccm | dma_mem_addr_in_pic; // @[el2_dma_ctrl.scala 383:64]
  wire [4:0] _T_1145 = fifo_rpend >> RdPtr; // @[el2_dma_ctrl.scala 401:54]
  wire  _T_1147 = ~_T_1145[0]; // @[el2_dma_ctrl.scala 401:43]
  wire  _T_1148 = _T_990[0] & _T_1147; // @[el2_dma_ctrl.scala 401:41]
  wire  _T_1152 = _T_1148 & _T_994; // @[el2_dma_ctrl.scala 401:62]
  wire  _T_1155 = ~_T_197; // @[el2_dma_ctrl.scala 401:84]
  wire  dma_mem_req = _T_1152 & _T_1155; // @[el2_dma_ctrl.scala 401:82]
  wire  _T_1117 = dma_mem_req & _T_1116; // @[el2_dma_ctrl.scala 383:40]
  reg [2:0] dma_nack_count; // @[Reg.scala 27:20]
  wire  _T_1118 = dma_nack_count >= io_dec_tlu_dma_qos_prty; // @[el2_dma_ctrl.scala 383:105]
  wire  _T_1120 = dma_mem_req & dma_mem_addr_in_iccm; // @[el2_dma_ctrl.scala 384:40]
  wire  _T_1127 = ~_T_165; // @[el2_dma_ctrl.scala 393:77]
  wire [2:0] _T_1129 = _T_1127 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_1131 = _T_1129 & dma_nack_count; // @[el2_dma_ctrl.scala 393:115]
  wire  _T_1135 = dma_mem_req & _T_1127; // @[el2_dma_ctrl.scala 393:163]
  wire [2:0] _T_1138 = dma_nack_count + 3'h1; // @[el2_dma_ctrl.scala 393:224]
  wire  _T_1164 = io_dma_mem_write & _T_1076; // @[el2_dma_ctrl.scala 407:44]
  wire [31:0] _T_1168 = {dma_mem_addr_int[31:3],1'h1,dma_mem_addr_int[1:0]}; // @[Cat.scala 29:58]
  wire  _T_1176 = io_dma_mem_write & _T_1077; // @[el2_dma_ctrl.scala 408:44]
  wire [4:0] _T_1179 = fifo_write >> RdPtr; // @[el2_dma_ctrl.scala 410:33]
  wire [63:0] _GEN_75 = 3'h1 == RdPtr ? fifo_data_1 : fifo_data_0; // @[el2_dma_ctrl.scala 411:20]
  wire [63:0] _GEN_76 = 3'h2 == RdPtr ? fifo_data_2 : _GEN_75; // @[el2_dma_ctrl.scala 411:20]
  wire [63:0] _GEN_77 = 3'h3 == RdPtr ? fifo_data_3 : _GEN_76; // @[el2_dma_ctrl.scala 411:20]
  reg  dma_dbg_cmd_done_q; // @[el2_dma_ctrl.scala 431:12]
  wire  _T_1192 = bus_cmd_valid & io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 436:44]
  wire  _T_1193 = _T_1192 | io_dbg_cmd_valid; // @[el2_dma_ctrl.scala 436:65]
  wire  bus_rsp_valid = io_dma_axi_bvalid | io_dma_axi_rvalid; // @[el2_dma_ctrl.scala 551:59]
  wire  _T_1194 = bus_cmd_valid | bus_rsp_valid; // @[el2_dma_ctrl.scala 437:44]
  wire  _T_1195 = _T_1194 | io_dbg_cmd_valid; // @[el2_dma_ctrl.scala 437:60]
  wire  _T_1196 = _T_1195 | io_dma_dbg_cmd_done; // @[el2_dma_ctrl.scala 437:79]
  wire  _T_1197 = _T_1196 | dma_dbg_cmd_done_q; // @[el2_dma_ctrl.scala 437:101]
  wire  _T_1199 = _T_1197 | _T_1123; // @[el2_dma_ctrl.scala 437:122]
  wire  wrbuf_en = io_dma_axi_awvalid & io_dma_axi_awready; // @[el2_dma_ctrl.scala 459:46]
  wire  wrbuf_data_en = io_dma_axi_wvalid & io_dma_axi_wready; // @[el2_dma_ctrl.scala 460:45]
  wire  wrbuf_cmd_sent = axi_mstr_prty_en & axi_mstr_sel; // @[el2_dma_ctrl.scala 461:40]
  wire  _T_1201 = ~wrbuf_en; // @[el2_dma_ctrl.scala 462:51]
  wire  wrbuf_rst = wrbuf_cmd_sent & _T_1201; // @[el2_dma_ctrl.scala 462:49]
  wire  _T_1203 = ~wrbuf_data_en; // @[el2_dma_ctrl.scala 463:51]
  wire  wrbuf_data_rst = wrbuf_cmd_sent & _T_1203; // @[el2_dma_ctrl.scala 463:49]
  wire  _T_1204 = wrbuf_en | wrbuf_vld; // @[el2_dma_ctrl.scala 465:63]
  wire  _T_1205 = ~wrbuf_rst; // @[el2_dma_ctrl.scala 465:92]
  wire  _T_1208 = wrbuf_data_en | wrbuf_data_vld; // @[el2_dma_ctrl.scala 467:63]
  wire  _T_1209 = ~wrbuf_data_rst; // @[el2_dma_ctrl.scala 467:102]
  wire  rdbuf_en = io_dma_axi_arvalid & io_dma_axi_arready; // @[el2_dma_ctrl.scala 487:58]
  wire  _T_1214 = ~axi_mstr_sel; // @[el2_dma_ctrl.scala 488:44]
  wire  rdbuf_cmd_sent = axi_mstr_prty_en & _T_1214; // @[el2_dma_ctrl.scala 488:42]
  wire  _T_1216 = ~rdbuf_en; // @[el2_dma_ctrl.scala 489:63]
  wire  rdbuf_rst = rdbuf_cmd_sent & _T_1216; // @[el2_dma_ctrl.scala 489:61]
  wire  _T_1217 = rdbuf_en | rdbuf_vld; // @[el2_dma_ctrl.scala 491:51]
  wire  _T_1218 = ~rdbuf_rst; // @[el2_dma_ctrl.scala 491:80]
  wire  _T_1222 = ~wrbuf_cmd_sent; // @[el2_dma_ctrl.scala 503:44]
  wire  _T_1223 = wrbuf_vld & _T_1222; // @[el2_dma_ctrl.scala 503:42]
  wire  _T_1226 = wrbuf_data_vld & _T_1222; // @[el2_dma_ctrl.scala 504:47]
  wire  _T_1228 = ~rdbuf_cmd_sent; // @[el2_dma_ctrl.scala 505:44]
  wire  _T_1229 = rdbuf_vld & _T_1228; // @[el2_dma_ctrl.scala 505:42]
  wire  axi_mstr_prty_in = ~axi_mstr_priority; // @[el2_dma_ctrl.scala 524:27]
  wire  _T_1251 = ~_T_1088[0]; // @[el2_dma_ctrl.scala 531:50]
  wire  _T_1252 = _T_1086[0] & _T_1251; // @[el2_dma_ctrl.scala 531:48]
  wire [4:0] _T_1253 = fifo_done_bus >> RspPtr; // @[el2_dma_ctrl.scala 531:83]
  wire  axi_rsp_valid = _T_1252 & _T_1253[0]; // @[el2_dma_ctrl.scala 531:68]
  wire [4:0] _T_1255 = fifo_write >> RspPtr; // @[el2_dma_ctrl.scala 533:39]
  wire  axi_rsp_write = _T_1255[0]; // @[el2_dma_ctrl.scala 533:39]
  wire [1:0] _T_1258 = _GEN_57[1] ? 2'h3 : 2'h0; // @[el2_dma_ctrl.scala 534:64]
  wire  _GEN_86 = 3'h1 == RspPtr ? fifo_tag_1 : fifo_tag_0; // @[el2_dma_ctrl.scala 542:33]
  wire  _GEN_87 = 3'h2 == RspPtr ? fifo_tag_2 : _GEN_86; // @[el2_dma_ctrl.scala 542:33]
  wire  _GEN_88 = 3'h3 == RspPtr ? fifo_tag_3 : _GEN_87; // @[el2_dma_ctrl.scala 542:33]
  wire  _T_1261 = ~axi_rsp_write; // @[el2_dma_ctrl.scala 544:46]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr dma_buffer_c1cgc ( // @[el2_dma_ctrl.scala 439:32]
    .io_l1clk(dma_buffer_c1cgc_io_l1clk),
    .io_clk(dma_buffer_c1cgc_io_clk),
    .io_en(dma_buffer_c1cgc_io_en),
    .io_scan_mode(dma_buffer_c1cgc_io_scan_mode)
  );
  rvclkhdr dma_free_cgc ( // @[el2_dma_ctrl.scala 445:28]
    .io_l1clk(dma_free_cgc_io_l1clk),
    .io_clk(dma_free_cgc_io_clk),
    .io_en(dma_free_cgc_io_en),
    .io_scan_mode(dma_free_cgc_io_scan_mode)
  );
  rvclkhdr dma_bus_cgc ( // @[el2_dma_ctrl.scala 451:27]
    .io_l1clk(dma_bus_cgc_io_l1clk),
    .io_clk(dma_bus_cgc_io_clk),
    .io_en(dma_bus_cgc_io_en),
    .io_scan_mode(dma_bus_cgc_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  rvclkhdr rvclkhdr_12 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_12_io_l1clk),
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en),
    .io_scan_mode(rvclkhdr_12_io_scan_mode)
  );
  assign io_dma_dbg_ready = fifo_empty & dbg_dma_bubble_bus; // @[el2_dma_ctrl.scala 374:25]
  assign io_dma_dbg_cmd_done = _T_1090 & _T_1091[0]; // @[el2_dma_ctrl.scala 375:25]
  assign io_dma_dbg_cmd_fail = |_GEN_57; // @[el2_dma_ctrl.scala 377:25]
  assign io_dma_dbg_rddata = _GEN_47[2] ? _GEN_52[63:32] : _GEN_52[31:0]; // @[el2_dma_ctrl.scala 376:25]
  assign io_dma_dccm_req = _T_1117 & io_dccm_ready; // @[el2_dma_ctrl.scala 402:20]
  assign io_dma_iccm_req = _T_1120 & io_iccm_ready; // @[el2_dma_ctrl.scala 403:20]
  assign io_dma_mem_tag = RdPtr; // @[el2_dma_ctrl.scala 404:20]
  assign io_dma_mem_addr = _T_1164 ? _T_1168 : dma_mem_addr_int; // @[el2_dma_ctrl.scala 407:20]
  assign io_dma_mem_sz = _T_1176 ? 3'h2 : dma_mem_sz_int; // @[el2_dma_ctrl.scala 408:20]
  assign io_dma_mem_write = _T_1179[0]; // @[el2_dma_ctrl.scala 410:20]
  assign io_dma_mem_wdata = 3'h4 == RdPtr ? fifo_data_4 : _GEN_77; // @[el2_dma_ctrl.scala 411:20]
  assign io_dma_dccm_stall_any = _T_1117 & _T_1118; // @[el2_dma_ctrl.scala 383:25]
  assign io_dma_iccm_stall_any = _T_1120 & _T_1118; // @[el2_dma_ctrl.scala 384:25]
  assign io_dma_pmu_dccm_read = io_dma_dccm_req & _T_166; // @[el2_dma_ctrl.scala 415:26]
  assign io_dma_pmu_dccm_write = io_dma_dccm_req & io_dma_mem_write; // @[el2_dma_ctrl.scala 416:26]
  assign io_dma_pmu_any_read = _T_165 & _T_166; // @[el2_dma_ctrl.scala 417:26]
  assign io_dma_pmu_any_write = _T_165 & io_dma_mem_write; // @[el2_dma_ctrl.scala 418:26]
  assign io_dma_axi_awready = ~_T_1223; // @[el2_dma_ctrl.scala 503:27]
  assign io_dma_axi_wready = ~_T_1226; // @[el2_dma_ctrl.scala 504:27]
  assign io_dma_axi_bvalid = axi_rsp_valid & axi_rsp_write; // @[el2_dma_ctrl.scala 540:27]
  assign io_dma_axi_bresp = _GEN_57[0] ? 2'h2 : _T_1258; // @[el2_dma_ctrl.scala 541:33]
  assign io_dma_axi_bid = 3'h4 == RspPtr ? fifo_tag_4 : _GEN_88; // @[el2_dma_ctrl.scala 542:33]
  assign io_dma_axi_arready = ~_T_1229; // @[el2_dma_ctrl.scala 505:27]
  assign io_dma_axi_rvalid = axi_rsp_valid & _T_1261; // @[el2_dma_ctrl.scala 544:27]
  assign io_dma_axi_rid = 3'h4 == RspPtr ? fifo_tag_4 : _GEN_88; // @[el2_dma_ctrl.scala 548:37]
  assign io_dma_axi_rdata = 3'h4 == RspPtr ? fifo_data_4 : _GEN_51; // @[el2_dma_ctrl.scala 546:35]
  assign io_dma_axi_rresp = _GEN_57[0] ? 2'h2 : _T_1258; // @[el2_dma_ctrl.scala 545:33]
  assign io_dma_axi_rlast = 1'h1; // @[el2_dma_ctrl.scala 547:33]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = fifo_cmd_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = fifo_cmd_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = fifo_cmd_en[2]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = fifo_cmd_en[3]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = fifo_cmd_en[4]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = fifo_data_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = fifo_data_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = fifo_data_en[2]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_8_io_en = fifo_data_en[3]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_9_io_en = fifo_data_en[4]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign dma_buffer_c1cgc_io_clk = clock; // @[el2_dma_ctrl.scala 442:33]
  assign dma_buffer_c1cgc_io_en = _T_1193 | io_clk_override; // @[el2_dma_ctrl.scala 440:33]
  assign dma_buffer_c1cgc_io_scan_mode = io_scan_mode; // @[el2_dma_ctrl.scala 441:33]
  assign dma_free_cgc_io_clk = clock; // @[el2_dma_ctrl.scala 448:29]
  assign dma_free_cgc_io_en = _T_1199 | io_clk_override; // @[el2_dma_ctrl.scala 446:29]
  assign dma_free_cgc_io_scan_mode = io_scan_mode; // @[el2_dma_ctrl.scala 447:29]
  assign dma_bus_cgc_io_clk = clock; // @[el2_dma_ctrl.scala 454:28]
  assign dma_bus_cgc_io_en = io_dma_bus_clk_en; // @[el2_dma_ctrl.scala 452:28]
  assign dma_bus_cgc_io_scan_mode = io_scan_mode; // @[el2_dma_ctrl.scala 453:28]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_10_io_en = wrbuf_en & io_dma_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = wrbuf_data_en & io_dma_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = rdbuf_en & io_dma_bus_clk_en; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
    end else if (io_dbg_cmd_valid) begin
      fifo_addr_4 <= io_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_4 <= wrbuf_addr;
    end else begin
      fifo_addr_4 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_3 <= 32'h0;
    end else if (io_dbg_cmd_valid) begin
      fifo_addr_3 <= io_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_3 <= wrbuf_addr;
    end else begin
      fifo_addr_3 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_2 <= 32'h0;
    end else if (io_dbg_cmd_valid) begin
      fifo_addr_2 <= io_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_2 <= wrbuf_addr;
    end else begin
      fifo_addr_2 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_1 <= 32'h0;
    end else if (io_dbg_cmd_valid) begin
      fifo_addr_1 <= io_dbg_cmd_addr;
    end else if (axi_mstr_sel) begin
      fifo_addr_1 <= wrbuf_addr;
    end else begin
      fifo_addr_1 <= rdbuf_addr;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      fifo_addr_0 <= 32'h0;
    end else if (io_dbg_cmd_valid) begin
      fifo_addr_0 <= io_dbg_cmd_addr;
    end else begin
      fifo_addr_0 <= bus_cmd_addr;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_vld <= 1'h0;
    end else begin
      wrbuf_vld <= _T_1204 & _T_1205;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_data_vld <= 1'h0;
    end else begin
      wrbuf_data_vld <= _T_1208 & _T_1209;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      rdbuf_vld <= 1'h0;
    end else begin
      rdbuf_vld <= _T_1217 & _T_1218;
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
      wrbuf_addr <= io_dma_axi_awaddr;
    end
  end
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      rdbuf_addr <= 32'h0;
    end else begin
      rdbuf_addr <= io_dma_axi_araddr;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_byteen <= 8'h0;
    end else if (wrbuf_data_en) begin
      wrbuf_byteen <= io_dma_axi_wstrb;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      wrbuf_sz <= 3'h0;
    end else if (wrbuf_en) begin
      wrbuf_sz <= io_dma_axi_awsize;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      rdbuf_sz <= 3'h0;
    end else if (rdbuf_en) begin
      rdbuf_sz <= io_dma_axi_arsize;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      fifo_full <= 1'h0;
    end else begin
      fifo_full <= num_fifo_vld_tmp2 >= 4'h5;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      dbg_dma_bubble_bus <= 1'h0;
    end else begin
      dbg_dma_bubble_bus <= io_dbg_dma_bubble;
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
      _T_886 <= io_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_884 <= 1'h0;
    end else if (fifo_cmd_en[3]) begin
      _T_884 <= io_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_882 <= 1'h0;
    end else if (fifo_cmd_en[2]) begin
      _T_882 <= io_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_880 <= 1'h0;
    end else if (fifo_cmd_en[1]) begin
      _T_880 <= io_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_878 <= 1'h0;
    end else if (fifo_cmd_en[0]) begin
      _T_878 <= io_dbg_cmd_valid;
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      fifo_sz_4 <= 3'h0;
    end else if (fifo_cmd_en[4]) begin
      if (io_dbg_cmd_valid) begin
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
      if (io_dbg_cmd_valid) begin
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
      if (io_dbg_cmd_valid) begin
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
      if (io_dbg_cmd_valid) begin
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
      wrbuf_data <= io_dma_axi_wdata;
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
      if (io_dbg_cmd_valid) begin
        _T_850 <= io_dbg_cmd_write;
      end else if (_T_1241) begin
        _T_850 <= axi_mstr_priority;
      end else begin
        _T_850 <= _T_1240;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_852 <= 1'h0;
    end else if (fifo_cmd_en[1]) begin
      if (io_dbg_cmd_valid) begin
        _T_852 <= io_dbg_cmd_write;
      end else if (_T_1241) begin
        _T_852 <= axi_mstr_priority;
      end else begin
        _T_852 <= _T_1240;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_854 <= 1'h0;
    end else if (fifo_cmd_en[2]) begin
      if (io_dbg_cmd_valid) begin
        _T_854 <= io_dbg_cmd_write;
      end else if (_T_1241) begin
        _T_854 <= axi_mstr_priority;
      end else begin
        _T_854 <= _T_1240;
      end
    end
  end
  always @(posedge dma_buffer_c1_clk or posedge reset) begin
    if (reset) begin
      _T_856 <= 1'h0;
    end else if (fifo_cmd_en[3]) begin
      if (io_dbg_cmd_valid) begin
        _T_856 <= io_dbg_cmd_write;
      end else if (_T_1241) begin
        _T_856 <= axi_mstr_priority;
      end else begin
        _T_856 <= _T_1240;
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
      fifo_data_0 <= io_dccm_dma_rdata;
    end else if (_T_87) begin
      fifo_data_0 <= io_iccm_dma_rdata;
    end else if (io_dbg_cmd_valid) begin
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
      fifo_data_1 <= io_dccm_dma_rdata;
    end else if (_T_105) begin
      fifo_data_1 <= io_iccm_dma_rdata;
    end else if (io_dbg_cmd_valid) begin
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
      fifo_data_2 <= io_dccm_dma_rdata;
    end else if (_T_123) begin
      fifo_data_2 <= io_iccm_dma_rdata;
    end else if (io_dbg_cmd_valid) begin
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
      fifo_data_3 <= io_dccm_dma_rdata;
    end else if (_T_141) begin
      fifo_data_3 <= io_iccm_dma_rdata;
    end else if (io_dbg_cmd_valid) begin
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
      fifo_data_4 <= io_dccm_dma_rdata;
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
      wrbuf_tag <= io_dma_axi_awid;
    end
  end
  always @(posedge dma_bus_clk or posedge reset) begin
    if (reset) begin
      rdbuf_tag <= 1'h0;
    end else if (rdbuf_en) begin
      rdbuf_tag <= io_dma_axi_arid;
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
      if (_T_1118) begin
        dma_nack_count <= _T_1131;
      end else if (_T_1135) begin
        dma_nack_count <= _T_1138;
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
