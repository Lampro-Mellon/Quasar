module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[lib.scala 334:26]
  wire  clkhdr_CK; // @[lib.scala 334:26]
  wire  clkhdr_EN; // @[lib.scala 334:26]
  wire  clkhdr_SE; // @[lib.scala 334:26]
  gated_latch clkhdr ( // @[lib.scala 334:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[lib.scala 335:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = io_scan_mode; // @[lib.scala 338:18]
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
  output [31:0] io_dbg_dec_dbg_dctl_dbg_cmd_wrdata,
  output        io_dbg_dma_dbg_ib_dbg_cmd_valid,
  output        io_dbg_dma_dbg_ib_dbg_cmd_write,
  output [1:0]  io_dbg_dma_dbg_ib_dbg_cmd_type,
  output [31:0] io_dbg_dma_dbg_ib_dbg_cmd_addr,
  output [31:0] io_dbg_dma_dbg_dctl_dbg_cmd_wrdata,
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
  wire [2:0] dbg_state;
  wire  dbg_state_en;
  wire [3:0] sb_state;
  wire  sb_state_en;
  wire [31:0] dmcontrol_reg;
  wire [31:0] sbaddress0_reg;
  wire  sbcs_sbbusy_wren;
  wire  sbcs_sberror_wren;
  wire [63:0] sb_bus_rdata;
  wire  sbaddress0_reg_wren1;
  wire [31:0] dmstatus_reg;
  wire  dmstatus_havereset;
  wire  dmstatus_resumeack;
  wire  dmstatus_unavail;
  wire  dmstatus_running;
  wire  dmstatus_halted;
  wire  abstractcs_busy_wren;
  wire  sb_bus_cmd_read;
  wire  sb_bus_cmd_write_addr;
  wire  sb_bus_cmd_write_data;
  wire  sb_bus_rsp_read;
  wire  sb_bus_rsp_error;
  wire  sb_bus_rsp_write;
  wire  sbcs_sbbusy_din;
  wire [31:0] data1_reg;
  wire [31:0] sbcs_reg;
  wire  _T = dbg_state != 3'h0; // @[dbg.scala 95:51]
  wire  _T_1 = io_dmi_reg_en | _T; // @[dbg.scala 95:38]
  wire  _T_2 = _T_1 | dbg_state_en; // @[dbg.scala 95:69]
  wire  _T_3 = _T_2 | io_dec_tlu_dbg_halted; // @[dbg.scala 95:84]
  wire  _T_4 = io_dmi_reg_en | sb_state_en; // @[dbg.scala 96:37]
  wire  _T_5 = sb_state != 4'h0; // @[dbg.scala 96:63]
  wire  _T_6 = _T_4 | _T_5; // @[dbg.scala 96:51]
  wire  rvclkhdr_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 343:22]
  wire  _T_9 = dmcontrol_reg[0] | io_scan_mode; // @[dbg.scala 99:65]
  wire  dbg_dm_rst_l = io_dbg_rst_l & _T_9; // @[dbg.scala 99:94]
  wire  _T_11 = io_dbg_rst_l & _T_9; // @[dbg.scala 101:38]
  wire  rst_temp = _T_11 & reset; // @[dbg.scala 101:71]
  wire  rst_not = ~_T_11; // @[dbg.scala 103:52]
  wire  _T_17 = ~dmcontrol_reg[1]; // @[dbg.scala 105:25]
  wire  _T_19 = io_dmi_reg_addr == 7'h38; // @[dbg.scala 106:36]
  wire  _T_20 = _T_19 & io_dmi_reg_en; // @[dbg.scala 106:49]
  wire  _T_21 = _T_20 & io_dmi_reg_wr_en; // @[dbg.scala 106:65]
  wire  _T_22 = sb_state == 4'h0; // @[dbg.scala 106:96]
  wire  sbcs_wren = _T_21 & _T_22; // @[dbg.scala 106:84]
  wire  _T_24 = sbcs_wren & io_dmi_reg_wdata[22]; // @[dbg.scala 107:42]
  wire  _T_26 = _T_5 & io_dmi_reg_en; // @[dbg.scala 107:102]
  wire  _T_27 = io_dmi_reg_addr == 7'h39; // @[dbg.scala 108:23]
  wire  _T_28 = io_dmi_reg_addr == 7'h3c; // @[dbg.scala 108:55]
  wire  _T_29 = _T_27 | _T_28; // @[dbg.scala 108:36]
  wire  _T_30 = io_dmi_reg_addr == 7'h3d; // @[dbg.scala 108:87]
  wire  _T_31 = _T_29 | _T_30; // @[dbg.scala 108:68]
  wire  _T_32 = _T_26 & _T_31; // @[dbg.scala 107:118]
  wire  sbcs_sbbusyerror_wren = _T_24 | _T_32; // @[dbg.scala 107:66]
  wire  sbcs_sbbusyerror_din = ~_T_24; // @[dbg.scala 110:31]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire [19:0] _T_40 = {temp_sbcs_19_15,temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire [11:0] _T_44 = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20}; // @[Cat.scala 29:58]
  wire  _T_47 = sbcs_reg[19:17] == 3'h1; // @[dbg.scala 132:42]
  wire  _T_49 = _T_47 & sbaddress0_reg[0]; // @[dbg.scala 132:61]
  wire  _T_51 = sbcs_reg[19:17] == 3'h2; // @[dbg.scala 133:23]
  wire  _T_53 = |sbaddress0_reg[1:0]; // @[dbg.scala 133:65]
  wire  _T_54 = _T_51 & _T_53; // @[dbg.scala 133:42]
  wire  _T_55 = _T_49 | _T_54; // @[dbg.scala 132:81]
  wire  _T_57 = sbcs_reg[19:17] == 3'h3; // @[dbg.scala 134:23]
  wire  _T_59 = |sbaddress0_reg[2:0]; // @[dbg.scala 134:65]
  wire  _T_60 = _T_57 & _T_59; // @[dbg.scala 134:42]
  wire  sbcs_unaligned = _T_55 | _T_60; // @[dbg.scala 133:69]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[dbg.scala 136:35]
  wire  _T_62 = sbcs_reg[19:17] == 3'h0; // @[dbg.scala 137:51]
  wire [3:0] _T_64 = _T_62 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_65 = _T_64 & 4'h1; // @[dbg.scala 137:64]
  wire [3:0] _T_69 = _T_47 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_70 = _T_69 & 4'h2; // @[dbg.scala 137:122]
  wire [3:0] _T_71 = _T_65 | _T_70; // @[dbg.scala 137:81]
  wire [3:0] _T_75 = _T_51 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_76 = _T_75 & 4'h4; // @[dbg.scala 138:44]
  wire [3:0] _T_77 = _T_71 | _T_76; // @[dbg.scala 137:139]
  wire [3:0] _T_81 = _T_57 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_82 = _T_81 & 4'h8; // @[dbg.scala 138:102]
  wire [3:0] sbaddress0_incr = _T_77 | _T_82; // @[dbg.scala 138:61]
  wire  _T_83 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[dbg.scala 140:41]
  wire  sbdata0_reg_wren0 = _T_83 & _T_28; // @[dbg.scala 140:60]
  wire  _T_85 = sb_state == 4'h7; // @[dbg.scala 141:37]
  wire  _T_86 = _T_85 & sb_state_en; // @[dbg.scala 141:60]
  wire  _T_87 = ~sbcs_sberror_wren; // @[dbg.scala 141:76]
  wire  sbdata0_reg_wren1 = _T_86 & _T_87; // @[dbg.scala 141:74]
  wire  sbdata1_reg_wren0 = _T_83 & _T_30; // @[dbg.scala 143:60]
  wire [31:0] _T_94 = sbdata0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_95 = _T_94 & io_dmi_reg_wdata; // @[dbg.scala 146:49]
  wire [31:0] _T_97 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_99 = _T_97 & sb_bus_rdata[31:0]; // @[dbg.scala 147:33]
  wire [31:0] _T_101 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_102 = _T_101 & io_dmi_reg_wdata; // @[dbg.scala 149:49]
  wire [31:0] _T_106 = _T_97 & sb_bus_rdata[63:32]; // @[dbg.scala 150:33]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  reg [31:0] sbdata0_reg; // @[lib.scala 374:16]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  reg [31:0] sbdata1_reg; // @[lib.scala 374:16]
  wire  sbaddress0_reg_wren0 = _T_83 & _T_27; // @[dbg.scala 160:63]
  wire [31:0] _T_110 = sbaddress0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_111 = _T_110 & io_dmi_reg_wdata; // @[dbg.scala 162:59]
  wire [31:0] _T_113 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_114 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_116 = sbaddress0_reg + _T_114; // @[dbg.scala 163:54]
  wire [31:0] _T_117 = _T_113 & _T_116; // @[dbg.scala 163:36]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 368:23]
  reg [31:0] _T_118; // @[lib.scala 374:16]
  wire  sbreadonaddr_access = sbaddress0_reg_wren0 & sbcs_reg[20]; // @[dbg.scala 168:94]
  wire  _T_123 = ~io_dmi_reg_wr_en; // @[dbg.scala 169:45]
  wire  _T_124 = io_dmi_reg_en & _T_123; // @[dbg.scala 169:43]
  wire  _T_126 = _T_124 & _T_28; // @[dbg.scala 169:63]
  wire  sbreadondata_access = _T_126 & sbcs_reg[15]; // @[dbg.scala 169:95]
  wire  _T_130 = io_dmi_reg_addr == 7'h10; // @[dbg.scala 171:41]
  wire  _T_131 = _T_130 & io_dmi_reg_en; // @[dbg.scala 171:54]
  wire  dmcontrol_wren = _T_131 & io_dmi_reg_wr_en; // @[dbg.scala 171:70]
  wire [3:0] _T_136 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [27:0] _T_143 = {26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire [3:0] _T_145 = {dm_temp[3:2],1'h0,dm_temp[1]}; // @[Cat.scala 29:58]
  reg  dmcontrol_wren_Q; // @[dbg.scala 186:12]
  wire [1:0] _T_147 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_149 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_151 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_153 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_155 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_159 = {_T_153,_T_155,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire [19:0] _T_163 = {12'h0,_T_147,_T_149,2'h0,_T_151}; // @[Cat.scala 29:58]
  wire  _T_165 = dbg_state == 3'h6; // @[dbg.scala 191:44]
  wire  _T_166 = _T_165 & io_dec_tlu_resume_ack; // @[dbg.scala 191:66]
  wire  _T_168 = ~dmcontrol_reg[30]; // @[dbg.scala 191:113]
  wire  _T_169 = dmstatus_resumeack & _T_168; // @[dbg.scala 191:111]
  wire  dmstatus_resumeack_wren = _T_166 | _T_169; // @[dbg.scala 191:90]
  wire  _T_173 = _T_130 & io_dmi_reg_wdata[1]; // @[dbg.scala 193:63]
  wire  _T_174 = _T_173 & io_dmi_reg_en; // @[dbg.scala 193:85]
  wire  dmstatus_havereset_wren = _T_174 & io_dmi_reg_wr_en; // @[dbg.scala 193:101]
  wire  _T_177 = _T_130 & io_dmi_reg_wdata[28]; // @[dbg.scala 194:62]
  wire  _T_178 = _T_177 & io_dmi_reg_en; // @[dbg.scala 194:85]
  wire  dmstatus_havereset_rst = _T_178 & io_dmi_reg_wr_en; // @[dbg.scala 194:101]
  wire  _T_180 = ~reset; // @[dbg.scala 196:43]
  wire  _T_183 = dmstatus_unavail | dmstatus_halted; // @[dbg.scala 197:42]
  reg  _T_185; // @[Reg.scala 27:20]
  wire  _T_186 = ~io_dec_tlu_mpc_halted_only; // @[dbg.scala 203:37]
  reg  _T_188; // @[dbg.scala 203:12]
  wire  _T_189 = dmstatus_havereset_wren | dmstatus_havereset; // @[dbg.scala 207:16]
  wire  _T_190 = ~dmstatus_havereset_rst; // @[dbg.scala 207:72]
  reg  _T_192; // @[dbg.scala 207:12]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire [31:0] abstractcs_reg;
  wire  _T_194 = abstractcs_reg[12] & io_dmi_reg_en; // @[dbg.scala 213:50]
  wire  _T_195 = io_dmi_reg_addr == 7'h16; // @[dbg.scala 213:106]
  wire  _T_196 = io_dmi_reg_addr == 7'h17; // @[dbg.scala 213:138]
  wire  _T_197 = _T_195 | _T_196; // @[dbg.scala 213:119]
  wire  _T_198 = io_dmi_reg_wr_en & _T_197; // @[dbg.scala 213:86]
  wire  _T_199 = io_dmi_reg_addr == 7'h4; // @[dbg.scala 213:171]
  wire  _T_200 = _T_198 | _T_199; // @[dbg.scala 213:152]
  wire  abstractcs_error_sel0 = _T_194 & _T_200; // @[dbg.scala 213:66]
  wire  _T_203 = _T_83 & _T_196; // @[dbg.scala 214:64]
  wire  _T_205 = io_dmi_reg_wdata[31:24] == 8'h0; // @[dbg.scala 214:126]
  wire  _T_207 = io_dmi_reg_wdata[31:24] == 8'h2; // @[dbg.scala 214:163]
  wire  _T_208 = _T_205 | _T_207; // @[dbg.scala 214:135]
  wire  _T_209 = ~_T_208; // @[dbg.scala 214:98]
  wire  abstractcs_error_sel1 = _T_203 & _T_209; // @[dbg.scala 214:96]
  wire  abstractcs_error_sel2 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[dbg.scala 215:52]
  wire  _T_214 = ~dmstatus_reg[9]; // @[dbg.scala 216:98]
  wire  abstractcs_error_sel3 = _T_203 & _T_214; // @[dbg.scala 216:96]
  wire  _T_216 = _T_196 & io_dmi_reg_en; // @[dbg.scala 217:61]
  wire  _T_217 = _T_216 & io_dmi_reg_wr_en; // @[dbg.scala 217:77]
  wire  _T_219 = io_dmi_reg_wdata[22:20] != 3'h2; // @[dbg.scala 218:32]
  wire  _T_223 = |data1_reg[1:0]; // @[dbg.scala 218:111]
  wire  _T_224 = _T_207 & _T_223; // @[dbg.scala 218:92]
  wire  _T_225 = _T_219 | _T_224; // @[dbg.scala 218:51]
  wire  abstractcs_error_sel4 = _T_217 & _T_225; // @[dbg.scala 217:96]
  wire  _T_227 = _T_195 & io_dmi_reg_en; // @[dbg.scala 220:61]
  wire  abstractcs_error_sel5 = _T_227 & io_dmi_reg_wr_en; // @[dbg.scala 220:77]
  wire  _T_228 = abstractcs_error_sel0 | abstractcs_error_sel1; // @[dbg.scala 221:54]
  wire  _T_229 = _T_228 | abstractcs_error_sel2; // @[dbg.scala 221:78]
  wire  _T_230 = _T_229 | abstractcs_error_sel3; // @[dbg.scala 221:102]
  wire  _T_231 = _T_230 | abstractcs_error_sel4; // @[dbg.scala 221:126]
  wire  abstractcs_error_selor = _T_231 | abstractcs_error_sel5; // @[dbg.scala 221:150]
  wire [2:0] _T_233 = abstractcs_error_sel0 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_234 = _T_233 & 3'h1; // @[dbg.scala 222:62]
  wire [2:0] _T_236 = abstractcs_error_sel1 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_237 = _T_236 & 3'h2; // @[dbg.scala 223:37]
  wire [2:0] _T_238 = _T_234 | _T_237; // @[dbg.scala 222:79]
  wire [2:0] _T_240 = abstractcs_error_sel2 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_241 = _T_240 & 3'h3; // @[dbg.scala 224:37]
  wire [2:0] _T_242 = _T_238 | _T_241; // @[dbg.scala 223:54]
  wire [2:0] _T_244 = abstractcs_error_sel3 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_245 = _T_244 & 3'h4; // @[dbg.scala 225:37]
  wire [2:0] _T_246 = _T_242 | _T_245; // @[dbg.scala 224:54]
  wire [2:0] _T_248 = abstractcs_error_sel4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_250 = _T_246 | _T_248; // @[dbg.scala 225:54]
  wire [2:0] _T_252 = abstractcs_error_sel5 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_254 = ~io_dmi_reg_wdata[10:8]; // @[dbg.scala 227:40]
  wire [2:0] _T_255 = _T_252 & _T_254; // @[dbg.scala 227:37]
  wire [2:0] _T_257 = _T_255 & abstractcs_reg[10:8]; // @[dbg.scala 227:75]
  wire [2:0] _T_258 = _T_250 | _T_257; // @[dbg.scala 226:54]
  wire  _T_259 = ~abstractcs_error_selor; // @[dbg.scala 228:15]
  wire [2:0] _T_261 = _T_259 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_263 = _T_261 & abstractcs_reg[10:8]; // @[dbg.scala 228:50]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[dbg.scala 235:12]
  wire [10:0] _T_265 = {abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire [20:0] _T_267 = {19'h0,abs_temp_12,1'h0}; // @[Cat.scala 29:58]
  wire  _T_272 = dbg_state == 3'h2; // @[dbg.scala 240:100]
  wire  command_wren = _T_217 & _T_272; // @[dbg.scala 240:87]
  wire [19:0] _T_276 = {3'h0,io_dmi_reg_wdata[16:0]}; // @[Cat.scala 29:58]
  wire [11:0] _T_278 = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:20]}; // @[Cat.scala 29:58]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 368:23]
  reg [31:0] command_reg; // @[lib.scala 374:16]
  wire  _T_281 = _T_83 & _T_199; // @[dbg.scala 246:58]
  wire  data0_reg_wren0 = _T_281 & _T_272; // @[dbg.scala 246:89]
  wire  _T_283 = dbg_state == 3'h4; // @[dbg.scala 247:59]
  wire  _T_284 = io_core_dbg_cmd_done & _T_283; // @[dbg.scala 247:46]
  wire  _T_286 = ~command_reg[16]; // @[dbg.scala 247:83]
  wire  data0_reg_wren1 = _T_284 & _T_286; // @[dbg.scala 247:81]
  wire [31:0] _T_288 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_289 = _T_288 & io_dmi_reg_wdata; // @[dbg.scala 250:45]
  wire [31:0] _T_291 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_292 = _T_291 & io_core_dbg_rddata; // @[dbg.scala 250:92]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 368:23]
  reg [31:0] data0_reg; // @[lib.scala 374:16]
  wire  _T_294 = io_dmi_reg_addr == 7'h5; // @[dbg.scala 255:77]
  wire  _T_295 = _T_83 & _T_294; // @[dbg.scala 255:58]
  wire  data1_reg_wren = _T_295 & _T_272; // @[dbg.scala 255:89]
  wire [31:0] _T_298 = data1_reg_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 368:23]
  reg [31:0] _T_299; // @[lib.scala 374:16]
  wire [2:0] dbg_nxtstate;
  wire  _T_300 = 3'h0 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_302 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[dbg.scala 270:43]
  wire [2:0] _T_303 = _T_302 ? 3'h2 : 3'h1; // @[dbg.scala 270:26]
  wire  _T_305 = ~io_dec_tlu_debug_mode; // @[dbg.scala 271:45]
  wire  _T_306 = dmcontrol_reg[31] & _T_305; // @[dbg.scala 271:43]
  wire  _T_308 = _T_306 | dmstatus_reg[9]; // @[dbg.scala 271:69]
  wire  _T_309 = _T_308 | io_dec_tlu_mpc_halted_only; // @[dbg.scala 271:87]
  wire  _T_312 = _T_309 & _T_17; // @[dbg.scala 271:117]
  wire  _T_316 = dmcontrol_reg[31] & _T_17; // @[dbg.scala 272:45]
  wire  _T_318 = 3'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_320 = dmcontrol_reg[1] ? 3'h0 : 3'h2; // @[dbg.scala 275:26]
  wire  _T_323 = dmstatus_reg[9] | dmcontrol_reg[1]; // @[dbg.scala 276:39]
  wire  _T_325 = dmcontrol_wren_Q & dmcontrol_reg[31]; // @[dbg.scala 277:44]
  wire  _T_328 = _T_325 & _T_17; // @[dbg.scala 277:64]
  wire  _T_330 = 3'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_334 = dmstatus_reg[9] & _T_17; // @[dbg.scala 280:43]
  wire  _T_337 = ~dmcontrol_reg[31]; // @[dbg.scala 281:33]
  wire  _T_338 = dmcontrol_reg[30] & _T_337; // @[dbg.scala 281:31]
  wire [2:0] _T_339 = _T_338 ? 3'h6 : 3'h3; // @[dbg.scala 281:12]
  wire [2:0] _T_341 = dmcontrol_reg[31] ? 3'h1 : 3'h0; // @[dbg.scala 282:12]
  wire [2:0] _T_342 = _T_334 ? _T_339 : _T_341; // @[dbg.scala 280:26]
  wire  _T_345 = dmstatus_reg[9] & dmcontrol_reg[30]; // @[dbg.scala 283:39]
  wire  _T_348 = _T_345 & _T_337; // @[dbg.scala 283:59]
  wire  _T_349 = _T_348 & dmcontrol_wren_Q; // @[dbg.scala 283:80]
  wire  _T_350 = _T_349 | command_wren; // @[dbg.scala 283:99]
  wire  _T_352 = _T_350 | dmcontrol_reg[1]; // @[dbg.scala 283:114]
  wire  _T_355 = ~_T_302; // @[dbg.scala 284:28]
  wire  _T_356 = _T_352 | _T_355; // @[dbg.scala 284:26]
  wire  _T_357 = dbg_nxtstate == 3'h3; // @[dbg.scala 285:60]
  wire  _T_358 = dbg_state_en & _T_357; // @[dbg.scala 285:44]
  wire  _T_359 = dbg_nxtstate == 3'h6; // @[dbg.scala 287:58]
  wire  _T_360 = dbg_state_en & _T_359; // @[dbg.scala 287:42]
  wire  _T_368 = 3'h3 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_371 = |abstractcs_reg[10:8]; // @[dbg.scala 291:85]
  wire [2:0] _T_372 = _T_371 ? 3'h5 : 3'h4; // @[dbg.scala 291:62]
  wire [2:0] _T_373 = dmcontrol_reg[1] ? 3'h0 : _T_372; // @[dbg.scala 291:26]
  wire  _T_376 = io_dbg_dec_dbg_ib_dbg_cmd_valid | _T_371; // @[dbg.scala 292:55]
  wire  _T_378 = _T_376 | dmcontrol_reg[1]; // @[dbg.scala 292:83]
  wire  _T_385 = 3'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_387 = dmcontrol_reg[1] ? 3'h0 : 3'h5; // @[dbg.scala 296:26]
  wire  _T_389 = io_core_dbg_cmd_done | dmcontrol_reg[1]; // @[dbg.scala 297:44]
  wire  _T_396 = 3'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_405 = 3'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_408 = dmstatus_reg[17] | dmcontrol_reg[1]; // @[dbg.scala 309:40]
  wire  _GEN_10 = _T_405 & _T_408; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_405 & _T_328; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_12 = _T_396 ? _T_320 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_396 | _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_396 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_396 ? _T_328 : _GEN_11; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_385 ? _T_387 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_385 ? _T_389 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_385 ? _T_328 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_385 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_22 = _T_368 ? _T_373 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_368 ? _T_378 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_368 ? _T_328 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_368 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_27 = _T_330 ? _T_342 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_330 ? _T_356 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_330 ? _T_358 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_330 & _T_360; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_330 ? _T_328 : _GEN_24; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_33 = _T_318 ? _T_320 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_318 ? _T_323 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_318 ? _T_328 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_318 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_318 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire [31:0] _T_417 = _T_199 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_418 = _T_417 & data0_reg; // @[dbg.scala 313:71]
  wire [31:0] _T_421 = _T_294 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_422 = _T_421 & data1_reg; // @[dbg.scala 313:122]
  wire [31:0] _T_423 = _T_418 | _T_422; // @[dbg.scala 313:83]
  wire [31:0] _T_426 = _T_130 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_427 = _T_426 & dmcontrol_reg; // @[dbg.scala 314:43]
  wire [31:0] _T_428 = _T_423 | _T_427; // @[dbg.scala 313:134]
  wire  _T_429 = io_dmi_reg_addr == 7'h11; // @[dbg.scala 314:86]
  wire [31:0] _T_431 = _T_429 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_432 = _T_431 & dmstatus_reg; // @[dbg.scala 314:99]
  wire [31:0] _T_433 = _T_428 | _T_432; // @[dbg.scala 314:59]
  wire [31:0] _T_436 = _T_195 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_437 = _T_436 & abstractcs_reg; // @[dbg.scala 315:43]
  wire [31:0] _T_438 = _T_433 | _T_437; // @[dbg.scala 314:114]
  wire [31:0] _T_441 = _T_196 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_442 = _T_441 & command_reg; // @[dbg.scala 315:100]
  wire [31:0] _T_443 = _T_438 | _T_442; // @[dbg.scala 315:60]
  wire  _T_444 = io_dmi_reg_addr == 7'h40; // @[dbg.scala 316:30]
  wire [31:0] _T_446 = _T_444 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_447 = _T_446 & haltsum0_reg; // @[dbg.scala 316:43]
  wire [31:0] _T_448 = _T_443 | _T_447; // @[dbg.scala 315:114]
  wire [31:0] _T_451 = _T_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_452 = _T_451 & sbcs_reg; // @[dbg.scala 316:98]
  wire [31:0] _T_453 = _T_448 | _T_452; // @[dbg.scala 316:58]
  wire [31:0] _T_456 = _T_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_457 = _T_456 & sbaddress0_reg; // @[dbg.scala 317:43]
  wire [31:0] _T_458 = _T_453 | _T_457; // @[dbg.scala 316:109]
  wire [31:0] _T_461 = _T_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_462 = _T_461 & sbdata0_reg; // @[dbg.scala 317:100]
  wire [31:0] _T_463 = _T_458 | _T_462; // @[dbg.scala 317:60]
  wire [31:0] _T_466 = _T_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_467 = _T_466 & sbdata1_reg; // @[dbg.scala 318:43]
  wire [31:0] dmi_reg_rdata_din = _T_463 | _T_467; // @[dbg.scala 317:114]
  reg [2:0] _T_468; // @[Reg.scala 27:20]
  reg [31:0] _T_469; // @[Reg.scala 27:20]
  wire  _T_471 = command_reg[31:24] == 8'h2; // @[dbg.scala 329:62]
  wire [31:0] _T_473 = {data1_reg[31:2],2'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_475 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_478 = dbg_state == 3'h3; // @[dbg.scala 331:50]
  wire  _T_481 = ~_T_371; // @[dbg.scala 331:75]
  wire  _T_482 = _T_478 & _T_481; // @[dbg.scala 331:73]
  wire  _T_490 = command_reg[15:12] == 4'h0; // @[dbg.scala 333:122]
  wire [1:0] _T_491 = {1'h0,_T_490}; // @[Cat.scala 29:58]
  wire  _T_502 = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_504 = sbdata0_reg_wren0 | sbreadondata_access; // @[dbg.scala 348:39]
  wire  _T_505 = _T_504 | sbreadonaddr_access; // @[dbg.scala 348:61]
  wire  _T_507 = |io_dmi_reg_wdata[14:12]; // @[dbg.scala 351:65]
  wire  _T_508 = sbcs_wren & _T_507; // @[dbg.scala 351:38]
  wire [2:0] _T_510 = ~io_dmi_reg_wdata[14:12]; // @[dbg.scala 352:27]
  wire [2:0] _T_512 = _T_510 & sbcs_reg[14:12]; // @[dbg.scala 352:53]
  wire  _T_513 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_514 = sbcs_unaligned | sbcs_illegal_size; // @[dbg.scala 355:41]
  wire  _T_516 = io_dbg_bus_clk_en | sbcs_unaligned; // @[dbg.scala 356:40]
  wire  _T_517 = _T_516 | sbcs_illegal_size; // @[dbg.scala 356:57]
  wire  _T_520 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_527 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_528 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[dbg.scala 368:38]
  wire  _T_529 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_530 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[dbg.scala 371:48]
  wire  _T_533 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[dbg.scala 372:45]
  wire  _T_534 = _T_533 & io_dbg_bus_clk_en; // @[dbg.scala 372:70]
  wire  _T_535 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_536 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[dbg.scala 376:44]
  wire  _T_537 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_538 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[dbg.scala 380:44]
  wire  _T_539 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_540 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[dbg.scala 384:38]
  wire  _T_541 = sb_state_en & sb_bus_rsp_error; // @[dbg.scala 385:40]
  wire  _T_542 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_543 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[dbg.scala 390:39]
  wire  _T_545 = 4'h9 == sb_state; // @[Conditional.scala 37:30]
  wire  _GEN_50 = _T_545 & sbcs_reg[16]; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_542 ? _T_543 : _T_545; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_542 & _T_541; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_542 ? 1'h0 : _T_545; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_542 ? 1'h0 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_539 ? _T_540 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_539 ? _T_541 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_539 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_539 ? 1'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_537 ? _T_538 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_537 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_537 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_537 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_535 ? _T_536 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_535 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_535 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_535 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_529 ? _T_534 : _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_529 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_529 ? 1'h0 : _GEN_76; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_529 ? 1'h0 : _GEN_78; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_527 ? _T_528 : _GEN_80; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_527 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_90 = _T_527 ? 1'h0 : _GEN_83; // @[Conditional.scala 39:67]
  wire  _GEN_92 = _T_527 ? 1'h0 : _GEN_85; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_520 ? _T_517 : _GEN_87; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_520 ? _T_514 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_520 ? 1'h0 : _GEN_90; // @[Conditional.scala 39:67]
  wire  _GEN_99 = _T_520 ? 1'h0 : _GEN_92; // @[Conditional.scala 39:67]
  wire  _GEN_101 = _T_513 ? _T_517 : _GEN_94; // @[Conditional.scala 39:67]
  wire  _GEN_102 = _T_513 ? _T_514 : _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_104 = _T_513 ? 1'h0 : _GEN_97; // @[Conditional.scala 39:67]
  wire  _GEN_106 = _T_513 ? 1'h0 : _GEN_99; // @[Conditional.scala 39:67]
  reg [3:0] _T_547; // @[Reg.scala 27:20]
  wire  _T_554 = |io_sb_axi_r_bits_resp; // @[dbg.scala 411:69]
  wire  _T_555 = sb_bus_rsp_read & _T_554; // @[dbg.scala 411:39]
  wire  _T_557 = |io_sb_axi_b_bits_resp; // @[dbg.scala 411:122]
  wire  _T_558 = sb_bus_rsp_write & _T_557; // @[dbg.scala 411:92]
  wire  _T_560 = sb_state == 4'h4; // @[dbg.scala 412:36]
  wire  _T_561 = sb_state == 4'h5; // @[dbg.scala 412:71]
  wire  _T_567 = sb_state == 4'h6; // @[dbg.scala 423:70]
  wire [63:0] _T_573 = _T_62 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_577 = {sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_578 = _T_573 & _T_577; // @[dbg.scala 424:65]
  wire [63:0] _T_582 = _T_47 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_585 = {sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_586 = _T_582 & _T_585; // @[dbg.scala 424:138]
  wire [63:0] _T_587 = _T_578 | _T_586; // @[dbg.scala 424:96]
  wire [63:0] _T_591 = _T_51 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_593 = {sbdata0_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_594 = _T_591 & _T_593; // @[dbg.scala 425:45]
  wire [63:0] _T_595 = _T_587 | _T_594; // @[dbg.scala 424:168]
  wire [63:0] _T_599 = _T_57 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_602 = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_603 = _T_599 & _T_602; // @[dbg.scala 425:119]
  wire [7:0] _T_608 = _T_62 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_610 = 15'h1 << sbaddress0_reg[2:0]; // @[dbg.scala 427:82]
  wire [14:0] _GEN_115 = {{7'd0}, _T_608}; // @[dbg.scala 427:67]
  wire [14:0] _T_611 = _GEN_115 & _T_610; // @[dbg.scala 427:67]
  wire [7:0] _T_615 = _T_47 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_617 = {sbaddress0_reg[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_618 = 15'h3 << _T_617; // @[dbg.scala 428:59]
  wire [14:0] _GEN_116 = {{7'd0}, _T_615}; // @[dbg.scala 428:44]
  wire [14:0] _T_619 = _GEN_116 & _T_618; // @[dbg.scala 428:44]
  wire [14:0] _T_620 = _T_611 | _T_619; // @[dbg.scala 427:107]
  wire [7:0] _T_624 = _T_51 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_626 = {sbaddress0_reg[2],2'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_627 = 15'hf << _T_626; // @[dbg.scala 429:59]
  wire [14:0] _GEN_117 = {{7'd0}, _T_624}; // @[dbg.scala 429:44]
  wire [14:0] _T_628 = _GEN_117 & _T_627; // @[dbg.scala 429:44]
  wire [14:0] _T_629 = _T_620 | _T_628; // @[dbg.scala 428:97]
  wire [7:0] _T_633 = _T_57 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_118 = {{7'd0}, _T_633}; // @[dbg.scala 429:100]
  wire [14:0] _T_635 = _T_629 | _GEN_118; // @[dbg.scala 429:100]
  wire [3:0] _GEN_119 = {{1'd0}, sbaddress0_reg[2:0]}; // @[dbg.scala 446:99]
  wire [6:0] _T_646 = 4'h8 * _GEN_119; // @[dbg.scala 446:99]
  wire [63:0] _T_647 = io_sb_axi_r_bits_data >> _T_646; // @[dbg.scala 446:92]
  wire [63:0] _T_648 = _T_647 & 64'hff; // @[dbg.scala 446:123]
  wire [63:0] _T_649 = _T_573 & _T_648; // @[dbg.scala 446:59]
  wire [4:0] _GEN_120 = {{3'd0}, sbaddress0_reg[2:1]}; // @[dbg.scala 447:86]
  wire [6:0] _T_656 = 5'h10 * _GEN_120; // @[dbg.scala 447:86]
  wire [63:0] _T_657 = io_sb_axi_r_bits_data >> _T_656; // @[dbg.scala 447:78]
  wire [63:0] _T_658 = _T_657 & 64'hffff; // @[dbg.scala 447:110]
  wire [63:0] _T_659 = _T_582 & _T_658; // @[dbg.scala 447:45]
  wire [63:0] _T_660 = _T_649 | _T_659; // @[dbg.scala 446:140]
  wire [5:0] _GEN_121 = {{5'd0}, sbaddress0_reg[2]}; // @[dbg.scala 448:86]
  wire [6:0] _T_667 = 6'h20 * _GEN_121; // @[dbg.scala 448:86]
  wire [63:0] _T_668 = io_sb_axi_r_bits_data >> _T_667; // @[dbg.scala 448:78]
  wire [63:0] _T_669 = _T_668 & 64'hffffffff; // @[dbg.scala 448:107]
  wire [63:0] _T_670 = _T_591 & _T_669; // @[dbg.scala 448:45]
  wire [63:0] _T_671 = _T_660 | _T_670; // @[dbg.scala 447:129]
  wire [63:0] _T_677 = _T_599 & io_sb_axi_r_bits_data; // @[dbg.scala 449:45]
  rvclkhdr rvclkhdr ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  assign io_dbg_cmd_size = command_reg[21:20]; // @[dbg.scala 334:19]
  assign io_dbg_core_rst_l = ~dmcontrol_reg[1]; // @[dbg.scala 105:21]
  assign io_dbg_halt_req = _T_300 ? _T_316 : _GEN_35; // @[dbg.scala 266:19 dbg.scala 272:23 dbg.scala 277:23 dbg.scala 288:23 dbg.scala 293:23 dbg.scala 298:23 dbg.scala 305:23 dbg.scala 310:23]
  assign io_dbg_resume_req = _T_300 ? 1'h0 : _GEN_38; // @[dbg.scala 267:21 dbg.scala 287:25]
  assign io_dmi_reg_rdata = _T_469; // @[dbg.scala 325:20]
  assign io_sb_axi_aw_valid = _T_560 | _T_561; // @[dbg.scala 412:22]
  assign io_sb_axi_aw_bits_id = 1'h0; // @[dbg.scala 414:24]
  assign io_sb_axi_aw_bits_addr = sbaddress0_reg; // @[dbg.scala 413:26]
  assign io_sb_axi_aw_bits_region = sbaddress0_reg[31:28]; // @[dbg.scala 418:28]
  assign io_sb_axi_aw_bits_len = 8'h0; // @[dbg.scala 419:25]
  assign io_sb_axi_aw_bits_size = sbcs_reg[19:17]; // @[dbg.scala 415:26]
  assign io_sb_axi_aw_bits_burst = 2'h1; // @[dbg.scala 420:27]
  assign io_sb_axi_aw_bits_lock = 1'h0; // @[dbg.scala 422:26]
  assign io_sb_axi_aw_bits_cache = 4'hf; // @[dbg.scala 417:27]
  assign io_sb_axi_aw_bits_prot = 3'h0; // @[dbg.scala 416:26]
  assign io_sb_axi_aw_bits_qos = 4'h0; // @[dbg.scala 421:25]
  assign io_sb_axi_w_valid = _T_560 | _T_567; // @[dbg.scala 423:21]
  assign io_sb_axi_w_bits_data = _T_595 | _T_603; // @[dbg.scala 424:25]
  assign io_sb_axi_w_bits_strb = _T_635[7:0]; // @[dbg.scala 427:25]
  assign io_sb_axi_w_bits_last = 1'h1; // @[dbg.scala 432:25]
  assign io_sb_axi_b_ready = 1'h1; // @[dbg.scala 444:21]
  assign io_sb_axi_ar_valid = sb_state == 4'h3; // @[dbg.scala 433:22]
  assign io_sb_axi_ar_bits_id = 1'h0; // @[dbg.scala 435:24]
  assign io_sb_axi_ar_bits_addr = sbaddress0_reg; // @[dbg.scala 434:26]
  assign io_sb_axi_ar_bits_region = sbaddress0_reg[31:28]; // @[dbg.scala 439:28]
  assign io_sb_axi_ar_bits_len = 8'h0; // @[dbg.scala 440:25]
  assign io_sb_axi_ar_bits_size = sbcs_reg[19:17]; // @[dbg.scala 436:26]
  assign io_sb_axi_ar_bits_burst = 2'h1; // @[dbg.scala 441:27]
  assign io_sb_axi_ar_bits_lock = 1'h0; // @[dbg.scala 443:26]
  assign io_sb_axi_ar_bits_cache = 4'h0; // @[dbg.scala 438:27]
  assign io_sb_axi_ar_bits_prot = 3'h0; // @[dbg.scala 437:26]
  assign io_sb_axi_ar_bits_qos = 4'h0; // @[dbg.scala 442:25]
  assign io_sb_axi_r_ready = 1'h1; // @[dbg.scala 445:21]
  assign io_dbg_dec_dbg_ib_dbg_cmd_valid = _T_482 & io_dbg_dma_io_dma_dbg_ready; // @[dbg.scala 331:35]
  assign io_dbg_dec_dbg_ib_dbg_cmd_write = command_reg[16]; // @[dbg.scala 332:35]
  assign io_dbg_dec_dbg_ib_dbg_cmd_type = _T_471 ? 2'h2 : _T_491; // @[dbg.scala 333:34]
  assign io_dbg_dec_dbg_ib_dbg_cmd_addr = _T_471 ? _T_473 : _T_475; // @[dbg.scala 329:34]
  assign io_dbg_dec_dbg_dctl_dbg_cmd_wrdata = data0_reg; // @[dbg.scala 330:38]
  assign io_dbg_dma_dbg_ib_dbg_cmd_valid = io_dbg_dec_dbg_ib_dbg_cmd_valid; // @[dbg.scala 454:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_write = io_dbg_dec_dbg_ib_dbg_cmd_write; // @[dbg.scala 455:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_type = io_dbg_dec_dbg_ib_dbg_cmd_type; // @[dbg.scala 456:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_addr = io_dbg_dec_dbg_ib_dbg_cmd_addr; // @[dbg.scala 452:39]
  assign io_dbg_dma_dbg_dctl_dbg_cmd_wrdata = io_dbg_dec_dbg_dctl_dbg_cmd_wrdata; // @[dbg.scala 453:39]
  assign io_dbg_dma_io_dbg_dma_bubble = _T_482 | _T_283; // @[dbg.scala 335:32]
  assign dbg_state = _T_468; // @[dbg.scala 320:13]
  assign dbg_state_en = _T_300 ? _T_312 : _GEN_34; // @[dbg.scala 263:16 dbg.scala 271:20 dbg.scala 276:20 dbg.scala 283:20 dbg.scala 292:20 dbg.scala 297:20 dbg.scala 302:20 dbg.scala 309:20]
  assign sb_state = _T_547; // @[dbg.scala 402:12]
  assign sb_state_en = _T_502 ? _T_505 : _GEN_101; // @[dbg.scala 348:19 dbg.scala 356:19 dbg.scala 362:19 dbg.scala 368:19 dbg.scala 372:19 dbg.scala 376:19 dbg.scala 380:19 dbg.scala 384:19 dbg.scala 390:19 dbg.scala 396:19]
  assign dmcontrol_reg = {_T_145,_T_143}; // @[dbg.scala 183:17]
  assign sbaddress0_reg = _T_118; // @[dbg.scala 164:18]
  assign sbcs_sbbusy_wren = _T_502 ? sb_state_en : _GEN_104; // @[dbg.scala 340:20 dbg.scala 349:24 dbg.scala 397:24]
  assign sbcs_sberror_wren = _T_502 ? _T_508 : _GEN_102; // @[dbg.scala 342:21 dbg.scala 351:25 dbg.scala 357:25 dbg.scala 363:25 dbg.scala 385:25 dbg.scala 391:25]
  assign sb_bus_rdata = _T_671 | _T_677; // @[dbg.scala 446:16]
  assign sbaddress0_reg_wren1 = _T_502 ? 1'h0 : _GEN_106; // @[dbg.scala 344:24 dbg.scala 399:28]
  assign dmstatus_reg = {_T_163,_T_159}; // @[dbg.scala 189:16]
  assign dmstatus_havereset = _T_192; // @[dbg.scala 206:22]
  assign dmstatus_resumeack = _T_185; // @[dbg.scala 198:22]
  assign dmstatus_unavail = dmcontrol_reg[1] | _T_180; // @[dbg.scala 196:20]
  assign dmstatus_running = ~_T_183; // @[dbg.scala 197:20]
  assign dmstatus_halted = _T_188; // @[dbg.scala 202:19]
  assign abstractcs_busy_wren = _T_300 ? 1'h0 : _GEN_36; // @[dbg.scala 264:24 dbg.scala 285:28 dbg.scala 303:28]
  assign sb_bus_cmd_read = io_sb_axi_ar_valid & io_sb_axi_ar_ready; // @[dbg.scala 406:19]
  assign sb_bus_cmd_write_addr = io_sb_axi_aw_valid & io_sb_axi_aw_ready; // @[dbg.scala 407:25]
  assign sb_bus_cmd_write_data = io_sb_axi_w_valid & io_sb_axi_w_ready; // @[dbg.scala 408:25]
  assign sb_bus_rsp_read = io_sb_axi_r_valid & io_sb_axi_r_ready; // @[dbg.scala 409:19]
  assign sb_bus_rsp_error = _T_555 | _T_558; // @[dbg.scala 411:20]
  assign sb_bus_rsp_write = io_sb_axi_b_valid & io_sb_axi_b_ready; // @[dbg.scala 410:20]
  assign sbcs_sbbusy_din = 4'h0 == sb_state; // @[dbg.scala 341:19 dbg.scala 350:23 dbg.scala 398:23]
  assign data1_reg = _T_299; // @[dbg.scala 257:13]
  assign sbcs_reg = {_T_44,_T_40}; // @[dbg.scala 130:12]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_io_en = _T_3 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_1_io_en = _T_6 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = sbdata0_reg_wren0 | sbdata0_reg_wren1; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_4_io_en = sbaddress0_reg_wren0 | sbaddress0_reg_wren1; // @[lib.scala 371:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign abstractcs_reg = {_T_267,_T_265}; // @[dbg.scala 238:18]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_5_io_en = _T_217 & _T_272; // @[lib.scala 371:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_6_io_en = data0_reg_wren0 | data0_reg_wren1; // @[lib.scala 371:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_7_io_en = _T_295 & _T_272; // @[lib.scala 371:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign dbg_nxtstate = _T_300 ? _T_303 : _GEN_33; // @[dbg.scala 262:16 dbg.scala 270:20 dbg.scala 275:20 dbg.scala 280:20 dbg.scala 291:20 dbg.scala 296:20 dbg.scala 301:20 dbg.scala 308:20]
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
  temp_sbcs_22 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  temp_sbcs_21 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  temp_sbcs_20 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  temp_sbcs_19_15 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  temp_sbcs_14_12 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  sbdata0_reg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  sbdata1_reg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_118 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  dm_temp = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  dm_temp_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  dmcontrol_wren_Q = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_185 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_188 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_192 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  abs_temp_12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  abs_temp_10_8 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  command_reg = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  data0_reg = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  _T_299 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  _T_468 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  _T_469 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  _T_547 = _RAND_21[3:0];
`endif // RANDOMIZE_REG_INIT
  if (dbg_dm_rst_l) begin
    temp_sbcs_22 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    temp_sbcs_21 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    temp_sbcs_20 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    temp_sbcs_19_15 = 5'h0;
  end
  if (rst_not) begin
    temp_sbcs_14_12 = 3'h0;
  end
  if (dbg_dm_rst_l) begin
    sbdata0_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    sbdata1_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_118 = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    dm_temp = 4'h0;
  end
  if (io_dbg_rst_l) begin
    dm_temp_0 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    dmcontrol_wren_Q = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_185 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_188 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_192 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    abs_temp_12 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    abs_temp_10_8 = 3'h0;
  end
  if (dbg_dm_rst_l) begin
    command_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    data0_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_299 = 32'h0;
  end
  if (rst_temp) begin
    _T_468 = 3'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_469 = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_547 = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_sbcs_22 <= 1'h0;
    end else if (sbcs_sbbusyerror_wren) begin
      temp_sbcs_22 <= sbcs_sbbusyerror_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_sbcs_21 <= 1'h0;
    end else if (sbcs_sbbusy_wren) begin
      temp_sbcs_21 <= sbcs_sbbusy_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_sbcs_20 <= 1'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_20 <= io_dmi_reg_wdata[20];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_sbcs_19_15 <= 5'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_19_15 <= io_dmi_reg_wdata[19:15];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge rst_not) begin
    if (rst_not) begin
      temp_sbcs_14_12 <= 3'h0;
    end else if (sbcs_sberror_wren) begin
      if (_T_502) begin
        temp_sbcs_14_12 <= _T_512;
      end else if (_T_513) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_520) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_527) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_529) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_535) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_537) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_539) begin
        temp_sbcs_14_12 <= 3'h2;
      end else if (_T_542) begin
        temp_sbcs_14_12 <= 3'h2;
      end else begin
        temp_sbcs_14_12 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      sbdata0_reg <= 32'h0;
    end else begin
      sbdata0_reg <= _T_95 | _T_99;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      sbdata1_reg <= 32'h0;
    end else begin
      sbdata1_reg <= _T_102 | _T_106;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_118 <= 32'h0;
    end else begin
      _T_118 <= _T_111 | _T_117;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      dm_temp <= 4'h0;
    end else if (dmcontrol_wren) begin
      dm_temp <= _T_136;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge io_dbg_rst_l) begin
    if (io_dbg_rst_l) begin
      dm_temp_0 <= 1'h0;
    end else if (dmcontrol_wren) begin
      dm_temp_0 <= io_dmi_reg_wdata[0];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      dmcontrol_wren_Q <= 1'h0;
    end else begin
      dmcontrol_wren_Q <= _T_131 & io_dmi_reg_wr_en;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_185 <= 1'h0;
    end else if (dmstatus_resumeack_wren) begin
      _T_185 <= _T_166;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_188 <= 1'h0;
    end else begin
      _T_188 <= io_dec_tlu_dbg_halted & _T_186;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_192 <= 1'h0;
    end else begin
      _T_192 <= _T_189 & _T_190;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      abs_temp_12 <= 1'h0;
    end else if (abstractcs_busy_wren) begin
      if (_T_300) begin
        abs_temp_12 <= 1'h0;
      end else if (_T_318) begin
        abs_temp_12 <= 1'h0;
      end else begin
        abs_temp_12 <= _T_330;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      abs_temp_10_8 <= 3'h0;
    end else begin
      abs_temp_10_8 <= _T_258 | _T_263;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      command_reg <= 32'h0;
    end else begin
      command_reg <= {_T_278,_T_276};
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      data0_reg <= 32'h0;
    end else begin
      data0_reg <= _T_289 | _T_292;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_299 <= 32'h0;
    end else begin
      _T_299 <= _T_298 & io_dmi_reg_wdata;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge rst_temp) begin
    if (rst_temp) begin
      _T_468 <= 3'h0;
    end else if (dbg_state_en) begin
      if (_T_300) begin
        if (_T_302) begin
          _T_468 <= 3'h2;
        end else begin
          _T_468 <= 3'h1;
        end
      end else if (_T_318) begin
        if (dmcontrol_reg[1]) begin
          _T_468 <= 3'h0;
        end else begin
          _T_468 <= 3'h2;
        end
      end else if (_T_330) begin
        if (_T_334) begin
          if (_T_338) begin
            _T_468 <= 3'h6;
          end else begin
            _T_468 <= 3'h3;
          end
        end else if (dmcontrol_reg[31]) begin
          _T_468 <= 3'h1;
        end else begin
          _T_468 <= 3'h0;
        end
      end else if (_T_368) begin
        if (dmcontrol_reg[1]) begin
          _T_468 <= 3'h0;
        end else if (_T_371) begin
          _T_468 <= 3'h5;
        end else begin
          _T_468 <= 3'h4;
        end
      end else if (_T_385) begin
        if (dmcontrol_reg[1]) begin
          _T_468 <= 3'h0;
        end else begin
          _T_468 <= 3'h5;
        end
      end else if (_T_396) begin
        if (dmcontrol_reg[1]) begin
          _T_468 <= 3'h0;
        end else begin
          _T_468 <= 3'h2;
        end
      end else begin
        _T_468 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_469 <= 32'h0;
    end else if (io_dmi_reg_en) begin
      _T_469 <= dmi_reg_rdata_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_547 <= 4'h0;
    end else if (sb_state_en) begin
      if (_T_502) begin
        if (sbdata0_reg_wren0) begin
          _T_547 <= 4'h2;
        end else begin
          _T_547 <= 4'h1;
        end
      end else if (_T_513) begin
        if (_T_514) begin
          _T_547 <= 4'h9;
        end else begin
          _T_547 <= 4'h3;
        end
      end else if (_T_520) begin
        if (_T_514) begin
          _T_547 <= 4'h9;
        end else begin
          _T_547 <= 4'h4;
        end
      end else if (_T_527) begin
        _T_547 <= 4'h7;
      end else if (_T_529) begin
        if (_T_530) begin
          _T_547 <= 4'h8;
        end else if (sb_bus_cmd_write_data) begin
          _T_547 <= 4'h5;
        end else begin
          _T_547 <= 4'h6;
        end
      end else if (_T_535) begin
        _T_547 <= 4'h8;
      end else if (_T_537) begin
        _T_547 <= 4'h8;
      end else if (_T_539) begin
        _T_547 <= 4'h9;
      end else if (_T_542) begin
        _T_547 <= 4'h9;
      end else begin
        _T_547 <= 4'h0;
      end
    end
  end
endmodule
