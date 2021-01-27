module dec_ib_ctl(
  input         io_ifu_ib_ifu_i0_icaf,
  input  [1:0]  io_ifu_ib_ifu_i0_icaf_type,
  input         io_ifu_ib_ifu_i0_icaf_second,
  input         io_ifu_ib_ifu_i0_dbecc,
  input  [7:0]  io_ifu_ib_ifu_i0_bp_index,
  input  [7:0]  io_ifu_ib_ifu_i0_bp_fghr,
  input  [4:0]  io_ifu_ib_ifu_i0_bp_btag,
  input         io_ifu_ib_ifu_i0_valid,
  input  [31:0] io_ifu_ib_ifu_i0_instr,
  input  [30:0] io_ifu_ib_ifu_i0_pc,
  input         io_ifu_ib_ifu_i0_pc4,
  input         io_ifu_ib_i0_brp_valid,
  input  [11:0] io_ifu_ib_i0_brp_bits_toffset,
  input  [1:0]  io_ifu_ib_i0_brp_bits_hist,
  input         io_ifu_ib_i0_brp_bits_br_error,
  input         io_ifu_ib_i0_brp_bits_br_start_error,
  input  [30:0] io_ifu_ib_i0_brp_bits_prett,
  input         io_ifu_ib_i0_brp_bits_way,
  input         io_ifu_ib_i0_brp_bits_ret,
  output [30:0] io_ib_exu_dec_i0_pc_d,
  output        io_ib_exu_dec_debug_wdata_rs1_d,
  input         io_dbg_ib_dbg_cmd_valid,
  input         io_dbg_ib_dbg_cmd_write,
  input  [1:0]  io_dbg_ib_dbg_cmd_type,
  input  [31:0] io_dbg_ib_dbg_cmd_addr,
  output        io_dec_ib0_valid_d,
  output [1:0]  io_dec_i0_icaf_type_d,
  output [31:0] io_dec_i0_instr_d,
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
  output        io_dec_i0_icaf_second_d,
  output        io_dec_i0_dbecc_d,
  output        io_dec_debug_fence_d
);
  wire  _T = io_dbg_ib_dbg_cmd_type != 2'h2; // @[dec_ib_ctl.scala 58:74]
  wire  debug_valid = io_dbg_ib_dbg_cmd_valid & _T; // @[dec_ib_ctl.scala 58:48]
  wire  _T_1 = ~io_dbg_ib_dbg_cmd_write; // @[dec_ib_ctl.scala 59:38]
  wire  debug_read = debug_valid & _T_1; // @[dec_ib_ctl.scala 59:36]
  wire  debug_write = debug_valid & io_dbg_ib_dbg_cmd_write; // @[dec_ib_ctl.scala 60:36]
  wire  _T_2 = io_dbg_ib_dbg_cmd_type == 2'h0; // @[dec_ib_ctl.scala 62:62]
  wire  debug_read_gpr = debug_read & _T_2; // @[dec_ib_ctl.scala 62:37]
  wire  debug_write_gpr = debug_write & _T_2; // @[dec_ib_ctl.scala 63:37]
  wire  _T_4 = io_dbg_ib_dbg_cmd_type == 2'h1; // @[dec_ib_ctl.scala 64:62]
  wire  debug_read_csr = debug_read & _T_4; // @[dec_ib_ctl.scala 64:37]
  wire  debug_write_csr = debug_write & _T_4; // @[dec_ib_ctl.scala 65:37]
  wire [4:0] dreg = io_dbg_ib_dbg_cmd_addr[4:0]; // @[dec_ib_ctl.scala 67:47]
  wire [11:0] dcsr = io_dbg_ib_dbg_cmd_addr[11:0]; // @[dec_ib_ctl.scala 68:47]
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
  wire  _T_25 = dcsr == 12'h7c4; // @[dec_ib_ctl.scala 81:51]
  assign io_ib_exu_dec_i0_pc_d = io_ifu_ib_ifu_i0_pc; // @[dec_ib_ctl.scala 37:31]
  assign io_ib_exu_dec_debug_wdata_rs1_d = debug_write_gpr | debug_write_csr; // @[dec_ib_ctl.scala 78:35]
  assign io_dec_ib0_valid_d = io_ifu_ib_ifu_i0_valid | debug_valid; // @[dec_ib_ctl.scala 83:22]
  assign io_dec_i0_icaf_type_d = io_ifu_ib_ifu_i0_icaf_type; // @[dec_ib_ctl.scala 39:31]
  assign io_dec_i0_instr_d = debug_valid ? ib0_debug_in : io_ifu_ib_ifu_i0_instr; // @[dec_ib_ctl.scala 84:22]
  assign io_dec_i0_pc4_d = io_ifu_ib_ifu_i0_pc4; // @[dec_ib_ctl.scala 38:31]
  assign io_dec_i0_brp_valid = io_ifu_ib_i0_brp_valid; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_toffset = io_ifu_ib_i0_brp_bits_toffset; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_hist = io_ifu_ib_i0_brp_bits_hist; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_br_error = io_ifu_ib_i0_brp_bits_br_error; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_br_start_error = io_ifu_ib_i0_brp_bits_br_start_error; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_prett = io_ifu_ib_i0_brp_bits_prett; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_way = io_ifu_ib_i0_brp_bits_way; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_ret = io_ifu_ib_i0_brp_bits_ret; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_bp_index = io_ifu_ib_ifu_i0_bp_index; // @[dec_ib_ctl.scala 41:31]
  assign io_dec_i0_bp_fghr = io_ifu_ib_ifu_i0_bp_fghr; // @[dec_ib_ctl.scala 42:31]
  assign io_dec_i0_bp_btag = io_ifu_ib_ifu_i0_bp_btag; // @[dec_ib_ctl.scala 43:31]
  assign io_dec_i0_icaf_d = io_ifu_ib_ifu_i0_icaf; // @[dec_ib_ctl.scala 36:31]
  assign io_dec_i0_icaf_second_d = io_ifu_ib_ifu_i0_icaf_second; // @[dec_ib_ctl.scala 34:35]
  assign io_dec_i0_dbecc_d = io_ifu_ib_ifu_i0_dbecc; // @[dec_ib_ctl.scala 35:31]
  assign io_dec_debug_fence_d = debug_write_csr & _T_25; // @[dec_ib_ctl.scala 81:24]
endmodule
module dec_dec_ctl(
  input  [31:0] io_ins,
  output        io_out_clz,
  output        io_out_ctz,
  output        io_out_pcnt,
  output        io_out_sext_b,
  output        io_out_sext_h,
  output        io_out_slo,
  output        io_out_sro,
  output        io_out_min,
  output        io_out_max,
  output        io_out_pack,
  output        io_out_packu,
  output        io_out_packh,
  output        io_out_rol,
  output        io_out_ror,
  output        io_out_grev,
  output        io_out_gorc,
  output        io_out_zbb,
  output        io_out_sbset,
  output        io_out_sbclr,
  output        io_out_sbinv,
  output        io_out_sbext,
  output        io_out_zbs,
  output        io_out_bext,
  output        io_out_bdep,
  output        io_out_zbe,
  output        io_out_clmul,
  output        io_out_clmulh,
  output        io_out_clmulr,
  output        io_out_zbc,
  output        io_out_shfl,
  output        io_out_unshfl,
  output        io_out_zbp,
  output        io_out_crc32_b,
  output        io_out_crc32_h,
  output        io_out_crc32_w,
  output        io_out_crc32c_b,
  output        io_out_crc32c_h,
  output        io_out_crc32c_w,
  output        io_out_zbr,
  output        io_out_bfp,
  output        io_out_zbf,
  output        io_out_sh1add,
  output        io_out_sh2add,
  output        io_out_sh3add,
  output        io_out_zba,
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
  wire  _T_4 = ~io_ins[22]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_6 = ~io_ins[21]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_8 = ~io_ins[20]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_11 = ~io_ins[5]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_13 = io_ins[30] & io_ins[24]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_14 = _T_13 & io_ins[23]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_15 = _T_14 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_16 = _T_15 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_17 = _T_16 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_18 = _T_17 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_19 = _T_18 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_20 = _T_19 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_23 = ~io_ins[27]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_25 = ~io_ins[24]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_27 = io_ins[29] & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_28 = _T_27 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_29 = _T_28 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_30 = _T_20 | _T_29; // @[dec_dec_ctl.scala 20:62]
  wire  _T_32 = ~io_ins[25]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_34 = ~io_ins[13]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_36 = ~io_ins[12]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_38 = _T_32 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_39 = _T_38 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_40 = _T_39 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_41 = _T_30 | _T_40; // @[dec_dec_ctl.scala 20:92]
  wire  _T_43 = ~io_ins[30]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_48 = _T_43 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_49 = _T_48 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_50 = _T_49 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_51 = _T_41 | _T_50; // @[dec_dec_ctl.scala 21:34]
  wire  _T_56 = io_ins[27] & io_ins[25]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_57 = _T_56 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_58 = _T_57 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_59 = _T_51 | _T_58; // @[dec_dec_ctl.scala 21:66]
  wire  _T_63 = ~io_ins[14]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_65 = io_ins[29] & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_66 = _T_65 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_67 = _T_66 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_68 = _T_59 | _T_67; // @[dec_dec_ctl.scala 21:94]
  wire  _T_74 = io_ins[29] & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_75 = _T_74 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_76 = _T_75 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_77 = _T_68 | _T_76; // @[dec_dec_ctl.scala 22:32]
  wire  _T_84 = _T_23 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_85 = _T_84 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_86 = _T_85 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_87 = _T_77 | _T_86; // @[dec_dec_ctl.scala 22:60]
  wire  _T_90 = ~io_ins[29]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_94 = io_ins[30] & _T_90; // @[dec_dec_ctl.scala 17:17]
  wire  _T_95 = _T_94 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_96 = _T_95 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_97 = _T_87 | _T_96; // @[dec_dec_ctl.scala 22:90]
  wire  _T_105 = _T_43 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_106 = _T_105 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_107 = _T_106 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_108 = _T_97 | _T_107; // @[dec_dec_ctl.scala 23:33]
  wire  _T_113 = io_ins[13] & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_114 = _T_113 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_115 = _T_108 | _T_114; // @[dec_dec_ctl.scala 23:64]
  wire  _T_121 = _T_36 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_122 = _T_121 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_123 = _T_115 | _T_122; // @[dec_dec_ctl.scala 23:89]
  wire  _T_125 = _T_123 | io_ins[2]; // @[dec_dec_ctl.scala 24:29]
  wire  _T_127 = _T_125 | io_ins[6]; // @[dec_dec_ctl.scala 24:48]
  wire  _T_139 = _T_14 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_140 = _T_139 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_141 = _T_140 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_142 = _T_141 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_143 = _T_142 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_144 = _T_127 | _T_143; // @[dec_dec_ctl.scala 24:67]
  wire  _T_151 = ~io_ins[23]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_158 = _T_43 & io_ins[29]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_159 = _T_158 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_160 = _T_159 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_161 = _T_160 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_162 = _T_161 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_163 = _T_162 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_164 = _T_163 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_165 = _T_164 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_166 = _T_144 | _T_165; // @[dec_dec_ctl.scala 24:107]
  wire  _T_181 = _T_43 & io_ins[24]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_182 = _T_181 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_183 = _T_182 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_184 = _T_183 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_185 = _T_184 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_186 = _T_185 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_187 = _T_186 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_194 = ~io_ins[2]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_195 = _T_63 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_196 = _T_195 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_202 = _T_34 & io_ins[11]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_203 = _T_202 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_204 = _T_196 | _T_203; // @[dec_dec_ctl.scala 27:43]
  wire  _T_209 = io_ins[19] & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_210 = _T_209 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_211 = _T_204 | _T_210; // @[dec_dec_ctl.scala 27:70]
  wire  _T_217 = _T_34 & io_ins[10]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_218 = _T_217 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_219 = _T_211 | _T_218; // @[dec_dec_ctl.scala 27:96]
  wire  _T_224 = io_ins[18] & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_225 = _T_224 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_226 = _T_219 | _T_225; // @[dec_dec_ctl.scala 28:30]
  wire  _T_232 = _T_34 & io_ins[9]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_233 = _T_232 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_234 = _T_226 | _T_233; // @[dec_dec_ctl.scala 28:57]
  wire  _T_239 = io_ins[17] & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_240 = _T_239 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_241 = _T_234 | _T_240; // @[dec_dec_ctl.scala 28:83]
  wire  _T_247 = _T_34 & io_ins[8]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_248 = _T_247 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_249 = _T_241 | _T_248; // @[dec_dec_ctl.scala 28:109]
  wire  _T_254 = io_ins[16] & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_255 = _T_254 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_256 = _T_249 | _T_255; // @[dec_dec_ctl.scala 29:29]
  wire  _T_262 = _T_34 & io_ins[7]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_263 = _T_262 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_264 = _T_256 | _T_263; // @[dec_dec_ctl.scala 29:55]
  wire  _T_269 = io_ins[15] & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_270 = _T_269 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_271 = _T_264 | _T_270; // @[dec_dec_ctl.scala 29:81]
  wire  _T_273 = ~io_ins[4]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_275 = ~io_ins[3]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_276 = _T_273 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_277 = _T_271 | _T_276; // @[dec_dec_ctl.scala 30:29]
  wire  _T_279 = ~io_ins[6]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_282 = _T_279 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_289 = io_ins[5] & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_290 = _T_289 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_296 = _T_279 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_297 = _T_296 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_305 = _T_276 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_314 = _T_114 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_315 = _T_305 | _T_314; // @[dec_dec_ctl.scala 34:42]
  wire  _T_322 = _T_34 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_323 = _T_322 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_324 = _T_323 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_325 = _T_315 | _T_324; // @[dec_dec_ctl.scala 34:70]
  wire  _T_335 = _T_122 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_341 = _T_11 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_344 = io_ins[5] & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_345 = _T_341 | _T_344; // @[dec_dec_ctl.scala 36:37]
  wire  _T_357 = io_ins[27] & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_358 = _T_357 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_359 = _T_358 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_360 = _T_359 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_361 = _T_360 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_372 = _T_43 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_373 = _T_372 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_374 = _T_373 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_375 = _T_374 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_376 = _T_375 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_377 = _T_361 | _T_376; // @[dec_dec_ctl.scala 38:53]
  wire  _T_387 = io_ins[14] & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_388 = _T_387 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_389 = _T_388 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_390 = _T_389 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_391 = _T_390 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_395 = io_ins[5] & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_398 = io_ins[4] & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_405 = _T_11 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_406 = _T_405 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_417 = _T_11 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_432 = _T_279 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_444 = _T_195 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_445 = _T_444 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_446 = _T_445 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_454 = _T_446 | _T_406; // @[dec_dec_ctl.scala 50:49]
  wire  _T_471 = _T_48 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_472 = _T_471 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_473 = _T_472 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_474 = _T_473 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_475 = _T_474 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_476 = _T_475 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_489 = io_ins[30] & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_490 = _T_489 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_491 = _T_490 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_492 = _T_491 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_493 = _T_492 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_494 = _T_493 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_507 = _T_90 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_508 = _T_507 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_509 = _T_508 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_510 = _T_509 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_511 = _T_510 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_512 = _T_511 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_513 = _T_494 | _T_512; // @[dec_dec_ctl.scala 52:53]
  wire  _T_524 = _T_57 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_525 = _T_524 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_526 = _T_525 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_527 = _T_513 | _T_526; // @[dec_dec_ctl.scala 52:93]
  wire  _T_536 = _T_63 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_537 = _T_536 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_538 = _T_537 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_539 = _T_538 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_540 = _T_527 | _T_539; // @[dec_dec_ctl.scala 53:37]
  wire  _T_546 = io_ins[6] & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_547 = _T_546 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_562 = _T_85 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_563 = _T_562 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_564 = _T_563 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_565 = _T_564 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_573 = io_ins[14] & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_574 = _T_573 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_575 = _T_574 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_576 = _T_575 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_581 = _T_279 & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_596 = _T_90 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_597 = _T_596 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_598 = _T_597 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_599 = _T_598 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_600 = _T_599 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_601 = _T_600 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_602 = _T_601 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_603 = _T_581 | _T_602; // @[dec_dec_ctl.scala 57:37]
  wire  _T_607 = io_ins[5] & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_608 = _T_607 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_609 = _T_603 | _T_608; // @[dec_dec_ctl.scala 57:82]
  wire  _T_619 = _T_609 | _T_324; // @[dec_dec_ctl.scala 57:105]
  wire  _T_629 = _T_573 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_630 = _T_629 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_631 = _T_630 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_650 = _T_598 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_651 = _T_650 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_652 = _T_651 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_653 = _T_652 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_665 = _T_387 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_666 = _T_665 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_667 = _T_666 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_668 = _T_667 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_688 = _T_597 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_689 = _T_688 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_690 = _T_689 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_691 = _T_690 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_692 = _T_691 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_708 = _T_94 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_709 = _T_708 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_710 = _T_709 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_711 = _T_710 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_712 = _T_711 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_731 = _T_43 & _T_90; // @[dec_dec_ctl.scala 17:17]
  wire  _T_732 = _T_731 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_733 = _T_732 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_734 = _T_733 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_735 = _T_734 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_736 = _T_735 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_737 = _T_736 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_738 = _T_737 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_781 = _T_23 & io_ins[25]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_782 = _T_781 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_783 = _T_782 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_784 = _T_783 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_785 = _T_784 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_786 = _T_785 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_796 = _T_536 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_797 = _T_796 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_798 = _T_797 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_799 = _T_786 | _T_798; // @[dec_dec_ctl.scala 70:56]
  wire  _T_806 = io_ins[13] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_807 = _T_806 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_808 = _T_807 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_809 = _T_799 | _T_808; // @[dec_dec_ctl.scala 70:89]
  wire  _T_815 = io_ins[14] & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_816 = _T_815 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_817 = _T_809 | _T_816; // @[dec_dec_ctl.scala 71:31]
  wire  _T_828 = _T_32 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_829 = _T_828 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_830 = _T_829 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_831 = _T_830 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_832 = _T_831 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_833 = _T_817 | _T_832; // @[dec_dec_ctl.scala 71:57]
  wire  _T_845 = _T_57 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_846 = _T_845 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_847 = _T_846 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_848 = _T_847 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_866 = _T_63 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_867 = _T_866 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_868 = _T_867 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_878 = _T_63 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_879 = _T_878 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_880 = _T_879 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_889 = io_ins[14] & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_890 = _T_889 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_891 = _T_890 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_901 = io_ins[14] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_902 = _T_901 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_903 = _T_902 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_919 = _T_322 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_920 = _T_919 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_929 = io_ins[12] & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_930 = _T_929 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_937 = io_ins[13] & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_943 = _T_806 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_947 = io_ins[7] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_948 = _T_947 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_949 = _T_943 | _T_948; // @[dec_dec_ctl.scala 92:44]
  wire  _T_953 = io_ins[8] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_954 = _T_953 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_955 = _T_949 | _T_954; // @[dec_dec_ctl.scala 92:67]
  wire  _T_959 = io_ins[9] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_960 = _T_959 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_961 = _T_955 | _T_960; // @[dec_dec_ctl.scala 92:90]
  wire  _T_965 = io_ins[10] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_966 = _T_965 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_967 = _T_961 | _T_966; // @[dec_dec_ctl.scala 93:26]
  wire  _T_971 = io_ins[11] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_972 = _T_971 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_980 = _T_269 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_981 = _T_980 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_982 = _T_981 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_989 = _T_254 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_990 = _T_989 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_991 = _T_990 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_992 = _T_982 | _T_991; // @[dec_dec_ctl.scala 95:49]
  wire  _T_999 = _T_239 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1000 = _T_999 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1001 = _T_1000 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1002 = _T_992 | _T_1001; // @[dec_dec_ctl.scala 95:79]
  wire  _T_1009 = _T_224 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1010 = _T_1009 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1011 = _T_1010 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1012 = _T_1002 | _T_1011; // @[dec_dec_ctl.scala 96:33]
  wire  _T_1019 = _T_209 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1020 = _T_1019 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1021 = _T_1020 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1028 = io_ins[15] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1029 = _T_1028 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1030 = _T_1029 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1036 = io_ins[16] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1037 = _T_1036 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1038 = _T_1037 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1039 = _T_1030 | _T_1038; // @[dec_dec_ctl.scala 98:47]
  wire  _T_1045 = io_ins[17] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1046 = _T_1045 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1047 = _T_1046 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1048 = _T_1039 | _T_1047; // @[dec_dec_ctl.scala 98:75]
  wire  _T_1054 = io_ins[18] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1055 = _T_1054 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1056 = _T_1055 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1057 = _T_1048 | _T_1056; // @[dec_dec_ctl.scala 98:103]
  wire  _T_1063 = io_ins[19] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1064 = _T_1063 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1065 = _T_1064 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1072 = _T_34 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1073 = _T_1072 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1081 = _T_387 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1082 = _T_1081 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1087 = io_ins[15] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1088 = _T_1087 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1089 = _T_1088 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1090 = _T_1082 | _T_1089; // @[dec_dec_ctl.scala 103:47]
  wire  _T_1095 = io_ins[16] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1096 = _T_1095 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1097 = _T_1096 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1098 = _T_1090 | _T_1097; // @[dec_dec_ctl.scala 103:74]
  wire  _T_1103 = io_ins[17] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1104 = _T_1103 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1105 = _T_1104 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1106 = _T_1098 | _T_1105; // @[dec_dec_ctl.scala 103:101]
  wire  _T_1111 = io_ins[18] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1112 = _T_1111 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1113 = _T_1112 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1114 = _T_1106 | _T_1113; // @[dec_dec_ctl.scala 104:30]
  wire  _T_1119 = io_ins[19] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1120 = _T_1119 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1121 = _T_1120 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1126 = _T_11 & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1133 = _T_262 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1134 = _T_1133 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1135 = _T_1126 | _T_1134; // @[dec_dec_ctl.scala 106:41]
  wire  _T_1142 = _T_247 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1143 = _T_1142 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1144 = _T_1135 | _T_1143; // @[dec_dec_ctl.scala 106:68]
  wire  _T_1151 = _T_232 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1152 = _T_1151 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1153 = _T_1144 | _T_1152; // @[dec_dec_ctl.scala 106:95]
  wire  _T_1160 = _T_217 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1161 = _T_1160 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1162 = _T_1153 | _T_1161; // @[dec_dec_ctl.scala 107:30]
  wire  _T_1169 = _T_202 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1170 = _T_1169 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1171 = _T_1162 | _T_1170; // @[dec_dec_ctl.scala 107:58]
  wire  _T_1177 = _T_269 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1178 = _T_1177 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1179 = _T_1171 | _T_1178; // @[dec_dec_ctl.scala 107:86]
  wire  _T_1185 = _T_254 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1186 = _T_1185 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1187 = _T_1179 | _T_1186; // @[dec_dec_ctl.scala 108:30]
  wire  _T_1193 = _T_239 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1194 = _T_1193 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1195 = _T_1187 | _T_1194; // @[dec_dec_ctl.scala 108:57]
  wire  _T_1201 = _T_224 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1202 = _T_1201 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1203 = _T_1195 | _T_1202; // @[dec_dec_ctl.scala 108:84]
  wire  _T_1209 = _T_209 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1210 = _T_1209 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1216 = io_ins[12] & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1217 = _T_1216 & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1226 = _T_4 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1227 = _T_1226 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1228 = _T_1227 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1229 = _T_1228 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1230 = _T_1217 | _T_1229; // @[dec_dec_ctl.scala 111:45]
  wire  _T_1239 = _T_1230 | _T_1134; // @[dec_dec_ctl.scala 111:78]
  wire  _T_1248 = _T_1239 | _T_1143; // @[dec_dec_ctl.scala 112:30]
  wire  _T_1257 = _T_1248 | _T_1152; // @[dec_dec_ctl.scala 112:57]
  wire  _T_1266 = _T_1257 | _T_1161; // @[dec_dec_ctl.scala 112:84]
  wire  _T_1275 = _T_1266 | _T_1170; // @[dec_dec_ctl.scala 112:112]
  wire  _T_1283 = _T_1275 | _T_1178; // @[dec_dec_ctl.scala 113:31]
  wire  _T_1291 = _T_1283 | _T_1186; // @[dec_dec_ctl.scala 113:58]
  wire  _T_1299 = _T_1291 | _T_1194; // @[dec_dec_ctl.scala 113:85]
  wire  _T_1307 = _T_1299 | _T_1202; // @[dec_dec_ctl.scala 113:112]
  wire  _T_1325 = _T_4 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1326 = _T_1325 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1327 = _T_1326 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1328 = _T_1327 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1340 = _T_6 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1341 = _T_1340 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1342 = _T_1341 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1343 = _T_1342 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1352 = io_ins[29] & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1353 = _T_1352 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1354 = _T_1353 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1370 = _T_43 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1371 = _T_1370 & io_ins[24]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1372 = _T_1371 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1373 = _T_1372 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1374 = _T_1373 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1375 = _T_1374 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1376 = _T_1375 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1377 = _T_1376 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1378 = _T_1377 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1394 = _T_65 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1395 = _T_1394 & io_ins[23]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1396 = _T_1395 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1397 = _T_1396 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1398 = _T_1397 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1399 = _T_1398 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1400 = _T_1399 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1401 = _T_1400 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1402 = _T_1378 | _T_1401; // @[dec_dec_ctl.scala 122:63]
  wire  _T_1420 = _T_1394 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1421 = _T_1420 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1422 = _T_1421 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1423 = _T_1422 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1424 = _T_1423 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1425 = _T_1424 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1426 = _T_1425 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1427 = _T_1402 | _T_1426; // @[dec_dec_ctl.scala 122:111]
  wire  _T_1440 = io_ins[27] & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1441 = _T_1440 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1442 = _T_1441 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1443 = _T_1442 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1444 = _T_1443 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1445 = _T_1444 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1446 = _T_1445 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1447 = _T_1427 | _T_1446; // @[dec_dec_ctl.scala 123:52]
  wire  _T_1457 = io_ins[30] & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1458 = _T_1457 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1459 = _T_1458 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1460 = _T_1459 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1461 = _T_1460 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1462 = _T_1461 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1463 = _T_1447 | _T_1462; // @[dec_dec_ctl.scala 123:93]
  wire  _T_1479 = _T_65 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1480 = _T_1479 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1481 = _T_1480 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1482 = _T_1481 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1483 = _T_1482 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1484 = _T_1483 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1485 = _T_1484 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1486 = _T_1485 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1487 = _T_1463 | _T_1486; // @[dec_dec_ctl.scala 124:39]
  wire  _T_1503 = _T_65 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1504 = _T_1503 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1505 = _T_1504 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1506 = _T_1505 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1507 = _T_1506 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1508 = _T_1507 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1509 = _T_1508 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1510 = _T_1509 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1511 = _T_1487 | _T_1510; // @[dec_dec_ctl.scala 124:87]
  wire  _T_1527 = _T_65 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1528 = _T_1527 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1529 = _T_1528 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1530 = _T_1529 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1531 = _T_1530 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1532 = _T_1531 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1533 = _T_1532 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1534 = _T_1533 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1535 = _T_1511 | _T_1534; // @[dec_dec_ctl.scala 125:51]
  wire  _T_1550 = io_ins[30] & io_ins[29]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1551 = _T_1550 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1552 = _T_1551 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1553 = _T_1552 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1554 = _T_1553 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1555 = _T_1554 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1556 = _T_1555 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1557 = _T_1556 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1558 = _T_1557 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1559 = _T_1535 | _T_1558; // @[dec_dec_ctl.scala 125:99]
  wire  _T_1574 = _T_1370 & io_ins[23]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1575 = _T_1574 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1576 = _T_1575 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1577 = _T_1576 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1578 = _T_1577 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1579 = _T_1578 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1580 = _T_1579 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1581 = _T_1559 | _T_1580; // @[dec_dec_ctl.scala 126:51]
  wire  _T_1598 = _T_731 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1599 = _T_1598 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1600 = _T_1599 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1601 = _T_1600 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1602 = _T_1601 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1603 = _T_1602 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1604 = _T_1603 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1605 = _T_1581 | _T_1604; // @[dec_dec_ctl.scala 126:96]
  wire  _T_1615 = io_ins[25] & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1616 = _T_1615 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1617 = _T_1616 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1618 = _T_1617 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1619 = _T_1618 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1620 = _T_1605 | _T_1619; // @[dec_dec_ctl.scala 127:50]
  wire  _T_1635 = io_ins[30] & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1636 = _T_1635 & io_ins[24]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1637 = _T_1636 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1638 = _T_1637 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1639 = _T_1638 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1640 = _T_1639 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1641 = _T_1640 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1642 = _T_1641 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1643 = _T_1620 | _T_1642; // @[dec_dec_ctl.scala 127:84]
  wire  _T_1653 = _T_65 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1654 = _T_1653 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1655 = _T_1654 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1656 = _T_1655 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1673 = _T_781 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1674 = _T_1673 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1675 = _T_1674 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1676 = _T_1675 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1677 = _T_1676 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1678 = _T_1677 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1679 = _T_1678 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1695 = _T_1673 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1696 = _T_1695 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1697 = _T_1696 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1698 = _T_1697 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1699 = _T_1698 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1733 = _T_1615 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1734 = _T_1733 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1735 = _T_1734 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1736 = _T_1735 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1749 = _T_782 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1750 = _T_1749 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1764 = _T_782 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1765 = _T_1764 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1766 = _T_1765 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1800 = _T_1635 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1801 = _T_1800 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1802 = _T_1801 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1803 = _T_1802 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1804 = _T_1803 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1805 = _T_1804 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1806 = _T_1805 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1807 = _T_1806 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1808 = _T_1807 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1831 = _T_1801 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1832 = _T_1831 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1833 = _T_1832 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1834 = _T_1833 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1835 = _T_1834 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1836 = _T_1835 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1856 = _T_1800 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1857 = _T_1856 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1858 = _T_1857 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1859 = _T_1858 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1860 = _T_1859 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1861 = _T_1860 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1880 = _T_1635 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1881 = _T_1880 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1882 = _T_1881 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1883 = _T_1882 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1884 = _T_1883 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1885 = _T_1884 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1886 = _T_1885 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1905 = _T_1880 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1906 = _T_1905 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1907 = _T_1906 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1908 = _T_1907 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1909 = _T_1908 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1910 = _T_1909 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1928 = _T_158 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1929 = _T_1928 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1930 = _T_1929 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1931 = _T_1930 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1932 = _T_1931 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1933 = _T_1932 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1951 = _T_1928 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1952 = _T_1951 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1953 = _T_1952 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1954 = _T_1953 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1955 = _T_1954 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1969 = _T_57 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1970 = _T_1969 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1971 = _T_1970 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1984 = _T_57 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1985 = _T_1984 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_1986 = _T_1985 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2002 = _T_1370 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2003 = _T_2002 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2004 = _T_2003 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2005 = _T_2004 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2006 = _T_2005 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2019 = _T_1457 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2020 = _T_2019 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2021 = _T_2020 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2022 = _T_2021 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2038 = _T_2002 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2039 = _T_2038 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2040 = _T_2039 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2041 = _T_2040 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2056 = _T_1635 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2057 = _T_2056 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2058 = _T_2057 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2059 = _T_2058 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2060 = _T_2059 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2076 = _T_1550 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2077 = _T_2076 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2078 = _T_2077 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2079 = _T_2078 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2080 = _T_2079 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2081 = _T_2080 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2100 = _T_1800 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2101 = _T_2100 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2102 = _T_2101 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2103 = _T_2102 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2104 = _T_2103 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2105 = _T_2104 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2118 = _T_1370 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2119 = _T_2118 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2120 = _T_2119 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2121 = _T_2120 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2122 = _T_2121 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2123 = _T_2122 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2124 = _T_2105 | _T_2123; // @[dec_dec_ctl.scala 172:62]
  wire  _T_2143 = _T_2079 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2144 = _T_2143 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2145 = _T_2144 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2146 = _T_2124 | _T_2145; // @[dec_dec_ctl.scala 172:103]
  wire  _T_2157 = _T_357 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2158 = _T_2157 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2159 = _T_2158 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2160 = _T_2159 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2161 = _T_2146 | _T_2160; // @[dec_dec_ctl.scala 173:48]
  wire  _T_2173 = io_ins[30] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2174 = _T_2173 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2175 = _T_2174 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2176 = _T_2175 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2177 = _T_2176 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2178 = _T_2177 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2179 = _T_2161 | _T_2178; // @[dec_dec_ctl.scala 173:83]
  wire  _T_2191 = _T_1635 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2192 = _T_2191 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2193 = _T_2192 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2194 = _T_2193 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2195 = _T_2194 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2196 = _T_2179 | _T_2195; // @[dec_dec_ctl.scala 174:42]
  wire  _T_2209 = _T_2076 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2210 = _T_2209 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2211 = _T_2210 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2212 = _T_2211 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2213 = _T_2196 | _T_2212; // @[dec_dec_ctl.scala 174:79]
  wire  _T_2231 = _T_1550 & io_ins[24]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2232 = _T_2231 & io_ins[23]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2233 = _T_2232 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2234 = _T_2233 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2235 = _T_2234 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2236 = _T_2235 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2237 = _T_2236 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2238 = _T_2237 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2239 = _T_2238 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2240 = _T_2239 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2241 = _T_2240 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2242 = _T_2213 | _T_2241; // @[dec_dec_ctl.scala 175:40]
  wire  _T_2264 = _T_158 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2265 = _T_2264 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2266 = _T_2265 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2267 = _T_2266 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2268 = _T_2267 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2269 = _T_2268 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2270 = _T_2269 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2271 = _T_2270 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2272 = _T_2271 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2273 = _T_2272 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2274 = _T_2273 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2275 = _T_2274 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2276 = _T_2242 | _T_2275; // @[dec_dec_ctl.scala 175:96]
  wire  _T_2300 = _T_1371 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2301 = _T_2300 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2302 = _T_2301 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2303 = _T_2302 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2304 = _T_2303 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2305 = _T_2304 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2306 = _T_2305 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2307 = _T_2306 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2308 = _T_2307 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2309 = _T_2308 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2310 = _T_2276 | _T_2309; // @[dec_dec_ctl.scala 176:65]
  wire  _T_2333 = _T_2232 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2334 = _T_2333 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2335 = _T_2334 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2336 = _T_2335 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2337 = _T_2336 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2338 = _T_2337 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2339 = _T_2338 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2340 = _T_2339 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2341 = _T_2340 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2342 = _T_2310 | _T_2341; // @[dec_dec_ctl.scala 177:64]
  wire  _T_2373 = _T_2264 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2374 = _T_2373 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2375 = _T_2374 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2376 = _T_2375 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2377 = _T_2376 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2393 = _T_94 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2394 = _T_2393 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2395 = _T_2394 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2396 = _T_2395 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2397 = _T_2396 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2414 = _T_1551 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2415 = _T_2414 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2416 = _T_2415 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2417 = _T_2416 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2418 = _T_2417 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2434 = _T_94 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2435 = _T_2434 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2436 = _T_2435 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2437 = _T_2436 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2438 = _T_2437 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2439 = _T_2438 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2455 = _T_66 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2456 = _T_2455 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2457 = _T_2456 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2458 = _T_2457 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2459 = _T_2458 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2474 = _T_2434 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2475 = _T_2474 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2476 = _T_2475 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2477 = _T_2476 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2478 = _T_2477 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2497 = _T_2038 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2498 = _T_2497 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2499 = _T_2498 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2500 = _T_2499 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2515 = _T_1458 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2516 = _T_2515 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2517 = _T_2516 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2518 = _T_2517 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2552 = _T_56 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2553 = _T_2552 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2554 = _T_2553 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2555 = _T_2554 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2556 = _T_2555 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2568 = io_ins[27] & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2569 = _T_2568 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2570 = _T_2569 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2571 = _T_2570 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2572 = _T_2571 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2586 = _T_2568 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2587 = _T_2586 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2588 = _T_2587 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2589 = _T_2588 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2603 = _T_2552 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2604 = _T_2603 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2605 = _T_2604 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2621 = _T_1551 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2622 = _T_2621 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2623 = _T_2622 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2624 = _T_2623 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2625 = _T_2624 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2642 = _T_2264 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2643 = _T_2642 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2644 = _T_2643 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2645 = _T_2644 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2646 = _T_2645 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2668 = _T_1599 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2669 = _T_2668 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2670 = _T_2669 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2671 = _T_2670 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2672 = _T_2671 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2693 = _T_1599 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2694 = _T_2693 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2695 = _T_2694 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2696 = _T_2695 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2697 = _T_2696 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2714 = _T_1928 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2715 = _T_2714 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2716 = _T_2715 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2717 = _T_2716 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2718 = _T_2717 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2734 = _T_1598 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2735 = _T_2734 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2736 = _T_2735 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2737 = _T_2736 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2738 = _T_2737 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2739 = _T_2718 | _T_2738; // @[dec_dec_ctl.scala 212:58]
  wire  _T_2756 = _T_2739 | _T_2195; // @[dec_dec_ctl.scala 212:101]
  wire  _T_2769 = _T_1440 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2770 = _T_2769 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2771 = _T_2770 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2772 = _T_2771 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2773 = _T_2772 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2774 = _T_2756 | _T_2773; // @[dec_dec_ctl.scala 213:40]
  wire  _T_2788 = _T_2175 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2789 = _T_2788 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2790 = _T_2789 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2791 = _T_2774 | _T_2790; // @[dec_dec_ctl.scala 213:79]
  wire  _T_2803 = _T_27 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2804 = _T_2803 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2805 = _T_2804 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2806 = _T_2805 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2807 = _T_2806 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2808 = _T_2791 | _T_2807; // @[dec_dec_ctl.scala 214:41]
  wire  _T_2826 = _T_1599 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2827 = _T_2826 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2828 = _T_2827 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2829 = _T_2828 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2830 = _T_2829 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2831 = _T_2808 | _T_2830; // @[dec_dec_ctl.scala 214:78]
  wire  _T_2842 = io_ins[29] & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2843 = _T_2842 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2844 = _T_2843 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2845 = _T_2844 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2846 = _T_2845 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2847 = _T_2846 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2871 = _T_1636 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2872 = _T_2871 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2873 = _T_2872 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2874 = _T_2873 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2875 = _T_2874 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2876 = _T_2875 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2877 = _T_2876 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2878 = _T_2877 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2900 = _T_2871 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2901 = _T_2900 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2902 = _T_2901 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2903 = _T_2902 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2904 = _T_2903 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2905 = _T_2904 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2927 = _T_2871 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2928 = _T_2927 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2929 = _T_2928 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2930 = _T_2929 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2931 = _T_2930 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2932 = _T_2931 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2953 = _T_1635 & io_ins[23]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2954 = _T_2953 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2955 = _T_2954 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2956 = _T_2955 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2957 = _T_2956 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2958 = _T_2957 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2959 = _T_2958 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2960 = _T_2959 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2979 = _T_2953 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2980 = _T_2979 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2981 = _T_2980 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2982 = _T_2981 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2983 = _T_2982 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_2984 = _T_2983 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3003 = _T_2953 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3004 = _T_3003 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3005 = _T_3004 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3006 = _T_3005 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3007 = _T_3006 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3008 = _T_3007 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3043 = _T_1458 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3044 = _T_3043 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3045 = _T_3044 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3074 = _T_74 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3075 = _T_3074 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3076 = _T_3075 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3077 = _T_3076 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3091 = _T_2843 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3092 = _T_3091 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3093 = _T_3092 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3104 = _T_2842 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3105 = _T_3104 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3106 = _T_3105 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3117 = io_ins[29] & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3118 = _T_3117 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3119 = _T_3118 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3120 = _T_3119 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3129 = io_ins[28] & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3130 = _T_3129 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3131 = _T_3130 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3132 = _T_3131 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3147 = _T_733 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3148 = _T_3147 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3149 = _T_3132 | _T_3148; // @[dec_dec_ctl.scala 243:51]
  wire  _T_3164 = _T_597 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3165 = _T_3164 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3166 = _T_3165 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3167 = _T_3166 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3168 = _T_3149 | _T_3167; // @[dec_dec_ctl.scala 243:89]
  wire  _T_3183 = _T_688 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3184 = _T_3183 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3185 = _T_3168 | _T_3184; // @[dec_dec_ctl.scala 244:44]
  wire  _T_3192 = _T_3185 | _T_114; // @[dec_dec_ctl.scala 244:82]
  wire  _T_3196 = _T_3192 | _T_398; // @[dec_dec_ctl.scala 245:28]
  wire  _T_3206 = ~io_ins[31]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3215 = ~io_ins[26]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3227 = ~io_ins[19]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3229 = ~io_ins[18]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3231 = ~io_ins[17]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3233 = ~io_ins[16]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3235 = ~io_ins[15]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3239 = ~io_ins[11]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3241 = ~io_ins[10]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3243 = ~io_ins[9]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3245 = ~io_ins[8]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3247 = ~io_ins[7]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3257 = _T_3206 & _T_43; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3258 = _T_3257 & _T_90; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3259 = _T_3258 & io_ins[28]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3260 = _T_3259 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3261 = _T_3260 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3262 = _T_3261 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3263 = _T_3262 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3264 = _T_3263 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3265 = _T_3264 & io_ins[22]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3266 = _T_3265 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3267 = _T_3266 & io_ins[20]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3268 = _T_3267 & _T_3227; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3269 = _T_3268 & _T_3229; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3270 = _T_3269 & _T_3231; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3271 = _T_3270 & _T_3233; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3272 = _T_3271 & _T_3235; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3273 = _T_3272 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3274 = _T_3273 & _T_3239; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3275 = _T_3274 & _T_3241; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3276 = _T_3275 & _T_3243; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3277 = _T_3276 & _T_3245; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3278 = _T_3277 & _T_3247; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3279 = _T_3278 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3280 = _T_3279 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3281 = _T_3280 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3282 = _T_3281 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3283 = _T_3282 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3284 = _T_3283 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3285 = _T_3284 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3339 = _T_3257 & io_ins[29]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3340 = _T_3339 & io_ins[28]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3341 = _T_3340 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3342 = _T_3341 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3343 = _T_3342 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3344 = _T_3343 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3345 = _T_3344 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3346 = _T_3345 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3347 = _T_3346 & io_ins[21]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3348 = _T_3347 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3349 = _T_3348 & _T_3227; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3350 = _T_3349 & _T_3229; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3351 = _T_3350 & _T_3231; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3352 = _T_3351 & _T_3233; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3353 = _T_3352 & _T_3235; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3354 = _T_3353 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3355 = _T_3354 & _T_3239; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3356 = _T_3355 & _T_3241; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3357 = _T_3356 & _T_3243; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3358 = _T_3357 & _T_3245; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3359 = _T_3358 & _T_3247; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3360 = _T_3359 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3361 = _T_3360 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3362 = _T_3361 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3363 = _T_3362 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3364 = _T_3363 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3365 = _T_3364 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3366 = _T_3365 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3367 = _T_3285 | _T_3366; // @[dec_dec_ctl.scala 248:136]
  wire  _T_3375 = ~io_ins[28]; // @[dec_dec_ctl.scala 15:46]
  wire  _T_3422 = _T_3258 & _T_3375; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3423 = _T_3422 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3424 = _T_3423 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3425 = _T_3424 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3426 = _T_3425 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3427 = _T_3426 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3428 = _T_3427 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3429 = _T_3428 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3430 = _T_3429 & _T_3227; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3431 = _T_3430 & _T_3229; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3432 = _T_3431 & _T_3231; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3433 = _T_3432 & _T_3233; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3434 = _T_3433 & _T_3235; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3435 = _T_3434 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3436 = _T_3435 & _T_3239; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3437 = _T_3436 & _T_3241; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3438 = _T_3437 & _T_3243; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3439 = _T_3438 & _T_3245; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3440 = _T_3439 & _T_3247; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3441 = _T_3440 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3442 = _T_3441 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3443 = _T_3442 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3444 = _T_3443 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3445 = _T_3444 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3446 = _T_3445 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3447 = _T_3367 | _T_3446; // @[dec_dec_ctl.scala 249:122]
  wire  _T_3471 = _T_3206 & io_ins[29]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3472 = _T_3471 & _T_3375; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3473 = _T_3472 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3474 = _T_3473 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3475 = _T_3474 & io_ins[24]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3476 = _T_3475 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3477 = _T_3476 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3478 = _T_3477 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3479 = _T_3478 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3480 = _T_3479 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3481 = _T_3480 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3482 = _T_3481 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3483 = _T_3482 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3484 = _T_3447 | _T_3483; // @[dec_dec_ctl.scala 250:119]
  wire  _T_3514 = _T_3476 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3515 = _T_3514 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3516 = _T_3515 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3517 = _T_3516 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3518 = _T_3517 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3519 = _T_3518 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3520 = _T_3519 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3521 = _T_3484 | _T_3520; // @[dec_dec_ctl.scala 251:65]
  wire  _T_3550 = _T_3474 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3551 = _T_3550 & _T_4; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3552 = _T_3551 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3553 = _T_3552 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3554 = _T_3553 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3555 = _T_3554 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3556 = _T_3555 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3557 = _T_3556 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3558 = _T_3557 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3559 = _T_3521 | _T_3558; // @[dec_dec_ctl.scala 251:127]
  wire  _T_3588 = _T_3474 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3589 = _T_3588 & _T_151; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3590 = _T_3589 & _T_6; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3591 = _T_3590 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3592 = _T_3591 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3593 = _T_3592 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3594 = _T_3593 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3595 = _T_3594 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3596 = _T_3595 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3597 = _T_3559 | _T_3596; // @[dec_dec_ctl.scala 252:66]
  wire  _T_3620 = _T_3422 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3621 = _T_3620 & io_ins[25]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3622 = _T_3621 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3623 = _T_3622 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3624 = _T_3623 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3625 = _T_3624 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3626 = _T_3625 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3627 = _T_3626 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3628 = _T_3597 | _T_3627; // @[dec_dec_ctl.scala 252:129]
  wire  _T_3651 = _T_3257 & _T_3375; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3652 = _T_3651 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3653 = _T_3652 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3654 = _T_3653 & _T_25; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3655 = _T_3654 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3656 = _T_3655 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3657 = _T_3656 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3658 = _T_3657 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3659 = _T_3658 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3660 = _T_3659 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3661 = _T_3628 | _T_3660; // @[dec_dec_ctl.scala 253:58]
  wire  _T_3686 = _T_3651 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3687 = _T_3686 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3688 = _T_3687 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3689 = _T_3688 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3690 = _T_3689 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3691 = _T_3690 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3692 = _T_3691 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3693 = _T_3692 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3694 = _T_3693 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3695 = _T_3694 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3696 = _T_3661 | _T_3695; // @[dec_dec_ctl.scala 253:114]
  wire  _T_3724 = _T_3688 & io_ins[13]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3725 = _T_3724 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3726 = _T_3725 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3727 = _T_3726 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3728 = _T_3727 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3729 = _T_3728 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3730 = _T_3729 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3731 = _T_3696 | _T_3730; // @[dec_dec_ctl.scala 254:63]
  wire  _T_3755 = _T_3206 & _T_90; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3756 = _T_3755 & _T_3375; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3757 = _T_3756 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3758 = _T_3757 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3759 = _T_3758 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3760 = _T_3759 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3761 = _T_3760 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3762 = _T_3761 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3763 = _T_3762 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3764 = _T_3763 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3765 = _T_3764 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3766 = _T_3765 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3767 = _T_3731 | _T_3766; // @[dec_dec_ctl.scala 254:123]
  wire  _T_3788 = _T_3206 & _T_3375; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3789 = _T_3788 & _T_23; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3790 = _T_3789 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3791 = _T_3790 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3792 = _T_3791 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3793 = _T_3792 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3794 = _T_3793 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3795 = _T_3794 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3796 = _T_3795 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3797 = _T_3796 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3798 = _T_3797 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3799 = _T_3767 | _T_3798; // @[dec_dec_ctl.scala 255:64]
  wire  _T_3825 = _T_3620 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3826 = _T_3825 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3827 = _T_3826 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3828 = _T_3827 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3829 = _T_3828 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3830 = _T_3829 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3831 = _T_3830 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3832 = _T_3831 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3833 = _T_3799 | _T_3832; // @[dec_dec_ctl.scala 255:119]
  wire  _T_3857 = _T_3620 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3858 = _T_3857 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3859 = _T_3858 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3860 = _T_3859 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3861 = _T_3860 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3862 = _T_3861 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3863 = _T_3862 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3864 = _T_3833 | _T_3863; // @[dec_dec_ctl.scala 256:61]
  wire  _T_3885 = _T_3206 & io_ins[30]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3886 = _T_3885 & _T_3375; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3887 = _T_3886 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3888 = _T_3887 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3889 = _T_3888 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3890 = _T_3889 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3891 = _T_3890 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3892 = _T_3891 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3893 = _T_3892 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3894 = _T_3893 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3895 = _T_3894 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3896 = _T_3895 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3897 = _T_3864 | _T_3896; // @[dec_dec_ctl.scala 256:115]
  wire  _T_3919 = _T_3472 & io_ins[27]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3920 = _T_3919 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3921 = _T_3920 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3922 = _T_3921 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3923 = _T_3922 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3924 = _T_3923 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3925 = _T_3924 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3926 = _T_3925 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3927 = _T_3926 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3928 = _T_3897 | _T_3927; // @[dec_dec_ctl.scala 257:61]
  wire  _T_3955 = _T_3688 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3956 = _T_3955 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3957 = _T_3956 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3958 = _T_3957 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3959 = _T_3958 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3960 = _T_3959 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3961 = _T_3928 | _T_3960; // @[dec_dec_ctl.scala 257:116]
  wire  _T_3987 = _T_3424 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3988 = _T_3987 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3989 = _T_3988 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3990 = _T_3989 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3991 = _T_3990 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3992 = _T_3991 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_3993 = _T_3961 | _T_3992; // @[dec_dec_ctl.scala 258:59]
  wire  _T_4010 = _T_444 & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4011 = _T_4010 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4012 = _T_4011 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4013 = _T_4012 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4014 = _T_4013 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4015 = _T_4014 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4016 = _T_3993 | _T_4015; // @[dec_dec_ctl.scala 258:114]
  wire  _T_4038 = _T_3756 & _T_3215; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4039 = _T_4038 & _T_32; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4040 = _T_4039 & io_ins[14]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4041 = _T_4040 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4042 = _T_4041 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4043 = _T_4042 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4044 = _T_4043 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4045 = _T_4044 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4046 = _T_4045 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4047 = _T_4016 | _T_4046; // @[dec_dec_ctl.scala 259:46]
  wire  _T_4072 = _T_3474 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4073 = _T_4072 & io_ins[12]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4074 = _T_4073 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4075 = _T_4074 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4076 = _T_4075 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4077 = _T_4076 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4078 = _T_4077 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4079 = _T_4078 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4080 = _T_4047 | _T_4079; // @[dec_dec_ctl.scala 259:100]
  wire  _T_4092 = io_ins[14] & io_ins[6]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4093 = _T_4092 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4094 = _T_4093 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4095 = _T_4094 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4096 = _T_4095 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4097 = _T_4096 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4098 = _T_4097 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4099 = _T_4080 | _T_4098; // @[dec_dec_ctl.scala 260:60]
  wire  _T_4114 = _T_195 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4115 = _T_4114 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4116 = _T_4115 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4117 = _T_4116 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4118 = _T_4117 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4119 = _T_4118 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4120 = _T_4099 | _T_4119; // @[dec_dec_ctl.scala 260:97]
  wire  _T_4132 = _T_36 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4133 = _T_4132 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4134 = _T_4133 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4135 = _T_4134 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4136 = _T_4135 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4137 = _T_4136 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4138 = _T_4120 | _T_4137; // @[dec_dec_ctl.scala 261:43]
  wire  _T_4152 = _T_1073 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4153 = _T_4152 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4154 = _T_4153 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4155 = _T_4154 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4156 = _T_4155 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4157 = _T_4138 | _T_4156; // @[dec_dec_ctl.scala 261:79]
  wire  _T_4226 = _T_3429 & _T_8; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4227 = _T_4226 & _T_3227; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4228 = _T_4227 & _T_3229; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4229 = _T_4228 & _T_3231; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4230 = _T_4229 & _T_3233; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4231 = _T_4230 & _T_3235; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4232 = _T_4231 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4233 = _T_4232 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4234 = _T_4233 & _T_3239; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4235 = _T_4234 & _T_3241; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4236 = _T_4235 & _T_3243; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4237 = _T_4236 & _T_3245; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4238 = _T_4237 & _T_3247; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4239 = _T_4238 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4240 = _T_4239 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4241 = _T_4240 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4242 = _T_4241 & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4243 = _T_4242 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4244 = _T_4243 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4245 = _T_4244 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4246 = _T_4157 | _T_4245; // @[dec_dec_ctl.scala 261:117]
  wire  _T_4294 = _T_3422 & _T_3227; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4295 = _T_4294 & _T_3229; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4296 = _T_4295 & _T_3231; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4297 = _T_4296 & _T_3233; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4298 = _T_4297 & _T_3235; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4299 = _T_4298 & _T_63; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4300 = _T_4299 & _T_34; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4301 = _T_4300 & _T_36; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4302 = _T_4301 & _T_3239; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4303 = _T_4302 & _T_3241; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4304 = _T_4303 & _T_3243; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4305 = _T_4304 & _T_3245; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4306 = _T_4305 & _T_3247; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4307 = _T_4306 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4308 = _T_4307 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4309 = _T_4308 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4310 = _T_4309 & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4311 = _T_4310 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4312 = _T_4311 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4313 = _T_4312 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4314 = _T_4246 | _T_4313; // @[dec_dec_ctl.scala 262:130]
  wire  _T_4326 = _T_806 & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4327 = _T_4326 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4328 = _T_4327 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4329 = _T_4328 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4330 = _T_4329 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4331 = _T_4330 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4332 = _T_4314 | _T_4331; // @[dec_dec_ctl.scala 263:102]
  wire  _T_4341 = io_ins[6] & io_ins[5]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4342 = _T_4341 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4343 = _T_4342 & io_ins[3]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4344 = _T_4343 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4345 = _T_4344 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4346 = _T_4345 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4347 = _T_4332 | _T_4346; // @[dec_dec_ctl.scala 264:39]
  wire  _T_4363 = _T_866 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4364 = _T_4363 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4365 = _T_4364 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4366 = _T_4365 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4367 = _T_4366 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4368 = _T_4367 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4369 = _T_4347 | _T_4368; // @[dec_dec_ctl.scala 264:71]
  wire  _T_4384 = _T_34 & _T_279; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4385 = _T_4384 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4386 = _T_4385 & _T_273; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4387 = _T_4386 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4388 = _T_4387 & _T_194; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4389 = _T_4388 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4390 = _T_4389 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4391 = _T_4369 | _T_4390; // @[dec_dec_ctl.scala 264:112]
  wire  _T_4403 = _T_937 & _T_11; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4404 = _T_4403 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4405 = _T_4404 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4406 = _T_4405 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4407 = _T_4406 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4408 = _T_4391 | _T_4407; // @[dec_dec_ctl.scala 265:43]
  wire  _T_4417 = _T_279 & io_ins[4]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4418 = _T_4417 & _T_275; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4419 = _T_4418 & io_ins[2]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4420 = _T_4419 & io_ins[1]; // @[dec_dec_ctl.scala 17:17]
  wire  _T_4421 = _T_4420 & io_ins[0]; // @[dec_dec_ctl.scala 17:17]
  assign io_out_clz = _T_1808 & _T_194; // @[dec_dec_ctl.scala 144:14]
  assign io_out_ctz = _T_1836 & _T_194; // @[dec_dec_ctl.scala 146:14]
  assign io_out_pcnt = _T_1861 & _T_194; // @[dec_dec_ctl.scala 148:15]
  assign io_out_sext_b = _T_1886 & _T_194; // @[dec_dec_ctl.scala 150:17]
  assign io_out_sext_h = _T_1910 & _T_194; // @[dec_dec_ctl.scala 152:17]
  assign io_out_slo = _T_1933 & _T_194; // @[dec_dec_ctl.scala 154:14]
  assign io_out_sro = _T_1955 & _T_194; // @[dec_dec_ctl.scala 156:14]
  assign io_out_min = _T_1971 & _T_194; // @[dec_dec_ctl.scala 158:14]
  assign io_out_max = _T_1986 & _T_194; // @[dec_dec_ctl.scala 160:14]
  assign io_out_pack = _T_2006 & _T_194; // @[dec_dec_ctl.scala 162:15]
  assign io_out_packu = _T_2022 & _T_194; // @[dec_dec_ctl.scala 164:16]
  assign io_out_packh = _T_2041 & _T_194; // @[dec_dec_ctl.scala 166:16]
  assign io_out_rol = _T_2060 & _T_194; // @[dec_dec_ctl.scala 168:14]
  assign io_out_ror = _T_2081 & _T_194; // @[dec_dec_ctl.scala 170:14]
  assign io_out_grev = _T_2625 & _T_194; // @[dec_dec_ctl.scala 204:15]
  assign io_out_gorc = _T_2646 & _T_194; // @[dec_dec_ctl.scala 206:15]
  assign io_out_zbb = _T_2342 | _T_526; // @[dec_dec_ctl.scala 172:14]
  assign io_out_sbset = _T_2377 & _T_194; // @[dec_dec_ctl.scala 180:16]
  assign io_out_sbclr = _T_2397 & _T_194; // @[dec_dec_ctl.scala 182:16]
  assign io_out_sbinv = _T_2418 & _T_194; // @[dec_dec_ctl.scala 184:16]
  assign io_out_sbext = _T_2439 & _T_194; // @[dec_dec_ctl.scala 186:16]
  assign io_out_zbs = _T_2459 | _T_2478; // @[dec_dec_ctl.scala 188:14]
  assign io_out_bext = _T_2500 & _T_194; // @[dec_dec_ctl.scala 190:15]
  assign io_out_bdep = _T_2518 & _T_194; // @[dec_dec_ctl.scala 192:15]
  assign io_out_zbe = _T_1445 & _T_194; // @[dec_dec_ctl.scala 194:14]
  assign io_out_clmul = _T_2556 & _T_194; // @[dec_dec_ctl.scala 196:16]
  assign io_out_clmulh = _T_2572 & _T_194; // @[dec_dec_ctl.scala 198:17]
  assign io_out_clmulr = _T_2589 & _T_194; // @[dec_dec_ctl.scala 200:17]
  assign io_out_zbc = _T_2605 & _T_194; // @[dec_dec_ctl.scala 202:14]
  assign io_out_shfl = _T_2672 & _T_194; // @[dec_dec_ctl.scala 208:15]
  assign io_out_unshfl = _T_2697 & _T_194; // @[dec_dec_ctl.scala 210:17]
  assign io_out_zbp = _T_2831 | _T_2847; // @[dec_dec_ctl.scala 212:14]
  assign io_out_crc32_b = _T_2878 & _T_194; // @[dec_dec_ctl.scala 217:18]
  assign io_out_crc32_h = _T_2905 & _T_194; // @[dec_dec_ctl.scala 219:18]
  assign io_out_crc32_w = _T_2932 & _T_194; // @[dec_dec_ctl.scala 221:18]
  assign io_out_crc32c_b = _T_2960 & _T_194; // @[dec_dec_ctl.scala 223:19]
  assign io_out_crc32c_h = _T_2984 & _T_194; // @[dec_dec_ctl.scala 225:19]
  assign io_out_crc32c_w = _T_3008 & _T_194; // @[dec_dec_ctl.scala 227:19]
  assign io_out_zbr = _T_1641 & _T_194; // @[dec_dec_ctl.scala 229:14]
  assign io_out_bfp = _T_3045 & _T_194; // @[dec_dec_ctl.scala 231:14]
  assign io_out_zbf = _T_3045 & _T_194; // @[dec_dec_ctl.scala 233:14]
  assign io_out_sh1add = _T_3077 & _T_194; // @[dec_dec_ctl.scala 235:17]
  assign io_out_sh2add = _T_3093 & _T_194; // @[dec_dec_ctl.scala 237:17]
  assign io_out_sh3add = _T_3106 & _T_194; // @[dec_dec_ctl.scala 239:17]
  assign io_out_zba = _T_3120 & _T_194; // @[dec_dec_ctl.scala 241:14]
  assign io_out_alu = _T_166 | _T_187; // @[dec_dec_ctl.scala 20:14]
  assign io_out_rs1 = _T_277 | _T_282; // @[dec_dec_ctl.scala 27:14]
  assign io_out_rs2 = _T_290 | _T_297; // @[dec_dec_ctl.scala 32:14]
  assign io_out_imm12 = _T_325 | _T_335; // @[dec_dec_ctl.scala 34:16]
  assign io_out_rd = _T_345 | io_ins[4]; // @[dec_dec_ctl.scala 36:13]
  assign io_out_shimm5 = _T_377 | _T_391; // @[dec_dec_ctl.scala 38:17]
  assign io_out_imm20 = _T_395 | _T_398; // @[dec_dec_ctl.scala 40:16]
  assign io_out_pc = _T_406 | _T_395; // @[dec_dec_ctl.scala 42:13]
  assign io_out_load = _T_417 & _T_194; // @[dec_dec_ctl.scala 44:15]
  assign io_out_store = _T_296 & _T_273; // @[dec_dec_ctl.scala 46:16]
  assign io_out_lsu = _T_432 & _T_194; // @[dec_dec_ctl.scala 48:14]
  assign io_out_add = _T_454 | _T_476; // @[dec_dec_ctl.scala 50:14]
  assign io_out_sub = _T_540 | _T_547; // @[dec_dec_ctl.scala 52:14]
  assign io_out_land = _T_565 | _T_576; // @[dec_dec_ctl.scala 55:15]
  assign io_out_lor = _T_619 | _T_631; // @[dec_dec_ctl.scala 57:14]
  assign io_out_lxor = _T_653 | _T_668; // @[dec_dec_ctl.scala 60:15]
  assign io_out_sll = _T_692 & _T_194; // @[dec_dec_ctl.scala 62:14]
  assign io_out_sra = _T_712 & _T_194; // @[dec_dec_ctl.scala 64:14]
  assign io_out_srl = _T_738 & _T_194; // @[dec_dec_ctl.scala 66:14]
  assign io_out_slt = _T_512 | _T_539; // @[dec_dec_ctl.scala 68:14]
  assign io_out_unsign = _T_833 | _T_848; // @[dec_dec_ctl.scala 70:17]
  assign io_out_condbr = _T_546 & _T_194; // @[dec_dec_ctl.scala 74:17]
  assign io_out_beq = _T_868 & _T_194; // @[dec_dec_ctl.scala 76:14]
  assign io_out_bne = _T_880 & _T_194; // @[dec_dec_ctl.scala 78:14]
  assign io_out_bge = _T_891 & _T_194; // @[dec_dec_ctl.scala 80:14]
  assign io_out_blt = _T_903 & _T_194; // @[dec_dec_ctl.scala 82:14]
  assign io_out_jal = io_ins[6] & io_ins[2]; // @[dec_dec_ctl.scala 84:14]
  assign io_out_by = _T_920 & _T_194; // @[dec_dec_ctl.scala 86:13]
  assign io_out_half = _T_930 & _T_194; // @[dec_dec_ctl.scala 88:15]
  assign io_out_word = _T_937 & _T_273; // @[dec_dec_ctl.scala 90:15]
  assign io_out_csr_read = _T_967 | _T_972; // @[dec_dec_ctl.scala 92:19]
  assign io_out_csr_clr = _T_1012 | _T_1021; // @[dec_dec_ctl.scala 95:18]
  assign io_out_csr_set = _T_1057 | _T_1065; // @[dec_dec_ctl.scala 98:18]
  assign io_out_csr_write = _T_1073 & io_ins[4]; // @[dec_dec_ctl.scala 101:20]
  assign io_out_csr_imm = _T_1114 | _T_1121; // @[dec_dec_ctl.scala 103:18]
  assign io_out_presync = _T_1203 | _T_1210; // @[dec_dec_ctl.scala 106:18]
  assign io_out_postsync = _T_1307 | _T_1210; // @[dec_dec_ctl.scala 111:19]
  assign io_out_ebreak = _T_1328 & io_ins[4]; // @[dec_dec_ctl.scala 116:17]
  assign io_out_ecall = _T_1343 & io_ins[4]; // @[dec_dec_ctl.scala 118:16]
  assign io_out_mret = _T_1354 & io_ins[4]; // @[dec_dec_ctl.scala 120:15]
  assign io_out_mul = _T_1643 | _T_1656; // @[dec_dec_ctl.scala 122:14]
  assign io_out_rs1_sign = _T_1679 | _T_1699; // @[dec_dec_ctl.scala 130:19]
  assign io_out_rs2_sign = _T_1698 & _T_194; // @[dec_dec_ctl.scala 132:19]
  assign io_out_low = _T_1736 & _T_194; // @[dec_dec_ctl.scala 134:14]
  assign io_out_div = _T_1750 & _T_194; // @[dec_dec_ctl.scala 136:14]
  assign io_out_rem = _T_1766 & _T_194; // @[dec_dec_ctl.scala 138:14]
  assign io_out_fence = _T_11 & io_ins[3]; // @[dec_dec_ctl.scala 140:16]
  assign io_out_fence_i = _T_1216 & io_ins[3]; // @[dec_dec_ctl.scala 142:18]
  assign io_out_pm_alu = _T_3196 | _T_122; // @[dec_dec_ctl.scala 243:17]
  assign io_out_legal = _T_4408 | _T_4421; // @[dec_dec_ctl.scala 248:16]
endmodule
module rvclkhdr(
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
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module dec_decode_ctl(
  input         clock,
  input         reset,
  output [1:0]  io_decode_exu_dec_data_en,
  output [1:0]  io_decode_exu_dec_ctl_en,
  output        io_decode_exu_i0_ap_clz,
  output        io_decode_exu_i0_ap_ctz,
  output        io_decode_exu_i0_ap_pcnt,
  output        io_decode_exu_i0_ap_sext_b,
  output        io_decode_exu_i0_ap_sext_h,
  output        io_decode_exu_i0_ap_slo,
  output        io_decode_exu_i0_ap_sro,
  output        io_decode_exu_i0_ap_min,
  output        io_decode_exu_i0_ap_max,
  output        io_decode_exu_i0_ap_pack,
  output        io_decode_exu_i0_ap_packu,
  output        io_decode_exu_i0_ap_packh,
  output        io_decode_exu_i0_ap_rol,
  output        io_decode_exu_i0_ap_ror,
  output        io_decode_exu_i0_ap_grev,
  output        io_decode_exu_i0_ap_gorc,
  output        io_decode_exu_i0_ap_zbb,
  output        io_decode_exu_i0_ap_sbset,
  output        io_decode_exu_i0_ap_sbclr,
  output        io_decode_exu_i0_ap_sbinv,
  output        io_decode_exu_i0_ap_sbext,
  output        io_decode_exu_i0_ap_sh1add,
  output        io_decode_exu_i0_ap_sh2add,
  output        io_decode_exu_i0_ap_sh3add,
  output        io_decode_exu_i0_ap_zba,
  output        io_decode_exu_i0_ap_land,
  output        io_decode_exu_i0_ap_lor,
  output        io_decode_exu_i0_ap_lxor,
  output        io_decode_exu_i0_ap_sll,
  output        io_decode_exu_i0_ap_srl,
  output        io_decode_exu_i0_ap_sra,
  output        io_decode_exu_i0_ap_beq,
  output        io_decode_exu_i0_ap_bne,
  output        io_decode_exu_i0_ap_blt,
  output        io_decode_exu_i0_ap_bge,
  output        io_decode_exu_i0_ap_add,
  output        io_decode_exu_i0_ap_sub,
  output        io_decode_exu_i0_ap_slt,
  output        io_decode_exu_i0_ap_unsign,
  output        io_decode_exu_i0_ap_jal,
  output        io_decode_exu_i0_ap_predict_t,
  output        io_decode_exu_i0_ap_predict_nt,
  output        io_decode_exu_i0_ap_csr_write,
  output        io_decode_exu_i0_ap_csr_imm,
  output        io_decode_exu_dec_i0_predict_p_d_valid,
  output        io_decode_exu_dec_i0_predict_p_d_bits_pc4,
  output [1:0]  io_decode_exu_dec_i0_predict_p_d_bits_hist,
  output [11:0] io_decode_exu_dec_i0_predict_p_d_bits_toffset,
  output        io_decode_exu_dec_i0_predict_p_d_bits_br_error,
  output        io_decode_exu_dec_i0_predict_p_d_bits_br_start_error,
  output        io_decode_exu_dec_i0_predict_p_d_bits_pcall,
  output        io_decode_exu_dec_i0_predict_p_d_bits_pja,
  output        io_decode_exu_dec_i0_predict_p_d_bits_way,
  output        io_decode_exu_dec_i0_predict_p_d_bits_pret,
  output [30:0] io_decode_exu_dec_i0_predict_p_d_bits_prett,
  output [7:0]  io_decode_exu_i0_predict_fghr_d,
  output [7:0]  io_decode_exu_i0_predict_index_d,
  output [4:0]  io_decode_exu_i0_predict_btag_d,
  output        io_decode_exu_dec_i0_rs1_en_d,
  output        io_decode_exu_dec_i0_branch_d,
  output        io_decode_exu_dec_i0_rs2_en_d,
  output [31:0] io_decode_exu_dec_i0_immed_d,
  output [31:0] io_decode_exu_dec_i0_result_r,
  output        io_decode_exu_dec_qual_lsu_d,
  output        io_decode_exu_dec_i0_select_pc_d,
  output [3:0]  io_decode_exu_dec_i0_rs1_bypass_en_d,
  output [3:0]  io_decode_exu_dec_i0_rs2_bypass_en_d,
  output        io_decode_exu_mul_p_valid,
  output        io_decode_exu_mul_p_bits_rs1_sign,
  output        io_decode_exu_mul_p_bits_rs2_sign,
  output        io_decode_exu_mul_p_bits_low,
  output        io_decode_exu_mul_p_bits_bext,
  output        io_decode_exu_mul_p_bits_bdep,
  output        io_decode_exu_mul_p_bits_clmul,
  output        io_decode_exu_mul_p_bits_clmulh,
  output        io_decode_exu_mul_p_bits_clmulr,
  output        io_decode_exu_mul_p_bits_grev,
  output        io_decode_exu_mul_p_bits_gorc,
  output        io_decode_exu_mul_p_bits_shfl,
  output        io_decode_exu_mul_p_bits_unshfl,
  output        io_decode_exu_mul_p_bits_crc32_b,
  output        io_decode_exu_mul_p_bits_crc32_h,
  output        io_decode_exu_mul_p_bits_crc32_w,
  output        io_decode_exu_mul_p_bits_crc32c_b,
  output        io_decode_exu_mul_p_bits_crc32c_h,
  output        io_decode_exu_mul_p_bits_crc32c_w,
  output        io_decode_exu_mul_p_bits_bfp,
  output [30:0] io_decode_exu_pred_correct_npc_x,
  output        io_decode_exu_dec_extint_stall,
  input  [31:0] io_decode_exu_exu_i0_result_x,
  input  [31:0] io_decode_exu_exu_csr_rs1_x,
  output        io_dec_alu_dec_i0_alu_decode_d,
  output        io_dec_alu_dec_csr_ren_d,
  output [11:0] io_dec_alu_dec_i0_br_immed_d,
  input  [30:0] io_dec_alu_exu_i0_pc_x,
  output        io_dec_div_div_p_valid,
  output        io_dec_div_div_p_bits_unsign,
  output        io_dec_div_div_p_bits_rem,
  output        io_dec_div_dec_div_cancel,
  input         io_dctl_busbuff_lsu_nonblock_load_valid_m,
  input  [1:0]  io_dctl_busbuff_lsu_nonblock_load_tag_m,
  input         io_dctl_busbuff_lsu_nonblock_load_inv_r,
  input  [1:0]  io_dctl_busbuff_lsu_nonblock_load_inv_tag_r,
  input         io_dctl_busbuff_lsu_nonblock_load_data_valid,
  input         io_dctl_busbuff_lsu_nonblock_load_data_error,
  input  [1:0]  io_dctl_busbuff_lsu_nonblock_load_data_tag,
  input         io_dctl_dma_dma_dccm_stall_any,
  output        io_dec_aln_dec_i0_decode_d,
  input  [15:0] io_dec_aln_ifu_i0_cinst,
  input  [31:0] io_dbg_dctl_dbg_cmd_wrdata,
  input         io_dec_tlu_trace_disable,
  input         io_dec_debug_valid_d,
  input         io_dec_tlu_flush_extint,
  input         io_dec_tlu_force_halt,
  output [31:0] io_dec_i0_inst_wb,
  output [30:0] io_dec_i0_pc_wb,
  input  [3:0]  io_dec_i0_trigger_match_d,
  input         io_dec_tlu_wr_pause_r,
  input         io_dec_tlu_pipelining_disable,
  input  [3:0]  io_lsu_trigger_match_m,
  input         io_lsu_pmu_misaligned_m,
  input         io_dec_tlu_debug_stall,
  input         io_dec_tlu_flush_leak_one_r,
  input         io_dec_debug_fence_d,
  input         io_dec_i0_icaf_d,
  input         io_dec_i0_icaf_second_d,
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
  input  [31:0] io_lsu_result_m,
  input  [31:0] io_lsu_result_corr_r,
  input         io_exu_flush_final,
  input  [31:0] io_dec_i0_instr_d,
  input         io_dec_ib0_valid_d,
  input         io_active_clk,
  input         io_free_l2clk,
  input         io_clk_override,
  output [4:0]  io_dec_i0_rs1_d,
  output [4:0]  io_dec_i0_rs2_d,
  output [4:0]  io_dec_i0_waddr_r,
  output        io_dec_i0_wen_r,
  output [31:0] io_dec_i0_wdata_r,
  output        io_lsu_p_valid,
  output        io_lsu_p_bits_fast_int,
  output        io_lsu_p_bits_stack,
  output        io_lsu_p_bits_by,
  output        io_lsu_p_bits_half,
  output        io_lsu_p_bits_word,
  output        io_lsu_p_bits_load,
  output        io_lsu_p_bits_store,
  output        io_lsu_p_bits_unsign,
  output        io_lsu_p_bits_store_data_bypass_d,
  output        io_lsu_p_bits_load_ldst_bypass_d,
  output [4:0]  io_div_waddr_wb,
  output        io_dec_lsu_valid_raw_d,
  output [11:0] io_dec_lsu_offset_d,
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
  output        io_dec_tlu_packet_r_icaf_second,
  output [1:0]  io_dec_tlu_packet_r_icaf_type,
  output        io_dec_tlu_packet_r_fence_i,
  output [3:0]  io_dec_tlu_packet_r_i0trigger,
  output [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  output        io_dec_tlu_packet_r_pmu_i0_br_unpred,
  output        io_dec_tlu_packet_r_pmu_divide,
  output        io_dec_tlu_packet_r_pmu_lsu_misaligned,
  output [30:0] io_dec_tlu_i0_pc_r,
  output [31:0] io_dec_illegal_inst,
  output        io_dec_pmu_instr_decoded,
  output        io_dec_pmu_decode_stall,
  output        io_dec_pmu_presync_stall,
  output        io_dec_pmu_postsync_stall,
  output        io_dec_nonblock_load_wen,
  output [4:0]  io_dec_nonblock_load_waddr,
  output        io_dec_pause_state,
  output        io_dec_pause_state_cg,
  output        io_dec_div_active
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] i0_dec_io_ins; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_clz; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_ctz; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_pcnt; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sext_b; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sext_h; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_slo; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sro; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_min; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_max; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_pack; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_packu; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_packh; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rol; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_ror; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_grev; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_gorc; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbb; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sbset; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sbclr; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sbinv; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sbext; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbs; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_bext; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_bdep; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbe; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_clmul; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_clmulh; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_clmulr; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbc; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_shfl; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_unshfl; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbp; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_crc32_b; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_crc32_h; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_crc32_w; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_crc32c_b; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_crc32c_h; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_crc32c_w; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbr; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_bfp; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zbf; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sh1add; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sh2add; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sh3add; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_zba; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_alu; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rs1; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rs2; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_imm12; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rd; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_shimm5; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_imm20; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_pc; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_load; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_store; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_lsu; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_add; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sub; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_land; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_lor; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_lxor; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sll; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_sra; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_srl; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_slt; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_unsign; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_condbr; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_beq; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_bne; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_bge; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_blt; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_jal; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_by; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_half; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_word; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_csr_read; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_csr_clr; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_csr_set; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_csr_write; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_csr_imm; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_presync; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_postsync; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_ebreak; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_ecall; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_mret; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_mul; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rs1_sign; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rs2_sign; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_low; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_div; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_rem; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_fence; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_fence_i; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_pm_alu; // @[dec_decode_ctl.scala 438:22]
  wire  i0_dec_io_out_legal; // @[dec_decode_ctl.scala 438:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  reg  leak1_i1_stall; // @[Reg.scala 27:20]
  wire  _T_367 = ~io_dec_tlu_flush_lower_r; // @[dec_decode_ctl.scala 445:73]
  wire  _T_368 = leak1_i1_stall & _T_367; // @[dec_decode_ctl.scala 445:71]
  wire  leak1_i1_stall_in = io_dec_tlu_flush_leak_one_r | _T_368; // @[dec_decode_ctl.scala 445:53]
  wire  _T_2 = leak1_i1_stall_in ^ leak1_i1_stall; // @[lib.scala 448:21]
  wire  _T_3 = |_T_2; // @[lib.scala 448:29]
  wire  _T_370 = io_dec_aln_dec_i0_decode_d & leak1_i1_stall; // @[dec_decode_ctl.scala 447:53]
  reg  leak1_i0_stall; // @[Reg.scala 27:20]
  wire  _T_372 = leak1_i0_stall & _T_367; // @[dec_decode_ctl.scala 447:89]
  wire  leak1_i0_stall_in = _T_370 | _T_372; // @[dec_decode_ctl.scala 447:71]
  wire  _T_6 = leak1_i0_stall_in ^ leak1_i0_stall; // @[lib.scala 448:21]
  wire  _T_7 = |_T_6; // @[lib.scala 448:29]
  reg  _T_12; // @[Reg.scala 27:20]
  wire  _T_10 = io_dec_tlu_flush_extint ^ _T_12; // @[lib.scala 470:21]
  wire  _T_11 = |_T_10; // @[lib.scala 470:29]
  reg  pause_stall; // @[Reg.scala 27:20]
  wire  _T_514 = io_dec_tlu_wr_pause_r | pause_stall; // @[dec_decode_ctl.scala 559:44]
  wire  _T_507 = ~io_dec_tlu_flush_pause_r; // @[dec_decode_ctl.scala 558:49]
  wire  _T_508 = io_dec_tlu_flush_lower_r & _T_507; // @[dec_decode_ctl.scala 558:47]
  reg [31:0] write_csr_data; // @[Reg.scala 27:20]
  wire [31:0] _T_511 = {31'h0,write_csr_data[0]}; // @[Cat.scala 29:58]
  wire  _T_512 = write_csr_data == _T_511; // @[dec_decode_ctl.scala 558:109]
  wire  _T_513 = pause_stall & _T_512; // @[dec_decode_ctl.scala 558:91]
  wire  clear_pause = _T_508 | _T_513; // @[dec_decode_ctl.scala 558:76]
  wire  _T_515 = ~clear_pause; // @[dec_decode_ctl.scala 559:61]
  wire  pause_state_in = _T_514 & _T_515; // @[dec_decode_ctl.scala 559:59]
  wire  _T_14 = pause_state_in ^ pause_stall; // @[lib.scala 470:21]
  wire  _T_15 = |_T_14; // @[lib.scala 470:29]
  reg  tlu_wr_pause_r1; // @[Reg.scala 27:20]
  wire  _T_18 = io_dec_tlu_wr_pause_r ^ tlu_wr_pause_r1; // @[lib.scala 470:21]
  wire  _T_19 = |_T_18; // @[lib.scala 470:29]
  reg  tlu_wr_pause_r2; // @[Reg.scala 27:20]
  wire  _T_22 = tlu_wr_pause_r1 ^ tlu_wr_pause_r2; // @[lib.scala 448:21]
  wire  _T_23 = |_T_22; // @[lib.scala 448:29]
  wire  _T_50 = ~leak1_i1_stall; // @[dec_decode_ctl.scala 222:82]
  wire  _T_51 = io_dec_i0_brp_valid & _T_50; // @[dec_decode_ctl.scala 222:80]
  wire  i0_icaf_d = io_dec_i0_icaf_d | io_dec_i0_dbecc_d; // @[dec_decode_ctl.scala 220:43]
  wire  _T_52 = ~i0_icaf_d; // @[dec_decode_ctl.scala 222:96]
  wire  i0_brp_valid = _T_51 & _T_52; // @[dec_decode_ctl.scala 222:94]
  wire  i0_dp_raw_condbr = i0_dec_io_out_condbr; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_jal = i0_dec_io_out_jal; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire [19:0] i0_pcall_imm = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21]}; // @[Cat.scala 29:58]
  wire  _T_383 = i0_pcall_imm[19:12] == 8'hff; // @[dec_decode_ctl.scala 452:79]
  wire  _T_385 = i0_pcall_imm[19:12] == 8'h0; // @[dec_decode_ctl.scala 452:112]
  wire  i0_pcall_12b_offset = i0_pcall_imm[11] ? _T_383 : _T_385; // @[dec_decode_ctl.scala 452:33]
  wire  i0_dp_raw_imm20 = i0_dec_io_out_imm20; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  _T_386 = i0_pcall_12b_offset & i0_dp_raw_imm20; // @[dec_decode_ctl.scala 453:47]
  wire [4:0] i0r_rd = io_dec_i0_instr_d[11:7]; // @[dec_decode_ctl.scala 678:16]
  wire  _T_387 = i0r_rd == 5'h1; // @[dec_decode_ctl.scala 453:76]
  wire  _T_388 = i0r_rd == 5'h5; // @[dec_decode_ctl.scala 453:98]
  wire  _T_389 = _T_387 | _T_388; // @[dec_decode_ctl.scala 453:89]
  wire  i0_pcall_case = _T_386 & _T_389; // @[dec_decode_ctl.scala 453:65]
  wire  i0_pcall_raw = i0_dp_raw_jal & i0_pcall_case; // @[dec_decode_ctl.scala 455:38]
  wire  _T_55 = i0_dp_raw_condbr | i0_pcall_raw; // @[dec_decode_ctl.scala 233:94]
  wire  _T_394 = ~_T_389; // @[dec_decode_ctl.scala 454:67]
  wire  i0_pja_case = _T_386 & _T_394; // @[dec_decode_ctl.scala 454:65]
  wire  i0_pja_raw = i0_dp_raw_jal & i0_pja_case; // @[dec_decode_ctl.scala 457:38]
  wire  _T_56 = _T_55 | i0_pja_raw; // @[dec_decode_ctl.scala 233:109]
  wire  i0_dp_raw_imm12 = i0_dec_io_out_imm12; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  _T_410 = i0_dp_raw_jal & i0_dp_raw_imm12; // @[dec_decode_ctl.scala 461:37]
  wire  _T_411 = i0r_rd == 5'h0; // @[dec_decode_ctl.scala 461:65]
  wire  _T_412 = _T_410 & _T_411; // @[dec_decode_ctl.scala 461:55]
  wire [4:0] i0r_rs1 = io_dec_i0_instr_d[19:15]; // @[dec_decode_ctl.scala 676:16]
  wire  _T_413 = i0r_rs1 == 5'h1; // @[dec_decode_ctl.scala 461:89]
  wire  _T_414 = i0r_rs1 == 5'h5; // @[dec_decode_ctl.scala 461:111]
  wire  _T_415 = _T_413 | _T_414; // @[dec_decode_ctl.scala 461:101]
  wire  i0_pret_case = _T_412 & _T_415; // @[dec_decode_ctl.scala 461:79]
  wire  i0_pret_raw = i0_dp_raw_jal & i0_pret_case; // @[dec_decode_ctl.scala 462:32]
  wire  _T_57 = _T_56 | i0_pret_raw; // @[dec_decode_ctl.scala 233:122]
  wire  _T_58 = ~_T_57; // @[dec_decode_ctl.scala 233:75]
  wire  _T_59 = i0_brp_valid & _T_58; // @[dec_decode_ctl.scala 233:73]
  wire  _T_68 = io_dec_i0_brp_bits_br_error | _T_59; // @[dec_decode_ctl.scala 238:89]
  wire  _T_61 = i0_brp_valid & io_dec_i0_brp_bits_hist[1]; // @[dec_decode_ctl.scala 236:74]
  wire  _T_399 = i0_pcall_raw | i0_pja_raw; // @[dec_decode_ctl.scala 459:41]
  wire [11:0] _T_408 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[7],io_dec_i0_instr_d[30:25],io_dec_i0_instr_d[11:8]}; // @[Cat.scala 29:58]
  wire [11:0] i0_br_offset = _T_399 ? i0_pcall_imm[11:0] : _T_408; // @[dec_decode_ctl.scala 459:26]
  wire  _T_62 = io_dec_i0_brp_bits_toffset != i0_br_offset; // @[dec_decode_ctl.scala 236:133]
  wire  _T_63 = _T_61 & _T_62; // @[dec_decode_ctl.scala 236:103]
  wire  _T_64 = ~i0_pret_raw; // @[dec_decode_ctl.scala 236:153]
  wire  _T_65 = _T_63 & _T_64; // @[dec_decode_ctl.scala 236:151]
  wire  _T_69 = _T_68 | _T_65; // @[dec_decode_ctl.scala 238:106]
  wire  _T_66 = io_dec_i0_brp_bits_ret ^ i0_pret_raw; // @[dec_decode_ctl.scala 237:100]
  wire  _T_67 = i0_brp_valid & _T_66; // @[dec_decode_ctl.scala 237:74]
  wire  _T_70 = _T_69 | _T_67; // @[dec_decode_ctl.scala 238:128]
  wire  _T_77 = _T_70 | io_dec_i0_brp_bits_br_start_error; // @[dec_decode_ctl.scala 243:74]
  wire  i0_br_error_all = _T_77 & _T_50; // @[dec_decode_ctl.scala 243:111]
  wire  _T_80 = i0_br_error_all | i0_icaf_d; // @[dec_decode_ctl.scala 280:25]
  wire  i0_dp_raw_legal = i0_dec_io_out_legal; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_legal = _T_80 | i0_dp_raw_legal; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_csr_read = i0_dec_io_out_csr_read; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_csr_read = _T_80 ? 1'h0 : i0_dp_raw_csr_read; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_csr_write = i0_dec_io_out_csr_write; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_csr_write = _T_80 ? 1'h0 : i0_dp_raw_csr_write; // @[dec_decode_ctl.scala 280:50]
  wire  _T_429 = ~io_dec_debug_fence_d; // @[dec_decode_ctl.scala 519:42]
  wire  i0_csr_write = i0_dp_csr_write & _T_429; // @[dec_decode_ctl.scala 519:40]
  wire  any_csr_d = i0_dp_csr_read | i0_csr_write; // @[dec_decode_ctl.scala 527:34]
  wire  _T_544 = ~any_csr_d; // @[dec_decode_ctl.scala 590:40]
  wire  _T_545 = _T_544 | io_dec_csr_legal_d; // @[dec_decode_ctl.scala 590:51]
  wire  i0_legal = i0_dp_legal & _T_545; // @[dec_decode_ctl.scala 590:37]
  wire  _T_563 = ~i0_legal; // @[dec_decode_ctl.scala 594:57]
  wire  shift_illegal = io_dec_aln_dec_i0_decode_d & _T_563; // @[dec_decode_ctl.scala 594:55]
  reg  illegal_lockout; // @[Reg.scala 27:20]
  wire  _T_566 = shift_illegal | illegal_lockout; // @[dec_decode_ctl.scala 597:40]
  reg  flush_final_r; // @[Reg.scala 27:20]
  wire  _T_567 = ~flush_final_r; // @[dec_decode_ctl.scala 597:61]
  wire  illegal_lockout_in = _T_566 & _T_567; // @[dec_decode_ctl.scala 597:59]
  wire  _T_26 = illegal_lockout_in ^ illegal_lockout; // @[lib.scala 448:21]
  wire  _T_27 = |_T_26; // @[lib.scala 448:29]
  wire  i0_dp_raw_postsync = i0_dec_io_out_postsync; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_postsync = _T_80 | i0_dp_raw_postsync; // @[dec_decode_ctl.scala 280:50]
  wire  _T_539 = i0_dp_postsync | io_dec_tlu_postsync_d; // @[dec_decode_ctl.scala 586:36]
  wire  debug_fence_i = io_dec_debug_fence_d & io_dbg_dctl_dbg_cmd_wrdata[0]; // @[dec_decode_ctl.scala 578:48]
  wire  _T_540 = _T_539 | debug_fence_i; // @[dec_decode_ctl.scala 586:60]
  wire  _T_433 = ~i0_dp_csr_read; // @[dec_decode_ctl.scala 524:41]
  wire  i0_csr_write_only_d = i0_csr_write & _T_433; // @[dec_decode_ctl.scala 524:39]
  wire  _T_542 = io_dec_i0_instr_d[31:20] == 12'h7c2; // @[dec_decode_ctl.scala 586:112]
  wire  _T_543 = i0_csr_write_only_d & _T_542; // @[dec_decode_ctl.scala 586:99]
  wire  i0_postsync = _T_540 | _T_543; // @[dec_decode_ctl.scala 586:76]
  wire  _T_605 = i0_postsync | _T_563; // @[dec_decode_ctl.scala 628:62]
  wire  _T_606 = io_dec_aln_dec_i0_decode_d & _T_605; // @[dec_decode_ctl.scala 628:47]
  reg  postsync_stall; // @[Reg.scala 27:20]
  reg  x_d_valid; // @[Reg.scala 27:20]
  wire  _T_607 = postsync_stall & x_d_valid; // @[dec_decode_ctl.scala 628:96]
  wire  ps_stall_in = _T_606 | _T_607; // @[dec_decode_ctl.scala 628:77]
  wire  _T_30 = ps_stall_in ^ postsync_stall; // @[lib.scala 448:21]
  wire  _T_31 = |_T_30; // @[lib.scala 448:29]
  reg [3:0] lsu_trigger_match_r; // @[Reg.scala 27:20]
  wire [3:0] _T_33 = io_lsu_trigger_match_m ^ lsu_trigger_match_r; // @[lib.scala 448:21]
  wire  _T_34 = |_T_33; // @[lib.scala 448:29]
  reg  lsu_pmu_misaligned_r; // @[Reg.scala 27:20]
  wire  _T_36 = io_lsu_pmu_misaligned_m ^ lsu_pmu_misaligned_r; // @[lib.scala 470:21]
  wire  _T_37 = |_T_36; // @[lib.scala 470:29]
  wire  i0_legal_decode_d = io_dec_aln_dec_i0_decode_d & i0_legal; // @[dec_decode_ctl.scala 756:54]
  wire  i0_dp_raw_div = i0_dec_io_out_div; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_div = _T_80 ? 1'h0 : i0_dp_raw_div; // @[dec_decode_ctl.scala 280:50]
  wire  i0_div_decode_d = i0_legal_decode_d & i0_dp_div; // @[dec_decode_ctl.scala 843:55]
  wire  _T_934 = ~io_exu_div_wren; // @[dec_decode_ctl.scala 845:59]
  wire  _T_935 = io_dec_div_active & _T_934; // @[dec_decode_ctl.scala 845:57]
  reg  x_d_bits_i0div; // @[Reg.scala 27:20]
  wire  _T_918 = x_d_bits_i0div & x_d_valid; // @[dec_decode_ctl.scala 833:48]
  reg [4:0] x_d_bits_i0rd; // @[Reg.scala 27:20]
  wire  _T_919 = x_d_bits_i0rd == 5'h0; // @[dec_decode_ctl.scala 833:77]
  wire  _T_920 = _T_918 & _T_919; // @[dec_decode_ctl.scala 833:60]
  wire  _T_922 = _T_918 & io_dec_tlu_flush_lower_r; // @[dec_decode_ctl.scala 834:33]
  wire  _T_923 = _T_920 | _T_922; // @[dec_decode_ctl.scala 833:94]
  reg  r_d_bits_i0div; // @[Reg.scala 27:20]
  reg  r_d_valid; // @[Reg.scala 27:20]
  wire  _T_924 = r_d_bits_i0div & r_d_valid; // @[dec_decode_ctl.scala 835:21]
  wire  _T_925 = _T_924 & io_dec_tlu_flush_lower_r; // @[dec_decode_ctl.scala 835:33]
  wire  _T_926 = _T_925 & io_dec_tlu_i0_kill_writeb_r; // @[dec_decode_ctl.scala 835:60]
  wire  div_flush = _T_923 | _T_926; // @[dec_decode_ctl.scala 834:62]
  wire  _T_927 = io_dec_div_active & div_flush; // @[dec_decode_ctl.scala 839:51]
  wire  div_e1_to_r = _T_918 | _T_924; // @[dec_decode_ctl.scala 831:58]
  wire  _T_928 = ~div_e1_to_r; // @[dec_decode_ctl.scala 840:26]
  wire  _T_929 = io_dec_div_active & _T_928; // @[dec_decode_ctl.scala 840:24]
  reg [4:0] r_d_bits_i0rd; // @[Reg.scala 27:20]
  wire  _T_930 = r_d_bits_i0rd == io_div_waddr_wb; // @[dec_decode_ctl.scala 840:56]
  wire  _T_931 = _T_929 & _T_930; // @[dec_decode_ctl.scala 840:39]
  reg  r_d_bits_i0v; // @[Reg.scala 27:20]
  wire  _T_857 = ~io_dec_tlu_flush_lower_wb; // @[dec_decode_ctl.scala 798:51]
  wire  r_d_in_bits_i0v = r_d_bits_i0v & _T_857; // @[dec_decode_ctl.scala 798:49]
  wire  _T_868 = ~io_dec_tlu_i0_kill_writeb_r; // @[dec_decode_ctl.scala 806:47]
  wire  i0_wen_r = r_d_in_bits_i0v & _T_868; // @[dec_decode_ctl.scala 806:45]
  wire  _T_932 = _T_931 & i0_wen_r; // @[dec_decode_ctl.scala 840:77]
  wire  nonblock_div_cancel = _T_927 | _T_932; // @[dec_decode_ctl.scala 839:65]
  wire  _T_936 = ~nonblock_div_cancel; // @[dec_decode_ctl.scala 845:78]
  wire  _T_937 = _T_935 & _T_936; // @[dec_decode_ctl.scala 845:76]
  wire  div_active_in = i0_div_decode_d | _T_937; // @[dec_decode_ctl.scala 845:36]
  reg  _T_42; // @[Reg.scala 27:20]
  wire  _T_40 = div_active_in ^ _T_42; // @[lib.scala 470:21]
  wire  _T_41 = |_T_40; // @[lib.scala 470:29]
  wire  _T_44 = io_exu_flush_final ^ flush_final_r; // @[lib.scala 470:21]
  wire  _T_45 = |_T_44; // @[lib.scala 470:29]
  reg  debug_valid_x; // @[Reg.scala 27:20]
  wire  _T_47 = io_dec_debug_valid_d ^ debug_valid_x; // @[lib.scala 470:21]
  wire  _T_48 = |_T_47; // @[lib.scala 470:29]
  wire  _T_71 = _T_70 & i0_legal_decode_d; // @[dec_decode_ctl.scala 239:74]
  wire  _T_74 = io_dec_i0_brp_bits_br_start_error & i0_legal_decode_d; // @[dec_decode_ctl.scala 240:96]
  wire  i0_dp_raw_pm_alu = i0_dec_io_out_pm_alu; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_pm_alu = _T_80 ? 1'h0 : i0_dp_raw_pm_alu; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_fence_i = i0_dec_io_out_fence_i; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_fence_i = _T_80 ? 1'h0 : i0_dp_raw_fence_i; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_fence = i0_dec_io_out_fence; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_fence = _T_80 ? 1'h0 : i0_dp_raw_fence; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_rem = i0_dec_io_out_rem; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_low = i0_dec_io_out_low; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_rs2_sign = i0_dec_io_out_rs2_sign; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_rs1_sign = i0_dec_io_out_rs1_sign; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_mul = i0_dec_io_out_mul; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_mul = _T_80 ? 1'h0 : i0_dp_raw_mul; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_mret = i0_dec_io_out_mret; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_mret = _T_80 ? 1'h0 : i0_dp_raw_mret; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_ecall = i0_dec_io_out_ecall; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_ecall = _T_80 ? 1'h0 : i0_dp_raw_ecall; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_ebreak = i0_dec_io_out_ebreak; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_ebreak = _T_80 ? 1'h0 : i0_dp_raw_ebreak; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_presync = i0_dec_io_out_presync; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_presync = _T_80 ? 1'h0 : i0_dp_raw_presync; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_csr_imm = i0_dec_io_out_csr_imm; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_csr_imm = _T_80 ? 1'h0 : i0_dp_raw_csr_imm; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_csr_set = i0_dec_io_out_csr_set; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_csr_set = _T_80 ? 1'h0 : i0_dp_raw_csr_set; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_csr_clr = i0_dec_io_out_csr_clr; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_csr_clr = _T_80 ? 1'h0 : i0_dp_raw_csr_clr; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_word = i0_dec_io_out_word; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_word = _T_80 ? 1'h0 : i0_dp_raw_word; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_half = i0_dec_io_out_half; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_half = _T_80 ? 1'h0 : i0_dp_raw_half; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_by = i0_dec_io_out_by; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_by = _T_80 ? 1'h0 : i0_dp_raw_by; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_jal = _T_80 ? 1'h0 : i0_dp_raw_jal; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_blt = i0_dec_io_out_blt; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_bge = i0_dec_io_out_bge; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_bne = i0_dec_io_out_bne; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_beq = i0_dec_io_out_beq; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_condbr = _T_80 ? 1'h0 : i0_dp_raw_condbr; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_unsign = i0_dec_io_out_unsign; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_unsign = _T_80 ? 1'h0 : i0_dp_raw_unsign; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_slt = i0_dec_io_out_slt; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_srl = i0_dec_io_out_srl; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sra = i0_dec_io_out_sra; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sll = i0_dec_io_out_sll; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_lxor = i0_dec_io_out_lxor; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_lor = i0_dec_io_out_lor; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_land = i0_dec_io_out_land; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sub = i0_dec_io_out_sub; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_add = i0_dec_io_out_add; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_lsu = i0_dec_io_out_lsu; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_lsu = _T_80 ? 1'h0 : i0_dp_raw_lsu; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_store = i0_dec_io_out_store; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_store = _T_80 ? 1'h0 : i0_dp_raw_store; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_load = i0_dec_io_out_load; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_load = _T_80 ? 1'h0 : i0_dp_raw_load; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_pc = i0_dec_io_out_pc; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_imm20 = _T_80 ? 1'h0 : i0_dp_raw_imm20; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_shimm5 = i0_dec_io_out_shimm5; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_shimm5 = _T_80 ? 1'h0 : i0_dp_raw_shimm5; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_rd = i0_dec_io_out_rd; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_rd = _T_80 ? 1'h0 : i0_dp_raw_rd; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_imm12 = _T_80 ? 1'h0 : i0_dp_raw_imm12; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_rs2 = i0_dec_io_out_rs2; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_rs2 = _T_80 | i0_dp_raw_rs2; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_rs1 = i0_dec_io_out_rs1; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_rs1 = _T_80 | i0_dp_raw_rs1; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_alu = i0_dec_io_out_alu; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_alu = _T_80 | i0_dp_raw_alu; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_zba = i0_dec_io_out_zba; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zba = _T_80 ? 1'h0 : i0_dp_raw_zba; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_sh3add = i0_dec_io_out_sh3add; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sh2add = i0_dec_io_out_sh2add; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sh1add = i0_dec_io_out_sh1add; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbf = i0_dec_io_out_zbf; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbf = _T_80 ? 1'h0 : i0_dp_raw_zbf; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_bfp = i0_dec_io_out_bfp; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbr = i0_dec_io_out_zbr; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbr = _T_80 ? 1'h0 : i0_dp_raw_zbr; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_crc32c_w = i0_dec_io_out_crc32c_w; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_crc32c_h = i0_dec_io_out_crc32c_h; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_crc32c_b = i0_dec_io_out_crc32c_b; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_crc32_w = i0_dec_io_out_crc32_w; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_crc32_h = i0_dec_io_out_crc32_h; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_crc32_b = i0_dec_io_out_crc32_b; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbp = i0_dec_io_out_zbp; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbp = _T_80 ? 1'h0 : i0_dp_raw_zbp; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_unshfl = i0_dec_io_out_unshfl; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_shfl = i0_dec_io_out_shfl; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbc = i0_dec_io_out_zbc; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbc = _T_80 ? 1'h0 : i0_dp_raw_zbc; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_clmulr = i0_dec_io_out_clmulr; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_clmulh = i0_dec_io_out_clmulh; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_clmul = i0_dec_io_out_clmul; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbe = i0_dec_io_out_zbe; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbe = _T_80 ? 1'h0 : i0_dp_raw_zbe; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_bdep = i0_dec_io_out_bdep; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_bext = i0_dec_io_out_bext; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbs = i0_dec_io_out_zbs; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbs = _T_80 ? 1'h0 : i0_dp_raw_zbs; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_sbext = i0_dec_io_out_sbext; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sbinv = i0_dec_io_out_sbinv; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sbclr = i0_dec_io_out_sbclr; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sbset = i0_dec_io_out_sbset; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_zbb = i0_dec_io_out_zbb; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_zbb = _T_80 ? 1'h0 : i0_dp_raw_zbb; // @[dec_decode_ctl.scala 280:50]
  wire  i0_dp_raw_gorc = i0_dec_io_out_gorc; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_grev = i0_dec_io_out_grev; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_ror = i0_dec_io_out_ror; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_rol = i0_dec_io_out_rol; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_packh = i0_dec_io_out_packh; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_packu = i0_dec_io_out_packu; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_pack = i0_dec_io_out_pack; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_max = i0_dec_io_out_max; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_min = i0_dec_io_out_min; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sro = i0_dec_io_out_sro; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_slo = i0_dec_io_out_slo; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sext_h = i0_dec_io_out_sext_h; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_sext_b = i0_dec_io_out_sext_b; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_pcnt = i0_dec_io_out_pcnt; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_ctz = i0_dec_io_out_ctz; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_dp_raw_clz = i0_dec_io_out_clz; // @[dec_decode_ctl.scala 146:37 dec_decode_ctl.scala 440:12]
  wire  i0_pcall = i0_dp_jal & i0_pcall_case; // @[dec_decode_ctl.scala 456:38]
  wire  _T_83 = i0_dp_condbr | i0_pcall; // @[dec_decode_ctl.scala 294:54]
  wire  i0_pja = i0_dp_jal & i0_pja_case; // @[dec_decode_ctl.scala 458:38]
  wire  _T_84 = _T_83 | i0_pja; // @[dec_decode_ctl.scala 294:65]
  wire  i0_pret = i0_dp_jal & i0_pret_case; // @[dec_decode_ctl.scala 463:32]
  wire  i0_predict_br = _T_84 | i0_pret; // @[dec_decode_ctl.scala 294:74]
  wire  _T_86 = io_dec_i0_brp_bits_hist[1] & i0_brp_valid; // @[dec_decode_ctl.scala 295:69]
  wire  _T_87 = ~_T_86; // @[dec_decode_ctl.scala 295:40]
  wire  i0_ap_pc2 = ~io_dec_i0_pc4_d; // @[dec_decode_ctl.scala 297:40]
  wire  cam_data_reset = io_dctl_busbuff_lsu_nonblock_load_data_valid | io_dctl_busbuff_lsu_nonblock_load_data_error; // @[dec_decode_ctl.scala 356:76]
  reg [2:0] cam_raw_0_bits_tag; // @[Reg.scala 27:20]
  wire [2:0] _GEN_256 = {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_data_tag}; // @[dec_decode_ctl.scala 367:67]
  wire  _T_133 = _GEN_256 == cam_raw_0_bits_tag; // @[dec_decode_ctl.scala 367:67]
  wire  _T_134 = cam_data_reset & _T_133; // @[dec_decode_ctl.scala 367:45]
  reg  cam_raw_0_valid; // @[Reg.scala 27:20]
  wire  cam_data_reset_val_0 = _T_134 & cam_raw_0_valid; // @[dec_decode_ctl.scala 367:88]
  wire  cam_0_valid = cam_data_reset_val_0 ? 1'h0 : cam_raw_0_valid; // @[dec_decode_ctl.scala 371:39]
  wire  _T_90 = ~cam_0_valid; // @[dec_decode_ctl.scala 348:78]
  reg [2:0] cam_raw_1_bits_tag; // @[Reg.scala 27:20]
  wire  _T_169 = _GEN_256 == cam_raw_1_bits_tag; // @[dec_decode_ctl.scala 367:67]
  wire  _T_170 = cam_data_reset & _T_169; // @[dec_decode_ctl.scala 367:45]
  reg  cam_raw_1_valid; // @[Reg.scala 27:20]
  wire  cam_data_reset_val_1 = _T_170 & cam_raw_1_valid; // @[dec_decode_ctl.scala 367:88]
  wire  cam_1_valid = cam_data_reset_val_1 ? 1'h0 : cam_raw_1_valid; // @[dec_decode_ctl.scala 371:39]
  wire  _T_93 = ~cam_1_valid; // @[dec_decode_ctl.scala 348:78]
  wire  _T_96 = cam_0_valid & _T_93; // @[dec_decode_ctl.scala 348:126]
  wire [1:0] _T_98 = {io_dctl_busbuff_lsu_nonblock_load_valid_m, 1'h0}; // @[dec_decode_ctl.scala 348:158]
  reg [2:0] cam_raw_2_bits_tag; // @[Reg.scala 27:20]
  wire  _T_205 = _GEN_256 == cam_raw_2_bits_tag; // @[dec_decode_ctl.scala 367:67]
  wire  _T_206 = cam_data_reset & _T_205; // @[dec_decode_ctl.scala 367:45]
  reg  cam_raw_2_valid; // @[Reg.scala 27:20]
  wire  cam_data_reset_val_2 = _T_206 & cam_raw_2_valid; // @[dec_decode_ctl.scala 367:88]
  wire  cam_2_valid = cam_data_reset_val_2 ? 1'h0 : cam_raw_2_valid; // @[dec_decode_ctl.scala 371:39]
  wire  _T_99 = ~cam_2_valid; // @[dec_decode_ctl.scala 348:78]
  wire  _T_102 = cam_0_valid & cam_1_valid; // @[dec_decode_ctl.scala 348:126]
  wire  _T_105 = _T_102 & _T_99; // @[dec_decode_ctl.scala 348:126]
  wire [2:0] _T_107 = {io_dctl_busbuff_lsu_nonblock_load_valid_m, 2'h0}; // @[dec_decode_ctl.scala 348:158]
  reg [2:0] cam_raw_3_bits_tag; // @[Reg.scala 27:20]
  wire  _T_241 = _GEN_256 == cam_raw_3_bits_tag; // @[dec_decode_ctl.scala 367:67]
  wire  _T_242 = cam_data_reset & _T_241; // @[dec_decode_ctl.scala 367:45]
  reg  cam_raw_3_valid; // @[Reg.scala 27:20]
  wire  cam_data_reset_val_3 = _T_242 & cam_raw_3_valid; // @[dec_decode_ctl.scala 367:88]
  wire  cam_3_valid = cam_data_reset_val_3 ? 1'h0 : cam_raw_3_valid; // @[dec_decode_ctl.scala 371:39]
  wire  _T_108 = ~cam_3_valid; // @[dec_decode_ctl.scala 348:78]
  wire  _T_114 = _T_102 & cam_2_valid; // @[dec_decode_ctl.scala 348:126]
  wire  _T_117 = _T_114 & _T_108; // @[dec_decode_ctl.scala 348:126]
  wire [3:0] _T_119 = {io_dctl_busbuff_lsu_nonblock_load_valid_m, 3'h0}; // @[dec_decode_ctl.scala 348:158]
  wire  _T_120 = _T_90 & io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[Mux.scala 27:72]
  wire [1:0] _T_121 = _T_96 ? _T_98 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_122 = _T_105 ? _T_107 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_123 = _T_117 ? _T_119 : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_260 = {{1'd0}, _T_120}; // @[Mux.scala 27:72]
  wire [1:0] _T_124 = _GEN_260 | _T_121; // @[Mux.scala 27:72]
  wire [2:0] _GEN_261 = {{1'd0}, _T_124}; // @[Mux.scala 27:72]
  wire [2:0] _T_125 = _GEN_261 | _T_122; // @[Mux.scala 27:72]
  wire [3:0] _GEN_262 = {{1'd0}, _T_125}; // @[Mux.scala 27:72]
  wire [3:0] cam_wen = _GEN_262 | _T_123; // @[Mux.scala 27:72]
  reg  x_d_bits_i0load; // @[Reg.scala 27:20]
  wire [4:0] nonblock_load_rd = x_d_bits_i0load ? x_d_bits_i0rd : 5'h0; // @[dec_decode_ctl.scala 359:31]
  reg [2:0] _T_815; // @[dec_decode_ctl.scala 764:80]
  wire [3:0] i0_pipe_en = {io_dec_aln_dec_i0_decode_d,_T_815}; // @[Cat.scala 29:58]
  wire  _T_821 = |i0_pipe_en[2:1]; // @[dec_decode_ctl.scala 767:49]
  wire  i0_r_ctl_en = _T_821 | io_clk_override; // @[dec_decode_ctl.scala 767:53]
  reg  nonblock_load_valid_m_delay; // @[Reg.scala 27:20]
  reg  r_d_bits_i0load; // @[Reg.scala 27:20]
  wire  i0_load_kill_wen_r = nonblock_load_valid_m_delay & r_d_bits_i0load; // @[dec_decode_ctl.scala 364:56]
  wire [2:0] _GEN_263 = {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_inv_tag_r}; // @[dec_decode_ctl.scala 366:66]
  wire  _T_130 = _GEN_263 == cam_raw_0_bits_tag; // @[dec_decode_ctl.scala 366:66]
  wire  _T_131 = io_dctl_busbuff_lsu_nonblock_load_inv_r & _T_130; // @[dec_decode_ctl.scala 366:45]
  wire  cam_inv_reset_val_0 = _T_131 & cam_0_valid; // @[dec_decode_ctl.scala 366:87]
  reg [4:0] cam_raw_0_bits_rd; // @[Reg.scala 27:20]
  wire  _T_142 = r_d_bits_i0rd == cam_raw_0_bits_rd; // @[dec_decode_ctl.scala 379:85]
  wire  _T_143 = i0_wen_r & _T_142; // @[dec_decode_ctl.scala 379:64]
  reg  cam_raw_0_bits_wb; // @[Reg.scala 27:20]
  wire  _T_145 = _T_143 & cam_raw_0_bits_wb; // @[dec_decode_ctl.scala 379:105]
  wire  _T_146 = cam_inv_reset_val_0 | _T_145; // @[dec_decode_ctl.scala 379:44]
  wire  _GEN_110 = _T_146 ? 1'h0 : cam_0_valid; // @[dec_decode_ctl.scala 379:131]
  wire [4:0] _GEN_111 = _T_146 ? 5'h0 : cam_raw_0_bits_rd; // @[dec_decode_ctl.scala 379:131]
  wire [2:0] _GEN_112 = _T_146 ? 3'h0 : cam_raw_0_bits_tag; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_113 = _T_146 ? 1'h0 : cam_raw_0_bits_wb; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_114 = cam_wen[0] | _GEN_110; // @[dec_decode_ctl.scala 374:28]
  wire  _GEN_115 = cam_wen[0] ? 1'h0 : _GEN_113; // @[dec_decode_ctl.scala 374:28]
  wire [2:0] cam_in_0_bits_tag = cam_wen[0] ? {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m} : _GEN_112; // @[dec_decode_ctl.scala 374:28]
  wire [4:0] cam_in_0_bits_rd = cam_wen[0] ? nonblock_load_rd : _GEN_111; // @[dec_decode_ctl.scala 374:28]
  wire  _T_149 = nonblock_load_valid_m_delay & _T_130; // @[dec_decode_ctl.scala 384:44]
  wire  _T_151 = _T_149 & cam_0_valid; // @[dec_decode_ctl.scala 384:113]
  wire  cam_in_0_bits_wb = _T_151 | _GEN_115; // @[dec_decode_ctl.scala 384:135]
  wire  cam_in_0_valid = io_dec_tlu_force_halt ? 1'h0 : _GEN_114; // @[dec_decode_ctl.scala 388:32]
  wire [8:0] _T_154 = {cam_in_0_bits_wb,cam_in_0_bits_tag,cam_in_0_bits_rd}; // @[lib.scala 494:61]
  wire [8:0] _T_156 = {cam_raw_0_bits_wb,cam_raw_0_bits_tag,cam_raw_0_bits_rd}; // @[lib.scala 494:74]
  wire [8:0] _T_157 = _T_154 ^ _T_156; // @[lib.scala 494:68]
  wire  _T_158 = |_T_157; // @[lib.scala 494:82]
  wire  _T_159 = cam_in_0_valid ^ cam_raw_0_valid; // @[lib.scala 494:68]
  wire  _T_160 = |_T_159; // @[lib.scala 494:82]
  wire  _T_161 = _T_158 | _T_160; // @[lib.scala 494:97]
  wire  nonblock_load_write_0 = _T_133 & cam_raw_0_valid; // @[dec_decode_ctl.scala 393:71]
  wire  _T_166 = _GEN_263 == cam_raw_1_bits_tag; // @[dec_decode_ctl.scala 366:66]
  wire  _T_167 = io_dctl_busbuff_lsu_nonblock_load_inv_r & _T_166; // @[dec_decode_ctl.scala 366:45]
  wire  cam_inv_reset_val_1 = _T_167 & cam_1_valid; // @[dec_decode_ctl.scala 366:87]
  reg [4:0] cam_raw_1_bits_rd; // @[Reg.scala 27:20]
  wire  _T_178 = r_d_bits_i0rd == cam_raw_1_bits_rd; // @[dec_decode_ctl.scala 379:85]
  wire  _T_179 = i0_wen_r & _T_178; // @[dec_decode_ctl.scala 379:64]
  reg  cam_raw_1_bits_wb; // @[Reg.scala 27:20]
  wire  _T_181 = _T_179 & cam_raw_1_bits_wb; // @[dec_decode_ctl.scala 379:105]
  wire  _T_182 = cam_inv_reset_val_1 | _T_181; // @[dec_decode_ctl.scala 379:44]
  wire  _GEN_125 = _T_182 ? 1'h0 : cam_1_valid; // @[dec_decode_ctl.scala 379:131]
  wire [4:0] _GEN_126 = _T_182 ? 5'h0 : cam_raw_1_bits_rd; // @[dec_decode_ctl.scala 379:131]
  wire [2:0] _GEN_127 = _T_182 ? 3'h0 : cam_raw_1_bits_tag; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_128 = _T_182 ? 1'h0 : cam_raw_1_bits_wb; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_129 = cam_wen[1] | _GEN_125; // @[dec_decode_ctl.scala 374:28]
  wire  _GEN_130 = cam_wen[1] ? 1'h0 : _GEN_128; // @[dec_decode_ctl.scala 374:28]
  wire [2:0] cam_in_1_bits_tag = cam_wen[1] ? {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m} : _GEN_127; // @[dec_decode_ctl.scala 374:28]
  wire [4:0] cam_in_1_bits_rd = cam_wen[1] ? nonblock_load_rd : _GEN_126; // @[dec_decode_ctl.scala 374:28]
  wire  _T_185 = nonblock_load_valid_m_delay & _T_166; // @[dec_decode_ctl.scala 384:44]
  wire  _T_187 = _T_185 & cam_1_valid; // @[dec_decode_ctl.scala 384:113]
  wire  cam_in_1_bits_wb = _T_187 | _GEN_130; // @[dec_decode_ctl.scala 384:135]
  wire  cam_in_1_valid = io_dec_tlu_force_halt ? 1'h0 : _GEN_129; // @[dec_decode_ctl.scala 388:32]
  wire [8:0] _T_190 = {cam_in_1_bits_wb,cam_in_1_bits_tag,cam_in_1_bits_rd}; // @[lib.scala 494:61]
  wire [8:0] _T_192 = {cam_raw_1_bits_wb,cam_raw_1_bits_tag,cam_raw_1_bits_rd}; // @[lib.scala 494:74]
  wire [8:0] _T_193 = _T_190 ^ _T_192; // @[lib.scala 494:68]
  wire  _T_194 = |_T_193; // @[lib.scala 494:82]
  wire  _T_195 = cam_in_1_valid ^ cam_raw_1_valid; // @[lib.scala 494:68]
  wire  _T_196 = |_T_195; // @[lib.scala 494:82]
  wire  _T_197 = _T_194 | _T_196; // @[lib.scala 494:97]
  wire  nonblock_load_write_1 = _T_169 & cam_raw_1_valid; // @[dec_decode_ctl.scala 393:71]
  wire  _T_202 = _GEN_263 == cam_raw_2_bits_tag; // @[dec_decode_ctl.scala 366:66]
  wire  _T_203 = io_dctl_busbuff_lsu_nonblock_load_inv_r & _T_202; // @[dec_decode_ctl.scala 366:45]
  wire  cam_inv_reset_val_2 = _T_203 & cam_2_valid; // @[dec_decode_ctl.scala 366:87]
  reg [4:0] cam_raw_2_bits_rd; // @[Reg.scala 27:20]
  wire  _T_214 = r_d_bits_i0rd == cam_raw_2_bits_rd; // @[dec_decode_ctl.scala 379:85]
  wire  _T_215 = i0_wen_r & _T_214; // @[dec_decode_ctl.scala 379:64]
  reg  cam_raw_2_bits_wb; // @[Reg.scala 27:20]
  wire  _T_217 = _T_215 & cam_raw_2_bits_wb; // @[dec_decode_ctl.scala 379:105]
  wire  _T_218 = cam_inv_reset_val_2 | _T_217; // @[dec_decode_ctl.scala 379:44]
  wire  _GEN_140 = _T_218 ? 1'h0 : cam_2_valid; // @[dec_decode_ctl.scala 379:131]
  wire [4:0] _GEN_141 = _T_218 ? 5'h0 : cam_raw_2_bits_rd; // @[dec_decode_ctl.scala 379:131]
  wire [2:0] _GEN_142 = _T_218 ? 3'h0 : cam_raw_2_bits_tag; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_143 = _T_218 ? 1'h0 : cam_raw_2_bits_wb; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_144 = cam_wen[2] | _GEN_140; // @[dec_decode_ctl.scala 374:28]
  wire  _GEN_145 = cam_wen[2] ? 1'h0 : _GEN_143; // @[dec_decode_ctl.scala 374:28]
  wire [2:0] cam_in_2_bits_tag = cam_wen[2] ? {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m} : _GEN_142; // @[dec_decode_ctl.scala 374:28]
  wire [4:0] cam_in_2_bits_rd = cam_wen[2] ? nonblock_load_rd : _GEN_141; // @[dec_decode_ctl.scala 374:28]
  wire  _T_221 = nonblock_load_valid_m_delay & _T_202; // @[dec_decode_ctl.scala 384:44]
  wire  _T_223 = _T_221 & cam_2_valid; // @[dec_decode_ctl.scala 384:113]
  wire  cam_in_2_bits_wb = _T_223 | _GEN_145; // @[dec_decode_ctl.scala 384:135]
  wire  cam_in_2_valid = io_dec_tlu_force_halt ? 1'h0 : _GEN_144; // @[dec_decode_ctl.scala 388:32]
  wire [8:0] _T_226 = {cam_in_2_bits_wb,cam_in_2_bits_tag,cam_in_2_bits_rd}; // @[lib.scala 494:61]
  wire [8:0] _T_228 = {cam_raw_2_bits_wb,cam_raw_2_bits_tag,cam_raw_2_bits_rd}; // @[lib.scala 494:74]
  wire [8:0] _T_229 = _T_226 ^ _T_228; // @[lib.scala 494:68]
  wire  _T_230 = |_T_229; // @[lib.scala 494:82]
  wire  _T_231 = cam_in_2_valid ^ cam_raw_2_valid; // @[lib.scala 494:68]
  wire  _T_232 = |_T_231; // @[lib.scala 494:82]
  wire  _T_233 = _T_230 | _T_232; // @[lib.scala 494:97]
  wire  nonblock_load_write_2 = _T_205 & cam_raw_2_valid; // @[dec_decode_ctl.scala 393:71]
  wire  _T_238 = _GEN_263 == cam_raw_3_bits_tag; // @[dec_decode_ctl.scala 366:66]
  wire  _T_239 = io_dctl_busbuff_lsu_nonblock_load_inv_r & _T_238; // @[dec_decode_ctl.scala 366:45]
  wire  cam_inv_reset_val_3 = _T_239 & cam_3_valid; // @[dec_decode_ctl.scala 366:87]
  reg [4:0] cam_raw_3_bits_rd; // @[Reg.scala 27:20]
  wire  _T_250 = r_d_bits_i0rd == cam_raw_3_bits_rd; // @[dec_decode_ctl.scala 379:85]
  wire  _T_251 = i0_wen_r & _T_250; // @[dec_decode_ctl.scala 379:64]
  reg  cam_raw_3_bits_wb; // @[Reg.scala 27:20]
  wire  _T_253 = _T_251 & cam_raw_3_bits_wb; // @[dec_decode_ctl.scala 379:105]
  wire  _T_254 = cam_inv_reset_val_3 | _T_253; // @[dec_decode_ctl.scala 379:44]
  wire  _GEN_155 = _T_254 ? 1'h0 : cam_3_valid; // @[dec_decode_ctl.scala 379:131]
  wire [4:0] _GEN_156 = _T_254 ? 5'h0 : cam_raw_3_bits_rd; // @[dec_decode_ctl.scala 379:131]
  wire [2:0] _GEN_157 = _T_254 ? 3'h0 : cam_raw_3_bits_tag; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_158 = _T_254 ? 1'h0 : cam_raw_3_bits_wb; // @[dec_decode_ctl.scala 379:131]
  wire  _GEN_159 = cam_wen[3] | _GEN_155; // @[dec_decode_ctl.scala 374:28]
  wire  _GEN_160 = cam_wen[3] ? 1'h0 : _GEN_158; // @[dec_decode_ctl.scala 374:28]
  wire [2:0] cam_in_3_bits_tag = cam_wen[3] ? {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m} : _GEN_157; // @[dec_decode_ctl.scala 374:28]
  wire [4:0] cam_in_3_bits_rd = cam_wen[3] ? nonblock_load_rd : _GEN_156; // @[dec_decode_ctl.scala 374:28]
  wire  _T_257 = nonblock_load_valid_m_delay & _T_238; // @[dec_decode_ctl.scala 384:44]
  wire  _T_259 = _T_257 & cam_3_valid; // @[dec_decode_ctl.scala 384:113]
  wire  cam_in_3_bits_wb = _T_259 | _GEN_160; // @[dec_decode_ctl.scala 384:135]
  wire  cam_in_3_valid = io_dec_tlu_force_halt ? 1'h0 : _GEN_159; // @[dec_decode_ctl.scala 388:32]
  wire [8:0] _T_262 = {cam_in_3_bits_wb,cam_in_3_bits_tag,cam_in_3_bits_rd}; // @[lib.scala 494:61]
  wire [8:0] _T_264 = {cam_raw_3_bits_wb,cam_raw_3_bits_tag,cam_raw_3_bits_rd}; // @[lib.scala 494:74]
  wire [8:0] _T_265 = _T_262 ^ _T_264; // @[lib.scala 494:68]
  wire  _T_266 = |_T_265; // @[lib.scala 494:82]
  wire  _T_267 = cam_in_3_valid ^ cam_raw_3_valid; // @[lib.scala 494:68]
  wire  _T_268 = |_T_267; // @[lib.scala 494:82]
  wire  _T_269 = _T_266 | _T_268; // @[lib.scala 494:97]
  wire  nonblock_load_write_3 = _T_241 & cam_raw_3_valid; // @[dec_decode_ctl.scala 393:71]
  wire  _T_274 = r_d_bits_i0rd == io_dec_nonblock_load_waddr; // @[dec_decode_ctl.scala 398:49]
  wire  nonblock_load_cancel = _T_274 & i0_wen_r; // @[dec_decode_ctl.scala 398:81]
  wire  _T_275 = nonblock_load_write_0 | nonblock_load_write_1; // @[dec_decode_ctl.scala 399:108]
  wire  _T_276 = _T_275 | nonblock_load_write_2; // @[dec_decode_ctl.scala 399:108]
  wire  _T_277 = _T_276 | nonblock_load_write_3; // @[dec_decode_ctl.scala 399:108]
  wire  _T_279 = io_dctl_busbuff_lsu_nonblock_load_data_valid & _T_277; // @[dec_decode_ctl.scala 399:77]
  wire  _T_280 = ~nonblock_load_cancel; // @[dec_decode_ctl.scala 399:122]
  wire  _T_282 = nonblock_load_rd == i0r_rs1; // @[dec_decode_ctl.scala 400:54]
  wire  _T_283 = _T_282 & io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[dec_decode_ctl.scala 400:66]
  wire  _T_284 = _T_283 & io_decode_exu_dec_i0_rs1_en_d; // @[dec_decode_ctl.scala 400:110]
  wire [4:0] i0r_rs2 = io_dec_i0_instr_d[24:20]; // @[dec_decode_ctl.scala 677:16]
  wire  _T_285 = nonblock_load_rd == i0r_rs2; // @[dec_decode_ctl.scala 400:161]
  wire  _T_286 = _T_285 & io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[dec_decode_ctl.scala 400:173]
  wire  _T_287 = _T_286 & io_decode_exu_dec_i0_rs2_en_d; // @[dec_decode_ctl.scala 400:217]
  wire  i0_nonblock_boundary_stall = _T_284 | _T_287; // @[dec_decode_ctl.scala 400:142]
  wire [4:0] _T_289 = nonblock_load_write_0 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_290 = _T_289 & cam_raw_0_bits_rd; // @[dec_decode_ctl.scala 404:88]
  wire  _T_291 = io_decode_exu_dec_i0_rs1_en_d & cam_0_valid; // @[dec_decode_ctl.scala 404:137]
  wire  _T_292 = cam_raw_0_bits_rd == i0r_rs1; // @[dec_decode_ctl.scala 404:170]
  wire  _T_293 = _T_291 & _T_292; // @[dec_decode_ctl.scala 404:152]
  wire  _T_294 = io_decode_exu_dec_i0_rs2_en_d & cam_0_valid; // @[dec_decode_ctl.scala 404:214]
  wire  _T_295 = cam_raw_0_bits_rd == i0r_rs2; // @[dec_decode_ctl.scala 404:247]
  wire  _T_296 = _T_294 & _T_295; // @[dec_decode_ctl.scala 404:229]
  wire [4:0] _T_298 = nonblock_load_write_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_299 = _T_298 & cam_raw_1_bits_rd; // @[dec_decode_ctl.scala 404:88]
  wire  _T_300 = io_decode_exu_dec_i0_rs1_en_d & cam_1_valid; // @[dec_decode_ctl.scala 404:137]
  wire  _T_301 = cam_raw_1_bits_rd == i0r_rs1; // @[dec_decode_ctl.scala 404:170]
  wire  _T_302 = _T_300 & _T_301; // @[dec_decode_ctl.scala 404:152]
  wire  _T_303 = io_decode_exu_dec_i0_rs2_en_d & cam_1_valid; // @[dec_decode_ctl.scala 404:214]
  wire  _T_304 = cam_raw_1_bits_rd == i0r_rs2; // @[dec_decode_ctl.scala 404:247]
  wire  _T_305 = _T_303 & _T_304; // @[dec_decode_ctl.scala 404:229]
  wire [4:0] _T_307 = nonblock_load_write_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_308 = _T_307 & cam_raw_2_bits_rd; // @[dec_decode_ctl.scala 404:88]
  wire  _T_309 = io_decode_exu_dec_i0_rs1_en_d & cam_2_valid; // @[dec_decode_ctl.scala 404:137]
  wire  _T_310 = cam_raw_2_bits_rd == i0r_rs1; // @[dec_decode_ctl.scala 404:170]
  wire  _T_311 = _T_309 & _T_310; // @[dec_decode_ctl.scala 404:152]
  wire  _T_312 = io_decode_exu_dec_i0_rs2_en_d & cam_2_valid; // @[dec_decode_ctl.scala 404:214]
  wire  _T_313 = cam_raw_2_bits_rd == i0r_rs2; // @[dec_decode_ctl.scala 404:247]
  wire  _T_314 = _T_312 & _T_313; // @[dec_decode_ctl.scala 404:229]
  wire [4:0] _T_316 = nonblock_load_write_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_317 = _T_316 & cam_raw_3_bits_rd; // @[dec_decode_ctl.scala 404:88]
  wire  _T_318 = io_decode_exu_dec_i0_rs1_en_d & cam_3_valid; // @[dec_decode_ctl.scala 404:137]
  wire  _T_319 = cam_raw_3_bits_rd == i0r_rs1; // @[dec_decode_ctl.scala 404:170]
  wire  _T_320 = _T_318 & _T_319; // @[dec_decode_ctl.scala 404:152]
  wire  _T_321 = io_decode_exu_dec_i0_rs2_en_d & cam_3_valid; // @[dec_decode_ctl.scala 404:214]
  wire  _T_322 = cam_raw_3_bits_rd == i0r_rs2; // @[dec_decode_ctl.scala 404:247]
  wire  _T_323 = _T_321 & _T_322; // @[dec_decode_ctl.scala 404:229]
  wire [4:0] _T_324 = _T_290 | _T_299; // @[dec_decode_ctl.scala 405:69]
  wire [4:0] _T_325 = _T_324 | _T_308; // @[dec_decode_ctl.scala 405:69]
  wire  _T_326 = _T_293 | _T_302; // @[dec_decode_ctl.scala 405:102]
  wire  _T_327 = _T_326 | _T_311; // @[dec_decode_ctl.scala 405:102]
  wire  ld_stall_1 = _T_327 | _T_320; // @[dec_decode_ctl.scala 405:102]
  wire  _T_328 = _T_296 | _T_305; // @[dec_decode_ctl.scala 405:134]
  wire  _T_329 = _T_328 | _T_314; // @[dec_decode_ctl.scala 405:134]
  wire  ld_stall_2 = _T_329 | _T_323; // @[dec_decode_ctl.scala 405:134]
  wire  _T_330 = ld_stall_1 | ld_stall_2; // @[dec_decode_ctl.scala 407:38]
  wire  i0_nonblock_load_stall = _T_330 | i0_nonblock_boundary_stall; // @[dec_decode_ctl.scala 407:51]
  wire  _T_332 = ~i0_predict_br; // @[dec_decode_ctl.scala 416:34]
  wire  i0_br_unpred = i0_dp_jal & _T_332; // @[dec_decode_ctl.scala 416:32]
  wire [3:0] _T_334 = i0_legal_decode_d ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire  csr_read = i0_dp_csr_read & i0_legal_decode_d; // @[dec_decode_ctl.scala 517:36]
  wire  _T_335 = csr_read & io_dec_csr_wen_unq_d; // @[dec_decode_ctl.scala 428:16]
  wire  _T_337 = ~csr_read; // @[dec_decode_ctl.scala 429:6]
  wire  _T_338 = _T_337 & io_dec_csr_wen_unq_d; // @[dec_decode_ctl.scala 429:16]
  wire  _T_340 = ~io_dec_csr_wen_unq_d; // @[dec_decode_ctl.scala 430:18]
  wire  _T_341 = csr_read & _T_340; // @[dec_decode_ctl.scala 430:16]
  wire  _T_343 = i0_dp_zbb | i0_dp_zbs; // @[dec_decode_ctl.scala 431:16]
  wire  _T_344 = _T_343 | i0_dp_zbe; // @[dec_decode_ctl.scala 431:28]
  wire  _T_345 = _T_344 | i0_dp_zbc; // @[dec_decode_ctl.scala 431:40]
  wire  _T_346 = _T_345 | i0_dp_zbp; // @[dec_decode_ctl.scala 431:52]
  wire  _T_347 = _T_346 | i0_dp_zbr; // @[dec_decode_ctl.scala 431:65]
  wire  _T_348 = _T_347 | i0_dp_zbf; // @[dec_decode_ctl.scala 431:77]
  wire  _T_349 = _T_348 | i0_dp_zba; // @[dec_decode_ctl.scala 431:89]
  wire [3:0] _T_350 = i0_dp_mul ? 4'h1 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _T_351 = i0_dp_load ? 4'h2 : _T_350; // @[Mux.scala 98:16]
  wire [3:0] _T_352 = i0_dp_store ? 4'h3 : _T_351; // @[Mux.scala 98:16]
  wire [3:0] _T_353 = i0_dp_pm_alu ? 4'h4 : _T_352; // @[Mux.scala 98:16]
  wire [3:0] _T_354 = _T_349 ? 4'hf : _T_353; // @[Mux.scala 98:16]
  wire [3:0] _T_355 = _T_341 ? 4'h5 : _T_354; // @[Mux.scala 98:16]
  wire [3:0] _T_356 = _T_338 ? 4'h6 : _T_355; // @[Mux.scala 98:16]
  wire [3:0] _T_357 = _T_335 ? 4'h7 : _T_356; // @[Mux.scala 98:16]
  wire [3:0] _T_358 = i0_dp_ebreak ? 4'h8 : _T_357; // @[Mux.scala 98:16]
  wire [3:0] _T_359 = i0_dp_ecall ? 4'h9 : _T_358; // @[Mux.scala 98:16]
  wire [3:0] _T_360 = i0_dp_fence ? 4'ha : _T_359; // @[Mux.scala 98:16]
  wire [3:0] _T_361 = i0_dp_fence_i ? 4'hb : _T_360; // @[Mux.scala 98:16]
  wire [3:0] _T_362 = i0_dp_mret ? 4'hc : _T_361; // @[Mux.scala 98:16]
  wire [3:0] _T_363 = i0_dp_condbr ? 4'hd : _T_362; // @[Mux.scala 98:16]
  wire [3:0] _T_364 = i0_dp_jal ? 4'he : _T_363; // @[Mux.scala 98:16]
  wire [3:0] d_t_pmu_i0_itype = _T_334 & _T_364; // @[dec_decode_ctl.scala 420:49]
  reg  lsu_idle; // @[dec_decode_ctl.scala 442:45]
  wire  _T_418 = ~i0_pcall_case; // @[dec_decode_ctl.scala 464:35]
  wire  _T_419 = i0_dp_jal & _T_418; // @[dec_decode_ctl.scala 464:32]
  wire  _T_420 = ~i0_pja_case; // @[dec_decode_ctl.scala 464:52]
  wire  _T_421 = _T_419 & _T_420; // @[dec_decode_ctl.scala 464:50]
  wire  _T_422 = ~i0_pret_case; // @[dec_decode_ctl.scala 464:67]
  wire  _T_425 = i0r_rs1 == 5'h2; // @[dec_decode_ctl.scala 508:41]
  wire  lsu_decode_d = i0_legal_decode_d & i0_dp_lsu; // @[dec_decode_ctl.scala 633:40]
  wire  _T_1018 = i0_dp_load | i0_dp_store; // @[dec_decode_ctl.scala 901:43]
  reg  x_d_bits_i0v; // @[Reg.scala 27:20]
  wire  _T_992 = io_decode_exu_dec_i0_rs1_en_d & x_d_bits_i0v; // @[dec_decode_ctl.scala 881:59]
  wire  _T_993 = x_d_bits_i0rd == i0r_rs1; // @[dec_decode_ctl.scala 881:91]
  wire  i0_rs1_depend_i0_x = _T_992 & _T_993; // @[dec_decode_ctl.scala 881:74]
  wire  _T_994 = io_decode_exu_dec_i0_rs1_en_d & r_d_bits_i0v; // @[dec_decode_ctl.scala 882:59]
  wire  _T_995 = r_d_bits_i0rd == i0r_rs1; // @[dec_decode_ctl.scala 882:91]
  wire  i0_rs1_depend_i0_r = _T_994 & _T_995; // @[dec_decode_ctl.scala 882:74]
  wire [1:0] _T_1007 = i0_rs1_depend_i0_r ? 2'h2 : 2'h0; // @[dec_decode_ctl.scala 888:63]
  wire [1:0] i0_rs1_depth_d = i0_rs1_depend_i0_x ? 2'h1 : _T_1007; // @[dec_decode_ctl.scala 888:24]
  wire  _T_1020 = _T_1018 & i0_rs1_depth_d[0]; // @[dec_decode_ctl.scala 901:58]
  reg  i0_x_c_load; // @[Reg.scala 27:20]
  reg  i0_r_c_load; // @[Reg.scala 27:20]
  wire  _T_1003_load = i0_rs1_depend_i0_r & i0_r_c_load; // @[dec_decode_ctl.scala 887:61]
  wire  i0_rs1_class_d_load = i0_rs1_depend_i0_x ? i0_x_c_load : _T_1003_load; // @[dec_decode_ctl.scala 887:24]
  wire  load_ldst_bypass_d = _T_1020 & i0_rs1_class_d_load; // @[dec_decode_ctl.scala 901:78]
  wire  _T_996 = io_decode_exu_dec_i0_rs2_en_d & x_d_bits_i0v; // @[dec_decode_ctl.scala 884:59]
  wire  _T_997 = x_d_bits_i0rd == i0r_rs2; // @[dec_decode_ctl.scala 884:91]
  wire  i0_rs2_depend_i0_x = _T_996 & _T_997; // @[dec_decode_ctl.scala 884:74]
  wire  _T_998 = io_decode_exu_dec_i0_rs2_en_d & r_d_bits_i0v; // @[dec_decode_ctl.scala 885:59]
  wire  _T_999 = r_d_bits_i0rd == i0r_rs2; // @[dec_decode_ctl.scala 885:91]
  wire  i0_rs2_depend_i0_r = _T_998 & _T_999; // @[dec_decode_ctl.scala 885:74]
  wire [1:0] _T_1016 = i0_rs2_depend_i0_r ? 2'h2 : 2'h0; // @[dec_decode_ctl.scala 890:63]
  wire [1:0] i0_rs2_depth_d = i0_rs2_depend_i0_x ? 2'h1 : _T_1016; // @[dec_decode_ctl.scala 890:24]
  wire  _T_1023 = i0_dp_store & i0_rs2_depth_d[0]; // @[dec_decode_ctl.scala 902:43]
  wire  _T_1012_load = i0_rs2_depend_i0_r & i0_r_c_load; // @[dec_decode_ctl.scala 889:61]
  wire  i0_rs2_class_d_load = i0_rs2_depend_i0_x ? i0_x_c_load : _T_1012_load; // @[dec_decode_ctl.scala 889:24]
  wire  store_data_bypass_d = _T_1023 & i0_rs2_class_d_load; // @[dec_decode_ctl.scala 902:63]
  wire  _T_435 = i0_dp_csr_clr | i0_dp_csr_set; // @[dec_decode_ctl.scala 525:42]
  wire  _T_436 = _T_435 | i0_csr_write; // @[dec_decode_ctl.scala 525:58]
  wire [11:0] _T_440 = io_dec_csr_any_unq_d ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  reg  r_d_bits_csrwen; // @[Reg.scala 27:20]
  wire  _T_443 = r_d_bits_csrwen & r_d_valid; // @[dec_decode_ctl.scala 530:53]
  wire [11:0] _T_445 = _T_443 ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  reg [11:0] r_d_bits_csrwaddr; // @[Reg.scala 27:20]
  wire  _T_450 = r_d_bits_csrwaddr == 12'h300; // @[dec_decode_ctl.scala 537:50]
  wire  _T_451 = r_d_bits_csrwaddr == 12'h304; // @[dec_decode_ctl.scala 537:85]
  wire  _T_452 = _T_450 | _T_451; // @[dec_decode_ctl.scala 537:64]
  wire  _T_453 = _T_452 & r_d_bits_csrwen; // @[dec_decode_ctl.scala 537:100]
  wire  _T_454 = _T_453 & r_d_valid; // @[dec_decode_ctl.scala 537:118]
  wire  _T_455 = ~io_dec_tlu_i0_kill_writeb_wb; // @[dec_decode_ctl.scala 537:132]
  reg  csr_read_x; // @[dec_decode_ctl.scala 539:52]
  reg  csr_clr_x; // @[dec_decode_ctl.scala 540:51]
  reg  csr_set_x; // @[dec_decode_ctl.scala 541:51]
  reg  csr_write_x; // @[dec_decode_ctl.scala 542:53]
  reg  csr_imm_x; // @[dec_decode_ctl.scala 543:51]
  wire  i0_x_data_en = i0_pipe_en[3] | io_clk_override; // @[dec_decode_ctl.scala 769:50]
  wire  _T_459 = i0_x_data_en & any_csr_d; // @[dec_decode_ctl.scala 546:48]
  reg [4:0] csrimm_x; // @[Reg.scala 27:20]
  reg [31:0] csr_rddata_x; // @[Reg.scala 27:20]
  wire [31:0] _T_493 = {27'h0,csrimm_x}; // @[Cat.scala 29:58]
  wire  _T_495 = ~csr_imm_x; // @[dec_decode_ctl.scala 551:5]
  wire [31:0] _T_496 = csr_imm_x ? _T_493 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_497 = _T_495 ? io_decode_exu_exu_csr_rs1_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] csr_mask_x = _T_496 | _T_497; // @[Mux.scala 27:72]
  wire [31:0] _T_499 = ~csr_mask_x; // @[dec_decode_ctl.scala 554:38]
  wire [31:0] _T_500 = csr_rddata_x & _T_499; // @[dec_decode_ctl.scala 554:35]
  wire [31:0] _T_501 = csr_rddata_x | csr_mask_x; // @[dec_decode_ctl.scala 555:35]
  wire [31:0] _T_502 = csr_clr_x ? _T_500 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_503 = csr_set_x ? _T_501 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_504 = csr_write_x ? csr_mask_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_505 = _T_502 | _T_503; // @[Mux.scala 27:72]
  wire [31:0] write_csr_data_x = _T_505 | _T_504; // @[Mux.scala 27:72]
  wire  _T_517 = ~tlu_wr_pause_r1; // @[dec_decode_ctl.scala 562:44]
  wire  _T_518 = ~tlu_wr_pause_r2; // @[dec_decode_ctl.scala 562:64]
  wire  _T_519 = _T_517 & _T_518; // @[dec_decode_ctl.scala 562:61]
  wire [31:0] _T_522 = write_csr_data - 32'h1; // @[dec_decode_ctl.scala 565:59]
  wire  _T_524 = csr_clr_x | csr_set_x; // @[dec_decode_ctl.scala 567:34]
  wire  _T_525 = _T_524 | csr_write_x; // @[dec_decode_ctl.scala 567:46]
  wire  _T_526 = _T_525 & csr_read_x; // @[dec_decode_ctl.scala 567:61]
  wire  _T_527 = _T_526 | io_dec_tlu_wr_pause_r; // @[dec_decode_ctl.scala 567:75]
  wire  csr_data_wen = _T_527 | pause_stall; // @[dec_decode_ctl.scala 567:99]
  reg  r_d_bits_csrwonly; // @[Reg.scala 27:20]
  wire  _T_529 = r_d_bits_csrwonly & r_d_valid; // @[dec_decode_ctl.scala 574:50]
  wire  _T_881 = r_d_bits_i0v & r_d_bits_i0load; // @[dec_decode_ctl.scala 822:42]
  reg [31:0] i0_result_r_raw; // @[Reg.scala 27:20]
  wire [31:0] i0_result_corr_r = _T_881 ? io_lsu_result_corr_r : i0_result_r_raw; // @[dec_decode_ctl.scala 822:27]
  reg  x_d_bits_csrwonly; // @[Reg.scala 27:20]
  wire  _T_532 = x_d_bits_csrwonly | r_d_bits_csrwonly; // @[dec_decode_ctl.scala 576:43]
  reg  wbd_bits_csrwonly; // @[Reg.scala 27:20]
  wire  prior_csr_write = _T_532 | wbd_bits_csrwonly; // @[dec_decode_ctl.scala 576:63]
  wire  debug_fence_raw = io_dec_debug_fence_d & io_dbg_dctl_dbg_cmd_wrdata[1]; // @[dec_decode_ctl.scala 579:48]
  wire  debug_fence = debug_fence_raw | debug_fence_i; // @[dec_decode_ctl.scala 580:40]
  wire  _T_536 = i0_dp_presync | io_dec_tlu_presync_d; // @[dec_decode_ctl.scala 583:34]
  wire  _T_537 = _T_536 | debug_fence_i; // @[dec_decode_ctl.scala 583:57]
  wire  _T_538 = _T_537 | debug_fence_raw; // @[dec_decode_ctl.scala 583:73]
  wire  i0_presync = _T_538 | io_dec_tlu_pipelining_disable; // @[dec_decode_ctl.scala 583:91]
  wire [31:0] _T_562 = {16'h0,io_dec_aln_ifu_i0_cinst}; // @[Cat.scala 29:58]
  wire  _T_564 = ~illegal_lockout; // @[dec_decode_ctl.scala 595:44]
  wire  illegal_inst_en = shift_illegal & _T_564; // @[dec_decode_ctl.scala 595:42]
  reg [31:0] _T_565; // @[Reg.scala 27:20]
  wire  i0_div_prior_div_stall = i0_dp_div & io_dec_div_active; // @[dec_decode_ctl.scala 598:42]
  wire  _T_569 = i0_dp_csr_read & prior_csr_write; // @[dec_decode_ctl.scala 600:40]
  wire  _T_570 = _T_569 | io_decode_exu_dec_extint_stall; // @[dec_decode_ctl.scala 600:59]
  wire  _T_571 = _T_570 | pause_stall; // @[dec_decode_ctl.scala 600:92]
  wire  _T_572 = _T_571 | leak1_i0_stall; // @[dec_decode_ctl.scala 600:106]
  wire  _T_573 = _T_572 | io_dec_tlu_debug_stall; // @[dec_decode_ctl.scala 601:20]
  wire  _T_574 = _T_573 | postsync_stall; // @[dec_decode_ctl.scala 601:45]
  wire  prior_inflight = x_d_valid | r_d_valid; // @[dec_decode_ctl.scala 623:41]
  wire  prior_inflight_eff = i0_dp_div ? x_d_valid : prior_inflight; // @[dec_decode_ctl.scala 624:31]
  wire  presync_stall = i0_presync & prior_inflight_eff; // @[dec_decode_ctl.scala 626:37]
  wire  _T_575 = _T_574 | presync_stall; // @[dec_decode_ctl.scala 601:62]
  wire  _T_576 = i0_dp_fence | debug_fence; // @[dec_decode_ctl.scala 602:19]
  wire  _T_577 = ~lsu_idle; // @[dec_decode_ctl.scala 602:36]
  wire  _T_578 = _T_576 & _T_577; // @[dec_decode_ctl.scala 602:34]
  wire  _T_579 = _T_575 | _T_578; // @[dec_decode_ctl.scala 601:79]
  wire  _T_580 = _T_579 | i0_nonblock_load_stall; // @[dec_decode_ctl.scala 602:47]
  wire  _T_939 = io_decode_exu_dec_i0_rs1_en_d & io_dec_div_active; // @[dec_decode_ctl.scala 850:60]
  wire  _T_940 = io_div_waddr_wb == i0r_rs1; // @[dec_decode_ctl.scala 850:99]
  wire  _T_941 = _T_939 & _T_940; // @[dec_decode_ctl.scala 850:80]
  wire  _T_942 = io_decode_exu_dec_i0_rs2_en_d & io_dec_div_active; // @[dec_decode_ctl.scala 851:36]
  wire  _T_943 = io_div_waddr_wb == i0r_rs2; // @[dec_decode_ctl.scala 851:75]
  wire  _T_944 = _T_942 & _T_943; // @[dec_decode_ctl.scala 851:56]
  wire  i0_nonblock_div_stall = _T_941 | _T_944; // @[dec_decode_ctl.scala 850:113]
  wire  _T_582 = _T_580 | i0_nonblock_div_stall; // @[dec_decode_ctl.scala 603:21]
  wire  i0_block_raw_d = _T_582 | i0_div_prior_div_stall; // @[dec_decode_ctl.scala 603:45]
  wire  _T_583 = io_lsu_store_stall_any | io_dctl_dma_dma_dccm_stall_any; // @[dec_decode_ctl.scala 605:65]
  wire  i0_store_stall_d = i0_dp_store & _T_583; // @[dec_decode_ctl.scala 605:39]
  wire  _T_584 = io_lsu_load_stall_any | io_dctl_dma_dma_dccm_stall_any; // @[dec_decode_ctl.scala 606:63]
  wire  i0_load_stall_d = i0_dp_load & _T_584; // @[dec_decode_ctl.scala 606:38]
  wire  _T_585 = i0_block_raw_d | i0_store_stall_d; // @[dec_decode_ctl.scala 607:38]
  wire  i0_block_d = _T_585 | i0_load_stall_d; // @[dec_decode_ctl.scala 607:57]
  wire  _T_586 = ~i0_block_d; // @[dec_decode_ctl.scala 611:54]
  wire  _T_587 = io_dec_ib0_valid_d & _T_586; // @[dec_decode_ctl.scala 611:52]
  wire  _T_589 = _T_587 & _T_367; // @[dec_decode_ctl.scala 611:69]
  wire  _T_592 = ~i0_block_raw_d; // @[dec_decode_ctl.scala 612:46]
  wire  _T_593 = io_dec_ib0_valid_d & _T_592; // @[dec_decode_ctl.scala 612:44]
  wire  _T_595 = _T_593 & _T_367; // @[dec_decode_ctl.scala 612:61]
  wire  i0_exudecode_d = _T_595 & _T_567; // @[dec_decode_ctl.scala 612:89]
  wire  i0_exulegal_decode_d = i0_exudecode_d & i0_legal; // @[dec_decode_ctl.scala 613:46]
  wire  _T_597 = ~io_dec_aln_dec_i0_decode_d; // @[dec_decode_ctl.scala 617:51]
  wire  _T_610 = i0_dp_condbr | i0_dp_jal; // @[dec_decode_ctl.scala 631:53]
  wire  d_t_icaf = i0_icaf_d & i0_legal_decode_d; // @[dec_decode_ctl.scala 641:40]
  wire  d_t_icaf_second = io_dec_i0_icaf_second_d & i0_legal_decode_d; // @[dec_decode_ctl.scala 642:58]
  wire  _T_619 = i0_dp_fence_i | debug_fence_i; // @[dec_decode_ctl.scala 645:44]
  wire  d_t_fence_i = _T_619 & i0_legal_decode_d; // @[dec_decode_ctl.scala 645:61]
  wire [3:0] _T_624 = {io_dec_aln_dec_i0_decode_d,io_dec_aln_dec_i0_decode_d,io_dec_aln_dec_i0_decode_d,io_dec_aln_dec_i0_decode_d}; // @[Cat.scala 29:58]
  wire [3:0] d_t_i0trigger = io_dec_i0_trigger_match_d & _T_624; // @[dec_decode_ctl.scala 652:56]
  wire  _T_818 = |i0_pipe_en[3:2]; // @[dec_decode_ctl.scala 766:49]
  wire  i0_x_ctl_en = _T_818 | io_clk_override; // @[dec_decode_ctl.scala 766:53]
  reg  x_t_legal; // @[Reg.scala 27:20]
  reg  x_t_icaf; // @[Reg.scala 27:20]
  reg  x_t_icaf_second; // @[Reg.scala 27:20]
  reg [1:0] x_t_icaf_type; // @[Reg.scala 27:20]
  reg  x_t_fence_i; // @[Reg.scala 27:20]
  reg [3:0] x_t_i0trigger; // @[Reg.scala 27:20]
  reg [3:0] x_t_pmu_i0_itype; // @[Reg.scala 27:20]
  reg  x_t_pmu_i0_br_unpred; // @[Reg.scala 27:20]
  wire [3:0] _T_632 = {io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb,io_dec_tlu_flush_lower_wb}; // @[Cat.scala 29:58]
  wire [3:0] _T_633 = ~_T_632; // @[dec_decode_ctl.scala 658:39]
  wire [3:0] x_t_in_i0trigger = x_t_i0trigger & _T_633; // @[dec_decode_ctl.scala 658:37]
  reg  r_t_legal; // @[Reg.scala 27:20]
  reg  r_t_icaf; // @[Reg.scala 27:20]
  reg  r_t_icaf_second; // @[Reg.scala 27:20]
  reg [1:0] r_t_icaf_type; // @[Reg.scala 27:20]
  reg  r_t_fence_i; // @[Reg.scala 27:20]
  reg [3:0] r_t_i0trigger; // @[Reg.scala 27:20]
  reg [3:0] r_t_pmu_i0_itype; // @[Reg.scala 27:20]
  reg  r_t_pmu_i0_br_unpred; // @[Reg.scala 27:20]
  reg  r_d_bits_i0store; // @[Reg.scala 27:20]
  wire  _T_638 = r_d_bits_i0load | r_d_bits_i0store; // @[dec_decode_ctl.scala 664:61]
  wire [3:0] _T_642 = {_T_638,_T_638,_T_638,_T_638}; // @[Cat.scala 29:58]
  wire [3:0] _T_643 = _T_642 & lsu_trigger_match_r; // @[dec_decode_ctl.scala 664:82]
  wire [3:0] _T_644 = _T_643 | r_t_i0trigger; // @[dec_decode_ctl.scala 664:105]
  wire  _T_657 = i0r_rs1 != 5'h0; // @[dec_decode_ctl.scala 680:60]
  wire  _T_659 = i0r_rs2 != 5'h0; // @[dec_decode_ctl.scala 681:60]
  wire  _T_661 = i0r_rd != 5'h0; // @[dec_decode_ctl.scala 682:48]
  wire  i0_rd_en_d = i0_dp_rd & _T_661; // @[dec_decode_ctl.scala 682:37]
  wire  i0_jalimm20 = i0_dp_jal & i0_dp_imm20; // @[dec_decode_ctl.scala 686:38]
  wire  _T_662 = ~i0_dp_jal; // @[dec_decode_ctl.scala 687:27]
  wire  i0_uiimm20 = _T_662 & i0_dp_imm20; // @[dec_decode_ctl.scala 687:38]
  wire [9:0] _T_673 = {io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31]}; // @[Cat.scala 29:58]
  wire [18:0] _T_682 = {_T_673,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[31]}; // @[Cat.scala 29:58]
  wire [31:0] _T_685 = {_T_682,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31:20]}; // @[Cat.scala 29:58]
  wire [31:0] _T_714 = {27'h0,i0r_rs2}; // @[Cat.scala 29:58]
  wire [31:0] _T_734 = {_T_673,io_dec_i0_instr_d[31],io_dec_i0_instr_d[31],io_dec_i0_instr_d[19:12],io_dec_i0_instr_d[20],io_dec_i0_instr_d[30:21],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_748 = {io_dec_i0_instr_d[31:12],12'h0}; // @[Cat.scala 29:58]
  wire  _T_749 = i0_csr_write_only_d & i0_dp_csr_imm; // @[dec_decode_ctl.scala 698:26]
  wire [31:0] _T_779 = {27'h0,i0r_rs1}; // @[Cat.scala 29:58]
  wire [31:0] _T_780 = i0_dp_imm12 ? _T_685 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_781 = i0_dp_shimm5 ? _T_714 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_782 = i0_jalimm20 ? _T_734 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_783 = i0_uiimm20 ? _T_748 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_784 = _T_749 ? _T_779 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_785 = _T_780 | _T_781; // @[Mux.scala 27:72]
  wire [31:0] _T_786 = _T_785 | _T_782; // @[Mux.scala 27:72]
  wire [31:0] _T_787 = _T_786 | _T_783; // @[Mux.scala 27:72]
  wire  i0_d_c_mul = i0_dp_mul & i0_legal_decode_d; // @[dec_decode_ctl.scala 758:44]
  wire  i0_d_c_load = i0_dp_load & i0_legal_decode_d; // @[dec_decode_ctl.scala 759:44]
  wire  i0_d_c_alu = i0_dp_alu & i0_legal_decode_d; // @[dec_decode_ctl.scala 760:44]
  reg  i0_x_c_mul; // @[Reg.scala 27:20]
  reg  i0_x_c_alu; // @[Reg.scala 27:20]
  reg  i0_r_c_mul; // @[Reg.scala 27:20]
  reg  i0_r_c_alu; // @[Reg.scala 27:20]
  wire  _T_824 = |i0_pipe_en[1:0]; // @[dec_decode_ctl.scala 768:49]
  wire  i0_wb_ctl_en = _T_824 | io_clk_override; // @[dec_decode_ctl.scala 768:53]
  wire  i0_r_data_en = i0_pipe_en[2] | io_clk_override; // @[dec_decode_ctl.scala 770:50]
  wire  i0_wb_data_en = i0_pipe_en[1] | io_clk_override; // @[dec_decode_ctl.scala 771:50]
  wire  d_d_bits_i0v = i0_rd_en_d & i0_legal_decode_d; // @[dec_decode_ctl.scala 777:50]
  wire  d_d_bits_i0store = i0_dp_store & i0_legal_decode_d; // @[dec_decode_ctl.scala 781:50]
  wire  d_d_bits_i0div = i0_dp_div & i0_legal_decode_d; // @[dec_decode_ctl.scala 782:50]
  wire  d_d_bits_csrwen = io_dec_csr_wen_unq_d & i0_legal_decode_d; // @[dec_decode_ctl.scala 784:61]
  wire  d_d_bits_csrwonly = i0_csr_write_only_d & io_dec_aln_dec_i0_decode_d; // @[dec_decode_ctl.scala 785:58]
  reg  x_d_bits_i0store; // @[Reg.scala 27:20]
  reg  x_d_bits_csrwen; // @[Reg.scala 27:20]
  reg [11:0] x_d_bits_csrwaddr; // @[Reg.scala 27:20]
  wire  _T_847 = x_d_bits_i0v & _T_857; // @[dec_decode_ctl.scala 791:47]
  wire  x_d_in_bits_i0v = _T_847 & _T_367; // @[dec_decode_ctl.scala 791:76]
  wire  _T_851 = x_d_valid & _T_857; // @[dec_decode_ctl.scala 792:33]
  wire  x_d_in_valid = _T_851 & _T_367; // @[dec_decode_ctl.scala 792:62]
  wire  _T_870 = ~r_d_bits_i0div; // @[dec_decode_ctl.scala 807:49]
  wire  _T_871 = i0_wen_r & _T_870; // @[dec_decode_ctl.scala 807:47]
  wire  _T_872 = ~i0_load_kill_wen_r; // @[dec_decode_ctl.scala 807:70]
  wire  _T_874 = x_d_bits_i0v | x_d_bits_csrwen; // @[dec_decode_ctl.scala 811:74]
  wire  _T_875 = _T_874 | debug_valid_x; // @[dec_decode_ctl.scala 811:92]
  wire  _T_876 = i0_r_data_en & _T_875; // @[dec_decode_ctl.scala 811:58]
  wire  _T_878 = x_d_bits_i0v & x_d_bits_i0load; // @[dec_decode_ctl.scala 817:47]
  wire  _T_885 = io_decode_exu_i0_ap_predict_nt & _T_662; // @[dec_decode_ctl.scala 823:71]
  wire [11:0] _T_898 = {10'h0,io_dec_i0_pc4_d,i0_ap_pc2}; // @[Cat.scala 29:58]
  reg [11:0] last_br_immed_x; // @[Reg.scala 27:20]
  wire  trace_enable = ~io_dec_tlu_trace_disable; // @[dec_decode_ctl.scala 858:22]
  reg [4:0] _T_947; // @[Reg.scala 27:20]
  wire  _T_948 = i0_x_data_en & trace_enable; // @[dec_decode_ctl.scala 862:50]
  reg [31:0] i0_inst_x; // @[Reg.scala 27:20]
  wire  _T_950 = i0_r_data_en & trace_enable; // @[dec_decode_ctl.scala 863:50]
  reg [31:0] i0_inst_r; // @[Reg.scala 27:20]
  wire  _T_952 = i0_wb_data_en & trace_enable; // @[dec_decode_ctl.scala 865:51]
  reg [31:0] i0_inst_wb; // @[Reg.scala 27:20]
  reg [30:0] i0_pc_wb; // @[Reg.scala 27:20]
  reg [30:0] dec_i0_pc_r; // @[Reg.scala 27:20]
  wire [31:0] _T_958 = {io_dec_alu_exu_i0_pc_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_959 = {last_br_immed_x,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_962 = _T_958[12:1] + _T_959[12:1]; // @[lib.scala 68:31]
  wire [18:0] _T_965 = _T_958[31:13] + 19'h1; // @[lib.scala 69:27]
  wire [18:0] _T_968 = _T_958[31:13] - 19'h1; // @[lib.scala 70:27]
  wire  _T_971 = ~_T_962[12]; // @[lib.scala 72:28]
  wire  _T_972 = _T_959[12] ^ _T_971; // @[lib.scala 72:26]
  wire  _T_975 = ~_T_959[12]; // @[lib.scala 73:20]
  wire  _T_977 = _T_975 & _T_962[12]; // @[lib.scala 73:26]
  wire  _T_981 = _T_959[12] & _T_971; // @[lib.scala 74:26]
  wire [18:0] _T_983 = _T_972 ? _T_958[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_984 = _T_977 ? _T_965 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_985 = _T_981 ? _T_968 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_986 = _T_983 | _T_984; // @[Mux.scala 27:72]
  wire [18:0] _T_987 = _T_986 | _T_985; // @[Mux.scala 27:72]
  wire [31:0] temp_pred_correct_npc_x = {_T_987,_T_962[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_1003_mul = i0_rs1_depend_i0_r & i0_r_c_mul; // @[dec_decode_ctl.scala 887:61]
  wire  _T_1003_alu = i0_rs1_depend_i0_r & i0_r_c_alu; // @[dec_decode_ctl.scala 887:61]
  wire  i0_rs1_class_d_mul = i0_rs1_depend_i0_x ? i0_x_c_mul : _T_1003_mul; // @[dec_decode_ctl.scala 887:24]
  wire  i0_rs1_class_d_alu = i0_rs1_depend_i0_x ? i0_x_c_alu : _T_1003_alu; // @[dec_decode_ctl.scala 887:24]
  wire  _T_1012_mul = i0_rs2_depend_i0_r & i0_r_c_mul; // @[dec_decode_ctl.scala 889:61]
  wire  _T_1012_alu = i0_rs2_depend_i0_r & i0_r_c_alu; // @[dec_decode_ctl.scala 889:61]
  wire  i0_rs2_class_d_mul = i0_rs2_depend_i0_x ? i0_x_c_mul : _T_1012_mul; // @[dec_decode_ctl.scala 889:24]
  wire  i0_rs2_class_d_alu = i0_rs2_depend_i0_x ? i0_x_c_alu : _T_1012_alu; // @[dec_decode_ctl.scala 889:24]
  wire  _T_1025 = io_decode_exu_dec_i0_rs1_en_d & io_dec_nonblock_load_wen; // @[dec_decode_ctl.scala 907:73]
  wire  _T_1026 = io_dec_nonblock_load_waddr == i0r_rs1; // @[dec_decode_ctl.scala 907:130]
  wire  i0_rs1_nonblock_load_bypass_en_d = _T_1025 & _T_1026; // @[dec_decode_ctl.scala 907:100]
  wire  _T_1027 = io_decode_exu_dec_i0_rs2_en_d & io_dec_nonblock_load_wen; // @[dec_decode_ctl.scala 909:73]
  wire  _T_1028 = io_dec_nonblock_load_waddr == i0r_rs2; // @[dec_decode_ctl.scala 909:130]
  wire  i0_rs2_nonblock_load_bypass_en_d = _T_1027 & _T_1028; // @[dec_decode_ctl.scala 909:100]
  wire  _T_1030 = i0_rs1_class_d_alu | i0_rs1_class_d_mul; // @[dec_decode_ctl.scala 912:66]
  wire  _T_1031 = i0_rs1_depth_d[0] & _T_1030; // @[dec_decode_ctl.scala 912:45]
  wire  _T_1033 = i0_rs1_depth_d[0] & i0_rs1_class_d_load; // @[dec_decode_ctl.scala 912:108]
  wire  _T_1036 = _T_1030 | i0_rs1_class_d_load; // @[dec_decode_ctl.scala 912:196]
  wire  _T_1037 = i0_rs1_depth_d[1] & _T_1036; // @[dec_decode_ctl.scala 912:153]
  wire [2:0] i0_rs1bypass = {_T_1031,_T_1033,_T_1037}; // @[Cat.scala 29:58]
  wire  _T_1041 = i0_rs2_class_d_alu | i0_rs2_class_d_mul; // @[dec_decode_ctl.scala 914:67]
  wire  _T_1042 = i0_rs2_depth_d[0] & _T_1041; // @[dec_decode_ctl.scala 914:45]
  wire  _T_1044 = i0_rs2_depth_d[0] & i0_rs2_class_d_load; // @[dec_decode_ctl.scala 914:109]
  wire  _T_1047 = _T_1041 | i0_rs2_class_d_load; // @[dec_decode_ctl.scala 914:196]
  wire  _T_1048 = i0_rs2_depth_d[1] & _T_1047; // @[dec_decode_ctl.scala 914:153]
  wire [2:0] i0_rs2bypass = {_T_1042,_T_1044,_T_1048}; // @[Cat.scala 29:58]
  wire  _T_1052 = ~i0_rs1bypass[0]; // @[dec_decode_ctl.scala 916:53]
  wire  _T_1054 = ~i0_rs1bypass[1]; // @[dec_decode_ctl.scala 916:72]
  wire  _T_1055 = _T_1052 & _T_1054; // @[dec_decode_ctl.scala 916:70]
  wire  _T_1057 = ~i0_rs1bypass[2]; // @[dec_decode_ctl.scala 916:91]
  wire  _T_1058 = _T_1055 & _T_1057; // @[dec_decode_ctl.scala 916:89]
  wire  _T_1059 = _T_1058 & i0_rs1_nonblock_load_bypass_en_d; // @[dec_decode_ctl.scala 916:108]
  wire [1:0] _T_1063 = {i0_rs1bypass[1],i0_rs1bypass[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_1064 = {_T_1059,i0_rs1bypass[2]}; // @[Cat.scala 29:58]
  wire  _T_1067 = ~i0_rs2bypass[0]; // @[dec_decode_ctl.scala 917:53]
  wire  _T_1069 = ~i0_rs2bypass[1]; // @[dec_decode_ctl.scala 917:72]
  wire  _T_1070 = _T_1067 & _T_1069; // @[dec_decode_ctl.scala 917:70]
  wire  _T_1072 = ~i0_rs2bypass[2]; // @[dec_decode_ctl.scala 917:91]
  wire  _T_1073 = _T_1070 & _T_1072; // @[dec_decode_ctl.scala 917:89]
  wire  _T_1074 = _T_1073 & i0_rs2_nonblock_load_bypass_en_d; // @[dec_decode_ctl.scala 917:108]
  wire [1:0] _T_1078 = {i0_rs2bypass[1],i0_rs2bypass[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_1079 = {_T_1074,i0_rs2bypass[2]}; // @[Cat.scala 29:58]
  wire  _T_1081 = i0_dp_raw_load | i0_dp_raw_store; // @[dec_decode_ctl.scala 921:68]
  wire  _T_1082 = io_dec_ib0_valid_d & _T_1081; // @[dec_decode_ctl.scala 921:50]
  wire  _T_1083 = ~io_dctl_dma_dma_dccm_stall_any; // @[dec_decode_ctl.scala 921:89]
  wire  _T_1084 = _T_1082 & _T_1083; // @[dec_decode_ctl.scala 921:87]
  wire  _T_1086 = _T_1084 & _T_592; // @[dec_decode_ctl.scala 921:121]
  wire  _T_1088 = ~io_decode_exu_dec_extint_stall; // @[dec_decode_ctl.scala 923:6]
  wire  _T_1089 = _T_1088 & i0_dp_lsu; // @[dec_decode_ctl.scala 923:38]
  wire  _T_1090 = _T_1089 & i0_dp_load; // @[dec_decode_ctl.scala 923:50]
  wire  _T_1095 = _T_1089 & i0_dp_store; // @[dec_decode_ctl.scala 924:50]
  wire [11:0] _T_1099 = {io_dec_i0_instr_d[31:25],i0r_rd}; // @[Cat.scala 29:58]
  wire [11:0] _T_1100 = _T_1090 ? io_dec_i0_instr_d[31:20] : 12'h0; // @[Mux.scala 27:72]
  wire [11:0] _T_1101 = _T_1095 ? _T_1099 : 12'h0; // @[Mux.scala 27:72]
  dec_dec_ctl i0_dec ( // @[dec_decode_ctl.scala 438:22]
    .io_ins(i0_dec_io_ins),
    .io_out_clz(i0_dec_io_out_clz),
    .io_out_ctz(i0_dec_io_out_ctz),
    .io_out_pcnt(i0_dec_io_out_pcnt),
    .io_out_sext_b(i0_dec_io_out_sext_b),
    .io_out_sext_h(i0_dec_io_out_sext_h),
    .io_out_slo(i0_dec_io_out_slo),
    .io_out_sro(i0_dec_io_out_sro),
    .io_out_min(i0_dec_io_out_min),
    .io_out_max(i0_dec_io_out_max),
    .io_out_pack(i0_dec_io_out_pack),
    .io_out_packu(i0_dec_io_out_packu),
    .io_out_packh(i0_dec_io_out_packh),
    .io_out_rol(i0_dec_io_out_rol),
    .io_out_ror(i0_dec_io_out_ror),
    .io_out_grev(i0_dec_io_out_grev),
    .io_out_gorc(i0_dec_io_out_gorc),
    .io_out_zbb(i0_dec_io_out_zbb),
    .io_out_sbset(i0_dec_io_out_sbset),
    .io_out_sbclr(i0_dec_io_out_sbclr),
    .io_out_sbinv(i0_dec_io_out_sbinv),
    .io_out_sbext(i0_dec_io_out_sbext),
    .io_out_zbs(i0_dec_io_out_zbs),
    .io_out_bext(i0_dec_io_out_bext),
    .io_out_bdep(i0_dec_io_out_bdep),
    .io_out_zbe(i0_dec_io_out_zbe),
    .io_out_clmul(i0_dec_io_out_clmul),
    .io_out_clmulh(i0_dec_io_out_clmulh),
    .io_out_clmulr(i0_dec_io_out_clmulr),
    .io_out_zbc(i0_dec_io_out_zbc),
    .io_out_shfl(i0_dec_io_out_shfl),
    .io_out_unshfl(i0_dec_io_out_unshfl),
    .io_out_zbp(i0_dec_io_out_zbp),
    .io_out_crc32_b(i0_dec_io_out_crc32_b),
    .io_out_crc32_h(i0_dec_io_out_crc32_h),
    .io_out_crc32_w(i0_dec_io_out_crc32_w),
    .io_out_crc32c_b(i0_dec_io_out_crc32c_b),
    .io_out_crc32c_h(i0_dec_io_out_crc32c_h),
    .io_out_crc32c_w(i0_dec_io_out_crc32c_w),
    .io_out_zbr(i0_dec_io_out_zbr),
    .io_out_bfp(i0_dec_io_out_bfp),
    .io_out_zbf(i0_dec_io_out_zbf),
    .io_out_sh1add(i0_dec_io_out_sh1add),
    .io_out_sh2add(i0_dec_io_out_sh2add),
    .io_out_sh3add(i0_dec_io_out_sh3add),
    .io_out_zba(i0_dec_io_out_zba),
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
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  assign io_decode_exu_dec_data_en = {i0_x_data_en,i0_r_data_en}; // @[dec_decode_ctl.scala 773:38]
  assign io_decode_exu_dec_ctl_en = {i0_x_ctl_en,i0_r_ctl_en}; // @[dec_decode_ctl.scala 774:38]
  assign io_decode_exu_i0_ap_clz = _T_80 ? 1'h0 : i0_dp_raw_clz; // @[dec_decode_ctl.scala 317:33]
  assign io_decode_exu_i0_ap_ctz = _T_80 ? 1'h0 : i0_dp_raw_ctz; // @[dec_decode_ctl.scala 318:33]
  assign io_decode_exu_i0_ap_pcnt = _T_80 ? 1'h0 : i0_dp_raw_pcnt; // @[dec_decode_ctl.scala 319:33]
  assign io_decode_exu_i0_ap_sext_b = _T_80 ? 1'h0 : i0_dp_raw_sext_b; // @[dec_decode_ctl.scala 320:33]
  assign io_decode_exu_i0_ap_sext_h = _T_80 ? 1'h0 : i0_dp_raw_sext_h; // @[dec_decode_ctl.scala 321:33]
  assign io_decode_exu_i0_ap_slo = _T_80 ? 1'h0 : i0_dp_raw_slo; // @[dec_decode_ctl.scala 326:33]
  assign io_decode_exu_i0_ap_sro = _T_80 ? 1'h0 : i0_dp_raw_sro; // @[dec_decode_ctl.scala 327:33]
  assign io_decode_exu_i0_ap_min = _T_80 ? 1'h0 : i0_dp_raw_min; // @[dec_decode_ctl.scala 328:33]
  assign io_decode_exu_i0_ap_max = _T_80 ? 1'h0 : i0_dp_raw_max; // @[dec_decode_ctl.scala 329:33]
  assign io_decode_exu_i0_ap_pack = _T_80 ? 1'h0 : i0_dp_raw_pack; // @[dec_decode_ctl.scala 330:33]
  assign io_decode_exu_i0_ap_packu = _T_80 ? 1'h0 : i0_dp_raw_packu; // @[dec_decode_ctl.scala 331:33]
  assign io_decode_exu_i0_ap_packh = _T_80 ? 1'h0 : i0_dp_raw_packh; // @[dec_decode_ctl.scala 332:33]
  assign io_decode_exu_i0_ap_rol = _T_80 ? 1'h0 : i0_dp_raw_rol; // @[dec_decode_ctl.scala 333:33]
  assign io_decode_exu_i0_ap_ror = _T_80 ? 1'h0 : i0_dp_raw_ror; // @[dec_decode_ctl.scala 334:33]
  assign io_decode_exu_i0_ap_grev = _T_80 ? 1'h0 : i0_dp_raw_grev; // @[dec_decode_ctl.scala 335:33]
  assign io_decode_exu_i0_ap_gorc = _T_80 ? 1'h0 : i0_dp_raw_gorc; // @[dec_decode_ctl.scala 336:33]
  assign io_decode_exu_i0_ap_zbb = _T_80 ? 1'h0 : i0_dp_raw_zbb; // @[dec_decode_ctl.scala 337:33]
  assign io_decode_exu_i0_ap_sbset = _T_80 ? 1'h0 : i0_dp_raw_sbset; // @[dec_decode_ctl.scala 338:33]
  assign io_decode_exu_i0_ap_sbclr = _T_80 ? 1'h0 : i0_dp_raw_sbclr; // @[dec_decode_ctl.scala 339:33]
  assign io_decode_exu_i0_ap_sbinv = _T_80 ? 1'h0 : i0_dp_raw_sbinv; // @[dec_decode_ctl.scala 340:33]
  assign io_decode_exu_i0_ap_sbext = _T_80 ? 1'h0 : i0_dp_raw_sbext; // @[dec_decode_ctl.scala 341:33]
  assign io_decode_exu_i0_ap_sh1add = _T_80 ? 1'h0 : i0_dp_raw_sh1add; // @[dec_decode_ctl.scala 322:33]
  assign io_decode_exu_i0_ap_sh2add = _T_80 ? 1'h0 : i0_dp_raw_sh2add; // @[dec_decode_ctl.scala 323:33]
  assign io_decode_exu_i0_ap_sh3add = _T_80 ? 1'h0 : i0_dp_raw_sh3add; // @[dec_decode_ctl.scala 324:33]
  assign io_decode_exu_i0_ap_zba = _T_80 ? 1'h0 : i0_dp_raw_zba; // @[dec_decode_ctl.scala 325:33]
  assign io_decode_exu_i0_ap_land = _T_80 ? 1'h0 : i0_dp_raw_land; // @[dec_decode_ctl.scala 305:33]
  assign io_decode_exu_i0_ap_lor = _T_80 | i0_dp_raw_lor; // @[dec_decode_ctl.scala 306:33]
  assign io_decode_exu_i0_ap_lxor = _T_80 ? 1'h0 : i0_dp_raw_lxor; // @[dec_decode_ctl.scala 307:33]
  assign io_decode_exu_i0_ap_sll = _T_80 ? 1'h0 : i0_dp_raw_sll; // @[dec_decode_ctl.scala 308:33]
  assign io_decode_exu_i0_ap_srl = _T_80 ? 1'h0 : i0_dp_raw_srl; // @[dec_decode_ctl.scala 309:33]
  assign io_decode_exu_i0_ap_sra = _T_80 ? 1'h0 : i0_dp_raw_sra; // @[dec_decode_ctl.scala 310:33]
  assign io_decode_exu_i0_ap_beq = _T_80 ? 1'h0 : i0_dp_raw_beq; // @[dec_decode_ctl.scala 313:33]
  assign io_decode_exu_i0_ap_bne = _T_80 ? 1'h0 : i0_dp_raw_bne; // @[dec_decode_ctl.scala 314:33]
  assign io_decode_exu_i0_ap_blt = _T_80 ? 1'h0 : i0_dp_raw_blt; // @[dec_decode_ctl.scala 315:33]
  assign io_decode_exu_i0_ap_bge = _T_80 ? 1'h0 : i0_dp_raw_bge; // @[dec_decode_ctl.scala 316:33]
  assign io_decode_exu_i0_ap_add = _T_80 ? 1'h0 : i0_dp_raw_add; // @[dec_decode_ctl.scala 303:33]
  assign io_decode_exu_i0_ap_sub = _T_80 ? 1'h0 : i0_dp_raw_sub; // @[dec_decode_ctl.scala 304:33]
  assign io_decode_exu_i0_ap_slt = _T_80 ? 1'h0 : i0_dp_raw_slt; // @[dec_decode_ctl.scala 311:33]
  assign io_decode_exu_i0_ap_unsign = _T_80 ? 1'h0 : i0_dp_raw_unsign; // @[dec_decode_ctl.scala 312:33]
  assign io_decode_exu_i0_ap_jal = _T_421 & _T_422; // @[dec_decode_ctl.scala 344:33]
  assign io_decode_exu_i0_ap_predict_t = _T_86 & i0_predict_br; // @[dec_decode_ctl.scala 300:37]
  assign io_decode_exu_i0_ap_predict_nt = _T_87 & i0_predict_br; // @[dec_decode_ctl.scala 299:37]
  assign io_decode_exu_i0_ap_csr_write = i0_csr_write & _T_433; // @[dec_decode_ctl.scala 342:33]
  assign io_decode_exu_i0_ap_csr_imm = _T_80 ? 1'h0 : i0_dp_raw_csr_imm; // @[dec_decode_ctl.scala 343:33]
  assign io_decode_exu_dec_i0_predict_p_d_valid = i0_brp_valid & i0_legal_decode_d; // @[dec_decode_ctl.scala 232:57]
  assign io_decode_exu_dec_i0_predict_p_d_bits_pc4 = io_dec_i0_pc4_d; // @[dec_decode_ctl.scala 230:57]
  assign io_decode_exu_dec_i0_predict_p_d_bits_hist = io_dec_i0_brp_bits_hist; // @[dec_decode_ctl.scala 231:57]
  assign io_decode_exu_dec_i0_predict_p_d_bits_toffset = _T_399 ? i0_pcall_imm[11:0] : _T_408; // @[dec_decode_ctl.scala 244:58]
  assign io_decode_exu_dec_i0_predict_p_d_bits_br_error = _T_71 & _T_50; // @[dec_decode_ctl.scala 239:58]
  assign io_decode_exu_dec_i0_predict_p_d_bits_br_start_error = _T_74 & _T_50; // @[dec_decode_ctl.scala 240:58]
  assign io_decode_exu_dec_i0_predict_p_d_bits_pcall = i0_dp_jal & i0_pcall_case; // @[dec_decode_ctl.scala 226:57]
  assign io_decode_exu_dec_i0_predict_p_d_bits_pja = i0_dp_jal & i0_pja_case; // @[dec_decode_ctl.scala 227:57]
  assign io_decode_exu_dec_i0_predict_p_d_bits_way = io_dec_i0_brp_bits_way; // @[dec_decode_ctl.scala 246:58]
  assign io_decode_exu_dec_i0_predict_p_d_bits_pret = i0_dp_jal & i0_pret_case; // @[dec_decode_ctl.scala 228:57]
  assign io_decode_exu_dec_i0_predict_p_d_bits_prett = io_dec_i0_brp_bits_prett; // @[dec_decode_ctl.scala 229:57]
  assign io_decode_exu_i0_predict_fghr_d = io_dec_i0_bp_fghr; // @[dec_decode_ctl.scala 245:58]
  assign io_decode_exu_i0_predict_index_d = io_dec_i0_bp_index; // @[dec_decode_ctl.scala 241:58]
  assign io_decode_exu_i0_predict_btag_d = io_dec_i0_bp_btag; // @[dec_decode_ctl.scala 242:58]
  assign io_decode_exu_dec_i0_rs1_en_d = i0_dp_rs1 & _T_657; // @[dec_decode_ctl.scala 680:35]
  assign io_decode_exu_dec_i0_branch_d = _T_610 | i0_br_error_all; // @[dec_decode_ctl.scala 631:37]
  assign io_decode_exu_dec_i0_rs2_en_d = i0_dp_rs2 & _T_659; // @[dec_decode_ctl.scala 681:35]
  assign io_decode_exu_dec_i0_immed_d = _T_787 | _T_784; // @[dec_decode_ctl.scala 693:32]
  assign io_decode_exu_dec_i0_result_r = i0_result_r_raw; // @[dec_decode_ctl.scala 919:41]
  assign io_decode_exu_dec_qual_lsu_d = _T_80 ? 1'h0 : i0_dp_raw_lsu; // @[dec_decode_ctl.scala 636:32]
  assign io_decode_exu_dec_i0_select_pc_d = _T_80 ? 1'h0 : i0_dp_raw_pc; // @[dec_decode_ctl.scala 291:36]
  assign io_decode_exu_dec_i0_rs1_bypass_en_d = {_T_1064,_T_1063}; // @[dec_decode_ctl.scala 916:45]
  assign io_decode_exu_dec_i0_rs2_bypass_en_d = {_T_1079,_T_1078}; // @[dec_decode_ctl.scala 917:45]
  assign io_decode_exu_mul_p_valid = i0_exulegal_decode_d & i0_dp_mul; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 471:32]
  assign io_decode_exu_mul_p_bits_rs1_sign = _T_80 ? 1'h0 : i0_dp_raw_rs1_sign; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 472:37]
  assign io_decode_exu_mul_p_bits_rs2_sign = _T_80 ? 1'h0 : i0_dp_raw_rs2_sign; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 473:37]
  assign io_decode_exu_mul_p_bits_low = _T_80 ? 1'h0 : i0_dp_raw_low; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 474:37]
  assign io_decode_exu_mul_p_bits_bext = _T_80 ? 1'h0 : i0_dp_raw_bext; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 475:37]
  assign io_decode_exu_mul_p_bits_bdep = _T_80 ? 1'h0 : i0_dp_raw_bdep; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 476:37]
  assign io_decode_exu_mul_p_bits_clmul = _T_80 ? 1'h0 : i0_dp_raw_clmul; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 477:37]
  assign io_decode_exu_mul_p_bits_clmulh = _T_80 ? 1'h0 : i0_dp_raw_clmulh; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 478:37]
  assign io_decode_exu_mul_p_bits_clmulr = _T_80 ? 1'h0 : i0_dp_raw_clmulr; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 479:37]
  assign io_decode_exu_mul_p_bits_grev = _T_80 ? 1'h0 : i0_dp_raw_grev; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 480:37]
  assign io_decode_exu_mul_p_bits_gorc = _T_80 ? 1'h0 : i0_dp_raw_gorc; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 481:37]
  assign io_decode_exu_mul_p_bits_shfl = _T_80 ? 1'h0 : i0_dp_raw_shfl; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 482:37]
  assign io_decode_exu_mul_p_bits_unshfl = _T_80 ? 1'h0 : i0_dp_raw_unshfl; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 483:37]
  assign io_decode_exu_mul_p_bits_crc32_b = _T_80 ? 1'h0 : i0_dp_raw_crc32_b; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 484:37]
  assign io_decode_exu_mul_p_bits_crc32_h = _T_80 ? 1'h0 : i0_dp_raw_crc32_h; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 485:37]
  assign io_decode_exu_mul_p_bits_crc32_w = _T_80 ? 1'h0 : i0_dp_raw_crc32_w; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 486:37]
  assign io_decode_exu_mul_p_bits_crc32c_b = _T_80 ? 1'h0 : i0_dp_raw_crc32c_b; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 487:37]
  assign io_decode_exu_mul_p_bits_crc32c_h = _T_80 ? 1'h0 : i0_dp_raw_crc32c_h; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 488:37]
  assign io_decode_exu_mul_p_bits_crc32c_w = _T_80 ? 1'h0 : i0_dp_raw_crc32c_w; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 489:37]
  assign io_decode_exu_mul_p_bits_bfp = _T_80 ? 1'h0 : i0_dp_raw_bfp; // @[dec_decode_ctl.scala 117:25 dec_decode_ctl.scala 490:37]
  assign io_decode_exu_pred_correct_npc_x = temp_pred_correct_npc_x[31:1]; // @[dec_decode_ctl.scala 877:36]
  assign io_decode_exu_dec_extint_stall = _T_12; // @[dec_decode_ctl.scala 208:35]
  assign io_dec_alu_dec_i0_alu_decode_d = i0_exulegal_decode_d & i0_dp_alu; // @[dec_decode_ctl.scala 630:34]
  assign io_dec_alu_dec_csr_ren_d = i0_dp_csr_read & io_dec_ib0_valid_d; // @[dec_decode_ctl.scala 516:29]
  assign io_dec_alu_dec_i0_br_immed_d = _T_885 ? i0_br_offset : _T_898; // @[dec_decode_ctl.scala 823:32]
  assign io_dec_div_div_p_valid = i0_exulegal_decode_d & i0_dp_div; // @[dec_decode_ctl.scala 467:29]
  assign io_dec_div_div_p_bits_unsign = _T_80 ? 1'h0 : i0_dp_raw_unsign; // @[dec_decode_ctl.scala 468:34]
  assign io_dec_div_div_p_bits_rem = _T_80 ? 1'h0 : i0_dp_raw_rem; // @[dec_decode_ctl.scala 469:34]
  assign io_dec_div_dec_div_cancel = _T_927 | _T_932; // @[dec_decode_ctl.scala 842:37]
  assign io_dec_aln_dec_i0_decode_d = _T_589 & _T_567; // @[dec_decode_ctl.scala 611:30 dec_decode_ctl.scala 674:30]
  assign io_dec_i0_inst_wb = i0_inst_wb; // @[dec_decode_ctl.scala 868:21]
  assign io_dec_i0_pc_wb = i0_pc_wb; // @[dec_decode_ctl.scala 869:19]
  assign io_dec_i0_rs1_d = io_dec_i0_instr_d[19:15]; // @[dec_decode_ctl.scala 683:19]
  assign io_dec_i0_rs2_d = io_dec_i0_instr_d[24:20]; // @[dec_decode_ctl.scala 684:19]
  assign io_dec_i0_waddr_r = r_d_bits_i0rd; // @[dec_decode_ctl.scala 805:27]
  assign io_dec_i0_wen_r = _T_871 & _T_872; // @[dec_decode_ctl.scala 807:32]
  assign io_dec_i0_wdata_r = _T_881 ? io_lsu_result_corr_r : i0_result_r_raw; // @[dec_decode_ctl.scala 808:26]
  assign io_lsu_p_valid = io_decode_exu_dec_extint_stall | lsu_decode_d; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 498:24 dec_decode_ctl.scala 502:35]
  assign io_lsu_p_bits_fast_int = io_decode_exu_dec_extint_stall; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 497:29]
  assign io_lsu_p_bits_stack = io_decode_exu_dec_extint_stall ? 1'h0 : _T_425; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 508:29]
  assign io_lsu_p_bits_by = io_decode_exu_dec_extint_stall ? 1'h0 : i0_dp_by; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 505:40]
  assign io_lsu_p_bits_half = io_decode_exu_dec_extint_stall ? 1'h0 : i0_dp_half; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 506:40]
  assign io_lsu_p_bits_word = io_decode_exu_dec_extint_stall | i0_dp_word; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 496:29 dec_decode_ctl.scala 507:40]
  assign io_lsu_p_bits_load = io_decode_exu_dec_extint_stall | i0_dp_load; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 495:29 dec_decode_ctl.scala 503:40]
  assign io_lsu_p_bits_store = io_decode_exu_dec_extint_stall ? 1'h0 : i0_dp_store; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 504:40]
  assign io_lsu_p_bits_unsign = io_decode_exu_dec_extint_stall ? 1'h0 : i0_dp_unsign; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 512:40]
  assign io_lsu_p_bits_store_data_bypass_d = io_decode_exu_dec_extint_stall ? 1'h0 : store_data_bypass_d; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 510:40]
  assign io_lsu_p_bits_load_ldst_bypass_d = io_decode_exu_dec_extint_stall ? 1'h0 : load_ldst_bypass_d; // @[dec_decode_ctl.scala 493:12 dec_decode_ctl.scala 509:40]
  assign io_div_waddr_wb = _T_947; // @[dec_decode_ctl.scala 860:19]
  assign io_dec_lsu_valid_raw_d = _T_1086 | io_decode_exu_dec_extint_stall; // @[dec_decode_ctl.scala 921:26]
  assign io_dec_lsu_offset_d = _T_1100 | _T_1101; // @[dec_decode_ctl.scala 922:23]
  assign io_dec_csr_wen_unq_d = _T_436 & io_dec_ib0_valid_d; // @[dec_decode_ctl.scala 525:24]
  assign io_dec_csr_any_unq_d = any_csr_d & io_dec_ib0_valid_d; // @[dec_decode_ctl.scala 528:24]
  assign io_dec_csr_rdaddr_d = _T_440 & io_dec_i0_instr_d[31:20]; // @[dec_decode_ctl.scala 529:24]
  assign io_dec_csr_wen_r = _T_443 & _T_868; // @[dec_decode_ctl.scala 534:20]
  assign io_dec_csr_wraddr_r = _T_445 & r_d_bits_csrwaddr; // @[dec_decode_ctl.scala 530:24]
  assign io_dec_csr_wrdata_r = _T_529 ? i0_result_corr_r : write_csr_data; // @[dec_decode_ctl.scala 574:24]
  assign io_dec_csr_stall_int_ff = _T_454 & _T_455; // @[dec_decode_ctl.scala 537:27]
  assign io_dec_tlu_i0_valid_r = r_d_valid & _T_857; // @[dec_decode_ctl.scala 637:29]
  assign io_dec_tlu_packet_r_legal = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_legal; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_icaf = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_icaf_second = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_icaf_second; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_icaf_type = io_dec_tlu_flush_lower_wb ? 2'h0 : r_t_icaf_type; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_fence_i = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_fence_i; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_i0trigger = io_dec_tlu_flush_lower_wb ? 4'h0 : _T_644; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_flush_lower_wb ? 4'h0 : r_t_pmu_i0_itype; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_flush_lower_wb ? 1'h0 : r_t_pmu_i0_br_unpred; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_packet_r_pmu_divide = r_d_bits_i0div & r_d_valid; // @[dec_decode_ctl.scala 669:39 dec_decode_ctl.scala 670:39]
  assign io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_flush_lower_wb ? 1'h0 : lsu_pmu_misaligned_r; // @[dec_decode_ctl.scala 669:39]
  assign io_dec_tlu_i0_pc_r = dec_i0_pc_r; // @[dec_decode_ctl.scala 872:27]
  assign io_dec_illegal_inst = _T_565; // @[dec_decode_ctl.scala 596:23]
  assign io_dec_pmu_instr_decoded = io_dec_aln_dec_i0_decode_d; // @[dec_decode_ctl.scala 616:28]
  assign io_dec_pmu_decode_stall = io_dec_ib0_valid_d & _T_597; // @[dec_decode_ctl.scala 617:27]
  assign io_dec_pmu_presync_stall = presync_stall & io_dec_ib0_valid_d; // @[dec_decode_ctl.scala 619:29]
  assign io_dec_pmu_postsync_stall = postsync_stall & io_dec_ib0_valid_d; // @[dec_decode_ctl.scala 618:29]
  assign io_dec_nonblock_load_wen = _T_279 & _T_280; // @[dec_decode_ctl.scala 399:28]
  assign io_dec_nonblock_load_waddr = _T_325 | _T_317; // @[dec_decode_ctl.scala 396:29 dec_decode_ctl.scala 406:29]
  assign io_dec_pause_state = pause_stall; // @[dec_decode_ctl.scala 560:22]
  assign io_dec_pause_state_cg = pause_stall & _T_519; // @[dec_decode_ctl.scala 562:25]
  assign io_dec_div_active = _T_42; // @[dec_decode_ctl.scala 217:35]
  assign i0_dec_io_ins = io_dec_i0_instr_d; // @[dec_decode_ctl.scala 439:16]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = i0_x_data_en & any_csr_d; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = i0_x_data_en & any_csr_d; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = _T_527 | pause_stall; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = shift_illegal & _T_564; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = i0_r_data_en & _T_875; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = i0_pipe_en[3] | io_clk_override; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = i0_legal_decode_d & i0_dp_div; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = i0_x_data_en & trace_enable; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = i0_r_data_en & trace_enable; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = i0_wb_data_en & trace_enable; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = i0_wb_data_en & trace_enable; // @[lib.scala 407:17]
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
  leak1_i1_stall = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  leak1_i0_stall = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_12 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pause_stall = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  write_csr_data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  tlu_wr_pause_r1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  tlu_wr_pause_r2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  illegal_lockout = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flush_final_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  postsync_stall = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  x_d_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  lsu_trigger_match_r = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  lsu_pmu_misaligned_r = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  x_d_bits_i0div = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  x_d_bits_i0rd = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  r_d_bits_i0div = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_d_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_d_bits_i0rd = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  r_d_bits_i0v = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_42 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  debug_valid_x = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  cam_raw_0_bits_tag = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  cam_raw_0_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  cam_raw_1_bits_tag = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  cam_raw_1_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  cam_raw_2_bits_tag = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  cam_raw_2_valid = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  cam_raw_3_bits_tag = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  cam_raw_3_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  x_d_bits_i0load = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_815 = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  nonblock_load_valid_m_delay = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  r_d_bits_i0load = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  cam_raw_0_bits_rd = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  cam_raw_0_bits_wb = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  cam_raw_1_bits_rd = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  cam_raw_1_bits_wb = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  cam_raw_2_bits_rd = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  cam_raw_2_bits_wb = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  cam_raw_3_bits_rd = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  cam_raw_3_bits_wb = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  lsu_idle = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  x_d_bits_i0v = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  i0_x_c_load = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  i0_r_c_load = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  r_d_bits_csrwen = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  r_d_bits_csrwaddr = _RAND_46[11:0];
  _RAND_47 = {1{`RANDOM}};
  csr_read_x = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  csr_clr_x = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  csr_set_x = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  csr_write_x = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  csr_imm_x = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  csrimm_x = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  csr_rddata_x = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  r_d_bits_csrwonly = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  i0_result_r_raw = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  x_d_bits_csrwonly = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  wbd_bits_csrwonly = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  _T_565 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  x_t_legal = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  x_t_icaf = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  x_t_icaf_second = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  x_t_icaf_type = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  x_t_fence_i = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  x_t_i0trigger = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  x_t_pmu_i0_itype = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  x_t_pmu_i0_br_unpred = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  r_t_legal = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  r_t_icaf = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  r_t_icaf_second = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  r_t_icaf_type = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  r_t_fence_i = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  r_t_i0trigger = _RAND_72[3:0];
  _RAND_73 = {1{`RANDOM}};
  r_t_pmu_i0_itype = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  r_t_pmu_i0_br_unpred = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  r_d_bits_i0store = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  i0_x_c_mul = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  i0_x_c_alu = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  i0_r_c_mul = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  i0_r_c_alu = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  x_d_bits_i0store = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  x_d_bits_csrwen = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  x_d_bits_csrwaddr = _RAND_82[11:0];
  _RAND_83 = {1{`RANDOM}};
  last_br_immed_x = _RAND_83[11:0];
  _RAND_84 = {1{`RANDOM}};
  _T_947 = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  i0_inst_x = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  i0_inst_r = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  i0_inst_wb = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  i0_pc_wb = _RAND_88[30:0];
  _RAND_89 = {1{`RANDOM}};
  dec_i0_pc_r = _RAND_89[30:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    leak1_i1_stall = 1'h0;
  end
  if (reset) begin
    leak1_i0_stall = 1'h0;
  end
  if (reset) begin
    _T_12 = 1'h0;
  end
  if (reset) begin
    pause_stall = 1'h0;
  end
  if (reset) begin
    write_csr_data = 32'h0;
  end
  if (reset) begin
    tlu_wr_pause_r1 = 1'h0;
  end
  if (reset) begin
    tlu_wr_pause_r2 = 1'h0;
  end
  if (reset) begin
    illegal_lockout = 1'h0;
  end
  if (reset) begin
    flush_final_r = 1'h0;
  end
  if (reset) begin
    postsync_stall = 1'h0;
  end
  if (reset) begin
    x_d_valid = 1'h0;
  end
  if (reset) begin
    lsu_trigger_match_r = 4'h0;
  end
  if (reset) begin
    lsu_pmu_misaligned_r = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0div = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0rd = 5'h0;
  end
  if (reset) begin
    r_d_bits_i0div = 1'h0;
  end
  if (reset) begin
    r_d_valid = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0rd = 5'h0;
  end
  if (reset) begin
    r_d_bits_i0v = 1'h0;
  end
  if (reset) begin
    _T_42 = 1'h0;
  end
  if (reset) begin
    debug_valid_x = 1'h0;
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
    _T_815 = 3'h0;
  end
  if (reset) begin
    nonblock_load_valid_m_delay = 1'h0;
  end
  if (reset) begin
    r_d_bits_i0load = 1'h0;
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
    x_d_bits_i0v = 1'h0;
  end
  if (reset) begin
    i0_x_c_load = 1'h0;
  end
  if (reset) begin
    i0_r_c_load = 1'h0;
  end
  if (reset) begin
    r_d_bits_csrwen = 1'h0;
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
    _T_565 = 32'h0;
  end
  if (reset) begin
    x_t_legal = 1'h0;
  end
  if (reset) begin
    x_t_icaf = 1'h0;
  end
  if (reset) begin
    x_t_icaf_second = 1'h0;
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
    r_t_icaf_second = 1'h0;
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
    r_d_bits_i0store = 1'h0;
  end
  if (reset) begin
    i0_x_c_mul = 1'h0;
  end
  if (reset) begin
    i0_x_c_alu = 1'h0;
  end
  if (reset) begin
    i0_r_c_mul = 1'h0;
  end
  if (reset) begin
    i0_r_c_alu = 1'h0;
  end
  if (reset) begin
    x_d_bits_i0store = 1'h0;
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
    _T_947 = 5'h0;
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
    i0_pc_wb = 31'h0;
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
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      leak1_i1_stall <= 1'h0;
    end else if (_T_3) begin
      leak1_i1_stall <= leak1_i1_stall_in;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      leak1_i0_stall <= 1'h0;
    end else if (_T_7) begin
      leak1_i0_stall <= leak1_i0_stall_in;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_12 <= 1'h0;
    end else if (_T_11) begin
      _T_12 <= io_dec_tlu_flush_extint;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      pause_stall <= 1'h0;
    end else if (_T_15) begin
      pause_stall <= pause_state_in;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      write_csr_data <= 32'h0;
    end else if (csr_data_wen) begin
      if (pause_stall) begin
        write_csr_data <= _T_522;
      end else if (io_dec_tlu_wr_pause_r) begin
        write_csr_data <= io_dec_csr_wrdata_r;
      end else begin
        write_csr_data <= write_csr_data_x;
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r1 <= 1'h0;
    end else if (_T_19) begin
      tlu_wr_pause_r1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      tlu_wr_pause_r2 <= 1'h0;
    end else if (_T_23) begin
      tlu_wr_pause_r2 <= tlu_wr_pause_r1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      illegal_lockout <= 1'h0;
    end else if (_T_27) begin
      illegal_lockout <= illegal_lockout_in;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      flush_final_r <= 1'h0;
    end else if (_T_45) begin
      flush_final_r <= io_exu_flush_final;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      postsync_stall <= 1'h0;
    end else if (_T_31) begin
      postsync_stall <= ps_stall_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_valid <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_valid <= io_dec_aln_dec_i0_decode_d;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_trigger_match_r <= 4'h0;
    end else if (_T_34) begin
      lsu_trigger_match_r <= io_lsu_trigger_match_m;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_misaligned_r <= 1'h0;
    end else if (_T_37) begin
      lsu_pmu_misaligned_r <= io_lsu_pmu_misaligned_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_i0div <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_i0div <= d_d_bits_i0div;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_i0rd <= 5'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_i0rd <= i0r_rd;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_i0div <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_i0div <= x_d_bits_i0div;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_valid <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_valid <= x_d_in_valid;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_i0rd <= 5'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_i0rd <= x_d_bits_i0rd;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_i0v <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_i0v <= x_d_in_bits_i0v;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_42 <= 1'h0;
    end else if (_T_41) begin
      _T_42 <= div_active_in;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_valid_x <= 1'h0;
    end else if (_T_48) begin
      debug_valid_x <= io_dec_debug_valid_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_tag <= 3'h0;
    end else if (_T_161) begin
      if (cam_wen[0]) begin
        cam_raw_0_bits_tag <= {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m};
      end else if (_T_146) begin
        cam_raw_0_bits_tag <= 3'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_0_valid <= 1'h0;
    end else if (_T_161) begin
      if (io_dec_tlu_force_halt) begin
        cam_raw_0_valid <= 1'h0;
      end else begin
        cam_raw_0_valid <= _GEN_114;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_tag <= 3'h0;
    end else if (_T_197) begin
      if (cam_wen[1]) begin
        cam_raw_1_bits_tag <= {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m};
      end else if (_T_182) begin
        cam_raw_1_bits_tag <= 3'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_1_valid <= 1'h0;
    end else if (_T_197) begin
      if (io_dec_tlu_force_halt) begin
        cam_raw_1_valid <= 1'h0;
      end else begin
        cam_raw_1_valid <= _GEN_129;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_tag <= 3'h0;
    end else if (_T_233) begin
      if (cam_wen[2]) begin
        cam_raw_2_bits_tag <= {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m};
      end else if (_T_218) begin
        cam_raw_2_bits_tag <= 3'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_2_valid <= 1'h0;
    end else if (_T_233) begin
      if (io_dec_tlu_force_halt) begin
        cam_raw_2_valid <= 1'h0;
      end else begin
        cam_raw_2_valid <= _GEN_144;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_tag <= 3'h0;
    end else if (_T_269) begin
      if (cam_wen[3]) begin
        cam_raw_3_bits_tag <= {{1'd0}, io_dctl_busbuff_lsu_nonblock_load_tag_m};
      end else if (_T_254) begin
        cam_raw_3_bits_tag <= 3'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_3_valid <= 1'h0;
    end else if (_T_269) begin
      if (io_dec_tlu_force_halt) begin
        cam_raw_3_valid <= 1'h0;
      end else begin
        cam_raw_3_valid <= _GEN_159;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_i0load <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_i0load <= i0_d_c_load;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_815 <= 3'h0;
    end else begin
      _T_815 <= i0_pipe_en[3:1];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      nonblock_load_valid_m_delay <= 1'h0;
    end else if (i0_r_ctl_en) begin
      nonblock_load_valid_m_delay <= io_dctl_busbuff_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_i0load <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_i0load <= x_d_bits_i0load;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_rd <= 5'h0;
    end else if (_T_161) begin
      if (cam_wen[0]) begin
        if (x_d_bits_i0load) begin
          cam_raw_0_bits_rd <= x_d_bits_i0rd;
        end else begin
          cam_raw_0_bits_rd <= 5'h0;
        end
      end else if (_T_146) begin
        cam_raw_0_bits_rd <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_0_bits_wb <= 1'h0;
    end else if (_T_161) begin
      cam_raw_0_bits_wb <= cam_in_0_bits_wb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_rd <= 5'h0;
    end else if (_T_197) begin
      if (cam_wen[1]) begin
        if (x_d_bits_i0load) begin
          cam_raw_1_bits_rd <= x_d_bits_i0rd;
        end else begin
          cam_raw_1_bits_rd <= 5'h0;
        end
      end else if (_T_182) begin
        cam_raw_1_bits_rd <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_1_bits_wb <= 1'h0;
    end else if (_T_197) begin
      cam_raw_1_bits_wb <= cam_in_1_bits_wb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_rd <= 5'h0;
    end else if (_T_233) begin
      if (cam_wen[2]) begin
        if (x_d_bits_i0load) begin
          cam_raw_2_bits_rd <= x_d_bits_i0rd;
        end else begin
          cam_raw_2_bits_rd <= 5'h0;
        end
      end else if (_T_218) begin
        cam_raw_2_bits_rd <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_2_bits_wb <= 1'h0;
    end else if (_T_233) begin
      cam_raw_2_bits_wb <= cam_in_2_bits_wb;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_rd <= 5'h0;
    end else if (_T_269) begin
      if (cam_wen[3]) begin
        if (x_d_bits_i0load) begin
          cam_raw_3_bits_rd <= x_d_bits_i0rd;
        end else begin
          cam_raw_3_bits_rd <= 5'h0;
        end
      end else if (_T_254) begin
        cam_raw_3_bits_rd <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cam_raw_3_bits_wb <= 1'h0;
    end else if (_T_269) begin
      cam_raw_3_bits_wb <= cam_in_3_bits_wb;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      lsu_idle <= 1'h0;
    end else begin
      lsu_idle <= io_lsu_idle_any;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_i0v <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_i0v <= d_d_bits_i0v;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      i0_x_c_load <= 1'h0;
    end else if (i0_x_ctl_en) begin
      i0_x_c_load <= i0_d_c_load;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      i0_r_c_load <= 1'h0;
    end else if (i0_r_ctl_en) begin
      i0_r_c_load <= i0_x_c_load;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_csrwen <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_csrwen <= x_d_bits_csrwen;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_csrwaddr <= 12'h0;
    end else if (i0_r_ctl_en) begin
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
    end else if (_T_80) begin
      csr_imm_x <= 1'h0;
    end else begin
      csr_imm_x <= i0_dp_raw_csr_imm;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      csrimm_x <= 5'h0;
    end else if (_T_459) begin
      csrimm_x <= i0r_rs1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      csr_rddata_x <= 32'h0;
    end else if (_T_459) begin
      csr_rddata_x <= io_dec_csr_rddata_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_csrwonly <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_csrwonly <= x_d_bits_csrwonly;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_result_r_raw <= 32'h0;
    end else if (_T_876) begin
      if (_T_878) begin
        i0_result_r_raw <= io_lsu_result_m;
      end else begin
        i0_result_r_raw <= io_decode_exu_exu_i0_result_x;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_csrwonly <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_csrwonly <= d_d_bits_csrwonly;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wbd_bits_csrwonly <= 1'h0;
    end else if (i0_wb_ctl_en) begin
      wbd_bits_csrwonly <= r_d_bits_csrwonly;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_565 <= 32'h0;
    end else if (illegal_inst_en) begin
      if (io_dec_i0_pc4_d) begin
        _T_565 <= io_dec_i0_instr_d;
      end else begin
        _T_565 <= _T_562;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_legal <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_t_legal <= i0_legal_decode_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_icaf <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_t_icaf <= d_t_icaf;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_icaf_second <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_t_icaf_second <= d_t_icaf_second;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_icaf_type <= 2'h0;
    end else if (i0_x_ctl_en) begin
      x_t_icaf_type <= io_dec_i0_icaf_type_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_fence_i <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_t_fence_i <= d_t_fence_i;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_i0trigger <= 4'h0;
    end else if (i0_x_ctl_en) begin
      x_t_i0trigger <= d_t_i0trigger;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_itype <= 4'h0;
    end else if (i0_x_ctl_en) begin
      x_t_pmu_i0_itype <= d_t_pmu_i0_itype;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_t_pmu_i0_br_unpred <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_t_pmu_i0_br_unpred <= i0_br_unpred;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_legal <= 1'h0;
    end else if (i0_x_ctl_en) begin
      r_t_legal <= x_t_legal;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_icaf <= 1'h0;
    end else if (i0_x_ctl_en) begin
      r_t_icaf <= x_t_icaf;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_icaf_second <= 1'h0;
    end else if (i0_x_ctl_en) begin
      r_t_icaf_second <= x_t_icaf_second;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_icaf_type <= 2'h0;
    end else if (i0_x_ctl_en) begin
      r_t_icaf_type <= x_t_icaf_type;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_fence_i <= 1'h0;
    end else if (i0_x_ctl_en) begin
      r_t_fence_i <= x_t_fence_i;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_i0trigger <= 4'h0;
    end else if (i0_x_ctl_en) begin
      r_t_i0trigger <= x_t_in_i0trigger;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_itype <= 4'h0;
    end else if (i0_x_ctl_en) begin
      r_t_pmu_i0_itype <= x_t_pmu_i0_itype;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_t_pmu_i0_br_unpred <= 1'h0;
    end else if (i0_x_ctl_en) begin
      r_t_pmu_i0_br_unpred <= x_t_pmu_i0_br_unpred;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_d_bits_i0store <= 1'h0;
    end else if (i0_r_ctl_en) begin
      r_d_bits_i0store <= x_d_bits_i0store;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      i0_x_c_mul <= 1'h0;
    end else if (i0_x_ctl_en) begin
      i0_x_c_mul <= i0_d_c_mul;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      i0_x_c_alu <= 1'h0;
    end else if (i0_x_ctl_en) begin
      i0_x_c_alu <= i0_d_c_alu;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      i0_r_c_mul <= 1'h0;
    end else if (i0_r_ctl_en) begin
      i0_r_c_mul <= i0_x_c_mul;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      i0_r_c_alu <= 1'h0;
    end else if (i0_r_ctl_en) begin
      i0_r_c_alu <= i0_x_c_alu;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_i0store <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_i0store <= d_d_bits_i0store;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_csrwen <= 1'h0;
    end else if (i0_x_ctl_en) begin
      x_d_bits_csrwen <= d_d_bits_csrwen;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      x_d_bits_csrwaddr <= 12'h0;
    end else if (i0_x_ctl_en) begin
      if (d_d_bits_csrwen) begin
        x_d_bits_csrwaddr <= io_dec_i0_instr_d[31:20];
      end else begin
        x_d_bits_csrwaddr <= 12'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      last_br_immed_x <= 12'h0;
    end else if (i0_x_data_en) begin
      if (io_decode_exu_i0_ap_predict_nt) begin
        last_br_immed_x <= _T_898;
      end else if (_T_399) begin
        last_br_immed_x <= i0_pcall_imm[11:0];
      end else begin
        last_br_immed_x <= _T_408;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_947 <= 5'h0;
    end else if (i0_div_decode_d) begin
      _T_947 <= i0r_rd;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_inst_x <= 32'h0;
    end else if (_T_948) begin
      if (io_dec_i0_pc4_d) begin
        i0_inst_x <= io_dec_i0_instr_d;
      end else begin
        i0_inst_x <= _T_562;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_inst_r <= 32'h0;
    end else if (_T_950) begin
      i0_inst_r <= i0_inst_x;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_inst_wb <= 32'h0;
    end else if (_T_952) begin
      i0_inst_wb <= i0_inst_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pc_wb <= 31'h0;
    end else if (_T_952) begin
      i0_pc_wb <= io_dec_tlu_i0_pc_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dec_i0_pc_r <= 31'h0;
    end else if (i0_r_data_en) begin
      dec_i0_pc_r <= io_dec_alu_exu_i0_pc_x;
    end
  end
endmodule
module dec_gpr_ctl(
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
  output [31:0] io_gpr_exu_gpr_i0_rs1_d,
  output [31:0] io_gpr_exu_gpr_i0_rs2_d
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
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_12_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_12_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_13_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_13_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_14_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_14_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_15_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_15_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_16_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_16_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_17_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_17_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_18_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_18_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_19_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_19_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_20_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_20_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_21_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_21_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_22_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_22_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_23_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_23_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_24_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_24_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_25_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_25_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_26_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_26_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_27_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_27_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_28_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_28_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_29_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_29_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_30_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_30_io_en; // @[lib.scala 404:23]
  wire  _T = io_waddr0 == 5'h1; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_1 = io_wen0 & _T; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_2 = io_waddr1 == 5'h1; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_1 = io_wen1 & _T_2; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_4 = io_waddr2 == 5'h1; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_1 = io_wen2 & _T_4; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_7 = w0v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_8 = _T_7 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_10 = w1v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_11 = _T_10 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_12 = _T_8 | _T_11; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_14 = w2v_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_15 = _T_14 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_1 = _T_12 | _T_15; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_17 = io_waddr0 == 5'h2; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_2 = io_wen0 & _T_17; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_19 = io_waddr1 == 5'h2; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_2 = io_wen1 & _T_19; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_21 = io_waddr2 == 5'h2; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_2 = io_wen2 & _T_21; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_24 = w0v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_25 = _T_24 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_27 = w1v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_28 = _T_27 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_29 = _T_25 | _T_28; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_31 = w2v_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_32 = _T_31 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_2 = _T_29 | _T_32; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_34 = io_waddr0 == 5'h3; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_3 = io_wen0 & _T_34; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_36 = io_waddr1 == 5'h3; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_3 = io_wen1 & _T_36; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_38 = io_waddr2 == 5'h3; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_3 = io_wen2 & _T_38; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_41 = w0v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_42 = _T_41 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_44 = w1v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_45 = _T_44 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_46 = _T_42 | _T_45; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_48 = w2v_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_49 = _T_48 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_3 = _T_46 | _T_49; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_51 = io_waddr0 == 5'h4; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_4 = io_wen0 & _T_51; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_53 = io_waddr1 == 5'h4; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_4 = io_wen1 & _T_53; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_55 = io_waddr2 == 5'h4; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_4 = io_wen2 & _T_55; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_58 = w0v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_59 = _T_58 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_61 = w1v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_62 = _T_61 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_63 = _T_59 | _T_62; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_65 = w2v_4 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_66 = _T_65 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_4 = _T_63 | _T_66; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_68 = io_waddr0 == 5'h5; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_5 = io_wen0 & _T_68; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_70 = io_waddr1 == 5'h5; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_5 = io_wen1 & _T_70; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_72 = io_waddr2 == 5'h5; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_5 = io_wen2 & _T_72; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_75 = w0v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_76 = _T_75 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_78 = w1v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_79 = _T_78 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_80 = _T_76 | _T_79; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_82 = w2v_5 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_83 = _T_82 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_5 = _T_80 | _T_83; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_85 = io_waddr0 == 5'h6; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_6 = io_wen0 & _T_85; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_87 = io_waddr1 == 5'h6; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_6 = io_wen1 & _T_87; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_89 = io_waddr2 == 5'h6; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_6 = io_wen2 & _T_89; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_92 = w0v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_93 = _T_92 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_95 = w1v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_96 = _T_95 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_97 = _T_93 | _T_96; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_99 = w2v_6 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_100 = _T_99 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_6 = _T_97 | _T_100; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_102 = io_waddr0 == 5'h7; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_7 = io_wen0 & _T_102; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_104 = io_waddr1 == 5'h7; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_7 = io_wen1 & _T_104; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_106 = io_waddr2 == 5'h7; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_7 = io_wen2 & _T_106; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_109 = w0v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_110 = _T_109 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_112 = w1v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_113 = _T_112 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_114 = _T_110 | _T_113; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_116 = w2v_7 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_117 = _T_116 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_7 = _T_114 | _T_117; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_119 = io_waddr0 == 5'h8; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_8 = io_wen0 & _T_119; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_121 = io_waddr1 == 5'h8; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_8 = io_wen1 & _T_121; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_123 = io_waddr2 == 5'h8; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_8 = io_wen2 & _T_123; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_126 = w0v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_127 = _T_126 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_129 = w1v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_130 = _T_129 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_131 = _T_127 | _T_130; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_133 = w2v_8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_134 = _T_133 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_8 = _T_131 | _T_134; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_136 = io_waddr0 == 5'h9; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_9 = io_wen0 & _T_136; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_138 = io_waddr1 == 5'h9; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_9 = io_wen1 & _T_138; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_140 = io_waddr2 == 5'h9; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_9 = io_wen2 & _T_140; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_143 = w0v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_144 = _T_143 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_146 = w1v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_147 = _T_146 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_148 = _T_144 | _T_147; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_150 = w2v_9 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_151 = _T_150 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_9 = _T_148 | _T_151; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_153 = io_waddr0 == 5'ha; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_10 = io_wen0 & _T_153; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_155 = io_waddr1 == 5'ha; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_10 = io_wen1 & _T_155; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_157 = io_waddr2 == 5'ha; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_10 = io_wen2 & _T_157; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_160 = w0v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_161 = _T_160 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_163 = w1v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_164 = _T_163 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_165 = _T_161 | _T_164; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_167 = w2v_10 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_168 = _T_167 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_10 = _T_165 | _T_168; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_170 = io_waddr0 == 5'hb; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_11 = io_wen0 & _T_170; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_172 = io_waddr1 == 5'hb; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_11 = io_wen1 & _T_172; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_174 = io_waddr2 == 5'hb; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_11 = io_wen2 & _T_174; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_177 = w0v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_178 = _T_177 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_180 = w1v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_181 = _T_180 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_182 = _T_178 | _T_181; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_184 = w2v_11 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_185 = _T_184 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_11 = _T_182 | _T_185; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_187 = io_waddr0 == 5'hc; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_12 = io_wen0 & _T_187; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_189 = io_waddr1 == 5'hc; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_12 = io_wen1 & _T_189; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_191 = io_waddr2 == 5'hc; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_12 = io_wen2 & _T_191; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_194 = w0v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_195 = _T_194 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_197 = w1v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_198 = _T_197 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_199 = _T_195 | _T_198; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_201 = w2v_12 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_202 = _T_201 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_12 = _T_199 | _T_202; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_204 = io_waddr0 == 5'hd; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_13 = io_wen0 & _T_204; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_206 = io_waddr1 == 5'hd; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_13 = io_wen1 & _T_206; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_208 = io_waddr2 == 5'hd; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_13 = io_wen2 & _T_208; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_211 = w0v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_212 = _T_211 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_214 = w1v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_215 = _T_214 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_216 = _T_212 | _T_215; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_218 = w2v_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_219 = _T_218 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_13 = _T_216 | _T_219; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_221 = io_waddr0 == 5'he; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_14 = io_wen0 & _T_221; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_223 = io_waddr1 == 5'he; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_14 = io_wen1 & _T_223; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_225 = io_waddr2 == 5'he; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_14 = io_wen2 & _T_225; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_228 = w0v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_229 = _T_228 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_231 = w1v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_232 = _T_231 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_233 = _T_229 | _T_232; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_235 = w2v_14 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_236 = _T_235 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_14 = _T_233 | _T_236; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_238 = io_waddr0 == 5'hf; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_15 = io_wen0 & _T_238; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_240 = io_waddr1 == 5'hf; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_15 = io_wen1 & _T_240; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_242 = io_waddr2 == 5'hf; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_15 = io_wen2 & _T_242; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_245 = w0v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_246 = _T_245 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_248 = w1v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_249 = _T_248 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_250 = _T_246 | _T_249; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_252 = w2v_15 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_253 = _T_252 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_15 = _T_250 | _T_253; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_255 = io_waddr0 == 5'h10; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_16 = io_wen0 & _T_255; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_257 = io_waddr1 == 5'h10; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_16 = io_wen1 & _T_257; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_259 = io_waddr2 == 5'h10; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_16 = io_wen2 & _T_259; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_262 = w0v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_263 = _T_262 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_265 = w1v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_266 = _T_265 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_267 = _T_263 | _T_266; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_269 = w2v_16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_270 = _T_269 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_16 = _T_267 | _T_270; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_272 = io_waddr0 == 5'h11; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_17 = io_wen0 & _T_272; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_274 = io_waddr1 == 5'h11; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_17 = io_wen1 & _T_274; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_276 = io_waddr2 == 5'h11; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_17 = io_wen2 & _T_276; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_279 = w0v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_280 = _T_279 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_282 = w1v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_283 = _T_282 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_284 = _T_280 | _T_283; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_286 = w2v_17 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_287 = _T_286 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_17 = _T_284 | _T_287; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_289 = io_waddr0 == 5'h12; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_18 = io_wen0 & _T_289; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_291 = io_waddr1 == 5'h12; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_18 = io_wen1 & _T_291; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_293 = io_waddr2 == 5'h12; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_18 = io_wen2 & _T_293; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_296 = w0v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_297 = _T_296 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_299 = w1v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_300 = _T_299 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_301 = _T_297 | _T_300; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_303 = w2v_18 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_304 = _T_303 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_18 = _T_301 | _T_304; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_306 = io_waddr0 == 5'h13; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_19 = io_wen0 & _T_306; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_308 = io_waddr1 == 5'h13; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_19 = io_wen1 & _T_308; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_310 = io_waddr2 == 5'h13; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_19 = io_wen2 & _T_310; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_313 = w0v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_314 = _T_313 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_316 = w1v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_317 = _T_316 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_318 = _T_314 | _T_317; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_320 = w2v_19 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_321 = _T_320 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_19 = _T_318 | _T_321; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_323 = io_waddr0 == 5'h14; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_20 = io_wen0 & _T_323; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_325 = io_waddr1 == 5'h14; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_20 = io_wen1 & _T_325; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_327 = io_waddr2 == 5'h14; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_20 = io_wen2 & _T_327; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_330 = w0v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_331 = _T_330 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_333 = w1v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_334 = _T_333 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_335 = _T_331 | _T_334; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_337 = w2v_20 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_338 = _T_337 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_20 = _T_335 | _T_338; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_340 = io_waddr0 == 5'h15; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_21 = io_wen0 & _T_340; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_342 = io_waddr1 == 5'h15; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_21 = io_wen1 & _T_342; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_344 = io_waddr2 == 5'h15; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_21 = io_wen2 & _T_344; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_347 = w0v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_348 = _T_347 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_350 = w1v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_351 = _T_350 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_352 = _T_348 | _T_351; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_354 = w2v_21 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_355 = _T_354 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_21 = _T_352 | _T_355; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_357 = io_waddr0 == 5'h16; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_22 = io_wen0 & _T_357; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_359 = io_waddr1 == 5'h16; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_22 = io_wen1 & _T_359; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_361 = io_waddr2 == 5'h16; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_22 = io_wen2 & _T_361; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_364 = w0v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_365 = _T_364 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_367 = w1v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_368 = _T_367 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_369 = _T_365 | _T_368; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_371 = w2v_22 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_372 = _T_371 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_22 = _T_369 | _T_372; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_374 = io_waddr0 == 5'h17; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_23 = io_wen0 & _T_374; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_376 = io_waddr1 == 5'h17; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_23 = io_wen1 & _T_376; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_378 = io_waddr2 == 5'h17; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_23 = io_wen2 & _T_378; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_381 = w0v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_382 = _T_381 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_384 = w1v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_385 = _T_384 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_386 = _T_382 | _T_385; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_388 = w2v_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_389 = _T_388 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_23 = _T_386 | _T_389; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_391 = io_waddr0 == 5'h18; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_24 = io_wen0 & _T_391; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_393 = io_waddr1 == 5'h18; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_24 = io_wen1 & _T_393; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_395 = io_waddr2 == 5'h18; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_24 = io_wen2 & _T_395; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_398 = w0v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_399 = _T_398 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_401 = w1v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_402 = _T_401 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_403 = _T_399 | _T_402; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_405 = w2v_24 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_406 = _T_405 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_24 = _T_403 | _T_406; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_408 = io_waddr0 == 5'h19; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_25 = io_wen0 & _T_408; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_410 = io_waddr1 == 5'h19; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_25 = io_wen1 & _T_410; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_412 = io_waddr2 == 5'h19; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_25 = io_wen2 & _T_412; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_415 = w0v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_416 = _T_415 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_418 = w1v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_419 = _T_418 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_420 = _T_416 | _T_419; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_422 = w2v_25 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_423 = _T_422 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_25 = _T_420 | _T_423; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_425 = io_waddr0 == 5'h1a; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_26 = io_wen0 & _T_425; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_427 = io_waddr1 == 5'h1a; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_26 = io_wen1 & _T_427; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_429 = io_waddr2 == 5'h1a; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_26 = io_wen2 & _T_429; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_432 = w0v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_433 = _T_432 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_435 = w1v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_436 = _T_435 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_437 = _T_433 | _T_436; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_439 = w2v_26 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_440 = _T_439 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_26 = _T_437 | _T_440; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_442 = io_waddr0 == 5'h1b; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_27 = io_wen0 & _T_442; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_444 = io_waddr1 == 5'h1b; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_27 = io_wen1 & _T_444; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_446 = io_waddr2 == 5'h1b; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_27 = io_wen2 & _T_446; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_449 = w0v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_450 = _T_449 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_452 = w1v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_453 = _T_452 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_454 = _T_450 | _T_453; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_456 = w2v_27 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_457 = _T_456 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_27 = _T_454 | _T_457; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_459 = io_waddr0 == 5'h1c; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_28 = io_wen0 & _T_459; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_461 = io_waddr1 == 5'h1c; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_28 = io_wen1 & _T_461; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_463 = io_waddr2 == 5'h1c; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_28 = io_wen2 & _T_463; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_466 = w0v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_467 = _T_466 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_469 = w1v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_470 = _T_469 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_471 = _T_467 | _T_470; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_473 = w2v_28 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_474 = _T_473 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_28 = _T_471 | _T_474; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_476 = io_waddr0 == 5'h1d; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_29 = io_wen0 & _T_476; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_478 = io_waddr1 == 5'h1d; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_29 = io_wen1 & _T_478; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_480 = io_waddr2 == 5'h1d; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_29 = io_wen2 & _T_480; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_483 = w0v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_484 = _T_483 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_486 = w1v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_487 = _T_486 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_488 = _T_484 | _T_487; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_490 = w2v_29 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_491 = _T_490 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_29 = _T_488 | _T_491; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_493 = io_waddr0 == 5'h1e; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_30 = io_wen0 & _T_493; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_495 = io_waddr1 == 5'h1e; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_30 = io_wen1 & _T_495; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_497 = io_waddr2 == 5'h1e; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_30 = io_wen2 & _T_497; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_500 = w0v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_501 = _T_500 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_503 = w1v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_504 = _T_503 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_505 = _T_501 | _T_504; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_507 = w2v_30 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_508 = _T_507 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_30 = _T_505 | _T_508; // @[dec_gpr_ctl.scala 55:88]
  wire  _T_510 = io_waddr0 == 5'h1f; // @[dec_gpr_ctl.scala 52:52]
  wire  w0v_31 = io_wen0 & _T_510; // @[dec_gpr_ctl.scala 52:40]
  wire  _T_512 = io_waddr1 == 5'h1f; // @[dec_gpr_ctl.scala 53:52]
  wire  w1v_31 = io_wen1 & _T_512; // @[dec_gpr_ctl.scala 53:40]
  wire  _T_514 = io_waddr2 == 5'h1f; // @[dec_gpr_ctl.scala 54:52]
  wire  w2v_31 = io_wen2 & _T_514; // @[dec_gpr_ctl.scala 54:40]
  wire [31:0] _T_517 = w0v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_518 = _T_517 & io_wd0; // @[dec_gpr_ctl.scala 55:49]
  wire [31:0] _T_520 = w1v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_521 = _T_520 & io_wd1; // @[dec_gpr_ctl.scala 55:78]
  wire [31:0] _T_522 = _T_518 | _T_521; // @[dec_gpr_ctl.scala 55:59]
  wire [31:0] _T_524 = w2v_31 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_525 = _T_524 & io_wd2; // @[dec_gpr_ctl.scala 55:107]
  wire [31:0] gpr_in_31 = _T_522 | _T_525; // @[dec_gpr_ctl.scala 55:88]
  wire [9:0] _T_535 = {w0v_9,w0v_8,w0v_7,w0v_6,w0v_5,w0v_4,w0v_3,w0v_2,w0v_1,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_544 = {w0v_18,w0v_17,w0v_16,w0v_15,w0v_14,w0v_13,w0v_12,w0v_11,w0v_10,_T_535}; // @[Cat.scala 29:58]
  wire [27:0] _T_553 = {w0v_27,w0v_26,w0v_25,w0v_24,w0v_23,w0v_22,w0v_21,w0v_20,w0v_19,_T_544}; // @[Cat.scala 29:58]
  wire [31:0] _T_557 = {w0v_31,w0v_30,w0v_29,w0v_28,_T_553}; // @[Cat.scala 29:58]
  wire [9:0] _T_566 = {w1v_9,w1v_8,w1v_7,w1v_6,w1v_5,w1v_4,w1v_3,w1v_2,w1v_1,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_575 = {w1v_18,w1v_17,w1v_16,w1v_15,w1v_14,w1v_13,w1v_12,w1v_11,w1v_10,_T_566}; // @[Cat.scala 29:58]
  wire [27:0] _T_584 = {w1v_27,w1v_26,w1v_25,w1v_24,w1v_23,w1v_22,w1v_21,w1v_20,w1v_19,_T_575}; // @[Cat.scala 29:58]
  wire [31:0] _T_588 = {w1v_31,w1v_30,w1v_29,w1v_28,_T_584}; // @[Cat.scala 29:58]
  wire [31:0] _T_589 = _T_557 | _T_588; // @[dec_gpr_ctl.scala 57:57]
  wire [9:0] _T_598 = {w2v_9,w2v_8,w2v_7,w2v_6,w2v_5,w2v_4,w2v_3,w2v_2,w2v_1,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_607 = {w2v_18,w2v_17,w2v_16,w2v_15,w2v_14,w2v_13,w2v_12,w2v_11,w2v_10,_T_598}; // @[Cat.scala 29:58]
  wire [27:0] _T_616 = {w2v_27,w2v_26,w2v_25,w2v_24,w2v_23,w2v_22,w2v_21,w2v_20,w2v_19,_T_607}; // @[Cat.scala 29:58]
  wire [31:0] _T_620 = {w2v_31,w2v_30,w2v_29,w2v_28,_T_616}; // @[Cat.scala 29:58]
  wire [31:0] gpr_wr_en = _T_589 | _T_620; // @[dec_gpr_ctl.scala 57:95]
  reg [31:0] gpr_out_1; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_2; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_3; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_4; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_5; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_6; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_7; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_8; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_9; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_10; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_11; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_12; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_13; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_14; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_15; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_16; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_17; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_18; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_19; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_20; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_21; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_22; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_23; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_24; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_25; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_26; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_27; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_28; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_29; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_30; // @[Reg.scala 27:20]
  reg [31:0] gpr_out_31; // @[Reg.scala 27:20]
  wire  _T_684 = io_raddr0 == 5'h1; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_686 = io_raddr0 == 5'h2; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_688 = io_raddr0 == 5'h3; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_690 = io_raddr0 == 5'h4; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_692 = io_raddr0 == 5'h5; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_694 = io_raddr0 == 5'h6; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_696 = io_raddr0 == 5'h7; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_698 = io_raddr0 == 5'h8; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_700 = io_raddr0 == 5'h9; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_702 = io_raddr0 == 5'ha; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_704 = io_raddr0 == 5'hb; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_706 = io_raddr0 == 5'hc; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_708 = io_raddr0 == 5'hd; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_710 = io_raddr0 == 5'he; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_712 = io_raddr0 == 5'hf; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_714 = io_raddr0 == 5'h10; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_716 = io_raddr0 == 5'h11; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_718 = io_raddr0 == 5'h12; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_720 = io_raddr0 == 5'h13; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_722 = io_raddr0 == 5'h14; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_724 = io_raddr0 == 5'h15; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_726 = io_raddr0 == 5'h16; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_728 = io_raddr0 == 5'h17; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_730 = io_raddr0 == 5'h18; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_732 = io_raddr0 == 5'h19; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_734 = io_raddr0 == 5'h1a; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_736 = io_raddr0 == 5'h1b; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_738 = io_raddr0 == 5'h1c; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_740 = io_raddr0 == 5'h1d; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_742 = io_raddr0 == 5'h1e; // @[dec_gpr_ctl.scala 64:72]
  wire  _T_744 = io_raddr0 == 5'h1f; // @[dec_gpr_ctl.scala 64:72]
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
  wire  _T_808 = io_raddr1 == 5'h1; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_810 = io_raddr1 == 5'h2; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_812 = io_raddr1 == 5'h3; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_814 = io_raddr1 == 5'h4; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_816 = io_raddr1 == 5'h5; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_818 = io_raddr1 == 5'h6; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_820 = io_raddr1 == 5'h7; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_822 = io_raddr1 == 5'h8; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_824 = io_raddr1 == 5'h9; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_826 = io_raddr1 == 5'ha; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_828 = io_raddr1 == 5'hb; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_830 = io_raddr1 == 5'hc; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_832 = io_raddr1 == 5'hd; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_834 = io_raddr1 == 5'he; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_836 = io_raddr1 == 5'hf; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_838 = io_raddr1 == 5'h10; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_840 = io_raddr1 == 5'h11; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_842 = io_raddr1 == 5'h12; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_844 = io_raddr1 == 5'h13; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_846 = io_raddr1 == 5'h14; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_848 = io_raddr1 == 5'h15; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_850 = io_raddr1 == 5'h16; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_852 = io_raddr1 == 5'h17; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_854 = io_raddr1 == 5'h18; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_856 = io_raddr1 == 5'h19; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_858 = io_raddr1 == 5'h1a; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_860 = io_raddr1 == 5'h1b; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_862 = io_raddr1 == 5'h1c; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_864 = io_raddr1 == 5'h1d; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_866 = io_raddr1 == 5'h1e; // @[dec_gpr_ctl.scala 65:72]
  wire  _T_868 = io_raddr1 == 5'h1f; // @[dec_gpr_ctl.scala 65:72]
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
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  rvclkhdr rvclkhdr_12 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en)
  );
  rvclkhdr rvclkhdr_13 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en)
  );
  rvclkhdr rvclkhdr_14 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en)
  );
  rvclkhdr rvclkhdr_15 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en)
  );
  rvclkhdr rvclkhdr_16 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en)
  );
  rvclkhdr rvclkhdr_17 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en)
  );
  rvclkhdr rvclkhdr_18 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en)
  );
  rvclkhdr rvclkhdr_19 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_19_io_clk),
    .io_en(rvclkhdr_19_io_en)
  );
  rvclkhdr rvclkhdr_20 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_20_io_clk),
    .io_en(rvclkhdr_20_io_en)
  );
  rvclkhdr rvclkhdr_21 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_21_io_clk),
    .io_en(rvclkhdr_21_io_en)
  );
  rvclkhdr rvclkhdr_22 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_22_io_clk),
    .io_en(rvclkhdr_22_io_en)
  );
  rvclkhdr rvclkhdr_23 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_23_io_clk),
    .io_en(rvclkhdr_23_io_en)
  );
  rvclkhdr rvclkhdr_24 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_24_io_clk),
    .io_en(rvclkhdr_24_io_en)
  );
  rvclkhdr rvclkhdr_25 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_25_io_clk),
    .io_en(rvclkhdr_25_io_en)
  );
  rvclkhdr rvclkhdr_26 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_26_io_clk),
    .io_en(rvclkhdr_26_io_en)
  );
  rvclkhdr rvclkhdr_27 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_27_io_clk),
    .io_en(rvclkhdr_27_io_en)
  );
  rvclkhdr rvclkhdr_28 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_28_io_clk),
    .io_en(rvclkhdr_28_io_en)
  );
  rvclkhdr rvclkhdr_29 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_29_io_clk),
    .io_en(rvclkhdr_29_io_en)
  );
  rvclkhdr rvclkhdr_30 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_30_io_clk),
    .io_en(rvclkhdr_30_io_en)
  );
  assign io_gpr_exu_gpr_i0_rs1_d = _T_805 | _T_776; // @[dec_gpr_ctl.scala 48:32 dec_gpr_ctl.scala 64:32]
  assign io_gpr_exu_gpr_i0_rs2_d = _T_929 | _T_900; // @[dec_gpr_ctl.scala 49:32 dec_gpr_ctl.scala 65:32]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = gpr_wr_en[1]; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = gpr_wr_en[2]; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = gpr_wr_en[3]; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = gpr_wr_en[4]; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = gpr_wr_en[5]; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = gpr_wr_en[6]; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = gpr_wr_en[7]; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = gpr_wr_en[8]; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = gpr_wr_en[9]; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = gpr_wr_en[10]; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = gpr_wr_en[11]; // @[lib.scala 407:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_11_io_en = gpr_wr_en[12]; // @[lib.scala 407:17]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_12_io_en = gpr_wr_en[13]; // @[lib.scala 407:17]
  assign rvclkhdr_13_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_13_io_en = gpr_wr_en[14]; // @[lib.scala 407:17]
  assign rvclkhdr_14_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_14_io_en = gpr_wr_en[15]; // @[lib.scala 407:17]
  assign rvclkhdr_15_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_15_io_en = gpr_wr_en[16]; // @[lib.scala 407:17]
  assign rvclkhdr_16_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_16_io_en = gpr_wr_en[17]; // @[lib.scala 407:17]
  assign rvclkhdr_17_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_17_io_en = gpr_wr_en[18]; // @[lib.scala 407:17]
  assign rvclkhdr_18_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_18_io_en = gpr_wr_en[19]; // @[lib.scala 407:17]
  assign rvclkhdr_19_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_19_io_en = gpr_wr_en[20]; // @[lib.scala 407:17]
  assign rvclkhdr_20_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_20_io_en = gpr_wr_en[21]; // @[lib.scala 407:17]
  assign rvclkhdr_21_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_21_io_en = gpr_wr_en[22]; // @[lib.scala 407:17]
  assign rvclkhdr_22_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_22_io_en = gpr_wr_en[23]; // @[lib.scala 407:17]
  assign rvclkhdr_23_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_23_io_en = gpr_wr_en[24]; // @[lib.scala 407:17]
  assign rvclkhdr_24_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_24_io_en = gpr_wr_en[25]; // @[lib.scala 407:17]
  assign rvclkhdr_25_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_25_io_en = gpr_wr_en[26]; // @[lib.scala 407:17]
  assign rvclkhdr_26_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_26_io_en = gpr_wr_en[27]; // @[lib.scala 407:17]
  assign rvclkhdr_27_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_27_io_en = gpr_wr_en[28]; // @[lib.scala 407:17]
  assign rvclkhdr_28_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_28_io_en = gpr_wr_en[29]; // @[lib.scala 407:17]
  assign rvclkhdr_29_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_29_io_en = gpr_wr_en[30]; // @[lib.scala 407:17]
  assign rvclkhdr_30_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_30_io_en = gpr_wr_en[31]; // @[lib.scala 407:17]
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_1 <= 32'h0;
    end else if (gpr_wr_en[1]) begin
      gpr_out_1 <= gpr_in_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_2 <= 32'h0;
    end else if (gpr_wr_en[2]) begin
      gpr_out_2 <= gpr_in_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_3 <= 32'h0;
    end else if (gpr_wr_en[3]) begin
      gpr_out_3 <= gpr_in_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_4 <= 32'h0;
    end else if (gpr_wr_en[4]) begin
      gpr_out_4 <= gpr_in_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_5 <= 32'h0;
    end else if (gpr_wr_en[5]) begin
      gpr_out_5 <= gpr_in_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_6 <= 32'h0;
    end else if (gpr_wr_en[6]) begin
      gpr_out_6 <= gpr_in_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_7 <= 32'h0;
    end else if (gpr_wr_en[7]) begin
      gpr_out_7 <= gpr_in_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_8 <= 32'h0;
    end else if (gpr_wr_en[8]) begin
      gpr_out_8 <= gpr_in_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_9 <= 32'h0;
    end else if (gpr_wr_en[9]) begin
      gpr_out_9 <= gpr_in_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_10 <= 32'h0;
    end else if (gpr_wr_en[10]) begin
      gpr_out_10 <= gpr_in_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_11 <= 32'h0;
    end else if (gpr_wr_en[11]) begin
      gpr_out_11 <= gpr_in_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_12 <= 32'h0;
    end else if (gpr_wr_en[12]) begin
      gpr_out_12 <= gpr_in_12;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_13 <= 32'h0;
    end else if (gpr_wr_en[13]) begin
      gpr_out_13 <= gpr_in_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_14 <= 32'h0;
    end else if (gpr_wr_en[14]) begin
      gpr_out_14 <= gpr_in_14;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_15 <= 32'h0;
    end else if (gpr_wr_en[15]) begin
      gpr_out_15 <= gpr_in_15;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_16 <= 32'h0;
    end else if (gpr_wr_en[16]) begin
      gpr_out_16 <= gpr_in_16;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_17 <= 32'h0;
    end else if (gpr_wr_en[17]) begin
      gpr_out_17 <= gpr_in_17;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_18 <= 32'h0;
    end else if (gpr_wr_en[18]) begin
      gpr_out_18 <= gpr_in_18;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_19 <= 32'h0;
    end else if (gpr_wr_en[19]) begin
      gpr_out_19 <= gpr_in_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_20 <= 32'h0;
    end else if (gpr_wr_en[20]) begin
      gpr_out_20 <= gpr_in_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_21 <= 32'h0;
    end else if (gpr_wr_en[21]) begin
      gpr_out_21 <= gpr_in_21;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_22 <= 32'h0;
    end else if (gpr_wr_en[22]) begin
      gpr_out_22 <= gpr_in_22;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_23 <= 32'h0;
    end else if (gpr_wr_en[23]) begin
      gpr_out_23 <= gpr_in_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_24 <= 32'h0;
    end else if (gpr_wr_en[24]) begin
      gpr_out_24 <= gpr_in_24;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_25 <= 32'h0;
    end else if (gpr_wr_en[25]) begin
      gpr_out_25 <= gpr_in_25;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_26 <= 32'h0;
    end else if (gpr_wr_en[26]) begin
      gpr_out_26 <= gpr_in_26;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_27 <= 32'h0;
    end else if (gpr_wr_en[27]) begin
      gpr_out_27 <= gpr_in_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_28 <= 32'h0;
    end else if (gpr_wr_en[28]) begin
      gpr_out_28 <= gpr_in_28;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_29 <= 32'h0;
    end else if (gpr_wr_en[29]) begin
      gpr_out_29 <= gpr_in_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_30 <= 32'h0;
    end else if (gpr_wr_en[30]) begin
      gpr_out_30 <= gpr_in_30;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      gpr_out_31 <= 32'h0;
    end else if (gpr_wr_en[31]) begin
      gpr_out_31 <= gpr_in_31;
    end
  end
endmodule
module int_exc(
  input         clock,
  input         reset,
  output        io_mhwakeup_ready,
  output        io_ext_int_ready,
  output        io_ce_int_ready,
  output        io_soft_int_ready,
  output        io_timer_int_ready,
  output        io_int_timer0_int_hold,
  output        io_int_timer1_int_hold,
  output        io_internal_dbg_halt_timers,
  output        io_take_ext_int_start,
  input         io_ext_int_freeze_d1,
  input         io_take_ext_int_start_d1,
  input         io_take_ext_int_start_d2,
  input         io_take_ext_int_start_d3,
  output        io_ext_int_freeze,
  output        io_take_ext_int,
  output        io_fast_int_meicpct,
  output        io_ignore_ext_int_due_to_lsu_stall,
  output        io_take_ce_int,
  output        io_take_soft_int,
  output        io_take_timer_int,
  output        io_take_int_timer0_int,
  output        io_take_int_timer1_int,
  output        io_take_reset,
  output        io_take_nmi,
  output        io_synchronous_flush_r,
  output        io_tlu_flush_lower_r,
  output        io_dec_tlu_flush_lower_wb,
  output        io_dec_tlu_flush_lower_r,
  output [30:0] io_dec_tlu_flush_path_r,
  output        io_interrupt_valid_r_d1,
  output        io_i0_exception_valid_r_d1,
  output        io_exc_or_int_valid_r_d1,
  output [4:0]  io_exc_cause_wb,
  output        io_i0_valid_wb,
  output        io_trigger_hit_r_d1,
  output        io_take_nmi_r_d1,
  output        io_interrupt_valid_r,
  output [4:0]  io_exc_cause_r,
  output        io_i0_exception_valid_r,
  output [30:0] io_tlu_flush_path_r_d1,
  output        io_exc_or_int_valid_r,
  input         io_dec_csr_stall_int_ff,
  input         io_mstatus_mie_ns,
  input  [5:0]  io_mip,
  input  [5:0]  io_mie_ns,
  input         io_mret_r,
  input         io_pmu_fw_tlu_halted_f,
  input         io_int_timer0_int_hold_f,
  input         io_int_timer1_int_hold_f,
  input         io_internal_dbg_halt_mode_f,
  input         io_dcsr_single_step_running,
  input         io_internal_dbg_halt_mode,
  input         io_dec_tlu_i0_valid_r,
  input         io_internal_pmu_fw_halt_mode,
  input         io_i_cpu_halt_req_d1,
  input         io_ebreak_to_debug_mode_r,
  input  [1:0]  io_lsu_fir_error,
  input         io_csr_pkt_csr_meicpct,
  input         io_dec_csr_any_unq_d,
  input         io_lsu_fastint_stall_any,
  input         io_reset_delayed,
  input         io_mpc_reset_run_req,
  input         io_nmi_int_detected,
  input         io_dcsr_single_step_running_f,
  input         io_dcsr_single_step_done_f,
  input  [15:0] io_dcsr,
  input  [30:0] io_mtvec,
  input         io_tlu_i0_commit_cmt,
  input         io_i0_trigger_hit_r,
  input         io_pause_expired_r,
  input  [30:0] io_nmi_vec,
  input         io_lsu_i0_rfnpc_r,
  input         io_fence_i_r,
  input         io_iccm_repair_state_rfnpc,
  input         io_i_cpu_run_req_d1,
  input         io_rfpc_i0_r,
  input         io_lsu_exc_valid_r,
  input         io_trigger_hit_dmode_r,
  input         io_take_halt,
  input  [30:0] io_rst_vec,
  input  [30:0] io_lsu_fir_addr,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input  [30:0] io_npc_r,
  input  [30:0] io_mepc,
  input         io_debug_resume_req_f,
  input  [30:0] io_dpc,
  input  [30:0] io_npc_r_d1,
  input         io_tlu_flush_lower_r_d1,
  input         io_dec_tlu_dbg_halted,
  input         io_ebreak_r,
  input         io_ecall_r,
  input         io_illegal_r,
  input         io_inst_acc_r,
  input         io_lsu_i0_exc_r,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input         io_dec_tlu_wr_pause_r_d1
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
  wire  _T = ~io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 3017:48]
  wire  lsu_exc_ma_r = io_lsu_i0_exc_r & _T; // @[dec_tlu_ctl.scala 3017:46]
  wire  lsu_exc_acc_r = io_lsu_i0_exc_r & io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 3018:46]
  wire  lsu_exc_st_r = io_lsu_i0_exc_r & io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 3019:46]
  wire  _T_1 = io_ebreak_r | io_ecall_r; // @[dec_tlu_ctl.scala 3031:49]
  wire  _T_2 = _T_1 | io_illegal_r; // @[dec_tlu_ctl.scala 3031:62]
  wire  _T_3 = _T_2 | io_inst_acc_r; // @[dec_tlu_ctl.scala 3031:77]
  wire  _T_4 = ~io_rfpc_i0_r; // @[dec_tlu_ctl.scala 3031:96]
  wire  _T_5 = _T_3 & _T_4; // @[dec_tlu_ctl.scala 3031:94]
  wire  _T_6 = ~io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 3031:112]
  wire [4:0] _T_9 = io_take_nmi ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_10 = ~_T_9; // @[dec_tlu_ctl.scala 3039:27]
  wire  _T_20 = io_ebreak_r | io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 3049:31]
  wire  _T_22 = ~lsu_exc_st_r; // @[dec_tlu_ctl.scala 3050:33]
  wire  _T_23 = lsu_exc_ma_r & _T_22; // @[dec_tlu_ctl.scala 3050:31]
  wire  _T_26 = lsu_exc_acc_r & _T_22; // @[dec_tlu_ctl.scala 3051:32]
  wire  _T_28 = lsu_exc_ma_r & lsu_exc_st_r; // @[dec_tlu_ctl.scala 3052:31]
  wire  _T_30 = lsu_exc_acc_r & lsu_exc_st_r; // @[dec_tlu_ctl.scala 3053:32]
  wire [4:0] _T_32 = io_take_ext_int ? 5'hb : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_33 = io_take_timer_int ? 5'h7 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_34 = io_take_soft_int ? 5'h3 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_35 = io_take_int_timer0_int ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_36 = io_take_int_timer1_int ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_37 = io_take_ce_int ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_38 = io_illegal_r ? 5'h2 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_39 = io_ecall_r ? 5'hb : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_40 = io_inst_acc_r ? 5'h1 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_41 = _T_20 ? 5'h3 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_42 = _T_23 ? 5'h4 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_43 = _T_26 ? 5'h5 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_44 = _T_28 ? 5'h6 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_45 = _T_30 ? 5'h7 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_46 = _T_32 | _T_33; // @[Mux.scala 27:72]
  wire [4:0] _T_47 = _T_46 | _T_34; // @[Mux.scala 27:72]
  wire [4:0] _T_48 = _T_47 | _T_35; // @[Mux.scala 27:72]
  wire [4:0] _T_49 = _T_48 | _T_36; // @[Mux.scala 27:72]
  wire [4:0] _T_50 = _T_49 | _T_37; // @[Mux.scala 27:72]
  wire [4:0] _T_51 = _T_50 | _T_38; // @[Mux.scala 27:72]
  wire [4:0] _T_52 = _T_51 | _T_39; // @[Mux.scala 27:72]
  wire [4:0] _T_53 = _T_52 | _T_40; // @[Mux.scala 27:72]
  wire [4:0] _T_54 = _T_53 | _T_41; // @[Mux.scala 27:72]
  wire [4:0] _T_55 = _T_54 | _T_42; // @[Mux.scala 27:72]
  wire [4:0] _T_56 = _T_55 | _T_43; // @[Mux.scala 27:72]
  wire [4:0] _T_57 = _T_56 | _T_44; // @[Mux.scala 27:72]
  wire [4:0] _T_58 = _T_57 | _T_45; // @[Mux.scala 27:72]
  wire  _T_61 = ~io_dec_csr_stall_int_ff; // @[dec_tlu_ctl.scala 3064:31]
  wire  _T_62 = _T_61 & io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 3064:56]
  wire  _T_64 = _T_62 & io_mip[2]; // @[dec_tlu_ctl.scala 3064:76]
  wire  _T_66 = _T_64 & io_mie_ns[2]; // @[dec_tlu_ctl.scala 3064:97]
  wire  _T_73 = ~io_ignore_ext_int_due_to_lsu_stall; // @[dec_tlu_ctl.scala 3065:121]
  wire [5:0] _T_77 = {{5'd0}, io_mip[5]}; // @[dec_tlu_ctl.scala 3066:84]
  wire  _T_79 = _T_62 & _T_77[0]; // @[dec_tlu_ctl.scala 3066:76]
  wire  _T_85 = _T_62 & io_mip[0]; // @[dec_tlu_ctl.scala 3067:76]
  wire  _T_91 = _T_62 & io_mip[1]; // @[dec_tlu_ctl.scala 3068:76]
  wire  int_timer0_int_possible = io_mstatus_mie_ns & io_mie_ns[4]; // @[dec_tlu_ctl.scala 3071:57]
  wire [5:0] _T_95 = {{4'd0}, io_mip[5:4]}; // @[dec_tlu_ctl.scala 3072:42]
  wire  int_timer0_int_ready = _T_95[0] & int_timer0_int_possible; // @[dec_tlu_ctl.scala 3072:55]
  wire  int_timer1_int_possible = io_mstatus_mie_ns & io_mie_ns[3]; // @[dec_tlu_ctl.scala 3073:57]
  wire [5:0] _T_98 = {{3'd0}, io_mip[5:3]}; // @[dec_tlu_ctl.scala 3074:42]
  wire  int_timer1_int_ready = _T_98[0] & int_timer1_int_possible; // @[dec_tlu_ctl.scala 3074:55]
  wire  _T_100 = io_dec_csr_stall_int_ff | io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3078:57]
  wire  _T_101 = _T_100 | io_exc_or_int_valid_r_d1; // @[dec_tlu_ctl.scala 3078:82]
  wire  int_timer_stalled = _T_101 | io_mret_r; // @[dec_tlu_ctl.scala 3078:109]
  wire  _T_102 = io_pmu_fw_tlu_halted_f | int_timer_stalled; // @[dec_tlu_ctl.scala 3080:83]
  wire  _T_103 = int_timer0_int_ready & _T_102; // @[dec_tlu_ctl.scala 3080:57]
  wire  _T_104 = int_timer0_int_possible & io_int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 3080:132]
  wire  _T_105 = ~io_interrupt_valid_r; // @[dec_tlu_ctl.scala 3080:161]
  wire  _T_106 = _T_104 & _T_105; // @[dec_tlu_ctl.scala 3080:159]
  wire  _T_107 = ~io_take_ext_int_start; // @[dec_tlu_ctl.scala 3080:185]
  wire  _T_108 = _T_106 & _T_107; // @[dec_tlu_ctl.scala 3080:183]
  wire  _T_109 = ~io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 3080:210]
  wire  _T_110 = _T_108 & _T_109; // @[dec_tlu_ctl.scala 3080:208]
  wire  _T_113 = int_timer1_int_ready & _T_102; // @[dec_tlu_ctl.scala 3081:57]
  wire  _T_114 = int_timer1_int_possible & io_int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 3081:132]
  wire  _T_116 = _T_114 & _T_105; // @[dec_tlu_ctl.scala 3081:159]
  wire  _T_118 = _T_116 & _T_107; // @[dec_tlu_ctl.scala 3081:183]
  wire  _T_120 = _T_118 & _T_109; // @[dec_tlu_ctl.scala 3081:208]
  wire  _T_122 = ~io_dcsr_single_step_running; // @[dec_tlu_ctl.scala 3083:70]
  wire  _T_125 = _T_122 | io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 3085:92]
  wire  _T_126 = io_internal_dbg_halt_mode & _T_125; // @[dec_tlu_ctl.scala 3085:60]
  wire  _T_127 = _T_126 | io_internal_pmu_fw_halt_mode; // @[dec_tlu_ctl.scala 3085:118]
  wire  _T_128 = _T_127 | io_i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 3085:149]
  wire  _T_129 = _T_128 | io_take_nmi; // @[dec_tlu_ctl.scala 3085:172]
  wire  _T_130 = _T_129 | io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 3085:186]
  wire  _T_131 = _T_130 | io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3085:214]
  wire  _T_132 = _T_131 | io_exc_or_int_valid_r_d1; // @[dec_tlu_ctl.scala 3085:240]
  wire  _T_133 = _T_132 | io_mret_r; // @[dec_tlu_ctl.scala 3085:267]
  wire  block_interrupts = _T_133 | io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 3085:279]
  wire  _T_134 = ~block_interrupts; // @[dec_tlu_ctl.scala 3093:61]
  wire  _T_136 = io_take_ext_int_start | io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 3094:60]
  wire  _T_137 = _T_136 | io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 3094:87]
  wire  _T_139 = |io_lsu_fir_error; // @[dec_tlu_ctl.scala 3095:81]
  wire  _T_140 = ~_T_139; // @[dec_tlu_ctl.scala 3095:63]
  wire  _T_141 = io_take_ext_int_start_d3 & _T_140; // @[dec_tlu_ctl.scala 3095:61]
  wire  _T_143 = ~io_ext_int_ready; // @[dec_tlu_ctl.scala 3110:46]
  wire  _T_144 = io_ce_int_ready & _T_143; // @[dec_tlu_ctl.scala 3110:44]
  wire  _T_148 = io_soft_int_ready & _T_143; // @[dec_tlu_ctl.scala 3111:47]
  wire  _T_149 = ~io_ce_int_ready; // @[dec_tlu_ctl.scala 3111:69]
  wire  _T_150 = _T_148 & _T_149; // @[dec_tlu_ctl.scala 3111:67]
  wire  _T_153 = ~io_soft_int_ready; // @[dec_tlu_ctl.scala 3112:51]
  wire  _T_154 = io_timer_int_ready & _T_153; // @[dec_tlu_ctl.scala 3112:49]
  wire  _T_156 = _T_154 & _T_143; // @[dec_tlu_ctl.scala 3112:70]
  wire  _T_158 = _T_156 & _T_149; // @[dec_tlu_ctl.scala 3112:90]
  wire  _T_161 = int_timer0_int_ready | io_int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 3113:57]
  wire  _T_162 = _T_161 & int_timer0_int_possible; // @[dec_tlu_ctl.scala 3113:85]
  wire  _T_164 = _T_162 & _T_61; // @[dec_tlu_ctl.scala 3113:111]
  wire  _T_165 = ~io_timer_int_ready; // @[dec_tlu_ctl.scala 3113:140]
  wire  _T_166 = _T_164 & _T_165; // @[dec_tlu_ctl.scala 3113:138]
  wire  _T_168 = _T_166 & _T_153; // @[dec_tlu_ctl.scala 3113:160]
  wire  _T_170 = _T_168 & _T_143; // @[dec_tlu_ctl.scala 3113:181]
  wire  _T_172 = _T_170 & _T_149; // @[dec_tlu_ctl.scala 3113:201]
  wire  _T_175 = int_timer1_int_ready | io_int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 3114:57]
  wire  _T_176 = _T_175 & int_timer1_int_possible; // @[dec_tlu_ctl.scala 3114:85]
  wire  _T_178 = _T_176 & _T_61; // @[dec_tlu_ctl.scala 3114:111]
  wire  _T_180 = ~_T_161; // @[dec_tlu_ctl.scala 3114:140]
  wire  _T_181 = _T_178 & _T_180; // @[dec_tlu_ctl.scala 3114:138]
  wire  _T_183 = _T_181 & _T_165; // @[dec_tlu_ctl.scala 3114:191]
  wire  _T_185 = _T_183 & _T_153; // @[dec_tlu_ctl.scala 3114:213]
  wire  _T_187 = _T_185 & _T_143; // @[dec_tlu_ctl.scala 3114:234]
  wire  _T_189 = _T_187 & _T_149; // @[dec_tlu_ctl.scala 3114:254]
  wire  _T_193 = ~io_internal_pmu_fw_halt_mode; // @[dec_tlu_ctl.scala 3116:46]
  wire  _T_194 = io_nmi_int_detected & _T_193; // @[dec_tlu_ctl.scala 3116:44]
  wire  _T_195 = ~io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 3116:79]
  wire  _T_197 = io_dcsr_single_step_running_f & io_dcsr[11]; // @[dec_tlu_ctl.scala 3116:139]
  wire  _T_198 = ~io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 3116:164]
  wire  _T_199 = _T_197 & _T_198; // @[dec_tlu_ctl.scala 3116:162]
  wire  _T_200 = ~io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 3116:189]
  wire  _T_201 = _T_199 & _T_200; // @[dec_tlu_ctl.scala 3116:187]
  wire  _T_202 = _T_195 | _T_201; // @[dec_tlu_ctl.scala 3116:106]
  wire  _T_203 = _T_194 & _T_202; // @[dec_tlu_ctl.scala 3116:76]
  wire  _T_204 = ~io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3116:220]
  wire  _T_205 = _T_203 & _T_204; // @[dec_tlu_ctl.scala 3116:218]
  wire  _T_206 = ~io_mret_r; // @[dec_tlu_ctl.scala 3116:246]
  wire  _T_207 = _T_205 & _T_206; // @[dec_tlu_ctl.scala 3116:244]
  wire  _T_208 = ~io_take_reset; // @[dec_tlu_ctl.scala 3116:259]
  wire  _T_209 = _T_207 & _T_208; // @[dec_tlu_ctl.scala 3116:257]
  wire  _T_210 = ~io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 3116:276]
  wire  _T_211 = _T_209 & _T_210; // @[dec_tlu_ctl.scala 3116:274]
  wire  _T_212 = ~io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 3116:306]
  wire  _T_214 = io_take_ext_int_start_d3 & _T_139; // @[dec_tlu_ctl.scala 3116:356]
  wire  _T_215 = _T_212 | _T_214; // @[dec_tlu_ctl.scala 3116:328]
  wire  _T_217 = io_take_ext_int | io_take_timer_int; // @[dec_tlu_ctl.scala 3120:49]
  wire  _T_218 = _T_217 | io_take_soft_int; // @[dec_tlu_ctl.scala 3120:69]
  wire  _T_219 = _T_218 | io_take_nmi; // @[dec_tlu_ctl.scala 3120:88]
  wire  _T_220 = _T_219 | io_take_ce_int; // @[dec_tlu_ctl.scala 3120:102]
  wire  _T_221 = _T_220 | io_take_int_timer0_int; // @[dec_tlu_ctl.scala 3120:119]
  wire [30:0] _T_224 = {io_mtvec[30:1],1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_226 = {25'h0,io_exc_cause_r,1'h0}; // @[Cat.scala 29:58]
  wire [30:0] vectored_path = _T_224 + _T_226; // @[dec_tlu_ctl.scala 3125:59]
  wire [30:0] _T_233 = io_mtvec[0] ? vectored_path : _T_224; // @[dec_tlu_ctl.scala 3126:69]
  wire [30:0] interrupt_path = io_take_nmi ? io_nmi_vec : _T_233; // @[dec_tlu_ctl.scala 3126:33]
  wire  _T_234 = io_lsu_i0_rfnpc_r | io_fence_i_r; // @[dec_tlu_ctl.scala 3127:44]
  wire  _T_235 = _T_234 | io_iccm_repair_state_rfnpc; // @[dec_tlu_ctl.scala 3127:59]
  wire  _T_237 = io_i_cpu_run_req_d1 & _T_105; // @[dec_tlu_ctl.scala 3127:111]
  wire  _T_238 = _T_235 | _T_237; // @[dec_tlu_ctl.scala 3127:88]
  wire  _T_240 = io_rfpc_i0_r & _T_198; // @[dec_tlu_ctl.scala 3127:152]
  wire  sel_npc_r = _T_238 | _T_240; // @[dec_tlu_ctl.scala 3127:136]
  wire  _T_241 = io_i_cpu_run_req_d1 & io_pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 3128:51]
  wire  sel_npc_resume = _T_241 | io_pause_expired_r; // @[dec_tlu_ctl.scala 3128:77]
  wire  _T_244 = io_i0_exception_valid_r | io_rfpc_i0_r; // @[dec_tlu_ctl.scala 3130:60]
  wire  _T_245 = _T_244 | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 3130:75]
  wire  _T_246 = _T_245 | io_fence_i_r; // @[dec_tlu_ctl.scala 3130:96]
  wire  _T_247 = _T_246 | io_lsu_i0_rfnpc_r; // @[dec_tlu_ctl.scala 3130:111]
  wire  _T_248 = _T_247 | io_iccm_repair_state_rfnpc; // @[dec_tlu_ctl.scala 3130:131]
  wire  _T_249 = _T_248 | io_debug_resume_req_f; // @[dec_tlu_ctl.scala 3130:161]
  wire  _T_250 = _T_249 | sel_npc_resume; // @[dec_tlu_ctl.scala 3130:186]
  wire  _T_251 = _T_250 | io_dec_tlu_wr_pause_r_d1; // @[dec_tlu_ctl.scala 3130:204]
  wire  _T_253 = io_interrupt_valid_r | io_mret_r; // @[dec_tlu_ctl.scala 3131:54]
  wire  _T_254 = _T_253 | io_synchronous_flush_r; // @[dec_tlu_ctl.scala 3131:66]
  wire  _T_255 = _T_254 | io_take_halt; // @[dec_tlu_ctl.scala 3131:91]
  wire  _T_256 = _T_255 | io_take_reset; // @[dec_tlu_ctl.scala 3131:106]
  wire  _T_260 = ~io_take_nmi; // @[dec_tlu_ctl.scala 3135:29]
  wire  _T_262 = _T_260 & sel_npc_r; // @[dec_tlu_ctl.scala 3135:36]
  wire  _T_265 = _T_260 & io_rfpc_i0_r; // @[dec_tlu_ctl.scala 3136:36]
  wire  _T_267 = _T_265 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 3136:57]
  wire  _T_268 = ~sel_npc_r; // @[dec_tlu_ctl.scala 3136:98]
  wire  _T_269 = _T_267 & _T_268; // @[dec_tlu_ctl.scala 3136:87]
  wire  _T_271 = ~_T_141; // @[dec_tlu_ctl.scala 3137:59]
  wire  _T_272 = io_interrupt_valid_r & _T_271; // @[dec_tlu_ctl.scala 3137:45]
  wire  _T_273 = io_i0_exception_valid_r | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 3138:43]
  wire  _T_274 = ~io_trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 3138:89]
  wire  _T_275 = io_i0_trigger_hit_r & _T_274; // @[dec_tlu_ctl.scala 3138:87]
  wire  _T_276 = _T_273 | _T_275; // @[dec_tlu_ctl.scala 3138:64]
  wire  _T_278 = _T_276 & _T_105; // @[dec_tlu_ctl.scala 3138:115]
  wire  _T_280 = _T_278 & _T_271; // @[dec_tlu_ctl.scala 3138:139]
  wire  _T_285 = _T_260 & io_mret_r; // @[dec_tlu_ctl.scala 3139:31]
  wire  _T_288 = _T_260 & io_debug_resume_req_f; // @[dec_tlu_ctl.scala 3140:31]
  wire  _T_291 = _T_260 & sel_npc_resume; // @[dec_tlu_ctl.scala 3141:31]
  wire [30:0] _T_293 = _T_141 ? io_lsu_fir_addr : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_294 = _T_262 ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_295 = _T_269 ? io_dec_tlu_i0_pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_296 = _T_272 ? interrupt_path : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_297 = _T_280 ? _T_224 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_298 = _T_285 ? io_mepc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_299 = _T_288 ? io_dpc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_300 = _T_291 ? io_npc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_301 = _T_293 | _T_294; // @[Mux.scala 27:72]
  wire [30:0] _T_302 = _T_301 | _T_295; // @[Mux.scala 27:72]
  wire [30:0] _T_303 = _T_302 | _T_296; // @[Mux.scala 27:72]
  wire [30:0] _T_304 = _T_303 | _T_297; // @[Mux.scala 27:72]
  wire [30:0] _T_305 = _T_304 | _T_298; // @[Mux.scala 27:72]
  wire [30:0] _T_306 = _T_305 | _T_299; // @[Mux.scala 27:72]
  wire [30:0] _T_307 = _T_306 | _T_300; // @[Mux.scala 27:72]
  reg [30:0] _T_311; // @[Reg.scala 27:20]
  wire  _T_312 = io_lsu_exc_valid_r | io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 3152:53]
  wire  _T_313 = _T_312 | io_interrupt_valid_r; // @[dec_tlu_ctl.scala 3152:79]
  reg  _T_320; // @[Reg.scala 27:20]
  wire  _T_318 = io_interrupt_valid_r ^ _T_320; // @[lib.scala 448:21]
  wire  _T_319 = |_T_318; // @[lib.scala 448:29]
  reg  _T_324; // @[Reg.scala 27:20]
  wire  _T_322 = io_i0_exception_valid_r ^ _T_324; // @[lib.scala 448:21]
  wire  _T_323 = |_T_322; // @[lib.scala 448:29]
  reg  _T_328; // @[Reg.scala 27:20]
  wire  _T_326 = io_exc_or_int_valid_r ^ _T_328; // @[lib.scala 448:21]
  wire  _T_327 = |_T_326; // @[lib.scala 448:29]
  reg [4:0] _T_332; // @[Reg.scala 27:20]
  wire [4:0] _T_330 = io_exc_cause_r ^ _T_332; // @[lib.scala 448:21]
  wire  _T_331 = |_T_330; // @[lib.scala 448:29]
  wire  _T_333 = ~io_illegal_r; // @[dec_tlu_ctl.scala 3158:104]
  wire  _T_334 = io_tlu_i0_commit_cmt & _T_333; // @[dec_tlu_ctl.scala 3158:102]
  reg  _T_338; // @[Reg.scala 27:20]
  wire  _T_336 = _T_334 ^ _T_338; // @[lib.scala 448:21]
  wire  _T_337 = |_T_336; // @[lib.scala 448:29]
  reg  _T_342; // @[Reg.scala 27:20]
  wire  _T_340 = io_i0_trigger_hit_r ^ _T_342; // @[lib.scala 448:21]
  wire  _T_341 = |_T_340; // @[lib.scala 448:29]
  reg  _T_346; // @[Reg.scala 27:20]
  wire  _T_344 = io_take_nmi ^ _T_346; // @[lib.scala 448:21]
  wire  _T_345 = |_T_344; // @[lib.scala 448:29]
  assign io_mhwakeup_ready = _T_64 & io_mie_ns[2]; // @[dec_tlu_ctl.scala 3064:28]
  assign io_ext_int_ready = _T_66 & _T_73; // @[dec_tlu_ctl.scala 3065:28]
  assign io_ce_int_ready = _T_79 & io_mie_ns[5]; // @[dec_tlu_ctl.scala 3066:28]
  assign io_soft_int_ready = _T_85 & io_mie_ns[0]; // @[dec_tlu_ctl.scala 3067:28]
  assign io_timer_int_ready = _T_91 & io_mie_ns[1]; // @[dec_tlu_ctl.scala 3068:28]
  assign io_int_timer0_int_hold = _T_103 | _T_110; // @[dec_tlu_ctl.scala 3080:32]
  assign io_int_timer1_int_hold = _T_113 | _T_120; // @[dec_tlu_ctl.scala 3081:32]
  assign io_internal_dbg_halt_timers = io_internal_dbg_halt_mode_f & _T_122; // @[dec_tlu_ctl.scala 3083:37]
  assign io_take_ext_int_start = io_ext_int_ready & _T_134; // @[dec_tlu_ctl.scala 3093:39]
  assign io_ext_int_freeze = _T_137 | io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 3094:35]
  assign io_take_ext_int = io_take_ext_int_start_d3 & _T_140; // @[dec_tlu_ctl.scala 3095:33]
  assign io_fast_int_meicpct = io_csr_pkt_csr_meicpct & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 3096:37]
  assign io_ignore_ext_int_due_to_lsu_stall = io_lsu_fastint_stall_any; // @[dec_tlu_ctl.scala 3097:52]
  assign io_take_ce_int = _T_144 & _T_134; // @[dec_tlu_ctl.scala 3110:25]
  assign io_take_soft_int = _T_150 & _T_134; // @[dec_tlu_ctl.scala 3111:26]
  assign io_take_timer_int = _T_158 & _T_134; // @[dec_tlu_ctl.scala 3112:27]
  assign io_take_int_timer0_int = _T_172 & _T_134; // @[dec_tlu_ctl.scala 3113:32]
  assign io_take_int_timer1_int = _T_189 & _T_134; // @[dec_tlu_ctl.scala 3114:32]
  assign io_take_reset = io_reset_delayed & io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 3115:23]
  assign io_take_nmi = _T_211 & _T_215; // @[dec_tlu_ctl.scala 3116:21]
  assign io_synchronous_flush_r = _T_251 | io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 3130:33]
  assign io_tlu_flush_lower_r = _T_256 | io_take_ext_int_start; // @[dec_tlu_ctl.scala 3131:30]
  assign io_dec_tlu_flush_lower_wb = io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 3146:41]
  assign io_dec_tlu_flush_lower_r = io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 3148:41]
  assign io_dec_tlu_flush_path_r = io_take_reset ? io_rst_vec : _T_307; // @[dec_tlu_ctl.scala 3149:41]
  assign io_interrupt_valid_r_d1 = _T_320; // @[dec_tlu_ctl.scala 3154:59]
  assign io_i0_exception_valid_r_d1 = _T_324; // @[dec_tlu_ctl.scala 3155:51]
  assign io_exc_or_int_valid_r_d1 = _T_328; // @[dec_tlu_ctl.scala 3156:53]
  assign io_exc_cause_wb = _T_332; // @[dec_tlu_ctl.scala 3157:65]
  assign io_i0_valid_wb = _T_338; // @[dec_tlu_ctl.scala 3158:71]
  assign io_trigger_hit_r_d1 = _T_342; // @[dec_tlu_ctl.scala 3159:63]
  assign io_take_nmi_r_d1 = _T_346; // @[dec_tlu_ctl.scala 3160:73]
  assign io_interrupt_valid_r = _T_221 | io_take_int_timer1_int; // @[dec_tlu_ctl.scala 3120:30]
  assign io_exc_cause_r = _T_10 & _T_58; // @[dec_tlu_ctl.scala 3039:24]
  assign io_i0_exception_valid_r = _T_5 & _T_6; // @[dec_tlu_ctl.scala 3031:33]
  assign io_tlu_flush_path_r_d1 = _T_311; // @[dec_tlu_ctl.scala 3144:31]
  assign io_exc_or_int_valid_r = _T_313 | _T_275; // @[dec_tlu_ctl.scala 3152:31]
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
  _T_311 = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  _T_320 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_324 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_328 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_332 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  _T_338 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_342 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_346 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_311 = 31'h0;
  end
  if (reset) begin
    _T_320 = 1'h0;
  end
  if (reset) begin
    _T_324 = 1'h0;
  end
  if (reset) begin
    _T_328 = 1'h0;
  end
  if (reset) begin
    _T_332 = 5'h0;
  end
  if (reset) begin
    _T_338 = 1'h0;
  end
  if (reset) begin
    _T_342 = 1'h0;
  end
  if (reset) begin
    _T_346 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_311 <= 31'h0;
    end else if (io_tlu_flush_lower_r) begin
      if (io_take_reset) begin
        _T_311 <= io_rst_vec;
      end else begin
        _T_311 <= _T_307;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_320 <= 1'h0;
    end else if (_T_319) begin
      _T_320 <= io_interrupt_valid_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_324 <= 1'h0;
    end else if (_T_323) begin
      _T_324 <= io_i0_exception_valid_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_328 <= 1'h0;
    end else if (_T_327) begin
      _T_328 <= io_exc_or_int_valid_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_332 <= 5'h0;
    end else if (_T_331) begin
      _T_332 <= io_exc_cause_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_338 <= 1'h0;
    end else if (_T_337) begin
      _T_338 <= _T_334;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_342 <= 1'h0;
    end else if (_T_341) begin
      _T_342 <= io_i0_trigger_hit_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_346 <= 1'h0;
    end else if (_T_345) begin
      _T_346 <= io_take_nmi;
    end
  end
endmodule
module perf_mux_and_flops(
  input        reset,
  output       io_mhpmc_inc_r_0,
  output       io_mhpmc_inc_r_1,
  output       io_mhpmc_inc_r_2,
  output       io_mhpmc_inc_r_3,
  input  [6:0] io_mcountinhibit,
  input  [9:0] io_mhpme_vec_0,
  input  [9:0] io_mhpme_vec_1,
  input  [9:0] io_mhpme_vec_2,
  input  [9:0] io_mhpme_vec_3,
  input        io_ifu_pmu_ic_hit,
  input        io_ifu_pmu_ic_miss,
  input        io_tlu_i0_commit_cmt,
  input        io_illegal_r,
  input        io_exu_pmu_i0_pc4,
  input        io_ifu_pmu_instr_aligned,
  input        io_dec_pmu_instr_decoded,
  input  [3:0] io_dec_tlu_packet_r_pmu_i0_itype,
  input        io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input        io_dec_tlu_packet_r_pmu_divide,
  input        io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input        io_exu_pmu_i0_br_misp,
  input        io_dec_pmu_decode_stall,
  input        io_exu_pmu_i0_br_ataken,
  input        io_ifu_pmu_fetch_stall,
  input        io_dec_pmu_postsync_stall,
  input        io_dec_pmu_presync_stall,
  input        io_lsu_store_stall_any,
  input        io_dma_dccm_stall_any,
  input        io_dma_iccm_stall_any,
  input        io_i0_exception_valid_r,
  input        io_dec_tlu_pmu_fw_halted,
  input        io_dma_pmu_any_read,
  input        io_dma_pmu_any_write,
  input        io_dma_pmu_dccm_read,
  input        io_dma_pmu_dccm_write,
  input        io_lsu_pmu_load_external_r,
  input        io_lsu_pmu_store_external_r,
  output [1:0] io_mstatus,
  input  [5:0] io_mie,
  input        io_ifu_pmu_bus_trxn,
  input        io_lsu_pmu_bus_trxn,
  input        io_lsu_pmu_bus_misaligned,
  input        io_ifu_pmu_bus_error,
  input        io_lsu_pmu_bus_error,
  input        io_ifu_pmu_bus_busy,
  input        io_lsu_pmu_bus_busy,
  input        io_i0_trigger_hit_r,
  input        io_lsu_exc_valid_r,
  input        io_take_timer_int,
  input        io_take_int_timer0_int,
  input        io_take_int_timer1_int,
  input        io_take_ext_int,
  input        io_tlu_flush_lower_r,
  input        io_dec_tlu_br0_error_r,
  input        io_rfpc_i0_r,
  input        io_dec_tlu_br0_start_error_r,
  output       io_mcyclel_cout_f,
  output       io_minstret_enable_f,
  output       io_minstretl_cout_f,
  output [3:0] io_meicidpl,
  output       io_icache_rd_valid_f,
  output       io_icache_wr_valid_f,
  output       io_mhpmc_inc_r_d1_0,
  output       io_mhpmc_inc_r_d1_1,
  output       io_mhpmc_inc_r_d1_2,
  output       io_mhpmc_inc_r_d1_3,
  output       io_perfcnt_halted_d1,
  output       io_mdseac_locked_f,
  output       io_lsu_single_ecc_error_r_d1,
  output       io_lsu_i0_exc_r_d1,
  output       io_take_ext_int_start_d1,
  output       io_take_ext_int_start_d2,
  output       io_take_ext_int_start_d3,
  output       io_ext_int_freeze_d1,
  output [5:0] io_mip,
  input        io_mdseac_locked_ns,
  input        io_lsu_single_ecc_error_r,
  input        io_lsu_i0_exc_r,
  input        io_take_ext_int_start,
  input        io_ext_int_freeze,
  input  [5:0] io_mip_ns,
  input        io_mcyclel_cout,
  input        io_wr_mcycleh_r,
  input        io_mcyclel_cout_in,
  input        io_minstret_enable,
  input        io_minstretl_cout_ns,
  input  [3:0] io_meicidpl_ns,
  input        io_icache_rd_valid,
  input        io_icache_wr_valid,
  input        io_perfcnt_halted,
  input  [1:0] io_mstatus_ns,
  input        io_free_l2clk
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
`endif // RANDOMIZE_REG_INIT
  wire [3:0] _T_1 = io_tlu_i0_commit_cmt ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] pmu_i0_itype_qual = io_dec_tlu_packet_r_pmu_i0_itype & _T_1; // @[dec_tlu_ctl.scala 2795:66]
  wire  _T_3 = ~io_mcountinhibit[3]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_4 = io_mhpme_vec_0 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_6 = io_mhpme_vec_0 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_8 = io_mhpme_vec_0 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_10 = io_mhpme_vec_0 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_12 = ~io_illegal_r; // @[dec_tlu_ctl.scala 2801:104]
  wire  _T_13 = io_tlu_i0_commit_cmt & _T_12; // @[dec_tlu_ctl.scala 2801:102]
  wire  _T_14 = io_mhpme_vec_0 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_16 = ~io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 2802:104]
  wire  _T_17 = io_tlu_i0_commit_cmt & _T_16; // @[dec_tlu_ctl.scala 2802:102]
  wire  _T_19 = _T_17 & _T_12; // @[dec_tlu_ctl.scala 2802:123]
  wire  _T_20 = io_mhpme_vec_0 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_22 = io_tlu_i0_commit_cmt & io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 2803:102]
  wire  _T_24 = _T_22 & _T_12; // @[dec_tlu_ctl.scala 2803:123]
  wire  _T_25 = io_mhpme_vec_0 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_27 = io_mhpme_vec_0 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_29 = io_mhpme_vec_0 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_31 = io_mhpme_vec_0 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_33 = pmu_i0_itype_qual == 4'h1; // @[dec_tlu_ctl.scala 2808:99]
  wire  _T_34 = io_mhpme_vec_0 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_36 = io_dec_tlu_packet_r_pmu_divide & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2809:113]
  wire  _T_38 = _T_36 & _T_12; // @[dec_tlu_ctl.scala 2809:136]
  wire  _T_39 = io_mhpme_vec_0 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_41 = pmu_i0_itype_qual == 4'h2; // @[dec_tlu_ctl.scala 2810:99]
  wire  _T_42 = io_mhpme_vec_0 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_44 = pmu_i0_itype_qual == 4'h3; // @[dec_tlu_ctl.scala 2811:99]
  wire  _T_45 = io_mhpme_vec_0 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_48 = _T_41 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 2812:108]
  wire  _T_49 = io_mhpme_vec_0 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_53 = _T_44 & io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 2813:109]
  wire  _T_54 = io_mhpme_vec_0 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_56 = pmu_i0_itype_qual == 4'h4; // @[dec_tlu_ctl.scala 2815:97]
  wire  _T_57 = io_mhpme_vec_0 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_59 = pmu_i0_itype_qual == 4'h5; // @[dec_tlu_ctl.scala 2816:97]
  wire  _T_60 = io_mhpme_vec_0 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_62 = pmu_i0_itype_qual == 4'h6; // @[dec_tlu_ctl.scala 2817:97]
  wire  _T_63 = io_mhpme_vec_0 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_65 = pmu_i0_itype_qual == 4'h7; // @[dec_tlu_ctl.scala 2818:97]
  wire  _T_66 = io_mhpme_vec_0 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_68 = pmu_i0_itype_qual == 4'h8; // @[dec_tlu_ctl.scala 2819:97]
  wire  _T_69 = io_mhpme_vec_0 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_71 = pmu_i0_itype_qual == 4'h9; // @[dec_tlu_ctl.scala 2820:97]
  wire  _T_72 = io_mhpme_vec_0 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_74 = pmu_i0_itype_qual == 4'ha; // @[dec_tlu_ctl.scala 2821:97]
  wire  _T_75 = io_mhpme_vec_0 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_77 = pmu_i0_itype_qual == 4'hb; // @[dec_tlu_ctl.scala 2822:97]
  wire  _T_78 = io_mhpme_vec_0 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_80 = pmu_i0_itype_qual == 4'hc; // @[dec_tlu_ctl.scala 2823:97]
  wire  _T_81 = io_mhpme_vec_0 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_83 = pmu_i0_itype_qual == 4'hd; // @[dec_tlu_ctl.scala 2824:97]
  wire  _T_84 = pmu_i0_itype_qual == 4'he; // @[dec_tlu_ctl.scala 2824:130]
  wire  _T_85 = _T_83 | _T_84; // @[dec_tlu_ctl.scala 2824:109]
  wire  _T_86 = io_mhpme_vec_0 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_88 = io_exu_pmu_i0_br_misp & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2826:103]
  wire  _T_90 = _T_88 & _T_12; // @[dec_tlu_ctl.scala 2826:126]
  wire  _T_91 = io_mhpme_vec_0 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_93 = io_exu_pmu_i0_br_ataken & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2827:105]
  wire  _T_95 = _T_93 & _T_12; // @[dec_tlu_ctl.scala 2827:128]
  wire  _T_96 = io_mhpme_vec_0 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_98 = io_dec_tlu_packet_r_pmu_i0_br_unpred & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2828:118]
  wire  _T_100 = _T_98 & _T_12; // @[dec_tlu_ctl.scala 2828:141]
  wire  _T_101 = io_mhpme_vec_0 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_105 = io_mhpme_vec_0 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_107 = io_mhpme_vec_0 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_109 = io_mhpme_vec_0 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_111 = io_mhpme_vec_0 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_113 = io_mhpme_vec_0 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_115 = io_mhpme_vec_0 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_117 = io_i0_exception_valid_r | io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 2836:106]
  wire  _T_118 = _T_117 | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 2836:128]
  wire  _T_119 = io_mhpme_vec_0 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_121 = io_take_timer_int | io_take_int_timer0_int; // @[dec_tlu_ctl.scala 2837:100]
  wire  _T_122 = _T_121 | io_take_int_timer1_int; // @[dec_tlu_ctl.scala 2837:125]
  wire  _T_123 = io_mhpme_vec_0 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_125 = io_mhpme_vec_0 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_127 = io_mhpme_vec_0 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_129 = io_dec_tlu_br0_error_r | io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 2840:105]
  wire  _T_130 = _T_129 & io_rfpc_i0_r; // @[dec_tlu_ctl.scala 2840:137]
  wire  _T_131 = io_mhpme_vec_0 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_133 = io_mhpme_vec_0 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_135 = io_mhpme_vec_0 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_137 = io_mhpme_vec_0 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_139 = io_mhpme_vec_0 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_141 = io_mhpme_vec_0 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_143 = io_mhpme_vec_0 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_145 = io_mhpme_vec_0 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_149 = ~io_mstatus[0]; // @[dec_tlu_ctl.scala 2849:81]
  wire  _T_150 = io_mhpme_vec_0 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire [5:0] _T_157 = io_mip & io_mie; // @[dec_tlu_ctl.scala 2850:121]
  wire  _T_158 = |_T_157; // @[dec_tlu_ctl.scala 2850:136]
  wire  _T_159 = _T_149 & _T_158; // @[dec_tlu_ctl.scala 2850:106]
  wire  _T_160 = io_mhpme_vec_0 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_162 = pmu_i0_itype_qual == 4'hf; // @[dec_tlu_ctl.scala 2851:99]
  wire  _T_163 = io_mhpme_vec_0 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_165 = io_tlu_i0_commit_cmt & io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 2852:102]
  wire  _T_167 = _T_165 & _T_12; // @[dec_tlu_ctl.scala 2852:131]
  wire  _T_168 = io_mhpme_vec_0 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_170 = io_tlu_i0_commit_cmt & io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 2853:102]
  wire  _T_172 = _T_170 & _T_12; // @[dec_tlu_ctl.scala 2853:132]
  wire  _T_173 = io_mhpme_vec_0 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_175 = io_mhpme_vec_0 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_177 = io_mhpme_vec_0 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_179 = io_mhpme_vec_0 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_181 = io_mhpme_vec_0 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_184 = _T_6 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_185 = _T_8 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_186 = _T_10 & _T_13; // @[Mux.scala 27:72]
  wire  _T_187 = _T_14 & _T_19; // @[Mux.scala 27:72]
  wire  _T_188 = _T_20 & _T_24; // @[Mux.scala 27:72]
  wire  _T_189 = _T_25 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_190 = _T_27 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_191 = _T_29 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_192 = _T_31 & _T_33; // @[Mux.scala 27:72]
  wire  _T_193 = _T_34 & _T_38; // @[Mux.scala 27:72]
  wire  _T_194 = _T_39 & _T_41; // @[Mux.scala 27:72]
  wire  _T_195 = _T_42 & _T_44; // @[Mux.scala 27:72]
  wire  _T_196 = _T_45 & _T_48; // @[Mux.scala 27:72]
  wire  _T_197 = _T_49 & _T_53; // @[Mux.scala 27:72]
  wire  _T_198 = _T_54 & _T_56; // @[Mux.scala 27:72]
  wire  _T_199 = _T_57 & _T_59; // @[Mux.scala 27:72]
  wire  _T_200 = _T_60 & _T_62; // @[Mux.scala 27:72]
  wire  _T_201 = _T_63 & _T_65; // @[Mux.scala 27:72]
  wire  _T_202 = _T_66 & _T_68; // @[Mux.scala 27:72]
  wire  _T_203 = _T_69 & _T_71; // @[Mux.scala 27:72]
  wire  _T_204 = _T_72 & _T_74; // @[Mux.scala 27:72]
  wire  _T_205 = _T_75 & _T_77; // @[Mux.scala 27:72]
  wire  _T_206 = _T_78 & _T_80; // @[Mux.scala 27:72]
  wire  _T_207 = _T_81 & _T_85; // @[Mux.scala 27:72]
  wire  _T_208 = _T_86 & _T_90; // @[Mux.scala 27:72]
  wire  _T_209 = _T_91 & _T_95; // @[Mux.scala 27:72]
  wire  _T_210 = _T_96 & _T_100; // @[Mux.scala 27:72]
  wire  _T_211 = _T_101 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_213 = _T_105 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_214 = _T_107 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_215 = _T_109 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_216 = _T_111 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_217 = _T_113 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_218 = _T_115 & _T_118; // @[Mux.scala 27:72]
  wire  _T_219 = _T_119 & _T_122; // @[Mux.scala 27:72]
  wire  _T_220 = _T_123 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_221 = _T_125 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_222 = _T_127 & _T_130; // @[Mux.scala 27:72]
  wire  _T_223 = _T_131 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_224 = _T_133 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_225 = _T_135 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_226 = _T_137 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_227 = _T_139 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_228 = _T_141 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_229 = _T_143 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_230 = _T_145 & _T_149; // @[Mux.scala 27:72]
  wire  _T_231 = _T_150 & _T_159; // @[Mux.scala 27:72]
  wire  _T_232 = _T_160 & _T_162; // @[Mux.scala 27:72]
  wire  _T_233 = _T_163 & _T_167; // @[Mux.scala 27:72]
  wire  _T_234 = _T_168 & _T_172; // @[Mux.scala 27:72]
  wire  _T_235 = _T_173 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_236 = _T_175 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_237 = _T_177 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_238 = _T_179 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_239 = _T_181 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_240 = _T_4 | _T_184; // @[Mux.scala 27:72]
  wire  _T_241 = _T_240 | _T_185; // @[Mux.scala 27:72]
  wire  _T_242 = _T_241 | _T_186; // @[Mux.scala 27:72]
  wire  _T_243 = _T_242 | _T_187; // @[Mux.scala 27:72]
  wire  _T_244 = _T_243 | _T_188; // @[Mux.scala 27:72]
  wire  _T_245 = _T_244 | _T_189; // @[Mux.scala 27:72]
  wire  _T_246 = _T_245 | _T_190; // @[Mux.scala 27:72]
  wire  _T_247 = _T_246 | _T_191; // @[Mux.scala 27:72]
  wire  _T_248 = _T_247 | _T_192; // @[Mux.scala 27:72]
  wire  _T_249 = _T_248 | _T_193; // @[Mux.scala 27:72]
  wire  _T_250 = _T_249 | _T_194; // @[Mux.scala 27:72]
  wire  _T_251 = _T_250 | _T_195; // @[Mux.scala 27:72]
  wire  _T_252 = _T_251 | _T_196; // @[Mux.scala 27:72]
  wire  _T_253 = _T_252 | _T_197; // @[Mux.scala 27:72]
  wire  _T_254 = _T_253 | _T_198; // @[Mux.scala 27:72]
  wire  _T_255 = _T_254 | _T_199; // @[Mux.scala 27:72]
  wire  _T_256 = _T_255 | _T_200; // @[Mux.scala 27:72]
  wire  _T_257 = _T_256 | _T_201; // @[Mux.scala 27:72]
  wire  _T_258 = _T_257 | _T_202; // @[Mux.scala 27:72]
  wire  _T_259 = _T_258 | _T_203; // @[Mux.scala 27:72]
  wire  _T_260 = _T_259 | _T_204; // @[Mux.scala 27:72]
  wire  _T_261 = _T_260 | _T_205; // @[Mux.scala 27:72]
  wire  _T_262 = _T_261 | _T_206; // @[Mux.scala 27:72]
  wire  _T_263 = _T_262 | _T_207; // @[Mux.scala 27:72]
  wire  _T_264 = _T_263 | _T_208; // @[Mux.scala 27:72]
  wire  _T_265 = _T_264 | _T_209; // @[Mux.scala 27:72]
  wire  _T_266 = _T_265 | _T_210; // @[Mux.scala 27:72]
  wire  _T_267 = _T_266 | _T_211; // @[Mux.scala 27:72]
  wire  _T_268 = _T_267 | _T_191; // @[Mux.scala 27:72]
  wire  _T_269 = _T_268 | _T_213; // @[Mux.scala 27:72]
  wire  _T_270 = _T_269 | _T_214; // @[Mux.scala 27:72]
  wire  _T_271 = _T_270 | _T_215; // @[Mux.scala 27:72]
  wire  _T_272 = _T_271 | _T_216; // @[Mux.scala 27:72]
  wire  _T_273 = _T_272 | _T_217; // @[Mux.scala 27:72]
  wire  _T_274 = _T_273 | _T_218; // @[Mux.scala 27:72]
  wire  _T_275 = _T_274 | _T_219; // @[Mux.scala 27:72]
  wire  _T_276 = _T_275 | _T_220; // @[Mux.scala 27:72]
  wire  _T_277 = _T_276 | _T_221; // @[Mux.scala 27:72]
  wire  _T_278 = _T_277 | _T_222; // @[Mux.scala 27:72]
  wire  _T_279 = _T_278 | _T_223; // @[Mux.scala 27:72]
  wire  _T_280 = _T_279 | _T_224; // @[Mux.scala 27:72]
  wire  _T_281 = _T_280 | _T_225; // @[Mux.scala 27:72]
  wire  _T_282 = _T_281 | _T_226; // @[Mux.scala 27:72]
  wire  _T_283 = _T_282 | _T_227; // @[Mux.scala 27:72]
  wire  _T_284 = _T_283 | _T_228; // @[Mux.scala 27:72]
  wire  _T_285 = _T_284 | _T_229; // @[Mux.scala 27:72]
  wire  _T_286 = _T_285 | _T_230; // @[Mux.scala 27:72]
  wire  _T_287 = _T_286 | _T_231; // @[Mux.scala 27:72]
  wire  _T_288 = _T_287 | _T_232; // @[Mux.scala 27:72]
  wire  _T_289 = _T_288 | _T_233; // @[Mux.scala 27:72]
  wire  _T_290 = _T_289 | _T_234; // @[Mux.scala 27:72]
  wire  _T_291 = _T_290 | _T_235; // @[Mux.scala 27:72]
  wire  _T_292 = _T_291 | _T_236; // @[Mux.scala 27:72]
  wire  _T_293 = _T_292 | _T_237; // @[Mux.scala 27:72]
  wire  _T_294 = _T_293 | _T_238; // @[Mux.scala 27:72]
  wire  _T_295 = _T_294 | _T_239; // @[Mux.scala 27:72]
  wire  _T_299 = ~io_mcountinhibit[4]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_300 = io_mhpme_vec_1 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_302 = io_mhpme_vec_1 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_304 = io_mhpme_vec_1 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_306 = io_mhpme_vec_1 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_310 = io_mhpme_vec_1 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_316 = io_mhpme_vec_1 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_321 = io_mhpme_vec_1 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_323 = io_mhpme_vec_1 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_325 = io_mhpme_vec_1 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_327 = io_mhpme_vec_1 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_330 = io_mhpme_vec_1 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_335 = io_mhpme_vec_1 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_338 = io_mhpme_vec_1 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_341 = io_mhpme_vec_1 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_345 = io_mhpme_vec_1 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_350 = io_mhpme_vec_1 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_353 = io_mhpme_vec_1 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_356 = io_mhpme_vec_1 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_359 = io_mhpme_vec_1 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_362 = io_mhpme_vec_1 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_365 = io_mhpme_vec_1 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_368 = io_mhpme_vec_1 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_371 = io_mhpme_vec_1 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_374 = io_mhpme_vec_1 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_377 = io_mhpme_vec_1 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_382 = io_mhpme_vec_1 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_387 = io_mhpme_vec_1 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_392 = io_mhpme_vec_1 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_397 = io_mhpme_vec_1 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_401 = io_mhpme_vec_1 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_403 = io_mhpme_vec_1 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_405 = io_mhpme_vec_1 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_407 = io_mhpme_vec_1 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_409 = io_mhpme_vec_1 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_411 = io_mhpme_vec_1 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_415 = io_mhpme_vec_1 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_419 = io_mhpme_vec_1 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_421 = io_mhpme_vec_1 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_423 = io_mhpme_vec_1 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_427 = io_mhpme_vec_1 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_429 = io_mhpme_vec_1 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_431 = io_mhpme_vec_1 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_433 = io_mhpme_vec_1 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_435 = io_mhpme_vec_1 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_437 = io_mhpme_vec_1 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_439 = io_mhpme_vec_1 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_441 = io_mhpme_vec_1 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_446 = io_mhpme_vec_1 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire  _T_456 = io_mhpme_vec_1 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_459 = io_mhpme_vec_1 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_464 = io_mhpme_vec_1 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_469 = io_mhpme_vec_1 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_471 = io_mhpme_vec_1 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_473 = io_mhpme_vec_1 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_475 = io_mhpme_vec_1 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_477 = io_mhpme_vec_1 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_480 = _T_302 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_481 = _T_304 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_482 = _T_306 & _T_13; // @[Mux.scala 27:72]
  wire  _T_483 = _T_310 & _T_19; // @[Mux.scala 27:72]
  wire  _T_484 = _T_316 & _T_24; // @[Mux.scala 27:72]
  wire  _T_485 = _T_321 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_486 = _T_323 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_487 = _T_325 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_488 = _T_327 & _T_33; // @[Mux.scala 27:72]
  wire  _T_489 = _T_330 & _T_38; // @[Mux.scala 27:72]
  wire  _T_490 = _T_335 & _T_41; // @[Mux.scala 27:72]
  wire  _T_491 = _T_338 & _T_44; // @[Mux.scala 27:72]
  wire  _T_492 = _T_341 & _T_48; // @[Mux.scala 27:72]
  wire  _T_493 = _T_345 & _T_53; // @[Mux.scala 27:72]
  wire  _T_494 = _T_350 & _T_56; // @[Mux.scala 27:72]
  wire  _T_495 = _T_353 & _T_59; // @[Mux.scala 27:72]
  wire  _T_496 = _T_356 & _T_62; // @[Mux.scala 27:72]
  wire  _T_497 = _T_359 & _T_65; // @[Mux.scala 27:72]
  wire  _T_498 = _T_362 & _T_68; // @[Mux.scala 27:72]
  wire  _T_499 = _T_365 & _T_71; // @[Mux.scala 27:72]
  wire  _T_500 = _T_368 & _T_74; // @[Mux.scala 27:72]
  wire  _T_501 = _T_371 & _T_77; // @[Mux.scala 27:72]
  wire  _T_502 = _T_374 & _T_80; // @[Mux.scala 27:72]
  wire  _T_503 = _T_377 & _T_85; // @[Mux.scala 27:72]
  wire  _T_504 = _T_382 & _T_90; // @[Mux.scala 27:72]
  wire  _T_505 = _T_387 & _T_95; // @[Mux.scala 27:72]
  wire  _T_506 = _T_392 & _T_100; // @[Mux.scala 27:72]
  wire  _T_507 = _T_397 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_509 = _T_401 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_510 = _T_403 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_511 = _T_405 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_512 = _T_407 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_513 = _T_409 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_514 = _T_411 & _T_118; // @[Mux.scala 27:72]
  wire  _T_515 = _T_415 & _T_122; // @[Mux.scala 27:72]
  wire  _T_516 = _T_419 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_517 = _T_421 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_518 = _T_423 & _T_130; // @[Mux.scala 27:72]
  wire  _T_519 = _T_427 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_520 = _T_429 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_521 = _T_431 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_522 = _T_433 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_523 = _T_435 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_524 = _T_437 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_525 = _T_439 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_526 = _T_441 & _T_149; // @[Mux.scala 27:72]
  wire  _T_527 = _T_446 & _T_159; // @[Mux.scala 27:72]
  wire  _T_528 = _T_456 & _T_162; // @[Mux.scala 27:72]
  wire  _T_529 = _T_459 & _T_167; // @[Mux.scala 27:72]
  wire  _T_530 = _T_464 & _T_172; // @[Mux.scala 27:72]
  wire  _T_531 = _T_469 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_532 = _T_471 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_533 = _T_473 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_534 = _T_475 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_535 = _T_477 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_536 = _T_300 | _T_480; // @[Mux.scala 27:72]
  wire  _T_537 = _T_536 | _T_481; // @[Mux.scala 27:72]
  wire  _T_538 = _T_537 | _T_482; // @[Mux.scala 27:72]
  wire  _T_539 = _T_538 | _T_483; // @[Mux.scala 27:72]
  wire  _T_540 = _T_539 | _T_484; // @[Mux.scala 27:72]
  wire  _T_541 = _T_540 | _T_485; // @[Mux.scala 27:72]
  wire  _T_542 = _T_541 | _T_486; // @[Mux.scala 27:72]
  wire  _T_543 = _T_542 | _T_487; // @[Mux.scala 27:72]
  wire  _T_544 = _T_543 | _T_488; // @[Mux.scala 27:72]
  wire  _T_545 = _T_544 | _T_489; // @[Mux.scala 27:72]
  wire  _T_546 = _T_545 | _T_490; // @[Mux.scala 27:72]
  wire  _T_547 = _T_546 | _T_491; // @[Mux.scala 27:72]
  wire  _T_548 = _T_547 | _T_492; // @[Mux.scala 27:72]
  wire  _T_549 = _T_548 | _T_493; // @[Mux.scala 27:72]
  wire  _T_550 = _T_549 | _T_494; // @[Mux.scala 27:72]
  wire  _T_551 = _T_550 | _T_495; // @[Mux.scala 27:72]
  wire  _T_552 = _T_551 | _T_496; // @[Mux.scala 27:72]
  wire  _T_553 = _T_552 | _T_497; // @[Mux.scala 27:72]
  wire  _T_554 = _T_553 | _T_498; // @[Mux.scala 27:72]
  wire  _T_555 = _T_554 | _T_499; // @[Mux.scala 27:72]
  wire  _T_556 = _T_555 | _T_500; // @[Mux.scala 27:72]
  wire  _T_557 = _T_556 | _T_501; // @[Mux.scala 27:72]
  wire  _T_558 = _T_557 | _T_502; // @[Mux.scala 27:72]
  wire  _T_559 = _T_558 | _T_503; // @[Mux.scala 27:72]
  wire  _T_560 = _T_559 | _T_504; // @[Mux.scala 27:72]
  wire  _T_561 = _T_560 | _T_505; // @[Mux.scala 27:72]
  wire  _T_562 = _T_561 | _T_506; // @[Mux.scala 27:72]
  wire  _T_563 = _T_562 | _T_507; // @[Mux.scala 27:72]
  wire  _T_564 = _T_563 | _T_487; // @[Mux.scala 27:72]
  wire  _T_565 = _T_564 | _T_509; // @[Mux.scala 27:72]
  wire  _T_566 = _T_565 | _T_510; // @[Mux.scala 27:72]
  wire  _T_567 = _T_566 | _T_511; // @[Mux.scala 27:72]
  wire  _T_568 = _T_567 | _T_512; // @[Mux.scala 27:72]
  wire  _T_569 = _T_568 | _T_513; // @[Mux.scala 27:72]
  wire  _T_570 = _T_569 | _T_514; // @[Mux.scala 27:72]
  wire  _T_571 = _T_570 | _T_515; // @[Mux.scala 27:72]
  wire  _T_572 = _T_571 | _T_516; // @[Mux.scala 27:72]
  wire  _T_573 = _T_572 | _T_517; // @[Mux.scala 27:72]
  wire  _T_574 = _T_573 | _T_518; // @[Mux.scala 27:72]
  wire  _T_575 = _T_574 | _T_519; // @[Mux.scala 27:72]
  wire  _T_576 = _T_575 | _T_520; // @[Mux.scala 27:72]
  wire  _T_577 = _T_576 | _T_521; // @[Mux.scala 27:72]
  wire  _T_578 = _T_577 | _T_522; // @[Mux.scala 27:72]
  wire  _T_579 = _T_578 | _T_523; // @[Mux.scala 27:72]
  wire  _T_580 = _T_579 | _T_524; // @[Mux.scala 27:72]
  wire  _T_581 = _T_580 | _T_525; // @[Mux.scala 27:72]
  wire  _T_582 = _T_581 | _T_526; // @[Mux.scala 27:72]
  wire  _T_583 = _T_582 | _T_527; // @[Mux.scala 27:72]
  wire  _T_584 = _T_583 | _T_528; // @[Mux.scala 27:72]
  wire  _T_585 = _T_584 | _T_529; // @[Mux.scala 27:72]
  wire  _T_586 = _T_585 | _T_530; // @[Mux.scala 27:72]
  wire  _T_587 = _T_586 | _T_531; // @[Mux.scala 27:72]
  wire  _T_588 = _T_587 | _T_532; // @[Mux.scala 27:72]
  wire  _T_589 = _T_588 | _T_533; // @[Mux.scala 27:72]
  wire  _T_590 = _T_589 | _T_534; // @[Mux.scala 27:72]
  wire  _T_591 = _T_590 | _T_535; // @[Mux.scala 27:72]
  wire  _T_595 = ~io_mcountinhibit[5]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_596 = io_mhpme_vec_2 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_598 = io_mhpme_vec_2 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_600 = io_mhpme_vec_2 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_602 = io_mhpme_vec_2 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_606 = io_mhpme_vec_2 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_612 = io_mhpme_vec_2 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_617 = io_mhpme_vec_2 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_619 = io_mhpme_vec_2 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_621 = io_mhpme_vec_2 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_623 = io_mhpme_vec_2 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_626 = io_mhpme_vec_2 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_631 = io_mhpme_vec_2 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_634 = io_mhpme_vec_2 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_637 = io_mhpme_vec_2 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_641 = io_mhpme_vec_2 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_646 = io_mhpme_vec_2 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_649 = io_mhpme_vec_2 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_652 = io_mhpme_vec_2 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_655 = io_mhpme_vec_2 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_658 = io_mhpme_vec_2 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_661 = io_mhpme_vec_2 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_664 = io_mhpme_vec_2 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_667 = io_mhpme_vec_2 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_670 = io_mhpme_vec_2 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_673 = io_mhpme_vec_2 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_678 = io_mhpme_vec_2 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_683 = io_mhpme_vec_2 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_688 = io_mhpme_vec_2 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_693 = io_mhpme_vec_2 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_697 = io_mhpme_vec_2 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_699 = io_mhpme_vec_2 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_701 = io_mhpme_vec_2 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_703 = io_mhpme_vec_2 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_705 = io_mhpme_vec_2 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_707 = io_mhpme_vec_2 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_711 = io_mhpme_vec_2 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_715 = io_mhpme_vec_2 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_717 = io_mhpme_vec_2 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_719 = io_mhpme_vec_2 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_723 = io_mhpme_vec_2 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_725 = io_mhpme_vec_2 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_727 = io_mhpme_vec_2 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_729 = io_mhpme_vec_2 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_731 = io_mhpme_vec_2 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_733 = io_mhpme_vec_2 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_735 = io_mhpme_vec_2 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_737 = io_mhpme_vec_2 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_742 = io_mhpme_vec_2 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire  _T_752 = io_mhpme_vec_2 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_755 = io_mhpme_vec_2 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_760 = io_mhpme_vec_2 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_765 = io_mhpme_vec_2 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_767 = io_mhpme_vec_2 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_769 = io_mhpme_vec_2 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_771 = io_mhpme_vec_2 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_773 = io_mhpme_vec_2 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_776 = _T_598 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_777 = _T_600 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_778 = _T_602 & _T_13; // @[Mux.scala 27:72]
  wire  _T_779 = _T_606 & _T_19; // @[Mux.scala 27:72]
  wire  _T_780 = _T_612 & _T_24; // @[Mux.scala 27:72]
  wire  _T_781 = _T_617 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_782 = _T_619 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_783 = _T_621 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_784 = _T_623 & _T_33; // @[Mux.scala 27:72]
  wire  _T_785 = _T_626 & _T_38; // @[Mux.scala 27:72]
  wire  _T_786 = _T_631 & _T_41; // @[Mux.scala 27:72]
  wire  _T_787 = _T_634 & _T_44; // @[Mux.scala 27:72]
  wire  _T_788 = _T_637 & _T_48; // @[Mux.scala 27:72]
  wire  _T_789 = _T_641 & _T_53; // @[Mux.scala 27:72]
  wire  _T_790 = _T_646 & _T_56; // @[Mux.scala 27:72]
  wire  _T_791 = _T_649 & _T_59; // @[Mux.scala 27:72]
  wire  _T_792 = _T_652 & _T_62; // @[Mux.scala 27:72]
  wire  _T_793 = _T_655 & _T_65; // @[Mux.scala 27:72]
  wire  _T_794 = _T_658 & _T_68; // @[Mux.scala 27:72]
  wire  _T_795 = _T_661 & _T_71; // @[Mux.scala 27:72]
  wire  _T_796 = _T_664 & _T_74; // @[Mux.scala 27:72]
  wire  _T_797 = _T_667 & _T_77; // @[Mux.scala 27:72]
  wire  _T_798 = _T_670 & _T_80; // @[Mux.scala 27:72]
  wire  _T_799 = _T_673 & _T_85; // @[Mux.scala 27:72]
  wire  _T_800 = _T_678 & _T_90; // @[Mux.scala 27:72]
  wire  _T_801 = _T_683 & _T_95; // @[Mux.scala 27:72]
  wire  _T_802 = _T_688 & _T_100; // @[Mux.scala 27:72]
  wire  _T_803 = _T_693 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_805 = _T_697 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_806 = _T_699 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_807 = _T_701 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_808 = _T_703 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_809 = _T_705 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_810 = _T_707 & _T_118; // @[Mux.scala 27:72]
  wire  _T_811 = _T_711 & _T_122; // @[Mux.scala 27:72]
  wire  _T_812 = _T_715 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_813 = _T_717 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_814 = _T_719 & _T_130; // @[Mux.scala 27:72]
  wire  _T_815 = _T_723 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_816 = _T_725 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_817 = _T_727 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_818 = _T_729 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_819 = _T_731 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_820 = _T_733 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_821 = _T_735 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_822 = _T_737 & _T_149; // @[Mux.scala 27:72]
  wire  _T_823 = _T_742 & _T_159; // @[Mux.scala 27:72]
  wire  _T_824 = _T_752 & _T_162; // @[Mux.scala 27:72]
  wire  _T_825 = _T_755 & _T_167; // @[Mux.scala 27:72]
  wire  _T_826 = _T_760 & _T_172; // @[Mux.scala 27:72]
  wire  _T_827 = _T_765 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_828 = _T_767 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_829 = _T_769 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_830 = _T_771 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_831 = _T_773 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_832 = _T_596 | _T_776; // @[Mux.scala 27:72]
  wire  _T_833 = _T_832 | _T_777; // @[Mux.scala 27:72]
  wire  _T_834 = _T_833 | _T_778; // @[Mux.scala 27:72]
  wire  _T_835 = _T_834 | _T_779; // @[Mux.scala 27:72]
  wire  _T_836 = _T_835 | _T_780; // @[Mux.scala 27:72]
  wire  _T_837 = _T_836 | _T_781; // @[Mux.scala 27:72]
  wire  _T_838 = _T_837 | _T_782; // @[Mux.scala 27:72]
  wire  _T_839 = _T_838 | _T_783; // @[Mux.scala 27:72]
  wire  _T_840 = _T_839 | _T_784; // @[Mux.scala 27:72]
  wire  _T_841 = _T_840 | _T_785; // @[Mux.scala 27:72]
  wire  _T_842 = _T_841 | _T_786; // @[Mux.scala 27:72]
  wire  _T_843 = _T_842 | _T_787; // @[Mux.scala 27:72]
  wire  _T_844 = _T_843 | _T_788; // @[Mux.scala 27:72]
  wire  _T_845 = _T_844 | _T_789; // @[Mux.scala 27:72]
  wire  _T_846 = _T_845 | _T_790; // @[Mux.scala 27:72]
  wire  _T_847 = _T_846 | _T_791; // @[Mux.scala 27:72]
  wire  _T_848 = _T_847 | _T_792; // @[Mux.scala 27:72]
  wire  _T_849 = _T_848 | _T_793; // @[Mux.scala 27:72]
  wire  _T_850 = _T_849 | _T_794; // @[Mux.scala 27:72]
  wire  _T_851 = _T_850 | _T_795; // @[Mux.scala 27:72]
  wire  _T_852 = _T_851 | _T_796; // @[Mux.scala 27:72]
  wire  _T_853 = _T_852 | _T_797; // @[Mux.scala 27:72]
  wire  _T_854 = _T_853 | _T_798; // @[Mux.scala 27:72]
  wire  _T_855 = _T_854 | _T_799; // @[Mux.scala 27:72]
  wire  _T_856 = _T_855 | _T_800; // @[Mux.scala 27:72]
  wire  _T_857 = _T_856 | _T_801; // @[Mux.scala 27:72]
  wire  _T_858 = _T_857 | _T_802; // @[Mux.scala 27:72]
  wire  _T_859 = _T_858 | _T_803; // @[Mux.scala 27:72]
  wire  _T_860 = _T_859 | _T_783; // @[Mux.scala 27:72]
  wire  _T_861 = _T_860 | _T_805; // @[Mux.scala 27:72]
  wire  _T_862 = _T_861 | _T_806; // @[Mux.scala 27:72]
  wire  _T_863 = _T_862 | _T_807; // @[Mux.scala 27:72]
  wire  _T_864 = _T_863 | _T_808; // @[Mux.scala 27:72]
  wire  _T_865 = _T_864 | _T_809; // @[Mux.scala 27:72]
  wire  _T_866 = _T_865 | _T_810; // @[Mux.scala 27:72]
  wire  _T_867 = _T_866 | _T_811; // @[Mux.scala 27:72]
  wire  _T_868 = _T_867 | _T_812; // @[Mux.scala 27:72]
  wire  _T_869 = _T_868 | _T_813; // @[Mux.scala 27:72]
  wire  _T_870 = _T_869 | _T_814; // @[Mux.scala 27:72]
  wire  _T_871 = _T_870 | _T_815; // @[Mux.scala 27:72]
  wire  _T_872 = _T_871 | _T_816; // @[Mux.scala 27:72]
  wire  _T_873 = _T_872 | _T_817; // @[Mux.scala 27:72]
  wire  _T_874 = _T_873 | _T_818; // @[Mux.scala 27:72]
  wire  _T_875 = _T_874 | _T_819; // @[Mux.scala 27:72]
  wire  _T_876 = _T_875 | _T_820; // @[Mux.scala 27:72]
  wire  _T_877 = _T_876 | _T_821; // @[Mux.scala 27:72]
  wire  _T_878 = _T_877 | _T_822; // @[Mux.scala 27:72]
  wire  _T_879 = _T_878 | _T_823; // @[Mux.scala 27:72]
  wire  _T_880 = _T_879 | _T_824; // @[Mux.scala 27:72]
  wire  _T_881 = _T_880 | _T_825; // @[Mux.scala 27:72]
  wire  _T_882 = _T_881 | _T_826; // @[Mux.scala 27:72]
  wire  _T_883 = _T_882 | _T_827; // @[Mux.scala 27:72]
  wire  _T_884 = _T_883 | _T_828; // @[Mux.scala 27:72]
  wire  _T_885 = _T_884 | _T_829; // @[Mux.scala 27:72]
  wire  _T_886 = _T_885 | _T_830; // @[Mux.scala 27:72]
  wire  _T_887 = _T_886 | _T_831; // @[Mux.scala 27:72]
  wire  _T_891 = ~io_mcountinhibit[6]; // @[dec_tlu_ctl.scala 2797:40]
  wire  _T_892 = io_mhpme_vec_3 == 10'h1; // @[dec_tlu_ctl.scala 2798:42]
  wire  _T_894 = io_mhpme_vec_3 == 10'h2; // @[dec_tlu_ctl.scala 2799:42]
  wire  _T_896 = io_mhpme_vec_3 == 10'h3; // @[dec_tlu_ctl.scala 2800:42]
  wire  _T_898 = io_mhpme_vec_3 == 10'h4; // @[dec_tlu_ctl.scala 2801:42]
  wire  _T_902 = io_mhpme_vec_3 == 10'h5; // @[dec_tlu_ctl.scala 2802:42]
  wire  _T_908 = io_mhpme_vec_3 == 10'h6; // @[dec_tlu_ctl.scala 2803:42]
  wire  _T_913 = io_mhpme_vec_3 == 10'h7; // @[dec_tlu_ctl.scala 2805:42]
  wire  _T_915 = io_mhpme_vec_3 == 10'h8; // @[dec_tlu_ctl.scala 2806:42]
  wire  _T_917 = io_mhpme_vec_3 == 10'h1e; // @[dec_tlu_ctl.scala 2807:42]
  wire  _T_919 = io_mhpme_vec_3 == 10'h9; // @[dec_tlu_ctl.scala 2808:42]
  wire  _T_922 = io_mhpme_vec_3 == 10'ha; // @[dec_tlu_ctl.scala 2809:42]
  wire  _T_927 = io_mhpme_vec_3 == 10'hb; // @[dec_tlu_ctl.scala 2810:42]
  wire  _T_930 = io_mhpme_vec_3 == 10'hc; // @[dec_tlu_ctl.scala 2811:42]
  wire  _T_933 = io_mhpme_vec_3 == 10'hd; // @[dec_tlu_ctl.scala 2812:42]
  wire  _T_937 = io_mhpme_vec_3 == 10'he; // @[dec_tlu_ctl.scala 2813:42]
  wire  _T_942 = io_mhpme_vec_3 == 10'hf; // @[dec_tlu_ctl.scala 2815:42]
  wire  _T_945 = io_mhpme_vec_3 == 10'h10; // @[dec_tlu_ctl.scala 2816:42]
  wire  _T_948 = io_mhpme_vec_3 == 10'h12; // @[dec_tlu_ctl.scala 2817:42]
  wire  _T_951 = io_mhpme_vec_3 == 10'h11; // @[dec_tlu_ctl.scala 2818:42]
  wire  _T_954 = io_mhpme_vec_3 == 10'h13; // @[dec_tlu_ctl.scala 2819:42]
  wire  _T_957 = io_mhpme_vec_3 == 10'h14; // @[dec_tlu_ctl.scala 2820:42]
  wire  _T_960 = io_mhpme_vec_3 == 10'h15; // @[dec_tlu_ctl.scala 2821:42]
  wire  _T_963 = io_mhpme_vec_3 == 10'h16; // @[dec_tlu_ctl.scala 2822:42]
  wire  _T_966 = io_mhpme_vec_3 == 10'h17; // @[dec_tlu_ctl.scala 2823:42]
  wire  _T_969 = io_mhpme_vec_3 == 10'h18; // @[dec_tlu_ctl.scala 2824:42]
  wire  _T_974 = io_mhpme_vec_3 == 10'h19; // @[dec_tlu_ctl.scala 2826:42]
  wire  _T_979 = io_mhpme_vec_3 == 10'h1a; // @[dec_tlu_ctl.scala 2827:42]
  wire  _T_984 = io_mhpme_vec_3 == 10'h1b; // @[dec_tlu_ctl.scala 2828:42]
  wire  _T_989 = io_mhpme_vec_3 == 10'h1c; // @[dec_tlu_ctl.scala 2829:42]
  wire  _T_993 = io_mhpme_vec_3 == 10'h1f; // @[dec_tlu_ctl.scala 2831:42]
  wire  _T_995 = io_mhpme_vec_3 == 10'h20; // @[dec_tlu_ctl.scala 2832:42]
  wire  _T_997 = io_mhpme_vec_3 == 10'h22; // @[dec_tlu_ctl.scala 2833:42]
  wire  _T_999 = io_mhpme_vec_3 == 10'h23; // @[dec_tlu_ctl.scala 2834:42]
  wire  _T_1001 = io_mhpme_vec_3 == 10'h24; // @[dec_tlu_ctl.scala 2835:42]
  wire  _T_1003 = io_mhpme_vec_3 == 10'h25; // @[dec_tlu_ctl.scala 2836:42]
  wire  _T_1007 = io_mhpme_vec_3 == 10'h26; // @[dec_tlu_ctl.scala 2837:42]
  wire  _T_1011 = io_mhpme_vec_3 == 10'h27; // @[dec_tlu_ctl.scala 2838:42]
  wire  _T_1013 = io_mhpme_vec_3 == 10'h28; // @[dec_tlu_ctl.scala 2839:42]
  wire  _T_1015 = io_mhpme_vec_3 == 10'h29; // @[dec_tlu_ctl.scala 2840:42]
  wire  _T_1019 = io_mhpme_vec_3 == 10'h2a; // @[dec_tlu_ctl.scala 2842:42]
  wire  _T_1021 = io_mhpme_vec_3 == 10'h2b; // @[dec_tlu_ctl.scala 2843:42]
  wire  _T_1023 = io_mhpme_vec_3 == 10'h2c; // @[dec_tlu_ctl.scala 2844:42]
  wire  _T_1025 = io_mhpme_vec_3 == 10'h2d; // @[dec_tlu_ctl.scala 2845:42]
  wire  _T_1027 = io_mhpme_vec_3 == 10'h2e; // @[dec_tlu_ctl.scala 2846:42]
  wire  _T_1029 = io_mhpme_vec_3 == 10'h2f; // @[dec_tlu_ctl.scala 2847:42]
  wire  _T_1031 = io_mhpme_vec_3 == 10'h30; // @[dec_tlu_ctl.scala 2848:42]
  wire  _T_1033 = io_mhpme_vec_3 == 10'h31; // @[dec_tlu_ctl.scala 2849:42]
  wire  _T_1038 = io_mhpme_vec_3 == 10'h32; // @[dec_tlu_ctl.scala 2850:42]
  wire  _T_1048 = io_mhpme_vec_3 == 10'h36; // @[dec_tlu_ctl.scala 2851:42]
  wire  _T_1051 = io_mhpme_vec_3 == 10'h37; // @[dec_tlu_ctl.scala 2852:42]
  wire  _T_1056 = io_mhpme_vec_3 == 10'h38; // @[dec_tlu_ctl.scala 2853:42]
  wire  _T_1061 = io_mhpme_vec_3 == 10'h200; // @[dec_tlu_ctl.scala 2855:42]
  wire  _T_1063 = io_mhpme_vec_3 == 10'h201; // @[dec_tlu_ctl.scala 2856:42]
  wire  _T_1065 = io_mhpme_vec_3 == 10'h202; // @[dec_tlu_ctl.scala 2857:42]
  wire  _T_1067 = io_mhpme_vec_3 == 10'h203; // @[dec_tlu_ctl.scala 2858:42]
  wire  _T_1069 = io_mhpme_vec_3 == 10'h204; // @[dec_tlu_ctl.scala 2859:42]
  wire  _T_1072 = _T_894 & io_ifu_pmu_ic_hit; // @[Mux.scala 27:72]
  wire  _T_1073 = _T_896 & io_ifu_pmu_ic_miss; // @[Mux.scala 27:72]
  wire  _T_1074 = _T_898 & _T_13; // @[Mux.scala 27:72]
  wire  _T_1075 = _T_902 & _T_19; // @[Mux.scala 27:72]
  wire  _T_1076 = _T_908 & _T_24; // @[Mux.scala 27:72]
  wire  _T_1077 = _T_913 & io_ifu_pmu_instr_aligned; // @[Mux.scala 27:72]
  wire  _T_1078 = _T_915 & io_dec_pmu_instr_decoded; // @[Mux.scala 27:72]
  wire  _T_1079 = _T_917 & io_dec_pmu_decode_stall; // @[Mux.scala 27:72]
  wire  _T_1080 = _T_919 & _T_33; // @[Mux.scala 27:72]
  wire  _T_1081 = _T_922 & _T_38; // @[Mux.scala 27:72]
  wire  _T_1082 = _T_927 & _T_41; // @[Mux.scala 27:72]
  wire  _T_1083 = _T_930 & _T_44; // @[Mux.scala 27:72]
  wire  _T_1084 = _T_933 & _T_48; // @[Mux.scala 27:72]
  wire  _T_1085 = _T_937 & _T_53; // @[Mux.scala 27:72]
  wire  _T_1086 = _T_942 & _T_56; // @[Mux.scala 27:72]
  wire  _T_1087 = _T_945 & _T_59; // @[Mux.scala 27:72]
  wire  _T_1088 = _T_948 & _T_62; // @[Mux.scala 27:72]
  wire  _T_1089 = _T_951 & _T_65; // @[Mux.scala 27:72]
  wire  _T_1090 = _T_954 & _T_68; // @[Mux.scala 27:72]
  wire  _T_1091 = _T_957 & _T_71; // @[Mux.scala 27:72]
  wire  _T_1092 = _T_960 & _T_74; // @[Mux.scala 27:72]
  wire  _T_1093 = _T_963 & _T_77; // @[Mux.scala 27:72]
  wire  _T_1094 = _T_966 & _T_80; // @[Mux.scala 27:72]
  wire  _T_1095 = _T_969 & _T_85; // @[Mux.scala 27:72]
  wire  _T_1096 = _T_974 & _T_90; // @[Mux.scala 27:72]
  wire  _T_1097 = _T_979 & _T_95; // @[Mux.scala 27:72]
  wire  _T_1098 = _T_984 & _T_100; // @[Mux.scala 27:72]
  wire  _T_1099 = _T_989 & io_ifu_pmu_fetch_stall; // @[Mux.scala 27:72]
  wire  _T_1101 = _T_993 & io_dec_pmu_postsync_stall; // @[Mux.scala 27:72]
  wire  _T_1102 = _T_995 & io_dec_pmu_presync_stall; // @[Mux.scala 27:72]
  wire  _T_1103 = _T_997 & io_lsu_store_stall_any; // @[Mux.scala 27:72]
  wire  _T_1104 = _T_999 & io_dma_dccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1105 = _T_1001 & io_dma_iccm_stall_any; // @[Mux.scala 27:72]
  wire  _T_1106 = _T_1003 & _T_118; // @[Mux.scala 27:72]
  wire  _T_1107 = _T_1007 & _T_122; // @[Mux.scala 27:72]
  wire  _T_1108 = _T_1011 & io_take_ext_int; // @[Mux.scala 27:72]
  wire  _T_1109 = _T_1013 & io_tlu_flush_lower_r; // @[Mux.scala 27:72]
  wire  _T_1110 = _T_1015 & _T_130; // @[Mux.scala 27:72]
  wire  _T_1111 = _T_1019 & io_ifu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1112 = _T_1021 & io_lsu_pmu_bus_trxn; // @[Mux.scala 27:72]
  wire  _T_1113 = _T_1023 & io_lsu_pmu_bus_misaligned; // @[Mux.scala 27:72]
  wire  _T_1114 = _T_1025 & io_ifu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1115 = _T_1027 & io_lsu_pmu_bus_error; // @[Mux.scala 27:72]
  wire  _T_1116 = _T_1029 & io_ifu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1117 = _T_1031 & io_lsu_pmu_bus_busy; // @[Mux.scala 27:72]
  wire  _T_1118 = _T_1033 & _T_149; // @[Mux.scala 27:72]
  wire  _T_1119 = _T_1038 & _T_159; // @[Mux.scala 27:72]
  wire  _T_1120 = _T_1048 & _T_162; // @[Mux.scala 27:72]
  wire  _T_1121 = _T_1051 & _T_167; // @[Mux.scala 27:72]
  wire  _T_1122 = _T_1056 & _T_172; // @[Mux.scala 27:72]
  wire  _T_1123 = _T_1061 & io_dec_tlu_pmu_fw_halted; // @[Mux.scala 27:72]
  wire  _T_1124 = _T_1063 & io_dma_pmu_any_read; // @[Mux.scala 27:72]
  wire  _T_1125 = _T_1065 & io_dma_pmu_any_write; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1067 & io_dma_pmu_dccm_read; // @[Mux.scala 27:72]
  wire  _T_1127 = _T_1069 & io_dma_pmu_dccm_write; // @[Mux.scala 27:72]
  wire  _T_1128 = _T_892 | _T_1072; // @[Mux.scala 27:72]
  wire  _T_1129 = _T_1128 | _T_1073; // @[Mux.scala 27:72]
  wire  _T_1130 = _T_1129 | _T_1074; // @[Mux.scala 27:72]
  wire  _T_1131 = _T_1130 | _T_1075; // @[Mux.scala 27:72]
  wire  _T_1132 = _T_1131 | _T_1076; // @[Mux.scala 27:72]
  wire  _T_1133 = _T_1132 | _T_1077; // @[Mux.scala 27:72]
  wire  _T_1134 = _T_1133 | _T_1078; // @[Mux.scala 27:72]
  wire  _T_1135 = _T_1134 | _T_1079; // @[Mux.scala 27:72]
  wire  _T_1136 = _T_1135 | _T_1080; // @[Mux.scala 27:72]
  wire  _T_1137 = _T_1136 | _T_1081; // @[Mux.scala 27:72]
  wire  _T_1138 = _T_1137 | _T_1082; // @[Mux.scala 27:72]
  wire  _T_1139 = _T_1138 | _T_1083; // @[Mux.scala 27:72]
  wire  _T_1140 = _T_1139 | _T_1084; // @[Mux.scala 27:72]
  wire  _T_1141 = _T_1140 | _T_1085; // @[Mux.scala 27:72]
  wire  _T_1142 = _T_1141 | _T_1086; // @[Mux.scala 27:72]
  wire  _T_1143 = _T_1142 | _T_1087; // @[Mux.scala 27:72]
  wire  _T_1144 = _T_1143 | _T_1088; // @[Mux.scala 27:72]
  wire  _T_1145 = _T_1144 | _T_1089; // @[Mux.scala 27:72]
  wire  _T_1146 = _T_1145 | _T_1090; // @[Mux.scala 27:72]
  wire  _T_1147 = _T_1146 | _T_1091; // @[Mux.scala 27:72]
  wire  _T_1148 = _T_1147 | _T_1092; // @[Mux.scala 27:72]
  wire  _T_1149 = _T_1148 | _T_1093; // @[Mux.scala 27:72]
  wire  _T_1150 = _T_1149 | _T_1094; // @[Mux.scala 27:72]
  wire  _T_1151 = _T_1150 | _T_1095; // @[Mux.scala 27:72]
  wire  _T_1152 = _T_1151 | _T_1096; // @[Mux.scala 27:72]
  wire  _T_1153 = _T_1152 | _T_1097; // @[Mux.scala 27:72]
  wire  _T_1154 = _T_1153 | _T_1098; // @[Mux.scala 27:72]
  wire  _T_1155 = _T_1154 | _T_1099; // @[Mux.scala 27:72]
  wire  _T_1156 = _T_1155 | _T_1079; // @[Mux.scala 27:72]
  wire  _T_1157 = _T_1156 | _T_1101; // @[Mux.scala 27:72]
  wire  _T_1158 = _T_1157 | _T_1102; // @[Mux.scala 27:72]
  wire  _T_1159 = _T_1158 | _T_1103; // @[Mux.scala 27:72]
  wire  _T_1160 = _T_1159 | _T_1104; // @[Mux.scala 27:72]
  wire  _T_1161 = _T_1160 | _T_1105; // @[Mux.scala 27:72]
  wire  _T_1162 = _T_1161 | _T_1106; // @[Mux.scala 27:72]
  wire  _T_1163 = _T_1162 | _T_1107; // @[Mux.scala 27:72]
  wire  _T_1164 = _T_1163 | _T_1108; // @[Mux.scala 27:72]
  wire  _T_1165 = _T_1164 | _T_1109; // @[Mux.scala 27:72]
  wire  _T_1166 = _T_1165 | _T_1110; // @[Mux.scala 27:72]
  wire  _T_1167 = _T_1166 | _T_1111; // @[Mux.scala 27:72]
  wire  _T_1168 = _T_1167 | _T_1112; // @[Mux.scala 27:72]
  wire  _T_1169 = _T_1168 | _T_1113; // @[Mux.scala 27:72]
  wire  _T_1170 = _T_1169 | _T_1114; // @[Mux.scala 27:72]
  wire  _T_1171 = _T_1170 | _T_1115; // @[Mux.scala 27:72]
  wire  _T_1172 = _T_1171 | _T_1116; // @[Mux.scala 27:72]
  wire  _T_1173 = _T_1172 | _T_1117; // @[Mux.scala 27:72]
  wire  _T_1174 = _T_1173 | _T_1118; // @[Mux.scala 27:72]
  wire  _T_1175 = _T_1174 | _T_1119; // @[Mux.scala 27:72]
  wire  _T_1176 = _T_1175 | _T_1120; // @[Mux.scala 27:72]
  wire  _T_1177 = _T_1176 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1178 = _T_1177 | _T_1122; // @[Mux.scala 27:72]
  wire  _T_1179 = _T_1178 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1180 = _T_1179 | _T_1124; // @[Mux.scala 27:72]
  wire  _T_1181 = _T_1180 | _T_1125; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1181 | _T_1126; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1182 | _T_1127; // @[Mux.scala 27:72]
  reg  _T_1189; // @[Reg.scala 27:20]
  wire  _T_1187 = io_mdseac_locked_ns ^ _T_1189; // @[lib.scala 470:21]
  wire  _T_1188 = |_T_1187; // @[lib.scala 470:29]
  reg  _T_1193; // @[Reg.scala 27:20]
  wire  _T_1191 = io_lsu_single_ecc_error_r ^ _T_1193; // @[lib.scala 470:21]
  wire  _T_1192 = |_T_1191; // @[lib.scala 470:29]
  reg  _T_1201; // @[Reg.scala 27:20]
  wire  _T_1199 = io_lsu_i0_exc_r ^ _T_1201; // @[lib.scala 470:21]
  wire  _T_1200 = |_T_1199; // @[lib.scala 470:29]
  reg  _T_1205; // @[Reg.scala 27:20]
  wire  _T_1203 = io_take_ext_int_start ^ _T_1205; // @[lib.scala 470:21]
  wire  _T_1204 = |_T_1203; // @[lib.scala 470:29]
  reg  _T_1209; // @[Reg.scala 27:20]
  wire  _T_1207 = io_take_ext_int_start_d1 ^ _T_1209; // @[lib.scala 470:21]
  wire  _T_1208 = |_T_1207; // @[lib.scala 470:29]
  reg  _T_1213; // @[Reg.scala 27:20]
  wire  _T_1211 = io_take_ext_int_start_d2 ^ _T_1213; // @[lib.scala 470:21]
  wire  _T_1212 = |_T_1211; // @[lib.scala 470:29]
  reg  _T_1217; // @[Reg.scala 27:20]
  wire  _T_1215 = io_ext_int_freeze ^ _T_1217; // @[lib.scala 470:21]
  wire  _T_1216 = |_T_1215; // @[lib.scala 470:29]
  reg [5:0] _T_1221; // @[Reg.scala 27:20]
  wire [5:0] _T_1219 = io_mip_ns ^ _T_1221; // @[lib.scala 448:21]
  wire  _T_1220 = |_T_1219; // @[lib.scala 448:29]
  wire  _T_1222 = ~io_wr_mcycleh_r; // @[dec_tlu_ctl.scala 2879:80]
  wire  _T_1223 = io_mcyclel_cout & _T_1222; // @[dec_tlu_ctl.scala 2879:78]
  wire  _T_1224 = _T_1223 & io_mcyclel_cout_in; // @[dec_tlu_ctl.scala 2879:97]
  reg  _T_1228; // @[Reg.scala 27:20]
  wire  _T_1226 = _T_1224 ^ _T_1228; // @[lib.scala 470:21]
  wire  _T_1227 = |_T_1226; // @[lib.scala 470:29]
  reg  _T_1232; // @[Reg.scala 27:20]
  wire  _T_1230 = io_minstret_enable ^ _T_1232; // @[lib.scala 470:21]
  wire  _T_1231 = |_T_1230; // @[lib.scala 470:29]
  reg  _T_1236; // @[Reg.scala 27:20]
  wire  _T_1234 = io_minstretl_cout_ns ^ _T_1236; // @[lib.scala 470:21]
  wire  _T_1235 = |_T_1234; // @[lib.scala 470:29]
  reg [3:0] _T_1244; // @[Reg.scala 27:20]
  wire [3:0] _T_1242 = io_meicidpl_ns ^ _T_1244; // @[lib.scala 448:21]
  wire  _T_1243 = |_T_1242; // @[lib.scala 448:29]
  reg  _T_1248; // @[Reg.scala 27:20]
  wire  _T_1246 = io_icache_rd_valid ^ _T_1248; // @[lib.scala 470:21]
  wire  _T_1247 = |_T_1246; // @[lib.scala 470:29]
  reg  _T_1252; // @[Reg.scala 27:20]
  wire  _T_1250 = io_icache_wr_valid ^ _T_1252; // @[lib.scala 470:21]
  wire  _T_1251 = |_T_1250; // @[lib.scala 470:29]
  reg  _T_1266_0; // @[Reg.scala 27:20]
  wire  _T_1254 = io_mhpmc_inc_r_0 ^ _T_1266_0; // @[lib.scala 518:68]
  wire  _T_1255 = |_T_1254; // @[lib.scala 518:82]
  reg  _T_1266_1; // @[Reg.scala 27:20]
  wire  _T_1256 = io_mhpmc_inc_r_1 ^ _T_1266_1; // @[lib.scala 518:68]
  wire  _T_1257 = |_T_1256; // @[lib.scala 518:82]
  reg  _T_1266_2; // @[Reg.scala 27:20]
  wire  _T_1258 = io_mhpmc_inc_r_2 ^ _T_1266_2; // @[lib.scala 518:68]
  wire  _T_1259 = |_T_1258; // @[lib.scala 518:82]
  reg  _T_1266_3; // @[Reg.scala 27:20]
  wire  _T_1260 = io_mhpmc_inc_r_3 ^ _T_1266_3; // @[lib.scala 518:68]
  wire  _T_1261 = |_T_1260; // @[lib.scala 518:82]
  wire  _T_1262 = _T_1255 | _T_1257; // @[lib.scala 518:97]
  wire  _T_1263 = _T_1262 | _T_1259; // @[lib.scala 518:97]
  wire  _T_1264 = _T_1263 | _T_1261; // @[lib.scala 518:97]
  reg  _T_1270; // @[Reg.scala 27:20]
  wire  _T_1268 = io_perfcnt_halted ^ _T_1270; // @[lib.scala 470:21]
  wire  _T_1269 = |_T_1268; // @[lib.scala 470:29]
  reg [1:0] _T_1274; // @[Reg.scala 27:20]
  wire [1:0] _T_1272 = io_mstatus_ns ^ _T_1274; // @[lib.scala 448:21]
  wire  _T_1273 = |_T_1272; // @[lib.scala 448:29]
  assign io_mhpmc_inc_r_0 = _T_3 & _T_295; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mhpmc_inc_r_1 = _T_299 & _T_591; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mhpmc_inc_r_2 = _T_595 & _T_887; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mhpmc_inc_r_3 = _T_891 & _T_1183; // @[dec_tlu_ctl.scala 2797:35]
  assign io_mstatus = _T_1274; // @[dec_tlu_ctl.scala 2888:52]
  assign io_mcyclel_cout_f = _T_1228; // @[dec_tlu_ctl.scala 2879:52]
  assign io_minstret_enable_f = _T_1232; // @[dec_tlu_ctl.scala 2880:52]
  assign io_minstretl_cout_f = _T_1236; // @[dec_tlu_ctl.scala 2881:52]
  assign io_meicidpl = _T_1244; // @[dec_tlu_ctl.scala 2883:52]
  assign io_icache_rd_valid_f = _T_1248; // @[dec_tlu_ctl.scala 2884:52]
  assign io_icache_wr_valid_f = _T_1252; // @[dec_tlu_ctl.scala 2885:52]
  assign io_mhpmc_inc_r_d1_0 = _T_1266_0; // @[dec_tlu_ctl.scala 2886:52]
  assign io_mhpmc_inc_r_d1_1 = _T_1266_1; // @[dec_tlu_ctl.scala 2886:52]
  assign io_mhpmc_inc_r_d1_2 = _T_1266_2; // @[dec_tlu_ctl.scala 2886:52]
  assign io_mhpmc_inc_r_d1_3 = _T_1266_3; // @[dec_tlu_ctl.scala 2886:52]
  assign io_perfcnt_halted_d1 = _T_1270; // @[dec_tlu_ctl.scala 2887:52]
  assign io_mdseac_locked_f = _T_1189; // @[dec_tlu_ctl.scala 2870:52]
  assign io_lsu_single_ecc_error_r_d1 = _T_1193; // @[dec_tlu_ctl.scala 2871:52]
  assign io_lsu_i0_exc_r_d1 = _T_1201; // @[dec_tlu_ctl.scala 2873:52]
  assign io_take_ext_int_start_d1 = _T_1205; // @[dec_tlu_ctl.scala 2874:52]
  assign io_take_ext_int_start_d2 = _T_1209; // @[dec_tlu_ctl.scala 2875:52]
  assign io_take_ext_int_start_d3 = _T_1213; // @[dec_tlu_ctl.scala 2876:52]
  assign io_ext_int_freeze_d1 = _T_1217; // @[dec_tlu_ctl.scala 2877:52]
  assign io_mip = _T_1221; // @[dec_tlu_ctl.scala 2878:52]
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
  _T_1189 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1193 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1201 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1205 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1209 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1213 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1217 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1221 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  _T_1228 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_1232 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_1236 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_1244 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  _T_1248 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_1252 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_1266_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_1266_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_1266_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1266_3 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_1270 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_1274 = _RAND_19[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1189 = 1'h0;
  end
  if (reset) begin
    _T_1193 = 1'h0;
  end
  if (reset) begin
    _T_1201 = 1'h0;
  end
  if (reset) begin
    _T_1205 = 1'h0;
  end
  if (reset) begin
    _T_1209 = 1'h0;
  end
  if (reset) begin
    _T_1213 = 1'h0;
  end
  if (reset) begin
    _T_1217 = 1'h0;
  end
  if (reset) begin
    _T_1221 = 6'h0;
  end
  if (reset) begin
    _T_1228 = 1'h0;
  end
  if (reset) begin
    _T_1232 = 1'h0;
  end
  if (reset) begin
    _T_1236 = 1'h0;
  end
  if (reset) begin
    _T_1244 = 4'h0;
  end
  if (reset) begin
    _T_1248 = 1'h0;
  end
  if (reset) begin
    _T_1252 = 1'h0;
  end
  if (reset) begin
    _T_1266_0 = 1'h0;
  end
  if (reset) begin
    _T_1266_1 = 1'h0;
  end
  if (reset) begin
    _T_1266_2 = 1'h0;
  end
  if (reset) begin
    _T_1266_3 = 1'h0;
  end
  if (reset) begin
    _T_1270 = 1'h0;
  end
  if (reset) begin
    _T_1274 = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1189 <= 1'h0;
    end else if (_T_1188) begin
      _T_1189 <= io_mdseac_locked_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1193 <= 1'h0;
    end else if (_T_1192) begin
      _T_1193 <= io_lsu_single_ecc_error_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1201 <= 1'h0;
    end else if (_T_1200) begin
      _T_1201 <= io_lsu_i0_exc_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1205 <= 1'h0;
    end else if (_T_1204) begin
      _T_1205 <= io_take_ext_int_start;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1209 <= 1'h0;
    end else if (_T_1208) begin
      _T_1209 <= io_take_ext_int_start_d1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1213 <= 1'h0;
    end else if (_T_1212) begin
      _T_1213 <= io_take_ext_int_start_d2;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1217 <= 1'h0;
    end else if (_T_1216) begin
      _T_1217 <= io_ext_int_freeze;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1221 <= 6'h0;
    end else if (_T_1220) begin
      _T_1221 <= io_mip_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1228 <= 1'h0;
    end else if (_T_1227) begin
      _T_1228 <= _T_1224;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1232 <= 1'h0;
    end else if (_T_1231) begin
      _T_1232 <= io_minstret_enable;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1236 <= 1'h0;
    end else if (_T_1235) begin
      _T_1236 <= io_minstretl_cout_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1244 <= 4'h0;
    end else if (_T_1243) begin
      _T_1244 <= io_meicidpl_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1248 <= 1'h0;
    end else if (_T_1247) begin
      _T_1248 <= io_icache_rd_valid;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1252 <= 1'h0;
    end else if (_T_1251) begin
      _T_1252 <= io_icache_wr_valid;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_0 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_0 <= io_mhpmc_inc_r_0;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_1 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_1 <= io_mhpmc_inc_r_1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_2 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_2 <= io_mhpmc_inc_r_2;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1266_3 <= 1'h0;
    end else if (_T_1264) begin
      _T_1266_3 <= io_mhpmc_inc_r_3;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1270 <= 1'h0;
    end else if (_T_1269) begin
      _T_1270 <= io_perfcnt_halted;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_1274 <= 2'h0;
    end else if (_T_1273) begin
      _T_1274 <= io_mstatus_ns;
    end
  end
endmodule
module perf_csr(
  input         clock,
  input         reset,
  input         io_free_l2clk,
  input         io_dec_tlu_dbg_halted,
  input  [15:0] io_dcsr,
  input         io_dec_tlu_pmu_fw_halted,
  input  [9:0]  io_mhpme_vec_0,
  input  [9:0]  io_mhpme_vec_1,
  input  [9:0]  io_mhpme_vec_2,
  input  [9:0]  io_mhpme_vec_3,
  input         io_dec_csr_wen_r_mod,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_mhpmc_inc_r_0,
  input         io_mhpmc_inc_r_1,
  input         io_mhpmc_inc_r_2,
  input         io_mhpmc_inc_r_3,
  input         io_mhpmc_inc_r_d1_0,
  input         io_mhpmc_inc_r_d1_1,
  input         io_mhpmc_inc_r_d1_2,
  input         io_mhpmc_inc_r_d1_3,
  input         io_perfcnt_halted_d1,
  output [31:0] io_mhpmc3h,
  output [31:0] io_mhpmc3,
  output [31:0] io_mhpmc4h,
  output [31:0] io_mhpmc4,
  output [31:0] io_mhpmc5h,
  output [31:0] io_mhpmc5,
  output [31:0] io_mhpmc6h,
  output [31:0] io_mhpmc6,
  output [9:0]  io_mhpme3,
  output [9:0]  io_mhpme4,
  output [9:0]  io_mhpme5,
  output [9:0]  io_mhpme6,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 404:23]
  wire  _T_1 = io_dec_tlu_dbg_halted & io_dcsr[10]; // @[dec_tlu_ctl.scala 2578:54]
  wire  perfcnt_halted = _T_1 | io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2578:77]
  wire  _T_4 = ~_T_1; // @[dec_tlu_ctl.scala 2579:44]
  wire [3:0] _T_6 = _T_4 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_13 = {io_mhpme_vec_3[9],io_mhpme_vec_2[9],io_mhpme_vec_1[9],io_mhpme_vec_0[9]}; // @[Cat.scala 29:58]
  wire [3:0] perfcnt_during_sleep = _T_6 & _T_13; // @[dec_tlu_ctl.scala 2579:93]
  wire  _T_15 = ~perfcnt_during_sleep[0]; // @[dec_tlu_ctl.scala 2582:80]
  wire  _T_16 = io_perfcnt_halted_d1 & _T_15; // @[dec_tlu_ctl.scala 2582:78]
  wire  _T_17 = ~_T_16; // @[dec_tlu_ctl.scala 2582:55]
  wire  _T_20 = ~perfcnt_during_sleep[1]; // @[dec_tlu_ctl.scala 2583:80]
  wire  _T_21 = io_perfcnt_halted_d1 & _T_20; // @[dec_tlu_ctl.scala 2583:78]
  wire  _T_22 = ~_T_21; // @[dec_tlu_ctl.scala 2583:55]
  wire  _T_25 = ~perfcnt_during_sleep[2]; // @[dec_tlu_ctl.scala 2584:80]
  wire  _T_26 = io_perfcnt_halted_d1 & _T_25; // @[dec_tlu_ctl.scala 2584:78]
  wire  _T_27 = ~_T_26; // @[dec_tlu_ctl.scala 2584:55]
  wire  _T_30 = ~perfcnt_during_sleep[3]; // @[dec_tlu_ctl.scala 2585:80]
  wire  _T_31 = io_perfcnt_halted_d1 & _T_30; // @[dec_tlu_ctl.scala 2585:78]
  wire  _T_32 = ~_T_31; // @[dec_tlu_ctl.scala 2585:55]
  wire  _T_35 = io_dec_csr_wraddr_r == 12'hb03; // @[dec_tlu_ctl.scala 2591:79]
  wire  mhpmc3_wr_en0 = io_dec_csr_wen_r_mod & _T_35; // @[dec_tlu_ctl.scala 2591:50]
  wire  _T_36 = ~perfcnt_halted; // @[dec_tlu_ctl.scala 2592:30]
  wire  _T_38 = _T_36 | perfcnt_during_sleep[0]; // @[dec_tlu_ctl.scala 2592:46]
  wire  _T_39 = |io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 2592:96]
  wire  mhpmc3_wr_en1 = _T_38 & _T_39; // @[dec_tlu_ctl.scala 2592:73]
  wire  mhpmc3_wr_en = mhpmc3_wr_en0 | mhpmc3_wr_en1; // @[dec_tlu_ctl.scala 2593:43]
  wire [63:0] _T_42 = {io_mhpmc3h,io_mhpmc3}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc3_incr = _T_42 + 64'h1; // @[dec_tlu_ctl.scala 2596:65]
  reg [31:0] _T_48; // @[Reg.scala 27:20]
  wire  _T_50 = io_dec_csr_wraddr_r == 12'hb83; // @[dec_tlu_ctl.scala 2601:80]
  wire  mhpmc3h_wr_en0 = io_dec_csr_wen_r_mod & _T_50; // @[dec_tlu_ctl.scala 2601:51]
  wire  mhpmc3h_wr_en = mhpmc3h_wr_en0 | mhpmc3_wr_en1; // @[dec_tlu_ctl.scala 2602:45]
  reg [31:0] _T_54; // @[Reg.scala 27:20]
  wire  _T_56 = io_dec_csr_wraddr_r == 12'hb04; // @[dec_tlu_ctl.scala 2612:79]
  wire  mhpmc4_wr_en0 = io_dec_csr_wen_r_mod & _T_56; // @[dec_tlu_ctl.scala 2612:50]
  wire  _T_59 = _T_36 | perfcnt_during_sleep[1]; // @[dec_tlu_ctl.scala 2613:46]
  wire  _T_60 = |io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 2613:96]
  wire  mhpmc4_wr_en1 = _T_59 & _T_60; // @[dec_tlu_ctl.scala 2613:73]
  wire  mhpmc4_wr_en = mhpmc4_wr_en0 | mhpmc4_wr_en1; // @[dec_tlu_ctl.scala 2614:43]
  wire [63:0] _T_63 = {io_mhpmc4h,io_mhpmc4}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc4_incr = _T_63 + 64'h1; // @[dec_tlu_ctl.scala 2618:65]
  reg [31:0] _T_70; // @[Reg.scala 27:20]
  wire  _T_72 = io_dec_csr_wraddr_r == 12'hb84; // @[dec_tlu_ctl.scala 2622:80]
  wire  mhpmc4h_wr_en0 = io_dec_csr_wen_r_mod & _T_72; // @[dec_tlu_ctl.scala 2622:51]
  wire  mhpmc4h_wr_en = mhpmc4h_wr_en0 | mhpmc4_wr_en1; // @[dec_tlu_ctl.scala 2623:45]
  reg [31:0] _T_76; // @[Reg.scala 27:20]
  wire  _T_78 = io_dec_csr_wraddr_r == 12'hb05; // @[dec_tlu_ctl.scala 2631:79]
  wire  mhpmc5_wr_en0 = io_dec_csr_wen_r_mod & _T_78; // @[dec_tlu_ctl.scala 2631:50]
  wire  _T_81 = _T_36 | perfcnt_during_sleep[2]; // @[dec_tlu_ctl.scala 2632:46]
  wire  _T_82 = |io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 2632:96]
  wire  mhpmc5_wr_en1 = _T_81 & _T_82; // @[dec_tlu_ctl.scala 2632:73]
  wire  mhpmc5_wr_en = mhpmc5_wr_en0 | mhpmc5_wr_en1; // @[dec_tlu_ctl.scala 2633:43]
  wire [63:0] _T_85 = {io_mhpmc5h,io_mhpmc5}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc5_incr = _T_85 + 64'h1; // @[dec_tlu_ctl.scala 2635:65]
  reg [31:0] _T_91; // @[Reg.scala 27:20]
  wire  _T_93 = io_dec_csr_wraddr_r == 12'hb85; // @[dec_tlu_ctl.scala 2640:80]
  wire  mhpmc5h_wr_en0 = io_dec_csr_wen_r_mod & _T_93; // @[dec_tlu_ctl.scala 2640:51]
  wire  mhpmc5h_wr_en = mhpmc5h_wr_en0 | mhpmc5_wr_en1; // @[dec_tlu_ctl.scala 2641:45]
  reg [31:0] _T_97; // @[Reg.scala 27:20]
  wire  _T_99 = io_dec_csr_wraddr_r == 12'hb06; // @[dec_tlu_ctl.scala 2651:79]
  wire  mhpmc6_wr_en0 = io_dec_csr_wen_r_mod & _T_99; // @[dec_tlu_ctl.scala 2651:50]
  wire  _T_102 = _T_36 | perfcnt_during_sleep[3]; // @[dec_tlu_ctl.scala 2652:46]
  wire  _T_103 = |io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 2652:96]
  wire  mhpmc6_wr_en1 = _T_102 & _T_103; // @[dec_tlu_ctl.scala 2652:73]
  wire  mhpmc6_wr_en = mhpmc6_wr_en0 | mhpmc6_wr_en1; // @[dec_tlu_ctl.scala 2653:43]
  wire [63:0] _T_106 = {io_mhpmc6h,io_mhpmc6}; // @[Cat.scala 29:58]
  wire [63:0] mhpmc6_incr = _T_106 + 64'h1; // @[dec_tlu_ctl.scala 2655:65]
  reg [31:0] _T_112; // @[Reg.scala 27:20]
  wire  _T_114 = io_dec_csr_wraddr_r == 12'hb86; // @[dec_tlu_ctl.scala 2661:80]
  wire  mhpmc6h_wr_en0 = io_dec_csr_wen_r_mod & _T_114; // @[dec_tlu_ctl.scala 2661:51]
  wire  mhpmc6h_wr_en = mhpmc6h_wr_en0 | mhpmc6_wr_en1; // @[dec_tlu_ctl.scala 2662:45]
  reg [31:0] _T_118; // @[Reg.scala 27:20]
  wire  _T_120 = io_dec_csr_wrdata_r[9:0] > 10'h204; // @[dec_tlu_ctl.scala 2671:56]
  wire  _T_122 = |io_dec_csr_wrdata_r[31:10]; // @[dec_tlu_ctl.scala 2671:102]
  wire  _T_123 = _T_120 | _T_122; // @[dec_tlu_ctl.scala 2671:72]
  wire  _T_125 = io_dec_csr_wrdata_r[9:0] < 10'h200; // @[dec_tlu_ctl.scala 2672:44]
  wire  _T_127 = io_dec_csr_wrdata_r[9:0] > 10'h38; // @[dec_tlu_ctl.scala 2672:88]
  wire  _T_128 = _T_125 & _T_127; // @[dec_tlu_ctl.scala 2672:60]
  wire  _T_129 = _T_123 | _T_128; // @[dec_tlu_ctl.scala 2671:107]
  wire  _T_131 = io_dec_csr_wrdata_r[9:0] < 10'h36; // @[dec_tlu_ctl.scala 2673:44]
  wire  _T_133 = io_dec_csr_wrdata_r[9:0] > 10'h32; // @[dec_tlu_ctl.scala 2673:88]
  wire  _T_134 = _T_131 & _T_133; // @[dec_tlu_ctl.scala 2673:60]
  wire  _T_135 = _T_129 | _T_134; // @[dec_tlu_ctl.scala 2672:103]
  wire  _T_137 = io_dec_csr_wrdata_r[9:0] == 10'h1d; // @[dec_tlu_ctl.scala 2674:43]
  wire  _T_138 = _T_135 | _T_137; // @[dec_tlu_ctl.scala 2673:103]
  wire  _T_140 = io_dec_csr_wrdata_r[9:0] == 10'h21; // @[dec_tlu_ctl.scala 2674:87]
  wire  zero_event_r = _T_138 | _T_140; // @[dec_tlu_ctl.scala 2674:59]
  wire  _T_143 = io_dec_csr_wraddr_r == 12'h323; // @[dec_tlu_ctl.scala 2677:77]
  wire  wr_mhpme3_r = io_dec_csr_wen_r_mod & _T_143; // @[dec_tlu_ctl.scala 2677:48]
  reg [9:0] _T_145; // @[Reg.scala 27:20]
  wire  _T_147 = io_dec_csr_wraddr_r == 12'h324; // @[dec_tlu_ctl.scala 2684:77]
  wire  wr_mhpme4_r = io_dec_csr_wen_r_mod & _T_147; // @[dec_tlu_ctl.scala 2684:48]
  reg [9:0] _T_149; // @[Reg.scala 27:20]
  wire  _T_151 = io_dec_csr_wraddr_r == 12'h325; // @[dec_tlu_ctl.scala 2691:77]
  wire  wr_mhpme5_r = io_dec_csr_wen_r_mod & _T_151; // @[dec_tlu_ctl.scala 2691:48]
  reg [9:0] _T_153; // @[Reg.scala 27:20]
  wire  _T_155 = io_dec_csr_wraddr_r == 12'h326; // @[dec_tlu_ctl.scala 2698:77]
  wire  wr_mhpme6_r = io_dec_csr_wen_r_mod & _T_155; // @[dec_tlu_ctl.scala 2698:48]
  reg [9:0] _T_157; // @[Reg.scala 27:20]
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  assign io_mhpmc3h = _T_54; // @[dec_tlu_ctl.scala 2605:20]
  assign io_mhpmc3 = _T_48; // @[dec_tlu_ctl.scala 2599:19]
  assign io_mhpmc4h = _T_76; // @[dec_tlu_ctl.scala 2625:20]
  assign io_mhpmc4 = _T_70; // @[dec_tlu_ctl.scala 2620:19]
  assign io_mhpmc5h = _T_97; // @[dec_tlu_ctl.scala 2644:20]
  assign io_mhpmc5 = _T_91; // @[dec_tlu_ctl.scala 2638:19]
  assign io_mhpmc6h = _T_118; // @[dec_tlu_ctl.scala 2665:20]
  assign io_mhpmc6 = _T_112; // @[dec_tlu_ctl.scala 2659:19]
  assign io_mhpme3 = _T_145; // @[dec_tlu_ctl.scala 2679:19]
  assign io_mhpme4 = _T_149; // @[dec_tlu_ctl.scala 2685:19]
  assign io_mhpme5 = _T_153; // @[dec_tlu_ctl.scala 2692:19]
  assign io_mhpme6 = _T_157; // @[dec_tlu_ctl.scala 2699:19]
  assign io_dec_tlu_perfcnt0 = io_mhpmc_inc_r_d1_0 & _T_17; // @[dec_tlu_ctl.scala 2582:29]
  assign io_dec_tlu_perfcnt1 = io_mhpmc_inc_r_d1_1 & _T_22; // @[dec_tlu_ctl.scala 2583:29]
  assign io_dec_tlu_perfcnt2 = io_mhpmc_inc_r_d1_2 & _T_27; // @[dec_tlu_ctl.scala 2584:29]
  assign io_dec_tlu_perfcnt3 = io_mhpmc_inc_r_d1_3 & _T_32; // @[dec_tlu_ctl.scala 2585:29]
  assign rvclkhdr_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = mhpmc3_wr_en0 | mhpmc3_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = mhpmc3h_wr_en0 | mhpmc3_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = mhpmc4_wr_en0 | mhpmc4_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = mhpmc4h_wr_en0 | mhpmc4_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = mhpmc5_wr_en0 | mhpmc5_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = mhpmc5h_wr_en0 | mhpmc5_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = mhpmc6_wr_en0 | mhpmc6_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = mhpmc6h_wr_en0 | mhpmc6_wr_en1; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = io_dec_csr_wen_r_mod & _T_143; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = io_dec_csr_wen_r_mod & _T_147; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = io_dec_csr_wen_r_mod & _T_151; // @[lib.scala 407:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_11_io_en = io_dec_csr_wen_r_mod & _T_155; // @[lib.scala 407:17]
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
  _T_48 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  _T_54 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  _T_70 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  _T_76 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  _T_91 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_97 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_112 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_118 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_145 = _RAND_8[9:0];
  _RAND_9 = {1{`RANDOM}};
  _T_149 = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  _T_153 = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  _T_157 = _RAND_11[9:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_48 = 32'h0;
  end
  if (reset) begin
    _T_54 = 32'h0;
  end
  if (reset) begin
    _T_70 = 32'h0;
  end
  if (reset) begin
    _T_76 = 32'h0;
  end
  if (reset) begin
    _T_91 = 32'h0;
  end
  if (reset) begin
    _T_97 = 32'h0;
  end
  if (reset) begin
    _T_112 = 32'h0;
  end
  if (reset) begin
    _T_118 = 32'h0;
  end
  if (reset) begin
    _T_145 = 10'h0;
  end
  if (reset) begin
    _T_149 = 10'h0;
  end
  if (reset) begin
    _T_153 = 10'h0;
  end
  if (reset) begin
    _T_157 = 10'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_48 <= 32'h0;
    end else if (mhpmc3_wr_en) begin
      if (mhpmc3_wr_en0) begin
        _T_48 <= io_dec_csr_wrdata_r;
      end else begin
        _T_48 <= mhpmc3_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_54 <= 32'h0;
    end else if (mhpmc3h_wr_en) begin
      if (mhpmc3h_wr_en0) begin
        _T_54 <= io_dec_csr_wrdata_r;
      end else begin
        _T_54 <= mhpmc3_incr[63:32];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_70 <= 32'h0;
    end else if (mhpmc4_wr_en) begin
      if (mhpmc4_wr_en0) begin
        _T_70 <= io_dec_csr_wrdata_r;
      end else begin
        _T_70 <= mhpmc4_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_76 <= 32'h0;
    end else if (mhpmc4h_wr_en) begin
      if (mhpmc4h_wr_en0) begin
        _T_76 <= io_dec_csr_wrdata_r;
      end else begin
        _T_76 <= mhpmc4_incr[63:32];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_91 <= 32'h0;
    end else if (mhpmc5_wr_en) begin
      if (mhpmc5_wr_en0) begin
        _T_91 <= io_dec_csr_wrdata_r;
      end else begin
        _T_91 <= mhpmc5_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_97 <= 32'h0;
    end else if (mhpmc5h_wr_en) begin
      if (mhpmc5h_wr_en0) begin
        _T_97 <= io_dec_csr_wrdata_r;
      end else begin
        _T_97 <= mhpmc5_incr[63:32];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_112 <= 32'h0;
    end else if (mhpmc6_wr_en) begin
      if (mhpmc6_wr_en0) begin
        _T_112 <= io_dec_csr_wrdata_r;
      end else begin
        _T_112 <= mhpmc6_incr[31:0];
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_118 <= 32'h0;
    end else if (mhpmc6h_wr_en) begin
      if (mhpmc6h_wr_en0) begin
        _T_118 <= io_dec_csr_wrdata_r;
      end else begin
        _T_118 <= mhpmc6_incr[63:32];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_145 <= 10'h0;
    end else if (wr_mhpme3_r) begin
      if (zero_event_r) begin
        _T_145 <= 10'h0;
      end else begin
        _T_145 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_149 <= 10'h0;
    end else if (wr_mhpme4_r) begin
      if (zero_event_r) begin
        _T_149 <= 10'h0;
      end else begin
        _T_149 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_153 <= 10'h0;
    end else if (wr_mhpme5_r) begin
      if (zero_event_r) begin
        _T_153 <= 10'h0;
      end else begin
        _T_153 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_157 <= 10'h0;
    end else if (wr_mhpme6_r) begin
      if (zero_event_r) begin
        _T_157 <= 10'h0;
      end else begin
        _T_157 <= io_dec_csr_wrdata_r[9:0];
      end
    end
  end
endmodule
module csr_tlu(
  input         clock,
  input         reset,
  input         io_free_l2clk,
  input         io_free_clk,
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
  output        io_trigger_pkt_any_0_match_pkt,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_pkt,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_pkt,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_pkt,
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
  output        io_dec_tlu_trace_disable,
  input  [31:0] io_dec_illegal_inst,
  input  [3:0]  io_lsu_error_pkt_r_bits_mscause,
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
  input         io_lsu_single_ecc_error_r,
  input         io_e4e5_int_clk,
  input         io_lsu_i0_exc_r,
  input         io_inst_acc_r,
  input         io_inst_acc_second_r,
  input         io_take_nmi,
  input  [31:0] io_lsu_error_pkt_addr_r,
  input  [4:0]  io_exc_cause_r,
  input         io_i0_valid_wb,
  input         io_interrupt_valid_r_d1,
  input         io_i0_exception_valid_r_d1,
  input  [4:0]  io_exc_cause_wb,
  input         io_nmi_lsu_store_type,
  input         io_nmi_lsu_load_type,
  input         io_tlu_i0_commit_cmt,
  input         io_ebreak_r,
  input         io_ecall_r,
  input         io_illegal_r,
  output        io_mdseac_locked_ns,
  output        io_mdseac_locked_f,
  input         io_nmi_int_detected_f,
  input         io_internal_dbg_halt_mode_f2,
  input         io_ext_int_freeze,
  output        io_ext_int_freeze_d1,
  output        io_take_ext_int_start_d1,
  output        io_take_ext_int_start_d2,
  output        io_take_ext_int_start_d3,
  input         io_ic_perr_r,
  input         io_iccm_sbecc_r,
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
  output [9:0]  io_mtdata1_t_3,
  input  [3:0]  io_trigger_enabled
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
`endif // RANDOMIZE_REG_INIT
  wire  perfmux_flop_reset; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 1455:34]
  wire [6:0] perfmux_flop_io_mcountinhibit; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_0; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_1; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_2; // @[dec_tlu_ctl.scala 1455:34]
  wire [9:0] perfmux_flop_io_mhpme_vec_3; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_illegal_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 1455:34]
  wire [3:0] perfmux_flop_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_any_read; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_any_write; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 1455:34]
  wire [1:0] perfmux_flop_io_mstatus; // @[dec_tlu_ctl.scala 1455:34]
  wire [5:0] perfmux_flop_io_mie; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_timer_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_br0_error_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_rfpc_i0_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mcyclel_cout_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstret_enable_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstretl_cout_f; // @[dec_tlu_ctl.scala 1455:34]
  wire [3:0] perfmux_flop_io_meicidpl; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_rd_valid_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_wr_valid_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_0; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_2; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mhpmc_inc_r_d1_3; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_perfcnt_halted_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_single_ecc_error_r_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_i0_exc_r_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 1455:34]
  wire [5:0] perfmux_flop_io_mip; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mdseac_locked_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_single_ecc_error_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_take_ext_int_start; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_ext_int_freeze; // @[dec_tlu_ctl.scala 1455:34]
  wire [5:0] perfmux_flop_io_mip_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mcyclel_cout; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_wr_mcycleh_r; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_mcyclel_cout_in; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstret_enable; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_minstretl_cout_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire [3:0] perfmux_flop_io_meicidpl_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_rd_valid; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_icache_wr_valid; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_perfcnt_halted; // @[dec_tlu_ctl.scala 1455:34]
  wire [1:0] perfmux_flop_io_mstatus_ns; // @[dec_tlu_ctl.scala 1455:34]
  wire  perfmux_flop_io_free_l2clk; // @[dec_tlu_ctl.scala 1455:34]
  wire  perf_csrs_clock; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_reset; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_free_l2clk; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 1456:31]
  wire [15:0] perf_csrs_io_dcsr; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_0; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_1; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_2; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme_vec_3; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 1456:31]
  wire [11:0] perf_csrs_io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_0; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_1; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_2; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_mhpmc_inc_r_d1_3; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_perfcnt_halted_d1; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc3h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc3; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc4h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc4; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc5h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc5; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc6h; // @[dec_tlu_ctl.scala 1456:31]
  wire [31:0] perf_csrs_io_mhpmc6; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 1456:31]
  wire [9:0] perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 1456:31]
  wire  perf_csrs_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 1456:31]
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_12_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_12_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_13_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_13_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_14_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_14_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_15_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_15_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_16_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_16_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_17_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_17_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_18_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_18_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_19_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_19_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_20_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_20_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_21_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_21_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_22_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_22_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_23_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_23_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_24_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_24_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_25_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_25_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_26_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_26_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_27_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_27_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_28_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_28_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_29_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_29_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_30_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_30_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_31_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_31_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_32_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_32_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_33_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_33_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_34_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_34_io_en; // @[lib.scala 404:23]
  wire  _T = ~io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 1472:52]
  wire  _T_1 = io_dec_csr_wen_r & _T; // @[dec_tlu_ctl.scala 1472:50]
  wire  _T_2 = ~io_rfpc_i0_r; // @[dec_tlu_ctl.scala 1472:75]
  wire  _T_5 = io_dec_csr_wraddr_r == 12'h300; // @[dec_tlu_ctl.scala 1473:78]
  wire  wr_mstatus_r = io_dec_csr_wen_r_mod & _T_5; // @[dec_tlu_ctl.scala 1473:49]
  wire  _T_553 = io_dec_csr_wraddr_r == 12'h7c6; // @[dec_tlu_ctl.scala 1883:69]
  wire  wr_mpmc_r = io_dec_csr_wen_r_mod & _T_553; // @[dec_tlu_ctl.scala 1883:46]
  wire  _T_565 = ~io_dec_csr_wrdata_r[1]; // @[dec_tlu_ctl.scala 1891:44]
  reg  mpmc_b; // @[dec_tlu_ctl.scala 1893:51]
  wire  mpmc = ~mpmc_b; // @[dec_tlu_ctl.scala 1896:17]
  wire  _T_566 = ~mpmc; // @[dec_tlu_ctl.scala 1891:69]
  wire  mpmc_b_ns = wr_mpmc_r ? _T_565 : _T_566; // @[dec_tlu_ctl.scala 1891:25]
  wire  _T_6 = ~mpmc_b_ns; // @[dec_tlu_ctl.scala 1476:35]
  wire  set_mie_pmu_fw_halt = _T_6 & io_fw_halt_req; // @[dec_tlu_ctl.scala 1476:46]
  wire  _T_7 = ~wr_mstatus_r; // @[dec_tlu_ctl.scala 1479:18]
  wire  _T_8 = _T_7 & io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 1479:32]
  wire [1:0] _T_12 = {io_mstatus[0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_13 = wr_mstatus_r & io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 1480:31]
  wire [1:0] _T_16 = {io_dec_csr_wrdata_r[3],1'h0}; // @[Cat.scala 29:58]
  wire  _T_17 = ~io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 1481:30]
  wire  _T_18 = io_mret_r & _T_17; // @[dec_tlu_ctl.scala 1481:28]
  wire [1:0] _T_21 = {1'h1,io_mstatus[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_24 = {io_mstatus[1],1'h1}; // @[Cat.scala 29:58]
  wire  _T_26 = wr_mstatus_r & _T_17; // @[dec_tlu_ctl.scala 1483:31]
  wire [1:0] _T_30 = {io_dec_csr_wrdata_r[7],io_dec_csr_wrdata_r[3]}; // @[Cat.scala 29:58]
  wire  _T_33 = _T_7 & _T_17; // @[dec_tlu_ctl.scala 1484:32]
  wire  _T_34 = ~io_mret_r; // @[dec_tlu_ctl.scala 1484:59]
  wire  _T_35 = _T_33 & _T_34; // @[dec_tlu_ctl.scala 1484:57]
  wire  _T_36 = ~set_mie_pmu_fw_halt; // @[dec_tlu_ctl.scala 1484:72]
  wire  _T_37 = _T_35 & _T_36; // @[dec_tlu_ctl.scala 1484:70]
  wire [1:0] _T_39 = _T_8 ? _T_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_40 = _T_13 ? _T_16 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_41 = _T_18 ? _T_21 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_42 = set_mie_pmu_fw_halt ? _T_24 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_43 = _T_26 ? _T_30 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_44 = _T_37 ? io_mstatus : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_45 = _T_39 | _T_40; // @[Mux.scala 27:72]
  wire [1:0] _T_46 = _T_45 | _T_41; // @[Mux.scala 27:72]
  wire [1:0] _T_47 = _T_46 | _T_42; // @[Mux.scala 27:72]
  wire [1:0] _T_48 = _T_47 | _T_43; // @[Mux.scala 27:72]
  wire  _T_52 = ~io_dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 1489:57]
  wire  _T_54 = _T_52 | io_dcsr[11]; // @[dec_tlu_ctl.scala 1489:88]
  wire  _T_57 = io_dec_csr_wraddr_r == 12'h305; // @[dec_tlu_ctl.scala 1500:76]
  wire  wr_mtvec_r = io_dec_csr_wen_r_mod & _T_57; // @[dec_tlu_ctl.scala 1500:47]
  wire [30:0] mtvec_ns = {io_dec_csr_wrdata_r[31:2],io_dec_csr_wrdata_r[0]}; // @[Cat.scala 29:58]
  reg [30:0] _T_61; // @[Reg.scala 27:20]
  reg [31:0] mdccmect; // @[Reg.scala 27:20]
  wire [62:0] _T_629 = 63'hffffffff << mdccmect[31:27]; // @[dec_tlu_ctl.scala 1942:48]
  wire [31:0] _T_631 = {5'h0,mdccmect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_43 = {{31'd0}, _T_631}; // @[dec_tlu_ctl.scala 1942:68]
  wire [62:0] _T_632 = _T_629 & _GEN_43; // @[dec_tlu_ctl.scala 1942:68]
  wire  mdccme_ce_req = |_T_632; // @[dec_tlu_ctl.scala 1942:101]
  reg [31:0] miccmect; // @[Reg.scala 27:20]
  wire [62:0] _T_609 = 63'hffffffff << miccmect[31:27]; // @[dec_tlu_ctl.scala 1928:48]
  wire [31:0] _T_611 = {5'h0,miccmect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_44 = {{31'd0}, _T_611}; // @[dec_tlu_ctl.scala 1928:68]
  wire [62:0] _T_612 = _T_609 & _GEN_44; // @[dec_tlu_ctl.scala 1928:68]
  wire  miccme_ce_req = |_T_612; // @[dec_tlu_ctl.scala 1928:101]
  wire  _T_62 = mdccme_ce_req | miccme_ce_req; // @[dec_tlu_ctl.scala 1514:37]
  reg [31:0] micect; // @[Reg.scala 27:20]
  wire [62:0] _T_587 = 63'hffffffff << micect[31:27]; // @[dec_tlu_ctl.scala 1913:46]
  wire [31:0] _T_589 = {5'h0,micect[26:0]}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_45 = {{31'd0}, _T_589}; // @[dec_tlu_ctl.scala 1913:64]
  wire [62:0] _T_590 = _T_587 & _GEN_45; // @[dec_tlu_ctl.scala 1913:64]
  wire  mice_ce_req = |_T_590; // @[dec_tlu_ctl.scala 1913:95]
  wire  ce_int = _T_62 | mice_ce_req; // @[dec_tlu_ctl.scala 1514:53]
  wire [2:0] _T_64 = {io_mexintpend,io_timer_int_sync,io_soft_int_sync}; // @[Cat.scala 29:58]
  wire [2:0] _T_66 = {ce_int,io_dec_timer_t0_pulse,io_dec_timer_t1_pulse}; // @[Cat.scala 29:58]
  wire  _T_68 = io_dec_csr_wraddr_r == 12'h304; // @[dec_tlu_ctl.scala 1530:74]
  wire  wr_mie_r = io_dec_csr_wen_r_mod & _T_68; // @[dec_tlu_ctl.scala 1530:45]
  wire [5:0] _T_76 = {io_dec_csr_wrdata_r[30:28],io_dec_csr_wrdata_r[11],io_dec_csr_wrdata_r[7],io_dec_csr_wrdata_r[3]}; // @[Cat.scala 29:58]
  reg [5:0] mie; // @[dec_tlu_ctl.scala 1533:24]
  wire  kill_ebreak_count_r = io_ebreak_to_debug_mode_r & io_dcsr[10]; // @[dec_tlu_ctl.scala 1539:61]
  wire  _T_81 = io_dec_csr_wraddr_r == 12'hb00; // @[dec_tlu_ctl.scala 1541:78]
  wire  wr_mcyclel_r = io_dec_csr_wen_r_mod & _T_81; // @[dec_tlu_ctl.scala 1541:49]
  wire  _T_83 = io_dec_tlu_dbg_halted & io_dcsr[10]; // @[dec_tlu_ctl.scala 1543:78]
  wire  _T_84 = kill_ebreak_count_r | _T_83; // @[dec_tlu_ctl.scala 1543:53]
  wire  _T_85 = _T_84 | io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 1543:101]
  reg [4:0] temp_ncount6_2; // @[Reg.scala 27:20]
  wire [5:0] _T_1138 = {temp_ncount6_2,1'h0}; // @[Cat.scala 29:58]
  reg  temp_ncount0; // @[Reg.scala 27:20]
  wire [6:0] mcountinhibit = {temp_ncount6_2,1'h0,temp_ncount0}; // @[Cat.scala 29:58]
  wire  _T_87 = _T_85 | mcountinhibit[0]; // @[dec_tlu_ctl.scala 1543:128]
  wire  mcyclel_cout_in = ~_T_87; // @[dec_tlu_ctl.scala 1543:31]
  reg [23:0] _T_106; // @[Reg.scala 27:20]
  reg [7:0] _T_110; // @[Reg.scala 27:20]
  wire [31:0] mcyclel = {_T_106,_T_110}; // @[Cat.scala 29:58]
  wire [8:0] mcyclel_inc1 = mcyclel[7:0] + 8'h1; // @[dec_tlu_ctl.scala 1548:38]
  wire [23:0] _T_93 = {23'h0,mcyclel_inc1[8]}; // @[Cat.scala 29:58]
  wire [24:0] mcyclel_inc2 = mcyclel[31:8] + _T_93; // @[dec_tlu_ctl.scala 1549:39]
  wire [31:0] mcyclel_inc = {mcyclel_inc2[23:0],mcyclel_inc1[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] mcyclel_ns = wr_mcyclel_r ? io_dec_csr_wrdata_r : mcyclel_inc; // @[dec_tlu_ctl.scala 1551:29]
  wire  _T_102 = mcyclel_inc1[8] & mcyclel_cout_in; // @[dec_tlu_ctl.scala 1553:82]
  wire  _T_104 = wr_mcyclel_r | _T_102; // @[dec_tlu_ctl.scala 1553:63]
  wire  _T_108 = wr_mcyclel_r | mcyclel_cout_in; // @[dec_tlu_ctl.scala 1553:184]
  wire  _T_113 = io_dec_csr_wraddr_r == 12'hb80; // @[dec_tlu_ctl.scala 1560:78]
  wire  wr_mcycleh_r = io_dec_csr_wen_r_mod & _T_113; // @[dec_tlu_ctl.scala 1560:49]
  wire [31:0] _T_114 = {31'h0,perfmux_flop_io_mcyclel_cout_f}; // @[Cat.scala 29:58]
  reg [31:0] mcycleh; // @[Reg.scala 27:20]
  wire [31:0] mcycleh_inc = mcycleh + _T_114; // @[dec_tlu_ctl.scala 1562:35]
  wire  _T_117 = wr_mcycleh_r | perfmux_flop_io_mcyclel_cout_f; // @[dec_tlu_ctl.scala 1565:53]
  wire  _T_120 = io_ebreak_r | io_ecall_r; // @[dec_tlu_ctl.scala 1579:81]
  wire  _T_121 = _T_120 | io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 1579:94]
  wire  _T_122 = _T_121 | io_illegal_r; // @[dec_tlu_ctl.scala 1579:122]
  wire  _T_124 = _T_122 | mcountinhibit[2]; // @[dec_tlu_ctl.scala 1579:137]
  wire  _T_125 = ~_T_124; // @[dec_tlu_ctl.scala 1579:67]
  wire  i0_valid_no_ebreak_ecall_r = io_dec_tlu_i0_valid_r & _T_125; // @[dec_tlu_ctl.scala 1579:65]
  wire  _T_128 = io_dec_csr_wraddr_r == 12'hb02; // @[dec_tlu_ctl.scala 1581:80]
  wire  wr_minstretl_r = io_dec_csr_wen_r_mod & _T_128; // @[dec_tlu_ctl.scala 1581:51]
  reg [23:0] _T_150; // @[Reg.scala 27:20]
  reg [7:0] _T_153; // @[Reg.scala 27:20]
  wire [31:0] minstretl = {_T_150,_T_153}; // @[Cat.scala 29:58]
  wire [8:0] minstretl_inc1 = minstretl[7:0] + 8'h1; // @[dec_tlu_ctl.scala 1585:42]
  wire [23:0] _T_134 = {23'h0,minstretl_inc1[8]}; // @[Cat.scala 29:58]
  wire [24:0] minstretl_inc2 = minstretl[31:8] + _T_134; // @[dec_tlu_ctl.scala 1586:43]
  wire  minstretl_cout = minstretl_inc2[24]; // @[dec_tlu_ctl.scala 1587:44]
  wire [31:0] minstretl_inc = {minstretl_inc2[23:0],minstretl_inc1[7:0]}; // @[Cat.scala 29:58]
  wire  _T_138 = i0_valid_no_ebreak_ecall_r & io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 1589:59]
  wire  minstret_enable = _T_138 | wr_minstretl_r; // @[dec_tlu_ctl.scala 1589:83]
  wire  _T_156 = io_dec_csr_wraddr_r == 12'hb82; // @[dec_tlu_ctl.scala 1605:78]
  wire  wr_minstreth_r = io_dec_csr_wen_r_mod & _T_156; // @[dec_tlu_ctl.scala 1605:49]
  wire  _T_139 = ~wr_minstreth_r; // @[dec_tlu_ctl.scala 1590:50]
  wire  _T_140 = minstretl_cout & _T_139; // @[dec_tlu_ctl.scala 1590:48]
  wire  _T_141 = _T_140 & i0_valid_no_ebreak_ecall_r; // @[dec_tlu_ctl.scala 1590:66]
  wire  _T_142 = ~io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 1590:97]
  wire [31:0] minstretl_ns = wr_minstretl_r ? io_dec_csr_wrdata_r : minstretl_inc; // @[dec_tlu_ctl.scala 1593:31]
  wire  _T_147 = minstretl_inc1[8] & minstret_enable; // @[dec_tlu_ctl.scala 1595:88]
  wire  _T_148 = wr_minstretl_r | _T_147; // @[dec_tlu_ctl.scala 1595:67]
  wire [31:0] _T_159 = {31'h0,perfmux_flop_io_minstretl_cout_f}; // @[Cat.scala 29:58]
  reg [31:0] minstreth; // @[Reg.scala 27:20]
  wire [31:0] minstreth_inc = minstreth + _T_159; // @[dec_tlu_ctl.scala 1609:39]
  wire  _T_162 = perfmux_flop_io_minstret_enable_f & perfmux_flop_io_minstretl_cout_f; // @[dec_tlu_ctl.scala 1612:79]
  wire  _T_163 = _T_162 | wr_minstreth_r; // @[dec_tlu_ctl.scala 1612:116]
  wire  _T_167 = io_dec_csr_wraddr_r == 12'h340; // @[dec_tlu_ctl.scala 1620:79]
  wire  wr_mscratch_r = io_dec_csr_wen_r_mod & _T_167; // @[dec_tlu_ctl.scala 1620:50]
  reg [31:0] mscratch; // @[Reg.scala 27:20]
  wire  _T_171 = ~io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 1631:54]
  wire  _T_172 = _T_142 & _T_171; // @[dec_tlu_ctl.scala 1631:52]
  wire  sel_exu_npc_r = _T_172 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 1631:79]
  wire  _T_174 = _T_142 & io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 1632:54]
  wire  _T_175 = ~io_dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 1632:82]
  wire  sel_flush_npc_r = _T_174 & _T_175; // @[dec_tlu_ctl.scala 1632:80]
  wire  _T_176 = ~sel_exu_npc_r; // @[dec_tlu_ctl.scala 1633:30]
  wire  _T_177 = ~sel_flush_npc_r; // @[dec_tlu_ctl.scala 1633:47]
  wire  sel_hold_npc_r = _T_176 & _T_177; // @[dec_tlu_ctl.scala 1633:45]
  wire  _T_179 = ~io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 1637:18]
  wire  _T_180 = _T_179 & io_reset_delayed; // @[dec_tlu_ctl.scala 1637:40]
  wire [30:0] _T_184 = sel_exu_npc_r ? io_exu_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_185 = _T_180 ? io_rst_vec : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_186 = sel_flush_npc_r ? io_tlu_flush_path_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_187 = sel_hold_npc_r ? io_npc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_188 = _T_184 | _T_185; // @[Mux.scala 27:72]
  wire [30:0] _T_189 = _T_188 | _T_186; // @[Mux.scala 27:72]
  wire  _T_192 = sel_exu_npc_r | sel_flush_npc_r; // @[dec_tlu_ctl.scala 1641:58]
  wire  _T_193 = _T_192 | io_reset_delayed; // @[dec_tlu_ctl.scala 1641:76]
  reg [30:0] _T_196; // @[Reg.scala 27:20]
  wire  pc0_valid_r = _T_142 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 1644:51]
  wire  _T_199 = ~pc0_valid_r; // @[dec_tlu_ctl.scala 1648:17]
  wire [30:0] _T_200 = pc0_valid_r ? io_dec_tlu_i0_pc_r : 31'h0; // @[Mux.scala 27:72]
  reg [30:0] pc_r_d1; // @[Reg.scala 27:20]
  wire [30:0] _T_201 = _T_199 ? pc_r_d1 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] pc_r = _T_200 | _T_201; // @[Mux.scala 27:72]
  wire  _T_206 = io_dec_csr_wraddr_r == 12'h341; // @[dec_tlu_ctl.scala 1652:75]
  wire  wr_mepc_r = io_dec_csr_wen_r_mod & _T_206; // @[dec_tlu_ctl.scala 1652:46]
  wire  _T_207 = io_i0_exception_valid_r | io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 1655:42]
  wire  _T_208 = _T_207 | io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 1655:63]
  wire  _T_212 = wr_mepc_r & _T_17; // @[dec_tlu_ctl.scala 1657:28]
  wire  _T_215 = ~wr_mepc_r; // @[dec_tlu_ctl.scala 1658:18]
  wire  _T_217 = _T_215 & _T_17; // @[dec_tlu_ctl.scala 1658:29]
  wire [30:0] _T_219 = _T_208 ? pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_220 = io_interrupt_valid_r ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_221 = _T_212 ? io_dec_csr_wrdata_r[31:1] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_222 = _T_217 ? io_mepc : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_223 = _T_219 | _T_220; // @[Mux.scala 27:72]
  wire [30:0] _T_224 = _T_223 | _T_221; // @[Mux.scala 27:72]
  wire [30:0] mepc_ns = _T_224 | _T_222; // @[Mux.scala 27:72]
  wire  _T_228 = _T_208 | io_interrupt_valid_r; // @[dec_tlu_ctl.scala 1660:111]
  wire  _T_229 = _T_228 | wr_mepc_r; // @[dec_tlu_ctl.scala 1660:134]
  reg [30:0] _T_231; // @[Reg.scala 27:20]
  wire  _T_233 = io_dec_csr_wraddr_r == 12'h342; // @[dec_tlu_ctl.scala 1668:77]
  wire  wr_mcause_r = io_dec_csr_wen_r_mod & _T_233; // @[dec_tlu_ctl.scala 1668:48]
  wire  _T_234 = io_exc_or_int_valid_r & io_take_nmi; // @[dec_tlu_ctl.scala 1669:58]
  wire  mcause_sel_nmi_store = _T_234 & io_nmi_lsu_store_type; // @[dec_tlu_ctl.scala 1669:72]
  wire  mcause_sel_nmi_load = _T_234 & io_nmi_lsu_load_type; // @[dec_tlu_ctl.scala 1670:71]
  wire  _T_237 = _T_234 & io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 1671:69]
  wire  _T_238 = |io_lsu_fir_error; // @[dec_tlu_ctl.scala 1671:115]
  wire  _T_239 = _T_237 & _T_238; // @[dec_tlu_ctl.scala 1671:96]
  wire  _T_240 = ~io_nmi_int_detected_f; // @[dec_tlu_ctl.scala 1671:121]
  wire  mcause_sel_nmi_ext = _T_239 & _T_240; // @[dec_tlu_ctl.scala 1671:119]
  wire  _T_241 = &io_lsu_fir_error; // @[dec_tlu_ctl.scala 1678:58]
  wire  _T_244 = ~io_lsu_fir_error[0]; // @[dec_tlu_ctl.scala 1678:87]
  wire  _T_245 = io_lsu_fir_error[1] & _T_244; // @[dec_tlu_ctl.scala 1678:85]
  wire [31:0] _T_250 = {30'h3c000400,_T_241,_T_245}; // @[Cat.scala 29:58]
  wire  _T_251 = ~io_take_nmi; // @[dec_tlu_ctl.scala 1684:42]
  wire  _T_252 = io_exc_or_int_valid_r & _T_251; // @[dec_tlu_ctl.scala 1684:40]
  wire [31:0] _T_255 = {io_interrupt_valid_r,26'h0,io_exc_cause_r}; // @[Cat.scala 29:58]
  wire  _T_257 = wr_mcause_r & _T_17; // @[dec_tlu_ctl.scala 1685:30]
  wire  _T_259 = ~wr_mcause_r; // @[dec_tlu_ctl.scala 1686:18]
  wire  _T_261 = _T_259 & _T_17; // @[dec_tlu_ctl.scala 1686:31]
  wire [31:0] _T_263 = mcause_sel_nmi_store ? 32'hf0000000 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_264 = mcause_sel_nmi_load ? 32'hf0000001 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_265 = mcause_sel_nmi_ext ? _T_250 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_266 = _T_252 ? _T_255 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_267 = _T_257 ? io_dec_csr_wrdata_r : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] mcause; // @[Reg.scala 27:20]
  wire [31:0] _T_268 = _T_261 ? mcause : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_269 = _T_263 | _T_264; // @[Mux.scala 27:72]
  wire [31:0] _T_270 = _T_269 | _T_265; // @[Mux.scala 27:72]
  wire [31:0] _T_271 = _T_270 | _T_266; // @[Mux.scala 27:72]
  wire [31:0] _T_272 = _T_271 | _T_267; // @[Mux.scala 27:72]
  wire [31:0] mcause_ns = _T_272 | _T_268; // @[Mux.scala 27:72]
  wire  _T_274 = io_exc_or_int_valid_r | wr_mcause_r; // @[dec_tlu_ctl.scala 1688:58]
  wire  _T_278 = io_dec_csr_wraddr_r == 12'h7ff; // @[dec_tlu_ctl.scala 1695:78]
  wire  wr_mscause_r = io_dec_csr_wen_r_mod & _T_278; // @[dec_tlu_ctl.scala 1695:49]
  wire  _T_279 = io_dec_tlu_packet_r_icaf_type == 2'h0; // @[dec_tlu_ctl.scala 1697:63]
  wire [3:0] _T_280 = {2'h0,io_dec_tlu_packet_r_icaf_type}; // @[Cat.scala 29:58]
  wire [3:0] ifu_mscause = _T_279 ? 4'h9 : _T_280; // @[dec_tlu_ctl.scala 1697:31]
  wire [3:0] _T_285 = io_lsu_i0_exc_r ? io_lsu_error_pkt_r_bits_mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_286 = io_i0_trigger_hit_r ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_287 = io_ebreak_r ? 4'h2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_288 = io_inst_acc_r ? ifu_mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_289 = _T_285 | _T_286; // @[Mux.scala 27:72]
  wire [3:0] _T_290 = _T_289 | _T_287; // @[Mux.scala 27:72]
  wire [3:0] mscause_type = _T_290 | _T_288; // @[Mux.scala 27:72]
  wire  _T_294 = wr_mscause_r & _T_17; // @[dec_tlu_ctl.scala 1708:31]
  wire  _T_297 = ~wr_mscause_r; // @[dec_tlu_ctl.scala 1709:18]
  wire  _T_299 = _T_297 & _T_17; // @[dec_tlu_ctl.scala 1709:32]
  wire [3:0] _T_301 = io_exc_or_int_valid_r ? mscause_type : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_302 = _T_294 ? io_dec_csr_wrdata_r[3:0] : 4'h0; // @[Mux.scala 27:72]
  reg [3:0] mscause; // @[dec_tlu_ctl.scala 1711:54]
  wire [3:0] _T_303 = _T_299 ? mscause : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_304 = _T_301 | _T_302; // @[Mux.scala 27:72]
  wire  _T_308 = io_dec_csr_wraddr_r == 12'h343; // @[dec_tlu_ctl.scala 1718:76]
  wire  wr_mtval_r = io_dec_csr_wen_r_mod & _T_308; // @[dec_tlu_ctl.scala 1718:47]
  wire  _T_309 = ~io_inst_acc_second_r; // @[dec_tlu_ctl.scala 1719:90]
  wire  _T_310 = io_inst_acc_r & _T_309; // @[dec_tlu_ctl.scala 1719:88]
  wire  _T_311 = io_ebreak_r | _T_310; // @[dec_tlu_ctl.scala 1719:71]
  wire  _T_312 = _T_311 | io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 1719:113]
  wire  _T_313 = io_exc_or_int_valid_r & _T_312; // @[dec_tlu_ctl.scala 1719:56]
  wire  mtval_capture_pc_r = _T_313 & _T_251; // @[dec_tlu_ctl.scala 1719:145]
  wire  _T_315 = io_inst_acc_r & io_inst_acc_second_r; // @[dec_tlu_ctl.scala 1720:79]
  wire  _T_316 = io_exc_or_int_valid_r & _T_315; // @[dec_tlu_ctl.scala 1720:62]
  wire  mtval_capture_pc_plus2_r = _T_316 & _T_251; // @[dec_tlu_ctl.scala 1720:103]
  wire  _T_318 = io_exc_or_int_valid_r & io_illegal_r; // @[dec_tlu_ctl.scala 1721:58]
  wire  mtval_capture_inst_r = _T_318 & _T_251; // @[dec_tlu_ctl.scala 1721:73]
  wire  _T_320 = io_exc_or_int_valid_r & io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 1722:57]
  wire  mtval_capture_lsu_r = _T_320 & _T_251; // @[dec_tlu_ctl.scala 1722:78]
  wire  _T_322 = ~mtval_capture_pc_r; // @[dec_tlu_ctl.scala 1723:53]
  wire  _T_323 = io_exc_or_int_valid_r & _T_322; // @[dec_tlu_ctl.scala 1723:51]
  wire  _T_324 = ~mtval_capture_inst_r; // @[dec_tlu_ctl.scala 1723:75]
  wire  _T_325 = _T_323 & _T_324; // @[dec_tlu_ctl.scala 1723:73]
  wire  _T_326 = ~mtval_capture_lsu_r; // @[dec_tlu_ctl.scala 1723:99]
  wire  _T_327 = _T_325 & _T_326; // @[dec_tlu_ctl.scala 1723:97]
  wire  _T_328 = ~io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 1723:122]
  wire  mtval_clear_r = _T_327 & _T_328; // @[dec_tlu_ctl.scala 1723:120]
  wire [31:0] _T_330 = {pc_r,1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_333 = pc_r + 31'h1; // @[dec_tlu_ctl.scala 1728:96]
  wire [31:0] _T_334 = {_T_333,1'h0}; // @[Cat.scala 29:58]
  wire  _T_337 = ~io_interrupt_valid_r; // @[dec_tlu_ctl.scala 1731:31]
  wire  _T_338 = wr_mtval_r & _T_337; // @[dec_tlu_ctl.scala 1731:29]
  wire  _T_341 = ~wr_mtval_r; // @[dec_tlu_ctl.scala 1732:33]
  wire  _T_342 = _T_251 & _T_341; // @[dec_tlu_ctl.scala 1732:31]
  wire  _T_344 = _T_342 & _T_322; // @[dec_tlu_ctl.scala 1732:45]
  wire  _T_346 = _T_344 & _T_324; // @[dec_tlu_ctl.scala 1732:67]
  wire  _T_347 = ~mtval_clear_r; // @[dec_tlu_ctl.scala 1732:93]
  wire  _T_348 = _T_346 & _T_347; // @[dec_tlu_ctl.scala 1732:91]
  wire  _T_350 = _T_348 & _T_326; // @[dec_tlu_ctl.scala 1732:108]
  wire [31:0] _T_352 = mtval_capture_pc_r ? _T_330 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_353 = mtval_capture_pc_plus2_r ? _T_334 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_354 = mtval_capture_inst_r ? io_dec_illegal_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_355 = mtval_capture_lsu_r ? io_lsu_error_pkt_addr_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_356 = _T_338 ? io_dec_csr_wrdata_r : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] mtval; // @[Reg.scala 27:20]
  wire [31:0] _T_357 = _T_350 ? mtval : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_358 = _T_352 | _T_353; // @[Mux.scala 27:72]
  wire [31:0] _T_359 = _T_358 | _T_354; // @[Mux.scala 27:72]
  wire [31:0] _T_360 = _T_359 | _T_355; // @[Mux.scala 27:72]
  wire [31:0] _T_361 = _T_360 | _T_356; // @[Mux.scala 27:72]
  wire [31:0] mtval_ns = _T_361 | _T_357; // @[Mux.scala 27:72]
  wire  _T_363 = io_tlu_flush_lower_r | wr_mtval_r; // @[dec_tlu_ctl.scala 1734:55]
  wire  _T_367 = io_dec_csr_wraddr_r == 12'h7f8; // @[dec_tlu_ctl.scala 1752:75]
  wire  wr_mcgc_r = io_dec_csr_wen_r_mod & _T_367; // @[dec_tlu_ctl.scala 1752:46]
  wire  _T_370 = ~io_dec_csr_wrdata_r[9]; // @[dec_tlu_ctl.scala 1753:42]
  wire [9:0] _T_372 = {_T_370,io_dec_csr_wrdata_r[8:0]}; // @[Cat.scala 29:58]
  reg [9:0] mcgc_int; // @[Reg.scala 27:20]
  wire  _T_376 = ~mcgc_int[9]; // @[dec_tlu_ctl.scala 1755:24]
  wire [9:0] mcgc = {_T_376,mcgc_int[8:0]}; // @[Cat.scala 29:58]
  wire  _T_388 = io_dec_csr_wraddr_r == 12'h7f9; // @[dec_tlu_ctl.scala 1785:75]
  wire  wr_mfdc_r = io_dec_csr_wen_r_mod & _T_388; // @[dec_tlu_ctl.scala 1785:46]
  reg [15:0] mfdc_int; // @[Reg.scala 27:20]
  wire [2:0] _T_392 = ~io_dec_csr_wrdata_r[18:16]; // @[dec_tlu_ctl.scala 1795:32]
  wire  _T_396 = ~io_dec_csr_wrdata_r[6]; // @[dec_tlu_ctl.scala 1795:111]
  wire [15:0] mfdc_ns = {_T_392,io_dec_csr_wrdata_r[12],io_dec_csr_wrdata_r[11:7],_T_396,io_dec_csr_wrdata_r[5:0]}; // @[Cat.scala 29:58]
  wire [2:0] _T_403 = ~mfdc_int[15:13]; // @[dec_tlu_ctl.scala 1796:32]
  wire  _T_407 = ~mfdc_int[6]; // @[dec_tlu_ctl.scala 1796:88]
  wire [18:0] mfdc = {_T_403,3'h0,mfdc_int[12],mfdc_int[11:7],_T_407,mfdc_int[5:0]}; // @[Cat.scala 29:58]
  wire  _T_423 = io_dec_csr_wraddr_r == 12'h7c2; // @[dec_tlu_ctl.scala 1822:84]
  wire  _T_424 = io_dec_csr_wen_r_mod & _T_423; // @[dec_tlu_ctl.scala 1822:55]
  wire  _T_426 = _T_424 & _T_337; // @[dec_tlu_ctl.scala 1822:94]
  wire  _T_427 = ~io_take_ext_int_start; // @[dec_tlu_ctl.scala 1822:120]
  wire  _T_430 = io_dec_csr_wraddr_r == 12'h7c0; // @[dec_tlu_ctl.scala 1829:75]
  wire  wr_mrac_r = io_dec_csr_wen_r_mod & _T_430; // @[dec_tlu_ctl.scala 1829:46]
  wire  _T_434 = ~io_dec_csr_wrdata_r[31]; // @[dec_tlu_ctl.scala 1832:78]
  wire  _T_435 = io_dec_csr_wrdata_r[30] & _T_434; // @[dec_tlu_ctl.scala 1832:76]
  wire  _T_439 = ~io_dec_csr_wrdata_r[29]; // @[dec_tlu_ctl.scala 1833:68]
  wire  _T_440 = io_dec_csr_wrdata_r[28] & _T_439; // @[dec_tlu_ctl.scala 1833:66]
  wire  _T_444 = ~io_dec_csr_wrdata_r[27]; // @[dec_tlu_ctl.scala 1834:68]
  wire  _T_445 = io_dec_csr_wrdata_r[26] & _T_444; // @[dec_tlu_ctl.scala 1834:66]
  wire  _T_449 = ~io_dec_csr_wrdata_r[25]; // @[dec_tlu_ctl.scala 1835:68]
  wire  _T_450 = io_dec_csr_wrdata_r[24] & _T_449; // @[dec_tlu_ctl.scala 1835:66]
  wire  _T_454 = ~io_dec_csr_wrdata_r[23]; // @[dec_tlu_ctl.scala 1836:68]
  wire  _T_455 = io_dec_csr_wrdata_r[22] & _T_454; // @[dec_tlu_ctl.scala 1836:66]
  wire  _T_459 = ~io_dec_csr_wrdata_r[21]; // @[dec_tlu_ctl.scala 1837:68]
  wire  _T_460 = io_dec_csr_wrdata_r[20] & _T_459; // @[dec_tlu_ctl.scala 1837:66]
  wire  _T_464 = ~io_dec_csr_wrdata_r[19]; // @[dec_tlu_ctl.scala 1838:68]
  wire  _T_465 = io_dec_csr_wrdata_r[18] & _T_464; // @[dec_tlu_ctl.scala 1838:66]
  wire  _T_469 = ~io_dec_csr_wrdata_r[17]; // @[dec_tlu_ctl.scala 1839:68]
  wire  _T_470 = io_dec_csr_wrdata_r[16] & _T_469; // @[dec_tlu_ctl.scala 1839:66]
  wire  _T_474 = ~io_dec_csr_wrdata_r[15]; // @[dec_tlu_ctl.scala 1840:68]
  wire  _T_475 = io_dec_csr_wrdata_r[14] & _T_474; // @[dec_tlu_ctl.scala 1840:66]
  wire  _T_479 = ~io_dec_csr_wrdata_r[13]; // @[dec_tlu_ctl.scala 1841:68]
  wire  _T_480 = io_dec_csr_wrdata_r[12] & _T_479; // @[dec_tlu_ctl.scala 1841:66]
  wire  _T_484 = ~io_dec_csr_wrdata_r[11]; // @[dec_tlu_ctl.scala 1842:68]
  wire  _T_485 = io_dec_csr_wrdata_r[10] & _T_484; // @[dec_tlu_ctl.scala 1842:66]
  wire  _T_490 = io_dec_csr_wrdata_r[8] & _T_370; // @[dec_tlu_ctl.scala 1843:65]
  wire  _T_494 = ~io_dec_csr_wrdata_r[7]; // @[dec_tlu_ctl.scala 1844:68]
  wire  _T_495 = io_dec_csr_wrdata_r[6] & _T_494; // @[dec_tlu_ctl.scala 1844:65]
  wire  _T_499 = ~io_dec_csr_wrdata_r[5]; // @[dec_tlu_ctl.scala 1845:68]
  wire  _T_500 = io_dec_csr_wrdata_r[4] & _T_499; // @[dec_tlu_ctl.scala 1845:65]
  wire  _T_504 = ~io_dec_csr_wrdata_r[3]; // @[dec_tlu_ctl.scala 1846:68]
  wire  _T_505 = io_dec_csr_wrdata_r[2] & _T_504; // @[dec_tlu_ctl.scala 1846:65]
  wire  _T_510 = io_dec_csr_wrdata_r[0] & _T_565; // @[dec_tlu_ctl.scala 1847:65]
  wire [7:0] _T_517 = {io_dec_csr_wrdata_r[7],_T_495,io_dec_csr_wrdata_r[5],_T_500,io_dec_csr_wrdata_r[3],_T_505,io_dec_csr_wrdata_r[1],_T_510}; // @[Cat.scala 29:58]
  wire [15:0] _T_525 = {io_dec_csr_wrdata_r[15],_T_475,io_dec_csr_wrdata_r[13],_T_480,io_dec_csr_wrdata_r[11],_T_485,io_dec_csr_wrdata_r[9],_T_490,_T_517}; // @[Cat.scala 29:58]
  wire [7:0] _T_532 = {io_dec_csr_wrdata_r[23],_T_455,io_dec_csr_wrdata_r[21],_T_460,io_dec_csr_wrdata_r[19],_T_465,io_dec_csr_wrdata_r[17],_T_470}; // @[Cat.scala 29:58]
  wire [31:0] mrac_in = {io_dec_csr_wrdata_r[31],_T_435,io_dec_csr_wrdata_r[29],_T_440,io_dec_csr_wrdata_r[27],_T_445,io_dec_csr_wrdata_r[25],_T_450,_T_532,_T_525}; // @[Cat.scala 29:58]
  reg [31:0] mrac; // @[Reg.scala 27:20]
  wire  _T_543 = io_dec_csr_wraddr_r == 12'hbc0; // @[dec_tlu_ctl.scala 1860:76]
  wire  wr_mdeau_r = io_dec_csr_wen_r_mod & _T_543; // @[dec_tlu_ctl.scala 1860:47]
  wire  _T_544 = ~wr_mdeau_r; // @[dec_tlu_ctl.scala 1870:66]
  wire  _T_545 = io_mdseac_locked_f & _T_544; // @[dec_tlu_ctl.scala 1870:64]
  wire  _T_547 = io_lsu_imprecise_error_store_any | io_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 1872:56]
  wire  _T_549 = _T_547 & _T_240; // @[dec_tlu_ctl.scala 1872:91]
  wire  _T_550 = ~io_mdseac_locked_f; // @[dec_tlu_ctl.scala 1872:118]
  wire  mdseac_en = _T_549 & _T_550; // @[dec_tlu_ctl.scala 1872:116]
  reg [31:0] mdseac; // @[Reg.scala 27:20]
  wire  _T_555 = wr_mpmc_r & io_dec_csr_wrdata_r[0]; // @[dec_tlu_ctl.scala 1887:37]
  wire  _T_556 = ~io_internal_dbg_halt_mode_f2; // @[dec_tlu_ctl.scala 1887:64]
  wire  _T_557 = _T_555 & _T_556; // @[dec_tlu_ctl.scala 1887:62]
  wire  _T_558 = ~io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 1887:96]
  wire  _T_571 = io_dec_csr_wrdata_r[31:27] > 5'h1a; // @[dec_tlu_ctl.scala 1905:55]
  wire [4:0] csr_sat = _T_571 ? 5'h1a : io_dec_csr_wrdata_r[31:27]; // @[dec_tlu_ctl.scala 1905:26]
  wire  _T_573 = io_dec_csr_wraddr_r == 12'h7f0; // @[dec_tlu_ctl.scala 1907:71]
  wire  wr_micect_r = io_dec_csr_wen_r_mod & _T_573; // @[dec_tlu_ctl.scala 1907:48]
  wire [26:0] _T_575 = {26'h0,io_ic_perr_r}; // @[Cat.scala 29:58]
  wire [26:0] micect_inc = micect[26:0] + _T_575; // @[dec_tlu_ctl.scala 1908:36]
  wire [31:0] _T_580 = {csr_sat,io_dec_csr_wrdata_r[26:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_582 = {micect[31:27],micect_inc}; // @[Cat.scala 29:58]
  wire  _T_583 = wr_micect_r | io_ic_perr_r; // @[dec_tlu_ctl.scala 1911:49]
  wire  _T_593 = io_dec_csr_wraddr_r == 12'h7f1; // @[dec_tlu_ctl.scala 1922:83]
  wire  wr_miccmect_r = io_dec_csr_wen_r_mod & _T_593; // @[dec_tlu_ctl.scala 1922:54]
  wire  _T_595 = io_iccm_sbecc_r | io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 1923:74]
  wire [26:0] _T_596 = {26'h0,_T_595}; // @[Cat.scala 29:58]
  wire [26:0] miccmect_inc = miccmect[26:0] + _T_596; // @[dec_tlu_ctl.scala 1923:40]
  wire [31:0] _T_603 = {miccmect[31:27],miccmect_inc}; // @[Cat.scala 29:58]
  wire  _T_604 = wr_miccmect_r | io_iccm_sbecc_r; // @[dec_tlu_ctl.scala 1926:55]
  wire  _T_605 = _T_604 | io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 1926:73]
  wire  _T_615 = io_dec_csr_wraddr_r == 12'h7f2; // @[dec_tlu_ctl.scala 1937:83]
  wire  wr_mdccmect_r = io_dec_csr_wen_r_mod & _T_615; // @[dec_tlu_ctl.scala 1937:54]
  wire [26:0] _T_617 = {26'h0,perfmux_flop_io_lsu_single_ecc_error_r_d1}; // @[Cat.scala 29:58]
  wire [26:0] mdccmect_inc = mdccmect[26:0] + _T_617; // @[dec_tlu_ctl.scala 1938:40]
  wire [31:0] _T_624 = {mdccmect[31:27],mdccmect_inc}; // @[Cat.scala 29:58]
  wire  _T_625 = wr_mdccmect_r | perfmux_flop_io_lsu_single_ecc_error_r_d1; // @[dec_tlu_ctl.scala 1941:56]
  wire  _T_635 = io_dec_csr_wraddr_r == 12'h7ce; // @[dec_tlu_ctl.scala 1952:76]
  wire  wr_mfdht_r = io_dec_csr_wen_r_mod & _T_635; // @[dec_tlu_ctl.scala 1952:47]
  reg [5:0] mfdht; // @[Reg.scala 27:20]
  wire  _T_641 = io_dec_csr_wraddr_r == 12'h7cf; // @[dec_tlu_ctl.scala 1965:76]
  wire  wr_mfdhs_r = io_dec_csr_wen_r_mod & _T_641; // @[dec_tlu_ctl.scala 1965:47]
  wire  _T_644 = ~io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 1968:42]
  wire  _T_645 = io_dbg_tlu_halted & _T_644; // @[dec_tlu_ctl.scala 1968:40]
  wire  _T_647 = ~io_lsu_idle_any_f; // @[dec_tlu_ctl.scala 1968:77]
  wire  _T_648 = ~io_ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 1968:97]
  wire [1:0] _T_649 = {_T_647,_T_648}; // @[Cat.scala 29:58]
  reg [1:0] mfdhs; // @[Reg.scala 27:20]
  wire  _T_651 = wr_mfdhs_r | io_dbg_tlu_halted; // @[dec_tlu_ctl.scala 1970:76]
  reg [31:0] force_halt_ctr_f; // @[Reg.scala 27:20]
  wire [31:0] _T_656 = force_halt_ctr_f + 32'h1; // @[dec_tlu_ctl.scala 1972:81]
  wire [62:0] _T_663 = 63'hffffffff << mfdht[5:1]; // @[dec_tlu_ctl.scala 1977:78]
  wire [62:0] _GEN_46 = {{31'd0}, force_halt_ctr_f}; // @[dec_tlu_ctl.scala 1977:55]
  wire [62:0] _T_664 = _GEN_46 & _T_663; // @[dec_tlu_ctl.scala 1977:55]
  wire  _T_665 = |_T_664; // @[dec_tlu_ctl.scala 1977:94]
  wire  _T_668 = io_dec_csr_wraddr_r == 12'hbc8; // @[dec_tlu_ctl.scala 1985:76]
  wire  wr_meivt_r = io_dec_csr_wen_r_mod & _T_668; // @[dec_tlu_ctl.scala 1985:47]
  reg [21:0] meivt; // @[Reg.scala 27:20]
  wire  _T_686 = io_dec_csr_wraddr_r == 12'hbca; // @[dec_tlu_ctl.scala 2036:76]
  wire  _T_687 = io_dec_csr_wen_r_mod & _T_686; // @[dec_tlu_ctl.scala 2036:47]
  wire  wr_meicpct_r = _T_687 | io_take_ext_int_start; // @[dec_tlu_ctl.scala 2036:90]
  reg [7:0] meihap; // @[Reg.scala 27:20]
  wire  _T_674 = io_dec_csr_wraddr_r == 12'hbcc; // @[dec_tlu_ctl.scala 2009:79]
  wire  wr_meicurpl_r = io_dec_csr_wen_r_mod & _T_674; // @[dec_tlu_ctl.scala 2009:50]
  reg [3:0] meicurpl; // @[dec_tlu_ctl.scala 2012:53]
  wire  _T_679 = io_dec_csr_wraddr_r == 12'hbcb; // @[dec_tlu_ctl.scala 2024:80]
  wire  _T_680 = io_dec_csr_wen_r_mod & _T_679; // @[dec_tlu_ctl.scala 2024:51]
  wire  wr_meicidpl_r = _T_680 | io_take_ext_int_start; // @[dec_tlu_ctl.scala 2024:95]
  wire [3:0] _T_684 = wr_meicidpl_r ? io_dec_csr_wrdata_r[3:0] : perfmux_flop_io_meicidpl; // @[dec_tlu_ctl.scala 2027:20]
  wire  _T_690 = io_dec_csr_wraddr_r == 12'hbc9; // @[dec_tlu_ctl.scala 2045:76]
  wire  wr_meipt_r = io_dec_csr_wen_r_mod & _T_690; // @[dec_tlu_ctl.scala 2045:47]
  reg [3:0] meipt; // @[dec_tlu_ctl.scala 2048:50]
  wire  _T_694 = io_trigger_hit_r_d1 & io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 2076:96]
  wire  trigger_hit_for_dscr_cause_r_d1 = io_trigger_hit_dmode_r_d1 | _T_694; // @[dec_tlu_ctl.scala 2076:73]
  wire  _T_695 = ~io_ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 2079:47]
  wire  _T_696 = io_dcsr_single_step_done_f & _T_695; // @[dec_tlu_ctl.scala 2079:45]
  wire  _T_697 = ~trigger_hit_for_dscr_cause_r_d1; // @[dec_tlu_ctl.scala 2079:79]
  wire  _T_698 = _T_696 & _T_697; // @[dec_tlu_ctl.scala 2079:77]
  wire  _T_699 = ~io_debug_halt_req; // @[dec_tlu_ctl.scala 2079:114]
  wire  _T_700 = _T_698 & _T_699; // @[dec_tlu_ctl.scala 2079:112]
  wire  _T_703 = io_debug_halt_req & _T_695; // @[dec_tlu_ctl.scala 2080:36]
  wire  _T_705 = _T_703 & _T_697; // @[dec_tlu_ctl.scala 2080:68]
  wire  _T_708 = io_ebreak_to_debug_mode_r_d1 & _T_697; // @[dec_tlu_ctl.scala 2081:47]
  wire [2:0] _T_711 = _T_700 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_712 = _T_705 ? 3'h3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_713 = _T_708 ? 3'h1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_714 = trigger_hit_for_dscr_cause_r_d1 ? 3'h2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_715 = _T_711 | _T_712; // @[Mux.scala 27:72]
  wire [2:0] _T_716 = _T_715 | _T_713; // @[Mux.scala 27:72]
  wire [2:0] dcsr_cause = _T_716 | _T_714; // @[Mux.scala 27:72]
  wire  _T_718 = io_allow_dbg_halt_csr_write & io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 2084:53]
  wire  _T_720 = io_dec_csr_wraddr_r == 12'h7b0; // @[dec_tlu_ctl.scala 2084:105]
  wire  wr_dcsr_r = _T_718 & _T_720; // @[dec_tlu_ctl.scala 2084:76]
  wire  _T_722 = io_dcsr[8:6] == 3'h3; // @[dec_tlu_ctl.scala 2090:82]
  wire  dcsr_cause_upgradeable = io_internal_dbg_halt_mode_f & _T_722; // @[dec_tlu_ctl.scala 2090:66]
  wire  _T_723 = ~io_dbg_tlu_halted; // @[dec_tlu_ctl.scala 2091:66]
  wire  _T_724 = _T_723 | dcsr_cause_upgradeable; // @[dec_tlu_ctl.scala 2091:85]
  wire  enter_debug_halt_req_le = io_enter_debug_halt_req & _T_724; // @[dec_tlu_ctl.scala 2091:63]
  wire  nmi_in_debug_mode = io_nmi_int_detected_f & io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 2093:55]
  wire [15:0] _T_730 = {io_dcsr[15:9],dcsr_cause,io_dcsr[5:2],2'h3}; // @[Cat.scala 29:58]
  wire  _T_736 = nmi_in_debug_mode | io_dcsr[3]; // @[dec_tlu_ctl.scala 2095:158]
  wire [15:0] _T_745 = {io_dec_csr_wrdata_r[15],3'h0,io_dec_csr_wrdata_r[11:10],1'h0,io_dcsr[8:6],2'h0,_T_736,io_dec_csr_wrdata_r[2],2'h3}; // @[Cat.scala 29:58]
  wire [15:0] _T_750 = {io_dcsr[15:4],nmi_in_debug_mode,io_dcsr[2],2'h3}; // @[Cat.scala 29:58]
  wire  _T_752 = enter_debug_halt_req_le | wr_dcsr_r; // @[dec_tlu_ctl.scala 2098:61]
  wire  _T_753 = _T_752 | io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 2098:73]
  wire  _T_754 = _T_753 | io_take_nmi; // @[dec_tlu_ctl.scala 2098:101]
  reg [15:0] _T_756; // @[Reg.scala 27:20]
  wire  _T_759 = io_dec_csr_wraddr_r == 12'h7b1; // @[dec_tlu_ctl.scala 2106:104]
  wire  wr_dpc_r = _T_718 & _T_759; // @[dec_tlu_ctl.scala 2106:75]
  wire  _T_762 = ~io_request_debug_mode_done; // @[dec_tlu_ctl.scala 2107:74]
  wire  dpc_capture_npc = _T_645 & _T_762; // @[dec_tlu_ctl.scala 2107:72]
  wire  _T_763 = ~io_request_debug_mode_r; // @[dec_tlu_ctl.scala 2111:18]
  wire  _T_764 = ~dpc_capture_npc; // @[dec_tlu_ctl.scala 2111:36]
  wire  _T_765 = _T_763 & _T_764; // @[dec_tlu_ctl.scala 2111:34]
  wire  _T_766 = _T_765 & wr_dpc_r; // @[dec_tlu_ctl.scala 2111:53]
  wire  _T_771 = _T_763 & dpc_capture_npc; // @[dec_tlu_ctl.scala 2113:34]
  wire [30:0] _T_773 = _T_766 ? io_dec_csr_wrdata_r[31:1] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_774 = io_request_debug_mode_r ? pc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_775 = _T_771 ? io_npc_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_776 = _T_773 | _T_774; // @[Mux.scala 27:72]
  wire [30:0] dpc_ns = _T_776 | _T_775; // @[Mux.scala 27:72]
  wire  _T_778 = wr_dpc_r | io_request_debug_mode_r; // @[dec_tlu_ctl.scala 2115:43]
  wire  _T_779 = _T_778 | dpc_capture_npc; // @[dec_tlu_ctl.scala 2115:60]
  reg [30:0] _T_781; // @[Reg.scala 27:20]
  wire [16:0] dicawics_ns = {io_dec_csr_wrdata_r[24],io_dec_csr_wrdata_r[21:20],io_dec_csr_wrdata_r[16:3]}; // @[Cat.scala 29:58]
  wire  _T_788 = io_dec_csr_wraddr_r == 12'h7c8; // @[dec_tlu_ctl.scala 2130:109]
  wire  wr_dicawics_r = _T_718 & _T_788; // @[dec_tlu_ctl.scala 2130:80]
  reg [16:0] dicawics; // @[Reg.scala 27:20]
  wire  _T_792 = io_dec_csr_wraddr_r == 12'h7c9; // @[dec_tlu_ctl.scala 2148:107]
  wire  wr_dicad0_r = _T_718 & _T_792; // @[dec_tlu_ctl.scala 2148:78]
  wire  _T_795 = wr_dicad0_r | io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 2151:53]
  reg [31:0] dicad0; // @[Reg.scala 27:20]
  wire  _T_799 = io_dec_csr_wraddr_r == 12'h7cc; // @[dec_tlu_ctl.scala 2161:108]
  wire  wr_dicad0h_r = _T_718 & _T_799; // @[dec_tlu_ctl.scala 2161:79]
  wire  _T_802 = wr_dicad0h_r | io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 2165:55]
  reg [31:0] dicad0h; // @[Reg.scala 27:20]
  wire  _T_807 = io_dec_csr_wraddr_r == 12'h7ca; // @[dec_tlu_ctl.scala 2173:115]
  wire  _T_808 = _T_718 & _T_807; // @[dec_tlu_ctl.scala 2173:86]
  wire  _T_813 = _T_808 | io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 2177:61]
  reg [6:0] _T_815; // @[Reg.scala 27:20]
  wire [31:0] dicad1 = {25'h0,_T_815}; // @[Cat.scala 29:58]
  wire [38:0] _T_820 = {dicad1[6:0],dicad0h}; // @[Cat.scala 29:58]
  wire  _T_822 = io_allow_dbg_halt_csr_write & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 2205:59]
  wire  _T_823 = _T_822 & io_dec_i0_decode_d; // @[dec_tlu_ctl.scala 2205:82]
  wire  _T_824 = ~io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 2205:105]
  wire  _T_825 = _T_823 & _T_824; // @[dec_tlu_ctl.scala 2205:103]
  wire  _T_827 = io_dec_csr_rdaddr_d == 12'h7cb; // @[dec_tlu_ctl.scala 2205:156]
  wire  _T_830 = io_dec_csr_wraddr_r == 12'h7cb; // @[dec_tlu_ctl.scala 2206:111]
  wire  _T_832 = io_dec_csr_wraddr_r == 12'h7a0; // @[dec_tlu_ctl.scala 2220:76]
  wire  wr_mtsel_r = io_dec_csr_wen_r_mod & _T_832; // @[dec_tlu_ctl.scala 2220:47]
  reg [1:0] mtsel; // @[dec_tlu_ctl.scala 2223:50]
  wire  tdata_load = io_dec_csr_wrdata_r[0] & _T_464; // @[dec_tlu_ctl.scala 2258:49]
  wire  tdata_opcode = io_dec_csr_wrdata_r[2] & _T_464; // @[dec_tlu_ctl.scala 2260:51]
  wire  _T_843 = io_dec_csr_wrdata_r[27] & io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2262:53]
  wire  tdata_action = _T_843 & io_dec_csr_wrdata_r[12]; // @[dec_tlu_ctl.scala 2262:76]
  wire  _T_851 = io_mtdata1_t_3[9] & _T_444; // @[dec_tlu_ctl.scala 2266:91]
  wire  _T_852 = ~_T_851; // @[dec_tlu_ctl.scala 2266:58]
  wire  _T_853 = io_dec_csr_wrdata_r[11] & _T_852; // @[dec_tlu_ctl.scala 2266:56]
  wire  _T_858 = io_mtdata1_t_1[9] & _T_444; // @[dec_tlu_ctl.scala 2267:84]
  wire  _T_859 = ~_T_858; // @[dec_tlu_ctl.scala 2267:51]
  wire  _T_860 = io_dec_csr_wrdata_r[11] & _T_859; // @[dec_tlu_ctl.scala 2267:49]
  wire  _T_861 = mtsel[1] ? _T_853 : _T_860; // @[dec_tlu_ctl.scala 2266:20]
  wire  tdata_chain = mtsel[0] ? 1'h0 : _T_861; // @[dec_tlu_ctl.scala 2265:30]
  wire  _T_865 = ~io_mtdata1_t_2[9]; // @[dec_tlu_ctl.scala 2270:73]
  wire  _T_867 = _T_865 & io_mtdata1_t_2[5]; // @[dec_tlu_ctl.scala 2270:105]
  wire  _T_868 = io_dec_csr_wrdata_r[27] & _T_867; // @[dec_tlu_ctl.scala 2270:70]
  wire  _T_871 = ~io_mtdata1_t_0[9]; // @[dec_tlu_ctl.scala 2271:44]
  wire  _T_873 = _T_871 & io_mtdata1_t_0[5]; // @[dec_tlu_ctl.scala 2271:76]
  wire  _T_874 = io_dec_csr_wrdata_r[27] & _T_873; // @[dec_tlu_ctl.scala 2271:41]
  wire  tdata_kill_write = mtsel[1] ? _T_868 : _T_874; // @[dec_tlu_ctl.scala 2270:35]
  wire [9:0] tdata_wrdata_r = {_T_843,io_dec_csr_wrdata_r[20:19],tdata_action,tdata_chain,io_dec_csr_wrdata_r[7:6],tdata_opcode,io_dec_csr_wrdata_r[1],tdata_load}; // @[Cat.scala 29:58]
  wire  _T_887 = io_dec_csr_wraddr_r == 12'h7a1; // @[dec_tlu_ctl.scala 2276:127]
  wire  _T_888 = io_dec_csr_wen_r_mod & _T_887; // @[dec_tlu_ctl.scala 2276:98]
  wire  _T_889 = mtsel == 2'h0; // @[dec_tlu_ctl.scala 2276:149]
  wire  _T_890 = _T_888 & _T_889; // @[dec_tlu_ctl.scala 2276:140]
  wire  _T_893 = _T_871 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:198]
  wire  wr_mtdata1_t_r_0 = _T_890 & _T_893; // @[dec_tlu_ctl.scala 2276:163]
  wire  _T_898 = mtsel == 2'h1; // @[dec_tlu_ctl.scala 2276:298]
  wire  _T_899 = _T_888 & _T_898; // @[dec_tlu_ctl.scala 2276:289]
  wire  _T_901 = ~io_mtdata1_t_1[9]; // @[dec_tlu_ctl.scala 2276:315]
  wire  _T_902 = _T_901 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:347]
  wire  _T_903 = _T_899 & _T_902; // @[dec_tlu_ctl.scala 2276:312]
  wire  _T_904 = ~tdata_kill_write; // @[dec_tlu_ctl.scala 2276:373]
  wire  wr_mtdata1_t_r_1 = _T_903 & _T_904; // @[dec_tlu_ctl.scala 2276:371]
  wire  _T_909 = mtsel == 2'h2; // @[dec_tlu_ctl.scala 2276:149]
  wire  _T_910 = _T_888 & _T_909; // @[dec_tlu_ctl.scala 2276:140]
  wire  _T_913 = _T_865 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:198]
  wire  wr_mtdata1_t_r_2 = _T_910 & _T_913; // @[dec_tlu_ctl.scala 2276:163]
  wire  _T_918 = mtsel == 2'h3; // @[dec_tlu_ctl.scala 2276:298]
  wire  _T_919 = _T_888 & _T_918; // @[dec_tlu_ctl.scala 2276:289]
  wire  _T_921 = ~io_mtdata1_t_3[9]; // @[dec_tlu_ctl.scala 2276:315]
  wire  _T_922 = _T_921 | io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 2276:347]
  wire  _T_923 = _T_919 & _T_922; // @[dec_tlu_ctl.scala 2276:312]
  wire  wr_mtdata1_t_r_3 = _T_923 & _T_904; // @[dec_tlu_ctl.scala 2276:371]
  wire  _T_930 = io_update_hit_bit_r[0] | io_mtdata1_t_0[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_933 = {io_mtdata1_t_0[9],_T_930,io_mtdata1_t_0[7:0]}; // @[Cat.scala 29:58]
  wire  _T_939 = io_update_hit_bit_r[1] | io_mtdata1_t_1[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_942 = {io_mtdata1_t_1[9],_T_939,io_mtdata1_t_1[7:0]}; // @[Cat.scala 29:58]
  wire  _T_948 = io_update_hit_bit_r[2] | io_mtdata1_t_2[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_951 = {io_mtdata1_t_2[9],_T_948,io_mtdata1_t_2[7:0]}; // @[Cat.scala 29:58]
  wire  _T_957 = io_update_hit_bit_r[3] | io_mtdata1_t_3[8]; // @[dec_tlu_ctl.scala 2278:148]
  wire [9:0] _T_960 = {io_mtdata1_t_3[9],_T_957,io_mtdata1_t_3[7:0]}; // @[Cat.scala 29:58]
  wire  _T_963 = io_trigger_enabled[0] | wr_mtdata1_t_r_0; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_965; // @[Reg.scala 27:20]
  wire  _T_967 = io_trigger_enabled[1] | wr_mtdata1_t_r_1; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_969; // @[Reg.scala 27:20]
  wire  _T_971 = io_trigger_enabled[2] | wr_mtdata1_t_r_2; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_973; // @[Reg.scala 27:20]
  wire  _T_975 = io_trigger_enabled[3] | wr_mtdata1_t_r_3; // @[dec_tlu_ctl.scala 2282:95]
  reg [9:0] _T_977; // @[Reg.scala 27:20]
  wire [31:0] _T_992 = {4'h2,io_mtdata1_t_0[9],6'h1f,io_mtdata1_t_0[8:7],6'h0,io_mtdata1_t_0[6:5],3'h0,io_mtdata1_t_0[4:3],3'h0,io_mtdata1_t_0[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1007 = {4'h2,io_mtdata1_t_1[9],6'h1f,io_mtdata1_t_1[8:7],6'h0,io_mtdata1_t_1[6:5],3'h0,io_mtdata1_t_1[4:3],3'h0,io_mtdata1_t_1[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1022 = {4'h2,io_mtdata1_t_2[9],6'h1f,io_mtdata1_t_2[8:7],6'h0,io_mtdata1_t_2[6:5],3'h0,io_mtdata1_t_2[4:3],3'h0,io_mtdata1_t_2[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1037 = {4'h2,io_mtdata1_t_3[9],6'h1f,io_mtdata1_t_3[8:7],6'h0,io_mtdata1_t_3[6:5],3'h0,io_mtdata1_t_3[4:3],3'h0,io_mtdata1_t_3[2:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1038 = _T_889 ? _T_992 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1039 = _T_898 ? _T_1007 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1040 = _T_909 ? _T_1022 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1041 = _T_918 ? _T_1037 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1042 = _T_1038 | _T_1039; // @[Mux.scala 27:72]
  wire [31:0] _T_1043 = _T_1042 | _T_1040; // @[Mux.scala 27:72]
  wire [31:0] mtdata1_tsel_out = _T_1043 | _T_1041; // @[Mux.scala 27:72]
  wire  _T_1070 = io_dec_csr_wraddr_r == 12'h7a2; // @[dec_tlu_ctl.scala 2299:105]
  wire  _T_1071 = io_dec_csr_wen_r_mod & _T_1070; // @[dec_tlu_ctl.scala 2299:76]
  wire  _T_1073 = _T_1071 & _T_889; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_0 = _T_1073 & _T_893; // @[dec_tlu_ctl.scala 2299:141]
  wire  _T_1082 = _T_1071 & _T_898; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_1 = _T_1082 & _T_902; // @[dec_tlu_ctl.scala 2299:141]
  wire  _T_1091 = _T_1071 & _T_909; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_2 = _T_1091 & _T_913; // @[dec_tlu_ctl.scala 2299:141]
  wire  _T_1100 = _T_1071 & _T_918; // @[dec_tlu_ctl.scala 2299:118]
  wire  wr_mtdata2_t_r_3 = _T_1100 & _T_922; // @[dec_tlu_ctl.scala 2299:141]
  reg [31:0] mtdata2_t_0; // @[Reg.scala 27:20]
  reg [31:0] mtdata2_t_1; // @[Reg.scala 27:20]
  reg [31:0] mtdata2_t_2; // @[Reg.scala 27:20]
  reg [31:0] mtdata2_t_3; // @[Reg.scala 27:20]
  wire [31:0] _T_1117 = _T_889 ? mtdata2_t_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1118 = _T_898 ? mtdata2_t_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1119 = _T_909 ? mtdata2_t_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1120 = _T_918 ? mtdata2_t_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1121 = _T_1117 | _T_1118; // @[Mux.scala 27:72]
  wire [31:0] _T_1122 = _T_1121 | _T_1119; // @[Mux.scala 27:72]
  wire [31:0] mtdata2_tsel_out = _T_1122 | _T_1120; // @[Mux.scala 27:72]
  wire  _T_1128 = io_dec_csr_wraddr_r == 12'h320; // @[dec_tlu_ctl.scala 2455:84]
  wire  wr_mcountinhibit_r = io_dec_csr_wen_r_mod & _T_1128; // @[dec_tlu_ctl.scala 2455:55]
  wire  _T_1140 = ~io_dec_tlu_trace_disable; // @[dec_tlu_ctl.scala 2468:42]
  wire  _T_1143 = io_i0_exception_valid_r_d1 | perfmux_flop_io_lsu_i0_exc_r_d1; // @[dec_tlu_ctl.scala 2469:98]
  wire  _T_1144 = ~io_trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 2469:158]
  wire  _T_1145 = io_trigger_hit_r_d1 & _T_1144; // @[dec_tlu_ctl.scala 2469:156]
  wire  _T_1146 = _T_1143 | _T_1145; // @[dec_tlu_ctl.scala 2469:133]
  wire [4:0] _T_1150 = _T_1140 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] dec_tlu_exc_cause_wb1_raw = _T_1150 & io_exc_cause_wb; // @[dec_tlu_ctl.scala 2470:77]
  wire  dec_tlu_int_valid_wb1_raw = _T_1140 & io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 2471:68]
  reg [4:0] dec_tlu_exc_cause_wb2; // @[Reg.scala 27:20]
  wire [4:0] _T_1152 = dec_tlu_exc_cause_wb1_raw ^ dec_tlu_exc_cause_wb2; // @[lib.scala 448:21]
  wire  _T_1153 = |_T_1152; // @[lib.scala 448:29]
  reg  dec_tlu_int_valid_wb2; // @[Reg.scala 27:20]
  wire  _T_1155 = dec_tlu_int_valid_wb1_raw ^ dec_tlu_int_valid_wb2; // @[lib.scala 470:21]
  wire  _T_1156 = |_T_1155; // @[lib.scala 470:29]
  wire [31:0] _T_1164 = {io_core_id,4'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1173 = {21'h3,3'h0,io_mstatus[1],3'h0,io_mstatus[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1178 = {io_mtvec[30:1],1'h0,io_mtvec[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1191 = {1'h0,io_mip[5:3],16'h0,io_mip[2],3'h0,io_mip[1],3'h0,io_mip[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1204 = {1'h0,mie[5:3],16'h0,mie[2],3'h0,mie[1],3'h0,mie[0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1216 = {io_mepc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1221 = {28'h0,mscause}; // @[Cat.scala 29:58]
  wire [31:0] _T_1229 = {meivt,10'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1232 = {meivt,meihap,2'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1235 = {28'h0,meicurpl}; // @[Cat.scala 29:58]
  wire [3:0] _T_1237 = perfmux_flop_io_meicidpl; // @[dec_tlu_ctl.scala 2509:97]
  wire [31:0] _T_1238 = {28'h0,_T_1237}; // @[Cat.scala 29:58]
  wire [31:0] _T_1241 = {28'h0,meipt}; // @[Cat.scala 29:58]
  wire [31:0] _T_1244 = {22'h0,_T_376,mcgc_int[8:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1247 = {13'h0,_T_403,3'h0,mfdc_int[12],mfdc_int[11:7],_T_407,mfdc_int[5:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1251 = {16'h4000,io_dcsr[15:2],2'h3}; // @[Cat.scala 29:58]
  wire [31:0] _T_1253 = {io_dpc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1269 = {7'h0,dicawics[16],2'h0,dicawics[15:14],3'h0,dicawics[13:0],3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1272 = {30'h0,mtsel}; // @[Cat.scala 29:58]
  wire [31:0] _T_1284 = perf_csrs_io_mhpmc3; // @[dec_tlu_ctl.scala 2525:77]
  wire [31:0] _T_1286 = perf_csrs_io_mhpmc4; // @[dec_tlu_ctl.scala 2526:77]
  wire [31:0] _T_1288 = perf_csrs_io_mhpmc5; // @[dec_tlu_ctl.scala 2527:77]
  wire [31:0] _T_1290 = perf_csrs_io_mhpmc6; // @[dec_tlu_ctl.scala 2528:77]
  wire [31:0] _T_1292 = perf_csrs_io_mhpmc3h; // @[dec_tlu_ctl.scala 2529:78]
  wire [31:0] _T_1294 = perf_csrs_io_mhpmc4h; // @[dec_tlu_ctl.scala 2530:78]
  wire [31:0] _T_1296 = perf_csrs_io_mhpmc5h; // @[dec_tlu_ctl.scala 2531:78]
  wire [31:0] _T_1298 = perf_csrs_io_mhpmc6h; // @[dec_tlu_ctl.scala 2532:78]
  wire [31:0] _T_1301 = {26'h0,mfdht}; // @[Cat.scala 29:58]
  wire [31:0] _T_1304 = {30'h0,mfdhs}; // @[Cat.scala 29:58]
  wire [9:0] _T_1306 = perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 2535:92]
  wire [31:0] _T_1307 = {22'h0,_T_1306}; // @[Cat.scala 29:58]
  wire [9:0] _T_1309 = perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 2536:92]
  wire [31:0] _T_1310 = {22'h0,_T_1309}; // @[Cat.scala 29:58]
  wire [9:0] _T_1312 = perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 2537:91]
  wire [31:0] _T_1313 = {22'h0,_T_1312}; // @[Cat.scala 29:58]
  wire [9:0] _T_1315 = perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 2538:91]
  wire [31:0] _T_1316 = {22'h0,_T_1315}; // @[Cat.scala 29:58]
  wire [31:0] _T_1319 = {25'h0,temp_ncount6_2,1'h0,temp_ncount0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1322 = {30'h0,mpmc,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_1325 = io_csr_pkt_csr_misa ? 32'h40001104 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1326 = io_csr_pkt_csr_mvendorid ? 32'h45 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1327 = io_csr_pkt_csr_marchid ? 32'h10 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1328 = io_csr_pkt_csr_mimpid ? 32'h3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1329 = io_csr_pkt_csr_mhartid ? _T_1164 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1330 = io_csr_pkt_csr_mstatus ? _T_1173 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1331 = io_csr_pkt_csr_mtvec ? _T_1178 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1332 = io_csr_pkt_csr_mip ? _T_1191 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1333 = io_csr_pkt_csr_mie ? _T_1204 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1334 = io_csr_pkt_csr_mcyclel ? mcyclel : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1335 = io_csr_pkt_csr_mcycleh ? mcycleh_inc : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1336 = io_csr_pkt_csr_minstretl ? minstretl : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1337 = io_csr_pkt_csr_minstreth ? minstreth_inc : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1338 = io_csr_pkt_csr_mscratch ? mscratch : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1339 = io_csr_pkt_csr_mepc ? _T_1216 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1340 = io_csr_pkt_csr_mcause ? mcause : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1341 = io_csr_pkt_csr_mscause ? _T_1221 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1342 = io_csr_pkt_csr_mtval ? mtval : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1343 = io_csr_pkt_csr_mrac ? mrac : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1344 = io_csr_pkt_csr_mdseac ? mdseac : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1345 = io_csr_pkt_csr_meivt ? _T_1229 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1346 = io_csr_pkt_csr_meihap ? _T_1232 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1347 = io_csr_pkt_csr_meicurpl ? _T_1235 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1348 = io_csr_pkt_csr_meicidpl ? _T_1238 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1349 = io_csr_pkt_csr_meipt ? _T_1241 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1350 = io_csr_pkt_csr_mcgc ? _T_1244 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1351 = io_csr_pkt_csr_mfdc ? _T_1247 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1352 = io_csr_pkt_csr_dcsr ? _T_1251 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1353 = io_csr_pkt_csr_dpc ? _T_1253 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1354 = io_csr_pkt_csr_dicad0 ? dicad0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1355 = io_csr_pkt_csr_dicad0h ? dicad0h : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1356 = io_csr_pkt_csr_dicad1 ? dicad1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1357 = io_csr_pkt_csr_dicawics ? _T_1269 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1358 = io_csr_pkt_csr_mtsel ? _T_1272 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1359 = io_csr_pkt_csr_mtdata1 ? mtdata1_tsel_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1360 = io_csr_pkt_csr_mtdata2 ? mtdata2_tsel_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1361 = io_csr_pkt_csr_micect ? micect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1362 = io_csr_pkt_csr_miccmect ? miccmect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1363 = io_csr_pkt_csr_mdccmect ? mdccmect : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1364 = io_csr_pkt_csr_mhpmc3 ? _T_1284 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1365 = io_csr_pkt_csr_mhpmc4 ? _T_1286 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1366 = io_csr_pkt_csr_mhpmc5 ? _T_1288 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1367 = io_csr_pkt_csr_mhpmc6 ? _T_1290 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1368 = io_csr_pkt_csr_mhpmc3h ? _T_1292 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1369 = io_csr_pkt_csr_mhpmc4h ? _T_1294 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1370 = io_csr_pkt_csr_mhpmc5h ? _T_1296 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1371 = io_csr_pkt_csr_mhpmc6h ? _T_1298 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1372 = io_csr_pkt_csr_mfdht ? _T_1301 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1373 = io_csr_pkt_csr_mfdhs ? _T_1304 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1374 = io_csr_pkt_csr_mhpme3 ? _T_1307 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1375 = io_csr_pkt_csr_mhpme4 ? _T_1310 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1376 = io_csr_pkt_csr_mhpme5 ? _T_1313 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1377 = io_csr_pkt_csr_mhpme6 ? _T_1316 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1378 = io_csr_pkt_csr_mcountinhibit ? _T_1319 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1379 = io_csr_pkt_csr_mpmc ? _T_1322 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1380 = io_dec_timer_read_d ? io_dec_timer_rddata_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1381 = _T_1325 | _T_1326; // @[Mux.scala 27:72]
  wire [31:0] _T_1382 = _T_1381 | _T_1327; // @[Mux.scala 27:72]
  wire [31:0] _T_1383 = _T_1382 | _T_1328; // @[Mux.scala 27:72]
  wire [31:0] _T_1384 = _T_1383 | _T_1329; // @[Mux.scala 27:72]
  wire [31:0] _T_1385 = _T_1384 | _T_1330; // @[Mux.scala 27:72]
  wire [31:0] _T_1386 = _T_1385 | _T_1331; // @[Mux.scala 27:72]
  wire [31:0] _T_1387 = _T_1386 | _T_1332; // @[Mux.scala 27:72]
  wire [31:0] _T_1388 = _T_1387 | _T_1333; // @[Mux.scala 27:72]
  wire [31:0] _T_1389 = _T_1388 | _T_1334; // @[Mux.scala 27:72]
  wire [31:0] _T_1390 = _T_1389 | _T_1335; // @[Mux.scala 27:72]
  wire [31:0] _T_1391 = _T_1390 | _T_1336; // @[Mux.scala 27:72]
  wire [31:0] _T_1392 = _T_1391 | _T_1337; // @[Mux.scala 27:72]
  wire [31:0] _T_1393 = _T_1392 | _T_1338; // @[Mux.scala 27:72]
  wire [31:0] _T_1394 = _T_1393 | _T_1339; // @[Mux.scala 27:72]
  wire [31:0] _T_1395 = _T_1394 | _T_1340; // @[Mux.scala 27:72]
  wire [31:0] _T_1396 = _T_1395 | _T_1341; // @[Mux.scala 27:72]
  wire [31:0] _T_1397 = _T_1396 | _T_1342; // @[Mux.scala 27:72]
  wire [31:0] _T_1398 = _T_1397 | _T_1343; // @[Mux.scala 27:72]
  wire [31:0] _T_1399 = _T_1398 | _T_1344; // @[Mux.scala 27:72]
  wire [31:0] _T_1400 = _T_1399 | _T_1345; // @[Mux.scala 27:72]
  wire [31:0] _T_1401 = _T_1400 | _T_1346; // @[Mux.scala 27:72]
  wire [31:0] _T_1402 = _T_1401 | _T_1347; // @[Mux.scala 27:72]
  wire [31:0] _T_1403 = _T_1402 | _T_1348; // @[Mux.scala 27:72]
  wire [31:0] _T_1404 = _T_1403 | _T_1349; // @[Mux.scala 27:72]
  wire [31:0] _T_1405 = _T_1404 | _T_1350; // @[Mux.scala 27:72]
  wire [31:0] _T_1406 = _T_1405 | _T_1351; // @[Mux.scala 27:72]
  wire [31:0] _T_1407 = _T_1406 | _T_1352; // @[Mux.scala 27:72]
  wire [31:0] _T_1408 = _T_1407 | _T_1353; // @[Mux.scala 27:72]
  wire [31:0] _T_1409 = _T_1408 | _T_1354; // @[Mux.scala 27:72]
  wire [31:0] _T_1410 = _T_1409 | _T_1355; // @[Mux.scala 27:72]
  wire [31:0] _T_1411 = _T_1410 | _T_1356; // @[Mux.scala 27:72]
  wire [31:0] _T_1412 = _T_1411 | _T_1357; // @[Mux.scala 27:72]
  wire [31:0] _T_1413 = _T_1412 | _T_1358; // @[Mux.scala 27:72]
  wire [31:0] _T_1414 = _T_1413 | _T_1359; // @[Mux.scala 27:72]
  wire [31:0] _T_1415 = _T_1414 | _T_1360; // @[Mux.scala 27:72]
  wire [31:0] _T_1416 = _T_1415 | _T_1361; // @[Mux.scala 27:72]
  wire [31:0] _T_1417 = _T_1416 | _T_1362; // @[Mux.scala 27:72]
  wire [31:0] _T_1418 = _T_1417 | _T_1363; // @[Mux.scala 27:72]
  wire [31:0] _T_1419 = _T_1418 | _T_1364; // @[Mux.scala 27:72]
  wire [31:0] _T_1420 = _T_1419 | _T_1365; // @[Mux.scala 27:72]
  wire [31:0] _T_1421 = _T_1420 | _T_1366; // @[Mux.scala 27:72]
  wire [31:0] _T_1422 = _T_1421 | _T_1367; // @[Mux.scala 27:72]
  wire [31:0] _T_1423 = _T_1422 | _T_1368; // @[Mux.scala 27:72]
  wire [31:0] _T_1424 = _T_1423 | _T_1369; // @[Mux.scala 27:72]
  wire [31:0] _T_1425 = _T_1424 | _T_1370; // @[Mux.scala 27:72]
  wire [31:0] _T_1426 = _T_1425 | _T_1371; // @[Mux.scala 27:72]
  wire [31:0] _T_1427 = _T_1426 | _T_1372; // @[Mux.scala 27:72]
  wire [31:0] _T_1428 = _T_1427 | _T_1373; // @[Mux.scala 27:72]
  wire [31:0] _T_1429 = _T_1428 | _T_1374; // @[Mux.scala 27:72]
  wire [31:0] _T_1430 = _T_1429 | _T_1375; // @[Mux.scala 27:72]
  wire [31:0] _T_1431 = _T_1430 | _T_1376; // @[Mux.scala 27:72]
  wire [31:0] _T_1432 = _T_1431 | _T_1377; // @[Mux.scala 27:72]
  wire [31:0] _T_1433 = _T_1432 | _T_1378; // @[Mux.scala 27:72]
  wire [31:0] _T_1434 = _T_1433 | _T_1379; // @[Mux.scala 27:72]
  perf_mux_and_flops perfmux_flop ( // @[dec_tlu_ctl.scala 1455:34]
    .reset(perfmux_flop_reset),
    .io_mhpmc_inc_r_0(perfmux_flop_io_mhpmc_inc_r_0),
    .io_mhpmc_inc_r_1(perfmux_flop_io_mhpmc_inc_r_1),
    .io_mhpmc_inc_r_2(perfmux_flop_io_mhpmc_inc_r_2),
    .io_mhpmc_inc_r_3(perfmux_flop_io_mhpmc_inc_r_3),
    .io_mcountinhibit(perfmux_flop_io_mcountinhibit),
    .io_mhpme_vec_0(perfmux_flop_io_mhpme_vec_0),
    .io_mhpme_vec_1(perfmux_flop_io_mhpme_vec_1),
    .io_mhpme_vec_2(perfmux_flop_io_mhpme_vec_2),
    .io_mhpme_vec_3(perfmux_flop_io_mhpme_vec_3),
    .io_ifu_pmu_ic_hit(perfmux_flop_io_ifu_pmu_ic_hit),
    .io_ifu_pmu_ic_miss(perfmux_flop_io_ifu_pmu_ic_miss),
    .io_tlu_i0_commit_cmt(perfmux_flop_io_tlu_i0_commit_cmt),
    .io_illegal_r(perfmux_flop_io_illegal_r),
    .io_exu_pmu_i0_pc4(perfmux_flop_io_exu_pmu_i0_pc4),
    .io_ifu_pmu_instr_aligned(perfmux_flop_io_ifu_pmu_instr_aligned),
    .io_dec_pmu_instr_decoded(perfmux_flop_io_dec_pmu_instr_decoded),
    .io_dec_tlu_packet_r_pmu_i0_itype(perfmux_flop_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(perfmux_flop_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(perfmux_flop_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(perfmux_flop_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_exu_pmu_i0_br_misp(perfmux_flop_io_exu_pmu_i0_br_misp),
    .io_dec_pmu_decode_stall(perfmux_flop_io_dec_pmu_decode_stall),
    .io_exu_pmu_i0_br_ataken(perfmux_flop_io_exu_pmu_i0_br_ataken),
    .io_ifu_pmu_fetch_stall(perfmux_flop_io_ifu_pmu_fetch_stall),
    .io_dec_pmu_postsync_stall(perfmux_flop_io_dec_pmu_postsync_stall),
    .io_dec_pmu_presync_stall(perfmux_flop_io_dec_pmu_presync_stall),
    .io_lsu_store_stall_any(perfmux_flop_io_lsu_store_stall_any),
    .io_dma_dccm_stall_any(perfmux_flop_io_dma_dccm_stall_any),
    .io_dma_iccm_stall_any(perfmux_flop_io_dma_iccm_stall_any),
    .io_i0_exception_valid_r(perfmux_flop_io_i0_exception_valid_r),
    .io_dec_tlu_pmu_fw_halted(perfmux_flop_io_dec_tlu_pmu_fw_halted),
    .io_dma_pmu_any_read(perfmux_flop_io_dma_pmu_any_read),
    .io_dma_pmu_any_write(perfmux_flop_io_dma_pmu_any_write),
    .io_dma_pmu_dccm_read(perfmux_flop_io_dma_pmu_dccm_read),
    .io_dma_pmu_dccm_write(perfmux_flop_io_dma_pmu_dccm_write),
    .io_lsu_pmu_load_external_r(perfmux_flop_io_lsu_pmu_load_external_r),
    .io_lsu_pmu_store_external_r(perfmux_flop_io_lsu_pmu_store_external_r),
    .io_mstatus(perfmux_flop_io_mstatus),
    .io_mie(perfmux_flop_io_mie),
    .io_ifu_pmu_bus_trxn(perfmux_flop_io_ifu_pmu_bus_trxn),
    .io_lsu_pmu_bus_trxn(perfmux_flop_io_lsu_pmu_bus_trxn),
    .io_lsu_pmu_bus_misaligned(perfmux_flop_io_lsu_pmu_bus_misaligned),
    .io_ifu_pmu_bus_error(perfmux_flop_io_ifu_pmu_bus_error),
    .io_lsu_pmu_bus_error(perfmux_flop_io_lsu_pmu_bus_error),
    .io_ifu_pmu_bus_busy(perfmux_flop_io_ifu_pmu_bus_busy),
    .io_lsu_pmu_bus_busy(perfmux_flop_io_lsu_pmu_bus_busy),
    .io_i0_trigger_hit_r(perfmux_flop_io_i0_trigger_hit_r),
    .io_lsu_exc_valid_r(perfmux_flop_io_lsu_exc_valid_r),
    .io_take_timer_int(perfmux_flop_io_take_timer_int),
    .io_take_int_timer0_int(perfmux_flop_io_take_int_timer0_int),
    .io_take_int_timer1_int(perfmux_flop_io_take_int_timer1_int),
    .io_take_ext_int(perfmux_flop_io_take_ext_int),
    .io_tlu_flush_lower_r(perfmux_flop_io_tlu_flush_lower_r),
    .io_dec_tlu_br0_error_r(perfmux_flop_io_dec_tlu_br0_error_r),
    .io_rfpc_i0_r(perfmux_flop_io_rfpc_i0_r),
    .io_dec_tlu_br0_start_error_r(perfmux_flop_io_dec_tlu_br0_start_error_r),
    .io_mcyclel_cout_f(perfmux_flop_io_mcyclel_cout_f),
    .io_minstret_enable_f(perfmux_flop_io_minstret_enable_f),
    .io_minstretl_cout_f(perfmux_flop_io_minstretl_cout_f),
    .io_meicidpl(perfmux_flop_io_meicidpl),
    .io_icache_rd_valid_f(perfmux_flop_io_icache_rd_valid_f),
    .io_icache_wr_valid_f(perfmux_flop_io_icache_wr_valid_f),
    .io_mhpmc_inc_r_d1_0(perfmux_flop_io_mhpmc_inc_r_d1_0),
    .io_mhpmc_inc_r_d1_1(perfmux_flop_io_mhpmc_inc_r_d1_1),
    .io_mhpmc_inc_r_d1_2(perfmux_flop_io_mhpmc_inc_r_d1_2),
    .io_mhpmc_inc_r_d1_3(perfmux_flop_io_mhpmc_inc_r_d1_3),
    .io_perfcnt_halted_d1(perfmux_flop_io_perfcnt_halted_d1),
    .io_mdseac_locked_f(perfmux_flop_io_mdseac_locked_f),
    .io_lsu_single_ecc_error_r_d1(perfmux_flop_io_lsu_single_ecc_error_r_d1),
    .io_lsu_i0_exc_r_d1(perfmux_flop_io_lsu_i0_exc_r_d1),
    .io_take_ext_int_start_d1(perfmux_flop_io_take_ext_int_start_d1),
    .io_take_ext_int_start_d2(perfmux_flop_io_take_ext_int_start_d2),
    .io_take_ext_int_start_d3(perfmux_flop_io_take_ext_int_start_d3),
    .io_ext_int_freeze_d1(perfmux_flop_io_ext_int_freeze_d1),
    .io_mip(perfmux_flop_io_mip),
    .io_mdseac_locked_ns(perfmux_flop_io_mdseac_locked_ns),
    .io_lsu_single_ecc_error_r(perfmux_flop_io_lsu_single_ecc_error_r),
    .io_lsu_i0_exc_r(perfmux_flop_io_lsu_i0_exc_r),
    .io_take_ext_int_start(perfmux_flop_io_take_ext_int_start),
    .io_ext_int_freeze(perfmux_flop_io_ext_int_freeze),
    .io_mip_ns(perfmux_flop_io_mip_ns),
    .io_mcyclel_cout(perfmux_flop_io_mcyclel_cout),
    .io_wr_mcycleh_r(perfmux_flop_io_wr_mcycleh_r),
    .io_mcyclel_cout_in(perfmux_flop_io_mcyclel_cout_in),
    .io_minstret_enable(perfmux_flop_io_minstret_enable),
    .io_minstretl_cout_ns(perfmux_flop_io_minstretl_cout_ns),
    .io_meicidpl_ns(perfmux_flop_io_meicidpl_ns),
    .io_icache_rd_valid(perfmux_flop_io_icache_rd_valid),
    .io_icache_wr_valid(perfmux_flop_io_icache_wr_valid),
    .io_perfcnt_halted(perfmux_flop_io_perfcnt_halted),
    .io_mstatus_ns(perfmux_flop_io_mstatus_ns),
    .io_free_l2clk(perfmux_flop_io_free_l2clk)
  );
  perf_csr perf_csrs ( // @[dec_tlu_ctl.scala 1456:31]
    .clock(perf_csrs_clock),
    .reset(perf_csrs_reset),
    .io_free_l2clk(perf_csrs_io_free_l2clk),
    .io_dec_tlu_dbg_halted(perf_csrs_io_dec_tlu_dbg_halted),
    .io_dcsr(perf_csrs_io_dcsr),
    .io_dec_tlu_pmu_fw_halted(perf_csrs_io_dec_tlu_pmu_fw_halted),
    .io_mhpme_vec_0(perf_csrs_io_mhpme_vec_0),
    .io_mhpme_vec_1(perf_csrs_io_mhpme_vec_1),
    .io_mhpme_vec_2(perf_csrs_io_mhpme_vec_2),
    .io_mhpme_vec_3(perf_csrs_io_mhpme_vec_3),
    .io_dec_csr_wen_r_mod(perf_csrs_io_dec_csr_wen_r_mod),
    .io_dec_csr_wraddr_r(perf_csrs_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(perf_csrs_io_dec_csr_wrdata_r),
    .io_mhpmc_inc_r_0(perf_csrs_io_mhpmc_inc_r_0),
    .io_mhpmc_inc_r_1(perf_csrs_io_mhpmc_inc_r_1),
    .io_mhpmc_inc_r_2(perf_csrs_io_mhpmc_inc_r_2),
    .io_mhpmc_inc_r_3(perf_csrs_io_mhpmc_inc_r_3),
    .io_mhpmc_inc_r_d1_0(perf_csrs_io_mhpmc_inc_r_d1_0),
    .io_mhpmc_inc_r_d1_1(perf_csrs_io_mhpmc_inc_r_d1_1),
    .io_mhpmc_inc_r_d1_2(perf_csrs_io_mhpmc_inc_r_d1_2),
    .io_mhpmc_inc_r_d1_3(perf_csrs_io_mhpmc_inc_r_d1_3),
    .io_perfcnt_halted_d1(perf_csrs_io_perfcnt_halted_d1),
    .io_mhpmc3h(perf_csrs_io_mhpmc3h),
    .io_mhpmc3(perf_csrs_io_mhpmc3),
    .io_mhpmc4h(perf_csrs_io_mhpmc4h),
    .io_mhpmc4(perf_csrs_io_mhpmc4),
    .io_mhpmc5h(perf_csrs_io_mhpmc5h),
    .io_mhpmc5(perf_csrs_io_mhpmc5),
    .io_mhpmc6h(perf_csrs_io_mhpmc6h),
    .io_mhpmc6(perf_csrs_io_mhpmc6),
    .io_mhpme3(perf_csrs_io_mhpme3),
    .io_mhpme4(perf_csrs_io_mhpme4),
    .io_mhpme5(perf_csrs_io_mhpme5),
    .io_mhpme6(perf_csrs_io_mhpme6),
    .io_dec_tlu_perfcnt0(perf_csrs_io_dec_tlu_perfcnt0),
    .io_dec_tlu_perfcnt1(perf_csrs_io_dec_tlu_perfcnt1),
    .io_dec_tlu_perfcnt2(perf_csrs_io_dec_tlu_perfcnt2),
    .io_dec_tlu_perfcnt3(perf_csrs_io_dec_tlu_perfcnt3)
  );
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en)
  );
  rvclkhdr rvclkhdr_12 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en)
  );
  rvclkhdr rvclkhdr_13 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en)
  );
  rvclkhdr rvclkhdr_14 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en)
  );
  rvclkhdr rvclkhdr_15 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en)
  );
  rvclkhdr rvclkhdr_16 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en)
  );
  rvclkhdr rvclkhdr_17 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en)
  );
  rvclkhdr rvclkhdr_18 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_18_io_clk),
    .io_en(rvclkhdr_18_io_en)
  );
  rvclkhdr rvclkhdr_19 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_19_io_clk),
    .io_en(rvclkhdr_19_io_en)
  );
  rvclkhdr rvclkhdr_20 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_20_io_clk),
    .io_en(rvclkhdr_20_io_en)
  );
  rvclkhdr rvclkhdr_21 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_21_io_clk),
    .io_en(rvclkhdr_21_io_en)
  );
  rvclkhdr rvclkhdr_22 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_22_io_clk),
    .io_en(rvclkhdr_22_io_en)
  );
  rvclkhdr rvclkhdr_23 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_23_io_clk),
    .io_en(rvclkhdr_23_io_en)
  );
  rvclkhdr rvclkhdr_24 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_24_io_clk),
    .io_en(rvclkhdr_24_io_en)
  );
  rvclkhdr rvclkhdr_25 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_25_io_clk),
    .io_en(rvclkhdr_25_io_en)
  );
  rvclkhdr rvclkhdr_26 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_26_io_clk),
    .io_en(rvclkhdr_26_io_en)
  );
  rvclkhdr rvclkhdr_27 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_27_io_clk),
    .io_en(rvclkhdr_27_io_en)
  );
  rvclkhdr rvclkhdr_28 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_28_io_clk),
    .io_en(rvclkhdr_28_io_en)
  );
  rvclkhdr rvclkhdr_29 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_29_io_clk),
    .io_en(rvclkhdr_29_io_en)
  );
  rvclkhdr rvclkhdr_30 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_30_io_clk),
    .io_en(rvclkhdr_30_io_en)
  );
  rvclkhdr rvclkhdr_31 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_31_io_clk),
    .io_en(rvclkhdr_31_io_en)
  );
  rvclkhdr rvclkhdr_32 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_32_io_clk),
    .io_en(rvclkhdr_32_io_en)
  );
  rvclkhdr rvclkhdr_33 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_33_io_clk),
    .io_en(rvclkhdr_33_io_en)
  );
  rvclkhdr rvclkhdr_34 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_34_io_clk),
    .io_en(rvclkhdr_34_io_en)
  );
  assign io_dec_tlu_ic_diag_pkt_icache_wrdata = {_T_820,dicad0}; // @[dec_tlu_ctl.scala 2200:63]
  assign io_dec_tlu_ic_diag_pkt_icache_dicawics = dicawics; // @[dec_tlu_ctl.scala 2203:48]
  assign io_dec_tlu_ic_diag_pkt_icache_rd_valid = perfmux_flop_io_icache_rd_valid_f; // @[dec_tlu_ctl.scala 2211:48]
  assign io_dec_tlu_ic_diag_pkt_icache_wr_valid = perfmux_flop_io_icache_wr_valid_f; // @[dec_tlu_ctl.scala 2212:48]
  assign io_trigger_pkt_any_0_select = io_mtdata1_t_0[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_0_match_pkt = io_mtdata1_t_0[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_0_store = io_mtdata1_t_0[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_0_load = io_mtdata1_t_0[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_0_execute = io_mtdata1_t_0[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_0_m = io_mtdata1_t_0[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_0_tdata2 = mtdata2_t_0; // @[dec_tlu_ctl.scala 2305:59]
  assign io_trigger_pkt_any_1_select = io_mtdata1_t_1[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_1_match_pkt = io_mtdata1_t_1[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_1_store = io_mtdata1_t_1[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_1_load = io_mtdata1_t_1[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_1_execute = io_mtdata1_t_1[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_1_m = io_mtdata1_t_1[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_1_tdata2 = mtdata2_t_1; // @[dec_tlu_ctl.scala 2305:59]
  assign io_trigger_pkt_any_2_select = io_mtdata1_t_2[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_2_match_pkt = io_mtdata1_t_2[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_2_store = io_mtdata1_t_2[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_2_load = io_mtdata1_t_2[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_2_execute = io_mtdata1_t_2[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_2_m = io_mtdata1_t_2[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_2_tdata2 = mtdata2_t_2; // @[dec_tlu_ctl.scala 2305:59]
  assign io_trigger_pkt_any_3_select = io_mtdata1_t_3[7]; // @[dec_tlu_ctl.scala 2287:48]
  assign io_trigger_pkt_any_3_match_pkt = io_mtdata1_t_3[4]; // @[dec_tlu_ctl.scala 2288:51]
  assign io_trigger_pkt_any_3_store = io_mtdata1_t_3[1]; // @[dec_tlu_ctl.scala 2289:48]
  assign io_trigger_pkt_any_3_load = io_mtdata1_t_3[0]; // @[dec_tlu_ctl.scala 2290:48]
  assign io_trigger_pkt_any_3_execute = io_mtdata1_t_3[2]; // @[dec_tlu_ctl.scala 2291:48]
  assign io_trigger_pkt_any_3_m = io_mtdata1_t_3[3]; // @[dec_tlu_ctl.scala 2292:48]
  assign io_trigger_pkt_any_3_tdata2 = mtdata2_t_3; // @[dec_tlu_ctl.scala 2305:59]
  assign io_dec_tlu_int_valid_wb1 = dec_tlu_int_valid_wb2; // @[dec_tlu_ctl.scala 2478:34]
  assign io_dec_tlu_i0_exc_valid_wb1 = _T_1140 & _T_1146; // @[dec_tlu_ctl.scala 2469:39]
  assign io_dec_tlu_i0_valid_wb1 = _T_1140 & io_i0_valid_wb; // @[dec_tlu_ctl.scala 2468:39]
  assign io_dec_tlu_mtval_wb1 = mtval; // @[dec_tlu_ctl.scala 2479:31]
  assign io_dec_tlu_exc_cause_wb1 = dec_tlu_int_valid_wb2 ? dec_tlu_exc_cause_wb2 : dec_tlu_exc_cause_wb1_raw; // @[dec_tlu_ctl.scala 2477:34]
  assign io_dec_tlu_perfcnt0 = perf_csrs_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 2436:29]
  assign io_dec_tlu_perfcnt1 = perf_csrs_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 2437:29]
  assign io_dec_tlu_perfcnt2 = perf_csrs_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 2438:29]
  assign io_dec_tlu_perfcnt3 = perf_csrs_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 2439:29]
  assign io_dec_tlu_misc_clk_override = mcgc[8]; // @[dec_tlu_ctl.scala 1757:38]
  assign io_dec_tlu_dec_clk_override = mcgc[7]; // @[dec_tlu_ctl.scala 1758:38]
  assign io_dec_tlu_ifu_clk_override = mcgc[5]; // @[dec_tlu_ctl.scala 1759:38]
  assign io_dec_tlu_lsu_clk_override = mcgc[4]; // @[dec_tlu_ctl.scala 1760:38]
  assign io_dec_tlu_bus_clk_override = mcgc[3]; // @[dec_tlu_ctl.scala 1761:38]
  assign io_dec_tlu_pic_clk_override = mcgc[2]; // @[dec_tlu_ctl.scala 1762:38]
  assign io_dec_tlu_dccm_clk_override = mcgc[1]; // @[dec_tlu_ctl.scala 1763:38]
  assign io_dec_tlu_icm_clk_override = mcgc[0]; // @[dec_tlu_ctl.scala 1764:38]
  assign io_dec_csr_rddata_d = _T_1434 | _T_1380; // @[dec_tlu_ctl.scala 2485:28]
  assign io_dec_tlu_pipelining_disable = mfdc[0]; // @[dec_tlu_ctl.scala 1813:46]
  assign io_dec_tlu_wr_pause_r = _T_426 & _T_427; // @[dec_tlu_ctl.scala 1822:31]
  assign io_dec_tlu_meipt = meipt; // @[dec_tlu_ctl.scala 2050:26]
  assign io_dec_tlu_meicurpl = meicurpl; // @[dec_tlu_ctl.scala 2014:29]
  assign io_dec_tlu_meihap = {meivt,meihap}; // @[dec_tlu_ctl.scala 2000:27]
  assign io_dec_tlu_mrac_ff = mrac; // @[dec_tlu_ctl.scala 1852:28]
  assign io_dec_tlu_wb_coalescing_disable = mfdc[2]; // @[dec_tlu_ctl.scala 1812:46]
  assign io_dec_tlu_bpred_disable = mfdc[3]; // @[dec_tlu_ctl.scala 1811:46]
  assign io_dec_tlu_sideeffect_posted_disable = mfdc[6]; // @[dec_tlu_ctl.scala 1810:46]
  assign io_dec_tlu_core_ecc_disable = mfdc[8]; // @[dec_tlu_ctl.scala 1809:46]
  assign io_dec_tlu_external_ldfwd_disable = mfdc[11]; // @[dec_tlu_ctl.scala 1808:46]
  assign io_dec_tlu_dma_qos_prty = mfdc[18:16]; // @[dec_tlu_ctl.scala 1806:46]
  assign io_dec_tlu_trace_disable = mfdc[12]; // @[dec_tlu_ctl.scala 1807:46]
  assign io_dec_csr_wen_r_mod = _T_1 & _T_2; // @[dec_tlu_ctl.scala 1472:30]
  assign io_fw_halt_req = _T_557 & _T_558; // @[dec_tlu_ctl.scala 1887:24]
  assign io_mstatus = perfmux_flop_io_mstatus; // @[dec_tlu_ctl.scala 2348:26]
  assign io_mstatus_mie_ns = io_mstatus[0] & _T_54; // @[dec_tlu_ctl.scala 1489:27]
  assign io_dcsr = _T_756; // @[dec_tlu_ctl.scala 2098:17]
  assign io_mtvec = _T_61; // @[dec_tlu_ctl.scala 1502:18]
  assign io_mip = perfmux_flop_io_mip; // @[dec_tlu_ctl.scala 2349:18]
  assign io_mie_ns = wr_mie_r ? _T_76 : mie; // @[dec_tlu_ctl.scala 1531:19]
  assign io_npc_r = _T_189 | _T_187; // @[dec_tlu_ctl.scala 1635:18]
  assign io_npc_r_d1 = _T_196; // @[dec_tlu_ctl.scala 1641:21]
  assign io_mepc = _T_231; // @[dec_tlu_ctl.scala 1660:17]
  assign io_mdseac_locked_ns = mdseac_en | _T_545; // @[dec_tlu_ctl.scala 1870:29]
  assign io_mdseac_locked_f = perfmux_flop_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 2378:42]
  assign io_ext_int_freeze_d1 = perfmux_flop_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 2385:42]
  assign io_take_ext_int_start_d1 = perfmux_flop_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 2382:42]
  assign io_take_ext_int_start_d2 = perfmux_flop_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 2383:42]
  assign io_take_ext_int_start_d3 = perfmux_flop_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 2384:42]
  assign io_force_halt = mfdht[0] & _T_665; // @[dec_tlu_ctl.scala 1977:23]
  assign io_dpc = _T_781; // @[dec_tlu_ctl.scala 2115:16]
  assign io_mtdata1_t_0 = _T_965; // @[dec_tlu_ctl.scala 2282:47]
  assign io_mtdata1_t_1 = _T_969; // @[dec_tlu_ctl.scala 2282:47]
  assign io_mtdata1_t_2 = _T_973; // @[dec_tlu_ctl.scala 2282:47]
  assign io_mtdata1_t_3 = _T_977; // @[dec_tlu_ctl.scala 2282:47]
  assign perfmux_flop_reset = reset;
  assign perfmux_flop_io_mcountinhibit = {_T_1138,temp_ncount0}; // @[dec_tlu_ctl.scala 2321:57]
  assign perfmux_flop_io_mhpme_vec_0 = perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_mhpme_vec_1 = perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_mhpme_vec_2 = perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_mhpme_vec_3 = perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 2322:57]
  assign perfmux_flop_io_ifu_pmu_ic_hit = io_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 2323:57]
  assign perfmux_flop_io_ifu_pmu_ic_miss = io_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 2324:57]
  assign perfmux_flop_io_tlu_i0_commit_cmt = io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 2325:57]
  assign perfmux_flop_io_illegal_r = io_illegal_r; // @[dec_tlu_ctl.scala 2326:57]
  assign perfmux_flop_io_exu_pmu_i0_pc4 = io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 2327:57]
  assign perfmux_flop_io_ifu_pmu_instr_aligned = io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 2328:57]
  assign perfmux_flop_io_dec_pmu_instr_decoded = io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 2329:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_divide = io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 2330:57]
  assign perfmux_flop_io_exu_pmu_i0_br_misp = io_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 2331:57]
  assign perfmux_flop_io_dec_pmu_decode_stall = io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 2332:57]
  assign perfmux_flop_io_exu_pmu_i0_br_ataken = io_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 2333:57]
  assign perfmux_flop_io_ifu_pmu_fetch_stall = io_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 2334:57]
  assign perfmux_flop_io_dec_pmu_postsync_stall = io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 2335:57]
  assign perfmux_flop_io_dec_pmu_presync_stall = io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 2336:57]
  assign perfmux_flop_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 2337:57]
  assign perfmux_flop_io_dma_dccm_stall_any = io_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 2338:57]
  assign perfmux_flop_io_dma_iccm_stall_any = io_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 2339:57]
  assign perfmux_flop_io_i0_exception_valid_r = io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 2340:57]
  assign perfmux_flop_io_dec_tlu_pmu_fw_halted = io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2341:57]
  assign perfmux_flop_io_dma_pmu_any_read = io_dma_pmu_any_read; // @[dec_tlu_ctl.scala 2342:57]
  assign perfmux_flop_io_dma_pmu_any_write = io_dma_pmu_any_write; // @[dec_tlu_ctl.scala 2343:57]
  assign perfmux_flop_io_dma_pmu_dccm_read = io_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 2344:57]
  assign perfmux_flop_io_dma_pmu_dccm_write = io_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 2345:57]
  assign perfmux_flop_io_lsu_pmu_load_external_r = io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 2346:57]
  assign perfmux_flop_io_lsu_pmu_store_external_r = io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 2347:57]
  assign perfmux_flop_io_mie = mie; // @[dec_tlu_ctl.scala 2350:57]
  assign perfmux_flop_io_ifu_pmu_bus_trxn = io_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 2351:57]
  assign perfmux_flop_io_lsu_pmu_bus_trxn = io_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 2352:57]
  assign perfmux_flop_io_lsu_pmu_bus_misaligned = io_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 2353:57]
  assign perfmux_flop_io_ifu_pmu_bus_error = io_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 2354:57]
  assign perfmux_flop_io_lsu_pmu_bus_error = io_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 2355:57]
  assign perfmux_flop_io_ifu_pmu_bus_busy = io_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 2356:57]
  assign perfmux_flop_io_lsu_pmu_bus_busy = io_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 2357:57]
  assign perfmux_flop_io_i0_trigger_hit_r = io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 2358:57]
  assign perfmux_flop_io_lsu_exc_valid_r = io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 2359:57]
  assign perfmux_flop_io_take_timer_int = io_take_timer_int; // @[dec_tlu_ctl.scala 2360:57]
  assign perfmux_flop_io_take_int_timer0_int = io_take_int_timer0_int; // @[dec_tlu_ctl.scala 2361:57]
  assign perfmux_flop_io_take_int_timer1_int = io_take_int_timer1_int; // @[dec_tlu_ctl.scala 2362:57]
  assign perfmux_flop_io_take_ext_int = io_take_ext_int; // @[dec_tlu_ctl.scala 2363:57]
  assign perfmux_flop_io_tlu_flush_lower_r = io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 2364:57]
  assign perfmux_flop_io_dec_tlu_br0_error_r = io_dec_tlu_br0_error_r; // @[dec_tlu_ctl.scala 2365:57]
  assign perfmux_flop_io_rfpc_i0_r = io_rfpc_i0_r; // @[dec_tlu_ctl.scala 2366:57]
  assign perfmux_flop_io_dec_tlu_br0_start_error_r = io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 2367:57]
  assign perfmux_flop_io_mdseac_locked_ns = io_mdseac_locked_ns; // @[dec_tlu_ctl.scala 2389:55]
  assign perfmux_flop_io_lsu_single_ecc_error_r = io_lsu_single_ecc_error_r; // @[dec_tlu_ctl.scala 2390:55]
  assign perfmux_flop_io_lsu_i0_exc_r = io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 2391:55]
  assign perfmux_flop_io_take_ext_int_start = io_take_ext_int_start; // @[dec_tlu_ctl.scala 2392:55]
  assign perfmux_flop_io_ext_int_freeze = io_ext_int_freeze; // @[dec_tlu_ctl.scala 2393:55]
  assign perfmux_flop_io_mip_ns = {_T_66,_T_64}; // @[dec_tlu_ctl.scala 2394:55]
  assign perfmux_flop_io_mcyclel_cout = mcyclel_inc2[24]; // @[dec_tlu_ctl.scala 2395:55]
  assign perfmux_flop_io_wr_mcycleh_r = io_dec_csr_wen_r_mod & _T_113; // @[dec_tlu_ctl.scala 2396:55]
  assign perfmux_flop_io_mcyclel_cout_in = ~_T_87; // @[dec_tlu_ctl.scala 2397:55]
  assign perfmux_flop_io_minstret_enable = _T_138 | wr_minstretl_r; // @[dec_tlu_ctl.scala 2398:55]
  assign perfmux_flop_io_minstretl_cout_ns = _T_141 & _T_142; // @[dec_tlu_ctl.scala 2399:55]
  assign perfmux_flop_io_meicidpl_ns = wr_meicpct_r ? io_pic_pl : _T_684; // @[dec_tlu_ctl.scala 2401:55]
  assign perfmux_flop_io_icache_rd_valid = _T_825 & _T_827; // @[dec_tlu_ctl.scala 2402:55]
  assign perfmux_flop_io_icache_wr_valid = _T_718 & _T_830; // @[dec_tlu_ctl.scala 2403:55]
  assign perfmux_flop_io_perfcnt_halted = _T_83 | io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2404:55]
  assign perfmux_flop_io_mstatus_ns = _T_48 | _T_44; // @[dec_tlu_ctl.scala 2405:55]
  assign perfmux_flop_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 2407:56]
  assign perf_csrs_clock = clock;
  assign perf_csrs_reset = reset;
  assign perf_csrs_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 2411:50]
  assign perf_csrs_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 2413:50]
  assign perf_csrs_io_dcsr = io_dcsr; // @[dec_tlu_ctl.scala 2414:50]
  assign perf_csrs_io_dec_tlu_pmu_fw_halted = io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 2415:50]
  assign perf_csrs_io_mhpme_vec_0 = perf_csrs_io_mhpme3; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_mhpme_vec_1 = perf_csrs_io_mhpme4; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_mhpme_vec_2 = perf_csrs_io_mhpme5; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_mhpme_vec_3 = perf_csrs_io_mhpme6; // @[dec_tlu_ctl.scala 2416:50]
  assign perf_csrs_io_dec_csr_wen_r_mod = io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 2417:50]
  assign perf_csrs_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 2418:50]
  assign perf_csrs_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 2419:50]
  assign perf_csrs_io_mhpmc_inc_r_0 = perfmux_flop_io_mhpmc_inc_r_0; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_1 = perfmux_flop_io_mhpmc_inc_r_1; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_2 = perfmux_flop_io_mhpmc_inc_r_2; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_3 = perfmux_flop_io_mhpmc_inc_r_3; // @[dec_tlu_ctl.scala 2420:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_0 = perfmux_flop_io_mhpmc_inc_r_d1_0; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_1 = perfmux_flop_io_mhpmc_inc_r_d1_1; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_2 = perfmux_flop_io_mhpmc_inc_r_d1_2; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_mhpmc_inc_r_d1_3 = perfmux_flop_io_mhpmc_inc_r_d1_3; // @[dec_tlu_ctl.scala 2421:50]
  assign perf_csrs_io_perfcnt_halted_d1 = perfmux_flop_io_perfcnt_halted_d1; // @[dec_tlu_ctl.scala 2422:50]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = io_dec_csr_wen_r_mod & _T_57; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = wr_mcyclel_r | _T_102; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = wr_mcyclel_r | mcyclel_cout_in; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = wr_mcycleh_r | perfmux_flop_io_mcyclel_cout_f; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = wr_minstretl_r | _T_147; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = _T_138 | wr_minstretl_r; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = _T_162 | wr_minstreth_r; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = io_dec_csr_wen_r_mod & _T_167; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = _T_228 | wr_mepc_r; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = io_exc_or_int_valid_r | wr_mcause_r; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = io_tlu_flush_lower_r | wr_mtval_r; // @[lib.scala 407:17]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_11_io_en = io_dec_csr_wen_r_mod & _T_367; // @[lib.scala 407:17]
  assign rvclkhdr_12_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_12_io_en = io_dec_csr_wen_r_mod & _T_388; // @[lib.scala 407:17]
  assign rvclkhdr_13_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_13_io_en = io_dec_csr_wen_r_mod & _T_430; // @[lib.scala 407:17]
  assign rvclkhdr_14_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_14_io_en = _T_549 & _T_550; // @[lib.scala 407:17]
  assign rvclkhdr_15_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_15_io_en = wr_micect_r | io_ic_perr_r; // @[lib.scala 407:17]
  assign rvclkhdr_16_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_16_io_en = _T_604 | io_iccm_dma_sb_error; // @[lib.scala 407:17]
  assign rvclkhdr_17_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_17_io_en = wr_mdccmect_r | perfmux_flop_io_lsu_single_ecc_error_r_d1; // @[lib.scala 407:17]
  assign rvclkhdr_18_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_18_io_en = mfdht[0]; // @[lib.scala 407:17]
  assign rvclkhdr_19_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_19_io_en = io_dec_csr_wen_r_mod & _T_668; // @[lib.scala 407:17]
  assign rvclkhdr_20_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_20_io_en = _T_687 | io_take_ext_int_start; // @[lib.scala 407:17]
  assign rvclkhdr_21_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_21_io_en = _T_753 | io_take_nmi; // @[lib.scala 407:17]
  assign rvclkhdr_22_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_22_io_en = _T_778 | dpc_capture_npc; // @[lib.scala 407:17]
  assign rvclkhdr_23_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_23_io_en = _T_718 & _T_788; // @[lib.scala 407:17]
  assign rvclkhdr_24_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_24_io_en = wr_dicad0_r | io_ifu_ic_debug_rd_data_valid; // @[lib.scala 407:17]
  assign rvclkhdr_25_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_25_io_en = wr_dicad0h_r | io_ifu_ic_debug_rd_data_valid; // @[lib.scala 407:17]
  assign rvclkhdr_26_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_26_io_en = _T_808 | io_ifu_ic_debug_rd_data_valid; // @[lib.scala 407:17]
  assign rvclkhdr_27_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_27_io_en = io_trigger_enabled[0] | wr_mtdata1_t_r_0; // @[lib.scala 407:17]
  assign rvclkhdr_28_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_28_io_en = io_trigger_enabled[1] | wr_mtdata1_t_r_1; // @[lib.scala 407:17]
  assign rvclkhdr_29_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_29_io_en = io_trigger_enabled[2] | wr_mtdata1_t_r_2; // @[lib.scala 407:17]
  assign rvclkhdr_30_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_30_io_en = io_trigger_enabled[3] | wr_mtdata1_t_r_3; // @[lib.scala 407:17]
  assign rvclkhdr_31_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_31_io_en = _T_1073 & _T_893; // @[lib.scala 407:17]
  assign rvclkhdr_32_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_32_io_en = _T_1082 & _T_902; // @[lib.scala 407:17]
  assign rvclkhdr_33_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_33_io_en = _T_1091 & _T_913; // @[lib.scala 407:17]
  assign rvclkhdr_34_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_34_io_en = _T_1100 & _T_922; // @[lib.scala 407:17]
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
  _T_61 = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  mdccmect = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  miccmect = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  micect = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mie = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  temp_ncount6_2 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  temp_ncount0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_106 = _RAND_8[23:0];
  _RAND_9 = {1{`RANDOM}};
  _T_110 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  mcycleh = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  _T_150 = _RAND_11[23:0];
  _RAND_12 = {1{`RANDOM}};
  _T_153 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  minstreth = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mscratch = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  _T_196 = _RAND_15[30:0];
  _RAND_16 = {1{`RANDOM}};
  pc_r_d1 = _RAND_16[30:0];
  _RAND_17 = {1{`RANDOM}};
  _T_231 = _RAND_17[30:0];
  _RAND_18 = {1{`RANDOM}};
  mcause = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mscause = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  mtval = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mcgc_int = _RAND_21[9:0];
  _RAND_22 = {1{`RANDOM}};
  mfdc_int = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  mrac = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mdseac = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mfdht = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  mfdhs = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  force_halt_ctr_f = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  meivt = _RAND_28[21:0];
  _RAND_29 = {1{`RANDOM}};
  meihap = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  meicurpl = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  meipt = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  _T_756 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  _T_781 = _RAND_33[30:0];
  _RAND_34 = {1{`RANDOM}};
  dicawics = _RAND_34[16:0];
  _RAND_35 = {1{`RANDOM}};
  dicad0 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  dicad0h = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  _T_815 = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  mtsel = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  _T_965 = _RAND_39[9:0];
  _RAND_40 = {1{`RANDOM}};
  _T_969 = _RAND_40[9:0];
  _RAND_41 = {1{`RANDOM}};
  _T_973 = _RAND_41[9:0];
  _RAND_42 = {1{`RANDOM}};
  _T_977 = _RAND_42[9:0];
  _RAND_43 = {1{`RANDOM}};
  mtdata2_t_0 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  mtdata2_t_1 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  mtdata2_t_2 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  mtdata2_t_3 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  dec_tlu_exc_cause_wb2 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  dec_tlu_int_valid_wb2 = _RAND_48[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    mpmc_b = 1'h0;
  end
  if (reset) begin
    _T_61 = 31'h0;
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
    mie = 6'h0;
  end
  if (reset) begin
    temp_ncount6_2 = 5'h0;
  end
  if (reset) begin
    temp_ncount0 = 1'h0;
  end
  if (reset) begin
    _T_106 = 24'h0;
  end
  if (reset) begin
    _T_110 = 8'h0;
  end
  if (reset) begin
    mcycleh = 32'h0;
  end
  if (reset) begin
    _T_150 = 24'h0;
  end
  if (reset) begin
    _T_153 = 8'h0;
  end
  if (reset) begin
    minstreth = 32'h0;
  end
  if (reset) begin
    mscratch = 32'h0;
  end
  if (reset) begin
    _T_196 = 31'h0;
  end
  if (reset) begin
    pc_r_d1 = 31'h0;
  end
  if (reset) begin
    _T_231 = 31'h0;
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
    mcgc_int = 10'h0;
  end
  if (reset) begin
    mfdc_int = 16'h0;
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
    meipt = 4'h0;
  end
  if (reset) begin
    _T_756 = 16'h0;
  end
  if (reset) begin
    _T_781 = 31'h0;
  end
  if (reset) begin
    dicawics = 17'h0;
  end
  if (reset) begin
    dicad0 = 32'h0;
  end
  if (reset) begin
    dicad0h = 32'h0;
  end
  if (reset) begin
    _T_815 = 7'h0;
  end
  if (reset) begin
    mtsel = 2'h0;
  end
  if (reset) begin
    _T_965 = 10'h0;
  end
  if (reset) begin
    _T_969 = 10'h0;
  end
  if (reset) begin
    _T_973 = 10'h0;
  end
  if (reset) begin
    _T_977 = 10'h0;
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
    dec_tlu_exc_cause_wb2 = 5'h0;
  end
  if (reset) begin
    dec_tlu_int_valid_wb2 = 1'h0;
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
      mpmc_b <= _T_565;
    end else begin
      mpmc_b <= _T_566;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_61 <= 31'h0;
    end else if (wr_mtvec_r) begin
      _T_61 <= mtvec_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mdccmect <= 32'h0;
    end else if (_T_625) begin
      if (wr_mdccmect_r) begin
        mdccmect <= _T_580;
      end else begin
        mdccmect <= _T_624;
      end
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      miccmect <= 32'h0;
    end else if (_T_605) begin
      if (wr_miccmect_r) begin
        miccmect <= _T_580;
      end else begin
        miccmect <= _T_603;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      micect <= 32'h0;
    end else if (_T_583) begin
      if (wr_micect_r) begin
        micect <= _T_580;
      end else begin
        micect <= _T_582;
      end
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mie <= 6'h0;
    end else begin
      mie <= io_mie_ns;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      temp_ncount6_2 <= 5'h0;
    end else if (wr_mcountinhibit_r) begin
      temp_ncount6_2 <= io_dec_csr_wrdata_r[6:2];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      temp_ncount0 <= 1'h0;
    end else if (wr_mcountinhibit_r) begin
      temp_ncount0 <= io_dec_csr_wrdata_r[0];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_106 <= 24'h0;
    end else if (_T_104) begin
      _T_106 <= mcyclel_ns[31:8];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_110 <= 8'h0;
    end else if (_T_108) begin
      _T_110 <= mcyclel_ns[7:0];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mcycleh <= 32'h0;
    end else if (_T_117) begin
      if (wr_mcycleh_r) begin
        mcycleh <= io_dec_csr_wrdata_r;
      end else begin
        mcycleh <= mcycleh_inc;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_150 <= 24'h0;
    end else if (_T_148) begin
      _T_150 <= minstretl_ns[31:8];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_153 <= 8'h0;
    end else if (minstret_enable) begin
      _T_153 <= minstretl_ns[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      minstreth <= 32'h0;
    end else if (_T_163) begin
      if (wr_minstreth_r) begin
        minstreth <= io_dec_csr_wrdata_r;
      end else begin
        minstreth <= minstreth_inc;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mscratch <= 32'h0;
    end else if (wr_mscratch_r) begin
      mscratch <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_196 <= 31'h0;
    end else if (_T_193) begin
      _T_196 <= io_npc_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pc_r_d1 <= 31'h0;
    end else if (pc0_valid_r) begin
      pc_r_d1 <= pc_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_231 <= 31'h0;
    end else if (_T_229) begin
      _T_231 <= mepc_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mcause <= 32'h0;
    end else if (_T_274) begin
      mcause <= mcause_ns;
    end
  end
  always @(posedge io_e4e5_int_clk or posedge reset) begin
    if (reset) begin
      mscause <= 4'h0;
    end else begin
      mscause <= _T_304 | _T_303;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtval <= 32'h0;
    end else if (_T_363) begin
      mtval <= mtval_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mcgc_int <= 10'h0;
    end else if (wr_mcgc_r) begin
      if (wr_mcgc_r) begin
        mcgc_int <= _T_372;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mfdc_int <= 16'h0;
    end else if (wr_mfdc_r) begin
      mfdc_int <= mfdc_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mrac <= 32'h0;
    end else if (wr_mrac_r) begin
      mrac <= mrac_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mdseac <= 32'h0;
    end else if (mdseac_en) begin
      mdseac <= io_lsu_imprecise_error_addr_any;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mfdht <= 6'h0;
    end else if (wr_mfdht_r) begin
      if (wr_mfdht_r) begin
        mfdht <= io_dec_csr_wrdata_r[5:0];
      end
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      mfdhs <= 2'h0;
    end else if (_T_651) begin
      if (wr_mfdhs_r) begin
        mfdhs <= io_dec_csr_wrdata_r[1:0];
      end else if (_T_645) begin
        mfdhs <= _T_649;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      force_halt_ctr_f <= 32'h0;
    end else if (mfdht[0]) begin
      if (io_debug_halt_req_f) begin
        force_halt_ctr_f <= _T_656;
      end else if (io_dbg_tlu_halted_f) begin
        force_halt_ctr_f <= 32'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      meivt <= 22'h0;
    end else if (wr_meivt_r) begin
      meivt <= io_dec_csr_wrdata_r[31:10];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      meihap <= 8'h0;
    end else if (wr_meicpct_r) begin
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
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      meipt <= 4'h0;
    end else if (wr_meipt_r) begin
      meipt <= io_dec_csr_wrdata_r[3:0];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_756 <= 16'h0;
    end else if (_T_754) begin
      if (enter_debug_halt_req_le) begin
        _T_756 <= _T_730;
      end else if (wr_dcsr_r) begin
        _T_756 <= _T_745;
      end else begin
        _T_756 <= _T_750;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_781 <= 31'h0;
    end else if (_T_779) begin
      _T_781 <= dpc_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dicawics <= 17'h0;
    end else if (wr_dicawics_r) begin
      dicawics <= dicawics_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dicad0 <= 32'h0;
    end else if (_T_795) begin
      if (wr_dicad0_r) begin
        dicad0 <= io_dec_csr_wrdata_r;
      end else begin
        dicad0 <= io_ifu_ic_debug_rd_data[31:0];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dicad0h <= 32'h0;
    end else if (_T_802) begin
      if (wr_dicad0h_r) begin
        dicad0h <= io_dec_csr_wrdata_r;
      end else begin
        dicad0h <= io_ifu_ic_debug_rd_data[63:32];
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_815 <= 7'h0;
    end else if (_T_813) begin
      if (_T_808) begin
        _T_815 <= io_dec_csr_wrdata_r[6:0];
      end else begin
        _T_815 <= io_ifu_ic_debug_rd_data[70:64];
      end
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mtsel <= 2'h0;
    end else if (wr_mtsel_r) begin
      mtsel <= io_dec_csr_wrdata_r[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_965 <= 10'h0;
    end else if (_T_963) begin
      if (wr_mtdata1_t_r_0) begin
        _T_965 <= tdata_wrdata_r;
      end else begin
        _T_965 <= _T_933;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_969 <= 10'h0;
    end else if (_T_967) begin
      if (wr_mtdata1_t_r_1) begin
        _T_969 <= tdata_wrdata_r;
      end else begin
        _T_969 <= _T_942;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_973 <= 10'h0;
    end else if (_T_971) begin
      if (wr_mtdata1_t_r_2) begin
        _T_973 <= tdata_wrdata_r;
      end else begin
        _T_973 <= _T_951;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_977 <= 10'h0;
    end else if (_T_975) begin
      if (wr_mtdata1_t_r_3) begin
        _T_977 <= tdata_wrdata_r;
      end else begin
        _T_977 <= _T_960;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_0 <= 32'h0;
    end else if (wr_mtdata2_t_r_0) begin
      mtdata2_t_0 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_1 <= 32'h0;
    end else if (wr_mtdata2_t_r_1) begin
      mtdata2_t_1 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_2 <= 32'h0;
    end else if (wr_mtdata2_t_r_2) begin
      mtdata2_t_2 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mtdata2_t_3 <= 32'h0;
    end else if (wr_mtdata2_t_r_3) begin
      mtdata2_t_3 <= io_dec_csr_wrdata_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dec_tlu_exc_cause_wb2 <= 5'h0;
    end else if (_T_1153) begin
      dec_tlu_exc_cause_wb2 <= dec_tlu_exc_cause_wb1_raw;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dec_tlu_int_valid_wb2 <= 1'h0;
    end else if (_T_1156) begin
      dec_tlu_int_valid_wb2 <= dec_tlu_int_valid_wb1_raw;
    end
  end
endmodule
module dec_timer_ctl(
  input         clock,
  input         reset,
  input         io_free_l2clk,
  input         io_csr_wr_clk,
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 404:23]
  reg [23:0] _T_28; // @[Reg.scala 27:20]
  reg [7:0] _T_33; // @[Reg.scala 27:20]
  wire [31:0] mitcnt0 = {_T_28,_T_33}; // @[Cat.scala 29:58]
  reg [31:0] mitb0_b; // @[Reg.scala 27:20]
  wire [31:0] mitb0 = ~mitb0_b; // @[dec_tlu_ctl.scala 3335:22]
  wire  mit0_match_ns = mitcnt0 >= mitb0; // @[dec_tlu_ctl.scala 3277:36]
  reg [23:0] _T_67; // @[Reg.scala 27:20]
  reg [7:0] _T_72; // @[Reg.scala 27:20]
  wire [31:0] mitcnt1 = {_T_67,_T_72}; // @[Cat.scala 29:58]
  reg [31:0] mitb1_b; // @[Reg.scala 27:20]
  wire [31:0] mitb1 = ~mitb1_b; // @[dec_tlu_ctl.scala 3344:18]
  wire  mit1_match_ns = mitcnt1 >= mitb1; // @[dec_tlu_ctl.scala 3278:36]
  wire  _T = io_dec_csr_wraddr_r == 12'h7d2; // @[dec_tlu_ctl.scala 3288:72]
  wire  wr_mitcnt0_r = io_dec_csr_wen_r_mod & _T; // @[dec_tlu_ctl.scala 3288:49]
  reg [1:0] _T_90; // @[Reg.scala 27:20]
  reg  mitctl0_0_b; // @[Reg.scala 27:20]
  wire  _T_91 = ~mitctl0_0_b; // @[dec_tlu_ctl.scala 3360:107]
  wire [2:0] mitctl0 = {_T_90,_T_91}; // @[Cat.scala 29:58]
  wire  _T_2 = ~io_dec_pause_state; // @[dec_tlu_ctl.scala 3290:56]
  wire  _T_4 = _T_2 | mitctl0[2]; // @[dec_tlu_ctl.scala 3290:76]
  wire  _T_5 = mitctl0[0] & _T_4; // @[dec_tlu_ctl.scala 3290:53]
  wire  _T_6 = ~io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 3290:112]
  wire  _T_8 = _T_6 | mitctl0[1]; // @[dec_tlu_ctl.scala 3290:138]
  wire  _T_9 = _T_5 & _T_8; // @[dec_tlu_ctl.scala 3290:109]
  wire  _T_10 = ~io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 3290:173]
  wire  mitcnt0_inc_ok = _T_9 & _T_10; // @[dec_tlu_ctl.scala 3290:171]
  wire [7:0] _T_14 = mitcnt0[7:0] + 8'h1; // @[dec_tlu_ctl.scala 3293:38]
  wire [8:0] mitcnt0_inc1 = {{1'd0}, _T_14}; // @[dec_tlu_ctl.scala 3293:22]
  wire  mitcnt0_inc_cout = mitcnt0_inc1[8]; // @[dec_tlu_ctl.scala 3294:44]
  wire [23:0] _T_16 = {23'h0,mitcnt0_inc_cout}; // @[Cat.scala 29:58]
  wire [23:0] mitcnt0_inc2 = mitcnt0[31:8] + _T_16; // @[dec_tlu_ctl.scala 3295:39]
  wire [31:0] mitcnt0_inc = {mitcnt0_inc2,mitcnt0_inc1[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_22 = mit0_match_ns ? 32'h0 : mitcnt0_inc; // @[dec_tlu_ctl.scala 3298:69]
  wire [31:0] mitcnt0_ns = wr_mitcnt0_r ? io_dec_csr_wrdata_r : _T_22; // @[dec_tlu_ctl.scala 3298:30]
  wire  _T_24 = mitcnt0_inc_ok & mitcnt0_inc_cout; // @[dec_tlu_ctl.scala 3301:87]
  wire  _T_25 = wr_mitcnt0_r | _T_24; // @[dec_tlu_ctl.scala 3301:69]
  wire  _T_26 = _T_25 | mit0_match_ns; // @[dec_tlu_ctl.scala 3301:107]
  wire  _T_30 = wr_mitcnt0_r | mitcnt0_inc_ok; // @[dec_tlu_ctl.scala 3302:54]
  wire  _T_31 = _T_30 | mit0_match_ns; // @[dec_tlu_ctl.scala 3302:71]
  wire  _T_35 = io_dec_csr_wraddr_r == 12'h7d5; // @[dec_tlu_ctl.scala 3309:72]
  wire  wr_mitcnt1_r = io_dec_csr_wen_r_mod & _T_35; // @[dec_tlu_ctl.scala 3309:49]
  reg [2:0] _T_101; // @[Reg.scala 27:20]
  reg  mitctl1_0_b; // @[Reg.scala 27:20]
  wire  _T_102 = ~mitctl1_0_b; // @[dec_tlu_ctl.scala 3374:92]
  wire [3:0] mitctl1 = {_T_101,_T_102}; // @[Cat.scala 29:58]
  wire  _T_39 = _T_2 | mitctl1[2]; // @[dec_tlu_ctl.scala 3311:76]
  wire  _T_40 = mitctl1[0] & _T_39; // @[dec_tlu_ctl.scala 3311:53]
  wire  _T_43 = _T_6 | mitctl1[1]; // @[dec_tlu_ctl.scala 3311:138]
  wire  _T_44 = _T_40 & _T_43; // @[dec_tlu_ctl.scala 3311:109]
  wire  _T_46 = _T_44 & _T_10; // @[dec_tlu_ctl.scala 3311:171]
  wire  _T_48 = ~mitctl1[3]; // @[dec_tlu_ctl.scala 3311:205]
  wire  _T_49 = _T_48 | mit0_match_ns; // @[dec_tlu_ctl.scala 3311:217]
  wire  mitcnt1_inc_ok = _T_46 & _T_49; // @[dec_tlu_ctl.scala 3311:202]
  wire [7:0] _T_53 = mitcnt1[7:0] + 8'h1; // @[dec_tlu_ctl.scala 3316:38]
  wire [8:0] mitcnt1_inc1 = {{1'd0}, _T_53}; // @[dec_tlu_ctl.scala 3316:22]
  wire  mitcnt1_inc_cout = mitcnt1_inc1[8]; // @[dec_tlu_ctl.scala 3317:44]
  wire [23:0] _T_55 = {23'h0,mitcnt1_inc_cout}; // @[Cat.scala 29:58]
  wire [23:0] mitcnt1_inc2 = mitcnt1[31:8] + _T_55; // @[dec_tlu_ctl.scala 3318:39]
  wire [31:0] mitcnt1_inc = {mitcnt1_inc2,mitcnt1_inc1[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_61 = mit1_match_ns ? 32'h0 : mitcnt1_inc; // @[dec_tlu_ctl.scala 3321:75]
  wire [31:0] mitcnt1_ns = wr_mitcnt1_r ? io_dec_csr_wrdata_r : _T_61; // @[dec_tlu_ctl.scala 3321:29]
  wire  _T_63 = mitcnt1_inc_ok & mitcnt1_inc_cout; // @[dec_tlu_ctl.scala 3323:87]
  wire  _T_64 = wr_mitcnt1_r | _T_63; // @[dec_tlu_ctl.scala 3323:69]
  wire  _T_65 = _T_64 | mit1_match_ns; // @[dec_tlu_ctl.scala 3323:107]
  wire  _T_69 = wr_mitcnt1_r | mitcnt1_inc_ok; // @[dec_tlu_ctl.scala 3324:54]
  wire  _T_70 = _T_69 | mit1_match_ns; // @[dec_tlu_ctl.scala 3324:71]
  wire  _T_74 = io_dec_csr_wraddr_r == 12'h7d3; // @[dec_tlu_ctl.scala 3333:70]
  wire  wr_mitb0_r = io_dec_csr_wen_r_mod & _T_74; // @[dec_tlu_ctl.scala 3333:47]
  wire [31:0] _T_75 = ~io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 3334:38]
  wire  _T_78 = io_dec_csr_wraddr_r == 12'h7d6; // @[dec_tlu_ctl.scala 3342:69]
  wire  wr_mitb1_r = io_dec_csr_wen_r_mod & _T_78; // @[dec_tlu_ctl.scala 3342:47]
  wire  _T_82 = io_dec_csr_wraddr_r == 12'h7d4; // @[dec_tlu_ctl.scala 3355:72]
  wire  wr_mitctl0_r = io_dec_csr_wen_r_mod & _T_82; // @[dec_tlu_ctl.scala 3355:49]
  wire [2:0] mitctl0_ns = wr_mitctl0_r ? io_dec_csr_wrdata_r[2:0] : mitctl0; // @[dec_tlu_ctl.scala 3356:31]
  wire  mitctl0_0_b_ns = ~mitctl0_ns[0]; // @[dec_tlu_ctl.scala 3358:30]
  wire  _T_93 = io_dec_csr_wraddr_r == 12'h7d7; // @[dec_tlu_ctl.scala 3370:71]
  wire  wr_mitctl1_r = io_dec_csr_wen_r_mod & _T_93; // @[dec_tlu_ctl.scala 3370:49]
  wire [3:0] mitctl1_ns = wr_mitctl1_r ? io_dec_csr_wrdata_r[3:0] : mitctl1; // @[dec_tlu_ctl.scala 3371:31]
  wire  mitctl1_0_b_ns = ~mitctl1_ns[0]; // @[dec_tlu_ctl.scala 3372:29]
  wire  _T_104 = io_csr_mitcnt1 | io_csr_mitcnt0; // @[dec_tlu_ctl.scala 3376:51]
  wire  _T_105 = _T_104 | io_csr_mitb1; // @[dec_tlu_ctl.scala 3376:68]
  wire  _T_106 = _T_105 | io_csr_mitb0; // @[dec_tlu_ctl.scala 3376:83]
  wire  _T_107 = _T_106 | io_csr_mitctl0; // @[dec_tlu_ctl.scala 3376:98]
  wire [31:0] _T_116 = {29'h0,_T_90,_T_91}; // @[Cat.scala 29:58]
  wire [31:0] _T_119 = {28'h0,_T_101,_T_102}; // @[Cat.scala 29:58]
  wire [31:0] _T_120 = io_csr_mitcnt0 ? mitcnt0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_121 = io_csr_mitcnt1 ? mitcnt1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_122 = io_csr_mitb0 ? mitb0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_123 = io_csr_mitb1 ? mitb1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_124 = io_csr_mitctl0 ? _T_116 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_125 = io_csr_mitctl1 ? _T_119 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_126 = _T_120 | _T_121; // @[Mux.scala 27:72]
  wire [31:0] _T_127 = _T_126 | _T_122; // @[Mux.scala 27:72]
  wire [31:0] _T_128 = _T_127 | _T_123; // @[Mux.scala 27:72]
  wire [31:0] _T_129 = _T_128 | _T_124; // @[Mux.scala 27:72]
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  assign io_dec_timer_rddata_d = _T_129 | _T_125; // @[dec_tlu_ctl.scala 3377:33]
  assign io_dec_timer_read_d = _T_107 | io_csr_mitctl1; // @[dec_tlu_ctl.scala 3376:33]
  assign io_dec_timer_t0_pulse = mitcnt0 >= mitb0; // @[dec_tlu_ctl.scala 3280:31]
  assign io_dec_timer_t1_pulse = mitcnt1 >= mitb1; // @[dec_tlu_ctl.scala 3281:31]
  assign rvclkhdr_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = _T_25 | mit0_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = _T_30 | mit0_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = _T_64 | mit1_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = io_free_l2clk; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = _T_69 | mit1_match_ns; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = io_dec_csr_wen_r_mod & _T_74; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = io_dec_csr_wen_r_mod & _T_78; // @[lib.scala 407:17]
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
  _T_28 = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  _T_33 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  mitb0_b = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  _T_67 = _RAND_3[23:0];
  _RAND_4 = {1{`RANDOM}};
  _T_72 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  mitb1_b = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_90 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  mitctl0_0_b = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_101 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  mitctl1_0_b = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_28 = 24'h0;
  end
  if (reset) begin
    _T_33 = 8'h0;
  end
  if (reset) begin
    mitb0_b = 32'h0;
  end
  if (reset) begin
    _T_67 = 24'h0;
  end
  if (reset) begin
    _T_72 = 8'h0;
  end
  if (reset) begin
    mitb1_b = 32'h0;
  end
  if (reset) begin
    _T_90 = 2'h0;
  end
  if (reset) begin
    mitctl0_0_b = 1'h0;
  end
  if (reset) begin
    _T_101 = 3'h0;
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
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_28 <= 24'h0;
    end else if (_T_26) begin
      _T_28 <= mitcnt0_ns[31:8];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_33 <= 8'h0;
    end else if (_T_31) begin
      _T_33 <= mitcnt0_ns[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mitb0_b <= 32'h0;
    end else if (wr_mitb0_r) begin
      mitb0_b <= _T_75;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_67 <= 24'h0;
    end else if (_T_65) begin
      _T_67 <= mitcnt1_ns[31:8];
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_72 <= 8'h0;
    end else if (_T_70) begin
      _T_72 <= mitcnt1_ns[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mitb1_b <= 32'h0;
    end else if (wr_mitb1_r) begin
      mitb1_b <= _T_75;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      _T_90 <= 2'h0;
    end else if (wr_mitctl0_r) begin
      _T_90 <= mitctl0_ns[2:1];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mitctl0_0_b <= 1'h0;
    end else if (wr_mitctl0_r) begin
      mitctl0_0_b <= mitctl0_0_b_ns;
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      _T_101 <= 3'h0;
    end else if (wr_mitctl1_r) begin
      _T_101 <= mitctl1_ns[3:1];
    end
  end
  always @(posedge io_csr_wr_clk or posedge reset) begin
    if (reset) begin
      mitctl1_0_b <= 1'h0;
    end else if (wr_mitctl1_r) begin
      mitctl1_0_b <= mitctl1_0_b_ns;
    end
  end
endmodule
module dec_decode_csr_read(
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
  wire  _T_1 = ~io_dec_csr_rdaddr_d[11]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_3 = ~io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_5 = ~io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_7 = ~io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_9 = _T_1 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_10 = _T_9 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_11 = _T_10 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_15 = ~io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_17 = ~io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_19 = io_dec_csr_rdaddr_d[10] & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_20 = _T_19 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_27 = ~io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:165]
  wire  _T_29 = _T_19 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_36 = io_dec_csr_rdaddr_d[10] & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_37 = _T_36 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_69 = _T_10 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_70 = _T_69 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_75 = _T_15 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_94 = ~io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_96 = ~io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_101 = io_dec_csr_rdaddr_d[11] & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_102 = _T_101 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_103 = _T_102 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_104 = _T_103 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_119 = io_dec_csr_rdaddr_d[7] & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_120 = _T_119 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_121 = _T_120 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_122 = _T_121 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_123 = _T_122 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_138 = _T_15 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_139 = _T_138 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_140 = _T_139 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_141 = _T_140 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_142 = _T_141 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_145 = ~io_dec_csr_rdaddr_d[10]; // @[dec_tlu_ctl.scala 3173:129]
  wire  _T_156 = _T_145 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_157 = _T_156 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_158 = _T_157 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_159 = _T_158 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_160 = _T_159 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_172 = _T_75 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_173 = _T_172 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_182 = _T_75 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_183 = _T_182 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_191 = _T_75 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_196 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_217 = _T_1 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_218 = _T_217 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_219 = _T_218 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_220 = _T_219 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_230 = io_dec_csr_rdaddr_d[10] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_231 = _T_230 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_232 = _T_231 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_240 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[10]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_241 = _T_240 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_258 = _T_145 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_259 = _T_258 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_260 = _T_259 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_261 = _T_260 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_268 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_269 = _T_268 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_281 = _T_268 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_291 = _T_36 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_292 = _T_291 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_299 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_300 = _T_299 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_310 = _T_300 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_311 = _T_310 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_330 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_331 = _T_330 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_332 = _T_331 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_342 = _T_231 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_381 = _T_103 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_382 = _T_381 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_397 = _T_103 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_411 = _T_15 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_412 = _T_411 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_413 = _T_412 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_414 = _T_413 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_415 = _T_414 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_426 = io_dec_csr_rdaddr_d[7] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_427 = _T_426 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_428 = _T_427 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_429 = _T_428 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_444 = _T_119 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_445 = _T_444 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_446 = _T_445 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_447 = _T_446 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_460 = _T_427 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_461 = _T_460 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_478 = _T_446 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_490 = _T_15 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_491 = _T_490 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_492 = _T_491 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_493 = _T_492 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_505 = io_dec_csr_rdaddr_d[5] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_506 = _T_505 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_507 = _T_506 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_508 = _T_507 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_536 = _T_507 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_553 = _T_493 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_562 = io_dec_csr_rdaddr_d[6] & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_563 = _T_562 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_564 = _T_563 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_572 = io_dec_csr_rdaddr_d[6] & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_573 = _T_572 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_574 = _T_573 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_585 = _T_563 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_593 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_594 = _T_593 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_595 = _T_594 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_614 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_615 = _T_614 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_624 = io_dec_csr_rdaddr_d[6] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_625 = _T_624 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_626 = _T_625 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_645 = _T_196 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_646 = _T_645 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_662 = _T_196 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_670 = io_dec_csr_rdaddr_d[6] & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_671 = _T_670 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_672 = _T_671 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_680 = _T_624 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_693 = _T_1 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_694 = _T_693 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_695 = _T_694 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_696 = _T_695 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_703 = io_dec_csr_rdaddr_d[10] & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_704 = _T_703 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_714 = _T_230 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_715 = _T_714 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_725 = _T_703 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_726 = _T_725 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_764 = _T_311 | _T_553; // @[dec_tlu_ctl.scala 3241:81]
  wire  _T_776 = _T_3 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_777 = _T_776 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_778 = _T_777 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_779 = _T_778 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_780 = _T_779 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_781 = _T_764 | _T_780; // @[dec_tlu_ctl.scala 3241:121]
  wire  _T_790 = io_dec_csr_rdaddr_d[11] & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_791 = _T_790 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_792 = _T_791 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_793 = _T_792 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_794 = _T_781 | _T_793; // @[dec_tlu_ctl.scala 3241:155]
  wire  _T_805 = _T_791 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_806 = _T_805 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_807 = _T_794 | _T_806; // @[dec_tlu_ctl.scala 3242:49]
  wire  _T_818 = io_dec_csr_rdaddr_d[7] & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_819 = _T_818 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_820 = _T_819 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_821 = _T_820 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_822 = _T_821 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_846 = _T_311 | _T_70; // @[dec_tlu_ctl.scala 3243:81]
  wire  _T_856 = _T_846 | _T_183; // @[dec_tlu_ctl.scala 3243:121]
  wire  _T_866 = _T_856 | _T_342; // @[dec_tlu_ctl.scala 3243:162]
  wire  _T_881 = _T_1 & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_882 = _T_881 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_883 = _T_882 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_884 = _T_883 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_885 = _T_884 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_886 = _T_885 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_887 = _T_866 | _T_886; // @[dec_tlu_ctl.scala 3244:57]
  wire  _T_899 = _T_217 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_900 = _T_899 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_901 = _T_900 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_902 = _T_901 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_903 = _T_887 | _T_902; // @[dec_tlu_ctl.scala 3244:97]
  wire  _T_914 = _T_231 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_915 = _T_914 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_932 = _T_1 & io_dec_csr_rdaddr_d[10]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_933 = _T_932 & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_934 = _T_933 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_935 = _T_934 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_936 = _T_935 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_937 = _T_936 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_938 = _T_937 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_939 = _T_938 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_940 = _T_939 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_941 = _T_940 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_960 = _T_1 & _T_145; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_961 = _T_960 & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_962 = _T_961 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_963 = _T_962 & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_964 = _T_963 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_965 = _T_964 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_966 = _T_965 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_967 = _T_966 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_968 = _T_967 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_969 = _T_941 | _T_968; // @[dec_tlu_ctl.scala 3246:81]
  wire  _T_990 = _T_964 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_991 = _T_990 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_992 = _T_991 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_993 = _T_969 | _T_992; // @[dec_tlu_ctl.scala 3246:129]
  wire  _T_1009 = io_dec_csr_rdaddr_d[11] & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1010 = _T_1009 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1011 = _T_1010 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1012 = _T_1011 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1013 = _T_1012 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1014 = _T_1013 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1015 = _T_1014 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1016 = _T_1015 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1017 = _T_1016 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1018 = _T_993 | _T_1017; // @[dec_tlu_ctl.scala 3247:73]
  wire  _T_1030 = io_dec_csr_rdaddr_d[11] & _T_145; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1031 = _T_1030 & io_dec_csr_rdaddr_d[9]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1032 = _T_1031 & io_dec_csr_rdaddr_d[8]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1033 = _T_1032 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1034 = _T_1033 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1035 = _T_1034 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1036 = _T_1018 | _T_1035; // @[dec_tlu_ctl.scala 3247:121]
  wire  _T_1055 = _T_936 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1056 = _T_1055 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1057 = _T_1056 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1058 = _T_1057 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1059 = _T_1058 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1060 = _T_1059 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1061 = _T_1036 | _T_1060; // @[dec_tlu_ctl.scala 3248:73]
  wire  _T_1082 = _T_1056 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1083 = _T_1082 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1084 = _T_1061 | _T_1083; // @[dec_tlu_ctl.scala 3248:121]
  wire  _T_1102 = _T_1010 & _T_15; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1103 = _T_1102 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1104 = _T_1103 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1105 = _T_1104 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1106 = _T_1105 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1107 = _T_1106 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1108 = _T_1107 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1109 = _T_1084 | _T_1108; // @[dec_tlu_ctl.scala 3249:73]
  wire  _T_1129 = _T_935 & _T_3; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1130 = _T_1129 & io_dec_csr_rdaddr_d[5]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1131 = _T_1130 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1132 = _T_1131 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1133 = _T_1132 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1134 = _T_1109 | _T_1133; // @[dec_tlu_ctl.scala 3249:129]
  wire  _T_1153 = _T_990 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1154 = _T_1134 | _T_1153; // @[dec_tlu_ctl.scala 3250:73]
  wire  _T_1179 = _T_1106 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1180 = _T_1179 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1181 = _T_1180 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1182 = _T_1154 | _T_1181; // @[dec_tlu_ctl.scala 3250:129]
  wire  _T_1201 = _T_936 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1202 = _T_1201 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1203 = _T_1202 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1204 = _T_1203 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1205 = _T_1182 | _T_1204; // @[dec_tlu_ctl.scala 3251:65]
  wire  _T_1225 = _T_1201 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1226 = _T_1225 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1227 = _T_1226 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1228 = _T_1205 | _T_1227; // @[dec_tlu_ctl.scala 3251:121]
  wire  _T_1252 = _T_1107 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1253 = _T_1228 | _T_1252; // @[dec_tlu_ctl.scala 3252:73]
  wire  _T_1273 = _T_990 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1274 = _T_1273 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1275 = _T_1253 | _T_1274; // @[dec_tlu_ctl.scala 3252:129]
  wire  _T_1292 = _T_1032 & io_dec_csr_rdaddr_d[7]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1293 = _T_1292 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1294 = _T_1293 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1295 = _T_1294 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1296 = _T_1295 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1297 = _T_1275 | _T_1296; // @[dec_tlu_ctl.scala 3253:73]
  wire  _T_1320 = _T_1295 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1321 = _T_1320 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1322 = _T_1297 | _T_1321; // @[dec_tlu_ctl.scala 3253:129]
  wire  _T_1338 = _T_1034 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1339 = _T_1322 | _T_1338; // @[dec_tlu_ctl.scala 3254:73]
  wire  _T_1361 = _T_1226 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1362 = _T_1339 | _T_1361; // @[dec_tlu_ctl.scala 3254:129]
  wire  _T_1383 = _T_1202 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1384 = _T_1362 | _T_1383; // @[dec_tlu_ctl.scala 3255:73]
  wire  _T_1407 = _T_1203 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1408 = _T_1384 | _T_1407; // @[dec_tlu_ctl.scala 3255:129]
  wire  _T_1432 = _T_1130 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1433 = _T_1432 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1434 = _T_1433 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1435 = _T_1434 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1436 = _T_1408 | _T_1435; // @[dec_tlu_ctl.scala 3256:73]
  wire  _T_1452 = _T_1034 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1453 = _T_1436 | _T_1452; // @[dec_tlu_ctl.scala 3256:121]
  wire  _T_1475 = _T_963 & io_dec_csr_rdaddr_d[6]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1476 = _T_1475 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1477 = _T_1476 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1478 = _T_1477 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1479 = _T_1478 & _T_7; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1480 = _T_1453 | _T_1479; // @[dec_tlu_ctl.scala 3257:81]
  wire  _T_1503 = _T_963 & _T_5; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1504 = _T_1503 & _T_94; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1505 = _T_1504 & _T_96; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1506 = _T_1505 & _T_17; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1507 = _T_1506 & _T_27; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1508 = _T_1480 | _T_1507; // @[dec_tlu_ctl.scala 3257:129]
  wire  _T_1527 = _T_990 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1528 = _T_1508 | _T_1527; // @[dec_tlu_ctl.scala 3258:65]
  wire  _T_1544 = _T_1034 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1545 = _T_1528 | _T_1544; // @[dec_tlu_ctl.scala 3258:121]
  wire  _T_1564 = _T_990 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  wire  _T_1565 = _T_1545 | _T_1564; // @[dec_tlu_ctl.scala 3259:81]
  wire  _T_1581 = _T_1034 & io_dec_csr_rdaddr_d[4]; // @[dec_tlu_ctl.scala 3173:198]
  assign io_csr_pkt_csr_misa = _T_11 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3175:57]
  assign io_csr_pkt_csr_mvendorid = _T_20 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3176:57]
  assign io_csr_pkt_csr_marchid = _T_29 & _T_27; // @[dec_tlu_ctl.scala 3177:57]
  assign io_csr_pkt_csr_mimpid = _T_37 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3178:57]
  assign io_csr_pkt_csr_mhartid = _T_19 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3179:57]
  assign io_csr_pkt_csr_mstatus = _T_11 & _T_27; // @[dec_tlu_ctl.scala 3180:57]
  assign io_csr_pkt_csr_mtvec = _T_69 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3181:57]
  assign io_csr_pkt_csr_mip = _T_75 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3182:65]
  assign io_csr_pkt_csr_mie = _T_69 & _T_27; // @[dec_tlu_ctl.scala 3183:65]
  assign io_csr_pkt_csr_mcyclel = _T_104 & _T_17; // @[dec_tlu_ctl.scala 3184:57]
  assign io_csr_pkt_csr_mcycleh = _T_123 & _T_17; // @[dec_tlu_ctl.scala 3185:57]
  assign io_csr_pkt_csr_minstretl = _T_142 & _T_27; // @[dec_tlu_ctl.scala 3186:57]
  assign io_csr_pkt_csr_minstreth = _T_160 & _T_27; // @[dec_tlu_ctl.scala 3187:57]
  assign io_csr_pkt_csr_mscratch = _T_173 & _T_27; // @[dec_tlu_ctl.scala 3188:57]
  assign io_csr_pkt_csr_mepc = _T_182 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3189:57]
  assign io_csr_pkt_csr_mcause = _T_191 & _T_27; // @[dec_tlu_ctl.scala 3190:57]
  assign io_csr_pkt_csr_mscause = _T_196 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3191:57]
  assign io_csr_pkt_csr_mtval = _T_191 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3192:57]
  assign io_csr_pkt_csr_mrac = _T_220 & _T_17; // @[dec_tlu_ctl.scala 3193:57]
  assign io_csr_pkt_csr_dmst = _T_232 & _T_17; // @[dec_tlu_ctl.scala 3194:57]
  assign io_csr_pkt_csr_mdseac = _T_241 & _T_96; // @[dec_tlu_ctl.scala 3195:57]
  assign io_csr_pkt_csr_meihap = _T_240 & io_dec_csr_rdaddr_d[3]; // @[dec_tlu_ctl.scala 3196:57]
  assign io_csr_pkt_csr_meivt = _T_261 & _T_27; // @[dec_tlu_ctl.scala 3197:57]
  assign io_csr_pkt_csr_meipt = _T_269 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3198:57]
  assign io_csr_pkt_csr_meicurpl = _T_268 & io_dec_csr_rdaddr_d[2]; // @[dec_tlu_ctl.scala 3199:57]
  assign io_csr_pkt_csr_meicidpl = _T_281 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3200:57]
  assign io_csr_pkt_csr_dcsr = _T_292 & _T_27; // @[dec_tlu_ctl.scala 3201:57]
  assign io_csr_pkt_csr_mcgc = _T_300 & _T_27; // @[dec_tlu_ctl.scala 3202:57]
  assign io_csr_pkt_csr_mfdc = _T_310 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3203:57]
  assign io_csr_pkt_csr_dpc = _T_292 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3204:65]
  assign io_csr_pkt_csr_mtsel = _T_332 & _T_27; // @[dec_tlu_ctl.scala 3205:57]
  assign io_csr_pkt_csr_mtdata1 = _T_231 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3206:57]
  assign io_csr_pkt_csr_mtdata2 = _T_331 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3207:57]
  assign io_csr_pkt_csr_mhpmc3 = _T_104 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3208:57]
  assign io_csr_pkt_csr_mhpmc4 = _T_382 & _T_27; // @[dec_tlu_ctl.scala 3209:57]
  assign io_csr_pkt_csr_mhpmc5 = _T_397 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3210:57]
  assign io_csr_pkt_csr_mhpmc6 = _T_415 & _T_27; // @[dec_tlu_ctl.scala 3211:57]
  assign io_csr_pkt_csr_mhpmc3h = _T_429 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3212:57]
  assign io_csr_pkt_csr_mhpmc4h = _T_447 & _T_27; // @[dec_tlu_ctl.scala 3213:57]
  assign io_csr_pkt_csr_mhpmc5h = _T_461 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3214:57]
  assign io_csr_pkt_csr_mhpmc6h = _T_478 & _T_27; // @[dec_tlu_ctl.scala 3215:57]
  assign io_csr_pkt_csr_mhpme3 = _T_493 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3216:57]
  assign io_csr_pkt_csr_mhpme4 = _T_508 & _T_27; // @[dec_tlu_ctl.scala 3217:57]
  assign io_csr_pkt_csr_mhpme5 = _T_508 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3218:57]
  assign io_csr_pkt_csr_mhpme6 = _T_536 & _T_27; // @[dec_tlu_ctl.scala 3219:57]
  assign io_csr_pkt_csr_mcountinhibit = _T_493 & _T_27; // @[dec_tlu_ctl.scala 3220:49]
  assign io_csr_pkt_csr_mitctl0 = _T_564 & _T_27; // @[dec_tlu_ctl.scala 3221:57]
  assign io_csr_pkt_csr_mitctl1 = _T_574 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3222:57]
  assign io_csr_pkt_csr_mitb0 = _T_585 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3223:57]
  assign io_csr_pkt_csr_mitb1 = _T_595 & _T_27; // @[dec_tlu_ctl.scala 3224:57]
  assign io_csr_pkt_csr_mitcnt0 = _T_585 & _T_27; // @[dec_tlu_ctl.scala 3225:57]
  assign io_csr_pkt_csr_mitcnt1 = _T_615 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3226:57]
  assign io_csr_pkt_csr_mpmc = _T_626 & io_dec_csr_rdaddr_d[1]; // @[dec_tlu_ctl.scala 3227:57]
  assign io_csr_pkt_csr_meicpct = _T_281 & _T_27; // @[dec_tlu_ctl.scala 3229:57]
  assign io_csr_pkt_csr_micect = _T_646 & _T_27; // @[dec_tlu_ctl.scala 3231:57]
  assign io_csr_pkt_csr_miccmect = _T_645 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3232:57]
  assign io_csr_pkt_csr_mdccmect = _T_662 & _T_27; // @[dec_tlu_ctl.scala 3233:57]
  assign io_csr_pkt_csr_mfdht = _T_672 & _T_27; // @[dec_tlu_ctl.scala 3234:57]
  assign io_csr_pkt_csr_mfdhs = _T_680 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3235:57]
  assign io_csr_pkt_csr_dicawics = _T_696 & _T_27; // @[dec_tlu_ctl.scala 3236:57]
  assign io_csr_pkt_csr_dicad0h = _T_704 & _T_17; // @[dec_tlu_ctl.scala 3237:57]
  assign io_csr_pkt_csr_dicad0 = _T_715 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3238:57]
  assign io_csr_pkt_csr_dicad1 = _T_726 & _T_27; // @[dec_tlu_ctl.scala 3239:57]
  assign io_csr_pkt_csr_dicago = _T_726 & io_dec_csr_rdaddr_d[0]; // @[dec_tlu_ctl.scala 3240:57]
  assign io_csr_pkt_presync = _T_807 | _T_822; // @[dec_tlu_ctl.scala 3241:34]
  assign io_csr_pkt_postsync = _T_903 | _T_915; // @[dec_tlu_ctl.scala 3243:30]
  assign io_csr_pkt_legal = _T_1565 | _T_1581; // @[dec_tlu_ctl.scala 3246:26]
endmodule
module dec_tlu_ctl(
  input         clock,
  input         reset,
  output [29:0] io_tlu_exu_dec_tlu_meihap,
  output        io_tlu_exu_dec_tlu_flush_lower_r,
  output [30:0] io_tlu_exu_dec_tlu_flush_path_r,
  input  [1:0]  io_tlu_exu_exu_i0_br_hist_r,
  input         io_tlu_exu_exu_i0_br_error_r,
  input         io_tlu_exu_exu_i0_br_start_error_r,
  input         io_tlu_exu_exu_i0_br_valid_r,
  input         io_tlu_exu_exu_i0_br_mp_r,
  input         io_tlu_exu_exu_i0_br_middle_r,
  input         io_tlu_exu_exu_pmu_i0_br_misp,
  input         io_tlu_exu_exu_pmu_i0_br_ataken,
  input         io_tlu_exu_exu_pmu_i0_pc4,
  input  [30:0] io_tlu_exu_exu_npc_r,
  input         io_tlu_dma_dma_pmu_dccm_read,
  input         io_tlu_dma_dma_pmu_dccm_write,
  input         io_tlu_dma_dma_pmu_any_read,
  input         io_tlu_dma_dma_pmu_any_write,
  output [2:0]  io_tlu_dma_dec_tlu_dma_qos_prty,
  input         io_tlu_dma_dma_dccm_stall_any,
  input         io_tlu_dma_dma_iccm_stall_any,
  input         io_free_clk,
  input         io_free_l2clk,
  input  [30:0] io_rst_vec,
  input         io_nmi_int,
  input  [30:0] io_nmi_vec,
  input         io_i_cpu_halt_req,
  input         io_i_cpu_run_req,
  input         io_lsu_fastint_stall_any,
  input         io_lsu_idle_any,
  input         io_dec_pmu_instr_decoded,
  input         io_dec_pmu_decode_stall,
  input         io_dec_pmu_presync_stall,
  input         io_dec_pmu_postsync_stall,
  input         io_lsu_store_stall_any,
  input  [30:0] io_lsu_fir_addr,
  input  [1:0]  io_lsu_fir_error,
  input         io_iccm_dma_sb_error,
  input         io_lsu_error_pkt_r_valid,
  input         io_lsu_error_pkt_r_bits_single_ecc_error,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input  [3:0]  io_lsu_error_pkt_r_bits_mscause,
  input  [31:0] io_lsu_error_pkt_r_bits_addr,
  input         io_lsu_single_ecc_error_incr,
  input         io_dec_pause_state,
  input         io_dec_csr_wen_unq_d,
  input         io_dec_csr_any_unq_d,
  input  [11:0] io_dec_csr_rdaddr_d,
  input         io_dec_csr_wen_r,
  input  [11:0] io_dec_csr_wraddr_r,
  input  [31:0] io_dec_csr_wrdata_r,
  input         io_dec_csr_stall_int_ff,
  input         io_dec_tlu_i0_valid_r,
  input  [30:0] io_dec_tlu_i0_pc_r,
  input         io_dec_tlu_packet_r_legal,
  input         io_dec_tlu_packet_r_icaf,
  input         io_dec_tlu_packet_r_icaf_second,
  input  [1:0]  io_dec_tlu_packet_r_icaf_type,
  input         io_dec_tlu_packet_r_fence_i,
  input  [3:0]  io_dec_tlu_packet_r_i0trigger,
  input  [3:0]  io_dec_tlu_packet_r_pmu_i0_itype,
  input         io_dec_tlu_packet_r_pmu_i0_br_unpred,
  input         io_dec_tlu_packet_r_pmu_divide,
  input         io_dec_tlu_packet_r_pmu_lsu_misaligned,
  input  [31:0] io_dec_illegal_inst,
  input         io_dec_i0_decode_d,
  input         io_exu_i0_br_way_r,
  output        io_dec_tlu_core_empty,
  output        io_dec_dbg_cmd_done,
  output        io_dec_dbg_cmd_fail,
  output        io_dec_tlu_dbg_halted,
  output        io_dec_tlu_debug_mode,
  output        io_dec_tlu_resume_ack,
  output        io_dec_tlu_debug_stall,
  output        io_dec_tlu_mpc_halted_only,
  output        io_dec_tlu_flush_extint,
  input         io_dbg_halt_req,
  input         io_dbg_resume_req,
  input         io_dec_div_active,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_pkt,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_pkt,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_pkt,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_pkt,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
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
  output [31:0] io_dec_csr_rddata_d,
  output        io_dec_csr_legal_d,
  output        io_dec_tlu_i0_kill_writeb_wb,
  output        io_dec_tlu_i0_kill_writeb_r,
  output        io_dec_tlu_wr_pause_r,
  output        io_dec_tlu_flush_pause_r,
  output        io_dec_tlu_presync_d,
  output        io_dec_tlu_postsync_d,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  output        io_dec_tlu_i0_exc_valid_wb1,
  output        io_dec_tlu_i0_valid_wb1,
  output        io_dec_tlu_int_valid_wb1,
  output [4:0]  io_dec_tlu_exc_cause_wb1,
  output [31:0] io_dec_tlu_mtval_wb1,
  output        io_dec_tlu_pipelining_disable,
  output        io_dec_tlu_trace_disable,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_dec_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override,
  output        io_dec_tlu_flush_lower_wb,
  input         io_ifu_pmu_instr_aligned,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_valid,
  output [1:0]  io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_way,
  output        io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle,
  output        io_tlu_bp_dec_tlu_flush_leak_one_wb,
  output        io_tlu_bp_dec_tlu_bpred_disable,
  output        io_tlu_ifc_dec_tlu_flush_noredir_wb,
  output [31:0] io_tlu_ifc_dec_tlu_mrac_ff,
  input         io_tlu_ifc_ifu_pmu_fetch_stall,
  output        io_tlu_mem_dec_tlu_flush_err_wb,
  output        io_tlu_mem_dec_tlu_i0_commit_cmt,
  output        io_tlu_mem_dec_tlu_force_halt,
  output        io_tlu_mem_dec_tlu_fence_i_wb,
  output [70:0] io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid,
  output        io_tlu_mem_dec_tlu_core_ecc_disable,
  input         io_tlu_mem_ifu_pmu_ic_miss,
  input         io_tlu_mem_ifu_pmu_ic_hit,
  input         io_tlu_mem_ifu_pmu_bus_error,
  input         io_tlu_mem_ifu_pmu_bus_busy,
  input         io_tlu_mem_ifu_pmu_bus_trxn,
  input         io_tlu_mem_ifu_ic_error_start,
  input         io_tlu_mem_ifu_iccm_rd_ecc_single_err,
  input  [70:0] io_tlu_mem_ifu_ic_debug_rd_data,
  input         io_tlu_mem_ifu_ic_debug_rd_data_valid,
  input         io_tlu_mem_ifu_miss_state_idle,
  input         io_tlu_busbuff_lsu_pmu_bus_trxn,
  input         io_tlu_busbuff_lsu_pmu_bus_misaligned,
  input         io_tlu_busbuff_lsu_pmu_bus_error,
  input         io_tlu_busbuff_lsu_pmu_bus_busy,
  output        io_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  output        io_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  output        io_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  input         io_tlu_busbuff_lsu_imprecise_error_load_any,
  input         io_tlu_busbuff_lsu_imprecise_error_store_any,
  input  [31:0] io_tlu_busbuff_lsu_imprecise_error_addr_any,
  input         io_lsu_tlu_lsu_pmu_load_external_m,
  input         io_lsu_tlu_lsu_pmu_store_external_m,
  input  [7:0]  io_dec_pic_pic_claimid,
  input  [3:0]  io_dec_pic_pic_pl,
  input         io_dec_pic_mhwakeup,
  output [3:0]  io_dec_pic_dec_tlu_meicurpl,
  output [3:0]  io_dec_pic_dec_tlu_meipt,
  input         io_dec_pic_mexintpend
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
`endif // RANDOMIZE_REG_INIT
  wire  int_exc_clock; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_reset; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mhwakeup_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ext_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ce_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_soft_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_timer_int_ready; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer0_int_hold; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer1_int_hold; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ext_int_freeze; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ext_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_fast_int_meicpct; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ignore_ext_int_due_to_lsu_stall; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_ce_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_soft_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_timer_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_reset; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_nmi; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_synchronous_flush_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_flush_lower_wb; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_dec_tlu_flush_path_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_exception_valid_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_exc_or_int_valid_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire [4:0] int_exc_io_exc_cause_wb; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_valid_wb; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_trigger_hit_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_nmi_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire [4:0] int_exc_io_exc_cause_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_tlu_flush_path_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_csr_stall_int_ff; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 282:29]
  wire [5:0] int_exc_io_mip; // @[dec_tlu_ctl.scala 282:29]
  wire [5:0] int_exc_io_mie_ns; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mret_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dcsr_single_step_running; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_internal_pmu_fw_halt_mode; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 282:29]
  wire [1:0] int_exc_io_lsu_fir_error; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_csr_pkt_csr_meicpct; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_fastint_stall_any; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_reset_delayed; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_nmi_int_detected; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 282:29]
  wire [15:0] int_exc_io_dcsr; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_mtvec; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_pause_expired_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_nmi_vec; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_i0_rfnpc_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_fence_i_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_iccm_repair_state_rfnpc; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_i_cpu_run_req_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_rfpc_i0_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_take_halt; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_rst_vec; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_lsu_fir_addr; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_npc_r; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_mepc; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_debug_resume_req_f; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_dpc; // @[dec_tlu_ctl.scala 282:29]
  wire [30:0] int_exc_io_npc_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ebreak_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_ecall_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_illegal_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_inst_acc_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 282:29]
  wire  int_exc_io_dec_tlu_wr_pause_r_d1; // @[dec_tlu_ctl.scala 282:29]
  wire  csr_clock; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_reset; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_free_l2clk; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_free_clk; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 283:23]
  wire [11:0] csr_io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 283:23]
  wire [11:0] csr_io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_i0_decode_d; // @[dec_tlu_ctl.scala 283:23]
  wire [70:0] csr_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[dec_tlu_ctl.scala 283:23]
  wire [16:0] csr_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_0_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_0_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_1_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_1_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_2_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_2_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_select; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_match_pkt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_store; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_load; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_execute; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_pkt_any_3_m; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_trigger_pkt_any_3_tdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 283:23]
  wire [1:0] csr_io_dec_tlu_packet_r_icaf_type; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_int_valid_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_i0_exc_valid_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_i0_valid_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_wen_r; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_tlu_mtval_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire [4:0] csr_io_dec_tlu_exc_cause_wb1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_any_write; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dma_pmu_any_read; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_misc_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_dec_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_ifu_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_lsu_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_bus_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_pic_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_dccm_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_icm_clk_override; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_csr_rddata_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_pipelining_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_wr_pause_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 283:23]
  wire [70:0] csr_io_ifu_ic_debug_rd_data; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_dec_tlu_meipt; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_pic_pl; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_dec_tlu_meicurpl; // @[dec_tlu_ctl.scala 283:23]
  wire [29:0] csr_io_dec_tlu_meihap; // @[dec_tlu_ctl.scala 283:23]
  wire [7:0] csr_io_pic_claimid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_lsu_imprecise_error_addr_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_tlu_mrac_ff; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_wb_coalescing_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_bpred_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_sideeffect_posted_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_core_ecc_disable; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_external_ldfwd_disable; // @[dec_tlu_ctl.scala 283:23]
  wire [2:0] csr_io_dec_tlu_dma_qos_prty; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_trace_disable; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_illegal_inst; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_lsu_error_pkt_r_bits_mscause; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mexintpend; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_exu_npc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_rst_vec; // @[dec_tlu_ctl.scala 283:23]
  wire [27:0] csr_io_core_id; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_dec_timer_rddata_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_timer_read_d; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_rfpc_i0_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_trigger_hit_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_fw_halt_req; // @[dec_tlu_ctl.scala 283:23]
  wire [1:0] csr_io_mstatus; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mret_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 283:23]
  wire [15:0] csr_io_dcsr; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_mtvec; // @[dec_tlu_ctl.scala 283:23]
  wire [5:0] csr_io_mip; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_timer_t0_pulse; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_timer_t1_pulse; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_timer_int_sync; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_soft_int_sync; // @[dec_tlu_ctl.scala 283:23]
  wire [5:0] csr_io_mie_ns; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_wr_clk; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 283:23]
  wire [1:0] csr_io_lsu_fir_error; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_npc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_tlu_flush_path_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_npc_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_reset_delayed; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_mepc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_exc_valid_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mepc_trigger_hit_sel_pc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_single_ecc_error_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_e4e5_int_clk; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_i0_exc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_inst_acc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_inst_acc_second_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_nmi; // @[dec_tlu_ctl.scala 283:23]
  wire [31:0] csr_io_lsu_error_pkt_addr_r; // @[dec_tlu_ctl.scala 283:23]
  wire [4:0] csr_io_exc_cause_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_valid_wb; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_i0_exception_valid_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire [4:0] csr_io_exc_cause_wb; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_nmi_lsu_store_type; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_nmi_lsu_load_type; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_tlu_i0_commit_cmt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ebreak_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ecall_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_illegal_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mdseac_locked_ns; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_nmi_int_detected_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_internal_dbg_halt_mode_f2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ext_int_freeze; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ic_perr_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_iccm_sbecc_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_idle_any_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dbg_tlu_halted; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_debug_halt_req_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_force_halt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int_start; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_trigger_hit_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_debug_halt_req; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_allow_dbg_halt_csr_write; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_internal_dbg_halt_mode_f; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_enter_debug_halt_req; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_request_debug_mode_done; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_request_debug_mode_r; // @[dec_tlu_ctl.scala 283:23]
  wire [30:0] csr_io_dpc; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_update_hit_bit_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_timer_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_take_ext_int; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_br0_error_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_dec_tlu_br0_start_error_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_misa; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mstatus; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtvec; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mip; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mie; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcyclel; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcycleh; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_minstretl; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_minstreth; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mscratch; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mepc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcause; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mscause; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtval; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mrac; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meivt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meipt; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meicurpl; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_meicidpl; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcgc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mfdc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtsel; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtdata1; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mtdata2; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc4; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc5; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc6; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc3h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc4h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc5h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpmc6h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme3; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme4; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme5; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mhpme6; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mcountinhibit; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mpmc; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_micect; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_miccmect; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mdccmect; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mfdht; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_mfdhs; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 283:23]
  wire  csr_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_0; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_1; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_2; // @[dec_tlu_ctl.scala 283:23]
  wire [9:0] csr_io_mtdata1_t_3; // @[dec_tlu_ctl.scala 283:23]
  wire [3:0] csr_io_trigger_enabled; // @[dec_tlu_ctl.scala 283:23]
  wire  int_timers_clock; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_reset; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_free_l2clk; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_wr_clk; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 284:30]
  wire [11:0] int_timers_io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 284:30]
  wire [31:0] int_timers_io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitctl0; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitctl1; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitb0; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitb1; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitcnt0; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_csr_mitcnt1; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_pause_state; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_tlu_pmu_fw_halted; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 284:30]
  wire [31:0] int_timers_io_dec_timer_rddata_d; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_timer_read_d; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_timer_t0_pulse; // @[dec_tlu_ctl.scala 284:30]
  wire  int_timers_io_dec_timer_t1_pulse; // @[dec_tlu_ctl.scala 284:30]
  wire [11:0] csr_read_io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_misa; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mstatus; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtvec; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mip; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mie; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcyclel; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcycleh; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_minstretl; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_minstreth; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mscratch; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mepc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcause; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mscause; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtval; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mrac; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dmst; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meivt; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meipt; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meicurpl; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meicidpl; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcgc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mfdc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtsel; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtdata1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mtdata2; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc3; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc4; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc5; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc6; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc3h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc4h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc5h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpmc6h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme3; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme4; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme5; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mhpme6; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mcountinhibit; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitctl0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitctl1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitb0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitb1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitcnt0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mitcnt1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mpmc; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_meicpct; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_micect; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_miccmect; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mdccmect; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mfdht; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_mfdhs; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_csr_dicago; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_presync; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_postsync; // @[dec_tlu_ctl.scala 1017:28]
  wire  csr_read_io_csr_pkt_legal; // @[dec_tlu_ctl.scala 1017:28]
  reg  dbg_halt_state_f; // @[Reg.scala 27:20]
  wire  _T = ~dbg_halt_state_f; // @[dec_tlu_ctl.scala 281:39]
  reg  mpc_halt_state_f; // @[Reg.scala 27:20]
  wire  _T_1 = _T & mpc_halt_state_f; // @[dec_tlu_ctl.scala 281:57]
  wire [2:0] _T_3 = {io_i_cpu_run_req,io_mpc_debug_halt_req,io_mpc_debug_run_req}; // @[Cat.scala 29:58]
  wire [3:0] _T_6 = {io_nmi_int,io_timer_int,io_soft_int,io_i_cpu_halt_req}; // @[Cat.scala 29:58]
  reg [6:0] _T_8; // @[lib.scala 37:81]
  reg [6:0] syncro_ff; // @[lib.scala 37:58]
  wire  nmi_int_sync = syncro_ff[6]; // @[dec_tlu_ctl.scala 311:75]
  wire  i_cpu_halt_req_sync = syncro_ff[3]; // @[dec_tlu_ctl.scala 314:59]
  wire  i_cpu_run_req_sync = syncro_ff[2]; // @[dec_tlu_ctl.scala 315:59]
  wire  mpc_debug_halt_req_sync_raw = syncro_ff[1]; // @[dec_tlu_ctl.scala 316:51]
  wire  mpc_debug_run_req_sync = syncro_ff[0]; // @[dec_tlu_ctl.scala 317:59]
  wire  dec_csr_wen_r_mod = csr_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 1010:37]
  reg  debug_mode_status; // @[Reg.scala 27:20]
  reg  i_cpu_run_req_d1_raw; // @[Reg.scala 27:20]
  reg  nmi_int_delayed; // @[Reg.scala 27:20]
  wire  _T_76 = ~nmi_int_delayed; // @[dec_tlu_ctl.scala 360:45]
  wire  _T_77 = nmi_int_sync & _T_76; // @[dec_tlu_ctl.scala 360:43]
  wire  mdseac_locked_f = csr_io_mdseac_locked_f; // @[dec_tlu_ctl.scala 965:27]
  wire  _T_72 = ~mdseac_locked_f; // @[dec_tlu_ctl.scala 357:32]
  wire  _T_73 = io_tlu_busbuff_lsu_imprecise_error_load_any | io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 357:96]
  wire  _T_74 = _T_72 & _T_73; // @[dec_tlu_ctl.scala 357:49]
  reg  nmi_int_detected_f; // @[Reg.scala 27:20]
  wire  _T_99 = ~nmi_int_detected_f; // @[dec_tlu_ctl.scala 365:25]
  wire  _T_100 = _T_99 & csr_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 365:45]
  wire  _T_101 = |io_lsu_fir_error; // @[dec_tlu_ctl.scala 365:95]
  wire  nmi_fir_type = _T_100 & _T_101; // @[dec_tlu_ctl.scala 365:76]
  wire  _T_75 = ~nmi_fir_type; // @[dec_tlu_ctl.scala 357:146]
  wire  nmi_lsu_detected = _T_74 & _T_75; // @[dec_tlu_ctl.scala 357:144]
  wire  _T_78 = _T_77 | nmi_lsu_detected; // @[dec_tlu_ctl.scala 360:63]
  wire  take_nmi_r_d1 = int_exc_io_take_nmi_r_d1; // @[dec_tlu_ctl.scala 814:43]
  wire  _T_79 = ~take_nmi_r_d1; // @[dec_tlu_ctl.scala 360:106]
  wire  _T_80 = nmi_int_detected_f & _T_79; // @[dec_tlu_ctl.scala 360:104]
  wire  _T_81 = _T_78 | _T_80; // @[dec_tlu_ctl.scala 360:82]
  wire  nmi_int_detected = _T_81 | nmi_fir_type; // @[dec_tlu_ctl.scala 360:122]
  wire  timer_int_ready = int_exc_io_timer_int_ready; // @[dec_tlu_ctl.scala 784:43]
  wire  _T_576 = nmi_int_detected | timer_int_ready; // @[dec_tlu_ctl.scala 633:71]
  wire  soft_int_ready = int_exc_io_soft_int_ready; // @[dec_tlu_ctl.scala 783:43]
  wire  _T_577 = _T_576 | soft_int_ready; // @[dec_tlu_ctl.scala 633:89]
  reg  int_timer0_int_hold_f; // @[Reg.scala 27:20]
  wire  _T_578 = _T_577 | int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 633:106]
  reg  int_timer1_int_hold_f; // @[Reg.scala 27:20]
  wire  _T_579 = _T_578 | int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 633:130]
  wire  mhwakeup_ready = int_exc_io_mhwakeup_ready; // @[dec_tlu_ctl.scala 780:43]
  wire  _T_580 = io_dec_pic_mhwakeup & mhwakeup_ready; // @[dec_tlu_ctl.scala 633:177]
  wire  _T_581 = _T_579 | _T_580; // @[dec_tlu_ctl.scala 633:154]
  wire  _T_582 = _T_581 & io_o_cpu_halt_status; // @[dec_tlu_ctl.scala 633:196]
  reg  i_cpu_halt_req_d1; // @[Reg.scala 27:20]
  wire  _T_583 = ~i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 633:221]
  wire  _T_584 = _T_582 & _T_583; // @[dec_tlu_ctl.scala 633:219]
  wire  i_cpu_run_req_d1 = i_cpu_run_req_d1_raw | _T_584; // @[dec_tlu_ctl.scala 633:50]
  wire  interrupt_valid_r = int_exc_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 816:43]
  wire  interrupt_valid_r_d1 = int_exc_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 812:43]
  reg  reset_detect; // @[Reg.scala 27:20]
  reg  reset_detected; // @[Reg.scala 27:20]
  wire  reset_delayed = reset_detect ^ reset_detected; // @[dec_tlu_ctl.scala 369:64]
  wire  _T_345 = ~io_dec_pause_state; // @[dec_tlu_ctl.scala 504:28]
  reg  dec_pause_state_f; // @[Reg.scala 27:20]
  wire  _T_346 = _T_345 & dec_pause_state_f; // @[dec_tlu_ctl.scala 504:48]
  wire  ext_int_ready = int_exc_io_ext_int_ready; // @[dec_tlu_ctl.scala 781:43]
  wire  ce_int_ready = int_exc_io_ce_int_ready; // @[dec_tlu_ctl.scala 782:43]
  wire  _T_347 = ext_int_ready | ce_int_ready; // @[dec_tlu_ctl.scala 504:86]
  wire  _T_348 = _T_347 | timer_int_ready; // @[dec_tlu_ctl.scala 504:101]
  wire  _T_349 = _T_348 | soft_int_ready; // @[dec_tlu_ctl.scala 504:119]
  wire  _T_350 = _T_349 | int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 504:136]
  wire  _T_351 = _T_350 | int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 504:160]
  wire  _T_352 = _T_351 | nmi_int_detected; // @[dec_tlu_ctl.scala 504:184]
  wire  _T_353 = _T_352 | csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 504:203]
  wire  _T_354 = ~_T_353; // @[dec_tlu_ctl.scala 504:70]
  wire  _T_355 = _T_346 & _T_354; // @[dec_tlu_ctl.scala 504:68]
  wire  _T_356 = ~interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 504:233]
  wire  _T_357 = _T_355 & _T_356; // @[dec_tlu_ctl.scala 504:231]
  reg  debug_halt_req_f; // @[Reg.scala 27:20]
  wire  _T_358 = ~debug_halt_req_f; // @[dec_tlu_ctl.scala 504:257]
  wire  _T_359 = _T_357 & _T_358; // @[dec_tlu_ctl.scala 504:255]
  reg  pmu_fw_halt_req_f; // @[Reg.scala 27:20]
  wire  _T_360 = ~pmu_fw_halt_req_f; // @[dec_tlu_ctl.scala 504:277]
  wire  _T_361 = _T_359 & _T_360; // @[dec_tlu_ctl.scala 504:275]
  reg  halt_taken_f; // @[Reg.scala 27:20]
  wire  _T_362 = ~halt_taken_f; // @[dec_tlu_ctl.scala 504:298]
  reg  ifu_ic_error_start_f; // @[Reg.scala 27:20]
  wire  _T_680 = ~csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 709:49]
  wire  _T_681 = ifu_ic_error_start_f & _T_680; // @[dec_tlu_ctl.scala 709:47]
  wire  _T_682 = ~debug_mode_status; // @[dec_tlu_ctl.scala 709:78]
  reg  debug_resume_req_f_raw; // @[Reg.scala 27:20]
  wire  _T_333 = ~io_dbg_halt_req; // @[dec_tlu_ctl.scala 489:56]
  wire  debug_resume_req_f = debug_resume_req_f_raw & _T_333; // @[dec_tlu_ctl.scala 489:54]
  wire [15:0] dcsr = csr_io_dcsr; // @[dec_tlu_ctl.scala 1013:37]
  wire  _T_255 = debug_resume_req_f & dcsr[2]; // @[dec_tlu_ctl.scala 459:60]
  reg  dcsr_single_step_running_f; // @[Reg.scala 27:20]
  reg  dcsr_single_step_done_f; // @[Reg.scala 27:20]
  wire  _T_256 = ~dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 459:111]
  wire  _T_257 = dcsr_single_step_running_f & _T_256; // @[dec_tlu_ctl.scala 459:109]
  wire  dcsr_single_step_running = _T_255 | _T_257; // @[dec_tlu_ctl.scala 459:79]
  wire  _T_683 = _T_682 | dcsr_single_step_running; // @[dec_tlu_ctl.scala 709:104]
  wire  _T_684 = _T_681 & _T_683; // @[dec_tlu_ctl.scala 709:75]
  reg  internal_pmu_fw_halt_mode_f; // @[Reg.scala 27:20]
  wire  _T_685 = ~internal_pmu_fw_halt_mode_f; // @[dec_tlu_ctl.scala 709:134]
  wire  ic_perr_r = _T_684 & _T_685; // @[dec_tlu_ctl.scala 709:132]
  reg  ifu_iccm_rd_ecc_single_err_f; // @[Reg.scala 27:20]
  wire  _T_688 = ifu_iccm_rd_ecc_single_err_f & _T_680; // @[dec_tlu_ctl.scala 710:55]
  wire  _T_691 = _T_688 & _T_683; // @[dec_tlu_ctl.scala 710:83]
  wire  iccm_sbecc_r = _T_691 & _T_685; // @[dec_tlu_ctl.scala 710:140]
  wire  _T_23 = io_tlu_mem_ifu_ic_error_start ^ ifu_ic_error_start_f; // @[lib.scala 470:21]
  wire  _T_24 = |_T_23; // @[lib.scala 470:29]
  wire  _T_26 = io_tlu_mem_ifu_iccm_rd_ecc_single_err ^ ifu_iccm_rd_ecc_single_err_f; // @[lib.scala 470:21]
  wire  _T_27 = |_T_26; // @[lib.scala 470:29]
  reg  iccm_repair_state_d1; // @[Reg.scala 27:20]
  wire  _T_623 = ~io_tlu_exu_dec_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 666:72]
  wire  _T_624 = iccm_repair_state_d1 & _T_623; // @[dec_tlu_ctl.scala 666:70]
  wire  iccm_repair_state_ns = iccm_sbecc_r | _T_624; // @[dec_tlu_ctl.scala 666:46]
  wire  _T_29 = iccm_repair_state_ns ^ iccm_repair_state_d1; // @[lib.scala 448:21]
  wire  _T_30 = |_T_29; // @[lib.scala 448:29]
  reg  dbg_halt_req_held; // @[Reg.scala 27:20]
  wire  _T_184 = io_dbg_halt_req | dbg_halt_req_held; // @[dec_tlu_ctl.scala 418:48]
  wire  dbg_halt_req_final = _T_184 & _T_680; // @[dec_tlu_ctl.scala 418:69]
  wire  mpc_debug_halt_req_sync = mpc_debug_halt_req_sync_raw & _T_680; // @[dec_tlu_ctl.scala 376:67]
  wire  _T_187 = dbg_halt_req_final | mpc_debug_halt_req_sync; // @[dec_tlu_ctl.scala 421:50]
  wire  _T_188 = ~io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 421:95]
  wire  _T_189 = reset_delayed & _T_188; // @[dec_tlu_ctl.scala 421:93]
  wire  _T_190 = _T_187 | _T_189; // @[dec_tlu_ctl.scala 421:76]
  wire  _T_192 = _T_190 & _T_682; // @[dec_tlu_ctl.scala 421:119]
  wire  debug_halt_req = _T_192 & _T_680; // @[dec_tlu_ctl.scala 421:147]
  wire  _T_231 = _T_682 & debug_halt_req; // @[dec_tlu_ctl.scala 441:63]
  wire  _T_232 = _T_231 | dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 441:81]
  reg  trigger_hit_dmode_r_d1; // @[Reg.scala 27:20]
  wire  _T_233 = _T_232 | trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 441:107]
  reg  ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 718:64]
  wire  enter_debug_halt_req = _T_233 | ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 441:132]
  wire  force_halt = csr_io_force_halt; // @[dec_tlu_ctl.scala 1007:37]
  reg  lsu_idle_any_f; // @[Reg.scala 27:20]
  wire  _T_220 = io_lsu_idle_any & lsu_idle_any_f; // @[dec_tlu_ctl.scala 435:53]
  wire  _T_221 = _T_220 & io_tlu_mem_ifu_miss_state_idle; // @[dec_tlu_ctl.scala 435:70]
  reg  ifu_miss_state_idle_f; // @[Reg.scala 27:20]
  wire  _T_222 = _T_221 & ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 435:103]
  wire  _T_223 = ~debug_halt_req; // @[dec_tlu_ctl.scala 435:129]
  wire  _T_224 = _T_222 & _T_223; // @[dec_tlu_ctl.scala 435:127]
  reg  debug_halt_req_d1; // @[Reg.scala 27:20]
  wire  _T_225 = ~debug_halt_req_d1; // @[dec_tlu_ctl.scala 435:147]
  wire  _T_226 = _T_224 & _T_225; // @[dec_tlu_ctl.scala 435:145]
  wire  _T_227 = ~io_dec_div_active; // @[dec_tlu_ctl.scala 435:168]
  wire  _T_228 = _T_226 & _T_227; // @[dec_tlu_ctl.scala 435:166]
  wire  core_empty = force_halt | _T_228; // @[dec_tlu_ctl.scala 435:34]
  wire  _T_241 = debug_halt_req_f & core_empty; // @[dec_tlu_ctl.scala 452:48]
  reg  dec_tlu_flush_noredir_r_d1; // @[Reg.scala 27:20]
  reg  dec_tlu_flush_pause_r_d1; // @[Reg.scala 27:20]
  wire  _T_210 = ~dec_tlu_flush_pause_r_d1; // @[dec_tlu_ctl.scala 431:56]
  wire  _T_211 = dec_tlu_flush_noredir_r_d1 & _T_210; // @[dec_tlu_ctl.scala 431:54]
  wire  _T_212 = ~csr_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 431:84]
  wire  _T_213 = _T_211 & _T_212; // @[dec_tlu_ctl.scala 431:82]
  reg  dbg_tlu_halted_f; // @[Reg.scala 27:20]
  wire  _T_214 = ~dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 431:133]
  wire  _T_215 = halt_taken_f & _T_214; // @[dec_tlu_ctl.scala 431:131]
  reg  pmu_fw_tlu_halted_f; // @[Reg.scala 27:20]
  wire  _T_216 = ~pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 431:153]
  wire  _T_217 = _T_215 & _T_216; // @[dec_tlu_ctl.scala 431:151]
  wire  _T_219 = _T_217 & _T_356; // @[dec_tlu_ctl.scala 431:174]
  wire  halt_taken = _T_213 | _T_219; // @[dec_tlu_ctl.scala 431:115]
  wire  _T_242 = _T_241 & halt_taken; // @[dec_tlu_ctl.scala 452:61]
  wire  _T_243 = ~debug_resume_req_f; // @[dec_tlu_ctl.scala 452:97]
  wire  _T_244 = dbg_tlu_halted_f & _T_243; // @[dec_tlu_ctl.scala 452:95]
  wire  dbg_tlu_halted = _T_242 | _T_244; // @[dec_tlu_ctl.scala 452:75]
  wire  _T_245 = ~dbg_tlu_halted; // @[dec_tlu_ctl.scala 454:73]
  wire  _T_246 = debug_halt_req_f & _T_245; // @[dec_tlu_ctl.scala 454:71]
  wire  debug_halt_req_ns = enter_debug_halt_req | _T_246; // @[dec_tlu_ctl.scala 454:51]
  wire  _T_235 = ~dcsr[2]; // @[dec_tlu_ctl.scala 444:106]
  wire  _T_236 = debug_resume_req_f & _T_235; // @[dec_tlu_ctl.scala 444:104]
  wire  _T_237 = ~_T_236; // @[dec_tlu_ctl.scala 444:83]
  wire  _T_238 = debug_mode_status & _T_237; // @[dec_tlu_ctl.scala 444:81]
  wire  internal_dbg_halt_mode = debug_halt_req_ns | _T_238; // @[dec_tlu_ctl.scala 444:53]
  wire  _T_37 = internal_dbg_halt_mode ^ debug_mode_status; // @[lib.scala 448:21]
  wire  _T_38 = |_T_37; // @[lib.scala 448:29]
  reg  lsu_pmu_load_external_r; // @[Reg.scala 27:20]
  wire  _T_40 = io_lsu_tlu_lsu_pmu_load_external_m ^ lsu_pmu_load_external_r; // @[lib.scala 470:21]
  wire  _T_41 = |_T_40; // @[lib.scala 470:29]
  reg  lsu_pmu_store_external_r; // @[Reg.scala 27:20]
  wire  _T_43 = io_lsu_tlu_lsu_pmu_store_external_m ^ lsu_pmu_store_external_r; // @[lib.scala 470:21]
  wire  _T_44 = |_T_43; // @[lib.scala 470:29]
  wire  tlu_flush_lower_r = int_exc_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 808:43]
  reg  tlu_flush_lower_r_d1; // @[Reg.scala 27:20]
  wire  _T_46 = tlu_flush_lower_r ^ tlu_flush_lower_r_d1; // @[lib.scala 448:21]
  wire  _T_47 = |_T_46; // @[lib.scala 448:29]
  wire  _T_611 = ~tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 663:49]
  wire  _T_612 = io_dec_tlu_i0_valid_r & _T_611; // @[dec_tlu_ctl.scala 663:47]
  wire  _T_613 = io_tlu_exu_exu_i0_br_error_r | io_tlu_exu_exu_i0_br_start_error_r; // @[dec_tlu_ctl.scala 663:103]
  wire  _T_614 = _T_612 & _T_613; // @[dec_tlu_ctl.scala 663:71]
  wire  _T_615 = ic_perr_r | iccm_sbecc_r; // @[dec_tlu_ctl.scala 663:156]
  wire  _T_617 = _T_615 & _T_680; // @[dec_tlu_ctl.scala 663:172]
  wire  _T_618 = _T_614 | _T_617; // @[dec_tlu_ctl.scala 663:142]
  wire  _T_431 = io_dec_tlu_flush_lower_wb | io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 545:64]
  wire [3:0] _T_433 = _T_431 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_434 = ~_T_433; // @[dec_tlu_ctl.scala 545:29]
  wire [3:0] _T_426 = io_dec_tlu_i0_valid_r ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_428 = _T_426 & io_dec_tlu_packet_r_i0trigger; // @[dec_tlu_ctl.scala 543:58]
  wire [9:0] mtdata1_t_3 = csr_io_mtdata1_t_3; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [9:0] mtdata1_t_2 = csr_io_mtdata1_t_2; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [9:0] mtdata1_t_1 = csr_io_mtdata1_t_1; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [9:0] mtdata1_t_0 = csr_io_mtdata1_t_0; // @[dec_tlu_ctl.scala 162:67 dec_tlu_ctl.scala 1016:39]
  wire [3:0] trigger_execute = {mtdata1_t_3[2],mtdata1_t_2[2],mtdata1_t_1[2],mtdata1_t_0[2]}; // @[Cat.scala 29:58]
  wire [3:0] trigger_data = {mtdata1_t_3[7],mtdata1_t_2[7],mtdata1_t_1[7],mtdata1_t_0[7]}; // @[Cat.scala 29:58]
  wire [3:0] _T_413 = trigger_execute & trigger_data; // @[dec_tlu_ctl.scala 535:62]
  wire  inst_acc_r_raw = io_dec_tlu_packet_r_icaf & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 712:54]
  wire [3:0] _T_415 = inst_acc_r_raw ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_416 = _T_413 & _T_415; // @[dec_tlu_ctl.scala 535:77]
  wire [3:0] _T_419 = _T_613 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_420 = _T_416 | _T_419; // @[dec_tlu_ctl.scala 535:103]
  wire [3:0] i0_iside_trigger_has_pri_r = ~_T_420; // @[dec_tlu_ctl.scala 535:43]
  wire [3:0] _T_429 = _T_428 & i0_iside_trigger_has_pri_r; // @[dec_tlu_ctl.scala 543:95]
  wire [3:0] trigger_store = {mtdata1_t_3[1],mtdata1_t_2[1],mtdata1_t_1[1],mtdata1_t_0[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_421 = trigger_store & trigger_data; // @[dec_tlu_ctl.scala 538:56]
  wire [3:0] _T_423 = io_lsu_error_pkt_r_valid ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_424 = _T_421 & _T_423; // @[dec_tlu_ctl.scala 538:71]
  wire [3:0] i0_lsu_trigger_has_pri_r = ~_T_424; // @[dec_tlu_ctl.scala 538:40]
  wire [3:0] _T_430 = _T_429 & i0_lsu_trigger_has_pri_r; // @[dec_tlu_ctl.scala 543:124]
  wire [1:0] mstatus = csr_io_mstatus; // @[dec_tlu_ctl.scala 1012:37]
  wire  _T_393 = mtdata1_t_3[6] | mstatus[0]; // @[dec_tlu_ctl.scala 529:70]
  wire  _T_395 = _T_393 & mtdata1_t_3[3]; // @[dec_tlu_ctl.scala 529:94]
  wire  _T_398 = mtdata1_t_2[6] | mstatus[0]; // @[dec_tlu_ctl.scala 530:47]
  wire  _T_400 = _T_398 & mtdata1_t_2[3]; // @[dec_tlu_ctl.scala 530:71]
  wire [1:0] _T_412 = {_T_395,_T_400}; // @[Cat.scala 29:58]
  wire  _T_403 = mtdata1_t_1[6] | mstatus[0]; // @[dec_tlu_ctl.scala 531:47]
  wire  _T_405 = _T_403 & mtdata1_t_1[3]; // @[dec_tlu_ctl.scala 531:71]
  wire  _T_408 = mtdata1_t_0[6] | mstatus[0]; // @[dec_tlu_ctl.scala 532:47]
  wire  _T_410 = _T_408 & mtdata1_t_0[3]; // @[dec_tlu_ctl.scala 532:71]
  wire [1:0] _T_411 = {_T_405,_T_410}; // @[Cat.scala 29:58]
  wire [3:0] trigger_enabled = {_T_395,_T_400,_T_405,_T_410}; // @[Cat.scala 29:58]
  wire [3:0] i0trigger_qual_r = _T_430 & trigger_enabled; // @[dec_tlu_ctl.scala 543:151]
  wire [3:0] i0_trigger_r = _T_434 & i0trigger_qual_r; // @[dec_tlu_ctl.scala 545:90]
  wire  _T_437 = ~mtdata1_t_2[5]; // @[dec_tlu_ctl.scala 548:65]
  wire  _T_439 = _T_437 | i0_trigger_r[2]; // @[dec_tlu_ctl.scala 548:94]
  wire  _T_440 = i0_trigger_r[3] & _T_439; // @[dec_tlu_ctl.scala 548:62]
  wire  _T_445 = _T_437 | i0_trigger_r[3]; // @[dec_tlu_ctl.scala 549:65]
  wire  _T_446 = i0_trigger_r[2] & _T_445; // @[dec_tlu_ctl.scala 549:33]
  wire  _T_449 = ~mtdata1_t_0[5]; // @[dec_tlu_ctl.scala 550:36]
  wire  _T_451 = _T_449 | i0_trigger_r[0]; // @[dec_tlu_ctl.scala 550:65]
  wire  _T_452 = i0_trigger_r[1] & _T_451; // @[dec_tlu_ctl.scala 550:33]
  wire  _T_457 = _T_449 | i0_trigger_r[1]; // @[dec_tlu_ctl.scala 551:65]
  wire  _T_458 = i0_trigger_r[0] & _T_457; // @[dec_tlu_ctl.scala 551:33]
  wire [3:0] i0_trigger_chain_masked_r = {_T_440,_T_446,_T_452,_T_458}; // @[Cat.scala 29:58]
  wire  i0_trigger_hit_raw_r = |i0_trigger_chain_masked_r; // @[dec_tlu_ctl.scala 555:62]
  wire  _T_619 = ~i0_trigger_hit_raw_r; // @[dec_tlu_ctl.scala 663:205]
  wire  _T_620 = _T_618 & _T_619; // @[dec_tlu_ctl.scala 663:202]
  wire  _T_592 = io_dec_tlu_i0_valid_r & _T_619; // @[dec_tlu_ctl.scala 651:52]
  wire  _T_593 = ~io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 651:75]
  wire  _T_594 = _T_593 & io_lsu_error_pkt_r_bits_single_ecc_error; // @[dec_tlu_ctl.scala 651:110]
  wire  lsu_i0_rfnpc_r = _T_592 & _T_594; // @[dec_tlu_ctl.scala 651:72]
  wire  _T_621 = ~lsu_i0_rfnpc_r; // @[dec_tlu_ctl.scala 663:226]
  wire  rfpc_i0_r = _T_620 & _T_621; // @[dec_tlu_ctl.scala 663:223]
  wire  _T_586 = ~io_dec_tlu_flush_lower_wb; // @[dec_tlu_ctl.scala 642:62]
  wire  lsu_exc_valid_r_raw = io_lsu_error_pkt_r_valid & _T_586; // @[dec_tlu_ctl.scala 642:60]
  wire  _T_587 = io_lsu_error_pkt_r_valid & lsu_exc_valid_r_raw; // @[dec_tlu_ctl.scala 644:45]
  wire  _T_589 = _T_587 & _T_619; // @[dec_tlu_ctl.scala 644:67]
  wire  _T_590 = ~rfpc_i0_r; // @[dec_tlu_ctl.scala 644:89]
  wire  lsu_exc_valid_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 644:87]
  wire  _T_606 = rfpc_i0_r | lsu_exc_valid_r; // @[dec_tlu_ctl.scala 657:43]
  wire  _T_696 = inst_acc_r_raw & _T_590; // @[dec_tlu_ctl.scala 713:38]
  wire  inst_acc_r = _T_696 & _T_619; // @[dec_tlu_ctl.scala 713:51]
  wire  _T_607 = _T_606 | inst_acc_r; // @[dec_tlu_ctl.scala 657:58]
  wire  _T_663 = ~io_dec_tlu_packet_r_legal; // @[dec_tlu_ctl.scala 705:23]
  wire  _T_664 = _T_663 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 705:52]
  wire  _T_666 = _T_664 & _T_619; // @[dec_tlu_ctl.scala 705:76]
  wire  illegal_r = _T_666 & _T_590; // @[dec_tlu_ctl.scala 705:96]
  wire  _T_608 = illegal_r & io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 657:84]
  wire  _T_609 = _T_607 | _T_608; // @[dec_tlu_ctl.scala 657:71]
  wire  tlu_i0_kill_writeb_r = _T_609 | i0_trigger_hit_raw_r; // @[dec_tlu_ctl.scala 657:109]
  reg  _T_52; // @[Reg.scala 27:20]
  wire  _T_50 = tlu_i0_kill_writeb_r ^ _T_52; // @[lib.scala 448:21]
  wire  _T_51 = |_T_50; // @[lib.scala 448:29]
  reg  internal_dbg_halt_mode_f2; // @[Reg.scala 27:20]
  wire  _T_53 = debug_mode_status ^ internal_dbg_halt_mode_f2; // @[lib.scala 448:21]
  wire  _T_54 = |_T_53; // @[lib.scala 448:29]
  reg  _T_59; // @[Reg.scala 27:20]
  wire  _T_57 = force_halt ^ _T_59; // @[lib.scala 448:21]
  wire  _T_58 = |_T_57; // @[lib.scala 448:29]
  wire  _T_60 = nmi_int_sync ^ nmi_int_delayed; // @[lib.scala 470:21]
  wire  _T_61 = |_T_60; // @[lib.scala 470:29]
  wire  _T_63 = nmi_int_detected ^ nmi_int_detected_f; // @[lib.scala 448:21]
  wire  _T_64 = |_T_63; // @[lib.scala 448:29]
  wire  _T_83 = nmi_lsu_detected & io_tlu_busbuff_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 362:49]
  wire  _T_86 = ~_T_80; // @[dec_tlu_ctl.scala 362:98]
  wire  _T_87 = _T_83 & _T_86; // @[dec_tlu_ctl.scala 362:95]
  reg  nmi_lsu_load_type_f; // @[Reg.scala 27:20]
  wire  _T_89 = nmi_lsu_load_type_f & _T_79; // @[dec_tlu_ctl.scala 362:162]
  wire  nmi_lsu_load_type = _T_87 | _T_89; // @[dec_tlu_ctl.scala 362:138]
  wire  _T_66 = nmi_lsu_load_type ^ nmi_lsu_load_type_f; // @[lib.scala 448:21]
  wire  _T_67 = |_T_66; // @[lib.scala 448:29]
  wire  _T_91 = nmi_lsu_detected & io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 363:49]
  wire  _T_95 = _T_91 & _T_86; // @[dec_tlu_ctl.scala 363:96]
  reg  nmi_lsu_store_type_f; // @[Reg.scala 27:20]
  wire  _T_97 = nmi_lsu_store_type_f & _T_79; // @[dec_tlu_ctl.scala 363:162]
  wire  nmi_lsu_store_type = _T_95 | _T_97; // @[dec_tlu_ctl.scala 363:138]
  wire  _T_69 = nmi_lsu_store_type ^ nmi_lsu_store_type_f; // @[lib.scala 448:21]
  wire  _T_70 = |_T_69; // @[lib.scala 448:29]
  wire  _T_103 = 1'h1 ^ reset_detect; // @[lib.scala 448:21]
  wire  _T_104 = |_T_103; // @[lib.scala 448:29]
  wire  _T_107 = |reset_delayed; // @[lib.scala 448:29]
  reg  mpc_debug_halt_req_sync_f; // @[Reg.scala 27:20]
  wire  _T_111 = mpc_debug_halt_req_sync ^ mpc_debug_halt_req_sync_f; // @[lib.scala 470:21]
  wire  _T_112 = |_T_111; // @[lib.scala 470:29]
  reg  mpc_debug_run_req_sync_f; // @[Reg.scala 27:20]
  wire  _T_114 = mpc_debug_run_req_sync ^ mpc_debug_run_req_sync_f; // @[lib.scala 470:21]
  wire  _T_115 = |_T_114; // @[lib.scala 470:29]
  wire  _T_144 = ~mpc_debug_halt_req_sync_f; // @[dec_tlu_ctl.scala 390:71]
  wire  mpc_debug_halt_req_sync_pulse = mpc_debug_halt_req_sync & _T_144; // @[dec_tlu_ctl.scala 390:69]
  wire  _T_146 = mpc_halt_state_f | mpc_debug_halt_req_sync_pulse; // @[dec_tlu_ctl.scala 393:48]
  wire  _T_149 = _T_146 | _T_189; // @[dec_tlu_ctl.scala 393:80]
  wire  _T_150 = ~mpc_debug_run_req_sync; // @[dec_tlu_ctl.scala 393:125]
  wire  mpc_halt_state_ns = _T_149 & _T_150; // @[dec_tlu_ctl.scala 393:123]
  wire  _T_118 = mpc_halt_state_ns ^ mpc_halt_state_f; // @[lib.scala 448:21]
  wire  _T_119 = |_T_118; // @[lib.scala 448:29]
  reg  mpc_run_state_f; // @[Reg.scala 27:20]
  wire  _T_145 = ~mpc_debug_run_req_sync_f; // @[dec_tlu_ctl.scala 391:70]
  wire  mpc_debug_run_req_sync_pulse = mpc_debug_run_req_sync & _T_145; // @[dec_tlu_ctl.scala 391:68]
  reg  mpc_debug_run_ack_f; // @[Reg.scala 27:20]
  wire  _T_152 = ~mpc_debug_run_ack_f; // @[dec_tlu_ctl.scala 394:80]
  wire  _T_153 = mpc_debug_run_req_sync_pulse & _T_152; // @[dec_tlu_ctl.scala 394:78]
  wire  _T_154 = mpc_run_state_f | _T_153; // @[dec_tlu_ctl.scala 394:46]
  wire  _T_155 = ~dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 394:133]
  wire  _T_156 = debug_mode_status & _T_155; // @[dec_tlu_ctl.scala 394:131]
  wire  mpc_run_state_ns = _T_154 & _T_156; // @[dec_tlu_ctl.scala 394:103]
  wire  _T_121 = mpc_run_state_ns ^ mpc_run_state_f; // @[lib.scala 448:21]
  wire  _T_122 = |_T_121; // @[lib.scala 448:29]
  wire  debug_brkpt_valid = ebreak_to_debug_mode_r_d1 | trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 404:59]
  reg  debug_brkpt_status_f; // @[Reg.scala 27:20]
  wire  _T_170 = debug_brkpt_valid | debug_brkpt_status_f; // @[dec_tlu_ctl.scala 405:53]
  wire  _T_172 = internal_dbg_halt_mode & _T_155; // @[dec_tlu_ctl.scala 405:103]
  wire  debug_brkpt_status_ns = _T_170 & _T_172; // @[dec_tlu_ctl.scala 405:77]
  wire  _T_124 = debug_brkpt_status_ns ^ debug_brkpt_status_f; // @[lib.scala 448:21]
  wire  _T_125 = |_T_124; // @[lib.scala 448:29]
  wire  _T_174 = mpc_halt_state_f & debug_mode_status; // @[dec_tlu_ctl.scala 408:51]
  wire  _T_175 = _T_174 & mpc_debug_halt_req_sync; // @[dec_tlu_ctl.scala 408:78]
  wire  mpc_debug_halt_ack_ns = _T_175 & core_empty; // @[dec_tlu_ctl.scala 408:104]
  reg  mpc_debug_halt_ack_f; // @[Reg.scala 27:20]
  wire  _T_127 = mpc_debug_halt_ack_ns ^ mpc_debug_halt_ack_f; // @[lib.scala 448:21]
  wire  _T_128 = |_T_127; // @[lib.scala 448:29]
  wire  _T_158 = dbg_halt_req_final | dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 397:70]
  wire  _T_159 = _T_158 | trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 397:96]
  wire  _T_160 = _T_159 | ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 397:121]
  wire  _T_161 = dbg_halt_state_f | _T_160; // @[dec_tlu_ctl.scala 397:48]
  wire  _T_162 = ~io_dbg_resume_req; // @[dec_tlu_ctl.scala 397:153]
  wire  dbg_halt_state_ns = _T_161 & _T_162; // @[dec_tlu_ctl.scala 397:151]
  wire  _T_177 = ~dbg_halt_state_ns; // @[dec_tlu_ctl.scala 409:59]
  wire  _T_178 = mpc_debug_run_req_sync & _T_177; // @[dec_tlu_ctl.scala 409:57]
  wire  _T_179 = ~mpc_debug_halt_req_sync; // @[dec_tlu_ctl.scala 409:80]
  wire  _T_180 = _T_178 & _T_179; // @[dec_tlu_ctl.scala 409:78]
  wire  _T_181 = mpc_debug_run_ack_f & mpc_debug_run_req_sync; // @[dec_tlu_ctl.scala 409:129]
  wire  mpc_debug_run_ack_ns = _T_180 | _T_181; // @[dec_tlu_ctl.scala 409:106]
  wire  _T_130 = mpc_debug_run_ack_ns ^ mpc_debug_run_ack_f; // @[lib.scala 448:21]
  wire  _T_131 = |_T_130; // @[lib.scala 448:29]
  wire  _T_134 = dbg_halt_state_ns ^ dbg_halt_state_f; // @[lib.scala 448:21]
  wire  _T_135 = |_T_134; // @[lib.scala 448:29]
  reg  dbg_run_state_f; // @[Reg.scala 27:20]
  wire  _T_164 = dbg_run_state_f | io_dbg_resume_req; // @[dec_tlu_ctl.scala 398:46]
  wire  dbg_run_state_ns = _T_164 & _T_156; // @[dec_tlu_ctl.scala 398:67]
  wire  _T_137 = dbg_run_state_ns ^ dbg_run_state_f; // @[lib.scala 448:21]
  wire  _T_138 = |_T_137; // @[lib.scala 448:29]
  reg  _T_143; // @[Reg.scala 27:20]
  wire  _T_141 = _T_1 ^ _T_143; // @[lib.scala 448:21]
  wire  _T_142 = |_T_141; // @[lib.scala 448:29]
  wire  dbg_halt_req_held_ns = _T_184 & csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 417:74]
  wire  _T_196 = mpc_run_state_ns & _T_177; // @[dec_tlu_ctl.scala 423:73]
  wire  _T_197 = ~mpc_halt_state_ns; // @[dec_tlu_ctl.scala 423:117]
  wire  _T_198 = dbg_run_state_ns & _T_197; // @[dec_tlu_ctl.scala 423:115]
  wire  _T_199 = _T_196 | _T_198; // @[dec_tlu_ctl.scala 423:95]
  wire  debug_resume_req = _T_243 & _T_199; // @[dec_tlu_ctl.scala 423:52]
  wire  _T_200 = debug_halt_req_f | pmu_fw_halt_req_f; // @[dec_tlu_ctl.scala 428:43]
  wire  synchronous_flush_r = int_exc_io_synchronous_flush_r; // @[dec_tlu_ctl.scala 807:43]
  wire  _T_201 = ~synchronous_flush_r; // @[dec_tlu_ctl.scala 428:66]
  wire  _T_202 = _T_200 & _T_201; // @[dec_tlu_ctl.scala 428:64]
  wire  _T_669 = io_dec_tlu_packet_r_pmu_i0_itype == 4'hc; // @[dec_tlu_ctl.scala 706:57]
  wire  _T_670 = _T_669 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 706:70]
  wire  _T_672 = _T_670 & _T_619; // @[dec_tlu_ctl.scala 706:94]
  wire  mret_r = _T_672 & _T_590; // @[dec_tlu_ctl.scala 706:114]
  wire  _T_203 = ~mret_r; // @[dec_tlu_ctl.scala 428:89]
  wire  _T_204 = _T_202 & _T_203; // @[dec_tlu_ctl.scala 428:87]
  wire  _T_206 = _T_204 & _T_362; // @[dec_tlu_ctl.scala 428:97]
  wire  _T_207 = ~dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 428:115]
  wire  _T_208 = _T_206 & _T_207; // @[dec_tlu_ctl.scala 428:113]
  wire  take_reset = int_exc_io_take_reset; // @[dec_tlu_ctl.scala 805:43]
  wire  _T_209 = ~take_reset; // @[dec_tlu_ctl.scala 428:145]
  wire  take_halt = _T_208 & _T_209; // @[dec_tlu_ctl.scala 428:143]
  wire  _T_248 = debug_resume_req_f & dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 455:49]
  wire  resume_ack_ns = _T_248 & dbg_run_state_ns; // @[dec_tlu_ctl.scala 455:68]
  wire  _T_249 = ~io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 457:61]
  wire  _T_250 = io_dec_tlu_i0_valid_r & _T_249; // @[dec_tlu_ctl.scala 457:59]
  wire  _T_252 = _T_250 & dcsr[2]; // @[dec_tlu_ctl.scala 457:84]
  wire  dcsr_single_step_done = _T_252 & _T_590; // @[dec_tlu_ctl.scala 457:102]
  wire  _T_463 = mtdata1_t_3[6] & mtdata1_t_3[9]; // @[dec_tlu_ctl.scala 561:69]
  wire  _T_466 = mtdata1_t_2[6] & mtdata1_t_2[9]; // @[dec_tlu_ctl.scala 562:46]
  wire  _T_469 = _T_466 & _T_437; // @[dec_tlu_ctl.scala 562:76]
  wire  _T_472 = mtdata1_t_1[6] & mtdata1_t_1[9]; // @[dec_tlu_ctl.scala 563:46]
  wire  _T_475 = mtdata1_t_0[6] & mtdata1_t_0[9]; // @[dec_tlu_ctl.scala 564:46]
  wire  _T_478 = _T_475 & _T_449; // @[dec_tlu_ctl.scala 564:76]
  wire [3:0] trigger_action = {_T_463,_T_469,_T_472,_T_478}; // @[Cat.scala 29:58]
  wire [3:0] _T_493 = i0_trigger_chain_masked_r & trigger_action; // @[dec_tlu_ctl.scala 570:62]
  wire  i0_trigger_action_r = |_T_493; // @[dec_tlu_ctl.scala 570:80]
  wire  trigger_hit_dmode_r = i0_trigger_hit_raw_r & i0_trigger_action_r; // @[dec_tlu_ctl.scala 572:50]
  wire  _T_699 = io_dec_tlu_packet_r_pmu_i0_itype == 4'h8; // @[dec_tlu_ctl.scala 716:69]
  wire  _T_700 = _T_699 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 716:82]
  wire  _T_702 = _T_700 & _T_619; // @[dec_tlu_ctl.scala 716:106]
  wire  _T_704 = _T_702 & dcsr[15]; // @[dec_tlu_ctl.scala 716:126]
  wire  ebreak_to_debug_mode_r = _T_704 & _T_590; // @[dec_tlu_ctl.scala 716:147]
  wire  _T_258 = trigger_hit_dmode_r | ebreak_to_debug_mode_r; // @[dec_tlu_ctl.scala 464:57]
  reg  request_debug_mode_r_d1; // @[Reg.scala 27:20]
  wire  _T_260 = request_debug_mode_r_d1 & _T_586; // @[dec_tlu_ctl.scala 464:110]
  wire  request_debug_mode_r = _T_258 | _T_260; // @[dec_tlu_ctl.scala 464:83]
  reg  request_debug_mode_done_f; // @[Reg.scala 27:20]
  wire  _T_261 = request_debug_mode_r_d1 | request_debug_mode_done_f; // @[dec_tlu_ctl.scala 466:64]
  wire  request_debug_mode_done = _T_261 & _T_214; // @[dec_tlu_ctl.scala 466:93]
  wire  _T_264 = io_tlu_ifc_dec_tlu_flush_noredir_wb ^ dec_tlu_flush_noredir_r_d1; // @[lib.scala 470:21]
  wire  _T_265 = |_T_264; // @[lib.scala 470:29]
  wire  _T_268 = halt_taken ^ halt_taken_f; // @[lib.scala 448:21]
  wire  _T_269 = |_T_268; // @[lib.scala 448:29]
  wire  _T_272 = io_lsu_idle_any ^ lsu_idle_any_f; // @[lib.scala 448:21]
  wire  _T_273 = |_T_272; // @[lib.scala 448:29]
  wire  _T_276 = io_tlu_mem_ifu_miss_state_idle ^ ifu_miss_state_idle_f; // @[lib.scala 470:21]
  wire  _T_277 = |_T_276; // @[lib.scala 470:29]
  wire  _T_280 = dbg_tlu_halted ^ dbg_tlu_halted_f; // @[lib.scala 448:21]
  wire  _T_281 = |_T_280; // @[lib.scala 448:29]
  reg  _T_286; // @[Reg.scala 27:20]
  wire  _T_284 = resume_ack_ns ^ _T_286; // @[lib.scala 448:21]
  wire  _T_285 = |_T_284; // @[lib.scala 448:29]
  wire  _T_288 = debug_halt_req_ns ^ debug_halt_req_f; // @[lib.scala 448:21]
  wire  _T_289 = |_T_288; // @[lib.scala 448:29]
  wire  _T_292 = debug_resume_req ^ debug_resume_req_f_raw; // @[lib.scala 448:21]
  wire  _T_293 = |_T_292; // @[lib.scala 448:29]
  wire  _T_296 = trigger_hit_dmode_r ^ trigger_hit_dmode_r_d1; // @[lib.scala 448:21]
  wire  _T_297 = |_T_296; // @[lib.scala 448:29]
  wire  _T_300 = dcsr_single_step_done ^ dcsr_single_step_done_f; // @[lib.scala 448:21]
  wire  _T_301 = |_T_300; // @[lib.scala 448:29]
  wire  _T_304 = debug_halt_req ^ debug_halt_req_d1; // @[lib.scala 448:21]
  wire  _T_305 = |_T_304; // @[lib.scala 448:29]
  reg  dec_tlu_wr_pause_r_d1; // @[Reg.scala 27:20]
  wire  _T_307 = io_dec_tlu_wr_pause_r ^ dec_tlu_wr_pause_r_d1; // @[lib.scala 448:21]
  wire  _T_308 = |_T_307; // @[lib.scala 448:29]
  wire  _T_310 = io_dec_pause_state ^ dec_pause_state_f; // @[lib.scala 448:21]
  wire  _T_311 = |_T_310; // @[lib.scala 448:29]
  wire  _T_314 = request_debug_mode_r ^ request_debug_mode_r_d1; // @[lib.scala 448:21]
  wire  _T_315 = |_T_314; // @[lib.scala 448:29]
  wire  _T_318 = request_debug_mode_done ^ request_debug_mode_done_f; // @[lib.scala 448:21]
  wire  _T_319 = |_T_318; // @[lib.scala 448:29]
  wire  _T_322 = dcsr_single_step_running ^ dcsr_single_step_running_f; // @[lib.scala 448:21]
  wire  _T_323 = |_T_322; // @[lib.scala 448:29]
  wire  _T_326 = io_dec_tlu_flush_pause_r ^ dec_tlu_flush_pause_r_d1; // @[lib.scala 448:21]
  wire  _T_327 = |_T_326; // @[lib.scala 448:29]
  wire  _T_330 = dbg_halt_req_held_ns ^ dbg_halt_req_held; // @[lib.scala 448:21]
  wire  _T_331 = |_T_330; // @[lib.scala 448:29]
  wire  _T_675 = io_dec_tlu_packet_r_fence_i & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 708:55]
  wire  _T_677 = _T_675 & _T_619; // @[dec_tlu_ctl.scala 708:79]
  wire  fence_i_r = _T_677 & _T_590; // @[dec_tlu_ctl.scala 708:100]
  wire  _T_335 = fence_i_r & internal_dbg_halt_mode; // @[dec_tlu_ctl.scala 497:71]
  wire  _T_336 = take_halt | _T_335; // @[dec_tlu_ctl.scala 497:58]
  wire  _T_337 = _T_336 | io_dec_tlu_flush_pause_r; // @[dec_tlu_ctl.scala 497:97]
  wire  _T_338 = i0_trigger_hit_raw_r & trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 497:144]
  wire  _T_339 = _T_337 | _T_338; // @[dec_tlu_ctl.scala 497:124]
  wire  take_ext_int_start = int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 788:43]
  wire  _T_341 = ~interrupt_valid_r; // @[dec_tlu_ctl.scala 502:61]
  wire  _T_342 = dec_tlu_wr_pause_r_d1 & _T_341; // @[dec_tlu_ctl.scala 502:59]
  wire  _T_343 = ~take_ext_int_start; // @[dec_tlu_ctl.scala 502:82]
  wire  _T_365 = io_tlu_exu_dec_tlu_flush_lower_r & dcsr[2]; // @[dec_tlu_ctl.scala 506:82]
  wire  _T_366 = io_dec_tlu_resume_ack | dcsr_single_step_running; // @[dec_tlu_ctl.scala 506:125]
  wire  _T_367 = _T_365 & _T_366; // @[dec_tlu_ctl.scala 506:100]
  wire  _T_368 = ~io_tlu_ifc_dec_tlu_flush_noredir_wb; // @[dec_tlu_ctl.scala 506:155]
  wire  _T_481 = |i0_trigger_r; // @[dec_tlu_ctl.scala 567:59]
  wire  _T_483 = _T_481 & _T_590; // @[dec_tlu_ctl.scala 567:63]
  wire [3:0] _T_485 = _T_483 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_492 = {i0_trigger_chain_masked_r[3],i0_trigger_r[2],i0_trigger_chain_masked_r[1],i0_trigger_r[0]}; // @[Cat.scala 29:58]
  wire  _T_495 = ~trigger_hit_dmode_r; // @[dec_tlu_ctl.scala 574:60]
  wire  _T_496 = ~io_dec_tlu_debug_mode; // @[dec_tlu_ctl.scala 601:62]
  wire  _T_497 = i_cpu_halt_req_sync & _T_496; // @[dec_tlu_ctl.scala 601:60]
  wire  i_cpu_halt_req_sync_qual = _T_497 & _T_680; // @[dec_tlu_ctl.scala 601:85]
  wire  _T_500 = i_cpu_run_req_sync & _T_496; // @[dec_tlu_ctl.scala 602:58]
  wire  _T_501 = _T_500 & pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 602:83]
  wire  i_cpu_run_req_sync_qual = _T_501 & _T_680; // @[dec_tlu_ctl.scala 602:105]
  wire  _T_503 = i_cpu_halt_req_sync_qual ^ i_cpu_halt_req_d1; // @[lib.scala 448:21]
  wire  _T_504 = |_T_503; // @[lib.scala 448:29]
  wire  _T_506 = i_cpu_run_req_sync_qual ^ i_cpu_run_req_d1_raw; // @[lib.scala 448:21]
  wire  _T_507 = |_T_506; // @[lib.scala 448:29]
  wire  _T_563 = ~i_cpu_run_req_d1; // @[dec_tlu_ctl.scala 626:51]
  wire  _T_564 = pmu_fw_tlu_halted_f & _T_563; // @[dec_tlu_ctl.scala 626:49]
  wire  _T_566 = io_o_cpu_halt_status & _T_563; // @[dec_tlu_ctl.scala 626:94]
  wire  _T_568 = _T_566 & _T_682; // @[dec_tlu_ctl.scala 626:114]
  wire  cpu_halt_status = _T_564 | _T_568; // @[dec_tlu_ctl.scala 626:70]
  reg  _T_512; // @[Reg.scala 27:20]
  wire  _T_510 = cpu_halt_status ^ _T_512; // @[lib.scala 448:21]
  wire  _T_511 = |_T_510; // @[lib.scala 448:29]
  wire  _T_560 = i_cpu_halt_req_d1 & pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 625:44]
  wire  _T_561 = io_o_cpu_halt_ack & i_cpu_halt_req_sync; // @[dec_tlu_ctl.scala 625:88]
  wire  cpu_halt_ack = _T_560 | _T_561; // @[dec_tlu_ctl.scala 625:67]
  reg  _T_516; // @[Reg.scala 27:20]
  wire  _T_514 = cpu_halt_ack ^ _T_516; // @[lib.scala 448:21]
  wire  _T_515 = |_T_514; // @[lib.scala 448:29]
  wire  _T_571 = _T_216 & i_cpu_run_req_sync; // @[dec_tlu_ctl.scala 627:46]
  wire  _T_572 = io_o_cpu_halt_status & i_cpu_run_req_d1_raw; // @[dec_tlu_ctl.scala 627:92]
  wire  _T_573 = _T_571 | _T_572; // @[dec_tlu_ctl.scala 627:68]
  wire  _T_574 = io_o_cpu_run_ack & i_cpu_run_req_sync; // @[dec_tlu_ctl.scala 627:136]
  wire  cpu_run_ack = _T_573 | _T_574; // @[dec_tlu_ctl.scala 627:116]
  reg  _T_520; // @[Reg.scala 27:20]
  wire  _T_518 = cpu_run_ack ^ _T_520; // @[lib.scala 448:21]
  wire  _T_519 = |_T_518; // @[lib.scala 448:29]
  wire  ext_halt_pulse = i_cpu_halt_req_sync_qual & _T_583; // @[dec_tlu_ctl.scala 617:55]
  wire  fw_halt_req = csr_io_fw_halt_req; // @[dec_tlu_ctl.scala 1011:37]
  wire  enter_pmu_fw_halt_req = ext_halt_pulse | fw_halt_req; // @[dec_tlu_ctl.scala 618:53]
  wire  _T_551 = pmu_fw_halt_req_f & core_empty; // @[dec_tlu_ctl.scala 623:50]
  wire  _T_552 = _T_551 & halt_taken; // @[dec_tlu_ctl.scala 623:63]
  wire  _T_553 = ~enter_debug_halt_req; // @[dec_tlu_ctl.scala 623:78]
  wire  _T_554 = _T_552 & _T_553; // @[dec_tlu_ctl.scala 623:76]
  wire  _T_557 = _T_554 | _T_564; // @[dec_tlu_ctl.scala 623:101]
  wire  pmu_fw_tlu_halted = _T_557 & _T_358; // @[dec_tlu_ctl.scala 623:146]
  wire  _T_541 = ~pmu_fw_tlu_halted; // @[dec_tlu_ctl.scala 619:77]
  wire  _T_542 = pmu_fw_halt_req_f & _T_541; // @[dec_tlu_ctl.scala 619:75]
  wire  _T_543 = enter_pmu_fw_halt_req | _T_542; // @[dec_tlu_ctl.scala 619:54]
  wire  pmu_fw_halt_req_ns = _T_543 & _T_358; // @[dec_tlu_ctl.scala 619:98]
  wire  _T_547 = internal_pmu_fw_halt_mode_f & _T_563; // @[dec_tlu_ctl.scala 620:88]
  wire  _T_549 = _T_547 & _T_358; // @[dec_tlu_ctl.scala 620:108]
  wire  internal_pmu_fw_halt_mode = pmu_fw_halt_req_ns | _T_549; // @[dec_tlu_ctl.scala 620:57]
  wire  _T_521 = internal_pmu_fw_halt_mode ^ internal_pmu_fw_halt_mode_f; // @[lib.scala 448:21]
  wire  _T_522 = |_T_521; // @[lib.scala 448:29]
  wire  _T_525 = pmu_fw_halt_req_ns ^ pmu_fw_halt_req_f; // @[lib.scala 448:21]
  wire  _T_526 = |_T_525; // @[lib.scala 448:29]
  wire  _T_529 = pmu_fw_tlu_halted ^ pmu_fw_tlu_halted_f; // @[lib.scala 448:21]
  wire  _T_530 = |_T_529; // @[lib.scala 448:29]
  wire  int_timer0_int_hold = int_exc_io_int_timer0_int_hold; // @[dec_tlu_ctl.scala 785:43]
  wire  _T_533 = int_timer0_int_hold ^ int_timer0_int_hold_f; // @[lib.scala 448:21]
  wire  _T_534 = |_T_533; // @[lib.scala 448:29]
  wire  int_timer1_int_hold = int_exc_io_int_timer1_int_hold; // @[dec_tlu_ctl.scala 786:43]
  wire  _T_537 = int_timer1_int_hold ^ int_timer1_int_hold_f; // @[lib.scala 448:21]
  wire  _T_538 = |_T_537; // @[lib.scala 448:29]
  wire  _T_596 = io_dec_tlu_i0_valid_r & _T_590; // @[dec_tlu_ctl.scala 654:55]
  wire  _T_597 = ~lsu_exc_valid_r; // @[dec_tlu_ctl.scala 654:70]
  wire  _T_598 = _T_596 & _T_597; // @[dec_tlu_ctl.scala 654:68]
  wire  _T_599 = ~inst_acc_r; // @[dec_tlu_ctl.scala 654:87]
  wire  _T_600 = _T_598 & _T_599; // @[dec_tlu_ctl.scala 654:84]
  wire  _T_602 = _T_600 & _T_249; // @[dec_tlu_ctl.scala 654:99]
  wire  _T_603 = ~request_debug_mode_r_d1; // @[dec_tlu_ctl.scala 654:126]
  wire  _T_604 = _T_602 & _T_603; // @[dec_tlu_ctl.scala 654:124]
  wire  tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 654:151]
  wire  _T_626 = tlu_i0_commit_cmt & iccm_repair_state_d1; // @[dec_tlu_ctl.scala 672:57]
  wire  _T_653 = ~dcsr[15]; // @[dec_tlu_ctl.scala 703:116]
  wire  _T_654 = _T_702 & _T_653; // @[dec_tlu_ctl.scala 703:114]
  wire  ebreak_r = _T_654 & _T_590; // @[dec_tlu_ctl.scala 703:136]
  wire  _T_657 = io_dec_tlu_packet_r_pmu_i0_itype == 4'h9; // @[dec_tlu_ctl.scala 704:57]
  wire  _T_658 = _T_657 & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 704:70]
  wire  _T_660 = _T_658 & _T_619; // @[dec_tlu_ctl.scala 704:94]
  wire  ecall_r = _T_660 & _T_590; // @[dec_tlu_ctl.scala 704:114]
  wire  _T_627 = ebreak_r | ecall_r; // @[dec_tlu_ctl.scala 672:93]
  wire  _T_628 = _T_627 | mret_r; // @[dec_tlu_ctl.scala 672:103]
  wire  _T_629 = _T_628 | take_reset; // @[dec_tlu_ctl.scala 672:112]
  wire  _T_630 = _T_629 | illegal_r; // @[dec_tlu_ctl.scala 672:125]
  wire  _T_631 = io_dec_csr_wraddr_r == 12'h7c2; // @[dec_tlu_ctl.scala 672:181]
  wire  _T_632 = dec_csr_wen_r_mod & _T_631; // @[dec_tlu_ctl.scala 672:158]
  wire  _T_633 = _T_630 | _T_632; // @[dec_tlu_ctl.scala 672:137]
  wire  _T_634 = ~_T_633; // @[dec_tlu_ctl.scala 672:82]
  wire  _T_635 = io_tlu_exu_exu_i0_br_error_r & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 679:69]
  wire  _T_638 = io_tlu_exu_exu_i0_br_start_error_r & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 680:81]
  wire  _T_641 = io_tlu_exu_exu_i0_br_valid_r & io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 681:65]
  wire  _T_643 = _T_641 & _T_611; // @[dec_tlu_ctl.scala 681:89]
  wire  _T_644 = ~io_tlu_exu_exu_i0_br_mp_r; // @[dec_tlu_ctl.scala 681:116]
  wire  _T_645 = ~io_tlu_exu_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 681:145]
  wire  _T_646 = _T_644 | _T_645; // @[dec_tlu_ctl.scala 681:143]
  wire  csr_pkt_presync = csr_read_io_csr_pkt_presync; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_708 = csr_pkt_presync & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 1021:50]
  wire  _T_709 = ~io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 1021:75]
  wire  csr_pkt_postsync = csr_read_io_csr_pkt_postsync; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  csr_pkt_csr_dcsr = csr_read_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  csr_pkt_csr_dpc = csr_read_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_718 = csr_pkt_csr_dcsr | csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 1026:63]
  wire  csr_pkt_csr_dmst = csr_read_io_csr_pkt_csr_dmst; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_719 = _T_718 | csr_pkt_csr_dmst; // @[dec_tlu_ctl.scala 1026:81]
  wire  csr_pkt_csr_dicawics = csr_read_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_720 = _T_719 | csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 1026:100]
  wire  csr_pkt_csr_dicad0 = csr_read_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_721 = _T_720 | csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 1026:123]
  wire  csr_pkt_csr_dicad0h = csr_read_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_722 = _T_721 | csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 1026:144]
  wire  csr_pkt_csr_dicad1 = csr_read_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_723 = _T_722 | csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 1026:166]
  wire  csr_pkt_csr_dicago = csr_read_io_csr_pkt_csr_dicago; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_724 = _T_723 | csr_pkt_csr_dicago; // @[dec_tlu_ctl.scala 1026:187]
  wire  _T_725 = ~_T_724; // @[dec_tlu_ctl.scala 1026:44]
  wire  _T_726 = _T_725 | dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 1026:209]
  wire  csr_pkt_legal = csr_read_io_csr_pkt_legal; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_727 = csr_pkt_legal & _T_726; // @[dec_tlu_ctl.scala 1026:41]
  wire  fast_int_meicpct = int_exc_io_fast_int_meicpct; // @[dec_tlu_ctl.scala 798:43]
  wire  _T_728 = ~fast_int_meicpct; // @[dec_tlu_ctl.scala 1026:231]
  wire  valid_csr = _T_727 & _T_728; // @[dec_tlu_ctl.scala 1026:229]
  wire  _T_731 = io_dec_csr_any_unq_d & valid_csr; // @[dec_tlu_ctl.scala 1028:54]
  wire  csr_pkt_csr_mvendorid = csr_read_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  csr_pkt_csr_marchid = csr_read_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_732 = csr_pkt_csr_mvendorid | csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 1028:115]
  wire  csr_pkt_csr_mimpid = csr_read_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_733 = _T_732 | csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 1028:137]
  wire  csr_pkt_csr_mhartid = csr_read_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_734 = _T_733 | csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 1028:158]
  wire  csr_pkt_csr_mdseac = csr_read_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_735 = _T_734 | csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 1028:180]
  wire  csr_pkt_csr_meihap = csr_read_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 278:47 dec_tlu_ctl.scala 1019:16]
  wire  _T_736 = _T_735 | csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 1028:201]
  wire  _T_737 = io_dec_csr_wen_unq_d & _T_736; // @[dec_tlu_ctl.scala 1028:90]
  wire  _T_738 = ~_T_737; // @[dec_tlu_ctl.scala 1028:67]
  int_exc int_exc ( // @[dec_tlu_ctl.scala 282:29]
    .clock(int_exc_clock),
    .reset(int_exc_reset),
    .io_mhwakeup_ready(int_exc_io_mhwakeup_ready),
    .io_ext_int_ready(int_exc_io_ext_int_ready),
    .io_ce_int_ready(int_exc_io_ce_int_ready),
    .io_soft_int_ready(int_exc_io_soft_int_ready),
    .io_timer_int_ready(int_exc_io_timer_int_ready),
    .io_int_timer0_int_hold(int_exc_io_int_timer0_int_hold),
    .io_int_timer1_int_hold(int_exc_io_int_timer1_int_hold),
    .io_internal_dbg_halt_timers(int_exc_io_internal_dbg_halt_timers),
    .io_take_ext_int_start(int_exc_io_take_ext_int_start),
    .io_ext_int_freeze_d1(int_exc_io_ext_int_freeze_d1),
    .io_take_ext_int_start_d1(int_exc_io_take_ext_int_start_d1),
    .io_take_ext_int_start_d2(int_exc_io_take_ext_int_start_d2),
    .io_take_ext_int_start_d3(int_exc_io_take_ext_int_start_d3),
    .io_ext_int_freeze(int_exc_io_ext_int_freeze),
    .io_take_ext_int(int_exc_io_take_ext_int),
    .io_fast_int_meicpct(int_exc_io_fast_int_meicpct),
    .io_ignore_ext_int_due_to_lsu_stall(int_exc_io_ignore_ext_int_due_to_lsu_stall),
    .io_take_ce_int(int_exc_io_take_ce_int),
    .io_take_soft_int(int_exc_io_take_soft_int),
    .io_take_timer_int(int_exc_io_take_timer_int),
    .io_take_int_timer0_int(int_exc_io_take_int_timer0_int),
    .io_take_int_timer1_int(int_exc_io_take_int_timer1_int),
    .io_take_reset(int_exc_io_take_reset),
    .io_take_nmi(int_exc_io_take_nmi),
    .io_synchronous_flush_r(int_exc_io_synchronous_flush_r),
    .io_tlu_flush_lower_r(int_exc_io_tlu_flush_lower_r),
    .io_dec_tlu_flush_lower_wb(int_exc_io_dec_tlu_flush_lower_wb),
    .io_dec_tlu_flush_lower_r(int_exc_io_dec_tlu_flush_lower_r),
    .io_dec_tlu_flush_path_r(int_exc_io_dec_tlu_flush_path_r),
    .io_interrupt_valid_r_d1(int_exc_io_interrupt_valid_r_d1),
    .io_i0_exception_valid_r_d1(int_exc_io_i0_exception_valid_r_d1),
    .io_exc_or_int_valid_r_d1(int_exc_io_exc_or_int_valid_r_d1),
    .io_exc_cause_wb(int_exc_io_exc_cause_wb),
    .io_i0_valid_wb(int_exc_io_i0_valid_wb),
    .io_trigger_hit_r_d1(int_exc_io_trigger_hit_r_d1),
    .io_take_nmi_r_d1(int_exc_io_take_nmi_r_d1),
    .io_interrupt_valid_r(int_exc_io_interrupt_valid_r),
    .io_exc_cause_r(int_exc_io_exc_cause_r),
    .io_i0_exception_valid_r(int_exc_io_i0_exception_valid_r),
    .io_tlu_flush_path_r_d1(int_exc_io_tlu_flush_path_r_d1),
    .io_exc_or_int_valid_r(int_exc_io_exc_or_int_valid_r),
    .io_dec_csr_stall_int_ff(int_exc_io_dec_csr_stall_int_ff),
    .io_mstatus_mie_ns(int_exc_io_mstatus_mie_ns),
    .io_mip(int_exc_io_mip),
    .io_mie_ns(int_exc_io_mie_ns),
    .io_mret_r(int_exc_io_mret_r),
    .io_pmu_fw_tlu_halted_f(int_exc_io_pmu_fw_tlu_halted_f),
    .io_int_timer0_int_hold_f(int_exc_io_int_timer0_int_hold_f),
    .io_int_timer1_int_hold_f(int_exc_io_int_timer1_int_hold_f),
    .io_internal_dbg_halt_mode_f(int_exc_io_internal_dbg_halt_mode_f),
    .io_dcsr_single_step_running(int_exc_io_dcsr_single_step_running),
    .io_internal_dbg_halt_mode(int_exc_io_internal_dbg_halt_mode),
    .io_dec_tlu_i0_valid_r(int_exc_io_dec_tlu_i0_valid_r),
    .io_internal_pmu_fw_halt_mode(int_exc_io_internal_pmu_fw_halt_mode),
    .io_i_cpu_halt_req_d1(int_exc_io_i_cpu_halt_req_d1),
    .io_ebreak_to_debug_mode_r(int_exc_io_ebreak_to_debug_mode_r),
    .io_lsu_fir_error(int_exc_io_lsu_fir_error),
    .io_csr_pkt_csr_meicpct(int_exc_io_csr_pkt_csr_meicpct),
    .io_dec_csr_any_unq_d(int_exc_io_dec_csr_any_unq_d),
    .io_lsu_fastint_stall_any(int_exc_io_lsu_fastint_stall_any),
    .io_reset_delayed(int_exc_io_reset_delayed),
    .io_mpc_reset_run_req(int_exc_io_mpc_reset_run_req),
    .io_nmi_int_detected(int_exc_io_nmi_int_detected),
    .io_dcsr_single_step_running_f(int_exc_io_dcsr_single_step_running_f),
    .io_dcsr_single_step_done_f(int_exc_io_dcsr_single_step_done_f),
    .io_dcsr(int_exc_io_dcsr),
    .io_mtvec(int_exc_io_mtvec),
    .io_tlu_i0_commit_cmt(int_exc_io_tlu_i0_commit_cmt),
    .io_i0_trigger_hit_r(int_exc_io_i0_trigger_hit_r),
    .io_pause_expired_r(int_exc_io_pause_expired_r),
    .io_nmi_vec(int_exc_io_nmi_vec),
    .io_lsu_i0_rfnpc_r(int_exc_io_lsu_i0_rfnpc_r),
    .io_fence_i_r(int_exc_io_fence_i_r),
    .io_iccm_repair_state_rfnpc(int_exc_io_iccm_repair_state_rfnpc),
    .io_i_cpu_run_req_d1(int_exc_io_i_cpu_run_req_d1),
    .io_rfpc_i0_r(int_exc_io_rfpc_i0_r),
    .io_lsu_exc_valid_r(int_exc_io_lsu_exc_valid_r),
    .io_trigger_hit_dmode_r(int_exc_io_trigger_hit_dmode_r),
    .io_take_halt(int_exc_io_take_halt),
    .io_rst_vec(int_exc_io_rst_vec),
    .io_lsu_fir_addr(int_exc_io_lsu_fir_addr),
    .io_dec_tlu_i0_pc_r(int_exc_io_dec_tlu_i0_pc_r),
    .io_npc_r(int_exc_io_npc_r),
    .io_mepc(int_exc_io_mepc),
    .io_debug_resume_req_f(int_exc_io_debug_resume_req_f),
    .io_dpc(int_exc_io_dpc),
    .io_npc_r_d1(int_exc_io_npc_r_d1),
    .io_tlu_flush_lower_r_d1(int_exc_io_tlu_flush_lower_r_d1),
    .io_dec_tlu_dbg_halted(int_exc_io_dec_tlu_dbg_halted),
    .io_ebreak_r(int_exc_io_ebreak_r),
    .io_ecall_r(int_exc_io_ecall_r),
    .io_illegal_r(int_exc_io_illegal_r),
    .io_inst_acc_r(int_exc_io_inst_acc_r),
    .io_lsu_i0_exc_r(int_exc_io_lsu_i0_exc_r),
    .io_lsu_error_pkt_r_bits_inst_type(int_exc_io_lsu_error_pkt_r_bits_inst_type),
    .io_lsu_error_pkt_r_bits_exc_type(int_exc_io_lsu_error_pkt_r_bits_exc_type),
    .io_dec_tlu_wr_pause_r_d1(int_exc_io_dec_tlu_wr_pause_r_d1)
  );
  csr_tlu csr ( // @[dec_tlu_ctl.scala 283:23]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_free_l2clk(csr_io_free_l2clk),
    .io_free_clk(csr_io_free_clk),
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
    .io_trigger_pkt_any_0_match_pkt(csr_io_trigger_pkt_any_0_match_pkt),
    .io_trigger_pkt_any_0_store(csr_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(csr_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_execute(csr_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(csr_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(csr_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(csr_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_pkt(csr_io_trigger_pkt_any_1_match_pkt),
    .io_trigger_pkt_any_1_store(csr_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(csr_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_execute(csr_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(csr_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(csr_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(csr_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_pkt(csr_io_trigger_pkt_any_2_match_pkt),
    .io_trigger_pkt_any_2_store(csr_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(csr_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_execute(csr_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(csr_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(csr_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(csr_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_pkt(csr_io_trigger_pkt_any_3_match_pkt),
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
    .io_dec_tlu_trace_disable(csr_io_dec_tlu_trace_disable),
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
    .io_lsu_single_ecc_error_r(csr_io_lsu_single_ecc_error_r),
    .io_e4e5_int_clk(csr_io_e4e5_int_clk),
    .io_lsu_i0_exc_r(csr_io_lsu_i0_exc_r),
    .io_inst_acc_r(csr_io_inst_acc_r),
    .io_inst_acc_second_r(csr_io_inst_acc_second_r),
    .io_take_nmi(csr_io_take_nmi),
    .io_lsu_error_pkt_addr_r(csr_io_lsu_error_pkt_addr_r),
    .io_exc_cause_r(csr_io_exc_cause_r),
    .io_i0_valid_wb(csr_io_i0_valid_wb),
    .io_interrupt_valid_r_d1(csr_io_interrupt_valid_r_d1),
    .io_i0_exception_valid_r_d1(csr_io_i0_exception_valid_r_d1),
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
    .io_ext_int_freeze(csr_io_ext_int_freeze),
    .io_ext_int_freeze_d1(csr_io_ext_int_freeze_d1),
    .io_take_ext_int_start_d1(csr_io_take_ext_int_start_d1),
    .io_take_ext_int_start_d2(csr_io_take_ext_int_start_d2),
    .io_take_ext_int_start_d3(csr_io_take_ext_int_start_d3),
    .io_ic_perr_r(csr_io_ic_perr_r),
    .io_iccm_sbecc_r(csr_io_iccm_sbecc_r),
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
    .io_mtdata1_t_3(csr_io_mtdata1_t_3),
    .io_trigger_enabled(csr_io_trigger_enabled)
  );
  dec_timer_ctl int_timers ( // @[dec_tlu_ctl.scala 284:30]
    .clock(int_timers_clock),
    .reset(int_timers_reset),
    .io_free_l2clk(int_timers_io_free_l2clk),
    .io_csr_wr_clk(int_timers_io_csr_wr_clk),
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
  dec_decode_csr_read csr_read ( // @[dec_tlu_ctl.scala 1017:28]
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
  assign io_tlu_exu_dec_tlu_meihap = csr_io_dec_tlu_meihap; // @[dec_tlu_ctl.scala 879:58]
  assign io_tlu_exu_dec_tlu_flush_lower_r = int_exc_io_dec_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 810:54]
  assign io_tlu_exu_dec_tlu_flush_path_r = int_exc_io_dec_tlu_flush_path_r; // @[dec_tlu_ctl.scala 811:54]
  assign io_tlu_dma_dec_tlu_dma_qos_prty = csr_io_dec_tlu_dma_qos_prty; // @[dec_tlu_ctl.scala 910:54]
  assign io_dec_tlu_core_empty = force_halt | _T_228; // @[dec_tlu_ctl.scala 436:31]
  assign io_dec_dbg_cmd_done = io_dec_tlu_i0_valid_r & io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 510:29]
  assign io_dec_dbg_cmd_fail = illegal_r & io_dec_dbg_cmd_done; // @[dec_tlu_ctl.scala 511:29]
  assign io_dec_tlu_dbg_halted = dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 492:41]
  assign io_dec_tlu_debug_mode = debug_mode_status; // @[dec_tlu_ctl.scala 493:41]
  assign io_dec_tlu_resume_ack = _T_286; // @[dec_tlu_ctl.scala 473:53]
  assign io_dec_tlu_debug_stall = debug_halt_req_f; // @[dec_tlu_ctl.scala 491:41]
  assign io_dec_tlu_mpc_halted_only = _T_143; // @[dec_tlu_ctl.scala 386:42]
  assign io_dec_tlu_flush_extint = int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 499:33]
  assign io_trigger_pkt_any_0_select = csr_io_trigger_pkt_any_0_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_match_pkt = csr_io_trigger_pkt_any_0_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_store = csr_io_trigger_pkt_any_0_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_load = csr_io_trigger_pkt_any_0_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_execute = csr_io_trigger_pkt_any_0_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_m = csr_io_trigger_pkt_any_0_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_0_tdata2 = csr_io_trigger_pkt_any_0_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_select = csr_io_trigger_pkt_any_1_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_match_pkt = csr_io_trigger_pkt_any_1_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_store = csr_io_trigger_pkt_any_1_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_load = csr_io_trigger_pkt_any_1_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_execute = csr_io_trigger_pkt_any_1_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_m = csr_io_trigger_pkt_any_1_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_1_tdata2 = csr_io_trigger_pkt_any_1_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_select = csr_io_trigger_pkt_any_2_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_match_pkt = csr_io_trigger_pkt_any_2_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_store = csr_io_trigger_pkt_any_2_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_load = csr_io_trigger_pkt_any_2_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_execute = csr_io_trigger_pkt_any_2_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_m = csr_io_trigger_pkt_any_2_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_2_tdata2 = csr_io_trigger_pkt_any_2_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_select = csr_io_trigger_pkt_any_3_select; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_match_pkt = csr_io_trigger_pkt_any_3_match_pkt; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_store = csr_io_trigger_pkt_any_3_store; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_load = csr_io_trigger_pkt_any_3_load; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_execute = csr_io_trigger_pkt_any_3_execute; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_m = csr_io_trigger_pkt_any_3_m; // @[dec_tlu_ctl.scala 885:46]
  assign io_trigger_pkt_any_3_tdata2 = csr_io_trigger_pkt_any_3_tdata2; // @[dec_tlu_ctl.scala 885:46]
  assign io_o_cpu_halt_status = _T_512; // @[dec_tlu_ctl.scala 606:60]
  assign io_o_cpu_halt_ack = _T_516; // @[dec_tlu_ctl.scala 607:68]
  assign io_o_cpu_run_ack = _T_520; // @[dec_tlu_ctl.scala 608:68]
  assign io_o_debug_mode_status = debug_mode_status; // @[dec_tlu_ctl.scala 630:32]
  assign io_mpc_debug_halt_ack = mpc_debug_halt_ack_f; // @[dec_tlu_ctl.scala 412:31]
  assign io_mpc_debug_run_ack = mpc_debug_run_ack_f; // @[dec_tlu_ctl.scala 413:31]
  assign io_debug_brkpt_status = debug_brkpt_status_f; // @[dec_tlu_ctl.scala 414:31]
  assign io_dec_csr_rddata_d = csr_io_dec_csr_rddata_d; // @[dec_tlu_ctl.scala 901:46]
  assign io_dec_csr_legal_d = _T_731 & _T_738; // @[dec_tlu_ctl.scala 1028:28]
  assign io_dec_tlu_i0_kill_writeb_wb = _T_52; // @[dec_tlu_ctl.scala 343:41]
  assign io_dec_tlu_i0_kill_writeb_r = _T_609 | i0_trigger_hit_raw_r; // @[dec_tlu_ctl.scala 349:41]
  assign io_dec_tlu_wr_pause_r = csr_io_dec_tlu_wr_pause_r; // @[dec_tlu_ctl.scala 903:46]
  assign io_dec_tlu_flush_pause_r = _T_342 & _T_343; // @[dec_tlu_ctl.scala 502:34]
  assign io_dec_tlu_presync_d = _T_708 & _T_709; // @[dec_tlu_ctl.scala 1021:31]
  assign io_dec_tlu_postsync_d = csr_pkt_postsync & io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 1022:31]
  assign io_dec_tlu_perfcnt0 = csr_io_dec_tlu_perfcnt0; // @[dec_tlu_ctl.scala 888:46]
  assign io_dec_tlu_perfcnt1 = csr_io_dec_tlu_perfcnt1; // @[dec_tlu_ctl.scala 889:46]
  assign io_dec_tlu_perfcnt2 = csr_io_dec_tlu_perfcnt2; // @[dec_tlu_ctl.scala 890:46]
  assign io_dec_tlu_perfcnt3 = csr_io_dec_tlu_perfcnt3; // @[dec_tlu_ctl.scala 891:46]
  assign io_dec_tlu_i0_exc_valid_wb1 = csr_io_dec_tlu_i0_exc_valid_wb1; // @[dec_tlu_ctl.scala 882:50]
  assign io_dec_tlu_i0_valid_wb1 = csr_io_dec_tlu_i0_valid_wb1; // @[dec_tlu_ctl.scala 883:50]
  assign io_dec_tlu_int_valid_wb1 = csr_io_dec_tlu_int_valid_wb1; // @[dec_tlu_ctl.scala 881:50]
  assign io_dec_tlu_exc_cause_wb1 = csr_io_dec_tlu_exc_cause_wb1; // @[dec_tlu_ctl.scala 887:46]
  assign io_dec_tlu_mtval_wb1 = csr_io_dec_tlu_mtval_wb1; // @[dec_tlu_ctl.scala 886:46]
  assign io_dec_tlu_pipelining_disable = csr_io_dec_tlu_pipelining_disable; // @[dec_tlu_ctl.scala 902:46]
  assign io_dec_tlu_trace_disable = csr_io_dec_tlu_trace_disable; // @[dec_tlu_ctl.scala 911:49]
  assign io_dec_tlu_misc_clk_override = csr_io_dec_tlu_misc_clk_override; // @[dec_tlu_ctl.scala 892:46]
  assign io_dec_tlu_dec_clk_override = csr_io_dec_tlu_dec_clk_override; // @[dec_tlu_ctl.scala 894:46]
  assign io_dec_tlu_ifu_clk_override = csr_io_dec_tlu_ifu_clk_override; // @[dec_tlu_ctl.scala 895:46]
  assign io_dec_tlu_lsu_clk_override = csr_io_dec_tlu_lsu_clk_override; // @[dec_tlu_ctl.scala 896:46]
  assign io_dec_tlu_bus_clk_override = csr_io_dec_tlu_bus_clk_override; // @[dec_tlu_ctl.scala 897:46]
  assign io_dec_tlu_pic_clk_override = csr_io_dec_tlu_pic_clk_override; // @[dec_tlu_ctl.scala 898:46]
  assign io_dec_tlu_dccm_clk_override = csr_io_dec_tlu_dccm_clk_override; // @[dec_tlu_ctl.scala 899:46]
  assign io_dec_tlu_icm_clk_override = csr_io_dec_tlu_icm_clk_override; // @[dec_tlu_ctl.scala 900:46]
  assign io_dec_tlu_flush_lower_wb = int_exc_io_dec_tlu_flush_lower_wb; // @[dec_tlu_ctl.scala 809:46]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_valid = _T_643 & _T_646; // @[dec_tlu_ctl.scala 687:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist = io_tlu_exu_exu_i0_br_hist_r; // @[dec_tlu_ctl.scala 684:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error = _T_635 & _T_611; // @[dec_tlu_ctl.scala 685:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error = _T_638 & _T_611; // @[dec_tlu_ctl.scala 686:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_way = io_exu_i0_br_way_r; // @[dec_tlu_ctl.scala 688:73]
  assign io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle = io_tlu_exu_exu_i0_br_middle_r; // @[dec_tlu_ctl.scala 689:81]
  assign io_tlu_bp_dec_tlu_flush_leak_one_wb = _T_367 & _T_368; // @[dec_tlu_ctl.scala 506:45]
  assign io_tlu_bp_dec_tlu_bpred_disable = csr_io_dec_tlu_bpred_disable; // @[dec_tlu_ctl.scala 906:53]
  assign io_tlu_ifc_dec_tlu_flush_noredir_wb = _T_339 | take_ext_int_start; // @[dec_tlu_ctl.scala 497:45]
  assign io_tlu_ifc_dec_tlu_mrac_ff = csr_io_dec_tlu_mrac_ff; // @[dec_tlu_ctl.scala 904:54]
  assign io_tlu_mem_dec_tlu_flush_err_wb = io_tlu_exu_dec_tlu_flush_lower_r & _T_615; // @[dec_tlu_ctl.scala 507:41]
  assign io_tlu_mem_dec_tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 658:42]
  assign io_tlu_mem_dec_tlu_force_halt = _T_59; // @[dec_tlu_ctl.scala 345:41]
  assign io_tlu_mem_dec_tlu_fence_i_wb = _T_677 & _T_590; // @[dec_tlu_ctl.scala 719:39]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata = csr_io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics = csr_io_dec_tlu_ic_diag_pkt_icache_dicawics; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid = csr_io_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid = csr_io_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[dec_tlu_ctl.scala 884:58]
  assign io_tlu_mem_dec_tlu_core_ecc_disable = csr_io_dec_tlu_core_ecc_disable; // @[dec_tlu_ctl.scala 908:54]
  assign io_tlu_busbuff_dec_tlu_external_ldfwd_disable = csr_io_dec_tlu_external_ldfwd_disable; // @[dec_tlu_ctl.scala 909:58]
  assign io_tlu_busbuff_dec_tlu_wb_coalescing_disable = csr_io_dec_tlu_wb_coalescing_disable; // @[dec_tlu_ctl.scala 905:58]
  assign io_tlu_busbuff_dec_tlu_sideeffect_posted_disable = csr_io_dec_tlu_sideeffect_posted_disable; // @[dec_tlu_ctl.scala 907:58]
  assign io_dec_pic_dec_tlu_meicurpl = csr_io_dec_tlu_meicurpl; // @[dec_tlu_ctl.scala 878:58]
  assign io_dec_pic_dec_tlu_meipt = csr_io_dec_tlu_meipt; // @[dec_tlu_ctl.scala 880:58]
  assign int_exc_clock = clock;
  assign int_exc_reset = reset;
  assign int_exc_io_ext_int_freeze_d1 = csr_io_ext_int_freeze_d1; // @[dec_tlu_ctl.scala 789:42]
  assign int_exc_io_take_ext_int_start_d1 = csr_io_take_ext_int_start_d1; // @[dec_tlu_ctl.scala 790:44]
  assign int_exc_io_take_ext_int_start_d2 = csr_io_take_ext_int_start_d2; // @[dec_tlu_ctl.scala 791:44]
  assign int_exc_io_take_ext_int_start_d3 = csr_io_take_ext_int_start_d3; // @[dec_tlu_ctl.scala 792:44]
  assign int_exc_io_dec_csr_stall_int_ff = io_dec_csr_stall_int_ff; // @[dec_tlu_ctl.scala 724:49]
  assign int_exc_io_mstatus_mie_ns = csr_io_mstatus_mie_ns; // @[dec_tlu_ctl.scala 725:49]
  assign int_exc_io_mip = csr_io_mip; // @[dec_tlu_ctl.scala 726:49]
  assign int_exc_io_mie_ns = csr_io_mie_ns; // @[dec_tlu_ctl.scala 727:49]
  assign int_exc_io_mret_r = _T_672 & _T_590; // @[dec_tlu_ctl.scala 728:49]
  assign int_exc_io_pmu_fw_tlu_halted_f = pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 729:49]
  assign int_exc_io_int_timer0_int_hold_f = int_timer0_int_hold_f; // @[dec_tlu_ctl.scala 730:49]
  assign int_exc_io_int_timer1_int_hold_f = int_timer1_int_hold_f; // @[dec_tlu_ctl.scala 731:49]
  assign int_exc_io_internal_dbg_halt_mode_f = debug_mode_status; // @[dec_tlu_ctl.scala 732:49]
  assign int_exc_io_dcsr_single_step_running = _T_255 | _T_257; // @[dec_tlu_ctl.scala 733:49]
  assign int_exc_io_internal_dbg_halt_mode = debug_halt_req_ns | _T_238; // @[dec_tlu_ctl.scala 734:49]
  assign int_exc_io_dec_tlu_i0_valid_r = io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 735:49]
  assign int_exc_io_internal_pmu_fw_halt_mode = pmu_fw_halt_req_ns | _T_549; // @[dec_tlu_ctl.scala 736:49]
  assign int_exc_io_i_cpu_halt_req_d1 = i_cpu_halt_req_d1; // @[dec_tlu_ctl.scala 737:49]
  assign int_exc_io_ebreak_to_debug_mode_r = _T_704 & _T_590; // @[dec_tlu_ctl.scala 738:49]
  assign int_exc_io_lsu_fir_error = io_lsu_fir_error; // @[dec_tlu_ctl.scala 739:49]
  assign int_exc_io_csr_pkt_csr_meicpct = csr_read_io_csr_pkt_csr_meicpct; // @[dec_tlu_ctl.scala 740:49]
  assign int_exc_io_dec_csr_any_unq_d = io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 741:49]
  assign int_exc_io_lsu_fastint_stall_any = io_lsu_fastint_stall_any; // @[dec_tlu_ctl.scala 742:49]
  assign int_exc_io_reset_delayed = reset_detect ^ reset_detected; // @[dec_tlu_ctl.scala 743:49]
  assign int_exc_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 744:49]
  assign int_exc_io_nmi_int_detected = _T_81 | nmi_fir_type; // @[dec_tlu_ctl.scala 745:49]
  assign int_exc_io_dcsr_single_step_running_f = dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 746:49]
  assign int_exc_io_dcsr_single_step_done_f = dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 747:49]
  assign int_exc_io_dcsr = csr_io_dcsr; // @[dec_tlu_ctl.scala 748:49]
  assign int_exc_io_mtvec = csr_io_mtvec; // @[dec_tlu_ctl.scala 749:49]
  assign int_exc_io_tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 750:49]
  assign int_exc_io_i0_trigger_hit_r = |i0_trigger_chain_masked_r; // @[dec_tlu_ctl.scala 751:49]
  assign int_exc_io_pause_expired_r = _T_361 & _T_362; // @[dec_tlu_ctl.scala 752:49]
  assign int_exc_io_nmi_vec = io_nmi_vec; // @[dec_tlu_ctl.scala 753:49]
  assign int_exc_io_lsu_i0_rfnpc_r = _T_592 & _T_594; // @[dec_tlu_ctl.scala 754:49]
  assign int_exc_io_fence_i_r = _T_677 & _T_590; // @[dec_tlu_ctl.scala 755:49]
  assign int_exc_io_iccm_repair_state_rfnpc = _T_626 & _T_634; // @[dec_tlu_ctl.scala 756:49]
  assign int_exc_io_i_cpu_run_req_d1 = i_cpu_run_req_d1_raw | _T_584; // @[dec_tlu_ctl.scala 757:49]
  assign int_exc_io_rfpc_i0_r = _T_620 & _T_621; // @[dec_tlu_ctl.scala 758:49]
  assign int_exc_io_lsu_exc_valid_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 759:49]
  assign int_exc_io_trigger_hit_dmode_r = i0_trigger_hit_raw_r & i0_trigger_action_r; // @[dec_tlu_ctl.scala 760:49]
  assign int_exc_io_take_halt = _T_208 & _T_209; // @[dec_tlu_ctl.scala 761:49]
  assign int_exc_io_rst_vec = io_rst_vec; // @[dec_tlu_ctl.scala 762:49]
  assign int_exc_io_lsu_fir_addr = io_lsu_fir_addr; // @[dec_tlu_ctl.scala 763:49]
  assign int_exc_io_dec_tlu_i0_pc_r = io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 764:49]
  assign int_exc_io_npc_r = csr_io_npc_r; // @[dec_tlu_ctl.scala 765:49]
  assign int_exc_io_mepc = csr_io_mepc; // @[dec_tlu_ctl.scala 766:49]
  assign int_exc_io_debug_resume_req_f = debug_resume_req_f_raw & _T_333; // @[dec_tlu_ctl.scala 767:49]
  assign int_exc_io_dpc = csr_io_dpc; // @[dec_tlu_ctl.scala 768:49]
  assign int_exc_io_npc_r_d1 = csr_io_npc_r_d1; // @[dec_tlu_ctl.scala 769:49]
  assign int_exc_io_tlu_flush_lower_r_d1 = tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 770:49]
  assign int_exc_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 771:49]
  assign int_exc_io_ebreak_r = _T_654 & _T_590; // @[dec_tlu_ctl.scala 772:49]
  assign int_exc_io_ecall_r = _T_660 & _T_590; // @[dec_tlu_ctl.scala 773:49]
  assign int_exc_io_illegal_r = _T_666 & _T_590; // @[dec_tlu_ctl.scala 774:49]
  assign int_exc_io_inst_acc_r = _T_696 & _T_619; // @[dec_tlu_ctl.scala 775:49]
  assign int_exc_io_lsu_i0_exc_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 776:49]
  assign int_exc_io_lsu_error_pkt_r_bits_inst_type = io_lsu_error_pkt_r_bits_inst_type; // @[dec_tlu_ctl.scala 777:49]
  assign int_exc_io_lsu_error_pkt_r_bits_exc_type = io_lsu_error_pkt_r_bits_exc_type; // @[dec_tlu_ctl.scala 777:49]
  assign int_exc_io_dec_tlu_wr_pause_r_d1 = dec_tlu_wr_pause_r_d1; // @[dec_tlu_ctl.scala 778:42]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 822:50]
  assign csr_io_free_clk = io_free_clk; // @[dec_tlu_ctl.scala 821:50]
  assign csr_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 824:50]
  assign csr_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 825:50]
  assign csr_io_dec_csr_rdaddr_d = io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 826:50]
  assign csr_io_dec_csr_wen_unq_d = io_dec_csr_wen_unq_d; // @[dec_tlu_ctl.scala 827:50]
  assign csr_io_dec_i0_decode_d = io_dec_i0_decode_d; // @[dec_tlu_ctl.scala 828:50]
  assign csr_io_ifu_ic_debug_rd_data_valid = io_tlu_mem_ifu_ic_debug_rd_data_valid; // @[dec_tlu_ctl.scala 829:50]
  assign csr_io_ifu_pmu_bus_trxn = io_tlu_mem_ifu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 830:50]
  assign csr_io_dma_iccm_stall_any = io_tlu_dma_dma_iccm_stall_any; // @[dec_tlu_ctl.scala 831:50]
  assign csr_io_dma_dccm_stall_any = io_tlu_dma_dma_dccm_stall_any; // @[dec_tlu_ctl.scala 832:50]
  assign csr_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[dec_tlu_ctl.scala 833:50]
  assign csr_io_dec_pmu_presync_stall = io_dec_pmu_presync_stall; // @[dec_tlu_ctl.scala 834:50]
  assign csr_io_dec_pmu_postsync_stall = io_dec_pmu_postsync_stall; // @[dec_tlu_ctl.scala 835:50]
  assign csr_io_dec_pmu_decode_stall = io_dec_pmu_decode_stall; // @[dec_tlu_ctl.scala 836:50]
  assign csr_io_ifu_pmu_fetch_stall = io_tlu_ifc_ifu_pmu_fetch_stall; // @[dec_tlu_ctl.scala 837:50]
  assign csr_io_dec_tlu_packet_r_icaf_type = io_dec_tlu_packet_r_icaf_type; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_i0_itype = io_dec_tlu_packet_r_pmu_i0_itype; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_i0_br_unpred = io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_divide = io_dec_tlu_packet_r_pmu_divide; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_dec_tlu_packet_r_pmu_lsu_misaligned = io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec_tlu_ctl.scala 838:50]
  assign csr_io_exu_pmu_i0_br_ataken = io_tlu_exu_exu_pmu_i0_br_ataken; // @[dec_tlu_ctl.scala 839:50]
  assign csr_io_exu_pmu_i0_br_misp = io_tlu_exu_exu_pmu_i0_br_misp; // @[dec_tlu_ctl.scala 840:50]
  assign csr_io_dec_pmu_instr_decoded = io_dec_pmu_instr_decoded; // @[dec_tlu_ctl.scala 841:50]
  assign csr_io_ifu_pmu_instr_aligned = io_ifu_pmu_instr_aligned; // @[dec_tlu_ctl.scala 842:50]
  assign csr_io_exu_pmu_i0_pc4 = io_tlu_exu_exu_pmu_i0_pc4; // @[dec_tlu_ctl.scala 843:50]
  assign csr_io_ifu_pmu_ic_miss = io_tlu_mem_ifu_pmu_ic_miss; // @[dec_tlu_ctl.scala 844:50]
  assign csr_io_ifu_pmu_ic_hit = io_tlu_mem_ifu_pmu_ic_hit; // @[dec_tlu_ctl.scala 845:50]
  assign csr_io_dec_csr_wen_r = io_dec_csr_wen_r; // @[dec_tlu_ctl.scala 846:50]
  assign csr_io_dec_tlu_dbg_halted = io_dec_tlu_dbg_halted; // @[dec_tlu_ctl.scala 847:50]
  assign csr_io_dma_pmu_dccm_write = io_tlu_dma_dma_pmu_dccm_write; // @[dec_tlu_ctl.scala 848:50]
  assign csr_io_dma_pmu_dccm_read = io_tlu_dma_dma_pmu_dccm_read; // @[dec_tlu_ctl.scala 849:50]
  assign csr_io_dma_pmu_any_write = io_tlu_dma_dma_pmu_any_write; // @[dec_tlu_ctl.scala 850:50]
  assign csr_io_dma_pmu_any_read = io_tlu_dma_dma_pmu_any_read; // @[dec_tlu_ctl.scala 851:50]
  assign csr_io_lsu_pmu_bus_busy = io_tlu_busbuff_lsu_pmu_bus_busy; // @[dec_tlu_ctl.scala 852:50]
  assign csr_io_dec_tlu_i0_pc_r = io_dec_tlu_i0_pc_r; // @[dec_tlu_ctl.scala 853:50]
  assign csr_io_dec_tlu_i0_valid_r = io_dec_tlu_i0_valid_r; // @[dec_tlu_ctl.scala 854:50]
  assign csr_io_dec_csr_any_unq_d = io_dec_csr_any_unq_d; // @[dec_tlu_ctl.scala 856:50]
  assign csr_io_ifu_pmu_bus_busy = io_tlu_mem_ifu_pmu_bus_busy; // @[dec_tlu_ctl.scala 857:50]
  assign csr_io_lsu_pmu_bus_error = io_tlu_busbuff_lsu_pmu_bus_error; // @[dec_tlu_ctl.scala 858:50]
  assign csr_io_ifu_pmu_bus_error = io_tlu_mem_ifu_pmu_bus_error; // @[dec_tlu_ctl.scala 859:50]
  assign csr_io_lsu_pmu_bus_misaligned = io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[dec_tlu_ctl.scala 860:50]
  assign csr_io_lsu_pmu_bus_trxn = io_tlu_busbuff_lsu_pmu_bus_trxn; // @[dec_tlu_ctl.scala 861:50]
  assign csr_io_ifu_ic_debug_rd_data = io_tlu_mem_ifu_ic_debug_rd_data; // @[dec_tlu_ctl.scala 862:50]
  assign csr_io_pic_pl = io_dec_pic_pic_pl; // @[dec_tlu_ctl.scala 863:50]
  assign csr_io_pic_claimid = io_dec_pic_pic_claimid; // @[dec_tlu_ctl.scala 864:50]
  assign csr_io_iccm_dma_sb_error = io_iccm_dma_sb_error; // @[dec_tlu_ctl.scala 865:50]
  assign csr_io_lsu_imprecise_error_addr_any = io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[dec_tlu_ctl.scala 866:50]
  assign csr_io_lsu_imprecise_error_load_any = io_tlu_busbuff_lsu_imprecise_error_load_any; // @[dec_tlu_ctl.scala 867:50]
  assign csr_io_lsu_imprecise_error_store_any = io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec_tlu_ctl.scala 868:50]
  assign csr_io_dec_illegal_inst = io_dec_illegal_inst; // @[dec_tlu_ctl.scala 869:50 dec_tlu_ctl.scala 912:50]
  assign csr_io_lsu_error_pkt_r_bits_mscause = io_lsu_error_pkt_r_bits_mscause; // @[dec_tlu_ctl.scala 870:50 dec_tlu_ctl.scala 913:50]
  assign csr_io_mexintpend = io_dec_pic_mexintpend; // @[dec_tlu_ctl.scala 871:50 dec_tlu_ctl.scala 914:50]
  assign csr_io_exu_npc_r = io_tlu_exu_exu_npc_r; // @[dec_tlu_ctl.scala 872:50 dec_tlu_ctl.scala 915:50]
  assign csr_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[dec_tlu_ctl.scala 873:50 dec_tlu_ctl.scala 916:50]
  assign csr_io_rst_vec = io_rst_vec; // @[dec_tlu_ctl.scala 874:50 dec_tlu_ctl.scala 917:50]
  assign csr_io_core_id = io_core_id; // @[dec_tlu_ctl.scala 875:50 dec_tlu_ctl.scala 918:50]
  assign csr_io_dec_timer_rddata_d = int_timers_io_dec_timer_rddata_d; // @[dec_tlu_ctl.scala 876:50 dec_tlu_ctl.scala 919:50]
  assign csr_io_dec_timer_read_d = int_timers_io_dec_timer_read_d; // @[dec_tlu_ctl.scala 877:50 dec_tlu_ctl.scala 920:50]
  assign csr_io_rfpc_i0_r = _T_620 & _T_621; // @[dec_tlu_ctl.scala 923:45]
  assign csr_io_i0_trigger_hit_r = |i0_trigger_chain_masked_r; // @[dec_tlu_ctl.scala 924:45]
  assign csr_io_exc_or_int_valid_r = int_exc_io_exc_or_int_valid_r; // @[dec_tlu_ctl.scala 925:45]
  assign csr_io_mret_r = _T_672 & _T_590; // @[dec_tlu_ctl.scala 926:45]
  assign csr_io_dcsr_single_step_running_f = dcsr_single_step_running_f; // @[dec_tlu_ctl.scala 927:45]
  assign csr_io_dec_timer_t0_pulse = int_timers_io_dec_timer_t0_pulse; // @[dec_tlu_ctl.scala 928:45]
  assign csr_io_dec_timer_t1_pulse = int_timers_io_dec_timer_t1_pulse; // @[dec_tlu_ctl.scala 929:45]
  assign csr_io_timer_int_sync = syncro_ff[5]; // @[dec_tlu_ctl.scala 930:45]
  assign csr_io_soft_int_sync = syncro_ff[4]; // @[dec_tlu_ctl.scala 931:45]
  assign csr_io_csr_wr_clk = clock; // @[dec_tlu_ctl.scala 932:45]
  assign csr_io_ebreak_to_debug_mode_r = _T_704 & _T_590; // @[dec_tlu_ctl.scala 933:45]
  assign csr_io_dec_tlu_pmu_fw_halted = pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 934:45]
  assign csr_io_lsu_fir_error = io_lsu_fir_error; // @[dec_tlu_ctl.scala 935:45]
  assign csr_io_tlu_flush_lower_r_d1 = tlu_flush_lower_r_d1; // @[dec_tlu_ctl.scala 936:45]
  assign csr_io_dec_tlu_flush_noredir_r_d1 = dec_tlu_flush_noredir_r_d1; // @[dec_tlu_ctl.scala 937:45]
  assign csr_io_tlu_flush_path_r_d1 = int_exc_io_tlu_flush_path_r_d1; // @[dec_tlu_ctl.scala 938:45]
  assign csr_io_reset_delayed = reset_detect ^ reset_detected; // @[dec_tlu_ctl.scala 939:45]
  assign csr_io_interrupt_valid_r = int_exc_io_interrupt_valid_r; // @[dec_tlu_ctl.scala 940:45]
  assign csr_io_i0_exception_valid_r = int_exc_io_i0_exception_valid_r; // @[dec_tlu_ctl.scala 941:45]
  assign csr_io_lsu_exc_valid_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 942:45]
  assign csr_io_mepc_trigger_hit_sel_pc_r = i0_trigger_hit_raw_r & _T_495; // @[dec_tlu_ctl.scala 943:45]
  assign csr_io_lsu_single_ecc_error_r = io_lsu_single_ecc_error_incr; // @[dec_tlu_ctl.scala 944:45]
  assign csr_io_e4e5_int_clk = clock; // @[dec_tlu_ctl.scala 945:45]
  assign csr_io_lsu_i0_exc_r = _T_589 & _T_590; // @[dec_tlu_ctl.scala 946:45]
  assign csr_io_inst_acc_r = _T_696 & _T_619; // @[dec_tlu_ctl.scala 947:45]
  assign csr_io_inst_acc_second_r = io_dec_tlu_packet_r_icaf_second; // @[dec_tlu_ctl.scala 948:45]
  assign csr_io_take_nmi = int_exc_io_take_nmi; // @[dec_tlu_ctl.scala 949:45]
  assign csr_io_lsu_error_pkt_addr_r = io_lsu_error_pkt_r_bits_addr; // @[dec_tlu_ctl.scala 950:45]
  assign csr_io_exc_cause_r = int_exc_io_exc_cause_r; // @[dec_tlu_ctl.scala 951:45]
  assign csr_io_i0_valid_wb = int_exc_io_i0_valid_wb; // @[dec_tlu_ctl.scala 952:45]
  assign csr_io_interrupt_valid_r_d1 = int_exc_io_interrupt_valid_r_d1; // @[dec_tlu_ctl.scala 954:45]
  assign csr_io_i0_exception_valid_r_d1 = int_exc_io_i0_exception_valid_r_d1; // @[dec_tlu_ctl.scala 956:45]
  assign csr_io_exc_cause_wb = int_exc_io_exc_cause_wb; // @[dec_tlu_ctl.scala 958:45]
  assign csr_io_nmi_lsu_store_type = _T_95 | _T_97; // @[dec_tlu_ctl.scala 959:45]
  assign csr_io_nmi_lsu_load_type = _T_87 | _T_89; // @[dec_tlu_ctl.scala 960:45]
  assign csr_io_tlu_i0_commit_cmt = _T_604 & _T_619; // @[dec_tlu_ctl.scala 961:45]
  assign csr_io_ebreak_r = _T_654 & _T_590; // @[dec_tlu_ctl.scala 962:45]
  assign csr_io_ecall_r = _T_660 & _T_590; // @[dec_tlu_ctl.scala 963:45]
  assign csr_io_illegal_r = _T_666 & _T_590; // @[dec_tlu_ctl.scala 964:45]
  assign csr_io_nmi_int_detected_f = nmi_int_detected_f; // @[dec_tlu_ctl.scala 966:45]
  assign csr_io_internal_dbg_halt_mode_f2 = internal_dbg_halt_mode_f2; // @[dec_tlu_ctl.scala 967:45]
  assign csr_io_ext_int_freeze = int_exc_io_ext_int_freeze; // @[dec_tlu_ctl.scala 820:32]
  assign csr_io_ic_perr_r = _T_684 & _T_685; // @[dec_tlu_ctl.scala 969:45]
  assign csr_io_iccm_sbecc_r = _T_691 & _T_685; // @[dec_tlu_ctl.scala 970:45]
  assign csr_io_ifu_miss_state_idle_f = ifu_miss_state_idle_f; // @[dec_tlu_ctl.scala 972:45]
  assign csr_io_lsu_idle_any_f = lsu_idle_any_f; // @[dec_tlu_ctl.scala 973:45]
  assign csr_io_dbg_tlu_halted_f = dbg_tlu_halted_f; // @[dec_tlu_ctl.scala 974:45]
  assign csr_io_dbg_tlu_halted = _T_242 | _T_244; // @[dec_tlu_ctl.scala 975:45]
  assign csr_io_debug_halt_req_f = debug_halt_req_f; // @[dec_tlu_ctl.scala 976:59]
  assign csr_io_take_ext_int_start = int_exc_io_take_ext_int_start; // @[dec_tlu_ctl.scala 977:55]
  assign csr_io_trigger_hit_dmode_r_d1 = trigger_hit_dmode_r_d1; // @[dec_tlu_ctl.scala 978:43]
  assign csr_io_trigger_hit_r_d1 = int_exc_io_trigger_hit_r_d1; // @[dec_tlu_ctl.scala 979:43]
  assign csr_io_dcsr_single_step_done_f = dcsr_single_step_done_f; // @[dec_tlu_ctl.scala 980:43]
  assign csr_io_ebreak_to_debug_mode_r_d1 = ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 981:45]
  assign csr_io_debug_halt_req = _T_192 & _T_680; // @[dec_tlu_ctl.scala 982:51]
  assign csr_io_allow_dbg_halt_csr_write = debug_mode_status & _T_155; // @[dec_tlu_ctl.scala 983:45]
  assign csr_io_internal_dbg_halt_mode_f = debug_mode_status; // @[dec_tlu_ctl.scala 984:45]
  assign csr_io_enter_debug_halt_req = _T_233 | ebreak_to_debug_mode_r_d1; // @[dec_tlu_ctl.scala 985:45]
  assign csr_io_internal_dbg_halt_mode = debug_halt_req_ns | _T_238; // @[dec_tlu_ctl.scala 986:45]
  assign csr_io_request_debug_mode_done = _T_261 & _T_214; // @[dec_tlu_ctl.scala 987:45]
  assign csr_io_request_debug_mode_r = _T_258 | _T_260; // @[dec_tlu_ctl.scala 988:45]
  assign csr_io_update_hit_bit_r = _T_485 & _T_492; // @[dec_tlu_ctl.scala 989:45]
  assign csr_io_take_timer_int = int_exc_io_take_timer_int; // @[dec_tlu_ctl.scala 990:45]
  assign csr_io_take_int_timer0_int = int_exc_io_take_int_timer0_int; // @[dec_tlu_ctl.scala 991:45]
  assign csr_io_take_int_timer1_int = int_exc_io_take_int_timer1_int; // @[dec_tlu_ctl.scala 992:45]
  assign csr_io_take_ext_int = int_exc_io_take_ext_int; // @[dec_tlu_ctl.scala 993:45]
  assign csr_io_tlu_flush_lower_r = int_exc_io_tlu_flush_lower_r; // @[dec_tlu_ctl.scala 994:45]
  assign csr_io_dec_tlu_br0_error_r = _T_635 & _T_611; // @[dec_tlu_ctl.scala 995:45]
  assign csr_io_dec_tlu_br0_start_error_r = _T_638 & _T_611; // @[dec_tlu_ctl.scala 996:45]
  assign csr_io_lsu_pmu_load_external_r = lsu_pmu_load_external_r; // @[dec_tlu_ctl.scala 997:45]
  assign csr_io_lsu_pmu_store_external_r = lsu_pmu_store_external_r; // @[dec_tlu_ctl.scala 998:45]
  assign csr_io_csr_pkt_csr_misa = csr_read_io_csr_pkt_csr_misa; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mvendorid = csr_read_io_csr_pkt_csr_mvendorid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_marchid = csr_read_io_csr_pkt_csr_marchid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mimpid = csr_read_io_csr_pkt_csr_mimpid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhartid = csr_read_io_csr_pkt_csr_mhartid; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mstatus = csr_read_io_csr_pkt_csr_mstatus; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtvec = csr_read_io_csr_pkt_csr_mtvec; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mip = csr_read_io_csr_pkt_csr_mip; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mie = csr_read_io_csr_pkt_csr_mie; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcyclel = csr_read_io_csr_pkt_csr_mcyclel; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcycleh = csr_read_io_csr_pkt_csr_mcycleh; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_minstretl = csr_read_io_csr_pkt_csr_minstretl; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_minstreth = csr_read_io_csr_pkt_csr_minstreth; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mscratch = csr_read_io_csr_pkt_csr_mscratch; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mepc = csr_read_io_csr_pkt_csr_mepc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcause = csr_read_io_csr_pkt_csr_mcause; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mscause = csr_read_io_csr_pkt_csr_mscause; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtval = csr_read_io_csr_pkt_csr_mtval; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mrac = csr_read_io_csr_pkt_csr_mrac; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mdseac = csr_read_io_csr_pkt_csr_mdseac; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meihap = csr_read_io_csr_pkt_csr_meihap; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meivt = csr_read_io_csr_pkt_csr_meivt; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meipt = csr_read_io_csr_pkt_csr_meipt; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meicurpl = csr_read_io_csr_pkt_csr_meicurpl; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_meicidpl = csr_read_io_csr_pkt_csr_meicidpl; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dcsr = csr_read_io_csr_pkt_csr_dcsr; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcgc = csr_read_io_csr_pkt_csr_mcgc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mfdc = csr_read_io_csr_pkt_csr_mfdc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dpc = csr_read_io_csr_pkt_csr_dpc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtsel = csr_read_io_csr_pkt_csr_mtsel; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtdata1 = csr_read_io_csr_pkt_csr_mtdata1; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mtdata2 = csr_read_io_csr_pkt_csr_mtdata2; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc3 = csr_read_io_csr_pkt_csr_mhpmc3; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc4 = csr_read_io_csr_pkt_csr_mhpmc4; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc5 = csr_read_io_csr_pkt_csr_mhpmc5; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc6 = csr_read_io_csr_pkt_csr_mhpmc6; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc3h = csr_read_io_csr_pkt_csr_mhpmc3h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc4h = csr_read_io_csr_pkt_csr_mhpmc4h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc5h = csr_read_io_csr_pkt_csr_mhpmc5h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpmc6h = csr_read_io_csr_pkt_csr_mhpmc6h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme3 = csr_read_io_csr_pkt_csr_mhpme3; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme4 = csr_read_io_csr_pkt_csr_mhpme4; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme5 = csr_read_io_csr_pkt_csr_mhpme5; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mhpme6 = csr_read_io_csr_pkt_csr_mhpme6; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mcountinhibit = csr_read_io_csr_pkt_csr_mcountinhibit; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mpmc = csr_read_io_csr_pkt_csr_mpmc; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_micect = csr_read_io_csr_pkt_csr_micect; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_miccmect = csr_read_io_csr_pkt_csr_miccmect; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mdccmect = csr_read_io_csr_pkt_csr_mdccmect; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mfdht = csr_read_io_csr_pkt_csr_mfdht; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_mfdhs = csr_read_io_csr_pkt_csr_mfdhs; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicawics = csr_read_io_csr_pkt_csr_dicawics; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicad0h = csr_read_io_csr_pkt_csr_dicad0h; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicad0 = csr_read_io_csr_pkt_csr_dicad0; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_csr_pkt_csr_dicad1 = csr_read_io_csr_pkt_csr_dicad1; // @[dec_tlu_ctl.scala 1000:45]
  assign csr_io_trigger_enabled = {_T_412,_T_411}; // @[dec_tlu_ctl.scala 999:45]
  assign int_timers_clock = clock;
  assign int_timers_reset = reset;
  assign int_timers_io_free_l2clk = io_free_l2clk; // @[dec_tlu_ctl.scala 285:65]
  assign int_timers_io_csr_wr_clk = clock; // @[dec_tlu_ctl.scala 321:52]
  assign int_timers_io_dec_csr_wen_r_mod = csr_io_dec_csr_wen_r_mod; // @[dec_tlu_ctl.scala 287:49]
  assign int_timers_io_dec_csr_wraddr_r = io_dec_csr_wraddr_r; // @[dec_tlu_ctl.scala 289:49]
  assign int_timers_io_dec_csr_wrdata_r = io_dec_csr_wrdata_r; // @[dec_tlu_ctl.scala 290:49]
  assign int_timers_io_csr_mitctl0 = csr_read_io_csr_pkt_csr_mitctl0; // @[dec_tlu_ctl.scala 291:57]
  assign int_timers_io_csr_mitctl1 = csr_read_io_csr_pkt_csr_mitctl1; // @[dec_tlu_ctl.scala 292:57]
  assign int_timers_io_csr_mitb0 = csr_read_io_csr_pkt_csr_mitb0; // @[dec_tlu_ctl.scala 293:57]
  assign int_timers_io_csr_mitb1 = csr_read_io_csr_pkt_csr_mitb1; // @[dec_tlu_ctl.scala 294:57]
  assign int_timers_io_csr_mitcnt0 = csr_read_io_csr_pkt_csr_mitcnt0; // @[dec_tlu_ctl.scala 295:57]
  assign int_timers_io_csr_mitcnt1 = csr_read_io_csr_pkt_csr_mitcnt1; // @[dec_tlu_ctl.scala 296:57]
  assign int_timers_io_dec_pause_state = io_dec_pause_state; // @[dec_tlu_ctl.scala 297:49]
  assign int_timers_io_dec_tlu_pmu_fw_halted = pmu_fw_tlu_halted_f; // @[dec_tlu_ctl.scala 298:49]
  assign int_timers_io_internal_dbg_halt_timers = int_exc_io_internal_dbg_halt_timers; // @[dec_tlu_ctl.scala 299:47]
  assign csr_read_io_dec_csr_rdaddr_d = io_dec_csr_rdaddr_d; // @[dec_tlu_ctl.scala 1018:37]
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
  debug_mode_status = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  i_cpu_run_req_d1_raw = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  nmi_int_delayed = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  nmi_int_detected_f = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  int_timer0_int_hold_f = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  int_timer1_int_hold_f = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  i_cpu_halt_req_d1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reset_detect = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reset_detected = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  dec_pause_state_f = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  debug_halt_req_f = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  pmu_fw_halt_req_f = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  halt_taken_f = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  ifu_ic_error_start_f = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  debug_resume_req_f_raw = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  dcsr_single_step_running_f = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  dcsr_single_step_done_f = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  internal_pmu_fw_halt_mode_f = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ifu_iccm_rd_ecc_single_err_f = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  iccm_repair_state_d1 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  dbg_halt_req_held = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  trigger_hit_dmode_r_d1 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  ebreak_to_debug_mode_r_d1 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  lsu_idle_any_f = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  ifu_miss_state_idle_f = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  debug_halt_req_d1 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  dec_tlu_flush_noredir_r_d1 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  dec_tlu_flush_pause_r_d1 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  dbg_tlu_halted_f = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  pmu_fw_tlu_halted_f = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  lsu_pmu_load_external_r = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  lsu_pmu_store_external_r = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  tlu_flush_lower_r_d1 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  _T_52 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  internal_dbg_halt_mode_f2 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  _T_59 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  nmi_lsu_load_type_f = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  nmi_lsu_store_type_f = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  mpc_debug_halt_req_sync_f = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  mpc_debug_run_req_sync_f = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  mpc_run_state_f = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  mpc_debug_run_ack_f = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  debug_brkpt_status_f = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  mpc_debug_halt_ack_f = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  dbg_run_state_f = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  _T_143 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  request_debug_mode_r_d1 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  request_debug_mode_done_f = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_286 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  dec_tlu_wr_pause_r_d1 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  _T_512 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  _T_516 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  _T_520 = _RAND_56[0:0];
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
    debug_mode_status = 1'h0;
  end
  if (reset) begin
    i_cpu_run_req_d1_raw = 1'h0;
  end
  if (reset) begin
    nmi_int_delayed = 1'h0;
  end
  if (reset) begin
    nmi_int_detected_f = 1'h0;
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
    reset_detect = 1'h0;
  end
  if (reset) begin
    reset_detected = 1'h0;
  end
  if (reset) begin
    dec_pause_state_f = 1'h0;
  end
  if (reset) begin
    debug_halt_req_f = 1'h0;
  end
  if (reset) begin
    pmu_fw_halt_req_f = 1'h0;
  end
  if (reset) begin
    halt_taken_f = 1'h0;
  end
  if (reset) begin
    ifu_ic_error_start_f = 1'h0;
  end
  if (reset) begin
    debug_resume_req_f_raw = 1'h0;
  end
  if (reset) begin
    dcsr_single_step_running_f = 1'h0;
  end
  if (reset) begin
    dcsr_single_step_done_f = 1'h0;
  end
  if (reset) begin
    internal_pmu_fw_halt_mode_f = 1'h0;
  end
  if (reset) begin
    ifu_iccm_rd_ecc_single_err_f = 1'h0;
  end
  if (reset) begin
    iccm_repair_state_d1 = 1'h0;
  end
  if (reset) begin
    dbg_halt_req_held = 1'h0;
  end
  if (reset) begin
    trigger_hit_dmode_r_d1 = 1'h0;
  end
  if (reset) begin
    ebreak_to_debug_mode_r_d1 = 1'h0;
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
    dbg_tlu_halted_f = 1'h0;
  end
  if (reset) begin
    pmu_fw_tlu_halted_f = 1'h0;
  end
  if (reset) begin
    lsu_pmu_load_external_r = 1'h0;
  end
  if (reset) begin
    lsu_pmu_store_external_r = 1'h0;
  end
  if (reset) begin
    tlu_flush_lower_r_d1 = 1'h0;
  end
  if (reset) begin
    _T_52 = 1'h0;
  end
  if (reset) begin
    internal_dbg_halt_mode_f2 = 1'h0;
  end
  if (reset) begin
    _T_59 = 1'h0;
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
    mpc_debug_run_ack_f = 1'h0;
  end
  if (reset) begin
    debug_brkpt_status_f = 1'h0;
  end
  if (reset) begin
    mpc_debug_halt_ack_f = 1'h0;
  end
  if (reset) begin
    dbg_run_state_f = 1'h0;
  end
  if (reset) begin
    _T_143 = 1'h0;
  end
  if (reset) begin
    request_debug_mode_r_d1 = 1'h0;
  end
  if (reset) begin
    request_debug_mode_done_f = 1'h0;
  end
  if (reset) begin
    _T_286 = 1'h0;
  end
  if (reset) begin
    dec_tlu_wr_pause_r_d1 = 1'h0;
  end
  if (reset) begin
    _T_512 = 1'h0;
  end
  if (reset) begin
    _T_516 = 1'h0;
  end
  if (reset) begin
    _T_520 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_halt_state_f <= 1'h0;
    end else if (_T_135) begin
      dbg_halt_state_f <= dbg_halt_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_halt_state_f <= 1'h0;
    end else if (_T_119) begin
      mpc_halt_state_f <= mpc_halt_state_ns;
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
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_mode_status <= 1'h0;
    end else if (_T_38) begin
      debug_mode_status <= internal_dbg_halt_mode;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      i_cpu_run_req_d1_raw <= 1'h0;
    end else if (_T_507) begin
      i_cpu_run_req_d1_raw <= i_cpu_run_req_sync_qual;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_int_delayed <= 1'h0;
    end else if (_T_61) begin
      nmi_int_delayed <= nmi_int_sync;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_int_detected_f <= 1'h0;
    end else if (_T_64) begin
      nmi_int_detected_f <= nmi_int_detected;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      int_timer0_int_hold_f <= 1'h0;
    end else if (_T_534) begin
      int_timer0_int_hold_f <= int_timer0_int_hold;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      int_timer1_int_hold_f <= 1'h0;
    end else if (_T_538) begin
      int_timer1_int_hold_f <= int_timer1_int_hold;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      i_cpu_halt_req_d1 <= 1'h0;
    end else if (_T_504) begin
      i_cpu_halt_req_d1 <= i_cpu_halt_req_sync_qual;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      reset_detect <= 1'h0;
    end else begin
      reset_detect <= _T_104 | reset_detect;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      reset_detected <= 1'h0;
    end else if (_T_107) begin
      reset_detected <= reset_detect;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_pause_state_f <= 1'h0;
    end else if (_T_311) begin
      dec_pause_state_f <= io_dec_pause_state;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_halt_req_f <= 1'h0;
    end else if (_T_289) begin
      debug_halt_req_f <= debug_halt_req_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      pmu_fw_halt_req_f <= 1'h0;
    end else if (_T_526) begin
      pmu_fw_halt_req_f <= pmu_fw_halt_req_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      halt_taken_f <= 1'h0;
    end else if (_T_269) begin
      halt_taken_f <= halt_taken;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      ifu_ic_error_start_f <= 1'h0;
    end else if (_T_24) begin
      ifu_ic_error_start_f <= io_tlu_mem_ifu_ic_error_start;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_resume_req_f_raw <= 1'h0;
    end else if (_T_293) begin
      debug_resume_req_f_raw <= debug_resume_req;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dcsr_single_step_running_f <= 1'h0;
    end else if (_T_323) begin
      dcsr_single_step_running_f <= dcsr_single_step_running;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dcsr_single_step_done_f <= 1'h0;
    end else if (_T_301) begin
      dcsr_single_step_done_f <= dcsr_single_step_done;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      internal_pmu_fw_halt_mode_f <= 1'h0;
    end else if (_T_522) begin
      internal_pmu_fw_halt_mode_f <= internal_pmu_fw_halt_mode;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      ifu_iccm_rd_ecc_single_err_f <= 1'h0;
    end else if (_T_27) begin
      ifu_iccm_rd_ecc_single_err_f <= io_tlu_mem_ifu_iccm_rd_ecc_single_err;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      iccm_repair_state_d1 <= 1'h0;
    end else if (_T_30) begin
      iccm_repair_state_d1 <= iccm_repair_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_halt_req_held <= 1'h0;
    end else if (_T_331) begin
      dbg_halt_req_held <= dbg_halt_req_held_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      trigger_hit_dmode_r_d1 <= 1'h0;
    end else if (_T_297) begin
      trigger_hit_dmode_r_d1 <= trigger_hit_dmode_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ebreak_to_debug_mode_r_d1 <= 1'h0;
    end else begin
      ebreak_to_debug_mode_r_d1 <= _T_704 & _T_590;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_idle_any_f <= 1'h0;
    end else if (_T_273) begin
      lsu_idle_any_f <= io_lsu_idle_any;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      ifu_miss_state_idle_f <= 1'h0;
    end else if (_T_277) begin
      ifu_miss_state_idle_f <= io_tlu_mem_ifu_miss_state_idle;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_halt_req_d1 <= 1'h0;
    end else if (_T_305) begin
      debug_halt_req_d1 <= debug_halt_req;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_tlu_flush_noredir_r_d1 <= 1'h0;
    end else if (_T_265) begin
      dec_tlu_flush_noredir_r_d1 <= io_tlu_ifc_dec_tlu_flush_noredir_wb;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_tlu_flush_pause_r_d1 <= 1'h0;
    end else if (_T_327) begin
      dec_tlu_flush_pause_r_d1 <= io_dec_tlu_flush_pause_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_tlu_halted_f <= 1'h0;
    end else if (_T_281) begin
      dbg_tlu_halted_f <= dbg_tlu_halted;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      pmu_fw_tlu_halted_f <= 1'h0;
    end else if (_T_530) begin
      pmu_fw_tlu_halted_f <= pmu_fw_tlu_halted;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_load_external_r <= 1'h0;
    end else if (_T_41) begin
      lsu_pmu_load_external_r <= io_lsu_tlu_lsu_pmu_load_external_m;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      lsu_pmu_store_external_r <= 1'h0;
    end else if (_T_44) begin
      lsu_pmu_store_external_r <= io_lsu_tlu_lsu_pmu_store_external_m;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      tlu_flush_lower_r_d1 <= 1'h0;
    end else if (_T_47) begin
      tlu_flush_lower_r_d1 <= tlu_flush_lower_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_52 <= 1'h0;
    end else if (_T_51) begin
      _T_52 <= tlu_i0_kill_writeb_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      internal_dbg_halt_mode_f2 <= 1'h0;
    end else if (_T_54) begin
      internal_dbg_halt_mode_f2 <= debug_mode_status;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_59 <= 1'h0;
    end else if (_T_58) begin
      _T_59 <= force_halt;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_lsu_load_type_f <= 1'h0;
    end else if (_T_67) begin
      nmi_lsu_load_type_f <= nmi_lsu_load_type;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      nmi_lsu_store_type_f <= 1'h0;
    end else if (_T_70) begin
      nmi_lsu_store_type_f <= nmi_lsu_store_type;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_halt_req_sync_f <= 1'h0;
    end else if (_T_112) begin
      mpc_debug_halt_req_sync_f <= mpc_debug_halt_req_sync;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_run_req_sync_f <= 1'h0;
    end else if (_T_115) begin
      mpc_debug_run_req_sync_f <= mpc_debug_run_req_sync;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_run_state_f <= 1'h0;
    end else if (_T_122) begin
      mpc_run_state_f <= mpc_run_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_run_ack_f <= 1'h0;
    end else if (_T_131) begin
      mpc_debug_run_ack_f <= mpc_debug_run_ack_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      debug_brkpt_status_f <= 1'h0;
    end else if (_T_125) begin
      debug_brkpt_status_f <= debug_brkpt_status_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      mpc_debug_halt_ack_f <= 1'h0;
    end else if (_T_128) begin
      mpc_debug_halt_ack_f <= mpc_debug_halt_ack_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dbg_run_state_f <= 1'h0;
    end else if (_T_138) begin
      dbg_run_state_f <= dbg_run_state_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_143 <= 1'h0;
    end else if (_T_142) begin
      _T_143 <= _T_1;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      request_debug_mode_r_d1 <= 1'h0;
    end else if (_T_315) begin
      request_debug_mode_r_d1 <= request_debug_mode_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      request_debug_mode_done_f <= 1'h0;
    end else if (_T_319) begin
      request_debug_mode_done_f <= request_debug_mode_done;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_286 <= 1'h0;
    end else if (_T_285) begin
      _T_286 <= resume_ack_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dec_tlu_wr_pause_r_d1 <= 1'h0;
    end else if (_T_308) begin
      dec_tlu_wr_pause_r_d1 <= io_dec_tlu_wr_pause_r;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_512 <= 1'h0;
    end else if (_T_511) begin
      _T_512 <= cpu_halt_status;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_516 <= 1'h0;
    end else if (_T_515) begin
      _T_516 <= cpu_halt_ack;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_520 <= 1'h0;
    end else if (_T_519) begin
      _T_520 <= cpu_run_ack;
    end
  end
endmodule
module dec_trigger(
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_pkt,
  input         io_trigger_pkt_any_0_execute,
  input         io_trigger_pkt_any_0_m,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_pkt,
  input         io_trigger_pkt_any_1_execute,
  input         io_trigger_pkt_any_1_m,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_pkt,
  input         io_trigger_pkt_any_2_execute,
  input         io_trigger_pkt_any_2_m,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_pkt,
  input         io_trigger_pkt_any_3_execute,
  input         io_trigger_pkt_any_3_m,
  input  [31:0] io_trigger_pkt_any_3_tdata2,
  input  [30:0] io_dec_i0_pc_d,
  output [3:0]  io_dec_i0_trigger_match_d
);
  wire  _T = ~io_trigger_pkt_any_0_select; // @[dec_trigger.scala 14:63]
  wire  _T_1 = _T & io_trigger_pkt_any_0_execute; // @[dec_trigger.scala 14:93]
  wire [9:0] _T_11 = {_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [18:0] _T_20 = {_T_11,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [27:0] _T_29 = {_T_20,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [31:0] _T_33 = {_T_29,_T_1,_T_1,_T_1,_T_1}; // @[Cat.scala 29:58]
  wire [31:0] _T_35 = {io_dec_i0_pc_d,io_trigger_pkt_any_0_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_0 = _T_33 & _T_35; // @[dec_trigger.scala 14:127]
  wire  _T_37 = ~io_trigger_pkt_any_1_select; // @[dec_trigger.scala 14:63]
  wire  _T_38 = _T_37 & io_trigger_pkt_any_1_execute; // @[dec_trigger.scala 14:93]
  wire [9:0] _T_48 = {_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [18:0] _T_57 = {_T_48,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [27:0] _T_66 = {_T_57,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [31:0] _T_70 = {_T_66,_T_38,_T_38,_T_38,_T_38}; // @[Cat.scala 29:58]
  wire [31:0] _T_72 = {io_dec_i0_pc_d,io_trigger_pkt_any_1_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_1 = _T_70 & _T_72; // @[dec_trigger.scala 14:127]
  wire  _T_74 = ~io_trigger_pkt_any_2_select; // @[dec_trigger.scala 14:63]
  wire  _T_75 = _T_74 & io_trigger_pkt_any_2_execute; // @[dec_trigger.scala 14:93]
  wire [9:0] _T_85 = {_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [18:0] _T_94 = {_T_85,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [27:0] _T_103 = {_T_94,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [31:0] _T_107 = {_T_103,_T_75,_T_75,_T_75,_T_75}; // @[Cat.scala 29:58]
  wire [31:0] _T_109 = {io_dec_i0_pc_d,io_trigger_pkt_any_2_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_2 = _T_107 & _T_109; // @[dec_trigger.scala 14:127]
  wire  _T_111 = ~io_trigger_pkt_any_3_select; // @[dec_trigger.scala 14:63]
  wire  _T_112 = _T_111 & io_trigger_pkt_any_3_execute; // @[dec_trigger.scala 14:93]
  wire [9:0] _T_122 = {_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [18:0] _T_131 = {_T_122,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [27:0] _T_140 = {_T_131,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [31:0] _T_144 = {_T_140,_T_112,_T_112,_T_112,_T_112}; // @[Cat.scala 29:58]
  wire [31:0] _T_146 = {io_dec_i0_pc_d,io_trigger_pkt_any_3_tdata2[0]}; // @[Cat.scala 29:58]
  wire [31:0] dec_i0_match_data_3 = _T_144 & _T_146; // @[dec_trigger.scala 14:127]
  wire  _T_148 = io_trigger_pkt_any_0_execute & io_trigger_pkt_any_0_m; // @[dec_trigger.scala 15:83]
  wire  _T_151 = &io_trigger_pkt_any_0_tdata2; // @[lib.scala 101:45]
  wire  _T_152 = ~_T_151; // @[lib.scala 101:39]
  wire  _T_153 = io_trigger_pkt_any_0_match_pkt & _T_152; // @[lib.scala 101:37]
  wire  _T_156 = io_trigger_pkt_any_0_tdata2[0] == dec_i0_match_data_0[0]; // @[lib.scala 102:52]
  wire  _T_157 = _T_153 | _T_156; // @[lib.scala 102:41]
  wire  _T_159 = &io_trigger_pkt_any_0_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_160 = _T_159 & _T_153; // @[lib.scala 104:41]
  wire  _T_163 = io_trigger_pkt_any_0_tdata2[1] == dec_i0_match_data_0[1]; // @[lib.scala 104:78]
  wire  _T_164 = _T_160 | _T_163; // @[lib.scala 104:23]
  wire  _T_166 = &io_trigger_pkt_any_0_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_167 = _T_166 & _T_153; // @[lib.scala 104:41]
  wire  _T_170 = io_trigger_pkt_any_0_tdata2[2] == dec_i0_match_data_0[2]; // @[lib.scala 104:78]
  wire  _T_171 = _T_167 | _T_170; // @[lib.scala 104:23]
  wire  _T_173 = &io_trigger_pkt_any_0_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_174 = _T_173 & _T_153; // @[lib.scala 104:41]
  wire  _T_177 = io_trigger_pkt_any_0_tdata2[3] == dec_i0_match_data_0[3]; // @[lib.scala 104:78]
  wire  _T_178 = _T_174 | _T_177; // @[lib.scala 104:23]
  wire  _T_180 = &io_trigger_pkt_any_0_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_181 = _T_180 & _T_153; // @[lib.scala 104:41]
  wire  _T_184 = io_trigger_pkt_any_0_tdata2[4] == dec_i0_match_data_0[4]; // @[lib.scala 104:78]
  wire  _T_185 = _T_181 | _T_184; // @[lib.scala 104:23]
  wire  _T_187 = &io_trigger_pkt_any_0_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_188 = _T_187 & _T_153; // @[lib.scala 104:41]
  wire  _T_191 = io_trigger_pkt_any_0_tdata2[5] == dec_i0_match_data_0[5]; // @[lib.scala 104:78]
  wire  _T_192 = _T_188 | _T_191; // @[lib.scala 104:23]
  wire  _T_194 = &io_trigger_pkt_any_0_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_195 = _T_194 & _T_153; // @[lib.scala 104:41]
  wire  _T_198 = io_trigger_pkt_any_0_tdata2[6] == dec_i0_match_data_0[6]; // @[lib.scala 104:78]
  wire  _T_199 = _T_195 | _T_198; // @[lib.scala 104:23]
  wire  _T_201 = &io_trigger_pkt_any_0_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_202 = _T_201 & _T_153; // @[lib.scala 104:41]
  wire  _T_205 = io_trigger_pkt_any_0_tdata2[7] == dec_i0_match_data_0[7]; // @[lib.scala 104:78]
  wire  _T_206 = _T_202 | _T_205; // @[lib.scala 104:23]
  wire  _T_208 = &io_trigger_pkt_any_0_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_209 = _T_208 & _T_153; // @[lib.scala 104:41]
  wire  _T_212 = io_trigger_pkt_any_0_tdata2[8] == dec_i0_match_data_0[8]; // @[lib.scala 104:78]
  wire  _T_213 = _T_209 | _T_212; // @[lib.scala 104:23]
  wire  _T_215 = &io_trigger_pkt_any_0_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_216 = _T_215 & _T_153; // @[lib.scala 104:41]
  wire  _T_219 = io_trigger_pkt_any_0_tdata2[9] == dec_i0_match_data_0[9]; // @[lib.scala 104:78]
  wire  _T_220 = _T_216 | _T_219; // @[lib.scala 104:23]
  wire  _T_222 = &io_trigger_pkt_any_0_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_223 = _T_222 & _T_153; // @[lib.scala 104:41]
  wire  _T_226 = io_trigger_pkt_any_0_tdata2[10] == dec_i0_match_data_0[10]; // @[lib.scala 104:78]
  wire  _T_227 = _T_223 | _T_226; // @[lib.scala 104:23]
  wire  _T_229 = &io_trigger_pkt_any_0_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_230 = _T_229 & _T_153; // @[lib.scala 104:41]
  wire  _T_233 = io_trigger_pkt_any_0_tdata2[11] == dec_i0_match_data_0[11]; // @[lib.scala 104:78]
  wire  _T_234 = _T_230 | _T_233; // @[lib.scala 104:23]
  wire  _T_236 = &io_trigger_pkt_any_0_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_237 = _T_236 & _T_153; // @[lib.scala 104:41]
  wire  _T_240 = io_trigger_pkt_any_0_tdata2[12] == dec_i0_match_data_0[12]; // @[lib.scala 104:78]
  wire  _T_241 = _T_237 | _T_240; // @[lib.scala 104:23]
  wire  _T_243 = &io_trigger_pkt_any_0_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_244 = _T_243 & _T_153; // @[lib.scala 104:41]
  wire  _T_247 = io_trigger_pkt_any_0_tdata2[13] == dec_i0_match_data_0[13]; // @[lib.scala 104:78]
  wire  _T_248 = _T_244 | _T_247; // @[lib.scala 104:23]
  wire  _T_250 = &io_trigger_pkt_any_0_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_251 = _T_250 & _T_153; // @[lib.scala 104:41]
  wire  _T_254 = io_trigger_pkt_any_0_tdata2[14] == dec_i0_match_data_0[14]; // @[lib.scala 104:78]
  wire  _T_255 = _T_251 | _T_254; // @[lib.scala 104:23]
  wire  _T_257 = &io_trigger_pkt_any_0_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_258 = _T_257 & _T_153; // @[lib.scala 104:41]
  wire  _T_261 = io_trigger_pkt_any_0_tdata2[15] == dec_i0_match_data_0[15]; // @[lib.scala 104:78]
  wire  _T_262 = _T_258 | _T_261; // @[lib.scala 104:23]
  wire  _T_264 = &io_trigger_pkt_any_0_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_265 = _T_264 & _T_153; // @[lib.scala 104:41]
  wire  _T_268 = io_trigger_pkt_any_0_tdata2[16] == dec_i0_match_data_0[16]; // @[lib.scala 104:78]
  wire  _T_269 = _T_265 | _T_268; // @[lib.scala 104:23]
  wire  _T_271 = &io_trigger_pkt_any_0_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_272 = _T_271 & _T_153; // @[lib.scala 104:41]
  wire  _T_275 = io_trigger_pkt_any_0_tdata2[17] == dec_i0_match_data_0[17]; // @[lib.scala 104:78]
  wire  _T_276 = _T_272 | _T_275; // @[lib.scala 104:23]
  wire  _T_278 = &io_trigger_pkt_any_0_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_279 = _T_278 & _T_153; // @[lib.scala 104:41]
  wire  _T_282 = io_trigger_pkt_any_0_tdata2[18] == dec_i0_match_data_0[18]; // @[lib.scala 104:78]
  wire  _T_283 = _T_279 | _T_282; // @[lib.scala 104:23]
  wire  _T_285 = &io_trigger_pkt_any_0_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_286 = _T_285 & _T_153; // @[lib.scala 104:41]
  wire  _T_289 = io_trigger_pkt_any_0_tdata2[19] == dec_i0_match_data_0[19]; // @[lib.scala 104:78]
  wire  _T_290 = _T_286 | _T_289; // @[lib.scala 104:23]
  wire  _T_292 = &io_trigger_pkt_any_0_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_293 = _T_292 & _T_153; // @[lib.scala 104:41]
  wire  _T_296 = io_trigger_pkt_any_0_tdata2[20] == dec_i0_match_data_0[20]; // @[lib.scala 104:78]
  wire  _T_297 = _T_293 | _T_296; // @[lib.scala 104:23]
  wire  _T_299 = &io_trigger_pkt_any_0_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_300 = _T_299 & _T_153; // @[lib.scala 104:41]
  wire  _T_303 = io_trigger_pkt_any_0_tdata2[21] == dec_i0_match_data_0[21]; // @[lib.scala 104:78]
  wire  _T_304 = _T_300 | _T_303; // @[lib.scala 104:23]
  wire  _T_306 = &io_trigger_pkt_any_0_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_307 = _T_306 & _T_153; // @[lib.scala 104:41]
  wire  _T_310 = io_trigger_pkt_any_0_tdata2[22] == dec_i0_match_data_0[22]; // @[lib.scala 104:78]
  wire  _T_311 = _T_307 | _T_310; // @[lib.scala 104:23]
  wire  _T_313 = &io_trigger_pkt_any_0_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_314 = _T_313 & _T_153; // @[lib.scala 104:41]
  wire  _T_317 = io_trigger_pkt_any_0_tdata2[23] == dec_i0_match_data_0[23]; // @[lib.scala 104:78]
  wire  _T_318 = _T_314 | _T_317; // @[lib.scala 104:23]
  wire  _T_320 = &io_trigger_pkt_any_0_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_321 = _T_320 & _T_153; // @[lib.scala 104:41]
  wire  _T_324 = io_trigger_pkt_any_0_tdata2[24] == dec_i0_match_data_0[24]; // @[lib.scala 104:78]
  wire  _T_325 = _T_321 | _T_324; // @[lib.scala 104:23]
  wire  _T_327 = &io_trigger_pkt_any_0_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_328 = _T_327 & _T_153; // @[lib.scala 104:41]
  wire  _T_331 = io_trigger_pkt_any_0_tdata2[25] == dec_i0_match_data_0[25]; // @[lib.scala 104:78]
  wire  _T_332 = _T_328 | _T_331; // @[lib.scala 104:23]
  wire  _T_334 = &io_trigger_pkt_any_0_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_335 = _T_334 & _T_153; // @[lib.scala 104:41]
  wire  _T_338 = io_trigger_pkt_any_0_tdata2[26] == dec_i0_match_data_0[26]; // @[lib.scala 104:78]
  wire  _T_339 = _T_335 | _T_338; // @[lib.scala 104:23]
  wire  _T_341 = &io_trigger_pkt_any_0_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_342 = _T_341 & _T_153; // @[lib.scala 104:41]
  wire  _T_345 = io_trigger_pkt_any_0_tdata2[27] == dec_i0_match_data_0[27]; // @[lib.scala 104:78]
  wire  _T_346 = _T_342 | _T_345; // @[lib.scala 104:23]
  wire  _T_348 = &io_trigger_pkt_any_0_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_349 = _T_348 & _T_153; // @[lib.scala 104:41]
  wire  _T_352 = io_trigger_pkt_any_0_tdata2[28] == dec_i0_match_data_0[28]; // @[lib.scala 104:78]
  wire  _T_353 = _T_349 | _T_352; // @[lib.scala 104:23]
  wire  _T_355 = &io_trigger_pkt_any_0_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_356 = _T_355 & _T_153; // @[lib.scala 104:41]
  wire  _T_359 = io_trigger_pkt_any_0_tdata2[29] == dec_i0_match_data_0[29]; // @[lib.scala 104:78]
  wire  _T_360 = _T_356 | _T_359; // @[lib.scala 104:23]
  wire  _T_362 = &io_trigger_pkt_any_0_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_363 = _T_362 & _T_153; // @[lib.scala 104:41]
  wire  _T_366 = io_trigger_pkt_any_0_tdata2[30] == dec_i0_match_data_0[30]; // @[lib.scala 104:78]
  wire  _T_367 = _T_363 | _T_366; // @[lib.scala 104:23]
  wire  _T_369 = &io_trigger_pkt_any_0_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_370 = _T_369 & _T_153; // @[lib.scala 104:41]
  wire  _T_373 = io_trigger_pkt_any_0_tdata2[31] == dec_i0_match_data_0[31]; // @[lib.scala 104:78]
  wire  _T_374 = _T_370 | _T_373; // @[lib.scala 104:23]
  wire [7:0] _T_381 = {_T_206,_T_199,_T_192,_T_185,_T_178,_T_171,_T_164,_T_157}; // @[lib.scala 105:14]
  wire [15:0] _T_389 = {_T_262,_T_255,_T_248,_T_241,_T_234,_T_227,_T_220,_T_213,_T_381}; // @[lib.scala 105:14]
  wire [7:0] _T_396 = {_T_318,_T_311,_T_304,_T_297,_T_290,_T_283,_T_276,_T_269}; // @[lib.scala 105:14]
  wire [31:0] _T_405 = {_T_374,_T_367,_T_360,_T_353,_T_346,_T_339,_T_332,_T_325,_T_396,_T_389}; // @[lib.scala 105:14]
  wire  _T_406 = &_T_405; // @[lib.scala 105:25]
  wire  _T_407 = _T_148 & _T_406; // @[dec_trigger.scala 15:109]
  wire  _T_408 = io_trigger_pkt_any_1_execute & io_trigger_pkt_any_1_m; // @[dec_trigger.scala 15:83]
  wire  _T_411 = &io_trigger_pkt_any_1_tdata2; // @[lib.scala 101:45]
  wire  _T_412 = ~_T_411; // @[lib.scala 101:39]
  wire  _T_413 = io_trigger_pkt_any_1_match_pkt & _T_412; // @[lib.scala 101:37]
  wire  _T_416 = io_trigger_pkt_any_1_tdata2[0] == dec_i0_match_data_1[0]; // @[lib.scala 102:52]
  wire  _T_417 = _T_413 | _T_416; // @[lib.scala 102:41]
  wire  _T_419 = &io_trigger_pkt_any_1_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_420 = _T_419 & _T_413; // @[lib.scala 104:41]
  wire  _T_423 = io_trigger_pkt_any_1_tdata2[1] == dec_i0_match_data_1[1]; // @[lib.scala 104:78]
  wire  _T_424 = _T_420 | _T_423; // @[lib.scala 104:23]
  wire  _T_426 = &io_trigger_pkt_any_1_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_427 = _T_426 & _T_413; // @[lib.scala 104:41]
  wire  _T_430 = io_trigger_pkt_any_1_tdata2[2] == dec_i0_match_data_1[2]; // @[lib.scala 104:78]
  wire  _T_431 = _T_427 | _T_430; // @[lib.scala 104:23]
  wire  _T_433 = &io_trigger_pkt_any_1_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_434 = _T_433 & _T_413; // @[lib.scala 104:41]
  wire  _T_437 = io_trigger_pkt_any_1_tdata2[3] == dec_i0_match_data_1[3]; // @[lib.scala 104:78]
  wire  _T_438 = _T_434 | _T_437; // @[lib.scala 104:23]
  wire  _T_440 = &io_trigger_pkt_any_1_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_441 = _T_440 & _T_413; // @[lib.scala 104:41]
  wire  _T_444 = io_trigger_pkt_any_1_tdata2[4] == dec_i0_match_data_1[4]; // @[lib.scala 104:78]
  wire  _T_445 = _T_441 | _T_444; // @[lib.scala 104:23]
  wire  _T_447 = &io_trigger_pkt_any_1_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_448 = _T_447 & _T_413; // @[lib.scala 104:41]
  wire  _T_451 = io_trigger_pkt_any_1_tdata2[5] == dec_i0_match_data_1[5]; // @[lib.scala 104:78]
  wire  _T_452 = _T_448 | _T_451; // @[lib.scala 104:23]
  wire  _T_454 = &io_trigger_pkt_any_1_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_455 = _T_454 & _T_413; // @[lib.scala 104:41]
  wire  _T_458 = io_trigger_pkt_any_1_tdata2[6] == dec_i0_match_data_1[6]; // @[lib.scala 104:78]
  wire  _T_459 = _T_455 | _T_458; // @[lib.scala 104:23]
  wire  _T_461 = &io_trigger_pkt_any_1_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_462 = _T_461 & _T_413; // @[lib.scala 104:41]
  wire  _T_465 = io_trigger_pkt_any_1_tdata2[7] == dec_i0_match_data_1[7]; // @[lib.scala 104:78]
  wire  _T_466 = _T_462 | _T_465; // @[lib.scala 104:23]
  wire  _T_468 = &io_trigger_pkt_any_1_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_469 = _T_468 & _T_413; // @[lib.scala 104:41]
  wire  _T_472 = io_trigger_pkt_any_1_tdata2[8] == dec_i0_match_data_1[8]; // @[lib.scala 104:78]
  wire  _T_473 = _T_469 | _T_472; // @[lib.scala 104:23]
  wire  _T_475 = &io_trigger_pkt_any_1_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_476 = _T_475 & _T_413; // @[lib.scala 104:41]
  wire  _T_479 = io_trigger_pkt_any_1_tdata2[9] == dec_i0_match_data_1[9]; // @[lib.scala 104:78]
  wire  _T_480 = _T_476 | _T_479; // @[lib.scala 104:23]
  wire  _T_482 = &io_trigger_pkt_any_1_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_483 = _T_482 & _T_413; // @[lib.scala 104:41]
  wire  _T_486 = io_trigger_pkt_any_1_tdata2[10] == dec_i0_match_data_1[10]; // @[lib.scala 104:78]
  wire  _T_487 = _T_483 | _T_486; // @[lib.scala 104:23]
  wire  _T_489 = &io_trigger_pkt_any_1_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_490 = _T_489 & _T_413; // @[lib.scala 104:41]
  wire  _T_493 = io_trigger_pkt_any_1_tdata2[11] == dec_i0_match_data_1[11]; // @[lib.scala 104:78]
  wire  _T_494 = _T_490 | _T_493; // @[lib.scala 104:23]
  wire  _T_496 = &io_trigger_pkt_any_1_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_497 = _T_496 & _T_413; // @[lib.scala 104:41]
  wire  _T_500 = io_trigger_pkt_any_1_tdata2[12] == dec_i0_match_data_1[12]; // @[lib.scala 104:78]
  wire  _T_501 = _T_497 | _T_500; // @[lib.scala 104:23]
  wire  _T_503 = &io_trigger_pkt_any_1_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_504 = _T_503 & _T_413; // @[lib.scala 104:41]
  wire  _T_507 = io_trigger_pkt_any_1_tdata2[13] == dec_i0_match_data_1[13]; // @[lib.scala 104:78]
  wire  _T_508 = _T_504 | _T_507; // @[lib.scala 104:23]
  wire  _T_510 = &io_trigger_pkt_any_1_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_511 = _T_510 & _T_413; // @[lib.scala 104:41]
  wire  _T_514 = io_trigger_pkt_any_1_tdata2[14] == dec_i0_match_data_1[14]; // @[lib.scala 104:78]
  wire  _T_515 = _T_511 | _T_514; // @[lib.scala 104:23]
  wire  _T_517 = &io_trigger_pkt_any_1_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_518 = _T_517 & _T_413; // @[lib.scala 104:41]
  wire  _T_521 = io_trigger_pkt_any_1_tdata2[15] == dec_i0_match_data_1[15]; // @[lib.scala 104:78]
  wire  _T_522 = _T_518 | _T_521; // @[lib.scala 104:23]
  wire  _T_524 = &io_trigger_pkt_any_1_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_525 = _T_524 & _T_413; // @[lib.scala 104:41]
  wire  _T_528 = io_trigger_pkt_any_1_tdata2[16] == dec_i0_match_data_1[16]; // @[lib.scala 104:78]
  wire  _T_529 = _T_525 | _T_528; // @[lib.scala 104:23]
  wire  _T_531 = &io_trigger_pkt_any_1_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_532 = _T_531 & _T_413; // @[lib.scala 104:41]
  wire  _T_535 = io_trigger_pkt_any_1_tdata2[17] == dec_i0_match_data_1[17]; // @[lib.scala 104:78]
  wire  _T_536 = _T_532 | _T_535; // @[lib.scala 104:23]
  wire  _T_538 = &io_trigger_pkt_any_1_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_539 = _T_538 & _T_413; // @[lib.scala 104:41]
  wire  _T_542 = io_trigger_pkt_any_1_tdata2[18] == dec_i0_match_data_1[18]; // @[lib.scala 104:78]
  wire  _T_543 = _T_539 | _T_542; // @[lib.scala 104:23]
  wire  _T_545 = &io_trigger_pkt_any_1_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_546 = _T_545 & _T_413; // @[lib.scala 104:41]
  wire  _T_549 = io_trigger_pkt_any_1_tdata2[19] == dec_i0_match_data_1[19]; // @[lib.scala 104:78]
  wire  _T_550 = _T_546 | _T_549; // @[lib.scala 104:23]
  wire  _T_552 = &io_trigger_pkt_any_1_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_553 = _T_552 & _T_413; // @[lib.scala 104:41]
  wire  _T_556 = io_trigger_pkt_any_1_tdata2[20] == dec_i0_match_data_1[20]; // @[lib.scala 104:78]
  wire  _T_557 = _T_553 | _T_556; // @[lib.scala 104:23]
  wire  _T_559 = &io_trigger_pkt_any_1_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_560 = _T_559 & _T_413; // @[lib.scala 104:41]
  wire  _T_563 = io_trigger_pkt_any_1_tdata2[21] == dec_i0_match_data_1[21]; // @[lib.scala 104:78]
  wire  _T_564 = _T_560 | _T_563; // @[lib.scala 104:23]
  wire  _T_566 = &io_trigger_pkt_any_1_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_567 = _T_566 & _T_413; // @[lib.scala 104:41]
  wire  _T_570 = io_trigger_pkt_any_1_tdata2[22] == dec_i0_match_data_1[22]; // @[lib.scala 104:78]
  wire  _T_571 = _T_567 | _T_570; // @[lib.scala 104:23]
  wire  _T_573 = &io_trigger_pkt_any_1_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_574 = _T_573 & _T_413; // @[lib.scala 104:41]
  wire  _T_577 = io_trigger_pkt_any_1_tdata2[23] == dec_i0_match_data_1[23]; // @[lib.scala 104:78]
  wire  _T_578 = _T_574 | _T_577; // @[lib.scala 104:23]
  wire  _T_580 = &io_trigger_pkt_any_1_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_581 = _T_580 & _T_413; // @[lib.scala 104:41]
  wire  _T_584 = io_trigger_pkt_any_1_tdata2[24] == dec_i0_match_data_1[24]; // @[lib.scala 104:78]
  wire  _T_585 = _T_581 | _T_584; // @[lib.scala 104:23]
  wire  _T_587 = &io_trigger_pkt_any_1_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_588 = _T_587 & _T_413; // @[lib.scala 104:41]
  wire  _T_591 = io_trigger_pkt_any_1_tdata2[25] == dec_i0_match_data_1[25]; // @[lib.scala 104:78]
  wire  _T_592 = _T_588 | _T_591; // @[lib.scala 104:23]
  wire  _T_594 = &io_trigger_pkt_any_1_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_595 = _T_594 & _T_413; // @[lib.scala 104:41]
  wire  _T_598 = io_trigger_pkt_any_1_tdata2[26] == dec_i0_match_data_1[26]; // @[lib.scala 104:78]
  wire  _T_599 = _T_595 | _T_598; // @[lib.scala 104:23]
  wire  _T_601 = &io_trigger_pkt_any_1_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_602 = _T_601 & _T_413; // @[lib.scala 104:41]
  wire  _T_605 = io_trigger_pkt_any_1_tdata2[27] == dec_i0_match_data_1[27]; // @[lib.scala 104:78]
  wire  _T_606 = _T_602 | _T_605; // @[lib.scala 104:23]
  wire  _T_608 = &io_trigger_pkt_any_1_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_609 = _T_608 & _T_413; // @[lib.scala 104:41]
  wire  _T_612 = io_trigger_pkt_any_1_tdata2[28] == dec_i0_match_data_1[28]; // @[lib.scala 104:78]
  wire  _T_613 = _T_609 | _T_612; // @[lib.scala 104:23]
  wire  _T_615 = &io_trigger_pkt_any_1_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_616 = _T_615 & _T_413; // @[lib.scala 104:41]
  wire  _T_619 = io_trigger_pkt_any_1_tdata2[29] == dec_i0_match_data_1[29]; // @[lib.scala 104:78]
  wire  _T_620 = _T_616 | _T_619; // @[lib.scala 104:23]
  wire  _T_622 = &io_trigger_pkt_any_1_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_623 = _T_622 & _T_413; // @[lib.scala 104:41]
  wire  _T_626 = io_trigger_pkt_any_1_tdata2[30] == dec_i0_match_data_1[30]; // @[lib.scala 104:78]
  wire  _T_627 = _T_623 | _T_626; // @[lib.scala 104:23]
  wire  _T_629 = &io_trigger_pkt_any_1_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_630 = _T_629 & _T_413; // @[lib.scala 104:41]
  wire  _T_633 = io_trigger_pkt_any_1_tdata2[31] == dec_i0_match_data_1[31]; // @[lib.scala 104:78]
  wire  _T_634 = _T_630 | _T_633; // @[lib.scala 104:23]
  wire [7:0] _T_641 = {_T_466,_T_459,_T_452,_T_445,_T_438,_T_431,_T_424,_T_417}; // @[lib.scala 105:14]
  wire [15:0] _T_649 = {_T_522,_T_515,_T_508,_T_501,_T_494,_T_487,_T_480,_T_473,_T_641}; // @[lib.scala 105:14]
  wire [7:0] _T_656 = {_T_578,_T_571,_T_564,_T_557,_T_550,_T_543,_T_536,_T_529}; // @[lib.scala 105:14]
  wire [31:0] _T_665 = {_T_634,_T_627,_T_620,_T_613,_T_606,_T_599,_T_592,_T_585,_T_656,_T_649}; // @[lib.scala 105:14]
  wire  _T_666 = &_T_665; // @[lib.scala 105:25]
  wire  _T_667 = _T_408 & _T_666; // @[dec_trigger.scala 15:109]
  wire  _T_668 = io_trigger_pkt_any_2_execute & io_trigger_pkt_any_2_m; // @[dec_trigger.scala 15:83]
  wire  _T_671 = &io_trigger_pkt_any_2_tdata2; // @[lib.scala 101:45]
  wire  _T_672 = ~_T_671; // @[lib.scala 101:39]
  wire  _T_673 = io_trigger_pkt_any_2_match_pkt & _T_672; // @[lib.scala 101:37]
  wire  _T_676 = io_trigger_pkt_any_2_tdata2[0] == dec_i0_match_data_2[0]; // @[lib.scala 102:52]
  wire  _T_677 = _T_673 | _T_676; // @[lib.scala 102:41]
  wire  _T_679 = &io_trigger_pkt_any_2_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_680 = _T_679 & _T_673; // @[lib.scala 104:41]
  wire  _T_683 = io_trigger_pkt_any_2_tdata2[1] == dec_i0_match_data_2[1]; // @[lib.scala 104:78]
  wire  _T_684 = _T_680 | _T_683; // @[lib.scala 104:23]
  wire  _T_686 = &io_trigger_pkt_any_2_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_687 = _T_686 & _T_673; // @[lib.scala 104:41]
  wire  _T_690 = io_trigger_pkt_any_2_tdata2[2] == dec_i0_match_data_2[2]; // @[lib.scala 104:78]
  wire  _T_691 = _T_687 | _T_690; // @[lib.scala 104:23]
  wire  _T_693 = &io_trigger_pkt_any_2_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_694 = _T_693 & _T_673; // @[lib.scala 104:41]
  wire  _T_697 = io_trigger_pkt_any_2_tdata2[3] == dec_i0_match_data_2[3]; // @[lib.scala 104:78]
  wire  _T_698 = _T_694 | _T_697; // @[lib.scala 104:23]
  wire  _T_700 = &io_trigger_pkt_any_2_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_701 = _T_700 & _T_673; // @[lib.scala 104:41]
  wire  _T_704 = io_trigger_pkt_any_2_tdata2[4] == dec_i0_match_data_2[4]; // @[lib.scala 104:78]
  wire  _T_705 = _T_701 | _T_704; // @[lib.scala 104:23]
  wire  _T_707 = &io_trigger_pkt_any_2_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_708 = _T_707 & _T_673; // @[lib.scala 104:41]
  wire  _T_711 = io_trigger_pkt_any_2_tdata2[5] == dec_i0_match_data_2[5]; // @[lib.scala 104:78]
  wire  _T_712 = _T_708 | _T_711; // @[lib.scala 104:23]
  wire  _T_714 = &io_trigger_pkt_any_2_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_715 = _T_714 & _T_673; // @[lib.scala 104:41]
  wire  _T_718 = io_trigger_pkt_any_2_tdata2[6] == dec_i0_match_data_2[6]; // @[lib.scala 104:78]
  wire  _T_719 = _T_715 | _T_718; // @[lib.scala 104:23]
  wire  _T_721 = &io_trigger_pkt_any_2_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_722 = _T_721 & _T_673; // @[lib.scala 104:41]
  wire  _T_725 = io_trigger_pkt_any_2_tdata2[7] == dec_i0_match_data_2[7]; // @[lib.scala 104:78]
  wire  _T_726 = _T_722 | _T_725; // @[lib.scala 104:23]
  wire  _T_728 = &io_trigger_pkt_any_2_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_729 = _T_728 & _T_673; // @[lib.scala 104:41]
  wire  _T_732 = io_trigger_pkt_any_2_tdata2[8] == dec_i0_match_data_2[8]; // @[lib.scala 104:78]
  wire  _T_733 = _T_729 | _T_732; // @[lib.scala 104:23]
  wire  _T_735 = &io_trigger_pkt_any_2_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_736 = _T_735 & _T_673; // @[lib.scala 104:41]
  wire  _T_739 = io_trigger_pkt_any_2_tdata2[9] == dec_i0_match_data_2[9]; // @[lib.scala 104:78]
  wire  _T_740 = _T_736 | _T_739; // @[lib.scala 104:23]
  wire  _T_742 = &io_trigger_pkt_any_2_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_743 = _T_742 & _T_673; // @[lib.scala 104:41]
  wire  _T_746 = io_trigger_pkt_any_2_tdata2[10] == dec_i0_match_data_2[10]; // @[lib.scala 104:78]
  wire  _T_747 = _T_743 | _T_746; // @[lib.scala 104:23]
  wire  _T_749 = &io_trigger_pkt_any_2_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_750 = _T_749 & _T_673; // @[lib.scala 104:41]
  wire  _T_753 = io_trigger_pkt_any_2_tdata2[11] == dec_i0_match_data_2[11]; // @[lib.scala 104:78]
  wire  _T_754 = _T_750 | _T_753; // @[lib.scala 104:23]
  wire  _T_756 = &io_trigger_pkt_any_2_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_757 = _T_756 & _T_673; // @[lib.scala 104:41]
  wire  _T_760 = io_trigger_pkt_any_2_tdata2[12] == dec_i0_match_data_2[12]; // @[lib.scala 104:78]
  wire  _T_761 = _T_757 | _T_760; // @[lib.scala 104:23]
  wire  _T_763 = &io_trigger_pkt_any_2_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_764 = _T_763 & _T_673; // @[lib.scala 104:41]
  wire  _T_767 = io_trigger_pkt_any_2_tdata2[13] == dec_i0_match_data_2[13]; // @[lib.scala 104:78]
  wire  _T_768 = _T_764 | _T_767; // @[lib.scala 104:23]
  wire  _T_770 = &io_trigger_pkt_any_2_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_771 = _T_770 & _T_673; // @[lib.scala 104:41]
  wire  _T_774 = io_trigger_pkt_any_2_tdata2[14] == dec_i0_match_data_2[14]; // @[lib.scala 104:78]
  wire  _T_775 = _T_771 | _T_774; // @[lib.scala 104:23]
  wire  _T_777 = &io_trigger_pkt_any_2_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_778 = _T_777 & _T_673; // @[lib.scala 104:41]
  wire  _T_781 = io_trigger_pkt_any_2_tdata2[15] == dec_i0_match_data_2[15]; // @[lib.scala 104:78]
  wire  _T_782 = _T_778 | _T_781; // @[lib.scala 104:23]
  wire  _T_784 = &io_trigger_pkt_any_2_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_785 = _T_784 & _T_673; // @[lib.scala 104:41]
  wire  _T_788 = io_trigger_pkt_any_2_tdata2[16] == dec_i0_match_data_2[16]; // @[lib.scala 104:78]
  wire  _T_789 = _T_785 | _T_788; // @[lib.scala 104:23]
  wire  _T_791 = &io_trigger_pkt_any_2_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_792 = _T_791 & _T_673; // @[lib.scala 104:41]
  wire  _T_795 = io_trigger_pkt_any_2_tdata2[17] == dec_i0_match_data_2[17]; // @[lib.scala 104:78]
  wire  _T_796 = _T_792 | _T_795; // @[lib.scala 104:23]
  wire  _T_798 = &io_trigger_pkt_any_2_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_799 = _T_798 & _T_673; // @[lib.scala 104:41]
  wire  _T_802 = io_trigger_pkt_any_2_tdata2[18] == dec_i0_match_data_2[18]; // @[lib.scala 104:78]
  wire  _T_803 = _T_799 | _T_802; // @[lib.scala 104:23]
  wire  _T_805 = &io_trigger_pkt_any_2_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_806 = _T_805 & _T_673; // @[lib.scala 104:41]
  wire  _T_809 = io_trigger_pkt_any_2_tdata2[19] == dec_i0_match_data_2[19]; // @[lib.scala 104:78]
  wire  _T_810 = _T_806 | _T_809; // @[lib.scala 104:23]
  wire  _T_812 = &io_trigger_pkt_any_2_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_813 = _T_812 & _T_673; // @[lib.scala 104:41]
  wire  _T_816 = io_trigger_pkt_any_2_tdata2[20] == dec_i0_match_data_2[20]; // @[lib.scala 104:78]
  wire  _T_817 = _T_813 | _T_816; // @[lib.scala 104:23]
  wire  _T_819 = &io_trigger_pkt_any_2_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_820 = _T_819 & _T_673; // @[lib.scala 104:41]
  wire  _T_823 = io_trigger_pkt_any_2_tdata2[21] == dec_i0_match_data_2[21]; // @[lib.scala 104:78]
  wire  _T_824 = _T_820 | _T_823; // @[lib.scala 104:23]
  wire  _T_826 = &io_trigger_pkt_any_2_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_827 = _T_826 & _T_673; // @[lib.scala 104:41]
  wire  _T_830 = io_trigger_pkt_any_2_tdata2[22] == dec_i0_match_data_2[22]; // @[lib.scala 104:78]
  wire  _T_831 = _T_827 | _T_830; // @[lib.scala 104:23]
  wire  _T_833 = &io_trigger_pkt_any_2_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_834 = _T_833 & _T_673; // @[lib.scala 104:41]
  wire  _T_837 = io_trigger_pkt_any_2_tdata2[23] == dec_i0_match_data_2[23]; // @[lib.scala 104:78]
  wire  _T_838 = _T_834 | _T_837; // @[lib.scala 104:23]
  wire  _T_840 = &io_trigger_pkt_any_2_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_841 = _T_840 & _T_673; // @[lib.scala 104:41]
  wire  _T_844 = io_trigger_pkt_any_2_tdata2[24] == dec_i0_match_data_2[24]; // @[lib.scala 104:78]
  wire  _T_845 = _T_841 | _T_844; // @[lib.scala 104:23]
  wire  _T_847 = &io_trigger_pkt_any_2_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_848 = _T_847 & _T_673; // @[lib.scala 104:41]
  wire  _T_851 = io_trigger_pkt_any_2_tdata2[25] == dec_i0_match_data_2[25]; // @[lib.scala 104:78]
  wire  _T_852 = _T_848 | _T_851; // @[lib.scala 104:23]
  wire  _T_854 = &io_trigger_pkt_any_2_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_855 = _T_854 & _T_673; // @[lib.scala 104:41]
  wire  _T_858 = io_trigger_pkt_any_2_tdata2[26] == dec_i0_match_data_2[26]; // @[lib.scala 104:78]
  wire  _T_859 = _T_855 | _T_858; // @[lib.scala 104:23]
  wire  _T_861 = &io_trigger_pkt_any_2_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_862 = _T_861 & _T_673; // @[lib.scala 104:41]
  wire  _T_865 = io_trigger_pkt_any_2_tdata2[27] == dec_i0_match_data_2[27]; // @[lib.scala 104:78]
  wire  _T_866 = _T_862 | _T_865; // @[lib.scala 104:23]
  wire  _T_868 = &io_trigger_pkt_any_2_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_869 = _T_868 & _T_673; // @[lib.scala 104:41]
  wire  _T_872 = io_trigger_pkt_any_2_tdata2[28] == dec_i0_match_data_2[28]; // @[lib.scala 104:78]
  wire  _T_873 = _T_869 | _T_872; // @[lib.scala 104:23]
  wire  _T_875 = &io_trigger_pkt_any_2_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_876 = _T_875 & _T_673; // @[lib.scala 104:41]
  wire  _T_879 = io_trigger_pkt_any_2_tdata2[29] == dec_i0_match_data_2[29]; // @[lib.scala 104:78]
  wire  _T_880 = _T_876 | _T_879; // @[lib.scala 104:23]
  wire  _T_882 = &io_trigger_pkt_any_2_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_883 = _T_882 & _T_673; // @[lib.scala 104:41]
  wire  _T_886 = io_trigger_pkt_any_2_tdata2[30] == dec_i0_match_data_2[30]; // @[lib.scala 104:78]
  wire  _T_887 = _T_883 | _T_886; // @[lib.scala 104:23]
  wire  _T_889 = &io_trigger_pkt_any_2_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_890 = _T_889 & _T_673; // @[lib.scala 104:41]
  wire  _T_893 = io_trigger_pkt_any_2_tdata2[31] == dec_i0_match_data_2[31]; // @[lib.scala 104:78]
  wire  _T_894 = _T_890 | _T_893; // @[lib.scala 104:23]
  wire [7:0] _T_901 = {_T_726,_T_719,_T_712,_T_705,_T_698,_T_691,_T_684,_T_677}; // @[lib.scala 105:14]
  wire [15:0] _T_909 = {_T_782,_T_775,_T_768,_T_761,_T_754,_T_747,_T_740,_T_733,_T_901}; // @[lib.scala 105:14]
  wire [7:0] _T_916 = {_T_838,_T_831,_T_824,_T_817,_T_810,_T_803,_T_796,_T_789}; // @[lib.scala 105:14]
  wire [31:0] _T_925 = {_T_894,_T_887,_T_880,_T_873,_T_866,_T_859,_T_852,_T_845,_T_916,_T_909}; // @[lib.scala 105:14]
  wire  _T_926 = &_T_925; // @[lib.scala 105:25]
  wire  _T_927 = _T_668 & _T_926; // @[dec_trigger.scala 15:109]
  wire  _T_928 = io_trigger_pkt_any_3_execute & io_trigger_pkt_any_3_m; // @[dec_trigger.scala 15:83]
  wire  _T_931 = &io_trigger_pkt_any_3_tdata2; // @[lib.scala 101:45]
  wire  _T_932 = ~_T_931; // @[lib.scala 101:39]
  wire  _T_933 = io_trigger_pkt_any_3_match_pkt & _T_932; // @[lib.scala 101:37]
  wire  _T_936 = io_trigger_pkt_any_3_tdata2[0] == dec_i0_match_data_3[0]; // @[lib.scala 102:52]
  wire  _T_937 = _T_933 | _T_936; // @[lib.scala 102:41]
  wire  _T_939 = &io_trigger_pkt_any_3_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_940 = _T_939 & _T_933; // @[lib.scala 104:41]
  wire  _T_943 = io_trigger_pkt_any_3_tdata2[1] == dec_i0_match_data_3[1]; // @[lib.scala 104:78]
  wire  _T_944 = _T_940 | _T_943; // @[lib.scala 104:23]
  wire  _T_946 = &io_trigger_pkt_any_3_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_947 = _T_946 & _T_933; // @[lib.scala 104:41]
  wire  _T_950 = io_trigger_pkt_any_3_tdata2[2] == dec_i0_match_data_3[2]; // @[lib.scala 104:78]
  wire  _T_951 = _T_947 | _T_950; // @[lib.scala 104:23]
  wire  _T_953 = &io_trigger_pkt_any_3_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_954 = _T_953 & _T_933; // @[lib.scala 104:41]
  wire  _T_957 = io_trigger_pkt_any_3_tdata2[3] == dec_i0_match_data_3[3]; // @[lib.scala 104:78]
  wire  _T_958 = _T_954 | _T_957; // @[lib.scala 104:23]
  wire  _T_960 = &io_trigger_pkt_any_3_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_961 = _T_960 & _T_933; // @[lib.scala 104:41]
  wire  _T_964 = io_trigger_pkt_any_3_tdata2[4] == dec_i0_match_data_3[4]; // @[lib.scala 104:78]
  wire  _T_965 = _T_961 | _T_964; // @[lib.scala 104:23]
  wire  _T_967 = &io_trigger_pkt_any_3_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_968 = _T_967 & _T_933; // @[lib.scala 104:41]
  wire  _T_971 = io_trigger_pkt_any_3_tdata2[5] == dec_i0_match_data_3[5]; // @[lib.scala 104:78]
  wire  _T_972 = _T_968 | _T_971; // @[lib.scala 104:23]
  wire  _T_974 = &io_trigger_pkt_any_3_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_975 = _T_974 & _T_933; // @[lib.scala 104:41]
  wire  _T_978 = io_trigger_pkt_any_3_tdata2[6] == dec_i0_match_data_3[6]; // @[lib.scala 104:78]
  wire  _T_979 = _T_975 | _T_978; // @[lib.scala 104:23]
  wire  _T_981 = &io_trigger_pkt_any_3_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_982 = _T_981 & _T_933; // @[lib.scala 104:41]
  wire  _T_985 = io_trigger_pkt_any_3_tdata2[7] == dec_i0_match_data_3[7]; // @[lib.scala 104:78]
  wire  _T_986 = _T_982 | _T_985; // @[lib.scala 104:23]
  wire  _T_988 = &io_trigger_pkt_any_3_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_989 = _T_988 & _T_933; // @[lib.scala 104:41]
  wire  _T_992 = io_trigger_pkt_any_3_tdata2[8] == dec_i0_match_data_3[8]; // @[lib.scala 104:78]
  wire  _T_993 = _T_989 | _T_992; // @[lib.scala 104:23]
  wire  _T_995 = &io_trigger_pkt_any_3_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_996 = _T_995 & _T_933; // @[lib.scala 104:41]
  wire  _T_999 = io_trigger_pkt_any_3_tdata2[9] == dec_i0_match_data_3[9]; // @[lib.scala 104:78]
  wire  _T_1000 = _T_996 | _T_999; // @[lib.scala 104:23]
  wire  _T_1002 = &io_trigger_pkt_any_3_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_1003 = _T_1002 & _T_933; // @[lib.scala 104:41]
  wire  _T_1006 = io_trigger_pkt_any_3_tdata2[10] == dec_i0_match_data_3[10]; // @[lib.scala 104:78]
  wire  _T_1007 = _T_1003 | _T_1006; // @[lib.scala 104:23]
  wire  _T_1009 = &io_trigger_pkt_any_3_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_1010 = _T_1009 & _T_933; // @[lib.scala 104:41]
  wire  _T_1013 = io_trigger_pkt_any_3_tdata2[11] == dec_i0_match_data_3[11]; // @[lib.scala 104:78]
  wire  _T_1014 = _T_1010 | _T_1013; // @[lib.scala 104:23]
  wire  _T_1016 = &io_trigger_pkt_any_3_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_1017 = _T_1016 & _T_933; // @[lib.scala 104:41]
  wire  _T_1020 = io_trigger_pkt_any_3_tdata2[12] == dec_i0_match_data_3[12]; // @[lib.scala 104:78]
  wire  _T_1021 = _T_1017 | _T_1020; // @[lib.scala 104:23]
  wire  _T_1023 = &io_trigger_pkt_any_3_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_1024 = _T_1023 & _T_933; // @[lib.scala 104:41]
  wire  _T_1027 = io_trigger_pkt_any_3_tdata2[13] == dec_i0_match_data_3[13]; // @[lib.scala 104:78]
  wire  _T_1028 = _T_1024 | _T_1027; // @[lib.scala 104:23]
  wire  _T_1030 = &io_trigger_pkt_any_3_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_1031 = _T_1030 & _T_933; // @[lib.scala 104:41]
  wire  _T_1034 = io_trigger_pkt_any_3_tdata2[14] == dec_i0_match_data_3[14]; // @[lib.scala 104:78]
  wire  _T_1035 = _T_1031 | _T_1034; // @[lib.scala 104:23]
  wire  _T_1037 = &io_trigger_pkt_any_3_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_1038 = _T_1037 & _T_933; // @[lib.scala 104:41]
  wire  _T_1041 = io_trigger_pkt_any_3_tdata2[15] == dec_i0_match_data_3[15]; // @[lib.scala 104:78]
  wire  _T_1042 = _T_1038 | _T_1041; // @[lib.scala 104:23]
  wire  _T_1044 = &io_trigger_pkt_any_3_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_1045 = _T_1044 & _T_933; // @[lib.scala 104:41]
  wire  _T_1048 = io_trigger_pkt_any_3_tdata2[16] == dec_i0_match_data_3[16]; // @[lib.scala 104:78]
  wire  _T_1049 = _T_1045 | _T_1048; // @[lib.scala 104:23]
  wire  _T_1051 = &io_trigger_pkt_any_3_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_1052 = _T_1051 & _T_933; // @[lib.scala 104:41]
  wire  _T_1055 = io_trigger_pkt_any_3_tdata2[17] == dec_i0_match_data_3[17]; // @[lib.scala 104:78]
  wire  _T_1056 = _T_1052 | _T_1055; // @[lib.scala 104:23]
  wire  _T_1058 = &io_trigger_pkt_any_3_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_1059 = _T_1058 & _T_933; // @[lib.scala 104:41]
  wire  _T_1062 = io_trigger_pkt_any_3_tdata2[18] == dec_i0_match_data_3[18]; // @[lib.scala 104:78]
  wire  _T_1063 = _T_1059 | _T_1062; // @[lib.scala 104:23]
  wire  _T_1065 = &io_trigger_pkt_any_3_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_1066 = _T_1065 & _T_933; // @[lib.scala 104:41]
  wire  _T_1069 = io_trigger_pkt_any_3_tdata2[19] == dec_i0_match_data_3[19]; // @[lib.scala 104:78]
  wire  _T_1070 = _T_1066 | _T_1069; // @[lib.scala 104:23]
  wire  _T_1072 = &io_trigger_pkt_any_3_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_1073 = _T_1072 & _T_933; // @[lib.scala 104:41]
  wire  _T_1076 = io_trigger_pkt_any_3_tdata2[20] == dec_i0_match_data_3[20]; // @[lib.scala 104:78]
  wire  _T_1077 = _T_1073 | _T_1076; // @[lib.scala 104:23]
  wire  _T_1079 = &io_trigger_pkt_any_3_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_1080 = _T_1079 & _T_933; // @[lib.scala 104:41]
  wire  _T_1083 = io_trigger_pkt_any_3_tdata2[21] == dec_i0_match_data_3[21]; // @[lib.scala 104:78]
  wire  _T_1084 = _T_1080 | _T_1083; // @[lib.scala 104:23]
  wire  _T_1086 = &io_trigger_pkt_any_3_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_1087 = _T_1086 & _T_933; // @[lib.scala 104:41]
  wire  _T_1090 = io_trigger_pkt_any_3_tdata2[22] == dec_i0_match_data_3[22]; // @[lib.scala 104:78]
  wire  _T_1091 = _T_1087 | _T_1090; // @[lib.scala 104:23]
  wire  _T_1093 = &io_trigger_pkt_any_3_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_1094 = _T_1093 & _T_933; // @[lib.scala 104:41]
  wire  _T_1097 = io_trigger_pkt_any_3_tdata2[23] == dec_i0_match_data_3[23]; // @[lib.scala 104:78]
  wire  _T_1098 = _T_1094 | _T_1097; // @[lib.scala 104:23]
  wire  _T_1100 = &io_trigger_pkt_any_3_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_1101 = _T_1100 & _T_933; // @[lib.scala 104:41]
  wire  _T_1104 = io_trigger_pkt_any_3_tdata2[24] == dec_i0_match_data_3[24]; // @[lib.scala 104:78]
  wire  _T_1105 = _T_1101 | _T_1104; // @[lib.scala 104:23]
  wire  _T_1107 = &io_trigger_pkt_any_3_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_1108 = _T_1107 & _T_933; // @[lib.scala 104:41]
  wire  _T_1111 = io_trigger_pkt_any_3_tdata2[25] == dec_i0_match_data_3[25]; // @[lib.scala 104:78]
  wire  _T_1112 = _T_1108 | _T_1111; // @[lib.scala 104:23]
  wire  _T_1114 = &io_trigger_pkt_any_3_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_1115 = _T_1114 & _T_933; // @[lib.scala 104:41]
  wire  _T_1118 = io_trigger_pkt_any_3_tdata2[26] == dec_i0_match_data_3[26]; // @[lib.scala 104:78]
  wire  _T_1119 = _T_1115 | _T_1118; // @[lib.scala 104:23]
  wire  _T_1121 = &io_trigger_pkt_any_3_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_1122 = _T_1121 & _T_933; // @[lib.scala 104:41]
  wire  _T_1125 = io_trigger_pkt_any_3_tdata2[27] == dec_i0_match_data_3[27]; // @[lib.scala 104:78]
  wire  _T_1126 = _T_1122 | _T_1125; // @[lib.scala 104:23]
  wire  _T_1128 = &io_trigger_pkt_any_3_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_1129 = _T_1128 & _T_933; // @[lib.scala 104:41]
  wire  _T_1132 = io_trigger_pkt_any_3_tdata2[28] == dec_i0_match_data_3[28]; // @[lib.scala 104:78]
  wire  _T_1133 = _T_1129 | _T_1132; // @[lib.scala 104:23]
  wire  _T_1135 = &io_trigger_pkt_any_3_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_1136 = _T_1135 & _T_933; // @[lib.scala 104:41]
  wire  _T_1139 = io_trigger_pkt_any_3_tdata2[29] == dec_i0_match_data_3[29]; // @[lib.scala 104:78]
  wire  _T_1140 = _T_1136 | _T_1139; // @[lib.scala 104:23]
  wire  _T_1142 = &io_trigger_pkt_any_3_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_1143 = _T_1142 & _T_933; // @[lib.scala 104:41]
  wire  _T_1146 = io_trigger_pkt_any_3_tdata2[30] == dec_i0_match_data_3[30]; // @[lib.scala 104:78]
  wire  _T_1147 = _T_1143 | _T_1146; // @[lib.scala 104:23]
  wire  _T_1149 = &io_trigger_pkt_any_3_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_1150 = _T_1149 & _T_933; // @[lib.scala 104:41]
  wire  _T_1153 = io_trigger_pkt_any_3_tdata2[31] == dec_i0_match_data_3[31]; // @[lib.scala 104:78]
  wire  _T_1154 = _T_1150 | _T_1153; // @[lib.scala 104:23]
  wire [7:0] _T_1161 = {_T_986,_T_979,_T_972,_T_965,_T_958,_T_951,_T_944,_T_937}; // @[lib.scala 105:14]
  wire [15:0] _T_1169 = {_T_1042,_T_1035,_T_1028,_T_1021,_T_1014,_T_1007,_T_1000,_T_993,_T_1161}; // @[lib.scala 105:14]
  wire [7:0] _T_1176 = {_T_1098,_T_1091,_T_1084,_T_1077,_T_1070,_T_1063,_T_1056,_T_1049}; // @[lib.scala 105:14]
  wire [31:0] _T_1185 = {_T_1154,_T_1147,_T_1140,_T_1133,_T_1126,_T_1119,_T_1112,_T_1105,_T_1176,_T_1169}; // @[lib.scala 105:14]
  wire  _T_1186 = &_T_1185; // @[lib.scala 105:25]
  wire  _T_1187 = _T_928 & _T_1186; // @[dec_trigger.scala 15:109]
  wire [2:0] _T_1189 = {_T_1187,_T_927,_T_667}; // @[Cat.scala 29:58]
  assign io_dec_i0_trigger_match_d = {_T_1189,_T_407}; // @[dec_trigger.scala 15:29]
endmodule
module dec(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_free_l2clk,
  input         io_lsu_fastint_stall_any,
  output        io_dec_pause_state_cg,
  output        io_dec_tlu_core_empty,
  input  [30:0] io_rst_vec,
  input  [8:0]  io_ifu_i0_fa_index,
  output [8:0]  io_dec_fa_error_index,
  input         io_nmi_int,
  input  [30:0] io_nmi_vec,
  input  [31:0] io_lsu_nonblock_load_data,
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
  input         io_lsu_pmu_misaligned_m,
  input  [30:0] io_lsu_fir_addr,
  input  [1:0]  io_lsu_fir_error,
  input  [3:0]  io_lsu_trigger_match_m,
  input         io_lsu_idle_any,
  input         io_lsu_error_pkt_r_valid,
  input         io_lsu_error_pkt_r_bits_single_ecc_error,
  input         io_lsu_error_pkt_r_bits_inst_type,
  input         io_lsu_error_pkt_r_bits_exc_type,
  input  [3:0]  io_lsu_error_pkt_r_bits_mscause,
  input  [31:0] io_lsu_error_pkt_r_bits_addr,
  input         io_lsu_single_ecc_error_incr,
  input  [31:0] io_exu_div_result,
  input         io_exu_div_wren,
  input  [31:0] io_lsu_result_m,
  input  [31:0] io_lsu_result_corr_r,
  input         io_lsu_load_stall_any,
  input         io_lsu_store_stall_any,
  input         io_iccm_dma_sb_error,
  input         io_exu_flush_final,
  input         io_timer_int,
  input         io_soft_int,
  input         io_dbg_halt_req,
  input         io_dbg_resume_req,
  output        io_dec_tlu_dbg_halted,
  output        io_dec_tlu_debug_mode,
  output        io_dec_tlu_resume_ack,
  output        io_dec_tlu_mpc_halted_only,
  output [31:0] io_dec_dbg_rddata,
  output [31:0] io_dec_csr_rddata_d,
  output        io_dec_dbg_cmd_done,
  output        io_dec_dbg_cmd_fail,
  output        io_trigger_pkt_any_0_select,
  output        io_trigger_pkt_any_0_match_pkt,
  output        io_trigger_pkt_any_0_store,
  output        io_trigger_pkt_any_0_load,
  output        io_trigger_pkt_any_0_execute,
  output        io_trigger_pkt_any_0_m,
  output [31:0] io_trigger_pkt_any_0_tdata2,
  output        io_trigger_pkt_any_1_select,
  output        io_trigger_pkt_any_1_match_pkt,
  output        io_trigger_pkt_any_1_store,
  output        io_trigger_pkt_any_1_load,
  output        io_trigger_pkt_any_1_execute,
  output        io_trigger_pkt_any_1_m,
  output [31:0] io_trigger_pkt_any_1_tdata2,
  output        io_trigger_pkt_any_2_select,
  output        io_trigger_pkt_any_2_match_pkt,
  output        io_trigger_pkt_any_2_store,
  output        io_trigger_pkt_any_2_load,
  output        io_trigger_pkt_any_2_execute,
  output        io_trigger_pkt_any_2_m,
  output [31:0] io_trigger_pkt_any_2_tdata2,
  output        io_trigger_pkt_any_3_select,
  output        io_trigger_pkt_any_3_match_pkt,
  output        io_trigger_pkt_any_3_store,
  output        io_trigger_pkt_any_3_load,
  output        io_trigger_pkt_any_3_execute,
  output        io_trigger_pkt_any_3_m,
  output [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_exu_i0_br_way_r,
  output        io_lsu_p_valid,
  output        io_lsu_p_bits_fast_int,
  output        io_lsu_p_bits_stack,
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
  output [11:0] io_dec_lsu_offset_d,
  output        io_dec_tlu_i0_kill_writeb_r,
  output        io_dec_tlu_perfcnt0,
  output        io_dec_tlu_perfcnt1,
  output        io_dec_tlu_perfcnt2,
  output        io_dec_tlu_perfcnt3,
  output        io_dec_tlu_flush_lower_wb,
  output        io_dec_lsu_valid_raw_d,
  output        io_trace_rv_trace_pkt_rv_i_valid_ip,
  output [31:0] io_trace_rv_trace_pkt_rv_i_insn_ip,
  output [31:0] io_trace_rv_trace_pkt_rv_i_address_ip,
  output        io_trace_rv_trace_pkt_rv_i_exception_ip,
  output [4:0]  io_trace_rv_trace_pkt_rv_i_ecause_ip,
  output        io_trace_rv_trace_pkt_rv_i_interrupt_ip,
  output [31:0] io_trace_rv_trace_pkt_rv_i_tval_ip,
  output        io_dec_tlu_misc_clk_override,
  output        io_dec_tlu_ifu_clk_override,
  output        io_dec_tlu_lsu_clk_override,
  output        io_dec_tlu_bus_clk_override,
  output        io_dec_tlu_pic_clk_override,
  output        io_dec_tlu_picio_clk_override,
  output        io_dec_tlu_dccm_clk_override,
  output        io_dec_tlu_icm_clk_override,
  input         io_scan_mode,
  output        io_ifu_dec_dec_aln_aln_dec_dec_i0_decode_d,
  input  [15:0] io_ifu_dec_dec_aln_aln_dec_ifu_i0_cinst,
  input         io_ifu_dec_dec_aln_aln_ib_ifu_i0_icaf,
  input  [1:0]  io_ifu_dec_dec_aln_aln_ib_ifu_i0_icaf_type,
  input         io_ifu_dec_dec_aln_aln_ib_ifu_i0_icaf_second,
  input         io_ifu_dec_dec_aln_aln_ib_ifu_i0_dbecc,
  input  [7:0]  io_ifu_dec_dec_aln_aln_ib_ifu_i0_bp_index,
  input  [7:0]  io_ifu_dec_dec_aln_aln_ib_ifu_i0_bp_fghr,
  input  [4:0]  io_ifu_dec_dec_aln_aln_ib_ifu_i0_bp_btag,
  input         io_ifu_dec_dec_aln_aln_ib_ifu_i0_valid,
  input  [31:0] io_ifu_dec_dec_aln_aln_ib_ifu_i0_instr,
  input  [30:0] io_ifu_dec_dec_aln_aln_ib_ifu_i0_pc,
  input         io_ifu_dec_dec_aln_aln_ib_ifu_i0_pc4,
  input         io_ifu_dec_dec_aln_aln_ib_i0_brp_valid,
  input  [11:0] io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_toffset,
  input  [1:0]  io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_hist,
  input         io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_br_error,
  input         io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_br_start_error,
  input         io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_bank,
  input  [30:0] io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_prett,
  input         io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_way,
  input         io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_ret,
  input         io_ifu_dec_dec_aln_ifu_pmu_instr_aligned,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_flush_err_wb,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_i0_commit_cmt,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_force_halt,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_fence_i_wb,
  output [70:0] io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_wrdata,
  output [16:0] io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_dicawics,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_rd_valid,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_wr_valid,
  output        io_ifu_dec_dec_mem_ctrl_dec_tlu_core_ecc_disable,
  input         io_ifu_dec_dec_mem_ctrl_ifu_pmu_ic_miss,
  input         io_ifu_dec_dec_mem_ctrl_ifu_pmu_ic_hit,
  input         io_ifu_dec_dec_mem_ctrl_ifu_pmu_bus_error,
  input         io_ifu_dec_dec_mem_ctrl_ifu_pmu_bus_busy,
  input         io_ifu_dec_dec_mem_ctrl_ifu_pmu_bus_trxn,
  input         io_ifu_dec_dec_mem_ctrl_ifu_ic_error_start,
  input         io_ifu_dec_dec_mem_ctrl_ifu_iccm_rd_ecc_single_err,
  input  [70:0] io_ifu_dec_dec_mem_ctrl_ifu_ic_debug_rd_data,
  input         io_ifu_dec_dec_mem_ctrl_ifu_ic_debug_rd_data_valid,
  input         io_ifu_dec_dec_mem_ctrl_ifu_miss_state_idle,
  output        io_ifu_dec_dec_ifc_dec_tlu_flush_noredir_wb,
  output [31:0] io_ifu_dec_dec_ifc_dec_tlu_mrac_ff,
  input         io_ifu_dec_dec_ifc_ifu_pmu_fetch_stall,
  output        io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_valid,
  output [1:0]  io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_hist,
  output        io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_br_error,
  output        io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_br_start_error,
  output        io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_way,
  output        io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_middle,
  output        io_ifu_dec_dec_bp_dec_tlu_flush_leak_one_wb,
  output        io_ifu_dec_dec_bp_dec_tlu_bpred_disable,
  output        io_dec_exu_dec_alu_dec_i0_alu_decode_d,
  output        io_dec_exu_dec_alu_dec_csr_ren_d,
  output [11:0] io_dec_exu_dec_alu_dec_i0_br_immed_d,
  input  [30:0] io_dec_exu_dec_alu_exu_i0_pc_x,
  output        io_dec_exu_dec_div_div_p_valid,
  output        io_dec_exu_dec_div_div_p_bits_unsign,
  output        io_dec_exu_dec_div_div_p_bits_rem,
  output        io_dec_exu_dec_div_dec_div_cancel,
  output [1:0]  io_dec_exu_decode_exu_dec_data_en,
  output [1:0]  io_dec_exu_decode_exu_dec_ctl_en,
  output        io_dec_exu_decode_exu_i0_ap_clz,
  output        io_dec_exu_decode_exu_i0_ap_ctz,
  output        io_dec_exu_decode_exu_i0_ap_pcnt,
  output        io_dec_exu_decode_exu_i0_ap_sext_b,
  output        io_dec_exu_decode_exu_i0_ap_sext_h,
  output        io_dec_exu_decode_exu_i0_ap_slo,
  output        io_dec_exu_decode_exu_i0_ap_sro,
  output        io_dec_exu_decode_exu_i0_ap_min,
  output        io_dec_exu_decode_exu_i0_ap_max,
  output        io_dec_exu_decode_exu_i0_ap_pack,
  output        io_dec_exu_decode_exu_i0_ap_packu,
  output        io_dec_exu_decode_exu_i0_ap_packh,
  output        io_dec_exu_decode_exu_i0_ap_rol,
  output        io_dec_exu_decode_exu_i0_ap_ror,
  output        io_dec_exu_decode_exu_i0_ap_grev,
  output        io_dec_exu_decode_exu_i0_ap_gorc,
  output        io_dec_exu_decode_exu_i0_ap_zbb,
  output        io_dec_exu_decode_exu_i0_ap_sbset,
  output        io_dec_exu_decode_exu_i0_ap_sbclr,
  output        io_dec_exu_decode_exu_i0_ap_sbinv,
  output        io_dec_exu_decode_exu_i0_ap_sbext,
  output        io_dec_exu_decode_exu_i0_ap_sh1add,
  output        io_dec_exu_decode_exu_i0_ap_sh2add,
  output        io_dec_exu_decode_exu_i0_ap_sh3add,
  output        io_dec_exu_decode_exu_i0_ap_zba,
  output        io_dec_exu_decode_exu_i0_ap_land,
  output        io_dec_exu_decode_exu_i0_ap_lor,
  output        io_dec_exu_decode_exu_i0_ap_lxor,
  output        io_dec_exu_decode_exu_i0_ap_sll,
  output        io_dec_exu_decode_exu_i0_ap_srl,
  output        io_dec_exu_decode_exu_i0_ap_sra,
  output        io_dec_exu_decode_exu_i0_ap_beq,
  output        io_dec_exu_decode_exu_i0_ap_bne,
  output        io_dec_exu_decode_exu_i0_ap_blt,
  output        io_dec_exu_decode_exu_i0_ap_bge,
  output        io_dec_exu_decode_exu_i0_ap_add,
  output        io_dec_exu_decode_exu_i0_ap_sub,
  output        io_dec_exu_decode_exu_i0_ap_slt,
  output        io_dec_exu_decode_exu_i0_ap_unsign,
  output        io_dec_exu_decode_exu_i0_ap_jal,
  output        io_dec_exu_decode_exu_i0_ap_predict_t,
  output        io_dec_exu_decode_exu_i0_ap_predict_nt,
  output        io_dec_exu_decode_exu_i0_ap_csr_write,
  output        io_dec_exu_decode_exu_i0_ap_csr_imm,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_valid,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_misp,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_ataken,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_boffset,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pc4,
  output [1:0]  io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_hist,
  output [11:0] io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_toffset,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_error,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_start_error,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pcall,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pja,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_way,
  output        io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pret,
  output [30:0] io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_prett,
  output [7:0]  io_dec_exu_decode_exu_i0_predict_fghr_d,
  output [7:0]  io_dec_exu_decode_exu_i0_predict_index_d,
  output [4:0]  io_dec_exu_decode_exu_i0_predict_btag_d,
  output        io_dec_exu_decode_exu_dec_i0_rs1_en_d,
  output        io_dec_exu_decode_exu_dec_i0_branch_d,
  output        io_dec_exu_decode_exu_dec_i0_rs2_en_d,
  output [31:0] io_dec_exu_decode_exu_dec_i0_immed_d,
  output [31:0] io_dec_exu_decode_exu_dec_i0_result_r,
  output        io_dec_exu_decode_exu_dec_qual_lsu_d,
  output        io_dec_exu_decode_exu_dec_i0_select_pc_d,
  output [3:0]  io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d,
  output [3:0]  io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d,
  output        io_dec_exu_decode_exu_mul_p_valid,
  output        io_dec_exu_decode_exu_mul_p_bits_rs1_sign,
  output        io_dec_exu_decode_exu_mul_p_bits_rs2_sign,
  output        io_dec_exu_decode_exu_mul_p_bits_low,
  output        io_dec_exu_decode_exu_mul_p_bits_bext,
  output        io_dec_exu_decode_exu_mul_p_bits_bdep,
  output        io_dec_exu_decode_exu_mul_p_bits_clmul,
  output        io_dec_exu_decode_exu_mul_p_bits_clmulh,
  output        io_dec_exu_decode_exu_mul_p_bits_clmulr,
  output        io_dec_exu_decode_exu_mul_p_bits_grev,
  output        io_dec_exu_decode_exu_mul_p_bits_gorc,
  output        io_dec_exu_decode_exu_mul_p_bits_shfl,
  output        io_dec_exu_decode_exu_mul_p_bits_unshfl,
  output        io_dec_exu_decode_exu_mul_p_bits_crc32_b,
  output        io_dec_exu_decode_exu_mul_p_bits_crc32_h,
  output        io_dec_exu_decode_exu_mul_p_bits_crc32_w,
  output        io_dec_exu_decode_exu_mul_p_bits_crc32c_b,
  output        io_dec_exu_decode_exu_mul_p_bits_crc32c_h,
  output        io_dec_exu_decode_exu_mul_p_bits_crc32c_w,
  output        io_dec_exu_decode_exu_mul_p_bits_bfp,
  output [30:0] io_dec_exu_decode_exu_pred_correct_npc_x,
  output        io_dec_exu_decode_exu_dec_extint_stall,
  input  [31:0] io_dec_exu_decode_exu_exu_i0_result_x,
  input  [31:0] io_dec_exu_decode_exu_exu_csr_rs1_x,
  output [29:0] io_dec_exu_tlu_exu_dec_tlu_meihap,
  output        io_dec_exu_tlu_exu_dec_tlu_flush_lower_r,
  output [30:0] io_dec_exu_tlu_exu_dec_tlu_flush_path_r,
  input  [1:0]  io_dec_exu_tlu_exu_exu_i0_br_hist_r,
  input         io_dec_exu_tlu_exu_exu_i0_br_error_r,
  input         io_dec_exu_tlu_exu_exu_i0_br_start_error_r,
  input  [7:0]  io_dec_exu_tlu_exu_exu_i0_br_index_r,
  input         io_dec_exu_tlu_exu_exu_i0_br_valid_r,
  input         io_dec_exu_tlu_exu_exu_i0_br_mp_r,
  input         io_dec_exu_tlu_exu_exu_i0_br_middle_r,
  input         io_dec_exu_tlu_exu_exu_pmu_i0_br_misp,
  input         io_dec_exu_tlu_exu_exu_pmu_i0_br_ataken,
  input         io_dec_exu_tlu_exu_exu_pmu_i0_pc4,
  input  [30:0] io_dec_exu_tlu_exu_exu_npc_r,
  output [30:0] io_dec_exu_ib_exu_dec_i0_pc_d,
  output        io_dec_exu_ib_exu_dec_debug_wdata_rs1_d,
  output [31:0] io_dec_exu_gpr_exu_gpr_i0_rs1_d,
  output [31:0] io_dec_exu_gpr_exu_gpr_i0_rs2_d,
  input         io_lsu_dec_tlu_busbuff_lsu_pmu_bus_trxn,
  input         io_lsu_dec_tlu_busbuff_lsu_pmu_bus_misaligned,
  input         io_lsu_dec_tlu_busbuff_lsu_pmu_bus_error,
  input         io_lsu_dec_tlu_busbuff_lsu_pmu_bus_busy,
  output        io_lsu_dec_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  output        io_lsu_dec_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  output        io_lsu_dec_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  input         io_lsu_dec_tlu_busbuff_lsu_imprecise_error_load_any,
  input         io_lsu_dec_tlu_busbuff_lsu_imprecise_error_store_any,
  input  [31:0] io_lsu_dec_tlu_busbuff_lsu_imprecise_error_addr_any,
  input         io_lsu_dec_dctl_busbuff_lsu_nonblock_load_valid_m,
  input  [1:0]  io_lsu_dec_dctl_busbuff_lsu_nonblock_load_tag_m,
  input         io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_r,
  input  [1:0]  io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_tag_r,
  input         io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_valid,
  input         io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_error,
  input  [1:0]  io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_tag,
  input         io_lsu_tlu_lsu_pmu_load_external_m,
  input         io_lsu_tlu_lsu_pmu_store_external_m,
  input         io_dec_dbg_dbg_ib_dbg_cmd_valid,
  input         io_dec_dbg_dbg_ib_dbg_cmd_write,
  input  [1:0]  io_dec_dbg_dbg_ib_dbg_cmd_type,
  input  [31:0] io_dec_dbg_dbg_ib_dbg_cmd_addr,
  input  [31:0] io_dec_dbg_dbg_dctl_dbg_cmd_wrdata,
  input         io_dec_dma_dctl_dma_dma_dccm_stall_any,
  input         io_dec_dma_tlu_dma_dma_pmu_dccm_read,
  input         io_dec_dma_tlu_dma_dma_pmu_dccm_write,
  input         io_dec_dma_tlu_dma_dma_pmu_any_read,
  input         io_dec_dma_tlu_dma_dma_pmu_any_write,
  output [2:0]  io_dec_dma_tlu_dma_dec_tlu_dma_qos_prty,
  input         io_dec_dma_tlu_dma_dma_dccm_stall_any,
  input         io_dec_dma_tlu_dma_dma_iccm_stall_any,
  input  [7:0]  io_dec_pic_pic_claimid,
  input  [3:0]  io_dec_pic_pic_pl,
  input         io_dec_pic_mhwakeup,
  output [3:0]  io_dec_pic_dec_tlu_meicurpl,
  output [3:0]  io_dec_pic_dec_tlu_meipt,
  input         io_dec_pic_mexintpend
);
  wire  instbuff_io_ifu_ib_ifu_i0_icaf; // @[dec.scala 128:24]
  wire [1:0] instbuff_io_ifu_ib_ifu_i0_icaf_type; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_ifu_i0_icaf_second; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_ifu_i0_dbecc; // @[dec.scala 128:24]
  wire [7:0] instbuff_io_ifu_ib_ifu_i0_bp_index; // @[dec.scala 128:24]
  wire [7:0] instbuff_io_ifu_ib_ifu_i0_bp_fghr; // @[dec.scala 128:24]
  wire [4:0] instbuff_io_ifu_ib_ifu_i0_bp_btag; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_ifu_i0_valid; // @[dec.scala 128:24]
  wire [31:0] instbuff_io_ifu_ib_ifu_i0_instr; // @[dec.scala 128:24]
  wire [30:0] instbuff_io_ifu_ib_ifu_i0_pc; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_ifu_i0_pc4; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_i0_brp_valid; // @[dec.scala 128:24]
  wire [11:0] instbuff_io_ifu_ib_i0_brp_bits_toffset; // @[dec.scala 128:24]
  wire [1:0] instbuff_io_ifu_ib_i0_brp_bits_hist; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_i0_brp_bits_br_error; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_i0_brp_bits_br_start_error; // @[dec.scala 128:24]
  wire [30:0] instbuff_io_ifu_ib_i0_brp_bits_prett; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_i0_brp_bits_way; // @[dec.scala 128:24]
  wire  instbuff_io_ifu_ib_i0_brp_bits_ret; // @[dec.scala 128:24]
  wire [30:0] instbuff_io_ib_exu_dec_i0_pc_d; // @[dec.scala 128:24]
  wire  instbuff_io_ib_exu_dec_debug_wdata_rs1_d; // @[dec.scala 128:24]
  wire  instbuff_io_dbg_ib_dbg_cmd_valid; // @[dec.scala 128:24]
  wire  instbuff_io_dbg_ib_dbg_cmd_write; // @[dec.scala 128:24]
  wire [1:0] instbuff_io_dbg_ib_dbg_cmd_type; // @[dec.scala 128:24]
  wire [31:0] instbuff_io_dbg_ib_dbg_cmd_addr; // @[dec.scala 128:24]
  wire  instbuff_io_dec_ib0_valid_d; // @[dec.scala 128:24]
  wire [1:0] instbuff_io_dec_i0_icaf_type_d; // @[dec.scala 128:24]
  wire [31:0] instbuff_io_dec_i0_instr_d; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_pc4_d; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_brp_valid; // @[dec.scala 128:24]
  wire [11:0] instbuff_io_dec_i0_brp_bits_toffset; // @[dec.scala 128:24]
  wire [1:0] instbuff_io_dec_i0_brp_bits_hist; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_brp_bits_br_error; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_brp_bits_br_start_error; // @[dec.scala 128:24]
  wire [30:0] instbuff_io_dec_i0_brp_bits_prett; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_brp_bits_way; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_brp_bits_ret; // @[dec.scala 128:24]
  wire [7:0] instbuff_io_dec_i0_bp_index; // @[dec.scala 128:24]
  wire [7:0] instbuff_io_dec_i0_bp_fghr; // @[dec.scala 128:24]
  wire [4:0] instbuff_io_dec_i0_bp_btag; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_icaf_d; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_icaf_second_d; // @[dec.scala 128:24]
  wire  instbuff_io_dec_i0_dbecc_d; // @[dec.scala 128:24]
  wire  instbuff_io_dec_debug_fence_d; // @[dec.scala 128:24]
  wire  decode_clock; // @[dec.scala 129:22]
  wire  decode_reset; // @[dec.scala 129:22]
  wire [1:0] decode_io_decode_exu_dec_data_en; // @[dec.scala 129:22]
  wire [1:0] decode_io_decode_exu_dec_ctl_en; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_clz; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_ctz; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_pcnt; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sext_b; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sext_h; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_slo; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sro; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_min; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_max; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_pack; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_packu; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_packh; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_rol; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_ror; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_grev; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_gorc; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_zbb; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sbset; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sbclr; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sbinv; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sbext; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sh1add; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sh2add; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sh3add; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_zba; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_land; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_lor; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_lxor; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sll; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_srl; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sra; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_beq; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_bne; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_blt; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_bge; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_add; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_sub; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_slt; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_unsign; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_jal; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_predict_t; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_predict_nt; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_csr_write; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_i0_ap_csr_imm; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_valid; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_pc4; // @[dec.scala 129:22]
  wire [1:0] decode_io_decode_exu_dec_i0_predict_p_d_bits_hist; // @[dec.scala 129:22]
  wire [11:0] decode_io_decode_exu_dec_i0_predict_p_d_bits_toffset; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_br_error; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_br_start_error; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_pcall; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_pja; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_way; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_predict_p_d_bits_pret; // @[dec.scala 129:22]
  wire [30:0] decode_io_decode_exu_dec_i0_predict_p_d_bits_prett; // @[dec.scala 129:22]
  wire [7:0] decode_io_decode_exu_i0_predict_fghr_d; // @[dec.scala 129:22]
  wire [7:0] decode_io_decode_exu_i0_predict_index_d; // @[dec.scala 129:22]
  wire [4:0] decode_io_decode_exu_i0_predict_btag_d; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_rs1_en_d; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_branch_d; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_rs2_en_d; // @[dec.scala 129:22]
  wire [31:0] decode_io_decode_exu_dec_i0_immed_d; // @[dec.scala 129:22]
  wire [31:0] decode_io_decode_exu_dec_i0_result_r; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_qual_lsu_d; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_i0_select_pc_d; // @[dec.scala 129:22]
  wire [3:0] decode_io_decode_exu_dec_i0_rs1_bypass_en_d; // @[dec.scala 129:22]
  wire [3:0] decode_io_decode_exu_dec_i0_rs2_bypass_en_d; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_valid; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_rs1_sign; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_rs2_sign; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_low; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_bext; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_bdep; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_clmul; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_clmulh; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_clmulr; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_grev; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_gorc; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_shfl; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_unshfl; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_crc32_b; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_crc32_h; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_crc32_w; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_crc32c_b; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_crc32c_h; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_crc32c_w; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_mul_p_bits_bfp; // @[dec.scala 129:22]
  wire [30:0] decode_io_decode_exu_pred_correct_npc_x; // @[dec.scala 129:22]
  wire  decode_io_decode_exu_dec_extint_stall; // @[dec.scala 129:22]
  wire [31:0] decode_io_decode_exu_exu_i0_result_x; // @[dec.scala 129:22]
  wire [31:0] decode_io_decode_exu_exu_csr_rs1_x; // @[dec.scala 129:22]
  wire  decode_io_dec_alu_dec_i0_alu_decode_d; // @[dec.scala 129:22]
  wire  decode_io_dec_alu_dec_csr_ren_d; // @[dec.scala 129:22]
  wire [11:0] decode_io_dec_alu_dec_i0_br_immed_d; // @[dec.scala 129:22]
  wire [30:0] decode_io_dec_alu_exu_i0_pc_x; // @[dec.scala 129:22]
  wire  decode_io_dec_div_div_p_valid; // @[dec.scala 129:22]
  wire  decode_io_dec_div_div_p_bits_unsign; // @[dec.scala 129:22]
  wire  decode_io_dec_div_div_p_bits_rem; // @[dec.scala 129:22]
  wire  decode_io_dec_div_dec_div_cancel; // @[dec.scala 129:22]
  wire  decode_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[dec.scala 129:22]
  wire [1:0] decode_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[dec.scala 129:22]
  wire  decode_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[dec.scala 129:22]
  wire [1:0] decode_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[dec.scala 129:22]
  wire  decode_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[dec.scala 129:22]
  wire  decode_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[dec.scala 129:22]
  wire [1:0] decode_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[dec.scala 129:22]
  wire  decode_io_dctl_dma_dma_dccm_stall_any; // @[dec.scala 129:22]
  wire  decode_io_dec_aln_dec_i0_decode_d; // @[dec.scala 129:22]
  wire [15:0] decode_io_dec_aln_ifu_i0_cinst; // @[dec.scala 129:22]
  wire [31:0] decode_io_dbg_dctl_dbg_cmd_wrdata; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_trace_disable; // @[dec.scala 129:22]
  wire  decode_io_dec_debug_valid_d; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_flush_extint; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_force_halt; // @[dec.scala 129:22]
  wire [31:0] decode_io_dec_i0_inst_wb; // @[dec.scala 129:22]
  wire [30:0] decode_io_dec_i0_pc_wb; // @[dec.scala 129:22]
  wire [3:0] decode_io_dec_i0_trigger_match_d; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_wr_pause_r; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_pipelining_disable; // @[dec.scala 129:22]
  wire [3:0] decode_io_lsu_trigger_match_m; // @[dec.scala 129:22]
  wire  decode_io_lsu_pmu_misaligned_m; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_debug_stall; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_flush_leak_one_r; // @[dec.scala 129:22]
  wire  decode_io_dec_debug_fence_d; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_icaf_d; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_icaf_second_d; // @[dec.scala 129:22]
  wire [1:0] decode_io_dec_i0_icaf_type_d; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_dbecc_d; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_brp_valid; // @[dec.scala 129:22]
  wire [11:0] decode_io_dec_i0_brp_bits_toffset; // @[dec.scala 129:22]
  wire [1:0] decode_io_dec_i0_brp_bits_hist; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_brp_bits_br_error; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_brp_bits_br_start_error; // @[dec.scala 129:22]
  wire [30:0] decode_io_dec_i0_brp_bits_prett; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_brp_bits_way; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_brp_bits_ret; // @[dec.scala 129:22]
  wire [7:0] decode_io_dec_i0_bp_index; // @[dec.scala 129:22]
  wire [7:0] decode_io_dec_i0_bp_fghr; // @[dec.scala 129:22]
  wire [4:0] decode_io_dec_i0_bp_btag; // @[dec.scala 129:22]
  wire  decode_io_lsu_idle_any; // @[dec.scala 129:22]
  wire  decode_io_lsu_load_stall_any; // @[dec.scala 129:22]
  wire  decode_io_lsu_store_stall_any; // @[dec.scala 129:22]
  wire  decode_io_exu_div_wren; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_i0_kill_writeb_wb; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_flush_lower_wb; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_i0_kill_writeb_r; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_flush_lower_r; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_flush_pause_r; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_presync_d; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_postsync_d; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_pc4_d; // @[dec.scala 129:22]
  wire [31:0] decode_io_dec_csr_rddata_d; // @[dec.scala 129:22]
  wire  decode_io_dec_csr_legal_d; // @[dec.scala 129:22]
  wire [31:0] decode_io_lsu_result_m; // @[dec.scala 129:22]
  wire [31:0] decode_io_lsu_result_corr_r; // @[dec.scala 129:22]
  wire  decode_io_exu_flush_final; // @[dec.scala 129:22]
  wire [31:0] decode_io_dec_i0_instr_d; // @[dec.scala 129:22]
  wire  decode_io_dec_ib0_valid_d; // @[dec.scala 129:22]
  wire  decode_io_active_clk; // @[dec.scala 129:22]
  wire  decode_io_free_l2clk; // @[dec.scala 129:22]
  wire  decode_io_clk_override; // @[dec.scala 129:22]
  wire [4:0] decode_io_dec_i0_rs1_d; // @[dec.scala 129:22]
  wire [4:0] decode_io_dec_i0_rs2_d; // @[dec.scala 129:22]
  wire [4:0] decode_io_dec_i0_waddr_r; // @[dec.scala 129:22]
  wire  decode_io_dec_i0_wen_r; // @[dec.scala 129:22]
  wire [31:0] decode_io_dec_i0_wdata_r; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_valid; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_fast_int; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_stack; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_by; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_half; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_word; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_load; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_store; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_unsign; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_store_data_bypass_d; // @[dec.scala 129:22]
  wire  decode_io_lsu_p_bits_load_ldst_bypass_d; // @[dec.scala 129:22]
  wire [4:0] decode_io_div_waddr_wb; // @[dec.scala 129:22]
  wire  decode_io_dec_lsu_valid_raw_d; // @[dec.scala 129:22]
  wire [11:0] decode_io_dec_lsu_offset_d; // @[dec.scala 129:22]
  wire  decode_io_dec_csr_wen_unq_d; // @[dec.scala 129:22]
  wire  decode_io_dec_csr_any_unq_d; // @[dec.scala 129:22]
  wire [11:0] decode_io_dec_csr_rdaddr_d; // @[dec.scala 129:22]
  wire  decode_io_dec_csr_wen_r; // @[dec.scala 129:22]
  wire [11:0] decode_io_dec_csr_wraddr_r; // @[dec.scala 129:22]
  wire [31:0] decode_io_dec_csr_wrdata_r; // @[dec.scala 129:22]
  wire  decode_io_dec_csr_stall_int_ff; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_i0_valid_r; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_legal; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_icaf; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_icaf_second; // @[dec.scala 129:22]
  wire [1:0] decode_io_dec_tlu_packet_r_icaf_type; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_fence_i; // @[dec.scala 129:22]
  wire [3:0] decode_io_dec_tlu_packet_r_i0trigger; // @[dec.scala 129:22]
  wire [3:0] decode_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_pmu_divide; // @[dec.scala 129:22]
  wire  decode_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec.scala 129:22]
  wire [30:0] decode_io_dec_tlu_i0_pc_r; // @[dec.scala 129:22]
  wire [31:0] decode_io_dec_illegal_inst; // @[dec.scala 129:22]
  wire  decode_io_dec_pmu_instr_decoded; // @[dec.scala 129:22]
  wire  decode_io_dec_pmu_decode_stall; // @[dec.scala 129:22]
  wire  decode_io_dec_pmu_presync_stall; // @[dec.scala 129:22]
  wire  decode_io_dec_pmu_postsync_stall; // @[dec.scala 129:22]
  wire  decode_io_dec_nonblock_load_wen; // @[dec.scala 129:22]
  wire [4:0] decode_io_dec_nonblock_load_waddr; // @[dec.scala 129:22]
  wire  decode_io_dec_pause_state; // @[dec.scala 129:22]
  wire  decode_io_dec_pause_state_cg; // @[dec.scala 129:22]
  wire  decode_io_dec_div_active; // @[dec.scala 129:22]
  wire  gpr_clock; // @[dec.scala 130:19]
  wire  gpr_reset; // @[dec.scala 130:19]
  wire [4:0] gpr_io_raddr0; // @[dec.scala 130:19]
  wire [4:0] gpr_io_raddr1; // @[dec.scala 130:19]
  wire  gpr_io_wen0; // @[dec.scala 130:19]
  wire [4:0] gpr_io_waddr0; // @[dec.scala 130:19]
  wire [31:0] gpr_io_wd0; // @[dec.scala 130:19]
  wire  gpr_io_wen1; // @[dec.scala 130:19]
  wire [4:0] gpr_io_waddr1; // @[dec.scala 130:19]
  wire [31:0] gpr_io_wd1; // @[dec.scala 130:19]
  wire  gpr_io_wen2; // @[dec.scala 130:19]
  wire [4:0] gpr_io_waddr2; // @[dec.scala 130:19]
  wire [31:0] gpr_io_wd2; // @[dec.scala 130:19]
  wire [31:0] gpr_io_gpr_exu_gpr_i0_rs1_d; // @[dec.scala 130:19]
  wire [31:0] gpr_io_gpr_exu_gpr_i0_rs2_d; // @[dec.scala 130:19]
  wire  tlu_clock; // @[dec.scala 131:19]
  wire  tlu_reset; // @[dec.scala 131:19]
  wire [29:0] tlu_io_tlu_exu_dec_tlu_meihap; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_dec_tlu_flush_lower_r; // @[dec.scala 131:19]
  wire [30:0] tlu_io_tlu_exu_dec_tlu_flush_path_r; // @[dec.scala 131:19]
  wire [1:0] tlu_io_tlu_exu_exu_i0_br_hist_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_i0_br_error_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_i0_br_start_error_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_i0_br_valid_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_i0_br_mp_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_i0_br_middle_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_pmu_i0_br_misp; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_pmu_i0_br_ataken; // @[dec.scala 131:19]
  wire  tlu_io_tlu_exu_exu_pmu_i0_pc4; // @[dec.scala 131:19]
  wire [30:0] tlu_io_tlu_exu_exu_npc_r; // @[dec.scala 131:19]
  wire  tlu_io_tlu_dma_dma_pmu_dccm_read; // @[dec.scala 131:19]
  wire  tlu_io_tlu_dma_dma_pmu_dccm_write; // @[dec.scala 131:19]
  wire  tlu_io_tlu_dma_dma_pmu_any_read; // @[dec.scala 131:19]
  wire  tlu_io_tlu_dma_dma_pmu_any_write; // @[dec.scala 131:19]
  wire [2:0] tlu_io_tlu_dma_dec_tlu_dma_qos_prty; // @[dec.scala 131:19]
  wire  tlu_io_tlu_dma_dma_dccm_stall_any; // @[dec.scala 131:19]
  wire  tlu_io_tlu_dma_dma_iccm_stall_any; // @[dec.scala 131:19]
  wire  tlu_io_free_clk; // @[dec.scala 131:19]
  wire  tlu_io_free_l2clk; // @[dec.scala 131:19]
  wire [30:0] tlu_io_rst_vec; // @[dec.scala 131:19]
  wire  tlu_io_nmi_int; // @[dec.scala 131:19]
  wire [30:0] tlu_io_nmi_vec; // @[dec.scala 131:19]
  wire  tlu_io_i_cpu_halt_req; // @[dec.scala 131:19]
  wire  tlu_io_i_cpu_run_req; // @[dec.scala 131:19]
  wire  tlu_io_lsu_fastint_stall_any; // @[dec.scala 131:19]
  wire  tlu_io_lsu_idle_any; // @[dec.scala 131:19]
  wire  tlu_io_dec_pmu_instr_decoded; // @[dec.scala 131:19]
  wire  tlu_io_dec_pmu_decode_stall; // @[dec.scala 131:19]
  wire  tlu_io_dec_pmu_presync_stall; // @[dec.scala 131:19]
  wire  tlu_io_dec_pmu_postsync_stall; // @[dec.scala 131:19]
  wire  tlu_io_lsu_store_stall_any; // @[dec.scala 131:19]
  wire [30:0] tlu_io_lsu_fir_addr; // @[dec.scala 131:19]
  wire [1:0] tlu_io_lsu_fir_error; // @[dec.scala 131:19]
  wire  tlu_io_iccm_dma_sb_error; // @[dec.scala 131:19]
  wire  tlu_io_lsu_error_pkt_r_valid; // @[dec.scala 131:19]
  wire  tlu_io_lsu_error_pkt_r_bits_single_ecc_error; // @[dec.scala 131:19]
  wire  tlu_io_lsu_error_pkt_r_bits_inst_type; // @[dec.scala 131:19]
  wire  tlu_io_lsu_error_pkt_r_bits_exc_type; // @[dec.scala 131:19]
  wire [3:0] tlu_io_lsu_error_pkt_r_bits_mscause; // @[dec.scala 131:19]
  wire [31:0] tlu_io_lsu_error_pkt_r_bits_addr; // @[dec.scala 131:19]
  wire  tlu_io_lsu_single_ecc_error_incr; // @[dec.scala 131:19]
  wire  tlu_io_dec_pause_state; // @[dec.scala 131:19]
  wire  tlu_io_dec_csr_wen_unq_d; // @[dec.scala 131:19]
  wire  tlu_io_dec_csr_any_unq_d; // @[dec.scala 131:19]
  wire [11:0] tlu_io_dec_csr_rdaddr_d; // @[dec.scala 131:19]
  wire  tlu_io_dec_csr_wen_r; // @[dec.scala 131:19]
  wire [11:0] tlu_io_dec_csr_wraddr_r; // @[dec.scala 131:19]
  wire [31:0] tlu_io_dec_csr_wrdata_r; // @[dec.scala 131:19]
  wire  tlu_io_dec_csr_stall_int_ff; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_i0_valid_r; // @[dec.scala 131:19]
  wire [30:0] tlu_io_dec_tlu_i0_pc_r; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_legal; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_icaf; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_icaf_second; // @[dec.scala 131:19]
  wire [1:0] tlu_io_dec_tlu_packet_r_icaf_type; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_fence_i; // @[dec.scala 131:19]
  wire [3:0] tlu_io_dec_tlu_packet_r_i0trigger; // @[dec.scala 131:19]
  wire [3:0] tlu_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_pmu_divide; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec.scala 131:19]
  wire [31:0] tlu_io_dec_illegal_inst; // @[dec.scala 131:19]
  wire  tlu_io_dec_i0_decode_d; // @[dec.scala 131:19]
  wire  tlu_io_exu_i0_br_way_r; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_core_empty; // @[dec.scala 131:19]
  wire  tlu_io_dec_dbg_cmd_done; // @[dec.scala 131:19]
  wire  tlu_io_dec_dbg_cmd_fail; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_dbg_halted; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_debug_mode; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_resume_ack; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_debug_stall; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_mpc_halted_only; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_flush_extint; // @[dec.scala 131:19]
  wire  tlu_io_dbg_halt_req; // @[dec.scala 131:19]
  wire  tlu_io_dbg_resume_req; // @[dec.scala 131:19]
  wire  tlu_io_dec_div_active; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_0_select; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_0_match_pkt; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_0_store; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_0_load; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_0_execute; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_0_m; // @[dec.scala 131:19]
  wire [31:0] tlu_io_trigger_pkt_any_0_tdata2; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_1_select; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_1_match_pkt; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_1_store; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_1_load; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_1_execute; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_1_m; // @[dec.scala 131:19]
  wire [31:0] tlu_io_trigger_pkt_any_1_tdata2; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_2_select; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_2_match_pkt; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_2_store; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_2_load; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_2_execute; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_2_m; // @[dec.scala 131:19]
  wire [31:0] tlu_io_trigger_pkt_any_2_tdata2; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_3_select; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_3_match_pkt; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_3_store; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_3_load; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_3_execute; // @[dec.scala 131:19]
  wire  tlu_io_trigger_pkt_any_3_m; // @[dec.scala 131:19]
  wire [31:0] tlu_io_trigger_pkt_any_3_tdata2; // @[dec.scala 131:19]
  wire  tlu_io_timer_int; // @[dec.scala 131:19]
  wire  tlu_io_soft_int; // @[dec.scala 131:19]
  wire  tlu_io_o_cpu_halt_status; // @[dec.scala 131:19]
  wire  tlu_io_o_cpu_halt_ack; // @[dec.scala 131:19]
  wire  tlu_io_o_cpu_run_ack; // @[dec.scala 131:19]
  wire  tlu_io_o_debug_mode_status; // @[dec.scala 131:19]
  wire [27:0] tlu_io_core_id; // @[dec.scala 131:19]
  wire  tlu_io_mpc_debug_halt_req; // @[dec.scala 131:19]
  wire  tlu_io_mpc_debug_run_req; // @[dec.scala 131:19]
  wire  tlu_io_mpc_reset_run_req; // @[dec.scala 131:19]
  wire  tlu_io_mpc_debug_halt_ack; // @[dec.scala 131:19]
  wire  tlu_io_mpc_debug_run_ack; // @[dec.scala 131:19]
  wire  tlu_io_debug_brkpt_status; // @[dec.scala 131:19]
  wire [31:0] tlu_io_dec_csr_rddata_d; // @[dec.scala 131:19]
  wire  tlu_io_dec_csr_legal_d; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_i0_kill_writeb_wb; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_i0_kill_writeb_r; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_wr_pause_r; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_flush_pause_r; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_presync_d; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_postsync_d; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_perfcnt0; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_perfcnt1; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_perfcnt2; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_perfcnt3; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_i0_exc_valid_wb1; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_i0_valid_wb1; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_int_valid_wb1; // @[dec.scala 131:19]
  wire [4:0] tlu_io_dec_tlu_exc_cause_wb1; // @[dec.scala 131:19]
  wire [31:0] tlu_io_dec_tlu_mtval_wb1; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_pipelining_disable; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_trace_disable; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_misc_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_dec_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_ifu_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_lsu_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_bus_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_pic_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_dccm_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_icm_clk_override; // @[dec.scala 131:19]
  wire  tlu_io_dec_tlu_flush_lower_wb; // @[dec.scala 131:19]
  wire  tlu_io_ifu_pmu_instr_aligned; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_br0_r_pkt_valid; // @[dec.scala 131:19]
  wire [1:0] tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_way; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_flush_leak_one_wb; // @[dec.scala 131:19]
  wire  tlu_io_tlu_bp_dec_tlu_bpred_disable; // @[dec.scala 131:19]
  wire  tlu_io_tlu_ifc_dec_tlu_flush_noredir_wb; // @[dec.scala 131:19]
  wire [31:0] tlu_io_tlu_ifc_dec_tlu_mrac_ff; // @[dec.scala 131:19]
  wire  tlu_io_tlu_ifc_ifu_pmu_fetch_stall; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_flush_err_wb; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_i0_commit_cmt; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_force_halt; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_fence_i_wb; // @[dec.scala 131:19]
  wire [70:0] tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata; // @[dec.scala 131:19]
  wire [16:0] tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_dec_tlu_core_ecc_disable; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_pmu_ic_miss; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_pmu_ic_hit; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_pmu_bus_error; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_pmu_bus_busy; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_pmu_bus_trxn; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_ic_error_start; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_iccm_rd_ecc_single_err; // @[dec.scala 131:19]
  wire [70:0] tlu_io_tlu_mem_ifu_ic_debug_rd_data; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_ic_debug_rd_data_valid; // @[dec.scala 131:19]
  wire  tlu_io_tlu_mem_ifu_miss_state_idle; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_lsu_pmu_bus_error; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_lsu_pmu_bus_busy; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[dec.scala 131:19]
  wire  tlu_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec.scala 131:19]
  wire [31:0] tlu_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[dec.scala 131:19]
  wire  tlu_io_lsu_tlu_lsu_pmu_load_external_m; // @[dec.scala 131:19]
  wire  tlu_io_lsu_tlu_lsu_pmu_store_external_m; // @[dec.scala 131:19]
  wire [7:0] tlu_io_dec_pic_pic_claimid; // @[dec.scala 131:19]
  wire [3:0] tlu_io_dec_pic_pic_pl; // @[dec.scala 131:19]
  wire  tlu_io_dec_pic_mhwakeup; // @[dec.scala 131:19]
  wire [3:0] tlu_io_dec_pic_dec_tlu_meicurpl; // @[dec.scala 131:19]
  wire [3:0] tlu_io_dec_pic_dec_tlu_meipt; // @[dec.scala 131:19]
  wire  tlu_io_dec_pic_mexintpend; // @[dec.scala 131:19]
  wire  dec_trigger_io_trigger_pkt_any_0_select; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_0_match_pkt; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_0_execute; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_0_m; // @[dec.scala 132:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_0_tdata2; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_1_select; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_1_match_pkt; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_1_execute; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_1_m; // @[dec.scala 132:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_1_tdata2; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_2_select; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_2_match_pkt; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_2_execute; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_2_m; // @[dec.scala 132:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_2_tdata2; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_3_select; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_3_match_pkt; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_3_execute; // @[dec.scala 132:27]
  wire  dec_trigger_io_trigger_pkt_any_3_m; // @[dec.scala 132:27]
  wire [31:0] dec_trigger_io_trigger_pkt_any_3_tdata2; // @[dec.scala 132:27]
  wire [30:0] dec_trigger_io_dec_i0_pc_d; // @[dec.scala 132:27]
  wire [3:0] dec_trigger_io_dec_i0_trigger_match_d; // @[dec.scala 132:27]
  wire  _T_1 = tlu_io_dec_tlu_int_valid_wb1 | tlu_io_dec_tlu_i0_valid_wb1; // @[dec.scala 312:71]
  dec_ib_ctl instbuff ( // @[dec.scala 128:24]
    .io_ifu_ib_ifu_i0_icaf(instbuff_io_ifu_ib_ifu_i0_icaf),
    .io_ifu_ib_ifu_i0_icaf_type(instbuff_io_ifu_ib_ifu_i0_icaf_type),
    .io_ifu_ib_ifu_i0_icaf_second(instbuff_io_ifu_ib_ifu_i0_icaf_second),
    .io_ifu_ib_ifu_i0_dbecc(instbuff_io_ifu_ib_ifu_i0_dbecc),
    .io_ifu_ib_ifu_i0_bp_index(instbuff_io_ifu_ib_ifu_i0_bp_index),
    .io_ifu_ib_ifu_i0_bp_fghr(instbuff_io_ifu_ib_ifu_i0_bp_fghr),
    .io_ifu_ib_ifu_i0_bp_btag(instbuff_io_ifu_ib_ifu_i0_bp_btag),
    .io_ifu_ib_ifu_i0_valid(instbuff_io_ifu_ib_ifu_i0_valid),
    .io_ifu_ib_ifu_i0_instr(instbuff_io_ifu_ib_ifu_i0_instr),
    .io_ifu_ib_ifu_i0_pc(instbuff_io_ifu_ib_ifu_i0_pc),
    .io_ifu_ib_ifu_i0_pc4(instbuff_io_ifu_ib_ifu_i0_pc4),
    .io_ifu_ib_i0_brp_valid(instbuff_io_ifu_ib_i0_brp_valid),
    .io_ifu_ib_i0_brp_bits_toffset(instbuff_io_ifu_ib_i0_brp_bits_toffset),
    .io_ifu_ib_i0_brp_bits_hist(instbuff_io_ifu_ib_i0_brp_bits_hist),
    .io_ifu_ib_i0_brp_bits_br_error(instbuff_io_ifu_ib_i0_brp_bits_br_error),
    .io_ifu_ib_i0_brp_bits_br_start_error(instbuff_io_ifu_ib_i0_brp_bits_br_start_error),
    .io_ifu_ib_i0_brp_bits_prett(instbuff_io_ifu_ib_i0_brp_bits_prett),
    .io_ifu_ib_i0_brp_bits_way(instbuff_io_ifu_ib_i0_brp_bits_way),
    .io_ifu_ib_i0_brp_bits_ret(instbuff_io_ifu_ib_i0_brp_bits_ret),
    .io_ib_exu_dec_i0_pc_d(instbuff_io_ib_exu_dec_i0_pc_d),
    .io_ib_exu_dec_debug_wdata_rs1_d(instbuff_io_ib_exu_dec_debug_wdata_rs1_d),
    .io_dbg_ib_dbg_cmd_valid(instbuff_io_dbg_ib_dbg_cmd_valid),
    .io_dbg_ib_dbg_cmd_write(instbuff_io_dbg_ib_dbg_cmd_write),
    .io_dbg_ib_dbg_cmd_type(instbuff_io_dbg_ib_dbg_cmd_type),
    .io_dbg_ib_dbg_cmd_addr(instbuff_io_dbg_ib_dbg_cmd_addr),
    .io_dec_ib0_valid_d(instbuff_io_dec_ib0_valid_d),
    .io_dec_i0_icaf_type_d(instbuff_io_dec_i0_icaf_type_d),
    .io_dec_i0_instr_d(instbuff_io_dec_i0_instr_d),
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
    .io_dec_i0_icaf_second_d(instbuff_io_dec_i0_icaf_second_d),
    .io_dec_i0_dbecc_d(instbuff_io_dec_i0_dbecc_d),
    .io_dec_debug_fence_d(instbuff_io_dec_debug_fence_d)
  );
  dec_decode_ctl decode ( // @[dec.scala 129:22]
    .clock(decode_clock),
    .reset(decode_reset),
    .io_decode_exu_dec_data_en(decode_io_decode_exu_dec_data_en),
    .io_decode_exu_dec_ctl_en(decode_io_decode_exu_dec_ctl_en),
    .io_decode_exu_i0_ap_clz(decode_io_decode_exu_i0_ap_clz),
    .io_decode_exu_i0_ap_ctz(decode_io_decode_exu_i0_ap_ctz),
    .io_decode_exu_i0_ap_pcnt(decode_io_decode_exu_i0_ap_pcnt),
    .io_decode_exu_i0_ap_sext_b(decode_io_decode_exu_i0_ap_sext_b),
    .io_decode_exu_i0_ap_sext_h(decode_io_decode_exu_i0_ap_sext_h),
    .io_decode_exu_i0_ap_slo(decode_io_decode_exu_i0_ap_slo),
    .io_decode_exu_i0_ap_sro(decode_io_decode_exu_i0_ap_sro),
    .io_decode_exu_i0_ap_min(decode_io_decode_exu_i0_ap_min),
    .io_decode_exu_i0_ap_max(decode_io_decode_exu_i0_ap_max),
    .io_decode_exu_i0_ap_pack(decode_io_decode_exu_i0_ap_pack),
    .io_decode_exu_i0_ap_packu(decode_io_decode_exu_i0_ap_packu),
    .io_decode_exu_i0_ap_packh(decode_io_decode_exu_i0_ap_packh),
    .io_decode_exu_i0_ap_rol(decode_io_decode_exu_i0_ap_rol),
    .io_decode_exu_i0_ap_ror(decode_io_decode_exu_i0_ap_ror),
    .io_decode_exu_i0_ap_grev(decode_io_decode_exu_i0_ap_grev),
    .io_decode_exu_i0_ap_gorc(decode_io_decode_exu_i0_ap_gorc),
    .io_decode_exu_i0_ap_zbb(decode_io_decode_exu_i0_ap_zbb),
    .io_decode_exu_i0_ap_sbset(decode_io_decode_exu_i0_ap_sbset),
    .io_decode_exu_i0_ap_sbclr(decode_io_decode_exu_i0_ap_sbclr),
    .io_decode_exu_i0_ap_sbinv(decode_io_decode_exu_i0_ap_sbinv),
    .io_decode_exu_i0_ap_sbext(decode_io_decode_exu_i0_ap_sbext),
    .io_decode_exu_i0_ap_sh1add(decode_io_decode_exu_i0_ap_sh1add),
    .io_decode_exu_i0_ap_sh2add(decode_io_decode_exu_i0_ap_sh2add),
    .io_decode_exu_i0_ap_sh3add(decode_io_decode_exu_i0_ap_sh3add),
    .io_decode_exu_i0_ap_zba(decode_io_decode_exu_i0_ap_zba),
    .io_decode_exu_i0_ap_land(decode_io_decode_exu_i0_ap_land),
    .io_decode_exu_i0_ap_lor(decode_io_decode_exu_i0_ap_lor),
    .io_decode_exu_i0_ap_lxor(decode_io_decode_exu_i0_ap_lxor),
    .io_decode_exu_i0_ap_sll(decode_io_decode_exu_i0_ap_sll),
    .io_decode_exu_i0_ap_srl(decode_io_decode_exu_i0_ap_srl),
    .io_decode_exu_i0_ap_sra(decode_io_decode_exu_i0_ap_sra),
    .io_decode_exu_i0_ap_beq(decode_io_decode_exu_i0_ap_beq),
    .io_decode_exu_i0_ap_bne(decode_io_decode_exu_i0_ap_bne),
    .io_decode_exu_i0_ap_blt(decode_io_decode_exu_i0_ap_blt),
    .io_decode_exu_i0_ap_bge(decode_io_decode_exu_i0_ap_bge),
    .io_decode_exu_i0_ap_add(decode_io_decode_exu_i0_ap_add),
    .io_decode_exu_i0_ap_sub(decode_io_decode_exu_i0_ap_sub),
    .io_decode_exu_i0_ap_slt(decode_io_decode_exu_i0_ap_slt),
    .io_decode_exu_i0_ap_unsign(decode_io_decode_exu_i0_ap_unsign),
    .io_decode_exu_i0_ap_jal(decode_io_decode_exu_i0_ap_jal),
    .io_decode_exu_i0_ap_predict_t(decode_io_decode_exu_i0_ap_predict_t),
    .io_decode_exu_i0_ap_predict_nt(decode_io_decode_exu_i0_ap_predict_nt),
    .io_decode_exu_i0_ap_csr_write(decode_io_decode_exu_i0_ap_csr_write),
    .io_decode_exu_i0_ap_csr_imm(decode_io_decode_exu_i0_ap_csr_imm),
    .io_decode_exu_dec_i0_predict_p_d_valid(decode_io_decode_exu_dec_i0_predict_p_d_valid),
    .io_decode_exu_dec_i0_predict_p_d_bits_pc4(decode_io_decode_exu_dec_i0_predict_p_d_bits_pc4),
    .io_decode_exu_dec_i0_predict_p_d_bits_hist(decode_io_decode_exu_dec_i0_predict_p_d_bits_hist),
    .io_decode_exu_dec_i0_predict_p_d_bits_toffset(decode_io_decode_exu_dec_i0_predict_p_d_bits_toffset),
    .io_decode_exu_dec_i0_predict_p_d_bits_br_error(decode_io_decode_exu_dec_i0_predict_p_d_bits_br_error),
    .io_decode_exu_dec_i0_predict_p_d_bits_br_start_error(decode_io_decode_exu_dec_i0_predict_p_d_bits_br_start_error),
    .io_decode_exu_dec_i0_predict_p_d_bits_pcall(decode_io_decode_exu_dec_i0_predict_p_d_bits_pcall),
    .io_decode_exu_dec_i0_predict_p_d_bits_pja(decode_io_decode_exu_dec_i0_predict_p_d_bits_pja),
    .io_decode_exu_dec_i0_predict_p_d_bits_way(decode_io_decode_exu_dec_i0_predict_p_d_bits_way),
    .io_decode_exu_dec_i0_predict_p_d_bits_pret(decode_io_decode_exu_dec_i0_predict_p_d_bits_pret),
    .io_decode_exu_dec_i0_predict_p_d_bits_prett(decode_io_decode_exu_dec_i0_predict_p_d_bits_prett),
    .io_decode_exu_i0_predict_fghr_d(decode_io_decode_exu_i0_predict_fghr_d),
    .io_decode_exu_i0_predict_index_d(decode_io_decode_exu_i0_predict_index_d),
    .io_decode_exu_i0_predict_btag_d(decode_io_decode_exu_i0_predict_btag_d),
    .io_decode_exu_dec_i0_rs1_en_d(decode_io_decode_exu_dec_i0_rs1_en_d),
    .io_decode_exu_dec_i0_branch_d(decode_io_decode_exu_dec_i0_branch_d),
    .io_decode_exu_dec_i0_rs2_en_d(decode_io_decode_exu_dec_i0_rs2_en_d),
    .io_decode_exu_dec_i0_immed_d(decode_io_decode_exu_dec_i0_immed_d),
    .io_decode_exu_dec_i0_result_r(decode_io_decode_exu_dec_i0_result_r),
    .io_decode_exu_dec_qual_lsu_d(decode_io_decode_exu_dec_qual_lsu_d),
    .io_decode_exu_dec_i0_select_pc_d(decode_io_decode_exu_dec_i0_select_pc_d),
    .io_decode_exu_dec_i0_rs1_bypass_en_d(decode_io_decode_exu_dec_i0_rs1_bypass_en_d),
    .io_decode_exu_dec_i0_rs2_bypass_en_d(decode_io_decode_exu_dec_i0_rs2_bypass_en_d),
    .io_decode_exu_mul_p_valid(decode_io_decode_exu_mul_p_valid),
    .io_decode_exu_mul_p_bits_rs1_sign(decode_io_decode_exu_mul_p_bits_rs1_sign),
    .io_decode_exu_mul_p_bits_rs2_sign(decode_io_decode_exu_mul_p_bits_rs2_sign),
    .io_decode_exu_mul_p_bits_low(decode_io_decode_exu_mul_p_bits_low),
    .io_decode_exu_mul_p_bits_bext(decode_io_decode_exu_mul_p_bits_bext),
    .io_decode_exu_mul_p_bits_bdep(decode_io_decode_exu_mul_p_bits_bdep),
    .io_decode_exu_mul_p_bits_clmul(decode_io_decode_exu_mul_p_bits_clmul),
    .io_decode_exu_mul_p_bits_clmulh(decode_io_decode_exu_mul_p_bits_clmulh),
    .io_decode_exu_mul_p_bits_clmulr(decode_io_decode_exu_mul_p_bits_clmulr),
    .io_decode_exu_mul_p_bits_grev(decode_io_decode_exu_mul_p_bits_grev),
    .io_decode_exu_mul_p_bits_gorc(decode_io_decode_exu_mul_p_bits_gorc),
    .io_decode_exu_mul_p_bits_shfl(decode_io_decode_exu_mul_p_bits_shfl),
    .io_decode_exu_mul_p_bits_unshfl(decode_io_decode_exu_mul_p_bits_unshfl),
    .io_decode_exu_mul_p_bits_crc32_b(decode_io_decode_exu_mul_p_bits_crc32_b),
    .io_decode_exu_mul_p_bits_crc32_h(decode_io_decode_exu_mul_p_bits_crc32_h),
    .io_decode_exu_mul_p_bits_crc32_w(decode_io_decode_exu_mul_p_bits_crc32_w),
    .io_decode_exu_mul_p_bits_crc32c_b(decode_io_decode_exu_mul_p_bits_crc32c_b),
    .io_decode_exu_mul_p_bits_crc32c_h(decode_io_decode_exu_mul_p_bits_crc32c_h),
    .io_decode_exu_mul_p_bits_crc32c_w(decode_io_decode_exu_mul_p_bits_crc32c_w),
    .io_decode_exu_mul_p_bits_bfp(decode_io_decode_exu_mul_p_bits_bfp),
    .io_decode_exu_pred_correct_npc_x(decode_io_decode_exu_pred_correct_npc_x),
    .io_decode_exu_dec_extint_stall(decode_io_decode_exu_dec_extint_stall),
    .io_decode_exu_exu_i0_result_x(decode_io_decode_exu_exu_i0_result_x),
    .io_decode_exu_exu_csr_rs1_x(decode_io_decode_exu_exu_csr_rs1_x),
    .io_dec_alu_dec_i0_alu_decode_d(decode_io_dec_alu_dec_i0_alu_decode_d),
    .io_dec_alu_dec_csr_ren_d(decode_io_dec_alu_dec_csr_ren_d),
    .io_dec_alu_dec_i0_br_immed_d(decode_io_dec_alu_dec_i0_br_immed_d),
    .io_dec_alu_exu_i0_pc_x(decode_io_dec_alu_exu_i0_pc_x),
    .io_dec_div_div_p_valid(decode_io_dec_div_div_p_valid),
    .io_dec_div_div_p_bits_unsign(decode_io_dec_div_div_p_bits_unsign),
    .io_dec_div_div_p_bits_rem(decode_io_dec_div_div_p_bits_rem),
    .io_dec_div_dec_div_cancel(decode_io_dec_div_dec_div_cancel),
    .io_dctl_busbuff_lsu_nonblock_load_valid_m(decode_io_dctl_busbuff_lsu_nonblock_load_valid_m),
    .io_dctl_busbuff_lsu_nonblock_load_tag_m(decode_io_dctl_busbuff_lsu_nonblock_load_tag_m),
    .io_dctl_busbuff_lsu_nonblock_load_inv_r(decode_io_dctl_busbuff_lsu_nonblock_load_inv_r),
    .io_dctl_busbuff_lsu_nonblock_load_inv_tag_r(decode_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r),
    .io_dctl_busbuff_lsu_nonblock_load_data_valid(decode_io_dctl_busbuff_lsu_nonblock_load_data_valid),
    .io_dctl_busbuff_lsu_nonblock_load_data_error(decode_io_dctl_busbuff_lsu_nonblock_load_data_error),
    .io_dctl_busbuff_lsu_nonblock_load_data_tag(decode_io_dctl_busbuff_lsu_nonblock_load_data_tag),
    .io_dctl_dma_dma_dccm_stall_any(decode_io_dctl_dma_dma_dccm_stall_any),
    .io_dec_aln_dec_i0_decode_d(decode_io_dec_aln_dec_i0_decode_d),
    .io_dec_aln_ifu_i0_cinst(decode_io_dec_aln_ifu_i0_cinst),
    .io_dbg_dctl_dbg_cmd_wrdata(decode_io_dbg_dctl_dbg_cmd_wrdata),
    .io_dec_tlu_trace_disable(decode_io_dec_tlu_trace_disable),
    .io_dec_debug_valid_d(decode_io_dec_debug_valid_d),
    .io_dec_tlu_flush_extint(decode_io_dec_tlu_flush_extint),
    .io_dec_tlu_force_halt(decode_io_dec_tlu_force_halt),
    .io_dec_i0_inst_wb(decode_io_dec_i0_inst_wb),
    .io_dec_i0_pc_wb(decode_io_dec_i0_pc_wb),
    .io_dec_i0_trigger_match_d(decode_io_dec_i0_trigger_match_d),
    .io_dec_tlu_wr_pause_r(decode_io_dec_tlu_wr_pause_r),
    .io_dec_tlu_pipelining_disable(decode_io_dec_tlu_pipelining_disable),
    .io_lsu_trigger_match_m(decode_io_lsu_trigger_match_m),
    .io_lsu_pmu_misaligned_m(decode_io_lsu_pmu_misaligned_m),
    .io_dec_tlu_debug_stall(decode_io_dec_tlu_debug_stall),
    .io_dec_tlu_flush_leak_one_r(decode_io_dec_tlu_flush_leak_one_r),
    .io_dec_debug_fence_d(decode_io_dec_debug_fence_d),
    .io_dec_i0_icaf_d(decode_io_dec_i0_icaf_d),
    .io_dec_i0_icaf_second_d(decode_io_dec_i0_icaf_second_d),
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
    .io_lsu_result_m(decode_io_lsu_result_m),
    .io_lsu_result_corr_r(decode_io_lsu_result_corr_r),
    .io_exu_flush_final(decode_io_exu_flush_final),
    .io_dec_i0_instr_d(decode_io_dec_i0_instr_d),
    .io_dec_ib0_valid_d(decode_io_dec_ib0_valid_d),
    .io_active_clk(decode_io_active_clk),
    .io_free_l2clk(decode_io_free_l2clk),
    .io_clk_override(decode_io_clk_override),
    .io_dec_i0_rs1_d(decode_io_dec_i0_rs1_d),
    .io_dec_i0_rs2_d(decode_io_dec_i0_rs2_d),
    .io_dec_i0_waddr_r(decode_io_dec_i0_waddr_r),
    .io_dec_i0_wen_r(decode_io_dec_i0_wen_r),
    .io_dec_i0_wdata_r(decode_io_dec_i0_wdata_r),
    .io_lsu_p_valid(decode_io_lsu_p_valid),
    .io_lsu_p_bits_fast_int(decode_io_lsu_p_bits_fast_int),
    .io_lsu_p_bits_stack(decode_io_lsu_p_bits_stack),
    .io_lsu_p_bits_by(decode_io_lsu_p_bits_by),
    .io_lsu_p_bits_half(decode_io_lsu_p_bits_half),
    .io_lsu_p_bits_word(decode_io_lsu_p_bits_word),
    .io_lsu_p_bits_load(decode_io_lsu_p_bits_load),
    .io_lsu_p_bits_store(decode_io_lsu_p_bits_store),
    .io_lsu_p_bits_unsign(decode_io_lsu_p_bits_unsign),
    .io_lsu_p_bits_store_data_bypass_d(decode_io_lsu_p_bits_store_data_bypass_d),
    .io_lsu_p_bits_load_ldst_bypass_d(decode_io_lsu_p_bits_load_ldst_bypass_d),
    .io_div_waddr_wb(decode_io_div_waddr_wb),
    .io_dec_lsu_valid_raw_d(decode_io_dec_lsu_valid_raw_d),
    .io_dec_lsu_offset_d(decode_io_dec_lsu_offset_d),
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
    .io_dec_tlu_packet_r_icaf_second(decode_io_dec_tlu_packet_r_icaf_second),
    .io_dec_tlu_packet_r_icaf_type(decode_io_dec_tlu_packet_r_icaf_type),
    .io_dec_tlu_packet_r_fence_i(decode_io_dec_tlu_packet_r_fence_i),
    .io_dec_tlu_packet_r_i0trigger(decode_io_dec_tlu_packet_r_i0trigger),
    .io_dec_tlu_packet_r_pmu_i0_itype(decode_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(decode_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(decode_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(decode_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_dec_tlu_i0_pc_r(decode_io_dec_tlu_i0_pc_r),
    .io_dec_illegal_inst(decode_io_dec_illegal_inst),
    .io_dec_pmu_instr_decoded(decode_io_dec_pmu_instr_decoded),
    .io_dec_pmu_decode_stall(decode_io_dec_pmu_decode_stall),
    .io_dec_pmu_presync_stall(decode_io_dec_pmu_presync_stall),
    .io_dec_pmu_postsync_stall(decode_io_dec_pmu_postsync_stall),
    .io_dec_nonblock_load_wen(decode_io_dec_nonblock_load_wen),
    .io_dec_nonblock_load_waddr(decode_io_dec_nonblock_load_waddr),
    .io_dec_pause_state(decode_io_dec_pause_state),
    .io_dec_pause_state_cg(decode_io_dec_pause_state_cg),
    .io_dec_div_active(decode_io_dec_div_active)
  );
  dec_gpr_ctl gpr ( // @[dec.scala 130:19]
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
    .io_gpr_exu_gpr_i0_rs1_d(gpr_io_gpr_exu_gpr_i0_rs1_d),
    .io_gpr_exu_gpr_i0_rs2_d(gpr_io_gpr_exu_gpr_i0_rs2_d)
  );
  dec_tlu_ctl tlu ( // @[dec.scala 131:19]
    .clock(tlu_clock),
    .reset(tlu_reset),
    .io_tlu_exu_dec_tlu_meihap(tlu_io_tlu_exu_dec_tlu_meihap),
    .io_tlu_exu_dec_tlu_flush_lower_r(tlu_io_tlu_exu_dec_tlu_flush_lower_r),
    .io_tlu_exu_dec_tlu_flush_path_r(tlu_io_tlu_exu_dec_tlu_flush_path_r),
    .io_tlu_exu_exu_i0_br_hist_r(tlu_io_tlu_exu_exu_i0_br_hist_r),
    .io_tlu_exu_exu_i0_br_error_r(tlu_io_tlu_exu_exu_i0_br_error_r),
    .io_tlu_exu_exu_i0_br_start_error_r(tlu_io_tlu_exu_exu_i0_br_start_error_r),
    .io_tlu_exu_exu_i0_br_valid_r(tlu_io_tlu_exu_exu_i0_br_valid_r),
    .io_tlu_exu_exu_i0_br_mp_r(tlu_io_tlu_exu_exu_i0_br_mp_r),
    .io_tlu_exu_exu_i0_br_middle_r(tlu_io_tlu_exu_exu_i0_br_middle_r),
    .io_tlu_exu_exu_pmu_i0_br_misp(tlu_io_tlu_exu_exu_pmu_i0_br_misp),
    .io_tlu_exu_exu_pmu_i0_br_ataken(tlu_io_tlu_exu_exu_pmu_i0_br_ataken),
    .io_tlu_exu_exu_pmu_i0_pc4(tlu_io_tlu_exu_exu_pmu_i0_pc4),
    .io_tlu_exu_exu_npc_r(tlu_io_tlu_exu_exu_npc_r),
    .io_tlu_dma_dma_pmu_dccm_read(tlu_io_tlu_dma_dma_pmu_dccm_read),
    .io_tlu_dma_dma_pmu_dccm_write(tlu_io_tlu_dma_dma_pmu_dccm_write),
    .io_tlu_dma_dma_pmu_any_read(tlu_io_tlu_dma_dma_pmu_any_read),
    .io_tlu_dma_dma_pmu_any_write(tlu_io_tlu_dma_dma_pmu_any_write),
    .io_tlu_dma_dec_tlu_dma_qos_prty(tlu_io_tlu_dma_dec_tlu_dma_qos_prty),
    .io_tlu_dma_dma_dccm_stall_any(tlu_io_tlu_dma_dma_dccm_stall_any),
    .io_tlu_dma_dma_iccm_stall_any(tlu_io_tlu_dma_dma_iccm_stall_any),
    .io_free_clk(tlu_io_free_clk),
    .io_free_l2clk(tlu_io_free_l2clk),
    .io_rst_vec(tlu_io_rst_vec),
    .io_nmi_int(tlu_io_nmi_int),
    .io_nmi_vec(tlu_io_nmi_vec),
    .io_i_cpu_halt_req(tlu_io_i_cpu_halt_req),
    .io_i_cpu_run_req(tlu_io_i_cpu_run_req),
    .io_lsu_fastint_stall_any(tlu_io_lsu_fastint_stall_any),
    .io_lsu_idle_any(tlu_io_lsu_idle_any),
    .io_dec_pmu_instr_decoded(tlu_io_dec_pmu_instr_decoded),
    .io_dec_pmu_decode_stall(tlu_io_dec_pmu_decode_stall),
    .io_dec_pmu_presync_stall(tlu_io_dec_pmu_presync_stall),
    .io_dec_pmu_postsync_stall(tlu_io_dec_pmu_postsync_stall),
    .io_lsu_store_stall_any(tlu_io_lsu_store_stall_any),
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
    .io_dec_csr_wen_unq_d(tlu_io_dec_csr_wen_unq_d),
    .io_dec_csr_any_unq_d(tlu_io_dec_csr_any_unq_d),
    .io_dec_csr_rdaddr_d(tlu_io_dec_csr_rdaddr_d),
    .io_dec_csr_wen_r(tlu_io_dec_csr_wen_r),
    .io_dec_csr_wraddr_r(tlu_io_dec_csr_wraddr_r),
    .io_dec_csr_wrdata_r(tlu_io_dec_csr_wrdata_r),
    .io_dec_csr_stall_int_ff(tlu_io_dec_csr_stall_int_ff),
    .io_dec_tlu_i0_valid_r(tlu_io_dec_tlu_i0_valid_r),
    .io_dec_tlu_i0_pc_r(tlu_io_dec_tlu_i0_pc_r),
    .io_dec_tlu_packet_r_legal(tlu_io_dec_tlu_packet_r_legal),
    .io_dec_tlu_packet_r_icaf(tlu_io_dec_tlu_packet_r_icaf),
    .io_dec_tlu_packet_r_icaf_second(tlu_io_dec_tlu_packet_r_icaf_second),
    .io_dec_tlu_packet_r_icaf_type(tlu_io_dec_tlu_packet_r_icaf_type),
    .io_dec_tlu_packet_r_fence_i(tlu_io_dec_tlu_packet_r_fence_i),
    .io_dec_tlu_packet_r_i0trigger(tlu_io_dec_tlu_packet_r_i0trigger),
    .io_dec_tlu_packet_r_pmu_i0_itype(tlu_io_dec_tlu_packet_r_pmu_i0_itype),
    .io_dec_tlu_packet_r_pmu_i0_br_unpred(tlu_io_dec_tlu_packet_r_pmu_i0_br_unpred),
    .io_dec_tlu_packet_r_pmu_divide(tlu_io_dec_tlu_packet_r_pmu_divide),
    .io_dec_tlu_packet_r_pmu_lsu_misaligned(tlu_io_dec_tlu_packet_r_pmu_lsu_misaligned),
    .io_dec_illegal_inst(tlu_io_dec_illegal_inst),
    .io_dec_i0_decode_d(tlu_io_dec_i0_decode_d),
    .io_exu_i0_br_way_r(tlu_io_exu_i0_br_way_r),
    .io_dec_tlu_core_empty(tlu_io_dec_tlu_core_empty),
    .io_dec_dbg_cmd_done(tlu_io_dec_dbg_cmd_done),
    .io_dec_dbg_cmd_fail(tlu_io_dec_dbg_cmd_fail),
    .io_dec_tlu_dbg_halted(tlu_io_dec_tlu_dbg_halted),
    .io_dec_tlu_debug_mode(tlu_io_dec_tlu_debug_mode),
    .io_dec_tlu_resume_ack(tlu_io_dec_tlu_resume_ack),
    .io_dec_tlu_debug_stall(tlu_io_dec_tlu_debug_stall),
    .io_dec_tlu_mpc_halted_only(tlu_io_dec_tlu_mpc_halted_only),
    .io_dec_tlu_flush_extint(tlu_io_dec_tlu_flush_extint),
    .io_dbg_halt_req(tlu_io_dbg_halt_req),
    .io_dbg_resume_req(tlu_io_dbg_resume_req),
    .io_dec_div_active(tlu_io_dec_div_active),
    .io_trigger_pkt_any_0_select(tlu_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_pkt(tlu_io_trigger_pkt_any_0_match_pkt),
    .io_trigger_pkt_any_0_store(tlu_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(tlu_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_execute(tlu_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(tlu_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(tlu_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(tlu_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_pkt(tlu_io_trigger_pkt_any_1_match_pkt),
    .io_trigger_pkt_any_1_store(tlu_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(tlu_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_execute(tlu_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(tlu_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(tlu_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(tlu_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_pkt(tlu_io_trigger_pkt_any_2_match_pkt),
    .io_trigger_pkt_any_2_store(tlu_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(tlu_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_execute(tlu_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(tlu_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(tlu_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(tlu_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_pkt(tlu_io_trigger_pkt_any_3_match_pkt),
    .io_trigger_pkt_any_3_store(tlu_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(tlu_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_execute(tlu_io_trigger_pkt_any_3_execute),
    .io_trigger_pkt_any_3_m(tlu_io_trigger_pkt_any_3_m),
    .io_trigger_pkt_any_3_tdata2(tlu_io_trigger_pkt_any_3_tdata2),
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
    .io_dec_csr_rddata_d(tlu_io_dec_csr_rddata_d),
    .io_dec_csr_legal_d(tlu_io_dec_csr_legal_d),
    .io_dec_tlu_i0_kill_writeb_wb(tlu_io_dec_tlu_i0_kill_writeb_wb),
    .io_dec_tlu_i0_kill_writeb_r(tlu_io_dec_tlu_i0_kill_writeb_r),
    .io_dec_tlu_wr_pause_r(tlu_io_dec_tlu_wr_pause_r),
    .io_dec_tlu_flush_pause_r(tlu_io_dec_tlu_flush_pause_r),
    .io_dec_tlu_presync_d(tlu_io_dec_tlu_presync_d),
    .io_dec_tlu_postsync_d(tlu_io_dec_tlu_postsync_d),
    .io_dec_tlu_perfcnt0(tlu_io_dec_tlu_perfcnt0),
    .io_dec_tlu_perfcnt1(tlu_io_dec_tlu_perfcnt1),
    .io_dec_tlu_perfcnt2(tlu_io_dec_tlu_perfcnt2),
    .io_dec_tlu_perfcnt3(tlu_io_dec_tlu_perfcnt3),
    .io_dec_tlu_i0_exc_valid_wb1(tlu_io_dec_tlu_i0_exc_valid_wb1),
    .io_dec_tlu_i0_valid_wb1(tlu_io_dec_tlu_i0_valid_wb1),
    .io_dec_tlu_int_valid_wb1(tlu_io_dec_tlu_int_valid_wb1),
    .io_dec_tlu_exc_cause_wb1(tlu_io_dec_tlu_exc_cause_wb1),
    .io_dec_tlu_mtval_wb1(tlu_io_dec_tlu_mtval_wb1),
    .io_dec_tlu_pipelining_disable(tlu_io_dec_tlu_pipelining_disable),
    .io_dec_tlu_trace_disable(tlu_io_dec_tlu_trace_disable),
    .io_dec_tlu_misc_clk_override(tlu_io_dec_tlu_misc_clk_override),
    .io_dec_tlu_dec_clk_override(tlu_io_dec_tlu_dec_clk_override),
    .io_dec_tlu_ifu_clk_override(tlu_io_dec_tlu_ifu_clk_override),
    .io_dec_tlu_lsu_clk_override(tlu_io_dec_tlu_lsu_clk_override),
    .io_dec_tlu_bus_clk_override(tlu_io_dec_tlu_bus_clk_override),
    .io_dec_tlu_pic_clk_override(tlu_io_dec_tlu_pic_clk_override),
    .io_dec_tlu_dccm_clk_override(tlu_io_dec_tlu_dccm_clk_override),
    .io_dec_tlu_icm_clk_override(tlu_io_dec_tlu_icm_clk_override),
    .io_dec_tlu_flush_lower_wb(tlu_io_dec_tlu_flush_lower_wb),
    .io_ifu_pmu_instr_aligned(tlu_io_ifu_pmu_instr_aligned),
    .io_tlu_bp_dec_tlu_br0_r_pkt_valid(tlu_io_tlu_bp_dec_tlu_br0_r_pkt_valid),
    .io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist(tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist),
    .io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error(tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error),
    .io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error(tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error),
    .io_tlu_bp_dec_tlu_br0_r_pkt_bits_way(tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_way),
    .io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle(tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle),
    .io_tlu_bp_dec_tlu_flush_leak_one_wb(tlu_io_tlu_bp_dec_tlu_flush_leak_one_wb),
    .io_tlu_bp_dec_tlu_bpred_disable(tlu_io_tlu_bp_dec_tlu_bpred_disable),
    .io_tlu_ifc_dec_tlu_flush_noredir_wb(tlu_io_tlu_ifc_dec_tlu_flush_noredir_wb),
    .io_tlu_ifc_dec_tlu_mrac_ff(tlu_io_tlu_ifc_dec_tlu_mrac_ff),
    .io_tlu_ifc_ifu_pmu_fetch_stall(tlu_io_tlu_ifc_ifu_pmu_fetch_stall),
    .io_tlu_mem_dec_tlu_flush_err_wb(tlu_io_tlu_mem_dec_tlu_flush_err_wb),
    .io_tlu_mem_dec_tlu_i0_commit_cmt(tlu_io_tlu_mem_dec_tlu_i0_commit_cmt),
    .io_tlu_mem_dec_tlu_force_halt(tlu_io_tlu_mem_dec_tlu_force_halt),
    .io_tlu_mem_dec_tlu_fence_i_wb(tlu_io_tlu_mem_dec_tlu_fence_i_wb),
    .io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata(tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata),
    .io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics(tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics),
    .io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid(tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid),
    .io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid(tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid),
    .io_tlu_mem_dec_tlu_core_ecc_disable(tlu_io_tlu_mem_dec_tlu_core_ecc_disable),
    .io_tlu_mem_ifu_pmu_ic_miss(tlu_io_tlu_mem_ifu_pmu_ic_miss),
    .io_tlu_mem_ifu_pmu_ic_hit(tlu_io_tlu_mem_ifu_pmu_ic_hit),
    .io_tlu_mem_ifu_pmu_bus_error(tlu_io_tlu_mem_ifu_pmu_bus_error),
    .io_tlu_mem_ifu_pmu_bus_busy(tlu_io_tlu_mem_ifu_pmu_bus_busy),
    .io_tlu_mem_ifu_pmu_bus_trxn(tlu_io_tlu_mem_ifu_pmu_bus_trxn),
    .io_tlu_mem_ifu_ic_error_start(tlu_io_tlu_mem_ifu_ic_error_start),
    .io_tlu_mem_ifu_iccm_rd_ecc_single_err(tlu_io_tlu_mem_ifu_iccm_rd_ecc_single_err),
    .io_tlu_mem_ifu_ic_debug_rd_data(tlu_io_tlu_mem_ifu_ic_debug_rd_data),
    .io_tlu_mem_ifu_ic_debug_rd_data_valid(tlu_io_tlu_mem_ifu_ic_debug_rd_data_valid),
    .io_tlu_mem_ifu_miss_state_idle(tlu_io_tlu_mem_ifu_miss_state_idle),
    .io_tlu_busbuff_lsu_pmu_bus_trxn(tlu_io_tlu_busbuff_lsu_pmu_bus_trxn),
    .io_tlu_busbuff_lsu_pmu_bus_misaligned(tlu_io_tlu_busbuff_lsu_pmu_bus_misaligned),
    .io_tlu_busbuff_lsu_pmu_bus_error(tlu_io_tlu_busbuff_lsu_pmu_bus_error),
    .io_tlu_busbuff_lsu_pmu_bus_busy(tlu_io_tlu_busbuff_lsu_pmu_bus_busy),
    .io_tlu_busbuff_dec_tlu_external_ldfwd_disable(tlu_io_tlu_busbuff_dec_tlu_external_ldfwd_disable),
    .io_tlu_busbuff_dec_tlu_wb_coalescing_disable(tlu_io_tlu_busbuff_dec_tlu_wb_coalescing_disable),
    .io_tlu_busbuff_dec_tlu_sideeffect_posted_disable(tlu_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable),
    .io_tlu_busbuff_lsu_imprecise_error_load_any(tlu_io_tlu_busbuff_lsu_imprecise_error_load_any),
    .io_tlu_busbuff_lsu_imprecise_error_store_any(tlu_io_tlu_busbuff_lsu_imprecise_error_store_any),
    .io_tlu_busbuff_lsu_imprecise_error_addr_any(tlu_io_tlu_busbuff_lsu_imprecise_error_addr_any),
    .io_lsu_tlu_lsu_pmu_load_external_m(tlu_io_lsu_tlu_lsu_pmu_load_external_m),
    .io_lsu_tlu_lsu_pmu_store_external_m(tlu_io_lsu_tlu_lsu_pmu_store_external_m),
    .io_dec_pic_pic_claimid(tlu_io_dec_pic_pic_claimid),
    .io_dec_pic_pic_pl(tlu_io_dec_pic_pic_pl),
    .io_dec_pic_mhwakeup(tlu_io_dec_pic_mhwakeup),
    .io_dec_pic_dec_tlu_meicurpl(tlu_io_dec_pic_dec_tlu_meicurpl),
    .io_dec_pic_dec_tlu_meipt(tlu_io_dec_pic_dec_tlu_meipt),
    .io_dec_pic_mexintpend(tlu_io_dec_pic_mexintpend)
  );
  dec_trigger dec_trigger ( // @[dec.scala 132:27]
    .io_trigger_pkt_any_0_select(dec_trigger_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_pkt(dec_trigger_io_trigger_pkt_any_0_match_pkt),
    .io_trigger_pkt_any_0_execute(dec_trigger_io_trigger_pkt_any_0_execute),
    .io_trigger_pkt_any_0_m(dec_trigger_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(dec_trigger_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(dec_trigger_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_pkt(dec_trigger_io_trigger_pkt_any_1_match_pkt),
    .io_trigger_pkt_any_1_execute(dec_trigger_io_trigger_pkt_any_1_execute),
    .io_trigger_pkt_any_1_m(dec_trigger_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(dec_trigger_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(dec_trigger_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_pkt(dec_trigger_io_trigger_pkt_any_2_match_pkt),
    .io_trigger_pkt_any_2_execute(dec_trigger_io_trigger_pkt_any_2_execute),
    .io_trigger_pkt_any_2_m(dec_trigger_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(dec_trigger_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(dec_trigger_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_pkt(dec_trigger_io_trigger_pkt_any_3_match_pkt),
    .io_trigger_pkt_any_3_execute(dec_trigger_io_trigger_pkt_any_3_execute),
    .io_trigger_pkt_any_3_m(dec_trigger_io_trigger_pkt_any_3_m),
    .io_trigger_pkt_any_3_tdata2(dec_trigger_io_trigger_pkt_any_3_tdata2),
    .io_dec_i0_pc_d(dec_trigger_io_dec_i0_pc_d),
    .io_dec_i0_trigger_match_d(dec_trigger_io_dec_i0_trigger_match_d)
  );
  assign io_dec_pause_state_cg = decode_io_dec_pause_state_cg; // @[dec.scala 202:48]
  assign io_dec_tlu_core_empty = tlu_io_dec_tlu_core_empty; // @[dec.scala 304:36]
  assign io_dec_fa_error_index = 9'h0; // @[dec.scala 204:48]
  assign io_o_cpu_halt_status = tlu_io_o_cpu_halt_status; // @[dec.scala 279:29]
  assign io_o_cpu_halt_ack = tlu_io_o_cpu_halt_ack; // @[dec.scala 280:29]
  assign io_o_cpu_run_ack = tlu_io_o_cpu_run_ack; // @[dec.scala 281:29]
  assign io_o_debug_mode_status = tlu_io_o_debug_mode_status; // @[dec.scala 282:29]
  assign io_mpc_debug_halt_ack = tlu_io_mpc_debug_halt_ack; // @[dec.scala 283:29]
  assign io_mpc_debug_run_ack = tlu_io_mpc_debug_run_ack; // @[dec.scala 284:29]
  assign io_debug_brkpt_status = tlu_io_debug_brkpt_status; // @[dec.scala 285:29]
  assign io_dec_tlu_dbg_halted = tlu_io_dec_tlu_dbg_halted; // @[dec.scala 274:28]
  assign io_dec_tlu_debug_mode = tlu_io_dec_tlu_debug_mode; // @[dec.scala 275:28]
  assign io_dec_tlu_resume_ack = tlu_io_dec_tlu_resume_ack; // @[dec.scala 276:28]
  assign io_dec_tlu_mpc_halted_only = tlu_io_dec_tlu_mpc_halted_only; // @[dec.scala 277:51]
  assign io_dec_dbg_rddata = decode_io_dec_i0_wdata_r; // @[dec.scala 320:21]
  assign io_dec_csr_rddata_d = tlu_io_dec_csr_rddata_d; // @[dec.scala 305:36]
  assign io_dec_dbg_cmd_done = tlu_io_dec_dbg_cmd_done; // @[dec.scala 272:28]
  assign io_dec_dbg_cmd_fail = tlu_io_dec_dbg_cmd_fail; // @[dec.scala 273:28]
  assign io_trigger_pkt_any_0_select = tlu_io_trigger_pkt_any_0_select; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_0_match_pkt = tlu_io_trigger_pkt_any_0_match_pkt; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_0_store = tlu_io_trigger_pkt_any_0_store; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_0_load = tlu_io_trigger_pkt_any_0_load; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_0_execute = tlu_io_trigger_pkt_any_0_execute; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_0_m = tlu_io_trigger_pkt_any_0_m; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_0_tdata2 = tlu_io_trigger_pkt_any_0_tdata2; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_select = tlu_io_trigger_pkt_any_1_select; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_match_pkt = tlu_io_trigger_pkt_any_1_match_pkt; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_store = tlu_io_trigger_pkt_any_1_store; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_load = tlu_io_trigger_pkt_any_1_load; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_execute = tlu_io_trigger_pkt_any_1_execute; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_m = tlu_io_trigger_pkt_any_1_m; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_1_tdata2 = tlu_io_trigger_pkt_any_1_tdata2; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_select = tlu_io_trigger_pkt_any_2_select; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_match_pkt = tlu_io_trigger_pkt_any_2_match_pkt; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_store = tlu_io_trigger_pkt_any_2_store; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_load = tlu_io_trigger_pkt_any_2_load; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_execute = tlu_io_trigger_pkt_any_2_execute; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_m = tlu_io_trigger_pkt_any_2_m; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_2_tdata2 = tlu_io_trigger_pkt_any_2_tdata2; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_select = tlu_io_trigger_pkt_any_3_select; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_match_pkt = tlu_io_trigger_pkt_any_3_match_pkt; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_store = tlu_io_trigger_pkt_any_3_store; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_load = tlu_io_trigger_pkt_any_3_load; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_execute = tlu_io_trigger_pkt_any_3_execute; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_m = tlu_io_trigger_pkt_any_3_m; // @[dec.scala 278:29]
  assign io_trigger_pkt_any_3_tdata2 = tlu_io_trigger_pkt_any_3_tdata2; // @[dec.scala 278:29]
  assign io_lsu_p_valid = decode_io_lsu_p_valid; // @[dec.scala 199:48]
  assign io_lsu_p_bits_fast_int = decode_io_lsu_p_bits_fast_int; // @[dec.scala 199:48]
  assign io_lsu_p_bits_stack = decode_io_lsu_p_bits_stack; // @[dec.scala 199:48]
  assign io_lsu_p_bits_by = decode_io_lsu_p_bits_by; // @[dec.scala 199:48]
  assign io_lsu_p_bits_half = decode_io_lsu_p_bits_half; // @[dec.scala 199:48]
  assign io_lsu_p_bits_word = decode_io_lsu_p_bits_word; // @[dec.scala 199:48]
  assign io_lsu_p_bits_dword = 1'h0; // @[dec.scala 199:48]
  assign io_lsu_p_bits_load = decode_io_lsu_p_bits_load; // @[dec.scala 199:48]
  assign io_lsu_p_bits_store = decode_io_lsu_p_bits_store; // @[dec.scala 199:48]
  assign io_lsu_p_bits_unsign = decode_io_lsu_p_bits_unsign; // @[dec.scala 199:48]
  assign io_lsu_p_bits_dma = 1'h0; // @[dec.scala 199:48]
  assign io_lsu_p_bits_store_data_bypass_d = decode_io_lsu_p_bits_store_data_bypass_d; // @[dec.scala 199:48]
  assign io_lsu_p_bits_load_ldst_bypass_d = decode_io_lsu_p_bits_load_ldst_bypass_d; // @[dec.scala 199:48]
  assign io_lsu_p_bits_store_data_bypass_m = 1'h0; // @[dec.scala 199:48]
  assign io_dec_lsu_offset_d = decode_io_dec_lsu_offset_d; // @[dec.scala 201:48]
  assign io_dec_tlu_i0_kill_writeb_r = tlu_io_dec_tlu_i0_kill_writeb_r; // @[dec.scala 286:34]
  assign io_dec_tlu_perfcnt0 = tlu_io_dec_tlu_perfcnt0; // @[dec.scala 287:29]
  assign io_dec_tlu_perfcnt1 = tlu_io_dec_tlu_perfcnt1; // @[dec.scala 288:29]
  assign io_dec_tlu_perfcnt2 = tlu_io_dec_tlu_perfcnt2; // @[dec.scala 289:29]
  assign io_dec_tlu_perfcnt3 = tlu_io_dec_tlu_perfcnt3; // @[dec.scala 290:29]
  assign io_dec_tlu_flush_lower_wb = tlu_io_dec_tlu_flush_lower_wb; // @[dec.scala 306:36]
  assign io_dec_lsu_valid_raw_d = decode_io_dec_lsu_valid_raw_d; // @[dec.scala 200:48]
  assign io_trace_rv_trace_pkt_rv_i_valid_ip = _T_1 | tlu_io_dec_tlu_i0_exc_valid_wb1; // @[dec.scala 312:39]
  assign io_trace_rv_trace_pkt_rv_i_insn_ip = decode_io_dec_i0_inst_wb; // @[dec.scala 310:38]
  assign io_trace_rv_trace_pkt_rv_i_address_ip = {decode_io_dec_i0_pc_wb,1'h0}; // @[dec.scala 311:41]
  assign io_trace_rv_trace_pkt_rv_i_exception_ip = tlu_io_dec_tlu_int_valid_wb1 | tlu_io_dec_tlu_i0_exc_valid_wb1; // @[dec.scala 313:43]
  assign io_trace_rv_trace_pkt_rv_i_ecause_ip = tlu_io_dec_tlu_exc_cause_wb1; // @[dec.scala 314:40]
  assign io_trace_rv_trace_pkt_rv_i_interrupt_ip = tlu_io_dec_tlu_int_valid_wb1; // @[dec.scala 315:43]
  assign io_trace_rv_trace_pkt_rv_i_tval_ip = tlu_io_dec_tlu_mtval_wb1; // @[dec.scala 316:38]
  assign io_dec_tlu_misc_clk_override = tlu_io_dec_tlu_misc_clk_override; // @[dec.scala 296:35]
  assign io_dec_tlu_ifu_clk_override = tlu_io_dec_tlu_ifu_clk_override; // @[dec.scala 297:36]
  assign io_dec_tlu_lsu_clk_override = tlu_io_dec_tlu_lsu_clk_override; // @[dec.scala 298:36]
  assign io_dec_tlu_bus_clk_override = tlu_io_dec_tlu_bus_clk_override; // @[dec.scala 299:36]
  assign io_dec_tlu_pic_clk_override = tlu_io_dec_tlu_pic_clk_override; // @[dec.scala 300:36]
  assign io_dec_tlu_picio_clk_override = tlu_io_dec_tlu_icm_clk_override; // @[dec.scala 303:36]
  assign io_dec_tlu_dccm_clk_override = tlu_io_dec_tlu_dccm_clk_override; // @[dec.scala 301:36]
  assign io_dec_tlu_icm_clk_override = tlu_io_dec_tlu_icm_clk_override; // @[dec.scala 302:36]
  assign io_ifu_dec_dec_aln_aln_dec_dec_i0_decode_d = decode_io_dec_aln_dec_i0_decode_d; // @[dec.scala 145:21]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_flush_err_wb = tlu_io_tlu_mem_dec_tlu_flush_err_wb; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_i0_commit_cmt = tlu_io_tlu_mem_dec_tlu_i0_commit_cmt; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_force_halt = tlu_io_tlu_mem_dec_tlu_force_halt; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_fence_i_wb = tlu_io_tlu_mem_dec_tlu_fence_i_wb; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_wrdata = tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wrdata; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_dicawics = tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_dicawics; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_rd_valid = tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_rd_valid; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_ic_diag_pkt_icache_wr_valid = tlu_io_tlu_mem_dec_tlu_ic_diag_pkt_icache_wr_valid; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_mem_ctrl_dec_tlu_core_ecc_disable = tlu_io_tlu_mem_dec_tlu_core_ecc_disable; // @[dec.scala 220:18]
  assign io_ifu_dec_dec_ifc_dec_tlu_flush_noredir_wb = tlu_io_tlu_ifc_dec_tlu_flush_noredir_wb; // @[dec.scala 221:18]
  assign io_ifu_dec_dec_ifc_dec_tlu_mrac_ff = tlu_io_tlu_ifc_dec_tlu_mrac_ff; // @[dec.scala 221:18]
  assign io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_valid = tlu_io_tlu_bp_dec_tlu_br0_r_pkt_valid; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_hist = tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_hist; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_br_error = tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_error; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_br_start_error = tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_br_start_error; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_way = tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_way; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_br0_r_pkt_bits_middle = tlu_io_tlu_bp_dec_tlu_br0_r_pkt_bits_middle; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_flush_leak_one_wb = tlu_io_tlu_bp_dec_tlu_flush_leak_one_wb; // @[dec.scala 222:18]
  assign io_ifu_dec_dec_bp_dec_tlu_bpred_disable = tlu_io_tlu_bp_dec_tlu_bpred_disable; // @[dec.scala 222:18]
  assign io_dec_exu_dec_alu_dec_i0_alu_decode_d = decode_io_dec_alu_dec_i0_alu_decode_d; // @[dec.scala 148:20]
  assign io_dec_exu_dec_alu_dec_csr_ren_d = decode_io_dec_alu_dec_csr_ren_d; // @[dec.scala 148:20]
  assign io_dec_exu_dec_alu_dec_i0_br_immed_d = decode_io_dec_alu_dec_i0_br_immed_d; // @[dec.scala 148:20]
  assign io_dec_exu_dec_div_div_p_valid = decode_io_dec_div_div_p_valid; // @[dec.scala 149:20]
  assign io_dec_exu_dec_div_div_p_bits_unsign = decode_io_dec_div_div_p_bits_unsign; // @[dec.scala 149:20]
  assign io_dec_exu_dec_div_div_p_bits_rem = decode_io_dec_div_div_p_bits_rem; // @[dec.scala 149:20]
  assign io_dec_exu_dec_div_dec_div_cancel = decode_io_dec_div_dec_div_cancel; // @[dec.scala 149:20]
  assign io_dec_exu_decode_exu_dec_data_en = decode_io_decode_exu_dec_data_en; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_ctl_en = decode_io_decode_exu_dec_ctl_en; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_clz = decode_io_decode_exu_i0_ap_clz; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_ctz = decode_io_decode_exu_i0_ap_ctz; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_pcnt = decode_io_decode_exu_i0_ap_pcnt; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sext_b = decode_io_decode_exu_i0_ap_sext_b; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sext_h = decode_io_decode_exu_i0_ap_sext_h; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_slo = decode_io_decode_exu_i0_ap_slo; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sro = decode_io_decode_exu_i0_ap_sro; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_min = decode_io_decode_exu_i0_ap_min; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_max = decode_io_decode_exu_i0_ap_max; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_pack = decode_io_decode_exu_i0_ap_pack; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_packu = decode_io_decode_exu_i0_ap_packu; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_packh = decode_io_decode_exu_i0_ap_packh; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_rol = decode_io_decode_exu_i0_ap_rol; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_ror = decode_io_decode_exu_i0_ap_ror; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_grev = decode_io_decode_exu_i0_ap_grev; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_gorc = decode_io_decode_exu_i0_ap_gorc; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_zbb = decode_io_decode_exu_i0_ap_zbb; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sbset = decode_io_decode_exu_i0_ap_sbset; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sbclr = decode_io_decode_exu_i0_ap_sbclr; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sbinv = decode_io_decode_exu_i0_ap_sbinv; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sbext = decode_io_decode_exu_i0_ap_sbext; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sh1add = decode_io_decode_exu_i0_ap_sh1add; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sh2add = decode_io_decode_exu_i0_ap_sh2add; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sh3add = decode_io_decode_exu_i0_ap_sh3add; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_zba = decode_io_decode_exu_i0_ap_zba; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_land = decode_io_decode_exu_i0_ap_land; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_lor = decode_io_decode_exu_i0_ap_lor; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_lxor = decode_io_decode_exu_i0_ap_lxor; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sll = decode_io_decode_exu_i0_ap_sll; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_srl = decode_io_decode_exu_i0_ap_srl; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sra = decode_io_decode_exu_i0_ap_sra; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_beq = decode_io_decode_exu_i0_ap_beq; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_bne = decode_io_decode_exu_i0_ap_bne; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_blt = decode_io_decode_exu_i0_ap_blt; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_bge = decode_io_decode_exu_i0_ap_bge; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_add = decode_io_decode_exu_i0_ap_add; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_sub = decode_io_decode_exu_i0_ap_sub; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_slt = decode_io_decode_exu_i0_ap_slt; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_unsign = decode_io_decode_exu_i0_ap_unsign; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_jal = decode_io_decode_exu_i0_ap_jal; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_predict_t = decode_io_decode_exu_i0_ap_predict_t; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_predict_nt = decode_io_decode_exu_i0_ap_predict_nt; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_csr_write = decode_io_decode_exu_i0_ap_csr_write; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_ap_csr_imm = decode_io_decode_exu_i0_ap_csr_imm; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_valid = decode_io_decode_exu_dec_i0_predict_p_d_valid; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_misp = 1'h0; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_ataken = 1'h0; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_boffset = 1'h0; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pc4 = decode_io_decode_exu_dec_i0_predict_p_d_bits_pc4; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_hist = decode_io_decode_exu_dec_i0_predict_p_d_bits_hist; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_toffset = decode_io_decode_exu_dec_i0_predict_p_d_bits_toffset; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_error = decode_io_decode_exu_dec_i0_predict_p_d_bits_br_error; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_start_error = decode_io_decode_exu_dec_i0_predict_p_d_bits_br_start_error; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pcall = decode_io_decode_exu_dec_i0_predict_p_d_bits_pcall; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pja = decode_io_decode_exu_dec_i0_predict_p_d_bits_pja; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_way = decode_io_decode_exu_dec_i0_predict_p_d_bits_way; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pret = decode_io_decode_exu_dec_i0_predict_p_d_bits_pret; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_prett = decode_io_decode_exu_dec_i0_predict_p_d_bits_prett; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_predict_fghr_d = decode_io_decode_exu_i0_predict_fghr_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_predict_index_d = decode_io_decode_exu_i0_predict_index_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_i0_predict_btag_d = decode_io_decode_exu_i0_predict_btag_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_rs1_en_d = decode_io_decode_exu_dec_i0_rs1_en_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_branch_d = decode_io_decode_exu_dec_i0_branch_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_rs2_en_d = decode_io_decode_exu_dec_i0_rs2_en_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_immed_d = decode_io_decode_exu_dec_i0_immed_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_result_r = decode_io_decode_exu_dec_i0_result_r; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_qual_lsu_d = decode_io_decode_exu_dec_qual_lsu_d; // @[dec.scala 147:23 dec.scala 203:48]
  assign io_dec_exu_decode_exu_dec_i0_select_pc_d = decode_io_decode_exu_dec_i0_select_pc_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d = decode_io_decode_exu_dec_i0_rs1_bypass_en_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d = decode_io_decode_exu_dec_i0_rs2_bypass_en_d; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_valid = decode_io_decode_exu_mul_p_valid; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_rs1_sign = decode_io_decode_exu_mul_p_bits_rs1_sign; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_rs2_sign = decode_io_decode_exu_mul_p_bits_rs2_sign; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_low = decode_io_decode_exu_mul_p_bits_low; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_bext = decode_io_decode_exu_mul_p_bits_bext; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_bdep = decode_io_decode_exu_mul_p_bits_bdep; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_clmul = decode_io_decode_exu_mul_p_bits_clmul; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_clmulh = decode_io_decode_exu_mul_p_bits_clmulh; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_clmulr = decode_io_decode_exu_mul_p_bits_clmulr; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_grev = decode_io_decode_exu_mul_p_bits_grev; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_gorc = decode_io_decode_exu_mul_p_bits_gorc; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_shfl = decode_io_decode_exu_mul_p_bits_shfl; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_unshfl = decode_io_decode_exu_mul_p_bits_unshfl; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_crc32_b = decode_io_decode_exu_mul_p_bits_crc32_b; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_crc32_h = decode_io_decode_exu_mul_p_bits_crc32_h; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_crc32_w = decode_io_decode_exu_mul_p_bits_crc32_w; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_crc32c_b = decode_io_decode_exu_mul_p_bits_crc32c_b; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_crc32c_h = decode_io_decode_exu_mul_p_bits_crc32c_h; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_crc32c_w = decode_io_decode_exu_mul_p_bits_crc32c_w; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_mul_p_bits_bfp = decode_io_decode_exu_mul_p_bits_bfp; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_pred_correct_npc_x = decode_io_decode_exu_pred_correct_npc_x; // @[dec.scala 147:23]
  assign io_dec_exu_decode_exu_dec_extint_stall = decode_io_decode_exu_dec_extint_stall; // @[dec.scala 147:23]
  assign io_dec_exu_tlu_exu_dec_tlu_meihap = tlu_io_tlu_exu_dec_tlu_meihap; // @[dec.scala 223:18]
  assign io_dec_exu_tlu_exu_dec_tlu_flush_lower_r = tlu_io_tlu_exu_dec_tlu_flush_lower_r; // @[dec.scala 223:18]
  assign io_dec_exu_tlu_exu_dec_tlu_flush_path_r = tlu_io_tlu_exu_dec_tlu_flush_path_r; // @[dec.scala 223:18]
  assign io_dec_exu_ib_exu_dec_i0_pc_d = instbuff_io_ib_exu_dec_i0_pc_d; // @[dec.scala 137:22]
  assign io_dec_exu_ib_exu_dec_debug_wdata_rs1_d = instbuff_io_ib_exu_dec_debug_wdata_rs1_d; // @[dec.scala 137:22]
  assign io_dec_exu_gpr_exu_gpr_i0_rs1_d = gpr_io_gpr_exu_gpr_i0_rs1_d; // @[dec.scala 218:22]
  assign io_dec_exu_gpr_exu_gpr_i0_rs2_d = gpr_io_gpr_exu_gpr_i0_rs2_d; // @[dec.scala 218:22]
  assign io_lsu_dec_tlu_busbuff_dec_tlu_external_ldfwd_disable = tlu_io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[dec.scala 240:26]
  assign io_lsu_dec_tlu_busbuff_dec_tlu_wb_coalescing_disable = tlu_io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[dec.scala 240:26]
  assign io_lsu_dec_tlu_busbuff_dec_tlu_sideeffect_posted_disable = tlu_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[dec.scala 240:26]
  assign io_dec_dma_tlu_dma_dec_tlu_dma_qos_prty = tlu_io_tlu_dma_dec_tlu_dma_qos_prty; // @[dec.scala 224:18]
  assign io_dec_pic_dec_tlu_meicurpl = tlu_io_dec_pic_dec_tlu_meicurpl; // @[dec.scala 242:14]
  assign io_dec_pic_dec_tlu_meipt = tlu_io_dec_pic_dec_tlu_meipt; // @[dec.scala 242:14]
  assign instbuff_io_ifu_ib_ifu_i0_icaf = io_ifu_dec_dec_aln_aln_ib_ifu_i0_icaf; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_icaf_type = io_ifu_dec_dec_aln_aln_ib_ifu_i0_icaf_type; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_icaf_second = io_ifu_dec_dec_aln_aln_ib_ifu_i0_icaf_second; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_dbecc = io_ifu_dec_dec_aln_aln_ib_ifu_i0_dbecc; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_bp_index = io_ifu_dec_dec_aln_aln_ib_ifu_i0_bp_index; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_bp_fghr = io_ifu_dec_dec_aln_aln_ib_ifu_i0_bp_fghr; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_bp_btag = io_ifu_dec_dec_aln_aln_ib_ifu_i0_bp_btag; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_valid = io_ifu_dec_dec_aln_aln_ib_ifu_i0_valid; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_instr = io_ifu_dec_dec_aln_aln_ib_ifu_i0_instr; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_pc = io_ifu_dec_dec_aln_aln_ib_ifu_i0_pc; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_ifu_i0_pc4 = io_ifu_dec_dec_aln_aln_ib_ifu_i0_pc4; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_valid = io_ifu_dec_dec_aln_aln_ib_i0_brp_valid; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_toffset = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_toffset; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_hist = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_hist; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_br_error = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_br_error; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_br_start_error = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_br_start_error; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_prett = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_prett; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_way = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_way; // @[dec.scala 136:22]
  assign instbuff_io_ifu_ib_i0_brp_bits_ret = io_ifu_dec_dec_aln_aln_ib_i0_brp_bits_ret; // @[dec.scala 136:22]
  assign instbuff_io_dbg_ib_dbg_cmd_valid = io_dec_dbg_dbg_ib_dbg_cmd_valid; // @[dec.scala 138:22]
  assign instbuff_io_dbg_ib_dbg_cmd_write = io_dec_dbg_dbg_ib_dbg_cmd_write; // @[dec.scala 138:22]
  assign instbuff_io_dbg_ib_dbg_cmd_type = io_dec_dbg_dbg_ib_dbg_cmd_type; // @[dec.scala 138:22]
  assign instbuff_io_dbg_ib_dbg_cmd_addr = io_dec_dbg_dbg_ib_dbg_cmd_addr; // @[dec.scala 138:22]
  assign decode_clock = clock;
  assign decode_reset = reset;
  assign decode_io_decode_exu_exu_i0_result_x = io_dec_exu_decode_exu_exu_i0_result_x; // @[dec.scala 147:23]
  assign decode_io_decode_exu_exu_csr_rs1_x = io_dec_exu_decode_exu_exu_csr_rs1_x; // @[dec.scala 147:23]
  assign decode_io_dec_alu_exu_i0_pc_x = io_dec_exu_dec_alu_exu_i0_pc_x; // @[dec.scala 148:20]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_valid_m = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_valid_m; // @[dec.scala 155:26]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_tag_m = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_tag_m; // @[dec.scala 155:26]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_inv_r = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_r; // @[dec.scala 155:26]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[dec.scala 155:26]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_data_valid = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_valid; // @[dec.scala 155:26]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_data_error = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_error; // @[dec.scala 155:26]
  assign decode_io_dctl_busbuff_lsu_nonblock_load_data_tag = io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_tag; // @[dec.scala 155:26]
  assign decode_io_dctl_dma_dma_dccm_stall_any = io_dec_dma_dctl_dma_dma_dccm_stall_any; // @[dec.scala 150:22]
  assign decode_io_dec_aln_ifu_i0_cinst = io_ifu_dec_dec_aln_aln_dec_ifu_i0_cinst; // @[dec.scala 145:21]
  assign decode_io_dbg_dctl_dbg_cmd_wrdata = io_dec_dbg_dbg_dctl_dbg_cmd_wrdata; // @[dec.scala 165:22]
  assign decode_io_dec_tlu_trace_disable = tlu_io_dec_tlu_trace_disable; // @[dec.scala 151:48]
  assign decode_io_dec_debug_valid_d = instbuff_io_dec_debug_fence_d; // @[dec.scala 152:48]
  assign decode_io_dec_tlu_flush_extint = tlu_io_dec_tlu_flush_extint; // @[dec.scala 153:48]
  assign decode_io_dec_tlu_force_halt = tlu_io_tlu_mem_dec_tlu_force_halt; // @[dec.scala 154:48]
  assign decode_io_dec_i0_trigger_match_d = dec_trigger_io_dec_i0_trigger_match_d; // @[dec.scala 156:48]
  assign decode_io_dec_tlu_wr_pause_r = tlu_io_dec_tlu_wr_pause_r; // @[dec.scala 157:48]
  assign decode_io_dec_tlu_pipelining_disable = tlu_io_dec_tlu_pipelining_disable; // @[dec.scala 158:48]
  assign decode_io_lsu_trigger_match_m = io_lsu_trigger_match_m; // @[dec.scala 159:48]
  assign decode_io_lsu_pmu_misaligned_m = io_lsu_pmu_misaligned_m; // @[dec.scala 160:48]
  assign decode_io_dec_tlu_debug_stall = tlu_io_dec_tlu_debug_stall; // @[dec.scala 161:48]
  assign decode_io_dec_tlu_flush_leak_one_r = tlu_io_tlu_bp_dec_tlu_flush_leak_one_wb; // @[dec.scala 163:48]
  assign decode_io_dec_debug_fence_d = instbuff_io_dec_debug_fence_d; // @[dec.scala 164:48]
  assign decode_io_dec_i0_icaf_d = instbuff_io_dec_i0_icaf_d; // @[dec.scala 166:48]
  assign decode_io_dec_i0_icaf_second_d = instbuff_io_dec_i0_icaf_second_d; // @[dec.scala 167:48]
  assign decode_io_dec_i0_icaf_type_d = instbuff_io_dec_i0_icaf_type_d; // @[dec.scala 168:48]
  assign decode_io_dec_i0_dbecc_d = instbuff_io_dec_i0_dbecc_d; // @[dec.scala 169:48]
  assign decode_io_dec_i0_brp_valid = instbuff_io_dec_i0_brp_valid; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_toffset = instbuff_io_dec_i0_brp_bits_toffset; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_hist = instbuff_io_dec_i0_brp_bits_hist; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_br_error = instbuff_io_dec_i0_brp_bits_br_error; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_br_start_error = instbuff_io_dec_i0_brp_bits_br_start_error; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_prett = instbuff_io_dec_i0_brp_bits_prett; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_way = instbuff_io_dec_i0_brp_bits_way; // @[dec.scala 170:48]
  assign decode_io_dec_i0_brp_bits_ret = instbuff_io_dec_i0_brp_bits_ret; // @[dec.scala 170:48]
  assign decode_io_dec_i0_bp_index = instbuff_io_dec_i0_bp_index; // @[dec.scala 171:48]
  assign decode_io_dec_i0_bp_fghr = instbuff_io_dec_i0_bp_fghr; // @[dec.scala 172:48]
  assign decode_io_dec_i0_bp_btag = instbuff_io_dec_i0_bp_btag; // @[dec.scala 173:48]
  assign decode_io_lsu_idle_any = io_lsu_idle_any; // @[dec.scala 174:48]
  assign decode_io_lsu_load_stall_any = io_lsu_load_stall_any; // @[dec.scala 175:48]
  assign decode_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[dec.scala 176:48]
  assign decode_io_exu_div_wren = io_exu_div_wren; // @[dec.scala 177:48]
  assign decode_io_dec_tlu_i0_kill_writeb_wb = tlu_io_dec_tlu_i0_kill_writeb_wb; // @[dec.scala 178:48]
  assign decode_io_dec_tlu_flush_lower_wb = tlu_io_dec_tlu_flush_lower_wb; // @[dec.scala 179:48]
  assign decode_io_dec_tlu_i0_kill_writeb_r = tlu_io_dec_tlu_i0_kill_writeb_r; // @[dec.scala 180:48]
  assign decode_io_dec_tlu_flush_lower_r = tlu_io_tlu_exu_dec_tlu_flush_lower_r; // @[dec.scala 181:48]
  assign decode_io_dec_tlu_flush_pause_r = tlu_io_dec_tlu_flush_pause_r; // @[dec.scala 182:48]
  assign decode_io_dec_tlu_presync_d = tlu_io_dec_tlu_presync_d; // @[dec.scala 183:48]
  assign decode_io_dec_tlu_postsync_d = tlu_io_dec_tlu_postsync_d; // @[dec.scala 184:48]
  assign decode_io_dec_i0_pc4_d = instbuff_io_dec_i0_pc4_d; // @[dec.scala 185:48]
  assign decode_io_dec_csr_rddata_d = tlu_io_dec_csr_rddata_d; // @[dec.scala 186:48]
  assign decode_io_dec_csr_legal_d = tlu_io_dec_csr_legal_d; // @[dec.scala 187:48]
  assign decode_io_lsu_result_m = io_lsu_result_m; // @[dec.scala 188:48]
  assign decode_io_lsu_result_corr_r = io_lsu_result_corr_r; // @[dec.scala 189:48]
  assign decode_io_exu_flush_final = io_exu_flush_final; // @[dec.scala 190:48]
  assign decode_io_dec_i0_instr_d = instbuff_io_dec_i0_instr_d; // @[dec.scala 191:48]
  assign decode_io_dec_ib0_valid_d = instbuff_io_dec_ib0_valid_d; // @[dec.scala 192:48]
  assign decode_io_active_clk = io_active_clk; // @[dec.scala 194:48]
  assign decode_io_free_l2clk = io_free_l2clk; // @[dec.scala 193:48]
  assign decode_io_clk_override = tlu_io_dec_tlu_dec_clk_override; // @[dec.scala 195:48]
  assign gpr_clock = clock;
  assign gpr_reset = reset;
  assign gpr_io_raddr0 = decode_io_dec_i0_rs1_d; // @[dec.scala 206:23]
  assign gpr_io_raddr1 = decode_io_dec_i0_rs2_d; // @[dec.scala 207:23]
  assign gpr_io_wen0 = decode_io_dec_i0_wen_r; // @[dec.scala 208:23]
  assign gpr_io_waddr0 = decode_io_dec_i0_waddr_r; // @[dec.scala 209:23]
  assign gpr_io_wd0 = decode_io_dec_i0_wdata_r; // @[dec.scala 210:23]
  assign gpr_io_wen1 = decode_io_dec_nonblock_load_wen; // @[dec.scala 211:23]
  assign gpr_io_waddr1 = decode_io_dec_nonblock_load_waddr; // @[dec.scala 212:23]
  assign gpr_io_wd1 = io_lsu_nonblock_load_data; // @[dec.scala 213:23]
  assign gpr_io_wen2 = io_exu_div_wren; // @[dec.scala 214:23]
  assign gpr_io_waddr2 = decode_io_div_waddr_wb; // @[dec.scala 215:23]
  assign gpr_io_wd2 = io_exu_div_result; // @[dec.scala 216:23]
  assign tlu_clock = clock;
  assign tlu_reset = reset;
  assign tlu_io_tlu_exu_exu_i0_br_hist_r = io_dec_exu_tlu_exu_exu_i0_br_hist_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_i0_br_error_r = io_dec_exu_tlu_exu_exu_i0_br_error_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_i0_br_start_error_r = io_dec_exu_tlu_exu_exu_i0_br_start_error_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_i0_br_valid_r = io_dec_exu_tlu_exu_exu_i0_br_valid_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_i0_br_mp_r = io_dec_exu_tlu_exu_exu_i0_br_mp_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_i0_br_middle_r = io_dec_exu_tlu_exu_exu_i0_br_middle_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_pmu_i0_br_misp = io_dec_exu_tlu_exu_exu_pmu_i0_br_misp; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_pmu_i0_br_ataken = io_dec_exu_tlu_exu_exu_pmu_i0_br_ataken; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_pmu_i0_pc4 = io_dec_exu_tlu_exu_exu_pmu_i0_pc4; // @[dec.scala 223:18]
  assign tlu_io_tlu_exu_exu_npc_r = io_dec_exu_tlu_exu_exu_npc_r; // @[dec.scala 223:18]
  assign tlu_io_tlu_dma_dma_pmu_dccm_read = io_dec_dma_tlu_dma_dma_pmu_dccm_read; // @[dec.scala 224:18]
  assign tlu_io_tlu_dma_dma_pmu_dccm_write = io_dec_dma_tlu_dma_dma_pmu_dccm_write; // @[dec.scala 224:18]
  assign tlu_io_tlu_dma_dma_pmu_any_read = io_dec_dma_tlu_dma_dma_pmu_any_read; // @[dec.scala 224:18]
  assign tlu_io_tlu_dma_dma_pmu_any_write = io_dec_dma_tlu_dma_dma_pmu_any_write; // @[dec.scala 224:18]
  assign tlu_io_tlu_dma_dma_dccm_stall_any = io_dec_dma_tlu_dma_dma_dccm_stall_any; // @[dec.scala 224:18]
  assign tlu_io_tlu_dma_dma_iccm_stall_any = io_dec_dma_tlu_dma_dma_iccm_stall_any; // @[dec.scala 224:18]
  assign tlu_io_free_clk = io_free_clk; // @[dec.scala 226:45]
  assign tlu_io_free_l2clk = io_free_l2clk; // @[dec.scala 225:45]
  assign tlu_io_rst_vec = io_rst_vec; // @[dec.scala 228:45]
  assign tlu_io_nmi_int = io_nmi_int; // @[dec.scala 229:45]
  assign tlu_io_nmi_vec = io_nmi_vec; // @[dec.scala 230:45]
  assign tlu_io_i_cpu_halt_req = io_i_cpu_halt_req; // @[dec.scala 231:45]
  assign tlu_io_i_cpu_run_req = io_i_cpu_run_req; // @[dec.scala 232:45]
  assign tlu_io_lsu_fastint_stall_any = io_lsu_fastint_stall_any; // @[dec.scala 233:45]
  assign tlu_io_lsu_idle_any = io_lsu_idle_any; // @[dec.scala 264:45]
  assign tlu_io_dec_pmu_instr_decoded = decode_io_dec_pmu_instr_decoded; // @[dec.scala 235:45]
  assign tlu_io_dec_pmu_decode_stall = decode_io_dec_pmu_decode_stall; // @[dec.scala 236:45]
  assign tlu_io_dec_pmu_presync_stall = decode_io_dec_pmu_presync_stall; // @[dec.scala 237:45]
  assign tlu_io_dec_pmu_postsync_stall = decode_io_dec_pmu_postsync_stall; // @[dec.scala 238:45]
  assign tlu_io_lsu_store_stall_any = io_lsu_store_stall_any; // @[dec.scala 239:45]
  assign tlu_io_lsu_fir_addr = io_lsu_fir_addr; // @[dec.scala 243:45]
  assign tlu_io_lsu_fir_error = io_lsu_fir_error; // @[dec.scala 244:45]
  assign tlu_io_iccm_dma_sb_error = io_iccm_dma_sb_error; // @[dec.scala 245:45]
  assign tlu_io_lsu_error_pkt_r_valid = io_lsu_error_pkt_r_valid; // @[dec.scala 246:45]
  assign tlu_io_lsu_error_pkt_r_bits_single_ecc_error = io_lsu_error_pkt_r_bits_single_ecc_error; // @[dec.scala 246:45]
  assign tlu_io_lsu_error_pkt_r_bits_inst_type = io_lsu_error_pkt_r_bits_inst_type; // @[dec.scala 246:45]
  assign tlu_io_lsu_error_pkt_r_bits_exc_type = io_lsu_error_pkt_r_bits_exc_type; // @[dec.scala 246:45]
  assign tlu_io_lsu_error_pkt_r_bits_mscause = io_lsu_error_pkt_r_bits_mscause; // @[dec.scala 246:45]
  assign tlu_io_lsu_error_pkt_r_bits_addr = io_lsu_error_pkt_r_bits_addr; // @[dec.scala 246:45]
  assign tlu_io_lsu_single_ecc_error_incr = io_lsu_single_ecc_error_incr; // @[dec.scala 247:45]
  assign tlu_io_dec_pause_state = decode_io_dec_pause_state; // @[dec.scala 248:45]
  assign tlu_io_dec_csr_wen_unq_d = decode_io_dec_csr_wen_unq_d; // @[dec.scala 249:45]
  assign tlu_io_dec_csr_any_unq_d = decode_io_dec_csr_any_unq_d; // @[dec.scala 250:45]
  assign tlu_io_dec_csr_rdaddr_d = decode_io_dec_csr_rdaddr_d; // @[dec.scala 251:45]
  assign tlu_io_dec_csr_wen_r = decode_io_dec_csr_wen_r; // @[dec.scala 252:45]
  assign tlu_io_dec_csr_wraddr_r = decode_io_dec_csr_wraddr_r; // @[dec.scala 253:45]
  assign tlu_io_dec_csr_wrdata_r = decode_io_dec_csr_wrdata_r; // @[dec.scala 254:45]
  assign tlu_io_dec_csr_stall_int_ff = decode_io_dec_csr_stall_int_ff; // @[dec.scala 255:45]
  assign tlu_io_dec_tlu_i0_valid_r = decode_io_dec_tlu_i0_valid_r; // @[dec.scala 256:45]
  assign tlu_io_dec_tlu_i0_pc_r = decode_io_dec_tlu_i0_pc_r; // @[dec.scala 257:45]
  assign tlu_io_dec_tlu_packet_r_legal = decode_io_dec_tlu_packet_r_legal; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_icaf = decode_io_dec_tlu_packet_r_icaf; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_icaf_second = decode_io_dec_tlu_packet_r_icaf_second; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_icaf_type = decode_io_dec_tlu_packet_r_icaf_type; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_fence_i = decode_io_dec_tlu_packet_r_fence_i; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_i0trigger = decode_io_dec_tlu_packet_r_i0trigger; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_pmu_i0_itype = decode_io_dec_tlu_packet_r_pmu_i0_itype; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_pmu_i0_br_unpred = decode_io_dec_tlu_packet_r_pmu_i0_br_unpred; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_pmu_divide = decode_io_dec_tlu_packet_r_pmu_divide; // @[dec.scala 258:45]
  assign tlu_io_dec_tlu_packet_r_pmu_lsu_misaligned = decode_io_dec_tlu_packet_r_pmu_lsu_misaligned; // @[dec.scala 258:45]
  assign tlu_io_dec_illegal_inst = decode_io_dec_illegal_inst; // @[dec.scala 259:45]
  assign tlu_io_dec_i0_decode_d = decode_io_dec_aln_dec_i0_decode_d; // @[dec.scala 260:45]
  assign tlu_io_exu_i0_br_way_r = io_exu_i0_br_way_r; // @[dec.scala 261:45]
  assign tlu_io_dbg_halt_req = io_dbg_halt_req; // @[dec.scala 262:45]
  assign tlu_io_dbg_resume_req = io_dbg_resume_req; // @[dec.scala 263:45]
  assign tlu_io_dec_div_active = decode_io_dec_div_active; // @[dec.scala 265:45]
  assign tlu_io_timer_int = io_timer_int; // @[dec.scala 266:45]
  assign tlu_io_soft_int = io_soft_int; // @[dec.scala 267:45]
  assign tlu_io_core_id = io_core_id; // @[dec.scala 268:45]
  assign tlu_io_mpc_debug_halt_req = io_mpc_debug_halt_req; // @[dec.scala 269:45]
  assign tlu_io_mpc_debug_run_req = io_mpc_debug_run_req; // @[dec.scala 270:45]
  assign tlu_io_mpc_reset_run_req = io_mpc_reset_run_req; // @[dec.scala 271:45]
  assign tlu_io_ifu_pmu_instr_aligned = io_ifu_dec_dec_aln_ifu_pmu_instr_aligned; // @[dec.scala 234:45]
  assign tlu_io_tlu_ifc_ifu_pmu_fetch_stall = io_ifu_dec_dec_ifc_ifu_pmu_fetch_stall; // @[dec.scala 221:18]
  assign tlu_io_tlu_mem_ifu_pmu_ic_miss = io_ifu_dec_dec_mem_ctrl_ifu_pmu_ic_miss; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_pmu_ic_hit = io_ifu_dec_dec_mem_ctrl_ifu_pmu_ic_hit; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_pmu_bus_error = io_ifu_dec_dec_mem_ctrl_ifu_pmu_bus_error; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_pmu_bus_busy = io_ifu_dec_dec_mem_ctrl_ifu_pmu_bus_busy; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_pmu_bus_trxn = io_ifu_dec_dec_mem_ctrl_ifu_pmu_bus_trxn; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_ic_error_start = io_ifu_dec_dec_mem_ctrl_ifu_ic_error_start; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_iccm_rd_ecc_single_err = io_ifu_dec_dec_mem_ctrl_ifu_iccm_rd_ecc_single_err; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_ic_debug_rd_data = io_ifu_dec_dec_mem_ctrl_ifu_ic_debug_rd_data; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_ic_debug_rd_data_valid = io_ifu_dec_dec_mem_ctrl_ifu_ic_debug_rd_data_valid; // @[dec.scala 220:18]
  assign tlu_io_tlu_mem_ifu_miss_state_idle = io_ifu_dec_dec_mem_ctrl_ifu_miss_state_idle; // @[dec.scala 220:18]
  assign tlu_io_tlu_busbuff_lsu_pmu_bus_trxn = io_lsu_dec_tlu_busbuff_lsu_pmu_bus_trxn; // @[dec.scala 240:26]
  assign tlu_io_tlu_busbuff_lsu_pmu_bus_misaligned = io_lsu_dec_tlu_busbuff_lsu_pmu_bus_misaligned; // @[dec.scala 240:26]
  assign tlu_io_tlu_busbuff_lsu_pmu_bus_error = io_lsu_dec_tlu_busbuff_lsu_pmu_bus_error; // @[dec.scala 240:26]
  assign tlu_io_tlu_busbuff_lsu_pmu_bus_busy = io_lsu_dec_tlu_busbuff_lsu_pmu_bus_busy; // @[dec.scala 240:26]
  assign tlu_io_tlu_busbuff_lsu_imprecise_error_load_any = io_lsu_dec_tlu_busbuff_lsu_imprecise_error_load_any; // @[dec.scala 240:26]
  assign tlu_io_tlu_busbuff_lsu_imprecise_error_store_any = io_lsu_dec_tlu_busbuff_lsu_imprecise_error_store_any; // @[dec.scala 240:26]
  assign tlu_io_tlu_busbuff_lsu_imprecise_error_addr_any = io_lsu_dec_tlu_busbuff_lsu_imprecise_error_addr_any; // @[dec.scala 240:26]
  assign tlu_io_lsu_tlu_lsu_pmu_load_external_m = io_lsu_tlu_lsu_pmu_load_external_m; // @[dec.scala 241:14]
  assign tlu_io_lsu_tlu_lsu_pmu_store_external_m = io_lsu_tlu_lsu_pmu_store_external_m; // @[dec.scala 241:14]
  assign tlu_io_dec_pic_pic_claimid = io_dec_pic_pic_claimid; // @[dec.scala 242:14]
  assign tlu_io_dec_pic_pic_pl = io_dec_pic_pic_pl; // @[dec.scala 242:14]
  assign tlu_io_dec_pic_mhwakeup = io_dec_pic_mhwakeup; // @[dec.scala 242:14]
  assign tlu_io_dec_pic_mexintpend = io_dec_pic_mexintpend; // @[dec.scala 242:14]
  assign dec_trigger_io_trigger_pkt_any_0_select = tlu_io_trigger_pkt_any_0_select; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_0_match_pkt = tlu_io_trigger_pkt_any_0_match_pkt; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_0_execute = tlu_io_trigger_pkt_any_0_execute; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_0_m = tlu_io_trigger_pkt_any_0_m; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_0_tdata2 = tlu_io_trigger_pkt_any_0_tdata2; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_1_select = tlu_io_trigger_pkt_any_1_select; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_1_match_pkt = tlu_io_trigger_pkt_any_1_match_pkt; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_1_execute = tlu_io_trigger_pkt_any_1_execute; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_1_m = tlu_io_trigger_pkt_any_1_m; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_1_tdata2 = tlu_io_trigger_pkt_any_1_tdata2; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_2_select = tlu_io_trigger_pkt_any_2_select; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_2_match_pkt = tlu_io_trigger_pkt_any_2_match_pkt; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_2_execute = tlu_io_trigger_pkt_any_2_execute; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_2_m = tlu_io_trigger_pkt_any_2_m; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_2_tdata2 = tlu_io_trigger_pkt_any_2_tdata2; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_3_select = tlu_io_trigger_pkt_any_3_select; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_3_match_pkt = tlu_io_trigger_pkt_any_3_match_pkt; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_3_execute = tlu_io_trigger_pkt_any_3_execute; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_3_m = tlu_io_trigger_pkt_any_3_m; // @[dec.scala 141:34]
  assign dec_trigger_io_trigger_pkt_any_3_tdata2 = tlu_io_trigger_pkt_any_3_tdata2; // @[dec.scala 141:34]
  assign dec_trigger_io_dec_i0_pc_d = instbuff_io_ib_exu_dec_i0_pc_d; // @[dec.scala 140:30]
endmodule
