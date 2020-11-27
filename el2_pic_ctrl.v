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
module el2_pic_ctrl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_free_clk,
  input         io_active_clk,
  input         io_clk_override,
  input  [31:0] io_extintsrc_req,
  input  [31:0] io_picm_rdaddr,
  input  [31:0] io_picm_wraddr,
  input  [31:0] io_picm_wr_data,
  input         io_picm_wren,
  input         io_picm_rden,
  input         io_picm_mken,
  input  [3:0]  io_meicurpl,
  input  [3:0]  io_meipt,
  output        io_mexintpend,
  output [7:0]  io_claimid,
  output [3:0]  io_pl,
  output [31:0] io_picm_rd_data,
  output        io_mhwakeup
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
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  pic_raddr_c1_clk = rvclkhdr_io_l1clk; // @[el2_pic_ctl.scala 101:42 el2_pic_ctl.scala 138:21]
  reg [31:0] picm_raddr_ff; // @[el2_pic_ctl.scala 107:56]
  wire  pic_data_c1_clk = rvclkhdr_1_io_l1clk; // @[el2_pic_ctl.scala 102:42 el2_pic_ctl.scala 139:21]
  reg [31:0] picm_waddr_ff; // @[el2_pic_ctl.scala 108:57]
  reg  picm_wren_ff; // @[el2_pic_ctl.scala 109:55]
  reg  picm_rden_ff; // @[el2_pic_ctl.scala 110:55]
  reg  picm_mken_ff; // @[el2_pic_ctl.scala 111:55]
  reg [31:0] picm_wr_data_ff; // @[el2_pic_ctl.scala 112:58]
  wire [31:0] _T_6 = picm_raddr_ff ^ 32'hf00c2000; // @[el2_pic_ctl.scala 114:59]
  wire [31:0] temp_raddr_intenable_base_match = ~_T_6; // @[el2_pic_ctl.scala 114:43]
  wire  raddr_intenable_base_match = &temp_raddr_intenable_base_match[31:7]; // @[el2_pic_ctl.scala 115:89]
  wire  raddr_intpriority_base_match = picm_raddr_ff[31:7] == 25'h1e01800; // @[el2_pic_ctl.scala 117:71]
  wire  raddr_config_gw_base_match = picm_raddr_ff[31:7] == 25'h1e01880; // @[el2_pic_ctl.scala 118:71]
  wire  raddr_config_pic_match = picm_raddr_ff == 32'hf00c3000; // @[el2_pic_ctl.scala 119:71]
  wire  addr_intpend_base_match = picm_raddr_ff[31:6] == 26'h3c03040; // @[el2_pic_ctl.scala 120:71]
  wire  waddr_config_pic_match = picm_waddr_ff == 32'hf00c3000; // @[el2_pic_ctl.scala 122:71]
  wire  addr_clear_gw_base_match = picm_waddr_ff[31:7] == 25'h1e018a0; // @[el2_pic_ctl.scala 123:71]
  wire  waddr_intpriority_base_match = picm_waddr_ff[31:7] == 25'h1e01800; // @[el2_pic_ctl.scala 124:71]
  wire  waddr_intenable_base_match = picm_waddr_ff[31:7] == 25'h1e01840; // @[el2_pic_ctl.scala 125:71]
  wire  waddr_config_gw_base_match = picm_waddr_ff[31:7] == 25'h1e01880; // @[el2_pic_ctl.scala 126:71]
  wire  _T_17 = picm_rden_ff & picm_wren_ff; // @[el2_pic_ctl.scala 127:53]
  wire  _T_18 = picm_raddr_ff == picm_waddr_ff; // @[el2_pic_ctl.scala 127:86]
  wire  picm_bypass_ff = _T_17 & _T_18; // @[el2_pic_ctl.scala 127:68]
  wire  _T_19 = io_picm_mken | io_picm_rden; // @[el2_pic_ctl.scala 131:42]
  wire  _T_20 = waddr_intpriority_base_match & picm_wren_ff; // @[el2_pic_ctl.scala 133:59]
  wire  _T_21 = raddr_intpriority_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 133:108]
  wire  _T_22 = _T_20 | _T_21; // @[el2_pic_ctl.scala 133:76]
  wire  _T_23 = waddr_intenable_base_match & picm_wren_ff; // @[el2_pic_ctl.scala 134:57]
  wire  _T_24 = raddr_intenable_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 134:104]
  wire  _T_25 = _T_23 | _T_24; // @[el2_pic_ctl.scala 134:74]
  wire  _T_26 = waddr_config_gw_base_match & picm_wren_ff; // @[el2_pic_ctl.scala 135:59]
  wire  _T_27 = raddr_config_gw_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 135:108]
  wire  _T_28 = _T_26 | _T_27; // @[el2_pic_ctl.scala 135:76]
  reg [30:0] _T_33; // @[el2_lib.scala 177:81]
  reg [30:0] _T_34; // @[el2_lib.scala 177:58]
  wire [31:0] extintsrc_req_sync = {_T_34,io_extintsrc_req[0]}; // @[Cat.scala 29:58]
  wire  _T_37 = picm_waddr_ff[6:2] == 5'h1; // @[el2_pic_ctl.scala 147:139]
  wire  _T_38 = waddr_intpriority_base_match & _T_37; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_1 = _T_38 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_40 = picm_waddr_ff[6:2] == 5'h2; // @[el2_pic_ctl.scala 147:139]
  wire  _T_41 = waddr_intpriority_base_match & _T_40; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_2 = _T_41 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_43 = picm_waddr_ff[6:2] == 5'h3; // @[el2_pic_ctl.scala 147:139]
  wire  _T_44 = waddr_intpriority_base_match & _T_43; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_3 = _T_44 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_46 = picm_waddr_ff[6:2] == 5'h4; // @[el2_pic_ctl.scala 147:139]
  wire  _T_47 = waddr_intpriority_base_match & _T_46; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_4 = _T_47 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_49 = picm_waddr_ff[6:2] == 5'h5; // @[el2_pic_ctl.scala 147:139]
  wire  _T_50 = waddr_intpriority_base_match & _T_49; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_5 = _T_50 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_52 = picm_waddr_ff[6:2] == 5'h6; // @[el2_pic_ctl.scala 147:139]
  wire  _T_53 = waddr_intpriority_base_match & _T_52; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_6 = _T_53 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_55 = picm_waddr_ff[6:2] == 5'h7; // @[el2_pic_ctl.scala 147:139]
  wire  _T_56 = waddr_intpriority_base_match & _T_55; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_7 = _T_56 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_58 = picm_waddr_ff[6:2] == 5'h8; // @[el2_pic_ctl.scala 147:139]
  wire  _T_59 = waddr_intpriority_base_match & _T_58; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_8 = _T_59 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_61 = picm_waddr_ff[6:2] == 5'h9; // @[el2_pic_ctl.scala 147:139]
  wire  _T_62 = waddr_intpriority_base_match & _T_61; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_9 = _T_62 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_64 = picm_waddr_ff[6:2] == 5'ha; // @[el2_pic_ctl.scala 147:139]
  wire  _T_65 = waddr_intpriority_base_match & _T_64; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_10 = _T_65 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_67 = picm_waddr_ff[6:2] == 5'hb; // @[el2_pic_ctl.scala 147:139]
  wire  _T_68 = waddr_intpriority_base_match & _T_67; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_11 = _T_68 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_70 = picm_waddr_ff[6:2] == 5'hc; // @[el2_pic_ctl.scala 147:139]
  wire  _T_71 = waddr_intpriority_base_match & _T_70; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_12 = _T_71 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_73 = picm_waddr_ff[6:2] == 5'hd; // @[el2_pic_ctl.scala 147:139]
  wire  _T_74 = waddr_intpriority_base_match & _T_73; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_13 = _T_74 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_76 = picm_waddr_ff[6:2] == 5'he; // @[el2_pic_ctl.scala 147:139]
  wire  _T_77 = waddr_intpriority_base_match & _T_76; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_14 = _T_77 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_79 = picm_waddr_ff[6:2] == 5'hf; // @[el2_pic_ctl.scala 147:139]
  wire  _T_80 = waddr_intpriority_base_match & _T_79; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_15 = _T_80 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_82 = picm_waddr_ff[6:2] == 5'h10; // @[el2_pic_ctl.scala 147:139]
  wire  _T_83 = waddr_intpriority_base_match & _T_82; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_16 = _T_83 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_85 = picm_waddr_ff[6:2] == 5'h11; // @[el2_pic_ctl.scala 147:139]
  wire  _T_86 = waddr_intpriority_base_match & _T_85; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_17 = _T_86 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_88 = picm_waddr_ff[6:2] == 5'h12; // @[el2_pic_ctl.scala 147:139]
  wire  _T_89 = waddr_intpriority_base_match & _T_88; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_18 = _T_89 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_91 = picm_waddr_ff[6:2] == 5'h13; // @[el2_pic_ctl.scala 147:139]
  wire  _T_92 = waddr_intpriority_base_match & _T_91; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_19 = _T_92 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_94 = picm_waddr_ff[6:2] == 5'h14; // @[el2_pic_ctl.scala 147:139]
  wire  _T_95 = waddr_intpriority_base_match & _T_94; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_20 = _T_95 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_97 = picm_waddr_ff[6:2] == 5'h15; // @[el2_pic_ctl.scala 147:139]
  wire  _T_98 = waddr_intpriority_base_match & _T_97; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_21 = _T_98 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_100 = picm_waddr_ff[6:2] == 5'h16; // @[el2_pic_ctl.scala 147:139]
  wire  _T_101 = waddr_intpriority_base_match & _T_100; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_22 = _T_101 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_103 = picm_waddr_ff[6:2] == 5'h17; // @[el2_pic_ctl.scala 147:139]
  wire  _T_104 = waddr_intpriority_base_match & _T_103; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_23 = _T_104 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_106 = picm_waddr_ff[6:2] == 5'h18; // @[el2_pic_ctl.scala 147:139]
  wire  _T_107 = waddr_intpriority_base_match & _T_106; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_24 = _T_107 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_109 = picm_waddr_ff[6:2] == 5'h19; // @[el2_pic_ctl.scala 147:139]
  wire  _T_110 = waddr_intpriority_base_match & _T_109; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_25 = _T_110 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_112 = picm_waddr_ff[6:2] == 5'h1a; // @[el2_pic_ctl.scala 147:139]
  wire  _T_113 = waddr_intpriority_base_match & _T_112; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_26 = _T_113 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_115 = picm_waddr_ff[6:2] == 5'h1b; // @[el2_pic_ctl.scala 147:139]
  wire  _T_116 = waddr_intpriority_base_match & _T_115; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_27 = _T_116 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_118 = picm_waddr_ff[6:2] == 5'h1c; // @[el2_pic_ctl.scala 147:139]
  wire  _T_119 = waddr_intpriority_base_match & _T_118; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_28 = _T_119 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_121 = picm_waddr_ff[6:2] == 5'h1d; // @[el2_pic_ctl.scala 147:139]
  wire  _T_122 = waddr_intpriority_base_match & _T_121; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_29 = _T_122 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_124 = picm_waddr_ff[6:2] == 5'h1e; // @[el2_pic_ctl.scala 147:139]
  wire  _T_125 = waddr_intpriority_base_match & _T_124; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_30 = _T_125 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_127 = picm_waddr_ff[6:2] == 5'h1f; // @[el2_pic_ctl.scala 147:139]
  wire  _T_128 = waddr_intpriority_base_match & _T_127; // @[el2_pic_ctl.scala 147:106]
  wire  intpriority_reg_we_31 = _T_128 & picm_wren_ff; // @[el2_pic_ctl.scala 147:153]
  wire  _T_130 = picm_raddr_ff[6:2] == 5'h1; // @[el2_pic_ctl.scala 148:139]
  wire  _T_131 = raddr_intpriority_base_match & _T_130; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_1 = _T_131 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_133 = picm_raddr_ff[6:2] == 5'h2; // @[el2_pic_ctl.scala 148:139]
  wire  _T_134 = raddr_intpriority_base_match & _T_133; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_2 = _T_134 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_136 = picm_raddr_ff[6:2] == 5'h3; // @[el2_pic_ctl.scala 148:139]
  wire  _T_137 = raddr_intpriority_base_match & _T_136; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_3 = _T_137 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_139 = picm_raddr_ff[6:2] == 5'h4; // @[el2_pic_ctl.scala 148:139]
  wire  _T_140 = raddr_intpriority_base_match & _T_139; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_4 = _T_140 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_142 = picm_raddr_ff[6:2] == 5'h5; // @[el2_pic_ctl.scala 148:139]
  wire  _T_143 = raddr_intpriority_base_match & _T_142; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_5 = _T_143 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_145 = picm_raddr_ff[6:2] == 5'h6; // @[el2_pic_ctl.scala 148:139]
  wire  _T_146 = raddr_intpriority_base_match & _T_145; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_6 = _T_146 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_148 = picm_raddr_ff[6:2] == 5'h7; // @[el2_pic_ctl.scala 148:139]
  wire  _T_149 = raddr_intpriority_base_match & _T_148; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_7 = _T_149 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_151 = picm_raddr_ff[6:2] == 5'h8; // @[el2_pic_ctl.scala 148:139]
  wire  _T_152 = raddr_intpriority_base_match & _T_151; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_8 = _T_152 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_154 = picm_raddr_ff[6:2] == 5'h9; // @[el2_pic_ctl.scala 148:139]
  wire  _T_155 = raddr_intpriority_base_match & _T_154; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_9 = _T_155 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_157 = picm_raddr_ff[6:2] == 5'ha; // @[el2_pic_ctl.scala 148:139]
  wire  _T_158 = raddr_intpriority_base_match & _T_157; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_10 = _T_158 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_160 = picm_raddr_ff[6:2] == 5'hb; // @[el2_pic_ctl.scala 148:139]
  wire  _T_161 = raddr_intpriority_base_match & _T_160; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_11 = _T_161 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_163 = picm_raddr_ff[6:2] == 5'hc; // @[el2_pic_ctl.scala 148:139]
  wire  _T_164 = raddr_intpriority_base_match & _T_163; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_12 = _T_164 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_166 = picm_raddr_ff[6:2] == 5'hd; // @[el2_pic_ctl.scala 148:139]
  wire  _T_167 = raddr_intpriority_base_match & _T_166; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_13 = _T_167 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_169 = picm_raddr_ff[6:2] == 5'he; // @[el2_pic_ctl.scala 148:139]
  wire  _T_170 = raddr_intpriority_base_match & _T_169; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_14 = _T_170 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_172 = picm_raddr_ff[6:2] == 5'hf; // @[el2_pic_ctl.scala 148:139]
  wire  _T_173 = raddr_intpriority_base_match & _T_172; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_15 = _T_173 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_175 = picm_raddr_ff[6:2] == 5'h10; // @[el2_pic_ctl.scala 148:139]
  wire  _T_176 = raddr_intpriority_base_match & _T_175; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_16 = _T_176 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_178 = picm_raddr_ff[6:2] == 5'h11; // @[el2_pic_ctl.scala 148:139]
  wire  _T_179 = raddr_intpriority_base_match & _T_178; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_17 = _T_179 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_181 = picm_raddr_ff[6:2] == 5'h12; // @[el2_pic_ctl.scala 148:139]
  wire  _T_182 = raddr_intpriority_base_match & _T_181; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_18 = _T_182 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_184 = picm_raddr_ff[6:2] == 5'h13; // @[el2_pic_ctl.scala 148:139]
  wire  _T_185 = raddr_intpriority_base_match & _T_184; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_19 = _T_185 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_187 = picm_raddr_ff[6:2] == 5'h14; // @[el2_pic_ctl.scala 148:139]
  wire  _T_188 = raddr_intpriority_base_match & _T_187; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_20 = _T_188 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_190 = picm_raddr_ff[6:2] == 5'h15; // @[el2_pic_ctl.scala 148:139]
  wire  _T_191 = raddr_intpriority_base_match & _T_190; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_21 = _T_191 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_193 = picm_raddr_ff[6:2] == 5'h16; // @[el2_pic_ctl.scala 148:139]
  wire  _T_194 = raddr_intpriority_base_match & _T_193; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_22 = _T_194 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_196 = picm_raddr_ff[6:2] == 5'h17; // @[el2_pic_ctl.scala 148:139]
  wire  _T_197 = raddr_intpriority_base_match & _T_196; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_23 = _T_197 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_199 = picm_raddr_ff[6:2] == 5'h18; // @[el2_pic_ctl.scala 148:139]
  wire  _T_200 = raddr_intpriority_base_match & _T_199; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_24 = _T_200 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_202 = picm_raddr_ff[6:2] == 5'h19; // @[el2_pic_ctl.scala 148:139]
  wire  _T_203 = raddr_intpriority_base_match & _T_202; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_25 = _T_203 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_205 = picm_raddr_ff[6:2] == 5'h1a; // @[el2_pic_ctl.scala 148:139]
  wire  _T_206 = raddr_intpriority_base_match & _T_205; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_26 = _T_206 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_208 = picm_raddr_ff[6:2] == 5'h1b; // @[el2_pic_ctl.scala 148:139]
  wire  _T_209 = raddr_intpriority_base_match & _T_208; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_27 = _T_209 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_211 = picm_raddr_ff[6:2] == 5'h1c; // @[el2_pic_ctl.scala 148:139]
  wire  _T_212 = raddr_intpriority_base_match & _T_211; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_28 = _T_212 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_214 = picm_raddr_ff[6:2] == 5'h1d; // @[el2_pic_ctl.scala 148:139]
  wire  _T_215 = raddr_intpriority_base_match & _T_214; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_29 = _T_215 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_217 = picm_raddr_ff[6:2] == 5'h1e; // @[el2_pic_ctl.scala 148:139]
  wire  _T_218 = raddr_intpriority_base_match & _T_217; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_30 = _T_218 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_220 = picm_raddr_ff[6:2] == 5'h1f; // @[el2_pic_ctl.scala 148:139]
  wire  _T_221 = raddr_intpriority_base_match & _T_220; // @[el2_pic_ctl.scala 148:106]
  wire  intpriority_reg_re_31 = _T_221 & picm_rden_ff; // @[el2_pic_ctl.scala 148:153]
  wire  _T_224 = waddr_intenable_base_match & _T_37; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_1 = _T_224 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_227 = waddr_intenable_base_match & _T_40; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_2 = _T_227 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_230 = waddr_intenable_base_match & _T_43; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_3 = _T_230 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_233 = waddr_intenable_base_match & _T_46; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_4 = _T_233 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_236 = waddr_intenable_base_match & _T_49; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_5 = _T_236 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_239 = waddr_intenable_base_match & _T_52; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_6 = _T_239 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_242 = waddr_intenable_base_match & _T_55; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_7 = _T_242 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_245 = waddr_intenable_base_match & _T_58; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_8 = _T_245 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_248 = waddr_intenable_base_match & _T_61; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_9 = _T_248 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_251 = waddr_intenable_base_match & _T_64; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_10 = _T_251 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_254 = waddr_intenable_base_match & _T_67; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_11 = _T_254 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_257 = waddr_intenable_base_match & _T_70; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_12 = _T_257 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_260 = waddr_intenable_base_match & _T_73; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_13 = _T_260 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_263 = waddr_intenable_base_match & _T_76; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_14 = _T_263 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_266 = waddr_intenable_base_match & _T_79; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_15 = _T_266 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_269 = waddr_intenable_base_match & _T_82; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_16 = _T_269 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_272 = waddr_intenable_base_match & _T_85; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_17 = _T_272 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_275 = waddr_intenable_base_match & _T_88; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_18 = _T_275 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_278 = waddr_intenable_base_match & _T_91; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_19 = _T_278 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_281 = waddr_intenable_base_match & _T_94; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_20 = _T_281 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_284 = waddr_intenable_base_match & _T_97; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_21 = _T_284 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_287 = waddr_intenable_base_match & _T_100; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_22 = _T_287 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_290 = waddr_intenable_base_match & _T_103; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_23 = _T_290 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_293 = waddr_intenable_base_match & _T_106; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_24 = _T_293 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_296 = waddr_intenable_base_match & _T_109; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_25 = _T_296 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_299 = waddr_intenable_base_match & _T_112; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_26 = _T_299 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_302 = waddr_intenable_base_match & _T_115; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_27 = _T_302 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_305 = waddr_intenable_base_match & _T_118; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_28 = _T_305 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_308 = waddr_intenable_base_match & _T_121; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_29 = _T_308 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_311 = waddr_intenable_base_match & _T_124; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_30 = _T_311 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_314 = waddr_intenable_base_match & _T_127; // @[el2_pic_ctl.scala 149:106]
  wire  intenable_reg_we_31 = _T_314 & picm_wren_ff; // @[el2_pic_ctl.scala 149:153]
  wire  _T_407 = raddr_intenable_base_match & _T_220; // @[el2_pic_ctl.scala 150:106]
  wire  intenable_reg_re_31 = _T_407 & picm_rden_ff; // @[el2_pic_ctl.scala 150:153]
  wire  _T_410 = waddr_config_gw_base_match & _T_37; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_1 = _T_410 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_413 = waddr_config_gw_base_match & _T_40; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_2 = _T_413 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_416 = waddr_config_gw_base_match & _T_43; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_3 = _T_416 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_419 = waddr_config_gw_base_match & _T_46; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_4 = _T_419 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_422 = waddr_config_gw_base_match & _T_49; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_5 = _T_422 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_425 = waddr_config_gw_base_match & _T_52; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_6 = _T_425 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_428 = waddr_config_gw_base_match & _T_55; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_7 = _T_428 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_431 = waddr_config_gw_base_match & _T_58; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_8 = _T_431 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_434 = waddr_config_gw_base_match & _T_61; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_9 = _T_434 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_437 = waddr_config_gw_base_match & _T_64; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_10 = _T_437 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_440 = waddr_config_gw_base_match & _T_67; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_11 = _T_440 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_443 = waddr_config_gw_base_match & _T_70; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_12 = _T_443 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_446 = waddr_config_gw_base_match & _T_73; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_13 = _T_446 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_449 = waddr_config_gw_base_match & _T_76; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_14 = _T_449 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_452 = waddr_config_gw_base_match & _T_79; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_15 = _T_452 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_455 = waddr_config_gw_base_match & _T_82; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_16 = _T_455 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_458 = waddr_config_gw_base_match & _T_85; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_17 = _T_458 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_461 = waddr_config_gw_base_match & _T_88; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_18 = _T_461 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_464 = waddr_config_gw_base_match & _T_91; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_19 = _T_464 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_467 = waddr_config_gw_base_match & _T_94; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_20 = _T_467 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_470 = waddr_config_gw_base_match & _T_97; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_21 = _T_470 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_473 = waddr_config_gw_base_match & _T_100; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_22 = _T_473 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_476 = waddr_config_gw_base_match & _T_103; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_23 = _T_476 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_479 = waddr_config_gw_base_match & _T_106; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_24 = _T_479 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_482 = waddr_config_gw_base_match & _T_109; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_25 = _T_482 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_485 = waddr_config_gw_base_match & _T_112; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_26 = _T_485 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_488 = waddr_config_gw_base_match & _T_115; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_27 = _T_488 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_491 = waddr_config_gw_base_match & _T_118; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_28 = _T_491 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_494 = waddr_config_gw_base_match & _T_121; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_29 = _T_494 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_497 = waddr_config_gw_base_match & _T_124; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_30 = _T_497 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_500 = waddr_config_gw_base_match & _T_127; // @[el2_pic_ctl.scala 151:106]
  wire  gw_config_reg_we_31 = _T_500 & picm_wren_ff; // @[el2_pic_ctl.scala 151:153]
  wire  _T_503 = raddr_config_gw_base_match & _T_130; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_1 = _T_503 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_506 = raddr_config_gw_base_match & _T_133; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_2 = _T_506 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_509 = raddr_config_gw_base_match & _T_136; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_3 = _T_509 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_512 = raddr_config_gw_base_match & _T_139; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_4 = _T_512 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_515 = raddr_config_gw_base_match & _T_142; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_5 = _T_515 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_518 = raddr_config_gw_base_match & _T_145; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_6 = _T_518 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_521 = raddr_config_gw_base_match & _T_148; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_7 = _T_521 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_524 = raddr_config_gw_base_match & _T_151; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_8 = _T_524 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_527 = raddr_config_gw_base_match & _T_154; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_9 = _T_527 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_530 = raddr_config_gw_base_match & _T_157; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_10 = _T_530 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_533 = raddr_config_gw_base_match & _T_160; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_11 = _T_533 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_536 = raddr_config_gw_base_match & _T_163; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_12 = _T_536 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_539 = raddr_config_gw_base_match & _T_166; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_13 = _T_539 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_542 = raddr_config_gw_base_match & _T_169; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_14 = _T_542 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_545 = raddr_config_gw_base_match & _T_172; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_15 = _T_545 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_548 = raddr_config_gw_base_match & _T_175; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_16 = _T_548 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_551 = raddr_config_gw_base_match & _T_178; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_17 = _T_551 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_554 = raddr_config_gw_base_match & _T_181; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_18 = _T_554 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_557 = raddr_config_gw_base_match & _T_184; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_19 = _T_557 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_560 = raddr_config_gw_base_match & _T_187; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_20 = _T_560 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_563 = raddr_config_gw_base_match & _T_190; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_21 = _T_563 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_566 = raddr_config_gw_base_match & _T_193; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_22 = _T_566 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_569 = raddr_config_gw_base_match & _T_196; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_23 = _T_569 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_572 = raddr_config_gw_base_match & _T_199; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_24 = _T_572 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_575 = raddr_config_gw_base_match & _T_202; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_25 = _T_575 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_578 = raddr_config_gw_base_match & _T_205; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_26 = _T_578 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_581 = raddr_config_gw_base_match & _T_208; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_27 = _T_581 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_584 = raddr_config_gw_base_match & _T_211; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_28 = _T_584 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_587 = raddr_config_gw_base_match & _T_214; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_29 = _T_587 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_590 = raddr_config_gw_base_match & _T_217; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_30 = _T_590 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_593 = raddr_config_gw_base_match & _T_220; // @[el2_pic_ctl.scala 152:106]
  wire  gw_config_reg_re_31 = _T_593 & picm_rden_ff; // @[el2_pic_ctl.scala 152:153]
  wire  _T_596 = addr_clear_gw_base_match & _T_37; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_1 = _T_596 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_599 = addr_clear_gw_base_match & _T_40; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_2 = _T_599 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_602 = addr_clear_gw_base_match & _T_43; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_3 = _T_602 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_605 = addr_clear_gw_base_match & _T_46; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_4 = _T_605 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_608 = addr_clear_gw_base_match & _T_49; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_5 = _T_608 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_611 = addr_clear_gw_base_match & _T_52; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_6 = _T_611 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_614 = addr_clear_gw_base_match & _T_55; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_7 = _T_614 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_617 = addr_clear_gw_base_match & _T_58; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_8 = _T_617 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_620 = addr_clear_gw_base_match & _T_61; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_9 = _T_620 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_623 = addr_clear_gw_base_match & _T_64; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_10 = _T_623 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_626 = addr_clear_gw_base_match & _T_67; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_11 = _T_626 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_629 = addr_clear_gw_base_match & _T_70; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_12 = _T_629 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_632 = addr_clear_gw_base_match & _T_73; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_13 = _T_632 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_635 = addr_clear_gw_base_match & _T_76; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_14 = _T_635 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_638 = addr_clear_gw_base_match & _T_79; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_15 = _T_638 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_641 = addr_clear_gw_base_match & _T_82; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_16 = _T_641 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_644 = addr_clear_gw_base_match & _T_85; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_17 = _T_644 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_647 = addr_clear_gw_base_match & _T_88; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_18 = _T_647 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_650 = addr_clear_gw_base_match & _T_91; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_19 = _T_650 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_653 = addr_clear_gw_base_match & _T_94; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_20 = _T_653 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_656 = addr_clear_gw_base_match & _T_97; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_21 = _T_656 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_659 = addr_clear_gw_base_match & _T_100; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_22 = _T_659 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_662 = addr_clear_gw_base_match & _T_103; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_23 = _T_662 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_665 = addr_clear_gw_base_match & _T_106; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_24 = _T_665 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_668 = addr_clear_gw_base_match & _T_109; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_25 = _T_668 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_671 = addr_clear_gw_base_match & _T_112; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_26 = _T_671 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_674 = addr_clear_gw_base_match & _T_115; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_27 = _T_674 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_677 = addr_clear_gw_base_match & _T_118; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_28 = _T_677 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_680 = addr_clear_gw_base_match & _T_121; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_29 = _T_680 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_683 = addr_clear_gw_base_match & _T_124; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_30 = _T_683 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  _T_686 = addr_clear_gw_base_match & _T_127; // @[el2_pic_ctl.scala 153:106]
  wire  gw_clear_reg_we_31 = _T_686 & picm_wren_ff; // @[el2_pic_ctl.scala 153:153]
  wire  pic_pri_c1_clk = rvclkhdr_2_io_l1clk; // @[el2_pic_ctl.scala 103:42 el2_pic_ctl.scala 140:21]
  reg [3:0] intpriority_reg_1; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_2; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_3; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_4; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_5; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_6; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_7; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_8; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_9; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_10; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_11; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_12; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_13; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_14; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_15; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_16; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_17; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_18; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_19; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_20; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_21; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_22; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_23; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_24; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_25; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_26; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_27; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_28; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_29; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_30; // @[Reg.scala 27:20]
  reg [3:0] intpriority_reg_31; // @[Reg.scala 27:20]
  wire  pic_int_c1_clk = rvclkhdr_3_io_l1clk; // @[el2_pic_ctl.scala 104:42 el2_pic_ctl.scala 141:21]
  reg  intenable_reg_1; // @[Reg.scala 27:20]
  reg  intenable_reg_2; // @[Reg.scala 27:20]
  reg  intenable_reg_3; // @[Reg.scala 27:20]
  reg  intenable_reg_4; // @[Reg.scala 27:20]
  reg  intenable_reg_5; // @[Reg.scala 27:20]
  reg  intenable_reg_6; // @[Reg.scala 27:20]
  reg  intenable_reg_7; // @[Reg.scala 27:20]
  reg  intenable_reg_8; // @[Reg.scala 27:20]
  reg  intenable_reg_9; // @[Reg.scala 27:20]
  reg  intenable_reg_10; // @[Reg.scala 27:20]
  reg  intenable_reg_11; // @[Reg.scala 27:20]
  reg  intenable_reg_12; // @[Reg.scala 27:20]
  reg  intenable_reg_13; // @[Reg.scala 27:20]
  reg  intenable_reg_14; // @[Reg.scala 27:20]
  reg  intenable_reg_15; // @[Reg.scala 27:20]
  reg  intenable_reg_16; // @[Reg.scala 27:20]
  reg  intenable_reg_17; // @[Reg.scala 27:20]
  reg  intenable_reg_18; // @[Reg.scala 27:20]
  reg  intenable_reg_19; // @[Reg.scala 27:20]
  reg  intenable_reg_20; // @[Reg.scala 27:20]
  reg  intenable_reg_21; // @[Reg.scala 27:20]
  reg  intenable_reg_22; // @[Reg.scala 27:20]
  reg  intenable_reg_23; // @[Reg.scala 27:20]
  reg  intenable_reg_24; // @[Reg.scala 27:20]
  reg  intenable_reg_25; // @[Reg.scala 27:20]
  reg  intenable_reg_26; // @[Reg.scala 27:20]
  reg  intenable_reg_27; // @[Reg.scala 27:20]
  reg  intenable_reg_28; // @[Reg.scala 27:20]
  reg  intenable_reg_29; // @[Reg.scala 27:20]
  reg  intenable_reg_30; // @[Reg.scala 27:20]
  reg  intenable_reg_31; // @[Reg.scala 27:20]
  wire  gw_config_c1_clk = rvclkhdr_4_io_l1clk; // @[el2_pic_ctl.scala 105:42 el2_pic_ctl.scala 142:21]
  reg [1:0] gw_config_reg_1; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_2; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_3; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_4; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_5; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_6; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_7; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_8; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_9; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_10; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_11; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_12; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_13; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_14; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_15; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_16; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_17; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_18; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_19; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_20; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_21; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_22; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_23; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_24; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_25; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_26; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_27; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_28; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_29; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_30; // @[Reg.scala 27:20]
  reg [1:0] gw_config_reg_31; // @[Reg.scala 27:20]
  wire  _T_970 = extintsrc_req_sync[1] ^ gw_config_reg_1[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_971 = ~gw_clear_reg_we_1; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending; // @[el2_pic_ctl.scala 38:30]
  wire  _T_972 = gw_int_pending & _T_971; // @[el2_pic_ctl.scala 37:90]
  wire  _T_976 = _T_970 | gw_int_pending; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_1 = gw_config_reg_1[1] ? _T_976 : _T_970; // @[el2_pic_ctl.scala 39:8]
  wire  _T_982 = extintsrc_req_sync[2] ^ gw_config_reg_2[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_983 = ~gw_clear_reg_we_2; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_1; // @[el2_pic_ctl.scala 38:30]
  wire  _T_984 = gw_int_pending_1 & _T_983; // @[el2_pic_ctl.scala 37:90]
  wire  _T_988 = _T_982 | gw_int_pending_1; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_2 = gw_config_reg_2[1] ? _T_988 : _T_982; // @[el2_pic_ctl.scala 39:8]
  wire  _T_994 = extintsrc_req_sync[3] ^ gw_config_reg_3[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_995 = ~gw_clear_reg_we_3; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_2; // @[el2_pic_ctl.scala 38:30]
  wire  _T_996 = gw_int_pending_2 & _T_995; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1000 = _T_994 | gw_int_pending_2; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_3 = gw_config_reg_3[1] ? _T_1000 : _T_994; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1006 = extintsrc_req_sync[4] ^ gw_config_reg_4[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1007 = ~gw_clear_reg_we_4; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_3; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1008 = gw_int_pending_3 & _T_1007; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1012 = _T_1006 | gw_int_pending_3; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_4 = gw_config_reg_4[1] ? _T_1012 : _T_1006; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1018 = extintsrc_req_sync[5] ^ gw_config_reg_5[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1019 = ~gw_clear_reg_we_5; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_4; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1020 = gw_int_pending_4 & _T_1019; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1024 = _T_1018 | gw_int_pending_4; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_5 = gw_config_reg_5[1] ? _T_1024 : _T_1018; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1030 = extintsrc_req_sync[6] ^ gw_config_reg_6[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1031 = ~gw_clear_reg_we_6; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_5; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1032 = gw_int_pending_5 & _T_1031; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1036 = _T_1030 | gw_int_pending_5; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_6 = gw_config_reg_6[1] ? _T_1036 : _T_1030; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1042 = extintsrc_req_sync[7] ^ gw_config_reg_7[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1043 = ~gw_clear_reg_we_7; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_6; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1044 = gw_int_pending_6 & _T_1043; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1048 = _T_1042 | gw_int_pending_6; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_7 = gw_config_reg_7[1] ? _T_1048 : _T_1042; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1054 = extintsrc_req_sync[8] ^ gw_config_reg_8[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1055 = ~gw_clear_reg_we_8; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_7; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1056 = gw_int_pending_7 & _T_1055; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1060 = _T_1054 | gw_int_pending_7; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_8 = gw_config_reg_8[1] ? _T_1060 : _T_1054; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1066 = extintsrc_req_sync[9] ^ gw_config_reg_9[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1067 = ~gw_clear_reg_we_9; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_8; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1068 = gw_int_pending_8 & _T_1067; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1072 = _T_1066 | gw_int_pending_8; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_9 = gw_config_reg_9[1] ? _T_1072 : _T_1066; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1078 = extintsrc_req_sync[10] ^ gw_config_reg_10[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1079 = ~gw_clear_reg_we_10; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_9; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1080 = gw_int_pending_9 & _T_1079; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1084 = _T_1078 | gw_int_pending_9; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_10 = gw_config_reg_10[1] ? _T_1084 : _T_1078; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1090 = extintsrc_req_sync[11] ^ gw_config_reg_11[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1091 = ~gw_clear_reg_we_11; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_10; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1092 = gw_int_pending_10 & _T_1091; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1096 = _T_1090 | gw_int_pending_10; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_11 = gw_config_reg_11[1] ? _T_1096 : _T_1090; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1102 = extintsrc_req_sync[12] ^ gw_config_reg_12[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1103 = ~gw_clear_reg_we_12; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_11; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1104 = gw_int_pending_11 & _T_1103; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1108 = _T_1102 | gw_int_pending_11; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_12 = gw_config_reg_12[1] ? _T_1108 : _T_1102; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1114 = extintsrc_req_sync[13] ^ gw_config_reg_13[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1115 = ~gw_clear_reg_we_13; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_12; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1116 = gw_int_pending_12 & _T_1115; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1120 = _T_1114 | gw_int_pending_12; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_13 = gw_config_reg_13[1] ? _T_1120 : _T_1114; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1126 = extintsrc_req_sync[14] ^ gw_config_reg_14[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1127 = ~gw_clear_reg_we_14; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_13; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1128 = gw_int_pending_13 & _T_1127; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1132 = _T_1126 | gw_int_pending_13; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_14 = gw_config_reg_14[1] ? _T_1132 : _T_1126; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1138 = extintsrc_req_sync[15] ^ gw_config_reg_15[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1139 = ~gw_clear_reg_we_15; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_14; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1140 = gw_int_pending_14 & _T_1139; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1144 = _T_1138 | gw_int_pending_14; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_15 = gw_config_reg_15[1] ? _T_1144 : _T_1138; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1150 = extintsrc_req_sync[16] ^ gw_config_reg_16[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1151 = ~gw_clear_reg_we_16; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_15; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1152 = gw_int_pending_15 & _T_1151; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1156 = _T_1150 | gw_int_pending_15; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_16 = gw_config_reg_16[1] ? _T_1156 : _T_1150; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1162 = extintsrc_req_sync[17] ^ gw_config_reg_17[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1163 = ~gw_clear_reg_we_17; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_16; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1164 = gw_int_pending_16 & _T_1163; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1168 = _T_1162 | gw_int_pending_16; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_17 = gw_config_reg_17[1] ? _T_1168 : _T_1162; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1174 = extintsrc_req_sync[18] ^ gw_config_reg_18[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1175 = ~gw_clear_reg_we_18; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_17; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1176 = gw_int_pending_17 & _T_1175; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1180 = _T_1174 | gw_int_pending_17; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_18 = gw_config_reg_18[1] ? _T_1180 : _T_1174; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1186 = extintsrc_req_sync[19] ^ gw_config_reg_19[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1187 = ~gw_clear_reg_we_19; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_18; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1188 = gw_int_pending_18 & _T_1187; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1192 = _T_1186 | gw_int_pending_18; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_19 = gw_config_reg_19[1] ? _T_1192 : _T_1186; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1198 = extintsrc_req_sync[20] ^ gw_config_reg_20[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1199 = ~gw_clear_reg_we_20; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_19; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1200 = gw_int_pending_19 & _T_1199; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1204 = _T_1198 | gw_int_pending_19; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_20 = gw_config_reg_20[1] ? _T_1204 : _T_1198; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1210 = extintsrc_req_sync[21] ^ gw_config_reg_21[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1211 = ~gw_clear_reg_we_21; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_20; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1212 = gw_int_pending_20 & _T_1211; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1216 = _T_1210 | gw_int_pending_20; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_21 = gw_config_reg_21[1] ? _T_1216 : _T_1210; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1222 = extintsrc_req_sync[22] ^ gw_config_reg_22[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1223 = ~gw_clear_reg_we_22; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_21; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1224 = gw_int_pending_21 & _T_1223; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1228 = _T_1222 | gw_int_pending_21; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_22 = gw_config_reg_22[1] ? _T_1228 : _T_1222; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1234 = extintsrc_req_sync[23] ^ gw_config_reg_23[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1235 = ~gw_clear_reg_we_23; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_22; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1236 = gw_int_pending_22 & _T_1235; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1240 = _T_1234 | gw_int_pending_22; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_23 = gw_config_reg_23[1] ? _T_1240 : _T_1234; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1246 = extintsrc_req_sync[24] ^ gw_config_reg_24[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1247 = ~gw_clear_reg_we_24; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_23; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1248 = gw_int_pending_23 & _T_1247; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1252 = _T_1246 | gw_int_pending_23; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_24 = gw_config_reg_24[1] ? _T_1252 : _T_1246; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1258 = extintsrc_req_sync[25] ^ gw_config_reg_25[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1259 = ~gw_clear_reg_we_25; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_24; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1260 = gw_int_pending_24 & _T_1259; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1264 = _T_1258 | gw_int_pending_24; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_25 = gw_config_reg_25[1] ? _T_1264 : _T_1258; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1270 = extintsrc_req_sync[26] ^ gw_config_reg_26[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1271 = ~gw_clear_reg_we_26; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_25; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1272 = gw_int_pending_25 & _T_1271; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1276 = _T_1270 | gw_int_pending_25; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_26 = gw_config_reg_26[1] ? _T_1276 : _T_1270; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1282 = extintsrc_req_sync[27] ^ gw_config_reg_27[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1283 = ~gw_clear_reg_we_27; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_26; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1284 = gw_int_pending_26 & _T_1283; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1288 = _T_1282 | gw_int_pending_26; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_27 = gw_config_reg_27[1] ? _T_1288 : _T_1282; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1294 = extintsrc_req_sync[28] ^ gw_config_reg_28[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1295 = ~gw_clear_reg_we_28; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_27; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1296 = gw_int_pending_27 & _T_1295; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1300 = _T_1294 | gw_int_pending_27; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_28 = gw_config_reg_28[1] ? _T_1300 : _T_1294; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1306 = extintsrc_req_sync[29] ^ gw_config_reg_29[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1307 = ~gw_clear_reg_we_29; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_28; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1308 = gw_int_pending_28 & _T_1307; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1312 = _T_1306 | gw_int_pending_28; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_29 = gw_config_reg_29[1] ? _T_1312 : _T_1306; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1318 = extintsrc_req_sync[30] ^ gw_config_reg_30[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1319 = ~gw_clear_reg_we_30; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_29; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1320 = gw_int_pending_29 & _T_1319; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1324 = _T_1318 | gw_int_pending_29; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_30 = gw_config_reg_30[1] ? _T_1324 : _T_1318; // @[el2_pic_ctl.scala 39:8]
  wire  _T_1330 = extintsrc_req_sync[31] ^ gw_config_reg_31[0]; // @[el2_pic_ctl.scala 37:50]
  wire  _T_1331 = ~gw_clear_reg_we_31; // @[el2_pic_ctl.scala 37:92]
  reg  gw_int_pending_30; // @[el2_pic_ctl.scala 38:30]
  wire  _T_1332 = gw_int_pending_30 & _T_1331; // @[el2_pic_ctl.scala 37:90]
  wire  _T_1336 = _T_1330 | gw_int_pending_30; // @[el2_pic_ctl.scala 39:78]
  wire  extintsrc_req_gw_31 = gw_config_reg_31[1] ? _T_1336 : _T_1330; // @[el2_pic_ctl.scala 39:8]
  reg  config_reg; // @[Reg.scala 27:20]
  wire [3:0] intpriority_reg_0 = 4'h0; // @[el2_pic_ctl.scala 154:32 el2_pic_ctl.scala 155:208]
  wire [3:0] _T_1342 = ~intpriority_reg_1; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_1 = config_reg ? _T_1342 : intpriority_reg_1; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1345 = ~intpriority_reg_2; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_2 = config_reg ? _T_1345 : intpriority_reg_2; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1348 = ~intpriority_reg_3; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_3 = config_reg ? _T_1348 : intpriority_reg_3; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1351 = ~intpriority_reg_4; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_4 = config_reg ? _T_1351 : intpriority_reg_4; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1354 = ~intpriority_reg_5; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_5 = config_reg ? _T_1354 : intpriority_reg_5; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1357 = ~intpriority_reg_6; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_6 = config_reg ? _T_1357 : intpriority_reg_6; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1360 = ~intpriority_reg_7; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_7 = config_reg ? _T_1360 : intpriority_reg_7; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1363 = ~intpriority_reg_8; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_8 = config_reg ? _T_1363 : intpriority_reg_8; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1366 = ~intpriority_reg_9; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_9 = config_reg ? _T_1366 : intpriority_reg_9; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1369 = ~intpriority_reg_10; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_10 = config_reg ? _T_1369 : intpriority_reg_10; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1372 = ~intpriority_reg_11; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_11 = config_reg ? _T_1372 : intpriority_reg_11; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1375 = ~intpriority_reg_12; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_12 = config_reg ? _T_1375 : intpriority_reg_12; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1378 = ~intpriority_reg_13; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_13 = config_reg ? _T_1378 : intpriority_reg_13; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1381 = ~intpriority_reg_14; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_14 = config_reg ? _T_1381 : intpriority_reg_14; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1384 = ~intpriority_reg_15; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_15 = config_reg ? _T_1384 : intpriority_reg_15; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1387 = ~intpriority_reg_16; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_16 = config_reg ? _T_1387 : intpriority_reg_16; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1390 = ~intpriority_reg_17; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_17 = config_reg ? _T_1390 : intpriority_reg_17; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1393 = ~intpriority_reg_18; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_18 = config_reg ? _T_1393 : intpriority_reg_18; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1396 = ~intpriority_reg_19; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_19 = config_reg ? _T_1396 : intpriority_reg_19; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1399 = ~intpriority_reg_20; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_20 = config_reg ? _T_1399 : intpriority_reg_20; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1402 = ~intpriority_reg_21; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_21 = config_reg ? _T_1402 : intpriority_reg_21; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1405 = ~intpriority_reg_22; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_22 = config_reg ? _T_1405 : intpriority_reg_22; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1408 = ~intpriority_reg_23; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_23 = config_reg ? _T_1408 : intpriority_reg_23; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1411 = ~intpriority_reg_24; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_24 = config_reg ? _T_1411 : intpriority_reg_24; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1414 = ~intpriority_reg_25; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_25 = config_reg ? _T_1414 : intpriority_reg_25; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1417 = ~intpriority_reg_26; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_26 = config_reg ? _T_1417 : intpriority_reg_26; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1420 = ~intpriority_reg_27; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_27 = config_reg ? _T_1420 : intpriority_reg_27; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1423 = ~intpriority_reg_28; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_28 = config_reg ? _T_1423 : intpriority_reg_28; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1426 = ~intpriority_reg_29; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_29 = config_reg ? _T_1426 : intpriority_reg_29; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1429 = ~intpriority_reg_30; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_30 = config_reg ? _T_1429 : intpriority_reg_30; // @[el2_pic_ctl.scala 166:70]
  wire [3:0] _T_1432 = ~intpriority_reg_31; // @[el2_pic_ctl.scala 166:89]
  wire [3:0] intpriority_reg_inv_31 = config_reg ? _T_1432 : intpriority_reg_31; // @[el2_pic_ctl.scala 166:70]
  wire  _T_1438 = extintsrc_req_gw_1 & intenable_reg_1; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1440 = _T_1438 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_1 = _T_1440 & intpriority_reg_inv_1; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1442 = extintsrc_req_gw_2 & intenable_reg_2; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1444 = _T_1442 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_2 = _T_1444 & intpriority_reg_inv_2; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1446 = extintsrc_req_gw_3 & intenable_reg_3; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1448 = _T_1446 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_3 = _T_1448 & intpriority_reg_inv_3; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1450 = extintsrc_req_gw_4 & intenable_reg_4; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1452 = _T_1450 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_4 = _T_1452 & intpriority_reg_inv_4; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1454 = extintsrc_req_gw_5 & intenable_reg_5; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1456 = _T_1454 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_5 = _T_1456 & intpriority_reg_inv_5; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1458 = extintsrc_req_gw_6 & intenable_reg_6; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1460 = _T_1458 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_6 = _T_1460 & intpriority_reg_inv_6; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1462 = extintsrc_req_gw_7 & intenable_reg_7; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1464 = _T_1462 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_7 = _T_1464 & intpriority_reg_inv_7; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1466 = extintsrc_req_gw_8 & intenable_reg_8; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1468 = _T_1466 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_8 = _T_1468 & intpriority_reg_inv_8; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1470 = extintsrc_req_gw_9 & intenable_reg_9; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1472 = _T_1470 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_9 = _T_1472 & intpriority_reg_inv_9; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1474 = extintsrc_req_gw_10 & intenable_reg_10; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1476 = _T_1474 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_10 = _T_1476 & intpriority_reg_inv_10; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1478 = extintsrc_req_gw_11 & intenable_reg_11; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1480 = _T_1478 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_11 = _T_1480 & intpriority_reg_inv_11; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1482 = extintsrc_req_gw_12 & intenable_reg_12; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1484 = _T_1482 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_12 = _T_1484 & intpriority_reg_inv_12; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1486 = extintsrc_req_gw_13 & intenable_reg_13; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1488 = _T_1486 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_13 = _T_1488 & intpriority_reg_inv_13; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1490 = extintsrc_req_gw_14 & intenable_reg_14; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1492 = _T_1490 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_14 = _T_1492 & intpriority_reg_inv_14; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1494 = extintsrc_req_gw_15 & intenable_reg_15; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1496 = _T_1494 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_15 = _T_1496 & intpriority_reg_inv_15; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1498 = extintsrc_req_gw_16 & intenable_reg_16; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1500 = _T_1498 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_16 = _T_1500 & intpriority_reg_inv_16; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1502 = extintsrc_req_gw_17 & intenable_reg_17; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1504 = _T_1502 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_17 = _T_1504 & intpriority_reg_inv_17; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1506 = extintsrc_req_gw_18 & intenable_reg_18; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1508 = _T_1506 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_18 = _T_1508 & intpriority_reg_inv_18; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1510 = extintsrc_req_gw_19 & intenable_reg_19; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1512 = _T_1510 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_19 = _T_1512 & intpriority_reg_inv_19; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1514 = extintsrc_req_gw_20 & intenable_reg_20; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1516 = _T_1514 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_20 = _T_1516 & intpriority_reg_inv_20; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1518 = extintsrc_req_gw_21 & intenable_reg_21; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1520 = _T_1518 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_21 = _T_1520 & intpriority_reg_inv_21; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1522 = extintsrc_req_gw_22 & intenable_reg_22; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1524 = _T_1522 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_22 = _T_1524 & intpriority_reg_inv_22; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1526 = extintsrc_req_gw_23 & intenable_reg_23; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1528 = _T_1526 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_23 = _T_1528 & intpriority_reg_inv_23; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1530 = extintsrc_req_gw_24 & intenable_reg_24; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1532 = _T_1530 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_24 = _T_1532 & intpriority_reg_inv_24; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1534 = extintsrc_req_gw_25 & intenable_reg_25; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1536 = _T_1534 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_25 = _T_1536 & intpriority_reg_inv_25; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1538 = extintsrc_req_gw_26 & intenable_reg_26; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1540 = _T_1538 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_26 = _T_1540 & intpriority_reg_inv_26; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1542 = extintsrc_req_gw_27 & intenable_reg_27; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1544 = _T_1542 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_27 = _T_1544 & intpriority_reg_inv_27; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1546 = extintsrc_req_gw_28 & intenable_reg_28; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1548 = _T_1546 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_28 = _T_1548 & intpriority_reg_inv_28; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1550 = extintsrc_req_gw_29 & intenable_reg_29; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1552 = _T_1550 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_29 = _T_1552 & intpriority_reg_inv_29; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1554 = extintsrc_req_gw_30 & intenable_reg_30; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1556 = _T_1554 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_30 = _T_1556 & intpriority_reg_inv_30; // @[el2_pic_ctl.scala 167:129]
  wire  _T_1558 = extintsrc_req_gw_31 & intenable_reg_31; // @[el2_pic_ctl.scala 167:109]
  wire [3:0] _T_1560 = _T_1558 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] intpend_w_prior_en_31 = _T_1560 & intpriority_reg_inv_31; // @[el2_pic_ctl.scala 167:129]
  wire [7:0] _T_1564 = 8'hff; // @[Bitwise.scala 72:12]
  wire [3:0] level_intpend_w_prior_en_0_0 = 4'h0; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1441 = intpend_w_prior_en_1; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_1 = intpend_w_prior_en_1; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1566 = intpriority_reg_0 < _T_1441; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_1 = 8'h1; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_1 = 8'h1; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_0 = 8'h0; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_0 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id = _T_1566 ? intpend_id_1 : intpend_id_0; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority = _T_1566 ? _T_1441 : intpriority_reg_0; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1445 = intpend_w_prior_en_2; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_2 = intpend_w_prior_en_2; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1449 = intpend_w_prior_en_3; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_3 = intpend_w_prior_en_3; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1568 = _T_1445 < _T_1449; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_3 = 8'h3; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_3 = 8'h3; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_2 = 8'h2; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_2 = 8'h2; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_1 = _T_1568 ? intpend_id_3 : intpend_id_2; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_1 = _T_1568 ? _T_1449 : _T_1445; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1453 = intpend_w_prior_en_4; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_4 = intpend_w_prior_en_4; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1457 = intpend_w_prior_en_5; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_5 = intpend_w_prior_en_5; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1570 = _T_1453 < _T_1457; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_5 = 8'h5; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_5 = 8'h5; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_4 = 8'h4; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_4 = 8'h4; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_2 = _T_1570 ? intpend_id_5 : intpend_id_4; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_2 = _T_1570 ? _T_1457 : _T_1453; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1461 = intpend_w_prior_en_6; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_6 = intpend_w_prior_en_6; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1465 = intpend_w_prior_en_7; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_7 = intpend_w_prior_en_7; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1572 = _T_1461 < _T_1465; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_7 = 8'h7; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_7 = 8'h7; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_6 = 8'h6; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_6 = 8'h6; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_3 = _T_1572 ? intpend_id_7 : intpend_id_6; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_3 = _T_1572 ? _T_1465 : _T_1461; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1469 = intpend_w_prior_en_8; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_8 = intpend_w_prior_en_8; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1473 = intpend_w_prior_en_9; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_9 = intpend_w_prior_en_9; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1574 = _T_1469 < _T_1473; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_9 = 8'h9; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_9 = 8'h9; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_8 = 8'h8; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_8 = 8'h8; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_4 = _T_1574 ? intpend_id_9 : intpend_id_8; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_4 = _T_1574 ? _T_1473 : _T_1469; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1477 = intpend_w_prior_en_10; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_10 = intpend_w_prior_en_10; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1481 = intpend_w_prior_en_11; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_11 = intpend_w_prior_en_11; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1576 = _T_1477 < _T_1481; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_11 = 8'hb; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_11 = 8'hb; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_10 = 8'ha; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_10 = 8'ha; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_5 = _T_1576 ? intpend_id_11 : intpend_id_10; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_5 = _T_1576 ? _T_1481 : _T_1477; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1485 = intpend_w_prior_en_12; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_12 = intpend_w_prior_en_12; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1489 = intpend_w_prior_en_13; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_13 = intpend_w_prior_en_13; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1578 = _T_1485 < _T_1489; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_13 = 8'hd; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_13 = 8'hd; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_12 = 8'hc; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_12 = 8'hc; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_6 = _T_1578 ? intpend_id_13 : intpend_id_12; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_6 = _T_1578 ? _T_1489 : _T_1485; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1493 = intpend_w_prior_en_14; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_14 = intpend_w_prior_en_14; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1497 = intpend_w_prior_en_15; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_15 = intpend_w_prior_en_15; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1580 = _T_1493 < _T_1497; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_15 = 8'hf; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_15 = 8'hf; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_14 = 8'he; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_14 = 8'he; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_7 = _T_1580 ? intpend_id_15 : intpend_id_14; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_7 = _T_1580 ? _T_1497 : _T_1493; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1501 = intpend_w_prior_en_16; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_16 = intpend_w_prior_en_16; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1505 = intpend_w_prior_en_17; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_17 = intpend_w_prior_en_17; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1582 = _T_1501 < _T_1505; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_17 = 8'h11; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_17 = 8'h11; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_16 = 8'h10; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_16 = 8'h10; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_8 = _T_1582 ? intpend_id_17 : intpend_id_16; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_8 = _T_1582 ? _T_1505 : _T_1501; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1509 = intpend_w_prior_en_18; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_18 = intpend_w_prior_en_18; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1513 = intpend_w_prior_en_19; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_19 = intpend_w_prior_en_19; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1584 = _T_1509 < _T_1513; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_19 = 8'h13; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_19 = 8'h13; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_18 = 8'h12; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_18 = 8'h12; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_9 = _T_1584 ? intpend_id_19 : intpend_id_18; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_9 = _T_1584 ? _T_1513 : _T_1509; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1517 = intpend_w_prior_en_20; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_20 = intpend_w_prior_en_20; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1521 = intpend_w_prior_en_21; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_21 = intpend_w_prior_en_21; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1586 = _T_1517 < _T_1521; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_21 = 8'h15; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_21 = 8'h15; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_20 = 8'h14; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_20 = 8'h14; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_10 = _T_1586 ? intpend_id_21 : intpend_id_20; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_10 = _T_1586 ? _T_1521 : _T_1517; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1525 = intpend_w_prior_en_22; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_22 = intpend_w_prior_en_22; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1529 = intpend_w_prior_en_23; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_23 = intpend_w_prior_en_23; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1588 = _T_1525 < _T_1529; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_23 = 8'h17; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_23 = 8'h17; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_22 = 8'h16; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_22 = 8'h16; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_11 = _T_1588 ? intpend_id_23 : intpend_id_22; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_11 = _T_1588 ? _T_1529 : _T_1525; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1533 = intpend_w_prior_en_24; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_24 = intpend_w_prior_en_24; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1537 = intpend_w_prior_en_25; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_25 = intpend_w_prior_en_25; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1590 = _T_1533 < _T_1537; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_25 = 8'h19; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_25 = 8'h19; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_24 = 8'h18; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_24 = 8'h18; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_12 = _T_1590 ? intpend_id_25 : intpend_id_24; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_12 = _T_1590 ? _T_1537 : _T_1533; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1541 = intpend_w_prior_en_26; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_26 = intpend_w_prior_en_26; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1545 = intpend_w_prior_en_27; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_27 = intpend_w_prior_en_27; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1592 = _T_1541 < _T_1545; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_27 = 8'h1b; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_27 = 8'h1b; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_26 = 8'h1a; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_26 = 8'h1a; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_13 = _T_1592 ? intpend_id_27 : intpend_id_26; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_13 = _T_1592 ? _T_1545 : _T_1541; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1549 = intpend_w_prior_en_28; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_28 = intpend_w_prior_en_28; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1553 = intpend_w_prior_en_29; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_29 = intpend_w_prior_en_29; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1594 = _T_1549 < _T_1553; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_29 = 8'h1d; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_29 = 8'h1d; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_28 = 8'h1c; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_28 = 8'h1c; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_14 = _T_1594 ? intpend_id_29 : intpend_id_28; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_14 = _T_1594 ? _T_1553 : _T_1549; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] _T_1557 = intpend_w_prior_en_30; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_30 = intpend_w_prior_en_30; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] _T_1561 = intpend_w_prior_en_31; // @[el2_pic_ctl.scala 76:42 el2_pic_ctl.scala 167:63]
  wire [3:0] level_intpend_w_prior_en_0_31 = intpend_w_prior_en_31; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1596 = _T_1557 < _T_1561; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] intpend_id_31 = 8'h1f; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_31 = 8'h1f; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] intpend_id_30 = 8'h1e; // @[el2_pic_ctl.scala 77:42 el2_pic_ctl.scala 168:55]
  wire [7:0] level_intpend_id_0_30 = 8'h1e; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_15 = _T_1596 ? intpend_id_31 : intpend_id_30; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_15 = _T_1596 ? _T_1561 : _T_1557; // @[el2_pic_ctl.scala 33:49]
  wire [3:0] level_intpend_w_prior_en_0_32 = 4'h0; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire [3:0] level_intpend_w_prior_en_0_33 = 4'h0; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 226:33]
  wire  _T_1598 = intpriority_reg_0 < intpriority_reg_0; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_0_33 = 8'hff; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] level_intpend_id_0_32 = 8'hff; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 227:33]
  wire [7:0] out_id_16 = _T_1598 ? _T_1564 : _T_1564; // @[el2_pic_ctl.scala 33:9]
  wire  _T_1600 = out_priority < out_priority_1; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_1 = out_id_1; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_0 = out_id; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_17 = _T_1600 ? level_intpend_id_1_1 : level_intpend_id_1_0; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_17 = _T_1600 ? out_priority_1 : out_priority; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1602 = out_priority_2 < out_priority_3; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_3 = out_id_3; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_2 = out_id_2; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_18 = _T_1602 ? level_intpend_id_1_3 : level_intpend_id_1_2; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_18 = _T_1602 ? out_priority_3 : out_priority_2; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1604 = out_priority_4 < out_priority_5; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_5 = out_id_5; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_4 = out_id_4; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_19 = _T_1604 ? level_intpend_id_1_5 : level_intpend_id_1_4; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_19 = _T_1604 ? out_priority_5 : out_priority_4; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1606 = out_priority_6 < out_priority_7; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_7 = out_id_7; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_6 = out_id_6; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_20 = _T_1606 ? level_intpend_id_1_7 : level_intpend_id_1_6; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_20 = _T_1606 ? out_priority_7 : out_priority_6; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1608 = out_priority_8 < out_priority_9; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_9 = out_id_9; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_8 = out_id_8; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_21 = _T_1608 ? level_intpend_id_1_9 : level_intpend_id_1_8; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_21 = _T_1608 ? out_priority_9 : out_priority_8; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1610 = out_priority_10 < out_priority_11; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_11 = out_id_11; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_10 = out_id_10; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_22 = _T_1610 ? level_intpend_id_1_11 : level_intpend_id_1_10; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_22 = _T_1610 ? out_priority_11 : out_priority_10; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1612 = out_priority_12 < out_priority_13; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_13 = out_id_13; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_12 = out_id_12; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_23 = _T_1612 ? level_intpend_id_1_13 : level_intpend_id_1_12; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_23 = _T_1612 ? out_priority_13 : out_priority_12; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1614 = out_priority_14 < out_priority_15; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_1_15 = out_id_15; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_14 = out_id_14; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_24 = _T_1614 ? level_intpend_id_1_15 : level_intpend_id_1_14; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_24 = _T_1614 ? out_priority_15 : out_priority_14; // @[el2_pic_ctl.scala 33:49]
  wire [7:0] level_intpend_id_1_17 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 235:46]
  wire [7:0] level_intpend_id_1_16 = out_id_16; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_25 = level_intpend_id_1_16; // @[el2_pic_ctl.scala 33:9]
  wire  _T_1618 = out_priority_17 < out_priority_18; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_2_1 = out_id_18; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_2_0 = out_id_17; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_26 = _T_1618 ? level_intpend_id_2_1 : level_intpend_id_2_0; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_26 = _T_1618 ? out_priority_18 : out_priority_17; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1620 = out_priority_19 < out_priority_20; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_2_3 = out_id_20; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_2_2 = out_id_19; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_27 = _T_1620 ? level_intpend_id_2_3 : level_intpend_id_2_2; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_27 = _T_1620 ? out_priority_20 : out_priority_19; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1622 = out_priority_21 < out_priority_22; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_2_5 = out_id_22; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_2_4 = out_id_21; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_28 = _T_1622 ? level_intpend_id_2_5 : level_intpend_id_2_4; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_28 = _T_1622 ? out_priority_22 : out_priority_21; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1624 = out_priority_23 < out_priority_24; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_2_7 = out_id_24; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_2_6 = out_id_23; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_29 = _T_1624 ? level_intpend_id_2_7 : level_intpend_id_2_6; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_29 = _T_1624 ? out_priority_24 : out_priority_23; // @[el2_pic_ctl.scala 33:49]
  wire [7:0] level_intpend_id_2_9 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 235:46]
  wire [7:0] level_intpend_id_2_8 = level_intpend_id_1_16; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_30 = out_id_25; // @[el2_pic_ctl.scala 33:9]
  wire  _T_1628 = out_priority_26 < out_priority_27; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_3_1 = out_id_27; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_3_0 = out_id_26; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_31 = _T_1628 ? level_intpend_id_3_1 : level_intpend_id_3_0; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_31 = _T_1628 ? out_priority_27 : out_priority_26; // @[el2_pic_ctl.scala 33:49]
  wire  _T_1630 = out_priority_28 < out_priority_29; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_3_3 = out_id_29; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_3_2 = out_id_28; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_32 = _T_1630 ? level_intpend_id_3_3 : level_intpend_id_3_2; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_32 = _T_1630 ? out_priority_29 : out_priority_28; // @[el2_pic_ctl.scala 33:49]
  wire [7:0] level_intpend_id_3_5 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 235:46]
  wire [7:0] level_intpend_id_3_4 = out_id_25; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_33 = out_id_30; // @[el2_pic_ctl.scala 33:9]
  wire  _T_1634 = out_priority_31 < out_priority_32; // @[el2_pic_ctl.scala 33:20]
  wire [7:0] level_intpend_id_4_1 = out_id_32; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_4_0 = out_id_31; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] out_id_34 = _T_1634 ? level_intpend_id_4_1 : level_intpend_id_4_0; // @[el2_pic_ctl.scala 33:9]
  wire [3:0] out_priority_34 = _T_1634 ? out_priority_32 : out_priority_31; // @[el2_pic_ctl.scala 33:49]
  wire [7:0] level_intpend_id_4_3 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 235:46]
  wire [7:0] level_intpend_id_4_2 = out_id_30; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire  config_reg_we = waddr_config_pic_match & picm_wren_ff; // @[el2_pic_ctl.scala 255:47]
  wire  config_reg_re = raddr_config_pic_match & picm_rden_ff; // @[el2_pic_ctl.scala 256:47]
  wire [3:0] level_intpend_w_prior_en_5_0 = out_priority_34; // @[el2_pic_ctl.scala 219:40 el2_pic_ctl.scala 223:38 el2_pic_ctl.scala 239:43]
  wire [3:0] selected_int_priority = out_priority_34; // @[el2_pic_ctl.scala 243:29]
  wire [3:0] _T_1641 = ~level_intpend_w_prior_en_5_0; // @[el2_pic_ctl.scala 267:38]
  wire [3:0] pl_in_q = config_reg ? _T_1641 : level_intpend_w_prior_en_5_0; // @[el2_pic_ctl.scala 267:20]
  reg [7:0] _T_1642; // @[el2_pic_ctl.scala 268:47]
  reg [3:0] _T_1643; // @[el2_pic_ctl.scala 269:42]
  wire [3:0] _T_1645 = ~io_meipt; // @[el2_pic_ctl.scala 270:40]
  wire [3:0] meipt_inv = config_reg ? _T_1645 : io_meipt; // @[el2_pic_ctl.scala 270:22]
  wire [3:0] _T_1647 = ~io_meicurpl; // @[el2_pic_ctl.scala 271:43]
  wire [3:0] meicurpl_inv = config_reg ? _T_1647 : io_meicurpl; // @[el2_pic_ctl.scala 271:25]
  wire  _T_1648 = level_intpend_w_prior_en_5_0 > meipt_inv; // @[el2_pic_ctl.scala 272:47]
  wire  _T_1649 = level_intpend_w_prior_en_5_0 > meicurpl_inv; // @[el2_pic_ctl.scala 272:86]
  reg  _T_1650; // @[el2_pic_ctl.scala 273:50]
  wire [3:0] maxint = config_reg ? 4'h0 : 4'hf; // @[el2_pic_ctl.scala 274:19]
  reg  _T_1652; // @[el2_pic_ctl.scala 276:48]
  wire  intpend_reg_read = addr_intpend_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 282:60]
  wire [9:0] _T_1662 = {extintsrc_req_gw_31,extintsrc_req_gw_30,extintsrc_req_gw_29,extintsrc_req_gw_28,extintsrc_req_gw_27,extintsrc_req_gw_26,extintsrc_req_gw_25,extintsrc_req_gw_24,extintsrc_req_gw_23,extintsrc_req_gw_22}; // @[Cat.scala 29:58]
  wire [18:0] _T_1671 = {_T_1662,extintsrc_req_gw_21,extintsrc_req_gw_20,extintsrc_req_gw_19,extintsrc_req_gw_18,extintsrc_req_gw_17,extintsrc_req_gw_16,extintsrc_req_gw_15,extintsrc_req_gw_14,extintsrc_req_gw_13}; // @[Cat.scala 29:58]
  wire [27:0] _T_1680 = {_T_1671,extintsrc_req_gw_12,extintsrc_req_gw_11,extintsrc_req_gw_10,extintsrc_req_gw_9,extintsrc_req_gw_8,extintsrc_req_gw_7,extintsrc_req_gw_6,extintsrc_req_gw_5,extintsrc_req_gw_4}; // @[Cat.scala 29:58]
  wire [63:0] intpend_reg_extended = {32'h0,_T_1680,extintsrc_req_gw_3,extintsrc_req_gw_2,extintsrc_req_gw_1,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_220 = {{3'd0}, intpend_reg_read}; // @[el2_pic_ctl.scala 290:83]
  wire [3:0] _T_1687 = _GEN_220 & picm_raddr_ff[5:2]; // @[el2_pic_ctl.scala 290:83]
  wire  _T_1688 = _T_1687 == 4'h0; // @[el2_pic_ctl.scala 290:105]
  wire [31:0] _T_1690 = _T_1688 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] intpend_rd_part_out_0 = _T_1690 & intpend_reg_extended[31:0]; // @[el2_pic_ctl.scala 290:119]
  wire  _T_1695 = _T_1687 == 4'h1; // @[el2_pic_ctl.scala 290:105]
  wire [31:0] _T_1697 = _T_1695 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] intpend_rd_part_out_1 = _T_1697 & intpend_reg_extended[63:32]; // @[el2_pic_ctl.scala 290:119]
  wire [31:0] intpend_rd_out = intpend_rd_part_out_0 | intpend_rd_part_out_1; // @[el2_pic_ctl.scala 291:89]
  wire  intenable_rd_out = intenable_reg_re_31 & intenable_reg_31; // @[el2_pic_ctl.scala 292:76]
  wire [3:0] _T_1763 = intpriority_reg_re_31 ? intpriority_reg_31 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _T_1764 = intpriority_reg_re_30 ? intpriority_reg_30 : _T_1763; // @[Mux.scala 98:16]
  wire [3:0] _T_1765 = intpriority_reg_re_29 ? intpriority_reg_29 : _T_1764; // @[Mux.scala 98:16]
  wire [3:0] _T_1766 = intpriority_reg_re_28 ? intpriority_reg_28 : _T_1765; // @[Mux.scala 98:16]
  wire [3:0] _T_1767 = intpriority_reg_re_27 ? intpriority_reg_27 : _T_1766; // @[Mux.scala 98:16]
  wire [3:0] _T_1768 = intpriority_reg_re_26 ? intpriority_reg_26 : _T_1767; // @[Mux.scala 98:16]
  wire [3:0] _T_1769 = intpriority_reg_re_25 ? intpriority_reg_25 : _T_1768; // @[Mux.scala 98:16]
  wire [3:0] _T_1770 = intpriority_reg_re_24 ? intpriority_reg_24 : _T_1769; // @[Mux.scala 98:16]
  wire [3:0] _T_1771 = intpriority_reg_re_23 ? intpriority_reg_23 : _T_1770; // @[Mux.scala 98:16]
  wire [3:0] _T_1772 = intpriority_reg_re_22 ? intpriority_reg_22 : _T_1771; // @[Mux.scala 98:16]
  wire [3:0] _T_1773 = intpriority_reg_re_21 ? intpriority_reg_21 : _T_1772; // @[Mux.scala 98:16]
  wire [3:0] _T_1774 = intpriority_reg_re_20 ? intpriority_reg_20 : _T_1773; // @[Mux.scala 98:16]
  wire [3:0] _T_1775 = intpriority_reg_re_19 ? intpriority_reg_19 : _T_1774; // @[Mux.scala 98:16]
  wire [3:0] _T_1776 = intpriority_reg_re_18 ? intpriority_reg_18 : _T_1775; // @[Mux.scala 98:16]
  wire [3:0] _T_1777 = intpriority_reg_re_17 ? intpriority_reg_17 : _T_1776; // @[Mux.scala 98:16]
  wire [3:0] _T_1778 = intpriority_reg_re_16 ? intpriority_reg_16 : _T_1777; // @[Mux.scala 98:16]
  wire [3:0] _T_1779 = intpriority_reg_re_15 ? intpriority_reg_15 : _T_1778; // @[Mux.scala 98:16]
  wire [3:0] _T_1780 = intpriority_reg_re_14 ? intpriority_reg_14 : _T_1779; // @[Mux.scala 98:16]
  wire [3:0] _T_1781 = intpriority_reg_re_13 ? intpriority_reg_13 : _T_1780; // @[Mux.scala 98:16]
  wire [3:0] _T_1782 = intpriority_reg_re_12 ? intpriority_reg_12 : _T_1781; // @[Mux.scala 98:16]
  wire [3:0] _T_1783 = intpriority_reg_re_11 ? intpriority_reg_11 : _T_1782; // @[Mux.scala 98:16]
  wire [3:0] _T_1784 = intpriority_reg_re_10 ? intpriority_reg_10 : _T_1783; // @[Mux.scala 98:16]
  wire [3:0] _T_1785 = intpriority_reg_re_9 ? intpriority_reg_9 : _T_1784; // @[Mux.scala 98:16]
  wire [3:0] _T_1786 = intpriority_reg_re_8 ? intpriority_reg_8 : _T_1785; // @[Mux.scala 98:16]
  wire [3:0] _T_1787 = intpriority_reg_re_7 ? intpriority_reg_7 : _T_1786; // @[Mux.scala 98:16]
  wire [3:0] _T_1788 = intpriority_reg_re_6 ? intpriority_reg_6 : _T_1787; // @[Mux.scala 98:16]
  wire [3:0] _T_1789 = intpriority_reg_re_5 ? intpriority_reg_5 : _T_1788; // @[Mux.scala 98:16]
  wire [3:0] _T_1790 = intpriority_reg_re_4 ? intpriority_reg_4 : _T_1789; // @[Mux.scala 98:16]
  wire [3:0] _T_1791 = intpriority_reg_re_3 ? intpriority_reg_3 : _T_1790; // @[Mux.scala 98:16]
  wire [3:0] _T_1792 = intpriority_reg_re_2 ? intpriority_reg_2 : _T_1791; // @[Mux.scala 98:16]
  wire [3:0] intpriority_rd_out = intpriority_reg_re_1 ? intpriority_reg_1 : _T_1792; // @[Mux.scala 98:16]
  wire [1:0] _T_1825 = gw_config_reg_re_31 ? gw_config_reg_31 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_1826 = gw_config_reg_re_30 ? gw_config_reg_30 : _T_1825; // @[Mux.scala 98:16]
  wire [1:0] _T_1827 = gw_config_reg_re_29 ? gw_config_reg_29 : _T_1826; // @[Mux.scala 98:16]
  wire [1:0] _T_1828 = gw_config_reg_re_28 ? gw_config_reg_28 : _T_1827; // @[Mux.scala 98:16]
  wire [1:0] _T_1829 = gw_config_reg_re_27 ? gw_config_reg_27 : _T_1828; // @[Mux.scala 98:16]
  wire [1:0] _T_1830 = gw_config_reg_re_26 ? gw_config_reg_26 : _T_1829; // @[Mux.scala 98:16]
  wire [1:0] _T_1831 = gw_config_reg_re_25 ? gw_config_reg_25 : _T_1830; // @[Mux.scala 98:16]
  wire [1:0] _T_1832 = gw_config_reg_re_24 ? gw_config_reg_24 : _T_1831; // @[Mux.scala 98:16]
  wire [1:0] _T_1833 = gw_config_reg_re_23 ? gw_config_reg_23 : _T_1832; // @[Mux.scala 98:16]
  wire [1:0] _T_1834 = gw_config_reg_re_22 ? gw_config_reg_22 : _T_1833; // @[Mux.scala 98:16]
  wire [1:0] _T_1835 = gw_config_reg_re_21 ? gw_config_reg_21 : _T_1834; // @[Mux.scala 98:16]
  wire [1:0] _T_1836 = gw_config_reg_re_20 ? gw_config_reg_20 : _T_1835; // @[Mux.scala 98:16]
  wire [1:0] _T_1837 = gw_config_reg_re_19 ? gw_config_reg_19 : _T_1836; // @[Mux.scala 98:16]
  wire [1:0] _T_1838 = gw_config_reg_re_18 ? gw_config_reg_18 : _T_1837; // @[Mux.scala 98:16]
  wire [1:0] _T_1839 = gw_config_reg_re_17 ? gw_config_reg_17 : _T_1838; // @[Mux.scala 98:16]
  wire [1:0] _T_1840 = gw_config_reg_re_16 ? gw_config_reg_16 : _T_1839; // @[Mux.scala 98:16]
  wire [1:0] _T_1841 = gw_config_reg_re_15 ? gw_config_reg_15 : _T_1840; // @[Mux.scala 98:16]
  wire [1:0] _T_1842 = gw_config_reg_re_14 ? gw_config_reg_14 : _T_1841; // @[Mux.scala 98:16]
  wire [1:0] _T_1843 = gw_config_reg_re_13 ? gw_config_reg_13 : _T_1842; // @[Mux.scala 98:16]
  wire [1:0] _T_1844 = gw_config_reg_re_12 ? gw_config_reg_12 : _T_1843; // @[Mux.scala 98:16]
  wire [1:0] _T_1845 = gw_config_reg_re_11 ? gw_config_reg_11 : _T_1844; // @[Mux.scala 98:16]
  wire [1:0] _T_1846 = gw_config_reg_re_10 ? gw_config_reg_10 : _T_1845; // @[Mux.scala 98:16]
  wire [1:0] _T_1847 = gw_config_reg_re_9 ? gw_config_reg_9 : _T_1846; // @[Mux.scala 98:16]
  wire [1:0] _T_1848 = gw_config_reg_re_8 ? gw_config_reg_8 : _T_1847; // @[Mux.scala 98:16]
  wire [1:0] _T_1849 = gw_config_reg_re_7 ? gw_config_reg_7 : _T_1848; // @[Mux.scala 98:16]
  wire [1:0] _T_1850 = gw_config_reg_re_6 ? gw_config_reg_6 : _T_1849; // @[Mux.scala 98:16]
  wire [1:0] _T_1851 = gw_config_reg_re_5 ? gw_config_reg_5 : _T_1850; // @[Mux.scala 98:16]
  wire [1:0] _T_1852 = gw_config_reg_re_4 ? gw_config_reg_4 : _T_1851; // @[Mux.scala 98:16]
  wire [1:0] _T_1853 = gw_config_reg_re_3 ? gw_config_reg_3 : _T_1852; // @[Mux.scala 98:16]
  wire [1:0] _T_1854 = gw_config_reg_re_2 ? gw_config_reg_2 : _T_1853; // @[Mux.scala 98:16]
  wire [1:0] gw_config_rd_out = gw_config_reg_re_1 ? gw_config_reg_1 : _T_1854; // @[Mux.scala 98:16]
  wire [31:0] _T_1859 = {28'h0,intpriority_rd_out}; // @[Cat.scala 29:58]
  wire [31:0] _T_1862 = {31'h0,intenable_rd_out}; // @[Cat.scala 29:58]
  wire [31:0] _T_1865 = {30'h0,gw_config_rd_out}; // @[Cat.scala 29:58]
  wire [31:0] _T_1868 = {31'h0,config_reg}; // @[Cat.scala 29:58]
  wire [14:0] address = picm_raddr_ff[14:0]; // @[el2_pic_ctl.scala 312:30]
  wire  _T_1908 = 15'h3000 == address; // @[Conditional.scala 37:30]
  wire  _T_1909 = 15'h4004 == address; // @[Conditional.scala 37:30]
  wire  _T_1910 = 15'h4008 == address; // @[Conditional.scala 37:30]
  wire  _T_1911 = 15'h400c == address; // @[Conditional.scala 37:30]
  wire  _T_1912 = 15'h4010 == address; // @[Conditional.scala 37:30]
  wire  _T_1913 = 15'h4014 == address; // @[Conditional.scala 37:30]
  wire  _T_1914 = 15'h4018 == address; // @[Conditional.scala 37:30]
  wire  _T_1915 = 15'h401c == address; // @[Conditional.scala 37:30]
  wire  _T_1916 = 15'h4020 == address; // @[Conditional.scala 37:30]
  wire  _T_1917 = 15'h4024 == address; // @[Conditional.scala 37:30]
  wire  _T_1918 = 15'h4028 == address; // @[Conditional.scala 37:30]
  wire  _T_1919 = 15'h402c == address; // @[Conditional.scala 37:30]
  wire  _T_1920 = 15'h4030 == address; // @[Conditional.scala 37:30]
  wire  _T_1921 = 15'h4034 == address; // @[Conditional.scala 37:30]
  wire  _T_1922 = 15'h4038 == address; // @[Conditional.scala 37:30]
  wire  _T_1923 = 15'h403c == address; // @[Conditional.scala 37:30]
  wire  _T_1924 = 15'h4040 == address; // @[Conditional.scala 37:30]
  wire  _T_1925 = 15'h4044 == address; // @[Conditional.scala 37:30]
  wire  _T_1926 = 15'h4048 == address; // @[Conditional.scala 37:30]
  wire  _T_1927 = 15'h404c == address; // @[Conditional.scala 37:30]
  wire  _T_1928 = 15'h4050 == address; // @[Conditional.scala 37:30]
  wire  _T_1929 = 15'h4054 == address; // @[Conditional.scala 37:30]
  wire  _T_1930 = 15'h4058 == address; // @[Conditional.scala 37:30]
  wire  _T_1931 = 15'h405c == address; // @[Conditional.scala 37:30]
  wire  _T_1932 = 15'h4060 == address; // @[Conditional.scala 37:30]
  wire  _T_1933 = 15'h4064 == address; // @[Conditional.scala 37:30]
  wire  _T_1934 = 15'h4068 == address; // @[Conditional.scala 37:30]
  wire  _T_1935 = 15'h406c == address; // @[Conditional.scala 37:30]
  wire  _T_1936 = 15'h4070 == address; // @[Conditional.scala 37:30]
  wire  _T_1937 = 15'h4074 == address; // @[Conditional.scala 37:30]
  wire  _T_1938 = 15'h4078 == address; // @[Conditional.scala 37:30]
  wire  _T_1939 = 15'h407c == address; // @[Conditional.scala 37:30]
  wire  _T_1940 = 15'h2004 == address; // @[Conditional.scala 37:30]
  wire  _T_1941 = 15'h2008 == address; // @[Conditional.scala 37:30]
  wire  _T_1942 = 15'h200c == address; // @[Conditional.scala 37:30]
  wire  _T_1943 = 15'h2010 == address; // @[Conditional.scala 37:30]
  wire  _T_1944 = 15'h2014 == address; // @[Conditional.scala 37:30]
  wire  _T_1945 = 15'h2018 == address; // @[Conditional.scala 37:30]
  wire  _T_1946 = 15'h201c == address; // @[Conditional.scala 37:30]
  wire  _T_1947 = 15'h2020 == address; // @[Conditional.scala 37:30]
  wire  _T_1948 = 15'h2024 == address; // @[Conditional.scala 37:30]
  wire  _T_1949 = 15'h2028 == address; // @[Conditional.scala 37:30]
  wire  _T_1950 = 15'h202c == address; // @[Conditional.scala 37:30]
  wire  _T_1951 = 15'h2030 == address; // @[Conditional.scala 37:30]
  wire  _T_1952 = 15'h2034 == address; // @[Conditional.scala 37:30]
  wire  _T_1953 = 15'h2038 == address; // @[Conditional.scala 37:30]
  wire  _T_1954 = 15'h203c == address; // @[Conditional.scala 37:30]
  wire  _T_1955 = 15'h2040 == address; // @[Conditional.scala 37:30]
  wire  _T_1956 = 15'h2044 == address; // @[Conditional.scala 37:30]
  wire  _T_1957 = 15'h2048 == address; // @[Conditional.scala 37:30]
  wire  _T_1958 = 15'h204c == address; // @[Conditional.scala 37:30]
  wire  _T_1959 = 15'h2050 == address; // @[Conditional.scala 37:30]
  wire  _T_1960 = 15'h2054 == address; // @[Conditional.scala 37:30]
  wire  _T_1961 = 15'h2058 == address; // @[Conditional.scala 37:30]
  wire  _T_1962 = 15'h205c == address; // @[Conditional.scala 37:30]
  wire  _T_1963 = 15'h2060 == address; // @[Conditional.scala 37:30]
  wire  _T_1964 = 15'h2064 == address; // @[Conditional.scala 37:30]
  wire  _T_1965 = 15'h2068 == address; // @[Conditional.scala 37:30]
  wire  _T_1966 = 15'h206c == address; // @[Conditional.scala 37:30]
  wire  _T_1967 = 15'h2070 == address; // @[Conditional.scala 37:30]
  wire  _T_1968 = 15'h2074 == address; // @[Conditional.scala 37:30]
  wire  _T_1969 = 15'h2078 == address; // @[Conditional.scala 37:30]
  wire  _T_1970 = 15'h207c == address; // @[Conditional.scala 37:30]
  wire  _T_1971 = 15'h4 == address; // @[Conditional.scala 37:30]
  wire  _T_1972 = 15'h8 == address; // @[Conditional.scala 37:30]
  wire  _T_1973 = 15'hc == address; // @[Conditional.scala 37:30]
  wire  _T_1974 = 15'h10 == address; // @[Conditional.scala 37:30]
  wire  _T_1975 = 15'h14 == address; // @[Conditional.scala 37:30]
  wire  _T_1976 = 15'h18 == address; // @[Conditional.scala 37:30]
  wire  _T_1977 = 15'h1c == address; // @[Conditional.scala 37:30]
  wire  _T_1978 = 15'h20 == address; // @[Conditional.scala 37:30]
  wire  _T_1979 = 15'h24 == address; // @[Conditional.scala 37:30]
  wire  _T_1980 = 15'h28 == address; // @[Conditional.scala 37:30]
  wire  _T_1981 = 15'h2c == address; // @[Conditional.scala 37:30]
  wire  _T_1982 = 15'h30 == address; // @[Conditional.scala 37:30]
  wire  _T_1983 = 15'h34 == address; // @[Conditional.scala 37:30]
  wire  _T_1984 = 15'h38 == address; // @[Conditional.scala 37:30]
  wire  _T_1985 = 15'h3c == address; // @[Conditional.scala 37:30]
  wire  _T_1986 = 15'h40 == address; // @[Conditional.scala 37:30]
  wire  _T_1987 = 15'h44 == address; // @[Conditional.scala 37:30]
  wire  _T_1988 = 15'h48 == address; // @[Conditional.scala 37:30]
  wire  _T_1989 = 15'h4c == address; // @[Conditional.scala 37:30]
  wire  _T_1990 = 15'h50 == address; // @[Conditional.scala 37:30]
  wire  _T_1991 = 15'h54 == address; // @[Conditional.scala 37:30]
  wire  _T_1992 = 15'h58 == address; // @[Conditional.scala 37:30]
  wire  _T_1993 = 15'h5c == address; // @[Conditional.scala 37:30]
  wire  _T_1994 = 15'h60 == address; // @[Conditional.scala 37:30]
  wire  _T_1995 = 15'h64 == address; // @[Conditional.scala 37:30]
  wire  _T_1996 = 15'h68 == address; // @[Conditional.scala 37:30]
  wire  _T_1997 = 15'h6c == address; // @[Conditional.scala 37:30]
  wire  _T_1998 = 15'h70 == address; // @[Conditional.scala 37:30]
  wire  _T_1999 = 15'h74 == address; // @[Conditional.scala 37:30]
  wire  _T_2000 = 15'h78 == address; // @[Conditional.scala 37:30]
  wire  _T_2001 = 15'h7c == address; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_126 = _T_2001 ? 4'h2 : 4'h1; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_127 = _T_2000 ? 4'h2 : _GEN_126; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_128 = _T_1999 ? 4'h2 : _GEN_127; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_129 = _T_1998 ? 4'h2 : _GEN_128; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_130 = _T_1997 ? 4'h2 : _GEN_129; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_131 = _T_1996 ? 4'h2 : _GEN_130; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_132 = _T_1995 ? 4'h2 : _GEN_131; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_133 = _T_1994 ? 4'h2 : _GEN_132; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_134 = _T_1993 ? 4'h2 : _GEN_133; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_135 = _T_1992 ? 4'h2 : _GEN_134; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_136 = _T_1991 ? 4'h2 : _GEN_135; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_137 = _T_1990 ? 4'h2 : _GEN_136; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_138 = _T_1989 ? 4'h2 : _GEN_137; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_139 = _T_1988 ? 4'h2 : _GEN_138; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_140 = _T_1987 ? 4'h2 : _GEN_139; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_141 = _T_1986 ? 4'h2 : _GEN_140; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_142 = _T_1985 ? 4'h2 : _GEN_141; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_143 = _T_1984 ? 4'h2 : _GEN_142; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_144 = _T_1983 ? 4'h2 : _GEN_143; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_145 = _T_1982 ? 4'h2 : _GEN_144; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_146 = _T_1981 ? 4'h2 : _GEN_145; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_147 = _T_1980 ? 4'h2 : _GEN_146; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_148 = _T_1979 ? 4'h2 : _GEN_147; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_149 = _T_1978 ? 4'h2 : _GEN_148; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_150 = _T_1977 ? 4'h2 : _GEN_149; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_151 = _T_1976 ? 4'h2 : _GEN_150; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_152 = _T_1975 ? 4'h2 : _GEN_151; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_153 = _T_1974 ? 4'h2 : _GEN_152; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_154 = _T_1973 ? 4'h2 : _GEN_153; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_155 = _T_1972 ? 4'h2 : _GEN_154; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_156 = _T_1971 ? 4'h2 : _GEN_155; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_157 = _T_1970 ? 4'h4 : _GEN_156; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_158 = _T_1969 ? 4'h4 : _GEN_157; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_159 = _T_1968 ? 4'h4 : _GEN_158; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_160 = _T_1967 ? 4'h4 : _GEN_159; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_161 = _T_1966 ? 4'h4 : _GEN_160; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_162 = _T_1965 ? 4'h4 : _GEN_161; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_163 = _T_1964 ? 4'h4 : _GEN_162; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_164 = _T_1963 ? 4'h4 : _GEN_163; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_165 = _T_1962 ? 4'h4 : _GEN_164; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_166 = _T_1961 ? 4'h4 : _GEN_165; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_167 = _T_1960 ? 4'h4 : _GEN_166; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_168 = _T_1959 ? 4'h4 : _GEN_167; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_169 = _T_1958 ? 4'h4 : _GEN_168; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_170 = _T_1957 ? 4'h4 : _GEN_169; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_171 = _T_1956 ? 4'h4 : _GEN_170; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_172 = _T_1955 ? 4'h4 : _GEN_171; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_173 = _T_1954 ? 4'h4 : _GEN_172; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_174 = _T_1953 ? 4'h4 : _GEN_173; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_175 = _T_1952 ? 4'h4 : _GEN_174; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_176 = _T_1951 ? 4'h4 : _GEN_175; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_177 = _T_1950 ? 4'h4 : _GEN_176; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_178 = _T_1949 ? 4'h4 : _GEN_177; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_179 = _T_1948 ? 4'h4 : _GEN_178; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_180 = _T_1947 ? 4'h4 : _GEN_179; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_181 = _T_1946 ? 4'h4 : _GEN_180; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_182 = _T_1945 ? 4'h4 : _GEN_181; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_183 = _T_1944 ? 4'h4 : _GEN_182; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_184 = _T_1943 ? 4'h4 : _GEN_183; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_185 = _T_1942 ? 4'h4 : _GEN_184; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_186 = _T_1941 ? 4'h4 : _GEN_185; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_187 = _T_1940 ? 4'h4 : _GEN_186; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_188 = _T_1939 ? 4'h8 : _GEN_187; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_189 = _T_1938 ? 4'h8 : _GEN_188; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_190 = _T_1937 ? 4'h8 : _GEN_189; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_191 = _T_1936 ? 4'h8 : _GEN_190; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_192 = _T_1935 ? 4'h8 : _GEN_191; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_193 = _T_1934 ? 4'h8 : _GEN_192; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_194 = _T_1933 ? 4'h8 : _GEN_193; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_195 = _T_1932 ? 4'h8 : _GEN_194; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_196 = _T_1931 ? 4'h8 : _GEN_195; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_197 = _T_1930 ? 4'h8 : _GEN_196; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_198 = _T_1929 ? 4'h8 : _GEN_197; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_199 = _T_1928 ? 4'h8 : _GEN_198; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_200 = _T_1927 ? 4'h8 : _GEN_199; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_201 = _T_1926 ? 4'h8 : _GEN_200; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_202 = _T_1925 ? 4'h8 : _GEN_201; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_203 = _T_1924 ? 4'h8 : _GEN_202; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_204 = _T_1923 ? 4'h8 : _GEN_203; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_205 = _T_1922 ? 4'h8 : _GEN_204; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_206 = _T_1921 ? 4'h8 : _GEN_205; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_207 = _T_1920 ? 4'h8 : _GEN_206; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_208 = _T_1919 ? 4'h8 : _GEN_207; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_209 = _T_1918 ? 4'h8 : _GEN_208; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_210 = _T_1917 ? 4'h8 : _GEN_209; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_211 = _T_1916 ? 4'h8 : _GEN_210; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_212 = _T_1915 ? 4'h8 : _GEN_211; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_213 = _T_1914 ? 4'h8 : _GEN_212; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_214 = _T_1913 ? 4'h8 : _GEN_213; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_215 = _T_1912 ? 4'h8 : _GEN_214; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_216 = _T_1911 ? 4'h8 : _GEN_215; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_217 = _T_1910 ? 4'h8 : _GEN_216; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_218 = _T_1909 ? 4'h8 : _GEN_217; // @[Conditional.scala 39:67]
  wire [3:0] mask = _T_1908 ? 4'h4 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_1870 = picm_mken_ff & mask[3]; // @[el2_pic_ctl.scala 305:19]
  wire  _T_1875 = picm_mken_ff & mask[2]; // @[el2_pic_ctl.scala 306:19]
  wire  _T_1880 = picm_mken_ff & mask[1]; // @[el2_pic_ctl.scala 307:19]
  wire [31:0] _T_1888 = intpend_reg_read ? intpend_rd_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1889 = _T_21 ? _T_1859 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1890 = _T_24 ? _T_1862 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1891 = _T_27 ? _T_1865 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1892 = config_reg_re ? _T_1868 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1893 = _T_1870 ? 32'h3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1894 = _T_1875 ? 32'h1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1895 = _T_1880 ? 32'hf : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1897 = _T_1888 | _T_1889; // @[Mux.scala 27:72]
  wire [31:0] _T_1898 = _T_1897 | _T_1890; // @[Mux.scala 27:72]
  wire [31:0] _T_1899 = _T_1898 | _T_1891; // @[Mux.scala 27:72]
  wire [31:0] _T_1900 = _T_1899 | _T_1892; // @[Mux.scala 27:72]
  wire [31:0] _T_1901 = _T_1900 | _T_1893; // @[Mux.scala 27:72]
  wire [31:0] _T_1902 = _T_1901 | _T_1894; // @[Mux.scala 27:72]
  wire [31:0] picm_rd_data_in = _T_1902 | _T_1895; // @[Mux.scala 27:72]
  wire [7:0] level_intpend_id_5_0 = out_id_34; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_1_18 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_19 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_20 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_21 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_22 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_23 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_24 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_25 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_26 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_27 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_28 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_29 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_30 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_31 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_32 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_1_33 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_10 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_11 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_12 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_13 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_14 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_15 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_16 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_17 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_18 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_19 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_20 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_21 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_22 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_23 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_24 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_25 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_26 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_27 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_28 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_29 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_30 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_31 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_32 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_2_33 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_6 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_7 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_8 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_9 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_10 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_11 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_12 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_13 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_14 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_15 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_16 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_17 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_18 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_19 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_20 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_21 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_22 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_23 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_24 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_25 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_26 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_27 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_28 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_29 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_30 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_31 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_32 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_3_33 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_4 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_5 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_6 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_7 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_8 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_9 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_10 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_11 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_12 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_13 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_14 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_15 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_16 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_17 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_18 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_19 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_20 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_21 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_22 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_23 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_24 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_25 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_26 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_27 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_28 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_29 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_30 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_31 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_32 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_4_33 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_1 = out_id_33; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 238:43]
  wire [7:0] level_intpend_id_5_2 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30 el2_pic_ctl.scala 235:46]
  wire [7:0] level_intpend_id_5_3 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_4 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_5 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_6 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_7 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_8 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_9 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_10 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_11 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_12 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_13 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_14 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_15 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_16 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_17 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_18 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_19 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_20 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_21 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_22 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_23 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_24 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_25 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_26 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_27 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_28 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_29 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_30 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_31 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_32 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
  wire [7:0] level_intpend_id_5_33 = 8'h0; // @[el2_pic_ctl.scala 220:32 el2_pic_ctl.scala 224:30]
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
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  assign io_mexintpend = _T_1650; // @[el2_pic_ctl.scala 273:17]
  assign io_claimid = _T_1642; // @[el2_pic_ctl.scala 268:37]
  assign io_pl = _T_1643; // @[el2_pic_ctl.scala 269:32]
  assign io_picm_rd_data = picm_bypass_ff ? picm_wr_data_ff : picm_rd_data_in; // @[el2_pic_ctl.scala 311:19]
  assign io_mhwakeup = _T_1652; // @[el2_pic_ctl.scala 276:15]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_19 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = io_picm_wren | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_2_io_en = _T_22 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_3_io_en = _T_25 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_4_io_en = _T_28 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
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
  picm_raddr_ff = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  picm_waddr_ff = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  picm_wren_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  picm_rden_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  picm_mken_ff = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  picm_wr_data_ff = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_33 = _RAND_6[30:0];
  _RAND_7 = {1{`RANDOM}};
  _T_34 = _RAND_7[30:0];
  _RAND_8 = {1{`RANDOM}};
  intpriority_reg_1 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  intpriority_reg_2 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  intpriority_reg_3 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  intpriority_reg_4 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  intpriority_reg_5 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  intpriority_reg_6 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  intpriority_reg_7 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  intpriority_reg_8 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  intpriority_reg_9 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  intpriority_reg_10 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  intpriority_reg_11 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  intpriority_reg_12 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  intpriority_reg_13 = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  intpriority_reg_14 = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  intpriority_reg_15 = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  intpriority_reg_16 = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  intpriority_reg_17 = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  intpriority_reg_18 = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  intpriority_reg_19 = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  intpriority_reg_20 = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  intpriority_reg_21 = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  intpriority_reg_22 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  intpriority_reg_23 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  intpriority_reg_24 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  intpriority_reg_25 = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  intpriority_reg_26 = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  intpriority_reg_27 = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  intpriority_reg_28 = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  intpriority_reg_29 = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  intpriority_reg_30 = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  intpriority_reg_31 = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  intenable_reg_1 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  intenable_reg_2 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  intenable_reg_3 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  intenable_reg_4 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  intenable_reg_5 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  intenable_reg_6 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  intenable_reg_7 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  intenable_reg_8 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  intenable_reg_9 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  intenable_reg_10 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  intenable_reg_11 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  intenable_reg_12 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  intenable_reg_13 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  intenable_reg_14 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  intenable_reg_15 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  intenable_reg_16 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  intenable_reg_17 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  intenable_reg_18 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  intenable_reg_19 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  intenable_reg_20 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  intenable_reg_21 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  intenable_reg_22 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  intenable_reg_23 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  intenable_reg_24 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  intenable_reg_25 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  intenable_reg_26 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  intenable_reg_27 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  intenable_reg_28 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  intenable_reg_29 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  intenable_reg_30 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  intenable_reg_31 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  gw_config_reg_1 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  gw_config_reg_2 = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  gw_config_reg_3 = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  gw_config_reg_4 = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  gw_config_reg_5 = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  gw_config_reg_6 = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  gw_config_reg_7 = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  gw_config_reg_8 = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  gw_config_reg_9 = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  gw_config_reg_10 = _RAND_79[1:0];
  _RAND_80 = {1{`RANDOM}};
  gw_config_reg_11 = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  gw_config_reg_12 = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  gw_config_reg_13 = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  gw_config_reg_14 = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  gw_config_reg_15 = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  gw_config_reg_16 = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  gw_config_reg_17 = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  gw_config_reg_18 = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  gw_config_reg_19 = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  gw_config_reg_20 = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  gw_config_reg_21 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  gw_config_reg_22 = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  gw_config_reg_23 = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  gw_config_reg_24 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  gw_config_reg_25 = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  gw_config_reg_26 = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  gw_config_reg_27 = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  gw_config_reg_28 = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  gw_config_reg_29 = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  gw_config_reg_30 = _RAND_99[1:0];
  _RAND_100 = {1{`RANDOM}};
  gw_config_reg_31 = _RAND_100[1:0];
  _RAND_101 = {1{`RANDOM}};
  gw_int_pending = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  gw_int_pending_1 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  gw_int_pending_2 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  gw_int_pending_3 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  gw_int_pending_4 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  gw_int_pending_5 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  gw_int_pending_6 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  gw_int_pending_7 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  gw_int_pending_8 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  gw_int_pending_9 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  gw_int_pending_10 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  gw_int_pending_11 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  gw_int_pending_12 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  gw_int_pending_13 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  gw_int_pending_14 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  gw_int_pending_15 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  gw_int_pending_16 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  gw_int_pending_17 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  gw_int_pending_18 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  gw_int_pending_19 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  gw_int_pending_20 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  gw_int_pending_21 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  gw_int_pending_22 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  gw_int_pending_23 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  gw_int_pending_24 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  gw_int_pending_25 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  gw_int_pending_26 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  gw_int_pending_27 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  gw_int_pending_28 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  gw_int_pending_29 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  gw_int_pending_30 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  config_reg = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  _T_1642 = _RAND_133[7:0];
  _RAND_134 = {1{`RANDOM}};
  _T_1643 = _RAND_134[3:0];
  _RAND_135 = {1{`RANDOM}};
  _T_1650 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  _T_1652 = _RAND_136[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    picm_raddr_ff = 32'h0;
  end
  if (reset) begin
    picm_waddr_ff = 32'h0;
  end
  if (reset) begin
    picm_wren_ff = 1'h0;
  end
  if (reset) begin
    picm_rden_ff = 1'h0;
  end
  if (reset) begin
    picm_mken_ff = 1'h0;
  end
  if (reset) begin
    picm_wr_data_ff = 32'h0;
  end
  if (reset) begin
    _T_33 = 31'h0;
  end
  if (reset) begin
    _T_34 = 31'h0;
  end
  if (reset) begin
    intpriority_reg_1 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_2 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_3 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_4 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_5 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_6 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_7 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_8 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_9 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_10 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_11 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_12 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_13 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_14 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_15 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_16 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_17 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_18 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_19 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_20 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_21 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_22 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_23 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_24 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_25 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_26 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_27 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_28 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_29 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_30 = 4'h0;
  end
  if (reset) begin
    intpriority_reg_31 = 4'h0;
  end
  if (reset) begin
    intenable_reg_1 = 1'h0;
  end
  if (reset) begin
    intenable_reg_2 = 1'h0;
  end
  if (reset) begin
    intenable_reg_3 = 1'h0;
  end
  if (reset) begin
    intenable_reg_4 = 1'h0;
  end
  if (reset) begin
    intenable_reg_5 = 1'h0;
  end
  if (reset) begin
    intenable_reg_6 = 1'h0;
  end
  if (reset) begin
    intenable_reg_7 = 1'h0;
  end
  if (reset) begin
    intenable_reg_8 = 1'h0;
  end
  if (reset) begin
    intenable_reg_9 = 1'h0;
  end
  if (reset) begin
    intenable_reg_10 = 1'h0;
  end
  if (reset) begin
    intenable_reg_11 = 1'h0;
  end
  if (reset) begin
    intenable_reg_12 = 1'h0;
  end
  if (reset) begin
    intenable_reg_13 = 1'h0;
  end
  if (reset) begin
    intenable_reg_14 = 1'h0;
  end
  if (reset) begin
    intenable_reg_15 = 1'h0;
  end
  if (reset) begin
    intenable_reg_16 = 1'h0;
  end
  if (reset) begin
    intenable_reg_17 = 1'h0;
  end
  if (reset) begin
    intenable_reg_18 = 1'h0;
  end
  if (reset) begin
    intenable_reg_19 = 1'h0;
  end
  if (reset) begin
    intenable_reg_20 = 1'h0;
  end
  if (reset) begin
    intenable_reg_21 = 1'h0;
  end
  if (reset) begin
    intenable_reg_22 = 1'h0;
  end
  if (reset) begin
    intenable_reg_23 = 1'h0;
  end
  if (reset) begin
    intenable_reg_24 = 1'h0;
  end
  if (reset) begin
    intenable_reg_25 = 1'h0;
  end
  if (reset) begin
    intenable_reg_26 = 1'h0;
  end
  if (reset) begin
    intenable_reg_27 = 1'h0;
  end
  if (reset) begin
    intenable_reg_28 = 1'h0;
  end
  if (reset) begin
    intenable_reg_29 = 1'h0;
  end
  if (reset) begin
    intenable_reg_30 = 1'h0;
  end
  if (reset) begin
    intenable_reg_31 = 1'h0;
  end
  if (reset) begin
    gw_config_reg_1 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_2 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_3 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_4 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_5 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_6 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_7 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_8 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_9 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_10 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_11 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_12 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_13 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_14 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_15 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_16 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_17 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_18 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_19 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_20 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_21 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_22 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_23 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_24 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_25 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_26 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_27 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_28 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_29 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_30 = 2'h0;
  end
  if (reset) begin
    gw_config_reg_31 = 2'h0;
  end
  if (reset) begin
    gw_int_pending = 1'h0;
  end
  if (reset) begin
    gw_int_pending_1 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_2 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_3 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_4 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_5 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_6 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_7 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_8 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_9 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_10 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_11 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_12 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_13 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_14 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_15 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_16 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_17 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_18 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_19 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_20 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_21 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_22 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_23 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_24 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_25 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_26 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_27 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_28 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_29 = 1'h0;
  end
  if (reset) begin
    gw_int_pending_30 = 1'h0;
  end
  if (reset) begin
    config_reg = 1'h0;
  end
  if (reset) begin
    _T_1642 = 8'h0;
  end
  if (reset) begin
    _T_1643 = 4'h0;
  end
  if (reset) begin
    _T_1650 = 1'h0;
  end
  if (reset) begin
    _T_1652 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge pic_raddr_c1_clk or posedge reset) begin
    if (reset) begin
      picm_raddr_ff <= 32'h0;
    end else begin
      picm_raddr_ff <= io_picm_rdaddr;
    end
  end
  always @(posedge pic_data_c1_clk or posedge reset) begin
    if (reset) begin
      picm_waddr_ff <= 32'h0;
    end else begin
      picm_waddr_ff <= io_picm_wraddr;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      picm_wren_ff <= 1'h0;
    end else begin
      picm_wren_ff <= io_picm_wren;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      picm_rden_ff <= 1'h0;
    end else begin
      picm_rden_ff <= io_picm_rden;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      picm_mken_ff <= 1'h0;
    end else begin
      picm_mken_ff <= io_picm_mken;
    end
  end
  always @(posedge pic_data_c1_clk or posedge reset) begin
    if (reset) begin
      picm_wr_data_ff <= 32'h0;
    end else begin
      picm_wr_data_ff <= io_picm_wr_data;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_33 <= 31'h0;
    end else begin
      _T_33 <= io_extintsrc_req[31:1];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_34 <= 31'h0;
    end else begin
      _T_34 <= _T_33;
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_1 <= 4'h0;
    end else if (intpriority_reg_we_1) begin
      intpriority_reg_1 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_2 <= 4'h0;
    end else if (intpriority_reg_we_2) begin
      intpriority_reg_2 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_3 <= 4'h0;
    end else if (intpriority_reg_we_3) begin
      intpriority_reg_3 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_4 <= 4'h0;
    end else if (intpriority_reg_we_4) begin
      intpriority_reg_4 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_5 <= 4'h0;
    end else if (intpriority_reg_we_5) begin
      intpriority_reg_5 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_6 <= 4'h0;
    end else if (intpriority_reg_we_6) begin
      intpriority_reg_6 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_7 <= 4'h0;
    end else if (intpriority_reg_we_7) begin
      intpriority_reg_7 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_8 <= 4'h0;
    end else if (intpriority_reg_we_8) begin
      intpriority_reg_8 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_9 <= 4'h0;
    end else if (intpriority_reg_we_9) begin
      intpriority_reg_9 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_10 <= 4'h0;
    end else if (intpriority_reg_we_10) begin
      intpriority_reg_10 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_11 <= 4'h0;
    end else if (intpriority_reg_we_11) begin
      intpriority_reg_11 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_12 <= 4'h0;
    end else if (intpriority_reg_we_12) begin
      intpriority_reg_12 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_13 <= 4'h0;
    end else if (intpriority_reg_we_13) begin
      intpriority_reg_13 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_14 <= 4'h0;
    end else if (intpriority_reg_we_14) begin
      intpriority_reg_14 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_15 <= 4'h0;
    end else if (intpriority_reg_we_15) begin
      intpriority_reg_15 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_16 <= 4'h0;
    end else if (intpriority_reg_we_16) begin
      intpriority_reg_16 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_17 <= 4'h0;
    end else if (intpriority_reg_we_17) begin
      intpriority_reg_17 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_18 <= 4'h0;
    end else if (intpriority_reg_we_18) begin
      intpriority_reg_18 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_19 <= 4'h0;
    end else if (intpriority_reg_we_19) begin
      intpriority_reg_19 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_20 <= 4'h0;
    end else if (intpriority_reg_we_20) begin
      intpriority_reg_20 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_21 <= 4'h0;
    end else if (intpriority_reg_we_21) begin
      intpriority_reg_21 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_22 <= 4'h0;
    end else if (intpriority_reg_we_22) begin
      intpriority_reg_22 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_23 <= 4'h0;
    end else if (intpriority_reg_we_23) begin
      intpriority_reg_23 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_24 <= 4'h0;
    end else if (intpriority_reg_we_24) begin
      intpriority_reg_24 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_25 <= 4'h0;
    end else if (intpriority_reg_we_25) begin
      intpriority_reg_25 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_26 <= 4'h0;
    end else if (intpriority_reg_we_26) begin
      intpriority_reg_26 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_27 <= 4'h0;
    end else if (intpriority_reg_we_27) begin
      intpriority_reg_27 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_28 <= 4'h0;
    end else if (intpriority_reg_we_28) begin
      intpriority_reg_28 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_29 <= 4'h0;
    end else if (intpriority_reg_we_29) begin
      intpriority_reg_29 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_30 <= 4'h0;
    end else if (intpriority_reg_we_30) begin
      intpriority_reg_30 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_pri_c1_clk or posedge reset) begin
    if (reset) begin
      intpriority_reg_31 <= 4'h0;
    end else if (intpriority_reg_we_31) begin
      intpriority_reg_31 <= picm_wr_data_ff[3:0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_1 <= 1'h0;
    end else if (intenable_reg_we_1) begin
      intenable_reg_1 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_2 <= 1'h0;
    end else if (intenable_reg_we_2) begin
      intenable_reg_2 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_3 <= 1'h0;
    end else if (intenable_reg_we_3) begin
      intenable_reg_3 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_4 <= 1'h0;
    end else if (intenable_reg_we_4) begin
      intenable_reg_4 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_5 <= 1'h0;
    end else if (intenable_reg_we_5) begin
      intenable_reg_5 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_6 <= 1'h0;
    end else if (intenable_reg_we_6) begin
      intenable_reg_6 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_7 <= 1'h0;
    end else if (intenable_reg_we_7) begin
      intenable_reg_7 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_8 <= 1'h0;
    end else if (intenable_reg_we_8) begin
      intenable_reg_8 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_9 <= 1'h0;
    end else if (intenable_reg_we_9) begin
      intenable_reg_9 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_10 <= 1'h0;
    end else if (intenable_reg_we_10) begin
      intenable_reg_10 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_11 <= 1'h0;
    end else if (intenable_reg_we_11) begin
      intenable_reg_11 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_12 <= 1'h0;
    end else if (intenable_reg_we_12) begin
      intenable_reg_12 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_13 <= 1'h0;
    end else if (intenable_reg_we_13) begin
      intenable_reg_13 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_14 <= 1'h0;
    end else if (intenable_reg_we_14) begin
      intenable_reg_14 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_15 <= 1'h0;
    end else if (intenable_reg_we_15) begin
      intenable_reg_15 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_16 <= 1'h0;
    end else if (intenable_reg_we_16) begin
      intenable_reg_16 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_17 <= 1'h0;
    end else if (intenable_reg_we_17) begin
      intenable_reg_17 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_18 <= 1'h0;
    end else if (intenable_reg_we_18) begin
      intenable_reg_18 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_19 <= 1'h0;
    end else if (intenable_reg_we_19) begin
      intenable_reg_19 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_20 <= 1'h0;
    end else if (intenable_reg_we_20) begin
      intenable_reg_20 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_21 <= 1'h0;
    end else if (intenable_reg_we_21) begin
      intenable_reg_21 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_22 <= 1'h0;
    end else if (intenable_reg_we_22) begin
      intenable_reg_22 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_23 <= 1'h0;
    end else if (intenable_reg_we_23) begin
      intenable_reg_23 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_24 <= 1'h0;
    end else if (intenable_reg_we_24) begin
      intenable_reg_24 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_25 <= 1'h0;
    end else if (intenable_reg_we_25) begin
      intenable_reg_25 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_26 <= 1'h0;
    end else if (intenable_reg_we_26) begin
      intenable_reg_26 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_27 <= 1'h0;
    end else if (intenable_reg_we_27) begin
      intenable_reg_27 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_28 <= 1'h0;
    end else if (intenable_reg_we_28) begin
      intenable_reg_28 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_29 <= 1'h0;
    end else if (intenable_reg_we_29) begin
      intenable_reg_29 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_30 <= 1'h0;
    end else if (intenable_reg_we_30) begin
      intenable_reg_30 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge pic_int_c1_clk or posedge reset) begin
    if (reset) begin
      intenable_reg_31 <= 1'h0;
    end else if (intenable_reg_we_31) begin
      intenable_reg_31 <= picm_wr_data_ff[0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_1 <= 2'h0;
    end else if (gw_config_reg_we_1) begin
      gw_config_reg_1 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_2 <= 2'h0;
    end else if (gw_config_reg_we_2) begin
      gw_config_reg_2 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_3 <= 2'h0;
    end else if (gw_config_reg_we_3) begin
      gw_config_reg_3 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_4 <= 2'h0;
    end else if (gw_config_reg_we_4) begin
      gw_config_reg_4 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_5 <= 2'h0;
    end else if (gw_config_reg_we_5) begin
      gw_config_reg_5 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_6 <= 2'h0;
    end else if (gw_config_reg_we_6) begin
      gw_config_reg_6 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_7 <= 2'h0;
    end else if (gw_config_reg_we_7) begin
      gw_config_reg_7 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_8 <= 2'h0;
    end else if (gw_config_reg_we_8) begin
      gw_config_reg_8 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_9 <= 2'h0;
    end else if (gw_config_reg_we_9) begin
      gw_config_reg_9 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_10 <= 2'h0;
    end else if (gw_config_reg_we_10) begin
      gw_config_reg_10 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_11 <= 2'h0;
    end else if (gw_config_reg_we_11) begin
      gw_config_reg_11 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_12 <= 2'h0;
    end else if (gw_config_reg_we_12) begin
      gw_config_reg_12 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_13 <= 2'h0;
    end else if (gw_config_reg_we_13) begin
      gw_config_reg_13 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_14 <= 2'h0;
    end else if (gw_config_reg_we_14) begin
      gw_config_reg_14 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_15 <= 2'h0;
    end else if (gw_config_reg_we_15) begin
      gw_config_reg_15 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_16 <= 2'h0;
    end else if (gw_config_reg_we_16) begin
      gw_config_reg_16 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_17 <= 2'h0;
    end else if (gw_config_reg_we_17) begin
      gw_config_reg_17 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_18 <= 2'h0;
    end else if (gw_config_reg_we_18) begin
      gw_config_reg_18 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_19 <= 2'h0;
    end else if (gw_config_reg_we_19) begin
      gw_config_reg_19 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_20 <= 2'h0;
    end else if (gw_config_reg_we_20) begin
      gw_config_reg_20 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_21 <= 2'h0;
    end else if (gw_config_reg_we_21) begin
      gw_config_reg_21 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_22 <= 2'h0;
    end else if (gw_config_reg_we_22) begin
      gw_config_reg_22 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_23 <= 2'h0;
    end else if (gw_config_reg_we_23) begin
      gw_config_reg_23 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_24 <= 2'h0;
    end else if (gw_config_reg_we_24) begin
      gw_config_reg_24 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_25 <= 2'h0;
    end else if (gw_config_reg_we_25) begin
      gw_config_reg_25 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_26 <= 2'h0;
    end else if (gw_config_reg_we_26) begin
      gw_config_reg_26 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_27 <= 2'h0;
    end else if (gw_config_reg_we_27) begin
      gw_config_reg_27 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_28 <= 2'h0;
    end else if (gw_config_reg_we_28) begin
      gw_config_reg_28 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_29 <= 2'h0;
    end else if (gw_config_reg_we_29) begin
      gw_config_reg_29 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_30 <= 2'h0;
    end else if (gw_config_reg_we_30) begin
      gw_config_reg_30 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge gw_config_c1_clk or posedge reset) begin
    if (reset) begin
      gw_config_reg_31 <= 2'h0;
    end else if (gw_config_reg_we_31) begin
      gw_config_reg_31 <= picm_wr_data_ff[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending <= 1'h0;
    end else begin
      gw_int_pending <= _T_970 | _T_972;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_1 <= 1'h0;
    end else begin
      gw_int_pending_1 <= _T_982 | _T_984;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_2 <= 1'h0;
    end else begin
      gw_int_pending_2 <= _T_994 | _T_996;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_3 <= 1'h0;
    end else begin
      gw_int_pending_3 <= _T_1006 | _T_1008;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_4 <= 1'h0;
    end else begin
      gw_int_pending_4 <= _T_1018 | _T_1020;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_5 <= 1'h0;
    end else begin
      gw_int_pending_5 <= _T_1030 | _T_1032;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_6 <= 1'h0;
    end else begin
      gw_int_pending_6 <= _T_1042 | _T_1044;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_7 <= 1'h0;
    end else begin
      gw_int_pending_7 <= _T_1054 | _T_1056;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_8 <= 1'h0;
    end else begin
      gw_int_pending_8 <= _T_1066 | _T_1068;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_9 <= 1'h0;
    end else begin
      gw_int_pending_9 <= _T_1078 | _T_1080;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_10 <= 1'h0;
    end else begin
      gw_int_pending_10 <= _T_1090 | _T_1092;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_11 <= 1'h0;
    end else begin
      gw_int_pending_11 <= _T_1102 | _T_1104;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_12 <= 1'h0;
    end else begin
      gw_int_pending_12 <= _T_1114 | _T_1116;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_13 <= 1'h0;
    end else begin
      gw_int_pending_13 <= _T_1126 | _T_1128;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_14 <= 1'h0;
    end else begin
      gw_int_pending_14 <= _T_1138 | _T_1140;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_15 <= 1'h0;
    end else begin
      gw_int_pending_15 <= _T_1150 | _T_1152;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_16 <= 1'h0;
    end else begin
      gw_int_pending_16 <= _T_1162 | _T_1164;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_17 <= 1'h0;
    end else begin
      gw_int_pending_17 <= _T_1174 | _T_1176;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_18 <= 1'h0;
    end else begin
      gw_int_pending_18 <= _T_1186 | _T_1188;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_19 <= 1'h0;
    end else begin
      gw_int_pending_19 <= _T_1198 | _T_1200;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_20 <= 1'h0;
    end else begin
      gw_int_pending_20 <= _T_1210 | _T_1212;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_21 <= 1'h0;
    end else begin
      gw_int_pending_21 <= _T_1222 | _T_1224;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_22 <= 1'h0;
    end else begin
      gw_int_pending_22 <= _T_1234 | _T_1236;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_23 <= 1'h0;
    end else begin
      gw_int_pending_23 <= _T_1246 | _T_1248;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_24 <= 1'h0;
    end else begin
      gw_int_pending_24 <= _T_1258 | _T_1260;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_25 <= 1'h0;
    end else begin
      gw_int_pending_25 <= _T_1270 | _T_1272;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_26 <= 1'h0;
    end else begin
      gw_int_pending_26 <= _T_1282 | _T_1284;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_27 <= 1'h0;
    end else begin
      gw_int_pending_27 <= _T_1294 | _T_1296;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_28 <= 1'h0;
    end else begin
      gw_int_pending_28 <= _T_1306 | _T_1308;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_29 <= 1'h0;
    end else begin
      gw_int_pending_29 <= _T_1318 | _T_1320;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gw_int_pending_30 <= 1'h0;
    end else begin
      gw_int_pending_30 <= _T_1330 | _T_1332;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      config_reg <= 1'h0;
    end else if (config_reg_we) begin
      config_reg <= picm_wr_data_ff[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_1642 <= 8'h0;
    end else begin
      _T_1642 <= level_intpend_id_5_0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_1643 <= 4'h0;
    end else if (config_reg) begin
      _T_1643 <= _T_1641;
    end else begin
      _T_1643 <= level_intpend_w_prior_en_5_0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_1650 <= 1'h0;
    end else begin
      _T_1650 <= _T_1648 & _T_1649;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_1652 <= 1'h0;
    end else begin
      _T_1652 <= pl_in_q == maxint;
    end
  end
endmodule
