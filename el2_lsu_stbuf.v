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
module el2_lsu_stbuf(
  input         clock,
  input         reset,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
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
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
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
  wire [1:0] _T_5 = io_lsu_pkt_r_bits_half ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_7 = io_lsu_pkt_r_bits_dword ? 8'hff : 8'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_10 = {{1'd0}, io_lsu_pkt_r_bits_by}; // @[Mux.scala 27:72]
  wire [1:0] _T_8 = _GEN_10 | _T_5; // @[Mux.scala 27:72]
  wire [3:0] _GEN_11 = {{2'd0}, _T_8}; // @[Mux.scala 27:72]
  wire [3:0] _T_9 = _GEN_11 | _T_6; // @[Mux.scala 27:72]
  wire [7:0] _GEN_12 = {{4'd0}, _T_9}; // @[Mux.scala 27:72]
  wire [7:0] ldst_byteen_r = _GEN_12 | _T_7; // @[Mux.scala 27:72]
  wire  ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[el2_lsu_stbuf.scala 117:39]
  reg  ldst_dual_r; // @[el2_lsu_stbuf.scala 171:52]
  wire  dual_stbuf_write_r = ldst_dual_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 118:40]
  wire [10:0] _GEN_13 = {{3'd0}, ldst_byteen_r}; // @[el2_lsu_stbuf.scala 120:39]
  wire [10:0] _T_14 = _GEN_13 << io_lsu_addr_r[1:0]; // @[el2_lsu_stbuf.scala 120:39]
  wire [7:0] store_byteen_ext_r = _T_14[7:0]; // @[el2_lsu_stbuf.scala 120:22]
  wire [3:0] _T_17 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_17; // @[el2_lsu_stbuf.scala 121:52]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_17; // @[el2_lsu_stbuf.scala 122:52]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] RdPtrPlus1 = RdPtr + 2'h1; // @[el2_lsu_stbuf.scala 124:26]
  reg [1:0] WrPtr; // @[Reg.scala 27:20]
  wire [1:0] WrPtrPlus1 = WrPtr + 2'h1; // @[el2_lsu_stbuf.scala 125:26]
  wire [1:0] WrPtrPlus2 = WrPtr + 2'h2; // @[el2_lsu_stbuf.scala 126:26]
  reg [15:0] stbuf_addr_0; // @[el2_lib.scala 514:16]
  wire  _T_27 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 130:120]
  reg  _T_588; // @[el2_lsu_stbuf.scala 163:88]
  reg  _T_580; // @[el2_lsu_stbuf.scala 163:88]
  reg  _T_572; // @[el2_lsu_stbuf.scala 163:88]
  reg  _T_564; // @[el2_lsu_stbuf.scala 163:88]
  wire [3:0] stbuf_vld = {_T_588,_T_580,_T_572,_T_564}; // @[Cat.scala 29:58]
  wire  _T_29 = _T_27 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 130:179]
  reg  _T_623; // @[el2_lsu_stbuf.scala 164:92]
  reg  _T_615; // @[el2_lsu_stbuf.scala 164:92]
  reg  _T_607; // @[el2_lsu_stbuf.scala 164:92]
  reg  _T_599; // @[el2_lsu_stbuf.scala 164:92]
  wire [3:0] stbuf_dma_kill = {_T_623,_T_615,_T_607,_T_599}; // @[Cat.scala 29:58]
  wire  _T_31 = ~stbuf_dma_kill[0]; // @[el2_lsu_stbuf.scala 130:197]
  wire  _T_32 = _T_29 & _T_31; // @[el2_lsu_stbuf.scala 130:195]
  wire  _T_212 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[el2_lsu_stbuf.scala 141:78]
  wire  _T_213 = 2'h3 == RdPtr; // @[el2_lsu_stbuf.scala 141:121]
  wire  _T_215 = _T_212 & _T_213; // @[el2_lsu_stbuf.scala 141:109]
  wire  _T_209 = 2'h2 == RdPtr; // @[el2_lsu_stbuf.scala 141:121]
  wire  _T_211 = _T_212 & _T_209; // @[el2_lsu_stbuf.scala 141:109]
  wire  _T_205 = 2'h1 == RdPtr; // @[el2_lsu_stbuf.scala 141:121]
  wire  _T_207 = _T_212 & _T_205; // @[el2_lsu_stbuf.scala 141:109]
  wire  _T_201 = 2'h0 == RdPtr; // @[el2_lsu_stbuf.scala 141:121]
  wire  _T_203 = _T_212 & _T_201; // @[el2_lsu_stbuf.scala 141:109]
  wire [3:0] stbuf_reset = {_T_215,_T_211,_T_207,_T_203}; // @[Cat.scala 29:58]
  wire  _T_34 = ~stbuf_reset[0]; // @[el2_lsu_stbuf.scala 130:218]
  wire  _T_35 = _T_32 & _T_34; // @[el2_lsu_stbuf.scala 130:216]
  reg [15:0] stbuf_addr_1; // @[el2_lib.scala 514:16]
  wire  _T_38 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 130:120]
  wire  _T_40 = _T_38 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 130:179]
  wire  _T_42 = ~stbuf_dma_kill[1]; // @[el2_lsu_stbuf.scala 130:197]
  wire  _T_43 = _T_40 & _T_42; // @[el2_lsu_stbuf.scala 130:195]
  wire  _T_45 = ~stbuf_reset[1]; // @[el2_lsu_stbuf.scala 130:218]
  wire  _T_46 = _T_43 & _T_45; // @[el2_lsu_stbuf.scala 130:216]
  reg [15:0] stbuf_addr_2; // @[el2_lib.scala 514:16]
  wire  _T_49 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 130:120]
  wire  _T_51 = _T_49 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 130:179]
  wire  _T_53 = ~stbuf_dma_kill[2]; // @[el2_lsu_stbuf.scala 130:197]
  wire  _T_54 = _T_51 & _T_53; // @[el2_lsu_stbuf.scala 130:195]
  wire  _T_56 = ~stbuf_reset[2]; // @[el2_lsu_stbuf.scala 130:218]
  wire  _T_57 = _T_54 & _T_56; // @[el2_lsu_stbuf.scala 130:216]
  reg [15:0] stbuf_addr_3; // @[el2_lib.scala 514:16]
  wire  _T_60 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 130:120]
  wire  _T_62 = _T_60 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 130:179]
  wire  _T_64 = ~stbuf_dma_kill[3]; // @[el2_lsu_stbuf.scala 130:197]
  wire  _T_65 = _T_62 & _T_64; // @[el2_lsu_stbuf.scala 130:195]
  wire  _T_67 = ~stbuf_reset[3]; // @[el2_lsu_stbuf.scala 130:218]
  wire  _T_68 = _T_65 & _T_67; // @[el2_lsu_stbuf.scala 130:216]
  wire [3:0] store_matchvec_lo_r = {_T_68,_T_57,_T_46,_T_35}; // @[Cat.scala 29:58]
  wire  _T_73 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_75 = _T_73 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_78 = _T_75 & _T_31; // @[el2_lsu_stbuf.scala 131:194]
  wire  _T_79 = _T_78 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:215]
  wire  _T_82 = _T_79 & _T_34; // @[el2_lsu_stbuf.scala 131:236]
  wire  _T_85 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_87 = _T_85 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_90 = _T_87 & _T_42; // @[el2_lsu_stbuf.scala 131:194]
  wire  _T_91 = _T_90 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:215]
  wire  _T_94 = _T_91 & _T_45; // @[el2_lsu_stbuf.scala 131:236]
  wire  _T_97 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_99 = _T_97 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_102 = _T_99 & _T_53; // @[el2_lsu_stbuf.scala 131:194]
  wire  _T_103 = _T_102 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:215]
  wire  _T_106 = _T_103 & _T_56; // @[el2_lsu_stbuf.scala 131:236]
  wire  _T_109 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_111 = _T_109 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_114 = _T_111 & _T_64; // @[el2_lsu_stbuf.scala 131:194]
  wire  _T_115 = _T_114 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:215]
  wire  _T_118 = _T_115 & _T_67; // @[el2_lsu_stbuf.scala 131:236]
  wire [3:0] store_matchvec_hi_r = {_T_118,_T_106,_T_94,_T_82}; // @[Cat.scala 29:58]
  wire  store_coalesce_lo_r = |store_matchvec_lo_r; // @[el2_lsu_stbuf.scala 133:49]
  wire  store_coalesce_hi_r = |store_matchvec_hi_r; // @[el2_lsu_stbuf.scala 134:49]
  wire  _T_121 = 2'h0 == WrPtr; // @[el2_lsu_stbuf.scala 137:16]
  wire  _T_122 = ~store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 137:29]
  wire  _T_123 = _T_121 & _T_122; // @[el2_lsu_stbuf.scala 137:27]
  wire  _T_125 = _T_121 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 138:29]
  wire  _T_126 = ~store_coalesce_hi_r; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_127 = _T_125 & _T_126; // @[el2_lsu_stbuf.scala 138:50]
  wire  _T_128 = _T_123 | _T_127; // @[el2_lsu_stbuf.scala 137:51]
  wire  _T_129 = 2'h0 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 139:18]
  wire  _T_130 = _T_129 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:34]
  wire  _T_131 = store_coalesce_lo_r | store_coalesce_hi_r; // @[el2_lsu_stbuf.scala 139:79]
  wire  _T_132 = ~_T_131; // @[el2_lsu_stbuf.scala 139:57]
  wire  _T_133 = _T_130 & _T_132; // @[el2_lsu_stbuf.scala 139:55]
  wire  _T_134 = _T_128 | _T_133; // @[el2_lsu_stbuf.scala 138:74]
  wire  _T_136 = _T_134 | store_matchvec_lo_r[0]; // @[el2_lsu_stbuf.scala 139:103]
  wire  _T_138 = _T_136 | store_matchvec_hi_r[0]; // @[el2_lsu_stbuf.scala 140:30]
  wire  _T_139 = io_ldst_stbuf_reqvld_r & _T_138; // @[el2_lsu_stbuf.scala 136:76]
  wire  _T_140 = 2'h1 == WrPtr; // @[el2_lsu_stbuf.scala 137:16]
  wire  _T_142 = _T_140 & _T_122; // @[el2_lsu_stbuf.scala 137:27]
  wire  _T_144 = _T_140 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 138:29]
  wire  _T_146 = _T_144 & _T_126; // @[el2_lsu_stbuf.scala 138:50]
  wire  _T_147 = _T_142 | _T_146; // @[el2_lsu_stbuf.scala 137:51]
  wire  _T_148 = 2'h1 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 139:18]
  wire  _T_149 = _T_148 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:34]
  wire  _T_152 = _T_149 & _T_132; // @[el2_lsu_stbuf.scala 139:55]
  wire  _T_153 = _T_147 | _T_152; // @[el2_lsu_stbuf.scala 138:74]
  wire  _T_155 = _T_153 | store_matchvec_lo_r[1]; // @[el2_lsu_stbuf.scala 139:103]
  wire  _T_157 = _T_155 | store_matchvec_hi_r[1]; // @[el2_lsu_stbuf.scala 140:30]
  wire  _T_158 = io_ldst_stbuf_reqvld_r & _T_157; // @[el2_lsu_stbuf.scala 136:76]
  wire  _T_159 = 2'h2 == WrPtr; // @[el2_lsu_stbuf.scala 137:16]
  wire  _T_161 = _T_159 & _T_122; // @[el2_lsu_stbuf.scala 137:27]
  wire  _T_163 = _T_159 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 138:29]
  wire  _T_165 = _T_163 & _T_126; // @[el2_lsu_stbuf.scala 138:50]
  wire  _T_166 = _T_161 | _T_165; // @[el2_lsu_stbuf.scala 137:51]
  wire  _T_167 = 2'h2 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 139:18]
  wire  _T_168 = _T_167 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:34]
  wire  _T_171 = _T_168 & _T_132; // @[el2_lsu_stbuf.scala 139:55]
  wire  _T_172 = _T_166 | _T_171; // @[el2_lsu_stbuf.scala 138:74]
  wire  _T_174 = _T_172 | store_matchvec_lo_r[2]; // @[el2_lsu_stbuf.scala 139:103]
  wire  _T_176 = _T_174 | store_matchvec_hi_r[2]; // @[el2_lsu_stbuf.scala 140:30]
  wire  _T_177 = io_ldst_stbuf_reqvld_r & _T_176; // @[el2_lsu_stbuf.scala 136:76]
  wire  _T_178 = 2'h3 == WrPtr; // @[el2_lsu_stbuf.scala 137:16]
  wire  _T_180 = _T_178 & _T_122; // @[el2_lsu_stbuf.scala 137:27]
  wire  _T_182 = _T_178 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 138:29]
  wire  _T_184 = _T_182 & _T_126; // @[el2_lsu_stbuf.scala 138:50]
  wire  _T_185 = _T_180 | _T_184; // @[el2_lsu_stbuf.scala 137:51]
  wire  _T_186 = 2'h3 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 139:18]
  wire  _T_187 = _T_186 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:34]
  wire  _T_190 = _T_187 & _T_132; // @[el2_lsu_stbuf.scala 139:55]
  wire  _T_191 = _T_185 | _T_190; // @[el2_lsu_stbuf.scala 138:74]
  wire  _T_193 = _T_191 | store_matchvec_lo_r[3]; // @[el2_lsu_stbuf.scala 139:103]
  wire  _T_195 = _T_193 | store_matchvec_hi_r[3]; // @[el2_lsu_stbuf.scala 140:30]
  wire  _T_196 = io_ldst_stbuf_reqvld_r & _T_195; // @[el2_lsu_stbuf.scala 136:76]
  wire [3:0] stbuf_wr_en = {_T_196,_T_177,_T_158,_T_139}; // @[Cat.scala 29:58]
  wire  _T_219 = ~ldst_dual_r; // @[el2_lsu_stbuf.scala 142:53]
  wire  _T_220 = _T_219 | io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 142:66]
  wire  _T_223 = _T_220 & _T_121; // @[el2_lsu_stbuf.scala 142:93]
  wire  _T_225 = _T_223 & _T_122; // @[el2_lsu_stbuf.scala 142:123]
  wire  _T_227 = _T_225 | store_matchvec_lo_r[0]; // @[el2_lsu_stbuf.scala 142:147]
  wire  _T_232 = _T_220 & _T_140; // @[el2_lsu_stbuf.scala 142:93]
  wire  _T_234 = _T_232 & _T_122; // @[el2_lsu_stbuf.scala 142:123]
  wire  _T_236 = _T_234 | store_matchvec_lo_r[1]; // @[el2_lsu_stbuf.scala 142:147]
  wire  _T_241 = _T_220 & _T_159; // @[el2_lsu_stbuf.scala 142:93]
  wire  _T_243 = _T_241 & _T_122; // @[el2_lsu_stbuf.scala 142:123]
  wire  _T_245 = _T_243 | store_matchvec_lo_r[2]; // @[el2_lsu_stbuf.scala 142:147]
  wire  _T_250 = _T_220 & _T_178; // @[el2_lsu_stbuf.scala 142:93]
  wire  _T_252 = _T_250 & _T_122; // @[el2_lsu_stbuf.scala 142:123]
  wire  _T_254 = _T_252 | store_matchvec_lo_r[3]; // @[el2_lsu_stbuf.scala 142:147]
  wire [3:0] sel_lo = {_T_254,_T_245,_T_236,_T_227}; // @[Cat.scala 29:58]
  reg [3:0] stbuf_byteen_0; // @[el2_lsu_stbuf.scala 165:92]
  wire [3:0] _T_274 = stbuf_byteen_0 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 145:86]
  wire [3:0] _T_275 = stbuf_byteen_0 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_0 = sel_lo[0] ? _T_274 : _T_275; // @[el2_lsu_stbuf.scala 145:58]
  reg [3:0] stbuf_byteen_1; // @[el2_lsu_stbuf.scala 165:92]
  wire [3:0] _T_278 = stbuf_byteen_1 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 145:86]
  wire [3:0] _T_279 = stbuf_byteen_1 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_1 = sel_lo[1] ? _T_278 : _T_279; // @[el2_lsu_stbuf.scala 145:58]
  reg [3:0] stbuf_byteen_2; // @[el2_lsu_stbuf.scala 165:92]
  wire [3:0] _T_282 = stbuf_byteen_2 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 145:86]
  wire [3:0] _T_283 = stbuf_byteen_2 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_2 = sel_lo[2] ? _T_282 : _T_283; // @[el2_lsu_stbuf.scala 145:58]
  reg [3:0] stbuf_byteen_3; // @[el2_lsu_stbuf.scala 165:92]
  wire [3:0] _T_286 = stbuf_byteen_3 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 145:86]
  wire [3:0] _T_287 = stbuf_byteen_3 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_3 = sel_lo[3] ? _T_286 : _T_287; // @[el2_lsu_stbuf.scala 145:58]
  wire  _T_291 = ~stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 147:67]
  wire  _T_293 = _T_291 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_0; // @[el2_lib.scala 514:16]
  wire [7:0] _T_296 = _T_293 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 147:66]
  wire  _T_300 = _T_291 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 148:29]
  wire [7:0] _T_303 = _T_300 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 148:8]
  wire [7:0] datain1_0 = sel_lo[0] ? _T_296 : _T_303; // @[el2_lsu_stbuf.scala 147:51]
  wire  _T_307 = ~stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 147:67]
  wire  _T_309 = _T_307 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_1; // @[el2_lib.scala 514:16]
  wire [7:0] _T_312 = _T_309 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 147:66]
  wire  _T_316 = _T_307 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 148:29]
  wire [7:0] _T_319 = _T_316 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 148:8]
  wire [7:0] datain1_1 = sel_lo[1] ? _T_312 : _T_319; // @[el2_lsu_stbuf.scala 147:51]
  wire  _T_323 = ~stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 147:67]
  wire  _T_325 = _T_323 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_2; // @[el2_lib.scala 514:16]
  wire [7:0] _T_328 = _T_325 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 147:66]
  wire  _T_332 = _T_323 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 148:29]
  wire [7:0] _T_335 = _T_332 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 148:8]
  wire [7:0] datain1_2 = sel_lo[2] ? _T_328 : _T_335; // @[el2_lsu_stbuf.scala 147:51]
  wire  _T_339 = ~stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 147:67]
  wire  _T_341 = _T_339 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_3; // @[el2_lib.scala 514:16]
  wire [7:0] _T_344 = _T_341 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 147:66]
  wire  _T_348 = _T_339 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 148:29]
  wire [7:0] _T_351 = _T_348 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 148:8]
  wire [7:0] datain1_3 = sel_lo[3] ? _T_344 : _T_351; // @[el2_lsu_stbuf.scala 147:51]
  wire  _T_355 = ~stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 150:68]
  wire  _T_357 = _T_355 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 150:88]
  wire [7:0] _T_360 = _T_357 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 150:67]
  wire  _T_364 = _T_355 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 151:29]
  wire [7:0] _T_367 = _T_364 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 151:8]
  wire [7:0] datain2_0 = sel_lo[0] ? _T_360 : _T_367; // @[el2_lsu_stbuf.scala 150:52]
  wire  _T_371 = ~stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 150:68]
  wire  _T_373 = _T_371 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 150:88]
  wire [7:0] _T_376 = _T_373 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 150:67]
  wire  _T_380 = _T_371 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 151:29]
  wire [7:0] _T_383 = _T_380 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 151:8]
  wire [7:0] datain2_1 = sel_lo[1] ? _T_376 : _T_383; // @[el2_lsu_stbuf.scala 150:52]
  wire  _T_387 = ~stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 150:68]
  wire  _T_389 = _T_387 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 150:88]
  wire [7:0] _T_392 = _T_389 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 150:67]
  wire  _T_396 = _T_387 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 151:29]
  wire [7:0] _T_399 = _T_396 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 151:8]
  wire [7:0] datain2_2 = sel_lo[2] ? _T_392 : _T_399; // @[el2_lsu_stbuf.scala 150:52]
  wire  _T_403 = ~stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 150:68]
  wire  _T_405 = _T_403 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 150:88]
  wire [7:0] _T_408 = _T_405 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 150:67]
  wire  _T_412 = _T_403 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 151:29]
  wire [7:0] _T_415 = _T_412 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 151:8]
  wire [7:0] datain2_3 = sel_lo[3] ? _T_408 : _T_415; // @[el2_lsu_stbuf.scala 150:52]
  wire  _T_419 = ~stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 153:68]
  wire  _T_421 = _T_419 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 153:88]
  wire [7:0] _T_424 = _T_421 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 153:67]
  wire  _T_428 = _T_419 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 154:29]
  wire [7:0] _T_431 = _T_428 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 154:8]
  wire [7:0] datain3_0 = sel_lo[0] ? _T_424 : _T_431; // @[el2_lsu_stbuf.scala 153:52]
  wire  _T_435 = ~stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 153:68]
  wire  _T_437 = _T_435 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 153:88]
  wire [7:0] _T_440 = _T_437 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 153:67]
  wire  _T_444 = _T_435 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 154:29]
  wire [7:0] _T_447 = _T_444 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 154:8]
  wire [7:0] datain3_1 = sel_lo[1] ? _T_440 : _T_447; // @[el2_lsu_stbuf.scala 153:52]
  wire  _T_451 = ~stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 153:68]
  wire  _T_453 = _T_451 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 153:88]
  wire [7:0] _T_456 = _T_453 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 153:67]
  wire  _T_460 = _T_451 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 154:29]
  wire [7:0] _T_463 = _T_460 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 154:8]
  wire [7:0] datain3_2 = sel_lo[2] ? _T_456 : _T_463; // @[el2_lsu_stbuf.scala 153:52]
  wire  _T_467 = ~stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 153:68]
  wire  _T_469 = _T_467 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 153:88]
  wire [7:0] _T_472 = _T_469 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 153:67]
  wire  _T_476 = _T_467 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 154:29]
  wire [7:0] _T_479 = _T_476 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 154:8]
  wire [7:0] datain3_3 = sel_lo[3] ? _T_472 : _T_479; // @[el2_lsu_stbuf.scala 153:52]
  wire  _T_483 = ~stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 156:68]
  wire  _T_485 = _T_483 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 156:88]
  wire [7:0] _T_488 = _T_485 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 156:67]
  wire  _T_492 = _T_483 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 157:29]
  wire [7:0] _T_495 = _T_492 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 157:8]
  wire [7:0] datain4_0 = sel_lo[0] ? _T_488 : _T_495; // @[el2_lsu_stbuf.scala 156:52]
  wire  _T_499 = ~stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 156:68]
  wire  _T_501 = _T_499 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 156:88]
  wire [7:0] _T_504 = _T_501 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 156:67]
  wire  _T_508 = _T_499 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 157:29]
  wire [7:0] _T_511 = _T_508 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 157:8]
  wire [7:0] datain4_1 = sel_lo[1] ? _T_504 : _T_511; // @[el2_lsu_stbuf.scala 156:52]
  wire  _T_515 = ~stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 156:68]
  wire  _T_517 = _T_515 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 156:88]
  wire [7:0] _T_520 = _T_517 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 156:67]
  wire  _T_524 = _T_515 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 157:29]
  wire [7:0] _T_527 = _T_524 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 157:8]
  wire [7:0] datain4_2 = sel_lo[2] ? _T_520 : _T_527; // @[el2_lsu_stbuf.scala 156:52]
  wire  _T_531 = ~stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 156:68]
  wire  _T_533 = _T_531 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 156:88]
  wire [7:0] _T_536 = _T_533 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 156:67]
  wire  _T_540 = _T_531 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 157:29]
  wire [7:0] _T_543 = _T_540 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 157:8]
  wire [7:0] datain4_3 = sel_lo[3] ? _T_536 : _T_543; // @[el2_lsu_stbuf.scala 156:52]
  wire [15:0] _T_545 = {datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_546 = {datain4_0,datain3_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_548 = {datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_549 = {datain4_1,datain3_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_551 = {datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_552 = {datain4_2,datain3_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_554 = {datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire [15:0] _T_555 = {datain4_3,datain3_3}; // @[Cat.scala 29:58]
  wire  _T_560 = stbuf_wr_en[0] | stbuf_vld[0]; // @[el2_lsu_stbuf.scala 163:92]
  wire  _T_568 = stbuf_wr_en[1] | stbuf_vld[1]; // @[el2_lsu_stbuf.scala 163:92]
  wire  _T_576 = stbuf_wr_en[2] | stbuf_vld[2]; // @[el2_lsu_stbuf.scala 163:92]
  wire  _T_584 = stbuf_wr_en[3] | stbuf_vld[3]; // @[el2_lsu_stbuf.scala 163:92]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 200:16]
  wire  _T_789 = stbuf_addr_3[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 206:115]
  wire  _T_791 = _T_789 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 206:139]
  wire  _T_794 = _T_791 & _T_64; // @[el2_lsu_stbuf.scala 206:154]
  wire  _T_795 = _T_794 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 206:175]
  wire  _T_780 = stbuf_addr_2[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 206:115]
  wire  _T_782 = _T_780 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 206:139]
  wire  _T_785 = _T_782 & _T_53; // @[el2_lsu_stbuf.scala 206:154]
  wire  _T_786 = _T_785 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 206:175]
  wire  _T_771 = stbuf_addr_1[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 206:115]
  wire  _T_773 = _T_771 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 206:139]
  wire  _T_776 = _T_773 & _T_42; // @[el2_lsu_stbuf.scala 206:154]
  wire  _T_777 = _T_776 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 206:175]
  wire  _T_762 = stbuf_addr_0[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 206:115]
  wire  _T_764 = _T_762 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 206:139]
  wire  _T_767 = _T_764 & _T_31; // @[el2_lsu_stbuf.scala 206:154]
  wire  _T_768 = _T_767 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 206:175]
  wire [3:0] stbuf_match_hi = {_T_795,_T_786,_T_777,_T_768}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 203:17]
  wire  _T_827 = stbuf_addr_3[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 207:115]
  wire  _T_829 = _T_827 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 207:139]
  wire  _T_832 = _T_829 & _T_64; // @[el2_lsu_stbuf.scala 207:154]
  wire  _T_833 = _T_832 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 207:175]
  wire  _T_818 = stbuf_addr_2[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 207:115]
  wire  _T_820 = _T_818 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 207:139]
  wire  _T_823 = _T_820 & _T_53; // @[el2_lsu_stbuf.scala 207:154]
  wire  _T_824 = _T_823 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 207:175]
  wire  _T_809 = stbuf_addr_1[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 207:115]
  wire  _T_811 = _T_809 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 207:139]
  wire  _T_814 = _T_811 & _T_42; // @[el2_lsu_stbuf.scala 207:154]
  wire  _T_815 = _T_814 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 207:175]
  wire  _T_800 = stbuf_addr_0[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 207:115]
  wire  _T_802 = _T_800 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 207:139]
  wire  _T_805 = _T_802 & _T_31; // @[el2_lsu_stbuf.scala 207:154]
  wire  _T_806 = _T_805 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 207:175]
  wire [3:0] stbuf_match_lo = {_T_833,_T_824,_T_815,_T_806}; // @[Cat.scala 29:58]
  wire  _T_856 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[el2_lsu_stbuf.scala 208:78]
  wire  _T_857 = _T_856 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 208:99]
  wire  _T_858 = _T_857 & io_lsu_pkt_m_bits_dma; // @[el2_lsu_stbuf.scala 208:120]
  wire  _T_859 = _T_858 & io_lsu_pkt_m_bits_store; // @[el2_lsu_stbuf.scala 208:144]
  wire  _T_850 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[el2_lsu_stbuf.scala 208:78]
  wire  _T_851 = _T_850 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 208:99]
  wire  _T_852 = _T_851 & io_lsu_pkt_m_bits_dma; // @[el2_lsu_stbuf.scala 208:120]
  wire  _T_853 = _T_852 & io_lsu_pkt_m_bits_store; // @[el2_lsu_stbuf.scala 208:144]
  wire  _T_844 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[el2_lsu_stbuf.scala 208:78]
  wire  _T_845 = _T_844 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 208:99]
  wire  _T_846 = _T_845 & io_lsu_pkt_m_bits_dma; // @[el2_lsu_stbuf.scala 208:120]
  wire  _T_847 = _T_846 & io_lsu_pkt_m_bits_store; // @[el2_lsu_stbuf.scala 208:144]
  wire  _T_838 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[el2_lsu_stbuf.scala 208:78]
  wire  _T_839 = _T_838 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 208:99]
  wire  _T_840 = _T_839 & io_lsu_pkt_m_bits_dma; // @[el2_lsu_stbuf.scala 208:120]
  wire  _T_841 = _T_840 & io_lsu_pkt_m_bits_store; // @[el2_lsu_stbuf.scala 208:144]
  wire [3:0] stbuf_dma_kill_en = {_T_859,_T_853,_T_847,_T_841}; // @[Cat.scala 29:58]
  wire  _T_595 = stbuf_dma_kill_en[0] | stbuf_dma_kill[0]; // @[el2_lsu_stbuf.scala 164:96]
  wire  _T_603 = stbuf_dma_kill_en[1] | stbuf_dma_kill[1]; // @[el2_lsu_stbuf.scala 164:96]
  wire  _T_611 = stbuf_dma_kill_en[2] | stbuf_dma_kill[2]; // @[el2_lsu_stbuf.scala 164:96]
  wire  _T_619 = stbuf_dma_kill_en[3] | stbuf_dma_kill[3]; // @[el2_lsu_stbuf.scala 164:96]
  wire [3:0] _T_629 = stbuf_wr_en[0] ? stbuf_byteenin_0 : stbuf_byteen_0; // @[el2_lsu_stbuf.scala 165:96]
  wire [3:0] _T_633 = _T_34 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_638 = stbuf_wr_en[1] ? stbuf_byteenin_1 : stbuf_byteen_1; // @[el2_lsu_stbuf.scala 165:96]
  wire [3:0] _T_642 = _T_45 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_647 = stbuf_wr_en[2] ? stbuf_byteenin_2 : stbuf_byteen_2; // @[el2_lsu_stbuf.scala 165:96]
  wire [3:0] _T_651 = _T_56 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_656 = stbuf_wr_en[3] ? stbuf_byteenin_3 : stbuf_byteen_3; // @[el2_lsu_stbuf.scala 165:96]
  wire [3:0] _T_660 = _T_67 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg  ldst_dual_m; // @[el2_lsu_stbuf.scala 170:52]
  wire [3:0] _T_689 = stbuf_vld >> RdPtr; // @[el2_lsu_stbuf.scala 174:43]
  wire [3:0] _T_691 = stbuf_dma_kill >> RdPtr; // @[el2_lsu_stbuf.scala 174:67]
  wire  _T_698 = ~_T_691[0]; // @[el2_lsu_stbuf.scala 175:46]
  wire  _T_699 = _T_689[0] & _T_698; // @[el2_lsu_stbuf.scala 175:44]
  wire  _T_700 = |stbuf_dma_kill_en; // @[el2_lsu_stbuf.scala 175:91]
  wire  _T_701 = ~_T_700; // @[el2_lsu_stbuf.scala 175:71]
  wire [15:0] _GEN_1 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[el2_lsu_stbuf.scala 176:22]
  wire [15:0] _GEN_2 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_1; // @[el2_lsu_stbuf.scala 176:22]
  wire [31:0] _GEN_5 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[el2_lsu_stbuf.scala 177:22]
  wire [31:0] _GEN_6 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_5; // @[el2_lsu_stbuf.scala 177:22]
  wire  _T_703 = ~dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 179:44]
  wire  _T_704 = io_ldst_stbuf_reqvld_r & _T_703; // @[el2_lsu_stbuf.scala 179:42]
  wire  _T_705 = store_coalesce_hi_r | store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 179:88]
  wire  _T_706 = ~_T_705; // @[el2_lsu_stbuf.scala 179:66]
  wire  _T_707 = _T_704 & _T_706; // @[el2_lsu_stbuf.scala 179:64]
  wire  _T_708 = io_ldst_stbuf_reqvld_r & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 180:30]
  wire  _T_709 = store_coalesce_hi_r & store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 180:76]
  wire  _T_710 = ~_T_709; // @[el2_lsu_stbuf.scala 180:54]
  wire  _T_711 = _T_708 & _T_710; // @[el2_lsu_stbuf.scala 180:52]
  wire  WrPtrEn = _T_707 | _T_711; // @[el2_lsu_stbuf.scala 179:113]
  wire  _T_716 = _T_708 & _T_706; // @[el2_lsu_stbuf.scala 181:67]
  wire [3:0] _T_721 = {3'h0,stbuf_vld[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_723 = {3'h0,stbuf_vld[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_725 = {3'h0,stbuf_vld[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_727 = {3'h0,stbuf_vld[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_730 = _T_721 + _T_723; // @[el2_lsu_stbuf.scala 188:101]
  wire [3:0] _T_732 = _T_730 + _T_725; // @[el2_lsu_stbuf.scala 188:101]
  wire [3:0] stbuf_numvld_any = _T_732 + _T_727; // @[el2_lsu_stbuf.scala 188:101]
  wire  _T_734 = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_store; // @[el2_lsu_stbuf.scala 189:39]
  wire  _T_735 = _T_734 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 189:65]
  wire  _T_736 = ~io_lsu_pkt_m_bits_dma; // @[el2_lsu_stbuf.scala 189:87]
  wire  isdccmst_m = _T_735 & _T_736; // @[el2_lsu_stbuf.scala 189:85]
  wire  _T_737 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[el2_lsu_stbuf.scala 190:39]
  wire  _T_738 = _T_737 & io_addr_in_dccm_r; // @[el2_lsu_stbuf.scala 190:65]
  wire  _T_739 = ~io_lsu_pkt_r_bits_dma; // @[el2_lsu_stbuf.scala 190:87]
  wire  isdccmst_r = _T_738 & _T_739; // @[el2_lsu_stbuf.scala 190:85]
  wire [1:0] _T_740 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_741 = isdccmst_m & ldst_dual_m; // @[el2_lsu_stbuf.scala 192:62]
  wire [2:0] _GEN_14 = {{1'd0}, _T_740}; // @[el2_lsu_stbuf.scala 192:47]
  wire [2:0] _T_742 = _GEN_14 << _T_741; // @[el2_lsu_stbuf.scala 192:47]
  wire [1:0] _T_743 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_744 = isdccmst_r & ldst_dual_r; // @[el2_lsu_stbuf.scala 193:62]
  wire [2:0] _GEN_15 = {{1'd0}, _T_743}; // @[el2_lsu_stbuf.scala 193:47]
  wire [2:0] _T_745 = _GEN_15 << _T_744; // @[el2_lsu_stbuf.scala 193:47]
  wire [1:0] stbuf_specvld_m = _T_742[1:0]; // @[el2_lsu_stbuf.scala 192:19]
  wire [3:0] _T_746 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_748 = stbuf_numvld_any + _T_746; // @[el2_lsu_stbuf.scala 194:44]
  wire [1:0] stbuf_specvld_r = _T_745[1:0]; // @[el2_lsu_stbuf.scala 193:19]
  wire [3:0] _T_749 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_748 + _T_749; // @[el2_lsu_stbuf.scala 194:78]
  wire  _T_751 = ~ldst_dual_d; // @[el2_lsu_stbuf.scala 196:34]
  wire  _T_752 = _T_751 & io_dec_lsu_valid_raw_d; // @[el2_lsu_stbuf.scala 196:47]
  wire  _T_754 = stbuf_specvld_any >= 4'h4; // @[el2_lsu_stbuf.scala 196:99]
  wire  _T_755 = stbuf_specvld_any >= 4'h3; // @[el2_lsu_stbuf.scala 196:140]
  wire  _T_865 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_0 = _T_865 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_869 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_1 = _T_869 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_873 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_2 = _T_873 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_877 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_3 = _T_877 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_881 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_0 = _T_881 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_885 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_1 = _T_885 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_889 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_2 = _T_889 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_893 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_3 = _T_893 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_897 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_0 = _T_897 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_901 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_1 = _T_901 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_905 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_2 = _T_905 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_909 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_3 = _T_909 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_913 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_0 = _T_913 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_917 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_1 = _T_917 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_921 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_2 = _T_921 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_925 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_3 = _T_925 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 211:137]
  wire  _T_929 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_0 = _T_929 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_933 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_1 = _T_933 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_937 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_2 = _T_937 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_941 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_3 = _T_941 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_945 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_0 = _T_945 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_949 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_1 = _T_949 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_953 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_2 = _T_953 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_957 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_3 = _T_957 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_961 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_0 = _T_961 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_965 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_1 = _T_965 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_969 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_2 = _T_969 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_973 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_3 = _T_973 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_977 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_0 = _T_977 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_981 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_1 = _T_981 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_985 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_2 = _T_985 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_989 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_3 = _T_989 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_991 = stbuf_fwdbyteenvec_hi_0_0 | stbuf_fwdbyteenvec_hi_1_0; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_992 = _T_991 | stbuf_fwdbyteenvec_hi_2_0; // @[el2_lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_992 | stbuf_fwdbyteenvec_hi_3_0; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_993 = stbuf_fwdbyteenvec_hi_0_1 | stbuf_fwdbyteenvec_hi_1_1; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_994 = _T_993 | stbuf_fwdbyteenvec_hi_2_1; // @[el2_lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_994 | stbuf_fwdbyteenvec_hi_3_1; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_995 = stbuf_fwdbyteenvec_hi_0_2 | stbuf_fwdbyteenvec_hi_1_2; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_996 = _T_995 | stbuf_fwdbyteenvec_hi_2_2; // @[el2_lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_996 | stbuf_fwdbyteenvec_hi_3_2; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_997 = stbuf_fwdbyteenvec_hi_0_3 | stbuf_fwdbyteenvec_hi_1_3; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_998 = _T_997 | stbuf_fwdbyteenvec_hi_2_3; // @[el2_lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_998 | stbuf_fwdbyteenvec_hi_3_3; // @[el2_lsu_stbuf.scala 213:147]
  wire  _T_999 = stbuf_fwdbyteenvec_lo_0_0 | stbuf_fwdbyteenvec_lo_1_0; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1000 = _T_999 | stbuf_fwdbyteenvec_lo_2_0; // @[el2_lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_1000 | stbuf_fwdbyteenvec_lo_3_0; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1001 = stbuf_fwdbyteenvec_lo_0_1 | stbuf_fwdbyteenvec_lo_1_1; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1002 = _T_1001 | stbuf_fwdbyteenvec_lo_2_1; // @[el2_lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_1002 | stbuf_fwdbyteenvec_lo_3_1; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1003 = stbuf_fwdbyteenvec_lo_0_2 | stbuf_fwdbyteenvec_lo_1_2; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1004 = _T_1003 | stbuf_fwdbyteenvec_lo_2_2; // @[el2_lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_1004 | stbuf_fwdbyteenvec_lo_3_2; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1005 = stbuf_fwdbyteenvec_lo_0_3 | stbuf_fwdbyteenvec_lo_1_3; // @[el2_lsu_stbuf.scala 214:147]
  wire  _T_1006 = _T_1005 | stbuf_fwdbyteenvec_lo_2_3; // @[el2_lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_1006 | stbuf_fwdbyteenvec_lo_3_3; // @[el2_lsu_stbuf.scala 214:147]
  wire [31:0] _T_1009 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1010 = _T_1009 & stbuf_data_0; // @[el2_lsu_stbuf.scala 216:97]
  wire [31:0] _T_1013 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1014 = _T_1013 & stbuf_data_1; // @[el2_lsu_stbuf.scala 216:97]
  wire [31:0] _T_1017 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1018 = _T_1017 & stbuf_data_2; // @[el2_lsu_stbuf.scala 216:97]
  wire [31:0] _T_1021 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1022 = _T_1021 & stbuf_data_3; // @[el2_lsu_stbuf.scala 216:97]
  wire [31:0] _T_1024 = _T_1022 | _T_1018; // @[el2_lsu_stbuf.scala 216:130]
  wire [31:0] _T_1025 = _T_1024 | _T_1014; // @[el2_lsu_stbuf.scala 216:130]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_1025 | _T_1010; // @[el2_lsu_stbuf.scala 216:130]
  wire [31:0] _T_1028 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1029 = _T_1028 & stbuf_data_0; // @[el2_lsu_stbuf.scala 217:97]
  wire [31:0] _T_1032 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1033 = _T_1032 & stbuf_data_1; // @[el2_lsu_stbuf.scala 217:97]
  wire [31:0] _T_1036 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1037 = _T_1036 & stbuf_data_2; // @[el2_lsu_stbuf.scala 217:97]
  wire [31:0] _T_1040 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1041 = _T_1040 & stbuf_data_3; // @[el2_lsu_stbuf.scala 217:97]
  wire [31:0] _T_1043 = _T_1041 | _T_1037; // @[el2_lsu_stbuf.scala 217:130]
  wire [31:0] _T_1044 = _T_1043 | _T_1033; // @[el2_lsu_stbuf.scala 217:130]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_1044 | _T_1029; // @[el2_lsu_stbuf.scala 217:130]
  wire  _T_1049 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 224:49]
  wire  _T_1050 = _T_1049 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 224:74]
  wire  _T_1051 = _T_1050 & io_lsu_pkt_r_bits_store; // @[el2_lsu_stbuf.scala 224:95]
  wire  ld_addr_rhit_lo_lo = _T_1051 & _T_739; // @[el2_lsu_stbuf.scala 224:121]
  wire  _T_1055 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 225:49]
  wire  _T_1056 = _T_1055 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 225:74]
  wire  _T_1057 = _T_1056 & io_lsu_pkt_r_bits_store; // @[el2_lsu_stbuf.scala 225:95]
  wire  ld_addr_rhit_lo_hi = _T_1057 & _T_739; // @[el2_lsu_stbuf.scala 225:121]
  wire  _T_1061 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 226:49]
  wire  _T_1062 = _T_1061 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 226:74]
  wire  _T_1063 = _T_1062 & io_lsu_pkt_r_bits_store; // @[el2_lsu_stbuf.scala 226:95]
  wire  _T_1065 = _T_1063 & _T_739; // @[el2_lsu_stbuf.scala 226:121]
  wire  ld_addr_rhit_hi_lo = _T_1065 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 226:146]
  wire  _T_1068 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 227:49]
  wire  _T_1069 = _T_1068 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 227:74]
  wire  _T_1070 = _T_1069 & io_lsu_pkt_r_bits_store; // @[el2_lsu_stbuf.scala 227:95]
  wire  _T_1072 = _T_1070 & _T_739; // @[el2_lsu_stbuf.scala 227:121]
  wire  ld_addr_rhit_hi_hi = _T_1072 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 227:146]
  wire  _T_1074 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 229:79]
  wire  _T_1076 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 229:79]
  wire  _T_1078 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 229:79]
  wire  _T_1080 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 229:79]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_1080,_T_1078,_T_1076,_T_1074}; // @[Cat.scala 29:58]
  wire  _T_1085 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 230:79]
  wire  _T_1087 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 230:79]
  wire  _T_1089 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 230:79]
  wire  _T_1091 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 230:79]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_1091,_T_1089,_T_1087,_T_1085}; // @[Cat.scala 29:58]
  wire  _T_1096 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 231:79]
  wire  _T_1098 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 231:79]
  wire  _T_1100 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 231:79]
  wire  _T_1102 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 231:79]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_1102,_T_1100,_T_1098,_T_1096}; // @[Cat.scala 29:58]
  wire  _T_1107 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 232:79]
  wire  _T_1109 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 232:79]
  wire  _T_1111 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 232:79]
  wire  _T_1113 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 232:79]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_1113,_T_1111,_T_1109,_T_1107}; // @[Cat.scala 29:58]
  wire  _T_1119 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[el2_lsu_stbuf.scala 234:79]
  wire  _T_1122 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[el2_lsu_stbuf.scala 234:79]
  wire  _T_1125 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[el2_lsu_stbuf.scala 234:79]
  wire  _T_1128 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[el2_lsu_stbuf.scala 234:79]
  wire [3:0] ld_byte_rhit_lo = {_T_1128,_T_1125,_T_1122,_T_1119}; // @[Cat.scala 29:58]
  wire  _T_1134 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[el2_lsu_stbuf.scala 235:79]
  wire  _T_1137 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[el2_lsu_stbuf.scala 235:79]
  wire  _T_1140 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[el2_lsu_stbuf.scala 235:79]
  wire  _T_1143 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[el2_lsu_stbuf.scala 235:79]
  wire [3:0] ld_byte_rhit_hi = {_T_1143,_T_1140,_T_1137,_T_1134}; // @[Cat.scala 29:58]
  wire [7:0] _T_1149 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1151 = _T_1149 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 237:53]
  wire [7:0] _T_1154 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1156 = _T_1154 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 237:114]
  wire [7:0] fwdpipe1_lo = _T_1151 | _T_1156; // @[el2_lsu_stbuf.scala 237:80]
  wire [7:0] _T_1159 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1161 = _T_1159 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 238:53]
  wire [7:0] _T_1164 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1166 = _T_1164 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 238:115]
  wire [7:0] fwdpipe2_lo = _T_1161 | _T_1166; // @[el2_lsu_stbuf.scala 238:81]
  wire [7:0] _T_1169 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1171 = _T_1169 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 239:53]
  wire [7:0] _T_1174 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1176 = _T_1174 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 239:116]
  wire [7:0] fwdpipe3_lo = _T_1171 | _T_1176; // @[el2_lsu_stbuf.scala 239:82]
  wire [7:0] _T_1179 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1181 = _T_1179 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 240:53]
  wire [7:0] _T_1184 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1186 = _T_1184 & io_store_data_hi_r[31:24]; // @[el2_lsu_stbuf.scala 240:116]
  wire [7:0] fwdpipe4_lo = _T_1181 | _T_1186; // @[el2_lsu_stbuf.scala 240:82]
  wire [31:0] ld_fwddata_rpipe_lo = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1192 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1194 = _T_1192 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 243:53]
  wire [7:0] _T_1197 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1199 = _T_1197 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 243:114]
  wire [7:0] fwdpipe1_hi = _T_1194 | _T_1199; // @[el2_lsu_stbuf.scala 243:80]
  wire [7:0] _T_1202 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1204 = _T_1202 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 244:53]
  wire [7:0] _T_1207 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1209 = _T_1207 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 244:115]
  wire [7:0] fwdpipe2_hi = _T_1204 | _T_1209; // @[el2_lsu_stbuf.scala 244:81]
  wire [7:0] _T_1212 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1214 = _T_1212 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 245:53]
  wire [7:0] _T_1217 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1219 = _T_1217 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 245:116]
  wire [7:0] fwdpipe3_hi = _T_1214 | _T_1219; // @[el2_lsu_stbuf.scala 245:82]
  wire [7:0] _T_1222 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1224 = _T_1222 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 246:53]
  wire [7:0] _T_1227 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1229 = _T_1227 & io_store_data_hi_r[31:24]; // @[el2_lsu_stbuf.scala 246:116]
  wire [7:0] fwdpipe4_hi = _T_1224 | _T_1229; // @[el2_lsu_stbuf.scala 246:82]
  wire [31:0] ld_fwddata_rpipe_hi = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire  _T_1264 = ld_byte_rhit_hi[0] | stbuf_fwdbyteen_hi_pre_m_0; // @[el2_lsu_stbuf.scala 252:83]
  wire  _T_1266 = ld_byte_rhit_hi[1] | stbuf_fwdbyteen_hi_pre_m_1; // @[el2_lsu_stbuf.scala 252:83]
  wire  _T_1268 = ld_byte_rhit_hi[2] | stbuf_fwdbyteen_hi_pre_m_2; // @[el2_lsu_stbuf.scala 252:83]
  wire  _T_1270 = ld_byte_rhit_hi[3] | stbuf_fwdbyteen_hi_pre_m_3; // @[el2_lsu_stbuf.scala 252:83]
  wire [2:0] _T_1272 = {_T_1270,_T_1268,_T_1266}; // @[Cat.scala 29:58]
  wire  _T_1275 = ld_byte_rhit_lo[0] | stbuf_fwdbyteen_lo_pre_m_0; // @[el2_lsu_stbuf.scala 253:83]
  wire  _T_1277 = ld_byte_rhit_lo[1] | stbuf_fwdbyteen_lo_pre_m_1; // @[el2_lsu_stbuf.scala 253:83]
  wire  _T_1279 = ld_byte_rhit_lo[2] | stbuf_fwdbyteen_lo_pre_m_2; // @[el2_lsu_stbuf.scala 253:83]
  wire  _T_1281 = ld_byte_rhit_lo[3] | stbuf_fwdbyteen_lo_pre_m_3; // @[el2_lsu_stbuf.scala 253:83]
  wire [2:0] _T_1283 = {_T_1281,_T_1279,_T_1277}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[el2_lsu_stbuf.scala 256:30]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[el2_lsu_stbuf.scala 257:30]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[el2_lsu_stbuf.scala 258:30]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[el2_lsu_stbuf.scala 259:30]
  wire [15:0] _T_1297 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1298 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[el2_lsu_stbuf.scala 262:30]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[el2_lsu_stbuf.scala 263:30]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[el2_lsu_stbuf.scala 264:30]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[el2_lsu_stbuf.scala 265:30]
  wire [15:0] _T_1312 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1313 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
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
  assign io_stbuf_reqvld_any = _T_699 & _T_701; // @[el2_lsu_stbuf.scala 51:47 el2_lsu_stbuf.scala 175:24]
  assign io_stbuf_reqvld_flushed_any = _T_689[0] & _T_691[0]; // @[el2_lsu_stbuf.scala 52:35 el2_lsu_stbuf.scala 174:31]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_2; // @[el2_lsu_stbuf.scala 53:35 el2_lsu_stbuf.scala 176:22]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_6; // @[el2_lsu_stbuf.scala 54:35 el2_lsu_stbuf.scala 177:22]
  assign io_lsu_stbuf_full_any = _T_752 ? _T_754 : _T_755; // @[el2_lsu_stbuf.scala 55:43 el2_lsu_stbuf.scala 196:26]
  assign io_lsu_stbuf_empty_any = stbuf_numvld_any == 4'h0; // @[el2_lsu_stbuf.scala 56:43 el2_lsu_stbuf.scala 197:26]
  assign io_ldst_stbuf_reqvld_r = io_lsu_commit_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 57:43 el2_lsu_stbuf.scala 128:26]
  assign io_stbuf_fwddata_hi_m = {_T_1313,_T_1312}; // @[el2_lsu_stbuf.scala 58:43 el2_lsu_stbuf.scala 266:25]
  assign io_stbuf_fwddata_lo_m = {_T_1298,_T_1297}; // @[el2_lsu_stbuf.scala 59:43 el2_lsu_stbuf.scala 260:25]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1272,_T_1264}; // @[el2_lsu_stbuf.scala 60:37 el2_lsu_stbuf.scala 252:27]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1283,_T_1275}; // @[el2_lsu_stbuf.scala 61:37 el2_lsu_stbuf.scala 253:27]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = stbuf_wr_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = stbuf_wr_en[0]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_2_io_en = stbuf_wr_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_3_io_en = stbuf_wr_en[1]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_4_io_en = stbuf_wr_en[2]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_5_io_en = stbuf_wr_en[2]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_6_io_en = stbuf_wr_en[3]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_7_io_en = stbuf_wr_en[3]; // @[el2_lib.scala 511:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  ldst_dual_r = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  RdPtr = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  WrPtr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stbuf_addr_0 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  _T_588 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_580 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_572 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_564 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_623 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_615 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_607 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_599 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stbuf_addr_1 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  stbuf_addr_2 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  stbuf_addr_3 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  stbuf_byteen_0 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  stbuf_byteen_1 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stbuf_byteen_2 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stbuf_byteen_3 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  stbuf_data_0 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  stbuf_data_1 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stbuf_data_2 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  stbuf_data_3 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  ldst_dual_m = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ldst_dual_r = 1'h0;
  end
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
    _T_588 = 1'h0;
  end
  if (reset) begin
    _T_580 = 1'h0;
  end
  if (reset) begin
    _T_572 = 1'h0;
  end
  if (reset) begin
    _T_564 = 1'h0;
  end
  if (reset) begin
    _T_623 = 1'h0;
  end
  if (reset) begin
    _T_615 = 1'h0;
  end
  if (reset) begin
    _T_607 = 1'h0;
  end
  if (reset) begin
    _T_599 = 1'h0;
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
  if (reset) begin
    ldst_dual_m = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_r <= 1'h0;
    end else begin
      ldst_dual_r <= ldst_dual_m;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      RdPtr <= 2'h0;
    end else if (_T_212) begin
      RdPtr <= RdPtrPlus1;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      WrPtr <= 2'h0;
    end else if (WrPtrEn) begin
      if (_T_716) begin
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
      _T_588 <= 1'h0;
    end else begin
      _T_588 <= _T_584 & _T_67;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_580 <= 1'h0;
    end else begin
      _T_580 <= _T_576 & _T_56;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_572 <= 1'h0;
    end else begin
      _T_572 <= _T_568 & _T_45;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_564 <= 1'h0;
    end else begin
      _T_564 <= _T_560 & _T_34;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_623 <= 1'h0;
    end else begin
      _T_623 <= _T_619 & _T_67;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_615 <= 1'h0;
    end else begin
      _T_615 <= _T_611 & _T_56;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_607 <= 1'h0;
    end else begin
      _T_607 <= _T_603 & _T_45;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_599 <= 1'h0;
    end else begin
      _T_599 <= _T_595 & _T_34;
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
      stbuf_byteen_0 <= _T_629 & _T_633;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_1 <= 4'h0;
    end else begin
      stbuf_byteen_1 <= _T_638 & _T_642;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_2 <= 4'h0;
    end else begin
      stbuf_byteen_2 <= _T_647 & _T_651;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_3 <= 4'h0;
    end else begin
      stbuf_byteen_3 <= _T_656 & _T_660;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_0 <= 32'h0;
    end else begin
      stbuf_data_0 <= {_T_546,_T_545};
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_1 <= 32'h0;
    end else begin
      stbuf_data_1 <= {_T_549,_T_548};
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_2 <= 32'h0;
    end else begin
      stbuf_data_2 <= {_T_552,_T_551};
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_3 <= 32'h0;
    end else begin
      stbuf_data_3 <= {_T_555,_T_554};
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_m <= 1'h0;
    end else begin
      ldst_dual_m <= io_lsu_addr_d[2] != io_end_addr_d[2];
    end
  end
endmodule
