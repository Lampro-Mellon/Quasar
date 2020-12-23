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
module lsu_dccm_ctl(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_store_c1_r_clk,
  input         io_lsu_pkt_d_valid,
  input         io_lsu_pkt_d_bits_fast_int,
  input         io_lsu_pkt_d_bits_by,
  input         io_lsu_pkt_d_bits_half,
  input         io_lsu_pkt_d_bits_word,
  input         io_lsu_pkt_d_bits_dword,
  input         io_lsu_pkt_d_bits_load,
  input         io_lsu_pkt_d_bits_store,
  input         io_lsu_pkt_d_bits_unsign,
  input         io_lsu_pkt_d_bits_dma,
  input         io_lsu_pkt_d_bits_store_data_bypass_d,
  input         io_lsu_pkt_d_bits_load_ldst_bypass_d,
  input         io_lsu_pkt_d_bits_store_data_bypass_m,
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
  input         io_addr_in_dccm_d,
  input         io_addr_in_dccm_m,
  input         io_addr_in_dccm_r,
  input         io_addr_in_pic_d,
  input         io_addr_in_pic_m,
  input         io_addr_in_pic_r,
  input         io_lsu_raw_fwd_lo_r,
  input         io_lsu_raw_fwd_hi_r,
  input         io_lsu_commit_r,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
  input  [31:0] io_lsu_addr_d,
  input  [15:0] io_lsu_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [15:0] io_end_addr_d,
  input  [15:0] io_end_addr_m,
  input  [15:0] io_end_addr_r,
  input         io_stbuf_reqvld_any,
  input  [15:0] io_stbuf_addr_any,
  input  [31:0] io_stbuf_data_any,
  input  [6:0]  io_stbuf_ecc_any,
  input  [31:0] io_stbuf_fwddata_hi_m,
  input  [31:0] io_stbuf_fwddata_lo_m,
  input  [3:0]  io_stbuf_fwdbyteen_lo_m,
  input  [3:0]  io_stbuf_fwdbyteen_hi_m,
  output [31:0] io_dccm_rdata_hi_r,
  output [31:0] io_dccm_rdata_lo_r,
  output [6:0]  io_dccm_data_ecc_hi_r,
  output [6:0]  io_dccm_data_ecc_lo_r,
  output [31:0] io_lsu_ld_data_r,
  output [31:0] io_lsu_ld_data_corr_r,
  input         io_lsu_double_ecc_error_r,
  input         io_single_ecc_error_hi_r,
  input         io_single_ecc_error_lo_r,
  input  [31:0] io_sec_data_hi_r,
  input  [31:0] io_sec_data_lo_r,
  input  [31:0] io_sec_data_hi_r_ff,
  input  [31:0] io_sec_data_lo_r_ff,
  input  [6:0]  io_sec_data_ecc_hi_r_ff,
  input  [6:0]  io_sec_data_ecc_lo_r_ff,
  output [31:0] io_dccm_rdata_hi_m,
  output [31:0] io_dccm_rdata_lo_m,
  output [6:0]  io_dccm_data_ecc_hi_m,
  output [6:0]  io_dccm_data_ecc_lo_m,
  output [31:0] io_lsu_ld_data_m,
  input         io_lsu_double_ecc_error_m,
  input  [31:0] io_sec_data_hi_m,
  input  [31:0] io_sec_data_lo_m,
  input  [31:0] io_store_data_m,
  input         io_dma_dccm_wen,
  input         io_dma_pic_wen,
  input  [2:0]  io_dma_mem_tag_m,
  input  [31:0] io_dma_dccm_wdata_lo,
  input  [31:0] io_dma_dccm_wdata_hi,
  input  [6:0]  io_dma_dccm_wdata_ecc_hi,
  input  [6:0]  io_dma_dccm_wdata_ecc_lo,
  output [31:0] io_store_data_hi_r,
  output [31:0] io_store_data_lo_r,
  output [31:0] io_store_datafn_hi_r,
  output [31:0] io_store_datafn_lo_r,
  output [31:0] io_store_data_r,
  output        io_ld_single_ecc_error_r,
  output        io_ld_single_ecc_error_r_ff,
  output [31:0] io_picm_mask_data_m,
  output        io_lsu_stbuf_commit_any,
  output        io_lsu_dccm_rden_m,
  output        io_lsu_dccm_rden_r,
  input  [31:0] io_dma_dccm_ctl_dma_mem_addr,
  input  [63:0] io_dma_dccm_ctl_dma_mem_wdata,
  output        io_dma_dccm_ctl_dccm_dma_rvalid,
  output        io_dma_dccm_ctl_dccm_dma_ecc_error,
  output [2:0]  io_dma_dccm_ctl_dccm_dma_rtag,
  output [63:0] io_dma_dccm_ctl_dccm_dma_rdata,
  output        io_dccm_wren,
  output        io_dccm_rden,
  output [15:0] io_dccm_wr_addr_lo,
  output [15:0] io_dccm_wr_addr_hi,
  output [15:0] io_dccm_rd_addr_lo,
  output [15:0] io_dccm_rd_addr_hi,
  output [38:0] io_dccm_wr_data_lo,
  output [38:0] io_dccm_wr_data_hi,
  input  [38:0] io_dccm_rd_data_lo,
  input  [38:0] io_dccm_rd_data_hi,
  output        io_lsu_pic_picm_wren,
  output        io_lsu_pic_picm_rden,
  output        io_lsu_pic_picm_mken,
  output [31:0] io_lsu_pic_picm_rdaddr,
  output [31:0] io_lsu_pic_picm_wraddr,
  output [31:0] io_lsu_pic_picm_wr_data,
  input  [31:0] io_lsu_pic_picm_rd_data,
  input         io_scan_mode
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
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
  wire [63:0] picm_rd_data_m = {io_lsu_pic_picm_rd_data,io_lsu_pic_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_load; // @[lsu_dccm_ctl.scala 145:63]
  wire [7:0] _T_6 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_9 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [1:0] _T_14 = io_addr_in_dccm_m ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_0 = {{6'd0}, _T_14}; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_16 = _GEN_0 & dccm_rdata_corr_m[7:0]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_17 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : _T_16; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_18 = _T_6[0] ? _T_9[7:0] : _T_17; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_22 = {{4'd0}, _T_18[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_24 = {_T_18[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_26 = _T_24 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_27 = _T_22 | _T_26; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_1 = {{2'd0}, _T_27[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_32 = _GEN_1 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_34 = {_T_27[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_36 = _T_34 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_37 = _T_32 | _T_36; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_2 = {{1'd0}, _T_37[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_42 = _GEN_2 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_44 = {_T_37[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_46 = _T_44 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_47 = _T_42 | _T_46; // @[Bitwise.scala 103:39]
  wire [7:0] _T_58 = _GEN_0 & dccm_rdata_corr_m[15:8]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_59 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : _T_58; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_60 = _T_6[1] ? _T_9[15:8] : _T_59; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_64 = {{4'd0}, _T_60[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_66 = {_T_60[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_68 = _T_66 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_69 = _T_64 | _T_68; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_4 = {{2'd0}, _T_69[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_74 = _GEN_4 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_76 = {_T_69[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_78 = _T_76 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_79 = _T_74 | _T_78; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_5 = {{1'd0}, _T_79[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_84 = _GEN_5 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_86 = {_T_79[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_88 = _T_86 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_89 = _T_84 | _T_88; // @[Bitwise.scala 103:39]
  wire [7:0] _T_100 = _GEN_0 & dccm_rdata_corr_m[23:16]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_101 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : _T_100; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_102 = _T_6[2] ? _T_9[23:16] : _T_101; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_106 = {{4'd0}, _T_102[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_108 = {_T_102[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_110 = _T_108 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_111 = _T_106 | _T_110; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_7 = {{2'd0}, _T_111[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_116 = _GEN_7 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_118 = {_T_111[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_120 = _T_118 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_121 = _T_116 | _T_120; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{1'd0}, _T_121[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_126 = _GEN_8 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_128 = {_T_121[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_130 = _T_128 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_131 = _T_126 | _T_130; // @[Bitwise.scala 103:39]
  wire [7:0] _T_142 = _GEN_0 & dccm_rdata_corr_m[31:24]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_143 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : _T_142; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_144 = _T_6[3] ? _T_9[31:24] : _T_143; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_148 = {{4'd0}, _T_144[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_150 = {_T_144[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_152 = _T_150 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_153 = _T_148 | _T_152; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_10 = {{2'd0}, _T_153[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_158 = _GEN_10 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_160 = {_T_153[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_162 = _T_160 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_163 = _T_158 | _T_162; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_11 = {{1'd0}, _T_163[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_168 = _GEN_11 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_170 = {_T_163[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_172 = _T_170 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_173 = _T_168 | _T_172; // @[Bitwise.scala 103:39]
  wire [7:0] _T_184 = _GEN_0 & dccm_rdata_corr_m[39:32]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_185 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : _T_184; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_186 = _T_6[4] ? _T_9[39:32] : _T_185; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_190 = {{4'd0}, _T_186[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_192 = {_T_186[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_194 = _T_192 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_195 = _T_190 | _T_194; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_13 = {{2'd0}, _T_195[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_200 = _GEN_13 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_202 = {_T_195[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_204 = _T_202 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_205 = _T_200 | _T_204; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_14 = {{1'd0}, _T_205[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_210 = _GEN_14 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_212 = {_T_205[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_214 = _T_212 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_215 = _T_210 | _T_214; // @[Bitwise.scala 103:39]
  wire [7:0] _T_226 = _GEN_0 & dccm_rdata_corr_m[47:40]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_227 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : _T_226; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_228 = _T_6[5] ? _T_9[47:40] : _T_227; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_232 = {{4'd0}, _T_228[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_234 = {_T_228[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_236 = _T_234 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_237 = _T_232 | _T_236; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_16 = {{2'd0}, _T_237[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_242 = _GEN_16 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_244 = {_T_237[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_246 = _T_244 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_247 = _T_242 | _T_246; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_17 = {{1'd0}, _T_247[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_252 = _GEN_17 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_254 = {_T_247[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_256 = _T_254 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_257 = _T_252 | _T_256; // @[Bitwise.scala 103:39]
  wire [7:0] _T_268 = _GEN_0 & dccm_rdata_corr_m[55:48]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_269 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : _T_268; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_270 = _T_6[6] ? _T_9[55:48] : _T_269; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_274 = {{4'd0}, _T_270[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_276 = {_T_270[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_278 = _T_276 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_279 = _T_274 | _T_278; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_19 = {{2'd0}, _T_279[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_284 = _GEN_19 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_286 = {_T_279[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_288 = _T_286 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_289 = _T_284 | _T_288; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_20 = {{1'd0}, _T_289[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_294 = _GEN_20 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_296 = {_T_289[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_298 = _T_296 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_299 = _T_294 | _T_298; // @[Bitwise.scala 103:39]
  wire [7:0] _T_310 = _GEN_0 & dccm_rdata_corr_m[63:56]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_311 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : _T_310; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_312 = _T_6[7] ? _T_9[63:56] : _T_311; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_316 = {{4'd0}, _T_312[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_318 = {_T_312[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_320 = _T_318 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_321 = _T_316 | _T_320; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_22 = {{2'd0}, _T_321[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_326 = _GEN_22 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_328 = {_T_321[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_330 = _T_328 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_331 = _T_326 | _T_330; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_23 = {{1'd0}, _T_331[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_336 = _GEN_23 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_338 = {_T_331[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_340 = _T_338 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_341 = _T_336 | _T_340; // @[Bitwise.scala 103:39]
  wire [63:0] _T_349 = {_T_47,_T_89,_T_131,_T_173,_T_215,_T_257,_T_299,_T_341}; // @[Cat.scala 29:58]
  wire [63:0] _T_353 = {{32'd0}, _T_349[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_355 = {_T_349[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_357 = _T_355 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_358 = _T_353 | _T_357; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_24 = {{16'd0}, _T_358[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_363 = _GEN_24 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_365 = {_T_358[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_367 = _T_365 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_368 = _T_363 | _T_367; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_25 = {{8'd0}, _T_368[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_373 = _GEN_25 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_375 = {_T_368[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_377 = _T_375 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_378 = _T_373 | _T_377; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_26 = {{4'd0}, _T_378[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_383 = _GEN_26 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_385 = {_T_378[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_387 = _T_385 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_388 = _T_383 | _T_387; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_27 = {{2'd0}, _T_388[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_393 = _GEN_27 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_395 = {_T_388[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_397 = _T_395 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_398 = _T_393 | _T_397; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_28 = {{1'd0}, _T_398[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_403 = _GEN_28 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_405 = {_T_398[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_407 = _T_405 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_corr_m = _T_403 | _T_407; // @[Bitwise.scala 103:39]
  wire [63:0] _T_4 = {lsu_rdata_corr_m[31:0],lsu_rdata_corr_m[31:0]}; // @[Cat.scala 29:58]
  wire [7:0] _T_419 = _GEN_0 & dccm_rdata_m[7:0]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_420 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : _T_419; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_421 = _T_6[0] ? _T_9[7:0] : _T_420; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_425 = {{4'd0}, _T_421[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_427 = {_T_421[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_429 = _T_427 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_430 = _T_425 | _T_429; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_30 = {{2'd0}, _T_430[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_435 = _GEN_30 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_437 = {_T_430[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_439 = _T_437 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_440 = _T_435 | _T_439; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_31 = {{1'd0}, _T_440[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_445 = _GEN_31 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_447 = {_T_440[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_449 = _T_447 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_450 = _T_445 | _T_449; // @[Bitwise.scala 103:39]
  wire [7:0] _T_461 = _GEN_0 & dccm_rdata_m[15:8]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_462 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : _T_461; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_463 = _T_6[1] ? _T_9[15:8] : _T_462; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_467 = {{4'd0}, _T_463[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_469 = {_T_463[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_471 = _T_469 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_472 = _T_467 | _T_471; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_33 = {{2'd0}, _T_472[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_477 = _GEN_33 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_479 = {_T_472[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_481 = _T_479 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_482 = _T_477 | _T_481; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_34 = {{1'd0}, _T_482[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_487 = _GEN_34 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_489 = {_T_482[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_491 = _T_489 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_492 = _T_487 | _T_491; // @[Bitwise.scala 103:39]
  wire [7:0] _T_503 = _GEN_0 & dccm_rdata_m[23:16]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_504 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : _T_503; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_505 = _T_6[2] ? _T_9[23:16] : _T_504; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_509 = {{4'd0}, _T_505[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_511 = {_T_505[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_513 = _T_511 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_514 = _T_509 | _T_513; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_36 = {{2'd0}, _T_514[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_519 = _GEN_36 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_521 = {_T_514[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_523 = _T_521 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_524 = _T_519 | _T_523; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_37 = {{1'd0}, _T_524[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_529 = _GEN_37 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_531 = {_T_524[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_533 = _T_531 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_534 = _T_529 | _T_533; // @[Bitwise.scala 103:39]
  wire [7:0] _T_545 = _GEN_0 & dccm_rdata_m[31:24]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_546 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : _T_545; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_547 = _T_6[3] ? _T_9[31:24] : _T_546; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_551 = {{4'd0}, _T_547[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_553 = {_T_547[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_555 = _T_553 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_556 = _T_551 | _T_555; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_39 = {{2'd0}, _T_556[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_561 = _GEN_39 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_563 = {_T_556[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_565 = _T_563 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_566 = _T_561 | _T_565; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_40 = {{1'd0}, _T_566[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_571 = _GEN_40 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_573 = {_T_566[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_575 = _T_573 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_576 = _T_571 | _T_575; // @[Bitwise.scala 103:39]
  wire [7:0] _T_587 = _GEN_0 & dccm_rdata_m[39:32]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_588 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : _T_587; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_589 = _T_6[4] ? _T_9[39:32] : _T_588; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_593 = {{4'd0}, _T_589[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_595 = {_T_589[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_597 = _T_595 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_598 = _T_593 | _T_597; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_42 = {{2'd0}, _T_598[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_603 = _GEN_42 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_605 = {_T_598[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_607 = _T_605 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_608 = _T_603 | _T_607; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_43 = {{1'd0}, _T_608[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_613 = _GEN_43 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_615 = {_T_608[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_617 = _T_615 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_618 = _T_613 | _T_617; // @[Bitwise.scala 103:39]
  wire [7:0] _T_629 = _GEN_0 & dccm_rdata_m[47:40]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_630 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : _T_629; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_631 = _T_6[5] ? _T_9[47:40] : _T_630; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_635 = {{4'd0}, _T_631[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_637 = {_T_631[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_639 = _T_637 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_640 = _T_635 | _T_639; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_45 = {{2'd0}, _T_640[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_645 = _GEN_45 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_647 = {_T_640[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_649 = _T_647 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_650 = _T_645 | _T_649; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_46 = {{1'd0}, _T_650[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_655 = _GEN_46 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_657 = {_T_650[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_659 = _T_657 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_660 = _T_655 | _T_659; // @[Bitwise.scala 103:39]
  wire [7:0] _T_671 = _GEN_0 & dccm_rdata_m[55:48]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_672 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : _T_671; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_673 = _T_6[6] ? _T_9[55:48] : _T_672; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_677 = {{4'd0}, _T_673[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_679 = {_T_673[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_681 = _T_679 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_682 = _T_677 | _T_681; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_48 = {{2'd0}, _T_682[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_687 = _GEN_48 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_689 = {_T_682[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_691 = _T_689 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_692 = _T_687 | _T_691; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_49 = {{1'd0}, _T_692[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_697 = _GEN_49 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_699 = {_T_692[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_701 = _T_699 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_702 = _T_697 | _T_701; // @[Bitwise.scala 103:39]
  wire [7:0] _T_713 = _GEN_0 & dccm_rdata_m[63:56]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_714 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : _T_713; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_715 = _T_6[7] ? _T_9[63:56] : _T_714; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_719 = {{4'd0}, _T_715[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_721 = {_T_715[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_723 = _T_721 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_724 = _T_719 | _T_723; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_51 = {{2'd0}, _T_724[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_729 = _GEN_51 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_731 = {_T_724[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_733 = _T_731 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_734 = _T_729 | _T_733; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_52 = {{1'd0}, _T_734[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_739 = _GEN_52 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_741 = {_T_734[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_743 = _T_741 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_744 = _T_739 | _T_743; // @[Bitwise.scala 103:39]
  wire [63:0] _T_752 = {_T_450,_T_492,_T_534,_T_576,_T_618,_T_660,_T_702,_T_744}; // @[Cat.scala 29:58]
  wire [63:0] _T_756 = {{32'd0}, _T_752[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_758 = {_T_752[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_760 = _T_758 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_761 = _T_756 | _T_760; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_53 = {{16'd0}, _T_761[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_766 = _GEN_53 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_768 = {_T_761[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_770 = _T_768 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_771 = _T_766 | _T_770; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_54 = {{8'd0}, _T_771[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_776 = _GEN_54 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_778 = {_T_771[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_780 = _T_778 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_781 = _T_776 | _T_780; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_55 = {{4'd0}, _T_781[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_786 = _GEN_55 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_788 = {_T_781[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_790 = _T_788 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_791 = _T_786 | _T_790; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_56 = {{2'd0}, _T_791[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_796 = _GEN_56 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_798 = {_T_791[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_800 = _T_798 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_801 = _T_796 | _T_800; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_57 = {{1'd0}, _T_801[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_806 = _GEN_57 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_808 = {_T_801[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_810 = _T_808 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_m = _T_806 | _T_810; // @[Bitwise.scala 103:39]
  wire  _T_813 = io_addr_in_pic_m | io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 157:123]
  wire  _T_814 = _T & _T_813; // @[lsu_dccm_ctl.scala 157:103]
  reg [63:0] _T_818; // @[lib.scala 383:16]
  wire [3:0] _GEN_58 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[lsu_dccm_ctl.scala 158:49]
  wire [5:0] _T_820 = 4'h8 * _GEN_58; // @[lsu_dccm_ctl.scala 158:49]
  wire [63:0] _T_821 = lsu_rdata_m >> _T_820; // @[lsu_dccm_ctl.scala 158:43]
  wire  _T_827 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:60]
  wire  _T_830 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:133]
  wire  _T_831 = _T_827 | _T_830; // @[lsu_dccm_ctl.scala 163:101]
  wire  _T_832 = _T_831 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 163:175]
  wire  _T_833 = _T_832 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 163:196]
  wire  _T_834 = _T_833 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 163:222]
  wire  _T_835 = _T_834 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 163:246]
  wire  _T_838 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:37]
  wire  _T_841 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:110]
  wire  _T_842 = _T_838 | _T_841; // @[lsu_dccm_ctl.scala 164:78]
  wire  _T_843 = _T_842 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 164:152]
  wire  _T_844 = _T_843 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 164:173]
  wire  _T_845 = _T_844 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 164:199]
  wire  _T_846 = _T_845 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 164:223]
  wire  kill_ecc_corr_lo_r = _T_835 | _T_846; // @[lsu_dccm_ctl.scala 163:267]
  wire  _T_849 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:60]
  wire  _T_852 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:133]
  wire  _T_853 = _T_849 | _T_852; // @[lsu_dccm_ctl.scala 166:101]
  wire  _T_854 = _T_853 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 166:175]
  wire  _T_855 = _T_854 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 166:196]
  wire  _T_856 = _T_855 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 166:222]
  wire  _T_857 = _T_856 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 166:246]
  wire  _T_860 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:37]
  wire  _T_863 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:110]
  wire  _T_864 = _T_860 | _T_863; // @[lsu_dccm_ctl.scala 167:78]
  wire  _T_865 = _T_864 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 167:152]
  wire  _T_866 = _T_865 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 167:173]
  wire  _T_867 = _T_866 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 167:199]
  wire  _T_868 = _T_867 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 167:223]
  wire  kill_ecc_corr_hi_r = _T_857 | _T_868; // @[lsu_dccm_ctl.scala 166:267]
  wire  _T_869 = io_lsu_pkt_r_bits_load & io_single_ecc_error_lo_r; // @[lsu_dccm_ctl.scala 169:60]
  wire  _T_870 = ~io_lsu_raw_fwd_lo_r; // @[lsu_dccm_ctl.scala 169:89]
  wire  ld_single_ecc_error_lo_r = _T_869 & _T_870; // @[lsu_dccm_ctl.scala 169:87]
  wire  _T_871 = io_lsu_pkt_r_bits_load & io_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 170:60]
  wire  _T_872 = ~io_lsu_raw_fwd_hi_r; // @[lsu_dccm_ctl.scala 170:89]
  wire  ld_single_ecc_error_hi_r = _T_871 & _T_872; // @[lsu_dccm_ctl.scala 170:87]
  wire  _T_873 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 171:63]
  wire  _T_874 = ~io_lsu_double_ecc_error_r; // @[lsu_dccm_ctl.scala 171:93]
  wire  _T_876 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_dccm_ctl.scala 172:81]
  wire  _T_877 = ld_single_ecc_error_lo_r & _T_876; // @[lsu_dccm_ctl.scala 172:62]
  wire  _T_878 = ~kill_ecc_corr_lo_r; // @[lsu_dccm_ctl.scala 172:108]
  wire  _T_880 = ld_single_ecc_error_hi_r & _T_876; // @[lsu_dccm_ctl.scala 173:62]
  wire  _T_881 = ~kill_ecc_corr_hi_r; // @[lsu_dccm_ctl.scala 173:108]
  wire  _T_882 = io_lsu_pkt_d_bits_word | io_lsu_pkt_d_bits_dword; // @[lsu_dccm_ctl.scala 175:125]
  wire  _T_883 = ~_T_882; // @[lsu_dccm_ctl.scala 175:100]
  wire  _T_885 = io_lsu_addr_d[1:0] != 2'h0; // @[lsu_dccm_ctl.scala 175:174]
  wire  _T_886 = _T_883 | _T_885; // @[lsu_dccm_ctl.scala 175:152]
  wire  _T_887 = io_lsu_pkt_d_bits_store & _T_886; // @[lsu_dccm_ctl.scala 175:97]
  wire  _T_888 = io_lsu_pkt_d_bits_load | _T_887; // @[lsu_dccm_ctl.scala 175:70]
  wire  _T_889 = io_lsu_pkt_d_valid & _T_888; // @[lsu_dccm_ctl.scala 175:44]
  wire  lsu_dccm_rden_d = _T_889 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 175:191]
  reg  ld_single_ecc_error_lo_r_ff; // @[lsu_dccm_ctl.scala 284:73]
  reg  ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 283:73]
  wire  _T_890 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 178:63]
  reg  lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 282:73]
  wire  _T_891 = ~lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 178:96]
  wire  _T_893 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[lsu_dccm_ctl.scala 179:75]
  wire  _T_894 = _T_893 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 179:93]
  wire  _T_895 = ~_T_894; // @[lsu_dccm_ctl.scala 179:57]
  wire  _T_898 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[lsu_dccm_ctl.scala 180:95]
  wire  _T_901 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[lsu_dccm_ctl.scala 181:76]
  wire  _T_902 = _T_898 | _T_901; // @[lsu_dccm_ctl.scala 180:171]
  wire  _T_903 = ~_T_902; // @[lsu_dccm_ctl.scala 180:24]
  wire  _T_904 = lsu_dccm_rden_d & _T_903; // @[lsu_dccm_ctl.scala 180:22]
  wire  _T_905 = _T_895 | _T_904; // @[lsu_dccm_ctl.scala 179:124]
  wire  _T_907 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[lsu_dccm_ctl.scala 185:41]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[lib.scala 383:16]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[lib.scala 383:16]
  wire [15:0] _T_914 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[lsu_dccm_ctl.scala 189:8]
  wire [15:0] _T_918 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 190:8]
  wire [15:0] _T_924 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[lsu_dccm_ctl.scala 193:8]
  wire [15:0] _T_928 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 194:8]
  wire [38:0] _T_936 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_939 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_940 = ld_single_ecc_error_lo_r_ff ? _T_936 : _T_939; // @[lsu_dccm_ctl.scala 200:8]
  wire [38:0] _T_944 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_947 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_948 = io_dma_dccm_wen ? _T_944 : _T_947; // @[lsu_dccm_ctl.scala 202:8]
  wire [38:0] _T_958 = ld_single_ecc_error_hi_r_ff ? _T_939 : _T_936; // @[lsu_dccm_ctl.scala 206:8]
  wire [38:0] _T_962 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_966 = io_dma_dccm_wen ? _T_962 : _T_947; // @[lsu_dccm_ctl.scala 208:8]
  wire [3:0] _T_969 = io_lsu_pkt_m_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_971 = io_lsu_pkt_m_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_972 = _T_971 & 4'h1; // @[lsu_dccm_ctl.scala 212:94]
  wire [3:0] _T_974 = io_lsu_pkt_m_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_975 = _T_974 & 4'h3; // @[lsu_dccm_ctl.scala 213:38]
  wire [3:0] _T_976 = _T_972 | _T_975; // @[lsu_dccm_ctl.scala 212:107]
  wire [3:0] _T_978 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_980 = _T_976 | _T_978; // @[lsu_dccm_ctl.scala 213:51]
  wire [3:0] store_byteen_m = _T_969 & _T_980; // @[lsu_dccm_ctl.scala 212:58]
  wire [3:0] _T_982 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_984 = io_lsu_pkt_r_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_985 = _T_984 & 4'h1; // @[lsu_dccm_ctl.scala 216:94]
  wire [3:0] _T_987 = io_lsu_pkt_r_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_988 = _T_987 & 4'h3; // @[lsu_dccm_ctl.scala 217:38]
  wire [3:0] _T_989 = _T_985 | _T_988; // @[lsu_dccm_ctl.scala 216:107]
  wire [3:0] _T_991 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_993 = _T_989 | _T_991; // @[lsu_dccm_ctl.scala 217:51]
  wire [3:0] store_byteen_r = _T_982 & _T_993; // @[lsu_dccm_ctl.scala 216:58]
  wire [6:0] _GEN_60 = {{3'd0}, store_byteen_m}; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _T_996 = _GEN_60 << io_lsu_addr_m[1:0]; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _GEN_61 = {{3'd0}, store_byteen_r}; // @[lsu_dccm_ctl.scala 222:45]
  wire [6:0] _T_999 = _GEN_61 << io_lsu_addr_r[1:0]; // @[lsu_dccm_ctl.scala 222:45]
  wire  _T_1002 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[lsu_dccm_ctl.scala 225:67]
  wire  dccm_wr_bypass_d_m_lo = _T_1002 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 225:101]
  wire  _T_1005 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[lsu_dccm_ctl.scala 226:67]
  wire  dccm_wr_bypass_d_m_hi = _T_1005 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 226:101]
  wire  _T_1008 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 228:67]
  wire  dccm_wr_bypass_d_r_lo = _T_1008 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 228:101]
  wire  _T_1011 = io_stbuf_addr_any[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 229:67]
  wire  dccm_wr_bypass_d_r_hi = _T_1011 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 229:101]
  wire [63:0] _T_1014 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_63 = {{63'd0}, _T_1014}; // @[lsu_dccm_ctl.scala 258:72]
  wire [126:0] _T_1017 = _GEN_63 << _T_820; // @[lsu_dccm_ctl.scala 258:72]
  wire [63:0] store_data_pre_m = _T_1017[63:0]; // @[lsu_dccm_ctl.scala 258:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[lsu_dccm_ctl.scala 259:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[lsu_dccm_ctl.scala 260:48]
  wire [7:0] store_byteen_ext_m = {{1'd0}, _T_996}; // @[lsu_dccm_ctl.scala 220:22]
  wire  _T_1023 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[lsu_dccm_ctl.scala 261:211]
  wire [7:0] _T_1027 = _T_1023 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1028 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_1027; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1032 = {{4'd0}, _T_1028[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1034 = {_T_1028[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1036 = _T_1034 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1037 = _T_1032 | _T_1036; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_64 = {{2'd0}, _T_1037[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1042 = _GEN_64 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1044 = {_T_1037[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1046 = _T_1044 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1047 = _T_1042 | _T_1046; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_65 = {{1'd0}, _T_1047[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1052 = _GEN_65 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1054 = {_T_1047[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1056 = _T_1054 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1057 = _T_1052 | _T_1056; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1065 = _T_1023 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1066 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_1065; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1070 = {{4'd0}, _T_1066[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1072 = {_T_1066[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1074 = _T_1072 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1075 = _T_1070 | _T_1074; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_66 = {{2'd0}, _T_1075[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1080 = _GEN_66 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1082 = {_T_1075[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1084 = _T_1082 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1085 = _T_1080 | _T_1084; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_67 = {{1'd0}, _T_1085[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1090 = _GEN_67 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1092 = {_T_1085[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1094 = _T_1092 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1095 = _T_1090 | _T_1094; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1103 = _T_1023 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1104 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_1103; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1108 = {{4'd0}, _T_1104[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1110 = {_T_1104[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1112 = _T_1110 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1113 = _T_1108 | _T_1112; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_68 = {{2'd0}, _T_1113[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1118 = _GEN_68 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1120 = {_T_1113[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1122 = _T_1120 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1123 = _T_1118 | _T_1122; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_69 = {{1'd0}, _T_1123[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1128 = _GEN_69 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1130 = {_T_1123[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1132 = _T_1130 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1133 = _T_1128 | _T_1132; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1141 = _T_1023 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1142 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_1141; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1146 = {{4'd0}, _T_1142[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1148 = {_T_1142[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1150 = _T_1148 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1151 = _T_1146 | _T_1150; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_70 = {{2'd0}, _T_1151[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1156 = _GEN_70 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1158 = {_T_1151[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1160 = _T_1158 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1161 = _T_1156 | _T_1160; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_71 = {{1'd0}, _T_1161[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1166 = _GEN_71 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1168 = {_T_1161[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1170 = _T_1168 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1171 = _T_1166 | _T_1170; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1175 = {_T_1057,_T_1095,_T_1133,_T_1171}; // @[Cat.scala 29:58]
  wire [31:0] _T_1179 = {{16'd0}, _T_1175[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1181 = {_T_1175[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1183 = _T_1181 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1184 = _T_1179 | _T_1183; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_72 = {{8'd0}, _T_1184[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1189 = _GEN_72 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1191 = {_T_1184[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1193 = _T_1191 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1194 = _T_1189 | _T_1193; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_73 = {{4'd0}, _T_1194[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1199 = _GEN_73 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1201 = {_T_1194[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1203 = _T_1201 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1204 = _T_1199 | _T_1203; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_74 = {{2'd0}, _T_1204[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1209 = _GEN_74 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1211 = {_T_1204[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1213 = _T_1211 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1214 = _T_1209 | _T_1213; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_75 = {{1'd0}, _T_1214[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1219 = _GEN_75 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1221 = {_T_1214[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1223 = _T_1221 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  reg [31:0] _T_1225; // @[lsu_dccm_ctl.scala 261:72]
  wire  _T_1229 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[lsu_dccm_ctl.scala 262:177]
  wire [7:0] _T_1233 = _T_1229 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1234 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_1233; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1238 = {{4'd0}, _T_1234[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1240 = {_T_1234[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1242 = _T_1240 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1243 = _T_1238 | _T_1242; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_76 = {{2'd0}, _T_1243[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1248 = _GEN_76 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1250 = {_T_1243[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1252 = _T_1250 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1253 = _T_1248 | _T_1252; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_77 = {{1'd0}, _T_1253[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1258 = _GEN_77 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1260 = {_T_1253[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1262 = _T_1260 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1263 = _T_1258 | _T_1262; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1271 = _T_1229 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1272 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_1271; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1276 = {{4'd0}, _T_1272[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1278 = {_T_1272[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1280 = _T_1278 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1281 = _T_1276 | _T_1280; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_78 = {{2'd0}, _T_1281[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1286 = _GEN_78 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1288 = {_T_1281[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1290 = _T_1288 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1291 = _T_1286 | _T_1290; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_79 = {{1'd0}, _T_1291[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1296 = _GEN_79 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1298 = {_T_1291[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1300 = _T_1298 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1301 = _T_1296 | _T_1300; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1309 = _T_1229 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1310 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_1309; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1314 = {{4'd0}, _T_1310[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1316 = {_T_1310[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1318 = _T_1316 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1319 = _T_1314 | _T_1318; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_80 = {{2'd0}, _T_1319[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1324 = _GEN_80 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1326 = {_T_1319[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1328 = _T_1326 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1329 = _T_1324 | _T_1328; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_81 = {{1'd0}, _T_1329[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1334 = _GEN_81 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1336 = {_T_1329[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1338 = _T_1336 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1339 = _T_1334 | _T_1338; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1347 = _T_1229 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1348 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_1347; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1352 = {{4'd0}, _T_1348[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1354 = {_T_1348[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1356 = _T_1354 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1357 = _T_1352 | _T_1356; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_82 = {{2'd0}, _T_1357[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1362 = _GEN_82 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1364 = {_T_1357[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1366 = _T_1364 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1367 = _T_1362 | _T_1366; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_83 = {{1'd0}, _T_1367[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1372 = _GEN_83 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1374 = {_T_1367[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1376 = _T_1374 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1377 = _T_1372 | _T_1376; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1381 = {_T_1263,_T_1301,_T_1339,_T_1377}; // @[Cat.scala 29:58]
  wire [31:0] _T_1385 = {{16'd0}, _T_1381[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1387 = {_T_1381[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1389 = _T_1387 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1390 = _T_1385 | _T_1389; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_84 = {{8'd0}, _T_1390[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1395 = _GEN_84 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1397 = {_T_1390[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1399 = _T_1397 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1400 = _T_1395 | _T_1399; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_85 = {{4'd0}, _T_1400[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1405 = _GEN_85 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1407 = {_T_1400[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1409 = _T_1407 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1410 = _T_1405 | _T_1409; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_86 = {{2'd0}, _T_1410[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1415 = _GEN_86 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1417 = {_T_1410[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1419 = _T_1417 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1420 = _T_1415 | _T_1419; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_87 = {{1'd0}, _T_1420[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1425 = _GEN_87 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1427 = {_T_1420[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1429 = _T_1427 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1431 = io_ldst_dual_m & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 262:295]
  wire  _T_1432 = _T_1431 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 262:316]
  reg [31:0] _T_1436; // @[lib.scala 383:16]
  wire  _T_1437 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[lsu_dccm_ctl.scala 263:105]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_999}; // @[lsu_dccm_ctl.scala 222:22]
  wire  _T_1439 = ~store_byteen_ext_r[0]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1440 = _T_1437 & _T_1439; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1444 = _T_1440 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1448 = {{4'd0}, _T_1444[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1450 = {_T_1444[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1452 = _T_1450 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1453 = _T_1448 | _T_1452; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_88 = {{2'd0}, _T_1453[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1458 = _GEN_88 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1460 = {_T_1453[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1462 = _T_1460 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1463 = _T_1458 | _T_1462; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_89 = {{1'd0}, _T_1463[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1468 = _GEN_89 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1470 = {_T_1463[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1472 = _T_1470 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1473 = _T_1468 | _T_1472; // @[Bitwise.scala 103:39]
  wire  _T_1476 = ~store_byteen_ext_r[1]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1477 = _T_1437 & _T_1476; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1481 = _T_1477 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1485 = {{4'd0}, _T_1481[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1487 = {_T_1481[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1489 = _T_1487 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1490 = _T_1485 | _T_1489; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_90 = {{2'd0}, _T_1490[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1495 = _GEN_90 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1497 = {_T_1490[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1499 = _T_1497 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1500 = _T_1495 | _T_1499; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_91 = {{1'd0}, _T_1500[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1505 = _GEN_91 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1507 = {_T_1500[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1509 = _T_1507 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1510 = _T_1505 | _T_1509; // @[Bitwise.scala 103:39]
  wire  _T_1513 = ~store_byteen_ext_r[2]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1514 = _T_1437 & _T_1513; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1518 = _T_1514 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1522 = {{4'd0}, _T_1518[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1524 = {_T_1518[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1526 = _T_1524 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1527 = _T_1522 | _T_1526; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_92 = {{2'd0}, _T_1527[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1532 = _GEN_92 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1534 = {_T_1527[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1536 = _T_1534 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1537 = _T_1532 | _T_1536; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_93 = {{1'd0}, _T_1537[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1542 = _GEN_93 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1544 = {_T_1537[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1546 = _T_1544 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1547 = _T_1542 | _T_1546; // @[Bitwise.scala 103:39]
  wire  _T_1550 = ~store_byteen_ext_r[3]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1551 = _T_1437 & _T_1550; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1555 = _T_1551 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1559 = {{4'd0}, _T_1555[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1561 = {_T_1555[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1563 = _T_1561 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1564 = _T_1559 | _T_1563; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_94 = {{2'd0}, _T_1564[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1569 = _GEN_94 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1571 = {_T_1564[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1573 = _T_1571 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1574 = _T_1569 | _T_1573; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_95 = {{1'd0}, _T_1574[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1579 = _GEN_95 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1581 = {_T_1574[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1583 = _T_1581 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1584 = _T_1579 | _T_1583; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1588 = {_T_1473,_T_1510,_T_1547,_T_1584}; // @[Cat.scala 29:58]
  wire [31:0] _T_1592 = {{16'd0}, _T_1588[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1594 = {_T_1588[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1596 = _T_1594 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1597 = _T_1592 | _T_1596; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_96 = {{8'd0}, _T_1597[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1602 = _GEN_96 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1604 = {_T_1597[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1606 = _T_1604 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1607 = _T_1602 | _T_1606; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_97 = {{4'd0}, _T_1607[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1612 = _GEN_97 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1614 = {_T_1607[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1616 = _T_1614 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1617 = _T_1612 | _T_1616; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_98 = {{2'd0}, _T_1617[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1622 = _GEN_98 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1624 = {_T_1617[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1626 = _T_1624 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1627 = _T_1622 | _T_1626; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_99 = {{1'd0}, _T_1627[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1632 = _GEN_99 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1634 = {_T_1627[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1636 = _T_1634 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1638 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_hi; // @[lsu_dccm_ctl.scala 264:105]
  wire  _T_1640 = ~store_byteen_ext_r[4]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1641 = _T_1638 & _T_1640; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1645 = _T_1641 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1649 = {{4'd0}, _T_1645[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1651 = {_T_1645[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1653 = _T_1651 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1654 = _T_1649 | _T_1653; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_100 = {{2'd0}, _T_1654[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1659 = _GEN_100 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1661 = {_T_1654[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1663 = _T_1661 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1664 = _T_1659 | _T_1663; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_101 = {{1'd0}, _T_1664[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1669 = _GEN_101 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1671 = {_T_1664[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1673 = _T_1671 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1674 = _T_1669 | _T_1673; // @[Bitwise.scala 103:39]
  wire  _T_1677 = ~store_byteen_ext_r[5]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1678 = _T_1638 & _T_1677; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1682 = _T_1678 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1686 = {{4'd0}, _T_1682[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1688 = {_T_1682[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1690 = _T_1688 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1691 = _T_1686 | _T_1690; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_102 = {{2'd0}, _T_1691[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1696 = _GEN_102 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1698 = {_T_1691[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1700 = _T_1698 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1701 = _T_1696 | _T_1700; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_103 = {{1'd0}, _T_1701[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1706 = _GEN_103 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1708 = {_T_1701[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1710 = _T_1708 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1711 = _T_1706 | _T_1710; // @[Bitwise.scala 103:39]
  wire  _T_1714 = ~store_byteen_ext_r[6]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1715 = _T_1638 & _T_1714; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1719 = _T_1715 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1723 = {{4'd0}, _T_1719[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1725 = {_T_1719[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1727 = _T_1725 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1728 = _T_1723 | _T_1727; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_104 = {{2'd0}, _T_1728[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1733 = _GEN_104 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1735 = {_T_1728[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1737 = _T_1735 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1738 = _T_1733 | _T_1737; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_105 = {{1'd0}, _T_1738[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1743 = _GEN_105 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1745 = {_T_1738[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1747 = _T_1745 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1748 = _T_1743 | _T_1747; // @[Bitwise.scala 103:39]
  wire  _T_1751 = ~store_byteen_ext_r[7]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1752 = _T_1638 & _T_1751; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1756 = _T_1752 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1760 = {{4'd0}, _T_1756[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1762 = {_T_1756[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1764 = _T_1762 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1765 = _T_1760 | _T_1764; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_106 = {{2'd0}, _T_1765[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1770 = _GEN_106 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1772 = {_T_1765[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1774 = _T_1772 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1775 = _T_1770 | _T_1774; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_107 = {{1'd0}, _T_1775[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1780 = _GEN_107 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1782 = {_T_1775[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1784 = _T_1782 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1785 = _T_1780 | _T_1784; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1789 = {_T_1674,_T_1711,_T_1748,_T_1785}; // @[Cat.scala 29:58]
  wire [31:0] _T_1793 = {{16'd0}, _T_1789[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1795 = {_T_1789[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1797 = _T_1795 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1798 = _T_1793 | _T_1797; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_108 = {{8'd0}, _T_1798[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1803 = _GEN_108 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1805 = {_T_1798[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1807 = _T_1805 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1808 = _T_1803 | _T_1807; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_109 = {{4'd0}, _T_1808[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1813 = _GEN_109 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1815 = {_T_1808[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1817 = _T_1815 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1818 = _T_1813 | _T_1817; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_110 = {{2'd0}, _T_1818[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1823 = _GEN_110 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1825 = {_T_1818[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1827 = _T_1825 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1828 = _T_1823 | _T_1827; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_111 = {{1'd0}, _T_1828[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1833 = _GEN_111 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1835 = {_T_1828[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1837 = _T_1835 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] _T_1841 = {io_store_data_hi_r,io_store_data_lo_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_112 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[lsu_dccm_ctl.scala 265:94]
  wire [5:0] _T_1843 = 4'h8 * _GEN_112; // @[lsu_dccm_ctl.scala 265:94]
  wire [63:0] _T_1844 = _T_1841 >> _T_1843; // @[lsu_dccm_ctl.scala 265:88]
  wire [7:0] _T_1847 = store_byteen_r[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1850 = store_byteen_r[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1853 = store_byteen_r[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1856 = store_byteen_r[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1860 = {_T_1847,_T_1850,_T_1853,_T_1856}; // @[Cat.scala 29:58]
  wire [31:0] _T_1864 = {{16'd0}, _T_1860[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1866 = {_T_1860[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1868 = _T_1866 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1869 = _T_1864 | _T_1868; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_113 = {{8'd0}, _T_1869[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1874 = _GEN_113 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1876 = {_T_1869[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1878 = _T_1876 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1879 = _T_1874 | _T_1878; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_114 = {{4'd0}, _T_1879[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1884 = _GEN_114 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1886 = {_T_1879[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1888 = _T_1886 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1889 = _T_1884 | _T_1888; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_115 = {{2'd0}, _T_1889[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1894 = _GEN_115 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1896 = {_T_1889[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1898 = _T_1896 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1899 = _T_1894 | _T_1898; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_116 = {{1'd0}, _T_1899[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1904 = _GEN_116 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1906 = {_T_1899[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1908 = _T_1906 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1909 = _T_1904 | _T_1908; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_117 = {{32'd0}, _T_1909}; // @[lsu_dccm_ctl.scala 265:115]
  wire [63:0] _T_1910 = _T_1844 & _GEN_117; // @[lsu_dccm_ctl.scala 265:115]
  wire  _T_1915 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_dccm_ctl.scala 272:58]
  wire  _T_1916 = _T_1915 & io_addr_in_pic_r; // @[lsu_dccm_ctl.scala 272:84]
  wire  _T_1917 = _T_1916 & io_lsu_commit_r; // @[lsu_dccm_ctl.scala 272:103]
  wire  _T_1919 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_load; // @[lsu_dccm_ctl.scala 273:58]
  wire  _T_1921 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 274:58]
  wire [31:0] _T_1925 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1931 = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[lsu_dccm_ctl.scala 276:93]
  wire [31:0] _T_1932 = {17'h0,_T_1931}; // @[Cat.scala 29:58]
  reg  _T_1939; // @[lsu_dccm_ctl.scala 280:61]
  reg  _T_1940; // @[lsu_dccm_ctl.scala 281:61]
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
  assign io_dccm_rdata_hi_r = 32'h0; // @[lsu_dccm_ctl.scala 150:28]
  assign io_dccm_rdata_lo_r = 32'h0; // @[lsu_dccm_ctl.scala 149:28]
  assign io_dccm_data_ecc_hi_r = 7'h0; // @[lsu_dccm_ctl.scala 151:28]
  assign io_dccm_data_ecc_lo_r = 7'h0; // @[lsu_dccm_ctl.scala 152:28]
  assign io_lsu_ld_data_r = 32'h0; // @[lsu_dccm_ctl.scala 153:28]
  assign io_lsu_ld_data_corr_r = _T_818[31:0]; // @[lsu_dccm_ctl.scala 157:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[lsu_dccm_ctl.scala 268:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[lsu_dccm_ctl.scala 267:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[lsu_dccm_ctl.scala 270:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[lsu_dccm_ctl.scala 269:27]
  assign io_lsu_ld_data_m = _T_821[31:0]; // @[lsu_dccm_ctl.scala 158:28]
  assign io_store_data_hi_r = _T_1436; // @[lsu_dccm_ctl.scala 262:29]
  assign io_store_data_lo_r = _T_1225; // @[lsu_dccm_ctl.scala 261:29]
  assign io_store_datafn_hi_r = _T_1833 | _T_1837; // @[lsu_dccm_ctl.scala 264:29]
  assign io_store_datafn_lo_r = _T_1632 | _T_1636; // @[lsu_dccm_ctl.scala 263:29]
  assign io_store_data_r = _T_1910[31:0]; // @[lsu_dccm_ctl.scala 265:29]
  assign io_ld_single_ecc_error_r = _T_873 & _T_874; // @[lsu_dccm_ctl.scala 171:34]
  assign io_ld_single_ecc_error_r_ff = _T_890 & _T_891; // @[lsu_dccm_ctl.scala 178:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[lsu_dccm_ctl.scala 277:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_905; // @[lsu_dccm_ctl.scala 179:31]
  assign io_lsu_dccm_rden_m = _T_1939; // @[lsu_dccm_ctl.scala 280:24]
  assign io_lsu_dccm_rden_r = _T_1940; // @[lsu_dccm_ctl.scala 281:24]
  assign io_dma_dccm_ctl_dccm_dma_rvalid = _T & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 145:41]
  assign io_dma_dccm_ctl_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[lsu_dccm_ctl.scala 146:41]
  assign io_dma_dccm_ctl_dccm_dma_rtag = io_dma_mem_tag_m; // @[lsu_dccm_ctl.scala 148:41]
  assign io_dma_dccm_ctl_dccm_dma_rdata = io_ldst_dual_m ? lsu_rdata_corr_m : _T_4; // @[lsu_dccm_ctl.scala 147:41]
  assign io_dccm_wren = _T_907 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 185:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 186:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_914 : _T_918; // @[lsu_dccm_ctl.scala 188:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_924 : _T_928; // @[lsu_dccm_ctl.scala 192:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[lsu_dccm_ctl.scala 196:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[lsu_dccm_ctl.scala 197:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_940 : _T_948; // @[lsu_dccm_ctl.scala 199:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_958 : _T_966; // @[lsu_dccm_ctl.scala 205:22]
  assign io_lsu_pic_picm_wren = _T_1917 | io_dma_pic_wen; // @[lsu_dccm_ctl.scala 272:35]
  assign io_lsu_pic_picm_rden = _T_1919 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 273:35]
  assign io_lsu_pic_picm_mken = _T_1921 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 274:35]
  assign io_lsu_pic_picm_rdaddr = 32'hf00c0000 | _T_1925; // @[lsu_dccm_ctl.scala 275:35]
  assign io_lsu_pic_picm_wraddr = 32'hf00c0000 | _T_1932; // @[lsu_dccm_ctl.scala 276:35]
  assign io_lsu_pic_picm_wr_data = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[lsu_dccm_ctl.scala 278:35]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_io_en = _T_814 | io_clk_override; // @[lib.scala 380:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_1_io_en = _T_1432 | io_clk_override; // @[lib.scala 380:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_2_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 380:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 379:18]
  assign rvclkhdr_3_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 380:17]
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
  _RAND_0 = {2{`RANDOM}};
  _T_818 = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  ld_single_ecc_error_lo_r_ff = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ld_single_ecc_error_hi_r_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lsu_double_ecc_error_r_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ld_sec_addr_lo_r_ff = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  ld_sec_addr_hi_r_ff = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1225 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1436 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_1939 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_1940 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_818 = 64'h0;
  end
  if (reset) begin
    ld_single_ecc_error_lo_r_ff = 1'h0;
  end
  if (reset) begin
    ld_single_ecc_error_hi_r_ff = 1'h0;
  end
  if (reset) begin
    lsu_double_ecc_error_r_ff = 1'h0;
  end
  if (reset) begin
    ld_sec_addr_lo_r_ff = 16'h0;
  end
  if (reset) begin
    ld_sec_addr_hi_r_ff = 16'h0;
  end
  if (reset) begin
    _T_1225 = 32'h0;
  end
  if (reset) begin
    _T_1436 = 32'h0;
  end
  if (reset) begin
    _T_1939 = 1'h0;
  end
  if (reset) begin
    _T_1940 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_818 <= 64'h0;
    end else begin
      _T_818 <= lsu_rdata_corr_m >> _T_820;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_877 & _T_878;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_hi_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_hi_r_ff <= _T_880 & _T_881;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_double_ecc_error_r_ff <= 1'h0;
    end else begin
      lsu_double_ecc_error_r_ff <= io_lsu_double_ecc_error_r;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      ld_sec_addr_lo_r_ff <= 16'h0;
    end else begin
      ld_sec_addr_lo_r_ff <= io_lsu_addr_r[15:0];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      ld_sec_addr_hi_r_ff <= 16'h0;
    end else begin
      ld_sec_addr_hi_r_ff <= io_end_addr_r;
    end
  end
  always @(posedge io_lsu_store_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_1225 <= 32'h0;
    end else begin
      _T_1225 <= _T_1219 | _T_1223;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1436 <= 32'h0;
    end else begin
      _T_1436 <= _T_1425 | _T_1429;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_1939 <= 1'h0;
    end else begin
      _T_1939 <= _T_889 & io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1940 <= 1'h0;
    end else begin
      _T_1940 <= io_lsu_dccm_rden_m;
    end
  end
endmodule
