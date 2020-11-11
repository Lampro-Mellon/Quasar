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
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 474:26]
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
module rvclkhdr_2(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 474:26]
  wire  clkhdr_CK; // @[el2_lib.scala 474:26]
  wire  clkhdr_EN; // @[el2_lib.scala 474:26]
  wire  clkhdr_SE; // @[el2_lib.scala 474:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 474:26]
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
module el2_dbg(
  input         clock,
  input         reset,
  output [31:0] io_dbg_cmd_addr,
  output [31:0] io_dbg_cmd_wrdata,
  output        io_dbg_cmd_valid,
  output        io_dbg_cmd_write,
  output [1:0]  io_dbg_cmd_type,
  output [1:0]  io_dbg_cmd_size,
  output        io_dbg_core_rst_l,
  input  [31:0] io_core_dbg_rddata,
  input         io_core_dbg_cmd_done,
  input         io_core_dbg_cmd_fail,
  output        io_dbg_dma_bubble,
  input         io_dma_dbg_ready,
  output        io_dbg_halt_req,
  output        io_dbg_resume_req,
  input         io_dec_tlu_debug_mode,
  input         io_dec_tlu_dbg_halted,
  input         io_dec_tlu_mpc_halted_only,
  input         io_dec_tlu_resume_ack,
  input         io_dmi_reg_en,
  input  [6:0]  io_dmi_reg_addr,
  input         io_dmi_reg_wr_en,
  input  [31:0] io_dmi_reg_wdata,
  output [31:0] io_dmi_reg_rdata,
  output        io_sb_axi_awvalid,
  input         io_sb_axi_awready,
  output        io_sb_axi_awid,
  output [31:0] io_sb_axi_awaddr,
  output [3:0]  io_sb_axi_awregion,
  output [7:0]  io_sb_axi_awlen,
  output [2:0]  io_sb_axi_awsize,
  output [1:0]  io_sb_axi_awburst,
  output        io_sb_axi_awlock,
  output [3:0]  io_sb_axi_awcache,
  output [2:0]  io_sb_axi_awprot,
  output [3:0]  io_sb_axi_awqos,
  output        io_sb_axi_wvalid,
  input         io_sb_axi_wready,
  output [63:0] io_sb_axi_wdata,
  output [7:0]  io_sb_axi_wstrb,
  output        io_sb_axi_wlast,
  input         io_sb_axi_bvalid,
  output        io_sb_axi_bready,
  input  [1:0]  io_sb_axi_bresp,
  output        io_sb_axi_arvalid,
  input         io_sb_axi_arready,
  output        io_sb_axi_arid,
  output [31:0] io_sb_axi_araddr,
  output [3:0]  io_sb_axi_arregion,
  output [7:0]  io_sb_axi_arlen,
  output [2:0]  io_sb_axi_arsize,
  output [1:0]  io_sb_axi_arburst,
  output        io_sb_axi_arlock,
  output [3:0]  io_sb_axi_arcache,
  output [2:0]  io_sb_axi_arprot,
  output [3:0]  io_sb_axi_arqos,
  input         io_sb_axi_rvalid,
  output        io_sb_axi_rready,
  input  [63:0] io_sb_axi_rdata,
  input  [1:0]  io_sb_axi_rresp,
  input         io_dbg_bus_clk_en,
  input         io_dbg_rst_l,
  input         io_clk_override,
  input         io_scan_mode
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 483:22]
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
  reg [2:0] dbg_state; // @[Reg.scala 27:20]
  wire  _T = dbg_state != 3'h0; // @[el2_dbg.scala 126:51]
  wire  _T_1 = io_dmi_reg_en | _T; // @[el2_dbg.scala 126:38]
  wire  _T_309 = 3'h0 == dbg_state; // @[Conditional.scala 37:30]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [31:0] temp = {dm_temp[3:2],1'h0,dm_temp[1],26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire  _T_314 = ~io_dec_tlu_debug_mode; // @[el2_dbg.scala 297:45]
  wire  _T_315 = temp[31] & _T_314; // @[el2_dbg.scala 297:43]
  reg  dmstatus_havereset; // @[Reg.scala 27:20]
  wire [1:0] _T_150 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  dmstatus_resumeack; // @[Reg.scala 27:20]
  wire [1:0] _T_152 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_183 = ~reset; // @[el2_dbg.scala 222:43]
  wire  dmstatus_unavail = temp[1] | _T_183; // @[el2_dbg.scala 222:41]
  wire [1:0] _T_154 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  dmstatus_halted; // @[el2_dbg.scala 229:12]
  wire  _T_186 = dmstatus_unavail | dmstatus_halted; // @[el2_dbg.scala 223:42]
  wire  dmstatus_running = ~_T_186; // @[el2_dbg.scala 223:23]
  wire [1:0] _T_156 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_158 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [31:0] dmstatus_reg = {12'h0,_T_150,_T_152,2'h0,_T_154,_T_156,_T_158,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire  _T_317 = _T_315 | dmstatus_reg[9]; // @[el2_dbg.scala 297:69]
  wire  _T_318 = _T_317 | io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 297:87]
  wire  _T_320 = ~temp[1]; // @[el2_dbg.scala 297:119]
  wire  _T_321 = _T_318 & _T_320; // @[el2_dbg.scala 297:117]
  wire  _T_327 = 3'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_332 = dmstatus_reg[9] | temp[1]; // @[el2_dbg.scala 302:39]
  wire  _T_339 = 3'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_354 = dmstatus_reg[9] & temp[30]; // @[el2_dbg.scala 309:39]
  wire  _T_356 = ~temp[31]; // @[el2_dbg.scala 309:61]
  wire  _T_357 = _T_354 & _T_356; // @[el2_dbg.scala 309:59]
  reg  dmcontrol_wren_Q; // @[el2_dbg.scala 212:12]
  wire  _T_358 = _T_357 & dmcontrol_wren_Q; // @[el2_dbg.scala 309:80]
  wire  _T_275 = io_dmi_reg_addr == 7'h17; // @[el2_dbg.scala 266:39]
  wire  _T_276 = _T_275 & io_dmi_reg_en; // @[el2_dbg.scala 266:52]
  wire  _T_277 = _T_276 & io_dmi_reg_wr_en; // @[el2_dbg.scala 266:68]
  wire  _T_278 = dbg_state == 3'h2; // @[el2_dbg.scala 266:100]
  wire  command_wren = _T_277 & _T_278; // @[el2_dbg.scala 266:87]
  wire  _T_359 = _T_358 | command_wren; // @[el2_dbg.scala 309:99]
  wire  _T_361 = _T_359 | temp[1]; // @[el2_dbg.scala 309:114]
  wire  _T_363 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 310:46]
  wire  _T_364 = ~_T_363; // @[el2_dbg.scala 310:28]
  wire  _T_365 = _T_361 | _T_364; // @[el2_dbg.scala 310:26]
  wire  _T_377 = 3'h3 == dbg_state; // @[Conditional.scala 37:30]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[el2_dbg.scala 261:12]
  wire [31:0] abstractcs_reg = {19'h0,abs_temp_12,1'h0,abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire  _T_384 = |abstractcs_reg[10:8]; // @[el2_dbg.scala 318:64]
  wire  _T_385 = io_dbg_cmd_valid | _T_384; // @[el2_dbg.scala 318:40]
  wire  _T_387 = _T_385 | temp[1]; // @[el2_dbg.scala 318:68]
  wire  _T_394 = 3'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_398 = io_core_dbg_cmd_done | temp[1]; // @[el2_dbg.scala 323:44]
  wire  _T_405 = 3'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_414 = 3'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_417 = dmstatus_reg[17] | temp[1]; // @[el2_dbg.scala 335:40]
  wire  _GEN_13 = _T_414 & _T_417; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_405 | _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_394 ? _T_398 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_377 ? _T_387 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_339 ? _T_365 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_327 ? _T_332 : _GEN_31; // @[Conditional.scala 39:67]
  wire  dbg_state_en = _T_309 ? _T_321 : _GEN_37; // @[Conditional.scala 40:58]
  wire  _T_2 = _T_1 | dbg_state_en; // @[el2_dbg.scala 126:69]
  wire  _T_3 = _T_2 | io_dec_tlu_dbg_halted; // @[el2_dbg.scala 126:84]
  reg [3:0] sb_state; // @[Reg.scala 27:20]
  wire  sbcs_sbbusy_din = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_130 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[el2_dbg.scala 196:40]
  wire  _T_131 = io_dmi_reg_addr == 7'h3c; // @[el2_dbg.scala 196:78]
  wire  sbdata0wr_access = _T_130 & _T_131; // @[el2_dbg.scala 196:59]
  wire  _T_125 = ~io_dmi_reg_wr_en; // @[el2_dbg.scala 195:45]
  wire  _T_126 = io_dmi_reg_en & _T_125; // @[el2_dbg.scala 195:43]
  wire  _T_128 = _T_126 & _T_131; // @[el2_dbg.scala 195:63]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire [31:0] sbcs_reg = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20,temp_sbcs_19_15,temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire  sbreadondata_access = _T_128 & sbcs_reg[15]; // @[el2_dbg.scala 195:95]
  wire  _T_516 = sbdata0wr_access | sbreadondata_access; // @[el2_dbg.scala 374:39]
  wire  _T_122 = io_dmi_reg_addr == 7'h39; // @[el2_dbg.scala 194:81]
  wire  _T_123 = _T_130 & _T_122; // @[el2_dbg.scala 194:62]
  wire  sbreadonaddr_access = _T_123 & sbcs_reg[20]; // @[el2_dbg.scala 194:94]
  wire  _T_517 = _T_516 | sbreadonaddr_access; // @[el2_dbg.scala 374:61]
  wire  _T_525 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_46 = sbcs_reg[19:17] == 3'h1; // @[el2_dbg.scala 158:42]
  reg [31:0] sbaddress0_reg; // @[el2_lib.scala 514:16]
  wire  _T_48 = _T_46 & sbaddress0_reg[0]; // @[el2_dbg.scala 158:56]
  wire  _T_50 = sbcs_reg[19:17] == 3'h2; // @[el2_dbg.scala 159:23]
  wire  _T_52 = |sbaddress0_reg[1:0]; // @[el2_dbg.scala 159:60]
  wire  _T_53 = _T_50 & _T_52; // @[el2_dbg.scala 159:37]
  wire  _T_54 = _T_48 | _T_53; // @[el2_dbg.scala 158:76]
  wire  _T_56 = sbcs_reg[19:17] == 3'h3; // @[el2_dbg.scala 160:23]
  wire  _T_58 = |sbaddress0_reg[2:0]; // @[el2_dbg.scala 160:60]
  wire  _T_59 = _T_56 & _T_58; // @[el2_dbg.scala 160:37]
  wire  sbcs_unaligned = _T_54 | _T_59; // @[el2_dbg.scala 159:64]
  wire  _T_528 = io_dbg_bus_clk_en | sbcs_unaligned; // @[el2_dbg.scala 382:40]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[el2_dbg.scala 162:35]
  wire  _T_529 = _T_528 | sbcs_illegal_size; // @[el2_dbg.scala 382:57]
  wire  _T_532 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_539 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_cmd_read = io_sb_axi_arvalid & io_sb_axi_arready; // @[el2_dbg.scala 432:40]
  wire  _T_540 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[el2_dbg.scala 394:38]
  wire  _T_541 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_cmd_write_addr = io_sb_axi_awvalid & io_sb_axi_awready; // @[el2_dbg.scala 433:46]
  wire  sb_bus_cmd_write_data = io_sb_axi_wvalid & io_sb_axi_wready; // @[el2_dbg.scala 434:45]
  wire  _T_545 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[el2_dbg.scala 398:45]
  wire  _T_546 = _T_545 & io_dbg_bus_clk_en; // @[el2_dbg.scala 398:70]
  wire  _T_547 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_548 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[el2_dbg.scala 402:44]
  wire  _T_549 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_550 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[el2_dbg.scala 406:44]
  wire  _T_551 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_rsp_read = io_sb_axi_rvalid & io_sb_axi_rready; // @[el2_dbg.scala 435:39]
  wire  _T_552 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[el2_dbg.scala 410:38]
  wire  _T_554 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_rsp_write = io_sb_axi_bvalid & io_sb_axi_bready; // @[el2_dbg.scala 436:40]
  wire  _T_555 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[el2_dbg.scala 416:39]
  wire  _T_557 = 4'h9 == sb_state; // @[Conditional.scala 37:30]
  wire  _GEN_55 = _T_554 ? _T_555 : _T_557; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_551 ? _T_552 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_549 ? _T_550 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_547 ? _T_548 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_541 ? _T_546 : _GEN_76; // @[Conditional.scala 39:67]
  wire  _GEN_90 = _T_539 ? _T_540 : _GEN_83; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_532 ? _T_529 : _GEN_90; // @[Conditional.scala 39:67]
  wire  _GEN_104 = _T_525 ? _T_529 : _GEN_97; // @[Conditional.scala 39:67]
  wire  sb_state_en = sbcs_sbbusy_din ? _T_517 : _GEN_104; // @[Conditional.scala 40:58]
  wire  _T_4 = io_dmi_reg_en | sb_state_en; // @[el2_dbg.scala 127:37]
  wire  _T_5 = sb_state != 4'h0; // @[el2_dbg.scala 127:63]
  wire  _T_6 = _T_4 | _T_5; // @[el2_dbg.scala 127:51]
  wire  _T_9 = temp[0] | io_scan_mode; // @[el2_dbg.scala 130:64]
  wire  dbg_dm_rst_l = io_dbg_rst_l & _T_9; // @[el2_dbg.scala 130:44]
  wire  _T_13 = io_dmi_reg_addr == 7'h38; // @[el2_dbg.scala 132:36]
  wire  _T_14 = _T_13 & io_dmi_reg_en; // @[el2_dbg.scala 132:49]
  wire  _T_15 = _T_14 & io_dmi_reg_wr_en; // @[el2_dbg.scala 132:65]
  wire  _T_16 = sb_state == 4'h0; // @[el2_dbg.scala 132:96]
  wire  sbcs_wren = _T_15 & _T_16; // @[el2_dbg.scala 132:84]
  wire  _T_18 = sbcs_wren & io_dmi_reg_wdata[22]; // @[el2_dbg.scala 133:42]
  wire  _T_20 = _T_5 & io_dmi_reg_en; // @[el2_dbg.scala 133:102]
  wire  _T_23 = _T_122 | _T_131; // @[el2_dbg.scala 134:36]
  wire  _T_24 = io_dmi_reg_addr == 7'h3d; // @[el2_dbg.scala 134:87]
  wire  _T_25 = _T_23 | _T_24; // @[el2_dbg.scala 134:68]
  wire  _T_26 = _T_20 & _T_25; // @[el2_dbg.scala 133:118]
  wire  sbcs_sbbusyerror_wren = _T_18 | _T_26; // @[el2_dbg.scala 133:66]
  wire  sbcs_sbbusyerror_din = ~_T_18; // @[el2_dbg.scala 136:31]
  wire  _T_29 = ~dbg_dm_rst_l; // @[el2_dbg.scala 137:53]
  wire  _GEN_58 = _T_554 ? 1'h0 : _T_557; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_551 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_549 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_547 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_541 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_539 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_100 = _T_532 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_525 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67]
  wire  sbcs_sbbusy_wren = sbcs_sbbusy_din ? sb_state_en : _GEN_107; // @[Conditional.scala 40:58]
  wire  _T_522 = io_dmi_reg_wdata[14:12] == 3'h0; // @[el2_dbg.scala 378:27]
  wire [2:0] _GEN_118 = {{2'd0}, _T_522}; // @[el2_dbg.scala 378:53]
  wire [2:0] _T_524 = _GEN_118 & sbcs_reg[14:12]; // @[el2_dbg.scala 378:53]
  wire  _T_519 = |io_dmi_reg_wdata[14:12]; // @[el2_dbg.scala 377:65]
  wire  _T_520 = sbcs_wren & _T_519; // @[el2_dbg.scala 377:38]
  wire  _T_530 = sbcs_unaligned | sbcs_illegal_size; // @[el2_dbg.scala 383:43]
  wire  _T_567 = |io_sb_axi_rresp; // @[el2_dbg.scala 437:63]
  wire  _T_568 = sb_bus_rsp_read & _T_567; // @[el2_dbg.scala 437:39]
  wire  _T_570 = |io_sb_axi_bresp; // @[el2_dbg.scala 437:110]
  wire  _T_571 = sb_bus_rsp_write & _T_570; // @[el2_dbg.scala 437:86]
  wire  sb_bus_rsp_error = _T_568 | _T_571; // @[el2_dbg.scala 437:67]
  wire  _T_553 = sb_state_en & sb_bus_rsp_error; // @[el2_dbg.scala 411:40]
  wire  _GEN_56 = _T_554 & _T_553; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_551 ? _T_553 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_549 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_547 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_541 ? 1'h0 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_539 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_532 ? _T_530 : _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_105 = _T_525 ? _T_530 : _GEN_98; // @[Conditional.scala 39:67]
  wire  sbcs_sberror_wren = sbcs_sbbusy_din ? _T_520 : _GEN_105; // @[Conditional.scala 40:58]
  wire  _T_61 = sbcs_reg[19:17] == 3'h0; // @[el2_dbg.scala 163:51]
  wire [3:0] _T_63 = _T_61 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_64 = _T_63 & 4'h1; // @[el2_dbg.scala 163:64]
  wire [3:0] _T_68 = _T_46 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_69 = _T_68 & 4'h2; // @[el2_dbg.scala 163:117]
  wire [3:0] _T_70 = _T_64 | _T_69; // @[el2_dbg.scala 163:76]
  wire [3:0] _T_74 = _T_50 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_75 = _T_74 & 4'h4; // @[el2_dbg.scala 164:44]
  wire [3:0] _T_76 = _T_70 | _T_75; // @[el2_dbg.scala 163:129]
  wire [3:0] _T_80 = _T_56 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_81 = _T_80 & 4'h8; // @[el2_dbg.scala 164:97]
  wire [3:0] sbaddress0_incr = _T_76 | _T_81; // @[el2_dbg.scala 164:56]
  wire  _T_84 = sb_state == 4'h7; // @[el2_dbg.scala 167:37]
  wire  _T_85 = _T_84 & sb_state_en; // @[el2_dbg.scala 167:60]
  wire  _T_86 = ~sbcs_sberror_wren; // @[el2_dbg.scala 167:76]
  wire  sbdata0_reg_wren1 = _T_85 & _T_86; // @[el2_dbg.scala 167:74]
  wire  sbdata1_reg_wren0 = _T_130 & _T_24; // @[el2_dbg.scala 169:60]
  wire [31:0] _T_93 = sbdata0wr_access ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_94 = _T_93 & io_dmi_reg_wdata; // @[el2_dbg.scala 172:49]
  wire [31:0] _T_96 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_656 = _T_61 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _GEN_119 = {{1'd0}, sbaddress0_reg[2:0]}; // @[el2_dbg.scala 472:93]
  wire [6:0] _T_659 = 4'h8 * _GEN_119; // @[el2_dbg.scala 472:93]
  wire [63:0] _T_660 = io_sb_axi_rdata >> _T_659; // @[el2_dbg.scala 472:86]
  wire [63:0] _T_661 = _T_660 & 64'hff; // @[el2_dbg.scala 472:117]
  wire [63:0] _T_662 = _T_656 & _T_661; // @[el2_dbg.scala 472:59]
  wire [63:0] _T_666 = _T_46 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _GEN_120 = {{3'd0}, sbaddress0_reg[2:1]}; // @[el2_dbg.scala 473:80]
  wire [6:0] _T_669 = 5'h10 * _GEN_120; // @[el2_dbg.scala 473:80]
  wire [63:0] _T_670 = io_sb_axi_rdata >> _T_669; // @[el2_dbg.scala 473:72]
  wire [63:0] _T_671 = _T_670 & 64'hffff; // @[el2_dbg.scala 473:104]
  wire [63:0] _T_672 = _T_666 & _T_671; // @[el2_dbg.scala 473:45]
  wire [63:0] _T_673 = _T_662 | _T_672; // @[el2_dbg.scala 472:134]
  wire [63:0] _T_677 = _T_50 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _GEN_121 = {{5'd0}, sbaddress0_reg[2]}; // @[el2_dbg.scala 474:80]
  wire [6:0] _T_680 = 6'h20 * _GEN_121; // @[el2_dbg.scala 474:80]
  wire [63:0] _T_681 = io_sb_axi_rdata >> _T_680; // @[el2_dbg.scala 474:72]
  wire [63:0] _T_682 = _T_681 & 64'hffffffff; // @[el2_dbg.scala 474:101]
  wire [63:0] _T_683 = _T_677 & _T_682; // @[el2_dbg.scala 474:45]
  wire [63:0] _T_684 = _T_673 | _T_683; // @[el2_dbg.scala 473:123]
  wire [63:0] _T_688 = _T_56 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_690 = _T_688 & io_sb_axi_rdata; // @[el2_dbg.scala 475:45]
  wire [63:0] sb_bus_rdata = _T_684 | _T_690; // @[el2_dbg.scala 474:125]
  wire [31:0] _T_98 = _T_96 & sb_bus_rdata[31:0]; // @[el2_dbg.scala 173:33]
  wire [31:0] sbdata0_din = _T_94 | _T_98; // @[el2_dbg.scala 172:68]
  wire [31:0] _T_100 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_101 = _T_100 & io_dmi_reg_wdata; // @[el2_dbg.scala 175:49]
  wire [31:0] _T_105 = _T_96 & sb_bus_rdata[63:32]; // @[el2_dbg.scala 176:33]
  wire [31:0] sbdata1_din = _T_101 | _T_105; // @[el2_dbg.scala 175:68]
  reg [31:0] sbdata0_reg; // @[el2_lib.scala 514:16]
  reg [31:0] sbdata1_reg; // @[el2_lib.scala 514:16]
  wire  _GEN_53 = _T_557 & sbcs_reg[16]; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_554 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_551 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_549 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_547 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_541 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_539 ? 1'h0 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_102 = _T_532 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_109 = _T_525 ? 1'h0 : _GEN_102; // @[Conditional.scala 39:67]
  wire  sbaddress0_reg_wren1 = sbcs_sbbusy_din ? 1'h0 : _GEN_109; // @[Conditional.scala 40:58]
  wire [31:0] _T_111 = _T_123 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_112 = _T_111 & io_dmi_reg_wdata; // @[el2_dbg.scala 188:59]
  wire [31:0] _T_114 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_115 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_117 = sbaddress0_reg + _T_115; // @[el2_dbg.scala 189:54]
  wire [31:0] _T_118 = _T_114 & _T_117; // @[el2_dbg.scala 189:36]
  wire [31:0] sbaddress0_reg_din = _T_112 | _T_118; // @[el2_dbg.scala 188:78]
  wire  _T_132 = io_dmi_reg_addr == 7'h10; // @[el2_dbg.scala 197:41]
  wire  _T_133 = _T_132 & io_dmi_reg_en; // @[el2_dbg.scala 197:54]
  wire  dmcontrol_wren = _T_133 & io_dmi_reg_wr_en; // @[el2_dbg.scala 197:70]
  wire [3:0] _T_139 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  wire  _T_168 = dbg_state == 3'h6; // @[el2_dbg.scala 217:44]
  wire  _T_169 = _T_168 & io_dec_tlu_resume_ack; // @[el2_dbg.scala 217:66]
  wire  _T_171 = ~temp[30]; // @[el2_dbg.scala 217:113]
  wire  _T_172 = dmstatus_resumeack & _T_171; // @[el2_dbg.scala 217:111]
  wire  dmstatus_resumeack_wren = _T_169 | _T_172; // @[el2_dbg.scala 217:90]
  wire  _T_176 = _T_132 & io_dmi_reg_wdata[1]; // @[el2_dbg.scala 219:63]
  wire  _T_177 = _T_176 & io_dmi_reg_en; // @[el2_dbg.scala 219:85]
  wire  dmstatus_havereset_wren = _T_177 & io_dmi_reg_wr_en; // @[el2_dbg.scala 219:101]
  wire  _T_180 = _T_132 & io_dmi_reg_wdata[28]; // @[el2_dbg.scala 220:62]
  wire  _T_181 = _T_180 & io_dmi_reg_en; // @[el2_dbg.scala 220:85]
  wire  dmstatus_havereset_rst = _T_181 & io_dmi_reg_wr_en; // @[el2_dbg.scala 220:101]
  wire  _T_191 = ~io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 229:37]
  wire  _T_192 = io_dec_tlu_dbg_halted & _T_191; // @[el2_dbg.scala 229:35]
  wire  _T_195 = ~dmstatus_havereset_rst; // @[el2_dbg.scala 233:15]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire  _T_198 = abstractcs_reg[12] & io_dmi_reg_en; // @[el2_dbg.scala 239:50]
  wire  _T_199 = io_dmi_reg_addr == 7'h16; // @[el2_dbg.scala 239:106]
  wire  _T_201 = _T_199 | _T_275; // @[el2_dbg.scala 239:119]
  wire  _T_202 = io_dmi_reg_wr_en & _T_201; // @[el2_dbg.scala 239:86]
  wire  _T_203 = io_dmi_reg_addr == 7'h4; // @[el2_dbg.scala 239:171]
  wire  _T_204 = _T_202 | _T_203; // @[el2_dbg.scala 239:152]
  wire  abstractcs_error_sel0 = _T_198 & _T_204; // @[el2_dbg.scala 239:66]
  wire  _T_207 = _T_130 & _T_275; // @[el2_dbg.scala 240:64]
  wire  _T_209 = io_dmi_reg_wdata[31:24] == 8'h0; // @[el2_dbg.scala 240:126]
  wire  _T_211 = io_dmi_reg_wdata[31:24] == 8'h2; // @[el2_dbg.scala 240:163]
  wire  _T_212 = _T_209 | _T_211; // @[el2_dbg.scala 240:135]
  wire  _T_213 = ~_T_212; // @[el2_dbg.scala 240:98]
  wire  abstractcs_error_sel1 = _T_207 & _T_213; // @[el2_dbg.scala 240:96]
  wire  abstractcs_error_sel2 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[el2_dbg.scala 241:52]
  wire  _T_218 = ~dmstatus_reg[9]; // @[el2_dbg.scala 242:98]
  wire  abstractcs_error_sel3 = _T_207 & _T_218; // @[el2_dbg.scala 242:96]
  wire  _T_223 = io_dmi_reg_wdata[22:20] != 3'h2; // @[el2_dbg.scala 244:32]
  reg [31:0] data1_reg; // @[el2_lib.scala 514:16]
  wire  _T_227 = |data1_reg[1:0]; // @[el2_dbg.scala 244:106]
  wire  _T_228 = _T_211 & _T_227; // @[el2_dbg.scala 244:87]
  wire  _T_229 = _T_223 | _T_228; // @[el2_dbg.scala 244:46]
  wire  abstractcs_error_sel4 = _T_277 & _T_229; // @[el2_dbg.scala 243:96]
  wire  _T_231 = _T_199 & io_dmi_reg_en; // @[el2_dbg.scala 246:61]
  wire  abstractcs_error_sel5 = _T_231 & io_dmi_reg_wr_en; // @[el2_dbg.scala 246:77]
  wire  _T_232 = abstractcs_error_sel0 | abstractcs_error_sel1; // @[el2_dbg.scala 247:54]
  wire  _T_233 = _T_232 | abstractcs_error_sel2; // @[el2_dbg.scala 247:78]
  wire  _T_234 = _T_233 | abstractcs_error_sel3; // @[el2_dbg.scala 247:102]
  wire  _T_235 = _T_234 | abstractcs_error_sel4; // @[el2_dbg.scala 247:126]
  wire  abstractcs_error_selor = _T_235 | abstractcs_error_sel5; // @[el2_dbg.scala 247:150]
  wire [2:0] _T_237 = abstractcs_error_sel0 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_238 = _T_237 & 3'h1; // @[el2_dbg.scala 248:62]
  wire [2:0] _T_240 = abstractcs_error_sel1 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_241 = _T_240 & 3'h2; // @[el2_dbg.scala 249:37]
  wire [2:0] _T_242 = _T_238 | _T_241; // @[el2_dbg.scala 248:74]
  wire [2:0] _T_244 = abstractcs_error_sel2 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_245 = _T_244 & 3'h3; // @[el2_dbg.scala 250:37]
  wire [2:0] _T_246 = _T_242 | _T_245; // @[el2_dbg.scala 249:49]
  wire [2:0] _T_248 = abstractcs_error_sel3 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_249 = _T_248 & 3'h4; // @[el2_dbg.scala 251:37]
  wire [2:0] _T_250 = _T_246 | _T_249; // @[el2_dbg.scala 250:49]
  wire [2:0] _T_252 = abstractcs_error_sel4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_254 = _T_250 | _T_252; // @[el2_dbg.scala 251:49]
  wire [2:0] _T_256 = abstractcs_error_sel5 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_258 = ~io_dmi_reg_wdata[10:8]; // @[el2_dbg.scala 253:40]
  wire [2:0] _T_259 = _T_256 & _T_258; // @[el2_dbg.scala 253:37]
  wire [2:0] _T_261 = _T_259 & abstractcs_reg[10:8]; // @[el2_dbg.scala 253:75]
  wire [2:0] _T_262 = _T_254 | _T_261; // @[el2_dbg.scala 252:49]
  wire  _T_263 = ~abstractcs_error_selor; // @[el2_dbg.scala 254:15]
  wire [2:0] _T_265 = _T_263 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_267 = _T_265 & abstractcs_reg[10:8]; // @[el2_dbg.scala 254:50]
  wire [2:0] abstractcs_error_din = _T_262 | _T_267; // @[el2_dbg.scala 253:100]
  wire [2:0] _T_312 = _T_363 ? 3'h2 : 3'h1; // @[el2_dbg.scala 296:26]
  wire [2:0] _T_329 = temp[1] ? 3'h0 : 3'h2; // @[el2_dbg.scala 301:26]
  wire  _T_343 = dmstatus_reg[9] & _T_320; // @[el2_dbg.scala 306:43]
  wire  _T_346 = ~temp[3]; // @[el2_dbg.scala 307:33]
  wire  _T_347 = temp[30] & _T_346; // @[el2_dbg.scala 307:31]
  wire [2:0] _T_348 = _T_347 ? 3'h6 : 3'h3; // @[el2_dbg.scala 307:12]
  wire [2:0] _T_350 = temp[31] ? 3'h1 : 3'h0; // @[el2_dbg.scala 308:12]
  wire [2:0] _T_351 = _T_343 ? _T_348 : _T_350; // @[el2_dbg.scala 306:26]
  wire [2:0] _T_381 = _T_384 ? 3'h5 : 3'h4; // @[el2_dbg.scala 317:62]
  wire [2:0] _T_382 = temp[1] ? 3'h0 : _T_381; // @[el2_dbg.scala 317:26]
  wire [2:0] _T_396 = temp[1] ? 3'h0 : 3'h5; // @[el2_dbg.scala 322:26]
  wire [2:0] _GEN_15 = _T_405 ? _T_329 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_20 = _T_394 ? _T_396 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_25 = _T_377 ? _T_382 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_30 = _T_339 ? _T_351 : _GEN_25; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_36 = _T_327 ? _T_329 : _GEN_30; // @[Conditional.scala 39:67]
  wire [2:0] dbg_nxtstate = _T_309 ? _T_312 : _GEN_36; // @[Conditional.scala 40:58]
  wire  _T_366 = dbg_nxtstate == 3'h3; // @[el2_dbg.scala 311:60]
  wire  _T_367 = dbg_state_en & _T_366; // @[el2_dbg.scala 311:44]
  wire  _GEN_17 = _T_405 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_394 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_377 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_339 ? _T_367 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_327 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  abstractcs_busy_wren = _T_309 ? 1'h0 : _GEN_39; // @[Conditional.scala 40:58]
  wire [31:0] command_din = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:20],3'h0,io_dmi_reg_wdata[16:0]}; // @[Cat.scala 29:58]
  reg [31:0] command_reg; // @[Reg.scala 27:20]
  wire  _T_288 = _T_130 & _T_203; // @[el2_dbg.scala 272:58]
  wire  data0_reg_wren0 = _T_288 & _T_278; // @[el2_dbg.scala 272:89]
  wire  _T_290 = dbg_state == 3'h4; // @[el2_dbg.scala 273:59]
  wire  _T_291 = io_core_dbg_cmd_done & _T_290; // @[el2_dbg.scala 273:46]
  wire  _T_293 = ~command_reg[16]; // @[el2_dbg.scala 273:83]
  wire  data0_reg_wren1 = _T_291 & _T_293; // @[el2_dbg.scala 273:81]
  wire  data0_reg_wren = data0_reg_wren0 | data0_reg_wren1; // @[el2_dbg.scala 275:40]
  wire [31:0] _T_295 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_296 = _T_295 & io_dmi_reg_wdata; // @[el2_dbg.scala 276:45]
  wire [31:0] _T_298 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_299 = _T_298 & io_core_dbg_rddata; // @[el2_dbg.scala 276:92]
  wire [31:0] data0_din = _T_296 | _T_299; // @[el2_dbg.scala 276:64]
  reg [31:0] data0_reg; // @[Reg.scala 27:20]
  wire  _T_302 = io_dmi_reg_addr == 7'h5; // @[el2_dbg.scala 281:77]
  wire  _T_303 = _T_130 & _T_302; // @[el2_dbg.scala 281:58]
  wire  data1_reg_wren = _T_303 & _T_278; // @[el2_dbg.scala 281:89]
  wire [31:0] _T_306 = data1_reg_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] data1_din = _T_306 & io_dmi_reg_wdata; // @[el2_dbg.scala 282:44]
  wire  _T_325 = temp[31] & _T_320; // @[el2_dbg.scala 298:45]
  wire  _T_334 = dmcontrol_wren_Q & temp[31]; // @[el2_dbg.scala 303:44]
  wire  _T_337 = _T_334 & _T_320; // @[el2_dbg.scala 303:64]
  wire  _T_368 = dbg_nxtstate == 3'h6; // @[el2_dbg.scala 313:58]
  wire  _T_369 = dbg_state_en & _T_368; // @[el2_dbg.scala 313:42]
  wire  _GEN_14 = _T_414 & _T_337; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_405 ? _T_337 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_394 ? _T_337 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_377 ? _T_337 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_339 & _T_369; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_339 ? _T_337 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_327 ? _T_337 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_327 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [31:0] _T_426 = _T_203 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_427 = _T_426 & data0_reg; // @[el2_dbg.scala 339:71]
  wire [31:0] _T_430 = _T_302 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_431 = _T_430 & data1_reg; // @[el2_dbg.scala 339:122]
  wire [31:0] _T_432 = _T_427 | _T_431; // @[el2_dbg.scala 339:83]
  wire [31:0] _T_435 = _T_132 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_436 = _T_435 & temp; // @[el2_dbg.scala 340:43]
  wire [31:0] _T_437 = _T_432 | _T_436; // @[el2_dbg.scala 339:134]
  wire  _T_438 = io_dmi_reg_addr == 7'h11; // @[el2_dbg.scala 340:86]
  wire [31:0] _T_440 = _T_438 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_441 = _T_440 & dmstatus_reg; // @[el2_dbg.scala 340:99]
  wire [31:0] _T_442 = _T_437 | _T_441; // @[el2_dbg.scala 340:59]
  wire [31:0] _T_445 = _T_199 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_446 = _T_445 & abstractcs_reg; // @[el2_dbg.scala 341:43]
  wire [31:0] _T_447 = _T_442 | _T_446; // @[el2_dbg.scala 340:114]
  wire [31:0] _T_450 = _T_275 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_451 = _T_450 & command_reg; // @[el2_dbg.scala 341:100]
  wire [31:0] _T_452 = _T_447 | _T_451; // @[el2_dbg.scala 341:60]
  wire  _T_453 = io_dmi_reg_addr == 7'h40; // @[el2_dbg.scala 342:30]
  wire [31:0] _T_455 = _T_453 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_456 = _T_455 & haltsum0_reg; // @[el2_dbg.scala 342:43]
  wire [31:0] _T_457 = _T_452 | _T_456; // @[el2_dbg.scala 341:114]
  wire [31:0] _T_460 = _T_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_461 = _T_460 & sbcs_reg; // @[el2_dbg.scala 342:98]
  wire [31:0] _T_462 = _T_457 | _T_461; // @[el2_dbg.scala 342:58]
  wire [31:0] _T_465 = _T_122 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_466 = _T_465 & sbaddress0_reg; // @[el2_dbg.scala 343:43]
  wire [31:0] _T_467 = _T_462 | _T_466; // @[el2_dbg.scala 342:109]
  wire [31:0] _T_470 = _T_131 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_471 = _T_470 & sbdata0_reg; // @[el2_dbg.scala 343:100]
  wire [31:0] _T_472 = _T_467 | _T_471; // @[el2_dbg.scala 343:60]
  wire [31:0] _T_475 = _T_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_476 = _T_475 & sbdata1_reg; // @[el2_dbg.scala 344:43]
  wire [31:0] dmi_reg_rdata_din = _T_472 | _T_476; // @[el2_dbg.scala 343:114]
  wire  _T_478 = _T_29 & reset; // @[el2_dbg.scala 346:62]
  reg [31:0] _T_481; // @[Reg.scala 27:20]
  wire  _T_483 = command_reg[31:24] == 8'h2; // @[el2_dbg.scala 355:47]
  wire [30:0] _T_485 = {data1_reg[31:2],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_487 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_490 = dbg_state == 3'h3; // @[el2_dbg.scala 357:35]
  wire  _T_493 = ~_T_384; // @[el2_dbg.scala 357:60]
  wire  _T_494 = _T_490 & _T_493; // @[el2_dbg.scala 357:58]
  wire  _T_502 = command_reg[15:12] == 4'h0; // @[el2_dbg.scala 359:102]
  wire [1:0] _T_503 = {1'h0,_T_502}; // @[Cat.scala 29:58]
  wire  _T_542 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[el2_dbg.scala 397:48]
  wire  _T_573 = sb_state == 4'h4; // @[el2_dbg.scala 438:35]
  wire  _T_574 = sb_state == 4'h5; // @[el2_dbg.scala 438:70]
  wire  _T_580 = sb_state == 4'h6; // @[el2_dbg.scala 449:69]
  wire [63:0] _T_590 = {sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_591 = _T_656 & _T_590; // @[el2_dbg.scala 450:59]
  wire [63:0] _T_598 = {sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_599 = _T_666 & _T_598; // @[el2_dbg.scala 450:132]
  wire [63:0] _T_600 = _T_591 | _T_599; // @[el2_dbg.scala 450:90]
  wire [63:0] _T_606 = {sbdata0_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_607 = _T_677 & _T_606; // @[el2_dbg.scala 451:45]
  wire [63:0] _T_608 = _T_600 | _T_607; // @[el2_dbg.scala 450:162]
  wire [63:0] _T_615 = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_616 = _T_688 & _T_615; // @[el2_dbg.scala 451:119]
  wire [7:0] _T_621 = _T_61 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_623 = 15'h1 << sbaddress0_reg[2:0]; // @[el2_dbg.scala 453:76]
  wire [14:0] _GEN_122 = {{7'd0}, _T_621}; // @[el2_dbg.scala 453:61]
  wire [14:0] _T_624 = _GEN_122 & _T_623; // @[el2_dbg.scala 453:61]
  wire [7:0] _T_628 = _T_46 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_630 = {sbaddress0_reg[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_631 = 15'h3 << _T_630; // @[el2_dbg.scala 454:59]
  wire [14:0] _GEN_123 = {{7'd0}, _T_628}; // @[el2_dbg.scala 454:44]
  wire [14:0] _T_632 = _GEN_123 & _T_631; // @[el2_dbg.scala 454:44]
  wire [14:0] _T_633 = _T_624 | _T_632; // @[el2_dbg.scala 453:101]
  wire [7:0] _T_637 = _T_50 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_639 = {sbaddress0_reg[2],1'h0}; // @[Cat.scala 29:58]
  wire [10:0] _T_640 = 11'hf << _T_639; // @[el2_dbg.scala 455:59]
  wire [10:0] _GEN_124 = {{3'd0}, _T_637}; // @[el2_dbg.scala 455:44]
  wire [10:0] _T_641 = _GEN_124 & _T_640; // @[el2_dbg.scala 455:44]
  wire [14:0] _GEN_125 = {{4'd0}, _T_641}; // @[el2_dbg.scala 454:97]
  wire [14:0] _T_642 = _T_633 | _GEN_125; // @[el2_dbg.scala 454:97]
  wire [7:0] _T_646 = _T_56 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_126 = {{7'd0}, _T_646}; // @[el2_dbg.scala 455:95]
  wire [14:0] _T_648 = _T_642 | _GEN_126; // @[el2_dbg.scala 455:95]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_2 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_3 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_4 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_5 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  assign io_dbg_cmd_addr = _T_483 ? {{1'd0}, _T_485} : _T_487; // @[el2_dbg.scala 355:19]
  assign io_dbg_cmd_wrdata = data0_reg; // @[el2_dbg.scala 356:21]
  assign io_dbg_cmd_valid = _T_494 & io_dma_dbg_ready; // @[el2_dbg.scala 357:20]
  assign io_dbg_cmd_write = command_reg[16]; // @[el2_dbg.scala 358:20]
  assign io_dbg_cmd_type = _T_483 ? 2'h2 : _T_503; // @[el2_dbg.scala 359:19]
  assign io_dbg_cmd_size = command_reg[21:20]; // @[el2_dbg.scala 360:19]
  assign io_dbg_core_rst_l = ~temp[1]; // @[el2_dbg.scala 131:21]
  assign io_dbg_dma_bubble = _T_494 | _T_290; // @[el2_dbg.scala 361:21]
  assign io_dbg_halt_req = _T_309 ? _T_325 : _GEN_38; // @[el2_dbg.scala 292:19 el2_dbg.scala 298:23 el2_dbg.scala 303:23 el2_dbg.scala 314:23 el2_dbg.scala 319:23 el2_dbg.scala 324:23 el2_dbg.scala 331:23 el2_dbg.scala 336:23]
  assign io_dbg_resume_req = _T_309 ? 1'h0 : _GEN_41; // @[el2_dbg.scala 293:21 el2_dbg.scala 313:25]
  assign io_dmi_reg_rdata = _T_481; // @[el2_dbg.scala 351:20]
  assign io_sb_axi_awvalid = _T_573 | _T_574; // @[el2_dbg.scala 438:21]
  assign io_sb_axi_awid = 1'h0; // @[el2_dbg.scala 440:18]
  assign io_sb_axi_awaddr = sbaddress0_reg; // @[el2_dbg.scala 439:20]
  assign io_sb_axi_awregion = sbaddress0_reg[31:28]; // @[el2_dbg.scala 444:22]
  assign io_sb_axi_awlen = 8'h0; // @[el2_dbg.scala 445:19]
  assign io_sb_axi_awsize = sbcs_reg[19:17]; // @[el2_dbg.scala 441:20]
  assign io_sb_axi_awburst = 2'h1; // @[el2_dbg.scala 446:21]
  assign io_sb_axi_awlock = 1'h0; // @[el2_dbg.scala 448:20]
  assign io_sb_axi_awcache = 4'hf; // @[el2_dbg.scala 443:21]
  assign io_sb_axi_awprot = 3'h0; // @[el2_dbg.scala 442:20]
  assign io_sb_axi_awqos = 4'h0; // @[el2_dbg.scala 447:19]
  assign io_sb_axi_wvalid = _T_573 | _T_580; // @[el2_dbg.scala 449:20]
  assign io_sb_axi_wdata = _T_608 | _T_616; // @[el2_dbg.scala 450:19]
  assign io_sb_axi_wstrb = _T_648[7:0]; // @[el2_dbg.scala 453:19]
  assign io_sb_axi_wlast = 1'h1; // @[el2_dbg.scala 458:19]
  assign io_sb_axi_bready = 1'h1; // @[el2_dbg.scala 470:20]
  assign io_sb_axi_arvalid = sb_state == 4'h3; // @[el2_dbg.scala 459:21]
  assign io_sb_axi_arid = 1'h0; // @[el2_dbg.scala 461:18]
  assign io_sb_axi_araddr = sbaddress0_reg; // @[el2_dbg.scala 460:20]
  assign io_sb_axi_arregion = sbaddress0_reg[31:28]; // @[el2_dbg.scala 465:22]
  assign io_sb_axi_arlen = 8'h0; // @[el2_dbg.scala 466:19]
  assign io_sb_axi_arsize = sbcs_reg[19:17]; // @[el2_dbg.scala 462:20]
  assign io_sb_axi_arburst = 2'h1; // @[el2_dbg.scala 467:21]
  assign io_sb_axi_arlock = 1'h0; // @[el2_dbg.scala 469:20]
  assign io_sb_axi_arcache = 4'h0; // @[el2_dbg.scala 464:21]
  assign io_sb_axi_arprot = 3'h0; // @[el2_dbg.scala 463:20]
  assign io_sb_axi_arqos = 4'h0; // @[el2_dbg.scala 468:19]
  assign io_sb_axi_rready = 1'h1; // @[el2_dbg.scala 471:20]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_3 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = _T_6 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = sbdata0wr_access | sbdata0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = _T_123 | sbaddress0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = _T_303 & _T_278; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  dbg_state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  dm_temp = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  dm_temp_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  dmstatus_havereset = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  dmstatus_resumeack = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  dmstatus_halted = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  dmcontrol_wren_Q = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  abs_temp_12 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  abs_temp_10_8 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  sb_state = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  temp_sbcs_22 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  temp_sbcs_21 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  temp_sbcs_20 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  temp_sbcs_19_15 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  temp_sbcs_14_12 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  sbaddress0_reg = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  sbdata0_reg = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  sbdata1_reg = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  data1_reg = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  command_reg = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  data0_reg = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  _T_481 = _RAND_21[31:0];
`endif // RANDOMIZE_REG_INIT
  if (io_dbg_rst_l) begin
    dm_temp_0 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk) begin
    if (_T_478) begin
      dbg_state <= 3'h0;
    end else if (dbg_state_en) begin
      if (_T_309) begin
        if (_T_363) begin
          dbg_state <= 3'h2;
        end else begin
          dbg_state <= 3'h1;
        end
      end else if (_T_327) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else begin
          dbg_state <= 3'h2;
        end
      end else if (_T_339) begin
        if (_T_343) begin
          if (_T_347) begin
            dbg_state <= 3'h6;
          end else begin
            dbg_state <= 3'h3;
          end
        end else if (temp[31]) begin
          dbg_state <= 3'h1;
        end else begin
          dbg_state <= 3'h0;
        end
      end else if (_T_377) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else if (_T_384) begin
          dbg_state <= 3'h5;
        end else begin
          dbg_state <= 3'h4;
        end
      end else if (_T_394) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else begin
          dbg_state <= 3'h5;
        end
      end else if (_T_405) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else begin
          dbg_state <= 3'h2;
        end
      end else begin
        dbg_state <= 3'h0;
      end
    end
    if (_T_29) begin
      dm_temp <= 4'h0;
    end else if (dmcontrol_wren) begin
      dm_temp <= _T_139;
    end
    if (_T_29) begin
      dmstatus_havereset <= 1'h0;
    end else if (dmstatus_havereset_wren) begin
      dmstatus_havereset <= _T_195;
    end
    if (_T_29) begin
      dmstatus_resumeack <= 1'h0;
    end else if (dmstatus_resumeack_wren) begin
      dmstatus_resumeack <= _T_169;
    end
    if (_T_29) begin
      dmstatus_halted <= 1'h0;
    end else begin
      dmstatus_halted <= _T_192;
    end
    if (_T_29) begin
      dmcontrol_wren_Q <= 1'h0;
    end else begin
      dmcontrol_wren_Q <= dmcontrol_wren;
    end
    if (_T_29) begin
      abs_temp_12 <= 1'h0;
    end else if (abstractcs_busy_wren) begin
      if (_T_309) begin
        abs_temp_12 <= 1'h0;
      end else if (_T_327) begin
        abs_temp_12 <= 1'h0;
      end else begin
        abs_temp_12 <= _T_339;
      end
    end
    if (_T_29) begin
      abs_temp_10_8 <= 3'h0;
    end else begin
      abs_temp_10_8 <= abstractcs_error_din;
    end
    if (_T_29) begin
      _T_481 <= 32'h0;
    end else if (io_dmi_reg_en) begin
      _T_481 <= dmi_reg_rdata_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk) begin
    if (_T_29) begin
      sb_state <= 4'h0;
    end else if (sb_state_en) begin
      if (sbcs_sbbusy_din) begin
        if (sbdata0wr_access) begin
          sb_state <= 4'h2;
        end else begin
          sb_state <= 4'h1;
        end
      end else if (_T_525) begin
        if (_T_530) begin
          sb_state <= 4'h9;
        end else begin
          sb_state <= 4'h3;
        end
      end else if (_T_532) begin
        if (_T_530) begin
          sb_state <= 4'h9;
        end else begin
          sb_state <= 4'h4;
        end
      end else if (_T_539) begin
        sb_state <= 4'h7;
      end else if (_T_541) begin
        if (_T_542) begin
          sb_state <= 4'h8;
        end else if (sb_bus_cmd_write_data) begin
          sb_state <= 4'h5;
        end else begin
          sb_state <= 4'h6;
        end
      end else if (_T_547) begin
        sb_state <= 4'h8;
      end else if (_T_549) begin
        sb_state <= 4'h8;
      end else if (_T_551) begin
        sb_state <= 4'h9;
      end else if (_T_554) begin
        sb_state <= 4'h9;
      end else begin
        sb_state <= 4'h0;
      end
    end
    if (_T_29) begin
      temp_sbcs_22 <= 1'h0;
    end else if (sbcs_sbbusyerror_wren) begin
      temp_sbcs_22 <= sbcs_sbbusyerror_din;
    end
    if (_T_29) begin
      temp_sbcs_21 <= 1'h0;
    end else if (sbcs_sbbusy_wren) begin
      temp_sbcs_21 <= sbcs_sbbusy_din;
    end
    if (_T_29) begin
      temp_sbcs_20 <= 1'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_20 <= io_dmi_reg_wdata[20];
    end
    if (_T_29) begin
      temp_sbcs_19_15 <= 5'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_19_15 <= io_dmi_reg_wdata[19:15];
    end
    if (_T_29) begin
      temp_sbcs_14_12 <= 3'h0;
    end else if (sbcs_sberror_wren) begin
      if (sbcs_sbbusy_din) begin
        temp_sbcs_14_12 <= _T_524;
      end else if (_T_525) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_532) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_539) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_541) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_547) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_549) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_551) begin
        temp_sbcs_14_12 <= 3'h2;
      end else if (_T_554) begin
        temp_sbcs_14_12 <= 3'h2;
      end else begin
        temp_sbcs_14_12 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk) begin
    if (_T_29) begin
      sbaddress0_reg <= 32'h0;
    end else begin
      sbaddress0_reg <= sbaddress0_reg_din;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk) begin
    if (_T_29) begin
      sbdata0_reg <= 32'h0;
    end else begin
      sbdata0_reg <= sbdata0_din;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk) begin
    if (_T_29) begin
      sbdata1_reg <= 32'h0;
    end else begin
      sbdata1_reg <= sbdata1_din;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk) begin
    if (_T_29) begin
      data1_reg <= 32'h0;
    end else begin
      data1_reg <= data1_din;
    end
  end
  always @(posedge clock) begin
    if (_T_29) begin
      command_reg <= 32'h0;
    end else if (command_wren) begin
      command_reg <= command_din;
    end
    if (_T_29) begin
      data0_reg <= 32'h0;
    end else if (data0_reg_wren) begin
      data0_reg <= data0_din;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge io_dbg_rst_l) begin
    if (io_dbg_rst_l) begin
      dm_temp_0 <= 1'h0;
    end else if (dmcontrol_wren) begin
      dm_temp_0 <= io_dmi_reg_wdata[0];
    end
  end
endmodule
