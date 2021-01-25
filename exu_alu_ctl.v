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
module exu_alu_ctl(
  input         clock,
  input         reset,
  input         io_dec_alu_dec_i0_alu_decode_d,
  input         io_dec_alu_dec_csr_ren_d,
  input  [11:0] io_dec_alu_dec_i0_br_immed_d,
  output [30:0] io_dec_alu_exu_i0_pc_x,
  input  [31:0] io_csr_rddata_in,
  input  [30:0] io_dec_i0_pc_d,
  input         io_scan_mode,
  input         io_flush_upper_x,
  input         io_dec_tlu_flush_lower_r,
  input         io_enable,
  input         io_i0_ap_clz,
  input         io_i0_ap_ctz,
  input         io_i0_ap_pcnt,
  input         io_i0_ap_sext_b,
  input         io_i0_ap_sext_h,
  input         io_i0_ap_slo,
  input         io_i0_ap_sro,
  input         io_i0_ap_min,
  input         io_i0_ap_max,
  input         io_i0_ap_pack,
  input         io_i0_ap_packu,
  input         io_i0_ap_packh,
  input         io_i0_ap_rol,
  input         io_i0_ap_ror,
  input         io_i0_ap_grev,
  input         io_i0_ap_gorc,
  input         io_i0_ap_zbb,
  input         io_i0_ap_sbset,
  input         io_i0_ap_sbclr,
  input         io_i0_ap_sbinv,
  input         io_i0_ap_sbext,
  input         io_i0_ap_sh1add,
  input         io_i0_ap_sh2add,
  input         io_i0_ap_sh3add,
  input         io_i0_ap_zba,
  input         io_i0_ap_land,
  input         io_i0_ap_lor,
  input         io_i0_ap_lxor,
  input         io_i0_ap_sll,
  input         io_i0_ap_srl,
  input         io_i0_ap_sra,
  input         io_i0_ap_beq,
  input         io_i0_ap_bne,
  input         io_i0_ap_blt,
  input         io_i0_ap_bge,
  input         io_i0_ap_add,
  input         io_i0_ap_sub,
  input         io_i0_ap_slt,
  input         io_i0_ap_unsign,
  input         io_i0_ap_jal,
  input         io_i0_ap_predict_t,
  input         io_i0_ap_predict_nt,
  input         io_i0_ap_csr_write,
  input         io_i0_ap_csr_imm,
  input  [31:0] io_a_in,
  input  [31:0] io_b_in,
  input         io_pp_in_valid,
  input         io_pp_in_bits_misp,
  input         io_pp_in_bits_ataken,
  input         io_pp_in_bits_boffset,
  input         io_pp_in_bits_pc4,
  input  [1:0]  io_pp_in_bits_hist,
  input  [11:0] io_pp_in_bits_toffset,
  input         io_pp_in_bits_br_error,
  input         io_pp_in_bits_br_start_error,
  input  [30:0] io_pp_in_bits_prett,
  input         io_pp_in_bits_pcall,
  input         io_pp_in_bits_pret,
  input         io_pp_in_bits_pja,
  input         io_pp_in_bits_way,
  output [31:0] io_result_ff,
  output        io_flush_upper_out,
  output        io_flush_final_out,
  output [30:0] io_flush_path_out,
  output        io_pred_correct_out,
  output        io_predict_p_out_valid,
  output        io_predict_p_out_bits_misp,
  output        io_predict_p_out_bits_ataken,
  output        io_predict_p_out_bits_boffset,
  output        io_predict_p_out_bits_pc4,
  output [1:0]  io_predict_p_out_bits_hist,
  output [11:0] io_predict_p_out_bits_toffset,
  output        io_predict_p_out_bits_br_error,
  output        io_predict_p_out_bits_br_start_error,
  output [30:0] io_predict_p_out_bits_prett,
  output        io_predict_p_out_bits_pcall,
  output        io_predict_p_out_bits_pret,
  output        io_predict_p_out_bits_pja,
  output        io_predict_p_out_bits_way
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_en; // @[lib.scala 399:23]
  wire  _T_1 = io_b_in[4:0] == 5'h1f; // @[exu_alu_ctl.scala 87:55]
  wire  ap_rev = io_i0_ap_grev & _T_1; // @[exu_alu_ctl.scala 87:39]
  wire  _T_4 = io_b_in[4:0] == 5'h18; // @[exu_alu_ctl.scala 88:55]
  wire  ap_rev8 = io_i0_ap_grev & _T_4; // @[exu_alu_ctl.scala 88:39]
  wire  _T_7 = io_b_in[4:0] == 5'h7; // @[exu_alu_ctl.scala 89:55]
  wire  ap_orc_b = io_i0_ap_gorc & _T_7; // @[exu_alu_ctl.scala 89:39]
  wire  _T_10 = io_b_in[4:0] == 5'h10; // @[exu_alu_ctl.scala 90:55]
  wire  ap_orc16 = io_i0_ap_gorc & _T_10; // @[exu_alu_ctl.scala 90:39]
  reg [30:0] _T_14; // @[Reg.scala 27:20]
  wire  _T_15 = io_enable & io_dec_alu_dec_i0_alu_decode_d; // @[exu_alu_ctl.scala 135:43]
  reg [31:0] _T_18; // @[Reg.scala 27:20]
  wire [31:0] _T_153 = io_csr_rddata_in; // @[Mux.scala 27:72]
  wire [32:0] _T_151 = {{1{_T_153[31]}},_T_153}; // @[Mux.scala 27:72 Mux.scala 27:72]
  wire [32:0] _T_172 = io_dec_alu_dec_csr_ren_d ? $signed(_T_151) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire  _T_94 = ~io_i0_ap_zbb; // @[exu_alu_ctl.scala 160:22]
  wire  _T_95 = io_i0_ap_land & _T_94; // @[exu_alu_ctl.scala 160:20]
  wire [32:0] _T_98 = {1'h0,io_a_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_99 = {1'h0,io_a_in}; // @[exu_alu_ctl.scala 160:67]
  wire [31:0] _T_100 = io_b_in; // @[exu_alu_ctl.scala 160:85]
  wire [32:0] _GEN_2 = {{1{_T_100[31]}},_T_100}; // @[exu_alu_ctl.scala 160:74]
  wire [32:0] _T_156 = $signed(_T_99) & $signed(_GEN_2); // @[Mux.scala 27:72]
  wire [32:0] _T_173 = _T_95 ? $signed(_T_156) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire [32:0] _T_180 = $signed(_T_172) | $signed(_T_173); // @[Mux.scala 27:72]
  wire  _T_104 = io_i0_ap_lor & _T_94; // @[exu_alu_ctl.scala 161:20]
  wire [32:0] _T_159 = $signed(_T_99) | $signed(_GEN_2); // @[Mux.scala 27:72]
  wire [32:0] _T_174 = _T_104 ? $signed(_T_159) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire [32:0] _T_182 = $signed(_T_180) | $signed(_T_174); // @[Mux.scala 27:72]
  wire  _T_113 = io_i0_ap_lxor & _T_94; // @[exu_alu_ctl.scala 162:20]
  wire [32:0] _T_162 = $signed(_T_99) ^ $signed(_GEN_2); // @[Mux.scala 27:72]
  wire [32:0] _T_175 = _T_113 ? $signed(_T_162) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire [32:0] _T_184 = $signed(_T_182) | $signed(_T_175); // @[Mux.scala 27:72]
  wire  _T_121 = io_i0_ap_land & io_i0_ap_zbb; // @[exu_alu_ctl.scala 163:20]
  wire [31:0] _T_128 = ~io_b_in; // @[exu_alu_ctl.scala 163:76]
  wire [32:0] _GEN_5 = {{1{_T_128[31]}},_T_128}; // @[exu_alu_ctl.scala 163:74]
  wire [32:0] _T_165 = $signed(_T_99) & $signed(_GEN_5); // @[Mux.scala 27:72]
  wire [32:0] _T_176 = _T_121 ? $signed(_T_165) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire [32:0] _T_186 = $signed(_T_184) | $signed(_T_176); // @[Mux.scala 27:72]
  wire  _T_131 = io_i0_ap_lor & io_i0_ap_zbb; // @[exu_alu_ctl.scala 164:20]
  wire [32:0] _T_168 = $signed(_T_99) | $signed(_GEN_5); // @[Mux.scala 27:72]
  wire [32:0] _T_177 = _T_131 ? $signed(_T_168) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire [32:0] _T_188 = $signed(_T_186) | $signed(_T_177); // @[Mux.scala 27:72]
  wire  _T_141 = io_i0_ap_lxor & io_i0_ap_zbb; // @[exu_alu_ctl.scala 165:20]
  wire [32:0] _T_171 = $signed(_T_99) ^ $signed(_GEN_5); // @[Mux.scala 27:72]
  wire [32:0] _T_178 = _T_141 ? $signed(_T_171) : $signed(33'sh0); // @[Mux.scala 27:72]
  wire [32:0] lout = $signed(_T_188) | $signed(_T_178); // @[Mux.scala 27:72]
  wire  _T_836 = io_i0_ap_sll | io_i0_ap_srl; // @[exu_alu_ctl.scala 293:44]
  wire  _T_837 = _T_836 | io_i0_ap_sra; // @[exu_alu_ctl.scala 293:59]
  wire  _T_840 = _T_837 | io_i0_ap_rol; // @[exu_alu_ctl.scala 293:92]
  wire  sel_shift = _T_840 | io_i0_ap_ror; // @[exu_alu_ctl.scala 293:101]
  wire [31:0] _T_887 = sel_shift ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [30:0] _T_345 = io_a_in[31] ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [30:0] _T_352 = io_i0_ap_sra ? _T_345 : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_353 = io_i0_ap_sll ? io_a_in[30:0] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_358 = _T_352 | _T_353; // @[Mux.scala 27:72]
  wire [30:0] _T_354 = io_i0_ap_rol ? io_a_in[30:0] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_359 = _T_358 | _T_354; // @[Mux.scala 27:72]
  wire [30:0] _T_355 = io_i0_ap_ror ? io_a_in[30:0] : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_360 = _T_359 | _T_355; // @[Mux.scala 27:72]
  wire [62:0] shift_extend = {_T_360,io_a_in}; // @[Cat.scala 29:58]
  wire [5:0] _T_195 = {1'h0,io_b_in[4:0]}; // @[Cat.scala 29:58]
  wire [5:0] _T_197 = 6'h20 - _T_195; // @[exu_alu_ctl.scala 179:41]
  wire [5:0] _T_218 = io_i0_ap_sll ? _T_197 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_219 = io_i0_ap_srl ? _T_195 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_226 = _T_218 | _T_219; // @[Mux.scala 27:72]
  wire [5:0] _T_220 = io_i0_ap_sra ? _T_195 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_227 = _T_226 | _T_220; // @[Mux.scala 27:72]
  wire [5:0] _T_221 = io_i0_ap_rol ? _T_197 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_228 = _T_227 | _T_221; // @[Mux.scala 27:72]
  wire [5:0] _T_222 = io_i0_ap_ror ? _T_195 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_229 = _T_228 | _T_222; // @[Mux.scala 27:72]
  wire [5:0] _T_225 = io_i0_ap_sbext ? _T_195 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] shift_amount = _T_229 | _T_225; // @[Mux.scala 27:72]
  wire [62:0] shift_long = shift_extend >> shift_amount[4:0]; // @[exu_alu_ctl.scala 202:32]
  wire [4:0] _T_238 = {io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll,io_i0_ap_sll}; // @[Cat.scala 29:58]
  wire [4:0] _T_240 = _T_238 & io_b_in[4:0]; // @[exu_alu_ctl.scala 189:73]
  wire [62:0] _T_241 = 63'hffffffff << _T_240; // @[exu_alu_ctl.scala 189:39]
  wire [31:0] shift_mask = _T_241[31:0]; // @[exu_alu_ctl.scala 189:14]
  wire [31:0] sout = shift_long[31:0] & shift_mask; // @[exu_alu_ctl.scala 204:34]
  wire [31:0] _T_889 = _T_887 & sout; // @[exu_alu_ctl.scala 304:56]
  wire [31:0] _T_890 = lout[31:0] | _T_889; // @[exu_alu_ctl.scala 304:31]
  wire  _T_841 = io_i0_ap_add | io_i0_ap_sub; // @[exu_alu_ctl.scala 294:44]
  wire  _T_843 = ~io_i0_ap_slt; // @[exu_alu_ctl.scala 294:71]
  wire  _T_844 = _T_841 & _T_843; // @[exu_alu_ctl.scala 294:69]
  wire  _T_845 = ~io_i0_ap_min; // @[exu_alu_ctl.scala 294:87]
  wire  _T_846 = _T_844 & _T_845; // @[exu_alu_ctl.scala 294:85]
  wire  _T_847 = ~io_i0_ap_max; // @[exu_alu_ctl.scala 294:97]
  wire  sel_adder = _T_846 & _T_847; // @[exu_alu_ctl.scala 294:95]
  wire [31:0] _T_892 = sel_adder ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [32:0] _T_57 = {1'h0,io_a_in}; // @[Cat.scala 29:58]
  wire [31:0] _T_58 = ~io_b_in; // @[exu_alu_ctl.scala 146:74]
  wire [32:0] _T_59 = {1'h0,_T_58}; // @[Cat.scala 29:58]
  wire [32:0] _T_61 = _T_57 + _T_59; // @[exu_alu_ctl.scala 146:59]
  wire [32:0] _T_62 = {32'h0,io_i0_ap_sub}; // @[Cat.scala 29:58]
  wire [32:0] _T_64 = _T_61 + _T_62; // @[exu_alu_ctl.scala 146:84]
  wire [32:0] _T_67 = {1'h0,io_b_in}; // @[Cat.scala 29:58]
  wire [32:0] _T_69 = _T_98 + _T_67; // @[exu_alu_ctl.scala 146:139]
  wire [32:0] _T_72 = _T_69 + _T_62; // @[exu_alu_ctl.scala 146:164]
  wire [32:0] aout = io_i0_ap_sub ? _T_64 : _T_72; // @[exu_alu_ctl.scala 146:14]
  wire [31:0] _T_894 = _T_892 & aout[31:0]; // @[exu_alu_ctl.scala 305:28]
  wire [31:0] _T_895 = _T_890 | _T_894; // @[exu_alu_ctl.scala 304:71]
  wire  _T_848 = io_i0_ap_jal | io_pp_in_bits_pcall; // @[exu_alu_ctl.scala 295:44]
  wire  _T_849 = _T_848 | io_pp_in_bits_pja; // @[exu_alu_ctl.scala 295:66]
  wire  sel_pc = _T_849 | io_pp_in_bits_pret; // @[exu_alu_ctl.scala 295:86]
  wire [31:0] _T_897 = sel_pc ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [12:0] _T_853 = {io_dec_alu_dec_i0_br_immed_d,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_852 = {io_dec_i0_pc_d,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_856 = _T_852[12:1] + _T_853[12:1]; // @[lib.scala 68:31]
  wire  _T_865 = ~_T_856[12]; // @[lib.scala 72:28]
  wire  _T_866 = _T_853[12] ^ _T_865; // @[lib.scala 72:26]
  wire [18:0] _T_877 = _T_866 ? _T_852[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire  _T_869 = ~_T_853[12]; // @[lib.scala 73:20]
  wire  _T_871 = _T_869 & _T_856[12]; // @[lib.scala 73:26]
  wire [18:0] _T_859 = _T_852[31:13] + 19'h1; // @[lib.scala 69:27]
  wire [18:0] _T_878 = _T_871 ? _T_859 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_880 = _T_877 | _T_878; // @[Mux.scala 27:72]
  wire  _T_875 = _T_853[12] & _T_865; // @[lib.scala 74:26]
  wire [18:0] _T_862 = _T_852[31:13] - 19'h1; // @[lib.scala 70:27]
  wire [18:0] _T_879 = _T_875 ? _T_862 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_881 = _T_880 | _T_879; // @[Mux.scala 27:72]
  wire [31:0] pcout = {_T_881,_T_856[11:0],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_898 = _T_897 & pcout; // @[exu_alu_ctl.scala 306:28]
  wire [31:0] _T_899 = _T_895 | _T_898; // @[exu_alu_ctl.scala 305:43]
  wire [31:0] _T_901 = io_i0_ap_csr_write ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_902 = io_i0_ap_csr_imm ? $signed(io_b_in) : $signed(io_a_in); // @[exu_alu_ctl.scala 307:51]
  wire [31:0] _T_903 = _T_901 & _T_902; // @[exu_alu_ctl.scala 307:34]
  wire [31:0] _T_904 = _T_899 | _T_903; // @[exu_alu_ctl.scala 306:41]
  wire  _T_88 = ~io_i0_ap_unsign; // @[exu_alu_ctl.scala 154:30]
  wire  neg = aout[31]; // @[exu_alu_ctl.scala 153:34]
  wire  _T_75 = ~io_a_in[31]; // @[exu_alu_ctl.scala 149:14]
  wire [31:0] bm = io_i0_ap_sub ? _T_58 : io_b_in; // @[exu_alu_ctl.scala 143:17]
  wire  _T_77 = ~bm[31]; // @[exu_alu_ctl.scala 149:29]
  wire  _T_78 = _T_75 & _T_77; // @[exu_alu_ctl.scala 149:27]
  wire  _T_80 = _T_78 & neg; // @[exu_alu_ctl.scala 149:37]
  wire  _T_83 = io_a_in[31] & bm[31]; // @[exu_alu_ctl.scala 149:66]
  wire  _T_85 = ~neg; // @[exu_alu_ctl.scala 149:78]
  wire  _T_86 = _T_83 & _T_85; // @[exu_alu_ctl.scala 149:76]
  wire  ov = _T_80 | _T_86; // @[exu_alu_ctl.scala 149:50]
  wire  _T_89 = neg ^ ov; // @[exu_alu_ctl.scala 154:54]
  wire  _T_90 = _T_88 & _T_89; // @[exu_alu_ctl.scala 154:47]
  wire  cout = aout[32]; // @[exu_alu_ctl.scala 147:18]
  wire  _T_91 = ~cout; // @[exu_alu_ctl.scala 154:84]
  wire  _T_92 = io_i0_ap_unsign & _T_91; // @[exu_alu_ctl.scala 154:82]
  wire  lt = _T_90 | _T_92; // @[exu_alu_ctl.scala 154:61]
  wire  slt_one = io_i0_ap_slt & lt; // @[exu_alu_ctl.scala 298:43]
  wire [31:0] _T_905 = {31'h0,slt_one}; // @[Cat.scala 29:58]
  wire [31:0] _T_906 = _T_904 | _T_905; // @[exu_alu_ctl.scala 307:59]
  wire [31:0] _T_908 = io_i0_ap_sbext ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_910 = {31'h0,sout[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_911 = _T_908 & _T_910; // @[exu_alu_ctl.scala 309:28]
  wire [31:0] _T_912 = _T_906 | _T_911; // @[exu_alu_ctl.scala 308:56]
  wire  _T_547 = io_i0_ap_clz | io_i0_ap_ctz; // @[exu_alu_ctl.scala 221:52]
  wire [5:0] _T_549 = _T_547 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_445 = io_i0_ap_clz ? $signed(io_a_in) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [9:0] _T_416 = {io_a_in[0],io_a_in[1],io_a_in[2],io_a_in[3],io_a_in[4],io_a_in[5],io_a_in[6],io_a_in[7],io_a_in[8],io_a_in[9]}; // @[Cat.scala 29:58]
  wire [18:0] _T_425 = {_T_416,io_a_in[10],io_a_in[11],io_a_in[12],io_a_in[13],io_a_in[14],io_a_in[15],io_a_in[16],io_a_in[17],io_a_in[18]}; // @[Cat.scala 29:58]
  wire [27:0] _T_434 = {_T_425,io_a_in[19],io_a_in[20],io_a_in[21],io_a_in[22],io_a_in[23],io_a_in[24],io_a_in[25],io_a_in[26],io_a_in[27]}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_a_reverse_ff = {_T_434,io_a_in[28],io_a_in[29],io_a_in[30],io_a_in[31]}; // @[Cat.scala 29:58]
  wire [31:0] _T_444 = {_T_434,io_a_in[28],io_a_in[29],io_a_in[30],io_a_in[31]}; // @[Mux.scala 27:72]
  wire [31:0] _T_446 = io_i0_ap_ctz ? $signed(_T_444) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] bitmanip_lzd_in = $signed(_T_445) | $signed(_T_446); // @[Mux.scala 27:72]
  wire [31:0] _T_451 = $signed(_T_445) | $signed(_T_446); // @[exu_alu_ctl.scala 219:75]
  wire  _T_452 = _T_451 == 32'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_454 = bitmanip_lzd_in[31:1] == 31'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_456 = bitmanip_lzd_in[31:2] == 30'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_458 = bitmanip_lzd_in[31:3] == 29'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_460 = bitmanip_lzd_in[31:4] == 28'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_462 = bitmanip_lzd_in[31:5] == 27'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_464 = bitmanip_lzd_in[31:6] == 26'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_466 = bitmanip_lzd_in[31:7] == 25'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_468 = bitmanip_lzd_in[31:8] == 24'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_470 = bitmanip_lzd_in[31:9] == 23'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_472 = bitmanip_lzd_in[31:10] == 22'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_474 = bitmanip_lzd_in[31:11] == 21'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_476 = bitmanip_lzd_in[31:12] == 20'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_478 = bitmanip_lzd_in[31:13] == 19'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_480 = bitmanip_lzd_in[31:14] == 18'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_482 = bitmanip_lzd_in[31:15] == 17'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_484 = bitmanip_lzd_in[31:16] == 16'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_486 = bitmanip_lzd_in[31:17] == 15'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_488 = bitmanip_lzd_in[31:18] == 14'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_490 = bitmanip_lzd_in[31:19] == 13'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_492 = bitmanip_lzd_in[31:20] == 12'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_494 = bitmanip_lzd_in[31:21] == 11'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_496 = bitmanip_lzd_in[31:22] == 10'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_498 = bitmanip_lzd_in[31:23] == 9'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_500 = bitmanip_lzd_in[31:24] == 8'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_502 = bitmanip_lzd_in[31:25] == 7'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_504 = bitmanip_lzd_in[31:26] == 6'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_506 = bitmanip_lzd_in[31:27] == 5'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_508 = bitmanip_lzd_in[31:28] == 4'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_510 = bitmanip_lzd_in[31:29] == 3'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_512 = bitmanip_lzd_in[31:30] == 2'h0; // @[exu_alu_ctl.scala 219:81]
  wire  _T_514 = ~bitmanip_lzd_in[31]; // @[exu_alu_ctl.scala 219:81]
  wire [1:0] _T_516 = _T_512 ? 2'h2 : {{1'd0}, _T_514}; // @[Mux.scala 98:16]
  wire [1:0] _T_517 = _T_510 ? 2'h3 : _T_516; // @[Mux.scala 98:16]
  wire [2:0] _T_518 = _T_508 ? 3'h4 : {{1'd0}, _T_517}; // @[Mux.scala 98:16]
  wire [2:0] _T_519 = _T_506 ? 3'h5 : _T_518; // @[Mux.scala 98:16]
  wire [2:0] _T_520 = _T_504 ? 3'h6 : _T_519; // @[Mux.scala 98:16]
  wire [2:0] _T_521 = _T_502 ? 3'h7 : _T_520; // @[Mux.scala 98:16]
  wire [3:0] _T_522 = _T_500 ? 4'h8 : {{1'd0}, _T_521}; // @[Mux.scala 98:16]
  wire [3:0] _T_523 = _T_498 ? 4'h9 : _T_522; // @[Mux.scala 98:16]
  wire [3:0] _T_524 = _T_496 ? 4'ha : _T_523; // @[Mux.scala 98:16]
  wire [3:0] _T_525 = _T_494 ? 4'hb : _T_524; // @[Mux.scala 98:16]
  wire [3:0] _T_526 = _T_492 ? 4'hc : _T_525; // @[Mux.scala 98:16]
  wire [3:0] _T_527 = _T_490 ? 4'hd : _T_526; // @[Mux.scala 98:16]
  wire [3:0] _T_528 = _T_488 ? 4'he : _T_527; // @[Mux.scala 98:16]
  wire [3:0] _T_529 = _T_486 ? 4'hf : _T_528; // @[Mux.scala 98:16]
  wire [4:0] _T_530 = _T_484 ? 5'h10 : {{1'd0}, _T_529}; // @[Mux.scala 98:16]
  wire [4:0] _T_531 = _T_482 ? 5'h11 : _T_530; // @[Mux.scala 98:16]
  wire [4:0] _T_532 = _T_480 ? 5'h12 : _T_531; // @[Mux.scala 98:16]
  wire [4:0] _T_533 = _T_478 ? 5'h13 : _T_532; // @[Mux.scala 98:16]
  wire [4:0] _T_534 = _T_476 ? 5'h14 : _T_533; // @[Mux.scala 98:16]
  wire [4:0] _T_535 = _T_474 ? 5'h15 : _T_534; // @[Mux.scala 98:16]
  wire [4:0] _T_536 = _T_472 ? 5'h16 : _T_535; // @[Mux.scala 98:16]
  wire [4:0] _T_537 = _T_470 ? 5'h17 : _T_536; // @[Mux.scala 98:16]
  wire [4:0] _T_538 = _T_468 ? 5'h18 : _T_537; // @[Mux.scala 98:16]
  wire [4:0] _T_539 = _T_466 ? 5'h19 : _T_538; // @[Mux.scala 98:16]
  wire [4:0] _T_540 = _T_464 ? 5'h1a : _T_539; // @[Mux.scala 98:16]
  wire [4:0] _T_541 = _T_462 ? 5'h1b : _T_540; // @[Mux.scala 98:16]
  wire [4:0] _T_542 = _T_460 ? 5'h1c : _T_541; // @[Mux.scala 98:16]
  wire [4:0] _T_543 = _T_458 ? 5'h1d : _T_542; // @[Mux.scala 98:16]
  wire [4:0] _T_544 = _T_456 ? 5'h1e : _T_543; // @[Mux.scala 98:16]
  wire [4:0] _T_545 = _T_454 ? 5'h1f : _T_544; // @[Mux.scala 98:16]
  wire [5:0] bitmanip_dw_lzd_enc = _T_452 ? 6'h20 : {{1'd0}, _T_545}; // @[Mux.scala 98:16]
  wire [5:0] _GEN_8 = {{5'd0}, bitmanip_dw_lzd_enc[5]}; // @[exu_alu_ctl.scala 221:62]
  wire [5:0] _T_551 = _T_549 & _GEN_8; // @[exu_alu_ctl.scala 221:62]
  wire  _T_553 = ~bitmanip_dw_lzd_enc[5]; // @[exu_alu_ctl.scala 221:96]
  wire [4:0] _T_555 = _T_553 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_557 = _T_555 & bitmanip_dw_lzd_enc[4:0]; // @[exu_alu_ctl.scala 221:121]
  wire [10:0] bitmanip_clz_ctz_result = {_T_551,_T_557}; // @[Cat.scala 29:58]
  wire [31:0] _T_914 = {26'h0,bitmanip_clz_ctz_result[5:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_915 = _T_912 | _T_914; // @[exu_alu_ctl.scala 309:56]
  wire [5:0] _T_559 = io_i0_ap_pcnt ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_592 = io_a_in[0] + io_a_in[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_594 = io_a_in[2] + io_a_in[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_596 = _T_592 + _T_594; // @[Bitwise.scala 47:55]
  wire [1:0] _T_598 = io_a_in[4] + io_a_in[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_600 = io_a_in[6] + io_a_in[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_602 = _T_598 + _T_600; // @[Bitwise.scala 47:55]
  wire [3:0] _T_604 = _T_596 + _T_602; // @[Bitwise.scala 47:55]
  wire [1:0] _T_606 = io_a_in[8] + io_a_in[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_608 = io_a_in[10] + io_a_in[11]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_610 = _T_606 + _T_608; // @[Bitwise.scala 47:55]
  wire [1:0] _T_612 = io_a_in[12] + io_a_in[13]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_614 = io_a_in[14] + io_a_in[15]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_616 = _T_612 + _T_614; // @[Bitwise.scala 47:55]
  wire [3:0] _T_618 = _T_610 + _T_616; // @[Bitwise.scala 47:55]
  wire [4:0] _T_620 = _T_604 + _T_618; // @[Bitwise.scala 47:55]
  wire [1:0] _T_622 = io_a_in[16] + io_a_in[17]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_624 = io_a_in[18] + io_a_in[19]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_626 = _T_622 + _T_624; // @[Bitwise.scala 47:55]
  wire [1:0] _T_628 = io_a_in[20] + io_a_in[21]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_630 = io_a_in[22] + io_a_in[23]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_632 = _T_628 + _T_630; // @[Bitwise.scala 47:55]
  wire [3:0] _T_634 = _T_626 + _T_632; // @[Bitwise.scala 47:55]
  wire [1:0] _T_636 = io_a_in[24] + io_a_in[25]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_638 = io_a_in[26] + io_a_in[27]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_640 = _T_636 + _T_638; // @[Bitwise.scala 47:55]
  wire [1:0] _T_642 = io_a_in[28] + io_a_in[29]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_644 = io_a_in[30] + io_a_in[31]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_646 = _T_642 + _T_644; // @[Bitwise.scala 47:55]
  wire [3:0] _T_648 = _T_640 + _T_646; // @[Bitwise.scala 47:55]
  wire [4:0] _T_650 = _T_634 + _T_648; // @[Bitwise.scala 47:55]
  wire [5:0] _T_652 = _T_620 + _T_650; // @[Bitwise.scala 47:55]
  wire [5:0] bitmanip_pcnt_result = _T_559 & _T_652; // @[exu_alu_ctl.scala 224:50]
  wire [31:0] _T_917 = {26'h0,bitmanip_pcnt_result}; // @[Cat.scala 29:58]
  wire [31:0] _T_918 = _T_915 | _T_917; // @[exu_alu_ctl.scala 310:52]
  wire [23:0] _T_656 = io_a_in[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_658 = {_T_656,io_a_in[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_664 = io_i0_ap_sext_b ? _T_658 : 32'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_661 = io_a_in[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_663 = {_T_661,io_a_in[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_665 = io_i0_ap_sext_h ? _T_663 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] bitmanip_sext_result = _T_664 | _T_665; // @[Mux.scala 27:72]
  wire [31:0] _T_920 = _T_918 | bitmanip_sext_result; // @[exu_alu_ctl.scala 311:52]
  wire  bitmanip_minmax_sel = io_i0_ap_min | io_i0_ap_max; // @[exu_alu_ctl.scala 233:46]
  wire  ge = ~lt; // @[exu_alu_ctl.scala 155:29]
  wire  bitmanip_minmax_sel_a = ge ^ io_i0_ap_min; // @[exu_alu_ctl.scala 235:43]
  wire  _T_667 = bitmanip_minmax_sel & bitmanip_minmax_sel_a; // @[exu_alu_ctl.scala 238:26]
  wire [31:0] _T_677 = _T_667 ? $signed(io_a_in) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire  _T_668 = ~bitmanip_minmax_sel_a; // @[exu_alu_ctl.scala 239:28]
  wire  _T_669 = bitmanip_minmax_sel & _T_668; // @[exu_alu_ctl.scala 239:26]
  wire [31:0] _T_678 = _T_669 ? $signed(io_b_in) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_921 = $signed(_T_677) | $signed(_T_678); // @[exu_alu_ctl.scala 313:27]
  wire [31:0] _T_922 = _T_920 | _T_921; // @[exu_alu_ctl.scala 312:35]
  wire [31:0] _T_684 = io_i0_ap_pack ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_687 = {io_b_in[15:0],io_a_in[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_pack_result = _T_684 & _T_687; // @[exu_alu_ctl.scala 244:50]
  wire [31:0] _T_924 = _T_922 | bitmanip_pack_result; // @[exu_alu_ctl.scala 313:35]
  wire [31:0] _T_689 = io_i0_ap_packu ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_692 = {io_b_in[31:16],io_a_in[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_packu_result = _T_689 & _T_692; // @[exu_alu_ctl.scala 245:50]
  wire [31:0] _T_926 = _T_924 | bitmanip_packu_result; // @[exu_alu_ctl.scala 314:35]
  wire [31:0] _T_694 = io_i0_ap_packh ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_698 = {16'h0,io_b_in[7:0],io_a_in[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_packh_result = _T_694 & _T_698; // @[exu_alu_ctl.scala 246:50]
  wire [31:0] _T_928 = _T_926 | bitmanip_packh_result; // @[exu_alu_ctl.scala 315:35]
  wire [31:0] _T_700 = ap_rev ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] bitmanip_rev_result = _T_700 & bitmanip_a_reverse_ff; // @[exu_alu_ctl.scala 252:48]
  wire [31:0] _T_930 = _T_928 | bitmanip_rev_result; // @[exu_alu_ctl.scala 316:35]
  wire [31:0] _T_765 = ap_rev8 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_772 = {io_a_in[7:0],io_a_in[15:8],io_a_in[23:16],io_a_in[31:24]}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_rev8_result = _T_765 & _T_772; // @[exu_alu_ctl.scala 254:50]
  wire [31:0] _T_932 = _T_930 | bitmanip_rev8_result; // @[exu_alu_ctl.scala 317:35]
  wire [31:0] _T_774 = ap_orc_b ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  _T_788 = |io_a_in[31:24]; // @[exu_alu_ctl.scala 279:117]
  wire [7:0] _T_790 = _T_788 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_784 = |io_a_in[23:16]; // @[exu_alu_ctl.scala 279:117]
  wire [7:0] _T_786 = _T_784 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_780 = |io_a_in[15:8]; // @[exu_alu_ctl.scala 279:117]
  wire [7:0] _T_782 = _T_780 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_776 = |io_a_in[7:0]; // @[exu_alu_ctl.scala 279:117]
  wire [7:0] _T_778 = _T_776 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_793 = {_T_790,_T_786,_T_782,_T_778}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_orc_b_result = _T_774 & _T_793; // @[exu_alu_ctl.scala 279:50]
  wire [31:0] _T_934 = _T_932 | bitmanip_orc_b_result; // @[exu_alu_ctl.scala 318:35]
  wire [31:0] _T_795 = ap_orc16 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_798 = io_a_in[31:16] | io_a_in[15:0]; // @[exu_alu_ctl.scala 281:71]
  wire [31:0] _T_802 = {_T_798,_T_798}; // @[Cat.scala 29:58]
  wire [31:0] bitmanip_orc16_result = _T_795 & _T_802; // @[exu_alu_ctl.scala 281:50]
  wire [31:0] _T_936 = _T_934 | bitmanip_orc16_result; // @[exu_alu_ctl.scala 319:35]
  wire [62:0] bitmanip_sb_1hot = 63'h1 << io_b_in[4:0]; // @[exu_alu_ctl.scala 285:53]
  wire [31:0] _T_805 = bitmanip_sb_1hot[31:0]; // @[exu_alu_ctl.scala 288:53]
  wire [31:0] _T_820 = $signed(io_a_in) | $signed(_T_805); // @[Mux.scala 27:72]
  wire [31:0] _T_827 = io_i0_ap_sbset ? $signed(_T_820) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_811 = ~_T_805; // @[exu_alu_ctl.scala 289:29]
  wire [31:0] _T_823 = $signed(io_a_in) & $signed(_T_811); // @[Mux.scala 27:72]
  wire [31:0] _T_828 = io_i0_ap_sbclr ? $signed(_T_823) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_831 = $signed(_T_827) | $signed(_T_828); // @[Mux.scala 27:72]
  wire [31:0] _T_826 = $signed(io_a_in) ^ $signed(_T_805); // @[Mux.scala 27:72]
  wire [31:0] _T_829 = io_i0_ap_sbinv ? $signed(_T_826) : $signed(32'sh0); // @[Mux.scala 27:72]
  wire [31:0] _T_937 = $signed(_T_831) | $signed(_T_829); // @[exu_alu_ctl.scala 321:21]
  wire [31:0] result = _T_936 | _T_937; // @[exu_alu_ctl.scala 320:35]
  wire  eq = $signed(io_a_in) == $signed(io_b_in); // @[exu_alu_ctl.scala 151:38]
  wire  ne = ~eq; // @[exu_alu_ctl.scala 152:29]
  wire  _T_941 = io_i0_ap_beq & eq; // @[exu_alu_ctl.scala 335:43]
  wire  _T_942 = io_i0_ap_bne & ne; // @[exu_alu_ctl.scala 335:65]
  wire  _T_943 = _T_941 | _T_942; // @[exu_alu_ctl.scala 335:49]
  wire  _T_944 = io_i0_ap_blt & lt; // @[exu_alu_ctl.scala 335:94]
  wire  _T_945 = _T_943 | _T_944; // @[exu_alu_ctl.scala 335:78]
  wire  _T_946 = io_i0_ap_bge & ge; // @[exu_alu_ctl.scala 335:116]
  wire  _T_947 = _T_945 | _T_946; // @[exu_alu_ctl.scala 335:100]
  wire  actual_taken = _T_947 | sel_pc; // @[exu_alu_ctl.scala 335:122]
  wire  _T_948 = io_dec_alu_dec_i0_alu_decode_d & io_i0_ap_predict_nt; // @[exu_alu_ctl.scala 340:61]
  wire  _T_949 = ~actual_taken; // @[exu_alu_ctl.scala 340:85]
  wire  _T_950 = _T_948 & _T_949; // @[exu_alu_ctl.scala 340:83]
  wire  _T_951 = ~sel_pc; // @[exu_alu_ctl.scala 340:101]
  wire  _T_952 = _T_950 & _T_951; // @[exu_alu_ctl.scala 340:99]
  wire  _T_953 = io_dec_alu_dec_i0_alu_decode_d & io_i0_ap_predict_t; // @[exu_alu_ctl.scala 340:145]
  wire  _T_954 = _T_953 & actual_taken; // @[exu_alu_ctl.scala 340:167]
  wire  _T_956 = _T_954 & _T_951; // @[exu_alu_ctl.scala 340:183]
  wire  _T_963 = io_i0_ap_predict_t & _T_949; // @[exu_alu_ctl.scala 345:48]
  wire  _T_964 = io_i0_ap_predict_nt & actual_taken; // @[exu_alu_ctl.scala 345:88]
  wire  cond_mispredict = _T_963 | _T_964; // @[exu_alu_ctl.scala 345:65]
  wire  _T_966 = io_pp_in_bits_prett != aout[31:1]; // @[exu_alu_ctl.scala 348:72]
  wire  target_mispredict = io_pp_in_bits_pret & _T_966; // @[exu_alu_ctl.scala 348:49]
  wire  _T_967 = io_i0_ap_jal | cond_mispredict; // @[exu_alu_ctl.scala 350:45]
  wire  _T_968 = _T_967 | target_mispredict; // @[exu_alu_ctl.scala 350:63]
  wire  _T_969 = _T_968 & io_dec_alu_dec_i0_alu_decode_d; // @[exu_alu_ctl.scala 350:84]
  wire  _T_970 = ~io_flush_upper_x; // @[exu_alu_ctl.scala 350:119]
  wire  _T_971 = _T_969 & _T_970; // @[exu_alu_ctl.scala 350:117]
  wire  _T_972 = ~io_dec_tlu_flush_lower_r; // @[exu_alu_ctl.scala 350:141]
  wire  _T_982 = io_pp_in_bits_hist[1] & io_pp_in_bits_hist[0]; // @[exu_alu_ctl.scala 355:44]
  wire  _T_984 = ~io_pp_in_bits_hist[0]; // @[exu_alu_ctl.scala 355:73]
  wire  _T_985 = _T_984 & actual_taken; // @[exu_alu_ctl.scala 355:96]
  wire  _T_986 = _T_982 | _T_985; // @[exu_alu_ctl.scala 355:70]
  wire  _T_988 = ~io_pp_in_bits_hist[1]; // @[exu_alu_ctl.scala 356:6]
  wire  _T_990 = _T_988 & _T_949; // @[exu_alu_ctl.scala 356:29]
  wire  _T_992 = io_pp_in_bits_hist[1] & actual_taken; // @[exu_alu_ctl.scala 356:72]
  wire  _T_993 = _T_990 | _T_992; // @[exu_alu_ctl.scala 356:47]
  wire  _T_997 = _T_970 & _T_972; // @[exu_alu_ctl.scala 359:56]
  wire  _T_998 = cond_mispredict | target_mispredict; // @[exu_alu_ctl.scala 359:103]
  rvclkhdr rvclkhdr ( // @[lib.scala 399:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  assign io_dec_alu_exu_i0_pc_x = _T_14; // @[exu_alu_ctl.scala 133:26]
  assign io_result_ff = _T_18; // @[exu_alu_ctl.scala 135:16]
  assign io_flush_upper_out = _T_971 & _T_972; // @[exu_alu_ctl.scala 350:26]
  assign io_flush_final_out = _T_971 | io_dec_tlu_flush_lower_r; // @[exu_alu_ctl.scala 351:26]
  assign io_flush_path_out = sel_pc ? aout[31:1] : pcout[31:1]; // @[exu_alu_ctl.scala 342:22]
  assign io_pred_correct_out = _T_952 | _T_956; // @[exu_alu_ctl.scala 340:26]
  assign io_predict_p_out_valid = io_pp_in_valid; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_misp = _T_997 & _T_998; // @[exu_alu_ctl.scala 358:30 exu_alu_ctl.scala 359:35]
  assign io_predict_p_out_bits_ataken = _T_947 | sel_pc; // @[exu_alu_ctl.scala 358:30 exu_alu_ctl.scala 360:35]
  assign io_predict_p_out_bits_boffset = io_pp_in_bits_boffset; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_pc4 = io_pp_in_bits_pc4; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_hist = {_T_986,_T_993}; // @[exu_alu_ctl.scala 358:30 exu_alu_ctl.scala 361:35]
  assign io_predict_p_out_bits_toffset = io_pp_in_bits_toffset; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_br_error = io_pp_in_bits_br_error; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_br_start_error = io_pp_in_bits_br_start_error; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_prett = io_pp_in_bits_prett; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_pcall = io_pp_in_bits_pcall; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_pret = io_pp_in_bits_pret; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_pja = io_pp_in_bits_pja; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_way = io_pp_in_bits_way; // @[exu_alu_ctl.scala 358:30]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_io_en = io_enable & io_dec_alu_dec_i0_alu_decode_d; // @[lib.scala 402:17]
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
  _T_14 = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  _T_18 = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_14 = 31'h0;
  end
  if (reset) begin
    _T_18 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_14 <= 31'h0;
    end else if (io_enable) begin
      _T_14 <= io_dec_i0_pc_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_18 <= 32'h0;
    end else if (_T_15) begin
      _T_18 <= result;
    end
  end
endmodule
