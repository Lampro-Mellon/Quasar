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
  input         io_flush_upper_x,
  input         io_dec_tlu_flush_lower_r,
  input         io_enable,
  input         io_i0_ap_clz,
  input         io_i0_ap_ctz,
  input         io_i0_ap_pcnt,
  input         io_i0_ap_sext_b,
  input         io_i0_ap_sext_h,
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
  input         io_pp_in_bits_boffset,
  input         io_pp_in_bits_pc4,
  input  [1:0]  io_pp_in_bits_hist,
  input  [11:0] io_pp_in_bits_toffset,
  input         io_pp_in_bits_br_error,
  input         io_pp_in_bits_br_start_error,
  input         io_pp_in_bits_pcall,
  input         io_pp_in_bits_pja,
  input         io_pp_in_bits_way,
  input         io_pp_in_bits_pret,
  input  [30:0] io_pp_in_bits_prett,
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
  output        io_predict_p_out_bits_pcall,
  output        io_predict_p_out_bits_pja,
  output        io_predict_p_out_bits_way,
  output        io_predict_p_out_bits_pret
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
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
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
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
  assign io_predict_p_out_bits_pcall = io_pp_in_bits_pcall; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_pja = io_pp_in_bits_pja; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_way = io_pp_in_bits_way; // @[exu_alu_ctl.scala 358:30]
  assign io_predict_p_out_bits_pret = io_pp_in_bits_pret; // @[exu_alu_ctl.scala 358:30]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = io_enable & io_dec_alu_dec_i0_alu_decode_d; // @[lib.scala 407:17]
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
module exu_mul_ctl(
  input         clock,
  input         reset,
  input         io_mul_p_valid,
  input         io_mul_p_bits_rs1_sign,
  input         io_mul_p_bits_rs2_sign,
  input         io_mul_p_bits_low,
  input  [31:0] io_rs1_in,
  input  [31:0] io_rs2_in,
  output [31:0] io_result_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 431:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 431:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 431:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 431:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 404:23]
  wire  _T_1 = io_mul_p_bits_rs1_sign & io_rs1_in[31]; // @[exu_mul_ctl.scala 123:44]
  wire [32:0] rs1_ext_in = {_T_1,io_rs1_in}; // @[exu_mul_ctl.scala 123:71]
  wire  _T_5 = io_mul_p_bits_rs2_sign & io_rs2_in[31]; // @[exu_mul_ctl.scala 124:44]
  wire [32:0] rs2_ext_in = {_T_5,io_rs2_in}; // @[exu_mul_ctl.scala 124:71]
  reg  low_x; // @[Reg.scala 27:20]
  reg [32:0] rs1_x; // @[Reg.scala 27:20]
  reg [32:0] rs2_x; // @[Reg.scala 27:20]
  wire [65:0] prod_x = $signed(rs1_x) * $signed(rs2_x); // @[exu_mul_ctl.scala 130:20]
  wire  _T_39758 = ~low_x; // @[exu_mul_ctl.scala 388:46]
  wire [7:0] _T_39762 = {_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758}; // @[Cat.scala 29:58]
  wire [15:0] _T_39763 = {_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39762}; // @[Cat.scala 29:58]
  wire [31:0] _T_39764 = {_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39762,_T_39763}; // @[Cat.scala 29:58]
  wire [31:0] _T_39766 = _T_39764 & prod_x[63:32]; // @[exu_mul_ctl.scala 388:54]
  wire [7:0] _T_39771 = {low_x,low_x,low_x,low_x,low_x,low_x,low_x,low_x}; // @[Cat.scala 29:58]
  wire [15:0] _T_39772 = {low_x,low_x,low_x,low_x,low_x,low_x,low_x,low_x,_T_39771}; // @[Cat.scala 29:58]
  wire [31:0] _T_39773 = {low_x,low_x,low_x,low_x,low_x,low_x,low_x,low_x,_T_39771,_T_39772}; // @[Cat.scala 29:58]
  wire [31:0] _T_39775 = _T_39773 & prod_x[31:0]; // @[exu_mul_ctl.scala 389:40]
  rvclkhdr rvclkhdr ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 431:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 431:23]
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
  assign io_result_x = _T_39766 | _T_39775; // @[exu_mul_ctl.scala 388:15]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = io_mul_p_valid; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 433:18]
  assign rvclkhdr_1_io_en = io_mul_p_valid; // @[lib.scala 434:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 433:18]
  assign rvclkhdr_2_io_en = io_mul_p_valid; // @[lib.scala 434:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = io_mul_p_valid; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = io_mul_p_valid; // @[lib.scala 407:17]
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
  low_x = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  rs1_x = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  rs2_x = _RAND_2[32:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    low_x = 1'h0;
  end
  if (reset) begin
    rs1_x = 33'sh0;
  end
  if (reset) begin
    rs2_x = 33'sh0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      low_x <= 1'h0;
    end else if (io_mul_p_valid) begin
      low_x <= io_mul_p_bits_low;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rs1_x <= 33'sh0;
    end else if (io_mul_p_valid) begin
      rs1_x <= rs1_ext_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rs2_x <= 33'sh0;
    end else if (io_mul_p_valid) begin
      rs2_x <= rs2_ext_in;
    end
  end
endmodule
module exu_div_cls(
  input  [32:0] io_operand,
  output [4:0]  io_cls
);
  wire  _T_3 = io_operand[31:30] == 2'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_5 = io_operand[31:29] == 3'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_7 = io_operand[31:28] == 4'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_9 = io_operand[31:27] == 5'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_11 = io_operand[31:26] == 6'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_13 = io_operand[31:25] == 7'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_15 = io_operand[31:24] == 8'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_17 = io_operand[31:23] == 9'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_19 = io_operand[31:22] == 10'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_21 = io_operand[31:21] == 11'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_23 = io_operand[31:20] == 12'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_25 = io_operand[31:19] == 13'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_27 = io_operand[31:18] == 14'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_29 = io_operand[31:17] == 15'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_31 = io_operand[31:16] == 16'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_33 = io_operand[31:15] == 17'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_35 = io_operand[31:14] == 18'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_37 = io_operand[31:13] == 19'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_39 = io_operand[31:12] == 20'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_41 = io_operand[31:11] == 21'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_43 = io_operand[31:10] == 22'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_45 = io_operand[31:9] == 23'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_47 = io_operand[31:8] == 24'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_49 = io_operand[31:7] == 25'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_51 = io_operand[31:6] == 26'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_53 = io_operand[31:5] == 27'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_55 = io_operand[31:4] == 28'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_57 = io_operand[31:3] == 29'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_59 = io_operand[31:2] == 30'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_61 = io_operand[31:1] == 31'h1; // @[exu_div_ctl.scala 950:63]
  wire  _T_63 = io_operand[31:0] == 32'h1; // @[exu_div_ctl.scala 950:63]
  wire [1:0] _T_66 = _T_5 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_67 = _T_7 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_68 = _T_9 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_69 = _T_11 ? 3'h5 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_70 = _T_13 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_71 = _T_15 ? 3'h7 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_72 = _T_17 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_73 = _T_19 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_74 = _T_21 ? 4'ha : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_75 = _T_23 ? 4'hb : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_76 = _T_25 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_77 = _T_27 ? 4'hd : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_78 = _T_29 ? 4'he : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_79 = _T_31 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_80 = _T_33 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_81 = _T_35 ? 5'h11 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_82 = _T_37 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_83 = _T_39 ? 5'h13 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_84 = _T_41 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_85 = _T_43 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_86 = _T_45 ? 5'h16 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_87 = _T_47 ? 5'h17 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_88 = _T_49 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_89 = _T_51 ? 5'h19 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_90 = _T_53 ? 5'h1a : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_91 = _T_55 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_92 = _T_57 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_93 = _T_59 ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_94 = _T_61 ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_95 = _T_63 ? 5'h1f : 5'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_1 = {{1'd0}, _T_3}; // @[Mux.scala 27:72]
  wire [1:0] _T_97 = _GEN_1 | _T_66; // @[Mux.scala 27:72]
  wire [1:0] _T_98 = _T_97 | _T_67; // @[Mux.scala 27:72]
  wire [2:0] _GEN_2 = {{1'd0}, _T_98}; // @[Mux.scala 27:72]
  wire [2:0] _T_99 = _GEN_2 | _T_68; // @[Mux.scala 27:72]
  wire [2:0] _T_100 = _T_99 | _T_69; // @[Mux.scala 27:72]
  wire [2:0] _T_101 = _T_100 | _T_70; // @[Mux.scala 27:72]
  wire [2:0] _T_102 = _T_101 | _T_71; // @[Mux.scala 27:72]
  wire [3:0] _GEN_3 = {{1'd0}, _T_102}; // @[Mux.scala 27:72]
  wire [3:0] _T_103 = _GEN_3 | _T_72; // @[Mux.scala 27:72]
  wire [3:0] _T_104 = _T_103 | _T_73; // @[Mux.scala 27:72]
  wire [3:0] _T_105 = _T_104 | _T_74; // @[Mux.scala 27:72]
  wire [3:0] _T_106 = _T_105 | _T_75; // @[Mux.scala 27:72]
  wire [3:0] _T_107 = _T_106 | _T_76; // @[Mux.scala 27:72]
  wire [3:0] _T_108 = _T_107 | _T_77; // @[Mux.scala 27:72]
  wire [3:0] _T_109 = _T_108 | _T_78; // @[Mux.scala 27:72]
  wire [3:0] _T_110 = _T_109 | _T_79; // @[Mux.scala 27:72]
  wire [4:0] _GEN_4 = {{1'd0}, _T_110}; // @[Mux.scala 27:72]
  wire [4:0] _T_111 = _GEN_4 | _T_80; // @[Mux.scala 27:72]
  wire [4:0] _T_112 = _T_111 | _T_81; // @[Mux.scala 27:72]
  wire [4:0] _T_113 = _T_112 | _T_82; // @[Mux.scala 27:72]
  wire [4:0] _T_114 = _T_113 | _T_83; // @[Mux.scala 27:72]
  wire [4:0] _T_115 = _T_114 | _T_84; // @[Mux.scala 27:72]
  wire [4:0] _T_116 = _T_115 | _T_85; // @[Mux.scala 27:72]
  wire [4:0] _T_117 = _T_116 | _T_86; // @[Mux.scala 27:72]
  wire [4:0] _T_118 = _T_117 | _T_87; // @[Mux.scala 27:72]
  wire [4:0] _T_119 = _T_118 | _T_88; // @[Mux.scala 27:72]
  wire [4:0] _T_120 = _T_119 | _T_89; // @[Mux.scala 27:72]
  wire [4:0] _T_121 = _T_120 | _T_90; // @[Mux.scala 27:72]
  wire [4:0] _T_122 = _T_121 | _T_91; // @[Mux.scala 27:72]
  wire [4:0] _T_123 = _T_122 | _T_92; // @[Mux.scala 27:72]
  wire [4:0] _T_124 = _T_123 | _T_93; // @[Mux.scala 27:72]
  wire [4:0] _T_125 = _T_124 | _T_94; // @[Mux.scala 27:72]
  wire [4:0] cls_zeros = _T_125 | _T_95; // @[Mux.scala 27:72]
  wire  _T_129 = io_operand[31:0] == 32'hffffffff; // @[exu_div_ctl.scala 952:25]
  wire  _T_137 = io_operand[31:29] == 3'h6; // @[exu_div_ctl.scala 953:76]
  wire  _T_142 = io_operand[31:28] == 4'he; // @[exu_div_ctl.scala 953:76]
  wire  _T_147 = io_operand[31:27] == 5'h1e; // @[exu_div_ctl.scala 953:76]
  wire  _T_152 = io_operand[31:26] == 6'h3e; // @[exu_div_ctl.scala 953:76]
  wire  _T_157 = io_operand[31:25] == 7'h7e; // @[exu_div_ctl.scala 953:76]
  wire  _T_162 = io_operand[31:24] == 8'hfe; // @[exu_div_ctl.scala 953:76]
  wire  _T_167 = io_operand[31:23] == 9'h1fe; // @[exu_div_ctl.scala 953:76]
  wire  _T_172 = io_operand[31:22] == 10'h3fe; // @[exu_div_ctl.scala 953:76]
  wire  _T_177 = io_operand[31:21] == 11'h7fe; // @[exu_div_ctl.scala 953:76]
  wire  _T_182 = io_operand[31:20] == 12'hffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_187 = io_operand[31:19] == 13'h1ffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_192 = io_operand[31:18] == 14'h3ffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_197 = io_operand[31:17] == 15'h7ffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_202 = io_operand[31:16] == 16'hfffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_207 = io_operand[31:15] == 17'h1fffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_212 = io_operand[31:14] == 18'h3fffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_217 = io_operand[31:13] == 19'h7fffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_222 = io_operand[31:12] == 20'hffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_227 = io_operand[31:11] == 21'h1ffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_232 = io_operand[31:10] == 22'h3ffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_237 = io_operand[31:9] == 23'h7ffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_242 = io_operand[31:8] == 24'hfffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_247 = io_operand[31:7] == 25'h1fffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_252 = io_operand[31:6] == 26'h3fffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_257 = io_operand[31:5] == 27'h7fffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_262 = io_operand[31:4] == 28'hffffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_267 = io_operand[31:3] == 29'h1ffffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_272 = io_operand[31:2] == 30'h3ffffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_277 = io_operand[31:1] == 31'h7ffffffe; // @[exu_div_ctl.scala 953:76]
  wire  _T_282 = io_operand[31:0] == 32'hfffffffe; // @[exu_div_ctl.scala 953:76]
  wire [1:0] _T_286 = _T_142 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_287 = _T_147 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_288 = _T_152 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_289 = _T_157 ? 3'h5 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_290 = _T_162 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_291 = _T_167 ? 3'h7 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_292 = _T_172 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_293 = _T_177 ? 4'h9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_294 = _T_182 ? 4'ha : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_295 = _T_187 ? 4'hb : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_296 = _T_192 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_297 = _T_197 ? 4'hd : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_298 = _T_202 ? 4'he : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_299 = _T_207 ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_300 = _T_212 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_301 = _T_217 ? 5'h11 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_302 = _T_222 ? 5'h12 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_303 = _T_227 ? 5'h13 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_304 = _T_232 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_305 = _T_237 ? 5'h15 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_306 = _T_242 ? 5'h16 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_307 = _T_247 ? 5'h17 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_308 = _T_252 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_309 = _T_257 ? 5'h19 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_310 = _T_262 ? 5'h1a : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_311 = _T_267 ? 5'h1b : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_312 = _T_272 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_313 = _T_277 ? 5'h1d : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_314 = _T_282 ? 5'h1e : 5'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_5 = {{1'd0}, _T_137}; // @[Mux.scala 27:72]
  wire [1:0] _T_316 = _GEN_5 | _T_286; // @[Mux.scala 27:72]
  wire [1:0] _T_317 = _T_316 | _T_287; // @[Mux.scala 27:72]
  wire [2:0] _GEN_6 = {{1'd0}, _T_317}; // @[Mux.scala 27:72]
  wire [2:0] _T_318 = _GEN_6 | _T_288; // @[Mux.scala 27:72]
  wire [2:0] _T_319 = _T_318 | _T_289; // @[Mux.scala 27:72]
  wire [2:0] _T_320 = _T_319 | _T_290; // @[Mux.scala 27:72]
  wire [2:0] _T_321 = _T_320 | _T_291; // @[Mux.scala 27:72]
  wire [3:0] _GEN_7 = {{1'd0}, _T_321}; // @[Mux.scala 27:72]
  wire [3:0] _T_322 = _GEN_7 | _T_292; // @[Mux.scala 27:72]
  wire [3:0] _T_323 = _T_322 | _T_293; // @[Mux.scala 27:72]
  wire [3:0] _T_324 = _T_323 | _T_294; // @[Mux.scala 27:72]
  wire [3:0] _T_325 = _T_324 | _T_295; // @[Mux.scala 27:72]
  wire [3:0] _T_326 = _T_325 | _T_296; // @[Mux.scala 27:72]
  wire [3:0] _T_327 = _T_326 | _T_297; // @[Mux.scala 27:72]
  wire [3:0] _T_328 = _T_327 | _T_298; // @[Mux.scala 27:72]
  wire [3:0] _T_329 = _T_328 | _T_299; // @[Mux.scala 27:72]
  wire [4:0] _GEN_8 = {{1'd0}, _T_329}; // @[Mux.scala 27:72]
  wire [4:0] _T_330 = _GEN_8 | _T_300; // @[Mux.scala 27:72]
  wire [4:0] _T_331 = _T_330 | _T_301; // @[Mux.scala 27:72]
  wire [4:0] _T_332 = _T_331 | _T_302; // @[Mux.scala 27:72]
  wire [4:0] _T_333 = _T_332 | _T_303; // @[Mux.scala 27:72]
  wire [4:0] _T_334 = _T_333 | _T_304; // @[Mux.scala 27:72]
  wire [4:0] _T_335 = _T_334 | _T_305; // @[Mux.scala 27:72]
  wire [4:0] _T_336 = _T_335 | _T_306; // @[Mux.scala 27:72]
  wire [4:0] _T_337 = _T_336 | _T_307; // @[Mux.scala 27:72]
  wire [4:0] _T_338 = _T_337 | _T_308; // @[Mux.scala 27:72]
  wire [4:0] _T_339 = _T_338 | _T_309; // @[Mux.scala 27:72]
  wire [4:0] _T_340 = _T_339 | _T_310; // @[Mux.scala 27:72]
  wire [4:0] _T_341 = _T_340 | _T_311; // @[Mux.scala 27:72]
  wire [4:0] _T_342 = _T_341 | _T_312; // @[Mux.scala 27:72]
  wire [4:0] _T_343 = _T_342 | _T_313; // @[Mux.scala 27:72]
  wire [4:0] _T_344 = _T_343 | _T_314; // @[Mux.scala 27:72]
  wire [4:0] cls_ones = _T_129 ? 5'h1f : _T_344; // @[exu_div_ctl.scala 952:44]
  assign io_cls = io_operand[32] ? cls_ones : cls_zeros; // @[exu_div_ctl.scala 954:25]
endmodule
module exu_div_new_4bit_fullshortq(
  input         clock,
  input         reset,
  input         io_cancel,
  input         io_valid_in,
  input         io_signed_in,
  input         io_rem_in,
  input  [31:0] io_dividend_in,
  input  [31:0] io_divisor_in,
  output [31:0] io_data_out,
  output        io_valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] a_enc_io_operand; // @[exu_div_ctl.scala 913:31]
  wire [4:0] a_enc_io_cls; // @[exu_div_ctl.scala 913:31]
  wire [32:0] b_enc_io_operand; // @[exu_div_ctl.scala 916:31]
  wire [4:0] b_enc_io_cls; // @[exu_div_ctl.scala 916:31]
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
  wire  _T = ~io_cancel; // @[exu_div_ctl.scala 776:44]
  wire  valid_ff_in = io_valid_in & _T; // @[exu_div_ctl.scala 776:42]
  wire  _T_1 = ~io_valid_in; // @[exu_div_ctl.scala 777:35]
  reg [2:0] control_ff; // @[Reg.scala 27:20]
  wire  _T_3 = _T_1 & control_ff[2]; // @[exu_div_ctl.scala 777:48]
  wire  _T_4 = io_valid_in & io_signed_in; // @[exu_div_ctl.scala 777:80]
  wire  _T_6 = _T_4 & io_dividend_in[31]; // @[exu_div_ctl.scala 777:96]
  wire  _T_7 = _T_3 | _T_6; // @[exu_div_ctl.scala 777:65]
  wire  _T_10 = _T_1 & control_ff[1]; // @[exu_div_ctl.scala 777:133]
  wire  _T_13 = _T_4 & io_divisor_in[31]; // @[exu_div_ctl.scala 777:181]
  wire  _T_14 = _T_10 | _T_13; // @[exu_div_ctl.scala 777:150]
  wire  _T_17 = _T_1 & control_ff[0]; // @[exu_div_ctl.scala 777:218]
  wire  _T_18 = io_valid_in & io_rem_in; // @[exu_div_ctl.scala 777:250]
  wire  _T_19 = _T_17 | _T_18; // @[exu_div_ctl.scala 777:235]
  wire [2:0] control_in = {_T_7,_T_14,_T_19}; // @[Cat.scala 29:58]
  reg [32:0] b_ff1; // @[Reg.scala 27:20]
  wire [37:0] b_ff = {b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1[32],b_ff1}; // @[Cat.scala 29:58]
  wire  _T_22 = b_ff[31:0] == 32'h0; // @[exu_div_ctl.scala 781:54]
  reg  valid_ff; // @[Reg.scala 27:20]
  wire  by_zero_case = valid_ff & _T_22; // @[exu_div_ctl.scala 781:40]
  reg [31:0] a_ff; // @[Reg.scala 27:20]
  wire  _T_24 = a_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 783:37]
  wire  _T_26 = b_ff[31:4] == 28'h0; // @[exu_div_ctl.scala 783:60]
  wire  _T_27 = _T_24 & _T_26; // @[exu_div_ctl.scala 783:46]
  wire  _T_28 = ~by_zero_case; // @[exu_div_ctl.scala 783:71]
  wire  _T_29 = _T_27 & _T_28; // @[exu_div_ctl.scala 783:69]
  wire  _T_30 = ~control_ff[0]; // @[exu_div_ctl.scala 783:87]
  wire  _T_31 = _T_29 & _T_30; // @[exu_div_ctl.scala 783:85]
  wire  _T_32 = _T_31 & valid_ff; // @[exu_div_ctl.scala 783:95]
  wire  _T_34 = _T_32 & _T; // @[exu_div_ctl.scala 783:106]
  wire  _T_36 = a_ff == 32'h0; // @[exu_div_ctl.scala 784:18]
  wire  _T_38 = _T_36 & _T_28; // @[exu_div_ctl.scala 784:27]
  wire  _T_40 = _T_38 & _T_30; // @[exu_div_ctl.scala 784:43]
  wire  _T_41 = _T_40 & valid_ff; // @[exu_div_ctl.scala 784:53]
  wire  _T_43 = _T_41 & _T; // @[exu_div_ctl.scala 784:64]
  wire  smallnum_case = _T_34 | _T_43; // @[exu_div_ctl.scala 783:120]
  reg [6:0] count_ff; // @[Reg.scala 27:20]
  wire  _T_44 = |count_ff; // @[exu_div_ctl.scala 785:42]
  reg  shortq_enable_ff; // @[Reg.scala 27:20]
  wire  running_state = _T_44 | shortq_enable_ff; // @[exu_div_ctl.scala 785:45]
  wire  _T_45 = io_valid_in | valid_ff; // @[exu_div_ctl.scala 786:43]
  wire  _T_46 = _T_45 | io_cancel; // @[exu_div_ctl.scala 786:54]
  wire  _T_47 = _T_46 | running_state; // @[exu_div_ctl.scala 786:66]
  reg  finish_ff; // @[Reg.scala 27:20]
  wire  misc_enable = _T_47 | finish_ff; // @[exu_div_ctl.scala 786:82]
  wire  _T_48 = smallnum_case | by_zero_case; // @[exu_div_ctl.scala 787:45]
  wire  _T_49 = count_ff == 7'h20; // @[exu_div_ctl.scala 787:72]
  wire  finish_raw = _T_48 | _T_49; // @[exu_div_ctl.scala 787:60]
  wire  finish = finish_raw & _T; // @[exu_div_ctl.scala 788:41]
  wire  _T_51 = valid_ff | running_state; // @[exu_div_ctl.scala 789:40]
  wire  _T_52 = ~finish; // @[exu_div_ctl.scala 789:59]
  wire  _T_53 = _T_51 & _T_52; // @[exu_div_ctl.scala 789:57]
  wire  _T_54 = ~finish_ff; // @[exu_div_ctl.scala 789:69]
  wire  _T_55 = _T_53 & _T_54; // @[exu_div_ctl.scala 789:67]
  wire  _T_57 = _T_55 & _T; // @[exu_div_ctl.scala 789:80]
  wire [6:0] _T_1394 = {1'h0,1'h0,b_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1395 = {1'h0,1'h0,a_enc_io_cls}; // @[Cat.scala 29:58]
  wire [6:0] _T_1397 = _T_1394 - _T_1395; // @[exu_div_ctl.scala 921:43]
  wire [6:0] dw_shortq_raw = _T_1397 + 7'h1; // @[exu_div_ctl.scala 921:63]
  wire [5:0] shortq = dw_shortq_raw[6] ? 6'h0 : dw_shortq_raw[5:0]; // @[exu_div_ctl.scala 922:28]
  wire  _T_1403 = ~shortq[5]; // @[exu_div_ctl.scala 923:37]
  wire  _T_1404 = valid_ff & _T_1403; // @[exu_div_ctl.scala 923:35]
  wire  _T_1406 = shortq[4:2] == 3'h7; // @[exu_div_ctl.scala 923:64]
  wire  _T_1407 = ~_T_1406; // @[exu_div_ctl.scala 923:50]
  wire  _T_1408 = _T_1404 & _T_1407; // @[exu_div_ctl.scala 923:48]
  wire  shortq_enable = _T_1408 & _T; // @[exu_div_ctl.scala 923:79]
  wire  _T_58 = ~shortq_enable; // @[exu_div_ctl.scala 789:95]
  wire  count_enable = _T_57 & _T_58; // @[exu_div_ctl.scala 789:93]
  wire [6:0] _T_60 = count_enable ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _T_62 = count_ff + 7'h4; // @[exu_div_ctl.scala 790:63]
  reg [4:0] shortq_shift_ff; // @[Reg.scala 27:20]
  wire [6:0] _T_63 = {2'h0,shortq_shift_ff}; // @[Cat.scala 29:58]
  wire [6:0] _T_65 = _T_62 + _T_63; // @[exu_div_ctl.scala 790:74]
  wire [6:0] count_in = _T_60 & _T_65; // @[exu_div_ctl.scala 790:51]
  wire  a_enable = io_valid_in | running_state; // @[exu_div_ctl.scala 791:43]
  wire  _T_66 = ~shortq_enable_ff; // @[exu_div_ctl.scala 792:47]
  wire  a_shift = running_state & _T_66; // @[exu_div_ctl.scala 792:45]
  wire [32:0] _T_68 = control_ff[2] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire [64:0] _T_70 = {_T_68,a_ff}; // @[Cat.scala 29:58]
  wire [95:0] _GEN_11 = {{31'd0}, _T_70}; // @[exu_div_ctl.scala 793:74]
  wire [95:0] _T_71 = _GEN_11 << shortq_shift_ff; // @[exu_div_ctl.scala 793:74]
  wire  _T_72 = control_ff[2] ^ control_ff[1]; // @[exu_div_ctl.scala 794:61]
  wire  _T_73 = ~_T_72; // @[exu_div_ctl.scala 794:42]
  wire  b_twos_comp = valid_ff & _T_73; // @[exu_div_ctl.scala 794:40]
  wire  _T_76 = ~valid_ff; // @[exu_div_ctl.scala 796:30]
  wire  _T_78 = _T_76 & _T_30; // @[exu_div_ctl.scala 796:40]
  wire  _T_80 = _T_78 & _T_72; // @[exu_div_ctl.scala 796:50]
  reg  by_zero_case_ff; // @[Reg.scala 27:20]
  wire  _T_81 = ~by_zero_case_ff; // @[exu_div_ctl.scala 796:92]
  wire  twos_comp_q_sel = _T_80 & _T_81; // @[exu_div_ctl.scala 796:90]
  wire  b_enable = io_valid_in | b_twos_comp; // @[exu_div_ctl.scala 797:43]
  wire  rq_enable = _T_45 | running_state; // @[exu_div_ctl.scala 798:54]
  wire  _T_83 = valid_ff & control_ff[2]; // @[exu_div_ctl.scala 799:40]
  wire  r_sign_sel = _T_83 & _T_28; // @[exu_div_ctl.scala 799:59]
  reg [32:0] r_ff; // @[Reg.scala 27:20]
  wire [37:0] _T_287 = {r_ff[32],r_ff,a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [37:0] _T_289 = {b_ff[34:0],3'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_291 = _T_287 + _T_289; // @[exu_div_ctl.scala 815:67]
  wire [37:0] _T_293 = {b_ff[35:0],2'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_295 = _T_291 + _T_293; // @[exu_div_ctl.scala 815:94]
  wire [37:0] _T_297 = {b_ff[36:0],1'h0}; // @[Cat.scala 29:58]
  wire [37:0] _T_299 = _T_295 + _T_297; // @[exu_div_ctl.scala 815:121]
  wire [37:0] adder15_out = _T_299 + b_ff; // @[exu_div_ctl.scala 815:143]
  wire  _T_302 = ~adder15_out[37]; // @[exu_div_ctl.scala 818:6]
  wire  _T_303 = _T_302 ^ control_ff[2]; // @[exu_div_ctl.scala 818:23]
  wire  _T_305 = a_ff[27:0] == 28'h0; // @[exu_div_ctl.scala 818:58]
  wire  _T_306 = adder15_out == 38'h0; // @[exu_div_ctl.scala 818:82]
  wire  _T_307 = _T_305 & _T_306; // @[exu_div_ctl.scala 818:67]
  wire  _T_308 = _T_303 | _T_307; // @[exu_div_ctl.scala 818:43]
  wire  _T_310 = ~_T_299[37]; // @[exu_div_ctl.scala 819:6]
  wire  _T_311 = _T_310 ^ control_ff[2]; // @[exu_div_ctl.scala 819:23]
  wire  _T_314 = _T_299 == 38'h0; // @[exu_div_ctl.scala 819:82]
  wire  _T_315 = _T_305 & _T_314; // @[exu_div_ctl.scala 819:67]
  wire  _T_316 = _T_311 | _T_315; // @[exu_div_ctl.scala 819:43]
  wire [37:0] adder13_out = _T_295 + b_ff; // @[exu_div_ctl.scala 813:121]
  wire  _T_318 = ~adder13_out[37]; // @[exu_div_ctl.scala 820:6]
  wire  _T_319 = _T_318 ^ control_ff[2]; // @[exu_div_ctl.scala 820:23]
  wire  _T_322 = adder13_out == 38'h0; // @[exu_div_ctl.scala 820:82]
  wire  _T_323 = _T_305 & _T_322; // @[exu_div_ctl.scala 820:67]
  wire  _T_324 = _T_319 | _T_323; // @[exu_div_ctl.scala 820:43]
  wire  _T_326 = ~_T_295[37]; // @[exu_div_ctl.scala 821:6]
  wire  _T_327 = _T_326 ^ control_ff[2]; // @[exu_div_ctl.scala 821:23]
  wire  _T_330 = _T_295 == 38'h0; // @[exu_div_ctl.scala 821:82]
  wire  _T_331 = _T_305 & _T_330; // @[exu_div_ctl.scala 821:67]
  wire  _T_332 = _T_327 | _T_331; // @[exu_div_ctl.scala 821:43]
  wire [37:0] _T_239 = _T_291 + _T_297; // @[exu_div_ctl.scala 811:94]
  wire [37:0] adder11_out = _T_239 + b_ff; // @[exu_div_ctl.scala 811:116]
  wire  _T_334 = ~adder11_out[37]; // @[exu_div_ctl.scala 822:6]
  wire  _T_335 = _T_334 ^ control_ff[2]; // @[exu_div_ctl.scala 822:23]
  wire  _T_338 = adder11_out == 38'h0; // @[exu_div_ctl.scala 822:82]
  wire  _T_339 = _T_305 & _T_338; // @[exu_div_ctl.scala 822:67]
  wire  _T_340 = _T_335 | _T_339; // @[exu_div_ctl.scala 822:43]
  wire  _T_342 = ~_T_239[37]; // @[exu_div_ctl.scala 823:6]
  wire  _T_343 = _T_342 ^ control_ff[2]; // @[exu_div_ctl.scala 823:23]
  wire  _T_346 = _T_239 == 38'h0; // @[exu_div_ctl.scala 823:82]
  wire  _T_347 = _T_305 & _T_346; // @[exu_div_ctl.scala 823:67]
  wire  _T_348 = _T_343 | _T_347; // @[exu_div_ctl.scala 823:43]
  wire [37:0] adder9_out = _T_291 + b_ff; // @[exu_div_ctl.scala 809:94]
  wire  _T_350 = ~adder9_out[37]; // @[exu_div_ctl.scala 824:6]
  wire  _T_351 = _T_350 ^ control_ff[2]; // @[exu_div_ctl.scala 824:22]
  wire  _T_354 = adder9_out == 38'h0; // @[exu_div_ctl.scala 824:80]
  wire  _T_355 = _T_305 & _T_354; // @[exu_div_ctl.scala 824:66]
  wire  _T_356 = _T_351 | _T_355; // @[exu_div_ctl.scala 824:42]
  wire  _T_358 = ~_T_291[37]; // @[exu_div_ctl.scala 825:6]
  wire  _T_359 = _T_358 ^ control_ff[2]; // @[exu_div_ctl.scala 825:22]
  wire  _T_362 = _T_291 == 38'h0; // @[exu_div_ctl.scala 825:80]
  wire  _T_363 = _T_305 & _T_362; // @[exu_div_ctl.scala 825:66]
  wire  _T_364 = _T_359 | _T_363; // @[exu_div_ctl.scala 825:42]
  wire [37:0] _T_191 = _T_287 + _T_293; // @[exu_div_ctl.scala 807:67]
  wire [37:0] _T_195 = _T_191 + _T_297; // @[exu_div_ctl.scala 807:94]
  wire [37:0] adder7_out = _T_195 + b_ff; // @[exu_div_ctl.scala 807:116]
  wire  _T_366 = ~adder7_out[37]; // @[exu_div_ctl.scala 826:6]
  wire  _T_367 = _T_366 ^ control_ff[2]; // @[exu_div_ctl.scala 826:22]
  wire  _T_370 = adder7_out == 38'h0; // @[exu_div_ctl.scala 826:80]
  wire  _T_371 = _T_305 & _T_370; // @[exu_div_ctl.scala 826:66]
  wire  _T_372 = _T_367 | _T_371; // @[exu_div_ctl.scala 826:42]
  wire  _T_374 = ~_T_195[37]; // @[exu_div_ctl.scala 827:6]
  wire  _T_375 = _T_374 ^ control_ff[2]; // @[exu_div_ctl.scala 827:22]
  wire  _T_378 = _T_195 == 38'h0; // @[exu_div_ctl.scala 827:80]
  wire  _T_379 = _T_305 & _T_378; // @[exu_div_ctl.scala 827:66]
  wire  _T_380 = _T_375 | _T_379; // @[exu_div_ctl.scala 827:42]
  wire [37:0] adder5_out = _T_191 + b_ff; // @[exu_div_ctl.scala 805:94]
  wire  _T_382 = ~adder5_out[37]; // @[exu_div_ctl.scala 828:6]
  wire  _T_383 = _T_382 ^ control_ff[2]; // @[exu_div_ctl.scala 828:22]
  wire  _T_386 = adder5_out == 38'h0; // @[exu_div_ctl.scala 828:80]
  wire  _T_387 = _T_305 & _T_386; // @[exu_div_ctl.scala 828:66]
  wire  _T_388 = _T_383 | _T_387; // @[exu_div_ctl.scala 828:42]
  wire  _T_390 = ~_T_191[37]; // @[exu_div_ctl.scala 829:6]
  wire  _T_391 = _T_390 ^ control_ff[2]; // @[exu_div_ctl.scala 829:22]
  wire  _T_394 = _T_191 == 38'h0; // @[exu_div_ctl.scala 829:80]
  wire  _T_395 = _T_305 & _T_394; // @[exu_div_ctl.scala 829:66]
  wire  _T_396 = _T_391 | _T_395; // @[exu_div_ctl.scala 829:42]
  wire [36:0] _T_146 = {r_ff,a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [36:0] _T_148 = {b_ff[35:0],1'h0}; // @[Cat.scala 29:58]
  wire [36:0] _T_150 = _T_146 + _T_148; // @[exu_div_ctl.scala 803:58]
  wire [36:0] adder3_out = _T_150 + b_ff[36:0]; // @[exu_div_ctl.scala 803:80]
  wire  _T_398 = ~adder3_out[36]; // @[exu_div_ctl.scala 830:6]
  wire  _T_399 = _T_398 ^ control_ff[2]; // @[exu_div_ctl.scala 830:22]
  wire  _T_402 = adder3_out == 37'h0; // @[exu_div_ctl.scala 830:80]
  wire  _T_403 = _T_305 & _T_402; // @[exu_div_ctl.scala 830:66]
  wire  _T_404 = _T_399 | _T_403; // @[exu_div_ctl.scala 830:42]
  wire [35:0] _T_140 = {r_ff[31:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [35:0] _T_142 = {b_ff[34:0],1'h0}; // @[Cat.scala 29:58]
  wire [35:0] adder2_out = _T_140 + _T_142; // @[exu_div_ctl.scala 802:58]
  wire  _T_406 = ~adder2_out[35]; // @[exu_div_ctl.scala 831:6]
  wire  _T_407 = _T_406 ^ control_ff[2]; // @[exu_div_ctl.scala 831:22]
  wire  _T_410 = adder2_out == 36'h0; // @[exu_div_ctl.scala 831:80]
  wire  _T_411 = _T_305 & _T_410; // @[exu_div_ctl.scala 831:66]
  wire  _T_412 = _T_407 | _T_411; // @[exu_div_ctl.scala 831:42]
  wire [34:0] _T_135 = {r_ff[30:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [34:0] adder1_out = _T_135 + b_ff[34:0]; // @[exu_div_ctl.scala 801:58]
  wire  _T_414 = ~adder1_out[34]; // @[exu_div_ctl.scala 832:6]
  wire  _T_415 = _T_414 ^ control_ff[2]; // @[exu_div_ctl.scala 832:22]
  wire  _T_418 = adder1_out == 35'h0; // @[exu_div_ctl.scala 832:80]
  wire  _T_419 = _T_305 & _T_418; // @[exu_div_ctl.scala 832:66]
  wire  _T_420 = _T_415 | _T_419; // @[exu_div_ctl.scala 832:42]
  wire [7:0] _T_427 = {_T_372,_T_380,_T_388,_T_396,_T_404,_T_412,_T_420,1'h0}; // @[Cat.scala 29:58]
  wire [15:0] quotient_raw = {_T_308,_T_316,_T_324,_T_332,_T_340,_T_348,_T_356,_T_364,_T_427}; // @[Cat.scala 29:58]
  wire  _T_439 = quotient_raw[15:8] == 8'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_444 = quotient_raw[15:9] == 7'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_477 = _T_439 | _T_444; // @[Mux.scala 27:72]
  wire  _T_449 = quotient_raw[15:10] == 6'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_478 = _T_477 | _T_449; // @[Mux.scala 27:72]
  wire  _T_454 = quotient_raw[15:11] == 5'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_479 = _T_478 | _T_454; // @[Mux.scala 27:72]
  wire  _T_459 = quotient_raw[15:12] == 4'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_480 = _T_479 | _T_459; // @[Mux.scala 27:72]
  wire  _T_464 = quotient_raw[15:13] == 3'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_481 = _T_480 | _T_464; // @[Mux.scala 27:72]
  wire  _T_468 = quotient_raw[15:14] == 2'h1; // @[exu_div_ctl.scala 835:49]
  wire  _T_482 = _T_481 | _T_468; // @[Mux.scala 27:72]
  wire  _T_486 = _T_482 | quotient_raw[15]; // @[exu_div_ctl.scala 835:94]
  wire  _T_488 = quotient_raw[15:4] == 12'h1; // @[exu_div_ctl.scala 836:40]
  wire  _T_490 = quotient_raw[15:5] == 11'h1; // @[exu_div_ctl.scala 836:98]
  wire  _T_511 = _T_488 | _T_490; // @[Mux.scala 27:72]
  wire  _T_492 = quotient_raw[15:6] == 10'h1; // @[exu_div_ctl.scala 836:155]
  wire  _T_512 = _T_511 | _T_492; // @[Mux.scala 27:72]
  wire  _T_494 = quotient_raw[15:7] == 9'h1; // @[exu_div_ctl.scala 836:211]
  wire  _T_513 = _T_512 | _T_494; // @[Mux.scala 27:72]
  wire  _T_514 = _T_513 | _T_459; // @[Mux.scala 27:72]
  wire  _T_515 = _T_514 | _T_464; // @[Mux.scala 27:72]
  wire  _T_516 = _T_515 | _T_468; // @[Mux.scala 27:72]
  wire  _T_517 = _T_516 | quotient_raw[15]; // @[Mux.scala 27:72]
  wire  _T_520 = quotient_raw[15:2] == 14'h1; // @[exu_div_ctl.scala 838:37]
  wire  _T_522 = quotient_raw[15:3] == 13'h1; // @[exu_div_ctl.scala 838:97]
  wire  _T_543 = _T_520 | _T_522; // @[Mux.scala 27:72]
  wire  _T_544 = _T_543 | _T_492; // @[Mux.scala 27:72]
  wire  _T_545 = _T_544 | _T_494; // @[Mux.scala 27:72]
  wire  _T_546 = _T_545 | _T_449; // @[Mux.scala 27:72]
  wire  _T_547 = _T_546 | _T_454; // @[Mux.scala 27:72]
  wire  _T_548 = _T_547 | _T_468; // @[Mux.scala 27:72]
  wire  _T_549 = _T_548 | quotient_raw[15]; // @[Mux.scala 27:72]
  wire  _T_554 = quotient_raw[15:1] == 15'h1; // @[exu_div_ctl.scala 840:54]
  wire  _T_593 = _T_554 | _T_522; // @[Mux.scala 27:72]
  wire  _T_594 = _T_593 | _T_490; // @[Mux.scala 27:72]
  wire  _T_595 = _T_594 | _T_494; // @[Mux.scala 27:72]
  wire  _T_596 = _T_595 | _T_444; // @[Mux.scala 27:72]
  wire  _T_597 = _T_596 | _T_454; // @[Mux.scala 27:72]
  wire  _T_598 = _T_597 | _T_464; // @[Mux.scala 27:72]
  wire  _T_602 = _T_598 | quotient_raw[15]; // @[exu_div_ctl.scala 840:99]
  wire [3:0] quotient_new = {_T_486,_T_517,_T_549,_T_602}; // @[Cat.scala 29:58]
  wire  _T_85 = quotient_new == 4'h0; // @[exu_div_ctl.scala 800:80]
  wire  _T_86 = running_state & _T_85; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_0 = _T_86 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_88 = quotient_new == 4'h1; // @[exu_div_ctl.scala 800:80]
  wire  _T_89 = running_state & _T_88; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_1 = _T_89 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_91 = quotient_new == 4'h2; // @[exu_div_ctl.scala 800:80]
  wire  _T_92 = running_state & _T_91; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_2 = _T_92 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_94 = quotient_new == 4'h3; // @[exu_div_ctl.scala 800:80]
  wire  _T_95 = running_state & _T_94; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_3 = _T_95 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_97 = quotient_new == 4'h4; // @[exu_div_ctl.scala 800:80]
  wire  _T_98 = running_state & _T_97; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_4 = _T_98 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_100 = quotient_new == 4'h5; // @[exu_div_ctl.scala 800:80]
  wire  _T_101 = running_state & _T_100; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_5 = _T_101 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_103 = quotient_new == 4'h6; // @[exu_div_ctl.scala 800:80]
  wire  _T_104 = running_state & _T_103; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_6 = _T_104 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_106 = quotient_new == 4'h7; // @[exu_div_ctl.scala 800:80]
  wire  _T_107 = running_state & _T_106; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_7 = _T_107 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_109 = quotient_new == 4'h8; // @[exu_div_ctl.scala 800:80]
  wire  _T_110 = running_state & _T_109; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_8 = _T_110 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_112 = quotient_new == 4'h9; // @[exu_div_ctl.scala 800:80]
  wire  _T_113 = running_state & _T_112; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_9 = _T_113 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_115 = quotient_new == 4'ha; // @[exu_div_ctl.scala 800:80]
  wire  _T_116 = running_state & _T_115; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_10 = _T_116 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_118 = quotient_new == 4'hb; // @[exu_div_ctl.scala 800:80]
  wire  _T_119 = running_state & _T_118; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_11 = _T_119 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_121 = quotient_new == 4'hc; // @[exu_div_ctl.scala 800:80]
  wire  _T_122 = running_state & _T_121; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_12 = _T_122 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_124 = quotient_new == 4'hd; // @[exu_div_ctl.scala 800:80]
  wire  _T_125 = running_state & _T_124; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_13 = _T_125 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_127 = quotient_new == 4'he; // @[exu_div_ctl.scala 800:80]
  wire  _T_128 = running_state & _T_127; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_14 = _T_128 & _T_66; // @[exu_div_ctl.scala 800:94]
  wire  _T_130 = quotient_new == 4'hf; // @[exu_div_ctl.scala 800:80]
  wire  _T_131 = running_state & _T_130; // @[exu_div_ctl.scala 800:64]
  wire  r_adder_sel_15 = _T_131 & _T_66; // @[exu_div_ctl.scala 800:94]
  reg [31:0] q_ff; // @[Reg.scala 27:20]
  wire [31:0] _T_607 = twos_comp_q_sel ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_608 = b_twos_comp ? b_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] twos_comp_in = _T_607 | _T_608; // @[Mux.scala 27:72]
  wire  _T_612 = |twos_comp_in[0]; // @[lib.scala 661:35]
  wire  _T_614 = ~twos_comp_in[1]; // @[lib.scala 661:40]
  wire  _T_616 = _T_612 ? _T_614 : twos_comp_in[1]; // @[lib.scala 661:23]
  wire  _T_618 = |twos_comp_in[1:0]; // @[lib.scala 661:35]
  wire  _T_620 = ~twos_comp_in[2]; // @[lib.scala 661:40]
  wire  _T_622 = _T_618 ? _T_620 : twos_comp_in[2]; // @[lib.scala 661:23]
  wire  _T_624 = |twos_comp_in[2:0]; // @[lib.scala 661:35]
  wire  _T_626 = ~twos_comp_in[3]; // @[lib.scala 661:40]
  wire  _T_628 = _T_624 ? _T_626 : twos_comp_in[3]; // @[lib.scala 661:23]
  wire  _T_630 = |twos_comp_in[3:0]; // @[lib.scala 661:35]
  wire  _T_632 = ~twos_comp_in[4]; // @[lib.scala 661:40]
  wire  _T_634 = _T_630 ? _T_632 : twos_comp_in[4]; // @[lib.scala 661:23]
  wire  _T_636 = |twos_comp_in[4:0]; // @[lib.scala 661:35]
  wire  _T_638 = ~twos_comp_in[5]; // @[lib.scala 661:40]
  wire  _T_640 = _T_636 ? _T_638 : twos_comp_in[5]; // @[lib.scala 661:23]
  wire  _T_642 = |twos_comp_in[5:0]; // @[lib.scala 661:35]
  wire  _T_644 = ~twos_comp_in[6]; // @[lib.scala 661:40]
  wire  _T_646 = _T_642 ? _T_644 : twos_comp_in[6]; // @[lib.scala 661:23]
  wire  _T_648 = |twos_comp_in[6:0]; // @[lib.scala 661:35]
  wire  _T_650 = ~twos_comp_in[7]; // @[lib.scala 661:40]
  wire  _T_652 = _T_648 ? _T_650 : twos_comp_in[7]; // @[lib.scala 661:23]
  wire  _T_654 = |twos_comp_in[7:0]; // @[lib.scala 661:35]
  wire  _T_656 = ~twos_comp_in[8]; // @[lib.scala 661:40]
  wire  _T_658 = _T_654 ? _T_656 : twos_comp_in[8]; // @[lib.scala 661:23]
  wire  _T_660 = |twos_comp_in[8:0]; // @[lib.scala 661:35]
  wire  _T_662 = ~twos_comp_in[9]; // @[lib.scala 661:40]
  wire  _T_664 = _T_660 ? _T_662 : twos_comp_in[9]; // @[lib.scala 661:23]
  wire  _T_666 = |twos_comp_in[9:0]; // @[lib.scala 661:35]
  wire  _T_668 = ~twos_comp_in[10]; // @[lib.scala 661:40]
  wire  _T_670 = _T_666 ? _T_668 : twos_comp_in[10]; // @[lib.scala 661:23]
  wire  _T_672 = |twos_comp_in[10:0]; // @[lib.scala 661:35]
  wire  _T_674 = ~twos_comp_in[11]; // @[lib.scala 661:40]
  wire  _T_676 = _T_672 ? _T_674 : twos_comp_in[11]; // @[lib.scala 661:23]
  wire  _T_678 = |twos_comp_in[11:0]; // @[lib.scala 661:35]
  wire  _T_680 = ~twos_comp_in[12]; // @[lib.scala 661:40]
  wire  _T_682 = _T_678 ? _T_680 : twos_comp_in[12]; // @[lib.scala 661:23]
  wire  _T_684 = |twos_comp_in[12:0]; // @[lib.scala 661:35]
  wire  _T_686 = ~twos_comp_in[13]; // @[lib.scala 661:40]
  wire  _T_688 = _T_684 ? _T_686 : twos_comp_in[13]; // @[lib.scala 661:23]
  wire  _T_690 = |twos_comp_in[13:0]; // @[lib.scala 661:35]
  wire  _T_692 = ~twos_comp_in[14]; // @[lib.scala 661:40]
  wire  _T_694 = _T_690 ? _T_692 : twos_comp_in[14]; // @[lib.scala 661:23]
  wire  _T_696 = |twos_comp_in[14:0]; // @[lib.scala 661:35]
  wire  _T_698 = ~twos_comp_in[15]; // @[lib.scala 661:40]
  wire  _T_700 = _T_696 ? _T_698 : twos_comp_in[15]; // @[lib.scala 661:23]
  wire  _T_702 = |twos_comp_in[15:0]; // @[lib.scala 661:35]
  wire  _T_704 = ~twos_comp_in[16]; // @[lib.scala 661:40]
  wire  _T_706 = _T_702 ? _T_704 : twos_comp_in[16]; // @[lib.scala 661:23]
  wire  _T_708 = |twos_comp_in[16:0]; // @[lib.scala 661:35]
  wire  _T_710 = ~twos_comp_in[17]; // @[lib.scala 661:40]
  wire  _T_712 = _T_708 ? _T_710 : twos_comp_in[17]; // @[lib.scala 661:23]
  wire  _T_714 = |twos_comp_in[17:0]; // @[lib.scala 661:35]
  wire  _T_716 = ~twos_comp_in[18]; // @[lib.scala 661:40]
  wire  _T_718 = _T_714 ? _T_716 : twos_comp_in[18]; // @[lib.scala 661:23]
  wire  _T_720 = |twos_comp_in[18:0]; // @[lib.scala 661:35]
  wire  _T_722 = ~twos_comp_in[19]; // @[lib.scala 661:40]
  wire  _T_724 = _T_720 ? _T_722 : twos_comp_in[19]; // @[lib.scala 661:23]
  wire  _T_726 = |twos_comp_in[19:0]; // @[lib.scala 661:35]
  wire  _T_728 = ~twos_comp_in[20]; // @[lib.scala 661:40]
  wire  _T_730 = _T_726 ? _T_728 : twos_comp_in[20]; // @[lib.scala 661:23]
  wire  _T_732 = |twos_comp_in[20:0]; // @[lib.scala 661:35]
  wire  _T_734 = ~twos_comp_in[21]; // @[lib.scala 661:40]
  wire  _T_736 = _T_732 ? _T_734 : twos_comp_in[21]; // @[lib.scala 661:23]
  wire  _T_738 = |twos_comp_in[21:0]; // @[lib.scala 661:35]
  wire  _T_740 = ~twos_comp_in[22]; // @[lib.scala 661:40]
  wire  _T_742 = _T_738 ? _T_740 : twos_comp_in[22]; // @[lib.scala 661:23]
  wire  _T_744 = |twos_comp_in[22:0]; // @[lib.scala 661:35]
  wire  _T_746 = ~twos_comp_in[23]; // @[lib.scala 661:40]
  wire  _T_748 = _T_744 ? _T_746 : twos_comp_in[23]; // @[lib.scala 661:23]
  wire  _T_750 = |twos_comp_in[23:0]; // @[lib.scala 661:35]
  wire  _T_752 = ~twos_comp_in[24]; // @[lib.scala 661:40]
  wire  _T_754 = _T_750 ? _T_752 : twos_comp_in[24]; // @[lib.scala 661:23]
  wire  _T_756 = |twos_comp_in[24:0]; // @[lib.scala 661:35]
  wire  _T_758 = ~twos_comp_in[25]; // @[lib.scala 661:40]
  wire  _T_760 = _T_756 ? _T_758 : twos_comp_in[25]; // @[lib.scala 661:23]
  wire  _T_762 = |twos_comp_in[25:0]; // @[lib.scala 661:35]
  wire  _T_764 = ~twos_comp_in[26]; // @[lib.scala 661:40]
  wire  _T_766 = _T_762 ? _T_764 : twos_comp_in[26]; // @[lib.scala 661:23]
  wire  _T_768 = |twos_comp_in[26:0]; // @[lib.scala 661:35]
  wire  _T_770 = ~twos_comp_in[27]; // @[lib.scala 661:40]
  wire  _T_772 = _T_768 ? _T_770 : twos_comp_in[27]; // @[lib.scala 661:23]
  wire  _T_774 = |twos_comp_in[27:0]; // @[lib.scala 661:35]
  wire  _T_776 = ~twos_comp_in[28]; // @[lib.scala 661:40]
  wire  _T_778 = _T_774 ? _T_776 : twos_comp_in[28]; // @[lib.scala 661:23]
  wire  _T_780 = |twos_comp_in[28:0]; // @[lib.scala 661:35]
  wire  _T_782 = ~twos_comp_in[29]; // @[lib.scala 661:40]
  wire  _T_784 = _T_780 ? _T_782 : twos_comp_in[29]; // @[lib.scala 661:23]
  wire  _T_786 = |twos_comp_in[29:0]; // @[lib.scala 661:35]
  wire  _T_788 = ~twos_comp_in[30]; // @[lib.scala 661:40]
  wire  _T_790 = _T_786 ? _T_788 : twos_comp_in[30]; // @[lib.scala 661:23]
  wire  _T_792 = |twos_comp_in[30:0]; // @[lib.scala 661:35]
  wire  _T_794 = ~twos_comp_in[31]; // @[lib.scala 661:40]
  wire  _T_796 = _T_792 ? _T_794 : twos_comp_in[31]; // @[lib.scala 661:23]
  wire [6:0] _T_802 = {_T_652,_T_646,_T_640,_T_634,_T_628,_T_622,_T_616}; // @[lib.scala 663:14]
  wire [14:0] _T_810 = {_T_700,_T_694,_T_688,_T_682,_T_676,_T_670,_T_664,_T_658,_T_802}; // @[lib.scala 663:14]
  wire [7:0] _T_817 = {_T_748,_T_742,_T_736,_T_730,_T_724,_T_718,_T_712,_T_706}; // @[lib.scala 663:14]
  wire [30:0] _T_826 = {_T_796,_T_790,_T_784,_T_778,_T_772,_T_766,_T_760,_T_754,_T_817,_T_810}; // @[lib.scala 663:14]
  wire [31:0] twos_comp_out = {_T_826,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire  _T_828 = ~a_shift; // @[exu_div_ctl.scala 847:6]
  wire  _T_830 = _T_828 & _T_66; // @[exu_div_ctl.scala 847:15]
  wire [31:0] _T_834 = {a_ff[27:0],4'h0}; // @[Cat.scala 29:58]
  wire [64:0] ar_shifted = _T_71[64:0]; // @[exu_div_ctl.scala 793:28]
  wire [31:0] _T_836 = _T_830 ? io_dividend_in : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_837 = a_shift ? _T_834 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_838 = shortq_enable_ff ? ar_shifted[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_839 = _T_836 | _T_837; // @[Mux.scala 27:72]
  wire [31:0] a_in = _T_839 | _T_838; // @[Mux.scala 27:72]
  wire  _T_841 = ~b_twos_comp; // @[exu_div_ctl.scala 852:5]
  wire  _T_843 = io_signed_in & io_divisor_in[31]; // @[exu_div_ctl.scala 852:63]
  wire [32:0] _T_845 = {_T_843,io_divisor_in}; // @[Cat.scala 29:58]
  wire  _T_846 = ~control_ff[1]; // @[exu_div_ctl.scala 853:50]
  wire [32:0] _T_848 = {_T_846,_T_826,twos_comp_in[0]}; // @[Cat.scala 29:58]
  wire [32:0] _T_849 = _T_841 ? _T_845 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_850 = b_twos_comp ? _T_848 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] b_in = _T_849 | _T_850; // @[Mux.scala 27:72]
  wire [32:0] _T_855 = {r_ff[28:0],a_ff[31:28]}; // @[Cat.scala 29:58]
  wire [32:0] _T_873 = {1'h0,a_ff}; // @[Cat.scala 29:58]
  wire [32:0] _T_874 = r_sign_sel ? 33'h1ffffffff : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_875 = r_adder_sel_0 ? _T_855 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_876 = r_adder_sel_1 ? adder1_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_877 = r_adder_sel_2 ? adder2_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_878 = r_adder_sel_3 ? adder3_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_879 = r_adder_sel_4 ? _T_191[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_880 = r_adder_sel_5 ? adder5_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_881 = r_adder_sel_6 ? _T_195[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_882 = r_adder_sel_7 ? adder7_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_883 = r_adder_sel_8 ? _T_291[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_884 = r_adder_sel_9 ? adder9_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_885 = r_adder_sel_10 ? _T_239[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_886 = r_adder_sel_11 ? adder11_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_887 = r_adder_sel_12 ? _T_295[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_888 = r_adder_sel_13 ? adder13_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_889 = r_adder_sel_14 ? _T_299[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_890 = r_adder_sel_15 ? adder15_out[32:0] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_891 = shortq_enable_ff ? ar_shifted[64:32] : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_892 = by_zero_case ? _T_873 : 33'h0; // @[Mux.scala 27:72]
  wire [32:0] _T_893 = _T_874 | _T_875; // @[Mux.scala 27:72]
  wire [32:0] _T_894 = _T_893 | _T_876; // @[Mux.scala 27:72]
  wire [32:0] _T_895 = _T_894 | _T_877; // @[Mux.scala 27:72]
  wire [32:0] _T_896 = _T_895 | _T_878; // @[Mux.scala 27:72]
  wire [32:0] _T_897 = _T_896 | _T_879; // @[Mux.scala 27:72]
  wire [32:0] _T_898 = _T_897 | _T_880; // @[Mux.scala 27:72]
  wire [32:0] _T_899 = _T_898 | _T_881; // @[Mux.scala 27:72]
  wire [32:0] _T_900 = _T_899 | _T_882; // @[Mux.scala 27:72]
  wire [32:0] _T_901 = _T_900 | _T_883; // @[Mux.scala 27:72]
  wire [32:0] _T_902 = _T_901 | _T_884; // @[Mux.scala 27:72]
  wire [32:0] _T_903 = _T_902 | _T_885; // @[Mux.scala 27:72]
  wire [32:0] _T_904 = _T_903 | _T_886; // @[Mux.scala 27:72]
  wire [32:0] _T_905 = _T_904 | _T_887; // @[Mux.scala 27:72]
  wire [32:0] _T_906 = _T_905 | _T_888; // @[Mux.scala 27:72]
  wire [32:0] _T_907 = _T_906 | _T_889; // @[Mux.scala 27:72]
  wire [32:0] _T_908 = _T_907 | _T_890; // @[Mux.scala 27:72]
  wire [32:0] _T_909 = _T_908 | _T_891; // @[Mux.scala 27:72]
  wire [32:0] r_in = _T_909 | _T_892; // @[Mux.scala 27:72]
  wire [31:0] _T_913 = {q_ff[27:0],_T_486,_T_517,_T_549,_T_602}; // @[Cat.scala 29:58]
  wire  _T_936 = ~b_ff[3]; // @[exu_div_ctl.scala 889:70]
  wire  _T_938 = ~b_ff[2]; // @[exu_div_ctl.scala 889:70]
  wire  _T_941 = _T_936 & _T_938; // @[exu_div_ctl.scala 889:95]
  wire  _T_940 = ~b_ff[1]; // @[exu_div_ctl.scala 889:70]
  wire  _T_942 = _T_941 & _T_940; // @[exu_div_ctl.scala 889:95]
  wire  _T_943 = a_ff[3] & _T_942; // @[exu_div_ctl.scala 890:11]
  wire  _T_950 = a_ff[3] & _T_941; // @[exu_div_ctl.scala 890:11]
  wire  _T_952 = ~b_ff[0]; // @[exu_div_ctl.scala 895:33]
  wire  _T_953 = _T_950 & _T_952; // @[exu_div_ctl.scala 895:31]
  wire  _T_963 = a_ff[2] & _T_942; // @[exu_div_ctl.scala 890:11]
  wire  _T_964 = _T_953 | _T_963; // @[exu_div_ctl.scala 895:42]
  wire  _T_967 = a_ff[3] & a_ff[2]; // @[exu_div_ctl.scala 888:95]
  wire  _T_973 = _T_967 & _T_941; // @[exu_div_ctl.scala 890:11]
  wire  _T_974 = _T_964 | _T_973; // @[exu_div_ctl.scala 895:75]
  wire  _T_981 = a_ff[2] & _T_941; // @[exu_div_ctl.scala 890:11]
  wire  _T_984 = _T_981 & _T_952; // @[exu_div_ctl.scala 897:31]
  wire  _T_994 = a_ff[1] & _T_942; // @[exu_div_ctl.scala 890:11]
  wire  _T_995 = _T_984 | _T_994; // @[exu_div_ctl.scala 897:42]
  wire  _T_1001 = _T_936 & _T_940; // @[exu_div_ctl.scala 889:95]
  wire  _T_1002 = a_ff[3] & _T_1001; // @[exu_div_ctl.scala 890:11]
  wire  _T_1005 = _T_1002 & _T_952; // @[exu_div_ctl.scala 897:106]
  wire  _T_1006 = _T_995 | _T_1005; // @[exu_div_ctl.scala 897:78]
  wire  _T_1009 = ~a_ff[2]; // @[exu_div_ctl.scala 888:70]
  wire  _T_1010 = a_ff[3] & _T_1009; // @[exu_div_ctl.scala 888:95]
  wire  _T_1018 = _T_941 & b_ff[1]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1019 = _T_1018 & b_ff[0]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1020 = _T_1010 & _T_1019; // @[exu_div_ctl.scala 890:11]
  wire  _T_1021 = _T_1006 | _T_1020; // @[exu_div_ctl.scala 897:117]
  wire  _T_1023 = ~a_ff[3]; // @[exu_div_ctl.scala 888:70]
  wire  _T_1026 = _T_1023 & a_ff[2]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1027 = _T_1026 & a_ff[1]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1033 = _T_1027 & _T_941; // @[exu_div_ctl.scala 890:11]
  wire  _T_1034 = _T_1021 | _T_1033; // @[exu_div_ctl.scala 898:44]
  wire  _T_1040 = _T_967 & _T_936; // @[exu_div_ctl.scala 890:11]
  wire  _T_1043 = _T_1040 & _T_952; // @[exu_div_ctl.scala 898:107]
  wire  _T_1044 = _T_1034 | _T_1043; // @[exu_div_ctl.scala 898:80]
  wire  _T_1053 = _T_936 & b_ff[2]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1054 = _T_1053 & _T_940; // @[exu_div_ctl.scala 889:95]
  wire  _T_1055 = _T_967 & _T_1054; // @[exu_div_ctl.scala 890:11]
  wire  _T_1056 = _T_1044 | _T_1055; // @[exu_div_ctl.scala 898:119]
  wire  _T_1059 = a_ff[3] & a_ff[1]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1065 = _T_1059 & _T_1001; // @[exu_div_ctl.scala 890:11]
  wire  _T_1066 = _T_1056 | _T_1065; // @[exu_div_ctl.scala 899:44]
  wire  _T_1071 = _T_967 & a_ff[1]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1076 = _T_1071 & _T_1053; // @[exu_div_ctl.scala 890:11]
  wire  _T_1077 = _T_1066 | _T_1076; // @[exu_div_ctl.scala 899:79]
  wire  _T_1081 = a_ff[2] & a_ff[1]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1082 = _T_1081 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1088 = _T_1082 & _T_1001; // @[exu_div_ctl.scala 890:11]
  wire  _T_1094 = _T_1010 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1099 = _T_936 & b_ff[1]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1100 = _T_1099 & b_ff[0]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1101 = _T_1094 & _T_1100; // @[exu_div_ctl.scala 890:11]
  wire  _T_1102 = _T_1088 | _T_1101; // @[exu_div_ctl.scala 901:45]
  wire  _T_1109 = a_ff[2] & _T_1001; // @[exu_div_ctl.scala 890:11]
  wire  _T_1112 = _T_1109 & _T_952; // @[exu_div_ctl.scala 901:114]
  wire  _T_1113 = _T_1102 | _T_1112; // @[exu_div_ctl.scala 901:86]
  wire  _T_1120 = a_ff[1] & _T_941; // @[exu_div_ctl.scala 890:11]
  wire  _T_1123 = _T_1120 & _T_952; // @[exu_div_ctl.scala 902:33]
  wire  _T_1124 = _T_1113 | _T_1123; // @[exu_div_ctl.scala 901:129]
  wire  _T_1134 = a_ff[0] & _T_942; // @[exu_div_ctl.scala 890:11]
  wire  _T_1135 = _T_1124 | _T_1134; // @[exu_div_ctl.scala 902:47]
  wire  _T_1140 = ~a_ff[1]; // @[exu_div_ctl.scala 888:70]
  wire  _T_1142 = _T_1026 & _T_1140; // @[exu_div_ctl.scala 888:95]
  wire  _T_1152 = _T_1142 & _T_1019; // @[exu_div_ctl.scala 890:11]
  wire  _T_1153 = _T_1135 | _T_1152; // @[exu_div_ctl.scala 902:88]
  wire  _T_1162 = _T_1027 & _T_936; // @[exu_div_ctl.scala 890:11]
  wire  _T_1165 = _T_1162 & _T_952; // @[exu_div_ctl.scala 903:36]
  wire  _T_1166 = _T_1153 | _T_1165; // @[exu_div_ctl.scala 902:131]
  wire  _T_1172 = _T_938 & _T_940; // @[exu_div_ctl.scala 889:95]
  wire  _T_1173 = a_ff[3] & _T_1172; // @[exu_div_ctl.scala 890:11]
  wire  _T_1176 = _T_1173 & _T_952; // @[exu_div_ctl.scala 903:76]
  wire  _T_1177 = _T_1166 | _T_1176; // @[exu_div_ctl.scala 903:47]
  wire  _T_1187 = _T_1053 & b_ff[1]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1188 = _T_1010 & _T_1187; // @[exu_div_ctl.scala 890:11]
  wire  _T_1189 = _T_1177 | _T_1188; // @[exu_div_ctl.scala 903:88]
  wire  _T_1203 = _T_1027 & _T_1054; // @[exu_div_ctl.scala 890:11]
  wire  _T_1204 = _T_1189 | _T_1203; // @[exu_div_ctl.scala 903:131]
  wire  _T_1210 = _T_1026 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1216 = _T_1210 & _T_1001; // @[exu_div_ctl.scala 890:11]
  wire  _T_1217 = _T_1204 | _T_1216; // @[exu_div_ctl.scala 904:47]
  wire  _T_1224 = _T_1010 & _T_1140; // @[exu_div_ctl.scala 888:95]
  wire  _T_1230 = _T_1053 & b_ff[0]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1231 = _T_1224 & _T_1230; // @[exu_div_ctl.scala 890:11]
  wire  _T_1232 = _T_1217 | _T_1231; // @[exu_div_ctl.scala 904:88]
  wire  _T_1237 = _T_1009 & a_ff[1]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1238 = _T_1237 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1244 = _T_1238 & _T_941; // @[exu_div_ctl.scala 890:11]
  wire  _T_1245 = _T_1232 | _T_1244; // @[exu_div_ctl.scala 904:131]
  wire  _T_1251 = _T_967 & _T_940; // @[exu_div_ctl.scala 890:11]
  wire  _T_1254 = _T_1251 & _T_952; // @[exu_div_ctl.scala 905:75]
  wire  _T_1255 = _T_1245 | _T_1254; // @[exu_div_ctl.scala 905:47]
  wire  _T_1263 = _T_1027 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1268 = _T_1263 & _T_1053; // @[exu_div_ctl.scala 890:11]
  wire  _T_1269 = _T_1255 | _T_1268; // @[exu_div_ctl.scala 905:88]
  wire  _T_1276 = b_ff[3] & _T_938; // @[exu_div_ctl.scala 889:95]
  wire  _T_1277 = _T_967 & _T_1276; // @[exu_div_ctl.scala 890:11]
  wire  _T_1278 = _T_1269 | _T_1277; // @[exu_div_ctl.scala 905:131]
  wire  _T_1288 = _T_1276 & _T_940; // @[exu_div_ctl.scala 889:95]
  wire  _T_1289 = _T_1059 & _T_1288; // @[exu_div_ctl.scala 890:11]
  wire  _T_1290 = _T_1278 | _T_1289; // @[exu_div_ctl.scala 906:47]
  wire  _T_1293 = a_ff[3] & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1299 = _T_1293 & _T_1172; // @[exu_div_ctl.scala 890:11]
  wire  _T_1300 = _T_1290 | _T_1299; // @[exu_div_ctl.scala 906:88]
  wire  _T_1304 = a_ff[3] & _T_1140; // @[exu_div_ctl.scala 888:95]
  wire  _T_1312 = _T_1187 & b_ff[0]; // @[exu_div_ctl.scala 889:95]
  wire  _T_1313 = _T_1304 & _T_1312; // @[exu_div_ctl.scala 890:11]
  wire  _T_1314 = _T_1300 | _T_1313; // @[exu_div_ctl.scala 906:131]
  wire  _T_1321 = _T_1071 & b_ff[3]; // @[exu_div_ctl.scala 890:11]
  wire  _T_1324 = _T_1321 & _T_952; // @[exu_div_ctl.scala 907:77]
  wire  _T_1325 = _T_1314 | _T_1324; // @[exu_div_ctl.scala 907:47]
  wire  _T_1334 = b_ff[3] & _T_940; // @[exu_div_ctl.scala 889:95]
  wire  _T_1335 = _T_1071 & _T_1334; // @[exu_div_ctl.scala 890:11]
  wire  _T_1336 = _T_1325 | _T_1335; // @[exu_div_ctl.scala 907:88]
  wire  _T_1341 = _T_967 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1346 = _T_1341 & _T_1334; // @[exu_div_ctl.scala 890:11]
  wire  _T_1347 = _T_1336 | _T_1346; // @[exu_div_ctl.scala 907:131]
  wire  _T_1353 = _T_1010 & a_ff[1]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1358 = _T_1353 & _T_1099; // @[exu_div_ctl.scala 890:11]
  wire  _T_1359 = _T_1347 | _T_1358; // @[exu_div_ctl.scala 908:47]
  wire  _T_1364 = _T_1059 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1367 = _T_1364 & _T_938; // @[exu_div_ctl.scala 890:11]
  wire  _T_1368 = _T_1359 | _T_1367; // @[exu_div_ctl.scala 908:88]
  wire  _T_1375 = _T_1071 & a_ff[0]; // @[exu_div_ctl.scala 888:95]
  wire  _T_1377 = _T_1375 & b_ff[3]; // @[exu_div_ctl.scala 890:11]
  wire  _T_1378 = _T_1368 | _T_1377; // @[exu_div_ctl.scala 908:131]
  wire  _T_1384 = _T_1059 & _T_938; // @[exu_div_ctl.scala 890:11]
  wire  _T_1387 = _T_1384 & _T_952; // @[exu_div_ctl.scala 909:74]
  wire  _T_1388 = _T_1378 | _T_1387; // @[exu_div_ctl.scala 909:47]
  wire [31:0] _T_914 = {28'h0,_T_943,_T_974,_T_1077,_T_1388}; // @[Cat.scala 29:58]
  wire [31:0] _T_916 = _T_76 ? _T_913 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_917 = smallnum_case ? _T_914 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_918 = by_zero_case ? 32'hffffffff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_919 = _T_916 | _T_917; // @[Mux.scala 27:72]
  wire [31:0] q_in = _T_919 | _T_918; // @[Mux.scala 27:72]
  wire  _T_924 = ~twos_comp_q_sel; // @[exu_div_ctl.scala 883:16]
  wire  _T_925 = _T_30 & _T_924; // @[exu_div_ctl.scala 883:14]
  wire [31:0] _T_928 = _T_925 ? q_ff : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_929 = control_ff[0] ? r_ff[31:0] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_930 = twos_comp_q_sel ? twos_comp_out : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_931 = _T_928 | _T_929; // @[Mux.scala 27:72]
  wire  _T_1415 = shortq == 6'h1b; // @[exu_div_ctl.scala 925:64]
  wire  _T_1416 = shortq == 6'h1a; // @[exu_div_ctl.scala 925:64]
  wire  _T_1417 = shortq == 6'h19; // @[exu_div_ctl.scala 925:64]
  wire  _T_1418 = shortq == 6'h18; // @[exu_div_ctl.scala 925:64]
  wire  _T_1419 = shortq == 6'h17; // @[exu_div_ctl.scala 925:64]
  wire  _T_1420 = shortq == 6'h16; // @[exu_div_ctl.scala 925:64]
  wire  _T_1421 = shortq == 6'h15; // @[exu_div_ctl.scala 925:64]
  wire  _T_1422 = shortq == 6'h14; // @[exu_div_ctl.scala 925:64]
  wire  _T_1423 = shortq == 6'h13; // @[exu_div_ctl.scala 925:64]
  wire  _T_1424 = shortq == 6'h12; // @[exu_div_ctl.scala 925:64]
  wire  _T_1425 = shortq == 6'h11; // @[exu_div_ctl.scala 925:64]
  wire  _T_1426 = shortq == 6'h10; // @[exu_div_ctl.scala 925:64]
  wire  _T_1427 = shortq == 6'hf; // @[exu_div_ctl.scala 925:64]
  wire  _T_1428 = shortq == 6'he; // @[exu_div_ctl.scala 925:64]
  wire  _T_1429 = shortq == 6'hd; // @[exu_div_ctl.scala 925:64]
  wire  _T_1430 = shortq == 6'hc; // @[exu_div_ctl.scala 925:64]
  wire  _T_1431 = shortq == 6'hb; // @[exu_div_ctl.scala 925:64]
  wire  _T_1432 = shortq == 6'ha; // @[exu_div_ctl.scala 925:64]
  wire  _T_1433 = shortq == 6'h9; // @[exu_div_ctl.scala 925:64]
  wire  _T_1434 = shortq == 6'h8; // @[exu_div_ctl.scala 925:64]
  wire  _T_1435 = shortq == 6'h7; // @[exu_div_ctl.scala 925:64]
  wire  _T_1436 = shortq == 6'h6; // @[exu_div_ctl.scala 925:64]
  wire  _T_1437 = shortq == 6'h5; // @[exu_div_ctl.scala 925:64]
  wire  _T_1438 = shortq == 6'h4; // @[exu_div_ctl.scala 925:64]
  wire  _T_1439 = shortq == 6'h3; // @[exu_div_ctl.scala 925:64]
  wire  _T_1440 = shortq == 6'h2; // @[exu_div_ctl.scala 925:64]
  wire  _T_1441 = shortq == 6'h1; // @[exu_div_ctl.scala 925:64]
  wire  _T_1442 = shortq == 6'h0; // @[exu_div_ctl.scala 925:64]
  wire [2:0] _T_1447 = _T_1415 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1448 = _T_1416 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1449 = _T_1417 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1450 = _T_1418 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1451 = _T_1419 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1452 = _T_1420 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1453 = _T_1421 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1454 = _T_1422 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1455 = _T_1423 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1456 = _T_1424 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1457 = _T_1425 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1458 = _T_1426 ? 4'hc : 4'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1459 = _T_1427 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1460 = _T_1428 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1461 = _T_1429 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1462 = _T_1430 ? 5'h10 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1463 = _T_1431 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1464 = _T_1432 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1465 = _T_1433 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1466 = _T_1434 ? 5'h14 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1467 = _T_1435 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1468 = _T_1436 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1469 = _T_1437 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1470 = _T_1438 ? 5'h18 : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1471 = _T_1439 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1472 = _T_1440 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1473 = _T_1441 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1474 = _T_1442 ? 5'h1c : 5'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1479 = _T_1447 | _T_1448; // @[Mux.scala 27:72]
  wire [2:0] _T_1480 = _T_1479 | _T_1449; // @[Mux.scala 27:72]
  wire [2:0] _T_1481 = _T_1480 | _T_1450; // @[Mux.scala 27:72]
  wire [3:0] _GEN_12 = {{1'd0}, _T_1481}; // @[Mux.scala 27:72]
  wire [3:0] _T_1482 = _GEN_12 | _T_1451; // @[Mux.scala 27:72]
  wire [3:0] _T_1483 = _T_1482 | _T_1452; // @[Mux.scala 27:72]
  wire [3:0] _T_1484 = _T_1483 | _T_1453; // @[Mux.scala 27:72]
  wire [3:0] _T_1485 = _T_1484 | _T_1454; // @[Mux.scala 27:72]
  wire [3:0] _T_1486 = _T_1485 | _T_1455; // @[Mux.scala 27:72]
  wire [3:0] _T_1487 = _T_1486 | _T_1456; // @[Mux.scala 27:72]
  wire [3:0] _T_1488 = _T_1487 | _T_1457; // @[Mux.scala 27:72]
  wire [3:0] _T_1489 = _T_1488 | _T_1458; // @[Mux.scala 27:72]
  wire [4:0] _GEN_13 = {{1'd0}, _T_1489}; // @[Mux.scala 27:72]
  wire [4:0] _T_1490 = _GEN_13 | _T_1459; // @[Mux.scala 27:72]
  wire [4:0] _T_1491 = _T_1490 | _T_1460; // @[Mux.scala 27:72]
  wire [4:0] _T_1492 = _T_1491 | _T_1461; // @[Mux.scala 27:72]
  wire [4:0] _T_1493 = _T_1492 | _T_1462; // @[Mux.scala 27:72]
  wire [4:0] _T_1494 = _T_1493 | _T_1463; // @[Mux.scala 27:72]
  wire [4:0] _T_1495 = _T_1494 | _T_1464; // @[Mux.scala 27:72]
  wire [4:0] _T_1496 = _T_1495 | _T_1465; // @[Mux.scala 27:72]
  wire [4:0] _T_1497 = _T_1496 | _T_1466; // @[Mux.scala 27:72]
  wire [4:0] _T_1498 = _T_1497 | _T_1467; // @[Mux.scala 27:72]
  wire [4:0] _T_1499 = _T_1498 | _T_1468; // @[Mux.scala 27:72]
  wire [4:0] _T_1500 = _T_1499 | _T_1469; // @[Mux.scala 27:72]
  wire [4:0] _T_1501 = _T_1500 | _T_1470; // @[Mux.scala 27:72]
  wire [4:0] _T_1502 = _T_1501 | _T_1471; // @[Mux.scala 27:72]
  wire [4:0] _T_1503 = _T_1502 | _T_1472; // @[Mux.scala 27:72]
  wire [4:0] _T_1504 = _T_1503 | _T_1473; // @[Mux.scala 27:72]
  wire [4:0] shortq_decode = _T_1504 | _T_1474; // @[Mux.scala 27:72]
  exu_div_cls a_enc ( // @[exu_div_ctl.scala 913:31]
    .io_operand(a_enc_io_operand),
    .io_cls(a_enc_io_cls)
  );
  exu_div_cls b_enc ( // @[exu_div_ctl.scala 916:31]
    .io_operand(b_enc_io_operand),
    .io_cls(b_enc_io_cls)
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
  assign io_data_out = _T_931 | _T_930; // @[exu_div_ctl.scala 882:15]
  assign io_valid_out = finish_ff & _T; // @[exu_div_ctl.scala 881:16]
  assign a_enc_io_operand = {control_ff[2],a_ff}; // @[exu_div_ctl.scala 914:23]
  assign b_enc_io_operand = b_ff[32:0]; // @[exu_div_ctl.scala 917:23]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = _T_47 | finish_ff; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = io_valid_in | running_state; // @[lib.scala 407:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_8_io_en = io_valid_in | b_twos_comp; // @[lib.scala 407:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_9_io_en = _T_45 | running_state; // @[lib.scala 407:17]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_10_io_en = _T_45 | running_state; // @[lib.scala 407:17]
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
  control_ff = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  b_ff1 = _RAND_1[32:0];
  _RAND_2 = {1{`RANDOM}};
  valid_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  a_ff = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  count_ff = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  shortq_enable_ff = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  finish_ff = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  shortq_shift_ff = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  by_zero_case_ff = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  r_ff = _RAND_9[32:0];
  _RAND_10 = {1{`RANDOM}};
  q_ff = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    control_ff = 3'h0;
  end
  if (reset) begin
    b_ff1 = 33'h0;
  end
  if (reset) begin
    valid_ff = 1'h0;
  end
  if (reset) begin
    a_ff = 32'h0;
  end
  if (reset) begin
    count_ff = 7'h0;
  end
  if (reset) begin
    shortq_enable_ff = 1'h0;
  end
  if (reset) begin
    finish_ff = 1'h0;
  end
  if (reset) begin
    shortq_shift_ff = 5'h0;
  end
  if (reset) begin
    by_zero_case_ff = 1'h0;
  end
  if (reset) begin
    r_ff = 33'h0;
  end
  if (reset) begin
    q_ff = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      control_ff <= 3'h0;
    end else if (misc_enable) begin
      control_ff <= control_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      b_ff1 <= 33'h0;
    end else if (b_enable) begin
      b_ff1 <= b_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_ff <= 1'h0;
    end else if (misc_enable) begin
      valid_ff <= valid_ff_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      a_ff <= 32'h0;
    end else if (a_enable) begin
      a_ff <= a_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      count_ff <= 7'h0;
    end else if (misc_enable) begin
      count_ff <= count_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      shortq_enable_ff <= 1'h0;
    end else if (misc_enable) begin
      shortq_enable_ff <= shortq_enable;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      finish_ff <= 1'h0;
    end else if (misc_enable) begin
      finish_ff <= finish;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      shortq_shift_ff <= 5'h0;
    end else if (misc_enable) begin
      if (_T_58) begin
        shortq_shift_ff <= 5'h0;
      end else begin
        shortq_shift_ff <= shortq_decode;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      by_zero_case_ff <= 1'h0;
    end else if (misc_enable) begin
      by_zero_case_ff <= by_zero_case;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      r_ff <= 33'h0;
    end else if (rq_enable) begin
      r_ff <= r_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      q_ff <= 32'h0;
    end else if (rq_enable) begin
      q_ff <= q_in;
    end
  end
endmodule
module exu_div_ctl(
  input         clock,
  input         reset,
  input  [31:0] io_dividend,
  input  [31:0] io_divisor,
  output [31:0] io_exu_div_result,
  output        io_exu_div_wren,
  input         io_dec_div_div_p_valid,
  input         io_dec_div_div_p_bits_unsign,
  input         io_dec_div_div_p_bits_rem,
  input         io_dec_div_dec_div_cancel
);
  wire  exu_div_new_4bit_fullshortq_clock; // @[exu_div_ctl.scala 71:30]
  wire  exu_div_new_4bit_fullshortq_reset; // @[exu_div_ctl.scala 71:30]
  wire  exu_div_new_4bit_fullshortq_io_cancel; // @[exu_div_ctl.scala 71:30]
  wire  exu_div_new_4bit_fullshortq_io_valid_in; // @[exu_div_ctl.scala 71:30]
  wire  exu_div_new_4bit_fullshortq_io_signed_in; // @[exu_div_ctl.scala 71:30]
  wire  exu_div_new_4bit_fullshortq_io_rem_in; // @[exu_div_ctl.scala 71:30]
  wire [31:0] exu_div_new_4bit_fullshortq_io_dividend_in; // @[exu_div_ctl.scala 71:30]
  wire [31:0] exu_div_new_4bit_fullshortq_io_divisor_in; // @[exu_div_ctl.scala 71:30]
  wire [31:0] exu_div_new_4bit_fullshortq_io_data_out; // @[exu_div_ctl.scala 71:30]
  wire  exu_div_new_4bit_fullshortq_io_valid_out; // @[exu_div_ctl.scala 71:30]
  wire [31:0] _T_1 = io_exu_div_wren ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] out_raw = exu_div_new_4bit_fullshortq_io_data_out; // @[exu_div_ctl.scala 79:29]
  exu_div_new_4bit_fullshortq exu_div_new_4bit_fullshortq ( // @[exu_div_ctl.scala 71:30]
    .clock(exu_div_new_4bit_fullshortq_clock),
    .reset(exu_div_new_4bit_fullshortq_reset),
    .io_cancel(exu_div_new_4bit_fullshortq_io_cancel),
    .io_valid_in(exu_div_new_4bit_fullshortq_io_valid_in),
    .io_signed_in(exu_div_new_4bit_fullshortq_io_signed_in),
    .io_rem_in(exu_div_new_4bit_fullshortq_io_rem_in),
    .io_dividend_in(exu_div_new_4bit_fullshortq_io_dividend_in),
    .io_divisor_in(exu_div_new_4bit_fullshortq_io_divisor_in),
    .io_data_out(exu_div_new_4bit_fullshortq_io_data_out),
    .io_valid_out(exu_div_new_4bit_fullshortq_io_valid_out)
  );
  assign io_exu_div_result = _T_1 & out_raw; // @[exu_div_ctl.scala 21:21]
  assign io_exu_div_wren = exu_div_new_4bit_fullshortq_io_valid_out; // @[exu_div_ctl.scala 80:29]
  assign exu_div_new_4bit_fullshortq_clock = clock;
  assign exu_div_new_4bit_fullshortq_reset = reset;
  assign exu_div_new_4bit_fullshortq_io_cancel = io_dec_div_dec_div_cancel; // @[exu_div_ctl.scala 73:34]
  assign exu_div_new_4bit_fullshortq_io_valid_in = io_dec_div_div_p_valid; // @[exu_div_ctl.scala 74:34]
  assign exu_div_new_4bit_fullshortq_io_signed_in = ~io_dec_div_div_p_bits_unsign; // @[exu_div_ctl.scala 75:34]
  assign exu_div_new_4bit_fullshortq_io_rem_in = io_dec_div_div_p_bits_rem; // @[exu_div_ctl.scala 76:34]
  assign exu_div_new_4bit_fullshortq_io_dividend_in = io_dividend; // @[exu_div_ctl.scala 77:34]
  assign exu_div_new_4bit_fullshortq_io_divisor_in = io_divisor; // @[exu_div_ctl.scala 78:34]
endmodule
module exu(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dec_exu_dec_alu_dec_i0_alu_decode_d,
  input         io_dec_exu_dec_alu_dec_csr_ren_d,
  input  [11:0] io_dec_exu_dec_alu_dec_i0_br_immed_d,
  output [30:0] io_dec_exu_dec_alu_exu_i0_pc_x,
  input         io_dec_exu_dec_div_div_p_valid,
  input         io_dec_exu_dec_div_div_p_bits_unsign,
  input         io_dec_exu_dec_div_div_p_bits_rem,
  input         io_dec_exu_dec_div_dec_div_cancel,
  input  [1:0]  io_dec_exu_decode_exu_dec_data_en,
  input  [1:0]  io_dec_exu_decode_exu_dec_ctl_en,
  input         io_dec_exu_decode_exu_i0_ap_clz,
  input         io_dec_exu_decode_exu_i0_ap_ctz,
  input         io_dec_exu_decode_exu_i0_ap_pcnt,
  input         io_dec_exu_decode_exu_i0_ap_sext_b,
  input         io_dec_exu_decode_exu_i0_ap_sext_h,
  input         io_dec_exu_decode_exu_i0_ap_slo,
  input         io_dec_exu_decode_exu_i0_ap_sro,
  input         io_dec_exu_decode_exu_i0_ap_min,
  input         io_dec_exu_decode_exu_i0_ap_max,
  input         io_dec_exu_decode_exu_i0_ap_pack,
  input         io_dec_exu_decode_exu_i0_ap_packu,
  input         io_dec_exu_decode_exu_i0_ap_packh,
  input         io_dec_exu_decode_exu_i0_ap_rol,
  input         io_dec_exu_decode_exu_i0_ap_ror,
  input         io_dec_exu_decode_exu_i0_ap_grev,
  input         io_dec_exu_decode_exu_i0_ap_gorc,
  input         io_dec_exu_decode_exu_i0_ap_zbb,
  input         io_dec_exu_decode_exu_i0_ap_sbset,
  input         io_dec_exu_decode_exu_i0_ap_sbclr,
  input         io_dec_exu_decode_exu_i0_ap_sbinv,
  input         io_dec_exu_decode_exu_i0_ap_sbext,
  input         io_dec_exu_decode_exu_i0_ap_sh1add,
  input         io_dec_exu_decode_exu_i0_ap_sh2add,
  input         io_dec_exu_decode_exu_i0_ap_sh3add,
  input         io_dec_exu_decode_exu_i0_ap_zba,
  input         io_dec_exu_decode_exu_i0_ap_land,
  input         io_dec_exu_decode_exu_i0_ap_lor,
  input         io_dec_exu_decode_exu_i0_ap_lxor,
  input         io_dec_exu_decode_exu_i0_ap_sll,
  input         io_dec_exu_decode_exu_i0_ap_srl,
  input         io_dec_exu_decode_exu_i0_ap_sra,
  input         io_dec_exu_decode_exu_i0_ap_beq,
  input         io_dec_exu_decode_exu_i0_ap_bne,
  input         io_dec_exu_decode_exu_i0_ap_blt,
  input         io_dec_exu_decode_exu_i0_ap_bge,
  input         io_dec_exu_decode_exu_i0_ap_add,
  input         io_dec_exu_decode_exu_i0_ap_sub,
  input         io_dec_exu_decode_exu_i0_ap_slt,
  input         io_dec_exu_decode_exu_i0_ap_unsign,
  input         io_dec_exu_decode_exu_i0_ap_jal,
  input         io_dec_exu_decode_exu_i0_ap_predict_t,
  input         io_dec_exu_decode_exu_i0_ap_predict_nt,
  input         io_dec_exu_decode_exu_i0_ap_csr_write,
  input         io_dec_exu_decode_exu_i0_ap_csr_imm,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_valid,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_misp,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_ataken,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_boffset,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pc4,
  input  [1:0]  io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_hist,
  input  [11:0] io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_toffset,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_error,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_start_error,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pcall,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pja,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_way,
  input         io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pret,
  input  [30:0] io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_prett,
  input  [7:0]  io_dec_exu_decode_exu_i0_predict_fghr_d,
  input  [7:0]  io_dec_exu_decode_exu_i0_predict_index_d,
  input  [4:0]  io_dec_exu_decode_exu_i0_predict_btag_d,
  input         io_dec_exu_decode_exu_dec_i0_rs1_en_d,
  input         io_dec_exu_decode_exu_dec_i0_branch_d,
  input         io_dec_exu_decode_exu_dec_i0_rs2_en_d,
  input  [31:0] io_dec_exu_decode_exu_dec_i0_immed_d,
  input  [31:0] io_dec_exu_decode_exu_dec_i0_result_r,
  input         io_dec_exu_decode_exu_dec_qual_lsu_d,
  input         io_dec_exu_decode_exu_dec_i0_select_pc_d,
  input  [3:0]  io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d,
  input  [3:0]  io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d,
  input         io_dec_exu_decode_exu_mul_p_valid,
  input         io_dec_exu_decode_exu_mul_p_bits_rs1_sign,
  input         io_dec_exu_decode_exu_mul_p_bits_rs2_sign,
  input         io_dec_exu_decode_exu_mul_p_bits_low,
  input         io_dec_exu_decode_exu_mul_p_bits_bext,
  input         io_dec_exu_decode_exu_mul_p_bits_bdep,
  input         io_dec_exu_decode_exu_mul_p_bits_clmul,
  input         io_dec_exu_decode_exu_mul_p_bits_clmulh,
  input         io_dec_exu_decode_exu_mul_p_bits_clmulr,
  input         io_dec_exu_decode_exu_mul_p_bits_grev,
  input         io_dec_exu_decode_exu_mul_p_bits_gorc,
  input         io_dec_exu_decode_exu_mul_p_bits_shfl,
  input         io_dec_exu_decode_exu_mul_p_bits_unshfl,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32_b,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32_h,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32_w,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32c_b,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32c_h,
  input         io_dec_exu_decode_exu_mul_p_bits_crc32c_w,
  input         io_dec_exu_decode_exu_mul_p_bits_bfp,
  input  [30:0] io_dec_exu_decode_exu_pred_correct_npc_x,
  input         io_dec_exu_decode_exu_dec_extint_stall,
  output [31:0] io_dec_exu_decode_exu_exu_i0_result_x,
  output [31:0] io_dec_exu_decode_exu_exu_csr_rs1_x,
  input  [29:0] io_dec_exu_tlu_exu_dec_tlu_meihap,
  input         io_dec_exu_tlu_exu_dec_tlu_flush_lower_r,
  input  [30:0] io_dec_exu_tlu_exu_dec_tlu_flush_path_r,
  output [1:0]  io_dec_exu_tlu_exu_exu_i0_br_hist_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_error_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_start_error_r,
  output [7:0]  io_dec_exu_tlu_exu_exu_i0_br_index_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_valid_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_mp_r,
  output        io_dec_exu_tlu_exu_exu_i0_br_middle_r,
  output        io_dec_exu_tlu_exu_exu_pmu_i0_br_misp,
  output        io_dec_exu_tlu_exu_exu_pmu_i0_br_ataken,
  output        io_dec_exu_tlu_exu_exu_pmu_i0_pc4,
  output [30:0] io_dec_exu_tlu_exu_exu_npc_r,
  input  [30:0] io_dec_exu_ib_exu_dec_i0_pc_d,
  input         io_dec_exu_ib_exu_dec_debug_wdata_rs1_d,
  input  [31:0] io_dec_exu_gpr_exu_gpr_i0_rs1_d,
  input  [31:0] io_dec_exu_gpr_exu_gpr_i0_rs2_d,
  output [7:0]  io_exu_bp_exu_i0_br_index_r,
  output [7:0]  io_exu_bp_exu_i0_br_fghr_r,
  output        io_exu_bp_exu_i0_br_way_r,
  output        io_exu_bp_exu_mp_pkt_valid,
  output        io_exu_bp_exu_mp_pkt_bits_misp,
  output        io_exu_bp_exu_mp_pkt_bits_ataken,
  output        io_exu_bp_exu_mp_pkt_bits_boffset,
  output        io_exu_bp_exu_mp_pkt_bits_pc4,
  output [1:0]  io_exu_bp_exu_mp_pkt_bits_hist,
  output [11:0] io_exu_bp_exu_mp_pkt_bits_toffset,
  output        io_exu_bp_exu_mp_pkt_bits_br_error,
  output        io_exu_bp_exu_mp_pkt_bits_br_start_error,
  output        io_exu_bp_exu_mp_pkt_bits_pcall,
  output        io_exu_bp_exu_mp_pkt_bits_pja,
  output        io_exu_bp_exu_mp_pkt_bits_way,
  output        io_exu_bp_exu_mp_pkt_bits_pret,
  output [30:0] io_exu_bp_exu_mp_pkt_bits_prett,
  output [7:0]  io_exu_bp_exu_mp_eghr,
  output [7:0]  io_exu_bp_exu_mp_fghr,
  output [7:0]  io_exu_bp_exu_mp_index,
  output [4:0]  io_exu_bp_exu_mp_btag,
  output        io_exu_flush_final,
  output [31:0] io_exu_div_result,
  output        io_exu_div_wren,
  input  [31:0] io_dbg_cmd_wrdata,
  input  [31:0] io_dec_csr_rddata_d,
  output [31:0] io_lsu_exu_exu_lsu_rs1_d,
  output [31:0] io_lsu_exu_exu_lsu_rs2_d,
  input  [31:0] io_lsu_exu_lsu_result_m,
  input  [31:0] io_lsu_exu_lsu_nonblock_load_data,
  output [30:0] io_exu_flush_path_final
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
  wire  i_alu_clock; // @[exu.scala 129:19]
  wire  i_alu_reset; // @[exu.scala 129:19]
  wire  i_alu_io_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 129:19]
  wire  i_alu_io_dec_alu_dec_csr_ren_d; // @[exu.scala 129:19]
  wire [11:0] i_alu_io_dec_alu_dec_i0_br_immed_d; // @[exu.scala 129:19]
  wire [30:0] i_alu_io_dec_alu_exu_i0_pc_x; // @[exu.scala 129:19]
  wire [31:0] i_alu_io_csr_rddata_in; // @[exu.scala 129:19]
  wire [30:0] i_alu_io_dec_i0_pc_d; // @[exu.scala 129:19]
  wire  i_alu_io_flush_upper_x; // @[exu.scala 129:19]
  wire  i_alu_io_dec_tlu_flush_lower_r; // @[exu.scala 129:19]
  wire  i_alu_io_enable; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_clz; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_ctz; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_pcnt; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sext_b; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sext_h; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_min; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_max; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_pack; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_packu; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_packh; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_rol; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_ror; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_grev; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_gorc; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_zbb; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sbset; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sbclr; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sbinv; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sbext; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_land; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_lor; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_lxor; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sll; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_srl; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sra; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_beq; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_bne; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_blt; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_bge; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_add; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_sub; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_slt; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_unsign; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_jal; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_predict_t; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_predict_nt; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_csr_write; // @[exu.scala 129:19]
  wire  i_alu_io_i0_ap_csr_imm; // @[exu.scala 129:19]
  wire [31:0] i_alu_io_a_in; // @[exu.scala 129:19]
  wire [31:0] i_alu_io_b_in; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_valid; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_boffset; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_pc4; // @[exu.scala 129:19]
  wire [1:0] i_alu_io_pp_in_bits_hist; // @[exu.scala 129:19]
  wire [11:0] i_alu_io_pp_in_bits_toffset; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_br_error; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_br_start_error; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_pcall; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_pja; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_way; // @[exu.scala 129:19]
  wire  i_alu_io_pp_in_bits_pret; // @[exu.scala 129:19]
  wire [30:0] i_alu_io_pp_in_bits_prett; // @[exu.scala 129:19]
  wire [31:0] i_alu_io_result_ff; // @[exu.scala 129:19]
  wire  i_alu_io_flush_upper_out; // @[exu.scala 129:19]
  wire  i_alu_io_flush_final_out; // @[exu.scala 129:19]
  wire [30:0] i_alu_io_flush_path_out; // @[exu.scala 129:19]
  wire  i_alu_io_pred_correct_out; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_valid; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_misp; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_ataken; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_boffset; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_pc4; // @[exu.scala 129:19]
  wire [1:0] i_alu_io_predict_p_out_bits_hist; // @[exu.scala 129:19]
  wire [11:0] i_alu_io_predict_p_out_bits_toffset; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_br_error; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_br_start_error; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_pcall; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_pja; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_way; // @[exu.scala 129:19]
  wire  i_alu_io_predict_p_out_bits_pret; // @[exu.scala 129:19]
  wire  i_mul_clock; // @[exu.scala 149:21]
  wire  i_mul_reset; // @[exu.scala 149:21]
  wire  i_mul_io_mul_p_valid; // @[exu.scala 149:21]
  wire  i_mul_io_mul_p_bits_rs1_sign; // @[exu.scala 149:21]
  wire  i_mul_io_mul_p_bits_rs2_sign; // @[exu.scala 149:21]
  wire  i_mul_io_mul_p_bits_low; // @[exu.scala 149:21]
  wire [31:0] i_mul_io_rs1_in; // @[exu.scala 149:21]
  wire [31:0] i_mul_io_rs2_in; // @[exu.scala 149:21]
  wire [31:0] i_mul_io_result_x; // @[exu.scala 149:21]
  wire  i_div_clock; // @[exu.scala 157:21]
  wire  i_div_reset; // @[exu.scala 157:21]
  wire [31:0] i_div_io_dividend; // @[exu.scala 157:21]
  wire [31:0] i_div_io_divisor; // @[exu.scala 157:21]
  wire [31:0] i_div_io_exu_div_result; // @[exu.scala 157:21]
  wire  i_div_io_exu_div_wren; // @[exu.scala 157:21]
  wire  i_div_io_dec_div_div_p_valid; // @[exu.scala 157:21]
  wire  i_div_io_dec_div_div_p_bits_unsign; // @[exu.scala 157:21]
  wire  i_div_io_dec_div_div_p_bits_rem; // @[exu.scala 157:21]
  wire  i_div_io_dec_div_dec_div_cancel; // @[exu.scala 157:21]
  wire  x_data_en = io_dec_exu_decode_exu_dec_data_en[1]; // @[exu.scala 54:69]
  wire  x_data_en_q1 = x_data_en & io_dec_exu_dec_alu_dec_csr_ren_d; // @[exu.scala 55:73]
  wire  x_data_en_q2 = x_data_en & io_dec_exu_decode_exu_dec_i0_branch_d; // @[exu.scala 56:73]
  wire  r_data_en = io_dec_exu_decode_exu_dec_data_en[0]; // @[exu.scala 57:69]
  reg  i0_branch_x; // @[Reg.scala 27:20]
  wire  r_data_en_q2 = r_data_en & i0_branch_x; // @[exu.scala 58:73]
  wire  x_ctl_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[exu.scala 59:68]
  wire  r_ctl_en = io_dec_exu_decode_exu_dec_ctl_en[0]; // @[exu.scala 60:68]
  wire [20:0] predpipe_d = {io_dec_exu_decode_exu_i0_predict_fghr_d,io_dec_exu_decode_exu_i0_predict_index_d,io_dec_exu_decode_exu_i0_predict_btag_d}; // @[Cat.scala 29:58]
  reg [30:0] i0_flush_path_x; // @[Reg.scala 27:20]
  wire [30:0] i0_flush_path_d = i_alu_io_flush_path_out; // @[exu.scala 40:53 exu.scala 144:45]
  reg  i0_predict_p_x_valid; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_misp; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_ataken; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_boffset; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_pc4; // @[Reg.scala 27:20]
  reg [1:0] i0_predict_p_x_bits_hist; // @[Reg.scala 27:20]
  reg [11:0] i0_predict_p_x_bits_toffset; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_br_error; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_br_start_error; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_pcall; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_pja; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_way; // @[Reg.scala 27:20]
  reg  i0_predict_p_x_bits_pret; // @[Reg.scala 27:20]
  wire  i0_predict_p_d_bits_pret = i_alu_io_predict_p_out_bits_pret; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_way = i_alu_io_predict_p_out_bits_way; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_pja = i_alu_io_predict_p_out_bits_pja; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_pcall = i_alu_io_predict_p_out_bits_pcall; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_br_start_error = i_alu_io_predict_p_out_bits_br_start_error; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_br_error = i_alu_io_predict_p_out_bits_br_error; // @[exu.scala 41:53 exu.scala 146:45]
  wire [11:0] i0_predict_p_d_bits_toffset = i_alu_io_predict_p_out_bits_toffset; // @[exu.scala 41:53 exu.scala 146:45]
  wire [1:0] i0_predict_p_d_bits_hist = i_alu_io_predict_p_out_bits_hist; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_pc4 = i_alu_io_predict_p_out_bits_pc4; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_boffset = i_alu_io_predict_p_out_bits_boffset; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_ataken = i_alu_io_predict_p_out_bits_ataken; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_bits_misp = i_alu_io_predict_p_out_bits_misp; // @[exu.scala 41:53 exu.scala 146:45]
  wire  i0_predict_p_d_valid = i_alu_io_predict_p_out_valid; // @[exu.scala 41:53 exu.scala 146:45]
  reg [20:0] predpipe_x; // @[Reg.scala 27:20]
  reg [20:0] predpipe_r; // @[Reg.scala 27:20]
  reg [7:0] ghr_x; // @[Reg.scala 27:20]
  reg  i0_valid_x; // @[Reg.scala 27:20]
  reg  i0_taken_x; // @[Reg.scala 27:20]
  wire [7:0] _T_191 = {ghr_x[6:0],i0_taken_x}; // @[Cat.scala 29:58]
  reg  i0_pred_correct_upper_x; // @[Reg.scala 27:20]
  wire  i0_pred_correct_upper_d = i_alu_io_pred_correct_out; // @[exu.scala 46:41 exu.scala 147:27]
  reg  i0_flush_upper_x; // @[Reg.scala 27:20]
  wire  i0_flush_upper_d = i_alu_io_flush_upper_out; // @[exu.scala 47:45 exu.scala 143:35]
  wire  i0_taken_d = i0_predict_p_d_bits_ataken & io_dec_exu_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 175:59]
  wire  _T_169 = i0_predict_p_d_valid & io_dec_exu_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 174:54]
  wire  _T_170 = ~io_dec_exu_tlu_exu_dec_tlu_flush_lower_r; // @[exu.scala 174:97]
  wire  i0_valid_d = _T_169 & _T_170; // @[exu.scala 174:95]
  reg  i0_pp_r_valid; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_misp; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_ataken; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_boffset; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_pc4; // @[Reg.scala 27:20]
  reg [1:0] i0_pp_r_bits_hist; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_br_error; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_br_start_error; // @[Reg.scala 27:20]
  reg  i0_pp_r_bits_way; // @[Reg.scala 27:20]
  reg [5:0] pred_temp1; // @[Reg.scala 27:20]
  reg  i0_pred_correct_upper_r; // @[Reg.scala 27:20]
  reg [30:0] i0_flush_path_upper_r; // @[Reg.scala 27:20]
  reg [24:0] pred_temp2; // @[Reg.scala 27:20]
  wire [30:0] _T_31 = {pred_temp2,pred_temp1}; // @[Cat.scala 29:58]
  wire  _T_174 = _T_170 & i0_valid_d; // @[exu.scala 181:50]
  reg [7:0] ghr_d; // @[Reg.scala 27:20]
  wire [7:0] _T_177 = {ghr_d[6:0],i0_taken_d}; // @[Cat.scala 29:58]
  wire [7:0] _T_183 = _T_174 ? _T_177 : 8'h0; // @[Mux.scala 27:72]
  wire  _T_179 = ~i0_valid_d; // @[exu.scala 182:52]
  wire  _T_180 = _T_170 & _T_179; // @[exu.scala 182:50]
  wire [7:0] _T_184 = _T_180 ? ghr_d : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_186 = _T_183 | _T_184; // @[Mux.scala 27:72]
  wire [7:0] _T_185 = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r ? ghr_x : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] ghr_d_ns = _T_186 | _T_185; // @[Mux.scala 27:72]
  wire [7:0] _T_33 = ghr_d_ns ^ ghr_d; // @[lib.scala 448:21]
  wire  _T_34 = |_T_33; // @[lib.scala 448:29]
  reg  mul_valid_x; // @[Reg.scala 27:20]
  wire  _T_37 = io_dec_exu_decode_exu_mul_p_valid ^ mul_valid_x; // @[lib.scala 470:21]
  wire  _T_38 = |_T_37; // @[lib.scala 470:29]
  wire  _T_41 = io_dec_exu_decode_exu_dec_i0_branch_d ^ i0_branch_x; // @[lib.scala 448:21]
  wire  _T_42 = |_T_41; // @[lib.scala 448:29]
  wire  _T_46 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[0] | io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[1]; // @[exu.scala 82:84]
  wire  _T_48 = _T_46 | io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[2]; // @[exu.scala 82:134]
  wire  i0_rs1_bypass_en_d = _T_48 | io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[3]; // @[exu.scala 82:184]
  wire  _T_52 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[0] | io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[1]; // @[exu.scala 83:84]
  wire  _T_54 = _T_52 | io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[2]; // @[exu.scala 83:134]
  wire  i0_rs2_bypass_en_d = _T_54 | io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[3]; // @[exu.scala 83:184]
  wire [31:0] _T_64 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[0] ? io_dec_exu_decode_exu_dec_i0_result_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_65 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[1] ? io_lsu_exu_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_66 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[2] ? io_dec_exu_decode_exu_exu_i0_result_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_67 = io_dec_exu_decode_exu_dec_i0_rs1_bypass_en_d[3] ? io_lsu_exu_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_68 = _T_64 | _T_65; // @[Mux.scala 27:72]
  wire [31:0] _T_69 = _T_68 | _T_66; // @[Mux.scala 27:72]
  wire [31:0] i0_rs1_bypass_data_d = _T_69 | _T_67; // @[Mux.scala 27:72]
  wire [31:0] _T_79 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[0] ? io_dec_exu_decode_exu_dec_i0_result_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_80 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[1] ? io_lsu_exu_lsu_result_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_81 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[2] ? io_dec_exu_decode_exu_exu_i0_result_x : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_82 = io_dec_exu_decode_exu_dec_i0_rs2_bypass_en_d[3] ? io_lsu_exu_lsu_nonblock_load_data : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_83 = _T_79 | _T_80; // @[Mux.scala 27:72]
  wire [31:0] _T_84 = _T_83 | _T_81; // @[Mux.scala 27:72]
  wire [31:0] i0_rs2_bypass_data_d = _T_84 | _T_82; // @[Mux.scala 27:72]
  wire  _T_87 = ~i0_rs1_bypass_en_d; // @[exu.scala 100:6]
  wire  _T_88 = _T_87 & io_dec_exu_decode_exu_dec_i0_select_pc_d; // @[exu.scala 100:26]
  wire [31:0] _T_90 = {io_dec_exu_ib_exu_dec_i0_pc_d,1'h0}; // @[Cat.scala 29:58]
  wire  _T_92 = _T_87 & io_dec_exu_ib_exu_dec_debug_wdata_rs1_d; // @[exu.scala 101:26]
  wire  _T_95 = ~io_dec_exu_ib_exu_dec_debug_wdata_rs1_d; // @[exu.scala 102:28]
  wire  _T_96 = _T_87 & _T_95; // @[exu.scala 102:26]
  wire  _T_97 = _T_96 & io_dec_exu_decode_exu_dec_i0_rs1_en_d; // @[exu.scala 102:69]
  wire [31:0] _T_99 = i0_rs1_bypass_en_d ? i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_100 = _T_88 ? _T_90 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_101 = _T_92 ? io_dbg_cmd_wrdata : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_102 = _T_97 ? io_dec_exu_gpr_exu_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_103 = _T_99 | _T_100; // @[Mux.scala 27:72]
  wire [31:0] _T_104 = _T_103 | _T_101; // @[Mux.scala 27:72]
  wire [31:0] i0_rs1_d = _T_104 | _T_102; // @[Mux.scala 27:72]
  reg [31:0] _T_107; // @[Reg.scala 27:20]
  wire  _T_108 = ~i0_rs2_bypass_en_d; // @[exu.scala 107:6]
  wire  _T_109 = _T_108 & io_dec_exu_decode_exu_dec_i0_rs2_en_d; // @[exu.scala 107:26]
  wire [31:0] _T_114 = _T_109 ? io_dec_exu_gpr_exu_gpr_i0_rs2_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_115 = _T_108 ? io_dec_exu_decode_exu_dec_i0_immed_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_116 = i0_rs2_bypass_en_d ? i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_117 = _T_114 | _T_115; // @[Mux.scala 27:72]
  wire [31:0] _T_118 = _T_117 | _T_116; // @[Mux.scala 27:72]
  wire  _T_120 = ~io_dec_exu_decode_exu_dec_extint_stall; // @[exu.scala 114:28]
  wire  _T_121 = _T_87 & _T_120; // @[exu.scala 114:26]
  wire  _T_122 = _T_121 & io_dec_exu_decode_exu_dec_i0_rs1_en_d; // @[exu.scala 114:68]
  wire  _T_123 = _T_122 & io_dec_exu_decode_exu_dec_qual_lsu_d; // @[exu.scala 114:108]
  wire  _T_126 = i0_rs1_bypass_en_d & _T_120; // @[exu.scala 115:25]
  wire  _T_127 = _T_126 & io_dec_exu_decode_exu_dec_qual_lsu_d; // @[exu.scala 115:67]
  wire  _T_129 = io_dec_exu_decode_exu_dec_extint_stall & io_dec_exu_decode_exu_dec_qual_lsu_d; // @[exu.scala 116:45]
  wire [31:0] _T_131 = {io_dec_exu_tlu_exu_dec_tlu_meihap,2'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_132 = _T_123 ? io_dec_exu_gpr_exu_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_133 = _T_127 ? i0_rs1_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_134 = _T_129 ? _T_131 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_135 = _T_132 | _T_133; // @[Mux.scala 27:72]
  wire  _T_140 = _T_108 & _T_120; // @[exu.scala 120:26]
  wire  _T_141 = _T_140 & io_dec_exu_decode_exu_dec_i0_rs2_en_d; // @[exu.scala 120:68]
  wire  _T_142 = _T_141 & io_dec_exu_decode_exu_dec_qual_lsu_d; // @[exu.scala 120:108]
  wire  _T_145 = i0_rs2_bypass_en_d & _T_120; // @[exu.scala 121:25]
  wire  _T_146 = _T_145 & io_dec_exu_decode_exu_dec_qual_lsu_d; // @[exu.scala 121:67]
  wire [31:0] _T_148 = _T_142 ? io_dec_exu_gpr_exu_gpr_i0_rs2_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_149 = _T_146 ? i0_rs2_bypass_data_d : 32'h0; // @[Mux.scala 27:72]
  wire  _T_153 = _T_87 & io_dec_exu_decode_exu_dec_i0_rs1_en_d; // @[exu.scala 125:26]
  wire [31:0] _T_156 = _T_153 ? io_dec_exu_gpr_exu_gpr_i0_rs1_d : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] muldiv_rs1_d = _T_156 | _T_99; // @[Mux.scala 27:72]
  wire [31:0] _T_161 = io_dec_exu_decode_exu_mul_p_valid ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] i0_rs2_d = _T_118; // @[Mux.scala 27:72 Mux.scala 27:72]
  wire [1:0] _T_194 = i0_pp_r_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [20:0] final_predpipe_mp = i0_flush_upper_x ? predpipe_x : 21'h0; // @[exu.scala 200:48]
  wire  _T_206 = i0_flush_upper_x & _T_170; // @[exu.scala 202:75]
  wire  _T_214 = _T_170 & i0_flush_upper_d; // @[exu.scala 241:48]
  wire [30:0] _T_216 = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r ? io_dec_exu_tlu_exu_dec_tlu_flush_path_r : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_217 = _T_214 ? i0_flush_path_d : 31'h0; // @[Mux.scala 27:72]
  wire [31:0] pred_correct_npc_r = {{1'd0}, _T_31}; // @[exu.scala 45:51 exu.scala 77:45]
  wire [31:0] _T_221 = i0_pred_correct_upper_r ? pred_correct_npc_r : {{1'd0}, i0_flush_path_upper_r}; // @[exu.scala 243:55]
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
  exu_alu_ctl i_alu ( // @[exu.scala 129:19]
    .clock(i_alu_clock),
    .reset(i_alu_reset),
    .io_dec_alu_dec_i0_alu_decode_d(i_alu_io_dec_alu_dec_i0_alu_decode_d),
    .io_dec_alu_dec_csr_ren_d(i_alu_io_dec_alu_dec_csr_ren_d),
    .io_dec_alu_dec_i0_br_immed_d(i_alu_io_dec_alu_dec_i0_br_immed_d),
    .io_dec_alu_exu_i0_pc_x(i_alu_io_dec_alu_exu_i0_pc_x),
    .io_csr_rddata_in(i_alu_io_csr_rddata_in),
    .io_dec_i0_pc_d(i_alu_io_dec_i0_pc_d),
    .io_flush_upper_x(i_alu_io_flush_upper_x),
    .io_dec_tlu_flush_lower_r(i_alu_io_dec_tlu_flush_lower_r),
    .io_enable(i_alu_io_enable),
    .io_i0_ap_clz(i_alu_io_i0_ap_clz),
    .io_i0_ap_ctz(i_alu_io_i0_ap_ctz),
    .io_i0_ap_pcnt(i_alu_io_i0_ap_pcnt),
    .io_i0_ap_sext_b(i_alu_io_i0_ap_sext_b),
    .io_i0_ap_sext_h(i_alu_io_i0_ap_sext_h),
    .io_i0_ap_min(i_alu_io_i0_ap_min),
    .io_i0_ap_max(i_alu_io_i0_ap_max),
    .io_i0_ap_pack(i_alu_io_i0_ap_pack),
    .io_i0_ap_packu(i_alu_io_i0_ap_packu),
    .io_i0_ap_packh(i_alu_io_i0_ap_packh),
    .io_i0_ap_rol(i_alu_io_i0_ap_rol),
    .io_i0_ap_ror(i_alu_io_i0_ap_ror),
    .io_i0_ap_grev(i_alu_io_i0_ap_grev),
    .io_i0_ap_gorc(i_alu_io_i0_ap_gorc),
    .io_i0_ap_zbb(i_alu_io_i0_ap_zbb),
    .io_i0_ap_sbset(i_alu_io_i0_ap_sbset),
    .io_i0_ap_sbclr(i_alu_io_i0_ap_sbclr),
    .io_i0_ap_sbinv(i_alu_io_i0_ap_sbinv),
    .io_i0_ap_sbext(i_alu_io_i0_ap_sbext),
    .io_i0_ap_land(i_alu_io_i0_ap_land),
    .io_i0_ap_lor(i_alu_io_i0_ap_lor),
    .io_i0_ap_lxor(i_alu_io_i0_ap_lxor),
    .io_i0_ap_sll(i_alu_io_i0_ap_sll),
    .io_i0_ap_srl(i_alu_io_i0_ap_srl),
    .io_i0_ap_sra(i_alu_io_i0_ap_sra),
    .io_i0_ap_beq(i_alu_io_i0_ap_beq),
    .io_i0_ap_bne(i_alu_io_i0_ap_bne),
    .io_i0_ap_blt(i_alu_io_i0_ap_blt),
    .io_i0_ap_bge(i_alu_io_i0_ap_bge),
    .io_i0_ap_add(i_alu_io_i0_ap_add),
    .io_i0_ap_sub(i_alu_io_i0_ap_sub),
    .io_i0_ap_slt(i_alu_io_i0_ap_slt),
    .io_i0_ap_unsign(i_alu_io_i0_ap_unsign),
    .io_i0_ap_jal(i_alu_io_i0_ap_jal),
    .io_i0_ap_predict_t(i_alu_io_i0_ap_predict_t),
    .io_i0_ap_predict_nt(i_alu_io_i0_ap_predict_nt),
    .io_i0_ap_csr_write(i_alu_io_i0_ap_csr_write),
    .io_i0_ap_csr_imm(i_alu_io_i0_ap_csr_imm),
    .io_a_in(i_alu_io_a_in),
    .io_b_in(i_alu_io_b_in),
    .io_pp_in_valid(i_alu_io_pp_in_valid),
    .io_pp_in_bits_boffset(i_alu_io_pp_in_bits_boffset),
    .io_pp_in_bits_pc4(i_alu_io_pp_in_bits_pc4),
    .io_pp_in_bits_hist(i_alu_io_pp_in_bits_hist),
    .io_pp_in_bits_toffset(i_alu_io_pp_in_bits_toffset),
    .io_pp_in_bits_br_error(i_alu_io_pp_in_bits_br_error),
    .io_pp_in_bits_br_start_error(i_alu_io_pp_in_bits_br_start_error),
    .io_pp_in_bits_pcall(i_alu_io_pp_in_bits_pcall),
    .io_pp_in_bits_pja(i_alu_io_pp_in_bits_pja),
    .io_pp_in_bits_way(i_alu_io_pp_in_bits_way),
    .io_pp_in_bits_pret(i_alu_io_pp_in_bits_pret),
    .io_pp_in_bits_prett(i_alu_io_pp_in_bits_prett),
    .io_result_ff(i_alu_io_result_ff),
    .io_flush_upper_out(i_alu_io_flush_upper_out),
    .io_flush_final_out(i_alu_io_flush_final_out),
    .io_flush_path_out(i_alu_io_flush_path_out),
    .io_pred_correct_out(i_alu_io_pred_correct_out),
    .io_predict_p_out_valid(i_alu_io_predict_p_out_valid),
    .io_predict_p_out_bits_misp(i_alu_io_predict_p_out_bits_misp),
    .io_predict_p_out_bits_ataken(i_alu_io_predict_p_out_bits_ataken),
    .io_predict_p_out_bits_boffset(i_alu_io_predict_p_out_bits_boffset),
    .io_predict_p_out_bits_pc4(i_alu_io_predict_p_out_bits_pc4),
    .io_predict_p_out_bits_hist(i_alu_io_predict_p_out_bits_hist),
    .io_predict_p_out_bits_toffset(i_alu_io_predict_p_out_bits_toffset),
    .io_predict_p_out_bits_br_error(i_alu_io_predict_p_out_bits_br_error),
    .io_predict_p_out_bits_br_start_error(i_alu_io_predict_p_out_bits_br_start_error),
    .io_predict_p_out_bits_pcall(i_alu_io_predict_p_out_bits_pcall),
    .io_predict_p_out_bits_pja(i_alu_io_predict_p_out_bits_pja),
    .io_predict_p_out_bits_way(i_alu_io_predict_p_out_bits_way),
    .io_predict_p_out_bits_pret(i_alu_io_predict_p_out_bits_pret)
  );
  exu_mul_ctl i_mul ( // @[exu.scala 149:21]
    .clock(i_mul_clock),
    .reset(i_mul_reset),
    .io_mul_p_valid(i_mul_io_mul_p_valid),
    .io_mul_p_bits_rs1_sign(i_mul_io_mul_p_bits_rs1_sign),
    .io_mul_p_bits_rs2_sign(i_mul_io_mul_p_bits_rs2_sign),
    .io_mul_p_bits_low(i_mul_io_mul_p_bits_low),
    .io_rs1_in(i_mul_io_rs1_in),
    .io_rs2_in(i_mul_io_rs2_in),
    .io_result_x(i_mul_io_result_x)
  );
  exu_div_ctl i_div ( // @[exu.scala 157:21]
    .clock(i_div_clock),
    .reset(i_div_reset),
    .io_dividend(i_div_io_dividend),
    .io_divisor(i_div_io_divisor),
    .io_exu_div_result(i_div_io_exu_div_result),
    .io_exu_div_wren(i_div_io_exu_div_wren),
    .io_dec_div_div_p_valid(i_div_io_dec_div_div_p_valid),
    .io_dec_div_div_p_bits_unsign(i_div_io_dec_div_div_p_bits_unsign),
    .io_dec_div_div_p_bits_rem(i_div_io_dec_div_div_p_bits_rem),
    .io_dec_div_dec_div_cancel(i_div_io_dec_div_dec_div_cancel)
  );
  assign io_dec_exu_dec_alu_exu_i0_pc_x = i_alu_io_dec_alu_exu_i0_pc_x; // @[exu.scala 130:20]
  assign io_dec_exu_decode_exu_exu_i0_result_x = mul_valid_x ? i_mul_io_result_x : i_alu_io_result_ff; // @[exu.scala 165:57]
  assign io_dec_exu_decode_exu_exu_csr_rs1_x = _T_107; // @[exu.scala 104:57]
  assign io_dec_exu_tlu_exu_exu_i0_br_hist_r = _T_194 & i0_pp_r_bits_hist; // @[exu.scala 192:43]
  assign io_dec_exu_tlu_exu_exu_i0_br_error_r = i0_pp_r_bits_br_error; // @[exu.scala 193:43]
  assign io_dec_exu_tlu_exu_exu_i0_br_start_error_r = i0_pp_r_bits_br_start_error; // @[exu.scala 195:48]
  assign io_dec_exu_tlu_exu_exu_i0_br_index_r = predpipe_r[12:5]; // @[exu.scala 197:43]
  assign io_dec_exu_tlu_exu_exu_i0_br_valid_r = i0_pp_r_valid; // @[exu.scala 189:43]
  assign io_dec_exu_tlu_exu_exu_i0_br_mp_r = i0_pp_r_bits_misp; // @[exu.scala 190:43]
  assign io_dec_exu_tlu_exu_exu_i0_br_middle_r = i0_pp_r_bits_pc4 ^ i0_pp_r_bits_boffset; // @[exu.scala 194:43]
  assign io_dec_exu_tlu_exu_exu_pmu_i0_br_misp = i0_pp_r_bits_misp; // @[exu.scala 169:47]
  assign io_dec_exu_tlu_exu_exu_pmu_i0_br_ataken = i0_pp_r_bits_ataken; // @[exu.scala 170:47]
  assign io_dec_exu_tlu_exu_exu_pmu_i0_pc4 = i0_pp_r_bits_pc4; // @[exu.scala 171:47]
  assign io_dec_exu_tlu_exu_exu_npc_r = _T_221[30:0]; // @[exu.scala 243:49]
  assign io_exu_bp_exu_i0_br_index_r = io_dec_exu_tlu_exu_exu_i0_br_index_r; // @[exu.scala 198:43]
  assign io_exu_bp_exu_i0_br_fghr_r = predpipe_r[20:13]; // @[exu.scala 196:43]
  assign io_exu_bp_exu_i0_br_way_r = i0_pp_r_bits_way; // @[exu.scala 191:43]
  assign io_exu_bp_exu_mp_pkt_valid = i0_flush_upper_x & i0_predict_p_x_valid; // @[exu.scala 51:53 exu.scala 204:39]
  assign io_exu_bp_exu_mp_pkt_bits_misp = i0_flush_upper_x & i0_predict_p_x_bits_misp; // @[exu.scala 206:39]
  assign io_exu_bp_exu_mp_pkt_bits_ataken = i0_flush_upper_x & i0_predict_p_x_bits_ataken; // @[exu.scala 210:39]
  assign io_exu_bp_exu_mp_pkt_bits_boffset = i0_flush_upper_x & i0_predict_p_x_bits_boffset; // @[exu.scala 211:39]
  assign io_exu_bp_exu_mp_pkt_bits_pc4 = i0_flush_upper_x & i0_predict_p_x_bits_pc4; // @[exu.scala 212:39]
  assign io_exu_bp_exu_mp_pkt_bits_hist = i0_flush_upper_x ? i0_predict_p_x_bits_hist : 2'h0; // @[exu.scala 213:39]
  assign io_exu_bp_exu_mp_pkt_bits_toffset = i0_flush_upper_x ? i0_predict_p_x_bits_toffset : 12'h0; // @[exu.scala 214:39]
  assign io_exu_bp_exu_mp_pkt_bits_br_error = 1'h0; // @[exu.scala 50:39]
  assign io_exu_bp_exu_mp_pkt_bits_br_start_error = 1'h0; // @[exu.scala 49:44]
  assign io_exu_bp_exu_mp_pkt_bits_pcall = i0_flush_upper_x & i0_predict_p_x_bits_pcall; // @[exu.scala 207:39]
  assign io_exu_bp_exu_mp_pkt_bits_pja = i0_flush_upper_x & i0_predict_p_x_bits_pja; // @[exu.scala 208:39]
  assign io_exu_bp_exu_mp_pkt_bits_way = i0_flush_upper_x & i0_predict_p_x_bits_way; // @[exu.scala 205:39]
  assign io_exu_bp_exu_mp_pkt_bits_pret = i0_flush_upper_x & i0_predict_p_x_bits_pret; // @[exu.scala 209:39]
  assign io_exu_bp_exu_mp_pkt_bits_prett = 31'h0; // @[exu.scala 48:57]
  assign io_exu_bp_exu_mp_eghr = final_predpipe_mp[20:13]; // @[exu.scala 218:39]
  assign io_exu_bp_exu_mp_fghr = _T_206 ? ghr_d : ghr_x; // @[exu.scala 215:39]
  assign io_exu_bp_exu_mp_index = final_predpipe_mp[12:5]; // @[exu.scala 216:39]
  assign io_exu_bp_exu_mp_btag = final_predpipe_mp[4:0]; // @[exu.scala 217:39]
  assign io_exu_flush_final = i_alu_io_flush_final_out; // @[exu.scala 145:27]
  assign io_exu_div_result = i_div_io_exu_div_result; // @[exu.scala 163:33]
  assign io_exu_div_wren = i_div_io_exu_div_wren; // @[exu.scala 162:41]
  assign io_lsu_exu_exu_lsu_rs1_d = _T_135 | _T_134; // @[exu.scala 113:27]
  assign io_lsu_exu_exu_lsu_rs2_d = _T_148 | _T_149; // @[exu.scala 119:27]
  assign io_exu_flush_path_final = _T_216 | _T_217; // @[exu.scala 239:33]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_io_en = x_data_en & io_dec_exu_decode_exu_dec_i0_branch_d; // @[lib.scala 407:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = r_data_en & i0_branch_x; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[lib.scala 407:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_4_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[lib.scala 407:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_5_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[lib.scala 407:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_6_io_en = io_dec_exu_decode_exu_dec_ctl_en[1]; // @[lib.scala 407:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_7_io_en = x_data_en & io_dec_exu_dec_alu_dec_csr_ren_d; // @[lib.scala 407:17]
  assign i_alu_clock = clock;
  assign i_alu_reset = reset;
  assign i_alu_io_dec_alu_dec_i0_alu_decode_d = io_dec_exu_dec_alu_dec_i0_alu_decode_d; // @[exu.scala 130:20]
  assign i_alu_io_dec_alu_dec_csr_ren_d = io_dec_exu_dec_alu_dec_csr_ren_d; // @[exu.scala 130:20]
  assign i_alu_io_dec_alu_dec_i0_br_immed_d = io_dec_exu_dec_alu_dec_i0_br_immed_d; // @[exu.scala 130:20]
  assign i_alu_io_csr_rddata_in = io_dec_csr_rddata_d; // @[exu.scala 136:33]
  assign i_alu_io_dec_i0_pc_d = io_dec_exu_ib_exu_dec_i0_pc_d; // @[exu.scala 140:33]
  assign i_alu_io_flush_upper_x = i0_flush_upper_x; // @[exu.scala 135:33]
  assign i_alu_io_dec_tlu_flush_lower_r = io_dec_exu_tlu_exu_dec_tlu_flush_lower_r; // @[exu.scala 137:41]
  assign i_alu_io_enable = io_dec_exu_decode_exu_dec_data_en[1]; // @[exu.scala 133:45]
  assign i_alu_io_i0_ap_clz = io_dec_exu_decode_exu_i0_ap_clz; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_ctz = io_dec_exu_decode_exu_i0_ap_ctz; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_pcnt = io_dec_exu_decode_exu_i0_ap_pcnt; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sext_b = io_dec_exu_decode_exu_i0_ap_sext_b; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sext_h = io_dec_exu_decode_exu_i0_ap_sext_h; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_min = io_dec_exu_decode_exu_i0_ap_min; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_max = io_dec_exu_decode_exu_i0_ap_max; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_pack = io_dec_exu_decode_exu_i0_ap_pack; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_packu = io_dec_exu_decode_exu_i0_ap_packu; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_packh = io_dec_exu_decode_exu_i0_ap_packh; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_rol = io_dec_exu_decode_exu_i0_ap_rol; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_ror = io_dec_exu_decode_exu_i0_ap_ror; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_grev = io_dec_exu_decode_exu_i0_ap_grev; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_gorc = io_dec_exu_decode_exu_i0_ap_gorc; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_zbb = io_dec_exu_decode_exu_i0_ap_zbb; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sbset = io_dec_exu_decode_exu_i0_ap_sbset; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sbclr = io_dec_exu_decode_exu_i0_ap_sbclr; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sbinv = io_dec_exu_decode_exu_i0_ap_sbinv; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sbext = io_dec_exu_decode_exu_i0_ap_sbext; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_land = io_dec_exu_decode_exu_i0_ap_land; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_lor = io_dec_exu_decode_exu_i0_ap_lor; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_lxor = io_dec_exu_decode_exu_i0_ap_lxor; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sll = io_dec_exu_decode_exu_i0_ap_sll; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_srl = io_dec_exu_decode_exu_i0_ap_srl; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sra = io_dec_exu_decode_exu_i0_ap_sra; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_beq = io_dec_exu_decode_exu_i0_ap_beq; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_bne = io_dec_exu_decode_exu_i0_ap_bne; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_blt = io_dec_exu_decode_exu_i0_ap_blt; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_bge = io_dec_exu_decode_exu_i0_ap_bge; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_add = io_dec_exu_decode_exu_i0_ap_add; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_sub = io_dec_exu_decode_exu_i0_ap_sub; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_slt = io_dec_exu_decode_exu_i0_ap_slt; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_unsign = io_dec_exu_decode_exu_i0_ap_unsign; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_jal = io_dec_exu_decode_exu_i0_ap_jal; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_predict_t = io_dec_exu_decode_exu_i0_ap_predict_t; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_predict_nt = io_dec_exu_decode_exu_i0_ap_predict_nt; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_csr_write = io_dec_exu_decode_exu_i0_ap_csr_write; // @[exu.scala 141:51]
  assign i_alu_io_i0_ap_csr_imm = io_dec_exu_decode_exu_i0_ap_csr_imm; // @[exu.scala 141:51]
  assign i_alu_io_a_in = _T_104 | _T_102; // @[exu.scala 138:39]
  assign i_alu_io_b_in = i0_rs2_d; // @[exu.scala 139:39]
  assign i_alu_io_pp_in_valid = io_dec_exu_decode_exu_dec_i0_predict_p_d_valid; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_boffset = io_dec_exu_ib_exu_dec_i0_pc_d[0]; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_pc4 = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pc4; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_hist = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_hist; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_toffset = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_toffset; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_br_error = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_error; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_br_start_error = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_br_start_error; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_pcall = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pcall; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_pja = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pja; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_way = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_way; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_pret = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_pret; // @[exu.scala 134:45]
  assign i_alu_io_pp_in_bits_prett = io_dec_exu_decode_exu_dec_i0_predict_p_d_bits_prett; // @[exu.scala 134:45]
  assign i_mul_clock = clock;
  assign i_mul_reset = reset;
  assign i_mul_io_mul_p_valid = io_dec_exu_decode_exu_mul_p_valid; // @[exu.scala 151:23]
  assign i_mul_io_mul_p_bits_rs1_sign = io_dec_exu_decode_exu_mul_p_bits_rs1_sign; // @[exu.scala 151:23]
  assign i_mul_io_mul_p_bits_rs2_sign = io_dec_exu_decode_exu_mul_p_bits_rs2_sign; // @[exu.scala 151:23]
  assign i_mul_io_mul_p_bits_low = io_dec_exu_decode_exu_mul_p_bits_low; // @[exu.scala 151:23]
  assign i_mul_io_rs1_in = muldiv_rs1_d & _T_161; // @[exu.scala 153:41]
  assign i_mul_io_rs2_in = i0_rs2_d & _T_161; // @[exu.scala 154:41]
  assign i_div_clock = clock;
  assign i_div_reset = reset;
  assign i_div_io_dividend = _T_156 | _T_99; // @[exu.scala 160:33]
  assign i_div_io_divisor = i0_rs2_d; // @[exu.scala 161:33]
  assign i_div_io_dec_div_div_p_valid = io_dec_exu_dec_div_div_p_valid; // @[exu.scala 158:20]
  assign i_div_io_dec_div_div_p_bits_unsign = io_dec_exu_dec_div_div_p_bits_unsign; // @[exu.scala 158:20]
  assign i_div_io_dec_div_div_p_bits_rem = io_dec_exu_dec_div_div_p_bits_rem; // @[exu.scala 158:20]
  assign i_div_io_dec_div_dec_div_cancel = io_dec_exu_dec_div_dec_div_cancel; // @[exu.scala 158:20]
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
  i0_branch_x = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  i0_flush_path_x = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  i0_predict_p_x_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  i0_predict_p_x_bits_misp = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  i0_predict_p_x_bits_ataken = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  i0_predict_p_x_bits_boffset = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  i0_predict_p_x_bits_pc4 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  i0_predict_p_x_bits_hist = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  i0_predict_p_x_bits_toffset = _RAND_8[11:0];
  _RAND_9 = {1{`RANDOM}};
  i0_predict_p_x_bits_br_error = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  i0_predict_p_x_bits_br_start_error = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  i0_predict_p_x_bits_pcall = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  i0_predict_p_x_bits_pja = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  i0_predict_p_x_bits_way = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  i0_predict_p_x_bits_pret = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  predpipe_x = _RAND_15[20:0];
  _RAND_16 = {1{`RANDOM}};
  predpipe_r = _RAND_16[20:0];
  _RAND_17 = {1{`RANDOM}};
  ghr_x = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  i0_valid_x = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  i0_taken_x = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  i0_pred_correct_upper_x = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  i0_flush_upper_x = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  i0_pp_r_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  i0_pp_r_bits_misp = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  i0_pp_r_bits_ataken = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  i0_pp_r_bits_boffset = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  i0_pp_r_bits_pc4 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  i0_pp_r_bits_hist = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  i0_pp_r_bits_br_error = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  i0_pp_r_bits_br_start_error = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  i0_pp_r_bits_way = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  pred_temp1 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  i0_pred_correct_upper_r = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  i0_flush_path_upper_r = _RAND_33[30:0];
  _RAND_34 = {1{`RANDOM}};
  pred_temp2 = _RAND_34[24:0];
  _RAND_35 = {1{`RANDOM}};
  ghr_d = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  mul_valid_x = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  _T_107 = _RAND_37[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    i0_branch_x = 1'h0;
  end
  if (reset) begin
    i0_flush_path_x = 31'h0;
  end
  if (reset) begin
    i0_predict_p_x_valid = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_misp = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_ataken = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_boffset = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pc4 = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_hist = 2'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_toffset = 12'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_br_error = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_br_start_error = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pcall = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pja = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_way = 1'h0;
  end
  if (reset) begin
    i0_predict_p_x_bits_pret = 1'h0;
  end
  if (reset) begin
    predpipe_x = 21'h0;
  end
  if (reset) begin
    predpipe_r = 21'h0;
  end
  if (reset) begin
    ghr_x = 8'h0;
  end
  if (reset) begin
    i0_valid_x = 1'h0;
  end
  if (reset) begin
    i0_taken_x = 1'h0;
  end
  if (reset) begin
    i0_pred_correct_upper_x = 1'h0;
  end
  if (reset) begin
    i0_flush_upper_x = 1'h0;
  end
  if (reset) begin
    i0_pp_r_valid = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_misp = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_ataken = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_boffset = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_pc4 = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_hist = 2'h0;
  end
  if (reset) begin
    i0_pp_r_bits_br_error = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_br_start_error = 1'h0;
  end
  if (reset) begin
    i0_pp_r_bits_way = 1'h0;
  end
  if (reset) begin
    pred_temp1 = 6'h0;
  end
  if (reset) begin
    i0_pred_correct_upper_r = 1'h0;
  end
  if (reset) begin
    i0_flush_path_upper_r = 31'h0;
  end
  if (reset) begin
    pred_temp2 = 25'h0;
  end
  if (reset) begin
    ghr_d = 8'h0;
  end
  if (reset) begin
    mul_valid_x = 1'h0;
  end
  if (reset) begin
    _T_107 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_branch_x <= 1'h0;
    end else if (_T_42) begin
      i0_branch_x <= io_dec_exu_decode_exu_dec_i0_branch_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_flush_path_x <= 31'h0;
    end else if (x_data_en) begin
      i0_flush_path_x <= i0_flush_path_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_valid <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_valid <= i0_predict_p_d_valid;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_misp <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_misp <= i0_predict_p_d_bits_misp;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_ataken <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_ataken <= i0_predict_p_d_bits_ataken;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_boffset <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_boffset <= i0_predict_p_d_bits_boffset;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pc4 <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_pc4 <= i0_predict_p_d_bits_pc4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_hist <= 2'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_hist <= i0_predict_p_d_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_toffset <= 12'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_toffset <= i0_predict_p_d_bits_toffset;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_br_error <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_br_error <= i0_predict_p_d_bits_br_error;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_br_start_error <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_br_start_error <= i0_predict_p_d_bits_br_start_error;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pcall <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_pcall <= i0_predict_p_d_bits_pcall;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pja <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_pja <= i0_predict_p_d_bits_pja;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_way <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_way <= i0_predict_p_d_bits_way;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_predict_p_x_bits_pret <= 1'h0;
    end else if (x_data_en) begin
      i0_predict_p_x_bits_pret <= i0_predict_p_d_bits_pret;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      predpipe_x <= 21'h0;
    end else if (x_data_en_q2) begin
      predpipe_x <= predpipe_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      predpipe_r <= 21'h0;
    end else if (r_data_en_q2) begin
      predpipe_r <= predpipe_x;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ghr_x <= 8'h0;
    end else if (x_ctl_en) begin
      if (i0_valid_x) begin
        ghr_x <= _T_191;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_valid_x <= 1'h0;
    end else if (x_ctl_en) begin
      i0_valid_x <= i0_valid_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_taken_x <= 1'h0;
    end else if (x_ctl_en) begin
      i0_taken_x <= i0_taken_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pred_correct_upper_x <= 1'h0;
    end else if (x_ctl_en) begin
      i0_pred_correct_upper_x <= i0_pred_correct_upper_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_flush_upper_x <= 1'h0;
    end else if (x_ctl_en) begin
      i0_flush_upper_x <= i0_flush_upper_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_valid <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_valid <= i0_predict_p_x_valid;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_misp <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_misp <= i0_predict_p_x_bits_misp;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_ataken <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_ataken <= i0_predict_p_x_bits_ataken;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_boffset <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_boffset <= i0_predict_p_x_bits_boffset;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_pc4 <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_pc4 <= i0_predict_p_x_bits_pc4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_hist <= 2'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_hist <= i0_predict_p_x_bits_hist;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_br_error <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_br_error <= i0_predict_p_x_bits_br_error;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_br_start_error <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_br_start_error <= i0_predict_p_x_bits_br_start_error;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pp_r_bits_way <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pp_r_bits_way <= i0_predict_p_x_bits_way;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pred_temp1 <= 6'h0;
    end else if (r_data_en) begin
      pred_temp1 <= io_dec_exu_decode_exu_pred_correct_npc_x[5:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_pred_correct_upper_r <= 1'h0;
    end else if (r_ctl_en) begin
      i0_pred_correct_upper_r <= i0_pred_correct_upper_x;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      i0_flush_path_upper_r <= 31'h0;
    end else if (r_data_en) begin
      i0_flush_path_upper_r <= i0_flush_path_x;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pred_temp2 <= 25'h0;
    end else if (r_data_en) begin
      pred_temp2 <= io_dec_exu_decode_exu_pred_correct_npc_x[30:6];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ghr_d <= 8'h0;
    end else if (_T_34) begin
      ghr_d <= ghr_d_ns;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      mul_valid_x <= 1'h0;
    end else if (_T_38) begin
      mul_valid_x <= io_dec_exu_decode_exu_mul_p_valid;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_107 <= 32'h0;
    end else if (x_data_en_q1) begin
      _T_107 <= i0_rs1_d;
    end
  end
endmodule
