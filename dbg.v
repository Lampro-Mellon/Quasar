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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 327:22]
  wire  _T_9 = dmcontrol_reg[0] | io_scan_mode; // @[dbg.scala 99:64]
  wire  dbg_dm_rst_l = io_dbg_rst_l & _T_9; // @[dbg.scala 99:44]
  wire  _T_11 = ~dmcontrol_reg[1]; // @[dbg.scala 100:25]
  wire  _T_13 = io_dmi_reg_addr == 7'h38; // @[dbg.scala 101:36]
  wire  _T_14 = _T_13 & io_dmi_reg_en; // @[dbg.scala 101:49]
  wire  _T_15 = _T_14 & io_dmi_reg_wr_en; // @[dbg.scala 101:65]
  wire  _T_16 = sb_state == 4'h0; // @[dbg.scala 101:96]
  wire  sbcs_wren = _T_15 & _T_16; // @[dbg.scala 101:84]
  wire  _T_18 = sbcs_wren & io_dmi_reg_wdata[22]; // @[dbg.scala 102:42]
  wire  _T_20 = _T_5 & io_dmi_reg_en; // @[dbg.scala 102:102]
  wire  _T_21 = io_dmi_reg_addr == 7'h39; // @[dbg.scala 103:23]
  wire  _T_22 = io_dmi_reg_addr == 7'h3c; // @[dbg.scala 103:55]
  wire  _T_23 = _T_21 | _T_22; // @[dbg.scala 103:36]
  wire  _T_24 = io_dmi_reg_addr == 7'h3d; // @[dbg.scala 103:87]
  wire  _T_25 = _T_23 | _T_24; // @[dbg.scala 103:68]
  wire  _T_26 = _T_20 & _T_25; // @[dbg.scala 102:118]
  wire  sbcs_sbbusyerror_wren = _T_18 | _T_26; // @[dbg.scala 102:66]
  wire  sbcs_sbbusyerror_din = ~_T_18; // @[dbg.scala 105:31]
  wire  _T_29 = ~dbg_dm_rst_l; // @[dbg.scala 106:54]
  wire  _T_30 = ~dbg_dm_rst_l; // @[dbg.scala 106:81]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire [19:0] _T_44 = {temp_sbcs_19_15,temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire [11:0] _T_48 = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20}; // @[Cat.scala 29:58]
  wire  _T_51 = sbcs_reg[19:17] == 3'h1; // @[dbg.scala 127:42]
  wire  _T_53 = _T_51 & sbaddress0_reg[0]; // @[dbg.scala 127:56]
  wire  _T_55 = sbcs_reg[19:17] == 3'h2; // @[dbg.scala 128:23]
  wire  _T_57 = |sbaddress0_reg[1:0]; // @[dbg.scala 128:60]
  wire  _T_58 = _T_55 & _T_57; // @[dbg.scala 128:37]
  wire  _T_59 = _T_53 | _T_58; // @[dbg.scala 127:76]
  wire  _T_61 = sbcs_reg[19:17] == 3'h3; // @[dbg.scala 129:23]
  wire  _T_63 = |sbaddress0_reg[2:0]; // @[dbg.scala 129:60]
  wire  _T_64 = _T_61 & _T_63; // @[dbg.scala 129:37]
  wire  sbcs_unaligned = _T_59 | _T_64; // @[dbg.scala 128:64]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[dbg.scala 131:35]
  wire  _T_66 = sbcs_reg[19:17] == 3'h0; // @[dbg.scala 132:51]
  wire [3:0] _T_68 = _T_66 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_69 = _T_68 & 4'h1; // @[dbg.scala 132:64]
  wire [3:0] _T_73 = _T_51 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_74 = _T_73 & 4'h2; // @[dbg.scala 132:117]
  wire [3:0] _T_75 = _T_69 | _T_74; // @[dbg.scala 132:76]
  wire [3:0] _T_79 = _T_55 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_80 = _T_79 & 4'h4; // @[dbg.scala 133:44]
  wire [3:0] _T_81 = _T_75 | _T_80; // @[dbg.scala 132:129]
  wire [3:0] _T_85 = _T_61 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_86 = _T_85 & 4'h8; // @[dbg.scala 133:97]
  wire [3:0] sbaddress0_incr = _T_81 | _T_86; // @[dbg.scala 133:56]
  wire  _T_87 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[dbg.scala 135:41]
  wire  sbdata0_reg_wren0 = _T_87 & _T_22; // @[dbg.scala 135:60]
  wire  _T_89 = sb_state == 4'h7; // @[dbg.scala 136:37]
  wire  _T_90 = _T_89 & sb_state_en; // @[dbg.scala 136:60]
  wire  _T_91 = ~sbcs_sberror_wren; // @[dbg.scala 136:76]
  wire  sbdata0_reg_wren1 = _T_90 & _T_91; // @[dbg.scala 136:74]
  wire  sbdata1_reg_wren0 = _T_87 & _T_24; // @[dbg.scala 138:60]
  wire [31:0] _T_98 = sbdata0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_99 = _T_98 & io_dmi_reg_wdata; // @[dbg.scala 141:49]
  wire [31:0] _T_101 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_103 = _T_101 & sb_bus_rdata[31:0]; // @[dbg.scala 142:33]
  wire [31:0] _T_105 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_106 = _T_105 & io_dmi_reg_wdata; // @[dbg.scala 144:49]
  wire [31:0] _T_110 = _T_101 & sb_bus_rdata[63:32]; // @[dbg.scala 145:33]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 352:23]
  reg [31:0] sbdata0_reg; // @[lib.scala 358:16]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 352:23]
  reg [31:0] sbdata1_reg; // @[lib.scala 358:16]
  wire  sbaddress0_reg_wren0 = _T_87 & _T_21; // @[dbg.scala 155:63]
  wire [31:0] _T_118 = sbaddress0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_119 = _T_118 & io_dmi_reg_wdata; // @[dbg.scala 157:59]
  wire [31:0] _T_121 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_122 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_124 = sbaddress0_reg + _T_122; // @[dbg.scala 158:54]
  wire [31:0] _T_125 = _T_121 & _T_124; // @[dbg.scala 158:36]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 352:23]
  reg [31:0] _T_128; // @[lib.scala 358:16]
  wire  sbreadonaddr_access = sbaddress0_reg_wren0 & sbcs_reg[20]; // @[dbg.scala 163:94]
  wire  _T_133 = ~io_dmi_reg_wr_en; // @[dbg.scala 164:45]
  wire  _T_134 = io_dmi_reg_en & _T_133; // @[dbg.scala 164:43]
  wire  _T_136 = _T_134 & _T_22; // @[dbg.scala 164:63]
  wire  sbreadondata_access = _T_136 & sbcs_reg[15]; // @[dbg.scala 164:95]
  wire  _T_140 = io_dmi_reg_addr == 7'h10; // @[dbg.scala 166:41]
  wire  _T_141 = _T_140 & io_dmi_reg_en; // @[dbg.scala 166:54]
  wire  dmcontrol_wren = _T_141 & io_dmi_reg_wr_en; // @[dbg.scala 166:70]
  wire [3:0] _T_148 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [27:0] _T_155 = {26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire [3:0] _T_157 = {dm_temp[3:2],1'h0,dm_temp[1]}; // @[Cat.scala 29:58]
  reg  dmcontrol_wren_Q; // @[dbg.scala 181:12]
  wire [1:0] _T_161 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_163 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_165 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_167 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_169 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_173 = {_T_167,_T_169,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire [19:0] _T_177 = {12'h0,_T_161,_T_163,2'h0,_T_165}; // @[Cat.scala 29:58]
  wire  _T_179 = dbg_state == 3'h6; // @[dbg.scala 186:44]
  wire  _T_180 = _T_179 & io_dec_tlu_resume_ack; // @[dbg.scala 186:66]
  wire  _T_182 = ~dmcontrol_reg[30]; // @[dbg.scala 186:113]
  wire  _T_183 = dmstatus_resumeack & _T_182; // @[dbg.scala 186:111]
  wire  dmstatus_resumeack_wren = _T_180 | _T_183; // @[dbg.scala 186:90]
  wire  _T_187 = _T_140 & io_dmi_reg_wdata[1]; // @[dbg.scala 188:63]
  wire  _T_188 = _T_187 & io_dmi_reg_en; // @[dbg.scala 188:85]
  wire  dmstatus_havereset_wren = _T_188 & io_dmi_reg_wr_en; // @[dbg.scala 188:101]
  wire  _T_191 = _T_140 & io_dmi_reg_wdata[28]; // @[dbg.scala 189:62]
  wire  _T_192 = _T_191 & io_dmi_reg_en; // @[dbg.scala 189:85]
  wire  dmstatus_havereset_rst = _T_192 & io_dmi_reg_wr_en; // @[dbg.scala 189:101]
  wire  _T_194 = ~reset; // @[dbg.scala 191:43]
  wire  _T_197 = dmstatus_unavail | dmstatus_halted; // @[dbg.scala 192:42]
  reg  _T_201; // @[Reg.scala 27:20]
  wire  _T_204 = ~io_dec_tlu_mpc_halted_only; // @[dbg.scala 198:37]
  reg  _T_206; // @[dbg.scala 198:12]
  wire  _T_209 = ~dmstatus_havereset_rst; // @[dbg.scala 202:15]
  reg  _T_210; // @[Reg.scala 27:20]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire [31:0] abstractcs_reg;
  wire  _T_212 = abstractcs_reg[12] & io_dmi_reg_en; // @[dbg.scala 208:50]
  wire  _T_213 = io_dmi_reg_addr == 7'h16; // @[dbg.scala 208:106]
  wire  _T_214 = io_dmi_reg_addr == 7'h17; // @[dbg.scala 208:138]
  wire  _T_215 = _T_213 | _T_214; // @[dbg.scala 208:119]
  wire  _T_216 = io_dmi_reg_wr_en & _T_215; // @[dbg.scala 208:86]
  wire  _T_217 = io_dmi_reg_addr == 7'h4; // @[dbg.scala 208:171]
  wire  _T_218 = _T_216 | _T_217; // @[dbg.scala 208:152]
  wire  abstractcs_error_sel0 = _T_212 & _T_218; // @[dbg.scala 208:66]
  wire  _T_221 = _T_87 & _T_214; // @[dbg.scala 209:64]
  wire  _T_223 = io_dmi_reg_wdata[31:24] == 8'h0; // @[dbg.scala 209:126]
  wire  _T_225 = io_dmi_reg_wdata[31:24] == 8'h2; // @[dbg.scala 209:163]
  wire  _T_226 = _T_223 | _T_225; // @[dbg.scala 209:135]
  wire  _T_227 = ~_T_226; // @[dbg.scala 209:98]
  wire  abstractcs_error_sel1 = _T_221 & _T_227; // @[dbg.scala 209:96]
  wire  abstractcs_error_sel2 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[dbg.scala 210:52]
  wire  _T_232 = ~dmstatus_reg[9]; // @[dbg.scala 211:98]
  wire  abstractcs_error_sel3 = _T_221 & _T_232; // @[dbg.scala 211:96]
  wire  _T_234 = _T_214 & io_dmi_reg_en; // @[dbg.scala 212:61]
  wire  _T_235 = _T_234 & io_dmi_reg_wr_en; // @[dbg.scala 212:77]
  wire  _T_237 = io_dmi_reg_wdata[22:20] != 3'h2; // @[dbg.scala 213:32]
  wire  _T_241 = |data1_reg[1:0]; // @[dbg.scala 213:106]
  wire  _T_242 = _T_225 & _T_241; // @[dbg.scala 213:87]
  wire  _T_243 = _T_237 | _T_242; // @[dbg.scala 213:46]
  wire  abstractcs_error_sel4 = _T_235 & _T_243; // @[dbg.scala 212:96]
  wire  _T_245 = _T_213 & io_dmi_reg_en; // @[dbg.scala 215:61]
  wire  abstractcs_error_sel5 = _T_245 & io_dmi_reg_wr_en; // @[dbg.scala 215:77]
  wire  _T_246 = abstractcs_error_sel0 | abstractcs_error_sel1; // @[dbg.scala 216:54]
  wire  _T_247 = _T_246 | abstractcs_error_sel2; // @[dbg.scala 216:78]
  wire  _T_248 = _T_247 | abstractcs_error_sel3; // @[dbg.scala 216:102]
  wire  _T_249 = _T_248 | abstractcs_error_sel4; // @[dbg.scala 216:126]
  wire  abstractcs_error_selor = _T_249 | abstractcs_error_sel5; // @[dbg.scala 216:150]
  wire [2:0] _T_251 = abstractcs_error_sel0 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_252 = _T_251 & 3'h1; // @[dbg.scala 217:62]
  wire [2:0] _T_254 = abstractcs_error_sel1 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_255 = _T_254 & 3'h2; // @[dbg.scala 218:37]
  wire [2:0] _T_256 = _T_252 | _T_255; // @[dbg.scala 217:74]
  wire [2:0] _T_258 = abstractcs_error_sel2 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_259 = _T_258 & 3'h3; // @[dbg.scala 219:37]
  wire [2:0] _T_260 = _T_256 | _T_259; // @[dbg.scala 218:49]
  wire [2:0] _T_262 = abstractcs_error_sel3 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_263 = _T_262 & 3'h4; // @[dbg.scala 220:37]
  wire [2:0] _T_264 = _T_260 | _T_263; // @[dbg.scala 219:49]
  wire [2:0] _T_266 = abstractcs_error_sel4 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_268 = _T_264 | _T_266; // @[dbg.scala 220:49]
  wire [2:0] _T_270 = abstractcs_error_sel5 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_272 = ~io_dmi_reg_wdata[10:8]; // @[dbg.scala 222:40]
  wire [2:0] _T_273 = _T_270 & _T_272; // @[dbg.scala 222:37]
  wire [2:0] _T_275 = _T_273 & abstractcs_reg[10:8]; // @[dbg.scala 222:75]
  wire [2:0] _T_276 = _T_268 | _T_275; // @[dbg.scala 221:49]
  wire  _T_277 = ~abstractcs_error_selor; // @[dbg.scala 223:15]
  wire [2:0] _T_279 = _T_277 ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_281 = _T_279 & abstractcs_reg[10:8]; // @[dbg.scala 223:50]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[dbg.scala 230:12]
  wire [10:0] _T_287 = {abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire [20:0] _T_289 = {19'h0,abs_temp_12,1'h0}; // @[Cat.scala 29:58]
  wire  _T_294 = dbg_state == 3'h2; // @[dbg.scala 235:100]
  wire  command_wren = _T_235 & _T_294; // @[dbg.scala 235:87]
  wire [31:0] command_din = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:20],3'h0,io_dmi_reg_wdata[16:0]}; // @[Cat.scala 29:58]
  reg [31:0] command_reg; // @[Reg.scala 27:20]
  wire  _T_305 = _T_87 & _T_217; // @[dbg.scala 241:58]
  wire  data0_reg_wren0 = _T_305 & _T_294; // @[dbg.scala 241:89]
  wire  _T_307 = dbg_state == 3'h4; // @[dbg.scala 242:59]
  wire  _T_308 = io_core_dbg_cmd_done & _T_307; // @[dbg.scala 242:46]
  wire  _T_310 = ~command_reg[16]; // @[dbg.scala 242:83]
  wire  data0_reg_wren1 = _T_308 & _T_310; // @[dbg.scala 242:81]
  wire  data0_reg_wren = data0_reg_wren0 | data0_reg_wren1; // @[dbg.scala 244:40]
  wire [31:0] _T_312 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_313 = _T_312 & io_dmi_reg_wdata; // @[dbg.scala 245:45]
  wire [31:0] _T_315 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_316 = _T_315 & io_core_dbg_rddata; // @[dbg.scala 245:92]
  wire [31:0] data0_din = _T_313 | _T_316; // @[dbg.scala 245:64]
  reg [31:0] data0_reg; // @[Reg.scala 27:20]
  wire  _T_320 = io_dmi_reg_addr == 7'h5; // @[dbg.scala 250:77]
  wire  _T_321 = _T_87 & _T_320; // @[dbg.scala 250:58]
  wire  data1_reg_wren = _T_321 & _T_294; // @[dbg.scala 250:89]
  wire [31:0] _T_324 = data1_reg_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 352:23]
  reg [31:0] _T_327; // @[lib.scala 358:16]
  wire [2:0] dbg_nxtstate;
  wire  _T_328 = 3'h0 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_330 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[dbg.scala 265:43]
  wire [2:0] _T_331 = _T_330 ? 3'h2 : 3'h1; // @[dbg.scala 265:26]
  wire  _T_333 = ~io_dec_tlu_debug_mode; // @[dbg.scala 266:45]
  wire  _T_334 = dmcontrol_reg[31] & _T_333; // @[dbg.scala 266:43]
  wire  _T_336 = _T_334 | dmstatus_reg[9]; // @[dbg.scala 266:69]
  wire  _T_337 = _T_336 | io_dec_tlu_mpc_halted_only; // @[dbg.scala 266:87]
  wire  _T_340 = _T_337 & _T_11; // @[dbg.scala 266:117]
  wire  _T_344 = dmcontrol_reg[31] & _T_11; // @[dbg.scala 267:45]
  wire  _T_346 = 3'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_348 = dmcontrol_reg[1] ? 3'h0 : 3'h2; // @[dbg.scala 270:26]
  wire  _T_351 = dmstatus_reg[9] | dmcontrol_reg[1]; // @[dbg.scala 271:39]
  wire  _T_353 = dmcontrol_wren_Q & dmcontrol_reg[31]; // @[dbg.scala 272:44]
  wire  _T_356 = _T_353 & _T_11; // @[dbg.scala 272:64]
  wire  _T_358 = 3'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_362 = dmstatus_reg[9] & _T_11; // @[dbg.scala 275:43]
  wire  _T_365 = ~dmcontrol_reg[3]; // @[dbg.scala 276:33]
  wire  _T_366 = dmcontrol_reg[30] & _T_365; // @[dbg.scala 276:31]
  wire [2:0] _T_367 = _T_366 ? 3'h6 : 3'h3; // @[dbg.scala 276:12]
  wire [2:0] _T_369 = dmcontrol_reg[31] ? 3'h1 : 3'h0; // @[dbg.scala 277:12]
  wire [2:0] _T_370 = _T_362 ? _T_367 : _T_369; // @[dbg.scala 275:26]
  wire  _T_373 = dmstatus_reg[9] & dmcontrol_reg[30]; // @[dbg.scala 278:39]
  wire  _T_375 = ~dmcontrol_reg[31]; // @[dbg.scala 278:61]
  wire  _T_376 = _T_373 & _T_375; // @[dbg.scala 278:59]
  wire  _T_377 = _T_376 & dmcontrol_wren_Q; // @[dbg.scala 278:80]
  wire  _T_378 = _T_377 | command_wren; // @[dbg.scala 278:99]
  wire  _T_380 = _T_378 | dmcontrol_reg[1]; // @[dbg.scala 278:114]
  wire  _T_383 = ~_T_330; // @[dbg.scala 279:28]
  wire  _T_384 = _T_380 | _T_383; // @[dbg.scala 279:26]
  wire  _T_385 = dbg_nxtstate == 3'h3; // @[dbg.scala 280:60]
  wire  _T_386 = dbg_state_en & _T_385; // @[dbg.scala 280:44]
  wire  _T_387 = dbg_nxtstate == 3'h6; // @[dbg.scala 282:58]
  wire  _T_388 = dbg_state_en & _T_387; // @[dbg.scala 282:42]
  wire  _T_396 = 3'h3 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_399 = |abstractcs_reg[10:8]; // @[dbg.scala 286:85]
  wire [2:0] _T_400 = _T_399 ? 3'h5 : 3'h4; // @[dbg.scala 286:62]
  wire [2:0] _T_401 = dmcontrol_reg[1] ? 3'h0 : _T_400; // @[dbg.scala 286:26]
  wire  _T_404 = io_dbg_dec_dbg_ib_dbg_cmd_valid | _T_399; // @[dbg.scala 287:55]
  wire  _T_406 = _T_404 | dmcontrol_reg[1]; // @[dbg.scala 287:83]
  wire  _T_413 = 3'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_415 = dmcontrol_reg[1] ? 3'h0 : 3'h5; // @[dbg.scala 291:26]
  wire  _T_417 = io_core_dbg_cmd_done | dmcontrol_reg[1]; // @[dbg.scala 292:44]
  wire  _T_424 = 3'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_433 = 3'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_436 = dmstatus_reg[17] | dmcontrol_reg[1]; // @[dbg.scala 304:40]
  wire  _GEN_13 = _T_433 & _T_436; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_433 & _T_356; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_15 = _T_424 ? _T_348 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_424 | _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_424 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_424 ? _T_356 : _GEN_14; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_20 = _T_413 ? _T_415 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_413 ? _T_417 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_413 ? _T_356 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_413 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_25 = _T_396 ? _T_401 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_396 ? _T_406 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_396 ? _T_356 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_396 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_30 = _T_358 ? _T_370 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_358 ? _T_384 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_358 ? _T_386 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_358 & _T_388; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_358 ? _T_356 : _GEN_27; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_36 = _T_346 ? _T_348 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_346 ? _T_351 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_346 ? _T_356 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_346 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_346 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [31:0] _T_445 = _T_217 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_446 = _T_445 & data0_reg; // @[dbg.scala 308:71]
  wire [31:0] _T_449 = _T_320 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_450 = _T_449 & data1_reg; // @[dbg.scala 308:122]
  wire [31:0] _T_451 = _T_446 | _T_450; // @[dbg.scala 308:83]
  wire [31:0] _T_454 = _T_140 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_455 = _T_454 & dmcontrol_reg; // @[dbg.scala 309:43]
  wire [31:0] _T_456 = _T_451 | _T_455; // @[dbg.scala 308:134]
  wire  _T_457 = io_dmi_reg_addr == 7'h11; // @[dbg.scala 309:86]
  wire [31:0] _T_459 = _T_457 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_460 = _T_459 & dmstatus_reg; // @[dbg.scala 309:99]
  wire [31:0] _T_461 = _T_456 | _T_460; // @[dbg.scala 309:59]
  wire [31:0] _T_464 = _T_213 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_465 = _T_464 & abstractcs_reg; // @[dbg.scala 310:43]
  wire [31:0] _T_466 = _T_461 | _T_465; // @[dbg.scala 309:114]
  wire [31:0] _T_469 = _T_214 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_470 = _T_469 & command_reg; // @[dbg.scala 310:100]
  wire [31:0] _T_471 = _T_466 | _T_470; // @[dbg.scala 310:60]
  wire  _T_472 = io_dmi_reg_addr == 7'h40; // @[dbg.scala 311:30]
  wire [31:0] _T_474 = _T_472 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_475 = _T_474 & haltsum0_reg; // @[dbg.scala 311:43]
  wire [31:0] _T_476 = _T_471 | _T_475; // @[dbg.scala 310:114]
  wire [31:0] _T_479 = _T_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_480 = _T_479 & sbcs_reg; // @[dbg.scala 311:98]
  wire [31:0] _T_481 = _T_476 | _T_480; // @[dbg.scala 311:58]
  wire [31:0] _T_484 = _T_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_485 = _T_484 & sbaddress0_reg; // @[dbg.scala 312:43]
  wire [31:0] _T_486 = _T_481 | _T_485; // @[dbg.scala 311:109]
  wire [31:0] _T_489 = _T_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_490 = _T_489 & sbdata0_reg; // @[dbg.scala 312:100]
  wire [31:0] _T_491 = _T_486 | _T_490; // @[dbg.scala 312:60]
  wire [31:0] _T_494 = _T_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_495 = _T_494 & sbdata1_reg; // @[dbg.scala 313:43]
  wire [31:0] dmi_reg_rdata_din = _T_491 | _T_495; // @[dbg.scala 312:114]
  wire  _T_498 = _T_29 & reset; // @[dbg.scala 315:87]
  reg [2:0] _T_499; // @[Reg.scala 27:20]
  reg [31:0] _T_502; // @[Reg.scala 27:20]
  wire  _T_504 = command_reg[31:24] == 8'h2; // @[dbg.scala 324:62]
  wire [30:0] _T_506 = {data1_reg[31:2],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_508 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_511 = dbg_state == 3'h3; // @[dbg.scala 326:50]
  wire  _T_514 = ~_T_399; // @[dbg.scala 326:75]
  wire  _T_515 = _T_511 & _T_514; // @[dbg.scala 326:73]
  wire  _T_523 = command_reg[15:12] == 4'h0; // @[dbg.scala 328:117]
  wire [1:0] _T_524 = {1'h0,_T_523}; // @[Cat.scala 29:58]
  wire  _T_535 = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_537 = sbdata0_reg_wren0 | sbreadondata_access; // @[dbg.scala 343:39]
  wire  _T_538 = _T_537 | sbreadonaddr_access; // @[dbg.scala 343:61]
  wire  _T_540 = |io_dmi_reg_wdata[14:12]; // @[dbg.scala 346:65]
  wire  _T_541 = sbcs_wren & _T_540; // @[dbg.scala 346:38]
  wire  _T_543 = io_dmi_reg_wdata[14:12] == 3'h0; // @[dbg.scala 347:27]
  wire [2:0] _GEN_118 = {{2'd0}, _T_543}; // @[dbg.scala 347:53]
  wire [2:0] _T_545 = _GEN_118 & sbcs_reg[14:12]; // @[dbg.scala 347:53]
  wire  _T_546 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_547 = sbcs_unaligned | sbcs_illegal_size; // @[dbg.scala 350:41]
  wire  _T_549 = io_dbg_bus_clk_en | sbcs_unaligned; // @[dbg.scala 351:40]
  wire  _T_550 = _T_549 | sbcs_illegal_size; // @[dbg.scala 351:57]
  wire  _T_553 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_560 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_561 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[dbg.scala 363:38]
  wire  _T_562 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_563 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[dbg.scala 366:48]
  wire  _T_566 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[dbg.scala 367:45]
  wire  _T_567 = _T_566 & io_dbg_bus_clk_en; // @[dbg.scala 367:70]
  wire  _T_568 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_569 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[dbg.scala 371:44]
  wire  _T_570 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_571 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[dbg.scala 375:44]
  wire  _T_572 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_573 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[dbg.scala 379:38]
  wire  _T_574 = sb_state_en & sb_bus_rsp_error; // @[dbg.scala 380:40]
  wire  _T_575 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_576 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[dbg.scala 385:39]
  wire  _T_578 = 4'h9 == sb_state; // @[Conditional.scala 37:30]
  wire  _GEN_53 = _T_578 & sbcs_reg[16]; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_575 ? _T_576 : _T_578; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_575 & _T_574; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_575 ? 1'h0 : _T_578; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_575 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_572 ? _T_573 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_572 ? _T_574 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_572 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_572 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_570 ? _T_571 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_570 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_570 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_570 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_568 ? _T_569 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_568 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_568 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_568 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_562 ? _T_567 : _GEN_76; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_562 ? 1'h0 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_562 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_562 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_90 = _T_560 ? _T_561 : _GEN_83; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_560 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_560 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_560 ? 1'h0 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_553 ? _T_550 : _GEN_90; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_553 ? _T_547 : _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_100 = _T_553 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_102 = _T_553 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_104 = _T_546 ? _T_550 : _GEN_97; // @[Conditional.scala 39:67]
  wire  _GEN_105 = _T_546 ? _T_547 : _GEN_98; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_546 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67]
  wire  _GEN_109 = _T_546 ? 1'h0 : _GEN_102; // @[Conditional.scala 39:67]
  reg [3:0] _T_582; // @[Reg.scala 27:20]
  wire  _T_589 = |io_sb_axi_r_bits_resp; // @[dbg.scala 406:69]
  wire  _T_590 = sb_bus_rsp_read & _T_589; // @[dbg.scala 406:39]
  wire  _T_592 = |io_sb_axi_b_bits_resp; // @[dbg.scala 406:122]
  wire  _T_593 = sb_bus_rsp_write & _T_592; // @[dbg.scala 406:92]
  wire  _T_595 = sb_state == 4'h4; // @[dbg.scala 407:36]
  wire  _T_596 = sb_state == 4'h5; // @[dbg.scala 407:71]
  wire  _T_602 = sb_state == 4'h6; // @[dbg.scala 418:70]
  wire [63:0] _T_608 = _T_66 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_612 = {sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0],sbdata0_reg[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_613 = _T_608 & _T_612; // @[dbg.scala 419:65]
  wire [63:0] _T_617 = _T_51 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_620 = {sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0],sbdata0_reg[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_621 = _T_617 & _T_620; // @[dbg.scala 419:138]
  wire [63:0] _T_622 = _T_613 | _T_621; // @[dbg.scala 419:96]
  wire [63:0] _T_626 = _T_55 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_628 = {sbdata0_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_629 = _T_626 & _T_628; // @[dbg.scala 420:45]
  wire [63:0] _T_630 = _T_622 | _T_629; // @[dbg.scala 419:168]
  wire [63:0] _T_634 = _T_61 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_637 = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire [63:0] _T_638 = _T_634 & _T_637; // @[dbg.scala 420:119]
  wire [7:0] _T_643 = _T_66 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_645 = 15'h1 << sbaddress0_reg[2:0]; // @[dbg.scala 422:82]
  wire [14:0] _GEN_119 = {{7'd0}, _T_643}; // @[dbg.scala 422:67]
  wire [14:0] _T_646 = _GEN_119 & _T_645; // @[dbg.scala 422:67]
  wire [7:0] _T_650 = _T_51 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_652 = {sbaddress0_reg[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_653 = 15'h3 << _T_652; // @[dbg.scala 423:59]
  wire [14:0] _GEN_120 = {{7'd0}, _T_650}; // @[dbg.scala 423:44]
  wire [14:0] _T_654 = _GEN_120 & _T_653; // @[dbg.scala 423:44]
  wire [14:0] _T_655 = _T_646 | _T_654; // @[dbg.scala 422:107]
  wire [7:0] _T_659 = _T_55 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_661 = {sbaddress0_reg[2],1'h0}; // @[Cat.scala 29:58]
  wire [10:0] _T_662 = 11'hf << _T_661; // @[dbg.scala 424:59]
  wire [10:0] _GEN_121 = {{3'd0}, _T_659}; // @[dbg.scala 424:44]
  wire [10:0] _T_663 = _GEN_121 & _T_662; // @[dbg.scala 424:44]
  wire [14:0] _GEN_122 = {{4'd0}, _T_663}; // @[dbg.scala 423:97]
  wire [14:0] _T_664 = _T_655 | _GEN_122; // @[dbg.scala 423:97]
  wire [7:0] _T_668 = _T_61 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_123 = {{7'd0}, _T_668}; // @[dbg.scala 424:95]
  wire [14:0] _T_670 = _T_664 | _GEN_123; // @[dbg.scala 424:95]
  wire [3:0] _GEN_124 = {{1'd0}, sbaddress0_reg[2:0]}; // @[dbg.scala 441:99]
  wire [6:0] _T_681 = 4'h8 * _GEN_124; // @[dbg.scala 441:99]
  wire [63:0] _T_682 = io_sb_axi_r_bits_data >> _T_681; // @[dbg.scala 441:92]
  wire [63:0] _T_683 = _T_682 & 64'hff; // @[dbg.scala 441:123]
  wire [63:0] _T_684 = _T_608 & _T_683; // @[dbg.scala 441:59]
  wire [4:0] _GEN_125 = {{3'd0}, sbaddress0_reg[2:1]}; // @[dbg.scala 442:86]
  wire [6:0] _T_691 = 5'h10 * _GEN_125; // @[dbg.scala 442:86]
  wire [63:0] _T_692 = io_sb_axi_r_bits_data >> _T_691; // @[dbg.scala 442:78]
  wire [63:0] _T_693 = _T_692 & 64'hffff; // @[dbg.scala 442:110]
  wire [63:0] _T_694 = _T_617 & _T_693; // @[dbg.scala 442:45]
  wire [63:0] _T_695 = _T_684 | _T_694; // @[dbg.scala 441:140]
  wire [5:0] _GEN_126 = {{5'd0}, sbaddress0_reg[2]}; // @[dbg.scala 443:86]
  wire [6:0] _T_702 = 6'h20 * _GEN_126; // @[dbg.scala 443:86]
  wire [63:0] _T_703 = io_sb_axi_r_bits_data >> _T_702; // @[dbg.scala 443:78]
  wire [63:0] _T_704 = _T_703 & 64'hffffffff; // @[dbg.scala 443:107]
  wire [63:0] _T_705 = _T_626 & _T_704; // @[dbg.scala 443:45]
  wire [63:0] _T_706 = _T_695 | _T_705; // @[dbg.scala 442:129]
  wire [63:0] _T_712 = _T_634 & io_sb_axi_r_bits_data; // @[dbg.scala 444:45]
  rvclkhdr rvclkhdr ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 327:22]
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
  assign io_dbg_cmd_size = command_reg[21:20]; // @[dbg.scala 329:19]
  assign io_dbg_core_rst_l = ~dmcontrol_reg[1]; // @[dbg.scala 100:21]
  assign io_dbg_halt_req = _T_328 ? _T_344 : _GEN_38; // @[dbg.scala 261:19 dbg.scala 267:23 dbg.scala 272:23 dbg.scala 283:23 dbg.scala 288:23 dbg.scala 293:23 dbg.scala 300:23 dbg.scala 305:23]
  assign io_dbg_resume_req = _T_328 ? 1'h0 : _GEN_41; // @[dbg.scala 262:21 dbg.scala 282:25]
  assign io_dmi_reg_rdata = _T_502; // @[dbg.scala 320:20]
  assign io_sb_axi_aw_valid = _T_595 | _T_596; // @[dbg.scala 407:22]
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
  assign io_sb_axi_w_valid = _T_595 | _T_602; // @[dbg.scala 418:21]
  assign io_sb_axi_w_bits_data = _T_630 | _T_638; // @[dbg.scala 419:25]
  assign io_sb_axi_w_bits_strb = _T_670[7:0]; // @[dbg.scala 422:25]
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
  assign io_dbg_dec_dbg_ib_dbg_cmd_valid = _T_515 & io_dbg_dma_io_dma_dbg_ready; // @[dbg.scala 326:35]
  assign io_dbg_dec_dbg_ib_dbg_cmd_write = command_reg[16]; // @[dbg.scala 327:35]
  assign io_dbg_dec_dbg_ib_dbg_cmd_type = _T_504 ? 2'h2 : _T_524; // @[dbg.scala 328:34]
  assign io_dbg_dec_dbg_ib_dbg_cmd_addr = _T_504 ? {{1'd0}, _T_506} : _T_508; // @[dbg.scala 324:34]
  assign io_dbg_dec_dbg_dctl_dbg_cmd_wrdata = data0_reg; // @[dbg.scala 325:38]
  assign io_dbg_dma_dbg_ib_dbg_cmd_valid = io_dbg_dec_dbg_ib_dbg_cmd_valid; // @[dbg.scala 449:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_write = io_dbg_dec_dbg_ib_dbg_cmd_write; // @[dbg.scala 450:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_type = io_dbg_dec_dbg_ib_dbg_cmd_type; // @[dbg.scala 451:39]
  assign io_dbg_dma_dbg_ib_dbg_cmd_addr = io_dbg_dec_dbg_ib_dbg_cmd_addr; // @[dbg.scala 447:39]
  assign io_dbg_dma_dbg_dctl_dbg_cmd_wrdata = io_dbg_dec_dbg_dctl_dbg_cmd_wrdata; // @[dbg.scala 448:39]
  assign io_dbg_dma_io_dbg_dma_bubble = _T_515 | _T_307; // @[dbg.scala 330:32]
  assign dbg_state = _T_499; // @[dbg.scala 315:13]
  assign dbg_state_en = _T_328 ? _T_340 : _GEN_37; // @[dbg.scala 258:16 dbg.scala 266:20 dbg.scala 271:20 dbg.scala 278:20 dbg.scala 287:20 dbg.scala 292:20 dbg.scala 297:20 dbg.scala 304:20]
  assign sb_state = _T_582; // @[dbg.scala 397:12]
  assign sb_state_en = _T_535 ? _T_538 : _GEN_104; // @[dbg.scala 343:19 dbg.scala 351:19 dbg.scala 357:19 dbg.scala 363:19 dbg.scala 367:19 dbg.scala 371:19 dbg.scala 375:19 dbg.scala 379:19 dbg.scala 385:19 dbg.scala 391:19]
  assign dmcontrol_reg = {_T_157,_T_155}; // @[dbg.scala 178:17]
  assign sbaddress0_reg = _T_128; // @[dbg.scala 159:18]
  assign sbcs_sbbusy_wren = _T_535 ? sb_state_en : _GEN_107; // @[dbg.scala 335:20 dbg.scala 344:24 dbg.scala 392:24]
  assign sbcs_sberror_wren = _T_535 ? _T_541 : _GEN_105; // @[dbg.scala 337:21 dbg.scala 346:25 dbg.scala 352:25 dbg.scala 358:25 dbg.scala 380:25 dbg.scala 386:25]
  assign sb_bus_rdata = _T_706 | _T_712; // @[dbg.scala 441:16]
  assign sbaddress0_reg_wren1 = _T_535 ? 1'h0 : _GEN_109; // @[dbg.scala 339:24 dbg.scala 394:28]
  assign dmstatus_reg = {_T_177,_T_173}; // @[dbg.scala 184:16]
  assign dmstatus_havereset = _T_210; // @[dbg.scala 201:22]
  assign dmstatus_resumeack = _T_201; // @[dbg.scala 193:22]
  assign dmstatus_unavail = dmcontrol_reg[1] | _T_194; // @[dbg.scala 191:20]
  assign dmstatus_running = ~_T_197; // @[dbg.scala 192:20]
  assign dmstatus_halted = _T_206; // @[dbg.scala 197:19]
  assign abstractcs_busy_wren = _T_328 ? 1'h0 : _GEN_39; // @[dbg.scala 259:24 dbg.scala 280:28 dbg.scala 298:28]
  assign sb_bus_cmd_read = io_sb_axi_ar_valid & io_sb_axi_ar_ready; // @[dbg.scala 401:19]
  assign sb_bus_cmd_write_addr = io_sb_axi_aw_valid & io_sb_axi_aw_ready; // @[dbg.scala 402:25]
  assign sb_bus_cmd_write_data = io_sb_axi_w_valid & io_sb_axi_w_ready; // @[dbg.scala 403:25]
  assign sb_bus_rsp_read = io_sb_axi_r_valid & io_sb_axi_r_ready; // @[dbg.scala 404:19]
  assign sb_bus_rsp_error = _T_590 | _T_593; // @[dbg.scala 406:20]
  assign sb_bus_rsp_write = io_sb_axi_b_valid & io_sb_axi_b_ready; // @[dbg.scala 405:20]
  assign sbcs_sbbusy_din = 4'h0 == sb_state; // @[dbg.scala 336:19 dbg.scala 345:23 dbg.scala 393:23]
  assign data1_reg = _T_327; // @[dbg.scala 252:13]
  assign sbcs_reg = {_T_48,_T_44}; // @[dbg.scala 125:12]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_io_en = _T_3 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_1_io_en = _T_6 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_2_io_en = sbdata0_reg_wren0 | sbdata0_reg_wren1; // @[lib.scala 355:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_3_io_en = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[lib.scala 355:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_4_io_en = sbaddress0_reg_wren0 | sbaddress0_reg_wren1; // @[lib.scala 355:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign abstractcs_reg = {_T_289,_T_287}; // @[dbg.scala 233:18]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_5_io_en = _T_321 & _T_294; // @[lib.scala 355:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign dbg_nxtstate = _T_328 ? _T_331 : _GEN_36; // @[dbg.scala 257:16 dbg.scala 265:20 dbg.scala 270:20 dbg.scala 275:20 dbg.scala 286:20 dbg.scala 291:20 dbg.scala 296:20 dbg.scala 303:20]
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
  _T_128 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  dm_temp = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  dm_temp_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  dmcontrol_wren_Q = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_201 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_206 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_210 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  abs_temp_12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  abs_temp_10_8 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  command_reg = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  data0_reg = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  _T_327 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  _T_499 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  _T_502 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  _T_582 = _RAND_21[3:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_30) begin
    temp_sbcs_22 = 1'h0;
  end
  if (_T_30) begin
    temp_sbcs_21 = 1'h0;
  end
  if (_T_30) begin
    temp_sbcs_20 = 1'h0;
  end
  if (_T_30) begin
    temp_sbcs_19_15 = 5'h0;
  end
  if (_T_30) begin
    temp_sbcs_14_12 = 3'h0;
  end
  if (_T_30) begin
    sbdata0_reg = 32'h0;
  end
  if (_T_30) begin
    sbdata1_reg = 32'h0;
  end
  if (_T_30) begin
    _T_128 = 32'h0;
  end
  if (_T_30) begin
    dm_temp = 4'h0;
  end
  if (io_dbg_rst_l) begin
    dm_temp_0 = 1'h0;
  end
  if (_T_30) begin
    dmcontrol_wren_Q = 1'h0;
  end
  if (_T_30) begin
    _T_201 = 1'h0;
  end
  if (_T_30) begin
    _T_206 = 1'h0;
  end
  if (_T_30) begin
    _T_210 = 1'h0;
  end
  if (_T_30) begin
    abs_temp_12 = 1'h0;
  end
  if (_T_30) begin
    abs_temp_10_8 = 3'h0;
  end
  if (_T_30) begin
    command_reg = 32'h0;
  end
  if (_T_30) begin
    data0_reg = 32'h0;
  end
  if (_T_30) begin
    _T_327 = 32'h0;
  end
  if (_T_498) begin
    _T_499 = 3'h0;
  end
  if (_T_30) begin
    _T_502 = 32'h0;
  end
  if (_T_30) begin
    _T_582 = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      temp_sbcs_22 <= 1'h0;
    end else if (sbcs_sbbusyerror_wren) begin
      temp_sbcs_22 <= sbcs_sbbusyerror_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      temp_sbcs_21 <= 1'h0;
    end else if (sbcs_sbbusy_wren) begin
      temp_sbcs_21 <= sbcs_sbbusy_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      temp_sbcs_20 <= 1'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_20 <= io_dmi_reg_wdata[20];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      temp_sbcs_19_15 <= 5'h0;
    end else if (sbcs_wren) begin
      temp_sbcs_19_15 <= io_dmi_reg_wdata[19:15];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      temp_sbcs_14_12 <= 3'h0;
    end else if (sbcs_sberror_wren) begin
      if (_T_535) begin
        temp_sbcs_14_12 <= _T_545;
      end else if (_T_546) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_553) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_560) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_562) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_568) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_570) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_572) begin
        temp_sbcs_14_12 <= 3'h2;
      end else if (_T_575) begin
        temp_sbcs_14_12 <= 3'h2;
      end else begin
        temp_sbcs_14_12 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      sbdata0_reg <= 32'h0;
    end else begin
      sbdata0_reg <= _T_99 | _T_103;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      sbdata1_reg <= 32'h0;
    end else begin
      sbdata1_reg <= _T_106 | _T_110;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_128 <= 32'h0;
    end else begin
      _T_128 <= _T_119 | _T_125;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      dm_temp <= 4'h0;
    end else if (dmcontrol_wren) begin
      dm_temp <= _T_148;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge io_dbg_rst_l) begin
    if (io_dbg_rst_l) begin
      dm_temp_0 <= 1'h0;
    end else if (dmcontrol_wren) begin
      dm_temp_0 <= io_dmi_reg_wdata[0];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      dmcontrol_wren_Q <= 1'h0;
    end else begin
      dmcontrol_wren_Q <= _T_141 & io_dmi_reg_wr_en;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_201 <= 1'h0;
    end else if (dmstatus_resumeack_wren) begin
      _T_201 <= _T_180;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_206 <= 1'h0;
    end else begin
      _T_206 <= io_dec_tlu_dbg_halted & _T_204;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_210 <= 1'h0;
    end else if (dmstatus_havereset_wren) begin
      _T_210 <= _T_209;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      abs_temp_12 <= 1'h0;
    end else if (abstractcs_busy_wren) begin
      if (_T_328) begin
        abs_temp_12 <= 1'h0;
      end else if (_T_346) begin
        abs_temp_12 <= 1'h0;
      end else begin
        abs_temp_12 <= _T_358;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      abs_temp_10_8 <= 3'h0;
    end else begin
      abs_temp_10_8 <= _T_276 | _T_281;
    end
  end
  always @(posedge clock or posedge _T_30) begin
    if (_T_30) begin
      command_reg <= 32'h0;
    end else if (command_wren) begin
      command_reg <= command_din;
    end
  end
  always @(posedge clock or posedge _T_30) begin
    if (_T_30) begin
      data0_reg <= 32'h0;
    end else if (data0_reg_wren) begin
      data0_reg <= data0_din;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_327 <= 32'h0;
    end else begin
      _T_327 <= _T_324 & io_dmi_reg_wdata;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_498) begin
    if (_T_498) begin
      _T_499 <= 3'h0;
    end else if (dbg_state_en) begin
      if (_T_328) begin
        if (_T_330) begin
          _T_499 <= 3'h2;
        end else begin
          _T_499 <= 3'h1;
        end
      end else if (_T_346) begin
        if (dmcontrol_reg[1]) begin
          _T_499 <= 3'h0;
        end else begin
          _T_499 <= 3'h2;
        end
      end else if (_T_358) begin
        if (_T_362) begin
          if (_T_366) begin
            _T_499 <= 3'h6;
          end else begin
            _T_499 <= 3'h3;
          end
        end else if (dmcontrol_reg[31]) begin
          _T_499 <= 3'h1;
        end else begin
          _T_499 <= 3'h0;
        end
      end else if (_T_396) begin
        if (dmcontrol_reg[1]) begin
          _T_499 <= 3'h0;
        end else if (_T_399) begin
          _T_499 <= 3'h5;
        end else begin
          _T_499 <= 3'h4;
        end
      end else if (_T_413) begin
        if (dmcontrol_reg[1]) begin
          _T_499 <= 3'h0;
        end else begin
          _T_499 <= 3'h5;
        end
      end else if (_T_424) begin
        if (dmcontrol_reg[1]) begin
          _T_499 <= 3'h0;
        end else begin
          _T_499 <= 3'h2;
        end
      end else begin
        _T_499 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_502 <= 32'h0;
    end else if (io_dmi_reg_en) begin
      _T_502 <= dmi_reg_rdata_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge _T_30) begin
    if (_T_30) begin
      _T_582 <= 4'h0;
    end else if (sb_state_en) begin
      if (_T_535) begin
        if (sbdata0_reg_wren0) begin
          _T_582 <= 4'h2;
        end else begin
          _T_582 <= 4'h1;
        end
      end else if (_T_546) begin
        if (_T_547) begin
          _T_582 <= 4'h9;
        end else begin
          _T_582 <= 4'h3;
        end
      end else if (_T_553) begin
        if (_T_547) begin
          _T_582 <= 4'h9;
        end else begin
          _T_582 <= 4'h4;
        end
      end else if (_T_560) begin
        _T_582 <= 4'h7;
      end else if (_T_562) begin
        if (_T_563) begin
          _T_582 <= 4'h8;
        end else if (sb_bus_cmd_write_data) begin
          _T_582 <= 4'h5;
        end else begin
          _T_582 <= 4'h6;
        end
      end else if (_T_568) begin
        _T_582 <= 4'h8;
      end else if (_T_570) begin
        _T_582 <= 4'h8;
      end else if (_T_572) begin
        _T_582 <= 4'h9;
      end else if (_T_575) begin
        _T_582 <= 4'h9;
      end else begin
        _T_582 <= 4'h0;
      end
    end
  end
endmodule
