module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 459:26]
  wire  clkhdr_CK; // @[el2_lib.scala 459:26]
  wire  clkhdr_EN; // @[el2_lib.scala 459:26]
  wire  clkhdr_SE; // @[el2_lib.scala 459:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 459:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 460:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 461:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 462:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 463:18]
endmodule
module rvclkhdr_2(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 459:26]
  wire  clkhdr_CK; // @[el2_lib.scala 459:26]
  wire  clkhdr_EN; // @[el2_lib.scala 459:26]
  wire  clkhdr_SE; // @[el2_lib.scala 459:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 459:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 460:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 461:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 462:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 463:18]
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 468:22]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 493:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 493:23]
  reg [2:0] dbg_state; // @[Reg.scala 27:20]
  wire  _T = dbg_state != 3'h0; // @[el2_dbg.scala 126:51]
  wire  _T_1 = io_dmi_reg_en | _T; // @[el2_dbg.scala 126:38]
  wire  _T_308 = 3'h0 == dbg_state; // @[Conditional.scala 37:30]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [31:0] temp = {dm_temp[3:2],1'h0,dm_temp[1],26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire  _T_313 = ~io_dec_tlu_debug_mode; // @[el2_dbg.scala 297:45]
  wire  _T_314 = temp[31] & _T_313; // @[el2_dbg.scala 297:43]
  reg  dmstatus_havereset; // @[Reg.scala 27:20]
  wire [1:0] _T_149 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  dmstatus_resumeack; // @[Reg.scala 27:20]
  wire [1:0] _T_151 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_182 = ~reset; // @[el2_dbg.scala 222:43]
  wire  dmstatus_unavail = temp[1] | _T_182; // @[el2_dbg.scala 222:41]
  wire [1:0] _T_153 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  dmstatus_halted; // @[el2_dbg.scala 229:12]
  wire  _T_185 = dmstatus_unavail | dmstatus_halted; // @[el2_dbg.scala 223:42]
  wire  dmstatus_running = ~_T_185; // @[el2_dbg.scala 223:23]
  wire [1:0] _T_155 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_157 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [31:0] dmstatus_reg = {12'h0,_T_149,_T_151,2'h0,_T_153,_T_155,_T_157,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire  _T_316 = _T_314 | dmstatus_reg[9]; // @[el2_dbg.scala 297:69]
  wire  _T_317 = _T_316 | io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 297:87]
  wire  _T_319 = ~temp[1]; // @[el2_dbg.scala 297:119]
  wire  _T_320 = _T_317 & _T_319; // @[el2_dbg.scala 297:117]
  wire  _T_326 = 3'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_331 = dmstatus_reg[9] | temp[1]; // @[el2_dbg.scala 302:39]
  wire  _T_338 = 3'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_353 = dmstatus_reg[9] & temp[30]; // @[el2_dbg.scala 309:39]
  wire  _T_355 = ~temp[31]; // @[el2_dbg.scala 309:61]
  wire  _T_356 = _T_353 & _T_355; // @[el2_dbg.scala 309:59]
  reg  dmcontrol_wren_Q; // @[el2_dbg.scala 212:12]
  wire  _T_357 = _T_356 & dmcontrol_wren_Q; // @[el2_dbg.scala 309:80]
  wire  _T_274 = io_dmi_reg_addr == 7'h17; // @[el2_dbg.scala 266:39]
  wire  _T_275 = _T_274 & io_dmi_reg_en; // @[el2_dbg.scala 266:52]
  wire  _T_276 = _T_275 & io_dmi_reg_wr_en; // @[el2_dbg.scala 266:68]
  wire  _T_277 = dbg_state == 3'h2; // @[el2_dbg.scala 266:100]
  wire  command_wren = _T_276 & _T_277; // @[el2_dbg.scala 266:87]
  wire  _T_358 = _T_357 | command_wren; // @[el2_dbg.scala 309:99]
  wire  _T_360 = _T_358 | temp[1]; // @[el2_dbg.scala 309:114]
  wire  _T_362 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 310:46]
  wire  _T_363 = ~_T_362; // @[el2_dbg.scala 310:28]
  wire  _T_364 = _T_360 | _T_363; // @[el2_dbg.scala 310:26]
  wire  _T_376 = 3'h3 == dbg_state; // @[Conditional.scala 37:30]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[el2_dbg.scala 261:12]
  wire [31:0] abstractcs_reg = {19'h0,abs_temp_12,1'h0,abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire  _T_383 = |abstractcs_reg[10:8]; // @[el2_dbg.scala 318:64]
  wire  _T_384 = io_dbg_cmd_valid | _T_383; // @[el2_dbg.scala 318:40]
  wire  _T_386 = _T_384 | temp[1]; // @[el2_dbg.scala 318:68]
  wire  _T_393 = 3'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_397 = io_core_dbg_cmd_done | temp[1]; // @[el2_dbg.scala 323:44]
  wire  _T_404 = 3'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_413 = 3'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_416 = dmstatus_reg[17] | temp[1]; // @[el2_dbg.scala 335:40]
  wire  _GEN_13 = _T_413 & _T_416; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_404 | _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_393 ? _T_397 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_376 ? _T_386 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_338 ? _T_364 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_326 ? _T_331 : _GEN_31; // @[Conditional.scala 39:67]
  wire  dbg_state_en = _T_308 ? _T_320 : _GEN_37; // @[Conditional.scala 40:58]
  wire  _T_2 = _T_1 | dbg_state_en; // @[el2_dbg.scala 126:69]
  wire  _T_3 = _T_2 | io_dec_tlu_dbg_halted; // @[el2_dbg.scala 126:84]
  reg [3:0] sb_state; // @[Reg.scala 27:20]
  wire  sbcs_sbbusy_din = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_129 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[el2_dbg.scala 196:40]
  wire  _T_130 = io_dmi_reg_addr == 7'h3c; // @[el2_dbg.scala 196:78]
  wire  sbdata0wr_access = _T_129 & _T_130; // @[el2_dbg.scala 196:59]
  wire  _T_124 = ~io_dmi_reg_wr_en; // @[el2_dbg.scala 195:45]
  wire  _T_125 = io_dmi_reg_en & _T_124; // @[el2_dbg.scala 195:43]
  wire  _T_127 = _T_125 & _T_130; // @[el2_dbg.scala 195:63]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire [31:0] sbcs_reg = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20,temp_sbcs_19_15,temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire  sbreadondata_access = _T_127 & sbcs_reg[15]; // @[el2_dbg.scala 195:95]
  wire  _T_515 = sbdata0wr_access | sbreadondata_access; // @[el2_dbg.scala 374:39]
  wire  _T_121 = io_dmi_reg_addr == 7'h39; // @[el2_dbg.scala 194:81]
  wire  _T_122 = _T_129 & _T_121; // @[el2_dbg.scala 194:62]
  wire  sbreadonaddr_access = _T_122 & sbcs_reg[20]; // @[el2_dbg.scala 194:94]
  wire  _T_516 = _T_515 | sbreadonaddr_access; // @[el2_dbg.scala 374:61]
  wire  _T_524 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_45 = sbcs_reg[19:17] == 3'h1; // @[el2_dbg.scala 158:42]
  reg [31:0] sbaddress0_reg; // @[el2_lib.scala 499:16]
  wire  _T_47 = _T_45 & sbaddress0_reg[0]; // @[el2_dbg.scala 158:56]
  wire  _T_49 = sbcs_reg[19:17] == 3'h2; // @[el2_dbg.scala 159:23]
  wire  _T_51 = |sbaddress0_reg[1:0]; // @[el2_dbg.scala 159:60]
  wire  _T_52 = _T_49 & _T_51; // @[el2_dbg.scala 159:37]
  wire  _T_53 = _T_47 | _T_52; // @[el2_dbg.scala 158:76]
  wire  _T_55 = sbcs_reg[19:17] == 3'h3; // @[el2_dbg.scala 160:23]
  wire  _T_57 = |sbaddress0_reg[2:0]; // @[el2_dbg.scala 160:60]
  wire  _T_58 = _T_55 & _T_57; // @[el2_dbg.scala 160:37]
  wire  sbcs_unaligned = _T_53 | _T_58; // @[el2_dbg.scala 159:64]
  wire  _T_527 = io_dbg_bus_clk_en | sbcs_unaligned; // @[el2_dbg.scala 382:40]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[el2_dbg.scala 162:35]
  wire  _T_528 = _T_527 | sbcs_illegal_size; // @[el2_dbg.scala 382:57]
  wire  _T_531 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_538 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_cmd_read = io_sb_axi_arvalid & io_sb_axi_arready; // @[el2_dbg.scala 432:40]
  wire  _T_539 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[el2_dbg.scala 394:38]
  wire  _T_540 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_cmd_write_addr = io_sb_axi_awvalid & io_sb_axi_awready; // @[el2_dbg.scala 433:46]
  wire  sb_bus_cmd_write_data = io_sb_axi_wvalid & io_sb_axi_wready; // @[el2_dbg.scala 434:45]
  wire  _T_544 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[el2_dbg.scala 398:45]
  wire  _T_545 = _T_544 & io_dbg_bus_clk_en; // @[el2_dbg.scala 398:70]
  wire  _T_546 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_547 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[el2_dbg.scala 402:44]
  wire  _T_548 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_549 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[el2_dbg.scala 406:44]
  wire  _T_550 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_rsp_read = io_sb_axi_rvalid & io_sb_axi_rready; // @[el2_dbg.scala 435:39]
  wire  _T_551 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[el2_dbg.scala 410:38]
  wire  _T_553 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_rsp_write = io_sb_axi_bvalid & io_sb_axi_bready; // @[el2_dbg.scala 436:40]
  wire  _T_554 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[el2_dbg.scala 416:39]
  wire  _T_556 = 4'h9 == sb_state; // @[Conditional.scala 37:30]
  wire  _GEN_55 = _T_553 ? _T_554 : _T_556; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_550 ? _T_551 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_548 ? _T_549 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_546 ? _T_547 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_540 ? _T_545 : _GEN_76; // @[Conditional.scala 39:67]
  wire  _GEN_90 = _T_538 ? _T_539 : _GEN_83; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_531 ? _T_528 : _GEN_90; // @[Conditional.scala 39:67]
  wire  _GEN_104 = _T_524 ? _T_528 : _GEN_97; // @[Conditional.scala 39:67]
  wire  sb_state_en = sbcs_sbbusy_din ? _T_516 : _GEN_104; // @[Conditional.scala 40:58]
  wire  _T_4 = io_dmi_reg_en | sb_state_en; // @[el2_dbg.scala 127:37]
  wire  _T_5 = sb_state != 4'h0; // @[el2_dbg.scala 127:63]
  wire  _T_6 = _T_4 | _T_5; // @[el2_dbg.scala 127:51]
  wire  _T_8 = temp[0] | io_scan_mode; // @[el2_dbg.scala 130:55]
  wire  dbg_dm_rst_l = io_dbg_rst_l & _T_8; // @[el2_dbg.scala 130:35]
  wire  _T_12 = io_dmi_reg_addr == 7'h38; // @[el2_dbg.scala 132:36]
  wire  _T_13 = _T_12 & io_dmi_reg_en; // @[el2_dbg.scala 132:49]
  wire  _T_14 = _T_13 & io_dmi_reg_wr_en; // @[el2_dbg.scala 132:65]
  wire  _T_15 = sb_state == 4'h0; // @[el2_dbg.scala 132:96]
  wire  sbcs_wren = _T_14 & _T_15; // @[el2_dbg.scala 132:84]
  wire  _T_17 = sbcs_wren & io_dmi_reg_wdata[22]; // @[el2_dbg.scala 133:42]
  wire  _T_19 = _T_5 & io_dmi_reg_en; // @[el2_dbg.scala 133:102]
  wire  _T_22 = _T_121 | _T_130; // @[el2_dbg.scala 134:36]
  wire  _T_23 = io_dmi_reg_addr == 7'h3d; // @[el2_dbg.scala 134:87]
  wire  _T_24 = _T_22 | _T_23; // @[el2_dbg.scala 134:68]
  wire  _T_25 = _T_19 & _T_24; // @[el2_dbg.scala 133:118]
  wire  sbcs_sbbusyerror_wren = _T_17 | _T_25; // @[el2_dbg.scala 133:66]
  wire  sbcs_sbbusyerror_din = ~_T_17; // @[el2_dbg.scala 136:31]
  wire  _T_28 = ~dbg_dm_rst_l; // @[el2_dbg.scala 137:53]
  wire  _GEN_58 = _T_553 ? 1'h0 : _T_556; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_550 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_548 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_546 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_540 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_538 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_100 = _T_531 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_524 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67]
  wire  sbcs_sbbusy_wren = sbcs_sbbusy_din ? sb_state_en : _GEN_107; // @[Conditional.scala 40:58]
  wire  _T_521 = io_dmi_reg_wdata[14:12] == 3'h0; // @[el2_dbg.scala 378:27]
  wire [2:0] _GEN_118 = {{2'd0}, _T_521}; // @[el2_dbg.scala 378:53]
  wire [2:0] _T_523 = _GEN_118 & sbcs_reg[14:12]; // @[el2_dbg.scala 378:53]
  wire  _T_518 = |io_dmi_reg_wdata[14:12]; // @[el2_dbg.scala 377:65]
  wire  _T_519 = sbcs_wren & _T_518; // @[el2_dbg.scala 377:38]
  wire  _T_529 = sbcs_unaligned | sbcs_illegal_size; // @[el2_dbg.scala 383:43]
  wire  _T_566 = |io_sb_axi_rresp; // @[el2_dbg.scala 437:63]
  wire  _T_567 = sb_bus_rsp_read & _T_566; // @[el2_dbg.scala 437:39]
  wire  _T_569 = |io_sb_axi_bresp; // @[el2_dbg.scala 437:110]
  wire  _T_570 = sb_bus_rsp_write & _T_569; // @[el2_dbg.scala 437:86]
  wire  sb_bus_rsp_error = _T_567 | _T_570; // @[el2_dbg.scala 437:67]
  wire  _T_552 = sb_state_en & sb_bus_rsp_error; // @[el2_dbg.scala 411:40]
  wire  _GEN_56 = _T_553 & _T_552; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_550 ? _T_552 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_548 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_546 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_540 ? 1'h0 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_538 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_531 ? _T_529 : _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_105 = _T_524 ? _T_529 : _GEN_98; // @[Conditional.scala 39:67]
  wire  sbcs_sberror_wren = sbcs_sbbusy_din ? _T_519 : _GEN_105; // @[Conditional.scala 40:58]
  wire  _T_60 = sbcs_reg[19:17] == 3'h0; // @[el2_dbg.scala 163:51]
  wire [3:0] _T_62 = _T_60 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_63 = _T_62 & 4'h1; // @[el2_dbg.scala 163:64]
  wire [3:0] _T_67 = _T_45 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_68 = _T_67 & 4'h2; // @[el2_dbg.scala 163:117]
  wire [3:0] _T_69 = _T_63 | _T_68; // @[el2_dbg.scala 163:76]
  wire [3:0] _T_73 = _T_49 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_74 = _T_73 & 4'h4; // @[el2_dbg.scala 164:44]
  wire [3:0] _T_75 = _T_69 | _T_74; // @[el2_dbg.scala 163:129]
  wire [3:0] _T_79 = _T_55 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_80 = _T_79 & 4'h8; // @[el2_dbg.scala 164:97]
  wire [3:0] sbaddress0_incr = _T_75 | _T_80; // @[el2_dbg.scala 164:56]
  wire  _T_83 = sb_state == 4'h7; // @[el2_dbg.scala 167:37]
  wire  _T_84 = _T_83 & sb_state_en; // @[el2_dbg.scala 167:60]
  wire  _T_85 = ~sbcs_sberror_wren; // @[el2_dbg.scala 167:76]
  wire  sbdata0_reg_wren1 = _T_84 & _T_85; // @[el2_dbg.scala 167:74]
  wire  sbdata1_reg_wren0 = _T_129 & _T_23; // @[el2_dbg.scala 169:60]
  wire [31:0] _T_92 = sbdata0wr_access ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_93 = _T_92 & io_dmi_reg_wdata; // @[el2_dbg.scala 172:49]
  wire [31:0] _T_95 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_655 = _T_60 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _GEN_119 = {{1'd0}, sbaddress0_reg[2:0]}; // @[el2_dbg.scala 472:93]
  wire [6:0] _T_658 = 4'h8 * _GEN_119; // @[el2_dbg.scala 472:93]
  wire [63:0] _T_659 = io_sb_axi_rdata >> _T_658; // @[el2_dbg.scala 472:86]
  wire [63:0] _T_660 = _T_659 & 64'hff; // @[el2_dbg.scala 472:117]
  wire [63:0] _T_661 = _T_655 & _T_660; // @[el2_dbg.scala 472:59]
  wire [63:0] _T_665 = _T_45 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _GEN_120 = {{3'd0}, sbaddress0_reg[2:1]}; // @[el2_dbg.scala 473:80]
  wire [6:0] _T_668 = 5'h10 * _GEN_120; // @[el2_dbg.scala 473:80]
  wire [63:0] _T_669 = io_sb_axi_rdata >> _T_668; // @[el2_dbg.scala 473:72]
  wire [63:0] _T_670 = _T_669 & 64'hffff; // @[el2_dbg.scala 473:104]
  wire [63:0] _T_671 = _T_665 & _T_670; // @[el2_dbg.scala 473:45]
  wire [63:0] _T_672 = _T_661 | _T_671; // @[el2_dbg.scala 472:134]
  wire [63:0] _T_676 = _T_49 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _GEN_121 = {{5'd0}, sbaddress0_reg[2]}; // @[el2_dbg.scala 474:80]
  wire [6:0] _T_679 = 6'h20 * _GEN_121; // @[el2_dbg.scala 474:80]
  wire [63:0] _T_680 = io_sb_axi_rdata >> _T_679; // @[el2_dbg.scala 474:72]
  wire [63:0] _T_681 = _T_680 & 64'hffffffff; // @[el2_dbg.scala 474:101]
  wire [63:0] _T_682 = _T_676 & _T_681; // @[el2_dbg.scala 474:45]
  wire [63:0] _T_683 = _T_672 | _T_682; // @[el2_dbg.scala 473:123]
  wire [63:0] _T_687 = _T_55 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_689 = _T_687 & io_sb_axi_rdata; // @[el2_dbg.scala 475:45]
  wire [63:0] sb_bus_rdata = _T_683 | _T_689; // @[el2_dbg.scala 474:125]
  wire [31:0] _T_97 = _T_95 & sb_bus_rdata[31:0]; // @[el2_dbg.scala 173:33]
  wire [31:0] sbdata0_din = _T_93 | _T_97; // @[el2_dbg.scala 172:68]
  wire [31:0] _T_99 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_100 = _T_99 & io_dmi_reg_wdata; // @[el2_dbg.scala 175:49]
  wire [31:0] _T_104 = _T_95 & sb_bus_rdata[63:32]; // @[el2_dbg.scala 176:33]
  wire [31:0] sbdata1_din = _T_100 | _T_104; // @[el2_dbg.scala 175:68]
  reg [31:0] sbdata0_reg; // @[el2_lib.scala 499:16]
  reg [31:0] sbdata1_reg; // @[el2_lib.scala 499:16]
  wire  _GEN_53 = _T_556 & sbcs_reg[16]; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_553 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_550 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_548 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_546 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_540 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_538 ? 1'h0 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_102 = _T_531 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_109 = _T_524 ? 1'h0 : _GEN_102; // @[Conditional.scala 39:67]
  wire  sbaddress0_reg_wren1 = sbcs_sbbusy_din ? 1'h0 : _GEN_109; // @[Conditional.scala 40:58]
  wire [31:0] _T_110 = _T_122 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_111 = _T_110 & io_dmi_reg_wdata; // @[el2_dbg.scala 188:59]
  wire [31:0] _T_113 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_114 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_116 = sbaddress0_reg + _T_114; // @[el2_dbg.scala 189:54]
  wire [31:0] _T_117 = _T_113 & _T_116; // @[el2_dbg.scala 189:36]
  wire [31:0] sbaddress0_reg_din = _T_111 | _T_117; // @[el2_dbg.scala 188:78]
  wire  _T_131 = io_dmi_reg_addr == 7'h10; // @[el2_dbg.scala 197:41]
  wire  _T_132 = _T_131 & io_dmi_reg_en; // @[el2_dbg.scala 197:54]
  wire  dmcontrol_wren = _T_132 & io_dmi_reg_wr_en; // @[el2_dbg.scala 197:70]
  wire [3:0] _T_138 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  wire  _T_167 = dbg_state == 3'h6; // @[el2_dbg.scala 217:44]
  wire  _T_168 = _T_167 & io_dec_tlu_resume_ack; // @[el2_dbg.scala 217:66]
  wire  _T_170 = ~temp[30]; // @[el2_dbg.scala 217:113]
  wire  _T_171 = dmstatus_resumeack & _T_170; // @[el2_dbg.scala 217:111]
  wire  dmstatus_resumeack_wren = _T_168 | _T_171; // @[el2_dbg.scala 217:90]
  wire  _T_175 = _T_131 & io_dmi_reg_wdata[1]; // @[el2_dbg.scala 219:63]
  wire  _T_176 = _T_175 & io_dmi_reg_en; // @[el2_dbg.scala 219:85]
  wire  dmstatus_havereset_wren = _T_176 & io_dmi_reg_wr_en; // @[el2_dbg.scala 219:101]
  wire  _T_179 = _T_131 & io_dmi_reg_wdata[28]; // @[el2_dbg.scala 220:62]
  wire  _T_180 = _T_179 & io_dmi_reg_en; // @[el2_dbg.scala 220:85]
  wire  dmstatus_havereset_rst = _T_180 & io_dmi_reg_wr_en; // @[el2_dbg.scala 220:101]
  wire  _T_190 = ~io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 229:37]
  wire  _T_191 = io_dec_tlu_dbg_halted & _T_190; // @[el2_dbg.scala 229:35]
  wire  _T_194 = ~dmstatus_havereset_rst; // @[el2_dbg.scala 233:15]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire  _T_197 = abstractcs_reg[12] & io_dmi_reg_en; // @[el2_dbg.scala 239:50]
  wire  _T_198 = io_dmi_reg_addr == 7'h16; // @[el2_dbg.scala 239:106]
  wire  _T_200 = _T_198 | _T_274; // @[el2_dbg.scala 239:119]
  wire  _T_201 = io_dmi_reg_wr_en & _T_200; // @[el2_dbg.scala 239:86]
  wire  _T_202 = io_dmi_reg_addr == 7'h4; // @[el2_dbg.scala 239:171]
  wire  _T_203 = _T_201 | _T_202; // @[el2_dbg.scala 239:152]
  wire  abstractcs_error_sel0 = _T_197 & _T_203; // @[el2_dbg.scala 239:66]
  wire  _T_206 = _T_129 & _T_274; // @[el2_dbg.scala 240:64]
  wire  _T_208 = io_dmi_reg_wdata[31:24] == 8'h0; // @[el2_dbg.scala 240:126]
  wire  _T_210 = io_dmi_reg_wdata[31:24] == 8'h2; // @[el2_dbg.scala 240:163]
  wire  _T_211 = _T_208 | _T_210; // @[el2_dbg.scala 240:135]
  wire  _T_212 = ~_T_211; // @[el2_dbg.scala 240:98]
  wire  abstractcs_error_sel1 = _T_206 & _T_212; // @[el2_dbg.scala 240:96]
  wire  abstractcs_error_sel2 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[el2_dbg.scala 241:52]
  wire  _T_217 = ~dmstatus_reg[9]; // @[el2_dbg.scala 242:98]
  wire  abstractcs_error_sel3 = _T_206 & _T_217; // @[el2_dbg.scala 242:96]
  wire  _T_222 = io_dmi_reg_wdata[22:20] != 3'h2; // @[el2_dbg.scala 244:32]
  reg [31:0] data1_reg; // @[el2_lib.scala 499:16]
  wire  _T_226 = |data1_reg[1:0]; // @[el2_dbg.scala 244:106]
  wire  _T_227 = _T_210 & _T_226; // @[el2_dbg.scala 244:87]
  wire  _T_228 = _T_222 | _T_227; // @[el2_dbg.scala 244:46]
  wire  abstractcs_error_sel4 = _T_276 & _T_228; // @[el2_dbg.scala 243:96]
  wire  _T_230 = _T_198 & io_dmi_reg_en; // @[el2_dbg.scala 246:61]
  wire  abstractcs_error_sel5 = _T_230 & io_dmi_reg_wr_en; // @[el2_dbg.scala 246:77]
  wire  _T_231 = abstractcs_error_sel0 | abstractcs_error_sel1; // @[el2_dbg.scala 247:54]
  wire  _T_232 = _T_231 | abstractcs_error_sel2; // @[el2_dbg.scala 247:78]
  wire  _T_233 = _T_232 | abstractcs_error_sel3; // @[el2_dbg.scala 247:102]
  wire  _T_234 = _T_233 | abstractcs_error_sel4; // @[el2_dbg.scala 247:126]
  wire  abstractcs_error_selor = _T_234 | abstractcs_error_sel5; // @[el2_dbg.scala 247:150]
  wire [2:0] _T_236 = abstractcs_error_sel0 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_237 = _T_236 & 3'h1; // @[el2_dbg.scala 248:62]
  wire [2:0] _T_239 = abstractcs_error_sel1 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_240 = _T_239 & 3'h2; // @[el2_dbg.scala 249:37]
  wire [2:0] _T_241 = _T_237 | _T_240; // @[el2_dbg.scala 248:74]
  wire [2:0] _T_243 = abstractcs_error_sel2 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_244 = _T_243 & 3'h3; // @[el2_dbg.scala 250:37]
  wire [2:0] _T_245 = _T_241 | _T_244; // @[el2_dbg.scala 249:49]
  wire [2:0] _T_247 = abstractcs_error_sel3 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_248 = _T_247 & 3'h4; // @[el2_dbg.scala 251:37]
  wire [2:0] _T_249 = _T_245 | _T_248; // @[el2_dbg.scala 250:49]
  wire [2:0] _T_251 = abstractcs_error_sel4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_253 = _T_249 | _T_251; // @[el2_dbg.scala 251:49]
  wire [2:0] _T_255 = abstractcs_error_sel5 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_257 = ~io_dmi_reg_wdata[10:8]; // @[el2_dbg.scala 253:40]
  wire [2:0] _T_258 = _T_255 & _T_257; // @[el2_dbg.scala 253:37]
  wire [2:0] _T_260 = _T_258 & abstractcs_reg[10:8]; // @[el2_dbg.scala 253:75]
  wire [2:0] _T_261 = _T_253 | _T_260; // @[el2_dbg.scala 252:49]
  wire  _T_262 = ~abstractcs_error_selor; // @[el2_dbg.scala 254:15]
  wire [2:0] _T_264 = _T_262 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_266 = _T_264 & abstractcs_reg[10:8]; // @[el2_dbg.scala 254:50]
  wire [2:0] abstractcs_error_din = _T_261 | _T_266; // @[el2_dbg.scala 253:100]
  wire [2:0] _T_311 = _T_362 ? 3'h2 : 3'h1; // @[el2_dbg.scala 296:26]
  wire [2:0] _T_328 = temp[1] ? 3'h0 : 3'h2; // @[el2_dbg.scala 301:26]
  wire  _T_342 = dmstatus_reg[9] & _T_319; // @[el2_dbg.scala 306:43]
  wire  _T_345 = ~temp[3]; // @[el2_dbg.scala 307:33]
  wire  _T_346 = temp[30] & _T_345; // @[el2_dbg.scala 307:31]
  wire [2:0] _T_347 = _T_346 ? 3'h6 : 3'h3; // @[el2_dbg.scala 307:12]
  wire [2:0] _T_349 = temp[31] ? 3'h1 : 3'h0; // @[el2_dbg.scala 308:12]
  wire [2:0] _T_350 = _T_342 ? _T_347 : _T_349; // @[el2_dbg.scala 306:26]
  wire [2:0] _T_380 = _T_383 ? 3'h5 : 3'h4; // @[el2_dbg.scala 317:62]
  wire [2:0] _T_381 = temp[1] ? 3'h0 : _T_380; // @[el2_dbg.scala 317:26]
  wire [2:0] _T_395 = temp[1] ? 3'h0 : 3'h5; // @[el2_dbg.scala 322:26]
  wire [2:0] _GEN_15 = _T_404 ? _T_328 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_20 = _T_393 ? _T_395 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_25 = _T_376 ? _T_381 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_30 = _T_338 ? _T_350 : _GEN_25; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_36 = _T_326 ? _T_328 : _GEN_30; // @[Conditional.scala 39:67]
  wire [2:0] dbg_nxtstate = _T_308 ? _T_311 : _GEN_36; // @[Conditional.scala 40:58]
  wire  _T_365 = dbg_nxtstate == 3'h3; // @[el2_dbg.scala 311:60]
  wire  _T_366 = dbg_state_en & _T_365; // @[el2_dbg.scala 311:44]
  wire  _GEN_17 = _T_404 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_393 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_376 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_338 ? _T_366 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_326 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  abstractcs_busy_wren = _T_308 ? 1'h0 : _GEN_39; // @[Conditional.scala 40:58]
  wire [31:0] command_din = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:20],3'h0,io_dmi_reg_wdata[16:0]}; // @[Cat.scala 29:58]
  reg [31:0] command_reg; // @[Reg.scala 27:20]
  wire  _T_287 = _T_129 & _T_202; // @[el2_dbg.scala 272:58]
  wire  data0_reg_wren0 = _T_287 & _T_277; // @[el2_dbg.scala 272:89]
  wire  _T_289 = dbg_state == 3'h4; // @[el2_dbg.scala 273:59]
  wire  _T_290 = io_core_dbg_cmd_done & _T_289; // @[el2_dbg.scala 273:46]
  wire  _T_292 = ~command_reg[16]; // @[el2_dbg.scala 273:83]
  wire  data0_reg_wren1 = _T_290 & _T_292; // @[el2_dbg.scala 273:81]
  wire  data0_reg_wren = data0_reg_wren0 | data0_reg_wren1; // @[el2_dbg.scala 275:40]
  wire [31:0] _T_294 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_295 = _T_294 & io_dmi_reg_wdata; // @[el2_dbg.scala 276:45]
  wire [31:0] _T_297 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_298 = _T_297 & io_core_dbg_rddata; // @[el2_dbg.scala 276:92]
  wire [31:0] data0_din = _T_295 | _T_298; // @[el2_dbg.scala 276:64]
  reg [31:0] data0_reg; // @[Reg.scala 27:20]
  wire  _T_301 = io_dmi_reg_addr == 7'h5; // @[el2_dbg.scala 281:77]
  wire  _T_302 = _T_129 & _T_301; // @[el2_dbg.scala 281:58]
  wire  data1_reg_wren = _T_302 & _T_277; // @[el2_dbg.scala 281:89]
  wire [31:0] _T_305 = data1_reg_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] data1_din = _T_305 & io_dmi_reg_wdata; // @[el2_dbg.scala 282:44]
  wire  _T_324 = temp[31] & _T_319; // @[el2_dbg.scala 298:45]
  wire  _T_333 = dmcontrol_wren_Q & temp[31]; // @[el2_dbg.scala 303:44]
  wire  _T_336 = _T_333 & _T_319; // @[el2_dbg.scala 303:64]
  wire  _T_367 = dbg_nxtstate == 3'h6; // @[el2_dbg.scala 313:58]
  wire  _T_368 = dbg_state_en & _T_367; // @[el2_dbg.scala 313:42]
  wire  _GEN_14 = _T_413 & _T_336; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_404 ? _T_336 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_393 ? _T_336 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_376 ? _T_336 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_338 & _T_368; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_338 ? _T_336 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_326 ? _T_336 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_326 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [31:0] _T_425 = _T_202 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_426 = _T_425 & data0_reg; // @[el2_dbg.scala 339:71]
  wire [31:0] _T_429 = _T_301 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_430 = _T_429 & data1_reg; // @[el2_dbg.scala 339:122]
  wire [31:0] _T_431 = _T_426 | _T_430; // @[el2_dbg.scala 339:83]
  wire [31:0] _T_434 = _T_131 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_435 = _T_434 & temp; // @[el2_dbg.scala 340:43]
  wire [31:0] _T_436 = _T_431 | _T_435; // @[el2_dbg.scala 339:134]
  wire  _T_437 = io_dmi_reg_addr == 7'h11; // @[el2_dbg.scala 340:86]
  wire [31:0] _T_439 = _T_437 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_440 = _T_439 & dmstatus_reg; // @[el2_dbg.scala 340:99]
  wire [31:0] _T_441 = _T_436 | _T_440; // @[el2_dbg.scala 340:59]
  wire [31:0] _T_444 = _T_198 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_445 = _T_444 & abstractcs_reg; // @[el2_dbg.scala 341:43]
  wire [31:0] _T_446 = _T_441 | _T_445; // @[el2_dbg.scala 340:114]
  wire [31:0] _T_449 = _T_274 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_450 = _T_449 & command_reg; // @[el2_dbg.scala 341:100]
  wire [31:0] _T_451 = _T_446 | _T_450; // @[el2_dbg.scala 341:60]
  wire  _T_452 = io_dmi_reg_addr == 7'h40; // @[el2_dbg.scala 342:30]
  wire [31:0] _T_454 = _T_452 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_455 = _T_454 & haltsum0_reg; // @[el2_dbg.scala 342:43]
  wire [31:0] _T_456 = _T_451 | _T_455; // @[el2_dbg.scala 341:114]
  wire [31:0] _T_459 = _T_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_460 = _T_459 & sbcs_reg; // @[el2_dbg.scala 342:98]
  wire [31:0] _T_461 = _T_456 | _T_460; // @[el2_dbg.scala 342:58]
  wire [31:0] _T_464 = _T_121 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_465 = _T_464 & sbaddress0_reg; // @[el2_dbg.scala 343:43]
  wire [31:0] _T_466 = _T_461 | _T_465; // @[el2_dbg.scala 342:109]
  wire [31:0] _T_469 = _T_130 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_470 = _T_469 & sbdata0_reg; // @[el2_dbg.scala 343:100]
  wire [31:0] _T_471 = _T_466 | _T_470; // @[el2_dbg.scala 343:60]
  wire [31:0] _T_474 = _T_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_475 = _T_474 & sbdata1_reg; // @[el2_dbg.scala 344:43]
  wire [31:0] dmi_reg_rdata_din = _T_471 | _T_475; // @[el2_dbg.scala 343:114]
  wire  _T_477 = _T_28 & reset; // @[el2_dbg.scala 346:62]
  reg [31:0] _T_480; // @[Reg.scala 27:20]
  wire  _T_482 = command_reg[31:24] == 8'h2; // @[el2_dbg.scala 355:47]
  wire [30:0] _T_484 = {data1_reg[31:2],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_486 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_489 = dbg_state == 3'h3; // @[el2_dbg.scala 357:35]
  wire  _T_492 = ~_T_383; // @[el2_dbg.scala 357:60]
  wire  _T_493 = _T_489 & _T_492; // @[el2_dbg.scala 357:58]
  wire  _T_501 = command_reg[15:12] == 4'h0; // @[el2_dbg.scala 359:102]
  wire [1:0] _T_502 = {1'h0,_T_501}; // @[Cat.scala 29:58]
  wire  _T_541 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[el2_dbg.scala 397:48]
  wire  _T_572 = sb_state == 4'h4; // @[el2_dbg.scala 438:35]
  wire  _T_573 = sb_state == 4'h5; // @[el2_dbg.scala 438:70]
  wire  _T_579 = sb_state == 4'h6; // @[el2_dbg.scala 449:69]
  wire [63:0] _T_589 = {sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_590 = _T_655 & _T_589; // @[el2_dbg.scala 450:59]
  wire [63:0] _T_597 = {sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_598 = _T_665 & _T_597; // @[el2_dbg.scala 450:132]
  wire [63:0] _T_599 = _T_590 | _T_598; // @[el2_dbg.scala 450:90]
  wire [63:0] _T_605 = {sbdata0_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_606 = _T_676 & _T_605; // @[el2_dbg.scala 451:45]
  wire [63:0] _T_607 = _T_599 | _T_606; // @[el2_dbg.scala 450:162]
  wire [63:0] _T_614 = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_615 = _T_687 & _T_614; // @[el2_dbg.scala 451:119]
  wire [7:0] _T_620 = _T_60 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_622 = 15'h1 << sbaddress0_reg[2:0]; // @[el2_dbg.scala 453:76]
  wire [14:0] _GEN_122 = {{7'd0}, _T_620}; // @[el2_dbg.scala 453:61]
  wire [14:0] _T_623 = _GEN_122 & _T_622; // @[el2_dbg.scala 453:61]
  wire [7:0] _T_627 = _T_45 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_629 = {sbaddress0_reg[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_630 = 15'h3 << _T_629; // @[el2_dbg.scala 454:59]
  wire [14:0] _GEN_123 = {{7'd0}, _T_627}; // @[el2_dbg.scala 454:44]
  wire [14:0] _T_631 = _GEN_123 & _T_630; // @[el2_dbg.scala 454:44]
  wire [14:0] _T_632 = _T_623 | _T_631; // @[el2_dbg.scala 453:101]
  wire [7:0] _T_636 = _T_49 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_638 = {sbaddress0_reg[2],1'h0}; // @[Cat.scala 29:58]
  wire [10:0] _T_639 = 11'hf << _T_638; // @[el2_dbg.scala 455:59]
  wire [10:0] _GEN_124 = {{3'd0}, _T_636}; // @[el2_dbg.scala 455:44]
  wire [10:0] _T_640 = _GEN_124 & _T_639; // @[el2_dbg.scala 455:44]
  wire [14:0] _GEN_125 = {{4'd0}, _T_640}; // @[el2_dbg.scala 454:97]
  wire [14:0] _T_641 = _T_632 | _GEN_125; // @[el2_dbg.scala 454:97]
  wire [7:0] _T_645 = _T_55 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_126 = {{7'd0}, _T_645}; // @[el2_dbg.scala 455:95]
  wire [14:0] _T_647 = _T_641 | _GEN_126; // @[el2_dbg.scala 455:95]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 468:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 468:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_2 ( // @[el2_lib.scala 493:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_3 ( // @[el2_lib.scala 493:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_4 ( // @[el2_lib.scala 493:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr_2 rvclkhdr_5 ( // @[el2_lib.scala 493:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  assign io_dbg_cmd_addr = _T_482 ? {{1'd0}, _T_484} : _T_486; // @[el2_dbg.scala 355:19]
  assign io_dbg_cmd_wrdata = data0_reg; // @[el2_dbg.scala 356:21]
  assign io_dbg_cmd_valid = _T_493 & io_dma_dbg_ready; // @[el2_dbg.scala 357:20]
  assign io_dbg_cmd_write = command_reg[16]; // @[el2_dbg.scala 358:20]
  assign io_dbg_cmd_type = _T_482 ? 2'h2 : _T_502; // @[el2_dbg.scala 359:19]
  assign io_dbg_cmd_size = command_reg[21:20]; // @[el2_dbg.scala 360:19]
  assign io_dbg_core_rst_l = ~temp[1]; // @[el2_dbg.scala 131:21]
  assign io_dbg_dma_bubble = _T_493 | _T_289; // @[el2_dbg.scala 361:21]
  assign io_dbg_halt_req = _T_308 ? _T_324 : _GEN_38; // @[el2_dbg.scala 292:19 el2_dbg.scala 298:23 el2_dbg.scala 303:23 el2_dbg.scala 314:23 el2_dbg.scala 319:23 el2_dbg.scala 324:23 el2_dbg.scala 331:23 el2_dbg.scala 336:23]
  assign io_dbg_resume_req = _T_308 ? 1'h0 : _GEN_41; // @[el2_dbg.scala 293:21 el2_dbg.scala 313:25]
  assign io_dmi_reg_rdata = _T_480; // @[el2_dbg.scala 351:20]
  assign io_sb_axi_awvalid = _T_572 | _T_573; // @[el2_dbg.scala 438:21]
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
  assign io_sb_axi_wvalid = _T_572 | _T_579; // @[el2_dbg.scala 449:20]
  assign io_sb_axi_wdata = _T_607 | _T_615; // @[el2_dbg.scala 450:19]
  assign io_sb_axi_wstrb = _T_647[7:0]; // @[el2_dbg.scala 453:19]
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
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 469:17]
  assign rvclkhdr_io_en = _T_3 | io_clk_override; // @[el2_lib.scala 470:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 471:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 469:17]
  assign rvclkhdr_1_io_en = _T_6 | io_clk_override; // @[el2_lib.scala 470:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 471:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 495:18]
  assign rvclkhdr_2_io_en = sbdata0wr_access | sbdata0_reg_wren1; // @[el2_lib.scala 496:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 497:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 495:18]
  assign rvclkhdr_3_io_en = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[el2_lib.scala 496:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 497:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 495:18]
  assign rvclkhdr_4_io_en = _T_122 | sbaddress0_reg_wren1; // @[el2_lib.scala 496:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 497:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 495:18]
  assign rvclkhdr_5_io_en = _T_302 & _T_277; // @[el2_lib.scala 496:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 497:24]
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
  _T_480 = _RAND_21[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk) begin
    if (_T_477) begin
      dbg_state <= 3'h0;
    end else if (dbg_state_en) begin
      if (_T_308) begin
        if (_T_362) begin
          dbg_state <= 3'h2;
        end else begin
          dbg_state <= 3'h1;
        end
      end else if (_T_326) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else begin
          dbg_state <= 3'h2;
        end
      end else if (_T_338) begin
        if (_T_342) begin
          if (_T_346) begin
            dbg_state <= 3'h6;
          end else begin
            dbg_state <= 3'h3;
          end
        end else if (temp[31]) begin
          dbg_state <= 3'h1;
        end else begin
          dbg_state <= 3'h0;
        end
      end else if (_T_376) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else if (_T_383) begin
          dbg_state <= 3'h5;
        end else begin
          dbg_state <= 3'h4;
        end
      end else if (_T_393) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else begin
          dbg_state <= 3'h5;
        end
      end else if (_T_404) begin
        if (temp[1]) begin
          dbg_state <= 3'h0;
        end else begin
          dbg_state <= 3'h2;
        end
      end else begin
        dbg_state <= 3'h0;
      end
    end
    if (_T_28) begin
      dm_temp <= 4'h0;
    end else if (dmcontrol_wren) begin
      dm_temp <= _T_138;
    end
    if (io_dbg_rst_l) begin
      dm_temp_0 <= 1'h0;
    end else if (dmcontrol_wren) begin
      dm_temp_0 <= io_dmi_reg_wdata[0];
    end
    if (_T_28) begin
      dmstatus_havereset <= 1'h0;
    end else if (dmstatus_havereset_wren) begin
      dmstatus_havereset <= _T_194;
    end
    if (_T_28) begin
      dmstatus_resumeack <= 1'h0;
    end else if (dmstatus_resumeack_wren) begin
      dmstatus_resumeack <= _T_168;
    end
    if (_T_28) begin
      dmstatus_halted <= 1'h0;
    end else begin
      dmstatus_halted <= _T_191;
    end
    if (_T_28) begin
      dmcontrol_wren_Q <= 1'h0;
    end else begin
      dmcontrol_wren_Q <= dmcontrol_wren;
    end
    if (_T_28) begin
      abs_temp_12 <= 1'h0;
    end else if (abstractcs_busy_wren) begin
      if (_T_308) begin
        abs_temp_12 <= 1'h0;
      end else if (_T_326) begin
        abs_temp_12 <= 1'h0;
      end else begin
        abs_temp_12 <= _T_338;
      end
    end
    if (_T_28) begin
      abs_temp_10_8 <= 3'h0;
    end else begin
      abs_temp_10_8 <= abstractcs_error_din;
    end
    if (_T_28) begin
      _T_480 <= 32'h0;
    end else if (io_dmi_reg_en) begin
      _T_480 <= dmi_reg_rdata_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk) begin
    if (_T_28) begin
      sb_state <= 4'h0;
    end else if (sb_state_en) begin
      if (sbcs_sbbusy_din) begin
        if (sbdata0wr_access) begin
          sb_state <= 4'h2;
        end else begin
          sb_state <= 4'h1;
        end
      end else if (_T_524) begin
        if (_T_529) begin
          sb_state <= 4'h9;
        end else begin
          sb_state <= 4'h3;
        end
      end else if (_T_531) begin
        if (_T_529) begin
          sb_state <= 4'h9;
        end else begin
          sb_state <= 4'h4;
        end
      end else if (_T_538) begin
        sb_state <= 4'h7;
      end else if (_T_540) begin
        if (_T_541) begin
          sb_state <= 4'h8;
        end else if (sb_bus_cmd_write_data) begin
          sb_state <= 4'h5;
        end else begin
          sb_state <= 4'h6;
        end
      end else if (_T_546) begin
        sb_state <= 4'h8;
      end else if (_T_548) begin
        sb_state <= 4'h8;
      end else if (_T_550) begin
        sb_state <= 4'h9;
      end else if (_T_553) begin
        sb_state <= 4'h9;
      end else begin
        sb_state <= 4'h0;
      end
    end
    if (_T_28) begin
      temp_sbcs_22 <= 1'h0;
    end else if (sbcs_sbbusyerror_wren) begin
      temp_sbcs_22 <= sbcs_sbbusyerror_din;
    end
    if (_T_28) begin
      temp_sbcs_21 <= 1'h0;
    end else if (sbcs_sbbusy_wren) begin
      temp_sbcs_21 <= sbcs_sbbusy_din;
    end
    if (_T_28) begin
      temp_sbcs_20 <= 1'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_20 <= io_dmi_reg_wdata[20];
    end
    if (_T_28) begin
      temp_sbcs_19_15 <= 5'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_19_15 <= io_dmi_reg_wdata[19:15];
    end
    if (_T_28) begin
      temp_sbcs_14_12 <= 3'h0;
    end else if (sbcs_sberror_wren) begin
      if (sbcs_sbbusy_din) begin
        temp_sbcs_14_12 <= _T_523;
      end else if (_T_524) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_531) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_538) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_540) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_546) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_548) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_550) begin
        temp_sbcs_14_12 <= 3'h2;
      end else if (_T_553) begin
        temp_sbcs_14_12 <= 3'h2;
      end else begin
        temp_sbcs_14_12 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk) begin
    if (_T_28) begin
      sbaddress0_reg <= 32'h0;
    end else begin
      sbaddress0_reg <= sbaddress0_reg_din;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk) begin
    if (_T_28) begin
      sbdata0_reg <= 32'h0;
    end else begin
      sbdata0_reg <= sbdata0_din;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk) begin
    if (_T_28) begin
      sbdata1_reg <= 32'h0;
    end else begin
      sbdata1_reg <= sbdata1_din;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk) begin
    if (_T_28) begin
      data1_reg <= 32'h0;
    end else begin
      data1_reg <= data1_din;
    end
  end
  always @(posedge clock) begin
    if (_T_28) begin
      command_reg <= 32'h0;
    end else if (command_wren) begin
      command_reg <= command_din;
    end
    if (_T_28) begin
      data0_reg <= 32'h0;
    end else if (data0_reg_wren) begin
      data0_reg <= data0_din;
    end
  end
endmodule
