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
module lsu_stbuf(
  input         clock,
  input         reset,
  input         io_lsu_stbuf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_fast_int,
  input         io_lsu_pkt_m_bits_by,
  input         io_lsu_pkt_m_bits_half,
  input         io_lsu_pkt_m_bits_word,
  input         io_lsu_pkt_m_bits_dword,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_m_bits_store,
  input         io_lsu_pkt_m_bits_unsign,
  input         io_lsu_pkt_m_bits_dma,
  input         io_lsu_pkt_m_bits_store_data_bypass_d,
  input         io_lsu_pkt_m_bits_load_ldst_bypass_d,
  input         io_lsu_pkt_m_bits_store_data_bypass_m,
  input         io_lsu_pkt_r_valid,
  input         io_lsu_pkt_r_bits_fast_int,
  input         io_lsu_pkt_r_bits_by,
  input         io_lsu_pkt_r_bits_half,
  input         io_lsu_pkt_r_bits_word,
  input         io_lsu_pkt_r_bits_dword,
  input         io_lsu_pkt_r_bits_load,
  input         io_lsu_pkt_r_bits_store,
  input         io_lsu_pkt_r_bits_unsign,
  input         io_lsu_pkt_r_bits_dma,
  input         io_lsu_pkt_r_bits_store_data_bypass_d,
  input         io_lsu_pkt_r_bits_load_ldst_bypass_d,
  input         io_lsu_pkt_r_bits_store_data_bypass_m,
  input         io_store_stbuf_reqvld_r,
  input         io_lsu_commit_r,
  input         io_dec_lsu_valid_raw_d,
  input  [31:0] io_store_data_hi_r,
  input  [31:0] io_store_data_lo_r,
  input  [31:0] io_store_datafn_hi_r,
  input  [31:0] io_store_datafn_lo_r,
  input         io_lsu_stbuf_commit_any,
  input  [15:0] io_lsu_addr_d,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [15:0] io_end_addr_d,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_end_addr_r,
  input         io_ldst_dual_d,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
  input         io_addr_in_dccm_m,
  input         io_addr_in_dccm_r,
  input         io_lsu_cmpen_m,
  input         io_scan_mode,
  output        io_stbuf_reqvld_any,
  output        io_stbuf_reqvld_flushed_any,
  output [15:0] io_stbuf_addr_any,
  output [31:0] io_stbuf_data_any,
  output        io_lsu_stbuf_full_any,
  output        io_lsu_stbuf_empty_any,
  output        io_ldst_stbuf_reqvld_r,
  output [31:0] io_stbuf_fwddata_hi_m,
  output [31:0] io_stbuf_fwddata_lo_m,
  output [3:0]  io_stbuf_fwdbyteen_hi_m,
  output [3:0]  io_stbuf_fwdbyteen_lo_m
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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 377:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 377:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 377:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 377:23]
  wire [1:0] _T_5 = io_lsu_pkt_r_bits_half ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_7 = io_lsu_pkt_r_bits_dword ? 8'hff : 8'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_10 = {{1'd0}, io_lsu_pkt_r_bits_by}; // @[Mux.scala 27:72]
  wire [1:0] _T_8 = _GEN_10 | _T_5; // @[Mux.scala 27:72]
  wire [3:0] _GEN_11 = {{2'd0}, _T_8}; // @[Mux.scala 27:72]
  wire [3:0] _T_9 = _GEN_11 | _T_6; // @[Mux.scala 27:72]
  wire [7:0] _GEN_12 = {{4'd0}, _T_9}; // @[Mux.scala 27:72]
  wire [7:0] ldst_byteen_r = _GEN_12 | _T_7; // @[Mux.scala 27:72]
  wire  dual_stbuf_write_r = io_ldst_dual_r & io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 115:43]
  wire [10:0] _GEN_13 = {{3'd0}, ldst_byteen_r}; // @[lsu_stbuf.scala 117:39]
  wire [10:0] _T_12 = _GEN_13 << io_lsu_addr_r[1:0]; // @[lsu_stbuf.scala 117:39]
  wire [7:0] store_byteen_ext_r = _T_12[7:0]; // @[lsu_stbuf.scala 117:22]
  wire [3:0] _T_15 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_15; // @[lsu_stbuf.scala 118:52]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_15; // @[lsu_stbuf.scala 119:52]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] RdPtrPlus1 = RdPtr + 2'h1; // @[lsu_stbuf.scala 121:26]
  reg [1:0] WrPtr; // @[Reg.scala 27:20]
  wire [1:0] WrPtrPlus1 = WrPtr + 2'h1; // @[lsu_stbuf.scala 122:26]
  wire [1:0] WrPtrPlus2 = WrPtr + 2'h2; // @[lsu_stbuf.scala 123:26]
  wire  _T_22 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_stbuf.scala 125:46]
  reg [15:0] stbuf_addr_0; // @[lib.scala 383:16]
  wire  _T_26 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  reg  _T_587; // @[lsu_stbuf.scala 160:14]
  reg  _T_579; // @[lsu_stbuf.scala 160:14]
  reg  _T_571; // @[lsu_stbuf.scala 160:14]
  reg  _T_563; // @[lsu_stbuf.scala 160:14]
  wire [3:0] stbuf_vld = {_T_587,_T_579,_T_571,_T_563}; // @[Cat.scala 29:58]
  wire  _T_28 = _T_26 & stbuf_vld[0]; // @[lsu_stbuf.scala 127:179]
  reg  _T_622; // @[lsu_stbuf.scala 163:14]
  reg  _T_614; // @[lsu_stbuf.scala 163:14]
  reg  _T_606; // @[lsu_stbuf.scala 163:14]
  reg  _T_598; // @[lsu_stbuf.scala 163:14]
  wire [3:0] stbuf_dma_kill = {_T_622,_T_614,_T_606,_T_598}; // @[Cat.scala 29:58]
  wire  _T_30 = ~stbuf_dma_kill[0]; // @[lsu_stbuf.scala 127:197]
  wire  _T_31 = _T_28 & _T_30; // @[lsu_stbuf.scala 127:195]
  wire  _T_211 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[lsu_stbuf.scala 138:81]
  wire  _T_212 = 2'h3 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_214 = _T_211 & _T_212; // @[lsu_stbuf.scala 138:112]
  wire  _T_208 = 2'h2 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_210 = _T_211 & _T_208; // @[lsu_stbuf.scala 138:112]
  wire  _T_204 = 2'h1 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_206 = _T_211 & _T_204; // @[lsu_stbuf.scala 138:112]
  wire  _T_200 = 2'h0 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_202 = _T_211 & _T_200; // @[lsu_stbuf.scala 138:112]
  wire [3:0] stbuf_reset = {_T_214,_T_210,_T_206,_T_202}; // @[Cat.scala 29:58]
  wire  _T_33 = ~stbuf_reset[0]; // @[lsu_stbuf.scala 127:218]
  wire  _T_34 = _T_31 & _T_33; // @[lsu_stbuf.scala 127:216]
  reg [15:0] stbuf_addr_1; // @[lib.scala 383:16]
  wire  _T_37 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  wire  _T_39 = _T_37 & stbuf_vld[1]; // @[lsu_stbuf.scala 127:179]
  wire  _T_41 = ~stbuf_dma_kill[1]; // @[lsu_stbuf.scala 127:197]
  wire  _T_42 = _T_39 & _T_41; // @[lsu_stbuf.scala 127:195]
  wire  _T_44 = ~stbuf_reset[1]; // @[lsu_stbuf.scala 127:218]
  wire  _T_45 = _T_42 & _T_44; // @[lsu_stbuf.scala 127:216]
  reg [15:0] stbuf_addr_2; // @[lib.scala 383:16]
  wire  _T_48 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  wire  _T_50 = _T_48 & stbuf_vld[2]; // @[lsu_stbuf.scala 127:179]
  wire  _T_52 = ~stbuf_dma_kill[2]; // @[lsu_stbuf.scala 127:197]
  wire  _T_53 = _T_50 & _T_52; // @[lsu_stbuf.scala 127:195]
  wire  _T_55 = ~stbuf_reset[2]; // @[lsu_stbuf.scala 127:218]
  wire  _T_56 = _T_53 & _T_55; // @[lsu_stbuf.scala 127:216]
  reg [15:0] stbuf_addr_3; // @[lib.scala 383:16]
  wire  _T_59 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  wire  _T_61 = _T_59 & stbuf_vld[3]; // @[lsu_stbuf.scala 127:179]
  wire  _T_63 = ~stbuf_dma_kill[3]; // @[lsu_stbuf.scala 127:197]
  wire  _T_64 = _T_61 & _T_63; // @[lsu_stbuf.scala 127:195]
  wire  _T_66 = ~stbuf_reset[3]; // @[lsu_stbuf.scala 127:218]
  wire  _T_67 = _T_64 & _T_66; // @[lsu_stbuf.scala 127:216]
  wire [3:0] store_matchvec_lo_r = {_T_67,_T_56,_T_45,_T_34}; // @[Cat.scala 29:58]
  wire  _T_72 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_74 = _T_72 & stbuf_vld[0]; // @[lsu_stbuf.scala 128:179]
  wire  _T_77 = _T_74 & _T_30; // @[lsu_stbuf.scala 128:194]
  wire  _T_78 = _T_77 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_81 = _T_78 & _T_33; // @[lsu_stbuf.scala 128:236]
  wire  _T_84 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_86 = _T_84 & stbuf_vld[1]; // @[lsu_stbuf.scala 128:179]
  wire  _T_89 = _T_86 & _T_41; // @[lsu_stbuf.scala 128:194]
  wire  _T_90 = _T_89 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_93 = _T_90 & _T_44; // @[lsu_stbuf.scala 128:236]
  wire  _T_96 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_98 = _T_96 & stbuf_vld[2]; // @[lsu_stbuf.scala 128:179]
  wire  _T_101 = _T_98 & _T_52; // @[lsu_stbuf.scala 128:194]
  wire  _T_102 = _T_101 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_105 = _T_102 & _T_55; // @[lsu_stbuf.scala 128:236]
  wire  _T_108 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_110 = _T_108 & stbuf_vld[3]; // @[lsu_stbuf.scala 128:179]
  wire  _T_113 = _T_110 & _T_63; // @[lsu_stbuf.scala 128:194]
  wire  _T_114 = _T_113 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_117 = _T_114 & _T_66; // @[lsu_stbuf.scala 128:236]
  wire [3:0] store_matchvec_hi_r = {_T_117,_T_105,_T_93,_T_81}; // @[Cat.scala 29:58]
  wire  store_coalesce_lo_r = |store_matchvec_lo_r; // @[lsu_stbuf.scala 130:49]
  wire  store_coalesce_hi_r = |store_matchvec_hi_r; // @[lsu_stbuf.scala 131:49]
  wire  _T_120 = 2'h0 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_121 = ~store_coalesce_lo_r; // @[lsu_stbuf.scala 134:31]
  wire  _T_122 = _T_120 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_124 = _T_120 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_125 = ~store_coalesce_hi_r; // @[lsu_stbuf.scala 135:54]
  wire  _T_126 = _T_124 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_127 = _T_122 | _T_126; // @[lsu_stbuf.scala 134:53]
  wire  _T_128 = 2'h0 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_129 = _T_128 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_130 = store_coalesce_lo_r | store_coalesce_hi_r; // @[lsu_stbuf.scala 136:81]
  wire  _T_131 = ~_T_130; // @[lsu_stbuf.scala 136:59]
  wire  _T_132 = _T_129 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_133 = _T_127 | _T_132; // @[lsu_stbuf.scala 135:76]
  wire  _T_135 = _T_133 | store_matchvec_lo_r[0]; // @[lsu_stbuf.scala 136:105]
  wire  _T_137 = _T_135 | store_matchvec_hi_r[0]; // @[lsu_stbuf.scala 137:32]
  wire  _T_138 = io_ldst_stbuf_reqvld_r & _T_137; // @[lsu_stbuf.scala 133:79]
  wire  _T_139 = 2'h1 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_141 = _T_139 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_143 = _T_139 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_145 = _T_143 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_146 = _T_141 | _T_145; // @[lsu_stbuf.scala 134:53]
  wire  _T_147 = 2'h1 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_148 = _T_147 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_151 = _T_148 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_152 = _T_146 | _T_151; // @[lsu_stbuf.scala 135:76]
  wire  _T_154 = _T_152 | store_matchvec_lo_r[1]; // @[lsu_stbuf.scala 136:105]
  wire  _T_156 = _T_154 | store_matchvec_hi_r[1]; // @[lsu_stbuf.scala 137:32]
  wire  _T_157 = io_ldst_stbuf_reqvld_r & _T_156; // @[lsu_stbuf.scala 133:79]
  wire  _T_158 = 2'h2 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_160 = _T_158 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_162 = _T_158 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_164 = _T_162 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_165 = _T_160 | _T_164; // @[lsu_stbuf.scala 134:53]
  wire  _T_166 = 2'h2 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_167 = _T_166 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_170 = _T_167 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_171 = _T_165 | _T_170; // @[lsu_stbuf.scala 135:76]
  wire  _T_173 = _T_171 | store_matchvec_lo_r[2]; // @[lsu_stbuf.scala 136:105]
  wire  _T_175 = _T_173 | store_matchvec_hi_r[2]; // @[lsu_stbuf.scala 137:32]
  wire  _T_176 = io_ldst_stbuf_reqvld_r & _T_175; // @[lsu_stbuf.scala 133:79]
  wire  _T_177 = 2'h3 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_179 = _T_177 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_181 = _T_177 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_183 = _T_181 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_184 = _T_179 | _T_183; // @[lsu_stbuf.scala 134:53]
  wire  _T_185 = 2'h3 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_186 = _T_185 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_189 = _T_186 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_190 = _T_184 | _T_189; // @[lsu_stbuf.scala 135:76]
  wire  _T_192 = _T_190 | store_matchvec_lo_r[3]; // @[lsu_stbuf.scala 136:105]
  wire  _T_194 = _T_192 | store_matchvec_hi_r[3]; // @[lsu_stbuf.scala 137:32]
  wire  _T_195 = io_ldst_stbuf_reqvld_r & _T_194; // @[lsu_stbuf.scala 133:79]
  wire [3:0] stbuf_wr_en = {_T_195,_T_176,_T_157,_T_138}; // @[Cat.scala 29:58]
  wire  _T_218 = ~io_ldst_dual_r; // @[lsu_stbuf.scala 139:56]
  wire  _T_219 = _T_218 | io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 139:72]
  wire  _T_222 = _T_219 & _T_120; // @[lsu_stbuf.scala 139:99]
  wire  _T_224 = _T_222 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_226 = _T_224 | store_matchvec_lo_r[0]; // @[lsu_stbuf.scala 139:153]
  wire  _T_231 = _T_219 & _T_139; // @[lsu_stbuf.scala 139:99]
  wire  _T_233 = _T_231 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_235 = _T_233 | store_matchvec_lo_r[1]; // @[lsu_stbuf.scala 139:153]
  wire  _T_240 = _T_219 & _T_158; // @[lsu_stbuf.scala 139:99]
  wire  _T_242 = _T_240 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_244 = _T_242 | store_matchvec_lo_r[2]; // @[lsu_stbuf.scala 139:153]
  wire  _T_249 = _T_219 & _T_177; // @[lsu_stbuf.scala 139:99]
  wire  _T_251 = _T_249 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_253 = _T_251 | store_matchvec_lo_r[3]; // @[lsu_stbuf.scala 139:153]
  wire [3:0] sel_lo = {_T_253,_T_244,_T_235,_T_226}; // @[Cat.scala 29:58]
  reg [3:0] stbuf_byteen_0; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_273 = stbuf_byteen_0 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_274 = stbuf_byteen_0 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_0 = sel_lo[0] ? _T_273 : _T_274; // @[lsu_stbuf.scala 142:61]
  reg [3:0] stbuf_byteen_1; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_277 = stbuf_byteen_1 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_278 = stbuf_byteen_1 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_1 = sel_lo[1] ? _T_277 : _T_278; // @[lsu_stbuf.scala 142:61]
  reg [3:0] stbuf_byteen_2; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_281 = stbuf_byteen_2 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_282 = stbuf_byteen_2 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_2 = sel_lo[2] ? _T_281 : _T_282; // @[lsu_stbuf.scala 142:61]
  reg [3:0] stbuf_byteen_3; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_285 = stbuf_byteen_3 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_286 = stbuf_byteen_3 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_3 = sel_lo[3] ? _T_285 : _T_286; // @[lsu_stbuf.scala 142:61]
  wire  _T_290 = ~stbuf_byteen_0[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_292 = _T_290 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_0; // @[lib.scala 383:16]
  wire [7:0] _T_295 = _T_292 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_299 = _T_290 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_302 = _T_299 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_0 = sel_lo[0] ? _T_295 : _T_302; // @[lsu_stbuf.scala 144:54]
  wire  _T_306 = ~stbuf_byteen_1[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_308 = _T_306 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_1; // @[lib.scala 383:16]
  wire [7:0] _T_311 = _T_308 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_315 = _T_306 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_318 = _T_315 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_1 = sel_lo[1] ? _T_311 : _T_318; // @[lsu_stbuf.scala 144:54]
  wire  _T_322 = ~stbuf_byteen_2[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_324 = _T_322 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_2; // @[lib.scala 383:16]
  wire [7:0] _T_327 = _T_324 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_331 = _T_322 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_334 = _T_331 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_2 = sel_lo[2] ? _T_327 : _T_334; // @[lsu_stbuf.scala 144:54]
  wire  _T_338 = ~stbuf_byteen_3[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_340 = _T_338 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_3; // @[lib.scala 383:16]
  wire [7:0] _T_343 = _T_340 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_347 = _T_338 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_350 = _T_347 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_3 = sel_lo[3] ? _T_343 : _T_350; // @[lsu_stbuf.scala 144:54]
  wire  _T_354 = ~stbuf_byteen_0[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_356 = _T_354 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_359 = _T_356 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_363 = _T_354 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_366 = _T_363 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_0 = sel_lo[0] ? _T_359 : _T_366; // @[lsu_stbuf.scala 147:54]
  wire  _T_370 = ~stbuf_byteen_1[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_372 = _T_370 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_375 = _T_372 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_379 = _T_370 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_382 = _T_379 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_1 = sel_lo[1] ? _T_375 : _T_382; // @[lsu_stbuf.scala 147:54]
  wire  _T_386 = ~stbuf_byteen_2[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_388 = _T_386 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_391 = _T_388 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_395 = _T_386 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_398 = _T_395 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_2 = sel_lo[2] ? _T_391 : _T_398; // @[lsu_stbuf.scala 147:54]
  wire  _T_402 = ~stbuf_byteen_3[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_404 = _T_402 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_407 = _T_404 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_411 = _T_402 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_414 = _T_411 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_3 = sel_lo[3] ? _T_407 : _T_414; // @[lsu_stbuf.scala 147:54]
  wire  _T_418 = ~stbuf_byteen_0[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_420 = _T_418 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_423 = _T_420 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_427 = _T_418 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_430 = _T_427 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_0 = sel_lo[0] ? _T_423 : _T_430; // @[lsu_stbuf.scala 150:54]
  wire  _T_434 = ~stbuf_byteen_1[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_436 = _T_434 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_439 = _T_436 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_443 = _T_434 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_446 = _T_443 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_1 = sel_lo[1] ? _T_439 : _T_446; // @[lsu_stbuf.scala 150:54]
  wire  _T_450 = ~stbuf_byteen_2[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_452 = _T_450 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_455 = _T_452 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_459 = _T_450 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_462 = _T_459 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_2 = sel_lo[2] ? _T_455 : _T_462; // @[lsu_stbuf.scala 150:54]
  wire  _T_466 = ~stbuf_byteen_3[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_468 = _T_466 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_471 = _T_468 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_475 = _T_466 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_478 = _T_475 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_3 = sel_lo[3] ? _T_471 : _T_478; // @[lsu_stbuf.scala 150:54]
  wire  _T_482 = ~stbuf_byteen_0[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_484 = _T_482 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_487 = _T_484 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_491 = _T_482 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_494 = _T_491 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_0 = sel_lo[0] ? _T_487 : _T_494; // @[lsu_stbuf.scala 153:54]
  wire  _T_498 = ~stbuf_byteen_1[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_500 = _T_498 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_503 = _T_500 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_507 = _T_498 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_510 = _T_507 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_1 = sel_lo[1] ? _T_503 : _T_510; // @[lsu_stbuf.scala 153:54]
  wire  _T_514 = ~stbuf_byteen_2[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_516 = _T_514 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_519 = _T_516 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_523 = _T_514 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_526 = _T_523 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_2 = sel_lo[2] ? _T_519 : _T_526; // @[lsu_stbuf.scala 153:54]
  wire  _T_530 = ~stbuf_byteen_3[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_532 = _T_530 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_535 = _T_532 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_539 = _T_530 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_542 = _T_539 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_3 = sel_lo[3] ? _T_535 : _T_542; // @[lsu_stbuf.scala 153:54]
  wire [15:0] _T_544 = {datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_545 = {datain4_0,datain3_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_547 = {datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_548 = {datain4_1,datain3_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_550 = {datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_551 = {datain4_2,datain3_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_553 = {datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire [15:0] _T_554 = {datain4_3,datain3_3}; // @[Cat.scala 29:58]
  wire  _T_559 = stbuf_wr_en[0] | stbuf_vld[0]; // @[lsu_stbuf.scala 160:18]
  wire  _T_567 = stbuf_wr_en[1] | stbuf_vld[1]; // @[lsu_stbuf.scala 160:18]
  wire  _T_575 = stbuf_wr_en[2] | stbuf_vld[2]; // @[lsu_stbuf.scala 160:18]
  wire  _T_583 = stbuf_wr_en[3] | stbuf_vld[3]; // @[lsu_stbuf.scala 160:18]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[lsu_stbuf.scala 208:16]
  wire  _T_786 = stbuf_addr_3[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_788 = _T_786 & stbuf_vld[3]; // @[lsu_stbuf.scala 212:139]
  wire  _T_791 = _T_788 & _T_63; // @[lsu_stbuf.scala 212:154]
  wire  _T_792 = _T_791 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire  _T_777 = stbuf_addr_2[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_779 = _T_777 & stbuf_vld[2]; // @[lsu_stbuf.scala 212:139]
  wire  _T_782 = _T_779 & _T_52; // @[lsu_stbuf.scala 212:154]
  wire  _T_783 = _T_782 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire  _T_768 = stbuf_addr_1[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_770 = _T_768 & stbuf_vld[1]; // @[lsu_stbuf.scala 212:139]
  wire  _T_773 = _T_770 & _T_41; // @[lsu_stbuf.scala 212:154]
  wire  _T_774 = _T_773 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire  _T_759 = stbuf_addr_0[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_761 = _T_759 & stbuf_vld[0]; // @[lsu_stbuf.scala 212:139]
  wire  _T_764 = _T_761 & _T_30; // @[lsu_stbuf.scala 212:154]
  wire  _T_765 = _T_764 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire [3:0] stbuf_match_hi = {_T_792,_T_783,_T_774,_T_765}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[lsu_stbuf.scala 209:17]
  wire  _T_824 = stbuf_addr_3[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_826 = _T_824 & stbuf_vld[3]; // @[lsu_stbuf.scala 213:139]
  wire  _T_829 = _T_826 & _T_63; // @[lsu_stbuf.scala 213:154]
  wire  _T_830 = _T_829 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire  _T_815 = stbuf_addr_2[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_817 = _T_815 & stbuf_vld[2]; // @[lsu_stbuf.scala 213:139]
  wire  _T_820 = _T_817 & _T_52; // @[lsu_stbuf.scala 213:154]
  wire  _T_821 = _T_820 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire  _T_806 = stbuf_addr_1[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_808 = _T_806 & stbuf_vld[1]; // @[lsu_stbuf.scala 213:139]
  wire  _T_811 = _T_808 & _T_41; // @[lsu_stbuf.scala 213:154]
  wire  _T_812 = _T_811 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire  _T_797 = stbuf_addr_0[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_799 = _T_797 & stbuf_vld[0]; // @[lsu_stbuf.scala 213:139]
  wire  _T_802 = _T_799 & _T_30; // @[lsu_stbuf.scala 213:154]
  wire  _T_803 = _T_802 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire [3:0] stbuf_match_lo = {_T_830,_T_821,_T_812,_T_803}; // @[Cat.scala 29:58]
  wire  _T_853 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[lsu_stbuf.scala 214:78]
  wire  _T_854 = _T_853 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_855 = _T_854 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_856 = _T_855 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire  _T_847 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[lsu_stbuf.scala 214:78]
  wire  _T_848 = _T_847 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_849 = _T_848 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_850 = _T_849 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire  _T_841 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[lsu_stbuf.scala 214:78]
  wire  _T_842 = _T_841 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_843 = _T_842 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_844 = _T_843 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire  _T_835 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[lsu_stbuf.scala 214:78]
  wire  _T_836 = _T_835 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_837 = _T_836 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_838 = _T_837 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire [3:0] stbuf_dma_kill_en = {_T_856,_T_850,_T_844,_T_838}; // @[Cat.scala 29:58]
  wire  _T_594 = stbuf_dma_kill_en[0] | stbuf_dma_kill[0]; // @[lsu_stbuf.scala 163:18]
  wire  _T_602 = stbuf_dma_kill_en[1] | stbuf_dma_kill[1]; // @[lsu_stbuf.scala 163:18]
  wire  _T_610 = stbuf_dma_kill_en[2] | stbuf_dma_kill[2]; // @[lsu_stbuf.scala 163:18]
  wire  _T_618 = stbuf_dma_kill_en[3] | stbuf_dma_kill[3]; // @[lsu_stbuf.scala 163:18]
  wire [3:0] _T_628 = stbuf_wr_en[0] ? stbuf_byteenin_0 : stbuf_byteen_0; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_632 = _T_33 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_637 = stbuf_wr_en[1] ? stbuf_byteenin_1 : stbuf_byteen_1; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_641 = _T_44 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_646 = stbuf_wr_en[2] ? stbuf_byteenin_2 : stbuf_byteen_2; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_650 = _T_55 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_655 = stbuf_wr_en[3] ? stbuf_byteenin_3 : stbuf_byteen_3; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_659 = _T_66 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_686 = stbuf_vld >> RdPtr; // @[lsu_stbuf.scala 183:43]
  wire [3:0] _T_688 = stbuf_dma_kill >> RdPtr; // @[lsu_stbuf.scala 183:67]
  wire  _T_695 = ~_T_688[0]; // @[lsu_stbuf.scala 184:46]
  wire  _T_696 = _T_686[0] & _T_695; // @[lsu_stbuf.scala 184:44]
  wire  _T_697 = |stbuf_dma_kill_en; // @[lsu_stbuf.scala 184:91]
  wire  _T_698 = ~_T_697; // @[lsu_stbuf.scala 184:71]
  wire [15:0] _GEN_1 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[lsu_stbuf.scala 185:22]
  wire [15:0] _GEN_2 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_1; // @[lsu_stbuf.scala 185:22]
  wire [31:0] _GEN_5 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[lsu_stbuf.scala 186:22]
  wire [31:0] _GEN_6 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_5; // @[lsu_stbuf.scala 186:22]
  wire  _T_700 = ~dual_stbuf_write_r; // @[lsu_stbuf.scala 188:44]
  wire  _T_701 = io_ldst_stbuf_reqvld_r & _T_700; // @[lsu_stbuf.scala 188:42]
  wire  _T_702 = store_coalesce_hi_r | store_coalesce_lo_r; // @[lsu_stbuf.scala 188:88]
  wire  _T_703 = ~_T_702; // @[lsu_stbuf.scala 188:66]
  wire  _T_704 = _T_701 & _T_703; // @[lsu_stbuf.scala 188:64]
  wire  _T_705 = io_ldst_stbuf_reqvld_r & dual_stbuf_write_r; // @[lsu_stbuf.scala 189:30]
  wire  _T_706 = store_coalesce_hi_r & store_coalesce_lo_r; // @[lsu_stbuf.scala 189:76]
  wire  _T_707 = ~_T_706; // @[lsu_stbuf.scala 189:54]
  wire  _T_708 = _T_705 & _T_707; // @[lsu_stbuf.scala 189:52]
  wire  WrPtrEn = _T_704 | _T_708; // @[lsu_stbuf.scala 188:113]
  wire  _T_713 = _T_705 & _T_703; // @[lsu_stbuf.scala 190:67]
  wire [3:0] _T_718 = {3'h0,stbuf_vld[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_720 = {3'h0,stbuf_vld[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_722 = {3'h0,stbuf_vld[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_724 = {3'h0,stbuf_vld[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_727 = _T_718 + _T_720; // @[lsu_stbuf.scala 197:101]
  wire [3:0] _T_729 = _T_727 + _T_722; // @[lsu_stbuf.scala 197:101]
  wire [3:0] stbuf_numvld_any = _T_729 + _T_724; // @[lsu_stbuf.scala 197:101]
  wire  _T_731 = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 198:39]
  wire  _T_732 = _T_731 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 198:65]
  wire  _T_733 = ~io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 198:87]
  wire  isdccmst_m = _T_732 & _T_733; // @[lsu_stbuf.scala 198:85]
  wire  _T_734 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 199:39]
  wire  _T_735 = _T_734 & io_addr_in_dccm_r; // @[lsu_stbuf.scala 199:65]
  wire  _T_736 = ~io_lsu_pkt_r_bits_dma; // @[lsu_stbuf.scala 199:87]
  wire  isdccmst_r = _T_735 & _T_736; // @[lsu_stbuf.scala 199:85]
  wire [1:0] _T_737 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_738 = isdccmst_m & io_ldst_dual_m; // @[lsu_stbuf.scala 201:62]
  wire [2:0] _GEN_14 = {{1'd0}, _T_737}; // @[lsu_stbuf.scala 201:47]
  wire [2:0] _T_739 = _GEN_14 << _T_738; // @[lsu_stbuf.scala 201:47]
  wire [1:0] _T_740 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_741 = isdccmst_r & io_ldst_dual_r; // @[lsu_stbuf.scala 202:62]
  wire [2:0] _GEN_15 = {{1'd0}, _T_740}; // @[lsu_stbuf.scala 202:47]
  wire [2:0] _T_742 = _GEN_15 << _T_741; // @[lsu_stbuf.scala 202:47]
  wire [1:0] stbuf_specvld_m = _T_739[1:0]; // @[lsu_stbuf.scala 201:19]
  wire [3:0] _T_743 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_745 = stbuf_numvld_any + _T_743; // @[lsu_stbuf.scala 203:44]
  wire [1:0] stbuf_specvld_r = _T_742[1:0]; // @[lsu_stbuf.scala 202:19]
  wire [3:0] _T_746 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_745 + _T_746; // @[lsu_stbuf.scala 203:78]
  wire  _T_748 = ~io_ldst_dual_d; // @[lsu_stbuf.scala 205:34]
  wire  _T_749 = _T_748 & io_dec_lsu_valid_raw_d; // @[lsu_stbuf.scala 205:50]
  wire  _T_751 = stbuf_specvld_any >= 4'h4; // @[lsu_stbuf.scala 205:102]
  wire  _T_752 = stbuf_specvld_any >= 4'h3; // @[lsu_stbuf.scala 205:143]
  wire  _T_862 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_0 = _T_862 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_866 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_1 = _T_866 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_870 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_2 = _T_870 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_874 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_3 = _T_874 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_878 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_0 = _T_878 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_882 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_1 = _T_882 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_886 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_2 = _T_886 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_890 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_3 = _T_890 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_894 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_0 = _T_894 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_898 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_1 = _T_898 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_902 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_2 = _T_902 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_906 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_3 = _T_906 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_910 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_0 = _T_910 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_914 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_1 = _T_914 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_918 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_2 = _T_918 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_922 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_3 = _T_922 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_926 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_0 = _T_926 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_930 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_1 = _T_930 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_934 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_2 = _T_934 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_938 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_3 = _T_938 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_942 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_0 = _T_942 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_946 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_1 = _T_946 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_950 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_2 = _T_950 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_954 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_3 = _T_954 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_958 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_0 = _T_958 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_962 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_1 = _T_962 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_966 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_2 = _T_966 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_970 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_3 = _T_970 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_974 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_0 = _T_974 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_978 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_1 = _T_978 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_982 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_2 = _T_982 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_986 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_3 = _T_986 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_988 = stbuf_fwdbyteenvec_hi_0_0 | stbuf_fwdbyteenvec_hi_1_0; // @[lsu_stbuf.scala 219:147]
  wire  _T_989 = _T_988 | stbuf_fwdbyteenvec_hi_2_0; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_989 | stbuf_fwdbyteenvec_hi_3_0; // @[lsu_stbuf.scala 219:147]
  wire  _T_990 = stbuf_fwdbyteenvec_hi_0_1 | stbuf_fwdbyteenvec_hi_1_1; // @[lsu_stbuf.scala 219:147]
  wire  _T_991 = _T_990 | stbuf_fwdbyteenvec_hi_2_1; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_991 | stbuf_fwdbyteenvec_hi_3_1; // @[lsu_stbuf.scala 219:147]
  wire  _T_992 = stbuf_fwdbyteenvec_hi_0_2 | stbuf_fwdbyteenvec_hi_1_2; // @[lsu_stbuf.scala 219:147]
  wire  _T_993 = _T_992 | stbuf_fwdbyteenvec_hi_2_2; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_993 | stbuf_fwdbyteenvec_hi_3_2; // @[lsu_stbuf.scala 219:147]
  wire  _T_994 = stbuf_fwdbyteenvec_hi_0_3 | stbuf_fwdbyteenvec_hi_1_3; // @[lsu_stbuf.scala 219:147]
  wire  _T_995 = _T_994 | stbuf_fwdbyteenvec_hi_2_3; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_995 | stbuf_fwdbyteenvec_hi_3_3; // @[lsu_stbuf.scala 219:147]
  wire  _T_996 = stbuf_fwdbyteenvec_lo_0_0 | stbuf_fwdbyteenvec_lo_1_0; // @[lsu_stbuf.scala 220:147]
  wire  _T_997 = _T_996 | stbuf_fwdbyteenvec_lo_2_0; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_997 | stbuf_fwdbyteenvec_lo_3_0; // @[lsu_stbuf.scala 220:147]
  wire  _T_998 = stbuf_fwdbyteenvec_lo_0_1 | stbuf_fwdbyteenvec_lo_1_1; // @[lsu_stbuf.scala 220:147]
  wire  _T_999 = _T_998 | stbuf_fwdbyteenvec_lo_2_1; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_999 | stbuf_fwdbyteenvec_lo_3_1; // @[lsu_stbuf.scala 220:147]
  wire  _T_1000 = stbuf_fwdbyteenvec_lo_0_2 | stbuf_fwdbyteenvec_lo_1_2; // @[lsu_stbuf.scala 220:147]
  wire  _T_1001 = _T_1000 | stbuf_fwdbyteenvec_lo_2_2; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_1001 | stbuf_fwdbyteenvec_lo_3_2; // @[lsu_stbuf.scala 220:147]
  wire  _T_1002 = stbuf_fwdbyteenvec_lo_0_3 | stbuf_fwdbyteenvec_lo_1_3; // @[lsu_stbuf.scala 220:147]
  wire  _T_1003 = _T_1002 | stbuf_fwdbyteenvec_lo_2_3; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_1003 | stbuf_fwdbyteenvec_lo_3_3; // @[lsu_stbuf.scala 220:147]
  wire [31:0] _T_1006 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1007 = _T_1006 & stbuf_data_0; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1010 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1011 = _T_1010 & stbuf_data_1; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1014 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1015 = _T_1014 & stbuf_data_2; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1018 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1019 = _T_1018 & stbuf_data_3; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1021 = _T_1019 | _T_1015; // @[lsu_stbuf.scala 222:130]
  wire [31:0] _T_1022 = _T_1021 | _T_1011; // @[lsu_stbuf.scala 222:130]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_1022 | _T_1007; // @[lsu_stbuf.scala 222:130]
  wire [31:0] _T_1025 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1026 = _T_1025 & stbuf_data_0; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1029 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1030 = _T_1029 & stbuf_data_1; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1033 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1034 = _T_1033 & stbuf_data_2; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1037 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1038 = _T_1037 & stbuf_data_3; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1040 = _T_1038 | _T_1034; // @[lsu_stbuf.scala 223:130]
  wire [31:0] _T_1041 = _T_1040 | _T_1030; // @[lsu_stbuf.scala 223:130]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_1041 | _T_1026; // @[lsu_stbuf.scala 223:130]
  wire  _T_1046 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_stbuf.scala 230:49]
  wire  _T_1047 = _T_1046 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 230:74]
  wire  _T_1048 = _T_1047 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 230:95]
  wire  ld_addr_rhit_lo_lo = _T_1048 & _T_736; // @[lsu_stbuf.scala 230:121]
  wire  _T_1052 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_stbuf.scala 231:49]
  wire  _T_1053 = _T_1052 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 231:74]
  wire  _T_1054 = _T_1053 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 231:95]
  wire  ld_addr_rhit_lo_hi = _T_1054 & _T_736; // @[lsu_stbuf.scala 231:121]
  wire  _T_1058 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_stbuf.scala 232:49]
  wire  _T_1059 = _T_1058 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 232:74]
  wire  _T_1060 = _T_1059 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 232:95]
  wire  _T_1062 = _T_1060 & _T_736; // @[lsu_stbuf.scala 232:121]
  wire  ld_addr_rhit_hi_lo = _T_1062 & dual_stbuf_write_r; // @[lsu_stbuf.scala 232:146]
  wire  _T_1065 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_stbuf.scala 233:49]
  wire  _T_1066 = _T_1065 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 233:74]
  wire  _T_1067 = _T_1066 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 233:95]
  wire  _T_1069 = _T_1067 & _T_736; // @[lsu_stbuf.scala 233:121]
  wire  ld_addr_rhit_hi_hi = _T_1069 & dual_stbuf_write_r; // @[lsu_stbuf.scala 233:146]
  wire  _T_1071 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1073 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1075 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1077 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[lsu_stbuf.scala 235:79]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_1077,_T_1075,_T_1073,_T_1071}; // @[Cat.scala 29:58]
  wire  _T_1082 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[lsu_stbuf.scala 236:79]
  wire  _T_1084 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[lsu_stbuf.scala 236:79]
  wire  _T_1086 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[lsu_stbuf.scala 236:79]
  wire  _T_1088 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[lsu_stbuf.scala 236:79]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_1088,_T_1086,_T_1084,_T_1082}; // @[Cat.scala 29:58]
  wire  _T_1093 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[lsu_stbuf.scala 237:79]
  wire  _T_1095 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[lsu_stbuf.scala 237:79]
  wire  _T_1097 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[lsu_stbuf.scala 237:79]
  wire  _T_1099 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[lsu_stbuf.scala 237:79]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_1099,_T_1097,_T_1095,_T_1093}; // @[Cat.scala 29:58]
  wire  _T_1104 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[lsu_stbuf.scala 238:79]
  wire  _T_1106 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[lsu_stbuf.scala 238:79]
  wire  _T_1108 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[lsu_stbuf.scala 238:79]
  wire  _T_1110 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[lsu_stbuf.scala 238:79]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_1110,_T_1108,_T_1106,_T_1104}; // @[Cat.scala 29:58]
  wire  _T_1116 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[lsu_stbuf.scala 240:79]
  wire  _T_1119 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[lsu_stbuf.scala 240:79]
  wire  _T_1122 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[lsu_stbuf.scala 240:79]
  wire  _T_1125 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[lsu_stbuf.scala 240:79]
  wire [3:0] ld_byte_rhit_lo = {_T_1125,_T_1122,_T_1119,_T_1116}; // @[Cat.scala 29:58]
  wire  _T_1131 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[lsu_stbuf.scala 241:79]
  wire  _T_1134 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[lsu_stbuf.scala 241:79]
  wire  _T_1137 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[lsu_stbuf.scala 241:79]
  wire  _T_1140 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[lsu_stbuf.scala 241:79]
  wire [3:0] ld_byte_rhit_hi = {_T_1140,_T_1137,_T_1134,_T_1131}; // @[Cat.scala 29:58]
  wire [7:0] _T_1146 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1148 = _T_1146 & io_store_data_lo_r[7:0]; // @[lsu_stbuf.scala 243:53]
  wire [7:0] _T_1151 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1153 = _T_1151 & io_store_data_hi_r[7:0]; // @[lsu_stbuf.scala 243:114]
  wire [7:0] fwdpipe1_lo = _T_1148 | _T_1153; // @[lsu_stbuf.scala 243:80]
  wire [7:0] _T_1156 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1158 = _T_1156 & io_store_data_lo_r[15:8]; // @[lsu_stbuf.scala 244:53]
  wire [7:0] _T_1161 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1163 = _T_1161 & io_store_data_hi_r[15:8]; // @[lsu_stbuf.scala 244:115]
  wire [7:0] fwdpipe2_lo = _T_1158 | _T_1163; // @[lsu_stbuf.scala 244:81]
  wire [7:0] _T_1166 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1168 = _T_1166 & io_store_data_lo_r[23:16]; // @[lsu_stbuf.scala 245:53]
  wire [7:0] _T_1171 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1173 = _T_1171 & io_store_data_hi_r[23:16]; // @[lsu_stbuf.scala 245:116]
  wire [7:0] fwdpipe3_lo = _T_1168 | _T_1173; // @[lsu_stbuf.scala 245:82]
  wire [7:0] _T_1176 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1178 = _T_1176 & io_store_data_lo_r[31:24]; // @[lsu_stbuf.scala 246:53]
  wire [7:0] _T_1181 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1183 = _T_1181 & io_store_data_hi_r[31:24]; // @[lsu_stbuf.scala 246:116]
  wire [7:0] fwdpipe4_lo = _T_1178 | _T_1183; // @[lsu_stbuf.scala 246:82]
  wire [31:0] ld_fwddata_rpipe_lo = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1189 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1191 = _T_1189 & io_store_data_lo_r[7:0]; // @[lsu_stbuf.scala 249:53]
  wire [7:0] _T_1194 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1196 = _T_1194 & io_store_data_hi_r[7:0]; // @[lsu_stbuf.scala 249:114]
  wire [7:0] fwdpipe1_hi = _T_1191 | _T_1196; // @[lsu_stbuf.scala 249:80]
  wire [7:0] _T_1199 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1201 = _T_1199 & io_store_data_lo_r[15:8]; // @[lsu_stbuf.scala 250:53]
  wire [7:0] _T_1204 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1206 = _T_1204 & io_store_data_hi_r[15:8]; // @[lsu_stbuf.scala 250:115]
  wire [7:0] fwdpipe2_hi = _T_1201 | _T_1206; // @[lsu_stbuf.scala 250:81]
  wire [7:0] _T_1209 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1211 = _T_1209 & io_store_data_lo_r[23:16]; // @[lsu_stbuf.scala 251:53]
  wire [7:0] _T_1214 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1216 = _T_1214 & io_store_data_hi_r[23:16]; // @[lsu_stbuf.scala 251:116]
  wire [7:0] fwdpipe3_hi = _T_1211 | _T_1216; // @[lsu_stbuf.scala 251:82]
  wire [7:0] _T_1219 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1221 = _T_1219 & io_store_data_lo_r[31:24]; // @[lsu_stbuf.scala 252:53]
  wire [7:0] _T_1224 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1226 = _T_1224 & io_store_data_hi_r[31:24]; // @[lsu_stbuf.scala 252:116]
  wire [7:0] fwdpipe4_hi = _T_1221 | _T_1226; // @[lsu_stbuf.scala 252:82]
  wire [31:0] ld_fwddata_rpipe_hi = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire  _T_1261 = ld_byte_rhit_hi[0] | stbuf_fwdbyteen_hi_pre_m_0; // @[lsu_stbuf.scala 258:83]
  wire  _T_1263 = ld_byte_rhit_hi[1] | stbuf_fwdbyteen_hi_pre_m_1; // @[lsu_stbuf.scala 258:83]
  wire  _T_1265 = ld_byte_rhit_hi[2] | stbuf_fwdbyteen_hi_pre_m_2; // @[lsu_stbuf.scala 258:83]
  wire  _T_1267 = ld_byte_rhit_hi[3] | stbuf_fwdbyteen_hi_pre_m_3; // @[lsu_stbuf.scala 258:83]
  wire [2:0] _T_1269 = {_T_1267,_T_1265,_T_1263}; // @[Cat.scala 29:58]
  wire  _T_1272 = ld_byte_rhit_lo[0] | stbuf_fwdbyteen_lo_pre_m_0; // @[lsu_stbuf.scala 259:83]
  wire  _T_1274 = ld_byte_rhit_lo[1] | stbuf_fwdbyteen_lo_pre_m_1; // @[lsu_stbuf.scala 259:83]
  wire  _T_1276 = ld_byte_rhit_lo[2] | stbuf_fwdbyteen_lo_pre_m_2; // @[lsu_stbuf.scala 259:83]
  wire  _T_1278 = ld_byte_rhit_lo[3] | stbuf_fwdbyteen_lo_pre_m_3; // @[lsu_stbuf.scala 259:83]
  wire [2:0] _T_1280 = {_T_1278,_T_1276,_T_1274}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[lsu_stbuf.scala 262:30]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[lsu_stbuf.scala 263:30]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[lsu_stbuf.scala 264:30]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[lsu_stbuf.scala 265:30]
  wire [15:0] _T_1294 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1295 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[lsu_stbuf.scala 268:30]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[lsu_stbuf.scala 269:30]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[lsu_stbuf.scala 270:30]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[lsu_stbuf.scala 271:30]
  wire [15:0] _T_1309 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1310 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
  rvclkhdr rvclkhdr ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 377:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  assign io_stbuf_reqvld_any = _T_696 & _T_698; // @[lsu_stbuf.scala 51:47 lsu_stbuf.scala 184:24]
  assign io_stbuf_reqvld_flushed_any = _T_686[0] & _T_688[0]; // @[lsu_stbuf.scala 52:35 lsu_stbuf.scala 183:31]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_2; // @[lsu_stbuf.scala 53:35 lsu_stbuf.scala 185:22]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_6; // @[lsu_stbuf.scala 54:35 lsu_stbuf.scala 186:22]
  assign io_lsu_stbuf_full_any = _T_749 ? _T_751 : _T_752; // @[lsu_stbuf.scala 55:43 lsu_stbuf.scala 205:26]
  assign io_lsu_stbuf_empty_any = stbuf_numvld_any == 4'h0; // @[lsu_stbuf.scala 56:43 lsu_stbuf.scala 206:26]
  assign io_ldst_stbuf_reqvld_r = _T_22 & io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 57:43 lsu_stbuf.scala 125:26]
  assign io_stbuf_fwddata_hi_m = {_T_1310,_T_1309}; // @[lsu_stbuf.scala 58:43 lsu_stbuf.scala 272:25]
  assign io_stbuf_fwddata_lo_m = {_T_1295,_T_1294}; // @[lsu_stbuf.scala 59:43 lsu_stbuf.scala 266:25]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1269,_T_1261}; // @[lsu_stbuf.scala 60:37 lsu_stbuf.scala 258:27]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1280,_T_1272}; // @[lsu_stbuf.scala 61:37 lsu_stbuf.scala 259:27]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_io_en = stbuf_wr_en[0]; // @[lib.scala 380:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_1_io_en = stbuf_wr_en[0]; // @[lib.scala 380:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_2_io_en = stbuf_wr_en[1]; // @[lib.scala 380:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_3_io_en = stbuf_wr_en[1]; // @[lib.scala 380:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_4_io_en = stbuf_wr_en[2]; // @[lib.scala 380:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_5_io_en = stbuf_wr_en[2]; // @[lib.scala 380:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_6_io_en = stbuf_wr_en[3]; // @[lib.scala 380:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_7_io_en = stbuf_wr_en[3]; // @[lib.scala 380:17]
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
  RdPtr = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  WrPtr = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  stbuf_addr_0 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  _T_587 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_579 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_571 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_563 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_622 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_614 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_606 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_598 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stbuf_addr_1 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  stbuf_addr_2 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  stbuf_addr_3 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  stbuf_byteen_0 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stbuf_byteen_1 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  stbuf_byteen_2 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stbuf_byteen_3 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stbuf_data_0 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  stbuf_data_1 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  stbuf_data_2 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stbuf_data_3 = _RAND_21[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    RdPtr = 2'h0;
  end
  if (reset) begin
    WrPtr = 2'h0;
  end
  if (reset) begin
    stbuf_addr_0 = 16'h0;
  end
  if (reset) begin
    _T_587 = 1'h0;
  end
  if (reset) begin
    _T_579 = 1'h0;
  end
  if (reset) begin
    _T_571 = 1'h0;
  end
  if (reset) begin
    _T_563 = 1'h0;
  end
  if (reset) begin
    _T_622 = 1'h0;
  end
  if (reset) begin
    _T_614 = 1'h0;
  end
  if (reset) begin
    _T_606 = 1'h0;
  end
  if (reset) begin
    _T_598 = 1'h0;
  end
  if (reset) begin
    stbuf_addr_1 = 16'h0;
  end
  if (reset) begin
    stbuf_addr_2 = 16'h0;
  end
  if (reset) begin
    stbuf_addr_3 = 16'h0;
  end
  if (reset) begin
    stbuf_byteen_0 = 4'h0;
  end
  if (reset) begin
    stbuf_byteen_1 = 4'h0;
  end
  if (reset) begin
    stbuf_byteen_2 = 4'h0;
  end
  if (reset) begin
    stbuf_byteen_3 = 4'h0;
  end
  if (reset) begin
    stbuf_data_0 = 32'h0;
  end
  if (reset) begin
    stbuf_data_1 = 32'h0;
  end
  if (reset) begin
    stbuf_data_2 = 32'h0;
  end
  if (reset) begin
    stbuf_data_3 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      RdPtr <= 2'h0;
    end else if (_T_211) begin
      RdPtr <= RdPtrPlus1;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      WrPtr <= 2'h0;
    end else if (WrPtrEn) begin
      if (_T_713) begin
        WrPtr <= WrPtrPlus2;
      end else begin
        WrPtr <= WrPtrPlus1;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_0 <= 16'h0;
    end else if (sel_lo[0]) begin
      stbuf_addr_0 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_0 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_587 <= 1'h0;
    end else begin
      _T_587 <= _T_583 & _T_66;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_579 <= 1'h0;
    end else begin
      _T_579 <= _T_575 & _T_55;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_571 <= 1'h0;
    end else begin
      _T_571 <= _T_567 & _T_44;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_563 <= 1'h0;
    end else begin
      _T_563 <= _T_559 & _T_33;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_622 <= 1'h0;
    end else begin
      _T_622 <= _T_618 & _T_66;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_614 <= 1'h0;
    end else begin
      _T_614 <= _T_610 & _T_55;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_606 <= 1'h0;
    end else begin
      _T_606 <= _T_602 & _T_44;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_598 <= 1'h0;
    end else begin
      _T_598 <= _T_594 & _T_33;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_1 <= 16'h0;
    end else if (sel_lo[1]) begin
      stbuf_addr_1 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_1 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_2 <= 16'h0;
    end else if (sel_lo[2]) begin
      stbuf_addr_2 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_2 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_3 <= 16'h0;
    end else if (sel_lo[3]) begin
      stbuf_addr_3 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_3 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_0 <= 4'h0;
    end else begin
      stbuf_byteen_0 <= _T_628 & _T_632;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_1 <= 4'h0;
    end else begin
      stbuf_byteen_1 <= _T_637 & _T_641;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_2 <= 4'h0;
    end else begin
      stbuf_byteen_2 <= _T_646 & _T_650;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_3 <= 4'h0;
    end else begin
      stbuf_byteen_3 <= _T_655 & _T_659;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_0 <= 32'h0;
    end else begin
      stbuf_data_0 <= {_T_545,_T_544};
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_1 <= 32'h0;
    end else begin
      stbuf_data_1 <= {_T_548,_T_547};
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_2 <= 32'h0;
    end else begin
      stbuf_data_2 <= {_T_551,_T_550};
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_3 <= 32'h0;
    end else begin
      stbuf_data_3 <= {_T_554,_T_553};
    end
  end
endmodule
