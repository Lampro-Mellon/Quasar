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
module el2_dec_gpr_ctl(
  input         clock,
  input         reset,
  input  [4:0]  io_raddr0,
  input  [4:0]  io_raddr1,
  input         io_wen0,
  input  [4:0]  io_waddr0,
  input  [31:0] io_wd0,
  input         io_wen1,
  input  [4:0]  io_waddr1,
  input  [31:0] io_wd1,
  input         io_wen2,
  input  [4:0]  io_waddr2,
  input  [31:0] io_wd2,
  output [31:0] io_rd0,
  output [31:0] io_rd1,
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
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
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
  wire  rvclkhdr_13_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_13_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_14_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_15_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_16_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_17_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_18_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_19_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_20_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_20_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_20_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_20_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_21_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_21_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_21_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_21_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_22_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_22_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_22_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_22_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_23_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_23_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_23_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_23_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_24_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_24_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_24_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_24_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_25_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_25_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_25_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_25_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_26_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_26_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_26_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_26_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_27_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_27_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_27_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_27_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_28_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_28_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_28_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_28_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_29_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_29_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_29_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_29_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_30_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_30_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_30_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_30_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  _T = io_waddr0 == 5'h1; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_1 = io_wen0 & _T; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_2 = io_waddr1 == 5'h1; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_1 = io_wen1 & _T_2; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_4 = io_waddr2 == 5'h1; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_1 = io_wen2 & _T_4; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_7 = w0v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_8 = _T_7 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_10 = w1v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_11 = _T_10 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_12 = _T_8 | _T_11; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_14 = w2v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_15 = _T_14 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_17 = io_waddr0 == 5'h2; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_2 = io_wen0 & _T_17; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_19 = io_waddr1 == 5'h2; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_2 = io_wen1 & _T_19; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_21 = io_waddr2 == 5'h2; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_2 = io_wen2 & _T_21; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_24 = w0v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_25 = _T_24 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_27 = w1v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_28 = _T_27 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_29 = _T_25 | _T_28; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_31 = w2v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_32 = _T_31 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_34 = io_waddr0 == 5'h3; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_3 = io_wen0 & _T_34; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_36 = io_waddr1 == 5'h3; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_3 = io_wen1 & _T_36; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_38 = io_waddr2 == 5'h3; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_3 = io_wen2 & _T_38; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_41 = w0v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_42 = _T_41 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_44 = w1v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_45 = _T_44 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_46 = _T_42 | _T_45; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_48 = w2v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_49 = _T_48 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_51 = io_waddr0 == 5'h4; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_4 = io_wen0 & _T_51; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_53 = io_waddr1 == 5'h4; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_4 = io_wen1 & _T_53; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_55 = io_waddr2 == 5'h4; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_4 = io_wen2 & _T_55; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_58 = w0v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_59 = _T_58 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_61 = w1v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_62 = _T_61 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_63 = _T_59 | _T_62; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_65 = w2v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_66 = _T_65 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_68 = io_waddr0 == 5'h5; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_5 = io_wen0 & _T_68; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_70 = io_waddr1 == 5'h5; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_5 = io_wen1 & _T_70; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_72 = io_waddr2 == 5'h5; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_5 = io_wen2 & _T_72; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_75 = w0v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_76 = _T_75 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_78 = w1v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_79 = _T_78 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_80 = _T_76 | _T_79; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_82 = w2v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_83 = _T_82 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_85 = io_waddr0 == 5'h6; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_6 = io_wen0 & _T_85; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_87 = io_waddr1 == 5'h6; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_6 = io_wen1 & _T_87; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_89 = io_waddr2 == 5'h6; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_6 = io_wen2 & _T_89; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_92 = w0v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_93 = _T_92 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_95 = w1v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_96 = _T_95 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_97 = _T_93 | _T_96; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_99 = w2v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_100 = _T_99 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_102 = io_waddr0 == 5'h7; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_7 = io_wen0 & _T_102; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_104 = io_waddr1 == 5'h7; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_7 = io_wen1 & _T_104; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_106 = io_waddr2 == 5'h7; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_7 = io_wen2 & _T_106; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_109 = w0v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_110 = _T_109 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_112 = w1v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_113 = _T_112 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_114 = _T_110 | _T_113; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_116 = w2v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_117 = _T_116 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_119 = io_waddr0 == 5'h8; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_8 = io_wen0 & _T_119; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_121 = io_waddr1 == 5'h8; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_8 = io_wen1 & _T_121; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_123 = io_waddr2 == 5'h8; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_8 = io_wen2 & _T_123; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_126 = w0v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_127 = _T_126 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_129 = w1v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_130 = _T_129 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_131 = _T_127 | _T_130; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_133 = w2v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_134 = _T_133 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_136 = io_waddr0 == 5'h9; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_9 = io_wen0 & _T_136; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_138 = io_waddr1 == 5'h9; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_9 = io_wen1 & _T_138; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_140 = io_waddr2 == 5'h9; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_9 = io_wen2 & _T_140; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_143 = w0v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_144 = _T_143 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_146 = w1v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_147 = _T_146 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_148 = _T_144 | _T_147; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_150 = w2v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_151 = _T_150 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_153 = io_waddr0 == 5'ha; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_10 = io_wen0 & _T_153; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_155 = io_waddr1 == 5'ha; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_10 = io_wen1 & _T_155; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_157 = io_waddr2 == 5'ha; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_10 = io_wen2 & _T_157; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_160 = w0v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_161 = _T_160 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_163 = w1v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_164 = _T_163 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_165 = _T_161 | _T_164; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_167 = w2v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_168 = _T_167 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_170 = io_waddr0 == 5'hb; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_11 = io_wen0 & _T_170; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_172 = io_waddr1 == 5'hb; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_11 = io_wen1 & _T_172; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_174 = io_waddr2 == 5'hb; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_11 = io_wen2 & _T_174; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_177 = w0v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_178 = _T_177 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_180 = w1v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_181 = _T_180 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_182 = _T_178 | _T_181; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_184 = w2v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_185 = _T_184 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_187 = io_waddr0 == 5'hc; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_12 = io_wen0 & _T_187; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_189 = io_waddr1 == 5'hc; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_12 = io_wen1 & _T_189; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_191 = io_waddr2 == 5'hc; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_12 = io_wen2 & _T_191; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_194 = w0v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_195 = _T_194 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_197 = w1v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_198 = _T_197 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_199 = _T_195 | _T_198; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_201 = w2v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_202 = _T_201 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_204 = io_waddr0 == 5'hd; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_13 = io_wen0 & _T_204; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_206 = io_waddr1 == 5'hd; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_13 = io_wen1 & _T_206; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_208 = io_waddr2 == 5'hd; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_13 = io_wen2 & _T_208; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_211 = w0v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_212 = _T_211 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_214 = w1v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_215 = _T_214 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_216 = _T_212 | _T_215; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_218 = w2v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_219 = _T_218 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_221 = io_waddr0 == 5'he; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_14 = io_wen0 & _T_221; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_223 = io_waddr1 == 5'he; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_14 = io_wen1 & _T_223; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_225 = io_waddr2 == 5'he; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_14 = io_wen2 & _T_225; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_228 = w0v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_229 = _T_228 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_231 = w1v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_232 = _T_231 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_233 = _T_229 | _T_232; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_235 = w2v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_236 = _T_235 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_238 = io_waddr0 == 5'hf; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_15 = io_wen0 & _T_238; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_240 = io_waddr1 == 5'hf; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_15 = io_wen1 & _T_240; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_242 = io_waddr2 == 5'hf; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_15 = io_wen2 & _T_242; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_245 = w0v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_246 = _T_245 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_248 = w1v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_249 = _T_248 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_250 = _T_246 | _T_249; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_252 = w2v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_253 = _T_252 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_255 = io_waddr0 == 5'h10; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_16 = io_wen0 & _T_255; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_257 = io_waddr1 == 5'h10; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_16 = io_wen1 & _T_257; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_259 = io_waddr2 == 5'h10; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_16 = io_wen2 & _T_259; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_262 = w0v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_263 = _T_262 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_265 = w1v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_266 = _T_265 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_267 = _T_263 | _T_266; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_269 = w2v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_270 = _T_269 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_272 = io_waddr0 == 5'h11; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_17 = io_wen0 & _T_272; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_274 = io_waddr1 == 5'h11; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_17 = io_wen1 & _T_274; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_276 = io_waddr2 == 5'h11; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_17 = io_wen2 & _T_276; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_279 = w0v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_280 = _T_279 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_282 = w1v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_283 = _T_282 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_284 = _T_280 | _T_283; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_286 = w2v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_287 = _T_286 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_289 = io_waddr0 == 5'h12; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_18 = io_wen0 & _T_289; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_291 = io_waddr1 == 5'h12; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_18 = io_wen1 & _T_291; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_293 = io_waddr2 == 5'h12; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_18 = io_wen2 & _T_293; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_296 = w0v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_297 = _T_296 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_299 = w1v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_300 = _T_299 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_301 = _T_297 | _T_300; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_303 = w2v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_304 = _T_303 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_306 = io_waddr0 == 5'h13; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_19 = io_wen0 & _T_306; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_308 = io_waddr1 == 5'h13; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_19 = io_wen1 & _T_308; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_310 = io_waddr2 == 5'h13; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_19 = io_wen2 & _T_310; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_313 = w0v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_314 = _T_313 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_316 = w1v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_317 = _T_316 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_318 = _T_314 | _T_317; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_320 = w2v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_321 = _T_320 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_323 = io_waddr0 == 5'h14; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_20 = io_wen0 & _T_323; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_325 = io_waddr1 == 5'h14; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_20 = io_wen1 & _T_325; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_327 = io_waddr2 == 5'h14; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_20 = io_wen2 & _T_327; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_330 = w0v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_331 = _T_330 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_333 = w1v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_334 = _T_333 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_335 = _T_331 | _T_334; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_337 = w2v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_338 = _T_337 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_340 = io_waddr0 == 5'h15; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_21 = io_wen0 & _T_340; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_342 = io_waddr1 == 5'h15; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_21 = io_wen1 & _T_342; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_344 = io_waddr2 == 5'h15; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_21 = io_wen2 & _T_344; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_347 = w0v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_348 = _T_347 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_350 = w1v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_351 = _T_350 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_352 = _T_348 | _T_351; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_354 = w2v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_355 = _T_354 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_357 = io_waddr0 == 5'h16; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_22 = io_wen0 & _T_357; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_359 = io_waddr1 == 5'h16; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_22 = io_wen1 & _T_359; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_361 = io_waddr2 == 5'h16; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_22 = io_wen2 & _T_361; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_364 = w0v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_365 = _T_364 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_367 = w1v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_368 = _T_367 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_369 = _T_365 | _T_368; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_371 = w2v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_372 = _T_371 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_374 = io_waddr0 == 5'h17; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_23 = io_wen0 & _T_374; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_376 = io_waddr1 == 5'h17; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_23 = io_wen1 & _T_376; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_378 = io_waddr2 == 5'h17; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_23 = io_wen2 & _T_378; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_381 = w0v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_382 = _T_381 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_384 = w1v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_385 = _T_384 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_386 = _T_382 | _T_385; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_388 = w2v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_389 = _T_388 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_391 = io_waddr0 == 5'h18; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_24 = io_wen0 & _T_391; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_393 = io_waddr1 == 5'h18; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_24 = io_wen1 & _T_393; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_395 = io_waddr2 == 5'h18; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_24 = io_wen2 & _T_395; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_398 = w0v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_399 = _T_398 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_401 = w1v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_402 = _T_401 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_403 = _T_399 | _T_402; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_405 = w2v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_406 = _T_405 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_408 = io_waddr0 == 5'h19; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_25 = io_wen0 & _T_408; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_410 = io_waddr1 == 5'h19; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_25 = io_wen1 & _T_410; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_412 = io_waddr2 == 5'h19; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_25 = io_wen2 & _T_412; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_415 = w0v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_416 = _T_415 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_418 = w1v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_419 = _T_418 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_420 = _T_416 | _T_419; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_422 = w2v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_423 = _T_422 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_425 = io_waddr0 == 5'h1a; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_26 = io_wen0 & _T_425; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_427 = io_waddr1 == 5'h1a; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_26 = io_wen1 & _T_427; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_429 = io_waddr2 == 5'h1a; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_26 = io_wen2 & _T_429; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_432 = w0v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_433 = _T_432 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_435 = w1v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_436 = _T_435 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_437 = _T_433 | _T_436; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_439 = w2v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_440 = _T_439 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_442 = io_waddr0 == 5'h1b; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_27 = io_wen0 & _T_442; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_444 = io_waddr1 == 5'h1b; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_27 = io_wen1 & _T_444; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_446 = io_waddr2 == 5'h1b; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_27 = io_wen2 & _T_446; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_449 = w0v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_450 = _T_449 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_452 = w1v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_453 = _T_452 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_454 = _T_450 | _T_453; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_456 = w2v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_457 = _T_456 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_459 = io_waddr0 == 5'h1c; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_28 = io_wen0 & _T_459; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_461 = io_waddr1 == 5'h1c; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_28 = io_wen1 & _T_461; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_463 = io_waddr2 == 5'h1c; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_28 = io_wen2 & _T_463; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_466 = w0v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_467 = _T_466 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_469 = w1v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_470 = _T_469 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_471 = _T_467 | _T_470; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_473 = w2v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_474 = _T_473 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_476 = io_waddr0 == 5'h1d; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_29 = io_wen0 & _T_476; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_478 = io_waddr1 == 5'h1d; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_29 = io_wen1 & _T_478; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_480 = io_waddr2 == 5'h1d; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_29 = io_wen2 & _T_480; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_483 = w0v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_484 = _T_483 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_486 = w1v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_487 = _T_486 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_488 = _T_484 | _T_487; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_490 = w2v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_491 = _T_490 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_493 = io_waddr0 == 5'h1e; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_30 = io_wen0 & _T_493; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_495 = io_waddr1 == 5'h1e; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_30 = io_wen1 & _T_495; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_497 = io_waddr2 == 5'h1e; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_30 = io_wen2 & _T_497; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_500 = w0v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_501 = _T_500 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_503 = w1v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_504 = _T_503 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_505 = _T_501 | _T_504; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_507 = w2v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_508 = _T_507 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire  _T_510 = io_waddr0 == 5'h1f; // @[el2_dec_gpr_ctl.scala 35:40]
  wire  w0v_31 = io_wen0 & _T_510; // @[el2_dec_gpr_ctl.scala 35:28]
  wire  _T_512 = io_waddr1 == 5'h1f; // @[el2_dec_gpr_ctl.scala 36:40]
  wire  w1v_31 = io_wen1 & _T_512; // @[el2_dec_gpr_ctl.scala 36:28]
  wire  _T_514 = io_waddr2 == 5'h1f; // @[el2_dec_gpr_ctl.scala 37:40]
  wire  w2v_31 = io_wen2 & _T_514; // @[el2_dec_gpr_ctl.scala 37:28]
  wire [31:0] _T_517 = w0v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_518 = _T_517 & io_wd0; // @[el2_dec_gpr_ctl.scala 38:37]
  wire [31:0] _T_520 = w1v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_521 = _T_520 & io_wd1; // @[el2_dec_gpr_ctl.scala 38:66]
  wire [31:0] _T_522 = _T_518 | _T_521; // @[el2_dec_gpr_ctl.scala 38:47]
  wire [31:0] _T_524 = w2v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_525 = _T_524 & io_wd2; // @[el2_dec_gpr_ctl.scala 38:95]
  wire [9:0] _T_535 = {w0v_9,w0v_8,w0v_7,w0v_6,w0v_5,w0v_4,w0v_3,w0v_2,w0v_1,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_544 = {w0v_18,w0v_17,w0v_16,w0v_15,w0v_14,w0v_13,w0v_12,w0v_11,w0v_10,_T_535}; // @[Cat.scala 29:58]
  wire [27:0] _T_553 = {w0v_27,w0v_26,w0v_25,w0v_24,w0v_23,w0v_22,w0v_21,w0v_20,w0v_19,_T_544}; // @[Cat.scala 29:58]
  wire [31:0] _T_557 = {w0v_31,w0v_30,w0v_29,w0v_28,_T_553}; // @[Cat.scala 29:58]
  wire [9:0] _T_566 = {w1v_9,w1v_8,w1v_7,w1v_6,w1v_5,w1v_4,w1v_3,w1v_2,w1v_1,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_575 = {w1v_18,w1v_17,w1v_16,w1v_15,w1v_14,w1v_13,w1v_12,w1v_11,w1v_10,_T_566}; // @[Cat.scala 29:58]
  wire [27:0] _T_584 = {w1v_27,w1v_26,w1v_25,w1v_24,w1v_23,w1v_22,w1v_21,w1v_20,w1v_19,_T_575}; // @[Cat.scala 29:58]
  wire [31:0] _T_588 = {w1v_31,w1v_30,w1v_29,w1v_28,_T_584}; // @[Cat.scala 29:58]
  wire [31:0] _T_589 = _T_557 | _T_588; // @[el2_dec_gpr_ctl.scala 40:51]
  wire [9:0] _T_598 = {w2v_9,w2v_8,w2v_7,w2v_6,w2v_5,w2v_4,w2v_3,w2v_2,w2v_1,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_607 = {w2v_18,w2v_17,w2v_16,w2v_15,w2v_14,w2v_13,w2v_12,w2v_11,w2v_10,_T_598}; // @[Cat.scala 29:58]
  wire [27:0] _T_616 = {w2v_27,w2v_26,w2v_25,w2v_24,w2v_23,w2v_22,w2v_21,w2v_20,w2v_19,_T_607}; // @[Cat.scala 29:58]
  wire [31:0] _T_620 = {w2v_31,w2v_30,w2v_29,w2v_28,_T_616}; // @[Cat.scala 29:58]
  wire [31:0] gpr_wr_en = _T_589 | _T_620; // @[el2_dec_gpr_ctl.scala 40:89]
  reg [31:0] gpr_out_1; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_2; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_3; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_4; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_5; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_6; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_7; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_8; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_9; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_10; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_11; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_12; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_13; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_14; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_15; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_16; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_17; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_18; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_19; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_20; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_21; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_22; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_23; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_24; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_25; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_26; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_27; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_28; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_29; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_30; // @[el2_lib.scala 514:16]
  reg [31:0] gpr_out_31; // @[el2_lib.scala 514:16]
  wire  _T_684 = io_raddr0 == 5'h1; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_686 = io_raddr0 == 5'h2; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_688 = io_raddr0 == 5'h3; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_690 = io_raddr0 == 5'h4; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_692 = io_raddr0 == 5'h5; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_694 = io_raddr0 == 5'h6; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_696 = io_raddr0 == 5'h7; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_698 = io_raddr0 == 5'h8; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_700 = io_raddr0 == 5'h9; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_702 = io_raddr0 == 5'ha; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_704 = io_raddr0 == 5'hb; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_706 = io_raddr0 == 5'hc; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_708 = io_raddr0 == 5'hd; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_710 = io_raddr0 == 5'he; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_712 = io_raddr0 == 5'hf; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_714 = io_raddr0 == 5'h10; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_716 = io_raddr0 == 5'h11; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_718 = io_raddr0 == 5'h12; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_720 = io_raddr0 == 5'h13; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_722 = io_raddr0 == 5'h14; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_724 = io_raddr0 == 5'h15; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_726 = io_raddr0 == 5'h16; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_728 = io_raddr0 == 5'h17; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_730 = io_raddr0 == 5'h18; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_732 = io_raddr0 == 5'h19; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_734 = io_raddr0 == 5'h1a; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_736 = io_raddr0 == 5'h1b; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_738 = io_raddr0 == 5'h1c; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_740 = io_raddr0 == 5'h1d; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_742 = io_raddr0 == 5'h1e; // @[el2_dec_gpr_ctl.scala 47:49]
  wire  _T_744 = io_raddr0 == 5'h1f; // @[el2_dec_gpr_ctl.scala 47:49]
  wire [31:0] _T_746 = _T_684 ? gpr_out_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_747 = _T_686 ? gpr_out_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_748 = _T_688 ? gpr_out_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_749 = _T_690 ? gpr_out_4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_750 = _T_692 ? gpr_out_5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_751 = _T_694 ? gpr_out_6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_752 = _T_696 ? gpr_out_7 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_753 = _T_698 ? gpr_out_8 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_754 = _T_700 ? gpr_out_9 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_755 = _T_702 ? gpr_out_10 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_756 = _T_704 ? gpr_out_11 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_757 = _T_706 ? gpr_out_12 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_758 = _T_708 ? gpr_out_13 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_759 = _T_710 ? gpr_out_14 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_760 = _T_712 ? gpr_out_15 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_761 = _T_714 ? gpr_out_16 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_762 = _T_716 ? gpr_out_17 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_763 = _T_718 ? gpr_out_18 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_764 = _T_720 ? gpr_out_19 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_765 = _T_722 ? gpr_out_20 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_766 = _T_724 ? gpr_out_21 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_767 = _T_726 ? gpr_out_22 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_768 = _T_728 ? gpr_out_23 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_769 = _T_730 ? gpr_out_24 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_770 = _T_732 ? gpr_out_25 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_771 = _T_734 ? gpr_out_26 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_772 = _T_736 ? gpr_out_27 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_773 = _T_738 ? gpr_out_28 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_774 = _T_740 ? gpr_out_29 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_775 = _T_742 ? gpr_out_30 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_776 = _T_744 ? gpr_out_31 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_777 = _T_746 | _T_747; // @[Mux.scala 27:72]
  wire [31:0] _T_778 = _T_777 | _T_748; // @[Mux.scala 27:72]
  wire [31:0] _T_779 = _T_778 | _T_749; // @[Mux.scala 27:72]
  wire [31:0] _T_780 = _T_779 | _T_750; // @[Mux.scala 27:72]
  wire [31:0] _T_781 = _T_780 | _T_751; // @[Mux.scala 27:72]
  wire [31:0] _T_782 = _T_781 | _T_752; // @[Mux.scala 27:72]
  wire [31:0] _T_783 = _T_782 | _T_753; // @[Mux.scala 27:72]
  wire [31:0] _T_784 = _T_783 | _T_754; // @[Mux.scala 27:72]
  wire [31:0] _T_785 = _T_784 | _T_755; // @[Mux.scala 27:72]
  wire [31:0] _T_786 = _T_785 | _T_756; // @[Mux.scala 27:72]
  wire [31:0] _T_787 = _T_786 | _T_757; // @[Mux.scala 27:72]
  wire [31:0] _T_788 = _T_787 | _T_758; // @[Mux.scala 27:72]
  wire [31:0] _T_789 = _T_788 | _T_759; // @[Mux.scala 27:72]
  wire [31:0] _T_790 = _T_789 | _T_760; // @[Mux.scala 27:72]
  wire [31:0] _T_791 = _T_790 | _T_761; // @[Mux.scala 27:72]
  wire [31:0] _T_792 = _T_791 | _T_762; // @[Mux.scala 27:72]
  wire [31:0] _T_793 = _T_792 | _T_763; // @[Mux.scala 27:72]
  wire [31:0] _T_794 = _T_793 | _T_764; // @[Mux.scala 27:72]
  wire [31:0] _T_795 = _T_794 | _T_765; // @[Mux.scala 27:72]
  wire [31:0] _T_796 = _T_795 | _T_766; // @[Mux.scala 27:72]
  wire [31:0] _T_797 = _T_796 | _T_767; // @[Mux.scala 27:72]
  wire [31:0] _T_798 = _T_797 | _T_768; // @[Mux.scala 27:72]
  wire [31:0] _T_799 = _T_798 | _T_769; // @[Mux.scala 27:72]
  wire [31:0] _T_800 = _T_799 | _T_770; // @[Mux.scala 27:72]
  wire [31:0] _T_801 = _T_800 | _T_771; // @[Mux.scala 27:72]
  wire [31:0] _T_802 = _T_801 | _T_772; // @[Mux.scala 27:72]
  wire [31:0] _T_803 = _T_802 | _T_773; // @[Mux.scala 27:72]
  wire [31:0] _T_804 = _T_803 | _T_774; // @[Mux.scala 27:72]
  wire [31:0] _T_805 = _T_804 | _T_775; // @[Mux.scala 27:72]
  wire  _T_808 = io_raddr1 == 5'h1; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_810 = io_raddr1 == 5'h2; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_812 = io_raddr1 == 5'h3; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_814 = io_raddr1 == 5'h4; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_816 = io_raddr1 == 5'h5; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_818 = io_raddr1 == 5'h6; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_820 = io_raddr1 == 5'h7; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_822 = io_raddr1 == 5'h8; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_824 = io_raddr1 == 5'h9; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_826 = io_raddr1 == 5'ha; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_828 = io_raddr1 == 5'hb; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_830 = io_raddr1 == 5'hc; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_832 = io_raddr1 == 5'hd; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_834 = io_raddr1 == 5'he; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_836 = io_raddr1 == 5'hf; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_838 = io_raddr1 == 5'h10; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_840 = io_raddr1 == 5'h11; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_842 = io_raddr1 == 5'h12; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_844 = io_raddr1 == 5'h13; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_846 = io_raddr1 == 5'h14; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_848 = io_raddr1 == 5'h15; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_850 = io_raddr1 == 5'h16; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_852 = io_raddr1 == 5'h17; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_854 = io_raddr1 == 5'h18; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_856 = io_raddr1 == 5'h19; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_858 = io_raddr1 == 5'h1a; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_860 = io_raddr1 == 5'h1b; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_862 = io_raddr1 == 5'h1c; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_864 = io_raddr1 == 5'h1d; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_866 = io_raddr1 == 5'h1e; // @[el2_dec_gpr_ctl.scala 48:49]
  wire  _T_868 = io_raddr1 == 5'h1f; // @[el2_dec_gpr_ctl.scala 48:49]
  wire [31:0] _T_870 = _T_808 ? gpr_out_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_871 = _T_810 ? gpr_out_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_872 = _T_812 ? gpr_out_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_873 = _T_814 ? gpr_out_4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_874 = _T_816 ? gpr_out_5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_875 = _T_818 ? gpr_out_6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_876 = _T_820 ? gpr_out_7 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_877 = _T_822 ? gpr_out_8 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_878 = _T_824 ? gpr_out_9 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_879 = _T_826 ? gpr_out_10 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_880 = _T_828 ? gpr_out_11 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_881 = _T_830 ? gpr_out_12 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_882 = _T_832 ? gpr_out_13 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_883 = _T_834 ? gpr_out_14 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_884 = _T_836 ? gpr_out_15 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_885 = _T_838 ? gpr_out_16 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_886 = _T_840 ? gpr_out_17 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_887 = _T_842 ? gpr_out_18 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_888 = _T_844 ? gpr_out_19 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_889 = _T_846 ? gpr_out_20 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_890 = _T_848 ? gpr_out_21 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_891 = _T_850 ? gpr_out_22 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_892 = _T_852 ? gpr_out_23 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_893 = _T_854 ? gpr_out_24 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_894 = _T_856 ? gpr_out_25 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_895 = _T_858 ? gpr_out_26 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_896 = _T_860 ? gpr_out_27 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_897 = _T_862 ? gpr_out_28 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_898 = _T_864 ? gpr_out_29 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_899 = _T_866 ? gpr_out_30 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_900 = _T_868 ? gpr_out_31 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_901 = _T_870 | _T_871; // @[Mux.scala 27:72]
  wire [31:0] _T_902 = _T_901 | _T_872; // @[Mux.scala 27:72]
  wire [31:0] _T_903 = _T_902 | _T_873; // @[Mux.scala 27:72]
  wire [31:0] _T_904 = _T_903 | _T_874; // @[Mux.scala 27:72]
  wire [31:0] _T_905 = _T_904 | _T_875; // @[Mux.scala 27:72]
  wire [31:0] _T_906 = _T_905 | _T_876; // @[Mux.scala 27:72]
  wire [31:0] _T_907 = _T_906 | _T_877; // @[Mux.scala 27:72]
  wire [31:0] _T_908 = _T_907 | _T_878; // @[Mux.scala 27:72]
  wire [31:0] _T_909 = _T_908 | _T_879; // @[Mux.scala 27:72]
  wire [31:0] _T_910 = _T_909 | _T_880; // @[Mux.scala 27:72]
  wire [31:0] _T_911 = _T_910 | _T_881; // @[Mux.scala 27:72]
  wire [31:0] _T_912 = _T_911 | _T_882; // @[Mux.scala 27:72]
  wire [31:0] _T_913 = _T_912 | _T_883; // @[Mux.scala 27:72]
  wire [31:0] _T_914 = _T_913 | _T_884; // @[Mux.scala 27:72]
  wire [31:0] _T_915 = _T_914 | _T_885; // @[Mux.scala 27:72]
  wire [31:0] _T_916 = _T_915 | _T_886; // @[Mux.scala 27:72]
  wire [31:0] _T_917 = _T_916 | _T_887; // @[Mux.scala 27:72]
  wire [31:0] _T_918 = _T_917 | _T_888; // @[Mux.scala 27:72]
  wire [31:0] _T_919 = _T_918 | _T_889; // @[Mux.scala 27:72]
  wire [31:0] _T_920 = _T_919 | _T_890; // @[Mux.scala 27:72]
  wire [31:0] _T_921 = _T_920 | _T_891; // @[Mux.scala 27:72]
  wire [31:0] _T_922 = _T_921 | _T_892; // @[Mux.scala 27:72]
  wire [31:0] _T_923 = _T_922 | _T_893; // @[Mux.scala 27:72]
  wire [31:0] _T_924 = _T_923 | _T_894; // @[Mux.scala 27:72]
  wire [31:0] _T_925 = _T_924 | _T_895; // @[Mux.scala 27:72]
  wire [31:0] _T_926 = _T_925 | _T_896; // @[Mux.scala 27:72]
  wire [31:0] _T_927 = _T_926 | _T_897; // @[Mux.scala 27:72]
  wire [31:0] _T_928 = _T_927 | _T_898; // @[Mux.scala 27:72]
  wire [31:0] _T_929 = _T_928 | _T_899; // @[Mux.scala 27:72]
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
  rvclkhdr rvclkhdr_13 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_13_io_l1clk),
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en),
    .io_scan_mode(rvclkhdr_13_io_scan_mode)
  );
  rvclkhdr rvclkhdr_14 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_14_io_l1clk),
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en),
    .io_scan_mode(rvclkhdr_14_io_scan_mode)
  );
  rvclkhdr rvclkhdr_15 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_15_io_l1clk),
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en),
    .io_scan_mode(rvclkhdr_15_io_scan_mode)
  );
  rvclkhdr rvclkhdr_16 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_16_io_l1clk),
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en),
    .io_scan_mode(rvclkhdr_16_io_scan_mode)
  );
  rvclkhdr rvclkhdr_17 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_17_io_l1clk),
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en),
    .io_scan_mode(rvclkhdr_17_io_scan_mode)
  );
  rvclkhdr rvclkhdr_18 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_18_io_l1clk),
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en),
    .io_scan_mode(rvclkhdr_18_io_scan_mode)
  );
  rvclkhdr rvclkhdr_19 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_19_io_l1clk),
    .io_clk(rvclkhdr_19_io_clk),
    .io_en(rvclkhdr_19_io_en),
    .io_scan_mode(rvclkhdr_19_io_scan_mode)
  );
  rvclkhdr rvclkhdr_20 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_20_io_l1clk),
    .io_clk(rvclkhdr_20_io_clk),
    .io_en(rvclkhdr_20_io_en),
    .io_scan_mode(rvclkhdr_20_io_scan_mode)
  );
  rvclkhdr rvclkhdr_21 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_21_io_l1clk),
    .io_clk(rvclkhdr_21_io_clk),
    .io_en(rvclkhdr_21_io_en),
    .io_scan_mode(rvclkhdr_21_io_scan_mode)
  );
  rvclkhdr rvclkhdr_22 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_22_io_l1clk),
    .io_clk(rvclkhdr_22_io_clk),
    .io_en(rvclkhdr_22_io_en),
    .io_scan_mode(rvclkhdr_22_io_scan_mode)
  );
  rvclkhdr rvclkhdr_23 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_23_io_l1clk),
    .io_clk(rvclkhdr_23_io_clk),
    .io_en(rvclkhdr_23_io_en),
    .io_scan_mode(rvclkhdr_23_io_scan_mode)
  );
  rvclkhdr rvclkhdr_24 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_24_io_l1clk),
    .io_clk(rvclkhdr_24_io_clk),
    .io_en(rvclkhdr_24_io_en),
    .io_scan_mode(rvclkhdr_24_io_scan_mode)
  );
  rvclkhdr rvclkhdr_25 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_25_io_l1clk),
    .io_clk(rvclkhdr_25_io_clk),
    .io_en(rvclkhdr_25_io_en),
    .io_scan_mode(rvclkhdr_25_io_scan_mode)
  );
  rvclkhdr rvclkhdr_26 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_26_io_l1clk),
    .io_clk(rvclkhdr_26_io_clk),
    .io_en(rvclkhdr_26_io_en),
    .io_scan_mode(rvclkhdr_26_io_scan_mode)
  );
  rvclkhdr rvclkhdr_27 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_27_io_l1clk),
    .io_clk(rvclkhdr_27_io_clk),
    .io_en(rvclkhdr_27_io_en),
    .io_scan_mode(rvclkhdr_27_io_scan_mode)
  );
  rvclkhdr rvclkhdr_28 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_28_io_l1clk),
    .io_clk(rvclkhdr_28_io_clk),
    .io_en(rvclkhdr_28_io_en),
    .io_scan_mode(rvclkhdr_28_io_scan_mode)
  );
  rvclkhdr rvclkhdr_29 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_29_io_l1clk),
    .io_clk(rvclkhdr_29_io_clk),
    .io_en(rvclkhdr_29_io_en),
    .io_scan_mode(rvclkhdr_29_io_scan_mode)
  );
  rvclkhdr rvclkhdr_30 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_30_io_l1clk),
    .io_clk(rvclkhdr_30_io_clk),
    .io_en(rvclkhdr_30_io_en),
    .io_scan_mode(rvclkhdr_30_io_scan_mode)
  );
  assign io_rd0 = _T_805 | _T_776; // @[el2_dec_gpr_ctl.scala 31:9 el2_dec_gpr_ctl.scala 47:9]
  assign io_rd1 = _T_929 | _T_900; // @[el2_dec_gpr_ctl.scala 32:9 el2_dec_gpr_ctl.scala 48:9]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = gpr_wr_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = gpr_wr_en[2]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = gpr_wr_en[3]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = gpr_wr_en[4]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = gpr_wr_en[5]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = gpr_wr_en[6]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = gpr_wr_en[7]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = gpr_wr_en[8]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_8_io_en = gpr_wr_en[9]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_9_io_en = gpr_wr_en[10]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_10_io_en = gpr_wr_en[11]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = gpr_wr_en[12]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = gpr_wr_en[13]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_13_io_en = gpr_wr_en[14]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_14_io_en = gpr_wr_en[15]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_15_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_15_io_en = gpr_wr_en[16]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_16_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_16_io_en = gpr_wr_en[17]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_17_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_17_io_en = gpr_wr_en[18]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_18_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_18_io_en = gpr_wr_en[19]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_18_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_19_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_19_io_en = gpr_wr_en[20]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_19_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_20_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_20_io_en = gpr_wr_en[21]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_20_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_21_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_21_io_en = gpr_wr_en[22]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_21_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_22_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_22_io_en = gpr_wr_en[23]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_22_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_23_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_23_io_en = gpr_wr_en[24]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_23_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_24_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_24_io_en = gpr_wr_en[25]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_24_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_25_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_25_io_en = gpr_wr_en[26]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_25_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_26_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_26_io_en = gpr_wr_en[27]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_26_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_27_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_27_io_en = gpr_wr_en[28]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_27_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_28_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_28_io_en = gpr_wr_en[29]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_28_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_29_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_29_io_en = gpr_wr_en[30]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_29_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_30_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_30_io_en = gpr_wr_en[31]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_30_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  gpr_out_1 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  gpr_out_2 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  gpr_out_3 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  gpr_out_4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  gpr_out_5 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  gpr_out_6 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  gpr_out_7 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  gpr_out_8 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  gpr_out_9 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  gpr_out_10 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  gpr_out_11 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  gpr_out_12 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  gpr_out_13 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  gpr_out_14 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  gpr_out_15 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  gpr_out_16 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  gpr_out_17 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  gpr_out_18 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  gpr_out_19 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  gpr_out_20 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  gpr_out_21 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  gpr_out_22 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  gpr_out_23 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  gpr_out_24 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  gpr_out_25 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  gpr_out_26 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  gpr_out_27 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  gpr_out_28 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  gpr_out_29 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  gpr_out_30 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  gpr_out_31 = _RAND_30[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    gpr_out_1 = 32'h0;
  end
  if (reset) begin
    gpr_out_2 = 32'h0;
  end
  if (reset) begin
    gpr_out_3 = 32'h0;
  end
  if (reset) begin
    gpr_out_4 = 32'h0;
  end
  if (reset) begin
    gpr_out_5 = 32'h0;
  end
  if (reset) begin
    gpr_out_6 = 32'h0;
  end
  if (reset) begin
    gpr_out_7 = 32'h0;
  end
  if (reset) begin
    gpr_out_8 = 32'h0;
  end
  if (reset) begin
    gpr_out_9 = 32'h0;
  end
  if (reset) begin
    gpr_out_10 = 32'h0;
  end
  if (reset) begin
    gpr_out_11 = 32'h0;
  end
  if (reset) begin
    gpr_out_12 = 32'h0;
  end
  if (reset) begin
    gpr_out_13 = 32'h0;
  end
  if (reset) begin
    gpr_out_14 = 32'h0;
  end
  if (reset) begin
    gpr_out_15 = 32'h0;
  end
  if (reset) begin
    gpr_out_16 = 32'h0;
  end
  if (reset) begin
    gpr_out_17 = 32'h0;
  end
  if (reset) begin
    gpr_out_18 = 32'h0;
  end
  if (reset) begin
    gpr_out_19 = 32'h0;
  end
  if (reset) begin
    gpr_out_20 = 32'h0;
  end
  if (reset) begin
    gpr_out_21 = 32'h0;
  end
  if (reset) begin
    gpr_out_22 = 32'h0;
  end
  if (reset) begin
    gpr_out_23 = 32'h0;
  end
  if (reset) begin
    gpr_out_24 = 32'h0;
  end
  if (reset) begin
    gpr_out_25 = 32'h0;
  end
  if (reset) begin
    gpr_out_26 = 32'h0;
  end
  if (reset) begin
    gpr_out_27 = 32'h0;
  end
  if (reset) begin
    gpr_out_28 = 32'h0;
  end
  if (reset) begin
    gpr_out_29 = 32'h0;
  end
  if (reset) begin
    gpr_out_30 = 32'h0;
  end
  if (reset) begin
    gpr_out_31 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_1 <= 32'h0;
    end else begin
      gpr_out_1 <= _T_12 | _T_15;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_2 <= 32'h0;
    end else begin
      gpr_out_2 <= _T_29 | _T_32;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_3 <= 32'h0;
    end else begin
      gpr_out_3 <= _T_46 | _T_49;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_4 <= 32'h0;
    end else begin
      gpr_out_4 <= _T_63 | _T_66;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_5 <= 32'h0;
    end else begin
      gpr_out_5 <= _T_80 | _T_83;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_6 <= 32'h0;
    end else begin
      gpr_out_6 <= _T_97 | _T_100;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_7 <= 32'h0;
    end else begin
      gpr_out_7 <= _T_114 | _T_117;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_8 <= 32'h0;
    end else begin
      gpr_out_8 <= _T_131 | _T_134;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_9 <= 32'h0;
    end else begin
      gpr_out_9 <= _T_148 | _T_151;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_10 <= 32'h0;
    end else begin
      gpr_out_10 <= _T_165 | _T_168;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_11 <= 32'h0;
    end else begin
      gpr_out_11 <= _T_182 | _T_185;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_12 <= 32'h0;
    end else begin
      gpr_out_12 <= _T_199 | _T_202;
    end
  end
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_13 <= 32'h0;
    end else begin
      gpr_out_13 <= _T_216 | _T_219;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_14 <= 32'h0;
    end else begin
      gpr_out_14 <= _T_233 | _T_236;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_15 <= 32'h0;
    end else begin
      gpr_out_15 <= _T_250 | _T_253;
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_16 <= 32'h0;
    end else begin
      gpr_out_16 <= _T_267 | _T_270;
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_17 <= 32'h0;
    end else begin
      gpr_out_17 <= _T_284 | _T_287;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_18 <= 32'h0;
    end else begin
      gpr_out_18 <= _T_301 | _T_304;
    end
  end
  always @(posedge rvclkhdr_18_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_19 <= 32'h0;
    end else begin
      gpr_out_19 <= _T_318 | _T_321;
    end
  end
  always @(posedge rvclkhdr_19_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_20 <= 32'h0;
    end else begin
      gpr_out_20 <= _T_335 | _T_338;
    end
  end
  always @(posedge rvclkhdr_20_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_21 <= 32'h0;
    end else begin
      gpr_out_21 <= _T_352 | _T_355;
    end
  end
  always @(posedge rvclkhdr_21_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_22 <= 32'h0;
    end else begin
      gpr_out_22 <= _T_369 | _T_372;
    end
  end
  always @(posedge rvclkhdr_22_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_23 <= 32'h0;
    end else begin
      gpr_out_23 <= _T_386 | _T_389;
    end
  end
  always @(posedge rvclkhdr_23_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_24 <= 32'h0;
    end else begin
      gpr_out_24 <= _T_403 | _T_406;
    end
  end
  always @(posedge rvclkhdr_24_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_25 <= 32'h0;
    end else begin
      gpr_out_25 <= _T_420 | _T_423;
    end
  end
  always @(posedge rvclkhdr_25_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_26 <= 32'h0;
    end else begin
      gpr_out_26 <= _T_437 | _T_440;
    end
  end
  always @(posedge rvclkhdr_26_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_27 <= 32'h0;
    end else begin
      gpr_out_27 <= _T_454 | _T_457;
    end
  end
  always @(posedge rvclkhdr_27_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_28 <= 32'h0;
    end else begin
      gpr_out_28 <= _T_471 | _T_474;
    end
  end
  always @(posedge rvclkhdr_28_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_29 <= 32'h0;
    end else begin
      gpr_out_29 <= _T_488 | _T_491;
    end
  end
  always @(posedge rvclkhdr_29_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_30 <= 32'h0;
    end else begin
      gpr_out_30 <= _T_505 | _T_508;
    end
  end
  always @(posedge rvclkhdr_30_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_31 <= 32'h0;
    end else begin
      gpr_out_31 <= _T_522 | _T_525;
    end
  end
endmodule
