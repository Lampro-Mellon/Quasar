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
  wire  _T = dbg_state != 3'h0; // @[el2_dbg.scala 126:51]
  wire  _T_1 = io_dmi_reg_en | _T; // @[el2_dbg.scala 126:38]
  wire  _T_2 = _T_1 | dbg_state_en; // @[el2_dbg.scala 126:69]
  wire  _T_3 = _T_2 | io_dec_tlu_dbg_halted; // @[el2_dbg.scala 126:84]
  wire  _T_4 = io_dmi_reg_en | sb_state_en; // @[el2_dbg.scala 127:37]
  wire  _T_5 = sb_state != 4'h0; // @[el2_dbg.scala 127:63]
  wire  _T_6 = _T_4 | _T_5; // @[el2_dbg.scala 127:51]
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  _T_9 = dmcontrol_reg[0] | io_scan_mode; // @[el2_dbg.scala 130:65]
  wire  _T_12 = ~dmcontrol_reg[1]; // @[el2_dbg.scala 131:25]
  wire  _T_14 = io_dmi_reg_addr == 7'h38; // @[el2_dbg.scala 132:36]
  wire  _T_15 = _T_14 & io_dmi_reg_en; // @[el2_dbg.scala 132:49]
  wire  _T_16 = _T_15 & io_dmi_reg_wr_en; // @[el2_dbg.scala 132:65]
  wire  _T_17 = sb_state == 4'h0; // @[el2_dbg.scala 132:96]
  wire  sbcs_wren = _T_16 & _T_17; // @[el2_dbg.scala 132:84]
  wire  _T_19 = sbcs_wren & io_dmi_reg_wdata[22]; // @[el2_dbg.scala 133:42]
  wire  _T_21 = _T_5 & io_dmi_reg_en; // @[el2_dbg.scala 133:102]
  wire  _T_22 = io_dmi_reg_addr == 7'h39; // @[el2_dbg.scala 134:23]
  wire  _T_23 = io_dmi_reg_addr == 7'h3c; // @[el2_dbg.scala 134:55]
  wire  _T_24 = _T_22 | _T_23; // @[el2_dbg.scala 134:36]
  wire  _T_25 = io_dmi_reg_addr == 7'h3d; // @[el2_dbg.scala 134:87]
  wire  _T_26 = _T_24 | _T_25; // @[el2_dbg.scala 134:68]
  wire  _T_27 = _T_21 & _T_26; // @[el2_dbg.scala 133:118]
  wire  sbcs_sbbusyerror_wren = _T_19 | _T_27; // @[el2_dbg.scala 133:66]
  wire  sbcs_sbbusyerror_din = ~_T_19; // @[el2_dbg.scala 136:31]
  wire  _T_30 = io_dbg_rst_l & _T_9; // @[el2_dbg.scala 137:74]
  wire  _T_31 = ~_T_30; // @[el2_dbg.scala 137:54]
  wire  _T_32 = ~_T_30; // @[el2_dbg.scala 137:90]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire [19:0] _T_50 = {temp_sbcs_19_15,temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire [11:0] _T_54 = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20}; // @[Cat.scala 29:58]
  wire  _T_57 = sbcs_reg[19:17] == 3'h1; // @[el2_dbg.scala 158:42]
  wire  _T_59 = _T_57 & sbaddress0_reg[0]; // @[el2_dbg.scala 158:56]
  wire  _T_61 = sbcs_reg[19:17] == 3'h2; // @[el2_dbg.scala 159:23]
  wire  _T_63 = |sbaddress0_reg[1:0]; // @[el2_dbg.scala 159:60]
  wire  _T_64 = _T_61 & _T_63; // @[el2_dbg.scala 159:37]
  wire  _T_65 = _T_59 | _T_64; // @[el2_dbg.scala 158:76]
  wire  _T_67 = sbcs_reg[19:17] == 3'h3; // @[el2_dbg.scala 160:23]
  wire  _T_69 = |sbaddress0_reg[2:0]; // @[el2_dbg.scala 160:60]
  wire  _T_70 = _T_67 & _T_69; // @[el2_dbg.scala 160:37]
  wire  sbcs_unaligned = _T_65 | _T_70; // @[el2_dbg.scala 159:64]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[el2_dbg.scala 162:35]
  wire  _T_72 = sbcs_reg[19:17] == 3'h0; // @[el2_dbg.scala 163:51]
  wire [3:0] _T_74 = _T_72 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_75 = _T_74 & 4'h1; // @[el2_dbg.scala 163:64]
  wire [3:0] _T_79 = _T_57 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_80 = _T_79 & 4'h2; // @[el2_dbg.scala 163:117]
  wire [3:0] _T_81 = _T_75 | _T_80; // @[el2_dbg.scala 163:76]
  wire [3:0] _T_85 = _T_61 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_86 = _T_85 & 4'h4; // @[el2_dbg.scala 164:44]
  wire [3:0] _T_87 = _T_81 | _T_86; // @[el2_dbg.scala 163:129]
  wire [3:0] _T_91 = _T_67 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_92 = _T_91 & 4'h8; // @[el2_dbg.scala 164:97]
  wire [3:0] sbaddress0_incr = _T_87 | _T_92; // @[el2_dbg.scala 164:56]
  wire  _T_93 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[el2_dbg.scala 166:41]
  wire  sbdata0_reg_wren0 = _T_93 & _T_23; // @[el2_dbg.scala 166:60]
  wire  _T_95 = sb_state == 4'h7; // @[el2_dbg.scala 167:37]
  wire  _T_96 = _T_95 & sb_state_en; // @[el2_dbg.scala 167:60]
  wire  _T_97 = ~sbcs_sberror_wren; // @[el2_dbg.scala 167:76]
  wire  sbdata0_reg_wren1 = _T_96 & _T_97; // @[el2_dbg.scala 167:74]
  wire  sbdata1_reg_wren0 = _T_93 & _T_25; // @[el2_dbg.scala 169:60]
  wire [31:0] _T_104 = sbdata0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_105 = _T_104 & io_dmi_reg_wdata; // @[el2_dbg.scala 172:49]
  wire [31:0] _T_107 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_109 = _T_107 & sb_bus_rdata[31:0]; // @[el2_dbg.scala 173:33]
  wire [31:0] _T_111 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_112 = _T_111 & io_dmi_reg_wdata; // @[el2_dbg.scala 175:49]
  wire [31:0] _T_116 = _T_107 & sb_bus_rdata[63:32]; // @[el2_dbg.scala 176:33]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [31:0] sbdata0_reg; // @[el2_lib.scala 514:16]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [31:0] sbdata1_reg; // @[el2_lib.scala 514:16]
  wire  sbaddress0_reg_wren0 = _T_93 & _T_22; // @[el2_dbg.scala 186:63]
  wire [31:0] _T_126 = sbaddress0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_127 = _T_126 & io_dmi_reg_wdata; // @[el2_dbg.scala 188:59]
  wire [31:0] _T_129 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_130 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_132 = sbaddress0_reg + _T_130; // @[el2_dbg.scala 189:54]
  wire [31:0] _T_133 = _T_129 & _T_132; // @[el2_dbg.scala 189:36]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [31:0] _T_137; // @[el2_lib.scala 514:16]
  wire  sbreadonaddr_access = sbaddress0_reg_wren0 & sbcs_reg[20]; // @[el2_dbg.scala 194:94]
  wire  _T_142 = ~io_dmi_reg_wr_en; // @[el2_dbg.scala 195:45]
  wire  _T_143 = io_dmi_reg_en & _T_142; // @[el2_dbg.scala 195:43]
  wire  _T_145 = _T_143 & _T_23; // @[el2_dbg.scala 195:63]
  wire  sbreadondata_access = _T_145 & sbcs_reg[15]; // @[el2_dbg.scala 195:95]
  wire  _T_149 = io_dmi_reg_addr == 7'h10; // @[el2_dbg.scala 197:41]
  wire  _T_150 = _T_149 & io_dmi_reg_en; // @[el2_dbg.scala 197:54]
  wire  dmcontrol_wren = _T_150 & io_dmi_reg_wr_en; // @[el2_dbg.scala 197:70]
  wire [3:0] _T_158 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [27:0] _T_164 = {26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire [3:0] _T_166 = {dm_temp[3:2],1'h0,dm_temp[1]}; // @[Cat.scala 29:58]
  reg  dmcontrol_wren_Q; // @[el2_dbg.scala 212:12]
  wire [1:0] _T_171 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_173 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_175 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_177 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_179 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_183 = {_T_177,_T_179,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire [19:0] _T_187 = {12'h0,_T_171,_T_173,2'h0,_T_175}; // @[Cat.scala 29:58]
  wire  _T_189 = dbg_state == 3'h6; // @[el2_dbg.scala 217:44]
  wire  _T_190 = _T_189 & io_dec_tlu_resume_ack; // @[el2_dbg.scala 217:66]
  wire  _T_192 = ~dmcontrol_reg[30]; // @[el2_dbg.scala 217:113]
  wire  _T_193 = dmstatus_resumeack & _T_192; // @[el2_dbg.scala 217:111]
  wire  dmstatus_resumeack_wren = _T_190 | _T_193; // @[el2_dbg.scala 217:90]
  wire  _T_197 = _T_149 & io_dmi_reg_wdata[1]; // @[el2_dbg.scala 219:63]
  wire  _T_198 = _T_197 & io_dmi_reg_en; // @[el2_dbg.scala 219:85]
  wire  dmstatus_havereset_wren = _T_198 & io_dmi_reg_wr_en; // @[el2_dbg.scala 219:101]
  wire  _T_201 = _T_149 & io_dmi_reg_wdata[28]; // @[el2_dbg.scala 220:62]
  wire  _T_202 = _T_201 & io_dmi_reg_en; // @[el2_dbg.scala 220:85]
  wire  dmstatus_havereset_rst = _T_202 & io_dmi_reg_wr_en; // @[el2_dbg.scala 220:101]
  wire  _T_204 = ~reset; // @[el2_dbg.scala 222:43]
  wire  _T_207 = dmstatus_unavail | dmstatus_halted; // @[el2_dbg.scala 223:42]
  reg  _T_212; // @[Reg.scala 27:20]
  wire  _T_216 = ~io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 229:37]
  reg  _T_218; // @[el2_dbg.scala 229:12]
  wire  _T_222 = ~dmstatus_havereset_rst; // @[el2_dbg.scala 233:15]
  reg  _T_223; // @[Reg.scala 27:20]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire [31:0] abstractcs_reg;
  wire  _T_225 = abstractcs_reg[12] & io_dmi_reg_en; // @[el2_dbg.scala 239:50]
  wire  _T_226 = io_dmi_reg_addr == 7'h16; // @[el2_dbg.scala 239:106]
  wire  _T_227 = io_dmi_reg_addr == 7'h17; // @[el2_dbg.scala 239:138]
  wire  _T_228 = _T_226 | _T_227; // @[el2_dbg.scala 239:119]
  wire  _T_229 = io_dmi_reg_wr_en & _T_228; // @[el2_dbg.scala 239:86]
  wire  _T_230 = io_dmi_reg_addr == 7'h4; // @[el2_dbg.scala 239:171]
  wire  _T_231 = _T_229 | _T_230; // @[el2_dbg.scala 239:152]
  wire  abstractcs_error_sel0 = _T_225 & _T_231; // @[el2_dbg.scala 239:66]
  wire  _T_234 = _T_93 & _T_227; // @[el2_dbg.scala 240:64]
  wire  _T_236 = io_dmi_reg_wdata[31:24] == 8'h0; // @[el2_dbg.scala 240:126]
  wire  _T_238 = io_dmi_reg_wdata[31:24] == 8'h2; // @[el2_dbg.scala 240:163]
  wire  _T_239 = _T_236 | _T_238; // @[el2_dbg.scala 240:135]
  wire  _T_240 = ~_T_239; // @[el2_dbg.scala 240:98]
  wire  abstractcs_error_sel1 = _T_234 & _T_240; // @[el2_dbg.scala 240:96]
  wire  abstractcs_error_sel2 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[el2_dbg.scala 241:52]
  wire  _T_245 = ~dmstatus_reg[9]; // @[el2_dbg.scala 242:98]
  wire  abstractcs_error_sel3 = _T_234 & _T_245; // @[el2_dbg.scala 242:96]
  wire  _T_247 = _T_227 & io_dmi_reg_en; // @[el2_dbg.scala 243:61]
  wire  _T_248 = _T_247 & io_dmi_reg_wr_en; // @[el2_dbg.scala 243:77]
  wire  _T_250 = io_dmi_reg_wdata[22:20] != 3'h2; // @[el2_dbg.scala 244:32]
  wire  _T_254 = |data1_reg[1:0]; // @[el2_dbg.scala 244:106]
  wire  _T_255 = _T_238 & _T_254; // @[el2_dbg.scala 244:87]
  wire  _T_256 = _T_250 | _T_255; // @[el2_dbg.scala 244:46]
  wire  abstractcs_error_sel4 = _T_248 & _T_256; // @[el2_dbg.scala 243:96]
  wire  _T_258 = _T_226 & io_dmi_reg_en; // @[el2_dbg.scala 246:61]
  wire  abstractcs_error_sel5 = _T_258 & io_dmi_reg_wr_en; // @[el2_dbg.scala 246:77]
  wire  _T_259 = abstractcs_error_sel0 | abstractcs_error_sel1; // @[el2_dbg.scala 247:54]
  wire  _T_260 = _T_259 | abstractcs_error_sel2; // @[el2_dbg.scala 247:78]
  wire  _T_261 = _T_260 | abstractcs_error_sel3; // @[el2_dbg.scala 247:102]
  wire  _T_262 = _T_261 | abstractcs_error_sel4; // @[el2_dbg.scala 247:126]
  wire  abstractcs_error_selor = _T_262 | abstractcs_error_sel5; // @[el2_dbg.scala 247:150]
  wire [2:0] _T_264 = abstractcs_error_sel0 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_265 = _T_264 & 3'h1; // @[el2_dbg.scala 248:62]
  wire [2:0] _T_267 = abstractcs_error_sel1 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_268 = _T_267 & 3'h2; // @[el2_dbg.scala 249:37]
  wire [2:0] _T_269 = _T_265 | _T_268; // @[el2_dbg.scala 248:74]
  wire [2:0] _T_271 = abstractcs_error_sel2 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_272 = _T_271 & 3'h3; // @[el2_dbg.scala 250:37]
  wire [2:0] _T_273 = _T_269 | _T_272; // @[el2_dbg.scala 249:49]
  wire [2:0] _T_275 = abstractcs_error_sel3 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_276 = _T_275 & 3'h4; // @[el2_dbg.scala 251:37]
  wire [2:0] _T_277 = _T_273 | _T_276; // @[el2_dbg.scala 250:49]
  wire [2:0] _T_279 = abstractcs_error_sel4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_281 = _T_277 | _T_279; // @[el2_dbg.scala 251:49]
  wire [2:0] _T_283 = abstractcs_error_sel5 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_285 = ~io_dmi_reg_wdata[10:8]; // @[el2_dbg.scala 253:40]
  wire [2:0] _T_286 = _T_283 & _T_285; // @[el2_dbg.scala 253:37]
  wire [2:0] _T_288 = _T_286 & abstractcs_reg[10:8]; // @[el2_dbg.scala 253:75]
  wire [2:0] _T_289 = _T_281 | _T_288; // @[el2_dbg.scala 252:49]
  wire  _T_290 = ~abstractcs_error_selor; // @[el2_dbg.scala 254:15]
  wire [2:0] _T_292 = _T_290 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_294 = _T_292 & abstractcs_reg[10:8]; // @[el2_dbg.scala 254:50]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[el2_dbg.scala 261:12]
  wire [10:0] _T_302 = {abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire [20:0] _T_304 = {19'h0,abs_temp_12,1'h0}; // @[Cat.scala 29:58]
  wire  _T_309 = dbg_state == 3'h2; // @[el2_dbg.scala 266:100]
  wire  command_wren = _T_248 & _T_309; // @[el2_dbg.scala 266:87]
  wire [19:0] _T_313 = {3'h0,io_dmi_reg_wdata[16:0]}; // @[Cat.scala 29:58]
  wire [11:0] _T_315 = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:20]}; // @[Cat.scala 29:58]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [31:0] command_reg; // @[el2_lib.scala 514:16]
  wire  _T_321 = _T_93 & _T_230; // @[el2_dbg.scala 272:58]
  wire  data0_reg_wren0 = _T_321 & _T_309; // @[el2_dbg.scala 272:89]
  wire  _T_323 = dbg_state == 3'h4; // @[el2_dbg.scala 273:59]
  wire  _T_324 = io_core_dbg_cmd_done & _T_323; // @[el2_dbg.scala 273:46]
  wire  _T_326 = ~command_reg[16]; // @[el2_dbg.scala 273:83]
  wire  data0_reg_wren1 = _T_324 & _T_326; // @[el2_dbg.scala 273:81]
  wire [31:0] _T_328 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_329 = _T_328 & io_dmi_reg_wdata; // @[el2_dbg.scala 276:45]
  wire [31:0] _T_331 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_332 = _T_331 & io_core_dbg_rddata; // @[el2_dbg.scala 276:92]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [31:0] data0_reg; // @[el2_lib.scala 514:16]
  wire  _T_337 = io_dmi_reg_addr == 7'h5; // @[el2_dbg.scala 281:77]
  wire  _T_338 = _T_93 & _T_337; // @[el2_dbg.scala 281:58]
  wire  data1_reg_wren = _T_338 & _T_309; // @[el2_dbg.scala 281:89]
  wire [31:0] _T_341 = data1_reg_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 508:23]
  reg [31:0] _T_345; // @[el2_lib.scala 514:16]
  wire [2:0] dbg_nxtstate;
  wire  _T_346 = 3'h0 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_348 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 296:43]
  wire [2:0] _T_349 = _T_348 ? 3'h2 : 3'h1; // @[el2_dbg.scala 296:26]
  wire  _T_351 = ~io_dec_tlu_debug_mode; // @[el2_dbg.scala 297:45]
  wire  _T_352 = dmcontrol_reg[31] & _T_351; // @[el2_dbg.scala 297:43]
  wire  _T_354 = _T_352 | dmstatus_reg[9]; // @[el2_dbg.scala 297:69]
  wire  _T_355 = _T_354 | io_dec_tlu_mpc_halted_only; // @[el2_dbg.scala 297:87]
  wire  _T_358 = _T_355 & _T_12; // @[el2_dbg.scala 297:117]
  wire  _T_362 = dmcontrol_reg[31] & _T_12; // @[el2_dbg.scala 298:45]
  wire  _T_364 = 3'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_366 = dmcontrol_reg[1] ? 3'h0 : 3'h2; // @[el2_dbg.scala 301:26]
  wire  _T_369 = dmstatus_reg[9] | dmcontrol_reg[1]; // @[el2_dbg.scala 302:39]
  wire  _T_371 = dmcontrol_wren_Q & dmcontrol_reg[31]; // @[el2_dbg.scala 303:44]
  wire  _T_374 = _T_371 & _T_12; // @[el2_dbg.scala 303:64]
  wire  _T_376 = 3'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_380 = dmstatus_reg[9] & _T_12; // @[el2_dbg.scala 306:43]
  wire  _T_383 = ~dmcontrol_reg[3]; // @[el2_dbg.scala 307:33]
  wire  _T_384 = dmcontrol_reg[30] & _T_383; // @[el2_dbg.scala 307:31]
  wire [2:0] _T_385 = _T_384 ? 3'h6 : 3'h3; // @[el2_dbg.scala 307:12]
  wire [2:0] _T_387 = dmcontrol_reg[31] ? 3'h1 : 3'h0; // @[el2_dbg.scala 308:12]
  wire [2:0] _T_388 = _T_380 ? _T_385 : _T_387; // @[el2_dbg.scala 306:26]
  wire  _T_391 = dmstatus_reg[9] & dmcontrol_reg[30]; // @[el2_dbg.scala 309:39]
  wire  _T_393 = ~dmcontrol_reg[31]; // @[el2_dbg.scala 309:61]
  wire  _T_394 = _T_391 & _T_393; // @[el2_dbg.scala 309:59]
  wire  _T_395 = _T_394 & dmcontrol_wren_Q; // @[el2_dbg.scala 309:80]
  wire  _T_396 = _T_395 | command_wren; // @[el2_dbg.scala 309:99]
  wire  _T_398 = _T_396 | dmcontrol_reg[1]; // @[el2_dbg.scala 309:114]
  wire  _T_401 = ~_T_348; // @[el2_dbg.scala 310:28]
  wire  _T_402 = _T_398 | _T_401; // @[el2_dbg.scala 310:26]
  wire  _T_403 = dbg_nxtstate == 3'h3; // @[el2_dbg.scala 311:60]
  wire  _T_404 = dbg_state_en & _T_403; // @[el2_dbg.scala 311:44]
  wire  _T_405 = dbg_nxtstate == 3'h6; // @[el2_dbg.scala 313:58]
  wire  _T_406 = dbg_state_en & _T_405; // @[el2_dbg.scala 313:42]
  wire  _T_414 = 3'h3 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_417 = |abstractcs_reg[10:8]; // @[el2_dbg.scala 317:85]
  wire [2:0] _T_418 = _T_417 ? 3'h5 : 3'h4; // @[el2_dbg.scala 317:62]
  wire [2:0] _T_419 = dmcontrol_reg[1] ? 3'h0 : _T_418; // @[el2_dbg.scala 317:26]
  wire  _T_422 = io_dbg_cmd_valid | _T_417; // @[el2_dbg.scala 318:40]
  wire  _T_424 = _T_422 | dmcontrol_reg[1]; // @[el2_dbg.scala 318:68]
  wire  _T_431 = 3'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_433 = dmcontrol_reg[1] ? 3'h0 : 3'h5; // @[el2_dbg.scala 322:26]
  wire  _T_435 = io_core_dbg_cmd_done | dmcontrol_reg[1]; // @[el2_dbg.scala 323:44]
  wire  _T_442 = 3'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_451 = 3'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_454 = dmstatus_reg[17] | dmcontrol_reg[1]; // @[el2_dbg.scala 335:40]
  wire  _GEN_11 = _T_451 & _T_454; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_451 & _T_374; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_13 = _T_442 ? _T_366 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_442 | _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_442 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_442 ? _T_374 : _GEN_12; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_18 = _T_431 ? _T_433 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_431 ? _T_435 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_431 ? _T_374 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_431 ? 1'h0 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_414 ? _T_419 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_414 ? _T_424 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_414 ? _T_374 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_414 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_28 = _T_376 ? _T_388 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_376 ? _T_402 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_376 ? _T_404 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_376 & _T_406; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_376 ? _T_374 : _GEN_25; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_34 = _T_364 ? _T_366 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_364 ? _T_369 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_364 ? _T_374 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_364 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_364 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire [31:0] _T_463 = _T_230 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_464 = _T_463 & data0_reg; // @[el2_dbg.scala 339:71]
  wire [31:0] _T_467 = _T_337 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_468 = _T_467 & data1_reg; // @[el2_dbg.scala 339:122]
  wire [31:0] _T_469 = _T_464 | _T_468; // @[el2_dbg.scala 339:83]
  wire [31:0] _T_472 = _T_149 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_473 = _T_472 & dmcontrol_reg; // @[el2_dbg.scala 340:43]
  wire [31:0] _T_474 = _T_469 | _T_473; // @[el2_dbg.scala 339:134]
  wire  _T_475 = io_dmi_reg_addr == 7'h11; // @[el2_dbg.scala 340:86]
  wire [31:0] _T_477 = _T_475 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_478 = _T_477 & dmstatus_reg; // @[el2_dbg.scala 340:99]
  wire [31:0] _T_479 = _T_474 | _T_478; // @[el2_dbg.scala 340:59]
  wire [31:0] _T_482 = _T_226 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_483 = _T_482 & abstractcs_reg; // @[el2_dbg.scala 341:43]
  wire [31:0] _T_484 = _T_479 | _T_483; // @[el2_dbg.scala 340:114]
  wire [31:0] _T_487 = _T_227 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_488 = _T_487 & command_reg; // @[el2_dbg.scala 341:100]
  wire [31:0] _T_489 = _T_484 | _T_488; // @[el2_dbg.scala 341:60]
  wire  _T_490 = io_dmi_reg_addr == 7'h40; // @[el2_dbg.scala 342:30]
  wire [31:0] _T_492 = _T_490 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_493 = _T_492 & haltsum0_reg; // @[el2_dbg.scala 342:43]
  wire [31:0] _T_494 = _T_489 | _T_493; // @[el2_dbg.scala 341:114]
  wire [31:0] _T_497 = _T_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_498 = _T_497 & sbcs_reg; // @[el2_dbg.scala 342:98]
  wire [31:0] _T_499 = _T_494 | _T_498; // @[el2_dbg.scala 342:58]
  wire [31:0] _T_502 = _T_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_503 = _T_502 & sbaddress0_reg; // @[el2_dbg.scala 343:43]
  wire [31:0] _T_504 = _T_499 | _T_503; // @[el2_dbg.scala 342:109]
  wire [31:0] _T_507 = _T_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_508 = _T_507 & sbdata0_reg; // @[el2_dbg.scala 343:100]
  wire [31:0] _T_509 = _T_504 | _T_508; // @[el2_dbg.scala 343:60]
  wire [31:0] _T_512 = _T_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_513 = _T_512 & sbdata1_reg; // @[el2_dbg.scala 344:43]
  wire [31:0] dmi_reg_rdata_din = _T_509 | _T_513; // @[el2_dbg.scala 343:114]
  wire  _T_517 = _T_31 & reset; // @[el2_dbg.scala 346:96]
  reg [2:0] _T_518; // @[Reg.scala 27:20]
  reg [31:0] _T_522; // @[Reg.scala 27:20]
  wire  _T_524 = command_reg[31:24] == 8'h2; // @[el2_dbg.scala 355:47]
  wire [30:0] _T_526 = {data1_reg[31:2],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_528 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_531 = dbg_state == 3'h3; // @[el2_dbg.scala 357:35]
  wire  _T_534 = ~_T_417; // @[el2_dbg.scala 357:60]
  wire  _T_535 = _T_531 & _T_534; // @[el2_dbg.scala 357:58]
  wire  _T_543 = command_reg[15:12] == 4'h0; // @[el2_dbg.scala 359:102]
  wire [1:0] _T_544 = {1'h0,_T_543}; // @[Cat.scala 29:58]
  wire  _T_555 = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_557 = sbdata0_reg_wren0 | sbreadondata_access; // @[el2_dbg.scala 374:39]
  wire  _T_558 = _T_557 | sbreadonaddr_access; // @[el2_dbg.scala 374:61]
  wire  _T_560 = |io_dmi_reg_wdata[14:12]; // @[el2_dbg.scala 377:65]
  wire  _T_561 = sbcs_wren & _T_560; // @[el2_dbg.scala 377:38]
  wire  _T_563 = io_dmi_reg_wdata[14:12] == 3'h0; // @[el2_dbg.scala 378:27]
  wire [2:0] _GEN_116 = {{2'd0}, _T_563}; // @[el2_dbg.scala 378:53]
  wire [2:0] _T_565 = _GEN_116 & sbcs_reg[14:12]; // @[el2_dbg.scala 378:53]
  wire  _T_566 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_567 = sbcs_unaligned | sbcs_illegal_size; // @[el2_dbg.scala 381:41]
  wire  _T_569 = io_dbg_bus_clk_en | sbcs_unaligned; // @[el2_dbg.scala 382:40]
  wire  _T_570 = _T_569 | sbcs_illegal_size; // @[el2_dbg.scala 382:57]
  wire  _T_573 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_580 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_581 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[el2_dbg.scala 394:38]
  wire  _T_582 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_583 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[el2_dbg.scala 397:48]
  wire  _T_586 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[el2_dbg.scala 398:45]
  wire  _T_587 = _T_586 & io_dbg_bus_clk_en; // @[el2_dbg.scala 398:70]
  wire  _T_588 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_589 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[el2_dbg.scala 402:44]
  wire  _T_590 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_591 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[el2_dbg.scala 406:44]
  wire  _T_592 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_593 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[el2_dbg.scala 410:38]
  wire  _T_594 = sb_state_en & sb_bus_rsp_error; // @[el2_dbg.scala 411:40]
  wire  _T_595 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_596 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[el2_dbg.scala 416:39]
  wire  _T_598 = 4'h9 == sb_state; // @[Conditional.scala 37:30]
  wire  _GEN_51 = _T_598 & sbcs_reg[16]; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_595 ? _T_596 : _T_598; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_595 & _T_594; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_595 ? 1'h0 : _T_598; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_595 ? 1'h0 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_592 ? _T_593 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_592 ? _T_594 : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_592 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_592 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_590 ? _T_591 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_590 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_590 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_590 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_588 ? _T_589 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_588 ? 1'h0 : _GEN_68; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_588 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_588 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_582 ? _T_587 : _GEN_74; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_582 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_582 ? 1'h0 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_582 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_580 ? _T_581 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_89 = _T_580 ? 1'h0 : _GEN_82; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_580 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_580 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_573 ? _T_570 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_573 ? _T_567 : _GEN_89; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_573 ? 1'h0 : _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_100 = _T_573 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_102 = _T_566 ? _T_570 : _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_103 = _T_566 ? _T_567 : _GEN_96; // @[Conditional.scala 39:67]
  wire  _GEN_105 = _T_566 ? 1'h0 : _GEN_98; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_566 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67]
  reg [3:0] _T_603; // @[Reg.scala 27:20]
  wire  _T_610 = |io_sb_axi_rresp; // @[el2_dbg.scala 437:63]
  wire  _T_611 = sb_bus_rsp_read & _T_610; // @[el2_dbg.scala 437:39]
  wire  _T_613 = |io_sb_axi_bresp; // @[el2_dbg.scala 437:110]
  wire  _T_614 = sb_bus_rsp_write & _T_613; // @[el2_dbg.scala 437:86]
  wire  _T_616 = sb_state == 4'h4; // @[el2_dbg.scala 438:35]
  wire  _T_617 = sb_state == 4'h5; // @[el2_dbg.scala 438:70]
  wire  _T_623 = sb_state == 4'h6; // @[el2_dbg.scala 449:69]
  wire [63:0] _T_629 = _T_72 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_633 = {sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_634 = _T_629 & _T_633; // @[el2_dbg.scala 450:59]
  wire [63:0] _T_638 = _T_57 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_641 = {sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_642 = _T_638 & _T_641; // @[el2_dbg.scala 450:132]
  wire [63:0] _T_643 = _T_634 | _T_642; // @[el2_dbg.scala 450:90]
  wire [63:0] _T_647 = _T_61 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_649 = {sbdata0_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_650 = _T_647 & _T_649; // @[el2_dbg.scala 451:45]
  wire [63:0] _T_651 = _T_643 | _T_650; // @[el2_dbg.scala 450:162]
  wire [63:0] _T_655 = _T_67 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_658 = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_659 = _T_655 & _T_658; // @[el2_dbg.scala 451:119]
  wire [7:0] _T_664 = _T_72 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_666 = 15'h1 << sbaddress0_reg[2:0]; // @[el2_dbg.scala 453:76]
  wire [14:0] _GEN_117 = {{7'd0}, _T_664}; // @[el2_dbg.scala 453:61]
  wire [14:0] _T_667 = _GEN_117 & _T_666; // @[el2_dbg.scala 453:61]
  wire [7:0] _T_671 = _T_57 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_673 = {sbaddress0_reg[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_674 = 15'h3 << _T_673; // @[el2_dbg.scala 454:59]
  wire [14:0] _GEN_118 = {{7'd0}, _T_671}; // @[el2_dbg.scala 454:44]
  wire [14:0] _T_675 = _GEN_118 & _T_674; // @[el2_dbg.scala 454:44]
  wire [14:0] _T_676 = _T_667 | _T_675; // @[el2_dbg.scala 453:101]
  wire [7:0] _T_680 = _T_61 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_682 = {sbaddress0_reg[2],1'h0}; // @[Cat.scala 29:58]
  wire [10:0] _T_683 = 11'hf << _T_682; // @[el2_dbg.scala 455:59]
  wire [10:0] _GEN_119 = {{3'd0}, _T_680}; // @[el2_dbg.scala 455:44]
  wire [10:0] _T_684 = _GEN_119 & _T_683; // @[el2_dbg.scala 455:44]
  wire [14:0] _GEN_120 = {{4'd0}, _T_684}; // @[el2_dbg.scala 454:97]
  wire [14:0] _T_685 = _T_676 | _GEN_120; // @[el2_dbg.scala 454:97]
  wire [7:0] _T_689 = _T_67 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_121 = {{7'd0}, _T_689}; // @[el2_dbg.scala 455:95]
  wire [14:0] _T_691 = _T_685 | _GEN_121; // @[el2_dbg.scala 455:95]
  wire [3:0] _GEN_122 = {{1'd0}, sbaddress0_reg[2:0]}; // @[el2_dbg.scala 472:93]
  wire [6:0] _T_702 = 4'h8 * _GEN_122; // @[el2_dbg.scala 472:93]
  wire [63:0] _T_703 = io_sb_axi_rdata >> _T_702; // @[el2_dbg.scala 472:86]
  wire [63:0] _T_704 = _T_703 & 64'hff; // @[el2_dbg.scala 472:117]
  wire [63:0] _T_705 = _T_629 & _T_704; // @[el2_dbg.scala 472:59]
  wire [4:0] _GEN_123 = {{3'd0}, sbaddress0_reg[2:1]}; // @[el2_dbg.scala 473:80]
  wire [6:0] _T_712 = 5'h10 * _GEN_123; // @[el2_dbg.scala 473:80]
  wire [63:0] _T_713 = io_sb_axi_rdata >> _T_712; // @[el2_dbg.scala 473:72]
  wire [63:0] _T_714 = _T_713 & 64'hffff; // @[el2_dbg.scala 473:104]
  wire [63:0] _T_715 = _T_638 & _T_714; // @[el2_dbg.scala 473:45]
  wire [63:0] _T_716 = _T_705 | _T_715; // @[el2_dbg.scala 472:134]
  wire [5:0] _GEN_124 = {{5'd0}, sbaddress0_reg[2]}; // @[el2_dbg.scala 474:80]
  wire [6:0] _T_723 = 6'h20 * _GEN_124; // @[el2_dbg.scala 474:80]
  wire [63:0] _T_724 = io_sb_axi_rdata >> _T_723; // @[el2_dbg.scala 474:72]
  wire [63:0] _T_725 = _T_724 & 64'hffffffff; // @[el2_dbg.scala 474:101]
  wire [63:0] _T_726 = _T_647 & _T_725; // @[el2_dbg.scala 474:45]
  wire [63:0] _T_727 = _T_716 | _T_726; // @[el2_dbg.scala 473:123]
  wire [63:0] _T_733 = _T_655 & io_sb_axi_rdata; // @[el2_dbg.scala 475:45]
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
  assign io_dbg_cmd_addr = _T_524 ? {{1'd0}, _T_526} : _T_528; // @[el2_dbg.scala 355:19]
  assign io_dbg_cmd_wrdata = data0_reg; // @[el2_dbg.scala 356:21]
  assign io_dbg_cmd_valid = _T_535 & io_dma_dbg_ready; // @[el2_dbg.scala 357:20]
  assign io_dbg_cmd_write = command_reg[16]; // @[el2_dbg.scala 358:20]
  assign io_dbg_cmd_type = _T_524 ? 2'h2 : _T_544; // @[el2_dbg.scala 359:19]
  assign io_dbg_cmd_size = command_reg[21:20]; // @[el2_dbg.scala 360:19]
  assign io_dbg_core_rst_l = ~dmcontrol_reg[1]; // @[el2_dbg.scala 131:21]
  assign io_dbg_dma_bubble = _T_535 | _T_323; // @[el2_dbg.scala 361:21]
  assign io_dbg_halt_req = _T_346 ? _T_362 : _GEN_36; // @[el2_dbg.scala 292:19 el2_dbg.scala 298:23 el2_dbg.scala 303:23 el2_dbg.scala 314:23 el2_dbg.scala 319:23 el2_dbg.scala 324:23 el2_dbg.scala 331:23 el2_dbg.scala 336:23]
  assign io_dbg_resume_req = _T_346 ? 1'h0 : _GEN_39; // @[el2_dbg.scala 293:21 el2_dbg.scala 313:25]
  assign io_dmi_reg_rdata = _T_522; // @[el2_dbg.scala 351:20]
  assign io_sb_axi_awvalid = _T_616 | _T_617; // @[el2_dbg.scala 438:21]
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
  assign io_sb_axi_wvalid = _T_616 | _T_623; // @[el2_dbg.scala 449:20]
  assign io_sb_axi_wdata = _T_651 | _T_659; // @[el2_dbg.scala 450:19]
  assign io_sb_axi_wstrb = _T_691[7:0]; // @[el2_dbg.scala 453:19]
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
  assign dbg_state = _T_518; // @[el2_dbg.scala 346:13]
  assign dbg_state_en = _T_346 ? _T_358 : _GEN_35; // @[el2_dbg.scala 289:16 el2_dbg.scala 297:20 el2_dbg.scala 302:20 el2_dbg.scala 309:20 el2_dbg.scala 318:20 el2_dbg.scala 323:20 el2_dbg.scala 328:20 el2_dbg.scala 335:20]
  assign sb_state = _T_603; // @[el2_dbg.scala 428:12]
  assign sb_state_en = _T_555 ? _T_558 : _GEN_102; // @[el2_dbg.scala 374:19 el2_dbg.scala 382:19 el2_dbg.scala 388:19 el2_dbg.scala 394:19 el2_dbg.scala 398:19 el2_dbg.scala 402:19 el2_dbg.scala 406:19 el2_dbg.scala 410:19 el2_dbg.scala 416:19 el2_dbg.scala 422:19]
  assign dmcontrol_reg = {_T_166,_T_164}; // @[el2_dbg.scala 209:17]
  assign sbaddress0_reg = _T_137; // @[el2_dbg.scala 190:18]
  assign sbcs_sbbusy_wren = _T_555 ? sb_state_en : _GEN_105; // @[el2_dbg.scala 366:20 el2_dbg.scala 375:24 el2_dbg.scala 423:24]
  assign sbcs_sberror_wren = _T_555 ? _T_561 : _GEN_103; // @[el2_dbg.scala 368:21 el2_dbg.scala 377:25 el2_dbg.scala 383:25 el2_dbg.scala 389:25 el2_dbg.scala 411:25 el2_dbg.scala 417:25]
  assign sb_bus_rdata = _T_727 | _T_733; // @[el2_dbg.scala 472:16]
  assign sbaddress0_reg_wren1 = _T_555 ? 1'h0 : _GEN_107; // @[el2_dbg.scala 370:24 el2_dbg.scala 425:28]
  assign dmstatus_reg = {_T_187,_T_183}; // @[el2_dbg.scala 215:16]
  assign dmstatus_havereset = _T_223; // @[el2_dbg.scala 232:22]
  assign dmstatus_resumeack = _T_212; // @[el2_dbg.scala 224:22]
  assign dmstatus_unavail = dmcontrol_reg[1] | _T_204; // @[el2_dbg.scala 222:20]
  assign dmstatus_running = ~_T_207; // @[el2_dbg.scala 223:20]
  assign dmstatus_halted = _T_218; // @[el2_dbg.scala 228:19]
  assign abstractcs_busy_wren = _T_346 ? 1'h0 : _GEN_37; // @[el2_dbg.scala 290:24 el2_dbg.scala 311:28 el2_dbg.scala 329:28]
  assign sb_bus_cmd_read = io_sb_axi_arvalid & io_sb_axi_arready; // @[el2_dbg.scala 432:19]
  assign sb_bus_cmd_write_addr = io_sb_axi_awvalid & io_sb_axi_awready; // @[el2_dbg.scala 433:25]
  assign sb_bus_cmd_write_data = io_sb_axi_wvalid & io_sb_axi_wready; // @[el2_dbg.scala 434:25]
  assign sb_bus_rsp_read = io_sb_axi_rvalid & io_sb_axi_rready; // @[el2_dbg.scala 435:19]
  assign sb_bus_rsp_error = _T_611 | _T_614; // @[el2_dbg.scala 437:20]
  assign sb_bus_rsp_write = io_sb_axi_bvalid & io_sb_axi_bready; // @[el2_dbg.scala 436:20]
  assign sbcs_sbbusy_din = 4'h0 == sb_state; // @[el2_dbg.scala 367:19 el2_dbg.scala 376:23 el2_dbg.scala 424:23]
  assign data1_reg = _T_345; // @[el2_dbg.scala 283:13]
  assign sbcs_reg = {_T_54,_T_50}; // @[el2_dbg.scala 156:12]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_3 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = _T_6 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = sbdata0_reg_wren0 | sbdata0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = sbaddress0_reg_wren0 | sbaddress0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign abstractcs_reg = {_T_304,_T_302}; // @[el2_dbg.scala 264:18]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = _T_248 & _T_309; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = data0_reg_wren0 | data0_reg_wren1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = _T_338 & _T_309; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign dbg_nxtstate = _T_346 ? _T_349 : _GEN_34; // @[el2_dbg.scala 288:16 el2_dbg.scala 296:20 el2_dbg.scala 301:20 el2_dbg.scala 306:20 el2_dbg.scala 317:20 el2_dbg.scala 322:20 el2_dbg.scala 327:20 el2_dbg.scala 334:20]
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
  _T_137 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  dm_temp = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  dm_temp_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  dmcontrol_wren_Q = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_212 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_218 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_223 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  abs_temp_12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  abs_temp_10_8 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  command_reg = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  data0_reg = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  _T_345 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  _T_518 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  _T_522 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  _T_603 = _RAND_21[3:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_32) begin
    temp_sbcs_22 = 1'h0;
  end
  if (_T_32) begin
    temp_sbcs_21 = 1'h0;
  end
  if (_T_32) begin
    temp_sbcs_20 = 1'h0;
  end
  if (_T_32) begin
    temp_sbcs_19_15 = 5'h0;
  end
  if (_T_32) begin
    temp_sbcs_14_12 = 3'h0;
  end
  if (_T_32) begin
    sbdata0_reg = 32'h0;
  end
  if (_T_32) begin
    sbdata1_reg = 32'h0;
  end
  if (_T_32) begin
    _T_137 = 32'h0;
  end
  if (_T_32) begin
    dm_temp = 4'h0;
  end
  if (io_dbg_rst_l) begin
    dm_temp_0 = 1'h0;
  end
  if (_T_32) begin
    dmcontrol_wren_Q = 1'h0;
  end
  if (_T_32) begin
    _T_212 = 1'h0;
  end
  if (_T_32) begin
    _T_218 = 1'h0;
  end
  if (_T_32) begin
    _T_223 = 1'h0;
  end
  if (_T_32) begin
    abs_temp_12 = 1'h0;
  end
  if (_T_32) begin
    abs_temp_10_8 = 3'h0;
  end
  if (_T_32) begin
    command_reg = 32'h0;
  end
  if (_T_32) begin
    data0_reg = 32'h0;
  end
  if (_T_32) begin
    _T_345 = 32'h0;
  end
  if (_T_517) begin
    _T_518 = 3'h0;
  end
  if (_T_32) begin
    _T_522 = 32'h0;
  end
  if (_T_32) begin
    _T_603 = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      temp_sbcs_22 <= 1'h0;
    end else if (sbcs_sbbusyerror_wren) begin
      temp_sbcs_22 <= sbcs_sbbusyerror_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      temp_sbcs_21 <= 1'h0;
    end else if (sbcs_sbbusy_wren) begin
      temp_sbcs_21 <= sbcs_sbbusy_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      temp_sbcs_20 <= 1'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_20 <= io_dmi_reg_wdata[20];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      temp_sbcs_19_15 <= 5'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_19_15 <= io_dmi_reg_wdata[19:15];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      temp_sbcs_14_12 <= 3'h0;
    end else if (sbcs_sberror_wren) begin
      if (_T_555) begin
        temp_sbcs_14_12 <= _T_565;
      end else if (_T_566) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_573) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_580) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_582) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_588) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_590) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_592) begin
        temp_sbcs_14_12 <= 3'h2;
      end else if (_T_595) begin
        temp_sbcs_14_12 <= 3'h2;
      end else begin
        temp_sbcs_14_12 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      sbdata0_reg <= 32'h0;
    end else begin
      sbdata0_reg <= _T_105 | _T_109;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      sbdata1_reg <= 32'h0;
    end else begin
      sbdata1_reg <= _T_112 | _T_116;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_137 <= 32'h0;
    end else begin
      _T_137 <= _T_127 | _T_133;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      dm_temp <= 4'h0;
    end else if (dmcontrol_wren) begin
      dm_temp <= _T_158;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge io_dbg_rst_l) begin
    if (io_dbg_rst_l) begin
      dm_temp_0 <= 1'h0;
    end else if (dmcontrol_wren) begin
      dm_temp_0 <= io_dmi_reg_wdata[0];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      dmcontrol_wren_Q <= 1'h0;
    end else begin
      dmcontrol_wren_Q <= _T_150 & io_dmi_reg_wr_en;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_212 <= 1'h0;
    end else if (dmstatus_resumeack_wren) begin
      _T_212 <= _T_190;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_218 <= 1'h0;
    end else begin
      _T_218 <= io_dec_tlu_dbg_halted & _T_216;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_223 <= 1'h0;
    end else if (dmstatus_havereset_wren) begin
      _T_223 <= _T_222;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      abs_temp_12 <= 1'h0;
    end else if (abstractcs_busy_wren) begin
      if (_T_346) begin
        abs_temp_12 <= 1'h0;
      end else if (_T_364) begin
        abs_temp_12 <= 1'h0;
      end else begin
        abs_temp_12 <= _T_376;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      abs_temp_10_8 <= 3'h0;
    end else begin
      abs_temp_10_8 <= _T_289 | _T_294;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      command_reg <= 32'h0;
    end else begin
      command_reg <= {_T_315,_T_313};
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      data0_reg <= 32'h0;
    end else begin
      data0_reg <= _T_329 | _T_332;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_345 <= 32'h0;
    end else begin
      _T_345 <= _T_341 & io_dmi_reg_wdata;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_517) begin
    if (_T_517) begin
      _T_518 <= 3'h0;
    end else if (dbg_state_en) begin
      if (_T_346) begin
        if (_T_348) begin
          _T_518 <= 3'h2;
        end else begin
          _T_518 <= 3'h1;
        end
      end else if (_T_364) begin
        if (dmcontrol_reg[1]) begin
          _T_518 <= 3'h0;
        end else begin
          _T_518 <= 3'h2;
        end
      end else if (_T_376) begin
        if (_T_380) begin
          if (_T_384) begin
            _T_518 <= 3'h6;
          end else begin
            _T_518 <= 3'h3;
          end
        end else if (dmcontrol_reg[31]) begin
          _T_518 <= 3'h1;
        end else begin
          _T_518 <= 3'h0;
        end
      end else if (_T_414) begin
        if (dmcontrol_reg[1]) begin
          _T_518 <= 3'h0;
        end else if (_T_417) begin
          _T_518 <= 3'h5;
        end else begin
          _T_518 <= 3'h4;
        end
      end else if (_T_431) begin
        if (dmcontrol_reg[1]) begin
          _T_518 <= 3'h0;
        end else begin
          _T_518 <= 3'h5;
        end
      end else if (_T_442) begin
        if (dmcontrol_reg[1]) begin
          _T_518 <= 3'h0;
        end else begin
          _T_518 <= 3'h2;
        end
      end else begin
        _T_518 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_522 <= 32'h0;
    end else if (io_dmi_reg_en) begin
      _T_522 <= dmi_reg_rdata_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_32) begin
    if (_T_32) begin
      _T_603 <= 4'h0;
    end else if (sb_state_en) begin
      if (_T_555) begin
        if (sbdata0_reg_wren0) begin
          _T_603 <= 4'h2;
        end else begin
          _T_603 <= 4'h1;
        end
      end else if (_T_566) begin
        if (_T_567) begin
          _T_603 <= 4'h9;
        end else begin
          _T_603 <= 4'h3;
        end
      end else if (_T_573) begin
        if (_T_567) begin
          _T_603 <= 4'h9;
        end else begin
          _T_603 <= 4'h4;
        end
      end else if (_T_580) begin
        _T_603 <= 4'h7;
      end else if (_T_582) begin
        if (_T_583) begin
          _T_603 <= 4'h8;
        end else if (sb_bus_cmd_write_data) begin
          _T_603 <= 4'h5;
        end else begin
          _T_603 <= 4'h6;
        end
      end else if (_T_588) begin
        _T_603 <= 4'h8;
      end else if (_T_590) begin
        _T_603 <= 4'h8;
      end else if (_T_592) begin
        _T_603 <= 4'h9;
      end else if (_T_595) begin
        _T_603 <= 4'h9;
      end else begin
        _T_603 <= 4'h0;
      end
    end
  end
endmodule
