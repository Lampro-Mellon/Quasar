module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en
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
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
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
  output        io_dbg_dec_dma_dbg_ib_dbg_cmd_valid,
  output        io_dbg_dec_dma_dbg_ib_dbg_cmd_write,
  output [1:0]  io_dbg_dec_dma_dbg_ib_dbg_cmd_type,
  output [31:0] io_dbg_dec_dma_dbg_ib_dbg_cmd_addr,
  output [31:0] io_dbg_dec_dma_dbg_dctl_dbg_cmd_wrdata,
  output        io_dbg_dma_dbg_dma_bubble,
  input         io_dbg_dma_dma_dbg_ready,
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
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] dbg_state;
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
  wire  dmstatus_haveresetn;
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
  wire [31:0] abmem_addr;
  wire [31:0] sbcs_reg;
  wire  execute_command;
  wire [31:0] command_reg;
  wire  dbg_sb_bus_error;
  wire  command_wren;
  wire [31:0] command_din;
  wire [31:0] dbg_cmd_next_addr;
  wire  data0_reg_wren2;
  wire  sb_abmem_cmd_done_en;
  wire  sb_abmem_data_done_en;
  wire  abmem_addr_external;
  wire  sb_cmd_pending;
  wire  sb_abmem_cmd_write;
  wire  abmem_addr_in_dccm_region;
  wire  abmem_addr_in_iccm_region;
  wire  abmem_addr_in_pic_region;
  wire [3:0] sb_abmem_cmd_size;
  wire  dmcontrol_wren_Q;
  wire [31:0] abstractcs_reg;
  wire  _T = io_dmi_reg_en | execute_command; // @[dbg.scala 114:39]
  wire  _T_1 = dbg_state != 4'h0; // @[dbg.scala 114:70]
  wire  _T_2 = _T | _T_1; // @[dbg.scala 114:57]
  wire  _T_3 = _T_2 | dbg_state_en; // @[dbg.scala 114:88]
  wire  _T_4 = _T_3 | io_dec_tlu_dbg_halted; // @[dbg.scala 114:103]
  wire  _T_5 = _T_4 | io_dec_tlu_mpc_halted_only; // @[dbg.scala 114:127]
  wire  _T_6 = _T_5 | io_dec_tlu_debug_mode; // @[dbg.scala 115:32]
  wire  _T_7 = _T_6 | io_dbg_halt_req; // @[dbg.scala 115:56]
  wire  _T_9 = _T | sb_state_en; // @[dbg.scala 116:57]
  wire  _T_10 = sb_state != 4'h0; // @[dbg.scala 116:83]
  wire  _T_11 = _T_9 | _T_10; // @[dbg.scala 116:71]
  wire  rvclkhdr_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_en; // @[lib.scala 343:22]
  wire  _T_14 = dmcontrol_reg[0] | io_scan_mode; // @[dbg.scala 121:74]
  wire  dbg_dm_rst_l = io_dbg_rst_l & _T_14; // @[dbg.scala 121:103]
  wire  _T_17 = ~dmcontrol_reg[1]; // @[dbg.scala 122:32]
  wire  _T_20 = io_dmi_reg_addr == 7'h38; // @[dbg.scala 123:48]
  wire  _T_21 = _T_20 & io_dmi_reg_en; // @[dbg.scala 123:66]
  wire  _T_22 = _T_21 & io_dmi_reg_wr_en; // @[dbg.scala 123:82]
  wire  _T_23 = sb_state == 4'h0; // @[dbg.scala 123:113]
  wire  sbcs_wren = _T_22 & _T_23; // @[dbg.scala 123:101]
  wire  _T_25 = sbcs_wren & io_dmi_reg_wdata[22]; // @[dbg.scala 124:42]
  wire  _T_27 = sbcs_reg[21] & io_dmi_reg_en; // @[dbg.scala 124:82]
  wire  _T_28 = io_dmi_reg_addr == 7'h39; // @[dbg.scala 125:22]
  wire  _T_29 = io_dmi_reg_wr_en & _T_28; // @[dbg.scala 124:119]
  wire  _T_30 = io_dmi_reg_addr == 7'h3c; // @[dbg.scala 125:60]
  wire  _T_31 = _T_29 | _T_30; // @[dbg.scala 125:41]
  wire  _T_32 = io_dmi_reg_addr == 7'h3d; // @[dbg.scala 126:22]
  wire  _T_33 = _T_31 | _T_32; // @[dbg.scala 125:78]
  wire  _T_34 = _T_27 & _T_33; // @[dbg.scala 124:98]
  wire  sbcs_sbbusyerror_wren = _T_25 | _T_34; // @[dbg.scala 124:66]
  wire  sbcs_sbbusyerror_din = ~_T_25; // @[dbg.scala 128:32]
  reg  temp_sbcs_22; // @[Reg.scala 27:20]
  reg  temp_sbcs_21; // @[Reg.scala 27:20]
  reg  temp_sbcs_20; // @[Reg.scala 27:20]
  wire  _T_40 = ~io_dmi_reg_wdata[18]; // @[dbg.scala 136:41]
  wire [4:0] _T_43 = {io_dmi_reg_wdata[19],_T_40,io_dmi_reg_wdata[17:15]}; // @[Cat.scala 29:58]
  reg [4:0] temp_sbcs_19_15; // @[Reg.scala 27:20]
  reg [2:0] temp_sbcs_14_12; // @[Reg.scala 27:20]
  wire  _T_47 = ~temp_sbcs_19_15[3]; // @[dbg.scala 140:101]
  wire [18:0] _T_52 = {_T_47,temp_sbcs_19_15[2:0],temp_sbcs_14_12,12'h40f}; // @[Cat.scala 29:58]
  wire [12:0] _T_57 = {9'h40,temp_sbcs_22,temp_sbcs_21,temp_sbcs_20,temp_sbcs_19_15[4]}; // @[Cat.scala 29:58]
  wire  _T_60 = sbcs_reg[19:17] == 3'h1; // @[dbg.scala 143:42]
  wire  _T_62 = _T_60 & sbaddress0_reg[0]; // @[dbg.scala 143:56]
  wire  _T_64 = sbcs_reg[19:17] == 3'h2; // @[dbg.scala 144:23]
  wire  _T_66 = |sbaddress0_reg[1:0]; // @[dbg.scala 144:60]
  wire  _T_67 = _T_64 & _T_66; // @[dbg.scala 144:37]
  wire  _T_68 = _T_62 | _T_67; // @[dbg.scala 143:76]
  wire  _T_70 = sbcs_reg[19:17] == 3'h3; // @[dbg.scala 145:23]
  wire  _T_72 = |sbaddress0_reg[2:0]; // @[dbg.scala 145:60]
  wire  _T_73 = _T_70 & _T_72; // @[dbg.scala 145:37]
  wire  sbcs_unaligned = _T_68 | _T_73; // @[dbg.scala 144:64]
  wire  sbcs_illegal_size = sbcs_reg[19]; // @[dbg.scala 147:35]
  wire  _T_75 = sbcs_reg[19:17] == 3'h0; // @[dbg.scala 148:53]
  wire [3:0] _T_77 = _T_75 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_78 = _T_77 & 4'h1; // @[dbg.scala 148:68]
  wire [3:0] _T_82 = _T_60 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_83 = _T_82 & 4'h2; // @[dbg.scala 148:122]
  wire [3:0] _T_84 = _T_78 | _T_83; // @[dbg.scala 148:79]
  wire [3:0] _T_88 = _T_64 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_89 = _T_88 & 4'h4; // @[dbg.scala 149:46]
  wire [3:0] _T_90 = _T_84 | _T_89; // @[dbg.scala 148:133]
  wire [3:0] _T_94 = _T_70 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_95 = _T_94 & 4'h8; // @[dbg.scala 149:100]
  wire [3:0] sbaddress0_incr = _T_90 | _T_95; // @[dbg.scala 149:57]
  wire  _T_96 = io_dmi_reg_en & io_dmi_reg_wr_en; // @[dbg.scala 151:41]
  wire  sbdata0_reg_wren0 = _T_96 & _T_30; // @[dbg.scala 151:60]
  wire  _T_98 = sb_state == 4'h7; // @[dbg.scala 152:37]
  wire  _T_99 = _T_98 & sb_state_en; // @[dbg.scala 152:60]
  wire  _T_100 = ~sbcs_sberror_wren; // @[dbg.scala 152:76]
  wire  sbdata0_reg_wren1 = _T_99 & _T_100; // @[dbg.scala 152:74]
  wire  sbdata0_reg_wren = sbdata0_reg_wren0 | sbdata0_reg_wren1; // @[dbg.scala 153:45]
  wire  sbdata1_reg_wren0 = _T_96 & _T_32; // @[dbg.scala 154:60]
  wire  sbdata1_reg_wren = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[dbg.scala 156:45]
  wire [31:0] _T_107 = sbdata0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_108 = _T_107 & io_dmi_reg_wdata; // @[dbg.scala 157:55]
  wire [31:0] _T_110 = sbdata0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_112 = _T_110 & sb_bus_rdata[31:0]; // @[dbg.scala 157:104]
  wire [31:0] sbdata0_din = _T_108 | _T_112; // @[dbg.scala 157:74]
  wire [31:0] _T_114 = sbdata1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_115 = _T_114 & io_dmi_reg_wdata; // @[dbg.scala 158:55]
  wire [31:0] _T_119 = _T_110 & sb_bus_rdata[63:32]; // @[dbg.scala 158:104]
  wire [31:0] sbdata1_din = _T_115 | _T_119; // @[dbg.scala 158:74]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 409:23]
  reg [31:0] sbdata0_reg; // @[Reg.scala 27:20]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 409:23]
  reg [31:0] sbdata1_reg; // @[Reg.scala 27:20]
  wire  sbaddress0_reg_wren0 = _T_96 & _T_28; // @[dbg.scala 163:64]
  wire  sbaddress0_reg_wren = sbaddress0_reg_wren0 | sbaddress0_reg_wren1; // @[dbg.scala 164:52]
  wire [31:0] _T_123 = sbaddress0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_124 = _T_123 & io_dmi_reg_wdata; // @[dbg.scala 165:62]
  wire [31:0] _T_126 = sbaddress0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_127 = {28'h0,sbaddress0_incr}; // @[Cat.scala 29:58]
  wire [31:0] _T_129 = sbaddress0_reg + _T_127; // @[dbg.scala 166:54]
  wire [31:0] _T_130 = _T_126 & _T_129; // @[dbg.scala 166:36]
  wire [31:0] sbaddress0_reg_din = _T_124 | _T_130; // @[dbg.scala 165:81]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 409:23]
  reg [31:0] _T_131; // @[Reg.scala 27:20]
  wire  sbreadonaddr_access = sbaddress0_reg_wren0 & sbcs_reg[20]; // @[dbg.scala 170:94]
  wire  _T_136 = ~io_dmi_reg_wr_en; // @[dbg.scala 171:45]
  wire  _T_137 = io_dmi_reg_en & _T_136; // @[dbg.scala 171:43]
  wire  _T_139 = _T_137 & _T_30; // @[dbg.scala 171:63]
  wire  sbreadondata_access = _T_139 & sbcs_reg[15]; // @[dbg.scala 171:95]
  wire  _T_143 = io_dmi_reg_addr == 7'h10; // @[dbg.scala 173:46]
  wire  _T_144 = _T_143 & io_dmi_reg_en; // @[dbg.scala 173:59]
  wire  dmcontrol_wren = _T_144 & io_dmi_reg_wr_en; // @[dbg.scala 173:75]
  wire  _T_147 = ~dmcontrol_reg[31]; // @[dbg.scala 174:50]
  wire  _T_148 = dmcontrol_reg[30] & _T_147; // @[dbg.scala 174:48]
  wire  resumereq = _T_148 & dmcontrol_wren_Q; // @[dbg.scala 174:69]
  wire [3:0] _T_154 = {io_dmi_reg_wdata[31:30],io_dmi_reg_wdata[28],io_dmi_reg_wdata[1]}; // @[Cat.scala 29:58]
  reg [3:0] dm_temp; // @[Reg.scala 27:20]
  reg  dm_temp_0; // @[Reg.scala 27:20]
  wire [27:0] _T_160 = {26'h0,dm_temp[0],dm_temp_0}; // @[Cat.scala 29:58]
  wire [3:0] _T_162 = {dm_temp[3:2],1'h0,dm_temp[1]}; // @[Cat.scala 29:58]
  reg  _T_163; // @[dbg.scala 184:12]
  wire [1:0] _T_165 = dmstatus_havereset ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_167 = dmstatus_resumeack ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_169 = dmstatus_unavail ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_171 = dmstatus_running ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_173 = dmstatus_halted ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_177 = {_T_171,_T_173,1'h1,7'h2}; // @[Cat.scala 29:58]
  wire [19:0] _T_181 = {12'h0,_T_165,_T_167,2'h0,_T_169}; // @[Cat.scala 29:58]
  wire  _T_183 = dbg_state == 4'h9; // @[dbg.scala 189:44]
  wire  _T_184 = _T_183 & io_dec_tlu_resume_ack; // @[dbg.scala 189:66]
  wire  _T_185 = dmstatus_resumeack & resumereq; // @[dbg.scala 189:111]
  wire  _T_186 = _T_185 & dmstatus_halted; // @[dbg.scala 189:123]
  wire  dmstatus_resumeack_wren = _T_184 | _T_186; // @[dbg.scala 189:90]
  wire  _T_190 = _T_143 & io_dmi_reg_wdata[28]; // @[dbg.scala 191:64]
  wire  _T_191 = _T_190 & io_dmi_reg_en; // @[dbg.scala 191:87]
  wire  _T_192 = _T_191 & io_dmi_reg_wr_en; // @[dbg.scala 191:103]
  wire  dmstatus_haveresetn_wren = _T_192 & dmcontrol_reg[0]; // @[dbg.scala 191:122]
  wire  _T_196 = ~reset; // @[dbg.scala 195:43]
  wire  _T_199 = dmstatus_unavail | dmstatus_halted; // @[dbg.scala 196:42]
  reg  _T_202; // @[Reg.scala 27:20]
  wire  _T_203 = ~io_dec_tlu_mpc_halted_only; // @[dbg.scala 201:37]
  reg  _T_205; // @[dbg.scala 201:12]
  reg  _T_206; // @[Reg.scala 27:20]
  wire [31:0] haltsum0_reg = {31'h0,dmstatus_halted}; // @[Cat.scala 29:58]
  wire  _T_209 = |abstractcs_reg[10:8]; // @[dbg.scala 207:75]
  wire  _T_210 = ~_T_209; // @[dbg.scala 207:52]
  wire  _T_211 = abstractcs_reg[12] & _T_210; // @[dbg.scala 207:50]
  wire  _T_212 = _T_211 & io_dmi_reg_en; // @[dbg.scala 207:80]
  wire  _T_213 = io_dmi_reg_addr == 7'h16; // @[dbg.scala 207:137]
  wire  _T_214 = io_dmi_reg_addr == 7'h17; // @[dbg.scala 208:22]
  wire  _T_215 = _T_213 | _T_214; // @[dbg.scala 207:155]
  wire  _T_216 = io_dmi_reg_wr_en & _T_215; // @[dbg.scala 207:117]
  wire  _T_217 = io_dmi_reg_addr == 7'h18; // @[dbg.scala 208:60]
  wire  _T_218 = _T_216 | _T_217; // @[dbg.scala 208:41]
  wire  _T_219 = io_dmi_reg_addr == 7'h4; // @[dbg.scala 208:98]
  wire  _T_220 = _T_218 | _T_219; // @[dbg.scala 208:79]
  wire  _T_221 = io_dmi_reg_addr == 7'h5; // @[dbg.scala 209:22]
  wire  _T_222 = _T_220 | _T_221; // @[dbg.scala 208:112]
  wire  abstractcs_error_sel0 = _T_212 & _T_222; // @[dbg.scala 207:96]
  wire  _T_226 = execute_command & _T_210; // @[dbg.scala 210:47]
  wire  _T_228 = command_reg[31:24] == 8'h0; // @[dbg.scala 211:29]
  wire  _T_230 = command_reg[31:24] == 8'h2; // @[dbg.scala 211:65]
  wire  _T_231 = _T_228 | _T_230; // @[dbg.scala 211:43]
  wire  _T_232 = ~_T_231; // @[dbg.scala 211:7]
  wire  _T_234 = command_reg[22:20] == 3'h3; // @[dbg.scala 212:29]
  wire  _T_236 = _T_234 | command_reg[22]; // @[dbg.scala 212:43]
  wire  _T_239 = _T_236 & _T_230; // @[dbg.scala 212:64]
  wire  _T_240 = _T_232 | _T_239; // @[dbg.scala 211:81]
  wire  _T_242 = command_reg[22:20] != 3'h2; // @[dbg.scala 213:28]
  wire  _T_246 = _T_228 & command_reg[17]; // @[dbg.scala 213:79]
  wire  _T_247 = _T_242 & _T_246; // @[dbg.scala 213:42]
  wire  _T_248 = _T_240 | _T_247; // @[dbg.scala 212:101]
  wire  _T_252 = _T_228 & command_reg[18]; // @[dbg.scala 214:42]
  wire  _T_253 = _T_248 | _T_252; // @[dbg.scala 213:101]
  wire  abstractcs_error_sel1 = _T_226 & _T_253; // @[dbg.scala 210:77]
  wire  _T_254 = io_core_dbg_cmd_done & io_core_dbg_cmd_fail; // @[dbg.scala 215:54]
  wire  _T_257 = execute_command & _T_228; // @[dbg.scala 216:22]
  wire  _T_259 = command_reg[15:12] == 4'h1; // @[dbg.scala 217:29]
  wire  _T_261 = command_reg[11:5] != 7'h0; // @[dbg.scala 217:64]
  wire  _T_262 = _T_259 & _T_261; // @[dbg.scala 217:43]
  wire  _T_264 = command_reg[15:13] != 3'h0; // @[dbg.scala 217:101]
  wire  _T_265 = _T_262 | _T_264; // @[dbg.scala 217:79]
  wire  _T_266 = _T_257 & _T_265; // @[dbg.scala 216:58]
  wire  _T_267 = _T_254 | _T_266; // @[dbg.scala 215:78]
  wire  abstractcs_error_sel2 = _T_267 & _T_210; // @[dbg.scala 217:118]
  wire  _T_271 = dbg_state != 4'h2; // @[dbg.scala 218:60]
  wire  _T_272 = execute_command & _T_271; // @[dbg.scala 218:47]
  wire  abstractcs_error_sel3 = _T_272 & _T_210; // @[dbg.scala 218:80]
  wire  _T_276 = dbg_sb_bus_error & io_dbg_bus_clk_en; // @[dbg.scala 219:48]
  wire  abstractcs_error_sel4 = _T_276 & _T_210; // @[dbg.scala 219:68]
  wire  _T_282 = execute_command & _T_230; // @[dbg.scala 220:47]
  wire  _T_286 = _T_282 & _T_210; // @[dbg.scala 220:83]
  wire  _T_288 = command_reg[22:20] == 3'h1; // @[dbg.scala 221:27]
  wire  _T_290 = _T_288 & abmem_addr[0]; // @[dbg.scala 221:41]
  wire  _T_292 = command_reg[22:20] == 3'h2; // @[dbg.scala 221:80]
  wire  _T_294 = |abmem_addr[1:0]; // @[dbg.scala 221:112]
  wire  _T_295 = _T_292 & _T_294; // @[dbg.scala 221:94]
  wire  _T_296 = _T_290 | _T_295; // @[dbg.scala 221:57]
  wire  abstractcs_error_sel5 = _T_286 & _T_296; // @[dbg.scala 220:113]
  wire  _T_298 = _T_213 & io_dmi_reg_en; // @[dbg.scala 222:67]
  wire  abstractcs_error_sel6 = _T_298 & io_dmi_reg_wr_en; // @[dbg.scala 222:83]
  wire [2:0] _T_301 = ~io_dmi_reg_wdata[10:8]; // @[dbg.scala 231:31]
  wire [2:0] _T_303 = _T_301 & abstractcs_reg[10:8]; // @[dbg.scala 231:55]
  reg  abs_temp_12; // @[Reg.scala 27:20]
  reg [2:0] abs_temp_10_8; // @[dbg.scala 236:12]
  wire [10:0] _T_311 = {abs_temp_10_8,8'h2}; // @[Cat.scala 29:58]
  wire [20:0] _T_313 = {19'h0,abs_temp_12,1'h0}; // @[Cat.scala 29:58]
  wire  _T_317 = _T_96 & _T_217; // @[dbg.scala 240:64]
  wire  _T_319 = ~abstractcs_reg[12]; // @[dbg.scala 240:103]
  wire  abstractauto_reg_wren = _T_317 & _T_319; // @[dbg.scala 240:101]
  reg [1:0] abstractauto_reg; // @[Reg.scala 27:20]
  wire  _T_323 = io_dmi_reg_en & _T_319; // @[dbg.scala 244:58]
  wire  _T_326 = _T_219 & abstractauto_reg[0]; // @[dbg.scala 244:115]
  wire  _T_329 = _T_221 & abstractauto_reg[1]; // @[dbg.scala 245:60]
  wire  _T_330 = _T_326 | _T_329; // @[dbg.scala 245:26]
  wire  _T_331 = _T_323 & _T_330; // @[dbg.scala 244:80]
  wire  _T_333 = _T_214 & io_dmi_reg_en; // @[dbg.scala 246:64]
  wire  _T_338 = _T_228 & command_reg[19]; // @[dbg.scala 247:78]
  wire  _T_339 = dbg_state == 4'h8; // @[dbg.scala 247:109]
  wire  _T_340 = _T_338 & _T_339; // @[dbg.scala 247:96]
  wire  _T_344 = _T_340 & _T_210; // @[dbg.scala 247:131]
  wire  command_regno_wren = command_wren | _T_344; // @[dbg.scala 247:41]
  wire  _T_346 = io_dmi_reg_wdata[31:24] == 8'h0; // @[dbg.scala 250:58]
  wire  command_postexec_din = _T_346 & io_dmi_reg_wdata[18]; // @[dbg.scala 250:72]
  wire  command_transfer_din = _T_346 & io_dmi_reg_wdata[17]; // @[dbg.scala 251:72]
  wire [15:0] temp_command_din_31_16 = {io_dmi_reg_wdata[31:24],1'h0,io_dmi_reg_wdata[22:19],command_postexec_din,command_transfer_din,io_dmi_reg_wdata[16]}; // @[Cat.scala 29:58]
  wire [15:0] temp_command_din_15_0 = command_wren ? io_dmi_reg_wdata[15:0] : dbg_cmd_next_addr[15:0]; // @[dbg.scala 253:37]
  reg  _T_361; // @[dbg.scala 257:12]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 409:23]
  reg [15:0] temp_command_reg_31_16; // @[Reg.scala 27:20]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 409:23]
  reg [15:0] temp_command_reg_15_0; // @[Reg.scala 27:20]
  wire  _T_367 = _T_96 & _T_219; // @[dbg.scala 266:58]
  wire  _T_368 = dbg_state == 4'h2; // @[dbg.scala 266:102]
  wire  _T_369 = _T_367 & _T_368; // @[dbg.scala 266:89]
  wire  data0_reg_wren0 = _T_369 & _T_319; // @[dbg.scala 266:122]
  wire  _T_372 = dbg_state == 4'h4; // @[dbg.scala 267:59]
  wire  _T_373 = io_core_dbg_cmd_done & _T_372; // @[dbg.scala 267:46]
  wire  _T_375 = ~command_reg[16]; // @[dbg.scala 267:88]
  wire  data0_reg_wren1 = _T_373 & _T_375; // @[dbg.scala 267:86]
  wire  _T_376 = data0_reg_wren0 | data0_reg_wren1; // @[dbg.scala 268:41]
  wire  data0_reg_wren = _T_376 | data0_reg_wren2; // @[dbg.scala 268:59]
  wire [31:0] _T_378 = data0_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_379 = _T_378 & io_dmi_reg_wdata; // @[dbg.scala 270:45]
  wire [31:0] _T_381 = data0_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_382 = _T_381 & io_core_dbg_rddata; // @[dbg.scala 271:31]
  wire [31:0] _T_383 = _T_379 | _T_382; // @[dbg.scala 270:64]
  wire [31:0] _T_385 = data0_reg_wren2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_387 = _T_385 & sb_bus_rdata[31:0]; // @[dbg.scala 272:31]
  wire [31:0] data0_din = _T_383 | _T_387; // @[dbg.scala 271:52]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 409:23]
  reg [31:0] data0_reg; // @[Reg.scala 27:20]
  wire  _T_390 = _T_96 & _T_221; // @[dbg.scala 277:59]
  wire  _T_392 = _T_390 & _T_368; // @[dbg.scala 277:92]
  wire  data1_reg_wren0 = _T_392 & _T_319; // @[dbg.scala 277:126]
  wire  _T_398 = _T_339 & _T_230; // @[dbg.scala 278:58]
  wire  _T_400 = _T_398 & command_reg[19]; // @[dbg.scala 278:94]
  wire  data1_reg_wren1 = _T_400 & _T_210; // @[dbg.scala 278:112]
  wire  data1_reg_wren = data1_reg_wren0 | data1_reg_wren1; // @[dbg.scala 279:41]
  wire [31:0] _T_405 = data1_reg_wren0 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_406 = _T_405 & io_dmi_reg_wdata; // @[dbg.scala 281:45]
  wire [31:0] _T_408 = data1_reg_wren1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_410 = _T_408 & dbg_cmd_next_addr; // @[dbg.scala 281:92]
  wire [31:0] data1_din = _T_406 | _T_410; // @[dbg.scala 281:64]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 409:23]
  reg [31:0] _T_411; // @[Reg.scala 27:20]
  reg  sb_abmem_cmd_done; // @[Reg.scala 27:20]
  reg  sb_abmem_data_done; // @[Reg.scala 27:20]
  wire [3:0] dbg_nxtstate;
  wire  _T_412 = 4'h0 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_414 = dmstatus_reg[9] | io_dec_tlu_mpc_halted_only; // @[dbg.scala 304:46]
  wire [3:0] _T_415 = _T_414 ? 4'h2 : 4'h1; // @[dbg.scala 304:29]
  wire  _T_418 = dmcontrol_reg[31] | dmstatus_reg[9]; // @[dbg.scala 305:46]
  wire  _T_419 = _T_418 | io_dec_tlu_mpc_halted_only; // @[dbg.scala 305:64]
  wire  _T_422 = 4'h1 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_426 = dmcontrol_wren_Q & dmcontrol_reg[31]; // @[dbg.scala 311:44]
  wire  _T_428 = 4'h2 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_432 = _T_230 & abmem_addr_external; // @[dbg.scala 314:116]
  wire [3:0] _T_433 = _T_432 ? 4'h5 : 4'h3; // @[dbg.scala 314:80]
  wire [3:0] _T_434 = resumereq ? 4'h9 : _T_433; // @[dbg.scala 314:47]
  wire [3:0] _T_436 = dmcontrol_reg[31] ? 4'h1 : 4'h0; // @[dbg.scala 315:60]
  wire [3:0] _T_437 = dmstatus_reg[9] ? _T_434 : _T_436; // @[dbg.scala 314:26]
  wire  _T_439 = dmstatus_reg[9] & resumereq; // @[dbg.scala 316:39]
  wire  _T_440 = _T_439 | execute_command; // @[dbg.scala 316:51]
  wire  _T_443 = ~_T_414; // @[dbg.scala 316:71]
  wire  _T_444 = _T_440 | _T_443; // @[dbg.scala 316:69]
  wire  _T_445 = dbg_nxtstate == 4'h3; // @[dbg.scala 318:62]
  wire  _T_446 = dbg_nxtstate == 4'h5; // @[dbg.scala 318:106]
  wire  _T_447 = _T_445 | _T_446; // @[dbg.scala 318:90]
  wire  _T_448 = dbg_state_en & _T_447; // @[dbg.scala 318:45]
  wire  _T_449 = dbg_nxtstate == 4'h9; // @[dbg.scala 320:62]
  wire  _T_450 = dbg_state_en & _T_449; // @[dbg.scala 320:46]
  wire  _T_455 = 4'h3 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_461 = ~command_reg[17]; // @[dbg.scala 324:96]
  wire  _T_462 = _T_228 & _T_461; // @[dbg.scala 324:94]
  wire  _T_463 = _T_209 | _T_462; // @[dbg.scala 324:56]
  wire [3:0] _T_464 = _T_463 ? 4'h8 : 4'h4; // @[dbg.scala 324:29]
  wire  _T_467 = io_dbg_dec_dma_dbg_ib_dbg_cmd_valid | _T_209; // @[dbg.scala 325:62]
  wire  _T_473 = _T_467 | _T_462; // @[dbg.scala 325:90]
  wire  _T_477 = 4'h4 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_481 = 4'h5 == dbg_state; // @[Conditional.scala 37:30]
  wire [3:0] _T_484 = _T_209 ? 4'h8 : 4'h6; // @[dbg.scala 334:29]
  wire  _T_485 = ~sb_cmd_pending; // @[dbg.scala 335:47]
  wire  _T_486 = io_dbg_bus_clk_en & _T_485; // @[dbg.scala 335:45]
  wire  _T_489 = _T_486 | _T_209; // @[dbg.scala 335:64]
  wire  _T_493 = 4'h6 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_494 = sb_bus_cmd_read | sb_bus_cmd_write_addr; // @[dbg.scala 341:49]
  wire  _T_495 = _T_494 & io_dbg_bus_clk_en; // @[dbg.scala 341:74]
  wire  _T_496 = sb_bus_cmd_read | sb_bus_cmd_write_data; // @[dbg.scala 342:49]
  wire  _T_497 = _T_496 & io_dbg_bus_clk_en; // @[dbg.scala 342:74]
  wire  _T_498 = sb_abmem_cmd_done | sb_abmem_cmd_done_en; // @[dbg.scala 344:51]
  wire  _T_499 = sb_abmem_data_done | sb_abmem_data_done_en; // @[dbg.scala 344:97]
  wire  _T_500 = _T_498 & _T_499; // @[dbg.scala 344:75]
  wire  _T_501 = _T_500 & io_dbg_bus_clk_en; // @[dbg.scala 344:122]
  wire  _T_505 = 4'h7 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_506 = sb_bus_rsp_read | sb_bus_rsp_write; // @[dbg.scala 349:45]
  wire  _T_507 = _T_506 & io_dbg_bus_clk_en; // @[dbg.scala 349:65]
  wire  _T_509 = _T_506 & sb_bus_rsp_error; // @[dbg.scala 350:65]
  wire  _T_510 = _T_509 & io_dbg_bus_clk_en; // @[dbg.scala 350:84]
  wire  _T_511 = ~sb_abmem_cmd_write; // @[dbg.scala 351:43]
  wire  _T_512 = dbg_state_en & _T_511; // @[dbg.scala 351:41]
  wire  _T_513 = ~dbg_sb_bus_error; // @[dbg.scala 351:65]
  wire  _T_514 = _T_512 & _T_513; // @[dbg.scala 351:63]
  wire  _T_518 = 4'h8 == dbg_state; // @[Conditional.scala 37:30]
  wire  _T_525 = 4'h9 == dbg_state; // @[Conditional.scala 37:30]
  wire  _GEN_21 = _T_525 & dmstatus_reg[17]; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_525 & _T_426; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_23 = _T_518 ? 4'h2 : 4'h0; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_518 | _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_518 & dbg_state_en; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_518 ? _T_426 : _GEN_22; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_29 = _T_505 ? 4'h8 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_505 ? _T_507 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_505 & _T_510; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_505 & _T_514; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_505 ? _T_426 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_505 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_505 ? 1'h0 : _T_518; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_493 ? _T_495 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_493 ? _T_497 : _GEN_36; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_40 = _T_493 ? 4'h7 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_493 ? _T_501 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_493 ? _T_426 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_493 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_493 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_493 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_47 = _T_481 ? _T_484 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_481 ? _T_489 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_481 ? _T_426 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_481 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_481 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_481 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_481 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_481 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_57 = _T_477 ? 4'h8 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_477 ? io_core_dbg_cmd_done : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_477 ? _T_426 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_477 ? 1'h0 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_477 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_477 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_477 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_477 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_67 = _T_455 ? _T_464 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_455 ? _T_473 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_455 ? _T_426 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_455 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_455 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_455 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_455 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_455 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_77 = _T_428 ? _T_437 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_428 ? _T_444 : _GEN_68; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_428 ? _T_448 : _GEN_75; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_428 & _T_450; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_428 ? _T_426 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_428 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_428 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_428 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_428 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_88 = _T_422 ? 4'h2 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_89 = _T_422 ? _T_414 : _GEN_78; // @[Conditional.scala 39:67]
  wire  _GEN_90 = _T_422 ? _T_426 : _GEN_82; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_422 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_422 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_422 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_422 ? 1'h0 : _GEN_85; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_422 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_422 ? 1'h0 : _GEN_87; // @[Conditional.scala 39:67]
  wire [31:0] _T_532 = _T_219 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_533 = _T_532 & data0_reg; // @[dbg.scala 372:76]
  wire [31:0] _T_536 = _T_221 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_537 = _T_536 & abmem_addr; // @[dbg.scala 373:47]
  wire [31:0] _T_538 = _T_533 | _T_537; // @[dbg.scala 372:88]
  wire [31:0] _T_541 = _T_143 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_546 = {2'h0,dmcontrol_reg[29],1'h0,dmcontrol_reg[27:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_547 = _T_541 & _T_546; // @[dbg.scala 374:48]
  wire [31:0] _T_548 = _T_538 | _T_547; // @[dbg.scala 373:59]
  wire  _T_549 = io_dmi_reg_addr == 7'h11; // @[dbg.scala 375:30]
  wire [31:0] _T_551 = _T_549 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_552 = _T_551 & dmstatus_reg; // @[dbg.scala 375:48]
  wire [31:0] _T_553 = _T_548 | _T_552; // @[dbg.scala 374:109]
  wire [31:0] _T_556 = _T_213 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_557 = _T_556 & abstractcs_reg; // @[dbg.scala 376:48]
  wire [31:0] _T_558 = _T_553 | _T_557; // @[dbg.scala 375:63]
  wire [31:0] _T_561 = _T_214 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_562 = _T_561 & command_reg; // @[dbg.scala 377:48]
  wire [31:0] _T_563 = _T_558 | _T_562; // @[dbg.scala 376:65]
  wire [31:0] _T_566 = _T_217 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_568 = {30'h0,abstractauto_reg}; // @[Cat.scala 29:58]
  wire [31:0] _T_569 = _T_566 & _T_568; // @[dbg.scala 378:48]
  wire [31:0] _T_570 = _T_563 | _T_569; // @[dbg.scala 377:62]
  wire  _T_571 = io_dmi_reg_addr == 7'h40; // @[dbg.scala 379:30]
  wire [31:0] _T_573 = _T_571 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_574 = _T_573 & haltsum0_reg; // @[dbg.scala 379:48]
  wire [31:0] _T_575 = _T_570 | _T_574; // @[dbg.scala 378:88]
  wire [31:0] _T_578 = _T_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_579 = _T_578 & sbcs_reg; // @[dbg.scala 380:48]
  wire [31:0] _T_580 = _T_575 | _T_579; // @[dbg.scala 379:63]
  wire [31:0] _T_583 = _T_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_584 = _T_583 & sbaddress0_reg; // @[dbg.scala 381:48]
  wire [31:0] _T_585 = _T_580 | _T_584; // @[dbg.scala 380:59]
  wire [31:0] _T_588 = _T_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_589 = _T_588 & sbdata0_reg; // @[dbg.scala 382:48]
  wire [31:0] _T_590 = _T_585 | _T_589; // @[dbg.scala 381:65]
  wire [31:0] _T_593 = _T_32 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_594 = _T_593 & sbdata1_reg; // @[dbg.scala 383:48]
  wire [31:0] dmi_reg_rdata_din = _T_590 | _T_594; // @[dbg.scala 382:62]
  wire  _T_595 = io_dbg_rst_l & _T_14; // @[dbg.scala 385:68]
  wire  _T_597 = _T_595 & reset; // @[dbg.scala 385:95]
  reg [3:0] _T_598; // @[Reg.scala 27:20]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 409:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 409:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 409:23]
  reg [31:0] _T_599; // @[Reg.scala 27:20]
  wire  _T_600 = abmem_addr_in_dccm_region | abmem_addr_in_iccm_region; // @[dbg.scala 392:58]
  wire  abmem_addr_core_local = _T_600 | abmem_addr_in_pic_region; // @[dbg.scala 392:86]
  wire [31:0] _T_613 = {20'h0,command_reg[11:0]}; // @[Cat.scala 29:58]
  wire  _T_616 = dbg_state == 4'h3; // @[dbg.scala 401:54]
  wire  _T_628 = _T_463 | _T_432; // @[dbg.scala 401:170]
  wire  _T_629 = ~_T_628; // @[dbg.scala 401:84]
  wire  _T_630 = _T_616 & _T_629; // @[dbg.scala 401:82]
  wire  _T_637 = command_reg[15:12] == 4'h0; // @[dbg.scala 404:123]
  wire [1:0] _T_638 = {1'h0,_T_637}; // @[Cat.scala 29:58]
  wire [6:0] _T_644 = 7'h1 << sb_abmem_cmd_size[1:0]; // @[dbg.scala 407:76]
  wire [6:0] dbg_cmd_addr_incr = _T_230 ? _T_644 : 7'h1; // @[dbg.scala 407:30]
  wire [31:0] _T_648 = {16'h0,command_reg[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] dbg_cmd_curr_addr = _T_230 ? abmem_addr : _T_648; // @[dbg.scala 408:30]
  wire [34:0] _T_649 = {28'h0,dbg_cmd_addr_incr}; // @[Cat.scala 29:58]
  wire [34:0] _GEN_180 = {{3'd0}, dbg_cmd_curr_addr}; // @[dbg.scala 409:45]
  wire [34:0] _T_651 = _GEN_180 + _T_649; // @[dbg.scala 409:45]
  wire  _T_656 = _T_616 & _T_210; // @[dbg.scala 411:72]
  wire  _T_660 = sb_state == 4'h3; // @[dbg.scala 413:41]
  wire  _T_661 = sb_state == 4'h4; // @[dbg.scala 413:76]
  wire  _T_662 = _T_660 | _T_661; // @[dbg.scala 413:64]
  wire  _T_663 = sb_state == 4'h5; // @[dbg.scala 413:111]
  wire  _T_664 = _T_662 | _T_663; // @[dbg.scala 413:99]
  wire  _T_665 = sb_state == 4'h6; // @[dbg.scala 414:15]
  wire  _T_666 = _T_664 | _T_665; // @[dbg.scala 413:139]
  wire  _T_668 = _T_666 | _T_98; // @[dbg.scala 414:43]
  wire  _T_669 = sb_state == 4'h8; // @[dbg.scala 414:90]
  wire  _T_671 = dbg_state == 4'h5; // @[dbg.scala 415:42]
  wire  _T_672 = dbg_state == 4'h6; // @[dbg.scala 415:81]
  wire  _T_673 = _T_671 | _T_672; // @[dbg.scala 415:68]
  wire  _T_674 = dbg_state == 4'h7; // @[dbg.scala 415:119]
  wire  sb_abmem_cmd_pending = _T_673 | _T_674; // @[dbg.scala 415:106]
  wire  _T_675 = 4'h0 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_677 = sbdata0_reg_wren0 | sbreadondata_access; // @[dbg.scala 428:40]
  wire  _T_678 = _T_677 | sbreadonaddr_access; // @[dbg.scala 428:62]
  wire  _T_680 = |sbcs_reg[14:12]; // @[dbg.scala 428:105]
  wire  _T_681 = ~_T_680; // @[dbg.scala 428:87]
  wire  _T_682 = _T_678 & _T_681; // @[dbg.scala 428:85]
  wire  _T_684 = ~sbcs_reg[22]; // @[dbg.scala 428:112]
  wire  _T_685 = _T_682 & _T_684; // @[dbg.scala 428:110]
  wire  _T_687 = |io_dmi_reg_wdata[14:12]; // @[dbg.scala 431:65]
  wire  _T_688 = sbcs_wren & _T_687; // @[dbg.scala 431:38]
  wire [2:0] _T_690 = ~io_dmi_reg_wdata[14:12]; // @[dbg.scala 432:27]
  wire [2:0] _T_692 = _T_690 & sbcs_reg[14:12]; // @[dbg.scala 432:53]
  wire  _T_693 = 4'h1 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_694 = sbcs_unaligned | sbcs_illegal_size; // @[dbg.scala 435:47]
  wire  _T_696 = ~sb_abmem_cmd_pending; // @[dbg.scala 436:49]
  wire  _T_697 = io_dbg_bus_clk_en & _T_696; // @[dbg.scala 436:47]
  wire  _T_698 = _T_697 | sbcs_unaligned; // @[dbg.scala 436:72]
  wire  _T_699 = _T_698 | sbcs_illegal_size; // @[dbg.scala 436:89]
  wire  _T_702 = 4'h2 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_711 = 4'h3 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_712 = sb_bus_cmd_read & io_dbg_bus_clk_en; // @[dbg.scala 448:38]
  wire  _T_713 = 4'h4 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_714 = sb_bus_cmd_write_addr & sb_bus_cmd_write_data; // @[dbg.scala 451:48]
  wire  _T_717 = sb_bus_cmd_write_addr | sb_bus_cmd_write_data; // @[dbg.scala 453:45]
  wire  _T_718 = _T_717 & io_dbg_bus_clk_en; // @[dbg.scala 453:70]
  wire  _T_719 = 4'h5 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_720 = sb_bus_cmd_write_addr & io_dbg_bus_clk_en; // @[dbg.scala 457:44]
  wire  _T_721 = 4'h6 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_722 = sb_bus_cmd_write_data & io_dbg_bus_clk_en; // @[dbg.scala 461:44]
  wire  _T_723 = 4'h7 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_724 = sb_bus_rsp_read & io_dbg_bus_clk_en; // @[dbg.scala 465:38]
  wire  _T_725 = sb_state_en & sb_bus_rsp_error; // @[dbg.scala 466:40]
  wire  _T_726 = 4'h8 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_727 = sb_bus_rsp_write & io_dbg_bus_clk_en; // @[dbg.scala 471:39]
  wire  _T_729 = 4'h9 == sb_state; // @[Conditional.scala 37:30]
  wire  _T_732 = sbcs_reg[14:12] == 3'h0; // @[dbg.scala 480:63]
  wire  _T_733 = sbcs_reg[16] & _T_732; // @[dbg.scala 480:44]
  wire  _GEN_115 = _T_729 & _T_733; // @[Conditional.scala 39:67]
  wire  _GEN_117 = _T_726 ? _T_727 : _T_729; // @[Conditional.scala 39:67]
  wire  _GEN_118 = _T_726 & _T_725; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_726 ? 1'h0 : _T_729; // @[Conditional.scala 39:67]
  wire  _GEN_122 = _T_726 ? 1'h0 : _GEN_115; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_723 ? _T_724 : _GEN_117; // @[Conditional.scala 39:67]
  wire  _GEN_125 = _T_723 ? _T_725 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_127 = _T_723 ? 1'h0 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_723 ? 1'h0 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_131 = _T_721 ? _T_722 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_721 ? 1'h0 : _GEN_125; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_721 ? 1'h0 : _GEN_127; // @[Conditional.scala 39:67]
  wire  _GEN_136 = _T_721 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_719 ? _T_720 : _GEN_131; // @[Conditional.scala 39:67]
  wire  _GEN_139 = _T_719 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_719 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_143 = _T_719 ? 1'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_145 = _T_713 ? _T_718 : _GEN_138; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_713 ? 1'h0 : _GEN_139; // @[Conditional.scala 39:67]
  wire  _GEN_148 = _T_713 ? 1'h0 : _GEN_141; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_713 ? 1'h0 : _GEN_143; // @[Conditional.scala 39:67]
  wire  _GEN_152 = _T_711 ? _T_712 : _GEN_145; // @[Conditional.scala 39:67]
  wire  _GEN_153 = _T_711 ? 1'h0 : _GEN_146; // @[Conditional.scala 39:67]
  wire  _GEN_155 = _T_711 ? 1'h0 : _GEN_148; // @[Conditional.scala 39:67]
  wire  _GEN_157 = _T_711 ? 1'h0 : _GEN_150; // @[Conditional.scala 39:67]
  wire  _GEN_159 = _T_702 ? _T_699 : _GEN_152; // @[Conditional.scala 39:67]
  wire  _GEN_160 = _T_702 ? _T_694 : _GEN_153; // @[Conditional.scala 39:67]
  wire  _GEN_162 = _T_702 ? 1'h0 : _GEN_155; // @[Conditional.scala 39:67]
  wire  _GEN_164 = _T_702 ? 1'h0 : _GEN_157; // @[Conditional.scala 39:67]
  wire  _GEN_166 = _T_693 ? _T_699 : _GEN_159; // @[Conditional.scala 39:67]
  wire  _GEN_167 = _T_693 ? _T_694 : _GEN_160; // @[Conditional.scala 39:67]
  wire  _GEN_169 = _T_693 ? 1'h0 : _GEN_162; // @[Conditional.scala 39:67]
  wire  _GEN_171 = _T_693 ? 1'h0 : _GEN_164; // @[Conditional.scala 39:67]
  reg [3:0] _T_734; // @[Reg.scala 27:20]
  wire [2:0] _T_737 = {1'h0,command_reg[21:20]}; // @[Cat.scala 29:58]
  wire [63:0] sb_cmd_wdata = {sbdata1_reg,sbdata0_reg}; // @[Cat.scala 29:58]
  wire  _T_741 = _T_672 & sb_abmem_cmd_write; // @[dbg.scala 496:67]
  wire  _T_742 = ~sb_abmem_cmd_done; // @[dbg.scala 496:90]
  wire  sb_abmem_cmd_awvalid = _T_741 & _T_742; // @[dbg.scala 496:88]
  wire  _T_745 = ~sb_abmem_data_done; // @[dbg.scala 497:90]
  wire  sb_abmem_cmd_wvalid = _T_741 & _T_745; // @[dbg.scala 497:88]
  wire  _T_748 = _T_672 & _T_511; // @[dbg.scala 498:67]
  wire  _T_750 = _T_748 & _T_742; // @[dbg.scala 498:89]
  wire  sb_abmem_cmd_arvalid = _T_750 & _T_745; // @[dbg.scala 498:110]
  wire  sb_abmem_read_pend = _T_674 & _T_511; // @[dbg.scala 499:67]
  wire  sb_cmd_awvalid = _T_661 | _T_663; // @[dbg.scala 501:59]
  wire  sb_cmd_wvalid = _T_661 | _T_665; // @[dbg.scala 502:59]
  wire  _T_758 = sb_abmem_cmd_awvalid | sb_abmem_cmd_wvalid; // @[dbg.scala 506:49]
  wire  _T_759 = _T_758 | sb_abmem_cmd_arvalid; // @[dbg.scala 506:71]
  wire  _T_760 = _T_759 | sb_abmem_read_pend; // @[dbg.scala 506:94]
  wire [2:0] sb_axi_size = _T_760 ? sb_abmem_cmd_size[2:0] : sbcs_reg[19:17]; // @[dbg.scala 506:26]
  wire [31:0] sb_axi_addr = _T_760 ? abmem_addr : sbaddress0_reg; // @[dbg.scala 507:26]
  wire [63:0] _T_770 = {data0_reg,data0_reg}; // @[Cat.scala 29:58]
  wire [63:0] sb_axi_wrdata = _T_758 ? _T_770 : sb_cmd_wdata; // @[dbg.scala 508:26]
  wire  _T_778 = |io_sb_axi_r_bits_resp; // @[dbg.scala 515:74]
  wire  _T_779 = sb_bus_rsp_read & _T_778; // @[dbg.scala 515:44]
  wire  _T_781 = |io_sb_axi_b_bits_resp; // @[dbg.scala 515:127]
  wire  _T_782 = sb_bus_rsp_write & _T_781; // @[dbg.scala 515:97]
  wire  _T_787 = sb_axi_size == 3'h0; // @[dbg.scala 530:52]
  wire [63:0] _T_789 = _T_787 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_793 = {sb_axi_wrdata[7:0],sb_axi_wrdata[7:0],sb_axi_wrdata[7:0],sb_axi_wrdata[7:0],sb_axi_wrdata[7:0],sb_axi_wrdata[7:0],sb_axi_wrdata[7:0],sb_axi_wrdata[7:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_794 = _T_789 & _T_793; // @[dbg.scala 530:67]
  wire  _T_795 = sb_axi_size == 3'h1; // @[dbg.scala 531:27]
  wire [63:0] _T_797 = _T_795 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_800 = {sb_axi_wrdata[15:0],sb_axi_wrdata[15:0],sb_axi_wrdata[15:0],sb_axi_wrdata[15:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_801 = _T_797 & _T_800; // @[dbg.scala 531:42]
  wire [63:0] _T_802 = _T_794 | _T_801; // @[dbg.scala 530:100]
  wire  _T_803 = sb_axi_size == 3'h2; // @[dbg.scala 532:27]
  wire [63:0] _T_805 = _T_803 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_807 = {sb_axi_wrdata[31:0],sb_axi_wrdata[31:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_808 = _T_805 & _T_807; // @[dbg.scala 532:42]
  wire [63:0] _T_809 = _T_802 | _T_808; // @[dbg.scala 531:74]
  wire  _T_810 = sb_axi_size == 3'h3; // @[dbg.scala 533:27]
  wire [63:0] _T_812 = _T_810 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_813 = _T_812 & sb_axi_wrdata; // @[dbg.scala 533:42]
  wire [7:0] _T_817 = _T_787 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _T_819 = 15'h1 << sb_axi_addr[2:0]; // @[dbg.scala 535:79]
  wire [14:0] _GEN_181 = {{7'd0}, _T_817}; // @[dbg.scala 535:64]
  wire [14:0] _T_820 = _GEN_181 & _T_819; // @[dbg.scala 535:64]
  wire [7:0] _T_823 = _T_795 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_825 = {sb_axi_addr[2:1],1'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_826 = 15'h3 << _T_825; // @[dbg.scala 536:56]
  wire [14:0] _GEN_182 = {{7'd0}, _T_823}; // @[dbg.scala 536:41]
  wire [14:0] _T_827 = _GEN_182 & _T_826; // @[dbg.scala 536:41]
  wire [14:0] _T_828 = _T_820 | _T_827; // @[dbg.scala 535:101]
  wire [7:0] _T_831 = _T_803 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_833 = {sb_axi_addr[2],2'h0}; // @[Cat.scala 29:58]
  wire [14:0] _T_834 = 15'hf << _T_833; // @[dbg.scala 537:56]
  wire [14:0] _GEN_183 = {{7'd0}, _T_831}; // @[dbg.scala 537:41]
  wire [14:0] _T_835 = _GEN_183 & _T_834; // @[dbg.scala 537:41]
  wire [14:0] _T_836 = _T_828 | _T_835; // @[dbg.scala 536:93]
  wire [7:0] _T_839 = _T_810 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [14:0] _GEN_184 = {{7'd0}, _T_839}; // @[dbg.scala 537:90]
  wire [14:0] _T_841 = _T_836 | _GEN_184; // @[dbg.scala 537:90]
  wire [3:0] _GEN_185 = {{1'd0}, sb_axi_addr[2:0]}; // @[dbg.scala 556:94]
  wire [6:0] _T_849 = 4'h8 * _GEN_185; // @[dbg.scala 556:94]
  wire [63:0] _T_850 = io_sb_axi_r_bits_data >> _T_849; // @[dbg.scala 556:87]
  wire [63:0] _T_851 = _T_850 & 64'hff; // @[dbg.scala 556:115]
  wire [63:0] _T_852 = _T_789 & _T_851; // @[dbg.scala 556:54]
  wire [4:0] _GEN_186 = {{3'd0}, sb_axi_addr[2:1]}; // @[dbg.scala 557:81]
  wire [6:0] _T_858 = 5'h10 * _GEN_186; // @[dbg.scala 557:81]
  wire [63:0] _T_859 = io_sb_axi_r_bits_data >> _T_858; // @[dbg.scala 557:73]
  wire [63:0] _T_860 = _T_859 & 64'hffff; // @[dbg.scala 557:102]
  wire [63:0] _T_861 = _T_797 & _T_860; // @[dbg.scala 557:40]
  wire [63:0] _T_862 = _T_852 | _T_861; // @[dbg.scala 556:132]
  wire [5:0] _GEN_187 = {{5'd0}, sb_axi_addr[2]}; // @[dbg.scala 558:81]
  wire [6:0] _T_868 = 6'h20 * _GEN_187; // @[dbg.scala 558:81]
  wire [63:0] _T_869 = io_sb_axi_r_bits_data >> _T_868; // @[dbg.scala 558:73]
  wire [63:0] _T_870 = _T_869 & 64'hffffffff; // @[dbg.scala 558:99]
  wire [63:0] _T_871 = _T_805 & _T_870; // @[dbg.scala 558:40]
  wire [63:0] _T_872 = _T_862 | _T_871; // @[dbg.scala 557:121]
  wire [63:0] _T_877 = _T_812 & io_sb_axi_r_bits_data; // @[dbg.scala 559:40]
  rvclkhdr rvclkhdr ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 409:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  assign io_dbg_cmd_size = command_reg[21:20]; // @[dbg.scala 405:21]
  assign io_dbg_core_rst_l = _T_17 | io_scan_mode; // @[dbg.scala 122:28]
  assign io_dbg_halt_req = _T_412 ? dmcontrol_reg[31] : _GEN_90; // @[dbg.scala 294:25 dbg.scala 306:23 dbg.scala 311:23 dbg.scala 321:29 dbg.scala 326:23 dbg.scala 331:23 dbg.scala 336:23 dbg.scala 345:29 dbg.scala 352:25 dbg.scala 359:29 dbg.scala 364:29 dbg.scala 369:23]
  assign io_dbg_resume_req = _T_412 ? 1'h0 : _GEN_93; // @[dbg.scala 295:25 dbg.scala 320:29]
  assign io_dmi_reg_rdata = _T_599; // @[dbg.scala 388:21]
  assign io_sb_axi_aw_valid = sb_abmem_cmd_awvalid | sb_cmd_awvalid; // @[dbg.scala 517:24]
  assign io_sb_axi_aw_bits_id = 1'h0; // @[dbg.scala 519:29]
  assign io_sb_axi_aw_bits_addr = _T_760 ? abmem_addr : sbaddress0_reg; // @[dbg.scala 518:29]
  assign io_sb_axi_aw_bits_region = sb_axi_addr[31:28]; // @[dbg.scala 523:29]
  assign io_sb_axi_aw_bits_len = 8'h0; // @[dbg.scala 524:29]
  assign io_sb_axi_aw_bits_size = _T_760 ? sb_abmem_cmd_size[2:0] : sbcs_reg[19:17]; // @[dbg.scala 520:29]
  assign io_sb_axi_aw_bits_burst = 2'h1; // @[dbg.scala 525:29]
  assign io_sb_axi_aw_bits_lock = 1'h0; // @[dbg.scala 527:29]
  assign io_sb_axi_aw_bits_cache = 4'hf; // @[dbg.scala 522:29]
  assign io_sb_axi_aw_bits_prot = 3'h1; // @[dbg.scala 521:29]
  assign io_sb_axi_aw_bits_qos = 4'h0; // @[dbg.scala 526:29]
  assign io_sb_axi_w_valid = sb_abmem_cmd_wvalid | sb_cmd_wvalid; // @[dbg.scala 529:22]
  assign io_sb_axi_w_bits_data = _T_809 | _T_813; // @[dbg.scala 530:27]
  assign io_sb_axi_w_bits_strb = _T_841[7:0]; // @[dbg.scala 535:25]
  assign io_sb_axi_w_bits_last = 1'h1; // @[dbg.scala 540:29]
  assign io_sb_axi_b_ready = 1'h1; // @[dbg.scala 553:21]
  assign io_sb_axi_ar_valid = sb_abmem_cmd_arvalid | _T_660; // @[dbg.scala 541:24]
  assign io_sb_axi_ar_bits_id = 1'h0; // @[dbg.scala 543:29]
  assign io_sb_axi_ar_bits_addr = _T_760 ? abmem_addr : sbaddress0_reg; // @[dbg.scala 542:29]
  assign io_sb_axi_ar_bits_region = sb_axi_addr[31:28]; // @[dbg.scala 547:29]
  assign io_sb_axi_ar_bits_len = 8'h0; // @[dbg.scala 548:29]
  assign io_sb_axi_ar_bits_size = _T_760 ? sb_abmem_cmd_size[2:0] : sbcs_reg[19:17]; // @[dbg.scala 544:29]
  assign io_sb_axi_ar_bits_burst = 2'h1; // @[dbg.scala 549:29]
  assign io_sb_axi_ar_bits_lock = 1'h0; // @[dbg.scala 551:29]
  assign io_sb_axi_ar_bits_cache = 4'h0; // @[dbg.scala 546:29]
  assign io_sb_axi_ar_bits_prot = 3'h1; // @[dbg.scala 545:29]
  assign io_sb_axi_ar_bits_qos = 4'h0; // @[dbg.scala 550:29]
  assign io_sb_axi_r_ready = 1'h1; // @[dbg.scala 554:21]
  assign io_dbg_dec_dma_dbg_ib_dbg_cmd_valid = _T_630 & io_dbg_dma_dma_dbg_ready; // @[dbg.scala 401:40]
  assign io_dbg_dec_dma_dbg_ib_dbg_cmd_write = command_reg[16]; // @[dbg.scala 403:40]
  assign io_dbg_dec_dma_dbg_ib_dbg_cmd_type = _T_230 ? 2'h2 : _T_638; // @[dbg.scala 404:40]
  assign io_dbg_dec_dma_dbg_ib_dbg_cmd_addr = _T_230 ? abmem_addr : _T_613; // @[dbg.scala 399:40]
  assign io_dbg_dec_dma_dbg_dctl_dbg_cmd_wrdata = data0_reg; // @[dbg.scala 400:42]
  assign io_dbg_dma_dbg_dma_bubble = _T_656 | _T_372; // @[dbg.scala 411:29]
  assign dbg_state = _T_598; // @[dbg.scala 385:13]
  assign dbg_state_en = _T_412 ? _T_419 : _GEN_89; // @[dbg.scala 291:25 dbg.scala 305:23 dbg.scala 310:23 dbg.scala 316:20 dbg.scala 325:23 dbg.scala 330:23 dbg.scala 335:23 dbg.scala 344:29 dbg.scala 349:25 dbg.scala 356:29 dbg.scala 368:20]
  assign sb_state = _T_734; // @[dbg.scala 483:12]
  assign sb_state_en = _T_675 ? _T_685 : _GEN_166; // @[dbg.scala 428:19 dbg.scala 436:25 dbg.scala 442:25 dbg.scala 448:19 dbg.scala 453:19 dbg.scala 457:19 dbg.scala 461:19 dbg.scala 465:19 dbg.scala 471:19 dbg.scala 477:19]
  assign dmcontrol_reg = {_T_162,_T_160}; // @[dbg.scala 181:18]
  assign sbaddress0_reg = _T_131; // @[dbg.scala 168:18]
  assign sbcs_sbbusy_wren = _T_675 ? sb_state_en : _GEN_169; // @[dbg.scala 420:20 dbg.scala 429:24 dbg.scala 478:24]
  assign sbcs_sberror_wren = _T_675 ? _T_688 : _GEN_167; // @[dbg.scala 422:21 dbg.scala 431:25 dbg.scala 437:25 dbg.scala 443:25 dbg.scala 466:25 dbg.scala 472:25]
  assign sb_bus_rdata = _T_872 | _T_877; // @[dbg.scala 556:16]
  assign sbaddress0_reg_wren1 = _T_675 ? 1'h0 : _GEN_171; // @[dbg.scala 424:24 dbg.scala 480:28]
  assign dmstatus_reg = {_T_181,_T_177}; // @[dbg.scala 186:16]
  assign dmstatus_havereset = ~dmstatus_haveresetn; // @[dbg.scala 192:23]
  assign dmstatus_haveresetn = _T_206; // @[dbg.scala 202:23]
  assign dmstatus_resumeack = _T_202; // @[dbg.scala 198:22]
  assign dmstatus_unavail = dmcontrol_reg[1] | _T_196; // @[dbg.scala 195:20]
  assign dmstatus_running = ~_T_199; // @[dbg.scala 196:20]
  assign dmstatus_halted = _T_205; // @[dbg.scala 200:22]
  assign abstractcs_busy_wren = _T_412 ? 1'h0 : _GEN_91; // @[dbg.scala 292:25 dbg.scala 318:29 dbg.scala 357:29]
  assign sb_bus_cmd_read = io_sb_axi_ar_valid & io_sb_axi_ar_ready; // @[dbg.scala 510:25]
  assign sb_bus_cmd_write_addr = io_sb_axi_aw_valid & io_sb_axi_aw_ready; // @[dbg.scala 511:25]
  assign sb_bus_cmd_write_data = io_sb_axi_w_valid & io_sb_axi_w_ready; // @[dbg.scala 512:25]
  assign sb_bus_rsp_read = io_sb_axi_r_valid & io_sb_axi_r_ready; // @[dbg.scala 513:25]
  assign sb_bus_rsp_error = _T_779 | _T_782; // @[dbg.scala 515:25]
  assign sb_bus_rsp_write = io_sb_axi_b_valid & io_sb_axi_b_ready; // @[dbg.scala 514:25]
  assign sbcs_sbbusy_din = 4'h0 == sb_state; // @[dbg.scala 421:19 dbg.scala 430:23 dbg.scala 479:23]
  assign abmem_addr = _T_411; // @[dbg.scala 282:16]
  assign sbcs_reg = {_T_57,_T_52}; // @[dbg.scala 140:12]
  assign execute_command = _T_361; // @[dbg.scala 256:19]
  assign command_reg = {temp_command_reg_31_16,temp_command_reg_15_0}; // @[dbg.scala 264:15]
  assign dbg_sb_bus_error = _T_412 ? 1'h0 : _GEN_97; // @[dbg.scala 296:25 dbg.scala 350:25]
  assign command_wren = _T_333 & io_dmi_reg_wr_en; // @[dbg.scala 246:25]
  assign command_din = {temp_command_din_31_16,temp_command_din_15_0}; // @[dbg.scala 255:19]
  assign dbg_cmd_next_addr = _T_651[31:0]; // @[dbg.scala 409:24]
  assign data0_reg_wren2 = _T_412 ? 1'h0 : _GEN_98; // @[dbg.scala 297:25 dbg.scala 351:25]
  assign sb_abmem_cmd_done_en = _T_412 ? 1'h0 : _GEN_95; // @[dbg.scala 300:25 dbg.scala 341:29 dbg.scala 362:29]
  assign sb_abmem_data_done_en = _T_412 ? 1'h0 : _GEN_96; // @[dbg.scala 301:25 dbg.scala 342:29 dbg.scala 363:29]
  assign abmem_addr_external = ~abmem_addr_core_local; // @[dbg.scala 393:28]
  assign sb_cmd_pending = _T_668 | _T_669; // @[dbg.scala 413:28]
  assign sb_abmem_cmd_write = command_reg[16]; // @[dbg.scala 487:34]
  assign abmem_addr_in_dccm_region = abmem_addr[31:28] == 4'hf; // @[dbg.scala 395:29]
  assign abmem_addr_in_iccm_region = abmem_addr[31:28] == 4'he; // @[dbg.scala 396:29]
  assign abmem_addr_in_pic_region = abmem_addr[31:28] == 4'hf; // @[dbg.scala 397:29]
  assign sb_abmem_cmd_size = {{1'd0}, _T_737}; // @[dbg.scala 488:34]
  assign dmcontrol_wren_Q = _T_163; // @[dbg.scala 183:21]
  assign abstractcs_reg = {_T_313,_T_311}; // @[dbg.scala 238:20]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_io_en = _T_7 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_1_io_en = _T_11 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_2_io_en = sbdata0_reg_wren0 | sbdata0_reg_wren1; // @[lib.scala 412:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_3_io_en = sbdata1_reg_wren0 | sbdata0_reg_wren1; // @[lib.scala 412:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_4_io_en = sbaddress0_reg_wren0 | sbaddress0_reg_wren1; // @[lib.scala 412:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_5_io_en = command_wren; // @[lib.scala 412:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_6_io_en = command_wren | _T_344; // @[lib.scala 412:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_7_io_en = _T_376 | data0_reg_wren2; // @[lib.scala 412:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_8_io_en = data1_reg_wren0 | data1_reg_wren1; // @[lib.scala 412:17]
  assign dbg_nxtstate = _T_412 ? _T_415 : _GEN_88; // @[dbg.scala 290:25 dbg.scala 304:23 dbg.scala 309:23 dbg.scala 314:20 dbg.scala 324:23 dbg.scala 329:23 dbg.scala 334:23 dbg.scala 343:29 dbg.scala 348:25 dbg.scala 355:29 dbg.scala 367:20]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 411:18]
  assign rvclkhdr_9_io_en = io_dmi_reg_en; // @[lib.scala 412:17]
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
  _T_131 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  dm_temp = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  dm_temp_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_163 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_202 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_205 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_206 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  abs_temp_12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  abs_temp_10_8 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  abstractauto_reg = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  _T_361 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  temp_command_reg_31_16 = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  temp_command_reg_15_0 = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  data0_reg = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  _T_411 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  sb_abmem_cmd_done = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  sb_abmem_data_done = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_598 = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  _T_599 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  _T_734 = _RAND_26[3:0];
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
  if (dbg_dm_rst_l) begin
    temp_sbcs_14_12 = 3'h0;
  end
  if (dbg_dm_rst_l) begin
    sbdata0_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    sbdata1_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_131 = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    dm_temp = 4'h0;
  end
  if (io_dbg_rst_l) begin
    dm_temp_0 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_163 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_202 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_205 = 1'h0;
  end
  if (reset) begin
    _T_206 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    abs_temp_12 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    abs_temp_10_8 = 3'h0;
  end
  if (dbg_dm_rst_l) begin
    abstractauto_reg = 2'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_361 = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    temp_command_reg_31_16 = 16'h0;
  end
  if (dbg_dm_rst_l) begin
    temp_command_reg_15_0 = 16'h0;
  end
  if (dbg_dm_rst_l) begin
    data0_reg = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_411 = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    sb_abmem_cmd_done = 1'h0;
  end
  if (dbg_dm_rst_l) begin
    sb_abmem_data_done = 1'h0;
  end
  if (_T_597) begin
    _T_598 = 4'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_599 = 32'h0;
  end
  if (dbg_dm_rst_l) begin
    _T_734 = 4'h0;
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
      temp_sbcs_19_15 <= _T_43;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_sbcs_14_12 <= 3'h0;
    end else if (sbcs_sberror_wren) begin
      if (_T_675) begin
        temp_sbcs_14_12 <= _T_692;
      end else if (_T_693) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_702) begin
        if (sbcs_unaligned) begin
          temp_sbcs_14_12 <= 3'h3;
        end else begin
          temp_sbcs_14_12 <= 3'h4;
        end
      end else if (_T_711) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_713) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_719) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_721) begin
        temp_sbcs_14_12 <= 3'h0;
      end else if (_T_723) begin
        temp_sbcs_14_12 <= 3'h2;
      end else if (_T_726) begin
        temp_sbcs_14_12 <= 3'h2;
      end else begin
        temp_sbcs_14_12 <= 3'h0;
      end
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      sbdata0_reg <= 32'h0;
    end else if (sbdata0_reg_wren) begin
      sbdata0_reg <= sbdata0_din;
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      sbdata1_reg <= 32'h0;
    end else if (sbdata1_reg_wren) begin
      sbdata1_reg <= sbdata1_din;
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_131 <= 32'h0;
    end else if (sbaddress0_reg_wren) begin
      _T_131 <= sbaddress0_reg_din;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      dm_temp <= 4'h0;
    end else if (dmcontrol_wren) begin
      dm_temp <= _T_154;
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
      _T_163 <= 1'h0;
    end else begin
      _T_163 <= _T_144 & io_dmi_reg_wr_en;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_202 <= 1'h0;
    end else if (dmstatus_resumeack_wren) begin
      _T_202 <= _T_184;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_205 <= 1'h0;
    end else begin
      _T_205 <= io_dec_tlu_dbg_halted & _T_203;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_206 <= 1'h0;
    end else begin
      _T_206 <= dmstatus_haveresetn_wren | _T_206;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      abs_temp_12 <= 1'h0;
    end else if (abstractcs_busy_wren) begin
      if (_T_412) begin
        abs_temp_12 <= 1'h0;
      end else if (_T_422) begin
        abs_temp_12 <= 1'h0;
      end else begin
        abs_temp_12 <= _T_428;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      abs_temp_10_8 <= 3'h0;
    end else if (abstractcs_error_sel0) begin
      abs_temp_10_8 <= 3'h1;
    end else if (abstractcs_error_sel1) begin
      abs_temp_10_8 <= 3'h2;
    end else if (abstractcs_error_sel2) begin
      abs_temp_10_8 <= 3'h3;
    end else if (abstractcs_error_sel3) begin
      abs_temp_10_8 <= 3'h4;
    end else if (abstractcs_error_sel4) begin
      abs_temp_10_8 <= 3'h5;
    end else if (abstractcs_error_sel5) begin
      abs_temp_10_8 <= 3'h7;
    end else if (abstractcs_error_sel6) begin
      abs_temp_10_8 <= _T_303;
    end else begin
      abs_temp_10_8 <= abstractcs_reg[10:8];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      abstractauto_reg <= 2'h0;
    end else if (abstractauto_reg_wren) begin
      abstractauto_reg <= io_dmi_reg_wdata[1:0];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_361 <= 1'h0;
    end else begin
      _T_361 <= command_wren | _T_331;
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_command_reg_31_16 <= 16'h0;
    end else if (command_wren) begin
      temp_command_reg_31_16 <= command_din[31:16];
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      temp_command_reg_15_0 <= 16'h0;
    end else if (command_regno_wren) begin
      temp_command_reg_15_0 <= command_din[15:0];
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      data0_reg <= 32'h0;
    end else if (data0_reg_wren) begin
      data0_reg <= data0_din;
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_411 <= 32'h0;
    end else if (data1_reg_wren) begin
      _T_411 <= data1_din;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      sb_abmem_cmd_done <= 1'h0;
    end else if (sb_abmem_cmd_done_en) begin
      if (_T_412) begin
        sb_abmem_cmd_done <= 1'h0;
      end else if (_T_422) begin
        sb_abmem_cmd_done <= 1'h0;
      end else if (_T_428) begin
        sb_abmem_cmd_done <= 1'h0;
      end else if (_T_455) begin
        sb_abmem_cmd_done <= 1'h0;
      end else if (_T_477) begin
        sb_abmem_cmd_done <= 1'h0;
      end else if (_T_481) begin
        sb_abmem_cmd_done <= 1'h0;
      end else begin
        sb_abmem_cmd_done <= _T_493;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      sb_abmem_data_done <= 1'h0;
    end else if (sb_abmem_data_done_en) begin
      if (_T_412) begin
        sb_abmem_data_done <= 1'h0;
      end else if (_T_422) begin
        sb_abmem_data_done <= 1'h0;
      end else if (_T_428) begin
        sb_abmem_data_done <= 1'h0;
      end else if (_T_455) begin
        sb_abmem_data_done <= 1'h0;
      end else if (_T_477) begin
        sb_abmem_data_done <= 1'h0;
      end else if (_T_481) begin
        sb_abmem_data_done <= 1'h0;
      end else begin
        sb_abmem_data_done <= _T_493;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge _T_597) begin
    if (_T_597) begin
      _T_598 <= 4'h0;
    end else if (dbg_state_en) begin
      if (_T_412) begin
        if (_T_414) begin
          _T_598 <= 4'h2;
        end else begin
          _T_598 <= 4'h1;
        end
      end else if (_T_422) begin
        _T_598 <= 4'h2;
      end else if (_T_428) begin
        if (dmstatus_reg[9]) begin
          if (resumereq) begin
            _T_598 <= 4'h9;
          end else if (_T_432) begin
            _T_598 <= 4'h5;
          end else begin
            _T_598 <= 4'h3;
          end
        end else if (dmcontrol_reg[31]) begin
          _T_598 <= 4'h1;
        end else begin
          _T_598 <= 4'h0;
        end
      end else if (_T_455) begin
        if (_T_463) begin
          _T_598 <= 4'h8;
        end else begin
          _T_598 <= 4'h4;
        end
      end else if (_T_477) begin
        _T_598 <= 4'h8;
      end else if (_T_481) begin
        if (_T_209) begin
          _T_598 <= 4'h8;
        end else begin
          _T_598 <= 4'h6;
        end
      end else if (_T_493) begin
        _T_598 <= 4'h7;
      end else if (_T_505) begin
        _T_598 <= 4'h8;
      end else if (_T_518) begin
        _T_598 <= 4'h2;
      end else begin
        _T_598 <= 4'h0;
      end
    end
  end
  always @(posedge clock or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_599 <= 32'h0;
    end else if (io_dmi_reg_en) begin
      _T_599 <= dmi_reg_rdata_din;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge dbg_dm_rst_l) begin
    if (dbg_dm_rst_l) begin
      _T_734 <= 4'h0;
    end else if (sb_state_en) begin
      if (_T_675) begin
        if (sbdata0_reg_wren0) begin
          _T_734 <= 4'h2;
        end else begin
          _T_734 <= 4'h1;
        end
      end else if (_T_693) begin
        if (_T_694) begin
          _T_734 <= 4'h9;
        end else begin
          _T_734 <= 4'h3;
        end
      end else if (_T_702) begin
        if (_T_694) begin
          _T_734 <= 4'h9;
        end else begin
          _T_734 <= 4'h4;
        end
      end else if (_T_711) begin
        _T_734 <= 4'h7;
      end else if (_T_713) begin
        if (_T_714) begin
          _T_734 <= 4'h8;
        end else if (sb_bus_cmd_write_data) begin
          _T_734 <= 4'h5;
        end else begin
          _T_734 <= 4'h6;
        end
      end else if (_T_719) begin
        _T_734 <= 4'h8;
      end else if (_T_721) begin
        _T_734 <= 4'h8;
      end else if (_T_723) begin
        _T_734 <= 4'h9;
      end else if (_T_726) begin
        _T_734 <= 4'h9;
      end else begin
        _T_734 <= 4'h0;
      end
    end
  end
endmodule
