module el2_dec_ib_ctl(
  input         io_dbg_cmd_valid,
  input         io_dbg_cmd_write,
  input  [1:0]  io_dbg_cmd_type,
  input  [31:0] io_dbg_cmd_addr,
  input         io_i0_brp_valid,
  input  [11:0] io_i0_brp_bits_toffset,
  input  [1:0]  io_i0_brp_bits_hist,
  input         io_i0_brp_bits_br_error,
  input         io_i0_brp_bits_br_start_error,
  input  [30:0] io_i0_brp_bits_prett,
  input         io_i0_brp_bits_way,
  input         io_i0_brp_bits_ret,
  input  [7:0]  io_ifu_i0_bp_index,
  input  [7:0]  io_ifu_i0_bp_fghr,
  input  [4:0]  io_ifu_i0_bp_btag,
  input         io_ifu_i0_pc4,
  input         io_ifu_i0_valid,
  input         io_ifu_i0_icaf,
  input  [1:0]  io_ifu_i0_icaf_type,
  input         io_ifu_i0_icaf_f1,
  input         io_ifu_i0_dbecc,
  input  [31:0] io_ifu_i0_instr,
  input  [30:0] io_ifu_i0_pc,
  output        io_dec_ib0_valid_d,
  output [1:0]  io_dec_i0_icaf_type_d,
  output [31:0] io_dec_i0_instr_d,
  output [30:0] io_dec_i0_pc_d,
  output        io_dec_i0_pc4_d,
  output        io_dec_i0_brp_valid,
  output [11:0] io_dec_i0_brp_bits_toffset,
  output [1:0]  io_dec_i0_brp_bits_hist,
  output        io_dec_i0_brp_bits_br_error,
  output        io_dec_i0_brp_bits_br_start_error,
  output [30:0] io_dec_i0_brp_bits_prett,
  output        io_dec_i0_brp_bits_way,
  output        io_dec_i0_brp_bits_ret,
  output [7:0]  io_dec_i0_bp_index,
  output [7:0]  io_dec_i0_bp_fghr,
  output [4:0]  io_dec_i0_bp_btag,
  output        io_dec_i0_icaf_d,
  output        io_dec_i0_icaf_f1_d,
  output        io_dec_i0_dbecc_d,
  output        io_dec_debug_wdata_rs1_d,
  output        io_dec_debug_fence_d
);
  wire  _T = io_dbg_cmd_type != 2'h2; // @[el2_dec_ib_ctl.scala 66:60]
  wire  debug_valid = io_dbg_cmd_valid & _T; // @[el2_dec_ib_ctl.scala 66:41]
  wire  _T_1 = ~io_dbg_cmd_write; // @[el2_dec_ib_ctl.scala 67:38]
  wire  debug_read = debug_valid & _T_1; // @[el2_dec_ib_ctl.scala 67:36]
  wire  debug_write = debug_valid & io_dbg_cmd_write; // @[el2_dec_ib_ctl.scala 68:36]
  wire  _T_2 = io_dbg_cmd_type == 2'h0; // @[el2_dec_ib_ctl.scala 70:55]
  wire  debug_read_gpr = debug_read & _T_2; // @[el2_dec_ib_ctl.scala 70:37]
  wire  debug_write_gpr = debug_write & _T_2; // @[el2_dec_ib_ctl.scala 71:37]
  wire  _T_4 = io_dbg_cmd_type == 2'h1; // @[el2_dec_ib_ctl.scala 72:55]
  wire  debug_read_csr = debug_read & _T_4; // @[el2_dec_ib_ctl.scala 72:37]
  wire  debug_write_csr = debug_write & _T_4; // @[el2_dec_ib_ctl.scala 73:37]
  wire [4:0] dreg = io_dbg_cmd_addr[4:0]; // @[el2_dec_ib_ctl.scala 75:40]
  wire [11:0] dcsr = io_dbg_cmd_addr[11:0]; // @[el2_dec_ib_ctl.scala 76:40]
  wire [31:0] _T_9 = {12'h0,dreg,15'h6033}; // @[Cat.scala 29:58]
  wire [31:0] _T_12 = {20'h6,dreg,7'h33}; // @[Cat.scala 29:58]
  wire [31:0] _T_14 = {dcsr,20'h2073}; // @[Cat.scala 29:58]
  wire [31:0] _T_16 = {dcsr,20'h1073}; // @[Cat.scala 29:58]
  wire [31:0] _T_17 = debug_read_gpr ? _T_9 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_18 = debug_write_gpr ? _T_12 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_19 = debug_read_csr ? _T_14 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_20 = debug_write_csr ? _T_16 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_21 = _T_17 | _T_18; // @[Mux.scala 27:72]
  wire [31:0] _T_22 = _T_21 | _T_19; // @[Mux.scala 27:72]
  wire [31:0] ib0_debug_in = _T_22 | _T_20; // @[Mux.scala 27:72]
  wire  _T_25 = dcsr == 12'h7c4; // @[el2_dec_ib_ctl.scala 89:51]
  assign io_dec_ib0_valid_d = io_ifu_i0_valid | debug_valid; // @[el2_dec_ib_ctl.scala 91:22]
  assign io_dec_i0_icaf_type_d = io_ifu_i0_icaf_type; // @[el2_dec_ib_ctl.scala 48:31]
  assign io_dec_i0_instr_d = debug_valid ? ib0_debug_in : io_ifu_i0_instr; // @[el2_dec_ib_ctl.scala 92:22]
  assign io_dec_i0_pc_d = io_ifu_i0_pc; // @[el2_dec_ib_ctl.scala 46:31]
  assign io_dec_i0_pc4_d = io_ifu_i0_pc4; // @[el2_dec_ib_ctl.scala 47:31]
  assign io_dec_i0_brp_valid = io_i0_brp_valid; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_toffset = io_i0_brp_bits_toffset; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_hist = io_i0_brp_bits_hist; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_br_error = io_i0_brp_bits_br_error; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_br_start_error = io_i0_brp_bits_br_start_error; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_prett = io_i0_brp_bits_prett; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_way = io_i0_brp_bits_way; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_brp_bits_ret = io_i0_brp_bits_ret; // @[el2_dec_ib_ctl.scala 49:31]
  assign io_dec_i0_bp_index = io_ifu_i0_bp_index; // @[el2_dec_ib_ctl.scala 50:31]
  assign io_dec_i0_bp_fghr = io_ifu_i0_bp_fghr; // @[el2_dec_ib_ctl.scala 51:31]
  assign io_dec_i0_bp_btag = io_ifu_i0_bp_btag; // @[el2_dec_ib_ctl.scala 52:31]
  assign io_dec_i0_icaf_d = io_ifu_i0_icaf; // @[el2_dec_ib_ctl.scala 45:31]
  assign io_dec_i0_icaf_f1_d = io_ifu_i0_icaf_f1; // @[el2_dec_ib_ctl.scala 43:31]
  assign io_dec_i0_dbecc_d = io_ifu_i0_dbecc; // @[el2_dec_ib_ctl.scala 44:31]
  assign io_dec_debug_wdata_rs1_d = debug_write_gpr | debug_write_csr; // @[el2_dec_ib_ctl.scala 86:28]
  assign io_dec_debug_fence_d = debug_write_csr & _T_25; // @[el2_dec_ib_ctl.scala 89:24]
endmodule
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
module el2_dec_dec_ctl(
  input  [31:0] io_ins,
  output        io_out_alu,
  output        io_out_rs1,
  output        io_out_rs2,
  output        io_out_imm12,
  output        io_out_rd,
  output        io_out_shimm5,
  output        io_out_imm20,
  output        io_out_pc,
  output        io_out_load,
  output        io_out_store,
  output        io_out_lsu,
  output        io_out_add,
  output        io_out_sub,
  output        io_out_land,
  output        io_out_lor,
  output        io_out_lxor,
  output        io_out_sll,
  output        io_out_sra,
  output        io_out_srl,
  output        io_out_slt,
  output        io_out_unsign,
  output        io_out_condbr,
  output        io_out_beq,
  output        io_out_bne,
  output        io_out_bge,
  output        io_out_blt,
  output        io_out_jal,
  output        io_out_by,
  output        io_out_half,
  output        io_out_word,
  output        io_out_csr_read,
  output        io_out_csr_clr,
  output        io_out_csr_set,
  output        io_out_csr_write,
  output        io_out_csr_imm,
  output        io_out_presync,
  output        io_out_postsync,
  output        io_out_ebreak,
  output        io_out_ecall,
  output        io_out_mret,
  output        io_out_mul,
  output        io_out_rs1_sign,
  output        io_out_rs2_sign,
  output        io_out_low,
  output        io_out_div,
  output        io_out_rem,
  output        io_out_fence,
  output        io_out_fence_i,
  output        io_out_pm_alu,
  output        io_out_legal
);
  wire  _T_2 = io_ins[2] | io_ins[6]; // @[el2_dec_dec_ctl.scala 72:27]
  wire  _T_4 = ~io_ins[25]; // @[el2_dec_dec_ctl.scala 72:42]
  wire  _T_6 = _T_4 & io_ins[4]; // @[el2_dec_dec_ctl.scala 72:53]
  wire  _T_7 = _T_2 | _T_6; // @[el2_dec_dec_ctl.scala 72:39]
  wire  _T_9 = ~io_ins[5]; // @[el2_dec_dec_ctl.scala 72:68]
  wire  _T_11 = _T_9 & io_ins[4]; // @[el2_dec_dec_ctl.scala 72:78]
  wire  _T_14 = ~io_ins[14]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_16 = ~io_ins[13]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_18 = ~io_ins[2]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_19 = _T_14 & _T_16; // @[el2_dec_dec_ctl.scala 73:51]
  wire  _T_20 = _T_19 & _T_18; // @[el2_dec_dec_ctl.scala 73:51]
  wire  _T_26 = _T_16 & io_ins[11]; // @[el2_dec_dec_ctl.scala 73:90]
  wire  _T_27 = _T_26 & _T_18; // @[el2_dec_dec_ctl.scala 73:90]
  wire  _T_28 = _T_20 | _T_27; // @[el2_dec_dec_ctl.scala 73:55]
  wire  _T_33 = io_ins[19] & io_ins[13]; // @[el2_dec_dec_ctl.scala 74:37]
  wire  _T_34 = _T_33 & _T_18; // @[el2_dec_dec_ctl.scala 74:37]
  wire  _T_35 = _T_28 | _T_34; // @[el2_dec_dec_ctl.scala 73:94]
  wire  _T_41 = _T_16 & io_ins[10]; // @[el2_dec_dec_ctl.scala 74:76]
  wire  _T_42 = _T_41 & _T_18; // @[el2_dec_dec_ctl.scala 74:76]
  wire  _T_43 = _T_35 | _T_42; // @[el2_dec_dec_ctl.scala 74:41]
  wire  _T_45 = ~io_ins[18]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_49 = _T_45 & io_ins[13]; // @[el2_dec_dec_ctl.scala 75:38]
  wire  _T_50 = _T_49 & _T_18; // @[el2_dec_dec_ctl.scala 75:38]
  wire  _T_51 = _T_43 | _T_50; // @[el2_dec_dec_ctl.scala 74:80]
  wire  _T_57 = _T_16 & io_ins[9]; // @[el2_dec_dec_ctl.scala 75:76]
  wire  _T_58 = _T_57 & _T_18; // @[el2_dec_dec_ctl.scala 75:76]
  wire  _T_59 = _T_51 | _T_58; // @[el2_dec_dec_ctl.scala 75:42]
  wire  _T_64 = io_ins[17] & io_ins[13]; // @[el2_dec_dec_ctl.scala 76:37]
  wire  _T_65 = _T_64 & _T_18; // @[el2_dec_dec_ctl.scala 76:37]
  wire  _T_66 = _T_59 | _T_65; // @[el2_dec_dec_ctl.scala 75:80]
  wire  _T_72 = _T_16 & io_ins[8]; // @[el2_dec_dec_ctl.scala 76:75]
  wire  _T_73 = _T_72 & _T_18; // @[el2_dec_dec_ctl.scala 76:75]
  wire  _T_74 = _T_66 | _T_73; // @[el2_dec_dec_ctl.scala 76:41]
  wire  _T_79 = io_ins[16] & io_ins[13]; // @[el2_dec_dec_ctl.scala 77:37]
  wire  _T_80 = _T_79 & _T_18; // @[el2_dec_dec_ctl.scala 77:37]
  wire  _T_81 = _T_74 | _T_80; // @[el2_dec_dec_ctl.scala 76:79]
  wire  _T_87 = _T_16 & io_ins[7]; // @[el2_dec_dec_ctl.scala 77:75]
  wire  _T_88 = _T_87 & _T_18; // @[el2_dec_dec_ctl.scala 77:75]
  wire  _T_89 = _T_81 | _T_88; // @[el2_dec_dec_ctl.scala 77:41]
  wire  _T_94 = io_ins[15] & io_ins[13]; // @[el2_dec_dec_ctl.scala 78:37]
  wire  _T_95 = _T_94 & _T_18; // @[el2_dec_dec_ctl.scala 78:37]
  wire  _T_96 = _T_89 | _T_95; // @[el2_dec_dec_ctl.scala 77:79]
  wire  _T_98 = ~io_ins[4]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_100 = ~io_ins[3]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_101 = _T_98 & _T_100; // @[el2_dec_dec_ctl.scala 78:71]
  wire  _T_102 = _T_96 | _T_101; // @[el2_dec_dec_ctl.scala 78:41]
  wire  _T_104 = ~io_ins[6]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_107 = _T_104 & _T_18; // @[el2_dec_dec_ctl.scala 78:106]
  wire  _T_114 = io_ins[5] & _T_98; // @[el2_dec_dec_ctl.scala 79:48]
  wire  _T_115 = _T_114 & _T_18; // @[el2_dec_dec_ctl.scala 79:48]
  wire  _T_121 = _T_104 & io_ins[5]; // @[el2_dec_dec_ctl.scala 79:85]
  wire  _T_122 = _T_121 & _T_18; // @[el2_dec_dec_ctl.scala 79:85]
  wire  _T_130 = _T_101 & io_ins[2]; // @[el2_dec_dec_ctl.scala 80:50]
  wire  _T_137 = io_ins[13] & _T_9; // @[el2_dec_dec_ctl.scala 80:90]
  wire  _T_138 = _T_137 & io_ins[4]; // @[el2_dec_dec_ctl.scala 80:90]
  wire  _T_139 = _T_138 & _T_18; // @[el2_dec_dec_ctl.scala 80:90]
  wire  _T_140 = _T_130 | _T_139; // @[el2_dec_dec_ctl.scala 80:54]
  wire  _T_144 = ~io_ins[12]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_147 = _T_16 & _T_144; // @[el2_dec_dec_ctl.scala 81:40]
  wire  _T_148 = _T_147 & io_ins[6]; // @[el2_dec_dec_ctl.scala 81:40]
  wire  _T_149 = _T_148 & io_ins[4]; // @[el2_dec_dec_ctl.scala 81:40]
  wire  _T_150 = _T_140 | _T_149; // @[el2_dec_dec_ctl.scala 80:94]
  wire  _T_158 = _T_144 & _T_9; // @[el2_dec_dec_ctl.scala 81:81]
  wire  _T_159 = _T_158 & io_ins[4]; // @[el2_dec_dec_ctl.scala 81:81]
  wire  _T_160 = _T_159 & _T_18; // @[el2_dec_dec_ctl.scala 81:81]
  wire  _T_166 = _T_9 & _T_18; // @[el2_dec_dec_ctl.scala 82:28]
  wire  _T_169 = io_ins[5] & io_ins[2]; // @[el2_dec_dec_ctl.scala 82:55]
  wire  _T_170 = _T_166 | _T_169; // @[el2_dec_dec_ctl.scala 82:42]
  wire  _T_181 = _T_16 & io_ins[12]; // @[el2_dec_dec_ctl.scala 83:58]
  wire  _T_182 = _T_181 & _T_9; // @[el2_dec_dec_ctl.scala 83:58]
  wire  _T_183 = _T_182 & io_ins[4]; // @[el2_dec_dec_ctl.scala 83:58]
  wire  _T_187 = io_ins[5] & io_ins[3]; // @[el2_dec_dec_ctl.scala 84:29]
  wire  _T_190 = io_ins[4] & io_ins[2]; // @[el2_dec_dec_ctl.scala 84:53]
  wire  _T_196 = _T_9 & _T_100; // @[el2_dec_dec_ctl.scala 85:28]
  wire  _T_198 = _T_196 & io_ins[2]; // @[el2_dec_dec_ctl.scala 85:41]
  wire  _T_209 = _T_9 & _T_98; // @[el2_dec_dec_ctl.scala 86:50]
  wire  _T_224 = _T_104 & _T_98; // @[el2_dec_dec_ctl.scala 88:49]
  wire  _T_236 = _T_19 & _T_144; // @[el2_dec_dec_ctl.scala 89:57]
  wire  _T_237 = _T_236 & _T_9; // @[el2_dec_dec_ctl.scala 89:57]
  wire  _T_238 = _T_237 & io_ins[4]; // @[el2_dec_dec_ctl.scala 89:57]
  wire  _T_246 = _T_238 | _T_198; // @[el2_dec_dec_ctl.scala 89:61]
  wire  _T_248 = ~io_ins[30]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_262 = _T_248 & _T_4; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_263 = _T_262 & _T_14; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_264 = _T_263 & _T_16; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_265 = _T_264 & _T_144; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_266 = _T_265 & _T_104; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_267 = _T_266 & io_ins[4]; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_268 = _T_267 & _T_18; // @[el2_dec_dec_ctl.scala 90:56]
  wire  _T_279 = io_ins[30] & _T_144; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_280 = _T_279 & _T_104; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_281 = _T_280 & io_ins[5]; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_282 = _T_281 & io_ins[4]; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_283 = _T_282 & _T_18; // @[el2_dec_dec_ctl.scala 91:57]
  wire  _T_294 = _T_4 & _T_14; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_295 = _T_294 & io_ins[13]; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_296 = _T_295 & _T_104; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_297 = _T_296 & io_ins[4]; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_298 = _T_297 & _T_18; // @[el2_dec_dec_ctl.scala 91:105]
  wire  _T_299 = _T_283 | _T_298; // @[el2_dec_dec_ctl.scala 91:61]
  wire  _T_308 = _T_14 & io_ins[13]; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_309 = _T_308 & _T_9; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_310 = _T_309 & io_ins[4]; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_311 = _T_310 & _T_18; // @[el2_dec_dec_ctl.scala 92:43]
  wire  _T_312 = _T_299 | _T_311; // @[el2_dec_dec_ctl.scala 91:109]
  wire  _T_318 = io_ins[6] & _T_98; // @[el2_dec_dec_ctl.scala 92:80]
  wire  _T_319 = _T_318 & _T_18; // @[el2_dec_dec_ctl.scala 92:80]
  wire  _T_328 = io_ins[14] & io_ins[13]; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_329 = _T_328 & io_ins[12]; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_330 = _T_329 & _T_9; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_331 = _T_330 & _T_18; // @[el2_dec_dec_ctl.scala 93:56]
  wire  _T_341 = _T_4 & io_ins[14]; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_342 = _T_341 & io_ins[13]; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_343 = _T_342 & io_ins[12]; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_344 = _T_343 & _T_104; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_345 = _T_344 & _T_18; // @[el2_dec_dec_ctl.scala 93:104]
  wire  _T_350 = _T_104 & io_ins[3]; // @[el2_dec_dec_ctl.scala 94:45]
  wire  _T_363 = _T_342 & _T_144; // @[el2_dec_dec_ctl.scala 94:94]
  wire  _T_364 = _T_363 & _T_104; // @[el2_dec_dec_ctl.scala 94:94]
  wire  _T_365 = _T_364 & _T_18; // @[el2_dec_dec_ctl.scala 94:94]
  wire  _T_366 = _T_350 | _T_365; // @[el2_dec_dec_ctl.scala 94:49]
  wire  _T_370 = io_ins[5] & io_ins[4]; // @[el2_dec_dec_ctl.scala 95:34]
  wire  _T_371 = _T_370 & io_ins[2]; // @[el2_dec_dec_ctl.scala 95:34]
  wire  _T_372 = _T_366 | _T_371; // @[el2_dec_dec_ctl.scala 94:98]
  wire  _T_382 = _T_372 | _T_149; // @[el2_dec_dec_ctl.scala 95:38]
  wire  _T_392 = _T_328 & _T_144; // @[el2_dec_dec_ctl.scala 96:44]
  wire  _T_393 = _T_392 & _T_9; // @[el2_dec_dec_ctl.scala 96:44]
  wire  _T_394 = _T_393 & _T_18; // @[el2_dec_dec_ctl.scala 96:44]
  wire  _T_407 = _T_341 & _T_16; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_408 = _T_407 & _T_144; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_409 = _T_408 & io_ins[4]; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_410 = _T_409 & _T_18; // @[el2_dec_dec_ctl.scala 97:61]
  wire  _T_421 = io_ins[14] & _T_16; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_422 = _T_421 & _T_144; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_423 = _T_422 & _T_9; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_424 = _T_423 & io_ins[4]; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_425 = _T_424 & _T_18; // @[el2_dec_dec_ctl.scala 97:109]
  wire  _T_440 = _T_294 & _T_16; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_441 = _T_440 & io_ins[12]; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_442 = _T_441 & _T_104; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_443 = _T_442 & io_ins[4]; // @[el2_dec_dec_ctl.scala 98:63]
  wire  _T_454 = io_ins[30] & _T_16; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_455 = _T_454 & io_ins[12]; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_456 = _T_455 & _T_104; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_457 = _T_456 & io_ins[4]; // @[el2_dec_dec_ctl.scala 99:58]
  wire  _T_473 = _T_262 & io_ins[14]; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_474 = _T_473 & _T_16; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_475 = _T_474 & io_ins[12]; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_476 = _T_475 & _T_104; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_477 = _T_476 & io_ins[4]; // @[el2_dec_dec_ctl.scala 100:66]
  wire  _T_492 = _T_295 & io_ins[12]; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_493 = _T_492 & _T_104; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_494 = _T_493 & io_ins[4]; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_495 = _T_494 & _T_18; // @[el2_dec_dec_ctl.scala 101:62]
  wire  _T_518 = _T_308 & io_ins[12]; // @[el2_dec_dec_ctl.scala 102:59]
  wire  _T_519 = _T_518 & _T_9; // @[el2_dec_dec_ctl.scala 102:59]
  wire  _T_520 = _T_519 & _T_18; // @[el2_dec_dec_ctl.scala 102:59]
  wire  _T_527 = io_ins[13] & io_ins[6]; // @[el2_dec_dec_ctl.scala 102:99]
  wire  _T_528 = _T_527 & _T_98; // @[el2_dec_dec_ctl.scala 102:99]
  wire  _T_529 = _T_528 & _T_18; // @[el2_dec_dec_ctl.scala 102:99]
  wire  _T_530 = _T_520 | _T_529; // @[el2_dec_dec_ctl.scala 102:63]
  wire  _T_536 = io_ins[14] & _T_9; // @[el2_dec_dec_ctl.scala 103:37]
  wire  _T_537 = _T_536 & _T_98; // @[el2_dec_dec_ctl.scala 103:37]
  wire  _T_538 = _T_530 | _T_537; // @[el2_dec_dec_ctl.scala 102:103]
  wire  _T_553 = _T_493 & _T_18; // @[el2_dec_dec_ctl.scala 103:86]
  wire  _T_554 = _T_538 | _T_553; // @[el2_dec_dec_ctl.scala 103:41]
  wire  _T_563 = io_ins[25] & io_ins[14]; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_564 = _T_563 & io_ins[12]; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_565 = _T_564 & _T_104; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_566 = _T_565 & io_ins[5]; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_567 = _T_566 & _T_18; // @[el2_dec_dec_ctl.scala 104:45]
  wire  _T_585 = _T_14 & _T_144; // @[el2_dec_dec_ctl.scala 106:56]
  wire  _T_586 = _T_585 & io_ins[6]; // @[el2_dec_dec_ctl.scala 106:56]
  wire  _T_587 = _T_586 & _T_98; // @[el2_dec_dec_ctl.scala 106:56]
  wire  _T_597 = _T_14 & io_ins[12]; // @[el2_dec_dec_ctl.scala 107:55]
  wire  _T_598 = _T_597 & io_ins[6]; // @[el2_dec_dec_ctl.scala 107:55]
  wire  _T_599 = _T_598 & _T_98; // @[el2_dec_dec_ctl.scala 107:55]
  wire  _T_608 = io_ins[14] & io_ins[12]; // @[el2_dec_dec_ctl.scala 108:54]
  wire  _T_609 = _T_608 & io_ins[5]; // @[el2_dec_dec_ctl.scala 108:54]
  wire  _T_610 = _T_609 & _T_98; // @[el2_dec_dec_ctl.scala 108:54]
  wire  _T_620 = io_ins[14] & _T_144; // @[el2_dec_dec_ctl.scala 109:55]
  wire  _T_621 = _T_620 & io_ins[5]; // @[el2_dec_dec_ctl.scala 109:55]
  wire  _T_622 = _T_621 & _T_98; // @[el2_dec_dec_ctl.scala 109:55]
  wire  _T_638 = _T_147 & _T_104; // @[el2_dec_dec_ctl.scala 111:56]
  wire  _T_639 = _T_638 & _T_98; // @[el2_dec_dec_ctl.scala 111:56]
  wire  _T_648 = io_ins[12] & _T_104; // @[el2_dec_dec_ctl.scala 112:53]
  wire  _T_649 = _T_648 & _T_98; // @[el2_dec_dec_ctl.scala 112:53]
  wire  _T_656 = io_ins[13] & _T_104; // @[el2_dec_dec_ctl.scala 113:50]
  wire  _T_662 = _T_527 & io_ins[4]; // @[el2_dec_dec_ctl.scala 114:52]
  wire  _T_666 = io_ins[7] & io_ins[6]; // @[el2_dec_dec_ctl.scala 114:87]
  wire  _T_667 = _T_666 & io_ins[4]; // @[el2_dec_dec_ctl.scala 114:87]
  wire  _T_668 = _T_662 | _T_667; // @[el2_dec_dec_ctl.scala 114:56]
  wire  _T_672 = io_ins[8] & io_ins[6]; // @[el2_dec_dec_ctl.scala 115:34]
  wire  _T_673 = _T_672 & io_ins[4]; // @[el2_dec_dec_ctl.scala 115:34]
  wire  _T_674 = _T_668 | _T_673; // @[el2_dec_dec_ctl.scala 114:91]
  wire  _T_678 = io_ins[9] & io_ins[6]; // @[el2_dec_dec_ctl.scala 115:69]
  wire  _T_679 = _T_678 & io_ins[4]; // @[el2_dec_dec_ctl.scala 115:69]
  wire  _T_680 = _T_674 | _T_679; // @[el2_dec_dec_ctl.scala 115:38]
  wire  _T_684 = io_ins[10] & io_ins[6]; // @[el2_dec_dec_ctl.scala 115:105]
  wire  _T_685 = _T_684 & io_ins[4]; // @[el2_dec_dec_ctl.scala 115:105]
  wire  _T_686 = _T_680 | _T_685; // @[el2_dec_dec_ctl.scala 115:73]
  wire  _T_690 = io_ins[11] & io_ins[6]; // @[el2_dec_dec_ctl.scala 116:35]
  wire  _T_691 = _T_690 & io_ins[4]; // @[el2_dec_dec_ctl.scala 116:35]
  wire  _T_699 = _T_94 & io_ins[12]; // @[el2_dec_dec_ctl.scala 117:57]
  wire  _T_700 = _T_699 & io_ins[6]; // @[el2_dec_dec_ctl.scala 117:57]
  wire  _T_701 = _T_700 & io_ins[4]; // @[el2_dec_dec_ctl.scala 117:57]
  wire  _T_708 = _T_79 & io_ins[12]; // @[el2_dec_dec_ctl.scala 117:99]
  wire  _T_709 = _T_708 & io_ins[6]; // @[el2_dec_dec_ctl.scala 117:99]
  wire  _T_710 = _T_709 & io_ins[4]; // @[el2_dec_dec_ctl.scala 117:99]
  wire  _T_711 = _T_701 | _T_710; // @[el2_dec_dec_ctl.scala 117:61]
  wire  _T_718 = _T_64 & io_ins[12]; // @[el2_dec_dec_ctl.scala 118:41]
  wire  _T_719 = _T_718 & io_ins[6]; // @[el2_dec_dec_ctl.scala 118:41]
  wire  _T_720 = _T_719 & io_ins[4]; // @[el2_dec_dec_ctl.scala 118:41]
  wire  _T_721 = _T_711 | _T_720; // @[el2_dec_dec_ctl.scala 117:103]
  wire  _T_727 = io_ins[18] & _T_144; // @[el2_dec_dec_ctl.scala 118:81]
  wire  _T_728 = _T_727 & io_ins[6]; // @[el2_dec_dec_ctl.scala 118:81]
  wire  _T_729 = _T_728 & io_ins[4]; // @[el2_dec_dec_ctl.scala 118:81]
  wire  _T_730 = _T_721 | _T_729; // @[el2_dec_dec_ctl.scala 118:45]
  wire  _T_736 = io_ins[19] & _T_144; // @[el2_dec_dec_ctl.scala 119:39]
  wire  _T_737 = _T_736 & io_ins[6]; // @[el2_dec_dec_ctl.scala 119:39]
  wire  _T_738 = _T_737 & io_ins[4]; // @[el2_dec_dec_ctl.scala 119:39]
  wire  _T_746 = _T_181 & io_ins[6]; // @[el2_dec_dec_ctl.scala 120:57]
  wire  _T_754 = _T_421 & io_ins[6]; // @[el2_dec_dec_ctl.scala 121:55]
  wire  _T_755 = _T_754 & io_ins[4]; // @[el2_dec_dec_ctl.scala 121:55]
  wire  _T_760 = io_ins[15] & io_ins[14]; // @[el2_dec_dec_ctl.scala 121:94]
  wire  _T_761 = _T_760 & io_ins[6]; // @[el2_dec_dec_ctl.scala 121:94]
  wire  _T_762 = _T_761 & io_ins[4]; // @[el2_dec_dec_ctl.scala 121:94]
  wire  _T_763 = _T_755 | _T_762; // @[el2_dec_dec_ctl.scala 121:59]
  wire  _T_768 = io_ins[16] & io_ins[14]; // @[el2_dec_dec_ctl.scala 122:38]
  wire  _T_769 = _T_768 & io_ins[6]; // @[el2_dec_dec_ctl.scala 122:38]
  wire  _T_770 = _T_769 & io_ins[4]; // @[el2_dec_dec_ctl.scala 122:38]
  wire  _T_771 = _T_763 | _T_770; // @[el2_dec_dec_ctl.scala 121:98]
  wire  _T_776 = io_ins[17] & io_ins[14]; // @[el2_dec_dec_ctl.scala 122:77]
  wire  _T_777 = _T_776 & io_ins[6]; // @[el2_dec_dec_ctl.scala 122:77]
  wire  _T_778 = _T_777 & io_ins[4]; // @[el2_dec_dec_ctl.scala 122:77]
  wire  _T_779 = _T_771 | _T_778; // @[el2_dec_dec_ctl.scala 122:42]
  wire  _T_784 = io_ins[18] & io_ins[14]; // @[el2_dec_dec_ctl.scala 123:38]
  wire  _T_785 = _T_784 & io_ins[6]; // @[el2_dec_dec_ctl.scala 123:38]
  wire  _T_786 = _T_785 & io_ins[4]; // @[el2_dec_dec_ctl.scala 123:38]
  wire  _T_787 = _T_779 | _T_786; // @[el2_dec_dec_ctl.scala 122:81]
  wire  _T_792 = io_ins[19] & io_ins[14]; // @[el2_dec_dec_ctl.scala 123:77]
  wire  _T_793 = _T_792 & io_ins[6]; // @[el2_dec_dec_ctl.scala 123:77]
  wire  _T_794 = _T_793 & io_ins[4]; // @[el2_dec_dec_ctl.scala 123:77]
  wire  _T_801 = io_ins[15] & _T_144; // @[el2_dec_dec_ctl.scala 124:55]
  wire  _T_802 = _T_801 & io_ins[6]; // @[el2_dec_dec_ctl.scala 124:55]
  wire  _T_803 = _T_802 & io_ins[4]; // @[el2_dec_dec_ctl.scala 124:55]
  wire  _T_809 = io_ins[16] & _T_144; // @[el2_dec_dec_ctl.scala 124:95]
  wire  _T_810 = _T_809 & io_ins[6]; // @[el2_dec_dec_ctl.scala 124:95]
  wire  _T_811 = _T_810 & io_ins[4]; // @[el2_dec_dec_ctl.scala 124:95]
  wire  _T_812 = _T_803 | _T_811; // @[el2_dec_dec_ctl.scala 124:59]
  wire  _T_818 = io_ins[17] & _T_144; // @[el2_dec_dec_ctl.scala 125:39]
  wire  _T_819 = _T_818 & io_ins[6]; // @[el2_dec_dec_ctl.scala 125:39]
  wire  _T_820 = _T_819 & io_ins[4]; // @[el2_dec_dec_ctl.scala 125:39]
  wire  _T_821 = _T_812 | _T_820; // @[el2_dec_dec_ctl.scala 124:99]
  wire  _T_830 = _T_821 | _T_729; // @[el2_dec_dec_ctl.scala 125:43]
  wire  _T_841 = ~io_ins[22]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_849 = _T_841 & io_ins[20]; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_850 = _T_849 & _T_16; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_851 = _T_850 & _T_144; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_852 = _T_851 & io_ins[6]; // @[el2_dec_dec_ctl.scala 127:62]
  wire  _T_855 = ~io_ins[21]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_857 = ~io_ins[20]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_864 = _T_855 & _T_857; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_865 = _T_864 & _T_16; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_866 = _T_865 & _T_144; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_867 = _T_866 & io_ins[6]; // @[el2_dec_dec_ctl.scala 128:62]
  wire  _T_876 = io_ins[29] & _T_16; // @[el2_dec_dec_ctl.scala 129:56]
  wire  _T_877 = _T_876 & _T_144; // @[el2_dec_dec_ctl.scala 129:56]
  wire  _T_878 = _T_877 & io_ins[6]; // @[el2_dec_dec_ctl.scala 129:56]
  wire  _T_889 = io_ins[25] & _T_14; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_890 = _T_889 & _T_104; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_891 = _T_890 & io_ins[5]; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_892 = _T_891 & io_ins[4]; // @[el2_dec_dec_ctl.scala 130:57]
  wire  _T_907 = _T_889 & io_ins[13]; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_908 = _T_907 & _T_144; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_909 = _T_908 & _T_104; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_910 = _T_909 & io_ins[5]; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_911 = _T_910 & io_ins[4]; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_912 = _T_911 & _T_18; // @[el2_dec_dec_ctl.scala 131:69]
  wire  _T_925 = _T_889 & _T_16; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_926 = _T_925 & io_ins[12]; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_927 = _T_926 & _T_104; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_928 = _T_927 & io_ins[4]; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_929 = _T_928 & _T_18; // @[el2_dec_dec_ctl.scala 132:50]
  wire  _T_961 = _T_925 & _T_144; // @[el2_dec_dec_ctl.scala 134:62]
  wire  _T_962 = _T_961 & io_ins[5]; // @[el2_dec_dec_ctl.scala 134:62]
  wire  _T_963 = _T_962 & io_ins[4]; // @[el2_dec_dec_ctl.scala 134:62]
  wire  _T_973 = _T_563 & _T_104; // @[el2_dec_dec_ctl.scala 135:54]
  wire  _T_974 = _T_973 & io_ins[5]; // @[el2_dec_dec_ctl.scala 135:54]
  wire  _T_985 = _T_563 & io_ins[13]; // @[el2_dec_dec_ctl.scala 136:57]
  wire  _T_986 = _T_985 & _T_104; // @[el2_dec_dec_ctl.scala 136:57]
  wire  _T_987 = _T_986 & io_ins[5]; // @[el2_dec_dec_ctl.scala 136:57]
  wire  _T_992 = _T_9 & io_ins[3]; // @[el2_dec_dec_ctl.scala 137:47]
  wire  _T_997 = io_ins[12] & _T_9; // @[el2_dec_dec_ctl.scala 138:52]
  wire  _T_998 = _T_997 & io_ins[3]; // @[el2_dec_dec_ctl.scala 138:52]
  wire  _T_1006 = io_ins[28] & io_ins[22]; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1007 = _T_1006 & _T_16; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1008 = _T_1007 & _T_144; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1009 = _T_1008 & io_ins[4]; // @[el2_dec_dec_ctl.scala 139:59]
  wire  _T_1013 = _T_1009 | _T_190; // @[el2_dec_dec_ctl.scala 139:63]
  wire  _T_1019 = _T_4 & _T_104; // @[el2_dec_dec_ctl.scala 140:37]
  wire  _T_1020 = _T_1019 & io_ins[4]; // @[el2_dec_dec_ctl.scala 140:37]
  wire  _T_1021 = _T_1013 | _T_1020; // @[el2_dec_dec_ctl.scala 139:96]
  wire  _T_1037 = _T_87 & io_ins[6]; // @[el2_dec_dec_ctl.scala 141:88]
  wire  _T_1038 = _T_1037 & io_ins[4]; // @[el2_dec_dec_ctl.scala 141:88]
  wire  _T_1039 = _T_992 | _T_1038; // @[el2_dec_dec_ctl.scala 141:53]
  wire  _T_1046 = _T_72 & io_ins[6]; // @[el2_dec_dec_ctl.scala 142:38]
  wire  _T_1047 = _T_1046 & io_ins[4]; // @[el2_dec_dec_ctl.scala 142:38]
  wire  _T_1048 = _T_1039 | _T_1047; // @[el2_dec_dec_ctl.scala 141:92]
  wire  _T_1055 = _T_57 & io_ins[6]; // @[el2_dec_dec_ctl.scala 142:77]
  wire  _T_1056 = _T_1055 & io_ins[4]; // @[el2_dec_dec_ctl.scala 142:77]
  wire  _T_1057 = _T_1048 | _T_1056; // @[el2_dec_dec_ctl.scala 142:42]
  wire  _T_1066 = _T_1057 | _T_1056; // @[el2_dec_dec_ctl.scala 142:81]
  wire  _T_1073 = _T_41 & io_ins[6]; // @[el2_dec_dec_ctl.scala 143:78]
  wire  _T_1074 = _T_1073 & io_ins[4]; // @[el2_dec_dec_ctl.scala 143:78]
  wire  _T_1075 = _T_1066 | _T_1074; // @[el2_dec_dec_ctl.scala 143:42]
  wire  _T_1082 = _T_26 & io_ins[6]; // @[el2_dec_dec_ctl.scala 144:39]
  wire  _T_1083 = _T_1082 & io_ins[4]; // @[el2_dec_dec_ctl.scala 144:39]
  wire  _T_1084 = _T_1075 | _T_1083; // @[el2_dec_dec_ctl.scala 143:82]
  wire  _T_1090 = _T_94 & io_ins[6]; // @[el2_dec_dec_ctl.scala 144:78]
  wire  _T_1091 = _T_1090 & io_ins[4]; // @[el2_dec_dec_ctl.scala 144:78]
  wire  _T_1092 = _T_1084 | _T_1091; // @[el2_dec_dec_ctl.scala 144:43]
  wire  _T_1098 = _T_79 & io_ins[6]; // @[el2_dec_dec_ctl.scala 145:38]
  wire  _T_1099 = _T_1098 & io_ins[4]; // @[el2_dec_dec_ctl.scala 145:38]
  wire  _T_1100 = _T_1092 | _T_1099; // @[el2_dec_dec_ctl.scala 144:82]
  wire  _T_1106 = _T_64 & io_ins[6]; // @[el2_dec_dec_ctl.scala 145:77]
  wire  _T_1107 = _T_1106 & io_ins[4]; // @[el2_dec_dec_ctl.scala 145:77]
  wire  _T_1108 = _T_1100 | _T_1107; // @[el2_dec_dec_ctl.scala 145:42]
  wire  _T_1113 = io_ins[18] & io_ins[13]; // @[el2_dec_dec_ctl.scala 146:38]
  wire  _T_1114 = _T_1113 & io_ins[6]; // @[el2_dec_dec_ctl.scala 146:38]
  wire  _T_1115 = _T_1114 & io_ins[4]; // @[el2_dec_dec_ctl.scala 146:38]
  wire  _T_1116 = _T_1108 | _T_1115; // @[el2_dec_dec_ctl.scala 145:81]
  wire  _T_1122 = _T_33 & io_ins[6]; // @[el2_dec_dec_ctl.scala 146:77]
  wire  _T_1123 = _T_1122 & io_ins[4]; // @[el2_dec_dec_ctl.scala 146:77]
  wire  _T_1139 = _T_841 & _T_16; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1140 = _T_1139 & _T_144; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1141 = _T_1140 & io_ins[6]; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1142 = _T_1141 & io_ins[4]; // @[el2_dec_dec_ctl.scala 147:98]
  wire  _T_1143 = _T_998 | _T_1142; // @[el2_dec_dec_ctl.scala 147:57]
  wire  _T_1152 = _T_1143 | _T_1038; // @[el2_dec_dec_ctl.scala 147:102]
  wire  _T_1161 = _T_1152 | _T_1047; // @[el2_dec_dec_ctl.scala 148:42]
  wire  _T_1170 = _T_1161 | _T_1056; // @[el2_dec_dec_ctl.scala 148:81]
  wire  _T_1179 = _T_1170 | _T_1074; // @[el2_dec_dec_ctl.scala 149:42]
  wire  _T_1188 = _T_1179 | _T_1083; // @[el2_dec_dec_ctl.scala 149:82]
  wire  _T_1196 = _T_1188 | _T_1091; // @[el2_dec_dec_ctl.scala 150:43]
  wire  _T_1204 = _T_1196 | _T_1099; // @[el2_dec_dec_ctl.scala 150:82]
  wire  _T_1212 = _T_1204 | _T_1107; // @[el2_dec_dec_ctl.scala 151:42]
  wire  _T_1220 = _T_1212 | _T_1115; // @[el2_dec_dec_ctl.scala 151:81]
  wire  _T_1230 = ~io_ins[31]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1236 = ~io_ins[27]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1238 = ~io_ins[26]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1242 = ~io_ins[24]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1244 = ~io_ins[23]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1251 = ~io_ins[19]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1255 = ~io_ins[17]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1257 = ~io_ins[16]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1259 = ~io_ins[15]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1263 = ~io_ins[11]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1265 = ~io_ins[10]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1267 = ~io_ins[9]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1269 = ~io_ins[8]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1271 = ~io_ins[7]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1281 = ~io_ins[0]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1282 = _T_1230 & _T_248; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1283 = _T_1282 & io_ins[29]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1284 = _T_1283 & io_ins[28]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1285 = _T_1284 & _T_1236; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1286 = _T_1285 & _T_1238; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1287 = _T_1286 & _T_4; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1288 = _T_1287 & _T_1242; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1289 = _T_1288 & _T_1244; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1290 = _T_1289 & _T_841; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1291 = _T_1290 & io_ins[21]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1292 = _T_1291 & _T_857; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1293 = _T_1292 & _T_1251; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1294 = _T_1293 & _T_45; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1295 = _T_1294 & _T_1255; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1296 = _T_1295 & _T_1257; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1297 = _T_1296 & _T_1259; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1298 = _T_1297 & _T_14; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1299 = _T_1298 & _T_1263; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1300 = _T_1299 & _T_1265; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1301 = _T_1300 & _T_1267; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1302 = _T_1301 & _T_1269; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1303 = _T_1302 & _T_1271; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1304 = _T_1303 & io_ins[6]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1305 = _T_1304 & io_ins[5]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1306 = _T_1305 & io_ins[4]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1307 = _T_1306 & _T_100; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1308 = _T_1307 & _T_18; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1309 = _T_1308 & io_ins[1]; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1310 = _T_1309 & _T_1281; // @[el2_dec_dec_ctl.scala 153:144]
  wire  _T_1316 = ~io_ins[29]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1365 = _T_1282 & _T_1316; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1366 = _T_1365 & io_ins[28]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1367 = _T_1366 & _T_1236; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1368 = _T_1367 & _T_1238; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1369 = _T_1368 & _T_4; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1370 = _T_1369 & _T_1242; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1371 = _T_1370 & _T_1244; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1372 = _T_1371 & io_ins[22]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1373 = _T_1372 & _T_855; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1374 = _T_1373 & io_ins[20]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1375 = _T_1374 & _T_1251; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1376 = _T_1375 & _T_45; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1377 = _T_1376 & _T_1255; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1378 = _T_1377 & _T_1257; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1379 = _T_1378 & _T_1259; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1380 = _T_1379 & _T_14; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1381 = _T_1380 & _T_1263; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1382 = _T_1381 & _T_1265; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1383 = _T_1382 & _T_1267; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1384 = _T_1383 & _T_1269; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1385 = _T_1384 & _T_1271; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1386 = _T_1385 & io_ins[6]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1387 = _T_1386 & io_ins[5]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1388 = _T_1387 & io_ins[4]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1389 = _T_1388 & _T_100; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1390 = _T_1389 & _T_18; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1391 = _T_1390 & io_ins[1]; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1392 = _T_1391 & _T_1281; // @[el2_dec_dec_ctl.scala 154:130]
  wire  _T_1393 = _T_1310 | _T_1392; // @[el2_dec_dec_ctl.scala 153:148]
  wire  _T_1401 = ~io_ins[28]; // @[el2_dec_dec_ctl.scala 67:45]
  wire  _T_1449 = _T_1365 & _T_1401; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1450 = _T_1449 & _T_1236; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1451 = _T_1450 & _T_1238; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1452 = _T_1451 & _T_4; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1453 = _T_1452 & _T_1242; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1454 = _T_1453 & _T_1244; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1455 = _T_1454 & _T_841; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1456 = _T_1455 & _T_855; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1457 = _T_1456 & _T_1251; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1458 = _T_1457 & _T_45; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1459 = _T_1458 & _T_1255; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1460 = _T_1459 & _T_1257; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1461 = _T_1460 & _T_1259; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1462 = _T_1461 & _T_14; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1463 = _T_1462 & _T_1263; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1464 = _T_1463 & _T_1265; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1465 = _T_1464 & _T_1267; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1466 = _T_1465 & _T_1269; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1467 = _T_1466 & _T_1271; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1468 = _T_1467 & io_ins[5]; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1469 = _T_1468 & io_ins[4]; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1470 = _T_1469 & _T_100; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1471 = _T_1470 & _T_18; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1472 = _T_1471 & io_ins[1]; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1473 = _T_1472 & _T_1281; // @[el2_dec_dec_ctl.scala 155:127]
  wire  _T_1474 = _T_1393 | _T_1473; // @[el2_dec_dec_ctl.scala 154:134]
  wire  _T_1503 = _T_1452 & _T_104; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1504 = _T_1503 & io_ins[4]; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1505 = _T_1504 & _T_100; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1506 = _T_1505 & io_ins[1]; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1507 = _T_1506 & _T_1281; // @[el2_dec_dec_ctl.scala 156:68]
  wire  _T_1508 = _T_1474 | _T_1507; // @[el2_dec_dec_ctl.scala 155:131]
  wire  _T_1536 = _T_1230 & _T_1316; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1537 = _T_1536 & _T_1401; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1538 = _T_1537 & _T_1236; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1539 = _T_1538 & _T_1238; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1540 = _T_1539 & _T_4; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1541 = _T_1540 & _T_14; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1542 = _T_1541 & _T_16; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1543 = _T_1542 & _T_144; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1544 = _T_1543 & _T_104; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1545 = _T_1544 & _T_100; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1546 = _T_1545 & _T_18; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1547 = _T_1546 & io_ins[1]; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1548 = _T_1547 & _T_1281; // @[el2_dec_dec_ctl.scala 157:77]
  wire  _T_1549 = _T_1508 | _T_1548; // @[el2_dec_dec_ctl.scala 156:72]
  wire  _T_1579 = _T_1540 & io_ins[14]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1580 = _T_1579 & _T_16; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1581 = _T_1580 & io_ins[12]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1582 = _T_1581 & _T_104; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1583 = _T_1582 & io_ins[4]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1584 = _T_1583 & _T_100; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1585 = _T_1584 & io_ins[1]; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1586 = _T_1585 & _T_1281; // @[el2_dec_dec_ctl.scala 158:74]
  wire  _T_1587 = _T_1549 | _T_1586; // @[el2_dec_dec_ctl.scala 157:81]
  wire  _T_1614 = _T_1451 & _T_104; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1615 = _T_1614 & io_ins[5]; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1616 = _T_1615 & io_ins[4]; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1617 = _T_1616 & _T_100; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1618 = _T_1617 & io_ins[1]; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1619 = _T_1618 & _T_1281; // @[el2_dec_dec_ctl.scala 159:66]
  wire  _T_1620 = _T_1587 | _T_1619; // @[el2_dec_dec_ctl.scala 158:78]
  wire  _T_1638 = _T_236 & io_ins[6]; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1639 = _T_1638 & io_ins[5]; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1640 = _T_1639 & _T_98; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1641 = _T_1640 & _T_100; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1642 = _T_1641 & io_ins[1]; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1643 = _T_1642 & _T_1281; // @[el2_dec_dec_ctl.scala 160:54]
  wire  _T_1644 = _T_1620 | _T_1643; // @[el2_dec_dec_ctl.scala 159:70]
  wire  _T_1657 = io_ins[14] & io_ins[6]; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1658 = _T_1657 & io_ins[5]; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1659 = _T_1658 & _T_98; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1660 = _T_1659 & _T_100; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1661 = _T_1660 & _T_18; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1662 = _T_1661 & io_ins[1]; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1663 = _T_1662 & _T_1281; // @[el2_dec_dec_ctl.scala 161:48]
  wire  _T_1664 = _T_1644 | _T_1663; // @[el2_dec_dec_ctl.scala 160:58]
  wire  _T_1677 = _T_144 & _T_104; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1678 = _T_1677 & _T_9; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1679 = _T_1678 & io_ins[4]; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1680 = _T_1679 & _T_100; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1681 = _T_1680 & io_ins[1]; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1682 = _T_1681 & _T_1281; // @[el2_dec_dec_ctl.scala 162:47]
  wire  _T_1683 = _T_1664 | _T_1682; // @[el2_dec_dec_ctl.scala 161:52]
  wire  _T_1699 = _T_19 & io_ins[5]; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1700 = _T_1699 & _T_98; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1701 = _T_1700 & _T_100; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1702 = _T_1701 & _T_18; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1703 = _T_1702 & io_ins[1]; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1704 = _T_1703 & _T_1281; // @[el2_dec_dec_ctl.scala 162:99]
  wire  _T_1705 = _T_1683 | _T_1704; // @[el2_dec_dec_ctl.scala 162:51]
  wire  _T_1717 = io_ins[12] & io_ins[6]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1718 = _T_1717 & io_ins[5]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1719 = _T_1718 & io_ins[4]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1720 = _T_1719 & _T_100; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1721 = _T_1720 & _T_18; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1722 = _T_1721 & io_ins[1]; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1723 = _T_1722 & _T_1281; // @[el2_dec_dec_ctl.scala 163:47]
  wire  _T_1724 = _T_1705 | _T_1723; // @[el2_dec_dec_ctl.scala 162:103]
  wire  _T_1796 = _T_1456 & _T_857; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1797 = _T_1796 & _T_1251; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1798 = _T_1797 & _T_45; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1799 = _T_1798 & _T_1255; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1800 = _T_1799 & _T_1257; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1801 = _T_1800 & _T_1259; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1802 = _T_1801 & _T_14; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1803 = _T_1802 & _T_16; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1804 = _T_1803 & _T_144; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1805 = _T_1804 & _T_1263; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1806 = _T_1805 & _T_1265; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1807 = _T_1806 & _T_1267; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1808 = _T_1807 & _T_1269; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1809 = _T_1808 & _T_1271; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1810 = _T_1809 & _T_104; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1811 = _T_1810 & _T_9; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1812 = _T_1811 & _T_98; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1813 = _T_1812 & io_ins[3]; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1814 = _T_1813 & io_ins[2]; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1815 = _T_1814 & io_ins[1]; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1816 = _T_1815 & _T_1281; // @[el2_dec_dec_ctl.scala 164:142]
  wire  _T_1817 = _T_1724 | _T_1816; // @[el2_dec_dec_ctl.scala 163:51]
  wire  _T_1866 = _T_1449 & _T_1251; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1867 = _T_1866 & _T_45; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1868 = _T_1867 & _T_1255; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1869 = _T_1868 & _T_1257; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1870 = _T_1869 & _T_1259; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1871 = _T_1870 & _T_14; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1872 = _T_1871 & _T_16; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1873 = _T_1872 & _T_144; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1874 = _T_1873 & _T_1263; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1875 = _T_1874 & _T_1265; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1876 = _T_1875 & _T_1267; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1877 = _T_1876 & _T_1269; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1878 = _T_1877 & _T_1271; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1879 = _T_1878 & _T_104; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1880 = _T_1879 & _T_9; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1881 = _T_1880 & _T_98; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1882 = _T_1881 & io_ins[3]; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1883 = _T_1882 & io_ins[2]; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1884 = _T_1883 & io_ins[1]; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1885 = _T_1884 & _T_1281; // @[el2_dec_dec_ctl.scala 165:110]
  wire  _T_1886 = _T_1817 | _T_1885; // @[el2_dec_dec_ctl.scala 164:146]
  wire  _T_1902 = _T_16 & _T_104; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1903 = _T_1902 & _T_9; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1904 = _T_1903 & _T_98; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1905 = _T_1904 & _T_100; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1906 = _T_1905 & _T_18; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1907 = _T_1906 & io_ins[1]; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1908 = _T_1907 & _T_1281; // @[el2_dec_dec_ctl.scala 166:51]
  wire  _T_1909 = _T_1886 | _T_1908; // @[el2_dec_dec_ctl.scala 165:114]
  wire  _T_1919 = io_ins[6] & io_ins[5]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1920 = _T_1919 & _T_98; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1921 = _T_1920 & io_ins[3]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1922 = _T_1921 & io_ins[2]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1923 = _T_1922 & io_ins[1]; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1924 = _T_1923 & _T_1281; // @[el2_dec_dec_ctl.scala 166:95]
  wire  _T_1925 = _T_1909 | _T_1924; // @[el2_dec_dec_ctl.scala 166:55]
  wire  _T_1938 = _T_656 & _T_9; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1939 = _T_1938 & io_ins[4]; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1940 = _T_1939 & _T_100; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1941 = _T_1940 & io_ins[1]; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1942 = _T_1941 & _T_1281; // @[el2_dec_dec_ctl.scala 167:46]
  wire  _T_1943 = _T_1925 | _T_1942; // @[el2_dec_dec_ctl.scala 166:99]
  wire  _T_1960 = _T_585 & _T_104; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1961 = _T_1960 & _T_98; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1962 = _T_1961 & _T_100; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1963 = _T_1962 & _T_18; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1964 = _T_1963 & io_ins[1]; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1965 = _T_1964 & _T_1281; // @[el2_dec_dec_ctl.scala 167:99]
  wire  _T_1966 = _T_1943 | _T_1965; // @[el2_dec_dec_ctl.scala 167:50]
  wire  _T_1977 = _T_104 & io_ins[4]; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1978 = _T_1977 & _T_100; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1979 = _T_1978 & _T_18; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1980 = _T_1979 & io_ins[1]; // @[el2_dec_dec_ctl.scala 168:43]
  wire  _T_1981 = _T_1980 & _T_1281; // @[el2_dec_dec_ctl.scala 168:43]
  assign io_out_alu = _T_7 | _T_11; // @[el2_dec_dec_ctl.scala 72:14]
  assign io_out_rs1 = _T_102 | _T_107; // @[el2_dec_dec_ctl.scala 73:14]
  assign io_out_rs2 = _T_115 | _T_122; // @[el2_dec_dec_ctl.scala 79:14]
  assign io_out_imm12 = _T_150 | _T_160; // @[el2_dec_dec_ctl.scala 80:16]
  assign io_out_rd = _T_170 | io_ins[4]; // @[el2_dec_dec_ctl.scala 82:13]
  assign io_out_shimm5 = _T_183 & _T_18; // @[el2_dec_dec_ctl.scala 83:17]
  assign io_out_imm20 = _T_187 | _T_190; // @[el2_dec_dec_ctl.scala 84:16]
  assign io_out_pc = _T_198 | _T_187; // @[el2_dec_dec_ctl.scala 85:13]
  assign io_out_load = _T_209 & _T_18; // @[el2_dec_dec_ctl.scala 86:15]
  assign io_out_store = _T_121 & _T_98; // @[el2_dec_dec_ctl.scala 87:16]
  assign io_out_lsu = _T_224 & _T_18; // @[el2_dec_dec_ctl.scala 88:14]
  assign io_out_add = _T_246 | _T_268; // @[el2_dec_dec_ctl.scala 89:14]
  assign io_out_sub = _T_312 | _T_319; // @[el2_dec_dec_ctl.scala 91:14]
  assign io_out_land = _T_331 | _T_345; // @[el2_dec_dec_ctl.scala 93:15]
  assign io_out_lor = _T_382 | _T_394; // @[el2_dec_dec_ctl.scala 94:14]
  assign io_out_lxor = _T_410 | _T_425; // @[el2_dec_dec_ctl.scala 97:15]
  assign io_out_sll = _T_443 & _T_18; // @[el2_dec_dec_ctl.scala 98:14]
  assign io_out_sra = _T_457 & _T_18; // @[el2_dec_dec_ctl.scala 99:14]
  assign io_out_srl = _T_477 & _T_18; // @[el2_dec_dec_ctl.scala 100:14]
  assign io_out_slt = _T_495 | _T_311; // @[el2_dec_dec_ctl.scala 101:14]
  assign io_out_unsign = _T_554 | _T_567; // @[el2_dec_dec_ctl.scala 102:17]
  assign io_out_condbr = _T_318 & _T_18; // @[el2_dec_dec_ctl.scala 105:17]
  assign io_out_beq = _T_587 & _T_18; // @[el2_dec_dec_ctl.scala 106:14]
  assign io_out_bne = _T_599 & _T_18; // @[el2_dec_dec_ctl.scala 107:14]
  assign io_out_bge = _T_610 & _T_18; // @[el2_dec_dec_ctl.scala 108:14]
  assign io_out_blt = _T_622 & _T_18; // @[el2_dec_dec_ctl.scala 109:14]
  assign io_out_jal = io_ins[6] & io_ins[2]; // @[el2_dec_dec_ctl.scala 110:14]
  assign io_out_by = _T_639 & _T_18; // @[el2_dec_dec_ctl.scala 111:13]
  assign io_out_half = _T_649 & _T_18; // @[el2_dec_dec_ctl.scala 112:15]
  assign io_out_word = _T_656 & _T_98; // @[el2_dec_dec_ctl.scala 113:15]
  assign io_out_csr_read = _T_686 | _T_691; // @[el2_dec_dec_ctl.scala 114:19]
  assign io_out_csr_clr = _T_730 | _T_738; // @[el2_dec_dec_ctl.scala 117:18]
  assign io_out_csr_set = _T_830 | _T_738; // @[el2_dec_dec_ctl.scala 124:18]
  assign io_out_csr_write = _T_746 & io_ins[4]; // @[el2_dec_dec_ctl.scala 120:20]
  assign io_out_csr_imm = _T_787 | _T_794; // @[el2_dec_dec_ctl.scala 121:18]
  assign io_out_presync = _T_1116 | _T_1123; // @[el2_dec_dec_ctl.scala 141:18]
  assign io_out_postsync = _T_1220 | _T_1123; // @[el2_dec_dec_ctl.scala 147:19]
  assign io_out_ebreak = _T_852 & io_ins[4]; // @[el2_dec_dec_ctl.scala 127:17]
  assign io_out_ecall = _T_867 & io_ins[4]; // @[el2_dec_dec_ctl.scala 128:16]
  assign io_out_mret = _T_878 & io_ins[4]; // @[el2_dec_dec_ctl.scala 129:15]
  assign io_out_mul = _T_892 & _T_18; // @[el2_dec_dec_ctl.scala 130:14]
  assign io_out_rs1_sign = _T_912 | _T_929; // @[el2_dec_dec_ctl.scala 131:19]
  assign io_out_rs2_sign = _T_928 & _T_18; // @[el2_dec_dec_ctl.scala 133:19]
  assign io_out_low = _T_963 & _T_18; // @[el2_dec_dec_ctl.scala 134:14]
  assign io_out_div = _T_974 & _T_18; // @[el2_dec_dec_ctl.scala 135:14]
  assign io_out_rem = _T_987 & _T_18; // @[el2_dec_dec_ctl.scala 136:14]
  assign io_out_fence = _T_9 & io_ins[3]; // @[el2_dec_dec_ctl.scala 137:16]
  assign io_out_fence_i = _T_997 & io_ins[3]; // @[el2_dec_dec_ctl.scala 138:18]
  assign io_out_pm_alu = _T_1021 | _T_11; // @[el2_dec_dec_ctl.scala 139:17]
  assign io_out_legal = _T_1966 | _T_1981; // @[el2_dec_dec_ctl.scala 153:16]
endmodule
module el2_dec_decode_ctl(
  input         clock,
  input         reset,
  input         io_dec_tlu_flush_extint,
  input         io_dec_tlu_force_halt,
  output        io_dec_extint_stall,
  input  [15:0] io_ifu_i0_cinst,
  output [31:0] io_dec_i0_inst_wb1,
  output [30:0] io_dec_i0_pc_wb1,
  input         io_lsu_nonblock_load_valid_m,
  input  [1:0]  io_lsu_nonblock_load_tag_m,
  input         io_lsu_nonblock_load_inv_r,
  input  [1:0]  io_lsu_nonblock_load_inv_tag_r,
  input         io_lsu_nonblock_load_data_valid,
  input         io_lsu_nonblock_load_data_error,
  input  [1:0]  io_lsu_nonblock_load_data_tag,
  input  [31:0] io_lsu_nonblock_load_data,
  input  [3:0]  io_dec_i0_trigger_match_d,
  input         io_dec_tlu_wr_pause_r,
  input         io_dec_tlu_pipelining_disable,
  input  [3:0]  io_lsu_trigger_match_m,
  input         io_lsu_pmu_misaligned_m,
  input         io_dec_tlu_debug_stall,
  input         io_dec_tlu_flush_leak_one_r,
  input         io_dec_debug_fence_d,
  input  [1:0]  io_dbg_cmd_wrdata,
  input         io_dec_i0_icaf_d,
  input         io_dec_i0_icaf_f1_d,
  input  [1:0]  io_dec_i0_icaf_type_d,
  input         io_dec_i0_dbecc_d,
  input         io_dec_i0_brp_valid,
  input  [11:0] io_dec_i0_brp_bits_toffset,
  input  [1:0]  io_dec_i0_brp_bits_hist,
  input         io_dec_i0_brp_bits_br_error,
  input         io_dec_i0_brp_bits_br_start_error,
  input  [30:0] io_dec_i0_brp_bits_prett,
  input         io_dec_i0_brp_bits_way,
  input         io_dec_i0_brp_bits_ret,
  input  [7:0]  io_dec_i0_bp_index,
  input  [7:0]  io_dec_i0_bp_fghr,
  input  [4:0]  io_dec_i0_bp_btag,
  input         io_lsu_idle_any,
  input         io_lsu_load_stall_any,
  input         io_lsu_store_stall_any,
  input         io_dma_dccm_stall_any,
  input         io_exu_div_wren,
  input         io_dec_tlu_i0_kill_writeb_wb,
  input         io_dec_tlu_flush_lower_wb,
  input         io_dec_tlu_i0_kill_writeb_r,
  input         io_dec_tlu_flush_lower_r,
  input         io_dec_tlu_flush_pause_r,
  input         io_dec_tlu_presync_d,
  input         io_dec_tlu_postsync_d,
  input         io_dec_i0_pc4_d,
  input  [31:0] io_dec_csr_rddata_d,
  input         io_dec_csr_legal_d,
  input  [31:0] io_exu_csr_rs1_x,
  input  [31:0] io_lsu_result_m,
  input  [31:0] io_lsu_result_corr_r,
  input         io_exu_flush_final,
  input  [30:0] io_exu_i0_pc_x,
  input  [31:0] io_dec_i0_instr_d,
  input         io_dec_ib0_valid_d,
  input  [31:0] io_exu_i0_result_x,
  input         io_free_clk,
  input         io_active_clk,
  input         io_clk_override,
  output        io_dec_i0_rs1_en_d,
  output        io_dec_i0_rs2_en_d,
  output [4:0]  io_dec_i0_rs1_d,
  output [4:0]  io_dec_i0_rs2_d,
  output [31:0] io_dec_i0_immed_d,
  output [11:0] io_dec_i0_br_immed_d,
  output        io_i0_ap_land,
  output        io_i0_ap_lor,
  output        io_i0_ap_lxor,
  output        io_i0_ap_sll,
  output        io_i0_ap_srl,
  output        io_i0_ap_sra,
  output        io_i0_ap_beq,
  output        io_i0_ap_bne,
  output        io_i0_ap_blt,
  output        io_i0_ap_bge,
  output        io_i0_ap_add,
  output        io_i0_ap_sub,
  output        io_i0_ap_slt,
  output        io_i0_ap_unsign,
  output        io_i0_ap_jal,
  output        io_i0_ap_predict_t,
  output        io_i0_ap_predict_nt,
  output        io_i0_ap_csr_write,
  output        io_i0_ap_csr_imm,
  output        io_dec_i0_decode_d,
  output        io_dec_i0_alu_decode_d,
  output [31:0] io_dec_i0_rs1_bypass_data_d,
  output [31:0] io_dec_i0_rs2_bypass_data_d,
  output [4:0]  io_dec_i0_waddr_r,
  output        io_dec_i0_wen_r,
  output [31:0] io_dec_i0_wdata_r,
  output        io_dec_i0_select_pc_d,
  output [1:0]  io_dec_i0_rs1_bypass_en_d,
  output [1:0]  io_dec_i0_rs2_bypass_en_d,
  output        io_lsu_p_valid,
  output        io_lsu_p_bits_fast_int,
  output        io_lsu_p_bits_by,
  output        io_lsu_p_bits_half,
  output        io_lsu_p_bits_word,
  output        io_lsu_p_bits_load,
  output        io_lsu_p_bits_store,
  output        io_lsu_p_bits_unsign,
  output        io_lsu_p_bits_store_data_bypass_d,
  output        io_lsu_p_bits_load_ldst_bypass_d,
  output        io_mul_p_valid,
  output        io_mul_p_bits_rs1_sign,
  output        io_mul_p_bits_rs2_sign,
  output        io_mul_p_bits_low,
  output        io_div_p_valid,
  output        io_div_p_bits_unsign,
  output        io_div_p_bits_rem,
  output [4:0]  io_div_waddr_wb,
  output        io_dec_div_cancel,
  output        io_dec_lsu_valid_raw_d,
  output [11:0] io_dec_lsu_offset_d,
  output        io_dec_csr_ren_d,
  output        io_dec_csr_wen_unq_d,
  output        io_dec_csr_any_unq_d,
  output [11:0] io_dec_csr_rdaddr_d,
  output        io_dec_csr_wen_r,
  output [11:0] io_dec_csr_wraddr_r,
  output [31:0] io_dec_csr_wrdata_r,
  output        io_dec_csr_stall_int_ff,
  output        io_dec_tlu_i0_valid_r,
  output        io_dec_tlu_packet_r_legal,
  output        io_dec_tlu_packet_r_icaf,
  output        io_dec_tlu_packet_r_icaf_f1,
  output [1:0]  io_dec_tlu_packet_r_icaf_type,
  output        io_dec_tlu_packet_r_fence_i,
  output [3:0]  io_dec_tlu_packet_r_i0trigger,
  output [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  output        io_dec_tlu_packet_r_pmu_i0_br_unpred,
  output        io_dec_tlu_packet_r_pmu_divide,
  output        io_dec_tlu_packet_r_pmu_lsu_misaligned,
  output [30:0] io_dec_tlu_i0_pc_r,
  output [31:0] io_dec_illegal_inst,
  output [30:0] io_pred_correct_npc_x,
  output        io_dec_i0_predict_p_d_valid,
  output        io_dec_i0_predict_p_d_bits_pc4,
  output [1:0]  io_dec_i0_predict_p_d_bits_hist,
  output [11:0] io_dec_i0_predict_p_d_bits_toffset,
  output        io_dec_i0_predict_p_d_bits_br_error,
  output        io_dec_i0_predict_p_d_bits_br_start_error,
  output [30:0] io_dec_i0_predict_p_d_bits_prett,
  output        io_dec_i0_predict_p_d_bits_pcall,
  output        io_dec_i0_predict_p_d_bits_pret,
  output        io_dec_i0_predict_p_d_bits_pja,
  output        io_dec_i0_predict_p_d_bits_way,
  output [7:0]  io_i0_predict_fghr_d,
  output [7:0]  io_i0_predict_index_d,
  output [4:0]  io_i0_predict_btag_d,
  output [1:0]  io_dec_data_en,
  output [1:0]  io_dec_ctl_en,
  output        io_dec_pmu_instr_decoded,
  output        io_dec_pmu_decode_stall,
  output        io_dec_pmu_presync_stall,
  output        io_dec_pmu_postsync_stall,
  output        io_dec_nonblock_load_wen,
  output [4:0]  io_dec_nonblock_load_waddr,
  output        io_dec_pause_state,
  output        io_dec_pause_state_cg,
  output        io_dec_div_active,
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire [31:0] i0_dec_io_ins; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_alu; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs1; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs2; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_imm12; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rd; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_shimm5; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_imm20; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_pc; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_load; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_store; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_lsu; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_add; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_sub; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_land; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_lor; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_lxor; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_sll; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_sra; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_srl; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_slt; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_unsign; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_condbr; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_beq; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_bne; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_bge; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_blt; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_jal; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_by; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_half; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_word; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_read; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_clr; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_set; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_write; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_csr_imm; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_presync; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_postsync; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_ebreak; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_ecall; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_mret; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_mul; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs1_sign; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rs2_sign; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_low; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_div; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_rem; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_fence; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_fence_i; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_pm_alu; // @[el2_dec_decode_ctl.scala 392:22]
  wire  i0_dec_io_out_legal; // @[el2_dec_decode_ctl.scala 392:22]
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
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 518:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 518:23]
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
  reg  tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 499:55]
  wire  _T_1 = io_dec_tlu_wr_pause_r ^ tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 211:51]
  reg  tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 500:55]
  wire  _T_2 = tlu_wr_pause_r1 ^ tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 212:32]
  wire  _T_3 = _T_1 | _T_2; // @[el2_dec_decode_ctl.scala 211:73]
  wire  _T_4 = io_dec_tlu_flush_extint ^ io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 213:32]
  wire  _T_5 = _T_3 | _T_4; // @[el2_dec_decode_ctl.scala 212:56]
  reg  leak1_i1_stall; // @[el2_dec_decode_ctl.scala 400:56]
  wire  _T_280 = ~io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 399:73]
  wire  _T_281 = leak1_i1_stall & _T_280; // @[el2_dec_decode_ctl.scala 399:71]
  wire  leak1_i1_stall_in = io_dec_tlu_flush_leak_one_r | _T_281; // @[el2_dec_decode_ctl.scala 399:53]
  wire  _T_6 = leak1_i1_stall_in ^ leak1_i1_stall; // @[el2_dec_decode_ctl.scala 214:32]
  wire  _T_7 = _T_5 | _T_6; // @[el2_dec_decode_ctl.scala 213:56]
  wire  _T_284 = io_dec_i0_decode_d & leak1_i1_stall; // @[el2_dec_decode_ctl.scala 402:45]
  reg  leak1_i0_stall; // @[el2_dec_decode_ctl.scala 403:56]
  wire  _T_286 = leak1_i0_stall & _T_280; // @[el2_dec_decode_ctl.scala 402:81]
  wire  leak1_i0_stall_in = _T_284 | _T_286; // @[el2_dec_decode_ctl.scala 402:63]
  wire  _T_8 = leak1_i0_stall_in ^ leak1_i0_stall; // @[el2_dec_decode_ctl.scala 215:32]
  wire  _T_9 = _T_7 | _T_8; // @[el2_dec_decode_ctl.scala 214:56]
  reg  pause_stall; // @[el2_dec_decode_ctl.scala 497:50]
  wire  _T_412 = io_dec_tlu_wr_pause_r | pause_stall; // @[el2_dec_decode_ctl.scala 496:44]
  wire  _T_408 = ~io_dec_tlu_flush_pause_r; // @[el2_dec_decode_ctl.scala 495:49]
  wire  _T_409 = io_dec_tlu_flush_lower_r & _T_408; // @[el2_dec_decode_ctl.scala 495:47]
  reg [31:0] write_csr_data; // @[el2_lib.scala 514:16]
  wire  _T_410 = write_csr_data == 32'h0; // @[el2_dec_decode_ctl.scala 495:109]
  wire  _T_411 = pause_stall & _T_410; // @[el2_dec_decode_ctl.scala 495:91]
  wire  clear_pause = _T_409 | _T_411; // @[el2_dec_decode_ctl.scala 495:76]
  wire  _T_413 = ~clear_pause; // @[el2_dec_decode_ctl.scala 496:61]
  wire  pause_state_in = _T_412 & _T_413; // @[el2_dec_decode_ctl.scala 496:59]
  wire  _T_10 = pause_state_in ^ pause_stall; // @[el2_dec_decode_ctl.scala 216:32]
  wire  _T_11 = _T_9 | _T_10; // @[el2_dec_decode_ctl.scala 215:56]
  wire  _T_18 = ~leak1_i1_stall; // @[el2_dec_decode_ctl.scala 226:62]
  wire  i0_brp_valid = io_dec_i0_brp_valid & _T_18; // @[el2_dec_decode_ctl.scala 226:60]
  wire  i0_dp_raw_condbr = i0_dec_io_out_condbr; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_jal = i0_dec_io_out_jal; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire [19:0] i0_pcall_imm = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21]}; // @[Cat.scala 29:58]
  wire  _T_298 = i0_pcall_imm[19:12] == 8'hff; // @[el2_dec_decode_ctl.scala 408:79]
  wire  _T_300 = i0_pcall_imm[19:12] == 8'h0; // @[el2_dec_decode_ctl.scala 408:112]
  wire  i0_pcall_12b_offset = i0_pcall_imm[11] ? _T_298 : _T_300; // @[el2_dec_decode_ctl.scala 408:33]
  wire  i0_dp_raw_imm20 = i0_dec_io_out_imm20; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  _T_301 = i0_pcall_12b_offset & i0_dp_raw_imm20; // @[el2_dec_decode_ctl.scala 409:47]
  wire [4:0] i0r_rd = io_dec_i0_instr_d[11:7]; // @[el2_dec_decode_ctl.scala 622:16]
  wire  _T_302 = i0r_rd == 5'h1; // @[el2_dec_decode_ctl.scala 409:76]
  wire  _T_303 = i0r_rd == 5'h5; // @[el2_dec_decode_ctl.scala 409:98]
  wire  _T_304 = _T_302 | _T_303; // @[el2_dec_decode_ctl.scala 409:89]
  wire  i0_pcall_case = _T_301 & _T_304; // @[el2_dec_decode_ctl.scala 409:65]
  wire  i0_pcall_raw = i0_dp_raw_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 411:38]
  wire  _T_20 = i0_dp_raw_condbr | i0_pcall_raw; // @[el2_dec_decode_ctl.scala 237:75]
  wire  _T_309 = ~_T_304; // @[el2_dec_decode_ctl.scala 410:67]
  wire  i0_pja_case = _T_301 & _T_309; // @[el2_dec_decode_ctl.scala 410:65]
  wire  i0_pja_raw = i0_dp_raw_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 413:38]
  wire  _T_21 = _T_20 | i0_pja_raw; // @[el2_dec_decode_ctl.scala 237:90]
  wire  i0_dp_raw_imm12 = i0_dec_io_out_imm12; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  _T_325 = i0_dp_raw_jal & i0_dp_raw_imm12; // @[el2_dec_decode_ctl.scala 417:37]
  wire  _T_326 = i0r_rd == 5'h0; // @[el2_dec_decode_ctl.scala 417:65]
  wire  _T_327 = _T_325 & _T_326; // @[el2_dec_decode_ctl.scala 417:55]
  wire [4:0] i0r_rs1 = io_dec_i0_instr_d[19:15]; // @[el2_dec_decode_ctl.scala 620:16]
  wire  _T_328 = i0r_rs1 == 5'h1; // @[el2_dec_decode_ctl.scala 417:89]
  wire  _T_329 = i0r_rs1 == 5'h5; // @[el2_dec_decode_ctl.scala 417:111]
  wire  _T_330 = _T_328 | _T_329; // @[el2_dec_decode_ctl.scala 417:101]
  wire  i0_pret_case = _T_327 & _T_330; // @[el2_dec_decode_ctl.scala 417:79]
  wire  i0_pret_raw = i0_dp_raw_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 418:32]
  wire  _T_22 = _T_21 | i0_pret_raw; // @[el2_dec_decode_ctl.scala 237:103]
  wire  _T_23 = ~_T_22; // @[el2_dec_decode_ctl.scala 237:56]
  wire  i0_notbr_error = i0_brp_valid & _T_23; // @[el2_dec_decode_ctl.scala 237:54]
  wire  _T_31 = io_dec_i0_brp_bits_br_error | i0_notbr_error; // @[el2_dec_decode_ctl.scala 242:62]
  wire  _T_25 = i0_brp_valid & io_dec_i0_brp_bits_hist[1]; // @[el2_dec_decode_ctl.scala 240:47]
  wire  _T_314 = i0_pcall_raw | i0_pja_raw; // @[el2_dec_decode_ctl.scala 415:41]
  wire [11:0] _T_323 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[7],io_dec_i0_instr_d[30:25],io_dec_i0_instr_d[11:8]}; // @[Cat.scala 29:58]
  wire [11:0] i0_br_offset = _T_314 ? i0_pcall_imm[11:0] : _T_323; // @[el2_dec_decode_ctl.scala 415:26]
  wire  _T_26 = io_dec_i0_brp_bits_toffset != i0_br_offset; // @[el2_dec_decode_ctl.scala 240:106]
  wire  _T_27 = _T_25 & _T_26; // @[el2_dec_decode_ctl.scala 240:76]
  wire  _T_28 = ~i0_pret_raw; // @[el2_dec_decode_ctl.scala 240:126]
  wire  i0_br_toffset_error = _T_27 & _T_28; // @[el2_dec_decode_ctl.scala 240:124]
  wire  _T_32 = _T_31 | i0_br_toffset_error; // @[el2_dec_decode_ctl.scala 242:79]
  wire  _T_29 = i0_brp_valid & io_dec_i0_brp_bits_ret; // @[el2_dec_decode_ctl.scala 241:47]
  wire  i0_ret_error = _T_29 & _T_28; // @[el2_dec_decode_ctl.scala 241:72]
  wire  i0_br_error = _T_32 | i0_ret_error; // @[el2_dec_decode_ctl.scala 242:101]
  wire  _T_39 = i0_br_error | io_dec_i0_brp_bits_br_start_error; // @[el2_dec_decode_ctl.scala 247:47]
  wire  i0_br_error_all = _T_39 & _T_18; // @[el2_dec_decode_ctl.scala 247:84]
  wire  i0_icaf_d = io_dec_i0_icaf_d | io_dec_i0_dbecc_d; // @[el2_dec_decode_ctl.scala 256:36]
  wire  _T_41 = i0_br_error_all | i0_icaf_d; // @[el2_dec_decode_ctl.scala 260:25]
  wire  i0_dp_raw_postsync = i0_dec_io_out_postsync; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_postsync = _T_41 | i0_dp_raw_postsync; // @[el2_dec_decode_ctl.scala 260:50]
  wire  _T_439 = i0_dp_postsync | io_dec_tlu_postsync_d; // @[el2_dec_decode_ctl.scala 526:36]
  wire  debug_fence_i = io_dec_debug_fence_d & io_dbg_cmd_wrdata[0]; // @[el2_dec_decode_ctl.scala 518:48]
  wire  _T_440 = _T_439 | debug_fence_i; // @[el2_dec_decode_ctl.scala 526:60]
  wire  i0_dp_raw_csr_write = i0_dec_io_out_csr_write; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_write = _T_41 ? 1'h0 : i0_dp_raw_csr_write; // @[el2_dec_decode_ctl.scala 260:50]
  wire  _T_343 = ~io_dec_debug_fence_d; // @[el2_dec_decode_ctl.scala 457:42]
  wire  i0_csr_write = i0_dp_csr_write & _T_343; // @[el2_dec_decode_ctl.scala 457:40]
  wire  i0_dp_raw_csr_read = i0_dec_io_out_csr_read; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_read = _T_41 ? 1'h0 : i0_dp_raw_csr_read; // @[el2_dec_decode_ctl.scala 260:50]
  wire  _T_347 = ~i0_dp_csr_read; // @[el2_dec_decode_ctl.scala 462:41]
  wire  i0_csr_write_only_d = i0_csr_write & _T_347; // @[el2_dec_decode_ctl.scala 462:39]
  wire  _T_442 = io_dec_i0_instr_d[31:20] == 12'h7c2; // @[el2_dec_decode_ctl.scala 526:112]
  wire  _T_443 = i0_csr_write_only_d & _T_442; // @[el2_dec_decode_ctl.scala 526:99]
  wire  i0_postsync = _T_440 | _T_443; // @[el2_dec_decode_ctl.scala 526:76]
  wire  i0_dp_raw_legal = i0_dec_io_out_legal; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_legal = _T_41 | i0_dp_raw_legal; // @[el2_dec_decode_ctl.scala 260:50]
  wire  any_csr_d = i0_dp_csr_read | i0_csr_write; // @[el2_dec_decode_ctl.scala 528:34]
  wire  _T_444 = ~any_csr_d; // @[el2_dec_decode_ctl.scala 530:40]
  wire  _T_445 = _T_444 | io_dec_csr_legal_d; // @[el2_dec_decode_ctl.scala 530:51]
  wire  i0_legal = i0_dp_legal & _T_445; // @[el2_dec_decode_ctl.scala 530:37]
  wire  _T_504 = ~i0_legal; // @[el2_dec_decode_ctl.scala 570:56]
  wire  _T_505 = i0_postsync | _T_504; // @[el2_dec_decode_ctl.scala 570:54]
  wire  _T_506 = io_dec_i0_decode_d & _T_505; // @[el2_dec_decode_ctl.scala 570:39]
  reg  postsync_stall; // @[el2_dec_decode_ctl.scala 568:53]
  reg  x_d_valid; // @[el2_lib.scala 524:16]
  wire  _T_507 = postsync_stall & x_d_valid; // @[el2_dec_decode_ctl.scala 570:88]
  wire  ps_stall_in = _T_506 | _T_507; // @[el2_dec_decode_ctl.scala 570:69]
  wire  _T_12 = ps_stall_in ^ postsync_stall; // @[el2_dec_decode_ctl.scala 217:32]
  wire  _T_13 = _T_11 | _T_12; // @[el2_dec_decode_ctl.scala 216:56]
  reg  flush_final_r; // @[el2_dec_decode_ctl.scala 616:52]
  wire  _T_14 = io_exu_flush_final ^ flush_final_r; // @[el2_dec_decode_ctl.scala 218:32]
  wire  _T_15 = _T_13 | _T_14; // @[el2_dec_decode_ctl.scala 217:56]
  wire  shift_illegal = io_dec_i0_decode_d & _T_504; // @[el2_dec_decode_ctl.scala 534:47]
  reg  illegal_lockout; // @[el2_dec_decode_ctl.scala 538:54]
  wire  _T_466 = shift_illegal | illegal_lockout; // @[el2_dec_decode_ctl.scala 537:40]
  wire  _T_467 = ~flush_final_r; // @[el2_dec_decode_ctl.scala 537:61]
  wire  illegal_lockout_in = _T_466 & _T_467; // @[el2_dec_decode_ctl.scala 537:59]
  wire  _T_16 = illegal_lockout_in ^ illegal_lockout; // @[el2_dec_decode_ctl.scala 219:32]
  wire  i0_legal_decode_d = io_dec_i0_decode_d & i0_legal; // @[el2_dec_decode_ctl.scala 644:46]
  wire  _T_33 = i0_br_error & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 243:72]
  wire  _T_36 = io_dec_i0_brp_bits_br_start_error & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 244:94]
  wire  i0_dp_raw_pm_alu = i0_dec_io_out_pm_alu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_pm_alu = _T_41 ? 1'h0 : i0_dp_raw_pm_alu; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_fence_i = i0_dec_io_out_fence_i; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_fence_i = _T_41 ? 1'h0 : i0_dp_raw_fence_i; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_fence = i0_dec_io_out_fence; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_fence = _T_41 ? 1'h0 : i0_dp_raw_fence; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rem = i0_dec_io_out_rem; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_div = i0_dec_io_out_div; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_div = _T_41 ? 1'h0 : i0_dp_raw_div; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_low = i0_dec_io_out_low; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_rs2_sign = i0_dec_io_out_rs2_sign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_rs1_sign = i0_dec_io_out_rs1_sign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_mul = i0_dec_io_out_mul; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_mul = _T_41 ? 1'h0 : i0_dp_raw_mul; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_mret = i0_dec_io_out_mret; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_mret = _T_41 ? 1'h0 : i0_dp_raw_mret; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_ecall = i0_dec_io_out_ecall; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_ecall = _T_41 ? 1'h0 : i0_dp_raw_ecall; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_ebreak = i0_dec_io_out_ebreak; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_ebreak = _T_41 ? 1'h0 : i0_dp_raw_ebreak; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_presync = i0_dec_io_out_presync; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_presync = _T_41 ? 1'h0 : i0_dp_raw_presync; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_csr_imm = i0_dec_io_out_csr_imm; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_imm = _T_41 ? 1'h0 : i0_dp_raw_csr_imm; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_csr_set = i0_dec_io_out_csr_set; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_set = _T_41 ? 1'h0 : i0_dp_raw_csr_set; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_csr_clr = i0_dec_io_out_csr_clr; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_csr_clr = _T_41 ? 1'h0 : i0_dp_raw_csr_clr; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_word = i0_dec_io_out_word; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_word = _T_41 ? 1'h0 : i0_dp_raw_word; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_half = i0_dec_io_out_half; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_half = _T_41 ? 1'h0 : i0_dp_raw_half; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_by = i0_dec_io_out_by; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_by = _T_41 ? 1'h0 : i0_dp_raw_by; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_jal = _T_41 ? 1'h0 : i0_dp_raw_jal; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_blt = i0_dec_io_out_blt; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_bge = i0_dec_io_out_bge; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_bne = i0_dec_io_out_bne; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_beq = i0_dec_io_out_beq; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_condbr = _T_41 ? 1'h0 : i0_dp_raw_condbr; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_unsign = i0_dec_io_out_unsign; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_unsign = _T_41 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_slt = i0_dec_io_out_slt; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_srl = i0_dec_io_out_srl; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_sra = i0_dec_io_out_sra; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_sll = i0_dec_io_out_sll; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_lxor = i0_dec_io_out_lxor; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_lor = i0_dec_io_out_lor; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_land = i0_dec_io_out_land; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_sub = i0_dec_io_out_sub; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_add = i0_dec_io_out_add; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_raw_lsu = i0_dec_io_out_lsu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_lsu = _T_41 ? 1'h0 : i0_dp_raw_lsu; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_store = i0_dec_io_out_store; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_store = _T_41 ? 1'h0 : i0_dp_raw_store; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_load = i0_dec_io_out_load; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_load = _T_41 ? 1'h0 : i0_dp_raw_load; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_pc = i0_dec_io_out_pc; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_imm20 = _T_41 ? 1'h0 : i0_dp_raw_imm20; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_shimm5 = i0_dec_io_out_shimm5; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_shimm5 = _T_41 ? 1'h0 : i0_dp_raw_shimm5; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rd = i0_dec_io_out_rd; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_rd = _T_41 ? 1'h0 : i0_dp_raw_rd; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_imm12 = _T_41 ? 1'h0 : i0_dp_raw_imm12; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rs2 = i0_dec_io_out_rs2; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_rs2 = _T_41 | i0_dp_raw_rs2; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_rs1 = i0_dec_io_out_rs1; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_rs1 = _T_41 | i0_dp_raw_rs1; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_dp_raw_alu = i0_dec_io_out_alu; // @[el2_dec_decode_ctl.scala 156:22 el2_dec_decode_ctl.scala 394:12]
  wire  i0_dp_alu = _T_41 | i0_dp_raw_alu; // @[el2_dec_decode_ctl.scala 260:50]
  wire  i0_pcall = i0_dp_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 412:38]
  wire  _T_44 = i0_dp_condbr | i0_pcall; // @[el2_dec_decode_ctl.scala 274:38]
  wire  i0_pja = i0_dp_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 414:38]
  wire  _T_45 = _T_44 | i0_pja; // @[el2_dec_decode_ctl.scala 274:49]
  wire  i0_pret = i0_dp_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 419:32]
  wire  i0_predict_br = _T_45 | i0_pret; // @[el2_dec_decode_ctl.scala 274:58]
  wire  _T_47 = io_dec_i0_brp_bits_hist[1] & i0_brp_valid; // @[el2_dec_decode_ctl.scala 276:55]
  wire  _T_48 = ~_T_47; // @[el2_dec_decode_ctl.scala 276:26]
  wire  i0_ap_pc2 = ~io_dec_i0_pc4_d; // @[el2_dec_decode_ctl.scala 278:20]
  wire  cam_data_reset = io_lsu_nonblock_load_data_valid | io_lsu_nonblock_load_data_error; // @[el2_dec_decode_ctl.scala 311:63]
  reg [2:0] cam_raw_0_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire [2:0] _GEN_123 = {{1'd0}, io_lsu_nonblock_load_data_tag}; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_94 = _GEN_123 == cam_raw_0_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_95 = cam_data_reset & _T_94; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_0 = _T_95 & cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_0_valid = cam_data_reset_val_0 ? 1'h0 : cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_51 = ~cam_0_valid; // @[el2_dec_decode_ctl.scala 303:78]
  reg [2:0] cam_raw_1_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_120 = _GEN_123 == cam_raw_1_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_121 = cam_data_reset & _T_120; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_1 = _T_121 & cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_1_valid = cam_data_reset_val_1 ? 1'h0 : cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_54 = ~cam_1_valid; // @[el2_dec_decode_ctl.scala 303:78]
  wire  _T_57 = cam_0_valid & _T_54; // @[el2_dec_decode_ctl.scala 303:126]
  wire [1:0] _T_59 = {io_lsu_nonblock_load_valid_m, 1'h0}; // @[el2_dec_decode_ctl.scala 303:158]
  reg [2:0] cam_raw_2_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_146 = _GEN_123 == cam_raw_2_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_147 = cam_data_reset & _T_146; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_2 = _T_147 & cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_2_valid = cam_data_reset_val_2 ? 1'h0 : cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_60 = ~cam_2_valid; // @[el2_dec_decode_ctl.scala 303:78]
  wire  _T_63 = cam_0_valid & cam_1_valid; // @[el2_dec_decode_ctl.scala 303:126]
  wire  _T_66 = _T_63 & _T_60; // @[el2_dec_decode_ctl.scala 303:126]
  wire [2:0] _T_68 = {io_lsu_nonblock_load_valid_m, 2'h0}; // @[el2_dec_decode_ctl.scala 303:158]
  reg [2:0] cam_raw_3_bits_tag; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_172 = _GEN_123 == cam_raw_3_bits_tag; // @[el2_dec_decode_ctl.scala 322:67]
  wire  _T_173 = cam_data_reset & _T_172; // @[el2_dec_decode_ctl.scala 322:45]
  reg  cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 347:47]
  wire  cam_data_reset_val_3 = _T_173 & cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 322:88]
  wire  cam_3_valid = cam_data_reset_val_3 ? 1'h0 : cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 326:39]
  wire  _T_69 = ~cam_3_valid; // @[el2_dec_decode_ctl.scala 303:78]
  wire  _T_75 = _T_63 & cam_2_valid; // @[el2_dec_decode_ctl.scala 303:126]
  wire  _T_78 = _T_75 & _T_69; // @[el2_dec_decode_ctl.scala 303:126]
  wire [3:0] _T_80 = {io_lsu_nonblock_load_valid_m, 3'h0}; // @[el2_dec_decode_ctl.scala 303:158]
  wire  _T_81 = _T_51 & io_lsu_nonblock_load_valid_m; // @[Mux.scala 27:72]
  wire [1:0] _T_82 = _T_57 ? _T_59 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_83 = _T_66 ? _T_68 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_84 = _T_78 ? _T_80 : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_127 = {{1'd0}, _T_81}; // @[Mux.scala 27:72]
  wire [1:0] _T_85 = _GEN_127 | _T_82; // @[Mux.scala 27:72]
  wire [2:0] _GEN_128 = {{1'd0}, _T_85}; // @[Mux.scala 27:72]
  wire [2:0] _T_86 = _GEN_128 | _T_83; // @[Mux.scala 27:72]
  wire [3:0] _GEN_129 = {{1'd0}, _T_86}; // @[Mux.scala 27:72]
  wire [3:0] cam_wen = _GEN_129 | _T_84; // @[Mux.scala 27:72]
  reg  x_d_bits_i0load; // @[el2_lib.scala 524:16]
  reg [4:0] x_d_bits_i0rd; // @[el2_lib.scala 524:16]
  wire [4:0] nonblock_load_rd = x_d_bits_i0load ? x_d_bits_i0rd : 5'h0; // @[el2_dec_decode_ctl.scala 314:31]
  reg [2:0] _T_701; // @[el2_dec_decode_ctl.scala 652:72]
  wire [3:0] i0_pipe_en = {io_dec_i0_decode_d,_T_701}; // @[Cat.scala 29:58]
  wire  _T_707 = |i0_pipe_en[2:1]; // @[el2_dec_decode_ctl.scala 655:49]
  wire  i0_r_ctl_en = _T_707 | io_clk_override; // @[el2_dec_decode_ctl.scala 655:53]
  reg  nonblock_load_valid_m_delay; // @[Reg.scala 27:20]
  reg  r_d_bits_i0load; // @[el2_lib.scala 524:16]
  wire  i0_load_kill_wen_r = nonblock_load_valid_m_delay & r_d_bits_i0load; // @[el2_dec_decode_ctl.scala 319:56]
  wire [2:0] _GEN_130 = {{1'd0}, io_lsu_nonblock_load_inv_tag_r}; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_91 = _GEN_130 == cam_raw_0_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_92 = io_lsu_nonblock_load_inv_r & _T_91; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_0 = _T_92 & cam_0_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg  r_d_bits_i0v; // @[el2_lib.scala 524:16]
  wire  _T_743 = ~io_dec_tlu_flush_lower_wb; // @[el2_dec_decode_ctl.scala 687:51]
  wire  r_d_in_bits_i0v = r_d_bits_i0v & _T_743; // @[el2_dec_decode_ctl.scala 687:49]
  wire  _T_754 = ~io_dec_tlu_i0_kill_writeb_r; // @[el2_dec_decode_ctl.scala 695:47]
  wire  i0_wen_r = r_d_in_bits_i0v & _T_754; // @[el2_dec_decode_ctl.scala 695:45]
  reg [4:0] r_d_bits_i0rd; // @[el2_lib.scala 524:16]
  reg [4:0] cam_raw_0_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_103 = r_d_bits_i0rd == cam_raw_0_bits_rd; // @[el2_dec_decode_ctl.scala 334:85]
  wire  _T_104 = i0_wen_r & _T_103; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_0_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_106 = _T_104 & cam_raw_0_bits_wb; // @[el2_dec_decode_ctl.scala 334:105]
  wire  _T_107 = cam_inv_reset_val_0 | _T_106; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_52 = _T_107 ? 1'h0 : cam_0_valid; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_55 = _T_107 ? 1'h0 : cam_raw_0_bits_wb; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_56 = cam_wen[0] | _GEN_52; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_57 = cam_wen[0] ? 1'h0 : _GEN_55; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_110 = nonblock_load_valid_m_delay & _T_91; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_112 = _T_110 & cam_0_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_0 = _T_94 & cam_raw_0_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_117 = _GEN_130 == cam_raw_1_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_118 = io_lsu_nonblock_load_inv_r & _T_117; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_1 = _T_118 & cam_1_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg [4:0] cam_raw_1_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_129 = r_d_bits_i0rd == cam_raw_1_bits_rd; // @[el2_dec_decode_ctl.scala 334:85]
  wire  _T_130 = i0_wen_r & _T_129; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_1_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_132 = _T_130 & cam_raw_1_bits_wb; // @[el2_dec_decode_ctl.scala 334:105]
  wire  _T_133 = cam_inv_reset_val_1 | _T_132; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_63 = _T_133 ? 1'h0 : cam_1_valid; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_66 = _T_133 ? 1'h0 : cam_raw_1_bits_wb; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_67 = cam_wen[1] | _GEN_63; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_68 = cam_wen[1] ? 1'h0 : _GEN_66; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_136 = nonblock_load_valid_m_delay & _T_117; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_138 = _T_136 & cam_1_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_1 = _T_120 & cam_raw_1_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_143 = _GEN_130 == cam_raw_2_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_144 = io_lsu_nonblock_load_inv_r & _T_143; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_2 = _T_144 & cam_2_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg [4:0] cam_raw_2_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_155 = r_d_bits_i0rd == cam_raw_2_bits_rd; // @[el2_dec_decode_ctl.scala 334:85]
  wire  _T_156 = i0_wen_r & _T_155; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_2_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_158 = _T_156 & cam_raw_2_bits_wb; // @[el2_dec_decode_ctl.scala 334:105]
  wire  _T_159 = cam_inv_reset_val_2 | _T_158; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_74 = _T_159 ? 1'h0 : cam_2_valid; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_77 = _T_159 ? 1'h0 : cam_raw_2_bits_wb; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_78 = cam_wen[2] | _GEN_74; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_79 = cam_wen[2] ? 1'h0 : _GEN_77; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_162 = nonblock_load_valid_m_delay & _T_143; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_164 = _T_162 & cam_2_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_2 = _T_146 & cam_raw_2_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_169 = _GEN_130 == cam_raw_3_bits_tag; // @[el2_dec_decode_ctl.scala 321:66]
  wire  _T_170 = io_lsu_nonblock_load_inv_r & _T_169; // @[el2_dec_decode_ctl.scala 321:45]
  wire  cam_inv_reset_val_3 = _T_170 & cam_3_valid; // @[el2_dec_decode_ctl.scala 321:87]
  reg [4:0] cam_raw_3_bits_rd; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_181 = r_d_bits_i0rd == cam_raw_3_bits_rd; // @[el2_dec_decode_ctl.scala 334:85]
  wire  _T_182 = i0_wen_r & _T_181; // @[el2_dec_decode_ctl.scala 334:64]
  reg  cam_raw_3_bits_wb; // @[el2_dec_decode_ctl.scala 347:47]
  wire  _T_184 = _T_182 & cam_raw_3_bits_wb; // @[el2_dec_decode_ctl.scala 334:105]
  wire  _T_185 = cam_inv_reset_val_3 | _T_184; // @[el2_dec_decode_ctl.scala 334:44]
  wire  _GEN_85 = _T_185 ? 1'h0 : cam_3_valid; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_88 = _T_185 ? 1'h0 : cam_raw_3_bits_wb; // @[el2_dec_decode_ctl.scala 334:131]
  wire  _GEN_89 = cam_wen[3] | _GEN_85; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _GEN_90 = cam_wen[3] ? 1'h0 : _GEN_88; // @[el2_dec_decode_ctl.scala 329:28]
  wire  _T_188 = nonblock_load_valid_m_delay & _T_169; // @[el2_dec_decode_ctl.scala 339:44]
  wire  _T_190 = _T_188 & cam_3_valid; // @[el2_dec_decode_ctl.scala 339:100]
  wire  nonblock_load_write_3 = _T_172 & cam_raw_3_valid; // @[el2_dec_decode_ctl.scala 348:71]
  wire  _T_195 = r_d_bits_i0rd == io_dec_nonblock_load_waddr; // @[el2_dec_decode_ctl.scala 353:49]
  wire  nonblock_load_cancel = _T_195 & i0_wen_r; // @[el2_dec_decode_ctl.scala 353:81]
  wire  _T_196 = nonblock_load_write_0 | nonblock_load_write_1; // @[el2_dec_decode_ctl.scala 354:95]
  wire  _T_197 = _T_196 | nonblock_load_write_2; // @[el2_dec_decode_ctl.scala 354:95]
  wire  _T_198 = _T_197 | nonblock_load_write_3; // @[el2_dec_decode_ctl.scala 354:95]
  wire  _T_200 = io_lsu_nonblock_load_data_valid & _T_198; // @[el2_dec_decode_ctl.scala 354:64]
  wire  _T_201 = ~nonblock_load_cancel; // @[el2_dec_decode_ctl.scala 354:109]
  wire  _T_203 = nonblock_load_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 355:54]
  wire  _T_204 = _T_203 & io_lsu_nonblock_load_valid_m; // @[el2_dec_decode_ctl.scala 355:66]
  wire  _T_205 = _T_204 & io_dec_i0_rs1_en_d; // @[el2_dec_decode_ctl.scala 355:97]
  wire [4:0] i0r_rs2 = io_dec_i0_instr_d[24:20]; // @[el2_dec_decode_ctl.scala 621:16]
  wire  _T_206 = nonblock_load_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 355:137]
  wire  _T_207 = _T_206 & io_lsu_nonblock_load_valid_m; // @[el2_dec_decode_ctl.scala 355:149]
  wire  _T_208 = _T_207 & io_dec_i0_rs2_en_d; // @[el2_dec_decode_ctl.scala 355:180]
  wire  i0_nonblock_boundary_stall = _T_205 | _T_208; // @[el2_dec_decode_ctl.scala 355:118]
  wire [4:0] _T_210 = nonblock_load_write_0 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_211 = _T_210 & cam_raw_0_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_212 = io_dec_i0_rs1_en_d & cam_0_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_213 = cam_raw_0_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_214 = _T_212 & _T_213; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_215 = io_dec_i0_rs2_en_d & cam_0_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_216 = cam_raw_0_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_217 = _T_215 & _T_216; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_219 = nonblock_load_write_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_220 = _T_219 & cam_raw_1_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_221 = io_dec_i0_rs1_en_d & cam_1_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_222 = cam_raw_1_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_223 = _T_221 & _T_222; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_224 = io_dec_i0_rs2_en_d & cam_1_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_225 = cam_raw_1_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_226 = _T_224 & _T_225; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_228 = nonblock_load_write_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_229 = _T_228 & cam_raw_2_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_230 = io_dec_i0_rs1_en_d & cam_2_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_231 = cam_raw_2_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_232 = _T_230 & _T_231; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_233 = io_dec_i0_rs2_en_d & cam_2_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_234 = cam_raw_2_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_235 = _T_233 & _T_234; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_237 = nonblock_load_write_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_238 = _T_237 & cam_raw_3_bits_rd; // @[el2_dec_decode_ctl.scala 359:88]
  wire  _T_239 = io_dec_i0_rs1_en_d & cam_3_valid; // @[el2_dec_decode_ctl.scala 359:126]
  wire  _T_240 = cam_raw_3_bits_rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 359:159]
  wire  _T_241 = _T_239 & _T_240; // @[el2_dec_decode_ctl.scala 359:141]
  wire  _T_242 = io_dec_i0_rs2_en_d & cam_3_valid; // @[el2_dec_decode_ctl.scala 359:192]
  wire  _T_243 = cam_raw_3_bits_rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 359:225]
  wire  _T_244 = _T_242 & _T_243; // @[el2_dec_decode_ctl.scala 359:207]
  wire [4:0] _T_245 = _T_211 | _T_220; // @[el2_dec_decode_ctl.scala 360:69]
  wire [4:0] _T_246 = _T_245 | _T_229; // @[el2_dec_decode_ctl.scala 360:69]
  wire  _T_247 = _T_214 | _T_223; // @[el2_dec_decode_ctl.scala 360:102]
  wire  _T_248 = _T_247 | _T_232; // @[el2_dec_decode_ctl.scala 360:102]
  wire  ld_stall_1 = _T_248 | _T_241; // @[el2_dec_decode_ctl.scala 360:102]
  wire  _T_249 = _T_217 | _T_226; // @[el2_dec_decode_ctl.scala 360:134]
  wire  _T_250 = _T_249 | _T_235; // @[el2_dec_decode_ctl.scala 360:134]
  wire  ld_stall_2 = _T_250 | _T_244; // @[el2_dec_decode_ctl.scala 360:134]
  wire  _T_251 = ld_stall_1 | ld_stall_2; // @[el2_dec_decode_ctl.scala 362:38]
  wire  i0_nonblock_load_stall = _T_251 | i0_nonblock_boundary_stall; // @[el2_dec_decode_ctl.scala 362:51]
  wire  _T_253 = ~i0_predict_br; // @[el2_dec_decode_ctl.scala 371:34]
  wire [3:0] _T_255 = i0_legal_decode_d ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire  csr_read = i0_dp_csr_read & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 455:36]
  wire  _T_256 = csr_read & io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 383:16]
  wire  _T_258 = ~csr_read; // @[el2_dec_decode_ctl.scala 384:6]
  wire  _T_259 = _T_258 & io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 384:16]
  wire  _T_261 = ~io_dec_csr_wen_unq_d; // @[el2_dec_decode_ctl.scala 385:18]
  wire  _T_262 = csr_read & _T_261; // @[el2_dec_decode_ctl.scala 385:16]
  wire [3:0] _T_264 = i0_dp_mul ? 4'h1 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _T_265 = i0_dp_load ? 4'h2 : _T_264; // @[Mux.scala 98:16]
  wire [3:0] _T_266 = i0_dp_store ? 4'h3 : _T_265; // @[Mux.scala 98:16]
  wire [3:0] _T_267 = i0_dp_pm_alu ? 4'h4 : _T_266; // @[Mux.scala 98:16]
  wire [3:0] _T_268 = _T_262 ? 4'h5 : _T_267; // @[Mux.scala 98:16]
  wire [3:0] _T_269 = _T_259 ? 4'h6 : _T_268; // @[Mux.scala 98:16]
  wire [3:0] _T_270 = _T_256 ? 4'h7 : _T_269; // @[Mux.scala 98:16]
  wire [3:0] _T_271 = i0_dp_ebreak ? 4'h8 : _T_270; // @[Mux.scala 98:16]
  wire [3:0] _T_272 = i0_dp_ecall ? 4'h9 : _T_271; // @[Mux.scala 98:16]
  wire [3:0] _T_273 = i0_dp_fence ? 4'ha : _T_272; // @[Mux.scala 98:16]
  wire [3:0] _T_274 = i0_dp_fence_i ? 4'hb : _T_273; // @[Mux.scala 98:16]
  wire [3:0] _T_275 = i0_dp_mret ? 4'hc : _T_274; // @[Mux.scala 98:16]
  wire [3:0] _T_276 = i0_dp_condbr ? 4'hd : _T_275; // @[Mux.scala 98:16]
  wire [3:0] _T_277 = i0_dp_jal ? 4'he : _T_276; // @[Mux.scala 98:16]
  reg  lsu_idle; // @[el2_dec_decode_ctl.scala 396:45]
  wire  _T_333 = ~i0_pcall_case; // @[el2_dec_decode_ctl.scala 420:35]
  wire  _T_334 = i0_dp_jal & _T_333; // @[el2_dec_decode_ctl.scala 420:32]
  wire  _T_335 = ~i0_pja_case; // @[el2_dec_decode_ctl.scala 420:52]
  wire  _T_336 = _T_334 & _T_335; // @[el2_dec_decode_ctl.scala 420:50]
  wire  _T_337 = ~i0_pret_case; // @[el2_dec_decode_ctl.scala 420:67]
  reg  _T_339; // @[el2_dec_decode_ctl.scala 432:58]
  wire  lsu_decode_d = i0_legal_decode_d & i0_dp_lsu; // @[el2_dec_decode_ctl.scala 574:40]
  wire  _T_902 = i0_dp_load | i0_dp_store; // @[el2_dec_decode_ctl.scala 788:43]
  reg  x_d_bits_i0v; // @[el2_lib.scala 524:16]
  wire  _T_876 = io_dec_i0_rs1_en_d & x_d_bits_i0v; // @[el2_dec_decode_ctl.scala 768:48]
  wire  _T_877 = x_d_bits_i0rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 768:80]
  wire  i0_rs1_depend_i0_x = _T_876 & _T_877; // @[el2_dec_decode_ctl.scala 768:63]
  wire  _T_878 = io_dec_i0_rs1_en_d & r_d_bits_i0v; // @[el2_dec_decode_ctl.scala 769:48]
  wire  _T_879 = r_d_bits_i0rd == i0r_rs1; // @[el2_dec_decode_ctl.scala 769:80]
  wire  i0_rs1_depend_i0_r = _T_878 & _T_879; // @[el2_dec_decode_ctl.scala 769:63]
  wire [1:0] _T_891 = i0_rs1_depend_i0_r ? 2'h2 : 2'h0; // @[el2_dec_decode_ctl.scala 775:63]
  wire [1:0] i0_rs1_depth_d = i0_rs1_depend_i0_x ? 2'h1 : _T_891; // @[el2_dec_decode_ctl.scala 775:24]
  wire  _T_904 = _T_902 & i0_rs1_depth_d[0]; // @[el2_dec_decode_ctl.scala 788:58]
  reg  i0_x_c_load; // @[Reg.scala 15:16]
  reg  i0_r_c_load; // @[Reg.scala 15:16]
  wire  _T_887_load = i0_rs1_depend_i0_r & i0_r_c_load; // @[el2_dec_decode_ctl.scala 774:61]
  wire  i0_rs1_class_d_load = i0_rs1_depend_i0_x ? i0_x_c_load : _T_887_load; // @[el2_dec_decode_ctl.scala 774:24]
  wire  load_ldst_bypass_d = _T_904 & i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 788:78]
  wire  _T_880 = io_dec_i0_rs2_en_d & x_d_bits_i0v; // @[el2_dec_decode_ctl.scala 771:48]
  wire  _T_881 = x_d_bits_i0rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 771:80]
  wire  i0_rs2_depend_i0_x = _T_880 & _T_881; // @[el2_dec_decode_ctl.scala 771:63]
  wire  _T_882 = io_dec_i0_rs2_en_d & r_d_bits_i0v; // @[el2_dec_decode_ctl.scala 772:48]
  wire  _T_883 = r_d_bits_i0rd == i0r_rs2; // @[el2_dec_decode_ctl.scala 772:80]
  wire  i0_rs2_depend_i0_r = _T_882 & _T_883; // @[el2_dec_decode_ctl.scala 772:63]
  wire [1:0] _T_900 = i0_rs2_depend_i0_r ? 2'h2 : 2'h0; // @[el2_dec_decode_ctl.scala 777:63]
  wire [1:0] i0_rs2_depth_d = i0_rs2_depend_i0_x ? 2'h1 : _T_900; // @[el2_dec_decode_ctl.scala 777:24]
  wire  _T_907 = i0_dp_store & i0_rs2_depth_d[0]; // @[el2_dec_decode_ctl.scala 789:43]
  wire  _T_896_load = i0_rs2_depend_i0_r & i0_r_c_load; // @[el2_dec_decode_ctl.scala 776:61]
  wire  i0_rs2_class_d_load = i0_rs2_depend_i0_x ? i0_x_c_load : _T_896_load; // @[el2_dec_decode_ctl.scala 776:24]
  wire  store_data_bypass_d = _T_907 & i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 789:63]
  wire  _T_349 = i0_dp_csr_clr | i0_dp_csr_set; // @[el2_dec_decode_ctl.scala 463:42]
  reg  r_d_bits_csrwen; // @[el2_lib.scala 524:16]
  reg  r_d_valid; // @[el2_lib.scala 524:16]
  wire  _T_352 = r_d_bits_csrwen & r_d_valid; // @[el2_dec_decode_ctl.scala 471:39]
  reg [11:0] r_d_bits_csrwaddr; // @[el2_lib.scala 524:16]
  wire  _T_355 = r_d_bits_csrwaddr == 12'h300; // @[el2_dec_decode_ctl.scala 474:50]
  wire  _T_356 = r_d_bits_csrwaddr == 12'h304; // @[el2_dec_decode_ctl.scala 474:85]
  wire  _T_357 = _T_355 | _T_356; // @[el2_dec_decode_ctl.scala 474:64]
  wire  _T_358 = _T_357 & r_d_bits_csrwen; // @[el2_dec_decode_ctl.scala 474:100]
  wire  _T_359 = _T_358 & r_d_valid; // @[el2_dec_decode_ctl.scala 474:118]
  wire  _T_360 = ~io_dec_tlu_i0_kill_writeb_wb; // @[el2_dec_decode_ctl.scala 474:132]
  reg  csr_read_x; // @[el2_dec_decode_ctl.scala 476:52]
  reg  csr_clr_x; // @[el2_dec_decode_ctl.scala 477:51]
  reg  csr_set_x; // @[el2_dec_decode_ctl.scala 478:51]
  reg  csr_write_x; // @[el2_dec_decode_ctl.scala 479:53]
  reg  csr_imm_x; // @[el2_dec_decode_ctl.scala 480:51]
  wire  i0_x_data_en = i0_pipe_en[3] | io_clk_override; // @[el2_dec_decode_ctl.scala 657:50]
  reg [4:0] csrimm_x; // @[el2_lib.scala 514:16]
  reg [31:0] csr_rddata_x; // @[el2_lib.scala 514:16]
  wire [31:0] _T_394 = {27'h0,csrimm_x}; // @[Cat.scala 29:58]
  wire  _T_396 = ~csr_imm_x; // @[el2_dec_decode_ctl.scala 488:5]
  wire [31:0] _T_397 = csr_imm_x ? _T_394 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_398 = _T_396 ? io_exu_csr_rs1_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] csr_mask_x = _T_397 | _T_398; // @[Mux.scala 27:72]
  wire [31:0] _T_400 = ~csr_mask_x; // @[el2_dec_decode_ctl.scala 491:38]
  wire [31:0] _T_401 = csr_rddata_x & _T_400; // @[el2_dec_decode_ctl.scala 491:35]
  wire [31:0] _T_402 = csr_rddata_x | csr_mask_x; // @[el2_dec_decode_ctl.scala 492:35]
  wire [31:0] _T_403 = csr_clr_x ? _T_401 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = csr_set_x ? _T_402 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_405 = csr_write_x ? csr_mask_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_406 = _T_403 | _T_404; // @[Mux.scala 27:72]
  wire [31:0] write_csr_data_x = _T_406 | _T_405; // @[Mux.scala 27:72]
  wire  _T_418 = ~tlu_wr_pause_r1; // @[el2_dec_decode_ctl.scala 502:44]
  wire  _T_419 = ~tlu_wr_pause_r2; // @[el2_dec_decode_ctl.scala 502:64]
  wire  _T_420 = _T_418 & _T_419; // @[el2_dec_decode_ctl.scala 502:61]
  wire [31:0] _T_423 = write_csr_data - 32'h1; // @[el2_dec_decode_ctl.scala 505:59]
  wire  _T_425 = csr_clr_x | csr_set_x; // @[el2_dec_decode_ctl.scala 507:34]
  wire  _T_426 = _T_425 | csr_write_x; // @[el2_dec_decode_ctl.scala 507:46]
  wire  _T_427 = _T_426 & csr_read_x; // @[el2_dec_decode_ctl.scala 507:61]
  wire  _T_428 = _T_427 | io_dec_tlu_wr_pause_r; // @[el2_dec_decode_ctl.scala 507:75]
  reg  r_d_bits_csrwonly; // @[el2_lib.scala 524:16]
  wire  _T_764 = r_d_bits_i0v & r_d_bits_i0load; // @[el2_dec_decode_ctl.scala 710:42]
  reg [31:0] i0_result_r_raw; // @[el2_lib.scala 514:16]
  wire [31:0] i0_result_corr_r = _T_764 ? io_lsu_result_corr_r : i0_result_r_raw; // @[el2_dec_decode_ctl.scala 710:27]
  reg  x_d_bits_csrwonly; // @[el2_lib.scala 524:16]
  wire  _T_432 = x_d_bits_csrwonly | r_d_bits_csrwonly; // @[el2_dec_decode_ctl.scala 516:43]
  reg  wbd_bits_csrwonly; // @[el2_lib.scala 524:16]
  wire  prior_csr_write = _T_432 | wbd_bits_csrwonly; // @[el2_dec_decode_ctl.scala 516:63]
  wire  debug_fence_raw = io_dec_debug_fence_d & io_dbg_cmd_wrdata[1]; // @[el2_dec_decode_ctl.scala 519:48]
  wire  debug_fence = debug_fence_raw | debug_fence_i; // @[el2_dec_decode_ctl.scala 520:40]
  wire  _T_436 = i0_dp_presync | io_dec_tlu_presync_d; // @[el2_dec_decode_ctl.scala 523:34]
  wire  _T_437 = _T_436 | debug_fence_i; // @[el2_dec_decode_ctl.scala 523:57]
  wire  _T_438 = _T_437 | debug_fence_raw; // @[el2_dec_decode_ctl.scala 523:73]
  wire  i0_presync = _T_438 | io_dec_tlu_pipelining_disable; // @[el2_dec_decode_ctl.scala 523:91]
  wire [31:0] _T_462 = {16'h0,io_ifu_i0_cinst}; // @[Cat.scala 29:58]
  wire  _T_464 = ~illegal_lockout; // @[el2_dec_decode_ctl.scala 535:44]
  reg [31:0] _T_465; // @[el2_lib.scala 514:16]
  wire  i0_div_prior_div_stall = i0_dp_div & io_dec_div_active; // @[el2_dec_decode_ctl.scala 539:42]
  wire  _T_470 = i0_dp_csr_read & prior_csr_write; // @[el2_dec_decode_ctl.scala 541:40]
  wire  _T_471 = _T_470 | io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 541:59]
  wire  _T_472 = _T_471 | pause_stall; // @[el2_dec_decode_ctl.scala 541:81]
  wire  _T_473 = _T_472 | leak1_i0_stall; // @[el2_dec_decode_ctl.scala 541:95]
  wire  _T_474 = _T_473 | io_dec_tlu_debug_stall; // @[el2_dec_decode_ctl.scala 542:20]
  wire  _T_475 = _T_474 | postsync_stall; // @[el2_dec_decode_ctl.scala 542:45]
  wire  prior_inflight = x_d_valid | r_d_valid; // @[el2_dec_decode_ctl.scala 564:41]
  wire  prior_inflight_eff = i0_dp_div ? x_d_valid : prior_inflight; // @[el2_dec_decode_ctl.scala 565:31]
  wire  presync_stall = i0_presync & prior_inflight_eff; // @[el2_dec_decode_ctl.scala 567:37]
  wire  _T_476 = _T_475 | presync_stall; // @[el2_dec_decode_ctl.scala 542:62]
  wire  _T_477 = i0_dp_fence | debug_fence; // @[el2_dec_decode_ctl.scala 543:19]
  wire  _T_478 = ~lsu_idle; // @[el2_dec_decode_ctl.scala 543:36]
  wire  _T_479 = _T_477 & _T_478; // @[el2_dec_decode_ctl.scala 543:34]
  wire  _T_480 = _T_476 | _T_479; // @[el2_dec_decode_ctl.scala 542:79]
  wire  _T_481 = _T_480 | i0_nonblock_load_stall; // @[el2_dec_decode_ctl.scala 543:47]
  wire  _T_822 = io_dec_i0_rs1_en_d & io_dec_div_active; // @[el2_dec_decode_ctl.scala 738:49]
  wire  _T_823 = io_div_waddr_wb == i0r_rs1; // @[el2_dec_decode_ctl.scala 738:88]
  wire  _T_824 = _T_822 & _T_823; // @[el2_dec_decode_ctl.scala 738:69]
  wire  _T_825 = io_dec_i0_rs2_en_d & io_dec_div_active; // @[el2_dec_decode_ctl.scala 739:25]
  wire  _T_826 = io_div_waddr_wb == i0r_rs2; // @[el2_dec_decode_ctl.scala 739:64]
  wire  _T_827 = _T_825 & _T_826; // @[el2_dec_decode_ctl.scala 739:45]
  wire  i0_nonblock_div_stall = _T_824 | _T_827; // @[el2_dec_decode_ctl.scala 738:102]
  wire  _T_483 = _T_481 | i0_nonblock_div_stall; // @[el2_dec_decode_ctl.scala 544:21]
  wire  i0_block_raw_d = _T_483 | i0_div_prior_div_stall; // @[el2_dec_decode_ctl.scala 544:45]
  wire  _T_484 = io_lsu_store_stall_any | io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 546:65]
  wire  i0_store_stall_d = i0_dp_store & _T_484; // @[el2_dec_decode_ctl.scala 546:39]
  wire  _T_485 = io_lsu_load_stall_any | io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 547:63]
  wire  i0_load_stall_d = i0_dp_load & _T_485; // @[el2_dec_decode_ctl.scala 547:38]
  wire  _T_486 = i0_block_raw_d | i0_store_stall_d; // @[el2_dec_decode_ctl.scala 548:38]
  wire  i0_block_d = _T_486 | i0_load_stall_d; // @[el2_dec_decode_ctl.scala 548:57]
  wire  _T_487 = ~i0_block_d; // @[el2_dec_decode_ctl.scala 552:46]
  wire  _T_488 = io_dec_ib0_valid_d & _T_487; // @[el2_dec_decode_ctl.scala 552:44]
  wire  _T_490 = _T_488 & _T_280; // @[el2_dec_decode_ctl.scala 552:61]
  wire  _T_493 = ~i0_block_raw_d; // @[el2_dec_decode_ctl.scala 553:46]
  wire  _T_494 = io_dec_ib0_valid_d & _T_493; // @[el2_dec_decode_ctl.scala 553:44]
  wire  _T_496 = _T_494 & _T_280; // @[el2_dec_decode_ctl.scala 553:61]
  wire  i0_exudecode_d = _T_496 & _T_467; // @[el2_dec_decode_ctl.scala 553:89]
  wire  i0_exulegal_decode_d = i0_exudecode_d & i0_legal; // @[el2_dec_decode_ctl.scala 554:46]
  wire  _T_498 = ~io_dec_i0_decode_d; // @[el2_dec_decode_ctl.scala 558:51]
  wire  _T_517 = i0_dp_fence_i | debug_fence_i; // @[el2_dec_decode_ctl.scala 586:44]
  wire [3:0] _T_522 = {io_dec_i0_decode_d,io_dec_i0_decode_d,io_dec_i0_decode_d,io_dec_i0_decode_d}; // @[Cat.scala 29:58]
  wire  _T_704 = |i0_pipe_en[3:2]; // @[el2_dec_decode_ctl.scala 654:49]
  wire  i0_x_ctl_en = _T_704 | io_clk_override; // @[el2_dec_decode_ctl.scala 654:53]
  reg  x_t_legal; // @[el2_lib.scala 524:16]
  reg  x_t_icaf; // @[el2_lib.scala 524:16]
  reg  x_t_icaf_f1; // @[el2_lib.scala 524:16]
  reg [1:0] x_t_icaf_type; // @[el2_lib.scala 524:16]
  reg  x_t_fence_i; // @[el2_lib.scala 524:16]
  reg [3:0] x_t_i0trigger; // @[el2_lib.scala 524:16]
  reg [3:0] x_t_pmu_i0_itype; // @[el2_lib.scala 524:16]
  reg  x_t_pmu_i0_br_unpred; // @[el2_lib.scala 524:16]
  wire [3:0] _T_530 = {io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb}; // @[Cat.scala 29:58]
  wire [3:0] _T_531 = ~_T_530; // @[el2_dec_decode_ctl.scala 599:39]
  reg  r_t_legal; // @[el2_lib.scala 524:16]
  reg  r_t_icaf; // @[el2_lib.scala 524:16]
  reg  r_t_icaf_f1; // @[el2_lib.scala 524:16]
  reg [1:0] r_t_icaf_type; // @[el2_lib.scala 524:16]
  reg  r_t_fence_i; // @[el2_lib.scala 524:16]
  reg [3:0] r_t_i0trigger; // @[el2_lib.scala 524:16]
  reg [3:0] r_t_pmu_i0_itype; // @[el2_lib.scala 524:16]
  reg  r_t_pmu_i0_br_unpred; // @[el2_lib.scala 524:16]
  reg [3:0] lsu_trigger_match_r; // @[el2_dec_decode_ctl.scala 602:36]
  reg  lsu_pmu_misaligned_r; // @[el2_dec_decode_ctl.scala 603:37]
  reg  r_d_bits_i0store; // @[el2_lib.scala 524:16]
  wire  _T_536 = r_d_bits_i0load | r_d_bits_i0store; // @[el2_dec_decode_ctl.scala 607:61]
  wire [3:0] _T_540 = {_T_536,_T_536,_T_536,_T_536}; // @[Cat.scala 29:58]
  wire [3:0] _T_541 = _T_540 & lsu_trigger_match_r; // @[el2_dec_decode_ctl.scala 607:82]
  wire [3:0] _T_542 = _T_541 | r_t_i0trigger; // @[el2_dec_decode_ctl.scala 607:105]
  reg  r_d_bits_i0div; // @[el2_lib.scala 524:16]
  wire  _T_545 = r_d_bits_i0div & r_d_valid; // @[el2_dec_decode_ctl.scala 613:58]
  wire  _T_556 = i0r_rs1 != 5'h0; // @[el2_dec_decode_ctl.scala 624:49]
  wire  _T_558 = i0r_rs2 != 5'h0; // @[el2_dec_decode_ctl.scala 625:49]
  wire  _T_560 = i0r_rd != 5'h0; // @[el2_dec_decode_ctl.scala 626:48]
  wire  i0_rd_en_d = i0_dp_rd & _T_560; // @[el2_dec_decode_ctl.scala 626:37]
  wire  i0_jalimm20 = i0_dp_jal & i0_dp_imm20; // @[el2_dec_decode_ctl.scala 630:38]
  wire  _T_561 = ~i0_dp_jal; // @[el2_dec_decode_ctl.scala 631:27]
  wire  i0_uiimm20 = _T_561 & i0_dp_imm20; // @[el2_dec_decode_ctl.scala 631:38]
  wire [31:0] _T_563 = i0_dp_csr_read ? io_dec_csr_rddata_d : 32'h0; // @[Mux.scala 27:72]
  wire [9:0] _T_577 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31]}; // @[Cat.scala 29:58]
  wire [18:0] _T_586 = {_T_577,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31]}; // @[Cat.scala 29:58]
  wire [31:0] _T_589 = {_T_586,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31:20]}; // @[Cat.scala 29:58]
  wire [31:0] _T_684 = i0_dp_imm12 ? _T_589 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_618 = {27'h0,i0r_rs2}; // @[Cat.scala 29:58]
  wire [31:0] _T_685 = i0_dp_shimm5 ? _T_618 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_689 = _T_684 | _T_685; // @[Mux.scala 27:72]
  wire [31:0] _T_638 = {_T_577,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_686 = i0_jalimm20 ? _T_638 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_690 = _T_689 | _T_686; // @[Mux.scala 27:72]
  wire [31:0] _T_652 = {io_dec_i0_instr_d[31:12],12'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_687 = i0_uiimm20 ? _T_652 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_691 = _T_690 | _T_687; // @[Mux.scala 27:72]
  wire  _T_653 = i0_csr_write_only_d & i0_dp_csr_imm; // @[el2_dec_decode_ctl.scala 642:26]
  wire [31:0] _T_683 = {27'h0,i0r_rs1}; // @[Cat.scala 29:58]
  wire [31:0] _T_688 = _T_653 ? _T_683 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] i0_immed_d = _T_691 | _T_688; // @[Mux.scala 27:72]
  wire [31:0] _T_564 = _T_347 ? i0_immed_d : 32'h0; // @[Mux.scala 27:72]
  wire  i0_d_c_mul = i0_dp_mul & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 646:44]
  wire  i0_d_c_load = i0_dp_load & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 647:44]
  wire  i0_d_c_alu = i0_dp_alu & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 648:44]
  reg  i0_x_c_mul; // @[Reg.scala 15:16]
  reg  i0_x_c_alu; // @[Reg.scala 15:16]
  reg  i0_r_c_mul; // @[Reg.scala 15:16]
  reg  i0_r_c_alu; // @[Reg.scala 15:16]
  wire  _T_710 = |i0_pipe_en[1:0]; // @[el2_dec_decode_ctl.scala 656:49]
  wire  i0_r_data_en = i0_pipe_en[2] | io_clk_override; // @[el2_dec_decode_ctl.scala 658:50]
  reg  x_d_bits_i0store; // @[el2_lib.scala 524:16]
  reg  x_d_bits_i0div; // @[el2_lib.scala 524:16]
  reg  x_d_bits_csrwen; // @[el2_lib.scala 524:16]
  reg [11:0] x_d_bits_csrwaddr; // @[el2_lib.scala 524:16]
  wire  _T_733 = x_d_bits_i0v & _T_743; // @[el2_dec_decode_ctl.scala 680:47]
  wire  _T_737 = x_d_valid & _T_743; // @[el2_dec_decode_ctl.scala 681:33]
  wire  _T_756 = ~r_d_bits_i0div; // @[el2_dec_decode_ctl.scala 696:49]
  wire  _T_757 = i0_wen_r & _T_756; // @[el2_dec_decode_ctl.scala 696:47]
  wire  _T_758 = ~i0_load_kill_wen_r; // @[el2_dec_decode_ctl.scala 696:70]
  wire  _T_761 = x_d_bits_i0v & x_d_bits_i0load; // @[el2_dec_decode_ctl.scala 705:47]
  wire  _T_768 = io_i0_ap_predict_nt & _T_561; // @[el2_dec_decode_ctl.scala 711:52]
  wire [11:0] _T_781 = {10'h0,io_dec_i0_pc4_d,i0_ap_pc2}; // @[Cat.scala 29:58]
  reg [11:0] last_br_immed_x; // @[el2_lib.scala 514:16]
  wire  _T_799 = x_d_bits_i0div & x_d_valid; // @[el2_dec_decode_ctl.scala 719:45]
  wire  div_e1_to_r = _T_799 | _T_545; // @[el2_dec_decode_ctl.scala 719:58]
  wire  _T_802 = x_d_bits_i0rd == 5'h0; // @[el2_dec_decode_ctl.scala 721:77]
  wire  _T_803 = _T_799 & _T_802; // @[el2_dec_decode_ctl.scala 721:60]
  wire  _T_805 = _T_799 & io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 722:33]
  wire  _T_806 = _T_803 | _T_805; // @[el2_dec_decode_ctl.scala 721:94]
  wire  _T_808 = _T_545 & io_dec_tlu_flush_lower_r; // @[el2_dec_decode_ctl.scala 723:33]
  wire  _T_809 = _T_808 & io_dec_tlu_i0_kill_writeb_r; // @[el2_dec_decode_ctl.scala 723:60]
  wire  div_flush = _T_806 | _T_809; // @[el2_dec_decode_ctl.scala 722:62]
  wire  _T_810 = io_dec_div_active & div_flush; // @[el2_dec_decode_ctl.scala 727:51]
  wire  _T_811 = ~div_e1_to_r; // @[el2_dec_decode_ctl.scala 728:26]
  wire  _T_812 = io_dec_div_active & _T_811; // @[el2_dec_decode_ctl.scala 728:24]
  wire  _T_813 = r_d_bits_i0rd == io_div_waddr_wb; // @[el2_dec_decode_ctl.scala 728:56]
  wire  _T_814 = _T_812 & _T_813; // @[el2_dec_decode_ctl.scala 728:39]
  wire  _T_815 = _T_814 & i0_wen_r; // @[el2_dec_decode_ctl.scala 728:77]
  wire  nonblock_div_cancel = _T_810 | _T_815; // @[el2_dec_decode_ctl.scala 727:65]
  wire  i0_div_decode_d = i0_legal_decode_d & i0_dp_div; // @[el2_dec_decode_ctl.scala 731:55]
  wire  _T_817 = ~io_exu_div_wren; // @[el2_dec_decode_ctl.scala 733:62]
  wire  _T_818 = io_dec_div_active & _T_817; // @[el2_dec_decode_ctl.scala 733:60]
  wire  _T_819 = ~nonblock_div_cancel; // @[el2_dec_decode_ctl.scala 733:81]
  wire  _T_820 = _T_818 & _T_819; // @[el2_dec_decode_ctl.scala 733:79]
  reg  _T_821; // @[el2_dec_decode_ctl.scala 735:54]
  reg [4:0] _T_830; // @[Reg.scala 27:20]
  reg [31:0] i0_inst_x; // @[el2_lib.scala 514:16]
  reg [31:0] i0_inst_r; // @[el2_lib.scala 514:16]
  reg [31:0] i0_inst_wb; // @[el2_lib.scala 514:16]
  reg [31:0] _T_837; // @[el2_lib.scala 514:16]
  reg [30:0] i0_pc_wb; // @[el2_lib.scala 514:16]
  reg [30:0] _T_840; // @[el2_lib.scala 514:16]
  reg [30:0] dec_i0_pc_r; // @[el2_lib.scala 514:16]
  wire [31:0] _T_842 = {io_exu_i0_pc_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_843 = {last_br_immed_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_846 = _T_842[12:1] + _T_843[12:1]; // @[el2_lib.scala 208:31]
  wire [18:0] _T_849 = _T_842[31:13] + 19'h1; // @[el2_lib.scala 209:27]
  wire [18:0] _T_852 = _T_842[31:13] - 19'h1; // @[el2_lib.scala 210:27]
  wire  _T_855 = ~_T_846[12]; // @[el2_lib.scala 212:28]
  wire  _T_856 = _T_843[12] ^ _T_855; // @[el2_lib.scala 212:26]
  wire  _T_859 = ~_T_843[12]; // @[el2_lib.scala 213:20]
  wire  _T_861 = _T_859 & _T_846[12]; // @[el2_lib.scala 213:26]
  wire  _T_865 = _T_843[12] & _T_855; // @[el2_lib.scala 214:26]
  wire [18:0] _T_867 = _T_856 ? _T_842[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_868 = _T_861 ? _T_849 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_869 = _T_865 ? _T_852 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_870 = _T_867 | _T_868; // @[Mux.scala 27:72]
  wire [18:0] _T_871 = _T_870 | _T_869; // @[Mux.scala 27:72]
  wire [31:0] temp_pred_correct_npc_x = {_T_871,_T_846[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_887_mul = i0_rs1_depend_i0_r & i0_r_c_mul; // @[el2_dec_decode_ctl.scala 774:61]
  wire  _T_887_alu = i0_rs1_depend_i0_r & i0_r_c_alu; // @[el2_dec_decode_ctl.scala 774:61]
  wire  i0_rs1_class_d_mul = i0_rs1_depend_i0_x ? i0_x_c_mul : _T_887_mul; // @[el2_dec_decode_ctl.scala 774:24]
  wire  i0_rs1_class_d_alu = i0_rs1_depend_i0_x ? i0_x_c_alu : _T_887_alu; // @[el2_dec_decode_ctl.scala 774:24]
  wire  _T_896_mul = i0_rs2_depend_i0_r & i0_r_c_mul; // @[el2_dec_decode_ctl.scala 776:61]
  wire  _T_896_alu = i0_rs2_depend_i0_r & i0_r_c_alu; // @[el2_dec_decode_ctl.scala 776:61]
  wire  i0_rs2_class_d_mul = i0_rs2_depend_i0_x ? i0_x_c_mul : _T_896_mul; // @[el2_dec_decode_ctl.scala 776:24]
  wire  i0_rs2_class_d_alu = i0_rs2_depend_i0_x ? i0_x_c_alu : _T_896_alu; // @[el2_dec_decode_ctl.scala 776:24]
  wire  _T_909 = io_dec_i0_rs1_en_d & io_dec_nonblock_load_wen; // @[el2_dec_decode_ctl.scala 794:62]
  wire  _T_910 = io_dec_nonblock_load_waddr == i0r_rs1; // @[el2_dec_decode_ctl.scala 794:119]
  wire  i0_rs1_nonblock_load_bypass_en_d = _T_909 & _T_910; // @[el2_dec_decode_ctl.scala 794:89]
  wire  _T_911 = io_dec_i0_rs2_en_d & io_dec_nonblock_load_wen; // @[el2_dec_decode_ctl.scala 796:62]
  wire  _T_912 = io_dec_nonblock_load_waddr == i0r_rs2; // @[el2_dec_decode_ctl.scala 796:119]
  wire  i0_rs2_nonblock_load_bypass_en_d = _T_911 & _T_912; // @[el2_dec_decode_ctl.scala 796:89]
  wire  _T_914 = i0_rs1_class_d_alu | i0_rs1_class_d_mul; // @[el2_dec_decode_ctl.scala 799:66]
  wire  _T_915 = i0_rs1_depth_d[0] & _T_914; // @[el2_dec_decode_ctl.scala 799:45]
  wire  _T_917 = i0_rs1_depth_d[0] & i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 799:108]
  wire  _T_920 = _T_914 | i0_rs1_class_d_load; // @[el2_dec_decode_ctl.scala 799:196]
  wire  _T_921 = i0_rs1_depth_d[1] & _T_920; // @[el2_dec_decode_ctl.scala 799:153]
  wire [2:0] i0_rs1bypass = {_T_915,_T_917,_T_921}; // @[Cat.scala 29:58]
  wire  _T_925 = i0_rs2_class_d_alu | i0_rs2_class_d_mul; // @[el2_dec_decode_ctl.scala 801:67]
  wire  _T_926 = i0_rs2_depth_d[0] & _T_925; // @[el2_dec_decode_ctl.scala 801:45]
  wire  _T_928 = i0_rs2_depth_d[0] & i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 801:109]
  wire  _T_931 = _T_925 | i0_rs2_class_d_load; // @[el2_dec_decode_ctl.scala 801:196]
  wire  _T_932 = i0_rs2_depth_d[1] & _T_931; // @[el2_dec_decode_ctl.scala 801:153]
  wire [2:0] i0_rs2bypass = {_T_926,_T_928,_T_932}; // @[Cat.scala 29:58]
  wire  _T_938 = i0_rs1bypass[1] | i0_rs1bypass[0]; // @[el2_dec_decode_ctl.scala 803:75]
  wire  _T_940 = ~i0_rs1bypass[2]; // @[el2_dec_decode_ctl.scala 803:96]
  wire  _T_941 = _T_940 & i0_rs1_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 803:113]
  wire  _T_942 = _T_938 | _T_941; // @[el2_dec_decode_ctl.scala 803:93]
  wire  _T_947 = i0_rs2bypass[1] | i0_rs2bypass[0]; // @[el2_dec_decode_ctl.scala 804:75]
  wire  _T_949 = ~i0_rs2bypass[2]; // @[el2_dec_decode_ctl.scala 804:96]
  wire  _T_950 = _T_949 & i0_rs2_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 804:113]
  wire  _T_951 = _T_947 | _T_950; // @[el2_dec_decode_ctl.scala 804:93]
  wire  _T_958 = ~i0_rs1bypass[1]; // @[el2_dec_decode_ctl.scala 810:6]
  wire  _T_960 = ~i0_rs1bypass[0]; // @[el2_dec_decode_ctl.scala 810:25]
  wire  _T_961 = _T_958 & _T_960; // @[el2_dec_decode_ctl.scala 810:23]
  wire  _T_962 = _T_961 & i0_rs1_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 810:42]
  wire [31:0] _T_964 = i0_rs1bypass[1] ? io_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_965 = i0_rs1bypass[0] ? i0_result_r_raw : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_966 = _T_962 ? io_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_967 = _T_964 | _T_965; // @[Mux.scala 27:72]
  wire  _T_975 = ~i0_rs2bypass[1]; // @[el2_dec_decode_ctl.scala 815:6]
  wire  _T_977 = ~i0_rs2bypass[0]; // @[el2_dec_decode_ctl.scala 815:25]
  wire  _T_978 = _T_975 & _T_977; // @[el2_dec_decode_ctl.scala 815:23]
  wire  _T_979 = _T_978 & i0_rs2_nonblock_load_bypass_en_d; // @[el2_dec_decode_ctl.scala 815:42]
  wire [31:0] _T_981 = i0_rs2bypass[1] ? io_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_982 = i0_rs2bypass[0] ? i0_result_r_raw : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_983 = _T_979 ? io_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_984 = _T_981 | _T_982; // @[Mux.scala 27:72]
  wire  _T_987 = i0_dp_raw_load | i0_dp_raw_store; // @[el2_dec_decode_ctl.scala 817:68]
  wire  _T_988 = io_dec_ib0_valid_d & _T_987; // @[el2_dec_decode_ctl.scala 817:50]
  wire  _T_989 = ~io_dma_dccm_stall_any; // @[el2_dec_decode_ctl.scala 817:89]
  wire  _T_990 = _T_988 & _T_989; // @[el2_dec_decode_ctl.scala 817:87]
  wire  _T_992 = _T_990 & _T_493; // @[el2_dec_decode_ctl.scala 817:112]
  wire  _T_994 = ~io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 819:6]
  wire  _T_995 = _T_994 & i0_dp_lsu; // @[el2_dec_decode_ctl.scala 819:27]
  wire  _T_996 = _T_995 & i0_dp_load; // @[el2_dec_decode_ctl.scala 819:39]
  wire  _T_1001 = _T_995 & i0_dp_store; // @[el2_dec_decode_ctl.scala 820:39]
  wire [11:0] _T_1005 = {io_dec_i0_instr_d[31:25],i0r_rd}; // @[Cat.scala 29:58]
  wire [11:0] _T_1006 = _T_996 ? io_dec_i0_instr_d[31:20] : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1007 = _T_1001 ? _T_1005 : 12'h0; // @[Mux.scala 27:72]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  el2_dec_dec_ctl i0_dec ( // @[el2_dec_decode_ctl.scala 392:22]
    .io_ins(i0_dec_io_ins),
    .io_out_alu(i0_dec_io_out_alu),
    .io_out_rs1(i0_dec_io_out_rs1),
    .io_out_rs2(i0_dec_io_out_rs2),
    .io_out_imm12(i0_dec_io_out_imm12),
    .io_out_rd(i0_dec_io_out_rd),
    .io_out_shimm5(i0_dec_io_out_shimm5),
    .io_out_imm20(i0_dec_io_out_imm20),
    .io_out_pc(i0_dec_io_out_pc),
    .io_out_load(i0_dec_io_out_load),
    .io_out_store(i0_dec_io_out_store),
    .io_out_lsu(i0_dec_io_out_lsu),
    .io_out_add(i0_dec_io_out_add),
    .io_out_sub(i0_dec_io_out_sub),
    .io_out_land(i0_dec_io_out_land),
    .io_out_lor(i0_dec_io_out_lor),
    .io_out_lxor(i0_dec_io_out_lxor),
    .io_out_sll(i0_dec_io_out_sll),
    .io_out_sra(i0_dec_io_out_sra),
    .io_out_srl(i0_dec_io_out_srl),
    .io_out_slt(i0_dec_io_out_slt),
    .io_out_unsign(i0_dec_io_out_unsign),
    .io_out_condbr(i0_dec_io_out_condbr),
    .io_out_beq(i0_dec_io_out_beq),
    .io_out_bne(i0_dec_io_out_bne),
    .io_out_bge(i0_dec_io_out_bge),
    .io_out_blt(i0_dec_io_out_blt),
    .io_out_jal(i0_dec_io_out_jal),
    .io_out_by(i0_dec_io_out_by),
    .io_out_half(i0_dec_io_out_half),
    .io_out_word(i0_dec_io_out_word),
    .io_out_csr_read(i0_dec_io_out_csr_read),
    .io_out_csr_clr(i0_dec_io_out_csr_clr),
    .io_out_csr_set(i0_dec_io_out_csr_set),
    .io_out_csr_write(i0_dec_io_out_csr_write),
    .io_out_csr_imm(i0_dec_io_out_csr_imm),
    .io_out_presync(i0_dec_io_out_presync),
    .io_out_postsync(i0_dec_io_out_postsync),
    .io_out_ebreak(i0_dec_io_out_ebreak),
    .io_out_ecall(i0_dec_io_out_ecall),
    .io_out_mret(i0_dec_io_out_mret),
    .io_out_mul(i0_dec_io_out_mul),
    .io_out_rs1_sign(i0_dec_io_out_rs1_sign),
    .io_out_rs2_sign(i0_dec_io_out_rs2_sign),
    .io_out_low(i0_dec_io_out_low),
    .io_out_div(i0_dec_io_out_div),
    .io_out_rem(i0_dec_io_out_rem),
    .io_out_fence(i0_dec_io_out_fence),
    .io_out_fence_i(i0_dec_io_out_fence_i),
    .io_out_pm_alu(i0_dec_io_out_pm_alu),
    .io_out_legal(i0_dec_io_out_legal)
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
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 518:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 518:23]
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
  assign io_dec_extint_stall = _T_339; // @[el2_dec_decode_ctl.scala 432:23]
  assign io_dec_i0_inst_wb1 = _T_837; // @[el2_dec_decode_ctl.scala 753:22]
  assign io_dec_i0_pc_wb1 = _T_840; // @[el2_dec_decode_ctl.scala 756:20]
  assign io_dec_i0_rs1_en_d = i0_dp_rs1 & _T_556; // @[el2_dec_decode_ctl.scala 624:24]
  assign io_dec_i0_rs2_en_d = i0_dp_rs2 & _T_558; // @[el2_dec_decode_ctl.scala 625:24]
  assign io_dec_i0_rs1_d = io_dec_i0_instr_d[19:15]; // @[el2_dec_decode_ctl.scala 627:19]
  assign io_dec_i0_rs2_d = io_dec_i0_instr_d[24:20]; // @[el2_dec_decode_ctl.scala 628:19]
  assign io_dec_i0_immed_d = _T_563 | _T_564; // @[el2_dec_decode_ctl.scala 633:21]
  assign io_dec_i0_br_immed_d = _T_768 ? i0_br_offset : _T_781; // @[el2_dec_decode_ctl.scala 711:24]
  assign io_i0_ap_land = _T_41 ? 1'h0 : i0_dp_raw_land; // @[el2_dec_decode_ctl.scala 285:20]
  assign io_i0_ap_lor = _T_41 | i0_dp_raw_lor; // @[el2_dec_decode_ctl.scala 286:20]
  assign io_i0_ap_lxor = _T_41 ? 1'h0 : i0_dp_raw_lxor; // @[el2_dec_decode_ctl.scala 287:20]
  assign io_i0_ap_sll = _T_41 ? 1'h0 : i0_dp_raw_sll; // @[el2_dec_decode_ctl.scala 288:20]
  assign io_i0_ap_srl = _T_41 ? 1'h0 : i0_dp_raw_srl; // @[el2_dec_decode_ctl.scala 289:20]
  assign io_i0_ap_sra = _T_41 ? 1'h0 : i0_dp_raw_sra; // @[el2_dec_decode_ctl.scala 290:20]
  assign io_i0_ap_beq = _T_41 ? 1'h0 : i0_dp_raw_beq; // @[el2_dec_decode_ctl.scala 293:20]
  assign io_i0_ap_bne = _T_41 ? 1'h0 : i0_dp_raw_bne; // @[el2_dec_decode_ctl.scala 294:20]
  assign io_i0_ap_blt = _T_41 ? 1'h0 : i0_dp_raw_blt; // @[el2_dec_decode_ctl.scala 295:20]
  assign io_i0_ap_bge = _T_41 ? 1'h0 : i0_dp_raw_bge; // @[el2_dec_decode_ctl.scala 296:20]
  assign io_i0_ap_add = _T_41 ? 1'h0 : i0_dp_raw_add; // @[el2_dec_decode_ctl.scala 283:20]
  assign io_i0_ap_sub = _T_41 ? 1'h0 : i0_dp_raw_sub; // @[el2_dec_decode_ctl.scala 284:20]
  assign io_i0_ap_slt = _T_41 ? 1'h0 : i0_dp_raw_slt; // @[el2_dec_decode_ctl.scala 291:20]
  assign io_i0_ap_unsign = _T_41 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 292:20]
  assign io_i0_ap_jal = _T_336 & _T_337; // @[el2_dec_decode_ctl.scala 299:22]
  assign io_i0_ap_predict_t = _T_47 & i0_predict_br; // @[el2_dec_decode_ctl.scala 281:26]
  assign io_i0_ap_predict_nt = _T_48 & i0_predict_br; // @[el2_dec_decode_ctl.scala 280:26]
  assign io_i0_ap_csr_write = i0_csr_write & _T_347; // @[el2_dec_decode_ctl.scala 297:22]
  assign io_i0_ap_csr_imm = _T_41 ? 1'h0 : i0_dp_raw_csr_imm; // @[el2_dec_decode_ctl.scala 298:22]
  assign io_dec_i0_decode_d = _T_490 & _T_467; // @[el2_dec_decode_ctl.scala 552:22 el2_dec_decode_ctl.scala 618:22]
  assign io_dec_i0_alu_decode_d = i0_exulegal_decode_d & i0_dp_alu; // @[el2_dec_decode_ctl.scala 572:26]
  assign io_dec_i0_rs1_bypass_data_d = _T_967 | _T_966; // @[el2_dec_decode_ctl.scala 807:31]
  assign io_dec_i0_rs2_bypass_data_d = _T_984 | _T_983; // @[el2_dec_decode_ctl.scala 812:31]
  assign io_dec_i0_waddr_r = r_d_bits_i0rd; // @[el2_dec_decode_ctl.scala 694:27]
  assign io_dec_i0_wen_r = _T_757 & _T_758; // @[el2_dec_decode_ctl.scala 696:32]
  assign io_dec_i0_wdata_r = _T_764 ? io_lsu_result_corr_r : i0_result_r_raw; // @[el2_dec_decode_ctl.scala 697:26]
  assign io_dec_i0_select_pc_d = _T_41 ? 1'h0 : i0_dp_raw_pc; // @[el2_dec_decode_ctl.scala 271:25]
  assign io_dec_i0_rs1_bypass_en_d = {i0_rs1bypass[2],_T_942}; // @[el2_dec_decode_ctl.scala 803:34]
  assign io_dec_i0_rs2_bypass_en_d = {i0_rs2bypass[2],_T_951}; // @[el2_dec_decode_ctl.scala 804:34]
  assign io_lsu_p_valid = io_dec_extint_stall | lsu_decode_d; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 439:24 el2_dec_decode_ctl.scala 441:35]
  assign io_lsu_p_bits_fast_int = io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 438:29]
  assign io_lsu_p_bits_by = io_dec_extint_stall ? 1'h0 : i0_dp_by; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 444:40]
  assign io_lsu_p_bits_half = io_dec_extint_stall ? 1'h0 : i0_dp_half; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 445:40]
  assign io_lsu_p_bits_word = io_dec_extint_stall | i0_dp_word; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 437:29 el2_dec_decode_ctl.scala 446:40]
  assign io_lsu_p_bits_load = io_dec_extint_stall | i0_dp_load; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 436:29 el2_dec_decode_ctl.scala 442:40]
  assign io_lsu_p_bits_store = io_dec_extint_stall ? 1'h0 : i0_dp_store; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 443:40]
  assign io_lsu_p_bits_unsign = io_dec_extint_stall ? 1'h0 : i0_dp_unsign; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 450:40]
  assign io_lsu_p_bits_store_data_bypass_d = io_dec_extint_stall ? 1'h0 : store_data_bypass_d; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 448:40]
  assign io_lsu_p_bits_load_ldst_bypass_d = io_dec_extint_stall ? 1'h0 : load_ldst_bypass_d; // @[el2_dec_decode_ctl.scala 434:12 el2_dec_decode_ctl.scala 447:40]
  assign io_mul_p_valid = i0_exulegal_decode_d & i0_dp_mul; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 427:21]
  assign io_mul_p_bits_rs1_sign = _T_41 ? 1'h0 : i0_dp_raw_rs1_sign; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 428:26]
  assign io_mul_p_bits_rs2_sign = _T_41 ? 1'h0 : i0_dp_raw_rs2_sign; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 429:26]
  assign io_mul_p_bits_low = _T_41 ? 1'h0 : i0_dp_raw_low; // @[el2_dec_decode_ctl.scala 126:12 el2_dec_decode_ctl.scala 430:26]
  assign io_div_p_valid = i0_exulegal_decode_d & i0_dp_div; // @[el2_dec_decode_ctl.scala 423:21]
  assign io_div_p_bits_unsign = _T_41 ? 1'h0 : i0_dp_raw_unsign; // @[el2_dec_decode_ctl.scala 424:26]
  assign io_div_p_bits_rem = _T_41 ? 1'h0 : i0_dp_raw_rem; // @[el2_dec_decode_ctl.scala 425:26]
  assign io_div_waddr_wb = _T_830; // @[el2_dec_decode_ctl.scala 741:19]
  assign io_dec_div_cancel = _T_810 | _T_815; // @[el2_dec_decode_ctl.scala 730:29]
  assign io_dec_lsu_valid_raw_d = _T_992 | io_dec_extint_stall; // @[el2_dec_decode_ctl.scala 817:26]
  assign io_dec_lsu_offset_d = _T_1006 | _T_1007; // @[el2_dec_decode_ctl.scala 818:23]
  assign io_dec_csr_ren_d = _T_41 ? 1'h0 : i0_dp_raw_csr_read; // @[el2_dec_decode_ctl.scala 454:21]
  assign io_dec_csr_wen_unq_d = _T_349 | i0_csr_write; // @[el2_dec_decode_ctl.scala 463:24]
  assign io_dec_csr_any_unq_d = i0_dp_csr_read | i0_csr_write; // @[el2_dec_decode_ctl.scala 529:24]
  assign io_dec_csr_rdaddr_d = io_dec_i0_instr_d[31:20]; // @[el2_dec_decode_ctl.scala 466:24]
  assign io_dec_csr_wen_r = _T_352 & _T_754; // @[el2_dec_decode_ctl.scala 471:20]
  assign io_dec_csr_wraddr_r = r_d_bits_csrwaddr; // @[el2_dec_decode_ctl.scala 467:23]
  assign io_dec_csr_wrdata_r = r_d_bits_csrwonly ? i0_result_corr_r : write_csr_data; // @[el2_dec_decode_ctl.scala 514:24]
  assign io_dec_csr_stall_int_ff = _T_359 & _T_360; // @[el2_dec_decode_ctl.scala 474:27]
  assign io_dec_tlu_i0_valid_r = r_d_valid & _T_743; // @[el2_dec_decode_ctl.scala 578:29]
  assign io_dec_tlu_packet_r_legal = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_legal; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_icaf = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_icaf_f1 = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf_f1; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_icaf_type = io_dec_tlu_flush_lower_wb ? 2'h0 : r_t_icaf_type; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_fence_i = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_fence_i; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_i0trigger = io_dec_tlu_flush_lower_wb ? 4'h0 : _T_542; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_flush_lower_wb ? 4'h0 : r_t_pmu_i0_itype; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_pmu_i0_br_unpred; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_packet_r_pmu_divide = r_d_bits_i0div & r_d_valid; // @[el2_dec_decode_ctl.scala 612:39 el2_dec_decode_ctl.scala 613:39]
  assign io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_flush_lower_wb ? 1'h0 : lsu_pmu_misaligned_r; // @[el2_dec_decode_ctl.scala 612:39]
  assign io_dec_tlu_i0_pc_r = dec_i0_pc_r; // @[el2_dec_decode_ctl.scala 759:27]
  assign io_dec_illegal_inst = _T_465; // @[el2_dec_decode_ctl.scala 536:23]
  assign io_pred_correct_npc_x = temp_pred_correct_npc_x[31:1]; // @[el2_dec_decode_ctl.scala 764:25]
  assign io_dec_i0_predict_p_d_valid = i0_brp_valid & i0_legal_decode_d; // @[el2_dec_decode_ctl.scala 236:38]
  assign io_dec_i0_predict_p_d_bits_pc4 = io_dec_i0_pc4_d; // @[el2_dec_decode_ctl.scala 234:43]
  assign io_dec_i0_predict_p_d_bits_hist = io_dec_i0_brp_bits_hist; // @[el2_dec_decode_ctl.scala 235:43]
  assign io_dec_i0_predict_p_d_bits_toffset = _T_314 ? i0_pcall_imm[11:0] : _T_323; // @[el2_dec_decode_ctl.scala 248:49]
  assign io_dec_i0_predict_p_d_bits_br_error = _T_33 & _T_18; // @[el2_dec_decode_ctl.scala 243:56]
  assign io_dec_i0_predict_p_d_bits_br_start_error = _T_36 & _T_18; // @[el2_dec_decode_ctl.scala 244:56]
  assign io_dec_i0_predict_p_d_bits_prett = io_dec_i0_brp_bits_prett; // @[el2_dec_decode_ctl.scala 233:43]
  assign io_dec_i0_predict_p_d_bits_pcall = i0_dp_jal & i0_pcall_case; // @[el2_dec_decode_ctl.scala 230:43]
  assign io_dec_i0_predict_p_d_bits_pret = i0_dp_jal & i0_pret_case; // @[el2_dec_decode_ctl.scala 232:43]
  assign io_dec_i0_predict_p_d_bits_pja = i0_dp_jal & i0_pja_case; // @[el2_dec_decode_ctl.scala 231:43]
  assign io_dec_i0_predict_p_d_bits_way = io_dec_i0_brp_bits_way; // @[el2_dec_decode_ctl.scala 250:56]
  assign io_i0_predict_fghr_d = io_dec_i0_bp_fghr; // @[el2_dec_decode_ctl.scala 249:32]
  assign io_i0_predict_index_d = io_dec_i0_bp_index; // @[el2_dec_decode_ctl.scala 245:32]
  assign io_i0_predict_btag_d = io_dec_i0_bp_btag; // @[el2_dec_decode_ctl.scala 246:32]
  assign io_dec_data_en = {i0_x_data_en,i0_r_data_en}; // @[el2_dec_decode_ctl.scala 662:27]
  assign io_dec_ctl_en = {i0_x_ctl_en,i0_r_ctl_en}; // @[el2_dec_decode_ctl.scala 663:27]
  assign io_dec_pmu_instr_decoded = io_dec_i0_decode_d; // @[el2_dec_decode_ctl.scala 557:28]
  assign io_dec_pmu_decode_stall = io_dec_ib0_valid_d & _T_498; // @[el2_dec_decode_ctl.scala 558:27]
  assign io_dec_pmu_presync_stall = i0_presync & prior_inflight_eff; // @[el2_dec_decode_ctl.scala 560:29]
  assign io_dec_pmu_postsync_stall = postsync_stall; // @[el2_dec_decode_ctl.scala 559:29]
  assign io_dec_nonblock_load_wen = _T_200 & _T_201; // @[el2_dec_decode_ctl.scala 354:28]
  assign io_dec_nonblock_load_waddr = _T_246 | _T_238; // @[el2_dec_decode_ctl.scala 351:29 el2_dec_decode_ctl.scala 361:29]
  assign io_dec_pause_state = pause_stall; // @[el2_dec_decode_ctl.scala 498:22]
  assign io_dec_pause_state_cg = pause_stall & _T_420; // @[el2_dec_decode_ctl.scala 502:25]
  assign io_dec_div_active = _T_821; // @[el2_dec_decode_ctl.scala 735:21]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_15 | _T_16; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign i0_dec_io_ins = io_dec_i0_instr_d; // @[el2_dec_decode_ctl.scala 393:16]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = _T_428 | pause_stall; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = shift_illegal & _T_464; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_5_io_en = _T_704 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_6_io_en = _T_704 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_7_io_en = _T_704 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_8_io_en = _T_707 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 520:18]
  assign rvclkhdr_9_io_en = _T_710 | io_clk_override; // @[el2_lib.scala 521:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 522:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_10_io_en = i0_pipe_en[2] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = i0_legal_decode_d & i0_dp_div; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_13_io_en = i0_pipe_en[3] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_14_io_en = i0_pipe_en[2] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_15_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_15_io_en = i0_pipe_en[1] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_16_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_16_io_en = i0_pipe_en[0] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_17_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_17_io_en = i0_pipe_en[1] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_18_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_18_io_en = i0_pipe_en[0] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_18_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_19_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_19_io_en = i0_pipe_en[2] | io_clk_override; // @[el2_lib.scala 511:17]
  assign rvclkhdr_19_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  tlu_wr_pause_r1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  tlu_wr_pause_r2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  leak1_i1_stall = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  leak1_i0_stall = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pause_stall = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  write_csr_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  postsync_stall = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  x_d_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flush_final_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  illegal_lockout = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  cam_raw_0_bits_tag = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  cam_raw_0_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cam_raw_1_bits_tag = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  cam_raw_1_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cam_raw_2_bits_tag = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  cam_raw_2_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  cam_raw_3_bits_tag = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  cam_raw_3_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  x_d_bits_i0load = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  x_d_bits_i0rd = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  _T_701 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  nonblock_load_valid_m_delay = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  r_d_bits_i0load = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  r_d_bits_i0v = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  r_d_bits_i0rd = _RAND_24[4:0];
  _RAND_25 = {1{`RANDOM}};
  cam_raw_0_bits_rd = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  cam_raw_0_bits_wb = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  cam_raw_1_bits_rd = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  cam_raw_1_bits_wb = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  cam_raw_2_bits_rd = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  cam_raw_2_bits_wb = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  cam_raw_3_bits_rd = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  cam_raw_3_bits_wb = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  lsu_idle = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  _T_339 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  x_d_bits_i0v = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  i0_x_c_load = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  i0_r_c_load = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  r_d_bits_csrwen = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  r_d_valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  r_d_bits_csrwaddr = _RAND_40[11:0];
  _RAND_41 = {1{`RANDOM}};
  csr_read_x = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  csr_clr_x = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  csr_set_x = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  csr_write_x = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  csr_imm_x = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  csrimm_x = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  csr_rddata_x = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  r_d_bits_csrwonly = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  i0_result_r_raw = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  x_d_bits_csrwonly = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  wbd_bits_csrwonly = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_465 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  x_t_legal = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  x_t_icaf = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  x_t_icaf_f1 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  x_t_icaf_type = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  x_t_fence_i = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  x_t_i0trigger = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  x_t_pmu_i0_itype = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  x_t_pmu_i0_br_unpred = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  r_t_legal = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  r_t_icaf = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  r_t_icaf_f1 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  r_t_icaf_type = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  r_t_fence_i = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  r_t_i0trigger = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  r_t_pmu_i0_itype = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  r_t_pmu_i0_br_unpred = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  lsu_trigger_match_r = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  lsu_pmu_misaligned_r = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  r_d_bits_i0store = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  r_d_bits_i0div = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  i0_x_c_mul = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  i0_x_c_alu = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  i0_r_c_mul = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  i0_r_c_alu = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  x_d_bits_i0store = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  x_d_bits_i0div = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  x_d_bits_csrwen = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  x_d_bits_csrwaddr = _RAND_80[11:0];
  _RAND_81 = {1{`RANDOM}};
  last_br_immed_x = _RAND_81[11:0];
  _RAND_82 = {1{`RANDOM}};
  _T_821 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  _T_830 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  i0_inst_x = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  i0_inst_r = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  i0_inst_wb = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  _T_837 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  i0_pc_wb = _RAND_88[30:0];
  _RAND_89 = {1{`RANDOM}};
  _T_840 = _RAND_89[30:0];
  _RAND_90 = {1{`RANDOM}};
  dec_i0_pc_r = _RAND_90[30:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tlu_wr_pause_r1 = 1'h0;
  end
  if (reset) begin
    tlu_wr_pause_r2 = 1'h0;
  end
  if (reset) begin
    leak1_i1_stall = 1'h0;
  end
  if (reset) begin
    leak1_i0_stall = 1'h0;
  end
  if (reset) begin
    pause_stall = 1'h0;
  end
  if (reset) begin
    write_csr_data = 32'h0;
  end
  if (reset) begin
    postsync_stall = 1'h0;
  end
  if (reset) begin
    x_d_valid = 1'h0;
  end
  if (reset) begin
    flush_final_r = 1'h0;
  end
  if (reset) begin
    illegal_lockout = 1'h0;
  end
  if (reset) begin
    cam_raw_0_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_0_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_1_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_1_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_2_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_2_valid = 1'h0;
  end
  if (reset) begin
    cam_raw_3_bits_tag = 3'h0;
  end
  if (reset) begin
    cam_raw_3_valid = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0load = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0rd = 5'h0;
  end
  if (reset) begin
    _T_701 = 3'h0;
  end
  if (reset) begin
    nonblock_load_valid_m_delay = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0load = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0v = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0rd = 5'h0;
  end
  if (reset) begin
    cam_raw_0_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_0_bits_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_1_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_1_bits_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_2_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_2_bits_wb = 1'h0;
  end
  if (reset) begin
    cam_raw_3_bits_rd = 5'h0;
  end
  if (reset) begin
    cam_raw_3_bits_wb = 1'h0;
  end
  if (reset) begin
    lsu_idle = 1'h0;
  end
  if (reset) begin
    _T_339 = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0v = 1'h0;
  end
  if (reset) begin
    r_d_bits_csrwen = 1'h0;
  end
  if (reset) begin
    r_d_valid = 1'h0;
  end
  if (reset) begin
    r_d_bits_csrwaddr = 12'h0;
  end
  if (reset) begin
    csr_read_x = 1'h0;
  end
  if (reset) begin
    csr_clr_x = 1'h0;
  end
  if (reset) begin
    csr_set_x = 1'h0;
  end
  if (reset) begin
    csr_write_x = 1'h0;
  end
  if (reset) begin
    csr_imm_x = 1'h0;
  end
  if (reset) begin
    csrimm_x = 5'h0;
  end
  if (reset) begin
    csr_rddata_x = 32'h0;
  end
  if (reset) begin
    r_d_bits_csrwonly = 1'h0;
  end
  if (reset) begin
    i0_result_r_raw = 32'h0;
  end
  if (reset) begin
    x_d_bits_csrwonly = 1'h0;
  end
  if (reset) begin
    wbd_bits_csrwonly = 1'h0;
  end
  if (reset) begin
    _T_465 = 32'h0;
  end
  if (reset) begin
    x_t_legal = 1'h0;
  end
  if (reset) begin
    x_t_icaf = 1'h0;
  end
  if (reset) begin
    x_t_icaf_f1 = 1'h0;
  end
  if (reset) begin
    x_t_icaf_type = 2'h0;
  end
  if (reset) begin
    x_t_fence_i = 1'h0;
  end
  if (reset) begin
    x_t_i0trigger = 4'h0;
  end
  if (reset) begin
    x_t_pmu_i0_itype = 4'h0;
  end
  if (reset) begin
    x_t_pmu_i0_br_unpred = 1'h0;
  end
  if (reset) begin
    r_t_legal = 1'h0;
  end
  if (reset) begin
    r_t_icaf = 1'h0;
  end
  if (reset) begin
    r_t_icaf_f1 = 1'h0;
  end
  if (reset) begin
    r_t_icaf_type = 2'h0;
  end
  if (reset) begin
    r_t_fence_i = 1'h0;
  end
  if (reset) begin
    r_t_i0trigger = 4'h0;
  end
  if (reset) begin
    r_t_pmu_i0_itype = 4'h0;
  end
  if (reset) begin
    r_t_pmu_i0_br_unpred = 1'h0;
  end
  if (reset) begin
    lsu_trigger_match_r = 4'h0;
  end
  if (reset) begin
    lsu_pmu_misaligned_r = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0store = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0div = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0store = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0div = 1'h0;
  end
  if (reset) begin
    x_d_bits_csrwen = 1'h0;
  end
  if (reset) begin
    x_d_bits_csrwaddr = 12'h0;
  end
  if (reset) begin
    last_br_immed_x = 12'h0;
  end
  if (reset) begin
    _T_821 = 1'h0;
  end
  if (reset) begin
    _T_830 = 5'h0;
  end
  if (reset) begin
    i0_inst_x = 32'h0;
  end
  if (reset) begin
    i0_inst_r = 32'h0;
  end
  if (reset) begin
    i0_inst_wb = 32'h0;
  end
  if (reset) begin
    _T_837 = 32'h0;
  end
  if (reset) begin
    i0_pc_wb = 31'h0;
  end
  if (reset) begin
    _T_840 = 31'h0;
  end
  if (reset) begin
    dec_i0_pc_r = 31'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_active_clk) begin
    if (i0_x_ctl_en) begin
      i0_x_c_load <= i0_d_c_load;
    end
    if (i0_r_ctl_en) begin
      i0_r_c_load <= i0_x_c_load;
    end
    if (i0_x_ctl_en) begin
      i0_x_c_mul <= i0_d_c_mul;
    end
    if (i0_x_ctl_en) begin
      i0_x_c_alu <= i0_d_c_alu;
    end
    if (i0_r_ctl_en) begin
      i0_r_c_mul <= i0_x_c_mul;
    end
    if (i0_r_ctl_en) begin
      i0_r_c_alu <= i0_x_c_alu;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r1 <= 1'h0;
    end else begin
      tlu_wr_pause_r1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r2 <= 1'h0;
    end else begin
      tlu_wr_pause_r2 <= tlu_wr_pause_r1;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      leak1_i1_stall <= 1'h0;
    end else begin
      leak1_i1_stall <= io_dec_tlu_flush_leak_one_r | _T_281;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      leak1_i0_stall <= 1'h0;
    end else begin
      leak1_i0_stall <= _T_284 | _T_286;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      pause_stall <= 1'h0;
    end else begin
      pause_stall <= _T_412 & _T_413;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      write_csr_data <= 32'h0;
    end else if (pause_stall) begin
      write_csr_data <= _T_423;
    end else if (io_dec_tlu_wr_pause_r) begin
      write_csr_data <= io_dec_csr_wrdata_r;
    end else begin
      write_csr_data <= write_csr_data_x;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      postsync_stall <= 1'h0;
    end else begin
      postsync_stall <= _T_506 | _T_507;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_valid <= 1'h0;
    end else begin
      x_d_valid <= io_dec_i0_decode_d;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      flush_final_r <= 1'h0;
    end else begin
      flush_final_r <= io_exu_flush_final;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      illegal_lockout <= 1'h0;
    end else begin
      illegal_lockout <= _T_466 & _T_467;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_tag <= 3'h0;
    end else if (cam_wen[0]) begin
      cam_raw_0_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_107) begin
      cam_raw_0_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_0_valid <= 1'h0;
    end else begin
      cam_raw_0_valid <= _GEN_56;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_tag <= 3'h0;
    end else if (cam_wen[1]) begin
      cam_raw_1_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_133) begin
      cam_raw_1_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_1_valid <= 1'h0;
    end else begin
      cam_raw_1_valid <= _GEN_67;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_tag <= 3'h0;
    end else if (cam_wen[2]) begin
      cam_raw_2_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_159) begin
      cam_raw_2_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_2_valid <= 1'h0;
    end else begin
      cam_raw_2_valid <= _GEN_78;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_tag <= 3'h0;
    end else if (cam_wen[3]) begin
      cam_raw_3_bits_tag <= {{1'd0}, io_lsu_nonblock_load_tag_m};
    end else if (_T_185) begin
      cam_raw_3_bits_tag <= 3'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_valid <= 1'h0;
    end else if (io_dec_tlu_force_halt) begin
      cam_raw_3_valid <= 1'h0;
    end else begin
      cam_raw_3_valid <= _GEN_89;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_i0load <= 1'h0;
    end else begin
      x_d_bits_i0load <= i0_dp_load & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_i0rd <= 5'h0;
    end else begin
      x_d_bits_i0rd <= io_dec_i0_instr_d[11:7];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_701 <= 3'h0;
    end else begin
      _T_701 <= i0_pipe_en[3:1];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      nonblock_load_valid_m_delay <= 1'h0;
    end else if (i0_r_ctl_en) begin
      nonblock_load_valid_m_delay <= io_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_i0load <= 1'h0;
    end else begin
      r_d_bits_i0load <= x_d_bits_i0load;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_i0v <= 1'h0;
    end else begin
      r_d_bits_i0v <= _T_733 & _T_280;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_i0rd <= 5'h0;
    end else begin
      r_d_bits_i0rd <= x_d_bits_i0rd;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_rd <= 5'h0;
    end else if (cam_wen[0]) begin
      if (x_d_bits_i0load) begin
        cam_raw_0_bits_rd <= x_d_bits_i0rd;
      end else begin
        cam_raw_0_bits_rd <= 5'h0;
      end
    end else if (_T_107) begin
      cam_raw_0_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_wb <= 1'h0;
    end else begin
      cam_raw_0_bits_wb <= _T_112 | _GEN_57;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_rd <= 5'h0;
    end else if (cam_wen[1]) begin
      if (x_d_bits_i0load) begin
        cam_raw_1_bits_rd <= x_d_bits_i0rd;
      end else begin
        cam_raw_1_bits_rd <= 5'h0;
      end
    end else if (_T_133) begin
      cam_raw_1_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_wb <= 1'h0;
    end else begin
      cam_raw_1_bits_wb <= _T_138 | _GEN_68;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_rd <= 5'h0;
    end else if (cam_wen[2]) begin
      if (x_d_bits_i0load) begin
        cam_raw_2_bits_rd <= x_d_bits_i0rd;
      end else begin
        cam_raw_2_bits_rd <= 5'h0;
      end
    end else if (_T_159) begin
      cam_raw_2_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_wb <= 1'h0;
    end else begin
      cam_raw_2_bits_wb <= _T_164 | _GEN_79;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_rd <= 5'h0;
    end else if (cam_wen[3]) begin
      if (x_d_bits_i0load) begin
        cam_raw_3_bits_rd <= x_d_bits_i0rd;
      end else begin
        cam_raw_3_bits_rd <= 5'h0;
      end
    end else if (_T_185) begin
      cam_raw_3_bits_rd <= 5'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_wb <= 1'h0;
    end else begin
      cam_raw_3_bits_wb <= _T_190 | _GEN_90;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      lsu_idle <= 1'h0;
    end else begin
      lsu_idle <= io_lsu_idle_any;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_339 <= 1'h0;
    end else begin
      _T_339 <= io_dec_tlu_flush_extint;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_i0v <= 1'h0;
    end else begin
      x_d_bits_i0v <= i0_rd_en_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_csrwen <= 1'h0;
    end else begin
      r_d_bits_csrwen <= x_d_bits_csrwen;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_valid <= 1'h0;
    end else begin
      r_d_valid <= _T_737 & _T_280;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_csrwaddr <= 12'h0;
    end else begin
      r_d_bits_csrwaddr <= x_d_bits_csrwaddr;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_read_x <= 1'h0;
    end else begin
      csr_read_x <= i0_dp_csr_read & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_clr_x <= 1'h0;
    end else begin
      csr_clr_x <= i0_dp_csr_clr & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_set_x <= 1'h0;
    end else begin
      csr_set_x <= i0_dp_csr_set & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_write_x <= 1'h0;
    end else begin
      csr_write_x <= i0_csr_write & i0_legal_decode_d;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      csr_imm_x <= 1'h0;
    end else if (_T_41) begin
      csr_imm_x <= 1'h0;
    end else begin
      csr_imm_x <= i0_dp_raw_csr_imm;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      csrimm_x <= 5'h0;
    end else begin
      csrimm_x <= io_dec_i0_instr_d[19:15];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      csr_rddata_x <= 32'h0;
    end else begin
      csr_rddata_x <= io_dec_csr_rddata_d;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_csrwonly <= 1'h0;
    end else begin
      r_d_bits_csrwonly <= x_d_bits_csrwonly;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_result_r_raw <= 32'h0;
    end else if (_T_761) begin
      i0_result_r_raw <= io_lsu_result_m;
    end else begin
      i0_result_r_raw <= io_exu_i0_result_x;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_csrwonly <= 1'h0;
    end else begin
      x_d_bits_csrwonly <= i0_csr_write_only_d & io_dec_i0_decode_d;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      wbd_bits_csrwonly <= 1'h0;
    end else begin
      wbd_bits_csrwonly <= r_d_bits_csrwonly;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_465 <= 32'h0;
    end else if (io_dec_i0_pc4_d) begin
      _T_465 <= io_dec_i0_instr_d;
    end else begin
      _T_465 <= _T_462;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_legal <= 1'h0;
    end else begin
      x_t_legal <= io_dec_i0_decode_d & i0_legal;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf <= 1'h0;
    end else begin
      x_t_icaf <= i0_icaf_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf_f1 <= 1'h0;
    end else begin
      x_t_icaf_f1 <= io_dec_i0_icaf_f1_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_icaf_type <= 2'h0;
    end else begin
      x_t_icaf_type <= io_dec_i0_icaf_type_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_fence_i <= 1'h0;
    end else begin
      x_t_fence_i <= _T_517 & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_i0trigger <= 4'h0;
    end else begin
      x_t_i0trigger <= io_dec_i0_trigger_match_d & _T_522;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_itype <= 4'h0;
    end else begin
      x_t_pmu_i0_itype <= _T_255 & _T_277;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_br_unpred <= 1'h0;
    end else begin
      x_t_pmu_i0_br_unpred <= i0_dp_jal & _T_253;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_legal <= 1'h0;
    end else begin
      r_t_legal <= x_t_legal;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf <= 1'h0;
    end else begin
      r_t_icaf <= x_t_icaf;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf_f1 <= 1'h0;
    end else begin
      r_t_icaf_f1 <= x_t_icaf_f1;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_icaf_type <= 2'h0;
    end else begin
      r_t_icaf_type <= x_t_icaf_type;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_fence_i <= 1'h0;
    end else begin
      r_t_fence_i <= x_t_fence_i;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_i0trigger <= 4'h0;
    end else begin
      r_t_i0trigger <= x_t_i0trigger & _T_531;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_itype <= 4'h0;
    end else begin
      r_t_pmu_i0_itype <= x_t_pmu_i0_itype;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_br_unpred <= 1'h0;
    end else begin
      r_t_pmu_i0_br_unpred <= x_t_pmu_i0_br_unpred;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      lsu_trigger_match_r <= 4'h0;
    end else begin
      lsu_trigger_match_r <= io_lsu_trigger_match_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      lsu_pmu_misaligned_r <= 1'h0;
    end else begin
      lsu_pmu_misaligned_r <= io_lsu_pmu_misaligned_m;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_i0store <= 1'h0;
    end else begin
      r_d_bits_i0store <= x_d_bits_i0store;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      r_d_bits_i0div <= 1'h0;
    end else begin
      r_d_bits_i0div <= x_d_bits_i0div;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_i0store <= 1'h0;
    end else begin
      x_d_bits_i0store <= i0_dp_store & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_i0div <= 1'h0;
    end else begin
      x_d_bits_i0div <= i0_dp_div & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_csrwen <= 1'h0;
    end else begin
      x_d_bits_csrwen <= io_dec_csr_wen_unq_d & i0_legal_decode_d;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      x_d_bits_csrwaddr <= 12'h0;
    end else begin
      x_d_bits_csrwaddr <= io_dec_i0_instr_d[31:20];
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      last_br_immed_x <= 12'h0;
    end else if (io_i0_ap_predict_nt) begin
      last_br_immed_x <= _T_781;
    end else if (_T_314) begin
      last_br_immed_x <= i0_pcall_imm[11:0];
    end else begin
      last_br_immed_x <= _T_323;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_821 <= 1'h0;
    end else begin
      _T_821 <= i0_div_decode_d | _T_820;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_830 <= 5'h0;
    end else if (i0_div_decode_d) begin
      _T_830 <= i0r_rd;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_x <= 32'h0;
    end else if (io_dec_i0_pc4_d) begin
      i0_inst_x <= io_dec_i0_instr_d;
    end else begin
      i0_inst_x <= _T_462;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_r <= 32'h0;
    end else begin
      i0_inst_r <= i0_inst_x;
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_inst_wb <= 32'h0;
    end else begin
      i0_inst_wb <= i0_inst_r;
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_837 <= 32'h0;
    end else begin
      _T_837 <= i0_inst_wb;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_pc_wb <= 31'h0;
    end else begin
      i0_pc_wb <= io_dec_tlu_i0_pc_r;
    end
  end
  always @(posedge rvclkhdr_18_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_840 <= 31'h0;
    end else begin
      _T_840 <= i0_pc_wb;
    end
  end
  always @(posedge rvclkhdr_19_io_l1clk or posedge reset) begin
    if (reset) begin
      dec_i0_pc_r <= 31'h0;
    end else begin
      dec_i0_pc_r <= io_exu_i0_pc_x;
    end
  end
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
  wire  _T_95 = io_waddr0 == 5'h1; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_1 = io_wen0 & _T_95; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_112 = io_waddr0 == 5'h2; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_2 = io_wen0 & _T_112; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_129 = io_waddr0 == 5'h3; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_3 = io_wen0 & _T_129; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_146 = io_waddr0 == 5'h4; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_4 = io_wen0 & _T_146; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_163 = io_waddr0 == 5'h5; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_5 = io_wen0 & _T_163; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_180 = io_waddr0 == 5'h6; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_6 = io_wen0 & _T_180; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_197 = io_waddr0 == 5'h7; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_7 = io_wen0 & _T_197; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_214 = io_waddr0 == 5'h8; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_8 = io_wen0 & _T_214; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_231 = io_waddr0 == 5'h9; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_9 = io_wen0 & _T_231; // @[el2_dec_gpr_ctl.scala 26:28]
  wire [9:0] _T_8 = {w0v_9,w0v_8,w0v_7,w0v_6,w0v_5,w0v_4,w0v_3,w0v_2,w0v_1,1'h0}; // @[Cat.scala 29:58]
  wire  _T_248 = io_waddr0 == 5'ha; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_10 = io_wen0 & _T_248; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_265 = io_waddr0 == 5'hb; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_11 = io_wen0 & _T_265; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_282 = io_waddr0 == 5'hc; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_12 = io_wen0 & _T_282; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_299 = io_waddr0 == 5'hd; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_13 = io_wen0 & _T_299; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_316 = io_waddr0 == 5'he; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_14 = io_wen0 & _T_316; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_333 = io_waddr0 == 5'hf; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_15 = io_wen0 & _T_333; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_350 = io_waddr0 == 5'h10; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_16 = io_wen0 & _T_350; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_367 = io_waddr0 == 5'h11; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_17 = io_wen0 & _T_367; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_384 = io_waddr0 == 5'h12; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_18 = io_wen0 & _T_384; // @[el2_dec_gpr_ctl.scala 26:28]
  wire [18:0] _T_17 = {w0v_18,w0v_17,w0v_16,w0v_15,w0v_14,w0v_13,w0v_12,w0v_11,w0v_10,_T_8}; // @[Cat.scala 29:58]
  wire  _T_401 = io_waddr0 == 5'h13; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_19 = io_wen0 & _T_401; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_418 = io_waddr0 == 5'h14; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_20 = io_wen0 & _T_418; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_435 = io_waddr0 == 5'h15; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_21 = io_wen0 & _T_435; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_452 = io_waddr0 == 5'h16; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_22 = io_wen0 & _T_452; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_469 = io_waddr0 == 5'h17; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_23 = io_wen0 & _T_469; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_486 = io_waddr0 == 5'h18; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_24 = io_wen0 & _T_486; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_503 = io_waddr0 == 5'h19; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_25 = io_wen0 & _T_503; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_520 = io_waddr0 == 5'h1a; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_26 = io_wen0 & _T_520; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_537 = io_waddr0 == 5'h1b; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_27 = io_wen0 & _T_537; // @[el2_dec_gpr_ctl.scala 26:28]
  wire [27:0] _T_26 = {w0v_27,w0v_26,w0v_25,w0v_24,w0v_23,w0v_22,w0v_21,w0v_20,w0v_19,_T_17}; // @[Cat.scala 29:58]
  wire  _T_554 = io_waddr0 == 5'h1c; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_28 = io_wen0 & _T_554; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_571 = io_waddr0 == 5'h1d; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_29 = io_wen0 & _T_571; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_588 = io_waddr0 == 5'h1e; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_30 = io_wen0 & _T_588; // @[el2_dec_gpr_ctl.scala 26:28]
  wire  _T_605 = io_waddr0 == 5'h1f; // @[el2_dec_gpr_ctl.scala 26:40]
  wire  w0v_31 = io_wen0 & _T_605; // @[el2_dec_gpr_ctl.scala 26:28]
  wire [31:0] _T_30 = {w0v_31,w0v_30,w0v_29,w0v_28,_T_26}; // @[Cat.scala 29:58]
  wire  _T_97 = io_waddr1 == 5'h1; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_1 = io_wen1 & _T_97; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_114 = io_waddr1 == 5'h2; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_2 = io_wen1 & _T_114; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_131 = io_waddr1 == 5'h3; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_3 = io_wen1 & _T_131; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_148 = io_waddr1 == 5'h4; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_4 = io_wen1 & _T_148; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_165 = io_waddr1 == 5'h5; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_5 = io_wen1 & _T_165; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_182 = io_waddr1 == 5'h6; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_6 = io_wen1 & _T_182; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_199 = io_waddr1 == 5'h7; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_7 = io_wen1 & _T_199; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_216 = io_waddr1 == 5'h8; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_8 = io_wen1 & _T_216; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_233 = io_waddr1 == 5'h9; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_9 = io_wen1 & _T_233; // @[el2_dec_gpr_ctl.scala 27:28]
  wire [9:0] _T_39 = {w1v_9,w1v_8,w1v_7,w1v_6,w1v_5,w1v_4,w1v_3,w1v_2,w1v_1,1'h0}; // @[Cat.scala 29:58]
  wire  _T_250 = io_waddr1 == 5'ha; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_10 = io_wen1 & _T_250; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_267 = io_waddr1 == 5'hb; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_11 = io_wen1 & _T_267; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_284 = io_waddr1 == 5'hc; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_12 = io_wen1 & _T_284; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_301 = io_waddr1 == 5'hd; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_13 = io_wen1 & _T_301; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_318 = io_waddr1 == 5'he; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_14 = io_wen1 & _T_318; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_335 = io_waddr1 == 5'hf; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_15 = io_wen1 & _T_335; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_352 = io_waddr1 == 5'h10; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_16 = io_wen1 & _T_352; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_369 = io_waddr1 == 5'h11; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_17 = io_wen1 & _T_369; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_386 = io_waddr1 == 5'h12; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_18 = io_wen1 & _T_386; // @[el2_dec_gpr_ctl.scala 27:28]
  wire [18:0] _T_48 = {w1v_18,w1v_17,w1v_16,w1v_15,w1v_14,w1v_13,w1v_12,w1v_11,w1v_10,_T_39}; // @[Cat.scala 29:58]
  wire  _T_403 = io_waddr1 == 5'h13; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_19 = io_wen1 & _T_403; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_420 = io_waddr1 == 5'h14; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_20 = io_wen1 & _T_420; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_437 = io_waddr1 == 5'h15; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_21 = io_wen1 & _T_437; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_454 = io_waddr1 == 5'h16; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_22 = io_wen1 & _T_454; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_471 = io_waddr1 == 5'h17; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_23 = io_wen1 & _T_471; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_488 = io_waddr1 == 5'h18; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_24 = io_wen1 & _T_488; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_505 = io_waddr1 == 5'h19; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_25 = io_wen1 & _T_505; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_522 = io_waddr1 == 5'h1a; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_26 = io_wen1 & _T_522; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_539 = io_waddr1 == 5'h1b; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_27 = io_wen1 & _T_539; // @[el2_dec_gpr_ctl.scala 27:28]
  wire [27:0] _T_57 = {w1v_27,w1v_26,w1v_25,w1v_24,w1v_23,w1v_22,w1v_21,w1v_20,w1v_19,_T_48}; // @[Cat.scala 29:58]
  wire  _T_556 = io_waddr1 == 5'h1c; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_28 = io_wen1 & _T_556; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_573 = io_waddr1 == 5'h1d; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_29 = io_wen1 & _T_573; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_590 = io_waddr1 == 5'h1e; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_30 = io_wen1 & _T_590; // @[el2_dec_gpr_ctl.scala 27:28]
  wire  _T_607 = io_waddr1 == 5'h1f; // @[el2_dec_gpr_ctl.scala 27:40]
  wire  w1v_31 = io_wen1 & _T_607; // @[el2_dec_gpr_ctl.scala 27:28]
  wire [31:0] _T_61 = {w1v_31,w1v_30,w1v_29,w1v_28,_T_57}; // @[Cat.scala 29:58]
  wire [31:0] _T_62 = _T_30 | _T_61; // @[el2_dec_gpr_ctl.scala 23:51]
  wire  _T_99 = io_waddr2 == 5'h1; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_1 = io_wen2 & _T_99; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_116 = io_waddr2 == 5'h2; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_2 = io_wen2 & _T_116; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_133 = io_waddr2 == 5'h3; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_3 = io_wen2 & _T_133; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_150 = io_waddr2 == 5'h4; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_4 = io_wen2 & _T_150; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_167 = io_waddr2 == 5'h5; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_5 = io_wen2 & _T_167; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_184 = io_waddr2 == 5'h6; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_6 = io_wen2 & _T_184; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_201 = io_waddr2 == 5'h7; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_7 = io_wen2 & _T_201; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_218 = io_waddr2 == 5'h8; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_8 = io_wen2 & _T_218; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_235 = io_waddr2 == 5'h9; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_9 = io_wen2 & _T_235; // @[el2_dec_gpr_ctl.scala 28:28]
  wire [9:0] _T_71 = {w2v_9,w2v_8,w2v_7,w2v_6,w2v_5,w2v_4,w2v_3,w2v_2,w2v_1,1'h0}; // @[Cat.scala 29:58]
  wire  _T_252 = io_waddr2 == 5'ha; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_10 = io_wen2 & _T_252; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_269 = io_waddr2 == 5'hb; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_11 = io_wen2 & _T_269; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_286 = io_waddr2 == 5'hc; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_12 = io_wen2 & _T_286; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_303 = io_waddr2 == 5'hd; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_13 = io_wen2 & _T_303; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_320 = io_waddr2 == 5'he; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_14 = io_wen2 & _T_320; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_337 = io_waddr2 == 5'hf; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_15 = io_wen2 & _T_337; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_354 = io_waddr2 == 5'h10; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_16 = io_wen2 & _T_354; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_371 = io_waddr2 == 5'h11; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_17 = io_wen2 & _T_371; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_388 = io_waddr2 == 5'h12; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_18 = io_wen2 & _T_388; // @[el2_dec_gpr_ctl.scala 28:28]
  wire [18:0] _T_80 = {w2v_18,w2v_17,w2v_16,w2v_15,w2v_14,w2v_13,w2v_12,w2v_11,w2v_10,_T_71}; // @[Cat.scala 29:58]
  wire  _T_405 = io_waddr2 == 5'h13; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_19 = io_wen2 & _T_405; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_422 = io_waddr2 == 5'h14; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_20 = io_wen2 & _T_422; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_439 = io_waddr2 == 5'h15; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_21 = io_wen2 & _T_439; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_456 = io_waddr2 == 5'h16; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_22 = io_wen2 & _T_456; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_473 = io_waddr2 == 5'h17; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_23 = io_wen2 & _T_473; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_490 = io_waddr2 == 5'h18; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_24 = io_wen2 & _T_490; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_507 = io_waddr2 == 5'h19; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_25 = io_wen2 & _T_507; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_524 = io_waddr2 == 5'h1a; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_26 = io_wen2 & _T_524; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_541 = io_waddr2 == 5'h1b; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_27 = io_wen2 & _T_541; // @[el2_dec_gpr_ctl.scala 28:28]
  wire [27:0] _T_89 = {w2v_27,w2v_26,w2v_25,w2v_24,w2v_23,w2v_22,w2v_21,w2v_20,w2v_19,_T_80}; // @[Cat.scala 29:58]
  wire  _T_558 = io_waddr2 == 5'h1c; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_28 = io_wen2 & _T_558; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_575 = io_waddr2 == 5'h1d; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_29 = io_wen2 & _T_575; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_592 = io_waddr2 == 5'h1e; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_30 = io_wen2 & _T_592; // @[el2_dec_gpr_ctl.scala 28:28]
  wire  _T_609 = io_waddr2 == 5'h1f; // @[el2_dec_gpr_ctl.scala 28:40]
  wire  w2v_31 = io_wen2 & _T_609; // @[el2_dec_gpr_ctl.scala 28:28]
  wire [31:0] _T_93 = {w2v_31,w2v_30,w2v_29,w2v_28,_T_89}; // @[Cat.scala 29:58]
  wire [31:0] gpr_wr_en = _T_62 | _T_93; // @[el2_dec_gpr_ctl.scala 23:89]
  wire [31:0] _T_102 = w0v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_103 = _T_102 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_105 = w1v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_106 = _T_105 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_107 = _T_103 | _T_106; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_109 = w2v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_110 = _T_109 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_119 = w0v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_120 = _T_119 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_122 = w1v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_123 = _T_122 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_124 = _T_120 | _T_123; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_126 = w2v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_127 = _T_126 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_136 = w0v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_137 = _T_136 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_139 = w1v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_140 = _T_139 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_141 = _T_137 | _T_140; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_143 = w2v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_144 = _T_143 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_153 = w0v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_154 = _T_153 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_156 = w1v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_157 = _T_156 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_158 = _T_154 | _T_157; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_160 = w2v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_161 = _T_160 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_170 = w0v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_171 = _T_170 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_173 = w1v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_174 = _T_173 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_175 = _T_171 | _T_174; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_177 = w2v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_178 = _T_177 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_187 = w0v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_188 = _T_187 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_190 = w1v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_191 = _T_190 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_192 = _T_188 | _T_191; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_194 = w2v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_195 = _T_194 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_204 = w0v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_205 = _T_204 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_207 = w1v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_208 = _T_207 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_209 = _T_205 | _T_208; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_211 = w2v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_212 = _T_211 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_221 = w0v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_222 = _T_221 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_224 = w1v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_225 = _T_224 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_226 = _T_222 | _T_225; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_228 = w2v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_229 = _T_228 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_238 = w0v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_239 = _T_238 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_241 = w1v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_242 = _T_241 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_243 = _T_239 | _T_242; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_245 = w2v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_246 = _T_245 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_255 = w0v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_256 = _T_255 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_258 = w1v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_259 = _T_258 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_260 = _T_256 | _T_259; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_262 = w2v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_263 = _T_262 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_272 = w0v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_273 = _T_272 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_275 = w1v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_276 = _T_275 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_277 = _T_273 | _T_276; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_279 = w2v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_280 = _T_279 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_289 = w0v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_290 = _T_289 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_292 = w1v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_293 = _T_292 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_294 = _T_290 | _T_293; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_296 = w2v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_297 = _T_296 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_306 = w0v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_307 = _T_306 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_309 = w1v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_310 = _T_309 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_311 = _T_307 | _T_310; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_313 = w2v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_314 = _T_313 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_323 = w0v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_324 = _T_323 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_326 = w1v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_327 = _T_326 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_328 = _T_324 | _T_327; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_330 = w2v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_331 = _T_330 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_340 = w0v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_341 = _T_340 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_343 = w1v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_344 = _T_343 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_345 = _T_341 | _T_344; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_347 = w2v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_348 = _T_347 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_357 = w0v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_358 = _T_357 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_360 = w1v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_361 = _T_360 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_362 = _T_358 | _T_361; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_364 = w2v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_365 = _T_364 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_374 = w0v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_375 = _T_374 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_377 = w1v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_378 = _T_377 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_379 = _T_375 | _T_378; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_381 = w2v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_382 = _T_381 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_391 = w0v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_392 = _T_391 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_394 = w1v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_395 = _T_394 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_396 = _T_392 | _T_395; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_398 = w2v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_399 = _T_398 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_408 = w0v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_409 = _T_408 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_411 = w1v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_412 = _T_411 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_413 = _T_409 | _T_412; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_415 = w2v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_416 = _T_415 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_425 = w0v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_426 = _T_425 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_428 = w1v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_429 = _T_428 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_430 = _T_426 | _T_429; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_432 = w2v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_433 = _T_432 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_442 = w0v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_443 = _T_442 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_445 = w1v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_446 = _T_445 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_447 = _T_443 | _T_446; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_449 = w2v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_450 = _T_449 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_459 = w0v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_460 = _T_459 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_462 = w1v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_463 = _T_462 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_464 = _T_460 | _T_463; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_466 = w2v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_467 = _T_466 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_476 = w0v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_477 = _T_476 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_479 = w1v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_480 = _T_479 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_481 = _T_477 | _T_480; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_483 = w2v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_484 = _T_483 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_493 = w0v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_494 = _T_493 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_496 = w1v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_497 = _T_496 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_498 = _T_494 | _T_497; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_500 = w2v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_501 = _T_500 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_510 = w0v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_511 = _T_510 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_513 = w1v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_514 = _T_513 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_515 = _T_511 | _T_514; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_517 = w2v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_518 = _T_517 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_527 = w0v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_528 = _T_527 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_530 = w1v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_531 = _T_530 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_532 = _T_528 | _T_531; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_534 = w2v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_535 = _T_534 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_544 = w0v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_545 = _T_544 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_547 = w1v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_548 = _T_547 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_549 = _T_545 | _T_548; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_551 = w2v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_552 = _T_551 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_561 = w0v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_562 = _T_561 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_564 = w1v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_565 = _T_564 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_566 = _T_562 | _T_565; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_568 = w2v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_569 = _T_568 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_578 = w0v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_579 = _T_578 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_581 = w1v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_582 = _T_581 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_583 = _T_579 | _T_582; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_585 = w2v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_586 = _T_585 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_595 = w0v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_596 = _T_595 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_598 = w1v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_599 = _T_598 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_600 = _T_596 | _T_599; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_602 = w2v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_603 = _T_602 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
  wire [31:0] _T_612 = w0v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_613 = _T_612 & io_wd0; // @[el2_dec_gpr_ctl.scala 29:37]
  wire [31:0] _T_615 = w1v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_616 = _T_615 & io_wd1; // @[el2_dec_gpr_ctl.scala 29:66]
  wire [31:0] _T_617 = _T_613 | _T_616; // @[el2_dec_gpr_ctl.scala 29:47]
  wire [31:0] _T_619 = w2v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_620 = _T_619 & io_wd2; // @[el2_dec_gpr_ctl.scala 29:95]
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
  wire  _T_684 = io_raddr0 == 5'h1; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_686 = io_raddr0 == 5'h2; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_688 = io_raddr0 == 5'h3; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_690 = io_raddr0 == 5'h4; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_692 = io_raddr0 == 5'h5; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_694 = io_raddr0 == 5'h6; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_696 = io_raddr0 == 5'h7; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_698 = io_raddr0 == 5'h8; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_700 = io_raddr0 == 5'h9; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_702 = io_raddr0 == 5'ha; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_704 = io_raddr0 == 5'hb; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_706 = io_raddr0 == 5'hc; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_708 = io_raddr0 == 5'hd; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_710 = io_raddr0 == 5'he; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_712 = io_raddr0 == 5'hf; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_714 = io_raddr0 == 5'h10; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_716 = io_raddr0 == 5'h11; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_718 = io_raddr0 == 5'h12; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_720 = io_raddr0 == 5'h13; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_722 = io_raddr0 == 5'h14; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_724 = io_raddr0 == 5'h15; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_726 = io_raddr0 == 5'h16; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_728 = io_raddr0 == 5'h17; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_730 = io_raddr0 == 5'h18; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_732 = io_raddr0 == 5'h19; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_734 = io_raddr0 == 5'h1a; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_736 = io_raddr0 == 5'h1b; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_738 = io_raddr0 == 5'h1c; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_740 = io_raddr0 == 5'h1d; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_742 = io_raddr0 == 5'h1e; // @[el2_dec_gpr_ctl.scala 36:49]
  wire  _T_744 = io_raddr0 == 5'h1f; // @[el2_dec_gpr_ctl.scala 36:49]
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
  wire  _T_808 = io_raddr1 == 5'h1; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_810 = io_raddr1 == 5'h2; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_812 = io_raddr1 == 5'h3; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_814 = io_raddr1 == 5'h4; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_816 = io_raddr1 == 5'h5; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_818 = io_raddr1 == 5'h6; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_820 = io_raddr1 == 5'h7; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_822 = io_raddr1 == 5'h8; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_824 = io_raddr1 == 5'h9; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_826 = io_raddr1 == 5'ha; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_828 = io_raddr1 == 5'hb; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_830 = io_raddr1 == 5'hc; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_832 = io_raddr1 == 5'hd; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_834 = io_raddr1 == 5'he; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_836 = io_raddr1 == 5'hf; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_838 = io_raddr1 == 5'h10; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_840 = io_raddr1 == 5'h11; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_842 = io_raddr1 == 5'h12; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_844 = io_raddr1 == 5'h13; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_846 = io_raddr1 == 5'h14; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_848 = io_raddr1 == 5'h15; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_850 = io_raddr1 == 5'h16; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_852 = io_raddr1 == 5'h17; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_854 = io_raddr1 == 5'h18; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_856 = io_raddr1 == 5'h19; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_858 = io_raddr1 == 5'h1a; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_860 = io_raddr1 == 5'h1b; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_862 = io_raddr1 == 5'h1c; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_864 = io_raddr1 == 5'h1d; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_866 = io_raddr1 == 5'h1e; // @[el2_dec_gpr_ctl.scala 37:49]
  wire  _T_868 = io_raddr1 == 5'h1f; // @[el2_dec_gpr_ctl.scala 37:49]
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
  assign io_rd0 = _T_805 | _T_776; // @[el2_dec_gpr_ctl.scala 21:9 el2_dec_gpr_ctl.scala 36:9]
  assign io_rd1 = _T_929 | _T_900; // @[el2_dec_gpr_ctl.scala 22:9 el2_dec_gpr_ctl.scala 37:9]
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
      gpr_out_1 <= _T_107 | _T_110;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_2 <= 32'h0;
    end else begin
      gpr_out_2 <= _T_124 | _T_127;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_3 <= 32'h0;
    end else begin
      gpr_out_3 <= _T_141 | _T_144;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_4 <= 32'h0;
    end else begin
      gpr_out_4 <= _T_158 | _T_161;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_5 <= 32'h0;
    end else begin
      gpr_out_5 <= _T_175 | _T_178;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_6 <= 32'h0;
    end else begin
      gpr_out_6 <= _T_192 | _T_195;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_7 <= 32'h0;
    end else begin
      gpr_out_7 <= _T_209 | _T_212;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_8 <= 32'h0;
    end else begin
      gpr_out_8 <= _T_226 | _T_229;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_9 <= 32'h0;
    end else begin
      gpr_out_9 <= _T_243 | _T_246;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_10 <= 32'h0;
    end else begin
      gpr_out_10 <= _T_260 | _T_263;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_11 <= 32'h0;
    end else begin
      gpr_out_11 <= _T_277 | _T_280;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_12 <= 32'h0;
    end else begin
      gpr_out_12 <= _T_294 | _T_297;
    end
  end
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_13 <= 32'h0;
    end else begin
      gpr_out_13 <= _T_311 | _T_314;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_14 <= 32'h0;
    end else begin
      gpr_out_14 <= _T_328 | _T_331;
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_15 <= 32'h0;
    end else begin
      gpr_out_15 <= _T_345 | _T_348;
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_16 <= 32'h0;
    end else begin
      gpr_out_16 <= _T_362 | _T_365;
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_17 <= 32'h0;
    end else begin
      gpr_out_17 <= _T_379 | _T_382;
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_18 <= 32'h0;
    end else begin
      gpr_out_18 <= _T_396 | _T_399;
    end
  end
  always @(posedge rvclkhdr_18_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_19 <= 32'h0;
    end else begin
      gpr_out_19 <= _T_413 | _T_416;
    end
  end
  always @(posedge rvclkhdr_19_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_20 <= 32'h0;
    end else begin
      gpr_out_20 <= _T_430 | _T_433;
    end
  end
  always @(posedge rvclkhdr_20_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_21 <= 32'h0;
    end else begin
      gpr_out_21 <= _T_447 | _T_450;
    end
  end
  always @(posedge rvclkhdr_21_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_22 <= 32'h0;
    end else begin
      gpr_out_22 <= _T_464 | _T_467;
    end
  end
  always @(posedge rvclkhdr_22_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_23 <= 32'h0;
    end else begin
      gpr_out_23 <= _T_481 | _T_484;
    end
  end
  always @(posedge rvclkhdr_23_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_24 <= 32'h0;
    end else begin
      gpr_out_24 <= _T_498 | _T_501;
    end
  end
  always @(posedge rvclkhdr_24_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_25 <= 32'h0;
    end else begin
      gpr_out_25 <= _T_515 | _T_518;
    end
  end
  always @(posedge rvclkhdr_25_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_26 <= 32'h0;
    end else begin
      gpr_out_26 <= _T_532 | _T_535;
    end
  end
  always @(posedge rvclkhdr_26_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_27 <= 32'h0;
    end else begin
      gpr_out_27 <= _T_549 | _T_552;
    end
  end
  always @(posedge rvclkhdr_27_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_28 <= 32'h0;
    end else begin
      gpr_out_28 <= _T_566 | _T_569;
    end
  end
  always @(posedge rvclkhdr_28_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_29 <= 32'h0;
    end else begin
      gpr_out_29 <= _T_583 | _T_586;
    end
  end
  always @(posedge rvclkhdr_29_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_30 <= 32'h0;
    end else begin
      gpr_out_30 <= _T_600 | _T_603;
    end
  end
  always @(posedge rvclkhdr_30_io_l1clk or posedge reset) begin
    if (reset) begin
      gpr_out_31 <= 32'h0;
    end else begin
      gpr_out_31 <= _T_617 | _T_620;
    end
  end
endmodule
module el2_dec_timer_ctl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_scan_mode,
  input         io_dec_csr_wen_r_mod,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_csr_mitctl0,
  input         io_csr_mitctl1,
  input         io_csr_mitb0,
  input         io_csr_mitb1,
  input         io_csr_mitcnt0,
  input         io_csr_mitcnt1,
  input         io_dec_pause_state,
  input         io_dec_tlu_pmu_fw_halted,
  input         io_internal_dbg_halt_timers,
  output [31:0] io_dec_timer_rddata_d,
  output        io_dec_timer_read_d,
  output        io_dec_timer_t0_pulse,
  output        io_dec_timer_t1_pulse
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
  reg [31:0] mitcnt0; // @[el2_lib.scala 514:16]
  reg [31:0] mitb0_b; // @[el2_lib.scala 514:16]
  wire [31:0] mitb0 = ~mitb0_b; // @[el2_dec_tlu_ctl.scala 2791:14]
  wire  mit0_match_ns = mitcnt0 >= mitb0; // @[el2_dec_tlu_ctl.scala 2752:30]
  reg [31:0] mitcnt1; // @[el2_lib.scala 514:16]
  reg [31:0] mitb1_b; // @[el2_lib.scala 514:16]
  wire [31:0] mitb1 = ~mitb1_b; // @[el2_dec_tlu_ctl.scala 2800:12]
  wire  mit1_match_ns = mitcnt1 >= mitb1; // @[el2_dec_tlu_ctl.scala 2753:30]
  wire  _T = io_dec_csr_wraddr_r == 12'h7d2; // @[el2_dec_tlu_ctl.scala 2763:66]
  wire  wr_mitcnt0_r = io_dec_csr_wen_r_mod & _T; // @[el2_dec_tlu_ctl.scala 2763:43]
  reg [1:0] _T_57; // @[el2_dec_tlu_ctl.scala 2816:67]
  reg  mitctl0_0_b; // @[el2_dec_tlu_ctl.scala 2815:54]
  wire  _T_58 = ~mitctl0_0_b; // @[el2_dec_tlu_ctl.scala 2816:90]
  wire [2:0] mitctl0 = {_T_57,_T_58}; // @[Cat.scala 29:58]
  wire  _T_2 = ~io_dec_pause_state; // @[el2_dec_tlu_ctl.scala 2765:50]
  wire  _T_4 = _T_2 | mitctl0[2]; // @[el2_dec_tlu_ctl.scala 2765:70]
  wire  _T_5 = mitctl0[0] & _T_4; // @[el2_dec_tlu_ctl.scala 2765:47]
  wire  _T_6 = ~io_dec_tlu_pmu_fw_halted; // @[el2_dec_tlu_ctl.scala 2765:106]
  wire  _T_8 = _T_6 | mitctl0[1]; // @[el2_dec_tlu_ctl.scala 2765:132]
  wire  _T_9 = _T_5 & _T_8; // @[el2_dec_tlu_ctl.scala 2765:103]
  wire  _T_10 = ~io_internal_dbg_halt_timers; // @[el2_dec_tlu_ctl.scala 2765:167]
  wire  mitcnt0_inc_ok = _T_9 & _T_10; // @[el2_dec_tlu_ctl.scala 2765:165]
  wire [31:0] mitcnt0_inc = mitcnt0 + 32'h1; // @[el2_dec_tlu_ctl.scala 2766:29]
  wire  _T_15 = wr_mitcnt0_r | mitcnt0_inc_ok; // @[el2_dec_tlu_ctl.scala 2768:60]
  wire  _T_19 = io_dec_csr_wraddr_r == 12'h7d5; // @[el2_dec_tlu_ctl.scala 2775:66]
  wire  wr_mitcnt1_r = io_dec_csr_wen_r_mod & _T_19; // @[el2_dec_tlu_ctl.scala 2775:43]
  reg [2:0] _T_66; // @[el2_dec_tlu_ctl.scala 2830:46]
  reg  mitctl1_0_b; // @[el2_dec_tlu_ctl.scala 2829:49]
  wire  _T_67 = ~mitctl1_0_b; // @[el2_dec_tlu_ctl.scala 2830:69]
  wire [3:0] mitctl1 = {_T_66,_T_67}; // @[Cat.scala 29:58]
  wire  _T_23 = _T_2 | mitctl1[2]; // @[el2_dec_tlu_ctl.scala 2777:70]
  wire  _T_24 = mitctl1[0] & _T_23; // @[el2_dec_tlu_ctl.scala 2777:47]
  wire  _T_27 = _T_6 | mitctl1[1]; // @[el2_dec_tlu_ctl.scala 2777:132]
  wire  _T_28 = _T_24 & _T_27; // @[el2_dec_tlu_ctl.scala 2777:103]
  wire  mitcnt1_inc_ok = _T_28 & _T_10; // @[el2_dec_tlu_ctl.scala 2777:165]
  wire  _T_32 = ~mitctl1[3]; // @[el2_dec_tlu_ctl.scala 2780:54]
  wire  _T_33 = _T_32 | mit0_match_ns; // @[el2_dec_tlu_ctl.scala 2780:66]
  wire [31:0] _T_34 = {31'h0,_T_33}; // @[Cat.scala 29:58]
  wire [31:0] mitcnt1_inc = mitcnt1 + _T_34; // @[el2_dec_tlu_ctl.scala 2780:29]
  wire  _T_39 = wr_mitcnt1_r | mitcnt1_inc_ok; // @[el2_dec_tlu_ctl.scala 2782:52]
  wire  _T_43 = io_dec_csr_wraddr_r == 12'h7d3; // @[el2_dec_tlu_ctl.scala 2789:64]
  wire  _T_47 = io_dec_csr_wraddr_r == 12'h7d6; // @[el2_dec_tlu_ctl.scala 2798:63]
  wire  _T_51 = io_dec_csr_wraddr_r == 12'h7d4; // @[el2_dec_tlu_ctl.scala 2811:66]
  wire  wr_mitctl0_r = io_dec_csr_wen_r_mod & _T_51; // @[el2_dec_tlu_ctl.scala 2811:43]
  wire [2:0] mitctl0_ns = wr_mitctl0_r ? io_dec_csr_wrdata_r[2:0] : mitctl0; // @[el2_dec_tlu_ctl.scala 2812:31]
  wire  _T_60 = io_dec_csr_wraddr_r == 12'h7d7; // @[el2_dec_tlu_ctl.scala 2826:65]
  wire  wr_mitctl1_r = io_dec_csr_wen_r_mod & _T_60; // @[el2_dec_tlu_ctl.scala 2826:43]
  wire [3:0] mitctl1_ns = wr_mitctl1_r ? io_dec_csr_wrdata_r[3:0] : mitctl1; // @[el2_dec_tlu_ctl.scala 2827:31]
  wire  _T_69 = io_csr_mitcnt1 | io_csr_mitcnt0; // @[el2_dec_tlu_ctl.scala 2832:43]
  wire  _T_70 = _T_69 | io_csr_mitb1; // @[el2_dec_tlu_ctl.scala 2832:60]
  wire  _T_71 = _T_70 | io_csr_mitb0; // @[el2_dec_tlu_ctl.scala 2832:75]
  wire  _T_72 = _T_71 | io_csr_mitctl0; // @[el2_dec_tlu_ctl.scala 2832:90]
  wire [31:0] _T_81 = {29'h0,_T_57,_T_58}; // @[Cat.scala 29:58]
  wire [31:0] _T_84 = {28'h0,_T_66,_T_67}; // @[Cat.scala 29:58]
  wire [31:0] _T_85 = io_csr_mitcnt0 ? mitcnt0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_86 = io_csr_mitcnt1 ? mitcnt1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_87 = io_csr_mitb0 ? mitb0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_88 = io_csr_mitb1 ? mitb1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_89 = io_csr_mitctl0 ? _T_81 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_90 = io_csr_mitctl1 ? _T_84 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_91 = _T_85 | _T_86; // @[Mux.scala 27:72]
  wire [31:0] _T_92 = _T_91 | _T_87; // @[Mux.scala 27:72]
  wire [31:0] _T_93 = _T_92 | _T_88; // @[Mux.scala 27:72]
  wire [31:0] _T_94 = _T_93 | _T_89; // @[Mux.scala 27:72]
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
  assign io_dec_timer_rddata_d = _T_94 | _T_90; // @[el2_dec_tlu_ctl.scala 2833:33]
  assign io_dec_timer_read_d = _T_72 | io_csr_mitctl1; // @[el2_dec_tlu_ctl.scala 2832:25]
  assign io_dec_timer_t0_pulse = mitcnt0 >= mitb0; // @[el2_dec_tlu_ctl.scala 2755:25]
  assign io_dec_timer_t1_pulse = mitcnt1 >= mitb1; // @[el2_dec_tlu_ctl.scala 2756:25]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = _T_15 | mit0_match_ns; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = _T_39 | mit1_match_ns; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = io_dec_csr_wen_r_mod & _T_43; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = io_dec_csr_wen_r_mod & _T_47; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  mitcnt0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mitb0_b = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mitcnt1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mitb1_b = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  _T_57 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  mitctl0_0_b = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_66 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  mitctl1_0_b = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    mitcnt0 = 32'h0;
  end
  if (reset) begin
    mitb0_b = 32'h0;
  end
  if (reset) begin
    mitcnt1 = 32'h0;
  end
  if (reset) begin
    mitb1_b = 32'h0;
  end
  if (reset) begin
    _T_57 = 2'h0;
  end
  if (reset) begin
    mitctl0_0_b = 1'h0;
  end
  if (reset) begin
    _T_66 = 3'h0;
  end
  if (reset) begin
    mitctl1_0_b = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      mitcnt0 <= 32'h0;
    end else if (mit0_match_ns) begin
      mitcnt0 <= 32'h0;
    end else if (wr_mitcnt0_r) begin
      mitcnt0 <= io_dec_csr_wrdata_r;
    end else begin
      mitcnt0 <= mitcnt0_inc;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      mitb0_b <= 32'h0;
    end else begin
      mitb0_b <= ~io_dec_csr_wrdata_r;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      mitcnt1 <= 32'h0;
    end else if (mit1_match_ns) begin
      mitcnt1 <= 32'h0;
    end else if (wr_mitcnt1_r) begin
      mitcnt1 <= io_dec_csr_wrdata_r;
    end else begin
      mitcnt1 <= mitcnt1_inc;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      mitb1_b <= 32'h0;
    end else begin
      mitb1_b <= ~io_dec_csr_wrdata_r;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_57 <= 2'h0;
    end else begin
      _T_57 <= mitctl0_ns[2:1];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mitctl0_0_b <= 1'h0;
    end else begin
      mitctl0_0_b <= ~mitctl0_ns[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_66 <= 3'h0;
    end else begin
      _T_66 <= mitctl1_ns[3:1];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mitctl1_0_b <= 1'h0;
    end else begin
      mitctl1_0_b <= ~mitctl1_ns[0];
    end
  end
endmodule
module csr_tlu(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_scan_mode,
  input  [31:0] io_dec_csr_wrdata_r,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [11:0] io_dec_csr_rdaddr_d,
  input         io_dec_csr_wen_unq_d,
  input         io_dec_i0_decode_d,
  output [70:0] io_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_dec_tlu_ic_diag_pkt_icache_wr_valid,
  input         io_ifu_ic_debug_rd_data_valid,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_ifu_pmu_bus_trxn,
  input         io_dma_iccm_stall_any,
  input         io_dma_dccm_stall_any,
  input         io_lsu_store_stall_any,
  input         io_dec_pmu_presync_stall,
  input         io_dec_pmu_postsync_stall,
  input         io_dec_pmu_decode_stall,
  input         io_ifu_pmu_fetch_stall,
  input  [1:0]  io_dec_tlu_packet_r_icaf_type,
  input  [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  input         io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input         io_dec_tlu_packet_r_pmu_divide,
  input         io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input         io_exu_pmu_i0_br_ataken,
  input         io_exu_pmu_i0_br_misp,
  input         io_dec_pmu_instr_decoded,
  input         io_ifu_pmu_instr_aligned,
  input         io_exu_pmu_i0_pc4,
  input         io_ifu_pmu_ic_miss,
  input         io_ifu_pmu_ic_hit,
  output        io_dec_tlu_int_valid_wb1,
  output        io_dec_tlu_i0_exc_valid_wb1,
  output        io_dec_tlu_i0_valid_wb1,
  input         io_dec_csr_wen_r,
  output [31:0] io_dec_tlu_mtval_wb1,
  output [4:0]  io_dec_tlu_exc_cause_wb1,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  input         io_dec_tlu_dbg_halted,
  input         io_dma_pmu_dccm_write,
  input         io_dma_pmu_dccm_read,
  input         io_dma_pmu_any_write,
  input         io_dma_pmu_any_read,
  input         io_lsu_pmu_bus_busy,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input         io_dec_tlu_i0_valid_r,
  input         io_dec_csr_any_unq_d,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_dec_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override,
  output [31:0] io_dec_csr_rddata_d,
  output        io_dec_tlu_pipelining_disable,
  output        io_dec_tlu_wr_pause_r,
  input         io_ifu_pmu_bus_busy,
  input         io_lsu_pmu_bus_error,
  input         io_ifu_pmu_bus_error,
  input         io_lsu_pmu_bus_misaligned,
  input         io_lsu_pmu_bus_trxn,
  input  [70:0] io_ifu_ic_debug_rd_data,
  output [3:0]  io_dec_tlu_meipt,
  input  [3:0]  io_pic_pl,
  output [3:0]  io_dec_tlu_meicurpl,
  output [29:0] io_dec_tlu_meihap,
  input  [7:0]  io_pic_claimid,
  input         io_iccm_dma_sb_error,
  input  [31:0] io_lsu_imprecise_error_addr_any,
  input         io_lsu_imprecise_error_load_any,
  input         io_lsu_imprecise_error_store_any,
  output [31:0] io_dec_tlu_mrac_ff,
  output        io_dec_tlu_wb_coalescing_disable,
  output        io_dec_tlu_bpred_disable,
  output        io_dec_tlu_sideeffect_posted_disable,
  output        io_dec_tlu_core_ecc_disable,
  output        io_dec_tlu_external_ldfwd_disable,
  output [2:0]  io_dec_tlu_dma_qos_prty,
  input  [31:0] io_dec_illegal_inst,
  input         io_lsu_error_pkt_r_bits_mscause,
  input         io_mexintpend,
  input  [30:0] io_exu_npc_r,
  input         io_mpc_reset_run_req,
  input  [30:0] io_rst_vec,
  input  [27:0] io_core_id,
  input  [31:0] io_dec_timer_rddata_d,
  input         io_dec_timer_read_d,
  output        io_dec_csr_wen_r_mod,
  input         io_rfpc_i0_r,
  input         io_i0_trigger_hit_r,
  output        io_fw_halt_req,
  output [1:0]  io_mstatus,
  input         io_exc_or_int_valid_r,
  input         io_mret_r,
  output        io_mstatus_mie_ns,
  input         io_dcsr_single_step_running_f,
  output [15:0] io_dcsr,
  output [30:0] io_mtvec,
  output [5:0]  io_mip,
  input         io_dec_timer_t0_pulse,
  input         io_dec_timer_t1_pulse,
  input         io_timer_int_sync,
  input         io_soft_int_sync,
  output [5:0]  io_mie_ns,
  input         io_csr_wr_clk,
  input         io_ebreak_to_debug_mode_r,
  input         io_dec_tlu_pmu_fw_halted,
  input  [1:0]  io_lsu_fir_error,
  output [30:0] io_npc_r,
  input         io_tlu_flush_lower_r_d1,
  input         io_dec_tlu_flush_noredir_r_d1,
  input  [30:0] io_tlu_flush_path_r_d1,
  output [30:0] io_npc_r_d1,
  input         io_reset_delayed,
  output [30:0] io_mepc,
  input         io_interrupt_valid_r,
  input         io_i0_exception_valid_r,
  input         io_lsu_exc_valid_r,
  input         io_mepc_trigger_hit_sel_pc_r,
  input         io_e4e5_int_clk,
  input         io_lsu_i0_exc_r,
  input         io_inst_acc_r,
  input         io_inst_acc_second_r,
  input         io_take_nmi,
  input  [31:0] io_lsu_error_pkt_addr_r,
  input  [4:0]  io_exc_cause_r,
  input         io_i0_valid_wb,
  input         io_exc_or_int_valid_r_d1,
  input         io_interrupt_valid_r_d1,
  input         io_clk_override,
  input         io_i0_exception_valid_r_d1,
  input         io_lsu_i0_exc_r_d1,
  input  [4:0]  io_exc_cause_wb,
  input         io_nmi_lsu_store_type,
  input         io_nmi_lsu_load_type,
  input         io_tlu_i0_commit_cmt,
  input         io_ebreak_r,
  input         io_ecall_r,
  input         io_illegal_r,
  output        io_mdseac_locked_ns,
  input         io_mdseac_locked_f,
  input         io_nmi_int_detected_f,
  input         io_internal_dbg_halt_mode_f2,
  input         io_ext_int_freeze_d1,
  input         io_ic_perr_r_d1,
  input         io_iccm_sbecc_r_d1,
  input         io_lsu_single_ecc_error_r_d1,
  input         io_ifu_miss_state_idle_f,
  input         io_lsu_idle_any_f,
  input         io_dbg_tlu_halted_f,
  input         io_dbg_tlu_halted,
  input         io_debug_halt_req_f,
  output        io_force_halt,
  input         io_take_ext_int_start,
  input         io_trigger_hit_dmode_r_d1,
  input         io_trigger_hit_r_d1,
  input         io_dcsr_single_step_done_f,
  input         io_ebreak_to_debug_mode_r_d1,
  input         io_debug_halt_req,
  input         io_allow_dbg_halt_csr_write,
  input         io_internal_dbg_halt_mode_f,
  input         io_enter_debug_halt_req,
  input         io_internal_dbg_halt_mode,
  input         io_request_debug_mode_done,
  input         io_request_debug_mode_r,
  output [30:0] io_dpc,
  input  [3:0]  io_update_hit_bit_r,
  input         io_take_timer_int,
  input         io_take_int_timer0_int,
  input         io_take_int_timer1_int,
  input         io_take_ext_int,
  input         io_tlu_flush_lower_r,
  input         io_dec_tlu_br0_error_r,
  input         io_dec_tlu_br0_start_error_r,
  input         io_lsu_pmu_load_external_r,
  input         io_lsu_pmu_store_external_r,
  input         io_csr_pkt_csr_misa,
  input         io_csr_pkt_csr_mvendorid,
  input         io_csr_pkt_csr_marchid,
  input         io_csr_pkt_csr_mimpid,
  input         io_csr_pkt_csr_mhartid,
  input         io_csr_pkt_csr_mstatus,
  input         io_csr_pkt_csr_mtvec,
  input         io_csr_pkt_csr_mip,
  input         io_csr_pkt_csr_mie,
  input         io_csr_pkt_csr_mcyclel,
  input         io_csr_pkt_csr_mcycleh,
  input         io_csr_pkt_csr_minstretl,
  input         io_csr_pkt_csr_minstreth,
  input         io_csr_pkt_csr_mscratch,
  input         io_csr_pkt_csr_mepc,
  input         io_csr_pkt_csr_mcause,
  input         io_csr_pkt_csr_mscause,
  input         io_csr_pkt_csr_mtval,
  input         io_csr_pkt_csr_mrac,
  input         io_csr_pkt_csr_mdseac,
  input         io_csr_pkt_csr_meihap,
  input         io_csr_pkt_csr_meivt,
  input         io_csr_pkt_csr_meipt,
  input         io_csr_pkt_csr_meicurpl,
  input         io_csr_pkt_csr_meicidpl,
  input         io_csr_pkt_csr_dcsr,
  input         io_csr_pkt_csr_mcgc,
  input         io_csr_pkt_csr_mfdc,
  input         io_csr_pkt_csr_dpc,
  input         io_csr_pkt_csr_mtsel,
  input         io_csr_pkt_csr_mtdata1,
  input         io_csr_pkt_csr_mtdata2,
  input         io_csr_pkt_csr_mhpmc3,
  input         io_csr_pkt_csr_mhpmc4,
  input         io_csr_pkt_csr_mhpmc5,
  input         io_csr_pkt_csr_mhpmc6,
  input         io_csr_pkt_csr_mhpmc3h,
  input         io_csr_pkt_csr_mhpmc4h,
  input         io_csr_pkt_csr_mhpmc5h,
  input         io_csr_pkt_csr_mhpmc6h,
  input         io_csr_pkt_csr_mhpme3,
  input         io_csr_pkt_csr_mhpme4,
  input         io_csr_pkt_csr_mhpme5,
  input         io_csr_pkt_csr_mhpme6,
  input         io_csr_pkt_csr_mcountinhibit,
  input         io_csr_pkt_csr_mpmc,
  input         io_csr_pkt_csr_micect,
  input         io_csr_pkt_csr_miccmect,
  input         io_csr_pkt_csr_mdccmect,
  input         io_csr_pkt_csr_mfdht,
  input         io_csr_pkt_csr_mfdhs,
  input         io_csr_pkt_csr_dicawics,
  input         io_csr_pkt_csr_dicad0h,
  input         io_csr_pkt_csr_dicad0,
  input         io_csr_pkt_csr_dicad1,
  output [9:0]  io_mtdata1_t_0,
  output [9:0]  io_mtdata1_t_1,
  output [9:0]  io_mtdata1_t_2,
  output [9:0]  io_mtdata1_t_3
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
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
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
  reg [95:0] _RAND_39;
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
  wire  rvclkhdr_31_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_31_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_31_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_31_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_32_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_32_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_32_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_32_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_33_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_33_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_33_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_33_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_34_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_34_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_34_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_34_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  _T = ~io_i0_trigger_hit_r; // @[el2_dec_tlu_ctl.scala 1530:46]
  wire  _T_1 = io_dec_csr_wen_r & _T; // @[el2_dec_tlu_ctl.scala 1530:44]
  wire  _T_2 = ~io_rfpc_i0_r; // @[el2_dec_tlu_ctl.scala 1530:69]
  wire  _T_5 = io_dec_csr_wraddr_r == 12'h300; // @[el2_dec_tlu_ctl.scala 1531:72]
  wire  wr_mstatus_r = io_dec_csr_wen_r_mod & _T_5; // @[el2_dec_tlu_ctl.scala 1531:43]
  wire  _T_496 = io_dec_csr_wraddr_r == 12'h7c6; // @[el2_dec_tlu_ctl.scala 1917:69]
  wire  wr_mpmc_r = io_dec_csr_wen_r_mod & _T_496; // @[el2_dec_tlu_ctl.scala 1917:40]
  wire  _T_507 = ~io_dec_csr_wrdata_r[1]; // @[el2_dec_tlu_ctl.scala 1924:38]
  reg  mpmc_b; // @[el2_dec_tlu_ctl.scala 1926:45]
  wire  mpmc = ~mpmc_b; // @[el2_dec_tlu_ctl.scala 1929:11]
  wire  _T_508 = ~mpmc; // @[el2_dec_tlu_ctl.scala 1924:63]
  wire  mpmc_b_ns = wr_mpmc_r ? _T_507 : _T_508; // @[el2_dec_tlu_ctl.scala 1924:19]
  wire  _T_6 = ~mpmc_b_ns; // @[el2_dec_tlu_ctl.scala 1534:29]
  wire  set_mie_pmu_fw_halt = _T_6 & io_fw_halt_req; // @[el2_dec_tlu_ctl.scala 1534:40]
  wire  _T_7 = ~wr_mstatus_r; // @[el2_dec_tlu_ctl.scala 1537:6]
  wire  _T_8 = _T_7 & io_exc_or_int_valid_r; // @[el2_dec_tlu_ctl.scala 1537:20]
  wire  _T_12 = wr_mstatus_r & io_exc_or_int_valid_r; // @[el2_dec_tlu_ctl.scala 1538:19]
  wire  _T_15 = ~io_exc_or_int_valid_r; // @[el2_dec_tlu_ctl.scala 1539:18]
  wire  _T_16 = io_mret_r & _T_15; // @[el2_dec_tlu_ctl.scala 1539:16]
  wire [1:0] _T_19 = {1'h1,io_mstatus[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_22 = {io_mstatus[1],1'h1}; // @[Cat.scala 29:58]
  wire  _T_24 = wr_mstatus_r & _T_15; // @[el2_dec_tlu_ctl.scala 1541:19]
  wire [1:0] _T_28 = {io_dec_csr_wrdata_r[7],io_dec_csr_wrdata_r[3]}; // @[Cat.scala 29:58]
  wire  _T_31 = _T_7 & _T_15; // @[el2_dec_tlu_ctl.scala 1542:20]
  wire  _T_32 = ~io_mret_r; // @[el2_dec_tlu_ctl.scala 1542:47]
  wire  _T_33 = _T_31 & _T_32; // @[el2_dec_tlu_ctl.scala 1542:45]
  wire  _T_34 = ~set_mie_pmu_fw_halt; // @[el2_dec_tlu_ctl.scala 1542:60]
  wire  _T_35 = _T_33 & _T_34; // @[el2_dec_tlu_ctl.scala 1542:58]
  wire  _T_37 = _T_8 & io_mstatus[0]; // @[Mux.scala 27:72]
  wire  _T_38 = _T_12 & io_dec_csr_wrdata_r[3]; // @[Mux.scala 27:72]
  wire [1:0] _T_39 = _T_16 ? _T_19 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_40 = set_mie_pmu_fw_halt ? _T_22 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_41 = _T_24 ? _T_28 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_42 = _T_35 ? io_mstatus : 2'h0; // @[Mux.scala 27:72]
  wire  _T_43 = _T_37 | _T_38; // @[Mux.scala 27:72]
  wire [1:0] _GEN_9 = {{1'd0}, _T_43}; // @[Mux.scala 27:72]
  wire [1:0] _T_44 = _GEN_9 | _T_39; // @[Mux.scala 27:72]
  wire [1:0] _T_45 = _T_44 | _T_40; // @[Mux.scala 27:72]
  wire [1:0] _T_46 = _T_45 | _T_41; // @[Mux.scala 27:72]
  wire  _T_50 = ~io_dcsr_single_step_running_f; // @[el2_dec_tlu_ctl.scala 1545:51]
  wire  _T_52 = _T_50 | io_dcsr[11]; // @[el2_dec_tlu_ctl.scala 1545:82]
  reg [1:0] _T_54; // @[el2_dec_tlu_ctl.scala 1547:12]
  wire  _T_56 = io_dec_csr_wraddr_r == 12'h305; // @[el2_dec_tlu_ctl.scala 1556:70]
  reg [30:0] _T_60; // @[el2_lib.scala 514:16]
  reg [31:0] mdccmect; // @[el2_lib.scala 514:16]
  wire [62:0] _T_572 = 63'hffffffff << mdccmect[31:27]; // @[el2_dec_tlu_ctl.scala 1975:42]
  wire [31:0] _T_574 = {5'h0,mdccmect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_10 = {{31'd0}, _T_574}; // @[el2_dec_tlu_ctl.scala 1975:62]
  wire [62:0] _T_575 = _T_572 & _GEN_10; // @[el2_dec_tlu_ctl.scala 1975:62]
  wire  mdccme_ce_req = |_T_575; // @[el2_dec_tlu_ctl.scala 1975:95]
  reg [31:0] miccmect; // @[el2_lib.scala 514:16]
  wire [62:0] _T_552 = 63'hffffffff << miccmect[31:27]; // @[el2_dec_tlu_ctl.scala 1960:42]
  wire [31:0] _T_554 = {5'h0,miccmect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_11 = {{31'd0}, _T_554}; // @[el2_dec_tlu_ctl.scala 1960:62]
  wire [62:0] _T_555 = _T_552 & _GEN_11; // @[el2_dec_tlu_ctl.scala 1960:62]
  wire  miccme_ce_req = |_T_555; // @[el2_dec_tlu_ctl.scala 1960:95]
  wire  _T_61 = mdccme_ce_req | miccme_ce_req; // @[el2_dec_tlu_ctl.scala 1570:31]
  reg [31:0] micect; // @[el2_lib.scala 514:16]
  wire [62:0] _T_530 = 63'hffffffff << micect[31:27]; // @[el2_dec_tlu_ctl.scala 1946:39]
  wire  _T_531 = |_T_530; // @[el2_dec_tlu_ctl.scala 1946:57]
  wire [31:0] _T_533 = {5'h0,micect[26:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_12 = {{31'd0}, _T_531}; // @[el2_dec_tlu_ctl.scala 1946:61]
  wire [31:0] _T_534 = _GEN_12 & _T_533; // @[el2_dec_tlu_ctl.scala 1946:61]
  wire  mice_ce_req = _T_534[0]; // @[el2_dec_tlu_ctl.scala 1455:41 el2_dec_tlu_ctl.scala 1946:15]
  wire  ce_int = _T_61 | mice_ce_req; // @[el2_dec_tlu_ctl.scala 1570:47]
  wire [2:0] _T_63 = {io_mexintpend,io_timer_int_sync,io_soft_int_sync}; // @[Cat.scala 29:58]
  wire [2:0] _T_65 = {ce_int,io_dec_timer_t0_pulse,io_dec_timer_t1_pulse}; // @[Cat.scala 29:58]
  reg [5:0] _T_66; // @[el2_dec_tlu_ctl.scala 1574:12]
  wire  _T_68 = io_dec_csr_wraddr_r == 12'h304; // @[el2_dec_tlu_ctl.scala 1586:68]
  wire  wr_mie_r = io_dec_csr_wen_r_mod & _T_68; // @[el2_dec_tlu_ctl.scala 1586:39]
  wire [5:0] _T_76 = {io_dec_csr_wrdata_r[30:28],io_dec_csr_wrdata_r[11],io_dec_csr_wrdata_r[7],io_dec_csr_wrdata_r[3]}; // @[Cat.scala 29:58]
  reg [5:0] mie; // @[el2_dec_tlu_ctl.scala 1589:12]
  wire  kill_ebreak_count_r = io_ebreak_to_debug_mode_r & io_dcsr[10]; // @[el2_dec_tlu_ctl.scala 1596:55]
  wire  _T_81 = io_dec_csr_wraddr_r == 12'hb00; // @[el2_dec_tlu_ctl.scala 1598:72]
  wire  wr_mcyclel_r = io_dec_csr_wen_r_mod & _T_81; // @[el2_dec_tlu_ctl.scala 1598:43]
  wire  _T_83 = io_dec_tlu_dbg_halted & io_dcsr[10]; // @[el2_dec_tlu_ctl.scala 1600:72]
  wire  _T_84 = kill_ebreak_count_r | _T_83; // @[el2_dec_tlu_ctl.scala 1600:47]
  wire  _T_85 = _T_84 | io_dec_tlu_pmu_fw_halted; // @[el2_dec_tlu_ctl.scala 1600:95]
  reg [4:0] temp_ncount6_2; // @[Reg.scala 27:20]
  reg  temp_ncount0; // @[Reg.scala 27:20]
  wire [6:0] mcountinhibit = {temp_ncount6_2,1'h0,temp_ncount0}; // @[Cat.scala 29:58]
  wire  _T_87 = _T_85 | mcountinhibit[0]; // @[el2_dec_tlu_ctl.scala 1600:122]
  wire  mcyclel_cout_in = ~_T_87; // @[el2_dec_tlu_ctl.scala 1600:25]
  wire [31:0] _T_88 = {31'h0,mcyclel_cout_in}; // @[Cat.scala 29:58]
  reg [32:0] _T_95; // @[el2_lib.scala 514:16]
  wire [31:0] mcyclel = _T_95[31:0]; // @[el2_dec_tlu_ctl.scala 1607:11]
  wire [31:0] _T_90 = mcyclel + _T_88; // @[el2_dec_tlu_ctl.scala 1604:26]
  wire [32:0] mcyclel_inc = {{1'd0}, _T_90}; // @[el2_dec_tlu_ctl.scala 1604:15]
  wire  mcyclel_cout = mcyclel_inc[32]; // @[el2_dec_tlu_ctl.scala 1606:33]
  wire  _T_99 = io_dec_csr_wraddr_r == 12'hb80; // @[el2_dec_tlu_ctl.scala 1614:69]
  wire  wr_mcycleh_r = io_dec_csr_wen_r_mod & _T_99; // @[el2_dec_tlu_ctl.scala 1614:40]
  wire  _T_96 = ~wr_mcycleh_r; // @[el2_dec_tlu_ctl.scala 1608:72]
  reg  mcyclel_cout_f; // @[el2_dec_tlu_ctl.scala 1608:55]
  wire [31:0] _T_101 = {31'h0,mcyclel_cout_f}; // @[Cat.scala 29:58]
  reg [31:0] mcycleh; // @[el2_lib.scala 514:16]
  wire [31:0] mcycleh_inc = mcycleh + _T_101; // @[el2_dec_tlu_ctl.scala 1616:29]
  wire  _T_107 = io_ebreak_r | io_ecall_r; // @[el2_dec_tlu_ctl.scala 1633:73]
  wire  _T_108 = _T_107 | io_ebreak_to_debug_mode_r; // @[el2_dec_tlu_ctl.scala 1633:86]
  wire  _T_109 = _T_108 | io_illegal_r; // @[el2_dec_tlu_ctl.scala 1633:114]
  wire  _T_111 = _T_109 | mcountinhibit[2]; // @[el2_dec_tlu_ctl.scala 1633:129]
  wire  _T_113 = ~_T_111; // @[el2_dec_tlu_ctl.scala 1633:59]
  wire  i0_valid_no_ebreak_ecall_r = io_tlu_i0_commit_cmt & _T_113; // @[el2_dec_tlu_ctl.scala 1633:57]
  wire  _T_115 = io_dec_csr_wraddr_r == 12'hb02; // @[el2_dec_tlu_ctl.scala 1635:74]
  wire  wr_minstretl_r = io_dec_csr_wen_r_mod & _T_115; // @[el2_dec_tlu_ctl.scala 1635:45]
  wire [31:0] _T_116 = {31'h0,i0_valid_no_ebreak_ecall_r}; // @[Cat.scala 29:58]
  reg [32:0] _T_122; // @[el2_lib.scala 514:16]
  wire [31:0] minstretl = _T_122[31:0]; // @[el2_dec_tlu_ctl.scala 1642:13]
  wire [31:0] _T_118 = minstretl + _T_116; // @[el2_dec_tlu_ctl.scala 1637:30]
  wire [32:0] minstretl_inc = {{1'd0}, _T_118}; // @[el2_dec_tlu_ctl.scala 1637:17]
  wire  minstretl_cout = minstretl_inc[32]; // @[el2_dec_tlu_ctl.scala 1638:37]
  reg  minstret_enable_f; // @[el2_dec_tlu_ctl.scala 1643:57]
  wire  _T_126 = io_dec_csr_wraddr_r == 12'hb82; // @[el2_dec_tlu_ctl.scala 1652:72]
  wire  wr_minstreth_r = io_dec_csr_wen_r_mod & _T_126; // @[el2_dec_tlu_ctl.scala 1652:43]
  wire  _T_123 = ~wr_minstreth_r; // @[el2_dec_tlu_ctl.scala 1644:76]
  reg  minstretl_cout_f; // @[el2_dec_tlu_ctl.scala 1644:57]
  wire [31:0] _T_129 = {31'h0,minstretl_cout_f}; // @[Cat.scala 29:58]
  reg [31:0] minstreth; // @[el2_lib.scala 514:16]
  wire [31:0] minstreth_inc = minstreth + _T_129; // @[el2_dec_tlu_ctl.scala 1655:30]
  wire  _T_137 = io_dec_csr_wraddr_r == 12'h340; // @[el2_dec_tlu_ctl.scala 1666:73]
  reg [31:0] mscratch; // @[el2_lib.scala 514:16]
  wire  _T_140 = ~io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 1677:23]
  wire  _T_141 = ~io_tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 1677:48]
  wire  _T_142 = _T_140 & _T_141; // @[el2_dec_tlu_ctl.scala 1677:46]
  wire  sel_exu_npc_r = _T_142 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 1677:73]
  wire  _T_144 = _T_140 & io_tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 1678:48]
  wire  _T_145 = ~io_dec_tlu_flush_noredir_r_d1; // @[el2_dec_tlu_ctl.scala 1678:76]
  wire  sel_flush_npc_r = _T_144 & _T_145; // @[el2_dec_tlu_ctl.scala 1678:74]
  wire  _T_146 = ~sel_exu_npc_r; // @[el2_dec_tlu_ctl.scala 1679:24]
  wire  _T_147 = ~sel_flush_npc_r; // @[el2_dec_tlu_ctl.scala 1679:41]
  wire  sel_hold_npc_r = _T_146 & _T_147; // @[el2_dec_tlu_ctl.scala 1679:39]
  wire  _T_149 = ~io_mpc_reset_run_req; // @[el2_dec_tlu_ctl.scala 1683:6]
  wire  _T_150 = _T_149 & io_reset_delayed; // @[el2_dec_tlu_ctl.scala 1683:28]
  wire [30:0] _T_154 = sel_exu_npc_r ? io_exu_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_155 = _T_150 ? io_rst_vec : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_156 = sel_flush_npc_r ? io_tlu_flush_path_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_157 = sel_hold_npc_r ? io_npc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_158 = _T_154 | _T_155; // @[Mux.scala 27:72]
  wire [30:0] _T_159 = _T_158 | _T_156; // @[Mux.scala 27:72]
  wire  _T_162 = sel_exu_npc_r | sel_flush_npc_r; // @[el2_dec_tlu_ctl.scala 1687:49]
  reg [30:0] _T_165; // @[el2_lib.scala 514:16]
  wire  pc0_valid_r = _T_140 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 1690:45]
  wire  _T_168 = ~pc0_valid_r; // @[el2_dec_tlu_ctl.scala 1694:5]
  wire [30:0] _T_169 = pc0_valid_r ? io_dec_tlu_i0_pc_r : 31'h0; // @[Mux.scala 27:72]
  reg [30:0] pc_r_d1; // @[el2_lib.scala 514:16]
  wire [30:0] _T_170 = _T_168 ? pc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] pc_r = _T_169 | _T_170; // @[Mux.scala 27:72]
  wire  _T_174 = io_dec_csr_wraddr_r == 12'h341; // @[el2_dec_tlu_ctl.scala 1698:69]
  wire  wr_mepc_r = io_dec_csr_wen_r_mod & _T_174; // @[el2_dec_tlu_ctl.scala 1698:40]
  wire  _T_175 = io_i0_exception_valid_r | io_lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 1701:30]
  wire  _T_176 = _T_175 | io_mepc_trigger_hit_sel_pc_r; // @[el2_dec_tlu_ctl.scala 1701:51]
  wire  _T_180 = wr_mepc_r & _T_15; // @[el2_dec_tlu_ctl.scala 1703:16]
  wire  _T_183 = ~wr_mepc_r; // @[el2_dec_tlu_ctl.scala 1704:6]
  wire  _T_185 = _T_183 & _T_15; // @[el2_dec_tlu_ctl.scala 1704:17]
  wire [30:0] _T_187 = _T_176 ? pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_188 = io_interrupt_valid_r ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_189 = _T_180 ? io_dec_csr_wrdata_r[31:1] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_190 = _T_185 ? io_mepc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_191 = _T_187 | _T_188; // @[Mux.scala 27:72]
  wire [30:0] _T_192 = _T_191 | _T_189; // @[Mux.scala 27:72]
  reg [30:0] _T_194; // @[el2_dec_tlu_ctl.scala 1706:48]
  wire  _T_196 = io_dec_csr_wraddr_r == 12'h342; // @[el2_dec_tlu_ctl.scala 1713:71]
  wire  wr_mcause_r = io_dec_csr_wen_r_mod & _T_196; // @[el2_dec_tlu_ctl.scala 1713:42]
  wire  _T_197 = io_exc_or_int_valid_r & io_take_nmi; // @[el2_dec_tlu_ctl.scala 1714:52]
  wire  mcause_sel_nmi_store = _T_197 & io_nmi_lsu_store_type; // @[el2_dec_tlu_ctl.scala 1714:66]
  wire  mcause_sel_nmi_load = _T_197 & io_nmi_lsu_load_type; // @[el2_dec_tlu_ctl.scala 1715:65]
  wire  _T_200 = |io_lsu_fir_error; // @[el2_dec_tlu_ctl.scala 1716:83]
  wire  mcause_sel_nmi_ext = _T_197 & _T_200; // @[el2_dec_tlu_ctl.scala 1716:64]
  wire  _T_201 = &io_lsu_fir_error; // @[el2_dec_tlu_ctl.scala 1722:52]
  wire  _T_204 = ~io_lsu_fir_error[0]; // @[el2_dec_tlu_ctl.scala 1722:81]
  wire  _T_205 = io_lsu_fir_error[1] & _T_204; // @[el2_dec_tlu_ctl.scala 1722:79]
  wire [31:0] _T_210 = {30'h3c000400,_T_201,_T_205}; // @[Cat.scala 29:58]
  wire  _T_211 = ~io_take_nmi; // @[el2_dec_tlu_ctl.scala 1728:30]
  wire  _T_212 = io_exc_or_int_valid_r & _T_211; // @[el2_dec_tlu_ctl.scala 1728:28]
  wire [31:0] _T_215 = {io_interrupt_valid_r,26'h0,io_exc_cause_r}; // @[Cat.scala 29:58]
  wire  _T_217 = wr_mcause_r & _T_15; // @[el2_dec_tlu_ctl.scala 1729:18]
  wire  _T_219 = ~wr_mcause_r; // @[el2_dec_tlu_ctl.scala 1730:6]
  wire  _T_221 = _T_219 & _T_15; // @[el2_dec_tlu_ctl.scala 1730:19]
  wire [31:0] _T_223 = mcause_sel_nmi_store ? 32'hf0000000 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_224 = mcause_sel_nmi_load ? 32'hf0000001 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_225 = mcause_sel_nmi_ext ? _T_210 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_226 = _T_212 ? _T_215 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_227 = _T_217 ? io_dec_csr_wrdata_r : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] mcause; // @[el2_dec_tlu_ctl.scala 1732:47]
  wire [31:0] _T_228 = _T_221 ? mcause : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_229 = _T_223 | _T_224; // @[Mux.scala 27:72]
  wire [31:0] _T_230 = _T_229 | _T_225; // @[Mux.scala 27:72]
  wire [31:0] _T_231 = _T_230 | _T_226; // @[Mux.scala 27:72]
  wire [31:0] _T_232 = _T_231 | _T_227; // @[Mux.scala 27:72]
  wire  _T_236 = io_dec_csr_wraddr_r == 12'h7ff; // @[el2_dec_tlu_ctl.scala 1739:72]
  wire  wr_mscause_r = io_dec_csr_wen_r_mod & _T_236; // @[el2_dec_tlu_ctl.scala 1739:43]
  wire  _T_237 = io_dec_tlu_packet_r_icaf_type == 2'h0; // @[el2_dec_tlu_ctl.scala 1741:57]
  wire [3:0] _T_238 = {2'h0,io_dec_tlu_packet_r_icaf_type}; // @[Cat.scala 29:58]
  wire [3:0] ifu_mscause = _T_237 ? 4'h9 : _T_238; // @[el2_dec_tlu_ctl.scala 1741:25]
  wire  _T_243 = io_lsu_i0_exc_r & io_lsu_error_pkt_r_bits_mscause; // @[Mux.scala 27:72]
  wire [1:0] _T_245 = io_ebreak_r ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_246 = io_inst_acc_r ? ifu_mscause : 4'h0; // @[Mux.scala 27:72]
  wire  _T_247 = _T_243 | io_i0_trigger_hit_r; // @[Mux.scala 27:72]
  wire [1:0] _GEN_13 = {{1'd0}, _T_247}; // @[Mux.scala 27:72]
  wire [1:0] _T_248 = _GEN_13 | _T_245; // @[Mux.scala 27:72]
  wire [3:0] _GEN_14 = {{2'd0}, _T_248}; // @[Mux.scala 27:72]
  wire [3:0] mscause_type = _GEN_14 | _T_246; // @[Mux.scala 27:72]
  wire  _T_252 = wr_mscause_r & _T_15; // @[el2_dec_tlu_ctl.scala 1752:19]
  wire  _T_255 = ~wr_mscause_r; // @[el2_dec_tlu_ctl.scala 1753:6]
  wire  _T_257 = _T_255 & _T_15; // @[el2_dec_tlu_ctl.scala 1753:20]
  wire [3:0] _T_259 = io_exc_or_int_valid_r ? mscause_type : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_260 = _T_252 ? io_dec_csr_wrdata_r[3:0] : 4'h0; // @[Mux.scala 27:72]
  reg [3:0] mscause; // @[el2_dec_tlu_ctl.scala 1755:48]
  wire [3:0] _T_261 = _T_257 ? mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_262 = _T_259 | _T_260; // @[Mux.scala 27:72]
  wire  _T_266 = io_dec_csr_wraddr_r == 12'h343; // @[el2_dec_tlu_ctl.scala 1762:70]
  wire  wr_mtval_r = io_dec_csr_wen_r_mod & _T_266; // @[el2_dec_tlu_ctl.scala 1762:41]
  wire  _T_267 = ~io_inst_acc_second_r; // @[el2_dec_tlu_ctl.scala 1763:84]
  wire  _T_268 = io_inst_acc_r & _T_267; // @[el2_dec_tlu_ctl.scala 1763:82]
  wire  _T_269 = io_ebreak_r | _T_268; // @[el2_dec_tlu_ctl.scala 1763:65]
  wire  _T_270 = _T_269 | io_mepc_trigger_hit_sel_pc_r; // @[el2_dec_tlu_ctl.scala 1763:107]
  wire  _T_271 = io_exc_or_int_valid_r & _T_270; // @[el2_dec_tlu_ctl.scala 1763:50]
  wire  mtval_capture_pc_r = _T_271 & _T_211; // @[el2_dec_tlu_ctl.scala 1763:139]
  wire  _T_273 = io_inst_acc_r & io_inst_acc_second_r; // @[el2_dec_tlu_ctl.scala 1764:73]
  wire  _T_274 = io_exc_or_int_valid_r & _T_273; // @[el2_dec_tlu_ctl.scala 1764:56]
  wire  mtval_capture_pc_plus2_r = _T_274 & _T_211; // @[el2_dec_tlu_ctl.scala 1764:97]
  wire  _T_276 = io_exc_or_int_valid_r & io_illegal_r; // @[el2_dec_tlu_ctl.scala 1765:52]
  wire  mtval_capture_inst_r = _T_276 & _T_211; // @[el2_dec_tlu_ctl.scala 1765:67]
  wire  _T_278 = io_exc_or_int_valid_r & io_lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 1766:51]
  wire  mtval_capture_lsu_r = _T_278 & _T_211; // @[el2_dec_tlu_ctl.scala 1766:72]
  wire  _T_280 = ~mtval_capture_pc_r; // @[el2_dec_tlu_ctl.scala 1767:47]
  wire  _T_281 = io_exc_or_int_valid_r & _T_280; // @[el2_dec_tlu_ctl.scala 1767:45]
  wire  _T_282 = ~mtval_capture_inst_r; // @[el2_dec_tlu_ctl.scala 1767:69]
  wire  _T_283 = _T_281 & _T_282; // @[el2_dec_tlu_ctl.scala 1767:67]
  wire  _T_284 = ~mtval_capture_lsu_r; // @[el2_dec_tlu_ctl.scala 1767:93]
  wire  _T_285 = _T_283 & _T_284; // @[el2_dec_tlu_ctl.scala 1767:91]
  wire  _T_286 = ~io_mepc_trigger_hit_sel_pc_r; // @[el2_dec_tlu_ctl.scala 1767:116]
  wire  mtval_clear_r = _T_285 & _T_286; // @[el2_dec_tlu_ctl.scala 1767:114]
  wire [31:0] _T_288 = {pc_r,1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_291 = pc_r + 31'h1; // @[el2_dec_tlu_ctl.scala 1772:84]
  wire [31:0] _T_292 = {_T_291,1'h0}; // @[Cat.scala 29:58]
  wire  _T_295 = ~io_interrupt_valid_r; // @[el2_dec_tlu_ctl.scala 1775:19]
  wire  _T_296 = wr_mtval_r & _T_295; // @[el2_dec_tlu_ctl.scala 1775:17]
  wire  _T_299 = ~wr_mtval_r; // @[el2_dec_tlu_ctl.scala 1776:21]
  wire  _T_300 = _T_211 & _T_299; // @[el2_dec_tlu_ctl.scala 1776:19]
  wire  _T_302 = _T_300 & _T_280; // @[el2_dec_tlu_ctl.scala 1776:33]
  wire  _T_304 = _T_302 & _T_282; // @[el2_dec_tlu_ctl.scala 1776:55]
  wire  _T_305 = ~mtval_clear_r; // @[el2_dec_tlu_ctl.scala 1776:81]
  wire  _T_306 = _T_304 & _T_305; // @[el2_dec_tlu_ctl.scala 1776:79]
  wire  _T_308 = _T_306 & _T_284; // @[el2_dec_tlu_ctl.scala 1776:96]
  wire [31:0] _T_310 = mtval_capture_pc_r ? _T_288 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_311 = mtval_capture_pc_plus2_r ? _T_292 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_312 = mtval_capture_inst_r ? io_dec_illegal_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_313 = mtval_capture_lsu_r ? io_lsu_error_pkt_addr_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_314 = _T_296 ? io_dec_csr_wrdata_r : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] mtval; // @[el2_dec_tlu_ctl.scala 1778:47]
  wire [31:0] _T_315 = _T_308 ? mtval : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_316 = _T_310 | _T_311; // @[Mux.scala 27:72]
  wire [31:0] _T_317 = _T_316 | _T_312; // @[Mux.scala 27:72]
  wire [31:0] _T_318 = _T_317 | _T_313; // @[Mux.scala 27:72]
  wire [31:0] _T_319 = _T_318 | _T_314; // @[Mux.scala 27:72]
  wire  _T_323 = io_dec_csr_wraddr_r == 12'h7f8; // @[el2_dec_tlu_ctl.scala 1793:69]
  reg [8:0] mcgc; // @[el2_lib.scala 514:16]
  wire  _T_335 = io_dec_csr_wraddr_r == 12'h7f9; // @[el2_dec_tlu_ctl.scala 1823:69]
  reg [14:0] mfdc_int; // @[el2_lib.scala 514:16]
  wire [2:0] _T_339 = ~io_dec_csr_wrdata_r[18:16]; // @[el2_dec_tlu_ctl.scala 1832:20]
  wire  _T_342 = ~io_dec_csr_wrdata_r[6]; // @[el2_dec_tlu_ctl.scala 1832:75]
  wire [6:0] _T_344 = {_T_342,io_dec_csr_wrdata_r[5:0]}; // @[Cat.scala 29:58]
  wire [7:0] _T_345 = {_T_339,io_dec_csr_wrdata_r[11:7]}; // @[Cat.scala 29:58]
  wire [2:0] _T_348 = ~mfdc_int[14:12]; // @[el2_dec_tlu_ctl.scala 1833:20]
  wire  _T_351 = ~mfdc_int[6]; // @[el2_dec_tlu_ctl.scala 1833:63]
  wire [18:0] mfdc = {_T_348,4'h0,mfdc_int[11:7],_T_351,mfdc_int[5:0]}; // @[Cat.scala 29:58]
  wire  _T_365 = io_dec_csr_wraddr_r == 12'h7c2; // @[el2_dec_tlu_ctl.scala 1856:78]
  wire  _T_366 = io_dec_csr_wen_r_mod & _T_365; // @[el2_dec_tlu_ctl.scala 1856:49]
  wire  _T_368 = _T_366 & _T_295; // @[el2_dec_tlu_ctl.scala 1856:88]
  wire  _T_369 = ~io_take_ext_int_start; // @[el2_dec_tlu_ctl.scala 1856:114]
  wire  _T_372 = io_dec_csr_wraddr_r == 12'h7c0; // @[el2_dec_tlu_ctl.scala 1863:69]
  wire  _T_376 = ~io_dec_csr_wrdata_r[31]; // @[el2_dec_tlu_ctl.scala 1866:72]
  wire  _T_377 = io_dec_csr_wrdata_r[30] & _T_376; // @[el2_dec_tlu_ctl.scala 1866:70]
  wire  _T_381 = ~io_dec_csr_wrdata_r[29]; // @[el2_dec_tlu_ctl.scala 1867:56]
  wire  _T_382 = io_dec_csr_wrdata_r[28] & _T_381; // @[el2_dec_tlu_ctl.scala 1867:54]
  wire  _T_386 = ~io_dec_csr_wrdata_r[27]; // @[el2_dec_tlu_ctl.scala 1868:56]
  wire  _T_387 = io_dec_csr_wrdata_r[26] & _T_386; // @[el2_dec_tlu_ctl.scala 1868:54]
  wire  _T_391 = ~io_dec_csr_wrdata_r[25]; // @[el2_dec_tlu_ctl.scala 1869:56]
  wire  _T_392 = io_dec_csr_wrdata_r[24] & _T_391; // @[el2_dec_tlu_ctl.scala 1869:54]
  wire  _T_396 = ~io_dec_csr_wrdata_r[23]; // @[el2_dec_tlu_ctl.scala 1870:56]
  wire  _T_397 = io_dec_csr_wrdata_r[22] & _T_396; // @[el2_dec_tlu_ctl.scala 1870:54]
  wire  _T_401 = ~io_dec_csr_wrdata_r[21]; // @[el2_dec_tlu_ctl.scala 1871:56]
  wire  _T_402 = io_dec_csr_wrdata_r[20] & _T_401; // @[el2_dec_tlu_ctl.scala 1871:54]
  wire  _T_406 = ~io_dec_csr_wrdata_r[19]; // @[el2_dec_tlu_ctl.scala 1872:56]
  wire  _T_407 = io_dec_csr_wrdata_r[18] & _T_406; // @[el2_dec_tlu_ctl.scala 1872:54]
  wire  _T_411 = ~io_dec_csr_wrdata_r[17]; // @[el2_dec_tlu_ctl.scala 1873:56]
  wire  _T_412 = io_dec_csr_wrdata_r[16] & _T_411; // @[el2_dec_tlu_ctl.scala 1873:54]
  wire  _T_416 = ~io_dec_csr_wrdata_r[15]; // @[el2_dec_tlu_ctl.scala 1874:56]
  wire  _T_417 = io_dec_csr_wrdata_r[14] & _T_416; // @[el2_dec_tlu_ctl.scala 1874:54]
  wire  _T_421 = ~io_dec_csr_wrdata_r[13]; // @[el2_dec_tlu_ctl.scala 1875:56]
  wire  _T_422 = io_dec_csr_wrdata_r[12] & _T_421; // @[el2_dec_tlu_ctl.scala 1875:54]
  wire  _T_426 = ~io_dec_csr_wrdata_r[11]; // @[el2_dec_tlu_ctl.scala 1876:56]
  wire  _T_427 = io_dec_csr_wrdata_r[10] & _T_426; // @[el2_dec_tlu_ctl.scala 1876:54]
  wire  _T_431 = ~io_dec_csr_wrdata_r[9]; // @[el2_dec_tlu_ctl.scala 1877:56]
  wire  _T_432 = io_dec_csr_wrdata_r[8] & _T_431; // @[el2_dec_tlu_ctl.scala 1877:53]
  wire  _T_436 = ~io_dec_csr_wrdata_r[7]; // @[el2_dec_tlu_ctl.scala 1878:56]
  wire  _T_437 = io_dec_csr_wrdata_r[6] & _T_436; // @[el2_dec_tlu_ctl.scala 1878:53]
  wire  _T_441 = ~io_dec_csr_wrdata_r[5]; // @[el2_dec_tlu_ctl.scala 1879:56]
  wire  _T_442 = io_dec_csr_wrdata_r[4] & _T_441; // @[el2_dec_tlu_ctl.scala 1879:53]
  wire  _T_446 = ~io_dec_csr_wrdata_r[3]; // @[el2_dec_tlu_ctl.scala 1880:56]
  wire  _T_447 = io_dec_csr_wrdata_r[2] & _T_446; // @[el2_dec_tlu_ctl.scala 1880:53]
  wire  _T_452 = io_dec_csr_wrdata_r[0] & _T_507; // @[el2_dec_tlu_ctl.scala 1881:53]
  wire [7:0] _T_459 = {io_dec_csr_wrdata_r[7],_T_437,io_dec_csr_wrdata_r[5],_T_442,io_dec_csr_wrdata_r[3],_T_447,io_dec_csr_wrdata_r[1],_T_452}; // @[Cat.scala 29:58]
  wire [15:0] _T_467 = {io_dec_csr_wrdata_r[15],_T_417,io_dec_csr_wrdata_r[13],_T_422,io_dec_csr_wrdata_r[11],_T_427,io_dec_csr_wrdata_r[9],_T_432,_T_459}; // @[Cat.scala 29:58]
  wire [7:0] _T_474 = {io_dec_csr_wrdata_r[23],_T_397,io_dec_csr_wrdata_r[21],_T_402,io_dec_csr_wrdata_r[19],_T_407,io_dec_csr_wrdata_r[17],_T_412}; // @[Cat.scala 29:58]
  wire [15:0] _T_482 = {io_dec_csr_wrdata_r[31],_T_377,io_dec_csr_wrdata_r[29],_T_382,io_dec_csr_wrdata_r[27],_T_387,io_dec_csr_wrdata_r[25],_T_392,_T_474}; // @[Cat.scala 29:58]
  reg [31:0] mrac; // @[el2_lib.scala 514:16]
  wire  _T_485 = io_dec_csr_wraddr_r == 12'hbc0; // @[el2_dec_tlu_ctl.scala 1894:70]
  wire  wr_mdeau_r = io_dec_csr_wen_r_mod & _T_485; // @[el2_dec_tlu_ctl.scala 1894:41]
  wire  _T_486 = ~wr_mdeau_r; // @[el2_dec_tlu_ctl.scala 1904:60]
  wire  _T_487 = io_mdseac_locked_f & _T_486; // @[el2_dec_tlu_ctl.scala 1904:58]
  wire  _T_489 = io_lsu_imprecise_error_store_any | io_lsu_imprecise_error_load_any; // @[el2_dec_tlu_ctl.scala 1906:50]
  wire  _T_490 = ~io_nmi_int_detected_f; // @[el2_dec_tlu_ctl.scala 1906:87]
  wire  _T_491 = _T_489 & _T_490; // @[el2_dec_tlu_ctl.scala 1906:85]
  wire  _T_492 = ~io_mdseac_locked_f; // @[el2_dec_tlu_ctl.scala 1906:112]
  wire  mdseac_en = _T_491 & _T_492; // @[el2_dec_tlu_ctl.scala 1906:110]
  reg [31:0] mdseac; // @[el2_lib.scala 514:16]
  wire  _T_498 = wr_mpmc_r & io_dec_csr_wrdata_r[0]; // @[el2_dec_tlu_ctl.scala 1921:31]
  wire  _T_499 = ~io_internal_dbg_halt_mode_f2; // @[el2_dec_tlu_ctl.scala 1921:58]
  wire  _T_500 = _T_498 & _T_499; // @[el2_dec_tlu_ctl.scala 1921:56]
  wire  _T_501 = ~io_ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 1921:90]
  wire  _T_514 = io_dec_csr_wrdata_r[31:27] > 5'h1a; // @[el2_dec_tlu_ctl.scala 1938:49]
  wire [4:0] csr_sat = _T_514 ? 5'h1a : io_dec_csr_wrdata_r[31:27]; // @[el2_dec_tlu_ctl.scala 1938:20]
  wire  _T_517 = io_dec_csr_wraddr_r == 12'h7f0; // @[el2_dec_tlu_ctl.scala 1940:71]
  wire  wr_micect_r = io_dec_csr_wen_r_mod & _T_517; // @[el2_dec_tlu_ctl.scala 1940:42]
  wire [26:0] _T_518 = {26'h0,io_ic_perr_r_d1}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_15 = {{5'd0}, _T_518}; // @[el2_dec_tlu_ctl.scala 1941:24]
  wire [31:0] _T_520 = micect + _GEN_15; // @[el2_dec_tlu_ctl.scala 1941:24]
  wire [31:0] _T_523 = {csr_sat,io_dec_csr_wrdata_r[26:0]}; // @[Cat.scala 29:58]
  wire [26:0] micect_inc = _T_520[26:0]; // @[el2_dec_tlu_ctl.scala 1941:14]
  wire [31:0] _T_525 = {micect[31:27],micect_inc}; // @[Cat.scala 29:58]
  wire  _T_536 = io_dec_csr_wraddr_r == 12'h7f1; // @[el2_dec_tlu_ctl.scala 1955:77]
  wire  wr_miccmect_r = io_dec_csr_wen_r_mod & _T_536; // @[el2_dec_tlu_ctl.scala 1955:48]
  wire  _T_538 = io_iccm_sbecc_r_d1 | io_iccm_dma_sb_error; // @[el2_dec_tlu_ctl.scala 1956:71]
  wire [26:0] _T_539 = {26'h0,_T_538}; // @[Cat.scala 29:58]
  wire [26:0] miccmect_inc = miccmect[26:0] + _T_539; // @[el2_dec_tlu_ctl.scala 1956:34]
  wire [31:0] _T_546 = {miccmect[31:27],miccmect_inc}; // @[Cat.scala 29:58]
  wire  _T_547 = wr_miccmect_r | io_iccm_sbecc_r_d1; // @[el2_dec_tlu_ctl.scala 1959:49]
  wire  _T_558 = io_dec_csr_wraddr_r == 12'h7f2; // @[el2_dec_tlu_ctl.scala 1969:77]
  wire  wr_mdccmect_r = io_dec_csr_wen_r_mod & _T_558; // @[el2_dec_tlu_ctl.scala 1969:48]
  wire [26:0] _T_560 = {26'h0,io_lsu_single_ecc_error_r_d1}; // @[Cat.scala 29:58]
  wire [26:0] mdccmect_inc = mdccmect[26:0] + _T_560; // @[el2_dec_tlu_ctl.scala 1970:34]
  wire [31:0] _T_567 = {mdccmect[31:27],mdccmect_inc}; // @[Cat.scala 29:58]
  wire  _T_578 = io_dec_csr_wraddr_r == 12'h7ce; // @[el2_dec_tlu_ctl.scala 1985:70]
  wire  wr_mfdht_r = io_dec_csr_wen_r_mod & _T_578; // @[el2_dec_tlu_ctl.scala 1985:41]
  reg [5:0] mfdht; // @[el2_dec_tlu_ctl.scala 1989:44]
  wire  _T_583 = io_dec_csr_wraddr_r == 12'h7cf; // @[el2_dec_tlu_ctl.scala 1998:70]
  wire  wr_mfdhs_r = io_dec_csr_wen_r_mod & _T_583; // @[el2_dec_tlu_ctl.scala 1998:41]
  wire  _T_586 = ~io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 2001:30]
  wire  _T_587 = io_dbg_tlu_halted & _T_586; // @[el2_dec_tlu_ctl.scala 2001:28]
  wire  _T_589 = ~io_lsu_idle_any_f; // @[el2_dec_tlu_ctl.scala 2001:65]
  wire  _T_590 = ~io_ifu_miss_state_idle_f; // @[el2_dec_tlu_ctl.scala 2001:85]
  wire [1:0] _T_591 = {_T_589,_T_590}; // @[Cat.scala 29:58]
  reg [1:0] mfdhs; // @[Reg.scala 27:20]
  wire  _T_593 = wr_mfdhs_r | io_dbg_tlu_halted; // @[el2_dec_tlu_ctl.scala 2003:72]
  reg [31:0] force_halt_ctr_f; // @[Reg.scala 27:20]
  wire [31:0] _T_598 = force_halt_ctr_f + 32'h1; // @[el2_dec_tlu_ctl.scala 2005:75]
  wire [62:0] _T_605 = 63'hffffffff << mfdht[5:1]; // @[el2_dec_tlu_ctl.scala 2010:72]
  wire [62:0] _GEN_16 = {{31'd0}, force_halt_ctr_f}; // @[el2_dec_tlu_ctl.scala 2010:49]
  wire [62:0] _T_606 = _GEN_16 & _T_605; // @[el2_dec_tlu_ctl.scala 2010:49]
  wire  _T_607 = |_T_606; // @[el2_dec_tlu_ctl.scala 2010:88]
  wire  _T_610 = io_dec_csr_wraddr_r == 12'hbc8; // @[el2_dec_tlu_ctl.scala 2018:70]
  reg [21:0] meivt; // @[el2_lib.scala 514:16]
  wire  _T_630 = io_dec_csr_wraddr_r == 12'hbca; // @[el2_dec_tlu_ctl.scala 2069:70]
  wire  _T_631 = io_dec_csr_wen_r_mod & _T_630; // @[el2_dec_tlu_ctl.scala 2069:41]
  wire  wr_meicpct_r = _T_631 | io_take_ext_int_start; // @[el2_dec_tlu_ctl.scala 2069:84]
  reg [7:0] meihap; // @[el2_lib.scala 514:16]
  wire [31:0] _T_615 = {meivt,meihap,2'h0}; // @[Cat.scala 29:58]
  wire  _T_617 = io_dec_csr_wraddr_r == 12'hbcc; // @[el2_dec_tlu_ctl.scala 2042:73]
  wire  wr_meicurpl_r = io_dec_csr_wen_r_mod & _T_617; // @[el2_dec_tlu_ctl.scala 2042:44]
  reg [3:0] meicurpl; // @[el2_dec_tlu_ctl.scala 2045:47]
  wire  _T_622 = io_dec_csr_wraddr_r == 12'hbcb; // @[el2_dec_tlu_ctl.scala 2057:74]
  wire  _T_623 = io_dec_csr_wen_r_mod & _T_622; // @[el2_dec_tlu_ctl.scala 2057:45]
  wire  wr_meicidpl_r = _T_623 | io_take_ext_int_start; // @[el2_dec_tlu_ctl.scala 2057:89]
  reg [3:0] meicidpl; // @[el2_dec_tlu_ctl.scala 2062:45]
  wire  _T_634 = io_dec_csr_wraddr_r == 12'hbc9; // @[el2_dec_tlu_ctl.scala 2078:70]
  wire  wr_meipt_r = io_dec_csr_wen_r_mod & _T_634; // @[el2_dec_tlu_ctl.scala 2078:41]
  reg [3:0] meipt; // @[el2_dec_tlu_ctl.scala 2081:44]
  wire  _T_638 = io_trigger_hit_r_d1 & io_dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 2109:90]
  wire  trigger_hit_for_dscr_cause_r_d1 = io_trigger_hit_dmode_r_d1 | _T_638; // @[el2_dec_tlu_ctl.scala 2109:67]
  wire  _T_639 = ~io_ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 2112:35]
  wire  _T_640 = io_dcsr_single_step_done_f & _T_639; // @[el2_dec_tlu_ctl.scala 2112:33]
  wire  _T_641 = ~trigger_hit_for_dscr_cause_r_d1; // @[el2_dec_tlu_ctl.scala 2112:67]
  wire  _T_642 = _T_640 & _T_641; // @[el2_dec_tlu_ctl.scala 2112:65]
  wire  _T_643 = ~io_debug_halt_req; // @[el2_dec_tlu_ctl.scala 2112:102]
  wire  _T_644 = _T_642 & _T_643; // @[el2_dec_tlu_ctl.scala 2112:100]
  wire  _T_647 = io_debug_halt_req & _T_639; // @[el2_dec_tlu_ctl.scala 2113:24]
  wire  _T_649 = _T_647 & _T_641; // @[el2_dec_tlu_ctl.scala 2113:56]
  wire  _T_652 = io_ebreak_to_debug_mode_r_d1 & _T_641; // @[el2_dec_tlu_ctl.scala 2114:35]
  wire [2:0] _T_655 = _T_644 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_656 = _T_649 ? 3'h3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_657 = _T_652 ? 3'h1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_658 = trigger_hit_for_dscr_cause_r_d1 ? 3'h2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_659 = _T_655 | _T_656; // @[Mux.scala 27:72]
  wire [2:0] _T_660 = _T_659 | _T_657; // @[Mux.scala 27:72]
  wire [2:0] dcsr_cause = _T_660 | _T_658; // @[Mux.scala 27:72]
  wire  _T_662 = io_allow_dbg_halt_csr_write & io_dec_csr_wen_r_mod; // @[el2_dec_tlu_ctl.scala 2117:47]
  wire  _T_664 = io_dec_csr_wraddr_r == 12'h7b0; // @[el2_dec_tlu_ctl.scala 2117:99]
  wire  wr_dcsr_r = _T_662 & _T_664; // @[el2_dec_tlu_ctl.scala 2117:70]
  wire  _T_666 = io_dcsr[8:6] == 3'h3; // @[el2_dec_tlu_ctl.scala 2123:76]
  wire  dcsr_cause_upgradeable = io_internal_dbg_halt_mode_f & _T_666; // @[el2_dec_tlu_ctl.scala 2123:60]
  wire  _T_667 = ~io_dbg_tlu_halted; // @[el2_dec_tlu_ctl.scala 2124:60]
  wire  _T_668 = _T_667 | dcsr_cause_upgradeable; // @[el2_dec_tlu_ctl.scala 2124:79]
  wire  enter_debug_halt_req_le = io_enter_debug_halt_req & _T_668; // @[el2_dec_tlu_ctl.scala 2124:57]
  wire  nmi_in_debug_mode = io_nmi_int_detected_f & io_internal_dbg_halt_mode_f; // @[el2_dec_tlu_ctl.scala 2126:49]
  wire [15:0] _T_674 = {io_dcsr[15:9],dcsr_cause,io_dcsr[5:2],2'h3}; // @[Cat.scala 29:58]
  wire  _T_680 = nmi_in_debug_mode | io_dcsr[3]; // @[el2_dec_tlu_ctl.scala 2128:146]
  wire [15:0] _T_689 = {io_dec_csr_wrdata_r[15],3'h0,io_dec_csr_wrdata_r[11:10],1'h0,io_dcsr[8:6],2'h0,_T_680,io_dec_csr_wrdata_r[2],2'h3}; // @[Cat.scala 29:58]
  wire [15:0] _T_694 = {io_dcsr[15:4],nmi_in_debug_mode,io_dcsr[2],2'h3}; // @[Cat.scala 29:58]
  wire  _T_696 = enter_debug_halt_req_le | wr_dcsr_r; // @[el2_dec_tlu_ctl.scala 2130:55]
  wire  _T_697 = _T_696 | io_internal_dbg_halt_mode; // @[el2_dec_tlu_ctl.scala 2130:67]
  reg [15:0] _T_700; // @[el2_lib.scala 514:16]
  wire  _T_703 = io_dec_csr_wraddr_r == 12'h7b1; // @[el2_dec_tlu_ctl.scala 2138:98]
  wire  wr_dpc_r = _T_662 & _T_703; // @[el2_dec_tlu_ctl.scala 2138:69]
  wire  _T_706 = ~io_request_debug_mode_done; // @[el2_dec_tlu_ctl.scala 2139:68]
  wire  dpc_capture_npc = _T_587 & _T_706; // @[el2_dec_tlu_ctl.scala 2139:66]
  wire  _T_707 = ~io_request_debug_mode_r; // @[el2_dec_tlu_ctl.scala 2143:6]
  wire  _T_708 = ~dpc_capture_npc; // @[el2_dec_tlu_ctl.scala 2143:24]
  wire  _T_709 = _T_707 & _T_708; // @[el2_dec_tlu_ctl.scala 2143:22]
  wire  _T_710 = _T_709 & wr_dpc_r; // @[el2_dec_tlu_ctl.scala 2143:41]
  wire  _T_715 = _T_707 & dpc_capture_npc; // @[el2_dec_tlu_ctl.scala 2145:22]
  wire [30:0] _T_717 = _T_710 ? io_dec_csr_wrdata_r[31:1] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_718 = io_request_debug_mode_r ? pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_719 = _T_715 ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_720 = _T_717 | _T_718; // @[Mux.scala 27:72]
  wire  _T_722 = wr_dpc_r | io_request_debug_mode_r; // @[el2_dec_tlu_ctl.scala 2147:37]
  reg [30:0] _T_725; // @[el2_lib.scala 514:16]
  wire [2:0] _T_729 = {io_dec_csr_wrdata_r[24],io_dec_csr_wrdata_r[21:20]}; // @[Cat.scala 29:58]
  wire  _T_732 = io_dec_csr_wraddr_r == 12'h7c8; // @[el2_dec_tlu_ctl.scala 2162:103]
  reg [16:0] dicawics; // @[el2_lib.scala 514:16]
  wire  _T_736 = io_dec_csr_wraddr_r == 12'h7c9; // @[el2_dec_tlu_ctl.scala 2180:101]
  wire  wr_dicad0_r = _T_662 & _T_736; // @[el2_dec_tlu_ctl.scala 2180:72]
  reg [70:0] dicad0; // @[el2_lib.scala 514:16]
  wire  _T_742 = io_dec_csr_wraddr_r == 12'h7cc; // @[el2_dec_tlu_ctl.scala 2193:102]
  wire  wr_dicad0h_r = _T_662 & _T_742; // @[el2_dec_tlu_ctl.scala 2193:73]
  reg [31:0] dicad0h; // @[el2_lib.scala 514:16]
  wire  _T_750 = io_dec_csr_wraddr_r == 12'h7ca; // @[el2_dec_tlu_ctl.scala 2205:103]
  wire  _T_751 = _T_662 & _T_750; // @[el2_dec_tlu_ctl.scala 2205:74]
  wire  _T_755 = _T_751 | io_ifu_ic_debug_rd_data_valid; // @[el2_dec_tlu_ctl.scala 2209:81]
  reg [31:0] _T_757; // @[Reg.scala 27:20]
  wire [31:0] dicad1 = {25'h0,_T_757[6:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_762 = {dicad1[6:0],dicad0h}; // @[Cat.scala 29:58]
  wire  _T_764 = io_allow_dbg_halt_csr_write & io_dec_csr_any_unq_d; // @[el2_dec_tlu_ctl.scala 2237:53]
  wire  _T_765 = _T_764 & io_dec_i0_decode_d; // @[el2_dec_tlu_ctl.scala 2237:76]
  wire  _T_766 = ~io_dec_csr_wen_unq_d; // @[el2_dec_tlu_ctl.scala 2237:99]
  wire  _T_767 = _T_765 & _T_766; // @[el2_dec_tlu_ctl.scala 2237:97]
  wire  _T_769 = io_dec_csr_rdaddr_d == 12'h7cb; // @[el2_dec_tlu_ctl.scala 2237:150]
  wire  _T_772 = io_dec_csr_wraddr_r == 12'h7cb; // @[el2_dec_tlu_ctl.scala 2238:105]
  reg  icache_rd_valid_f; // @[el2_dec_tlu_ctl.scala 2240:59]
  reg  icache_wr_valid_f; // @[el2_dec_tlu_ctl.scala 2241:59]
  wire  _T_774 = io_dec_csr_wraddr_r == 12'h7a0; // @[el2_dec_tlu_ctl.scala 2252:70]
  wire  wr_mtsel_r = io_dec_csr_wen_r_mod & _T_774; // @[el2_dec_tlu_ctl.scala 2252:41]
  reg [1:0] mtsel; // @[el2_dec_tlu_ctl.scala 2255:44]
  wire  tdata_load = io_dec_csr_wrdata_r[0] & _T_406; // @[el2_dec_tlu_ctl.scala 2290:43]
  wire  tdata_opcode = io_dec_csr_wrdata_r[2] & _T_406; // @[el2_dec_tlu_ctl.scala 2292:45]
  wire  _T_785 = io_dec_csr_wrdata_r[27] & io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 2294:47]
  wire  tdata_action = _T_785 & io_dec_csr_wrdata_r[12]; // @[el2_dec_tlu_ctl.scala 2294:70]
  wire [9:0] tdata_wrdata_r = {_T_785,io_dec_csr_wrdata_r[20:19],tdata_action,io_dec_csr_wrdata_r[11],io_dec_csr_wrdata_r[7:6],tdata_opcode,io_dec_csr_wrdata_r[1],tdata_load}; // @[Cat.scala 29:58]
  wire  _T_800 = io_dec_csr_wraddr_r == 12'h7a1; // @[el2_dec_tlu_ctl.scala 2300:100]
  wire  _T_801 = io_dec_csr_wen_r_mod & _T_800; // @[el2_dec_tlu_ctl.scala 2300:71]
  wire  _T_802 = mtsel == 2'h0; // @[el2_dec_tlu_ctl.scala 2300:122]
  wire  _T_803 = _T_801 & _T_802; // @[el2_dec_tlu_ctl.scala 2300:113]
  wire  _T_805 = ~io_mtdata1_t_0[9]; // @[el2_dec_tlu_ctl.scala 2300:139]
  wire  _T_806 = _T_805 | io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 2300:171]
  wire  wr_mtdata1_t_r_0 = _T_803 & _T_806; // @[el2_dec_tlu_ctl.scala 2300:136]
  wire  _T_814 = ~io_mtdata1_t_1[9]; // @[el2_dec_tlu_ctl.scala 2300:139]
  wire  _T_815 = _T_814 | io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 2300:171]
  wire  wr_mtdata1_t_r_1 = _T_803 & _T_815; // @[el2_dec_tlu_ctl.scala 2300:136]
  wire  _T_823 = ~io_mtdata1_t_2[9]; // @[el2_dec_tlu_ctl.scala 2300:139]
  wire  _T_824 = _T_823 | io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 2300:171]
  wire  wr_mtdata1_t_r_2 = _T_803 & _T_824; // @[el2_dec_tlu_ctl.scala 2300:136]
  wire  _T_832 = ~io_mtdata1_t_3[9]; // @[el2_dec_tlu_ctl.scala 2300:139]
  wire  _T_833 = _T_832 | io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 2300:171]
  wire  wr_mtdata1_t_r_3 = _T_803 & _T_833; // @[el2_dec_tlu_ctl.scala 2300:136]
  wire  _T_839 = io_update_hit_bit_r[0] | io_mtdata1_t_0[8]; // @[el2_dec_tlu_ctl.scala 2301:140]
  wire [9:0] _T_842 = {io_mtdata1_t_0[9],_T_839,io_mtdata1_t_0[7:0]}; // @[Cat.scala 29:58]
  wire  _T_848 = io_update_hit_bit_r[1] | io_mtdata1_t_1[8]; // @[el2_dec_tlu_ctl.scala 2301:140]
  wire [9:0] _T_851 = {io_mtdata1_t_1[9],_T_848,io_mtdata1_t_1[7:0]}; // @[Cat.scala 29:58]
  wire  _T_857 = io_update_hit_bit_r[2] | io_mtdata1_t_2[8]; // @[el2_dec_tlu_ctl.scala 2301:140]
  wire [9:0] _T_860 = {io_mtdata1_t_2[9],_T_857,io_mtdata1_t_2[7:0]}; // @[Cat.scala 29:58]
  wire  _T_866 = io_update_hit_bit_r[3] | io_mtdata1_t_3[8]; // @[el2_dec_tlu_ctl.scala 2301:140]
  wire [9:0] _T_869 = {io_mtdata1_t_3[9],_T_866,io_mtdata1_t_3[7:0]}; // @[Cat.scala 29:58]
  reg [9:0] _T_871; // @[el2_dec_tlu_ctl.scala 2303:76]
  reg [9:0] _T_872; // @[el2_dec_tlu_ctl.scala 2303:76]
  reg [9:0] _T_873; // @[el2_dec_tlu_ctl.scala 2303:76]
  reg [9:0] _T_874; // @[el2_dec_tlu_ctl.scala 2303:76]
  wire [31:0] _T_889 = {4'h2,io_mtdata1_t_0[9],6'h1f,io_mtdata1_t_0[8:7],6'h0,io_mtdata1_t_0[6:5],3'h0,io_mtdata1_t_0[4:3],3'h0,io_mtdata1_t_0[2:0]}; // @[Cat.scala 29:58]
  wire  _T_890 = mtsel == 2'h1; // @[el2_dec_tlu_ctl.scala 2306:60]
  wire [31:0] _T_904 = {4'h2,io_mtdata1_t_1[9],6'h1f,io_mtdata1_t_1[8:7],6'h0,io_mtdata1_t_1[6:5],3'h0,io_mtdata1_t_1[4:3],3'h0,io_mtdata1_t_1[2:0]}; // @[Cat.scala 29:58]
  wire  _T_905 = mtsel == 2'h2; // @[el2_dec_tlu_ctl.scala 2306:60]
  wire [31:0] _T_919 = {4'h2,io_mtdata1_t_2[9],6'h1f,io_mtdata1_t_2[8:7],6'h0,io_mtdata1_t_2[6:5],3'h0,io_mtdata1_t_2[4:3],3'h0,io_mtdata1_t_2[2:0]}; // @[Cat.scala 29:58]
  wire  _T_920 = mtsel == 2'h3; // @[el2_dec_tlu_ctl.scala 2306:60]
  wire [31:0] _T_934 = {4'h2,io_mtdata1_t_3[9],6'h1f,io_mtdata1_t_3[8:7],6'h0,io_mtdata1_t_3[6:5],3'h0,io_mtdata1_t_3[4:3],3'h0,io_mtdata1_t_3[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_935 = _T_802 ? _T_889 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_936 = _T_890 ? _T_904 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_937 = _T_905 ? _T_919 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_938 = _T_920 ? _T_934 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_939 = _T_935 | _T_936; // @[Mux.scala 27:72]
  wire [31:0] _T_940 = _T_939 | _T_937; // @[Mux.scala 27:72]
  wire [31:0] mtdata1_tsel_out = _T_940 | _T_938; // @[Mux.scala 27:72]
  wire  _T_967 = io_dec_csr_wraddr_r == 12'h7a2; // @[el2_dec_tlu_ctl.scala 2320:99]
  wire  _T_968 = io_dec_csr_wen_r_mod & _T_967; // @[el2_dec_tlu_ctl.scala 2320:70]
  wire  _T_970 = _T_968 & _T_802; // @[el2_dec_tlu_ctl.scala 2320:112]
  wire  _T_979 = _T_968 & _T_890; // @[el2_dec_tlu_ctl.scala 2320:112]
  wire  _T_988 = _T_968 & _T_905; // @[el2_dec_tlu_ctl.scala 2320:112]
  wire  _T_997 = _T_968 & _T_920; // @[el2_dec_tlu_ctl.scala 2320:112]
  reg [31:0] mtdata2_t_0; // @[el2_lib.scala 514:16]
  reg [31:0] mtdata2_t_1; // @[el2_lib.scala 514:16]
  reg [31:0] mtdata2_t_2; // @[el2_lib.scala 514:16]
  reg [31:0] mtdata2_t_3; // @[el2_lib.scala 514:16]
  wire [31:0] _T_1014 = _T_802 ? mtdata2_t_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1015 = _T_890 ? mtdata2_t_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1016 = _T_905 ? mtdata2_t_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1017 = _T_920 ? mtdata2_t_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1018 = _T_1014 | _T_1015; // @[Mux.scala 27:72]
  wire [31:0] _T_1019 = _T_1018 | _T_1016; // @[Mux.scala 27:72]
  wire [31:0] mtdata2_tsel_out = _T_1019 | _T_1017; // @[Mux.scala 27:72]
  wire [3:0] _T_1022 = io_tlu_i0_commit_cmt ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] pmu_i0_itype_qual = io_dec_tlu_packet_r_pmu_i0_itype & _T_1022; // @[el2_dec_tlu_ctl.scala 2345:60]
  wire  _T_1024 = ~mcountinhibit[3]; // @[el2_dec_tlu_ctl.scala 2351:25]
  reg [9:0] mhpme3; // @[Reg.scala 27:20]
  wire  _T_1025 = mhpme3 == 10'h1; // @[el2_dec_tlu_ctl.scala 2352:21]
  wire  _T_1027 = mhpme3 == 10'h2; // @[el2_dec_tlu_ctl.scala 2353:21]
  wire  _T_1029 = mhpme3 == 10'h3; // @[el2_dec_tlu_ctl.scala 2354:21]
  wire  _T_1031 = mhpme3 == 10'h4; // @[el2_dec_tlu_ctl.scala 2355:21]
  wire  _T_1033 = ~io_illegal_r; // @[el2_dec_tlu_ctl.scala 2355:83]
  wire  _T_1034 = io_tlu_i0_commit_cmt & _T_1033; // @[el2_dec_tlu_ctl.scala 2355:81]
  wire  _T_1035 = mhpme3 == 10'h5; // @[el2_dec_tlu_ctl.scala 2356:21]
  wire  _T_1037 = ~io_exu_pmu_i0_pc4; // @[el2_dec_tlu_ctl.scala 2356:83]
  wire  _T_1038 = io_tlu_i0_commit_cmt & _T_1037; // @[el2_dec_tlu_ctl.scala 2356:81]
  wire  _T_1040 = _T_1038 & _T_1033; // @[el2_dec_tlu_ctl.scala 2356:102]
  wire  _T_1041 = mhpme3 == 10'h6; // @[el2_dec_tlu_ctl.scala 2357:21]
  wire  _T_1043 = io_tlu_i0_commit_cmt & io_exu_pmu_i0_pc4; // @[el2_dec_tlu_ctl.scala 2357:81]
  wire  _T_1045 = _T_1043 & _T_1033; // @[el2_dec_tlu_ctl.scala 2357:102]
  wire  _T_1046 = mhpme3 == 10'h7; // @[el2_dec_tlu_ctl.scala 2358:21]
  wire  _T_1048 = mhpme3 == 10'h8; // @[el2_dec_tlu_ctl.scala 2359:21]
  wire  _T_1050 = mhpme3 == 10'h1e; // @[el2_dec_tlu_ctl.scala 2360:21]
  wire  _T_1052 = mhpme3 == 10'h9; // @[el2_dec_tlu_ctl.scala 2361:21]
  wire  _T_1054 = pmu_i0_itype_qual == 4'h1; // @[el2_dec_tlu_ctl.scala 2361:78]
  wire  _T_1055 = mhpme3 == 10'ha; // @[el2_dec_tlu_ctl.scala 2362:21]
  wire  _T_1057 = io_dec_tlu_packet_r_pmu_divide & io_tlu_i0_commit_cmt; // @[el2_dec_tlu_ctl.scala 2362:92]
  wire  _T_1058 = mhpme3 == 10'hb; // @[el2_dec_tlu_ctl.scala 2363:21]
  wire  _T_1060 = pmu_i0_itype_qual == 4'h2; // @[el2_dec_tlu_ctl.scala 2363:78]
  wire  _T_1061 = mhpme3 == 10'hc; // @[el2_dec_tlu_ctl.scala 2364:21]
  wire  _T_1063 = pmu_i0_itype_qual == 4'h3; // @[el2_dec_tlu_ctl.scala 2364:78]
  wire  _T_1064 = mhpme3 == 10'hd; // @[el2_dec_tlu_ctl.scala 2365:21]
  wire  _T_1067 = mhpme3 == 10'he; // @[el2_dec_tlu_ctl.scala 2366:21]
  wire  _T_1068 = io_dec_tlu_packet_r_pmu_lsu_misaligned >> _T_1067; // @[el2_dec_tlu_ctl.scala 2366:7]
  wire  _T_1070 = _T_1060 & _T_1068; // @[el2_dec_tlu_ctl.scala 2365:89]
  wire  _T_1072 = _T_1070 & _T_1063; // @[el2_dec_tlu_ctl.scala 2366:45]
  wire  _T_1074 = _T_1072 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec_tlu_ctl.scala 2366:77]
  wire  _T_1075 = mhpme3 == 10'hf; // @[el2_dec_tlu_ctl.scala 2368:21]
  wire  _T_1077 = pmu_i0_itype_qual == 4'h4; // @[el2_dec_tlu_ctl.scala 2368:76]
  wire  _T_1078 = mhpme3 == 10'h10; // @[el2_dec_tlu_ctl.scala 2369:21]
  wire  _T_1080 = pmu_i0_itype_qual == 4'h5; // @[el2_dec_tlu_ctl.scala 2369:76]
  wire  _T_1081 = mhpme3 == 10'h12; // @[el2_dec_tlu_ctl.scala 2370:21]
  wire  _T_1083 = pmu_i0_itype_qual == 4'h6; // @[el2_dec_tlu_ctl.scala 2370:76]
  wire  _T_1084 = mhpme3 == 10'h11; // @[el2_dec_tlu_ctl.scala 2371:21]
  wire  _T_1086 = pmu_i0_itype_qual == 4'h7; // @[el2_dec_tlu_ctl.scala 2371:76]
  wire  _T_1087 = mhpme3 == 10'h13; // @[el2_dec_tlu_ctl.scala 2372:21]
  wire  _T_1089 = pmu_i0_itype_qual == 4'h8; // @[el2_dec_tlu_ctl.scala 2372:76]
  wire  _T_1090 = mhpme3 == 10'h14; // @[el2_dec_tlu_ctl.scala 2373:21]
  wire  _T_1092 = pmu_i0_itype_qual == 4'h9; // @[el2_dec_tlu_ctl.scala 2373:76]
  wire  _T_1093 = mhpme3 == 10'h15; // @[el2_dec_tlu_ctl.scala 2374:21]
  wire  _T_1095 = pmu_i0_itype_qual == 4'ha; // @[el2_dec_tlu_ctl.scala 2374:76]
  wire  _T_1096 = mhpme3 == 10'h16; // @[el2_dec_tlu_ctl.scala 2375:21]
  wire  _T_1098 = pmu_i0_itype_qual == 4'hb; // @[el2_dec_tlu_ctl.scala 2375:76]
  wire  _T_1099 = mhpme3 == 10'h17; // @[el2_dec_tlu_ctl.scala 2376:21]
  wire  _T_1101 = pmu_i0_itype_qual == 4'hc; // @[el2_dec_tlu_ctl.scala 2376:76]
  wire  _T_1102 = mhpme3 == 10'h18; // @[el2_dec_tlu_ctl.scala 2377:21]
  wire  _T_1104 = pmu_i0_itype_qual == 4'hd; // @[el2_dec_tlu_ctl.scala 2377:76]
  wire  _T_1105 = pmu_i0_itype_qual == 4'he; // @[el2_dec_tlu_ctl.scala 2377:109]
  wire  _T_1106 = _T_1104 | _T_1105; // @[el2_dec_tlu_ctl.scala 2377:88]
  wire  _T_1107 = mhpme3 == 10'h19; // @[el2_dec_tlu_ctl.scala 2378:21]
  wire  _T_1109 = io_exu_pmu_i0_br_misp & io_tlu_i0_commit_cmt; // @[el2_dec_tlu_ctl.scala 2378:82]
  wire  _T_1110 = mhpme3 == 10'h1a; // @[el2_dec_tlu_ctl.scala 2379:21]
  wire  _T_1112 = io_exu_pmu_i0_br_ataken & io_tlu_i0_commit_cmt; // @[el2_dec_tlu_ctl.scala 2379:84]
  wire  _T_1113 = mhpme3 == 10'h1b; // @[el2_dec_tlu_ctl.scala 2380:21]
  wire  _T_1115 = io_dec_tlu_packet_r_pmu_i0_br_unpred & io_tlu_i0_commit_cmt; // @[el2_dec_tlu_ctl.scala 2380:97]
  wire  _T_1116 = mhpme3 == 10'h1c; // @[el2_dec_tlu_ctl.scala 2381:21]
  wire  _T_1120 = mhpme3 == 10'h1f; // @[el2_dec_tlu_ctl.scala 2383:21]
  wire  _T_1122 = mhpme3 == 10'h20; // @[el2_dec_tlu_ctl.scala 2384:21]
  wire  _T_1124 = mhpme3 == 10'h22; // @[el2_dec_tlu_ctl.scala 2385:21]
  wire  _T_1126 = mhpme3 == 10'h23; // @[el2_dec_tlu_ctl.scala 2386:21]
  wire  _T_1128 = mhpme3 == 10'h24; // @[el2_dec_tlu_ctl.scala 2387:21]
  wire  _T_1130 = mhpme3 == 10'h25; // @[el2_dec_tlu_ctl.scala 2388:21]
  wire  _T_1132 = io_i0_exception_valid_r | io_i0_trigger_hit_r; // @[el2_dec_tlu_ctl.scala 2388:85]
  wire  _T_1133 = _T_1132 | io_lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 2388:107]
  wire  _T_1134 = mhpme3 == 10'h26; // @[el2_dec_tlu_ctl.scala 2389:21]
  wire  _T_1136 = io_take_timer_int | io_take_int_timer0_int; // @[el2_dec_tlu_ctl.scala 2389:79]
  wire  _T_1137 = _T_1136 | io_take_int_timer1_int; // @[el2_dec_tlu_ctl.scala 2389:104]
  wire  _T_1138 = mhpme3 == 10'h27; // @[el2_dec_tlu_ctl.scala 2390:21]
  wire  _T_1140 = mhpme3 == 10'h28; // @[el2_dec_tlu_ctl.scala 2391:21]
  wire  _T_1142 = mhpme3 == 10'h29; // @[el2_dec_tlu_ctl.scala 2392:21]
  wire  _T_1144 = io_dec_tlu_br0_error_r | io_dec_tlu_br0_start_error_r; // @[el2_dec_tlu_ctl.scala 2392:84]
  wire  _T_1145 = _T_1144 & io_rfpc_i0_r; // @[el2_dec_tlu_ctl.scala 2392:116]
  wire  _T_1146 = mhpme3 == 10'h2a; // @[el2_dec_tlu_ctl.scala 2393:21]
  wire  _T_1148 = mhpme3 == 10'h2b; // @[el2_dec_tlu_ctl.scala 2394:21]
  wire  _T_1150 = mhpme3 == 10'h2c; // @[el2_dec_tlu_ctl.scala 2395:21]
  wire  _T_1152 = mhpme3 == 10'h2d; // @[el2_dec_tlu_ctl.scala 2396:21]
  wire  _T_1154 = mhpme3 == 10'h2e; // @[el2_dec_tlu_ctl.scala 2397:21]
  wire  _T_1156 = mhpme3 == 10'h2f; // @[el2_dec_tlu_ctl.scala 2398:21]
  wire  _T_1158 = mhpme3 == 10'h30; // @[el2_dec_tlu_ctl.scala 2399:21]
  wire  _T_1160 = mhpme3 == 10'h31; // @[el2_dec_tlu_ctl.scala 2400:21]
  wire  _T_1164 = ~io_mstatus[0]; // @[el2_dec_tlu_ctl.scala 2400:60]
  wire  _T_1165 = mhpme3 == 10'h32; // @[el2_dec_tlu_ctl.scala 2401:21]
  wire [5:0] _T_1172 = io_mip & mie; // @[el2_dec_tlu_ctl.scala 2401:100]
  wire [5:0] _GEN_17 = {{5'd0}, _T_1164}; // @[el2_dec_tlu_ctl.scala 2401:85]
  wire [5:0] _T_1173 = _GEN_17 & _T_1172; // @[el2_dec_tlu_ctl.scala 2401:85]
  wire  _T_1174 = mhpme3 == 10'h36; // @[el2_dec_tlu_ctl.scala 2402:21]
  wire  _T_1176 = pmu_i0_itype_qual == 4'hf; // @[el2_dec_tlu_ctl.scala 2402:78]
  wire  _T_1177 = mhpme3 == 10'h37; // @[el2_dec_tlu_ctl.scala 2403:21]
  wire  _T_1179 = io_tlu_i0_commit_cmt & io_lsu_pmu_load_external_r; // @[el2_dec_tlu_ctl.scala 2403:81]
  wire  _T_1180 = mhpme3 == 10'h38; // @[el2_dec_tlu_ctl.scala 2404:21]
  wire  _T_1182 = io_tlu_i0_commit_cmt & io_lsu_pmu_store_external_r; // @[el2_dec_tlu_ctl.scala 2404:81]
  wire  _T_1183 = mhpme3 == 10'h200; // @[el2_dec_tlu_ctl.scala 2406:21]
  wire  _T_1185 = mhpme3 == 10'h201; // @[el2_dec_tlu_ctl.scala 2407:21]
  wire  _T_1187 = mhpme3 == 10'h202; // @[el2_dec_tlu_ctl.scala 2408:21]
  wire  _T_1189 = mhpme3 == 10'h203; // @[el2_dec_tlu_ctl.scala 2409:21]
  wire  _T_1191 = mhpme3 == 10'h204; // @[el2_dec_tlu_ctl.scala 2410:21]
  wire  _T_1194 = _T_1027 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_1195 = _T_1029 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_1196 = _T_1031 & _T_1034; // @[Mux.scala 27:72]
  wire  _T_1197 = _T_1035 & _T_1040; // @[Mux.scala 27:72]
  wire  _T_1198 = _T_1041 & _T_1045; // @[Mux.scala 27:72]
  wire  _T_1199 = _T_1046 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_1200 = _T_1048 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1050 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1052 & _T_1054; // @[Mux.scala 27:72]
  wire  _T_1203 = _T_1055 & _T_1057; // @[Mux.scala 27:72]
  wire  _T_1204 = _T_1058 & _T_1060; // @[Mux.scala 27:72]
  wire  _T_1205 = _T_1061 & _T_1063; // @[Mux.scala 27:72]
  wire  _T_1206 = _T_1064 & _T_1074; // @[Mux.scala 27:72]
  wire  _T_1207 = _T_1075 & _T_1077; // @[Mux.scala 27:72]
  wire  _T_1208 = _T_1078 & _T_1080; // @[Mux.scala 27:72]
  wire  _T_1209 = _T_1081 & _T_1083; // @[Mux.scala 27:72]
  wire  _T_1210 = _T_1084 & _T_1086; // @[Mux.scala 27:72]
  wire  _T_1211 = _T_1087 & _T_1089; // @[Mux.scala 27:72]
  wire  _T_1212 = _T_1090 & _T_1092; // @[Mux.scala 27:72]
  wire  _T_1213 = _T_1093 & _T_1095; // @[Mux.scala 27:72]
  wire  _T_1214 = _T_1096 & _T_1098; // @[Mux.scala 27:72]
  wire  _T_1215 = _T_1099 & _T_1101; // @[Mux.scala 27:72]
  wire  _T_1216 = _T_1102 & _T_1106; // @[Mux.scala 27:72]
  wire  _T_1217 = _T_1107 & _T_1109; // @[Mux.scala 27:72]
  wire  _T_1218 = _T_1110 & _T_1112; // @[Mux.scala 27:72]
  wire  _T_1219 = _T_1113 & _T_1115; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1116 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1120 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1122 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_1224 = _T_1124 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_1225 = _T_1126 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1226 = _T_1128 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1227 = _T_1130 & _T_1133; // @[Mux.scala 27:72]
  wire  _T_1228 = _T_1134 & _T_1137; // @[Mux.scala 27:72]
  wire  _T_1229 = _T_1138 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_1230 = _T_1140 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_1231 = _T_1142 & _T_1145; // @[Mux.scala 27:72]
  wire  _T_1232 = _T_1146 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1233 = _T_1148 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1234 = _T_1150 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_1235 = _T_1152 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1236 = _T_1154 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1237 = _T_1156 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1238 = _T_1158 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1239 = _T_1160 & _T_1164; // @[Mux.scala 27:72]
  wire [5:0] _T_1240 = _T_1165 ? _T_1173 : 6'h0; // @[Mux.scala 27:72]
  wire  _T_1241 = _T_1174 & _T_1176; // @[Mux.scala 27:72]
  wire  _T_1242 = _T_1177 & _T_1179; // @[Mux.scala 27:72]
  wire  _T_1243 = _T_1180 & _T_1182; // @[Mux.scala 27:72]
  wire  _T_1244 = _T_1183 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_1245 = _T_1185 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_1246 = _T_1187 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_1247 = _T_1189 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_1248 = _T_1191 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_1249 = _T_1025 | _T_1194; // @[Mux.scala 27:72]
  wire  _T_1250 = _T_1249 | _T_1195; // @[Mux.scala 27:72]
  wire  _T_1251 = _T_1250 | _T_1196; // @[Mux.scala 27:72]
  wire  _T_1252 = _T_1251 | _T_1197; // @[Mux.scala 27:72]
  wire  _T_1253 = _T_1252 | _T_1198; // @[Mux.scala 27:72]
  wire  _T_1254 = _T_1253 | _T_1199; // @[Mux.scala 27:72]
  wire  _T_1255 = _T_1254 | _T_1200; // @[Mux.scala 27:72]
  wire  _T_1256 = _T_1255 | _T_1201; // @[Mux.scala 27:72]
  wire  _T_1257 = _T_1256 | _T_1202; // @[Mux.scala 27:72]
  wire  _T_1258 = _T_1257 | _T_1203; // @[Mux.scala 27:72]
  wire  _T_1259 = _T_1258 | _T_1204; // @[Mux.scala 27:72]
  wire  _T_1260 = _T_1259 | _T_1205; // @[Mux.scala 27:72]
  wire  _T_1261 = _T_1260 | _T_1206; // @[Mux.scala 27:72]
  wire  _T_1262 = _T_1261 | _T_1207; // @[Mux.scala 27:72]
  wire  _T_1263 = _T_1262 | _T_1208; // @[Mux.scala 27:72]
  wire  _T_1264 = _T_1263 | _T_1209; // @[Mux.scala 27:72]
  wire  _T_1265 = _T_1264 | _T_1210; // @[Mux.scala 27:72]
  wire  _T_1266 = _T_1265 | _T_1211; // @[Mux.scala 27:72]
  wire  _T_1267 = _T_1266 | _T_1212; // @[Mux.scala 27:72]
  wire  _T_1268 = _T_1267 | _T_1213; // @[Mux.scala 27:72]
  wire  _T_1269 = _T_1268 | _T_1214; // @[Mux.scala 27:72]
  wire  _T_1270 = _T_1269 | _T_1215; // @[Mux.scala 27:72]
  wire  _T_1271 = _T_1270 | _T_1216; // @[Mux.scala 27:72]
  wire  _T_1272 = _T_1271 | _T_1217; // @[Mux.scala 27:72]
  wire  _T_1273 = _T_1272 | _T_1218; // @[Mux.scala 27:72]
  wire  _T_1274 = _T_1273 | _T_1219; // @[Mux.scala 27:72]
  wire  _T_1275 = _T_1274 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1276 = _T_1275 | _T_1201; // @[Mux.scala 27:72]
  wire  _T_1277 = _T_1276 | _T_1222; // @[Mux.scala 27:72]
  wire  _T_1278 = _T_1277 | _T_1223; // @[Mux.scala 27:72]
  wire  _T_1279 = _T_1278 | _T_1224; // @[Mux.scala 27:72]
  wire  _T_1280 = _T_1279 | _T_1225; // @[Mux.scala 27:72]
  wire  _T_1281 = _T_1280 | _T_1226; // @[Mux.scala 27:72]
  wire  _T_1282 = _T_1281 | _T_1227; // @[Mux.scala 27:72]
  wire  _T_1283 = _T_1282 | _T_1228; // @[Mux.scala 27:72]
  wire  _T_1284 = _T_1283 | _T_1229; // @[Mux.scala 27:72]
  wire  _T_1285 = _T_1284 | _T_1230; // @[Mux.scala 27:72]
  wire  _T_1286 = _T_1285 | _T_1231; // @[Mux.scala 27:72]
  wire  _T_1287 = _T_1286 | _T_1232; // @[Mux.scala 27:72]
  wire  _T_1288 = _T_1287 | _T_1233; // @[Mux.scala 27:72]
  wire  _T_1289 = _T_1288 | _T_1234; // @[Mux.scala 27:72]
  wire  _T_1290 = _T_1289 | _T_1235; // @[Mux.scala 27:72]
  wire  _T_1291 = _T_1290 | _T_1236; // @[Mux.scala 27:72]
  wire  _T_1292 = _T_1291 | _T_1237; // @[Mux.scala 27:72]
  wire  _T_1293 = _T_1292 | _T_1238; // @[Mux.scala 27:72]
  wire  _T_1294 = _T_1293 | _T_1239; // @[Mux.scala 27:72]
  wire [5:0] _GEN_18 = {{5'd0}, _T_1294}; // @[Mux.scala 27:72]
  wire [5:0] _T_1295 = _GEN_18 | _T_1240; // @[Mux.scala 27:72]
  wire [5:0] _GEN_19 = {{5'd0}, _T_1241}; // @[Mux.scala 27:72]
  wire [5:0] _T_1296 = _T_1295 | _GEN_19; // @[Mux.scala 27:72]
  wire [5:0] _GEN_20 = {{5'd0}, _T_1242}; // @[Mux.scala 27:72]
  wire [5:0] _T_1297 = _T_1296 | _GEN_20; // @[Mux.scala 27:72]
  wire [5:0] _GEN_21 = {{5'd0}, _T_1243}; // @[Mux.scala 27:72]
  wire [5:0] _T_1298 = _T_1297 | _GEN_21; // @[Mux.scala 27:72]
  wire [5:0] _GEN_22 = {{5'd0}, _T_1244}; // @[Mux.scala 27:72]
  wire [5:0] _T_1299 = _T_1298 | _GEN_22; // @[Mux.scala 27:72]
  wire [5:0] _GEN_23 = {{5'd0}, _T_1245}; // @[Mux.scala 27:72]
  wire [5:0] _T_1300 = _T_1299 | _GEN_23; // @[Mux.scala 27:72]
  wire [5:0] _GEN_24 = {{5'd0}, _T_1246}; // @[Mux.scala 27:72]
  wire [5:0] _T_1301 = _T_1300 | _GEN_24; // @[Mux.scala 27:72]
  wire [5:0] _GEN_25 = {{5'd0}, _T_1247}; // @[Mux.scala 27:72]
  wire [5:0] _T_1302 = _T_1301 | _GEN_25; // @[Mux.scala 27:72]
  wire [5:0] _GEN_26 = {{5'd0}, _T_1248}; // @[Mux.scala 27:72]
  wire [5:0] _T_1303 = _T_1302 | _GEN_26; // @[Mux.scala 27:72]
  wire [5:0] _GEN_27 = {{5'd0}, _T_1024}; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire [5:0] _T_1305 = _GEN_27 & _T_1303; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire  _T_1307 = ~mcountinhibit[4]; // @[el2_dec_tlu_ctl.scala 2351:25]
  reg [9:0] mhpme4; // @[Reg.scala 27:20]
  wire  _T_1308 = mhpme4 == 10'h1; // @[el2_dec_tlu_ctl.scala 2352:21]
  wire  _T_1310 = mhpme4 == 10'h2; // @[el2_dec_tlu_ctl.scala 2353:21]
  wire  _T_1312 = mhpme4 == 10'h3; // @[el2_dec_tlu_ctl.scala 2354:21]
  wire  _T_1314 = mhpme4 == 10'h4; // @[el2_dec_tlu_ctl.scala 2355:21]
  wire  _T_1318 = mhpme4 == 10'h5; // @[el2_dec_tlu_ctl.scala 2356:21]
  wire  _T_1324 = mhpme4 == 10'h6; // @[el2_dec_tlu_ctl.scala 2357:21]
  wire  _T_1329 = mhpme4 == 10'h7; // @[el2_dec_tlu_ctl.scala 2358:21]
  wire  _T_1331 = mhpme4 == 10'h8; // @[el2_dec_tlu_ctl.scala 2359:21]
  wire  _T_1333 = mhpme4 == 10'h1e; // @[el2_dec_tlu_ctl.scala 2360:21]
  wire  _T_1335 = mhpme4 == 10'h9; // @[el2_dec_tlu_ctl.scala 2361:21]
  wire  _T_1338 = mhpme4 == 10'ha; // @[el2_dec_tlu_ctl.scala 2362:21]
  wire  _T_1341 = mhpme4 == 10'hb; // @[el2_dec_tlu_ctl.scala 2363:21]
  wire  _T_1344 = mhpme4 == 10'hc; // @[el2_dec_tlu_ctl.scala 2364:21]
  wire  _T_1347 = mhpme4 == 10'hd; // @[el2_dec_tlu_ctl.scala 2365:21]
  wire  _T_1350 = mhpme4 == 10'he; // @[el2_dec_tlu_ctl.scala 2366:21]
  wire  _T_1351 = io_dec_tlu_packet_r_pmu_lsu_misaligned >> _T_1350; // @[el2_dec_tlu_ctl.scala 2366:7]
  wire  _T_1353 = _T_1060 & _T_1351; // @[el2_dec_tlu_ctl.scala 2365:89]
  wire  _T_1355 = _T_1353 & _T_1063; // @[el2_dec_tlu_ctl.scala 2366:45]
  wire  _T_1357 = _T_1355 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec_tlu_ctl.scala 2366:77]
  wire  _T_1358 = mhpme4 == 10'hf; // @[el2_dec_tlu_ctl.scala 2368:21]
  wire  _T_1361 = mhpme4 == 10'h10; // @[el2_dec_tlu_ctl.scala 2369:21]
  wire  _T_1364 = mhpme4 == 10'h12; // @[el2_dec_tlu_ctl.scala 2370:21]
  wire  _T_1367 = mhpme4 == 10'h11; // @[el2_dec_tlu_ctl.scala 2371:21]
  wire  _T_1370 = mhpme4 == 10'h13; // @[el2_dec_tlu_ctl.scala 2372:21]
  wire  _T_1373 = mhpme4 == 10'h14; // @[el2_dec_tlu_ctl.scala 2373:21]
  wire  _T_1376 = mhpme4 == 10'h15; // @[el2_dec_tlu_ctl.scala 2374:21]
  wire  _T_1379 = mhpme4 == 10'h16; // @[el2_dec_tlu_ctl.scala 2375:21]
  wire  _T_1382 = mhpme4 == 10'h17; // @[el2_dec_tlu_ctl.scala 2376:21]
  wire  _T_1385 = mhpme4 == 10'h18; // @[el2_dec_tlu_ctl.scala 2377:21]
  wire  _T_1390 = mhpme4 == 10'h19; // @[el2_dec_tlu_ctl.scala 2378:21]
  wire  _T_1393 = mhpme4 == 10'h1a; // @[el2_dec_tlu_ctl.scala 2379:21]
  wire  _T_1396 = mhpme4 == 10'h1b; // @[el2_dec_tlu_ctl.scala 2380:21]
  wire  _T_1399 = mhpme4 == 10'h1c; // @[el2_dec_tlu_ctl.scala 2381:21]
  wire  _T_1403 = mhpme4 == 10'h1f; // @[el2_dec_tlu_ctl.scala 2383:21]
  wire  _T_1405 = mhpme4 == 10'h20; // @[el2_dec_tlu_ctl.scala 2384:21]
  wire  _T_1407 = mhpme4 == 10'h22; // @[el2_dec_tlu_ctl.scala 2385:21]
  wire  _T_1409 = mhpme4 == 10'h23; // @[el2_dec_tlu_ctl.scala 2386:21]
  wire  _T_1411 = mhpme4 == 10'h24; // @[el2_dec_tlu_ctl.scala 2387:21]
  wire  _T_1413 = mhpme4 == 10'h25; // @[el2_dec_tlu_ctl.scala 2388:21]
  wire  _T_1417 = mhpme4 == 10'h26; // @[el2_dec_tlu_ctl.scala 2389:21]
  wire  _T_1421 = mhpme4 == 10'h27; // @[el2_dec_tlu_ctl.scala 2390:21]
  wire  _T_1423 = mhpme4 == 10'h28; // @[el2_dec_tlu_ctl.scala 2391:21]
  wire  _T_1425 = mhpme4 == 10'h29; // @[el2_dec_tlu_ctl.scala 2392:21]
  wire  _T_1429 = mhpme4 == 10'h2a; // @[el2_dec_tlu_ctl.scala 2393:21]
  wire  _T_1431 = mhpme4 == 10'h2b; // @[el2_dec_tlu_ctl.scala 2394:21]
  wire  _T_1433 = mhpme4 == 10'h2c; // @[el2_dec_tlu_ctl.scala 2395:21]
  wire  _T_1435 = mhpme4 == 10'h2d; // @[el2_dec_tlu_ctl.scala 2396:21]
  wire  _T_1437 = mhpme4 == 10'h2e; // @[el2_dec_tlu_ctl.scala 2397:21]
  wire  _T_1439 = mhpme4 == 10'h2f; // @[el2_dec_tlu_ctl.scala 2398:21]
  wire  _T_1441 = mhpme4 == 10'h30; // @[el2_dec_tlu_ctl.scala 2399:21]
  wire  _T_1443 = mhpme4 == 10'h31; // @[el2_dec_tlu_ctl.scala 2400:21]
  wire  _T_1448 = mhpme4 == 10'h32; // @[el2_dec_tlu_ctl.scala 2401:21]
  wire  _T_1457 = mhpme4 == 10'h36; // @[el2_dec_tlu_ctl.scala 2402:21]
  wire  _T_1460 = mhpme4 == 10'h37; // @[el2_dec_tlu_ctl.scala 2403:21]
  wire  _T_1463 = mhpme4 == 10'h38; // @[el2_dec_tlu_ctl.scala 2404:21]
  wire  _T_1466 = mhpme4 == 10'h200; // @[el2_dec_tlu_ctl.scala 2406:21]
  wire  _T_1468 = mhpme4 == 10'h201; // @[el2_dec_tlu_ctl.scala 2407:21]
  wire  _T_1470 = mhpme4 == 10'h202; // @[el2_dec_tlu_ctl.scala 2408:21]
  wire  _T_1472 = mhpme4 == 10'h203; // @[el2_dec_tlu_ctl.scala 2409:21]
  wire  _T_1474 = mhpme4 == 10'h204; // @[el2_dec_tlu_ctl.scala 2410:21]
  wire  _T_1477 = _T_1310 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_1478 = _T_1312 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_1479 = _T_1314 & _T_1034; // @[Mux.scala 27:72]
  wire  _T_1480 = _T_1318 & _T_1040; // @[Mux.scala 27:72]
  wire  _T_1481 = _T_1324 & _T_1045; // @[Mux.scala 27:72]
  wire  _T_1482 = _T_1329 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_1483 = _T_1331 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_1484 = _T_1333 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_1485 = _T_1335 & _T_1054; // @[Mux.scala 27:72]
  wire  _T_1486 = _T_1338 & _T_1057; // @[Mux.scala 27:72]
  wire  _T_1487 = _T_1341 & _T_1060; // @[Mux.scala 27:72]
  wire  _T_1488 = _T_1344 & _T_1063; // @[Mux.scala 27:72]
  wire  _T_1489 = _T_1347 & _T_1357; // @[Mux.scala 27:72]
  wire  _T_1490 = _T_1358 & _T_1077; // @[Mux.scala 27:72]
  wire  _T_1491 = _T_1361 & _T_1080; // @[Mux.scala 27:72]
  wire  _T_1492 = _T_1364 & _T_1083; // @[Mux.scala 27:72]
  wire  _T_1493 = _T_1367 & _T_1086; // @[Mux.scala 27:72]
  wire  _T_1494 = _T_1370 & _T_1089; // @[Mux.scala 27:72]
  wire  _T_1495 = _T_1373 & _T_1092; // @[Mux.scala 27:72]
  wire  _T_1496 = _T_1376 & _T_1095; // @[Mux.scala 27:72]
  wire  _T_1497 = _T_1379 & _T_1098; // @[Mux.scala 27:72]
  wire  _T_1498 = _T_1382 & _T_1101; // @[Mux.scala 27:72]
  wire  _T_1499 = _T_1385 & _T_1106; // @[Mux.scala 27:72]
  wire  _T_1500 = _T_1390 & _T_1109; // @[Mux.scala 27:72]
  wire  _T_1501 = _T_1393 & _T_1112; // @[Mux.scala 27:72]
  wire  _T_1502 = _T_1396 & _T_1115; // @[Mux.scala 27:72]
  wire  _T_1503 = _T_1399 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_1505 = _T_1403 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_1506 = _T_1405 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_1507 = _T_1407 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_1508 = _T_1409 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1509 = _T_1411 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1510 = _T_1413 & _T_1133; // @[Mux.scala 27:72]
  wire  _T_1511 = _T_1417 & _T_1137; // @[Mux.scala 27:72]
  wire  _T_1512 = _T_1421 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_1513 = _T_1423 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_1514 = _T_1425 & _T_1145; // @[Mux.scala 27:72]
  wire  _T_1515 = _T_1429 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1516 = _T_1431 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1517 = _T_1433 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_1518 = _T_1435 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1519 = _T_1437 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1520 = _T_1439 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1521 = _T_1441 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1522 = _T_1443 & _T_1164; // @[Mux.scala 27:72]
  wire [5:0] _T_1523 = _T_1448 ? _T_1173 : 6'h0; // @[Mux.scala 27:72]
  wire  _T_1524 = _T_1457 & _T_1176; // @[Mux.scala 27:72]
  wire  _T_1525 = _T_1460 & _T_1179; // @[Mux.scala 27:72]
  wire  _T_1526 = _T_1463 & _T_1182; // @[Mux.scala 27:72]
  wire  _T_1527 = _T_1466 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_1528 = _T_1468 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_1529 = _T_1470 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_1530 = _T_1472 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_1531 = _T_1474 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_1532 = _T_1308 | _T_1477; // @[Mux.scala 27:72]
  wire  _T_1533 = _T_1532 | _T_1478; // @[Mux.scala 27:72]
  wire  _T_1534 = _T_1533 | _T_1479; // @[Mux.scala 27:72]
  wire  _T_1535 = _T_1534 | _T_1480; // @[Mux.scala 27:72]
  wire  _T_1536 = _T_1535 | _T_1481; // @[Mux.scala 27:72]
  wire  _T_1537 = _T_1536 | _T_1482; // @[Mux.scala 27:72]
  wire  _T_1538 = _T_1537 | _T_1483; // @[Mux.scala 27:72]
  wire  _T_1539 = _T_1538 | _T_1484; // @[Mux.scala 27:72]
  wire  _T_1540 = _T_1539 | _T_1485; // @[Mux.scala 27:72]
  wire  _T_1541 = _T_1540 | _T_1486; // @[Mux.scala 27:72]
  wire  _T_1542 = _T_1541 | _T_1487; // @[Mux.scala 27:72]
  wire  _T_1543 = _T_1542 | _T_1488; // @[Mux.scala 27:72]
  wire  _T_1544 = _T_1543 | _T_1489; // @[Mux.scala 27:72]
  wire  _T_1545 = _T_1544 | _T_1490; // @[Mux.scala 27:72]
  wire  _T_1546 = _T_1545 | _T_1491; // @[Mux.scala 27:72]
  wire  _T_1547 = _T_1546 | _T_1492; // @[Mux.scala 27:72]
  wire  _T_1548 = _T_1547 | _T_1493; // @[Mux.scala 27:72]
  wire  _T_1549 = _T_1548 | _T_1494; // @[Mux.scala 27:72]
  wire  _T_1550 = _T_1549 | _T_1495; // @[Mux.scala 27:72]
  wire  _T_1551 = _T_1550 | _T_1496; // @[Mux.scala 27:72]
  wire  _T_1552 = _T_1551 | _T_1497; // @[Mux.scala 27:72]
  wire  _T_1553 = _T_1552 | _T_1498; // @[Mux.scala 27:72]
  wire  _T_1554 = _T_1553 | _T_1499; // @[Mux.scala 27:72]
  wire  _T_1555 = _T_1554 | _T_1500; // @[Mux.scala 27:72]
  wire  _T_1556 = _T_1555 | _T_1501; // @[Mux.scala 27:72]
  wire  _T_1557 = _T_1556 | _T_1502; // @[Mux.scala 27:72]
  wire  _T_1558 = _T_1557 | _T_1503; // @[Mux.scala 27:72]
  wire  _T_1559 = _T_1558 | _T_1484; // @[Mux.scala 27:72]
  wire  _T_1560 = _T_1559 | _T_1505; // @[Mux.scala 27:72]
  wire  _T_1561 = _T_1560 | _T_1506; // @[Mux.scala 27:72]
  wire  _T_1562 = _T_1561 | _T_1507; // @[Mux.scala 27:72]
  wire  _T_1563 = _T_1562 | _T_1508; // @[Mux.scala 27:72]
  wire  _T_1564 = _T_1563 | _T_1509; // @[Mux.scala 27:72]
  wire  _T_1565 = _T_1564 | _T_1510; // @[Mux.scala 27:72]
  wire  _T_1566 = _T_1565 | _T_1511; // @[Mux.scala 27:72]
  wire  _T_1567 = _T_1566 | _T_1512; // @[Mux.scala 27:72]
  wire  _T_1568 = _T_1567 | _T_1513; // @[Mux.scala 27:72]
  wire  _T_1569 = _T_1568 | _T_1514; // @[Mux.scala 27:72]
  wire  _T_1570 = _T_1569 | _T_1515; // @[Mux.scala 27:72]
  wire  _T_1571 = _T_1570 | _T_1516; // @[Mux.scala 27:72]
  wire  _T_1572 = _T_1571 | _T_1517; // @[Mux.scala 27:72]
  wire  _T_1573 = _T_1572 | _T_1518; // @[Mux.scala 27:72]
  wire  _T_1574 = _T_1573 | _T_1519; // @[Mux.scala 27:72]
  wire  _T_1575 = _T_1574 | _T_1520; // @[Mux.scala 27:72]
  wire  _T_1576 = _T_1575 | _T_1521; // @[Mux.scala 27:72]
  wire  _T_1577 = _T_1576 | _T_1522; // @[Mux.scala 27:72]
  wire [5:0] _GEN_29 = {{5'd0}, _T_1577}; // @[Mux.scala 27:72]
  wire [5:0] _T_1578 = _GEN_29 | _T_1523; // @[Mux.scala 27:72]
  wire [5:0] _GEN_30 = {{5'd0}, _T_1524}; // @[Mux.scala 27:72]
  wire [5:0] _T_1579 = _T_1578 | _GEN_30; // @[Mux.scala 27:72]
  wire [5:0] _GEN_31 = {{5'd0}, _T_1525}; // @[Mux.scala 27:72]
  wire [5:0] _T_1580 = _T_1579 | _GEN_31; // @[Mux.scala 27:72]
  wire [5:0] _GEN_32 = {{5'd0}, _T_1526}; // @[Mux.scala 27:72]
  wire [5:0] _T_1581 = _T_1580 | _GEN_32; // @[Mux.scala 27:72]
  wire [5:0] _GEN_33 = {{5'd0}, _T_1527}; // @[Mux.scala 27:72]
  wire [5:0] _T_1582 = _T_1581 | _GEN_33; // @[Mux.scala 27:72]
  wire [5:0] _GEN_34 = {{5'd0}, _T_1528}; // @[Mux.scala 27:72]
  wire [5:0] _T_1583 = _T_1582 | _GEN_34; // @[Mux.scala 27:72]
  wire [5:0] _GEN_35 = {{5'd0}, _T_1529}; // @[Mux.scala 27:72]
  wire [5:0] _T_1584 = _T_1583 | _GEN_35; // @[Mux.scala 27:72]
  wire [5:0] _GEN_36 = {{5'd0}, _T_1530}; // @[Mux.scala 27:72]
  wire [5:0] _T_1585 = _T_1584 | _GEN_36; // @[Mux.scala 27:72]
  wire [5:0] _GEN_37 = {{5'd0}, _T_1531}; // @[Mux.scala 27:72]
  wire [5:0] _T_1586 = _T_1585 | _GEN_37; // @[Mux.scala 27:72]
  wire [5:0] _GEN_38 = {{5'd0}, _T_1307}; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire [5:0] _T_1588 = _GEN_38 & _T_1586; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire  _T_1590 = ~mcountinhibit[5]; // @[el2_dec_tlu_ctl.scala 2351:25]
  reg [9:0] mhpme5; // @[Reg.scala 27:20]
  wire  _T_1591 = mhpme5 == 10'h1; // @[el2_dec_tlu_ctl.scala 2352:21]
  wire  _T_1593 = mhpme5 == 10'h2; // @[el2_dec_tlu_ctl.scala 2353:21]
  wire  _T_1595 = mhpme5 == 10'h3; // @[el2_dec_tlu_ctl.scala 2354:21]
  wire  _T_1597 = mhpme5 == 10'h4; // @[el2_dec_tlu_ctl.scala 2355:21]
  wire  _T_1601 = mhpme5 == 10'h5; // @[el2_dec_tlu_ctl.scala 2356:21]
  wire  _T_1607 = mhpme5 == 10'h6; // @[el2_dec_tlu_ctl.scala 2357:21]
  wire  _T_1612 = mhpme5 == 10'h7; // @[el2_dec_tlu_ctl.scala 2358:21]
  wire  _T_1614 = mhpme5 == 10'h8; // @[el2_dec_tlu_ctl.scala 2359:21]
  wire  _T_1616 = mhpme5 == 10'h1e; // @[el2_dec_tlu_ctl.scala 2360:21]
  wire  _T_1618 = mhpme5 == 10'h9; // @[el2_dec_tlu_ctl.scala 2361:21]
  wire  _T_1621 = mhpme5 == 10'ha; // @[el2_dec_tlu_ctl.scala 2362:21]
  wire  _T_1624 = mhpme5 == 10'hb; // @[el2_dec_tlu_ctl.scala 2363:21]
  wire  _T_1627 = mhpme5 == 10'hc; // @[el2_dec_tlu_ctl.scala 2364:21]
  wire  _T_1630 = mhpme5 == 10'hd; // @[el2_dec_tlu_ctl.scala 2365:21]
  wire  _T_1633 = mhpme5 == 10'he; // @[el2_dec_tlu_ctl.scala 2366:21]
  wire  _T_1634 = io_dec_tlu_packet_r_pmu_lsu_misaligned >> _T_1633; // @[el2_dec_tlu_ctl.scala 2366:7]
  wire  _T_1636 = _T_1060 & _T_1634; // @[el2_dec_tlu_ctl.scala 2365:89]
  wire  _T_1638 = _T_1636 & _T_1063; // @[el2_dec_tlu_ctl.scala 2366:45]
  wire  _T_1640 = _T_1638 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec_tlu_ctl.scala 2366:77]
  wire  _T_1641 = mhpme5 == 10'hf; // @[el2_dec_tlu_ctl.scala 2368:21]
  wire  _T_1644 = mhpme5 == 10'h10; // @[el2_dec_tlu_ctl.scala 2369:21]
  wire  _T_1647 = mhpme5 == 10'h12; // @[el2_dec_tlu_ctl.scala 2370:21]
  wire  _T_1650 = mhpme5 == 10'h11; // @[el2_dec_tlu_ctl.scala 2371:21]
  wire  _T_1653 = mhpme5 == 10'h13; // @[el2_dec_tlu_ctl.scala 2372:21]
  wire  _T_1656 = mhpme5 == 10'h14; // @[el2_dec_tlu_ctl.scala 2373:21]
  wire  _T_1659 = mhpme5 == 10'h15; // @[el2_dec_tlu_ctl.scala 2374:21]
  wire  _T_1662 = mhpme5 == 10'h16; // @[el2_dec_tlu_ctl.scala 2375:21]
  wire  _T_1665 = mhpme5 == 10'h17; // @[el2_dec_tlu_ctl.scala 2376:21]
  wire  _T_1668 = mhpme5 == 10'h18; // @[el2_dec_tlu_ctl.scala 2377:21]
  wire  _T_1673 = mhpme5 == 10'h19; // @[el2_dec_tlu_ctl.scala 2378:21]
  wire  _T_1676 = mhpme5 == 10'h1a; // @[el2_dec_tlu_ctl.scala 2379:21]
  wire  _T_1679 = mhpme5 == 10'h1b; // @[el2_dec_tlu_ctl.scala 2380:21]
  wire  _T_1682 = mhpme5 == 10'h1c; // @[el2_dec_tlu_ctl.scala 2381:21]
  wire  _T_1686 = mhpme5 == 10'h1f; // @[el2_dec_tlu_ctl.scala 2383:21]
  wire  _T_1688 = mhpme5 == 10'h20; // @[el2_dec_tlu_ctl.scala 2384:21]
  wire  _T_1690 = mhpme5 == 10'h22; // @[el2_dec_tlu_ctl.scala 2385:21]
  wire  _T_1692 = mhpme5 == 10'h23; // @[el2_dec_tlu_ctl.scala 2386:21]
  wire  _T_1694 = mhpme5 == 10'h24; // @[el2_dec_tlu_ctl.scala 2387:21]
  wire  _T_1696 = mhpme5 == 10'h25; // @[el2_dec_tlu_ctl.scala 2388:21]
  wire  _T_1700 = mhpme5 == 10'h26; // @[el2_dec_tlu_ctl.scala 2389:21]
  wire  _T_1704 = mhpme5 == 10'h27; // @[el2_dec_tlu_ctl.scala 2390:21]
  wire  _T_1706 = mhpme5 == 10'h28; // @[el2_dec_tlu_ctl.scala 2391:21]
  wire  _T_1708 = mhpme5 == 10'h29; // @[el2_dec_tlu_ctl.scala 2392:21]
  wire  _T_1712 = mhpme5 == 10'h2a; // @[el2_dec_tlu_ctl.scala 2393:21]
  wire  _T_1714 = mhpme5 == 10'h2b; // @[el2_dec_tlu_ctl.scala 2394:21]
  wire  _T_1716 = mhpme5 == 10'h2c; // @[el2_dec_tlu_ctl.scala 2395:21]
  wire  _T_1718 = mhpme5 == 10'h2d; // @[el2_dec_tlu_ctl.scala 2396:21]
  wire  _T_1720 = mhpme5 == 10'h2e; // @[el2_dec_tlu_ctl.scala 2397:21]
  wire  _T_1722 = mhpme5 == 10'h2f; // @[el2_dec_tlu_ctl.scala 2398:21]
  wire  _T_1724 = mhpme5 == 10'h30; // @[el2_dec_tlu_ctl.scala 2399:21]
  wire  _T_1726 = mhpme5 == 10'h31; // @[el2_dec_tlu_ctl.scala 2400:21]
  wire  _T_1731 = mhpme5 == 10'h32; // @[el2_dec_tlu_ctl.scala 2401:21]
  wire  _T_1740 = mhpme5 == 10'h36; // @[el2_dec_tlu_ctl.scala 2402:21]
  wire  _T_1743 = mhpme5 == 10'h37; // @[el2_dec_tlu_ctl.scala 2403:21]
  wire  _T_1746 = mhpme5 == 10'h38; // @[el2_dec_tlu_ctl.scala 2404:21]
  wire  _T_1749 = mhpme5 == 10'h200; // @[el2_dec_tlu_ctl.scala 2406:21]
  wire  _T_1751 = mhpme5 == 10'h201; // @[el2_dec_tlu_ctl.scala 2407:21]
  wire  _T_1753 = mhpme5 == 10'h202; // @[el2_dec_tlu_ctl.scala 2408:21]
  wire  _T_1755 = mhpme5 == 10'h203; // @[el2_dec_tlu_ctl.scala 2409:21]
  wire  _T_1757 = mhpme5 == 10'h204; // @[el2_dec_tlu_ctl.scala 2410:21]
  wire  _T_1760 = _T_1593 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_1761 = _T_1595 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_1762 = _T_1597 & _T_1034; // @[Mux.scala 27:72]
  wire  _T_1763 = _T_1601 & _T_1040; // @[Mux.scala 27:72]
  wire  _T_1764 = _T_1607 & _T_1045; // @[Mux.scala 27:72]
  wire  _T_1765 = _T_1612 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_1766 = _T_1614 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_1767 = _T_1616 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_1768 = _T_1618 & _T_1054; // @[Mux.scala 27:72]
  wire  _T_1769 = _T_1621 & _T_1057; // @[Mux.scala 27:72]
  wire  _T_1770 = _T_1624 & _T_1060; // @[Mux.scala 27:72]
  wire  _T_1771 = _T_1627 & _T_1063; // @[Mux.scala 27:72]
  wire  _T_1772 = _T_1630 & _T_1640; // @[Mux.scala 27:72]
  wire  _T_1773 = _T_1641 & _T_1077; // @[Mux.scala 27:72]
  wire  _T_1774 = _T_1644 & _T_1080; // @[Mux.scala 27:72]
  wire  _T_1775 = _T_1647 & _T_1083; // @[Mux.scala 27:72]
  wire  _T_1776 = _T_1650 & _T_1086; // @[Mux.scala 27:72]
  wire  _T_1777 = _T_1653 & _T_1089; // @[Mux.scala 27:72]
  wire  _T_1778 = _T_1656 & _T_1092; // @[Mux.scala 27:72]
  wire  _T_1779 = _T_1659 & _T_1095; // @[Mux.scala 27:72]
  wire  _T_1780 = _T_1662 & _T_1098; // @[Mux.scala 27:72]
  wire  _T_1781 = _T_1665 & _T_1101; // @[Mux.scala 27:72]
  wire  _T_1782 = _T_1668 & _T_1106; // @[Mux.scala 27:72]
  wire  _T_1783 = _T_1673 & _T_1109; // @[Mux.scala 27:72]
  wire  _T_1784 = _T_1676 & _T_1112; // @[Mux.scala 27:72]
  wire  _T_1785 = _T_1679 & _T_1115; // @[Mux.scala 27:72]
  wire  _T_1786 = _T_1682 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_1788 = _T_1686 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_1789 = _T_1688 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_1790 = _T_1690 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_1791 = _T_1692 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1792 = _T_1694 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1793 = _T_1696 & _T_1133; // @[Mux.scala 27:72]
  wire  _T_1794 = _T_1700 & _T_1137; // @[Mux.scala 27:72]
  wire  _T_1795 = _T_1704 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_1796 = _T_1706 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_1797 = _T_1708 & _T_1145; // @[Mux.scala 27:72]
  wire  _T_1798 = _T_1712 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1799 = _T_1714 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1800 = _T_1716 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_1801 = _T_1718 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1802 = _T_1720 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1803 = _T_1722 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1804 = _T_1724 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1805 = _T_1726 & _T_1164; // @[Mux.scala 27:72]
  wire [5:0] _T_1806 = _T_1731 ? _T_1173 : 6'h0; // @[Mux.scala 27:72]
  wire  _T_1807 = _T_1740 & _T_1176; // @[Mux.scala 27:72]
  wire  _T_1808 = _T_1743 & _T_1179; // @[Mux.scala 27:72]
  wire  _T_1809 = _T_1746 & _T_1182; // @[Mux.scala 27:72]
  wire  _T_1810 = _T_1749 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_1811 = _T_1751 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_1812 = _T_1753 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_1813 = _T_1755 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_1814 = _T_1757 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_1815 = _T_1591 | _T_1760; // @[Mux.scala 27:72]
  wire  _T_1816 = _T_1815 | _T_1761; // @[Mux.scala 27:72]
  wire  _T_1817 = _T_1816 | _T_1762; // @[Mux.scala 27:72]
  wire  _T_1818 = _T_1817 | _T_1763; // @[Mux.scala 27:72]
  wire  _T_1819 = _T_1818 | _T_1764; // @[Mux.scala 27:72]
  wire  _T_1820 = _T_1819 | _T_1765; // @[Mux.scala 27:72]
  wire  _T_1821 = _T_1820 | _T_1766; // @[Mux.scala 27:72]
  wire  _T_1822 = _T_1821 | _T_1767; // @[Mux.scala 27:72]
  wire  _T_1823 = _T_1822 | _T_1768; // @[Mux.scala 27:72]
  wire  _T_1824 = _T_1823 | _T_1769; // @[Mux.scala 27:72]
  wire  _T_1825 = _T_1824 | _T_1770; // @[Mux.scala 27:72]
  wire  _T_1826 = _T_1825 | _T_1771; // @[Mux.scala 27:72]
  wire  _T_1827 = _T_1826 | _T_1772; // @[Mux.scala 27:72]
  wire  _T_1828 = _T_1827 | _T_1773; // @[Mux.scala 27:72]
  wire  _T_1829 = _T_1828 | _T_1774; // @[Mux.scala 27:72]
  wire  _T_1830 = _T_1829 | _T_1775; // @[Mux.scala 27:72]
  wire  _T_1831 = _T_1830 | _T_1776; // @[Mux.scala 27:72]
  wire  _T_1832 = _T_1831 | _T_1777; // @[Mux.scala 27:72]
  wire  _T_1833 = _T_1832 | _T_1778; // @[Mux.scala 27:72]
  wire  _T_1834 = _T_1833 | _T_1779; // @[Mux.scala 27:72]
  wire  _T_1835 = _T_1834 | _T_1780; // @[Mux.scala 27:72]
  wire  _T_1836 = _T_1835 | _T_1781; // @[Mux.scala 27:72]
  wire  _T_1837 = _T_1836 | _T_1782; // @[Mux.scala 27:72]
  wire  _T_1838 = _T_1837 | _T_1783; // @[Mux.scala 27:72]
  wire  _T_1839 = _T_1838 | _T_1784; // @[Mux.scala 27:72]
  wire  _T_1840 = _T_1839 | _T_1785; // @[Mux.scala 27:72]
  wire  _T_1841 = _T_1840 | _T_1786; // @[Mux.scala 27:72]
  wire  _T_1842 = _T_1841 | _T_1767; // @[Mux.scala 27:72]
  wire  _T_1843 = _T_1842 | _T_1788; // @[Mux.scala 27:72]
  wire  _T_1844 = _T_1843 | _T_1789; // @[Mux.scala 27:72]
  wire  _T_1845 = _T_1844 | _T_1790; // @[Mux.scala 27:72]
  wire  _T_1846 = _T_1845 | _T_1791; // @[Mux.scala 27:72]
  wire  _T_1847 = _T_1846 | _T_1792; // @[Mux.scala 27:72]
  wire  _T_1848 = _T_1847 | _T_1793; // @[Mux.scala 27:72]
  wire  _T_1849 = _T_1848 | _T_1794; // @[Mux.scala 27:72]
  wire  _T_1850 = _T_1849 | _T_1795; // @[Mux.scala 27:72]
  wire  _T_1851 = _T_1850 | _T_1796; // @[Mux.scala 27:72]
  wire  _T_1852 = _T_1851 | _T_1797; // @[Mux.scala 27:72]
  wire  _T_1853 = _T_1852 | _T_1798; // @[Mux.scala 27:72]
  wire  _T_1854 = _T_1853 | _T_1799; // @[Mux.scala 27:72]
  wire  _T_1855 = _T_1854 | _T_1800; // @[Mux.scala 27:72]
  wire  _T_1856 = _T_1855 | _T_1801; // @[Mux.scala 27:72]
  wire  _T_1857 = _T_1856 | _T_1802; // @[Mux.scala 27:72]
  wire  _T_1858 = _T_1857 | _T_1803; // @[Mux.scala 27:72]
  wire  _T_1859 = _T_1858 | _T_1804; // @[Mux.scala 27:72]
  wire  _T_1860 = _T_1859 | _T_1805; // @[Mux.scala 27:72]
  wire [5:0] _GEN_40 = {{5'd0}, _T_1860}; // @[Mux.scala 27:72]
  wire [5:0] _T_1861 = _GEN_40 | _T_1806; // @[Mux.scala 27:72]
  wire [5:0] _GEN_41 = {{5'd0}, _T_1807}; // @[Mux.scala 27:72]
  wire [5:0] _T_1862 = _T_1861 | _GEN_41; // @[Mux.scala 27:72]
  wire [5:0] _GEN_42 = {{5'd0}, _T_1808}; // @[Mux.scala 27:72]
  wire [5:0] _T_1863 = _T_1862 | _GEN_42; // @[Mux.scala 27:72]
  wire [5:0] _GEN_43 = {{5'd0}, _T_1809}; // @[Mux.scala 27:72]
  wire [5:0] _T_1864 = _T_1863 | _GEN_43; // @[Mux.scala 27:72]
  wire [5:0] _GEN_44 = {{5'd0}, _T_1810}; // @[Mux.scala 27:72]
  wire [5:0] _T_1865 = _T_1864 | _GEN_44; // @[Mux.scala 27:72]
  wire [5:0] _GEN_45 = {{5'd0}, _T_1811}; // @[Mux.scala 27:72]
  wire [5:0] _T_1866 = _T_1865 | _GEN_45; // @[Mux.scala 27:72]
  wire [5:0] _GEN_46 = {{5'd0}, _T_1812}; // @[Mux.scala 27:72]
  wire [5:0] _T_1867 = _T_1866 | _GEN_46; // @[Mux.scala 27:72]
  wire [5:0] _GEN_47 = {{5'd0}, _T_1813}; // @[Mux.scala 27:72]
  wire [5:0] _T_1868 = _T_1867 | _GEN_47; // @[Mux.scala 27:72]
  wire [5:0] _GEN_48 = {{5'd0}, _T_1814}; // @[Mux.scala 27:72]
  wire [5:0] _T_1869 = _T_1868 | _GEN_48; // @[Mux.scala 27:72]
  wire [5:0] _GEN_49 = {{5'd0}, _T_1590}; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire [5:0] _T_1871 = _GEN_49 & _T_1869; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire  _T_1873 = ~mcountinhibit[6]; // @[el2_dec_tlu_ctl.scala 2351:25]
  reg [9:0] mhpme6; // @[Reg.scala 27:20]
  wire  _T_1874 = mhpme6 == 10'h1; // @[el2_dec_tlu_ctl.scala 2352:21]
  wire  _T_1876 = mhpme6 == 10'h2; // @[el2_dec_tlu_ctl.scala 2353:21]
  wire  _T_1878 = mhpme6 == 10'h3; // @[el2_dec_tlu_ctl.scala 2354:21]
  wire  _T_1880 = mhpme6 == 10'h4; // @[el2_dec_tlu_ctl.scala 2355:21]
  wire  _T_1884 = mhpme6 == 10'h5; // @[el2_dec_tlu_ctl.scala 2356:21]
  wire  _T_1890 = mhpme6 == 10'h6; // @[el2_dec_tlu_ctl.scala 2357:21]
  wire  _T_1895 = mhpme6 == 10'h7; // @[el2_dec_tlu_ctl.scala 2358:21]
  wire  _T_1897 = mhpme6 == 10'h8; // @[el2_dec_tlu_ctl.scala 2359:21]
  wire  _T_1899 = mhpme6 == 10'h1e; // @[el2_dec_tlu_ctl.scala 2360:21]
  wire  _T_1901 = mhpme6 == 10'h9; // @[el2_dec_tlu_ctl.scala 2361:21]
  wire  _T_1904 = mhpme6 == 10'ha; // @[el2_dec_tlu_ctl.scala 2362:21]
  wire  _T_1907 = mhpme6 == 10'hb; // @[el2_dec_tlu_ctl.scala 2363:21]
  wire  _T_1910 = mhpme6 == 10'hc; // @[el2_dec_tlu_ctl.scala 2364:21]
  wire  _T_1913 = mhpme6 == 10'hd; // @[el2_dec_tlu_ctl.scala 2365:21]
  wire  _T_1916 = mhpme6 == 10'he; // @[el2_dec_tlu_ctl.scala 2366:21]
  wire  _T_1917 = io_dec_tlu_packet_r_pmu_lsu_misaligned >> _T_1916; // @[el2_dec_tlu_ctl.scala 2366:7]
  wire  _T_1919 = _T_1060 & _T_1917; // @[el2_dec_tlu_ctl.scala 2365:89]
  wire  _T_1921 = _T_1919 & _T_1063; // @[el2_dec_tlu_ctl.scala 2366:45]
  wire  _T_1923 = _T_1921 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec_tlu_ctl.scala 2366:77]
  wire  _T_1924 = mhpme6 == 10'hf; // @[el2_dec_tlu_ctl.scala 2368:21]
  wire  _T_1927 = mhpme6 == 10'h10; // @[el2_dec_tlu_ctl.scala 2369:21]
  wire  _T_1930 = mhpme6 == 10'h12; // @[el2_dec_tlu_ctl.scala 2370:21]
  wire  _T_1933 = mhpme6 == 10'h11; // @[el2_dec_tlu_ctl.scala 2371:21]
  wire  _T_1936 = mhpme6 == 10'h13; // @[el2_dec_tlu_ctl.scala 2372:21]
  wire  _T_1939 = mhpme6 == 10'h14; // @[el2_dec_tlu_ctl.scala 2373:21]
  wire  _T_1942 = mhpme6 == 10'h15; // @[el2_dec_tlu_ctl.scala 2374:21]
  wire  _T_1945 = mhpme6 == 10'h16; // @[el2_dec_tlu_ctl.scala 2375:21]
  wire  _T_1948 = mhpme6 == 10'h17; // @[el2_dec_tlu_ctl.scala 2376:21]
  wire  _T_1951 = mhpme6 == 10'h18; // @[el2_dec_tlu_ctl.scala 2377:21]
  wire  _T_1956 = mhpme6 == 10'h19; // @[el2_dec_tlu_ctl.scala 2378:21]
  wire  _T_1959 = mhpme6 == 10'h1a; // @[el2_dec_tlu_ctl.scala 2379:21]
  wire  _T_1962 = mhpme6 == 10'h1b; // @[el2_dec_tlu_ctl.scala 2380:21]
  wire  _T_1965 = mhpme6 == 10'h1c; // @[el2_dec_tlu_ctl.scala 2381:21]
  wire  _T_1969 = mhpme6 == 10'h1f; // @[el2_dec_tlu_ctl.scala 2383:21]
  wire  _T_1971 = mhpme6 == 10'h20; // @[el2_dec_tlu_ctl.scala 2384:21]
  wire  _T_1973 = mhpme6 == 10'h22; // @[el2_dec_tlu_ctl.scala 2385:21]
  wire  _T_1975 = mhpme6 == 10'h23; // @[el2_dec_tlu_ctl.scala 2386:21]
  wire  _T_1977 = mhpme6 == 10'h24; // @[el2_dec_tlu_ctl.scala 2387:21]
  wire  _T_1979 = mhpme6 == 10'h25; // @[el2_dec_tlu_ctl.scala 2388:21]
  wire  _T_1983 = mhpme6 == 10'h26; // @[el2_dec_tlu_ctl.scala 2389:21]
  wire  _T_1987 = mhpme6 == 10'h27; // @[el2_dec_tlu_ctl.scala 2390:21]
  wire  _T_1989 = mhpme6 == 10'h28; // @[el2_dec_tlu_ctl.scala 2391:21]
  wire  _T_1991 = mhpme6 == 10'h29; // @[el2_dec_tlu_ctl.scala 2392:21]
  wire  _T_1995 = mhpme6 == 10'h2a; // @[el2_dec_tlu_ctl.scala 2393:21]
  wire  _T_1997 = mhpme6 == 10'h2b; // @[el2_dec_tlu_ctl.scala 2394:21]
  wire  _T_1999 = mhpme6 == 10'h2c; // @[el2_dec_tlu_ctl.scala 2395:21]
  wire  _T_2001 = mhpme6 == 10'h2d; // @[el2_dec_tlu_ctl.scala 2396:21]
  wire  _T_2003 = mhpme6 == 10'h2e; // @[el2_dec_tlu_ctl.scala 2397:21]
  wire  _T_2005 = mhpme6 == 10'h2f; // @[el2_dec_tlu_ctl.scala 2398:21]
  wire  _T_2007 = mhpme6 == 10'h30; // @[el2_dec_tlu_ctl.scala 2399:21]
  wire  _T_2009 = mhpme6 == 10'h31; // @[el2_dec_tlu_ctl.scala 2400:21]
  wire  _T_2014 = mhpme6 == 10'h32; // @[el2_dec_tlu_ctl.scala 2401:21]
  wire  _T_2023 = mhpme6 == 10'h36; // @[el2_dec_tlu_ctl.scala 2402:21]
  wire  _T_2026 = mhpme6 == 10'h37; // @[el2_dec_tlu_ctl.scala 2403:21]
  wire  _T_2029 = mhpme6 == 10'h38; // @[el2_dec_tlu_ctl.scala 2404:21]
  wire  _T_2032 = mhpme6 == 10'h200; // @[el2_dec_tlu_ctl.scala 2406:21]
  wire  _T_2034 = mhpme6 == 10'h201; // @[el2_dec_tlu_ctl.scala 2407:21]
  wire  _T_2036 = mhpme6 == 10'h202; // @[el2_dec_tlu_ctl.scala 2408:21]
  wire  _T_2038 = mhpme6 == 10'h203; // @[el2_dec_tlu_ctl.scala 2409:21]
  wire  _T_2040 = mhpme6 == 10'h204; // @[el2_dec_tlu_ctl.scala 2410:21]
  wire  _T_2043 = _T_1876 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_2044 = _T_1878 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_2045 = _T_1880 & _T_1034; // @[Mux.scala 27:72]
  wire  _T_2046 = _T_1884 & _T_1040; // @[Mux.scala 27:72]
  wire  _T_2047 = _T_1890 & _T_1045; // @[Mux.scala 27:72]
  wire  _T_2048 = _T_1895 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_2049 = _T_1897 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_2050 = _T_1899 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_2051 = _T_1901 & _T_1054; // @[Mux.scala 27:72]
  wire  _T_2052 = _T_1904 & _T_1057; // @[Mux.scala 27:72]
  wire  _T_2053 = _T_1907 & _T_1060; // @[Mux.scala 27:72]
  wire  _T_2054 = _T_1910 & _T_1063; // @[Mux.scala 27:72]
  wire  _T_2055 = _T_1913 & _T_1923; // @[Mux.scala 27:72]
  wire  _T_2056 = _T_1924 & _T_1077; // @[Mux.scala 27:72]
  wire  _T_2057 = _T_1927 & _T_1080; // @[Mux.scala 27:72]
  wire  _T_2058 = _T_1930 & _T_1083; // @[Mux.scala 27:72]
  wire  _T_2059 = _T_1933 & _T_1086; // @[Mux.scala 27:72]
  wire  _T_2060 = _T_1936 & _T_1089; // @[Mux.scala 27:72]
  wire  _T_2061 = _T_1939 & _T_1092; // @[Mux.scala 27:72]
  wire  _T_2062 = _T_1942 & _T_1095; // @[Mux.scala 27:72]
  wire  _T_2063 = _T_1945 & _T_1098; // @[Mux.scala 27:72]
  wire  _T_2064 = _T_1948 & _T_1101; // @[Mux.scala 27:72]
  wire  _T_2065 = _T_1951 & _T_1106; // @[Mux.scala 27:72]
  wire  _T_2066 = _T_1956 & _T_1109; // @[Mux.scala 27:72]
  wire  _T_2067 = _T_1959 & _T_1112; // @[Mux.scala 27:72]
  wire  _T_2068 = _T_1962 & _T_1115; // @[Mux.scala 27:72]
  wire  _T_2069 = _T_1965 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_2071 = _T_1969 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_2072 = _T_1971 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_2073 = _T_1973 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_2074 = _T_1975 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_2075 = _T_1977 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_2076 = _T_1979 & _T_1133; // @[Mux.scala 27:72]
  wire  _T_2077 = _T_1983 & _T_1137; // @[Mux.scala 27:72]
  wire  _T_2078 = _T_1987 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_2079 = _T_1989 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_2080 = _T_1991 & _T_1145; // @[Mux.scala 27:72]
  wire  _T_2081 = _T_1995 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_2082 = _T_1997 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_2083 = _T_1999 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_2084 = _T_2001 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_2085 = _T_2003 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_2086 = _T_2005 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_2087 = _T_2007 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_2088 = _T_2009 & _T_1164; // @[Mux.scala 27:72]
  wire [5:0] _T_2089 = _T_2014 ? _T_1173 : 6'h0; // @[Mux.scala 27:72]
  wire  _T_2090 = _T_2023 & _T_1176; // @[Mux.scala 27:72]
  wire  _T_2091 = _T_2026 & _T_1179; // @[Mux.scala 27:72]
  wire  _T_2092 = _T_2029 & _T_1182; // @[Mux.scala 27:72]
  wire  _T_2093 = _T_2032 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_2094 = _T_2034 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_2095 = _T_2036 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_2096 = _T_2038 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_2097 = _T_2040 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_2098 = _T_1874 | _T_2043; // @[Mux.scala 27:72]
  wire  _T_2099 = _T_2098 | _T_2044; // @[Mux.scala 27:72]
  wire  _T_2100 = _T_2099 | _T_2045; // @[Mux.scala 27:72]
  wire  _T_2101 = _T_2100 | _T_2046; // @[Mux.scala 27:72]
  wire  _T_2102 = _T_2101 | _T_2047; // @[Mux.scala 27:72]
  wire  _T_2103 = _T_2102 | _T_2048; // @[Mux.scala 27:72]
  wire  _T_2104 = _T_2103 | _T_2049; // @[Mux.scala 27:72]
  wire  _T_2105 = _T_2104 | _T_2050; // @[Mux.scala 27:72]
  wire  _T_2106 = _T_2105 | _T_2051; // @[Mux.scala 27:72]
  wire  _T_2107 = _T_2106 | _T_2052; // @[Mux.scala 27:72]
  wire  _T_2108 = _T_2107 | _T_2053; // @[Mux.scala 27:72]
  wire  _T_2109 = _T_2108 | _T_2054; // @[Mux.scala 27:72]
  wire  _T_2110 = _T_2109 | _T_2055; // @[Mux.scala 27:72]
  wire  _T_2111 = _T_2110 | _T_2056; // @[Mux.scala 27:72]
  wire  _T_2112 = _T_2111 | _T_2057; // @[Mux.scala 27:72]
  wire  _T_2113 = _T_2112 | _T_2058; // @[Mux.scala 27:72]
  wire  _T_2114 = _T_2113 | _T_2059; // @[Mux.scala 27:72]
  wire  _T_2115 = _T_2114 | _T_2060; // @[Mux.scala 27:72]
  wire  _T_2116 = _T_2115 | _T_2061; // @[Mux.scala 27:72]
  wire  _T_2117 = _T_2116 | _T_2062; // @[Mux.scala 27:72]
  wire  _T_2118 = _T_2117 | _T_2063; // @[Mux.scala 27:72]
  wire  _T_2119 = _T_2118 | _T_2064; // @[Mux.scala 27:72]
  wire  _T_2120 = _T_2119 | _T_2065; // @[Mux.scala 27:72]
  wire  _T_2121 = _T_2120 | _T_2066; // @[Mux.scala 27:72]
  wire  _T_2122 = _T_2121 | _T_2067; // @[Mux.scala 27:72]
  wire  _T_2123 = _T_2122 | _T_2068; // @[Mux.scala 27:72]
  wire  _T_2124 = _T_2123 | _T_2069; // @[Mux.scala 27:72]
  wire  _T_2125 = _T_2124 | _T_2050; // @[Mux.scala 27:72]
  wire  _T_2126 = _T_2125 | _T_2071; // @[Mux.scala 27:72]
  wire  _T_2127 = _T_2126 | _T_2072; // @[Mux.scala 27:72]
  wire  _T_2128 = _T_2127 | _T_2073; // @[Mux.scala 27:72]
  wire  _T_2129 = _T_2128 | _T_2074; // @[Mux.scala 27:72]
  wire  _T_2130 = _T_2129 | _T_2075; // @[Mux.scala 27:72]
  wire  _T_2131 = _T_2130 | _T_2076; // @[Mux.scala 27:72]
  wire  _T_2132 = _T_2131 | _T_2077; // @[Mux.scala 27:72]
  wire  _T_2133 = _T_2132 | _T_2078; // @[Mux.scala 27:72]
  wire  _T_2134 = _T_2133 | _T_2079; // @[Mux.scala 27:72]
  wire  _T_2135 = _T_2134 | _T_2080; // @[Mux.scala 27:72]
  wire  _T_2136 = _T_2135 | _T_2081; // @[Mux.scala 27:72]
  wire  _T_2137 = _T_2136 | _T_2082; // @[Mux.scala 27:72]
  wire  _T_2138 = _T_2137 | _T_2083; // @[Mux.scala 27:72]
  wire  _T_2139 = _T_2138 | _T_2084; // @[Mux.scala 27:72]
  wire  _T_2140 = _T_2139 | _T_2085; // @[Mux.scala 27:72]
  wire  _T_2141 = _T_2140 | _T_2086; // @[Mux.scala 27:72]
  wire  _T_2142 = _T_2141 | _T_2087; // @[Mux.scala 27:72]
  wire  _T_2143 = _T_2142 | _T_2088; // @[Mux.scala 27:72]
  wire [5:0] _GEN_51 = {{5'd0}, _T_2143}; // @[Mux.scala 27:72]
  wire [5:0] _T_2144 = _GEN_51 | _T_2089; // @[Mux.scala 27:72]
  wire [5:0] _GEN_52 = {{5'd0}, _T_2090}; // @[Mux.scala 27:72]
  wire [5:0] _T_2145 = _T_2144 | _GEN_52; // @[Mux.scala 27:72]
  wire [5:0] _GEN_53 = {{5'd0}, _T_2091}; // @[Mux.scala 27:72]
  wire [5:0] _T_2146 = _T_2145 | _GEN_53; // @[Mux.scala 27:72]
  wire [5:0] _GEN_54 = {{5'd0}, _T_2092}; // @[Mux.scala 27:72]
  wire [5:0] _T_2147 = _T_2146 | _GEN_54; // @[Mux.scala 27:72]
  wire [5:0] _GEN_55 = {{5'd0}, _T_2093}; // @[Mux.scala 27:72]
  wire [5:0] _T_2148 = _T_2147 | _GEN_55; // @[Mux.scala 27:72]
  wire [5:0] _GEN_56 = {{5'd0}, _T_2094}; // @[Mux.scala 27:72]
  wire [5:0] _T_2149 = _T_2148 | _GEN_56; // @[Mux.scala 27:72]
  wire [5:0] _GEN_57 = {{5'd0}, _T_2095}; // @[Mux.scala 27:72]
  wire [5:0] _T_2150 = _T_2149 | _GEN_57; // @[Mux.scala 27:72]
  wire [5:0] _GEN_58 = {{5'd0}, _T_2096}; // @[Mux.scala 27:72]
  wire [5:0] _T_2151 = _T_2150 | _GEN_58; // @[Mux.scala 27:72]
  wire [5:0] _GEN_59 = {{5'd0}, _T_2097}; // @[Mux.scala 27:72]
  wire [5:0] _T_2152 = _T_2151 | _GEN_59; // @[Mux.scala 27:72]
  wire [5:0] _GEN_60 = {{5'd0}, _T_1873}; // @[el2_dec_tlu_ctl.scala 2351:45]
  wire [5:0] _T_2154 = _GEN_60 & _T_2152; // @[el2_dec_tlu_ctl.scala 2351:45]
  reg  mhpmc_inc_r_d1_0; // @[el2_dec_tlu_ctl.scala 2413:54]
  reg  mhpmc_inc_r_d1_1; // @[el2_dec_tlu_ctl.scala 2414:54]
  reg  mhpmc_inc_r_d1_2; // @[el2_dec_tlu_ctl.scala 2415:54]
  reg  mhpmc_inc_r_d1_3; // @[el2_dec_tlu_ctl.scala 2416:54]
  reg  perfcnt_halted_d1; // @[el2_dec_tlu_ctl.scala 2417:57]
  wire  perfcnt_halted = _T_83 | io_dec_tlu_pmu_fw_halted; // @[el2_dec_tlu_ctl.scala 2420:68]
  wire  _T_2164 = ~_T_83; // @[el2_dec_tlu_ctl.scala 2421:38]
  wire [3:0] _T_2166 = _T_2164 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_2173 = {mhpme6[9],mhpme5[9],mhpme4[9],mhpme3[9]}; // @[Cat.scala 29:58]
  wire [3:0] perfcnt_during_sleep = _T_2166 & _T_2173; // @[el2_dec_tlu_ctl.scala 2421:87]
  wire  _T_2175 = ~perfcnt_during_sleep[0]; // @[el2_dec_tlu_ctl.scala 2423:68]
  wire  _T_2176 = perfcnt_halted_d1 & _T_2175; // @[el2_dec_tlu_ctl.scala 2423:66]
  wire  _T_2177 = ~_T_2176; // @[el2_dec_tlu_ctl.scala 2423:46]
  wire  _T_2180 = ~perfcnt_during_sleep[1]; // @[el2_dec_tlu_ctl.scala 2424:68]
  wire  _T_2181 = perfcnt_halted_d1 & _T_2180; // @[el2_dec_tlu_ctl.scala 2424:66]
  wire  _T_2182 = ~_T_2181; // @[el2_dec_tlu_ctl.scala 2424:46]
  wire  _T_2185 = ~perfcnt_during_sleep[2]; // @[el2_dec_tlu_ctl.scala 2425:68]
  wire  _T_2186 = perfcnt_halted_d1 & _T_2185; // @[el2_dec_tlu_ctl.scala 2425:66]
  wire  _T_2187 = ~_T_2186; // @[el2_dec_tlu_ctl.scala 2425:46]
  wire  _T_2190 = ~perfcnt_during_sleep[3]; // @[el2_dec_tlu_ctl.scala 2426:68]
  wire  _T_2191 = perfcnt_halted_d1 & _T_2190; // @[el2_dec_tlu_ctl.scala 2426:66]
  wire  _T_2192 = ~_T_2191; // @[el2_dec_tlu_ctl.scala 2426:46]
  wire  _T_2195 = io_dec_csr_wraddr_r == 12'hb03; // @[el2_dec_tlu_ctl.scala 2432:73]
  wire  mhpmc3_wr_en0 = io_dec_csr_wen_r_mod & _T_2195; // @[el2_dec_tlu_ctl.scala 2432:44]
  wire  _T_2196 = ~perfcnt_halted; // @[el2_dec_tlu_ctl.scala 2433:24]
  wire  _T_2198 = _T_2196 | perfcnt_during_sleep[0]; // @[el2_dec_tlu_ctl.scala 2433:40]
  wire  mhpmc_inc_r_0 = _T_1305[0]; // @[el2_dec_tlu_ctl.scala 2346:25 el2_dec_tlu_ctl.scala 2351:20]
  wire  _T_2199 = |mhpmc_inc_r_0; // @[el2_dec_tlu_ctl.scala 2433:87]
  wire  mhpmc3_wr_en1 = _T_2198 & _T_2199; // @[el2_dec_tlu_ctl.scala 2433:67]
  reg [31:0] mhpmc3h; // @[el2_lib.scala 514:16]
  reg [31:0] mhpmc3; // @[el2_lib.scala 514:16]
  wire [63:0] _T_2202 = {mhpmc3h,mhpmc3}; // @[Cat.scala 29:58]
  wire [63:0] _T_2203 = {63'h0,mhpmc_inc_r_0}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc3_incr = _T_2202 + _T_2203; // @[el2_dec_tlu_ctl.scala 2437:50]
  wire  _T_2211 = io_dec_csr_wraddr_r == 12'hb83; // @[el2_dec_tlu_ctl.scala 2442:74]
  wire  mhpmc3h_wr_en0 = io_dec_csr_wen_r_mod & _T_2211; // @[el2_dec_tlu_ctl.scala 2442:45]
  wire  _T_2217 = io_dec_csr_wraddr_r == 12'hb04; // @[el2_dec_tlu_ctl.scala 2451:73]
  wire  mhpmc4_wr_en0 = io_dec_csr_wen_r_mod & _T_2217; // @[el2_dec_tlu_ctl.scala 2451:44]
  wire  _T_2220 = _T_2196 | perfcnt_during_sleep[1]; // @[el2_dec_tlu_ctl.scala 2452:40]
  wire  mhpmc_inc_r_1 = _T_1588[0]; // @[el2_dec_tlu_ctl.scala 2346:25 el2_dec_tlu_ctl.scala 2351:20]
  wire  _T_2221 = |mhpmc_inc_r_1; // @[el2_dec_tlu_ctl.scala 2452:87]
  wire  mhpmc4_wr_en1 = _T_2220 & _T_2221; // @[el2_dec_tlu_ctl.scala 2452:67]
  reg [31:0] mhpmc4h; // @[el2_lib.scala 514:16]
  reg [31:0] mhpmc4; // @[el2_lib.scala 514:16]
  wire [63:0] _T_2224 = {mhpmc4h,mhpmc4}; // @[Cat.scala 29:58]
  wire [63:0] _T_2225 = {63'h0,mhpmc_inc_r_1}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc4_incr = _T_2224 + _T_2225; // @[el2_dec_tlu_ctl.scala 2457:50]
  wire  _T_2234 = io_dec_csr_wraddr_r == 12'hb84; // @[el2_dec_tlu_ctl.scala 2461:74]
  wire  mhpmc4h_wr_en0 = io_dec_csr_wen_r_mod & _T_2234; // @[el2_dec_tlu_ctl.scala 2461:45]
  wire  _T_2240 = io_dec_csr_wraddr_r == 12'hb05; // @[el2_dec_tlu_ctl.scala 2470:73]
  wire  mhpmc5_wr_en0 = io_dec_csr_wen_r_mod & _T_2240; // @[el2_dec_tlu_ctl.scala 2470:44]
  wire  _T_2243 = _T_2196 | perfcnt_during_sleep[2]; // @[el2_dec_tlu_ctl.scala 2471:40]
  wire  mhpmc_inc_r_2 = _T_1871[0]; // @[el2_dec_tlu_ctl.scala 2346:25 el2_dec_tlu_ctl.scala 2351:20]
  wire  _T_2244 = |mhpmc_inc_r_2; // @[el2_dec_tlu_ctl.scala 2471:87]
  wire  mhpmc5_wr_en1 = _T_2243 & _T_2244; // @[el2_dec_tlu_ctl.scala 2471:67]
  reg [31:0] mhpmc5h; // @[el2_lib.scala 514:16]
  reg [31:0] mhpmc5; // @[el2_lib.scala 514:16]
  wire [63:0] _T_2247 = {mhpmc5h,mhpmc5}; // @[Cat.scala 29:58]
  wire [63:0] _T_2248 = {63'h0,mhpmc_inc_r_2}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc5_incr = _T_2247 + _T_2248; // @[el2_dec_tlu_ctl.scala 2474:50]
  wire  _T_2256 = io_dec_csr_wraddr_r == 12'hb85; // @[el2_dec_tlu_ctl.scala 2479:74]
  wire  mhpmc5h_wr_en0 = io_dec_csr_wen_r_mod & _T_2256; // @[el2_dec_tlu_ctl.scala 2479:45]
  wire  _T_2262 = io_dec_csr_wraddr_r == 12'hb06; // @[el2_dec_tlu_ctl.scala 2488:73]
  wire  mhpmc6_wr_en0 = io_dec_csr_wen_r_mod & _T_2262; // @[el2_dec_tlu_ctl.scala 2488:44]
  wire  _T_2265 = _T_2196 | perfcnt_during_sleep[3]; // @[el2_dec_tlu_ctl.scala 2489:40]
  wire  mhpmc_inc_r_3 = _T_2154[0]; // @[el2_dec_tlu_ctl.scala 2346:25 el2_dec_tlu_ctl.scala 2351:20]
  wire  _T_2266 = |mhpmc_inc_r_3; // @[el2_dec_tlu_ctl.scala 2489:87]
  wire  mhpmc6_wr_en1 = _T_2265 & _T_2266; // @[el2_dec_tlu_ctl.scala 2489:67]
  reg [31:0] mhpmc6h; // @[el2_lib.scala 514:16]
  reg [31:0] mhpmc6; // @[el2_lib.scala 514:16]
  wire [63:0] _T_2269 = {mhpmc6h,mhpmc6}; // @[Cat.scala 29:58]
  wire [63:0] _T_2270 = {63'h0,mhpmc_inc_r_3}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc6_incr = _T_2269 + _T_2270; // @[el2_dec_tlu_ctl.scala 2492:50]
  wire  _T_2278 = io_dec_csr_wraddr_r == 12'hb86; // @[el2_dec_tlu_ctl.scala 2497:74]
  wire  mhpmc6h_wr_en0 = io_dec_csr_wen_r_mod & _T_2278; // @[el2_dec_tlu_ctl.scala 2497:45]
  wire  _T_2284 = io_dec_csr_wrdata_r[9:0] > 10'h204; // @[el2_dec_tlu_ctl.scala 2508:57]
  wire  _T_2286 = |io_dec_csr_wrdata_r[31:10]; // @[el2_dec_tlu_ctl.scala 2508:103]
  wire  _T_2287 = _T_2284 | _T_2286; // @[el2_dec_tlu_ctl.scala 2508:72]
  wire  _T_2290 = io_dec_csr_wraddr_r == 12'h323; // @[el2_dec_tlu_ctl.scala 2510:71]
  wire  wr_mhpme3_r = io_dec_csr_wen_r_mod & _T_2290; // @[el2_dec_tlu_ctl.scala 2510:42]
  wire  _T_2294 = io_dec_csr_wraddr_r == 12'h324; // @[el2_dec_tlu_ctl.scala 2517:71]
  wire  wr_mhpme4_r = io_dec_csr_wen_r_mod & _T_2294; // @[el2_dec_tlu_ctl.scala 2517:42]
  wire  _T_2298 = io_dec_csr_wraddr_r == 12'h325; // @[el2_dec_tlu_ctl.scala 2524:71]
  wire  wr_mhpme5_r = io_dec_csr_wen_r_mod & _T_2298; // @[el2_dec_tlu_ctl.scala 2524:42]
  wire  _T_2302 = io_dec_csr_wraddr_r == 12'h326; // @[el2_dec_tlu_ctl.scala 2531:71]
  wire  wr_mhpme6_r = io_dec_csr_wen_r_mod & _T_2302; // @[el2_dec_tlu_ctl.scala 2531:42]
  wire  _T_2306 = io_dec_csr_wraddr_r == 12'h320; // @[el2_dec_tlu_ctl.scala 2548:78]
  wire  wr_mcountinhibit_r = io_dec_csr_wen_r_mod & _T_2306; // @[el2_dec_tlu_ctl.scala 2548:49]
  wire  _T_2318 = io_i0_valid_wb | io_exc_or_int_valid_r_d1; // @[el2_dec_tlu_ctl.scala 2563:52]
  wire  _T_2319 = _T_2318 | io_interrupt_valid_r_d1; // @[el2_dec_tlu_ctl.scala 2563:79]
  wire  _T_2320 = _T_2319 | io_dec_tlu_i0_valid_wb1; // @[el2_dec_tlu_ctl.scala 2563:105]
  wire  _T_2321 = _T_2320 | io_dec_tlu_i0_exc_valid_wb1; // @[el2_dec_tlu_ctl.scala 2563:131]
  wire  _T_2322 = _T_2321 | io_dec_tlu_int_valid_wb1; // @[el2_dec_tlu_ctl.scala 2564:33]
  reg  _T_2325; // @[el2_dec_tlu_ctl.scala 2566:63]
  wire  _T_2326 = io_i0_exception_valid_r_d1 | io_lsu_i0_exc_r_d1; // @[el2_dec_tlu_ctl.scala 2567:92]
  wire  _T_2327 = ~io_trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 2567:138]
  wire  _T_2328 = io_trigger_hit_r_d1 & _T_2327; // @[el2_dec_tlu_ctl.scala 2567:136]
  reg  _T_2330; // @[el2_dec_tlu_ctl.scala 2567:63]
  reg [4:0] _T_2331; // @[el2_dec_tlu_ctl.scala 2568:63]
  reg  _T_2332; // @[el2_dec_tlu_ctl.scala 2569:63]
  wire [31:0] _T_2338 = {io_core_id,4'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2347 = {21'h3,3'h0,io_mstatus[1],3'h0,io_mstatus[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2352 = {io_mtvec[30:1],1'h0,io_mtvec[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_2365 = {1'h0,io_mip[5:3],16'h0,io_mip[2],3'h0,io_mip[1],3'h0,io_mip[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2378 = {1'h0,mie[5:3],16'h0,mie[2],3'h0,mie[1],3'h0,mie[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2390 = {io_mepc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2395 = {28'h0,mscause}; // @[Cat.scala 29:58]
  wire [31:0] _T_2403 = {meivt,10'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2409 = {28'h0,meicurpl}; // @[Cat.scala 29:58]
  wire [31:0] _T_2412 = {28'h0,meicidpl}; // @[Cat.scala 29:58]
  wire [31:0] _T_2415 = {28'h0,meipt}; // @[Cat.scala 29:58]
  wire [31:0] _T_2418 = {23'h0,mcgc}; // @[Cat.scala 29:58]
  wire [31:0] _T_2421 = {13'h0,_T_348,4'h0,mfdc_int[11:7],_T_351,mfdc_int[5:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_2425 = {16'h4000,io_dcsr[15:2],2'h3}; // @[Cat.scala 29:58]
  wire [31:0] _T_2427 = {io_dpc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2443 = {7'h0,dicawics[16],2'h0,dicawics[15:14],3'h0,dicawics[13:0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2446 = {30'h0,mtsel}; // @[Cat.scala 29:58]
  wire [31:0] _T_2475 = {26'h0,mfdht}; // @[Cat.scala 29:58]
  wire [31:0] _T_2478 = {30'h0,mfdhs}; // @[Cat.scala 29:58]
  wire [31:0] _T_2481 = {22'h0,mhpme3}; // @[Cat.scala 29:58]
  wire [31:0] _T_2484 = {22'h0,mhpme4}; // @[Cat.scala 29:58]
  wire [31:0] _T_2487 = {22'h0,mhpme5}; // @[Cat.scala 29:58]
  wire [31:0] _T_2490 = {22'h0,mhpme6}; // @[Cat.scala 29:58]
  wire [31:0] _T_2493 = {25'h0,temp_ncount6_2,1'h0,temp_ncount0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2496 = {30'h0,mpmc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2499 = io_csr_pkt_csr_misa ? 32'h40001104 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2500 = io_csr_pkt_csr_mvendorid ? 32'h45 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2501 = io_csr_pkt_csr_marchid ? 32'h10 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2502 = io_csr_pkt_csr_mimpid ? 32'h2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2503 = io_csr_pkt_csr_mhartid ? _T_2338 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2504 = io_csr_pkt_csr_mstatus ? _T_2347 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2505 = io_csr_pkt_csr_mtvec ? _T_2352 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2506 = io_csr_pkt_csr_mip ? _T_2365 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2507 = io_csr_pkt_csr_mie ? _T_2378 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2508 = io_csr_pkt_csr_mcyclel ? mcyclel : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2509 = io_csr_pkt_csr_mcycleh ? mcycleh_inc : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2510 = io_csr_pkt_csr_minstretl ? minstretl : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2511 = io_csr_pkt_csr_minstreth ? minstreth_inc : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2512 = io_csr_pkt_csr_mscratch ? mscratch : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2513 = io_csr_pkt_csr_mepc ? _T_2390 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2514 = io_csr_pkt_csr_mcause ? mcause : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2515 = io_csr_pkt_csr_mscause ? _T_2395 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2516 = io_csr_pkt_csr_mtval ? mtval : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2517 = io_csr_pkt_csr_mrac ? mrac : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2518 = io_csr_pkt_csr_mdseac ? mdseac : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2519 = io_csr_pkt_csr_meivt ? _T_2403 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2520 = io_csr_pkt_csr_meihap ? _T_615 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2521 = io_csr_pkt_csr_meicurpl ? _T_2409 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2522 = io_csr_pkt_csr_meicidpl ? _T_2412 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2523 = io_csr_pkt_csr_meipt ? _T_2415 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2524 = io_csr_pkt_csr_mcgc ? _T_2418 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2525 = io_csr_pkt_csr_mfdc ? _T_2421 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2526 = io_csr_pkt_csr_dcsr ? _T_2425 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2527 = io_csr_pkt_csr_dpc ? _T_2427 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2528 = io_csr_pkt_csr_dicad0 ? dicad0[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2529 = io_csr_pkt_csr_dicad0h ? dicad0h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2530 = io_csr_pkt_csr_dicad1 ? dicad1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2531 = io_csr_pkt_csr_dicawics ? _T_2443 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2532 = io_csr_pkt_csr_mtsel ? _T_2446 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2533 = io_csr_pkt_csr_mtdata1 ? mtdata1_tsel_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2534 = io_csr_pkt_csr_mtdata2 ? mtdata2_tsel_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2535 = io_csr_pkt_csr_micect ? micect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2536 = io_csr_pkt_csr_miccmect ? miccmect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2537 = io_csr_pkt_csr_mdccmect ? mdccmect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2538 = io_csr_pkt_csr_mhpmc3 ? mhpmc3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2539 = io_csr_pkt_csr_mhpmc4 ? mhpmc4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2540 = io_csr_pkt_csr_mhpmc5 ? mhpmc5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2541 = io_csr_pkt_csr_mhpmc6 ? mhpmc6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2542 = io_csr_pkt_csr_mhpmc3h ? mhpmc3h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2543 = io_csr_pkt_csr_mhpmc4h ? mhpmc4h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2544 = io_csr_pkt_csr_mhpmc5h ? mhpmc5h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2545 = io_csr_pkt_csr_mhpmc6h ? mhpmc6h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2546 = io_csr_pkt_csr_mfdht ? _T_2475 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2547 = io_csr_pkt_csr_mfdhs ? _T_2478 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2548 = io_csr_pkt_csr_mhpme3 ? _T_2481 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2549 = io_csr_pkt_csr_mhpme4 ? _T_2484 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2550 = io_csr_pkt_csr_mhpme5 ? _T_2487 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2551 = io_csr_pkt_csr_mhpme6 ? _T_2490 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2552 = io_csr_pkt_csr_mcountinhibit ? _T_2493 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2553 = io_csr_pkt_csr_mpmc ? _T_2496 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2554 = io_dec_timer_read_d ? io_dec_timer_rddata_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2555 = _T_2499 | _T_2500; // @[Mux.scala 27:72]
  wire [31:0] _T_2556 = _T_2555 | _T_2501; // @[Mux.scala 27:72]
  wire [31:0] _T_2557 = _T_2556 | _T_2502; // @[Mux.scala 27:72]
  wire [31:0] _T_2558 = _T_2557 | _T_2503; // @[Mux.scala 27:72]
  wire [31:0] _T_2559 = _T_2558 | _T_2504; // @[Mux.scala 27:72]
  wire [31:0] _T_2560 = _T_2559 | _T_2505; // @[Mux.scala 27:72]
  wire [31:0] _T_2561 = _T_2560 | _T_2506; // @[Mux.scala 27:72]
  wire [31:0] _T_2562 = _T_2561 | _T_2507; // @[Mux.scala 27:72]
  wire [31:0] _T_2563 = _T_2562 | _T_2508; // @[Mux.scala 27:72]
  wire [31:0] _T_2564 = _T_2563 | _T_2509; // @[Mux.scala 27:72]
  wire [31:0] _T_2565 = _T_2564 | _T_2510; // @[Mux.scala 27:72]
  wire [31:0] _T_2566 = _T_2565 | _T_2511; // @[Mux.scala 27:72]
  wire [31:0] _T_2567 = _T_2566 | _T_2512; // @[Mux.scala 27:72]
  wire [31:0] _T_2568 = _T_2567 | _T_2513; // @[Mux.scala 27:72]
  wire [31:0] _T_2569 = _T_2568 | _T_2514; // @[Mux.scala 27:72]
  wire [31:0] _T_2570 = _T_2569 | _T_2515; // @[Mux.scala 27:72]
  wire [31:0] _T_2571 = _T_2570 | _T_2516; // @[Mux.scala 27:72]
  wire [31:0] _T_2572 = _T_2571 | _T_2517; // @[Mux.scala 27:72]
  wire [31:0] _T_2573 = _T_2572 | _T_2518; // @[Mux.scala 27:72]
  wire [31:0] _T_2574 = _T_2573 | _T_2519; // @[Mux.scala 27:72]
  wire [31:0] _T_2575 = _T_2574 | _T_2520; // @[Mux.scala 27:72]
  wire [31:0] _T_2576 = _T_2575 | _T_2521; // @[Mux.scala 27:72]
  wire [31:0] _T_2577 = _T_2576 | _T_2522; // @[Mux.scala 27:72]
  wire [31:0] _T_2578 = _T_2577 | _T_2523; // @[Mux.scala 27:72]
  wire [31:0] _T_2579 = _T_2578 | _T_2524; // @[Mux.scala 27:72]
  wire [31:0] _T_2580 = _T_2579 | _T_2525; // @[Mux.scala 27:72]
  wire [31:0] _T_2581 = _T_2580 | _T_2526; // @[Mux.scala 27:72]
  wire [31:0] _T_2582 = _T_2581 | _T_2527; // @[Mux.scala 27:72]
  wire [31:0] _T_2583 = _T_2582 | _T_2528; // @[Mux.scala 27:72]
  wire [31:0] _T_2584 = _T_2583 | _T_2529; // @[Mux.scala 27:72]
  wire [31:0] _T_2585 = _T_2584 | _T_2530; // @[Mux.scala 27:72]
  wire [31:0] _T_2586 = _T_2585 | _T_2531; // @[Mux.scala 27:72]
  wire [31:0] _T_2587 = _T_2586 | _T_2532; // @[Mux.scala 27:72]
  wire [31:0] _T_2588 = _T_2587 | _T_2533; // @[Mux.scala 27:72]
  wire [31:0] _T_2589 = _T_2588 | _T_2534; // @[Mux.scala 27:72]
  wire [31:0] _T_2590 = _T_2589 | _T_2535; // @[Mux.scala 27:72]
  wire [31:0] _T_2591 = _T_2590 | _T_2536; // @[Mux.scala 27:72]
  wire [31:0] _T_2592 = _T_2591 | _T_2537; // @[Mux.scala 27:72]
  wire [31:0] _T_2593 = _T_2592 | _T_2538; // @[Mux.scala 27:72]
  wire [31:0] _T_2594 = _T_2593 | _T_2539; // @[Mux.scala 27:72]
  wire [31:0] _T_2595 = _T_2594 | _T_2540; // @[Mux.scala 27:72]
  wire [31:0] _T_2596 = _T_2595 | _T_2541; // @[Mux.scala 27:72]
  wire [31:0] _T_2597 = _T_2596 | _T_2542; // @[Mux.scala 27:72]
  wire [31:0] _T_2598 = _T_2597 | _T_2543; // @[Mux.scala 27:72]
  wire [31:0] _T_2599 = _T_2598 | _T_2544; // @[Mux.scala 27:72]
  wire [31:0] _T_2600 = _T_2599 | _T_2545; // @[Mux.scala 27:72]
  wire [31:0] _T_2601 = _T_2600 | _T_2546; // @[Mux.scala 27:72]
  wire [31:0] _T_2602 = _T_2601 | _T_2547; // @[Mux.scala 27:72]
  wire [31:0] _T_2603 = _T_2602 | _T_2548; // @[Mux.scala 27:72]
  wire [31:0] _T_2604 = _T_2603 | _T_2549; // @[Mux.scala 27:72]
  wire [31:0] _T_2605 = _T_2604 | _T_2550; // @[Mux.scala 27:72]
  wire [31:0] _T_2606 = _T_2605 | _T_2551; // @[Mux.scala 27:72]
  wire [31:0] _T_2607 = _T_2606 | _T_2552; // @[Mux.scala 27:72]
  wire [31:0] _T_2608 = _T_2607 | _T_2553; // @[Mux.scala 27:72]
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
  rvclkhdr rvclkhdr_31 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_31_io_l1clk),
    .io_clk(rvclkhdr_31_io_clk),
    .io_en(rvclkhdr_31_io_en),
    .io_scan_mode(rvclkhdr_31_io_scan_mode)
  );
  rvclkhdr rvclkhdr_32 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_32_io_l1clk),
    .io_clk(rvclkhdr_32_io_clk),
    .io_en(rvclkhdr_32_io_en),
    .io_scan_mode(rvclkhdr_32_io_scan_mode)
  );
  rvclkhdr rvclkhdr_33 ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_33_io_l1clk),
    .io_clk(rvclkhdr_33_io_clk),
    .io_en(rvclkhdr_33_io_en),
    .io_scan_mode(rvclkhdr_33_io_scan_mode)
  );
  rvclkhdr rvclkhdr_34 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_34_io_l1clk),
    .io_clk(rvclkhdr_34_io_clk),
    .io_en(rvclkhdr_34_io_en),
    .io_scan_mode(rvclkhdr_34_io_scan_mode)
  );
  assign io_dec_tlu_ic_diag_pkt_icache_wrdata = {_T_762,dicad0[31:0]}; // @[el2_dec_tlu_ctl.scala 2232:65]
  assign io_dec_tlu_ic_diag_pkt_icache_dicawics = dicawics; // @[el2_dec_tlu_ctl.scala 2235:42]
  assign io_dec_tlu_ic_diag_pkt_icache_rd_valid = icache_rd_valid_f; // @[el2_dec_tlu_ctl.scala 2243:42]
  assign io_dec_tlu_ic_diag_pkt_icache_wr_valid = icache_wr_valid_f; // @[el2_dec_tlu_ctl.scala 2244:42]
  assign io_trigger_pkt_any_0_select = io_mtdata1_t_0[7]; // @[el2_dec_tlu_ctl.scala 2308:36]
  assign io_trigger_pkt_any_0_match_ = io_mtdata1_t_0[4]; // @[el2_dec_tlu_ctl.scala 2309:36]
  assign io_trigger_pkt_any_0_store = io_mtdata1_t_0[1]; // @[el2_dec_tlu_ctl.scala 2310:36]
  assign io_trigger_pkt_any_0_load = io_mtdata1_t_0[0]; // @[el2_dec_tlu_ctl.scala 2311:36]
  assign io_trigger_pkt_any_0_execute = io_mtdata1_t_0[2]; // @[el2_dec_tlu_ctl.scala 2312:36]
  assign io_trigger_pkt_any_0_m = io_mtdata1_t_0[3]; // @[el2_dec_tlu_ctl.scala 2313:36]
  assign io_trigger_pkt_any_0_tdata2 = mtdata2_t_0; // @[el2_dec_tlu_ctl.scala 2326:53]
  assign io_trigger_pkt_any_1_select = io_mtdata1_t_1[7]; // @[el2_dec_tlu_ctl.scala 2308:36]
  assign io_trigger_pkt_any_1_match_ = io_mtdata1_t_1[4]; // @[el2_dec_tlu_ctl.scala 2309:36]
  assign io_trigger_pkt_any_1_store = io_mtdata1_t_1[1]; // @[el2_dec_tlu_ctl.scala 2310:36]
  assign io_trigger_pkt_any_1_load = io_mtdata1_t_1[0]; // @[el2_dec_tlu_ctl.scala 2311:36]
  assign io_trigger_pkt_any_1_execute = io_mtdata1_t_1[2]; // @[el2_dec_tlu_ctl.scala 2312:36]
  assign io_trigger_pkt_any_1_m = io_mtdata1_t_1[3]; // @[el2_dec_tlu_ctl.scala 2313:36]
  assign io_trigger_pkt_any_1_tdata2 = mtdata2_t_1; // @[el2_dec_tlu_ctl.scala 2326:53]
  assign io_trigger_pkt_any_2_select = io_mtdata1_t_2[7]; // @[el2_dec_tlu_ctl.scala 2308:36]
  assign io_trigger_pkt_any_2_match_ = io_mtdata1_t_2[4]; // @[el2_dec_tlu_ctl.scala 2309:36]
  assign io_trigger_pkt_any_2_store = io_mtdata1_t_2[1]; // @[el2_dec_tlu_ctl.scala 2310:36]
  assign io_trigger_pkt_any_2_load = io_mtdata1_t_2[0]; // @[el2_dec_tlu_ctl.scala 2311:36]
  assign io_trigger_pkt_any_2_execute = io_mtdata1_t_2[2]; // @[el2_dec_tlu_ctl.scala 2312:36]
  assign io_trigger_pkt_any_2_m = io_mtdata1_t_2[3]; // @[el2_dec_tlu_ctl.scala 2313:36]
  assign io_trigger_pkt_any_2_tdata2 = mtdata2_t_2; // @[el2_dec_tlu_ctl.scala 2326:53]
  assign io_trigger_pkt_any_3_select = io_mtdata1_t_3[7]; // @[el2_dec_tlu_ctl.scala 2308:36]
  assign io_trigger_pkt_any_3_match_ = io_mtdata1_t_3[4]; // @[el2_dec_tlu_ctl.scala 2309:36]
  assign io_trigger_pkt_any_3_store = io_mtdata1_t_3[1]; // @[el2_dec_tlu_ctl.scala 2310:36]
  assign io_trigger_pkt_any_3_load = io_mtdata1_t_3[0]; // @[el2_dec_tlu_ctl.scala 2311:36]
  assign io_trigger_pkt_any_3_execute = io_mtdata1_t_3[2]; // @[el2_dec_tlu_ctl.scala 2312:36]
  assign io_trigger_pkt_any_3_m = io_mtdata1_t_3[3]; // @[el2_dec_tlu_ctl.scala 2313:36]
  assign io_trigger_pkt_any_3_tdata2 = mtdata2_t_3; // @[el2_dec_tlu_ctl.scala 2326:53]
  assign io_dec_tlu_int_valid_wb1 = _T_2332; // @[el2_dec_tlu_ctl.scala 2569:31]
  assign io_dec_tlu_i0_exc_valid_wb1 = _T_2330; // @[el2_dec_tlu_ctl.scala 2567:31]
  assign io_dec_tlu_i0_valid_wb1 = _T_2325; // @[el2_dec_tlu_ctl.scala 2566:31]
  assign io_dec_tlu_mtval_wb1 = mtval; // @[el2_dec_tlu_ctl.scala 2571:25]
  assign io_dec_tlu_exc_cause_wb1 = _T_2331; // @[el2_dec_tlu_ctl.scala 2568:31]
  assign io_dec_tlu_perfcnt0 = mhpmc_inc_r_d1_0 & _T_2177; // @[el2_dec_tlu_ctl.scala 2423:23]
  assign io_dec_tlu_perfcnt1 = mhpmc_inc_r_d1_1 & _T_2182; // @[el2_dec_tlu_ctl.scala 2424:23]
  assign io_dec_tlu_perfcnt2 = mhpmc_inc_r_d1_2 & _T_2187; // @[el2_dec_tlu_ctl.scala 2425:23]
  assign io_dec_tlu_perfcnt3 = mhpmc_inc_r_d1_3 & _T_2192; // @[el2_dec_tlu_ctl.scala 2426:23]
  assign io_dec_tlu_misc_clk_override = mcgc[8]; // @[el2_dec_tlu_ctl.scala 1797:32]
  assign io_dec_tlu_dec_clk_override = mcgc[7]; // @[el2_dec_tlu_ctl.scala 1798:32]
  assign io_dec_tlu_ifu_clk_override = mcgc[5]; // @[el2_dec_tlu_ctl.scala 1799:32]
  assign io_dec_tlu_lsu_clk_override = mcgc[4]; // @[el2_dec_tlu_ctl.scala 1800:32]
  assign io_dec_tlu_bus_clk_override = mcgc[3]; // @[el2_dec_tlu_ctl.scala 1801:32]
  assign io_dec_tlu_pic_clk_override = mcgc[2]; // @[el2_dec_tlu_ctl.scala 1802:32]
  assign io_dec_tlu_dccm_clk_override = mcgc[1]; // @[el2_dec_tlu_ctl.scala 1803:32]
  assign io_dec_tlu_icm_clk_override = mcgc[0]; // @[el2_dec_tlu_ctl.scala 1804:32]
  assign io_dec_csr_rddata_d = _T_2608 | _T_2554; // @[el2_dec_tlu_ctl.scala 2576:22]
  assign io_dec_tlu_pipelining_disable = mfdc[0]; // @[el2_dec_tlu_ctl.scala 1847:40]
  assign io_dec_tlu_wr_pause_r = _T_368 & _T_369; // @[el2_dec_tlu_ctl.scala 1856:25]
  assign io_dec_tlu_meipt = meipt; // @[el2_dec_tlu_ctl.scala 2083:20]
  assign io_dec_tlu_meicurpl = meicurpl; // @[el2_dec_tlu_ctl.scala 2047:23]
  assign io_dec_tlu_meihap = _T_615[29:0]; // @[el2_dec_tlu_ctl.scala 2033:21]
  assign io_dec_tlu_mrac_ff = mrac; // @[el2_dec_tlu_ctl.scala 1886:22]
  assign io_dec_tlu_wb_coalescing_disable = mfdc[2]; // @[el2_dec_tlu_ctl.scala 1846:40]
  assign io_dec_tlu_bpred_disable = mfdc[3]; // @[el2_dec_tlu_ctl.scala 1845:40]
  assign io_dec_tlu_sideeffect_posted_disable = mfdc[6]; // @[el2_dec_tlu_ctl.scala 1844:40]
  assign io_dec_tlu_core_ecc_disable = mfdc[8]; // @[el2_dec_tlu_ctl.scala 1843:40]
  assign io_dec_tlu_external_ldfwd_disable = mfdc[11]; // @[el2_dec_tlu_ctl.scala 1842:40]
  assign io_dec_tlu_dma_qos_prty = mfdc[18:16]; // @[el2_dec_tlu_ctl.scala 1841:40]
  assign io_dec_csr_wen_r_mod = _T_1 & _T_2; // @[el2_dec_tlu_ctl.scala 1530:24]
  assign io_fw_halt_req = _T_500 & _T_501; // @[el2_dec_tlu_ctl.scala 1921:18]
  assign io_mstatus = _T_54; // @[el2_dec_tlu_ctl.scala 1546:14]
  assign io_mstatus_mie_ns = io_mstatus[0] & _T_52; // @[el2_dec_tlu_ctl.scala 1545:21]
  assign io_dcsr = _T_700; // @[el2_dec_tlu_ctl.scala 2130:11]
  assign io_mtvec = _T_60; // @[el2_dec_tlu_ctl.scala 1558:12]
  assign io_mip = _T_66; // @[el2_dec_tlu_ctl.scala 1573:10]
  assign io_mie_ns = wr_mie_r ? _T_76 : mie; // @[el2_dec_tlu_ctl.scala 1587:13]
  assign io_npc_r = _T_159 | _T_157; // @[el2_dec_tlu_ctl.scala 1681:12]
  assign io_npc_r_d1 = _T_165; // @[el2_dec_tlu_ctl.scala 1687:15]
  assign io_mepc = _T_194; // @[el2_dec_tlu_ctl.scala 1706:11]
  assign io_mdseac_locked_ns = mdseac_en | _T_487; // @[el2_dec_tlu_ctl.scala 1904:23]
  assign io_force_halt = mfdht[0] & _T_607; // @[el2_dec_tlu_ctl.scala 2010:17]
  assign io_dpc = _T_725; // @[el2_dec_tlu_ctl.scala 2147:10]
  assign io_mtdata1_t_0 = _T_871; // @[el2_dec_tlu_ctl.scala 2303:41]
  assign io_mtdata1_t_1 = _T_872; // @[el2_dec_tlu_ctl.scala 2303:41]
  assign io_mtdata1_t_2 = _T_873; // @[el2_dec_tlu_ctl.scala 2303:41]
  assign io_mtdata1_t_3 = _T_874; // @[el2_dec_tlu_ctl.scala 2303:41]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_dec_csr_wen_r_mod & _T_56; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = wr_mcyclel_r | mcyclel_cout_in; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = wr_mcycleh_r | mcyclel_cout_f; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = i0_valid_no_ebreak_ecall_r | wr_minstretl_r; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = minstret_enable_f | wr_minstreth_r; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = io_dec_csr_wen_r_mod & _T_137; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = _T_162 | io_reset_delayed; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = _T_140 & io_dec_tlu_i0_valid_r; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_8_io_en = io_dec_csr_wen_r_mod & _T_323; // @[el2_lib.scala 511:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_9_io_en = io_dec_csr_wen_r_mod & _T_335; // @[el2_lib.scala 511:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_10_io_en = io_dec_csr_wen_r_mod & _T_372; // @[el2_lib.scala 511:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_11_io_en = _T_491 & _T_492; // @[el2_lib.scala 511:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_12_io_en = wr_micect_r | io_ic_perr_r_d1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_13_io_en = _T_547 | io_iccm_dma_sb_error; // @[el2_lib.scala 511:17]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_14_io_en = wr_mdccmect_r | io_lsu_single_ecc_error_r_d1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_15_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_15_io_en = io_dec_csr_wen_r_mod & _T_610; // @[el2_lib.scala 511:17]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_16_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_16_io_en = _T_631 | io_take_ext_int_start; // @[el2_lib.scala 511:17]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_17_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_17_io_en = _T_697 | io_take_nmi; // @[el2_lib.scala 511:17]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_18_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_18_io_en = _T_722 | dpc_capture_npc; // @[el2_lib.scala 511:17]
  assign rvclkhdr_18_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_19_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_19_io_en = _T_662 & _T_732; // @[el2_lib.scala 511:17]
  assign rvclkhdr_19_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_20_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_20_io_en = wr_dicad0_r | io_ifu_ic_debug_rd_data_valid; // @[el2_lib.scala 511:17]
  assign rvclkhdr_20_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_21_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_21_io_en = wr_dicad0h_r | io_ifu_ic_debug_rd_data_valid; // @[el2_lib.scala 511:17]
  assign rvclkhdr_21_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_22_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_22_io_en = _T_970 & _T_806; // @[el2_lib.scala 511:17]
  assign rvclkhdr_22_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_23_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_23_io_en = _T_979 & _T_815; // @[el2_lib.scala 511:17]
  assign rvclkhdr_23_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_24_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_24_io_en = _T_988 & _T_824; // @[el2_lib.scala 511:17]
  assign rvclkhdr_24_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_25_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_25_io_en = _T_997 & _T_833; // @[el2_lib.scala 511:17]
  assign rvclkhdr_25_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_26_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_26_io_en = mhpmc3_wr_en0 | mhpmc3_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_26_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_27_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_27_io_en = mhpmc3h_wr_en0 | mhpmc3_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_27_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_28_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_28_io_en = mhpmc4_wr_en0 | mhpmc4_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_28_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_29_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_29_io_en = mhpmc4h_wr_en0 | mhpmc4_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_29_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_30_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_30_io_en = mhpmc5_wr_en0 | mhpmc5_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_30_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_31_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_31_io_en = mhpmc5h_wr_en0 | mhpmc5_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_31_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_32_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_32_io_en = mhpmc6_wr_en0 | mhpmc6_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_32_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_33_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_33_io_en = mhpmc6h_wr_en0 | mhpmc6_wr_en1; // @[el2_lib.scala 511:17]
  assign rvclkhdr_33_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_34_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_34_io_en = _T_2322 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_34_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
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
  mpmc_b = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_54 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  _T_60 = _RAND_2[30:0];
  _RAND_3 = {1{`RANDOM}};
  mdccmect = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  miccmect = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  micect = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_66 = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  mie = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  temp_ncount6_2 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  temp_ncount0 = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  _T_95 = _RAND_10[32:0];
  _RAND_11 = {1{`RANDOM}};
  mcyclel_cout_f = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mcycleh = _RAND_12[31:0];
  _RAND_13 = {2{`RANDOM}};
  _T_122 = _RAND_13[32:0];
  _RAND_14 = {1{`RANDOM}};
  minstret_enable_f = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  minstretl_cout_f = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  minstreth = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mscratch = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  _T_165 = _RAND_18[30:0];
  _RAND_19 = {1{`RANDOM}};
  pc_r_d1 = _RAND_19[30:0];
  _RAND_20 = {1{`RANDOM}};
  _T_194 = _RAND_20[30:0];
  _RAND_21 = {1{`RANDOM}};
  mcause = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mscause = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  mtval = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mcgc = _RAND_24[8:0];
  _RAND_25 = {1{`RANDOM}};
  mfdc_int = _RAND_25[14:0];
  _RAND_26 = {1{`RANDOM}};
  mrac = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mdseac = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mfdht = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  mfdhs = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  force_halt_ctr_f = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  meivt = _RAND_31[21:0];
  _RAND_32 = {1{`RANDOM}};
  meihap = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  meicurpl = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  meicidpl = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  meipt = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  _T_700 = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  _T_725 = _RAND_37[30:0];
  _RAND_38 = {1{`RANDOM}};
  dicawics = _RAND_38[16:0];
  _RAND_39 = {3{`RANDOM}};
  dicad0 = _RAND_39[70:0];
  _RAND_40 = {1{`RANDOM}};
  dicad0h = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  _T_757 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  icache_rd_valid_f = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  icache_wr_valid_f = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  mtsel = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  _T_871 = _RAND_45[9:0];
  _RAND_46 = {1{`RANDOM}};
  _T_872 = _RAND_46[9:0];
  _RAND_47 = {1{`RANDOM}};
  _T_873 = _RAND_47[9:0];
  _RAND_48 = {1{`RANDOM}};
  _T_874 = _RAND_48[9:0];
  _RAND_49 = {1{`RANDOM}};
  mtdata2_t_0 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  mtdata2_t_1 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  mtdata2_t_2 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  mtdata2_t_3 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  mhpme3 = _RAND_53[9:0];
  _RAND_54 = {1{`RANDOM}};
  mhpme4 = _RAND_54[9:0];
  _RAND_55 = {1{`RANDOM}};
  mhpme5 = _RAND_55[9:0];
  _RAND_56 = {1{`RANDOM}};
  mhpme6 = _RAND_56[9:0];
  _RAND_57 = {1{`RANDOM}};
  mhpmc_inc_r_d1_0 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  mhpmc_inc_r_d1_1 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  mhpmc_inc_r_d1_2 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  mhpmc_inc_r_d1_3 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  perfcnt_halted_d1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  mhpmc3h = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  mhpmc3 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  mhpmc4h = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  mhpmc4 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  mhpmc5h = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  mhpmc5 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  mhpmc6h = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  mhpmc6 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  _T_2325 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  _T_2330 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  _T_2331 = _RAND_72[4:0];
  _RAND_73 = {1{`RANDOM}};
  _T_2332 = _RAND_73[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    mpmc_b = 1'h0;
  end
  if (reset) begin
    _T_54 = 2'h0;
  end
  if (reset) begin
    _T_60 = 31'h0;
  end
  if (reset) begin
    mdccmect = 32'h0;
  end
  if (reset) begin
    miccmect = 32'h0;
  end
  if (reset) begin
    micect = 32'h0;
  end
  if (reset) begin
    _T_66 = 6'h0;
  end
  if (reset) begin
    mie = 6'h0;
  end
  if (reset) begin
    temp_ncount6_2 = 5'h0;
  end
  if (reset) begin
    temp_ncount0 = 1'h0;
  end
  if (reset) begin
    _T_95 = 33'h0;
  end
  if (reset) begin
    mcyclel_cout_f = 1'h0;
  end
  if (reset) begin
    mcycleh = 32'h0;
  end
  if (reset) begin
    _T_122 = 33'h0;
  end
  if (reset) begin
    minstret_enable_f = 1'h0;
  end
  if (reset) begin
    minstretl_cout_f = 1'h0;
  end
  if (reset) begin
    minstreth = 32'h0;
  end
  if (reset) begin
    mscratch = 32'h0;
  end
  if (reset) begin
    _T_165 = 31'h0;
  end
  if (reset) begin
    pc_r_d1 = 31'h0;
  end
  if (reset) begin
    _T_194 = 31'h0;
  end
  if (reset) begin
    mcause = 32'h0;
  end
  if (reset) begin
    mscause = 4'h0;
  end
  if (reset) begin
    mtval = 32'h0;
  end
  if (reset) begin
    mcgc = 9'h0;
  end
  if (reset) begin
    mfdc_int = 15'h0;
  end
  if (reset) begin
    mrac = 32'h0;
  end
  if (reset) begin
    mdseac = 32'h0;
  end
  if (reset) begin
    mfdht = 6'h0;
  end
  if (reset) begin
    mfdhs = 2'h0;
  end
  if (reset) begin
    force_halt_ctr_f = 32'h0;
  end
  if (reset) begin
    meivt = 22'h0;
  end
  if (reset) begin
    meihap = 8'h0;
  end
  if (reset) begin
    meicurpl = 4'h0;
  end
  if (reset) begin
    meicidpl = 4'h0;
  end
  if (reset) begin
    meipt = 4'h0;
  end
  if (reset) begin
    _T_700 = 16'h0;
  end
  if (reset) begin
    _T_725 = 31'h0;
  end
  if (reset) begin
    dicawics = 17'h0;
  end
  if (reset) begin
    dicad0 = 71'h0;
  end
  if (reset) begin
    dicad0h = 32'h0;
  end
  if (reset) begin
    _T_757 = 32'h0;
  end
  if (reset) begin
    icache_rd_valid_f = 1'h0;
  end
  if (reset) begin
    icache_wr_valid_f = 1'h0;
  end
  if (reset) begin
    mtsel = 2'h0;
  end
  if (reset) begin
    _T_871 = 10'h0;
  end
  if (reset) begin
    _T_872 = 10'h0;
  end
  if (reset) begin
    _T_873 = 10'h0;
  end
  if (reset) begin
    _T_874 = 10'h0;
  end
  if (reset) begin
    mtdata2_t_0 = 32'h0;
  end
  if (reset) begin
    mtdata2_t_1 = 32'h0;
  end
  if (reset) begin
    mtdata2_t_2 = 32'h0;
  end
  if (reset) begin
    mtdata2_t_3 = 32'h0;
  end
  if (reset) begin
    mhpme3 = 10'h0;
  end
  if (reset) begin
    mhpme4 = 10'h0;
  end
  if (reset) begin
    mhpme5 = 10'h0;
  end
  if (reset) begin
    mhpme6 = 10'h0;
  end
  if (reset) begin
    mhpmc_inc_r_d1_0 = 1'h0;
  end
  if (reset) begin
    mhpmc_inc_r_d1_1 = 1'h0;
  end
  if (reset) begin
    mhpmc_inc_r_d1_2 = 1'h0;
  end
  if (reset) begin
    mhpmc_inc_r_d1_3 = 1'h0;
  end
  if (reset) begin
    perfcnt_halted_d1 = 1'h0;
  end
  if (reset) begin
    mhpmc3h = 32'h0;
  end
  if (reset) begin
    mhpmc3 = 32'h0;
  end
  if (reset) begin
    mhpmc4h = 32'h0;
  end
  if (reset) begin
    mhpmc4 = 32'h0;
  end
  if (reset) begin
    mhpmc5h = 32'h0;
  end
  if (reset) begin
    mhpmc5 = 32'h0;
  end
  if (reset) begin
    mhpmc6h = 32'h0;
  end
  if (reset) begin
    mhpmc6 = 32'h0;
  end
  if (reset) begin
    _T_2325 = 1'h0;
  end
  if (reset) begin
    _T_2330 = 1'h0;
  end
  if (reset) begin
    _T_2331 = 5'h0;
  end
  if (reset) begin
    _T_2332 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mpmc_b <= 1'h0;
    end else if (wr_mpmc_r) begin
      mpmc_b <= _T_507;
    end else begin
      mpmc_b <= _T_508;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_54 <= 2'h0;
    end else begin
      _T_54 <= _T_46 | _T_42;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_60 <= 31'h0;
    end else begin
      _T_60 <= {io_dec_csr_wrdata_r[31:2],io_dec_csr_wrdata_r[0]};
    end
  end
  always @(posedge rvclkhdr_14_io_l1clk or posedge reset) begin
    if (reset) begin
      mdccmect <= 32'h0;
    end else if (wr_mdccmect_r) begin
      mdccmect <= _T_523;
    end else begin
      mdccmect <= _T_567;
    end
  end
  always @(posedge rvclkhdr_13_io_l1clk or posedge reset) begin
    if (reset) begin
      miccmect <= 32'h0;
    end else if (wr_miccmect_r) begin
      miccmect <= _T_523;
    end else begin
      miccmect <= _T_546;
    end
  end
  always @(posedge rvclkhdr_12_io_l1clk or posedge reset) begin
    if (reset) begin
      micect <= 32'h0;
    end else if (wr_micect_r) begin
      micect <= _T_523;
    end else begin
      micect <= _T_525;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_66 <= 6'h0;
    end else begin
      _T_66 <= {_T_65,_T_63};
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mie <= 6'h0;
    end else begin
      mie <= io_mie_ns;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      temp_ncount6_2 <= 5'h0;
    end else if (wr_mcountinhibit_r) begin
      temp_ncount6_2 <= io_dec_csr_wrdata_r[6:2];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      temp_ncount0 <= 1'h0;
    end else if (wr_mcountinhibit_r) begin
      temp_ncount0 <= io_dec_csr_wrdata_r[0];
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_95 <= 33'h0;
    end else if (wr_mcyclel_r) begin
      _T_95 <= {{1'd0}, io_dec_csr_wrdata_r};
    end else begin
      _T_95 <= mcyclel_inc;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mcyclel_cout_f <= 1'h0;
    end else begin
      mcyclel_cout_f <= mcyclel_cout & _T_96;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      mcycleh <= 32'h0;
    end else if (wr_mcycleh_r) begin
      mcycleh <= io_dec_csr_wrdata_r;
    end else begin
      mcycleh <= mcycleh_inc;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_122 <= 33'h0;
    end else if (wr_minstretl_r) begin
      _T_122 <= {{1'd0}, io_dec_csr_wrdata_r};
    end else begin
      _T_122 <= minstretl_inc;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      minstret_enable_f <= 1'h0;
    end else begin
      minstret_enable_f <= i0_valid_no_ebreak_ecall_r | wr_minstretl_r;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      minstretl_cout_f <= 1'h0;
    end else begin
      minstretl_cout_f <= minstretl_cout & _T_123;
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      minstreth <= 32'h0;
    end else if (wr_minstreth_r) begin
      minstreth <= io_dec_csr_wrdata_r;
    end else begin
      minstreth <= minstreth_inc;
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      mscratch <= 32'h0;
    end else begin
      mscratch <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_165 <= 31'h0;
    end else begin
      _T_165 <= io_npc_r;
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      pc_r_d1 <= 31'h0;
    end else begin
      pc_r_d1 <= _T_169 | _T_170;
    end
  end
  always @(posedge io_e4e5_int_clk or posedge reset) begin
    if (reset) begin
      _T_194 <= 31'h0;
    end else begin
      _T_194 <= _T_192 | _T_190;
    end
  end
  always @(posedge io_e4e5_int_clk or posedge reset) begin
    if (reset) begin
      mcause <= 32'h0;
    end else begin
      mcause <= _T_232 | _T_228;
    end
  end
  always @(posedge io_e4e5_int_clk or posedge reset) begin
    if (reset) begin
      mscause <= 4'h0;
    end else begin
      mscause <= _T_262 | _T_261;
    end
  end
  always @(posedge io_e4e5_int_clk or posedge reset) begin
    if (reset) begin
      mtval <= 32'h0;
    end else begin
      mtval <= _T_319 | _T_315;
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      mcgc <= 9'h0;
    end else begin
      mcgc <= io_dec_csr_wrdata_r[8:0];
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      mfdc_int <= 15'h0;
    end else begin
      mfdc_int <= {_T_345,_T_344};
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      mrac <= 32'h0;
    end else begin
      mrac <= {_T_482,_T_467};
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      mdseac <= 32'h0;
    end else begin
      mdseac <= io_lsu_imprecise_error_addr_any;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      mfdht <= 6'h0;
    end else if (wr_mfdht_r) begin
      mfdht <= io_dec_csr_wrdata_r[5:0];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      mfdhs <= 2'h0;
    end else if (_T_593) begin
      if (wr_mfdhs_r) begin
        mfdhs <= io_dec_csr_wrdata_r[1:0];
      end else if (_T_587) begin
        mfdhs <= _T_591;
      end
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      force_halt_ctr_f <= 32'h0;
    end else if (mfdht[0]) begin
      if (io_debug_halt_req_f) begin
        force_halt_ctr_f <= _T_598;
      end else if (io_dbg_tlu_halted_f) begin
        force_halt_ctr_f <= 32'h0;
      end
    end
  end
  always @(posedge rvclkhdr_15_io_l1clk or posedge reset) begin
    if (reset) begin
      meivt <= 22'h0;
    end else begin
      meivt <= io_dec_csr_wrdata_r[31:10];
    end
  end
  always @(posedge rvclkhdr_16_io_l1clk or posedge reset) begin
    if (reset) begin
      meihap <= 8'h0;
    end else begin
      meihap <= io_pic_claimid;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      meicurpl <= 4'h0;
    end else if (wr_meicurpl_r) begin
      meicurpl <= io_dec_csr_wrdata_r[3:0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      meicidpl <= 4'h0;
    end else if (wr_meicpct_r) begin
      meicidpl <= io_pic_pl;
    end else if (wr_meicidpl_r) begin
      meicidpl <= io_dec_csr_wrdata_r[3:0];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      meipt <= 4'h0;
    end else if (wr_meipt_r) begin
      meipt <= io_dec_csr_wrdata_r[3:0];
    end
  end
  always @(posedge rvclkhdr_17_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_700 <= 16'h0;
    end else if (enter_debug_halt_req_le) begin
      _T_700 <= _T_674;
    end else if (wr_dcsr_r) begin
      _T_700 <= _T_689;
    end else begin
      _T_700 <= _T_694;
    end
  end
  always @(posedge rvclkhdr_18_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_725 <= 31'h0;
    end else begin
      _T_725 <= _T_720 | _T_719;
    end
  end
  always @(posedge rvclkhdr_19_io_l1clk or posedge reset) begin
    if (reset) begin
      dicawics <= 17'h0;
    end else begin
      dicawics <= {_T_729,io_dec_csr_wrdata_r[16:3]};
    end
  end
  always @(posedge rvclkhdr_20_io_l1clk or posedge reset) begin
    if (reset) begin
      dicad0 <= 71'h0;
    end else if (wr_dicad0_r) begin
      dicad0 <= {{39'd0}, io_dec_csr_wrdata_r};
    end else begin
      dicad0 <= io_ifu_ic_debug_rd_data;
    end
  end
  always @(posedge rvclkhdr_21_io_l1clk or posedge reset) begin
    if (reset) begin
      dicad0h <= 32'h0;
    end else if (wr_dicad0h_r) begin
      dicad0h <= io_dec_csr_wrdata_r;
    end else begin
      dicad0h <= io_ifu_ic_debug_rd_data[63:32];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_757 <= 32'h0;
    end else if (_T_755) begin
      if (_T_751) begin
        _T_757 <= io_dec_csr_wrdata_r;
      end else begin
        _T_757 <= {{25'd0}, io_ifu_ic_debug_rd_data[70:64]};
      end
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      icache_rd_valid_f <= 1'h0;
    end else begin
      icache_rd_valid_f <= _T_767 & _T_769;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      icache_wr_valid_f <= 1'h0;
    end else begin
      icache_wr_valid_f <= _T_662 & _T_772;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mtsel <= 2'h0;
    end else if (wr_mtsel_r) begin
      mtsel <= io_dec_csr_wrdata_r[1:0];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_871 <= 10'h0;
    end else if (wr_mtdata1_t_r_0) begin
      _T_871 <= tdata_wrdata_r;
    end else begin
      _T_871 <= _T_842;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_872 <= 10'h0;
    end else if (wr_mtdata1_t_r_1) begin
      _T_872 <= tdata_wrdata_r;
    end else begin
      _T_872 <= _T_851;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_873 <= 10'h0;
    end else if (wr_mtdata1_t_r_2) begin
      _T_873 <= tdata_wrdata_r;
    end else begin
      _T_873 <= _T_860;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_874 <= 10'h0;
    end else if (wr_mtdata1_t_r_3) begin
      _T_874 <= tdata_wrdata_r;
    end else begin
      _T_874 <= _T_869;
    end
  end
  always @(posedge rvclkhdr_22_io_l1clk or posedge reset) begin
    if (reset) begin
      mtdata2_t_0 <= 32'h0;
    end else begin
      mtdata2_t_0 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge rvclkhdr_23_io_l1clk or posedge reset) begin
    if (reset) begin
      mtdata2_t_1 <= 32'h0;
    end else begin
      mtdata2_t_1 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge rvclkhdr_24_io_l1clk or posedge reset) begin
    if (reset) begin
      mtdata2_t_2 <= 32'h0;
    end else begin
      mtdata2_t_2 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge rvclkhdr_25_io_l1clk or posedge reset) begin
    if (reset) begin
      mtdata2_t_3 <= 32'h0;
    end else begin
      mtdata2_t_3 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      mhpme3 <= 10'h0;
    end else if (wr_mhpme3_r) begin
      if (_T_2287) begin
        mhpme3 <= 10'h204;
      end else begin
        mhpme3 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      mhpme4 <= 10'h0;
    end else if (wr_mhpme4_r) begin
      if (_T_2287) begin
        mhpme4 <= 10'h204;
      end else begin
        mhpme4 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      mhpme5 <= 10'h0;
    end else if (wr_mhpme5_r) begin
      if (_T_2287) begin
        mhpme5 <= 10'h204;
      end else begin
        mhpme5 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      mhpme6 <= 10'h0;
    end else if (wr_mhpme6_r) begin
      if (_T_2287) begin
        mhpme6 <= 10'h204;
      end else begin
        mhpme6 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mhpmc_inc_r_d1_0 <= 1'h0;
    end else begin
      mhpmc_inc_r_d1_0 <= _T_1305[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mhpmc_inc_r_d1_1 <= 1'h0;
    end else begin
      mhpmc_inc_r_d1_1 <= _T_1588[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mhpmc_inc_r_d1_2 <= 1'h0;
    end else begin
      mhpmc_inc_r_d1_2 <= _T_1871[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mhpmc_inc_r_d1_3 <= 1'h0;
    end else begin
      mhpmc_inc_r_d1_3 <= _T_2154[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      perfcnt_halted_d1 <= 1'h0;
    end else begin
      perfcnt_halted_d1 <= _T_83 | io_dec_tlu_pmu_fw_halted;
    end
  end
  always @(posedge rvclkhdr_27_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc3h <= 32'h0;
    end else if (mhpmc3h_wr_en0) begin
      mhpmc3h <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc3h <= mhpmc3_incr[63:32];
    end
  end
  always @(posedge rvclkhdr_26_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc3 <= 32'h0;
    end else if (mhpmc3_wr_en0) begin
      mhpmc3 <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc3 <= mhpmc3_incr[31:0];
    end
  end
  always @(posedge rvclkhdr_29_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc4h <= 32'h0;
    end else if (mhpmc4h_wr_en0) begin
      mhpmc4h <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc4h <= mhpmc4_incr[63:32];
    end
  end
  always @(posedge rvclkhdr_28_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc4 <= 32'h0;
    end else if (mhpmc4_wr_en0) begin
      mhpmc4 <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc4 <= mhpmc4_incr[31:0];
    end
  end
  always @(posedge rvclkhdr_31_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc5h <= 32'h0;
    end else if (mhpmc5h_wr_en0) begin
      mhpmc5h <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc5h <= mhpmc5_incr[63:32];
    end
  end
  always @(posedge rvclkhdr_30_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc5 <= 32'h0;
    end else if (mhpmc5_wr_en0) begin
      mhpmc5 <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc5 <= mhpmc5_incr[31:0];
    end
  end
  always @(posedge rvclkhdr_33_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc6h <= 32'h0;
    end else if (mhpmc6h_wr_en0) begin
      mhpmc6h <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc6h <= mhpmc6_incr[63:32];
    end
  end
  always @(posedge rvclkhdr_32_io_l1clk or posedge reset) begin
    if (reset) begin
      mhpmc6 <= 32'h0;
    end else if (mhpmc6_wr_en0) begin
      mhpmc6 <= io_dec_csr_wrdata_r;
    end else begin
      mhpmc6 <= mhpmc6_incr[31:0];
    end
  end
  always @(posedge rvclkhdr_34_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_2325 <= 1'h0;
    end else begin
      _T_2325 <= io_i0_valid_wb;
    end
  end
  always @(posedge rvclkhdr_34_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_2330 <= 1'h0;
    end else begin
      _T_2330 <= _T_2326 | _T_2328;
    end
  end
  always @(posedge rvclkhdr_34_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_2331 <= 5'h0;
    end else begin
      _T_2331 <= io_exc_cause_wb;
    end
  end
  always @(posedge rvclkhdr_34_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_2332 <= 1'h0;
    end else begin
      _T_2332 <= io_interrupt_valid_r_d1;
    end
  end
endmodule
module el2_dec_decode_csr_read(
  input  [11:0] io_dec_csr_rdaddr_d,
  output        io_csr_pkt_csr_misa,
  output        io_csr_pkt_csr_mvendorid,
  output        io_csr_pkt_csr_marchid,
  output        io_csr_pkt_csr_mimpid,
  output        io_csr_pkt_csr_mhartid,
  output        io_csr_pkt_csr_mstatus,
  output        io_csr_pkt_csr_mtvec,
  output        io_csr_pkt_csr_mip,
  output        io_csr_pkt_csr_mie,
  output        io_csr_pkt_csr_mcyclel,
  output        io_csr_pkt_csr_mcycleh,
  output        io_csr_pkt_csr_minstretl,
  output        io_csr_pkt_csr_minstreth,
  output        io_csr_pkt_csr_mscratch,
  output        io_csr_pkt_csr_mepc,
  output        io_csr_pkt_csr_mcause,
  output        io_csr_pkt_csr_mscause,
  output        io_csr_pkt_csr_mtval,
  output        io_csr_pkt_csr_mrac,
  output        io_csr_pkt_csr_dmst,
  output        io_csr_pkt_csr_mdseac,
  output        io_csr_pkt_csr_meihap,
  output        io_csr_pkt_csr_meivt,
  output        io_csr_pkt_csr_meipt,
  output        io_csr_pkt_csr_meicurpl,
  output        io_csr_pkt_csr_meicidpl,
  output        io_csr_pkt_csr_dcsr,
  output        io_csr_pkt_csr_mcgc,
  output        io_csr_pkt_csr_mfdc,
  output        io_csr_pkt_csr_dpc,
  output        io_csr_pkt_csr_mtsel,
  output        io_csr_pkt_csr_mtdata1,
  output        io_csr_pkt_csr_mtdata2,
  output        io_csr_pkt_csr_mhpmc3,
  output        io_csr_pkt_csr_mhpmc4,
  output        io_csr_pkt_csr_mhpmc5,
  output        io_csr_pkt_csr_mhpmc6,
  output        io_csr_pkt_csr_mhpmc3h,
  output        io_csr_pkt_csr_mhpmc4h,
  output        io_csr_pkt_csr_mhpmc5h,
  output        io_csr_pkt_csr_mhpmc6h,
  output        io_csr_pkt_csr_mhpme3,
  output        io_csr_pkt_csr_mhpme4,
  output        io_csr_pkt_csr_mhpme5,
  output        io_csr_pkt_csr_mhpme6,
  output        io_csr_pkt_csr_mcountinhibit,
  output        io_csr_pkt_csr_mitctl0,
  output        io_csr_pkt_csr_mitctl1,
  output        io_csr_pkt_csr_mitb0,
  output        io_csr_pkt_csr_mitb1,
  output        io_csr_pkt_csr_mitcnt0,
  output        io_csr_pkt_csr_mitcnt1,
  output        io_csr_pkt_csr_mpmc,
  output        io_csr_pkt_csr_meicpct,
  output        io_csr_pkt_csr_micect,
  output        io_csr_pkt_csr_miccmect,
  output        io_csr_pkt_csr_mdccmect,
  output        io_csr_pkt_csr_mfdht,
  output        io_csr_pkt_csr_mfdhs,
  output        io_csr_pkt_csr_dicawics,
  output        io_csr_pkt_csr_dicad0h,
  output        io_csr_pkt_csr_dicad0,
  output        io_csr_pkt_csr_dicad1,
  output        io_csr_pkt_csr_dicago,
  output        io_csr_pkt_presync,
  output        io_csr_pkt_postsync,
  output        io_csr_pkt_legal
);
  wire  _T_1 = ~io_dec_csr_rdaddr_d[11]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_3 = ~io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_5 = ~io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_7 = ~io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_9 = _T_1 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_10 = _T_9 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_11 = _T_10 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_15 = ~io_dec_csr_rdaddr_d[7]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_17 = ~io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_19 = io_dec_csr_rdaddr_d[10] & _T_15; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_20 = _T_19 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_27 = ~io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:159]
  wire  _T_29 = _T_19 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_36 = io_dec_csr_rdaddr_d[10] & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_37 = _T_36 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_69 = _T_10 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_70 = _T_69 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_75 = _T_15 & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_94 = ~io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_96 = ~io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_101 = io_dec_csr_rdaddr_d[11] & _T_15; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_102 = _T_101 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_103 = _T_102 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_104 = _T_103 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_119 = io_dec_csr_rdaddr_d[7] & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_120 = _T_119 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_121 = _T_120 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_122 = _T_121 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_123 = _T_122 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_138 = _T_15 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_139 = _T_138 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_140 = _T_139 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_141 = _T_140 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_142 = _T_141 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_145 = ~io_dec_csr_rdaddr_d[10]; // @[el2_dec_tlu_ctl.scala 2648:123]
  wire  _T_156 = _T_145 & io_dec_csr_rdaddr_d[7]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_157 = _T_156 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_158 = _T_157 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_159 = _T_158 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_160 = _T_159 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_172 = _T_75 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_173 = _T_172 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_182 = _T_75 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_183 = _T_182 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_191 = _T_75 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_196 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_217 = _T_1 & io_dec_csr_rdaddr_d[7]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_218 = _T_217 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_219 = _T_218 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_220 = _T_219 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_230 = io_dec_csr_rdaddr_d[10] & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_231 = _T_230 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_232 = _T_231 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_240 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[10]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_241 = _T_240 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_258 = _T_145 & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_259 = _T_258 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_260 = _T_259 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_261 = _T_260 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_268 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_269 = _T_268 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_281 = _T_268 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_291 = _T_36 & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_292 = _T_291 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_299 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_300 = _T_299 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_310 = _T_300 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_311 = _T_310 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_330 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_331 = _T_330 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_332 = _T_331 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_342 = _T_231 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_381 = _T_103 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_382 = _T_381 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_397 = _T_103 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_411 = _T_15 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_412 = _T_411 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_413 = _T_412 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_414 = _T_413 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_415 = _T_414 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_426 = io_dec_csr_rdaddr_d[7] & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_427 = _T_426 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_428 = _T_427 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_429 = _T_428 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_444 = _T_119 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_445 = _T_444 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_446 = _T_445 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_447 = _T_446 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_460 = _T_427 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_461 = _T_460 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_478 = _T_446 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_490 = _T_15 & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_491 = _T_490 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_492 = _T_491 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_493 = _T_492 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_505 = io_dec_csr_rdaddr_d[5] & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_506 = _T_505 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_507 = _T_506 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_508 = _T_507 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_536 = _T_507 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_553 = _T_493 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_562 = io_dec_csr_rdaddr_d[6] & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_563 = _T_562 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_564 = _T_563 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_572 = io_dec_csr_rdaddr_d[6] & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_573 = _T_572 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_574 = _T_573 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_585 = _T_563 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_593 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_594 = _T_593 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_595 = _T_594 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_614 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_615 = _T_614 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_624 = io_dec_csr_rdaddr_d[6] & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_625 = _T_624 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_626 = _T_625 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_668 = _T_196 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_669 = _T_668 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_685 = _T_196 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_693 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_694 = _T_693 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_695 = _T_694 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_703 = _T_624 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_716 = _T_1 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_717 = _T_716 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_718 = _T_717 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_719 = _T_718 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_726 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_727 = _T_726 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_737 = _T_230 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_738 = _T_737 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_748 = _T_726 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_749 = _T_748 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_787 = _T_311 | _T_553; // @[el2_dec_tlu_ctl.scala 2716:73]
  wire  _T_799 = _T_3 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_800 = _T_799 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_801 = _T_800 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_802 = _T_801 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_803 = _T_802 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_804 = _T_787 | _T_803; // @[el2_dec_tlu_ctl.scala 2716:113]
  wire  _T_813 = io_dec_csr_rdaddr_d[11] & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_814 = _T_813 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_815 = _T_814 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_816 = _T_815 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_817 = _T_804 | _T_816; // @[el2_dec_tlu_ctl.scala 2716:147]
  wire  _T_828 = _T_814 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_829 = _T_828 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_830 = _T_817 | _T_829; // @[el2_dec_tlu_ctl.scala 2717:41]
  wire  _T_841 = io_dec_csr_rdaddr_d[7] & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_842 = _T_841 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_843 = _T_842 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_844 = _T_843 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_845 = _T_844 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_869 = _T_311 | _T_70; // @[el2_dec_tlu_ctl.scala 2718:73]
  wire  _T_879 = _T_869 | _T_183; // @[el2_dec_tlu_ctl.scala 2718:113]
  wire  _T_889 = _T_879 | _T_342; // @[el2_dec_tlu_ctl.scala 2718:154]
  wire  _T_904 = _T_1 & _T_15; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_905 = _T_904 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_906 = _T_905 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_907 = _T_906 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_908 = _T_907 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_909 = _T_908 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_910 = _T_889 | _T_909; // @[el2_dec_tlu_ctl.scala 2719:41]
  wire  _T_922 = _T_217 & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_923 = _T_922 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_924 = _T_923 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_925 = _T_924 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_926 = _T_910 | _T_925; // @[el2_dec_tlu_ctl.scala 2719:81]
  wire  _T_937 = _T_231 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_938 = _T_937 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_955 = _T_1 & io_dec_csr_rdaddr_d[10]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_956 = _T_955 & io_dec_csr_rdaddr_d[9]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_957 = _T_956 & io_dec_csr_rdaddr_d[8]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_958 = _T_957 & io_dec_csr_rdaddr_d[7]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_959 = _T_958 & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_960 = _T_959 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_961 = _T_960 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_962 = _T_961 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_963 = _T_962 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_964 = _T_963 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_983 = _T_1 & _T_145; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_984 = _T_983 & io_dec_csr_rdaddr_d[9]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_985 = _T_984 & io_dec_csr_rdaddr_d[8]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_986 = _T_985 & _T_15; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_987 = _T_986 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_988 = _T_987 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_989 = _T_988 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_990 = _T_989 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_991 = _T_990 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_992 = _T_964 | _T_991; // @[el2_dec_tlu_ctl.scala 2721:73]
  wire  _T_1013 = _T_987 & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1014 = _T_1013 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1015 = _T_1014 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1016 = _T_992 | _T_1015; // @[el2_dec_tlu_ctl.scala 2721:121]
  wire  _T_1032 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[9]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1033 = _T_1032 & io_dec_csr_rdaddr_d[8]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1034 = _T_1033 & io_dec_csr_rdaddr_d[7]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1035 = _T_1034 & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1036 = _T_1035 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1037 = _T_1036 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1038 = _T_1037 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1039 = _T_1038 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1040 = _T_1039 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1041 = _T_1016 | _T_1040; // @[el2_dec_tlu_ctl.scala 2722:57]
  wire  _T_1053 = io_dec_csr_rdaddr_d[11] & _T_145; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1054 = _T_1053 & io_dec_csr_rdaddr_d[9]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1055 = _T_1054 & io_dec_csr_rdaddr_d[8]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1056 = _T_1055 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1057 = _T_1056 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1058 = _T_1057 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1059 = _T_1041 | _T_1058; // @[el2_dec_tlu_ctl.scala 2722:105]
  wire  _T_1078 = _T_959 & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1079 = _T_1078 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1080 = _T_1079 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1081 = _T_1080 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1082 = _T_1081 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1083 = _T_1082 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1084 = _T_1059 | _T_1083; // @[el2_dec_tlu_ctl.scala 2723:65]
  wire  _T_1105 = _T_1079 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1106 = _T_1105 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1107 = _T_1084 | _T_1106; // @[el2_dec_tlu_ctl.scala 2723:113]
  wire  _T_1125 = _T_1033 & _T_15; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1126 = _T_1125 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1127 = _T_1126 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1128 = _T_1127 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1129 = _T_1128 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1130 = _T_1129 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1131 = _T_1130 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1132 = _T_1107 | _T_1131; // @[el2_dec_tlu_ctl.scala 2724:57]
  wire  _T_1152 = _T_958 & _T_3; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1153 = _T_1152 & io_dec_csr_rdaddr_d[5]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1154 = _T_1153 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1155 = _T_1154 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1156 = _T_1155 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1157 = _T_1132 | _T_1156; // @[el2_dec_tlu_ctl.scala 2724:113]
  wire  _T_1176 = _T_1013 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1177 = _T_1157 | _T_1176; // @[el2_dec_tlu_ctl.scala 2725:57]
  wire  _T_1202 = _T_1129 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1203 = _T_1202 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1204 = _T_1203 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1205 = _T_1177 | _T_1204; // @[el2_dec_tlu_ctl.scala 2725:113]
  wire  _T_1224 = _T_959 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1225 = _T_1224 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1226 = _T_1225 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1227 = _T_1226 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1228 = _T_1205 | _T_1227; // @[el2_dec_tlu_ctl.scala 2726:57]
  wire  _T_1248 = _T_1224 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1249 = _T_1248 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1250 = _T_1249 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1251 = _T_1228 | _T_1250; // @[el2_dec_tlu_ctl.scala 2726:113]
  wire  _T_1275 = _T_1130 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1276 = _T_1251 | _T_1275; // @[el2_dec_tlu_ctl.scala 2727:57]
  wire  _T_1296 = _T_1013 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1297 = _T_1296 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1298 = _T_1276 | _T_1297; // @[el2_dec_tlu_ctl.scala 2727:113]
  wire  _T_1315 = _T_1055 & io_dec_csr_rdaddr_d[7]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1316 = _T_1315 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1317 = _T_1316 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1318 = _T_1317 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1319 = _T_1318 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1320 = _T_1298 | _T_1319; // @[el2_dec_tlu_ctl.scala 2728:65]
  wire  _T_1343 = _T_1318 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1344 = _T_1343 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1345 = _T_1320 | _T_1344; // @[el2_dec_tlu_ctl.scala 2728:121]
  wire  _T_1361 = _T_1057 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1362 = _T_1345 | _T_1361; // @[el2_dec_tlu_ctl.scala 2729:57]
  wire  _T_1384 = _T_1249 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1385 = _T_1362 | _T_1384; // @[el2_dec_tlu_ctl.scala 2729:113]
  wire  _T_1406 = _T_1225 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1407 = _T_1385 | _T_1406; // @[el2_dec_tlu_ctl.scala 2730:57]
  wire  _T_1430 = _T_1226 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1431 = _T_1407 | _T_1430; // @[el2_dec_tlu_ctl.scala 2730:113]
  wire  _T_1455 = _T_1153 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1456 = _T_1455 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1457 = _T_1456 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1458 = _T_1457 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1459 = _T_1431 | _T_1458; // @[el2_dec_tlu_ctl.scala 2731:57]
  wire  _T_1475 = _T_1057 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1476 = _T_1459 | _T_1475; // @[el2_dec_tlu_ctl.scala 2731:105]
  wire  _T_1498 = _T_986 & io_dec_csr_rdaddr_d[6]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1499 = _T_1498 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1500 = _T_1499 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1501 = _T_1500 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1502 = _T_1501 & _T_7; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1503 = _T_1476 | _T_1502; // @[el2_dec_tlu_ctl.scala 2732:65]
  wire  _T_1526 = _T_986 & _T_5; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1527 = _T_1526 & _T_94; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1528 = _T_1527 & _T_96; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1529 = _T_1528 & _T_17; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1530 = _T_1529 & _T_27; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1531 = _T_1503 | _T_1530; // @[el2_dec_tlu_ctl.scala 2732:113]
  wire  _T_1550 = _T_1013 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1551 = _T_1531 | _T_1550; // @[el2_dec_tlu_ctl.scala 2733:57]
  wire  _T_1567 = _T_1057 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1568 = _T_1551 | _T_1567; // @[el2_dec_tlu_ctl.scala 2733:113]
  wire  _T_1587 = _T_1013 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  wire  _T_1588 = _T_1568 | _T_1587; // @[el2_dec_tlu_ctl.scala 2734:65]
  wire  _T_1604 = _T_1057 & io_dec_csr_rdaddr_d[4]; // @[el2_dec_tlu_ctl.scala 2648:192]
  assign io_csr_pkt_csr_misa = _T_11 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2650:49]
  assign io_csr_pkt_csr_mvendorid = _T_20 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2651:49]
  assign io_csr_pkt_csr_marchid = _T_29 & _T_27; // @[el2_dec_tlu_ctl.scala 2652:57]
  assign io_csr_pkt_csr_mimpid = _T_37 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2653:57]
  assign io_csr_pkt_csr_mhartid = _T_19 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2654:57]
  assign io_csr_pkt_csr_mstatus = _T_11 & _T_27; // @[el2_dec_tlu_ctl.scala 2655:57]
  assign io_csr_pkt_csr_mtvec = _T_69 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2656:49]
  assign io_csr_pkt_csr_mip = _T_75 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2657:57]
  assign io_csr_pkt_csr_mie = _T_69 & _T_27; // @[el2_dec_tlu_ctl.scala 2658:57]
  assign io_csr_pkt_csr_mcyclel = _T_104 & _T_17; // @[el2_dec_tlu_ctl.scala 2659:57]
  assign io_csr_pkt_csr_mcycleh = _T_123 & _T_17; // @[el2_dec_tlu_ctl.scala 2660:57]
  assign io_csr_pkt_csr_minstretl = _T_142 & _T_27; // @[el2_dec_tlu_ctl.scala 2661:49]
  assign io_csr_pkt_csr_minstreth = _T_160 & _T_27; // @[el2_dec_tlu_ctl.scala 2662:49]
  assign io_csr_pkt_csr_mscratch = _T_173 & _T_27; // @[el2_dec_tlu_ctl.scala 2663:49]
  assign io_csr_pkt_csr_mepc = _T_182 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2664:49]
  assign io_csr_pkt_csr_mcause = _T_191 & _T_27; // @[el2_dec_tlu_ctl.scala 2665:57]
  assign io_csr_pkt_csr_mscause = _T_196 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2666:57]
  assign io_csr_pkt_csr_mtval = _T_191 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2667:49]
  assign io_csr_pkt_csr_mrac = _T_220 & _T_17; // @[el2_dec_tlu_ctl.scala 2668:49]
  assign io_csr_pkt_csr_dmst = _T_232 & _T_17; // @[el2_dec_tlu_ctl.scala 2669:49]
  assign io_csr_pkt_csr_mdseac = _T_241 & _T_96; // @[el2_dec_tlu_ctl.scala 2670:57]
  assign io_csr_pkt_csr_meihap = _T_240 & io_dec_csr_rdaddr_d[3]; // @[el2_dec_tlu_ctl.scala 2671:57]
  assign io_csr_pkt_csr_meivt = _T_261 & _T_27; // @[el2_dec_tlu_ctl.scala 2672:49]
  assign io_csr_pkt_csr_meipt = _T_269 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2673:49]
  assign io_csr_pkt_csr_meicurpl = _T_268 & io_dec_csr_rdaddr_d[2]; // @[el2_dec_tlu_ctl.scala 2674:49]
  assign io_csr_pkt_csr_meicidpl = _T_281 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2675:49]
  assign io_csr_pkt_csr_dcsr = _T_292 & _T_27; // @[el2_dec_tlu_ctl.scala 2676:49]
  assign io_csr_pkt_csr_mcgc = _T_300 & _T_27; // @[el2_dec_tlu_ctl.scala 2677:49]
  assign io_csr_pkt_csr_mfdc = _T_310 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2678:49]
  assign io_csr_pkt_csr_dpc = _T_292 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2679:57]
  assign io_csr_pkt_csr_mtsel = _T_332 & _T_27; // @[el2_dec_tlu_ctl.scala 2680:49]
  assign io_csr_pkt_csr_mtdata1 = _T_231 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2681:57]
  assign io_csr_pkt_csr_mtdata2 = _T_331 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2682:57]
  assign io_csr_pkt_csr_mhpmc3 = _T_104 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2683:57]
  assign io_csr_pkt_csr_mhpmc4 = _T_382 & _T_27; // @[el2_dec_tlu_ctl.scala 2684:57]
  assign io_csr_pkt_csr_mhpmc5 = _T_397 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2685:57]
  assign io_csr_pkt_csr_mhpmc6 = _T_415 & _T_27; // @[el2_dec_tlu_ctl.scala 2686:57]
  assign io_csr_pkt_csr_mhpmc3h = _T_429 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2687:57]
  assign io_csr_pkt_csr_mhpmc4h = _T_447 & _T_27; // @[el2_dec_tlu_ctl.scala 2688:57]
  assign io_csr_pkt_csr_mhpmc5h = _T_461 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2689:57]
  assign io_csr_pkt_csr_mhpmc6h = _T_478 & _T_27; // @[el2_dec_tlu_ctl.scala 2690:57]
  assign io_csr_pkt_csr_mhpme3 = _T_493 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2691:57]
  assign io_csr_pkt_csr_mhpme4 = _T_508 & _T_27; // @[el2_dec_tlu_ctl.scala 2692:57]
  assign io_csr_pkt_csr_mhpme5 = _T_508 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2693:57]
  assign io_csr_pkt_csr_mhpme6 = _T_536 & _T_27; // @[el2_dec_tlu_ctl.scala 2694:57]
  assign io_csr_pkt_csr_mcountinhibit = _T_493 & _T_27; // @[el2_dec_tlu_ctl.scala 2695:41]
  assign io_csr_pkt_csr_mitctl0 = _T_564 & _T_27; // @[el2_dec_tlu_ctl.scala 2696:57]
  assign io_csr_pkt_csr_mitctl1 = _T_574 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2697:57]
  assign io_csr_pkt_csr_mitb0 = _T_585 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2698:49]
  assign io_csr_pkt_csr_mitb1 = _T_595 & _T_27; // @[el2_dec_tlu_ctl.scala 2699:49]
  assign io_csr_pkt_csr_mitcnt0 = _T_585 & _T_27; // @[el2_dec_tlu_ctl.scala 2700:57]
  assign io_csr_pkt_csr_mitcnt1 = _T_615 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2701:57]
  assign io_csr_pkt_csr_mpmc = _T_626 & io_dec_csr_rdaddr_d[1]; // @[el2_dec_tlu_ctl.scala 2702:49]
  assign io_csr_pkt_csr_meicpct = _T_281 & _T_27; // @[el2_dec_tlu_ctl.scala 2704:57]
  assign io_csr_pkt_csr_micect = _T_669 & _T_27; // @[el2_dec_tlu_ctl.scala 2706:57]
  assign io_csr_pkt_csr_miccmect = _T_668 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2707:49]
  assign io_csr_pkt_csr_mdccmect = _T_685 & _T_27; // @[el2_dec_tlu_ctl.scala 2708:49]
  assign io_csr_pkt_csr_mfdht = _T_695 & _T_27; // @[el2_dec_tlu_ctl.scala 2709:49]
  assign io_csr_pkt_csr_mfdhs = _T_703 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2710:49]
  assign io_csr_pkt_csr_dicawics = _T_719 & _T_27; // @[el2_dec_tlu_ctl.scala 2711:49]
  assign io_csr_pkt_csr_dicad0h = _T_727 & _T_17; // @[el2_dec_tlu_ctl.scala 2712:57]
  assign io_csr_pkt_csr_dicad0 = _T_738 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2713:57]
  assign io_csr_pkt_csr_dicad1 = _T_749 & _T_27; // @[el2_dec_tlu_ctl.scala 2714:57]
  assign io_csr_pkt_csr_dicago = _T_749 & io_dec_csr_rdaddr_d[0]; // @[el2_dec_tlu_ctl.scala 2715:57]
  assign io_csr_pkt_presync = _T_830 | _T_845; // @[el2_dec_tlu_ctl.scala 2716:26]
  assign io_csr_pkt_postsync = _T_926 | _T_938; // @[el2_dec_tlu_ctl.scala 2718:24]
  assign io_csr_pkt_legal = _T_1588 | _T_1604; // @[el2_dec_tlu_ctl.scala 2721:20]
endmodule
module el2_dec_tlu_ctl(
  input         clock,
  input         reset,
  input         io_active_clk,
  input         io_free_clk,
  input         io_scan_mode,
  input  [30:0] io_rst_vec,
  input         io_nmi_int,
  input  [30:0] io_nmi_vec,
  input         io_i_cpu_halt_req,
  input         io_i_cpu_run_req,
  input         io_lsu_fastint_stall_any,
  input         io_ifu_pmu_instr_aligned,
  input         io_ifu_pmu_fetch_stall,
  input         io_ifu_pmu_ic_miss,
  input         io_ifu_pmu_ic_hit,
  input         io_ifu_pmu_bus_error,
  input         io_ifu_pmu_bus_busy,
  input         io_ifu_pmu_bus_trxn,
  input         io_dec_pmu_instr_decoded,
  input         io_dec_pmu_decode_stall,
  input         io_dec_pmu_presync_stall,
  input         io_dec_pmu_postsync_stall,
  input         io_lsu_store_stall_any,
  input         io_dma_dccm_stall_any,
  input         io_dma_iccm_stall_any,
  input         io_exu_pmu_i0_br_misp,
  input         io_exu_pmu_i0_br_ataken,
  input         io_exu_pmu_i0_pc4,
  input         io_lsu_pmu_bus_trxn,
  input         io_lsu_pmu_bus_misaligned,
  input         io_lsu_pmu_bus_error,
  input         io_lsu_pmu_bus_busy,
  input         io_lsu_pmu_load_external_m,
  input         io_lsu_pmu_store_external_m,
  input         io_dma_pmu_dccm_read,
  input         io_dma_pmu_dccm_write,
  input         io_dma_pmu_any_read,
  input         io_dma_pmu_any_write,
  input  [30:0] io_lsu_fir_addr,
  input  [1:0]  io_lsu_fir_error,
  input         io_iccm_dma_sb_error,
  input         io_lsu_error_pkt_r_valid,
  input         io_lsu_error_pkt_r_bits_single_ecc_error,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input         io_lsu_error_pkt_r_bits_mscause,
  input         io_lsu_error_pkt_r_bits_addr,
  input         io_lsu_single_ecc_error_incr,
  input         io_dec_pause_state,
  input         io_lsu_imprecise_error_store_any,
  input         io_lsu_imprecise_error_load_any,
  input  [31:0] io_lsu_imprecise_error_addr_any,
  input         io_dec_csr_wen_unq_d,
  input         io_dec_csr_any_unq_d,
  input  [11:0] io_dec_csr_rdaddr_d,
  input         io_dec_csr_wen_r,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_dec_csr_stall_int_ff,
  input         io_dec_tlu_i0_valid_r,
  input  [30:0] io_exu_npc_r,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input         io_dec_tlu_packet_r_legal,
  input         io_dec_tlu_packet_r_icaf,
  input         io_dec_tlu_packet_r_icaf_f1,
  input  [1:0]  io_dec_tlu_packet_r_icaf_type,
  input         io_dec_tlu_packet_r_fence_i,
  input  [3:0]  io_dec_tlu_packet_r_i0trigger,
  input  [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  input         io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input         io_dec_tlu_packet_r_pmu_divide,
  input         io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input  [31:0] io_dec_illegal_inst,
  input         io_dec_i0_decode_d,
  input  [1:0]  io_exu_i0_br_hist_r,
  input         io_exu_i0_br_error_r,
  input         io_exu_i0_br_start_error_r,
  input         io_exu_i0_br_valid_r,
  input         io_exu_i0_br_mp_r,
  input         io_exu_i0_br_middle_r,
  input         io_exu_i0_br_way_r,
  output        io_dec_dbg_cmd_done,
  output        io_dec_dbg_cmd_fail,
  output        io_dec_tlu_dbg_halted,
  output        io_dec_tlu_debug_mode,
  output        io_dec_tlu_resume_ack,
  output        io_dec_tlu_debug_stall,
  output        io_dec_tlu_flush_noredir_r,
  output        io_dec_tlu_mpc_halted_only,
  output        io_dec_tlu_flush_leak_one_r,
  output        io_dec_tlu_flush_err_r,
  output        io_dec_tlu_flush_extint,
  output [29:0] io_dec_tlu_meihap,
  input         io_dbg_halt_req,
  input         io_dbg_resume_req,
  input         io_ifu_miss_state_idle,
  input         io_lsu_idle_any,
  input         io_dec_div_active,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_ifu_ic_error_start,
  input         io_ifu_iccm_rd_ecc_single_err,
  input  [70:0] io_ifu_ic_debug_rd_data,
  input         io_ifu_ic_debug_rd_data_valid,
  output [70:0] io_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_dec_tlu_ic_diag_pkt_icache_wr_valid,
  input  [7:0]  io_pic_claimid,
  input  [3:0]  io_pic_pl,
  input         io_mhwakeup,
  input         io_mexintpend,
  input         io_timer_int,
  input         io_soft_int,
  output        io_o_cpu_halt_status,
  output        io_o_cpu_halt_ack,
  output        io_o_cpu_run_ack,
  output        io_o_debug_mode_status,
  input  [27:0] io_core_id,
  input         io_mpc_debug_halt_req,
  input         io_mpc_debug_run_req,
  input         io_mpc_reset_run_req,
  output        io_mpc_debug_halt_ack,
  output        io_mpc_debug_run_ack,
  output        io_debug_brkpt_status,
  output [3:0]  io_dec_tlu_meicurpl,
  output [3:0]  io_dec_tlu_meipt,
  output [31:0] io_dec_csr_rddata_d,
  output        io_dec_csr_legal_d,
  output        io_dec_tlu_br0_r_pkt_valid,
  output [1:0]  io_dec_tlu_br0_r_pkt_bits_hist,
  output        io_dec_tlu_br0_r_pkt_bits_br_error,
  output        io_dec_tlu_br0_r_pkt_bits_br_start_error,
  output        io_dec_tlu_br0_r_pkt_bits_way,
  output        io_dec_tlu_br0_r_pkt_bits_middle,
  output        io_dec_tlu_i0_kill_writeb_wb,
  output        io_dec_tlu_flush_lower_wb,
  output        io_dec_tlu_i0_commit_cmt,
  output        io_dec_tlu_i0_kill_writeb_r,
  output        io_dec_tlu_flush_lower_r,
  output [30:0] io_dec_tlu_flush_path_r,
  output        io_dec_tlu_fence_i_r,
  output        io_dec_tlu_wr_pause_r,
  output        io_dec_tlu_flush_pause_r,
  output        io_dec_tlu_presync_d,
  output        io_dec_tlu_postsync_d,
  output [31:0] io_dec_tlu_mrac_ff,
  output        io_dec_tlu_force_halt,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  output        io_dec_tlu_i0_exc_valid_wb1,
  output        io_dec_tlu_i0_valid_wb1,
  output        io_dec_tlu_int_valid_wb1,
  output [4:0]  io_dec_tlu_exc_cause_wb1,
  output [31:0] io_dec_tlu_mtval_wb1,
  output        io_dec_tlu_external_ldfwd_disable,
  output        io_dec_tlu_sideeffect_posted_disable,
  output        io_dec_tlu_core_ecc_disable,
  output        io_dec_tlu_bpred_disable,
  output        io_dec_tlu_wb_coalescing_disable,
  output        io_dec_tlu_pipelining_disable,
  output [2:0]  io_dec_tlu_dma_qos_prty,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_dec_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override
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
`endif // RANDOMIZE_REG_INIT
  wire  int_timers_clock; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_reset; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_free_clk; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_scan_mode; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_dec_csr_wen_r_mod; // @[el2_dec_tlu_ctl.scala 355:24]
  wire [11:0] int_timers_io_dec_csr_wraddr_r; // @[el2_dec_tlu_ctl.scala 355:24]
  wire [31:0] int_timers_io_dec_csr_wrdata_r; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_csr_mitctl0; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_csr_mitctl1; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_csr_mitb0; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_csr_mitb1; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_csr_mitcnt0; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_csr_mitcnt1; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_dec_pause_state; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_dec_tlu_pmu_fw_halted; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_internal_dbg_halt_timers; // @[el2_dec_tlu_ctl.scala 355:24]
  wire [31:0] int_timers_io_dec_timer_rddata_d; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_dec_timer_read_d; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_dec_timer_t0_pulse; // @[el2_dec_tlu_ctl.scala 355:24]
  wire  int_timers_io_dec_timer_t1_pulse; // @[el2_dec_tlu_ctl.scala 355:24]
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
  wire  csr_clock; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_reset; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_free_clk; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_active_clk; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_scan_mode; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_dec_csr_wrdata_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [11:0] csr_io_dec_csr_wraddr_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [11:0] csr_io_dec_csr_rdaddr_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_csr_wen_unq_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_i0_decode_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [70:0] csr_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [16:0] csr_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_ic_debug_rd_data_valid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_0_select; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_0_match_; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_0_store; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_0_load; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_0_execute; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_0_m; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_trigger_pkt_any_0_tdata2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_1_select; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_1_match_; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_1_store; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_1_load; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_1_execute; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_1_m; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_trigger_pkt_any_1_tdata2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_2_select; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_2_match_; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_2_store; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_2_load; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_2_execute; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_2_m; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_trigger_pkt_any_2_tdata2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_3_select; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_3_match_; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_3_store; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_3_load; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_3_execute; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_pkt_any_3_m; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_trigger_pkt_any_3_tdata2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_bus_trxn; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dma_iccm_stall_any; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dma_dccm_stall_any; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_store_stall_any; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_pmu_presync_stall; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_pmu_postsync_stall; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_pmu_decode_stall; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_fetch_stall; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [1:0] csr_io_dec_tlu_packet_r_icaf_type; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [3:0] csr_io_dec_tlu_packet_r_pmu_i0_itype; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_packet_r_pmu_divide; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_exu_pmu_i0_br_ataken; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_exu_pmu_i0_br_misp; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_pmu_instr_decoded; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_instr_aligned; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_exu_pmu_i0_pc4; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_ic_miss; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_ic_hit; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_int_valid_wb1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_i0_exc_valid_wb1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_i0_valid_wb1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_csr_wen_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_dec_tlu_mtval_wb1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [4:0] csr_io_dec_tlu_exc_cause_wb1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_perfcnt0; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_perfcnt1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_perfcnt2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_perfcnt3; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dma_pmu_dccm_write; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dma_pmu_dccm_read; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dma_pmu_any_write; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dma_pmu_any_read; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_pmu_bus_busy; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_dec_tlu_i0_pc_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_csr_any_unq_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_misc_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_dec_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_ifu_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_lsu_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_bus_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_pic_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_dccm_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_icm_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_dec_csr_rddata_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_pipelining_disable; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_wr_pause_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_bus_busy; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_pmu_bus_error; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_pmu_bus_error; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_pmu_bus_misaligned; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_pmu_bus_trxn; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [70:0] csr_io_ifu_ic_debug_rd_data; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [3:0] csr_io_dec_tlu_meipt; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [3:0] csr_io_pic_pl; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [3:0] csr_io_dec_tlu_meicurpl; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [29:0] csr_io_dec_tlu_meihap; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [7:0] csr_io_pic_claimid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_iccm_dma_sb_error; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_lsu_imprecise_error_addr_any; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_imprecise_error_load_any; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_imprecise_error_store_any; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_dec_tlu_mrac_ff; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_wb_coalescing_disable; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_bpred_disable; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_sideeffect_posted_disable; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_core_ecc_disable; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_external_ldfwd_disable; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [2:0] csr_io_dec_tlu_dma_qos_prty; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_dec_illegal_inst; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_error_pkt_r_bits_mscause; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mexintpend; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_exu_npc_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mpc_reset_run_req; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_rst_vec; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [27:0] csr_io_core_id; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_dec_timer_rddata_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_timer_read_d; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_csr_wen_r_mod; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_rfpc_i0_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_i0_trigger_hit_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_fw_halt_req; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [1:0] csr_io_mstatus; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_exc_or_int_valid_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mret_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mstatus_mie_ns; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dcsr_single_step_running_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [15:0] csr_io_dcsr; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_mtvec; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [5:0] csr_io_mip; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_timer_t0_pulse; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_timer_t1_pulse; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_timer_int_sync; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_soft_int_sync; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [5:0] csr_io_mie_ns; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_wr_clk; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ebreak_to_debug_mode_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_pmu_fw_halted; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [1:0] csr_io_lsu_fir_error; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_npc_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_flush_noredir_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_tlu_flush_path_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_npc_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_reset_delayed; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_mepc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_interrupt_valid_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_i0_exception_valid_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mepc_trigger_hit_sel_pc_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_e4e5_int_clk; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_i0_exc_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_inst_acc_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_inst_acc_second_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_take_nmi; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [31:0] csr_io_lsu_error_pkt_addr_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [4:0] csr_io_exc_cause_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_i0_valid_wb; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_exc_or_int_valid_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_interrupt_valid_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_clk_override; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_i0_exception_valid_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_i0_exc_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [4:0] csr_io_exc_cause_wb; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_nmi_lsu_store_type; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_nmi_lsu_load_type; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_tlu_i0_commit_cmt; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ebreak_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ecall_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_illegal_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mdseac_locked_ns; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_mdseac_locked_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_nmi_int_detected_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_internal_dbg_halt_mode_f2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ic_perr_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_iccm_sbecc_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_single_ecc_error_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ifu_miss_state_idle_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_idle_any_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dbg_tlu_halted; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_debug_halt_req_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_force_halt; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_take_ext_int_start; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_trigger_hit_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_debug_halt_req; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_allow_dbg_halt_csr_write; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_internal_dbg_halt_mode_f; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_enter_debug_halt_req; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_internal_dbg_halt_mode; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_request_debug_mode_done; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_request_debug_mode_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [30:0] csr_io_dpc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [3:0] csr_io_update_hit_bit_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_take_timer_int; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_take_int_timer0_int; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_take_int_timer1_int; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_take_ext_int; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_tlu_flush_lower_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_br0_error_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_dec_tlu_br0_start_error_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_pmu_load_external_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_lsu_pmu_store_external_r; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_misa; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mvendorid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_marchid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mimpid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhartid; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mstatus; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mtvec; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mip; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mie; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mcyclel; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mcycleh; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_minstretl; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_minstreth; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mscratch; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mepc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mcause; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mscause; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mtval; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mrac; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mdseac; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_meihap; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_meivt; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_meipt; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_meicurpl; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_meicidpl; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_dcsr; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mcgc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mfdc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_dpc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mtsel; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mtdata1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mtdata2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc3; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc4; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc5; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc6; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc3h; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc4h; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc5h; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpmc6h; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpme3; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpme4; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpme5; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mhpme6; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mcountinhibit; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mpmc; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_micect; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_miccmect; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mdccmect; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mfdht; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_mfdhs; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_dicawics; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_dicad0h; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_dicad0; // @[el2_dec_tlu_ctl.scala 897:17]
  wire  csr_io_csr_pkt_csr_dicad1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [9:0] csr_io_mtdata1_t_0; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [9:0] csr_io_mtdata1_t_1; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [9:0] csr_io_mtdata1_t_2; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [9:0] csr_io_mtdata1_t_3; // @[el2_dec_tlu_ctl.scala 897:17]
  wire [11:0] csr_read_io_dec_csr_rdaddr_d; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_misa; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mvendorid; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_marchid; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mimpid; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhartid; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mstatus; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mtvec; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mip; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mie; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mcyclel; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mcycleh; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_minstretl; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_minstreth; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mscratch; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mepc; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mcause; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mscause; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mtval; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mrac; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dmst; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mdseac; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_meihap; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_meivt; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_meipt; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_meicurpl; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_meicidpl; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dcsr; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mcgc; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mfdc; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dpc; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mtsel; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mtdata1; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mtdata2; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc3; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc4; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc5; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc6; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc3h; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc4h; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc5h; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpmc6h; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpme3; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpme4; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpme5; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mhpme6; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mcountinhibit; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mitctl0; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mitctl1; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mitb0; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mitb1; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mitcnt0; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mitcnt1; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mpmc; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_meicpct; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_micect; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_miccmect; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mdccmect; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mfdht; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_mfdhs; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dicawics; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dicad0h; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dicad0; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dicad1; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_csr_dicago; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_presync; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_postsync; // @[el2_dec_tlu_ctl.scala 1090:22]
  wire  csr_read_io_csr_pkt_legal; // @[el2_dec_tlu_ctl.scala 1090:22]
  reg  dbg_halt_state_f; // @[el2_dec_tlu_ctl.scala 447:81]
  wire  _T = ~dbg_halt_state_f; // @[el2_dec_tlu_ctl.scala 354:33]
  reg  mpc_halt_state_f; // @[el2_dec_tlu_ctl.scala 442:81]
  wire [2:0] _T_3 = {io_i_cpu_run_req,io_mpc_debug_halt_req,io_mpc_debug_run_req}; // @[Cat.scala 29:58]
  wire [3:0] _T_6 = {io_nmi_int,io_timer_int,io_soft_int,io_i_cpu_halt_req}; // @[Cat.scala 29:58]
  reg [6:0] _T_8; // @[el2_lib.scala 177:81]
  reg [6:0] syncro_ff; // @[el2_lib.scala 177:58]
  wire  nmi_int_sync = syncro_ff[6]; // @[el2_dec_tlu_ctl.scala 382:67]
  wire  i_cpu_halt_req_sync = syncro_ff[3]; // @[el2_dec_tlu_ctl.scala 385:59]
  wire  i_cpu_run_req_sync = syncro_ff[2]; // @[el2_dec_tlu_ctl.scala 386:59]
  wire  mpc_debug_halt_req_sync_raw = syncro_ff[1]; // @[el2_dec_tlu_ctl.scala 387:51]
  wire  mpc_debug_run_req_sync = syncro_ff[0]; // @[el2_dec_tlu_ctl.scala 388:51]
  wire  dec_csr_wen_r_mod = csr_io_dec_csr_wen_r_mod; // @[el2_dec_tlu_ctl.scala 345:41 el2_dec_tlu_ctl.scala 1083:31]
  reg  lsu_exc_valid_r_d1; // @[el2_dec_tlu_ctl.scala 693:74]
  wire  _T_11 = io_lsu_error_pkt_r_valid | lsu_exc_valid_r_d1; // @[el2_dec_tlu_ctl.scala 392:61]
  reg  e5_valid; // @[el2_dec_tlu_ctl.scala 404:89]
  wire  e4e5_valid = io_dec_tlu_i0_valid_r | e5_valid; // @[el2_dec_tlu_ctl.scala 395:29]
  reg  debug_mode_status; // @[el2_dec_tlu_ctl.scala 405:73]
  reg  i_cpu_run_req_d1_raw; // @[el2_dec_tlu_ctl.scala 653:72]
  reg  nmi_int_delayed; // @[el2_dec_tlu_ctl.scala 420:64]
  wire  _T_37 = ~nmi_int_delayed; // @[el2_dec_tlu_ctl.scala 429:39]
  wire  _T_38 = nmi_int_sync & _T_37; // @[el2_dec_tlu_ctl.scala 429:37]
  reg  mdseac_locked_f; // @[el2_dec_tlu_ctl.scala 686:89]
  wire  _T_35 = ~mdseac_locked_f; // @[el2_dec_tlu_ctl.scala 427:26]
  wire  _T_36 = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_dec_tlu_ctl.scala 427:78]
  wire  nmi_lsu_detected = _T_35 & _T_36; // @[el2_dec_tlu_ctl.scala 427:43]
  wire  _T_39 = _T_38 | nmi_lsu_detected; // @[el2_dec_tlu_ctl.scala 429:57]
  reg  nmi_int_detected_f; // @[el2_dec_tlu_ctl.scala 421:72]
  reg  take_nmi_r_d1; // @[el2_dec_tlu_ctl.scala 894:90]
  wire  _T_40 = ~take_nmi_r_d1; // @[el2_dec_tlu_ctl.scala 429:100]
  wire  _T_41 = nmi_int_detected_f & _T_40; // @[el2_dec_tlu_ctl.scala 429:98]
  wire  _T_42 = _T_39 | _T_41; // @[el2_dec_tlu_ctl.scala 429:76]
  reg  take_ext_int_start_d3; // @[el2_dec_tlu_ctl.scala 826:58]
  wire  _T_43 = |io_lsu_fir_error; // @[el2_dec_tlu_ctl.scala 429:159]
  wire  _T_44 = take_ext_int_start_d3 & _T_43; // @[el2_dec_tlu_ctl.scala 429:140]
  wire  nmi_int_detected = _T_42 | _T_44; // @[el2_dec_tlu_ctl.scala 429:116]
  wire  _T_631 = ~io_dec_csr_stall_int_ff; // @[el2_dec_tlu_ctl.scala 803:22]
  wire  mstatus_mie_ns = csr_io_mstatus_mie_ns; // @[el2_dec_tlu_ctl.scala 344:41 el2_dec_tlu_ctl.scala 1082:31]
  wire  _T_632 = _T_631 & mstatus_mie_ns; // @[el2_dec_tlu_ctl.scala 803:47]
  wire [5:0] mip = csr_io_mip; // @[el2_dec_tlu_ctl.scala 350:41 el2_dec_tlu_ctl.scala 1088:31]
  wire  _T_634 = _T_632 & mip[1]; // @[el2_dec_tlu_ctl.scala 803:64]
  wire [5:0] mie_ns = csr_io_mie_ns; // @[el2_dec_tlu_ctl.scala 339:41 el2_dec_tlu_ctl.scala 1077:31]
  wire  timer_int_ready = _T_634 & mie_ns[1]; // @[el2_dec_tlu_ctl.scala 803:82]
  wire  _T_391 = nmi_int_detected | timer_int_ready; // @[el2_dec_tlu_ctl.scala 680:65]
  wire  _T_628 = _T_632 & mip[0]; // @[el2_dec_tlu_ctl.scala 802:64]
  wire  soft_int_ready = _T_628 & mie_ns[0]; // @[el2_dec_tlu_ctl.scala 802:82]
  wire  _T_392 = _T_391 | soft_int_ready; // @[el2_dec_tlu_ctl.scala 680:83]
  reg  int_timer0_int_hold_f; // @[el2_dec_tlu_ctl.scala 660:65]
  wire  _T_393 = _T_392 | int_timer0_int_hold_f; // @[el2_dec_tlu_ctl.scala 680:100]
  reg  int_timer1_int_hold_f; // @[el2_dec_tlu_ctl.scala 661:65]
  wire  _T_394 = _T_393 | int_timer1_int_hold_f; // @[el2_dec_tlu_ctl.scala 680:124]
  wire  _T_608 = _T_632 & mip[2]; // @[el2_dec_tlu_ctl.scala 799:65]
  wire  mhwakeup_ready = _T_608 & mie_ns[2]; // @[el2_dec_tlu_ctl.scala 799:83]
  wire  _T_395 = io_mhwakeup & mhwakeup_ready; // @[el2_dec_tlu_ctl.scala 680:163]
  wire  _T_396 = _T_394 | _T_395; // @[el2_dec_tlu_ctl.scala 680:148]
  wire  _T_397 = _T_396 & io_o_cpu_halt_status; // @[el2_dec_tlu_ctl.scala 680:182]
  reg  i_cpu_halt_req_d1; // @[el2_dec_tlu_ctl.scala 652:80]
  wire  _T_398 = ~i_cpu_halt_req_d1; // @[el2_dec_tlu_ctl.scala 680:207]
  wire  _T_399 = _T_397 & _T_398; // @[el2_dec_tlu_ctl.scala 680:205]
  wire  i_cpu_run_req_d1 = i_cpu_run_req_d1_raw | _T_399; // @[el2_dec_tlu_ctl.scala 680:44]
  wire  _T_14 = debug_mode_status | i_cpu_run_req_d1; // @[el2_dec_tlu_ctl.scala 396:49]
  wire  _T_685 = ~_T_43; // @[el2_dec_tlu_ctl.scala 831:45]
  wire  take_ext_int = take_ext_int_start_d3 & _T_685; // @[el2_dec_tlu_ctl.scala 831:43]
  wire  _T_698 = ~soft_int_ready; // @[el2_dec_tlu_ctl.scala 848:39]
  wire  _T_699 = timer_int_ready & _T_698; // @[el2_dec_tlu_ctl.scala 848:37]
  wire  _T_617 = ~io_lsu_fastint_stall_any; // @[el2_dec_tlu_ctl.scala 800:103]
  wire  ext_int_ready = mhwakeup_ready & _T_617; // @[el2_dec_tlu_ctl.scala 800:101]
  wire  _T_700 = ~ext_int_ready; // @[el2_dec_tlu_ctl.scala 848:57]
  wire  _T_701 = _T_699 & _T_700; // @[el2_dec_tlu_ctl.scala 848:55]
  wire  _T_622 = _T_632 & mip[5]; // @[el2_dec_tlu_ctl.scala 801:64]
  wire  ce_int_ready = _T_622 & mie_ns[5]; // @[el2_dec_tlu_ctl.scala 801:82]
  wire  _T_702 = ~ce_int_ready; // @[el2_dec_tlu_ctl.scala 848:74]
  wire  _T_703 = _T_701 & _T_702; // @[el2_dec_tlu_ctl.scala 848:72]
  wire  _T_152 = ~debug_mode_status; // @[el2_dec_tlu_ctl.scala 503:31]
  reg  dbg_halt_req_held; // @[el2_dec_tlu_ctl.scala 546:81]
  wire  _T_106 = io_dbg_halt_req | dbg_halt_req_held; // @[el2_dec_tlu_ctl.scala 480:42]
  reg  ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 827:58]
  wire  _T_107 = ~ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 480:65]
  wire  dbg_halt_req_final = _T_106 & _T_107; // @[el2_dec_tlu_ctl.scala 480:63]
  wire  mpc_debug_halt_req_sync = mpc_debug_halt_req_sync_raw & _T_107; // @[el2_dec_tlu_ctl.scala 439:61]
  wire  _T_109 = dbg_halt_req_final | mpc_debug_halt_req_sync; // @[el2_dec_tlu_ctl.scala 483:44]
  reg  reset_detect; // @[el2_dec_tlu_ctl.scala 416:80]
  reg  reset_detected; // @[el2_dec_tlu_ctl.scala 417:80]
  wire  reset_delayed = reset_detect ^ reset_detected; // @[el2_dec_tlu_ctl.scala 418:64]
  wire  _T_110 = ~io_mpc_reset_run_req; // @[el2_dec_tlu_ctl.scala 483:89]
  wire  _T_111 = reset_delayed & _T_110; // @[el2_dec_tlu_ctl.scala 483:87]
  wire  _T_112 = _T_109 | _T_111; // @[el2_dec_tlu_ctl.scala 483:70]
  wire  _T_114 = _T_112 & _T_152; // @[el2_dec_tlu_ctl.scala 483:113]
  wire  debug_halt_req = _T_114 & _T_107; // @[el2_dec_tlu_ctl.scala 483:141]
  wire  _T_153 = _T_152 & debug_halt_req; // @[el2_dec_tlu_ctl.scala 503:57]
  reg  dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 538:81]
  wire  _T_154 = _T_153 | dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 503:75]
  reg  trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 537:81]
  wire  _T_155 = _T_154 | trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 503:101]
  reg  ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 752:58]
  wire  enter_debug_halt_req = _T_155 | ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 503:126]
  reg  debug_halt_req_f; // @[el2_dec_tlu_ctl.scala 535:81]
  wire  force_halt = csr_io_force_halt; // @[el2_dec_tlu_ctl.scala 342:57 el2_dec_tlu_ctl.scala 1080:31]
  reg  lsu_idle_any_f; // @[el2_dec_tlu_ctl.scala 531:89]
  wire  _T_142 = io_lsu_idle_any & lsu_idle_any_f; // @[el2_dec_tlu_ctl.scala 497:47]
  wire  _T_143 = _T_142 & io_ifu_miss_state_idle; // @[el2_dec_tlu_ctl.scala 497:64]
  reg  ifu_miss_state_idle_f; // @[el2_dec_tlu_ctl.scala 532:73]
  wire  _T_144 = _T_143 & ifu_miss_state_idle_f; // @[el2_dec_tlu_ctl.scala 497:89]
  wire  _T_145 = ~debug_halt_req; // @[el2_dec_tlu_ctl.scala 497:115]
  wire  _T_146 = _T_144 & _T_145; // @[el2_dec_tlu_ctl.scala 497:113]
  reg  debug_halt_req_d1; // @[el2_dec_tlu_ctl.scala 539:81]
  wire  _T_147 = ~debug_halt_req_d1; // @[el2_dec_tlu_ctl.scala 497:133]
  wire  _T_148 = _T_146 & _T_147; // @[el2_dec_tlu_ctl.scala 497:131]
  wire  _T_149 = ~io_dec_div_active; // @[el2_dec_tlu_ctl.scala 497:154]
  wire  _T_150 = _T_148 & _T_149; // @[el2_dec_tlu_ctl.scala 497:152]
  wire  core_empty = force_halt | _T_150; // @[el2_dec_tlu_ctl.scala 497:28]
  wire  _T_163 = debug_halt_req_f & core_empty; // @[el2_dec_tlu_ctl.scala 513:42]
  reg  dec_tlu_flush_noredir_r_d1; // @[el2_dec_tlu_ctl.scala 529:73]
  reg  dec_tlu_flush_pause_r_d1; // @[el2_dec_tlu_ctl.scala 545:73]
  wire  _T_132 = ~dec_tlu_flush_pause_r_d1; // @[el2_dec_tlu_ctl.scala 493:50]
  wire  _T_133 = dec_tlu_flush_noredir_r_d1 & _T_132; // @[el2_dec_tlu_ctl.scala 493:48]
  reg  take_ext_int_start_d1; // @[el2_dec_tlu_ctl.scala 824:58]
  wire  _T_134 = ~take_ext_int_start_d1; // @[el2_dec_tlu_ctl.scala 493:78]
  wire  _T_135 = _T_133 & _T_134; // @[el2_dec_tlu_ctl.scala 493:76]
  reg  halt_taken_f; // @[el2_dec_tlu_ctl.scala 530:81]
  reg  dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 533:81]
  wire  _T_136 = ~dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 493:120]
  wire  _T_137 = halt_taken_f & _T_136; // @[el2_dec_tlu_ctl.scala 493:118]
  reg  pmu_fw_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 659:73]
  wire  _T_138 = ~pmu_fw_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 493:140]
  wire  _T_139 = _T_137 & _T_138; // @[el2_dec_tlu_ctl.scala 493:138]
  reg  interrupt_valid_r_d1; // @[el2_dec_tlu_ctl.scala 888:82]
  wire  _T_140 = ~interrupt_valid_r_d1; // @[el2_dec_tlu_ctl.scala 493:163]
  wire  _T_141 = _T_139 & _T_140; // @[el2_dec_tlu_ctl.scala 493:161]
  wire  halt_taken = _T_135 | _T_141; // @[el2_dec_tlu_ctl.scala 493:102]
  wire  _T_164 = _T_163 & halt_taken; // @[el2_dec_tlu_ctl.scala 513:55]
  reg  debug_resume_req_f; // @[el2_dec_tlu_ctl.scala 536:81]
  wire  _T_165 = ~debug_resume_req_f; // @[el2_dec_tlu_ctl.scala 513:91]
  wire  _T_166 = dbg_tlu_halted_f & _T_165; // @[el2_dec_tlu_ctl.scala 513:89]
  wire  dbg_tlu_halted = _T_164 | _T_166; // @[el2_dec_tlu_ctl.scala 513:69]
  wire  _T_167 = ~dbg_tlu_halted; // @[el2_dec_tlu_ctl.scala 514:67]
  wire  _T_168 = debug_halt_req_f & _T_167; // @[el2_dec_tlu_ctl.scala 514:65]
  wire  debug_halt_req_ns = enter_debug_halt_req | _T_168; // @[el2_dec_tlu_ctl.scala 514:45]
  wire [15:0] dcsr = csr_io_dcsr; // @[el2_dec_tlu_ctl.scala 348:41 el2_dec_tlu_ctl.scala 1086:31]
  wire  _T_157 = ~dcsr[2]; // @[el2_dec_tlu_ctl.scala 506:100]
  wire  _T_158 = debug_resume_req_f & _T_157; // @[el2_dec_tlu_ctl.scala 506:98]
  wire  _T_159 = ~_T_158; // @[el2_dec_tlu_ctl.scala 506:77]
  wire  _T_160 = debug_mode_status & _T_159; // @[el2_dec_tlu_ctl.scala 506:75]
  wire  internal_dbg_halt_mode = debug_halt_req_ns | _T_160; // @[el2_dec_tlu_ctl.scala 506:47]
  wire  _T_177 = debug_resume_req_f & dcsr[2]; // @[el2_dec_tlu_ctl.scala 519:54]
  reg  dcsr_single_step_running_f; // @[el2_dec_tlu_ctl.scala 544:73]
  wire  _T_178 = ~dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 519:105]
  wire  _T_179 = dcsr_single_step_running_f & _T_178; // @[el2_dec_tlu_ctl.scala 519:103]
  wire  dcsr_single_step_running = _T_177 | _T_179; // @[el2_dec_tlu_ctl.scala 519:73]
  wire  _T_665 = ~dcsr_single_step_running; // @[el2_dec_tlu_ctl.scala 820:54]
  wire  _T_666 = _T_665 | io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 820:80]
  wire  _T_667 = internal_dbg_halt_mode & _T_666; // @[el2_dec_tlu_ctl.scala 820:51]
  wire  _T_346 = ~io_dec_tlu_debug_mode; // @[el2_dec_tlu_ctl.scala 649:56]
  wire  _T_347 = i_cpu_halt_req_sync & _T_346; // @[el2_dec_tlu_ctl.scala 649:54]
  wire  i_cpu_halt_req_sync_qual = _T_347 & _T_107; // @[el2_dec_tlu_ctl.scala 649:79]
  wire  ext_halt_pulse = i_cpu_halt_req_sync_qual & _T_398; // @[el2_dec_tlu_ctl.scala 665:49]
  wire  fw_halt_req = csr_io_fw_halt_req; // @[el2_dec_tlu_ctl.scala 346:41 el2_dec_tlu_ctl.scala 1084:31]
  wire  enter_pmu_fw_halt_req = ext_halt_pulse | fw_halt_req; // @[el2_dec_tlu_ctl.scala 666:47]
  reg  pmu_fw_halt_req_f; // @[el2_dec_tlu_ctl.scala 658:73]
  wire  _T_371 = pmu_fw_halt_req_f & core_empty; // @[el2_dec_tlu_ctl.scala 671:44]
  wire  _T_372 = _T_371 & halt_taken; // @[el2_dec_tlu_ctl.scala 671:57]
  wire  _T_373 = ~enter_debug_halt_req; // @[el2_dec_tlu_ctl.scala 671:72]
  wire  _T_374 = _T_372 & _T_373; // @[el2_dec_tlu_ctl.scala 671:70]
  wire  _T_375 = ~i_cpu_run_req_d1; // @[el2_dec_tlu_ctl.scala 671:120]
  wire  _T_376 = pmu_fw_tlu_halted_f & _T_375; // @[el2_dec_tlu_ctl.scala 671:118]
  wire  _T_377 = _T_374 | _T_376; // @[el2_dec_tlu_ctl.scala 671:95]
  wire  _T_378 = ~debug_halt_req_f; // @[el2_dec_tlu_ctl.scala 671:142]
  wire  pmu_fw_tlu_halted = _T_377 & _T_378; // @[el2_dec_tlu_ctl.scala 671:140]
  wire  _T_361 = ~pmu_fw_tlu_halted; // @[el2_dec_tlu_ctl.scala 667:71]
  wire  _T_362 = pmu_fw_halt_req_f & _T_361; // @[el2_dec_tlu_ctl.scala 667:69]
  wire  _T_363 = enter_pmu_fw_halt_req | _T_362; // @[el2_dec_tlu_ctl.scala 667:48]
  wire  pmu_fw_halt_req_ns = _T_363 & _T_378; // @[el2_dec_tlu_ctl.scala 667:92]
  reg  internal_pmu_fw_halt_mode_f; // @[el2_dec_tlu_ctl.scala 657:66]
  wire  _T_367 = internal_pmu_fw_halt_mode_f & _T_375; // @[el2_dec_tlu_ctl.scala 668:82]
  wire  _T_369 = _T_367 & _T_378; // @[el2_dec_tlu_ctl.scala 668:102]
  wire  internal_pmu_fw_halt_mode = pmu_fw_halt_req_ns | _T_369; // @[el2_dec_tlu_ctl.scala 668:51]
  wire  _T_668 = _T_667 | internal_pmu_fw_halt_mode; // @[el2_dec_tlu_ctl.scala 820:106]
  wire  _T_669 = _T_668 | i_cpu_halt_req_d1; // @[el2_dec_tlu_ctl.scala 820:134]
  wire  _T_738 = ~internal_pmu_fw_halt_mode; // @[el2_dec_tlu_ctl.scala 852:34]
  wire  _T_739 = nmi_int_detected & _T_738; // @[el2_dec_tlu_ctl.scala 852:32]
  wire  _T_740 = ~internal_dbg_halt_mode; // @[el2_dec_tlu_ctl.scala 852:64]
  wire  _T_742 = dcsr_single_step_running_f & dcsr[11]; // @[el2_dec_tlu_ctl.scala 852:118]
  wire  _T_743 = ~io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 852:140]
  wire  _T_744 = _T_742 & _T_743; // @[el2_dec_tlu_ctl.scala 852:138]
  wire  _T_746 = _T_744 & _T_178; // @[el2_dec_tlu_ctl.scala 852:163]
  wire  _T_747 = _T_740 | _T_746; // @[el2_dec_tlu_ctl.scala 852:88]
  wire  _T_748 = _T_739 & _T_747; // @[el2_dec_tlu_ctl.scala 852:61]
  wire  _T_463 = io_dec_tlu_packet_r_pmu_i0_itype == 4'h8; // @[el2_dec_tlu_ctl.scala 738:51]
  wire  _T_464 = _T_463 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 738:64]
  wire  _T_297 = io_dec_tlu_flush_lower_wb | io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 600:57]
  wire [3:0] _T_299 = _T_297 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_300 = ~_T_299; // @[el2_dec_tlu_ctl.scala 600:22]
  wire [3:0] _T_292 = io_dec_tlu_i0_valid_r ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_294 = _T_292 & io_dec_tlu_packet_r_i0trigger; // @[el2_dec_tlu_ctl.scala 598:52]
  wire [9:0] mtdata1_t_3 = csr_io_mtdata1_t_3; // @[el2_dec_tlu_ctl.scala 236:59 el2_dec_tlu_ctl.scala 1089:33]
  wire [9:0] mtdata1_t_2 = csr_io_mtdata1_t_2; // @[el2_dec_tlu_ctl.scala 236:59 el2_dec_tlu_ctl.scala 1089:33]
  wire [9:0] mtdata1_t_1 = csr_io_mtdata1_t_1; // @[el2_dec_tlu_ctl.scala 236:59 el2_dec_tlu_ctl.scala 1089:33]
  wire [9:0] mtdata1_t_0 = csr_io_mtdata1_t_0; // @[el2_dec_tlu_ctl.scala 236:59 el2_dec_tlu_ctl.scala 1089:33]
  wire [3:0] trigger_execute = {mtdata1_t_3[2],mtdata1_t_2[2],mtdata1_t_1[2],mtdata1_t_0[2]}; // @[Cat.scala 29:58]
  wire [3:0] trigger_data = {mtdata1_t_3[7],mtdata1_t_2[7],mtdata1_t_1[7],mtdata1_t_0[7]}; // @[Cat.scala 29:58]
  wire [3:0] _T_279 = trigger_execute & trigger_data; // @[el2_dec_tlu_ctl.scala 590:56]
  wire  inst_acc_r_raw = io_dec_tlu_packet_r_icaf & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 746:48]
  wire [3:0] _T_281 = inst_acc_r_raw ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_282 = _T_279 & _T_281; // @[el2_dec_tlu_ctl.scala 590:71]
  wire  _T_283 = io_exu_i0_br_error_r | io_exu_i0_br_start_error_r; // @[el2_dec_tlu_ctl.scala 590:128]
  wire [3:0] _T_285 = _T_283 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_286 = _T_282 | _T_285; // @[el2_dec_tlu_ctl.scala 590:97]
  wire [3:0] i0_iside_trigger_has_pri_r = ~_T_286; // @[el2_dec_tlu_ctl.scala 590:37]
  wire [3:0] _T_295 = _T_294 & i0_iside_trigger_has_pri_r; // @[el2_dec_tlu_ctl.scala 598:89]
  wire [3:0] trigger_store = {mtdata1_t_3[1],mtdata1_t_2[1],mtdata1_t_1[1],mtdata1_t_0[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_287 = trigger_store & trigger_data; // @[el2_dec_tlu_ctl.scala 593:50]
  wire [3:0] _T_289 = io_lsu_error_pkt_r_valid ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_290 = _T_287 & _T_289; // @[el2_dec_tlu_ctl.scala 593:65]
  wire [3:0] i0_lsu_trigger_has_pri_r = ~_T_290; // @[el2_dec_tlu_ctl.scala 593:34]
  wire [3:0] _T_296 = _T_295 & i0_lsu_trigger_has_pri_r; // @[el2_dec_tlu_ctl.scala 598:118]
  wire [1:0] mstatus = csr_io_mstatus; // @[el2_dec_tlu_ctl.scala 347:41 el2_dec_tlu_ctl.scala 1085:31]
  wire  _T_259 = mtdata1_t_3[6] | mstatus[0]; // @[el2_dec_tlu_ctl.scala 587:62]
  wire  _T_261 = _T_259 & mtdata1_t_3[3]; // @[el2_dec_tlu_ctl.scala 587:86]
  wire  _T_264 = mtdata1_t_2[6] | mstatus[0]; // @[el2_dec_tlu_ctl.scala 587:150]
  wire  _T_266 = _T_264 & mtdata1_t_2[3]; // @[el2_dec_tlu_ctl.scala 587:174]
  wire  _T_269 = mtdata1_t_1[6] | mstatus[0]; // @[el2_dec_tlu_ctl.scala 587:239]
  wire  _T_271 = _T_269 & mtdata1_t_1[3]; // @[el2_dec_tlu_ctl.scala 587:263]
  wire  _T_274 = mtdata1_t_0[6] | mstatus[0]; // @[el2_dec_tlu_ctl.scala 587:328]
  wire  _T_276 = _T_274 & mtdata1_t_0[3]; // @[el2_dec_tlu_ctl.scala 587:352]
  wire [3:0] trigger_enabled = {_T_261,_T_266,_T_271,_T_276}; // @[Cat.scala 29:58]
  wire [3:0] i0trigger_qual_r = _T_296 & trigger_enabled; // @[el2_dec_tlu_ctl.scala 598:145]
  wire [3:0] i0_trigger_r = _T_300 & i0trigger_qual_r; // @[el2_dec_tlu_ctl.scala 600:83]
  wire  _T_303 = ~mtdata1_t_2[5]; // @[el2_dec_tlu_ctl.scala 603:59]
  wire  _T_305 = _T_303 | i0_trigger_r[2]; // @[el2_dec_tlu_ctl.scala 603:88]
  wire  _T_306 = i0_trigger_r[3] & _T_305; // @[el2_dec_tlu_ctl.scala 603:56]
  wire  _T_311 = _T_303 | i0_trigger_r[3]; // @[el2_dec_tlu_ctl.scala 603:156]
  wire  _T_312 = i0_trigger_r[2] & _T_311; // @[el2_dec_tlu_ctl.scala 603:124]
  wire  _T_315 = ~mtdata1_t_0[5]; // @[el2_dec_tlu_ctl.scala 603:195]
  wire  _T_317 = _T_315 | i0_trigger_r[0]; // @[el2_dec_tlu_ctl.scala 603:224]
  wire  _T_318 = i0_trigger_r[1] & _T_317; // @[el2_dec_tlu_ctl.scala 603:192]
  wire  _T_323 = _T_315 | i0_trigger_r[1]; // @[el2_dec_tlu_ctl.scala 603:292]
  wire  _T_324 = i0_trigger_r[0] & _T_323; // @[el2_dec_tlu_ctl.scala 603:260]
  wire [3:0] i0_trigger_chain_masked_r = {_T_306,_T_312,_T_318,_T_324}; // @[Cat.scala 29:58]
  wire  i0_trigger_hit_raw_r = |i0_trigger_chain_masked_r; // @[el2_dec_tlu_ctl.scala 606:56]
  wire  _T_465 = ~i0_trigger_hit_raw_r; // @[el2_dec_tlu_ctl.scala 738:90]
  wire  _T_466 = _T_464 & _T_465; // @[el2_dec_tlu_ctl.scala 738:88]
  wire  _T_468 = ~dcsr[15]; // @[el2_dec_tlu_ctl.scala 738:110]
  wire  _T_469 = _T_466 & _T_468; // @[el2_dec_tlu_ctl.scala 738:108]
  reg  tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 408:72]
  wire  _T_429 = ~tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 713:43]
  wire  _T_430 = io_dec_tlu_i0_valid_r & _T_429; // @[el2_dec_tlu_ctl.scala 713:41]
  wire  _T_432 = _T_430 & _T_283; // @[el2_dec_tlu_ctl.scala 713:65]
  reg  ic_perr_r_d1; // @[el2_dec_tlu_ctl.scala 402:81]
  reg  iccm_sbecc_r_d1; // @[el2_dec_tlu_ctl.scala 403:89]
  wire  _T_433 = ic_perr_r_d1 | iccm_sbecc_r_d1; // @[el2_dec_tlu_ctl.scala 713:137]
  wire  _T_435 = _T_433 & _T_107; // @[el2_dec_tlu_ctl.scala 713:156]
  wire  _T_436 = _T_432 | _T_435; // @[el2_dec_tlu_ctl.scala 713:120]
  wire  _T_438 = _T_436 & _T_465; // @[el2_dec_tlu_ctl.scala 713:179]
  wire  _T_410 = io_dec_tlu_i0_valid_r & _T_465; // @[el2_dec_tlu_ctl.scala 701:46]
  wire  _T_411 = ~io_lsu_error_pkt_r_bits_inst_type; // @[el2_dec_tlu_ctl.scala 701:69]
  wire  _T_412 = _T_411 & io_lsu_error_pkt_r_bits_single_ecc_error; // @[el2_dec_tlu_ctl.scala 701:104]
  wire  lsu_i0_rfnpc_r = _T_410 & _T_412; // @[el2_dec_tlu_ctl.scala 701:66]
  wire  _T_439 = ~lsu_i0_rfnpc_r; // @[el2_dec_tlu_ctl.scala 713:203]
  wire  rfpc_i0_r = _T_438 & _T_439; // @[el2_dec_tlu_ctl.scala 713:200]
  wire  _T_470 = ~rfpc_i0_r; // @[el2_dec_tlu_ctl.scala 738:132]
  wire  ebreak_r = _T_469 & _T_470; // @[el2_dec_tlu_ctl.scala 738:130]
  wire  _T_472 = io_dec_tlu_packet_r_pmu_i0_itype == 4'h9; // @[el2_dec_tlu_ctl.scala 739:51]
  wire  _T_473 = _T_472 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 739:64]
  wire  _T_475 = _T_473 & _T_465; // @[el2_dec_tlu_ctl.scala 739:88]
  wire  ecall_r = _T_475 & _T_470; // @[el2_dec_tlu_ctl.scala 739:108]
  wire  _T_523 = ebreak_r | ecall_r; // @[el2_dec_tlu_ctl.scala 766:40]
  wire  _T_478 = ~io_dec_tlu_packet_r_legal; // @[el2_dec_tlu_ctl.scala 740:17]
  wire  _T_479 = _T_478 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 740:46]
  wire  _T_481 = _T_479 & _T_465; // @[el2_dec_tlu_ctl.scala 740:70]
  wire  illegal_r = _T_481 & _T_470; // @[el2_dec_tlu_ctl.scala 740:90]
  wire  _T_524 = _T_523 | illegal_r; // @[el2_dec_tlu_ctl.scala 766:50]
  wire  _T_511 = inst_acc_r_raw & _T_470; // @[el2_dec_tlu_ctl.scala 747:32]
  wire  inst_acc_r = _T_511 & _T_465; // @[el2_dec_tlu_ctl.scala 747:45]
  wire  _T_525 = _T_524 | inst_acc_r; // @[el2_dec_tlu_ctl.scala 766:62]
  wire  _T_527 = _T_525 & _T_470; // @[el2_dec_tlu_ctl.scala 766:76]
  wire  _T_528 = ~io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 766:91]
  wire  i0_exception_valid_r = _T_527 & _T_528; // @[el2_dec_tlu_ctl.scala 766:89]
  wire  _T_789 = i0_exception_valid_r | rfpc_i0_r; // @[el2_dec_tlu_ctl.scala 865:48]
  wire  _T_402 = ~io_dec_tlu_flush_lower_wb; // @[el2_dec_tlu_ctl.scala 689:56]
  wire  lsu_exc_valid_r_raw = io_lsu_error_pkt_r_valid & _T_402; // @[el2_dec_tlu_ctl.scala 689:54]
  wire  _T_403 = io_lsu_error_pkt_r_valid & lsu_exc_valid_r_raw; // @[el2_dec_tlu_ctl.scala 691:39]
  wire  _T_405 = _T_403 & _T_465; // @[el2_dec_tlu_ctl.scala 691:61]
  wire  lsu_exc_valid_r = _T_405 & _T_470; // @[el2_dec_tlu_ctl.scala 691:81]
  wire  _T_790 = _T_789 | lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 865:60]
  wire  _T_490 = io_dec_tlu_packet_r_fence_i & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 743:49]
  wire  _T_492 = _T_490 & _T_465; // @[el2_dec_tlu_ctl.scala 743:73]
  wire  fence_i_r = _T_492 & _T_470; // @[el2_dec_tlu_ctl.scala 743:94]
  wire  _T_791 = _T_790 | fence_i_r; // @[el2_dec_tlu_ctl.scala 865:78]
  wire  _T_792 = _T_791 | lsu_i0_rfnpc_r; // @[el2_dec_tlu_ctl.scala 865:90]
  wire  _T_414 = io_dec_tlu_i0_valid_r & _T_470; // @[el2_dec_tlu_ctl.scala 704:49]
  wire  _T_415 = ~lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 704:64]
  wire  _T_416 = _T_414 & _T_415; // @[el2_dec_tlu_ctl.scala 704:62]
  wire  _T_417 = ~inst_acc_r; // @[el2_dec_tlu_ctl.scala 704:81]
  wire  _T_418 = _T_416 & _T_417; // @[el2_dec_tlu_ctl.scala 704:78]
  wire  _T_420 = _T_418 & _T_528; // @[el2_dec_tlu_ctl.scala 704:93]
  reg  request_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 542:81]
  wire  _T_421 = ~request_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 704:120]
  wire  _T_422 = _T_420 & _T_421; // @[el2_dec_tlu_ctl.scala 704:118]
  wire  tlu_i0_commit_cmt = _T_422 & _T_465; // @[el2_dec_tlu_ctl.scala 704:145]
  reg  iccm_repair_state_d1; // @[el2_dec_tlu_ctl.scala 401:72]
  wire  _T_444 = tlu_i0_commit_cmt & iccm_repair_state_d1; // @[el2_dec_tlu_ctl.scala 722:51]
  wire  _T_484 = io_dec_tlu_packet_r_pmu_i0_itype == 4'hc; // @[el2_dec_tlu_ctl.scala 741:51]
  wire  _T_485 = _T_484 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 741:64]
  wire  _T_487 = _T_485 & _T_465; // @[el2_dec_tlu_ctl.scala 741:88]
  wire  mret_r = _T_487 & _T_470; // @[el2_dec_tlu_ctl.scala 741:108]
  wire  _T_446 = _T_523 | mret_r; // @[el2_dec_tlu_ctl.scala 722:97]
  wire  take_reset = reset_delayed & io_mpc_reset_run_req; // @[el2_dec_tlu_ctl.scala 851:31]
  wire  _T_447 = _T_446 | take_reset; // @[el2_dec_tlu_ctl.scala 722:106]
  wire  _T_448 = _T_447 | illegal_r; // @[el2_dec_tlu_ctl.scala 722:119]
  wire  _T_449 = io_dec_csr_wraddr_r == 12'h7c2; // @[el2_dec_tlu_ctl.scala 722:175]
  wire  _T_450 = dec_csr_wen_r_mod & _T_449; // @[el2_dec_tlu_ctl.scala 722:152]
  wire  _T_451 = _T_448 | _T_450; // @[el2_dec_tlu_ctl.scala 722:131]
  wire  _T_452 = ~_T_451; // @[el2_dec_tlu_ctl.scala 722:76]
  wire  iccm_repair_state_rfnpc = _T_444 & _T_452; // @[el2_dec_tlu_ctl.scala 722:74]
  wire  _T_793 = _T_792 | iccm_repair_state_rfnpc; // @[el2_dec_tlu_ctl.scala 865:107]
  wire  _T_794 = _T_793 | debug_resume_req_f; // @[el2_dec_tlu_ctl.scala 865:134]
  wire  _T_786 = i_cpu_run_req_d1 & pmu_fw_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 863:42]
  wire  _T_211 = ~io_dec_pause_state; // @[el2_dec_tlu_ctl.scala 562:22]
  reg  dec_pause_state_f; // @[el2_dec_tlu_ctl.scala 541:73]
  wire  _T_212 = _T_211 & dec_pause_state_f; // @[el2_dec_tlu_ctl.scala 562:42]
  wire  _T_213 = ext_int_ready | ce_int_ready; // @[el2_dec_tlu_ctl.scala 562:80]
  wire  _T_214 = _T_213 | timer_int_ready; // @[el2_dec_tlu_ctl.scala 562:95]
  wire  _T_215 = _T_214 | soft_int_ready; // @[el2_dec_tlu_ctl.scala 562:113]
  wire  _T_216 = _T_215 | int_timer0_int_hold_f; // @[el2_dec_tlu_ctl.scala 562:130]
  wire  _T_217 = _T_216 | int_timer1_int_hold_f; // @[el2_dec_tlu_ctl.scala 562:154]
  wire  _T_218 = _T_217 | nmi_int_detected; // @[el2_dec_tlu_ctl.scala 562:178]
  wire  _T_219 = _T_218 | ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 562:197]
  wire  _T_220 = ~_T_219; // @[el2_dec_tlu_ctl.scala 562:64]
  wire  _T_221 = _T_212 & _T_220; // @[el2_dec_tlu_ctl.scala 562:62]
  wire  _T_223 = _T_221 & _T_140; // @[el2_dec_tlu_ctl.scala 562:218]
  wire  _T_225 = _T_223 & _T_378; // @[el2_dec_tlu_ctl.scala 562:242]
  wire  _T_226 = ~pmu_fw_halt_req_f; // @[el2_dec_tlu_ctl.scala 562:264]
  wire  _T_227 = _T_225 & _T_226; // @[el2_dec_tlu_ctl.scala 562:262]
  wire  _T_228 = ~halt_taken_f; // @[el2_dec_tlu_ctl.scala 562:285]
  wire  pause_expired_r = _T_227 & _T_228; // @[el2_dec_tlu_ctl.scala 562:283]
  wire  sel_npc_resume = _T_786 | pause_expired_r; // @[el2_dec_tlu_ctl.scala 863:65]
  wire  _T_795 = _T_794 | sel_npc_resume; // @[el2_dec_tlu_ctl.scala 865:156]
  reg  dec_tlu_wr_pause_r_d1; // @[el2_dec_tlu_ctl.scala 540:73]
  wire  _T_796 = _T_795 | dec_tlu_wr_pause_r_d1; // @[el2_dec_tlu_ctl.scala 865:174]
  wire  synchronous_flush_r = _T_796 | i0_trigger_hit_raw_r; // @[el2_dec_tlu_ctl.scala 865:200]
  wire  _T_749 = ~synchronous_flush_r; // @[el2_dec_tlu_ctl.scala 852:194]
  wire  _T_750 = _T_748 & _T_749; // @[el2_dec_tlu_ctl.scala 852:192]
  wire  _T_751 = ~mret_r; // @[el2_dec_tlu_ctl.scala 852:217]
  wire  _T_752 = _T_750 & _T_751; // @[el2_dec_tlu_ctl.scala 852:215]
  wire  _T_753 = ~take_reset; // @[el2_dec_tlu_ctl.scala 852:227]
  wire  _T_754 = _T_752 & _T_753; // @[el2_dec_tlu_ctl.scala 852:225]
  wire  _T_519 = _T_466 & dcsr[15]; // @[el2_dec_tlu_ctl.scala 750:120]
  wire  ebreak_to_debug_mode_r = _T_519 & _T_470; // @[el2_dec_tlu_ctl.scala 750:141]
  wire  _T_755 = ~ebreak_to_debug_mode_r; // @[el2_dec_tlu_ctl.scala 852:241]
  wire  _T_756 = _T_754 & _T_755; // @[el2_dec_tlu_ctl.scala 852:239]
  wire  _T_760 = _T_107 | _T_44; // @[el2_dec_tlu_ctl.scala 852:287]
  wire  take_nmi = _T_756 & _T_760; // @[el2_dec_tlu_ctl.scala 852:265]
  wire  _T_670 = _T_669 | take_nmi; // @[el2_dec_tlu_ctl.scala 820:154]
  wire  _T_671 = _T_670 | ebreak_to_debug_mode_r; // @[el2_dec_tlu_ctl.scala 820:165]
  wire  _T_672 = _T_671 | synchronous_flush_r; // @[el2_dec_tlu_ctl.scala 820:190]
  reg  exc_or_int_valid_r_d1; // @[el2_dec_tlu_ctl.scala 890:82]
  wire  _T_673 = _T_672 | exc_or_int_valid_r_d1; // @[el2_dec_tlu_ctl.scala 820:213]
  wire  _T_674 = _T_673 | mret_r; // @[el2_dec_tlu_ctl.scala 820:237]
  wire  block_interrupts = _T_674 | ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 820:246]
  wire  _T_704 = ~block_interrupts; // @[el2_dec_tlu_ctl.scala 848:90]
  wire  take_timer_int = _T_703 & _T_704; // @[el2_dec_tlu_ctl.scala 848:88]
  wire  _T_762 = take_ext_int | take_timer_int; // @[el2_dec_tlu_ctl.scala 855:37]
  wire  _T_693 = soft_int_ready & _T_700; // @[el2_dec_tlu_ctl.scala 847:35]
  wire  _T_695 = _T_693 & _T_702; // @[el2_dec_tlu_ctl.scala 847:52]
  wire  take_soft_int = _T_695 & _T_704; // @[el2_dec_tlu_ctl.scala 847:68]
  wire  _T_763 = _T_762 | take_soft_int; // @[el2_dec_tlu_ctl.scala 855:54]
  wire  _T_764 = _T_763 | take_nmi; // @[el2_dec_tlu_ctl.scala 855:70]
  wire  _T_689 = ce_int_ready & _T_700; // @[el2_dec_tlu_ctl.scala 846:32]
  wire  take_ce_int = _T_689 & _T_704; // @[el2_dec_tlu_ctl.scala 846:49]
  wire  _T_765 = _T_764 | take_ce_int; // @[el2_dec_tlu_ctl.scala 855:81]
  wire  int_timer0_int_possible = mstatus_mie_ns & mie_ns[4]; // @[el2_dec_tlu_ctl.scala 806:48]
  wire  int_timer0_int_ready = mip[4] & int_timer0_int_possible; // @[el2_dec_tlu_ctl.scala 807:46]
  wire  _T_706 = int_timer0_int_ready | int_timer0_int_hold_f; // @[el2_dec_tlu_ctl.scala 849:48]
  wire  _T_707 = _T_706 & int_timer0_int_possible; // @[el2_dec_tlu_ctl.scala 849:73]
  wire  _T_709 = _T_707 & _T_631; // @[el2_dec_tlu_ctl.scala 849:99]
  wire  _T_710 = ~timer_int_ready; // @[el2_dec_tlu_ctl.scala 849:128]
  wire  _T_711 = _T_709 & _T_710; // @[el2_dec_tlu_ctl.scala 849:126]
  wire  _T_713 = _T_711 & _T_698; // @[el2_dec_tlu_ctl.scala 849:145]
  wire  _T_715 = _T_713 & _T_700; // @[el2_dec_tlu_ctl.scala 849:163]
  wire  _T_717 = _T_715 & _T_702; // @[el2_dec_tlu_ctl.scala 849:180]
  wire  take_int_timer0_int = _T_717 & _T_704; // @[el2_dec_tlu_ctl.scala 849:196]
  wire  _T_766 = _T_765 | take_int_timer0_int; // @[el2_dec_tlu_ctl.scala 855:95]
  wire  int_timer1_int_possible = mstatus_mie_ns & mie_ns[3]; // @[el2_dec_tlu_ctl.scala 808:48]
  wire  int_timer1_int_ready = mip[3] & int_timer1_int_possible; // @[el2_dec_tlu_ctl.scala 809:46]
  wire  _T_720 = int_timer1_int_ready | int_timer1_int_hold_f; // @[el2_dec_tlu_ctl.scala 850:48]
  wire  _T_721 = _T_720 & int_timer1_int_possible; // @[el2_dec_tlu_ctl.scala 850:73]
  wire  _T_723 = _T_721 & _T_631; // @[el2_dec_tlu_ctl.scala 850:99]
  wire  _T_725 = ~_T_706; // @[el2_dec_tlu_ctl.scala 850:128]
  wire  _T_726 = _T_723 & _T_725; // @[el2_dec_tlu_ctl.scala 850:126]
  wire  _T_728 = _T_726 & _T_710; // @[el2_dec_tlu_ctl.scala 850:176]
  wire  _T_730 = _T_728 & _T_698; // @[el2_dec_tlu_ctl.scala 850:195]
  wire  _T_732 = _T_730 & _T_700; // @[el2_dec_tlu_ctl.scala 850:213]
  wire  _T_734 = _T_732 & _T_702; // @[el2_dec_tlu_ctl.scala 850:230]
  wire  take_int_timer1_int = _T_734 & _T_704; // @[el2_dec_tlu_ctl.scala 850:246]
  wire  interrupt_valid_r = _T_766 | take_int_timer1_int; // @[el2_dec_tlu_ctl.scala 855:117]
  wire  _T_15 = _T_14 | interrupt_valid_r; // @[el2_dec_tlu_ctl.scala 396:68]
  wire  _T_16 = _T_15 | interrupt_valid_r_d1; // @[el2_dec_tlu_ctl.scala 396:88]
  wire  _T_17 = _T_16 | reset_delayed; // @[el2_dec_tlu_ctl.scala 396:111]
  wire  _T_18 = _T_17 | pause_expired_r; // @[el2_dec_tlu_ctl.scala 396:127]
  reg  pause_expired_wb; // @[el2_dec_tlu_ctl.scala 895:90]
  wire  _T_19 = _T_18 | pause_expired_wb; // @[el2_dec_tlu_ctl.scala 396:145]
  wire  _T_496 = io_ifu_ic_error_start & _T_107; // @[el2_dec_tlu_ctl.scala 744:42]
  wire  _T_498 = _T_152 | dcsr_single_step_running; // @[el2_dec_tlu_ctl.scala 744:92]
  wire  _T_499 = _T_496 & _T_498; // @[el2_dec_tlu_ctl.scala 744:63]
  wire  _T_500 = ~internal_pmu_fw_halt_mode_f; // @[el2_dec_tlu_ctl.scala 744:122]
  wire  ic_perr_r = _T_499 & _T_500; // @[el2_dec_tlu_ctl.scala 744:120]
  wire  _T_20 = _T_19 | ic_perr_r; // @[el2_dec_tlu_ctl.scala 396:164]
  wire  _T_21 = _T_20 | ic_perr_r_d1; // @[el2_dec_tlu_ctl.scala 396:176]
  wire  _T_503 = io_ifu_iccm_rd_ecc_single_err & _T_107; // @[el2_dec_tlu_ctl.scala 745:50]
  wire  _T_506 = _T_503 & _T_498; // @[el2_dec_tlu_ctl.scala 745:71]
  wire  iccm_sbecc_r = _T_506 & _T_500; // @[el2_dec_tlu_ctl.scala 745:128]
  wire  _T_22 = _T_21 | iccm_sbecc_r; // @[el2_dec_tlu_ctl.scala 396:191]
  wire  _T_23 = _T_22 | iccm_sbecc_r_d1; // @[el2_dec_tlu_ctl.scala 396:206]
  wire  flush_clkvalid = _T_23 | io_dec_tlu_dec_clk_override; // @[el2_dec_tlu_ctl.scala 396:224]
  reg  lsu_pmu_load_external_r; // @[el2_dec_tlu_ctl.scala 406:72]
  reg  lsu_pmu_store_external_r; // @[el2_dec_tlu_ctl.scala 407:64]
  reg  _T_32; // @[el2_dec_tlu_ctl.scala 409:65]
  reg  internal_dbg_halt_mode_f2; // @[el2_dec_tlu_ctl.scala 410:64]
  reg  _T_33; // @[el2_dec_tlu_ctl.scala 411:73]
  reg  nmi_lsu_load_type_f; // @[el2_dec_tlu_ctl.scala 422:72]
  reg  nmi_lsu_store_type_f; // @[el2_dec_tlu_ctl.scala 423:64]
  wire  _T_46 = nmi_lsu_detected & io_lsu_imprecise_error_load_any; // @[el2_dec_tlu_ctl.scala 431:42]
  wire  _T_49 = ~_T_41; // @[el2_dec_tlu_ctl.scala 431:78]
  wire  _T_50 = _T_46 & _T_49; // @[el2_dec_tlu_ctl.scala 431:76]
  wire  _T_52 = nmi_lsu_load_type_f & _T_40; // @[el2_dec_tlu_ctl.scala 431:141]
  wire  _T_54 = nmi_lsu_detected & io_lsu_imprecise_error_store_any; // @[el2_dec_tlu_ctl.scala 432:43]
  wire  _T_58 = _T_54 & _T_49; // @[el2_dec_tlu_ctl.scala 432:78]
  wire  _T_60 = nmi_lsu_store_type_f & _T_40; // @[el2_dec_tlu_ctl.scala 432:144]
  reg  mpc_debug_halt_req_sync_f; // @[el2_dec_tlu_ctl.scala 440:64]
  reg  mpc_debug_run_req_sync_f; // @[el2_dec_tlu_ctl.scala 441:64]
  reg  mpc_run_state_f; // @[el2_dec_tlu_ctl.scala 443:80]
  reg  debug_brkpt_status_f; // @[el2_dec_tlu_ctl.scala 444:72]
  reg  mpc_debug_halt_ack_f; // @[el2_dec_tlu_ctl.scala 445:72]
  reg  mpc_debug_run_ack_f; // @[el2_dec_tlu_ctl.scala 446:80]
  reg  dbg_run_state_f; // @[el2_dec_tlu_ctl.scala 448:80]
  reg  _T_65; // @[el2_dec_tlu_ctl.scala 449:73]
  wire  _T_66 = ~mpc_debug_halt_req_sync_f; // @[el2_dec_tlu_ctl.scala 453:65]
  wire  mpc_debug_halt_req_sync_pulse = mpc_debug_halt_req_sync & _T_66; // @[el2_dec_tlu_ctl.scala 453:63]
  wire  _T_67 = ~mpc_debug_run_req_sync_f; // @[el2_dec_tlu_ctl.scala 454:64]
  wire  mpc_debug_run_req_sync_pulse = mpc_debug_run_req_sync & _T_67; // @[el2_dec_tlu_ctl.scala 454:62]
  wire  _T_68 = mpc_halt_state_f | mpc_debug_halt_req_sync_pulse; // @[el2_dec_tlu_ctl.scala 456:42]
  wire  _T_71 = _T_68 | _T_111; // @[el2_dec_tlu_ctl.scala 456:74]
  wire  _T_72 = ~mpc_debug_run_req_sync; // @[el2_dec_tlu_ctl.scala 456:119]
  wire  mpc_halt_state_ns = _T_71 & _T_72; // @[el2_dec_tlu_ctl.scala 456:117]
  wire  _T_74 = ~mpc_debug_run_ack_f; // @[el2_dec_tlu_ctl.scala 457:74]
  wire  _T_75 = mpc_debug_run_req_sync_pulse & _T_74; // @[el2_dec_tlu_ctl.scala 457:72]
  wire  _T_76 = mpc_run_state_f | _T_75; // @[el2_dec_tlu_ctl.scala 457:40]
  wire  _T_77 = ~dcsr_single_step_running_f; // @[el2_dec_tlu_ctl.scala 457:127]
  wire  _T_78 = debug_mode_status & _T_77; // @[el2_dec_tlu_ctl.scala 457:125]
  wire  mpc_run_state_ns = _T_76 & _T_78; // @[el2_dec_tlu_ctl.scala 457:97]
  wire  _T_80 = dbg_halt_req_final | dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 459:64]
  wire  _T_81 = _T_80 | trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 459:90]
  wire  _T_82 = _T_81 | ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 459:115]
  wire  _T_83 = dbg_halt_state_f | _T_82; // @[el2_dec_tlu_ctl.scala 459:42]
  wire  _T_84 = ~io_dbg_resume_req; // @[el2_dec_tlu_ctl.scala 459:147]
  wire  dbg_halt_state_ns = _T_83 & _T_84; // @[el2_dec_tlu_ctl.scala 459:145]
  wire  _T_86 = dbg_run_state_f | io_dbg_resume_req; // @[el2_dec_tlu_ctl.scala 460:40]
  wire  dbg_run_state_ns = _T_86 & _T_78; // @[el2_dec_tlu_ctl.scala 460:61]
  wire  debug_brkpt_valid = ebreak_to_debug_mode_r_d1 | trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 466:53]
  wire  _T_92 = debug_brkpt_valid | debug_brkpt_status_f; // @[el2_dec_tlu_ctl.scala 467:47]
  wire  _T_94 = internal_dbg_halt_mode & _T_77; // @[el2_dec_tlu_ctl.scala 467:97]
  wire  _T_96 = mpc_halt_state_f & debug_mode_status; // @[el2_dec_tlu_ctl.scala 470:45]
  wire  _T_97 = _T_96 & mpc_debug_halt_req_sync; // @[el2_dec_tlu_ctl.scala 470:72]
  wire  _T_99 = ~dbg_halt_state_ns; // @[el2_dec_tlu_ctl.scala 471:53]
  wire  _T_100 = mpc_debug_run_req_sync & _T_99; // @[el2_dec_tlu_ctl.scala 471:51]
  wire  _T_101 = ~mpc_debug_halt_req_sync; // @[el2_dec_tlu_ctl.scala 471:74]
  wire  _T_102 = _T_100 & _T_101; // @[el2_dec_tlu_ctl.scala 471:72]
  wire  _T_103 = mpc_debug_run_ack_f & mpc_debug_run_req_sync; // @[el2_dec_tlu_ctl.scala 471:123]
  wire  _T_118 = mpc_run_state_ns & _T_99; // @[el2_dec_tlu_ctl.scala 485:67]
  wire  _T_119 = ~mpc_halt_state_ns; // @[el2_dec_tlu_ctl.scala 485:111]
  wire  _T_120 = dbg_run_state_ns & _T_119; // @[el2_dec_tlu_ctl.scala 485:109]
  wire  _T_121 = _T_118 | _T_120; // @[el2_dec_tlu_ctl.scala 485:89]
  wire  _T_122 = debug_halt_req_f | pmu_fw_halt_req_f; // @[el2_dec_tlu_ctl.scala 490:37]
  wire  _T_124 = _T_122 & _T_749; // @[el2_dec_tlu_ctl.scala 490:58]
  wire  _T_126 = _T_124 & _T_751; // @[el2_dec_tlu_ctl.scala 490:81]
  wire  _T_128 = _T_126 & _T_228; // @[el2_dec_tlu_ctl.scala 490:91]
  wire  _T_129 = ~dec_tlu_flush_noredir_r_d1; // @[el2_dec_tlu_ctl.scala 490:109]
  wire  _T_130 = _T_128 & _T_129; // @[el2_dec_tlu_ctl.scala 490:107]
  wire  take_halt = _T_130 & _T_753; // @[el2_dec_tlu_ctl.scala 490:137]
  wire  _T_170 = debug_resume_req_f & dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 515:43]
  wire  _T_172 = io_dec_tlu_i0_valid_r & _T_528; // @[el2_dec_tlu_ctl.scala 517:53]
  wire  _T_174 = _T_172 & dcsr[2]; // @[el2_dec_tlu_ctl.scala 517:78]
  wire  _T_329 = mtdata1_t_3[6] & mtdata1_t_3[9]; // @[el2_dec_tlu_ctl.scala 612:61]
  wire  _T_332 = mtdata1_t_2[6] & mtdata1_t_2[9]; // @[el2_dec_tlu_ctl.scala 612:121]
  wire  _T_335 = mtdata1_t_1[6] & mtdata1_t_1[9]; // @[el2_dec_tlu_ctl.scala 612:181]
  wire  _T_338 = mtdata1_t_0[6] & mtdata1_t_0[9]; // @[el2_dec_tlu_ctl.scala 612:241]
  wire [3:0] trigger_action = {_T_329,_T_332,_T_335,_T_338}; // @[Cat.scala 29:58]
  wire [3:0] _T_343 = i0_trigger_chain_masked_r & trigger_action; // @[el2_dec_tlu_ctl.scala 618:56]
  wire  i0_trigger_action_r = |_T_343; // @[el2_dec_tlu_ctl.scala 618:74]
  wire  trigger_hit_dmode_r = i0_trigger_hit_raw_r & i0_trigger_action_r; // @[el2_dec_tlu_ctl.scala 620:44]
  wire  _T_180 = trigger_hit_dmode_r | ebreak_to_debug_mode_r; // @[el2_dec_tlu_ctl.scala 524:51]
  wire  _T_182 = request_debug_mode_r_d1 & _T_402; // @[el2_dec_tlu_ctl.scala 524:104]
  reg  request_debug_mode_done_f; // @[el2_dec_tlu_ctl.scala 543:73]
  wire  _T_183 = request_debug_mode_r_d1 | request_debug_mode_done_f; // @[el2_dec_tlu_ctl.scala 526:58]
  reg  _T_190; // @[el2_dec_tlu_ctl.scala 534:73]
  wire  _T_201 = fence_i_r & internal_dbg_halt_mode; // @[el2_dec_tlu_ctl.scala 555:56]
  wire  _T_202 = take_halt | _T_201; // @[el2_dec_tlu_ctl.scala 555:43]
  wire  _T_203 = _T_202 | io_dec_tlu_flush_pause_r; // @[el2_dec_tlu_ctl.scala 555:82]
  wire  _T_204 = i0_trigger_hit_raw_r & trigger_hit_dmode_r; // @[el2_dec_tlu_ctl.scala 555:129]
  wire  _T_205 = _T_203 | _T_204; // @[el2_dec_tlu_ctl.scala 555:109]
  wire  take_ext_int_start = ext_int_ready & _T_704; // @[el2_dec_tlu_ctl.scala 828:41]
  wire  _T_207 = ~interrupt_valid_r; // @[el2_dec_tlu_ctl.scala 560:55]
  wire  _T_208 = dec_tlu_wr_pause_r_d1 & _T_207; // @[el2_dec_tlu_ctl.scala 560:53]
  wire  _T_209 = ~take_ext_int_start; // @[el2_dec_tlu_ctl.scala 560:76]
  wire  _T_231 = io_dec_tlu_flush_lower_r & dcsr[2]; // @[el2_dec_tlu_ctl.scala 564:60]
  wire  _T_232 = io_dec_tlu_resume_ack | dcsr_single_step_running; // @[el2_dec_tlu_ctl.scala 564:103]
  wire  _T_233 = _T_231 & _T_232; // @[el2_dec_tlu_ctl.scala 564:78]
  wire  _T_234 = ~io_dec_tlu_flush_noredir_r; // @[el2_dec_tlu_ctl.scala 564:133]
  wire [3:0] _T_342 = i0_trigger_hit_raw_r ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire  _T_345 = ~trigger_hit_dmode_r; // @[el2_dec_tlu_ctl.scala 622:54]
  wire  mepc_trigger_hit_sel_pc_r = i0_trigger_hit_raw_r & _T_345; // @[el2_dec_tlu_ctl.scala 622:52]
  wire  _T_350 = i_cpu_run_req_sync & _T_346; // @[el2_dec_tlu_ctl.scala 650:52]
  wire  _T_351 = _T_350 & pmu_fw_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 650:77]
  wire  i_cpu_run_req_sync_qual = _T_351 & _T_107; // @[el2_dec_tlu_ctl.scala 650:99]
  reg  _T_353; // @[el2_dec_tlu_ctl.scala 654:73]
  reg  _T_354; // @[el2_dec_tlu_ctl.scala 655:81]
  reg  _T_355; // @[el2_dec_tlu_ctl.scala 656:81]
  wire  _T_384 = io_o_cpu_halt_status & _T_375; // @[el2_dec_tlu_ctl.scala 674:88]
  wire  _T_386 = _T_384 & _T_152; // @[el2_dec_tlu_ctl.scala 674:108]
  wire  _T_388 = io_o_cpu_halt_status & i_cpu_run_req_sync_qual; // @[el2_dec_tlu_ctl.scala 675:40]
  wire  _T_389 = io_o_cpu_run_ack & i_cpu_run_req_sync_qual; // @[el2_dec_tlu_ctl.scala 675:87]
  reg  lsu_single_ecc_error_r_d1; // @[el2_dec_tlu_ctl.scala 687:64]
  reg  lsu_i0_exc_r_d1; // @[el2_dec_tlu_ctl.scala 694:73]
  wire  _T_408 = ~io_lsu_error_pkt_r_bits_exc_type; // @[el2_dec_tlu_ctl.scala 695:39]
  wire  lsu_exc_ma_r = lsu_exc_valid_r & _T_408; // @[el2_dec_tlu_ctl.scala 695:37]
  wire  lsu_exc_acc_r = lsu_exc_valid_r & io_lsu_error_pkt_r_bits_exc_type; // @[el2_dec_tlu_ctl.scala 696:37]
  wire  lsu_exc_st_r = lsu_exc_valid_r & io_lsu_error_pkt_r_bits_inst_type; // @[el2_dec_tlu_ctl.scala 697:37]
  wire  _T_424 = rfpc_i0_r | lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 707:37]
  wire  _T_425 = _T_424 | inst_acc_r; // @[el2_dec_tlu_ctl.scala 707:52]
  wire  _T_426 = illegal_r & io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 707:78]
  wire  _T_427 = _T_425 | _T_426; // @[el2_dec_tlu_ctl.scala 707:65]
  wire  _T_441 = ~io_dec_tlu_flush_lower_r; // @[el2_dec_tlu_ctl.scala 716:69]
  wire  _T_442 = iccm_repair_state_d1 & _T_441; // @[el2_dec_tlu_ctl.scala 716:67]
  wire  _T_453 = io_exu_i0_br_error_r & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 725:50]
  wire  _T_455 = io_exu_i0_br_start_error_r & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 726:62]
  wire  _T_457 = io_exu_i0_br_valid_r & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 727:46]
  wire  _T_459 = _T_457 & _T_429; // @[el2_dec_tlu_ctl.scala 727:70]
  wire  _T_460 = ~io_exu_i0_br_mp_r; // @[el2_dec_tlu_ctl.scala 727:97]
  wire  _T_461 = ~io_exu_pmu_i0_br_ataken; // @[el2_dec_tlu_ctl.scala 727:118]
  wire  _T_462 = _T_460 | _T_461; // @[el2_dec_tlu_ctl.scala 727:116]
  wire  _T_529 = ~take_nmi; // @[el2_dec_tlu_ctl.scala 775:21]
  wire  _T_530 = take_ext_int & _T_529; // @[el2_dec_tlu_ctl.scala 775:19]
  wire  _T_533 = take_timer_int & _T_529; // @[el2_dec_tlu_ctl.scala 776:21]
  wire  _T_536 = take_soft_int & _T_529; // @[el2_dec_tlu_ctl.scala 777:20]
  wire  _T_539 = take_int_timer0_int & _T_529; // @[el2_dec_tlu_ctl.scala 778:26]
  wire  _T_542 = take_int_timer1_int & _T_529; // @[el2_dec_tlu_ctl.scala 779:26]
  wire  _T_545 = take_ce_int & _T_529; // @[el2_dec_tlu_ctl.scala 780:18]
  wire  _T_548 = illegal_r & _T_529; // @[el2_dec_tlu_ctl.scala 781:16]
  wire  _T_551 = ecall_r & _T_529; // @[el2_dec_tlu_ctl.scala 782:15]
  wire  _T_554 = inst_acc_r & _T_529; // @[el2_dec_tlu_ctl.scala 783:18]
  wire  _T_556 = ebreak_r | i0_trigger_hit_raw_r; // @[el2_dec_tlu_ctl.scala 784:16]
  wire  _T_558 = _T_556 & _T_529; // @[el2_dec_tlu_ctl.scala 784:36]
  wire  _T_560 = ~lsu_exc_st_r; // @[el2_dec_tlu_ctl.scala 785:21]
  wire  _T_561 = lsu_exc_ma_r & _T_560; // @[el2_dec_tlu_ctl.scala 785:19]
  wire  _T_563 = _T_561 & _T_529; // @[el2_dec_tlu_ctl.scala 785:35]
  wire  _T_566 = lsu_exc_acc_r & _T_560; // @[el2_dec_tlu_ctl.scala 786:20]
  wire  _T_568 = _T_566 & _T_529; // @[el2_dec_tlu_ctl.scala 786:36]
  wire  _T_570 = lsu_exc_ma_r & lsu_exc_st_r; // @[el2_dec_tlu_ctl.scala 787:19]
  wire  _T_572 = _T_570 & _T_529; // @[el2_dec_tlu_ctl.scala 787:34]
  wire  _T_574 = lsu_exc_acc_r & lsu_exc_st_r; // @[el2_dec_tlu_ctl.scala 788:20]
  wire  _T_576 = _T_574 & _T_529; // @[el2_dec_tlu_ctl.scala 788:35]
  wire [4:0] _T_578 = _T_530 ? 5'hb : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_579 = _T_533 ? 5'h7 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_580 = _T_536 ? 5'h3 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_581 = _T_539 ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_582 = _T_542 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_583 = _T_545 ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_584 = _T_548 ? 5'h2 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_585 = _T_551 ? 5'hb : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_586 = _T_554 ? 5'h1 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_587 = _T_558 ? 5'h3 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_588 = _T_563 ? 5'h4 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_589 = _T_568 ? 5'h5 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_590 = _T_572 ? 5'h6 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_591 = _T_576 ? 5'h7 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_592 = _T_578 | _T_579; // @[Mux.scala 27:72]
  wire [4:0] _T_593 = _T_592 | _T_580; // @[Mux.scala 27:72]
  wire [4:0] _T_594 = _T_593 | _T_581; // @[Mux.scala 27:72]
  wire [4:0] _T_595 = _T_594 | _T_582; // @[Mux.scala 27:72]
  wire [4:0] _T_596 = _T_595 | _T_583; // @[Mux.scala 27:72]
  wire [4:0] _T_597 = _T_596 | _T_584; // @[Mux.scala 27:72]
  wire [4:0] _T_598 = _T_597 | _T_585; // @[Mux.scala 27:72]
  wire [4:0] _T_599 = _T_598 | _T_586; // @[Mux.scala 27:72]
  wire [4:0] _T_600 = _T_599 | _T_587; // @[Mux.scala 27:72]
  wire [4:0] _T_601 = _T_600 | _T_588; // @[Mux.scala 27:72]
  wire [4:0] _T_602 = _T_601 | _T_589; // @[Mux.scala 27:72]
  wire [4:0] _T_603 = _T_602 | _T_590; // @[Mux.scala 27:72]
  wire [4:0] exc_cause_r = _T_603 | _T_591; // @[Mux.scala 27:72]
  wire  _T_641 = io_dec_csr_stall_int_ff | synchronous_flush_r; // @[el2_dec_tlu_ctl.scala 813:51]
  wire  _T_642 = _T_641 | exc_or_int_valid_r_d1; // @[el2_dec_tlu_ctl.scala 813:73]
  wire  int_timer_stalled = _T_642 | mret_r; // @[el2_dec_tlu_ctl.scala 813:97]
  wire  _T_643 = pmu_fw_tlu_halted_f | int_timer_stalled; // @[el2_dec_tlu_ctl.scala 815:71]
  wire  _T_644 = int_timer0_int_ready & _T_643; // @[el2_dec_tlu_ctl.scala 815:48]
  wire  _T_645 = int_timer0_int_possible & int_timer0_int_hold_f; // @[el2_dec_tlu_ctl.scala 815:120]
  wire  _T_647 = _T_645 & _T_207; // @[el2_dec_tlu_ctl.scala 815:144]
  wire  _T_649 = _T_647 & _T_209; // @[el2_dec_tlu_ctl.scala 815:165]
  wire  _T_651 = _T_649 & _T_152; // @[el2_dec_tlu_ctl.scala 815:187]
  wire  _T_654 = int_timer1_int_ready & _T_643; // @[el2_dec_tlu_ctl.scala 816:48]
  wire  _T_655 = int_timer1_int_possible & int_timer1_int_hold_f; // @[el2_dec_tlu_ctl.scala 816:120]
  wire  _T_657 = _T_655 & _T_207; // @[el2_dec_tlu_ctl.scala 816:144]
  wire  _T_659 = _T_657 & _T_209; // @[el2_dec_tlu_ctl.scala 816:165]
  wire  _T_661 = _T_659 & _T_152; // @[el2_dec_tlu_ctl.scala 816:187]
  reg  take_ext_int_start_d2; // @[el2_dec_tlu_ctl.scala 825:58]
  wire  _T_681 = take_ext_int_start | take_ext_int_start_d1; // @[el2_dec_tlu_ctl.scala 830:42]
  wire  _T_682 = _T_681 | take_ext_int_start_d2; // @[el2_dec_tlu_ctl.scala 830:66]
  wire  csr_pkt_csr_meicpct = csr_read_io_csr_pkt_csr_meicpct; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  fast_int_meicpct = csr_pkt_csr_meicpct & io_dec_csr_any_unq_d; // @[el2_dec_tlu_ctl.scala 832:45]
  wire [30:0] mtvec = csr_io_mtvec; // @[el2_dec_tlu_ctl.scala 349:41 el2_dec_tlu_ctl.scala 1087:31]
  wire [30:0] _T_769 = {mtvec[30:1],1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_771 = {25'h0,exc_cause_r,1'h0}; // @[Cat.scala 29:58]
  wire [30:0] vectored_path = _T_769 + _T_771; // @[el2_dec_tlu_ctl.scala 860:50]
  wire [30:0] _T_778 = mtvec[0] ? vectored_path : _T_769; // @[el2_dec_tlu_ctl.scala 861:60]
  wire [30:0] interrupt_path = take_nmi ? io_nmi_vec : _T_778; // @[el2_dec_tlu_ctl.scala 861:27]
  wire  _T_779 = lsu_i0_rfnpc_r | fence_i_r; // @[el2_dec_tlu_ctl.scala 862:35]
  wire  _T_780 = _T_779 | iccm_repair_state_rfnpc; // @[el2_dec_tlu_ctl.scala 862:47]
  wire  _T_782 = i_cpu_run_req_d1 & _T_207; // @[el2_dec_tlu_ctl.scala 862:93]
  wire  _T_783 = _T_780 | _T_782; // @[el2_dec_tlu_ctl.scala 862:73]
  wire  _T_785 = rfpc_i0_r & _T_743; // @[el2_dec_tlu_ctl.scala 862:128]
  wire  sel_npc_r = _T_783 | _T_785; // @[el2_dec_tlu_ctl.scala 862:115]
  wire  _T_798 = interrupt_valid_r | mret_r; // @[el2_dec_tlu_ctl.scala 866:42]
  wire  _T_799 = _T_798 | synchronous_flush_r; // @[el2_dec_tlu_ctl.scala 866:51]
  wire  _T_800 = _T_799 | take_halt; // @[el2_dec_tlu_ctl.scala 866:73]
  wire  _T_801 = _T_800 | take_reset; // @[el2_dec_tlu_ctl.scala 866:85]
  wire  _T_807 = _T_529 & sel_npc_r; // @[el2_dec_tlu_ctl.scala 870:21]
  wire  _T_810 = _T_529 & rfpc_i0_r; // @[el2_dec_tlu_ctl.scala 871:21]
  wire  _T_812 = _T_810 & io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 871:39]
  wire  _T_813 = ~sel_npc_r; // @[el2_dec_tlu_ctl.scala 871:80]
  wire  _T_814 = _T_812 & _T_813; // @[el2_dec_tlu_ctl.scala 871:69]
  wire  _T_816 = ~take_ext_int; // @[el2_dec_tlu_ctl.scala 872:44]
  wire  _T_817 = interrupt_valid_r & _T_816; // @[el2_dec_tlu_ctl.scala 872:30]
  wire  _T_818 = i0_exception_valid_r | lsu_exc_valid_r; // @[el2_dec_tlu_ctl.scala 873:28]
  wire  _T_821 = _T_818 | mepc_trigger_hit_sel_pc_r; // @[el2_dec_tlu_ctl.scala 873:46]
  wire  _T_823 = _T_821 & _T_207; // @[el2_dec_tlu_ctl.scala 873:91]
  wire  _T_825 = _T_823 & _T_816; // @[el2_dec_tlu_ctl.scala 873:112]
  wire  _T_830 = _T_529 & mret_r; // @[el2_dec_tlu_ctl.scala 874:16]
  wire  _T_833 = _T_529 & debug_resume_req_f; // @[el2_dec_tlu_ctl.scala 875:16]
  wire  _T_836 = _T_529 & sel_npc_resume; // @[el2_dec_tlu_ctl.scala 876:16]
  wire [30:0] _T_838 = take_ext_int ? io_lsu_fir_addr : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] npc_r = csr_io_npc_r; // @[el2_dec_tlu_ctl.scala 337:41 el2_dec_tlu_ctl.scala 1075:31]
  wire [30:0] _T_839 = _T_807 ? npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_840 = _T_814 ? io_dec_tlu_i0_pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_841 = _T_817 ? interrupt_path : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_842 = _T_825 ? _T_769 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] mepc = csr_io_mepc; // @[el2_dec_tlu_ctl.scala 340:41 el2_dec_tlu_ctl.scala 1078:31]
  wire [30:0] _T_843 = _T_830 ? mepc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] dpc = csr_io_dpc; // @[el2_dec_tlu_ctl.scala 343:41 el2_dec_tlu_ctl.scala 1081:31]
  wire [30:0] _T_844 = _T_833 ? dpc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] npc_r_d1 = csr_io_npc_r_d1; // @[el2_dec_tlu_ctl.scala 338:41 el2_dec_tlu_ctl.scala 1076:31]
  wire [30:0] _T_845 = _T_836 ? npc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_846 = _T_838 | _T_839; // @[Mux.scala 27:72]
  wire [30:0] _T_847 = _T_846 | _T_840; // @[Mux.scala 27:72]
  wire [30:0] _T_848 = _T_847 | _T_841; // @[Mux.scala 27:72]
  wire [30:0] _T_849 = _T_848 | _T_842; // @[Mux.scala 27:72]
  wire [30:0] _T_850 = _T_849 | _T_843; // @[Mux.scala 27:72]
  wire [30:0] _T_851 = _T_850 | _T_844; // @[Mux.scala 27:72]
  wire [30:0] _T_852 = _T_851 | _T_845; // @[Mux.scala 27:72]
  reg [30:0] tlu_flush_path_r_d1; // @[el2_dec_tlu_ctl.scala 879:58]
  wire  _T_854 = lsu_exc_valid_r | i0_exception_valid_r; // @[el2_dec_tlu_ctl.scala 886:44]
  wire  _T_855 = _T_854 | interrupt_valid_r; // @[el2_dec_tlu_ctl.scala 886:67]
  reg  i0_exception_valid_r_d1; // @[el2_dec_tlu_ctl.scala 889:81]
  reg [4:0] exc_cause_wb; // @[el2_dec_tlu_ctl.scala 891:89]
  wire  _T_860 = ~illegal_r; // @[el2_dec_tlu_ctl.scala 892:119]
  reg  i0_valid_wb; // @[el2_dec_tlu_ctl.scala 892:97]
  reg  trigger_hit_r_d1; // @[el2_dec_tlu_ctl.scala 893:81]
  wire  csr_pkt_presync = csr_read_io_csr_pkt_presync; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_864 = csr_pkt_presync & io_dec_csr_any_unq_d; // @[el2_dec_tlu_ctl.scala 1094:44]
  wire  _T_865 = ~io_dec_csr_wen_unq_d; // @[el2_dec_tlu_ctl.scala 1094:69]
  wire  csr_pkt_postsync = csr_read_io_csr_pkt_postsync; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  csr_pkt_csr_dcsr = csr_read_io_csr_pkt_csr_dcsr; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  csr_pkt_csr_dpc = csr_read_io_csr_pkt_csr_dpc; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_874 = csr_pkt_csr_dcsr | csr_pkt_csr_dpc; // @[el2_dec_tlu_ctl.scala 1099:57]
  wire  csr_pkt_csr_dmst = csr_read_io_csr_pkt_csr_dmst; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_875 = _T_874 | csr_pkt_csr_dmst; // @[el2_dec_tlu_ctl.scala 1099:75]
  wire  csr_pkt_csr_dicawics = csr_read_io_csr_pkt_csr_dicawics; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_876 = _T_875 | csr_pkt_csr_dicawics; // @[el2_dec_tlu_ctl.scala 1099:94]
  wire  csr_pkt_csr_dicad0 = csr_read_io_csr_pkt_csr_dicad0; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_877 = _T_876 | csr_pkt_csr_dicad0; // @[el2_dec_tlu_ctl.scala 1099:117]
  wire  csr_pkt_csr_dicad0h = csr_read_io_csr_pkt_csr_dicad0h; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_878 = _T_877 | csr_pkt_csr_dicad0h; // @[el2_dec_tlu_ctl.scala 1099:138]
  wire  csr_pkt_csr_dicad1 = csr_read_io_csr_pkt_csr_dicad1; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_879 = _T_878 | csr_pkt_csr_dicad1; // @[el2_dec_tlu_ctl.scala 1099:160]
  wire  csr_pkt_csr_dicago = csr_read_io_csr_pkt_csr_dicago; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_880 = _T_879 | csr_pkt_csr_dicago; // @[el2_dec_tlu_ctl.scala 1099:181]
  wire  _T_881 = ~_T_880; // @[el2_dec_tlu_ctl.scala 1099:38]
  wire  _T_882 = _T_881 | dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 1099:203]
  wire  csr_pkt_legal = csr_read_io_csr_pkt_legal; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_883 = csr_pkt_legal & _T_882; // @[el2_dec_tlu_ctl.scala 1099:35]
  wire  _T_884 = ~fast_int_meicpct; // @[el2_dec_tlu_ctl.scala 1099:225]
  wire  valid_csr = _T_883 & _T_884; // @[el2_dec_tlu_ctl.scala 1099:223]
  wire  _T_887 = io_dec_csr_any_unq_d & valid_csr; // @[el2_dec_tlu_ctl.scala 1101:48]
  wire  csr_pkt_csr_mvendorid = csr_read_io_csr_pkt_csr_mvendorid; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  csr_pkt_csr_marchid = csr_read_io_csr_pkt_csr_marchid; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_888 = csr_pkt_csr_mvendorid | csr_pkt_csr_marchid; // @[el2_dec_tlu_ctl.scala 1101:109]
  wire  csr_pkt_csr_mimpid = csr_read_io_csr_pkt_csr_mimpid; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_889 = _T_888 | csr_pkt_csr_mimpid; // @[el2_dec_tlu_ctl.scala 1101:131]
  wire  csr_pkt_csr_mhartid = csr_read_io_csr_pkt_csr_mhartid; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_890 = _T_889 | csr_pkt_csr_mhartid; // @[el2_dec_tlu_ctl.scala 1101:152]
  wire  csr_pkt_csr_mdseac = csr_read_io_csr_pkt_csr_mdseac; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_891 = _T_890 | csr_pkt_csr_mdseac; // @[el2_dec_tlu_ctl.scala 1101:174]
  wire  csr_pkt_csr_meihap = csr_read_io_csr_pkt_csr_meihap; // @[el2_dec_tlu_ctl.scala 351:41 el2_dec_tlu_ctl.scala 1092:10]
  wire  _T_892 = _T_891 | csr_pkt_csr_meihap; // @[el2_dec_tlu_ctl.scala 1101:195]
  wire  _T_893 = io_dec_csr_wen_unq_d & _T_892; // @[el2_dec_tlu_ctl.scala 1101:84]
  wire  _T_894 = ~_T_893; // @[el2_dec_tlu_ctl.scala 1101:61]
  el2_dec_timer_ctl int_timers ( // @[el2_dec_tlu_ctl.scala 355:24]
    .clock(int_timers_clock),
    .reset(int_timers_reset),
    .io_free_clk(int_timers_io_free_clk),
    .io_scan_mode(int_timers_io_scan_mode),
    .io_dec_csr_wen_r_mod(int_timers_io_dec_csr_wen_r_mod),
    .io_dec_csr_wraddr_r(int_timers_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(int_timers_io_dec_csr_wrdata_r),
    .io_csr_mitctl0(int_timers_io_csr_mitctl0),
    .io_csr_mitctl1(int_timers_io_csr_mitctl1),
    .io_csr_mitb0(int_timers_io_csr_mitb0),
    .io_csr_mitb1(int_timers_io_csr_mitb1),
    .io_csr_mitcnt0(int_timers_io_csr_mitcnt0),
    .io_csr_mitcnt1(int_timers_io_csr_mitcnt1),
    .io_dec_pause_state(int_timers_io_dec_pause_state),
    .io_dec_tlu_pmu_fw_halted(int_timers_io_dec_tlu_pmu_fw_halted),
    .io_internal_dbg_halt_timers(int_timers_io_internal_dbg_halt_timers),
    .io_dec_timer_rddata_d(int_timers_io_dec_timer_rddata_d),
    .io_dec_timer_read_d(int_timers_io_dec_timer_read_d),
    .io_dec_timer_t0_pulse(int_timers_io_dec_timer_t0_pulse),
    .io_dec_timer_t1_pulse(int_timers_io_dec_timer_t1_pulse)
  );
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
  csr_tlu csr ( // @[el2_dec_tlu_ctl.scala 897:17]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_free_clk(csr_io_free_clk),
    .io_active_clk(csr_io_active_clk),
    .io_scan_mode(csr_io_scan_mode),
    .io_dec_csr_wrdata_r(csr_io_dec_csr_wrdata_r),
    .io_dec_csr_wraddr_r(csr_io_dec_csr_wraddr_r),
    .io_dec_csr_rdaddr_d(csr_io_dec_csr_rdaddr_d),
    .io_dec_csr_wen_unq_d(csr_io_dec_csr_wen_unq_d),
    .io_dec_i0_decode_d(csr_io_dec_i0_decode_d),
    .io_dec_tlu_ic_diag_pkt_icache_wrdata(csr_io_dec_tlu_ic_diag_pkt_icache_wrdata),
    .io_dec_tlu_ic_diag_pkt_icache_dicawics(csr_io_dec_tlu_ic_diag_pkt_icache_dicawics),
    .io_dec_tlu_ic_diag_pkt_icache_rd_valid(csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid),
    .io_dec_tlu_ic_diag_pkt_icache_wr_valid(csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid),
    .io_ifu_ic_debug_rd_data_valid(csr_io_ifu_ic_debug_rd_data_valid),
    .io_trigger_pkt_any_0_select(csr_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_(csr_io_trigger_pkt_any_0_match_),
    .io_trigger_pkt_any_0_store(csr_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(csr_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_execute(csr_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(csr_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(csr_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(csr_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_(csr_io_trigger_pkt_any_1_match_),
    .io_trigger_pkt_any_1_store(csr_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(csr_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_execute(csr_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(csr_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(csr_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(csr_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_(csr_io_trigger_pkt_any_2_match_),
    .io_trigger_pkt_any_2_store(csr_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(csr_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_execute(csr_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(csr_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(csr_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(csr_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_(csr_io_trigger_pkt_any_3_match_),
    .io_trigger_pkt_any_3_store(csr_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(csr_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_execute(csr_io_trigger_pkt_any_3_execute),
    .io_trigger_pkt_any_3_m(csr_io_trigger_pkt_any_3_m),
    .io_trigger_pkt_any_3_tdata2(csr_io_trigger_pkt_any_3_tdata2),
    .io_ifu_pmu_bus_trxn(csr_io_ifu_pmu_bus_trxn),
    .io_dma_iccm_stall_any(csr_io_dma_iccm_stall_any),
    .io_dma_dccm_stall_any(csr_io_dma_dccm_stall_any),
    .io_lsu_store_stall_any(csr_io_lsu_store_stall_any),
    .io_dec_pmu_presync_stall(csr_io_dec_pmu_presync_stall),
    .io_dec_pmu_postsync_stall(csr_io_dec_pmu_postsync_stall),
    .io_dec_pmu_decode_stall(csr_io_dec_pmu_decode_stall),
    .io_ifu_pmu_fetch_stall(csr_io_ifu_pmu_fetch_stall),
    .io_dec_tlu_packet_r_icaf_type(csr_io_dec_tlu_packet_r_icaf_type),
    .io_dec_tlu_packet_r_pmu_i0_itype(csr_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(csr_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(csr_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(csr_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_exu_pmu_i0_br_ataken(csr_io_exu_pmu_i0_br_ataken),
    .io_exu_pmu_i0_br_misp(csr_io_exu_pmu_i0_br_misp),
    .io_dec_pmu_instr_decoded(csr_io_dec_pmu_instr_decoded),
    .io_ifu_pmu_instr_aligned(csr_io_ifu_pmu_instr_aligned),
    .io_exu_pmu_i0_pc4(csr_io_exu_pmu_i0_pc4),
    .io_ifu_pmu_ic_miss(csr_io_ifu_pmu_ic_miss),
    .io_ifu_pmu_ic_hit(csr_io_ifu_pmu_ic_hit),
    .io_dec_tlu_int_valid_wb1(csr_io_dec_tlu_int_valid_wb1),
    .io_dec_tlu_i0_exc_valid_wb1(csr_io_dec_tlu_i0_exc_valid_wb1),
    .io_dec_tlu_i0_valid_wb1(csr_io_dec_tlu_i0_valid_wb1),
    .io_dec_csr_wen_r(csr_io_dec_csr_wen_r),
    .io_dec_tlu_mtval_wb1(csr_io_dec_tlu_mtval_wb1),
    .io_dec_tlu_exc_cause_wb1(csr_io_dec_tlu_exc_cause_wb1),
    .io_dec_tlu_perfcnt0(csr_io_dec_tlu_perfcnt0),
    .io_dec_tlu_perfcnt1(csr_io_dec_tlu_perfcnt1),
    .io_dec_tlu_perfcnt2(csr_io_dec_tlu_perfcnt2),
    .io_dec_tlu_perfcnt3(csr_io_dec_tlu_perfcnt3),
    .io_dec_tlu_dbg_halted(csr_io_dec_tlu_dbg_halted),
    .io_dma_pmu_dccm_write(csr_io_dma_pmu_dccm_write),
    .io_dma_pmu_dccm_read(csr_io_dma_pmu_dccm_read),
    .io_dma_pmu_any_write(csr_io_dma_pmu_any_write),
    .io_dma_pmu_any_read(csr_io_dma_pmu_any_read),
    .io_lsu_pmu_bus_busy(csr_io_lsu_pmu_bus_busy),
    .io_dec_tlu_i0_pc_r(csr_io_dec_tlu_i0_pc_r),
    .io_dec_tlu_i0_valid_r(csr_io_dec_tlu_i0_valid_r),
    .io_dec_csr_any_unq_d(csr_io_dec_csr_any_unq_d),
    .io_dec_tlu_misc_clk_override(csr_io_dec_tlu_misc_clk_override),
    .io_dec_tlu_dec_clk_override(csr_io_dec_tlu_dec_clk_override),
    .io_dec_tlu_ifu_clk_override(csr_io_dec_tlu_ifu_clk_override),
    .io_dec_tlu_lsu_clk_override(csr_io_dec_tlu_lsu_clk_override),
    .io_dec_tlu_bus_clk_override(csr_io_dec_tlu_bus_clk_override),
    .io_dec_tlu_pic_clk_override(csr_io_dec_tlu_pic_clk_override),
    .io_dec_tlu_dccm_clk_override(csr_io_dec_tlu_dccm_clk_override),
    .io_dec_tlu_icm_clk_override(csr_io_dec_tlu_icm_clk_override),
    .io_dec_csr_rddata_d(csr_io_dec_csr_rddata_d),
    .io_dec_tlu_pipelining_disable(csr_io_dec_tlu_pipelining_disable),
    .io_dec_tlu_wr_pause_r(csr_io_dec_tlu_wr_pause_r),
    .io_ifu_pmu_bus_busy(csr_io_ifu_pmu_bus_busy),
    .io_lsu_pmu_bus_error(csr_io_lsu_pmu_bus_error),
    .io_ifu_pmu_bus_error(csr_io_ifu_pmu_bus_error),
    .io_lsu_pmu_bus_misaligned(csr_io_lsu_pmu_bus_misaligned),
    .io_lsu_pmu_bus_trxn(csr_io_lsu_pmu_bus_trxn),
    .io_ifu_ic_debug_rd_data(csr_io_ifu_ic_debug_rd_data),
    .io_dec_tlu_meipt(csr_io_dec_tlu_meipt),
    .io_pic_pl(csr_io_pic_pl),
    .io_dec_tlu_meicurpl(csr_io_dec_tlu_meicurpl),
    .io_dec_tlu_meihap(csr_io_dec_tlu_meihap),
    .io_pic_claimid(csr_io_pic_claimid),
    .io_iccm_dma_sb_error(csr_io_iccm_dma_sb_error),
    .io_lsu_imprecise_error_addr_any(csr_io_lsu_imprecise_error_addr_any),
    .io_lsu_imprecise_error_load_any(csr_io_lsu_imprecise_error_load_any),
    .io_lsu_imprecise_error_store_any(csr_io_lsu_imprecise_error_store_any),
    .io_dec_tlu_mrac_ff(csr_io_dec_tlu_mrac_ff),
    .io_dec_tlu_wb_coalescing_disable(csr_io_dec_tlu_wb_coalescing_disable),
    .io_dec_tlu_bpred_disable(csr_io_dec_tlu_bpred_disable),
    .io_dec_tlu_sideeffect_posted_disable(csr_io_dec_tlu_sideeffect_posted_disable),
    .io_dec_tlu_core_ecc_disable(csr_io_dec_tlu_core_ecc_disable),
    .io_dec_tlu_external_ldfwd_disable(csr_io_dec_tlu_external_ldfwd_disable),
    .io_dec_tlu_dma_qos_prty(csr_io_dec_tlu_dma_qos_prty),
    .io_dec_illegal_inst(csr_io_dec_illegal_inst),
    .io_lsu_error_pkt_r_bits_mscause(csr_io_lsu_error_pkt_r_bits_mscause),
    .io_mexintpend(csr_io_mexintpend),
    .io_exu_npc_r(csr_io_exu_npc_r),
    .io_mpc_reset_run_req(csr_io_mpc_reset_run_req),
    .io_rst_vec(csr_io_rst_vec),
    .io_core_id(csr_io_core_id),
    .io_dec_timer_rddata_d(csr_io_dec_timer_rddata_d),
    .io_dec_timer_read_d(csr_io_dec_timer_read_d),
    .io_dec_csr_wen_r_mod(csr_io_dec_csr_wen_r_mod),
    .io_rfpc_i0_r(csr_io_rfpc_i0_r),
    .io_i0_trigger_hit_r(csr_io_i0_trigger_hit_r),
    .io_fw_halt_req(csr_io_fw_halt_req),
    .io_mstatus(csr_io_mstatus),
    .io_exc_or_int_valid_r(csr_io_exc_or_int_valid_r),
    .io_mret_r(csr_io_mret_r),
    .io_mstatus_mie_ns(csr_io_mstatus_mie_ns),
    .io_dcsr_single_step_running_f(csr_io_dcsr_single_step_running_f),
    .io_dcsr(csr_io_dcsr),
    .io_mtvec(csr_io_mtvec),
    .io_mip(csr_io_mip),
    .io_dec_timer_t0_pulse(csr_io_dec_timer_t0_pulse),
    .io_dec_timer_t1_pulse(csr_io_dec_timer_t1_pulse),
    .io_timer_int_sync(csr_io_timer_int_sync),
    .io_soft_int_sync(csr_io_soft_int_sync),
    .io_mie_ns(csr_io_mie_ns),
    .io_csr_wr_clk(csr_io_csr_wr_clk),
    .io_ebreak_to_debug_mode_r(csr_io_ebreak_to_debug_mode_r),
    .io_dec_tlu_pmu_fw_halted(csr_io_dec_tlu_pmu_fw_halted),
    .io_lsu_fir_error(csr_io_lsu_fir_error),
    .io_npc_r(csr_io_npc_r),
    .io_tlu_flush_lower_r_d1(csr_io_tlu_flush_lower_r_d1),
    .io_dec_tlu_flush_noredir_r_d1(csr_io_dec_tlu_flush_noredir_r_d1),
    .io_tlu_flush_path_r_d1(csr_io_tlu_flush_path_r_d1),
    .io_npc_r_d1(csr_io_npc_r_d1),
    .io_reset_delayed(csr_io_reset_delayed),
    .io_mepc(csr_io_mepc),
    .io_interrupt_valid_r(csr_io_interrupt_valid_r),
    .io_i0_exception_valid_r(csr_io_i0_exception_valid_r),
    .io_lsu_exc_valid_r(csr_io_lsu_exc_valid_r),
    .io_mepc_trigger_hit_sel_pc_r(csr_io_mepc_trigger_hit_sel_pc_r),
    .io_e4e5_int_clk(csr_io_e4e5_int_clk),
    .io_lsu_i0_exc_r(csr_io_lsu_i0_exc_r),
    .io_inst_acc_r(csr_io_inst_acc_r),
    .io_inst_acc_second_r(csr_io_inst_acc_second_r),
    .io_take_nmi(csr_io_take_nmi),
    .io_lsu_error_pkt_addr_r(csr_io_lsu_error_pkt_addr_r),
    .io_exc_cause_r(csr_io_exc_cause_r),
    .io_i0_valid_wb(csr_io_i0_valid_wb),
    .io_exc_or_int_valid_r_d1(csr_io_exc_or_int_valid_r_d1),
    .io_interrupt_valid_r_d1(csr_io_interrupt_valid_r_d1),
    .io_clk_override(csr_io_clk_override),
    .io_i0_exception_valid_r_d1(csr_io_i0_exception_valid_r_d1),
    .io_lsu_i0_exc_r_d1(csr_io_lsu_i0_exc_r_d1),
    .io_exc_cause_wb(csr_io_exc_cause_wb),
    .io_nmi_lsu_store_type(csr_io_nmi_lsu_store_type),
    .io_nmi_lsu_load_type(csr_io_nmi_lsu_load_type),
    .io_tlu_i0_commit_cmt(csr_io_tlu_i0_commit_cmt),
    .io_ebreak_r(csr_io_ebreak_r),
    .io_ecall_r(csr_io_ecall_r),
    .io_illegal_r(csr_io_illegal_r),
    .io_mdseac_locked_ns(csr_io_mdseac_locked_ns),
    .io_mdseac_locked_f(csr_io_mdseac_locked_f),
    .io_nmi_int_detected_f(csr_io_nmi_int_detected_f),
    .io_internal_dbg_halt_mode_f2(csr_io_internal_dbg_halt_mode_f2),
    .io_ext_int_freeze_d1(csr_io_ext_int_freeze_d1),
    .io_ic_perr_r_d1(csr_io_ic_perr_r_d1),
    .io_iccm_sbecc_r_d1(csr_io_iccm_sbecc_r_d1),
    .io_lsu_single_ecc_error_r_d1(csr_io_lsu_single_ecc_error_r_d1),
    .io_ifu_miss_state_idle_f(csr_io_ifu_miss_state_idle_f),
    .io_lsu_idle_any_f(csr_io_lsu_idle_any_f),
    .io_dbg_tlu_halted_f(csr_io_dbg_tlu_halted_f),
    .io_dbg_tlu_halted(csr_io_dbg_tlu_halted),
    .io_debug_halt_req_f(csr_io_debug_halt_req_f),
    .io_force_halt(csr_io_force_halt),
    .io_take_ext_int_start(csr_io_take_ext_int_start),
    .io_trigger_hit_dmode_r_d1(csr_io_trigger_hit_dmode_r_d1),
    .io_trigger_hit_r_d1(csr_io_trigger_hit_r_d1),
    .io_dcsr_single_step_done_f(csr_io_dcsr_single_step_done_f),
    .io_ebreak_to_debug_mode_r_d1(csr_io_ebreak_to_debug_mode_r_d1),
    .io_debug_halt_req(csr_io_debug_halt_req),
    .io_allow_dbg_halt_csr_write(csr_io_allow_dbg_halt_csr_write),
    .io_internal_dbg_halt_mode_f(csr_io_internal_dbg_halt_mode_f),
    .io_enter_debug_halt_req(csr_io_enter_debug_halt_req),
    .io_internal_dbg_halt_mode(csr_io_internal_dbg_halt_mode),
    .io_request_debug_mode_done(csr_io_request_debug_mode_done),
    .io_request_debug_mode_r(csr_io_request_debug_mode_r),
    .io_dpc(csr_io_dpc),
    .io_update_hit_bit_r(csr_io_update_hit_bit_r),
    .io_take_timer_int(csr_io_take_timer_int),
    .io_take_int_timer0_int(csr_io_take_int_timer0_int),
    .io_take_int_timer1_int(csr_io_take_int_timer1_int),
    .io_take_ext_int(csr_io_take_ext_int),
    .io_tlu_flush_lower_r(csr_io_tlu_flush_lower_r),
    .io_dec_tlu_br0_error_r(csr_io_dec_tlu_br0_error_r),
    .io_dec_tlu_br0_start_error_r(csr_io_dec_tlu_br0_start_error_r),
    .io_lsu_pmu_load_external_r(csr_io_lsu_pmu_load_external_r),
    .io_lsu_pmu_store_external_r(csr_io_lsu_pmu_store_external_r),
    .io_csr_pkt_csr_misa(csr_io_csr_pkt_csr_misa),
    .io_csr_pkt_csr_mvendorid(csr_io_csr_pkt_csr_mvendorid),
    .io_csr_pkt_csr_marchid(csr_io_csr_pkt_csr_marchid),
    .io_csr_pkt_csr_mimpid(csr_io_csr_pkt_csr_mimpid),
    .io_csr_pkt_csr_mhartid(csr_io_csr_pkt_csr_mhartid),
    .io_csr_pkt_csr_mstatus(csr_io_csr_pkt_csr_mstatus),
    .io_csr_pkt_csr_mtvec(csr_io_csr_pkt_csr_mtvec),
    .io_csr_pkt_csr_mip(csr_io_csr_pkt_csr_mip),
    .io_csr_pkt_csr_mie(csr_io_csr_pkt_csr_mie),
    .io_csr_pkt_csr_mcyclel(csr_io_csr_pkt_csr_mcyclel),
    .io_csr_pkt_csr_mcycleh(csr_io_csr_pkt_csr_mcycleh),
    .io_csr_pkt_csr_minstretl(csr_io_csr_pkt_csr_minstretl),
    .io_csr_pkt_csr_minstreth(csr_io_csr_pkt_csr_minstreth),
    .io_csr_pkt_csr_mscratch(csr_io_csr_pkt_csr_mscratch),
    .io_csr_pkt_csr_mepc(csr_io_csr_pkt_csr_mepc),
    .io_csr_pkt_csr_mcause(csr_io_csr_pkt_csr_mcause),
    .io_csr_pkt_csr_mscause(csr_io_csr_pkt_csr_mscause),
    .io_csr_pkt_csr_mtval(csr_io_csr_pkt_csr_mtval),
    .io_csr_pkt_csr_mrac(csr_io_csr_pkt_csr_mrac),
    .io_csr_pkt_csr_mdseac(csr_io_csr_pkt_csr_mdseac),
    .io_csr_pkt_csr_meihap(csr_io_csr_pkt_csr_meihap),
    .io_csr_pkt_csr_meivt(csr_io_csr_pkt_csr_meivt),
    .io_csr_pkt_csr_meipt(csr_io_csr_pkt_csr_meipt),
    .io_csr_pkt_csr_meicurpl(csr_io_csr_pkt_csr_meicurpl),
    .io_csr_pkt_csr_meicidpl(csr_io_csr_pkt_csr_meicidpl),
    .io_csr_pkt_csr_dcsr(csr_io_csr_pkt_csr_dcsr),
    .io_csr_pkt_csr_mcgc(csr_io_csr_pkt_csr_mcgc),
    .io_csr_pkt_csr_mfdc(csr_io_csr_pkt_csr_mfdc),
    .io_csr_pkt_csr_dpc(csr_io_csr_pkt_csr_dpc),
    .io_csr_pkt_csr_mtsel(csr_io_csr_pkt_csr_mtsel),
    .io_csr_pkt_csr_mtdata1(csr_io_csr_pkt_csr_mtdata1),
    .io_csr_pkt_csr_mtdata2(csr_io_csr_pkt_csr_mtdata2),
    .io_csr_pkt_csr_mhpmc3(csr_io_csr_pkt_csr_mhpmc3),
    .io_csr_pkt_csr_mhpmc4(csr_io_csr_pkt_csr_mhpmc4),
    .io_csr_pkt_csr_mhpmc5(csr_io_csr_pkt_csr_mhpmc5),
    .io_csr_pkt_csr_mhpmc6(csr_io_csr_pkt_csr_mhpmc6),
    .io_csr_pkt_csr_mhpmc3h(csr_io_csr_pkt_csr_mhpmc3h),
    .io_csr_pkt_csr_mhpmc4h(csr_io_csr_pkt_csr_mhpmc4h),
    .io_csr_pkt_csr_mhpmc5h(csr_io_csr_pkt_csr_mhpmc5h),
    .io_csr_pkt_csr_mhpmc6h(csr_io_csr_pkt_csr_mhpmc6h),
    .io_csr_pkt_csr_mhpme3(csr_io_csr_pkt_csr_mhpme3),
    .io_csr_pkt_csr_mhpme4(csr_io_csr_pkt_csr_mhpme4),
    .io_csr_pkt_csr_mhpme5(csr_io_csr_pkt_csr_mhpme5),
    .io_csr_pkt_csr_mhpme6(csr_io_csr_pkt_csr_mhpme6),
    .io_csr_pkt_csr_mcountinhibit(csr_io_csr_pkt_csr_mcountinhibit),
    .io_csr_pkt_csr_mpmc(csr_io_csr_pkt_csr_mpmc),
    .io_csr_pkt_csr_micect(csr_io_csr_pkt_csr_micect),
    .io_csr_pkt_csr_miccmect(csr_io_csr_pkt_csr_miccmect),
    .io_csr_pkt_csr_mdccmect(csr_io_csr_pkt_csr_mdccmect),
    .io_csr_pkt_csr_mfdht(csr_io_csr_pkt_csr_mfdht),
    .io_csr_pkt_csr_mfdhs(csr_io_csr_pkt_csr_mfdhs),
    .io_csr_pkt_csr_dicawics(csr_io_csr_pkt_csr_dicawics),
    .io_csr_pkt_csr_dicad0h(csr_io_csr_pkt_csr_dicad0h),
    .io_csr_pkt_csr_dicad0(csr_io_csr_pkt_csr_dicad0),
    .io_csr_pkt_csr_dicad1(csr_io_csr_pkt_csr_dicad1),
    .io_mtdata1_t_0(csr_io_mtdata1_t_0),
    .io_mtdata1_t_1(csr_io_mtdata1_t_1),
    .io_mtdata1_t_2(csr_io_mtdata1_t_2),
    .io_mtdata1_t_3(csr_io_mtdata1_t_3)
  );
  el2_dec_decode_csr_read csr_read ( // @[el2_dec_tlu_ctl.scala 1090:22]
    .io_dec_csr_rdaddr_d(csr_read_io_dec_csr_rdaddr_d),
    .io_csr_pkt_csr_misa(csr_read_io_csr_pkt_csr_misa),
    .io_csr_pkt_csr_mvendorid(csr_read_io_csr_pkt_csr_mvendorid),
    .io_csr_pkt_csr_marchid(csr_read_io_csr_pkt_csr_marchid),
    .io_csr_pkt_csr_mimpid(csr_read_io_csr_pkt_csr_mimpid),
    .io_csr_pkt_csr_mhartid(csr_read_io_csr_pkt_csr_mhartid),
    .io_csr_pkt_csr_mstatus(csr_read_io_csr_pkt_csr_mstatus),
    .io_csr_pkt_csr_mtvec(csr_read_io_csr_pkt_csr_mtvec),
    .io_csr_pkt_csr_mip(csr_read_io_csr_pkt_csr_mip),
    .io_csr_pkt_csr_mie(csr_read_io_csr_pkt_csr_mie),
    .io_csr_pkt_csr_mcyclel(csr_read_io_csr_pkt_csr_mcyclel),
    .io_csr_pkt_csr_mcycleh(csr_read_io_csr_pkt_csr_mcycleh),
    .io_csr_pkt_csr_minstretl(csr_read_io_csr_pkt_csr_minstretl),
    .io_csr_pkt_csr_minstreth(csr_read_io_csr_pkt_csr_minstreth),
    .io_csr_pkt_csr_mscratch(csr_read_io_csr_pkt_csr_mscratch),
    .io_csr_pkt_csr_mepc(csr_read_io_csr_pkt_csr_mepc),
    .io_csr_pkt_csr_mcause(csr_read_io_csr_pkt_csr_mcause),
    .io_csr_pkt_csr_mscause(csr_read_io_csr_pkt_csr_mscause),
    .io_csr_pkt_csr_mtval(csr_read_io_csr_pkt_csr_mtval),
    .io_csr_pkt_csr_mrac(csr_read_io_csr_pkt_csr_mrac),
    .io_csr_pkt_csr_dmst(csr_read_io_csr_pkt_csr_dmst),
    .io_csr_pkt_csr_mdseac(csr_read_io_csr_pkt_csr_mdseac),
    .io_csr_pkt_csr_meihap(csr_read_io_csr_pkt_csr_meihap),
    .io_csr_pkt_csr_meivt(csr_read_io_csr_pkt_csr_meivt),
    .io_csr_pkt_csr_meipt(csr_read_io_csr_pkt_csr_meipt),
    .io_csr_pkt_csr_meicurpl(csr_read_io_csr_pkt_csr_meicurpl),
    .io_csr_pkt_csr_meicidpl(csr_read_io_csr_pkt_csr_meicidpl),
    .io_csr_pkt_csr_dcsr(csr_read_io_csr_pkt_csr_dcsr),
    .io_csr_pkt_csr_mcgc(csr_read_io_csr_pkt_csr_mcgc),
    .io_csr_pkt_csr_mfdc(csr_read_io_csr_pkt_csr_mfdc),
    .io_csr_pkt_csr_dpc(csr_read_io_csr_pkt_csr_dpc),
    .io_csr_pkt_csr_mtsel(csr_read_io_csr_pkt_csr_mtsel),
    .io_csr_pkt_csr_mtdata1(csr_read_io_csr_pkt_csr_mtdata1),
    .io_csr_pkt_csr_mtdata2(csr_read_io_csr_pkt_csr_mtdata2),
    .io_csr_pkt_csr_mhpmc3(csr_read_io_csr_pkt_csr_mhpmc3),
    .io_csr_pkt_csr_mhpmc4(csr_read_io_csr_pkt_csr_mhpmc4),
    .io_csr_pkt_csr_mhpmc5(csr_read_io_csr_pkt_csr_mhpmc5),
    .io_csr_pkt_csr_mhpmc6(csr_read_io_csr_pkt_csr_mhpmc6),
    .io_csr_pkt_csr_mhpmc3h(csr_read_io_csr_pkt_csr_mhpmc3h),
    .io_csr_pkt_csr_mhpmc4h(csr_read_io_csr_pkt_csr_mhpmc4h),
    .io_csr_pkt_csr_mhpmc5h(csr_read_io_csr_pkt_csr_mhpmc5h),
    .io_csr_pkt_csr_mhpmc6h(csr_read_io_csr_pkt_csr_mhpmc6h),
    .io_csr_pkt_csr_mhpme3(csr_read_io_csr_pkt_csr_mhpme3),
    .io_csr_pkt_csr_mhpme4(csr_read_io_csr_pkt_csr_mhpme4),
    .io_csr_pkt_csr_mhpme5(csr_read_io_csr_pkt_csr_mhpme5),
    .io_csr_pkt_csr_mhpme6(csr_read_io_csr_pkt_csr_mhpme6),
    .io_csr_pkt_csr_mcountinhibit(csr_read_io_csr_pkt_csr_mcountinhibit),
    .io_csr_pkt_csr_mitctl0(csr_read_io_csr_pkt_csr_mitctl0),
    .io_csr_pkt_csr_mitctl1(csr_read_io_csr_pkt_csr_mitctl1),
    .io_csr_pkt_csr_mitb0(csr_read_io_csr_pkt_csr_mitb0),
    .io_csr_pkt_csr_mitb1(csr_read_io_csr_pkt_csr_mitb1),
    .io_csr_pkt_csr_mitcnt0(csr_read_io_csr_pkt_csr_mitcnt0),
    .io_csr_pkt_csr_mitcnt1(csr_read_io_csr_pkt_csr_mitcnt1),
    .io_csr_pkt_csr_mpmc(csr_read_io_csr_pkt_csr_mpmc),
    .io_csr_pkt_csr_meicpct(csr_read_io_csr_pkt_csr_meicpct),
    .io_csr_pkt_csr_micect(csr_read_io_csr_pkt_csr_micect),
    .io_csr_pkt_csr_miccmect(csr_read_io_csr_pkt_csr_miccmect),
    .io_csr_pkt_csr_mdccmect(csr_read_io_csr_pkt_csr_mdccmect),
    .io_csr_pkt_csr_mfdht(csr_read_io_csr_pkt_csr_mfdht),
    .io_csr_pkt_csr_mfdhs(csr_read_io_csr_pkt_csr_mfdhs),
    .io_csr_pkt_csr_dicawics(csr_read_io_csr_pkt_csr_dicawics),
    .io_csr_pkt_csr_dicad0h(csr_read_io_csr_pkt_csr_dicad0h),
    .io_csr_pkt_csr_dicad0(csr_read_io_csr_pkt_csr_dicad0),
    .io_csr_pkt_csr_dicad1(csr_read_io_csr_pkt_csr_dicad1),
    .io_csr_pkt_csr_dicago(csr_read_io_csr_pkt_csr_dicago),
    .io_csr_pkt_presync(csr_read_io_csr_pkt_presync),
    .io_csr_pkt_postsync(csr_read_io_csr_pkt_postsync),
    .io_csr_pkt_legal(csr_read_io_csr_pkt_legal)
  );
  assign io_dec_dbg_cmd_done = io_dec_tlu_i0_valid_r & io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 568:23]
  assign io_dec_dbg_cmd_fail = illegal_r & io_dec_dbg_cmd_done; // @[el2_dec_tlu_ctl.scala 569:23]
  assign io_dec_tlu_dbg_halted = dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 550:41]
  assign io_dec_tlu_debug_mode = debug_mode_status; // @[el2_dec_tlu_ctl.scala 551:41]
  assign io_dec_tlu_resume_ack = _T_190; // @[el2_dec_tlu_ctl.scala 534:41]
  assign io_dec_tlu_debug_stall = debug_halt_req_f; // @[el2_dec_tlu_ctl.scala 549:41]
  assign io_dec_tlu_flush_noredir_r = _T_205 | take_ext_int_start; // @[el2_dec_tlu_ctl.scala 555:30]
  assign io_dec_tlu_mpc_halted_only = _T_65; // @[el2_dec_tlu_ctl.scala 449:41]
  assign io_dec_tlu_flush_leak_one_r = _T_233 & _T_234; // @[el2_dec_tlu_ctl.scala 564:31]
  assign io_dec_tlu_flush_err_r = io_dec_tlu_flush_lower_r & _T_433; // @[el2_dec_tlu_ctl.scala 565:26]
  assign io_dec_tlu_flush_extint = ext_int_ready & _T_704; // @[el2_dec_tlu_ctl.scala 557:27]
  assign io_dec_tlu_meihap = csr_io_dec_tlu_meihap; // @[el2_dec_tlu_ctl.scala 956:44]
  assign io_trigger_pkt_any_0_select = csr_io_trigger_pkt_any_0_select; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_0_match_ = csr_io_trigger_pkt_any_0_match_; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_0_store = csr_io_trigger_pkt_any_0_store; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_0_load = csr_io_trigger_pkt_any_0_load; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_0_execute = csr_io_trigger_pkt_any_0_execute; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_0_m = csr_io_trigger_pkt_any_0_m; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_0_tdata2 = csr_io_trigger_pkt_any_0_tdata2; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_select = csr_io_trigger_pkt_any_1_select; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_match_ = csr_io_trigger_pkt_any_1_match_; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_store = csr_io_trigger_pkt_any_1_store; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_load = csr_io_trigger_pkt_any_1_load; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_execute = csr_io_trigger_pkt_any_1_execute; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_m = csr_io_trigger_pkt_any_1_m; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_1_tdata2 = csr_io_trigger_pkt_any_1_tdata2; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_select = csr_io_trigger_pkt_any_2_select; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_match_ = csr_io_trigger_pkt_any_2_match_; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_store = csr_io_trigger_pkt_any_2_store; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_load = csr_io_trigger_pkt_any_2_load; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_execute = csr_io_trigger_pkt_any_2_execute; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_m = csr_io_trigger_pkt_any_2_m; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_2_tdata2 = csr_io_trigger_pkt_any_2_tdata2; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_select = csr_io_trigger_pkt_any_3_select; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_match_ = csr_io_trigger_pkt_any_3_match_; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_store = csr_io_trigger_pkt_any_3_store; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_load = csr_io_trigger_pkt_any_3_load; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_execute = csr_io_trigger_pkt_any_3_execute; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_m = csr_io_trigger_pkt_any_3_m; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_trigger_pkt_any_3_tdata2 = csr_io_trigger_pkt_any_3_tdata2; // @[el2_dec_tlu_ctl.scala 962:40]
  assign io_dec_tlu_ic_diag_pkt_icache_wrdata = csr_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[el2_dec_tlu_ctl.scala 961:44]
  assign io_dec_tlu_ic_diag_pkt_icache_dicawics = csr_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[el2_dec_tlu_ctl.scala 961:44]
  assign io_dec_tlu_ic_diag_pkt_icache_rd_valid = csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[el2_dec_tlu_ctl.scala 961:44]
  assign io_dec_tlu_ic_diag_pkt_icache_wr_valid = csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[el2_dec_tlu_ctl.scala 961:44]
  assign io_o_cpu_halt_status = _T_353; // @[el2_dec_tlu_ctl.scala 654:41]
  assign io_o_cpu_halt_ack = _T_354; // @[el2_dec_tlu_ctl.scala 655:49]
  assign io_o_cpu_run_ack = _T_355; // @[el2_dec_tlu_ctl.scala 656:49]
  assign io_o_debug_mode_status = debug_mode_status; // @[el2_dec_tlu_ctl.scala 677:26]
  assign io_mpc_debug_halt_ack = mpc_debug_halt_ack_f; // @[el2_dec_tlu_ctl.scala 474:25]
  assign io_mpc_debug_run_ack = mpc_debug_run_ack_f; // @[el2_dec_tlu_ctl.scala 475:25]
  assign io_debug_brkpt_status = debug_brkpt_status_f; // @[el2_dec_tlu_ctl.scala 476:25]
  assign io_dec_tlu_meicurpl = csr_io_dec_tlu_meicurpl; // @[el2_dec_tlu_ctl.scala 955:44]
  assign io_dec_tlu_meipt = csr_io_dec_tlu_meipt; // @[el2_dec_tlu_ctl.scala 957:44]
  assign io_dec_csr_rddata_d = csr_io_dec_csr_rddata_d; // @[el2_dec_tlu_ctl.scala 977:40]
  assign io_dec_csr_legal_d = _T_887 & _T_894; // @[el2_dec_tlu_ctl.scala 1101:22]
  assign io_dec_tlu_br0_r_pkt_valid = _T_459 & _T_462; // @[el2_dec_tlu_ctl.scala 733:49]
  assign io_dec_tlu_br0_r_pkt_bits_hist = io_exu_i0_br_hist_r; // @[el2_dec_tlu_ctl.scala 730:57]
  assign io_dec_tlu_br0_r_pkt_bits_br_error = _T_453 & _T_429; // @[el2_dec_tlu_ctl.scala 731:49]
  assign io_dec_tlu_br0_r_pkt_bits_br_start_error = _T_455 & _T_429; // @[el2_dec_tlu_ctl.scala 732:49]
  assign io_dec_tlu_br0_r_pkt_bits_way = io_exu_i0_br_way_r; // @[el2_dec_tlu_ctl.scala 734:57]
  assign io_dec_tlu_br0_r_pkt_bits_middle = io_exu_i0_br_middle_r; // @[el2_dec_tlu_ctl.scala 735:57]
  assign io_dec_tlu_i0_kill_writeb_wb = _T_32; // @[el2_dec_tlu_ctl.scala 409:33]
  assign io_dec_tlu_flush_lower_wb = tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 881:33]
  assign io_dec_tlu_i0_commit_cmt = _T_422 & _T_465; // @[el2_dec_tlu_ctl.scala 708:28]
  assign io_dec_tlu_i0_kill_writeb_r = _T_427 | i0_trigger_hit_raw_r; // @[el2_dec_tlu_ctl.scala 415:33]
  assign io_dec_tlu_flush_lower_r = _T_801 | take_ext_int_start; // @[el2_dec_tlu_ctl.scala 882:33]
  assign io_dec_tlu_flush_path_r = take_reset ? io_rst_vec : _T_852; // @[el2_dec_tlu_ctl.scala 883:33]
  assign io_dec_tlu_fence_i_r = _T_492 & _T_470; // @[el2_dec_tlu_ctl.scala 753:24]
  assign io_dec_tlu_wr_pause_r = csr_io_dec_tlu_wr_pause_r; // @[el2_dec_tlu_ctl.scala 979:40]
  assign io_dec_tlu_flush_pause_r = _T_208 & _T_209; // @[el2_dec_tlu_ctl.scala 560:28]
  assign io_dec_tlu_presync_d = _T_864 & _T_865; // @[el2_dec_tlu_ctl.scala 1094:25]
  assign io_dec_tlu_postsync_d = csr_pkt_postsync & io_dec_csr_any_unq_d; // @[el2_dec_tlu_ctl.scala 1095:25]
  assign io_dec_tlu_mrac_ff = csr_io_dec_tlu_mrac_ff; // @[el2_dec_tlu_ctl.scala 980:40]
  assign io_dec_tlu_force_halt = _T_33; // @[el2_dec_tlu_ctl.scala 411:41]
  assign io_dec_tlu_perfcnt0 = csr_io_dec_tlu_perfcnt0; // @[el2_dec_tlu_ctl.scala 965:40]
  assign io_dec_tlu_perfcnt1 = csr_io_dec_tlu_perfcnt1; // @[el2_dec_tlu_ctl.scala 966:40]
  assign io_dec_tlu_perfcnt2 = csr_io_dec_tlu_perfcnt2; // @[el2_dec_tlu_ctl.scala 967:40]
  assign io_dec_tlu_perfcnt3 = csr_io_dec_tlu_perfcnt3; // @[el2_dec_tlu_ctl.scala 968:40]
  assign io_dec_tlu_i0_exc_valid_wb1 = csr_io_dec_tlu_i0_exc_valid_wb1; // @[el2_dec_tlu_ctl.scala 959:44]
  assign io_dec_tlu_i0_valid_wb1 = csr_io_dec_tlu_i0_valid_wb1; // @[el2_dec_tlu_ctl.scala 960:44]
  assign io_dec_tlu_int_valid_wb1 = csr_io_dec_tlu_int_valid_wb1; // @[el2_dec_tlu_ctl.scala 958:44]
  assign io_dec_tlu_exc_cause_wb1 = csr_io_dec_tlu_exc_cause_wb1; // @[el2_dec_tlu_ctl.scala 964:40]
  assign io_dec_tlu_mtval_wb1 = csr_io_dec_tlu_mtval_wb1; // @[el2_dec_tlu_ctl.scala 963:40]
  assign io_dec_tlu_external_ldfwd_disable = csr_io_dec_tlu_external_ldfwd_disable; // @[el2_dec_tlu_ctl.scala 985:40]
  assign io_dec_tlu_sideeffect_posted_disable = csr_io_dec_tlu_sideeffect_posted_disable; // @[el2_dec_tlu_ctl.scala 983:40]
  assign io_dec_tlu_core_ecc_disable = csr_io_dec_tlu_core_ecc_disable; // @[el2_dec_tlu_ctl.scala 984:40]
  assign io_dec_tlu_bpred_disable = csr_io_dec_tlu_bpred_disable; // @[el2_dec_tlu_ctl.scala 982:40]
  assign io_dec_tlu_wb_coalescing_disable = csr_io_dec_tlu_wb_coalescing_disable; // @[el2_dec_tlu_ctl.scala 981:40]
  assign io_dec_tlu_pipelining_disable = csr_io_dec_tlu_pipelining_disable; // @[el2_dec_tlu_ctl.scala 978:40]
  assign io_dec_tlu_dma_qos_prty = csr_io_dec_tlu_dma_qos_prty; // @[el2_dec_tlu_ctl.scala 986:40]
  assign io_dec_tlu_misc_clk_override = csr_io_dec_tlu_misc_clk_override; // @[el2_dec_tlu_ctl.scala 969:40]
  assign io_dec_tlu_dec_clk_override = csr_io_dec_tlu_dec_clk_override; // @[el2_dec_tlu_ctl.scala 970:40]
  assign io_dec_tlu_ifu_clk_override = csr_io_dec_tlu_ifu_clk_override; // @[el2_dec_tlu_ctl.scala 971:40]
  assign io_dec_tlu_lsu_clk_override = csr_io_dec_tlu_lsu_clk_override; // @[el2_dec_tlu_ctl.scala 972:40]
  assign io_dec_tlu_bus_clk_override = csr_io_dec_tlu_bus_clk_override; // @[el2_dec_tlu_ctl.scala 973:40]
  assign io_dec_tlu_pic_clk_override = csr_io_dec_tlu_pic_clk_override; // @[el2_dec_tlu_ctl.scala 974:40]
  assign io_dec_tlu_dccm_clk_override = csr_io_dec_tlu_dccm_clk_override; // @[el2_dec_tlu_ctl.scala 975:40]
  assign io_dec_tlu_icm_clk_override = csr_io_dec_tlu_icm_clk_override; // @[el2_dec_tlu_ctl.scala 976:40]
  assign int_timers_clock = clock;
  assign int_timers_reset = reset;
  assign int_timers_io_free_clk = io_free_clk; // @[el2_dec_tlu_ctl.scala 356:57]
  assign int_timers_io_scan_mode = io_scan_mode; // @[el2_dec_tlu_ctl.scala 357:57]
  assign int_timers_io_dec_csr_wen_r_mod = csr_io_dec_csr_wen_r_mod; // @[el2_dec_tlu_ctl.scala 358:49]
  assign int_timers_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[el2_dec_tlu_ctl.scala 360:49]
  assign int_timers_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[el2_dec_tlu_ctl.scala 361:49]
  assign int_timers_io_csr_mitctl0 = csr_read_io_csr_pkt_csr_mitctl0; // @[el2_dec_tlu_ctl.scala 362:49]
  assign int_timers_io_csr_mitctl1 = csr_read_io_csr_pkt_csr_mitctl1; // @[el2_dec_tlu_ctl.scala 363:49]
  assign int_timers_io_csr_mitb0 = csr_read_io_csr_pkt_csr_mitb0; // @[el2_dec_tlu_ctl.scala 364:57]
  assign int_timers_io_csr_mitb1 = csr_read_io_csr_pkt_csr_mitb1; // @[el2_dec_tlu_ctl.scala 365:57]
  assign int_timers_io_csr_mitcnt0 = csr_read_io_csr_pkt_csr_mitcnt0; // @[el2_dec_tlu_ctl.scala 366:49]
  assign int_timers_io_csr_mitcnt1 = csr_read_io_csr_pkt_csr_mitcnt1; // @[el2_dec_tlu_ctl.scala 367:49]
  assign int_timers_io_dec_pause_state = io_dec_pause_state; // @[el2_dec_tlu_ctl.scala 368:41]
  assign int_timers_io_dec_tlu_pmu_fw_halted = pmu_fw_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 369:41]
  assign int_timers_io_internal_dbg_halt_timers = debug_mode_status & _T_665; // @[el2_dec_tlu_ctl.scala 370:41]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = dec_csr_wen_r_mod | io_dec_tlu_dec_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = _T_11 | io_dec_tlu_dec_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_2_io_en = e4e5_valid | io_dec_tlu_dec_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_3_io_en = e4e5_valid | flush_clkvalid; // @[el2_lib.scala 485:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_free_clk = io_free_clk; // @[el2_dec_tlu_ctl.scala 898:44]
  assign csr_io_active_clk = io_active_clk; // @[el2_dec_tlu_ctl.scala 899:44]
  assign csr_io_scan_mode = io_scan_mode; // @[el2_dec_tlu_ctl.scala 900:44]
  assign csr_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[el2_dec_tlu_ctl.scala 901:44]
  assign csr_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[el2_dec_tlu_ctl.scala 902:44]
  assign csr_io_dec_csr_rdaddr_d = io_dec_csr_rdaddr_d; // @[el2_dec_tlu_ctl.scala 903:44]
  assign csr_io_dec_csr_wen_unq_d = io_dec_csr_wen_unq_d; // @[el2_dec_tlu_ctl.scala 904:44]
  assign csr_io_dec_i0_decode_d = io_dec_i0_decode_d; // @[el2_dec_tlu_ctl.scala 905:44]
  assign csr_io_ifu_ic_debug_rd_data_valid = io_ifu_ic_debug_rd_data_valid; // @[el2_dec_tlu_ctl.scala 906:44]
  assign csr_io_ifu_pmu_bus_trxn = io_ifu_pmu_bus_trxn; // @[el2_dec_tlu_ctl.scala 907:44]
  assign csr_io_dma_iccm_stall_any = io_dma_iccm_stall_any; // @[el2_dec_tlu_ctl.scala 908:44]
  assign csr_io_dma_dccm_stall_any = io_dma_dccm_stall_any; // @[el2_dec_tlu_ctl.scala 909:44]
  assign csr_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[el2_dec_tlu_ctl.scala 910:44]
  assign csr_io_dec_pmu_presync_stall = io_dec_pmu_presync_stall; // @[el2_dec_tlu_ctl.scala 911:44]
  assign csr_io_dec_pmu_postsync_stall = io_dec_pmu_postsync_stall; // @[el2_dec_tlu_ctl.scala 912:44]
  assign csr_io_dec_pmu_decode_stall = io_dec_pmu_decode_stall; // @[el2_dec_tlu_ctl.scala 913:44]
  assign csr_io_ifu_pmu_fetch_stall = io_ifu_pmu_fetch_stall; // @[el2_dec_tlu_ctl.scala 914:44]
  assign csr_io_dec_tlu_packet_r_icaf_type = io_dec_tlu_packet_r_icaf_type; // @[el2_dec_tlu_ctl.scala 915:44]
  assign csr_io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_packet_r_pmu_i0_itype; // @[el2_dec_tlu_ctl.scala 915:44]
  assign csr_io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[el2_dec_tlu_ctl.scala 915:44]
  assign csr_io_dec_tlu_packet_r_pmu_divide = io_dec_tlu_packet_r_pmu_divide; // @[el2_dec_tlu_ctl.scala 915:44]
  assign csr_io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec_tlu_ctl.scala 915:44]
  assign csr_io_exu_pmu_i0_br_ataken = io_exu_pmu_i0_br_ataken; // @[el2_dec_tlu_ctl.scala 916:44]
  assign csr_io_exu_pmu_i0_br_misp = io_exu_pmu_i0_br_misp; // @[el2_dec_tlu_ctl.scala 917:44]
  assign csr_io_dec_pmu_instr_decoded = io_dec_pmu_instr_decoded; // @[el2_dec_tlu_ctl.scala 918:44]
  assign csr_io_ifu_pmu_instr_aligned = io_ifu_pmu_instr_aligned; // @[el2_dec_tlu_ctl.scala 919:44]
  assign csr_io_exu_pmu_i0_pc4 = io_exu_pmu_i0_pc4; // @[el2_dec_tlu_ctl.scala 920:44]
  assign csr_io_ifu_pmu_ic_miss = io_ifu_pmu_ic_miss; // @[el2_dec_tlu_ctl.scala 921:44]
  assign csr_io_ifu_pmu_ic_hit = io_ifu_pmu_ic_hit; // @[el2_dec_tlu_ctl.scala 922:44]
  assign csr_io_dec_csr_wen_r = io_dec_csr_wen_r; // @[el2_dec_tlu_ctl.scala 923:44]
  assign csr_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[el2_dec_tlu_ctl.scala 924:44]
  assign csr_io_dma_pmu_dccm_write = io_dma_pmu_dccm_write; // @[el2_dec_tlu_ctl.scala 925:44]
  assign csr_io_dma_pmu_dccm_read = io_dma_pmu_dccm_read; // @[el2_dec_tlu_ctl.scala 926:44]
  assign csr_io_dma_pmu_any_write = io_dma_pmu_any_write; // @[el2_dec_tlu_ctl.scala 927:44]
  assign csr_io_dma_pmu_any_read = io_dma_pmu_any_read; // @[el2_dec_tlu_ctl.scala 928:44]
  assign csr_io_lsu_pmu_bus_busy = io_lsu_pmu_bus_busy; // @[el2_dec_tlu_ctl.scala 929:44]
  assign csr_io_dec_tlu_i0_pc_r = io_dec_tlu_i0_pc_r; // @[el2_dec_tlu_ctl.scala 930:44]
  assign csr_io_dec_tlu_i0_valid_r = io_dec_tlu_i0_valid_r; // @[el2_dec_tlu_ctl.scala 931:44]
  assign csr_io_dec_csr_any_unq_d = io_dec_csr_any_unq_d; // @[el2_dec_tlu_ctl.scala 933:44]
  assign csr_io_ifu_pmu_bus_busy = io_ifu_pmu_bus_busy; // @[el2_dec_tlu_ctl.scala 934:44]
  assign csr_io_lsu_pmu_bus_error = io_lsu_pmu_bus_error; // @[el2_dec_tlu_ctl.scala 935:44]
  assign csr_io_ifu_pmu_bus_error = io_ifu_pmu_bus_error; // @[el2_dec_tlu_ctl.scala 936:44]
  assign csr_io_lsu_pmu_bus_misaligned = io_lsu_pmu_bus_misaligned; // @[el2_dec_tlu_ctl.scala 937:44]
  assign csr_io_lsu_pmu_bus_trxn = io_lsu_pmu_bus_trxn; // @[el2_dec_tlu_ctl.scala 938:44]
  assign csr_io_ifu_ic_debug_rd_data = io_ifu_ic_debug_rd_data; // @[el2_dec_tlu_ctl.scala 939:44]
  assign csr_io_pic_pl = io_pic_pl; // @[el2_dec_tlu_ctl.scala 940:44]
  assign csr_io_pic_claimid = io_pic_claimid; // @[el2_dec_tlu_ctl.scala 941:44]
  assign csr_io_iccm_dma_sb_error = io_iccm_dma_sb_error; // @[el2_dec_tlu_ctl.scala 942:44]
  assign csr_io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_addr_any; // @[el2_dec_tlu_ctl.scala 943:44]
  assign csr_io_lsu_imprecise_error_load_any = io_lsu_imprecise_error_load_any; // @[el2_dec_tlu_ctl.scala 944:44]
  assign csr_io_lsu_imprecise_error_store_any = io_lsu_imprecise_error_store_any; // @[el2_dec_tlu_ctl.scala 945:44]
  assign csr_io_dec_illegal_inst = io_dec_illegal_inst; // @[el2_dec_tlu_ctl.scala 946:44 el2_dec_tlu_ctl.scala 987:44]
  assign csr_io_lsu_error_pkt_r_bits_mscause = io_lsu_error_pkt_r_bits_mscause; // @[el2_dec_tlu_ctl.scala 947:44 el2_dec_tlu_ctl.scala 988:44]
  assign csr_io_mexintpend = io_mexintpend; // @[el2_dec_tlu_ctl.scala 948:44 el2_dec_tlu_ctl.scala 989:44]
  assign csr_io_exu_npc_r = io_exu_npc_r; // @[el2_dec_tlu_ctl.scala 949:44 el2_dec_tlu_ctl.scala 990:44]
  assign csr_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[el2_dec_tlu_ctl.scala 950:44 el2_dec_tlu_ctl.scala 991:44]
  assign csr_io_rst_vec = io_rst_vec; // @[el2_dec_tlu_ctl.scala 951:44 el2_dec_tlu_ctl.scala 992:44]
  assign csr_io_core_id = io_core_id; // @[el2_dec_tlu_ctl.scala 952:44 el2_dec_tlu_ctl.scala 993:44]
  assign csr_io_dec_timer_rddata_d = int_timers_io_dec_timer_rddata_d; // @[el2_dec_tlu_ctl.scala 953:44 el2_dec_tlu_ctl.scala 994:44]
  assign csr_io_dec_timer_read_d = int_timers_io_dec_timer_read_d; // @[el2_dec_tlu_ctl.scala 954:44 el2_dec_tlu_ctl.scala 995:44]
  assign csr_io_rfpc_i0_r = _T_438 & _T_439; // @[el2_dec_tlu_ctl.scala 998:39]
  assign csr_io_i0_trigger_hit_r = |i0_trigger_chain_masked_r; // @[el2_dec_tlu_ctl.scala 999:39]
  assign csr_io_exc_or_int_valid_r = _T_855 | mepc_trigger_hit_sel_pc_r; // @[el2_dec_tlu_ctl.scala 1000:39]
  assign csr_io_mret_r = _T_487 & _T_470; // @[el2_dec_tlu_ctl.scala 1001:39]
  assign csr_io_dcsr_single_step_running_f = dcsr_single_step_running_f; // @[el2_dec_tlu_ctl.scala 1002:39]
  assign csr_io_dec_timer_t0_pulse = int_timers_io_dec_timer_t0_pulse; // @[el2_dec_tlu_ctl.scala 1003:39]
  assign csr_io_dec_timer_t1_pulse = int_timers_io_dec_timer_t1_pulse; // @[el2_dec_tlu_ctl.scala 1004:39]
  assign csr_io_timer_int_sync = syncro_ff[5]; // @[el2_dec_tlu_ctl.scala 1005:39]
  assign csr_io_soft_int_sync = syncro_ff[4]; // @[el2_dec_tlu_ctl.scala 1006:39]
  assign csr_io_csr_wr_clk = rvclkhdr_io_l1clk; // @[el2_dec_tlu_ctl.scala 1007:39]
  assign csr_io_ebreak_to_debug_mode_r = _T_519 & _T_470; // @[el2_dec_tlu_ctl.scala 1008:39]
  assign csr_io_dec_tlu_pmu_fw_halted = pmu_fw_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 1009:39]
  assign csr_io_lsu_fir_error = io_lsu_fir_error; // @[el2_dec_tlu_ctl.scala 1010:39]
  assign csr_io_tlu_flush_lower_r_d1 = tlu_flush_lower_r_d1; // @[el2_dec_tlu_ctl.scala 1011:39]
  assign csr_io_dec_tlu_flush_noredir_r_d1 = dec_tlu_flush_noredir_r_d1; // @[el2_dec_tlu_ctl.scala 1012:39]
  assign csr_io_tlu_flush_path_r_d1 = tlu_flush_path_r_d1; // @[el2_dec_tlu_ctl.scala 1013:39]
  assign csr_io_reset_delayed = reset_detect ^ reset_detected; // @[el2_dec_tlu_ctl.scala 1014:39]
  assign csr_io_interrupt_valid_r = _T_766 | take_int_timer1_int; // @[el2_dec_tlu_ctl.scala 1015:39]
  assign csr_io_i0_exception_valid_r = _T_527 & _T_528; // @[el2_dec_tlu_ctl.scala 1016:39]
  assign csr_io_lsu_exc_valid_r = _T_405 & _T_470; // @[el2_dec_tlu_ctl.scala 1017:39]
  assign csr_io_mepc_trigger_hit_sel_pc_r = i0_trigger_hit_raw_r & _T_345; // @[el2_dec_tlu_ctl.scala 1018:39]
  assign csr_io_e4e5_int_clk = rvclkhdr_3_io_l1clk; // @[el2_dec_tlu_ctl.scala 1019:39]
  assign csr_io_lsu_i0_exc_r = _T_405 & _T_470; // @[el2_dec_tlu_ctl.scala 1020:39]
  assign csr_io_inst_acc_r = _T_511 & _T_465; // @[el2_dec_tlu_ctl.scala 1021:39]
  assign csr_io_inst_acc_second_r = io_dec_tlu_packet_r_icaf_f1; // @[el2_dec_tlu_ctl.scala 1022:39]
  assign csr_io_take_nmi = _T_756 & _T_760; // @[el2_dec_tlu_ctl.scala 1023:39]
  assign csr_io_lsu_error_pkt_addr_r = {{31'd0}, io_lsu_error_pkt_r_bits_addr}; // @[el2_dec_tlu_ctl.scala 1024:39]
  assign csr_io_exc_cause_r = _T_603 | _T_591; // @[el2_dec_tlu_ctl.scala 1025:39]
  assign csr_io_i0_valid_wb = i0_valid_wb; // @[el2_dec_tlu_ctl.scala 1026:39]
  assign csr_io_exc_or_int_valid_r_d1 = exc_or_int_valid_r_d1; // @[el2_dec_tlu_ctl.scala 1027:39]
  assign csr_io_interrupt_valid_r_d1 = interrupt_valid_r_d1; // @[el2_dec_tlu_ctl.scala 1028:39]
  assign csr_io_clk_override = io_dec_tlu_dec_clk_override; // @[el2_dec_tlu_ctl.scala 1029:39]
  assign csr_io_i0_exception_valid_r_d1 = i0_exception_valid_r_d1; // @[el2_dec_tlu_ctl.scala 1030:39]
  assign csr_io_lsu_i0_exc_r_d1 = lsu_i0_exc_r_d1; // @[el2_dec_tlu_ctl.scala 1031:39]
  assign csr_io_exc_cause_wb = exc_cause_wb; // @[el2_dec_tlu_ctl.scala 1032:39]
  assign csr_io_nmi_lsu_store_type = _T_58 | _T_60; // @[el2_dec_tlu_ctl.scala 1033:39]
  assign csr_io_nmi_lsu_load_type = _T_50 | _T_52; // @[el2_dec_tlu_ctl.scala 1034:39]
  assign csr_io_tlu_i0_commit_cmt = _T_422 & _T_465; // @[el2_dec_tlu_ctl.scala 1035:39]
  assign csr_io_ebreak_r = _T_469 & _T_470; // @[el2_dec_tlu_ctl.scala 1036:39]
  assign csr_io_ecall_r = _T_475 & _T_470; // @[el2_dec_tlu_ctl.scala 1037:39]
  assign csr_io_illegal_r = _T_481 & _T_470; // @[el2_dec_tlu_ctl.scala 1038:39]
  assign csr_io_mdseac_locked_f = mdseac_locked_f; // @[el2_dec_tlu_ctl.scala 1039:39]
  assign csr_io_nmi_int_detected_f = nmi_int_detected_f; // @[el2_dec_tlu_ctl.scala 1040:39]
  assign csr_io_internal_dbg_halt_mode_f2 = internal_dbg_halt_mode_f2; // @[el2_dec_tlu_ctl.scala 1041:39]
  assign csr_io_ext_int_freeze_d1 = ext_int_freeze_d1; // @[el2_dec_tlu_ctl.scala 1042:39]
  assign csr_io_ic_perr_r_d1 = ic_perr_r_d1; // @[el2_dec_tlu_ctl.scala 1043:39]
  assign csr_io_iccm_sbecc_r_d1 = iccm_sbecc_r_d1; // @[el2_dec_tlu_ctl.scala 1044:39]
  assign csr_io_lsu_single_ecc_error_r_d1 = lsu_single_ecc_error_r_d1; // @[el2_dec_tlu_ctl.scala 1045:39]
  assign csr_io_ifu_miss_state_idle_f = ifu_miss_state_idle_f; // @[el2_dec_tlu_ctl.scala 1046:39]
  assign csr_io_lsu_idle_any_f = lsu_idle_any_f; // @[el2_dec_tlu_ctl.scala 1047:39]
  assign csr_io_dbg_tlu_halted_f = dbg_tlu_halted_f; // @[el2_dec_tlu_ctl.scala 1048:39]
  assign csr_io_dbg_tlu_halted = _T_164 | _T_166; // @[el2_dec_tlu_ctl.scala 1049:39]
  assign csr_io_debug_halt_req_f = debug_halt_req_f; // @[el2_dec_tlu_ctl.scala 1050:51]
  assign csr_io_take_ext_int_start = ext_int_ready & _T_704; // @[el2_dec_tlu_ctl.scala 1051:47]
  assign csr_io_trigger_hit_dmode_r_d1 = trigger_hit_dmode_r_d1; // @[el2_dec_tlu_ctl.scala 1052:43]
  assign csr_io_trigger_hit_r_d1 = trigger_hit_r_d1; // @[el2_dec_tlu_ctl.scala 1053:43]
  assign csr_io_dcsr_single_step_done_f = dcsr_single_step_done_f; // @[el2_dec_tlu_ctl.scala 1054:43]
  assign csr_io_ebreak_to_debug_mode_r_d1 = ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 1055:39]
  assign csr_io_debug_halt_req = _T_114 & _T_107; // @[el2_dec_tlu_ctl.scala 1056:51]
  assign csr_io_allow_dbg_halt_csr_write = debug_mode_status & _T_77; // @[el2_dec_tlu_ctl.scala 1057:39]
  assign csr_io_internal_dbg_halt_mode_f = debug_mode_status; // @[el2_dec_tlu_ctl.scala 1058:39]
  assign csr_io_enter_debug_halt_req = _T_155 | ebreak_to_debug_mode_r_d1; // @[el2_dec_tlu_ctl.scala 1059:39]
  assign csr_io_internal_dbg_halt_mode = debug_halt_req_ns | _T_160; // @[el2_dec_tlu_ctl.scala 1060:39]
  assign csr_io_request_debug_mode_done = _T_183 & _T_136; // @[el2_dec_tlu_ctl.scala 1061:39]
  assign csr_io_request_debug_mode_r = _T_180 | _T_182; // @[el2_dec_tlu_ctl.scala 1062:39]
  assign csr_io_update_hit_bit_r = _T_342 & i0_trigger_chain_masked_r; // @[el2_dec_tlu_ctl.scala 1063:39]
  assign csr_io_take_timer_int = _T_703 & _T_704; // @[el2_dec_tlu_ctl.scala 1064:39]
  assign csr_io_take_int_timer0_int = _T_717 & _T_704; // @[el2_dec_tlu_ctl.scala 1065:39]
  assign csr_io_take_int_timer1_int = _T_734 & _T_704; // @[el2_dec_tlu_ctl.scala 1066:39]
  assign csr_io_take_ext_int = take_ext_int_start_d3 & _T_685; // @[el2_dec_tlu_ctl.scala 1067:39]
  assign csr_io_tlu_flush_lower_r = _T_801 | take_ext_int_start; // @[el2_dec_tlu_ctl.scala 1068:39]
  assign csr_io_dec_tlu_br0_error_r = _T_453 & _T_429; // @[el2_dec_tlu_ctl.scala 1069:39]
  assign csr_io_dec_tlu_br0_start_error_r = _T_455 & _T_429; // @[el2_dec_tlu_ctl.scala 1070:39]
  assign csr_io_lsu_pmu_load_external_r = lsu_pmu_load_external_r; // @[el2_dec_tlu_ctl.scala 1071:39]
  assign csr_io_lsu_pmu_store_external_r = lsu_pmu_store_external_r; // @[el2_dec_tlu_ctl.scala 1072:39]
  assign csr_io_csr_pkt_csr_misa = csr_read_io_csr_pkt_csr_misa; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mvendorid = csr_read_io_csr_pkt_csr_mvendorid; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_marchid = csr_read_io_csr_pkt_csr_marchid; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mimpid = csr_read_io_csr_pkt_csr_mimpid; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhartid = csr_read_io_csr_pkt_csr_mhartid; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mstatus = csr_read_io_csr_pkt_csr_mstatus; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mtvec = csr_read_io_csr_pkt_csr_mtvec; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mip = csr_read_io_csr_pkt_csr_mip; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mie = csr_read_io_csr_pkt_csr_mie; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mcyclel = csr_read_io_csr_pkt_csr_mcyclel; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mcycleh = csr_read_io_csr_pkt_csr_mcycleh; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_minstretl = csr_read_io_csr_pkt_csr_minstretl; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_minstreth = csr_read_io_csr_pkt_csr_minstreth; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mscratch = csr_read_io_csr_pkt_csr_mscratch; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mepc = csr_read_io_csr_pkt_csr_mepc; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mcause = csr_read_io_csr_pkt_csr_mcause; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mscause = csr_read_io_csr_pkt_csr_mscause; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mtval = csr_read_io_csr_pkt_csr_mtval; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mrac = csr_read_io_csr_pkt_csr_mrac; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mdseac = csr_read_io_csr_pkt_csr_mdseac; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_meihap = csr_read_io_csr_pkt_csr_meihap; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_meivt = csr_read_io_csr_pkt_csr_meivt; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_meipt = csr_read_io_csr_pkt_csr_meipt; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_meicurpl = csr_read_io_csr_pkt_csr_meicurpl; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_meicidpl = csr_read_io_csr_pkt_csr_meicidpl; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_dcsr = csr_read_io_csr_pkt_csr_dcsr; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mcgc = csr_read_io_csr_pkt_csr_mcgc; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mfdc = csr_read_io_csr_pkt_csr_mfdc; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_dpc = csr_read_io_csr_pkt_csr_dpc; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mtsel = csr_read_io_csr_pkt_csr_mtsel; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mtdata1 = csr_read_io_csr_pkt_csr_mtdata1; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mtdata2 = csr_read_io_csr_pkt_csr_mtdata2; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc3 = csr_read_io_csr_pkt_csr_mhpmc3; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc4 = csr_read_io_csr_pkt_csr_mhpmc4; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc5 = csr_read_io_csr_pkt_csr_mhpmc5; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc6 = csr_read_io_csr_pkt_csr_mhpmc6; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc3h = csr_read_io_csr_pkt_csr_mhpmc3h; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc4h = csr_read_io_csr_pkt_csr_mhpmc4h; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc5h = csr_read_io_csr_pkt_csr_mhpmc5h; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpmc6h = csr_read_io_csr_pkt_csr_mhpmc6h; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpme3 = csr_read_io_csr_pkt_csr_mhpme3; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpme4 = csr_read_io_csr_pkt_csr_mhpme4; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpme5 = csr_read_io_csr_pkt_csr_mhpme5; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mhpme6 = csr_read_io_csr_pkt_csr_mhpme6; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mcountinhibit = csr_read_io_csr_pkt_csr_mcountinhibit; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mpmc = csr_read_io_csr_pkt_csr_mpmc; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_micect = csr_read_io_csr_pkt_csr_micect; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_miccmect = csr_read_io_csr_pkt_csr_miccmect; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mdccmect = csr_read_io_csr_pkt_csr_mdccmect; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mfdht = csr_read_io_csr_pkt_csr_mfdht; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_mfdhs = csr_read_io_csr_pkt_csr_mfdhs; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_dicawics = csr_read_io_csr_pkt_csr_dicawics; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_dicad0h = csr_read_io_csr_pkt_csr_dicad0h; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_dicad0 = csr_read_io_csr_pkt_csr_dicad0; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_io_csr_pkt_csr_dicad1 = csr_read_io_csr_pkt_csr_dicad1; // @[el2_dec_tlu_ctl.scala 1073:39]
  assign csr_read_io_dec_csr_rdaddr_d = io_dec_csr_rdaddr_d; // @[el2_dec_tlu_ctl.scala 1091:31]
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
  dbg_halt_state_f = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mpc_halt_state_f = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_8 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  syncro_ff = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  lsu_exc_valid_r_d1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  e5_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  debug_mode_status = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  i_cpu_run_req_d1_raw = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  nmi_int_delayed = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mdseac_locked_f = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  nmi_int_detected_f = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  take_nmi_r_d1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  take_ext_int_start_d3 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  int_timer0_int_hold_f = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  int_timer1_int_hold_f = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  i_cpu_halt_req_d1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  dbg_halt_req_held = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  ext_int_freeze_d1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  reset_detect = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  reset_detected = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  dcsr_single_step_done_f = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  trigger_hit_dmode_r_d1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ebreak_to_debug_mode_r_d1 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  debug_halt_req_f = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  lsu_idle_any_f = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ifu_miss_state_idle_f = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  debug_halt_req_d1 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  dec_tlu_flush_noredir_r_d1 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  dec_tlu_flush_pause_r_d1 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  take_ext_int_start_d1 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  halt_taken_f = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  dbg_tlu_halted_f = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  pmu_fw_tlu_halted_f = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  interrupt_valid_r_d1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  debug_resume_req_f = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  dcsr_single_step_running_f = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  pmu_fw_halt_req_f = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  internal_pmu_fw_halt_mode_f = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  tlu_flush_lower_r_d1 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  ic_perr_r_d1 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  iccm_sbecc_r_d1 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  request_debug_mode_r_d1 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  iccm_repair_state_d1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  dec_pause_state_f = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  dec_tlu_wr_pause_r_d1 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  exc_or_int_valid_r_d1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  pause_expired_wb = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  lsu_pmu_load_external_r = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  lsu_pmu_store_external_r = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  _T_32 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  internal_dbg_halt_mode_f2 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_33 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  nmi_lsu_load_type_f = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  nmi_lsu_store_type_f = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  mpc_debug_halt_req_sync_f = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  mpc_debug_run_req_sync_f = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  mpc_run_state_f = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  debug_brkpt_status_f = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  mpc_debug_halt_ack_f = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  mpc_debug_run_ack_f = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  dbg_run_state_f = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  _T_65 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  request_debug_mode_done_f = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  _T_190 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  _T_353 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  _T_354 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  _T_355 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  lsu_single_ecc_error_r_d1 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  lsu_i0_exc_r_d1 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  take_ext_int_start_d2 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  tlu_flush_path_r_d1 = _RAND_70[30:0];
  _RAND_71 = {1{`RANDOM}};
  i0_exception_valid_r_d1 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  exc_cause_wb = _RAND_72[4:0];
  _RAND_73 = {1{`RANDOM}};
  i0_valid_wb = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  trigger_hit_r_d1 = _RAND_74[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    dbg_halt_state_f = 1'h0;
  end
  if (reset) begin
    mpc_halt_state_f = 1'h0;
  end
  if (reset) begin
    _T_8 = 7'h0;
  end
  if (reset) begin
    syncro_ff = 7'h0;
  end
  if (reset) begin
    lsu_exc_valid_r_d1 = 1'h0;
  end
  if (reset) begin
    e5_valid = 1'h0;
  end
  if (reset) begin
    debug_mode_status = 1'h0;
  end
  if (reset) begin
    i_cpu_run_req_d1_raw = 1'h0;
  end
  if (reset) begin
    nmi_int_delayed = 1'h0;
  end
  if (reset) begin
    mdseac_locked_f = 1'h0;
  end
  if (reset) begin
    nmi_int_detected_f = 1'h0;
  end
  if (reset) begin
    take_nmi_r_d1 = 1'h0;
  end
  if (reset) begin
    take_ext_int_start_d3 = 1'h0;
  end
  if (reset) begin
    int_timer0_int_hold_f = 1'h0;
  end
  if (reset) begin
    int_timer1_int_hold_f = 1'h0;
  end
  if (reset) begin
    i_cpu_halt_req_d1 = 1'h0;
  end
  if (reset) begin
    dbg_halt_req_held = 1'h0;
  end
  if (reset) begin
    ext_int_freeze_d1 = 1'h0;
  end
  if (reset) begin
    reset_detect = 1'h0;
  end
  if (reset) begin
    reset_detected = 1'h0;
  end
  if (reset) begin
    dcsr_single_step_done_f = 1'h0;
  end
  if (reset) begin
    trigger_hit_dmode_r_d1 = 1'h0;
  end
  if (reset) begin
    ebreak_to_debug_mode_r_d1 = 1'h0;
  end
  if (reset) begin
    debug_halt_req_f = 1'h0;
  end
  if (reset) begin
    lsu_idle_any_f = 1'h0;
  end
  if (reset) begin
    ifu_miss_state_idle_f = 1'h0;
  end
  if (reset) begin
    debug_halt_req_d1 = 1'h0;
  end
  if (reset) begin
    dec_tlu_flush_noredir_r_d1 = 1'h0;
  end
  if (reset) begin
    dec_tlu_flush_pause_r_d1 = 1'h0;
  end
  if (reset) begin
    take_ext_int_start_d1 = 1'h0;
  end
  if (reset) begin
    halt_taken_f = 1'h0;
  end
  if (reset) begin
    dbg_tlu_halted_f = 1'h0;
  end
  if (reset) begin
    pmu_fw_tlu_halted_f = 1'h0;
  end
  if (reset) begin
    interrupt_valid_r_d1 = 1'h0;
  end
  if (reset) begin
    debug_resume_req_f = 1'h0;
  end
  if (reset) begin
    dcsr_single_step_running_f = 1'h0;
  end
  if (reset) begin
    pmu_fw_halt_req_f = 1'h0;
  end
  if (reset) begin
    internal_pmu_fw_halt_mode_f = 1'h0;
  end
  if (reset) begin
    tlu_flush_lower_r_d1 = 1'h0;
  end
  if (reset) begin
    ic_perr_r_d1 = 1'h0;
  end
  if (reset) begin
    iccm_sbecc_r_d1 = 1'h0;
  end
  if (reset) begin
    request_debug_mode_r_d1 = 1'h0;
  end
  if (reset) begin
    iccm_repair_state_d1 = 1'h0;
  end
  if (reset) begin
    dec_pause_state_f = 1'h0;
  end
  if (reset) begin
    dec_tlu_wr_pause_r_d1 = 1'h0;
  end
  if (reset) begin
    exc_or_int_valid_r_d1 = 1'h0;
  end
  if (reset) begin
    pause_expired_wb = 1'h0;
  end
  if (reset) begin
    lsu_pmu_load_external_r = 1'h0;
  end
  if (reset) begin
    lsu_pmu_store_external_r = 1'h0;
  end
  if (reset) begin
    _T_32 = 1'h0;
  end
  if (reset) begin
    internal_dbg_halt_mode_f2 = 1'h0;
  end
  if (reset) begin
    _T_33 = 1'h0;
  end
  if (reset) begin
    nmi_lsu_load_type_f = 1'h0;
  end
  if (reset) begin
    nmi_lsu_store_type_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_halt_req_sync_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_run_req_sync_f = 1'h0;
  end
  if (reset) begin
    mpc_run_state_f = 1'h0;
  end
  if (reset) begin
    debug_brkpt_status_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_halt_ack_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_run_ack_f = 1'h0;
  end
  if (reset) begin
    dbg_run_state_f = 1'h0;
  end
  if (reset) begin
    _T_65 = 1'h0;
  end
  if (reset) begin
    request_debug_mode_done_f = 1'h0;
  end
  if (reset) begin
    _T_190 = 1'h0;
  end
  if (reset) begin
    _T_353 = 1'h0;
  end
  if (reset) begin
    _T_354 = 1'h0;
  end
  if (reset) begin
    _T_355 = 1'h0;
  end
  if (reset) begin
    lsu_single_ecc_error_r_d1 = 1'h0;
  end
  if (reset) begin
    lsu_i0_exc_r_d1 = 1'h0;
  end
  if (reset) begin
    take_ext_int_start_d2 = 1'h0;
  end
  if (reset) begin
    tlu_flush_path_r_d1 = 31'h0;
  end
  if (reset) begin
    i0_exception_valid_r_d1 = 1'h0;
  end
  if (reset) begin
    exc_cause_wb = 5'h0;
  end
  if (reset) begin
    i0_valid_wb = 1'h0;
  end
  if (reset) begin
    trigger_hit_r_d1 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dbg_halt_state_f <= 1'h0;
    end else begin
      dbg_halt_state_f <= _T_83 & _T_84;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mpc_halt_state_f <= 1'h0;
    end else begin
      mpc_halt_state_f <= _T_71 & _T_72;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_8 <= 7'h0;
    end else begin
      _T_8 <= {_T_6,_T_3};
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      syncro_ff <= 7'h0;
    end else begin
      syncro_ff <= _T_8;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      lsu_exc_valid_r_d1 <= 1'h0;
    end else begin
      lsu_exc_valid_r_d1 <= _T_405 & _T_470;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      e5_valid <= 1'h0;
    end else begin
      e5_valid <= io_dec_tlu_i0_valid_r;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      debug_mode_status <= 1'h0;
    end else begin
      debug_mode_status <= debug_halt_req_ns | _T_160;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      i_cpu_run_req_d1_raw <= 1'h0;
    end else begin
      i_cpu_run_req_d1_raw <= _T_351 & _T_107;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      nmi_int_delayed <= 1'h0;
    end else begin
      nmi_int_delayed <= syncro_ff[6];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mdseac_locked_f <= 1'h0;
    end else begin
      mdseac_locked_f <= csr_io_mdseac_locked_ns;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      nmi_int_detected_f <= 1'h0;
    end else begin
      nmi_int_detected_f <= _T_42 | _T_44;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      take_nmi_r_d1 <= 1'h0;
    end else begin
      take_nmi_r_d1 <= _T_756 & _T_760;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      take_ext_int_start_d3 <= 1'h0;
    end else begin
      take_ext_int_start_d3 <= take_ext_int_start_d2;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      int_timer0_int_hold_f <= 1'h0;
    end else begin
      int_timer0_int_hold_f <= _T_644 | _T_651;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      int_timer1_int_hold_f <= 1'h0;
    end else begin
      int_timer1_int_hold_f <= _T_654 | _T_661;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      i_cpu_halt_req_d1 <= 1'h0;
    end else begin
      i_cpu_halt_req_d1 <= _T_347 & _T_107;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dbg_halt_req_held <= 1'h0;
    end else begin
      dbg_halt_req_held <= _T_106 & ext_int_freeze_d1;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      ext_int_freeze_d1 <= 1'h0;
    end else begin
      ext_int_freeze_d1 <= _T_682 | take_ext_int_start_d3;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      reset_detect <= 1'h0;
    end else begin
      reset_detect <= 1'h1;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      reset_detected <= 1'h0;
    end else begin
      reset_detected <= reset_detect;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dcsr_single_step_done_f <= 1'h0;
    end else begin
      dcsr_single_step_done_f <= _T_174 & _T_470;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      trigger_hit_dmode_r_d1 <= 1'h0;
    end else begin
      trigger_hit_dmode_r_d1 <= i0_trigger_hit_raw_r & i0_trigger_action_r;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      ebreak_to_debug_mode_r_d1 <= 1'h0;
    end else begin
      ebreak_to_debug_mode_r_d1 <= _T_519 & _T_470;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      debug_halt_req_f <= 1'h0;
    end else begin
      debug_halt_req_f <= enter_debug_halt_req | _T_168;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_idle_any_f <= 1'h0;
    end else begin
      lsu_idle_any_f <= io_lsu_idle_any;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      ifu_miss_state_idle_f <= 1'h0;
    end else begin
      ifu_miss_state_idle_f <= io_ifu_miss_state_idle;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      debug_halt_req_d1 <= 1'h0;
    end else begin
      debug_halt_req_d1 <= _T_114 & _T_107;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dec_tlu_flush_noredir_r_d1 <= 1'h0;
    end else begin
      dec_tlu_flush_noredir_r_d1 <= io_dec_tlu_flush_noredir_r;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dec_tlu_flush_pause_r_d1 <= 1'h0;
    end else begin
      dec_tlu_flush_pause_r_d1 <= io_dec_tlu_flush_pause_r;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      take_ext_int_start_d1 <= 1'h0;
    end else begin
      take_ext_int_start_d1 <= ext_int_ready & _T_704;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      halt_taken_f <= 1'h0;
    end else begin
      halt_taken_f <= _T_135 | _T_141;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dbg_tlu_halted_f <= 1'h0;
    end else begin
      dbg_tlu_halted_f <= _T_164 | _T_166;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      pmu_fw_tlu_halted_f <= 1'h0;
    end else begin
      pmu_fw_tlu_halted_f <= _T_377 & _T_378;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      interrupt_valid_r_d1 <= 1'h0;
    end else begin
      interrupt_valid_r_d1 <= _T_766 | take_int_timer1_int;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      debug_resume_req_f <= 1'h0;
    end else begin
      debug_resume_req_f <= _T_165 & _T_121;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dcsr_single_step_running_f <= 1'h0;
    end else begin
      dcsr_single_step_running_f <= _T_177 | _T_179;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      pmu_fw_halt_req_f <= 1'h0;
    end else begin
      pmu_fw_halt_req_f <= _T_363 & _T_378;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      internal_pmu_fw_halt_mode_f <= 1'h0;
    end else begin
      internal_pmu_fw_halt_mode_f <= pmu_fw_halt_req_ns | _T_369;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      tlu_flush_lower_r_d1 <= 1'h0;
    end else begin
      tlu_flush_lower_r_d1 <= _T_801 | take_ext_int_start;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      ic_perr_r_d1 <= 1'h0;
    end else begin
      ic_perr_r_d1 <= _T_499 & _T_500;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      iccm_sbecc_r_d1 <= 1'h0;
    end else begin
      iccm_sbecc_r_d1 <= _T_506 & _T_500;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      request_debug_mode_r_d1 <= 1'h0;
    end else begin
      request_debug_mode_r_d1 <= _T_180 | _T_182;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      iccm_repair_state_d1 <= 1'h0;
    end else begin
      iccm_repair_state_d1 <= iccm_sbecc_r_d1 | _T_442;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dec_pause_state_f <= 1'h0;
    end else begin
      dec_pause_state_f <= io_dec_pause_state;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dec_tlu_wr_pause_r_d1 <= 1'h0;
    end else begin
      dec_tlu_wr_pause_r_d1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      exc_or_int_valid_r_d1 <= 1'h0;
    end else begin
      exc_or_int_valid_r_d1 <= _T_855 | mepc_trigger_hit_sel_pc_r;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      pause_expired_wb <= 1'h0;
    end else begin
      pause_expired_wb <= _T_227 & _T_228;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_load_external_r <= 1'h0;
    end else begin
      lsu_pmu_load_external_r <= io_lsu_pmu_load_external_m;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_store_external_r <= 1'h0;
    end else begin
      lsu_pmu_store_external_r <= io_lsu_pmu_store_external_m;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_32 <= 1'h0;
    end else begin
      _T_32 <= _T_427 | i0_trigger_hit_raw_r;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      internal_dbg_halt_mode_f2 <= 1'h0;
    end else begin
      internal_dbg_halt_mode_f2 <= debug_mode_status;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_33 <= 1'h0;
    end else begin
      _T_33 <= csr_io_force_halt;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      nmi_lsu_load_type_f <= 1'h0;
    end else begin
      nmi_lsu_load_type_f <= _T_50 | _T_52;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      nmi_lsu_store_type_f <= 1'h0;
    end else begin
      nmi_lsu_store_type_f <= _T_58 | _T_60;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mpc_debug_halt_req_sync_f <= 1'h0;
    end else begin
      mpc_debug_halt_req_sync_f <= mpc_debug_halt_req_sync_raw & _T_107;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mpc_debug_run_req_sync_f <= 1'h0;
    end else begin
      mpc_debug_run_req_sync_f <= syncro_ff[0];
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mpc_run_state_f <= 1'h0;
    end else begin
      mpc_run_state_f <= _T_76 & _T_78;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      debug_brkpt_status_f <= 1'h0;
    end else begin
      debug_brkpt_status_f <= _T_92 & _T_94;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mpc_debug_halt_ack_f <= 1'h0;
    end else begin
      mpc_debug_halt_ack_f <= _T_97 & core_empty;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mpc_debug_run_ack_f <= 1'h0;
    end else begin
      mpc_debug_run_ack_f <= _T_102 | _T_103;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dbg_run_state_f <= 1'h0;
    end else begin
      dbg_run_state_f <= _T_86 & _T_78;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_65 <= 1'h0;
    end else begin
      _T_65 <= _T & mpc_halt_state_f;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      request_debug_mode_done_f <= 1'h0;
    end else begin
      request_debug_mode_done_f <= _T_183 & _T_136;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_190 <= 1'h0;
    end else begin
      _T_190 <= _T_170 & dbg_run_state_ns;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_353 <= 1'h0;
    end else begin
      _T_353 <= _T_376 | _T_386;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_354 <= 1'h0;
    end else begin
      _T_354 <= i_cpu_halt_req_d1 & pmu_fw_tlu_halted_f;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_355 <= 1'h0;
    end else begin
      _T_355 <= _T_388 | _T_389;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_single_ecc_error_r_d1 <= 1'h0;
    end else begin
      lsu_single_ecc_error_r_d1 <= io_lsu_single_ecc_error_incr;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      lsu_i0_exc_r_d1 <= 1'h0;
    end else begin
      lsu_i0_exc_r_d1 <= _T_405 & _T_470;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      take_ext_int_start_d2 <= 1'h0;
    end else begin
      take_ext_int_start_d2 <= take_ext_int_start_d1;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      tlu_flush_path_r_d1 <= 31'h0;
    end else if (take_reset) begin
      tlu_flush_path_r_d1 <= io_rst_vec;
    end else begin
      tlu_flush_path_r_d1 <= _T_852;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_exception_valid_r_d1 <= 1'h0;
    end else begin
      i0_exception_valid_r_d1 <= _T_527 & _T_528;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      exc_cause_wb <= 5'h0;
    end else begin
      exc_cause_wb <= _T_603 | _T_591;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      i0_valid_wb <= 1'h0;
    end else begin
      i0_valid_wb <= tlu_i0_commit_cmt & _T_860;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      trigger_hit_r_d1 <= 1'h0;
    end else begin
      trigger_hit_r_d1 <= |i0_trigger_chain_masked_r;
    end
  end
endmodule
module el2_dec_trigger(
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_,
  input         io_trigger_pkt_any_0_execute,
  input         io_trigger_pkt_any_0_m,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_,
  input         io_trigger_pkt_any_1_execute,
  input         io_trigger_pkt_any_1_m,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_,
  input         io_trigger_pkt_any_2_execute,
  input         io_trigger_pkt_any_2_m,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_,
  input         io_trigger_pkt_any_3_execute,
  input         io_trigger_pkt_any_3_m,
  input  [31:0] io_trigger_pkt_any_3_tdata2,
  input  [30:0] io_dec_i0_pc_d,
  output [3:0]  io_dec_i0_trigger_match_d
);
  wire  _T = ~io_trigger_pkt_any_0_select; // @[el2_dec_trigger.scala 14:63]
  wire  _T_1 = _T & io_trigger_pkt_any_0_execute; // @[el2_dec_trigger.scala 14:93]
  wire [9:0] _T_11 = {_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [18:0] _T_20 = {_T_11,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [27:0] _T_29 = {_T_20,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [31:0] _T_33 = {_T_29,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [31:0] _T_35 = {io_dec_i0_pc_d,io_trigger_pkt_any_0_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_0 = _T_33 & _T_35; // @[el2_dec_trigger.scala 14:127]
  wire  _T_37 = ~io_trigger_pkt_any_1_select; // @[el2_dec_trigger.scala 14:63]
  wire  _T_38 = _T_37 & io_trigger_pkt_any_1_execute; // @[el2_dec_trigger.scala 14:93]
  wire [9:0] _T_48 = {_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [18:0] _T_57 = {_T_48,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [27:0] _T_66 = {_T_57,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [31:0] _T_70 = {_T_66,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [31:0] _T_72 = {io_dec_i0_pc_d,io_trigger_pkt_any_1_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_1 = _T_70 & _T_72; // @[el2_dec_trigger.scala 14:127]
  wire  _T_74 = ~io_trigger_pkt_any_2_select; // @[el2_dec_trigger.scala 14:63]
  wire  _T_75 = _T_74 & io_trigger_pkt_any_2_execute; // @[el2_dec_trigger.scala 14:93]
  wire [9:0] _T_85 = {_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [18:0] _T_94 = {_T_85,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [27:0] _T_103 = {_T_94,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [31:0] _T_107 = {_T_103,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [31:0] _T_109 = {io_dec_i0_pc_d,io_trigger_pkt_any_2_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_2 = _T_107 & _T_109; // @[el2_dec_trigger.scala 14:127]
  wire  _T_111 = ~io_trigger_pkt_any_3_select; // @[el2_dec_trigger.scala 14:63]
  wire  _T_112 = _T_111 & io_trigger_pkt_any_3_execute; // @[el2_dec_trigger.scala 14:93]
  wire [9:0] _T_122 = {_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [18:0] _T_131 = {_T_122,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [27:0] _T_140 = {_T_131,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [31:0] _T_144 = {_T_140,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [31:0] _T_146 = {io_dec_i0_pc_d,io_trigger_pkt_any_3_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_3 = _T_144 & _T_146; // @[el2_dec_trigger.scala 14:127]
  wire  _T_148 = io_trigger_pkt_any_0_execute & io_trigger_pkt_any_0_m; // @[el2_dec_trigger.scala 15:83]
  wire  _T_151 = &io_trigger_pkt_any_0_tdata2; // @[el2_lib.scala 241:45]
  wire  _T_152 = ~_T_151; // @[el2_lib.scala 241:39]
  wire  _T_153 = io_trigger_pkt_any_0_match_ & _T_152; // @[el2_lib.scala 241:37]
  wire  _T_156 = io_trigger_pkt_any_0_tdata2[0] == dec_i0_match_data_0[0]; // @[el2_lib.scala 242:52]
  wire  _T_157 = _T_153 | _T_156; // @[el2_lib.scala 242:41]
  wire  _T_159 = &io_trigger_pkt_any_0_tdata2[0]; // @[el2_lib.scala 244:36]
  wire  _T_160 = _T_159 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_163 = io_trigger_pkt_any_0_tdata2[1] == dec_i0_match_data_0[1]; // @[el2_lib.scala 244:78]
  wire  _T_164 = _T_160 | _T_163; // @[el2_lib.scala 244:23]
  wire  _T_166 = &io_trigger_pkt_any_0_tdata2[1:0]; // @[el2_lib.scala 244:36]
  wire  _T_167 = _T_166 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_170 = io_trigger_pkt_any_0_tdata2[2] == dec_i0_match_data_0[2]; // @[el2_lib.scala 244:78]
  wire  _T_171 = _T_167 | _T_170; // @[el2_lib.scala 244:23]
  wire  _T_173 = &io_trigger_pkt_any_0_tdata2[2:0]; // @[el2_lib.scala 244:36]
  wire  _T_174 = _T_173 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_177 = io_trigger_pkt_any_0_tdata2[3] == dec_i0_match_data_0[3]; // @[el2_lib.scala 244:78]
  wire  _T_178 = _T_174 | _T_177; // @[el2_lib.scala 244:23]
  wire  _T_180 = &io_trigger_pkt_any_0_tdata2[3:0]; // @[el2_lib.scala 244:36]
  wire  _T_181 = _T_180 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_184 = io_trigger_pkt_any_0_tdata2[4] == dec_i0_match_data_0[4]; // @[el2_lib.scala 244:78]
  wire  _T_185 = _T_181 | _T_184; // @[el2_lib.scala 244:23]
  wire  _T_187 = &io_trigger_pkt_any_0_tdata2[4:0]; // @[el2_lib.scala 244:36]
  wire  _T_188 = _T_187 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_191 = io_trigger_pkt_any_0_tdata2[5] == dec_i0_match_data_0[5]; // @[el2_lib.scala 244:78]
  wire  _T_192 = _T_188 | _T_191; // @[el2_lib.scala 244:23]
  wire  _T_194 = &io_trigger_pkt_any_0_tdata2[5:0]; // @[el2_lib.scala 244:36]
  wire  _T_195 = _T_194 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_198 = io_trigger_pkt_any_0_tdata2[6] == dec_i0_match_data_0[6]; // @[el2_lib.scala 244:78]
  wire  _T_199 = _T_195 | _T_198; // @[el2_lib.scala 244:23]
  wire  _T_201 = &io_trigger_pkt_any_0_tdata2[6:0]; // @[el2_lib.scala 244:36]
  wire  _T_202 = _T_201 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_205 = io_trigger_pkt_any_0_tdata2[7] == dec_i0_match_data_0[7]; // @[el2_lib.scala 244:78]
  wire  _T_206 = _T_202 | _T_205; // @[el2_lib.scala 244:23]
  wire  _T_208 = &io_trigger_pkt_any_0_tdata2[7:0]; // @[el2_lib.scala 244:36]
  wire  _T_209 = _T_208 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_212 = io_trigger_pkt_any_0_tdata2[8] == dec_i0_match_data_0[8]; // @[el2_lib.scala 244:78]
  wire  _T_213 = _T_209 | _T_212; // @[el2_lib.scala 244:23]
  wire  _T_215 = &io_trigger_pkt_any_0_tdata2[8:0]; // @[el2_lib.scala 244:36]
  wire  _T_216 = _T_215 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_219 = io_trigger_pkt_any_0_tdata2[9] == dec_i0_match_data_0[9]; // @[el2_lib.scala 244:78]
  wire  _T_220 = _T_216 | _T_219; // @[el2_lib.scala 244:23]
  wire  _T_222 = &io_trigger_pkt_any_0_tdata2[9:0]; // @[el2_lib.scala 244:36]
  wire  _T_223 = _T_222 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_226 = io_trigger_pkt_any_0_tdata2[10] == dec_i0_match_data_0[10]; // @[el2_lib.scala 244:78]
  wire  _T_227 = _T_223 | _T_226; // @[el2_lib.scala 244:23]
  wire  _T_229 = &io_trigger_pkt_any_0_tdata2[10:0]; // @[el2_lib.scala 244:36]
  wire  _T_230 = _T_229 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_233 = io_trigger_pkt_any_0_tdata2[11] == dec_i0_match_data_0[11]; // @[el2_lib.scala 244:78]
  wire  _T_234 = _T_230 | _T_233; // @[el2_lib.scala 244:23]
  wire  _T_236 = &io_trigger_pkt_any_0_tdata2[11:0]; // @[el2_lib.scala 244:36]
  wire  _T_237 = _T_236 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_240 = io_trigger_pkt_any_0_tdata2[12] == dec_i0_match_data_0[12]; // @[el2_lib.scala 244:78]
  wire  _T_241 = _T_237 | _T_240; // @[el2_lib.scala 244:23]
  wire  _T_243 = &io_trigger_pkt_any_0_tdata2[12:0]; // @[el2_lib.scala 244:36]
  wire  _T_244 = _T_243 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_247 = io_trigger_pkt_any_0_tdata2[13] == dec_i0_match_data_0[13]; // @[el2_lib.scala 244:78]
  wire  _T_248 = _T_244 | _T_247; // @[el2_lib.scala 244:23]
  wire  _T_250 = &io_trigger_pkt_any_0_tdata2[13:0]; // @[el2_lib.scala 244:36]
  wire  _T_251 = _T_250 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_254 = io_trigger_pkt_any_0_tdata2[14] == dec_i0_match_data_0[14]; // @[el2_lib.scala 244:78]
  wire  _T_255 = _T_251 | _T_254; // @[el2_lib.scala 244:23]
  wire  _T_257 = &io_trigger_pkt_any_0_tdata2[14:0]; // @[el2_lib.scala 244:36]
  wire  _T_258 = _T_257 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_261 = io_trigger_pkt_any_0_tdata2[15] == dec_i0_match_data_0[15]; // @[el2_lib.scala 244:78]
  wire  _T_262 = _T_258 | _T_261; // @[el2_lib.scala 244:23]
  wire  _T_264 = &io_trigger_pkt_any_0_tdata2[15:0]; // @[el2_lib.scala 244:36]
  wire  _T_265 = _T_264 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_268 = io_trigger_pkt_any_0_tdata2[16] == dec_i0_match_data_0[16]; // @[el2_lib.scala 244:78]
  wire  _T_269 = _T_265 | _T_268; // @[el2_lib.scala 244:23]
  wire  _T_271 = &io_trigger_pkt_any_0_tdata2[16:0]; // @[el2_lib.scala 244:36]
  wire  _T_272 = _T_271 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_275 = io_trigger_pkt_any_0_tdata2[17] == dec_i0_match_data_0[17]; // @[el2_lib.scala 244:78]
  wire  _T_276 = _T_272 | _T_275; // @[el2_lib.scala 244:23]
  wire  _T_278 = &io_trigger_pkt_any_0_tdata2[17:0]; // @[el2_lib.scala 244:36]
  wire  _T_279 = _T_278 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_282 = io_trigger_pkt_any_0_tdata2[18] == dec_i0_match_data_0[18]; // @[el2_lib.scala 244:78]
  wire  _T_283 = _T_279 | _T_282; // @[el2_lib.scala 244:23]
  wire  _T_285 = &io_trigger_pkt_any_0_tdata2[18:0]; // @[el2_lib.scala 244:36]
  wire  _T_286 = _T_285 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_289 = io_trigger_pkt_any_0_tdata2[19] == dec_i0_match_data_0[19]; // @[el2_lib.scala 244:78]
  wire  _T_290 = _T_286 | _T_289; // @[el2_lib.scala 244:23]
  wire  _T_292 = &io_trigger_pkt_any_0_tdata2[19:0]; // @[el2_lib.scala 244:36]
  wire  _T_293 = _T_292 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_296 = io_trigger_pkt_any_0_tdata2[20] == dec_i0_match_data_0[20]; // @[el2_lib.scala 244:78]
  wire  _T_297 = _T_293 | _T_296; // @[el2_lib.scala 244:23]
  wire  _T_299 = &io_trigger_pkt_any_0_tdata2[20:0]; // @[el2_lib.scala 244:36]
  wire  _T_300 = _T_299 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_303 = io_trigger_pkt_any_0_tdata2[21] == dec_i0_match_data_0[21]; // @[el2_lib.scala 244:78]
  wire  _T_304 = _T_300 | _T_303; // @[el2_lib.scala 244:23]
  wire  _T_306 = &io_trigger_pkt_any_0_tdata2[21:0]; // @[el2_lib.scala 244:36]
  wire  _T_307 = _T_306 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_310 = io_trigger_pkt_any_0_tdata2[22] == dec_i0_match_data_0[22]; // @[el2_lib.scala 244:78]
  wire  _T_311 = _T_307 | _T_310; // @[el2_lib.scala 244:23]
  wire  _T_313 = &io_trigger_pkt_any_0_tdata2[22:0]; // @[el2_lib.scala 244:36]
  wire  _T_314 = _T_313 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_317 = io_trigger_pkt_any_0_tdata2[23] == dec_i0_match_data_0[23]; // @[el2_lib.scala 244:78]
  wire  _T_318 = _T_314 | _T_317; // @[el2_lib.scala 244:23]
  wire  _T_320 = &io_trigger_pkt_any_0_tdata2[23:0]; // @[el2_lib.scala 244:36]
  wire  _T_321 = _T_320 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_324 = io_trigger_pkt_any_0_tdata2[24] == dec_i0_match_data_0[24]; // @[el2_lib.scala 244:78]
  wire  _T_325 = _T_321 | _T_324; // @[el2_lib.scala 244:23]
  wire  _T_327 = &io_trigger_pkt_any_0_tdata2[24:0]; // @[el2_lib.scala 244:36]
  wire  _T_328 = _T_327 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_331 = io_trigger_pkt_any_0_tdata2[25] == dec_i0_match_data_0[25]; // @[el2_lib.scala 244:78]
  wire  _T_332 = _T_328 | _T_331; // @[el2_lib.scala 244:23]
  wire  _T_334 = &io_trigger_pkt_any_0_tdata2[25:0]; // @[el2_lib.scala 244:36]
  wire  _T_335 = _T_334 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_338 = io_trigger_pkt_any_0_tdata2[26] == dec_i0_match_data_0[26]; // @[el2_lib.scala 244:78]
  wire  _T_339 = _T_335 | _T_338; // @[el2_lib.scala 244:23]
  wire  _T_341 = &io_trigger_pkt_any_0_tdata2[26:0]; // @[el2_lib.scala 244:36]
  wire  _T_342 = _T_341 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_345 = io_trigger_pkt_any_0_tdata2[27] == dec_i0_match_data_0[27]; // @[el2_lib.scala 244:78]
  wire  _T_346 = _T_342 | _T_345; // @[el2_lib.scala 244:23]
  wire  _T_348 = &io_trigger_pkt_any_0_tdata2[27:0]; // @[el2_lib.scala 244:36]
  wire  _T_349 = _T_348 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_352 = io_trigger_pkt_any_0_tdata2[28] == dec_i0_match_data_0[28]; // @[el2_lib.scala 244:78]
  wire  _T_353 = _T_349 | _T_352; // @[el2_lib.scala 244:23]
  wire  _T_355 = &io_trigger_pkt_any_0_tdata2[28:0]; // @[el2_lib.scala 244:36]
  wire  _T_356 = _T_355 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_359 = io_trigger_pkt_any_0_tdata2[29] == dec_i0_match_data_0[29]; // @[el2_lib.scala 244:78]
  wire  _T_360 = _T_356 | _T_359; // @[el2_lib.scala 244:23]
  wire  _T_362 = &io_trigger_pkt_any_0_tdata2[29:0]; // @[el2_lib.scala 244:36]
  wire  _T_363 = _T_362 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_366 = io_trigger_pkt_any_0_tdata2[30] == dec_i0_match_data_0[30]; // @[el2_lib.scala 244:78]
  wire  _T_367 = _T_363 | _T_366; // @[el2_lib.scala 244:23]
  wire  _T_369 = &io_trigger_pkt_any_0_tdata2[30:0]; // @[el2_lib.scala 244:36]
  wire  _T_370 = _T_369 & _T_153; // @[el2_lib.scala 244:41]
  wire  _T_373 = io_trigger_pkt_any_0_tdata2[31] == dec_i0_match_data_0[31]; // @[el2_lib.scala 244:78]
  wire  _T_374 = _T_370 | _T_373; // @[el2_lib.scala 244:23]
  wire [7:0] _T_381 = {_T_206,_T_199,_T_192,_T_185,_T_178,_T_171,_T_164,_T_157}; // @[el2_lib.scala 245:14]
  wire [15:0] _T_389 = {_T_262,_T_255,_T_248,_T_241,_T_234,_T_227,_T_220,_T_213,_T_381}; // @[el2_lib.scala 245:14]
  wire [7:0] _T_396 = {_T_318,_T_311,_T_304,_T_297,_T_290,_T_283,_T_276,_T_269}; // @[el2_lib.scala 245:14]
  wire [31:0] _T_405 = {_T_374,_T_367,_T_360,_T_353,_T_346,_T_339,_T_332,_T_325,_T_396,_T_389}; // @[el2_lib.scala 245:14]
  wire [31:0] _GEN_0 = {{31'd0}, _T_148}; // @[el2_dec_trigger.scala 15:109]
  wire [31:0] _T_406 = _GEN_0 & _T_405; // @[el2_dec_trigger.scala 15:109]
  wire  _T_407 = io_trigger_pkt_any_1_execute & io_trigger_pkt_any_1_m; // @[el2_dec_trigger.scala 15:83]
  wire  _T_410 = &io_trigger_pkt_any_1_tdata2; // @[el2_lib.scala 241:45]
  wire  _T_411 = ~_T_410; // @[el2_lib.scala 241:39]
  wire  _T_412 = io_trigger_pkt_any_1_match_ & _T_411; // @[el2_lib.scala 241:37]
  wire  _T_415 = io_trigger_pkt_any_1_tdata2[0] == dec_i0_match_data_1[0]; // @[el2_lib.scala 242:52]
  wire  _T_416 = _T_412 | _T_415; // @[el2_lib.scala 242:41]
  wire  _T_418 = &io_trigger_pkt_any_1_tdata2[0]; // @[el2_lib.scala 244:36]
  wire  _T_419 = _T_418 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_422 = io_trigger_pkt_any_1_tdata2[1] == dec_i0_match_data_1[1]; // @[el2_lib.scala 244:78]
  wire  _T_423 = _T_419 | _T_422; // @[el2_lib.scala 244:23]
  wire  _T_425 = &io_trigger_pkt_any_1_tdata2[1:0]; // @[el2_lib.scala 244:36]
  wire  _T_426 = _T_425 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_429 = io_trigger_pkt_any_1_tdata2[2] == dec_i0_match_data_1[2]; // @[el2_lib.scala 244:78]
  wire  _T_430 = _T_426 | _T_429; // @[el2_lib.scala 244:23]
  wire  _T_432 = &io_trigger_pkt_any_1_tdata2[2:0]; // @[el2_lib.scala 244:36]
  wire  _T_433 = _T_432 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_436 = io_trigger_pkt_any_1_tdata2[3] == dec_i0_match_data_1[3]; // @[el2_lib.scala 244:78]
  wire  _T_437 = _T_433 | _T_436; // @[el2_lib.scala 244:23]
  wire  _T_439 = &io_trigger_pkt_any_1_tdata2[3:0]; // @[el2_lib.scala 244:36]
  wire  _T_440 = _T_439 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_443 = io_trigger_pkt_any_1_tdata2[4] == dec_i0_match_data_1[4]; // @[el2_lib.scala 244:78]
  wire  _T_444 = _T_440 | _T_443; // @[el2_lib.scala 244:23]
  wire  _T_446 = &io_trigger_pkt_any_1_tdata2[4:0]; // @[el2_lib.scala 244:36]
  wire  _T_447 = _T_446 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_450 = io_trigger_pkt_any_1_tdata2[5] == dec_i0_match_data_1[5]; // @[el2_lib.scala 244:78]
  wire  _T_451 = _T_447 | _T_450; // @[el2_lib.scala 244:23]
  wire  _T_453 = &io_trigger_pkt_any_1_tdata2[5:0]; // @[el2_lib.scala 244:36]
  wire  _T_454 = _T_453 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_457 = io_trigger_pkt_any_1_tdata2[6] == dec_i0_match_data_1[6]; // @[el2_lib.scala 244:78]
  wire  _T_458 = _T_454 | _T_457; // @[el2_lib.scala 244:23]
  wire  _T_460 = &io_trigger_pkt_any_1_tdata2[6:0]; // @[el2_lib.scala 244:36]
  wire  _T_461 = _T_460 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_464 = io_trigger_pkt_any_1_tdata2[7] == dec_i0_match_data_1[7]; // @[el2_lib.scala 244:78]
  wire  _T_465 = _T_461 | _T_464; // @[el2_lib.scala 244:23]
  wire  _T_467 = &io_trigger_pkt_any_1_tdata2[7:0]; // @[el2_lib.scala 244:36]
  wire  _T_468 = _T_467 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_471 = io_trigger_pkt_any_1_tdata2[8] == dec_i0_match_data_1[8]; // @[el2_lib.scala 244:78]
  wire  _T_472 = _T_468 | _T_471; // @[el2_lib.scala 244:23]
  wire  _T_474 = &io_trigger_pkt_any_1_tdata2[8:0]; // @[el2_lib.scala 244:36]
  wire  _T_475 = _T_474 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_478 = io_trigger_pkt_any_1_tdata2[9] == dec_i0_match_data_1[9]; // @[el2_lib.scala 244:78]
  wire  _T_479 = _T_475 | _T_478; // @[el2_lib.scala 244:23]
  wire  _T_481 = &io_trigger_pkt_any_1_tdata2[9:0]; // @[el2_lib.scala 244:36]
  wire  _T_482 = _T_481 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_485 = io_trigger_pkt_any_1_tdata2[10] == dec_i0_match_data_1[10]; // @[el2_lib.scala 244:78]
  wire  _T_486 = _T_482 | _T_485; // @[el2_lib.scala 244:23]
  wire  _T_488 = &io_trigger_pkt_any_1_tdata2[10:0]; // @[el2_lib.scala 244:36]
  wire  _T_489 = _T_488 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_492 = io_trigger_pkt_any_1_tdata2[11] == dec_i0_match_data_1[11]; // @[el2_lib.scala 244:78]
  wire  _T_493 = _T_489 | _T_492; // @[el2_lib.scala 244:23]
  wire  _T_495 = &io_trigger_pkt_any_1_tdata2[11:0]; // @[el2_lib.scala 244:36]
  wire  _T_496 = _T_495 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_499 = io_trigger_pkt_any_1_tdata2[12] == dec_i0_match_data_1[12]; // @[el2_lib.scala 244:78]
  wire  _T_500 = _T_496 | _T_499; // @[el2_lib.scala 244:23]
  wire  _T_502 = &io_trigger_pkt_any_1_tdata2[12:0]; // @[el2_lib.scala 244:36]
  wire  _T_503 = _T_502 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_506 = io_trigger_pkt_any_1_tdata2[13] == dec_i0_match_data_1[13]; // @[el2_lib.scala 244:78]
  wire  _T_507 = _T_503 | _T_506; // @[el2_lib.scala 244:23]
  wire  _T_509 = &io_trigger_pkt_any_1_tdata2[13:0]; // @[el2_lib.scala 244:36]
  wire  _T_510 = _T_509 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_513 = io_trigger_pkt_any_1_tdata2[14] == dec_i0_match_data_1[14]; // @[el2_lib.scala 244:78]
  wire  _T_514 = _T_510 | _T_513; // @[el2_lib.scala 244:23]
  wire  _T_516 = &io_trigger_pkt_any_1_tdata2[14:0]; // @[el2_lib.scala 244:36]
  wire  _T_517 = _T_516 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_520 = io_trigger_pkt_any_1_tdata2[15] == dec_i0_match_data_1[15]; // @[el2_lib.scala 244:78]
  wire  _T_521 = _T_517 | _T_520; // @[el2_lib.scala 244:23]
  wire  _T_523 = &io_trigger_pkt_any_1_tdata2[15:0]; // @[el2_lib.scala 244:36]
  wire  _T_524 = _T_523 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_527 = io_trigger_pkt_any_1_tdata2[16] == dec_i0_match_data_1[16]; // @[el2_lib.scala 244:78]
  wire  _T_528 = _T_524 | _T_527; // @[el2_lib.scala 244:23]
  wire  _T_530 = &io_trigger_pkt_any_1_tdata2[16:0]; // @[el2_lib.scala 244:36]
  wire  _T_531 = _T_530 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_534 = io_trigger_pkt_any_1_tdata2[17] == dec_i0_match_data_1[17]; // @[el2_lib.scala 244:78]
  wire  _T_535 = _T_531 | _T_534; // @[el2_lib.scala 244:23]
  wire  _T_537 = &io_trigger_pkt_any_1_tdata2[17:0]; // @[el2_lib.scala 244:36]
  wire  _T_538 = _T_537 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_541 = io_trigger_pkt_any_1_tdata2[18] == dec_i0_match_data_1[18]; // @[el2_lib.scala 244:78]
  wire  _T_542 = _T_538 | _T_541; // @[el2_lib.scala 244:23]
  wire  _T_544 = &io_trigger_pkt_any_1_tdata2[18:0]; // @[el2_lib.scala 244:36]
  wire  _T_545 = _T_544 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_548 = io_trigger_pkt_any_1_tdata2[19] == dec_i0_match_data_1[19]; // @[el2_lib.scala 244:78]
  wire  _T_549 = _T_545 | _T_548; // @[el2_lib.scala 244:23]
  wire  _T_551 = &io_trigger_pkt_any_1_tdata2[19:0]; // @[el2_lib.scala 244:36]
  wire  _T_552 = _T_551 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_555 = io_trigger_pkt_any_1_tdata2[20] == dec_i0_match_data_1[20]; // @[el2_lib.scala 244:78]
  wire  _T_556 = _T_552 | _T_555; // @[el2_lib.scala 244:23]
  wire  _T_558 = &io_trigger_pkt_any_1_tdata2[20:0]; // @[el2_lib.scala 244:36]
  wire  _T_559 = _T_558 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_562 = io_trigger_pkt_any_1_tdata2[21] == dec_i0_match_data_1[21]; // @[el2_lib.scala 244:78]
  wire  _T_563 = _T_559 | _T_562; // @[el2_lib.scala 244:23]
  wire  _T_565 = &io_trigger_pkt_any_1_tdata2[21:0]; // @[el2_lib.scala 244:36]
  wire  _T_566 = _T_565 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_569 = io_trigger_pkt_any_1_tdata2[22] == dec_i0_match_data_1[22]; // @[el2_lib.scala 244:78]
  wire  _T_570 = _T_566 | _T_569; // @[el2_lib.scala 244:23]
  wire  _T_572 = &io_trigger_pkt_any_1_tdata2[22:0]; // @[el2_lib.scala 244:36]
  wire  _T_573 = _T_572 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_576 = io_trigger_pkt_any_1_tdata2[23] == dec_i0_match_data_1[23]; // @[el2_lib.scala 244:78]
  wire  _T_577 = _T_573 | _T_576; // @[el2_lib.scala 244:23]
  wire  _T_579 = &io_trigger_pkt_any_1_tdata2[23:0]; // @[el2_lib.scala 244:36]
  wire  _T_580 = _T_579 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_583 = io_trigger_pkt_any_1_tdata2[24] == dec_i0_match_data_1[24]; // @[el2_lib.scala 244:78]
  wire  _T_584 = _T_580 | _T_583; // @[el2_lib.scala 244:23]
  wire  _T_586 = &io_trigger_pkt_any_1_tdata2[24:0]; // @[el2_lib.scala 244:36]
  wire  _T_587 = _T_586 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_590 = io_trigger_pkt_any_1_tdata2[25] == dec_i0_match_data_1[25]; // @[el2_lib.scala 244:78]
  wire  _T_591 = _T_587 | _T_590; // @[el2_lib.scala 244:23]
  wire  _T_593 = &io_trigger_pkt_any_1_tdata2[25:0]; // @[el2_lib.scala 244:36]
  wire  _T_594 = _T_593 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_597 = io_trigger_pkt_any_1_tdata2[26] == dec_i0_match_data_1[26]; // @[el2_lib.scala 244:78]
  wire  _T_598 = _T_594 | _T_597; // @[el2_lib.scala 244:23]
  wire  _T_600 = &io_trigger_pkt_any_1_tdata2[26:0]; // @[el2_lib.scala 244:36]
  wire  _T_601 = _T_600 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_604 = io_trigger_pkt_any_1_tdata2[27] == dec_i0_match_data_1[27]; // @[el2_lib.scala 244:78]
  wire  _T_605 = _T_601 | _T_604; // @[el2_lib.scala 244:23]
  wire  _T_607 = &io_trigger_pkt_any_1_tdata2[27:0]; // @[el2_lib.scala 244:36]
  wire  _T_608 = _T_607 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_611 = io_trigger_pkt_any_1_tdata2[28] == dec_i0_match_data_1[28]; // @[el2_lib.scala 244:78]
  wire  _T_612 = _T_608 | _T_611; // @[el2_lib.scala 244:23]
  wire  _T_614 = &io_trigger_pkt_any_1_tdata2[28:0]; // @[el2_lib.scala 244:36]
  wire  _T_615 = _T_614 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_618 = io_trigger_pkt_any_1_tdata2[29] == dec_i0_match_data_1[29]; // @[el2_lib.scala 244:78]
  wire  _T_619 = _T_615 | _T_618; // @[el2_lib.scala 244:23]
  wire  _T_621 = &io_trigger_pkt_any_1_tdata2[29:0]; // @[el2_lib.scala 244:36]
  wire  _T_622 = _T_621 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_625 = io_trigger_pkt_any_1_tdata2[30] == dec_i0_match_data_1[30]; // @[el2_lib.scala 244:78]
  wire  _T_626 = _T_622 | _T_625; // @[el2_lib.scala 244:23]
  wire  _T_628 = &io_trigger_pkt_any_1_tdata2[30:0]; // @[el2_lib.scala 244:36]
  wire  _T_629 = _T_628 & _T_412; // @[el2_lib.scala 244:41]
  wire  _T_632 = io_trigger_pkt_any_1_tdata2[31] == dec_i0_match_data_1[31]; // @[el2_lib.scala 244:78]
  wire  _T_633 = _T_629 | _T_632; // @[el2_lib.scala 244:23]
  wire [7:0] _T_640 = {_T_465,_T_458,_T_451,_T_444,_T_437,_T_430,_T_423,_T_416}; // @[el2_lib.scala 245:14]
  wire [15:0] _T_648 = {_T_521,_T_514,_T_507,_T_500,_T_493,_T_486,_T_479,_T_472,_T_640}; // @[el2_lib.scala 245:14]
  wire [7:0] _T_655 = {_T_577,_T_570,_T_563,_T_556,_T_549,_T_542,_T_535,_T_528}; // @[el2_lib.scala 245:14]
  wire [31:0] _T_664 = {_T_633,_T_626,_T_619,_T_612,_T_605,_T_598,_T_591,_T_584,_T_655,_T_648}; // @[el2_lib.scala 245:14]
  wire [31:0] _GEN_1 = {{31'd0}, _T_407}; // @[el2_dec_trigger.scala 15:109]
  wire [31:0] _T_665 = _GEN_1 & _T_664; // @[el2_dec_trigger.scala 15:109]
  wire  _T_666 = io_trigger_pkt_any_2_execute & io_trigger_pkt_any_2_m; // @[el2_dec_trigger.scala 15:83]
  wire  _T_669 = &io_trigger_pkt_any_2_tdata2; // @[el2_lib.scala 241:45]
  wire  _T_670 = ~_T_669; // @[el2_lib.scala 241:39]
  wire  _T_671 = io_trigger_pkt_any_2_match_ & _T_670; // @[el2_lib.scala 241:37]
  wire  _T_674 = io_trigger_pkt_any_2_tdata2[0] == dec_i0_match_data_2[0]; // @[el2_lib.scala 242:52]
  wire  _T_675 = _T_671 | _T_674; // @[el2_lib.scala 242:41]
  wire  _T_677 = &io_trigger_pkt_any_2_tdata2[0]; // @[el2_lib.scala 244:36]
  wire  _T_678 = _T_677 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_681 = io_trigger_pkt_any_2_tdata2[1] == dec_i0_match_data_2[1]; // @[el2_lib.scala 244:78]
  wire  _T_682 = _T_678 | _T_681; // @[el2_lib.scala 244:23]
  wire  _T_684 = &io_trigger_pkt_any_2_tdata2[1:0]; // @[el2_lib.scala 244:36]
  wire  _T_685 = _T_684 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_688 = io_trigger_pkt_any_2_tdata2[2] == dec_i0_match_data_2[2]; // @[el2_lib.scala 244:78]
  wire  _T_689 = _T_685 | _T_688; // @[el2_lib.scala 244:23]
  wire  _T_691 = &io_trigger_pkt_any_2_tdata2[2:0]; // @[el2_lib.scala 244:36]
  wire  _T_692 = _T_691 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_695 = io_trigger_pkt_any_2_tdata2[3] == dec_i0_match_data_2[3]; // @[el2_lib.scala 244:78]
  wire  _T_696 = _T_692 | _T_695; // @[el2_lib.scala 244:23]
  wire  _T_698 = &io_trigger_pkt_any_2_tdata2[3:0]; // @[el2_lib.scala 244:36]
  wire  _T_699 = _T_698 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_702 = io_trigger_pkt_any_2_tdata2[4] == dec_i0_match_data_2[4]; // @[el2_lib.scala 244:78]
  wire  _T_703 = _T_699 | _T_702; // @[el2_lib.scala 244:23]
  wire  _T_705 = &io_trigger_pkt_any_2_tdata2[4:0]; // @[el2_lib.scala 244:36]
  wire  _T_706 = _T_705 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_709 = io_trigger_pkt_any_2_tdata2[5] == dec_i0_match_data_2[5]; // @[el2_lib.scala 244:78]
  wire  _T_710 = _T_706 | _T_709; // @[el2_lib.scala 244:23]
  wire  _T_712 = &io_trigger_pkt_any_2_tdata2[5:0]; // @[el2_lib.scala 244:36]
  wire  _T_713 = _T_712 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_716 = io_trigger_pkt_any_2_tdata2[6] == dec_i0_match_data_2[6]; // @[el2_lib.scala 244:78]
  wire  _T_717 = _T_713 | _T_716; // @[el2_lib.scala 244:23]
  wire  _T_719 = &io_trigger_pkt_any_2_tdata2[6:0]; // @[el2_lib.scala 244:36]
  wire  _T_720 = _T_719 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_723 = io_trigger_pkt_any_2_tdata2[7] == dec_i0_match_data_2[7]; // @[el2_lib.scala 244:78]
  wire  _T_724 = _T_720 | _T_723; // @[el2_lib.scala 244:23]
  wire  _T_726 = &io_trigger_pkt_any_2_tdata2[7:0]; // @[el2_lib.scala 244:36]
  wire  _T_727 = _T_726 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_730 = io_trigger_pkt_any_2_tdata2[8] == dec_i0_match_data_2[8]; // @[el2_lib.scala 244:78]
  wire  _T_731 = _T_727 | _T_730; // @[el2_lib.scala 244:23]
  wire  _T_733 = &io_trigger_pkt_any_2_tdata2[8:0]; // @[el2_lib.scala 244:36]
  wire  _T_734 = _T_733 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_737 = io_trigger_pkt_any_2_tdata2[9] == dec_i0_match_data_2[9]; // @[el2_lib.scala 244:78]
  wire  _T_738 = _T_734 | _T_737; // @[el2_lib.scala 244:23]
  wire  _T_740 = &io_trigger_pkt_any_2_tdata2[9:0]; // @[el2_lib.scala 244:36]
  wire  _T_741 = _T_740 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_744 = io_trigger_pkt_any_2_tdata2[10] == dec_i0_match_data_2[10]; // @[el2_lib.scala 244:78]
  wire  _T_745 = _T_741 | _T_744; // @[el2_lib.scala 244:23]
  wire  _T_747 = &io_trigger_pkt_any_2_tdata2[10:0]; // @[el2_lib.scala 244:36]
  wire  _T_748 = _T_747 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_751 = io_trigger_pkt_any_2_tdata2[11] == dec_i0_match_data_2[11]; // @[el2_lib.scala 244:78]
  wire  _T_752 = _T_748 | _T_751; // @[el2_lib.scala 244:23]
  wire  _T_754 = &io_trigger_pkt_any_2_tdata2[11:0]; // @[el2_lib.scala 244:36]
  wire  _T_755 = _T_754 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_758 = io_trigger_pkt_any_2_tdata2[12] == dec_i0_match_data_2[12]; // @[el2_lib.scala 244:78]
  wire  _T_759 = _T_755 | _T_758; // @[el2_lib.scala 244:23]
  wire  _T_761 = &io_trigger_pkt_any_2_tdata2[12:0]; // @[el2_lib.scala 244:36]
  wire  _T_762 = _T_761 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_765 = io_trigger_pkt_any_2_tdata2[13] == dec_i0_match_data_2[13]; // @[el2_lib.scala 244:78]
  wire  _T_766 = _T_762 | _T_765; // @[el2_lib.scala 244:23]
  wire  _T_768 = &io_trigger_pkt_any_2_tdata2[13:0]; // @[el2_lib.scala 244:36]
  wire  _T_769 = _T_768 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_772 = io_trigger_pkt_any_2_tdata2[14] == dec_i0_match_data_2[14]; // @[el2_lib.scala 244:78]
  wire  _T_773 = _T_769 | _T_772; // @[el2_lib.scala 244:23]
  wire  _T_775 = &io_trigger_pkt_any_2_tdata2[14:0]; // @[el2_lib.scala 244:36]
  wire  _T_776 = _T_775 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_779 = io_trigger_pkt_any_2_tdata2[15] == dec_i0_match_data_2[15]; // @[el2_lib.scala 244:78]
  wire  _T_780 = _T_776 | _T_779; // @[el2_lib.scala 244:23]
  wire  _T_782 = &io_trigger_pkt_any_2_tdata2[15:0]; // @[el2_lib.scala 244:36]
  wire  _T_783 = _T_782 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_786 = io_trigger_pkt_any_2_tdata2[16] == dec_i0_match_data_2[16]; // @[el2_lib.scala 244:78]
  wire  _T_787 = _T_783 | _T_786; // @[el2_lib.scala 244:23]
  wire  _T_789 = &io_trigger_pkt_any_2_tdata2[16:0]; // @[el2_lib.scala 244:36]
  wire  _T_790 = _T_789 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_793 = io_trigger_pkt_any_2_tdata2[17] == dec_i0_match_data_2[17]; // @[el2_lib.scala 244:78]
  wire  _T_794 = _T_790 | _T_793; // @[el2_lib.scala 244:23]
  wire  _T_796 = &io_trigger_pkt_any_2_tdata2[17:0]; // @[el2_lib.scala 244:36]
  wire  _T_797 = _T_796 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_800 = io_trigger_pkt_any_2_tdata2[18] == dec_i0_match_data_2[18]; // @[el2_lib.scala 244:78]
  wire  _T_801 = _T_797 | _T_800; // @[el2_lib.scala 244:23]
  wire  _T_803 = &io_trigger_pkt_any_2_tdata2[18:0]; // @[el2_lib.scala 244:36]
  wire  _T_804 = _T_803 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_807 = io_trigger_pkt_any_2_tdata2[19] == dec_i0_match_data_2[19]; // @[el2_lib.scala 244:78]
  wire  _T_808 = _T_804 | _T_807; // @[el2_lib.scala 244:23]
  wire  _T_810 = &io_trigger_pkt_any_2_tdata2[19:0]; // @[el2_lib.scala 244:36]
  wire  _T_811 = _T_810 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_814 = io_trigger_pkt_any_2_tdata2[20] == dec_i0_match_data_2[20]; // @[el2_lib.scala 244:78]
  wire  _T_815 = _T_811 | _T_814; // @[el2_lib.scala 244:23]
  wire  _T_817 = &io_trigger_pkt_any_2_tdata2[20:0]; // @[el2_lib.scala 244:36]
  wire  _T_818 = _T_817 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_821 = io_trigger_pkt_any_2_tdata2[21] == dec_i0_match_data_2[21]; // @[el2_lib.scala 244:78]
  wire  _T_822 = _T_818 | _T_821; // @[el2_lib.scala 244:23]
  wire  _T_824 = &io_trigger_pkt_any_2_tdata2[21:0]; // @[el2_lib.scala 244:36]
  wire  _T_825 = _T_824 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_828 = io_trigger_pkt_any_2_tdata2[22] == dec_i0_match_data_2[22]; // @[el2_lib.scala 244:78]
  wire  _T_829 = _T_825 | _T_828; // @[el2_lib.scala 244:23]
  wire  _T_831 = &io_trigger_pkt_any_2_tdata2[22:0]; // @[el2_lib.scala 244:36]
  wire  _T_832 = _T_831 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_835 = io_trigger_pkt_any_2_tdata2[23] == dec_i0_match_data_2[23]; // @[el2_lib.scala 244:78]
  wire  _T_836 = _T_832 | _T_835; // @[el2_lib.scala 244:23]
  wire  _T_838 = &io_trigger_pkt_any_2_tdata2[23:0]; // @[el2_lib.scala 244:36]
  wire  _T_839 = _T_838 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_842 = io_trigger_pkt_any_2_tdata2[24] == dec_i0_match_data_2[24]; // @[el2_lib.scala 244:78]
  wire  _T_843 = _T_839 | _T_842; // @[el2_lib.scala 244:23]
  wire  _T_845 = &io_trigger_pkt_any_2_tdata2[24:0]; // @[el2_lib.scala 244:36]
  wire  _T_846 = _T_845 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_849 = io_trigger_pkt_any_2_tdata2[25] == dec_i0_match_data_2[25]; // @[el2_lib.scala 244:78]
  wire  _T_850 = _T_846 | _T_849; // @[el2_lib.scala 244:23]
  wire  _T_852 = &io_trigger_pkt_any_2_tdata2[25:0]; // @[el2_lib.scala 244:36]
  wire  _T_853 = _T_852 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_856 = io_trigger_pkt_any_2_tdata2[26] == dec_i0_match_data_2[26]; // @[el2_lib.scala 244:78]
  wire  _T_857 = _T_853 | _T_856; // @[el2_lib.scala 244:23]
  wire  _T_859 = &io_trigger_pkt_any_2_tdata2[26:0]; // @[el2_lib.scala 244:36]
  wire  _T_860 = _T_859 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_863 = io_trigger_pkt_any_2_tdata2[27] == dec_i0_match_data_2[27]; // @[el2_lib.scala 244:78]
  wire  _T_864 = _T_860 | _T_863; // @[el2_lib.scala 244:23]
  wire  _T_866 = &io_trigger_pkt_any_2_tdata2[27:0]; // @[el2_lib.scala 244:36]
  wire  _T_867 = _T_866 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_870 = io_trigger_pkt_any_2_tdata2[28] == dec_i0_match_data_2[28]; // @[el2_lib.scala 244:78]
  wire  _T_871 = _T_867 | _T_870; // @[el2_lib.scala 244:23]
  wire  _T_873 = &io_trigger_pkt_any_2_tdata2[28:0]; // @[el2_lib.scala 244:36]
  wire  _T_874 = _T_873 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_877 = io_trigger_pkt_any_2_tdata2[29] == dec_i0_match_data_2[29]; // @[el2_lib.scala 244:78]
  wire  _T_878 = _T_874 | _T_877; // @[el2_lib.scala 244:23]
  wire  _T_880 = &io_trigger_pkt_any_2_tdata2[29:0]; // @[el2_lib.scala 244:36]
  wire  _T_881 = _T_880 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_884 = io_trigger_pkt_any_2_tdata2[30] == dec_i0_match_data_2[30]; // @[el2_lib.scala 244:78]
  wire  _T_885 = _T_881 | _T_884; // @[el2_lib.scala 244:23]
  wire  _T_887 = &io_trigger_pkt_any_2_tdata2[30:0]; // @[el2_lib.scala 244:36]
  wire  _T_888 = _T_887 & _T_671; // @[el2_lib.scala 244:41]
  wire  _T_891 = io_trigger_pkt_any_2_tdata2[31] == dec_i0_match_data_2[31]; // @[el2_lib.scala 244:78]
  wire  _T_892 = _T_888 | _T_891; // @[el2_lib.scala 244:23]
  wire [7:0] _T_899 = {_T_724,_T_717,_T_710,_T_703,_T_696,_T_689,_T_682,_T_675}; // @[el2_lib.scala 245:14]
  wire [15:0] _T_907 = {_T_780,_T_773,_T_766,_T_759,_T_752,_T_745,_T_738,_T_731,_T_899}; // @[el2_lib.scala 245:14]
  wire [7:0] _T_914 = {_T_836,_T_829,_T_822,_T_815,_T_808,_T_801,_T_794,_T_787}; // @[el2_lib.scala 245:14]
  wire [31:0] _T_923 = {_T_892,_T_885,_T_878,_T_871,_T_864,_T_857,_T_850,_T_843,_T_914,_T_907}; // @[el2_lib.scala 245:14]
  wire [31:0] _GEN_2 = {{31'd0}, _T_666}; // @[el2_dec_trigger.scala 15:109]
  wire [31:0] _T_924 = _GEN_2 & _T_923; // @[el2_dec_trigger.scala 15:109]
  wire  _T_925 = io_trigger_pkt_any_3_execute & io_trigger_pkt_any_3_m; // @[el2_dec_trigger.scala 15:83]
  wire  _T_928 = &io_trigger_pkt_any_3_tdata2; // @[el2_lib.scala 241:45]
  wire  _T_929 = ~_T_928; // @[el2_lib.scala 241:39]
  wire  _T_930 = io_trigger_pkt_any_3_match_ & _T_929; // @[el2_lib.scala 241:37]
  wire  _T_933 = io_trigger_pkt_any_3_tdata2[0] == dec_i0_match_data_3[0]; // @[el2_lib.scala 242:52]
  wire  _T_934 = _T_930 | _T_933; // @[el2_lib.scala 242:41]
  wire  _T_936 = &io_trigger_pkt_any_3_tdata2[0]; // @[el2_lib.scala 244:36]
  wire  _T_937 = _T_936 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_940 = io_trigger_pkt_any_3_tdata2[1] == dec_i0_match_data_3[1]; // @[el2_lib.scala 244:78]
  wire  _T_941 = _T_937 | _T_940; // @[el2_lib.scala 244:23]
  wire  _T_943 = &io_trigger_pkt_any_3_tdata2[1:0]; // @[el2_lib.scala 244:36]
  wire  _T_944 = _T_943 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_947 = io_trigger_pkt_any_3_tdata2[2] == dec_i0_match_data_3[2]; // @[el2_lib.scala 244:78]
  wire  _T_948 = _T_944 | _T_947; // @[el2_lib.scala 244:23]
  wire  _T_950 = &io_trigger_pkt_any_3_tdata2[2:0]; // @[el2_lib.scala 244:36]
  wire  _T_951 = _T_950 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_954 = io_trigger_pkt_any_3_tdata2[3] == dec_i0_match_data_3[3]; // @[el2_lib.scala 244:78]
  wire  _T_955 = _T_951 | _T_954; // @[el2_lib.scala 244:23]
  wire  _T_957 = &io_trigger_pkt_any_3_tdata2[3:0]; // @[el2_lib.scala 244:36]
  wire  _T_958 = _T_957 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_961 = io_trigger_pkt_any_3_tdata2[4] == dec_i0_match_data_3[4]; // @[el2_lib.scala 244:78]
  wire  _T_962 = _T_958 | _T_961; // @[el2_lib.scala 244:23]
  wire  _T_964 = &io_trigger_pkt_any_3_tdata2[4:0]; // @[el2_lib.scala 244:36]
  wire  _T_965 = _T_964 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_968 = io_trigger_pkt_any_3_tdata2[5] == dec_i0_match_data_3[5]; // @[el2_lib.scala 244:78]
  wire  _T_969 = _T_965 | _T_968; // @[el2_lib.scala 244:23]
  wire  _T_971 = &io_trigger_pkt_any_3_tdata2[5:0]; // @[el2_lib.scala 244:36]
  wire  _T_972 = _T_971 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_975 = io_trigger_pkt_any_3_tdata2[6] == dec_i0_match_data_3[6]; // @[el2_lib.scala 244:78]
  wire  _T_976 = _T_972 | _T_975; // @[el2_lib.scala 244:23]
  wire  _T_978 = &io_trigger_pkt_any_3_tdata2[6:0]; // @[el2_lib.scala 244:36]
  wire  _T_979 = _T_978 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_982 = io_trigger_pkt_any_3_tdata2[7] == dec_i0_match_data_3[7]; // @[el2_lib.scala 244:78]
  wire  _T_983 = _T_979 | _T_982; // @[el2_lib.scala 244:23]
  wire  _T_985 = &io_trigger_pkt_any_3_tdata2[7:0]; // @[el2_lib.scala 244:36]
  wire  _T_986 = _T_985 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_989 = io_trigger_pkt_any_3_tdata2[8] == dec_i0_match_data_3[8]; // @[el2_lib.scala 244:78]
  wire  _T_990 = _T_986 | _T_989; // @[el2_lib.scala 244:23]
  wire  _T_992 = &io_trigger_pkt_any_3_tdata2[8:0]; // @[el2_lib.scala 244:36]
  wire  _T_993 = _T_992 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_996 = io_trigger_pkt_any_3_tdata2[9] == dec_i0_match_data_3[9]; // @[el2_lib.scala 244:78]
  wire  _T_997 = _T_993 | _T_996; // @[el2_lib.scala 244:23]
  wire  _T_999 = &io_trigger_pkt_any_3_tdata2[9:0]; // @[el2_lib.scala 244:36]
  wire  _T_1000 = _T_999 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1003 = io_trigger_pkt_any_3_tdata2[10] == dec_i0_match_data_3[10]; // @[el2_lib.scala 244:78]
  wire  _T_1004 = _T_1000 | _T_1003; // @[el2_lib.scala 244:23]
  wire  _T_1006 = &io_trigger_pkt_any_3_tdata2[10:0]; // @[el2_lib.scala 244:36]
  wire  _T_1007 = _T_1006 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1010 = io_trigger_pkt_any_3_tdata2[11] == dec_i0_match_data_3[11]; // @[el2_lib.scala 244:78]
  wire  _T_1011 = _T_1007 | _T_1010; // @[el2_lib.scala 244:23]
  wire  _T_1013 = &io_trigger_pkt_any_3_tdata2[11:0]; // @[el2_lib.scala 244:36]
  wire  _T_1014 = _T_1013 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1017 = io_trigger_pkt_any_3_tdata2[12] == dec_i0_match_data_3[12]; // @[el2_lib.scala 244:78]
  wire  _T_1018 = _T_1014 | _T_1017; // @[el2_lib.scala 244:23]
  wire  _T_1020 = &io_trigger_pkt_any_3_tdata2[12:0]; // @[el2_lib.scala 244:36]
  wire  _T_1021 = _T_1020 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1024 = io_trigger_pkt_any_3_tdata2[13] == dec_i0_match_data_3[13]; // @[el2_lib.scala 244:78]
  wire  _T_1025 = _T_1021 | _T_1024; // @[el2_lib.scala 244:23]
  wire  _T_1027 = &io_trigger_pkt_any_3_tdata2[13:0]; // @[el2_lib.scala 244:36]
  wire  _T_1028 = _T_1027 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1031 = io_trigger_pkt_any_3_tdata2[14] == dec_i0_match_data_3[14]; // @[el2_lib.scala 244:78]
  wire  _T_1032 = _T_1028 | _T_1031; // @[el2_lib.scala 244:23]
  wire  _T_1034 = &io_trigger_pkt_any_3_tdata2[14:0]; // @[el2_lib.scala 244:36]
  wire  _T_1035 = _T_1034 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1038 = io_trigger_pkt_any_3_tdata2[15] == dec_i0_match_data_3[15]; // @[el2_lib.scala 244:78]
  wire  _T_1039 = _T_1035 | _T_1038; // @[el2_lib.scala 244:23]
  wire  _T_1041 = &io_trigger_pkt_any_3_tdata2[15:0]; // @[el2_lib.scala 244:36]
  wire  _T_1042 = _T_1041 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1045 = io_trigger_pkt_any_3_tdata2[16] == dec_i0_match_data_3[16]; // @[el2_lib.scala 244:78]
  wire  _T_1046 = _T_1042 | _T_1045; // @[el2_lib.scala 244:23]
  wire  _T_1048 = &io_trigger_pkt_any_3_tdata2[16:0]; // @[el2_lib.scala 244:36]
  wire  _T_1049 = _T_1048 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1052 = io_trigger_pkt_any_3_tdata2[17] == dec_i0_match_data_3[17]; // @[el2_lib.scala 244:78]
  wire  _T_1053 = _T_1049 | _T_1052; // @[el2_lib.scala 244:23]
  wire  _T_1055 = &io_trigger_pkt_any_3_tdata2[17:0]; // @[el2_lib.scala 244:36]
  wire  _T_1056 = _T_1055 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1059 = io_trigger_pkt_any_3_tdata2[18] == dec_i0_match_data_3[18]; // @[el2_lib.scala 244:78]
  wire  _T_1060 = _T_1056 | _T_1059; // @[el2_lib.scala 244:23]
  wire  _T_1062 = &io_trigger_pkt_any_3_tdata2[18:0]; // @[el2_lib.scala 244:36]
  wire  _T_1063 = _T_1062 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1066 = io_trigger_pkt_any_3_tdata2[19] == dec_i0_match_data_3[19]; // @[el2_lib.scala 244:78]
  wire  _T_1067 = _T_1063 | _T_1066; // @[el2_lib.scala 244:23]
  wire  _T_1069 = &io_trigger_pkt_any_3_tdata2[19:0]; // @[el2_lib.scala 244:36]
  wire  _T_1070 = _T_1069 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1073 = io_trigger_pkt_any_3_tdata2[20] == dec_i0_match_data_3[20]; // @[el2_lib.scala 244:78]
  wire  _T_1074 = _T_1070 | _T_1073; // @[el2_lib.scala 244:23]
  wire  _T_1076 = &io_trigger_pkt_any_3_tdata2[20:0]; // @[el2_lib.scala 244:36]
  wire  _T_1077 = _T_1076 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1080 = io_trigger_pkt_any_3_tdata2[21] == dec_i0_match_data_3[21]; // @[el2_lib.scala 244:78]
  wire  _T_1081 = _T_1077 | _T_1080; // @[el2_lib.scala 244:23]
  wire  _T_1083 = &io_trigger_pkt_any_3_tdata2[21:0]; // @[el2_lib.scala 244:36]
  wire  _T_1084 = _T_1083 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1087 = io_trigger_pkt_any_3_tdata2[22] == dec_i0_match_data_3[22]; // @[el2_lib.scala 244:78]
  wire  _T_1088 = _T_1084 | _T_1087; // @[el2_lib.scala 244:23]
  wire  _T_1090 = &io_trigger_pkt_any_3_tdata2[22:0]; // @[el2_lib.scala 244:36]
  wire  _T_1091 = _T_1090 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1094 = io_trigger_pkt_any_3_tdata2[23] == dec_i0_match_data_3[23]; // @[el2_lib.scala 244:78]
  wire  _T_1095 = _T_1091 | _T_1094; // @[el2_lib.scala 244:23]
  wire  _T_1097 = &io_trigger_pkt_any_3_tdata2[23:0]; // @[el2_lib.scala 244:36]
  wire  _T_1098 = _T_1097 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1101 = io_trigger_pkt_any_3_tdata2[24] == dec_i0_match_data_3[24]; // @[el2_lib.scala 244:78]
  wire  _T_1102 = _T_1098 | _T_1101; // @[el2_lib.scala 244:23]
  wire  _T_1104 = &io_trigger_pkt_any_3_tdata2[24:0]; // @[el2_lib.scala 244:36]
  wire  _T_1105 = _T_1104 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1108 = io_trigger_pkt_any_3_tdata2[25] == dec_i0_match_data_3[25]; // @[el2_lib.scala 244:78]
  wire  _T_1109 = _T_1105 | _T_1108; // @[el2_lib.scala 244:23]
  wire  _T_1111 = &io_trigger_pkt_any_3_tdata2[25:0]; // @[el2_lib.scala 244:36]
  wire  _T_1112 = _T_1111 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1115 = io_trigger_pkt_any_3_tdata2[26] == dec_i0_match_data_3[26]; // @[el2_lib.scala 244:78]
  wire  _T_1116 = _T_1112 | _T_1115; // @[el2_lib.scala 244:23]
  wire  _T_1118 = &io_trigger_pkt_any_3_tdata2[26:0]; // @[el2_lib.scala 244:36]
  wire  _T_1119 = _T_1118 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1122 = io_trigger_pkt_any_3_tdata2[27] == dec_i0_match_data_3[27]; // @[el2_lib.scala 244:78]
  wire  _T_1123 = _T_1119 | _T_1122; // @[el2_lib.scala 244:23]
  wire  _T_1125 = &io_trigger_pkt_any_3_tdata2[27:0]; // @[el2_lib.scala 244:36]
  wire  _T_1126 = _T_1125 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1129 = io_trigger_pkt_any_3_tdata2[28] == dec_i0_match_data_3[28]; // @[el2_lib.scala 244:78]
  wire  _T_1130 = _T_1126 | _T_1129; // @[el2_lib.scala 244:23]
  wire  _T_1132 = &io_trigger_pkt_any_3_tdata2[28:0]; // @[el2_lib.scala 244:36]
  wire  _T_1133 = _T_1132 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1136 = io_trigger_pkt_any_3_tdata2[29] == dec_i0_match_data_3[29]; // @[el2_lib.scala 244:78]
  wire  _T_1137 = _T_1133 | _T_1136; // @[el2_lib.scala 244:23]
  wire  _T_1139 = &io_trigger_pkt_any_3_tdata2[29:0]; // @[el2_lib.scala 244:36]
  wire  _T_1140 = _T_1139 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1143 = io_trigger_pkt_any_3_tdata2[30] == dec_i0_match_data_3[30]; // @[el2_lib.scala 244:78]
  wire  _T_1144 = _T_1140 | _T_1143; // @[el2_lib.scala 244:23]
  wire  _T_1146 = &io_trigger_pkt_any_3_tdata2[30:0]; // @[el2_lib.scala 244:36]
  wire  _T_1147 = _T_1146 & _T_930; // @[el2_lib.scala 244:41]
  wire  _T_1150 = io_trigger_pkt_any_3_tdata2[31] == dec_i0_match_data_3[31]; // @[el2_lib.scala 244:78]
  wire  _T_1151 = _T_1147 | _T_1150; // @[el2_lib.scala 244:23]
  wire [7:0] _T_1158 = {_T_983,_T_976,_T_969,_T_962,_T_955,_T_948,_T_941,_T_934}; // @[el2_lib.scala 245:14]
  wire [15:0] _T_1166 = {_T_1039,_T_1032,_T_1025,_T_1018,_T_1011,_T_1004,_T_997,_T_990,_T_1158}; // @[el2_lib.scala 245:14]
  wire [7:0] _T_1173 = {_T_1095,_T_1088,_T_1081,_T_1074,_T_1067,_T_1060,_T_1053,_T_1046}; // @[el2_lib.scala 245:14]
  wire [31:0] _T_1182 = {_T_1151,_T_1144,_T_1137,_T_1130,_T_1123,_T_1116,_T_1109,_T_1102,_T_1173,_T_1166}; // @[el2_lib.scala 245:14]
  wire [31:0] _GEN_3 = {{31'd0}, _T_925}; // @[el2_dec_trigger.scala 15:109]
  wire [31:0] _T_1183 = _GEN_3 & _T_1182; // @[el2_dec_trigger.scala 15:109]
  wire [127:0] _T_1186 = {_T_1183,_T_924,_T_665,_T_406}; // @[Cat.scala 29:58]
  assign io_dec_i0_trigger_match_d = _T_1186[3:0]; // @[el2_dec_trigger.scala 15:29]
endmodule
module el2_dec(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_lsu_fastint_stall_any,
  output        io_dec_extint_stall,
  output        io_dec_i0_decode_d,
  output        io_dec_pause_state_cg,
  input  [30:0] io_rst_vec,
  input         io_nmi_int,
  input  [30:0] io_nmi_vec,
  input         io_i_cpu_halt_req,
  input         io_i_cpu_run_req,
  output        io_o_cpu_halt_status,
  output        io_o_cpu_halt_ack,
  output        io_o_cpu_run_ack,
  output        io_o_debug_mode_status,
  input  [27:0] io_core_id,
  input         io_mpc_debug_halt_req,
  input         io_mpc_debug_run_req,
  input         io_mpc_reset_run_req,
  output        io_mpc_debug_halt_ack,
  output        io_mpc_debug_run_ack,
  output        io_debug_brkpt_status,
  input         io_exu_pmu_i0_br_misp,
  input         io_exu_pmu_i0_br_ataken,
  input         io_exu_pmu_i0_pc4,
  input         io_lsu_nonblock_load_valid_m,
  input  [1:0]  io_lsu_nonblock_load_tag_m,
  input         io_lsu_nonblock_load_inv_r,
  input  [1:0]  io_lsu_nonblock_load_inv_tag_r,
  input         io_lsu_nonblock_load_data_valid,
  input         io_lsu_nonblock_load_data_error,
  input  [1:0]  io_lsu_nonblock_load_data_tag,
  input  [31:0] io_lsu_nonblock_load_data,
  input         io_lsu_pmu_bus_trxn,
  input         io_lsu_pmu_bus_misaligned,
  input         io_lsu_pmu_bus_error,
  input         io_lsu_pmu_bus_busy,
  input         io_lsu_pmu_misaligned_m,
  input         io_lsu_pmu_load_external_m,
  input         io_lsu_pmu_store_external_m,
  input         io_dma_pmu_dccm_read,
  input         io_dma_pmu_dccm_write,
  input         io_dma_pmu_any_read,
  input         io_dma_pmu_any_write,
  input  [30:0] io_lsu_fir_addr,
  input  [1:0]  io_lsu_fir_error,
  input         io_ifu_pmu_instr_aligned,
  input         io_ifu_pmu_fetch_stall,
  input         io_ifu_pmu_ic_miss,
  input         io_ifu_pmu_ic_hit,
  input         io_ifu_pmu_bus_error,
  input         io_ifu_pmu_bus_busy,
  input         io_ifu_pmu_bus_trxn,
  input         io_ifu_ic_error_start,
  input         io_ifu_iccm_rd_ecc_single_err,
  input  [3:0]  io_lsu_trigger_match_m,
  input         io_dbg_cmd_valid,
  input         io_dbg_cmd_write,
  input  [1:0]  io_dbg_cmd_type,
  input  [31:0] io_dbg_cmd_addr,
  input  [1:0]  io_dbg_cmd_wrdata,
  input         io_ifu_i0_icaf,
  input  [1:0]  io_ifu_i0_icaf_type,
  input         io_ifu_i0_icaf_f1,
  input         io_ifu_i0_dbecc,
  input         io_lsu_idle_any,
  input         io_i0_brp_valid,
  input  [11:0] io_i0_brp_bits_toffset,
  input  [1:0]  io_i0_brp_bits_hist,
  input         io_i0_brp_bits_br_error,
  input         io_i0_brp_bits_br_start_error,
  input         io_i0_brp_bits_bank,
  input  [30:0] io_i0_brp_bits_prett,
  input         io_i0_brp_bits_way,
  input         io_i0_brp_bits_ret,
  input  [7:0]  io_ifu_i0_bp_index,
  input  [7:0]  io_ifu_i0_bp_fghr,
  input  [4:0]  io_ifu_i0_bp_btag,
  input         io_lsu_error_pkt_r_valid,
  input         io_lsu_error_pkt_r_bits_single_ecc_error,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input         io_lsu_error_pkt_r_bits_mscause,
  input         io_lsu_error_pkt_r_bits_addr,
  input         io_lsu_single_ecc_error_incr,
  input         io_lsu_imprecise_error_load_any,
  input         io_lsu_imprecise_error_store_any,
  input  [31:0] io_lsu_imprecise_error_addr_any,
  input  [31:0] io_exu_div_result,
  input         io_exu_div_wren,
  input  [31:0] io_exu_csr_rs1_x,
  input  [31:0] io_lsu_result_m,
  input  [31:0] io_lsu_result_corr_r,
  input         io_lsu_load_stall_any,
  input         io_lsu_store_stall_any,
  input         io_dma_dccm_stall_any,
  input         io_dma_iccm_stall_any,
  input         io_iccm_dma_sb_error,
  input         io_exu_flush_final,
  input  [30:0] io_exu_npc_r,
  input  [31:0] io_exu_i0_result_x,
  input         io_ifu_i0_valid,
  input  [31:0] io_ifu_i0_instr,
  input  [30:0] io_ifu_i0_pc,
  input         io_ifu_i0_pc4,
  input  [30:0] io_exu_i0_pc_x,
  input         io_mexintpend,
  input         io_timer_int,
  input         io_soft_int,
  input  [7:0]  io_pic_claimid,
  input  [3:0]  io_pic_pl,
  input         io_mhwakeup,
  output [3:0]  io_dec_tlu_meicurpl,
  output [3:0]  io_dec_tlu_meipt,
  input  [70:0] io_ifu_ic_debug_rd_data,
  input         io_ifu_ic_debug_rd_data_valid,
  output [70:0] io_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_dec_tlu_ic_diag_pkt_icache_wr_valid,
  input         io_dbg_halt_req,
  input         io_dbg_resume_req,
  input         io_ifu_miss_state_idle,
  output        io_dec_tlu_dbg_halted,
  output        io_dec_tlu_debug_mode,
  output        io_dec_tlu_resume_ack,
  output        io_dec_tlu_flush_noredir_r,
  output        io_dec_tlu_mpc_halted_only,
  output        io_dec_tlu_flush_leak_one_r,
  output        io_dec_tlu_flush_err_r,
  output [29:0] io_dec_tlu_meihap,
  output        io_dec_debug_wdata_rs1_d,
  output [31:0] io_dec_dbg_rddata,
  output        io_dec_dbg_cmd_done,
  output        io_dec_dbg_cmd_fail,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
  output        io_dec_tlu_force_halt,
  input  [1:0]  io_exu_i0_br_hist_r,
  input         io_exu_i0_br_error_r,
  input         io_exu_i0_br_start_error_r,
  input         io_exu_i0_br_valid_r,
  input         io_exu_i0_br_mp_r,
  input         io_exu_i0_br_middle_r,
  input         io_exu_i0_br_way_r,
  output        io_dec_i0_rs1_en_d,
  output        io_dec_i0_rs2_en_d,
  output [31:0] io_gpr_i0_rs1_d,
  output [31:0] io_gpr_i0_rs2_d,
  output [31:0] io_dec_i0_immed_d,
  output [11:0] io_dec_i0_br_immed_d,
  output        io_i0_ap_land,
  output        io_i0_ap_lor,
  output        io_i0_ap_lxor,
  output        io_i0_ap_sll,
  output        io_i0_ap_srl,
  output        io_i0_ap_sra,
  output        io_i0_ap_beq,
  output        io_i0_ap_bne,
  output        io_i0_ap_blt,
  output        io_i0_ap_bge,
  output        io_i0_ap_add,
  output        io_i0_ap_sub,
  output        io_i0_ap_slt,
  output        io_i0_ap_unsign,
  output        io_i0_ap_jal,
  output        io_i0_ap_predict_t,
  output        io_i0_ap_predict_nt,
  output        io_i0_ap_csr_write,
  output        io_i0_ap_csr_imm,
  output        io_dec_i0_alu_decode_d,
  output        io_dec_i0_select_pc_d,
  output [30:0] io_dec_i0_pc_d,
  output [1:0]  io_dec_i0_rs1_bypass_en_d,
  output [1:0]  io_dec_i0_rs2_bypass_en_d,
  output [31:0] io_dec_i0_rs1_bypass_data_d,
  output [31:0] io_dec_i0_rs2_bypass_data_d,
  output        io_lsu_p_valid,
  output        io_lsu_p_bits_fast_int,
  output        io_lsu_p_bits_by,
  output        io_lsu_p_bits_half,
  output        io_lsu_p_bits_word,
  output        io_lsu_p_bits_dword,
  output        io_lsu_p_bits_load,
  output        io_lsu_p_bits_store,
  output        io_lsu_p_bits_unsign,
  output        io_lsu_p_bits_dma,
  output        io_lsu_p_bits_store_data_bypass_d,
  output        io_lsu_p_bits_load_ldst_bypass_d,
  output        io_lsu_p_bits_store_data_bypass_m,
  output        io_mul_p_valid,
  output        io_mul_p_bits_rs1_sign,
  output        io_mul_p_bits_rs2_sign,
  output        io_mul_p_bits_low,
  output        io_mul_p_bits_bext,
  output        io_mul_p_bits_bdep,
  output        io_mul_p_bits_clmul,
  output        io_mul_p_bits_clmulh,
  output        io_mul_p_bits_clmulr,
  output        io_mul_p_bits_grev,
  output        io_mul_p_bits_shfl,
  output        io_mul_p_bits_unshfl,
  output        io_mul_p_bits_crc32_b,
  output        io_mul_p_bits_crc32_h,
  output        io_mul_p_bits_crc32_w,
  output        io_mul_p_bits_crc32c_b,
  output        io_mul_p_bits_crc32c_h,
  output        io_mul_p_bits_crc32c_w,
  output        io_mul_p_bits_bfp,
  output        io_div_p_valid,
  output        io_div_p_bits_unsign,
  output        io_div_p_bits_rem,
  output        io_dec_div_cancel,
  output [11:0] io_dec_lsu_offset_d,
  output        io_dec_csr_ren_d,
  output        io_dec_tlu_flush_lower_r,
  output [30:0] io_dec_tlu_flush_path_r,
  output        io_dec_tlu_i0_kill_writeb_r,
  output        io_dec_tlu_fence_i_r,
  output [30:0] io_pred_correct_npc_x,
  output        io_dec_tlu_br0_r_pkt_valid,
  output [1:0]  io_dec_tlu_br0_r_pkt_bits_hist,
  output        io_dec_tlu_br0_r_pkt_bits_br_error,
  output        io_dec_tlu_br0_r_pkt_bits_br_start_error,
  output        io_dec_tlu_br0_r_pkt_bits_way,
  output        io_dec_tlu_br0_r_pkt_bits_middle,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  output        io_dec_i0_predict_p_d_valid,
  output        io_dec_i0_predict_p_d_bits_misp,
  output        io_dec_i0_predict_p_d_bits_ataken,
  output        io_dec_i0_predict_p_d_bits_boffset,
  output        io_dec_i0_predict_p_d_bits_pc4,
  output [1:0]  io_dec_i0_predict_p_d_bits_hist,
  output [11:0] io_dec_i0_predict_p_d_bits_toffset,
  output        io_dec_i0_predict_p_d_bits_br_error,
  output        io_dec_i0_predict_p_d_bits_br_start_error,
  output [30:0] io_dec_i0_predict_p_d_bits_prett,
  output        io_dec_i0_predict_p_d_bits_pcall,
  output        io_dec_i0_predict_p_d_bits_pret,
  output        io_dec_i0_predict_p_d_bits_pja,
  output        io_dec_i0_predict_p_d_bits_way,
  output [7:0]  io_i0_predict_fghr_d,
  output [7:0]  io_i0_predict_index_d,
  output [4:0]  io_i0_predict_btag_d,
  output        io_dec_lsu_valid_raw_d,
  output [31:0] io_dec_tlu_mrac_ff,
  output [1:0]  io_dec_data_en,
  output [1:0]  io_dec_ctl_en,
  input  [15:0] io_ifu_i0_cinst,
  output [1:0]  io_rv_trace_pkt_rv_i_valid_ip,
  output [31:0] io_rv_trace_pkt_rv_i_insn_ip,
  output [31:0] io_rv_trace_pkt_rv_i_address_ip,
  output [1:0]  io_rv_trace_pkt_rv_i_exception_ip,
  output [4:0]  io_rv_trace_pkt_rv_i_ecause_ip,
  output [1:0]  io_rv_trace_pkt_rv_i_interrupt_ip,
  output [31:0] io_rv_trace_pkt_rv_i_tval_ip,
  output        io_dec_tlu_external_ldfwd_disable,
  output        io_dec_tlu_sideeffect_posted_disable,
  output        io_dec_tlu_core_ecc_disable,
  output        io_dec_tlu_bpred_disable,
  output        io_dec_tlu_wb_coalescing_disable,
  output [2:0]  io_dec_tlu_dma_qos_prty,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override,
  output        io_dec_tlu_i0_commit_cmt,
  input         io_scan_mode
);
  wire  instbuff_io_dbg_cmd_valid; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dbg_cmd_write; // @[el2_dec.scala 285:24]
  wire [1:0] instbuff_io_dbg_cmd_type; // @[el2_dec.scala 285:24]
  wire [31:0] instbuff_io_dbg_cmd_addr; // @[el2_dec.scala 285:24]
  wire  instbuff_io_i0_brp_valid; // @[el2_dec.scala 285:24]
  wire [11:0] instbuff_io_i0_brp_bits_toffset; // @[el2_dec.scala 285:24]
  wire [1:0] instbuff_io_i0_brp_bits_hist; // @[el2_dec.scala 285:24]
  wire  instbuff_io_i0_brp_bits_br_error; // @[el2_dec.scala 285:24]
  wire  instbuff_io_i0_brp_bits_br_start_error; // @[el2_dec.scala 285:24]
  wire [30:0] instbuff_io_i0_brp_bits_prett; // @[el2_dec.scala 285:24]
  wire  instbuff_io_i0_brp_bits_way; // @[el2_dec.scala 285:24]
  wire  instbuff_io_i0_brp_bits_ret; // @[el2_dec.scala 285:24]
  wire [7:0] instbuff_io_ifu_i0_bp_index; // @[el2_dec.scala 285:24]
  wire [7:0] instbuff_io_ifu_i0_bp_fghr; // @[el2_dec.scala 285:24]
  wire [4:0] instbuff_io_ifu_i0_bp_btag; // @[el2_dec.scala 285:24]
  wire  instbuff_io_ifu_i0_pc4; // @[el2_dec.scala 285:24]
  wire  instbuff_io_ifu_i0_valid; // @[el2_dec.scala 285:24]
  wire  instbuff_io_ifu_i0_icaf; // @[el2_dec.scala 285:24]
  wire [1:0] instbuff_io_ifu_i0_icaf_type; // @[el2_dec.scala 285:24]
  wire  instbuff_io_ifu_i0_icaf_f1; // @[el2_dec.scala 285:24]
  wire  instbuff_io_ifu_i0_dbecc; // @[el2_dec.scala 285:24]
  wire [31:0] instbuff_io_ifu_i0_instr; // @[el2_dec.scala 285:24]
  wire [30:0] instbuff_io_ifu_i0_pc; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_ib0_valid_d; // @[el2_dec.scala 285:24]
  wire [1:0] instbuff_io_dec_i0_icaf_type_d; // @[el2_dec.scala 285:24]
  wire [31:0] instbuff_io_dec_i0_instr_d; // @[el2_dec.scala 285:24]
  wire [30:0] instbuff_io_dec_i0_pc_d; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_pc4_d; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_brp_valid; // @[el2_dec.scala 285:24]
  wire [11:0] instbuff_io_dec_i0_brp_bits_toffset; // @[el2_dec.scala 285:24]
  wire [1:0] instbuff_io_dec_i0_brp_bits_hist; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_brp_bits_br_error; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_brp_bits_br_start_error; // @[el2_dec.scala 285:24]
  wire [30:0] instbuff_io_dec_i0_brp_bits_prett; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_brp_bits_way; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_brp_bits_ret; // @[el2_dec.scala 285:24]
  wire [7:0] instbuff_io_dec_i0_bp_index; // @[el2_dec.scala 285:24]
  wire [7:0] instbuff_io_dec_i0_bp_fghr; // @[el2_dec.scala 285:24]
  wire [4:0] instbuff_io_dec_i0_bp_btag; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_icaf_d; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_icaf_f1_d; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_i0_dbecc_d; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_debug_wdata_rs1_d; // @[el2_dec.scala 285:24]
  wire  instbuff_io_dec_debug_fence_d; // @[el2_dec.scala 285:24]
  wire  decode_clock; // @[el2_dec.scala 286:22]
  wire  decode_reset; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_flush_extint; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_force_halt; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_extint_stall; // @[el2_dec.scala 286:22]
  wire [15:0] decode_io_ifu_i0_cinst; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_i0_inst_wb1; // @[el2_dec.scala 286:22]
  wire [30:0] decode_io_dec_i0_pc_wb1; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_nonblock_load_valid_m; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_lsu_nonblock_load_tag_m; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_nonblock_load_inv_r; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_lsu_nonblock_load_inv_tag_r; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_nonblock_load_data_valid; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_nonblock_load_data_error; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_lsu_nonblock_load_data_tag; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_lsu_nonblock_load_data; // @[el2_dec.scala 286:22]
  wire [3:0] decode_io_dec_i0_trigger_match_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_wr_pause_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_pipelining_disable; // @[el2_dec.scala 286:22]
  wire [3:0] decode_io_lsu_trigger_match_m; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_pmu_misaligned_m; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_debug_stall; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_flush_leak_one_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_debug_fence_d; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dbg_cmd_wrdata; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_icaf_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_icaf_f1_d; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_i0_icaf_type_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_dbecc_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_brp_valid; // @[el2_dec.scala 286:22]
  wire [11:0] decode_io_dec_i0_brp_bits_toffset; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_i0_brp_bits_hist; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_brp_bits_br_error; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_brp_bits_br_start_error; // @[el2_dec.scala 286:22]
  wire [30:0] decode_io_dec_i0_brp_bits_prett; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_brp_bits_way; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_brp_bits_ret; // @[el2_dec.scala 286:22]
  wire [7:0] decode_io_dec_i0_bp_index; // @[el2_dec.scala 286:22]
  wire [7:0] decode_io_dec_i0_bp_fghr; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_dec_i0_bp_btag; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_idle_any; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_load_stall_any; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_store_stall_any; // @[el2_dec.scala 286:22]
  wire  decode_io_dma_dccm_stall_any; // @[el2_dec.scala 286:22]
  wire  decode_io_exu_div_wren; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_i0_kill_writeb_wb; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_flush_lower_wb; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_i0_kill_writeb_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_flush_lower_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_flush_pause_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_presync_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_postsync_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_pc4_d; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_csr_rddata_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_csr_legal_d; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_exu_csr_rs1_x; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_lsu_result_m; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_lsu_result_corr_r; // @[el2_dec.scala 286:22]
  wire  decode_io_exu_flush_final; // @[el2_dec.scala 286:22]
  wire [30:0] decode_io_exu_i0_pc_x; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_i0_instr_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_ib0_valid_d; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_exu_i0_result_x; // @[el2_dec.scala 286:22]
  wire  decode_io_free_clk; // @[el2_dec.scala 286:22]
  wire  decode_io_active_clk; // @[el2_dec.scala 286:22]
  wire  decode_io_clk_override; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_rs1_en_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_rs2_en_d; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_dec_i0_rs1_d; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_dec_i0_rs2_d; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_i0_immed_d; // @[el2_dec.scala 286:22]
  wire [11:0] decode_io_dec_i0_br_immed_d; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_land; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_lor; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_lxor; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_sll; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_srl; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_sra; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_beq; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_bne; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_blt; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_bge; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_add; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_sub; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_slt; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_unsign; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_jal; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_predict_t; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_predict_nt; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_csr_write; // @[el2_dec.scala 286:22]
  wire  decode_io_i0_ap_csr_imm; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_decode_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_alu_decode_d; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_i0_rs1_bypass_data_d; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_i0_rs2_bypass_data_d; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_dec_i0_waddr_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_wen_r; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_i0_wdata_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_select_pc_d; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_i0_rs1_bypass_en_d; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_i0_rs2_bypass_en_d; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_valid; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_fast_int; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_by; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_half; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_word; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_load; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_store; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_unsign; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_store_data_bypass_d; // @[el2_dec.scala 286:22]
  wire  decode_io_lsu_p_bits_load_ldst_bypass_d; // @[el2_dec.scala 286:22]
  wire  decode_io_mul_p_valid; // @[el2_dec.scala 286:22]
  wire  decode_io_mul_p_bits_rs1_sign; // @[el2_dec.scala 286:22]
  wire  decode_io_mul_p_bits_rs2_sign; // @[el2_dec.scala 286:22]
  wire  decode_io_mul_p_bits_low; // @[el2_dec.scala 286:22]
  wire  decode_io_div_p_valid; // @[el2_dec.scala 286:22]
  wire  decode_io_div_p_bits_unsign; // @[el2_dec.scala 286:22]
  wire  decode_io_div_p_bits_rem; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_div_waddr_wb; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_div_cancel; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_lsu_valid_raw_d; // @[el2_dec.scala 286:22]
  wire [11:0] decode_io_dec_lsu_offset_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_csr_ren_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_csr_wen_unq_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_csr_any_unq_d; // @[el2_dec.scala 286:22]
  wire [11:0] decode_io_dec_csr_rdaddr_d; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_csr_wen_r; // @[el2_dec.scala 286:22]
  wire [11:0] decode_io_dec_csr_wraddr_r; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_csr_wrdata_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_csr_stall_int_ff; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_i0_valid_r; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_legal; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_icaf; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_icaf_f1; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_tlu_packet_r_icaf_type; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_fence_i; // @[el2_dec.scala 286:22]
  wire [3:0] decode_io_dec_tlu_packet_r_i0trigger; // @[el2_dec.scala 286:22]
  wire [3:0] decode_io_dec_tlu_packet_r_pmu_i0_itype; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_pmu_divide; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec.scala 286:22]
  wire [30:0] decode_io_dec_tlu_i0_pc_r; // @[el2_dec.scala 286:22]
  wire [31:0] decode_io_dec_illegal_inst; // @[el2_dec.scala 286:22]
  wire [30:0] decode_io_pred_correct_npc_x; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_valid; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_pc4; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_i0_predict_p_d_bits_hist; // @[el2_dec.scala 286:22]
  wire [11:0] decode_io_dec_i0_predict_p_d_bits_toffset; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_br_error; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_br_start_error; // @[el2_dec.scala 286:22]
  wire [30:0] decode_io_dec_i0_predict_p_d_bits_prett; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_pcall; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_pret; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_pja; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_i0_predict_p_d_bits_way; // @[el2_dec.scala 286:22]
  wire [7:0] decode_io_i0_predict_fghr_d; // @[el2_dec.scala 286:22]
  wire [7:0] decode_io_i0_predict_index_d; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_i0_predict_btag_d; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_data_en; // @[el2_dec.scala 286:22]
  wire [1:0] decode_io_dec_ctl_en; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_pmu_instr_decoded; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_pmu_decode_stall; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_pmu_presync_stall; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_pmu_postsync_stall; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_nonblock_load_wen; // @[el2_dec.scala 286:22]
  wire [4:0] decode_io_dec_nonblock_load_waddr; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_pause_state; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_pause_state_cg; // @[el2_dec.scala 286:22]
  wire  decode_io_dec_div_active; // @[el2_dec.scala 286:22]
  wire  decode_io_scan_mode; // @[el2_dec.scala 286:22]
  wire  gpr_clock; // @[el2_dec.scala 287:19]
  wire  gpr_reset; // @[el2_dec.scala 287:19]
  wire [4:0] gpr_io_raddr0; // @[el2_dec.scala 287:19]
  wire [4:0] gpr_io_raddr1; // @[el2_dec.scala 287:19]
  wire  gpr_io_wen0; // @[el2_dec.scala 287:19]
  wire [4:0] gpr_io_waddr0; // @[el2_dec.scala 287:19]
  wire [31:0] gpr_io_wd0; // @[el2_dec.scala 287:19]
  wire  gpr_io_wen1; // @[el2_dec.scala 287:19]
  wire [4:0] gpr_io_waddr1; // @[el2_dec.scala 287:19]
  wire [31:0] gpr_io_wd1; // @[el2_dec.scala 287:19]
  wire  gpr_io_wen2; // @[el2_dec.scala 287:19]
  wire [4:0] gpr_io_waddr2; // @[el2_dec.scala 287:19]
  wire [31:0] gpr_io_wd2; // @[el2_dec.scala 287:19]
  wire [31:0] gpr_io_rd0; // @[el2_dec.scala 287:19]
  wire [31:0] gpr_io_rd1; // @[el2_dec.scala 287:19]
  wire  gpr_io_scan_mode; // @[el2_dec.scala 287:19]
  wire  tlu_clock; // @[el2_dec.scala 288:19]
  wire  tlu_reset; // @[el2_dec.scala 288:19]
  wire  tlu_io_active_clk; // @[el2_dec.scala 288:19]
  wire  tlu_io_free_clk; // @[el2_dec.scala 288:19]
  wire  tlu_io_scan_mode; // @[el2_dec.scala 288:19]
  wire [30:0] tlu_io_rst_vec; // @[el2_dec.scala 288:19]
  wire  tlu_io_nmi_int; // @[el2_dec.scala 288:19]
  wire [30:0] tlu_io_nmi_vec; // @[el2_dec.scala 288:19]
  wire  tlu_io_i_cpu_halt_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_i_cpu_run_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_fastint_stall_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_instr_aligned; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_fetch_stall; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_ic_miss; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_ic_hit; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_bus_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_bus_busy; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_pmu_bus_trxn; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_pmu_instr_decoded; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_pmu_decode_stall; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_pmu_presync_stall; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_pmu_postsync_stall; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_store_stall_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_dma_dccm_stall_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_dma_iccm_stall_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_pmu_i0_br_misp; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_pmu_i0_br_ataken; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_pmu_i0_pc4; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_pmu_bus_trxn; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_pmu_bus_misaligned; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_pmu_bus_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_pmu_bus_busy; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_pmu_load_external_m; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_pmu_store_external_m; // @[el2_dec.scala 288:19]
  wire  tlu_io_dma_pmu_dccm_read; // @[el2_dec.scala 288:19]
  wire  tlu_io_dma_pmu_dccm_write; // @[el2_dec.scala 288:19]
  wire  tlu_io_dma_pmu_any_read; // @[el2_dec.scala 288:19]
  wire  tlu_io_dma_pmu_any_write; // @[el2_dec.scala 288:19]
  wire [30:0] tlu_io_lsu_fir_addr; // @[el2_dec.scala 288:19]
  wire [1:0] tlu_io_lsu_fir_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_iccm_dma_sb_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_error_pkt_r_valid; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_error_pkt_r_bits_single_ecc_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_error_pkt_r_bits_inst_type; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_error_pkt_r_bits_exc_type; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_error_pkt_r_bits_mscause; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_error_pkt_r_bits_addr; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_single_ecc_error_incr; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_pause_state; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_imprecise_error_store_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_imprecise_error_load_any; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_lsu_imprecise_error_addr_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_csr_wen_unq_d; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_csr_any_unq_d; // @[el2_dec.scala 288:19]
  wire [11:0] tlu_io_dec_csr_rdaddr_d; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_csr_wen_r; // @[el2_dec.scala 288:19]
  wire [11:0] tlu_io_dec_csr_wraddr_r; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_dec_csr_wrdata_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_csr_stall_int_ff; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_i0_valid_r; // @[el2_dec.scala 288:19]
  wire [30:0] tlu_io_exu_npc_r; // @[el2_dec.scala 288:19]
  wire [30:0] tlu_io_dec_tlu_i0_pc_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_legal; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_icaf; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_icaf_f1; // @[el2_dec.scala 288:19]
  wire [1:0] tlu_io_dec_tlu_packet_r_icaf_type; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_fence_i; // @[el2_dec.scala 288:19]
  wire [3:0] tlu_io_dec_tlu_packet_r_i0trigger; // @[el2_dec.scala 288:19]
  wire [3:0] tlu_io_dec_tlu_packet_r_pmu_i0_itype; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_pmu_divide; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_dec_illegal_inst; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_i0_decode_d; // @[el2_dec.scala 288:19]
  wire [1:0] tlu_io_exu_i0_br_hist_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_i0_br_error_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_i0_br_start_error_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_i0_br_valid_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_i0_br_mp_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_i0_br_middle_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_exu_i0_br_way_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_dbg_cmd_done; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_dbg_cmd_fail; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_dbg_halted; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_debug_mode; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_resume_ack; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_debug_stall; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_noredir_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_mpc_halted_only; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_leak_one_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_err_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_extint; // @[el2_dec.scala 288:19]
  wire [29:0] tlu_io_dec_tlu_meihap; // @[el2_dec.scala 288:19]
  wire  tlu_io_dbg_halt_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_dbg_resume_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_miss_state_idle; // @[el2_dec.scala 288:19]
  wire  tlu_io_lsu_idle_any; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_div_active; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_0_select; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_0_match_; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_0_store; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_0_load; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_0_execute; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_0_m; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_trigger_pkt_any_0_tdata2; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_1_select; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_1_match_; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_1_store; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_1_load; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_1_execute; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_1_m; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_trigger_pkt_any_1_tdata2; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_2_select; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_2_match_; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_2_store; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_2_load; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_2_execute; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_2_m; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_trigger_pkt_any_2_tdata2; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_3_select; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_3_match_; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_3_store; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_3_load; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_3_execute; // @[el2_dec.scala 288:19]
  wire  tlu_io_trigger_pkt_any_3_m; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_trigger_pkt_any_3_tdata2; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_ic_error_start; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_iccm_rd_ecc_single_err; // @[el2_dec.scala 288:19]
  wire [70:0] tlu_io_ifu_ic_debug_rd_data; // @[el2_dec.scala 288:19]
  wire  tlu_io_ifu_ic_debug_rd_data_valid; // @[el2_dec.scala 288:19]
  wire [70:0] tlu_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[el2_dec.scala 288:19]
  wire [16:0] tlu_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[el2_dec.scala 288:19]
  wire [7:0] tlu_io_pic_claimid; // @[el2_dec.scala 288:19]
  wire [3:0] tlu_io_pic_pl; // @[el2_dec.scala 288:19]
  wire  tlu_io_mhwakeup; // @[el2_dec.scala 288:19]
  wire  tlu_io_mexintpend; // @[el2_dec.scala 288:19]
  wire  tlu_io_timer_int; // @[el2_dec.scala 288:19]
  wire  tlu_io_soft_int; // @[el2_dec.scala 288:19]
  wire  tlu_io_o_cpu_halt_status; // @[el2_dec.scala 288:19]
  wire  tlu_io_o_cpu_halt_ack; // @[el2_dec.scala 288:19]
  wire  tlu_io_o_cpu_run_ack; // @[el2_dec.scala 288:19]
  wire  tlu_io_o_debug_mode_status; // @[el2_dec.scala 288:19]
  wire [27:0] tlu_io_core_id; // @[el2_dec.scala 288:19]
  wire  tlu_io_mpc_debug_halt_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_mpc_debug_run_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_mpc_reset_run_req; // @[el2_dec.scala 288:19]
  wire  tlu_io_mpc_debug_halt_ack; // @[el2_dec.scala 288:19]
  wire  tlu_io_mpc_debug_run_ack; // @[el2_dec.scala 288:19]
  wire  tlu_io_debug_brkpt_status; // @[el2_dec.scala 288:19]
  wire [3:0] tlu_io_dec_tlu_meicurpl; // @[el2_dec.scala 288:19]
  wire [3:0] tlu_io_dec_tlu_meipt; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_dec_csr_rddata_d; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_csr_legal_d; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_br0_r_pkt_valid; // @[el2_dec.scala 288:19]
  wire [1:0] tlu_io_dec_tlu_br0_r_pkt_bits_hist; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_br0_r_pkt_bits_br_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_br0_r_pkt_bits_br_start_error; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_br0_r_pkt_bits_way; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_br0_r_pkt_bits_middle; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_i0_kill_writeb_wb; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_lower_wb; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_i0_commit_cmt; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_i0_kill_writeb_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_lower_r; // @[el2_dec.scala 288:19]
  wire [30:0] tlu_io_dec_tlu_flush_path_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_fence_i_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_wr_pause_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_flush_pause_r; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_presync_d; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_postsync_d; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_dec_tlu_mrac_ff; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_force_halt; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_perfcnt0; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_perfcnt1; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_perfcnt2; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_perfcnt3; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_i0_exc_valid_wb1; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_i0_valid_wb1; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_int_valid_wb1; // @[el2_dec.scala 288:19]
  wire [4:0] tlu_io_dec_tlu_exc_cause_wb1; // @[el2_dec.scala 288:19]
  wire [31:0] tlu_io_dec_tlu_mtval_wb1; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_external_ldfwd_disable; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_sideeffect_posted_disable; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_core_ecc_disable; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_bpred_disable; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_wb_coalescing_disable; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_pipelining_disable; // @[el2_dec.scala 288:19]
  wire [2:0] tlu_io_dec_tlu_dma_qos_prty; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_misc_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_dec_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_ifu_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_lsu_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_bus_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_pic_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_dccm_clk_override; // @[el2_dec.scala 288:19]
  wire  tlu_io_dec_tlu_icm_clk_override; // @[el2_dec.scala 288:19]
  wire  dec_trigger_io_trigger_pkt_any_0_select; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_0_match_; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_0_execute; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_0_m; // @[el2_dec.scala 289:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_0_tdata2; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_1_select; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_1_match_; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_1_execute; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_1_m; // @[el2_dec.scala 289:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_1_tdata2; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_2_select; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_2_match_; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_2_execute; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_2_m; // @[el2_dec.scala 289:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_2_tdata2; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_3_select; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_3_match_; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_3_execute; // @[el2_dec.scala 289:27]
  wire  dec_trigger_io_trigger_pkt_any_3_m; // @[el2_dec.scala 289:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_3_tdata2; // @[el2_dec.scala 289:27]
  wire [30:0] dec_trigger_io_dec_i0_pc_d; // @[el2_dec.scala 289:27]
  wire [3:0] dec_trigger_io_dec_i0_trigger_match_d; // @[el2_dec.scala 289:27]
  wire  _T_1 = tlu_io_dec_tlu_i0_valid_wb1 | tlu_io_dec_tlu_i0_exc_valid_wb1; // @[el2_dec.scala 592:98]
  el2_dec_ib_ctl instbuff ( // @[el2_dec.scala 285:24]
    .io_dbg_cmd_valid(instbuff_io_dbg_cmd_valid),
    .io_dbg_cmd_write(instbuff_io_dbg_cmd_write),
    .io_dbg_cmd_type(instbuff_io_dbg_cmd_type),
    .io_dbg_cmd_addr(instbuff_io_dbg_cmd_addr),
    .io_i0_brp_valid(instbuff_io_i0_brp_valid),
    .io_i0_brp_bits_toffset(instbuff_io_i0_brp_bits_toffset),
    .io_i0_brp_bits_hist(instbuff_io_i0_brp_bits_hist),
    .io_i0_brp_bits_br_error(instbuff_io_i0_brp_bits_br_error),
    .io_i0_brp_bits_br_start_error(instbuff_io_i0_brp_bits_br_start_error),
    .io_i0_brp_bits_prett(instbuff_io_i0_brp_bits_prett),
    .io_i0_brp_bits_way(instbuff_io_i0_brp_bits_way),
    .io_i0_brp_bits_ret(instbuff_io_i0_brp_bits_ret),
    .io_ifu_i0_bp_index(instbuff_io_ifu_i0_bp_index),
    .io_ifu_i0_bp_fghr(instbuff_io_ifu_i0_bp_fghr),
    .io_ifu_i0_bp_btag(instbuff_io_ifu_i0_bp_btag),
    .io_ifu_i0_pc4(instbuff_io_ifu_i0_pc4),
    .io_ifu_i0_valid(instbuff_io_ifu_i0_valid),
    .io_ifu_i0_icaf(instbuff_io_ifu_i0_icaf),
    .io_ifu_i0_icaf_type(instbuff_io_ifu_i0_icaf_type),
    .io_ifu_i0_icaf_f1(instbuff_io_ifu_i0_icaf_f1),
    .io_ifu_i0_dbecc(instbuff_io_ifu_i0_dbecc),
    .io_ifu_i0_instr(instbuff_io_ifu_i0_instr),
    .io_ifu_i0_pc(instbuff_io_ifu_i0_pc),
    .io_dec_ib0_valid_d(instbuff_io_dec_ib0_valid_d),
    .io_dec_i0_icaf_type_d(instbuff_io_dec_i0_icaf_type_d),
    .io_dec_i0_instr_d(instbuff_io_dec_i0_instr_d),
    .io_dec_i0_pc_d(instbuff_io_dec_i0_pc_d),
    .io_dec_i0_pc4_d(instbuff_io_dec_i0_pc4_d),
    .io_dec_i0_brp_valid(instbuff_io_dec_i0_brp_valid),
    .io_dec_i0_brp_bits_toffset(instbuff_io_dec_i0_brp_bits_toffset),
    .io_dec_i0_brp_bits_hist(instbuff_io_dec_i0_brp_bits_hist),
    .io_dec_i0_brp_bits_br_error(instbuff_io_dec_i0_brp_bits_br_error),
    .io_dec_i0_brp_bits_br_start_error(instbuff_io_dec_i0_brp_bits_br_start_error),
    .io_dec_i0_brp_bits_prett(instbuff_io_dec_i0_brp_bits_prett),
    .io_dec_i0_brp_bits_way(instbuff_io_dec_i0_brp_bits_way),
    .io_dec_i0_brp_bits_ret(instbuff_io_dec_i0_brp_bits_ret),
    .io_dec_i0_bp_index(instbuff_io_dec_i0_bp_index),
    .io_dec_i0_bp_fghr(instbuff_io_dec_i0_bp_fghr),
    .io_dec_i0_bp_btag(instbuff_io_dec_i0_bp_btag),
    .io_dec_i0_icaf_d(instbuff_io_dec_i0_icaf_d),
    .io_dec_i0_icaf_f1_d(instbuff_io_dec_i0_icaf_f1_d),
    .io_dec_i0_dbecc_d(instbuff_io_dec_i0_dbecc_d),
    .io_dec_debug_wdata_rs1_d(instbuff_io_dec_debug_wdata_rs1_d),
    .io_dec_debug_fence_d(instbuff_io_dec_debug_fence_d)
  );
  el2_dec_decode_ctl decode ( // @[el2_dec.scala 286:22]
    .clock(decode_clock),
    .reset(decode_reset),
    .io_dec_tlu_flush_extint(decode_io_dec_tlu_flush_extint),
    .io_dec_tlu_force_halt(decode_io_dec_tlu_force_halt),
    .io_dec_extint_stall(decode_io_dec_extint_stall),
    .io_ifu_i0_cinst(decode_io_ifu_i0_cinst),
    .io_dec_i0_inst_wb1(decode_io_dec_i0_inst_wb1),
    .io_dec_i0_pc_wb1(decode_io_dec_i0_pc_wb1),
    .io_lsu_nonblock_load_valid_m(decode_io_lsu_nonblock_load_valid_m),
    .io_lsu_nonblock_load_tag_m(decode_io_lsu_nonblock_load_tag_m),
    .io_lsu_nonblock_load_inv_r(decode_io_lsu_nonblock_load_inv_r),
    .io_lsu_nonblock_load_inv_tag_r(decode_io_lsu_nonblock_load_inv_tag_r),
    .io_lsu_nonblock_load_data_valid(decode_io_lsu_nonblock_load_data_valid),
    .io_lsu_nonblock_load_data_error(decode_io_lsu_nonblock_load_data_error),
    .io_lsu_nonblock_load_data_tag(decode_io_lsu_nonblock_load_data_tag),
    .io_lsu_nonblock_load_data(decode_io_lsu_nonblock_load_data),
    .io_dec_i0_trigger_match_d(decode_io_dec_i0_trigger_match_d),
    .io_dec_tlu_wr_pause_r(decode_io_dec_tlu_wr_pause_r),
    .io_dec_tlu_pipelining_disable(decode_io_dec_tlu_pipelining_disable),
    .io_lsu_trigger_match_m(decode_io_lsu_trigger_match_m),
    .io_lsu_pmu_misaligned_m(decode_io_lsu_pmu_misaligned_m),
    .io_dec_tlu_debug_stall(decode_io_dec_tlu_debug_stall),
    .io_dec_tlu_flush_leak_one_r(decode_io_dec_tlu_flush_leak_one_r),
    .io_dec_debug_fence_d(decode_io_dec_debug_fence_d),
    .io_dbg_cmd_wrdata(decode_io_dbg_cmd_wrdata),
    .io_dec_i0_icaf_d(decode_io_dec_i0_icaf_d),
    .io_dec_i0_icaf_f1_d(decode_io_dec_i0_icaf_f1_d),
    .io_dec_i0_icaf_type_d(decode_io_dec_i0_icaf_type_d),
    .io_dec_i0_dbecc_d(decode_io_dec_i0_dbecc_d),
    .io_dec_i0_brp_valid(decode_io_dec_i0_brp_valid),
    .io_dec_i0_brp_bits_toffset(decode_io_dec_i0_brp_bits_toffset),
    .io_dec_i0_brp_bits_hist(decode_io_dec_i0_brp_bits_hist),
    .io_dec_i0_brp_bits_br_error(decode_io_dec_i0_brp_bits_br_error),
    .io_dec_i0_brp_bits_br_start_error(decode_io_dec_i0_brp_bits_br_start_error),
    .io_dec_i0_brp_bits_prett(decode_io_dec_i0_brp_bits_prett),
    .io_dec_i0_brp_bits_way(decode_io_dec_i0_brp_bits_way),
    .io_dec_i0_brp_bits_ret(decode_io_dec_i0_brp_bits_ret),
    .io_dec_i0_bp_index(decode_io_dec_i0_bp_index),
    .io_dec_i0_bp_fghr(decode_io_dec_i0_bp_fghr),
    .io_dec_i0_bp_btag(decode_io_dec_i0_bp_btag),
    .io_lsu_idle_any(decode_io_lsu_idle_any),
    .io_lsu_load_stall_any(decode_io_lsu_load_stall_any),
    .io_lsu_store_stall_any(decode_io_lsu_store_stall_any),
    .io_dma_dccm_stall_any(decode_io_dma_dccm_stall_any),
    .io_exu_div_wren(decode_io_exu_div_wren),
    .io_dec_tlu_i0_kill_writeb_wb(decode_io_dec_tlu_i0_kill_writeb_wb),
    .io_dec_tlu_flush_lower_wb(decode_io_dec_tlu_flush_lower_wb),
    .io_dec_tlu_i0_kill_writeb_r(decode_io_dec_tlu_i0_kill_writeb_r),
    .io_dec_tlu_flush_lower_r(decode_io_dec_tlu_flush_lower_r),
    .io_dec_tlu_flush_pause_r(decode_io_dec_tlu_flush_pause_r),
    .io_dec_tlu_presync_d(decode_io_dec_tlu_presync_d),
    .io_dec_tlu_postsync_d(decode_io_dec_tlu_postsync_d),
    .io_dec_i0_pc4_d(decode_io_dec_i0_pc4_d),
    .io_dec_csr_rddata_d(decode_io_dec_csr_rddata_d),
    .io_dec_csr_legal_d(decode_io_dec_csr_legal_d),
    .io_exu_csr_rs1_x(decode_io_exu_csr_rs1_x),
    .io_lsu_result_m(decode_io_lsu_result_m),
    .io_lsu_result_corr_r(decode_io_lsu_result_corr_r),
    .io_exu_flush_final(decode_io_exu_flush_final),
    .io_exu_i0_pc_x(decode_io_exu_i0_pc_x),
    .io_dec_i0_instr_d(decode_io_dec_i0_instr_d),
    .io_dec_ib0_valid_d(decode_io_dec_ib0_valid_d),
    .io_exu_i0_result_x(decode_io_exu_i0_result_x),
    .io_free_clk(decode_io_free_clk),
    .io_active_clk(decode_io_active_clk),
    .io_clk_override(decode_io_clk_override),
    .io_dec_i0_rs1_en_d(decode_io_dec_i0_rs1_en_d),
    .io_dec_i0_rs2_en_d(decode_io_dec_i0_rs2_en_d),
    .io_dec_i0_rs1_d(decode_io_dec_i0_rs1_d),
    .io_dec_i0_rs2_d(decode_io_dec_i0_rs2_d),
    .io_dec_i0_immed_d(decode_io_dec_i0_immed_d),
    .io_dec_i0_br_immed_d(decode_io_dec_i0_br_immed_d),
    .io_i0_ap_land(decode_io_i0_ap_land),
    .io_i0_ap_lor(decode_io_i0_ap_lor),
    .io_i0_ap_lxor(decode_io_i0_ap_lxor),
    .io_i0_ap_sll(decode_io_i0_ap_sll),
    .io_i0_ap_srl(decode_io_i0_ap_srl),
    .io_i0_ap_sra(decode_io_i0_ap_sra),
    .io_i0_ap_beq(decode_io_i0_ap_beq),
    .io_i0_ap_bne(decode_io_i0_ap_bne),
    .io_i0_ap_blt(decode_io_i0_ap_blt),
    .io_i0_ap_bge(decode_io_i0_ap_bge),
    .io_i0_ap_add(decode_io_i0_ap_add),
    .io_i0_ap_sub(decode_io_i0_ap_sub),
    .io_i0_ap_slt(decode_io_i0_ap_slt),
    .io_i0_ap_unsign(decode_io_i0_ap_unsign),
    .io_i0_ap_jal(decode_io_i0_ap_jal),
    .io_i0_ap_predict_t(decode_io_i0_ap_predict_t),
    .io_i0_ap_predict_nt(decode_io_i0_ap_predict_nt),
    .io_i0_ap_csr_write(decode_io_i0_ap_csr_write),
    .io_i0_ap_csr_imm(decode_io_i0_ap_csr_imm),
    .io_dec_i0_decode_d(decode_io_dec_i0_decode_d),
    .io_dec_i0_alu_decode_d(decode_io_dec_i0_alu_decode_d),
    .io_dec_i0_rs1_bypass_data_d(decode_io_dec_i0_rs1_bypass_data_d),
    .io_dec_i0_rs2_bypass_data_d(decode_io_dec_i0_rs2_bypass_data_d),
    .io_dec_i0_waddr_r(decode_io_dec_i0_waddr_r),
    .io_dec_i0_wen_r(decode_io_dec_i0_wen_r),
    .io_dec_i0_wdata_r(decode_io_dec_i0_wdata_r),
    .io_dec_i0_select_pc_d(decode_io_dec_i0_select_pc_d),
    .io_dec_i0_rs1_bypass_en_d(decode_io_dec_i0_rs1_bypass_en_d),
    .io_dec_i0_rs2_bypass_en_d(decode_io_dec_i0_rs2_bypass_en_d),
    .io_lsu_p_valid(decode_io_lsu_p_valid),
    .io_lsu_p_bits_fast_int(decode_io_lsu_p_bits_fast_int),
    .io_lsu_p_bits_by(decode_io_lsu_p_bits_by),
    .io_lsu_p_bits_half(decode_io_lsu_p_bits_half),
    .io_lsu_p_bits_word(decode_io_lsu_p_bits_word),
    .io_lsu_p_bits_load(decode_io_lsu_p_bits_load),
    .io_lsu_p_bits_store(decode_io_lsu_p_bits_store),
    .io_lsu_p_bits_unsign(decode_io_lsu_p_bits_unsign),
    .io_lsu_p_bits_store_data_bypass_d(decode_io_lsu_p_bits_store_data_bypass_d),
    .io_lsu_p_bits_load_ldst_bypass_d(decode_io_lsu_p_bits_load_ldst_bypass_d),
    .io_mul_p_valid(decode_io_mul_p_valid),
    .io_mul_p_bits_rs1_sign(decode_io_mul_p_bits_rs1_sign),
    .io_mul_p_bits_rs2_sign(decode_io_mul_p_bits_rs2_sign),
    .io_mul_p_bits_low(decode_io_mul_p_bits_low),
    .io_div_p_valid(decode_io_div_p_valid),
    .io_div_p_bits_unsign(decode_io_div_p_bits_unsign),
    .io_div_p_bits_rem(decode_io_div_p_bits_rem),
    .io_div_waddr_wb(decode_io_div_waddr_wb),
    .io_dec_div_cancel(decode_io_dec_div_cancel),
    .io_dec_lsu_valid_raw_d(decode_io_dec_lsu_valid_raw_d),
    .io_dec_lsu_offset_d(decode_io_dec_lsu_offset_d),
    .io_dec_csr_ren_d(decode_io_dec_csr_ren_d),
    .io_dec_csr_wen_unq_d(decode_io_dec_csr_wen_unq_d),
    .io_dec_csr_any_unq_d(decode_io_dec_csr_any_unq_d),
    .io_dec_csr_rdaddr_d(decode_io_dec_csr_rdaddr_d),
    .io_dec_csr_wen_r(decode_io_dec_csr_wen_r),
    .io_dec_csr_wraddr_r(decode_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(decode_io_dec_csr_wrdata_r),
    .io_dec_csr_stall_int_ff(decode_io_dec_csr_stall_int_ff),
    .io_dec_tlu_i0_valid_r(decode_io_dec_tlu_i0_valid_r),
    .io_dec_tlu_packet_r_legal(decode_io_dec_tlu_packet_r_legal),
    .io_dec_tlu_packet_r_icaf(decode_io_dec_tlu_packet_r_icaf),
    .io_dec_tlu_packet_r_icaf_f1(decode_io_dec_tlu_packet_r_icaf_f1),
    .io_dec_tlu_packet_r_icaf_type(decode_io_dec_tlu_packet_r_icaf_type),
    .io_dec_tlu_packet_r_fence_i(decode_io_dec_tlu_packet_r_fence_i),
    .io_dec_tlu_packet_r_i0trigger(decode_io_dec_tlu_packet_r_i0trigger),
    .io_dec_tlu_packet_r_pmu_i0_itype(decode_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(decode_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(decode_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(decode_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_dec_tlu_i0_pc_r(decode_io_dec_tlu_i0_pc_r),
    .io_dec_illegal_inst(decode_io_dec_illegal_inst),
    .io_pred_correct_npc_x(decode_io_pred_correct_npc_x),
    .io_dec_i0_predict_p_d_valid(decode_io_dec_i0_predict_p_d_valid),
    .io_dec_i0_predict_p_d_bits_pc4(decode_io_dec_i0_predict_p_d_bits_pc4),
    .io_dec_i0_predict_p_d_bits_hist(decode_io_dec_i0_predict_p_d_bits_hist),
    .io_dec_i0_predict_p_d_bits_toffset(decode_io_dec_i0_predict_p_d_bits_toffset),
    .io_dec_i0_predict_p_d_bits_br_error(decode_io_dec_i0_predict_p_d_bits_br_error),
    .io_dec_i0_predict_p_d_bits_br_start_error(decode_io_dec_i0_predict_p_d_bits_br_start_error),
    .io_dec_i0_predict_p_d_bits_prett(decode_io_dec_i0_predict_p_d_bits_prett),
    .io_dec_i0_predict_p_d_bits_pcall(decode_io_dec_i0_predict_p_d_bits_pcall),
    .io_dec_i0_predict_p_d_bits_pret(decode_io_dec_i0_predict_p_d_bits_pret),
    .io_dec_i0_predict_p_d_bits_pja(decode_io_dec_i0_predict_p_d_bits_pja),
    .io_dec_i0_predict_p_d_bits_way(decode_io_dec_i0_predict_p_d_bits_way),
    .io_i0_predict_fghr_d(decode_io_i0_predict_fghr_d),
    .io_i0_predict_index_d(decode_io_i0_predict_index_d),
    .io_i0_predict_btag_d(decode_io_i0_predict_btag_d),
    .io_dec_data_en(decode_io_dec_data_en),
    .io_dec_ctl_en(decode_io_dec_ctl_en),
    .io_dec_pmu_instr_decoded(decode_io_dec_pmu_instr_decoded),
    .io_dec_pmu_decode_stall(decode_io_dec_pmu_decode_stall),
    .io_dec_pmu_presync_stall(decode_io_dec_pmu_presync_stall),
    .io_dec_pmu_postsync_stall(decode_io_dec_pmu_postsync_stall),
    .io_dec_nonblock_load_wen(decode_io_dec_nonblock_load_wen),
    .io_dec_nonblock_load_waddr(decode_io_dec_nonblock_load_waddr),
    .io_dec_pause_state(decode_io_dec_pause_state),
    .io_dec_pause_state_cg(decode_io_dec_pause_state_cg),
    .io_dec_div_active(decode_io_dec_div_active),
    .io_scan_mode(decode_io_scan_mode)
  );
  el2_dec_gpr_ctl gpr ( // @[el2_dec.scala 287:19]
    .clock(gpr_clock),
    .reset(gpr_reset),
    .io_raddr0(gpr_io_raddr0),
    .io_raddr1(gpr_io_raddr1),
    .io_wen0(gpr_io_wen0),
    .io_waddr0(gpr_io_waddr0),
    .io_wd0(gpr_io_wd0),
    .io_wen1(gpr_io_wen1),
    .io_waddr1(gpr_io_waddr1),
    .io_wd1(gpr_io_wd1),
    .io_wen2(gpr_io_wen2),
    .io_waddr2(gpr_io_waddr2),
    .io_wd2(gpr_io_wd2),
    .io_rd0(gpr_io_rd0),
    .io_rd1(gpr_io_rd1),
    .io_scan_mode(gpr_io_scan_mode)
  );
  el2_dec_tlu_ctl tlu ( // @[el2_dec.scala 288:19]
    .clock(tlu_clock),
    .reset(tlu_reset),
    .io_active_clk(tlu_io_active_clk),
    .io_free_clk(tlu_io_free_clk),
    .io_scan_mode(tlu_io_scan_mode),
    .io_rst_vec(tlu_io_rst_vec),
    .io_nmi_int(tlu_io_nmi_int),
    .io_nmi_vec(tlu_io_nmi_vec),
    .io_i_cpu_halt_req(tlu_io_i_cpu_halt_req),
    .io_i_cpu_run_req(tlu_io_i_cpu_run_req),
    .io_lsu_fastint_stall_any(tlu_io_lsu_fastint_stall_any),
    .io_ifu_pmu_instr_aligned(tlu_io_ifu_pmu_instr_aligned),
    .io_ifu_pmu_fetch_stall(tlu_io_ifu_pmu_fetch_stall),
    .io_ifu_pmu_ic_miss(tlu_io_ifu_pmu_ic_miss),
    .io_ifu_pmu_ic_hit(tlu_io_ifu_pmu_ic_hit),
    .io_ifu_pmu_bus_error(tlu_io_ifu_pmu_bus_error),
    .io_ifu_pmu_bus_busy(tlu_io_ifu_pmu_bus_busy),
    .io_ifu_pmu_bus_trxn(tlu_io_ifu_pmu_bus_trxn),
    .io_dec_pmu_instr_decoded(tlu_io_dec_pmu_instr_decoded),
    .io_dec_pmu_decode_stall(tlu_io_dec_pmu_decode_stall),
    .io_dec_pmu_presync_stall(tlu_io_dec_pmu_presync_stall),
    .io_dec_pmu_postsync_stall(tlu_io_dec_pmu_postsync_stall),
    .io_lsu_store_stall_any(tlu_io_lsu_store_stall_any),
    .io_dma_dccm_stall_any(tlu_io_dma_dccm_stall_any),
    .io_dma_iccm_stall_any(tlu_io_dma_iccm_stall_any),
    .io_exu_pmu_i0_br_misp(tlu_io_exu_pmu_i0_br_misp),
    .io_exu_pmu_i0_br_ataken(tlu_io_exu_pmu_i0_br_ataken),
    .io_exu_pmu_i0_pc4(tlu_io_exu_pmu_i0_pc4),
    .io_lsu_pmu_bus_trxn(tlu_io_lsu_pmu_bus_trxn),
    .io_lsu_pmu_bus_misaligned(tlu_io_lsu_pmu_bus_misaligned),
    .io_lsu_pmu_bus_error(tlu_io_lsu_pmu_bus_error),
    .io_lsu_pmu_bus_busy(tlu_io_lsu_pmu_bus_busy),
    .io_lsu_pmu_load_external_m(tlu_io_lsu_pmu_load_external_m),
    .io_lsu_pmu_store_external_m(tlu_io_lsu_pmu_store_external_m),
    .io_dma_pmu_dccm_read(tlu_io_dma_pmu_dccm_read),
    .io_dma_pmu_dccm_write(tlu_io_dma_pmu_dccm_write),
    .io_dma_pmu_any_read(tlu_io_dma_pmu_any_read),
    .io_dma_pmu_any_write(tlu_io_dma_pmu_any_write),
    .io_lsu_fir_addr(tlu_io_lsu_fir_addr),
    .io_lsu_fir_error(tlu_io_lsu_fir_error),
    .io_iccm_dma_sb_error(tlu_io_iccm_dma_sb_error),
    .io_lsu_error_pkt_r_valid(tlu_io_lsu_error_pkt_r_valid),
    .io_lsu_error_pkt_r_bits_single_ecc_error(tlu_io_lsu_error_pkt_r_bits_single_ecc_error),
    .io_lsu_error_pkt_r_bits_inst_type(tlu_io_lsu_error_pkt_r_bits_inst_type),
    .io_lsu_error_pkt_r_bits_exc_type(tlu_io_lsu_error_pkt_r_bits_exc_type),
    .io_lsu_error_pkt_r_bits_mscause(tlu_io_lsu_error_pkt_r_bits_mscause),
    .io_lsu_error_pkt_r_bits_addr(tlu_io_lsu_error_pkt_r_bits_addr),
    .io_lsu_single_ecc_error_incr(tlu_io_lsu_single_ecc_error_incr),
    .io_dec_pause_state(tlu_io_dec_pause_state),
    .io_lsu_imprecise_error_store_any(tlu_io_lsu_imprecise_error_store_any),
    .io_lsu_imprecise_error_load_any(tlu_io_lsu_imprecise_error_load_any),
    .io_lsu_imprecise_error_addr_any(tlu_io_lsu_imprecise_error_addr_any),
    .io_dec_csr_wen_unq_d(tlu_io_dec_csr_wen_unq_d),
    .io_dec_csr_any_unq_d(tlu_io_dec_csr_any_unq_d),
    .io_dec_csr_rdaddr_d(tlu_io_dec_csr_rdaddr_d),
    .io_dec_csr_wen_r(tlu_io_dec_csr_wen_r),
    .io_dec_csr_wraddr_r(tlu_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(tlu_io_dec_csr_wrdata_r),
    .io_dec_csr_stall_int_ff(tlu_io_dec_csr_stall_int_ff),
    .io_dec_tlu_i0_valid_r(tlu_io_dec_tlu_i0_valid_r),
    .io_exu_npc_r(tlu_io_exu_npc_r),
    .io_dec_tlu_i0_pc_r(tlu_io_dec_tlu_i0_pc_r),
    .io_dec_tlu_packet_r_legal(tlu_io_dec_tlu_packet_r_legal),
    .io_dec_tlu_packet_r_icaf(tlu_io_dec_tlu_packet_r_icaf),
    .io_dec_tlu_packet_r_icaf_f1(tlu_io_dec_tlu_packet_r_icaf_f1),
    .io_dec_tlu_packet_r_icaf_type(tlu_io_dec_tlu_packet_r_icaf_type),
    .io_dec_tlu_packet_r_fence_i(tlu_io_dec_tlu_packet_r_fence_i),
    .io_dec_tlu_packet_r_i0trigger(tlu_io_dec_tlu_packet_r_i0trigger),
    .io_dec_tlu_packet_r_pmu_i0_itype(tlu_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(tlu_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(tlu_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(tlu_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_dec_illegal_inst(tlu_io_dec_illegal_inst),
    .io_dec_i0_decode_d(tlu_io_dec_i0_decode_d),
    .io_exu_i0_br_hist_r(tlu_io_exu_i0_br_hist_r),
    .io_exu_i0_br_error_r(tlu_io_exu_i0_br_error_r),
    .io_exu_i0_br_start_error_r(tlu_io_exu_i0_br_start_error_r),
    .io_exu_i0_br_valid_r(tlu_io_exu_i0_br_valid_r),
    .io_exu_i0_br_mp_r(tlu_io_exu_i0_br_mp_r),
    .io_exu_i0_br_middle_r(tlu_io_exu_i0_br_middle_r),
    .io_exu_i0_br_way_r(tlu_io_exu_i0_br_way_r),
    .io_dec_dbg_cmd_done(tlu_io_dec_dbg_cmd_done),
    .io_dec_dbg_cmd_fail(tlu_io_dec_dbg_cmd_fail),
    .io_dec_tlu_dbg_halted(tlu_io_dec_tlu_dbg_halted),
    .io_dec_tlu_debug_mode(tlu_io_dec_tlu_debug_mode),
    .io_dec_tlu_resume_ack(tlu_io_dec_tlu_resume_ack),
    .io_dec_tlu_debug_stall(tlu_io_dec_tlu_debug_stall),
    .io_dec_tlu_flush_noredir_r(tlu_io_dec_tlu_flush_noredir_r),
    .io_dec_tlu_mpc_halted_only(tlu_io_dec_tlu_mpc_halted_only),
    .io_dec_tlu_flush_leak_one_r(tlu_io_dec_tlu_flush_leak_one_r),
    .io_dec_tlu_flush_err_r(tlu_io_dec_tlu_flush_err_r),
    .io_dec_tlu_flush_extint(tlu_io_dec_tlu_flush_extint),
    .io_dec_tlu_meihap(tlu_io_dec_tlu_meihap),
    .io_dbg_halt_req(tlu_io_dbg_halt_req),
    .io_dbg_resume_req(tlu_io_dbg_resume_req),
    .io_ifu_miss_state_idle(tlu_io_ifu_miss_state_idle),
    .io_lsu_idle_any(tlu_io_lsu_idle_any),
    .io_dec_div_active(tlu_io_dec_div_active),
    .io_trigger_pkt_any_0_select(tlu_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_(tlu_io_trigger_pkt_any_0_match_),
    .io_trigger_pkt_any_0_store(tlu_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(tlu_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_execute(tlu_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(tlu_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(tlu_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(tlu_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_(tlu_io_trigger_pkt_any_1_match_),
    .io_trigger_pkt_any_1_store(tlu_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(tlu_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_execute(tlu_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(tlu_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(tlu_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(tlu_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_(tlu_io_trigger_pkt_any_2_match_),
    .io_trigger_pkt_any_2_store(tlu_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(tlu_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_execute(tlu_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(tlu_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(tlu_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(tlu_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_(tlu_io_trigger_pkt_any_3_match_),
    .io_trigger_pkt_any_3_store(tlu_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(tlu_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_execute(tlu_io_trigger_pkt_any_3_execute),
    .io_trigger_pkt_any_3_m(tlu_io_trigger_pkt_any_3_m),
    .io_trigger_pkt_any_3_tdata2(tlu_io_trigger_pkt_any_3_tdata2),
    .io_ifu_ic_error_start(tlu_io_ifu_ic_error_start),
    .io_ifu_iccm_rd_ecc_single_err(tlu_io_ifu_iccm_rd_ecc_single_err),
    .io_ifu_ic_debug_rd_data(tlu_io_ifu_ic_debug_rd_data),
    .io_ifu_ic_debug_rd_data_valid(tlu_io_ifu_ic_debug_rd_data_valid),
    .io_dec_tlu_ic_diag_pkt_icache_wrdata(tlu_io_dec_tlu_ic_diag_pkt_icache_wrdata),
    .io_dec_tlu_ic_diag_pkt_icache_dicawics(tlu_io_dec_tlu_ic_diag_pkt_icache_dicawics),
    .io_dec_tlu_ic_diag_pkt_icache_rd_valid(tlu_io_dec_tlu_ic_diag_pkt_icache_rd_valid),
    .io_dec_tlu_ic_diag_pkt_icache_wr_valid(tlu_io_dec_tlu_ic_diag_pkt_icache_wr_valid),
    .io_pic_claimid(tlu_io_pic_claimid),
    .io_pic_pl(tlu_io_pic_pl),
    .io_mhwakeup(tlu_io_mhwakeup),
    .io_mexintpend(tlu_io_mexintpend),
    .io_timer_int(tlu_io_timer_int),
    .io_soft_int(tlu_io_soft_int),
    .io_o_cpu_halt_status(tlu_io_o_cpu_halt_status),
    .io_o_cpu_halt_ack(tlu_io_o_cpu_halt_ack),
    .io_o_cpu_run_ack(tlu_io_o_cpu_run_ack),
    .io_o_debug_mode_status(tlu_io_o_debug_mode_status),
    .io_core_id(tlu_io_core_id),
    .io_mpc_debug_halt_req(tlu_io_mpc_debug_halt_req),
    .io_mpc_debug_run_req(tlu_io_mpc_debug_run_req),
    .io_mpc_reset_run_req(tlu_io_mpc_reset_run_req),
    .io_mpc_debug_halt_ack(tlu_io_mpc_debug_halt_ack),
    .io_mpc_debug_run_ack(tlu_io_mpc_debug_run_ack),
    .io_debug_brkpt_status(tlu_io_debug_brkpt_status),
    .io_dec_tlu_meicurpl(tlu_io_dec_tlu_meicurpl),
    .io_dec_tlu_meipt(tlu_io_dec_tlu_meipt),
    .io_dec_csr_rddata_d(tlu_io_dec_csr_rddata_d),
    .io_dec_csr_legal_d(tlu_io_dec_csr_legal_d),
    .io_dec_tlu_br0_r_pkt_valid(tlu_io_dec_tlu_br0_r_pkt_valid),
    .io_dec_tlu_br0_r_pkt_bits_hist(tlu_io_dec_tlu_br0_r_pkt_bits_hist),
    .io_dec_tlu_br0_r_pkt_bits_br_error(tlu_io_dec_tlu_br0_r_pkt_bits_br_error),
    .io_dec_tlu_br0_r_pkt_bits_br_start_error(tlu_io_dec_tlu_br0_r_pkt_bits_br_start_error),
    .io_dec_tlu_br0_r_pkt_bits_way(tlu_io_dec_tlu_br0_r_pkt_bits_way),
    .io_dec_tlu_br0_r_pkt_bits_middle(tlu_io_dec_tlu_br0_r_pkt_bits_middle),
    .io_dec_tlu_i0_kill_writeb_wb(tlu_io_dec_tlu_i0_kill_writeb_wb),
    .io_dec_tlu_flush_lower_wb(tlu_io_dec_tlu_flush_lower_wb),
    .io_dec_tlu_i0_commit_cmt(tlu_io_dec_tlu_i0_commit_cmt),
    .io_dec_tlu_i0_kill_writeb_r(tlu_io_dec_tlu_i0_kill_writeb_r),
    .io_dec_tlu_flush_lower_r(tlu_io_dec_tlu_flush_lower_r),
    .io_dec_tlu_flush_path_r(tlu_io_dec_tlu_flush_path_r),
    .io_dec_tlu_fence_i_r(tlu_io_dec_tlu_fence_i_r),
    .io_dec_tlu_wr_pause_r(tlu_io_dec_tlu_wr_pause_r),
    .io_dec_tlu_flush_pause_r(tlu_io_dec_tlu_flush_pause_r),
    .io_dec_tlu_presync_d(tlu_io_dec_tlu_presync_d),
    .io_dec_tlu_postsync_d(tlu_io_dec_tlu_postsync_d),
    .io_dec_tlu_mrac_ff(tlu_io_dec_tlu_mrac_ff),
    .io_dec_tlu_force_halt(tlu_io_dec_tlu_force_halt),
    .io_dec_tlu_perfcnt0(tlu_io_dec_tlu_perfcnt0),
    .io_dec_tlu_perfcnt1(tlu_io_dec_tlu_perfcnt1),
    .io_dec_tlu_perfcnt2(tlu_io_dec_tlu_perfcnt2),
    .io_dec_tlu_perfcnt3(tlu_io_dec_tlu_perfcnt3),
    .io_dec_tlu_i0_exc_valid_wb1(tlu_io_dec_tlu_i0_exc_valid_wb1),
    .io_dec_tlu_i0_valid_wb1(tlu_io_dec_tlu_i0_valid_wb1),
    .io_dec_tlu_int_valid_wb1(tlu_io_dec_tlu_int_valid_wb1),
    .io_dec_tlu_exc_cause_wb1(tlu_io_dec_tlu_exc_cause_wb1),
    .io_dec_tlu_mtval_wb1(tlu_io_dec_tlu_mtval_wb1),
    .io_dec_tlu_external_ldfwd_disable(tlu_io_dec_tlu_external_ldfwd_disable),
    .io_dec_tlu_sideeffect_posted_disable(tlu_io_dec_tlu_sideeffect_posted_disable),
    .io_dec_tlu_core_ecc_disable(tlu_io_dec_tlu_core_ecc_disable),
    .io_dec_tlu_bpred_disable(tlu_io_dec_tlu_bpred_disable),
    .io_dec_tlu_wb_coalescing_disable(tlu_io_dec_tlu_wb_coalescing_disable),
    .io_dec_tlu_pipelining_disable(tlu_io_dec_tlu_pipelining_disable),
    .io_dec_tlu_dma_qos_prty(tlu_io_dec_tlu_dma_qos_prty),
    .io_dec_tlu_misc_clk_override(tlu_io_dec_tlu_misc_clk_override),
    .io_dec_tlu_dec_clk_override(tlu_io_dec_tlu_dec_clk_override),
    .io_dec_tlu_ifu_clk_override(tlu_io_dec_tlu_ifu_clk_override),
    .io_dec_tlu_lsu_clk_override(tlu_io_dec_tlu_lsu_clk_override),
    .io_dec_tlu_bus_clk_override(tlu_io_dec_tlu_bus_clk_override),
    .io_dec_tlu_pic_clk_override(tlu_io_dec_tlu_pic_clk_override),
    .io_dec_tlu_dccm_clk_override(tlu_io_dec_tlu_dccm_clk_override),
    .io_dec_tlu_icm_clk_override(tlu_io_dec_tlu_icm_clk_override)
  );
  el2_dec_trigger dec_trigger ( // @[el2_dec.scala 289:27]
    .io_trigger_pkt_any_0_select(dec_trigger_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_(dec_trigger_io_trigger_pkt_any_0_match_),
    .io_trigger_pkt_any_0_execute(dec_trigger_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(dec_trigger_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(dec_trigger_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(dec_trigger_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_(dec_trigger_io_trigger_pkt_any_1_match_),
    .io_trigger_pkt_any_1_execute(dec_trigger_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(dec_trigger_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(dec_trigger_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(dec_trigger_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_(dec_trigger_io_trigger_pkt_any_2_match_),
    .io_trigger_pkt_any_2_execute(dec_trigger_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(dec_trigger_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(dec_trigger_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(dec_trigger_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_(dec_trigger_io_trigger_pkt_any_3_match_),
    .io_trigger_pkt_any_3_execute(dec_trigger_io_trigger_pkt_any_3_execute),
    .io_trigger_pkt_any_3_m(dec_trigger_io_trigger_pkt_any_3_m),
    .io_trigger_pkt_any_3_tdata2(dec_trigger_io_trigger_pkt_any_3_tdata2),
    .io_dec_i0_pc_d(dec_trigger_io_dec_i0_pc_d),
    .io_dec_i0_trigger_match_d(dec_trigger_io_dec_i0_trigger_match_d)
  );
  assign io_dec_extint_stall = decode_io_dec_extint_stall; // @[el2_dec.scala 389:40]
  assign io_dec_i0_decode_d = decode_io_dec_i0_decode_d; // @[el2_dec.scala 397:40]
  assign io_dec_pause_state_cg = decode_io_dec_pause_state_cg; // @[el2_dec.scala 418:40]
  assign io_o_cpu_halt_status = tlu_io_o_cpu_halt_status; // @[el2_dec.scala 548:29]
  assign io_o_cpu_halt_ack = tlu_io_o_cpu_halt_ack; // @[el2_dec.scala 549:29]
  assign io_o_cpu_run_ack = tlu_io_o_cpu_run_ack; // @[el2_dec.scala 550:29]
  assign io_o_debug_mode_status = tlu_io_o_debug_mode_status; // @[el2_dec.scala 551:29]
  assign io_mpc_debug_halt_ack = tlu_io_mpc_debug_halt_ack; // @[el2_dec.scala 552:29]
  assign io_mpc_debug_run_ack = tlu_io_mpc_debug_run_ack; // @[el2_dec.scala 553:29]
  assign io_debug_brkpt_status = tlu_io_debug_brkpt_status; // @[el2_dec.scala 554:29]
  assign io_dec_tlu_meicurpl = tlu_io_dec_tlu_meicurpl; // @[el2_dec.scala 555:29]
  assign io_dec_tlu_meipt = tlu_io_dec_tlu_meipt; // @[el2_dec.scala 556:29]
  assign io_dec_tlu_ic_diag_pkt_icache_wrdata = tlu_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[el2_dec.scala 547:29]
  assign io_dec_tlu_ic_diag_pkt_icache_dicawics = tlu_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[el2_dec.scala 547:29]
  assign io_dec_tlu_ic_diag_pkt_icache_rd_valid = tlu_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[el2_dec.scala 547:29]
  assign io_dec_tlu_ic_diag_pkt_icache_wr_valid = tlu_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[el2_dec.scala 547:29]
  assign io_dec_tlu_dbg_halted = tlu_io_dec_tlu_dbg_halted; // @[el2_dec.scala 538:28]
  assign io_dec_tlu_debug_mode = tlu_io_dec_tlu_debug_mode; // @[el2_dec.scala 539:28]
  assign io_dec_tlu_resume_ack = tlu_io_dec_tlu_resume_ack; // @[el2_dec.scala 540:28]
  assign io_dec_tlu_flush_noredir_r = tlu_io_dec_tlu_flush_noredir_r; // @[el2_dec.scala 541:34]
  assign io_dec_tlu_mpc_halted_only = tlu_io_dec_tlu_mpc_halted_only; // @[el2_dec.scala 542:34]
  assign io_dec_tlu_flush_leak_one_r = tlu_io_dec_tlu_flush_leak_one_r; // @[el2_dec.scala 543:34]
  assign io_dec_tlu_flush_err_r = tlu_io_dec_tlu_flush_err_r; // @[el2_dec.scala 544:34]
  assign io_dec_tlu_meihap = tlu_io_dec_tlu_meihap; // @[el2_dec.scala 545:29]
  assign io_dec_debug_wdata_rs1_d = instbuff_io_dec_debug_wdata_rs1_d; // @[el2_dec.scala 314:38]
  assign io_dec_dbg_rddata = decode_io_dec_i0_wdata_r; // @[el2_dec.scala 600:21]
  assign io_dec_dbg_cmd_done = tlu_io_dec_dbg_cmd_done; // @[el2_dec.scala 536:28]
  assign io_dec_dbg_cmd_fail = tlu_io_dec_dbg_cmd_fail; // @[el2_dec.scala 537:28]
  assign io_trigger_pkt_any_0_select = tlu_io_trigger_pkt_any_0_select; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_0_match_ = tlu_io_trigger_pkt_any_0_match_; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_0_store = tlu_io_trigger_pkt_any_0_store; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_0_load = tlu_io_trigger_pkt_any_0_load; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_0_execute = tlu_io_trigger_pkt_any_0_execute; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_0_m = tlu_io_trigger_pkt_any_0_m; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_0_tdata2 = tlu_io_trigger_pkt_any_0_tdata2; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_select = tlu_io_trigger_pkt_any_1_select; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_match_ = tlu_io_trigger_pkt_any_1_match_; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_store = tlu_io_trigger_pkt_any_1_store; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_load = tlu_io_trigger_pkt_any_1_load; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_execute = tlu_io_trigger_pkt_any_1_execute; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_m = tlu_io_trigger_pkt_any_1_m; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_1_tdata2 = tlu_io_trigger_pkt_any_1_tdata2; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_select = tlu_io_trigger_pkt_any_2_select; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_match_ = tlu_io_trigger_pkt_any_2_match_; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_store = tlu_io_trigger_pkt_any_2_store; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_load = tlu_io_trigger_pkt_any_2_load; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_execute = tlu_io_trigger_pkt_any_2_execute; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_m = tlu_io_trigger_pkt_any_2_m; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_2_tdata2 = tlu_io_trigger_pkt_any_2_tdata2; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_select = tlu_io_trigger_pkt_any_3_select; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_match_ = tlu_io_trigger_pkt_any_3_match_; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_store = tlu_io_trigger_pkt_any_3_store; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_load = tlu_io_trigger_pkt_any_3_load; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_execute = tlu_io_trigger_pkt_any_3_execute; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_m = tlu_io_trigger_pkt_any_3_m; // @[el2_dec.scala 546:29]
  assign io_trigger_pkt_any_3_tdata2 = tlu_io_trigger_pkt_any_3_tdata2; // @[el2_dec.scala 546:29]
  assign io_dec_tlu_force_halt = tlu_io_dec_tlu_force_halt; // @[el2_dec.scala 564:29]
  assign io_dec_i0_rs1_en_d = decode_io_dec_i0_rs1_en_d; // @[el2_dec.scala 392:40]
  assign io_dec_i0_rs2_en_d = decode_io_dec_i0_rs2_en_d; // @[el2_dec.scala 393:40]
  assign io_gpr_i0_rs1_d = gpr_io_rd0; // @[el2_dec.scala 440:19]
  assign io_gpr_i0_rs2_d = gpr_io_rd1; // @[el2_dec.scala 441:19]
  assign io_dec_i0_immed_d = decode_io_dec_i0_immed_d; // @[el2_dec.scala 394:40]
  assign io_dec_i0_br_immed_d = decode_io_dec_i0_br_immed_d; // @[el2_dec.scala 395:40]
  assign io_i0_ap_land = decode_io_i0_ap_land; // @[el2_dec.scala 396:40]
  assign io_i0_ap_lor = decode_io_i0_ap_lor; // @[el2_dec.scala 396:40]
  assign io_i0_ap_lxor = decode_io_i0_ap_lxor; // @[el2_dec.scala 396:40]
  assign io_i0_ap_sll = decode_io_i0_ap_sll; // @[el2_dec.scala 396:40]
  assign io_i0_ap_srl = decode_io_i0_ap_srl; // @[el2_dec.scala 396:40]
  assign io_i0_ap_sra = decode_io_i0_ap_sra; // @[el2_dec.scala 396:40]
  assign io_i0_ap_beq = decode_io_i0_ap_beq; // @[el2_dec.scala 396:40]
  assign io_i0_ap_bne = decode_io_i0_ap_bne; // @[el2_dec.scala 396:40]
  assign io_i0_ap_blt = decode_io_i0_ap_blt; // @[el2_dec.scala 396:40]
  assign io_i0_ap_bge = decode_io_i0_ap_bge; // @[el2_dec.scala 396:40]
  assign io_i0_ap_add = decode_io_i0_ap_add; // @[el2_dec.scala 396:40]
  assign io_i0_ap_sub = decode_io_i0_ap_sub; // @[el2_dec.scala 396:40]
  assign io_i0_ap_slt = decode_io_i0_ap_slt; // @[el2_dec.scala 396:40]
  assign io_i0_ap_unsign = decode_io_i0_ap_unsign; // @[el2_dec.scala 396:40]
  assign io_i0_ap_jal = decode_io_i0_ap_jal; // @[el2_dec.scala 396:40]
  assign io_i0_ap_predict_t = decode_io_i0_ap_predict_t; // @[el2_dec.scala 396:40]
  assign io_i0_ap_predict_nt = decode_io_i0_ap_predict_nt; // @[el2_dec.scala 396:40]
  assign io_i0_ap_csr_write = decode_io_i0_ap_csr_write; // @[el2_dec.scala 396:40]
  assign io_i0_ap_csr_imm = decode_io_i0_ap_csr_imm; // @[el2_dec.scala 396:40]
  assign io_dec_i0_alu_decode_d = decode_io_dec_i0_alu_decode_d; // @[el2_dec.scala 398:40]
  assign io_dec_i0_select_pc_d = decode_io_dec_i0_select_pc_d; // @[el2_dec.scala 401:40]
  assign io_dec_i0_pc_d = instbuff_io_dec_i0_pc_d; // @[el2_dec.scala 291:18]
  assign io_dec_i0_rs1_bypass_en_d = decode_io_dec_i0_rs1_bypass_en_d; // @[el2_dec.scala 402:40]
  assign io_dec_i0_rs2_bypass_en_d = decode_io_dec_i0_rs2_bypass_en_d; // @[el2_dec.scala 403:40]
  assign io_dec_i0_rs1_bypass_data_d = decode_io_dec_i0_rs1_bypass_data_d; // @[el2_dec.scala 399:40]
  assign io_dec_i0_rs2_bypass_data_d = decode_io_dec_i0_rs2_bypass_data_d; // @[el2_dec.scala 400:40]
  assign io_lsu_p_valid = decode_io_lsu_p_valid; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_fast_int = decode_io_lsu_p_bits_fast_int; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_by = decode_io_lsu_p_bits_by; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_half = decode_io_lsu_p_bits_half; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_word = decode_io_lsu_p_bits_word; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_dword = 1'h0; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_load = decode_io_lsu_p_bits_load; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_store = decode_io_lsu_p_bits_store; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_unsign = decode_io_lsu_p_bits_unsign; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_dma = 1'h0; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_store_data_bypass_d = decode_io_lsu_p_bits_store_data_bypass_d; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_load_ldst_bypass_d = decode_io_lsu_p_bits_load_ldst_bypass_d; // @[el2_dec.scala 404:40]
  assign io_lsu_p_bits_store_data_bypass_m = 1'h0; // @[el2_dec.scala 404:40]
  assign io_mul_p_valid = decode_io_mul_p_valid; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_rs1_sign = decode_io_mul_p_bits_rs1_sign; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_rs2_sign = decode_io_mul_p_bits_rs2_sign; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_low = decode_io_mul_p_bits_low; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_bext = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_bdep = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_clmul = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_clmulh = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_clmulr = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_grev = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_shfl = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_unshfl = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_crc32_b = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_crc32_h = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_crc32_w = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_crc32c_b = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_crc32c_h = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_crc32c_w = 1'h0; // @[el2_dec.scala 405:40]
  assign io_mul_p_bits_bfp = 1'h0; // @[el2_dec.scala 405:40]
  assign io_div_p_valid = decode_io_div_p_valid; // @[el2_dec.scala 406:40]
  assign io_div_p_bits_unsign = decode_io_div_p_bits_unsign; // @[el2_dec.scala 406:40]
  assign io_div_p_bits_rem = decode_io_div_p_bits_rem; // @[el2_dec.scala 406:40]
  assign io_dec_div_cancel = decode_io_dec_div_cancel; // @[el2_dec.scala 407:40]
  assign io_dec_lsu_offset_d = decode_io_dec_lsu_offset_d; // @[el2_dec.scala 409:40]
  assign io_dec_csr_ren_d = decode_io_dec_csr_ren_d; // @[el2_dec.scala 410:40]
  assign io_dec_tlu_flush_lower_r = tlu_io_dec_tlu_flush_lower_r; // @[el2_dec.scala 560:34]
  assign io_dec_tlu_flush_path_r = tlu_io_dec_tlu_flush_path_r; // @[el2_dec.scala 561:34]
  assign io_dec_tlu_i0_kill_writeb_r = tlu_io_dec_tlu_i0_kill_writeb_r; // @[el2_dec.scala 559:34]
  assign io_dec_tlu_fence_i_r = tlu_io_dec_tlu_fence_i_r; // @[el2_dec.scala 562:34]
  assign io_pred_correct_npc_x = decode_io_pred_correct_npc_x; // @[el2_dec.scala 411:40]
  assign io_dec_tlu_br0_r_pkt_valid = tlu_io_dec_tlu_br0_r_pkt_valid; // @[el2_dec.scala 557:42]
  assign io_dec_tlu_br0_r_pkt_bits_hist = tlu_io_dec_tlu_br0_r_pkt_bits_hist; // @[el2_dec.scala 557:42]
  assign io_dec_tlu_br0_r_pkt_bits_br_error = tlu_io_dec_tlu_br0_r_pkt_bits_br_error; // @[el2_dec.scala 557:42]
  assign io_dec_tlu_br0_r_pkt_bits_br_start_error = tlu_io_dec_tlu_br0_r_pkt_bits_br_start_error; // @[el2_dec.scala 557:42]
  assign io_dec_tlu_br0_r_pkt_bits_way = tlu_io_dec_tlu_br0_r_pkt_bits_way; // @[el2_dec.scala 557:42]
  assign io_dec_tlu_br0_r_pkt_bits_middle = tlu_io_dec_tlu_br0_r_pkt_bits_middle; // @[el2_dec.scala 557:42]
  assign io_dec_tlu_perfcnt0 = tlu_io_dec_tlu_perfcnt0; // @[el2_dec.scala 565:29]
  assign io_dec_tlu_perfcnt1 = tlu_io_dec_tlu_perfcnt1; // @[el2_dec.scala 566:29]
  assign io_dec_tlu_perfcnt2 = tlu_io_dec_tlu_perfcnt2; // @[el2_dec.scala 567:29]
  assign io_dec_tlu_perfcnt3 = tlu_io_dec_tlu_perfcnt3; // @[el2_dec.scala 568:29]
  assign io_dec_i0_predict_p_d_valid = decode_io_dec_i0_predict_p_d_valid; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_misp = 1'h0; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_ataken = 1'h0; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_boffset = 1'h0; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_pc4 = decode_io_dec_i0_predict_p_d_bits_pc4; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_hist = decode_io_dec_i0_predict_p_d_bits_hist; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_toffset = decode_io_dec_i0_predict_p_d_bits_toffset; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_br_error = decode_io_dec_i0_predict_p_d_bits_br_error; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_br_start_error = decode_io_dec_i0_predict_p_d_bits_br_start_error; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_prett = decode_io_dec_i0_predict_p_d_bits_prett; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_pcall = decode_io_dec_i0_predict_p_d_bits_pcall; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_pret = decode_io_dec_i0_predict_p_d_bits_pret; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_pja = decode_io_dec_i0_predict_p_d_bits_pja; // @[el2_dec.scala 412:40]
  assign io_dec_i0_predict_p_d_bits_way = decode_io_dec_i0_predict_p_d_bits_way; // @[el2_dec.scala 412:40]
  assign io_i0_predict_fghr_d = decode_io_i0_predict_fghr_d; // @[el2_dec.scala 413:40]
  assign io_i0_predict_index_d = decode_io_i0_predict_index_d; // @[el2_dec.scala 414:40]
  assign io_i0_predict_btag_d = decode_io_i0_predict_btag_d; // @[el2_dec.scala 415:40]
  assign io_dec_lsu_valid_raw_d = decode_io_dec_lsu_valid_raw_d; // @[el2_dec.scala 408:40]
  assign io_dec_tlu_mrac_ff = tlu_io_dec_tlu_mrac_ff; // @[el2_dec.scala 563:29]
  assign io_dec_data_en = decode_io_dec_data_en; // @[el2_dec.scala 416:40]
  assign io_dec_ctl_en = decode_io_dec_ctl_en; // @[el2_dec.scala 417:40]
  assign io_rv_trace_pkt_rv_i_valid_ip = {tlu_io_dec_tlu_int_valid_wb1,_T_1}; // @[el2_dec.scala 592:33]
  assign io_rv_trace_pkt_rv_i_insn_ip = decode_io_dec_i0_inst_wb1; // @[el2_dec.scala 590:32]
  assign io_rv_trace_pkt_rv_i_address_ip = {decode_io_dec_i0_pc_wb1,1'h0}; // @[el2_dec.scala 591:35]
  assign io_rv_trace_pkt_rv_i_exception_ip = {tlu_io_dec_tlu_int_valid_wb1,tlu_io_dec_tlu_i0_exc_valid_wb1}; // @[el2_dec.scala 593:37]
  assign io_rv_trace_pkt_rv_i_ecause_ip = tlu_io_dec_tlu_exc_cause_wb1; // @[el2_dec.scala 594:34]
  assign io_rv_trace_pkt_rv_i_interrupt_ip = {tlu_io_dec_tlu_int_valid_wb1,1'h0}; // @[el2_dec.scala 595:37]
  assign io_rv_trace_pkt_rv_i_tval_ip = tlu_io_dec_tlu_mtval_wb1; // @[el2_dec.scala 596:32]
  assign io_dec_tlu_external_ldfwd_disable = tlu_io_dec_tlu_external_ldfwd_disable; // @[el2_dec.scala 574:43]
  assign io_dec_tlu_sideeffect_posted_disable = tlu_io_dec_tlu_sideeffect_posted_disable; // @[el2_dec.scala 575:43]
  assign io_dec_tlu_core_ecc_disable = tlu_io_dec_tlu_core_ecc_disable; // @[el2_dec.scala 576:43]
  assign io_dec_tlu_bpred_disable = tlu_io_dec_tlu_bpred_disable; // @[el2_dec.scala 577:43]
  assign io_dec_tlu_wb_coalescing_disable = tlu_io_dec_tlu_wb_coalescing_disable; // @[el2_dec.scala 578:43]
  assign io_dec_tlu_dma_qos_prty = tlu_io_dec_tlu_dma_qos_prty; // @[el2_dec.scala 579:35]
  assign io_dec_tlu_misc_clk_override = tlu_io_dec_tlu_misc_clk_override; // @[el2_dec.scala 580:35]
  assign io_dec_tlu_ifu_clk_override = tlu_io_dec_tlu_ifu_clk_override; // @[el2_dec.scala 581:36]
  assign io_dec_tlu_lsu_clk_override = tlu_io_dec_tlu_lsu_clk_override; // @[el2_dec.scala 582:36]
  assign io_dec_tlu_bus_clk_override = tlu_io_dec_tlu_bus_clk_override; // @[el2_dec.scala 583:36]
  assign io_dec_tlu_pic_clk_override = tlu_io_dec_tlu_pic_clk_override; // @[el2_dec.scala 584:36]
  assign io_dec_tlu_dccm_clk_override = tlu_io_dec_tlu_dccm_clk_override; // @[el2_dec.scala 585:36]
  assign io_dec_tlu_icm_clk_override = tlu_io_dec_tlu_icm_clk_override; // @[el2_dec.scala 586:36]
  assign io_dec_tlu_i0_commit_cmt = tlu_io_dec_tlu_i0_commit_cmt; // @[el2_dec.scala 558:34]
  assign instbuff_io_dbg_cmd_valid = io_dbg_cmd_valid; // @[el2_dec.scala 297:45]
  assign instbuff_io_dbg_cmd_write = io_dbg_cmd_write; // @[el2_dec.scala 298:45]
  assign instbuff_io_dbg_cmd_type = io_dbg_cmd_type; // @[el2_dec.scala 299:45]
  assign instbuff_io_dbg_cmd_addr = io_dbg_cmd_addr; // @[el2_dec.scala 300:45]
  assign instbuff_io_i0_brp_valid = io_i0_brp_valid; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_toffset = io_i0_brp_bits_toffset; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_hist = io_i0_brp_bits_hist; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_br_error = io_i0_brp_bits_br_error; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_br_start_error = io_i0_brp_bits_br_start_error; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_prett = io_i0_brp_bits_prett; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_way = io_i0_brp_bits_way; // @[el2_dec.scala 301:55]
  assign instbuff_io_i0_brp_bits_ret = io_i0_brp_bits_ret; // @[el2_dec.scala 301:55]
  assign instbuff_io_ifu_i0_bp_index = io_ifu_i0_bp_index; // @[el2_dec.scala 302:35]
  assign instbuff_io_ifu_i0_bp_fghr = io_ifu_i0_bp_fghr; // @[el2_dec.scala 303:35]
  assign instbuff_io_ifu_i0_bp_btag = io_ifu_i0_bp_btag; // @[el2_dec.scala 304:35]
  assign instbuff_io_ifu_i0_pc4 = io_ifu_i0_pc4; // @[el2_dec.scala 305:35]
  assign instbuff_io_ifu_i0_valid = io_ifu_i0_valid; // @[el2_dec.scala 306:35]
  assign instbuff_io_ifu_i0_icaf = io_ifu_i0_icaf; // @[el2_dec.scala 307:35]
  assign instbuff_io_ifu_i0_icaf_type = io_ifu_i0_icaf_type; // @[el2_dec.scala 308:35]
  assign instbuff_io_ifu_i0_icaf_f1 = io_ifu_i0_icaf_f1; // @[el2_dec.scala 309:35]
  assign instbuff_io_ifu_i0_dbecc = io_ifu_i0_dbecc; // @[el2_dec.scala 310:35]
  assign instbuff_io_ifu_i0_instr = io_ifu_i0_instr; // @[el2_dec.scala 311:35]
  assign instbuff_io_ifu_i0_pc = io_ifu_i0_pc; // @[el2_dec.scala 312:35]
  assign decode_clock = clock;
  assign decode_reset = reset;
  assign decode_io_dec_tlu_flush_extint = tlu_io_dec_tlu_flush_extint; // @[el2_dec.scala 330:48]
  assign decode_io_dec_tlu_force_halt = tlu_io_dec_tlu_force_halt; // @[el2_dec.scala 331:48]
  assign decode_io_ifu_i0_cinst = io_ifu_i0_cinst; // @[el2_dec.scala 332:48]
  assign decode_io_lsu_nonblock_load_valid_m = io_lsu_nonblock_load_valid_m; // @[el2_dec.scala 333:48]
  assign decode_io_lsu_nonblock_load_tag_m = io_lsu_nonblock_load_tag_m; // @[el2_dec.scala 334:48]
  assign decode_io_lsu_nonblock_load_inv_r = io_lsu_nonblock_load_inv_r; // @[el2_dec.scala 335:48]
  assign decode_io_lsu_nonblock_load_inv_tag_r = io_lsu_nonblock_load_inv_tag_r; // @[el2_dec.scala 336:48]
  assign decode_io_lsu_nonblock_load_data_valid = io_lsu_nonblock_load_data_valid; // @[el2_dec.scala 337:48]
  assign decode_io_lsu_nonblock_load_data_error = io_lsu_nonblock_load_data_error; // @[el2_dec.scala 338:48]
  assign decode_io_lsu_nonblock_load_data_tag = io_lsu_nonblock_load_data_tag; // @[el2_dec.scala 339:48]
  assign decode_io_lsu_nonblock_load_data = io_lsu_nonblock_load_data; // @[el2_dec.scala 340:48]
  assign decode_io_dec_i0_trigger_match_d = dec_trigger_io_dec_i0_trigger_match_d; // @[el2_dec.scala 341:48]
  assign decode_io_dec_tlu_wr_pause_r = tlu_io_dec_tlu_wr_pause_r; // @[el2_dec.scala 342:48]
  assign decode_io_dec_tlu_pipelining_disable = tlu_io_dec_tlu_pipelining_disable; // @[el2_dec.scala 343:48]
  assign decode_io_lsu_trigger_match_m = io_lsu_trigger_match_m; // @[el2_dec.scala 344:48]
  assign decode_io_lsu_pmu_misaligned_m = io_lsu_pmu_bus_misaligned; // @[el2_dec.scala 345:48]
  assign decode_io_dec_tlu_debug_stall = tlu_io_dec_tlu_debug_stall; // @[el2_dec.scala 346:48]
  assign decode_io_dec_tlu_flush_leak_one_r = tlu_io_dec_tlu_flush_leak_one_r; // @[el2_dec.scala 347:48]
  assign decode_io_dec_debug_fence_d = instbuff_io_dec_debug_fence_d; // @[el2_dec.scala 348:48]
  assign decode_io_dbg_cmd_wrdata = io_dbg_cmd_wrdata; // @[el2_dec.scala 349:48]
  assign decode_io_dec_i0_icaf_d = instbuff_io_dec_i0_icaf_d; // @[el2_dec.scala 350:48]
  assign decode_io_dec_i0_icaf_f1_d = instbuff_io_dec_i0_icaf_f1_d; // @[el2_dec.scala 351:48]
  assign decode_io_dec_i0_icaf_type_d = instbuff_io_dec_i0_icaf_type_d; // @[el2_dec.scala 352:48]
  assign decode_io_dec_i0_dbecc_d = instbuff_io_dec_i0_dbecc_d; // @[el2_dec.scala 353:48]
  assign decode_io_dec_i0_brp_valid = instbuff_io_dec_i0_brp_valid; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_toffset = instbuff_io_dec_i0_brp_bits_toffset; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_hist = instbuff_io_dec_i0_brp_bits_hist; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_br_error = instbuff_io_dec_i0_brp_bits_br_error; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_br_start_error = instbuff_io_dec_i0_brp_bits_br_start_error; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_prett = instbuff_io_dec_i0_brp_bits_prett; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_way = instbuff_io_dec_i0_brp_bits_way; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_brp_bits_ret = instbuff_io_dec_i0_brp_bits_ret; // @[el2_dec.scala 354:48]
  assign decode_io_dec_i0_bp_index = instbuff_io_dec_i0_bp_index; // @[el2_dec.scala 355:48]
  assign decode_io_dec_i0_bp_fghr = instbuff_io_dec_i0_bp_fghr; // @[el2_dec.scala 356:48]
  assign decode_io_dec_i0_bp_btag = instbuff_io_dec_i0_bp_btag; // @[el2_dec.scala 357:48]
  assign decode_io_lsu_idle_any = io_lsu_idle_any; // @[el2_dec.scala 359:48]
  assign decode_io_lsu_load_stall_any = io_lsu_load_stall_any; // @[el2_dec.scala 360:48]
  assign decode_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[el2_dec.scala 361:48]
  assign decode_io_dma_dccm_stall_any = io_dma_dccm_stall_any; // @[el2_dec.scala 362:48]
  assign decode_io_exu_div_wren = io_exu_div_wren; // @[el2_dec.scala 363:48]
  assign decode_io_dec_tlu_i0_kill_writeb_wb = tlu_io_dec_tlu_i0_kill_writeb_wb; // @[el2_dec.scala 364:48]
  assign decode_io_dec_tlu_flush_lower_wb = tlu_io_dec_tlu_flush_lower_wb; // @[el2_dec.scala 365:48]
  assign decode_io_dec_tlu_i0_kill_writeb_r = tlu_io_dec_tlu_i0_kill_writeb_r; // @[el2_dec.scala 366:48]
  assign decode_io_dec_tlu_flush_lower_r = tlu_io_dec_tlu_flush_lower_r; // @[el2_dec.scala 367:48]
  assign decode_io_dec_tlu_flush_pause_r = tlu_io_dec_tlu_flush_pause_r; // @[el2_dec.scala 368:48]
  assign decode_io_dec_tlu_presync_d = tlu_io_dec_tlu_presync_d; // @[el2_dec.scala 369:48]
  assign decode_io_dec_tlu_postsync_d = tlu_io_dec_tlu_postsync_d; // @[el2_dec.scala 370:48]
  assign decode_io_dec_i0_pc4_d = instbuff_io_dec_i0_pc4_d; // @[el2_dec.scala 371:48]
  assign decode_io_dec_csr_rddata_d = tlu_io_dec_csr_rddata_d; // @[el2_dec.scala 372:48]
  assign decode_io_dec_csr_legal_d = tlu_io_dec_csr_legal_d; // @[el2_dec.scala 373:48]
  assign decode_io_exu_csr_rs1_x = io_exu_csr_rs1_x; // @[el2_dec.scala 374:48]
  assign decode_io_lsu_result_m = io_lsu_result_m; // @[el2_dec.scala 375:48]
  assign decode_io_lsu_result_corr_r = io_lsu_result_corr_r; // @[el2_dec.scala 376:48]
  assign decode_io_exu_flush_final = io_exu_flush_final; // @[el2_dec.scala 377:48]
  assign decode_io_exu_i0_pc_x = io_exu_i0_pc_x; // @[el2_dec.scala 378:48]
  assign decode_io_dec_i0_instr_d = instbuff_io_dec_i0_instr_d; // @[el2_dec.scala 379:48]
  assign decode_io_dec_ib0_valid_d = instbuff_io_dec_ib0_valid_d; // @[el2_dec.scala 380:48]
  assign decode_io_exu_i0_result_x = io_exu_i0_result_x; // @[el2_dec.scala 381:48]
  assign decode_io_free_clk = io_free_clk; // @[el2_dec.scala 383:48]
  assign decode_io_active_clk = io_active_clk; // @[el2_dec.scala 384:48]
  assign decode_io_clk_override = tlu_io_dec_tlu_dec_clk_override; // @[el2_dec.scala 385:48]
  assign decode_io_scan_mode = io_scan_mode; // @[el2_dec.scala 387:48]
  assign gpr_clock = clock;
  assign gpr_reset = reset;
  assign gpr_io_raddr0 = decode_io_dec_i0_rs1_d; // @[el2_dec.scala 425:23]
  assign gpr_io_raddr1 = decode_io_dec_i0_rs2_d; // @[el2_dec.scala 426:23]
  assign gpr_io_wen0 = decode_io_dec_i0_wen_r; // @[el2_dec.scala 427:23]
  assign gpr_io_waddr0 = decode_io_dec_i0_waddr_r; // @[el2_dec.scala 428:23]
  assign gpr_io_wd0 = decode_io_dec_i0_wdata_r; // @[el2_dec.scala 429:23]
  assign gpr_io_wen1 = decode_io_dec_nonblock_load_wen; // @[el2_dec.scala 430:23]
  assign gpr_io_waddr1 = decode_io_dec_nonblock_load_waddr; // @[el2_dec.scala 431:23]
  assign gpr_io_wd1 = io_lsu_nonblock_load_data; // @[el2_dec.scala 432:23]
  assign gpr_io_wen2 = io_exu_div_wren; // @[el2_dec.scala 433:23]
  assign gpr_io_waddr2 = decode_io_div_waddr_wb; // @[el2_dec.scala 434:23]
  assign gpr_io_wd2 = io_exu_div_result; // @[el2_dec.scala 435:23]
  assign gpr_io_scan_mode = io_scan_mode; // @[el2_dec.scala 438:23]
  assign tlu_clock = clock;
  assign tlu_reset = reset;
  assign tlu_io_active_clk = io_active_clk; // @[el2_dec.scala 450:45]
  assign tlu_io_free_clk = io_free_clk; // @[el2_dec.scala 451:45]
  assign tlu_io_scan_mode = io_scan_mode; // @[el2_dec.scala 453:45]
  assign tlu_io_rst_vec = io_rst_vec; // @[el2_dec.scala 454:45]
  assign tlu_io_nmi_int = io_nmi_int; // @[el2_dec.scala 455:45]
  assign tlu_io_nmi_vec = io_nmi_vec; // @[el2_dec.scala 456:45]
  assign tlu_io_i_cpu_halt_req = io_i_cpu_halt_req; // @[el2_dec.scala 457:45]
  assign tlu_io_i_cpu_run_req = io_i_cpu_run_req; // @[el2_dec.scala 458:45]
  assign tlu_io_lsu_fastint_stall_any = io_lsu_fastint_stall_any; // @[el2_dec.scala 459:45]
  assign tlu_io_ifu_pmu_instr_aligned = io_ifu_pmu_instr_aligned; // @[el2_dec.scala 460:45]
  assign tlu_io_ifu_pmu_fetch_stall = io_ifu_pmu_fetch_stall; // @[el2_dec.scala 461:45]
  assign tlu_io_ifu_pmu_ic_miss = io_ifu_pmu_ic_miss; // @[el2_dec.scala 462:45]
  assign tlu_io_ifu_pmu_ic_hit = io_ifu_pmu_ic_hit; // @[el2_dec.scala 463:45]
  assign tlu_io_ifu_pmu_bus_error = io_ifu_pmu_bus_error; // @[el2_dec.scala 464:45]
  assign tlu_io_ifu_pmu_bus_busy = io_ifu_pmu_bus_busy; // @[el2_dec.scala 465:45]
  assign tlu_io_ifu_pmu_bus_trxn = io_ifu_pmu_bus_trxn; // @[el2_dec.scala 466:45]
  assign tlu_io_dec_pmu_instr_decoded = decode_io_dec_pmu_instr_decoded; // @[el2_dec.scala 467:45]
  assign tlu_io_dec_pmu_decode_stall = decode_io_dec_pmu_decode_stall; // @[el2_dec.scala 468:45]
  assign tlu_io_dec_pmu_presync_stall = decode_io_dec_pmu_presync_stall; // @[el2_dec.scala 469:45]
  assign tlu_io_dec_pmu_postsync_stall = decode_io_dec_pmu_postsync_stall; // @[el2_dec.scala 470:45]
  assign tlu_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[el2_dec.scala 471:45]
  assign tlu_io_dma_dccm_stall_any = io_dma_dccm_stall_any; // @[el2_dec.scala 472:45]
  assign tlu_io_dma_iccm_stall_any = io_dma_iccm_stall_any; // @[el2_dec.scala 473:45]
  assign tlu_io_exu_pmu_i0_br_misp = io_exu_pmu_i0_br_misp; // @[el2_dec.scala 474:45]
  assign tlu_io_exu_pmu_i0_br_ataken = io_exu_pmu_i0_br_ataken; // @[el2_dec.scala 475:45]
  assign tlu_io_exu_pmu_i0_pc4 = io_exu_pmu_i0_pc4; // @[el2_dec.scala 476:45]
  assign tlu_io_lsu_pmu_bus_trxn = io_lsu_pmu_bus_trxn; // @[el2_dec.scala 477:45]
  assign tlu_io_lsu_pmu_bus_misaligned = io_lsu_pmu_bus_misaligned; // @[el2_dec.scala 478:45]
  assign tlu_io_lsu_pmu_bus_error = io_lsu_pmu_bus_error; // @[el2_dec.scala 479:45]
  assign tlu_io_lsu_pmu_bus_busy = io_lsu_pmu_bus_busy; // @[el2_dec.scala 480:45]
  assign tlu_io_lsu_pmu_load_external_m = io_lsu_pmu_load_external_m; // @[el2_dec.scala 481:45]
  assign tlu_io_lsu_pmu_store_external_m = io_lsu_pmu_store_external_m; // @[el2_dec.scala 482:45]
  assign tlu_io_dma_pmu_dccm_read = io_dma_pmu_dccm_read; // @[el2_dec.scala 483:45]
  assign tlu_io_dma_pmu_dccm_write = io_dma_pmu_dccm_write; // @[el2_dec.scala 484:45]
  assign tlu_io_dma_pmu_any_read = io_dma_pmu_any_read; // @[el2_dec.scala 485:45]
  assign tlu_io_dma_pmu_any_write = io_dma_pmu_any_write; // @[el2_dec.scala 486:45]
  assign tlu_io_lsu_fir_addr = io_lsu_fir_addr; // @[el2_dec.scala 487:45]
  assign tlu_io_lsu_fir_error = io_lsu_fir_error; // @[el2_dec.scala 488:45]
  assign tlu_io_iccm_dma_sb_error = io_iccm_dma_sb_error; // @[el2_dec.scala 489:45]
  assign tlu_io_lsu_error_pkt_r_valid = io_lsu_error_pkt_r_valid; // @[el2_dec.scala 490:45]
  assign tlu_io_lsu_error_pkt_r_bits_single_ecc_error = io_lsu_error_pkt_r_bits_single_ecc_error; // @[el2_dec.scala 490:45]
  assign tlu_io_lsu_error_pkt_r_bits_inst_type = io_lsu_error_pkt_r_bits_inst_type; // @[el2_dec.scala 490:45]
  assign tlu_io_lsu_error_pkt_r_bits_exc_type = io_lsu_error_pkt_r_bits_exc_type; // @[el2_dec.scala 490:45]
  assign tlu_io_lsu_error_pkt_r_bits_mscause = io_lsu_error_pkt_r_bits_mscause; // @[el2_dec.scala 490:45]
  assign tlu_io_lsu_error_pkt_r_bits_addr = io_lsu_error_pkt_r_bits_addr; // @[el2_dec.scala 490:45]
  assign tlu_io_lsu_single_ecc_error_incr = io_lsu_single_ecc_error_incr; // @[el2_dec.scala 491:45]
  assign tlu_io_dec_pause_state = decode_io_dec_pause_state; // @[el2_dec.scala 492:45]
  assign tlu_io_lsu_imprecise_error_store_any = io_lsu_imprecise_error_store_any; // @[el2_dec.scala 493:45]
  assign tlu_io_lsu_imprecise_error_load_any = io_lsu_imprecise_error_load_any; // @[el2_dec.scala 494:45]
  assign tlu_io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_addr_any; // @[el2_dec.scala 495:45]
  assign tlu_io_dec_csr_wen_unq_d = decode_io_dec_csr_wen_unq_d; // @[el2_dec.scala 496:45]
  assign tlu_io_dec_csr_any_unq_d = decode_io_dec_csr_any_unq_d; // @[el2_dec.scala 497:45]
  assign tlu_io_dec_csr_rdaddr_d = decode_io_dec_csr_rdaddr_d; // @[el2_dec.scala 498:45]
  assign tlu_io_dec_csr_wen_r = decode_io_dec_csr_wen_r; // @[el2_dec.scala 499:45]
  assign tlu_io_dec_csr_wraddr_r = decode_io_dec_csr_wraddr_r; // @[el2_dec.scala 500:45]
  assign tlu_io_dec_csr_wrdata_r = decode_io_dec_csr_wrdata_r; // @[el2_dec.scala 501:45]
  assign tlu_io_dec_csr_stall_int_ff = decode_io_dec_csr_stall_int_ff; // @[el2_dec.scala 502:45]
  assign tlu_io_dec_tlu_i0_valid_r = decode_io_dec_tlu_i0_valid_r; // @[el2_dec.scala 503:45]
  assign tlu_io_exu_npc_r = io_exu_npc_r; // @[el2_dec.scala 504:45]
  assign tlu_io_dec_tlu_i0_pc_r = decode_io_dec_tlu_i0_pc_r; // @[el2_dec.scala 505:45]
  assign tlu_io_dec_tlu_packet_r_legal = decode_io_dec_tlu_packet_r_legal; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_icaf = decode_io_dec_tlu_packet_r_icaf; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_icaf_f1 = decode_io_dec_tlu_packet_r_icaf_f1; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_icaf_type = decode_io_dec_tlu_packet_r_icaf_type; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_fence_i = decode_io_dec_tlu_packet_r_fence_i; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_i0trigger = decode_io_dec_tlu_packet_r_i0trigger; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_pmu_i0_itype = decode_io_dec_tlu_packet_r_pmu_i0_itype; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_pmu_i0_br_unpred = decode_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_pmu_divide = decode_io_dec_tlu_packet_r_pmu_divide; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_tlu_packet_r_pmu_lsu_misaligned = decode_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[el2_dec.scala 506:45]
  assign tlu_io_dec_illegal_inst = decode_io_dec_illegal_inst; // @[el2_dec.scala 507:45]
  assign tlu_io_dec_i0_decode_d = decode_io_dec_i0_decode_d; // @[el2_dec.scala 508:45]
  assign tlu_io_exu_i0_br_hist_r = io_exu_i0_br_hist_r; // @[el2_dec.scala 509:45]
  assign tlu_io_exu_i0_br_error_r = io_exu_i0_br_error_r; // @[el2_dec.scala 510:45]
  assign tlu_io_exu_i0_br_start_error_r = io_exu_i0_br_start_error_r; // @[el2_dec.scala 511:45]
  assign tlu_io_exu_i0_br_valid_r = io_exu_i0_br_valid_r; // @[el2_dec.scala 512:45]
  assign tlu_io_exu_i0_br_mp_r = io_exu_i0_br_mp_r; // @[el2_dec.scala 513:45]
  assign tlu_io_exu_i0_br_middle_r = io_exu_i0_br_middle_r; // @[el2_dec.scala 514:45]
  assign tlu_io_exu_i0_br_way_r = io_exu_i0_br_way_r; // @[el2_dec.scala 515:45]
  assign tlu_io_dbg_halt_req = io_dbg_halt_req; // @[el2_dec.scala 516:45]
  assign tlu_io_dbg_resume_req = io_dbg_resume_req; // @[el2_dec.scala 517:45]
  assign tlu_io_ifu_miss_state_idle = io_ifu_miss_state_idle; // @[el2_dec.scala 518:45]
  assign tlu_io_lsu_idle_any = io_lsu_idle_any; // @[el2_dec.scala 519:45]
  assign tlu_io_dec_div_active = decode_io_dec_div_active; // @[el2_dec.scala 520:45]
  assign tlu_io_ifu_ic_error_start = io_ifu_ic_error_start; // @[el2_dec.scala 521:45]
  assign tlu_io_ifu_iccm_rd_ecc_single_err = io_ifu_iccm_rd_ecc_single_err; // @[el2_dec.scala 522:45]
  assign tlu_io_ifu_ic_debug_rd_data = io_ifu_ic_debug_rd_data; // @[el2_dec.scala 523:45]
  assign tlu_io_ifu_ic_debug_rd_data_valid = io_ifu_ic_debug_rd_data_valid; // @[el2_dec.scala 524:45]
  assign tlu_io_pic_claimid = io_pic_claimid; // @[el2_dec.scala 525:45]
  assign tlu_io_pic_pl = io_pic_pl; // @[el2_dec.scala 526:45]
  assign tlu_io_mhwakeup = io_mhwakeup; // @[el2_dec.scala 527:45]
  assign tlu_io_mexintpend = io_mexintpend; // @[el2_dec.scala 528:45]
  assign tlu_io_timer_int = io_timer_int; // @[el2_dec.scala 529:45]
  assign tlu_io_soft_int = io_soft_int; // @[el2_dec.scala 530:45]
  assign tlu_io_core_id = io_core_id; // @[el2_dec.scala 531:45]
  assign tlu_io_mpc_debug_halt_req = io_mpc_debug_halt_req; // @[el2_dec.scala 532:45]
  assign tlu_io_mpc_debug_run_req = io_mpc_debug_run_req; // @[el2_dec.scala 533:45]
  assign tlu_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[el2_dec.scala 534:45]
  assign dec_trigger_io_trigger_pkt_any_0_select = tlu_io_trigger_pkt_any_0_select; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_0_match_ = tlu_io_trigger_pkt_any_0_match_; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_0_execute = tlu_io_trigger_pkt_any_0_execute; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_0_m = tlu_io_trigger_pkt_any_0_m; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_0_tdata2 = tlu_io_trigger_pkt_any_0_tdata2; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_1_select = tlu_io_trigger_pkt_any_1_select; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_1_match_ = tlu_io_trigger_pkt_any_1_match_; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_1_execute = tlu_io_trigger_pkt_any_1_execute; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_1_m = tlu_io_trigger_pkt_any_1_m; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_1_tdata2 = tlu_io_trigger_pkt_any_1_tdata2; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_2_select = tlu_io_trigger_pkt_any_2_select; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_2_match_ = tlu_io_trigger_pkt_any_2_match_; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_2_execute = tlu_io_trigger_pkt_any_2_execute; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_2_m = tlu_io_trigger_pkt_any_2_m; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_2_tdata2 = tlu_io_trigger_pkt_any_2_tdata2; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_3_select = tlu_io_trigger_pkt_any_3_select; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_3_match_ = tlu_io_trigger_pkt_any_3_match_; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_3_execute = tlu_io_trigger_pkt_any_3_execute; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_3_m = tlu_io_trigger_pkt_any_3_m; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_trigger_pkt_any_3_tdata2 = tlu_io_trigger_pkt_any_3_tdata2; // @[el2_dec.scala 321:34]
  assign dec_trigger_io_dec_i0_pc_d = instbuff_io_dec_i0_pc_d; // @[el2_dec.scala 320:30]
endmodule
