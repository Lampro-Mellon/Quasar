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
module dbg(
  input         clock,
  input         reset,
  output [1:0]  io_dbg_cmd_size,
  output        io_dbg_core_rst_l,
  input  [31:0] io_core_dbg_rddata,
  input         io_core_dbg_cmd_done,
  input         io_core_dbg_cmd_fail,
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
  input         io_sb_axi_aw_ready,
  output        io_sb_axi_aw_valid,
  output        io_sb_axi_aw_bits_id,
  output [31:0] io_sb_axi_aw_bits_addr,
  output [3:0]  io_sb_axi_aw_bits_region,
  output [7:0]  io_sb_axi_aw_bits_len,
  output [2:0]  io_sb_axi_aw_bits_size,
  output [1:0]  io_sb_axi_aw_bits_burst,
  output        io_sb_axi_aw_bits_lock,
  output [3:0]  io_sb_axi_aw_bits_cache,
  output [2:0]  io_sb_axi_aw_bits_prot,
  output [3:0]  io_sb_axi_aw_bits_qos,
  input         io_sb_axi_w_ready,
  output        io_sb_axi_w_valid,
  output [63:0] io_sb_axi_w_bits_data,
  output [7:0]  io_sb_axi_w_bits_strb,
  output        io_sb_axi_w_bits_last,
  output        io_sb_axi_b_ready,
  input         io_sb_axi_b_valid,
  input  [1:0]  io_sb_axi_b_bits_resp,
  input         io_sb_axi_b_bits_id,
  input         io_sb_axi_ar_ready,
  output        io_sb_axi_ar_valid,
  output        io_sb_axi_ar_bits_id,
  output [31:0] io_sb_axi_ar_bits_addr,
  output [3:0]  io_sb_axi_ar_bits_region,
  output [7:0]  io_sb_axi_ar_bits_len,
  output [2:0]  io_sb_axi_ar_bits_size,
  output [1:0]  io_sb_axi_ar_bits_burst,
  output        io_sb_axi_ar_bits_lock,
  output [3:0]  io_sb_axi_ar_bits_cache,
  output [2:0]  io_sb_axi_ar_bits_prot,
  output [3:0]  io_sb_axi_ar_bits_qos,
  output        io_sb_axi_r_ready,
  input         io_sb_axi_r_valid,
  input         io_sb_axi_r_bits_id,
  input  [63:0] io_sb_axi_r_bits_data,
  input  [1:0]  io_sb_axi_r_bits_resp,
  input         io_sb_axi_r_bits_last,
  output        io_dbg_dec_dbg_ib_dbg_cmd_valid,
  output        io_dbg_dec_dbg_ib_dbg_cmd_write,
  output [1:0]  io_dbg_dec_dbg_ib_dbg_cmd_type,
  output [31:0] io_dbg_dec_dbg_ib_dbg_cmd_addr,
  output [1:0]  io_dbg_dec_dbg_dctl_dbg_cmd_wrdata,
  output        io_dbg_dma_dbg_ib_dbg_cmd_valid,
  output        io_dbg_dma_dbg_ib_dbg_cmd_write,
  output [1:0]  io_dbg_dma_dbg_ib_dbg_cmd_type,
  output [31:0] io_dbg_dma_dbg_ib_dbg_cmd_addr,
  output [1:0]  io_dbg_dma_dbg_dctl_dbg_cmd_wrdata,
  output        io_dbg_dma_io_dbg_dma_bubble,
  input         io_dbg_dma_io_dma_dbg_ready,
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
  wire  _T = dbg_state != 3'h0; // @[dbg.scala 95:51]
  wire  _T_1 = io_dmi_reg_en | _T; // @[dbg.scala 95:38]
  wire  _T_309 = 3'h0 == dbg_state; // @[Conditional.scala 37:30]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [31:0] temp = {dm_temp[3:2],1'h0,dm_temp[1],26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire  _T_314 = ~io_dec_tlu_debug_mode; // @[dbg.scala 266:45]
  wire  _T_315 = temp[31] & _T_314; // @[dbg.scala 266:43]
  reg  dmstatus_havereset; // @[Reg.scala 27:20]
  wire [1:0] _T_150 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  dmstatus_resumeack; // @[Reg.scala 27:20]
  wire [1:0] _T_152 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_183 = ~reset; // @[dbg.scala 191:43]
  wire  dmstatus_unavail = temp[1] | _T_183; // @[dbg.scala 191:41]
  wire [1:0] _T_154 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  reg  dmstatus_halted; // @[dbg.scala 198:12]
  wire  _T_186 = dmstatus_unavail | dmstatus_halted; // @[dbg.scala 192:42]
  wire  dmstatus_running = ~_T_186; // @[dbg.scala 192:23]
  wire [1:0] _T_156 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_158 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [31:0] dmstatus_reg = {12'h0,_T_150,_T_152,2'h0,_T_154,_T_156,_T_158,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire  _T_317 = _T_315 | dmstatus_reg[9]; // @[dbg.scala 266:69]
  wire  _T_318 = _T_317 | io_dec_tlu_mpc_halted_only; // @[dbg.scala 266:87]
  wire  _T_320 = ~temp[1]; // @[dbg.scala 266:119]
  wire  _T_321 = _T_318 & _T_320; // @[dbg.scala 266:117]
  wire  _T_327 = 3'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_332 = dmstatus_reg[9] | temp[1]; // @[dbg.scala 271:39]
  wire  _T_339 = 3'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_354 = dmstatus_reg[9] & temp[30]; // @[dbg.scala 278:39]
  wire  _T_356 = ~temp[31]; // @[dbg.scala 278:61]
  wire  _T_357 = _T_354 & _T_356; // @[dbg.scala 278:59]
  reg  dmcontrol_wren_Q; // @[dbg.scala 181:12]
  wire  _T_358 = _T_357 & dmcontrol_wren_Q; // @[dbg.scala 278:80]
  wire  _T_275 = io_dmi_reg_addr == 7'h17; // @[dbg.scala 235:39]
  wire  _T_276 = _T_275 & io_dmi_reg_en; // @[dbg.scala 235:52]
  wire  _T_277 = _T_276 & io_dmi_reg_wr_en; // @[dbg.scala 235:68]
  wire  _T_278 = dbg_state == 3'h2; // @[dbg.scala 235:100]
  wire  command_wren = _T_277 & _T_278; // @[dbg.scala 235:87]
  wire  _T_359 = _T_358 | command_wren; // @[dbg.scala 278:99]
  wire  _T_361 = _T_359 | temp[1]; // @[dbg.scala 278:114]
  wire  _T_363 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[dbg.scala 279:46]
  wire  _T_364 = ~_T_363; // @[dbg.scala 279:28]
  wire  _T_365 = _T_361 | _T_364; // @[dbg.scala 279:26]
  wire  _T_377 = 3'h3 == dbg_state; // @[Conditional.scala 37:30]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[dbg.scala 230:12]
  wire [31:0] abstractcs_reg = {19'h0,abs_temp_12,1'h0,abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire  _T_384 = |abstractcs_reg[10:8]; // @[dbg.scala 287:79]
  wire  _T_385 = io_dbg_dec_dbg_ib_dbg_cmd_valid | _T_384; // @[dbg.scala 287:55]
  wire  _T_387 = _T_385 | temp[1]; // @[dbg.scala 287:83]
  wire  _T_394 = 3'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_398 = io_core_dbg_cmd_done | temp[1]; // @[dbg.scala 292:44]
  wire  _T_405 = 3'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_414 = 3'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_417 = dmstatus_reg[17] | temp[1]; // @[dbg.scala 304:40]
  wire  _GEN_13 = _T_414 & _T_417; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_405 | _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_394 ? _T_398 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_377 ? _T_387 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_339 ? _T_365 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_327 ? _T_332 : _GEN_31; // @[Conditional.scala 39:67]
  wire  dbg_state_en = _T_309 ? _T_321 : _GEN_37; // @[Conditional.scala 40:58]
  wire  _T_2 = _T_1 | dbg_state_en; // @[dbg.scala 95:69]
  wire  _T_3 = _T_2 | io_dec_tlu_dbg_halted; // @[dbg.scala 95:84]
  reg [3:0] sb_state; // @[Reg.scala 27:20]
  wire  sbcs_sbbusy_din = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_130 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[dbg.scala 165:40]
  wire  _T_131 = io_dmi_reg_addr == 7'h3c; // @[dbg.scala 165:78]
  wire  sbdata0wr_access = _T_130 & _T_131; // @[dbg.scala 165:59]
  wire  _T_125 = ~io_dmi_reg_wr_en; // @[dbg.scala 164:45]
  wire  _T_126 = io_dmi_reg_en & _T_125; // @[dbg.scala 164:43]
  wire  _T_128 = _T_126 & _T_131; // @[dbg.scala 164:63]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire [31:0] sbcs_reg = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20,temp_sbcs_19_15,temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire  sbreadondata_access = _T_128 & sbcs_reg[15]; // @[dbg.scala 164:95]
  wire  _T_516 = sbdata0wr_access | sbreadondata_access; // @[dbg.scala 343:39]
  wire  _T_122 = io_dmi_reg_addr == 7'h39; // @[dbg.scala 163:81]
  wire  _T_123 = _T_130 & _T_122; // @[dbg.scala 163:62]
  wire  sbreadonaddr_access = _T_123 & sbcs_reg[20]; // @[dbg.scala 163:94]
  wire  _T_517 = _T_516 | sbreadonaddr_access; // @[dbg.scala 343:61]
  wire  _T_525 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_46 = sbcs_reg[19:17] == 3'h1; // @[dbg.scala 127:42]
  reg [31:0] sbaddress0_reg; // @[el2_lib.scala 514:16]
  wire  _T_48 = _T_46 & sbaddress0_reg[0]; // @[dbg.scala 127:56]
  wire  _T_50 = sbcs_reg[19:17] == 3'h2; // @[dbg.scala 128:23]
  wire  _T_52 = |sbaddress0_reg[1:0]; // @[dbg.scala 128:60]
  wire  _T_53 = _T_50 & _T_52; // @[dbg.scala 128:37]
  wire  _T_54 = _T_48 | _T_53; // @[dbg.scala 127:76]
  wire  _T_56 = sbcs_reg[19:17] == 3'h3; // @[dbg.scala 129:23]
  wire  _T_58 = |sbaddress0_reg[2:0]; // @[dbg.scala 129:60]
  wire  _T_59 = _T_56 & _T_58; // @[dbg.scala 129:37]
  wire  sbcs_unaligned = _T_54 | _T_59; // @[dbg.scala 128:64]
  wire  _T_528 = io_dbg_bus_clk_en | sbcs_unaligned; // @[dbg.scala 351:40]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[dbg.scala 131:35]
  wire  _T_529 = _T_528 | sbcs_illegal_size; // @[dbg.scala 351:57]
  wire  _T_532 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_539 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_cmd_read = io_sb_axi_ar_valid & io_sb_axi_ar_ready; // @[dbg.scala 401:41]
  wire  _T_540 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[dbg.scala 363:38]
  wire  _T_541 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_cmd_write_addr = io_sb_axi_aw_valid & io_sb_axi_aw_ready; // @[dbg.scala 402:47]
  wire  sb_bus_cmd_write_data = io_sb_axi_w_valid & io_sb_axi_w_ready; // @[dbg.scala 403:46]
  wire  _T_545 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[dbg.scala 367:45]
  wire  _T_546 = _T_545 & io_dbg_bus_clk_en; // @[dbg.scala 367:70]
  wire  _T_547 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_548 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[dbg.scala 371:44]
  wire  _T_549 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_550 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[dbg.scala 375:44]
  wire  _T_551 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_rsp_read = io_sb_axi_r_valid & io_sb_axi_r_ready; // @[dbg.scala 404:40]
  wire  _T_552 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[dbg.scala 379:38]
  wire  _T_554 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  sb_bus_rsp_write = io_sb_axi_b_valid & io_sb_axi_b_ready; // @[dbg.scala 405:41]
  wire  _T_555 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[dbg.scala 385:39]
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
  wire  _T_4 = io_dmi_reg_en | sb_state_en; // @[dbg.scala 96:37]
  wire  _T_5 = sb_state != 4'h0; // @[dbg.scala 96:63]
  wire  _T_6 = _T_4 | _T_5; // @[dbg.scala 96:51]
  wire  _T_9 = temp[0] | io_scan_mode; // @[dbg.scala 99:64]
  wire  dbg_dm_rst_l = io_dbg_rst_l & _T_9; // @[dbg.scala 99:44]
  wire  _T_13 = io_dmi_reg_addr == 7'h38; // @[dbg.scala 101:36]
  wire  _T_14 = _T_13 & io_dmi_reg_en; // @[dbg.scala 101:49]
  wire  _T_15 = _T_14 & io_dmi_reg_wr_en; // @[dbg.scala 101:65]
  wire  _T_16 = sb_state == 4'h0; // @[dbg.scala 101:96]
  wire  sbcs_wren = _T_15 & _T_16; // @[dbg.scala 101:84]
  wire  _T_18 = sbcs_wren & io_dmi_reg_wdata[22]; // @[dbg.scala 102:42]
  wire  _T_20 = _T_5 & io_dmi_reg_en; // @[dbg.scala 102:102]
  wire  _T_23 = _T_122 | _T_131; // @[dbg.scala 103:36]
  wire  _T_24 = io_dmi_reg_addr == 7'h3d; // @[dbg.scala 103:87]
  wire  _T_25 = _T_23 | _T_24; // @[dbg.scala 103:68]
  wire  _T_26 = _T_20 & _T_25; // @[dbg.scala 102:118]
  wire  sbcs_sbbusyerror_wren = _T_18 | _T_26; // @[dbg.scala 102:66]
  wire  sbcs_sbbusyerror_din = ~_T_18; // @[dbg.scala 105:31]
  wire  _T_29 = ~dbg_dm_rst_l; // @[dbg.scala 106:53]
  wire  _GEN_58 = _T_554 ? 1'h0 : _T_557; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_551 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_549 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_547 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_541 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_539 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_100 = _T_532 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_525 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67]
  wire  sbcs_sbbusy_wren = sbcs_sbbusy_din ? sb_state_en : _GEN_107; // @[Conditional.scala 40:58]
  wire  _T_522 = io_dmi_reg_wdata[14:12] == 3'h0; // @[dbg.scala 347:27]
  wire [2:0] _GEN_118 = {{2'd0}, _T_522}; // @[dbg.scala 347:53]
  wire [2:0] _T_524 = _GEN_118 & sbcs_reg[14:12]; // @[dbg.scala 347:53]
  wire  _T_519 = |io_dmi_reg_wdata[14:12]; // @[dbg.scala 346:65]
  wire  _T_520 = sbcs_wren & _T_519; // @[dbg.scala 346:38]
  wire  _T_530 = sbcs_unaligned | sbcs_illegal_size; // @[dbg.scala 352:43]
  wire  _T_567 = |io_sb_axi_r_bits_resp; // @[dbg.scala 406:69]
  wire  _T_568 = sb_bus_rsp_read & _T_567; // @[dbg.scala 406:39]
  wire  _T_570 = |io_sb_axi_b_bits_resp; // @[dbg.scala 406:122]
  wire  _T_571 = sb_bus_rsp_write & _T_570; // @[dbg.scala 406:92]
  wire  sb_bus_rsp_error = _T_568 | _T_571; // @[dbg.scala 406:73]
  wire  _T_553 = sb_state_en & sb_bus_rsp_error; // @[dbg.scala 380:40]
  wire  _GEN_56 = _T_554 & _T_553; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_551 ? _T_553 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_549 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_547 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_541 ? 1'h0 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_539 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_532 ? _T_530 : _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_105 = _T_525 ? _T_530 : _GEN_98; // @[Conditional.scala 39:67]
  wire  sbcs_sberror_wren = sbcs_sbbusy_din ? _T_520 : _GEN_105; // @[Conditional.scala 40:58]
  wire  _T_61 = sbcs_reg[19:17] == 3'h0; // @[dbg.scala 132:51]
  wire [3:0] _T_63 = _T_61 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_64 = _T_63 & 4'h1; // @[dbg.scala 132:64]
  wire [3:0] _T_68 = _T_46 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_69 = _T_68 & 4'h2; // @[dbg.scala 132:117]
  wire [3:0] _T_70 = _T_64 | _T_69; // @[dbg.scala 132:76]
  wire [3:0] _T_74 = _T_50 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_75 = _T_74 & 4'h4; // @[dbg.scala 133:44]
  wire [3:0] _T_76 = _T_70 | _T_75; // @[dbg.scala 132:129]
  wire [3:0] _T_80 = _T_56 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_81 = _T_80 & 4'h8; // @[dbg.scala 133:97]
  wire [3:0] sbaddress0_incr = _T_76 | _T_81; // @[dbg.scala 133:56]
  wire  _T_84 = sb_state == 4'h7; // @[dbg.scala 136:37]
  wire  _T_85 = _T_84 & sb_state_en; // @[dbg.scala 136:60]
  wire  _T_86 = ~sbcs_sberror_wren; // @[dbg.scala 136:76]
  wire  sbdata0_reg_wren1 = _T_85 & _T_86; // @[dbg.scala 136:74]
  wire  sbdata1_reg_wren0 = _T_130 & _T_24; // @[dbg.scala 138:60]
  wire [31:0] _T_93 = sbdata0wr_access ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_94 = _T_93 & io_dmi_reg_wdata; // @[dbg.scala 141:49]
  wire [31:0] _T_96 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_656 = _T_61 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _GEN_119 = {{1'd0}, sbaddress0_reg[2:0]}; // @[dbg.scala 441:99]
  wire [6:0] _T_659 = 4'h8 * _GEN_119; // @[dbg.scala 441:99]
  wire [63:0] _T_660 = io_sb_axi_r_bits_data >> _T_659; // @[dbg.scala 441:92]
  wire [63:0] _T_661 = _T_660 & 64'hff; // @[dbg.scala 441:123]
  wire [63:0] _T_662 = _T_656 & _T_661; // @[dbg.scala 441:59]
  wire [63:0] _T_666 = _T_46 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _GEN_120 = {{3'd0}, sbaddress0_reg[2:1]}; // @[dbg.scala 442:86]
  wire [6:0] _T_669 = 5'h10 * _GEN_120; // @[dbg.scala 442:86]
  wire [63:0] _T_670 = io_sb_axi_r_bits_data >> _T_669; // @[dbg.scala 442:78]
  wire [63:0] _T_671 = _T_670 & 64'hffff; // @[dbg.scala 442:110]
  wire [63:0] _T_672 = _T_666 & _T_671; // @[dbg.scala 442:45]
  wire [63:0] _T_673 = _T_662 | _T_672; // @[dbg.scala 441:140]
  wire [63:0] _T_677 = _T_50 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [5:0] _GEN_121 = {{5'd0}, sbaddress0_reg[2]}; // @[dbg.scala 443:86]
  wire [6:0] _T_680 = 6'h20 * _GEN_121; // @[dbg.scala 443:86]
  wire [63:0] _T_681 = io_sb_axi_r_bits_data >> _T_680; // @[dbg.scala 443:78]
  wire [63:0] _T_682 = _T_681 & 64'hffffffff; // @[dbg.scala 443:107]
  wire [63:0] _T_683 = _T_677 & _T_682; // @[dbg.scala 443:45]
  wire [63:0] _T_684 = _T_673 | _T_683; // @[dbg.scala 442:129]
  wire [63:0] _T_688 = _T_56 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_690 = _T_688 & io_sb_axi_r_bits_data; // @[dbg.scala 444:45]
  wire [63:0] sb_bus_rdata = _T_684 | _T_690; // @[dbg.scala 443:131]
  wire [31:0] _T_98 = _T_96 & sb_bus_rdata[31:0]; // @[dbg.scala 142:33]
  wire [31:0] sbdata0_din = _T_94 | _T_98; // @[dbg.scala 141:68]
  wire [31:0] _T_100 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_101 = _T_100 & io_dmi_reg_wdata; // @[dbg.scala 144:49]
  wire [31:0] _T_105 = _T_96 & sb_bus_rdata[63:32]; // @[dbg.scala 145:33]
  wire [31:0] sbdata1_din = _T_101 | _T_105; // @[dbg.scala 144:68]
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
  wire [31:0] _T_112 = _T_111 & io_dmi_reg_wdata; // @[dbg.scala 157:59]
  wire [31:0] _T_114 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_115 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_117 = sbaddress0_reg + _T_115; // @[dbg.scala 158:54]
  wire [31:0] _T_118 = _T_114 & _T_117; // @[dbg.scala 158:36]
  wire [31:0] sbaddress0_reg_din = _T_112 | _T_118; // @[dbg.scala 157:78]
  wire  _T_132 = io_dmi_reg_addr == 7'h10; // @[dbg.scala 166:41]
  wire  _T_133 = _T_132 & io_dmi_reg_en; // @[dbg.scala 166:54]
  wire  dmcontrol_wren = _T_133 & io_dmi_reg_wr_en; // @[dbg.scala 166:70]
  wire [3:0] _T_139 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  wire  _T_168 = dbg_state == 3'h6; // @[dbg.scala 186:44]
  wire  _T_169 = _T_168 & io_dec_tlu_resume_ack; // @[dbg.scala 186:66]
  wire  _T_171 = ~temp[30]; // @[dbg.scala 186:113]
  wire  _T_172 = dmstatus_resumeack & _T_171; // @[dbg.scala 186:111]
  wire  dmstatus_resumeack_wren = _T_169 | _T_172; // @[dbg.scala 186:90]
  wire  _T_176 = _T_132 & io_dmi_reg_wdata[1]; // @[dbg.scala 188:63]
  wire  _T_177 = _T_176 & io_dmi_reg_en; // @[dbg.scala 188:85]
  wire  dmstatus_havereset_wren = _T_177 & io_dmi_reg_wr_en; // @[dbg.scala 188:101]
  wire  _T_180 = _T_132 & io_dmi_reg_wdata[28]; // @[dbg.scala 189:62]
  wire  _T_181 = _T_180 & io_dmi_reg_en; // @[dbg.scala 189:85]
  wire  dmstatus_havereset_rst = _T_181 & io_dmi_reg_wr_en; // @[dbg.scala 189:101]
  wire  _T_191 = ~io_dec_tlu_mpc_halted_only; // @[dbg.scala 198:37]
  wire  _T_192 = io_dec_tlu_dbg_halted & _T_191; // @[dbg.scala 198:35]
  wire  _T_195 = ~dmstatus_havereset_rst; // @[dbg.scala 202:15]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire  _T_198 = abstractcs_reg[12] & io_dmi_reg_en; // @[dbg.scala 208:50]
  wire  _T_199 = io_dmi_reg_addr == 7'h16; // @[dbg.scala 208:106]
  wire  _T_201 = _T_199 | _T_275; // @[dbg.scala 208:119]
  wire  _T_202 = io_dmi_reg_wr_en & _T_201; // @[dbg.scala 208:86]
  wire  _T_203 = io_dmi_reg_addr == 7'h4; // @[dbg.scala 208:171]
  wire  _T_204 = _T_202 | _T_203; // @[dbg.scala 208:152]
  wire  abstractcs_error_sel0 = _T_198 & _T_204; // @[dbg.scala 208:66]
  wire  _T_207 = _T_130 & _T_275; // @[dbg.scala 209:64]
  wire  _T_209 = io_dmi_reg_wdata[31:24] == 8'h0; // @[dbg.scala 209:126]
  wire  _T_211 = io_dmi_reg_wdata[31:24] == 8'h2; // @[dbg.scala 209:163]
  wire  _T_212 = _T_209 | _T_211; // @[dbg.scala 209:135]
  wire  _T_213 = ~_T_212; // @[dbg.scala 209:98]
  wire  abstractcs_error_sel1 = _T_207 & _T_213; // @[dbg.scala 209:96]
  wire  abstractcs_error_sel2 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[dbg.scala 210:52]
  wire  _T_218 = ~dmstatus_reg[9]; // @[dbg.scala 211:98]
  wire  abstractcs_error_sel3 = _T_207 & _T_218; // @[dbg.scala 211:96]
  wire  _T_223 = io_dmi_reg_wdata[22:20] != 3'h2; // @[dbg.scala 213:32]
  reg [31:0] data1_reg; // @[el2_lib.scala 514:16]
  wire  _T_227 = |data1_reg[1:0]; // @[dbg.scala 213:106]
  wire  _T_228 = _T_211 & _T_227; // @[dbg.scala 213:87]
  wire  _T_229 = _T_223 | _T_228; // @[dbg.scala 213:46]
  wire  abstractcs_error_sel4 = _T_277 & _T_229; // @[dbg.scala 212:96]
  wire  _T_231 = _T_199 & io_dmi_reg_en; // @[dbg.scala 215:61]
  wire  abstractcs_error_sel5 = _T_231 & io_dmi_reg_wr_en; // @[dbg.scala 215:77]
  wire  _T_232 = abstractcs_error_sel0 | abstractcs_error_sel1; // @[dbg.scala 216:54]
  wire  _T_233 = _T_232 | abstractcs_error_sel2; // @[dbg.scala 216:78]
  wire  _T_234 = _T_233 | abstractcs_error_sel3; // @[dbg.scala 216:102]
  wire  _T_235 = _T_234 | abstractcs_error_sel4; // @[dbg.scala 216:126]
  wire  abstractcs_error_selor = _T_235 | abstractcs_error_sel5; // @[dbg.scala 216:150]
  wire [2:0] _T_237 = abstractcs_error_sel0 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_238 = _T_237 & 3'h1; // @[dbg.scala 217:62]
  wire [2:0] _T_240 = abstractcs_error_sel1 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_241 = _T_240 & 3'h2; // @[dbg.scala 218:37]
  wire [2:0] _T_242 = _T_238 | _T_241; // @[dbg.scala 217:74]
  wire [2:0] _T_244 = abstractcs_error_sel2 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_245 = _T_244 & 3'h3; // @[dbg.scala 219:37]
  wire [2:0] _T_246 = _T_242 | _T_245; // @[dbg.scala 218:49]
  wire [2:0] _T_248 = abstractcs_error_sel3 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_249 = _T_248 & 3'h4; // @[dbg.scala 220:37]
  wire [2:0] _T_250 = _T_246 | _T_249; // @[dbg.scala 219:49]
  wire [2:0] _T_252 = abstractcs_error_sel4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_254 = _T_250 | _T_252; // @[dbg.scala 220:49]
  wire [2:0] _T_256 = abstractcs_error_sel5 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_258 = ~io_dmi_reg_wdata[10:8]; // @[dbg.scala 222:40]
  wire [2:0] _T_259 = _T_256 & _T_258; // @[dbg.scala 222:37]
  wire [2:0] _T_261 = _T_259 & abstractcs_reg[10:8]; // @[dbg.scala 222:75]
  wire [2:0] _T_262 = _T_254 | _T_261; // @[dbg.scala 221:49]
  wire  _T_263 = ~abstractcs_error_selor; // @[dbg.scala 223:15]
  wire [2:0] _T_265 = _T_263 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_267 = _T_265 & abstractcs_reg[10:8]; // @[dbg.scala 223:50]
  wire [2:0] abstractcs_error_din = _T_262 | _T_267; // @[dbg.scala 222:100]
  wire [2:0] _T_312 = _T_363 ? 3'h2 : 3'h1; // @[dbg.scala 265:26]
  wire [2:0] _T_329 = temp[1] ? 3'h0 : 3'h2; // @[dbg.scala 270:26]
  wire  _T_343 = dmstatus_reg[9] & _T_320; // @[dbg.scala 275:43]
  wire  _T_346 = ~temp[3]; // @[dbg.scala 276:33]
  wire  _T_347 = temp[30] & _T_346; // @[dbg.scala 276:31]
  wire [2:0] _T_348 = _T_347 ? 3'h6 : 3'h3; // @[dbg.scala 276:12]
  wire [2:0] _T_350 = temp[31] ? 3'h1 : 3'h0; // @[dbg.scala 277:12]
  wire [2:0] _T_351 = _T_343 ? _T_348 : _T_350; // @[dbg.scala 275:26]
  wire [2:0] _T_381 = _T_384 ? 3'h5 : 3'h4; // @[dbg.scala 286:62]
  wire [2:0] _T_382 = temp[1] ? 3'h0 : _T_381; // @[dbg.scala 286:26]
  wire [2:0] _T_396 = temp[1] ? 3'h0 : 3'h5; // @[dbg.scala 291:26]
  wire [2:0] _GEN_15 = _T_405 ? _T_329 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_20 = _T_394 ? _T_396 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_25 = _T_377 ? _T_382 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_30 = _T_339 ? _T_351 : _GEN_25; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_36 = _T_327 ? _T_329 : _GEN_30; // @[Conditional.scala 39:67]
  wire [2:0] dbg_nxtstate = _T_309 ? _T_312 : _GEN_36; // @[Conditional.scala 40:58]
  wire  _T_366 = dbg_nxtstate == 3'h3; // @[dbg.scala 280:60]
  wire  _T_367 = dbg_state_en & _T_366; // @[dbg.scala 280:44]
  wire  _GEN_17 = _T_405 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_394 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_377 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_339 ? _T_367 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_327 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  abstractcs_busy_wren = _T_309 ? 1'h0 : _GEN_39; // @[Conditional.scala 40:58]
  wire [31:0] command_din = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:20],3'h0,io_dmi_reg_wdata[16:0]}; // @[Cat.scala 29:58]
  reg [31:0] command_reg; // @[Reg.scala 27:20]
  wire  _T_288 = _T_130 & _T_203; // @[dbg.scala 241:58]
  wire  data0_reg_wren0 = _T_288 & _T_278; // @[dbg.scala 241:89]
  wire  _T_290 = dbg_state == 3'h4; // @[dbg.scala 242:59]
  wire  _T_291 = io_core_dbg_cmd_done & _T_290; // @[dbg.scala 242:46]
  wire  _T_293 = ~command_reg[16]; // @[dbg.scala 242:83]
  wire  data0_reg_wren1 = _T_291 & _T_293; // @[dbg.scala 242:81]
  wire  data0_reg_wren = data0_reg_wren0 | data0_reg_wren1; // @[dbg.scala 244:40]
  wire [31:0] _T_295 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_296 = _T_295 & io_dmi_reg_wdata; // @[dbg.scala 245:45]
  wire [31:0] _T_298 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_299 = _T_298 & io_core_dbg_rddata; // @[dbg.scala 245:92]
  wire [31:0] data0_din = _T_296 | _T_299; // @[dbg.scala 245:64]
  reg [31:0] data0_reg; // @[Reg.scala 27:20]
  wire  _T_302 = io_dmi_reg_addr == 7'h5; // @[dbg.scala 250:77]
  wire  _T_303 = _T_130 & _T_302; // @[dbg.scala 250:58]
  wire  data1_reg_wren = _T_303 & _T_278; // @[dbg.scala 250:89]
  wire [31:0] _T_306 = data1_reg_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] data1_din = _T_306 & io_dmi_reg_wdata; // @[dbg.scala 251:44]
  wire  _T_325 = temp[31] & _T_320; // @[dbg.scala 267:45]
  wire  _T_334 = dmcontrol_wren_Q & temp[31]; // @[dbg.scala 272:44]
  wire  _T_337 = _T_334 & _T_320; // @[dbg.scala 272:64]
  wire  _T_368 = dbg_nxtstate == 3'h6; // @[dbg.scala 282:58]
  wire  _T_369 = dbg_state_en & _T_368; // @[dbg.scala 282:42]
  wire  _GEN_14 = _T_414 & _T_337; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_405 ? _T_337 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_394 ? _T_337 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_377 ? _T_337 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_339 & _T_369; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_339 ? _T_337 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_327 ? _T_337 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_327 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [31:0] _T_426 = _T_203 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_427 = _T_426 & data0_reg; // @[dbg.scala 308:71]
  wire [31:0] _T_430 = _T_302 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_431 = _T_430 & data1_reg; // @[dbg.scala 308:122]
  wire [31:0] _T_432 = _T_427 | _T_431; // @[dbg.scala 308:83]
  wire [31:0] _T_435 = _T_132 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_436 = _T_435 & temp; // @[dbg.scala 309:43]
  wire [31:0] _T_437 = _T_432 | _T_436; // @[dbg.scala 308:134]
  wire  _T_438 = io_dmi_reg_addr == 7'h11; // @[dbg.scala 309:86]
  wire [31:0] _T_440 = _T_438 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_441 = _T_440 & dmstatus_reg; // @[dbg.scala 309:99]
  wire [31:0] _T_442 = _T_437 | _T_441; // @[dbg.scala 309:59]
  wire [31:0] _T_445 = _T_199 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_446 = _T_445 & abstractcs_reg; // @[dbg.scala 310:43]
  wire [31:0] _T_447 = _T_442 | _T_446; // @[dbg.scala 309:114]
  wire [31:0] _T_450 = _T_275 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_451 = _T_450 & command_reg; // @[dbg.scala 310:100]
  wire [31:0] _T_452 = _T_447 | _T_451; // @[dbg.scala 310:60]
  wire  _T_453 = io_dmi_reg_addr == 7'h40; // @[dbg.scala 311:30]
  wire [31:0] _T_455 = _T_453 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_456 = _T_455 & haltsum0_reg; // @[dbg.scala 311:43]
  wire [31:0] _T_457 = _T_452 | _T_456; // @[dbg.scala 310:114]
  wire [31:0] _T_460 = _T_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_461 = _T_460 & sbcs_reg; // @[dbg.scala 311:98]
  wire [31:0] _T_462 = _T_457 | _T_461; // @[dbg.scala 311:58]
  wire [31:0] _T_465 = _T_122 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_466 = _T_465 & sbaddress0_reg; // @[dbg.scala 312:43]
  wire [31:0] _T_467 = _T_462 | _T_466; // @[dbg.scala 311:109]
  wire [31:0] _T_470 = _T_131 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_471 = _T_470 & sbdata0_reg; // @[dbg.scala 312:100]
  wire [31:0] _T_472 = _T_467 | _T_471; // @[dbg.scala 312:60]
  wire [31:0] _T_475 = _T_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_476 = _T_475 & sbdata1_reg; // @[dbg.scala 313:43]
  wire [31:0] dmi_reg_rdata_din = _T_472 | _T_476; // @[dbg.scala 312:114]
  wire  _T_478 = _T_29 & reset; // @[dbg.scala 315:62]
  reg [31:0] _T_481; // @[Reg.scala 27:20]
  wire  _T_483 = command_reg[31:24] == 8'h2; // @[dbg.scala 324:62]
  wire [30:0] _T_485 = {data1_reg[31:2],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_487 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_490 = dbg_state == 3'h3; // @[dbg.scala 326:50]
  wire  _T_493 = ~_T_384; // @[dbg.scala 326:75]
  wire  _T_494 = _T_490 & _T_493; // @[dbg.scala 326:73]
  wire  _T_502 = command_reg[15:12] == 4'h0; // @[dbg.scala 328:117]
  wire [1:0] _T_503 = {1'h0,_T_502}; // @[Cat.scala 29:58]
  wire  _T_542 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[dbg.scala 366:48]
  wire  _T_573 = sb_state == 4'h4; // @[dbg.scala 407:36]
  wire  _T_574 = sb_state == 4'h5; // @[dbg.scala 407:71]
  wire  _T_580 = sb_state == 4'h6; // @[dbg.scala 418:70]
  wire [63:0] _T_590 = {sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_591 = _T_656 & _T_590; // @[dbg.scala 419:65]
  wire [63:0] _T_598 = {sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_599 = _T_666 & _T_598; // @[dbg.scala 419:138]
  wire [63:0] _T_600 = _T_591 | _T_599; // @[dbg.scala 419:96]
  wire [63:0] _T_606 = {sbdata0_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_607 = _T_677 & _T_606; // @[dbg.scala 420:45]
  wire [63:0] _T_608 = _T_600 | _T_607; // @[dbg.scala 419:168]
  wire [63:0] _T_615 = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_616 = _T_688 & _T_615; // @[dbg.scala 420:119]
  wire [7:0] _T_621 = _T_61 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_623 = 15'h1 << sbaddress0_reg[2:0]; // @[dbg.scala 422:82]
  wire [14:0] _GEN_122 = {{7'd0}, _T_621}; // @[dbg.scala 422:67]
  wire [14:0] _T_624 = _GEN_122 & _T_623; // @[dbg.scala 422:67]
  wire [7:0] _T_628 = _T_46 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_630 = {sbaddress0_reg[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_631 = 15'h3 << _T_630; // @[dbg.scala 423:59]
  wire [14:0] _GEN_123 = {{7'd0}, _T_628}; // @[dbg.scala 423:44]
  wire [14:0] _T_632 = _GEN_123 & _T_631; // @[dbg.scala 423:44]
  wire [14:0] _T_633 = _T_624 | _T_632; // @[dbg.scala 422:107]
  wire [7:0] _T_637 = _T_50 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_639 = {sbaddress0_reg[2],1'h0}; // @[Cat.scala 29:58]
  wire [10:0] _T_640 = 11'hf << _T_639; // @[dbg.scala 424:59]
  wire [10:0] _GEN_124 = {{3'd0}, _T_637}; // @[dbg.scala 424:44]
  wire [10:0] _T_641 = _GEN_124 & _T_640; // @[dbg.scala 424:44]
  wire [14:0] _GEN_125 = {{4'd0}, _T_641}; // @[dbg.scala 423:97]
  wire [14:0] _T_642 = _T_633 | _GEN_125; // @[dbg.scala 423:97]
  wire [7:0] _T_646 = _T_56 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_126 = {{7'd0}, _T_646}; // @[dbg.scala 424:95]
  wire [14:0] _T_648 = _T_642 | _GEN_126; // @[dbg.scala 424:95]
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
  assign io_dbg_cmd_size = command_reg[21:20]; // @[dbg.scala 329:19]
  assign io_dbg_core_rst_l = ~temp[1]; // @[dbg.scala 100:21]
  assign io_dbg_halt_req = _T_309 ? _T_325 : _GEN_38; // @[dbg.scala 261:19 dbg.scala 267:23 dbg.scala 272:23 dbg.scala 283:23 dbg.scala 288:23 dbg.scala 293:23 dbg.scala 300:23 dbg.scala 305:23]
  assign io_dbg_resume_req = _T_309 ? 1'h0 : _GEN_41; // @[dbg.scala 262:21 dbg.scala 282:25]
  assign io_dmi_reg_rdata = _T_481; // @[dbg.scala 320:20]
  assign io_sb_axi_aw_valid = _T_573 | _T_574; // @[dbg.scala 407:22]
  assign io_sb_axi_aw_bits_id = 1'h0; // @[dbg.scala 409:24]
  assign io_sb_axi_aw_bits_addr = sbaddress0_reg; // @[dbg.scala 408:26]
  assign io_sb_axi_aw_bits_region = sbaddress0_reg[31:28]; // @[dbg.scala 413:28]
  assign io_sb_axi_aw_bits_len = 8'h0; // @[dbg.scala 414:25]
  assign io_sb_axi_aw_bits_size = sbcs_reg[19:17]; // @[dbg.scala 410:26]
  assign io_sb_axi_aw_bits_burst = 2'h1; // @[dbg.scala 415:27]
  assign io_sb_axi_aw_bits_lock = 1'h0; // @[dbg.scala 417:26]
  assign io_sb_axi_aw_bits_cache = 4'hf; // @[dbg.scala 412:27]
  assign io_sb_axi_aw_bits_prot = 3'h0; // @[dbg.scala 411:26]
  assign io_sb_axi_aw_bits_qos = 4'h0; // @[dbg.scala 416:25]
  assign io_sb_axi_w_valid = _T_573 | _T_580; // @[dbg.scala 418:21]
  assign io_sb_axi_w_bits_data = _T_608 | _T_616; // @[dbg.scala 419:25]
  assign io_sb_axi_w_bits_strb = _T_648[7:0]; // @[dbg.scala 422:25]
  assign io_sb_axi_w_bits_last = 1'h1; // @[dbg.scala 427:25]
  assign io_sb_axi_b_ready = 1'h1; // @[dbg.scala 439:21]
  assign io_sb_axi_ar_valid = sb_state == 4'h3; // @[dbg.scala 428:22]
  assign io_sb_axi_ar_bits_id = 1'h0; // @[dbg.scala 430:24]
  assign io_sb_axi_ar_bits_addr = sbaddress0_reg; // @[dbg.scala 429:26]
  assign io_sb_axi_ar_bits_region = sbaddress0_reg[31:28]; // @[dbg.scala 434:28]
  assign io_sb_axi_ar_bits_len = 8'h0; // @[dbg.scala 435:25]
  assign io_sb_axi_ar_bits_size = sbcs_reg[19:17]; // @[dbg.scala 431:26]
  assign io_sb_axi_ar_bits_burst = 2'h1; // @[dbg.scala 436:27]
  assign io_sb_axi_ar_bits_lock = 1'h0; // @[dbg.scala 438:26]
  assign io_sb_axi_ar_bits_cache = 4'h0; // @[dbg.scala 433:27]
  assign io_sb_axi_ar_bits_prot = 3'h0; // @[dbg.scala 432:26]
  assign io_sb_axi_ar_bits_qos = 4'h0; // @[dbg.scala 437:25]
  assign io_sb_axi_r_ready = 1'h1; // @[dbg.scala 440:21]
  assign io_dbg_dec_dbg_ib_dbg_cmd_valid = _T_494 & io_dbg_dma_io_dma_dbg_ready; // @[dbg.scala 326:35]
  assign io_dbg_dec_dbg_ib_dbg_cmd_write = command_reg[16]; // @[dbg.scala 327:35]
  assign io_dbg_dec_dbg_ib_dbg_cmd_type = _T_483 ? 2'h2 : _T_503; // @[dbg.scala 328:34]
  assign io_dbg_dec_dbg_ib_dbg_cmd_addr = _T_483 ? {{1'd0}, _T_485} : _T_487; // @[dbg.scala 324:34]
  assign io_dbg_dec_dbg_dctl_dbg_cmd_wrdata = data0_reg[1:0]; // @[dbg.scala 325:38]
  assign io_dbg_dma_dbg_ib_dbg_cmd_valid = io_dbg_dec_dbg_ib_dbg_cmd_valid; // @[dbg.scala 449:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_write = io_dbg_dec_dbg_ib_dbg_cmd_write; // @[dbg.scala 450:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_type = io_dbg_dec_dbg_ib_dbg_cmd_type; // @[dbg.scala 451:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_addr = io_dbg_dec_dbg_ib_dbg_cmd_addr; // @[dbg.scala 447:39]
  assign io_dbg_dma_dbg_dctl_dbg_cmd_wrdata = io_dbg_dec_dbg_dctl_dbg_cmd_wrdata; // @[dbg.scala 448:39]
  assign io_dbg_dma_io_dbg_dma_bubble = _T_494 | _T_290; // @[dbg.scala 330:32]
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
    if (io_dbg_rst_l) begin
      dm_temp_0 <= 1'h0;
    end else if (dmcontrol_wren) begin
      dm_temp_0 <= io_dmi_reg_wdata[0];
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
endmodule
